uint64_t PBReaderSkipValueWithTag(void *a1, int a2, int a3)
{
  return _PBReaderSkipValueWithTag(a1, a2, a3, 0);
}

__n128 PB::Reader::recallMark(uint64_t a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  return result;
}

uint64_t PBReaderRecallMark(uint64_t result, _QWORD *a2)
{
  *(_QWORD *)(result + 8) = *a2;
  *(_QWORD *)(result + 40) = a2[1];
  return result;
}

uint64_t PB::Reader::placeMark(uint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  BOOL v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v2 = a1[1];
  if (v2 < 0xFFFFFFFFFFFFFFF6 && v2 + 10 <= a1[2])
  {
    v9 = 0;
    v10 = 0;
    v5 = 0;
    v11 = *a1;
    while (1)
    {
      v6 = v2 + 1;
      a1[1] = v2 + 1;
      v12 = *(_BYTE *)(v11 + v2);
      v5 |= (unint64_t)(v12 & 0x7F) << v9;
      if ((v12 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v6;
      v8 = v10++ > 8;
      if (v8)
      {
LABEL_14:
        v5 = 0;
        break;
      }
    }
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v6 = v2 + 1;
      if (v2 == -1)
      {
        v2 = -1;
LABEL_16:
        v5 = 0;
        *((_BYTE *)a1 + 24) = 1;
        v6 = v2;
        goto LABEL_19;
      }
      if (v6 > a1[2])
        goto LABEL_16;
      v7 = *(_BYTE *)(*a1 + v2);
      a1[1] = v6;
      v5 |= (unint64_t)(v7 & 0x7F) << v3;
      if ((v7 & 0x80) == 0)
        break;
      v3 += 7;
      v2 = v6;
      v8 = v4++ > 8;
      if (v8)
        goto LABEL_14;
    }
    if (*((_BYTE *)a1 + 24))
      v5 = 0;
  }
LABEL_19:
  if (*((_BYTE *)a1 + 24))
    return 0;
  v14 = v6 + v5;
  if (__CFADD__(v6, v5) || (v15 = a1[2], v14 > v15))
  {
    v13 = 0;
    *((_BYTE *)a1 + 24) = 1;
  }
  else
  {
    *a2 = v14;
    a2[1] = v15;
    v13 = 1;
    a1[2] = v14;
  }
  return v13;
}

uint64_t PBReaderReadBigEndianFixed16(void *a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFDLL && (v3 = v2 + 2, v2 + 2 <= v1[5]))
  {
    v4 = *(unsigned __int16 *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    v4 = 0;
    *((_BYTE *)v1 + 16) = 1;
  }
  v5 = __rev16(v4);

  return v5;
}

void PBRepeatedUInt64Clear(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
}

_QWORD *PBDataWriterWriteInt64Field(uint64_t a1, unint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      v14 = a2 >> 7;
      v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *v13 = v14;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

_QWORD *PBDataWriterWriteUint32Field(uint64_t a1, unsigned int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    v8 = v7 - result[2];
    if (v8 <= 0x10)
      v9 = 16;
    else
      v9 = v8;
    -[PBMutableData _pb_growCapacityBy:](result, v9);
    result = *(_QWORD **)(a1 + 8);
  }
  v10 = a2;
  if (a3 != -1)
  {
    v11 = (8 * a3);
    v12 = (_BYTE *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        v13 = v11 >> 7;
        v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *v12 = v13;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v12 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v15 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      v16 = v10 >> 7;
      v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  *v15 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

void PBRepeatedUInt32Clear(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
}

_QWORD *PBRepeatedUInt32Add(_QWORD *result, int a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = result;
  v4 = result[2];
  if (v4)
  {
    v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        result = malloc_type_realloc((void *)*result, 8 * v4, 0x100004052888210uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          v7 = v3[1];
          *((_DWORD *)result + v7) = a2;
          *v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(_DWORD *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    result = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
    *v3 = result;
    if (result)
    {
      v6 = v3[1];
      *((_DWORD *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

BOOL PBUnknownFieldAdd(void *a1, int a2, int a3, void *a4)
{
  _QWORD *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  _BYTE *v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  BOOL v30;
  size_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;
  size_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  size_t v51;
  _BYTE *v52;
  size_t v53;
  size_t v54;
  uint64_t v56;
  _BYTE __src[10];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a4;
  v9 = 0;
  v10 = a3 & 7 | (8 * a2);
  v11 = v10;
  do
  {
    ++v9;
    v12 = v11 > 0x7F;
    v11 >>= 7;
  }
  while (v12);
  if (!_makeSpace(v7, v9))
  {
LABEL_68:
    v17 = 0;
    *((_BYTE *)v8 + 16) = 1;
    goto LABEL_69;
  }
  v13 = (_BYTE *)(v7[1] + v7[3]);
  v14 = v13;
  if (v10 < 0x80)
  {
    LOBYTE(v15) = a3 & 7 | (8 * a2);
  }
  else
  {
    do
    {
      *v14++ = v10 | 0x80;
      v15 = v10 >> 7;
      v16 = v10 >> 14;
      v10 >>= 7;
    }
    while (v16);
  }
  v17 = 0;
  *v14 = v15;
  v7[3] += v14 - v13 + 1;
  switch(a3)
  {
    case 0:
      v18 = 0;
      v19 = *((_QWORD *)v8 + 1);
      while (1)
      {
        if (v18 == 10)
          goto LABEL_68;
        v20 = v19 + v18 + 1;
        if (v19 + v18 == -1 || v20 > *((_QWORD *)v8 + 5))
          break;
        v21 = *(char *)(*((_QWORD *)v8 + 3) + v19 + v18);
        *((_QWORD *)v8 + 1) = v20;
        __src[v18++] = v21;
        if ((v21 & 0x80000000) == 0)
          goto LABEL_48;
      }
      *((_BYTE *)v8 + 16) = 1;
      __src[v18] = 0;
      LOBYTE(v18) = v18 + 1;
LABEL_48:
      v31 = v18;
      if (!_makeSpace(v7, v18))
        goto LABEL_68;
      memcpy((void *)(v7[1] + v7[3]), __src, v31);
      goto LABEL_50;
    case 1:
      if (!_makeSpace(v7, 8))
        goto LABEL_68;
      v22 = v7[3];
      v23 = *((_QWORD *)v8 + 1);
      if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *((_QWORD *)v8 + 5))
      {
        *(_QWORD *)(v7[1] + v22) = *(_QWORD *)(*((_QWORD *)v8 + 3) + v23);
        *((_QWORD *)v8 + 1) += 8;
        v22 = v7[3];
      }
      else
      {
        *((_BYTE *)v8 + 16) = 1;
      }
      v45 = v22 + 8;
      goto LABEL_74;
    case 2:
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = *((_QWORD *)v8 + 1);
      while (2)
      {
        v28 = v27 + 1;
        if (v27 == -1)
        {
          v27 = -1;
          goto LABEL_55;
        }
        if (v28 > *((_QWORD *)v8 + 5))
        {
LABEL_55:
          v31 = 0;
          *((_BYTE *)v8 + 16) = 1;
          v28 = v27;
          goto LABEL_59;
        }
        v29 = *(_BYTE *)(*((_QWORD *)v8 + 3) + v27);
        *((_QWORD *)v8 + 1) = v28;
        v26 |= (unint64_t)(v29 & 0x7F) << v24;
        if (v29 < 0)
        {
          v24 += 7;
          v27 = v28;
          v30 = v25++ >= 9;
          if (v30)
          {
            v31 = 0;
            goto LABEL_59;
          }
          continue;
        }
        break;
      }
      if (*((_BYTE *)v8 + 16))
        v31 = 0;
      else
        v31 = v26;
LABEL_59:
      v47 = 0;
      v48 = v31;
      do
      {
        ++v47;
        v12 = v48 > 0x7F;
        v48 >>= 7;
      }
      while (v12);
      v30 = __CFADD__(v28, v31);
      v49 = v28 + v31;
      if (v30 || v49 > *((_QWORD *)v8 + 5) || !_makeSpace(v7, v47 + v31))
        goto LABEL_68;
      v50 = v7[1] + v7[3];
      if (v31 < 0x80)
      {
        v52 = (_BYTE *)(v7[1] + v7[3]);
        LOBYTE(v53) = v31;
      }
      else
      {
        v51 = v31;
        v52 = (_BYTE *)(v7[1] + v7[3]);
        do
        {
          *v52++ = v51 | 0x80;
          v53 = v51 >> 7;
          v54 = v51 >> 14;
          v51 >>= 7;
        }
        while (v54);
      }
      *v52 = v53;
      v44 = (uint64_t)&v52[v7[3] - v50 + 1];
      v7[3] = v44;
      v56 = *((_QWORD *)v8 + 1);
      if (__CFADD__(v56, v31) || v56 + v31 > *((_QWORD *)v8 + 5))
      {
        *((_BYTE *)v8 + 16) = 1;
      }
      else
      {
        memcpy((void *)(v7[1] + v44), (const void *)(*((_QWORD *)v8 + 3) + v56), v31);
        *((_QWORD *)v8 + 1) += v31;
LABEL_50:
        v44 = v7[3];
      }
      v45 = v44 + v31;
LABEL_74:
      v7[3] = v45;
LABEL_75:
      v17 = *((_BYTE *)v8 + 16) == 0;
LABEL_69:

      return v17;
    case 3:
      v32 = v7[4] + 1;
      v7[4] = v32;
      if (v32 > _sMaximumRecursionDepth)
      {
        v17 = 0;
        goto LABEL_69;
      }
      while (2)
      {
        if (*((_BYTE *)v8 + 16))
          goto LABEL_52;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = *((_QWORD *)v8 + 1);
        while (2)
        {
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *((_QWORD *)v8 + 5))
          {
            v41 = 0;
            v42 = 0;
            *((_BYTE *)v8 + 16) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*((_QWORD *)v8 + 3) + v38);
            *((_QWORD *)v8 + 1) = v39;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v38 = v39;
              v12 = v36++ > 8;
              if (v12)
              {
                v41 = 0;
                v42 = 0;
                break;
              }
              continue;
            }
            v42 = v37 & 7;
            v41 = v37 >> 3;
            if ((_DWORD)v42 == 4 && (_DWORD)v41 == a2)
            {
LABEL_52:
              v46 = v7[4];
              if (v46)
                v7[4] = v46 - 1;
              goto LABEL_75;
            }
          }
          break;
        }
        v17 = 0;
        if ((PBUnknownFieldAdd(v7, v41, v42, v8) & 1) != 0)
          continue;
        goto LABEL_69;
      }
    case 5:
      if (!_makeSpace(v7, 4))
        goto LABEL_68;
      v33 = v7[3];
      v34 = *((_QWORD *)v8 + 1);
      if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *((_QWORD *)v8 + 5))
      {
        *(_DWORD *)(v7[1] + v33) = *(_DWORD *)(*((_QWORD *)v8 + 3) + v34);
        *((_QWORD *)v8 + 1) += 4;
        v33 = v7[3];
      }
      else
      {
        *((_BYTE *)v8 + 16) = 1;
      }
      v45 = v33 + 4;
      goto LABEL_74;
    default:
      goto LABEL_69;
  }
}

BOOL _makeSpace(void *a1, uint64_t a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  _BOOL8 v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;

  v3 = a1;
  v4 = v3;
  v5 = *((_QWORD *)v3 + 3);
  v6 = __CFADD__(v5, a2);
  v7 = v5 + a2;
  if (v6)
    goto LABEL_3;
  if (v7 <= *((_QWORD *)v3 + 2))
  {
    v8 = *((_QWORD *)v3 + 1) != 0;
    goto LABEL_15;
  }
  v9 = 1;
  while (1)
  {
    v10 = v9;
    if (v9 >= v7)
      break;
    v9 *= 2;
    if ((v10 & 0x8000000000000000) != 0)
    {
      v10 = -1;
      break;
    }
  }
  v11 = v10 <= 0x10 ? 16 : v10;
  v12 = malloc_type_realloc(*((void **)v3 + 1), v11, 0x2F04AA8BuLL);
  if (!v12)
  {
LABEL_3:
    v8 = 0;
  }
  else
  {
    v4[1] = v12;
    v4[2] = v11;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

void PBRepeatedInt32Set(uint64_t a1, void *__src, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v6 = 1;
    while (1)
    {
      v7 = v6;
      if (v6 >= a3)
        break;
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        v7 = -1;
        break;
      }
    }
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *(void **)a1;
      if (v8 != v9)
      {
        v10 = malloc_type_realloc(v10, 4 * v8, 0x100004052888210uLL);
        if (!v10)
          return;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 4 * a3);
      *(_QWORD *)(a1 + 8) = a3;
    }
  }
  else
  {
    v11 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v11);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

void PBRepeatedInt32Clear(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
}

BOOL PBRepeatedInt32IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

_QWORD *PBRepeatedInt32Add(_QWORD *result, int a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = result;
  v4 = result[2];
  if (v4)
  {
    v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        result = malloc_type_realloc((void *)*result, 8 * v4, 0x100004052888210uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          v7 = v3[1];
          *((_DWORD *)result + v7) = a2;
          *v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(_DWORD *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    result = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
    *v3 = result;
    if (result)
    {
      v6 = v3[1];
      *((_DWORD *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void _textFormatDictionary(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v6)
  {
    if (*(uint64_t *)a3 >= 1)
    {
      v7 = 0;
      do
      {
        objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR("  "));
        ++v7;
      }
      while (v7 < *(_QWORD *)a3);
    }
    objc_msgSend(*(id *)(a3 + 8), "appendString:", v6);
    objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR(" {\n"));
    ++*(_QWORD *)a3;
  }
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v15, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _textFormat(v16, v15, a3);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  if (v6)
  {
    v17 = (*(_QWORD *)a3)--;
    if (v17 >= 2)
    {
      v18 = 0;
      do
      {
        objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR("  "), (_QWORD)v19);
        ++v18;
      }
      while (v18 < *(_QWORD *)a3);
    }
    objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR("}\n"), (_QWORD)v19);
  }

}

void _textFormatData(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;

  v5 = a1;
  v6 = a2;
  if (*(uint64_t *)a3 >= 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR("  "));
      ++v7;
    }
    while (v7 < *(_QWORD *)a3);
  }
  objc_msgSend(*(id *)(a3 + 8), "appendString:", v6);
  objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR(": \""));
  v16 = objc_retainAutorelease(v5);
  v8 = (unsigned __int8 *)objc_msgSend(v16, "bytes");
  v9 = objc_msgSend(v16, "length");
  if (v9)
  {
    for (i = v9; i; --i)
    {
      v12 = *v8++;
      v11 = v12;
      if (v12 <= 33)
      {
        switch((int)v11)
        {
          case 0:
            v13 = *(void **)(a3 + 8);
            v14 = CFSTR("\\0");
            goto LABEL_21;
          case 7:
            v13 = *(void **)(a3 + 8);
            v14 = CFSTR("\\a");
            goto LABEL_21;
          case 8:
            v13 = *(void **)(a3 + 8);
            v14 = CFSTR("\\b");
            goto LABEL_21;
          case 9:
            v13 = *(void **)(a3 + 8);
            v14 = CFSTR("\\t");
            goto LABEL_21;
          case 10:
            v13 = *(void **)(a3 + 8);
            v14 = CFSTR("\\n");
            goto LABEL_21;
          case 12:
            v13 = *(void **)(a3 + 8);
            v14 = CFSTR("\\f");
            goto LABEL_21;
          case 13:
            v13 = *(void **)(a3 + 8);
            v14 = CFSTR("\\r");
            goto LABEL_21;
          default:
            goto LABEL_24;
        }
      }
      switch((_DWORD)v11)
      {
        case '"':
          v13 = *(void **)(a3 + 8);
          v14 = CFSTR("\\\"");
          break;
        case '\'':
          v13 = *(void **)(a3 + 8);
          v14 = CFSTR("\\'");
          break;
        case '\\':
          v13 = *(void **)(a3 + 8);
          v14 = CFSTR("\\\\");
          break;
        default:
LABEL_24:
          v15 = *(void **)(a3 + 8);
          if ((v11 - 32) < 0x3C || (v11 - 93) <= 0x20)
            objc_msgSend(v15, "appendFormat:", CFSTR("%c"), v11);
          else
            objc_msgSend(v15, "appendFormat:", CFSTR("\\%03hho"), v11);
          continue;
      }
LABEL_21:
      objc_msgSend(v13, "appendString:", v14);
    }
  }
  objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR("\"\n"));

}

void _textFormat(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "description");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    v9 = v6;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          _textFormat(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13++), v9, a3);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
LABEL_11:

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v6;
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _textFormatData(v15, v14, a3);

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _textFormatData(v5, v6, a3);
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    v9 = v6;
    if (*(uint64_t *)a3 >= 1)
    {
      v16 = 0;
      do
      {
        objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR("  "));
        ++v16;
      }
      while (v16 < *(_QWORD *)a3);
    }
    objc_msgSend(*(id *)(a3 + 8), "appendString:", v9);
    objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR(": "));
    v17 = *(void **)(a3 + 8);
    objc_msgSend(v8, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v18);

    objc_msgSend(*(id *)(a3 + 8), "appendString:", CFSTR("\n"));
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _textFormatDictionary(v5, v6, a3);
  }
  else
  {
    v19 = objc_opt_class();
    NSLog(CFSTR("Unhandled value type %@"), v19);
  }
LABEL_24:

}

std::string *PB::Reader::read(std::string *result, std::string *this)
{
  std::string *v2;
  unint64_t size;
  char v4;
  unsigned int v5;
  std::string::size_type v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  char v10;
  unsigned int v11;
  std::string::size_type v12;
  std::string::size_type v13;
  char v14;

  v2 = result;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((_BYTE *)&this->__r_.__value_.__s + 23) = 0;
  }
  size = result->__r_.__value_.__l.__size_;
  if (size < 0xFFFFFFFFFFFFFFF6 && size + 10 <= result->__r_.__value_.__r.__words[2])
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = result->__r_.__value_.__r.__words[0];
    while (1)
    {
      v7 = size + 1;
      result->__r_.__value_.__l.__size_ = size + 1;
      v14 = *(_BYTE *)(v13 + size);
      v12 |= (unint64_t)(v14 & 0x7F) << v10;
      if ((v14 & 0x80) == 0)
        break;
      v10 += 7;
      size = v7;
      v9 = v11++ > 8;
      if (v9)
      {
LABEL_17:
        v12 = 0;
        break;
      }
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = size + 1;
      if (size == -1)
      {
        size = -1;
LABEL_19:
        v12 = 0;
        result[1].__r_.__value_.__s.__data_[0] = 1;
        v7 = size;
        goto LABEL_23;
      }
      if (v7 > result->__r_.__value_.__r.__words[2])
        goto LABEL_19;
      v8 = *(_BYTE *)(result->__r_.__value_.__r.__words[0] + size);
      result->__r_.__value_.__l.__size_ = v7;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        break;
      v4 += 7;
      size = v7;
      v9 = v5++ > 8;
      if (v9)
        goto LABEL_17;
    }
    if (result[1].__r_.__value_.__s.__data_[0])
      v12 = 0;
    else
      v12 = v6;
  }
LABEL_23:
  if (!result[1].__r_.__value_.__s.__data_[0])
  {
    if (__CFADD__(v7, v12) || v7 + v12 > result->__r_.__value_.__r.__words[2])
    {
      result[1].__r_.__value_.__s.__data_[0] = 1;
    }
    else
    {
      result = std::string::insert(this, 0, (const std::string::value_type *)(result->__r_.__value_.__r.__words[0] + v7), v12);
      v2->__r_.__value_.__l.__size_ += v12;
    }
  }
  return result;
}

id PBReaderReadData(void *a1)
{
  id v1;
  _QWORD *v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  void *v11;

  v1 = a1;
  v2 = v1;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = *((_QWORD *)v1 + 1);
  do
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > *((_QWORD *)v1 + 5))
      goto LABEL_15;
    v8 = *(_BYTE *)(*((_QWORD *)v1 + 3) + v6);
    *((_QWORD *)v1 + 1) = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
    {
      if (*((_BYTE *)v1 + 16))
        v10 = 0;
      else
        v10 = v5;
      if (*((_BYTE *)v1 + 16))
        goto LABEL_8;
      goto LABEL_13;
    }
    v3 += 7;
    v6 = v7;
  }
  while (v4++ < 9);
  v10 = 0;
  if (*((_BYTE *)v1 + 16))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_16;
  }
LABEL_13:
  if (__CFADD__(v7, v10) || v7 + v10 > *((_QWORD *)v1 + 5))
  {
LABEL_15:
    v11 = 0;
    *((_BYTE *)v1 + 16) = 1;
  }
  else
  {
    objc_msgSend(*((id *)v1 + 4), "subdataWithRange:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2[1] += v10;
  }
LABEL_16:

  return v11;
}

uint64_t PBReaderReadBigEndianFixed32(void *a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFBLL && (v3 = v2 + 4, v2 + 4 <= v1[5]))
  {
    v4 = *(_DWORD *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    v4 = 0;
    *((_BYTE *)v1 + 16) = 1;
  }
  v5 = bswap32(v4);

  return v5;
}

uint64_t _PBReaderSkipValueWithTag(void *a1, int a2, int a3, uint64_t a4)
{
  _QWORD *v7;
  unint64_t *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  unint64_t v24;
  char v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v34;

  v7 = a1;
  v8 = v7;
  v9 = 0;
  switch(a3)
  {
    case 0:
      v10 = 0;
      v11 = v7[1];
      v9 = 1;
      do
      {
        v12 = v11 + 1;
        if (v11 == -1 || v12 > v7[5])
          goto LABEL_43;
        v13 = *(char *)(v7[3] + v11);
        v7[1] = v12;
        if ((v13 & 0x80000000) == 0)
          break;
        v11 = v12;
        v14 = v10++ > 8;
      }
      while (!v14);
      goto LABEL_46;
    case 1:
      v15 = v7[1];
      if (v15 > 0xFFFFFFFFFFFFFFF7)
        goto LABEL_43;
      v16 = v15 + 8;
      goto LABEL_42;
    case 2:
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = v7[1];
      while (2)
      {
        v21 = v20 + 1;
        if (v20 == -1)
        {
          v20 = -1;
          goto LABEL_38;
        }
        if (v21 > v7[5])
        {
LABEL_38:
          v19 = 0;
          *((_BYTE *)v7 + 16) = 1;
          v21 = v20;
          goto LABEL_41;
        }
        v22 = *(_BYTE *)(v7[3] + v20);
        v7[1] = v21;
        v19 |= (unint64_t)(v22 & 0x7F) << v17;
        if (v22 < 0)
        {
          v17 += 7;
          v20 = v21;
          v23 = v18++ >= 9;
          if (v23)
          {
            v19 = 0;
            goto LABEL_41;
          }
          continue;
        }
        break;
      }
      v19 = v19;
      if (*((_BYTE *)v7 + 16))
        v19 = 0;
LABEL_41:
      v23 = __CFADD__(v21, v19);
      v16 = v21 + v19;
      if (v23)
        goto LABEL_43;
LABEL_42:
      if (v16 > v7[5])
      {
LABEL_43:
        v9 = 1;
        *((_BYTE *)v8 + 16) = 1;
        goto LABEL_46;
      }
      v7[1] = v16;
LABEL_45:
      v9 = 1;
LABEL_46:

      return v9;
    case 3:
      v9 = 1;
      if (*((_BYTE *)v7 + 16))
        goto LABEL_46;
      v24 = a4 + 1;
      do
      {
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v28 = v8[1];
        while (1)
        {
          v29 = v28 + 1;
          if (v28 == -1 || v29 > v8[5])
          {
            v31 = 0;
            v32 = 0;
            *((_BYTE *)v8 + 16) = 1;
            goto LABEL_32;
          }
          v30 = *(_BYTE *)(v8[3] + v28);
          v8[1] = v29;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0)
            break;
          v25 += 7;
          v28 = v29;
          v14 = v26++ > 8;
          if (v14)
          {
            v31 = 0;
            v32 = 0;
            goto LABEL_32;
          }
        }
        v32 = v27 & 7;
        v31 = v27 >> 3;
        if ((_DWORD)v32 == 4 && (_DWORD)v31 == a2)
          goto LABEL_45;
LABEL_32:
        if (v24 >= 0x41)
          goto LABEL_43;
        _PBReaderSkipValueWithTag(v8, v31, v32, v24);
      }
      while (!*((_BYTE *)v8 + 16));
      goto LABEL_46;
    case 5:
      v34 = v7[1];
      if (v34 > 0xFFFFFFFFFFFFFFFBLL)
        goto LABEL_43;
      v16 = v34 + 4;
      goto LABEL_42;
    default:
      goto LABEL_46;
  }
}

void PBDataWriterWriteStringField(uint64_t a1, void *a2, int a3)
{
  id v5;
  size_t v6;
  _QWORD *v7;
  size_t v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const void *v17;
  size_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  unint64_t v31;
  unint64_t v32;
  _BYTE *v33;
  size_t v34;
  size_t v35;
  size_t v36;
  _BYTE *v37;
  _BYTE *v38;
  size_t v39;
  size_t v40;
  size_t v41;
  size_t __n;
  _BYTE __src[1000];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xA5
    && (__n = 0,
        objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 1000, &__n, 4, 4, 0, objc_msgSend(v5, "length"), 0)))
  {
    v6 = __n;
    v7 = *(_QWORD **)(a1 + 8);
    v8 = v7[3];
    if (v8 < v7[1] + __n + 16)
    {
      if (v8 - v7[2] <= __n + 16)
        v9 = __n + 16;
      else
        v9 = v8 - v7[2];
      -[PBMutableData _pb_growCapacityBy:](v7, v9);
      v7 = *(_QWORD **)(a1 + 8);
    }
    if (a3 != -1)
    {
      v10 = (8 * a3) | 2u;
      v11 = (_BYTE *)v7[1];
      if (v10 < 0x80)
      {
        LOBYTE(v12) = (8 * a3) | 2;
      }
      else
      {
        do
        {
          *v11++ = v10 | 0x80;
          v12 = v10 >> 7;
          v13 = v10 >> 14;
          v10 >>= 7;
        }
        while (v13);
      }
      *v11 = v12;
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v11 + 1;
      v7 = *(_QWORD **)(a1 + 8);
    }
    v38 = (_BYTE *)v7[1];
    if (v6 < 0x80)
    {
      LOBYTE(v40) = v6;
    }
    else
    {
      v39 = v6;
      do
      {
        *v38++ = v39 | 0x80;
        v40 = v39 >> 7;
        v41 = v39 >> 14;
        v39 >>= 7;
      }
      while (v41);
    }
    *v38 = v40;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v38 + 1;
    memcpy(*(void **)(*(_QWORD *)(a1 + 8) + 8), __src, v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v6;
  }
  else
  {
    v14 = (void *)MEMORY[0x1A85B6664]();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      v16 = objc_retainAutorelease(v15);
      v17 = (const void *)objc_msgSend(v16, "bytes");
      v18 = objc_msgSend(v16, "length");
      v19 = *(_QWORD **)(a1 + 8);
      v20 = v19[3];
      if (v20 < v19[1] + v18 + 16)
      {
        if (v20 - v19[2] <= v18 + 16)
          v21 = v18 + 16;
        else
          v21 = v20 - v19[2];
        -[PBMutableData _pb_growCapacityBy:](v19, v21);
        v19 = *(_QWORD **)(a1 + 8);
      }
      if (a3 != -1)
      {
        v22 = (8 * a3) | 2u;
        v23 = (_BYTE *)v19[1];
        if (v22 < 0x80)
        {
          LOBYTE(v24) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v23++ = v22 | 0x80;
            v24 = v22 >> 7;
            v25 = v22 >> 14;
            v22 >>= 7;
          }
          while (v25);
        }
        *v23 = v24;
        *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v23 + 1;
        v19 = *(_QWORD **)(a1 + 8);
      }
      v33 = (_BYTE *)v19[1];
      if (v18 < 0x80)
      {
        LOBYTE(v35) = v18;
      }
      else
      {
        v34 = v18;
        do
        {
          *v33++ = v34 | 0x80;
          v35 = v34 >> 7;
          v36 = v34 >> 14;
          v34 >>= 7;
        }
        while (v36);
      }
      *v33 = v35;
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v33 + 1;
      memcpy(*(void **)(*(_QWORD *)(a1 + 8) + 8), v17, v18);
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v18;
    }
    else
    {
      v26 = *(_QWORD **)(a1 + 8);
      v27 = v26[3];
      if (v27 < v26[1] + 16)
      {
        if (v27 - v26[2] <= 0x10)
          v28 = 16;
        else
          v28 = v27 - v26[2];
        -[PBMutableData _pb_growCapacityBy:](v26, v28);
        v26 = *(_QWORD **)(a1 + 8);
      }
      if (a3 != -1)
      {
        v29 = (8 * a3) | 2u;
        v30 = (_BYTE *)v26[1];
        if (v29 < 0x80)
        {
          LOBYTE(v31) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v30++ = v29 | 0x80;
            v31 = v29 >> 7;
            v32 = v29 >> 14;
            v29 >>= 7;
          }
          while (v32);
        }
        *v30 = v31;
        *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v30 + 1;
        v26 = *(_QWORD **)(a1 + 8);
      }
      v37 = (_BYTE *)v26[1];
      *v37 = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v37 + 1;
    }

    objc_autoreleasePoolPop(v14);
  }

}

uint64_t PBReaderPlaceMark(void *a1, unint64_t *a2)
{
  _QWORD *v3;
  char v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v11;
  uint64_t v12;

  v3 = a1;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = v3[1];
  do
  {
    v8 = v7 + 1;
    if (v7 == -1 || v8 > v3[5])
      goto LABEL_9;
    v9 = *(_BYTE *)(v3[3] + v7);
    v3[1] = v8;
    v6 |= (unint64_t)(v9 & 0x7F) << v4;
    if ((v9 & 0x80) == 0)
    {
      v6 = v6;
      if (!*((_BYTE *)v3 + 16))
        goto LABEL_8;
LABEL_11:
      v12 = 0;
      goto LABEL_13;
    }
    v4 += 7;
    v7 = v8;
  }
  while (v5++ < 9);
  v6 = 0;
  if (*((_BYTE *)v3 + 16))
    goto LABEL_11;
LABEL_8:
  v11 = v8 + v6;
  if (v11 > v3[5])
  {
LABEL_9:
    v12 = 0;
    *((_BYTE *)v3 + 16) = 1;
    goto LABEL_13;
  }
  *a2 = v11;
  a2[1] = v3[5];
  v3[5] = v3[1] + v6;
  v12 = 1;
LABEL_13:

  return v12;
}

id PBReaderReadString(void *a1)
{
  id v1;
  _QWORD *v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;

  v1 = a1;
  v2 = v1;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = *((_QWORD *)v1 + 1);
  do
  {
    v7 = v6 + 1;
    if (v6 == -1 || v7 > *((_QWORD *)v1 + 5))
      goto LABEL_15;
    v8 = *(_BYTE *)(*((_QWORD *)v1 + 3) + v6);
    *((_QWORD *)v1 + 1) = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
    {
      if (*((_BYTE *)v1 + 16))
        v10 = 0;
      else
        v10 = v5;
      if (*((_BYTE *)v1 + 16))
        goto LABEL_8;
      goto LABEL_13;
    }
    v3 += 7;
    v6 = v7;
    v9 = v4++ >= 9;
  }
  while (!v9);
  v10 = 0;
  if (*((_BYTE *)v1 + 16))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v9 = __CFADD__(v7, v10);
  v12 = v7 + v10;
  if (v9 || v12 > *((_QWORD *)v1 + 5))
  {
LABEL_15:
    v11 = 0;
    *((_BYTE *)v1 + 16) = 1;
  }
  else
  {
    v14 = objc_msgSend(*((id *)v1 + 4), "bytes") + *((_QWORD *)v1 + 1);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v14, v10, 4);
    v2[1] += v10;
  }
LABEL_16:

  return v11;
}

void PBDataWriterWriteDataField(uint64_t a1, void *a2, int a3)
{
  const void *v5;
  size_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  size_t v15;
  size_t v16;
  size_t v17;
  id v18;

  v18 = objc_retainAutorelease(a2);
  v5 = (const void *)objc_msgSend(v18, "bytes");
  v6 = objc_msgSend(v18, "length");
  v7 = *(_QWORD **)(a1 + 8);
  v8 = v7[3];
  if (v8 < v7[1] + v6 + 16)
  {
    if (v8 - v7[2] <= v6 + 16)
      v9 = v6 + 16;
    else
      v9 = v8 - v7[2];
    -[PBMutableData _pb_growCapacityBy:](v7, v9);
    v7 = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v10 = (8 * a3) | 2u;
    v11 = (_BYTE *)v7[1];
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        v12 = v10 >> 7;
        v13 = v10 >> 14;
        v10 >>= 7;
      }
      while (v13);
    }
    *v11 = v12;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v11 + 1;
    v7 = *(_QWORD **)(a1 + 8);
  }
  v14 = (_BYTE *)v7[1];
  if (v6 < 0x80)
  {
    LOBYTE(v16) = v6;
  }
  else
  {
    v15 = v6;
    do
    {
      *v14++ = v15 | 0x80;
      v16 = v15 >> 7;
      v17 = v15 >> 14;
      v15 >>= 7;
    }
    while (v17);
  }
  *v14 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v14 + 1;
  memcpy(*(void **)(*(_QWORD *)(a1 + 8) + 8), v5, v6);
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v6;

}

_QWORD *PBDataWriterWriteSubmessage(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v7;

  v7 = 0;
  v5 = a2;
  PBDataWriterPlaceMark(a1, &v7, a3);
  objc_msgSend(v5, "writeTo:", a1);

  return PBDataWriterRecallMark(a1, &v7);
}

_QWORD *PBDataWriterWriteDoubleField(uint64_t a1, int a2, double a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18)
      v8 = 24;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a2 != -1)
  {
    v9 = (8 * a2) | 1u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(double *)result[1] = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 8;
  return result;
}

_QWORD *PBDataWriterRecallMark(uint64_t a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  size_t v16;
  size_t v17;

  result = *(_QWORD **)(a1 + 8);
  v5 = result[1];
  v6 = result[2];
  v7 = *a2;
  v8 = v5 - (*a2 + v6);
  v9 = -1;
  v10 = v8;
  do
  {
    ++v9;
    v11 = v10 > 0x7F;
    v10 >>= 7;
  }
  while (v11);
  if (v9)
  {
    v12 = result[3];
    if (v12 < v5 + v9)
    {
      v13 = v12 - v6;
      if (v13 <= v9)
        v14 = v9;
      else
        v14 = v13;
      -[PBMutableData _pb_growCapacityBy:](result, v14);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
      v7 = *a2;
    }
    result = memmove((void *)(v6 + v7 + v9), (const void *)(v6 + v7), v8);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
    v7 = *a2;
  }
  v15 = (_BYTE *)(v6 + v7 - 1);
  if (v8 < 0x80)
  {
    LOBYTE(v16) = v8;
  }
  else
  {
    do
    {
      *v15++ = v8 | 0x80;
      v16 = v8 >> 7;
      v17 = v8 >> 14;
      v8 >>= 7;
    }
    while (v17);
  }
  *v15 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += v9;
  return result;
}

_QWORD *PBDataWriterPlaceMark(uint64_t a1, _QWORD *a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 10)
  {
    if (v7 - result[2] <= 0xA)
      v8 = 10;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 2u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  ++result[1];
  *a2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) - *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
  return result;
}

_QWORD *PBDataWriterWriteBOOLField(uint64_t a1, char a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  *v13 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

_QWORD *PBDataWriterWriteInt32Field(uint64_t a1, unsigned int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    v8 = v7 - result[2];
    if (v8 <= 0x10)
      v9 = 16;
    else
      v9 = v8;
    -[PBMutableData _pb_growCapacityBy:](result, v9);
    result = *(_QWORD **)(a1 + 8);
  }
  v10 = (int)a2;
  if (a3 != -1)
  {
    v11 = (8 * a3);
    v12 = (_BYTE *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        v13 = v11 >> 7;
        v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *v12 = v13;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v12 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v15 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      v16 = v10 >> 7;
      v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  *v15 = v16;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

void PBRepeatedInt32Copy(uint64_t a1, uint64_t a2)
{
  PBRepeatedInt32Set(a1, *(void **)a2, *(_QWORD *)(a2 + 8));
}

void PBRepeatedInt64Clear(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
}

_QWORD *PBDataWriterWriteUint64Field(uint64_t a1, unint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      v14 = a2 >> 7;
      v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *v13 = v14;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

uint64_t PBHashBytes(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;

  if ((int)a2 < 4)
  {
    v2 = 0;
    LODWORD(v3) = a2;
  }
  else
  {
    v2 = 0;
    v3 = (int)a2;
    v4 = (unsigned __int8 *)(a1 + 3);
    do
    {
      v5 = *(v4 - 3) + 16 * v2;
      v6 = *(v4 - 2) + 16 * (v5 ^ (16 * (v5 >> 28)));
      v7 = *(v4 - 1) + 16 * (v6 ^ (16 * (v6 >> 28)));
      v8 = *v4;
      v4 += 4;
      v9 = v8 + 16 * (v7 ^ (16 * (v7 >> 28)));
      v10 = v3;
      v2 = (v9 ^ ((v9 & 0xF0000000) >> 24)) & ~(v9 & 0xF0000000);
      v3 -= 4;
    }
    while (v10 > 7);
  }
  switch((_DWORD)v3)
  {
    case 1:
      v11 = a2 << 32;
LABEL_13:
      v14 = *(unsigned __int8 *)(a1 + ((v11 - 0x100000000) >> 32)) + 16 * v2;
      return (v14 ^ ((v14 & 0xF0000000) >> 24)) & ~(v14 & 0xF0000000);
    case 3:
      v11 = a2 << 32;
      v12 = *(unsigned __int8 *)(a1 + (((a2 << 32) - 0x300000000) >> 32)) + 16 * v2;
      v2 = (v12 ^ ((v12 & 0xF0000000) >> 24)) & ~(v12 & 0xF0000000);
      goto LABEL_12;
    case 2:
      v11 = a2 << 32;
LABEL_12:
      v13 = *(unsigned __int8 *)(a1 + ((v11 - 0x200000000) >> 32)) + 16 * v2;
      v2 = (v13 ^ ((v13 & 0xF0000000) >> 24)) & ~(v13 & 0xF0000000);
      goto LABEL_13;
  }
  return v2;
}

_QWORD *PBDataWriterWriteFloatField(uint64_t a1, int a2, float a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14)
      v8 = 20;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a2 != -1)
  {
    v9 = (8 * a2) | 5u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(float *)result[1] = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 4;
  return result;
}

uint64_t PBRepeatedInt32Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

uint64_t PBDataWriterWriteBareVarint(_BYTE *a1, unint64_t a2)
{
  _BYTE *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = a1;
  if (a2 < 0x80)
  {
    LOBYTE(v3) = a2;
  }
  else
  {
    do
    {
      *v2++ = a2 | 0x80;
      v3 = a2 >> 7;
      v4 = a2 >> 14;
      a2 >>= 7;
    }
    while (v4);
  }
  *v2 = v3;
  return v2 - a1 + 1;
}

void PBRepeatedDoubleClear(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
}

void PBRepeatedUInt64Copy(uint64_t a1, uint64_t a2)
{
  PBRepeatedUInt64Set(a1, *(void **)a2, *(_QWORD *)(a2 + 8));
}

uint64_t PBReaderReadVarIntBuf(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t result;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  while (1)
  {
    if (a2 == v5)
      return 0;
    v7 = *(_BYTE *)(a1 + v5);
    v6 |= (unint64_t)(v7 & 0x7F) << v4;
    ++v5;
    if ((v7 & 0x80) == 0)
      break;
    v4 += 7;
    if (v5 == 10)
    {
      result = 0;
      *a4 = 11;
      *a3 = 0;
      return result;
    }
  }
  *a3 = v6;
  *a4 = v5;
  return 1;
}

uint64_t PB::Reader::Reader(uint64_t this, const unsigned __int8 *a2, uint64_t a3)
{
  *(_QWORD *)this = a2;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = a3;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = a2;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = a3;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

void PBRepeatedInt64Copy(uint64_t a1, uint64_t a2)
{
  PBRepeatedInt64Set(a1, *(void **)a2, *(_QWORD *)(a2 + 8));
}

void PBRepeatedUInt64Set(uint64_t a1, void *__src, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v6 = 1;
    while (1)
    {
      v7 = v6;
      if (v6 >= a3)
        break;
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        v7 = -1;
        break;
      }
    }
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *(void **)a1;
      if (v8 != v9)
      {
        v10 = malloc_type_realloc(v10, 8 * v8, 0x100004000313F17uLL);
        if (!v10)
          return;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 8 * a3);
      *(_QWORD *)(a1 + 8) = a3;
    }
  }
  else
  {
    v11 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v11);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

_QWORD *PBDataWriterWriteFixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18)
      v8 = 24;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 1u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_QWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 8;
  return result;
}

_QWORD *PBRepeatedUInt64Add(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = result;
  v4 = result[2];
  if (v4)
  {
    v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        result = malloc_type_realloc((void *)*result, 16 * v4, 0x100004000313F17uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          v7 = v3[1];
          result[v7] = a2;
          *v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(_QWORD *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    result = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *v3 = result;
    if (result)
    {
      v6 = v3[1];
      result[v6] = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void PBRepeatedInt64Set(uint64_t a1, void *__src, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v6 = 1;
    while (1)
    {
      v7 = v6;
      if (v6 >= a3)
        break;
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        v7 = -1;
        break;
      }
    }
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *(void **)a1;
      if (v8 != v9)
      {
        v10 = malloc_type_realloc(v10, 8 * v8, 0x100004000313F17uLL);
        if (!v10)
          return;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 8 * a3);
      *(_QWORD *)(a1 + 8) = a3;
    }
  }
  else
  {
    v11 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v11);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

void _dictionaryRepresentation(void *a1, unint64_t a2, int a3, void *a4)
{
  id v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  void *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;

  v41 = a1;
  v7 = a4;
  v8 = v41;
  v9 = v41[1];
  v10 = v41[5];
  if (v9 >= v10)
    goto LABEL_52;
  do
  {
    if (*((_BYTE *)v8 + 16))
      break;
    if (a3 == 6)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (v9 < v10)
      {
        v14 = v9 + 1;
        v15 = *(_BYTE *)(v8[3] + v9);
        v8[1] = v14;
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0)
          goto LABEL_11;
        v11 += 7;
        v9 = v14;
        v16 = v12++ >= 9;
        if (v16)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v13 = 0;
      *((_BYTE *)v8 + 16) = 1;
LABEL_11:
      a3 = v13 & 7;
      a2 = v13 >> 3;
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a2);
    switch(a3)
    {
      case 0:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v21 = v41;
        v22 = v41[1];
        while (1)
        {
          v23 = v22 + 1;
          if (v22 == -1 || v23 > v41[5])
            goto LABEL_22;
          v24 = *(_BYTE *)(v41[3] + v22);
          v41[1] = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
          {
            if (*((_BYTE *)v41 + 16))
              v25 = 0;
            else
              v25 = v20;
            goto LABEL_23;
          }
          v18 += 7;
          v22 = v23;
          v16 = v19++ >= 9;
          if (v16)
          {
            v25 = 0;
            goto LABEL_23;
          }
        }
      case 1:
        v21 = v41;
        v26 = v41[1];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= v41[5])
        {
          v25 = *(_QWORD *)(v41[3] + v26);
          v41[1] = v26 + 8;
        }
        else
        {
LABEL_22:
          v25 = 0;
          *((_BYTE *)v21 + 16) = 1;
        }
LABEL_23:
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v25);
        goto LABEL_48;
      case 2:
        PBReaderReadData(v41);
        v27 = objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 3:
        v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v29 = v41;
        if (*((_BYTE *)v41 + 16))
          goto LABEL_49;
        v30 = 0;
        v31 = 0;
        v32 = 0;
        break;
      case 5:
        v39 = v41[1];
        if (v39 <= 0xFFFFFFFFFFFFFFFBLL && v39 + 4 <= v41[5])
        {
          v40 = *(unsigned int *)(v41[3] + v39);
          v41[1] = v39 + 4;
        }
        else
        {
          v40 = 0;
          *((_BYTE *)v41 + 16) = 1;
        }
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", v40);
LABEL_48:
        v28 = (id)v27;
        goto LABEL_49;
      default:
        goto LABEL_51;
    }
    while (1)
    {
      while (1)
      {
        v33 = v29[1];
        v34 = v33 + 1;
        if (v33 != -1 && v34 <= v29[5])
          break;
        v35 = 0;
        v36 = 0;
        *((_BYTE *)v29 + 16) = 1;
LABEL_30:
        _dictionaryRepresentation(v41, v35, v36, v28);
        v29 = v41;
        v30 = 0;
        v31 = 0;
        v32 = 0;
        if (*((_BYTE *)v41 + 16))
          goto LABEL_49;
      }
      v37 = *(_BYTE *)(v29[3] + v33);
      v29[1] = v34;
      v32 |= (unint64_t)(v37 & 0x7F) << v30;
      if ((v37 & 0x80) == 0)
        break;
      v30 += 7;
      if (v31++ > 8)
      {
        v35 = 0;
        v36 = 0;
        goto LABEL_30;
      }
    }
    v36 = v32 & 7;
    v35 = v32 >> 3;
    if ((_DWORD)v36 != 4)
      goto LABEL_30;
    if ((_DWORD)a2 != (_DWORD)v35)
    {
      v36 = 4;
      goto LABEL_30;
    }
LABEL_49:
    if (v28)
    {
      objc_msgSend(v7, "setObject:forKey:", v28, v17);

    }
LABEL_51:

    v8 = v41;
    v9 = v41[1];
    v10 = v41[5];
    a3 = 6;
  }
  while (v9 < v10);
LABEL_52:

}

void sub_1A5E126DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

unint64_t PBReaderReadBigEndianFixed64(void *a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = a1;
  v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFF7 && (v3 = v2 + 8, v2 + 8 <= v1[5]))
  {
    v4 = *(_QWORD *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    v4 = 0;
    *((_BYTE *)v1 + 16) = 1;
  }
  v5 = bswap64(v4);

  return v5;
}

_QWORD *PBDataWriterWriteSfixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18)
      v8 = 24;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 1u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_QWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 8;
  return result;
}

_QWORD *PBDataWriterWriteSfixed32Field(uint64_t a1, int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14)
      v8 = 20;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 5u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 4;
  return result;
}

_QWORD *PBDataWriterWriteFixed32Field(uint64_t a1, int a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;

  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14)
      v8 = 20;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3) | 5u;
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) += 4;
  return result;
}

_QWORD *PBDataWriterWriteSint32Field(uint64_t a1, int a2, int a3)
{
  unint64_t v5;
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;

  v5 = (2 * a2) ^ (a2 >> 31);
  result = *(_QWORD **)(a1 + 8);
  v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10)
      v8 = 16;
    else
      v8 = v7 - result[2];
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    result = *(_QWORD **)(a1 + 8);
  }
  if (a3 != -1)
  {
    v9 = (8 * a3);
    v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *v10 = v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v10 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v13 = (_BYTE *)result[1];
  if (v5 < 0x80)
  {
    LOBYTE(v14) = v5;
  }
  else
  {
    do
    {
      *v13++ = v5 | 0x80;
      v14 = v5 >> 7;
      v15 = v5 >> 14;
      v5 >>= 7;
    }
    while (v15);
  }
  *v13 = v14;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

_QWORD *PBDataWriterWriteSint64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  _QWORD *result;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;

  v6 = 2 * a2;
  result = *(_QWORD **)(a1 + 8);
  v8 = result[3];
  if (v8 < result[1] + 16)
  {
    v9 = v8 - result[2];
    if (v9 <= 0x10)
      v10 = 16;
    else
      v10 = v9;
    -[PBMutableData _pb_growCapacityBy:](result, v10);
    result = *(_QWORD **)(a1 + 8);
  }
  v11 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    v12 = (8 * a3);
    v13 = (_BYTE *)result[1];
    if (v12 < 0x80)
    {
      LOBYTE(v14) = 8 * a3;
    }
    else
    {
      do
      {
        *v13++ = v12 | 0x80;
        v14 = v12 >> 7;
        v15 = v12 >> 14;
        v12 >>= 7;
      }
      while (v15);
    }
    *v13 = v14;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v13 + 1;
    result = *(_QWORD **)(a1 + 8);
  }
  v16 = (_BYTE *)result[1];
  if (v11 < 0x80)
  {
    v17 = v6 ^ (a2 >> 63);
  }
  else
  {
    do
    {
      *v16++ = v11 | 0x80;
      v17 = v11 >> 7;
      v18 = v11 >> 14;
      v11 >>= 7;
    }
    while (v18);
  }
  *v16 = v17;
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v16 + 1;
  return result;
}

void PBDataWriterWriteSubgroup(uint64_t a1, void *a2, int a3)
{
  id v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  unint64_t v21;
  id v22;

  v5 = a2;
  v6 = *(_QWORD **)(a1 + 8);
  v7 = v6[3];
  v22 = v5;
  if (v7 < v6[1] + 8)
  {
    v8 = v7 - v6[2];
    if (v8 <= 8)
      v9 = 8;
    else
      v9 = v8;
    -[PBMutableData _pb_growCapacityBy:](v6, v9);
    v5 = v22;
  }
  if (a3 != -1)
  {
    v10 = (8 * a3) | 3u;
    v11 = *(_BYTE **)(*(_QWORD *)(a1 + 8) + 8);
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 3;
    }
    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        v12 = v10 >> 7;
        v13 = v10 >> 14;
        v10 >>= 7;
      }
      while (v13);
    }
    *v11 = v12;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v11 + 1;
  }
  objc_msgSend(v5, "writeTo:", a1);
  v14 = *(_QWORD **)(a1 + 8);
  v15 = v14[3];
  if (v15 < v14[1] + 8)
  {
    v16 = v15 - v14[2];
    if (v16 <= 8)
      v17 = 8;
    else
      v17 = v16;
    -[PBMutableData _pb_growCapacityBy:](v14, v17);
  }
  if (a3 != -1)
  {
    v18 = (8 * a3) | 4u;
    v19 = *(_BYTE **)(*(_QWORD *)(a1 + 8) + 8);
    if (v18 < 0x80)
    {
      LOBYTE(v20) = (8 * a3) | 4;
    }
    else
    {
      do
      {
        *v19++ = v18 | 0x80;
        v20 = v18 >> 7;
        v21 = v18 >> 14;
        v18 >>= 7;
      }
      while (v21);
    }
    *v19 = v20;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) = v19 + 1;
  }

}

uint64_t PB::Base::formattedText(PB::Base *this)
{
  uint64_t v2;
  _QWORD v4[13];
  char v5;
  uint64_t v6;
  void *__p;
  char v8;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v4);
  v8 = 0;
  LOBYTE(__p) = 0;
  (*(void (**)(PB::Base *, _QWORD *, _QWORD))(*(_QWORD *)this + 32))(this, v4, 0);
  std::stringbuf::str();
  if (v8 < 0)
    operator delete(__p);
  v4[0] = *MEMORY[0x1E0DE4F50];
  v2 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v4 + *(_QWORD *)(v4[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v4[2] = v2;
  v4[3] = MEMORY[0x1E0DE4FB8] + 16;
  if (v5 < 0)
    operator delete((void *)v4[11]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1A85B64B4](&v6);
}

void sub_1A5E166FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  PB::TextFormatter::~TextFormatter(&a9);
  _Unwind_Resume(a1);
}

void PB::TextFormatter::~TextFormatter(void **this)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*((char *)this + 303) < 0)
    operator delete(this[35]);
  v2 = MEMORY[0x1E0DE4F50];
  v3 = *MEMORY[0x1E0DE4F50];
  *this = (void *)*MEMORY[0x1E0DE4F50];
  v4 = *(void **)(v2 + 72);
  *(void **)((char *)this + *(_QWORD *)(v3 - 24)) = *(void **)(v2 + 64);
  this[3] = (void *)(MEMORY[0x1E0DE4FB8] + 16);
  this[2] = v4;
  if (*((char *)this + 111) < 0)
    operator delete(this[11]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A85B64B4](this + 16);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x1E0DE4FD0];
  v3 = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x1E0DE4F50];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 16);
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_1A5E168AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x1A85B64B4](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x1E0DE4F50];
  v3 = *MEMORY[0x1E0DE4F50];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F50];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A85B64B4](a1 + 128);
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E4FAC780, MEMORY[0x1E0DE42D0]);
}

void sub_1A5E169AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

PB::Data *PB::Data::Data(PB::Data *this, const unsigned __int8 *a2, uint64_t a3)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  PB::Data::assign(this, a2, &a2[a3]);
  return this;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  PB::Data::assign(this, a2, &a2[a3]);
  return this;
}

void PB::Data::assign(PB::Data *this, const unsigned __int8 *__src, const unsigned __int8 *a3)
{
  size_t v3;
  void *v6;

  v3 = a3 - __src;
  if (a3 >= __src)
  {
    v6 = *(void **)this;
    if (*((_QWORD *)this + 1) >= v3)
    {
LABEL_5:
      *((_QWORD *)this + 1) = v3;
      memcpy(v6, __src, v3);
      return;
    }
    v6 = malloc_type_realloc(v6, a3 - __src, 0xDBF3321BuLL);
    if (v6)
    {
      *(_QWORD *)this = v6;
      goto LABEL_5;
    }
    free(*(void **)this);
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
  }
}

PB::Data *PB::Data::Data(PB::Data *this, const PB::Data *a2)
{
  uint64_t v3;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v3 = *((_QWORD *)a2 + 1);
  if (v3)
    PB::Data::assign(this, *(const unsigned __int8 **)a2, (const unsigned __int8 *)(*(_QWORD *)a2 + v3));
  return this;
}

{
  uint64_t v3;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v3 = *((_QWORD *)a2 + 1);
  if (v3)
    PB::Data::assign(this, *(const unsigned __int8 **)a2, (const unsigned __int8 *)(*(_QWORD *)a2 + v3));
  return this;
}

void PB::Data::clear(void **this)
{
  free(*this);
  *this = 0;
  this[1] = 0;
}

BOOL PB::Data::operator==(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

_QWORD *PBRepeatedDoubleAdd(_QWORD *result, double a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = result;
  v4 = result[2];
  if (v4)
  {
    v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        result = malloc_type_realloc((void *)*result, 16 * v4, 0x100004000313F17uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          v7 = v3[1];
          *(double *)&result[v7] = a2;
          *v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(double *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    result = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *v3 = result;
    if (result)
    {
      v6 = v3[1];
      *(double *)&result[v6] = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

id PBRepeatedDoubleNSArray(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*a1 + 8 * v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

void PBRepeatedDoubleSet(uint64_t a1, void *__src, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v6 = 1;
    while (1)
    {
      v7 = v6;
      if (v6 >= a3)
        break;
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        v7 = -1;
        break;
      }
    }
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *(void **)a1;
      if (v8 != v9)
      {
        v10 = malloc_type_realloc(v10, 8 * v8, 0x100004000313F17uLL);
        if (!v10)
          return;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 8 * a3);
      *(_QWORD *)(a1 + 8) = a3;
    }
  }
  else
  {
    v11 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v11);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedDoubleIsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

uint64_t PBRepeatedDoubleHash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

void PBRepeatedDoubleCopy(uint64_t a1, uint64_t a2)
{
  PBRepeatedDoubleSet(a1, *(void **)a2, *(_QWORD *)(a2 + 8));
}

_QWORD *PBRepeatedFloatAdd(_QWORD *result, float a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = result;
  v4 = result[2];
  if (v4)
  {
    v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        result = malloc_type_realloc((void *)*result, 8 * v4, 0x100004052888210uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          v7 = v3[1];
          *((float *)result + v7) = a2;
          *v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(float *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    result = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
    *v3 = result;
    if (result)
    {
      v6 = v3[1];
      *((float *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void PBRepeatedFloatClear(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
}

id PBRepeatedFloatNSArray(_QWORD *a1)
{
  void *v2;
  double v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    v4 = 0;
    do
    {
      LODWORD(v3) = *(_DWORD *)(*a1 + 4 * v4);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

      ++v4;
    }
    while (v4 < a1[1]);
  }
  return v2;
}

void PBRepeatedFloatSet(uint64_t a1, void *__src, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v6 = 1;
    while (1)
    {
      v7 = v6;
      if (v6 >= a3)
        break;
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        v7 = -1;
        break;
      }
    }
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *(void **)a1;
      if (v8 != v9)
      {
        v10 = malloc_type_realloc(v10, 4 * v8, 0x100004052888210uLL);
        if (!v10)
          return;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 4 * a3);
      *(_QWORD *)(a1 + 8) = a3;
    }
  }
  else
  {
    v11 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v11);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedFloatIsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

uint64_t PBRepeatedFloatHash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void PBRepeatedFloatCopy(uint64_t a1, uint64_t a2)
{
  PBRepeatedFloatSet(a1, *(void **)a2, *(_QWORD *)(a2 + 8));
}

id PBRepeatedInt32NSArray(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*a1 + 4 * v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

_QWORD *PBRepeatedInt64Add(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = result;
  v4 = result[2];
  if (v4)
  {
    v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        result = malloc_type_realloc((void *)*result, 16 * v4, 0x100004000313F17uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          v7 = v3[1];
          result[v7] = a2;
          *v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(_QWORD *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    result = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *v3 = result;
    if (result)
    {
      v6 = v3[1];
      result[v6] = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

id PBRepeatedInt64NSArray(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*a1 + 8 * v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

BOOL PBRepeatedInt64IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

uint64_t PBRepeatedInt64Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

id PBRepeatedUInt32NSArray(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*a1 + 4 * v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

void PBRepeatedUInt32Set(uint64_t a1, void *__src, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v6 = 1;
    while (1)
    {
      v7 = v6;
      if (v6 >= a3)
        break;
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        v7 = -1;
        break;
      }
    }
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *(void **)a1;
      if (v8 != v9)
      {
        v10 = malloc_type_realloc(v10, 4 * v8, 0x100004052888210uLL);
        if (!v10)
          return;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 4 * a3);
      *(_QWORD *)(a1 + 8) = a3;
    }
  }
  else
  {
    v11 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v11);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedUInt32IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

uint64_t PBRepeatedUInt32Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void PBRepeatedUInt32Copy(uint64_t a1, uint64_t a2)
{
  PBRepeatedUInt32Set(a1, *(void **)a2, *(_QWORD *)(a2 + 8));
}

id PBRepeatedUInt64NSArray(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*a1 + 8 * v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

BOOL PBRepeatedUInt64IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

uint64_t PBRepeatedUInt64Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

_QWORD *PBRepeatedBOOLAdd(_QWORD *result, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = result;
  v4 = result[2];
  if (v4)
  {
    v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        v7 = 2 * v4;
        result = malloc_type_realloc((void *)*result, 2 * v4, 0x100004077774924uLL);
        if (result)
        {
          v3[2] = v7;
          v8 = v3[1];
          *((_BYTE *)result + v8) = a2;
          *v3 = result;
          v3[1] = v8 + 1;
        }
      }
    }
    else
    {
      *(_BYTE *)(*result + v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    result = malloc_type_malloc(8uLL, 0x100004077774924uLL);
    *v3 = result;
    if (result)
    {
      v6 = v3[1];
      *((_BYTE *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void PBRepeatedBOOLClear(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
}

id PBRepeatedBOOLNSArray(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*a1 + v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

void PBRepeatedBOOLSet(uint64_t a1, void *__src, size_t __n)
{
  size_t v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (__n)
  {
    v6 = 1;
    while (1)
    {
      v7 = v6;
      if (v6 >= __n)
        break;
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        v7 = -1;
        break;
      }
    }
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    if (v8 >= __n)
    {
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *(void **)a1;
      if (v8 != v9)
      {
        v10 = malloc_type_realloc(v10, v8, 0x100004077774924uLL);
        if (!v10)
          return;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, __n);
      *(_QWORD *)(a1 + 8) = __n;
    }
  }
  else
  {
    v11 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v11);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedBOOLIsEqual(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t PBRepeatedBOOLHash(uint64_t *a1)
{
  return PBHashBytes(*a1, a1[1]);
}

void PBRepeatedBOOLCopy(uint64_t a1, uint64_t a2)
{
  PBRepeatedBOOLSet(a1, *(void **)a2, *(_QWORD *)(a2 + 8));
}

_QWORD *PB::Reader::read(_QWORD *result, char **a2)
{
  _QWORD *v3;
  char *v4;
  unint64_t v5;
  char v6;
  unsigned int v7;
  size_t v8;
  unint64_t v9;
  char v10;
  BOOL v11;
  char v12;
  unsigned int v13;
  size_t v14;
  uint64_t v15;
  char v16;
  const void *v17;
  unint64_t v18;
  uint64_t v19;
  size_t v20;
  char *v21;

  v3 = result;
  v4 = *a2;
  a2[1] = *a2;
  v5 = result[1];
  if (v5 < 0xFFFFFFFFFFFFFFF6 && v5 + 10 <= result[2])
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *result;
    while (1)
    {
      v9 = v5 + 1;
      result[1] = v5 + 1;
      v16 = *(_BYTE *)(v15 + v5);
      v14 |= (unint64_t)(v16 & 0x7F) << v12;
      if ((v16 & 0x80) == 0)
        break;
      v12 += 7;
      v5 = v9;
      v11 = v13++ > 8;
      if (v11)
      {
LABEL_14:
        v14 = 0;
        break;
      }
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = v5 + 1;
      if (v5 == -1)
      {
        v5 = -1;
LABEL_16:
        v14 = 0;
        *((_BYTE *)result + 24) = 1;
        v9 = v5;
        goto LABEL_20;
      }
      if (v9 > result[2])
        goto LABEL_16;
      v10 = *(_BYTE *)(*result + v5);
      result[1] = v9;
      v8 |= (unint64_t)(v10 & 0x7F) << v6;
      if ((v10 & 0x80) == 0)
        break;
      v6 += 7;
      v5 = v9;
      v11 = v7++ > 8;
      if (v11)
        goto LABEL_14;
    }
    if (*((_BYTE *)result + 24))
      v14 = 0;
    else
      v14 = v8;
  }
LABEL_20:
  if (!*((_BYTE *)result + 24))
  {
    if (__CFADD__(v9, v14) || v9 + v14 > result[2])
    {
      *((_BYTE *)result + 24) = 1;
      return result;
    }
    v17 = (const void *)(*result + v9);
    v18 = (unint64_t)a2[2];
    if (v18 - (unint64_t)v4 >= v14)
    {
      if (!v14)
      {
LABEL_38:
        a2[1] = &v4[v14];
        v3[1] += v14;
        return result;
      }
      v21 = v4;
    }
    else
    {
      if (v4)
      {
        a2[1] = v4;
        operator delete(v4);
        v18 = 0;
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
      }
      if ((v14 & 0x8000000000000000) != 0)
        goto LABEL_40;
      v19 = 2 * v18;
      if (2 * v18 <= v14)
        v19 = v14;
      v20 = v18 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v19;
      if ((v20 & 0x8000000000000000) != 0)
LABEL_40:
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v21 = (char *)operator new(v20);
      v4 = v21;
      *a2 = v21;
      a2[1] = v21;
      a2[2] = &v21[v20];
    }
    result = memmove(v21, v17, v14);
    goto LABEL_38;
  }
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void PB::Reader::read(PB::Reader *this, void **a2)
{
  unint64_t v4;
  char v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  free(*a2);
  *a2 = 0;
  a2[1] = 0;
  v4 = *((_QWORD *)this + 1);
  if (v4 < 0xFFFFFFFFFFFFFFF6 && v4 + 10 <= *((_QWORD *)this + 2))
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)this;
    while (1)
    {
      v8 = v4 + 1;
      *((_QWORD *)this + 1) = v4 + 1;
      v15 = *(_BYTE *)(v14 + v4);
      v13 |= (unint64_t)(v15 & 0x7F) << v11;
      if ((v15 & 0x80) == 0)
        break;
      v11 += 7;
      v4 = v8;
      v10 = v12++ > 8;
      if (v10)
      {
LABEL_14:
        v13 = 0;
        break;
      }
    }
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = v4 + 1;
      if (v4 == -1)
      {
        v4 = -1;
LABEL_16:
        v13 = 0;
        *((_BYTE *)this + 24) = 1;
        v8 = v4;
        goto LABEL_20;
      }
      if (v8 > *((_QWORD *)this + 2))
        goto LABEL_16;
      v9 = *(_BYTE *)(*(_QWORD *)this + v4);
      *((_QWORD *)this + 1) = v8;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        break;
      v5 += 7;
      v4 = v8;
      v10 = v6++ > 8;
      if (v10)
        goto LABEL_14;
    }
    if (*((_BYTE *)this + 24))
      v13 = 0;
    else
      v13 = v7;
  }
LABEL_20:
  if (!*((_BYTE *)this + 24))
  {
    if (__CFADD__(v8, v13) || v8 + v13 > *((_QWORD *)this + 2))
    {
      *((_BYTE *)this + 24) = 1;
    }
    else
    {
      PB::Data::assign((PB::Data *)a2, (const unsigned __int8 *)(*(_QWORD *)this + v8), (const unsigned __int8 *)(*(_QWORD *)this + v8 + v13));
      *((_QWORD *)this + 1) += v13;
    }
  }
}

uint64_t PB::Reader::skip(PB::Reader *this, int a2, int a3, int a4)
{
  uint64_t v4;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  unsigned __int8 v27;
  char v28;
  unsigned int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  char v41;
  BOOL v42;

  v4 = 0;
  switch(a3)
  {
    case 0:
      v6 = *((_QWORD *)this + 1);
      if (v6 < 0xFFFFFFFFFFFFFFF6 && v6 + 10 <= *((_QWORD *)this + 2))
      {
        v36 = 0;
        v37 = *(_QWORD *)this;
        v4 = 1;
        do
        {
          *((_QWORD *)this + 1) = v6 + 1;
          if ((*(char *)(v37 + v6) & 0x80000000) == 0)
            break;
          ++v6;
          v10 = v36++ > 8;
        }
        while (!v10);
      }
      else
      {
        v7 = 0;
        v4 = 1;
        do
        {
          v8 = v6 + 1;
          if (v6 == -1 || v8 > *((_QWORD *)this + 2))
            goto LABEL_68;
          v9 = *(char *)(*(_QWORD *)this + v6);
          *((_QWORD *)this + 1) = v8;
          if ((v9 & 0x80000000) == 0)
            break;
          v6 = v8;
          v10 = v7++ > 8;
        }
        while (!v10);
      }
      return v4;
    case 1:
      v11 = *((_QWORD *)this + 1);
      if (v11 > 0xFFFFFFFFFFFFFFF7)
        goto LABEL_68;
      v12 = v11 + 8;
      goto LABEL_67;
    case 2:
      v13 = *((_QWORD *)this + 1);
      if (v13 < 0xFFFFFFFFFFFFFFF6 && v13 + 10 <= *((_QWORD *)this + 2))
      {
        v38 = 0;
        v39 = 0;
        v16 = 0;
        v40 = *(_QWORD *)this;
        do
        {
          v17 = v13 + 1;
          *((_QWORD *)this + 1) = v13 + 1;
          v41 = *(_BYTE *)(v40 + v13);
          v16 |= (unint64_t)(v41 & 0x7F) << v38;
          if ((v41 & 0x80) == 0)
            goto LABEL_66;
          v38 += 7;
          v13 = v17;
          v10 = v39++ > 8;
        }
        while (!v10);
LABEL_61:
        v16 = 0;
        goto LABEL_66;
      }
      v14 = 0;
      v15 = 0;
      v16 = 0;
      while (2)
      {
        v17 = v13 + 1;
        if (v13 == -1)
        {
          v13 = -1;
LABEL_63:
          v16 = 0;
          *((_BYTE *)this + 24) = 1;
          v17 = v13;
        }
        else
        {
          if (v17 > *((_QWORD *)this + 2))
            goto LABEL_63;
          v18 = *(_BYTE *)(*(_QWORD *)this + v13);
          *((_QWORD *)this + 1) = v17;
          v16 |= (unint64_t)(v18 & 0x7F) << v14;
          if (v18 < 0)
          {
            v14 += 7;
            v13 = v17;
            v10 = v15++ > 8;
            if (v10)
              goto LABEL_61;
            continue;
          }
          if (*((_BYTE *)this + 24))
            v16 = 0;
        }
        break;
      }
LABEL_66:
      v42 = __CFADD__(v17, v16);
      v12 = v17 + v16;
      if (v42)
        goto LABEL_68;
LABEL_67:
      if (v12 > *((_QWORD *)this + 2))
      {
LABEL_68:
        v4 = 1;
        *((_BYTE *)this + 24) = 1;
        return v4;
      }
      *((_QWORD *)this + 1) = v12;
      return 1;
    case 3:
      v4 = 1;
      if (!*((_BYTE *)this + 24))
        return v4;
      v21 = a4 + 1;
      break;
    case 5:
      v35 = *((_QWORD *)this + 1);
      if (v35 > 0xFFFFFFFFFFFFFFFBLL)
        goto LABEL_68;
      v12 = v35 + 4;
      goto LABEL_67;
    default:
      return v4;
  }
  while (1)
  {
    v22 = *((_QWORD *)this + 1);
    if (v22 < 0xFFFFFFFFFFFFFFF6 && v22 + 10 <= *((_QWORD *)this + 2))
      break;
    v23 = 0;
    while (1)
    {
      v24 = v22 + 1;
      if (v22 == -1 || v24 > *((_QWORD *)this + 2))
      {
        LODWORD(v25) = 0;
        v27 = 0;
        *((_BYTE *)this + 24) = 1;
        goto LABEL_34;
      }
      LODWORD(v25) = 0;
      v26 = *(char *)(*(_QWORD *)this + v22);
      *((_QWORD *)this + 1) = v24;
      if ((v26 & 0x80000000) == 0)
        break;
      v22 = v24;
      v27 = 0;
      v10 = v23++ > 8;
      if (v10)
        goto LABEL_34;
    }
    v27 = 0;
LABEL_34:
    if (a4 >= 64)
    {
      *((_BYTE *)this + 24) = 1;
      continue;
    }
    PB::Reader::skip(this, v25, v27, v21);
    if (!*((_BYTE *)this + 24))
      return 1;
  }
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = *(_QWORD *)this;
  while (1)
  {
    v32 = v22 + 1;
    *((_QWORD *)this + 1) = v22 + 1;
    v33 = *(_BYTE *)(v31 + v22);
    v30 |= (unint64_t)(v33 & 0x7F) << v28;
    if ((v33 & 0x80) == 0)
      break;
    v28 += 7;
    v22 = v32;
    v10 = v29++ > 8;
    if (v10)
    {
      LODWORD(v25) = 0;
      v27 = 0;
      goto LABEL_34;
    }
  }
  v27 = v30 & 7;
  v25 = v30 >> 3;
  if ((v30 & 7) != 4 || (_DWORD)v25 != a2)
    goto LABEL_34;
  return 1;
}

std::string *PB::TextFormatter::indent(PB::TextFormatter *this)
{
  return std::string::append((std::string *)((char *)this + 280), "  ");
}

uint64_t PB::TextFormatter::dedent(PB::TextFormatter *this)
{
  unint64_t v1;
  std::string *v2;
  std::string *v3;

  if (*((char *)this + 303) < 0)
  {
    v1 = *((_QWORD *)this + 36);
    if (v1 > 1)
      goto LABEL_3;
  }
  else
  {
    v1 = *((unsigned __int8 *)this + 303);
    if (v1 >= 2)
    {
LABEL_3:
      v2 = (std::string *)((char *)this + 280);
      v3 = std::string::erase((std::string *)((char *)this + 280), v1 - 2, 0xFFFFFFFFFFFFFFFFLL);
      std::string::operator=(v2, v3);
      return 1;
    }
  }
  return 0;
}

std::string *PB::TextFormatter::beginObject(std::string *this, const char *a2)
{
  std::string::size_type *v3;
  std::string *v4;
  int v5;
  uint64_t v6;
  uint64_t data;
  size_t v8;
  _QWORD *v9;

  if (a2)
  {
    v3 = &this->__r_.__value_.__r.__words[2];
    v4 = (std::string *)((char *)this + 280);
    v5 = this[12].__r_.__value_.__s.__data_[15];
    if (v5 >= 0)
      v6 = (uint64_t)&this[11].__r_.__value_.__r.__words[2];
    else
      v6 = this[11].__r_.__value_.__r.__words[2];
    if (v5 >= 0)
      data = this[12].__r_.__value_.__s.__data_[15];
    else
      data = (uint64_t)this[12].__r_.__value_.__l.__data_;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&this->__r_.__value_.__r.__words[2], v6, data);
    v8 = strlen(a2);
    v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" {\n", 3);
    return std::string::append(v4, "  ");
  }
  return this;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  size_t v16;
  std::locale::__imp *p_b;
  uint64_t v18;
  uint64_t v19;
  std::locale *v20;
  uint64_t v21;
  _BYTE v23[16];
  std::locale __b;
  size_t v25;
  int64_t v26;

  MEMORY[0x1A85B63F4](v23, a1);
  if (v23[0])
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&__b, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20)
      v12 = a2 + a3;
    else
      v12 = a2;
    if (!v7)
      goto LABEL_29;
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v16 >= 0x17)
      {
        v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v18 = v16 | 7;
        v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        v25 = v16;
        v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((_BYTE *)p_b + v16) = 0;
      v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(_QWORD *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0)
        operator delete(__b.__locale_);
      if (v21 != v16)
        goto LABEL_29;
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((_QWORD *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1A85B6400](v23);
  return a1;
}

void sub_1A5E1A780(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x1A85B6400](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1A5E1A754);
}

void sub_1A5E1A7E0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  _QWORD *result;
  int v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;

  result = (_QWORD *)PB::TextFormatter::dedent(this);
  if ((_DWORD)result)
  {
    v3 = *((char *)this + 303);
    if (v3 >= 0)
      v4 = (char *)this + 280;
    else
      v4 = (char *)*((_QWORD *)this + 35);
    if (v3 >= 0)
      v5 = *((unsigned __int8 *)this + 303);
    else
      v5 = *((_QWORD *)this + 36);
    v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v4, v5);
    return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"}\n", 2);
  }
  return result;
}

_QWORD *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  _QWORD *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v3 = (_QWORD *)((char *)this + 16);
  v4 = *((char *)this + 303);
  if (v4 >= 0)
    v5 = (char *)this + 280;
  else
    v5 = (char *)*((_QWORD *)this + 35);
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)this + 303);
  else
    v6 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v5, v6);
  v7 = strlen(a2);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  v9 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  _QWORD *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v3 = (_QWORD *)((char *)this + 16);
  v4 = *((char *)this + 303);
  if (v4 >= 0)
    v5 = (char *)this + 280;
  else
    v5 = (char *)*((_QWORD *)this + 35);
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)this + 303);
  else
    v6 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v5, v6);
  v7 = strlen(a2);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  v9 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  _QWORD *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v3 = (_QWORD *)((char *)this + 16);
  v4 = *((char *)this + 303);
  if (v4 >= 0)
    v5 = (char *)this + 280;
  else
    v5 = (char *)*((_QWORD *)this + 35);
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)this + 303);
  else
    v6 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v5, v6);
  v7 = strlen(a2);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  v9 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  _QWORD *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v3 = (_QWORD *)((char *)this + 16);
  v4 = *((char *)this + 303);
  if (v4 >= 0)
    v5 = (char *)this + 280;
  else
    v5 = (char *)*((_QWORD *)this + 35);
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)this + 303);
  else
    v6 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v5, v6);
  v7 = strlen(a2);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  v9 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  _QWORD *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v3 = (_QWORD *)((char *)this + 16);
  v4 = *((char *)this + 303);
  if (v4 >= 0)
    v5 = (char *)this + 280;
  else
    v5 = (char *)*((_QWORD *)this + 35);
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)this + 303);
  else
    v6 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v5, v6);
  v7 = strlen(a2);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  v9 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

_QWORD *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  _QWORD *v5;
  int v6;
  char *v7;
  uint64_t v8;
  size_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v5 = (_QWORD *)((char *)this + 16);
  v6 = *((char *)this + 303);
  if (v6 >= 0)
    v7 = (char *)this + 280;
  else
    v7 = (char *)*((_QWORD *)this + 35);
  if (v6 >= 0)
    v8 = *((unsigned __int8 *)this + 303);
  else
    v8 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v7, v8);
  v9 = strlen(a2);
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  *(_QWORD *)((char *)v5 + *(_QWORD *)(*((_QWORD *)this + 2) - 24) + 16) = 6;
  v11 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1);
}

_QWORD *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  _QWORD *v5;
  int v6;
  char *v7;
  uint64_t v8;
  size_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v5 = (_QWORD *)((char *)this + 16);
  v6 = *((char *)this + 303);
  if (v6 >= 0)
    v7 = (char *)this + 280;
  else
    v7 = (char *)*((_QWORD *)this + 35);
  if (v6 >= 0)
    v8 = *((unsigned __int8 *)this + 303);
  else
    v8 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v7, v8);
  v9 = strlen(a2);
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  *(_QWORD *)((char *)v5 + *(_QWORD *)(*((_QWORD *)this + 2) - 24) + 16) = 15;
  v11 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1);
}

void PB::TextFormatter::format(uint64_t a1, const char *a2, uint64_t a3)
{
  _QWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  _QWORD *v10;
  int v11;
  const unsigned __int8 *v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  void *__p[2];
  unsigned __int8 v17;

  v5 = (_QWORD *)(a1 + 16);
  v6 = *(char *)(a1 + 303);
  if (v6 >= 0)
    v7 = a1 + 280;
  else
    v7 = *(_QWORD *)(a1 + 280);
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a1 + 303);
  else
    v8 = *(_QWORD *)(a1 + 288);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)(a1 + 16), v7, v8);
  v9 = strlen(a2);
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  v11 = *(char *)(a3 + 23);
  if (v11 >= 0)
    v12 = (const unsigned __int8 *)a3;
  else
    v12 = *(const unsigned __int8 **)a3;
  if (v11 >= 0)
    v13 = *(unsigned __int8 *)(a3 + 23);
  else
    v13 = *(_QWORD *)(a3 + 8);
  PB::_formatBytes((PB *)__p, v12, v13);
  if ((v17 & 0x80u) == 0)
    v14 = __p;
  else
    v14 = (void **)__p[0];
  if ((v17 & 0x80u) == 0)
    v15 = v17;
  else
    v15 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v14, v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  if ((char)v17 < 0)
    operator delete(__p[0]);
}

{
  _QWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  _QWORD *v10;
  void **v11;
  uint64_t v12;
  void *__p[2];
  unsigned __int8 v14;

  v5 = (_QWORD *)(a1 + 16);
  v6 = *(char *)(a1 + 303);
  if (v6 >= 0)
    v7 = a1 + 280;
  else
    v7 = *(_QWORD *)(a1 + 280);
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a1 + 303);
  else
    v8 = *(_QWORD *)(a1 + 288);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)(a1 + 16), v7, v8);
  v9 = strlen(a2);
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  PB::_formatBytes((PB *)__p, *(const unsigned __int8 **)a3, *(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
  if ((v14 & 0x80u) == 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v12 = v14;
  else
    v12 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  if ((char)v14 < 0)
    operator delete(__p[0]);
}

void sub_1A5E1AD60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t PB::_formatBytes(PB *this, const unsigned __int8 *a2, uint64_t a3)
{
  _QWORD *v5;
  int v6;
  int v7;
  const char *v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  _QWORD v13[10];
  char v14;
  uint64_t v15;
  _BYTE v16[9];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v11);
  v16[0] = 34;
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v12, (uint64_t)v16, 1);
  while (a3)
  {
    v7 = *a2++;
    v6 = v7;
    if (v7 <= 33)
    {
      v8 = "\\a";
      switch(v6)
      {
        case 0:
          v8 = "\\0";
          goto LABEL_16;
        case 7:
          goto LABEL_16;
        case 8:
          v8 = "\\b";
          goto LABEL_16;
        case 9:
          v8 = "\\t";
          goto LABEL_16;
        case 10:
          v8 = "\\n";
          goto LABEL_16;
        case 12:
          v8 = "\\f";
          goto LABEL_16;
        case 13:
          v8 = "\\r";
          goto LABEL_16;
        default:
          goto LABEL_19;
      }
    }
    switch(v6)
    {
      case '"':
        v8 = "\\\"";
        break;
      case '\'':
        v8 = "\\'";
        break;
      case '\\':
        v8 = "\\\\";
        break;
      default:
LABEL_19:
        if ((v6 - 32) < 0x3C || (v6 - 93) <= 0x20)
        {
          v16[0] = v6;
          v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v16, 1);
        }
        else
        {
          *(_DWORD *)((char *)v13 + *(_QWORD *)(v12 - 24)) = *(_DWORD *)((_BYTE *)v13 + *(_QWORD *)(v12 - 24)) & 0xFFFFFFB5 | 0x40;
          v16[0] = v6;
          v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v16, 1);
          *(_DWORD *)((char *)v13 + *(_QWORD *)(v12 - 24)) = *(_DWORD *)((_BYTE *)v13 + *(_QWORD *)(v12 - 24)) & 0xFFFFFFB5 | 2;
        }
        goto LABEL_17;
    }
LABEL_16:
    v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v8, 2);
LABEL_17:
    --a3;
  }
  v16[0] = 34;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v16, 1);
  std::stringbuf::str();
  v11[0] = *MEMORY[0x1E0DE4F50];
  v9 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v11 + *(_QWORD *)(v11[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v12 = v9;
  v13[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (v14 < 0)
    operator delete((void *)v13[8]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1A85B64B4](&v15);
}

void sub_1A5E1AFC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A5E1B0B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, const PB::Data *a3)
{
  _QWORD *v5;
  int v6;
  char *v7;
  uint64_t v8;
  size_t v9;
  _QWORD *v10;
  void **v11;
  uint64_t v12;
  void *__p[2];
  unsigned __int8 v14;

  v5 = (_QWORD *)((char *)this + 16);
  v6 = *((char *)this + 303);
  if (v6 >= 0)
    v7 = (char *)this + 280;
  else
    v7 = (char *)*((_QWORD *)this + 35);
  if (v6 >= 0)
    v8 = *((unsigned __int8 *)this + 303);
  else
    v8 = *((_QWORD *)this + 36);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)this + 2, (uint64_t)v7, v8);
  v9 = strlen(a2);
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  PB::_formatBytes((PB *)__p, *(const unsigned __int8 **)a3, *((_QWORD *)a3 + 1));
  if ((v14 & 0x80u) == 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  if ((v14 & 0x80u) == 0)
    v12 = v14;
  else
    v12 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  if ((char)v14 < 0)
    operator delete(__p[0]);
}

void sub_1A5E1B1A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t PBUnknownFieldsSetMaximumRecursionDepth(uint64_t result)
{
  _sMaximumRecursionDepth = result;
  return result;
}

PB::Writer *PB::Writer::Writer(PB::Writer *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  PB::_grow((uint64_t *)this, 0x100uLL);
  return this;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  PB::_grow((uint64_t *)this, 0x100uLL);
  return this;
}

char *PB::_grow(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *result;
  std::bad_alloc *exception;
  std::bad_alloc *v10;

  v3 = a1[1];
  v4 = *a1;
  v5 = a1[2] - v3;
  if (v5 <= a2)
    v6 = a2;
  else
    v6 = a1[2] - v3;
  v7 = v6 + v5;
  result = (char *)malloc_type_realloc((void *)a1[1], v6 + v5, 0xBB50D737uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v10 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v10, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)&result[v7];
  *a1 = (uint64_t)&result[v4 - v3];
  return result;
}

void PB::Writer::~Writer(void **this)
{
  free(this[1]);
}

{
  free(this[1]);
}

uint64_t *PB::Writer::writeVarInt(uint64_t *this, unsigned int a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 16))
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  v6 = (int)a2;
  if (a3 != -1)
  {
    v7 = (8 * a3);
    if (v7 < 0x80)
    {
      LOBYTE(v9) = 8 * a3;
    }
    else
    {
      do
      {
        v8 = (_BYTE *)(*v5)++;
        *v8 = v7 | 0x80;
        v9 = v7 >> 7;
        v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    v11 = (_BYTE *)(*v5)++;
    *v11 = v9;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v13) = a2;
  }
  else
  {
    do
    {
      v12 = (_BYTE *)(*v5)++;
      *v12 = v6 | 0x80;
      v13 = v6 >> 7;
      v14 = v6 >> 14;
      v6 >>= 7;
    }
    while (v14);
  }
  v15 = (_BYTE *)(*v5)++;
  *v15 = v13;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 16))
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  v6 = a2;
  if (a3 != -1)
  {
    v7 = (8 * a3);
    if (v7 < 0x80)
    {
      LOBYTE(v9) = 8 * a3;
    }
    else
    {
      do
      {
        v8 = (_BYTE *)(*v5)++;
        *v8 = v7 | 0x80;
        v9 = v7 >> 7;
        v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    v11 = (_BYTE *)(*v5)++;
    *v11 = v9;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v13) = a2;
  }
  else
  {
    do
    {
      v12 = (_BYTE *)(*v5)++;
      *v12 = v6 | 0x80;
      v13 = v6 >> 7;
      v14 = v6 >> 14;
      v6 >>= 7;
    }
    while (v14);
  }
  v15 = (_BYTE *)(*v5)++;
  *v15 = v13;
  return this;
}

uint64_t *PB::Writer::writeVarInt(uint64_t *this, unint64_t a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 16))
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v12) = a2;
  }
  else
  {
    do
    {
      v11 = (_BYTE *)(*v5)++;
      *v11 = a2 | 0x80;
      v12 = a2 >> 7;
      v13 = a2 >> 14;
      a2 >>= 7;
    }
    while (v13);
  }
  v14 = (_BYTE *)(*v5)++;
  *v14 = v12;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 16))
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v12) = a2;
  }
  else
  {
    do
    {
      v11 = (_BYTE *)(*v5)++;
      *v11 = a2 | 0x80;
      v12 = a2 >> 7;
      v13 = a2 >> 14;
      a2 >>= 7;
    }
    while (v13);
  }
  v14 = (_BYTE *)(*v5)++;
  *v14 = v12;
  return this;
}

uint64_t *PB::Writer::writeSInt(uint64_t *this, int a2, int a3)
{
  uint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;

  v4 = this;
  v5 = (2 * a2) ^ (a2 >> 31);
  if (this[2] < (unint64_t)(*this + 16))
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v4)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v4)++;
    *v10 = v8;
  }
  if (v5 < 0x80)
  {
    LOBYTE(v12) = v5;
  }
  else
  {
    do
    {
      v11 = (_BYTE *)(*v4)++;
      *v11 = v5 | 0x80;
      v12 = v5 >> 7;
      v13 = v5 >> 14;
      v5 >>= 7;
    }
    while (v13);
  }
  v14 = (_BYTE *)(*v4)++;
  *v14 = v12;
  return this;
}

uint64_t *PB::Writer::writeSInt(uint64_t *this, uint64_t a2, int a3)
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;

  v5 = this;
  v6 = 2 * a2;
  if (this[2] < (unint64_t)(*this + 16))
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  v7 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    v8 = (8 * a3);
    if (v8 < 0x80)
    {
      LOBYTE(v10) = 8 * a3;
    }
    else
    {
      do
      {
        v9 = (_BYTE *)(*v5)++;
        *v9 = v8 | 0x80;
        v10 = v8 >> 7;
        v11 = v8 >> 14;
        v8 >>= 7;
      }
      while (v11);
    }
    v12 = (_BYTE *)(*v5)++;
    *v12 = v10;
  }
  if (v7 < 0x80)
  {
    v14 = v6 ^ (a2 >> 63);
  }
  else
  {
    do
    {
      v13 = (_BYTE *)(*v5)++;
      *v13 = v7 | 0x80;
      v14 = v7 >> 7;
      v15 = v7 >> 14;
      v7 >>= 7;
    }
    while (v15);
  }
  v16 = (_BYTE *)(*v5)++;
  *v16 = v14;
  return this;
}

uint64_t *PB::Writer::writeFixed(uint64_t *this, int a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 20))
    this = (uint64_t *)PB::_grow(this, 0x14uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  *(_DWORD *)*v5 = a2;
  *v5 += 4;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 20))
    this = (uint64_t *)PB::_grow(this, 0x14uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  *(_DWORD *)*v5 = a2;
  *v5 += 4;
  return this;
}

uint64_t *PB::Writer::writeFixed(uint64_t *this, uint64_t a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 24))
    this = (uint64_t *)PB::_grow(this, 0x18uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  *(_QWORD *)*v5 = a2;
  *v5 += 8;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 24))
    this = (uint64_t *)PB::_grow(this, 0x18uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  *(_QWORD *)*v5 = a2;
  *v5 += 8;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, char a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 16))
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  v11 = (_BYTE *)(*v5)++;
  *v11 = a2;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, float a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 20))
    this = (uint64_t *)PB::_grow(this, 0x14uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  *(float *)*v5 = a2;
  *v5 += 4;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, double a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;

  v5 = this;
  if (this[2] < (unint64_t)(*this + 24))
    this = (uint64_t *)PB::_grow(this, 0x18uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  *(double *)*v5 = a2;
  *v5 += 8;
  return this;
}

void *PB::Writer::write(uint64_t *a1, const void **a2, int a3)
{
  int v6;
  const void **v7;
  size_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  size_t v14;
  size_t v15;
  _BYTE *v16;
  size_t v17;
  const void **v18;
  _BYTE *v19;
  void *result;

  v6 = *((char *)a2 + 23);
  v7 = (const void **)*a2;
  if (v6 >= 0)
    v8 = *((unsigned __int8 *)a2 + 23);
  else
    v8 = (size_t)a2[1];
  if (a1[2] < *a1 + v8 + 16)
    PB::_grow(a1, v8 + 16);
  if (a3 != -1)
  {
    v9 = (8 * a3) | 2u;
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        v10 = (_BYTE *)(*a1)++;
        *v10 = v9 | 0x80;
        v11 = v9 >> 7;
        v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    v13 = (_BYTE *)(*a1)++;
    *v13 = v11;
  }
  LOBYTE(v14) = v8;
  if (v8 >= 0x80)
  {
    v15 = v8;
    do
    {
      v16 = (_BYTE *)(*a1)++;
      *v16 = v15 | 0x80;
      v14 = v15 >> 7;
      v17 = v15 >> 14;
      v15 >>= 7;
    }
    while (v17);
  }
  if (v6 >= 0)
    v18 = a2;
  else
    v18 = v7;
  v19 = (_BYTE *)(*a1)++;
  *v19 = v14;
  result = memcpy((void *)*a1, v18, v8);
  *a1 += v8;
  return result;
}

void *PB::Writer::write(uint64_t *a1, uint64_t a2, int a3)
{
  const void *v5;
  size_t v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  size_t v12;
  size_t v13;
  _BYTE *v14;
  size_t v15;
  _BYTE *v16;
  void *result;

  v5 = *(const void **)a2;
  v6 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (a1[2] < *a1 + v6 + 16)
    PB::_grow(a1, v6 + 16);
  if (a3 != -1)
  {
    v7 = (8 * a3) | 2u;
    if (v7 < 0x80)
    {
      LOBYTE(v9) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        v8 = (_BYTE *)(*a1)++;
        *v8 = v7 | 0x80;
        v9 = v7 >> 7;
        v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    v11 = (_BYTE *)(*a1)++;
    *v11 = v9;
  }
  LOBYTE(v12) = v6;
  if (v6 >= 0x80)
  {
    v13 = v6;
    do
    {
      v14 = (_BYTE *)(*a1)++;
      *v14 = v13 | 0x80;
      v12 = v13 >> 7;
      v15 = v13 >> 14;
      v13 >>= 7;
    }
    while (v15);
  }
  v16 = (_BYTE *)(*a1)++;
  *v16 = v12;
  result = memcpy((void *)*a1, v5, v6);
  *a1 += v6;
  return result;
}

void *PB::Writer::write(PB::Writer *this, const PB::Data *a2, int a3)
{
  size_t v5;
  const void *v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  size_t v12;
  size_t v13;
  _BYTE *v14;
  size_t v15;
  _BYTE *v16;
  void *result;

  v6 = *(const void **)a2;
  v5 = *((_QWORD *)a2 + 1);
  if (*((_QWORD *)this + 2) < *(_QWORD *)this + v5 + 16)
    PB::_grow((uint64_t *)this, v5 + 16);
  if (a3 != -1)
  {
    v7 = (8 * a3) | 2u;
    if (v7 < 0x80)
    {
      LOBYTE(v9) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        v8 = (_BYTE *)(*(_QWORD *)this)++;
        *v8 = v7 | 0x80;
        v9 = v7 >> 7;
        v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    v11 = (_BYTE *)(*(_QWORD *)this)++;
    *v11 = v9;
  }
  LOBYTE(v12) = v5;
  if (v5 >= 0x80)
  {
    v13 = v5;
    do
    {
      v14 = (_BYTE *)(*(_QWORD *)this)++;
      *v14 = v13 | 0x80;
      v12 = v13 >> 7;
      v15 = v13 >> 14;
      v13 >>= 7;
    }
    while (v15);
  }
  v16 = (_BYTE *)(*(_QWORD *)this)++;
  *v16 = v12;
  result = memcpy(*(void **)this, v6, v5);
  *(_QWORD *)this += v5;
  return result;
}

char *PB::Writer::writeSubgroup(PB::Writer *this, const PB::Base *a2, int a3)
{
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  char *result;
  unint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;

  if (*((_QWORD *)this + 2) < (unint64_t)(*(_QWORD *)this + 8))
    PB::_grow((uint64_t *)this, 8uLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 3u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 3;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*(_QWORD *)this)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*(_QWORD *)this)++;
    *v10 = v8;
  }
  result = (char *)(*(uint64_t (**)(const PB::Base *, PB::Writer *))(*(_QWORD *)a2 + 24))(a2, this);
  if (*((_QWORD *)this + 2) < (unint64_t)(*(_QWORD *)this + 8))
    result = PB::_grow((uint64_t *)this, 8uLL);
  if (a3 != -1)
  {
    v12 = (8 * a3) | 4u;
    if (v12 < 0x80)
    {
      LOBYTE(v14) = (8 * a3) | 4;
    }
    else
    {
      do
      {
        v13 = (_BYTE *)(*(_QWORD *)this)++;
        *v13 = v12 | 0x80;
        v14 = v12 >> 7;
        v15 = v12 >> 14;
        v12 >>= 7;
      }
      while (v15);
    }
    v16 = (_BYTE *)(*(_QWORD *)this)++;
    *v16 = v14;
  }
  return result;
}

uint64_t *PB::Writer::placeMark(uint64_t *result, _QWORD *a2, int a3)
{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (result[2] < (unint64_t)(*result + 10))
    result = (uint64_t *)PB::_grow(result, 0xAuLL);
  if (a3 != -1)
  {
    v6 = (8 * a3) | 2u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        v7 = (_BYTE *)(*v5)++;
        *v7 = v6 | 0x80;
        v8 = v6 >> 7;
        v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    v10 = (_BYTE *)(*v5)++;
    *v10 = v8;
  }
  v11 = v5[1];
  v12 = *v5 + 1;
  *v5 = v12;
  *a2 = v12 - v11;
  return result;
}

uint64_t *PB::Writer::recallMark(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BYTE *v10;
  size_t v11;
  size_t v12;

  v3 = result;
  v4 = result[1];
  v5 = *a2;
  v6 = *result - (*a2 + v4);
  v7 = -1;
  v8 = v6;
  do
  {
    ++v7;
    v9 = v8 > 0x7F;
    v8 >>= 7;
  }
  while (v9);
  if (v7)
  {
    if (result[2] < *result + v7)
    {
      PB::_grow(result, v7);
      v4 = v3[1];
      v5 = *a2;
    }
    result = (uint64_t *)memmove((void *)(v4 + v5 + v7), (const void *)(v4 + v5), v6);
    v4 = v3[1];
    v5 = *a2;
  }
  v10 = (_BYTE *)(v4 + v5 - 1);
  if (v6 < 0x80)
  {
    LOBYTE(v11) = v6;
  }
  else
  {
    do
    {
      *v10++ = v6 | 0x80;
      v11 = v6 >> 7;
      v12 = v6 >> 14;
      v6 >>= 7;
    }
    while (v12);
  }
  *v10 = v11;
  *v3 += v7;
  return result;
}

uint64_t *PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2, int a3)
{
  uint64_t v6;

  PB::Writer::placeMark((uint64_t *)this, &v6, a3);
  (*(void (**)(const PB::Base *, PB::Writer *))(*(_QWORD *)a2 + 24))(a2, this);
  return PB::Writer::recallMark((uint64_t *)this, &v6);
}

void sub_1A5E1D894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E0]();
}

{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4730]();
}

{
  return MEMORY[0x1E0DE4738]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E4FAC7B0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E4FAC7B8(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE7A88](cls, outCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1E0CCEDE0]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1E0DE8058](property, outCount);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE8090](proto, outCount);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

