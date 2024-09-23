void VCPMP4VRegister()
{
  unint64_t v0;
  char v1;
  char **v2;
  char *v3;

  v0 = atomic_load(&VCPMP4VRegister::registered);
  if (v0 != -1)
  {
    v3 = &v1;
    v2 = &v3;
    std::__call_once(&VCPMP4VRegister::registered, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<VCPMP4VRegister::$_0 &&>>);
  }
}

uint64_t NewMB(_QWORD *a1)
{
  void *v2;

  v2 = MEM_NewClear(24);
  *a1 = v2;
  if (v2)
  {
    *(_QWORD *)*a1 = MEM_New(256);
    if (*(_QWORD *)*a1)
      return 0;
    else
      return -108;
  }
  else
  {
    return -108;
  }
}

uint64_t DelMB(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (v2)
  {
    if (*v2)
    {
      MEM_Dispose(*v2);
      **a1 = 0;
      v2 = *a1;
    }
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t FillMB(uint64_t result, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t i;
  uint64_t j;

  for (i = 0; i != 16; ++i)
  {
    for (j = 0; j != 16; ++j)
      *(_BYTE *)(result + j) = a2[j];
    result += 16;
    a2 += a3;
  }
  return result;
}

unsigned __int8 *Reconstruct_8x8(unsigned __int8 *result, int a2, unsigned __int8 *a3, int a4, int16x4_t *a5, int a6, int a7, int a8, double a9, int32x4_t a10, int32x4_t a11, int a12, unsigned __int8 *a13)
{
  unsigned __int8 *v15;
  unsigned __int8 v16[64];
  uint64_t v17;

  v15 = result;
  v17 = *MEMORY[0x24BDAC8D0];
  if (a8)
  {
    Get_QuarterPel_MSFT(a3, a4, a6, a7, a12, a13, 8, v16);
    return (unsigned __int8 *)AddResidueTo_8x8((uint64_t)a5, v16, v15, a2, a13);
  }
  else if (a7 | a6)
  {
    if (a6 != 1 || a7)
    {
      if (a6 || a7 != 1)
      {
        if (a6 == 1 && a7 == 1)
          return (unsigned __int8 *)MC_2H_2V(result, a2, a3, a4, (const __int16 *)a5, 2 - a12, a13);
      }
      else
      {
        return (unsigned __int8 *)MC_1H_2V((uint64_t)result, a2, a3, a4, a5, 1 - a12, a13, a9, a10, a11);
      }
    }
    else
    {
      return (unsigned __int8 *)MC_2H_1V((uint64_t)result, a2, a3, a4, (const __int16 *)a5, 1 - a12, a13);
    }
  }
  else
  {
    return (unsigned __int8 *)MC_1H_1V((uint64_t)result, a2, a3, a4, (const __int16 *)a5, a13);
  }
  return result;
}

uint64_t MC_1H_1V(uint64_t result, int a2, const unsigned __int8 *a3, int a4, const __int16 *a5, const unsigned __int8 *a6)
{
  const unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned int v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;

  v6 = a3 + 3;
  v7 = (unsigned __int8 *)(result + 3);
  v8 = 9;
  do
  {
    v9 = a6[a5[1] + (unint64_t)*(v6 - 2)];
    v10 = a6[a5[2] + (unint64_t)*(v6 - 1)];
    v11 = a6[a5[3] + (unint64_t)*v6];
    *(v7 - 3) = a6[*a5 + (unint64_t)*(v6 - 3)];
    *(v7 - 2) = v9;
    *(v7 - 1) = v10;
    *v7 = v11;
    v12 = a6[a5[5] + (unint64_t)v6[2]];
    v13 = a6[a5[6] + (unint64_t)v6[3]];
    v14 = a6[a5[7] + (unint64_t)v6[4]];
    v7[1] = a6[a5[4] + (unint64_t)v6[1]];
    v7[2] = v12;
    --v8;
    v7[3] = v13;
    v7[4] = v14;
    v6 += a4;
    v7 += a2;
    a5 += 8;
  }
  while (v8 > 1);
  return result;
}

uint64_t MC_2H_1V(uint64_t result, int a2, const unsigned __int8 *a3, int a4, const __int16 *a5, int a6, const unsigned __int8 *a7)
{
  const unsigned __int8 *v7;
  _BYTE *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v7 = a3 + 4;
  v8 = (_BYTE *)(result + 3);
  v9 = 9;
  do
  {
    v10 = *(v7 - 3) + a6;
    v11 = *a5 + (uint64_t)((v10 + *(v7 - 4)) >> 1);
    v12 = *(v7 - 2);
    v13 = *(v7 - 1);
    LOBYTE(v10) = a7[a5[1] + (uint64_t)((v10 + v12) >> 1)];
    LOBYTE(v12) = a7[a5[2] + (uint64_t)((v12 + a6 + v13) >> 1)];
    LOBYTE(v13) = a7[a5[3] + (uint64_t)((v13 + a6 + *v7) >> 1)];
    *(v8 - 3) = a7[v11];
    *(v8 - 2) = v10;
    *(v8 - 1) = v12;
    *v8 = v13;
    v14 = v7[1] + a6;
    v15 = v7[2];
    v16 = v7[3];
    LOBYTE(v11) = a7[a5[4] + (uint64_t)((v14 + *v7) >> 1)];
    LOBYTE(v14) = a7[a5[5] + (uint64_t)((v14 + v15) >> 1)];
    LOBYTE(v15) = a7[a5[6] + (uint64_t)((v15 + a6 + v16) >> 1)];
    LOBYTE(v16) = a7[a5[7] + (uint64_t)((v16 + a6 + v7[4]) >> 1)];
    v8[1] = v11;
    v8[2] = v14;
    --v9;
    v8[3] = v15;
    v8[4] = v16;
    v7 += a4;
    v8 += a2;
    a5 += 8;
  }
  while (v9 > 1);
  return result;
}

uint64_t MC_1H_2V(uint64_t result, int a2, const unsigned __int8 *a3, int a4, int16x4_t *a5, unsigned int a6, const unsigned __int8 *a7, double a8, int32x4_t a9, int32x4_t a10)
{
  uint32x4_t v10;
  const unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned int v13;
  const unsigned __int8 *v14;
  int32x4_t v15;
  int32x4_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  unsigned __int8 v22;

  v10 = (uint32x4_t)vdupq_n_s32(a6);
  v11 = a3 + 4;
  v12 = (unsigned __int8 *)(result + 3);
  v13 = 9;
  do
  {
    v14 = &v11[a4];
    a9.i32[0] = *((_DWORD *)v11 - 1);
    a10.i32[0] = *((_DWORD *)v14 - 1);
    v15 = (int32x4_t)vaddw_u16(vaddw_u16(v10, (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a9.i8)), (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a10.i8));
    v16 = vsraq_n_s32(vmovl_s16(*a5), v15, 1uLL);
    v17 = a7[v16.i32[1]];
    v18 = a7[v16.i32[2]];
    v19 = a7[v16.i32[3]];
    *(v12 - 3) = a7[v16.i32[0]];
    *(v12 - 2) = v17;
    *(v12 - 1) = v18;
    *v12 = v19;
    v15.i32[0] = *(_DWORD *)v11;
    v16.i32[0] = *(_DWORD *)v14;
    a9 = (int32x4_t)vaddw_u16(vaddw_u16(v10, (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v15.i8)), (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v16.i8));
    a10 = vsraq_n_s32(vmovl_s16(a5[1]), a9, 1uLL);
    v20 = a7[a10.i32[1]];
    v21 = a7[a10.i32[2]];
    v22 = a7[a10.i32[3]];
    v12[1] = a7[a10.i32[0]];
    v12[2] = v20;
    --v13;
    v12[3] = v21;
    v12[4] = v22;
    v12 += a2;
    a5 += 2;
    v11 = v14;
  }
  while (v13 > 1);
  return result;
}

uint64_t MC_2H_2V(unsigned __int8 *a1, int a2, const unsigned __int8 *a3, int a4, const __int16 *a5, int a6, const unsigned __int8 *a7)
{
  uint64_t v7;
  const unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned int v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t result;
  unsigned __int8 v29;

  v7 = a2;
  v8 = a3 + 4;
  v9 = a1 + 3;
  v10 = 9;
  do
  {
    v11 = (unsigned __int8 *)&v8[a4];
    v12 = *(v11 - 3);
    v13 = *(v8 - 3) + a6;
    v14 = *a5 + (uint64_t)((v13 + *(v8 - 4) + *(v11 - 4) + v12) >> 2);
    v15 = *(v8 - 2);
    v16 = *(v11 - 2);
    v17 = a5[1] + (uint64_t)((v13 + v12 + v15 + v16) >> 2);
    v18 = *(v8 - 1);
    v19 = *(v11 - 1);
    LOBYTE(v17) = a7[v17];
    LOBYTE(v15) = a7[a5[2] + (uint64_t)((v15 + a6 + v16 + v18 + v19) >> 2)];
    LOBYTE(v18) = a7[a5[3] + (uint64_t)((v18 + a6 + v19 + *v8 + *v11) >> 2)];
    *(v9 - 3) = a7[v14];
    *(v9 - 2) = v17;
    *(v9 - 1) = v15;
    *v9 = v18;
    v20 = v11[1];
    LODWORD(v17) = v8[1] + a6;
    v21 = a5[4] + (uint64_t)((int)(v17 + *v8 + *v11 + v20) >> 2);
    v22 = v8[2];
    v23 = v11[2];
    v24 = a5[5] + (uint64_t)(((int)v17 + v20 + v22 + v23) >> 2);
    v25 = v8[3];
    v26 = v11[3];
    v27 = a5[6] + (uint64_t)((v22 + a6 + v23 + v25 + v26) >> 2);
    result = v11[4];
    LOBYTE(v24) = a7[v24];
    LOBYTE(v27) = a7[v27];
    v29 = a7[a5[7] + (uint64_t)((v25 + a6 + v26 + v8[4] + (int)result) >> 2)];
    v9[1] = a7[v21];
    v9[2] = v24;
    --v10;
    v9[3] = v27;
    v9[4] = v29;
    v9 += v7;
    a5 += 8;
    v8 = v11;
  }
  while (v10 > 1);
  return result;
}

uint64_t AddResidueTo_8x8(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4, const unsigned __int8 *a5)
{
  uint64_t v5;
  unsigned __int8 *v6;
  __int16 *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;

  v5 = 0;
  v6 = a3 + 3;
  do
  {
    v7 = (__int16 *)(result + 2 * v5);
    v8 = a5[v7[1] + (unint64_t)a2[v5 + 1]];
    v9 = a5[v7[2] + (unint64_t)a2[v5 + 2]];
    v10 = a5[v7[3] + (unint64_t)a2[v5 + 3]];
    *(v6 - 3) = a5[*v7 + (unint64_t)a2[v5]];
    *(v6 - 2) = v8;
    *(v6 - 1) = v9;
    *v6 = v10;
    v11 = a5[v7[4] + (unint64_t)a2[v5 + 4]];
    v12 = a5[v7[5] + (unint64_t)a2[v5 + 5]];
    v13 = a5[v7[6] + (unint64_t)a2[v5 + 6]];
    LOBYTE(v7) = a5[v7[7] + (unint64_t)a2[v5 + 7]];
    v6[1] = v11;
    v6[2] = v12;
    v6[3] = v13;
    v6[4] = v7;
    v5 += 8;
    v6 += a4;
  }
  while ((_DWORD)v5 != 64);
  return result;
}

uint64_t Reconstruct_16x16(unsigned __int8 *a1, int a2, unsigned __int8 *a3, int a4, __int16 *a5, int a6, int a7, int a8, int a9, unsigned __int8 *a10)
{
  unsigned __int8 v14[256];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a8)
    Get_QuarterPel_MSFT(a3, a4, a6, a7, a9, a10, 16, v14);
  else
    Get_HalfPel((uint64_t)a3, a4, a6, a7, a9, 16, v14);
  return AddResidueTo_16x16((uint64_t)a5, v14, a1, a2, a10);
}

uint64_t Get_HalfPel(uint64_t result, int a2, int a3, int a4, int a5, int a6, unsigned __int8 *a7)
{
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned __int8 *v29;
  int v30;
  unsigned __int8 *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  int v40;

  v7 = a2;
  v8 = a2 - (uint64_t)a6;
  v9 = (unsigned __int8 *)(result - v8);
  if (a4 | a3)
  {
    if (a3 != 1 || a4)
    {
      if (a3 || a4 != 1)
      {
        if (a3 == 1 && a4 == 1 && a6)
        {
          v27 = 2 - a5;
          v28 = a6;
          do
          {
            v29 = &v9[v8];
            if (a6 >= 4)
            {
              v30 = v29[v7];
              LODWORD(result) = *v29;
              v31 = &v9[2 * v7 - a6 + 4];
              v32 = a6 >> 2;
              do
              {
                v33 = v29[1];
                v34 = *(v31 - 3);
                *a7 = (result + v27 + v30 + v33 + v34) >> 2;
                v35 = v29[2];
                v36 = *(v31 - 2);
                a7[1] = (v27 + v33 + v34 + v35 + v36) >> 2;
                v37 = v29[3];
                v38 = *(v31 - 1);
                a7[2] = (v27 + v35 + v36 + v37 + v38) >> 2;
                v39 = v29[4];
                v29 += 4;
                result = v39;
                v40 = *v31;
                v31 += 4;
                v30 = v40;
                a7[3] = (v27 + v37 + v38 + result + v40) >> 2;
                a7 += 4;
                --v32;
              }
              while (v32);
            }
            v9 = v29;
            --v28;
          }
          while (v28);
        }
      }
      else if (a6)
      {
        v20 = 1 - a5;
        v21 = a6;
        do
        {
          v22 = &v9[v8];
          if (a6 >= 4)
          {
            v23 = &v9[2 * a2 - a6 + 3];
            v24 = a6 >> 2;
            do
            {
              *a7 = (v20 + *v22 + *(v23 - 3)) >> 1;
              a7[1] = (v20 + v22[1] + *(v23 - 2)) >> 1;
              a7[2] = (v20 + v22[2] + *(v23 - 1)) >> 1;
              v25 = v22[3];
              v26 = *v23;
              v23 += 4;
              v22 += 4;
              a7[3] = (v20 + v25 + v26) >> 1;
              a7 += 4;
              --v24;
            }
            while (v24);
          }
          v9 = v22;
          --v21;
        }
        while (v21);
      }
    }
    else if (a6)
    {
      v10 = 1 - a5;
      v11 = a6;
      do
      {
        v9 += v8;
        if (a6 >= 4)
        {
          v12 = *v9;
          v13 = a6 >> 2;
          do
          {
            v14 = v10 + v9[1];
            *a7 = (v14 + v12) >> 1;
            v15 = v9[2];
            a7[1] = (v14 + v15) >> 1;
            v16 = v10 + v9[3];
            a7[2] = (v16 + v15) >> 1;
            v17 = v9[4];
            v9 += 4;
            v12 = v17;
            a7[3] = (v16 + v17) >> 1;
            a7 += 4;
            --v13;
          }
          while (v13);
        }
        --v11;
      }
      while (v11);
    }
  }
  else if (a6)
  {
    v18 = a6;
    do
    {
      v9 += v8;
      if (a6 >= 8)
      {
        v19 = a6 >> 3;
        do
        {
          *(_QWORD *)a7 = *(_QWORD *)v9;
          *(_QWORD *)(a7 + 4) = *(_QWORD *)(v9 + 4);
          a7 += 8;
          v9 += 8;
          --v19;
        }
        while (v19);
      }
      --v18;
    }
    while (v18);
  }
  return result;
}

uint64_t AddResidueTo_16x16(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4, const unsigned __int8 *a5)
{
  uint64_t v5;
  unsigned __int8 *v6;
  __int16 *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;

  v5 = 0;
  v6 = a3 + 7;
  do
  {
    v7 = (__int16 *)(result + 2 * v5);
    v8 = a5[v7[1] + (unint64_t)a2[v5 + 1]];
    v9 = a5[v7[2] + (unint64_t)a2[v5 + 2]];
    v10 = a5[v7[3] + (unint64_t)a2[v5 + 3]];
    *(v6 - 7) = a5[*v7 + (unint64_t)a2[v5]];
    *(v6 - 6) = v8;
    *(v6 - 5) = v9;
    *(v6 - 4) = v10;
    v11 = a5[v7[5] + (unint64_t)a2[v5 + 5]];
    v12 = a5[v7[6] + (unint64_t)a2[v5 + 6]];
    v13 = a5[v7[7] + (unint64_t)a2[v5 + 7]];
    *(v6 - 3) = a5[v7[4] + (unint64_t)a2[v5 + 4]];
    *(v6 - 2) = v11;
    *(v6 - 1) = v12;
    *v6 = v13;
    v14 = a5[v7[9] + (unint64_t)a2[v5 + 9]];
    v15 = a5[v7[10] + (unint64_t)a2[v5 + 10]];
    v16 = a5[v7[11] + (unint64_t)a2[v5 + 11]];
    v6[1] = a5[v7[8] + (unint64_t)a2[v5 + 8]];
    v6[2] = v14;
    v6[3] = v15;
    v6[4] = v16;
    v17 = a5[v7[12] + (unint64_t)a2[v5 + 12]];
    v18 = a5[v7[13] + (unint64_t)a2[v5 + 13]];
    v19 = a5[v7[14] + (unint64_t)a2[v5 + 14]];
    LOBYTE(v7) = a5[v7[15] + (unint64_t)a2[v5 + 15]];
    v6[5] = v17;
    v6[6] = v18;
    v6[7] = v19;
    v6[8] = v7;
    v5 += 16;
    v6 += a4;
  }
  while ((_DWORD)v5 != 256);
  return result;
}

_BYTE *SetBlockToFrame(_BYTE *result, int a2, char *a3, int a4)
{
  int v4;
  int v5;
  char v6;

  if (a4)
  {
    v4 = a4;
    do
    {
      --v4;
      v5 = a4;
      do
      {
        v6 = *a3++;
        *result++ = v6;
        --v5;
      }
      while (v5);
      result += a2 - a4;
    }
    while (v4);
  }
  return result;
}

unsigned __int8 *GetBlockToFrame(unsigned __int8 *result, int a2, unsigned __int8 *a3, int a4)
{
  int v4;
  int v5;
  unsigned __int8 v6;

  if (a4)
  {
    v4 = a4;
    do
    {
      --v4;
      v5 = a4;
      do
      {
        v6 = *result++;
        *a3++ = v6;
        --v5;
      }
      while (v5);
      result += a2 - a4;
    }
    while (v4);
  }
  return result;
}

uint64_t GetResidue_8x8(__int16 *a1, unsigned __int8 *a2, unsigned __int8 *a3, int a4, unsigned __int8 *a5, int a6, int a7, int a8, char a9, int a10, unsigned __int8 *a11)
{
  unsigned __int8 *v14;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a2)
    v14 = a2;
  else
    v14 = (unsigned __int8 *)&v16;
  if (a9)
    Get_QuarterPel_MSFT(a3, a4, a7, a8, a10, a11, 8, v14);
  else
    Get_HalfPel((uint64_t)a3, a4, a7, a8, a10, 8, v14);
  return GetResidueFrom_8x8((uint64_t)a1, v14, a5, a6);
}

uint64_t GetResidueFrom_8x8(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  uint64_t v4;
  unsigned __int8 *v5;
  _WORD *v6;

  v4 = 0;
  v5 = a3 + 3;
  do
  {
    v6 = (_WORD *)(result + 2 * v4);
    *v6 = *(v5 - 3) - a2[v4];
    v6[1] = *(v5 - 2) - a2[v4 + 1];
    v6[2] = *(v5 - 1) - a2[v4 + 2];
    v6[3] = *v5 - a2[v4 + 3];
    v6[4] = v5[1] - a2[v4 + 4];
    v6[5] = v5[2] - a2[v4 + 5];
    v6[6] = v5[3] - a2[v4 + 6];
    v6[7] = v5[4] - a2[v4 + 7];
    v4 += 8;
    v5 += a4;
  }
  while ((_DWORD)v4 != 64);
  return result;
}

uint64_t GetResidue_16x16(__int16 *a1, unsigned __int8 *a2, unsigned __int8 *a3, int a4, unsigned __int8 *a5, int a6, int a7, int a8, char a9, int a10, unsigned __int8 *a11)
{
  unsigned __int8 *v14;
  uint64_t result;
  uint64_t v16;
  unsigned __int8 *v17;
  __int16 *v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a2)
    v14 = a2;
  else
    v14 = (unsigned __int8 *)&v19;
  if (a9)
    result = (uint64_t)Get_QuarterPel_MSFT(a3, a4, a7, a8, a10, a11, 16, v14);
  else
    result = Get_HalfPel((uint64_t)a3, a4, a7, a8, a10, 16, v14);
  v16 = 0;
  v17 = a5 + 7;
  do
  {
    v18 = &a1[v16];
    *v18 = *(v17 - 7) - v14[v16];
    v18[1] = *(v17 - 6) - v14[v16 + 1];
    v18[2] = *(v17 - 5) - v14[v16 + 2];
    v18[3] = *(v17 - 4) - v14[v16 + 3];
    v18[4] = *(v17 - 3) - v14[v16 + 4];
    v18[5] = *(v17 - 2) - v14[v16 + 5];
    v18[6] = *(v17 - 1) - v14[v16 + 6];
    v18[7] = *v17 - v14[v16 + 7];
    v18[8] = v17[1] - v14[v16 + 8];
    v18[9] = v17[2] - v14[v16 + 9];
    v18[10] = v17[3] - v14[v16 + 10];
    v18[11] = v17[4] - v14[v16 + 11];
    v18[12] = v17[5] - v14[v16 + 12];
    v18[13] = v17[6] - v14[v16 + 13];
    v18[14] = v17[7] - v14[v16 + 14];
    v18[15] = v17[8] - v14[v16 + 15];
    v16 += 16;
    v17 += a6;
  }
  while ((_DWORD)v16 != 256);
  return result;
}

uint64_t MC_8x8(unsigned __int8 *a1, int a2, unsigned __int8 *a3, int a4, int a5, int a6, int a7, unsigned __int8 *a8, unsigned __int8 *a9)
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;

  if (a3 < a8)
    return 4294958327;
  if (a9 && &a3[a5 + 7 + (a6 + 7) * a4] >= a9)
    return 4294958327;
  if (a6 | a5)
  {
    if (a5 != 1 || a6)
    {
      if (a5 || a6 != 1)
      {
        v18 = 0;
        v19 = &a3[a4];
        do
        {
          v20 = 0;
          ++v18;
          do
          {
            a1[v20] = (a3[v20 + 1] - a7 + a3[v20] + v19[v20] + v19[v20 + 1] + 2) >> 2;
            ++v20;
          }
          while (v20 != 8);
          a1 += a2;
          v19 += a4;
          a3 += a4;
        }
        while (v18 != 8);
      }
      else
      {
        v15 = 0;
        v16 = &a3[a4];
        do
        {
          v17 = 0;
          ++v15;
          do
          {
            a1[v17] = (v16[v17] - a7 + a3[v17] + 1) >> 1;
            ++v17;
          }
          while (v17 != 8);
          a1 += a2;
          v16 += a4;
          a3 += a4;
        }
        while (v15 != 8);
      }
    }
    else
    {
      for (i = 0; i != 8; ++i)
      {
        for (j = 0; j != 8; ++j)
          a1[j] = (a3[j + 1] - a7 + a3[j] + 1) >> 1;
        a1 += a2;
        a3 += a4;
      }
    }
  }
  else
  {
    for (k = 0; k != 8; ++k)
    {
      for (m = 0; m != 8; ++m)
        a1[m] = a3[m];
      a1 += a2;
      a3 += a4;
    }
  }
  return 0;
}

uint64_t AddResidue_8x8(uint64_t result, int a2, __int16 *a3, const unsigned __int8 *a4)
{
  uint64_t i;
  uint64_t j;

  for (i = 0; i != 8; ++i)
  {
    for (j = 0; j != 8; ++j)
      *(_BYTE *)(result + j) = a4[a3[j] + (unint64_t)*(unsigned __int8 *)(result + j)];
    a3 += 8;
    result += a2;
  }
  return result;
}

unsigned __int8 *Get_QuarterPel_MSFT(unsigned __int8 *result, int a2, int a3, int a4, int a5, const unsigned __int8 *a6, int a7, unsigned __int8 *a8)
{
  unsigned __int8 *v8;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  int v18;
  char *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  const unsigned __int8 *v25;
  int v26;
  uint64_t v27;
  unsigned __int8 *v28;
  int v29;
  int v30;
  uint64_t v31;
  unsigned __int8 *v32;
  unsigned __int8 *v33;
  int v34;
  int v35;
  int v36;
  unsigned __int8 *v37;
  unsigned __int8 *v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  unsigned __int8 *v46;
  unsigned __int8 *v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  unsigned __int8 *v53;
  unsigned __int8 *v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  unsigned __int8 *v60;
  unsigned __int8 *v61;
  unsigned __int8 *v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  unsigned __int8 *v69;
  unsigned __int8 *v70;
  int v71;
  unsigned __int8 *v72;
  int v73;
  int v74;
  _BYTE *v75;
  unsigned __int8 *v76;
  int v77;
  unsigned __int8 *v78;
  int v79;
  int v80;
  unsigned __int8 v81[289];
  unsigned __int8 v82;
  _BYTE v83[3];
  unsigned __int8 v84[294];
  uint64_t v85;

  v8 = a8;
  v85 = *MEMORY[0x24BDAC8D0];
  if (a4 | a3)
  {
    if (a3)
    {
      if (a7 != -1)
      {
        v14 = ~a7 + a2;
        v15 = &result[-v14];
        v16 = &v82;
        v17 = a7;
        do
        {
          v18 = v17;
          v19 = (char *)&v15[v14];
          if (a7 >= 8)
          {
            v20 = a7 >> 3;
            do
            {
              *(_QWORD *)v16 = *(_QWORD *)v19;
              *(_QWORD *)(v16 + 4) = *(_QWORD *)(v19 + 4);
              v16 += 8;
              v19 += 8;
              --v20;
            }
            while (v20);
          }
          v21 = *v19;
          v15 = (unsigned __int8 *)(v19 + 1);
          *v16++ = v21;
          v17 = v18 - 1;
        }
        while (v18);
      }
      if (a3 == 2)
      {
        if (a4)
        {
          v22 = v84;
          v23 = a7;
          v24 = a5;
          v25 = a6;
          v26 = 1;
        }
        else
        {
          v22 = a8;
          v23 = a7;
          v24 = a5;
          v25 = a6;
          v26 = 0;
        }
        result = Get_HalfPel_Left(&v82, v22, v23, v24, v25, v26);
      }
      else
      {
        result = Get_HalfPel_Left(&v82, v81, a7, a5, a6, 1);
        if (a3 == 3)
        {
          if (a4)
          {
            if (a7 != -1)
            {
              v60 = v84;
              v61 = v81;
              v62 = &v82;
              v63 = a7;
              do
              {
                v64 = v63;
                ++v62;
                if (a7)
                {
                  v65 = a7;
                  do
                  {
                    v67 = *v62++;
                    v66 = v67;
                    v68 = *v61++;
                    *v60++ = (v68 - a5 + v66 + 1) >> 1;
                    --v65;
                  }
                  while (v65);
                }
                v63 = v64 - 1;
              }
              while (v64);
            }
          }
          else if (a7)
          {
            v75 = v83;
            v76 = v81;
            v77 = a7;
            v78 = v8;
            do
            {
              ++v75;
              v79 = a7;
              do
              {
                v80 = *v76++;
                *v78++ = (v80 - a5 + *(v75++ - 1) + 1) >> 1;
                --v79;
              }
              while (v79);
              --v77;
            }
            while (v77);
          }
        }
        else if (a3 == 1)
        {
          if (a4)
          {
            if (a7 != -1)
            {
              v37 = v84;
              v38 = v81;
              v39 = &v82;
              v40 = a7;
              do
              {
                v41 = v40;
                if (a7)
                {
                  v42 = a7;
                  do
                  {
                    v44 = *v39++;
                    v43 = v44;
                    v45 = *v38++;
                    *v37++ = (v45 - a5 + v43 + 1) >> 1;
                    --v42;
                  }
                  while (v42);
                }
                ++v39;
                v40 = v41 - 1;
              }
              while (v41);
            }
          }
          else if (a7)
          {
            v69 = v81;
            v70 = &v82;
            v71 = a7;
            v72 = v8;
            do
            {
              ++v70;
              v73 = a7;
              do
              {
                v74 = *v69++;
                *v72++ = (v74 - a5 + *(v70++ - 1) + 1) >> 1;
                --v73;
              }
              while (v73);
              --v71;
            }
            while (v71);
          }
        }
      }
    }
    else if (a7 != -1)
    {
      v31 = a2 - (uint64_t)a7;
      v32 = &result[-v31];
      v33 = v84;
      v34 = a7;
      do
      {
        v35 = v34;
        v32 += v31;
        if (a7 >= 8)
        {
          v36 = a7 >> 3;
          do
          {
            *(_QWORD *)v33 = *(_QWORD *)v32;
            *(_QWORD *)(v33 + 4) = *(_QWORD *)(v32 + 4);
            v33 += 8;
            v32 += 8;
            --v36;
          }
          while (v36);
        }
        v34 = v35 - 1;
      }
      while (v35);
    }
    switch(a4)
    {
      case 1:
        result = (unsigned __int8 *)Get_HalfPel_Bottom((uint64_t)v84, &v82, a7, a5, a6, 0);
        if (a7)
        {
          v46 = &v82;
          v47 = v84;
          v48 = a7;
          do
          {
            v49 = a7;
            do
            {
              v51 = *v47++;
              v50 = v51;
              v52 = *v46++;
              *v8++ = (v52 - a5 + v50 + 1) >> 1;
              --v49;
            }
            while (v49);
            --v48;
          }
          while (v48);
        }
        break;
      case 3:
        result = (unsigned __int8 *)Get_HalfPel_Bottom((uint64_t)v84, &v82, a7, a5, a6, 0);
        if (a7)
        {
          v53 = &v84[a7];
          v54 = &v82;
          v55 = a7;
          do
          {
            v56 = a7;
            do
            {
              v58 = *v53++;
              v57 = v58;
              v59 = *v54++;
              *v8++ = (v59 - a5 + v57 + 1) >> 1;
              --v56;
            }
            while (v56);
            --v55;
          }
          while (v55);
        }
        break;
      case 2:
        return (unsigned __int8 *)Get_HalfPel_Bottom((uint64_t)v84, v8, a7, a5, a6, 0);
    }
  }
  else if (a7)
  {
    v27 = a2 - (uint64_t)a7;
    v28 = &result[-v27];
    v29 = a7;
    do
    {
      v28 += v27;
      if (a7 >= 8)
      {
        v30 = a7 >> 3;
        do
        {
          *(_QWORD *)v8 = *(_QWORD *)v28;
          *(_QWORD *)(v8 + 4) = *(_QWORD *)(v28 + 4);
          v8 += 8;
          v28 += 8;
          --v30;
        }
        while (v30);
      }
      --v29;
    }
    while (v29);
  }
  return result;
}

uint64_t Blinear_8th(uint64_t result, int a2, int a3, int a4, int a5, int a6, unsigned __int8 *a7)
{
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  unsigned __int8 *v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unsigned __int8 *v44;
  unsigned __int8 *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  unsigned __int8 *v50;
  unsigned __int8 *v51;
  int v52;
  int v53;
  int v54;
  int v55;
  unsigned __int8 *v56;
  int v57;
  unsigned __int8 *v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  unsigned int v66;
  int v67;
  int v68;
  unsigned __int8 *v69;
  int v70;
  unsigned __int8 *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  int v80;
  int v81;
  unsigned __int8 *v82;
  int v83;
  unsigned __int8 *v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  unsigned int v92;
  int v93;
  int v94;
  unsigned __int8 *v95;
  int v96;
  unsigned __int8 *v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  unsigned int v104;
  int v105;
  unsigned __int8 *v106;
  int v107;
  unsigned __int8 *v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  unsigned int v116;
  int v117;
  int v118;
  unsigned __int8 *v119;
  int v120;
  unsigned __int8 *v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  unsigned int v129;
  int v130;
  int v131;
  unsigned __int8 *v132;
  int v133;
  unsigned __int8 *v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  unsigned int v143;
  int v144;
  unsigned __int8 *v145;
  int v146;
  unsigned __int8 *v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  unsigned int v156;
  int v157;
  unsigned __int8 *v158;
  int v159;
  unsigned __int8 *v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  unsigned int v169;

  v7 = a2;
  v8 = a2 - (uint64_t)a6;
  v9 = (unsigned __int8 *)(result - v8);
  v10 = 1 - a5;
  v11 = 2 - a5;
  v12 = 4 - a5;
  v13 = 8 - a5;
  switch(a4)
  {
    case 0:
      if (!a3)
      {
        if (!a6)
          return result;
        v14 = a6;
        do
        {
          v9 += v8;
          if (a6 >= 8)
          {
            v15 = a6 >> 3;
            do
            {
              *(_QWORD *)a7 = *(_QWORD *)v9;
              *(_QWORD *)(a7 + 4) = *(_QWORD *)(v9 + 4);
              a7 += 8;
              v9 += 8;
              --v15;
            }
            while (v15);
          }
          --v14;
        }
        while (v14);
      }
      if (a3 == 4)
      {
        if (!a6)
          return result;
        v16 = a6;
        do
        {
          v9 += v8;
          if (a6 >= 4)
          {
            v17 = *v9;
            v18 = a6 >> 2;
            do
            {
              v19 = v10 + v9[1];
              *a7 = (v19 + v17) >> 1;
              v20 = v9[2];
              a7[1] = (v19 + v20) >> 1;
              v21 = v10 + v9[3];
              a7[2] = (v21 + v20) >> 1;
              v22 = v9[4];
              v9 += 4;
              v17 = v22;
              a7[3] = (v21 + v22) >> 1;
              a7 += 4;
              --v18;
            }
            while (v18);
          }
          --v16;
        }
        while (v16);
      }
      if (a3 == 2)
      {
        if (!a6)
          return result;
        v23 = a6;
        do
        {
          v9 += v8;
          if (a6 >= 4)
          {
            v24 = *v9;
            v25 = a6 >> 2;
            do
            {
              v26 = v10 + v9[1];
              *a7 = (v26 + v24) >> 1;
              v27 = v9[2];
              a7[1] = (v26 + v27) >> 1;
              v28 = v10 + v9[3];
              a7[2] = (v28 + v27) >> 1;
              v29 = v9[4];
              v9 += 4;
              v24 = v29;
              a7[3] = (v28 + v29) >> 1;
              a7 += 4;
              --v25;
            }
            while (v25);
          }
          --v23;
        }
        while (v23);
      }
      if (a3 == 6 && a6)
      {
        v30 = a6;
        do
        {
          v9 += v8;
          if (a6 >= 4)
          {
            v31 = *v9;
            v32 = a6 >> 2;
            do
            {
              v33 = v9[1];
              *a7 = (3 * v31 + v11 + v33) >> 2;
              v34 = v9[2];
              a7[1] = (3 * v33 + v11 + v34) >> 2;
              v35 = v9[3];
              a7[2] = (3 * v34 + v11 + v35) >> 2;
              v36 = v9[4];
              v9 += 4;
              v31 = v36;
              a7[3] = (3 * v35 + v11 + v36) >> 2;
              a7 += 4;
              --v32;
            }
            while (v32);
          }
          --v30;
        }
        while (v30);
      }
      break;
    case 2:
      switch(a3)
      {
        case 0:
          if (a6)
          {
            v37 = a6;
            do
            {
              v38 = &v9[v8];
              if (a6 >= 4)
              {
                v39 = &v9[2 * a2 - a6 + 3];
                v40 = a6 >> 2;
                do
                {
                  *a7 = (v11 + *(v39 - 3) + 3 * *v38) >> 2;
                  a7[1] = (v11 + *(v39 - 2) + 3 * v38[1]) >> 2;
                  a7[2] = (v11 + *(v39 - 1) + 3 * v38[2]) >> 2;
                  v41 = v38[3];
                  v42 = *v39;
                  v39 += 4;
                  v38 += 4;
                  a7[3] = (v11 + v42 + 3 * v41) >> 2;
                  a7 += 4;
                  --v40;
                }
                while (v40);
              }
              v9 = v38;
              --v37;
            }
            while (v37);
          }
          break;
        case 2:
          if (a6)
          {
            v55 = a6;
            do
            {
              v56 = &v9[v8];
              if (a6 >= 4)
              {
                v57 = v56[v7];
                LODWORD(result) = *v56;
                v58 = &v9[2 * v7 - a6 + 4];
                v59 = a6 >> 2;
                do
                {
                  v60 = v56[1];
                  v61 = *(v58 - 3);
                  *a7 = (9 * result + v13 + v61 + 3 * (v57 + v60)) >> 4;
                  v62 = v56[2];
                  v63 = *(v58 - 2);
                  a7[1] = (9 * v60 + v13 + v63 + 3 * (v62 + v61)) >> 4;
                  v64 = v56[3];
                  v65 = *(v58 - 1);
                  a7[2] = (9 * v62 + v13 + v65 + 3 * (v64 + v63)) >> 4;
                  v66 = v56[4];
                  v56 += 4;
                  result = v66;
                  v67 = *v58;
                  v58 += 4;
                  v57 = v67;
                  a7[3] = (9 * v64 + v13 + v67 + 3 * (result + v65)) >> 4;
                  a7 += 4;
                  --v59;
                }
                while (v59);
              }
              v9 = v56;
              --v55;
            }
            while (v55);
          }
          break;
        case 4:
          if (a6)
          {
            v68 = a6;
            do
            {
              v69 = &v9[v8];
              if (a6 >= 4)
              {
                v70 = v69[v7];
                LODWORD(result) = *v69;
                v71 = &v9[2 * v7 - a6 + 4];
                v72 = a6 >> 2;
                do
                {
                  v73 = v69[1];
                  v74 = v12 + *(v71 - 3);
                  *a7 = (v74 + v70 + 3 * (result + v73)) >> 3;
                  v75 = v69[2];
                  v76 = *(v71 - 2);
                  a7[1] = (v74 + v76 + 3 * (v75 + v73)) >> 3;
                  v77 = v69[3];
                  v78 = v12 + *(v71 - 1);
                  a7[2] = (v78 + v76 + 3 * (v77 + v75)) >> 3;
                  v79 = v69[4];
                  v69 += 4;
                  result = v79;
                  v80 = *v71;
                  v71 += 4;
                  v70 = v80;
                  a7[3] = (v78 + v80 + 3 * (result + v77)) >> 3;
                  a7 += 4;
                  --v72;
                }
                while (v72);
              }
              v9 = v69;
              --v68;
            }
            while (v68);
          }
          break;
        case 6:
          if (a6)
          {
            v81 = a6;
            do
            {
              v82 = &v9[v8];
              if (a6 >= 4)
              {
                v83 = v82[v7];
                LODWORD(result) = *v82;
                v84 = &v9[2 * v7 - a6 + 4];
                v85 = a6 >> 2;
                do
                {
                  v86 = v82[1];
                  v87 = *(v84 - 3);
                  *a7 = (v83 + v13 + 9 * v86 + 3 * (result + v87)) >> 4;
                  v88 = v82[2];
                  v89 = *(v84 - 2);
                  a7[1] = (v13 + v87 + 9 * v88 + 3 * (v89 + v86)) >> 4;
                  v90 = v82[3];
                  v91 = *(v84 - 1);
                  a7[2] = (v13 + v89 + 9 * v90 + 3 * (v91 + v88)) >> 4;
                  v92 = v82[4];
                  v82 += 4;
                  result = v92;
                  v93 = *v84;
                  v84 += 4;
                  v83 = v93;
                  a7[3] = (v13 + v91 + 9 * result + 3 * (v93 + v90)) >> 4;
                  a7 += 4;
                  --v85;
                }
                while (v85);
              }
              v9 = v82;
              --v81;
            }
            while (v81);
          }
          break;
        default:
          return result;
      }
      break;
    case 4:
      switch(a3)
      {
        case 0:
          if (a6)
          {
            v43 = a6;
            do
            {
              v44 = &v9[v8];
              if (a6 >= 4)
              {
                v45 = &v9[2 * a2 - a6 + 3];
                v46 = a6 >> 2;
                do
                {
                  *a7 = (v10 + *v44 + *(v45 - 3)) >> 1;
                  a7[1] = (v10 + v44[1] + *(v45 - 2)) >> 1;
                  a7[2] = (v10 + v44[2] + *(v45 - 1)) >> 1;
                  v47 = v44[3];
                  v48 = *v45;
                  v45 += 4;
                  v44 += 4;
                  a7[3] = (v10 + v47 + v48) >> 1;
                  a7 += 4;
                  --v46;
                }
                while (v46);
              }
              v9 = v44;
              --v43;
            }
            while (v43);
          }
          break;
        case 2:
          if (a6)
          {
            v94 = a6;
            do
            {
              v95 = &v9[v8];
              if (a6 >= 4)
              {
                LODWORD(result) = v95[v7];
                v96 = *v95;
                v97 = &v9[2 * v7 - a6 + 4];
                v98 = a6 >> 2;
                do
                {
                  v99 = 3 * (result + v96);
                  v100 = *(v97 - 3) + v95[1];
                  *a7 = (v100 + v12 + v99) >> 3;
                  v101 = *(v97 - 2) + v95[2];
                  a7[1] = (v101 + v12 + 3 * v100) >> 3;
                  v102 = *(v97 - 1) + v95[3];
                  a7[2] = (v102 + v12 + 3 * v101) >> 3;
                  v103 = v95[4];
                  v95 += 4;
                  v96 = v103;
                  v104 = *v97;
                  v97 += 4;
                  result = v104;
                  a7[3] = (v12 + v96 + v104 + 3 * v102) >> 3;
                  a7 += 4;
                  --v98;
                }
                while (v98);
              }
              v9 = v95;
              --v94;
            }
            while (v94);
          }
          break;
        case 4:
          if (a6)
          {
            v105 = a6;
            do
            {
              v106 = &v9[v8];
              if (a6 >= 4)
              {
                v107 = v106[v7];
                LODWORD(result) = *v106;
                v108 = &v9[2 * v7 - a6 + 4];
                v109 = a6 >> 2;
                do
                {
                  v110 = v106[1];
                  v111 = *(v108 - 3);
                  *a7 = (result + v11 + v107 + v110 + v111) >> 2;
                  v112 = v106[2];
                  v113 = *(v108 - 2);
                  a7[1] = (v11 + v110 + v111 + v112 + v113) >> 2;
                  v114 = v106[3];
                  v115 = *(v108 - 1);
                  a7[2] = (v11 + v112 + v113 + v114 + v115) >> 2;
                  v116 = v106[4];
                  v106 += 4;
                  result = v116;
                  v117 = *v108;
                  v108 += 4;
                  v107 = v117;
                  a7[3] = (v11 + v114 + v115 + result + v117) >> 2;
                  a7 += 4;
                  --v109;
                }
                while (v109);
              }
              v9 = v106;
              --v105;
            }
            while (v105);
          }
          break;
        case 6:
          if (a6)
          {
            v118 = a6;
            do
            {
              v119 = &v9[v8];
              if (a6 >= 4)
              {
                v120 = v119[v7];
                LODWORD(result) = *v119;
                v121 = &v9[2 * v7 - a6 + 4];
                v122 = a6 >> 2;
                do
                {
                  v123 = v119[1];
                  v124 = *(v121 - 3);
                  *a7 = (result + v12 + v120 + 3 * (v124 + v123)) >> 3;
                  v125 = v119[2];
                  v126 = *(v121 - 2);
                  a7[1] = (v12 + v123 + v124 + 3 * (v126 + v125)) >> 3;
                  v127 = v119[3];
                  v128 = *(v121 - 1);
                  a7[2] = (v12 + v125 + v126 + 3 * (v128 + v127)) >> 3;
                  v129 = v119[4];
                  v119 += 4;
                  result = v129;
                  v130 = *v121;
                  v121 += 4;
                  v120 = v130;
                  a7[3] = (v12 + v127 + v128 + 3 * (v130 + result)) >> 3;
                  a7 += 4;
                  --v122;
                }
                while (v122);
              }
              v9 = v119;
              --v118;
            }
            while (v118);
          }
          break;
        default:
          return result;
      }
      break;
    case 6:
      switch(a3)
      {
        case 0:
          if (a6)
          {
            v49 = a6;
            do
            {
              v50 = &v9[v8];
              if (a6 >= 4)
              {
                v51 = &v9[2 * a2 - a6 + 3];
                v52 = a6 >> 2;
                do
                {
                  *a7 = (v11 + *v50 + 3 * *(v51 - 3)) >> 2;
                  a7[1] = (v11 + v50[1] + 3 * *(v51 - 2)) >> 2;
                  a7[2] = (v11 + v50[2] + 3 * *(v51 - 1)) >> 2;
                  v53 = v50[3];
                  v54 = *v51;
                  v51 += 4;
                  v50 += 4;
                  a7[3] = (v11 + v53 + 3 * v54) >> 2;
                  a7 += 4;
                  --v52;
                }
                while (v52);
              }
              v9 = v50;
              --v49;
            }
            while (v49);
          }
          break;
        case 2:
          if (a6)
          {
            v131 = a6;
            do
            {
              v132 = &v9[v8];
              if (a6 >= 4)
              {
                LODWORD(result) = v132[v7];
                v133 = *v132;
                v134 = &v9[2 * v7 - a6 + 4];
                v135 = a6 >> 2;
                do
                {
                  v136 = v132[1];
                  v137 = *(v134 - 3);
                  *a7 = (9 * result + v13 + v136 + 3 * (v133 + v137)) >> 4;
                  v138 = v132[2];
                  v139 = *(v134 - 2);
                  a7[1] = (9 * v137 + v13 + v138 + 3 * (v139 + v136)) >> 4;
                  v140 = v132[3];
                  v141 = *(v134 - 1);
                  a7[2] = (9 * v139 + v13 + v140 + 3 * (v141 + v138)) >> 4;
                  v142 = v132[4];
                  v132 += 4;
                  v133 = v142;
                  v143 = *v134;
                  v134 += 4;
                  result = v143;
                  a7[3] = (9 * v141 + v13 + v133 + 3 * (v143 + v140)) >> 4;
                  a7 += 4;
                  --v135;
                }
                while (v135);
              }
              v9 = v132;
              --v131;
            }
            while (v131);
          }
          break;
        case 4:
          if (a6)
          {
            v144 = a6;
            do
            {
              v145 = &v9[v8];
              if (a6 >= 4)
              {
                LODWORD(result) = v145[v7];
                v146 = *v145;
                v147 = &v9[2 * v7 - a6 + 4];
                v148 = a6 >> 2;
                do
                {
                  v149 = v145[1];
                  v150 = 3 * *(v147 - 3);
                  *a7 = (v146 + v12 + 3 * result + v149 + v150) >> 3;
                  v151 = v145[2];
                  v152 = 3 * *(v147 - 2);
                  a7[1] = (v12 + v149 + v151 + v150 + v152) >> 3;
                  v153 = v145[3];
                  v154 = 3 * *(v147 - 1);
                  a7[2] = (v12 + v151 + v153 + v152 + v154) >> 3;
                  v155 = v145[4];
                  v145 += 4;
                  v146 = v155;
                  v156 = *v147;
                  v147 += 4;
                  result = v156;
                  a7[3] = (v12 + v153 + v146 + v154 + 3 * v156) >> 3;
                  a7 += 4;
                  --v148;
                }
                while (v148);
              }
              v9 = v145;
              --v144;
            }
            while (v144);
          }
          break;
        case 6:
          if (a6)
          {
            v157 = a6;
            do
            {
              v158 = &v9[v8];
              if (a6 >= 4)
              {
                LODWORD(result) = v158[v7];
                v159 = *v158;
                v160 = &v9[2 * v7 - a6 + 4];
                v161 = a6 >> 2;
                do
                {
                  v162 = v158[1];
                  v163 = *(v160 - 3);
                  *a7 = (v159 + v13 + 9 * v163 + 3 * (result + v162)) >> 4;
                  v164 = v158[2];
                  v165 = *(v160 - 2);
                  a7[1] = (v13 + v162 + 9 * v165 + 3 * (v164 + v163)) >> 4;
                  v166 = v158[3];
                  v167 = *(v160 - 1);
                  a7[2] = (v13 + v164 + 9 * v167 + 3 * (v166 + v165)) >> 4;
                  v168 = v158[4];
                  v158 += 4;
                  v159 = v168;
                  v169 = *v160;
                  v160 += 4;
                  result = v169;
                  a7[3] = (v13 + v166 + 9 * v169 + 3 * (v159 + v167)) >> 4;
                  a7 += 4;
                  --v161;
                }
                while (v161);
              }
              v9 = v158;
              --v157;
            }
            while (v157);
          }
          break;
        default:
          return result;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Get8x8From16x16(uint64_t result, int a2, __int16 *a3)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  int v6;

  v3 = result + 2 * dword_219C4A570[a2];
  v4 = 7;
  do
  {
    v5 = 0;
    v6 = v4;
    do
    {
      a3[v5 / 2] = *(_WORD *)(v3 + v5);
      v5 += 2;
    }
    while ((_DWORD)v5 != 16);
    v3 += v5 + 16;
    --v4;
    a3 = (__int16 *)((char *)a3 + v5);
  }
  while (v6);
  return result;
}

uint64_t Feed8x8To16x16(uint64_t result, int a2, __int16 *a3)
{
  __int16 *v3;
  int v4;
  unint64_t v5;
  int v6;

  v3 = &a3[dword_219C4A570[a2]];
  v4 = 7;
  do
  {
    v5 = 0;
    v6 = v4;
    do
    {
      v3[v5 / 2] = *(_WORD *)(result + v5);
      v5 += 2;
    }
    while ((_DWORD)v5 != 16);
    v3 = (__int16 *)((char *)v3 + v5 + 16);
    --v4;
    result += v5;
  }
  while (v6);
  return result;
}

void InterpolateFrame(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, int a4, int a5, unsigned int a6, unsigned int a7, int a8, uint64_t a9)
{
  int v9;
  int v10;
  uint64_t v11;
  size_t v12;
  int v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  unsigned __int8 *v26;
  int v27;
  unsigned __int8 v28;
  uint16x4_t v29;
  int8x16_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int v33;
  char *v34;
  size_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  uint64_t v38;
  uint64_t i;
  _BYTE *v40;
  char *v41;
  size_t v42;
  unsigned __int8 *v43;
  unsigned __int8 *v44;
  int v45;
  int v46;
  unsigned __int8 *v47;
  int v48;
  const unsigned __int8 *v49;
  int v50;
  uint64_t v51;
  unsigned __int8 *v52;
  __int32 *v53;
  __int32 *v54;
  unsigned __int8 *v55;
  size_t v56;
  int v57;
  int v58;
  uint64_t v59;
  unsigned __int8 *v60;
  unsigned __int8 *v61;
  _BYTE *v62;
  unsigned __int8 *v63;
  unsigned __int8 *v64;
  _BYTE *v65;
  size_t v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  __int32 *v71;
  _BYTE *v72;
  __int32 *v73;
  _BYTE *v74;
  size_t v75;
  int v76;
  int v77;
  uint64_t v78;
  unsigned __int8 *v79;
  __int32 *v80;
  __int32 *v81;
  unsigned __int8 *v82;
  size_t v83;
  int v84;
  int v85;
  uint64_t v86;
  unsigned __int8 *v87;
  unsigned __int8 *v88;
  _BYTE *v89;
  unsigned __int8 *v90;
  unsigned __int8 *v91;
  _BYTE *v92;
  size_t v93;
  int v94;
  int v95;
  int v96;
  _BYTE *v97;
  _BYTE *v98;
  uint64_t v99;
  unsigned __int8 *v100;
  unsigned __int8 *v101;
  int v102;
  int v103;
  unsigned __int8 *v104;
  unsigned __int8 *v105;
  unsigned __int8 *v106;
  size_t v107;
  unsigned __int8 *v108;
  unsigned __int8 v109;
  unsigned __int8 v110;
  int v111;
  unsigned __int8 *v112;
  _BYTE *v113;
  size_t v114;
  uint64_t v115;
  unsigned __int8 *v116;
  unsigned __int8 *v117;
  uint64_t v118;
  unsigned __int8 *v119;
  unsigned __int8 *v120;
  uint64_t v121;
  int v122;
  unsigned __int8 *v123;
  unsigned __int8 *v124;
  int v125;
  int v126;
  int v127;
  BOOL v128;
  int v129;
  int v130;
  int v131;
  uint64_t v132;
  unsigned __int8 *v133;
  unsigned __int8 *v134;
  unsigned __int8 *v135;
  unsigned __int8 *v136;
  unsigned __int8 *v137;
  unsigned __int8 *v138;
  size_t v139;
  int v140;
  int v141;
  int v142;
  uint64_t v143;
  unsigned __int8 *v144;
  unsigned __int8 *v145;
  uint64_t v146;
  unsigned __int8 *v147;
  unsigned __int8 *v148;
  uint64_t v149;
  int v150;
  unsigned __int8 *v151;
  unsigned __int8 *v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  uint64_t v159;
  unsigned __int8 *v160;
  unsigned __int8 *v161;
  uint64_t v162;
  unsigned __int8 *v163;
  unsigned __int8 *v164;
  uint64_t v165;
  int v166;
  unsigned __int8 *v167;
  unsigned __int8 *v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  uint64_t v175;
  unsigned __int8 *v176;
  unsigned __int8 *v177;
  unsigned __int8 *v178;
  unsigned __int8 *v179;
  unsigned __int8 *v180;
  unsigned __int8 *v181;
  size_t v182;
  int v183;
  int v184;
  int v185;
  int v186;
  unsigned __int8 *v187;
  size_t v188;
  unsigned __int8 *v189;
  unsigned __int8 *v190;
  int v191;
  unsigned __int8 *v192;
  unsigned __int8 *v193;
  unsigned __int8 *v194;
  int v195;
  int v196;
  int v197;
  unsigned __int8 *v198;
  unsigned __int8 *v199;
  int v200;
  unsigned __int8 *v201;
  int v202;
  int v203;
  unsigned __int8 *v204;
  unsigned __int8 *v205;
  unsigned __int8 *v206;
  int v207;
  int v208;
  int v209;
  unsigned __int8 *v210;
  unsigned __int8 *v211;
  int v212;
  _BYTE *v213;
  int v214;
  int v215;
  unsigned __int8 *v216;
  unsigned __int8 *v217;
  unsigned __int8 *v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  unsigned __int8 *v224;
  unsigned __int8 *v225;
  unsigned __int8 *v226;
  unsigned __int8 *v227;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  unsigned __int8 *v233;
  unsigned __int8 *v234;
  int v235;
  unsigned __int8 *v236;
  int v237;
  int v238;
  int v239;
  int v240;
  unsigned __int8 *v241;
  unsigned __int8 *v242;
  unsigned __int8 *v243;
  unsigned __int8 *v244;
  unsigned __int8 *v245;
  int v246;
  uint64_t v247;
  unsigned __int8 *v248;
  unsigned __int8 *v249;
  unsigned __int8 *v250;
  int v251;
  unsigned __int8 *v252;
  unsigned __int8 *v253;
  uint64_t v254;
  unsigned __int8 *v255;
  unsigned __int8 *v256;
  unsigned __int8 *v257;
  unsigned __int8 *v258;
  int v259;
  _BYTE *v260;
  uint64_t v261;
  unsigned __int8 *v262;
  unsigned __int8 *v263;
  unsigned __int8 *v264;
  int v265;
  _BYTE *v266;
  unsigned __int8 *v267;
  uint64_t v268;
  _BYTE *v269;
  unsigned __int8 *v270;
  unsigned __int8 *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  int v278;
  int v279;
  int v280;
  uint64_t v282;
  uint64_t v286;
  size_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v292;
  unint64_t v293;
  uint64_t v294;
  unsigned __int8 v295[256];
  unsigned __int8 v296[289];
  unsigned __int8 v297[16];
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  char v315;
  unsigned __int8 v316[69];
  _BYTE v317[460];
  unsigned __int8 v318[529];
  _BYTE v319[68];
  _BYTE v320[3];
  char v321;
  _BYTE v322[19];
  _BYTE v323[23];
  _BYTE v324[438];

  v293 = __PAIR64__(a6, a7);
  *(_QWORD *)&v324[414] = *MEMORY[0x24BDAC8D0];
  if (a5 / a8 >= 1)
  {
    v9 = a8;
    v10 = a4;
    v11 = 0;
    v12 = a8;
    v13 = ~a8 + a4;
    v272 = a4;
    v290 = a4 / a8;
    v274 = a5 / a8;
    v275 = -(uint64_t)v13;
    v288 = a8;
    v14 = (a8 + 1);
    v279 = a8 + 3;
    v277 = v13;
    v280 = a8 >> 3;
    v270 = &v297[a8];
    v269 = &v319[(a8 + 1)];
    v271 = &v318[(a8 + 1)];
    v292 = a4 - (uint64_t)a8;
    v273 = a8 - (uint64_t)a4;
    v286 = (a8 - 1) + 1;
    v278 = a8 + 4;
    v15 = a9 - 1;
    v287 = v14;
    do
    {
      v276 = v11;
      if ((int)v290 >= 1)
      {
        v16 = 0;
        v289 = v11 * v272;
        while (1)
        {
          v17 = (v16 + v289) * v288;
          v294 = v16;
          v18 = &a1[v17];
          switch(v15)
          {
            case 0:
              v19 = HIDWORD(v293);
              if (SHIDWORD(v293) >= 1)
                v19 = 1;
              v20 = v293;
              if ((int)v293 >= 1)
                v20 = 1;
              v293 = __PAIR64__(v19, v20);
              Get_HalfPel((uint64_t)&a1[v17], v10, v19, v20, 0, v9, v295);
              goto LABEL_22;
            case 1:
              Blinear_8th((uint64_t)&a1[v17], v10, 2 * HIDWORD(v293), 2 * v293, 0, v9, v295);
              goto LABEL_22;
            case 2:
              if (v293)
              {
                v21 = v286;
                if (v9 != -1)
                {
                  v22 = &v18[v275];
                  v23 = v318;
                  v24 = v9;
                  do
                  {
                    v25 = v24;
                    v26 = &v22[v277];
                    if (v9 >= 8)
                    {
                      v27 = v280;
                      do
                      {
                        *(_QWORD *)v23 = *(_QWORD *)v26;
                        *(_QWORD *)(v23 + 4) = *(_QWORD *)(v26 + 4);
                        v23 += 8;
                        v26 += 8;
                        --v27;
                      }
                      while (v27);
                    }
                    v28 = *v26;
                    v22 = v26 + 1;
                    *v23++ = v28;
                    v24 = v25 - 1;
                  }
                  while (v25);
                }
                switch(v293)
                {
                  case 0x200000000uLL:
                    Get_HalfPel_Left(v318, v295, v9, 0, a3, 0);
                    break;
                  case 2uLL:
                    v47 = v318;
                    v48 = v9;
                    v49 = a3;
                    v50 = 1;
LABEL_46:
                    Get_HalfPel_Bottom((uint64_t)v47, v295, v48, 0, v49, v50);
                    break;
                  case 1uLL:
                    Get_HalfPel_Bottom((uint64_t)v318, v316, v9, 0, a3, 1);
                    if (v9)
                    {
                      v192 = v295;
                      v193 = v316;
                      v194 = v318;
                      v195 = v9;
                      do
                      {
                        ++v194;
                        v196 = v9;
                        do
                        {
                          v197 = *v193++;
                          *v192++ = (*(v194++ - 1) + v197 + 1) >> 1;
                          --v196;
                        }
                        while (v196);
                        --v195;
                      }
                      while (v195);
                    }
                    break;
                  case 3uLL:
                    Get_HalfPel_Bottom((uint64_t)v318, v316, v9, 0, a3, 1);
                    if (v9)
                    {
                      v198 = v295;
                      v199 = v316;
                      v200 = v9;
                      v201 = v271;
                      do
                      {
                        ++v201;
                        v202 = v9;
                        do
                        {
                          v203 = *v199++;
                          *v198++ = (*(v201++ - 1) + v203 + 1) >> 1;
                          --v202;
                        }
                        while (v202);
                        --v200;
                      }
                      while (v200);
                    }
                    break;
                  case 0x100000000uLL:
                    Get_HalfPel_Left(v318, v316, v9, 0, a3, 0);
                    if (v9)
                    {
                      v204 = v295;
                      v205 = v316;
                      v206 = v318;
                      v207 = v9;
                      do
                      {
                        ++v206;
                        v208 = v9;
                        do
                        {
                          v209 = *v205++;
                          *v204++ = (*(v206++ - 1) + v209 + 1) >> 1;
                          --v208;
                        }
                        while (v208);
                        --v207;
                      }
                      while (v207);
                    }
                    break;
                  case 0x300000000uLL:
                    Get_HalfPel_Left(v318, v316, v9, 0, a3, 0);
                    if (v9)
                    {
                      v210 = v295;
                      v211 = v316;
                      v212 = v9;
                      v213 = v319;
                      do
                      {
                        ++v213;
                        v214 = v9;
                        do
                        {
                          v215 = *v211++;
                          *v210++ = (*(v213++ - 1) + v215 + 1) >> 1;
                          --v214;
                        }
                        while (v214);
                        --v212;
                      }
                      while (v212);
                    }
                    break;
                  default:
                    switch((_DWORD)v293)
                    {
                      case 2:
                        Get_HalfPel_Left(v318, v316, v9, 0, a3, 1);
                        v47 = v316;
                        if (HIDWORD(v293) == 2)
                        {
                          v48 = v9;
                          v49 = a3;
                          v50 = 0;
                          goto LABEL_46;
                        }
                        Get_HalfPel_Bottom((uint64_t)v316, v297, v9, 0, a3, 0);
                        if ((HIDWORD(v293) | 2) == 3)
                        {
                          if (HIDWORD(v293) == 1)
                            v224 = v318;
                          else
                            v224 = v319;
                          Get_HalfPel_Bottom((uint64_t)v224, v296, v9, 0, a3, 1);
                        }
                        if (v9)
                        {
                          v225 = v295;
                          v226 = v297;
                          v227 = v296;
                          v228 = v9;
                          do
                          {
                            v229 = v9;
                            do
                            {
                              v231 = *v227++;
                              v230 = v231;
                              v232 = *v226++;
                              *v225++ = (v230 + v232 + 1) >> 1;
                              --v229;
                            }
                            while (v229);
                            --v228;
                          }
                          while (v228);
                        }
                        break;
                      case 1:
                        Get_HalfPel_Left(v318, v297, v9, 0, a3, 1);
                        Get_HalfPel_Bottom((uint64_t)v297, v296, v9, 0, a3, 0);
                        switch(HIDWORD(v293))
                        {
                          case 2:
                            if (v9)
                            {
                              v216 = v295;
                              v217 = v296;
                              v218 = v297;
                              v219 = v9;
                              do
                              {
                                v220 = v9;
                                do
                                {
                                  v222 = *v218++;
                                  v221 = v222;
                                  v223 = *v217++;
                                  *v216++ = (v221 + v223 + 1) >> 1;
                                  --v220;
                                }
                                while (v220);
                                --v219;
                              }
                              while (v219);
                            }
                            break;
                          case 1:
                            Get_HalfPel_Bottom((uint64_t)v318, v316, v9, 0, a3, 1);
                            if (v9)
                            {
                              v241 = v316;
                              v242 = v295;
                              v243 = v296;
                              v244 = v297;
                              v245 = v318;
                              v246 = v9;
                              do
                              {
                                v247 = 0;
                                do
                                {
                                  v242[v247] = (v245[v247] + v244[v247] + v243[v247] + v241[v247] + 2) >> 2;
                                  ++v247;
                                }
                                while ((_DWORD)v12 != (_DWORD)v247);
                                v245 += v247 + 1;
                                v244 += v247;
                                v243 += v247;
                                v242 += v247;
                                v241 += v247;
                                --v246;
                              }
                              while (v246);
                            }
                            break;
                          case 3:
                            Get_HalfPel_Bottom((uint64_t)v319, v316, v9, 0, a3, 1);
                            if (v9)
                            {
                              v255 = v316;
                              v256 = v295;
                              v257 = v296;
                              v258 = v297;
                              v259 = v9;
                              v260 = v319;
                              do
                              {
                                v261 = 0;
                                do
                                {
                                  v256[v261] = (v260[v261]
                                              + v258[v261]
                                              + v257[v261]
                                              + v255[v261]
                                              + 2) >> 2;
                                  ++v261;
                                }
                                while ((_DWORD)v12 != (_DWORD)v261);
                                v260 += v261 + 1;
                                v258 += v261;
                                v257 += v261;
                                v256 += v261;
                                v255 += v261;
                                --v259;
                              }
                              while (v259);
                            }
                            break;
                        }
                        break;
                      case 3:
                        Get_HalfPel_Left(v318, v297, v9, 0, a3, 1);
                        Get_HalfPel_Bottom((uint64_t)v297, v296, v9, 0, a3, 0);
                        switch(HIDWORD(v293))
                        {
                          case 2:
                            if (v9)
                            {
                              v233 = v295;
                              v234 = v296;
                              v235 = v9;
                              v236 = v270;
                              do
                              {
                                v237 = v9;
                                do
                                {
                                  v239 = *v236++;
                                  v238 = v239;
                                  v240 = *v234++;
                                  *v233++ = (v238 + v240 + 1) >> 1;
                                  --v237;
                                }
                                while (v237);
                                --v235;
                              }
                              while (v235);
                            }
                            break;
                          case 1:
                            Get_HalfPel_Bottom((uint64_t)v318, v316, v9, 0, a3, 1);
                            if (v9)
                            {
                              v248 = v296;
                              v249 = v295;
                              v250 = v316;
                              v251 = v9;
                              v252 = v271;
                              v253 = v270;
                              do
                              {
                                v254 = 0;
                                do
                                {
                                  v249[v254] = (v252[v254] + v253[v254] + v250[v254] + v248[v254] + 2) >> 2;
                                  ++v254;
                                }
                                while ((_DWORD)v12 != (_DWORD)v254);
                                v252 += v254 + 1;
                                v253 += v254;
                                v250 += v254;
                                v249 += v254;
                                v248 += v254;
                                --v251;
                              }
                              while (v251);
                            }
                            break;
                          case 3:
                            Get_HalfPel_Bottom((uint64_t)v319, v316, v9, 0, a3, 1);
                            if (v9)
                            {
                              v262 = v316;
                              v263 = v295;
                              v264 = v296;
                              v265 = v9;
                              v266 = v269;
                              v267 = v270;
                              do
                              {
                                v268 = 0;
                                do
                                {
                                  v263[v268] = (v266[v268]
                                              + v267[v268]
                                              + v264[v268]
                                              + v262[v268]
                                              + 2) >> 2;
                                  ++v268;
                                }
                                while ((_DWORD)v12 != (_DWORD)v268);
                                v266 += v268 + 1;
                                v267 += v268;
                                v264 += v268;
                                v263 += v268;
                                v262 += v268;
                                --v265;
                              }
                              while (v265);
                            }
                            break;
                        }
                        break;
                    }
                    break;
                }
              }
              else
              {
                v21 = v286;
                if (v9)
                {
                  v43 = &v18[v273];
                  v44 = v295;
                  v45 = v9;
                  do
                  {
                    v43 += v292;
                    if (v9 >= 8)
                    {
                      v46 = v280;
                      do
                      {
                        *(_QWORD *)v44 = *(_QWORD *)v43;
                        *(_QWORD *)(v44 + 4) = *(_QWORD *)(v43 + 4);
                        v44 += 8;
                        v43 += 8;
                        --v46;
                      }
                      while (v46);
                    }
                    --v45;
                  }
                  while (v45);
                }
              }
LABEL_151:
              if (v9)
              {
                v189 = &a2[v17];
                v190 = v295;
                v191 = v9;
                do
                {
                  memcpy(v189, v190, v12);
                  v190 += v21;
                  v189 += v21 + v292;
                  --v191;
                }
                while (v191);
              }
              v16 = v294 + 1;
              v10 = a4;
              v15 = a9 - 1;
              v14 = v287;
              if (v294 + 1 == v290)
                goto LABEL_242;
              break;
            case 3:
              Get_QuarterPel_MSFT(&a1[v17], v10, SHIDWORD(v293), v293, 0, a3, v9, v295);
              goto LABEL_22;
            case 4:
              bzero(v318, 0x211uLL);
              bzero(v316, 0x211uLL);
              v30.i64[0] = 0xFF000000FFLL;
              v30.i64[1] = 0xFF000000FFLL;
              v31 = (int32x4_t)xmmword_219C4A560;
              v315 = 0;
              v32.i32[1] = 0;
              v313 = 0u;
              v314 = 0u;
              v311 = 0u;
              v312 = 0u;
              v309 = 0u;
              v310 = 0u;
              v307 = 0u;
              v308 = 0u;
              v305 = 0u;
              v306 = 0u;
              v303 = 0u;
              v304 = 0u;
              v301 = 0u;
              v302 = 0u;
              v299 = 0u;
              v300 = 0u;
              *(_OWORD *)v297 = 0u;
              v298 = 0u;
              v282 = v17;
              if ((v9 & 0x80000000) == 0)
              {
                v33 = 0;
                v34 = &v321;
                v35 = v14;
                do
                {
                  memcpy(v34, &v18[v33], v14);
                  v34 += 23;
                  v33 += a4;
                  --v35;
                }
                while (v35);
                v36 = 0;
                v37 = v318;
                v9 = a8;
                v31 = (int32x4_t)xmmword_219C4A560;
                v30.i64[0] = 0xFF000000FFLL;
                v30.i64[1] = 0xFF000000FFLL;
                do
                {
                  v38 = 69;
                  for (i = 74; i != 71; --i)
                  {
                    v37[v38] = v37[i];
                    v318[23 * v36 + 4 + (int)v12 + (int)v38++] = v318[23 * v36 - 2 + (int)v12 + (int)i];
                  }
                  ++v36;
                  v37 += 23;
                }
                while (v36 != v14);
              }
              switch(HIDWORD(v293))
              {
                case 0:
                  if ((v9 & 0x80000000) == 0)
                  {
                    v41 = &v321;
                    v40 = v317;
                    v42 = v14;
                    do
                    {
                      if (v9)
                        memcpy(v40, v41, v12);
                      v40 += 23;
                      v41 += 23;
                      --v42;
                    }
                    while (v42);
                    goto LABEL_89;
                  }
                  break;
                case 1:
                  if ((v9 & 0x80000000) == 0)
                  {
                    v51 = 0;
                    v52 = v297;
                    v53 = (__int32 *)v322;
                    do
                    {
                      if (v9)
                      {
                        v54 = v53;
                        v55 = v52;
                        v56 = v12;
                        do
                        {
                          v32.i32[0] = *(v54 - 1);
                          v29.i32[0] = *v54;
                          v29 = (uint16x4_t)vmovl_u8((uint8x8_t)v29).u64[0];
                          v32 = vmulq_s32((int32x4_t)vaddw_u16((uint32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vrev64_s16((int16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v32.i8))), v30), v29), v31);
                          v32.i32[0] = vaddvq_s32(v32);
                          v57 = v32.i32[0] + 383;
                          if (v32.i32[0] >= -128)
                            v57 = v32.i32[0] + 128;
                          v58 = v57 >> 8;
                          if (v58 >= 255)
                            v58 = 255;
                          *v55++ = v58 & ~(v58 >> 31);
                          v54 = (__int32 *)((char *)v54 + 1);
                          --v56;
                        }
                        while (v56);
                      }
                      ++v51;
                      v52 += 17;
                      v53 = (__int32 *)((char *)v53 + 23);
                    }
                    while (v51 != v14);
                    v59 = 0;
                    v60 = v297;
                    v61 = (unsigned __int8 *)&v321;
                    v62 = v317;
                    do
                    {
                      if (v9)
                      {
                        v63 = v61;
                        v64 = v60;
                        v65 = v62;
                        v66 = v12;
                        do
                        {
                          v68 = *v63++;
                          v67 = v68;
                          v69 = *v64++;
                          *v65++ = (v67 + v69 + 1) >> 1;
                          --v66;
                        }
                        while (v66);
                      }
                      ++v59;
                      v62 += 23;
                      v60 += 17;
                      v61 += 23;
                    }
                    while (v59 != v14);
                    goto LABEL_89;
                  }
                  break;
                case 2:
                  if ((v9 & 0x80000000) == 0)
                  {
                    v70 = 0;
                    v71 = (__int32 *)v322;
                    v72 = v317;
                    do
                    {
                      if (v9)
                      {
                        v73 = v71;
                        v74 = v72;
                        v75 = v12;
                        do
                        {
                          v32.i32[0] = *(v73 - 1);
                          v29.i32[0] = *v73;
                          v29 = (uint16x4_t)vmovl_u8((uint8x8_t)v29).u64[0];
                          v32 = vmulq_s32((int32x4_t)vaddw_u16((uint32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vrev64_s16((int16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v32.i8))), v30), v29), v31);
                          v32.i32[0] = vaddvq_s32(v32);
                          v76 = v32.i32[0] + 383;
                          if (v32.i32[0] >= -128)
                            v76 = v32.i32[0] + 128;
                          v77 = v76 >> 8;
                          if (v77 >= 255)
                            v77 = 255;
                          *v74++ = v77 & ~(v77 >> 31);
                          v73 = (__int32 *)((char *)v73 + 1);
                          --v75;
                        }
                        while (v75);
                      }
                      ++v70;
                      v72 += 23;
                      v71 = (__int32 *)((char *)v71 + 23);
                    }
                    while (v70 != v14);
                    goto LABEL_89;
                  }
                  break;
                case 3:
                  if ((v9 & 0x80000000) == 0)
                  {
                    v78 = 0;
                    v79 = v297;
                    v80 = (__int32 *)v322;
                    do
                    {
                      if (v9)
                      {
                        v81 = v80;
                        v82 = v79;
                        v83 = v12;
                        do
                        {
                          v32.i32[0] = *(v81 - 1);
                          v29.i32[0] = *v81;
                          v29 = (uint16x4_t)vmovl_u8((uint8x8_t)v29).u64[0];
                          v32 = vmulq_s32((int32x4_t)vaddw_u16((uint32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vrev64_s16((int16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v32.i8))), v30), v29), v31);
                          v32.i32[0] = vaddvq_s32(v32);
                          v84 = v32.i32[0] + 383;
                          if (v32.i32[0] >= -128)
                            v84 = v32.i32[0] + 128;
                          v85 = v84 >> 8;
                          if (v85 >= 255)
                            v85 = 255;
                          *v82++ = v85 & ~(v85 >> 31);
                          v81 = (__int32 *)((char *)v81 + 1);
                          --v83;
                        }
                        while (v83);
                      }
                      ++v78;
                      v79 += 17;
                      v80 = (__int32 *)((char *)v80 + 23);
                    }
                    while (v78 != v14);
                    v86 = 0;
                    v87 = v297;
                    v88 = v322;
                    v89 = v317;
                    do
                    {
                      if (v9)
                      {
                        v90 = v88;
                        v91 = v87;
                        v92 = v89;
                        v93 = v12;
                        do
                        {
                          v95 = *v90++;
                          v94 = v95;
                          v96 = *v91++;
                          *v92++ = (v94 + v96 + 1) >> 1;
                          --v93;
                        }
                        while (v93);
                      }
                      ++v86;
                      v89 += 23;
                      v87 += 17;
                      v88 += 23;
                    }
                    while (v86 != v14);
                    goto LABEL_89;
                  }
                  break;
                default:
LABEL_89:
                  if ((v9 & 0x80000000) == 0)
                  {
                    v97 = v317;
                    v98 = v320;
                    do
                    {
                      if (v9)
                        memcpy(v98, v97, v12);
                      v98 += 23;
                      v97 += 23;
                      --v14;
                    }
                    while (v14);
                  }
                  break;
              }
              v99 = 0;
              v100 = v318;
              v101 = v324;
              v103 = v278;
              v102 = v279;
              v21 = v286;
              do
              {
                if (v9 >= 1)
                {
                  v104 = &v318[23 * v103];
                  v105 = v101;
                  v106 = v100;
                  v107 = v12;
                  v108 = &v318[23 * v102];
                  do
                  {
                    v109 = *v105++;
                    *v106++ = v109;
                    v110 = *v108++;
                    *v104++ = v110;
                    --v107;
                  }
                  while (v107);
                }
                ++v99;
                ++v103;
                --v102;
                v100 += 23;
                v101 -= 23;
              }
              while (v99 != 3);
              switch((int)v293)
              {
                case 0:
                  v111 = a8;
                  if (a8 >= 1)
                  {
                    v112 = v316;
                    v113 = v320;
                    v114 = v12;
                    do
                    {
                      memcpy(v112, v113, v12);
                      v112 += 23;
                      v113 += 23;
                      --v114;
                    }
                    while (v114);
                    goto LABEL_147;
                  }
                  break;
                case 1:
                  v111 = a8;
                  if (a8 >= 1)
                  {
                    v115 = 0;
                    v116 = v323;
                    v117 = v320;
                    do
                    {
                      v118 = 0;
                      v119 = v116;
                      v120 = v117;
                      do
                      {
                        v121 = 0;
                        v122 = 0;
                        v123 = v119;
                        v124 = v120;
                        do
                        {
                          v126 = *v124;
                          v124 -= 23;
                          v125 = v126;
                          v127 = *v123;
                          v123 += 23;
                          v122 += (v127 + v125) * *(_DWORD *)((char *)&xmmword_219C4A560 + v121);
                          v121 += 4;
                        }
                        while (v121 != 16);
                        v129 = v122 + 128;
                        v128 = v122 < -128;
                        v130 = v122 + 383;
                        if (!v128)
                          v130 = v129;
                        v131 = v130 >> 8;
                        if (v131 >= 255)
                          v131 = 255;
                        v297[17 * v115 + v118++] = v131 & ~(v131 >> 31);
                        ++v120;
                        ++v119;
                      }
                      while (v118 != v12);
                      ++v115;
                      v117 += 23;
                      v116 += 23;
                    }
                    while (v115 != v12);
                    v132 = 0;
                    v133 = v316;
                    v134 = v297;
                    v135 = v320;
                    do
                    {
                      v136 = v135;
                      v137 = v134;
                      v138 = v133;
                      v139 = v12;
                      do
                      {
                        v141 = *v136++;
                        v140 = v141;
                        v142 = *v137++;
                        *v138++ = (v140 + v142 + 1) >> 1;
                        --v139;
                      }
                      while (v139);
                      ++v132;
                      v133 += 23;
                      v134 += 17;
                      v135 += 23;
                    }
                    while (v132 != v12);
                    goto LABEL_147;
                  }
                  break;
                case 2:
                  v111 = a8;
                  if (a8 >= 1)
                  {
                    v143 = 0;
                    v144 = v323;
                    v145 = v320;
                    do
                    {
                      v146 = 0;
                      v147 = v144;
                      v148 = v145;
                      do
                      {
                        v149 = 0;
                        v150 = 0;
                        v151 = v147;
                        v152 = v148;
                        do
                        {
                          v154 = *v152;
                          v152 -= 23;
                          v153 = v154;
                          v155 = *v151;
                          v151 += 23;
                          v150 += (v155 + v153) * *(_DWORD *)((char *)&xmmword_219C4A560 + v149);
                          v149 += 4;
                        }
                        while (v149 != 16);
                        v156 = v150 + 128;
                        v128 = v150 < -128;
                        v157 = v150 + 383;
                        if (!v128)
                          v157 = v156;
                        v158 = v157 >> 8;
                        if (v158 >= 255)
                          v158 = 255;
                        v316[23 * v143 + v146++] = v158 & ~(v158 >> 31);
                        ++v148;
                        ++v147;
                      }
                      while (v146 != v12);
                      ++v143;
                      v145 += 23;
                      v144 += 23;
                    }
                    while (v143 != v12);
                    goto LABEL_147;
                  }
                  break;
                case 3:
                  v111 = a8;
                  if (a8 >= 1)
                  {
                    v159 = 0;
                    v160 = v323;
                    v161 = v320;
                    do
                    {
                      v162 = 0;
                      v163 = v160;
                      v164 = v161;
                      do
                      {
                        v165 = 0;
                        v166 = 0;
                        v167 = v163;
                        v168 = v164;
                        do
                        {
                          v170 = *v168;
                          v168 -= 23;
                          v169 = v170;
                          v171 = *v167;
                          v167 += 23;
                          v166 += (v171 + v169) * *(_DWORD *)((char *)&xmmword_219C4A560 + v165);
                          v165 += 4;
                        }
                        while (v165 != 16);
                        v172 = v166 + 128;
                        v128 = v166 < -128;
                        v173 = v166 + 383;
                        if (!v128)
                          v173 = v172;
                        v174 = v173 >> 8;
                        if (v174 >= 255)
                          v174 = 255;
                        v297[17 * v159 + v162++] = v174 & ~(v174 >> 31);
                        ++v164;
                        ++v163;
                      }
                      while (v162 != v12);
                      ++v159;
                      v161 += 23;
                      v160 += 23;
                    }
                    while (v159 != v12);
                    v175 = 0;
                    v176 = v316;
                    v177 = v297;
                    v178 = v323;
                    do
                    {
                      v179 = v178;
                      v180 = v177;
                      v181 = v176;
                      v182 = v12;
                      do
                      {
                        v184 = *v179++;
                        v183 = v184;
                        v185 = *v180++;
                        *v181++ = (v183 + v185 + 1) >> 1;
                        --v182;
                      }
                      while (v182);
                      ++v175;
                      v176 += 23;
                      v177 += 17;
                      v178 += 23;
                    }
                    while (v175 != v12);
                    goto LABEL_147;
                  }
                  break;
                default:
LABEL_147:
                  v111 = a8;
                  if (a8 >= 1)
                  {
                    v186 = 0;
                    v187 = v316;
                    v188 = v12;
                    do
                    {
                      memcpy(&v295[v186], v187, v12);
                      v186 += a8;
                      v187 += 23;
                      --v188;
                    }
                    while (v188);
                  }
                  break;
              }
              v9 = v111;
              v17 = v282;
              goto LABEL_151;
            default:
LABEL_22:
              v21 = v286;
              goto LABEL_151;
          }
        }
      }
LABEL_242:
      v11 = v276 + 1;
    }
    while (v276 + 1 != v274);
  }
}

uint64_t InterpolateWarpedPix(uint64_t result, int a2, int a3, int a4, int a5, int a6, int a7, int *a8, int *a9, unsigned __int8 *a10)
{
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  BOOL v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  int v32;
  uint64_t v33;
  unsigned __int8 *v34;

  if (a4)
  {
    v12 = dword_219C4A544[a7];
    v13 = a2 - 1;
    v14 = a3 - 1;
    v15 = a2;
    v16 = (1 << (2 * a7 - 1)) - a5;
    v17 = a4;
    do
    {
      --v17;
      v18 = a4;
      do
      {
        v20 = *a8++;
        v19 = v20;
        v22 = *a9++;
        v21 = v22;
        v23 = v19 >> a7;
        v24 = v22 >> a7;
        v25 = v19 & v12;
        if (v23 >= v13)
          v26 = v13;
        else
          v26 = v23;
        if (v23 >= v13)
          v25 = 0;
        v27 = v23 >= 0;
        if (v23 >= 0)
          v28 = v26;
        else
          v28 = 0;
        if (!v27)
          v25 = 0;
        v29 = v21 & v12;
        if (v24 >= v14)
          v30 = v14;
        else
          v30 = v24;
        if (v24 >= v14)
          v29 = 0;
        v31 = v24 >= 0;
        if (v24 >= 0)
          v32 = v30;
        else
          v32 = 0;
        v33 = result + (int)v15 * (uint64_t)v32;
        if (!v31)
          v29 = 0;
        v34 = (unsigned __int8 *)(v33 + v28);
        *a10++ = (v16
                + ((a6 - v25) * *v34 + v25 * v34[1]) * (a6 - v29)
                + ((a6 - v25) * v34[v15] + v25 * v34[v15 + 1]) * v29) >> (2 * a7);
        --v18;
      }
      while (v18);
    }
    while (v17);
  }
  return result;
}

double SetGMCWarpingParams(int a1, int a2, int *a3, int *a4, int a5, int a6, double *a7)
{
  double result;
  int v8;
  unsigned int v9;
  BOOL v10;
  int v11;
  int v12;

  result = 0.0;
  if (a2 >= 2)
  {
    v8 = 0;
    v9 = a2;
    do
    {
      ++v8;
      v10 = v9 > 3;
      v9 >>= 1;
    }
    while (v10);
    result = (double)v8;
  }
  a7[1] = result;
  switch(a1)
  {
    case 0:
      result = (double)a2;
      *a7 = (double)a2;
      break;
    case 1:
      *a7 = (double)a2;
      v11 = *a4 * a2;
      result = (double)(*a3 * a2 / 2);
      a7[2] = result;
      a7[3] = (double)(v11 / 2);
      break;
    case 2:
      v12 = 2;
      goto LABEL_9;
    case 3:
      v12 = 3;
LABEL_9:
      result = GetAffineWarpingParams(v12, a2, a3, a4, a5, a6, a7);
      break;
    case 4:
      result = GetPerspectiveWarpingParams(a2, a3, a4, a5, a6, a7);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GetPowerOf2(int a1)
{
  uint64_t v1;
  BOOL v2;

  if (a1 < 2)
    return 0;
  LODWORD(v1) = 0;
  do
  {
    v1 = (v1 + 1);
    v2 = a1 > 3;
    a1 = a1 >> 1;
  }
  while (v2);
  return v1;
}

double GetTranslationWarpingParams(int a1, int *a2, int *a3, double *a4)
{
  int v4;
  double result;

  *a4 = (double)a1;
  v4 = *a3 * a1;
  result = (double)(*a2 * a1 / 2);
  a4[2] = result;
  a4[3] = (double)(v4 / 2);
  return result;
}

double GetAffineWarpingParams(int a1, int a2, int *a3, int *a4, int a5, int a6, double *a7)
{
  double result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int i;
  int v17;
  int j;
  int v19;
  int v20;
  unsigned int v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  signed int v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  result = (double)a2;
  v8 = (double)*a3;
  *a7 = (double)a2;
  v9 = (double)*a4;
  v10 = (double)a2 * v8 * 0.5;
  v11 = (double)a2 * v9 * 0.5;
  a7[2] = v10;
  a7[3] = v11;
  if (a1 != 1)
  {
    v12 = (double)a5;
    v13 = (v8 + (double)a5 * 2.0 + (double)a3[1]) * result * 0.5;
    v14 = (v9 + (double)a4[1]) * result * 0.5;
    a7[4] = v13;
    a7[5] = v14;
    if (a5 < 2)
    {
      v15 = 0;
      i = 1;
    }
    else
    {
      v15 = 0;
      for (i = 1; i < a5; i *= 2)
        ++v15;
    }
    if (a6 < 2)
    {
      v17 = 0;
      j = 1;
    }
    else
    {
      v17 = 0;
      for (j = 1; j < a6; j *= 2)
        ++v17;
    }
    v19 = 16 / a2;
    if (16 / a2 < 2)
    {
      v20 = 0;
    }
    else
    {
      v20 = 0;
      v21 = 16 / a2;
      do
      {
        ++v20;
        v22 = v21 > 3;
        v21 >>= 1;
      }
      while (v22);
    }
    v23 = (double)i;
    v24 = (double)j;
    v25 = (double)v19;
    a7[13] = (double)(v20 + v15);
    a7[14] = (double)(v20 + v15 + 2);
    v26 = (double)(a5 - i);
    v27 = v10 * (double)v19;
    v28 = ((v12 * -16.0 + (double)v19 * v13) * (double)i + v26 * v27) / v12;
    v29 = v28 >= 0.0 ? 0.5 : -0.5;
    a7[17] = v24;
    a7[18] = v23;
    a7[10] = v25;
    a7[11] = (double)(2 << (v20 + v15 - 2));
    v30 = v11 * v25;
    v31 = (v14 * v25 * v23 + v26 * v30) / v12;
    v32 = v31 >= 0.0 ? 0.5 : -0.5;
    a7[6] = (double)(int)(v28 + v29) + v23 * 16.0;
    a7[7] = (double)(int)(v31 + v32);
    if (a1 != 2)
    {
      v33 = (double)a6;
      v34 = (v8 + (double)a3[2]) * result * 0.5;
      v35 = (v9 + (double)a6 * 2.0 + (double)a4[2]) * result * 0.5;
      if (v15 == v17)
      {
        v36 = 1;
      }
      else if (v15 <= v17)
      {
        v36 = 2u >> (v17 + ~(_BYTE)v15);
      }
      else
      {
        v36 = 2 << (v15 + ~(_BYTE)v17);
      }
      v37 = a6 - j;
      v38 = (v34 * v25 * v24 + (double)v37 * v27) / v33;
      if (v38 >= 0.0)
        v39 = 0.5;
      else
        v39 = -0.5;
      v40 = (double)(int)(v38 + v39);
      a7[12] = (double)v36;
      v41 = ((v33 * -16.0 + v25 * v35) * v24 + (double)v37 * v30) / v33;
      if (v41 >= 0.0)
        v42 = 0.5;
      else
        v42 = -0.5;
      result = (double)(int)(v41 + v42) + v24 * 16.0;
      a7[8] = v40;
      a7[9] = result;
    }
  }
  return result;
}

double GetPerspectiveWarpingParams(int a1, int *a2, int *a3, int a4, int a5, double *a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double result;

  v6 = (double)*a2;
  v7 = (double)a1 * v6 * 0.5;
  v8 = (double)*a3;
  v9 = (double)a1 * v8 * 0.5;
  v10 = v6 + (double)a4 * 2.0;
  v11 = (v10 + (double)a2[1]) * (double)a1 * 0.5;
  v12 = (v8 + (double)a3[1]) * (double)a1 * 0.5;
  v13 = (double)a2[2];
  v14 = (v6 + v13) * (double)a1 * 0.5;
  v15 = v8 + (double)a5 * 2.0 + (double)a3[2];
  v16 = v15 * (double)a1 * 0.5;
  v17 = (v10 + v13 + (double)a2[3]) * (double)a1 * 0.5;
  v18 = (v15 + (double)a3[3]) * (double)a1 * 0.5;
  v19 = v7 - v11 - v14 + v17;
  v20 = v16 - v18;
  v21 = v14 - v17;
  v22 = v9 - v12 - v16 + v18;
  v23 = (v19 * (v16 - v18) - (v14 - v17) * v22) * (double)a5;
  v24 = v11 - v17;
  v25 = v12 - v18;
  v26 = (v24 * v22 - v19 * v25) * (double)a4;
  v27 = v24 * v20 - v21 * v25;
  *a6 = (double)a1;
  a6[2] = v11 * v23 + (v11 - v7) * v27 * (double)a5;
  a6[3] = v14 * v26 + (v14 - v7) * v27 * (double)a4;
  a6[4] = v7 * v27 * (double)a4 * (double)a5;
  a6[5] = v12 * v23 + (v12 - v9) * v27 * (double)a5;
  a6[6] = v16 * v26 + (v16 - v9) * v27 * (double)a4;
  a6[7] = v9 * v27 * (double)a4 * (double)a5;
  a6[8] = v23;
  a6[9] = v26;
  result = v27 * (double)a4 * (double)a5;
  a6[10] = v27;
  a6[11] = result;
  return result;
}

uint64_t GetMVGMC(uint64_t result, int a2, int a3, int a4, char a5, int *a6, int *a7, int a8, int *a9, int *a10)
{
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  char v18;
  int v19;
  char v20;

  if (a3 < 1)
  {
    v12 = 0;
    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 4 * (a3 - 1) + 4;
    v14 = result;
    do
    {
      v15 = 0;
      result = ((v10 + a2) << a5);
      do
      {
        v12 = v12 - ((v14 + (_DWORD)v15) << a5) + a6[v15];
        v11 = v11 - result + a7[v15++];
      }
      while (a3 != (_DWORD)v15);
      a7 = (int *)((char *)a7 + v13);
      ++v10;
      a6 = (int *)((char *)a6 + v13);
    }
    while (v10 != a3);
  }
  if (a8)
    v16 = 64;
  else
    v16 = 128;
  v17 = v16 << (a5 - 1);
  if (a8)
    v18 = 6;
  else
    v18 = 7;
  if (v12 >= 0)
    v19 = v17;
  else
    v19 = v17 - 1;
  if (v11 < 0)
    --v17;
  v20 = v18 + a5;
  *a9 = (v19 + v12) >> v20;
  *a10 = (v17 + v11) >> v20;
  return result;
}

uint64_t ExtendToPowerOf2(uint64_t result, int *a2, int *a3)
{
  int v3;
  int v4;

  if ((int)result < 2)
  {
    v3 = 0;
    v4 = 1;
  }
  else
  {
    v3 = 0;
    v4 = 1;
    do
    {
      v4 *= 2;
      ++v3;
    }
    while (v4 < (int)result);
  }
  *a2 = v4;
  *a3 = v3;
  return result;
}

uint64_t Divid_RoundPreferAway0(double a1, double a2)
{
  double v2;
  double v3;

  v2 = a1 / a2;
  v3 = 0.5;
  if (v2 < 0.0)
    v3 = -0.5;
  return (int)(v2 + v3);
}

uint64_t Warp_Y(uint64_t result, uint64_t a2, int a3, int a4, double *a5, int *a6, int *a7)
{
  int v7;
  int v8;
  int v9;
  int v10;

  switch((int)result)
  {
    case 0:
      if (a4 >= 1)
      {
        v7 = (int)*a5;
        v8 = a4 + a3;
        do
        {
          v9 = v7 * a2;
          v10 = a2;
          do
          {
            *a6++ = v9;
            *a7++ = a3 * v7;
            ++v10;
            v9 += v7;
          }
          while (v10 < a4 + (int)a2);
          ++a3;
        }
        while (a3 < v8);
      }
      break;
    case 1:
      result = Warp1_Y(a2, a3, a4, a5, a6, a7);
      break;
    case 2:
      result = Warp2_Y(a2, a3, a4, a5, a6, a7);
      break;
    case 3:
      result = Warp3_Y(a2, a3, a4, a5, a6, a7);
      break;
    case 4:
      result = Warp4_Y(a2, a3, a4, a5, a6, a7);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Warp0(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  int v8;
  int v9;

  if (a3 >= 1)
  {
    v6 = (int)*a4;
    v7 = a3 + a2;
    do
    {
      v8 = v6 * result;
      v9 = result;
      do
      {
        *a5++ = v8;
        *a6++ = a2 * v6;
        ++v9;
        v8 += v6;
      }
      while (v9 < a3 + (int)result);
      ++a2;
    }
    while (a2 < v7);
  }
  return result;
}

uint64_t Warp1_Y(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  if (a3 >= 1)
  {
    v6 = (int)a4[3];
    v7 = (int)*a4;
    v8 = a3 + a2;
    v9 = (int)a4[2] + v7 * result;
    do
    {
      v10 = v9;
      v11 = result;
      do
      {
        *a5++ = v10;
        *a6++ = v6 + a2 * v7;
        ++v11;
        v10 += v7;
      }
      while (v11 < a3 + (int)result);
      ++a2;
    }
    while (a2 < v8);
  }
  return result;
}

uint64_t Warp2_Y(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;

  if (a3 >= 1)
  {
    v6 = (int)a4[2];
    v7 = (int)a4[3];
    v8 = (int)a4[13];
    v9 = (int)a4[11];
    v10 = (int)a4[10];
    v11 = a4[7];
    v12 = a3 + a2;
    v13 = a3 + result;
    v14 = (int)a4[6] - v10 * v6;
    v15 = v10 * v7 - (int)v11;
    v16 = (int)v11 - v10 * v7;
    v17 = v9 + a2 * v14 + result * v16;
    v18 = v9 + result * v14 + a2 * v15;
    do
    {
      v19 = v18;
      v20 = v17;
      v21 = result;
      do
      {
        *a5++ = (v19 >> v8) + v6;
        *a6++ = (v20 >> v8) + v7;
        ++v21;
        v20 += v16;
        v19 += v14;
      }
      while (v21 < v13);
      ++a2;
      v17 += v14;
      v18 += v15;
    }
    while (a2 < v12);
  }
  return result;
}

uint64_t Warp3_Y(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  int v8;
  double v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;

  if (a3 >= 1)
  {
    v6 = (int)a4[2];
    v7 = (int)a4[3];
    v8 = (int)a4[13];
    v9 = a4[10];
    v10 = (int)a4[11];
    v11 = (int)a4[12];
    v12 = a3 + a2;
    v13 = a3 + result;
    v14 = (int)a4[6] - (int)v9 * v6;
    v15 = (int)a4[8] - (int)v9 * v6;
    v16 = (int)a4[7] - (int)v9 * v7;
    v17 = (int)a4[9] - (int)v9 * v7;
    v18 = v10 + v11 * a2 * v17 + result * v16;
    v19 = v11 * v17;
    v20 = v10 + v11 * a2 * v15 + result * v14;
    v21 = v11 * v15;
    do
    {
      v22 = v20;
      v23 = v18;
      v24 = result;
      do
      {
        *a5++ = (v22 >> v8) + v6;
        *a6++ = (v23 >> v8) + v7;
        ++v24;
        v23 += v16;
        v22 += v14;
      }
      while (v24 < v13);
      ++a2;
      v18 += v19;
      v20 += v21;
    }
    while (a2 < v12);
  }
  return result;
}

uint64_t Warp4_Y(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  int v16;
  double v17;

  if (a3 >= 1)
  {
    v6 = a4[11];
    v7 = a4[2];
    v8 = a4[3];
    v9 = a4[4];
    v10 = a4[5];
    v11 = a4[6];
    v12 = a4[7];
    v13 = a3 + a2;
    v14 = a4[8];
    v15 = a4[9];
    do
    {
      v16 = result;
      do
      {
        v17 = v6 + v15 * (double)a2 + v14 * (double)v16;
        *a5++ = (int)((v9 + v8 * (double)a2 + v7 * (double)v16) / v17 + 0.5);
        *a6++ = (int)((v12 + v11 * (double)a2 + v10 * (double)v16++) / v17 + 0.5);
      }
      while (v16 < a3 + (int)result);
      ++a2;
    }
    while (a2 < v13);
  }
  return result;
}

uint64_t Warp_C(uint64_t result, uint64_t a2, int a3, int a4, double *a5, int *a6, int *a7)
{
  int v7;
  int v8;
  int v9;
  int v10;

  switch((int)result)
  {
    case 0:
      if (a4 >= 1)
      {
        v7 = (int)*a5;
        v8 = a4 + a3;
        do
        {
          v9 = v7 * a2;
          v10 = a2;
          do
          {
            *a6++ = v9;
            *a7++ = a3 * v7;
            ++v10;
            v9 += v7;
          }
          while (v10 < a4 + (int)a2);
          ++a3;
        }
        while (a3 < v8);
      }
      break;
    case 1:
      result = Warp1_C(a2, a3, a4, a5, a6, a7);
      break;
    case 2:
      result = Warp2_C(a2, a3, a4, a5, a6, a7);
      break;
    case 3:
      result = Warp3_C(a2, a3, a4, a5, a6, a7);
      break;
    case 4:
      result = Warp4_C(a2, a3, a4, a5, a6, a7);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Warp1_C(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  double v8;
  int v9;
  int v10;
  int v11;

  if (a3 >= 1)
  {
    v6 = (int)*a4;
    v7 = a3 + a2;
    v8 = a4[2];
    v9 = (int)a4[3] & 1 | ((int)a4[3] >> 1);
    do
    {
      v10 = ((int)v8 & 1 | ((int)v8 >> 1)) + v6 * result;
      v11 = result;
      do
      {
        *a5++ = v10;
        *a6++ = v9 + a2 * v6;
        ++v11;
        v10 += v6;
      }
      while (v11 < a3 + (int)result);
      ++a2;
    }
    while (a2 < v7);
  }
  return result;
}

uint64_t Warp2_C(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;

  if (a3 >= 1)
  {
    v6 = (int)a4[11];
    v7 = (int)a4[18];
    v8 = (int)a4[10];
    v9 = (int)a4[7];
    v10 = (int)a4[6];
    v11 = a4[2];
    v12 = (int)a4[13] + 2;
    v13 = a3 + a2;
    v14 = a3 + result;
    v15 = v10 - v8 * (int)v11;
    v16 = v8 * (int)a4[3];
    v17 = v9 - v16;
    v18 = v8 * (int)v11;
    v19 = (4 * result) | 1;
    v20 = (4 * a2) | 1;
    v21 = v15 * v19 + v7 * (2 * v18 - 16) + (v16 - v9) * v20 + 4 * v6;
    v22 = 4 * v9;
    v23 = 4 * v16 - 4 * v9;
    v24 = 4 * v10 - 4 * v18;
    v25 = v15 * v20 + v7 * (2 * v16 - 16) + v17 * v19 + 4 * v6;
    do
    {
      v26 = v25;
      v27 = v21;
      v28 = result;
      do
      {
        *a5++ = v27 >> v12;
        *a6++ = v26 >> v12;
        ++v28;
        v27 += v24;
        v26 += v22 - 4 * v16;
      }
      while (v28 < v14);
      ++a2;
      v21 += v23;
      v25 += v24;
    }
    while (a2 < v13);
  }
  return result;
}

uint64_t Warp3_C(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  double v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  char v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;

  if (a3 >= 1)
  {
    v6 = a4[10];
    v7 = (int)a4[11];
    v8 = (int)a4[18];
    v9 = (int)a4[12];
    v10 = (int)a4[7];
    v11 = (int)a4[6];
    v13 = a4[2];
    v12 = a4[3];
    v14 = (int)a4[13] + 2;
    v15 = a3 + a2;
    v16 = a3 + result;
    v17 = v9 * ((int)a4[8] - (int)v6 * (int)v13);
    v18 = (4 * a2) | 1;
    v19 = (int)v6 * (int)v13;
    v20 = (4 * result) | 1;
    v21 = v8 * (2 * v19 - 16) + v17 * v18 + (v11 - v19) * v20 + 4 * v7;
    v22 = 4 * v17;
    v23 = 4 * v11 - 4 * v19;
    v24 = v9 * ((int)a4[9] - (int)v6 * (int)v12);
    v25 = (int)v6 * (int)v12;
    v26 = v8 * (2 * v25 - 16) + v24 * v18 + (v10 - v25) * v20 + 4 * v7;
    v27 = 4 * v24;
    v28 = 4 * v10 - 4 * v25;
    do
    {
      v29 = v26;
      v30 = v21;
      v31 = result;
      do
      {
        *a5++ = v30 >> v14;
        *a6++ = v29 >> v14;
        ++v31;
        v30 += v23;
        v29 += v28;
      }
      while (v31 < v16);
      ++a2;
      v21 += v22;
      v26 += v27;
    }
    while (a2 < v15);
  }
  return result;
}

uint64_t Warp4_C(uint64_t result, int a2, int a3, double *a4, int *a5, int *a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  int v25;
  double v26;
  double v27;

  if (a3 >= 1)
  {
    v6 = a4[11];
    v7 = *a4;
    v8 = v6 + v6;
    v9 = v6 * 8.0;
    v10 = a4[8];
    v11 = a4[9];
    v12 = a3 + a2;
    v13 = a4[7];
    v14 = a4[4];
    v15 = a4[2] + a4[2];
    v16 = a4[3] + a4[3];
    v17 = a4[5] + a4[5];
    v18 = a4[6] + a4[6];
    do
    {
      v19 = (double)((4 * a2) | 1);
      v20 = v11 * v19;
      v21 = v16 * v19;
      v22 = v11 * 4.0 * v19;
      v23 = v18 * v19;
      v24 = (4 * result) | 1;
      v25 = result;
      do
      {
        v26 = v7 * (v8 + v20 + v10 * (double)v24);
        v27 = v9 + v22 + v10 * 4.0 * (double)v24;
        *a5++ = (int)((v21 + v15 * (double)v24 + v14 * 4.0 - v26) / v27 + 0.5);
        *a6++ = (int)((v23 + v17 * (double)v24 + v13 * 4.0 - v26) / v27 + 0.5);
        ++v25;
        v24 += 4;
      }
      while (v25 < a3 + (int)result);
      ++a2;
    }
    while (a2 < v12);
  }
  return result;
}

unsigned __int8 *Get_HalfPel_Left(unsigned __int8 *result, unsigned __int8 *a2, int a3, int a4, const unsigned __int8 *a5, int a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;

  if (a6)
    v6 = a3 + 1;
  else
    v6 = a3;
  if (v6)
  {
    v7 = a3 - 5;
    do
    {
      v8 = result[2];
      v9 = result[1];
      v10 = *result;
      v11 = result[3];
      v12 = result + 5;
      v13 = result[4];
      if (v7)
      {
        v14 = v7;
        v15 = v10;
        v16 = v9;
        v17 = v8;
        do
        {
          v18 = v16;
          v16 = v15;
          v15 = v10;
          v10 = v9;
          v9 = v8;
          v8 = v11;
          v11 = v13;
          v19 = 160 * (v10 + v15) - a4 - 48 * (v9 + v16) + 24 * (v8 + v18) - 8 * (v13 + v17);
          v20 = v19 + 128;
          v21 = v19 + 383;
          if (v20 >= 0)
            v21 = v20;
          *a2++ = a5[v21 >> 8];
          v22 = *v12++;
          v13 = v22;
          v17 = v18;
          --v14;
        }
        while (v14);
      }
      else
      {
        v15 = v10;
        v16 = v9;
        v18 = v8;
      }
      v23 = 160 * (v9 + v10) - a4 - 48 * (v8 + v15) + 24 * (v11 + v16) - 8 * (v18 + v13);
      v24 = v23 + 128;
      v25 = v23 + 383;
      if (v24 >= 0)
        v25 = v24;
      *a2 = a5[v25 >> 8];
      v26 = *v12;
      v27 = 160 * (v8 + v9) - a4 - 48 * (v11 + v10) + 24 * (v15 + v13) - 8 * (v16 + v26);
      v28 = v27 + 128;
      v29 = v27 + 383;
      if (v28 >= 0)
        v29 = v28;
      a2[1] = a5[v29 >> 8];
      v30 = *v12;
      v31 = 160 * (v11 + v8) - a4 - 48 * (v9 + v13) + 24 * (v10 + v26) - 8 * (v15 + v30);
      v32 = v31 + 128;
      v33 = v31 + 383;
      if (v32 >= 0)
        v33 = v32;
      a2[2] = a5[v33 >> 8];
      v34 = *(v12 - 1);
      v35 = 160 * (v11 + v13) - a4 - 48 * (v8 + v26) + 24 * (v9 + v30) - 8 * (v10 + v34);
      v36 = v35 + 128;
      v37 = v35 + 383;
      if (v36 >= 0)
        v37 = v36;
      a2[3] = a5[v37 >> 8];
      v38 = 160 * (v26 + v13) - a4 - 48 * (v11 + v30) + 24 * (v8 + v34) - 8 * (v9 + *(v12 - 2));
      v39 = v38 + 128;
      v40 = v38 + 383;
      if (v39 >= 0)
        v40 = v39;
      a2[4] = a5[v40 >> 8];
      a2 += 5;
      result = v12 + 1;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t Get_HalfPel_Bottom(uint64_t result, unsigned __int8 *a2, int a3, int a4, const unsigned __int8 *a5, int a6)
{
  int v6;
  int v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  unsigned __int8 *v46;
  int v47;
  unsigned __int8 *v48;
  unsigned __int8 *v49;
  unsigned __int8 *v50;
  unsigned __int8 *v51;
  unsigned __int8 *v52;
  unsigned __int8 *v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  unsigned __int8 *v71;
  unsigned __int8 *v72;
  unsigned __int8 *v73;
  unsigned __int8 *v74;
  unsigned __int8 *v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  uint64_t v100;
  int v101;
  unsigned __int8 *v102;
  unsigned __int8 *v103;
  unsigned __int8 *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unsigned __int8 *v108;
  int v109;
  uint64_t v110;
  int v111;
  int v112;
  int v113;
  uint64_t v114;

  if (a6)
    v6 = a3 + 1;
  else
    v6 = a3;
  v7 = 2 * v6;
  v8 = (unsigned __int8 *)(result + 2 * v6);
  v9 = (unsigned __int8 *)(result + v6);
  v10 = &v9[v6];
  v11 = &v10[v6];
  v12 = &v11[v6];
  v13 = &v12[v6];
  if (a3 == 5)
  {
    v14 = (unsigned __int8 *)result;
    v15 = v9;
LABEL_6:
    v114 = v7;
    v16 = a3;
    v17 = v12;
    v18 = v11;
    v19 = v10;
    v20 = v9;
    v21 = (unsigned __int8 *)result;
    v22 = v14;
    v23 = v15;
    do
    {
      v25 = *v8++;
      v24 = v25;
      v27 = *v23++;
      v26 = v27;
      v29 = *v22++;
      v28 = v29;
      v31 = *v21++;
      v30 = v31;
      v33 = *v20++;
      v32 = v33;
      v35 = *v19++;
      v34 = v35;
      v37 = *v18++;
      v36 = v37;
      v38 = *v17++;
      v39 = 160 * (v32 + v30) - a4 - 48 * (v34 + v28) + 24 * (v36 + v26) - 8 * (v38 + v24);
      v40 = v39 + 128;
      v41 = v39 + 383;
      if (v40 >= 0)
        v41 = v40;
      *a2++ = a5[v41 >> 8];
      --v16;
    }
    while (v16);
    v42 = 0;
    do
    {
      v43 = 160 * (v10[v42] + v9[v42])
          - a4
          - 48 * (v11[v42] + *(unsigned __int8 *)(result + v42))
          + 24 * (v12[v42] + v14[v42])
          - 8 * (v13[v42] + v15[v42]);
      v44 = v43 + 128;
      v45 = v43 + 383;
      if (v44 >= 0)
        v45 = v44;
      a2[v42++] = a5[v45 >> 8];
    }
    while (a3 != (_DWORD)v42);
    v46 = &a2[v42];
    v47 = a3;
    v48 = v13;
    v49 = v12;
    v50 = v11;
    v51 = v10;
    v52 = v9;
    v53 = (unsigned __int8 *)result;
    do
    {
      v55 = *v14++;
      v54 = v55;
      v57 = *v53++;
      v56 = v57;
      v59 = *v52++;
      v58 = v59;
      v61 = *v51++;
      v60 = v61;
      v63 = *v50++;
      v62 = v63;
      v65 = *v49++;
      v64 = v65;
      v66 = *v48++;
      v67 = 160 * (v62 + v60) - a4 - 48 * (v64 + v58) + 24 * (v66 + v56) - 8 * (v66 + v54);
      v68 = v67 + 128;
      v69 = v67 + 383;
      if (v68 >= 0)
        v69 = v68;
      *v46++ = a5[v69 >> 8];
      --v47;
    }
    while (v47);
    v70 = a3;
    v71 = v12;
    v72 = v13;
    v73 = v11;
    v74 = v10;
    v75 = v9;
    do
    {
      v77 = *(unsigned __int8 *)result++;
      v76 = v77;
      v79 = *v75++;
      v78 = v79;
      v81 = *v74++;
      v80 = v81;
      v83 = *v73++;
      v82 = v83;
      v85 = *v71++;
      v84 = v85;
      v86 = *v72++;
      v87 = 160 * (v84 + v82) - a4 - 48 * (v86 + v80) + 24 * (v86 + v78) - 8 * (v84 + v76);
      v88 = v87 + 128;
      v89 = v87 + 383;
      if (v88 >= 0)
        v89 = v88;
      *v46++ = a5[v89 >> 8];
      --v70;
    }
    while (v70);
    do
    {
      v91 = *v9++;
      v90 = v91;
      v93 = *v10++;
      v92 = v93;
      v95 = *v11++;
      v94 = v95;
      v96 = *v12++;
      v97 = 160 * (*v13 + v96) - a4 - 48 * (*v13 + v94) + 24 * (v96 + v92) - 8 * (v13[-v114] + v90);
      v98 = v97 + 128;
      v99 = v97 + 383;
      if (v98 >= 0)
        v99 = v98;
      result = a5[v99 >> 8];
      *v46++ = result;
      ++v13;
      --a3;
    }
    while (a3);
  }
  else
  {
    v100 = v6;
    v101 = a3 - 6;
    v14 = (unsigned __int8 *)result;
    v15 = v9;
    while (1)
    {
      v102 = v8;
      v103 = v15;
      v104 = v14;
      v105 = result;
      v106 = (uint64_t)v9;
      v107 = (uint64_t)v10;
      v108 = v11;
      v11 = v12;
      v109 = v101;
      v12 = v13;
      v10 = v108;
      v9 = (unsigned __int8 *)v107;
      result = v106;
      v14 = (unsigned __int8 *)v105;
      v15 = v104;
      v8 = v103;
      if (!a3)
        break;
      v110 = 0;
      do
      {
        v111 = 160 * (*(unsigned __int8 *)(v106 + v110) + *(unsigned __int8 *)(v105 + v110))
             - a4
             - 48 * (*(unsigned __int8 *)(v107 + v110) + v104[v110])
             + 24 * (v108[v110] + v8[v110])
             - 8 * (v11[v110] + v102[v110]);
        v112 = v111 + 128;
        v113 = v111 + 383;
        if (v112 >= 0)
          v113 = v112;
        a2[v110++] = a5[v113 >> 8];
      }
      while (a3 != (_DWORD)v110);
      v13 = &v12[v100];
      --v101;
      a2 += v110;
      if (!v109)
        goto LABEL_6;
    }
    while (v109)
    {
      result = v107;
      --v109;
      v107 = (uint64_t)v108;
      v108 = v11;
      v11 = v13;
      v13 += v100;
    }
  }
  return result;
}

uint64_t InitMotionVectorArray(void **a1, int a2, int a3)
{
  void *v6;
  uint64_t result;
  void *v8;

  v6 = *a1;
  if (v6)
  {
    result = MEM_Dispose(v6);
    if ((_DWORD)result)
      return result;
    *a1 = 0;
  }
  v8 = MEM_NewClear((unint64_t)(a2 * (uint64_t)a3) >> 5);
  *a1 = v8;
  if (v8)
    return 0;
  else
    return 4294967188;
}

void *KillMotionVectorArray(void **a1)
{
  void *result;

  result = *a1;
  if (result)
  {
    result = (void *)MEM_Dispose(result);
    if (!(_DWORD)result)
      *a1 = 0;
  }
  return result;
}

uint64_t GetPredictor1MV(int a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v5;
  int v6;
  _BOOL4 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  int v13;
  int v14;
  int v15;
  __int16 v16;
  __int16 v17;

  if (a1)
    v5 = a5 == 0;
  else
    v5 = 1;
  v6 = !v5;
  v8 = a2 - 1 != a1 && a2 - 1 <= a5;
  if (v6)
    v9 = *(_WORD *)(a3 + 4 * a1 - 2);
  else
    v9 = 0;
  if (a5 < a2)
  {
    v10 = 0;
    v11 = v9;
    if (!v8)
      goto LABEL_18;
  }
  else
  {
    v10 = *(_WORD *)(a4 + 4 * a1);
    v11 = v10;
    if (!v8)
    {
LABEL_18:
      v12 = 0;
      goto LABEL_21;
    }
  }
  v12 = *(_WORD *)(a4 + 4 * a1 + 4);
  v11 = v12;
LABEL_21:
  v13 = v6 + (a5 >= a2) + v8;
  v14 = v9;
  v15 = v12;
  if (v12 >= v9)
    v12 = v9;
  if (v15 < v10)
    v12 = v10;
  v16 = v10;
  if (v15 < v10)
    v16 = v15;
  if (v15 >= v9)
    v9 = v16;
  if (v14 < v10)
    v17 = v9;
  else
    v17 = v12;
  if (v13 == 1)
    return v11;
  else
    return v17;
}

uint64_t GetPredictor4MV(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  _BOOL4 v22;
  int v23;
  int v24;
  __int16 v25;
  __int16 v26;
  int v27;

  switch(a1)
  {
    case 0:
      return GetPredictor1MV(a2, a4, a5, a7, a10);
    case 1:
      v22 = a4 - 1 != a2 && a4 - 1 <= a10;
      v23 = 2 * a2;
      v24 = *(__int16 *)(a5 + 4 * a2);
      if (a10 >= a4)
      {
        v25 = *(_WORD *)(a7 + ((4 * a2) | 2));
        LOWORD(v16) = v25;
        if (!v22)
          goto LABEL_35;
      }
      else
      {
        v25 = 0;
        LOWORD(v16) = *(_WORD *)(a5 + 2 * v23);
        if (!v22)
        {
LABEL_35:
          v26 = 0;
          goto LABEL_38;
        }
      }
      v26 = *(_WORD *)(a7 + 2 * v23 + 4);
      LOWORD(v16) = v26;
LABEL_38:
      if (a10 < a4)
        v27 = 1;
      else
        v27 = 2;
      if (v27 + v22 != 1)
      {
        if (v24 >= v25)
        {
          if (v26 < v24)
            LOWORD(v24) = v26;
          if (v26 >= v25)
            LOWORD(v16) = v24;
          else
            LOWORD(v16) = v25;
        }
        else
        {
          if (v26 < v25)
            v25 = v26;
          if (v26 >= v24)
            LOWORD(v16) = v25;
          else
            LOWORD(v16) = *(_WORD *)(a5 + 4 * a2);
        }
      }
      return (__int16)v16;
    case 2:
      LOWORD(v11) = 0;
      LOWORD(v12) = *(_WORD *)(a5 + 4 * a2);
      v13 = *(__int16 *)(a5 + 4 * a2 + 2);
      if (a2 && a10)
        LOWORD(v11) = *(_WORD *)(a6 + 4 * a2 - 2);
      v14 = (__int16)v12;
      v11 = (__int16)v11;
      v15 = (__int16)v11 <= (__int16)v12;
      if ((__int16)v11 >= (__int16)v12)
        v12 = (__int16)v12;
      else
        v12 = (__int16)v11;
      if (v15)
        v11 = v14;
      if (v13 < v11)
        LOWORD(v11) = *(_WORD *)(a5 + 4 * a2 + 2);
      if (v13 >= v12)
        LOWORD(v16) = v11;
      else
        LOWORD(v16) = v12;
      return (__int16)v16;
    case 3:
      v17 = 4 * a2;
      v18 = *(__int16 *)(a6 + v17);
      v19 = *(__int16 *)(a5 + v17);
      v20 = *(__int16 *)(a5 + 2 * ((2 * a2) | 1));
      if (v18 >= v19)
        v16 = v19;
      else
        v16 = v18;
      if (v18 > v19)
        v19 = v18;
      if (v20 < v19)
        LOWORD(v19) = *(_WORD *)(a5 + 2 * ((2 * a2) | 1));
      if (v20 >= v16)
        LOWORD(v16) = v19;
      return (__int16)v16;
    default:
      LOWORD(v16) = 0;
      return (__int16)v16;
  }
}

uint64_t *SwapMVrow(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *a2 = *result;
  *result = v2;
  return result;
}

uint64_t VerifyMotionVectorRange(int a1, int a2)
{
  __int16 v2;

  v2 = a2 - 2 * a1;
  if (a2 < a1)
    v2 = a2;
  if (a2 < -a1)
    return (__int16)(a2 + 2 * a1);
  else
    return v2;
}

uint64_t VerifyMotionVectorBoarderY(int a1, int a2, int a3)
{
  __int16 v3;

  if (-16 - a1 > a3)
    v3 = -17 - a1;
  else
    v3 = a3;
  if (a2 - a1 - 32 <= a3)
    return (__int16)(a2 - a1 - 33);
  else
    return v3;
}

uint64_t VerifyMotionVectorBoarder16Pad(int a1, int a2, __int16 *a3, _BYTE *a4)
{
  int v4;
  int v5;

  v4 = *a3;
  v5 = a2 - a1 - 33;
  if (v5 <= v4 || (LOWORD(v5) = -15 - a1, -15 - a1 > v4))
  {
    *a3 = v5;
    *a4 = 0;
  }
  return *a3;
}

uint64_t VerifyMotionVectorBoarder8Pad(int a1, int a2, __int16 *a3, _BYTE *a4)
{
  int v4;
  int v5;

  v4 = *a3;
  v5 = a2 - a1 - 17;
  if (v5 <= v4 || (LOWORD(v5) = -7 - a1, -7 - a1 >= v4))
  {
    *a3 = v5;
    *a4 = 0;
  }
  return *a3;
}

uint64_t GetChromaVector(int16x4_t *a1)
{
  int v1;
  BOOL v2;
  int v3;

  v1 = vaddv_s16(*a1);
  v2 = v1 < 0;
  if (v1 < 0)
    v1 = -v1;
  v3 = ((v1 >> 3) & 0x1FFE) + dword_219C4A584[v1 & 0xF];
  if (v2)
    v3 = -v3;
  return (__int16)v3;
}

uint64_t QLuma_To_HChroma(int a1)
{
  unsigned int v1;
  int v2;

  if (a1 >= 0)
    v1 = a1;
  else
    v1 = -a1;
  v2 = dword_219C4A5D0[v1 & 3] + ((v1 >> 1) & 0x7FFE);
  if (a1 < 0)
    v2 = -v2;
  return (__int16)v2;
}

_QWORD *CBitStreamDeco::SetUp(_QWORD *this, unsigned int a2, unsigned int *a3)
{
  _QWORD *v3;
  int v6;

  v3 = this;
  if (a2)
  {
    v6 = *((_DWORD *)this + 3) + *((_DWORD *)this + 2);
    *this = 0;
    *((_DWORD *)this + 2) = 0;
    *((_DWORD *)this + 3) = v6;
    *((_DWORD *)this + 39) = 0;
    *((_DWORD *)this + 40) = (8 * a2 + 24) & 0xFFFFFFE0;
    this = malloc_type_malloc(a2 + 8, 0x2A10CE78uLL);
    v3[2] = this;
    if (a3)
    {
      if (this)
        return memcpy(this, a3, a2);
    }
  }
  else
  {
    *((_DWORD *)this + 40) = 0;
    this[2] = 0;
  }
  return this;
}

uint64_t InitBitStreamDeco(CBitStreamDeco **a1)
{
  CBitStream *v2;

  v2 = (CBitStream *)operator new();
  CBitStream::CBitStream(v2);
  *((_DWORD *)v2 + 39) = 0;
  *a1 = v2;
  return 0;
}

void sub_219C2E264(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220732AE4](v1, 0x1010C40DD62BBE2);
  _Unwind_Resume(a1);
}

uint64_t KillBitStreamDeco(CBitStreamDeco **a1)
{
  uint64_t v2;

  v2 = (uint64_t)*a1;
  if (v2)
  {
    MEMORY[0x220732AE4](v2, 0x1010C40DD62BBE2);
    *a1 = 0;
  }
  return 0;
}

void CBitStreamDeco::ReleaseBuffer(CBitStreamDeco *this)
{
  void *v1;

  v1 = (void *)*((_QWORD *)this + 2);
  if (v1)
    free(v1);
}

uint64_t DecHeaderVOS(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v18;
  int v19;

  v2 = *(_DWORD *)(a1 + 156);
  v3 = v2 + 8;
  *(_DWORD *)(a1 + 156) = v2 + 8;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 > 7)
  {
    v5 = v4 - 8;
    *(_DWORD *)(a1 + 4) = v4 - 8;
    v12 = *(_DWORD *)a1;
    *(_BYTE *)(a2 + 101) = (*(_DWORD *)a1 >> (v4 - 8)) & *(_BYTE *)(a1 + 56);
    v10 = v2 + 40;
    *(_DWORD *)(a1 + 156) = v10;
    if ((v4 - 8) >= 0x20)
    {
      v5 = v4 - 40;
      v14 = (v12 >> (v4 - 40)) & *(_DWORD *)(a1 + 152);
      goto LABEL_20;
    }
    if ((_DWORD)v4 == 8)
    {
      v14 = 0;
      v13 = 32;
      goto LABEL_13;
    }
    v11 = 40;
  }
  else
  {
    v5 = v4 + 24;
    *(_DWORD *)(a1 + 4) = v4 + 24;
    v6 = (*(_DWORD *)a1 << (8 - v4)) & *(_DWORD *)(a1 + 56);
    v7 = *(_DWORD *)(a1 + 160);
    v8 = *(unsigned int *)(a1 + 8);
    if (v3 > v7 || 32 * (int)v8 > v7)
    {
      v12 = 0;
      *(_DWORD *)(a1 + 8) = v8 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v12 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v8));
      *(_DWORD *)a1 = v12;
      *(_DWORD *)(a1 + 8) = v8 + 1;
      v6 |= *(_DWORD *)(a1 + 4 * (8 - v4) + 24) & (v12 >> v5);
    }
    *(_BYTE *)(a2 + 101) = v6;
    v10 = v2 + 40;
    *(_DWORD *)(a1 + 156) = v10;
    v11 = 8;
  }
  v13 = (v11 - v4);
  v14 = (v12 << v13) & *(_DWORD *)(a1 + 152);
LABEL_13:
  v15 = *(_DWORD *)(a1 + 160);
  v16 = *(unsigned int *)(a1 + 8);
  if (v10 > v15 || 32 * (int)v16 > v15)
  {
    *(_DWORD *)(a1 + 8) = v16 + 1;
    *(_DWORD *)a1 = 0;
  }
  else
  {
    v18 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v16));
    *(_DWORD *)a1 = v18;
    *(_DWORD *)(a1 + 8) = v16 + 1;
    v14 |= *(_DWORD *)(a1 + 4 * v13 + 24) & (v18 >> v5);
  }
LABEL_20:
  *(_DWORD *)(a1 + 4) = v5 + 32;
  if (v5)
  {
    v19 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 4) = v5;
    *(_DWORD *)(a1 + 8) = v19 - 1;
    if (*(_DWORD *)(a1 + 160) >= (32 * (v19 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * (v19 - 2)));
  }
  *(_DWORD *)(a1 + 156) = v3;
  if (v14 == 434)
    EatUserData(a1);
  return 0;
}

uint64_t CBitStreamDeco::GrabBits(CBitStreamDeco *this, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;

  v2 = *((_DWORD *)this + 39) + a2;
  *((_DWORD *)this + 39) = v2;
  v3 = *((_DWORD *)this + 1);
  v4 = v3 - a2;
  if (v3 >= a2)
  {
    *((_DWORD *)this + 1) = v4;
    return ((*(_DWORD *)this >> v4) & *((_DWORD *)this + a2 + 6));
  }
  else
  {
    v5 = a2 - v3;
    *((_DWORD *)this + 1) = 32 - v5;
    if (v5 <= 0x1F)
      v6 = ((*(_DWORD *)this << v5) & *((_DWORD *)this + a2 + 6));
    else
      v6 = 0;
    v7 = *((_DWORD *)this + 40);
    v8 = *((unsigned int *)this + 2);
    if (v2 > v7 || 32 * (int)v8 > v7)
    {
      *((_DWORD *)this + 2) = v8 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v8));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v8 + 1;
      return *((_DWORD *)this + v5 + 6) & (v10 >> (32 - v5)) | v6;
    }
  }
  return v6;
}

uint64_t CBitStreamDeco::PeekBits(CBitStreamDeco *this, unsigned int a2)
{
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v2 = *((_DWORD *)this + 39);
  *((_DWORD *)this + 39) = v2 + a2;
  v3 = *((_DWORD *)this + 1);
  v4 = v3 - a2;
  if (v3 >= a2)
  {
    v6 = ((*(_DWORD *)this >> v4) & *((_DWORD *)this + a2 + 6));
  }
  else
  {
    v5 = a2 - v3;
    v4 = 32 - (a2 - v3);
    *((_DWORD *)this + 1) = v4;
    if (a2 - v3 <= 0x1F)
      v6 = ((*(_DWORD *)this << v5) & *((_DWORD *)this + a2 + 6));
    else
      v6 = 0;
    v7 = *((_DWORD *)this + 40);
    v8 = *((unsigned int *)this + 2);
    if (v2 + a2 > v7 || 32 * (int)v8 > v7)
    {
      *((_DWORD *)this + 2) = v8 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v8));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v8 + 1;
      v6 = *((_DWORD *)this + v5 + 6) & (v10 >> v4) | v6;
    }
  }
  v11 = v4 + a2;
  *((_DWORD *)this + 1) = v11;
  if (v11 >= 0x21)
  {
    v12 = v11 - 32;
    v13 = *((_DWORD *)this + 2);
    *((_DWORD *)this + 1) = v12;
    *((_DWORD *)this + 2) = v13 - 1;
    if (*((_DWORD *)this + 40) >= (32 * (v13 - 1)))
      *(_DWORD *)this = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * (v13 - 2)));
  }
  *((_DWORD *)this + 39) = v2;
  return v6;
}

uint64_t EatUserData(uint64_t result)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;

  v1 = *(_DWORD *)(result + 156);
  *(_DWORD *)(result + 156) = v1 + 24;
  v2 = *(_DWORD *)(result + 4);
  if (v2 <= 0x17)
  {
    v3 = v2 + 8;
    *(_DWORD *)(result + 4) = v2 + 8;
    v4 = *(_DWORD *)(result + 160);
    v5 = *(unsigned int *)(result + 8);
    if (v1 + 24 > v4 || 32 * (int)v5 > v4)
      v12 = 0;
    else
      v12 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v5));
    *(_DWORD *)(result + 8) = v5 + 1;
    *(_DWORD *)result = v12;
    v7 = v1 + 32;
    *(_DWORD *)(result + 156) = v7;
    goto LABEL_16;
  }
  v3 = v2 - 24;
  v7 = v1 + 32;
  *(_DWORD *)(result + 156) = v7;
  if (v2 - 24 >= 8)
  {
LABEL_16:
    v2 = v3 - 8;
    *(_DWORD *)(result + 4) = v3 - 8;
    v23 = *(_DWORD *)result;
    v8 = (*(_DWORD *)result >> v2) & *(_DWORD *)(result + 56);
    goto LABEL_17;
  }
  *(_DWORD *)(result + 4) = v2;
  v8 = (*(_DWORD *)result << -(char)v2) & *(_DWORD *)(result + 56);
  v9 = *(_DWORD *)(result + 160);
  v10 = *(unsigned int *)(result + 8);
  if (v7 > v9 || 32 * (int)v10 > v9)
  {
    v23 = 0;
    *(_DWORD *)(result + 8) = v10 + 1;
    *(_DWORD *)result = 0;
  }
  else
  {
    v23 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v10));
    *(_DWORD *)result = v23;
    *(_DWORD *)(result + 8) = v10 + 1;
    v8 |= *(_DWORD *)(result + 4 * (32 - v2) + 24) & (v23 >> v2);
  }
LABEL_17:
  if (v8 == 178)
  {
    while (1)
    {
      *(_DWORD *)(result + 156) = v7 + 24;
      v13 = v2 - 24;
      if (v2 >= 0x18)
      {
        v15 = (v23 >> v13) & *(_DWORD *)(result + 120);
      }
      else
      {
        v14 = 24 - v2;
        v13 = v2 + 8;
        *(_DWORD *)(result + 4) = v2 + 8;
        v15 = (v23 << (24 - v2)) & *(_DWORD *)(result + 120);
        v16 = *(_DWORD *)(result + 160);
        v17 = *(unsigned int *)(result + 8);
        if (v7 + 24 > v16 || 32 * (int)v17 > v16)
        {
          v23 = 0;
          *(_DWORD *)(result + 8) = v17 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v23 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v17));
          *(_DWORD *)result = v23;
          *(_DWORD *)(result + 8) = v17 + 1;
          v15 |= *(_DWORD *)(result + 4 * v14 + 24) & (v23 >> v13);
        }
      }
      v19 = v13 + 24;
      *(_DWORD *)(result + 4) = v13 + 24;
      if (v13 >= 9)
      {
        v19 = v13 - 8;
        v20 = *(_DWORD *)(result + 8);
        *(_DWORD *)(result + 4) = v19;
        *(_DWORD *)(result + 8) = v20 - 1;
        if (*(_DWORD *)(result + 160) >= (32 * (v20 - 1)))
        {
          v23 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * (v20 - 2)));
          *(_DWORD *)result = v23;
        }
      }
      *(_DWORD *)(result + 156) = v7;
      if (v15 == 1)
        break;
      v21 = *(_DWORD *)(result + 160);
      if (v7 >= v21)
        break;
      v7 += 8;
      *(_DWORD *)(result + 156) = v7;
      v2 = v19 - 8;
      if (v19 >= 8)
      {
        *(_DWORD *)(result + 4) = v2;
      }
      else
      {
        v2 = v19 + 24;
        *(_DWORD *)(result + 4) = v19 + 24;
        v22 = *(unsigned int *)(result + 8);
        if (v7 > v21 || 32 * (int)v22 > v21)
        {
          v23 = 0;
          *(_DWORD *)(result + 8) = v22 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v23 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v22));
          *(_DWORD *)result = v23;
          *(_DWORD *)(result + 8) = v22 + 1;
        }
      }
    }
  }
  return result;
}

uint64_t DecHeaderVO(CBitStreamDeco *a1, uint64_t a2)
{
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v16;
  uint64_t v17;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  int v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t result;
  unsigned int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  uint64_t v72;
  unsigned int v74;
  int v75;
  unsigned int v76;
  uint64_t v77;
  unsigned int v78;
  int v79;
  int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  uint64_t v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  uint64_t v89;
  unsigned int v90;

  v4 = *((_DWORD *)a1 + 39);
  v5 = v4 + 1;
  *((_DWORD *)a1 + 39) = v4 + 1;
  v6 = *((_DWORD *)a1 + 1);
  if (!v6)
  {
    *((_DWORD *)a1 + 1) = 31;
    v16 = *((_DWORD *)a1 + 40);
    v17 = *((unsigned int *)a1 + 2);
    if (v5 > v16 || 32 * (int)v17 > v16)
    {
      v7 = 0;
      *(_DWORD *)a1 = 0;
      *((_DWORD *)a1 + 2) = v17 + 1;
      *(_BYTE *)(a2 + 8) = 0;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v17));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v17 + 1;
      *(_BYTE *)(a2 + 8) = (v7 & 0x80000000) != 0;
      if ((v7 & 0x80000000) != 0)
      {
        v8 = 31;
        goto LABEL_20;
      }
    }
    v19 = v4 + 5;
    *((_DWORD *)a1 + 39) = v19;
    v8 = 31;
    goto LABEL_33;
  }
  v7 = *(_DWORD *)a1;
  v8 = v6 - 1;
  v9 = *(_DWORD *)a1 >> (v6 - 1);
  *(_BYTE *)(a2 + 8) = v9 & 1;
  if ((v9 & 1) == 0)
    goto LABEL_26;
  *((_DWORD *)a1 + 39) = v4 + 5;
  if (v6 <= 4)
  {
    v10 = 5 - v6;
    v11 = v6 + 27;
    *((_DWORD *)a1 + 1) = v11;
    v12 = (v7 << v10) & *((_DWORD *)a1 + 10);
    v13 = *((_DWORD *)a1 + 40);
    v14 = *((unsigned int *)a1 + 2);
    if (v4 + 5 > v13 || 32 * (int)v14 > v13)
    {
      v7 = 0;
      *((_DWORD *)a1 + 2) = v14 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v14));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v14 + 1;
      v12 |= *((_DWORD *)a1 + v10 + 6) & (v7 >> v11);
    }
    *(_BYTE *)(a2 + 9) = v12;
    v5 = v4 + 8;
    goto LABEL_24;
  }
LABEL_20:
  v11 = v8 - 4;
  *(_BYTE *)(a2 + 9) = (v7 >> (v8 - 4)) & *((_DWORD *)a1 + 10);
  v5 = v4 + 8;
  *((_DWORD *)a1 + 39) = v4 + 8;
  if (v8 - 4 < 3)
  {
    v20 = 7 - v8;
    v8 += 25;
    *((_DWORD *)a1 + 1) = v8;
    v21 = (v7 << v20) & *((_DWORD *)a1 + 9);
    v22 = *((_DWORD *)a1 + 40);
    v23 = *((unsigned int *)a1 + 2);
    if (v5 > v22 || 32 * (int)v23 > v22)
    {
      v7 = 0;
      *((_DWORD *)a1 + 2) = v23 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v23));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v23 + 1;
      v21 |= *((_DWORD *)a1 + v20 + 6) & (v7 >> v8);
    }
    goto LABEL_25;
  }
LABEL_24:
  v8 = v11 - 3;
  v21 = (v7 >> (v11 - 3)) & *((_DWORD *)a1 + 9);
LABEL_25:
  *(_BYTE *)(a2 + 10) = v21;
LABEL_26:
  v19 = v5 + 4;
  *((_DWORD *)a1 + 39) = v5 + 4;
  if (v8 < 4)
  {
    v24 = 4 - v8;
    v25 = v8 + 28;
    *((_DWORD *)a1 + 1) = v8 + 28;
    v26 = (v7 << (4 - v8)) & *((_DWORD *)a1 + 10);
    v27 = *((_DWORD *)a1 + 40);
    v28 = *((unsigned int *)a1 + 2);
    if (v19 > v27 || 32 * (int)v28 > v27)
    {
      v7 = 0;
      *((_DWORD *)a1 + 2) = v28 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v28));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v28 + 1;
      v26 |= *((_DWORD *)a1 + v24 + 6) & (v7 >> v25);
    }
    goto LABEL_34;
  }
LABEL_33:
  v25 = v8 - 4;
  *((_DWORD *)a1 + 1) = v8 - 4;
  v26 = (v7 >> (v8 - 4)) & *((_DWORD *)a1 + 10);
LABEL_34:
  v30 = v26;
  *(_BYTE *)(a2 + 11) = v26;
  if (v26 - 1 > 1)
    goto LABEL_94;
  v19 = v5 + 5;
  *((_DWORD *)a1 + 39) = v5 + 5;
  if (v25)
  {
    *((_DWORD *)a1 + 1) = --v25;
    v31 = (v7 >> v25) & 1;
  }
  else
  {
    *((_DWORD *)a1 + 1) = 31;
    v32 = *((_DWORD *)a1 + 40);
    v33 = *((unsigned int *)a1 + 2);
    if (v19 > v32 || 32 * (int)v33 > v32)
    {
      v7 = 0;
      v31 = 0;
      *(_DWORD *)a1 = 0;
      *((_DWORD *)a1 + 2) = v33 + 1;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v33));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v33 + 1;
      v31 = v7 >> 31;
    }
    v25 = 31;
  }
  *(_BYTE *)(a2 + 12) = v31;
  *(_WORD *)(a2 + 14) = 5;
  *(_WORD *)(a2 + 17) = 257;
  *(_BYTE *)(a2 + 19) = 1;
  if (!v31)
    goto LABEL_94;
  *((_DWORD *)a1 + 39) = v5 + 8;
  if (v25 > 2)
  {
    v39 = *((_DWORD *)a1 + 9);
    *((_DWORD *)a1 + 39) = v5 + 9;
    v35 = v25 - 3;
    v40 = (v7 >> v35) & v39;
    v41 = v40;
    *(_BYTE *)(a2 + 14) = v40;
    if (!v35)
    {
      *((_DWORD *)a1 + 1) = 31;
      v42 = *((_DWORD *)a1 + 7);
      v43 = 2 * v7;
      v44 = *((_DWORD *)a1 + 40);
      v45 = *((unsigned int *)a1 + 2);
      if (v5 + 9 > v44 || 32 * (int)v45 > v44)
      {
        v7 = 0;
        LOBYTE(v43) = v43 & v42;
        *((_DWORD *)a1 + 2) = v45 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v45));
        *(_DWORD *)a1 = v7;
        *((_DWORD *)a1 + 2) = v45 + 1;
        v43 = v42 & (v43 | (v7 >> 31));
      }
      *(_BYTE *)(a2 + 15) = v43;
      v19 = v5 + 10;
      *((_DWORD *)a1 + 39) = v5 + 10;
      v46 = 31;
      goto LABEL_62;
    }
  }
  else
  {
    v34 = 3 - v25;
    v35 = v25 + 29;
    *((_DWORD *)a1 + 1) = v35;
    v36 = (v7 << v34) & *((_DWORD *)a1 + 9);
    v37 = *((_DWORD *)a1 + 40);
    v38 = *((unsigned int *)a1 + 2);
    if (v5 + 8 > v37 || 32 * (int)v38 > v37)
    {
      v7 = 0;
      *((_DWORD *)a1 + 2) = v38 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v38));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v38 + 1;
      v36 |= *((_DWORD *)a1 + v34 + 6) & (v7 >> v35);
    }
    v41 = v36;
    *(_BYTE *)(a2 + 14) = v36;
  }
  v42 = *((_DWORD *)a1 + 7);
  v19 = v5 + 10;
  *((_DWORD *)a1 + 39) = v5 + 10;
  v46 = v35 - 1;
  *(_BYTE *)(a2 + 15) = (v7 >> v46) & v42;
  if (v46)
  {
LABEL_62:
    v25 = v46 - 1;
    *((_DWORD *)a1 + 1) = v25;
    v42 &= v7 >> v25;
    goto LABEL_63;
  }
  *((_DWORD *)a1 + 1) = 31;
  v47 = 2 * v7;
  v48 = *((_DWORD *)a1 + 40);
  v49 = *((unsigned int *)a1 + 2);
  if (v19 > v48 || 32 * (int)v49 > v48)
  {
    v7 = 0;
    LOBYTE(v42) = v47 & v42;
    *((_DWORD *)a1 + 2) = v49 + 1;
    *(_DWORD *)a1 = 0;
  }
  else
  {
    v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v49));
    *(_DWORD *)a1 = v7;
    *((_DWORD *)a1 + 2) = v49 + 1;
    v42 &= v47 | (v7 >> 31);
  }
  v25 = 31;
LABEL_63:
  *(_BYTE *)(a2 + 16) = v42;
  if (!(_BYTE)v42)
  {
    v56 = 1;
    v57 = 1;
    v58 = 1;
    goto LABEL_84;
  }
  *((_DWORD *)a1 + 39) = v5 + 18;
  if (v25 > 7)
  {
    v51 = v25 - 8;
    v52 = *((_DWORD *)a1 + 14);
    v58 = (v7 >> (v25 - 8)) & v52;
    *(_BYTE *)(a2 + 17) = (v7 >> (v25 - 8)) & v52;
    *((_DWORD *)a1 + 39) = v5 + 26;
    if (v25 - 8 <= 7)
    {
      v59 = 16 - v25;
      v60 = v25 + 16;
      *((_DWORD *)a1 + 1) = v60;
      v61 = (v7 << v59) & v52;
      v62 = *((_DWORD *)a1 + 40);
      v63 = *((unsigned int *)a1 + 2);
      if (v5 + 26 > v62 || 32 * (int)v63 > v62)
      {
        v7 = 0;
        *((_DWORD *)a1 + 2) = v63 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v63));
        *(_DWORD *)a1 = v7;
        *((_DWORD *)a1 + 2) = v63 + 1;
        v61 |= *((_DWORD *)a1 + v59 + 6) & (v7 >> v60);
      }
      v57 = v61;
      *(_BYTE *)(a2 + 18) = v61;
      v19 = v5 + 34;
      *((_DWORD *)a1 + 39) = v5 + 34;
      goto LABEL_82;
    }
  }
  else
  {
    v50 = 8 - v25;
    v51 = v25 + 24;
    *((_DWORD *)a1 + 1) = v25 + 24;
    v52 = *((_DWORD *)a1 + 14);
    v53 = (v7 << (8 - v25)) & v52;
    v54 = *((_DWORD *)a1 + 40);
    v55 = *((unsigned int *)a1 + 2);
    if (v5 + 18 > v54 || 32 * (int)v55 > v54)
    {
      v7 = 0;
      *((_DWORD *)a1 + 2) = v55 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v55));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v55 + 1;
      v53 |= *((_DWORD *)a1 + v50 + 6) & (v7 >> v51);
    }
    v58 = v53;
    *(_BYTE *)(a2 + 17) = v53;
  }
  v60 = v51 - 8;
  v57 = (v7 >> (v51 - 8)) & v52;
  *(_BYTE *)(a2 + 18) = (v7 >> (v51 - 8)) & v52;
  v19 = v5 + 34;
  *((_DWORD *)a1 + 39) = v5 + 34;
  if (v51 - 8 < 8)
  {
    v25 = v51 + 16;
    *((_DWORD *)a1 + 1) = v51 + 16;
    v64 = (v7 << (16 - v51)) & v52;
    v65 = *((_DWORD *)a1 + 40);
    v66 = *((unsigned int *)a1 + 2);
    if (v19 > v65 || 32 * (int)v66 > v65)
    {
      v7 = 0;
      *((_DWORD *)a1 + 2) = v66 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v66));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v66 + 1;
      v64 |= *((_DWORD *)a1 + 16 - v51 + 6) & (v7 >> v25);
    }
    goto LABEL_83;
  }
LABEL_82:
  v25 = v60 - 8;
  *((_DWORD *)a1 + 1) = v25;
  v64 = (v7 >> v25) & v52;
LABEL_83:
  v56 = v64;
  *(_BYTE *)(a2 + 19) = v64;
LABEL_84:
  if (v41 > 5)
    return 7778;
  result = 7778;
  if (v58 && v58 != 3 && v58 <= 8 && v57 && v57 != 3 && v57 <= 0xA && v56 && v56 != 3 && v56 <= 7)
  {
LABEL_94:
    v68 = v19 + 1;
    *((_DWORD *)a1 + 39) = v19 + 1;
    if (v25)
    {
      v69 = v25 - 1;
      v70 = (v25 - 1) & 7;
      if (!v70)
      {
LABEL_105:
        *((_DWORD *)a1 + 1) = v69;
        *((_DWORD *)a1 + 39) = v68 + 32;
        if (v69 >= 0x20)
        {
          v75 = (v7 >> v69) & *((_DWORD *)a1 + 38);
          v69 -= 32;
        }
        else
        {
          v74 = 32 - v69;
          if (v69)
            v75 = (v7 << v74) & *((_DWORD *)a1 + 38);
          else
            v75 = 0;
          v76 = *((_DWORD *)a1 + 40);
          v77 = *((unsigned int *)a1 + 2);
          if (v68 + 32 > v76 || 32 * (int)v77 > v76)
          {
            *((_DWORD *)a1 + 2) = v77 + 1;
            *(_DWORD *)a1 = 0;
          }
          else
          {
            v78 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v77));
            *(_DWORD *)a1 = v78;
            *((_DWORD *)a1 + 2) = v77 + 1;
            v75 |= *((_DWORD *)a1 + v74 + 6) & (v78 >> v69);
          }
        }
        *((_DWORD *)a1 + 1) = v69 + 32;
        if (v69)
        {
          v79 = *((_DWORD *)a1 + 2);
          *((_DWORD *)a1 + 1) = v69;
          *((_DWORD *)a1 + 2) = v79 - 1;
          if (*((_DWORD *)a1 + 40) >= (32 * (v79 - 1)))
            *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v79 - 2)));
        }
        *((_DWORD *)a1 + 39) = v68;
        if (v75 == 434)
        {
          EatUserData((uint64_t)a1);
          v30 = *(unsigned __int8 *)(a2 + 11);
        }
        if (v30 == 1)
        {
          v80 = *((_DWORD *)a1 + 39);
          *((_DWORD *)a1 + 39) = v80 + 24;
          v81 = *((_DWORD *)a1 + 1);
          if (v81 > 0x17)
          {
            v83 = v81 - 24;
            v86 = v80 + 32;
            *((_DWORD *)a1 + 39) = v80 + 32;
            if (v81 - 24 < 8)
            {
              *((_DWORD *)a1 + 1) = v81;
              v87 = (*(_DWORD *)a1 << -(char)v81) & *((_DWORD *)a1 + 14);
              v88 = *((_DWORD *)a1 + 40);
              v89 = *((unsigned int *)a1 + 2);
              if (v86 > v88 || 32 * (int)v89 > v88)
              {
                *((_DWORD *)a1 + 2) = v89 + 1;
                *(_DWORD *)a1 = 0;
              }
              else
              {
                v90 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v89));
                *(_DWORD *)a1 = v90;
                *((_DWORD *)a1 + 2) = v89 + 1;
                v87 |= *((_DWORD *)a1 + 32 - v81 + 6) & (v90 >> v81);
              }
              goto LABEL_131;
            }
          }
          else
          {
            v82 = 0;
            v83 = v81 + 8;
            *((_DWORD *)a1 + 1) = v81 + 8;
            v84 = *((_DWORD *)a1 + 40);
            v85 = *((unsigned int *)a1 + 2);
            if (v80 + 24 <= v84 && 32 * (int)v85 <= v84)
              v82 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v85));
            *((_DWORD *)a1 + 2) = v85 + 1;
            *(_DWORD *)a1 = v82;
            *((_DWORD *)a1 + 39) = v80 + 32;
          }
          *((_DWORD *)a1 + 1) = v83 - 8;
          v87 = (*(_DWORD *)a1 >> (v83 - 8)) & *((_DWORD *)a1 + 14);
LABEL_131:
          result = 0;
          *(_BYTE *)(a2 + 13) = v87;
          return result;
        }
        return 7778;
      }
    }
    else
    {
      *((_DWORD *)a1 + 1) = 31;
      v71 = *((_DWORD *)a1 + 40);
      v72 = *((unsigned int *)a1 + 2);
      if (v68 > v71 || 32 * (int)v72 > v71)
        v7 = 0;
      else
        v7 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v72));
      *(_DWORD *)a1 = v7;
      *((_DWORD *)a1 + 2) = v72 + 1;
      v69 = 31;
      v70 = 7;
    }
    v68 += v70;
    v69 &= 0xFFFFFFF8;
    goto LABEL_105;
  }
  return result;
}

uint64_t CBitStreamDeco::GrabBit(CBitStreamDeco *this)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  BOOL v10;
  unsigned int v11;

  v1 = *((_DWORD *)this + 39) + 1;
  *((_DWORD *)this + 39) = v1;
  v2 = *((_DWORD *)this + 1);
  if (v2)
  {
    v3 = *(_DWORD *)this;
    v4 = v2 - 1;
    *((_DWORD *)this + 1) = v4;
    return (v3 >> v4) & 1;
  }
  else
  {
    *((_DWORD *)this + 1) = 31;
    v6 = *((_DWORD *)this + 40);
    v7 = *((unsigned int *)this + 2);
    v8 = 32 * v7;
    if (v1 <= v6)
    {
      v9 = v8 >= v6;
      v10 = v8 == v6;
    }
    else
    {
      v9 = 1;
      v10 = 0;
    }
    if (!v10 && v9)
    {
      v5 = 0;
      *(_DWORD *)this = 0;
      *((_DWORD *)this + 2) = v7 + 1;
    }
    else
    {
      v11 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v7));
      *(_DWORD *)this = v11;
      *((_DWORD *)this + 2) = v7 + 1;
      return v11 >> 31;
    }
  }
  return v5;
}

uint64_t CBitStreamDeco::NextStartCode(uint64_t this)
{
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v8;

  v1 = *(_DWORD *)(this + 156) + 1;
  *(_DWORD *)(this + 156) = v1;
  v2 = *(_DWORD *)(this + 4);
  if (!v2)
  {
    *(_DWORD *)(this + 4) = 31;
    v5 = *(_DWORD *)(this + 160);
    v6 = *(unsigned int *)(this + 8);
    if (v1 > v5 || 32 * (int)v6 > v5)
      v8 = 0;
    else
      v8 = bswap32(*(_DWORD *)(*(_QWORD *)(this + 16) + 4 * v6));
    *(_DWORD *)this = v8;
    *(_DWORD *)(this + 8) = v6 + 1;
    v3 = 31;
    v4 = 7;
    goto LABEL_11;
  }
  v3 = v2 - 1;
  *(_DWORD *)(this + 4) = v3;
  v4 = v3 & 7;
  if ((v3 & 7) != 0)
  {
LABEL_11:
    *(_DWORD *)(this + 156) = v4 + v1;
    *(_DWORD *)(this + 4) = v3 & 0xFFFFFFF8;
  }
  return this;
}

uint64_t DecHeaderVOL(CBitStreamDeco *this, uint64_t a2)
{
  uint64_t v2;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  int v61;
  int v62;
  unsigned int v63;
  uint64_t v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  unsigned int v68;
  unsigned int v69;
  uint64_t v70;
  unsigned int v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  uint64_t v95;
  unsigned int v96;
  unsigned __int8 v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  uint64_t v102;
  unsigned int v104;
  uint64_t v105;
  unsigned int v107;
  int v108;
  unsigned int v109;
  uint64_t v110;
  int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  int v115;
  unsigned int v116;
  uint64_t v117;
  unsigned int v118;
  uint64_t v119;
  unsigned int v120;
  uint64_t v121;
  int v122;
  int v123;
  unsigned int v124;
  unsigned int v125;
  int v126;
  int v127;
  unsigned int v128;
  uint64_t v129;
  unsigned int v130;
  unsigned int v131;
  uint64_t v132;
  int v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  uint64_t v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  uint64_t v141;
  char v142;
  char v143;
  char v144;
  char v145;
  char v146;
  char v147;
  char v148;
  char v149;
  char v150;
  char v151;
  char v152;

  v2 = *(_QWORD *)(a2 + 24);
  if (*(_BYTE *)(v2 + 21))
    return 0;
  v6 = *((_DWORD *)this + 39);
  *((_DWORD *)this + 39) = v6 + 1;
  v7 = *((_DWORD *)this + 1);
  if (!v7)
  {
    *((_DWORD *)this + 1) = 31;
    v9 = *((_DWORD *)this + 7);
    v17 = 2 * *(_DWORD *)this;
    v18 = *((_DWORD *)this + 40);
    v19 = *((unsigned int *)this + 2);
    v20 = v6 + 1 > v18 || 32 * (int)v19 > v18;
    if (v20)
    {
      v10 = 0;
      LOBYTE(v17) = v17 & v9;
      *((_DWORD *)this + 2) = v19 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v19));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v19 + 1;
      v17 = v9 & (v17 | (v10 >> 31));
    }
    *(_BYTE *)(v2 + 22) = v17;
    *((_DWORD *)this + 39) = v6 + 9;
    v8 = 31;
    goto LABEL_15;
  }
  v8 = v7 - 1;
  v9 = *((_DWORD *)this + 7);
  v10 = *(_DWORD *)this;
  *(_BYTE *)(v2 + 22) = (*(_DWORD *)this >> (v7 - 1)) & v9;
  *((_DWORD *)this + 39) = v6 + 9;
  if (v7 >= 9)
  {
LABEL_15:
    v12 = v8 - 8;
    *((_DWORD *)this + 1) = v12;
    v13 = *((_DWORD *)this + 14);
    v14 = (v10 >> v12) & v13;
    goto LABEL_16;
  }
  v11 = 9 - v7;
  v12 = v7 + 23;
  *((_DWORD *)this + 1) = v7 + 23;
  v13 = *((_DWORD *)this + 14);
  v14 = (v10 << v11) & v13;
  v15 = *((_DWORD *)this + 40);
  v16 = *((unsigned int *)this + 2);
  if (v6 + 9 > v15 || 32 * (int)v16 > v15)
  {
    v10 = 0;
    *((_DWORD *)this + 2) = v16 + 1;
    *(_DWORD *)this = 0;
  }
  else
  {
    v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v16));
    *(_DWORD *)this = v10;
    *((_DWORD *)this + 2) = v16 + 1;
    v14 |= *((_DWORD *)this + v11 + 6) & (v10 >> v12);
  }
LABEL_16:
  *(_BYTE *)(v2 + 23) = v14;
  if (v14 == 18)
    return 7779;
  v21 = v6 + 10;
  *((_DWORD *)this + 39) = v6 + 10;
  if (!v12)
  {
    *((_DWORD *)this + 1) = 31;
    v29 = *((_DWORD *)this + 40);
    v30 = *((unsigned int *)this + 2);
    if (v21 > v29 || 32 * (int)v30 > v29)
    {
      v10 = 0;
      *(_DWORD *)this = 0;
      *((_DWORD *)this + 2) = v30 + 1;
      *(_BYTE *)(v2 + 24) = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v30));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v30 + 1;
      *(_BYTE *)(v2 + 24) = (v10 & 0x80000000) != 0;
      if ((v10 & 0x80000000) != 0)
      {
        *((_DWORD *)this + 39) = v6 + 14;
        v22 = 31;
        goto LABEL_28;
      }
    }
    v22 = 31;
LABEL_32:
    *(_BYTE *)(v2 + 25) = 1;
    goto LABEL_42;
  }
  v22 = v12 - 1;
  *((_DWORD *)this + 1) = v12 - 1;
  v23 = v10 >> (v12 - 1);
  *(_BYTE *)(v2 + 24) = v23 & 1;
  if ((v23 & 1) == 0)
    goto LABEL_32;
  *((_DWORD *)this + 39) = v6 + 14;
  if (v12 < 5)
  {
    v24 = 5 - v12;
    v25 = v12 + 27;
    *((_DWORD *)this + 1) = v25;
    v26 = (v10 << v24) & *((_DWORD *)this + 10);
    v27 = *((_DWORD *)this + 40);
    v28 = *((unsigned int *)this + 2);
    if (v6 + 14 > v27 || 32 * (int)v28 > v27)
    {
      v10 = 0;
      *((_DWORD *)this + 2) = v28 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v28));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v28 + 1;
      v26 |= *((_DWORD *)this + v24 + 6) & (v10 >> v25);
    }
    goto LABEL_34;
  }
LABEL_28:
  v25 = v22 - 4;
  *((_DWORD *)this + 1) = v22 - 4;
  v26 = (v10 >> (v22 - 4)) & *((_DWORD *)this + 10);
LABEL_34:
  *(_BYTE *)(v2 + 25) = v26;
  if (v26 - 1 > 1)
    return 7779;
  v21 = v6 + 17;
  *((_DWORD *)this + 39) = v6 + 17;
  v22 = v25 - 3;
  if (v25 >= 3)
  {
    *((_DWORD *)this + 1) = v22;
    v32 = (v10 >> v22) & *((_DWORD *)this + 9);
  }
  else
  {
    v31 = 3 - v25;
    v22 = v25 + 29;
    *((_DWORD *)this + 1) = v25 + 29;
    v32 = (v10 << (3 - v25)) & *((_DWORD *)this + 9);
    v33 = *((_DWORD *)this + 40);
    v34 = *((unsigned int *)this + 2);
    if (v21 > v33 || 32 * (int)v34 > v33)
    {
      v10 = 0;
      *((_DWORD *)this + 2) = v34 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v34));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v34 + 1;
      v32 |= *((_DWORD *)this + v31 + 6) & (v10 >> v22);
    }
  }
  *(_BYTE *)(v2 + 26) = v32;
LABEL_42:
  v35 = v21 + 4;
  *((_DWORD *)this + 39) = v21 + 4;
  v36 = v22 - 4;
  if (v22 >= 4)
  {
    v38 = *((_DWORD *)this + 10);
    v39 = (v10 >> v36) & v38;
  }
  else
  {
    v37 = 4 - v22;
    v36 = v22 + 28;
    *((_DWORD *)this + 1) = v22 + 28;
    v38 = *((_DWORD *)this + 10);
    v39 = (v10 << (4 - v22)) & v38;
    v40 = *((_DWORD *)this + 40);
    v41 = *((unsigned int *)this + 2);
    if (v35 > v40 || 32 * (int)v41 > v40)
    {
      v10 = 0;
      *((_DWORD *)this + 2) = v41 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v41));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v41 + 1;
      v39 |= *((_DWORD *)this + v37 + 6) & (v10 >> v36);
    }
  }
  *(_BYTE *)(v2 + 27) = v39;
  if (v39 == 15)
  {
    *((_DWORD *)this + 39) = v21 + 12;
    if (v36 > 7)
    {
      v43 = v36 - 8;
      *(_BYTE *)(v2 + 28) = (v10 >> (v36 - 8)) & v13;
      v35 = v21 + 20;
      *((_DWORD *)this + 39) = v21 + 20;
      if (v36 - 8 < 8)
      {
        v47 = 16 - v36;
        v36 += 16;
        *((_DWORD *)this + 1) = v36;
        v48 = (v10 << v47) & v13;
        v49 = *((_DWORD *)this + 40);
        v50 = *((unsigned int *)this + 2);
        if (v35 > v49 || 32 * (int)v50 > v49)
        {
          v10 = 0;
          *((_DWORD *)this + 2) = v50 + 1;
          *(_DWORD *)this = 0;
        }
        else
        {
          v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v50));
          *(_DWORD *)this = v10;
          *((_DWORD *)this + 2) = v50 + 1;
          v48 |= *((_DWORD *)this + v47 + 6) & (v10 >> v36);
        }
        goto LABEL_60;
      }
    }
    else
    {
      v42 = 8 - v36;
      v43 = v36 + 24;
      *((_DWORD *)this + 1) = v36 + 24;
      v44 = (v10 << (8 - v36)) & v13;
      v45 = *((_DWORD *)this + 40);
      v46 = *((unsigned int *)this + 2);
      if (v21 + 12 > v45 || 32 * (int)v46 > v45)
      {
        v10 = 0;
        *((_DWORD *)this + 2) = v46 + 1;
        *(_DWORD *)this = 0;
      }
      else
      {
        v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v46));
        *(_DWORD *)this = v10;
        *((_DWORD *)this + 2) = v46 + 1;
        v44 |= *((_DWORD *)this + v42 + 6) & (v10 >> v43);
      }
      *(_BYTE *)(v2 + 28) = v44;
      v35 = v21 + 20;
      *((_DWORD *)this + 39) = v21 + 20;
    }
    v36 = v43 - 8;
    v48 = (v10 >> (v43 - 8)) & v13;
LABEL_60:
    *(_BYTE *)(v2 + 29) = v48;
  }
  v51 = v35 + 1;
  *((_DWORD *)this + 39) = v35 + 1;
  if (v36)
  {
    v52 = v36 - 1;
    v53 = v10 >> (v36 - 1);
    *(_BYTE *)(v2 + 30) = v53 & 1;
    if ((v53 & 1) == 0)
      goto LABEL_104;
    *((_DWORD *)this + 39) = v35 + 3;
    if (v36 <= 2)
    {
      v54 = 3 - v36;
      v55 = v36 + 29;
      *((_DWORD *)this + 1) = v36 + 29;
      v56 = (v10 << (3 - v36)) & *((_DWORD *)this + 8);
      v57 = *((_DWORD *)this + 40);
      v58 = *((unsigned int *)this + 2);
      if (v35 + 3 > v57 || 32 * (int)v58 > v57)
      {
        v10 = 0;
        *((_DWORD *)this + 2) = v58 + 1;
        *(_DWORD *)this = 0;
      }
      else
      {
        v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v58));
        *(_DWORD *)this = v10;
        *((_DWORD *)this + 2) = v58 + 1;
        v56 |= *((_DWORD *)this + v54 + 6) & (v10 >> v55);
      }
      *(_BYTE *)(v2 + 31) = v56;
      goto LABEL_77;
    }
  }
  else
  {
    *((_DWORD *)this + 1) = 31;
    v59 = *((_DWORD *)this + 40);
    v60 = *((unsigned int *)this + 2);
    if (v51 > v59 || 32 * (int)v60 > v59)
    {
      v10 = 0;
      *(_DWORD *)this = 0;
      *((_DWORD *)this + 2) = v60 + 1;
      *(_BYTE *)(v2 + 30) = 0;
      goto LABEL_84;
    }
    v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v60));
    *(_DWORD *)this = v10;
    *((_DWORD *)this + 2) = v60 + 1;
    *(_BYTE *)(v2 + 30) = (v10 & 0x80000000) != 0;
    v52 = 31;
    if ((v10 & 0x80000000) == 0)
      goto LABEL_85;
  }
  v61 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 39) = v35 + 4;
  v55 = v52 - 2;
  *(_BYTE *)(v2 + 31) = (v10 >> v55) & v61;
  if (!v55)
  {
    *((_DWORD *)this + 1) = 31;
    v62 = 2 * v10;
    v63 = *((_DWORD *)this + 40);
    v64 = *((unsigned int *)this + 2);
    if (v35 + 4 > v63 || 32 * (int)v64 > v63)
    {
      v10 = 0;
      LOBYTE(v9) = v62 & v9;
      *((_DWORD *)this + 2) = v64 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v64));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v64 + 1;
      v9 &= v62 | (v10 >> 31);
    }
    *(_BYTE *)(v2 + 32) = v9;
    v51 = v35 + 5;
    *((_DWORD *)this + 39) = v35 + 5;
    v65 = 31;
    goto LABEL_88;
  }
LABEL_77:
  v51 = v35 + 5;
  *((_DWORD *)this + 39) = v35 + 5;
  v65 = v55 - 1;
  *(_BYTE *)(v2 + 32) = (v10 >> (v55 - 1)) & v9;
  if (v55 == 1)
  {
    *((_DWORD *)this + 1) = 31;
    v66 = *((_DWORD *)this + 40);
    v67 = *((unsigned int *)this + 2);
    if (v51 <= v66 && 32 * (int)v67 <= v66)
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v67));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v67 + 1;
      *(_BYTE *)(v2 + 33) = (v10 & 0x80000000) != 0;
      v52 = 31;
      if ((v10 & 0x80000000) != 0)
      {
LABEL_94:
        v65 = v52 - 31;
        goto LABEL_95;
      }
LABEL_85:
      *((_DWORD *)this + 39) = v51 + 2;
LABEL_108:
      v77 = v52 - 2;
      *((_DWORD *)this + 1) = v52 - 2;
      v78 = (v10 >> (v52 - 2)) & *((_DWORD *)this + 8);
      goto LABEL_109;
    }
    v10 = 0;
    *(_DWORD *)this = 0;
    *((_DWORD *)this + 2) = v67 + 1;
    *(_BYTE *)(v2 + 33) = 0;
LABEL_84:
    v52 = 31;
    goto LABEL_85;
  }
LABEL_88:
  v52 = v65 - 1;
  v68 = v10 >> (v65 - 1);
  *(_BYTE *)(v2 + 33) = v68 & 1;
  if ((v68 & 1) == 0)
    goto LABEL_104;
  *((_DWORD *)this + 39) = v35 + 36;
  if (v52 >= 0x1F)
    goto LABEL_94;
  v10 = 0;
  *((_DWORD *)this + 1) = v65;
  v69 = *((_DWORD *)this + 40);
  v70 = *((unsigned int *)this + 2);
  if (v35 + 36 <= v69 && 32 * (int)v70 <= v69)
    v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v70));
  *((_DWORD *)this + 2) = v70 + 1;
  *(_DWORD *)this = v10;
LABEL_95:
  *((_DWORD *)this + 39) = v35 + 67;
  v71 = v65 - 31;
  if (v65 < 0x1F)
  {
    v10 = 0;
    v71 = v65 + 1;
    *((_DWORD *)this + 1) = v65 + 1;
    v72 = *((_DWORD *)this + 40);
    v73 = *((unsigned int *)this + 2);
    if (v35 + 67 <= v72 && 32 * (int)v73 <= v72)
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v73));
    *((_DWORD *)this + 2) = v73 + 1;
    *(_DWORD *)this = v10;
  }
  v51 = v35 + 84;
  *((_DWORD *)this + 39) = v35 + 84;
  v52 = v71 - 17;
  if (v71 < 0x11)
  {
    v52 = v71 + 15;
    *((_DWORD *)this + 1) = v71 + 15;
    v74 = *((_DWORD *)this + 40);
    v75 = *((unsigned int *)this + 2);
    if (v51 > v74 || 32 * (int)v75 > v74)
    {
      v10 = 0;
      *((_DWORD *)this + 2) = v75 + 1;
      *(_DWORD *)this = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v75));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v75 + 1;
    }
    goto LABEL_85;
  }
LABEL_104:
  *((_DWORD *)this + 39) = v51 + 2;
  if (v52 >= 2)
    goto LABEL_108;
  v76 = 2 - v52;
  v77 = v52 + 30;
  *((_DWORD *)this + 1) = v52 + 30;
  v78 = (v10 << (2 - v52)) & *((_DWORD *)this + 8);
  v79 = *((_DWORD *)this + 40);
  v80 = *((unsigned int *)this + 2);
  if (v51 + 2 > v79 || 32 * (int)v80 > v79)
  {
    v10 = 0;
    *((_DWORD *)this + 2) = v80 + 1;
    *(_DWORD *)this = 0;
  }
  else
  {
    v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v80));
    *(_DWORD *)this = v10;
    *((_DWORD *)this + 2) = v80 + 1;
    v78 |= *((_DWORD *)this + v76 + 6) & (v10 >> v77);
  }
LABEL_109:
  *(_BYTE *)(v2 + 48) = v78;
  if (v78 == 3 && *(_BYTE *)(v2 + 25) != 1)
  {
    v89 = v51 + 6;
    *((_DWORD *)this + 39) = v89;
    v90 = v77 - 4;
    if (v77 >= 4)
    {
      *((_DWORD *)this + 1) = v90;
      v93 = (v10 >> v90) & v38;
    }
    else
    {
      v91 = 4 - v77;
      v92 = v77 + 28;
      *((_DWORD *)this + 1) = v92;
      v93 = (v10 << v91) & v38;
      v94 = *((_DWORD *)this + 40);
      v95 = *((unsigned int *)this + 2);
      if (v89 > v94 || 32 * (int)v95 > v94)
      {
        *((_DWORD *)this + 2) = v95 + 1;
        *(_DWORD *)this = 0;
      }
      else
      {
        v96 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v95));
        *(_DWORD *)this = v96;
        *((_DWORD *)this + 2) = v95 + 1;
        v93 |= *((_DWORD *)this + v91 + 6) & (v96 >> v92);
      }
    }
    *(_BYTE *)(v2 + 49) = v93;
    return 7779;
  }
  *((_DWORD *)this + 39) = v51 + 3;
  if (!v77)
  {
    v10 = 0;
    *((_DWORD *)this + 1) = 31;
    v86 = *((_DWORD *)this + 40);
    v87 = *((unsigned int *)this + 2);
    if (v51 + 3 <= v86 && 32 * (int)v87 <= v86)
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v87));
    *(_DWORD *)this = v10;
    *((_DWORD *)this + 2) = v87 + 1;
    v88 = 31;
    goto LABEL_125;
  }
  *((_DWORD *)this + 39) = v51 + 19;
  if (v77 >= 0x11)
  {
    v88 = v77 - 1;
LABEL_125:
    v82 = v88 - 16;
    v83 = (v10 >> (v88 - 16)) & *((_DWORD *)this + 22);
    goto LABEL_126;
  }
  v81 = 17 - v77;
  v82 = v77 + 15;
  *((_DWORD *)this + 1) = v77 + 15;
  v83 = (v10 << (17 - v77)) & *((_DWORD *)this + 22);
  v84 = *((_DWORD *)this + 40);
  v85 = *((unsigned int *)this + 2);
  if (v51 + 19 > v84 || 32 * (int)v85 > v84)
  {
    v10 = 0;
    *((_DWORD *)this + 2) = v85 + 1;
    *(_DWORD *)this = 0;
  }
  else
  {
    v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v85));
    *(_DWORD *)this = v10;
    *((_DWORD *)this + 2) = v85 + 1;
    v83 |= *((_DWORD *)this + v81 + 6) & (v10 >> v82);
  }
LABEL_126:
  *(_WORD *)(v2 + 50) = v83;
  v97 = 1;
  *(_BYTE *)(v2 + 52) = 1;
  v98 = (unsigned __int16)v83 >> 1;
  if (v98)
  {
    v97 = 1;
    do
    {
      ++v97;
      v20 = v98 > 1;
      v98 >>= 1;
    }
    while (v20);
    *(_BYTE *)(v2 + 52) = v97;
  }
  *((_DWORD *)this + 39) = v51 + 20;
  if (!v82)
  {
    *((_DWORD *)this + 1) = 31;
    v104 = *((_DWORD *)this + 40);
    v105 = *((unsigned int *)this + 2);
    if (v51 + 20 > v104 || 32 * (int)v105 > v104)
      v10 = 0;
    else
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v105));
    *(_DWORD *)this = v10;
    *((_DWORD *)this + 2) = v105 + 1;
    v99 = v51 + 21;
    *((_DWORD *)this + 39) = v51 + 21;
    v100 = 31;
    goto LABEL_145;
  }
  v99 = v51 + 21;
  *((_DWORD *)this + 39) = v51 + 21;
  v100 = v82 - 1;
  if (v100)
  {
LABEL_145:
    v124 = v100 - 1;
    *((_DWORD *)this + 1) = v124;
    v123 = (v10 >> v124) & 1;
    goto LABEL_146;
  }
  *((_DWORD *)this + 1) = 31;
  v101 = *((_DWORD *)this + 40);
  v102 = *((unsigned int *)this + 2);
  if (v99 > v101 || 32 * (int)v102 > v101)
  {
    v10 = 0;
    *(_DWORD *)this = 0;
    *((_DWORD *)this + 2) = v102 + 1;
    *(_BYTE *)(v2 + 53) = 0;
    v124 = 31;
    goto LABEL_160;
  }
  v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v102));
  *(_DWORD *)this = v10;
  *((_DWORD *)this + 2) = v102 + 1;
  v123 = v10 >> 31;
  v124 = 31;
LABEL_146:
  *(_BYTE *)(v2 + 53) = v123;
  if (v123)
  {
    v99 += v97;
    *((_DWORD *)this + 39) = v99;
    if (v124 >= v97)
    {
      v124 -= v97;
      *((_DWORD *)this + 1) = v124;
      v108 = (v10 >> v124) & *((_DWORD *)this + v97 + 6);
    }
    else
    {
      v107 = v97 - v124;
      v124 = 32 - v107;
      *((_DWORD *)this + 1) = 32 - v107;
      if (v107 <= 0x1F)
        v108 = (v10 << v107) & *((_DWORD *)this + v97 + 6);
      else
        v108 = 0;
      v109 = *((_DWORD *)this + 40);
      v110 = *((unsigned int *)this + 2);
      if (v99 > v109 || 32 * (int)v110 > v109)
      {
        v10 = 0;
        *((_DWORD *)this + 2) = v110 + 1;
        *(_DWORD *)this = 0;
      }
      else
      {
        v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v110));
        *(_DWORD *)this = v10;
        *((_DWORD *)this + 2) = v110 + 1;
        v108 |= *((_DWORD *)this + v107 + 6) & (v10 >> v124);
      }
    }
    *(_WORD *)(v2 + 54) = v108;
  }
LABEL_160:
  if (v78 == 2)
    return 7779;
  if (!(_BYTE)v78)
  {
    *((_DWORD *)this + 39) = v99 + 1;
    if (v124)
    {
      v111 = v124 - 1;
      *((_DWORD *)this + 1) = v124 - 1;
      *((_DWORD *)this + 39) = v99 + 14;
      if (v124 <= 0xD)
      {
        v112 = 14 - v124;
        v113 = v124 + 18;
        *((_DWORD *)this + 1) = v124 + 18;
        v114 = *((_DWORD *)this + 19);
        v115 = (v10 << v112) & v114;
        v116 = *((_DWORD *)this + 40);
        v117 = *((unsigned int *)this + 2);
        if (v99 + 14 > v116 || 32 * (int)v117 > v116)
        {
          v10 = 0;
          *((_DWORD *)this + 2) = v117 + 1;
          *(_DWORD *)this = 0;
        }
        else
        {
          v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v117));
          *(_DWORD *)this = v10;
          *((_DWORD *)this + 2) = v117 + 1;
          v115 |= *((_DWORD *)this + v112 + 6) & (v10 >> v113);
        }
        *(_WORD *)(v2 + 56) = v115;
        goto LABEL_181;
      }
    }
    else
    {
      v10 = 0;
      *((_DWORD *)this + 1) = 31;
      v118 = *((_DWORD *)this + 40);
      v119 = *((unsigned int *)this + 2);
      if (v99 + 1 <= v118 && 32 * (int)v119 <= v118)
        v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v119));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v119 + 1;
      v111 = 31;
    }
    *((_DWORD *)this + 39) = v99 + 15;
    v113 = v111 - 13;
    *((_DWORD *)this + 1) = v113;
    v114 = *((_DWORD *)this + 19);
    *(_WORD *)(v2 + 56) = (v10 >> v113) & v114;
    if (!v113)
    {
      v10 = 0;
      *((_DWORD *)this + 1) = 31;
      v120 = *((_DWORD *)this + 40);
      v121 = *((unsigned int *)this + 2);
      if (v99 + 15 <= v120 && 32 * (int)v121 <= v120)
        v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v121));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v121 + 1;
      v122 = 31;
      goto LABEL_185;
    }
LABEL_181:
    v122 = v113 - 1;
    *((_DWORD *)this + 1) = v113 - 1;
    *((_DWORD *)this + 39) = v99 + 28;
    if (v113 - 1 <= 0xC)
    {
      v125 = 14 - v113;
      v126 = v113 + 18;
      *((_DWORD *)this + 1) = v126;
      v127 = (v10 << v125) & v114;
      v128 = *((_DWORD *)this + 40);
      v129 = *((unsigned int *)this + 2);
      if (v99 + 28 > v128 || 32 * (int)v129 > v128)
      {
        v10 = 0;
        *((_DWORD *)this + 2) = v129 + 1;
        *(_DWORD *)this = 0;
      }
      else
      {
        v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v129));
        *(_DWORD *)this = v10;
        *((_DWORD *)this + 2) = v129 + 1;
        v127 |= *((_DWORD *)this + v125 + 6) & (v10 >> v126);
      }
      *(_WORD *)(v2 + 58) = v127;
      v130 = v99 + 29;
LABEL_192:
      v124 = v126 - 1;
      *((_DWORD *)this + 1) = v126 - 1;
      v99 = v130;
      goto LABEL_193;
    }
LABEL_185:
    v130 = v99 + 29;
    *((_DWORD *)this + 39) = v99 + 29;
    v126 = v122 - 13;
    *((_DWORD *)this + 1) = v122 - 13;
    *(_WORD *)(v2 + 58) = (v10 >> (v122 - 13)) & v114;
    if (v122 == 13)
    {
      v10 = 0;
      *((_DWORD *)this + 1) = 31;
      v131 = *((_DWORD *)this + 40);
      v132 = *((unsigned int *)this + 2);
      if (v130 <= v131 && 32 * (int)v132 <= v131)
        v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v132));
      *(_DWORD *)this = v10;
      *((_DWORD *)this + 2) = v132 + 1;
      *((_DWORD *)this + 39) = v99 + 30;
      v124 = 31;
      v99 += 29;
      goto LABEL_194;
    }
    goto LABEL_192;
  }
LABEL_193:
  *((_DWORD *)this + 39) = v99 + 1;
  if (v124)
  {
LABEL_194:
    v133 = v124 - 1;
    *((_DWORD *)this + 1) = v133;
    v134 = (v10 >> v133) & 1;
    goto LABEL_195;
  }
  *((_DWORD *)this + 1) = 31;
  v140 = *((_DWORD *)this + 40);
  v141 = *((unsigned int *)this + 2);
  if (v99 + 1 > v140 || 32 * (int)v141 > v140)
  {
    v10 = 0;
    *(_DWORD *)this = 0;
    *((_DWORD *)this + 2) = v141 + 1;
    *(_BYTE *)(v2 + 60) = 0;
    *((_DWORD *)this + 39) = v99 + 2;
    v133 = 31;
LABEL_204:
    *((_DWORD *)this + 1) = v133 - 1;
    v139 = (v10 >> (v133 - 1)) & 1;
    goto LABEL_205;
  }
  v10 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v141));
  *(_DWORD *)this = v10;
  *((_DWORD *)this + 2) = v141 + 1;
  v134 = v10 >> 31;
  v133 = 31;
LABEL_195:
  *(_BYTE *)(v2 + 60) = v134;
  if (v134)
    return 7779;
  v135 = v99 + 2;
  *((_DWORD *)this + 39) = v135;
  if (v133)
    goto LABEL_204;
  *((_DWORD *)this + 1) = 31;
  v136 = *((_DWORD *)this + 40);
  v137 = *((unsigned int *)this + 2);
  if (v135 > v136 || 32 * (int)v137 > v136)
  {
    *(_DWORD *)this = 0;
    *((_DWORD *)this + 2) = v137 + 1;
    *(_BYTE *)(v2 + 61) = 0;
    return 7779;
  }
  v138 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v137));
  *(_DWORD *)this = v138;
  *((_DWORD *)this + 2) = v137 + 1;
  v139 = v138 >> 31;
LABEL_205:
  *(_BYTE *)(v2 + 61) = v139;
  if (!v139)
    return 7779;
  v142 = *(_BYTE *)(v2 + 25) == 1 ? CBitStreamDeco::GrabBit(this) : CBitStreamDeco::GrabBits(this, 2u);
  *(_BYTE *)(v2 + 90) = v142;
  if (v142)
    return 7779;
  if (*(_BYTE *)(v2 + 25) != 1)
  {
    if (*(_BYTE *)(v2 + 48))
    {
      v143 = CBitStreamDeco::GrabBit(this);
      *(_BYTE *)(v2 + 132) = v143;
      if (!v143)
        return 7779;
    }
  }
  v144 = CBitStreamDeco::GrabBit(this);
  *(_BYTE *)(v2 + 134) = v144;
  if (v144 == 1)
  {
    *(_BYTE *)(v2 + 135) = CBitStreamDeco::GrabBits(this, 4u);
    *(_BYTE *)(v2 + 136) = CBitStreamDeco::GrabBits(this, 4u);
    return 7779;
  }
  *(_WORD *)(v2 + 135) = 2053;
  SetIntraPredictorDefaultDCValue(*(_QWORD *)(a2 + 584), 8);
  if (*(_BYTE *)(v2 + 48) == 3)
    return 7779;
  v145 = CBitStreamDeco::GrabBit(this);
  *(_BYTE *)(v2 + 137) = v145;
  if (v145 == 1)
    return 7779;
  if (*(_BYTE *)(v2 + 25) != 1)
  {
    v146 = CBitStreamDeco::GrabBit(this);
    *(_BYTE *)(v2 + 140) = v146;
    if (v146)
      return 7779;
  }
  v147 = CBitStreamDeco::GrabBit(this);
  *(_BYTE *)(v2 + 141) = v147;
  if (!v147)
    DefineVOPComplexityEstimationHeader((uint64_t)this, (_BYTE *)v2);
  *(_BYTE *)(v2 + 142) = CBitStreamDeco::GrabBit(this);
  v148 = CBitStreamDeco::GrabBit(this);
  *(_BYTE *)(v2 + 143) = v148;
  if (v148 == 1)
  {
    *(_BYTE *)(a2 + 968) = 0;
    v149 = CBitStreamDeco::GrabBit(this);
    *(_BYTE *)(v2 + 144) = v149;
    if (v149 == 1)
      *(_BYTE *)(a2 + 968) = 1;
  }
  if (*(_BYTE *)(v2 + 25) == 1)
  {
    *(_WORD *)(v2 + 145) = 0;
  }
  else
  {
    v151 = CBitStreamDeco::GrabBit(this);
    *(_BYTE *)(v2 + 145) = v151;
    if (v151)
      return 7779;
    v152 = CBitStreamDeco::GrabBit(this);
    *(_BYTE *)(v2 + 146) = v152;
    if (v152)
      return 7779;
  }
  v150 = CBitStreamDeco::GrabBit(this);
  *(_BYTE *)(v2 + 147) = v150;
  if (v150 == 1)
    return 7779;
  CBitStreamDeco::NextStartCode((uint64_t)this);
  if (CBitStreamDeco::PeekBits(this, 0x20u) == 434)
    EatUserData((uint64_t)this);
  if (*(_BYTE *)(v2 + 90) == 1)
    return 7779;
  else
    return 0;
}

uint64_t DefineVOPComplexityEstimationHeader(uint64_t result, _BYTE *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  int v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  int v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  int v65;
  unsigned int v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  uint64_t v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  unsigned int v90;
  int v91;
  unsigned int v92;
  uint64_t v93;
  unsigned int v94;
  int v95;
  int v96;
  unsigned int v97;
  uint64_t v98;
  unsigned int v99;
  unsigned int v100;
  uint64_t v101;
  unsigned int v102;
  int v103;
  int v104;
  unsigned int v105;
  uint64_t v106;
  unsigned int v107;
  unsigned int v108;
  uint64_t v109;
  unsigned int v110;
  int v111;
  unsigned int v112;
  uint64_t v113;
  int v114;
  unsigned int v115;
  uint64_t v116;
  unsigned int v117;
  unsigned int v118;
  uint64_t v119;
  unsigned int v120;
  int v121;
  unsigned int v122;
  uint64_t v123;
  unsigned int v124;
  unsigned int v125;
  int v126;

  v2 = *(_DWORD *)(result + 156);
  *(_DWORD *)(result + 156) = v2 + 2;
  v3 = *(unsigned int *)(result + 4);
  if (v3 >= 2)
  {
    v5 = v3 - 2;
    *(_DWORD *)(result + 4) = v5;
    v10 = *(_DWORD *)result;
    v6 = (*(_DWORD *)result >> v5) & *(_DWORD *)(result + 32);
  }
  else
  {
    v4 = 2 - v3;
    v5 = v3 + 30;
    *(_DWORD *)(result + 4) = v5;
    v6 = (*(_DWORD *)result << v4) & *(_DWORD *)(result + 32);
    v7 = *(_DWORD *)(result + 160);
    v8 = *(unsigned int *)(result + 8);
    if (v2 + 2 > v7 || 32 * (int)v8 > v7)
    {
      v10 = 0;
      *(_DWORD *)(result + 8) = v8 + 1;
      *(_DWORD *)result = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v8));
      *(_DWORD *)result = v10;
      *(_DWORD *)(result + 8) = v8 + 1;
      v6 |= *(_DWORD *)(result + 4 * v4 + 24) & (v10 >> v5);
    }
  }
  a2[62] = v6;
  if ((v6 & 0xFE) != 0)
    return result;
  v11 = v2 + 3;
  *(_DWORD *)(result + 156) = v2 + 3;
  if (v5)
  {
    v12 = v5 - 1;
    v13 = (v10 >> (v5 - 1)) & 1;
  }
  else
  {
    *(_DWORD *)(result + 4) = 31;
    v14 = *(_DWORD *)(result + 160);
    v15 = *(unsigned int *)(result + 8);
    if (v11 > v14 || 32 * (int)v15 > v14)
    {
      v10 = 0;
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v15 + 1;
      a2[63] = 0;
      v12 = 31;
      goto LABEL_21;
    }
    v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v15));
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v15 + 1;
    v13 = v10 >> 31;
    v12 = 31;
  }
  a2[63] = v13;
  if (v13)
    goto LABEL_58;
  *(_DWORD *)(result + 156) = v2 + 4;
  if (!v12)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v21 = *(_DWORD *)(result + 160);
    v22 = *(unsigned int *)(result + 8);
    if (v2 + 4 > v21)
    {
      LOBYTE(v23) = 0;
    }
    else
    {
      LOBYTE(v23) = 0;
      if (32 * (int)v22 <= v21)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v22));
        v23 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v22 + 1;
    a2[64] = v23;
    v17 = 31;
    goto LABEL_32;
  }
LABEL_21:
  *(_DWORD *)(result + 156) = v2 + 5;
  v17 = v12 - 1;
  a2[64] = (v10 >> (v12 - 1)) & 1;
  if (v12 == 1)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v18 = *(_DWORD *)(result + 160);
    v19 = *(unsigned int *)(result + 8);
    if (v2 + 5 > v18)
    {
      LOBYTE(v20) = 0;
    }
    else
    {
      LOBYTE(v20) = 0;
      if (32 * (int)v19 <= v18)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v19));
        v20 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v19 + 1;
    a2[65] = v20;
    v24 = 31;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(result + 156) = v2 + 6;
  v24 = v17 - 1;
  a2[65] = (v10 >> v24) & 1;
  if (!v24)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v29 = *(_DWORD *)(result + 160);
    v30 = *(unsigned int *)(result + 8);
    if (v2 + 6 > v29)
    {
      LOBYTE(v31) = 0;
    }
    else
    {
      LOBYTE(v31) = 0;
      if (32 * (int)v30 <= v29)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v30));
        v31 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v30 + 1;
    a2[66] = v31;
    v25 = 31;
    goto LABEL_44;
  }
LABEL_33:
  *(_DWORD *)(result + 156) = v2 + 7;
  v25 = v24 - 1;
  a2[66] = (v10 >> v25) & 1;
  if (!v25)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v26 = *(_DWORD *)(result + 160);
    v27 = *(unsigned int *)(result + 8);
    if (v2 + 7 > v26)
    {
      LOBYTE(v28) = 0;
    }
    else
    {
      LOBYTE(v28) = 0;
      if (32 * (int)v27 <= v26)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v27));
        v28 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v27 + 1;
    a2[67] = v28;
    v32 = 31;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(result + 156) = v2 + 8;
  v32 = v25 - 1;
  a2[67] = (v10 >> v32) & 1;
  if (!v32)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v37 = *(_DWORD *)(result + 160);
    v38 = *(unsigned int *)(result + 8);
    if (v2 + 8 > v37)
    {
      LOBYTE(v39) = 0;
    }
    else
    {
      LOBYTE(v39) = 0;
      if (32 * (int)v38 <= v37)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v38));
        v39 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v38 + 1;
    a2[68] = v39;
    v11 = v2 + 9;
    *(_DWORD *)(result + 156) = v2 + 9;
    v33 = 31;
    goto LABEL_56;
  }
LABEL_45:
  v11 = v2 + 9;
  *(_DWORD *)(result + 156) = v2 + 9;
  v33 = v32 - 1;
  a2[68] = (v10 >> (v32 - 1)) & 1;
  if (v32 == 1)
  {
    *(_DWORD *)(result + 4) = 31;
    v34 = *(_DWORD *)(result + 160);
    v35 = *(unsigned int *)(result + 8);
    if (v11 > v34 || 32 * (int)v35 > v34)
    {
      v10 = 0;
      LOBYTE(v36) = 0;
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v35 + 1;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v35));
      *(_DWORD *)result = v10;
      *(_DWORD *)(result + 8) = v35 + 1;
      v36 = v10 >> 31;
    }
    v12 = 31;
    goto LABEL_57;
  }
LABEL_56:
  v12 = v33 - 1;
  v36 = (v10 >> (v33 - 1)) & 1;
LABEL_57:
  a2[69] = v36;
LABEL_58:
  v40 = v11 + 1;
  *(_DWORD *)(result + 156) = v11 + 1;
  if (v12)
  {
    v41 = v12 - 1;
    v42 = (v10 >> v41) & 1;
  }
  else
  {
    *(_DWORD *)(result + 4) = 31;
    v43 = *(_DWORD *)(result + 160);
    v44 = *(unsigned int *)(result + 8);
    if (v40 > v43 || 32 * (int)v44 > v43)
    {
      v10 = 0;
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v44 + 1;
      a2[70] = 0;
      v41 = 31;
      goto LABEL_69;
    }
    v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v44));
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v44 + 1;
    v42 = v10 >> 31;
    v41 = 31;
  }
  a2[70] = v42;
  if (v42)
    goto LABEL_91;
  *(_DWORD *)(result + 156) = v11 + 2;
  if (!v41)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v45 = *(_DWORD *)(result + 160);
    v46 = *(unsigned int *)(result + 8);
    if (v11 + 2 > v45)
    {
      LOBYTE(v47) = 0;
    }
    else
    {
      LOBYTE(v47) = 0;
      if (32 * (int)v46 <= v45)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v46));
        v47 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v46 + 1;
    a2[71] = v47;
    v48 = 31;
    goto LABEL_77;
  }
LABEL_69:
  *(_DWORD *)(result + 156) = v11 + 3;
  v48 = v41 - 1;
  a2[71] = (v10 >> (v41 - 1)) & 1;
  if (v41 == 1)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v49 = *(_DWORD *)(result + 160);
    v50 = *(unsigned int *)(result + 8);
    if (v11 + 3 > v49)
    {
      LOBYTE(v51) = 0;
    }
    else
    {
      LOBYTE(v51) = 0;
      if (32 * (int)v50 <= v49)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v50));
        v51 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v50 + 1;
    a2[72] = v51;
    v52 = 31;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(result + 156) = v11 + 4;
  v52 = v48 - 1;
  a2[72] = (v10 >> v52) & 1;
  if (!v52)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v57 = *(_DWORD *)(result + 160);
    v58 = *(unsigned int *)(result + 8);
    if (v11 + 4 > v57)
    {
      LOBYTE(v59) = 0;
    }
    else
    {
      LOBYTE(v59) = 0;
      if (32 * (int)v58 <= v57)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v58));
        v59 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v58 + 1;
    a2[73] = v59;
    v40 = v11 + 5;
    v53 = 31;
    goto LABEL_89;
  }
LABEL_78:
  v40 = v11 + 5;
  *(_DWORD *)(result + 156) = v11 + 5;
  v53 = v52 - 1;
  a2[73] = (v10 >> v53) & 1;
  if (!v53)
  {
    *(_DWORD *)(result + 4) = 31;
    v54 = *(_DWORD *)(result + 160);
    v55 = *(unsigned int *)(result + 8);
    if (v40 > v54 || 32 * (int)v55 > v54)
    {
      v10 = 0;
      LOBYTE(v56) = 0;
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v55 + 1;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v55));
      *(_DWORD *)result = v10;
      *(_DWORD *)(result + 8) = v55 + 1;
      v56 = v10 >> 31;
    }
    v41 = 31;
    goto LABEL_90;
  }
LABEL_89:
  v41 = v53 - 1;
  v56 = (v10 >> (v53 - 1)) & 1;
LABEL_90:
  a2[74] = v56;
LABEL_91:
  *(_DWORD *)(result + 156) = v40 + 1;
  if (!v41)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v66 = *(_DWORD *)(result + 160);
    v67 = *(unsigned int *)(result + 8);
    if (v40 + 1 <= v66 && 32 * (int)v67 <= v66)
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v67));
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v67 + 1;
    v60 = v40 + 2;
    v61 = 31;
    goto LABEL_100;
  }
  v60 = v40 + 2;
  *(_DWORD *)(result + 156) = v40 + 2;
  v61 = v41 - 1;
  if (v41 != 1)
  {
LABEL_100:
    v65 = v61 - 1;
    v64 = (v10 >> v65) & 1;
    goto LABEL_101;
  }
  *(_DWORD *)(result + 4) = 31;
  v62 = *(_DWORD *)(result + 160);
  v63 = *(unsigned int *)(result + 8);
  if (v60 > v62 || 32 * (int)v63 > v62)
  {
    v10 = 0;
    *(_DWORD *)result = 0;
    *(_DWORD *)(result + 8) = v63 + 1;
    a2[75] = 0;
    v65 = 31;
    goto LABEL_107;
  }
  v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v63));
  *(_DWORD *)result = v10;
  *(_DWORD *)(result + 8) = v63 + 1;
  v64 = v10 >> 31;
  v65 = 31;
LABEL_101:
  a2[75] = v64;
  if (v64)
    goto LABEL_129;
  *(_DWORD *)(result + 156) = v40 + 3;
  if (!v65)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v68 = *(_DWORD *)(result + 160);
    v69 = *(unsigned int *)(result + 8);
    if (v40 + 3 > v68)
    {
      LOBYTE(v70) = 0;
    }
    else
    {
      LOBYTE(v70) = 0;
      if (32 * (int)v69 <= v68)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v69));
        v70 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v69 + 1;
    a2[76] = v70;
    v71 = 31;
    goto LABEL_113;
  }
LABEL_107:
  *(_DWORD *)(result + 156) = v40 + 4;
  v71 = v65 - 1;
  a2[76] = (v10 >> (v65 - 1)) & 1;
  if (v65 == 1)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v72 = *(_DWORD *)(result + 160);
    v73 = *(unsigned int *)(result + 8);
    if (v40 + 4 > v72)
    {
      LOBYTE(v74) = 0;
    }
    else
    {
      LOBYTE(v74) = 0;
      if (32 * (int)v73 <= v72)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v73));
        v74 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v73 + 1;
    a2[77] = v74;
    v75 = 31;
    goto LABEL_119;
  }
LABEL_113:
  *(_DWORD *)(result + 156) = v40 + 5;
  v75 = v71 - 1;
  a2[77] = (v10 >> (v71 - 1)) & 1;
  if (v71 == 1)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v76 = *(_DWORD *)(result + 160);
    v77 = *(unsigned int *)(result + 8);
    if (v40 + 5 > v76)
    {
      LOBYTE(v78) = 0;
    }
    else
    {
      LOBYTE(v78) = 0;
      if (32 * (int)v77 <= v76)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v77));
        v78 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v77 + 1;
    a2[78] = v78;
    v60 = v40 + 6;
    *(_DWORD *)(result + 156) = v40 + 6;
    v79 = 31;
    goto LABEL_127;
  }
LABEL_119:
  v60 = v40 + 6;
  *(_DWORD *)(result + 156) = v40 + 6;
  v79 = v75 - 1;
  a2[78] = (v10 >> (v75 - 1)) & 1;
  if (v75 == 1)
  {
    *(_DWORD *)(result + 4) = 31;
    v80 = *(_DWORD *)(result + 160);
    v81 = *(unsigned int *)(result + 8);
    if (v60 > v80 || 32 * (int)v81 > v80)
    {
      v10 = 0;
      LOBYTE(v82) = 0;
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v81 + 1;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v81));
      *(_DWORD *)result = v10;
      *(_DWORD *)(result + 8) = v81 + 1;
      v82 = v10 >> 31;
    }
    v65 = 31;
    goto LABEL_128;
  }
LABEL_127:
  v65 = v79 - 1;
  v82 = (v10 >> (v79 - 1)) & 1;
LABEL_128:
  a2[79] = v82;
LABEL_129:
  v83 = v60 + 1;
  *(_DWORD *)(result + 156) = v60 + 1;
  if (v65)
  {
    v84 = v65 - 1;
    v85 = (v10 >> v84) & 1;
  }
  else
  {
    *(_DWORD *)(result + 4) = 31;
    v86 = *(_DWORD *)(result + 160);
    v87 = *(unsigned int *)(result + 8);
    if (v83 > v86 || 32 * (int)v87 > v86)
    {
      v10 = 0;
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v87 + 1;
      a2[80] = 0;
      v84 = 31;
      goto LABEL_140;
    }
    v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v87));
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v87 + 1;
    v85 = v10 >> 31;
    v84 = 31;
  }
  a2[80] = v85;
  if (v85)
    goto LABEL_174;
  *(_DWORD *)(result + 156) = v60 + 2;
  if (!v84)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v88 = *(_DWORD *)(result + 160);
    v89 = *(unsigned int *)(result + 8);
    if (v60 + 2 > v88)
    {
      LOBYTE(v90) = 0;
    }
    else
    {
      LOBYTE(v90) = 0;
      if (32 * (int)v89 <= v88)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v89));
        v90 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v89 + 1;
    a2[81] = v90;
    v91 = 31;
    goto LABEL_148;
  }
LABEL_140:
  *(_DWORD *)(result + 156) = v60 + 3;
  v91 = v84 - 1;
  a2[81] = (v10 >> (v84 - 1)) & 1;
  if (v84 == 1)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v92 = *(_DWORD *)(result + 160);
    v93 = *(unsigned int *)(result + 8);
    if (v60 + 3 > v92)
    {
      LOBYTE(v94) = 0;
    }
    else
    {
      LOBYTE(v94) = 0;
      if (32 * (int)v93 <= v92)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v93));
        v94 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v93 + 1;
    a2[82] = v94;
    v95 = 31;
    goto LABEL_149;
  }
LABEL_148:
  *(_DWORD *)(result + 156) = v60 + 4;
  v95 = v91 - 1;
  a2[82] = (v10 >> v95) & 1;
  if (!v95)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v100 = *(_DWORD *)(result + 160);
    v101 = *(unsigned int *)(result + 8);
    if (v60 + 4 > v100)
    {
      LOBYTE(v102) = 0;
    }
    else
    {
      LOBYTE(v102) = 0;
      if (32 * (int)v101 <= v100)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v101));
        v102 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v101 + 1;
    a2[83] = v102;
    v96 = 31;
    goto LABEL_160;
  }
LABEL_149:
  *(_DWORD *)(result + 156) = v60 + 5;
  v96 = v95 - 1;
  a2[83] = (v10 >> v96) & 1;
  if (!v96)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v97 = *(_DWORD *)(result + 160);
    v98 = *(unsigned int *)(result + 8);
    if (v60 + 5 > v97)
    {
      LOBYTE(v99) = 0;
    }
    else
    {
      LOBYTE(v99) = 0;
      if (32 * (int)v98 <= v97)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v98));
        v99 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v98 + 1;
    a2[84] = v99;
    v103 = 31;
    goto LABEL_161;
  }
LABEL_160:
  *(_DWORD *)(result + 156) = v60 + 6;
  v103 = v96 - 1;
  a2[84] = (v10 >> (v96 - 1)) & 1;
  if (v96 == 1)
  {
    v10 = 0;
    *(_DWORD *)(result + 4) = 31;
    v108 = *(_DWORD *)(result + 160);
    v109 = *(unsigned int *)(result + 8);
    if (v60 + 6 > v108)
    {
      LOBYTE(v110) = 0;
    }
    else
    {
      LOBYTE(v110) = 0;
      if (32 * (int)v109 <= v108)
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v109));
        v110 = v10 >> 31;
      }
    }
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v109 + 1;
    a2[85] = v110;
    v83 = v60 + 7;
    v104 = 31;
    goto LABEL_172;
  }
LABEL_161:
  v83 = v60 + 7;
  *(_DWORD *)(result + 156) = v60 + 7;
  v104 = v103 - 1;
  a2[85] = (v10 >> (v103 - 1)) & 1;
  if (v103 == 1)
  {
    *(_DWORD *)(result + 4) = 31;
    v105 = *(_DWORD *)(result + 160);
    v106 = *(unsigned int *)(result + 8);
    if (v83 > v105 || 32 * (int)v106 > v105)
    {
      v10 = 0;
      LOBYTE(v107) = 0;
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v106 + 1;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v106));
      *(_DWORD *)result = v10;
      *(_DWORD *)(result + 8) = v106 + 1;
      v107 = v10 >> 31;
    }
    v84 = 31;
    goto LABEL_173;
  }
LABEL_172:
  v84 = v104 - 1;
  v107 = (v10 >> (v104 - 1)) & 1;
LABEL_173:
  a2[86] = v107;
LABEL_174:
  *(_DWORD *)(result + 156) = v83 + 1;
  if (v84)
  {
    v111 = v84 - 1;
    *(_DWORD *)(result + 4) = v84 - 1;
  }
  else
  {
    *(_DWORD *)(result + 4) = 31;
    v112 = *(_DWORD *)(result + 160);
    v113 = *(unsigned int *)(result + 8);
    if (v83 + 1 > v112 || 32 * (int)v113 > v112)
    {
      v10 = 0;
      *(_DWORD *)result = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v113));
      *(_DWORD *)result = v10;
    }
    *(_DWORD *)(result + 8) = v113 + 1;
    v111 = 31;
  }
  if (a2[62] == 1)
  {
    *(_DWORD *)(result + 156) = v83 + 2;
    if (v111)
    {
      v114 = v111 - 1;
      *(_DWORD *)(result + 4) = v114;
      a2[87] = (v10 >> v114) & 1;
      if (((v10 >> v114) & 1) == 0)
        return result;
      *(_DWORD *)(result + 156) = v83 + 3;
      if (!v114)
      {
        v10 = 0;
        *(_DWORD *)(result + 4) = 31;
        v115 = *(_DWORD *)(result + 160);
        v116 = *(unsigned int *)(result + 8);
        if (v83 + 3 > v115)
        {
          LOBYTE(v117) = 0;
        }
        else
        {
          LOBYTE(v117) = 0;
          if (32 * (int)v116 <= v115)
          {
            v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v116));
            v117 = v10 >> 31;
          }
        }
        *(_DWORD *)result = v10;
        *(_DWORD *)(result + 8) = v116 + 1;
        a2[88] = v117;
        *(_DWORD *)(result + 156) = v83 + 4;
        v121 = 31;
        goto LABEL_200;
      }
LABEL_192:
      v120 = v83 + 4;
      *(_DWORD *)(result + 156) = v120;
      v121 = v114 - 1;
      a2[88] = (v10 >> v121) & 1;
      if (!v121)
      {
        *(_DWORD *)(result + 4) = 31;
        v122 = *(_DWORD *)(result + 160);
        v123 = *(unsigned int *)(result + 8);
        if (v120 > v122 || 32 * (int)v123 > v122)
        {
          LOBYTE(v125) = 0;
          *(_DWORD *)result = 0;
          *(_DWORD *)(result + 8) = v123 + 1;
        }
        else
        {
          v124 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v123));
          *(_DWORD *)result = v124;
          *(_DWORD *)(result + 8) = v123 + 1;
          v125 = v124 >> 31;
        }
        goto LABEL_201;
      }
LABEL_200:
      v126 = v121 - 1;
      *(_DWORD *)(result + 4) = v126;
      v125 = (v10 >> v126) & 1;
LABEL_201:
      a2[89] = v125;
      return result;
    }
    *(_DWORD *)(result + 4) = 31;
    v118 = *(_DWORD *)(result + 160);
    v119 = *(unsigned int *)(result + 8);
    if (v83 + 2 > v118 || 32 * (int)v119 > v118)
    {
      *(_DWORD *)result = 0;
      *(_DWORD *)(result + 8) = v119 + 1;
      a2[87] = 0;
      return result;
    }
    v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v119));
    *(_DWORD *)result = v10;
    *(_DWORD *)(result + 8) = v119 + 1;
    a2[87] = (v10 & 0x80000000) != 0;
    if ((v10 & 0x80000000) != 0)
    {
      v114 = 31;
      goto LABEL_192;
    }
  }
  return result;
}

uint64_t DecHeaderGOV(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  int v27;

  v1 = *(_DWORD *)(a1 + 156);
  *(_DWORD *)(a1 + 156) = v1 + 18;
  v2 = *(_DWORD *)(a1 + 4);
  if (v2 > 0x11)
  {
    v7 = v1 + 19;
    *(_DWORD *)(a1 + 156) = v1 + 19;
    v3 = v2 - 18;
    if (!v3)
    {
      *(_DWORD *)(a1 + 4) = 31;
      v8 = *(_DWORD *)(a1 + 160);
      v9 = *(_DWORD *)(a1 + 8);
      v10 = 32 * v9;
      v11 = 30;
LABEL_13:
      if (v7 > v8 || v10 > v8)
        v18 = 0;
      else
        v18 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v9));
      *(_DWORD *)a1 = v18;
      *(_DWORD *)(a1 + 8) = v9 + 1;
      v14 = v1 + 21;
      v19 = v11 - 1;
      v20 = v19 & 7;
      goto LABEL_30;
    }
  }
  else
  {
    v3 = v2 + 14;
    *(_DWORD *)(a1 + 4) = v3;
    v4 = *(_DWORD *)(a1 + 160);
    v5 = *(unsigned int *)(a1 + 8);
    if (v1 + 18 > v4 || 32 * (int)v5 > v4)
      v12 = 0;
    else
      v12 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v5));
    *(_DWORD *)(a1 + 8) = v5 + 1;
    *(_DWORD *)a1 = v12;
  }
  v7 = v1 + 20;
  *(_DWORD *)(a1 + 156) = v1 + 20;
  if (v3 == 1)
  {
    v11 = 31;
    *(_DWORD *)(a1 + 4) = 31;
    v8 = *(_DWORD *)(a1 + 160);
    v9 = *(_DWORD *)(a1 + 8);
    v10 = 32 * v9;
    goto LABEL_13;
  }
  v14 = v1 + 21;
  *(_DWORD *)(a1 + 156) = v14;
  if (v3 == 2)
  {
    *(_DWORD *)(a1 + 4) = 31;
    v15 = *(_DWORD *)(a1 + 160);
    v16 = *(unsigned int *)(a1 + 8);
    if (v14 > v15 || 32 * (int)v16 > v15)
      v21 = 0;
    else
      v21 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v16));
    *(_DWORD *)a1 = v21;
    *(_DWORD *)(a1 + 8) = v16 + 1;
    v19 = 31;
    v20 = 7;
    goto LABEL_30;
  }
  v19 = v3 - 3;
  v20 = v19 & 7;
  if ((v19 & 7) != 0)
  {
LABEL_30:
    v14 += v20;
    v19 &= 0xFFFFFFF8;
  }
  *(_DWORD *)(a1 + 4) = v19;
  *(_DWORD *)(a1 + 156) = v14 + 32;
  if (v19 >= 0x20)
  {
    v23 = (*(_DWORD *)a1 >> v19) & *(_DWORD *)(a1 + 152);
    v19 -= 32;
  }
  else
  {
    v22 = 32 - v19;
    if (v19)
      v23 = (*(_DWORD *)a1 << v22) & *(_DWORD *)(a1 + 152);
    else
      v23 = 0;
    v24 = *(_DWORD *)(a1 + 160);
    v25 = *(unsigned int *)(a1 + 8);
    if (v14 + 32 > v24 || 32 * (int)v25 > v24)
    {
      *(_DWORD *)(a1 + 8) = v25 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v26 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v25));
      *(_DWORD *)a1 = v26;
      *(_DWORD *)(a1 + 8) = v25 + 1;
      v23 |= *(_DWORD *)(a1 + 4 * v22 + 24) & (v26 >> v19);
    }
  }
  *(_DWORD *)(a1 + 4) = v19 + 32;
  if (v19)
  {
    v27 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 4) = v19;
    *(_DWORD *)(a1 + 8) = v27 - 1;
    if (*(_DWORD *)(a1 + 160) >= (32 * (v27 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * (v27 - 2)));
  }
  *(_DWORD *)(a1 + 156) = v14;
  if (v23 == 434)
    EatUserData(a1);
  return 0;
}

uint64_t DecHeaderVOP(CBitStreamDeco *a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v13;
  unsigned int v14;
  uint64_t result;
  unsigned __int8 v16;
  unsigned int i;
  unsigned int v18;
  uint64_t v19;
  unsigned int v21;
  uint64_t v22;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  int v43;
  unsigned int v44;
  int v45;
  int v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  int v52;
  unsigned int v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  unint64_t v63;
  uint64_t v64;
  __int16 v65;
  char v66;
  char v67;
  int v68;
  int v69;

  v4 = *(_QWORD *)(a2 + 24);
  v5 = *((_DWORD *)a1 + 39);
  *((_DWORD *)a1 + 39) = v5 + 2;
  v6 = *((unsigned int *)a1 + 1);
  if (v6 >= 2)
  {
    v8 = v6 - 2;
    *((_DWORD *)a1 + 1) = v6 - 2;
    v13 = *(_DWORD *)a1;
    v9 = (*(_DWORD *)a1 >> (v6 - 2)) & *((_DWORD *)a1 + 8);
  }
  else
  {
    v7 = 2 - v6;
    v8 = v6 + 30;
    *((_DWORD *)a1 + 1) = v6 + 30;
    v9 = (*(_DWORD *)a1 << (2 - v6)) & *((_DWORD *)a1 + 8);
    v10 = *((_DWORD *)a1 + 40);
    v11 = *((unsigned int *)a1 + 2);
    if (v5 + 2 > v10 || 32 * (int)v11 > v10)
    {
      v13 = 0;
      *((_DWORD *)a1 + 2) = v11 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v13 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v11));
      *(_DWORD *)a1 = v13;
      *((_DWORD *)a1 + 2) = v11 + 1;
      v9 |= *((_DWORD *)a1 + v7 + 6) & (v13 >> v8);
    }
  }
  v14 = v9;
  *(_BYTE *)(v4 + 148) = v9;
  if (v9 == 2)
    return 2;
  v16 = 0;
  for (i = v5 + 4; ; ++i)
  {
    *((_DWORD *)a1 + 39) = i - 1;
    if (v8)
      break;
    *((_DWORD *)a1 + 1) = 31;
    v18 = *((_DWORD *)a1 + 40);
    v19 = *((unsigned int *)a1 + 2);
    if (i - 1 > v18 || 32 * (int)v19 > v18)
    {
      v13 = 0;
      *(_BYTE *)(v4 + 150) = v16;
      *(_DWORD *)a1 = 0;
      *((_DWORD *)a1 + 2) = v19 + 1;
      goto LABEL_31;
    }
    v13 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v19));
    *(_DWORD *)a1 = v13;
    *((_DWORD *)a1 + 2) = v19 + 1;
    if ((v13 & 0x80000000) == 0)
    {
      *(_BYTE *)(v4 + 150) = v16;
LABEL_31:
      v8 = 31;
LABEL_32:
      v24 = v8 - 1;
      goto LABEL_33;
    }
    v8 = 31;
LABEL_21:
    ++v16;
  }
  if (((v13 >> --v8) & 1) != 0)
    goto LABEL_21;
  *(_BYTE *)(v4 + 150) = v16;
  *((_DWORD *)a1 + 39) = i;
  if (v8)
    goto LABEL_32;
  *((_DWORD *)a1 + 1) = 31;
  v21 = *((_DWORD *)a1 + 40);
  v22 = *((unsigned int *)a1 + 2);
  if (i > v21 || 32 * (int)v22 > v21)
  {
    v13 = 0;
    *(_DWORD *)a1 = 0;
  }
  else
  {
    v13 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v22));
    *(_DWORD *)a1 = v13;
  }
  *((_DWORD *)a1 + 2) = v22 + 1;
  v24 = 31;
LABEL_33:
  v25 = *(unsigned __int8 *)(v4 + 52);
  v26 = i + v25;
  *((_DWORD *)a1 + 39) = v26;
  v27 = v24 - v25;
  if (v24 >= v25)
  {
    v29 = (v13 >> v27) & *((_DWORD *)a1 + v25 + 6);
  }
  else
  {
    v28 = v25 - v24;
    v27 = 32 - (v25 - v24);
    *((_DWORD *)a1 + 1) = v27;
    if (v25 - v24 <= 0x1F)
      v29 = (v13 << v28) & *((_DWORD *)a1 + v25 + 6);
    else
      v29 = 0;
    v30 = *((_DWORD *)a1 + 40);
    v31 = *((unsigned int *)a1 + 2);
    if (v26 > v30 || 32 * (int)v31 > v30)
    {
      v13 = 0;
      *((_DWORD *)a1 + 2) = v31 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v13 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v31));
      *(_DWORD *)a1 = v13;
      *((_DWORD *)a1 + 2) = v31 + 1;
      v29 |= *((_DWORD *)a1 + v28 + 6) & (v13 >> v27);
    }
  }
  *(_WORD *)(v4 + 152) = v29;
  *((_DWORD *)a1 + 39) = v26 + 1;
  if (v27)
  {
    v32 = v27 - 1;
    *((_DWORD *)a1 + 1) = v32;
  }
  else
  {
    *((_DWORD *)a1 + 1) = 31;
    v33 = *((_DWORD *)a1 + 40);
    v34 = *((unsigned int *)a1 + 2);
    if (v26 + 1 > v33 || 32 * (int)v34 > v33)
    {
      v13 = 0;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v13 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v34));
      *(_DWORD *)a1 = v13;
    }
    *((_DWORD *)a1 + 2) = v34 + 1;
    v32 = 31;
  }
  if (v14 == 2)
  {
    v35 = *(_DWORD *)(a2 + 252) + v16;
  }
  else
  {
    v36 = *(_DWORD *)(a2 + 256);
    v35 = v36 + v16;
    *(_DWORD *)(a2 + 252) = v36;
    *(_DWORD *)(a2 + 256) = v35;
  }
  *(_DWORD *)(a2 + 240) = v35 * *(unsigned __int16 *)(v4 + 50) + (unsigned __int16)v29;
  *((_DWORD *)a1 + 39) = v26 + 2;
  if (v32)
  {
    v37 = v32 - 1;
    *((_DWORD *)a1 + 1) = v32 - 1;
    v38 = (v13 >> (v32 - 1)) & 1;
    goto LABEL_57;
  }
  *((_DWORD *)a1 + 1) = 31;
  v39 = *((_DWORD *)a1 + 40);
  v40 = *((unsigned int *)a1 + 2);
  if (v26 + 2 > v39 || 32 * (int)v40 > v39)
  {
    *(_DWORD *)a1 = 0;
    *((_DWORD *)a1 + 2) = v40 + 1;
    *(_BYTE *)(v4 + 154) = 0;
    v44 = v26 + 3;
    v45 = 30;
    v46 = 6;
LABEL_85:
    result = 0;
    *((_DWORD *)a1 + 39) = v46 + v44;
    *((_DWORD *)a1 + 1) = v45 & 0xFFFFFFF8;
    return result;
  }
  v13 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v40));
  *(_DWORD *)a1 = v13;
  *((_DWORD *)a1 + 2) = v40 + 1;
  v38 = v13 >> 31;
  v37 = 31;
LABEL_57:
  *(_BYTE *)(v4 + 154) = v38;
  if (!v38)
  {
    v44 = v26 + 3;
    *((_DWORD *)a1 + 39) = v26 + 3;
    if (v37)
    {
      v45 = v37 - 1;
      *((_DWORD *)a1 + 1) = v37 - 1;
      v46 = (v37 - 1) & 7;
      if (!v46)
        return 0;
    }
    else
    {
      v56 = 0;
      *((_DWORD *)a1 + 1) = 31;
      v57 = *((_DWORD *)a1 + 40);
      v58 = *((unsigned int *)a1 + 2);
      if (v44 <= v57 && 32 * (int)v58 <= v57)
        v56 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v58));
      *(_DWORD *)a1 = v56;
      *((_DWORD *)a1 + 2) = v58 + 1;
      v45 = 31;
      v46 = 7;
    }
    goto LABEL_85;
  }
  if (*(_BYTE *)(v4 + 145))
    return 7780;
  v41 = *(unsigned __int8 *)(v4 + 48);
  if (v41 != 2 && (v14 == 1 || v14 == 3 && *(_BYTE *)(v4 + 90) == 2))
  {
    v42 = v26 + 3;
    *((_DWORD *)a1 + 39) = v26 + 3;
    if (v37)
    {
      *((_DWORD *)a1 + 1) = v37 - 1;
      v43 = (v13 >> (v37 - 1)) & 1;
    }
    else
    {
      *((_DWORD *)a1 + 1) = 31;
      v60 = *((_DWORD *)a1 + 40);
      v61 = *((unsigned int *)a1 + 2);
      if (v42 > v60 || 32 * (int)v61 > v60)
      {
        LOBYTE(v43) = 0;
        *(_DWORD *)a1 = 0;
        *((_DWORD *)a1 + 2) = v61 + 1;
      }
      else
      {
        v62 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v61));
        *(_DWORD *)a1 = v62;
        *((_DWORD *)a1 + 2) = v61 + 1;
        v43 = v62 >> 31;
      }
    }
  }
  else
  {
    LOBYTE(v43) = 0;
  }
  v47 = 0;
  *(_BYTE *)(v4 + 155) = v43;
  if (v14 <= 1 && !v41 && *(_BYTE *)(v4 + 146))
  {
    v47 = CBitStreamDeco::GrabBit(a1);
    v41 = *(unsigned __int8 *)(v4 + 48);
  }
  *(_BYTE *)(v4 + 157) = v47;
  if (v41)
    return 7780;
  if (!*(_BYTE *)(v4 + 141))
    ReadVOPComplexityEstimationHeader((uint64_t)a1, a2);
  v48 = *((_DWORD *)a1 + 39) + 3;
  *((_DWORD *)a1 + 39) = v48;
  v49 = *((unsigned int *)a1 + 1);
  if (v49 >= 3)
  {
    v59 = v49 - 3;
    *((_DWORD *)a1 + 1) = v59;
    v52 = (*(_DWORD *)a1 >> v59) & *((_DWORD *)a1 + 9);
  }
  else
  {
    v50 = 3 - v49;
    v51 = v49 + 29;
    *((_DWORD *)a1 + 1) = v49 + 29;
    v52 = (*(_DWORD *)a1 << (3 - v49)) & *((_DWORD *)a1 + 9);
    v53 = *((_DWORD *)a1 + 40);
    v54 = *((unsigned int *)a1 + 2);
    if (v48 > v53 || 32 * (int)v54 > v53)
    {
      *((_DWORD *)a1 + 2) = v54 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v55 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v54));
      *(_DWORD *)a1 = v55;
      *((_DWORD *)a1 + 2) = v54 + 1;
      v52 |= *((_DWORD *)a1 + v50 + 6) & (v55 >> v51);
    }
  }
  *(_BYTE *)(v4 + 158) = v52;
  if (*(_BYTE *)(v4 + 60))
    return 7780;
  if (*(unsigned __int8 *)(v4 + 90) - 1 <= 1 && *(_BYTE *)(v4 + 148) == 3)
  {
    if (*(_BYTE *)(v4 + 91))
    {
      v63 = 0;
      do
      {
        v64 = v4 + 4 * v63;
        *(_DWORD *)(v64 + 100) = DecWarpingMV(a1);
        *(_DWORD *)(v64 + 116) = DecWarpingMV(a1);
        ++v63;
      }
      while (v63 < *(unsigned __int8 *)(v4 + 91));
    }
    if (*(_BYTE *)(v4 + 93))
      *(_DWORD *)(v4 + 96) = DecBrightnessChangeFactor(a1);
    if (*(_BYTE *)(v4 + 90) == 1)
      return 7780;
  }
  if (*(_BYTE *)(v4 + 48) == 2)
    return 7780;
  v65 = CBitStreamDeco::GrabBits(a1, *(unsigned __int8 *)(v4 + 135));
  *(_WORD *)(v4 + 160) = v65;
  *(_BYTE *)(v4 + 201) = v65;
  if (*(_BYTE *)(v4 + 48) == 3)
    return 7780;
  v66 = 1;
  if (*(_BYTE *)(v4 + 148))
  {
    v67 = CBitStreamDeco::GrabBits(a1, 3u);
    v68 = 1 << (v67 - 1);
    v69 = 16 << v67;
    if (*(_BYTE *)(v4 + 148) == 2)
      result = 7780;
    else
      result = 0;
    v66 = v67;
  }
  else
  {
    result = 0;
    LOWORD(v69) = 32;
    LOBYTE(v68) = 1;
  }
  *(_BYTE *)(v4 + 162) = v66;
  *(_BYTE *)(v4 + 163) = v68;
  *(_WORD *)(v4 + 164) = v69;
  return result;
}

uint64_t ReadVOPComplexityEstimationHeader(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  int v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  int v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int v66;
  int v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  int v72;
  unsigned int v73;
  uint64_t v74;
  unsigned int v75;
  int v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  int v81;
  unsigned int v82;
  uint64_t v83;
  unsigned int v84;
  int v85;
  unsigned int v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  int v90;
  unsigned int v91;
  uint64_t v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  int v99;
  unsigned int v100;
  uint64_t v101;
  unsigned int v102;
  int v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  int v108;
  unsigned int v109;
  uint64_t v110;
  unsigned int v111;
  int v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  int v117;
  unsigned int v118;
  uint64_t v119;
  unsigned int v120;
  int v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  int v126;
  unsigned int v127;
  uint64_t v128;
  unsigned int v129;
  int v130;
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  int v135;
  unsigned int v136;
  uint64_t v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  int v144;
  unsigned int v145;
  uint64_t v146;
  unsigned int v147;
  int v148;
  unsigned int v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  int v153;
  unsigned int v154;
  uint64_t v155;
  unsigned int v156;
  int v157;
  unsigned int v158;
  uint64_t v159;
  uint64_t v160;
  char v161;
  int v162;
  unsigned int v163;
  uint64_t v164;
  unsigned int v165;
  int v166;
  unsigned int v167;
  uint64_t v168;
  uint64_t v169;
  char v170;
  int v171;
  unsigned int v172;
  uint64_t v173;
  unsigned int v174;
  int v175;
  unsigned int v176;
  uint64_t v177;
  uint64_t v178;
  char v179;
  int v180;
  unsigned int v181;
  uint64_t v182;
  unsigned int v183;
  int v184;
  unsigned int v185;
  uint64_t v186;
  uint64_t v187;
  char v188;
  int v189;
  unsigned int v190;
  uint64_t v191;
  unsigned int v192;
  int v193;
  unsigned int v194;
  uint64_t v195;
  uint64_t v196;
  char v197;
  int v198;
  unsigned int v199;
  uint64_t v200;
  unsigned int v201;
  int v202;
  unsigned int v203;
  uint64_t v204;
  uint64_t v205;
  char v206;
  int v207;
  unsigned int v208;
  uint64_t v209;
  unsigned int v210;
  int v211;
  unsigned int v212;
  uint64_t v213;
  uint64_t v214;
  char v215;
  int v216;
  unsigned int v217;
  uint64_t v218;
  unsigned int v219;
  int v220;
  unsigned int v221;
  uint64_t v222;
  uint64_t v223;
  char v224;
  int v225;
  unsigned int v226;
  uint64_t v227;
  unsigned int v228;
  int v229;
  unsigned int v230;
  uint64_t v231;
  uint64_t v232;
  char v233;
  int v234;
  unsigned int v235;
  uint64_t v236;
  unsigned int v237;
  int v238;
  unsigned int v239;
  uint64_t v240;
  uint64_t v241;
  char v242;
  int v243;
  unsigned int v244;
  uint64_t v245;
  unsigned int v246;
  int v247;
  unsigned int v248;
  uint64_t v249;
  uint64_t v250;
  char v251;
  int v252;
  unsigned int v253;
  uint64_t v254;
  unsigned int v255;
  int v256;
  unsigned int v257;
  uint64_t v258;
  uint64_t v259;
  char v260;
  int v261;
  unsigned int v262;
  uint64_t v263;
  unsigned int v264;
  int v265;
  unsigned int v266;
  uint64_t v267;
  uint64_t v268;
  char v269;
  int v270;
  unsigned int v271;
  uint64_t v272;
  unsigned int v273;
  int v274;
  unsigned int v275;
  uint64_t v276;
  uint64_t v277;
  char v278;
  int v279;
  unsigned int v280;
  uint64_t v281;
  unsigned int v282;
  int v283;
  unsigned int v284;
  uint64_t v285;
  uint64_t v286;
  char v287;
  int v288;
  unsigned int v289;
  uint64_t v290;
  unsigned int v291;
  int v292;
  unsigned int v293;
  uint64_t v294;
  uint64_t v295;
  char v296;
  int v297;
  unsigned int v298;
  uint64_t v299;
  unsigned int v300;
  int v301;
  unsigned int v302;
  uint64_t v303;
  uint64_t v304;
  char v305;
  int v306;
  unsigned int v307;
  uint64_t v308;
  unsigned int v309;
  int v310;
  unsigned int v311;
  uint64_t v312;
  uint64_t v313;
  char v314;
  int v315;
  unsigned int v316;
  uint64_t v317;
  unsigned int v318;
  int v319;
  unsigned int v320;
  uint64_t v321;
  uint64_t v322;
  char v323;
  int v324;
  unsigned int v325;
  uint64_t v326;
  unsigned int v327;
  int v328;
  unsigned int v329;
  uint64_t v330;
  uint64_t v331;
  char v332;
  int v333;
  unsigned int v334;
  uint64_t v335;
  unsigned int v336;
  int v337;
  unsigned int v338;
  uint64_t v339;
  uint64_t v340;
  char v341;
  int v342;
  unsigned int v343;
  uint64_t v344;
  unsigned int v345;
  int v346;
  unsigned int v347;
  uint64_t v348;
  uint64_t v349;
  char v350;
  int v351;
  unsigned int v352;
  uint64_t v353;
  unsigned int v354;
  int v355;
  unsigned int v356;
  uint64_t v357;
  uint64_t v358;
  char v359;
  int v360;
  unsigned int v361;
  uint64_t v362;
  unsigned int v363;
  int v364;
  unsigned int v365;
  uint64_t v366;
  uint64_t v367;
  char v368;
  int v369;
  unsigned int v370;
  uint64_t v371;
  unsigned int v372;
  int v373;
  unsigned int v374;
  uint64_t v375;
  uint64_t v376;
  char v377;
  int v378;
  unsigned int v379;
  uint64_t v380;
  unsigned int v381;
  int v382;
  unsigned int v383;
  uint64_t v384;
  uint64_t v385;
  char v386;
  int v387;
  unsigned int v388;
  uint64_t v389;
  unsigned int v390;
  int v391;
  unsigned int v392;
  uint64_t v393;
  uint64_t v394;
  char v395;
  int v396;
  unsigned int v397;
  uint64_t v398;
  unsigned int v399;
  int v400;
  unsigned int v401;
  uint64_t v402;
  uint64_t v403;
  char v404;
  int v405;
  unsigned int v406;
  uint64_t v407;
  unsigned int v408;
  int v409;
  unsigned int v410;
  uint64_t v411;
  uint64_t v412;
  char v413;
  int v414;
  unsigned int v415;
  uint64_t v416;
  unsigned int v417;
  int v418;
  unsigned int v419;
  uint64_t v420;
  uint64_t v421;
  char v422;
  int v423;
  unsigned int v424;
  uint64_t v425;
  unsigned int v426;
  int v427;
  unsigned int v428;
  uint64_t v429;
  uint64_t v430;
  char v431;
  int v432;
  unsigned int v433;
  uint64_t v434;
  unsigned int v435;
  int v436;
  unsigned int v437;
  uint64_t v438;
  uint64_t v439;
  char v440;
  int v441;
  unsigned int v442;
  uint64_t v443;
  unsigned int v444;
  int v445;
  unsigned int v446;
  uint64_t v447;
  uint64_t v448;
  char v449;
  int v450;
  unsigned int v451;
  uint64_t v452;
  unsigned int v453;
  int v454;
  unsigned int v455;
  uint64_t v456;
  uint64_t v457;
  char v458;
  int v459;
  unsigned int v460;
  uint64_t v461;
  unsigned int v462;
  int v463;
  unsigned int v464;
  uint64_t v465;
  uint64_t v466;
  char v467;
  int v468;
  unsigned int v469;
  uint64_t v470;
  unsigned int v471;
  int v472;
  unsigned int v473;
  uint64_t v474;
  uint64_t v475;
  char v476;
  int v477;
  unsigned int v478;
  uint64_t v479;
  unsigned int v480;
  int v481;
  unsigned int v482;
  uint64_t v483;
  uint64_t v484;
  char v485;
  int v486;
  unsigned int v487;
  uint64_t v488;
  unsigned int v489;
  int v490;
  unsigned int v491;
  uint64_t v492;
  uint64_t v493;
  char v494;
  int v495;
  unsigned int v496;
  uint64_t v497;
  unsigned int v498;
  int v499;
  unsigned int v500;
  uint64_t v501;
  uint64_t v502;
  char v503;
  int v504;
  unsigned int v505;
  uint64_t v506;
  unsigned int v507;
  int v508;
  unsigned int v509;
  uint64_t v510;
  uint64_t v511;
  char v512;
  int v513;
  unsigned int v514;
  uint64_t v515;
  unsigned int v516;
  int v517;
  unsigned int v518;
  uint64_t v519;
  uint64_t v520;
  char v521;
  int v522;
  unsigned int v523;
  uint64_t v524;
  unsigned int v525;
  int v526;
  unsigned int v527;
  uint64_t v528;
  uint64_t v529;
  char v530;
  int v531;
  unsigned int v532;
  uint64_t v533;
  unsigned int v534;
  int v535;
  unsigned int v536;
  uint64_t v537;
  uint64_t v538;
  char v539;
  int v540;
  unsigned int v541;
  uint64_t v542;
  unsigned int v543;
  int v544;
  unsigned int v545;
  uint64_t v546;
  uint64_t v547;
  char v548;
  int v549;
  unsigned int v550;
  uint64_t v551;
  unsigned int v552;
  int v553;
  unsigned int v554;
  uint64_t v555;
  uint64_t v556;
  char v557;
  int v558;
  unsigned int v559;
  uint64_t v560;
  unsigned int v561;
  int v562;
  unsigned int v563;
  uint64_t v564;
  uint64_t v565;
  char v566;
  int v567;
  unsigned int v568;
  uint64_t v569;
  unsigned int v570;
  int v571;
  unsigned int v572;
  uint64_t v573;
  uint64_t v574;
  char v575;
  int v576;
  unsigned int v577;
  uint64_t v578;
  unsigned int v579;
  int v580;
  unsigned int v581;
  uint64_t v582;
  uint64_t v583;
  char v584;
  int v585;
  unsigned int v586;
  uint64_t v587;
  unsigned int v588;
  int v589;
  unsigned int v590;
  uint64_t v591;
  uint64_t v592;
  char v593;
  int v594;
  unsigned int v595;
  uint64_t v596;
  unsigned int v597;
  int v598;
  unsigned int v599;
  uint64_t v600;
  uint64_t v601;
  char v602;
  int v603;
  unsigned int v604;
  uint64_t v605;
  unsigned int v606;
  int v607;
  unsigned int v608;
  uint64_t v609;
  uint64_t v610;
  char v611;
  int v612;
  unsigned int v613;
  uint64_t v614;
  unsigned int v615;
  int v616;

  v2 = *(_BYTE **)(a2 + 24);
  if (v2[62])
    return result;
  v3 = *(_BYTE **)(a2 + 872);
  v4 = v2[148];
  if (v4 == 2)
  {
    if (v2[64])
    {
      v13 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v13;
      v14 = *(unsigned int *)(result + 4);
      if (v14 >= 8)
      {
        v30 = v14 - 8;
        *(_DWORD *)(result + 4) = v30;
        v17 = (*(_DWORD *)result >> v30) & *(_DWORD *)(result + 56);
      }
      else
      {
        v15 = 8 - v14;
        v16 = v14 + 24;
        *(_DWORD *)(result + 4) = v14 + 24;
        v17 = (*(_DWORD *)result << (8 - v14)) & *(_DWORD *)(result + 56);
        v18 = *(_DWORD *)(result + 160);
        v19 = *(unsigned int *)(result + 8);
        if (v13 > v18 || 32 * (int)v19 > v18)
        {
          *(_DWORD *)(result + 8) = v19 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v20 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v19));
          *(_DWORD *)result = v20;
          *(_DWORD *)(result + 8) = v19 + 1;
          v17 |= *(_DWORD *)(result + 4 * v15 + 24) & (v20 >> v16);
        }
      }
      *v3 = v17;
    }
    if (v2[65])
    {
      v41 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v41;
      v42 = *(unsigned int *)(result + 4);
      if (v42 >= 8)
      {
        v49 = v42 - 8;
        *(_DWORD *)(result + 4) = v49;
        v45 = (*(_DWORD *)result >> v49) & *(_DWORD *)(result + 56);
      }
      else
      {
        v43 = 8 - v42;
        v44 = v42 + 24;
        *(_DWORD *)(result + 4) = v42 + 24;
        v45 = (*(_DWORD *)result << (8 - v42)) & *(_DWORD *)(result + 56);
        v46 = *(_DWORD *)(result + 160);
        v47 = *(unsigned int *)(result + 8);
        if (v41 > v46 || 32 * (int)v47 > v46)
        {
          *(_DWORD *)(result + 8) = v47 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v48 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v47));
          *(_DWORD *)result = v48;
          *(_DWORD *)(result + 8) = v47 + 1;
          v45 |= *(_DWORD *)(result + 4 * v43 + 24) & (v48 >> v44);
        }
      }
      v3[1] = v45;
    }
    if (v2[66])
    {
      v68 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v68;
      v69 = *(unsigned int *)(result + 4);
      if (v69 >= 8)
      {
        v76 = v69 - 8;
        *(_DWORD *)(result + 4) = v76;
        v72 = (*(_DWORD *)result >> v76) & *(_DWORD *)(result + 56);
      }
      else
      {
        v70 = 8 - v69;
        v71 = v69 + 24;
        *(_DWORD *)(result + 4) = v69 + 24;
        v72 = (*(_DWORD *)result << (8 - v69)) & *(_DWORD *)(result + 56);
        v73 = *(_DWORD *)(result + 160);
        v74 = *(unsigned int *)(result + 8);
        if (v68 > v73 || 32 * (int)v74 > v73)
        {
          *(_DWORD *)(result + 8) = v74 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v75 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v74));
          *(_DWORD *)result = v75;
          *(_DWORD *)(result + 8) = v74 + 1;
          v72 |= *(_DWORD *)(result + 4 * v70 + 24) & (v75 >> v71);
        }
      }
      v3[2] = v72;
    }
    if (v2[67])
    {
      v95 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v95;
      v96 = *(unsigned int *)(result + 4);
      if (v96 >= 8)
      {
        v103 = v96 - 8;
        *(_DWORD *)(result + 4) = v103;
        v99 = (*(_DWORD *)result >> v103) & *(_DWORD *)(result + 56);
      }
      else
      {
        v97 = 8 - v96;
        v98 = v96 + 24;
        *(_DWORD *)(result + 4) = v96 + 24;
        v99 = (*(_DWORD *)result << (8 - v96)) & *(_DWORD *)(result + 56);
        v100 = *(_DWORD *)(result + 160);
        v101 = *(unsigned int *)(result + 8);
        if (v95 > v100 || 32 * (int)v101 > v100)
        {
          *(_DWORD *)(result + 8) = v101 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v102 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v101));
          *(_DWORD *)result = v102;
          *(_DWORD *)(result + 8) = v101 + 1;
          v99 |= *(_DWORD *)(result + 4 * v97 + 24) & (v102 >> v98);
        }
      }
      v3[3] = v99;
    }
    if (v2[68])
    {
      v122 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v122;
      v123 = *(unsigned int *)(result + 4);
      if (v123 >= 8)
      {
        v130 = v123 - 8;
        *(_DWORD *)(result + 4) = v130;
        v126 = (*(_DWORD *)result >> v130) & *(_DWORD *)(result + 56);
      }
      else
      {
        v124 = 8 - v123;
        v125 = v123 + 24;
        *(_DWORD *)(result + 4) = v123 + 24;
        v126 = (*(_DWORD *)result << (8 - v123)) & *(_DWORD *)(result + 56);
        v127 = *(_DWORD *)(result + 160);
        v128 = *(unsigned int *)(result + 8);
        if (v122 > v127 || 32 * (int)v128 > v127)
        {
          *(_DWORD *)(result + 8) = v128 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v129 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v128));
          *(_DWORD *)result = v129;
          *(_DWORD *)(result + 8) = v128 + 1;
          v126 |= *(_DWORD *)(result + 4 * v124 + 24) & (v129 >> v125);
        }
      }
      v3[4] = v126;
    }
    if (v2[69])
    {
      v149 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v149;
      v150 = *(unsigned int *)(result + 4);
      if (v150 >= 8)
      {
        v157 = v150 - 8;
        *(_DWORD *)(result + 4) = v157;
        v153 = (*(_DWORD *)result >> v157) & *(_DWORD *)(result + 56);
      }
      else
      {
        v151 = 8 - v150;
        v152 = v150 + 24;
        *(_DWORD *)(result + 4) = v150 + 24;
        v153 = (*(_DWORD *)result << (8 - v150)) & *(_DWORD *)(result + 56);
        v154 = *(_DWORD *)(result + 160);
        v155 = *(unsigned int *)(result + 8);
        if (v149 > v154 || 32 * (int)v155 > v154)
        {
          *(_DWORD *)(result + 8) = v155 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v156 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v155));
          *(_DWORD *)result = v156;
          *(_DWORD *)(result + 8) = v155 + 1;
          v153 |= *(_DWORD *)(result + 4 * v151 + 24) & (v156 >> v152);
        }
      }
      v3[5] = v153;
    }
    if (v2[71])
    {
      v176 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v176;
      v177 = *(unsigned int *)(result + 4);
      if (v177 >= 8)
      {
        v184 = v177 - 8;
        *(_DWORD *)(result + 4) = v184;
        v180 = (*(_DWORD *)result >> v184) & *(_DWORD *)(result + 56);
      }
      else
      {
        v178 = 8 - v177;
        v179 = v177 + 24;
        *(_DWORD *)(result + 4) = v177 + 24;
        v180 = (*(_DWORD *)result << (8 - v177)) & *(_DWORD *)(result + 56);
        v181 = *(_DWORD *)(result + 160);
        v182 = *(unsigned int *)(result + 8);
        if (v176 > v181 || 32 * (int)v182 > v181)
        {
          *(_DWORD *)(result + 8) = v182 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v183 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v182));
          *(_DWORD *)result = v183;
          *(_DWORD *)(result + 8) = v182 + 1;
          v180 |= *(_DWORD *)(result + 4 * v178 + 24) & (v183 >> v179);
        }
      }
      v3[6] = v180;
    }
    if (v2[74])
    {
      v203 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v203;
      v204 = *(unsigned int *)(result + 4);
      if (v204 >= 8)
      {
        v211 = v204 - 8;
        *(_DWORD *)(result + 4) = v211;
        v207 = (*(_DWORD *)result >> v211) & *(_DWORD *)(result + 56);
      }
      else
      {
        v205 = 8 - v204;
        v206 = v204 + 24;
        *(_DWORD *)(result + 4) = v204 + 24;
        v207 = (*(_DWORD *)result << (8 - v204)) & *(_DWORD *)(result + 56);
        v208 = *(_DWORD *)(result + 160);
        v209 = *(unsigned int *)(result + 8);
        if (v203 > v208 || 32 * (int)v209 > v208)
        {
          *(_DWORD *)(result + 8) = v209 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v210 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v209));
          *(_DWORD *)result = v210;
          *(_DWORD *)(result + 8) = v209 + 1;
          v207 |= *(_DWORD *)(result + 4 * v205 + 24) & (v210 >> v206);
        }
      }
      v3[9] = v207;
    }
    if (v2[76])
    {
      v230 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v230;
      v231 = *(unsigned int *)(result + 4);
      if (v231 >= 8)
      {
        v238 = v231 - 8;
        *(_DWORD *)(result + 4) = v238;
        v234 = (*(_DWORD *)result >> v238) & *(_DWORD *)(result + 56);
      }
      else
      {
        v232 = 8 - v231;
        v233 = v231 + 24;
        *(_DWORD *)(result + 4) = v231 + 24;
        v234 = (*(_DWORD *)result << (8 - v231)) & *(_DWORD *)(result + 56);
        v235 = *(_DWORD *)(result + 160);
        v236 = *(unsigned int *)(result + 8);
        if (v230 > v235 || 32 * (int)v236 > v235)
        {
          *(_DWORD *)(result + 8) = v236 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v237 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v236));
          *(_DWORD *)result = v237;
          *(_DWORD *)(result + 8) = v236 + 1;
          v234 |= *(_DWORD *)(result + 4 * v232 + 24) & (v237 >> v233);
        }
      }
      v3[10] = v234;
    }
    if (v2[77])
    {
      v257 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v257;
      v258 = *(unsigned int *)(result + 4);
      if (v258 >= 8)
      {
        v265 = v258 - 8;
        *(_DWORD *)(result + 4) = v265;
        v261 = (*(_DWORD *)result >> v265) & *(_DWORD *)(result + 56);
      }
      else
      {
        v259 = 8 - v258;
        v260 = v258 + 24;
        *(_DWORD *)(result + 4) = v258 + 24;
        v261 = (*(_DWORD *)result << (8 - v258)) & *(_DWORD *)(result + 56);
        v262 = *(_DWORD *)(result + 160);
        v263 = *(unsigned int *)(result + 8);
        if (v257 > v262 || 32 * (int)v263 > v262)
        {
          *(_DWORD *)(result + 8) = v263 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v264 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v263));
          *(_DWORD *)result = v264;
          *(_DWORD *)(result + 8) = v263 + 1;
          v261 |= *(_DWORD *)(result + 4 * v259 + 24) & (v264 >> v260);
        }
      }
      v3[11] = v261;
    }
    if (v2[78])
    {
      v284 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v284;
      v285 = *(unsigned int *)(result + 4);
      if (v285 >= 8)
      {
        v292 = v285 - 8;
        *(_DWORD *)(result + 4) = v292;
        v288 = (*(_DWORD *)result >> v292) & *(_DWORD *)(result + 56);
      }
      else
      {
        v286 = 8 - v285;
        v287 = v285 + 24;
        *(_DWORD *)(result + 4) = v285 + 24;
        v288 = (*(_DWORD *)result << (8 - v285)) & *(_DWORD *)(result + 56);
        v289 = *(_DWORD *)(result + 160);
        v290 = *(unsigned int *)(result + 8);
        if (v284 > v289 || 32 * (int)v290 > v289)
        {
          *(_DWORD *)(result + 8) = v290 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v291 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v290));
          *(_DWORD *)result = v291;
          *(_DWORD *)(result + 8) = v290 + 1;
          v288 |= *(_DWORD *)(result + 4 * v286 + 24) & (v291 >> v287);
        }
      }
      v3[12] = v288;
    }
    if (v2[79])
    {
      v311 = *(_DWORD *)(result + 156) + 4;
      *(_DWORD *)(result + 156) = v311;
      v312 = *(unsigned int *)(result + 4);
      if (v312 >= 4)
      {
        v319 = v312 - 4;
        *(_DWORD *)(result + 4) = v319;
        v315 = (*(_DWORD *)result >> v319) & *(_DWORD *)(result + 40);
      }
      else
      {
        v313 = 4 - v312;
        v314 = v312 + 28;
        *(_DWORD *)(result + 4) = v312 + 28;
        v315 = (*(_DWORD *)result << (4 - v312)) & *(_DWORD *)(result + 40);
        v316 = *(_DWORD *)(result + 160);
        v317 = *(unsigned int *)(result + 8);
        if (v311 > v316 || 32 * (int)v317 > v316)
        {
          *(_DWORD *)(result + 8) = v317 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v318 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v317));
          *(_DWORD *)result = v318;
          *(_DWORD *)(result + 8) = v317 + 1;
          v315 |= *(_DWORD *)(result + 4 * v313 + 24) & (v318 >> v314);
        }
      }
      v3[13] = v315;
    }
    if (v2[72])
    {
      v338 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v338;
      v339 = *(unsigned int *)(result + 4);
      if (v339 >= 8)
      {
        v346 = v339 - 8;
        *(_DWORD *)(result + 4) = v346;
        v342 = (*(_DWORD *)result >> v346) & *(_DWORD *)(result + 56);
      }
      else
      {
        v340 = 8 - v339;
        v341 = v339 + 24;
        *(_DWORD *)(result + 4) = v339 + 24;
        v342 = (*(_DWORD *)result << (8 - v339)) & *(_DWORD *)(result + 56);
        v343 = *(_DWORD *)(result + 160);
        v344 = *(unsigned int *)(result + 8);
        if (v338 > v343 || 32 * (int)v344 > v343)
        {
          *(_DWORD *)(result + 8) = v344 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v345 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v344));
          *(_DWORD *)result = v345;
          *(_DWORD *)(result + 8) = v344 + 1;
          v342 |= *(_DWORD *)(result + 4 * v340 + 24) & (v345 >> v341);
        }
      }
      v3[7] = v342;
    }
    if (v2[73])
    {
      v356 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v356;
      v357 = *(unsigned int *)(result + 4);
      if (v357 >= 8)
      {
        v364 = v357 - 8;
        *(_DWORD *)(result + 4) = v364;
        v360 = (*(_DWORD *)result >> v364) & *(_DWORD *)(result + 56);
      }
      else
      {
        v358 = 8 - v357;
        v359 = v357 + 24;
        *(_DWORD *)(result + 4) = v357 + 24;
        v360 = (*(_DWORD *)result << (8 - v357)) & *(_DWORD *)(result + 56);
        v361 = *(_DWORD *)(result + 160);
        v362 = *(unsigned int *)(result + 8);
        if (v356 > v361 || 32 * (int)v362 > v361)
        {
          *(_DWORD *)(result + 8) = v362 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v363 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v362));
          *(_DWORD *)result = v363;
          *(_DWORD *)(result + 8) = v362 + 1;
          v360 |= *(_DWORD *)(result + 4 * v358 + 24) & (v363 >> v359);
        }
      }
      v3[8] = v360;
    }
    if (v2[81])
    {
      v374 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v374;
      v375 = *(unsigned int *)(result + 4);
      if (v375 >= 8)
      {
        v382 = v375 - 8;
        *(_DWORD *)(result + 4) = v382;
        v378 = (*(_DWORD *)result >> v382) & *(_DWORD *)(result + 56);
      }
      else
      {
        v376 = 8 - v375;
        v377 = v375 + 24;
        *(_DWORD *)(result + 4) = v375 + 24;
        v378 = (*(_DWORD *)result << (8 - v375)) & *(_DWORD *)(result + 56);
        v379 = *(_DWORD *)(result + 160);
        v380 = *(unsigned int *)(result + 8);
        if (v374 > v379 || 32 * (int)v380 > v379)
        {
          *(_DWORD *)(result + 8) = v380 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v381 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v380));
          *(_DWORD *)result = v381;
          *(_DWORD *)(result + 8) = v380 + 1;
          v378 |= *(_DWORD *)(result + 4 * v376 + 24) & (v381 >> v377);
        }
      }
      v3[14] = v378;
    }
    if (v2[82])
    {
      v392 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v392;
      v393 = *(unsigned int *)(result + 4);
      if (v393 >= 8)
      {
        v400 = v393 - 8;
        *(_DWORD *)(result + 4) = v400;
        v396 = (*(_DWORD *)result >> v400) & *(_DWORD *)(result + 56);
      }
      else
      {
        v394 = 8 - v393;
        v395 = v393 + 24;
        *(_DWORD *)(result + 4) = v393 + 24;
        v396 = (*(_DWORD *)result << (8 - v393)) & *(_DWORD *)(result + 56);
        v397 = *(_DWORD *)(result + 160);
        v398 = *(unsigned int *)(result + 8);
        if (v392 > v397 || 32 * (int)v398 > v397)
        {
          *(_DWORD *)(result + 8) = v398 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v399 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v398));
          *(_DWORD *)result = v399;
          *(_DWORD *)(result + 8) = v398 + 1;
          v396 |= *(_DWORD *)(result + 4 * v394 + 24) & (v399 >> v395);
        }
      }
      v3[15] = v396;
    }
    if (v2[84])
    {
      v410 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v410;
      v411 = *(unsigned int *)(result + 4);
      if (v411 >= 8)
      {
        v418 = v411 - 8;
        *(_DWORD *)(result + 4) = v418;
        v414 = (*(_DWORD *)result >> v418) & *(_DWORD *)(result + 56);
      }
      else
      {
        v412 = 8 - v411;
        v413 = v411 + 24;
        *(_DWORD *)(result + 4) = v411 + 24;
        v414 = (*(_DWORD *)result << (8 - v411)) & *(_DWORD *)(result + 56);
        v415 = *(_DWORD *)(result + 160);
        v416 = *(unsigned int *)(result + 8);
        if (v410 > v415 || 32 * (int)v416 > v415)
        {
          *(_DWORD *)(result + 8) = v416 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v417 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v416));
          *(_DWORD *)result = v417;
          *(_DWORD *)(result + 8) = v416 + 1;
          v414 |= *(_DWORD *)(result + 4 * v412 + 24) & (v417 >> v413);
        }
      }
      v3[17] = v414;
    }
    if (v2[85])
    {
      v428 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v428;
      v429 = *(unsigned int *)(result + 4);
      if (v429 >= 8)
      {
        v436 = v429 - 8;
        *(_DWORD *)(result + 4) = v436;
        v432 = (*(_DWORD *)result >> v436) & *(_DWORD *)(result + 56);
      }
      else
      {
        v430 = 8 - v429;
        v431 = v429 + 24;
        *(_DWORD *)(result + 4) = v429 + 24;
        v432 = (*(_DWORD *)result << (8 - v429)) & *(_DWORD *)(result + 56);
        v433 = *(_DWORD *)(result + 160);
        v434 = *(unsigned int *)(result + 8);
        if (v428 > v433 || 32 * (int)v434 > v433)
        {
          *(_DWORD *)(result + 8) = v434 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v435 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v434));
          *(_DWORD *)result = v435;
          *(_DWORD *)(result + 8) = v434 + 1;
          v432 |= *(_DWORD *)(result + 4 * v430 + 24) & (v435 >> v431);
        }
      }
      v3[18] = v432;
    }
    if (v2[86])
    {
      v446 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v446;
      v447 = *(unsigned int *)(result + 4);
      if (v447 >= 8)
      {
        v454 = v447 - 8;
        *(_DWORD *)(result + 4) = v454;
        v450 = (*(_DWORD *)result >> v454) & *(_DWORD *)(result + 56);
      }
      else
      {
        v448 = 8 - v447;
        v449 = v447 + 24;
        *(_DWORD *)(result + 4) = v447 + 24;
        v450 = (*(_DWORD *)result << (8 - v447)) & *(_DWORD *)(result + 56);
        v451 = *(_DWORD *)(result + 160);
        v452 = *(unsigned int *)(result + 8);
        if (v446 > v451 || 32 * (int)v452 > v451)
        {
          *(_DWORD *)(result + 8) = v452 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v453 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v452));
          *(_DWORD *)result = v453;
          *(_DWORD *)(result + 8) = v452 + 1;
          v450 |= *(_DWORD *)(result + 4 * v448 + 24) & (v453 >> v449);
        }
      }
      v3[19] = v450;
    }
    if (v2[83])
    {
      v464 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v464;
      v465 = *(unsigned int *)(result + 4);
      if (v465 >= 8)
      {
        v472 = v465 - 8;
        *(_DWORD *)(result + 4) = v472;
        v468 = (*(_DWORD *)result >> v472) & *(_DWORD *)(result + 56);
      }
      else
      {
        v466 = 8 - v465;
        v467 = v465 + 24;
        *(_DWORD *)(result + 4) = v465 + 24;
        v468 = (*(_DWORD *)result << (8 - v465)) & *(_DWORD *)(result + 56);
        v469 = *(_DWORD *)(result + 160);
        v470 = *(unsigned int *)(result + 8);
        if (v464 > v469 || 32 * (int)v470 > v469)
        {
          *(_DWORD *)(result + 8) = v470 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v471 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v470));
          *(_DWORD *)result = v471;
          *(_DWORD *)(result + 8) = v470 + 1;
          v468 |= *(_DWORD *)(result + 4 * v466 + 24) & (v471 >> v467);
        }
      }
      v3[16] = v468;
    }
    goto LABEL_422;
  }
  if (v4 == 1)
  {
    if (v2[64])
    {
      v21 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v21;
      v22 = *(unsigned int *)(result + 4);
      if (v22 >= 8)
      {
        v31 = v22 - 8;
        *(_DWORD *)(result + 4) = v31;
        v25 = (*(_DWORD *)result >> v31) & *(_DWORD *)(result + 56);
      }
      else
      {
        v23 = 8 - v22;
        v24 = v22 + 24;
        *(_DWORD *)(result + 4) = v22 + 24;
        v25 = (*(_DWORD *)result << (8 - v22)) & *(_DWORD *)(result + 56);
        v26 = *(_DWORD *)(result + 160);
        v27 = *(unsigned int *)(result + 8);
        if (v21 > v26 || 32 * (int)v27 > v26)
        {
          *(_DWORD *)(result + 8) = v27 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v28 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v27));
          *(_DWORD *)result = v28;
          *(_DWORD *)(result + 8) = v27 + 1;
          v25 |= *(_DWORD *)(result + 4 * v23 + 24) & (v28 >> v24);
        }
      }
      *v3 = v25;
    }
    if (v2[65])
    {
      v50 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v50;
      v51 = *(unsigned int *)(result + 4);
      if (v51 >= 8)
      {
        v58 = v51 - 8;
        *(_DWORD *)(result + 4) = v58;
        v54 = (*(_DWORD *)result >> v58) & *(_DWORD *)(result + 56);
      }
      else
      {
        v52 = 8 - v51;
        v53 = v51 + 24;
        *(_DWORD *)(result + 4) = v51 + 24;
        v54 = (*(_DWORD *)result << (8 - v51)) & *(_DWORD *)(result + 56);
        v55 = *(_DWORD *)(result + 160);
        v56 = *(unsigned int *)(result + 8);
        if (v50 > v55 || 32 * (int)v56 > v55)
        {
          *(_DWORD *)(result + 8) = v56 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v57 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v56));
          *(_DWORD *)result = v57;
          *(_DWORD *)(result + 8) = v56 + 1;
          v54 |= *(_DWORD *)(result + 4 * v52 + 24) & (v57 >> v53);
        }
      }
      v3[1] = v54;
    }
    if (v2[66])
    {
      v77 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v77;
      v78 = *(unsigned int *)(result + 4);
      if (v78 >= 8)
      {
        v85 = v78 - 8;
        *(_DWORD *)(result + 4) = v85;
        v81 = (*(_DWORD *)result >> v85) & *(_DWORD *)(result + 56);
      }
      else
      {
        v79 = 8 - v78;
        v80 = v78 + 24;
        *(_DWORD *)(result + 4) = v78 + 24;
        v81 = (*(_DWORD *)result << (8 - v78)) & *(_DWORD *)(result + 56);
        v82 = *(_DWORD *)(result + 160);
        v83 = *(unsigned int *)(result + 8);
        if (v77 > v82 || 32 * (int)v83 > v82)
        {
          *(_DWORD *)(result + 8) = v83 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v84 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v83));
          *(_DWORD *)result = v84;
          *(_DWORD *)(result + 8) = v83 + 1;
          v81 |= *(_DWORD *)(result + 4 * v79 + 24) & (v84 >> v80);
        }
      }
      v3[2] = v81;
    }
    if (v2[67])
    {
      v104 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v104;
      v105 = *(unsigned int *)(result + 4);
      if (v105 >= 8)
      {
        v112 = v105 - 8;
        *(_DWORD *)(result + 4) = v112;
        v108 = (*(_DWORD *)result >> v112) & *(_DWORD *)(result + 56);
      }
      else
      {
        v106 = 8 - v105;
        v107 = v105 + 24;
        *(_DWORD *)(result + 4) = v105 + 24;
        v108 = (*(_DWORD *)result << (8 - v105)) & *(_DWORD *)(result + 56);
        v109 = *(_DWORD *)(result + 160);
        v110 = *(unsigned int *)(result + 8);
        if (v104 > v109 || 32 * (int)v110 > v109)
        {
          *(_DWORD *)(result + 8) = v110 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v111 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v110));
          *(_DWORD *)result = v111;
          *(_DWORD *)(result + 8) = v110 + 1;
          v108 |= *(_DWORD *)(result + 4 * v106 + 24) & (v111 >> v107);
        }
      }
      v3[3] = v108;
    }
    if (v2[68])
    {
      v131 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v131;
      v132 = *(unsigned int *)(result + 4);
      if (v132 >= 8)
      {
        v139 = v132 - 8;
        *(_DWORD *)(result + 4) = v139;
        v135 = (*(_DWORD *)result >> v139) & *(_DWORD *)(result + 56);
      }
      else
      {
        v133 = 8 - v132;
        v134 = v132 + 24;
        *(_DWORD *)(result + 4) = v132 + 24;
        v135 = (*(_DWORD *)result << (8 - v132)) & *(_DWORD *)(result + 56);
        v136 = *(_DWORD *)(result + 160);
        v137 = *(unsigned int *)(result + 8);
        if (v131 > v136 || 32 * (int)v137 > v136)
        {
          *(_DWORD *)(result + 8) = v137 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v138 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v137));
          *(_DWORD *)result = v138;
          *(_DWORD *)(result + 8) = v137 + 1;
          v135 |= *(_DWORD *)(result + 4 * v133 + 24) & (v138 >> v134);
        }
      }
      v3[4] = v135;
    }
    if (v2[69])
    {
      v158 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v158;
      v159 = *(unsigned int *)(result + 4);
      if (v159 >= 8)
      {
        v166 = v159 - 8;
        *(_DWORD *)(result + 4) = v166;
        v162 = (*(_DWORD *)result >> v166) & *(_DWORD *)(result + 56);
      }
      else
      {
        v160 = 8 - v159;
        v161 = v159 + 24;
        *(_DWORD *)(result + 4) = v159 + 24;
        v162 = (*(_DWORD *)result << (8 - v159)) & *(_DWORD *)(result + 56);
        v163 = *(_DWORD *)(result + 160);
        v164 = *(unsigned int *)(result + 8);
        if (v158 > v163 || 32 * (int)v164 > v163)
        {
          *(_DWORD *)(result + 8) = v164 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v165 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v164));
          *(_DWORD *)result = v165;
          *(_DWORD *)(result + 8) = v164 + 1;
          v162 |= *(_DWORD *)(result + 4 * v160 + 24) & (v165 >> v161);
        }
      }
      v3[5] = v162;
    }
    if (v2[71])
    {
      v185 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v185;
      v186 = *(unsigned int *)(result + 4);
      if (v186 >= 8)
      {
        v193 = v186 - 8;
        *(_DWORD *)(result + 4) = v193;
        v189 = (*(_DWORD *)result >> v193) & *(_DWORD *)(result + 56);
      }
      else
      {
        v187 = 8 - v186;
        v188 = v186 + 24;
        *(_DWORD *)(result + 4) = v186 + 24;
        v189 = (*(_DWORD *)result << (8 - v186)) & *(_DWORD *)(result + 56);
        v190 = *(_DWORD *)(result + 160);
        v191 = *(unsigned int *)(result + 8);
        if (v185 > v190 || 32 * (int)v191 > v190)
        {
          *(_DWORD *)(result + 8) = v191 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v192 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v191));
          *(_DWORD *)result = v192;
          *(_DWORD *)(result + 8) = v191 + 1;
          v189 |= *(_DWORD *)(result + 4 * v187 + 24) & (v192 >> v188);
        }
      }
      v3[6] = v189;
    }
    if (v2[74])
    {
      v212 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v212;
      v213 = *(unsigned int *)(result + 4);
      if (v213 >= 8)
      {
        v220 = v213 - 8;
        *(_DWORD *)(result + 4) = v220;
        v216 = (*(_DWORD *)result >> v220) & *(_DWORD *)(result + 56);
      }
      else
      {
        v214 = 8 - v213;
        v215 = v213 + 24;
        *(_DWORD *)(result + 4) = v213 + 24;
        v216 = (*(_DWORD *)result << (8 - v213)) & *(_DWORD *)(result + 56);
        v217 = *(_DWORD *)(result + 160);
        v218 = *(unsigned int *)(result + 8);
        if (v212 > v217 || 32 * (int)v218 > v217)
        {
          *(_DWORD *)(result + 8) = v218 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v219 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v218));
          *(_DWORD *)result = v219;
          *(_DWORD *)(result + 8) = v218 + 1;
          v216 |= *(_DWORD *)(result + 4 * v214 + 24) & (v219 >> v215);
        }
      }
      v3[9] = v216;
    }
    if (v2[76])
    {
      v239 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v239;
      v240 = *(unsigned int *)(result + 4);
      if (v240 >= 8)
      {
        v247 = v240 - 8;
        *(_DWORD *)(result + 4) = v247;
        v243 = (*(_DWORD *)result >> v247) & *(_DWORD *)(result + 56);
      }
      else
      {
        v241 = 8 - v240;
        v242 = v240 + 24;
        *(_DWORD *)(result + 4) = v240 + 24;
        v243 = (*(_DWORD *)result << (8 - v240)) & *(_DWORD *)(result + 56);
        v244 = *(_DWORD *)(result + 160);
        v245 = *(unsigned int *)(result + 8);
        if (v239 > v244 || 32 * (int)v245 > v244)
        {
          *(_DWORD *)(result + 8) = v245 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v246 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v245));
          *(_DWORD *)result = v246;
          *(_DWORD *)(result + 8) = v245 + 1;
          v243 |= *(_DWORD *)(result + 4 * v241 + 24) & (v246 >> v242);
        }
      }
      v3[10] = v243;
    }
    if (v2[77])
    {
      v266 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v266;
      v267 = *(unsigned int *)(result + 4);
      if (v267 >= 8)
      {
        v274 = v267 - 8;
        *(_DWORD *)(result + 4) = v274;
        v270 = (*(_DWORD *)result >> v274) & *(_DWORD *)(result + 56);
      }
      else
      {
        v268 = 8 - v267;
        v269 = v267 + 24;
        *(_DWORD *)(result + 4) = v267 + 24;
        v270 = (*(_DWORD *)result << (8 - v267)) & *(_DWORD *)(result + 56);
        v271 = *(_DWORD *)(result + 160);
        v272 = *(unsigned int *)(result + 8);
        if (v266 > v271 || 32 * (int)v272 > v271)
        {
          *(_DWORD *)(result + 8) = v272 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v273 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v272));
          *(_DWORD *)result = v273;
          *(_DWORD *)(result + 8) = v272 + 1;
          v270 |= *(_DWORD *)(result + 4 * v268 + 24) & (v273 >> v269);
        }
      }
      v3[11] = v270;
    }
    if (v2[78])
    {
      v293 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v293;
      v294 = *(unsigned int *)(result + 4);
      if (v294 >= 8)
      {
        v301 = v294 - 8;
        *(_DWORD *)(result + 4) = v301;
        v297 = (*(_DWORD *)result >> v301) & *(_DWORD *)(result + 56);
      }
      else
      {
        v295 = 8 - v294;
        v296 = v294 + 24;
        *(_DWORD *)(result + 4) = v294 + 24;
        v297 = (*(_DWORD *)result << (8 - v294)) & *(_DWORD *)(result + 56);
        v298 = *(_DWORD *)(result + 160);
        v299 = *(unsigned int *)(result + 8);
        if (v293 > v298 || 32 * (int)v299 > v298)
        {
          *(_DWORD *)(result + 8) = v299 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v300 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v299));
          *(_DWORD *)result = v300;
          *(_DWORD *)(result + 8) = v299 + 1;
          v297 |= *(_DWORD *)(result + 4 * v295 + 24) & (v300 >> v296);
        }
      }
      v3[12] = v297;
    }
    if (v2[79])
    {
      v320 = *(_DWORD *)(result + 156) + 4;
      *(_DWORD *)(result + 156) = v320;
      v321 = *(unsigned int *)(result + 4);
      if (v321 >= 4)
      {
        v328 = v321 - 4;
        *(_DWORD *)(result + 4) = v328;
        v324 = (*(_DWORD *)result >> v328) & *(_DWORD *)(result + 40);
      }
      else
      {
        v322 = 4 - v321;
        v323 = v321 + 28;
        *(_DWORD *)(result + 4) = v321 + 28;
        v324 = (*(_DWORD *)result << (4 - v321)) & *(_DWORD *)(result + 40);
        v325 = *(_DWORD *)(result + 160);
        v326 = *(unsigned int *)(result + 8);
        if (v320 > v325 || 32 * (int)v326 > v325)
        {
          *(_DWORD *)(result + 8) = v326 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v327 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v326));
          *(_DWORD *)result = v327;
          *(_DWORD *)(result + 8) = v326 + 1;
          v324 |= *(_DWORD *)(result + 4 * v322 + 24) & (v327 >> v323);
        }
      }
      v3[13] = v324;
    }
    if (v2[72])
    {
      v347 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v347;
      v348 = *(unsigned int *)(result + 4);
      if (v348 >= 8)
      {
        v355 = v348 - 8;
        *(_DWORD *)(result + 4) = v355;
        v351 = (*(_DWORD *)result >> v355) & *(_DWORD *)(result + 56);
      }
      else
      {
        v349 = 8 - v348;
        v350 = v348 + 24;
        *(_DWORD *)(result + 4) = v348 + 24;
        v351 = (*(_DWORD *)result << (8 - v348)) & *(_DWORD *)(result + 56);
        v352 = *(_DWORD *)(result + 160);
        v353 = *(unsigned int *)(result + 8);
        if (v347 > v352 || 32 * (int)v353 > v352)
        {
          *(_DWORD *)(result + 8) = v353 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v354 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v353));
          *(_DWORD *)result = v354;
          *(_DWORD *)(result + 8) = v353 + 1;
          v351 |= *(_DWORD *)(result + 4 * v349 + 24) & (v354 >> v350);
        }
      }
      v3[7] = v351;
    }
    if (v2[73])
    {
      v365 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v365;
      v366 = *(unsigned int *)(result + 4);
      if (v366 >= 8)
      {
        v373 = v366 - 8;
        *(_DWORD *)(result + 4) = v373;
        v369 = (*(_DWORD *)result >> v373) & *(_DWORD *)(result + 56);
      }
      else
      {
        v367 = 8 - v366;
        v368 = v366 + 24;
        *(_DWORD *)(result + 4) = v366 + 24;
        v369 = (*(_DWORD *)result << (8 - v366)) & *(_DWORD *)(result + 56);
        v370 = *(_DWORD *)(result + 160);
        v371 = *(unsigned int *)(result + 8);
        if (v365 > v370 || 32 * (int)v371 > v370)
        {
          *(_DWORD *)(result + 8) = v371 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v372 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v371));
          *(_DWORD *)result = v372;
          *(_DWORD *)(result + 8) = v371 + 1;
          v369 |= *(_DWORD *)(result + 4 * v367 + 24) & (v372 >> v368);
        }
      }
      v3[8] = v369;
    }
    if (v2[81])
    {
      v383 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v383;
      v384 = *(unsigned int *)(result + 4);
      if (v384 >= 8)
      {
        v391 = v384 - 8;
        *(_DWORD *)(result + 4) = v391;
        v387 = (*(_DWORD *)result >> v391) & *(_DWORD *)(result + 56);
      }
      else
      {
        v385 = 8 - v384;
        v386 = v384 + 24;
        *(_DWORD *)(result + 4) = v384 + 24;
        v387 = (*(_DWORD *)result << (8 - v384)) & *(_DWORD *)(result + 56);
        v388 = *(_DWORD *)(result + 160);
        v389 = *(unsigned int *)(result + 8);
        if (v383 > v388 || 32 * (int)v389 > v388)
        {
          *(_DWORD *)(result + 8) = v389 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v390 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v389));
          *(_DWORD *)result = v390;
          *(_DWORD *)(result + 8) = v389 + 1;
          v387 |= *(_DWORD *)(result + 4 * v385 + 24) & (v390 >> v386);
        }
      }
      v3[14] = v387;
    }
    if (v2[82])
    {
      v401 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v401;
      v402 = *(unsigned int *)(result + 4);
      if (v402 >= 8)
      {
        v409 = v402 - 8;
        *(_DWORD *)(result + 4) = v409;
        v405 = (*(_DWORD *)result >> v409) & *(_DWORD *)(result + 56);
      }
      else
      {
        v403 = 8 - v402;
        v404 = v402 + 24;
        *(_DWORD *)(result + 4) = v402 + 24;
        v405 = (*(_DWORD *)result << (8 - v402)) & *(_DWORD *)(result + 56);
        v406 = *(_DWORD *)(result + 160);
        v407 = *(unsigned int *)(result + 8);
        if (v401 > v406 || 32 * (int)v407 > v406)
        {
          *(_DWORD *)(result + 8) = v407 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v408 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v407));
          *(_DWORD *)result = v408;
          *(_DWORD *)(result + 8) = v407 + 1;
          v405 |= *(_DWORD *)(result + 4 * v403 + 24) & (v408 >> v404);
        }
      }
      v3[15] = v405;
    }
    if (v2[84])
    {
      v419 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v419;
      v420 = *(unsigned int *)(result + 4);
      if (v420 >= 8)
      {
        v427 = v420 - 8;
        *(_DWORD *)(result + 4) = v427;
        v423 = (*(_DWORD *)result >> v427) & *(_DWORD *)(result + 56);
      }
      else
      {
        v421 = 8 - v420;
        v422 = v420 + 24;
        *(_DWORD *)(result + 4) = v420 + 24;
        v423 = (*(_DWORD *)result << (8 - v420)) & *(_DWORD *)(result + 56);
        v424 = *(_DWORD *)(result + 160);
        v425 = *(unsigned int *)(result + 8);
        if (v419 > v424 || 32 * (int)v425 > v424)
        {
          *(_DWORD *)(result + 8) = v425 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v426 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v425));
          *(_DWORD *)result = v426;
          *(_DWORD *)(result + 8) = v425 + 1;
          v423 |= *(_DWORD *)(result + 4 * v421 + 24) & (v426 >> v422);
        }
      }
      v3[17] = v423;
    }
    if (v2[85])
    {
      v437 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v437;
      v438 = *(unsigned int *)(result + 4);
      if (v438 >= 8)
      {
        v445 = v438 - 8;
        *(_DWORD *)(result + 4) = v445;
        v441 = (*(_DWORD *)result >> v445) & *(_DWORD *)(result + 56);
      }
      else
      {
        v439 = 8 - v438;
        v440 = v438 + 24;
        *(_DWORD *)(result + 4) = v438 + 24;
        v441 = (*(_DWORD *)result << (8 - v438)) & *(_DWORD *)(result + 56);
        v442 = *(_DWORD *)(result + 160);
        v443 = *(unsigned int *)(result + 8);
        if (v437 > v442 || 32 * (int)v443 > v442)
        {
          *(_DWORD *)(result + 8) = v443 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v444 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v443));
          *(_DWORD *)result = v444;
          *(_DWORD *)(result + 8) = v443 + 1;
          v441 |= *(_DWORD *)(result + 4 * v439 + 24) & (v444 >> v440);
        }
      }
      v3[18] = v441;
    }
    if (v2[86])
    {
      v455 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v455;
      v456 = *(unsigned int *)(result + 4);
      if (v456 >= 8)
      {
        v463 = v456 - 8;
        *(_DWORD *)(result + 4) = v463;
        v459 = (*(_DWORD *)result >> v463) & *(_DWORD *)(result + 56);
      }
      else
      {
        v457 = 8 - v456;
        v458 = v456 + 24;
        *(_DWORD *)(result + 4) = v456 + 24;
        v459 = (*(_DWORD *)result << (8 - v456)) & *(_DWORD *)(result + 56);
        v460 = *(_DWORD *)(result + 160);
        v461 = *(unsigned int *)(result + 8);
        if (v455 > v460 || 32 * (int)v461 > v460)
        {
          *(_DWORD *)(result + 8) = v461 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v462 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v461));
          *(_DWORD *)result = v462;
          *(_DWORD *)(result + 8) = v461 + 1;
          v459 |= *(_DWORD *)(result + 4 * v457 + 24) & (v462 >> v458);
        }
      }
      v3[19] = v459;
    }
LABEL_422:
    if (v2[88])
    {
      v473 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v473;
      v474 = *(unsigned int *)(result + 4);
      if (v474 >= 8)
      {
        v481 = v474 - 8;
        *(_DWORD *)(result + 4) = v481;
        v477 = (*(_DWORD *)result >> v481) & *(_DWORD *)(result + 56);
      }
      else
      {
        v475 = 8 - v474;
        v476 = v474 + 24;
        *(_DWORD *)(result + 4) = v474 + 24;
        v477 = (*(_DWORD *)result << (8 - v474)) & *(_DWORD *)(result + 56);
        v478 = *(_DWORD *)(result + 160);
        v479 = *(unsigned int *)(result + 8);
        if (v473 > v478 || 32 * (int)v479 > v478)
        {
          *(_DWORD *)(result + 8) = v479 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v480 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v479));
          *(_DWORD *)result = v480;
          *(_DWORD *)(result + 8) = v479 + 1;
          v477 |= *(_DWORD *)(result + 4 * v475 + 24) & (v480 >> v476);
        }
      }
      v3[20] = v477;
    }
    if (v2[89])
    {
      v482 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v482;
      v483 = *(unsigned int *)(result + 4);
      if (v483 >= 8)
      {
        v490 = v483 - 8;
        *(_DWORD *)(result + 4) = v490;
        v486 = (*(_DWORD *)result >> v490) & *(_DWORD *)(result + 56);
      }
      else
      {
        v484 = 8 - v483;
        v485 = v483 + 24;
        *(_DWORD *)(result + 4) = v483 + 24;
        v486 = (*(_DWORD *)result << (8 - v483)) & *(_DWORD *)(result + 56);
        v487 = *(_DWORD *)(result + 160);
        v488 = *(unsigned int *)(result + 8);
        if (v482 > v487 || 32 * (int)v488 > v487)
        {
          *(_DWORD *)(result + 8) = v488 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v489 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v488));
          *(_DWORD *)result = v489;
          *(_DWORD *)(result + 8) = v488 + 1;
          v486 |= *(_DWORD *)(result + 4 * v484 + 24) & (v489 >> v485);
        }
      }
      v3[21] = v486;
    }
    goto LABEL_438;
  }
  if (!v2[148])
  {
    if (v2[64])
    {
      v5 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v5;
      v6 = *(unsigned int *)(result + 4);
      if (v6 >= 8)
      {
        v29 = v6 - 8;
        *(_DWORD *)(result + 4) = v29;
        v9 = (*(_DWORD *)result >> v29) & *(_DWORD *)(result + 56);
      }
      else
      {
        v7 = 8 - v6;
        v8 = v6 + 24;
        *(_DWORD *)(result + 4) = v6 + 24;
        v9 = (*(_DWORD *)result << (8 - v6)) & *(_DWORD *)(result + 56);
        v10 = *(_DWORD *)(result + 160);
        v11 = *(unsigned int *)(result + 8);
        if (v5 > v10 || 32 * (int)v11 > v10)
        {
          *(_DWORD *)(result + 8) = v11 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v12 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v11));
          *(_DWORD *)result = v12;
          *(_DWORD *)(result + 8) = v11 + 1;
          v9 |= *(_DWORD *)(result + 4 * v7 + 24) & (v12 >> v8);
        }
      }
      *v3 = v9;
    }
    if (v2[65])
    {
      v32 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v32;
      v33 = *(unsigned int *)(result + 4);
      if (v33 >= 8)
      {
        v40 = v33 - 8;
        *(_DWORD *)(result + 4) = v40;
        v36 = (*(_DWORD *)result >> v40) & *(_DWORD *)(result + 56);
      }
      else
      {
        v34 = 8 - v33;
        v35 = v33 + 24;
        *(_DWORD *)(result + 4) = v33 + 24;
        v36 = (*(_DWORD *)result << (8 - v33)) & *(_DWORD *)(result + 56);
        v37 = *(_DWORD *)(result + 160);
        v38 = *(unsigned int *)(result + 8);
        if (v32 > v37 || 32 * (int)v38 > v37)
        {
          *(_DWORD *)(result + 8) = v38 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v39 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v38));
          *(_DWORD *)result = v39;
          *(_DWORD *)(result + 8) = v38 + 1;
          v36 |= *(_DWORD *)(result + 4 * v34 + 24) & (v39 >> v35);
        }
      }
      v3[1] = v36;
    }
    if (v2[66])
    {
      v59 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v59;
      v60 = *(unsigned int *)(result + 4);
      if (v60 >= 8)
      {
        v67 = v60 - 8;
        *(_DWORD *)(result + 4) = v67;
        v63 = (*(_DWORD *)result >> v67) & *(_DWORD *)(result + 56);
      }
      else
      {
        v61 = 8 - v60;
        v62 = v60 + 24;
        *(_DWORD *)(result + 4) = v60 + 24;
        v63 = (*(_DWORD *)result << (8 - v60)) & *(_DWORD *)(result + 56);
        v64 = *(_DWORD *)(result + 160);
        v65 = *(unsigned int *)(result + 8);
        if (v59 > v64 || 32 * (int)v65 > v64)
        {
          *(_DWORD *)(result + 8) = v65 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v66 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v65));
          *(_DWORD *)result = v66;
          *(_DWORD *)(result + 8) = v65 + 1;
          v63 |= *(_DWORD *)(result + 4 * v61 + 24) & (v66 >> v62);
        }
      }
      v3[2] = v63;
    }
    if (v2[67])
    {
      v86 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v86;
      v87 = *(unsigned int *)(result + 4);
      if (v87 >= 8)
      {
        v94 = v87 - 8;
        *(_DWORD *)(result + 4) = v94;
        v90 = (*(_DWORD *)result >> v94) & *(_DWORD *)(result + 56);
      }
      else
      {
        v88 = 8 - v87;
        v89 = v87 + 24;
        *(_DWORD *)(result + 4) = v87 + 24;
        v90 = (*(_DWORD *)result << (8 - v87)) & *(_DWORD *)(result + 56);
        v91 = *(_DWORD *)(result + 160);
        v92 = *(unsigned int *)(result + 8);
        if (v86 > v91 || 32 * (int)v92 > v91)
        {
          *(_DWORD *)(result + 8) = v92 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v93 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v92));
          *(_DWORD *)result = v93;
          *(_DWORD *)(result + 8) = v92 + 1;
          v90 |= *(_DWORD *)(result + 4 * v88 + 24) & (v93 >> v89);
        }
      }
      v3[3] = v90;
    }
    if (v2[68])
    {
      v113 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v113;
      v114 = *(unsigned int *)(result + 4);
      if (v114 >= 8)
      {
        v121 = v114 - 8;
        *(_DWORD *)(result + 4) = v121;
        v117 = (*(_DWORD *)result >> v121) & *(_DWORD *)(result + 56);
      }
      else
      {
        v115 = 8 - v114;
        v116 = v114 + 24;
        *(_DWORD *)(result + 4) = v114 + 24;
        v117 = (*(_DWORD *)result << (8 - v114)) & *(_DWORD *)(result + 56);
        v118 = *(_DWORD *)(result + 160);
        v119 = *(unsigned int *)(result + 8);
        if (v113 > v118 || 32 * (int)v119 > v118)
        {
          *(_DWORD *)(result + 8) = v119 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v120 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v119));
          *(_DWORD *)result = v120;
          *(_DWORD *)(result + 8) = v119 + 1;
          v117 |= *(_DWORD *)(result + 4 * v115 + 24) & (v120 >> v116);
        }
      }
      v3[4] = v117;
    }
    if (v2[69])
    {
      v140 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v140;
      v141 = *(unsigned int *)(result + 4);
      if (v141 >= 8)
      {
        v148 = v141 - 8;
        *(_DWORD *)(result + 4) = v148;
        v144 = (*(_DWORD *)result >> v148) & *(_DWORD *)(result + 56);
      }
      else
      {
        v142 = 8 - v141;
        v143 = v141 + 24;
        *(_DWORD *)(result + 4) = v141 + 24;
        v144 = (*(_DWORD *)result << (8 - v141)) & *(_DWORD *)(result + 56);
        v145 = *(_DWORD *)(result + 160);
        v146 = *(unsigned int *)(result + 8);
        if (v140 > v145 || 32 * (int)v146 > v145)
        {
          *(_DWORD *)(result + 8) = v146 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v147 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v146));
          *(_DWORD *)result = v147;
          *(_DWORD *)(result + 8) = v146 + 1;
          v144 |= *(_DWORD *)(result + 4 * v142 + 24) & (v147 >> v143);
        }
      }
      v3[5] = v144;
    }
    if (v2[71])
    {
      v167 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v167;
      v168 = *(unsigned int *)(result + 4);
      if (v168 >= 8)
      {
        v175 = v168 - 8;
        *(_DWORD *)(result + 4) = v175;
        v171 = (*(_DWORD *)result >> v175) & *(_DWORD *)(result + 56);
      }
      else
      {
        v169 = 8 - v168;
        v170 = v168 + 24;
        *(_DWORD *)(result + 4) = v168 + 24;
        v171 = (*(_DWORD *)result << (8 - v168)) & *(_DWORD *)(result + 56);
        v172 = *(_DWORD *)(result + 160);
        v173 = *(unsigned int *)(result + 8);
        if (v167 > v172 || 32 * (int)v173 > v172)
        {
          *(_DWORD *)(result + 8) = v173 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v174 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v173));
          *(_DWORD *)result = v174;
          *(_DWORD *)(result + 8) = v173 + 1;
          v171 |= *(_DWORD *)(result + 4 * v169 + 24) & (v174 >> v170);
        }
      }
      v3[6] = v171;
    }
    if (v2[74])
    {
      v194 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v194;
      v195 = *(unsigned int *)(result + 4);
      if (v195 >= 8)
      {
        v202 = v195 - 8;
        *(_DWORD *)(result + 4) = v202;
        v198 = (*(_DWORD *)result >> v202) & *(_DWORD *)(result + 56);
      }
      else
      {
        v196 = 8 - v195;
        v197 = v195 + 24;
        *(_DWORD *)(result + 4) = v195 + 24;
        v198 = (*(_DWORD *)result << (8 - v195)) & *(_DWORD *)(result + 56);
        v199 = *(_DWORD *)(result + 160);
        v200 = *(unsigned int *)(result + 8);
        if (v194 > v199 || 32 * (int)v200 > v199)
        {
          *(_DWORD *)(result + 8) = v200 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v201 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v200));
          *(_DWORD *)result = v201;
          *(_DWORD *)(result + 8) = v200 + 1;
          v198 |= *(_DWORD *)(result + 4 * v196 + 24) & (v201 >> v197);
        }
      }
      v3[9] = v198;
    }
    if (v2[76])
    {
      v221 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v221;
      v222 = *(unsigned int *)(result + 4);
      if (v222 >= 8)
      {
        v229 = v222 - 8;
        *(_DWORD *)(result + 4) = v229;
        v225 = (*(_DWORD *)result >> v229) & *(_DWORD *)(result + 56);
      }
      else
      {
        v223 = 8 - v222;
        v224 = v222 + 24;
        *(_DWORD *)(result + 4) = v222 + 24;
        v225 = (*(_DWORD *)result << (8 - v222)) & *(_DWORD *)(result + 56);
        v226 = *(_DWORD *)(result + 160);
        v227 = *(unsigned int *)(result + 8);
        if (v221 > v226 || 32 * (int)v227 > v226)
        {
          *(_DWORD *)(result + 8) = v227 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v228 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v227));
          *(_DWORD *)result = v228;
          *(_DWORD *)(result + 8) = v227 + 1;
          v225 |= *(_DWORD *)(result + 4 * v223 + 24) & (v228 >> v224);
        }
      }
      v3[10] = v225;
    }
    if (v2[77])
    {
      v248 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v248;
      v249 = *(unsigned int *)(result + 4);
      if (v249 >= 8)
      {
        v256 = v249 - 8;
        *(_DWORD *)(result + 4) = v256;
        v252 = (*(_DWORD *)result >> v256) & *(_DWORD *)(result + 56);
      }
      else
      {
        v250 = 8 - v249;
        v251 = v249 + 24;
        *(_DWORD *)(result + 4) = v249 + 24;
        v252 = (*(_DWORD *)result << (8 - v249)) & *(_DWORD *)(result + 56);
        v253 = *(_DWORD *)(result + 160);
        v254 = *(unsigned int *)(result + 8);
        if (v248 > v253 || 32 * (int)v254 > v253)
        {
          *(_DWORD *)(result + 8) = v254 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v255 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v254));
          *(_DWORD *)result = v255;
          *(_DWORD *)(result + 8) = v254 + 1;
          v252 |= *(_DWORD *)(result + 4 * v250 + 24) & (v255 >> v251);
        }
      }
      v3[11] = v252;
    }
    if (v2[78])
    {
      v275 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v275;
      v276 = *(unsigned int *)(result + 4);
      if (v276 >= 8)
      {
        v283 = v276 - 8;
        *(_DWORD *)(result + 4) = v283;
        v279 = (*(_DWORD *)result >> v283) & *(_DWORD *)(result + 56);
      }
      else
      {
        v277 = 8 - v276;
        v278 = v276 + 24;
        *(_DWORD *)(result + 4) = v276 + 24;
        v279 = (*(_DWORD *)result << (8 - v276)) & *(_DWORD *)(result + 56);
        v280 = *(_DWORD *)(result + 160);
        v281 = *(unsigned int *)(result + 8);
        if (v275 > v280 || 32 * (int)v281 > v280)
        {
          *(_DWORD *)(result + 8) = v281 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v282 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v281));
          *(_DWORD *)result = v282;
          *(_DWORD *)(result + 8) = v281 + 1;
          v279 |= *(_DWORD *)(result + 4 * v277 + 24) & (v282 >> v278);
        }
      }
      v3[12] = v279;
    }
    if (v2[79])
    {
      v302 = *(_DWORD *)(result + 156) + 4;
      *(_DWORD *)(result + 156) = v302;
      v303 = *(unsigned int *)(result + 4);
      if (v303 >= 4)
      {
        v310 = v303 - 4;
        *(_DWORD *)(result + 4) = v310;
        v306 = (*(_DWORD *)result >> v310) & *(_DWORD *)(result + 40);
      }
      else
      {
        v304 = 4 - v303;
        v305 = v303 + 28;
        *(_DWORD *)(result + 4) = v303 + 28;
        v306 = (*(_DWORD *)result << (4 - v303)) & *(_DWORD *)(result + 40);
        v307 = *(_DWORD *)(result + 160);
        v308 = *(unsigned int *)(result + 8);
        if (v302 > v307 || 32 * (int)v308 > v307)
        {
          *(_DWORD *)(result + 8) = v308 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v309 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v308));
          *(_DWORD *)result = v309;
          *(_DWORD *)(result + 8) = v308 + 1;
          v306 |= *(_DWORD *)(result + 4 * v304 + 24) & (v309 >> v305);
        }
      }
      v3[13] = v306;
    }
    if (v2[88])
    {
      v329 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v329;
      v330 = *(unsigned int *)(result + 4);
      if (v330 >= 8)
      {
        v337 = v330 - 8;
        *(_DWORD *)(result + 4) = v337;
        v333 = (*(_DWORD *)result >> v337) & *(_DWORD *)(result + 56);
      }
      else
      {
        v331 = 8 - v330;
        v332 = v330 + 24;
        *(_DWORD *)(result + 4) = v330 + 24;
        v333 = (*(_DWORD *)result << (8 - v330)) & *(_DWORD *)(result + 56);
        v334 = *(_DWORD *)(result + 160);
        v335 = *(unsigned int *)(result + 8);
        if (v329 > v334 || 32 * (int)v335 > v334)
        {
          *(_DWORD *)(result + 8) = v335 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v336 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v335));
          *(_DWORD *)result = v336;
          *(_DWORD *)(result + 8) = v335 + 1;
          v333 |= *(_DWORD *)(result + 4 * v331 + 24) & (v336 >> v332);
        }
      }
      v3[20] = v333;
    }
LABEL_438:
    v4 = v2[148];
  }
  if (v4 == 3 && v2[90] == 2)
  {
    if (v2[71])
    {
      v491 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v491;
      v492 = *(unsigned int *)(result + 4);
      if (v492 >= 8)
      {
        v499 = v492 - 8;
        *(_DWORD *)(result + 4) = v499;
        v495 = (*(_DWORD *)result >> v499) & *(_DWORD *)(result + 56);
      }
      else
      {
        v493 = 8 - v492;
        v494 = v492 + 24;
        *(_DWORD *)(result + 4) = v492 + 24;
        v495 = (*(_DWORD *)result << (8 - v492)) & *(_DWORD *)(result + 56);
        v496 = *(_DWORD *)(result + 160);
        v497 = *(unsigned int *)(result + 8);
        if (v491 > v496 || 32 * (int)v497 > v496)
        {
          *(_DWORD *)(result + 8) = v497 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v498 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v497));
          *(_DWORD *)result = v498;
          *(_DWORD *)(result + 8) = v497 + 1;
          v495 |= *(_DWORD *)(result + 4 * v493 + 24) & (v498 >> v494);
        }
      }
      v3[6] = v495;
    }
    if (v2[74])
    {
      v500 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v500;
      v501 = *(unsigned int *)(result + 4);
      if (v501 >= 8)
      {
        v508 = v501 - 8;
        *(_DWORD *)(result + 4) = v508;
        v504 = (*(_DWORD *)result >> v508) & *(_DWORD *)(result + 56);
      }
      else
      {
        v502 = 8 - v501;
        v503 = v501 + 24;
        *(_DWORD *)(result + 4) = v501 + 24;
        v504 = (*(_DWORD *)result << (8 - v501)) & *(_DWORD *)(result + 56);
        v505 = *(_DWORD *)(result + 160);
        v506 = *(unsigned int *)(result + 8);
        if (v500 > v505 || 32 * (int)v506 > v505)
        {
          *(_DWORD *)(result + 8) = v506 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v507 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v506));
          *(_DWORD *)result = v507;
          *(_DWORD *)(result + 8) = v506 + 1;
          v504 |= *(_DWORD *)(result + 4 * v502 + 24) & (v507 >> v503);
        }
      }
      v3[9] = v504;
    }
    if (v2[76])
    {
      v509 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v509;
      v510 = *(unsigned int *)(result + 4);
      if (v510 >= 8)
      {
        v517 = v510 - 8;
        *(_DWORD *)(result + 4) = v517;
        v513 = (*(_DWORD *)result >> v517) & *(_DWORD *)(result + 56);
      }
      else
      {
        v511 = 8 - v510;
        v512 = v510 + 24;
        *(_DWORD *)(result + 4) = v510 + 24;
        v513 = (*(_DWORD *)result << (8 - v510)) & *(_DWORD *)(result + 56);
        v514 = *(_DWORD *)(result + 160);
        v515 = *(unsigned int *)(result + 8);
        if (v509 > v514 || 32 * (int)v515 > v514)
        {
          *(_DWORD *)(result + 8) = v515 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v516 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v515));
          *(_DWORD *)result = v516;
          *(_DWORD *)(result + 8) = v515 + 1;
          v513 |= *(_DWORD *)(result + 4 * v511 + 24) & (v516 >> v512);
        }
      }
      v3[10] = v513;
    }
    if (v2[77])
    {
      v518 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v518;
      v519 = *(unsigned int *)(result + 4);
      if (v519 >= 8)
      {
        v526 = v519 - 8;
        *(_DWORD *)(result + 4) = v526;
        v522 = (*(_DWORD *)result >> v526) & *(_DWORD *)(result + 56);
      }
      else
      {
        v520 = 8 - v519;
        v521 = v519 + 24;
        *(_DWORD *)(result + 4) = v519 + 24;
        v522 = (*(_DWORD *)result << (8 - v519)) & *(_DWORD *)(result + 56);
        v523 = *(_DWORD *)(result + 160);
        v524 = *(unsigned int *)(result + 8);
        if (v518 > v523 || 32 * (int)v524 > v523)
        {
          *(_DWORD *)(result + 8) = v524 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v525 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v524));
          *(_DWORD *)result = v525;
          *(_DWORD *)(result + 8) = v524 + 1;
          v522 |= *(_DWORD *)(result + 4 * v520 + 24) & (v525 >> v521);
        }
      }
      v3[11] = v522;
    }
    if (v2[78])
    {
      v527 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v527;
      v528 = *(unsigned int *)(result + 4);
      if (v528 >= 8)
      {
        v535 = v528 - 8;
        *(_DWORD *)(result + 4) = v535;
        v531 = (*(_DWORD *)result >> v535) & *(_DWORD *)(result + 56);
      }
      else
      {
        v529 = 8 - v528;
        v530 = v528 + 24;
        *(_DWORD *)(result + 4) = v528 + 24;
        v531 = (*(_DWORD *)result << (8 - v528)) & *(_DWORD *)(result + 56);
        v532 = *(_DWORD *)(result + 160);
        v533 = *(unsigned int *)(result + 8);
        if (v527 > v532 || 32 * (int)v533 > v532)
        {
          *(_DWORD *)(result + 8) = v533 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v534 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v533));
          *(_DWORD *)result = v534;
          *(_DWORD *)(result + 8) = v533 + 1;
          v531 |= *(_DWORD *)(result + 4 * v529 + 24) & (v534 >> v530);
        }
      }
      v3[12] = v531;
    }
    if (v2[79])
    {
      v536 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v536;
      v537 = *(unsigned int *)(result + 4);
      if (v537 >= 8)
      {
        v544 = v537 - 8;
        *(_DWORD *)(result + 4) = v544;
        v540 = (*(_DWORD *)result >> v544) & *(_DWORD *)(result + 56);
      }
      else
      {
        v538 = 8 - v537;
        v539 = v537 + 24;
        *(_DWORD *)(result + 4) = v537 + 24;
        v540 = (*(_DWORD *)result << (8 - v537)) & *(_DWORD *)(result + 56);
        v541 = *(_DWORD *)(result + 160);
        v542 = *(unsigned int *)(result + 8);
        if (v536 > v541 || 32 * (int)v542 > v541)
        {
          *(_DWORD *)(result + 8) = v542 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v543 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v542));
          *(_DWORD *)result = v543;
          *(_DWORD *)(result + 8) = v542 + 1;
          v540 |= *(_DWORD *)(result + 4 * v538 + 24) & (v543 >> v539);
        }
      }
      v3[13] = v540;
    }
    if (v2[72])
    {
      v545 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v545;
      v546 = *(unsigned int *)(result + 4);
      if (v546 >= 8)
      {
        v553 = v546 - 8;
        *(_DWORD *)(result + 4) = v553;
        v549 = (*(_DWORD *)result >> v553) & *(_DWORD *)(result + 56);
      }
      else
      {
        v547 = 8 - v546;
        v548 = v546 + 24;
        *(_DWORD *)(result + 4) = v546 + 24;
        v549 = (*(_DWORD *)result << (8 - v546)) & *(_DWORD *)(result + 56);
        v550 = *(_DWORD *)(result + 160);
        v551 = *(unsigned int *)(result + 8);
        if (v545 > v550 || 32 * (int)v551 > v550)
        {
          *(_DWORD *)(result + 8) = v551 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v552 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v551));
          *(_DWORD *)result = v552;
          *(_DWORD *)(result + 8) = v551 + 1;
          v549 |= *(_DWORD *)(result + 4 * v547 + 24) & (v552 >> v548);
        }
      }
      v3[7] = v549;
    }
    if (v2[73])
    {
      v554 = *(_DWORD *)(result + 156) + 4;
      *(_DWORD *)(result + 156) = v554;
      v555 = *(unsigned int *)(result + 4);
      if (v555 >= 4)
      {
        v562 = v555 - 4;
        *(_DWORD *)(result + 4) = v562;
        v558 = (*(_DWORD *)result >> v562) & *(_DWORD *)(result + 40);
      }
      else
      {
        v556 = 4 - v555;
        v557 = v555 + 28;
        *(_DWORD *)(result + 4) = v555 + 28;
        v558 = (*(_DWORD *)result << (4 - v555)) & *(_DWORD *)(result + 40);
        v559 = *(_DWORD *)(result + 160);
        v560 = *(unsigned int *)(result + 8);
        if (v554 > v559 || 32 * (int)v560 > v559)
        {
          *(_DWORD *)(result + 8) = v560 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v561 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v560));
          *(_DWORD *)result = v561;
          *(_DWORD *)(result + 8) = v560 + 1;
          v558 |= *(_DWORD *)(result + 4 * v556 + 24) & (v561 >> v557);
        }
      }
      v3[8] = v558;
    }
    if (v2[81])
    {
      v563 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v563;
      v564 = *(unsigned int *)(result + 4);
      if (v564 >= 8)
      {
        v571 = v564 - 8;
        *(_DWORD *)(result + 4) = v571;
        v567 = (*(_DWORD *)result >> v571) & *(_DWORD *)(result + 56);
      }
      else
      {
        v565 = 8 - v564;
        v566 = v564 + 24;
        *(_DWORD *)(result + 4) = v564 + 24;
        v567 = (*(_DWORD *)result << (8 - v564)) & *(_DWORD *)(result + 56);
        v568 = *(_DWORD *)(result + 160);
        v569 = *(unsigned int *)(result + 8);
        if (v563 > v568 || 32 * (int)v569 > v568)
        {
          *(_DWORD *)(result + 8) = v569 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v570 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v569));
          *(_DWORD *)result = v570;
          *(_DWORD *)(result + 8) = v569 + 1;
          v567 |= *(_DWORD *)(result + 4 * v565 + 24) & (v570 >> v566);
        }
      }
      v3[14] = v567;
    }
    if (v2[82])
    {
      v572 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v572;
      v573 = *(unsigned int *)(result + 4);
      if (v573 >= 8)
      {
        v580 = v573 - 8;
        *(_DWORD *)(result + 4) = v580;
        v576 = (*(_DWORD *)result >> v580) & *(_DWORD *)(result + 56);
      }
      else
      {
        v574 = 8 - v573;
        v575 = v573 + 24;
        *(_DWORD *)(result + 4) = v573 + 24;
        v576 = (*(_DWORD *)result << (8 - v573)) & *(_DWORD *)(result + 56);
        v577 = *(_DWORD *)(result + 160);
        v578 = *(unsigned int *)(result + 8);
        if (v572 > v577 || 32 * (int)v578 > v577)
        {
          *(_DWORD *)(result + 8) = v578 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v579 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v578));
          *(_DWORD *)result = v579;
          *(_DWORD *)(result + 8) = v578 + 1;
          v576 |= *(_DWORD *)(result + 4 * v574 + 24) & (v579 >> v575);
        }
      }
      v3[15] = v576;
    }
    if (v2[84])
    {
      v581 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v581;
      v582 = *(unsigned int *)(result + 4);
      if (v582 >= 8)
      {
        v589 = v582 - 8;
        *(_DWORD *)(result + 4) = v589;
        v585 = (*(_DWORD *)result >> v589) & *(_DWORD *)(result + 56);
      }
      else
      {
        v583 = 8 - v582;
        v584 = v582 + 24;
        *(_DWORD *)(result + 4) = v582 + 24;
        v585 = (*(_DWORD *)result << (8 - v582)) & *(_DWORD *)(result + 56);
        v586 = *(_DWORD *)(result + 160);
        v587 = *(unsigned int *)(result + 8);
        if (v581 > v586 || 32 * (int)v587 > v586)
        {
          *(_DWORD *)(result + 8) = v587 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v588 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v587));
          *(_DWORD *)result = v588;
          *(_DWORD *)(result + 8) = v587 + 1;
          v585 |= *(_DWORD *)(result + 4 * v583 + 24) & (v588 >> v584);
        }
      }
      v3[17] = v585;
    }
    if (v2[85])
    {
      v590 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v590;
      v591 = *(unsigned int *)(result + 4);
      if (v591 >= 8)
      {
        v598 = v591 - 8;
        *(_DWORD *)(result + 4) = v598;
        v594 = (*(_DWORD *)result >> v598) & *(_DWORD *)(result + 56);
      }
      else
      {
        v592 = 8 - v591;
        v593 = v591 + 24;
        *(_DWORD *)(result + 4) = v591 + 24;
        v594 = (*(_DWORD *)result << (8 - v591)) & *(_DWORD *)(result + 56);
        v595 = *(_DWORD *)(result + 160);
        v596 = *(unsigned int *)(result + 8);
        if (v590 > v595 || 32 * (int)v596 > v595)
        {
          *(_DWORD *)(result + 8) = v596 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v597 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v596));
          *(_DWORD *)result = v597;
          *(_DWORD *)(result + 8) = v596 + 1;
          v594 |= *(_DWORD *)(result + 4 * v592 + 24) & (v597 >> v593);
        }
      }
      v3[18] = v594;
    }
    if (v2[86])
    {
      v599 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v599;
      v600 = *(unsigned int *)(result + 4);
      if (v600 >= 8)
      {
        v607 = v600 - 8;
        *(_DWORD *)(result + 4) = v607;
        v603 = (*(_DWORD *)result >> v607) & *(_DWORD *)(result + 56);
      }
      else
      {
        v601 = 8 - v600;
        v602 = v600 + 24;
        *(_DWORD *)(result + 4) = v600 + 24;
        v603 = (*(_DWORD *)result << (8 - v600)) & *(_DWORD *)(result + 56);
        v604 = *(_DWORD *)(result + 160);
        v605 = *(unsigned int *)(result + 8);
        if (v599 > v604 || 32 * (int)v605 > v604)
        {
          *(_DWORD *)(result + 8) = v605 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v606 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v605));
          *(_DWORD *)result = v606;
          *(_DWORD *)(result + 8) = v605 + 1;
          v603 |= *(_DWORD *)(result + 4 * v601 + 24) & (v606 >> v602);
        }
      }
      v3[19] = v603;
    }
    if (v2[83])
    {
      v608 = *(_DWORD *)(result + 156) + 8;
      *(_DWORD *)(result + 156) = v608;
      v609 = *(unsigned int *)(result + 4);
      if (v609 >= 8)
      {
        v616 = v609 - 8;
        *(_DWORD *)(result + 4) = v616;
        v612 = (*(_DWORD *)result >> v616) & *(_DWORD *)(result + 56);
      }
      else
      {
        v610 = 8 - v609;
        v611 = v609 + 24;
        *(_DWORD *)(result + 4) = v609 + 24;
        v612 = (*(_DWORD *)result << (8 - v609)) & *(_DWORD *)(result + 56);
        v613 = *(_DWORD *)(result + 160);
        v614 = *(unsigned int *)(result + 8);
        if (v608 > v613 || 32 * (int)v614 > v613)
        {
          *(_DWORD *)(result + 8) = v614 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v615 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v614));
          *(_DWORD *)result = v615;
          *(_DWORD *)(result + 8) = v614 + 1;
          v612 |= *(_DWORD *)(result + 4 * v610 + 24) & (v615 >> v611);
        }
      }
      v3[16] = v612;
    }
  }
  return result;
}

uint64_t DecHeaderVOPshort(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  int v52;
  unsigned int v53;
  uint64_t v54;
  unsigned int v56;
  uint64_t v57;

  v3 = *(_DWORD *)(result + 156);
  *(_DWORD *)(result + 156) = v3 + 22;
  v4 = *(_DWORD *)(result + 4);
  if (v4 > 0x15)
  {
    v5 = v4 - 22;
    *(_DWORD *)(result + 156) = v3 + 30;
    if (v4 - 22 <= 7)
    {
      v9 = v4 + 2;
      *(_DWORD *)(result + 4) = v4 + 2;
      v10 = *(_DWORD *)(result + 160);
      v11 = *(unsigned int *)(result + 8);
      if (v3 + 30 > v10 || 32 * (int)v11 > v10)
        v19 = 0;
      else
        v19 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v11));
      *(_DWORD *)(result + 8) = v11 + 1;
      *(_DWORD *)result = v19;
      goto LABEL_24;
    }
  }
  else
  {
    v5 = v4 + 10;
    *(_DWORD *)(result + 4) = v4 + 10;
    v6 = *(_DWORD *)(result + 160);
    v7 = *(unsigned int *)(result + 8);
    if (v3 + 22 > v6 || 32 * (int)v7 > v6)
      v13 = 0;
    else
      v13 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v7));
    *(_DWORD *)(result + 8) = v7 + 1;
    *(_DWORD *)result = v13;
  }
  *(_DWORD *)(result + 156) = v3 + 31;
  v9 = v5 - 8;
  if (!v9)
  {
    *(_DWORD *)(result + 4) = 31;
    v14 = *(_DWORD *)(result + 160);
    v15 = *(_DWORD *)(result + 8);
    v16 = 30;
    if (v3 + 31 > v14 || 32 * v15 > v14)
    {
      v18 = 0;
LABEL_28:
      *(_DWORD *)result = v18;
      *(_DWORD *)(result + 8) = v15 + 1;
      v21 = v16 - 1;
      goto LABEL_29;
    }
LABEL_27:
    v18 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v15));
    goto LABEL_28;
  }
LABEL_24:
  *(_DWORD *)(result + 156) = v3 + 32;
  if (v9 == 1)
  {
    v18 = 0;
    v16 = 31;
    *(_DWORD *)(result + 4) = 31;
    v20 = *(_DWORD *)(result + 160);
    v15 = *(_DWORD *)(result + 8);
    if (v3 + 32 > v20 || 32 * v15 > v20)
      goto LABEL_28;
    goto LABEL_27;
  }
  *(_DWORD *)(result + 156) = v3 + 33;
  if (v9 == 2)
  {
    v30 = 0;
    *(_DWORD *)(result + 4) = 31;
    v31 = *(_DWORD *)(result + 160);
    v32 = *(unsigned int *)(result + 8);
    if (v3 + 33 <= v31 && 32 * (int)v32 <= v31)
      v30 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v32));
    *(_DWORD *)result = v30;
    *(_DWORD *)(result + 4) = 30;
    *(_DWORD *)(result + 8) = v32 + 1;
    v26 = 29;
    goto LABEL_49;
  }
  *(_DWORD *)(result + 156) = v3 + 34;
  v21 = v9 - 3;
  if (v9 == 3)
  {
    *(_DWORD *)(result + 4) = 31;
    v33 = *(_DWORD *)(result + 160);
    v34 = *(unsigned int *)(result + 8);
    if (v3 + 34 <= v33 && 32 * (int)v34 <= v33)
      v21 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v34));
    *(_DWORD *)result = v21;
    *(_DWORD *)(result + 8) = v34 + 1;
    v26 = 30;
    goto LABEL_49;
  }
LABEL_29:
  *(_DWORD *)(result + 156) = v3 + 35;
  if (v21 == 1)
  {
    v22 = 0;
    *(_DWORD *)(result + 4) = 31;
    v23 = *(_DWORD *)(result + 160);
    v24 = *(unsigned int *)(result + 8);
    if (v3 + 35 <= v23 && 32 * (int)v24 <= v23)
      v22 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v24));
    *(_DWORD *)result = v22;
    *(_DWORD *)(result + 8) = v24 + 1;
    v25 = 28;
    goto LABEL_50;
  }
  v26 = v21 - 2;
  *(_DWORD *)(result + 156) = v3 + 38;
  if (v21 - 2 <= 2)
  {
    v27 = 0;
    v25 = v21 + 27;
    *(_DWORD *)(result + 4) = v25;
    v28 = *(_DWORD *)(result + 160);
    v29 = *(unsigned int *)(result + 8);
    if (v3 + 38 <= v28 && 32 * (int)v29 <= v28)
      v27 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v29));
    *(_DWORD *)(result + 8) = v29 + 1;
    *(_DWORD *)result = v27;
LABEL_50:
    v35 = *(_DWORD *)result;
    *(_BYTE *)(a3 + 148) = (*(_DWORD *)result >> (v25 - 1)) & 1;
    *(_DWORD *)(result + 156) = v3 + 43;
    if ((v25 - 1) > 3)
    {
      v36 = v25 - 5;
      *(_DWORD *)(result + 156) = v3 + 48;
      if ((v25 - 5) <= 4)
      {
        v39 = 10 - v25;
        v40 = v25 + 22;
        *(_DWORD *)(result + 4) = v40;
        v41 = (v35 << v39) & *(_DWORD *)(result + 44);
        v42 = *(_DWORD *)(result + 160);
        v43 = *(unsigned int *)(result + 8);
        if (v3 + 48 > v42 || 32 * (int)v43 > v42)
        {
          v35 = 0;
          *(_DWORD *)(result + 8) = v43 + 1;
          *(_DWORD *)result = 0;
        }
        else
        {
          v35 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v43));
          *(_DWORD *)result = v35;
          *(_DWORD *)(result + 8) = v43 + 1;
          v41 |= *(_DWORD *)(result + 4 * v39 + 24) & (v35 >> v40);
        }
        *(_WORD *)(a3 + 160) = v41;
        v47 = v3 + 49;
        goto LABEL_67;
      }
    }
    else
    {
      v35 = 0;
      v36 = v25 + 27;
      *(_DWORD *)(result + 4) = v25 + 27;
      v37 = *(_DWORD *)(result + 160);
      v38 = *(unsigned int *)(result + 8);
      if (v3 + 43 <= v37 && 32 * (int)v38 <= v37)
        v35 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v38));
      *(_DWORD *)(result + 8) = v38 + 1;
      *(_DWORD *)result = v35;
    }
    goto LABEL_66;
  }
LABEL_49:
  *(_DWORD *)(result + 156) = v3 + 39;
  v25 = v26 - 3;
  if (v26 != 3)
    goto LABEL_50;
  v35 = 0;
  *(_DWORD *)(result + 4) = 31;
  v44 = *(_DWORD *)(result + 160);
  v45 = *(unsigned int *)(result + 8);
  if (v3 + 39 > v44)
  {
    LOBYTE(v46) = 0;
  }
  else
  {
    LOBYTE(v46) = 0;
    if (32 * (int)v45 <= v44)
    {
      v35 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v45));
      v46 = v35 >> 31;
    }
  }
  *(_DWORD *)result = v35;
  *(_DWORD *)(result + 8) = v45 + 1;
  *(_BYTE *)(a3 + 148) = v46;
  v36 = 27;
LABEL_66:
  v48 = *(_DWORD *)(result + 44);
  v47 = v3 + 49;
  *(_DWORD *)(result + 156) = v47;
  v40 = v36 - 5;
  *(_WORD *)(a3 + 160) = (v35 >> (v36 - 5)) & v48;
  if (v36 != 5)
  {
LABEL_67:
    v49 = v40 - 1;
    goto LABEL_73;
  }
  *(_DWORD *)(result + 4) = 31;
  v50 = *(_DWORD *)(result + 160);
  v51 = *(unsigned int *)(result + 8);
  if (v47 > v50 || 32 * (int)v51 > v50)
  {
    v35 = 0;
    *(_DWORD *)result = 0;
  }
  else
  {
    v35 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v51));
    *(_DWORD *)result = v35;
  }
  *(_DWORD *)(result + 8) = v51 + 1;
  v49 = 31;
  while (1)
  {
LABEL_73:
    while (1)
    {
      *(_DWORD *)(result + 156) = v47 + 1;
      if (!v49)
        break;
      v52 = v49 - 1;
      *(_DWORD *)(result + 4) = v49 - 1;
      if (((v35 >> (v49 - 1)) & 1) == 0)
        return result;
      v47 += 9;
      *(_DWORD *)(result + 156) = v47;
      if (v49 >= 9)
        goto LABEL_88;
      v49 += 23;
      *(_DWORD *)(result + 4) = v49;
      v53 = *(_DWORD *)(result + 160);
      v54 = *(unsigned int *)(result + 8);
      if (v47 > v53 || 32 * (int)v54 > v53)
      {
        v35 = 0;
        *(_DWORD *)(result + 8) = v54 + 1;
        *(_DWORD *)result = 0;
      }
      else
      {
        v35 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v54));
        *(_DWORD *)result = v35;
        *(_DWORD *)(result + 8) = v54 + 1;
      }
    }
    *(_DWORD *)(result + 4) = 31;
    v56 = *(_DWORD *)(result + 160);
    v57 = *(unsigned int *)(result + 8);
    if (v47 + 1 > v56 || 32 * (int)v57 > v56)
      break;
    v35 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v57));
    *(_DWORD *)result = v35;
    *(_DWORD *)(result + 8) = v57 + 1;
    if ((v35 & 0x80000000) == 0)
      return result;
    v47 += 9;
    *(_DWORD *)(result + 156) = v47;
    v52 = 31;
LABEL_88:
    v49 = v52 - 8;
    *(_DWORD *)(result + 4) = v52 - 8;
  }
  *(_DWORD *)result = 0;
  *(_DWORD *)(result + 8) = v57 + 1;
  return result;
}

uint64_t DecHeaderVideoPacket(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  uint64_t result;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  char v37;
  unsigned int i;
  unsigned int v39;
  uint64_t v40;
  unsigned int v42;
  uint64_t v43;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  unsigned int v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  int v63;
  int v64;
  unsigned int v65;
  uint64_t v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  char v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  int v75;

  v2 = *(_DWORD *)(a1 + 156) + 1;
  *(_DWORD *)(a1 + 156) = v2;
  v3 = *(_DWORD *)(a1 + 4);
  if (!v3)
  {
    *(_DWORD *)(a1 + 4) = 31;
    v6 = *(_DWORD *)(a1 + 160);
    v7 = *(unsigned int *)(a1 + 8);
    if (v2 > v6 || 32 * (int)v7 > v6)
      v9 = 0;
    else
      v9 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v7));
    *(_DWORD *)a1 = v9;
    *(_DWORD *)(a1 + 8) = v7 + 1;
    v4 = 31;
    v5 = 7;
    goto LABEL_11;
  }
  v4 = v3 - 1;
  *(_DWORD *)(a1 + 4) = v4;
  v5 = v4 & 7;
  if ((v4 & 7) != 0)
  {
LABEL_11:
    v2 += v5;
    *(_DWORD *)(a1 + 156) = v2;
    v4 &= 0xFFFFFFF8;
    *(_DWORD *)(a1 + 4) = v4;
  }
  if (!*(_BYTE *)(a2 + 148))
  {
    v10 = 17;
LABEL_16:
    v2 += v10;
    *(_DWORD *)(a1 + 156) = v2;
    v11 = v4 - v10;
    if (v4 >= v10)
    {
      *(_DWORD *)(a1 + 4) = v11;
      v13 = (*(_DWORD *)a1 >> (v4 - v10)) & *(_DWORD *)(a1 + 4 * v10 + 24);
      v4 = v11;
    }
    else
    {
      v12 = v10 - v4;
      v4 = 32 - (v10 - v4);
      *(_DWORD *)(a1 + 4) = v4;
      if (v12 <= 0x1F)
        v13 = (*(_DWORD *)a1 << v12) & *(_DWORD *)(a1 + 4 * v10 + 24);
      else
        v13 = 0;
      v14 = *(_DWORD *)(a1 + 160);
      v15 = *(unsigned int *)(a1 + 8);
      if (v2 > v14 || 32 * (int)v15 > v14)
      {
        *(_DWORD *)(a1 + 8) = v15 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v17 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v15));
        *(_DWORD *)a1 = v17;
        *(_DWORD *)(a1 + 8) = v15 + 1;
        v13 |= *(_DWORD *)(a1 + 4 * v12 + 24) & (v17 >> v4);
      }
    }
    if (v13 != 1)
      return 4294965306;
    goto LABEL_28;
  }
  if (*(_BYTE *)(a2 + 148) != 2)
  {
    v10 = *(unsigned __int8 *)(a2 + 162) + 16;
    goto LABEL_16;
  }
LABEL_28:
  v18 = *(unsigned __int8 *)(a2 + 200);
  v19 = v2 + v18;
  *(_DWORD *)(a1 + 156) = v2 + v18;
  v20 = v4 - v18;
  if (v4 >= v18)
  {
    *(_DWORD *)(a1 + 4) = v20;
    v24 = *(_DWORD *)a1;
    v22 = (*(_DWORD *)a1 >> v20) & *(_DWORD *)(a1 + 4 * v18 + 24);
  }
  else
  {
    v21 = v18 - v4;
    v20 = 32 - (v18 - v4);
    *(_DWORD *)(a1 + 4) = v20;
    if (v18 - v4 <= 0x1F)
      v22 = (*(_DWORD *)a1 << v21) & *(_DWORD *)(a1 + 4 * v18 + 24);
    else
      v22 = 0;
    v25 = *(_DWORD *)(a1 + 160);
    v26 = *(unsigned int *)(a1 + 8);
    if (v19 > v25 || 32 * (int)v26 > v25)
    {
      v24 = 0;
      *(_DWORD *)(a1 + 8) = v26 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v26));
      *(_DWORD *)a1 = v24;
      *(_DWORD *)(a1 + 8) = v26 + 1;
      v22 |= *(_DWORD *)(a1 + 4 * v21 + 24) & (v24 >> v20);
    }
  }
  *(_DWORD *)(a2 + 172) = v22;
  v27 = *(unsigned __int8 *)(a2 + 48);
  if (v27 != 2)
  {
    v28 = *(unsigned __int8 *)(a2 + 135);
    v19 += v28;
    *(_DWORD *)(a1 + 156) = v19;
    v29 = v20 - v28;
    if (v20 >= v28)
    {
      *(_DWORD *)(a1 + 4) = v29;
      v31 = (v24 >> (v20 - v28)) & *(_DWORD *)(a1 + 4 * v28 + 24);
      v20 = v29;
    }
    else
    {
      v30 = v28 - v20;
      v20 = 32 - (v28 - v20);
      *(_DWORD *)(a1 + 4) = v20;
      v31 = v30 <= 0x1F ? (v24 << v30) & *(_DWORD *)(a1 + 4 * v28 + 24) : 0;
      v32 = *(_DWORD *)(a1 + 160);
      v33 = *(unsigned int *)(a1 + 8);
      if (v19 > v32 || 32 * (int)v33 > v32)
      {
        v24 = 0;
        *(_DWORD *)(a1 + 8) = v33 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v33));
        *(_DWORD *)a1 = v24;
        *(_DWORD *)(a1 + 8) = v33 + 1;
        v31 |= *(_DWORD *)(a1 + 4 * v30 + 24) & (v24 >> v20);
      }
    }
    *(_BYTE *)(a2 + 201) = v31;
    *(_WORD *)(a2 + 160) = v31;
    if (!v27)
    {
      *(_DWORD *)(a1 + 156) = ++v19;
      if (v20)
      {
        *(_DWORD *)(a1 + 4) = --v20;
        v34 = (v24 >> v20) & 1;
      }
      else
      {
        *(_DWORD *)(a1 + 4) = 31;
        v35 = *(_DWORD *)(a1 + 160);
        v36 = *(unsigned int *)(a1 + 8);
        if (v19 > v35 || 32 * (int)v36 > v35)
        {
          v24 = 0;
          LOBYTE(v34) = 0;
          *(_DWORD *)a1 = 0;
          *(_DWORD *)(a1 + 8) = v36 + 1;
        }
        else
        {
          v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v36));
          *(_DWORD *)a1 = v24;
          *(_DWORD *)(a1 + 8) = v36 + 1;
          v34 = v24 >> 31;
        }
        v20 = 31;
      }
      *(_BYTE *)(a2 + 202) = v34;
    }
  }
  if (*(_BYTE *)(a2 + 202) != 1)
    return 0;
  v37 = 0;
  for (i = v19 + 2; ; ++i)
  {
    *(_DWORD *)(a1 + 156) = i - 1;
    if (v20)
      break;
    *(_DWORD *)(a1 + 4) = 31;
    v39 = *(_DWORD *)(a1 + 160);
    v40 = *(unsigned int *)(a1 + 8);
    if (i - 1 > v39 || 32 * (int)v40 > v39)
    {
      v24 = 0;
      *(_BYTE *)(a2 + 150) = v37;
      *(_DWORD *)a1 = 0;
      *(_DWORD *)(a1 + 8) = v40 + 1;
      goto LABEL_78;
    }
    v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v40));
    *(_DWORD *)a1 = v24;
    *(_DWORD *)(a1 + 8) = v40 + 1;
    if ((v24 & 0x80000000) == 0)
    {
      *(_BYTE *)(a2 + 150) = v37;
LABEL_78:
      v20 = 31;
LABEL_79:
      v45 = v20 - 1;
      goto LABEL_80;
    }
    v20 = 31;
LABEL_68:
    ++v37;
  }
  if (((v24 >> --v20) & 1) != 0)
    goto LABEL_68;
  *(_BYTE *)(a2 + 150) = v37;
  *(_DWORD *)(a1 + 156) = i;
  if (v20)
    goto LABEL_79;
  *(_DWORD *)(a1 + 4) = 31;
  v42 = *(_DWORD *)(a1 + 160);
  v43 = *(unsigned int *)(a1 + 8);
  if (i > v42 || 32 * (int)v43 > v42)
  {
    v24 = 0;
    *(_DWORD *)a1 = 0;
  }
  else
  {
    v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v43));
    *(_DWORD *)a1 = v24;
  }
  *(_DWORD *)(a1 + 8) = v43 + 1;
  v45 = 31;
LABEL_80:
  v46 = *(unsigned __int8 *)(a2 + 52);
  v47 = i + v46;
  *(_DWORD *)(a1 + 156) = i + v46;
  v48 = v45 - v46;
  if (v45 >= v46)
  {
    v50 = (v24 >> v48) & *(_DWORD *)(a1 + 4 * v46 + 24);
  }
  else
  {
    v49 = v46 - v45;
    v48 = 32 - (v46 - v45);
    *(_DWORD *)(a1 + 4) = v48;
    if (v46 - v45 <= 0x1F)
      v50 = (v24 << v49) & *(_DWORD *)(a1 + 4 * v46 + 24);
    else
      v50 = 0;
    v51 = *(_DWORD *)(a1 + 160);
    v52 = *(unsigned int *)(a1 + 8);
    if (v47 > v51 || 32 * (int)v52 > v51)
    {
      v24 = 0;
      *(_DWORD *)(a1 + 8) = v52 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v52));
      *(_DWORD *)a1 = v24;
      *(_DWORD *)(a1 + 8) = v52 + 1;
      v50 |= *(_DWORD *)(a1 + 4 * v49 + 24) & (v24 >> v48);
    }
  }
  *(_WORD *)(a2 + 152) = v50;
  *(_DWORD *)(a1 + 156) = v47 + 1;
  if (!v48)
  {
    v24 = 0;
    *(_DWORD *)(a1 + 4) = 31;
    v58 = *(_DWORD *)(a1 + 160);
    v59 = *(unsigned int *)(a1 + 8);
    if (v47 + 1 <= v58 && 32 * (int)v59 <= v58)
      v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v59));
    *(_DWORD *)a1 = v24;
    *(_DWORD *)(a1 + 8) = v59 + 1;
    *(_DWORD *)(a1 + 156) = v47 + 3;
    v60 = 31;
    goto LABEL_99;
  }
  *(_DWORD *)(a1 + 156) = v47 + 3;
  if (v48 >= 3)
  {
    v60 = v48 - 1;
LABEL_99:
    v54 = v60 - 2;
    *(_DWORD *)(a1 + 4) = v60 - 2;
    v55 = (v24 >> (v60 - 2)) & *(_DWORD *)(a1 + 32);
    goto LABEL_100;
  }
  v53 = 3 - v48;
  v54 = v48 + 29;
  *(_DWORD *)(a1 + 4) = v48 + 29;
  v55 = (v24 << (3 - v48)) & *(_DWORD *)(a1 + 32);
  v56 = *(_DWORD *)(a1 + 160);
  v57 = *(unsigned int *)(a1 + 8);
  if (v47 + 3 > v56 || 32 * (int)v57 > v56)
  {
    v24 = 0;
    *(_DWORD *)(a1 + 8) = v57 + 1;
    *(_DWORD *)a1 = 0;
  }
  else
  {
    v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v57));
    *(_DWORD *)a1 = v24;
    *(_DWORD *)(a1 + 8) = v57 + 1;
    v55 |= *(_DWORD *)(a1 + 4 * v53 + 24) & (v24 >> v54);
  }
LABEL_100:
  *(_BYTE *)(a2 + 148) = v55;
  if (v27 == 2)
    return 0;
  *(_DWORD *)(a1 + 156) = v47 + 6;
  v61 = v54 - 3;
  if (v54 >= 3)
  {
    *(_DWORD *)(a1 + 4) = v61;
    v63 = *(_DWORD *)(a1 + 36);
    v64 = (v24 >> v61) & v63;
  }
  else
  {
    v62 = 3 - v54;
    v61 = v54 + 29;
    *(_DWORD *)(a1 + 4) = v54 + 29;
    v63 = *(_DWORD *)(a1 + 36);
    v64 = (v24 << v62) & v63;
    v65 = *(_DWORD *)(a1 + 160);
    v66 = *(unsigned int *)(a1 + 8);
    if (v47 + 6 > v65 || 32 * (int)v66 > v65)
    {
      v24 = 0;
      *(_DWORD *)(a1 + 8) = v66 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v24 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v66));
      *(_DWORD *)a1 = v24;
      *(_DWORD *)(a1 + 8) = v66 + 1;
      v64 |= *(_DWORD *)(a1 + 4 * v62 + 24) & (v24 >> v61);
    }
  }
  *(_BYTE *)(a2 + 158) = v64;
  if ((_BYTE)v55)
  {
    v67 = v47 + 9;
    *(_DWORD *)(a1 + 156) = v47 + 9;
    v68 = v61 - 3;
    if (v61 >= 3)
    {
      *(_DWORD *)(a1 + 4) = v68;
      v71 = (v24 >> v68) & v63;
    }
    else
    {
      v69 = 3 - v61;
      v70 = v61 + 29;
      *(_DWORD *)(a1 + 4) = v61 + 29;
      v71 = (v24 << (3 - v61)) & v63;
      v72 = *(_DWORD *)(a1 + 160);
      v73 = *(unsigned int *)(a1 + 8);
      if (v67 > v72 || 32 * (int)v73 > v72)
      {
        *(_DWORD *)(a1 + 8) = v73 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v74 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v73));
        *(_DWORD *)a1 = v74;
        *(_DWORD *)(a1 + 8) = v73 + 1;
        v71 |= *(_DWORD *)(a1 + 4 * v69 + 24) & (v74 >> v70);
      }
    }
    *(_BYTE *)(a2 + 162) = v71;
    *(_BYTE *)(a2 + 163) = 1 << (v71 - 1);
    v75 = 16 << v71;
  }
  else
  {
    *(_WORD *)(a2 + 162) = 257;
    LOWORD(v75) = 32;
  }
  result = 0;
  *(_WORD *)(a2 + 164) = v75;
  return result;
}

int *DecHeaderGobThingy(int *result, uint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;

  v2 = *(_DWORD *)(a2 + 156) + 1;
  *(_DWORD *)(a2 + 156) = v2;
  v3 = *(_DWORD *)(a2 + 4);
  if (!v3)
  {
    *(_DWORD *)(a2 + 4) = 31;
    v6 = *(_DWORD *)(a2 + 160);
    v7 = *(unsigned int *)(a2 + 8);
    if (v2 > v6 || 32 * (int)v7 > v6)
      v9 = 0;
    else
      v9 = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v7));
    *(_DWORD *)a2 = v9;
    *(_DWORD *)(a2 + 8) = v7 + 1;
    v4 = 31;
    v5 = 7;
    goto LABEL_11;
  }
  v4 = v3 - 1;
  v5 = ((_BYTE)v3 - 1) & 7;
  if ((v4 & 7) != 0)
  {
LABEL_11:
    v2 += v5;
    v4 &= 0xFFFFFFF8;
  }
  *(_DWORD *)(a2 + 156) = v2 + 5;
  if (v4 > 4)
  {
    v11 = v4 - 5;
    v21 = *(_DWORD *)a2;
    *result = (*(_DWORD *)a2 >> (v4 - 5)) & *(_DWORD *)(a2 + 44);
    *(_DWORD *)(a2 + 156) = v2 + 7;
    if (v4 - 5 <= 1)
    {
      v16 = 7 - v4;
      v17 = v4 + 25;
      *(_DWORD *)(a2 + 4) = v17;
      v18 = (v21 << v16) & *(_DWORD *)(a2 + 32);
      v19 = *(_DWORD *)(a2 + 160);
      v20 = *(unsigned int *)(a2 + 8);
      if (v2 + 7 > v19 || 32 * (int)v20 > v19)
      {
        v21 = 0;
        *(_DWORD *)(a2 + 8) = v20 + 1;
        *(_DWORD *)a2 = 0;
      }
      else
      {
        v21 = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v20));
        *(_DWORD *)a2 = v21;
        *(_DWORD *)(a2 + 8) = v20 + 1;
        v18 |= *(_DWORD *)(a2 + 4 * v16 + 24) & (v21 >> v17);
      }
      result[1] = v18;
      *(_DWORD *)(a2 + 156) = v2 + 12;
      goto LABEL_31;
    }
  }
  else
  {
    v10 = 5 - v4;
    v11 = v4 + 27;
    *(_DWORD *)(a2 + 4) = v4 + 27;
    v12 = (*(_DWORD *)a2 << (5 - v4)) & *(_DWORD *)(a2 + 44);
    v13 = *(_DWORD *)(a2 + 160);
    v14 = *(unsigned int *)(a2 + 8);
    if (v2 + 5 > v13 || 32 * (int)v14 > v13)
    {
      v21 = 0;
      *(_DWORD *)(a2 + 8) = v14 + 1;
      *(_DWORD *)a2 = 0;
    }
    else
    {
      v21 = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v14));
      *(_DWORD *)a2 = v21;
      *(_DWORD *)(a2 + 8) = v14 + 1;
      v12 |= *(_DWORD *)(a2 + 4 * v10 + 24) & (v21 >> v11);
    }
    *result = v12;
  }
  v17 = v11 - 2;
  result[1] = (v21 >> (v11 - 2)) & *(_DWORD *)(a2 + 32);
  v22 = v2 + 12;
  *(_DWORD *)(a2 + 156) = v2 + 12;
  if (v11 - 2 >= 5)
  {
LABEL_31:
    *(_DWORD *)(a2 + 4) = v17 - 5;
    v25 = (v21 >> (v17 - 5)) & *(_DWORD *)(a2 + 44);
    goto LABEL_32;
  }
  v23 = 7 - v11;
  v24 = v11 + 25;
  *(_DWORD *)(a2 + 4) = v24;
  v25 = (v21 << v23) & *(_DWORD *)(a2 + 44);
  v26 = *(_DWORD *)(a2 + 160);
  v27 = *(unsigned int *)(a2 + 8);
  if (v22 > v26 || 32 * (int)v27 > v26)
  {
    *(_DWORD *)(a2 + 8) = v27 + 1;
    *(_DWORD *)a2 = 0;
  }
  else
  {
    v28 = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v27));
    *(_DWORD *)a2 = v28;
    *(_DWORD *)(a2 + 8) = v27 + 1;
    v25 |= *(_DWORD *)(a2 + 4 * v23 + 24) & (v28 >> v24);
  }
LABEL_32:
  result[2] = v25;
  return result;
}

int16x4_t DecMotionVectors(int16x4_t *a1, int16x4_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10, int a11, char a12, unsigned __int8 a13, char a14, uint64_t a15, uint64_t a16, int a17)
{
  uint64_t v18;
  int16x4_t *v20;
  int v21;
  int v22;
  unint64_t v23;
  int v25;
  int16x4_t result;
  int v27;
  __int16 v28;
  __int16 v29;
  int v30;
  __int16 Predictor1MV;
  __int16 v32;
  int v33;
  int v34;
  __int16 v35;
  __int16 v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v46;
  int v49;
  unsigned int v50;
  int v54;
  int v55[3];

  v18 = a3;
  v20 = a1;
  v21 = 2 * a9;
  v22 = *(unsigned __int8 *)(a15 + 163);
  v49 = *(unsigned __int16 *)(a15 + 164);
  v50 = *(unsigned __int8 *)(a15 + 162);
  if (a12 != 2)
  {
    Predictor1MV = GetPredictor1MV(a9, a11, a3, a5, a17);
    v32 = GetPredictor1MV(a9, a11, a6, a8, a17);
    v33 = HuffmanDecMvd(a16);
    v55[0] = v33;
    if (v33 == -99)
      return result;
    if (v50 < 2)
    {
      v35 = v33;
      v34 = HuffmanDecMvd(a16);
      if (v34 == -99)
        return result;
    }
    else
    {
      DecodeLongVector(a16, v50, v22, v55);
      v54 = HuffmanDecMvd(a16);
      if (v54 == -99)
        return result;
      DecodeLongVector(a16, v50, v22, &v54);
      LOWORD(v34) = v54;
      v35 = v55[0];
    }
    v36 = v32 + v34;
    v37 = VerifyMotionVectorRange(v49, (__int16)(Predictor1MV + v35));
    v38 = VerifyMotionVectorRange(v49, v36);
    v39 = (2 * v21) | 2;
    *(_WORD *)(a4 + v39) = v37;
    *(_WORD *)(a4 + 2 * v21) = v37;
    *(_WORD *)(a3 + v39) = v37;
    *(_WORD *)(a3 + 2 * v21) = v37;
    *(_WORD *)(a7 + v39) = v38;
    *(_WORD *)(a7 + 2 * v21) = v38;
    *(_WORD *)(a6 + v39) = v38;
    *(_WORD *)(a6 + 2 * v21) = v38;
    *v20 = vdup_n_s16(v37);
    result = vdup_n_s16(v38);
    *a2 = result;
    return result;
  }
  v46 = *(unsigned __int8 *)(a15 + 163);
  v23 = 0;
  v44 = v21 - 2;
  v43 = a3 + 2 * v21;
  v42 = a6 + 2 * v21;
  do
  {
    LOBYTE(v40) = a14;
    v20->i16[v23] = GetPredictor4MV(v23, a9, a10, a11, v18, a4, a5, a13, v40, a17);
    LOBYTE(v41) = a14;
    a2->i16[v23] = GetPredictor4MV(v23, a9, a10, a11, a6, a7, a8, a13, v41, a17);
    v25 = HuffmanDecMvd(a16);
    v55[0] = v25;
    if (v25 == -99)
      break;
    if (v50 < 2)
    {
      v28 = v25;
      v27 = HuffmanDecMvd(a16);
      if (v27 == -99)
        return result;
    }
    else
    {
      DecodeLongVector(a16, v50, v46, v55);
      v54 = HuffmanDecMvd(a16);
      if (v54 == -99)
        return result;
      DecodeLongVector(a16, v50, v46, &v54);
      LOWORD(v27) = v54;
      v28 = v55[0];
      v20 = a1;
    }
    v20->i16[v23] += v28;
    a2->i16[v23] += v27;
    v20->i16[v23] = VerifyMotionVectorRange(v49, v20->i16[v23]);
    a2->i16[v23] = VerifyMotionVectorRange(v49, a2->i16[v23]);
    v29 = v20->i16[v23];
    if (v23 > 1)
    {
      v30 = v44 + v23;
      *(_WORD *)(a4 + 2 * v30) = v29;
      *(_WORD *)(a7 + 2 * v30) = a2->i16[v23];
    }
    else
    {
      *(_WORD *)(v43 + 2 * v23) = v29;
      *(_WORD *)(v42 + 2 * v23) = a2->i16[v23];
    }
    v18 = a3;
    ++v23;
  }
  while (v23 != 4);
  return result;
}

uint64_t DecodeLongVector(uint64_t result, unsigned int a2, int a3, int *a4)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v14;
  int v15;
  int v16;
  int v17;

  if (a2 >= 2 && *a4)
  {
    v4 = a2 - 1;
    v5 = *(_DWORD *)(result + 156) + a2 - 1;
    *(_DWORD *)(result + 156) = v5;
    v6 = *(_DWORD *)(result + 4);
    v7 = v6 - (a2 - 1);
    if (v6 >= a2 - 1)
    {
      *(_DWORD *)(result + 4) = v7;
      v10 = (*(_DWORD *)result >> v7) & *(_DWORD *)(result + 4 * v4 + 24);
    }
    else
    {
      v8 = v4 - v6;
      v9 = 32 - (v4 - v6);
      *(_DWORD *)(result + 4) = v9;
      if (v8 <= 0x1F)
        v10 = (*(_DWORD *)result << v8) & *(_DWORD *)(result + 4 * v4 + 24);
      else
        v10 = 0;
      v11 = *(_DWORD *)(result + 160);
      v12 = *(unsigned int *)(result + 8);
      if (v5 > v11 || 32 * (int)v12 > v11)
      {
        *(_DWORD *)(result + 8) = v12 + 1;
        *(_DWORD *)result = 0;
      }
      else
      {
        v14 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v12));
        *(_DWORD *)result = v14;
        *(_DWORD *)(result + 8) = v12 + 1;
        v10 |= *(_DWORD *)(result + 4 * v8 + 24) & (v14 >> v9);
      }
    }
    v15 = *a4;
    if (*a4 < 0)
      v15 = -v15;
    v16 = v15 * a3 - a3 + v10;
    if (*a4 >= 0)
      v17 = v16 + 1;
    else
      v17 = ~v16;
    *a4 = v17;
  }
  return result;
}

uint64_t DecMcpbcIVop(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int a4, CBitStreamDeco *a5)
{
  unsigned int v8;
  int v9;
  uint64_t v10;

  if ((a3 - 1) < 2 || a3 == 3 && a4 == 2)
  {
    do
      v8 = HuffmanDecMcbpcInter(a5);
    while (v8 == 20);
    if (v8 != -99)
    {
      v9 = (v8 >> 2) & 7;
LABEL_11:
      v10 = 0;
      *a1 = v9;
      a2[4] = (v8 & 2) != 0;
      a2[5] = v8 & 1;
      return v10;
    }
  }
  else
  {
    do
      v8 = HuffmanDecMcbpcIntra(a5);
    while (v8 == 8);
    if (v8 != -99)
    {
      v9 = (v8 >> 2) + 3;
      goto LABEL_11;
    }
  }
  return 4294965300;
}

uint64_t DecMcpbcPVop(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int a4, CBitStreamDeco *a5)
{
  unsigned int v8;
  BOOL v9;
  int v10;
  uint64_t v11;

  if ((a3 - 1) >= 2 && (a3 != 3 || a4 != 2))
  {
    do
      v8 = HuffmanDecMcbpcIntra(a5);
    while (v8 == 8);
    if (v8 != -99)
    {
      v9 = v8 == 20;
      v10 = (v8 >> 2) + 3;
      goto LABEL_9;
    }
    return 4294965300;
  }
  v8 = HuffmanDecMcbpcInter(a5);
  if (v8 == -99)
    return 4294965300;
  v9 = v8 == 20;
  v10 = (v8 >> 2) & 7;
LABEL_9:
  if (v9)
    LOBYTE(v10) = 5;
  v11 = 0;
  *a1 = v10;
  a2[4] = (v8 & 2) != 0;
  a2[5] = v8 & 1;
  return v11;
}

uint64_t DecCbpy(unsigned __int8 *a1, int a2, CBitStreamDeco *a3)
{
  unsigned int v5;
  uint64_t result;
  unsigned int v7;

  v5 = HuffmanDecCbpy(a3);
  if (v5 == -99)
    return 4294965301;
  v7 = v5;
  result = 0;
  if ((a2 - 5) < 0xFFFFFFFE)
    v7 = ~v7 & 0xF;
  *a1 = v7 >> 3;
  a1[1] = (v7 & 4) != 0;
  a1[2] = (v7 & 2) != 0;
  a1[3] = v7 & 1;
  return result;
}

uint64_t DecDQuant(int *a1, CBitStreamDeco *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;

  v2 = *((_DWORD *)a2 + 39) + 2;
  *((_DWORD *)a2 + 39) = v2;
  v3 = *((unsigned int *)a2 + 1);
  if (v3 >= 2)
  {
    *((_DWORD *)a2 + 1) = v3 - 2;
    v6 = (*(_DWORD *)a2 >> (v3 - 2)) & *((_DWORD *)a2 + 8);
  }
  else
  {
    v4 = 2 - v3;
    v5 = v3 + 30;
    *((_DWORD *)a2 + 1) = v3 + 30;
    v6 = (*(_DWORD *)a2 << (2 - v3)) & *((_DWORD *)a2 + 8);
    v7 = *((_DWORD *)a2 + 40);
    v8 = *((unsigned int *)a2 + 2);
    if (v2 > v7 || 32 * (int)v8 > v7)
    {
      *((_DWORD *)a2 + 2) = v8 + 1;
      *(_DWORD *)a2 = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)a2 + 2) + 4 * v8));
      *(_DWORD *)a2 = v10;
      *((_DWORD *)a2 + 2) = v8 + 1;
      v6 |= *((_DWORD *)a2 + v4 + 6) & (v10 >> v5);
    }
  }
  if (v6 > 3)
    return 4294965303;
  v11 = 0;
  *a1 = dword_219C4A5E0[v6];
  return v11;
}

void CIntraDcDecoder::CIntraDcDecoder(CIntraDcDecoder *this)
{
  __int16 *v1;
  __int16 *v2;
  __int16 *v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  __int16 v8;
  __int16 v9;
  char *v10;
  BOOL v11;
  __int16 *v12;
  __int16 *v13;
  __int16 *v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  int v18;
  __int16 v19;
  __int16 v20;
  char *v21;

  *(_QWORD *)this = 0x9D9D9D9D9D9D9D9DLL;
  *((_QWORD *)this + 1) = 0x9D9D9D9D9D9D9D9DLL;
  v1 = &word_219C4A5F2;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v2 = (__int16 *)&unk_219C4A5F4;
  v3 = &word_219C4A5F6;
  v4 = 18;
  LOWORD(v5) = 15;
  do
  {
    v7 = v2[3];
    v2 += 3;
    v6 = v7;
    if (v7 < (__int16)v5)
    {
      v5 = (__int16)v5;
      v8 = *v1;
      v9 = *v3;
      do
      {
        v10 = (char *)this + v5;
        *v10 = v8;
        v10[16] = v9;
        --v5;
      }
      while (v5 > v6);
    }
    v1 += 3;
    v3 += 3;
    LOWORD(v5) = v6;
    v11 = v4 >= 3;
    v4 -= 3;
  }
  while (v4 != 0 && v11);
  *((_QWORD *)this + 4) = 0x9D9D9D9D9D9D9D9DLL;
  *((_QWORD *)this + 5) = 0x9D9D9D9D9D9D9D9DLL;
  v12 = &word_219C4A61E;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  v13 = (__int16 *)&unk_219C4A620;
  v14 = &word_219C4A622;
  LOWORD(v15) = 15;
  v16 = 15;
  do
  {
    v18 = v13[3];
    v13 += 3;
    v17 = v18;
    if (v18 < (__int16)v15)
    {
      v15 = (__int16)v15;
      v19 = *v12;
      v20 = *v14;
      do
      {
        v21 = (char *)this + v15;
        v21[32] = v19;
        v21[48] = v20;
        --v15;
      }
      while (v15 > v17);
    }
    v12 += 3;
    v14 += 3;
    LOWORD(v15) = v17;
    v11 = v16 >= 3;
    v16 -= 3;
  }
  while (v16 != 0 && v11);
}

CIntraDcDecoder *CIntraDcDecoder::GrabDcLuminance(CIntraDcDecoder *this, int *a2, CBitStreamDeco *a3)
{
  CIntraDcDecoder *v5;
  CIntraDcDecoder *v6;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;

  v13 = 0;
  v5 = (CIntraDcDecoder *)CIntraDcDecoder::GrabDcSizeLuminance(this, &v13, a3);
  v6 = v5;
  if (!(_DWORD)v5)
  {
    v8 = v13;
    if (v13)
    {
      *a2 = CIntraDcDecoder::GrabDcValue(v5, v13, a3);
      if (v8 >= 9)
      {
        v9 = *((_DWORD *)a3 + 39) + 1;
        *((_DWORD *)a3 + 39) = v9;
        v10 = *((_DWORD *)a3 + 1);
        if (v10)
        {
          *((_DWORD *)a3 + 1) = v10 - 1;
        }
        else
        {
          *((_DWORD *)a3 + 1) = 31;
          v11 = *((_DWORD *)a3 + 40);
          v12 = *((unsigned int *)a3 + 2);
          if (v9 > v11 || 32 * (int)v12 > v11)
            *(_DWORD *)a3 = 0;
          else
            *(_DWORD *)a3 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v12));
          *((_DWORD *)a3 + 2) = v12 + 1;
        }
      }
    }
    else
    {
      *a2 = 0;
    }
  }
  return v6;
}

uint64_t CIntraDcDecoder::GrabDcSizeLuminance(CIntraDcDecoder *this, int *a2, CBitStreamDeco *a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;
  char *v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t result;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;

  v3 = *((_DWORD *)a3 + 39);
  v4 = v3 + 4;
  *((_DWORD *)a3 + 39) = v3 + 4;
  v5 = *((unsigned int *)a3 + 1);
  if (v5 >= 4)
  {
    v7 = v5 - 4;
    *((_DWORD *)a3 + 1) = v5 - 4;
    v12 = *(_DWORD *)a3;
    v8 = (*(_DWORD *)a3 >> v7) & *((_DWORD *)a3 + 10);
    if (!v8)
      goto LABEL_15;
  }
  else
  {
    v6 = 4 - v5;
    v7 = v5 + 28;
    *((_DWORD *)a3 + 1) = v5 + 28;
    v8 = (*(_DWORD *)a3 << (4 - v5)) & *((_DWORD *)a3 + 10);
    v9 = *((_DWORD *)a3 + 40);
    v10 = *((unsigned int *)a3 + 2);
    if (v4 > v9 || 32 * (int)v10 > v9)
    {
      v12 = 0;
      *((_DWORD *)a3 + 2) = v10 + 1;
      *(_DWORD *)a3 = 0;
      if (!v8)
      {
LABEL_15:
        *((_DWORD *)a3 + 39) = v3 + 5;
        if (v7)
        {
          v20 = v7 - 1;
          *((_DWORD *)a3 + 1) = v7 - 1;
          if (((v12 >> (v7 - 1)) & 1) == 0)
            goto LABEL_26;
        }
        else
        {
          *((_DWORD *)a3 + 1) = 31;
          v21 = *((_DWORD *)a3 + 40);
          v22 = *((unsigned int *)a3 + 2);
          if (v3 + 5 > v21 || 32 * (int)v22 > v21)
          {
            v12 = 0;
            *(_DWORD *)a3 = 0;
            *((_DWORD *)a3 + 2) = v22 + 1;
            v20 = 31;
            goto LABEL_26;
          }
          v12 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v22));
          *(_DWORD *)a3 = v12;
          *((_DWORD *)a3 + 2) = v22 + 1;
          v20 = 31;
          if ((v12 & 0x80000000) == 0)
          {
LABEL_26:
            v25 = 6;
            do
            {
              *((_DWORD *)a3 + 39) = v3 + v25;
              if (v20)
              {
                *((_DWORD *)a3 + 1) = --v20;
                v26 = (v12 >> v20) & 1;
              }
              else
              {
                *((_DWORD *)a3 + 1) = 31;
                v27 = *((_DWORD *)a3 + 40);
                v28 = *((unsigned int *)a3 + 2);
                if (v3 + v25 > v27 || 32 * (int)v28 > v27)
                {
                  v12 = 0;
                  v26 = 0;
                  *(_DWORD *)a3 = 0;
                  *((_DWORD *)a3 + 2) = v28 + 1;
                }
                else
                {
                  v12 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v28));
                  *(_DWORD *)a3 = v12;
                  *((_DWORD *)a3 + 2) = v28 + 1;
                  v26 = v12 >> 31;
                }
                v20 = 31;
              }
              v24 = v25 + 1;
              if (v26)
                break;
            }
            while (v25++ < 0xC);
            goto LABEL_39;
          }
        }
        v24 = 6;
LABEL_39:
        if (v24 <= 0xC)
          v14 = v24;
        else
          v14 = 0;
        if (v24 <= 0xC)
          result = 0;
        else
          result = 4294958327;
        goto LABEL_45;
      }
    }
    else
    {
      v12 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v10));
      *(_DWORD *)a3 = v12;
      *((_DWORD *)a3 + 2) = v10 + 1;
      v8 |= *((_DWORD *)a3 + v6 + 6) & (v12 >> v7);
      if (!v8)
        goto LABEL_15;
    }
  }
  v13 = (char *)this + v8;
  v14 = *v13;
  v15 = v13[16];
  v16 = v7 + v15;
  *((_DWORD *)a3 + 1) = v16;
  if (v16 >= 0x21)
  {
    v17 = v16 - 32;
    v18 = *((_DWORD *)a3 + 2);
    *((_DWORD *)a3 + 1) = v17;
    *((_DWORD *)a3 + 2) = v18 - 1;
    if (*((_DWORD *)a3 + 40) >= (32 * (v18 - 1)))
      *(_DWORD *)a3 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * (v18 - 2)));
  }
  result = 0;
  *((_DWORD *)a3 + 39) = v4 - v15;
LABEL_45:
  *a2 = v14;
  return result;
}

uint64_t CIntraDcDecoder::GrabDcValue(CIntraDcDecoder *this, unsigned int a2, CBitStreamDeco *a3)
{
  char v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;
  int v13;

  v3 = a2 - 1;
  if ((int)a2 < 1)
  {
    v8 = 0;
  }
  else
  {
    v4 = *((_DWORD *)a3 + 39) + a2;
    *((_DWORD *)a3 + 39) = v4;
    v5 = *((_DWORD *)a3 + 1);
    v6 = v5 - a2;
    if (v5 >= a2)
    {
      *((_DWORD *)a3 + 1) = v6;
      v8 = (*(_DWORD *)a3 >> v6) & *((_DWORD *)a3 + a2 + 6);
    }
    else
    {
      v7 = a2 - v5;
      *((_DWORD *)a3 + 1) = 32 - v7;
      if (v7 <= 0x1F)
        v8 = (*(_DWORD *)a3 << v7) & *((_DWORD *)a3 + a2 + 6);
      else
        v8 = 0;
      v9 = *((_DWORD *)a3 + 40);
      v10 = *((unsigned int *)a3 + 2);
      if (v4 > v9 || 32 * (int)v10 > v9)
      {
        *((_DWORD *)a3 + 2) = v10 + 1;
        *(_DWORD *)a3 = 0;
      }
      else
      {
        v12 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v10));
        *(_DWORD *)a3 = v12;
        *((_DWORD *)a3 + 2) = v10 + 1;
        v8 |= *((_DWORD *)a3 + v7 + 6) & (v12 >> (32 - v7));
      }
    }
    if (((v8 >> v3) & 1) == 0)
    {
      v13 = (-2 << v3) | 1;
      return v13 + v8;
    }
  }
  v13 = 0;
  return v13 + v8;
}

CIntraDcDecoder *CIntraDcDecoder::GrabDcLuminance(CIntraDcDecoder *this, __int16 *a2, CBitStreamDeco *a3)
{
  CIntraDcDecoder *v5;
  CIntraDcDecoder *v6;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;

  v13 = 0;
  v5 = (CIntraDcDecoder *)CIntraDcDecoder::GrabDcSizeLuminance(this, &v13, a3);
  v6 = v5;
  if (!(_DWORD)v5)
  {
    v8 = v13;
    if (v13)
    {
      *a2 = CIntraDcDecoder::GrabDcValue(v5, v13, a3);
      if (v8 >= 9)
      {
        v9 = *((_DWORD *)a3 + 39) + 1;
        *((_DWORD *)a3 + 39) = v9;
        v10 = *((_DWORD *)a3 + 1);
        if (v10)
        {
          *((_DWORD *)a3 + 1) = v10 - 1;
        }
        else
        {
          *((_DWORD *)a3 + 1) = 31;
          v11 = *((_DWORD *)a3 + 40);
          v12 = *((unsigned int *)a3 + 2);
          if (v9 > v11 || 32 * (int)v12 > v11)
            *(_DWORD *)a3 = 0;
          else
            *(_DWORD *)a3 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v12));
          *((_DWORD *)a3 + 2) = v12 + 1;
        }
      }
    }
    else
    {
      *a2 = 0;
    }
  }
  return v6;
}

CIntraDcDecoder *CIntraDcDecoder::GrabDcChrominance(CIntraDcDecoder *this, int *a2, CBitStreamDeco *a3)
{
  CIntraDcDecoder *v5;
  CIntraDcDecoder *v6;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;

  v13 = 0;
  v5 = (CIntraDcDecoder *)CIntraDcDecoder::GrabDcSizeChrominance(this, &v13, a3);
  v6 = v5;
  if (!(_DWORD)v5)
  {
    v8 = v13;
    if (v13)
    {
      *a2 = CIntraDcDecoder::GrabDcValue(v5, v13, a3);
      if (v8 >= 9)
      {
        v9 = *((_DWORD *)a3 + 39) + 1;
        *((_DWORD *)a3 + 39) = v9;
        v10 = *((_DWORD *)a3 + 1);
        if (v10)
        {
          *((_DWORD *)a3 + 1) = v10 - 1;
        }
        else
        {
          *((_DWORD *)a3 + 1) = 31;
          v11 = *((_DWORD *)a3 + 40);
          v12 = *((unsigned int *)a3 + 2);
          if (v9 > v11 || 32 * (int)v12 > v11)
            *(_DWORD *)a3 = 0;
          else
            *(_DWORD *)a3 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v12));
          *((_DWORD *)a3 + 2) = v12 + 1;
        }
      }
    }
    else
    {
      *a2 = 0;
    }
  }
  return v6;
}

uint64_t CIntraDcDecoder::GrabDcSizeChrominance(CIntraDcDecoder *this, int *a2, CBitStreamDeco *a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;
  char *v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t result;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  uint64_t v29;

  v3 = *((_DWORD *)a3 + 39);
  v4 = v3 + 4;
  *((_DWORD *)a3 + 39) = v3 + 4;
  v5 = *((unsigned int *)a3 + 1);
  if (v5 >= 4)
  {
    v7 = v5 - 4;
    *((_DWORD *)a3 + 1) = v5 - 4;
    v12 = *(_DWORD *)a3;
    v8 = (*(_DWORD *)a3 >> v7) & *((_DWORD *)a3 + 10);
    if (!v8)
      goto LABEL_15;
  }
  else
  {
    v6 = 4 - v5;
    v7 = v5 + 28;
    *((_DWORD *)a3 + 1) = v5 + 28;
    v8 = (*(_DWORD *)a3 << (4 - v5)) & *((_DWORD *)a3 + 10);
    v9 = *((_DWORD *)a3 + 40);
    v10 = *((unsigned int *)a3 + 2);
    if (v4 > v9 || 32 * (int)v10 > v9)
    {
      v12 = 0;
      *((_DWORD *)a3 + 2) = v10 + 1;
      *(_DWORD *)a3 = 0;
      if (!v8)
      {
LABEL_15:
        *((_DWORD *)a3 + 39) = v3 + 5;
        if (v7)
        {
          v20 = v7 - 1;
          *((_DWORD *)a3 + 1) = v7 - 1;
          if (((v12 >> (v7 - 1)) & 1) == 0)
            goto LABEL_26;
        }
        else
        {
          *((_DWORD *)a3 + 1) = 31;
          v21 = *((_DWORD *)a3 + 40);
          v22 = *((unsigned int *)a3 + 2);
          if (v3 + 5 > v21 || 32 * (int)v22 > v21)
          {
            v12 = 0;
            *(_DWORD *)a3 = 0;
            *((_DWORD *)a3 + 2) = v22 + 1;
            v20 = 31;
            goto LABEL_26;
          }
          v12 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v22));
          *(_DWORD *)a3 = v12;
          *((_DWORD *)a3 + 2) = v22 + 1;
          v20 = 31;
          if ((v12 & 0x80000000) == 0)
          {
LABEL_26:
            v25 = 5;
            do
            {
              v26 = v3 + v25 + 1;
              *((_DWORD *)a3 + 39) = v26;
              if (v20)
              {
                *((_DWORD *)a3 + 1) = --v20;
                v27 = (v12 >> v20) & 1;
              }
              else
              {
                *((_DWORD *)a3 + 1) = 31;
                v28 = *((_DWORD *)a3 + 40);
                v29 = *((unsigned int *)a3 + 2);
                if (v26 > v28 || 32 * (int)v29 > v28)
                {
                  v12 = 0;
                  v27 = 0;
                  *(_DWORD *)a3 = 0;
                  *((_DWORD *)a3 + 2) = v29 + 1;
                }
                else
                {
                  v12 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v29));
                  *(_DWORD *)a3 = v12;
                  *((_DWORD *)a3 + 2) = v29 + 1;
                  v27 = v12 >> 31;
                }
                v20 = 31;
              }
              v24 = v25 + 1;
              if (v27)
                break;
            }
            while (v25++ < 0xC);
            goto LABEL_39;
          }
        }
        v24 = 5;
LABEL_39:
        if (v24 <= 0xC)
          v14 = v24;
        else
          v14 = 0;
        if (v24 <= 0xC)
          result = 0;
        else
          result = 4294958327;
        goto LABEL_45;
      }
    }
    else
    {
      v12 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v10));
      *(_DWORD *)a3 = v12;
      *((_DWORD *)a3 + 2) = v10 + 1;
      v8 |= *((_DWORD *)a3 + v6 + 6) & (v12 >> v7);
      if (!v8)
        goto LABEL_15;
    }
  }
  v13 = (char *)this + v8;
  v14 = v13[32];
  v15 = v13[48];
  v16 = v7 + v15;
  *((_DWORD *)a3 + 1) = v16;
  if (v16 >= 0x21)
  {
    v17 = v16 - 32;
    v18 = *((_DWORD *)a3 + 2);
    *((_DWORD *)a3 + 1) = v17;
    *((_DWORD *)a3 + 2) = v18 - 1;
    if (*((_DWORD *)a3 + 40) >= (32 * (v18 - 1)))
      *(_DWORD *)a3 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * (v18 - 2)));
  }
  result = 0;
  *((_DWORD *)a3 + 39) = v4 - v15;
LABEL_45:
  *a2 = v14;
  return result;
}

CIntraDcDecoder *CIntraDcDecoder::GrabDcChrominance(CIntraDcDecoder *this, __int16 *a2, CBitStreamDeco *a3)
{
  CIntraDcDecoder *v5;
  CIntraDcDecoder *v6;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;

  v13 = 0;
  v5 = (CIntraDcDecoder *)CIntraDcDecoder::GrabDcSizeChrominance(this, &v13, a3);
  v6 = v5;
  if (!(_DWORD)v5)
  {
    v8 = v13;
    if (v13)
    {
      *a2 = CIntraDcDecoder::GrabDcValue(v5, v13, a3);
      if (v8 >= 9)
      {
        v9 = *((_DWORD *)a3 + 39) + 1;
        *((_DWORD *)a3 + 39) = v9;
        v10 = *((_DWORD *)a3 + 1);
        if (v10)
        {
          *((_DWORD *)a3 + 1) = v10 - 1;
        }
        else
        {
          *((_DWORD *)a3 + 1) = 31;
          v11 = *((_DWORD *)a3 + 40);
          v12 = *((unsigned int *)a3 + 2);
          if (v9 > v11 || 32 * (int)v12 > v11)
            *(_DWORD *)a3 = 0;
          else
            *(_DWORD *)a3 = bswap32(*(_DWORD *)(*((_QWORD *)a3 + 2) + 4 * v12));
          *((_DWORD *)a3 + 2) = v12 + 1;
        }
      }
    }
    else
    {
      *a2 = 0;
    }
  }
  return v6;
}

uint64_t InitSourceInfo(_QWORD *a1, __int16 a2, __int16 a3)
{
  uint64_t result;
  _WORD *v8;
  _WORD *v9;
  int v10;
  int v11;

  if ((unsigned __int16)(a2 + 16) < 0x11u || (unsigned __int16)(a3 + 16) < 0x11u)
    return 4294958333;
  v8 = MEM_NewClear(40);
  *a1 = v8;
  if (!v8)
    return 4294967188;
  v9 = v8;
  result = 0;
  v9[4] = a2;
  v9[5] = a3;
  v10 = (unsigned __int16)(a3 + 15) >> 4;
  v9[1] = v10;
  v11 = (unsigned __int16)(a2 + 15) >> 4;
  *v9 = v11;
  *((_DWORD *)v9 + 1) = v10 * v11;
  *((_DWORD *)v9 + 6) = 0;
  *((_QWORD *)v9 + 2) = 0;
  return result;
}

uint64_t InitGobHeader(uint64_t result)
{
  _QWORD *v1;
  void *v2;

  if (result)
  {
    v1 = (_QWORD *)result;
    if (*(_QWORD *)result)
    {
      return 0;
    }
    else
    {
      v2 = MEM_NewClear(12);
      *v1 = v2;
      if (v2)
        return 0;
      else
        return 4294967188;
    }
  }
  return result;
}

uint64_t InitPictureInfo(_QWORD *a1)
{
  void *v3;

  if (*a1)
    return 0;
  v3 = MEM_NewClear(204);
  *a1 = v3;
  if (v3)
    return 0;
  else
    return 4294967188;
}

uint64_t InitVopComplexityEstimation(_QWORD *a1)
{
  void *v3;

  if (*a1)
    return 0;
  v3 = MEM_NewClear(22);
  *a1 = v3;
  if (v3)
    return 0;
  else
    return 4294967188;
}

uint64_t KillSourceInfo(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
  {
    MEM_Dispose(v2);
    *a1 = 0;
  }
  return 0;
}

uint64_t KillGobHeader(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      MEM_Dispose(v2);
      *a1 = 0;
    }
  }
  return 0;
}

uint64_t EncodeUMVMVD_Pair(int a1, int a2, _WORD *a3, _WORD *a4, char *a5, char *a6, uint64_t a7)
{
  uint64_t result;
  int v12;

  if (a1 == 1 && a2 == 1)
  {
    result = 0;
    *a3 = 0;
    *a4 = 1;
    *a5 = 3;
    *a6 = 4;
  }
  else
  {
    v12 = EncodeUMVMVD(a1, a3, a5, a7);
    return EncodeUMVMVD(a2, a4, a6, a7) + v12;
  }
  return result;
}

uint64_t EncodeUMVMVD(int a1, _WORD *a2, char *a3, uint64_t a4)
{
  unsigned int v5;
  __int16 v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  char v12;
  BOOL v13;

  if ((a1 - 64) > 0xFFFFFF80)
  {
    result = 0;
    v8 = (a1 + 63);
    *a2 = *(_WORD *)(a4 + 2 * v8);
    *a3 = *(_BYTE *)(a4 + v8 + 256);
  }
  else
  {
    if (a1 >= 0)
      v5 = a1;
    else
      v5 = -a1;
    if (v5 <= 0xFFF)
    {
      v9 = 0;
      v10 = 0;
      v11 = (a1 >> 30) & 2;
      v12 = 3;
      do
      {
        v10 |= ((2 * (v5 & 1)) | 1) << v9;
        v12 += 2;
        v9 += 2;
        v13 = v5 > 3;
        v5 >>= 1;
      }
      while (v13);
      result = 0;
      *a3 = v12;
      v6 = v11 | (4 * v10);
    }
    else
    {
      v6 = 0;
      *a3 = 0;
      result = 1;
    }
    *a2 = v6;
  }
  return result;
}

uint64_t DecodeUMVMVD_Pair(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;

  *a1 = DecodeUMVMVD(a3, a4);
  result = DecodeUMVMVD(a3, a4);
  *a2 = result;
  if (*a1 == 1 && (_DWORD)result == 1)
  {
    v10 = *(_DWORD *)(a3 + 156) + 1;
    *(_DWORD *)(a3 + 156) = v10;
    v11 = *(_DWORD *)(a3 + 4);
    if (v11)
    {
      *(_DWORD *)(a3 + 4) = v11 - 1;
    }
    else
    {
      *(_DWORD *)(a3 + 4) = 31;
      v12 = *(_DWORD *)(a3 + 160);
      v13 = *(unsigned int *)(a3 + 8);
      if (v10 > v12 || 32 * (int)v13 > v12)
        *(_DWORD *)a3 = 0;
      else
        *(_DWORD *)a3 = bswap32(*(_DWORD *)(*(_QWORD *)(a3 + 16) + 4 * v13));
      *(_DWORD *)(a3 + 8) = v13 + 1;
    }
  }
  return result;
}

uint64_t DecodeUMVMVD(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v11;
  unsigned int v12;
  unsigned int i;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v19;
  int v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;

  v2 = *(_DWORD *)(a1 + 156);
  v3 = v2 + 11;
  *(_DWORD *)(a1 + 156) = v2 + 11;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 >= 0xB)
  {
    v6 = v4 - 11;
    *(_DWORD *)(a1 + 4) = v6;
    v11 = *(_DWORD *)a1;
    v7 = (*(_DWORD *)a1 >> v6) & *(_DWORD *)(a1 + 68);
    if ((v7 & 0x400) != 0)
      goto LABEL_25;
  }
  else
  {
    v5 = 11 - v4;
    v6 = v4 + 21;
    *(_DWORD *)(a1 + 4) = v6;
    v7 = (*(_DWORD *)a1 << v5) & *(_DWORD *)(a1 + 68);
    v8 = *(_DWORD *)(a1 + 160);
    v9 = *(unsigned int *)(a1 + 8);
    if (v3 > v8 || 32 * (int)v9 > v8)
    {
      v11 = 0;
      *(_DWORD *)(a1 + 8) = v9 + 1;
      *(_DWORD *)a1 = 0;
      if ((v7 & 0x400) != 0)
      {
LABEL_25:
        *(_DWORD *)(a1 + 4) = v6 + 10;
        if (v6 >= 0x17)
        {
          v19 = v6 - 22;
          v20 = *(_DWORD *)(a1 + 8);
          *(_DWORD *)(a1 + 4) = v19;
          *(_DWORD *)(a1 + 8) = v20 - 1;
          if (*(_DWORD *)(a1 + 160) >= (32 * (v20 - 1)))
            *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * (v20 - 2)));
        }
        v21 = 0;
        *(_DWORD *)(a1 + 156) = v2 + 1;
        return v21;
      }
    }
    else
    {
      v11 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v9));
      *(_DWORD *)a1 = v11;
      *(_DWORD *)(a1 + 8) = v9 + 1;
      v7 |= *(_DWORD *)(a1 + 4 * v5 + 24) & (v11 >> v6);
      if ((v7 & 0x400) != 0)
        goto LABEL_25;
    }
  }
  if ((~v7 & 0x155) == 0)
  {
    v12 = *(__int16 *)(a2 + 2 * v7);
    for (i = v2 + 13; ; i += 2)
    {
      *(_DWORD *)(a1 + 156) = i;
      if (v6 >= 2)
      {
        *(_DWORD *)(a1 + 4) = v6 - 2;
        v15 = (v11 >> (v6 - 2)) & *(_DWORD *)(a1 + 32);
        v6 -= 2;
        if ((v15 & 1) == 0)
          goto LABEL_33;
      }
      else
      {
        v14 = 2 - v6;
        v6 += 30;
        *(_DWORD *)(a1 + 4) = v6;
        v15 = (v11 << v14) & *(_DWORD *)(a1 + 32);
        v16 = *(_DWORD *)(a1 + 160);
        v17 = *(unsigned int *)(a1 + 8);
        if (i > v16 || 32 * (int)v17 > v16)
        {
          v11 = 0;
          *(_DWORD *)(a1 + 8) = v17 + 1;
          *(_DWORD *)a1 = 0;
          if ((v15 & 1) == 0)
            goto LABEL_33;
        }
        else
        {
          v11 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v17));
          *(_DWORD *)a1 = v11;
          *(_DWORD *)(a1 + 8) = v17 + 1;
          v15 |= *(_DWORD *)(a1 + 4 * v14 + 24) & (v11 >> v6);
          if ((v15 & 1) == 0)
          {
LABEL_33:
            if (v15)
              return -v12;
            else
              return v12;
          }
        }
      }
      v12 = (v15 >> 1) | (2 * v12);
    }
  }
  v22 = *(char *)(a2 + v7 + 2048);
  v23 = v6 + v22;
  *(_DWORD *)(a1 + 4) = v23;
  if (v23 >= 0x21)
  {
    v24 = v23 - 32;
    v25 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 4) = v24;
    *(_DWORD *)(a1 + 8) = v25 - 1;
    if (*(_DWORD *)(a1 + 160) >= (32 * (v25 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * (v25 - 2)));
  }
  *(_DWORD *)(a1 + 156) = v3 - v22;
  return *(__int16 *)(a2 + 2 * v7);
}

uint64_t InitEncUMVMVDTables(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  char v15;
  unsigned int v16;
  uint64_t v17;

  v2 = MEM_NewClear(384);
  *a1 = (uint64_t)v2;
  if (!v2)
    return 4294967188;
  v3 = -63;
  do
  {
    v4 = -v3;
    if ((unint64_t)-v3 < 2)
    {
      LOWORD(v6) = 0;
      v7 = 3;
    }
    else
    {
      v5 = 0;
      v6 = 0;
      v7 = 3;
      do
      {
        v6 |= ((2 * (v4 & 1)) | 1) << v5;
        v7 += 2;
        v5 += 2;
        v8 = v4 > 3;
        LODWORD(v4) = v4 >> 1;
      }
      while (v8);
    }
    v9 = *a1;
    *(_WORD *)(*a1 + 2 * (v3 + 63)) = (4 * v6) | 2;
    *(_BYTE *)(v9 + v3 + 63 + 256) = v7;
  }
  while (!__CFADD__(v3++, 1));
  v11 = *a1;
  v12 = 1;
  *(_WORD *)(v11 + 126) = 1;
  *(_BYTE *)(v11 + 319) = 1;
  do
  {
    if (v12 < 2)
    {
      LOWORD(v14) = 0;
      v15 = 3;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 3;
      v16 = v12;
      do
      {
        v14 |= ((2 * (v16 & 1)) | 1) << v13;
        v15 += 2;
        v13 += 2;
        v8 = v16 > 3;
        v16 >>= 1;
      }
      while (v8);
    }
    v17 = *a1;
    *(_WORD *)(*a1 + 2 * (v12 + 63)) = 4 * v14;
    *(_BYTE *)(v17 + v12 + 63 + 256) = v15;
    ++v12;
  }
  while (v12 != 64);
  return 0;
}

uint64_t InitDecodeUMVMVDTables(uint64_t *a1)
{
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned __int8 v7;
  unsigned int v8;
  __int16 v9;
  char v10;
  int v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  unsigned int v18;
  int v19;
  int v20;
  char v21;
  unsigned int v22;
  char v23;
  char v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  BOOL v31;
  unsigned int v32;
  int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;

  v2 = MEM_NewClear(3072);
  *a1 = (uint64_t)v2;
  if (!v2)
    return 4294967188;
  v3 = 65505;
  do
  {
    v4 = -v3;
    if ((unsigned __int16)-(__int16)v3 < 2u)
    {
      LOWORD(v6) = 0;
      v7 = 3;
    }
    else
    {
      v5 = 0;
      v6 = 0;
      v7 = 3;
      do
      {
        v8 = (unsigned __int16)v4;
        v6 |= ((2 * (v4 & 1)) | 1) << v5;
        LOWORD(v4) = (unsigned __int16)v4 >> 1;
        v7 += 2;
        v5 += 2;
      }
      while (v8 > 3);
    }
    v9 = (4 * v6) | 2;
    v10 = 11 - v7;
    v11 = v7;
    v12 = (v9 & 0xFFFE) << (11 - v7);
    v13 = (unsigned __int16)v12 & 0xFFFE;
    v14 = v12 | 1;
    v15 = v12 + (1 << v10);
    if (v11 == 11)
      LOWORD(v15) = v14;
    if ((unsigned __int16)v15 > v13)
    {
      do
      {
        v16 = *a1;
        *(_WORD *)(*a1 + 2 * v13) = v3;
        *(_BYTE *)(v16 + v13++ + 2048) = v10;
      }
      while (v13 < (unsigned __int16)v15);
    }
    v17 = (__int16)v3++ >= -1;
  }
  while (!v17);
  v18 = 1;
  do
  {
    if (v18 < 2)
    {
      LOWORD(v25) = 0;
      v28 = 8;
      v24 = 8;
    }
    else
    {
      v19 = 0;
      v20 = 0;
      v21 = 3;
      v22 = v18;
      do
      {
        v23 = v21;
        v20 |= ((2 * (v22 & 1)) | 1) << v19;
        v21 += 2;
        v19 += 2;
        v17 = v22 > 3;
        v22 >>= 1;
      }
      while (v17);
      v24 = 9 - v23;
      v25 = (4 * (v20 & 0x3FFF)) << (9 - v23);
      if (v21 == 11)
      {
        v24 = 0;
        v26 = v25 & 0xFFFC;
        LOWORD(v27) = v25 & 0xFFFC | 1;
        goto LABEL_23;
      }
      v28 = 9 - v23;
    }
    v26 = v25 & 0xFFFC;
    v27 = v26 + (1 << v28);
LABEL_23:
    if ((unsigned __int16)v27 > v26)
    {
      v29 = (unsigned __int16)v25 & 0xFFFC;
      do
      {
        v30 = *a1;
        *(_WORD *)(*a1 + 2 * v29) = v18;
        *(_BYTE *)(v30 + v29++ + 2048) = v24;
      }
      while (v29 < (unsigned __int16)v27);
    }
    v31 = v18++ >= 0x1F;
  }
  while (!v31);
  v32 = 32;
  do
  {
    v33 = 0;
    v34 = 0;
    v35 = v32;
    do
    {
      v34 |= ((2 * (v35 & 1)) | 1) << v33;
      v33 += 2;
      v17 = v35 > 3;
      v35 >>= 1;
    }
    while (v17);
    v36 = *a1;
    *(_WORD *)(*a1 + 2 * (unsigned __int16)v34) = v32;
    *(_BYTE *)(v36 + (unsigned __int16)v34 + 2048) = 0;
    v31 = v32++ >= 0x3F;
  }
  while (!v31);
  return 0;
}

void CIntraPredictor::CIntraPredictor(CIntraPredictor *this)
{
  *((_DWORD *)this + 77) = 0;
  *((_QWORD *)this + 37) = 0x1050401000302;
  *((_DWORD *)this + 76) = 84148739;
}

uint64_t *CIntraPredictor::ResetUpPredictors(uint64_t *this, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *this;
  *(_WORD *)(*this + 96 * a2 + 16 * a3 + 96) = 1024;
  v4 = 16 * a3 + 96 * a2 + v3;
  *(_QWORD *)(v4 + 104) = 0;
  *(_QWORD *)(v4 + 98) = 0;
  return this;
}

uint64_t CIntraPredictor::ResetLeftPredictors(uint64_t this, int a2)
{
  uint64_t v2;

  v2 = this + 16 * a2;
  *(_WORD *)(v2 + 8) = 1024;
  *(_QWORD *)(v2 + 10) = 0;
  *(_QWORD *)(v2 + 16) = 0;
  return this;
}

uint64_t CIntraPredictor::ResetPredictorsBlock(uint64_t this, int a2, int a3)
{
  uint64_t v3;

  v3 = this + 16 * a3;
  *(_WORD *)(v3 + 8) = 1024;
  *(_QWORD *)(v3 + 10) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  return this;
}

_QWORD *CIntraPredictor::ResetUpPredictorsMb(_QWORD *this, int a2)
{
  uint64_t v2;

  v2 = *this + 96 * a2;
  *(_WORD *)(v2 + 96) = 1024;
  *(_QWORD *)(v2 + 98) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_WORD *)(v2 + 112) = 1024;
  *(_QWORD *)(v2 + 114) = 0;
  *(_QWORD *)(v2 + 120) = 0;
  *(_WORD *)(v2 + 128) = 1024;
  *(_QWORD *)(v2 + 130) = 0;
  *(_QWORD *)(v2 + 136) = 0;
  *(_WORD *)(v2 + 144) = 1024;
  *(_QWORD *)(v2 + 146) = 0;
  *(_QWORD *)(v2 + 152) = 0;
  *(_WORD *)(v2 + 160) = 1024;
  *(_QWORD *)(v2 + 162) = 0;
  *(_QWORD *)(v2 + 168) = 0;
  *(_WORD *)(v2 + 176) = 1024;
  *(_QWORD *)(v2 + 184) = 0;
  *(_QWORD *)(v2 + 178) = 0;
  return this;
}

uint64_t CIntraPredictor::ResetLeftPredictorsMb(uint64_t this)
{
  *(_WORD *)(this + 8) = 1024;
  *(_QWORD *)(this + 10) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_WORD *)(this + 24) = 1024;
  *(_QWORD *)(this + 26) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_WORD *)(this + 40) = 1024;
  *(_QWORD *)(this + 42) = 0;
  *(_QWORD *)(this + 48) = 0;
  *(_WORD *)(this + 56) = 1024;
  *(_QWORD *)(this + 58) = 0;
  *(_QWORD *)(this + 64) = 0;
  *(_WORD *)(this + 72) = 1024;
  *(_QWORD *)(this + 74) = 0;
  *(_QWORD *)(this + 80) = 0;
  *(_WORD *)(this + 88) = 1024;
  *(_QWORD *)(this + 96) = 0;
  *(_QWORD *)(this + 90) = 0;
  return this;
}

uint64_t *CIntraPredictor::ResetPredictorsMb(uint64_t *this, int a2)
{
  uint64_t v2;
  _WORD *v3;
  _WORD *v4;

  v2 = *this;
  v3 = (_WORD *)(*this + 96 * a2);
  v3[8] = *((_WORD *)this + 12);
  v3[24] = *((_WORD *)this + 28);
  v3[32] = *((_WORD *)this + 36);
  v3[40] = *((_WORD *)this + 44);
  v3[48] = 1024;
  v3[64] = 1024;
  if (*((_DWORD *)this + 77) - 1 == a2)
  {
    v4 = (_WORD *)(v2 + 96 * (a2 + 1));
    v4[8] = 1024;
    v4[24] = 1024;
    v4[32] = 1024;
    v4[40] = 1024;
  }
  *((_WORD *)this + 4) = 1024;
  *(uint64_t *)((char *)this + 10) = 0;
  this[2] = 0;
  *((_WORD *)this + 12) = 1024;
  *(uint64_t *)((char *)this + 26) = 0;
  this[4] = 0;
  *((_WORD *)this + 20) = 1024;
  *(uint64_t *)((char *)this + 42) = 0;
  this[6] = 0;
  *((_WORD *)this + 28) = 1024;
  *(uint64_t *)((char *)this + 58) = 0;
  this[8] = 0;
  *((_WORD *)this + 36) = 1024;
  *(uint64_t *)((char *)this + 74) = 0;
  this[10] = 0;
  *((_WORD *)this + 44) = 1024;
  this[12] = 0;
  *(uint64_t *)((char *)this + 90) = 0;
  return this;
}

uint64_t *CIntraPredictor::ResetPredictorsMbAll(uint64_t *this)
{
  uint64_t i;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t j;
  uint64_t k;
  uint64_t v7;

  for (i = 0; i != 12; i += 2)
  {
    v2 = &this[i];
    *((_WORD *)v2 + 4) = 1024;
    *(uint64_t *)((char *)v2 + 10) = 0;
    v2[2] = 0;
  }
  v3 = *((unsigned int *)this + 77);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = *this;
    for (j = -1; j != v3; ++j)
    {
      for (k = 0; k != 96; k += 16)
      {
        v7 = v4 + k;
        *(_WORD *)v7 = 1024;
        *(_QWORD *)(v7 + 2) = 0;
        *(_QWORD *)(v7 + 8) = 0;
      }
      v4 += 96;
    }
  }
  return this;
}

uint64_t CIntraPredictor::DumpUpPredictors(CIntraPredictor *this, char *__filename, int a3)
{
  FILE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  v5 = fopen(__filename, "a+");
  v6 = 0;
  v7 = 96 * (a3 + 1);
  do
  {
    for (i = 0; i != 16; i += 2)
      fprintf(v5, "%5d ", *(__int16 *)(*(_QWORD *)this + v7 + i));
    fwrite("| ", 2uLL, 1uLL, v5);
    ++v6;
    v7 += 16;
  }
  while (v6 != 6);
  fputc(10, v5);
  return fclose(v5);
}

uint64_t CIntraPredictor::DumpLeftPredictors(CIntraPredictor *this, char *__filename)
{
  FILE *v3;
  uint64_t v4;
  char *v5;
  uint64_t i;

  v3 = fopen(__filename, "a+");
  v4 = 0;
  v5 = (char *)this + 8;
  do
  {
    for (i = 0; i != 16; i += 2)
      fprintf(v3, "%5d ", *(__int16 *)&v5[i]);
    fwrite("| ", 2uLL, 1uLL, v3);
    ++v4;
    v5 += 16;
  }
  while (v4 != 6);
  fputc(10, v3);
  return fclose(v3);
}

int *ZigZagBlock(int *result, int *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[8];
  a2[3] = result[16];
  a2[4] = result[9];
  a2[5] = result[2];
  a2[6] = result[3];
  a2[7] = result[10];
  a2[8] = result[17];
  a2[9] = result[24];
  a2[10] = result[32];
  a2[11] = result[25];
  a2[12] = result[18];
  a2[13] = result[11];
  a2[14] = result[4];
  a2[15] = result[5];
  a2[16] = result[12];
  a2[17] = result[19];
  a2[18] = result[26];
  a2[19] = result[33];
  a2[20] = result[40];
  a2[21] = result[48];
  a2[22] = result[41];
  a2[23] = result[34];
  a2[24] = result[27];
  a2[25] = result[20];
  a2[26] = result[13];
  a2[27] = result[6];
  a2[28] = result[7];
  a2[29] = result[14];
  a2[30] = result[21];
  a2[31] = result[28];
  a2[32] = result[35];
  a2[33] = result[42];
  a2[34] = result[49];
  a2[35] = result[56];
  a2[36] = result[57];
  a2[37] = result[50];
  a2[38] = result[43];
  a2[39] = result[36];
  a2[40] = result[29];
  a2[41] = result[22];
  a2[42] = result[15];
  a2[43] = result[23];
  a2[44] = result[30];
  a2[45] = result[37];
  a2[46] = result[44];
  a2[47] = result[51];
  a2[48] = result[58];
  a2[49] = result[59];
  a2[50] = result[52];
  a2[51] = result[45];
  a2[52] = result[38];
  a2[53] = result[31];
  a2[54] = result[39];
  a2[55] = result[46];
  a2[56] = result[53];
  a2[57] = result[60];
  a2[58] = result[61];
  a2[59] = result[54];
  a2[60] = result[47];
  a2[61] = result[55];
  a2[62] = result[62];
  a2[63] = result[63];
  return result;
}

__int16 *ZigZagBlockS16(__int16 *result, __int16 *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[8];
  a2[3] = result[16];
  a2[4] = result[9];
  a2[5] = result[2];
  a2[6] = result[3];
  a2[7] = result[10];
  a2[8] = result[17];
  a2[9] = result[24];
  a2[10] = result[32];
  a2[11] = result[25];
  a2[12] = result[18];
  a2[13] = result[11];
  a2[14] = result[4];
  a2[15] = result[5];
  a2[16] = result[12];
  a2[17] = result[19];
  a2[18] = result[26];
  a2[19] = result[33];
  a2[20] = result[40];
  a2[21] = result[48];
  a2[22] = result[41];
  a2[23] = result[34];
  a2[24] = result[27];
  a2[25] = result[20];
  a2[26] = result[13];
  a2[27] = result[6];
  a2[28] = result[7];
  a2[29] = result[14];
  a2[30] = result[21];
  a2[31] = result[28];
  a2[32] = result[35];
  a2[33] = result[42];
  a2[34] = result[49];
  a2[35] = result[56];
  a2[36] = result[57];
  a2[37] = result[50];
  a2[38] = result[43];
  a2[39] = result[36];
  a2[40] = result[29];
  a2[41] = result[22];
  a2[42] = result[15];
  a2[43] = result[23];
  a2[44] = result[30];
  a2[45] = result[37];
  a2[46] = result[44];
  a2[47] = result[51];
  a2[48] = result[58];
  a2[49] = result[59];
  a2[50] = result[52];
  a2[51] = result[45];
  a2[52] = result[38];
  a2[53] = result[31];
  a2[54] = result[39];
  a2[55] = result[46];
  a2[56] = result[53];
  a2[57] = result[60];
  a2[58] = result[61];
  a2[59] = result[54];
  a2[60] = result[47];
  a2[61] = result[55];
  a2[62] = result[62];
  a2[63] = result[63];
  return result;
}

int *ZigZag4x4Block(int *result, int *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[8];
  a2[3] = result[16];
  a2[4] = result[9];
  a2[5] = result[2];
  a2[6] = result[3];
  a2[7] = result[10];
  a2[8] = result[17];
  a2[9] = result[24];
  a2[10] = 0;
  a2[11] = result[25];
  a2[12] = result[18];
  a2[13] = result[11];
  *((_QWORD *)a2 + 7) = 0;
  a2[16] = 0;
  a2[17] = result[19];
  a2[18] = result[26];
  *(_QWORD *)(a2 + 21) = 0;
  *(_QWORD *)(a2 + 19) = 0;
  a2[23] = 0;
  a2[24] = result[27];
  return result;
}

__int16 *ZigZag4x4BlockS16(__int16 *result, __int16 *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[8];
  a2[3] = result[16];
  a2[4] = result[9];
  a2[5] = result[2];
  a2[6] = result[3];
  a2[7] = result[10];
  a2[8] = result[17];
  a2[9] = result[24];
  a2[10] = 0;
  a2[11] = result[25];
  a2[12] = result[18];
  a2[13] = result[11];
  *((_DWORD *)a2 + 7) = 0;
  a2[16] = 0;
  a2[17] = result[19];
  a2[18] = result[26];
  *(_QWORD *)(a2 + 19) = 0;
  a2[23] = 0;
  a2[24] = result[27];
  return result;
}

double ZigZagDCBlock(int a1, int *a2)
{
  double result;

  result = 0.0;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 15) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *a2 = a1;
  return result;
}

double ZigZagDCBlockS16(__int16 a1, __int16 *a2)
{
  double result;

  result = 0.0;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 15) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *a2 = a1;
  return result;
}

int *IZigZagBlock8x8(int *result, int *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[32] = result[10];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[4] = result[14];
  a2[5] = result[15];
  a2[12] = result[16];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[33] = result[19];
  a2[40] = result[20];
  a2[48] = result[21];
  a2[41] = result[22];
  a2[34] = result[23];
  a2[27] = result[24];
  a2[20] = result[25];
  a2[13] = result[26];
  a2[6] = result[27];
  a2[7] = result[28];
  a2[14] = result[29];
  a2[21] = result[30];
  a2[28] = result[31];
  a2[35] = result[32];
  a2[42] = result[33];
  a2[49] = result[34];
  a2[56] = result[35];
  a2[57] = result[36];
  a2[50] = result[37];
  a2[43] = result[38];
  a2[36] = result[39];
  a2[29] = result[40];
  a2[22] = result[41];
  a2[15] = result[42];
  a2[23] = result[43];
  a2[30] = result[44];
  a2[37] = result[45];
  a2[44] = result[46];
  a2[51] = result[47];
  a2[58] = result[48];
  a2[59] = result[49];
  a2[52] = result[50];
  a2[45] = result[51];
  a2[38] = result[52];
  a2[31] = result[53];
  a2[39] = result[54];
  a2[46] = result[55];
  a2[53] = result[56];
  a2[60] = result[57];
  a2[61] = result[58];
  a2[54] = result[59];
  a2[47] = result[60];
  a2[55] = result[61];
  a2[62] = result[62];
  a2[63] = result[63];
  return result;
}

__int16 *IZigZagBlock8x8S16(__int16 *result, __int16 *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[32] = result[10];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[4] = result[14];
  a2[5] = result[15];
  a2[12] = result[16];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[33] = result[19];
  a2[40] = result[20];
  a2[48] = result[21];
  a2[41] = result[22];
  a2[34] = result[23];
  a2[27] = result[24];
  a2[20] = result[25];
  a2[13] = result[26];
  a2[6] = result[27];
  a2[7] = result[28];
  a2[14] = result[29];
  a2[21] = result[30];
  a2[28] = result[31];
  a2[35] = result[32];
  a2[42] = result[33];
  a2[49] = result[34];
  a2[56] = result[35];
  a2[57] = result[36];
  a2[50] = result[37];
  a2[43] = result[38];
  a2[36] = result[39];
  a2[29] = result[40];
  a2[22] = result[41];
  a2[15] = result[42];
  a2[23] = result[43];
  a2[30] = result[44];
  a2[37] = result[45];
  a2[44] = result[46];
  a2[51] = result[47];
  a2[58] = result[48];
  a2[59] = result[49];
  a2[52] = result[50];
  a2[45] = result[51];
  a2[38] = result[52];
  a2[31] = result[53];
  a2[39] = result[54];
  a2[46] = result[55];
  a2[53] = result[56];
  a2[60] = result[57];
  a2[61] = result[58];
  a2[54] = result[59];
  a2[47] = result[60];
  a2[55] = result[61];
  a2[62] = result[62];
  a2[63] = result[63];
  return result;
}

int *IZigZagBlock8x4(int *result, int *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[32] = result[10];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[33] = result[19];
  a2[40] = result[20];
  a2[48] = result[21];
  a2[41] = result[22];
  a2[34] = result[23];
  a2[27] = result[24];
  a2[35] = result[32];
  a2[42] = result[33];
  a2[49] = result[34];
  a2[56] = result[35];
  a2[57] = result[36];
  a2[50] = result[37];
  a2[43] = result[38];
  a2[51] = result[47];
  a2[58] = result[48];
  a2[59] = result[49];
  return result;
}

__int16 *IZigZagBlock8x4S16(__int16 *result, __int16 *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[32] = result[10];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[33] = result[19];
  a2[40] = result[20];
  a2[48] = result[21];
  a2[41] = result[22];
  a2[34] = result[23];
  a2[27] = result[24];
  a2[35] = result[32];
  a2[42] = result[33];
  a2[49] = result[34];
  a2[56] = result[35];
  a2[57] = result[36];
  a2[50] = result[37];
  a2[43] = result[38];
  a2[51] = result[47];
  a2[58] = result[48];
  a2[59] = result[49];
  return result;
}

int *IZigZagBlock4x8(int *result, int *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[4] = result[14];
  a2[5] = result[15];
  a2[12] = result[16];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[27] = result[24];
  a2[20] = result[25];
  a2[13] = result[26];
  a2[6] = result[27];
  a2[7] = result[28];
  a2[14] = result[29];
  a2[21] = result[30];
  a2[28] = result[31];
  a2[29] = result[40];
  a2[22] = result[41];
  a2[15] = result[42];
  a2[23] = result[43];
  a2[30] = result[44];
  a2[31] = result[53];
  return result;
}

__int16 *IZigZagBlock4x8S16(__int16 *result, __int16 *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[4] = result[14];
  a2[5] = result[15];
  a2[12] = result[16];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[27] = result[24];
  a2[20] = result[25];
  a2[13] = result[26];
  a2[6] = result[27];
  a2[7] = result[28];
  a2[14] = result[29];
  a2[21] = result[30];
  a2[28] = result[31];
  a2[29] = result[40];
  a2[22] = result[41];
  a2[15] = result[42];
  a2[23] = result[43];
  a2[30] = result[44];
  a2[31] = result[53];
  return result;
}

int *IZigZagBlock4x4(int *result, int *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[27] = result[24];
  return result;
}

__int16 *IZigZagBlock4x4S16(__int16 *result, __int16 *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[8] = result[2];
  a2[16] = result[3];
  a2[9] = result[4];
  a2[2] = result[5];
  a2[3] = result[6];
  a2[10] = result[7];
  a2[17] = result[8];
  a2[24] = result[9];
  a2[25] = result[11];
  a2[18] = result[12];
  a2[11] = result[13];
  a2[19] = result[17];
  a2[26] = result[18];
  a2[27] = result[24];
  return result;
}

_WORD *ScanConvertRaster2Whatever(_WORD *result, _WORD *a2, int a3)
{
  if (a3 == 1)
    return ScanConvertRaster2RowWise(result, a2);
  if (a3)
    return ScanConvertRaster2ColumnWise(result, a2);
  return ScanConvertRaster2ZigZag(result, a2);
}

_WORD *ScanConvertRaster2ZigZag(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = a2[8];
  result[3] = a2[16];
  result[4] = a2[9];
  result[5] = a2[2];
  result[6] = a2[3];
  result[7] = a2[10];
  result[8] = a2[17];
  result[9] = a2[24];
  result[10] = a2[32];
  result[11] = a2[25];
  result[12] = a2[18];
  result[13] = a2[11];
  result[14] = a2[4];
  result[15] = a2[5];
  result[16] = a2[12];
  result[17] = a2[19];
  result[18] = a2[26];
  result[19] = a2[33];
  result[20] = a2[40];
  result[21] = a2[48];
  result[22] = a2[41];
  result[23] = a2[34];
  result[24] = a2[27];
  result[25] = a2[20];
  result[26] = a2[13];
  result[27] = a2[6];
  result[28] = a2[7];
  result[29] = a2[14];
  result[30] = a2[21];
  result[31] = a2[28];
  result[32] = a2[35];
  result[33] = a2[42];
  result[34] = a2[49];
  result[35] = a2[56];
  result[36] = a2[57];
  result[37] = a2[50];
  result[38] = a2[43];
  result[39] = a2[36];
  result[40] = a2[29];
  result[41] = a2[22];
  result[42] = a2[15];
  result[43] = a2[23];
  result[44] = a2[30];
  result[45] = a2[37];
  result[46] = a2[44];
  result[47] = a2[51];
  result[48] = a2[58];
  result[49] = a2[59];
  result[50] = a2[52];
  result[51] = a2[45];
  result[52] = a2[38];
  result[53] = a2[31];
  result[54] = a2[39];
  result[55] = a2[46];
  result[56] = a2[53];
  result[57] = a2[60];
  result[58] = a2[61];
  result[59] = a2[54];
  result[60] = a2[47];
  result[61] = a2[55];
  result[62] = a2[62];
  result[63] = a2[63];
  return result;
}

_WORD *ScanConvertRaster2RowWise(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = a2[2];
  result[3] = a2[3];
  result[4] = a2[8];
  result[5] = a2[9];
  result[6] = a2[16];
  result[7] = a2[17];
  result[8] = a2[10];
  result[9] = a2[11];
  result[10] = a2[4];
  result[11] = a2[5];
  result[12] = a2[6];
  result[13] = a2[7];
  result[14] = a2[15];
  result[15] = a2[14];
  result[16] = a2[13];
  result[17] = a2[12];
  result[18] = a2[19];
  result[19] = a2[18];
  result[20] = a2[24];
  result[21] = a2[25];
  result[22] = a2[32];
  result[23] = a2[33];
  result[24] = a2[26];
  result[25] = a2[27];
  result[26] = a2[20];
  result[27] = a2[21];
  result[28] = a2[22];
  result[29] = a2[23];
  result[30] = a2[28];
  result[31] = a2[29];
  result[32] = a2[30];
  result[33] = a2[31];
  result[34] = a2[34];
  result[35] = a2[35];
  result[36] = a2[40];
  result[37] = a2[41];
  result[38] = a2[48];
  result[39] = a2[49];
  result[40] = a2[42];
  result[41] = a2[43];
  result[42] = a2[36];
  result[43] = a2[37];
  result[44] = a2[38];
  result[45] = a2[39];
  result[46] = a2[44];
  result[47] = a2[45];
  result[48] = a2[46];
  result[49] = a2[47];
  result[50] = a2[50];
  result[51] = a2[51];
  result[52] = a2[56];
  result[53] = a2[57];
  result[54] = a2[58];
  result[55] = a2[59];
  result[56] = a2[52];
  result[57] = a2[53];
  result[58] = a2[54];
  result[59] = a2[55];
  result[60] = a2[60];
  result[61] = a2[61];
  result[62] = a2[62];
  result[63] = a2[63];
  return result;
}

_WORD *ScanConvertRaster2ColumnWise(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[1] = a2[8];
  result[2] = a2[16];
  result[3] = a2[24];
  result[4] = a2[1];
  result[5] = a2[9];
  result[6] = a2[2];
  result[7] = a2[10];
  result[8] = a2[17];
  result[9] = a2[25];
  result[10] = a2[32];
  result[11] = a2[40];
  result[12] = a2[48];
  result[13] = a2[56];
  result[14] = a2[57];
  result[15] = a2[49];
  result[16] = a2[41];
  result[17] = a2[33];
  result[18] = a2[26];
  result[19] = a2[18];
  result[20] = a2[3];
  result[21] = a2[11];
  result[22] = a2[4];
  result[23] = a2[12];
  result[24] = a2[19];
  result[25] = a2[27];
  result[26] = a2[34];
  result[27] = a2[42];
  result[28] = a2[50];
  result[29] = a2[58];
  result[30] = a2[35];
  result[31] = a2[43];
  result[32] = a2[51];
  result[33] = a2[59];
  result[34] = a2[20];
  result[35] = a2[28];
  result[36] = a2[5];
  result[37] = a2[13];
  result[38] = a2[6];
  result[39] = a2[14];
  result[40] = a2[21];
  result[41] = a2[29];
  result[42] = a2[36];
  result[43] = a2[44];
  result[44] = a2[52];
  result[45] = a2[60];
  result[46] = a2[37];
  result[47] = a2[45];
  result[48] = a2[53];
  result[49] = a2[61];
  result[50] = a2[22];
  result[51] = a2[30];
  result[52] = a2[7];
  result[53] = a2[15];
  result[54] = a2[23];
  result[55] = a2[31];
  result[56] = a2[38];
  result[57] = a2[46];
  result[58] = a2[54];
  result[59] = a2[62];
  result[60] = a2[39];
  result[61] = a2[47];
  result[62] = a2[55];
  result[63] = a2[63];
  return result;
}

_BYTE *ScanConvertRaster2ZigZagUInt8(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = a2[8];
  result[3] = a2[16];
  result[4] = a2[9];
  result[5] = a2[2];
  result[6] = a2[3];
  result[7] = a2[10];
  result[8] = a2[17];
  result[9] = a2[24];
  result[10] = a2[32];
  result[11] = a2[25];
  result[12] = a2[18];
  result[13] = a2[11];
  result[14] = a2[4];
  result[15] = a2[5];
  result[16] = a2[12];
  result[17] = a2[19];
  result[18] = a2[26];
  result[19] = a2[33];
  result[20] = a2[40];
  result[21] = a2[48];
  result[22] = a2[41];
  result[23] = a2[34];
  result[24] = a2[27];
  result[25] = a2[20];
  result[26] = a2[13];
  result[27] = a2[6];
  result[28] = a2[7];
  result[29] = a2[14];
  result[30] = a2[21];
  result[31] = a2[28];
  result[32] = a2[35];
  result[33] = a2[42];
  result[34] = a2[49];
  result[35] = a2[56];
  result[36] = a2[57];
  result[37] = a2[50];
  result[38] = a2[43];
  result[39] = a2[36];
  result[40] = a2[29];
  result[41] = a2[22];
  result[42] = a2[15];
  result[43] = a2[23];
  result[44] = a2[30];
  result[45] = a2[37];
  result[46] = a2[44];
  result[47] = a2[51];
  result[48] = a2[58];
  result[49] = a2[59];
  result[50] = a2[52];
  result[51] = a2[45];
  result[52] = a2[38];
  result[53] = a2[31];
  result[54] = a2[39];
  result[55] = a2[46];
  result[56] = a2[53];
  result[57] = a2[60];
  result[58] = a2[61];
  result[59] = a2[54];
  result[60] = a2[47];
  result[61] = a2[55];
  result[62] = a2[62];
  result[63] = a2[63];
  return result;
}

_WORD *ScanConvertWhatever2Raster(_WORD *result, _WORD *a2, int a3)
{
  if (a3 == 1)
    return ScanConvertRowWise2Raster(result, a2);
  if (a3)
    return ScanConvertColumnWise2Raster(result, a2);
  return ScanConvertZigZag2Raster(result, a2);
}

_WORD *ScanConvertZigZag2Raster(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[8] = a2[2];
  result[16] = a2[3];
  result[9] = a2[4];
  result[2] = a2[5];
  result[3] = a2[6];
  result[10] = a2[7];
  result[17] = a2[8];
  result[24] = a2[9];
  result[32] = a2[10];
  result[25] = a2[11];
  result[18] = a2[12];
  result[11] = a2[13];
  result[4] = a2[14];
  result[5] = a2[15];
  result[12] = a2[16];
  result[19] = a2[17];
  result[26] = a2[18];
  result[33] = a2[19];
  result[40] = a2[20];
  result[48] = a2[21];
  result[41] = a2[22];
  result[34] = a2[23];
  result[27] = a2[24];
  result[20] = a2[25];
  result[13] = a2[26];
  result[6] = a2[27];
  result[7] = a2[28];
  result[14] = a2[29];
  result[21] = a2[30];
  result[28] = a2[31];
  result[35] = a2[32];
  result[42] = a2[33];
  result[49] = a2[34];
  result[56] = a2[35];
  result[57] = a2[36];
  result[50] = a2[37];
  result[43] = a2[38];
  result[36] = a2[39];
  result[29] = a2[40];
  result[22] = a2[41];
  result[15] = a2[42];
  result[23] = a2[43];
  result[30] = a2[44];
  result[37] = a2[45];
  result[44] = a2[46];
  result[51] = a2[47];
  result[58] = a2[48];
  result[59] = a2[49];
  result[52] = a2[50];
  result[45] = a2[51];
  result[38] = a2[52];
  result[31] = a2[53];
  result[39] = a2[54];
  result[46] = a2[55];
  result[53] = a2[56];
  result[60] = a2[57];
  result[61] = a2[58];
  result[54] = a2[59];
  result[47] = a2[60];
  result[55] = a2[61];
  result[62] = a2[62];
  result[63] = a2[63];
  return result;
}

_WORD *ScanConvertRowWise2Raster(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = a2[2];
  result[3] = a2[3];
  result[8] = a2[4];
  result[9] = a2[5];
  result[16] = a2[6];
  result[17] = a2[7];
  result[10] = a2[8];
  result[11] = a2[9];
  result[4] = a2[10];
  result[5] = a2[11];
  result[6] = a2[12];
  result[7] = a2[13];
  result[15] = a2[14];
  result[14] = a2[15];
  result[13] = a2[16];
  result[12] = a2[17];
  result[19] = a2[18];
  result[18] = a2[19];
  result[24] = a2[20];
  result[25] = a2[21];
  result[32] = a2[22];
  result[33] = a2[23];
  result[26] = a2[24];
  result[27] = a2[25];
  result[20] = a2[26];
  result[21] = a2[27];
  result[22] = a2[28];
  result[23] = a2[29];
  result[28] = a2[30];
  result[29] = a2[31];
  result[30] = a2[32];
  result[31] = a2[33];
  result[34] = a2[34];
  result[35] = a2[35];
  result[40] = a2[36];
  result[41] = a2[37];
  result[48] = a2[38];
  result[49] = a2[39];
  result[42] = a2[40];
  result[43] = a2[41];
  result[36] = a2[42];
  result[37] = a2[43];
  result[38] = a2[44];
  result[39] = a2[45];
  result[44] = a2[46];
  result[45] = a2[47];
  result[46] = a2[48];
  result[47] = a2[49];
  result[50] = a2[50];
  result[51] = a2[51];
  result[56] = a2[52];
  result[57] = a2[53];
  result[58] = a2[54];
  result[59] = a2[55];
  result[52] = a2[56];
  result[53] = a2[57];
  result[54] = a2[58];
  result[55] = a2[59];
  result[60] = a2[60];
  result[61] = a2[61];
  result[62] = a2[62];
  result[63] = a2[63];
  return result;
}

_WORD *ScanConvertColumnWise2Raster(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[8] = a2[1];
  result[16] = a2[2];
  result[24] = a2[3];
  result[1] = a2[4];
  result[9] = a2[5];
  result[2] = a2[6];
  result[10] = a2[7];
  result[17] = a2[8];
  result[25] = a2[9];
  result[32] = a2[10];
  result[40] = a2[11];
  result[48] = a2[12];
  result[56] = a2[13];
  result[57] = a2[14];
  result[49] = a2[15];
  result[41] = a2[16];
  result[33] = a2[17];
  result[26] = a2[18];
  result[18] = a2[19];
  result[3] = a2[20];
  result[11] = a2[21];
  result[4] = a2[22];
  result[12] = a2[23];
  result[19] = a2[24];
  result[27] = a2[25];
  result[34] = a2[26];
  result[42] = a2[27];
  result[50] = a2[28];
  result[58] = a2[29];
  result[35] = a2[30];
  result[43] = a2[31];
  result[51] = a2[32];
  result[59] = a2[33];
  result[20] = a2[34];
  result[28] = a2[35];
  result[5] = a2[36];
  result[13] = a2[37];
  result[6] = a2[38];
  result[14] = a2[39];
  result[21] = a2[40];
  result[29] = a2[41];
  result[36] = a2[42];
  result[44] = a2[43];
  result[52] = a2[44];
  result[60] = a2[45];
  result[37] = a2[46];
  result[45] = a2[47];
  result[53] = a2[48];
  result[61] = a2[49];
  result[22] = a2[50];
  result[30] = a2[51];
  result[7] = a2[52];
  result[15] = a2[53];
  result[23] = a2[54];
  result[31] = a2[55];
  result[38] = a2[56];
  result[46] = a2[57];
  result[54] = a2[58];
  result[62] = a2[59];
  result[39] = a2[60];
  result[47] = a2[61];
  result[55] = a2[62];
  result[63] = a2[63];
  return result;
}

_BYTE *ScanConvertZigZag2RasterUInt8(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[8] = a2[2];
  result[16] = a2[3];
  result[9] = a2[4];
  result[2] = a2[5];
  result[3] = a2[6];
  result[10] = a2[7];
  result[17] = a2[8];
  result[24] = a2[9];
  result[32] = a2[10];
  result[25] = a2[11];
  result[18] = a2[12];
  result[11] = a2[13];
  result[4] = a2[14];
  result[5] = a2[15];
  result[12] = a2[16];
  result[19] = a2[17];
  result[26] = a2[18];
  result[33] = a2[19];
  result[40] = a2[20];
  result[48] = a2[21];
  result[41] = a2[22];
  result[34] = a2[23];
  result[27] = a2[24];
  result[20] = a2[25];
  result[13] = a2[26];
  result[6] = a2[27];
  result[7] = a2[28];
  result[14] = a2[29];
  result[21] = a2[30];
  result[28] = a2[31];
  result[35] = a2[32];
  result[42] = a2[33];
  result[49] = a2[34];
  result[56] = a2[35];
  result[57] = a2[36];
  result[50] = a2[37];
  result[43] = a2[38];
  result[36] = a2[39];
  result[29] = a2[40];
  result[22] = a2[41];
  result[15] = a2[42];
  result[23] = a2[43];
  result[30] = a2[44];
  result[37] = a2[45];
  result[44] = a2[46];
  result[51] = a2[47];
  result[58] = a2[48];
  result[59] = a2[49];
  result[52] = a2[50];
  result[45] = a2[51];
  result[38] = a2[52];
  result[31] = a2[53];
  result[39] = a2[54];
  result[46] = a2[55];
  result[53] = a2[56];
  result[60] = a2[57];
  result[61] = a2[58];
  result[54] = a2[59];
  result[47] = a2[60];
  result[55] = a2[61];
  result[62] = a2[62];
  result[63] = a2[63];
  return result;
}

_WORD *ScanConvertWhatever2RasterFirstRowColumnOnly(_WORD *result, _WORD *a2, int a3)
{
  if (a3 == 1)
    return ScanConvertRowWise2RasterFirstRowColumnOnly(result, a2);
  if (a3)
    return ScanConvertColumnWise2RasterFirstRowColumnOnly(result, a2);
  return ScanConvertZigZag2RasterFirstRowColumnOnly(result, a2);
}

_WORD *ScanConvertZigZag2RasterFirstRowColumnOnly(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[8] = a2[2];
  result[16] = a2[3];
  result[2] = a2[5];
  result[3] = a2[6];
  result[24] = a2[9];
  result[32] = a2[10];
  result[4] = a2[14];
  result[5] = a2[15];
  result[40] = a2[20];
  result[48] = a2[21];
  result[6] = a2[27];
  result[7] = a2[28];
  result[56] = a2[35];
  return result;
}

_WORD *ScanConvertRowWise2RasterFirstRowColumnOnly(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = a2[2];
  result[3] = a2[3];
  result[8] = a2[4];
  result[16] = a2[6];
  result[4] = a2[10];
  result[5] = a2[11];
  result[6] = a2[12];
  result[7] = a2[13];
  result[24] = a2[20];
  result[32] = a2[22];
  result[40] = a2[36];
  result[48] = a2[38];
  result[56] = a2[52];
  return result;
}

_WORD *ScanConvertColumnWise2RasterFirstRowColumnOnly(_WORD *result, _WORD *a2)
{
  *result = *a2;
  result[8] = a2[1];
  result[16] = a2[2];
  result[24] = a2[3];
  result[1] = a2[4];
  result[2] = a2[6];
  result[32] = a2[10];
  result[40] = a2[11];
  result[48] = a2[12];
  result[56] = a2[13];
  result[3] = a2[20];
  result[4] = a2[22];
  result[5] = a2[36];
  result[6] = a2[38];
  result[7] = a2[52];
  return result;
}

int32x4_t IDct8x8Yoyo(int16x8_t *a1, __int16 *a2, unsigned int a3)
{
  int32x4_t *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unint64_t v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int32x4_t v58;
  int32x4_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int64x2_t v75;
  int64x2_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int64x2_t v82;
  int64x2_t v83;
  int64x2_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int64x2_t v97;
  int64x2_t v98;
  int64x2_t v99;
  int64x2_t v100;
  int32x4_t v101;
  int64x2_t v102;
  int64x2_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int64x2_t v107;
  int64x2_t v108;
  int32x4_t v109;
  int32x4_t v110;
  uint64_t v111;
  int32x4_t v112;
  int32x4_t v113;
  int32x4_t v114;
  int32x4_t v115;
  int32x4_t v116;
  int32x4_t v117;
  int32x4_t v118;
  int32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int64x2_t v122;
  int32x4_t v123;
  int32x4_t v124;
  int32x4_t v125;
  int64x2_t v126;
  int64x2_t v127;
  int32x4_t v128;
  int32x4_t v129;
  int64x2_t v130;
  int64x2_t v131;
  int32x4_t v132;
  int32x4_t v133;
  int32x4_t v134;
  int32x4_t v135;
  int32x4_t v136;
  int32x4_t v137;
  int32x4_t v138;
  int32x4_t v139;
  int32x4_t v140;
  int32x4_t v141;
  int32x4_t v142;
  int32x4_t v143;
  int32x4_t v144;
  int32x4_t v145;
  int32x4_t v146;
  int32x4_t v147;
  int32x4_t result;
  int32x4_t v149;
  int32x4_t v150;
  int32x4_t v151;
  int32x4_t v152;
  int32x4_t v153;
  int32x4_t v154;
  int32x4_t v155;
  int32x4_t v156;
  int32x4_t v157;
  int32x4_t v158;
  int32x4_t v159;
  int32x4_t v160;
  int32x4_t v161;
  int32x4_t v162;
  int32x4_t v163;
  int32x4_t v164;
  uint64_t v165;

  v165 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x80000000) != 0)
  {
    v57 = 0;
    v4 = &v149;
LABEL_13:
    bzero(v4, 32 * (v57 + 7) + 32);
    goto LABEL_14;
  }
  v4 = &v149;
  v5 = -1;
  do
  {
    v6 = *a2;
    v7 = a2[1];
    v8 = a2[2];
    v9 = a2[3];
    v10 = a2[4];
    v11 = a2[5];
    v12 = a2[6];
    v13 = a2[7];
    v14 = v6 << 7;
    v15 = 181 * v7;
    v16 = 181 * v8;
    v17 = 181 * v9;
    v18 = 181 * v10;
    v19 = 181 * v11;
    v20 = 181 * v12;
    v21 = 181 * v6;
    v22 = v7 << 8;
    v23 = v8 << 8;
    v24 = v9 << 8;
    v25 = v10 << 8;
    v26 = v11 << 8;
    v27 = v12 << 8;
    v28 = v13 << 8;
    if (v5 == -1)
    {
      v28 = 181 * v13;
      v27 = v20;
      v26 = v19;
      v25 = v18;
      v24 = v17;
      v23 = v16;
      v29 = v15;
    }
    else
    {
      v29 = v22;
    }
    if (v5 == -1)
      v30 = v14;
    else
      v30 = v21;
    v31 = v24 + v28;
    v32 = v26 - (v24 + v28) + v29;
    v33 = 2 * (v26 - v28);
    v34 = v31 - (v26 + v28);
    v35 = (unint64_t)(2896 * v28) >> 10;
    v36 = 2 * v34 - v35;
    v37 = (unint64_t)(946 * ((int)v35 + 2 * v34)) >> 10;
    v38 = (unint64_t)(0x3FFFFFFFE78 * v36) >> 10;
    v39 = (unint64_t)(724 * v33) >> 10;
    v40 = v32 - v39;
    v41 = v32 + v39;
    LODWORD(v39) = v41 + v37;
    v42 = v40 + v38;
    LODWORD(v37) = v41 - v37;
    v43 = v40 - v38;
    v44 = (unint64_t)(1004 * (int)v39) >> 10;
    v45 = (unint64_t)(569 * v42) >> 10;
    v46 = (unint64_t)(0x3FFFFFFFF38 * (int)v37) >> 10;
    v47 = (unint64_t)(0x3FFFFFFFCADLL * v43) >> 10;
    v48 = v23 - v27;
    v49 = (unint64_t)(1448 * v27) >> 10;
    v50 = v48 - v49;
    v51 = (unint64_t)(946 * (v48 + (int)v49)) >> 10;
    v52 = (unint64_t)(0x3FFFFFFFE78 * v50) >> 10;
    v53 = (unint64_t)(724 * v25) >> 10;
    v54 = v30 - v53;
    LODWORD(v53) = v30 + v53;
    v55 = v53 + v51;
    v56 = v54 - v52;
    v4[1].i32[2] = v54 - v52 + v47;
    v4[1].i32[3] = v53 + v51 - v44;
    LODWORD(v52) = v54 + v52;
    LODWORD(v53) = v53 - v51;
    v4[1].i32[0] = v53 + v46;
    v4[1].i32[1] = v52 - v45;
    v4->i32[2] = v52 + v45;
    v4->i32[3] = v53 - v46;
    v4->i32[0] = v55 + v44;
    v4->i32[1] = v56 - v47;
    v4 += 2;
    ++v5;
    a2 += 8;
  }
  while (a3 != v5);
  v57 = ~a3;
  if (a3 <= 6)
    goto LABEL_13;
LABEL_14:
  v58 = vaddq_s32(v163, v155);
  v59 = vaddq_s32(v164, v156);
  v60 = vsubq_s32(vaddq_s32(v160, v152), v59);
  v61 = vsubq_s32(vaddq_s32(v159, v151), v58);
  v62 = vsubq_s32(v160, v164);
  v63 = vsubq_s32(v159, v163);
  v64 = vaddq_s32(v63, v63);
  v65 = vaddq_s32(v62, v62);
  v66 = vshlq_n_s32(v164, 2uLL);
  v67 = vshlq_n_s32(v163, 2uLL);
  v68 = vsubq_s32(v59, vaddq_s32(v164, v160));
  v69 = vsubq_s32(v58, vaddq_s32(v163, v159));
  v70 = vaddq_s32(v69, v69);
  v71 = vaddq_s32(v68, v68);
  v72 = vdupq_n_s32(0x2D4u);
  v73 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v67.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v67, v72), 0xAuLL);
  v74 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v66.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v66, v72), 0xAuLL);
  v75 = (int64x2_t)vsubq_s32(v71, v74);
  v76 = (int64x2_t)vsubq_s32(v70, v73);
  v77 = vaddq_s32(v71, v74);
  v78 = vaddq_s32(v70, v73);
  v79 = vdupq_n_s32(0x3B2u);
  v80 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v78.i8, *(int32x2_t *)v79.i8), 0xAuLL), vmull_high_s32(v78, v79), 0xAuLL);
  v81 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v77.i8, *(int32x2_t *)v79.i8), 0xAuLL), vmull_high_s32(v77, v79), 0xAuLL);
  v82.i64[0] = v76.i32[0];
  v82.i64[1] = v76.i32[1];
  v83 = v82;
  v82.i64[0] = v76.i32[2];
  v82.i64[1] = v76.i32[3];
  v84 = v82;
  v82.i64[0] = v75.i32[0];
  v82.i64[1] = v75.i32[1];
  v75.i64[0] = 0x3FFFFFFFE78 * v75.i32[2];
  v75.i64[1] = 0x3FFFFFFFE78 * v75.i32[3];
  v76.i64[0] = 0x3FFFFFFFE78 * v82.i64[0];
  v76.i64[1] = 0x3FFFFFFFE78 * v82.i64[1];
  v84.i64[0] *= 0x3FFFFFFFE78;
  v84.i64[1] *= 0x3FFFFFFFE78;
  v83.i64[0] *= 0x3FFFFFFFE78;
  v83.i64[1] *= 0x3FFFFFFFE78;
  v85 = vshrn_high_n_s64(vshrn_n_s64(v83, 0xAuLL), v84, 0xAuLL);
  v86 = vshrn_high_n_s64(vshrn_n_s64(v76, 0xAuLL), v75, 0xAuLL);
  v87 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v65.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v65, v72), 0xAuLL);
  v88 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v64.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v64, v72), 0xAuLL);
  v89 = vsubq_s32(v61, v88);
  v90 = vsubq_s32(v60, v87);
  v91 = vaddq_s32(v61, v88);
  v92 = vaddq_s32(v60, v87);
  v93 = vaddq_s32(v92, v81);
  v94 = vaddq_s32(v91, v80);
  v95 = vaddq_s32(v90, v86);
  v96 = vaddq_s32(v89, v85);
  v97 = (int64x2_t)vsubq_s32(v92, v81);
  v98 = (int64x2_t)vsubq_s32(v91, v80);
  v99 = (int64x2_t)vsubq_s32(v90, v86);
  v100 = (int64x2_t)vsubq_s32(v89, v85);
  v101 = vdupq_n_s32(0x3ECu);
  v102 = vmull_high_s32(v93, v101);
  v103 = vmull_s32(*(int32x2_t *)v93.i8, *(int32x2_t *)v101.i8);
  v104 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v94.i8, *(int32x2_t *)v101.i8), 0xAuLL), vmull_high_s32(v94, v101), 0xAuLL);
  v105 = vshrn_high_n_s64(vshrn_n_s64(v103, 0xAuLL), v102, 0xAuLL);
  v106 = vdupq_n_s32(0x239u);
  v107 = vmull_high_s32(v95, v106);
  v108 = vmull_s32(*(int32x2_t *)v95.i8, *(int32x2_t *)v106.i8);
  v109 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v96.i8, *(int32x2_t *)v106.i8), 0xAuLL), vmull_high_s32(v96, v106), 0xAuLL);
  v110 = vshrn_high_n_s64(vshrn_n_s64(v108, 0xAuLL), v107, 0xAuLL);
  v82.i64[1] = v98.i32[1];
  v85.i64[0] = 0x3FFFFFFFF38 * v97.i32[2];
  v85.i64[1] = 0x3FFFFFFFF38 * v97.i32[3];
  v111 = 0x3FFFFFFFF38 * v97.i32[1];
  v97.i64[0] = 0x3FFFFFFFF38 * v97.i32[0];
  v97.i64[1] = v111;
  v95.i64[0] = 0x3FFFFFFFF38 * v98.i32[2];
  v95.i64[1] = 0x3FFFFFFFF38 * v98.i32[3];
  v98.i64[0] = 0x3FFFFFFFF38 * v98.i32[0];
  v98.i64[1] = 0x3FFFFFFFF38 * v82.i64[1];
  v112 = vshrn_high_n_s64(vshrn_n_s64(v98, 0xAuLL), (int64x2_t)v95, 0xAuLL);
  v113 = vshrn_high_n_s64(vshrn_n_s64(v97, 0xAuLL), (int64x2_t)v85, 0xAuLL);
  v82.i64[0] = v100.i32[0];
  v82.i64[1] = v100.i32[1];
  v85.i64[0] = 0x3FFFFFFFCADLL * v99.i32[2];
  v85.i64[1] = 0x3FFFFFFFCADLL * v99.i32[3];
  v95.i64[0] = 0x3FFFFFFFCADLL * v99.i32[0];
  v95.i64[1] = 0x3FFFFFFFCADLL * v99.i32[1];
  v100.i64[0] = 0x3FFFFFFFCADLL * v100.i32[2];
  v100.i64[1] = 0x3FFFFFFFCADLL * v100.i32[3];
  v99.i64[0] = 0x3FFFFFFFCADLL * v82.i64[0];
  v99.i64[1] = 0x3FFFFFFFCADLL * v82.i64[1];
  v114 = vshrn_high_n_s64(vshrn_n_s64(v99, 0xAuLL), v100, 0xAuLL);
  v115 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v95, 0xAuLL), (int64x2_t)v85, 0xAuLL);
  v116 = vsubq_s32(v153, v161);
  v117 = vsubq_s32(v154, v162);
  v118 = vaddq_s32(v162, v162);
  v119 = vaddq_s32(v161, v161);
  v120 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v119.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v119, v72), 0xAuLL);
  v121 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v118.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v118, v72), 0xAuLL);
  v122 = (int64x2_t)vsubq_s32(v117, v121);
  v123 = vsubq_s32(v116, v120);
  v124 = vaddq_s32(v117, v121);
  v125 = vaddq_s32(v116, v120);
  v126 = vmull_high_s32(v124, v79);
  v127 = vmull_s32(*(int32x2_t *)v124.i8, *(int32x2_t *)v79.i8);
  v128 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v125.i8, *(int32x2_t *)v79.i8), 0xAuLL), vmull_high_s32(v125, v79), 0xAuLL);
  v129 = vshrn_high_n_s64(vshrn_n_s64(v127, 0xAuLL), v126, 0xAuLL);
  v82.i64[0] = v123.i32[0];
  v82.i64[1] = v123.i32[1];
  v130 = v82;
  v82.i64[0] = v123.i32[2];
  v82.i64[1] = v123.i32[3];
  v131 = v82;
  v82.i64[0] = v122.i32[0];
  v82.i64[1] = v122.i32[1];
  v122.i64[0] = 0x3FFFFFFFE78 * v122.i32[2];
  v122.i64[1] = 0x3FFFFFFFE78 * v122.i32[3];
  v79.i64[0] = 0x3FFFFFFFE78 * v82.i64[0];
  v79.i64[1] = 0x3FFFFFFFE78 * v82.i64[1];
  v131.i64[0] *= 0x3FFFFFFFE78;
  v131.i64[1] *= 0x3FFFFFFFE78;
  v130.i64[0] *= 0x3FFFFFFFE78;
  v130.i64[1] *= 0x3FFFFFFFE78;
  v132 = vshrn_high_n_s64(vshrn_n_s64(v130, 0xAuLL), v131, 0xAuLL);
  v133 = vshrn_high_n_s64(vshrn_n_s64((int64x2_t)v79, 0xAuLL), v122, 0xAuLL);
  v134 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v158.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v158, v72), 0xAuLL);
  v135 = vshrn_high_n_s64(vshrn_n_s64(vmull_s32(*(int32x2_t *)v157.i8, *(int32x2_t *)v72.i8), 0xAuLL), vmull_high_s32(v157, v72), 0xAuLL);
  v136 = vsubq_s32(v149, v135);
  v137 = vsubq_s32(v150, v134);
  v138 = vaddq_s32(v149, v135);
  v139 = vaddq_s32(v150, v134);
  v134.i64[0] = 0x20000000200;
  v134.i64[1] = 0x20000000200;
  v140 = vaddq_s32(vaddq_s32(v138, v134), v128);
  v141 = vaddq_s32(vaddq_s32(v139, v134), v129);
  v142 = vaddq_s32(vaddq_s32(v136, v134), v132);
  v143 = vaddq_s32(vaddq_s32(v137, v134), v133);
  v144 = vaddq_s32(vsubq_s32(v138, v128), v134);
  v145 = vaddq_s32(vsubq_s32(v139, v129), v134);
  v146 = vaddq_s32(vsubq_s32(v136, v132), v134);
  v147 = vaddq_s32(vsubq_s32(v137, v133), v134);
  a1[6] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v146, v114), 0xAuLL), vaddq_s32(v147, v115), 0xAuLL);
  a1[7] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v140, v104), 0xAuLL), vsubq_s32(v141, v105), 0xAuLL);
  a1[4] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v144, v112), 0xAuLL), vaddq_s32(v145, v113), 0xAuLL);
  a1[5] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v142, v109), 0xAuLL), vsubq_s32(v143, v110), 0xAuLL);
  a1[2] = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v142, v109), 0xAuLL), vaddq_s32(v143, v110), 0xAuLL);
  a1[3] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v144, v112), 0xAuLL), vsubq_s32(v145, v113), 0xAuLL);
  result = vsubq_s32(v147, v115);
  *a1 = vshrn_high_n_s32(vshrn_n_s32(vaddq_s32(v140, v104), 0xAuLL), vaddq_s32(v141, v105), 0xAuLL);
  a1[1] = vshrn_high_n_s32(vshrn_n_s32(vsubq_s32(v146, v114), 0xAuLL), result, 0xAuLL);
  return result;
}

unint64_t IDct8x8Yoyo(unsigned __int8 *a1, __int16 *a2, unsigned int a3, unsigned __int8 *a4)
{
  _DWORD *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  int *v59;
  unsigned __int8 *v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  unint64_t v73;
  int v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  int v78;
  int v79;
  int v80;
  unint64_t v81;
  int v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  int v87;
  unint64_t v88;
  int v89;
  int v90;
  unint64_t v91;
  unint64_t result;
  unint64_t v93;
  _DWORD v94[64];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x80000000) != 0)
  {
    v57 = 0;
    v6 = v94;
LABEL_16:
    bzero(v6, 32 * (v57 + 7) + 32);
    goto LABEL_17;
  }
  v6 = v94;
  v7 = -1;
  do
  {
    v8 = *a2;
    v9 = a2[1];
    v10 = a2[2];
    v11 = a2[3];
    v12 = a2[4];
    v13 = a2[5];
    v14 = a2[6];
    v15 = a2[7];
    v16 = v8 << 7;
    v17 = 181 * v9;
    v18 = 181 * v10;
    v19 = 181 * v11;
    v20 = 181 * v12;
    v21 = 181 * v13;
    v22 = 181 * v15;
    v23 = 181 * v8;
    v24 = v9 << 8;
    v25 = v10 << 8;
    v26 = v11 << 8;
    v27 = v12 << 8;
    v28 = v13 << 8;
    v29 = v14 << 8;
    if (v7 == -1)
      v29 = 181 * v14;
    else
      v22 = v15 << 8;
    if (v7 == -1)
    {
      v28 = v21;
      v27 = v20;
      v26 = v19;
      v25 = v18;
      v30 = v17;
    }
    else
    {
      v30 = v24;
    }
    if (v7 == -1)
      v31 = v16;
    else
      v31 = v23;
    v32 = v26 + v22;
    v33 = v28 - (v26 + v22) + v30;
    v34 = 2 * (v28 - v22);
    v35 = 4 * v22;
    v36 = v32 - (v28 + v22);
    v37 = (unint64_t)(724 * v35) >> 10;
    v38 = 2 * v36 - v37;
    v39 = (unint64_t)(946 * ((int)v37 + 2 * v36)) >> 10;
    v40 = (unint64_t)(0x3FFFFFFFE78 * v38) >> 10;
    v41 = (unint64_t)(724 * v34) >> 10;
    v42 = v33 - v41;
    v43 = v33 + v41;
    LODWORD(v41) = v43 + v39;
    LODWORD(v39) = v43 - v39;
    v44 = (unint64_t)(1004 * (int)v41) >> 10;
    v45 = (unint64_t)(569 * (v42 + (int)v40)) >> 10;
    v46 = (unint64_t)(0x3FFFFFFFF38 * (int)v39) >> 10;
    v47 = (unint64_t)(0x3FFFFFFFCADLL * (v42 - (int)v40)) >> 10;
    v48 = v25 - v29;
    v49 = (unint64_t)(1448 * v29) >> 10;
    v50 = v48 - v49;
    v51 = (unint64_t)(946 * (v48 + (int)v49)) >> 10;
    v52 = (unint64_t)(0x3FFFFFFFE78 * v50) >> 10;
    v53 = (unint64_t)(724 * v27) >> 10;
    v54 = v31 - v53;
    LODWORD(v53) = v31 + v53;
    v55 = v53 + v51;
    v56 = v54 - v52;
    v6[6] = v54 - v52 + v47;
    v6[7] = v53 + v51 - v44;
    LODWORD(v52) = v54 + v52;
    LODWORD(v53) = v53 - v51;
    v6[4] = v53 + v46;
    v6[5] = v52 - v45;
    v6[2] = v52 + v45;
    v6[3] = v53 - v46;
    *v6 = v55 + v44;
    v6[1] = v56 - v47;
    v6 += 8;
    ++v7;
    a2 += 8;
  }
  while (a3 != v7);
  v57 = ~a3;
  if (a3 < 7)
    goto LABEL_16;
LABEL_17:
  v58 = 0;
  do
  {
    v59 = &v94[v58];
    v60 = &a1[v58];
    v61 = *v59;
    v62 = v59[8];
    v63 = v59[16];
    v64 = v59[24];
    v65 = v59[32];
    v66 = v59[40];
    v67 = v59[48];
    LODWORD(v59) = v59[56];
    v68 = (_DWORD)v59 + v64;
    v69 = v66 + v62 - v68;
    v70 = v66 - (_DWORD)v59;
    v71 = 4 * (_DWORD)v59;
    LODWORD(v59) = (_DWORD)v59 + v66;
    v72 = 2 * v70;
    LODWORD(v59) = v68 - (_DWORD)v59;
    v73 = (unint64_t)(724 * v71) >> 10;
    v74 = 2 * (_DWORD)v59 - v73;
    v75 = (unint64_t)(946 * ((int)v73 + 2 * (int)v59)) >> 10;
    v76 = (unint64_t)(0x3FFFFFFFE78 * v74) >> 10;
    v77 = (unint64_t)(724 * v72) >> 10;
    LODWORD(v73) = v69 - v77;
    v78 = v69 + v77;
    LODWORD(v77) = v78 + v75;
    LODWORD(v75) = v78 - v75;
    v79 = v73 + v76;
    v80 = v63 - v67;
    v81 = (unint64_t)(1448 * v67) >> 10;
    v82 = v80 - v81;
    v83 = (unint64_t)(946 * (v80 + (int)v81)) >> 10;
    v84 = (unint64_t)(0x3FFFFFFFE78 * v82) >> 10;
    v85 = (int)v73 - (int)v76;
    v86 = (unint64_t)(724 * v65) >> 10;
    LODWORD(v73) = v61 - v86;
    v87 = v61 + v86;
    v88 = (unint64_t)(1004 * (int)v77) >> 10;
    LODWORD(v86) = v87 + v83 + 512;
    v89 = v73 + v84 + 512;
    v90 = v87 - v83 + 512;
    v91 = (unint64_t)(569 * v79) >> 10;
    result = (unint64_t)(0x3FFFFFFFF38 * (int)v75) >> 10;
    *v60 = a4[((int)v86 + (int)v88) >> 10];
    v60[16] = a4[(v89 + (int)v91) >> 10];
    v93 = (unint64_t)(0x3FFFFFFFCADLL * v85) >> 10;
    LODWORD(v83) = v73 - v84 + 512;
    v60[32] = a4[(v90 + (int)result) >> 10];
    v60[48] = a4[((int)v83 + (int)v93) >> 10];
    v60[56] = a4[((int)v86 - (int)v88) >> 10];
    v60[40] = a4[(v89 - (int)v91) >> 10];
    v60[24] = a4[(v90 - (int)result) >> 10];
    v60[8] = a4[((int)v83 - (int)v93) >> 10];
    ++v58;
  }
  while ((_DWORD)v58 != 8);
  return result;
}

void IDct8x8smart(int16x8_t *a1, int16x8_t *a2, int a3, int a4, unsigned int a5, int a6)
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  unsigned __int16 v10;
  int32x4_t v11;
  __int16 *i16;

  if (a3)
  {
    MPEG4_IDCTVec(a1, a2);
    return;
  }
  if (a6 | a5)
  {
    if (a4 == 2)
    {
      if (!a2->i16[0])
        goto LABEL_6;
    }
    else if (a4 != 1)
    {
LABEL_6:
      MPEG4_IDCT(a1->i16, a2->i16, a5);
      return;
    }
    idct1DC1AC((uint64_t)a2, a1->i16, a5, a6);
  }
  else
  {
    v6 = 0;
    v7 = a2->i16[0];
    v8 = v7 - 4;
    if (v7 < 4)
      v8 = v7 + 3;
    v9 = v8 >> 3;
    if (v7 >= 0)
      v10 = (v7 + 4) >> 3;
    else
      v10 = v9;
    v11 = vdupq_n_s32(v10 | (v10 << 16));
    do
    {
      i16 = a1[v6].i16;
      *(int32x4_t *)i16 = v11;
      *((int32x4_t *)i16 + 1) = v11;
      *((int32x4_t *)i16 + 2) = v11;
      *((int32x4_t *)i16 + 3) = v11;
      v6 += 4;
    }
    while (v6 != 8);
  }
}

uint64_t idct1DC1AC(uint64_t result, __int16 *a2, int a3, int a4)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  int32x2_t v21;
  int32x2_t v22;
  uint64_t v23;
  int32x2_t v24;
  int8x8_t v25;
  int32x2_t v26;
  uint32x2_t v27;
  __int16 *v28;
  _WORD *v29;
  _WORD *v30;
  _WORD *v31;
  _WORD *v32;
  _WORD *v33;
  _WORD *v34;
  __int16 *v35;
  unsigned int v36;
  int v37;
  int v38;
  __int16 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint64_t v66;
  __int16 *v67;
  __int16 *v68;
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  int v76;
  int v77;
  int16x8_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  uint64_t v95;
  int v96;
  __int16 *v97;
  __int16 *v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  __int16 *v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;

  v4 = *(__int16 *)(result + 2 * (a4 + 8 * a3));
  v5 = *(__int16 *)result;
  if (a3 == 4 && a4 == 4)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = 0;
      v9 = v7;
      v10 = 2 * v6;
      v11 = 8 * v6;
      v12 = 1;
      do
      {
        v13 = v5 + hardcodedsigns[v8 | v10] * v4;
        if (v13 < 0)
          v14 = -4;
        else
          v14 = 4;
        v15 = __OFADD__(v14, v13);
        v16 = v14 + v13;
        if (v16 < 0 != v15)
          v16 += 7;
        v17 = v16 >> 3;
        v18 = v8 | v11;
        a2[v18] = v17;
        *(__int16 *)((char *)a2 + ((2 * v18) | 8)) = v17;
        *(__int16 *)((char *)a2 + ((2 * v18) | 0x40)) = v17;
        *(__int16 *)((char *)a2 + ((2 * v18) | 0x48)) = v17;
        *(__int16 *)((char *)a2 + ((2 * v18) | 0x24)) = v17;
        *(__int16 *)((char *)a2 + ((2 * v18) | 0x2C)) = v17;
        *(__int16 *)((char *)a2 + ((2 * v18) | 0x64)) = v17;
        v19 = v12;
        *(__int16 *)((char *)a2 + ((2 * v18) | 0x6C)) = v17;
        v8 = 1;
        v12 = 0;
      }
      while ((v19 & 1) != 0);
      v7 = 0;
      v6 = 1;
    }
    while ((v9 & 1) != 0);
    v20 = 0;
    v21 = vdup_n_s32(v4);
    v22 = vdup_n_s32(v5);
    v23 = 1;
    do
    {
      v24 = vmls_s32(v22, *(int32x2_t *)&hardcodedsigns[2 * v20], v21);
      v25 = (int8x8_t)vcltz_s32(v24);
      v26 = vadd_s32((int32x2_t)vorr_s8((int8x8_t)(*(_QWORD *)&v25 & 0xFFFFFFFCFFFFFFFCLL), vbic_s8((int8x8_t)0x400000004, v25)), v24);
      v27 = vshr_n_u32(vsra_n_u32((uint32x2_t)v26, (uint32x2_t)vcltz_s32(v26), 0x1DuLL), 3uLL);
      v28 = &a2[8 * v20];
      v28[3] = v27.i16[2];
      v28[2] = v27.i16[0];
      v28[7] = v27.i16[2];
      v28[6] = v27.i16[0];
      v29 = (__int16 *)((char *)a2 + ((16 * v20) | 0x44));
      v29[1] = v27.i16[2];
      *v29 = v27.i16[0];
      v30 = (__int16 *)((char *)a2 + ((16 * v20) | 0x4C));
      v30[1] = v27.i16[2];
      result = v23;
      *v30 = v27.i16[0];
      v31 = (__int16 *)((char *)a2 + ((16 * v20) | 0x20));
      v31[1] = v27.i16[2];
      *v31 = v27.i16[0];
      v32 = (__int16 *)((char *)a2 + ((16 * v20) | 0x28));
      v32[1] = v27.i16[2];
      *v32 = v27.i16[0];
      v33 = (__int16 *)((char *)a2 + ((16 * v20) | 0x60));
      v33[1] = v27.i16[2];
      *v33 = v27.i16[0];
      v34 = (__int16 *)((char *)a2 + ((16 * v20) | 0x68));
      v34[1] = v27.i16[2];
      *v34 = v27.i16[0];
      v20 = 1;
      v23 = 0;
    }
    while ((result & 1) != 0);
  }
  else
  {
    v35 = (__int16 *)((char *)&stuff + 2 * (8 * a4));
    v36 = v5 << 17;
    v37 = (v5 << 17) + 0x80000;
    v38 = (v5 << 17) - 0x80000;
    v39 = (__int16 *)((char *)&stuff + 2 * (8 * a3));
    if (a3)
    {
      if (a4)
      {
        if ((a3 & 1) == ((a4 & 1) == 0))
        {
          v79 = 0;
          v80 = 0;
          v81 = 112;
          v82 = 14;
          result = 126;
          if ((a3 & 1) != 0)
          {
            do
            {
              v83 = 0;
              v84 = v39[v80];
              v85 = v79;
              v86 = result;
              v87 = v82;
              v88 = v81;
              do
              {
                v89 = ((v84 * v35[v83]) >> 12) * v4;
                if ((int)(v89 + v36) < 0 != __OFADD__(v89, v36))
                  v90 = v38;
                else
                  v90 = v37;
                v15 = __OFADD__(v90, v89);
                v91 = v90 + v89;
                if (v91 < 0 != v15)
                  v91 += 0xFFFFF;
                v92 = v91 >> 20;
                if ((int)(v36 - v89) >= 0)
                  v93 = v37;
                else
                  v93 = v38;
                v94 = (v93 - v89) / 0x100000;
                *(__int16 *)((char *)a2 + v85) = v92;
                *(__int16 *)((char *)a2 + v87) = v92;
                *(__int16 *)((char *)a2 + v88) = v94;
                *(__int16 *)((char *)a2 + v86) = v94;
                v88 += 2;
                v87 -= 2;
                v86 -= 2;
                v85 += 2;
                ++v83;
              }
              while (v83 != 4);
              ++v80;
              v81 -= 16;
              v82 += 16;
              result -= 16;
              v79 += 16;
            }
            while (v80 != 4);
          }
          else
          {
            do
            {
              v114 = 0;
              v115 = v39[v80];
              v116 = v79;
              v117 = result;
              v118 = v82;
              v119 = v81;
              do
              {
                v120 = ((v115 * v35[v114]) >> 12) * v4;
                if ((int)(v120 + v36) < 0 != __OFADD__(v120, v36))
                  v121 = v38;
                else
                  v121 = v37;
                v15 = __OFADD__(v121, v120);
                v122 = v121 + v120;
                if (v122 < 0 != v15)
                  v122 += 0xFFFFF;
                v123 = v122 >> 20;
                if ((int)(v36 - v120) >= 0)
                  v124 = v37;
                else
                  v124 = v38;
                v125 = (v124 - v120) / 0x100000;
                *(__int16 *)((char *)a2 + v116) = v123;
                *(__int16 *)((char *)a2 + v118) = v125;
                *(__int16 *)((char *)a2 + v119) = v123;
                *(__int16 *)((char *)a2 + v117) = v125;
                v119 += 2;
                v118 -= 2;
                v117 -= 2;
                v116 += 2;
                ++v114;
              }
              while (v114 != 4);
              ++v80;
              v81 -= 16;
              v82 += 16;
              result -= 16;
              v79 += 16;
            }
            while (v80 != 4);
          }
        }
        else
        {
          v40 = 0;
          v41 = 0;
          v42 = 112;
          v43 = 14;
          result = 126;
          if ((a4 & 1) != 0)
          {
            do
            {
              v54 = 0;
              v55 = v39[v41];
              v56 = v40;
              v57 = result;
              v58 = v43;
              v59 = v42;
              do
              {
                v60 = ((v55 * v35[v54]) >> 12) * v4;
                if ((int)(v60 + v36) < 0 != __OFADD__(v60, v36))
                  v61 = v38;
                else
                  v61 = v37;
                v15 = __OFADD__(v61, v60);
                v62 = v61 + v60;
                if (v62 < 0 != v15)
                  v62 += 0xFFFFF;
                v63 = v62 >> 20;
                if ((int)(v36 - v60) >= 0)
                  v64 = v37;
                else
                  v64 = v38;
                v65 = (v64 - v60) / 0x100000;
                *(__int16 *)((char *)a2 + v56) = v63;
                *(__int16 *)((char *)a2 + v58) = v65;
                *(__int16 *)((char *)a2 + v59) = v65;
                *(__int16 *)((char *)a2 + v57) = v63;
                v59 += 2;
                v58 -= 2;
                v57 -= 2;
                v56 += 2;
                ++v54;
              }
              while (v54 != 4);
              ++v41;
              v42 -= 16;
              v43 += 16;
              result -= 16;
              v40 += 16;
            }
            while (v41 != 4);
          }
          else
          {
            do
            {
              v44 = 0;
              v45 = v39[v41];
              v46 = v40;
              v47 = result;
              v48 = v43;
              v49 = v42;
              do
              {
                v50 = ((v45 * v35[v44]) >> 12) * v4;
                if ((int)(v50 + v36) < 0 != __OFADD__(v50, v36))
                  v51 = v38;
                else
                  v51 = v37;
                v15 = __OFADD__(v51, v50);
                v52 = v51 + v50;
                if (v52 < 0 != v15)
                  v52 += 0xFFFFF;
                v53 = v52 >> 20;
                *(__int16 *)((char *)a2 + v46) = v53;
                *(__int16 *)((char *)a2 + v48) = v53;
                *(__int16 *)((char *)a2 + v49) = v53;
                *(__int16 *)((char *)a2 + v47) = v53;
                v49 += 2;
                v48 -= 2;
                v47 -= 2;
                v46 += 2;
                ++v44;
              }
              while (v44 != 4);
              ++v41;
              v42 -= 16;
              v43 += 16;
              result -= 16;
              v40 += 16;
            }
            while (v41 != 4);
          }
        }
      }
      else if (a3 == 4)
      {
        v73 = 0;
        v74 = 56;
        do
        {
          v75 = v5 + hardcodedsigns[v73] * v4;
          if (v75 < 0)
            v76 = -4;
          else
            v76 = 4;
          v15 = __OFADD__(v76, v75);
          v77 = v76 + v75;
          if (v77 < 0 != v15)
            v77 += 7;
          v78 = vdupq_n_s16(v77 >> 3);
          *(int16x8_t *)&a2[8 * v73] = v78;
          *(int16x8_t *)&a2[v74] = v78;
          ++v73;
          v74 -= 8;
        }
        while (v73 != 4);
      }
      else
      {
        v106 = 0;
        v107 = *v35;
        v108 = 56;
        do
        {
          v109 = ((v39[v106] * v107) >> 12) * v4;
          if ((int)(v109 + v36) < 0 != __OFADD__(v109, v36))
            v110 = v38;
          else
            v110 = v37;
          v15 = __OFADD__(v110, v109);
          v111 = v110 + v109;
          if (v111 < 0 != v15)
            v111 += 0xFFFFF;
          result = (v111 >> 20);
          if ((a3 & 1) != 0)
            v109 = -v109;
          if ((int)(v109 + v36) < 0 != __OFADD__(v109, v36))
            v112 = v38;
          else
            v112 = v37;
          v15 = __OFADD__(v112, v109);
          v113 = v112 + v109;
          if (v113 < 0 != v15)
            v113 += 0xFFFFF;
          *(int16x8_t *)&a2[8 * v106] = vdupq_n_s16(result);
          *(int16x8_t *)&a2[v108] = vdupq_n_s16(v113 >> 20);
          ++v106;
          v108 -= 8;
        }
        while (v106 != 4);
      }
    }
    else if (a4 == 4)
    {
      v66 = 0;
      v67 = a2 + 39;
      v68 = a2 + 32;
      do
      {
        v69 = v5 + hardcodedsigns[v66] * v4;
        if (v69 < 0)
          v70 = -4;
        else
          v70 = 4;
        v15 = __OFADD__(v70, v69);
        v71 = v70 + v69;
        if (v71 < 0 != v15)
          v71 += 7;
        v72 = v71 >> 3;
        *(v68 - 32) = v72;
        *(v68 - 24) = v72;
        *(v68 - 16) = v72;
        *(v68 - 8) = v72;
        *v68 = v72;
        v68[8] = v72;
        v68[16] = v72;
        v68[24] = v72;
        *(v67 - 32) = v72;
        *(v67 - 24) = v72;
        *(v67 - 16) = v72;
        *(v67 - 8) = v72;
        *v67 = v72;
        v67[8] = v72;
        v67[16] = v72;
        v67[24] = v72;
        ++v66;
        --v67;
        ++v68;
      }
      while (v66 != 4);
    }
    else
    {
      v95 = 0;
      v96 = *v39;
      v97 = a2 + 39;
      v98 = a2 + 32;
      do
      {
        v99 = ((v96 * v35[v95]) >> 12) * v4;
        if ((int)(v99 + v36) < 0 != __OFADD__(v99, v36))
          v100 = v38;
        else
          v100 = v37;
        v15 = __OFADD__(v100, v99);
        v101 = v100 + v99;
        if (v101 < 0 != v15)
          v101 += 0xFFFFF;
        v102 = v101 >> 20;
        if ((a4 & 1) != 0)
          v99 = -v99;
        if ((int)(v99 + v36) < 0 != __OFADD__(v99, v36))
          v103 = v38;
        else
          v103 = v37;
        v15 = __OFADD__(v103, v99);
        v104 = v103 + v99;
        v105 = &v98[v95];
        *(v105 - 32) = v102;
        *(v105 - 24) = v102;
        *(v105 - 16) = v102;
        *(v105 - 8) = v102;
        *v105 = v102;
        v105[8] = v102;
        v105[16] = v102;
        v105[24] = v102;
        if (v104 < 0 != v15)
          v104 += 0xFFFFF;
        result = (v104 >> 20);
        *(v97 - 32) = result;
        *(v97 - 24) = result;
        *(v97 - 16) = result;
        *(v97 - 8) = result;
        *v97 = result;
        v97[8] = result;
        v97[16] = result;
        v97[24] = result;
        ++v95;
        --v97;
      }
      while (v95 != 4);
    }
  }
  return result;
}

uint64_t MPEG4_IDCT(__int16 *a1, __int16 *a2, unsigned int a3)
{
  __int16 *v3;
  _WORD *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  uint64_t result;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  __int16 *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  _BYTE v55[128];
  uint64_t v56;

  v3 = a1;
  v56 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x80000000) != 0)
  {
    v24 = 0;
    v4 = v55;
LABEL_7:
    bzero(v4, 16 * (v24 + 7) + 16);
    goto LABEL_8;
  }
  v4 = v55;
  v5 = -1;
  do
  {
    v6 = 370720 * *a2 + 0x4000;
    v7 = 514208 * a2[1] + 0x4000;
    v8 = 484384 * a2[2] + 0x4000;
    v9 = 435936 * a2[3] + 0x4000;
    v10 = 370720 * a2[4] + 0x4000;
    v11 = (435936 * a2[5] + 0x4000) >> 15;
    v12 = 484384 * a2[6] + 0x4000;
    v13 = (514208 * a2[7] + 0x4000) >> 15;
    v14 = ((6518 * (v7 >> 15) + 0x4000) >> 15) - v13;
    v15 = ((0x4000 - 21895 * (v9 >> 15)) >> 15) + v11;
    v16 = ((21895 * v11 + 0x4000) >> 15) + (v9 >> 15);
    v17 = ((6518 * v13 + 0x4000) >> 15) + (v7 >> 15);
    v18 = (v10 >> 15) + (v6 >> 15);
    v19 = (v6 >> 15) - (v10 >> 15);
    v20 = ((13573 * (v8 >> 15) + 0x4000) >> 15) - (v12 >> 15);
    v21 = ((13573 * (v12 >> 15) + 0x4000) >> 15) + (v8 >> 15);
    LOWORD(v8) = v14 + v15;
    v22 = v14 - v15;
    v23 = v17 - v16;
    LOWORD(v16) = v17 + v16;
    LOWORD(v17) = v21 + v18;
    LOWORD(v15) = v20 + v19;
    LOWORD(v19) = v19 - v20;
    LOWORD(v18) = v18 - v21;
    *v4 = v16 + v17;
    v4[1] = v15 + ((23170 * (v23 + v22) + 0x4000) >> 15);
    v4[2] = v19 + ((23170 * (v23 - v22) + 0x4000) >> 15);
    v4[3] = v18 + v8;
    v4[4] = v18 - v8;
    v4[5] = v19 + ((2147460478 * (v23 - v22) + 0x4000) >> 15);
    v4[6] = v15 + ((2147460478 * (v23 + v22) + 0x4000) >> 15);
    v4[7] = v17 - v16;
    v4 += 8;
    ++v5;
    a2 += 8;
  }
  while (a3 != v5);
  v3 = a1;
  v24 = ~a3;
  if (a3 < 7)
    goto LABEL_7;
LABEL_8:
  v25 = 0;
  result = 4294944126;
  do
  {
    v27 = (23170 * *(__int16 *)&v55[v25] + 0x4000) >> 15;
    v28 = 32138 * *(__int16 *)&v55[v25 + 16] + 0x4000;
    v29 = 30274 * *(__int16 *)&v55[v25 + 32] + 0x4000;
    v30 = 27246 * *(__int16 *)&v55[v25 + 48] + 0x4000;
    v31 = 23170 * *(__int16 *)&v55[v25 + 64] + 0x4000;
    v32 = 32138 * *(__int16 *)&v55[v25 + 112] + 0x4000;
    v33 = ((6518 * (v28 >> 15) + 0x4000) >> 15) - (v32 >> 15);
    v34 = (27246 * *(__int16 *)&v55[v25 + 80] + 0x4000) >> 15;
    v35 = ((0x4000 - 21895 * (v30 >> 15)) >> 15) + v34;
    v36 = ((21895 * v34 + 0x4000) >> 15) + (v30 >> 15);
    v37 = ((6518 * (v32 >> 15) + 0x4000) >> 15) + (v28 >> 15);
    v38 = (v31 >> 15) + v27;
    v39 = v27 - (v31 >> 15);
    v40 = 30274 * *(__int16 *)&v55[v25 + 96] + 0x4000;
    v41 = ((13573 * (v29 >> 15) + 0x4000) >> 15) - (v40 >> 15);
    v42 = ((13573 * (v40 >> 15) + 0x4000) >> 15) + (v29 >> 15);
    v43 = &v3[v25 / 2];
    v44 = v33 + v35;
    v45 = v33 - v35;
    v46 = v37 - v36;
    v47 = v37 + v36;
    v48 = v42 + v38;
    v49 = v41 + v39;
    v50 = v39 - v41;
    v51 = v38 - v42;
    v52 = v46 - v45;
    v53 = v46 + v45;
    *v43 = (((v47 + v48) << 9) + 0x4000) >> 15;
    v43[8] = (((v49 + ((23170 * v53 + 0x4000) >> 15)) << 9) + 0x4000) >> 15;
    v43[16] = (((v50 + ((23170 * v52 + 0x4000) >> 15)) << 9) + 0x4000) >> 15;
    v43[24] = (((v51 + v44) << 9) + 0x4000) >> 15;
    v43[32] = (((v51 - v44) << 9) + 0x4000) >> 15;
    v43[40] = (((v50 + ((0x4000 - 23170 * v52) >> 15)) << 9) + 0x4000) >> 15;
    v43[48] = (((v49 + ((0x4000 - 23170 * v53) >> 15)) << 9) + 0x4000) >> 15;
    v43[56] = (((v48 - v47) << 9) + 0x4000) >> 15;
    v25 += 2;
  }
  while ((_DWORD)v25 != 16);
  return result;
}

unint64_t IDct8x8smart(unint64_t result, int a2, __int16 *a3, unsigned int a4, int a5, unsigned __int8 *a6)
{
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  int v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  int v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  __int16 v63;
  int v64;
  int v65;
  uint64_t v66;
  unsigned int v67;
  int *v68;
  uint64_t v69;
  int *v70;
  _BYTE *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  unint64_t v84;
  int v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  int v89;
  int v90;
  int v91;
  unint64_t v92;
  int v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  int v98;
  unint64_t v99;
  int v100;
  int v101;
  unint64_t v102;
  unint64_t v103;
  _DWORD v104[64];
  uint64_t v105;

  v7 = (_DWORD *)result;
  v105 = *MEMORY[0x24BDAC8D0];
  if (a5 | a4)
  {
    if ((a4 & 0x80000000) != 0)
    {
      v59 = 0;
      v8 = v104;
    }
    else
    {
      v8 = v104;
      v9 = -1;
      do
      {
        v10 = *a3;
        v11 = a3[1];
        v12 = a3[2];
        v13 = a3[3];
        v14 = a3[4];
        v15 = a3[5];
        v16 = a3[6];
        v17 = a3[7];
        v18 = v10 << 7;
        v19 = 181 * v11;
        v20 = 181 * v12;
        v21 = 181 * v13;
        v22 = 181 * v14;
        v23 = 181 * v15;
        v24 = 181 * v17;
        v25 = 181 * v10;
        v26 = v11 << 8;
        v27 = v12 << 8;
        v28 = v13 << 8;
        v29 = v14 << 8;
        v30 = v15 << 8;
        v31 = v16 << 8;
        if (v9 == -1)
          v31 = 181 * v16;
        else
          v24 = v17 << 8;
        if (v9 == -1)
        {
          v30 = v23;
          v29 = v22;
          v28 = v21;
          v27 = v20;
          v32 = v19;
        }
        else
        {
          v32 = v26;
        }
        if (v9 == -1)
          v33 = v18;
        else
          v33 = v25;
        v34 = v28 + v24;
        v35 = v30 - (v28 + v24) + v32;
        v36 = 2 * (v30 - v24);
        v37 = 4 * v24;
        v38 = v34 - (v30 + v24);
        v39 = (unint64_t)(724 * v37) >> 10;
        v40 = 2 * v38 - v39;
        v41 = (unint64_t)(946 * ((int)v39 + 2 * v38)) >> 10;
        v42 = (unint64_t)(0x3FFFFFFFE78 * v40) >> 10;
        v43 = (unint64_t)(724 * v36) >> 10;
        v44 = v35 - v43;
        v45 = v35 + v43;
        LODWORD(v43) = v45 + v41;
        LODWORD(v41) = v45 - v41;
        v46 = (unint64_t)(1004 * (int)v43) >> 10;
        v47 = (unint64_t)(569 * (v44 + (int)v42)) >> 10;
        v48 = (unint64_t)(0x3FFFFFFFF38 * (int)v41) >> 10;
        v49 = (unint64_t)(0x3FFFFFFFCADLL * (v44 - (int)v42)) >> 10;
        v50 = v27 - v31;
        v51 = (unint64_t)(1448 * v31) >> 10;
        v52 = v50 - v51;
        v53 = (unint64_t)(946 * (v50 + (int)v51)) >> 10;
        v54 = (unint64_t)(0x3FFFFFFFE78 * v52) >> 10;
        v55 = (unint64_t)(724 * v29) >> 10;
        v56 = v33 - v55;
        LODWORD(v55) = v33 + v55;
        v57 = v55 + v53;
        v58 = v56 - v54;
        v8[6] = v56 - v54 + v49;
        v8[7] = v55 + v53 - v46;
        LODWORD(v54) = v56 + v54;
        LODWORD(v55) = v55 - v53;
        v8[4] = v55 + v48;
        v8[5] = v54 - v47;
        v8[2] = v54 + v47;
        v8[3] = v55 - v48;
        *v8 = v57 + v46;
        v8[1] = v58 - v49;
        v8 += 8;
        ++v9;
        a3 += 8;
      }
      while (a4 != v9);
      v59 = ~a4;
      if (a4 >= 7)
        goto LABEL_29;
    }
    bzero(v8, 32 * (v59 + 7) + 32);
LABEL_29:
    v69 = 0;
    do
    {
      v70 = &v104[v69];
      v71 = (char *)v7 + v69;
      v72 = *v70;
      v73 = v70[8];
      v74 = v70[16];
      v75 = v70[24];
      v76 = v70[32];
      v77 = v70[40];
      v78 = v70[48];
      LODWORD(v70) = v70[56];
      v79 = (_DWORD)v70 + v75;
      v80 = v77 + v73 - v79;
      v81 = v77 - (_DWORD)v70;
      v82 = 4 * (_DWORD)v70;
      LODWORD(v70) = (_DWORD)v70 + v77;
      v83 = 2 * v81;
      LODWORD(v70) = v79 - (_DWORD)v70;
      v84 = (unint64_t)(724 * v82) >> 10;
      v85 = 2 * (_DWORD)v70 - v84;
      v86 = (unint64_t)(946 * ((int)v84 + 2 * (int)v70)) >> 10;
      v87 = (unint64_t)(0x3FFFFFFFE78 * v85) >> 10;
      v88 = (unint64_t)(724 * v83) >> 10;
      LODWORD(v84) = v80 - v88;
      v89 = v80 + v88;
      LODWORD(v88) = v89 + v86;
      LODWORD(v86) = v89 - v86;
      v90 = v84 + v87;
      v91 = v74 - v78;
      v92 = (unint64_t)(1448 * v78) >> 10;
      v93 = v91 - v92;
      v94 = (unint64_t)(946 * (v91 + (int)v92)) >> 10;
      v95 = (unint64_t)(0x3FFFFFFFE78 * v93) >> 10;
      v96 = (int)v84 - (int)v87;
      v97 = (unint64_t)(724 * v76) >> 10;
      LODWORD(v84) = v72 - v97;
      v98 = v72 + v97;
      v99 = (unint64_t)(1004 * (int)v88) >> 10;
      LODWORD(v97) = v98 + v94 + 512;
      v100 = v84 + v95 + 512;
      v101 = v98 - v94 + 512;
      v102 = (unint64_t)(569 * v90) >> 10;
      result = (unint64_t)(0x3FFFFFFFF38 * (int)v86) >> 10;
      *v71 = a6[((int)v97 + (int)v99) >> 10];
      v71[16] = a6[(v100 + (int)v102) >> 10];
      v103 = (unint64_t)(0x3FFFFFFFCADLL * v96) >> 10;
      LODWORD(v94) = v84 - v95 + 512;
      v71[32] = a6[(v101 + (int)result) >> 10];
      v71[48] = a6[((int)v94 + (int)v103) >> 10];
      v71[56] = a6[((int)v97 - (int)v99) >> 10];
      v71[40] = a6[(v100 - (int)v102) >> 10];
      v71[24] = a6[(v101 - (int)result) >> 10];
      v71[8] = a6[((int)v94 - (int)v103) >> 10];
      ++v69;
    }
    while ((_DWORD)v69 != 8);
    return result;
  }
  v60 = *a3;
  v61 = v60 - 4;
  if (v60 < 4)
    v61 = v60 + 3;
  v62 = v61 >> 3;
  if (v60 >= 0)
    v63 = (v60 + 4) >> 3;
  else
    v63 = v62;
  if (a2 >= 0)
    v64 = a2;
  else
    v64 = a2 + 1;
  v65 = (a6[v63] << 8) | (a6[v63] << 16) | (a6[v63] << 24) | a6[v63];
  v66 = 4 * (v64 >> 1);
  v67 = -2;
  do
  {
    *v7 = v65;
    v7[1] = v65;
    v68 = &v7[a2 / 4];
    *v68 = v65;
    v68[1] = v65;
    v67 += 2;
    v7 = (_DWORD *)((char *)v7 + v66);
  }
  while (v67 < 6);
  return result;
}

uint64_t idct8x8(uint64_t result, __int16 *a2)
{
  uint64_t v2;
  float *v3;
  int v4;
  float v5;
  double v6;
  double v7;
  float v8;
  int v9;
  double v10;
  int v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  float *v26;
  _BYTE *v27;
  float v28;
  float v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  float v35;
  double v36;
  double v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  float v62;
  int v63;
  _BYTE v64[256];
  uint64_t v65;

  v2 = 0;
  v65 = *MEMORY[0x24BDAC8D0];
  do
  {
    v3 = (float *)&v64[v2];
    v4 = a2[2];
    v5 = (double)*a2 * 0.7071;
    v6 = (double)a2[1];
    v7 = (double)a2[7];
    v8 = (double)a2[4] * 0.7071;
    v9 = a2[6];
    v10 = (double)a2[5];
    v11 = a2[3];
    v12 = v7 * -0.9808 + v6 * 0.1951;
    v13 = (double)v11 * -0.5556 + v10 * 0.8315;
    v14 = v7 * 0.1951 + v6 * 0.9808;
    *(float *)&v7 = v10 * 0.5556 + (double)v11 * 0.8315;
    *(float *)&v10 = v5 + v8;
    *(float *)&v14 = v14;
    v15 = v5 - v8;
    v16 = (double)v9 * -0.9239 + (double)v4 * 0.3827;
    v17 = (double)v9 * 0.3827 + (double)v4 * 0.9239;
    v18 = v12 + v13;
    v19 = (float)(v12 - v13) * 0.7071;
    v20 = (float)(*(float *)&v14 - *(float *)&v7) * 0.7071;
    *(float *)&v14 = *(float *)&v14 + *(float *)&v7;
    *(float *)&v7 = *(float *)&v10 + v17;
    v21 = v15 + v16;
    v22 = v15 - v16;
    v23 = *(float *)&v10 - v17;
    *(float *)&v10 = v20 - v19;
    v24 = v20 + v19;
    *v3 = *(float *)&v7 + *(float *)&v14;
    v3[1] = v21 + v24;
    v3[2] = v22 + *(float *)&v10;
    v3[3] = v23 + v18;
    v3[4] = v23 - v18;
    v3[5] = v22 - *(float *)&v10;
    v3[6] = v21 - v24;
    v3[7] = *(float *)&v7 - *(float *)&v14;
    v2 += 32;
    a2 += 8;
  }
  while ((_DWORD)v2 != 256);
  v25 = 0;
  do
  {
    v26 = (float *)&v64[4 * v25];
    v27 = (_BYTE *)(result + v25);
    v28 = *v26 * 0.7071;
    v29 = v26[32] * 0.7071;
    v30 = v26[8];
    v31 = v26[56];
    v32 = v31 * -0.9808 + v30 * 0.1951;
    v33 = v26[40];
    v34 = v26[24];
    v35 = v34 * -0.5556 + v33 * 0.8315;
    *(float *)&v33 = v33 * 0.5556 + v34 * 0.8315;
    *(float *)&v30 = v31 * 0.1951 + v30 * 0.9808;
    *(float *)&v31 = v28 + v29;
    *(float *)&v34 = v28 - v29;
    v36 = v26[16];
    v37 = v26[48];
    v38 = v37 * -0.9239 + v36 * 0.3827;
    v39 = v37 * 0.3827 + v36 * 0.9239;
    v40 = v32 + v35;
    v41 = (float)(v32 - v35) * 0.7071;
    v42 = (float)(*(float *)&v30 - *(float *)&v33) * 0.7071;
    v43 = *(float *)&v30 + *(float *)&v33;
    v44 = *(float *)&v31 + v39;
    *(float *)&v30 = *(float *)&v34 + v38;
    v45 = *(float *)&v34 - v38;
    v46 = *(float *)&v31 - v39;
    *(float *)&v31 = v42 - v41;
    v47 = v42 + v41;
    v48 = (float)((float)(v44 + v43) + 2.0) * 0.25;
    v49 = (float)((float)(*(float *)&v30 + v47) + 2.0) * 0.25;
    v50 = (float)((float)(v45 + *(float *)&v31) + 2.0) * 0.25;
    v51 = (float)((float)(v46 + v40) + 2.0) * 0.25;
    v52 = (float)((float)(v46 - v40) + 2.0) * 0.25;
    v53 = (float)((float)(v45 - *(float *)&v31) + 2.0) * 0.25;
    v54 = (float)((float)(*(float *)&v30 - v47) + 2.0) * 0.25;
    v55 = (int)v48;
    if (v48 < 0.0)
      LOBYTE(v55) = 0;
    if (v48 > 255.0)
      LOBYTE(v55) = -1;
    *v27 = v55;
    v56 = (int)v49;
    if (v49 < 1.0)
      LOBYTE(v56) = 0;
    if (v49 > 255.0)
      LOBYTE(v56) = -1;
    v27[8] = v56;
    v57 = (int)v50;
    if (v50 < 2.0)
      LOBYTE(v57) = 0;
    if (v50 > 255.0)
      LOBYTE(v57) = -1;
    v27[16] = v57;
    v58 = (int)v51;
    if (v51 < 3.0)
      LOBYTE(v58) = 0;
    if (v51 > 255.0)
      LOBYTE(v58) = -1;
    v27[24] = v58;
    v59 = (int)v52;
    if (v52 < 0.0)
      LOBYTE(v59) = 0;
    if (v52 > 255.0)
      LOBYTE(v59) = -1;
    v27[32] = v59;
    v60 = (int)v53;
    if (v53 < 0.0)
      LOBYTE(v60) = 0;
    if (v53 > 255.0)
      LOBYTE(v60) = -1;
    v27[40] = v60;
    if (v54 <= 255.0)
    {
      if (v54 >= 0.0)
        v61 = (int)v54;
      else
        LOBYTE(v61) = 0;
    }
    else
    {
      LOBYTE(v61) = -1;
    }
    v62 = (float)((float)(v44 - v43) + 2.0) * 0.25;
    v27[48] = v61;
    if (v62 <= 255.0)
    {
      if (v62 >= 0.0)
        v63 = (int)v62;
      else
        LOBYTE(v63) = 0;
    }
    else
    {
      LOBYTE(v63) = -1;
    }
    v27[56] = v63;
    ++v25;
  }
  while ((_DWORD)v25 != 8);
  return result;
}

int16x8_t *idct8x8(int16x8_t *result, __int16 *a2)
{
  uint64_t v2;
  float *v3;
  int v4;
  float v5;
  double v6;
  double v7;
  float v8;
  int v9;
  double v10;
  int v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float64x2_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  float32x4_t v152;
  float32x4_t v153;
  float32x4_t v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  uint64_t v158;

  v2 = 0;
  v158 = *MEMORY[0x24BDAC8D0];
  do
  {
    v3 = &v142.f32[v2];
    v4 = a2[2];
    v5 = (double)*a2 * 0.7071;
    v6 = (double)a2[1];
    v7 = (double)a2[7];
    v8 = (double)a2[4] * 0.7071;
    v9 = a2[6];
    v10 = (double)a2[5];
    v11 = a2[3];
    v12 = v7 * -0.9808 + v6 * 0.1951;
    v13 = (double)v11 * -0.5556 + v10 * 0.8315;
    v14 = v7 * 0.1951 + v6 * 0.9808;
    *(float *)&v7 = v10 * 0.5556 + (double)v11 * 0.8315;
    *(float *)&v10 = v5 + v8;
    *(float *)&v14 = v14;
    v15 = v5 - v8;
    v16 = (double)v9 * -0.9239 + (double)v4 * 0.3827;
    v17 = (double)v9 * 0.3827 + (double)v4 * 0.9239;
    v18 = v12 + v13;
    v19 = (float)(v12 - v13) * 0.7071;
    v20 = (float)(*(float *)&v14 - *(float *)&v7) * 0.7071;
    *(float *)&v14 = *(float *)&v14 + *(float *)&v7;
    *(float *)&v7 = *(float *)&v10 + v17;
    v21 = v15 + v16;
    v22 = v15 - v16;
    v23 = *(float *)&v10 - v17;
    *(float *)&v10 = v20 - v19;
    v24 = v20 + v19;
    *v3 = *(float *)&v7 + *(float *)&v14;
    v3[1] = v21 + v24;
    v3[2] = v22 + *(float *)&v10;
    v3[3] = v23 + v18;
    v3[4] = v23 - v18;
    v3[5] = v22 - *(float *)&v10;
    v3[6] = v21 - v24;
    v3[7] = *(float *)&v7 - *(float *)&v14;
    v2 += 8;
    a2 += 8;
  }
  while ((_DWORD)(v2 * 4) != 256);
  v25 = (float64x2_t)vdupq_n_s64(0x3FE6A0902DE00D1BuLL);
  v26 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v143.f32), v25)), vmulq_f64(vcvt_hight_f64_f32(v143), v25));
  v27 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v142.f32), v25)), vmulq_f64(vcvt_hight_f64_f32(v142), v25));
  v28 = vcvtq_f64_f32(*(float32x2_t *)v144.f32);
  v29 = vcvt_hight_f64_f32(v144);
  v30 = vcvtq_f64_f32(*(float32x2_t *)v145.f32);
  v31 = vcvt_hight_f64_f32(v145);
  v32 = vcvt_hight_f64_f32(v157);
  v33 = vcvtq_f64_f32(*(float32x2_t *)v157.f32);
  v34 = vcvt_hight_f64_f32(v156);
  v35 = vcvtq_f64_f32(*(float32x2_t *)v156.f32);
  v36 = (float64x2_t)vdupq_n_s64(0xBFEF62B6AE7D566DLL);
  v37 = vmulq_f64(v35, v36);
  v38 = vmulq_f64(v34, v36);
  v39 = vcvtq_f64_f32(*(float32x2_t *)v152.f32);
  v40 = vcvt_hight_f64_f32(v152);
  v41 = vcvtq_f64_f32(*(float32x2_t *)v153.f32);
  v42 = vcvt_hight_f64_f32(v153);
  v43 = vcvt_hight_f64_f32(v149);
  v44 = vcvtq_f64_f32(*(float32x2_t *)v149.f32);
  v45 = vcvt_hight_f64_f32(v148);
  v46 = vcvtq_f64_f32(*(float32x2_t *)v148.f32);
  v47 = (float64x2_t)vdupq_n_s64(0xBFE1C779A6B50B0FLL);
  v48 = vmulq_f64(v46, v47);
  v49 = vmulq_f64(v45, v47);
  v50 = vmulq_f64(v44, v47);
  v51 = (float64x2_t)vdupq_n_s64(0x3FEA9BA5E353F7CFuLL);
  v52 = vmlaq_f64(vmulq_f64(v43, v47), v51, v42);
  v53 = vmlaq_f64(v50, v51, v41);
  v54 = vmlaq_f64(v49, v51, v40);
  v55 = vmlaq_f64(v48, v51, v39);
  v56 = (float64x2_t)vdupq_n_s64(0x3FE1C779A6B50B0FuLL);
  v57 = vmulq_f64(v39, v56);
  v58 = vmulq_f64(v40, v56);
  v59 = vmulq_f64(v41, v56);
  v60 = vmulq_f64(v42, v56);
  v61 = vmulq_f64(v33, v36);
  v62 = vmlaq_f64(v60, v51, v43);
  v63 = (float64x2_t)vdupq_n_s64(0x3FC8F9096BB98C7EuLL);
  v64 = vmlaq_f64(vmulq_f64(v32, v36), v63, v31);
  v65 = vmlaq_f64(v61, v63, v30);
  v66 = vmlaq_f64(v38, v63, v29);
  v67 = vmlaq_f64(v37, v63, v28);
  v68 = vmlaq_f64(v59, v51, v44);
  v69 = vmlaq_f64(v58, v51, v45);
  v70 = vmlaq_f64(v57, v51, v46);
  v71 = vmulq_f64(v35, v63);
  v72 = vmulq_f64(v34, v63);
  v73 = vmulq_f64(v33, v63);
  v74 = vmulq_f64(v32, v63);
  v75 = (float64x2_t)vdupq_n_s64(0x3FEF62B6AE7D566DuLL);
  v76 = vmlaq_f64(v74, v75, v31);
  v77 = vmlaq_f64(v73, v75, v30);
  v78 = vmlaq_f64(v72, v75, v29);
  v79 = vmlaq_f64(v71, v75, v28);
  v80 = vcvtq_f64_f32(*(float32x2_t *)v146.f32);
  v81 = vcvt_hight_f64_f32(v146);
  v82 = vcvtq_f64_f32(*(float32x2_t *)v147.f32);
  v83 = vcvt_hight_f64_f32(v147);
  v84 = vcvt_hight_f64_f32(v155);
  v85 = vcvtq_f64_f32(*(float32x2_t *)v155.f32);
  v86 = vcvt_hight_f64_f32(v154);
  v87 = vcvtq_f64_f32(*(float32x2_t *)v154.f32);
  v88 = (float64x2_t)vdupq_n_s64(0xBFED9096BB98C7E3);
  v89 = vmulq_f64(v87, v88);
  v90 = vmulq_f64(v86, v88);
  v91 = vmulq_f64(v85, v88);
  v92 = (float64x2_t)vdupq_n_s64(0x3FD87E28240B7803uLL);
  v93 = vmlaq_f64(vmulq_f64(v84, v88), v92, v83);
  v94 = vmlaq_f64(v91, v92, v82);
  v95 = vmlaq_f64(v90, v92, v81);
  v96 = vmlaq_f64(v89, v92, v80);
  v97 = vmulq_f64(v87, v92);
  v98 = vmulq_f64(v86, v92);
  v99 = vmulq_f64(v85, v92);
  v100 = vmulq_f64(v84, v92);
  v101 = (float64x2_t)vdupq_n_s64(0x3FED9096BB98C7E3uLL);
  v102 = vmlaq_f64(v100, v101, v83);
  v103 = vmlaq_f64(v99, v101, v82);
  v104 = vmlaq_f64(v98, v101, v81);
  v105 = vmlaq_f64(v97, v101, v80);
  v106 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v151.f32), v25)), vmulq_f64(vcvt_hight_f64_f32(v151), v25));
  v107 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v150.f32), v25)), vmulq_f64(vcvt_hight_f64_f32(v150), v25));
  v108 = vaddq_f32(v27, v107);
  v109 = vsubq_f32(v27, v107);
  v110 = vaddq_f32(v26, v106);
  v111 = vsubq_f32(v26, v106);
  v112 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v96), v95);
  v113 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v94), v93);
  v114 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v105), v104);
  *(float32x2_t *)v27.f32 = vcvt_f32_f64(v67);
  *(float32x2_t *)v26.f32 = vcvt_f32_f64(v65);
  *(float32x2_t *)&v67.f64[0] = vcvt_f32_f64(v53);
  v115 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v103), v102);
  *(float32x2_t *)&v83.f64[0] = vsub_f32(*(float32x2_t *)v26.f32, *(float32x2_t *)&v67.f64[0]);
  *(float32x2_t *)&v55.f64[0] = vcvt_f32_f64(v55);
  v116 = vaddq_f32(vcvt_hight_f32_f64(*(int32x2_t *)v26.f32, v64), vcvt_hight_f32_f64(*(int32x2_t *)&v67.f64[0], v52));
  *(float32x2_t *)&v67.f64[0] = vsub_f32(*(float32x2_t *)v27.f32, *(float32x2_t *)&v55.f64[0]);
  v117 = vaddq_f32(vcvt_hight_f32_f64(*(int32x2_t *)v27.f32, v66), vcvt_hight_f32_f64(*(int32x2_t *)&v55.f64[0], v54));
  *(float32x2_t *)&v66.f64[0] = vsub_f32(vcvt_f32_f64(v66), vcvt_f32_f64(v54));
  *(float32x2_t *)&v54.f64[0] = vsub_f32(vcvt_f32_f64(v64), vcvt_f32_f64(v52));
  v118 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v67.f64[0]), v25)), vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v66.f64[0]), v25));
  *(float32x2_t *)&v66.f64[0] = vcvt_f32_f64(v70);
  *(float32x2_t *)&v67.f64[0] = vcvt_f32_f64(v79);
  v119 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v83.f64[0]), v25)), vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v54.f64[0]), v25));
  *(float32x2_t *)&v54.f64[0] = vsub_f32(*(float32x2_t *)&v67.f64[0], *(float32x2_t *)&v66.f64[0]);
  v120 = vcvt_hight_f32_f64(*(int32x2_t *)&v66.f64[0], v69);
  *(float32x2_t *)&v55.f64[0] = vcvt_f32_f64(v68);
  *(float32x2_t *)&v83.f64[0] = vcvt_f32_f64(v69);
  *(float32x2_t *)&v69.f64[0] = vcvt_f32_f64(v77);
  v121 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v54.f64[0]), v25)), vmulq_f64(vcvtq_f64_f32(vsub_f32(vcvt_f32_f64(v78), *(float32x2_t *)&v83.f64[0])), v25));
  v122 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vsub_f32(*(float32x2_t *)&v69.f64[0], *(float32x2_t *)&v55.f64[0])), v25)), vmulq_f64(vcvtq_f64_f32(vsub_f32(vcvt_f32_f64(v76), vcvt_f32_f64(v62))), v25));
  v123 = vaddq_f32(vcvt_hight_f32_f64(*(int32x2_t *)&v69.f64[0], v76), vcvt_hight_f32_f64(*(int32x2_t *)&v55.f64[0], v62));
  v124 = vaddq_f32(vcvt_hight_f32_f64(*(int32x2_t *)&v67.f64[0], v78), v120);
  v125 = vaddq_f32(v110, v115);
  v126 = vaddq_f32(v108, v114);
  v127 = vaddq_f32(v111, v113);
  v128 = vaddq_f32(v109, v112);
  v129 = vsubq_f32(v111, v113);
  v130 = vsubq_f32(v109, v112);
  v131 = vsubq_f32(v110, v115);
  v132 = vsubq_f32(v108, v114);
  v133 = vsubq_f32(v122, v119);
  v134 = vsubq_f32(v121, v118);
  v135 = vaddq_f32(v122, v119);
  v136 = vaddq_f32(v121, v118);
  v118.i64[0] = 0x4000000040000000;
  v118.i64[1] = 0x4000000040000000;
  __asm { FMOV            V7.4S, #0.25 }
  *result = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v126, v124), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v125, v123), v118), _Q7)));
  result[1] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v128, v136), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v127, v135), v118), _Q7)));
  result[2] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v130, v134), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v129, v133), v118), _Q7)));
  result[3] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v132, v117), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vaddq_f32(v131, v116), v118), _Q7)));
  result[4] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v132, v117), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v131, v116), v118), _Q7)));
  result[5] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v130, v134), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v129, v133), v118), _Q7)));
  result[6] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v128, v136), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v127, v135), v118), _Q7)));
  result[7] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v126, v124), v118), _Q7)), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vaddq_f32(vsubq_f32(v125, v123), v118), _Q7)));
  return result;
}

_WORD *SparseIDCT0_W8H8(_WORD *result)
{
  uint64_t v1;
  int64x2_t v2;
  int64x2_t *v3;

  v1 = 0;
  v2 = vdupq_n_s64(0x1000100010001* (unint64_t)(unsigned __int16)((unint64_t)(__int16)(*result + 4) >> 3));
  do
  {
    v3 = (int64x2_t *)&result[v1];
    *v3 = v2;
    v3[1] = v2;
    v3[2] = v2;
    v3[3] = v2;
    v1 += 32;
  }
  while (v1 != 64);
  return result;
}

uint64_t IDCT_W8H8(uint64_t result, int a2, unsigned __int8 *a3)
{
  char v3;
  unsigned int v4;
  int v5;
  _BYTE *v6;
  _BYTE *v7;
  _WORD *v8;
  __int16 *v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  uint64_t v83;
  _BYTE v85[128];
  uint64_t v86;

  v3 = 0;
  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a2 + 1;
  v82 = a2 | (a2 << 8) | ((a2 | (a2 << 8)) << 16);
  v5 = 1024;
  v6 = v85;
  v83 = result;
  v7 = (_BYTE *)result;
  if (a2 == -1)
    goto LABEL_23;
  while (1)
  {
    v8 = v6 + 8;
    v9 = (__int16 *)(v7 + 64);
    v10 = a3;
    result = v4;
    do
    {
      v11 = v5 + (*(v9 - 32) << 13);
      v12 = *v10++;
      switch(v12)
      {
        case 0:
          if ((v3 & 1) != 0)
            v13 = (unsigned __int16)(v11 >> 18) | ((unsigned __int16)(v11 >> 18) << 16);
          else
            v13 = (v11 >> 11) & 0xFFFC | (v11 >> 11 << 16);
          *(int32x4_t *)(v8 - 4) = vdupq_n_s32(v13);
          goto LABEL_19;
        case 1:
          v54 = *(v9 - 24);
          v21 = 2260 * v54;
          v22 = 6436 * v54;
          v23 = 9633 * v54;
          v24 = 11363 * v54;
          v19 = v5 + (*(v9 - 32) << 13);
          v20 = v19;
          v18 = v19;
          break;
        case 2:
          v14 = *(v9 - 24);
          v15 = *(v9 - 16);
          v16 = 4433 * v15;
          v17 = 10703 * v15;
          v18 = v11 - 10703 * v15;
          v19 = v16 + v11;
          v20 = v11 - v16;
          v11 += v17;
          v21 = 2260 * v14;
          v22 = 6436 * v14;
          v23 = 9633 * v14;
          v24 = 11363 * v14;
          break;
        case 3:
          v25 = *(v9 - 24);
          v26 = *(v9 - 16);
          v27 = *(v9 - 8);
          v28 = 4433 * v26;
          v29 = 10703 * v26;
          v18 = v11 - 10703 * v26;
          v19 = v28 + v11;
          v20 = v11 - v28;
          v11 += v29;
          goto LABEL_9;
        case 4:
          v25 = *(v9 - 24);
          v30 = *(v9 - 16);
          v27 = *(v9 - 8);
          v31 = *v9;
          v32 = 4433 * v30;
          v30 *= 10703;
          v33 = v11 + (v31 << 13);
          v34 = v11 - (v31 << 13);
          v11 = v33 + v30;
          v18 = v33 - v30;
          v19 = v34 + v32;
          v20 = v34 - v32;
LABEL_9:
          v35 = 6436 * (v27 + v25);
          v36 = 9633 * (v27 + v25);
          v21 = 8697 * v25 - v35;
          v22 = v35 - 17799 * v27;
          v23 = v36 - 11893 * v27;
          v24 = v36 + 1730 * v25;
          break;
        case 5:
          v55 = *(v9 - 24);
          v56 = *(v9 - 16);
          v57 = *(v9 - 8);
          v58 = *v9;
          v59 = v9[8];
          v60 = 4433 * v56;
          v56 *= 10703;
          v61 = v11 + (v58 << 13);
          v62 = v11 - (v58 << 13);
          v11 = v61 + v56;
          v18 = v61 - v56;
          v19 = v62 + v60;
          goto LABEL_14;
        case 6:
          v55 = *(v9 - 24);
          v63 = *(v9 - 16);
          v57 = *(v9 - 8);
          v64 = *v9;
          v59 = v9[8];
          v65 = v9[16];
          v66 = 4433 * (v65 + v63);
          v60 = v66 - 15137 * v65;
          v67 = v66 + 6270 * v63;
          v68 = v11 + (v64 << 13);
          v62 = v11 - (v64 << 13);
          v11 = v67 + v68;
          v18 = v68 - v67;
          v19 = v60 + v62;
LABEL_14:
          v20 = v62 - v60;
          v69 = 9633 * (v59 + v55 + v57);
          v70 = -20995 * (v59 + v57);
          v71 = v69 - 16069 * v57;
          v72 = v69 - 3196 * (v59 + v55);
          v21 = v71 - 7373 * v55;
          v22 = v70 + 16819 * v59 + v72;
          v23 = v70 + 25172 * v57 + v71;
          v24 = v72 + 4926 * v55;
          break;
        default:
          v37 = *(v9 - 24);
          v38 = *(v9 - 16);
          v39 = *(v9 - 8);
          v40 = *v9;
          v41 = v9[8];
          v42 = v9[16];
          v43 = 4433 * (v42 + v38);
          v44 = v9[24];
          v45 = v43 - 15137 * v42;
          v46 = v43 + 6270 * v38;
          v47 = v11 + (v40 << 13);
          v48 = v11 - (v40 << 13);
          v11 = v46 + v47;
          v18 = v47 - v46;
          v19 = v45 + v48;
          v20 = v48 - v45;
          v49 = 9633 * (v44 + v39 + v41 + v37);
          v50 = -7373 * (v44 + v37);
          v51 = -20995 * (v41 + v39);
          v52 = v49 - 16069 * (v44 + v39);
          v53 = v49 - 3196 * (v41 + v37);
          v21 = v50 + 2446 * v44 + v52;
          v22 = v51 + 16819 * v41 + v53;
          v23 = v51 + 25172 * v39 + v52;
          v24 = v50 + 12299 * v37 + v53;
          break;
      }
      v73 = v11 + v24;
      v74 = v11 - v24;
      v75 = v19 + v23;
      v76 = v19 - v23;
      v77 = v20 + v22;
      v78 = v20 - v22;
      v79 = v18 + v21;
      v80 = v18 - v21;
      if ((v3 & 1) != 0)
      {
        *(v8 - 4) = v73 >> 18;
        *(v8 - 3) = v75 >> 18;
        *(v8 - 2) = v77 >> 18;
        *(v8 - 1) = v79 >> 18;
        *v8 = v80 >> 18;
        v8[1] = v78 >> 18;
        v8[2] = v76 >> 18;
        v81 = v74 >> 18;
      }
      else
      {
        *(v8 - 4) = v73 >> 11;
        *(v8 - 3) = v75 >> 11;
        *(v8 - 2) = v77 >> 11;
        *(v8 - 1) = v79 >> 11;
        *v8 = v80 >> 11;
        v8[1] = v78 >> 11;
        v8[2] = v76 >> 11;
        v81 = v74 >> 11;
      }
      v8[3] = v81;
LABEL_19:
      v8 += 8;
      ++v9;
      --result;
    }
    while (result);
LABEL_23:
    if ((v3 & 1) != 0)
      return result;
    v5 = 0x20000;
    v6 = (_BYTE *)v83;
    *(_DWORD *)a3 = v82;
    *((_DWORD *)a3 + 1) = v82;
    v7 = v85;
    v4 = 8;
    v3 = 1;
  }
}

uint64_t Y420ToY422_yuvs(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int *a4, unsigned int a5, unsigned __int16 a6, unsigned int a7, unsigned int a8, int a9, unsigned __int8 *a10, unsigned __int8 *a11)
{
  signed int v11;
  signed int v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  uint64_t v21;

  if (a8 >= 2)
  {
    v11 = 0;
    v12 = a8 - 1;
    v13 = 2 * a5;
    v14 = a5 >> 1;
    v15 = &a4[a9 >> 2];
    v16 = (uint64_t)a9 >> 1;
    v17 = a5;
    do
    {
      if (a7 >= 2)
      {
        v18 = 0;
        do
        {
          v19 = a11[a3[v18 >> 1]];
          v20 = (a10[*(unsigned __int8 *)(result + v18 + v17)] | (a10[*(unsigned __int8 *)(result + (v18 | 1) + v17)] << 16)) & 0xFF00FF | (v19 << 24) | (a11[a2[v18 >> 1]] << 8);
          v21 = 2 * v18;
          *(int *)((char *)a4 + v21) = a10[*(unsigned __int8 *)(result + v18)] | (a10[*(unsigned __int8 *)(result + (v18 | 1))] << 16) | (v19 << 24) | (a11[a2[v18 >> 1]] << 8);
          *(int *)((char *)v15 + v21) = v20;
          v18 += 2;
        }
        while ((uint64_t)v18 < a7 - 1);
      }
      result += v13;
      a2 += v14;
      a3 += v14;
      v11 += 2;
      a4 += v16;
      v15 += v16;
    }
    while (v11 < v12);
  }
  return result;
}

uint64_t Y420ToY422_2vuy(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int *a4, unsigned int a5, unsigned __int16 a6, unsigned int a7, unsigned int a8, int a9, unsigned __int8 *a10, unsigned __int8 *a11)
{
  signed int v11;
  signed int v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;

  if (a8 >= 2)
  {
    v11 = 0;
    v12 = a8 - 1;
    v13 = 2 * a5;
    v14 = a5 >> 1;
    v15 = &a4[a9 >> 2];
    v16 = (uint64_t)a9 >> 1;
    v17 = a5;
    do
    {
      if (a7 >= 2)
      {
        v18 = 0;
        do
        {
          v19 = a11[a2[v18 >> 1]];
          v20 = (a10[*(unsigned __int8 *)(result + v18)] << 8) | (a10[*(unsigned __int8 *)(result + (v18 | 1))] << 24) | v19 | (a11[a3[v18 >> 1]] << 16);
          v21 = (unsigned __int16)(a10[*(unsigned __int8 *)(result + v18 + v17)] << 8) | (a10[*(unsigned __int8 *)(result + (v18 | 1) + v17)] << 24) | v19 & 0xFF00FFFF | (a11[a3[v18 >> 1]] << 16);
          v22 = 2 * v18;
          *(int *)((char *)a4 + v22) = v20;
          *(int *)((char *)v15 + v22) = v21;
          v18 += 2;
        }
        while ((uint64_t)v18 < a7 - 1);
      }
      result += v13;
      a2 += v14;
      a3 += v14;
      v11 += 2;
      a4 += v16;
      v15 += v16;
    }
    while (v11 < v12);
  }
  return result;
}

uint64_t MPEG4VideoDecoder_CreateInstance(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;

  VTVideoDecoderGetClassID();
  v4 = CMDerivedObjectCreate();
  FigSignalErrorAt3();
  *a3 = 0;
  return v4;
}

uint64_t MPEG4VideoDecoder_Finalize()
{
  uint64_t DerivedStorage;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = (_QWORD *)DerivedStorage;
  v2 = (_QWORD *)(DerivedStorage + 16);
  if (*(_QWORD *)(DerivedStorage + 16))
  {
    KillInstanceGlobalsDeco((uint64_t *)(DerivedStorage + 16));
    *v2 = 0;
  }
  *v1 = 0;
  result = FigFormatDescriptionRelease();
  v1[1] = 0;
  return result;
}

__CFString *MPEG4VideoDecoder_CopyDebugDescription(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<MPEG4VideoDecoder %p>"), a1);
  return Mutable;
}

uint64_t MPEG4VideoDecoder_StartSession(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  const opaqueCMFormatDescription *v4;
  CMVideoDimensions Dimensions;
  const opaqueCMFormatDescription *v6;
  uint64_t *v7;
  CMVideoDimensions v8;
  uint64_t inited;
  const __CFDictionary *Extension;
  const __CFDictionary *v11;
  CFTypeID TypeID;
  const __CFData *Value;
  const __CFData *ValueAtIndex;
  CFTypeID v15;
  CFTypeID v16;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  const UInt8 *v24;
  unsigned int v25;
  CFDataRef v26;
  CFIndex v27;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v29;
  CFMutableArrayRef v30;
  __CFArray *v31;
  CFNumberRef v32;
  CFNumberRef v33;
  int v34;
  int v35;
  signed int v36;
  uint64_t v37;
  unsigned int *v38;
  __CFArray *v39;
  unint64_t v41;
  unsigned __int8 *v42;
  int v43;
  unsigned __int8 *v44;
  uint64_t v45;
  unsigned int v46;
  unint64_t v47;
  unsigned __int8 *v48;
  unsigned __int8 *v49;
  unsigned __int8 *v50;
  unsigned __int8 *v51;
  int v52;
  unsigned __int8 *v53;
  int v54;
  CFDataRef Copy;
  int valuePtr;
  __int128 v57;
  CFTypeRef cf[2];
  uint64_t v59;
  unsigned __int8 *v60;

  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  valuePtr = 846624121;
  *(_QWORD *)DerivedStorage = a2;
  FigFormatDescriptionRelease();
  v4 = (const opaqueCMFormatDescription *)FigFormatDescriptionRetain();
  *(_QWORD *)(DerivedStorage + 8) = v4;
  Dimensions = CMVideoFormatDescriptionGetDimensions(v4);
  *(_WORD *)(DerivedStorage + 24) = 1;
  *(_BYTE *)(DerivedStorage + 26) = 0;
  v6 = *(const opaqueCMFormatDescription **)(DerivedStorage + 8);
  v7 = (uint64_t *)(DerivedStorage + 16);
  v8 = CMVideoFormatDescriptionGetDimensions(v6);
  inited = InitInstanceGlobalsDecoGenenral((uint64_t *)(DerivedStorage + 16), LOWORD(v8.width), LOWORD(v8.height), DerivedStorage + 24);
  if ((_DWORD)inited)
    return inited;
  v59 = 0;
  v57 = 0u;
  *(_OWORD *)cf = 0u;
  Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(v6, (CFStringRef)*MEMORY[0x24BDC0B80]);
  if (Extension)
  {
    v11 = Extension;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v11))
    {
      Value = (const __CFData *)CFDictionaryGetValue(v11, CFSTR("esds"));
      if (Value)
      {
        ValueAtIndex = Value;
        v15 = CFArrayGetTypeID();
        if (v15 != CFGetTypeID(ValueAtIndex)
          || (ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(ValueAtIndex, 1)) != 0)
        {
          v16 = CFDataGetTypeID();
          if (v16 == CFGetTypeID(ValueAtIndex))
          {
            BytePtr = CFDataGetBytePtr(ValueAtIndex);
            Length = CFDataGetLength(ValueAtIndex);
            if (Length < 0x7FFFFFFF && BytePtr && Length > 4)
            {
              v19 = (Length - 4);
              v20 = -1;
              if (v19 < 2 || BytePtr[4] != 3)
                goto LABEL_19;
              v21 = 0;
              v22 = 0;
              v23 = (unint64_t)&BytePtr[v19 + 4];
              while (1)
              {
                v24 = &BytePtr[v21];
                v25 = BytePtr[v21 + 5] & 0x7F | (v22 << 7);
                if ((BytePtr[v21 + 5] & 0x80) == 0)
                  break;
                if ((_DWORD)v21 != 3)
                {
                  ++v21;
                  v22 = v25;
                  if ((unint64_t)(v24 + 6) < v23)
                    continue;
                }
                goto LABEL_19;
              }
              v41 = (unint64_t)&v24[v25 + 6];
              if (v41 > v23)
                goto LABEL_52;
              if (v25 < 2)
                goto LABEL_52;
              LOWORD(v57) = _byteswap_ushort(*(_WORD *)&BytePtr[v21 + 6]);
              if (v25 == 2)
                goto LABEL_52;
              v42 = (unsigned __int8 *)&BytePtr[v21 + 9];
              BYTE2(v57) = BytePtr[v21 + 8];
              v60 = v42;
              if (SBYTE2(v57) < 0)
              {
                if (v25 < 5)
                  goto LABEL_52;
                v42 = (unsigned __int8 *)&BytePtr[v21 + 11];
                v60 = v42;
              }
              if ((BYTE2(v57) & 0x40) != 0)
              {
                if ((unint64_t)(v42 + 1) > v41)
                  goto LABEL_52;
                v43 = *v42;
                if (*v42)
                {
                  v44 = v42 + 2;
                  v42 += (v43 - 1) + 2;
                  while ((unint64_t)v44 <= v41)
                  {
                    ++v44;
                    if (!--v43)
                      goto LABEL_64;
                  }
                  goto LABEL_52;
                }
                ++v42;
LABEL_64:
                v60 = v42;
              }
              if ((BYTE2(v57) & 0x20) != 0)
              {
                v42 += 2;
                if ((unint64_t)v42 > v41)
                  goto LABEL_52;
                v60 = v42;
              }
              if (*v42 == 4)
              {
                v60 = v42 + 1;
                if ((unint64_t)(v42 + 1) < v41)
                {
                  v45 = 0;
                  v46 = 0;
                  v20 = -1;
                  while (1)
                  {
                    v46 = v42[v45 + 1] & 0x7F | (v46 << 7);
                    v47 = (unint64_t)&v42[v45 + 2];
                    if ((v42[v45 + 1] & 0x80) == 0)
                      break;
                    if ((_DWORD)v45 != 3)
                    {
                      ++v45;
                      if (v47 < v41)
                        continue;
                    }
                    goto LABEL_19;
                  }
                  v60 = &v42[v45 + 2];
                  if (v47 + v46 <= v41)
                  {
                    if (v46)
                    {
                      v48 = (unsigned __int8 *)v41;
                      BYTE8(v57) = v42[v45 + 2];
                      v60 = &v42[v45 + 3];
                      if (v46 != 1)
                      {
                        BYTE9(v57) = v42[v45 + 3];
                        v60 = &v42[v45 + 4];
                        if (v46 >= 5)
                        {
                          v49 = &v42[v45];
                          v50 = &v42[v45 + 7];
                          HIDWORD(v57) = (v42[v45 + 4] << 16) | (v42[v45 + 5] << 8) | v42[v45 + 6];
                          v60 = v50;
                          if (v46 >= 9)
                          {
                            v51 = &v42[v45];
                            BYTE3(cf[0]) = *v50;
                            BYTE2(cf[0]) = v51[8];
                            BYTE1(cf[0]) = v51[9];
                            LOBYTE(cf[0]) = v51[10];
                            if (v46 >= 0xD)
                            {
                              HIBYTE(cf[0]) = v49[11];
                              BYTE6(cf[0]) = v51[12];
                              BYTE5(cf[0]) = v51[13];
                              BYTE4(cf[0]) = v51[14];
                              v60 = v51 + 15;
                              v52 = unpack_DecoderSpecificInfo((const unsigned __int8 **)&v60, (const __CFData **)&cf[1], v48);
                              v53 = v48;
                              v20 = v52;
                              if (v52)
                                goto LABEL_19;
                              v54 = unpack_SLConfigDescriptor((const unsigned __int8 **)&v60, &v59, v53);
                              v20 = v54;
                              if (v54)
                                goto LABEL_19;
                              Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)cf[1]);
                              if (Copy)
                              {
                                v26 = Copy;
                                v20 = 0;
                                goto LABEL_22;
                              }
                              goto LABEL_18;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_52:
              v20 = -1;
              goto LABEL_19;
            }
          }
        }
      }
    }
  }
LABEL_18:
  v20 = FigSignalErrorAt3();
LABEL_19:
  if (v20 == -1)
    v20 = FigSignalErrorAt3();
  v26 = 0;
LABEL_22:
  if (cf[1])
    CFRelease(cf[1]);
  if (v20)
  {
    if (v26)
      CFRelease(v26);
LABEL_29:
    inited = FigSignalErrorAt3();
    if ((_DWORD)inited)
      return inited;
LABEL_30:
    if (*(_DWORD *)(DerivedStorage + 32))
      valuePtr = 1630697081;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v29 = Mutable;
      v30 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      if (v30)
      {
        v31 = v30;
        v32 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        if (v32)
        {
          v33 = v32;
          CFArrayAppendValue(v31, v32);
          CFRelease(v33);
          CFDictionaryAddValue(v29, (const void *)*MEMORY[0x24BDC56B8], v31);
          CFRelease(v31);
          addNumberToDictionary(v29, (const __CFString *)*MEMORY[0x24BDC5708], Dimensions.width);
          addNumberToDictionary(v29, (const __CFString *)*MEMORY[0x24BDC5650], Dimensions.height);
          v34 = -Dimensions.width;
          v35 = -Dimensions.height & 0xF;
          if ((v34 & 0xF) != 0)
            addNumberToDictionary(v29, (const __CFString *)*MEMORY[0x24BDC5628], v34 & 0xF);
          if (v35)
            addNumberToDictionary(v29, (const __CFString *)*MEMORY[0x24BDC5610], v35);
          VTDecoderSessionSetPixelBufferAttributes();
          CFRelease(v29);
          return 0;
        }
        CFRelease(v29);
        v39 = v31;
      }
      else
      {
        v39 = v29;
      }
      CFRelease(v39);
    }
    return 4294954392;
  }
  v27 = CFDataGetLength(v26);
  if (v27 >= 0x80000000)
    goto LABEL_29;
  v36 = v27;
  v37 = *v7;
  v38 = (unsigned int *)CFDataGetBytePtr(v26);
  inited = MPEG4DMPR_ReadHeaders(v37, v38, v36);
  if (v26)
    CFRelease(v26);
  if (!(_DWORD)inited)
  {
    RequestGammaLevel(*v7, 2.0, 2.0);
    S_BuildNewGammaTables(*v7);
    goto LABEL_30;
  }
  return inited;
}

uint64_t MPEG4VideoDecoder_DecodeFrame(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  uint64_t DerivedStorage;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  OpaqueCMBlockBuffer *v7;
  __CVPixelBufferPool *PixelBufferPool;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *BaseAddress;
  int BytesPerRow;
  CVPixelBufferRef pixelBufferOut;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;

  VTVideoDecoderGetCMBaseObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  DataLength = CMBlockBufferGetDataLength(DataBuffer);
  dataPointerOut = 0;
  blockBufferOut = 0;
  pixelBufferOut = 0;
  if (CMBlockBufferIsRangeContiguous(DataBuffer, 0, 0))
  {
    v7 = (OpaqueCMBlockBuffer *)CFRetain(DataBuffer);
    blockBufferOut = v7;
  }
  else
  {
    v10 = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x24BDBD240], DataBuffer, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, DataLength, 0, &blockBufferOut);
    if ((_DWORD)v10)
      goto LABEL_7;
    v7 = blockBufferOut;
  }
  CMBlockBufferGetDataPointer(v7, 0, 0, 0, &dataPointerOut);
  PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool();
  v9 = CVPixelBufferPoolCreatePixelBuffer(0, PixelBufferPool, &pixelBufferOut);
  if ((_DWORD)v9)
  {
    v10 = v9;
LABEL_5:
    FigSignalErrorAt3();
    goto LABEL_7;
  }
  ++*(_DWORD *)(DerivedStorage + 36);
  if (!(DataLength >> 31))
  {
    v12 = MPEG4DMPR_Decompress(*(_QWORD *)(DerivedStorage + 16), (unsigned int *)dataPointerOut, DataLength);
    if ((_DWORD)v12)
    {
      v10 = v12;
      goto LABEL_5;
    }
    v13 = CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    if ((_DWORD)v13)
    {
      v10 = v13;
      goto LABEL_5;
    }
    v14 = *(_QWORD *)(DerivedStorage + 16);
    BaseAddress = (int *)CVPixelBufferGetBaseAddress(pixelBufferOut);
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    MPEG4DecoPullDecodedFrame(v14, BaseAddress, BytesPerRow);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x24BDC5470], (CFTypeRef)*MEMORY[0x24BDC5478], kCVAttachmentMode_ShouldPropagate);
    goto LABEL_19;
  }
  v10 = FigSignalErrorAt3();
  if (!(_DWORD)v10)
LABEL_19:
    v10 = 0;
LABEL_7:
  VTDecoderSessionEmitDecodedFrame();
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  CVPixelBufferRelease(pixelBufferOut);
  return v10;
}

uint64_t unpack_header(const unsigned __int8 **a1, int a2, const unsigned __int8 **a3)
{
  uint64_t v3;
  unsigned int v4;
  const unsigned __int8 *v5;
  unint64_t v6;
  __int16 v7;
  const unsigned __int8 *v8;
  unsigned int v9;
  const unsigned __int8 *v10;

  if (**a1 == a2)
  {
    v3 = 0;
    v4 = 0;
    v5 = *a1 + 1;
    *a1 = v5;
    v6 = (unint64_t)*a3;
    while (1)
    {
      v7 = -1;
      if ((_DWORD)v3 == 4)
        break;
      v8 = &v5[v3];
      if ((unint64_t)&v5[v3] >= v6)
        break;
      v9 = *v8 & 0x7F | (v4 << 7);
      *a1 = v8 + 1;
      ++v3;
      v4 = v9;
      if ((*(char *)v8 & 0x80000000) == 0)
      {
        v10 = &v5[v9 + v3];
        if (v10 > *a3)
          return -1;
        v7 = 0;
        *a3 = v10;
        return v7;
      }
    }
  }
  else
  {
    return -1;
  }
  return v7;
}

uint64_t unpack_SLConfigDescriptor(const unsigned __int8 **a1, _BYTE *a2, unsigned __int8 *a3)
{
  int v5;
  unsigned __int8 *v7;

  v7 = a3;
  v5 = unpack_header(a1, 6, (const unsigned __int8 **)&v7);
  if (!v5)
  {
    if (*a1 + 1 <= v7)
    {
      LOWORD(v5) = 0;
      *a2 = *(*a1)++;
    }
    else
    {
      LOWORD(v5) = -1;
    }
  }
  return (__int16)v5;
}

uint64_t unpack_DecoderSpecificInfo(const unsigned __int8 **a1, const __CFData **a2, unsigned __int8 *a3)
{
  uint64_t result;
  int64_t v6;
  UInt8 *v7;
  UInt8 *v8;
  unsigned __int8 *v9;

  v9 = a3;
  result = unpack_header(a1, 5, (const unsigned __int8 **)&v9);
  if (!(_DWORD)result)
  {
    v6 = v9 - *a1;
    v7 = (UInt8 *)malloc_type_malloc(v6, 0x5D80458FuLL);
    if (v7)
    {
      v8 = v7;
      memcpy(v7, *a1, v6);
      *a1 += v6;
      *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, v6);
      free(v8);
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void addNumberToDictionary(__CFDictionary *a1, const __CFString *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void *MEM_New(int a1)
{
  return malloc_type_malloc(a1, 0xE99A9061uLL);
}

void *MEM_NewClear(int a1)
{
  size_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = malloc_type_malloc(a1, 0xE99A9061uLL);
  v3 = v2;
  if (v2)
    bzero(v2, v1);
  return v3;
}

uint64_t MEM_Dispose(void *a1)
{
  free(a1);
  return 0;
}

_QWORD *DeblockFrameFast(_QWORD *result, const void ***a2)
{
  _BYTE *v3;
  void ***v4;
  const void **v5;

  if (a2)
  {
    v3 = result;
    v4 = (void ***)result[8];
    if (*((_DWORD *)result + 135) >= 4u)
    {
      v5 = *a2;
      if (*((_DWORD *)result + 136) > *(_DWORD *)(result[2] + 4) / 0x14u)
      {
        S_DeblockPlaneFastSmart((uint64_t)result, v5, *v4, 0);
        S_DeblockPlaneFastSmart((uint64_t)v3, a2[1], v4[1], 4);
        return S_DeblockPlaneFastSmart((uint64_t)v3, a2[2], v4[2], 5);
      }
      S_DeblockPlaneFast(result, (uint64_t)v5);
      S_DeblockPlaneFast(v3, (uint64_t)a2[1]);
      S_DeblockPlaneFast(v3, (uint64_t)a2[2]);
    }
    return CopyFrame(a2, v4);
  }
  return result;
}

void *S_DeblockPlaneFastSmart(uint64_t a1, const void **a2, void **a3, int a4)
{
  unint64_t v4;
  uint64_t *v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  unsigned int i;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v38;
  unint64_t v39;
  void **v40;
  const void **v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  unint64_t v49;

  v4 = *((unsigned __int16 *)a2 + 9);
  v49 = *((unsigned __int16 *)a2 + 12);
  if (a4 == 4)
  {
    v5 = (uint64_t *)(a1 + 560);
  }
  else
  {
    if (!a4)
    {
      v5 = (uint64_t *)(a1 + 552);
      v6 = 2 * **(unsigned __int16 **)(a1 + 16);
      goto LABEL_7;
    }
    v5 = (uint64_t *)(a1 + 568);
  }
  v6 = **(unsigned __int16 **)(a1 + 16);
LABEL_7:
  if (v4 >= 9)
  {
    v7 = 0;
    v8 = *((unsigned __int16 *)a2 + 8);
    v9 = *v5;
    v38 = ((v8 - 9) >> 3) + 2;
    v10 = 8 * *((unsigned __int16 *)a2 + 12);
    v11 = 8 * (v49 >> 2);
    v12 = 4 * ((unint64_t)*((unsigned __int16 *)a2 + 12) >> 2) + v10;
    v13 = v10 + 8;
    v14 = v12 + 8;
    v15 = 8;
    v40 = a3;
    v41 = a2;
    v39 = *((unsigned __int16 *)a2 + 9);
    v48 = v8;
    v47 = *v5;
    v16 = *(_DWORD *)(a1 + 540);
    do
    {
      v17 = (char *)*a2;
      v18 = (char *)*a2 + v15 * v49;
      v19 = (char *)*a3;
      v20 = (char *)*a3 + v7;
      v21 = (char *)*a2 + v7;
      v22 = -2;
      do
      {
        v23 = *(_QWORD *)&v21[v12];
        *(_QWORD *)&v20[v10] = *(_QWORD *)&v21[v10];
        *(_QWORD *)&v20[v12] = v23;
        v20 += v11;
        v21 += v11;
        v22 += 2;
      }
      while (v22 < 6);
      v24 = v6 + 1;
      if (v8 >= 9)
      {
        v42 = v15;
        v43 = v14;
        v44 = v13;
        v45 = v7;
        v46 = v6;
        v25 = 0;
        v26 = &v17[v13];
        v27 = &v17[v14];
        v28 = &v19[v13];
        v29 = &v19[v14];
        for (i = 8; i < v8; i += 8)
        {
          v18 += 8;
          if (*(_BYTE *)(v9 + v24))
          {
            v31 = -2;
            v32 = v25;
            do
            {
              v33 = *(_QWORD *)&v29[v32];
              *(_QWORD *)&v26[v32] = *(_QWORD *)&v28[v32];
              *(_QWORD *)&v27[v32] = v33;
              v32 += v11;
              v31 += 2;
            }
            while (v31 < 6);
          }
          else
          {
            S_DeblockEdge(v18, v49, 1u, v16);
            S_DeblockEdge(v18, 1u, v49, v16);
            v9 = v47;
            v8 = v48;
            v34 = -2;
            v35 = v25;
            do
            {
              v36 = *(_QWORD *)&v27[v35];
              *(_QWORD *)&v28[v35] = *(_QWORD *)&v26[v35];
              *(_QWORD *)&v29[v35] = v36;
              v35 += v11;
              v34 += 2;
            }
            while (v34 < 6);
          }
          ++v24;
          v25 += 8;
        }
        v24 = v38 + v46;
        a3 = v40;
        a2 = v41;
        v4 = v39;
        v13 = v44;
        v7 = v45;
        v12 = 4 * (v49 >> 2) + 8 * v49;
        v10 = 8 * v49;
        v15 = v42;
        v14 = v43;
      }
      v15 += 8;
      v7 += v10;
      v13 += v10;
      v14 += v10;
      v6 = v24;
    }
    while (v15 < v4);
  }
  return memmove(*a3, *a2, 8 * v49);
}

_BYTE *S_DeblockPlaneFast(_BYTE *result, uint64_t a2)
{
  unint64_t v2;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t i;
  _BYTE *v10;

  v2 = *(unsigned __int16 *)(a2 + 18);
  if (v2 >= 9)
  {
    v4 = *(unsigned __int16 *)(a2 + 24);
    v5 = *((_DWORD *)result + 135);
    v6 = *(unsigned __int16 *)(a2 + 16);
    v7 = 8;
    v8 = 8 * *(unsigned __int16 *)(a2 + 24);
    do
    {
      if (v6 >= 9)
      {
        for (i = 8; i < v6; i += 8)
        {
          v10 = (_BYTE *)(*(_QWORD *)a2 + v8 + i);
          S_DeblockEdge(v10, v4, 1u, v5);
          result = S_DeblockEdge(v10, 1u, v4, v5);
        }
      }
      v7 += 8;
      v8 += 8 * v4;
    }
    while (v7 < v2);
  }
  return result;
}

uint64_t nMbsToPostFilter(uint64_t a1)
{
  uint64_t result;
  int v3;

  if (*(_DWORD *)(a1 + 540) < 4u)
    return 0;
  result = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 4);
  if (*(_DWORD *)(a1 + 544) > result / 0x14)
  {
    if (*(_BYTE *)(a1 + 943))
      v3 = *(_DWORD *)(a1 + 544);
    else
      v3 = 0;
    return (result - v3);
  }
  return result;
}

void DeringFrameFast(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  unsigned int v3;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  _QWORD *v18;
  int v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  int v23;
  unsigned __int8 v24;
  uint64_t i;
  unsigned int v26;
  unsigned __int8 v27;
  unsigned int v28;
  BOOL v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 *v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t j;
  unsigned int v37;
  unsigned __int8 v38;
  int v39;
  unsigned int v40;
  unsigned __int8 *v41;
  unsigned __int8 v42;
  uint64_t k;
  unsigned int v44;
  unsigned __int8 v45;
  _QWORD *v46;
  unsigned int v47;
  unsigned __int8 v48;
  uint64_t v49;
  unsigned int v50;
  signed int v51;
  int v52;
  int v53;
  unsigned int v54;
  int v55;
  unsigned int v56;
  int v57;
  int v58;
  int v59;
  _BYTE v60[6];
  unsigned __int8 v61;
  unsigned __int8 v62;
  unsigned __int8 v63;
  unsigned __int8 v64;
  char v65;
  char v66;

  v2 = *a1;
  v3 = *(unsigned __int16 *)(*a1 + 18);
  if (v3 >= 0x11)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(unsigned __int16 *)(v2 + 24);
    v50 = *(unsigned __int16 *)(v2 + 16);
    v51 = v3 - 16;
    do
    {
      v52 = v8;
      v53 = v6;
      if (v50 >= 0x11)
      {
        v10 = 0;
        v11 = v8 - 1;
        v59 = v6 - 1;
        v12 = v8 | 7;
        do
        {
          v13 = 0;
          v14 = 0;
          LOBYTE(v15) = 0;
          v16 = v10 - 1;
          v17 = v10 | 7;
          do
          {
            switch((int)v13)
            {
              case 0:
                v18 = (_QWORD *)*a1;
                v19 = v11 * *(unsigned __int16 *)(*a1 + 24);
                goto LABEL_11;
              case 1:
                v18 = (_QWORD *)*a1;
                v21 = v11 * *(unsigned __int16 *)(*a1 + 24);
                goto LABEL_13;
              case 2:
                v18 = (_QWORD *)*a1;
                v19 = v12 * *(unsigned __int16 *)(*a1 + 24);
LABEL_11:
                v21 = v10 - 1;
                goto LABEL_14;
              case 3:
                v18 = (_QWORD *)*a1;
                v21 = v12 * *(unsigned __int16 *)(*a1 + 24);
LABEL_13:
                v19 = v10 | 7;
LABEL_14:
                v20 = (unsigned __int8 *)(*v18 + (v19 + v21));
                break;
              default:
                v20 = 0;
                break;
            }
            v22 = 0;
            LOBYTE(v23) = *v20;
            v24 = *v20;
            do
            {
              for (i = 0; i != 10; ++i)
              {
                v26 = v20[i];
                v27 = v24;
                if (v26 < v24)
                  v27 = v20[i];
                if (v26 > v23)
                {
                  v23 = v20[i];
                }
                else
                {
                  v24 = v27;
                  v23 = v23;
                }
              }
              ++v22;
              v20 += v9;
            }
            while (v22 != 10);
            v60[v13] = v23 - v24;
            v28 = (v23 - v24);
            *(&v61 + v13) = (v23 + v24 + 1) >> 1;
            v29 = v28 > v15;
            if (v28 <= v15)
              v15 = v15;
            else
              v15 = (v23 - v24);
            if (v29)
              v14 = v13;
            ++v13;
          }
          while (v13 != 4);
          v30 = 0;
          v34 = a1[1];
          v31 = *(unsigned __int16 *)(v34 + 24);
          v55 = v7 - 1;
          v32 = (v7 - 1 + v59 * v31);
          v33 = (unsigned __int8 *)(*(_QWORD *)v34 + v32);
          LOBYTE(v34) = *v33;
          v35 = *v33;
          do
          {
            for (j = 0; j != 10; ++j)
            {
              v37 = v33[j];
              v38 = v35;
              if (v37 < v35)
                v38 = v33[j];
              if (v37 > v34)
              {
                LODWORD(v34) = v33[j];
              }
              else
              {
                v35 = v38;
                LODWORD(v34) = v34;
              }
            }
            ++v30;
            v33 += v31;
          }
          while (v30 != 10);
          v39 = 0;
          v40 = v34 + v35 + 1;
          v65 = v40 >> 1;
          v60[4] = v34 - v35;
          v41 = (unsigned __int8 *)(*(_QWORD *)a1[2] + v32);
          LOBYTE(v32) = *v41;
          v42 = *v41;
          do
          {
            for (k = 0; k != 10; ++k)
            {
              v44 = v41[k];
              v45 = v42;
              if (v44 < v42)
                v45 = v41[k];
              if (v44 > v32)
              {
                LODWORD(v32) = v41[k];
              }
              else
              {
                v42 = v45;
                LODWORD(v32) = v32;
              }
            }
            ++v39;
            v41 += v31;
          }
          while (v39 != 10);
          v66 = (v32 + v42 + 1) >> 1;
          v60[5] = v32 - v42;
          v46 = (_QWORD *)*a1;
          v47 = *(unsigned __int16 *)(*a1 + 24);
          v57 = v10;
          v58 = v7;
          v54 = v40;
          v56 = (v32 + v42 + 1) >> 1;
          if (v15 > 0xF)
          {
            if (v15 >= 0x40)
            {
              v48 = *(&v61 + v14);
              if (v60[0] <= 0x1Fu)
                v61 = v48;
              if (v60[1] <= 0x1Fu)
                v62 = v48;
              if (v60[2] <= 0x1Fu)
                v63 = v48;
              if (v60[3] <= 0x1Fu)
                v64 = v48;
            }
            DeringBlock((uint8x8_t *)(*v46 + v16 + v11 * v47), v47, a2[2], v61);
            DeringBlock((uint8x8_t *)(*(_QWORD *)*a1 + v17 + v11 * *(unsigned __int16 *)(*a1 + 24)), v47, a2[6], v62);
            DeringBlock((uint8x8_t *)(*(_QWORD *)*a1 + v16 + v12 * *(unsigned __int16 *)(*a1 + 24)), v47, a2[10], v63);
            DeringBlock((uint8x8_t *)(*(_QWORD *)*a1 + v17 + v12 * *(unsigned __int16 *)(*a1 + 24)), v47, a2[14], v64);
          }
          else
          {
            DeringBlockAll((unsigned __int8 *)(*v46 + v16 + v11 * v47), v47, a2[2]);
            DeringBlockAll((unsigned __int8 *)(*(_QWORD *)*a1 + v17 + v11 * *(unsigned __int16 *)(*a1 + 24)), v47, a2[6]);
            DeringBlockAll((unsigned __int8 *)(*(_QWORD *)*a1 + v16 + v12 * *(unsigned __int16 *)(*a1 + 24)), v47, a2[10]);
            DeringBlockAll((unsigned __int8 *)(*(_QWORD *)*a1 + v17 + v12 * *(unsigned __int16 *)(*a1 + 24)), v47, a2[14]);
          }
          v49 = a1[1];
          v9 = *(unsigned __int16 *)(v49 + 24);
          DeringBlock((uint8x8_t *)(*(_QWORD *)v49 + v55 + v59 * v9), v9, a2[18], (v54 >> 1));
          DeringBlock((uint8x8_t *)(*(_QWORD *)a1[2] + v55 + v59 * *(unsigned __int16 *)(a1[2] + 24)), v9, a2[22], v56);
          a2 += 24;
          v10 = v57 + 16;
          v7 = v58 + 8;
        }
        while (v57 + 16 < (int)(v50 - 16));
      }
      v8 = v52 + 16;
      v6 = v53 + 8;
    }
    while (v52 + 16 < v51);
  }
}

unsigned __int8 *FindMinMax2D(unsigned __int8 *result, unsigned __int8 *a2, unsigned __int8 *a3, int a4, int a5, unsigned int a6)
{
  unsigned __int8 v6;
  int v7;
  unsigned __int8 v8;
  uint64_t i;
  unsigned int v10;
  unsigned __int8 v11;

  v6 = *result;
  if (a5)
  {
    v7 = 0;
    v8 = *result;
    do
    {
      if (a4)
      {
        for (i = 0; i != a4; ++i)
        {
          v10 = result[i];
          v11 = v8;
          if (v10 < v8)
            v11 = result[i];
          if (v10 > v6)
            v6 = result[i];
          else
            v8 = v11;
        }
      }
      ++v7;
      result += a6;
    }
    while (v7 != a5);
  }
  else
  {
    v8 = *result;
  }
  *a2 = v8;
  *a3 = v6;
  return result;
}

double DeringBlockAll(unsigned __int8 *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  int v4;
  int v5;
  signed int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  double *v16;
  double result;
  _BYTE v18[64];
  uint64_t v19;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3 >> 1;
  v7 = -(a3 >> 1);
  v8 = 2 * a2;
  v9 = a2;
  do
  {
    v10 = 0;
    ++v5;
    v11 = v4;
    v12 = &v18[v4];
    do
    {
      v13 = a1[v9 + 1 + v10];
      v14 = (a1[(v3 + v10)]
           + 4 * v13
           + a1[(v3 + v10 + 2)]
           + a1[(v8 + v10)]
           + a1[(v8 + v10 + 2)]
           + 2
           * (a1[v9 + v10]
            + a1[(v3 + v10 + 1)]
            + a1[v9 + 2 + v10]
            + a1[(v8 + v10 + 1)])
           + 8) >> 4;
      if ((int)(v14 - v13) <= v6)
      {
        if ((int)(v14 - v13) < v7)
          LOBYTE(v14) = v13 - v6;
      }
      else
      {
        LOBYTE(v14) = v13 + v6;
      }
      v12[v10++] = v14;
    }
    while (v10 != 8);
    v8 += a2;
    v3 += a2;
    v9 += a2;
    v4 = v11 + 8;
  }
  while (v5 != 8);
  v15 = 0;
  v16 = (double *)&a1[a2 + 1];
  do
  {
    result = *(double *)&v18[v15];
    *v16 = result;
    v16 = (double *)((char *)v16 + a2);
    v15 += 8;
  }
  while ((_DWORD)v15 != 64);
  return result;
}

double DeringBlock(uint8x8_t *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint16x8_t v7;
  uint32x4_t v8;
  uint32x4_t v9;
  uint32x4_t v10;
  unsigned __int8 *v11;
  BOOL *v12;
  BOOL v13;
  uint8x8_t v14;
  uint16x8_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint16x8_t v19;
  BOOL v20;
  BOOL v21;
  signed int v22;
  int v23;
  _BYTE *v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  _BYTE *v29;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  double *v34;
  double result;
  _BYTE v36[64];
  int8x8_t v37;
  BOOL v38;
  BOOL v39;
  _BYTE v40[102];

  v4 = 0;
  *(_QWORD *)&v40[94] = *MEMORY[0x24BDAC8D0];
  v5 = a1[1].u8[0];
  v6 = a1[1].u8[1];
  v7 = vmovl_u8(*a1);
  v8 = vmovl_u16(*(uint16x4_t *)v7.i8);
  v9 = vmovl_high_u16(v7);
  v10 = (uint32x4_t)vdupq_n_s32(a4);
  v37 = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vcgeq_u32(v8, v10), (int16x8_t)vcgeq_u32(v9, v10))), (int8x8_t)0x101010101010101);
  v38 = v5 >= a4;
  v39 = v6 >= a4;
  v11 = (unsigned __int8 *)a1 + a2;
  v12 = v40;
  do
  {
    v13 = *v11 >= a4;
    v14 = *(uint8x8_t *)(v11 + 1);
    *(uint8x8_t *)&v36[v4] = v14;
    *v12 = v13;
    v15 = vmovl_u8(v14);
    *(int8x8_t *)(v12 + 1) = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vcgeq_u32(vmovl_u16(*(uint16x4_t *)v15.i8), v10), (int16x8_t)vcgeq_u32(vmovl_high_u16(v15), v10))), (int8x8_t)0x101010101010101);
    v12[9] = v11[9] >= a4;
    v11 += a2;
    v12 += 10;
    v4 += 8;
  }
  while ((_DWORD)v4 != 64);
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = vmovl_u8(*(uint8x8_t *)v11);
  v20 = v11[8] >= a4;
  v21 = v11[9] >= a4;
  *(int8x8_t *)v12 = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vcgeq_u32(vmovl_u16(*(uint16x4_t *)v19.i8), v10), (int16x8_t)vcgeq_u32(vmovl_high_u16(v19), v10))), (int8x8_t)0x101010101010101);
  v22 = a3 >> 1;
  v23 = -(a3 >> 1);
  v12[8] = v20;
  v12[9] = v21;
  v24 = &v40[1];
  v25 = 2 * a2;
  v26 = a2;
  do
  {
    v27 = 0;
    ++v17;
    v28 = v18;
    v29 = &v36[v18];
    do
    {
      v30 = v24[v27];
      if (v24[v27 - 11] == v30
        && v24[v27 - 10] == v30
        && v24[v27 - 9] == v30
        && v24[v27 - 1] == v30
        && v24[v27 + 1] == v30
        && v24[v27 + 9] == v30
        && v24[v27 + 10] == v30
        && v24[v27 + 11] == v30)
      {
        v31 = a1->u8[v26 + 1 + v27];
        v32 = (a1->u8[(v16 + v27)]
             + a1->u8[(v16 + v27 + 2)]
             + 4 * v31
             + a1->u8[(v25 + v27)]
             + a1->u8[(v25 + v27 + 2)]
             + 2
             * (a1->u8[v26 + v27]
              + a1->u8[(v16 + v27 + 1)]
              + a1->u8[v26 + 2 + v27]
              + a1->u8[(v25 + v27 + 1)])
             + 8) >> 4;
        if ((int)(v32 - v31) <= v22)
        {
          if ((int)(v32 - v31) < v23)
            LOBYTE(v32) = v31 - v22;
        }
        else
        {
          LOBYTE(v32) = v31 + v22;
        }
        v29[v27] = v32;
      }
      ++v27;
    }
    while (v27 != 8);
    v18 = v28 + 8;
    v26 += a2;
    v24 += 10;
    v25 += a2;
    v16 += a2;
  }
  while (v17 != 8);
  v33 = 0;
  v34 = (double *)((char *)a1 + a2 + 1);
  do
  {
    result = *(double *)&v36[v33];
    *v34 = result;
    v34 = (double *)((char *)v34 + a2);
    v33 += 8;
  }
  while ((_DWORD)v33 != 64);
  return result;
}

void SetPostFilterSemaphoreIntraFast(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  *(_WORD *)(a9 + 4 * (a8 + 6 * (a5 + a7 * a6)) + 2) = a2;
}

void SetPostFilterSemaphoreInterFast(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12)
{
  *(_WORD *)(a12 + 4 * (a10 + 6 * (a5 + a7 * a6)) + 2) = a2;
}

_BYTE *S_DeblockEdge(_BYTE *result, unsigned int a2, unsigned int a3, unsigned int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  char v65;
  char v66;
  char v67;
  char v68;
  _BYTE v69[4];
  int v70;
  uint64_t v71;

  v4 = 0;
  v5 = -4 * (int)a2;
  v63 = -5 * (int)a2;
  v62 = -3 * (int)a2;
  v61 = -2 * (int)a2;
  v6 = -(uint64_t)(int)a2;
  v59 = 4 * a2;
  v56 = 2 * a4;
  v7 = a2;
  v71 = *MEMORY[0x24BDAC8D0];
  v60 = 2 * a2;
  v58 = 3 * a2;
  do
  {
    v8 = result[v63];
    v9 = result[v5];
    v10 = result[v62];
    v11 = result[v61];
    v12 = result[v6];
    v13 = *result;
    v14 = result[v7];
    v15 = result[v60];
    v16 = result[v58];
    v17 = result[v59];
    v18 = v10 - v11;
    v19 = v12 - v13;
    if (byte_219C5B7EB[(int)v9 - v10]
       + byte_219C5B7EB[result[v63] - v9]
       + byte_219C5B7EB[v10 - v11]
       + byte_219C5B7EB[v11 - v12]
       + byte_219C5B7EB[v12 - v13]
       + byte_219C5B7EB[v13 - v14]
       + byte_219C5B7EB[v14 - v15]
       + byte_219C5B7EB[v15 - v16]
       + byte_219C5B7EB[v16 - v17] > 5)
    {
      if ((int)v9 <= v10)
        v37 = result[v62];
      else
        v37 = result[v5];
      if (v11 <= v12)
        v39 = result[v6];
      else
        v39 = result[v61];
      if (v13 <= v14)
        v41 = result[v7];
      else
        v41 = *result;
      if (v15 <= v16)
        v43 = result[v58];
      else
        v43 = result[v60];
      v38 = ((v11 - v12) & ((v11 - v12) >> 31)) + v12;
      v36 = ((v9 - v10) & (((int)v9 - v10) >> 31)) + v10;
      v44 = ((v36 - v38) & ((v36 - v38) >> 31)) + v38;
      v42 = ((v15 - v16) & ((v15 - v16) >> 31)) + v16;
      v40 = ((v13 - v14) & ((v13 - v14) >> 31)) + v14;
      v45 = ((v40 - v42) & ((v40 - v42) >> 31)) + v42;
      if (v37 <= v39)
        v46 = v39;
      else
        v46 = v37;
      if (v41 <= v43)
        v47 = v43;
      else
        v47 = v41;
      v48 = (v44 - v45) & ((v44 - v45) >> 31);
      if (v46 <= v47)
        v46 = v47;
      if (v46 - v45 - v48 < v56)
      {
        v49 = 0;
        v50 = v9 - v8;
        if ((int)v9 - v8 < 0)
          v50 = v8 - v9;
        if ((int)(v50 - a4) >= 0)
          v51 = result[v5];
        else
          v51 = result[v63];
        if (v16 - v17 >= 0)
          v52 = v16 - v17;
        else
          v52 = v17 - v16;
        if ((int)(v52 - a4) >= 0)
          v53 = result[v58];
        else
          v53 = result[v59];
        v65 = result[v5];
        v66 = v10;
        v67 = v11;
        v68 = v12;
        v69[0] = v13;
        v69[1] = v14;
        v69[2] = v15;
        v69[3] = v16;
        v64 = 16843009 * v51;
        v70 = 16843009 * v53;
        v54 = v5;
        do
        {
          v55 = *((unsigned __int8 *)&v64 + v49 + 2) + v51;
          v51 = *((unsigned __int8 *)&v64 + v49 + 4);
          result[v54] = (*((unsigned __int8 *)&v64 + v49 + 1)
                       + *((unsigned __int8 *)&v64 + v49)
                       + 4 * v51
                       + v69[v49 - 1]
                       + v69[v49]
                       + 2 * (v55 + *(&v66 + v49) + *(&v67 + v49))) >> 4;
          v54 += v7;
          ++v49;
        }
        while (v49 != 8);
      }
    }
    else
    {
      v20 = 2 * (v11 - v14) - 5 * v19;
      if (v20 >= 0)
        v21 = 2 * (v11 - v14) - 5 * v19;
      else
        v21 = 5 * v19 - 2 * (v11 - v14);
      v22 = (v21 + 4) >> 3;
      if (v22 < a4)
      {
        v23 = v20 >> 31;
        v24 = 2 * (v13 - v16) - 5 * (v14 - v15);
        v25 = 2 * (v9 - v12) - 5 * v18;
        if (v25 < 0)
          v25 = 5 * v18 - 2 * (v9 - v12);
        v26 = (v25 + 4) >> 3;
        if (v24 < 0)
          v24 = 5 * (v14 - v15) - 2 * (v13 - v16);
        v27 = v24 + 4;
        v28 = v22 - (v27 >> 3) + ((v26 - v22) & ((int)(v26 - v22) >> 31));
        v29 = ((v23 + (v27 >> 3) + (v28 & (v28 >> 31))) ^ v23) - ((v22 + v23) ^ v23);
        if (v29 >= 0)
          v30 = v29;
        else
          v30 = -v29;
        v31 = 5 * v30 + 4;
        if (v19 >= 0)
          v32 = v12 - v13;
        else
          v32 = v13 - v12;
        v33 = (((v32 >> 1) - (v31 >> 3)) & (((v32 >> 1) - (v31 >> 3)) >> 31)) + (v31 >> 3);
        if (v29 >> 31 == v19 >> 31)
          v34 = v33;
        else
          v34 = 0;
        v35 = (v34 + (v29 >> 31)) ^ (v29 >> 31);
        result[v6] = v12 - v35;
        *result = v13 + v35;
      }
    }
    result += a3;
    ++v4;
  }
  while (v4 != 8);
  return result;
}

uint64_t InitIntraPredictor(uint64_t a1, unsigned int a2)
{
  _WORD *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v4 = MEM_NewClear(320);
  *(_QWORD *)a1 = v4;
  if (v4)
  {
    v4[6] = 0;
    v4[76] = 0;
    v5 = (a2 >> 3) + 2;
    v6 = 16;
    while (1)
    {
      *(_QWORD *)(*(_QWORD *)a1 + v6) = MEM_New(2 * v5 + 4);
      if (!*(_QWORD *)(*(_QWORD *)a1 + v6))
        break;
      v6 += 8;
      if (v6 == 56)
      {
        *(_QWORD *)(*(_QWORD *)a1 + 104) = *(_QWORD *)(*(_QWORD *)a1 + 16) + 4;
        *(_QWORD *)(*(_QWORD *)a1 + 112) = *(_QWORD *)(*(_QWORD *)a1 + 104) + 2;
        *(_QWORD *)(*(_QWORD *)a1 + 120) = *(_QWORD *)(*(_QWORD *)a1 + 24) + 4;
        *(_QWORD *)(*(_QWORD *)a1 + 128) = *(_QWORD *)(*(_QWORD *)a1 + 120) + 2;
        *(_QWORD *)(*(_QWORD *)a1 + 56) = *(_QWORD *)(*(_QWORD *)a1 + 24) + 4;
        *(_QWORD *)(*(_QWORD *)a1 + 64) = *(_QWORD *)(*(_QWORD *)a1 + 56) + 2;
        *(_QWORD *)(*(_QWORD *)a1 + 72) = *(_QWORD *)(*(_QWORD *)a1 + 32) + 4;
        *(_QWORD *)(*(_QWORD *)a1 + 80) = *(_QWORD *)(*(_QWORD *)a1 + 72) + 2;
        *(_QWORD *)(*(_QWORD *)a1 + 136) = *(_QWORD *)(*(_QWORD *)a1 + 40) + 4;
        *(_QWORD *)(*(_QWORD *)a1 + 88) = *(_QWORD *)(*(_QWORD *)a1 + 48) + 4;
        *(_QWORD *)(*(_QWORD *)a1 + 144) = *(_QWORD *)(*(_QWORD *)a1 + 40) + 6;
        *(_QWORD *)(*(_QWORD *)a1 + 96) = *(_QWORD *)(*(_QWORD *)a1 + 48) + 6;
        *(_WORD *)(*(_QWORD *)a1 + 152) = 0;
        v7 = 32 * v5 + 64;
        v8 = 160;
        while (1)
        {
          *(_QWORD *)(*(_QWORD *)a1 + v8) = MEM_New(v7);
          if (!*(_QWORD *)(*(_QWORD *)a1 + v8))
            break;
          v8 += 8;
          if (v8 == 184)
          {
            result = 0;
            *(_QWORD *)(*(_QWORD *)a1 + 232) = *(_QWORD *)(*(_QWORD *)a1 + 160) + 64;
            *(_QWORD *)(*(_QWORD *)a1 + 240) = *(_QWORD *)(*(_QWORD *)a1 + 232) + 32;
            *(_QWORD *)(*(_QWORD *)a1 + 248) = *(_QWORD *)(*(_QWORD *)a1 + 168) + 64;
            *(_QWORD *)(*(_QWORD *)a1 + 256) = *(_QWORD *)(*(_QWORD *)a1 + 248) + 32;
            *(_QWORD *)(*(_QWORD *)a1 + 200) = *(_QWORD *)(*(_QWORD *)a1 + 232);
            *(_QWORD *)(*(_QWORD *)a1 + 208) = *(_QWORD *)(*(_QWORD *)a1 + 240);
            *(_QWORD *)(*(_QWORD *)a1 + 184) = *(_QWORD *)(*(_QWORD *)a1 + 248);
            *(_QWORD *)(*(_QWORD *)a1 + 192) = *(_QWORD *)(*(_QWORD *)a1 + 256);
            *(_QWORD *)(*(_QWORD *)a1 + 264) = *(_QWORD *)(*(_QWORD *)a1 + 176) + 64;
            *(_QWORD *)(*(_QWORD *)a1 + 272) = *(_QWORD *)(*(_QWORD *)a1 + 264) + 32;
            *(_QWORD *)(*(_QWORD *)a1 + 216) = *(_QWORD *)(*(_QWORD *)a1 + 264);
            *(_QWORD *)(*(_QWORD *)a1 + 224) = *(_QWORD *)(*(_QWORD *)a1 + 272);
            *(_DWORD *)(*(_QWORD *)a1 + 156) = 0;
            return result;
          }
        }
        return 4294967188;
      }
    }
  }
  return 4294967188;
}

uint64_t KillIntraPredictor(void **a1)
{
  uint64_t i;
  void *v3;
  uint64_t j;
  void *v5;

  if (*a1)
  {
    for (i = 16; i != 56; i += 8)
    {
      v3 = *(void **)((char *)*a1 + i);
      if (v3)
      {
        MEM_Dispose(v3);
        *(_QWORD *)((char *)*a1 + i) = 0;
      }
    }
    for (j = 160; j != 184; j += 8)
    {
      v5 = *(void **)((char *)*a1 + j);
      if (v5)
      {
        MEM_Dispose(v5);
        *(_QWORD *)((char *)*a1 + j) = 0;
      }
    }
    MEM_Dispose(*a1);
    *a1 = 0;
  }
  return 0;
}

uint64_t SetIntraPredictorDefaultDCValue(uint64_t result, char a2)
{
  *(_WORD *)(result + 12) = 4 << a2;
  return result;
}

uint64_t SetIntraPredACMode(uint64_t result, int a2)
{
  *(_DWORD *)(result + 156) = 4 * (a2 != 0);
  return result;
}

uint64_t SetIntraPredictorACDecisionRange(uint64_t result, char a2)
{
  *(_WORD *)(result + 280) = ~(-1 << (a2 - 1));
  return result;
}

uint64_t DetermineIntraPredictionMode(uint64_t a1, int a2, int a3)
{
  int v3;
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v3 = 2 * a2;
  v4 = a3 & 0xFFFFFFFD;
  if ((a3 & 0xFFFFFFFD) != 0)
  {
    v5 = v4 == 1;
    if (v4 == 1)
      v6 = a3 - 1;
    else
      v6 = a3;
    if (!v5)
      v3 -= 2;
  }
  else
  {
    v6 = a3 + 1;
    v3 -= 2;
  }
  v7 = a1 + 8 * v6;
  v8 = *(unsigned __int16 *)(*(_QWORD *)(v7 + 56) + 2 * v3);
  v9 = *(unsigned __int16 *)(*(_QWORD *)(v7 + 104) + 2 * v3);
  v10 = v9 - *(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * a3 + 104) + 4 * a2);
  v11 = v8 - v9;
  if (v10 < 0)
    v10 = -v10;
  if (v11 < 0)
    v11 = -v11;
  if (v11 < v10)
    v12 = 1;
  else
    v12 = 2;
  return v12 | *(_DWORD *)(a1 + 156);
}

uint64_t FindLeftPredictorBlockAndCol(uint64_t result, int a2, int *a3, int *a4)
{
  if ((result & 0xFFFFFFFD) == 0)
  {
    *a3 = result + 1;
LABEL_6:
    a2 -= 2;
    goto LABEL_7;
  }
  if ((result & 0xFFFFFFFD) != 1)
  {
    *a3 = result;
    goto LABEL_6;
  }
  *a3 = result - 1;
LABEL_7:
  *a4 = a2;
  return result;
}

uint64_t DecideACPredictionMode(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return a4 & 3;
}

uint64_t PredictAndUpdate(uint64_t result, __int16 *a2, char a3, int a4, int a5, int a6)
{
  int v6;
  int v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  __int16 *v11;
  int v12;
  __int16 v13;
  int v14;
  int v15;
  int v16;

  v6 = 2 * a4;
  v7 = *a2 * a6;
  if (v7 >= 2047)
    LOWORD(v7) = 2047;
  *(_WORD *)(*(_QWORD *)(result + 8 * a5 + 56) + 2 * v6) = v7;
  if ((a3 & 1) != 0)
  {
    v11 = (__int16 *)(*(_QWORD *)(result + 8 * a5 + 104) + 2 * v6);
  }
  else
  {
    v8 = a5 & 0xFFFFFFFD;
    if ((a5 & 0xFFFFFFFD) != 0)
    {
      v9 = v8 == 1;
      if (v8 == 1)
        v10 = a5 - 1;
      else
        v10 = a5;
      if (!v9)
        v6 -= 2;
    }
    else
    {
      v10 = a5 + 1;
      v6 -= 2;
    }
    v11 = (__int16 *)(*(_QWORD *)(result + 8 * v10 + 56) + 2 * v6);
  }
  v12 = *v11;
  v13 = *a2;
  v14 = (2 * v12 + a6) / (2 * a6);
  v9 = v12 >= 0;
  v15 = (a6 - 2 * v12) / (2 * a6);
  if (v9)
    LOWORD(v16) = v14;
  else
    v16 = -v15;
  *(_WORD *)(result + 282) = v13;
  *a2 = v13 - v16;
  return result;
}

uint64_t CheapyRecon(uint64_t result, _WORD *a2, char a3)
{
  uint64_t v3;
  _WORD *v4;

  *a2 = *(_WORD *)(result + 282);
  if ((a3 & 4) != 0)
  {
    v3 = 0;
    if ((a3 & 1) != 0)
    {
      do
      {
        a2[v3 + 1] = *(_WORD *)(result + 284 + v3 * 2);
        ++v3;
      }
      while (v3 != 7);
    }
    else
    {
      v4 = a2 + 8;
      do
      {
        *v4 = *(_WORD *)(result + 300 + v3 * 2);
        v4 += 8;
        ++v3;
      }
      while (v3 != 7);
    }
  }
  return result;
}

uint64_t ReconAndUpdate(uint64_t result, _WORD *a2, char a3, int a4, int a5, int a6, int a7)
{
  int v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  int v11;
  int v12;
  _QWORD *v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  int v19;
  _WORD *v20;
  uint64_t i;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  __int16 *v33;
  uint64_t j;
  __int16 v35;

  v7 = 2 * a4;
  v8 = result + 8 * a5;
  if ((a3 & 1) != 0)
  {
    v11 = 0;
    v12 = 0;
    v13 = (_QWORD *)(v8 + 104);
  }
  else
  {
    v9 = a5 & 0xFFFFFFFD;
    if ((a5 & 0xFFFFFFFD) != 0)
    {
      v10 = v9 == 1;
      if (v9 == 1)
        v11 = a5 - 1;
      else
        v11 = a5;
      if (!v10)
        v7 -= 2;
    }
    else
    {
      v11 = a5 + 1;
      v7 -= 2;
    }
    v13 = (_QWORD *)(result + 8 * v11 + 56);
    v12 = v7;
  }
  v14 = *(__int16 *)(*v13 + 2 * v7);
  if (v14 < 0)
    v14 = -((a6 - 2 * v14) / (2 * a6));
  else
    LOWORD(v14) = (2 * v14 + a6) / (2 * a6);
  v15 = *a2 + v14;
  *a2 = v15;
  v16 = v15 * a6;
  if (v16 >= 2047)
    v17 = 2047;
  else
    v17 = v16;
  *(_WORD *)(*(_QWORD *)(v8 + 56) + 4 * a4) = v17;
  if ((a3 & 4) != 0)
  {
    if ((a3 & 1) != 0)
    {
      v25 = 0;
      v26 = 2 * a7;
      v27 = *(_QWORD *)(result + 8 * a5 + 232) + 64 * a4 + 18;
      do
      {
        LOWORD(v28) = 0;
        if (a7 && *(_WORD *)(v27 + v25 * 2))
        {
          v29 = *(_WORD *)(v27 + v25 * 2);
          v30 = 2 * v29;
          if (v29 < 0)
            v28 = -((a7 - v30) / v26);
          else
            v28 = (v30 + a7) / v26;
        }
        a2[++v25] += v28;
      }
      while (v25 != 7);
    }
    else
    {
      v18 = *(_QWORD *)(result + 8 * v11 + 184) + 32 * v12;
      v19 = 2 * a7;
      v20 = a2 + 8;
      for (i = 2; i != 16; i += 2)
      {
        LOWORD(v22) = 0;
        if (a7 && *(_WORD *)(v18 + i))
        {
          v23 = *(_WORD *)(v18 + i);
          v24 = 2 * v23;
          if (v23 < 0)
            v22 = -((a7 - v24) / v19);
          else
            v22 = (v24 + a7) / v19;
        }
        *v20 += v22;
        v20 += 8;
      }
    }
  }
  v31 = 0;
  v32 = *(_QWORD *)(result + 8 * a5 + 184) + ((uint64_t)a4 << 6);
  do
  {
    *(_WORD *)(v32 + 18 + v31 * 2) = a2[v31 + 1] * a7;
    ++v31;
  }
  while (v31 != 7);
  v33 = a2 + 8;
  for (j = 2; j != 16; j += 2)
  {
    v35 = *v33;
    v33 += 8;
    *(_WORD *)(v32 + j) = v35 * a7;
  }
  return result;
}

uint64_t UpdateACUp(uint64_t result, uint64_t a2, int a3, int a4, __int16 a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = *(_QWORD *)(result + 8 * a3 + 184) + 2 * a4 + 18;
  do
  {
    *(_WORD *)(v6 + v5) = *(_WORD *)(a2 + 2 + v5) * a5;
    v5 += 2;
  }
  while (v5 != 14);
  return result;
}

uint64_t UpdateACLeft(uint64_t result, uint64_t a2, int a3, int a4, __int16 a5)
{
  uint64_t v5;
  __int16 *v6;
  uint64_t i;
  __int16 v8;

  v5 = *(_QWORD *)(result + 8 * a3 + 184) + 2 * a4;
  v6 = (__int16 *)(a2 + 16);
  for (i = 2; i != 16; i += 2)
  {
    v8 = *v6;
    v6 += 8;
    *(_WORD *)(v5 + i) = v8 * a5;
  }
  return result;
}

uint64_t ResetAtBoundaryTop(uint64_t result, int a2)
{
  uint64_t v2;
  __int16 v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v2 = 0;
  v3 = *(_WORD *)(result + 12);
  v4 = *(_WORD *)(result + 152);
  v5 = *(_QWORD *)(result + 112);
  *(_WORD *)(*(_QWORD *)(result + 104) + 4 * a2) = v3;
  *(_WORD *)(v5 + 4 * a2) = v3;
  v6 = *(_QWORD *)(result + 144);
  *(_WORD *)(*(_QWORD *)(result + 136) + 4 * a2) = v3;
  *(_WORD *)(v6 + 4 * a2) = v3;
  v7 = ((unint64_t)(32 * a2) >> 5 << 6) | 0x12;
  v8 = *(_QWORD *)(result + 272) + v7;
  v9 = *(_QWORD *)(result + 264) + v7;
  v10 = *(_QWORD *)(result + 240) + v7;
  v11 = *(_QWORD *)(result + 232) + v7;
  do
  {
    *(_WORD *)(v11 + v2) = v4;
    *(_WORD *)(v10 + v2) = v4;
    *(_WORD *)(v9 + v2) = v4;
    *(_WORD *)(v8 + v2) = v4;
    v2 += 2;
  }
  while (v2 != 14);
  return result;
}

uint64_t ResetAtBoundaryLeft(uint64_t result, int a2)
{
  __int16 v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;

  v2 = *(_WORD *)(result + 12);
  v3 = *(_WORD *)(result + 152);
  v5 = *(_QWORD *)(result + 96);
  v4 = *(_QWORD *)(result + 104);
  v6 = v4 + 2;
  v8 = *(_QWORD *)(result + 64);
  v7 = *(_QWORD *)(result + 72);
  *(_QWORD *)(result + 72) = v4;
  *(_QWORD *)(result + 80) = v4 + 2;
  v9 = v7 + 2;
  *(_QWORD *)(result + 104) = v7;
  *(_QWORD *)(result + 112) = v7 + 2;
  v10 = *(_QWORD *)(result + 88);
  v11 = *(_QWORD *)(result + 136);
  v12 = *(_QWORD *)(result + 144);
  v13 = 2 * a2 - 2;
  *(_WORD *)(v8 + 2 * v13) = v2;
  *(_WORD *)(v6 + 2 * v13) = v2;
  *(_WORD *)(v11 + 2 * v13) = v2;
  *(_WORD *)(v12 + 2 * v13) = v2;
  *(_WORD *)(v9 + 2 * v13) = v2;
  *(_QWORD *)(result + 88) = v11;
  *(_QWORD *)(result + 96) = v12;
  v14 = *(_QWORD *)(result + 192) + 32 * v13;
  v15 = *(_QWORD *)(result + 208) + 32 * v13;
  v16 = 2;
  *(_QWORD *)(result + 136) = v10;
  *(_QWORD *)(result + 144) = v5;
  *(_WORD *)(v10 + 2 * v13) = v2;
  *(_WORD *)(v5 + 2 * v13) = v2;
  do
  {
    *(_WORD *)(v14 + v16) = v3;
    *(_WORD *)(v15 + v16) = v3;
    v16 += 2;
  }
  while (v16 != 16);
  v17 = *(_QWORD *)(result + 216) + 32 * v13;
  v18 = *(_QWORD *)(result + 224) + 32 * v13;
  for (i = 2; i != 16; i += 2)
  {
    *(_WORD *)(v17 + i) = v3;
    *(_WORD *)(v18 + i) = v3;
  }
  return result;
}

uint64_t ResetAtInterMB(uint64_t result, int a2)
{
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = 0;
  v3 = *(_WORD *)(result + 12);
  do
  {
    *(_WORD *)(*(_QWORD *)(result + 56 + v2) + 4 * a2) = v3;
    v2 += 8;
  }
  while (v2 != 48);
  v4 = 0;
  v5 = *(_WORD *)(result + 152);
  v6 = *(_QWORD *)(result + 184) + ((uint64_t)a2 << 6);
  v7 = *(_QWORD *)(result + 200) + ((uint64_t)a2 << 6);
  v8 = *(_QWORD *)(result + 216) + ((uint64_t)a2 << 6);
  do
  {
    *(_WORD *)(v6 + v4) = v5;
    *(_WORD *)(v7 + v4) = v5;
    *(_WORD *)(v8 + v4) = v5;
    v4 += 2;
  }
  while (v4 != 64);
  *(_DWORD *)(result + 156) = 0;
  return result;
}

uint64_t Set_not_coded(uint64_t result)
{
  *(_BYTE *)(result + 3) |= 0x80u;
  return result;
}

uint64_t Reset_not_coded(uint64_t result)
{
  *(_BYTE *)(result + 3) &= ~0x80u;
  return result;
}

uint64_t Check_not_coded(uint64_t a1)
{
  return *(_BYTE *)(a1 + 3) & 0x80;
}

uint64_t Set_ac_pred_flag(uint64_t result)
{
  *(_BYTE *)(result + 3) |= 0x40u;
  return result;
}

uint64_t Reset_ac_pred_flag(uint64_t result)
{
  *(_BYTE *)(result + 3) &= ~0x40u;
  return result;
}

uint64_t Check_ac_pred_flag(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 3) >> 6) & 1;
}

uint64_t Set_blockIsOpaque(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  char v4;
  int v5;

  v2 = 0;
  v3 = *(unsigned __int8 *)(result + 3);
  v4 = 5;
  do
  {
    v5 = v3 & (-33 >> v4);
    v3 |= 1 << v2;
    if (!*(_BYTE *)(a2 + v2))
      v3 = v5;
    *(_BYTE *)(result + 3) = v3;
    ++v2;
    --v4;
  }
  while (v2 != 6);
  return result;
}

uint64_t Check_blockIsOpaque(uint64_t result, uint64_t a2)
{
  uint64_t i;

  for (i = 0; i != 6; ++i)
    *(_BYTE *)(a2 + i) = (*(unsigned __int8 *)(result + 3) >> i) & 1;
  return result;
}

uint64_t MPEG4DMPR_Decompress(uint64_t a1, unsigned int *a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t **v7;
  uint64_t **v8;
  _BYTE *v9;
  uint64_t v10;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  int v45;
  int v46;
  __int128 v47;

  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 80);
  CBitStreamDeco::SetUp((_QWORD *)v6, a3, a2);
  if (*(_BYTE *)(v4 + 21) != 1)
  {
    if (CBitStreamDeco::FindByteAlignedPattern((CBitStreamDeco *)v6, 1, 0x18u))
      goto LABEL_11;
    v12 = *(_DWORD *)(v6 + 156);
    *(_DWORD *)(v6 + 156) = v12 + 24;
    v13 = *(_DWORD *)(v6 + 4);
    if (v13 > 0x17)
    {
      v14 = v13 - 24;
      v18 = v12 + 32;
      *(_DWORD *)(v6 + 156) = v18;
      if (v13 - 24 < 8)
      {
        *(_DWORD *)(v6 + 4) = v13;
        v19 = (*(_DWORD *)v6 << -(char)v13) & *(_DWORD *)(v6 + 56);
        v20 = *(_DWORD *)(v6 + 160);
        v21 = *(unsigned int *)(v6 + 8);
        if (v18 > v20 || 32 * (int)v21 > v20)
        {
          *(_DWORD *)(v6 + 8) = v21 + 1;
          *(_DWORD *)v6 = 0;
        }
        else
        {
          v30 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v21));
          *(_DWORD *)v6 = v30;
          *(_DWORD *)(v6 + 8) = v21 + 1;
          v19 |= *(_DWORD *)(v6 + 4 * (32 - v13) + 24) & (v30 >> v13);
        }
LABEL_30:
        if (v19 == 176)
        {
          DecHeaderVOS(v6, a1);
          if (CBitStreamDeco::FindByteAlignedPattern((CBitStreamDeco *)v6, 1, 0x18u))
            goto LABEL_11;
          v24 = *(_DWORD *)(v6 + 156);
          *(_DWORD *)(v6 + 156) = v24 + 24;
          v25 = *(_DWORD *)(v6 + 4);
          if (v25 > 0x17)
          {
            v27 = v25 - 24;
            v31 = v24 + 32;
            *(_DWORD *)(v6 + 156) = v31;
            if (v25 - 24 < 8)
            {
              *(_DWORD *)(v6 + 4) = v25;
              v19 = (*(_DWORD *)v6 << -(char)v25) & *(_DWORD *)(v6 + 56);
              v32 = *(_DWORD *)(v6 + 160);
              v33 = *(unsigned int *)(v6 + 8);
              if (v31 > v32 || 32 * (int)v33 > v32)
              {
                *(_DWORD *)(v6 + 8) = v33 + 1;
                *(_DWORD *)v6 = 0;
              }
              else
              {
                v34 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v33));
                *(_DWORD *)v6 = v34;
                *(_DWORD *)(v6 + 8) = v33 + 1;
                v19 |= *(_DWORD *)(v6 + 4 * (32 - v25) + 24) & (v34 >> v25);
              }
              goto LABEL_43;
            }
          }
          else
          {
            v26 = 0;
            v27 = v25 + 8;
            *(_DWORD *)(v6 + 4) = v25 + 8;
            v28 = *(_DWORD *)(v6 + 160);
            v29 = *(unsigned int *)(v6 + 8);
            if (v24 + 24 <= v28 && 32 * (int)v29 <= v28)
              v26 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v29));
            *(_DWORD *)(v6 + 8) = v29 + 1;
            *(_DWORD *)v6 = v26;
            *(_DWORD *)(v6 + 156) = v24 + 32;
          }
          *(_DWORD *)(v6 + 4) = v27 - 8;
          v19 = (*(_DWORD *)v6 >> (v27 - 8)) & *(_DWORD *)(v6 + 56);
        }
LABEL_43:
        if (v19 == 181)
        {
          DecHeaderVO((CBitStreamDeco *)v6, v4);
          v35 = *(_DWORD *)(v6 + 156);
          *(_DWORD *)(v6 + 156) = v35 + 22;
          v36 = *(unsigned int *)(v6 + 4);
          if (v36 >= 0x16)
          {
            v38 = v36 - 22;
            v39 = (*(_DWORD *)v6 >> (v36 - 22)) & *(_DWORD *)(v6 + 112);
          }
          else
          {
            v37 = 22 - v36;
            v38 = v36 + 10;
            *(_DWORD *)(v6 + 4) = v36 + 10;
            v39 = (*(_DWORD *)v6 << (22 - v36)) & *(_DWORD *)(v6 + 112);
            v40 = *(_DWORD *)(v6 + 160);
            v41 = *(unsigned int *)(v6 + 8);
            if (v35 + 22 > v40 || 32 * (int)v41 > v40)
            {
              *(_DWORD *)(v6 + 8) = v41 + 1;
              *(_DWORD *)v6 = 0;
            }
            else
            {
              v42 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v41));
              *(_DWORD *)v6 = v42;
              *(_DWORD *)(v6 + 8) = v41 + 1;
              v39 |= *(_DWORD *)(v6 + 4 * v37 + 24) & (v42 >> v38);
            }
          }
          *(_DWORD *)(v6 + 4) = v38 + 22;
          if (v38 >= 0xB)
          {
            v43 = v38 - 10;
            v44 = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 4) = v43;
            *(_DWORD *)(v6 + 8) = v44 - 1;
            if (*(_DWORD *)(v6 + 160) >= (32 * (v44 - 1)))
              *(_DWORD *)v6 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * (v44 - 2)));
          }
          *(_DWORD *)(v6 + 156) = v35;
          if (v39 == 32)
          {
            *(_BYTE *)(v4 + 21) = 1;
            goto LABEL_11;
          }
          *(_BYTE *)(v4 + 21) = 0;
          if (CBitStreamDeco::FindByteAlignedPattern((CBitStreamDeco *)v6, 1, 0x18u))
            goto LABEL_11;
          CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 0x18u);
          v19 = CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 8u);
        }
        if (v19 <= 0x1F)
        {
          if (CBitStreamDeco::FindByteAlignedPattern((CBitStreamDeco *)v6, 1, 0x18u))
            goto LABEL_11;
          CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 0x18u);
          v19 = CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 8u);
        }
        if ((v19 & 0xFFFFFFF0) == 0x20)
        {
          DecHeaderVOL((CBitStreamDeco *)v6, a1);
          if (CBitStreamDeco::FindByteAlignedPattern((CBitStreamDeco *)v6, 1, 0x18u))
            goto LABEL_11;
          CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 0x18u);
          v19 = CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 8u);
        }
        if (v19 == 179)
        {
          DecHeaderGOV(v6);
          if (CBitStreamDeco::FindByteAlignedPattern((CBitStreamDeco *)v6, 1, 0x18u) == -1999)
            return 0;
          CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 0x18u);
          v19 = CBitStreamDeco::GrabBits((CBitStreamDeco *)v6, 8u);
        }
        if (v19 == 182 && !DecHeaderVOP((CBitStreamDeco *)v6, a1))
        {
          v45 = *(unsigned __int8 *)(a1 + 260);
          *(_BYTE *)(a1 + 261) = v45;
          v46 = *(unsigned __int8 *)(v4 + 148);
          if (v46 != 2)
          {
            *(_BYTE *)(a1 + 260) = *(_BYTE *)(v4 + 154);
            if (v45)
              *(_DWORD *)(a1 + 244) = *(_DWORD *)(a1 + 248);
            *(_DWORD *)(a1 + 248) = *(_DWORD *)(a1 + 240);
            if (v46 == 3 && *(_BYTE *)(v4 + 90) == 2)
              SetGMCWarpingParams(*(unsigned __int8 *)(v4 + 91), *(unsigned __int8 *)(v4 + 92), (int *)(v4 + 100), (int *)(v4 + 116), *(unsigned __int16 *)(v4 + 56), *(unsigned __int16 *)(v4 + 58), (double *)(a1 + 632));
            if (*(_BYTE *)(v4 + 149) != 2)
            {
              v47 = *(_OWORD *)(a1 + 40);
              v8 = *(uint64_t ***)(a1 + 56);
              *(_OWORD *)(a1 + 48) = v47;
              *(_QWORD *)(a1 + 40) = v8;
              if (*(_BYTE *)(v4 + 154) != 1)
              {
                SwapMVrow((uint64_t *)(a1 + 48), (uint64_t *)(a1 + 40));
                v8 = *(uint64_t ***)(a1 + 40);
                v7 = *(uint64_t ***)(a1 + 48);
                *(_DWORD *)(a1 + 544) = *(_DWORD *)(v5 + 4);
                goto LABEL_3;
              }
              v7 = (uint64_t **)v47;
              SideExtendFrame((unint64_t *)v47);
              if (!ReadSomeVideoPackets(v8, v7, a1))
                goto LABEL_3;
            }
          }
        }
LABEL_11:
        v10 = 4294958327;
        goto LABEL_12;
      }
    }
    else
    {
      v14 = v13 + 8;
      *(_DWORD *)(v6 + 4) = v13 + 8;
      v15 = *(_DWORD *)(v6 + 160);
      v16 = *(unsigned int *)(v6 + 8);
      if (v12 + 24 > v15 || 32 * (int)v16 > v15)
        v23 = 0;
      else
        v23 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v16));
      *(_DWORD *)(v6 + 8) = v16 + 1;
      *(_DWORD *)v6 = v23;
      *(_DWORD *)(v6 + 156) = v12 + 32;
    }
    *(_DWORD *)(v6 + 4) = v14 - 8;
    v19 = (*(_DWORD *)v6 >> (v14 - 8)) & *(_DWORD *)(v6 + 56);
    goto LABEL_30;
  }
  DecHeaderVOPshort(v6, v5, v4);
  v7 = 0;
  v8 = 0;
LABEL_3:
  *(_QWORD *)(a1 + 72) = v8;
  v9 = *(_BYTE **)(a1 + 608);
  if (*v9 || v9[1] || *(_BYTE *)(a1 + 942))
  {
    CopyFrame(v8, v7);
    *(_QWORD *)(a1 + 72) = v7;
    if (**(_BYTE **)(a1 + 608))
    {
LABEL_8:
      DeblockFrameFast((_QWORD *)a1, (const void ***)v7);
      goto LABEL_9;
    }
  }
  else
  {
    v7 = v8;
  }
  if (*(_BYTE *)(a1 + 942))
    goto LABEL_8;
LABEL_9:
  v10 = 0;
  *(_BYTE *)(v4 + 149) = *(_BYTE *)(v4 + 148);
LABEL_12:
  CBitStreamDeco::ReleaseBuffer((CBitStreamDeco *)v6);
  return v10;
}

uint64_t CBitStreamDeco::FindByteAlignedPattern(CBitStreamDeco *this, int a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;

  v4 = *((_DWORD *)this + 39);
  v3 = *((_DWORD *)this + 40);
  if (v4 >= v3)
  {
    v12 = 0;
  }
  else
  {
    v5 = a3 - 1;
    v6 = *((_DWORD *)this + 1);
    v7 = (_DWORD *)((char *)this + 4 * a3 + 24);
    do
    {
      v8 = v6 & 0xFFFFFFF8;
      v9 = v4 + a3 + (v6 & 7);
      *((_DWORD *)this + 39) = v9;
      v10 = (v6 & 0xFFFFFFF8) - a3;
      if (v8 >= a3)
      {
        v12 = (*(_DWORD *)this >> v10) & *v7;
      }
      else
      {
        v11 = a3 - v8;
        v10 = 32 - (a3 - v8);
        *((_DWORD *)this + 1) = v10;
        if (a3 - v8 <= 0x1F)
          v12 = (*(_DWORD *)this << v11) & *v7;
        else
          v12 = 0;
        v13 = *((unsigned int *)this + 2);
        if (v9 > v3 || 32 * (int)v13 > v3)
        {
          *((_DWORD *)this + 2) = v13 + 1;
          *(_DWORD *)this = 0;
        }
        else
        {
          v14 = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * v13));
          *(_DWORD *)this = v14;
          *((_DWORD *)this + 2) = v13 + 1;
          v12 |= *((_DWORD *)this + v11 + 6) & (v14 >> v10);
        }
      }
      v6 = v10 + v5;
      *((_DWORD *)this + 1) = v6;
      if (v6 >= 0x21)
      {
        v6 -= 32;
        v15 = *((_DWORD *)this + 2);
        *((_DWORD *)this + 1) = v6;
        *((_DWORD *)this + 2) = v15 - 1;
        if (v3 >= 32 * (v15 - 1))
          *(_DWORD *)this = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * (v15 - 2)));
      }
      v4 = v9 - v5;
      *((_DWORD *)this + 39) = v4;
    }
    while (v4 < v3 && v12 != a2);
  }
  if (v12 != a2)
    return 4294965297;
  v16 = *((_DWORD *)this + 1);
  *((_DWORD *)this + 1) = v16 + 1;
  if ((v16 + 1) >= 0x21)
  {
    v17 = v16 - 31;
    v18 = *((_DWORD *)this + 2);
    *((_DWORD *)this + 1) = v17;
    *((_DWORD *)this + 2) = v18 - 1;
    if (v3 >= 32 * (v18 - 1))
      *(_DWORD *)this = bswap32(*(_DWORD *)(*((_QWORD *)this + 2) + 4 * (v18 - 2)));
  }
  v19 = 0;
  *((_DWORD *)this + 39) = v4 - 1;
  return v19;
}

uint64_t *TripleSwapFrame(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = *a3;
  *a3 = *a2;
  *a2 = *result;
  *result = v3;
  return result;
}

uint64_t ReadSomeVideoPackets(uint64_t **a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;

  v6 = 0;
  v7 = *(_QWORD *)(a3 + 80);
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(a3 + 24);
  *(_DWORD *)(v9 + 172) = 0;
  v10 = (int *)(v9 + 172);
  v11 = *(_DWORD *)(v8 + 4);
  *(_QWORD *)(v9 + 192) = 0xFFFFFFFFLL;
  *(_DWORD *)(a3 + 536) = 0;
  *(_DWORD *)(a3 + 544) = 0;
  if (!*(_BYTE *)(v9 + 147))
  {
    ReadAVideoPacket(v10, *(unsigned __int8 *)(v9 + 143), a1, a2, a3);
    v6 = v12;
    if (!(_DWORD)v12)
    {
      do
      {
        if (*v10 >= v11 || *(_DWORD *)(v7 + 156) >= *(_DWORD *)(v7 + 160))
        {
          v6 = 0;
          goto LABEL_13;
        }
        if (!*(_BYTE *)(v9 + 142))
        {
          v13 = DecHeaderVideoPacket(v7, v9);
          if ((_DWORD)v13)
            break;
          v14 = *(_DWORD *)(v9 + 172);
          v15 = *(_DWORD *)(v9 + 192) + 1;
          if (v14 != v15)
            RecoverMissingVideoPackets(a2, a1, v15, v14, a3);
        }
        ReadAVideoPacket(v10, *(unsigned __int8 *)(v9 + 143), a1, a2, a3);
      }
      while (!(_DWORD)v13);
      v6 = v13;
    }
  }
LABEL_13:
  v16 = *(_DWORD *)(v9 + 192) + 1;
  if (v16 != v11)
    RecoverMissingVideoPackets(a2, a1, v16, v11, a3);
  *(_DWORD *)(a3 + 540) = *(_DWORD *)(a3 + 536) / *(_DWORD *)(*(_QWORD *)(a3 + 16) + 4);
  return v6;
}

uint64_t MPEG4DecoPullDecodedFrame(uint64_t result, int *a2, int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result + 72);
  if (v3)
    return Y420ToY422_2vuy(**(_QWORD **)v3, **(unsigned __int8 ***)(v3 + 8), **(unsigned __int8 ***)(v3 + 16), a2, *(unsigned __int16 *)(*(_QWORD *)v3 + 24), *(_WORD *)(*(_QWORD *)v3 + 18), *(unsigned __int16 *)(*(_QWORD *)v3 + 16), *(unsigned __int16 *)(*(_QWORD *)v3 + 18), a3, *(unsigned __int8 **)(result + 896), *(unsigned __int8 **)(result + 904));
  return result;
}

uint64_t MPEG4DMPR_ReadHeaders(uint64_t a1, unsigned int *a2, signed int a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int ByteAlignedPattern;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  v3 = 4294958327;
  if (!a2 || a3 < 1)
    return v3;
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 80);
  CBitStreamDeco::SetUp((_QWORD *)v6, a3, a2);
  while (1)
  {
    ByteAlignedPattern = CBitStreamDeco::FindByteAlignedPattern((CBitStreamDeco *)v6, 1, 0x18u);
    if (ByteAlignedPattern)
      break;
    v8 = *(_DWORD *)(v6 + 156);
    *(_DWORD *)(v6 + 156) = v8 + 24;
    v9 = *(_DWORD *)(v6 + 4);
    if (v9 > 0x17)
    {
      v10 = v9 - 24;
      v14 = v8 + 32;
      *(_DWORD *)(v6 + 156) = v8 + 32;
      if (v9 - 24 < 8)
      {
        *(_DWORD *)(v6 + 4) = v9;
        v15 = (*(_DWORD *)v6 << -(char)v9) & *(_DWORD *)(v6 + 56);
        v16 = *(_DWORD *)(v6 + 160);
        v17 = *(unsigned int *)(v6 + 8);
        if (v14 > v16 || 32 * (int)v17 > v16)
        {
          *(_DWORD *)(v6 + 8) = v17 + 1;
          *(_DWORD *)v6 = 0;
        }
        else
        {
          v18 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v17));
          *(_DWORD *)v6 = v18;
          *(_DWORD *)(v6 + 8) = v17 + 1;
          v15 |= *(_DWORD *)(v6 + 4 * (32 - v9) + 24) & (v18 >> v9);
        }
        goto LABEL_18;
      }
    }
    else
    {
      v10 = v9 + 8;
      *(_DWORD *)(v6 + 4) = v9 + 8;
      v11 = *(_DWORD *)(v6 + 160);
      v12 = *(unsigned int *)(v6 + 8);
      if (v8 + 24 > v11 || 32 * (int)v12 > v11)
        v19 = 0;
      else
        v19 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v12));
      *(_DWORD *)(v6 + 8) = v12 + 1;
      *(_DWORD *)v6 = v19;
      *(_DWORD *)(v6 + 156) = v8 + 32;
    }
    v20 = v10 - 8;
    *(_DWORD *)(v6 + 4) = v20;
    v15 = (*(_DWORD *)v6 >> v20) & *(_DWORD *)(v6 + 56);
LABEL_18:
    if (v15 == 181)
    {
      if (DecHeaderVO((CBitStreamDeco *)v6, v5))
        goto LABEL_44;
      v21 = *(_DWORD *)(v6 + 156);
      *(_DWORD *)(v6 + 156) = v21 + 22;
      v22 = *(unsigned int *)(v6 + 4);
      if (v22 >= 0x16)
      {
        v24 = v22 - 22;
        v25 = (*(_DWORD *)v6 >> (v22 - 22)) & *(_DWORD *)(v6 + 112);
      }
      else
      {
        v23 = 22 - v22;
        v24 = v22 + 10;
        *(_DWORD *)(v6 + 4) = v22 + 10;
        v25 = (*(_DWORD *)v6 << (22 - v22)) & *(_DWORD *)(v6 + 112);
        v26 = *(_DWORD *)(v6 + 160);
        v27 = *(unsigned int *)(v6 + 8);
        if (v21 + 22 > v26 || 32 * (int)v27 > v26)
        {
          *(_DWORD *)(v6 + 8) = v27 + 1;
          *(_DWORD *)v6 = 0;
        }
        else
        {
          v28 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * v27));
          *(_DWORD *)v6 = v28;
          *(_DWORD *)(v6 + 8) = v27 + 1;
          v25 |= *(_DWORD *)(v6 + 4 * v23 + 24) & (v28 >> v24);
        }
      }
      *(_DWORD *)(v6 + 4) = v24 + 22;
      if (v24 >= 0xB)
      {
        v29 = v24 - 10;
        v30 = *(_DWORD *)(v6 + 8);
        *(_DWORD *)(v6 + 4) = v29;
        *(_DWORD *)(v6 + 8) = v30 - 1;
        if (*(_DWORD *)(v6 + 160) >= (32 * (v30 - 1)))
          *(_DWORD *)v6 = bswap32(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 4 * (v30 - 2)));
      }
      *(_DWORD *)(v6 + 156) = v21;
      if (v25 == 32)
      {
        *(_BYTE *)(v5 + 21) = 1;
        goto LABEL_44;
      }
      *(_BYTE *)(v5 + 21) = 0;
    }
    else if (v15 == 176)
    {
      if (DecHeaderVOS(v6, a1))
        goto LABEL_44;
    }
    else if (v15 >= 0x20)
    {
      if ((v15 & 0xFFFFFFF0) == 0x20)
      {
        if (DecHeaderVOL((CBitStreamDeco *)v6, a1))
          goto LABEL_44;
LABEL_41:
        v3 = 0;
        goto LABEL_45;
      }
      if (v15 == 179 && DecHeaderGOV(v6))
        goto LABEL_44;
    }
  }
  if (ByteAlignedPattern != -1999)
    goto LABEL_41;
LABEL_44:
  v3 = 4294958327;
LABEL_45:
  CBitStreamDeco::ReleaseBuffer((CBitStreamDeco *)v6);
  return v3;
}

uint64_t **RecoverMissingVideoPackets(uint64_t **result, uint64_t **a2, int a3, int a4, uint64_t a5)
{
  unsigned __int16 *v5;
  int v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  int v42;

  v5 = *(unsigned __int16 **)(a5 + 16);
  v6 = *((_DWORD *)v5 + 1);
  if (v6 >= a4 && v6 >= a3)
  {
    v8 = *(_DWORD *)(a5 + 544);
    if (a3 < a4)
    {
      v9 = *(_QWORD *)(a5 + 552);
      v10 = *(_QWORD *)(a5 + 560);
      v11 = v9 + 2 * *v5;
      v12 = v9 + 1 + 2 * *v5;
      v13 = 4 * *v5;
      v14 = (unint64_t)*((unsigned __int16 *)*a2 + 12) >> 2;
      v15 = (unint64_t)*((unsigned __int16 *)a2[1] + 12) >> 2;
      v16 = *(_QWORD *)(a5 + 568);
      v17 = a3;
      v18 = v8 + a4;
      v19 = a4;
      v20 = 8 * v14;
      v21 = 4 * v14;
      v22 = 8 * v15;
      v23 = 4 * v15;
      do
      {
        v24 = **(unsigned __int16 **)(a5 + 16);
        v25 = (int)v17 / v24;
        v26 = (int)v17 % v24;
        v27 = **a2;
        v28 = 16 * (v26 + v25 * *((unsigned __int16 *)*a2 + 12));
        v29 = **result;
        v30 = -2;
        do
        {
          *(_OWORD *)(v27 + v28) = *(_OWORD *)(v29 + v28);
          *(_OWORD *)(v27 + v21 + v28) = *(_OWORD *)(v29 + v21 + v28);
          v28 += v20;
          v30 += 2;
        }
        while (v30 < 0xE);
        v31 = a2[1];
        v32 = *v31;
        v33 = 8 * (v26 + v25 * *((unsigned __int16 *)v31 + 12));
        v34 = *result[1];
        v35 = -2;
        v36 = v33;
        do
        {
          v37 = *(_QWORD *)(v34 + v23 + v36);
          *(_QWORD *)(v32 + v36) = *(_QWORD *)(v34 + v36);
          *(_QWORD *)(v32 + v23 + v36) = v37;
          v36 += v22;
          v35 += 2;
        }
        while (v35 < 6);
        v38 = *a2[2];
        v39 = *result[2];
        v40 = -2;
        do
        {
          v41 = *(_QWORD *)(v39 + v23 + v33);
          *(_QWORD *)(v38 + v33) = *(_QWORD *)(v39 + v33);
          *(_QWORD *)(v38 + v23 + v33) = v41;
          v33 += v22;
          v40 += 2;
        }
        while (v40 < 6);
        v42 = v13 * v25 + 2 * v26;
        *(_BYTE *)(v9 + v42) = 1;
        *(_BYTE *)(v9 + 1 + v42) = 1;
        *(_BYTE *)(v11 + v42) = 1;
        *(_BYTE *)(v12 + v42) = 1;
        *(_BYTE *)(v10 + v17) = 1;
        *(_BYTE *)(v16 + v17++) = 1;
      }
      while (v17 != v19);
      v8 = v18 - a3;
    }
    *(_DWORD *)(a5 + 544) = v8;
  }
  return result;
}

void DecodeMBInter(int a1, int a2, int16x4_t *a3, int16x4_t *a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v15;
  int v16;
  int v17;
  __int16 v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t i;
  int16x4_t *v27;
  unsigned int ChromaVector;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  int v36;
  int v37;
  uint64_t v38;
  char v39;
  int16x4_t *v40;
  int v41;
  int16x4_t *v42;
  int v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  int v48;
  uint64_t v49;
  double v50;
  int v51;
  double v52;
  int v53;
  int v54;
  int v55;
  char v56;
  uint64_t v57;
  uint64_t v59;
  unsigned __int8 *v60;
  char v61;
  unsigned __int8 *v62;
  char v63;
  void (*v64)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, double, int, unsigned __int8 *);
  unsigned int v65;
  int v66;
  unsigned __int8 *v67;
  int16x4_t *v68;
  int v69;
  int v70;
  int16x4_t *v71;
  uint64_t v72;
  unsigned int v73;
  int v74;
  unsigned __int8 v75;
  unsigned __int8 v76;
  __int16 v77;
  __int16 v78;
  __int16 v79[256];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v67 = *(unsigned __int8 **)(a7 + 960);
  v66 = *(unsigned __int8 *)(*(_QWORD *)(a7 + 24) + 155);
  v10 = *(_QWORD *)(a6 + 128);
  v11 = (16 * a1);
  v74 = 16 * a2;
  if (*(_BYTE *)(a7 + 969))
    v12 = Reconstruct_8x8Vec;
  else
    v12 = Reconstruct_8x8;
  v64 = (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, double, int, unsigned __int8 *))v12;
  v65 = *(_DWORD *)(a6 + 64);
  v13 = *(unsigned int *)(a6 + 216);
  v70 = *(_DWORD *)(a6 + 88);
  v73 = *(unsigned __int8 *)(a6 + 246);
  if (a5 == 2 || !*(_BYTE *)(a6 + 246))
  {
    v57 = *(_QWORD *)(a6 + 128);
    v54 = a1;
    v55 = a2;
    v72 = a7;
    v31 = 0;
    LODWORD(v32) = 0;
    v59 = (int)v11;
    if (*(_BYTE *)(a6 + 246))
      v33 = 3;
    else
      v33 = 1;
    v63 = v33;
    v34 = 1;
    if (*(_BYTE *)(a6 + 246))
      v35 = 2;
    else
      v35 = 1;
    v61 = v35;
LABEL_22:
    v36 = 0;
    v56 = v34;
    v69 = v31 | v74;
    v37 = v32;
    v38 = 8 * (int)v32 + 168;
    v39 = 1;
    v32 = (int)v32;
    while (1)
    {
      v40 = a3;
      v41 = a3->i16[v32];
      v42 = a4;
      v43 = a4->i16[v32];
      v44 = v39;
      v76 = v63 & v41;
      v75 = v63 & v43;
      v78 = v41 >> v61;
      v77 = v43 >> v61;
      v45 = v11;
      v46 = v13;
      VerifyMotionVectorBoarder16Pad(v36 | v11, v13, &v78, &v76);
      VerifyMotionVectorBoarder16Pad(v69, v70, &v77, &v75);
      v47 = DecodeBlockInterTexture_8x8(a6, v72, v37, v10);
      if (v48)
        break;
      v64(*(_QWORD *)(a6 + v38 - 152), v65, *(_QWORD *)(a6 + v38) + (v74 + v77) * (int)v46 + v59 + v78, v46, v10, v76, v75, v73, v47, v66, v67);
      v39 = 0;
      ++v32;
      ++v37;
      v38 += 8;
      v36 = 8;
      v11 = v45;
      a4 = v42;
      a3 = v40;
      v13 = v46;
      if ((v44 & 1) == 0)
      {
        v34 = 0;
        v31 = 8;
        if ((v56 & 1) != 0)
          goto LABEL_22;
LABEL_10:
        v23 = v11;
        v24 = *(unsigned int *)(a6 + 232);
        v25 = *(_DWORD *)(a6 + 92);
        if (v73)
        {
          for (i = 0; i != 4; ++i)
          {
            a3->i16[i] = (__int16)(a3->i16[i] + ((unsigned __int16)a3->i16[i] >> 15)) >> 1;
            a4->i16[i] = (__int16)(a4->i16[i] + ((unsigned __int16)a4->i16[i] >> 15)) >> 1;
          }
        }
        v27 = a4;
        ChromaVector = GetChromaVector(a3);
        v29 = GetChromaVector(v27);
        v30 = v29 + v74;
        if ((int)(ChromaVector + v23) > -17)
        {
          if ((int)(ChromaVector + v23) > 2 * (int)v24 - 32)
            ChromaVector = 2 * v24 - v23 - 32;
        }
        else
        {
          ChromaVector = -16 - v23;
        }
        if (v30 > -17)
        {
          if (v30 > 2 * v25 - 32)
            v29 = 2 * v25 - v74 - 32;
        }
        else
        {
          v29 = -16 - v74;
        }
        v76 = ChromaVector & 1;
        v75 = v29 & 1;
        v78 = ChromaVector >> 1;
        v77 = v29 >> 1;
        v49 = *(unsigned int *)(a6 + 80);
        v50 = DecodeBlockInterTexture_8x8(a6, v72, 4, v57);
        if (!v51)
        {
          v64(*(_QWORD *)(a6 + 48), v49, *(_QWORD *)(a6 + 200) + (8 * v55 + v77) * (int)v24 + 8 * v54 + v78, v24, v57, v76, v75, 0, v50, v66, v67);
          v52 = DecodeBlockInterTexture_8x8(a6, v72, 5, v57);
          if (!v53)
            v64(*(_QWORD *)(a6 + 56), v49, *(_QWORD *)(a6 + 208) + (8 * v55 + v77) * (int)v24 + 8 * v54 + (uint64_t)v78, v24, v57, v76, v75, 0, v52, v66, v67);
        }
        return;
      }
    }
  }
  else
  {
    v15 = 0;
    v68 = a3;
    v71 = a4;
    v16 = a3->i16[0];
    v17 = v16 & 3;
    v76 = v16 & 3;
    v18 = a4->i16[0];
    v19 = a4->i16[0] & 3;
    v75 = a4->i16[0] & 3;
    v16 >>= 2;
    v78 = v16;
    v77 = v18 >> 2;
    v20 = v13;
    v21 = 16 * a1;
    v60 = (unsigned __int8 *)(*(_QWORD *)(a6 + 168) + (v74 + (v18 >> 2)) * (int)v13 + (int)v11 + v16);
    v62 = *(unsigned __int8 **)(a6 + 16);
    while (1)
    {
      DecodeBlockInterTexture_8x8(a6, a7, v15, v10);
      if (v22)
        break;
      Feed8x8To16x16(v10, v15++, v79);
      if (v15 == 4)
      {
        v57 = v10;
        v54 = a1;
        v55 = a2;
        v72 = a7;
        Reconstruct_16x16(v62, v65, v60, v20, v79, v17, v19, v73, v66, v67);
        LODWORD(v11) = v21;
        a3 = v68;
        a4 = v71;
        goto LABEL_10;
      }
    }
  }
}

double DecodeBlockInterTexture_8x8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int16x8_t *v7;
  _WORD *v8;
  double result;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 8) + a3))
  {
    v7 = *(int16x8_t **)(a1 + 112);
    v8 = *(_WORD **)(a1 + 120);
    if (!GrabBlockAndIQuantise(a1, a3, 0, a2))
    {
      ScanConvertZigZag2Raster(v7, v8);
      IDct8x8smart((int16x8_t *)a4, v7, *(unsigned __int8 *)(a2 + 969), *(unsigned __int8 *)(a1 + 106), *(unsigned __int8 *)(a1 + 104), *(unsigned __int8 *)(a1 + 105));
    }
  }
  else
  {
    result = 0.0;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

double DecodeMBGMC(int a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  const unsigned __int8 *v21;
  int v22;
  double result;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned __int8 *v35;
  double *v37;
  uint64_t v38;
  int v39;
  unsigned __int8 *v40;
  int v41;
  unsigned __int8 *v42;
  int v43;
  int v44;
  unsigned __int8 *v45;
  int v46;
  unsigned __int8 *v47;
  int v48;
  unsigned int v49;
  unsigned __int8 *v50;
  int v51[2];
  unsigned __int8 v52[256];
  int v53[256];
  int v54[256];
  _OWORD v55[32];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a4 + 24);
  v8 = *(unsigned __int8 *)(v7 + 91);
  v48 = *(unsigned __int8 *)(v7 + 155);
  v50 = *(unsigned __int8 **)(a4 + 960);
  v9 = *(_OWORD **)(a3 + 128);
  v43 = (int)*(double *)(a4 + 632);
  v10 = (int)*(double *)(a4 + 640);
  v39 = *(_BYTE *)(a3 + 246) != 0;
  memset(v55, 0, sizeof(v55));
  v11 = *(_QWORD *)(a4 + 128);
  v12 = *(_QWORD *)(a4 + 152);
  v40 = *(unsigned __int8 **)(a4 + 144);
  v38 = *(_QWORD *)(a4 + 120);
  *(_QWORD *)v51 = 0;
  v35 = *(unsigned __int8 **)(a3 + 16);
  v47 = *(unsigned __int8 **)(a3 + 168);
  v34 = *(_DWORD *)(a3 + 64);
  v46 = *(_DWORD *)(a3 + 216);
  v13 = 16 * a2;
  v44 = *(_DWORD *)(a3 + 88);
  v49 = v8;
  v37 = (double *)(a4 + 632);
  Warp_Y(v8, (16 * a1), 16 * a2, 16, (double *)(a4 + 632), v54, v53);
  GetMVGMC((16 * a1), v13, 16, v43, v10, v54, v53, v39, &v51[1], v51);
  v14 = *(unsigned __int16 *)(*(_QWORD *)(a4 + 24) + 164) >> v39;
  v15 = ((v14 - 1 - v51[1]) & ((v14 - 1 - v51[1]) >> 31)) + v51[1];
  v16 = v15 - ((v15 + v14) & ((v15 + v14) >> 31));
  v17 = ((v14 - 1 - v51[0]) & ((v14 - 1 - v51[0]) >> 31)) + v51[0];
  v18 = v17 - ((v17 + v14) & ((v17 + v14) >> 31));
  v51[0] = v18;
  v51[1] = v16;
  v19 = (4 * ((unint64_t)(2 * a1) >> 1)) | 2;
  *(_WORD *)(v11 + v19) = v16;
  v20 = 4 * a1;
  *(_WORD *)(v11 + v20) = v16;
  *(_WORD *)(v38 + v19) = v16;
  *(_WORD *)(v38 + v20) = v16;
  *(_WORD *)(v12 + v19) = v18;
  *(_WORD *)(v12 + v20) = v18;
  *(_WORD *)&v40[v19] = v18;
  *(_WORD *)&v40[v20] = v18;
  InterpolateWarpedPix((uint64_t)v47, v46, v44, 16, v48, v43, v10, v54, v53, v52);
  if (*(_BYTE *)(*(_QWORD *)(a4 + 24) + 176))
  {
    v9[6] = 0u;
    v9[7] = 0u;
    v9[4] = 0u;
    v9[5] = 0u;
    v9[2] = 0u;
    v9[3] = 0u;
    *v9 = 0u;
    v9[1] = 0u;
    v21 = v50;
LABEL_6:
    AddResidueTo_16x16((uint64_t)v55, v52, v35, v34, v21);
    v25 = *(_DWORD *)(a3 + 92);
    v45 = *(unsigned __int8 **)(a3 + 48);
    v26 = *(_QWORD *)(a3 + 200);
    v41 = *(_DWORD *)(a3 + 80);
    v27 = *(_DWORD *)(a3 + 232);
    Warp_C(v49, (8 * a1), 8 * a2, 8, v37, v54, v53);
    InterpolateWarpedPix(v26, v27, v25, 8, v48, v43, v10, v54, v53, v52);
    if (*(_BYTE *)(*(_QWORD *)(a4 + 24) + 176)
      || (result = DecodeBlockInterTexture_8x8(a3, a4, 4, (uint64_t)v9), !v32))
    {
      AddResidueTo_8x8((uint64_t)v9, v52, v45, v41, v50);
      v42 = *(unsigned __int8 **)(a3 + 56);
      v28 = v25;
      v29 = *(_QWORD *)(a3 + 208);
      v30 = *(_DWORD *)(a3 + 84);
      v31 = *(_DWORD *)(a3 + 236);
      Warp_C(v49, (8 * a1), 8 * a2, 8, v37, v54, v53);
      InterpolateWarpedPix(v29, v31, v28, 8, v48, v43, v10, v54, v53, v52);
      if (*(_BYTE *)(*(_QWORD *)(a4 + 24) + 176)
        || (result = DecodeBlockInterTexture_8x8(a3, a4, 5, (uint64_t)v9), !v33))
      {
        AddResidueTo_8x8((uint64_t)v9, v52, v42, v30, v50);
      }
    }
  }
  else
  {
    v22 = 0;
    v21 = v50;
    while (1)
    {
      result = DecodeBlockInterTexture_8x8(a3, a4, v22, (uint64_t)v9);
      if (v24)
        break;
      Feed8x8To16x16((uint64_t)v9, v22++, (__int16 *)v55);
      if (v22 == 4)
        goto LABEL_6;
    }
  }
  return result;
}

void ReadAVideoPacket(_DWORD *a1, int a2, uint64_t **a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned __int16 *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 *v17;
  int v18;
  uint64_t v19;
  __int16 *v20;
  _BYTE *v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  char v25;
  int v26;
  int v27;
  int v29;
  __int16 v30;
  _DWORD *v31;
  uint64_t v32;
  __int16 *v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  int v40;
  unsigned int v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  unsigned int v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  int v52;
  unsigned __int16 *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t v60;
  int v61;
  unint64_t v62;
  unint64_t v63;
  int v64;
  BOOL v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  unsigned __int8 *v70;
  uint64_t v71;
  int v72;
  int v73;
  unsigned __int8 v74;
  uint64_t v75;
  unsigned int v76;
  int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  int v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE *v87;
  char v88;
  int v89;
  char v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _WORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  int v105;
  int v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  unsigned int v110;
  int v111;
  int v112;
  unsigned int v113;
  uint64_t v114;
  unsigned int v115;
  int v116;
  _QWORD **v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  int v125;
  int ChromaVector;
  int v127;
  int v128;
  int v129;
  uint64_t v130;
  int v131;
  int v132;
  unsigned int v133;
  int v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  unsigned int v140;
  int v141;
  uint64_t v142;
  int v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  uint64_t v151;
  int v152;
  int v153;
  int v154;
  unsigned int v155;
  int v156;
  unsigned int v157;
  int v158;
  int v159;
  unsigned int v160;
  uint64_t v161;
  unsigned int v163;
  char v164;
  int v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  int v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unsigned int v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unsigned int v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  int v198;
  unsigned int v199;
  unsigned int v200;
  int v201;
  int v202;
  int v203;
  unsigned int v204;
  int v205;
  unsigned int v206;
  int v207;
  int v208;
  unsigned int v209;
  uint64_t v210;
  uint64_t v211;
  int v212;
  unsigned int v213;
  int v214;
  int v215;
  int v216;
  unsigned int v217;
  int v218;
  unsigned int v219;
  int v220;
  int v221;
  unsigned int v222;
  uint64_t v223;
  unsigned int v224;
  int v225;
  unsigned int v226;
  unsigned int v227;
  unsigned int v228;
  unsigned int v229;
  int v230;
  _BOOL4 v231;
  unsigned int v232;
  uint64_t v233;
  unsigned int v234;
  int v235;
  uint64_t *v236;
  int v237;
  uint64_t v238;
  uint64_t *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  unint64_t v255;
  uint64_t v256;
  unsigned int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  int v262;
  uint64_t v263;
  unint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  unsigned int v270;
  unsigned int v271;
  unsigned int v272;
  int v273;
  unsigned int v274;
  char v275;
  unsigned int v276;
  uint64_t v277;
  unsigned int v278;
  int v279;
  uint64_t v280;
  uint64x2_t v281;
  int64x2_t v282;
  uint64_t v283;
  unsigned int v284;
  int v285;
  unsigned int v286;
  int v287;
  int v288;
  unsigned int v289;
  uint64_t v290;
  unsigned int v292;
  uint64_t v293;
  unsigned int v294;
  uint64_t v295;
  uint64_t v296;
  int64x2_t v297;
  uint64_t v298;
  uint64_t v299;
  int v300;
  char v301;
  int v302;
  uint64_t **v303;
  uint64_t v304;
  __int16 *v305;
  uint64x2_t v306;
  int64x2_t v307;
  __int16 *v308;
  unsigned int v309;
  _BYTE *v310;
  int v311;
  uint64_t v312;
  int v313;
  unsigned int v314;
  int v315;
  unsigned int v316;
  int v317;
  int v318;
  unsigned int v319;
  uint64_t v320;
  unsigned int v321;
  uint64_t v322;
  int64x2_t v323;
  uint64_t v324;
  int v325;
  char v326;
  int v327;
  int v328;
  int v330;
  __int16 v331;
  uint64_t v332;
  __int16 *v333;
  uint64_t v334;
  int v335;
  int v336;
  uint64_t v337;
  uint64_t **v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  int v343;
  int v344;
  uint64_t v345;
  int v346;
  uint64_t v347;
  unsigned __int8 *v348;
  __int16 *v349;
  unsigned __int8 *v350;
  int v351;
  __int16 dc_scaler;
  uint64_t v353;
  unsigned int v354;
  int64x2_t v355;
  uint64_t v356;
  int v357;
  int v358;
  int *v359;
  char v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  __int16 v364;
  int v365;
  int v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  unsigned int v370;
  uint64_t v371;
  uint64_t *v372;
  uint64_t v373;
  uint64_t v374;
  unsigned int v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  unsigned int v379;
  uint64_t v380;
  uint64_t v381;
  unsigned int v382;
  int64x2_t v383;
  uint64_t v384;
  uint64_t v385;
  int v386;
  char v387;
  uint64_t v388;
  uint64_t v389;
  char v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  int v395;
  unsigned __int8 *v396;
  char v397;
  int v398;
  unint64_t v399;
  int64x2_t v400;
  uint64_t v401;
  unint64_t v402;
  uint64x2_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  int v407;
  int v408[2];
  char v409;
  int v410;
  int v411[2];
  unsigned __int8 *v412;
  int v413;
  unsigned __int8 *v414;
  int v415;
  int v416;
  int v417[2];
  int v418[2];
  unsigned __int8 *v419;
  uint64_t v420;
  unsigned __int8 *v421;
  unsigned __int8 *v422;
  uint64_t v423;
  uint64_t v424;
  BOOL v425;
  uint64_t v426;
  uint64_t *v427;
  uint64_t v428;
  int v429;
  uint64_t *v430;
  uint64_t v431;
  int v432;
  uint64_t *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t *v436;
  int v437;
  int v438;
  int v439;
  int v440;
  int v441;
  uint64_t v442;
  uint64_t v443;
  int v444;
  int v445;
  uint64_t v446;
  uint64_t *v447;
  int v448;
  uint64_t *v449;
  int v450;
  unsigned int v451;
  int v452[2];
  unsigned int v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  int v460[2];
  int v461[2];
  int v462;
  uint64_t v463;
  int v464;
  int v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  unsigned int v469;
  signed int v470;
  int v471;
  int64x2_t v472;
  uint64_t v473;
  unint64_t v474;
  unsigned __int8 v475;
  uint64_t v476;
  _QWORD *v478;
  uint64_t **v479;
  uint64_t **v480;
  unint64_t v481;
  int v482;
  uint64x2_t v483;
  uint64_t v484;
  uint64_t v485;
  int v486;
  int64x2_t v487;
  uint64_t v488;
  uint64_t v489;
  int v490;
  uint64x2_t v491;
  uint64_t v492;
  _DWORD *v493;
  _DWORD *v494;
  uint64_t v495;
  uint64_t v496;
  int v497;
  unsigned int v498;
  uint64_t v499;
  unsigned __int8 *v500;
  __int16 v501;
  unsigned __int8 *v502;
  unsigned __int8 *v503;
  unsigned __int8 *v504;
  unint64_t v505;
  uint64_t v506;
  CIntraDcDecoder *v508;
  int v509;
  int v510;
  int v511;
  unsigned __int8 v512[4];
  char v513;
  char v514;
  unsigned __int8 v515[4];
  unsigned int v516;
  int16x4_t *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  __int128 v524;
  uint64_t *v525;
  int v526;
  int v527;
  int v528;
  int v529;
  BOOL v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  int32x4_t v535;
  int v536;
  int v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  uint64_t v542;
  BOOL v543;
  int16x4_t v544;
  int16x4_t v545;
  int16x4_t v546[16];
  int16x4_t v547[10];

  v547[8] = *(int16x4_t *)MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a5 + 24);
  v6 = *(unsigned __int8 *)(v5 + 148);
  if (v6 == 2)
    return;
  v7 = a5;
  v8 = a4;
  v9 = a1;
  if (a2)
  {
    v10 = *(_QWORD *)(a5 + 576);
    v11 = *(_QWORD *)(a5 + 80);
    v508 = *(CIntraDcDecoder **)(a5 + 88);
    v485 = *(unsigned __int8 *)(v5 + 158);
    v12 = *a1;
    v13 = *(unsigned __int16 **)(a5 + 16);
    v14 = *v13;
    v489 = *((int *)v13 + 1);
    v497 = *(unsigned __int16 *)(v5 + 160);
    v505 = *((unsigned __int16 *)*a3 + 12);
    v15 = *a1 / v14;
    if (v6 == 1)
    {
      v443 = *(_QWORD *)(a5 + 552);
      v446 = *(_QWORD *)(a5 + 568);
      v457 = *(_QWORD *)(a5 + 584);
      *(_QWORD *)v460 = *((unsigned __int16 *)a3[1] + 12);
      *(_QWORD *)v452 = v13[1];
      v454 = *(_QWORD *)(a5 + 560);
      v495 = *(_QWORD *)(a5 + 576);
      v448 = *(_DWORD *)(a5 + 544);
      v450 = *(_DWORD *)(a5 + 536);
      v67 = 0;
      v68 = a4[1];
      v69 = v12 % v14;
      v70 = *(unsigned __int8 **)(*a4 + 8);
      v71 = a4[2];
      v502 = &v70[*(unsigned int *)(*a4 + 28)];
      v421 = *(unsigned __int8 **)(v68 + 8);
      v412 = (unsigned __int8 *)(*(_QWORD *)(v71 + 8) + *(unsigned int *)(v71 + 28));
      v414 = *(unsigned __int8 **)(v71 + 8);
      v72 = *(unsigned __int16 *)(*a4 + 24);
      v433 = (uint64_t *)(a5 + 152);
      v436 = (uint64_t *)(a5 + 128);
      v427 = (uint64_t *)(a5 + 136);
      v430 = (uint64_t *)(a5 + 112);
      v416 = *(unsigned __int16 *)(v68 + 24);
      v419 = &v421[*(unsigned int *)(v68 + 28)];
      v73 = 1;
      v440 = v12 / v14;
      v470 = v12 / v14;
      v74 = 1;
      v474 = *v13;
      while (1)
      {
        v481 = v67;
        v462 = v73;
        v515[0] = 0;
        v468 = v69;
        v75 = 2 * v69;
        do
        {
          v76 = *(_DWORD *)(v11 + 156) + 1;
          *(_DWORD *)(v11 + 156) = v76;
          v77 = *(_DWORD *)(v11 + 4);
          if (v77)
          {
            v78 = *(_DWORD *)v11;
            v79 = v77 - 1;
            *(_DWORD *)(v11 + 4) = v79;
            if (((v78 >> v79) & 1) != 0)
              goto LABEL_64;
          }
          else
          {
            *(_DWORD *)(v11 + 4) = 31;
            v80 = *(_DWORD *)(v11 + 160);
            v81 = *(unsigned int *)(v11 + 8);
            if (v76 > v80 || 32 * (int)v81 > v80)
            {
              *(_DWORD *)v11 = 0;
              *(_DWORD *)(v11 + 8) = v81 + 1;
            }
            else
            {
              v83 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v81));
              *(_DWORD *)v11 = v83;
              *(_DWORD *)(v11 + 8) = v81 + 1;
              if (v83 < 0)
              {
LABEL_64:
                v98 = v495 + 20 * v481;
                *(_BYTE *)(v98 + 3) |= 0x80u;
                *(_BYTE *)(v98 + 2) = 0;
                v99 = *(_QWORD *)(v7 + 128);
                v100 = (2 * (int)v75) | 2;
                *(_WORD *)(v99 + v100) = 0;
                *(_WORD *)(v99 + 2 * v75) = 0;
                v101 = *(_QWORD *)(v7 + 120);
                *(_WORD *)(v101 + v100) = 0;
                *(_WORD *)(v101 + 2 * v75) = 0;
                v102 = *(_QWORD *)(v7 + 152);
                *(_WORD *)(v102 + v100) = 0;
                *(_WORD *)(v102 + 2 * v75) = 0;
                v103 = *(_QWORD *)(v7 + 144);
                *(_WORD *)(v103 + v100) = 0;
                v97 = (_WORD *)(v103 + 2 * v75);
LABEL_65:
                *v97 = 0;
                v104 = v474;
                v105 = v468;
                goto LABEL_66;
              }
            }
          }
          if (DecMcpbcPVop(v515, v512, *(unsigned __int8 *)(v5 + 148), *(unsigned __int8 *)(v5 + 90), (CBitStreamDeco *)v11))goto LABEL_368;
          v84 = v515[0];
        }
        while (v515[0] == 5);
        v85 = 0;
        v86 = v495 + 20 * v481;
        v88 = *(_BYTE *)(v86 + 3);
        v87 = (_BYTE *)(v86 + 3);
        v89 = v88 & 0x7F;
        *v87 = v89;
        *(v87 - 1) = v84;
        v90 = 5;
        do
        {
          v91 = v89 & (-33 >> v90);
          v89 |= 1 << v85;
          if (!v512[v85])
            v89 = v91;
          *v87 = v89;
          ++v85;
          --v90;
        }
        while (v85 != 6);
        if ((v84 - 3) < 2u)
        {
          v92 = *(_QWORD *)(v7 + 128);
          v93 = (2 * (int)v75) | 2;
          *(_WORD *)(v92 + v93) = 0;
          *(_WORD *)(v92 + 2 * (int)v75) = 0;
          v94 = *(_QWORD *)(v7 + 120);
          *(_WORD *)(v94 + v93) = 0;
          *(_WORD *)(v94 + 2 * (int)v75) = 0;
          v95 = *(_QWORD *)(v7 + 152);
          *(_WORD *)(v95 + v93) = 0;
          *(_WORD *)(v95 + 2 * (int)v75) = 0;
          v96 = *(_QWORD *)(v7 + 144);
          *(_WORD *)(v96 + v93) = 0;
          v97 = (_WORD *)(v96 + 2 * (int)v75);
          goto LABEL_65;
        }
        DecMotionVectors(&v545, &v544, *(_QWORD *)(v7 + 120), *(_QWORD *)(v7 + 128), *(_QWORD *)(v7 + 112), *(_QWORD *)(v7 + 144), *(_QWORD *)(v7 + 152), *(_QWORD *)(v7 + 136), v468, v470, v474, v84, v74, v481 < v474, *(_QWORD *)(v7 + 24), v11, v481);
        if (v116)
          goto LABEL_368;
        v465 = v12;
        v117 = (_QWORD **)v8;
        v424 = v7;
        v493 = v9;
        v118 = 0;
        LODWORD(v119) = 0;
        v404 = 8 * v468;
        v401 = 8 * v470;
        v120 = 1;
        v121 = 16 * v470;
        do
        {
          v122 = 0;
          v409 = v120;
          v123 = v118 | v121;
          v124 = (v118 | v121) * v505;
          v119 = (int)v119;
          v125 = 2;
          do
          {
            if (MC_8x8((unsigned __int8 *)(**a3 + v124 + 16 * v468 + v122), v505, (unsigned __int8 *)(**v117+ v72 * (uint64_t)(v123 + (v544.i16[v119] >> 1))+ 16 * v468+ (v545.i16[v119] >> 1)+ v122), v72, v545.i16[v119] & 1, v544.i16[v119] & 1, *(unsigned __int8 *)(v5 + 155), v70, v502))goto LABEL_367;
            ++v119;
            v122 = 8;
            --v125;
          }
          while (v125);
          v120 = 0;
          v118 = 8;
          v121 = 16 * v470;
        }
        while ((v409 & 1) != 0);
        ChromaVector = GetChromaVector(&v545);
        v127 = GetChromaVector(&v544);
        v128 = ChromaVector & 1;
        v398 = ChromaVector;
        v129 = ChromaVector >> 1;
        v130 = v401 * *(_QWORD *)v460 + v404;
        v131 = v401 + (v127 >> 1);
        v410 = v128;
        v407 = v127 & 1;
        if (MC_8x8((unsigned __int8 *)(*a3[1] + v130), v460[0], (unsigned __int8 *)(*v117[1] + v416 * (uint64_t)v131 + v404 + v129), v416, v128, v407, *(unsigned __int8 *)(v5 + 155), v421, v419))break;
        v132 = MC_8x8((unsigned __int8 *)(*a3[2] + v130), v460[0], (unsigned __int8 *)(*v117[2] + v416 * (uint64_t)v131 + v404 + ((uint64_t)v398 >> 1)), v416, v410, v407, *(unsigned __int8 *)(v5 + 155), v414, v412);
        v9 = v493;
        v7 = v424;
        v8 = v117;
        v12 = v465;
        v104 = v474;
        v105 = v468;
        if (v132)
          goto LABEL_368;
LABEL_66:
        v69 = v105 + 1;
        if (v69 >= v104)
        {
          ++v470;
          SwapMVrow(v436, v430);
          SwapMVrow(v433, v427);
          v69 = 0;
        }
        v106 = *(_DWORD *)(v11 + 156);
        v107 = v106 + 17;
        *(_DWORD *)(v11 + 156) = v106 + 17;
        v108 = *(unsigned int *)(v11 + 4);
        if (v108 >= 0x11)
        {
          v110 = v108 - 17;
          v111 = *(_DWORD *)(v11 + 92);
          v115 = *(_DWORD *)v11;
          v112 = (*(_DWORD *)v11 >> v110) & v111;
        }
        else
        {
          v109 = 17 - v108;
          v110 = v108 + 15;
          *(_DWORD *)(v11 + 4) = v108 + 15;
          v111 = *(_DWORD *)(v11 + 92);
          v112 = (*(_DWORD *)v11 << v109) & v111;
          v113 = *(_DWORD *)(v11 + 160);
          v114 = *(unsigned int *)(v11 + 8);
          if (v107 > v113 || 32 * (int)v114 > v113)
          {
            v115 = 0;
            *(_DWORD *)(v11 + 8) = v114 + 1;
            *(_DWORD *)v11 = 0;
          }
          else
          {
            v115 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v114));
            *(_DWORD *)v11 = v115;
            *(_DWORD *)(v11 + 8) = v114 + 1;
            v112 |= *(_DWORD *)(v11 + 4 * v109 + 24) & (v115 >> v110);
          }
        }
        v133 = v110 + 17;
        *(_DWORD *)(v11 + 4) = v110 + 17;
        if (v110 >= 0x10)
        {
          v133 = v110 - 15;
          v134 = *(_DWORD *)(v11 + 8);
          *(_DWORD *)(v11 + 4) = v133;
          *(_DWORD *)(v11 + 8) = v134 - 1;
          if (*(_DWORD *)(v11 + 160) >= (32 * (v134 - 1)))
          {
            v115 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * (v134 - 2)));
            *(_DWORD *)v11 = v115;
          }
        }
        v67 = v481 + 1;
        *(_DWORD *)(v11 + 156) = v106;
        if (v112 != 126977 && v67 < v489)
        {
          v74 = 0;
          v73 = v462 + 1;
          if (v470 < *(unsigned __int16 *)(*(_QWORD *)(v7 + 16) + 2))
            continue;
        }
        if ((int)v489 <= (int)v481)
          goto LABEL_368;
        v437 = v481 + 1;
        *(_DWORD *)(v11 + 156) = v107;
        v135 = v133 - 17;
        if (v133 >= 0x11)
        {
          *(_DWORD *)(v11 + 4) = v135;
          v136 = (v115 >> v135) & v111;
          v139 = v495;
        }
        else
        {
          *(_DWORD *)(v11 + 4) = v133 + 15;
          v136 = (v115 << (17 - v133)) & v111;
          v137 = *(_DWORD *)(v11 + 160);
          v138 = *(unsigned int *)(v11 + 8);
          v139 = v495;
          if (v107 > v137 || 32 * (int)v138 > v137)
          {
            *(_DWORD *)(v11 + 8) = v138 + 1;
            *(_DWORD *)v11 = 0;
          }
          else
          {
            v140 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v138));
            *(_DWORD *)v11 = v140;
            *(_DWORD *)(v11 + 8) = v138 + 1;
            v136 |= *(_DWORD *)(v11 + 4 * (17 - v133) + 24) & (v140 >> (v133 + 15));
          }
        }
        if (v136 != 126977)
          goto LABEL_368;
        v465 = v12;
        v479 = (uint64_t **)v8;
        v423 = v7;
        v493 = v9;
        v304 = 0;
        v305 = (__int16 *)(v139 + 4);
        v306 = (uint64x2_t)vdupq_n_s64(6uLL);
        v307 = vdupq_n_s64(2uLL);
        v483 = v306;
        v472 = v307;
LABEL_271:
        v308 = (__int16 *)(v139 + 20 * v304);
        v311 = *((char *)v308 + 3);
        v310 = (char *)v308 + 3;
        LOBYTE(v309) = *((_BYTE *)v308 + 3);
        *v308 = v497;
        if ((v311 & 0x80000000) == 0)
        {
          v309 = v309;
          v312 = v139 + 20 * v304;
          v313 = *(unsigned __int8 *)(v312 + 2);
          v503 = (unsigned __int8 *)(v312 + 2);
          if ((*(_BYTE *)(v312 + 2) - 3) <= 1u)
          {
            v314 = *(_DWORD *)(v11 + 156) + 1;
            *(_DWORD *)(v11 + 156) = v314;
            v315 = *(_DWORD *)(v11 + 4);
            if (v315)
            {
              v316 = *(_DWORD *)v11;
              v317 = v315 - 1;
              *(_DWORD *)(v11 + 4) = v317;
              v318 = (v316 >> v317) & 1;
              goto LABEL_278;
            }
            *(_DWORD *)(v11 + 4) = 31;
            v319 = *(_DWORD *)(v11 + 160);
            v320 = *(unsigned int *)(v11 + 8);
            if (v314 > v319 || 32 * (int)v320 > v319)
            {
              *(_DWORD *)v11 = 0;
              *(_DWORD *)(v11 + 8) = v320 + 1;
            }
            else
            {
              v321 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v320));
              *(_DWORD *)v11 = v321;
              *(_DWORD *)(v11 + 8) = v320 + 1;
              v318 = v321 >> 31;
LABEL_278:
              if (v318)
              {
                v309 = v309 | 0x40;
                goto LABEL_282;
              }
            }
            v309 &= 0xBFu;
LABEL_282:
            *v310 = v309;
          }
          v322 = 0;
          v323 = (int64x2_t)xmmword_219C5B8F0;
          do
          {
            if ((vmovn_s64((int64x2_t)vcgtq_u64(v306, (uint64x2_t)v323)).u8[0] & 1) != 0)
              v512[v322] = (v309 >> v322) & 1;
            if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v323)).i32[1] & 1) != 0)
              v512[v322 + 1] = (v309 >> (v322 + 1)) & 1;
            v322 += 2;
            v323 = vaddq_s64(v323, v307);
          }
          while (v322 != 6);
          if (DecCbpy(v512, v313, (CBitStreamDeco *)v11))
            break;
          v324 = 0;
          v325 = *v310;
          v326 = 5;
          do
          {
            v327 = v325 & (-33 >> v326);
            v325 |= 1 << v324;
            if (!v512[v324])
              v325 = v327;
            *v310 = v325;
            ++v324;
            --v326;
          }
          while (v324 != 6);
          v328 = *v503;
          if (v328 == 4 || v328 == 1)
          {
            *(_DWORD *)v515 = 0;
            v330 = DecDQuant((int *)v515, (CBitStreamDeco *)v11);
            v139 = v495;
            if (v330)
              break;
            v331 = *v308 + *(_WORD *)v515;
            *v308 = v331;
            LOWORD(v497) = v331;
            v328 = *v503;
          }
          else
          {
            v139 = v495;
          }
          v306 = v483;
          v307 = v472;
          if ((v328 - 3) <= 1 && gIntraDcVlcThresholdTable[v485] > *v308)
          {
            v332 = 0;
            v333 = v305;
            while (!GrabDcFromBitStream(v333, v332, v508, (CBitStreamDeco *)v11))
            {
              ++v332;
              ++v333;
              if (v332 == 6)
              {
                v139 = v495;
                v306 = v483;
                v307 = v472;
                goto LABEL_307;
              }
            }
            break;
          }
        }
LABEL_307:
        ++v304;
        v305 += 10;
        if (v304 == v462)
        {
          v303 = v479;
          v12 = v465;
          LODWORD(v16) = v437;
LABEL_309:
          v334 = v423;
          *(_WORD *)(*(_QWORD *)(v423 + 24) + 160) = v497;
          v9 = v493;
          v335 = **(unsigned __int16 **)(v423 + 16);
          v336 = *v493 / v335;
          v337 = v454;
          v338 = a3;
          v339 = v474;
          v340 = v457;
          LODWORD(v341) = 0;
          if (v336 >= v452[0])
          {
LABEL_365:
            *(_DWORD *)(v334 + 536) = v450;
            *(_DWORD *)(v334 + 544) = v448;
            *(_DWORD *)(v5 + 196) += v341;
            v12 = *v9;
            goto LABEL_369;
          }
          v439 = v16;
          v342 = v443 + 4 * (int)v474 * (uint64_t)v440;
          v343 = v439;
          v488 = v342 + 1;
          v484 = v342 + ((2 * (_DWORD)v474) | 1u);
          v344 = *v493 % v335;
          v464 = 16 * v336;
          v345 = v336;
          v445 = 8 * v336;
          v406 = 8 * (*(_QWORD *)v460 >> 2);
          v422 = (unsigned __int8 *)(4 * (*(_QWORD *)v460 >> 2));
          v400 = vdupq_n_s64(2uLL);
          v403 = (uint64x2_t)vdupq_n_s64(6uLL);
          v469 = v12;
          v346 = 1;
          v492 = v342;
          v347 = v342 + 2 * v474;
          *(_QWORD *)v418 = (4 * v474);
          while (v344 >= (int)v339)
          {
LABEL_363:
            if ((int)v341 < v343)
            {
              v344 = 0;
              v492 += *(_QWORD *)v418;
              v488 += *(_QWORD *)v418;
              v347 += *(_QWORD *)v418;
              v484 += *(_QWORD *)v418;
              ++v345;
              v464 += 16;
              v445 += 8;
              if (v345 < *(uint64_t *)v452)
                continue;
            }
            goto LABEL_365;
          }
          v426 = v347;
          v392 = v345;
          v393 = 8 * (int)v345 * *(_QWORD *)v460;
          v435 = 16 * (int)v345;
          v442 = v495 + 4 + 20 * (int)v341;
          v341 = (int)v341;
          v348 = (unsigned __int8 *)v344;
          v432 = 16 * v344;
          v429 = 8 * v344;
          v493 = v9;
          v476 = v339;
          v480 = v303;
          v465 = v12;
          v456 = v337;
          v459 = v340;
          while (1)
          {
            v473 = v341;
            v504 = v348;
            if (!v348 || v346)
            {
              ResetAtBoundaryLeft(v340, (int)v348);
              LODWORD(v348) = (_DWORD)v504;
              v341 = v473;
            }
            if (v341 < v339)
            {
              ResetAtBoundaryTop(v340, (int)v504);
              LODWORD(v348) = (_DWORD)v504;
              v341 = v473;
            }
            v349 = (__int16 *)(v495 + 20 * v341);
            v511 = *v349;
            v351 = *((char *)v349 + 3);
            v350 = (unsigned __int8 *)v349 + 3;
            if ((v351 & 0x80000000) == 0)
              break;
            *(_BYTE *)(v492 + 2 * (int)v348) = 1;
            *(_BYTE *)(v488 + 2 * (int)v348) = 1;
            *(_BYTE *)(v426 + 2 * (int)v348) = 1;
            v303 = v480;
            *(_BYTE *)(v484 + 2 * (int)v348) = 1;
            *(_BYTE *)(v337 + v469) = 1;
            *(_BYTE *)(v446 + v469) = 1;
            v367 = **v338;
            v368 = **v480;
            v369 = v432 + v464 * *((unsigned __int16 *)*v338 + 12);
            v370 = -2;
            do
            {
              *(_OWORD *)(v367 + v369) = *(_OWORD *)(v368 + v369);
              *(_OWORD *)(v367 + 4 * (v505 >> 2) + v369) = *(_OWORD *)(v368 + 4 * (v505 >> 2) + v369);
              v369 += 8 * (v505 >> 2);
              v370 += 2;
            }
            while (v370 < 0xE);
            v372 = v338[1];
            v371 = *v372;
            LODWORD(v372) = v429 + v445 * *((unsigned __int16 *)v372 + 12);
            v373 = *v480[1];
            v374 = (int)v372;
            v375 = -2;
            do
            {
              v376 = *(_QWORD *)&v422[v373 + v374];
              *(_QWORD *)(v371 + v374) = *(_QWORD *)(v373 + v374);
              *(_QWORD *)&v422[v371 + v374] = v376;
              v374 += v406;
              v375 += 2;
            }
            while (v375 < 6);
            v377 = *v338[2];
            v378 = *v480[2];
            v372 = (uint64_t *)(int)v372;
            v379 = -2;
            do
            {
              v380 = *(_QWORD *)&v422[v378 + (_QWORD)v372];
              *(uint64_t *)((char *)v372 + v377) = *(uint64_t *)((char *)v372 + v378);
              *(_QWORD *)&v422[v377 + (_QWORD)v372] = v380;
              v372 = (uint64_t *)((char *)v372 + v406);
              v379 += 2;
            }
            while (v379 < 6);
            ++v448;
            ResetAtInterMB(v340, (int)v348);
LABEL_340:
            v450 += v511;
            ++v469;
            ++*v9;
            v341 = v473 + 1;
            v343 = v439;
            if (v473 + 1 < v439)
            {
              v346 = 0;
              v348 = v504 + 1;
              v432 += 16;
              v429 += 8;
              v442 += 20;
              if ((uint64_t)(v504 + 1) < v339)
                continue;
            }
            v346 = 0;
            v345 = v392;
            v347 = v426;
            goto LABEL_363;
          }
          v394 = 8 * (int)v348;
          v499 = 16 * (int)v348;
          *(_BYTE *)(v492 + 2 * (int)v348) = 0;
          *(_BYTE *)(v488 + 2 * (int)v348) = 0;
          *(_BYTE *)(v426 + 2 * (int)v348) = 0;
          *(_BYTE *)(v484 + 2 * (int)v348) = 0;
          *(_BYTE *)(v337 + v469) = 0;
          *(_BYTE *)(v446 + v469) = 0;
          if (*(unsigned __int8 *)(v495 + 20 * v341 + 2) - 3 > 1)
          {
            ResetAtInterMB(v340, (int)v348);
            v381 = 0;
            v382 = *v350;
            v383 = (int64x2_t)xmmword_219C5B8F0;
            do
            {
              if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), (uint64x2_t)v383)).u8[0] & 1) != 0)
                v512[v381] = (v382 >> v381) & 1;
              if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v383)).i32[1] & 1) != 0)
                v512[v381 + 1] = (v382 >> (v381 + 1)) & 1;
              v381 += 2;
              v383 = vaddq_s64(v383, vdupq_n_s64(2uLL));
            }
            while (v381 != 6);
            v384 = v334;
            v385 = 0;
            v386 = 0;
            v387 = 1;
LABEL_350:
            v388 = 0;
            v389 = 0;
            v390 = v387;
            v391 = (v385 | v435) * v505;
            while (!v512[v386 + v388]
                 || !DecodeBlockInterDataPartitioned(**a3 + v391 + (int)v499 + v389, (uint64_t)v546, (__int16 *)v515, v505, v386 + (int)v388, v511, v384))
            {
              ++v388;
              v389 = 8;
              if ((_DWORD)v388 == 2)
              {
                v387 = 0;
                v386 += 2;
                v385 = 8;
                if ((v390 & 1) != 0)
                  goto LABEL_350;
                if (v513
                  && DecodeBlockInterDataPartitioned(*a3[1] + v393 + (int)v394, (uint64_t)v546, (__int16 *)v515, v460[0], 4, v511, v384))
                {
                  goto LABEL_367;
                }
                if (!v514)
                {
                  v9 = v493;
                  v334 = v384;
                  v339 = v476;
                  v303 = v480;
                  v338 = a3;
                  v12 = v465;
                  v337 = v456;
                  v340 = v459;
                  goto LABEL_340;
                }
                v338 = a3;
                v334 = v384;
                v366 = DecodeBlockInterDataPartitioned(*a3[2] + v393 + (int)v394, (uint64_t)v546, (__int16 *)v515, v460[0], 5, v511, v384);
LABEL_359:
                v9 = v493;
                v339 = v476;
                v303 = v480;
                v12 = v465;
                v337 = v456;
                v340 = v459;
                if (!v366)
                  goto LABEL_340;
                goto LABEL_368;
              }
            }
          }
          else
          {
            SetIntraPredACMode(v340, (*v350 >> 6) & 1);
            dc_scaler = Get_dc_scaler(v511, 0);
            v353 = 0;
            v354 = *v350;
            v355 = (int64x2_t)xmmword_219C5B8F0;
            do
            {
              if ((vmovn_s64((int64x2_t)vcgtq_u64(v403, (uint64x2_t)v355)).u8[0] & 1) != 0)
                v512[v353] = (v354 >> v353) & 1;
              if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v355)).i32[1] & 1) != 0)
                v512[v353 + 1] = (v354 >> (v353 + 1)) & 1;
              v353 += 2;
              v355 = vaddq_s64(v355, v400);
            }
            while (v353 != 6);
            v356 = 0;
            v357 = 0;
            v358 = dc_scaler;
            v359 = (int *)(v495 + 20 * v473 + 16);
            v360 = 1;
LABEL_327:
            v361 = 0;
            v362 = 0;
            v397 = v360;
            v363 = (v356 | v435) * v505;
            while (1)
            {
              v546[0].i16[0] = *(_WORD *)(v442 + 2 * v357 + 2 * v361);
              if (DecodeBlockIntraDataPartitioned((_QWORD *)(**a3 + v363 + v499 + v362), (__int16 *)v515, (uint64_t)v546, (unsigned __int8 *)v547, v505, (int)v504, v357 + (int)v361, v511, v358, v512[v357 + v361], *v359, v334, (CBitStreamDeco *)v11))break;
              ++v361;
              v362 = 8;
              if ((_DWORD)v361 == 2)
              {
                v360 = 0;
                v357 += 2;
                v356 = 8;
                if ((v397 & 1) != 0)
                  goto LABEL_327;
                v364 = Get_dc_scaler(v511, 4);
                v546[0].i16[0] = *(_WORD *)(v495 + 20 * v473 + 12);
                v365 = v364;
                if (!DecodeBlockIntraDataPartitioned((_QWORD *)(*a3[1] + v393 + v394), (__int16 *)v515, (uint64_t)v546, (unsigned __int8 *)v547, v460[0], (int)v504, 4, v511, v364, v513, *v359, v334, (CBitStreamDeco *)v11))
                {
                  v546[0].i16[0] = *(_WORD *)(v495 + 20 * v473 + 14);
                  v338 = a3;
                  v366 = DecodeBlockIntraDataPartitioned((_QWORD *)(*a3[2] + v393 + v394), (__int16 *)v515, (uint64_t)v546, (unsigned __int8 *)v547, v460[0], (int)v504, 5, v511, v365, v514, *v359, v334, (CBitStreamDeco *)v11);
                  goto LABEL_359;
                }
                goto LABEL_367;
              }
            }
          }
          break;
        }
        goto LABEL_271;
      }
LABEL_367:
      v9 = v493;
      v12 = v465;
    }
    else
    {
      if (*(_BYTE *)(v5 + 148))
        goto LABEL_368;
      v500 = *(unsigned __int8 **)(a5 + 24);
      v440 = v15;
      v443 = *(_QWORD *)(a5 + 552);
      v446 = *(_QWORD *)(a5 + 568);
      v457 = *(_QWORD *)(a5 + 584);
      *(_QWORD *)v460 = *((unsigned __int16 *)a3[1] + 12);
      *(_QWORD *)v452 = v13[1];
      v454 = *(_QWORD *)(a5 + 560);
      v474 = *v13;
      v448 = *(_DWORD *)(a5 + 544);
      v450 = *(_DWORD *)(a5 + 536);
      v465 = v12;
      v423 = a5;
      v493 = v9;
      v495 = *(_QWORD *)(a5 + 576);
      v16 = 0;
      v17 = (__int16 *)(v10 + 4);
      v18 = 1;
      do
      {
        v19 = v16;
        v20 = (__int16 *)(v10 + 20 * v16);
        v21 = (char *)v20 + 3;
        v22 = v18;
        *((_BYTE *)v20 + 3) &= ~0x80u;
        if (DecMcpbcIVop((unsigned __int8 *)v20 + 2, v512, v500[148], v500[90], (CBitStreamDeco *)v11))
        {
LABEL_94:
          v9 = v493;
          v12 = v465;
          goto LABEL_95;
        }
        v23 = 0;
        v24 = *v21;
        v25 = 5;
        do
        {
          v26 = v24 & (-33 >> v25);
          v24 |= 1 << v23;
          if (!v512[v23])
            v24 = v26;
          *v21 = v24;
          ++v23;
          --v25;
        }
        while (v23 != 6);
        *v20 = v497;
        v27 = *((unsigned __int8 *)v20 + 2);
        if (v27 == 4 || v27 == 1)
        {
          *(_DWORD *)v515 = 0;
          v29 = DecDQuant((int *)v515, (CBitStreamDeco *)v11);
          v10 = v495;
          if (v29)
            goto LABEL_94;
          v30 = *v20 + *(_WORD *)v515;
          *v20 = v30;
        }
        else
        {
          v30 = v497;
          v10 = v495;
        }
        v31 = (_DWORD *)(v10 + 20 * v19 + 16);
        if (v497 >= gIntraDcVlcThresholdTable[v485])
        {
          *v31 = 1;
        }
        else
        {
          v32 = 0;
          *v31 = 0;
          v33 = v17;
          do
          {
            if (GrabDcFromBitStream(v33, v32, v508, (CBitStreamDeco *)v11))
              goto LABEL_94;
            ++v32;
            ++v33;
          }
          while (v32 != 6);
          v30 = *v20;
          v10 = v495;
        }
        v34 = *(_DWORD *)(v11 + 156);
        v35 = v34 + 19;
        *(_DWORD *)(v11 + 156) = v34 + 19;
        v36 = *(unsigned int *)(v11 + 4);
        if (v36 >= 0x13)
        {
          v38 = v36 - 19;
          v39 = *(_DWORD *)(v11 + 100);
          v43 = *(_DWORD *)v11;
          v40 = (*(_DWORD *)v11 >> v38) & v39;
        }
        else
        {
          v37 = 19 - v36;
          v38 = v36 + 13;
          *(_DWORD *)(v11 + 4) = v36 + 13;
          v39 = *(_DWORD *)(v11 + 100);
          v40 = (*(_DWORD *)v11 << v37) & v39;
          v41 = *(_DWORD *)(v11 + 160);
          v42 = *(unsigned int *)(v11 + 8);
          if (v35 > v41 || 32 * (int)v42 > v41)
          {
            v43 = 0;
            *(_DWORD *)(v11 + 8) = v42 + 1;
            *(_DWORD *)v11 = 0;
          }
          else
          {
            v43 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v42));
            *(_DWORD *)v11 = v43;
            *(_DWORD *)(v11 + 8) = v42 + 1;
            v40 |= *(_DWORD *)(v11 + 4 * v37 + 24) & (v43 >> v38);
          }
        }
        v44 = v38 + 19;
        *(_DWORD *)(v11 + 4) = v38 + 19;
        if (v38 >= 0xE)
        {
          v44 = v38 - 13;
          v45 = *(_DWORD *)(v11 + 8);
          *(_DWORD *)(v11 + 4) = v44;
          *(_DWORD *)(v11 + 8) = v45 - 1;
          if (*(_DWORD *)(v11 + 160) >= (32 * (v45 - 1)))
          {
            v43 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * (v45 - 2)));
            *(_DWORD *)v11 = v43;
          }
        }
        v497 = v30;
        v16 = v19 + 1;
        *(_DWORD *)(v11 + 156) = v34;
        v18 = v22 + 1;
        v17 += 10;
      }
      while (v40 != 438273 && v16 < v489);
      v9 = v493;
      v12 = v465;
      if ((int)v489 > (int)v19)
      {
        *(_DWORD *)(v11 + 156) = v35;
        v47 = v44 - 19;
        if (v44 >= 0x13)
        {
          *(_DWORD *)(v11 + 4) = v47;
          v48 = (v43 >> v47) & v39;
        }
        else
        {
          *(_DWORD *)(v11 + 4) = v44 + 13;
          v48 = (v43 << (19 - v44)) & v39;
          v49 = *(_DWORD *)(v11 + 160);
          v50 = *(unsigned int *)(v11 + 8);
          if (v35 > v49 || 32 * (int)v50 > v49)
          {
            *(_DWORD *)(v11 + 8) = v50 + 1;
            *(_DWORD *)v11 = 0;
          }
          else
          {
            v51 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v50));
            *(_DWORD *)v11 = v51;
            *(_DWORD *)(v11 + 8) = v50 + 1;
            v48 |= *(_DWORD *)(v11 + 4 * (19 - v44) + 24) & (v51 >> (v44 + 13));
          }
        }
        if (v48 == 438273)
        {
          v280 = 0;
          v281 = (uint64x2_t)vdupq_n_s64(6uLL);
          v282 = vdupq_n_s64(2uLL);
          v283 = v22;
          v5 = (uint64_t)v500;
          v487 = v282;
          v491 = v281;
          while (1)
          {
            v284 = *(_DWORD *)(v11 + 156) + 1;
            *(_DWORD *)(v11 + 156) = v284;
            v285 = *(_DWORD *)(v11 + 4);
            if (v285)
            {
              v286 = *(_DWORD *)v11;
              v287 = v285 - 1;
              *(_DWORD *)(v11 + 4) = v287;
              v288 = (v286 >> v287) & 1;
            }
            else
            {
              *(_DWORD *)(v11 + 4) = 31;
              v289 = *(_DWORD *)(v11 + 160);
              v290 = *(unsigned int *)(v11 + 8);
              if (v284 > v289 || 32 * (int)v290 > v289)
              {
                *(_DWORD *)v11 = 0;
                *(_DWORD *)(v11 + 8) = v290 + 1;
                goto LABEL_253;
              }
              v292 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v290));
              *(_DWORD *)v11 = v292;
              *(_DWORD *)(v11 + 8) = v290 + 1;
              v288 = v292 >> 31;
            }
            if (v288)
            {
              v293 = v495 + 20 * v280;
              v294 = *(unsigned __int8 *)(v293 + 3) | 0x40;
              goto LABEL_254;
            }
LABEL_253:
            v293 = v495 + 20 * v280;
            v294 = *(_BYTE *)(v293 + 3) & 0xBF;
LABEL_254:
            *(_BYTE *)(v293 + 3) = v294;
            v295 = v16;
            v296 = 0;
            v297 = (int64x2_t)xmmword_219C5B8F0;
            do
            {
              if ((vmovn_s64((int64x2_t)vcgtq_u64(v281, (uint64x2_t)v297)).u8[0] & 1) != 0)
                v512[v296] = (v294 >> v296) & 1;
              if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v297)).i32[1] & 1) != 0)
                v512[v296 + 1] = (v294 >> (v296 + 1)) & 1;
              v296 += 2;
              v297 = vaddq_s64(v297, v282);
            }
            while (v296 != 6);
            v298 = v495 + 20 * v280;
            if (DecCbpy(v512, *(unsigned __int8 *)(v298 + 2), (CBitStreamDeco *)v11))
              goto LABEL_367;
            v299 = 0;
            v300 = *(unsigned __int8 *)(v298 + 3);
            v301 = 5;
            do
            {
              v302 = v300 & (-33 >> v301);
              v300 |= 1 << v299;
              if (!v512[v299])
                v300 = v302;
              *(_BYTE *)(v298 + 3) = v300;
              ++v299;
              --v301;
            }
            while (v299 != 6);
            ++v280;
            v303 = (uint64_t **)a4;
            v16 = v295;
            v282 = v487;
            v281 = v491;
            if (v280 == v283)
            {
              v12 = v465;
              goto LABEL_309;
            }
          }
        }
      }
LABEL_95:
      v5 = (uint64_t)v500;
    }
LABEL_368:
    *v9 = v12;
LABEL_369:
    v279 = v12 - 1;
    goto LABEL_370;
  }
  v52 = *a1;
  v53 = *(unsigned __int16 **)(a5 + 16);
  v54 = *v53;
  v55 = *(_QWORD *)(a5 + 104);
  v56 = *(_QWORD *)(a5 + 80);
  v57 = *(unsigned __int8 *)(v5 + 158);
  v501 = *(_WORD *)(v5 + 160);
  v506 = *(_QWORD *)(a5 + 584);
  v58 = *(_DWORD *)(a5 + 536);
  v59 = *(_DWORD *)(a5 + 544);
  v60 = *(_QWORD *)(a5 + 552);
  v467 = *(_QWORD *)(a5 + 560);
  v466 = *(_QWORD *)(a5 + 568);
  v61 = v53[1];
  v62 = *((unsigned __int16 *)*a3 + 12);
  LODWORD(v53) = *(unsigned __int16 *)(*v8 + 26);
  v63 = *((unsigned __int16 *)a3[1] + 12);
  v64 = *(unsigned __int16 *)(v8[1] + 26);
  v532 = *(_QWORD *)(v7 + 624);
  v531 = v532 + 256;
  v533 = v532 + 128;
  v534 = v532 + 384;
  v524 = *(_OWORD *)(a3 + 15);
  v525 = a3[17];
  v541 = *(_OWORD *)(v8 + 15);
  v542 = v8[17];
  v65 = *(_BYTE *)(v5 + 140) == 1;
  v526 = (int)v53;
  v527 = v64;
  v66 = *(unsigned __int8 *)(v5 + 148);
  if (v66 == 2)
    goto LABEL_236;
  v494 = v9;
  v490 = v58;
  v141 = v52 / (int)v54;
  *(_BYTE *)(v7 + 208) = v66;
  v471 = v59;
  if (v52 / (int)v54 >= v61)
  {
    v509 = 0;
    goto LABEL_233;
  }
  v425 = v65;
  *(_QWORD *)v417 = v57;
  v478 = v8;
  v509 = 0;
  v142 = v60 + 4 * (int)v54 * (uint64_t)v141;
  *(_QWORD *)v461 = v142 + 1;
  v463 = v142;
  v458 = v142 + 2 * v54;
  v451 = 2 * v54;
  v455 = v142 + ((2 * (_DWORD)v54) | 1u);
  v143 = v52 % (int)v54;
  v144 = (uint64_t *)(v7 + 128);
  v145 = (uint64_t *)(v7 + 112);
  v146 = (uint64_t *)(v7 + 152);
  v147 = (uint64_t *)(v7 + 136);
  v396 = (unsigned __int8 *)(v55 + 8);
  v399 = v63;
  v402 = v62;
  v405 = (4 * v54);
  *(_QWORD *)v408 = v7 + 136;
  v444 = 16 * v141;
  v148 = 8 * (v62 >> 2);
  v420 = 4 * (v62 >> 2);
  v441 = 8 * v141;
  v149 = 8 * (v63 >> 2);
  v434 = 4 * (v63 >> 2);
  v475 = 1;
  v395 = v52;
  v498 = v52;
  v496 = v54;
  v413 = v61;
  v447 = (uint64_t *)(v7 + 112);
  v449 = (uint64_t *)(v7 + 128);
  *(_QWORD *)v411 = v7 + 152;
  while (2)
  {
    SwapMVrow(v144, v145);
    SwapMVrow(v146, v147);
    v453 = v141;
    if (v143 >= (int)v54)
    {
      v231 = 0;
      v152 = v509;
      v145 = v447;
      v144 = v449;
      goto LABEL_229;
    }
    v428 = 8 * v141 * v399;
    v431 = 16 * v141 * v402;
    v150 = v141;
    v151 = v143;
    v486 = 16 * v143;
    v482 = 8 * v143;
    v438 = v150 * v451;
    v152 = v509;
    v9 = v494;
LABEL_100:
    if (!v151 || v475)
      ResetAtBoundaryLeft(v506, v151);
    if (v152 < (int)v496)
      ResetAtBoundaryTop(v506, v151);
    v153 = *(unsigned __int8 *)(v5 + 148);
    if (v153 != 1)
    {
      if (v153 == 3)
      {
        v154 = *(unsigned __int8 *)(v5 + 90);
        if (v154 == 2)
          goto LABEL_110;
      }
      else
      {
        if (v153 == 2)
          goto LABEL_235;
        v154 = *(unsigned __int8 *)(v5 + 90);
      }
      *(_BYTE *)(v5 + 176) = 0;
      if (!DecMcpbcIVop(v396, (unsigned __int8 *)&v545, v153, v154, (CBitStreamDeco *)v56))
      {
        v510 = v152;
        v164 = *(_BYTE *)(v5 + 176);
        goto LABEL_127;
      }
      goto LABEL_235;
    }
    while (1)
    {
LABEL_110:
      v155 = *(_DWORD *)(v56 + 156) + 1;
      *(_DWORD *)(v56 + 156) = v155;
      v156 = *(_DWORD *)(v56 + 4);
      if (v156)
      {
        v157 = *(_DWORD *)v56;
        v158 = v156 - 1;
        *(_DWORD *)(v56 + 4) = v158;
        v159 = (v157 >> v158) & 1;
      }
      else
      {
        *(_DWORD *)(v56 + 4) = 31;
        v160 = *(_DWORD *)(v56 + 160);
        v161 = *(unsigned int *)(v56 + 8);
        if (v155 > v160 || 32 * (int)v161 > v160)
        {
          *(_DWORD *)v56 = 0;
          *(_DWORD *)(v56 + 8) = v161 + 1;
          *(_BYTE *)(v5 + 176) = 0;
          goto LABEL_119;
        }
        v163 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * v161));
        *(_DWORD *)v56 = v163;
        *(_DWORD *)(v56 + 8) = v161 + 1;
        v159 = v163 >> 31;
      }
      *(_BYTE *)(v5 + 176) = v159;
      if (v159)
        break;
LABEL_119:
      if (DecMcpbcPVop(v396, (unsigned __int8 *)&v545, *(unsigned __int8 *)(v5 + 148), *(unsigned __int8 *)(v5 + 90), (CBitStreamDeco *)v56))goto LABEL_235;
      v164 = *(_BYTE *)(v5 + 176);
      if (v164)
      {
        v510 = v152;
        goto LABEL_127;
      }
      if (*v396 != 5)
      {
        v510 = v152;
        v164 = 0;
        goto LABEL_127;
      }
    }
    v510 = v152;
    v164 = 1;
LABEL_127:
    v165 = 2 * v151;
    v166 = (int)v151;
    v167 = 2 * (int)v151;
    *(_BYTE *)(*(_QWORD *)(v7 + 216) + v498) = v164;
    if (*(_BYTE *)(v5 + 176))
    {
      *(_BYTE *)(v463 + 2 * (int)v151) = 1;
      *(_BYTE *)(*(_QWORD *)v461 + 2 * (int)v151) = 1;
      *(_BYTE *)(v458 + 2 * (int)v151) = 1;
      *(_BYTE *)(v455 + 2 * (int)v151) = 1;
      *(_BYTE *)(v467 + v498) = 1;
      *(_BYTE *)(v466 + v498) = 1;
      *v396 = 0;
      if (*(_BYTE *)(v5 + 148) == 3 && *(_BYTE *)(v5 + 90) == 2)
      {
        v543 = v425;
        v168 = a3[8];
        v169 = (uint64_t)&a3[7][v166] + v428;
        v518 = (uint64_t)&a3[3][v167] + v431;
        v522 = v169;
        v523 = (uint64_t)&v168[v166] + v428;
        DecodeMBGMC(v151, v453, (uint64_t)v515, v7);
        v170 = v471;
        v171 = v510;
      }
      else
      {
        v172 = **a3;
        v173 = *(_QWORD *)*v478;
        v174 = v486 + v444 * *((unsigned __int16 *)*a3 + 12);
        v175 = -2;
        do
        {
          *(_OWORD *)(v172 + v174) = *(_OWORD *)(v173 + v174);
          *(_OWORD *)(v172 + v420 + v174) = *(_OWORD *)(v173 + v420 + v174);
          v174 += v148;
          v175 += 2;
        }
        while (v175 < 0xE);
        v176 = a3[1];
        v177 = *v176;
        v178 = v482 + v441 * *((unsigned __int16 *)v176 + 12);
        v179 = *(_QWORD *)v478[1];
        v180 = -2;
        v181 = v178;
        v170 = v471;
        v171 = v510;
        do
        {
          v182 = *(_QWORD *)(v179 + v434 + v181);
          *(_QWORD *)(v177 + v181) = *(_QWORD *)(v179 + v181);
          *(_QWORD *)(v177 + v434 + v181) = v182;
          v181 += v149;
          v180 += 2;
        }
        while (v180 < 6);
        v183 = *a3[2];
        v184 = *(_QWORD *)v478[2];
        v185 = -2;
        do
        {
          v186 = *(_QWORD *)(v184 + v434 + v178);
          *(_QWORD *)(v183 + v178) = *(_QWORD *)(v184 + v178);
          *(_QWORD *)(v183 + v434 + v178) = v186;
          v178 += v149;
          v185 += 2;
        }
        while (v185 < 6);
        v187 = *(_QWORD *)(v7 + 128);
        v188 = (2 * v165) | 2;
        *(_WORD *)(v187 + v188) = 0;
        *(_WORD *)(v187 + 4 * (int)v151) = 0;
        v189 = *(_QWORD *)(v7 + 120);
        *(_WORD *)(v189 + v188) = 0;
        *(_WORD *)(v189 + 4 * (int)v151) = 0;
        v190 = *(_QWORD *)(v7 + 152);
        *(_WORD *)(v190 + v188) = 0;
        *(_WORD *)(v190 + 4 * (int)v151) = 0;
        v191 = *(_QWORD *)(v7 + 144);
        *(_WORD *)(v191 + v188) = 0;
        *(_WORD *)(v191 + 4 * (int)v151) = 0;
      }
      v192 = *(_QWORD *)(v7 + 224);
      v193 = 2 * (v438 + (int)v151);
      *(_WORD *)(v192 + 2 * v193) = 0;
      v194 = *(_QWORD *)(v7 + 232);
      *(_WORD *)(v194 + 2 * v193) = 0;
      v195 = (4 * (v193 >> 1)) | 2;
      *(_WORD *)(v192 + v195) = 0;
      *(_WORD *)(v194 + v195) = 0;
      v471 = v170 + 1;
      v196 = v193 + v451;
      *(_WORD *)(v192 + 2 * v196) = 0;
      *(_WORD *)(v194 + 2 * v196) = 0;
      v197 = (2 * v196) | 2;
      *(_WORD *)(v192 + v197) = 0;
      *(_WORD *)(v194 + v197) = 0;
      ResetAtInterMB(v506, v151);
      v9 = v494;
LABEL_139:
      v198 = *(_DWORD *)(v56 + 156);
      *(_DWORD *)(v56 + 156) = v198 + 1;
      v199 = *(_DWORD *)(v56 + 4);
      if (v199)
      {
        v200 = *(_DWORD *)v56;
        v201 = (*(_DWORD *)v56 >> (v199 - 1)) & *(_DWORD *)(v56 + 28);
        v145 = v447;
        v144 = v449;
        if (v199 >= 0x21)
        {
          v199 -= 32;
          v202 = *(_DWORD *)(v56 + 8);
          *(_DWORD *)(v56 + 4) = v199;
          *(_DWORD *)(v56 + 8) = v202 - 1;
          if (*(_DWORD *)(v56 + 160) >= (32 * (v202 - 1)))
          {
            v200 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * (v202 - 2)));
            *(_DWORD *)v56 = v200;
          }
        }
      }
      else
      {
        v200 = 0;
        *(_DWORD *)(v56 + 4) = 31;
        v208 = 2 * *(_DWORD *)v56;
        v209 = *(_DWORD *)(v56 + 160);
        v210 = *(unsigned int *)(v56 + 8);
        v145 = v447;
        v144 = v449;
        if (v198 + 1 <= v209 && 32 * (int)v210 <= v209)
        {
          v200 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * v210));
          v208 |= v200 >> 31;
        }
        v201 = v208 & *(_DWORD *)(v56 + 28);
        v199 = 32;
        *(_DWORD *)v56 = v200;
        *(_DWORD *)(v56 + 4) = 32;
        *(_DWORD *)(v56 + 8) = v210 + 1;
      }
      *(_DWORD *)(v56 + 156) = v198;
      if (v201)
        goto LABEL_178;
      if ((v199 & 7) != 0)
        v211 = v199 & 7;
      else
        v211 = 8;
      v212 = kStuffedBits[v211];
      *(_DWORD *)(v56 + 156) = v211 + v198;
      if (v199 >= v211)
      {
        v214 = v199 - v211;
        v215 = *(_DWORD *)(v56 + 4 * v211 + 24) & (v200 >> (v199 - v211));
      }
      else
      {
        v213 = v211 - v199;
        v214 = 32 - (v211 - v199);
        *(_DWORD *)(v56 + 4) = v214;
        if (v211 - v199 <= 0x1F)
          v215 = *(_DWORD *)(v56 + 4 * v211 + 24) & (v200 << v213);
        else
          v215 = 0;
        v222 = *(_DWORD *)(v56 + 160);
        v223 = *(unsigned int *)(v56 + 8);
        if ((int)v211 + v198 > v222 || 32 * (int)v223 > v222)
        {
          v200 = 0;
          *(_DWORD *)(v56 + 8) = v223 + 1;
          *(_DWORD *)v56 = 0;
        }
        else
        {
          v200 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * v223));
          *(_DWORD *)v56 = v200;
          *(_DWORD *)(v56 + 8) = v223 + 1;
          v215 |= *(_DWORD *)(v56 + 4 * v213 + 24) & (v200 >> v214);
        }
      }
      v224 = v214 + v211;
      *(_DWORD *)(v56 + 4) = v224;
      if (v224 >= 0x21)
      {
        v224 -= 32;
        v225 = *(_DWORD *)(v56 + 8);
        *(_DWORD *)(v56 + 4) = v224;
        *(_DWORD *)(v56 + 8) = v225 - 1;
        if (*(_DWORD *)(v56 + 160) >= (32 * (v225 - 1)))
        {
          v200 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * (v225 - 2)));
          *(_DWORD *)v56 = v200;
        }
      }
      *(_DWORD *)(v56 + 156) = v198;
      if (v215 != v212 || (v226 = v211 + 23, v227 = *(_DWORD *)(v56 + 160), v227 - v198 <= v226))
      {
LABEL_178:
        v231 = 0;
      }
      else
      {
        *(_DWORD *)(v56 + 156) = v226 + v198;
        v228 = v224 - v226;
        if (v224 >= v226)
        {
          v230 = *(_DWORD *)(v56 + 4 * v226 + 24) & (v200 >> v228);
        }
        else
        {
          v229 = v226 - v224;
          v228 = 32 - v229;
          *(_DWORD *)(v56 + 4) = 32 - v229;
          if (v229 <= 0x1F)
            v230 = *(_DWORD *)(v56 + 4 * v226 + 24) & (v200 << v229);
          else
            v230 = 0;
          v269 = *(unsigned int *)(v56 + 8);
          if (v226 + v198 > v227 || 32 * (int)v269 > v227)
          {
            *(_DWORD *)(v56 + 8) = v269 + 1;
            *(_DWORD *)v56 = 0;
          }
          else
          {
            v270 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * v269));
            *(_DWORD *)v56 = v270;
            *(_DWORD *)(v56 + 8) = v269 + 1;
            v230 |= *(_DWORD *)(v56 + 4 * v229 + 24) & (v270 >> v228);
          }
        }
        v271 = v228 + v226;
        *(_DWORD *)(v56 + 4) = v271;
        if (v271 >= 0x21)
        {
          v272 = v271 - 32;
          v273 = *(_DWORD *)(v56 + 8);
          *(_DWORD *)(v56 + 4) = v272;
          *(_DWORD *)(v56 + 8) = v273 - 1;
          if (v227 >= 32 * (v273 - 1))
            *(_DWORD *)v56 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * (v273 - 2)));
        }
        *(_DWORD *)(v56 + 156) = v198;
        v274 = v230 & 0x7FFFFF;
        if ((v230 & 0x7FFFFF) != 0)
        {
          if (*(_BYTE *)(v5 + 148))
            v275 = *(_BYTE *)(v5 + 162) + 16;
          else
            v275 = 17;
          v231 = v274 >> (23 - v275) == 1;
        }
        else
        {
          v231 = 1;
        }
      }
      v475 = 0;
      v490 += v501;
      ++v498;
      ++*v9;
      v152 = v171 + 1;
      if (v231 || (++v151, v486 += 16, v482 += 8, v151 >= v496))
      {
LABEL_229:
        v509 = v152;
        if (v231)
          goto LABEL_233;
        v143 = 0;
        v463 += v405;
        *(_QWORD *)v461 += v405;
        v458 += v405;
        v455 += v405;
        v141 = v453 + 1;
        v444 += 16;
        v441 += 8;
        v147 = *(uint64_t **)v408;
        v146 = *(uint64_t **)v411;
        LODWORD(v54) = v496;
        if ((int)(v453 + 1) >= v413)
        {
LABEL_233:
          *(_WORD *)(*(_QWORD *)(v7 + 24) + 160) = v501;
          *(_DWORD *)(v7 + 536) = v490;
          *(_DWORD *)(v7 + 544) = v471;
          *(_DWORD *)(v5 + 196) += v509;
          v52 = *v494;
          goto LABEL_237;
        }
        continue;
      }
      goto LABEL_100;
    }
    break;
  }
  v203 = 0;
  *(_BYTE *)(v463 + 2 * (int)v151) = 0;
  *(_BYTE *)(*(_QWORD *)v461 + 2 * (int)v151) = 0;
  *(_BYTE *)(v458 + 2 * (int)v151) = 0;
  *(_BYTE *)(v455 + 2 * (int)v151) = 0;
  *(_BYTE *)(v467 + v498) = 0;
  *(_BYTE *)(v466 + v498) = 0;
  if (!*(_BYTE *)(v5 + 21))
  {
    if (*(_BYTE *)(v5 + 148) == 3 && *(_BYTE *)(v5 + 90) == 2 && *v396 <= 1u)
    {
      v204 = *(_DWORD *)(v56 + 156) + 1;
      *(_DWORD *)(v56 + 156) = v204;
      v205 = *(_DWORD *)(v56 + 4);
      if (v205)
      {
        v206 = *(_DWORD *)v56;
        v207 = v205 - 1;
        *(_DWORD *)(v56 + 4) = v207;
        v203 = (v206 >> v207) & 1;
      }
      else
      {
        *(_DWORD *)(v56 + 4) = 31;
        v276 = *(_DWORD *)(v56 + 160);
        v277 = *(unsigned int *)(v56 + 8);
        if (v204 > v276 || 32 * (int)v277 > v276)
        {
          v203 = 0;
          *(_DWORD *)v56 = 0;
          *(_DWORD *)(v56 + 8) = v277 + 1;
        }
        else
        {
          v278 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * v277));
          *(_DWORD *)v56 = v278;
          *(_DWORD *)(v56 + 8) = v277 + 1;
          v203 = v278 >> 31;
        }
      }
    }
    else
    {
      v203 = 0;
    }
  }
  v415 = v203;
  v216 = *v396;
  if ((v216 - 3) <= 1u)
  {
    v217 = *(_DWORD *)(v56 + 156) + 1;
    *(_DWORD *)(v56 + 156) = v217;
    v218 = *(_DWORD *)(v56 + 4);
    if (v218)
    {
      v219 = *(_DWORD *)v56;
      v220 = v218 - 1;
      *(_DWORD *)(v56 + 4) = v220;
      v221 = (v219 >> v220) & 1;
    }
    else
    {
      *(_DWORD *)(v56 + 4) = 31;
      v232 = *(_DWORD *)(v56 + 160);
      v233 = *(unsigned int *)(v56 + 8);
      if (v217 > v232 || 32 * (int)v233 > v232)
      {
        v221 = 0;
        *(_DWORD *)v56 = 0;
        *(_DWORD *)(v56 + 8) = v233 + 1;
      }
      else
      {
        v234 = bswap32(*(_DWORD *)(*(_QWORD *)(v56 + 16) + 4 * v233));
        *(_DWORD *)v56 = v234;
        *(_DWORD *)(v56 + 8) = v233 + 1;
        v221 = v234 >> 31;
      }
    }
    SetIntraPredACMode(v506, v221);
    v216 = *v396;
  }
  if (DecCbpy((unsigned __int8 *)&v545, v216, (CBitStreamDeco *)v56))
    goto LABEL_234;
  v530 = gIntraDcVlcThresholdTable[*(_QWORD *)v417] <= v501;
  v235 = *v396;
  if (v235 == 4 || v235 == 1)
  {
    v544.i32[0] = 0;
    if (!DecDQuant((int *)&v544, (CBitStreamDeco *)v56))
    {
      v236 = (uint64_t *)v7;
      LOBYTE(v235) = *v396;
      v501 += v544.i16[0];
      v237 = v501;
      goto LABEL_194;
    }
LABEL_234:
    v9 = v494;
    goto LABEL_235;
  }
  v236 = (uint64_t *)v7;
  v237 = v501;
LABEL_194:
  v238 = (int)(v167 * 8) + (uint64_t)(int)v431;
  v239 = a3[6];
  v240 = 8 * (int)v151 + (uint64_t)(int)v428;
  v241 = (uint64_t)a3[4] + v238;
  v242 = (uint64_t)a3[5] + v238;
  v518 = (uint64_t)a3[3] + v238;
  v519 = v241;
  v520 = v242;
  v243 = a3[8];
  v244 = (uint64_t)a3[7] + v240;
  v521 = (uint64_t)v239 + v238;
  v522 = v244;
  v523 = (uint64_t)v243 + v240;
  v528 = v237;
  v517 = &v545;
  *(_DWORD *)v515 = v151;
  v516 = v453;
  v543 = v425;
  if ((v235 - 3) > 1u)
  {
    v529 = 0;
    v261 = *(unsigned __int8 *)(v5 + 148);
    v9 = v494;
    v7 = (uint64_t)v236;
    v171 = v510;
    if (v261 != 1 && (v261 != 3 || v415)
      || (DecMotionVectors(v546, v547, v236[15], v236[16], v236[14], v236[18], v236[19], v236[17], v151, v453, v496, v235, v475, v510 < (int)v496, v5, v56, v510), !v262))
    {
      v263 = *(_QWORD *)(v7 + 224);
      v264 = 2 * (v438 + (int)v151);
      *(_WORD *)(v263 + 2 * v264) = v546[0].i16[0];
      v265 = *(_QWORD *)(v7 + 232);
      *(_WORD *)(v265 + 2 * v264) = v547[0].i16[0];
      v266 = (4 * (v264 >> 1)) | 2;
      *(_WORD *)(v263 + v266) = v546[0].i16[1];
      *(_WORD *)(v265 + v266) = v547[0].i16[1];
      v267 = 2 * (v264 + v451);
      *(_WORD *)(v263 + v267) = v546[0].i16[2];
      *(_WORD *)(v265 + v267) = v547[0].i16[2];
      v268 = v267 | 2;
      *(_WORD *)(v263 + v268) = v546[0].i16[3];
      *(_WORD *)(v265 + v268) = v547[0].i16[3];
      ResetAtInterMB(v506, v151);
      v538 = *(_OWORD *)(v478 + 3);
      v539 = *(_OWORD *)(v478 + 5);
      v540 = *(_OWORD *)(v478 + 7);
      v543 = *(_BYTE *)(*(_QWORD *)(v7 + 24) + 140) == 1;
      if (*(_BYTE *)(v5 + 148) && v415)
        DecodeMBGMC(v151, v453, (uint64_t)v515, v7);
      else
        DecodeMBInter(v151, v453, v546, v547, *v396, (uint64_t)v515, v7);
      goto LABEL_139;
    }
  }
  else
  {
    v245 = (uint64_t)v236;
    v246 = v236[16];
    v247 = (2 * v165) | 2;
    *(_WORD *)(v246 + v247) = 0;
    *(_WORD *)(v246 + 4 * (int)v151) = 0;
    v248 = v236[15];
    *(_WORD *)(v248 + v247) = 0;
    *(_WORD *)(v248 + 4 * (int)v151) = 0;
    v249 = v236[19];
    *(_WORD *)(v249 + v247) = 0;
    *(_WORD *)(v249 + 4 * (int)v151) = 0;
    v250 = v236[18];
    *(_WORD *)(v250 + v247) = 0;
    *(_WORD *)(v250 + 4 * (int)v151) = 0;
    v251 = 2 * (v438 + (int)v151);
    v252 = v236[28];
    *(_WORD *)(v252 + 2 * v251) = 0;
    v253 = v236[29];
    *(_WORD *)(v253 + 2 * v251) = 0;
    v254 = (4 * (v251 >> 1)) | 2;
    *(_WORD *)(v252 + v254) = 0;
    *(_WORD *)(v253 + v254) = 0;
    v255 = v251 + v451;
    *(_WORD *)(v252 + 2 * v255) = 0;
    *(_WORD *)(v253 + 2 * v255) = 0;
    v256 = (2 * v255) | 2;
    *(_WORD *)(v252 + v256) = 0;
    *(_WORD *)(v253 + v256) = 0;
    v257 = Get_dc_scaler(v237, 0);
    v258 = v237;
    v7 = v245;
    v259 = Get_dc_scaler(v258, 4);
    v535 = vdupq_n_s32(v257);
    v536 = v259;
    v537 = v259;
    if (DecodeBlockIntra(0, (uint64_t)v515, v245))
      goto LABEL_234;
    v9 = v494;
    if (!DecodeBlockIntra(1u, (uint64_t)v515, v245)
      && !DecodeBlockIntra(2u, (uint64_t)v515, v245)
      && !DecodeBlockIntra(3u, (uint64_t)v515, v245)
      && !DecodeBlockIntra(4u, (uint64_t)v515, v245))
    {
      v260 = DecodeBlockIntra(5u, (uint64_t)v515, v245);
      v171 = v510;
      if (!v260)
        goto LABEL_139;
    }
  }
LABEL_235:
  v52 = v395;
LABEL_236:
  *v9 = v52;
LABEL_237:
  v279 = v52 - 1;
LABEL_370:
  *(_DWORD *)(v5 + 192) = v279;
}

uint64_t DecodeBlockIntra(unsigned int a1, uint64_t a2, uint64_t a3)
{
  int16x8_t *v6;
  int8x8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  int v14;
  uint64_t result;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  __int16 v24;
  int8x8_t v25;
  uint64_t v26;
  _BYTE *v27;
  unsigned int v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  _WORD *v37;
  int v38;
  int v39;

  v7 = *(int8x8_t **)(a2 + 112);
  v6 = *(int16x8_t **)(a2 + 120);
  v37 = *(_WORD **)(a2 + 128);
  v8 = a2 + 4 * a1;
  v38 = *(_DWORD *)(v8 + 144);
  v39 = *(_DWORD *)(a2 + 96);
  v9 = *(_QWORD *)(a2 + 8 * a1 + 16);
  v10 = *(unsigned int *)(v8 + 64);
  v11 = *(_QWORD *)(a3 + 24);
  v12 = DetermineIntraPredictionMode(*(_QWORD *)(a3 + 584), *(_DWORD *)a2, a1);
  v13 = v12;
  if (v12 == 5)
    v14 = 1;
  else
    v14 = 2 * (v12 == 6);
  *(_DWORD *)(a2 + 100) = v14;
  *(_WORD *)(a2 + 108) = 0;
  result = GrabBlockAndIQuantise(a2, a1, 1, a3);
  if ((_DWORD)result)
    return result;
  v36 = v11;
  v35 = v9;
  v16 = *(unsigned __int8 *)(a2 + 104);
  v17 = *(unsigned __int8 *)(a2 + 105);
  ScanConvertWhatever2Raster(v7, v6, v14);
  ScanConvertWhatever2RasterFirstRowColumnOnly(v6, v37, v14);
  ReconAndUpdate(*(_QWORD *)(a3 + 584), v6, v13, *(_DWORD *)a2, a1, v38, v39);
  v18 = (__int16)(v6->i16[0] * v38);
  if (v18 >= 2047)
    LOWORD(v18) = 2047;
  v7->i16[0] = v18;
  if ((v13 & 4) == 0)
  {
    v19 = v35;
    v20 = v36;
    v21 = v17;
    goto LABEL_18;
  }
  if (*(_BYTE *)(v36 + 137) == 1)
  {
    if ((v13 & 1) != 0)
    {
      v7->i16[1] = IQuantizeMPEGIntra(v6->i16[1], (__int16)v39, 1, a3 + 262);
      v7->i16[2] = IQuantizeMPEGIntra(v6->i16[2], (__int16)v39, 2, a3 + 262);
      v7->i16[3] = IQuantizeMPEGIntra(v6->i16[3], (__int16)v39, 3, a3 + 262);
      v7[1].i16[0] = IQuantizeMPEGIntra(v6->i16[4], (__int16)v39, 4, a3 + 262);
      v7[1].i16[1] = IQuantizeMPEGIntra(v6->i16[5], (__int16)v39, 5, a3 + 262);
      v7[1].i16[2] = IQuantizeMPEGIntra(v6->i16[6], (__int16)v39, 6, a3 + 262);
      v22 = 7;
      v23 = IQuantizeMPEGIntra(v6->i16[7], (__int16)v39, 7, a3 + 262);
      v21 = 7;
      goto LABEL_17;
    }
    v7[2].i16[0] = IQuantizeMPEGIntra(v6[1].i16[0], (__int16)v39, 8, a3 + 262);
    v7[4].i16[0] = IQuantizeMPEGIntra(v6[2].i16[0], (__int16)v39, 16, a3 + 262);
    v7[6].i16[0] = IQuantizeMPEGIntra(v6[3].i16[0], (__int16)v39, 24, a3 + 262);
    v7[8].i16[0] = IQuantizeMPEGIntra(v6[4].i16[0], (__int16)v39, 32, a3 + 262);
    v7[10].i16[0] = IQuantizeMPEGIntra(v6[5].i16[0], (__int16)v39, 40, a3 + 262);
    v7[12].i16[0] = IQuantizeMPEGIntra(v6[6].i16[0], (__int16)v39, 48, a3 + 262);
    v22 = 56;
    v23 = IQuantizeMPEGIntra(v6[7].i16[0], (__int16)v39, 56, a3 + 262);
    v16 = 7;
  }
  else
  {
    v24 = 2 * v39;
    if ((v13 & 1) != 0)
    {
      v7->i16[1] = IQuantizeH263(v6->i16[1], v39, v24);
      v7->i16[2] = IQuantizeH263(v6->i16[2], v39, 2 * (unsigned __int16)v39);
      v7->i16[3] = IQuantizeH263(v6->i16[3], v39, 2 * (unsigned __int16)v39);
      v7[1].i16[0] = IQuantizeH263(v6->i16[4], v39, 2 * (unsigned __int16)v39);
      v7[1].i16[1] = IQuantizeH263(v6->i16[5], v39, 2 * (unsigned __int16)v39);
      v7[1].i16[2] = IQuantizeH263(v6->i16[6], v39, 2 * (unsigned __int16)v39);
      v23 = IQuantizeH263(v6->i16[7], v39, 2 * (unsigned __int16)v39);
      v22 = 7;
      v21 = 7;
      goto LABEL_17;
    }
    v7[2].i16[0] = IQuantizeH263(v6[1].i16[0], v39, v24);
    v7[4].i16[0] = IQuantizeH263(v6[2].i16[0], v39, 2 * (unsigned __int16)v39);
    v7[6].i16[0] = IQuantizeH263(v6[3].i16[0], v39, 2 * (unsigned __int16)v39);
    v7[8].i16[0] = IQuantizeH263(v6[4].i16[0], v39, 2 * (unsigned __int16)v39);
    v7[10].i16[0] = IQuantizeH263(v6[5].i16[0], v39, 2 * (unsigned __int16)v39);
    v7[12].i16[0] = IQuantizeH263(v6[6].i16[0], v39, 2 * (unsigned __int16)v39);
    v23 = IQuantizeH263(v6[7].i16[0], v39, 2 * (unsigned __int16)v39);
    v16 = 7;
    v22 = 56;
  }
  v21 = v17;
LABEL_17:
  v7->i16[v22] = v23;
  *(_BYTE *)(a2 + 106) += 7;
  v19 = v35;
  v20 = v36;
LABEL_18:
  if (*(_BYTE *)(v20 + 137) == 1)
  {
    v25 = veor_s8(*v7, (int8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)v7->i8, *(int8x16_t *)v7->i8, 8uLL));
    if (((v25.i32[0] ^ v25.i32[1] ^ v7[2].u16[0] ^ ((*(_QWORD *)&v25 ^ HIDWORD(*(_QWORD *)&v25)) >> 16) ^ v7[4].u16[0] ^ v7[6].u16[0] ^ v7[8].u16[0] ^ v7[10].u16[0] ^ v7[12].u16[0] ^ v7[14].u16[0] ^ *(unsigned __int16 *)(a2 + 108)) & 1) != 0)
      v7[15].i16[3] ^= 1u;
  }
  IDct8x8smart(v6, (int16x8_t *)v7, *(unsigned __int8 *)(a3 + 969), *(unsigned __int8 *)(a2 + 106), v16, v21);
  v26 = *(_QWORD *)(a3 + 960);
  v27 = (_BYTE *)(v19 + 3);
  v28 = 9;
  result = 0;
  do
  {
    v29 = *(_BYTE *)(v26 + v6->i16[1]);
    v30 = *(_BYTE *)(v26 + v6->i16[2]);
    v31 = *(_BYTE *)(v26 + v6->i16[3]);
    *(v27 - 3) = *(_BYTE *)(v26 + v6->i16[0]);
    *(v27 - 2) = v29;
    *(v27 - 1) = v30;
    *v27 = v31;
    v32 = *(_BYTE *)(v26 + v6->i16[5]);
    v33 = *(_BYTE *)(v26 + v6->i16[6]);
    v34 = *(_BYTE *)(v26 + v6->i16[7]);
    v27[1] = *(_BYTE *)(v26 + v6->i16[4]);
    v27[2] = v32;
    v27[3] = v33;
    v27[4] = v34;
    --v28;
    v27 += v10;
    ++v6;
  }
  while (v28 > 1);
  return result;
}

uint64_t GrabBlockAndIQuantise(uint64_t a1, int a2, int a3, uint64_t a4)
{
  int v7;
  int v8;
  _OWORD *v9;
  __int16 *v10;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  char v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v34;
  uint64_t v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  char v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  unsigned int v43;
  unint64_t v44;
  _OWORD *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int dc_scaler;
  int v52;
  uint64_t result;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  unsigned __int8 *v61;
  int v62;
  unsigned __int8 *v63;
  int v64;
  __int16 *v65;
  __int16 v66;
  __int16 v67;
  unsigned __int8 *v68;
  unsigned __int8 *v69;
  int v70;
  uint64_t (*v72)(CBitStreamDeco *);

  v7 = *(unsigned __int8 *)(a1 + 107);
  v8 = *(_DWORD *)(a1 + 96);
  v9 = *(_OWORD **)(a1 + 120);
  v10 = *(__int16 **)(a1 + 128);
  v11 = *(_QWORD *)(a4 + 80);
  v70 = *(unsigned __int8 *)(*(_QWORD *)(a4 + 24) + 137);
  *(_WORD *)(a1 + 104) = 0;
  *(_BYTE *)(a1 + 106) = 0;
  if (a3)
  {
    v9[14] = 0u;
    v9[15] = 0u;
    v9[12] = 0u;
    v9[13] = 0u;
    v9[10] = 0u;
    v9[11] = 0u;
    v9[8] = 0u;
    v9[9] = 0u;
    v9[6] = 0u;
    v9[7] = 0u;
    v9[4] = 0u;
    v9[5] = 0u;
    v9[2] = 0u;
    v9[3] = 0u;
    *v9 = 0u;
    v9[1] = 0u;
    v12 = *(_DWORD *)(a1 + 100);
    if (v12 == 1)
    {
      v69 = (unsigned __int8 *)&scan2RowCOLwiseTable;
      v13 = (unsigned __int8 *)&scan2ColCOLwiseTable;
    }
    else if (v12 == 2)
    {
      v69 = (unsigned __int8 *)&scan2ColCOLwiseTable;
      v13 = (unsigned __int8 *)&scan2RowCOLwiseTable;
    }
    else
    {
      v69 = (unsigned __int8 *)&scan2ColZZTable;
      v13 = (unsigned __int8 *)&scan2RowZZTable;
    }
    v68 = v13;
    v14 = 1;
    *(_BYTE *)(a1 + 106) = 1;
    if (v7)
    {
      v15 = 0;
      v72 = HuffmanDecQCoefFastIntra;
      v62 = 28;
      v64 = 21;
      v61 = (unsigned __int8 *)&rmaxIntraTab;
    }
    else
    {
      result = (uint64_t)GrabDcFromBitStream(v10, a2, *(CIntraDcDecoder **)(a4 + 88), (CBitStreamDeco *)v11);
      if ((_DWORD)result)
        return result;
      v72 = HuffmanDecQCoefFastIntra;
      v62 = 28;
      v64 = 21;
      v61 = (unsigned __int8 *)&rmaxIntraTab;
      v15 = 1;
    }
    v63 = (unsigned __int8 *)&lmaxIntraTab;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v9[6] = 0u;
    v9[7] = 0u;
    v9[4] = 0u;
    v9[5] = 0u;
    v9[2] = 0u;
    v9[3] = 0u;
    v62 = 13;
    v64 = 41;
    v61 = (unsigned __int8 *)&rmaxInterTab;
    v63 = (unsigned __int8 *)&lmaxInterTab;
    *v9 = 0u;
    v9[1] = 0u;
    v68 = (unsigned __int8 *)&scan2RowZZTable;
    v69 = (unsigned __int8 *)&scan2ColZZTable;
    v72 = HuffmanDecQCoefFastInter;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 8) + a2))
    return 0;
  v65 = v10;
  v55 = a2;
  v56 = a4;
  v58 = a1;
  v59 = 0;
  v16 = 0;
  v17 = 0;
  v57 = (__int16)v8;
  if (a3)
    v18 = 55;
  else
    v18 = 25;
  v60 = v18;
  v66 = v8 + (v8 | 0xFFFE) + 1;
  v67 = 2 * v8;
  do
  {
    while (1)
    {
      v19 = v72((CBitStreamDeco *)v11);
      if (v19 != 64)
      {
        if (v19 == -99)
          return 4294965299;
        LODWORD(v20) = v19 >> 8;
        v21 = v19 & 0x80;
        LODWORD(v22) = v19 & 0x1F;
        goto LABEL_19;
      }
      v24 = *(_DWORD *)(v11 + 156);
      *(_DWORD *)(v11 + 156) = v24 + 1;
      v25 = *(_DWORD *)(v11 + 4);
      if (v25)
      {
        v26 = *(_DWORD *)v11;
        v27 = v25 - 1;
        *(_DWORD *)(v11 + 4) = v27;
        if (((v26 >> v27) & 1) != 0)
        {
          *(_DWORD *)(v11 + 156) = v24 + 2;
          if (!v27)
          {
            *(_DWORD *)(v11 + 4) = 31;
            v28 = *(_DWORD *)(v11 + 160);
            v29 = *(unsigned int *)(v11 + 8);
            if (v24 + 2 > v28 || 32 * (int)v29 > v28)
            {
              *(_DWORD *)v11 = 0;
              *(_DWORD *)(v11 + 8) = v29 + 1;
LABEL_49:
              v19 = v72((CBitStreamDeco *)v11);
              if (v19 == -99)
                return 4294965299;
              v22 = v19 & 0x1F;
              v20 = (v62 & ((char)v19 >> 7)) + v22;
              if (v20 > v60)
                return 4294965299;
              v21 = v19 & 0x80;
              LODWORD(v20) = v61[v20] + (v19 >> 8) + 1;
LABEL_19:
              if ((v19 & 0x40) != 0)
                v23 = -1;
              else
                v23 = 1;
              goto LABEL_61;
            }
            v26 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v29));
            *(_DWORD *)v11 = v26;
            *(_DWORD *)(v11 + 8) = v29 + 1;
            if ((v26 & 0x80000000) == 0)
              goto LABEL_49;
            *(_DWORD *)(v11 + 156) = v24 + 23;
            v30 = 31;
            goto LABEL_52;
          }
LABEL_44:
          v30 = v27 - 1;
          *(_DWORD *)(v11 + 4) = v27 - 1;
          if (((v26 >> (v27 - 1)) & 1) == 0)
            goto LABEL_49;
          v37 = v24 + 23;
          *(_DWORD *)(v11 + 156) = v24 + 23;
          if (v30 < 0x15)
          {
            v38 = 22 - v27;
            v39 = v27 + 10;
            *(_DWORD *)(v11 + 4) = v27 + 10;
            v40 = (v26 << (22 - v27)) & *(_DWORD *)(v11 + 108);
            v41 = *(_DWORD *)(v11 + 160);
            v42 = *(unsigned int *)(v11 + 8);
            if (v37 > v41 || 32 * (int)v42 > v41)
            {
              *(_DWORD *)(v11 + 8) = v42 + 1;
              *(_DWORD *)v11 = 0;
            }
            else
            {
              v43 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v42));
              *(_DWORD *)v11 = v43;
              *(_DWORD *)(v11 + 8) = v42 + 1;
              v40 |= *(_DWORD *)(v11 + 4 * v38 + 24) & (v43 >> v39);
            }
            goto LABEL_54;
          }
LABEL_52:
          *(_DWORD *)(v11 + 4) = v30 - 21;
          v40 = (v26 >> (v30 - 21)) & *(_DWORD *)(v11 + 108);
LABEL_54:
          if (v40 == -99)
            return 4294965299;
          LODWORD(v20) = (v40 >> 14) & 0x3F;
          v21 = v40 >> 20;
          if (((v40 >> 1) & 0x800) != 0)
            LODWORD(v22) = -(v40 >> 1) & 0xFFF;
          else
            LODWORD(v22) = (v40 >> 1) & 0xFFF;
          if (((v40 >> 1) & 0xFFF) < 0x800)
            v23 = 1;
          else
            v23 = -1;
          goto LABEL_61;
        }
      }
      else
      {
        *(_DWORD *)(v11 + 4) = 31;
        v31 = *(_DWORD *)(v11 + 160);
        v32 = *(unsigned int *)(v11 + 8);
        if (v24 + 1 > v31 || 32 * (int)v32 > v31)
        {
          *(_DWORD *)v11 = 0;
          *(_DWORD *)(v11 + 8) = v32 + 1;
        }
        else
        {
          v26 = bswap32(*(_DWORD *)(*(_QWORD *)(v11 + 16) + 4 * v32));
          *(_DWORD *)v11 = v26;
          *(_DWORD *)(v11 + 8) = v32 + 1;
          if ((v26 & 0x80000000) != 0)
          {
            *(_DWORD *)(v11 + 156) = v24 + 2;
            v27 = 31;
            goto LABEL_44;
          }
        }
      }
      v34 = v72((CBitStreamDeco *)v11);
      if (v34 == -99)
        return 4294965299;
      v20 = v34 >> 8;
      v35 = (v64 & ((char)v34 >> 7)) + v20;
      if (v35 > 0x51)
        return 4294965299;
      v21 = v34 & 0x80;
      v36 = v63[v35];
      v23 = (v34 & 0x40) != 0 ? -1 : 1;
      LODWORD(v22) = (v34 & 0x1F) + v36;
LABEL_61:
      v44 = v20 + (unint64_t)v15;
      if ((int)v44 > 63)
        return 4294965299;
      v45 = v9;
      ++v14;
      v46 = v68[v44];
      v47 = v69[v44];
      v17 -= (v17 - v46) & ((v17 - v46) >> 31);
      v16 -= (v16 - v47) & ((v16 - v47) >> 31);
      if (v70 == 1)
        break;
      v9 = v45;
      *((_WORD *)v45 + v44) = v23 * (v66 + v67 * v22);
      if (a3)
        v65[v44] = v23 * v22;
      v15 = v44 + 1;
      if (v21)
        goto LABEL_88;
    }
    if ((_DWORD)v22)
    {
      if (a3)
      {
        if ((_DWORD)v44)
        {
          v48 = v57 * v22 * *(unsigned __int8 *)(v56 + v44 + 390);
          v49 = v23 * ((v48 + (v48 < 0 ? 7 : 0)) >> 3);
        }
        else
        {
          v54 = v21;
          dc_scaler = Get_dc_scaler(v57, v55);
          v21 = v54;
          v49 = (unsigned __int16)v23 * (_DWORD)v22 * dc_scaler;
        }
        v65[v44] = v23 * v22;
        if (v46 | v47)
          v52 = v49;
        else
          v52 = 0;
        v59 ^= v52;
      }
      else
      {
        v50 = ((2 * v22) | 1) * v57 * *(unsigned __int8 *)(v56 + v44 + 454);
        v49 = v23 * ((v50 + (v50 < 0 ? 0xF : 0)) >> 4);
        v59 ^= v49;
      }
    }
    else
    {
      LOWORD(v49) = 0;
    }
    v9 = v45;
    *((_WORD *)v45 + v44) = v49;
    v15 = v44 + 1;
  }
  while (!v21);
  if (a3 || (v59 & 1) == 0)
  {
    if (a3)
      *(_WORD *)(v58 + 108) = v59;
  }
  else
  {
    *((_WORD *)v45 + 63) ^= 1u;
  }
LABEL_88:
  result = 0;
  *(_BYTE *)(v58 + 104) = v17;
  *(_BYTE *)(v58 + 105) = v16;
  *(_BYTE *)(v58 + 106) = v14;
  return result;
}

CIntraDcDecoder *GrabDcFromBitStream(__int16 *a1, int a2, CIntraDcDecoder *this, CBitStreamDeco *a4)
{
  if (a2 > 3)
    return CIntraDcDecoder::GrabDcChrominance(this, a1, a4);
  else
    return CIntraDcDecoder::GrabDcLuminance(this, a1, a4);
}

uint64_t DecodeBlockIntraDataPartitioned(_QWORD *a1, __int16 *a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5, int a6, int a7, int a8, int a9, char a10, int a11, uint64_t a12, CBitStreamDeco *a13)
{
  int v18;
  char v19;
  int v20;
  int v21;
  int v22;
  uint64_t result;
  uint64_t v24;
  uint64_t *v25;
  unsigned int v26;
  uint64_t v27;
  unsigned __int8 v31[2];

  v18 = DetermineIntraPredictionMode(*(_QWORD *)(a12 + 584), a6, a7);
  v19 = v18;
  v20 = *(unsigned __int8 *)(a12 + 968);
  if (v18 == 5)
    v21 = 1;
  else
    v21 = 2 * (v18 == 6);
  *(_WORD *)v31 = 0;
  if (a11)
  {
    *(_OWORD *)(a3 + 96) = 0uLL;
    *(_OWORD *)(a3 + 112) = 0uLL;
    *(_OWORD *)(a3 + 64) = 0uLL;
    *(_OWORD *)(a3 + 80) = 0uLL;
    *(_OWORD *)(a3 + 32) = 0uLL;
    *(_OWORD *)(a3 + 48) = 0uLL;
    *(_OWORD *)a3 = 0uLL;
    *(_OWORD *)(a3 + 16) = 0uLL;
    if (a10)
    {
      v22 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    *(_OWORD *)(a3 + 112) = 0uLL;
    *(_OWORD *)(a3 + 98) = 0uLL;
    *(_OWORD *)(a3 + 82) = 0uLL;
    *(_OWORD *)(a3 + 66) = 0uLL;
    *(_OWORD *)(a3 + 50) = 0uLL;
    *(_OWORD *)(a3 + 34) = 0uLL;
    *(_OWORD *)(a3 + 18) = 0uLL;
    *(_OWORD *)(a3 + 2) = 0uLL;
    if (a10)
    {
      v22 = 1;
LABEL_9:
      result = GrabAcFromBitStreamIntra((__int16 *)a3, v22, v21, &v31[1], v31, v20, a13);
      if ((_DWORD)result)
        return result;
    }
  }
  ScanConvertWhatever2Raster(a2, (_WORD *)a3, v21);
  ReconAndUpdate(*(_QWORD *)(a12 + 584), a2, v19, a6, a7, a9, a8);
  v24 = *(_QWORD *)(a12 + 24);
  if (*(_BYTE *)(v24 + 137) == 1)
    IQuantizeBlockMPEG((uint64_t)a2, a8, 1, a7, a12 + 262);
  else
    IQuantizeBlockH263Opt((uint64_t)a2, a8, 1, *(unsigned __int8 *)(v24 + 21), a7);
  IDct8x8Yoyo(a4, a2, 7u, *(unsigned __int8 **)(a12 + 960));
  v25 = (uint64_t *)(a4 + 8);
  v26 = -2;
  do
  {
    v27 = *v25;
    *a1 = *(v25 - 1);
    *(_QWORD *)((char *)a1 + (a5 & 0xFFFFFFFC)) = v27;
    a1 = (_QWORD *)((char *)a1 + 4 * (a5 >> 1));
    v25 += 2;
    v26 += 2;
  }
  while (v26 < 6);
  return 0;
}

uint64_t DecodeBlockInterDataPartitioned(uint64_t a1, uint64_t a2, __int16 *a3, int a4, int a5, int a6, uint64_t a7)
{
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  BOOL v41;
  int v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  int v63;
  int v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  int v68;
  unsigned int v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v76;

  v11 = 0;
  v12 = *(_QWORD *)(a7 + 80);
  v13 = *(unsigned __int8 *)(a7 + 968);
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  while (1)
  {
    if (v13)
      v14 = RVLCDecQCoef(v12, (uint64_t)&MPEG4_RVLCTable_Inter);
    else
      v14 = HuffmanDecQCoefInter((CBitStreamDeco *)v12);
    if (v14 == 64)
    {
      v18 = *(_DWORD *)(v12 + 156);
      v19 = v18 + 1;
      *(_DWORD *)(v12 + 156) = v18 + 1;
      v20 = *(unsigned int *)(v12 + 4);
      if (v13)
      {
        if ((_DWORD)v20)
        {
          v21 = *(_DWORD *)v12;
          v22 = v20 - 1;
          *(_DWORD *)(v12 + 4) = v20 - 1;
          v15 = (v21 >> (v20 - 1)) & 1;
          *(_DWORD *)(v12 + 156) = v18 + 7;
          if (v20 <= 6)
          {
            v23 = 7 - v20;
            v24 = v20 + 25;
            *(_DWORD *)(v12 + 4) = v24;
            v17 = *(_DWORD *)(v12 + 48) & (v21 << v23);
            v25 = *(_DWORD *)(v12 + 160);
            v26 = *(unsigned int *)(v12 + 8);
            if (v18 + 7 > v25 || 32 * (int)v26 > v25)
            {
              v21 = 0;
              *(_DWORD *)(v12 + 8) = v26 + 1;
              *(_DWORD *)v12 = 0;
            }
            else
            {
              v21 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v26));
              *(_DWORD *)v12 = v21;
              *(_DWORD *)(v12 + 8) = v26 + 1;
              v17 |= *(_DWORD *)(v12 + 4 * v23 + 24) & (v21 >> v24);
            }
            goto LABEL_45;
          }
        }
        else
        {
          v21 = 0;
          *(_DWORD *)(v12 + 4) = 31;
          v32 = *(_DWORD *)(v12 + 160);
          v33 = *(unsigned int *)(v12 + 8);
          if (v19 > v32)
          {
            v15 = 0;
          }
          else
          {
            v15 = 0;
            if (32 * (int)v33 <= v32)
            {
              v21 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v33));
              v15 = v21 >> 31;
            }
          }
          *(_DWORD *)v12 = v21;
          *(_DWORD *)(v12 + 8) = v33 + 1;
          v22 = 31;
        }
        *(_DWORD *)(v12 + 156) = v18 + 8;
        v24 = v22 - 6;
        v41 = v22 == 6;
        *(_DWORD *)(v12 + 4) = v22 - 6;
        v17 = *(_DWORD *)(v12 + 48) & (v21 >> (v22 - 6));
        if (v41)
        {
          v21 = 0;
          *(_DWORD *)(v12 + 4) = 31;
          v47 = *(_DWORD *)(v12 + 160);
          v48 = *(unsigned int *)(v12 + 8);
          if (v18 + 8 <= v47 && 32 * (int)v48 <= v47)
            v21 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v48));
          *(_DWORD *)v12 = v21;
          *(_DWORD *)(v12 + 8) = v48 + 1;
          v42 = 31;
          goto LABEL_54;
        }
LABEL_45:
        v42 = v24 - 1;
        *(_DWORD *)(v12 + 4) = v24 - 1;
        *(_DWORD *)(v12 + 156) = v18 + 19;
        if ((v24 - 1) <= 0xA)
        {
          v43 = 12 - v24;
          v44 = v24 + 20;
          *(_DWORD *)(v12 + 4) = v24 + 20;
          v16 = *(_DWORD *)(v12 + 68) & (v21 << (12 - v24));
          v45 = *(_DWORD *)(v12 + 160);
          v46 = *(unsigned int *)(v12 + 8);
          v21 = 0;
          if (v18 + 19 <= v45 && 32 * (int)v46 <= v45)
          {
            v21 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v46));
            v16 |= (v21 >> v44) & *(_DWORD *)(v12 + 4 * v43 + 24);
          }
          *(_DWORD *)(v12 + 8) = v46 + 1;
          *(_DWORD *)v12 = v21;
          goto LABEL_55;
        }
LABEL_54:
        *(_DWORD *)(v12 + 156) = v18 + 20;
        v44 = v42 - 11;
        *(_DWORD *)(v12 + 4) = v44;
        v16 = *(_DWORD *)(v12 + 68) & (v21 >> v44);
        if (!v44)
        {
          v21 = 0;
          *(_DWORD *)(v12 + 4) = 31;
          v57 = *(_DWORD *)(v12 + 160);
          v58 = *(unsigned int *)(v12 + 8);
          if (v18 + 20 <= v57 && 32 * (int)v58 <= v57)
            v21 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v58));
          *(_DWORD *)v12 = v21;
          *(_DWORD *)(v12 + 8) = v58 + 1;
          v49 = 27;
          goto LABEL_68;
        }
LABEL_55:
        *(_DWORD *)(v12 + 4) = v44 - 1;
        *(_DWORD *)(v12 + 156) = v18 + 24;
        if ((v44 - 1) > 3)
        {
          v52 = v18 + 25;
          *(_DWORD *)(v12 + 156) = v18 + 25;
          v49 = v44 - 5;
          *(_DWORD *)(v12 + 4) = v49;
          if (!v49)
          {
            *(_DWORD *)(v12 + 4) = 31;
            v53 = *(_DWORD *)(v12 + 160);
            v54 = *(unsigned int *)(v12 + 8);
            if (v52 > v53 || 32 * (int)v54 > v53)
            {
              *(_DWORD *)v12 = 0;
              *(_DWORD *)(v12 + 8) = v54 + 1;
              goto LABEL_72;
            }
            v55 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v54));
            *(_DWORD *)v12 = v55;
            *(_DWORD *)(v12 + 8) = v54 + 1;
            v56 = v55 >> 31;
            goto LABEL_70;
          }
LABEL_69:
          *(_DWORD *)(v12 + 4) = v49 - 1;
          v56 = (v21 >> (v49 - 1)) & 1;
LABEL_70:
          if (v56)
            v16 = -v16;
          goto LABEL_72;
        }
        v21 = 0;
        v49 = v44 + 27;
        *(_DWORD *)(v12 + 4) = v49;
        v50 = *(_DWORD *)(v12 + 160);
        v51 = *(unsigned int *)(v12 + 8);
        if (v18 + 24 <= v50 && 32 * (int)v51 <= v50)
          v21 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v51));
        *(_DWORD *)(v12 + 8) = v51 + 1;
        *(_DWORD *)v12 = v21;
LABEL_68:
        *(_DWORD *)(v12 + 156) = v18 + 25;
        goto LABEL_69;
      }
      if ((_DWORD)v20)
      {
        v27 = *(_DWORD *)v12;
        v28 = v20 - 1;
        *(_DWORD *)(v12 + 4) = v20 - 1;
        if (((v27 >> (v20 - 1)) & 1) == 0)
          goto LABEL_39;
        *(_DWORD *)(v12 + 156) = v18 + 2;
        if ((_DWORD)v20 == 1)
        {
          *(_DWORD *)(v12 + 4) = 31;
          v29 = *(_DWORD *)(v12 + 160);
          v30 = *(unsigned int *)(v12 + 8);
          if (v18 + 2 > v29 || 32 * (int)v30 > v29)
          {
            *(_DWORD *)v12 = 0;
            *(_DWORD *)(v12 + 8) = v30 + 1;
          }
          else
          {
            v27 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v30));
            *(_DWORD *)v12 = v27;
            *(_DWORD *)(v12 + 8) = v30 + 1;
            if ((v27 & 0x80000000) != 0)
            {
              v15 = (v27 >> 30) & 1;
              v31 = 30;
              goto LABEL_87;
            }
          }
          goto LABEL_77;
        }
      }
      else
      {
        *(_DWORD *)(v12 + 4) = 31;
        v34 = *(_DWORD *)(v12 + 160);
        v35 = *(unsigned int *)(v12 + 8);
        if (v19 > v34 || 32 * (int)v35 > v34)
        {
          *(_DWORD *)v12 = 0;
          *(_DWORD *)(v12 + 8) = v35 + 1;
LABEL_39:
          v40 = HuffmanDecQCoefInter((CBitStreamDeco *)v12);
          v15 = (v40 >> 7) & 1;
          v17 = v40 >> 8;
          if ((((v40 & 0x1F) != 0) & ((v40 & 0x40) >> 6)) != 0)
            v16 = -((v40 & 0x1F) + lmaxInterTab[41 * v15 + (v40 >> 8)]);
          else
            LOWORD(v16) = (v40 & 0x1F) + lmaxInterTab[41 * v15 + (v40 >> 8)];
          goto LABEL_72;
        }
        v27 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v35));
        *(_DWORD *)v12 = v27;
        *(_DWORD *)(v12 + 8) = v35 + 1;
        if ((v27 & 0x80000000) == 0)
          goto LABEL_39;
        *(_DWORD *)(v12 + 156) = v18 + 2;
        v28 = 31;
      }
      *(_DWORD *)(v12 + 4) = v28 - 1;
      if (((v27 >> (v28 - 1)) & 1) != 0)
      {
        *(_DWORD *)(v12 + 156) = v18 + 3;
        if (v28 == 1)
        {
          v27 = 0;
          *(_DWORD *)(v12 + 4) = 31;
          v61 = *(_DWORD *)(v12 + 160);
          v62 = *(unsigned int *)(v12 + 8);
          if (v18 + 3 > v61)
          {
            v15 = 0;
          }
          else
          {
            v15 = 0;
            if (32 * (int)v62 <= v61)
            {
              v27 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v62));
              v15 = v27 >> 31;
            }
          }
          *(_DWORD *)v12 = v27;
          *(_DWORD *)(v12 + 8) = v62 + 1;
          v31 = 31;
        }
        else
        {
          v31 = v28 - 2;
          v15 = (v27 >> (v28 - 2)) & 1;
          *(_DWORD *)(v12 + 156) = v18 + 9;
          if ((v28 - 2) <= 5)
          {
            v36 = 8 - v28;
            v37 = v28 + 24;
            *(_DWORD *)(v12 + 4) = v28 + 24;
            v17 = *(_DWORD *)(v12 + 48) & (v27 << (8 - v28));
            v38 = *(_DWORD *)(v12 + 160);
            v39 = *(unsigned int *)(v12 + 8);
            if (v18 + 9 > v38 || 32 * (int)v39 > v38)
            {
              v27 = 0;
              *(_DWORD *)(v12 + 8) = v39 + 1;
              *(_DWORD *)v12 = 0;
            }
            else
            {
              v27 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v39));
              *(_DWORD *)v12 = v27;
              *(_DWORD *)(v12 + 8) = v39 + 1;
              v17 |= *(_DWORD *)(v12 + 4 * v36 + 24) & (v27 >> v37);
            }
            goto LABEL_88;
          }
        }
LABEL_87:
        v63 = *(_DWORD *)(v12 + 48);
        *(_DWORD *)(v12 + 156) = v18 + 10;
        v37 = v31 - 6;
        v17 = (v27 >> v37) & v63;
        if (!v37)
        {
          v27 = 0;
          *(_DWORD *)(v12 + 4) = 31;
          v71 = *(_DWORD *)(v12 + 160);
          v72 = *(unsigned int *)(v12 + 8);
          if (v18 + 10 <= v71 && 32 * (int)v72 <= v71)
            v27 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v72));
          *(_DWORD *)v12 = v27;
          *(_DWORD *)(v12 + 8) = v72 + 1;
          v64 = 31;
          goto LABEL_97;
        }
LABEL_88:
        v64 = v37 - 1;
        *(_DWORD *)(v12 + 156) = v18 + 22;
        if ((v37 - 1) <= 0xB)
        {
          v65 = 0;
          v66 = 13 - v37;
          v67 = v37 + 19;
          *(_DWORD *)(v12 + 4) = v67;
          v68 = *(_DWORD *)(v12 + 72) & (v27 << v66);
          v69 = *(_DWORD *)(v12 + 160);
          v70 = *(unsigned int *)(v12 + 8);
          if (v18 + 22 <= v69 && 32 * (int)v70 <= v69)
          {
            v65 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v70));
            v68 |= (v65 >> v67) & *(_DWORD *)(v12 + 4 * v66 + 24);
          }
          *(_DWORD *)(v12 + 8) = v70 + 1;
          *(_DWORD *)v12 = v65;
          *(_DWORD *)(v12 + 156) = v18 + 23;
          goto LABEL_98;
        }
LABEL_97:
        v73 = *(_DWORD *)(v12 + 72);
        v74 = v18 + 23;
        *(_DWORD *)(v12 + 156) = v18 + 23;
        v67 = v64 - 12;
        v68 = v73 & (v27 >> (v64 - 12));
        if (v64 == 12)
        {
          *(_DWORD *)(v12 + 4) = 31;
          v75 = *(_DWORD *)(v12 + 160);
          v76 = *(unsigned int *)(v12 + 8);
          if (v74 > v75 || 32 * (int)v76 > v75)
            *(_DWORD *)v12 = 0;
          else
            *(_DWORD *)v12 = bswap32(*(_DWORD *)(*(_QWORD *)(v12 + 16) + 4 * v76));
          *(_DWORD *)(v12 + 8) = v76 + 1;
          goto LABEL_104;
        }
LABEL_98:
        *(_DWORD *)(v12 + 4) = v67 - 1;
LABEL_104:
        if ((v68 & 0x800) != 0)
          LOWORD(v16) = v68 | 0xF000;
        else
          LOWORD(v16) = v68;
        goto LABEL_72;
      }
LABEL_77:
      v60 = HuffmanDecQCoefInter((CBitStreamDeco *)v12);
      v15 = (v60 >> 7) & 1;
      if ((v60 & 0x40) != 0)
        v16 = -(v60 & 0x1F);
      else
        LOWORD(v16) = v60 & 0x1F;
      v17 = rmaxInterTab[13 * v15 + (v60 & 0x1F)] + (v60 >> 8) + 1;
      goto LABEL_72;
    }
    if (v14 == 65437)
      return 4294965299;
    v15 = (v14 >> 7) & 1;
    if ((v14 & 0x40) != 0)
      v16 = -(v14 & 0x1F);
    else
      LOWORD(v16) = v14 & 0x1F;
    v17 = v14 >> 8;
LABEL_72:
    v59 = v11 + (unsigned __int16)v17;
    if (v59 >= 63)
      break;
    v11 = v59 + 1;
    *(_WORD *)(a2 + 2 * v59) = v16;
    if (v15)
      goto LABEL_109;
  }
  if (v59 != 63)
    return 4294965299;
  *(_WORD *)(a2 + 126) = v16;
LABEL_109:
  ScanConvertZigZag2Raster(a3, (_WORD *)a2);
  if (*(_BYTE *)(*(_QWORD *)(a7 + 24) + 137) == 1)
    IQuantizeBlockMPEG((uint64_t)a3, a6, 0, a5, a7 + 326);
  else
    IQuantizeBlockH263(a3, a6, 0);
  IDct8x8Yoyo((int16x8_t *)a2, a3, 7u);
  AddResidue_8x8(a1, a4, (__int16 *)a2, *(const unsigned __int8 **)(a7 + 960));
  return 0;
}

uint64_t GrabAcFromBitStreamIntra(__int16 *a1, int a2, int a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6, CBitStreamDeco *a7)
{
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  int v39;
  unsigned int v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  BOOL v45;
  int v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  uint64_t v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t v68;
  int v69;
  int v70;
  unsigned int v71;
  int v72;
  int v73;
  unsigned int v74;
  uint64_t v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  uint64_t v82;

  v13 = (unsigned __int8 *)&scan2ColCOLwiseTable;
  v14 = (unsigned __int8 *)&scan2RowCOLwiseTable;
  if (a3 == 1)
  {
    v14 = (unsigned __int8 *)&scan2ColCOLwiseTable;
    v13 = (unsigned __int8 *)&scan2RowCOLwiseTable;
  }
  if (a3)
    v15 = v14;
  else
    v15 = (unsigned __int8 *)&scan2RowZZTable;
  if (a3)
    v16 = v13;
  else
    v16 = (unsigned __int8 *)&scan2ColZZTable;
  while (1)
  {
    if (a6)
      v17 = RVLCDecQCoef((uint64_t)a7, (uint64_t)&MPEG4_RVLCTable_Intra);
    else
      v17 = HuffmanDecQCoefIntra(a7);
    if (v17 == 64)
    {
      v21 = *((_DWORD *)a7 + 39);
      v22 = v21 + 1;
      *((_DWORD *)a7 + 39) = v21 + 1;
      v23 = *((_DWORD *)a7 + 1);
      if (a6)
      {
        if (v23)
        {
          v24 = *(_DWORD *)a7;
          v25 = v23 - 1;
          *((_DWORD *)a7 + 1) = v23 - 1;
          v18 = (v24 >> (v23 - 1)) & 1;
          *((_DWORD *)a7 + 39) = v21 + 7;
          if (v23 <= 6)
          {
            v26 = 7 - v23;
            v27 = v23 + 25;
            *((_DWORD *)a7 + 1) = v27;
            v20 = (v24 << v26) & *((_DWORD *)a7 + 12);
            v28 = *((_DWORD *)a7 + 40);
            v29 = *((unsigned int *)a7 + 2);
            if (v21 + 7 > v28 || 32 * (int)v29 > v28)
            {
              v24 = 0;
              *((_DWORD *)a7 + 2) = v29 + 1;
              *(_DWORD *)a7 = 0;
            }
            else
            {
              v24 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v29));
              *(_DWORD *)a7 = v24;
              *((_DWORD *)a7 + 2) = v29 + 1;
              v20 |= *((_DWORD *)a7 + v26 + 6) & (v24 >> v27);
            }
            goto LABEL_52;
          }
        }
        else
        {
          v24 = 0;
          *((_DWORD *)a7 + 1) = 31;
          v35 = *((_DWORD *)a7 + 40);
          v36 = *((unsigned int *)a7 + 2);
          if (v22 > v35)
          {
            v18 = 0;
          }
          else
          {
            v18 = 0;
            if (32 * (int)v36 <= v35)
            {
              v24 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v36));
              v18 = v24 >> 31;
            }
          }
          *(_DWORD *)a7 = v24;
          *((_DWORD *)a7 + 2) = v36 + 1;
          v25 = 31;
        }
        *((_DWORD *)a7 + 39) = v21 + 8;
        v27 = v25 - 6;
        v45 = v25 == 6;
        *((_DWORD *)a7 + 1) = v25 - 6;
        v20 = (v24 >> (v25 - 6)) & *((_DWORD *)a7 + 12);
        if (v45)
        {
          v24 = 0;
          *((_DWORD *)a7 + 1) = 31;
          v51 = *((_DWORD *)a7 + 40);
          v52 = *((unsigned int *)a7 + 2);
          if (v21 + 8 <= v51 && 32 * (int)v52 <= v51)
            v24 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v52));
          *(_DWORD *)a7 = v24;
          *((_DWORD *)a7 + 2) = v52 + 1;
          v46 = 31;
          goto LABEL_60;
        }
LABEL_52:
        v46 = v27 - 1;
        *((_DWORD *)a7 + 1) = v27 - 1;
        *((_DWORD *)a7 + 39) = v21 + 19;
        if (v27 - 1 <= 0xA)
        {
          v47 = 12 - v27;
          v48 = v27 + 20;
          *((_DWORD *)a7 + 1) = v27 + 20;
          v19 = (v24 << (12 - v27)) & *((_DWORD *)a7 + 17);
          v49 = *((_DWORD *)a7 + 40);
          v50 = *((unsigned int *)a7 + 2);
          if (v21 + 19 > v49 || 32 * (int)v50 > v49)
          {
            v24 = 0;
            *((_DWORD *)a7 + 2) = v50 + 1;
            *(_DWORD *)a7 = 0;
          }
          else
          {
            v24 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v50));
            *(_DWORD *)a7 = v24;
            *((_DWORD *)a7 + 2) = v50 + 1;
            v19 |= *((_DWORD *)a7 + v47 + 6) & (v24 >> v48);
          }
          goto LABEL_66;
        }
LABEL_60:
        *((_DWORD *)a7 + 39) = v21 + 20;
        v48 = v46 - 11;
        *((_DWORD *)a7 + 1) = v48;
        v19 = (v24 >> v48) & *((_DWORD *)a7 + 17);
        if (!v48)
        {
          v24 = 0;
          *((_DWORD *)a7 + 1) = 31;
          v53 = *((_DWORD *)a7 + 40);
          v54 = *((unsigned int *)a7 + 2);
          if (v21 + 20 <= v53 && 32 * (int)v54 <= v53)
            v24 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v54));
          *(_DWORD *)a7 = v24;
          *((_DWORD *)a7 + 2) = v54 + 1;
          v55 = 27;
          goto LABEL_71;
        }
LABEL_66:
        *((_DWORD *)a7 + 1) = v48 - 1;
        *((_DWORD *)a7 + 39) = v21 + 24;
        if ((v48 - 1) > 3)
        {
          v58 = v21 + 25;
          *((_DWORD *)a7 + 39) = v21 + 25;
          v55 = v48 - 5;
          *((_DWORD *)a7 + 1) = v55;
          if (!v55)
          {
            *((_DWORD *)a7 + 1) = 31;
            v63 = *((_DWORD *)a7 + 40);
            v64 = *((unsigned int *)a7 + 2);
            if (v58 > v63 || 32 * (int)v64 > v63)
            {
              *(_DWORD *)a7 = 0;
              *((_DWORD *)a7 + 2) = v64 + 1;
              goto LABEL_76;
            }
            v65 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v64));
            *(_DWORD *)a7 = v65;
            *((_DWORD *)a7 + 2) = v64 + 1;
            v59 = v65 >> 31;
            goto LABEL_74;
          }
LABEL_73:
          *((_DWORD *)a7 + 1) = v55 - 1;
          v59 = (v24 >> (v55 - 1)) & 1;
LABEL_74:
          if (v59)
            v19 = -v19;
          goto LABEL_76;
        }
        v24 = 0;
        v55 = v48 + 27;
        *((_DWORD *)a7 + 1) = v55;
        v56 = *((_DWORD *)a7 + 40);
        v57 = *((unsigned int *)a7 + 2);
        if (v21 + 24 <= v56 && 32 * (int)v57 <= v56)
          v24 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v57));
        *((_DWORD *)a7 + 2) = v57 + 1;
        *(_DWORD *)a7 = v24;
LABEL_71:
        *((_DWORD *)a7 + 39) = v21 + 25;
        goto LABEL_73;
      }
      if (v23)
      {
        v30 = *(_DWORD *)a7;
        v31 = v23 - 1;
        *((_DWORD *)a7 + 1) = v23 - 1;
        if (((v30 >> (v23 - 1)) & 1) == 0)
          goto LABEL_46;
        *((_DWORD *)a7 + 39) = v21 + 2;
        if (v23 == 1)
        {
          *((_DWORD *)a7 + 1) = 31;
          v32 = *((_DWORD *)a7 + 40);
          v33 = *((unsigned int *)a7 + 2);
          if (v21 + 2 > v32 || 32 * (int)v33 > v32)
          {
            *(_DWORD *)a7 = 0;
            *((_DWORD *)a7 + 2) = v33 + 1;
          }
          else
          {
            v30 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v33));
            *(_DWORD *)a7 = v30;
            *((_DWORD *)a7 + 2) = v33 + 1;
            if ((v30 & 0x80000000) != 0)
            {
              v34 = 31;
              goto LABEL_40;
            }
          }
          goto LABEL_90;
        }
      }
      else
      {
        *((_DWORD *)a7 + 1) = 31;
        v37 = *((_DWORD *)a7 + 40);
        v38 = *((unsigned int *)a7 + 2);
        if (v22 > v37 || 32 * (int)v38 > v37)
        {
          *(_DWORD *)a7 = 0;
          *((_DWORD *)a7 + 2) = v38 + 1;
LABEL_46:
          v44 = HuffmanDecQCoefIntra(a7);
          v18 = (v44 >> 7) & 1;
          v20 = v44 >> 8;
          if ((((v44 & 0x1F) != 0) & ((v44 & 0x40) >> 6)) != 0)
            v19 = -((v44 & 0x1F) + lmaxIntraTab[21 * v18 + (v44 >> 8)]);
          else
            LOWORD(v19) = (v44 & 0x1F) + lmaxIntraTab[21 * v18 + (v44 >> 8)];
          goto LABEL_76;
        }
        v30 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v38));
        *(_DWORD *)a7 = v30;
        *((_DWORD *)a7 + 2) = v38 + 1;
        if ((v30 & 0x80000000) == 0)
          goto LABEL_46;
        *((_DWORD *)a7 + 39) = v21 + 2;
        v31 = 31;
      }
      v34 = v31 - 1;
      *((_DWORD *)a7 + 1) = v31 - 1;
      if (((v30 >> (v31 - 1)) & 1) != 0)
      {
        *((_DWORD *)a7 + 39) = v21 + 3;
        if (v31 == 1)
        {
          v30 = 0;
          *((_DWORD *)a7 + 1) = 31;
          v67 = *((_DWORD *)a7 + 40);
          v68 = *((unsigned int *)a7 + 2);
          if (v21 + 3 > v67)
          {
            v18 = 0;
          }
          else
          {
            v18 = 0;
            if (32 * (int)v68 <= v67)
            {
              v30 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v68));
              v18 = v30 >> 31;
            }
          }
          *(_DWORD *)a7 = v30;
          *((_DWORD *)a7 + 2) = v68 + 1;
          v39 = 31;
          goto LABEL_100;
        }
LABEL_40:
        v39 = v34 - 1;
        v18 = (v30 >> (v34 - 1)) & 1;
        *((_DWORD *)a7 + 39) = v21 + 9;
        if ((v34 - 1) <= 5)
        {
          v40 = 7 - v34;
          v41 = v34 + 25;
          *((_DWORD *)a7 + 1) = v41;
          v20 = (v30 << v40) & *((_DWORD *)a7 + 12);
          v42 = *((_DWORD *)a7 + 40);
          v43 = *((unsigned int *)a7 + 2);
          if (v21 + 9 > v42 || 32 * (int)v43 > v42)
          {
            v30 = 0;
            *((_DWORD *)a7 + 2) = v43 + 1;
            *(_DWORD *)a7 = 0;
          }
          else
          {
            v30 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v43));
            *(_DWORD *)a7 = v30;
            *((_DWORD *)a7 + 2) = v43 + 1;
            v20 |= *((_DWORD *)a7 + v40 + 6) & (v30 >> v41);
          }
          goto LABEL_101;
        }
LABEL_100:
        v69 = *((_DWORD *)a7 + 12);
        *((_DWORD *)a7 + 39) = v21 + 10;
        v41 = v39 - 6;
        v45 = v39 == 6;
        v20 = (v30 >> (v39 - 6)) & v69;
        if (v45)
        {
          v30 = 0;
          *((_DWORD *)a7 + 1) = 31;
          v77 = *((_DWORD *)a7 + 40);
          v78 = *((unsigned int *)a7 + 2);
          if (v21 + 10 <= v77 && 32 * (int)v78 <= v77)
            v30 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v78));
          *(_DWORD *)a7 = v30;
          *((_DWORD *)a7 + 2) = v78 + 1;
          v70 = 31;
          goto LABEL_109;
        }
LABEL_101:
        v70 = v41 - 1;
        *((_DWORD *)a7 + 39) = v21 + 22;
        if ((v41 - 1) <= 0xB)
        {
          v71 = 13 - v41;
          v72 = v41 + 19;
          *((_DWORD *)a7 + 1) = v72;
          v73 = (v30 << v71) & *((_DWORD *)a7 + 18);
          v74 = *((_DWORD *)a7 + 40);
          v75 = *((unsigned int *)a7 + 2);
          if (v21 + 22 > v74 || 32 * (int)v75 > v74)
          {
            *((_DWORD *)a7 + 2) = v75 + 1;
            *(_DWORD *)a7 = 0;
          }
          else
          {
            v76 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v75));
            *(_DWORD *)a7 = v76;
            *((_DWORD *)a7 + 2) = v75 + 1;
            v73 |= *((_DWORD *)a7 + v71 + 6) & (v76 >> v72);
          }
          *((_DWORD *)a7 + 39) = v21 + 23;
          goto LABEL_115;
        }
LABEL_109:
        v79 = *((_DWORD *)a7 + 18);
        v80 = v21 + 23;
        *((_DWORD *)a7 + 39) = v21 + 23;
        v72 = v70 - 12;
        v73 = (v30 >> (v70 - 12)) & v79;
        if (v70 == 12)
        {
          *((_DWORD *)a7 + 1) = 31;
          v81 = *((_DWORD *)a7 + 40);
          v82 = *((unsigned int *)a7 + 2);
          if (v80 > v81 || 32 * (int)v82 > v81)
            *(_DWORD *)a7 = 0;
          else
            *(_DWORD *)a7 = bswap32(*(_DWORD *)(*((_QWORD *)a7 + 2) + 4 * v82));
          *((_DWORD *)a7 + 2) = v82 + 1;
          goto LABEL_118;
        }
LABEL_115:
        *((_DWORD *)a7 + 1) = v72 - 1;
LABEL_118:
        if ((v73 & 0x800) != 0)
          LOWORD(v19) = v73 | 0xF000;
        else
          LOWORD(v19) = v73;
        goto LABEL_76;
      }
LABEL_90:
      v66 = HuffmanDecQCoefIntra(a7);
      v18 = (v66 >> 7) & 1;
      if ((v66 & 0x40) != 0)
        v19 = -(v66 & 0x1F);
      else
        LOWORD(v19) = v66 & 0x1F;
      v20 = rmaxIntraTab[28 * v18 + (v66 & 0x1F)] + (v66 >> 8) + 1;
      goto LABEL_76;
    }
    if (v17 == 65437)
      return 4294965299;
    v18 = (v17 >> 7) & 1;
    if ((v17 & 0x40) != 0)
      v19 = -(v17 & 0x1F);
    else
      LOWORD(v19) = v17 & 0x1F;
    v20 = v17 >> 8;
LABEL_76:
    v60 = a2 + (unsigned __int16)v20;
    if (v60 >= 63)
      break;
LABEL_79:
    v61 = v15[v60];
    v62 = v16[v60];
    if (v61 > *a4)
      *a4 = v61;
    if (v62 > *a5)
      *a5 = v62;
    a1[v60] = v19;
    a2 = v60 + 1;
    if (v18)
      return 0;
  }
  if (v60 == 63)
  {
    v18 = 1;
    goto LABEL_79;
  }
  return 4294965299;
}

uint64_t InitInstanceGlobalsDecoGenenral(uint64_t *a1, int a2, int a3, uint64_t a4)
{
  __int16 v5;
  __int16 v6;
  uint64_t v8;
  _QWORD *v10;
  uint64_t v11;
  unsigned __int16 v12;
  uint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CIntraDcDecoder *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v6 = a2;
  v8 = *a1;
  if (*a1)
  {
    if (*(unsigned __int16 *)(v8 + 96) == a2 && *(unsigned __int16 *)(v8 + 98) == a3)
      return 0;
    KillInstanceGlobalsDeco(a1);
    if (*a1)
      return 0;
  }
  v10 = MEM_NewClear(976);
  *a1 = (uint64_t)v10;
  if (v10)
  {
    v10[76] = a4;
    v11 = *a1;
    *(_WORD *)(v11 + 96) = v6;
    *(_WORD *)(v11 + 98) = v5;
    if (!InitSourceInfo((_QWORD *)(v11 + 16), v6, v5) && !InitGobHeader(*a1 + 32))
    {
      v12 = (v6 & 0xF) != 0 ? (v6 + 16) & 0xFFF0 : v6;
      v13 = *a1;
      *(_WORD *)*a1 = v12;
      v14 = (v5 & 0xF) != 0 ? (v5 + 16) & 0xFFF0 : v5;
      *(_WORD *)(v13 + 6) = v14;
      *(_WORD *)(v13 + 2) = v12 >> 1;
      *(_WORD *)(v13 + 8) = v14 >> 1;
      *(_WORD *)(v13 + 4) = v12 >> 1;
      *(_WORD *)(v13 + 10) = v14 >> 1;
      if (!NewMB((_QWORD *)(v13 + 104)))
      {
        *(_QWORD *)(*a1 + 112) = MEM_New(v12 >> 2);
        if (*(_QWORD *)(*a1 + 112))
        {
          *(_QWORD *)(*a1 + 120) = MEM_New(v12 >> 2);
          if (*(_QWORD *)(*a1 + 120))
          {
            *(_QWORD *)(*a1 + 128) = MEM_New(v12 >> 2);
            if (*(_QWORD *)(*a1 + 128))
            {
              *(_QWORD *)(*a1 + 136) = MEM_New(v12 >> 2);
              if (*(_QWORD *)(*a1 + 136))
              {
                *(_QWORD *)(*a1 + 144) = MEM_New(v12 >> 2);
                if (*(_QWORD *)(*a1 + 144))
                {
                  *(_QWORD *)(*a1 + 152) = MEM_New(v12 >> 2);
                  if (*(_QWORD *)(*a1 + 152))
                  {
                    *(_QWORD *)(*a1 + 160) = MEM_New(v12 >> 2);
                    if (*(_QWORD *)(*a1 + 160))
                    {
                      *(_QWORD *)(*a1 + 168) = MEM_New(v12 >> 2);
                      if (*(_QWORD *)(*a1 + 168))
                      {
                        *(_QWORD *)(*a1 + 176) = MEM_New(v12 >> 2);
                        if (*(_QWORD *)(*a1 + 176))
                        {
                          *(_QWORD *)(*a1 + 184) = MEM_New(v12 >> 2);
                          if (*(_QWORD *)(*a1 + 184))
                          {
                            *(_QWORD *)(*a1 + 192) = MEM_New(v12 >> 2);
                            if (*(_QWORD *)(*a1 + 192))
                            {
                              *(_QWORD *)(*a1 + 200) = MEM_New(v12 >> 2);
                              v15 = *a1;
                              if (*(_QWORD *)(*a1 + 200))
                              {
                                *(_BYTE *)(v15 + 208) = 0;
                                *(_QWORD *)(*a1 + 216) = MEM_New(*(_DWORD *)(*(_QWORD *)(v15 + 16) + 4));
                                if (*(_QWORD *)(*a1 + 216))
                                {
                                  InitMotionVectorArray((void **)(*a1 + 224), v12, v14);
                                  InitMotionVectorArray((void **)(*a1 + 232), v12, v14);
                                  v16 = *a1;
                                  *(_QWORD *)(v16 + 254) = 0;
                                  *(_QWORD *)(v16 + 240) = 0;
                                  *(_QWORD *)(v16 + 248) = 0;
                                  if (*(_QWORD *)(v16 + 896)
                                    || (*(_QWORD *)(*a1 + 896) = MEM_New(256), v16 = *a1, *(_QWORD *)(*a1 + 896)))
                                  {
                                    if (*(_QWORD *)(v16 + 904)
                                      || (*(_QWORD *)(*a1 + 904) = MEM_New(256), v16 = *a1, *(_QWORD *)(*a1 + 904)))
                                    {
                                      if (!InitFrame((void **)(v16 + 40), v12, v14, 0x10u, 0x10u)
                                        && !InitFrame((void **)(*a1 + 48), v12, v14, 0x10u, 0x10u)
                                        && !InitFrame((void **)(*a1 + 56), v12, v14, 0x10u, 0x10u)
                                        && !InitFrame((void **)(*a1 + 64), v12, v14, 0x10u, 0x10u))
                                      {
                                        *(_QWORD *)(*a1 + 552) = MEM_New(4 * *(_DWORD *)(*(_QWORD *)(*a1 + 16) + 4));
                                        if (*(_QWORD *)(*a1 + 552))
                                        {
                                          *(_QWORD *)(*a1 + 560) = MEM_New(*(_DWORD *)(*(_QWORD *)(*a1 + 16) + 4));
                                          if (*(_QWORD *)(*a1 + 560))
                                          {
                                            *(_QWORD *)(*a1 + 568) = MEM_New(*(_DWORD *)(*(_QWORD *)(*a1 + 16) + 4));
                                            if (*(_QWORD *)(*a1 + 568))
                                            {
                                              *(_QWORD *)(*a1 + 72) = *(_QWORD *)(*a1 + 40);
                                              if (!InitPictureInfo((_QWORD *)(*a1 + 24)))
                                              {
                                                v17 = *a1;
                                                *(_BYTE *)(*(_QWORD *)(*a1 + 24) + 149) = 0;
                                                if (!InitVopComplexityEstimation((_QWORD *)(v17 + 872)))
                                                {
                                                  v18 = *a1;
                                                  *(_BYTE *)(*(_QWORD *)(v18 + 24) + 200) = vcvtps_s32_f32(logf((float)*(int *)(*(_QWORD *)(*a1 + 16) + 4))/ 0.69315);
                                                  if (!InitBitStreamDeco((CBitStreamDeco **)(v18 + 80)))
                                                  {
                                                    v19 = (CIntraDcDecoder *)operator new();
                                                    CIntraDcDecoder::CIntraDcDecoder(v19);
                                                    *(_QWORD *)(*a1 + 88) = v19;
                                                    *(_QWORD *)(*a1 + 528) = 0;
                                                    *(_QWORD *)(*a1 + 520) = 0;
                                                    *(_QWORD *)(*a1 + 576) = MEM_New(20* *(_DWORD *)(*(_QWORD *)(*a1 + 16) + 4));
                                                    if (*(_QWORD *)(*a1 + 576))
                                                    {
                                                      if (!InitIntraPredictor(*a1 + 584, v12))
                                                      {
                                                        *(_QWORD *)(*a1 + 616) = MEM_New(479);
                                                        if (*(_QWORD *)(*a1 + 616))
                                                        {
                                                          *(_QWORD *)(*a1 + 624) = *(_QWORD *)(*a1 + 616)
                                                                                 + (-*(_BYTE *)(*a1 + 616) & 0x1F);
                                                          v20 = *a1;
                                                          *(_BYTE *)(v20 + 940) = 1;
                                                          *(_WORD *)(v20 + 943) = 5120;
                                                          *(_QWORD *)(v20 + 948) = 0;
                                                          *(_QWORD *)(v20 + 960) = &unk_219C5B2EC;
                                                          v21 = *a1;
                                                          *(_BYTE *)(v21 + 969) = 1;
                                                          *(_BYTE *)(v21 + 942) = 1;
                                                          return 0;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return 4294967188;
}

void sub_219C45774(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220732AE4](v1, 0x1000C40FA0F61DDLL);
  _Unwind_Resume(a1);
}

uint64_t KillInstanceGlobalsDeco(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD *v29;

  if (!*a1)
    return 0;
  if (KillSourceInfo((void **)(*a1 + 16)) || KillGobHeader((void **)(*a1 + 32)))
    return 4294958336;
  DelMB((void ***)(*a1 + 104));
  v2 = *a1;
  v3 = *(void **)(*a1 + 112);
  if (v3)
  {
    MEM_Dispose(v3);
    *(_QWORD *)(*a1 + 112) = 0;
    v2 = *a1;
  }
  v4 = *(void **)(v2 + 120);
  if (v4)
  {
    MEM_Dispose(v4);
    *(_QWORD *)(*a1 + 120) = 0;
    v2 = *a1;
  }
  v5 = *(void **)(v2 + 128);
  if (v5)
  {
    MEM_Dispose(v5);
    *(_QWORD *)(*a1 + 128) = 0;
    v2 = *a1;
  }
  v6 = *(void **)(v2 + 136);
  if (v6)
  {
    MEM_Dispose(v6);
    *(_QWORD *)(*a1 + 136) = 0;
    v2 = *a1;
  }
  v7 = *(void **)(v2 + 144);
  if (v7)
  {
    MEM_Dispose(v7);
    *(_QWORD *)(*a1 + 144) = 0;
    v2 = *a1;
  }
  v8 = *(void **)(v2 + 152);
  if (v8)
  {
    MEM_Dispose(v8);
    *(_QWORD *)(*a1 + 152) = 0;
    v2 = *a1;
  }
  v9 = *(void **)(v2 + 160);
  if (v9)
  {
    MEM_Dispose(v9);
    *(_QWORD *)(*a1 + 160) = 0;
    v2 = *a1;
  }
  v10 = *(void **)(v2 + 168);
  if (v10)
  {
    MEM_Dispose(v10);
    *(_QWORD *)(*a1 + 168) = 0;
    v2 = *a1;
  }
  v11 = *(void **)(v2 + 176);
  if (v11)
  {
    MEM_Dispose(v11);
    *(_QWORD *)(*a1 + 176) = 0;
    v2 = *a1;
  }
  v12 = *(void **)(v2 + 184);
  if (v12)
  {
    MEM_Dispose(v12);
    *(_QWORD *)(*a1 + 184) = 0;
    v2 = *a1;
  }
  v13 = *(void **)(v2 + 192);
  if (v13)
  {
    MEM_Dispose(v13);
    *(_QWORD *)(*a1 + 192) = 0;
    v2 = *a1;
  }
  v14 = *(void **)(v2 + 200);
  if (v14)
  {
    MEM_Dispose(v14);
    *(_QWORD *)(*a1 + 200) = 0;
    v2 = *a1;
  }
  v15 = *(void **)(v2 + 216);
  if (v15)
  {
    MEM_Dispose(v15);
    *(_QWORD *)(*a1 + 216) = 0;
    v2 = *a1;
  }
  if (KillMotionVectorArray((void **)(v2 + 224))
    || KillMotionVectorArray((void **)(*a1 + 232))
    || KillFrame((void **)(*a1 + 40))
    || KillFrame((void **)(*a1 + 48))
    || KillFrame((void **)(*a1 + 56)))
  {
    return 4294958336;
  }
  v16 = *a1;
  v17 = *(void **)(*a1 + 896);
  if (v17)
  {
    MEM_Dispose(v17);
    *(_QWORD *)(*a1 + 896) = 0;
    v16 = *a1;
  }
  v18 = *(void **)(v16 + 904);
  if (v18)
  {
    MEM_Dispose(v18);
    *(_QWORD *)(*a1 + 904) = 0;
    v16 = *a1;
  }
  if (KillFrame((void **)(v16 + 64)))
    return 4294958336;
  v19 = *a1;
  v20 = *(void **)(*a1 + 552);
  if (v20)
  {
    MEM_Dispose(v20);
    *(_QWORD *)(*a1 + 552) = 0;
    v19 = *a1;
  }
  v21 = *(void **)(v19 + 560);
  if (v21)
  {
    MEM_Dispose(v21);
    *(_QWORD *)(*a1 + 560) = 0;
    v19 = *a1;
  }
  v22 = *(void **)(v19 + 568);
  if (v22)
  {
    MEM_Dispose(v22);
    *(_QWORD *)(*a1 + 568) = 0;
    v19 = *a1;
  }
  if (KillSourceInfo((void **)(v19 + 24))
    || KillSourceInfo((void **)(*a1 + 872))
    || KillBitStreamDeco((CBitStreamDeco **)(*a1 + 80)))
  {
    return 4294958336;
  }
  v24 = *a1;
  v25 = *(_QWORD *)(*a1 + 88);
  if (v25)
  {
    MEMORY[0x220732AE4](v25, 0x1000C40FA0F61DDLL);
    v24 = *a1;
  }
  *(_QWORD *)(v24 + 88) = 0;
  v26 = *a1;
  v27 = *(void **)(*a1 + 576);
  if (v27)
  {
    MEM_Dispose(v27);
    *(_QWORD *)(*a1 + 576) = 0;
    v26 = *a1;
  }
  if (*(_QWORD *)(v26 + 584))
  {
    KillIntraPredictor((void **)(v26 + 584));
    v26 = *a1;
  }
  v28 = *(void **)(v26 + 616);
  if (v28)
  {
    MEM_Dispose(v28);
    *(_QWORD *)(*a1 + 616) = 0;
    v26 = *a1;
  }
  MEM_Dispose(*(void **)(v26 + 880));
  *(_QWORD *)(*a1 + 880) = 0;
  v29 = (_QWORD *)*a1;
  v29[111] = 0;
  MEM_Dispose(v29);
  result = 0;
  *a1 = 0;
  return result;
}

void S_BuildGammaTables(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int a4)
{
  uint64_t v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  float64x2_t v15;
  double v16;
  unint64_t v17;
  int64x2_t v18;
  float64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;
  int32x4_t v34;
  int32x4_t v35;
  int64x2_t v36;
  int32x2_t v37;
  int32x2_t v38;
  int32x2_t v39;
  int32x2_t v40;
  int32x2_t v41;
  int32x2_t v42;
  int32x2_t v43;
  int32x2_t v44;
  int64x2_t v45;
  float64x2_t v46;
  int64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  int64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;

  v7 = 0;
  v8 = (double)(a3 / 0x10000);
  v9 = dbl_219C5BB00[a4 == 0];
  if (a4)
    v10 = 0;
  else
    v10 = -16;
  do
  {
    v11 = (double)(v10 + (int)v7) / v9;
    if (v11 >= 0.0)
      v12 = pow(v11, v8);
    else
      v12 = pow(v11 * -4.0, v8) * -0.25;
    v13 = (int)(v12 * 219.0 + 16.0 + 0.5);
    if (v13 >= 254)
      v13 = 254;
    if (v13 <= 1)
      LOBYTE(v13) = 1;
    a1[v7++] = v13;
  }
  while (v7 != 256);
  v14 = 0;
  v15 = (float64x2_t)vdupq_n_s64(0x406C000000000000uLL);
  v16 = 224.0;
  if (a4)
    v16 = 254.0;
  v17 = 0xFFFFFFFFLL;
  if (!a4)
    v17 = 4294967280;
  v18 = vdupq_n_s64(v17);
  v19 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v16, 0);
  v20 = (int64x2_t)xmmword_219C5BB10;
  v21 = (int64x2_t)xmmword_219C5BB20;
  v22 = (int64x2_t)xmmword_219C5BB30;
  v23 = (int64x2_t)xmmword_219C5BB40;
  v24 = (int64x2_t)xmmword_219C5BB50;
  v25 = (int64x2_t)xmmword_219C5BB60;
  v26 = (int64x2_t)xmmword_219C5BB70;
  v27 = (int64x2_t)xmmword_219C5B8F0;
  __asm
  {
    FMOV            V19.2D, #16.0
    FMOV            V20.2D, #0.5
  }
  v34.i64[0] = 0xFE000000FELL;
  v34.i64[1] = 0xFE000000FELL;
  v35.i64[0] = 0x100000001;
  v35.i64[1] = 0x100000001;
  v36 = vdupq_n_s64(0x10uLL);
  do
  {
    v37 = vmovn_s64(vaddq_s64(v24, v18));
    v38 = vmovn_s64(vaddq_s64(v25, v18));
    v39 = vmovn_s64(vaddq_s64(v26, v18));
    v40 = vmovn_s64(vaddq_s64(v27, v18));
    v41 = vmovn_s64(vaddq_s64(v20, v18));
    v42 = vmovn_s64(vaddq_s64(v21, v18));
    v43 = vmovn_s64(vaddq_s64(v22, v18));
    v44 = vmovn_s64(vaddq_s64(v23, v18));
    v45.i64[0] = v44.i32[0];
    v45.i64[1] = v44.i32[1];
    v46 = vcvtq_f64_s64(v45);
    v45.i64[0] = v43.i32[0];
    v45.i64[1] = v43.i32[1];
    v47 = v45;
    v45.i64[0] = v42.i32[0];
    v45.i64[1] = v42.i32[1];
    v48 = vcvtq_f64_s64(v45);
    v45.i64[0] = v41.i32[0];
    v45.i64[1] = v41.i32[1];
    v49 = vcvtq_f64_s64(v45);
    v45.i64[0] = v40.i32[0];
    v45.i64[1] = v40.i32[1];
    v50 = v45;
    v45.i64[0] = v39.i32[0];
    v45.i64[1] = v39.i32[1];
    v51 = vcvtq_f64_s64(v45);
    v45.i64[0] = v38.i32[0];
    v45.i64[1] = v38.i32[1];
    v52 = vcvtq_f64_s64(v45);
    v45.i64[0] = v37.i32[0];
    v45.i64[1] = v37.i32[1];
    *(int8x16_t *)&a2[v14] = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vaddq_f64(vmlaq_f64(_Q19, v15, vdivq_f64(vcvtq_f64_s64(v50), v19)), _Q20)), (int32x4_t)vcvtq_s64_f64(vaddq_f64(vmlaq_f64(_Q19, v15, vdivq_f64(v51, v19)), _Q20))), v34), v35), (int16x8_t)vmaxq_s32(vminq_s32(
                                                           vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vaddq_f64(vmlaq_f64(_Q19, v15, vdivq_f64(v52, v19)), _Q20)), (int32x4_t)vcvtq_s64_f64(vaddq_f64(vmlaq_f64(_Q19, v15, vdivq_f64(vcvtq_f64_s64(v45), v19)), _Q20))), v34), v35)), (int8x16_t)vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vaddq_f64(
                                                                            vmlaq_f64(_Q19, v15, vdivq_f64(v46, v19)),
                                                                            _Q20)),
                                                             (int32x4_t)vcvtq_s64_f64(vaddq_f64(vmlaq_f64(_Q19, v15, vdivq_f64(vcvtq_f64_s64(v47), v19)), _Q20))), v34), v35), (int16x8_t)vmaxq_s32(vminq_s32(vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vaddq_f64(vmlaq_f64(_Q19, v15, vdivq_f64(v48, v19)), _Q20)), (int32x4_t)vcvtq_s64_f64(vaddq_f64(vmlaq_f64(_Q19, v15, vdivq_f64(v49, v19)), _Q20))),
                                                           v34),
                                                         v35)));
    v25 = vaddq_s64(v25, v36);
    v26 = vaddq_s64(v26, v36);
    v27 = vaddq_s64(v27, v36);
    v14 += 16;
    v24 = vaddq_s64(v24, v36);
    v23 = vaddq_s64(v23, v36);
    v22 = vaddq_s64(v22, v36);
    v21 = vaddq_s64(v21, v36);
    v20 = vaddq_s64(v20, v36);
  }
  while (v14 != 256);
}

uint64_t RequestGammaLevel(uint64_t result, float a2, float a3)
{
  int v3;
  int v4;

  v3 = (int)(float)((float)(a2 * 65536.0) / a3);
  *(_DWORD *)(result + 912) = v3;
  if (v3 >= 0x4000)
  {
    if (v3 <= 0x40000)
      return result;
    v4 = 0x40000;
  }
  else
  {
    v4 = 0x4000;
  }
  *(_DWORD *)(result + 912) = v4;
  return result;
}

void S_BuildNewGammaTables(uint64_t a1)
{
  S_BuildGammaTables(*(unsigned __int8 **)(a1 + 896), *(unsigned __int8 **)(a1 + 904), *(_DWORD *)(a1 + 912), *(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + 15));
}

void *DrawGrid(void *result)
{
  void *v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (*(_WORD *)(*(_QWORD *)result + 18))
  {
    v1 = result;
    v2 = 0;
    v3 = *(unsigned __int16 *)(*(_QWORD *)result + 16);
    v4 = (*(unsigned __int16 *)(*(_QWORD *)result + 18) - 1) >> 4;
    v5 = 16;
    v6 = 1;
    do
    {
      if (v3)
        result = memset((void *)(**(_QWORD **)v1 + 16 * v2 * *(unsigned __int16 *)(*(_QWORD *)v1 + 24)), 128, ((v3 - 1) & 0xFFFFFFFC) + 4);
      v7 = v6;
      do
      {
        if (v3)
        {
          v8 = 0;
          do
          {
            *(_BYTE *)(**(_QWORD **)v1 + v7 * *(unsigned __int16 *)(*(_QWORD *)v1 + 24) + v8) = 0x80;
            v8 += 16;
          }
          while (v8 < v3);
        }
        ++v7;
      }
      while ((_DWORD)v7 != v5);
      v5 += 16;
      v6 += 16;
    }
    while (v2++ != v4);
  }
  return result;
}

uint64_t OutlineIntraMbs(uint64_t result, uint64_t a2, unsigned __int16 *a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  _QWORD *v9;
  char *v10;
  int v11;

  v3 = a3[1];
  if (a3[1])
  {
    v4 = 0;
    v5 = *(unsigned __int16 *)(*(_QWORD *)result + 24);
    v6 = *a3;
    v7 = v6;
    do
    {
      if (v7)
      {
        v8 = 0;
        do
        {
          if (*(unsigned __int8 *)(a2 + v8 + v4 * v7) - 3 <= 1)
          {
            v9 = (_QWORD *)(**(_QWORD **)result + ((16 * (_DWORD)v5 * (_DWORD)v4) & 0xFFFFFFF0) + 16 * v8);
            *v9 = -1;
            v9[1] = -1;
            v10 = (char *)v9 + v5;
            v11 = 14;
            do
            {
              v10[15] = -1;
              *v10 = -1;
              v10 += v5;
              --v11;
            }
            while (v11);
            *(_QWORD *)v10 = -1;
            *((_QWORD *)v10 + 1) = -1;
            v6 = *a3;
          }
          ++v8;
          v7 = v6;
        }
        while (v8 < v6);
        v3 = a3[1];
        v7 = v6;
      }
      ++v4;
    }
    while (v4 < v3);
  }
  return result;
}

uint64_t OutlineVideoPackets(uint64_t result, uint64_t a2, unsigned __int16 *a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _BYTE *v11;
  int v12;

  v3 = a3[1];
  if (a3[1])
  {
    v4 = 0;
    v5 = *(unsigned __int16 *)(*(_QWORD *)result + 24);
    v6 = *a3;
    v7 = v6;
    do
    {
      if (v7)
      {
        v8 = 0;
        v9 = (16 * (_DWORD)v5 * (_DWORD)v4) & 0xFFFFFFF0;
        do
        {
          if (*(_BYTE *)(a2 + v8 + v4 * v7))
          {
            v10 = (_QWORD *)(**(_QWORD **)result + v9 + 16 * v8);
            *v10 = -1;
            v10[1] = -1;
            v6 = *a3;
          }
          if (*(_BYTE *)(a2 + v8 + v4 * v6) == 3)
          {
            v11 = (_BYTE *)(**(_QWORD **)result + v9 + 16 * v8);
            v12 = 16;
            do
            {
              *v11 = -1;
              v11 += v5;
              --v12;
            }
            while (v12);
            v6 = *a3;
          }
          ++v8;
          v7 = v6;
        }
        while (v8 < v6);
        v3 = a3[1];
        v7 = v6;
      }
      ++v4;
    }
    while (v4 < v3);
  }
  return result;
}

uint64_t HuffmanDecMcbpcIntra(CBitStreamDeco *a1)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  char v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;

  v1 = *((_DWORD *)a1 + 39);
  v2 = v1 + 6;
  *((_DWORD *)a1 + 39) = v1 + 6;
  v3 = *((unsigned int *)a1 + 1);
  if (v3 >= 6)
  {
    v5 = v3 - 6;
    v10 = *(_DWORD *)a1;
    v6 = (*(_DWORD *)a1 >> v5) & *((_DWORD *)a1 + 12);
    if (!v6)
    {
LABEL_15:
      v17 = v1 + 9;
      *((_DWORD *)a1 + 39) = v1 + 9;
      v18 = v5 - 3;
      if (v5 >= 3)
      {
        *((_DWORD *)a1 + 1) = v18;
        v21 = (v10 >> v18) & *((_DWORD *)a1 + 9);
      }
      else
      {
        v19 = 3 - v5;
        v20 = v5 + 29;
        *((_DWORD *)a1 + 1) = v5 + 29;
        v21 = (v10 << (3 - v5)) & *((_DWORD *)a1 + 9);
        v22 = *((_DWORD *)a1 + 40);
        v23 = *((unsigned int *)a1 + 2);
        if (v17 > v22 || 32 * (int)v23 > v22)
        {
          *((_DWORD *)a1 + 2) = v23 + 1;
          *(_DWORD *)a1 = 0;
        }
        else
        {
          v24 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v23));
          *(_DWORD *)a1 = v24;
          *((_DWORD *)a1 + 2) = v23 + 1;
          v21 |= *((_DWORD *)a1 + v19 + 6) & (v24 >> v20);
        }
      }
      if (v21 == 1)
        return 8;
      else
        return 4294967197;
    }
  }
  else
  {
    v4 = 6 - v3;
    v5 = v3 + 26;
    *((_DWORD *)a1 + 1) = v5;
    v6 = (*(_DWORD *)a1 << v4) & *((_DWORD *)a1 + 12);
    v7 = *((_DWORD *)a1 + 40);
    v8 = *((unsigned int *)a1 + 2);
    if (v2 > v7 || 32 * (int)v8 > v7)
    {
      v10 = 0;
      *((_DWORD *)a1 + 2) = v8 + 1;
      *(_DWORD *)a1 = 0;
      if (!v6)
        goto LABEL_15;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v8));
      *(_DWORD *)a1 = v10;
      *((_DWORD *)a1 + 2) = v8 + 1;
      v6 |= *((_DWORD *)a1 + v4 + 6) & (v10 >> v5);
      if (!v6)
        goto LABEL_15;
    }
  }
  v11 = v6;
  v12 = mcbpcIntraBackupTab[v6];
  v13 = v5 + v12;
  *((_DWORD *)a1 + 1) = v13;
  if (v13 >= 0x21)
  {
    v14 = v13 - 32;
    v15 = *((_DWORD *)a1 + 2);
    *((_DWORD *)a1 + 1) = v14;
    *((_DWORD *)a1 + 2) = v15 - 1;
    if (*((_DWORD *)a1 + 40) >= (32 * (v15 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v15 - 2)));
  }
  *((_DWORD *)a1 + 39) = v2 - v12;
  return mcbpcIntraDecodeTab[v11];
}

uint64_t HuffmanDecMcbpcInter(CBitStreamDeco *a1)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  v1 = *((_DWORD *)a1 + 39);
  v2 = v1 + 8;
  *((_DWORD *)a1 + 39) = v1 + 8;
  v3 = *((unsigned int *)a1 + 1);
  if (v3 >= 8)
  {
    v5 = v3 - 8;
    v10 = *(_DWORD *)a1;
    v6 = (*(_DWORD *)a1 >> (v3 - 8)) & *((_DWORD *)a1 + 14);
  }
  else
  {
    v4 = 8 - v3;
    v5 = v3 + 24;
    *((_DWORD *)a1 + 1) = v3 + 24;
    v6 = (*(_DWORD *)a1 << (8 - v3)) & *((_DWORD *)a1 + 14);
    v7 = *((_DWORD *)a1 + 40);
    v8 = *((unsigned int *)a1 + 2);
    if (v2 > v7 || 32 * (int)v8 > v7)
    {
      v10 = 0;
      *((_DWORD *)a1 + 2) = v8 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v8));
      *(_DWORD *)a1 = v10;
      *((_DWORD *)a1 + 2) = v8 + 1;
      v6 |= *((_DWORD *)a1 + v4 + 6) & (v10 >> v5);
    }
  }
  if (v6 >= 3)
  {
    v11 = v6;
    v12 = mcbpcInterBackupTab[v6];
    *((_DWORD *)a1 + 1) = v5 + v12;
    if ((v5 + v12) >= 0x21)
    {
      v13 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 1) = v5 + v12 - 32;
      *((_DWORD *)a1 + 2) = v13 - 1;
      if (*((_DWORD *)a1 + 40) >= (32 * (v13 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v13 - 2)));
    }
    *((_DWORD *)a1 + 39) = v2 - v12;
    return mcbpcInterDecodeTab[v11];
  }
  *((_DWORD *)a1 + 39) = v1 + 9;
  if (v5)
  {
    v15 = v5 - 1;
    *((_DWORD *)a1 + 1) = v5 - 1;
    v16 = (v10 >> (v5 - 1)) & 1;
    if (v6)
    {
LABEL_16:
      if (v16)
        v17 = 18;
      else
        v17 = 19;
      if (v16)
        v18 = 7;
      else
        v18 = 17;
      if (v6 == 2)
        v19 = v18;
      else
        v19 = -99;
      if (v6 == 1)
        return v17;
      else
        return v19;
    }
  }
  else
  {
    *((_DWORD *)a1 + 1) = 31;
    v20 = *((_DWORD *)a1 + 40);
    v21 = *((unsigned int *)a1 + 2);
    if (v1 + 9 > v20 || 32 * (int)v21 > v20)
    {
      v10 = 0;
      v16 = 0;
      *(_DWORD *)a1 = 0;
      *((_DWORD *)a1 + 2) = v21 + 1;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v21));
      *(_DWORD *)a1 = v10;
      *((_DWORD *)a1 + 2) = v21 + 1;
      v16 = v10 >> 31;
    }
    v15 = 31;
    if (v6)
      goto LABEL_16;
  }
  if (v16)
    return 20;
  *((_DWORD *)a1 + 39) = v1 + 13;
  v23 = v15 - 4;
  if (v15 >= 4)
  {
    *((_DWORD *)a1 + 1) = v23;
    v25 = (v10 >> v23) & *((_DWORD *)a1 + 10);
  }
  else
  {
    v24 = 4 - v15;
    v23 = v15 + 28;
    *((_DWORD *)a1 + 1) = v15 + 28;
    v25 = (v10 << (4 - v15)) & *((_DWORD *)a1 + 10);
    v26 = *((_DWORD *)a1 + 40);
    v27 = *((unsigned int *)a1 + 2);
    if (v1 + 13 > v26 || 32 * (int)v27 > v26)
    {
      *((_DWORD *)a1 + 2) = v27 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v28 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v27));
      *(_DWORD *)a1 = v28;
      *((_DWORD *)a1 + 2) = v27 + 1;
      v25 |= *((_DWORD *)a1 + v24 + 6) & (v28 >> v23);
    }
  }
  if (v25 < 8)
    return 4294967197;
  *((_DWORD *)a1 + 1) = v23 + 2;
  if (v23 >= 0x1F)
  {
    v29 = v23 - 30;
    v30 = *((_DWORD *)a1 + 2);
    *((_DWORD *)a1 + 1) = v29;
    *((_DWORD *)a1 + 2) = v30 - 1;
    if (*((_DWORD *)a1 + 40) >= (32 * (v30 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v30 - 2)));
  }
  *((_DWORD *)a1 + 39) = v1 + 11;
  return 21;
}

uint64_t HuffmanDecMvd(uint64_t result)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v19;
  int v20;
  BOOL v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;

  v1 = *(_DWORD *)(result + 156);
  v2 = v1 + 11;
  *(_DWORD *)(result + 156) = v1 + 11;
  v3 = *(unsigned int *)(result + 4);
  if (v3 >= 0xB)
  {
    v5 = v3 - 11;
    v10 = *(_DWORD *)result;
    v6 = (*(_DWORD *)result >> (v3 - 11)) & *(_DWORD *)(result + 68);
  }
  else
  {
    v4 = 11 - v3;
    v5 = v3 + 21;
    *(_DWORD *)(result + 4) = v3 + 21;
    v6 = (*(_DWORD *)result << (11 - v3)) & *(_DWORD *)(result + 68);
    v7 = *(_DWORD *)(result + 160);
    v8 = *(unsigned int *)(result + 8);
    if (v2 > v7 || 32 * (int)v8 > v7)
    {
      v10 = 0;
      *(_DWORD *)(result + 8) = v8 + 1;
      *(_DWORD *)result = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v8));
      *(_DWORD *)result = v10;
      *(_DWORD *)(result + 8) = v8 + 1;
      v6 |= *(_DWORD *)(result + 4 * v4 + 24) & (v10 >> v5);
    }
  }
  if (v6 < 8)
  {
    *(_DWORD *)(result + 156) = v1 + 12;
    if (v5)
    {
      v14 = v5 - 1;
      *(_DWORD *)(result + 4) = v14;
      v15 = (v10 >> v14) & 1;
    }
    else
    {
      *(_DWORD *)(result + 4) = 31;
      v16 = *(_DWORD *)(result + 160);
      v17 = *(unsigned int *)(result + 8);
      if (v1 + 12 > v16 || 32 * (int)v17 > v16)
      {
        v10 = 0;
        v15 = 0;
        *(_DWORD *)result = 0;
        *(_DWORD *)(result + 8) = v17 + 1;
      }
      else
      {
        v10 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v17));
        *(_DWORD *)result = v10;
        *(_DWORD *)(result + 8) = v17 + 1;
        v15 = v10 >> 31;
      }
      v14 = 31;
    }
    switch(v6)
    {
      case 1u:
        v19 = v1 + 13;
        *(_DWORD *)(result + 156) = v1 + 13;
        if (v14)
        {
          *(_DWORD *)(result + 4) = v14 - 1;
          v20 = (v10 >> (v14 - 1)) & 1;
          if (v15)
            goto LABEL_26;
        }
        else
        {
          *(_DWORD *)(result + 4) = 31;
          v24 = *(_DWORD *)(result + 160);
          v25 = *(unsigned int *)(result + 8);
          if (v19 > v24 || 32 * (int)v25 > v24)
          {
            *(_DWORD *)result = 0;
            *(_DWORD *)(result + 8) = v25 + 1;
            if (!v15)
              return 32;
LABEL_47:
            LODWORD(result) = 31;
            goto LABEL_38;
          }
          v26 = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * v25));
          *(_DWORD *)result = v26;
          *(_DWORD *)(result + 8) = v25 + 1;
          v20 = v26 >> 31;
          if (v15)
          {
LABEL_26:
            if (v20)
            {
              LODWORD(result) = 33;
              goto LABEL_38;
            }
            goto LABEL_47;
          }
        }
        result = 32;
        if (v20)
          goto LABEL_38;
        return result;
      case 2u:
        v21 = v15 == 0;
        v22 = 34;
        v23 = 30;
        goto LABEL_35;
      case 3u:
        v21 = v15 == 0;
        v22 = 35;
        v23 = 29;
        goto LABEL_35;
      case 4u:
        v21 = v15 == 0;
        v22 = 36;
        v23 = 28;
        goto LABEL_35;
      case 5u:
        v21 = v15 == 0;
        v22 = 37;
        v23 = 27;
        goto LABEL_35;
      case 6u:
        v21 = v15 == 0;
        v22 = 38;
        v23 = 26;
        goto LABEL_35;
      case 7u:
        v21 = v15 == 0;
        v22 = 39;
        v23 = 25;
LABEL_35:
        if (v21)
          LODWORD(result) = v23;
        else
          LODWORD(result) = v22;
        goto LABEL_38;
      default:
        LODWORD(result) = -99;
        goto LABEL_38;
    }
  }
  v11 = v6;
  v12 = mvdBackupTab[v6];
  *(_DWORD *)(result + 4) = v5 + v12;
  if ((v5 + v12) >= 0x21)
  {
    v13 = *(_DWORD *)(result + 8);
    *(_DWORD *)(result + 4) = v5 + v12 - 32;
    *(_DWORD *)(result + 8) = v13 - 1;
    if (*(_DWORD *)(result + 160) >= (32 * (v13 - 1)))
      *(_DWORD *)result = bswap32(*(_DWORD *)(*(_QWORD *)(result + 16) + 4 * (v13 - 2)));
  }
  *(_DWORD *)(result + 156) = v2 - v12;
  LODWORD(result) = mvdDecodeTab[v11];
LABEL_38:
  if ((result & 0x20) != 0)
    return result | 0xFFFFFFC0;
  else
    return result;
}

uint64_t HuffmanDecCbpy(CBitStreamDeco *a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;

  v1 = *((_DWORD *)a1 + 39) + 6;
  *((_DWORD *)a1 + 39) = v1;
  v2 = *((unsigned int *)a1 + 1);
  if (v2 >= 6)
  {
    v4 = v2 - 6;
    *((_DWORD *)a1 + 1) = v4;
    v5 = (*(_DWORD *)a1 >> v4) & *((_DWORD *)a1 + 12);
  }
  else
  {
    v3 = 6 - v2;
    v4 = v2 + 26;
    *((_DWORD *)a1 + 1) = v4;
    v5 = (*(_DWORD *)a1 << v3) & *((_DWORD *)a1 + 12);
    v6 = *((_DWORD *)a1 + 40);
    v7 = *((unsigned int *)a1 + 2);
    v8 = 32 * v7;
    if (v1 <= v6)
    {
      v9 = v8 >= v6;
      v10 = v8 == v6;
    }
    else
    {
      v9 = 1;
      v10 = 0;
    }
    if (!v10 && v9)
    {
      *((_DWORD *)a1 + 2) = v7 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v11 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v7));
      *(_DWORD *)a1 = v11;
      *((_DWORD *)a1 + 2) = v7 + 1;
      v5 |= *((_DWORD *)a1 + v3 + 6) & (v11 >> v4);
    }
  }
  if (v5 < 2)
    return 4294967197;
  v12 = v5;
  v13 = cbpyBackupTab[v5];
  v14 = v4 + v13;
  *((_DWORD *)a1 + 1) = v14;
  if (v14 >= 0x21)
  {
    v15 = v14 - 32;
    v16 = *((_DWORD *)a1 + 2);
    *((_DWORD *)a1 + 1) = v15;
    *((_DWORD *)a1 + 2) = v16 - 1;
    if (*((_DWORD *)a1 + 40) >= (32 * (v16 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v16 - 2)));
  }
  *((_DWORD *)a1 + 39) = v1 - v13;
  return cbpyDecodeTab[v12];
}

uint64_t HuffmanDecQCoefInter(CBitStreamDeco *a1)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  BOOL v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  v1 = *((_DWORD *)a1 + 39);
  v2 = v1 + 10;
  *((_DWORD *)a1 + 39) = v1 + 10;
  v3 = *((unsigned int *)a1 + 1);
  if (v3 >= 0xA)
  {
    v5 = v3 - 10;
    v12 = *(_DWORD *)a1;
    v6 = (*(_DWORD *)a1 >> (v3 - 10)) & *((_DWORD *)a1 + 16);
  }
  else
  {
    v4 = 10 - v3;
    v5 = v3 + 22;
    *((_DWORD *)a1 + 1) = v3 + 22;
    v6 = (*(_DWORD *)a1 << (10 - v3)) & *((_DWORD *)a1 + 16);
    v7 = *((_DWORD *)a1 + 40);
    v8 = *((unsigned int *)a1 + 2);
    v9 = 32 * v8;
    if (v2 <= v7)
    {
      v10 = v9 >= v7;
      v11 = v9 == v7;
    }
    else
    {
      v10 = 1;
      v11 = 0;
    }
    if (!v11 && v10)
    {
      v12 = 0;
      *((_DWORD *)a1 + 2) = v8 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v12 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v8));
      *(_DWORD *)a1 = v12;
      *((_DWORD *)a1 + 2) = v8 + 1;
      v6 |= *((_DWORD *)a1 + v4 + 6) & (v12 >> v5);
    }
  }
  if (v6 < 0x22)
  {
    v19 = v1 + 13;
    *((_DWORD *)a1 + 39) = v1 + 13;
    v20 = v5 - 3;
    if (v5 >= 3)
    {
      v22 = (v12 >> v20) & *((_DWORD *)a1 + 9);
    }
    else
    {
      v21 = 3 - v5;
      v20 = v5 + 29;
      *((_DWORD *)a1 + 1) = v5 + 29;
      v22 = (v12 << (3 - v5)) & *((_DWORD *)a1 + 9);
      v23 = *((_DWORD *)a1 + 40);
      v24 = *((unsigned int *)a1 + 2);
      if (v19 > v23 || 32 * (int)v24 > v23)
      {
        *((_DWORD *)a1 + 2) = v24 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v25 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v24));
        *(_DWORD *)a1 = v25;
        *((_DWORD *)a1 + 2) = v24 + 1;
        v22 |= *((_DWORD *)a1 + v21 + 6) & (v25 >> v20);
      }
    }
    v26 = ((unsigned __int16)v22 | (unsigned __int16)(8 * v6)) & 0x1FF;
    v27 = coefBackupIntraSubTab[v26];
    v28 = v20 + v27;
    *((_DWORD *)a1 + 1) = v28;
    if (v28 >= 0x21)
    {
      v29 = v28 - 32;
      v30 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 1) = v29;
      *((_DWORD *)a1 + 2) = v30 - 1;
      if (*((_DWORD *)a1 + 40) >= (32 * (v30 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v30 - 2)));
    }
    *((_DWORD *)a1 + 39) = v19 - v27;
    v18 = (char *)&coefDecodeInterSubTab + 2 * v26;
  }
  else
  {
    v13 = v6;
    v14 = coefBackupIntraTab[v6];
    v15 = v5 + v14;
    *((_DWORD *)a1 + 1) = v15;
    if (v15 >= 0x21)
    {
      v16 = v15 - 32;
      v17 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 1) = v16;
      *((_DWORD *)a1 + 2) = v17 - 1;
      if (*((_DWORD *)a1 + 40) >= (32 * (v17 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v17 - 2)));
    }
    *((_DWORD *)a1 + 39) = v2 - v14;
    v18 = (char *)&coefDecodeInterTab + 2 * v13;
  }
  return *(unsigned __int16 *)v18;
}

uint64_t HuffmanDecQCoefIntra(CBitStreamDeco *a1)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  BOOL v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;

  v1 = *((_DWORD *)a1 + 39);
  v2 = v1 + 10;
  *((_DWORD *)a1 + 39) = v1 + 10;
  v3 = *((unsigned int *)a1 + 1);
  if (v3 >= 0xA)
  {
    v5 = v3 - 10;
    v12 = *(_DWORD *)a1;
    v6 = (*(_DWORD *)a1 >> (v3 - 10)) & *((_DWORD *)a1 + 16);
  }
  else
  {
    v4 = 10 - v3;
    v5 = v3 + 22;
    *((_DWORD *)a1 + 1) = v3 + 22;
    v6 = (*(_DWORD *)a1 << (10 - v3)) & *((_DWORD *)a1 + 16);
    v7 = *((_DWORD *)a1 + 40);
    v8 = *((unsigned int *)a1 + 2);
    v9 = 32 * v8;
    if (v2 <= v7)
    {
      v10 = v9 >= v7;
      v11 = v9 == v7;
    }
    else
    {
      v10 = 1;
      v11 = 0;
    }
    if (!v11 && v10)
    {
      v12 = 0;
      *((_DWORD *)a1 + 2) = v8 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v12 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v8));
      *(_DWORD *)a1 = v12;
      *((_DWORD *)a1 + 2) = v8 + 1;
      v6 |= *((_DWORD *)a1 + v4 + 6) & (v12 >> v5);
    }
  }
  if (v6 < 0x22)
  {
    v19 = v1 + 13;
    *((_DWORD *)a1 + 39) = v1 + 13;
    v20 = v5 - 3;
    if (v5 >= 3)
    {
      v22 = (v12 >> v20) & *((_DWORD *)a1 + 9);
    }
    else
    {
      v21 = 3 - v5;
      v20 = v5 + 29;
      *((_DWORD *)a1 + 1) = v5 + 29;
      v22 = (v12 << (3 - v5)) & *((_DWORD *)a1 + 9);
      v23 = *((_DWORD *)a1 + 40);
      v24 = *((unsigned int *)a1 + 2);
      if (v19 > v23 || 32 * (int)v24 > v23)
      {
        *((_DWORD *)a1 + 2) = v24 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v25 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v24));
        *(_DWORD *)a1 = v25;
        *((_DWORD *)a1 + 2) = v24 + 1;
        v22 |= *((_DWORD *)a1 + v21 + 6) & (v25 >> v20);
      }
    }
    v26 = ((unsigned __int16)v22 | (unsigned __int16)(8 * v6)) & 0x1FF;
    v27 = coefBackupIntraSubTab[v26];
    v28 = v20 + v27;
    *((_DWORD *)a1 + 1) = v28;
    if (v28 >= 0x21)
    {
      v29 = v28 - 32;
      v30 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 1) = v29;
      *((_DWORD *)a1 + 2) = v30 - 1;
      if (*((_DWORD *)a1 + 40) >= (32 * (v30 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v30 - 2)));
    }
    *((_DWORD *)a1 + 39) = v19 - v27;
    v18 = (char *)&coefDecodeIntraSubTab + 2 * v26;
  }
  else
  {
    v13 = v6;
    v14 = coefBackupIntraTab[v6];
    v15 = v5 + v14;
    *((_DWORD *)a1 + 1) = v15;
    if (v15 >= 0x21)
    {
      v16 = v15 - 32;
      v17 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 1) = v16;
      *((_DWORD *)a1 + 2) = v17 - 1;
      if (*((_DWORD *)a1 + 40) >= (32 * (v17 - 1)))
        *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v17 - 2)));
    }
    *((_DWORD *)a1 + 39) = v2 - v14;
    v18 = (char *)&coefDecodeIntraTab + 2 * v13;
  }
  return *(unsigned __int16 *)v18;
}

uint64_t HuffmanDecQCoefFastInter(CBitStreamDeco *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;

  v1 = *((_DWORD *)a1 + 39);
  *((_DWORD *)a1 + 39) = v1 + 13;
  v2 = *((unsigned int *)a1 + 1);
  if (v2 >= 0xD)
  {
    v4 = v2 - 13;
    v5 = (*(_DWORD *)a1 >> (v2 - 13)) & *((_DWORD *)a1 + 19);
  }
  else
  {
    v3 = 13 - v2;
    v4 = v2 + 19;
    *((_DWORD *)a1 + 1) = v2 + 19;
    v5 = (*(_DWORD *)a1 << (13 - v2)) & *((_DWORD *)a1 + 19);
    v6 = *((_DWORD *)a1 + 40);
    v7 = *((unsigned int *)a1 + 2);
    if (v1 + 13 > v6 || 32 * (int)v7 > v6)
    {
      *((_DWORD *)a1 + 2) = v7 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v7));
      *(_DWORD *)a1 = v9;
      *((_DWORD *)a1 + 2) = v7 + 1;
      v5 |= *((_DWORD *)a1 + v3 + 6) & (v9 >> v4);
    }
  }
  if (v4 < 0x14)
  {
    v10 = v4 + 13;
  }
  else
  {
    v10 = v4 - 19;
    v11 = *((_DWORD *)a1 + 2);
    *((_DWORD *)a1 + 1) = v10;
    *((_DWORD *)a1 + 2) = v11 - 1;
    if (*((_DWORD *)a1 + 40) >= (32 * (v11 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v11 - 2)));
  }
  if (v5 < 0x110)
  {
    v13 = 13 - coefBackupIntraSubTab[v5];
    v14 = coefDecodeInterSubTab[v5];
  }
  else
  {
    v12 = (unint64_t)v5 >> 3;
    v13 = 10 - coefBackupIntraTab[v12];
    v14 = coefDecodeInterTab[v12];
  }
  v15 = v13 + v1;
  *((_DWORD *)a1 + 39) = v13 + v1;
  v16 = v10 - v13;
  if (v10 >= v13)
  {
    *((_DWORD *)a1 + 1) = v16;
  }
  else
  {
    *((_DWORD *)a1 + 1) = v16 + 32;
    v17 = *((_DWORD *)a1 + 40);
    v18 = *((unsigned int *)a1 + 2);
    if (v15 > v17 || 32 * (int)v18 > v17)
    {
      *((_DWORD *)a1 + 2) = v18 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v18));
      *((_DWORD *)a1 + 2) = v18 + 1;
    }
  }
  return v14;
}

uint64_t HuffmanDecQCoefFastInter2(unsigned int *a1, unsigned int *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unsigned __int16 *v5;
  uint64_t v6;

  v2 = *a1;
  if (v2 >> 23 < 0x11)
  {
    v3 = v2 >> 19;
    v4 = 13 - coefBackupIntraSubTab[v2 >> 19];
    v5 = coefDecodeInterSubTab;
  }
  else
  {
    v3 = v2 >> 22;
    v4 = 10 - coefBackupIntraTab[v2 >> 22];
    v5 = coefDecodeInterTab;
  }
  v6 = v5[v3];
  *a1 = (_DWORD)v2 << v4;
  *a2 = v4;
  return v6;
}

uint64_t HuffmanDecQCoefFastIntra(CBitStreamDeco *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;

  v1 = *((_DWORD *)a1 + 39);
  *((_DWORD *)a1 + 39) = v1 + 13;
  v2 = *((unsigned int *)a1 + 1);
  if (v2 >= 0xD)
  {
    v4 = v2 - 13;
    v5 = (*(_DWORD *)a1 >> (v2 - 13)) & *((_DWORD *)a1 + 19);
  }
  else
  {
    v3 = 13 - v2;
    v4 = v2 + 19;
    *((_DWORD *)a1 + 1) = v2 + 19;
    v5 = (*(_DWORD *)a1 << (13 - v2)) & *((_DWORD *)a1 + 19);
    v6 = *((_DWORD *)a1 + 40);
    v7 = *((unsigned int *)a1 + 2);
    if (v1 + 13 > v6 || 32 * (int)v7 > v6)
    {
      *((_DWORD *)a1 + 2) = v7 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v7));
      *(_DWORD *)a1 = v9;
      *((_DWORD *)a1 + 2) = v7 + 1;
      v5 |= *((_DWORD *)a1 + v3 + 6) & (v9 >> v4);
    }
  }
  if (v4 < 0x14)
  {
    v10 = v4 + 13;
  }
  else
  {
    v10 = v4 - 19;
    v11 = *((_DWORD *)a1 + 2);
    *((_DWORD *)a1 + 1) = v10;
    *((_DWORD *)a1 + 2) = v11 - 1;
    if (*((_DWORD *)a1 + 40) >= (32 * (v11 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v11 - 2)));
  }
  if (v5 < 0x110)
  {
    v13 = 13 - coefBackupIntraSubTab[v5];
    v14 = coefDecodeIntraSubTab[v5];
  }
  else
  {
    v12 = (unint64_t)v5 >> 3;
    v13 = 10 - coefBackupIntraTab[v12];
    v14 = coefDecodeIntraTab[v12];
  }
  v15 = v13 + v1;
  *((_DWORD *)a1 + 39) = v13 + v1;
  v16 = v10 - v13;
  if (v10 >= v13)
  {
    *((_DWORD *)a1 + 1) = v16;
  }
  else
  {
    *((_DWORD *)a1 + 1) = v16 + 32;
    v17 = *((_DWORD *)a1 + 40);
    v18 = *((unsigned int *)a1 + 2);
    if (v15 > v17 || 32 * (int)v18 > v17)
    {
      *((_DWORD *)a1 + 2) = v18 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v18));
      *((_DWORD *)a1 + 2) = v18 + 1;
    }
  }
  return v14;
}

uint64_t HuffmanDecQCoefFastIntra2(unsigned int *a1, unsigned int *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unsigned __int16 *v5;
  uint64_t v6;

  v2 = *a1;
  if (v2 >> 23 < 0x11)
  {
    v3 = v2 >> 19;
    v4 = 13 - coefBackupIntraSubTab[v2 >> 19];
    v5 = coefDecodeIntraSubTab;
  }
  else
  {
    v3 = v2 >> 22;
    v4 = 10 - coefBackupIntraTab[v2 >> 22];
    v5 = coefDecodeIntraTab;
  }
  v6 = v5[v3];
  *a1 = (_DWORD)v2 << v4;
  *a2 = v4;
  return v6;
}

uint64_t RVLCDecQCoef(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v2 = *(_DWORD *)(a1 + 156) + 16;
  *(_DWORD *)(a1 + 156) = v2;
  v3 = *(unsigned int *)(a1 + 4);
  if (v3 >= 0x10)
  {
    v5 = v3 - 16;
    v6 = (*(_DWORD *)a1 >> v5) & *(_DWORD *)(a1 + 88);
  }
  else
  {
    v4 = 16 - v3;
    v5 = v3 + 16;
    *(_DWORD *)(a1 + 4) = v5;
    v6 = (*(_DWORD *)a1 << v4) & *(_DWORD *)(a1 + 88);
    v7 = *(_DWORD *)(a1 + 160);
    v8 = *(unsigned int *)(a1 + 8);
    if (v2 > v7 || 32 * (int)v8 > v7)
    {
      *(_DWORD *)(a1 + 8) = v8 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v10 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * v8));
      *(_DWORD *)a1 = v10;
      *(_DWORD *)(a1 + 8) = v8 + 1;
      v6 |= *(_DWORD *)(a1 + 4 * v4 + 24) & (v10 >> v5);
    }
  }
  v11 = RVLCDecodeTable[(unsigned __int16)v6];
  v12 = 16 - *(unsigned __int8 *)(a2 + 8 * v11 + 3);
  v13 = v12 + v5;
  *(_DWORD *)(a1 + 4) = v13;
  if (v13 >= 0x21)
  {
    v14 = v13 - 32;
    v15 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 4) = v14;
    *(_DWORD *)(a1 + 8) = v15 - 1;
    if (*(_DWORD *)(a1 + 160) >= (32 * (v15 - 1)))
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * (v15 - 2)));
  }
  *(_DWORD *)(a1 + 156) = v2 - v12;
  if ((_DWORD)v11 == 169)
    return 64;
  else
    return ((((unsigned __int16)v6 >> v12) & 1) << 6) | (*(unsigned __int8 *)(a2 + 8 * v11 + 1) << 8) | (*(unsigned __int8 *)(a2 + 8 * v11) << 7) | *(unsigned __int8 *)(a2 + 8 * v11 + 2);
}

uint64_t DecWarpingMV(CBitStreamDeco *a1)
{
  uint64_t v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  BOOL v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  char v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;

  v1 = 0;
  v2 = *((_DWORD *)a1 + 39);
  v3 = *((_DWORD *)a1 + 1);
  while (1)
  {
    v4 = dword_219C5D998[v1];
    v5 = v2 + v4;
    *((_DWORD *)a1 + 39) = v2 + v4;
    if (v3 >= v4)
    {
      v7 = v3 - v4;
      v9 = *(_DWORD *)a1;
      v8 = (*(_DWORD *)a1 >> v7) & *((_DWORD *)a1 + v4 + 6);
    }
    else
    {
      v6 = v4 - v3;
      v7 = 32 - (v4 - v3);
      *((_DWORD *)a1 + 1) = v7;
      if (v6 <= 0x1F)
        v8 = (*(_DWORD *)a1 << v6) & *((_DWORD *)a1 + v4 + 6);
      else
        v8 = 0;
      v10 = *((_DWORD *)a1 + 40);
      v11 = *((unsigned int *)a1 + 2);
      if (v5 > v10 || 32 * (int)v11 > v10)
      {
        v9 = 0;
        *((_DWORD *)a1 + 2) = v11 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v11));
        *(_DWORD *)a1 = v9;
        *((_DWORD *)a1 + 2) = v11 + 1;
        v8 |= *((_DWORD *)a1 + v6 + 6) & (v9 >> v7);
      }
    }
    v3 = v7 + v4;
    *((_DWORD *)a1 + 1) = v3;
    if (v3 >= 0x21)
    {
      v3 -= 32;
      v13 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 1) = v3;
      *((_DWORD *)a1 + 2) = v13 - 1;
      if (*((_DWORD *)a1 + 40) >= (32 * (v13 - 1)))
      {
        v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v13 - 2)));
        *(_DWORD *)a1 = v9;
      }
    }
    *((_DWORD *)a1 + 39) = v2;
    if (dword_219C5D95C[v1] == (unsigned __int16)v8)
      break;
    if (++v1 == 15)
    {
      v14 = 0;
      v5 = v2;
      goto LABEL_36;
    }
  }
  *((_DWORD *)a1 + 39) = v5;
  v15 = v3 >= v4;
  v3 -= v4;
  if (!v15)
  {
    v3 += 32;
    *((_DWORD *)a1 + 1) = v3;
    v16 = *((_DWORD *)a1 + 40);
    v17 = *((unsigned int *)a1 + 2);
    if (v5 > v16 || 32 * (int)v17 > v16)
    {
      v9 = 0;
      *((_DWORD *)a1 + 2) = v17 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v17));
      *(_DWORD *)a1 = v9;
      *((_DWORD *)a1 + 2) = v17 + 1;
    }
  }
  if ((_DWORD)v1)
  {
    v5 = v4 + v2 + v1;
    *((_DWORD *)a1 + 39) = v5;
    if (v3 >= v1)
    {
      v3 -= v1;
      *((_DWORD *)a1 + 1) = v3;
      v14 = (v9 >> v3) & *((_DWORD *)a1 + v1 + 6);
    }
    else
    {
      v14 = 0;
      v18 = v1 - v3;
      v3 = v3 - v1 + 32;
      *((_DWORD *)a1 + 1) = v3;
      if (v18 <= 0x1F)
        v14 = (v9 << v18) & *((_DWORD *)a1 + v1 + 6);
      v19 = *((_DWORD *)a1 + 40);
      v20 = *((unsigned int *)a1 + 2);
      if (v5 > v19 || 32 * (int)v20 > v19)
      {
        *((_DWORD *)a1 + 2) = v20 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v21 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v20));
        *(_DWORD *)a1 = v21;
        *((_DWORD *)a1 + 2) = v20 + 1;
        v14 = *((_DWORD *)a1 + v18 + 6) & (v21 >> v3) | v14;
      }
    }
    v22 = v1 - 1;
    if (!((int)v14 >> v22))
      v14 = (v14 + (-2 << v22) + 1);
  }
  else
  {
    v14 = 0;
  }
LABEL_36:
  v23 = v5 + 1;
  *((_DWORD *)a1 + 39) = v5 + 1;
  if (v3)
  {
    *((_DWORD *)a1 + 1) = v3 - 1;
  }
  else
  {
    *((_DWORD *)a1 + 1) = 31;
    v24 = *((_DWORD *)a1 + 40);
    v25 = *((unsigned int *)a1 + 2);
    if (v23 > v24 || 32 * (int)v25 > v24)
      *(_DWORD *)a1 = 0;
    else
      *(_DWORD *)a1 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v25));
    *((_DWORD *)a1 + 2) = v25 + 1;
  }
  return v14;
}

uint64_t DecBrightnessChangeFactor(CBitStreamDeco *a1)
{
  uint64_t v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  BOOL v27;

  v1 = 0;
  v2 = *((_DWORD *)a1 + 39);
  v3 = *((_DWORD *)a1 + 1);
  while (1)
  {
    v4 = dword_219C5D9E8[v1];
    v5 = v2 + v4;
    *((_DWORD *)a1 + 39) = v2 + v4;
    if (v3 >= v4)
    {
      v7 = v3 - v4;
      v9 = *(_DWORD *)a1;
      v8 = (*(_DWORD *)a1 >> v7) & *((_DWORD *)a1 + v4 + 6);
    }
    else
    {
      v6 = v4 - v3;
      v7 = 32 - (v4 - v3);
      *((_DWORD *)a1 + 1) = v7;
      if (v6 <= 0x1F)
        v8 = (*(_DWORD *)a1 << v6) & *((_DWORD *)a1 + v4 + 6);
      else
        v8 = 0;
      v10 = *((_DWORD *)a1 + 40);
      v11 = *((unsigned int *)a1 + 2);
      if (v5 > v10 || 32 * (int)v11 > v10)
      {
        v9 = 0;
        *((_DWORD *)a1 + 2) = v11 + 1;
        *(_DWORD *)a1 = 0;
      }
      else
      {
        v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v11));
        *(_DWORD *)a1 = v9;
        *((_DWORD *)a1 + 2) = v11 + 1;
        v8 |= *((_DWORD *)a1 + v6 + 6) & (v9 >> v7);
      }
    }
    v3 = v7 + v4;
    *((_DWORD *)a1 + 1) = v3;
    if (v3 >= 0x21)
    {
      v3 -= 32;
      v13 = *((_DWORD *)a1 + 2);
      *((_DWORD *)a1 + 1) = v3;
      *((_DWORD *)a1 + 2) = v13 - 1;
      if (*((_DWORD *)a1 + 40) >= (32 * (v13 - 1)))
      {
        v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * (v13 - 2)));
        *(_DWORD *)a1 = v9;
      }
    }
    *((_DWORD *)a1 + 39) = v2;
    if (dword_219C5D9D4[v1] == (unsigned __int16)v8)
      break;
    if (++v1 == 5)
    {
      LODWORD(v1) = 0;
      v5 = v2;
      goto LABEL_25;
    }
  }
  *((_DWORD *)a1 + 39) = v5;
  v14 = v3 - v4;
  if (v3 >= v4)
  {
    v3 -= v4;
  }
  else
  {
    v3 = v14 + 32;
    *((_DWORD *)a1 + 1) = v14 + 32;
    v15 = *((_DWORD *)a1 + 40);
    v16 = *((unsigned int *)a1 + 2);
    if (v5 > v15 || 32 * (int)v16 > v15)
    {
      v9 = 0;
      *((_DWORD *)a1 + 2) = v16 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v9 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v16));
      *(_DWORD *)a1 = v9;
      *((_DWORD *)a1 + 2) = v16 + 1;
    }
  }
LABEL_25:
  v17 = dword_219C5D9FC[v1];
  v18 = v5 + v17;
  *((_DWORD *)a1 + 39) = v5 + v17;
  if (v3 >= v17)
  {
    *((_DWORD *)a1 + 1) = v3 - v17;
    v21 = (v9 >> (v3 - v17)) & *((_DWORD *)a1 + v17 + 6);
  }
  else
  {
    v19 = v17 - v3;
    v20 = 32 - (v17 - v3);
    *((_DWORD *)a1 + 1) = v20;
    if (v19 <= 0x1F)
      v21 = (v9 << v19) & *((_DWORD *)a1 + v17 + 6);
    else
      v21 = 0;
    v22 = *((_DWORD *)a1 + 40);
    v23 = *((unsigned int *)a1 + 2);
    if (v18 > v22 || 32 * (int)v23 > v22)
    {
      *((_DWORD *)a1 + 2) = v23 + 1;
      *(_DWORD *)a1 = 0;
    }
    else
    {
      v24 = bswap32(*(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v23));
      *(_DWORD *)a1 = v24;
      *((_DWORD *)a1 + 2) = v23 + 1;
      v21 = *((_DWORD *)a1 + v19 + 6) & (v24 >> v20) | v21;
    }
  }
  switch((int)v1)
  {
    case 0:
      v25 = v21 - 15;
      v26 = v21 - 16;
      v27 = (int)v21 <= 14;
      goto LABEL_38;
    case 1:
      v25 = v21 - 15;
      v26 = v21 - 48;
      v27 = (int)v21 <= 30;
      goto LABEL_38;
    case 2:
      v25 = v21 - 15;
      v26 = v21 - 112;
      v27 = (int)v21 <= 62;
LABEL_38:
      if (v27)
        v21 = v26;
      else
        v21 = v25;
      break;
    case 3:
      v21 = (v21 + 113);
      break;
    case 4:
      v21 = (v21 + 625);
      break;
    default:
      return v21;
  }
  return v21;
}

uint64_t Get_dc_scaler(int a1, int a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;

  v2 = a1 - 6;
  if ((a1 - 5) <= 0x13)
    v2 = (a1 + 13) >> 1;
  if ((a1 - 9) <= 0xF)
    v3 = a1 + 8;
  else
    v3 = 2 * a1 - 16;
  if ((a1 - 5) <= 3)
    v4 = 2 * a1;
  else
    v4 = v3;
  if (a2 > 3)
    v4 = v2;
  if ((a1 - 1) >= 4)
    return v4;
  else
    return 8;
}

_WORD *IQuantizeBlockH263(_WORD *result, __int16 a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  if (a3)
  {
    *result *= 8;
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  do
  {
    v5 = (__int16)result[v4];
    if (result[v4])
    {
      v6 = ((v5 >> 15) & 1) + 2047;
      v7 = v5 >> 15;
      v5 = (__int16)(a2 + (a2 & 1) - 1 + 2 * a2 * (result[v4] - (((__int16)result[v4] >> 15) & (2 * result[v4]))));
      if (v5 >= v6)
        LOWORD(v5) = v6;
      LOWORD(v5) = v5 - (v7 & (2 * v5));
    }
    result[v4++] = v5;
  }
  while (v4 != 64);
  return result;
}

uint64_t IQuantizeH263(int a1, __int16 a2, __int16 a3)
{
  int v3;

  if (a1)
  {
    v3 = ((a1 >> 15) & 1) + 2047;
    if ((__int16)(a2 + (a2 & 1) + (a1 - ((a1 >> 15) & (2 * a1))) * a3 - 1) < v3)
      LOWORD(v3) = a2 + (a2 & 1) + (a1 - ((a1 >> 15) & (2 * a1))) * a3 - 1;
    return (__int16)(v3 - ((a1 >> 15) & (2 * v3)));
  }
  else
  {
    return 0;
  }
}

uint64_t IQuantizeBlockH263Opt(uint64_t result, __int16 a2, int a3, int a4, int a5)
{
  _WORD *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;

  v6 = (_WORD *)result;
  if (a3)
  {
    if (a4)
    {
      v7 = 8 * *(_WORD *)result;
    }
    else
    {
      result = Get_dc_scaler(a2, a5);
      v7 = *v6 * result;
    }
    *v6 = v7;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  do
  {
    v10 = (__int16)v6[v9];
    if (v6[v9])
    {
      v11 = ((v10 >> 15) & 1) + 2047;
      v12 = v10 >> 15;
      v10 = (__int16)(a2 + (a2 & 1) - 1 + 2 * a2 * (v6[v9] - (((__int16)v6[v9] >> 15) & (2 * v6[v9]))));
      if (v10 >= v11)
        LOWORD(v10) = v11;
      LOWORD(v10) = v10 - (v12 & (2 * v10));
    }
    v6[v9++] = v10;
  }
  while (v9 != 64);
  return result;
}

uint64_t IQuantizeMPEGIntra(int a1, int a2, int a3, uint64_t a4)
{
  int v4;

  if (a1)
    v4 = a2 * a1 * *(unsigned __int8 *)(a4 + a3) / 8;
  else
    LOWORD(v4) = 0;
  return (__int16)v4;
}

uint64_t IQuantizeBlockMPEG(uint64_t result, int a2, int a3, int a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;

  v9 = result;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = *(_WORD *)(v9 + 2 * v10);
    if (!v12)
    {
      *(_WORD *)(v9 + 2 * v10) = 0;
      goto LABEL_17;
    }
    if (v12 >= 0)
      LOWORD(v13) = *(_WORD *)(v9 + 2 * v10);
    else
      v13 = -v12;
    if (v12 > 0)
      v14 = 1;
    else
      v14 = -1;
    if (a3)
    {
      if (!v10)
      {
        result = Get_dc_scaler(a2, a4);
        v16 = result * v12;
        goto LABEL_16;
      }
      v15 = (__int16)v13 * a2 * *(unsigned __int8 *)(a5 + v10) / 8;
    }
    else
    {
      v15 = ((2 * (__int16)v13) | 1) * a2 * *(unsigned __int8 *)(a5 + v10) / 16;
    }
    v16 = v15 * v14;
LABEL_16:
    *(_WORD *)(v9 + 2 * v10) = v16;
    v11 ^= v16;
LABEL_17:
    ++v10;
  }
  while (v10 != 64);
  if ((v11 & 1) != 0)
    *(_WORD *)(v9 + 126) ^= 1u;
  return result;
}

int16x8_t MPEG4_IDCTVec(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2;
  int16x8_t v3;
  int16x8_t v4;
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int16x8_t v107;
  int16x8_t v108;
  int16x8_t v109;
  int16x8_t v110;
  int16x8_t v111;
  int16x8_t v112;
  int16x8_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  int16x8_t v118;
  int16x8_t v119;
  int16x8_t v120;
  int16x8_t v121;
  int16x8_t result;

  v2 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(*a2, 4uLL));
  v3 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(a2[1], 4uLL));
  v4 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(a2[2], 4uLL));
  v5 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(a2[3], 4uLL));
  v6 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(a2[4], 4uLL));
  v7 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(a2[5], 4uLL));
  v8 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(a2[6], 4uLL));
  v9 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, vshlq_n_s16(a2[7], 4uLL));
  v10 = vzip1q_s16(v2, v6);
  v11 = vzip2q_s16(v2, v6);
  v12 = vzip1q_s16(v3, v7);
  v13 = vzip2q_s16(v3, v7);
  v14 = vzip1q_s16(v4, v8);
  v15 = vzip2q_s16(v4, v8);
  v16 = vzip1q_s16(v5, v9);
  v17 = vzip2q_s16(v5, v9);
  v18 = vzip1q_s16(v10, v14);
  v19 = vzip2q_s16(v10, v14);
  v20 = vzip1q_s16(v11, v15);
  v21 = vzip2q_s16(v11, v15);
  v22 = vzip1q_s16(v12, v16);
  v23 = vzip2q_s16(v12, v16);
  v24 = vzip1q_s16(v13, v17);
  v25 = vzip2q_s16(v13, v17);
  v26 = vzip1q_s16(v18, v22);
  v27 = vzip2q_s16(v18, v22);
  v28 = vzip1q_s16(v19, v23);
  v29 = vzip2q_s16(v19, v23);
  v30 = vzip1q_s16(v20, v24);
  v31 = vzip2q_s16(v20, v24);
  v32 = vzip1q_s16(v21, v25);
  v33 = vzip2q_s16(v21, v25);
  v34 = vdupq_n_s16(0x1976u);
  v35 = vqsubq_s16(vqrdmulhq_s16(v34, v27), v33);
  v36 = vqaddq_s16(v27, vqrdmulhq_s16(v34, v33));
  v37 = vdupq_n_s16(0xAA79u);
  v38 = vqaddq_s16(v31, vqrdmulhq_s16(v37, v29));
  v39 = vdupq_n_s16(0x5587u);
  v40 = vqaddq_s16(v29, vqrdmulhq_s16(v39, v31));
  v41 = vqaddq_s16(v26, v30);
  v42 = vqsubq_s16(v26, v30);
  v43 = vdupq_n_s16(0x3505u);
  v44 = vqsubq_s16(vqrdmulhq_s16(v43, v28), v32);
  v45 = vqaddq_s16(vqrdmulhq_s16(v43, v32), v28);
  v46 = vqaddq_s16(v35, v38);
  v47 = vqsubq_s16(v35, v38);
  v48 = vqsubq_s16(v36, v40);
  v49 = vqaddq_s16(v36, v40);
  v50 = vqaddq_s16(v41, v45);
  v51 = vqsubq_s16(v41, v45);
  v52 = vqaddq_s16(v42, v44);
  v53 = vqsubq_s16(v42, v44);
  v54 = vqsubq_s16(v48, v47);
  v55 = vqaddq_s16(v48, v47);
  v56 = vqaddq_s16(v50, v49);
  v57 = vqsubq_s16(v50, v49);
  v58 = vdupq_n_s16(0x5A82u);
  v59 = vqaddq_s16(v52, vqrdmulhq_s16(v58, v55));
  v60 = vdupq_n_s16(0xA57Eu);
  v61 = vqaddq_s16(v52, vqrdmulhq_s16(v60, v55));
  v62 = vqaddq_s16(v53, vqrdmulhq_s16(v58, v54));
  v63 = vqaddq_s16(v53, vqrdmulhq_s16(v60, v54));
  v64 = vqaddq_s16(v51, v46);
  v65 = vqsubq_s16(v51, v46);
  v66 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v56);
  v67 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v59);
  v68 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v62);
  v69 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v64);
  v70 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v65);
  v71 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v63);
  v72 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v61);
  v73 = vqrdmulhq_s16((int16x8_t)xmmword_219C5F750, v57);
  v74 = vzip1q_s16(v66, v70);
  v75 = vzip2q_s16(v66, v70);
  v76 = vzip1q_s16(v67, v71);
  v77 = vzip2q_s16(v67, v71);
  v78 = vzip1q_s16(v68, v72);
  v79 = vzip2q_s16(v68, v72);
  v80 = vzip1q_s16(v69, v73);
  v81 = vzip2q_s16(v69, v73);
  v82 = vzip1q_s16(v74, v78);
  v83 = vzip2q_s16(v74, v78);
  v84 = vzip1q_s16(v75, v79);
  v85 = vzip2q_s16(v75, v79);
  v86 = vzip1q_s16(v76, v80);
  v87 = vzip2q_s16(v76, v80);
  v88 = vzip1q_s16(v77, v81);
  v89 = vzip2q_s16(v77, v81);
  v90 = vzip1q_s16(v82, v86);
  v91 = vzip2q_s16(v82, v86);
  v92 = vzip1q_s16(v83, v87);
  v93 = vzip2q_s16(v83, v87);
  v94 = vzip1q_s16(v84, v88);
  v95 = vzip2q_s16(v84, v88);
  v96 = vzip1q_s16(v85, v89);
  v97 = vzip2q_s16(v85, v89);
  v98 = vqsubq_s16(vqrdmulhq_s16(v34, v91), v97);
  v99 = vqaddq_s16(v91, vqrdmulhq_s16(v34, v97));
  v100 = vqaddq_s16(v95, vqrdmulhq_s16(v37, v93));
  v101 = vqaddq_s16(v93, vqrdmulhq_s16(v39, v95));
  v102 = vqaddq_s16(v90, v94);
  v103 = vqsubq_s16(v90, v94);
  v104 = vqsubq_s16(vqrdmulhq_s16(v43, v92), v96);
  v105 = vqaddq_s16(vqrdmulhq_s16(v43, v96), v92);
  v106 = vqaddq_s16(v98, v100);
  v107 = vqsubq_s16(v98, v100);
  v108 = vqsubq_s16(v99, v101);
  v109 = vqaddq_s16(v99, v101);
  v110 = vqaddq_s16(v102, v105);
  v111 = vqsubq_s16(v102, v105);
  v112 = vqaddq_s16(v103, v104);
  v113 = vqsubq_s16(v103, v104);
  v114 = vqsubq_s16(v108, v107);
  v115 = vqaddq_s16(v108, v107);
  v116 = vqaddq_s16(v110, v109);
  v117 = vqsubq_s16(v110, v109);
  v118 = vqaddq_s16(v112, vqrdmulhq_s16(v58, v115));
  v119 = vqaddq_s16(v112, vqrdmulhq_s16(v60, v115));
  v120 = vqaddq_s16(v113, vqrdmulhq_s16(v58, v114));
  v121 = vqaddq_s16(v113, vqrdmulhq_s16(v60, v114));
  v113.i64[0] = 0x200020002000200;
  v113.i64[1] = 0x200020002000200;
  *a1 = vqrdmulhq_s16(v113, v116);
  a1[1] = vqrdmulhq_s16(v113, v118);
  a1[2] = vqrdmulhq_s16(v113, v120);
  a1[3] = vqrdmulhq_s16(v113, vqaddq_s16(v111, v106));
  a1[4] = vqrdmulhq_s16(v113, vqsubq_s16(v111, v106));
  a1[5] = vqrdmulhq_s16(v113, v121);
  result = vqrdmulhq_s16(v113, v117);
  a1[6] = vqrdmulhq_s16(v113, v119);
  a1[7] = result;
  return result;
}

int8x8_t *MC_2H_1V_Vec(int8x8_t *result, int a2, const unsigned __int8 *a3, int a4, int16x8_t *a5, unsigned int a6)
{
  int16x8_t v6;
  uint8x8_t *v7;
  unsigned int i;
  int16x8_t v9;

  v6 = vdupq_n_s16(a6);
  v7 = (uint8x8_t *)(a3 + 1);
  for (i = 9; i > 1; --i)
  {
    v9 = *a5++;
    *result = vqmovun_s16(vqaddq_s16(vhaddq_s16((int16x8_t)vaddl_u8(*v7, *(uint8x8_t *)((char *)v7 - 1)), v6), v9));
    result = (int8x8_t *)((char *)result + a2);
    v7 = (uint8x8_t *)((char *)v7 + a4);
  }
  return result;
}

int8x8_t *MC_1H_2V_Vec(int8x8_t *result, int a2, uint8x8_t *a3, int a4, int16x8_t *a5, unsigned int a6)
{
  int16x8_t v6;
  uint16x8_t v7;
  uint8x8_t *v8;
  unsigned int i;
  uint16x8_t v10;
  int16x8_t v11;

  v6 = vdupq_n_s16(a6);
  v7 = vmovl_u8(*a3);
  v8 = (uint8x8_t *)((char *)a3 + a4);
  for (i = 9; i > 1; --i)
  {
    v10 = vmovl_u8(*v8);
    v11 = *a5++;
    *result = vqmovun_s16(vqaddq_s16(vhaddq_s16((int16x8_t)vaddw_u8(v7, *v8), v6), v11));
    result = (int8x8_t *)((char *)result + a2);
    v8 = (uint8x8_t *)((char *)v8 + a4);
    v7 = v10;
  }
  return result;
}

int8x8_t *MC_2H_2V_Vec(int8x8_t *result, int a2, uint8x8_t *a3, int a4, int16x8_t *a5, unsigned int a6)
{
  int16x8_t v6;
  int16x8_t v7;
  uint8x8_t *v8;
  unsigned int i;
  int16x8_t v10;
  int16x8_t v11;

  v6 = vdupq_n_s16(a6);
  v7 = (int16x8_t)vaddl_u8(*a3, (uint8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)a3->i8, *(int8x16_t *)a3->i8, 1uLL));
  v8 = (uint8x8_t *)((char *)a3 + a4);
  for (i = 9; i > 1; --i)
  {
    v10 = (int16x8_t)vaddl_u8(*v8, (uint8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)v8->i8, *(int8x16_t *)v8->i8, 1uLL));
    v11 = *a5++;
    *result = vqmovun_s16(vqaddq_s16(vshrq_n_s16(vaddq_s16(vaddq_s16(v7, v6), v10), 2uLL), v11));
    result = (int8x8_t *)((char *)result + a2);
    v8 = (uint8x8_t *)((char *)v8 + a4);
    v7 = v10;
  }
  return result;
}

unsigned __int8 *Reconstruct_8x8Vec(unsigned __int8 *result, int a2, unsigned __int8 *a3, int a4, int16x8_t *a5, int a6, int a7, int a8, int a9, unsigned __int8 *a10)
{
  unsigned __int8 *v12;
  int16x8_t v13;
  uint8x8_t *v14;
  unsigned int k;
  int16x8_t v16;
  unsigned int m;
  int16x8_t v18;
  int16x8_t v19;
  uint16x8_t v20;
  uint8x8_t *v21;
  unsigned int j;
  uint16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  uint8x8_t *v27;
  unsigned int i;
  int16x8_t v29;
  int16x8_t v30;
  unsigned __int8 v31[64];
  uint64_t v32;

  v12 = result;
  v32 = *MEMORY[0x24BDAC8D0];
  if (a8)
  {
    Get_QuarterPel(a3, a4, a6, a7, a9, a10, 8, v31);
    return (unsigned __int8 *)AddResidueTo_8x8((uint64_t)a5, v31, v12, a2, a10);
  }
  else if (a7 | a6)
  {
    if (a6 != 1 || a7)
    {
      if (a6 || a7 != 1)
      {
        if (a6 == 1 && a7 == 1)
        {
          v25 = vdupq_n_s16(2 - a9);
          v26 = (int16x8_t)vaddl_u8(*(uint8x8_t *)a3, (uint8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)a3, *(int8x16_t *)a3, 1uLL));
          v27 = (uint8x8_t *)&a3[a4];
          for (i = 9; i > 1; --i)
          {
            v29 = (int16x8_t)vaddl_u8(*v27, (uint8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)v27->i8, *(int8x16_t *)v27->i8, 1uLL));
            v30 = *a5++;
            *(int8x8_t *)v12 = vqmovun_s16(vqaddq_s16(vshrq_n_s16(vaddq_s16(vaddq_s16(v26, v25), v29), 2uLL), v30));
            v12 += a2;
            v27 = (uint8x8_t *)((char *)v27 + a4);
            v26 = v29;
          }
        }
      }
      else
      {
        v19 = vdupq_n_s16(1 - a9);
        v20 = vmovl_u8(*(uint8x8_t *)a3);
        v21 = (uint8x8_t *)&a3[a4];
        for (j = 9; j > 1; --j)
        {
          v23 = vmovl_u8(*v21);
          v24 = *a5++;
          *(int8x8_t *)v12 = vqmovun_s16(vqaddq_s16(vhaddq_s16((int16x8_t)vaddw_u8(v20, *v21), v19), v24));
          v12 += a2;
          v21 = (uint8x8_t *)((char *)v21 + a4);
          v20 = v23;
        }
      }
    }
    else
    {
      v13 = vdupq_n_s16(1 - a9);
      v14 = (uint8x8_t *)(a3 + 1);
      for (k = 9; k > 1; --k)
      {
        v16 = *a5++;
        *(int8x8_t *)v12 = vqmovun_s16(vqaddq_s16(vhaddq_s16((int16x8_t)vaddl_u8(*v14, *(uint8x8_t *)((char *)v14 - 1)), v13), v16));
        v12 += a2;
        v14 = (uint8x8_t *)((char *)v14 + a4);
      }
    }
  }
  else
  {
    for (m = 9; m > 1; --m)
    {
      v18 = *a5++;
      *(int8x8_t *)v12 = vqmovun_s16(vqaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)a3), v18));
      a3 += a4;
      v12 += a2;
    }
  }
  return result;
}

void VCPMP4VRegisterInternal()
{
  unint64_t v0;
  char v1;
  char **v2;
  char *v3;

  v0 = atomic_load(&VCPMP4VRegisterInternal::registered);
  if (v0 != -1)
  {
    v3 = &v1;
    v2 = &v3;
    std::__call_once(&VCPMP4VRegisterInternal::registered, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<VCPMP4VRegisterInternal::$_0 &&>>);
  }
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<VCPMP4VRegister::$_0 &&>>()
{
  const __CFAllocator *v0;
  CFDictionaryRef v1;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  keys[0] = *(void **)MEMORY[0x24BDF9988];
  values = (void *)*MEMORY[0x24BDBD268];
  v1 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  VTRegisterVideoDecoderWithInfo();
  CFRelease(v1);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<VCPMP4VRegisterInternal::$_0 &&>>()
{
  const __CFAllocator *v0;
  CFNumberRef v1;
  void *v2;
  void *v3;
  CFDictionaryRef v4;
  int valuePtr;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = 1000;
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v2 = (void *)*MEMORY[0x24BDF9980];
  keys[0] = *(void **)MEMORY[0x24BDF9970];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x24BDBD268];
  values[0] = v1;
  values[1] = v3;
  v4 = CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  VTRegisterVideoDecoderWithInfo();
  CFRelease(v4);
  CFRelease(v1);
}

uint64_t SetBufferInfo(uint64_t result, char a2, __int16 a3, __int16 a4, __int16 a5, __int16 a6)
{
  *(_WORD *)result = a3;
  *(_WORD *)(result + 2) = a4;
  *(_WORD *)(result + 4) = a5;
  *(_WORD *)(result + 6) = a6;
  *(_WORD *)(result + 8) = a3 + 2 * a5;
  *(_WORD *)(result + 10) = a4 + 2 * a6;
  *(_DWORD *)(result + 12) = (unsigned __int16)(a4 + 2 * a6) * (unsigned __int16)(a3 + 2 * a5);
  *(_BYTE *)(result + 16) = a2;
  return result;
}

uint64_t NewBuffer_U8(uint64_t a1, __int16 a2, __int16 a3, __int16 a4, __int16 a5)
{
  _WORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return 0;
  v10 = MEM_NewClear(40);
  *(_QWORD *)a1 = v10;
  if (!v10)
    return 0;
  v10[8] = a2;
  v10[9] = a3;
  v10[10] = a4;
  v10[11] = a5;
  v10[12] = a2 + 2 * a4;
  v10[13] = a3 + 2 * a5;
  v11 = (unsigned __int16)(a3 + 2 * a5) * (unsigned __int16)(a2 + 2 * a4);
  *((_DWORD *)v10 + 7) = v11;
  *((_BYTE *)v10 + 32) = 8;
  v12 = (v11 + 16);
  *(_QWORD *)(*(_QWORD *)a1 + 8) = MEM_New(v11 + 16);
  v13 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  if (!v13)
    return 0;
  **(_QWORD **)a1 = v13
                  + *(unsigned __int16 *)(*(_QWORD *)a1 + 20)
                  + *(unsigned __int16 *)(*(_QWORD *)a1 + 24)
                  * (unint64_t)*(unsigned __int16 *)(*(_QWORD *)a1 + 22);
  return v12;
}

_WORD *NewBuffer_S16(_WORD *result, __int16 a2, __int16 a3, __int16 a4, __int16 a5)
{
  _WORD *v9;
  unsigned int v10;

  if (result)
  {
    v9 = result;
    result = MEM_NewClear(40);
    *(_QWORD *)v9 = result;
    if (result)
    {
      result[8] = a2;
      result[9] = a3;
      result[10] = a4;
      result[11] = a5;
      result[12] = a2 + 2 * a4;
      result[13] = a3 + 2 * a5;
      v10 = (unsigned __int16)(a3 + 2 * a5) * (unsigned __int16)(a2 + 2 * a4);
      *((_DWORD *)result + 7) = v10;
      *((_BYTE *)result + 32) = 8;
      *(_QWORD *)(*(_QWORD *)v9 + 8) = MEM_New(2 * v10);
      **(_QWORD **)v9 = *(_QWORD *)(*(_QWORD *)v9 + 8)
                      + 2
                      * *(unsigned __int16 *)(*(_QWORD *)v9 + 24)
                      * (unint64_t)*(unsigned __int16 *)(*(_QWORD *)v9 + 22)
                      + 2 * *(unsigned __int16 *)(*(_QWORD *)v9 + 20);
      if (*(_QWORD *)(*(_QWORD *)v9 + 8))
        return (_WORD *)v10;
      else
        return 0;
    }
  }
  return result;
}

uint64_t InitFrame(void **a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  void *v10;
  int v11;
  int v12;
  int v13;
  void **v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  __int128 v21;
  BOOL v22;

  v10 = MEM_NewClear(168);
  *a1 = v10;
  if (v10)
  {
    v11 = NewBuffer_U8((uint64_t)v10, a2, a3, a4, a5);
    v12 = NewBuffer_U8((uint64_t)*a1 + 8, a2 >> 1, a3 >> 1, a4 >> 1, a5 >> 1) + v11;
    v13 = v12 + NewBuffer_U8((uint64_t)*a1 + 16, a2 >> 1, a3 >> 1, a4 >> 1, a5 >> 1);
    v14 = (void **)*a1;
    if (v13 == ((3 * (a2 + 2 * a4) * (a3 + 2 * a5)) >> 1) + 48)
    {
      v14[3] = *(void **)*v14;
      *((_QWORD *)*a1 + 4) = **(_QWORD **)*a1 + 8;
      *((_QWORD *)*a1 + 5) = **(_QWORD **)*a1 + 8 * *(unsigned __int16 *)(*(_QWORD *)*a1 + 24);
      *((_QWORD *)*a1 + 6) = **(_QWORD **)*a1 + 8 * *(unsigned __int16 *)(*(_QWORD *)*a1 + 24) + 8;
      v15 = (char *)*a1;
      v16 = *(_QWORD *)*a1;
      *(int32x4_t *)(v15 + 120) = vdupq_n_s32(*(unsigned __int16 *)(v16 + 24));
      *((_QWORD *)v15 + 9) = v16;
      *((_QWORD *)*a1 + 10) = *(_QWORD *)*a1;
      *((_QWORD *)*a1 + 11) = *(_QWORD *)*a1;
      *((_QWORD *)*a1 + 12) = *(_QWORD *)*a1;
      *((_QWORD *)*a1 + 7) = **((_QWORD **)*a1 + 1);
      *((_QWORD *)*a1 + 8) = **((_QWORD **)*a1 + 2);
      v17 = *a1;
      v18 = *((_QWORD *)*a1 + 1);
      v19 = *(unsigned __int16 *)(*((_QWORD *)*a1 + 2) + 24);
      v17[34] = *(unsigned __int16 *)(v18 + 24);
      v17[35] = v19;
      *((_QWORD *)v17 + 13) = v18;
      *((_QWORD *)*a1 + 14) = *((_QWORD *)*a1 + 2);
      v20 = *a1;
      v20[20] = 0x800000008;
      *(_QWORD *)&v21 = 0x1000000010;
      *((_QWORD *)&v21 + 1) = 0x1000000010;
      *((_OWORD *)v20 + 9) = v21;
      if (v13)
        v22 = 1;
      else
        v22 = a2 == 0;
      if (v22 || a3 == 0)
        return 0;
      else
        return -108;
    }
    else
    {
      DelBuffer_U8(v14);
      DelBuffer_U8((void **)*a1 + 1);
      DelBuffer_U8((void **)*a1 + 2);
      MEM_Dispose(*a1);
      *a1 = 0;
      return -108;
    }
  }
  else
  {
    return 0;
  }
}

uint64_t DelBuffer_U8(void **a1)
{
  _DWORD *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (!*a1)
    return 0;
  v3 = (v1[7] + 16);
  v4 = (void *)*((_QWORD *)v1 + 1);
  if (v4)
  {
    MEM_Dispose(v4);
    v1 = *a1;
  }
  *(_QWORD *)v1 = 0;
  *((_QWORD *)*a1 + 1) = 0;
  MEM_Dispose(*a1);
  *a1 = 0;
  return v3;
}

uint64_t DelBuffer_S16(void **a1)
{
  _QWORD *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (!*a1)
    return 0;
  v3 = *((unsigned int *)v1 + 7);
  v4 = (void *)v1[1];
  if (v4)
  {
    MEM_Dispose(v4);
    v1 = *a1;
  }
  *v1 = 0;
  *((_QWORD *)*a1 + 1) = 0;
  MEM_Dispose(*a1);
  *a1 = 0;
  return v3;
}

uint64_t KillFrame(void **a1)
{
  void **v2;
  uint64_t i;

  v2 = (void **)*a1;
  if (v2)
  {
    DelBuffer_U8(v2);
    DelBuffer_U8((void **)*a1 + 1);
    DelBuffer_U8((void **)*a1 + 2);
    for (i = 24; i != 72; i += 8)
      *(_QWORD *)((char *)*a1 + i) = 0;
    do
    {
      *(_QWORD *)((char *)*a1 + i) = 0;
      i += 8;
    }
    while (i != 120);
    MEM_Dispose(*a1);
    *a1 = 0;
  }
  return 0;
}

unint64_t SideExtendBuffer_U8(unint64_t result)
{
  unint64_t v1;
  size_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  char *v11;
  int v12;
  uint64_t v13;
  int v14;
  const void *v15;
  char *v16;
  int v17;
  uint64_t v18;
  size_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  char v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  char *v36;

  v1 = result;
  v2 = *(unsigned __int16 *)(result + 16);
  v3 = *(unsigned __int16 *)(result + 18);
  v4 = *(unsigned __int16 *)(result + 24);
  v5 = *(unsigned __int16 *)(result + 20);
  v6 = (char *)*(unsigned __int16 *)(result + 22);
  v7 = *(_QWORD *)(result + 8);
  v8 = ((_DWORD)v6 * v4);
  v9 = v8 + v5;
  v35 = *(unsigned __int16 *)(result + 26);
  v36 = v6;
  if (!*(_WORD *)(result + 22))
  {
    v34 = *(unsigned __int16 *)(result + 18);
    if (*(_WORD *)(result + 18))
      goto LABEL_7;
LABEL_17:
    v22 = v2 + (int)v9 - 1;
    goto LABEL_18;
  }
  v10 = (const void *)(v7 + v9);
  v11 = (char *)(v7 + v5);
  v12 = (int)v6;
  do
  {
    memmove(v11, v10, v2);
    v11 += v4;
    --v12;
  }
  while (v12);
  v13 = *(_QWORD *)(v1 + 8);
  v34 = (_DWORD)v36 + v3;
  v14 = ((_DWORD)v36 + v3) * v4;
  v15 = (const void *)(v13 + (int)v5 - (int)v4 + v14);
  v16 = (char *)(v13 + (v14 + v5));
  v17 = (int)v36;
  do
  {
    result = (unint64_t)memmove(v16, v15, v2);
    v16 += v4;
    --v17;
  }
  while (v17);
  v7 = *(_QWORD *)(v1 + 8);
  v9 = v8 + v5;
  v6 = v36;
  if (!v3)
    goto LABEL_17;
LABEL_7:
  v18 = v9;
  v19 = (((_DWORD)v5 - 1) & 0xFFFFFFF8) + 8;
  v20 = v3;
  do
  {
    if ((_DWORD)v5)
      result = (unint64_t)memset((void *)(v7 + v8), *(unsigned __int8 *)(v7 + v18), v19);
    v7 += v4;
    --v20;
  }
  while (v20);
  v21 = *(_QWORD *)(v1 + 8);
  v22 = v2 + (int)v18 - 1;
  do
  {
    if ((_DWORD)v5)
      result = (unint64_t)memset((void *)(v21 + (v2 + v18)), *(unsigned __int8 *)(v21 + v22), v19);
    v21 += v4;
    --v3;
  }
  while (v3);
  v7 = *(_QWORD *)(v1 + 8);
  v9 = v18;
  v6 = v36;
LABEL_18:
  if ((_DWORD)v6)
  {
    result = 0;
    v23 = *(_BYTE *)(v7 + v9);
    v24 = *(_BYTE *)(v7 + v22);
    v25 = v5 + (v34 - 1) * (uint64_t)(int)v4;
    v26 = *(_BYTE *)(v7 + v25);
    v27 = *(_BYTE *)(v7 + (int)v2 + (int)v25 - 1);
    do
    {
      if ((_DWORD)v5)
      {
        v28 = result * v4;
        v29 = result + 1;
        v30 = (~result + v35) * v4;
        v31 = (v4 << 32) * (v35 - result) - 0x100000000;
        v32 = v5;
        v33 = v29 * v4 - 1;
        do
        {
          *(_BYTE *)(*(_QWORD *)(v1 + 8) + v28) = v23;
          *(_BYTE *)(*(_QWORD *)(v1 + 8) + v33) = v24;
          *(_BYTE *)(*(_QWORD *)(v1 + 8) + v30) = v26;
          *(_BYTE *)(*(_QWORD *)(v1 + 8) + (v31 >> 32)) = v27;
          ++v30;
          ++v28;
          v31 -= 0x100000000;
          --v33;
          --v32;
        }
        while (v32);
      }
      else
      {
        v29 = result + 1;
      }
      result = v29;
    }
    while ((char *)v29 != v6);
  }
  return result;
}

uint64_t SideExtendBuffer_S16(uint64_t result)
{
  uint64_t v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  _WORD *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  _WORD *v40;
  int v41;
  uint64_t v42;
  _WORD *v43;

  v1 = *(unsigned __int16 *)(result + 16);
  v2 = *(unsigned __int16 *)(result + 18);
  v3 = *(unsigned __int16 *)(result + 24);
  v4 = *(unsigned __int16 *)(result + 26);
  v5 = *(unsigned __int16 *)(result + 20);
  v6 = *(unsigned __int16 *)(result + 22);
  if (*(_WORD *)(result + 22))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      if ((_DWORD)v1)
      {
        v9 = *(_QWORD *)(result + 8);
        v10 = v9 + v7;
        v11 = v9 + 2 * (v6 * v3);
        v12 = v5;
        do
        {
          *(_WORD *)(v10 + 2 * v12) = *(_WORD *)(v11 + 2 * v12);
          ++v12;
        }
        while (v12 < v5 + v1);
      }
      ++v8;
      v7 += 2 * v3;
    }
    while (v8 != v6);
  }
  v13 = (v6 + v2);
  if (v13 < v4)
  {
    v14 = v3 * v13;
    v15 = (v6 + v2);
    do
    {
      if ((_DWORD)v1)
      {
        v16 = *(_QWORD *)(result + 8);
        v17 = v5;
        do
        {
          *(_WORD *)(v16 + 2 * (v14 + v17)) = *(_WORD *)(v16 + 2 * ((int)v13 - 1) * (int)v3 + 2 * v17);
          ++v17;
        }
        while (v17 < v5 + v1);
      }
      ++v15;
      v14 += v3;
    }
    while (v15 < v4);
  }
  if (v2)
  {
    v18 = v6 * v3;
    v19 = v6 * v3;
    v20 = v6;
    do
    {
      if ((_DWORD)v5)
      {
        v21 = *(_QWORD *)(result + 8);
        v22 = (_WORD *)(v21 + 2 * v19);
        v23 = v5;
        do
        {
          *v22++ = *(_WORD *)(v21 + 2 * (v5 + v20 * v3));
          --v23;
        }
        while (v23);
      }
      ++v20;
      v19 += v3;
    }
    while (v20 < v13);
    v24 = v6;
    do
    {
      if ((int)v5 + (int)v1 < v3)
      {
        v25 = *(_QWORD *)(result + 8);
        v26 = (v5 + v1);
        do
          *(_WORD *)(v25 + 2 * v18 + 2 * v26++) = *(_WORD *)(v25 + 2 * ((int)v5 + (int)v1 - 1 + (int)v24 * (int)v3));
        while (v26 < v3);
      }
      ++v24;
      v18 += v3;
    }
    while (v24 < v13);
  }
  if ((_DWORD)v6)
  {
    v27 = 0;
    v28 = *(_QWORD *)(result + 8);
    v29 = v5 + v3 * v6;
    v30 = *(_WORD *)(v28 + 2 * v29);
    v31 = v1 - 1;
    v32 = *(_WORD *)(v28 + 2 * (int)(v1 - 1 + v29));
    v33 = v5 + (v13 - 1) * v3;
    v34 = *(_WORD *)(v28 + 2 * v33);
    v35 = *(_WORD *)(v28 + 2 * (v31 + v33));
    result = v5;
    v36 = 2 * v3;
    do
    {
      if ((_DWORD)v5)
      {
        v37 = v27 * v3;
        v38 = v27 + 1;
        v39 = v4 - v27;
        v40 = (_WORD *)(v28 + v36 * (~v27 + v4));
        v41 = v3 * v39 - 1;
        v42 = v5;
        v43 = (_WORD *)(v28 - 2 + v36 * v38);
        do
        {
          *(_WORD *)(v28 + 2 * v37) = v30;
          *v43-- = v32;
          ++v37;
          *v40++ = v34;
          *(_WORD *)(v28 + 2 * v41--) = v35;
          --v42;
        }
        while (v42);
      }
      else
      {
        v38 = v27 + 1;
      }
      v27 = v38;
    }
    while (v38 != v6);
  }
  return result;
}

unint64_t SideExtendFrame(unint64_t *a1)
{
  SideExtendBuffer_U8(*a1);
  SideExtendBuffer_U8(a1[1]);
  return SideExtendBuffer_U8(a1[2]);
}

_QWORD *CopyFrame(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      memmove(*(void **)(*a2 + 8), *(const void **)(*result + 8), *(int *)(*result + 28));
      memmove(*(void **)(a2[1] + 8), *(const void **)(v3[1] + 8), *(int *)(v3[1] + 28));
      return memmove(*(void **)(a2[2] + 8), *(const void **)(v3[2] + 8), *(int *)(v3[2] + 28));
    }
  }
  return result;
}

uint64_t CopyU8BlockToFrame(uint64_t result, int a2, int a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  unsigned __int16 *v8;
  uint64_t v9;
  int i;
  uint64_t j;
  int k;
  uint64_t m;

  v8 = *(unsigned __int16 **)(a5 + 8 * a6 + 72);
  if (a7 + a2 <= v8[8] && a8 + a2 <= v8[9])
  {
    v9 = *(_QWORD *)(a5 + 8 * a6 + 24) + a7 + v8[12] * a8;
    if (a4)
    {
      if (a2 >= 1)
      {
        for (i = 0; i != a2; ++i)
        {
          for (j = 0; j != a2; ++j)
            *(_BYTE *)(v9 + j) = *(_BYTE *)(result + j) + a4;
          result += a3;
          v9 += *(unsigned __int16 *)(*(_QWORD *)a5 + 24);
        }
      }
    }
    else if (a2 >= 1)
    {
      for (k = 0; k != a2; ++k)
      {
        for (m = 0; m != a2; ++m)
          *(_BYTE *)(v9 + m) = *(_BYTE *)(result + m);
        result += a3;
        v9 += *(unsigned __int16 *)(*(_QWORD *)a5 + 24);
      }
    }
  }
  return result;
}

uint64_t CopyS16BlockToFrame(uint64_t result, int a2, int a3, char a4, uint64_t a5, int a6, int a7, int a8)
{
  unsigned __int16 *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v8 = *(unsigned __int16 **)(a5 + 8 * a6 + 72);
  if (a7 + a2 <= v8[8] && a8 + a2 <= v8[9] && a2 >= 1)
  {
    v10 = 0;
    v11 = *(_QWORD *)(a5 + 8 * a6 + 24) + a7 + v8[12] * a8;
    do
    {
      v12 = 0;
      do
      {
        *(_BYTE *)(v11 + v12) = *(_WORD *)(result + 2 * v12) + a4;
        ++v12;
      }
      while (a2 != v12);
      ++v10;
      v11 += *(unsigned __int16 *)(*(_QWORD *)a5 + 24);
      result += 2 * a3;
    }
    while (v10 != a2);
  }
  return result;
}

uint64_t CopyToBuffer_U8(uint64_t result, unsigned int a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(unsigned __int16 *)(a3 + 18);
  if (*(_WORD *)(a3 + 18))
  {
    v4 = 0;
    v5 = 0;
    LODWORD(v6) = *(unsigned __int16 *)(a3 + 16);
    do
    {
      if ((_DWORD)v6)
      {
        v7 = 0;
        do
        {
          *(_BYTE *)(*(_QWORD *)a3 + v4 * *(unsigned __int16 *)(a3 + 24) + v7) = *(_BYTE *)(result + v7);
          ++v7;
          v6 = *(unsigned __int16 *)(a3 + 16);
        }
        while (v7 < v6);
        v3 = *(unsigned __int16 *)(a3 + 18);
      }
      ++v5;
      result += a2;
      ++v4;
    }
    while (v5 < v3);
  }
  return result;
}

uint64_t CopyToBuffer_S16(uint64_t result, unsigned int a2, uint64_t *a3)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = *((unsigned __int16 *)a3 + 9);
  if (*((_WORD *)a3 + 9))
  {
    v4 = 0;
    v5 = 0;
    LODWORD(v6) = *((unsigned __int16 *)a3 + 8);
    do
    {
      if ((_DWORD)v6)
      {
        v7 = 0;
        v8 = *a3;
        do
        {
          *(_WORD *)(v8 + 2 * (v7 + v4 * *((unsigned __int16 *)a3 + 12))) = *(_WORD *)(result + 2 * v7);
          ++v7;
          v6 = *((unsigned __int16 *)a3 + 8);
        }
        while (v7 < v6);
        v3 = *((unsigned __int16 *)a3 + 9);
      }
      ++v5;
      ++v4;
      result += 2 * a2;
    }
    while (v5 < v3);
  }
  return result;
}

uint64_t CopyFromBuffer_U8(uint64_t result, uint64_t a2, unsigned int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v3 = *(unsigned __int16 *)(result + 18);
  if (*(_WORD *)(result + 18))
  {
    v4 = *(unsigned __int16 *)(result + 22);
    v5 = *(unsigned __int16 *)(result + 20);
    v6 = *(unsigned __int16 *)(result + 16);
    v7 = *(unsigned __int16 *)(result + 22);
    v8 = v7;
    do
    {
      if (v6)
      {
        v9 = 0;
        do
        {
          *(_BYTE *)(a2 + v9) = *(_BYTE *)(*(_QWORD *)(result + 8) + v4 * *(unsigned __int16 *)(result + 24) + v5 + v9);
          ++v9;
          v6 = *(unsigned __int16 *)(result + 16);
        }
        while ((int)v5 + (int)v9 < v6 + *(unsigned __int16 *)(result + 20));
        v7 = *(unsigned __int16 *)(result + 22);
        v3 = *(unsigned __int16 *)(result + 18);
        v5 = *(unsigned __int16 *)(result + 20);
      }
      ++v8;
      a2 += a3;
      ++v4;
    }
    while (v8 < v3 + v7);
  }
  return result;
}

uint64_t CopyFromBuffer_S16(uint64_t result, uint64_t a2, unsigned int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(unsigned __int16 *)(result + 18);
  if (*(_WORD *)(result + 18))
  {
    v4 = *(unsigned __int16 *)(result + 22);
    v5 = *(unsigned __int16 *)(result + 20);
    v6 = *(unsigned __int16 *)(result + 16);
    v7 = *(unsigned __int16 *)(result + 22);
    v8 = v7;
    do
    {
      if (v6)
      {
        v9 = 0;
        v10 = *(_QWORD *)(result + 8);
        do
        {
          *(_WORD *)(a2 + 2 * v9) = *(_WORD *)(v10 + 2 * (v5 + v9 + v4 * *(unsigned __int16 *)(result + 24)));
          ++v9;
          v6 = *(unsigned __int16 *)(result + 16);
        }
        while ((int)v5 + (int)v9 < v6 + *(unsigned __int16 *)(result + 20));
        v7 = *(unsigned __int16 *)(result + 22);
        v3 = *(unsigned __int16 *)(result + 18);
        v5 = *(unsigned __int16 *)(result + 20);
      }
      ++v8;
      a2 += 2 * a3;
      ++v4;
    }
    while (v8 < v3 + v7);
  }
  return result;
}

float GetFrameYChannelMAD(uint64_t **a1)
{
  uint64_t *v1;
  unsigned int v2;
  int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *a1;
  v2 = *((unsigned __int16 *)*a1 + 8);
  v3 = *((unsigned __int16 *)*a1 + 9);
  if (*((_WORD *)*a1 + 9))
  {
    v4 = 0;
    v5 = 0;
    v6 = *((unsigned __int16 *)v1 + 12);
    v7 = *v1;
    do
    {
      if (*((_WORD *)*a1 + 8))
      {
        v8 = 0;
        do
        {
          v5 += vaddlvq_u16(vmovl_u8(*(uint8x8_t *)(v7 + v8)));
          v8 += 8;
        }
        while (v8 < v2);
      }
      ++v4;
      v7 += v6;
    }
    while (v4 != v3);
  }
  else
  {
    v5 = 0;
  }
  return (float)v5 / (float)(int)(v3 * v2);
}

float GetFramesYChannelDiffMAD(uint64_t a1, uint64_t **a2, uint64_t a3, int32x4_t a4, uint32x4_t a5)
{
  uint64_t *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;

  v5 = *a2;
  v6 = *((unsigned __int16 *)*a2 + 8);
  v7 = *((unsigned __int16 *)*a2 + 9);
  if (v7 >= 0x10)
  {
    v9 = 0;
    v8 = 0;
    v10 = 0;
    v11 = **(_QWORD **)a1;
    v12 = *v5;
    v13 = *((unsigned __int16 *)v5 + 12);
    v14 = *(unsigned __int16 *)(*(_QWORD *)a1 + 24);
    LODWORD(a1) = v7 >> 4;
    LODWORD(v15) = v6 >> 4;
    if (v6 >> 4 <= 1)
      v15 = 1;
    else
      v15 = v15;
    if (a1 <= 1)
      a1 = 1;
    else
      a1 = a1;
    do
    {
      if (v6 >= 0x10)
      {
        v16 = 0;
        do
        {
          v17 = 0;
          v18 = 0;
          v19 = v11 + 16 * v9 * v14 + 16 * v16;
          v20 = v12 + 16 * v9 * v13 + 16 * v16;
          do
          {
            v21 = 0;
            do
            {
              a4.i32[0] = *(_DWORD *)(v19 + v21);
              a5.i32[0] = *(_DWORD *)(v20 + v21);
              a5 = vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a5.i8));
              a4 = (int32x4_t)vabdq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)a4.i8)), a5);
              v18 += vaddvq_s32(a4);
              v22 = v21 >= 0xC;
              v21 += 4;
            }
            while (!v22);
            v19 += v14;
            v20 += v13;
            ++v17;
          }
          while (v17 != 16);
          if (a3)
            *(_WORD *)(a3 + 2 * v10) = v18 >> 8;
          v8 += v18;
          ++v16;
          ++v10;
        }
        while (v16 != v15);
      }
      ++v9;
    }
    while (v9 != a1);
  }
  else
  {
    v8 = 0;
  }
  return (float)v8 / (float)(v7 * v6);
}

float GetFramesYChannelDiffPSNR(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;

  v2 = *(unsigned __int16 *)(*(_QWORD *)a2 + 18);
  if (*(_WORD *)(*(_QWORD *)a2 + 18))
  {
    v3 = 0;
    v4 = 0;
    do
    {
      if (*(_WORD *)(*(_QWORD *)a2 + 16))
      {
        v5 = (unsigned __int8 *)(**(_QWORD **)a2 + v3 * *(unsigned __int16 *)(*(_QWORD *)a2 + 24));
        v6 = (unsigned __int8 *)(**(_QWORD **)a1 + v3 * *(unsigned __int16 *)(*(_QWORD *)a1 + 24));
        v7 = *(unsigned __int16 *)(*(_QWORD *)a2 + 16);
        do
        {
          v9 = *v6++;
          v8 = v9;
          v10 = *v5++;
          v4 += (v8 - v10) * (v8 - v10);
          --v7;
        }
        while (v7);
      }
      ++v3;
    }
    while ((_DWORD)v3 != v2);
  }
  else
  {
    v4 = 0;
  }
  return log10((double)(*(unsigned __int16 *)(*(_QWORD *)a2 + 16) * v2) * 65025.0 / (float)v4) * 10.0;
}

uint64_t DumpBuffer_U8(uint64_t result, FILE *__stream, int a3)
{
  uint64_t v4;
  int v5;
  int v6;
  size_t v7;

  if (__stream)
  {
    v4 = result;
    if (a3)
    {
      return fwrite(*(const void **)(result + 8), 1uLL, *(unsigned int *)(result + 28), __stream);
    }
    else
    {
      v5 = *(unsigned __int16 *)(result + 18);
      if (*(_WORD *)(result + 18))
      {
        v6 = 0;
        v7 = *(unsigned __int16 *)(result + 16);
        do
        {
          result = fwrite((const void *)(*(_QWORD *)v4 + v6 * *(unsigned __int16 *)(v4 + 24)), 1uLL, v7, __stream);
          ++v6;
        }
        while (v5 != v6);
      }
    }
  }
  return result;
}

FILE *DumpYUV(const char *a1, uint64_t *a2, int a3)
{
  FILE *result;
  FILE *v6;

  result = fopen(a1, "ab");
  if (result)
  {
    v6 = result;
    DumpBuffer_U8(*a2, result, a3);
    DumpBuffer_U8(a2[1], v6, a3);
    DumpBuffer_U8(a2[2], v6, a3);
    return (FILE *)fclose(v6);
  }
  return result;
}

FILE *DumpY(uint64_t *a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpY.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*a1, result, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

FILE *DumpU(uint64_t a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpU.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*(_QWORD *)(a1 + 8), result, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

FILE *DumpV(uint64_t a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpV.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*(_QWORD *)(a1 + 16), result, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

FILE *DumpY2(uint64_t *a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpY2.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*a1, result, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

FILE *DumpU2(uint64_t a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpU2.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*(_QWORD *)(a1 + 8), result, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

FILE *DumpV2(uint64_t a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpV2.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*(_QWORD *)(a1 + 16), result, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

FILE *DumpFrame(uint64_t *a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpFrame.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*a1, result, a2);
    DumpBuffer_U8(a1[1], v5, a2);
    DumpBuffer_U8(a1[2], v5, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

FILE *DumpFrame2(uint64_t *a1, int a2)
{
  FILE *result;
  FILE *v5;

  result = fopen("dumpFrame2.raw", "ab");
  if (result)
  {
    v5 = result;
    DumpBuffer_U8(*a1, result, a2);
    DumpBuffer_U8(a1[1], v5, a2);
    DumpBuffer_U8(a1[2], v5, a2);
    return (FILE *)fclose(v5);
  }
  return result;
}

uint64_t SetBufferAllVal_U8(uint64_t result, char a2)
{
  unint64_t v2;

  if (*(_DWORD *)(result + 28))
  {
    v2 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(result + 8) + v2++) = a2;
    while (v2 < *(unsigned int *)(result + 28));
  }
  return result;
}

uint64_t SetBufferAllVal_S16(uint64_t result, __int16 a2)
{
  uint64_t v2;
  _WORD *v3;

  v2 = *(unsigned int *)(result + 28);
  if ((_DWORD)v2)
  {
    v3 = *(_WORD **)(result + 8);
    do
    {
      *v3++ = a2;
      --v2;
    }
    while (v2);
  }
  return result;
}

_QWORD *SetFrameAllVal(_QWORD *result, char a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = *result;
  if (*(_DWORD *)(*result + 28))
  {
    v3 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(v2 + 8) + v3++) = a2;
    while (v3 < *(unsigned int *)(v2 + 28));
  }
  v4 = result[1];
  if (*(_DWORD *)(v4 + 28))
  {
    v5 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(v4 + 8) + v5++) = a2;
    while (v5 < *(unsigned int *)(v4 + 28));
  }
  v6 = result[2];
  if (*(_DWORD *)(v6 + 28))
  {
    v7 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(v6 + 8) + v7++) = a2;
    while (v7 < *(unsigned int *)(v6 + 28));
  }
  return result;
}

uint64_t Line_Frame(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;

  v6 = *(unsigned __int16 *)(*(_QWORD *)a6 + 24);
  v7 = *(unsigned __int16 *)(*(_QWORD *)a6 + 26);
  v8 = a3 & ~(a3 >> 63);
  if ((result & (unint64_t)~(result >> 63)) >= v6)
    v9 = *(unsigned __int16 *)(*(_QWORD *)a6 + 24);
  else
    v9 = result & ~(result >> 63);
  if (v8 >= v6)
    v8 = *(unsigned __int16 *)(*(_QWORD *)a6 + 24);
  if ((a2 & (unint64_t)~(a2 >> 63)) >= v7)
    v10 = *(unsigned __int16 *)(*(_QWORD *)a6 + 26);
  else
    v10 = a2 & ~(a2 >> 63);
  if ((a4 & (unint64_t)~(a4 >> 63)) < v7)
    v7 = a4 & ~(a4 >> 63);
  v11 = (float)(v8 - v9);
  v12 = v7 - v10;
  v13 = (float)v12;
  v14 = sqrtf((float)(v13 * v13) + (float)(v11 * v11));
  v15 = 0.0;
  v16 = 0.5;
  if (v8 >= v9)
    v17 = 0.0;
  else
    v17 = 0.5;
  if (v12 >= 0)
    v16 = 0.0;
  if (v14 > 0.0)
  {
    v18 = **(_QWORD **)a6 + v9;
    do
    {
      *(_BYTE *)(v18
               + (uint64_t)(float)(v17 + (float)((float)(v15 / v14) * v11))
               + (v10 + (uint64_t)(float)(v16 + (float)((float)(v15 / v14) * v13))) * v6) = a5;
      v15 = v15 + 1.0;
    }
    while (v15 < v14);
  }
  return result;
}

uint64_t View_MV(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  char v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  _QWORD v49[5];

  v49[4] = *MEMORY[0x24BDAC8D0];
  v40 = result;
  if (result >= 1)
  {
    v41 = 0;
    v42 = a2;
    v39 = 2 * a2;
    do
    {
      if (a2 >= 1)
      {
        v9 = 0;
        v46 = v39 * v41;
        v47 = v41 * a2;
        do
        {
          v10 = 4 * (v9 + v46);
          v11 = *(__int16 *)(a4 + v10);
          v12 = *(__int16 *)(a5 + v10);
          v13 = (4 * (v9 + v46)) | 2;
          v14 = *(__int16 *)(a4 + v13);
          v49[0] = v11;
          v49[1] = v14;
          v15 = *(__int16 *)(a5 + v13);
          v48[0] = v12;
          v48[1] = v15;
          v16 = v9 + v46 + a2;
          v17 = *(__int16 *)(a4 + 4 * v16);
          v18 = *(__int16 *)(a5 + 4 * v16);
          v19 = (4 * v16) | 2;
          v20 = *(__int16 *)(a4 + v19);
          v49[2] = v17;
          v49[3] = v20;
          v21 = *(__int16 *)(a5 + v19);
          v48[2] = v18;
          v48[3] = v21;
          v22 = *(unsigned __int8 *)(a6 + v9 + v47);
          if (v22 - 3 >= 2)
          {
            v23 = 0;
            v24 = 0;
            v25 = 0;
            do
            {
              v26 = v49[v25];
              v27 = v48[v25];
              if (a3)
              {
                if (v26 >= 0)
                  v28 = v49[v25];
                else
                  v28 = v26 + 3;
                v29 = v28 >> 2;
                if ((unint64_t)(v26 + 3) >= 4)
                  v30 = v29;
                else
                  v30 = -1;
                if ((unint64_t)v26 >= 4)
                  v26 = v30;
                else
                  v26 = 1;
                if (v27 >= 0)
                  v31 = v48[v25];
                else
                  v31 = v27 + 3;
                v32 = v31 >> 2;
                if ((unint64_t)(v27 + 3) >= 4)
                  v33 = v32;
                else
                  v33 = -1;
                if ((unint64_t)v27 >= 4)
                  v27 = v33;
                else
                  v27 = 1;
              }
              else
              {
                if (v26 >= 0)
                  v34 = v49[v25];
                else
                  v34 = v26 + 1;
                v35 = v34 >> 1;
                if (v26 == -1)
                  v35 = -1;
                if (v26 != 1)
                  v26 = v35;
                if (v27 >= 0)
                  v36 = v48[v25];
                else
                  v36 = v27 + 1;
                v37 = v36 >> 1;
                if (v27 == -1)
                  v37 = -1;
                if (v27 != 1)
                  v27 = v37;
              }
              result = Line_Frame(v24 & 8 | (unint64_t)(16 * v9), v23 & 8 | (unint64_t)(16 * v41), (v26 + (v24 & 8 | (unint64_t)(16 * v9))) & ~((uint64_t)(v26+ (v24 & 8 | (unint64_t)(16 * v9))) >> 63), (v27 + (v23 & 8 | (unint64_t)(16 * v41))) & ~((uint64_t)(v27+ (v23 & 8 | (unint64_t)(16 * v41))) >> 63), 255, a7);
              if (v22 < 2)
                break;
              v24 += 8;
              v23 += 4;
            }
            while (v25++ < 3);
          }
          ++v9;
          a2 = v42;
        }
        while (v9 != v42);
      }
      ++v41;
    }
    while (v41 != v40);
  }
  return result;
}

uint64_t CloneFrame(_QWORD *a1, void **a2)
{
  InitFrame(a2, *(unsigned __int16 *)(*a1 + 16), *(unsigned __int16 *)(*a1 + 18), *(unsigned __int16 *)(*a1 + 20), *(unsigned __int16 *)(*a1 + 22));
  CopyFrame(a1, *a2);
  return 0;
}

uint64_t *FrameDiff(uint64_t *result, uint64_t a2)
{
  int i;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  int v13;

  if (*(unsigned __int16 *)(*result + 24) == *(unsigned __int16 *)(*(_QWORD *)a2 + 24)
    && *(unsigned __int16 *)(*result + 26) == *(unsigned __int16 *)(*(_QWORD *)a2 + 26))
  {
    for (i = 1; i != 4; ++i)
    {
      if (i == 2)
        v3 = result + 1;
      else
        v3 = result + 2;
      if (i == 2)
        v4 = a2 + 8;
      else
        v4 = a2 + 16;
      if (i == 1)
      {
        v3 = result;
        v5 = a2;
      }
      else
      {
        v5 = v4;
      }
      v6 = *v3;
      v7 = *(unsigned __int16 *)(*v3 + 26);
      if (v7)
      {
        v8 = *(unsigned __int16 *)(v6 + 24);
        v9 = *(unsigned __int8 **)(*(_QWORD *)v5 + 8);
        v10 = *(unsigned __int8 **)(v6 + 8);
        do
        {
          if (v8)
          {
            v11 = v8;
            do
            {
              v12 = *v10++;
              v13 = v12 - *v9;
              if (v13 < 0)
                v13 = -v13;
              *v9++ = v13;
              --v11;
            }
            while (v11);
          }
          --v7;
        }
        while (v7);
      }
    }
  }
  return result;
}

void *WipeChannel(void *result, int __c, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t v4;
  int v5;
  size_t v7;
  char *v8;

  v3 = a3 + 2;
  if ((_DWORD)result == 2)
    v3 = a3 + 1;
  if ((_DWORD)result == 1)
    v3 = a3;
  v4 = *v3;
  v5 = *(unsigned __int16 *)(v4 + 26);
  if (*(_WORD *)(v4 + 26))
  {
    v7 = *(unsigned __int16 *)(v4 + 24);
    v8 = *(char **)(v4 + 8);
    do
    {
      if ((_DWORD)v7)
      {
        result = memset(v8, __c, v7);
        v8 += (v7 - 1) + 1;
      }
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t CopyChannelC2Y(uint64_t result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  _BYTE *v9;
  int v10;
  char v11;

  if ((_DWORD)result == 3)
  {
    v2 = a2 + 2;
  }
  else
  {
    if ((_DWORD)result != 2)
      return result;
    v2 = a2 + 1;
  }
  v3 = *v2;
  v4 = *(unsigned __int16 *)(*v2 + 26);
  if (v4)
  {
    v5 = *(unsigned __int16 *)(v3 + 24);
    v6 = *(unsigned __int16 *)(*a2 + 24);
    v7 = *(_BYTE **)(*a2 + 8);
    v8 = *(char **)(v3 + 8);
    v9 = v7;
    do
    {
      v7 += v6;
      if (v5)
      {
        v10 = v5;
        do
        {
          v11 = *v8++;
          *v9 = v11;
          v9[1] = v11;
          v9 += 2;
          *v7 = v11;
          v7[1] = v11;
          v7 += 2;
          --v10;
        }
        while (v10);
      }
      v9 += v6;
      --v4;
    }
    while (v4);
  }
  return result;
}

void CScanConverter::CScanConverter(CScanConverter *this)
{
  uint64_t v1;
  int64x2_t v2;
  int64x2_t v3;
  int64x2_t v4;
  int64x2_t *v5;

  v1 = 0;
  *((_OWORD *)this + 6) = xmmword_219C5F770;
  *((_OWORD *)this + 34) = xmmword_219C5F780;
  *((_OWORD *)this + 35) = xmmword_219C5F790;
  *((_OWORD *)this + 36) = xmmword_219C5F7A0;
  *((_OWORD *)this + 37) = xmmword_219C5F7B0;
  *((_OWORD *)this + 7) = xmmword_219C5F7C0;
  *((_OWORD *)this + 8) = xmmword_219C5F7D0;
  *((_OWORD *)this + 9) = xmmword_219C5F7E0;
  *((_OWORD *)this + 11) = xmmword_219C5F800;
  *((_OWORD *)this + 12) = xmmword_219C5F810;
  *((_OWORD *)this + 40) = xmmword_219C5F840;
  *((_OWORD *)this + 41) = xmmword_219C5F830;
  *((_OWORD *)this + 38) = xmmword_219C5F860;
  *((_OWORD *)this + 39) = xmmword_219C5F850;
  *((_OWORD *)this + 20) = xmmword_219C5F880;
  *((_OWORD *)this + 21) = xmmword_219C5F870;
  *((_OWORD *)this + 18) = xmmword_219C5F8A0;
  *((_OWORD *)this + 19) = xmmword_219C5F890;
  *((_OWORD *)this + 16) = xmmword_219C5F8C0;
  *((_OWORD *)this + 17) = xmmword_219C5F8B0;
  *((_OWORD *)this + 13) = xmmword_219C5F820;
  *((_OWORD *)this + 14) = xmmword_219C5F8E0;
  *((_OWORD *)this + 15) = xmmword_219C5F8D0;
  *((_QWORD *)this + 84) = 0x1110090803020100;
  *((_QWORD *)this + 85) = 0xE0F070605040B0ALL;
  *((_QWORD *)this + 86) = 0x2120191812130C0DLL;
  *((_QWORD *)this + 87) = 0x1D1C171615141B1ALL;
  *((_QWORD *)this + 88) = 0x3130292823221F1ELL;
  strcpy((char *)this + 712, "*+$%&',-./2389:;4567<=>?");
  *((_DWORD *)this + 88) = 0;
  *((_DWORD *)this + 89) = 33685761;
  *((_WORD *)this + 180) = 257;
  *((_WORD *)this + 201) = 1542;
  *((_DWORD *)this + 101) = 117901063;
  *((_QWORD *)this + 51) = 0x707070706060606;
  *((_OWORD *)this + 26) = xmmword_219C5F8F0;
  *((_OWORD *)this + 27) = xmmword_219C5F900;
  *((_OWORD *)this + 28) = xmmword_219C5F910;
  *((_OWORD *)this + 29) = xmmword_219C5F920;
  *((_BYTE *)this + 737) = 8;
  *((_WORD *)this + 369) = 6160;
  *((_DWORD *)this + 185) = 167905537;
  *((_QWORD *)this + 93) = 0x3139383028201911;
  *((_OWORD *)this + 47) = xmmword_219C5F940;
  *((_OWORD *)this + 48) = xmmword_219C5F950;
  *((_OWORD *)this + 49) = xmmword_219C5F960;
  *((_QWORD *)this + 60) = (char *)this + 416;
  *((_QWORD *)this + 61) = (char *)this + 352;
  *((_OWORD *)this + 50) = xmmword_219C5F970;
  *((_OWORD *)this + 51) = xmmword_219C5F980;
  qmemcpy((char *)this + 832, " !(0)\"#*1892+3:;$%,4-&'.5<=6/7>?", 32);
  v2 = vdupq_n_s64((unint64_t)this + 96);
  *((_OWORD *)this + 10) = xmmword_219C5F7F0;
  *(_QWORD *)((char *)this + 362) = 0x101010100000000;
  *(_QWORD *)((char *)this + 370) = 0x303040403030202;
  *(_QWORD *)((char *)this + 378) = 0x303030302020202;
  *(_QWORD *)((char *)this + 386) = 0x505060605050404;
  *(_QWORD *)((char *)this + 394) = 0x505050504040404;
  v3 = vdupq_n_s64((unint64_t)this + 544);
  v4 = vdupq_n_s64((unint64_t)this + 160);
  do
  {
    v5 = (int64x2_t *)((char *)this + v1);
    v5[31] = v3;
    *v5 = v2;
    v5[3] = v4;
    v1 += 16;
  }
  while (v1 != 48);
}

uint64_t CScanConverter::SetUp(CScanConverter *this, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  switch(a2)
  {
    case 1:
      v3 = 0;
      v4 = a3;
      v8 = (_QWORD *)((char *)this + 8 * a3);
      *v8 = (char *)this + 96;
      v8[6] = (char *)this + 160;
      v6 = (char *)this + 544;
      break;
    case 2:
      v3 = 0;
      v4 = a3;
      v9 = (_QWORD *)((char *)this + 8 * a3);
      *v9 = (char *)this + 352;
      v9[6] = (char *)this + 416;
      v6 = (char *)this + 672;
      break;
    case 3:
      v3 = 0;
      v4 = a3;
      v10 = (_QWORD *)((char *)this + 8 * a3);
      *v10 = *((_QWORD *)this + 60);
      v10[6] = *((_QWORD *)this + 61);
      v6 = (char *)this + 736;
      break;
    case 4:
      v3 = 0;
      v4 = a3;
      v11 = (_QWORD *)((char *)this + 8 * a3);
      *v11 = (char *)this + 224;
      v11[6] = (char *)this + 288;
      v6 = (char *)this + 608;
      break;
    case 5:
    case 6:
      v3 = 0;
      v4 = a3;
      v5 = (_QWORD *)((char *)this + 8 * a3);
      *v5 = (char *)this + 96;
      v5[6] = (char *)this + 160;
      v6 = (char *)this + 800;
      break;
    default:
      v4 = a3;
      v7 = (_QWORD *)((char *)this + 8 * a3);
      *v7 = (char *)this + 96;
      v7[6] = (char *)this + 160;
      v6 = (char *)this + 544;
      v3 = 0xFFFFFFFFLL;
      break;
  }
  *((_QWORD *)this + v4 + 62) = v6;
  return v3;
}

uint64_t CScanConverter::SetUpMPEG(CScanConverter *this, unsigned int a2, int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  int v6;

  v3 = ((a2 >> 1) & 1) - 1;
  if ((a2 & 1) != 0)
  {
    v3 = 0;
    v4 = 2;
  }
  else
  {
    v4 = a2 & 2 | 1;
  }
  if ((a2 & 4) != 0)
    v5 = v3;
  else
    v5 = 0;
  if ((a2 & 4) != 0)
    v6 = v4;
  else
    v6 = 1;
  CScanConverter::SetUp(this, v6, a3);
  return v5;
}

uint64_t CScanConverter::SetUpDwt(CScanConverter *this, unsigned int a2, int a3, int a4)
{
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  v4 = ((a2 >> 1) & 1) - 1;
  if ((a2 & 1) != 0)
  {
    v4 = 0;
    v5 = 2;
  }
  else
  {
    v5 = a2 & 2 | 1;
  }
  if (a4)
    v6 = 1;
  else
    v6 = 4;
  if ((a2 & 4) != 0)
    v7 = v4;
  else
    v7 = 0;
  if ((a2 & 4) != 0)
    v8 = v5;
  else
    v8 = v6;
  CScanConverter::SetUp(this, v8, a3);
  return v7;
}

void CBitStream::CBitStream(CBitStream *this)
{
  int32x4_t v1;
  uint64_t v2;
  uint32x4_t v3;
  int32x4_t v4;

  v1 = (int32x4_t)xmmword_219C5F9F0;
  v2 = 24;
  v3.i64[0] = -1;
  v3.i64[1] = -1;
  v4.i64[0] = 0x400000004;
  v4.i64[1] = 0x400000004;
  do
  {
    *(int8x16_t *)((char *)this + v2) = vmvnq_s8((int8x16_t)vshlq_u32(v3, (uint32x4_t)v1));
    v1 = vaddq_s32(v1, v4);
    v2 += 16;
  }
  while (v2 != 152);
  *((_DWORD *)this + 38) = -1;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = 0;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x24BDBBCA0](allocator, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00B8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00D8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x24BDC00E8](theBuffer, offset, length);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x24BDC01A8](desc, extensionKey);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02B8](sbuf);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x24BDC08A0]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x24BDC08A8]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x24BDC09E8]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x24BDF9028]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x24BDF9040]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x24BDF9048]();
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x24BDF9188]();
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x24BDF91D8]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x24BDF91E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

uint64_t operator delete()
{
  return off_24DBC8B50();
}

uint64_t operator new()
{
  return off_24DBC8B58();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}
