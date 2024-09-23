double HDLCFrameFree(uint64_t a1)
{
  void *v2;
  double result;

  v2 = *(void **)(a1 + 24);
  if (v2)
    free(v2);
  if (*(_QWORD *)a1)
    free(*(void **)a1);
  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double HDLCFrameCreateDownlink(uint64_t a1, uint64_t a2, int a3, _DWORD *a4, uint64_t a5, unsigned int a6, int a7, char a8)
{
  double result;
  uint64_t v13;
  int v14;
  uint64_t v15;
  size_t v16;
  char *v17;
  int v18;
  _BYTE *v19;
  BOOL v20;
  int v21;
  int v22;
  int v24;
  char v25;
  unsigned int v26;
  void *v27;
  unsigned __int8 *v28;
  unsigned int v29;
  int v30;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *a4 = 0;
  if (a3)
  {
    v13 = 0;
    while (1)
    {
      v14 = *(unsigned __int8 *)(a2 + v13);
      if (v14 != 126)
        break;
      *a4 = ++v13;
      if (a3 == (_DWORD)v13)
        return result;
    }
    v15 = 0;
    LODWORD(v16) = 0;
    v17 = (char *)(a2 + v13);
    v18 = 1;
    while (a3 - (_DWORD)v13 != v18)
    {
      if (v14 == 125)
        v16 = v16;
      else
        v16 = (v16 + 1);
      v14 = *(unsigned __int8 *)(a2 + v15 + v13 + 1);
      ++v18;
      ++v15;
      if (v14 == 126)
      {
        *a4 = v13 + v15 + 1;
        if (!((v18 - 2) >> 15))
        {
          v19 = malloc(v16);
          *(_QWORD *)a1 = v19;
          if (v19)
          {
            v20 = 0;
            v21 = -(int)v15;
            v22 = v16;
            do
            {
              if (!v22)
              {
                *(_DWORD *)(a1 + 8) = 0;
LABEL_26:
                v27 = *(void **)(a1 + 24);
                if (v27)
                  free(v27);
                if (*(_QWORD *)a1)
                  free(*(void **)a1);
                *(_QWORD *)(a1 + 32) = 0;
                result = 0.0;
                *(_OWORD *)a1 = 0u;
                *(_OWORD *)(a1 + 16) = 0u;
                return result;
              }
              v24 = *v17;
              if (v24 != 125)
              {
                if (v20)
                  v25 = v24 | 0x20;
                else
                  v25 = *v17;
                *v19++ = v25;
                --v22;
              }
              ++v17;
              v20 = v24 == 125;
            }
            while (!__CFADD__(v21++, 1));
            v26 = v16 - v22;
            *(_DWORD *)(a1 + 8) = v16 - v22;
            if (v22 || v26 <= 1)
              goto LABEL_26;
            v28 = *(unsigned __int8 **)a1;
            v29 = v26;
            do
            {
              v30 = *v28++;
              a6 = FCSTable[v30 ^ a6] ^ (a6 >> 8);
              --v29;
            }
            while (v29);
            *(_WORD *)(a1 + 16) = a6;
            *(_DWORD *)(a1 + 8) = v26 - 2;
            *(_DWORD *)(a1 + 12) = v16;
            if ((a8 & 1) != 0 && a6 != a7)
              return HDLCFrameFree(a1);
          }
        }
        return result;
      }
    }
  }
  return result;
}

BOOL HDLCFrameCreateDownlinkFake(uint64_t a1, const void *a2, size_t __size)
{
  int v3;
  size_t v6;
  void *v7;
  void *v8;

  v3 = __size;
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v6 = __size;
  v7 = malloc(__size);
  v8 = v7;
  *(_QWORD *)a1 = v7;
  if (v7)
  {
    *(_WORD *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 8) = v3;
    *(_DWORD *)(a1 + 12) = v3;
    memcpy(v7, a2, v6);
  }
  return v8 != 0;
}

BOOL HDLCFrameCreateUplink(uint64_t a1, size_t __size, __int16 a3)
{
  int v4;
  void *v6;

  v4 = __size;
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v6 = malloc(__size);
  *(_QWORD *)a1 = v6;
  if (v6)
  {
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 16) = a3;
  }
  return v6 != 0;
}

BOOL HDLCFrameInject(uint64_t a1, char *a2, size_t __n)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  int v7;
  char *v8;
  int v9;
  char v10;

  v3 = __n;
  v4 = *(unsigned int *)(a1 + 8);
  v5 = *(_DWORD *)(a1 + 12) - v4;
  if (v5 >= __n)
  {
    LOWORD(v7) = *(_WORD *)(a1 + 16);
    if ((_DWORD)__n)
    {
      v8 = a2;
      v9 = __n;
      do
      {
        v10 = *v8++;
        v7 = FCSTable[(v10 ^ v7)] ^ ((unsigned __int16)(v7 & 0xFF00) >> 8);
        --v9;
      }
      while (v9);
    }
    *(_WORD *)(a1 + 16) = v7;
    memcpy((void *)(*(_QWORD *)a1 + v4), a2, __n);
    *(_DWORD *)(a1 + 8) += v3;
  }
  return v5 >= v3;
}

uint64_t HDLCFrameGetFreeSpace(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) - *(_DWORD *)(a1 + 8));
}

uint64_t HDLCFrameEncode(uint64_t *a1, _BYTE *__b, unsigned int a3, size_t __len)
{
  uint64_t result;
  unsigned int v6;
  uint64_t v7;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BYTE *v14;
  int v15;
  unsigned int v16;
  char v17;
  int v18;
  unsigned int v19;
  _BYTE *v20;
  unsigned int v21;

  result = 0;
  v6 = a3 - __len;
  if (a3 >= __len)
  {
    v7 = *a1;
    if (*a1)
    {
      v9 = __b;
      if ((_DWORD)__len)
      {
        v10 = __len;
        memset(__b, 126, __len);
        v9 += v10;
        v7 = *a1;
        v11 = *((unsigned int *)a1 + 2);
        if ((_DWORD)v11)
        {
LABEL_5:
          v12 = 0;
          v13 = 0;
          v14 = v9;
          while (1)
          {
            v15 = *(unsigned __int8 *)(v7 + v12);
            if ((v15 - 125) <= 1)
            {
              if (!v6)
                break;
              *v14++ = 125;
              LOBYTE(v15) = v15 & 0xDF;
              --v6;
            }
            if (!v6)
              break;
            *v14++ = v15;
            --v6;
            v13 = ++v12 >= v11;
            if (v11 == v12)
              goto LABEL_13;
          }
          v6 = 0;
          result = 0;
          v14 = v9;
          if (!v13)
            return result;
LABEL_13:
          v16 = *((unsigned __int16 *)a1 + 8);
          v17 = ~(_BYTE)v16;
          if ((v16 + 127) <= 1u)
          {
LABEL_14:
            if (!v6)
              return 0;
            *v14++ = 125;
            v17 &= ~0x20u;
            if (!--v6)
              return 0;
LABEL_20:
            v18 = ~(v16 >> 8);
            v19 = v16 >> 8;
            *v14 = v17;
            v20 = v14 + 1;
            v21 = v6 - 1;
            if ((v19 + 127) <= 1u)
            {
              if (v6 == 1)
                return 0;
              v14[1] = 125;
              LOBYTE(v18) = v18 & 0xDF;
              v20 = v14 + 2;
              v21 = v6 - 2;
            }
            if (v21)
            {
              *v20 = v18;
              if (v21 == 1)
                return 0;
              v20[1] = 126;
              return a3 - v21 + 2;
            }
            return 0;
          }
LABEL_19:
          if (!v6)
            return 0;
          goto LABEL_20;
        }
      }
      else
      {
        v6 = a3;
        v11 = *((unsigned int *)a1 + 2);
        if ((_DWORD)v11)
          goto LABEL_5;
      }
      v14 = v9;
      v16 = *((unsigned __int16 *)a1 + 8);
      v17 = ~(_BYTE)v16;
      if ((v16 + 127) <= 1u)
        goto LABEL_14;
      goto LABEL_19;
    }
  }
  return result;
}

uint64_t HDLCFrameGetMaxEncodedLength(uint64_t a1)
{
  uint64_t v1;
  int8x16_t *v2;
  uint64_t v3;
  unsigned int v4;
  int32x4_t v6;
  int8x16_t v7;
  uint8x16_t v8;
  int32x4_t v9;
  int8x16_t v10;
  int8x16_t *v11;
  uint64_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  uint8x16_t v19;
  uint16x8_t v20;
  uint16x8_t v21;
  uint8x16_t v22;
  uint16x8_t v23;
  uint16x8_t v24;
  uint64_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int8x8_t *v28;
  uint64_t v29;
  int8x16_t v30;
  int8x8_t v31;
  uint16x8_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  int v35;

  v1 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v1)
    return 6;
  v2 = *(int8x16_t **)a1;
  if (v1 < 8)
  {
    v3 = 0;
    v4 = 2;
    goto LABEL_14;
  }
  if (v1 >= 0x20)
  {
    v3 = v1 & 0xFFFFFFE0;
    v6 = 0uLL;
    v7.i64[0] = 0x8383838383838383;
    v7.i64[1] = 0x8383838383838383;
    v8.i64[0] = 0x202020202020202;
    v8.i64[1] = 0x202020202020202;
    v9 = (int32x4_t)xmmword_20E5C0F60;
    v10.i64[0] = 0x100000001;
    v10.i64[1] = 0x100000001;
    v11 = v2 + 1;
    v12 = v3;
    v13 = 0uLL;
    v14 = 0uLL;
    v15 = 0uLL;
    v16 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    do
    {
      v19 = vcgtq_u8(v8, (uint8x16_t)vaddq_s8(v11[-1], v7));
      v20 = vmovl_u8(*(uint8x8_t *)v19.i8);
      v21 = vmovl_high_u8(v19);
      v22 = vcgtq_u8(v8, (uint8x16_t)vaddq_s8(*v11, v7));
      v23 = vmovl_u8(*(uint8x8_t *)v22.i8);
      v24 = vmovl_high_u8(v22);
      v14 = vaddq_s32(v14, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v21), v10));
      v13 = vaddq_s32(v13, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v21.i8), v10));
      v6 = vaddq_s32(v6, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v20), v10));
      v9 = vaddq_s32(v9, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v20.i8), v10));
      v18 = vaddq_s32(v18, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v24), v10));
      v17 = vaddq_s32(v17, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v24.i8), v10));
      v16 = vaddq_s32(v16, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v23), v10));
      v15 = vaddq_s32(v15, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v23.i8), v10));
      v11 += 2;
      v12 -= 32;
    }
    while (v12);
    v4 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v15, v9), vaddq_s32(v17, v13)), vaddq_s32(vaddq_s32(v16, v6), vaddq_s32(v18, v14))));
    if (v3 == v1)
      return v4 + 4 + v1;
    if ((v1 & 0x18) == 0)
      goto LABEL_14;
  }
  else
  {
    v3 = 0;
    v4 = 2;
  }
  v25 = v3;
  v3 = v1 & 0xFFFFFFF8;
  v26 = (int32x4_t)v4;
  v27 = 0uLL;
  v28 = (int8x8_t *)&v2->i8[v25];
  v29 = v25 - v3;
  v30.i64[0] = 0x100000001;
  v30.i64[1] = 0x100000001;
  do
  {
    v31 = *v28++;
    v32 = vmovl_u8(vcgt_u8((uint8x8_t)0x202020202020202, (uint8x8_t)vadd_s8(v31, (int8x8_t)0x8383838383838383)));
    v27 = vaddq_s32(v27, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v32), v30));
    v26 = vaddq_s32(v26, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v32.i8), v30));
    v29 += 8;
  }
  while (v29);
  v4 = vaddvq_s32(vaddq_s32(v26, v27));
  if (v3 != v1)
  {
LABEL_14:
    v33 = v1 - v3;
    v34 = &v2->u8[v3];
    do
    {
      v35 = *v34++;
      if ((v35 - 125) < 2)
        ++v4;
      --v33;
    }
    while (v33);
  }
  return v4 + 4 + v1;
}

uint64_t HDLCFrameEncodeAndCache(uint64_t a1, size_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  uint64_t result;
  int32x4_t v11;
  int8x16_t v12;
  uint8x16_t v13;
  int32x4_t v14;
  int8x16_t v15;
  int8x16_t *v16;
  uint64_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  uint8x16_t v24;
  uint16x8_t v25;
  uint16x8_t v26;
  uint8x16_t v27;
  uint16x8_t v28;
  uint16x8_t v29;
  uint64_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int8x8_t *v33;
  uint64_t v34;
  int8x16_t v35;
  int8x8_t v36;
  uint16x8_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;

  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD *)a1;
    if (v4 < 8)
    {
      v6 = 0;
      v7 = 2;
      goto LABEL_17;
    }
    if (v4 >= 0x20)
    {
      v6 = v4 & 0xFFFFFFE0;
      v11 = 0uLL;
      v12.i64[0] = 0x8383838383838383;
      v12.i64[1] = 0x8383838383838383;
      v13.i64[0] = 0x202020202020202;
      v13.i64[1] = 0x202020202020202;
      v14 = (int32x4_t)xmmword_20E5C0F60;
      v15.i64[0] = 0x100000001;
      v15.i64[1] = 0x100000001;
      v16 = (int8x16_t *)(v5 + 16);
      v17 = v6;
      v18 = 0uLL;
      v19 = 0uLL;
      v20 = 0uLL;
      v21 = 0uLL;
      v22 = 0uLL;
      v23 = 0uLL;
      do
      {
        v24 = vcgtq_u8(v13, (uint8x16_t)vaddq_s8(v16[-1], v12));
        v25 = vmovl_u8(*(uint8x8_t *)v24.i8);
        v26 = vmovl_high_u8(v24);
        v27 = vcgtq_u8(v13, (uint8x16_t)vaddq_s8(*v16, v12));
        v28 = vmovl_u8(*(uint8x8_t *)v27.i8);
        v29 = vmovl_high_u8(v27);
        v19 = vaddq_s32(v19, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v26), v15));
        v18 = vaddq_s32(v18, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v26.i8), v15));
        v11 = vaddq_s32(v11, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v25), v15));
        v14 = vaddq_s32(v14, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v25.i8), v15));
        v23 = vaddq_s32(v23, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v29), v15));
        v22 = vaddq_s32(v22, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v29.i8), v15));
        v21 = vaddq_s32(v21, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v28), v15));
        v20 = vaddq_s32(v20, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v28.i8), v15));
        v16 += 2;
        v17 -= 32;
      }
      while (v17);
      v7 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v20, v14), vaddq_s32(v22, v18)), vaddq_s32(vaddq_s32(v21, v11), vaddq_s32(v23, v19))));
      if (v6 == v4)
        goto LABEL_21;
      if ((v4 & 0x18) == 0)
      {
LABEL_17:
        v38 = v4 - v6;
        v39 = (unsigned __int8 *)(v5 + v6);
        do
        {
          v40 = *v39++;
          if ((v40 - 125) < 2)
            ++v7;
          --v38;
        }
        while (v38);
LABEL_21:
        v8 = v7 + 4;
        if (*(_QWORD *)(a1 + 24))
          return 0;
        goto LABEL_5;
      }
    }
    else
    {
      v6 = 0;
      v7 = 2;
    }
    v30 = v6;
    v6 = v4 & 0xFFFFFFF8;
    v31 = (int32x4_t)v7;
    v32 = 0uLL;
    v33 = (int8x8_t *)(v5 + v30);
    v34 = v30 - v6;
    v35.i64[0] = 0x100000001;
    v35.i64[1] = 0x100000001;
    do
    {
      v36 = *v33++;
      v37 = vmovl_u8(vcgt_u8((uint8x8_t)0x202020202020202, (uint8x8_t)vadd_s8(v36, (int8x8_t)0x8383838383838383)));
      v32 = vaddq_s32(v32, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v37), v35));
      v31 = vaddq_s32(v31, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v37.i8), v35));
      v34 += 8;
    }
    while (v34);
    v7 = vaddvq_s32(vaddq_s32(v31, v32));
    if (v6 == v4)
      goto LABEL_21;
    goto LABEL_17;
  }
  v8 = 6;
  if (*(_QWORD *)(a1 + 24))
    return 0;
LABEL_5:
  v9 = v8 + v4;
  result = (uint64_t)malloc((v8 + v4));
  *(_QWORD *)(a1 + 24) = result;
  if (result)
  {
    *(_DWORD *)(a1 + 32) = HDLCFrameEncode((uint64_t *)a1, (_BYTE *)result, v9, a2);
    return 1;
  }
  return result;
}

uint64_t HDLCFrameCloneDownlink(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 0;
  if (a1 && a2)
  {
    if (*(_QWORD *)a2)
    {
      if (*(_DWORD *)(a2 + 12) >= *(_DWORD *)(a2 + 8))
      {
        *(_QWORD *)(a1 + 32) = 0;
        *(_OWORD *)a1 = 0u;
        *(_OWORD *)(a1 + 16) = 0u;
        *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
        *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
        result = (uint64_t)malloc(*(unsigned int *)(a2 + 12));
        *(_QWORD *)a1 = result;
        if (result)
        {
          memcpy((void *)result, *(const void **)a2, *(unsigned int *)(a2 + 8));
          return 1;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL HDLCFrameInjectUnsignedInt(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned __int16 v4;
  unsigned int v5;
  unsigned int v6;

  v2 = *(unsigned int *)(a1 + 8);
  v3 = *(_DWORD *)(a1 + 12) - v2;
  if (v3 >= 4)
  {
    v4 = FCSTable[(*(_WORD *)(a1 + 16) ^ a2)];
    v5 = FCSTable[(v4 ^ ((unsigned __int16)(*(_WORD *)(a1 + 16) ^ a2) >> 8))];
    v6 = FCSTable[(v5 ^ HIBYTE(v4) ^ BYTE2(a2))];
    *(_WORD *)(a1 + 16) = FCSTable[v6 ^ (v5 >> 8) ^ HIBYTE(a2)] ^ (v6 >> 8);
    *(_DWORD *)(*(_QWORD *)a1 + v2) = a2;
    *(_DWORD *)(a1 + 8) += 4;
  }
  return v3 > 3;
}

BOOL HDLCFrameInjectUnsignedShort(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  unsigned int v3;

  v2 = *(unsigned int *)(a1 + 8);
  v3 = *(_DWORD *)(a1 + 12) - v2;
  if (v3 >= 2)
  {
    *(_WORD *)(a1 + 16) = FCSTable[FCSTable[(*(_BYTE *)(a1 + 16) ^ a2)] ^ ((unsigned __int16)((*(_WORD *)(a1 + 16) ^ a2) & 0xFF00) >> 8)] ^ HIBYTE(FCSTable[(*(_BYTE *)(a1 + 16) ^ a2)]);
    *(_WORD *)(*(_QWORD *)a1 + v2) = a2;
    *(_DWORD *)(a1 + 8) += 2;
  }
  return v3 > 1;
}

BOOL HDLCFrameInjectUnsignedChar(uint64_t a1, char a2)
{
  int v2;
  uint64_t v3;

  v3 = *(unsigned int *)(a1 + 8);
  v2 = *(_DWORD *)(a1 + 12);
  if (v2 != (_DWORD)v3)
  {
    *(_WORD *)(a1 + 16) = FCSTable[(*(_WORD *)(a1 + 16) ^ a2)] ^ HIBYTE(*(_WORD *)(a1 + 16));
    *(_BYTE *)(*(_QWORD *)a1 + v3) = a2;
    ++*(_DWORD *)(a1 + 8);
  }
  return v2 != (_DWORD)v3;
}

uint64_t CRCCCITT(uint64_t result, char *a2, int a3)
{
  char v3;

  for (; a3; --a3)
  {
    v3 = *a2++;
    LODWORD(result) = FCSTable[(v3 ^ result)] ^ ((unsigned __int16)(result & 0xFF00) >> 8);
  }
  return (unsigned __int16)result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

