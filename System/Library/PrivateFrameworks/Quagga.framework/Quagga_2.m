int *sub_1D3E3B998(int *result, int *a2, _DWORD *a3)
{
  int v3;
  int v4;
  BOOL v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;

  v3 = *a2;
  v4 = a2[1];
  v5 = *a2 < *result;
  if (*a2 == *result)
    v5 = v4 < result[1];
  v6 = a3[1] < v4;
  v7 = *a3 == v3;
  v8 = *a3 < v3;
  if (!v7)
    v6 = v8;
  if (v5)
  {
    v9 = *(_QWORD *)result;
    if (v6)
    {
      *(_QWORD *)result = *(_QWORD *)a3;
LABEL_17:
      *(_QWORD *)a3 = v9;
      return result;
    }
    *(_QWORD *)result = *(_QWORD *)a2;
    *(_QWORD *)a2 = v9;
    v13 = *a3 < (int)v9;
    if (*a3 == (_DWORD)v9)
      v13 = a3[1] < SHIDWORD(v9);
    if (v13)
    {
      *(_QWORD *)a2 = *(_QWORD *)a3;
      goto LABEL_17;
    }
  }
  else if (v6)
  {
    v10 = *(_QWORD *)a2;
    *(_QWORD *)a2 = *(_QWORD *)a3;
    *(_QWORD *)a3 = v10;
    v11 = *a2 < *result;
    if (*a2 == *result)
      v11 = a2[1] < result[1];
    if (v11)
    {
      v12 = *(_QWORD *)result;
      *(_QWORD *)result = *(_QWORD *)a2;
      *(_QWORD *)a2 = v12;
    }
  }
  return result;
}

int *sub_1D3E3BA70(int *a1, int *a2, int *a3, int *a4)
{
  int *result;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;

  result = sub_1D3E3B998(a1, a2, a3);
  v9 = *a4 < *a3;
  if (*a4 == *a3)
    v9 = a4[1] < a3[1];
  if (v9)
  {
    v10 = *(_QWORD *)a3;
    *(_QWORD *)a3 = *(_QWORD *)a4;
    *(_QWORD *)a4 = v10;
    v11 = *a3 < *a2;
    if (*a3 == *a2)
      v11 = a3[1] < a2[1];
    if (v11)
    {
      v12 = *(_QWORD *)a2;
      *(_QWORD *)a2 = *(_QWORD *)a3;
      *(_QWORD *)a3 = v12;
      v13 = *a2 < *a1;
      if (*a2 == *a1)
        v13 = a2[1] < a1[1];
      if (v13)
      {
        v14 = *(_QWORD *)a1;
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)a2 = v14;
      }
    }
  }
  return result;
}

BOOL sub_1D3E3BB40(int *a1, int *a2)
{
  uint64_t v4;
  _BOOL8 result;
  int v6;
  BOOL v7;
  _BOOL4 v8;
  uint64_t v9;
  int *v10;
  int *v11;
  uint64_t v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  BOOL v20;
  BOOL v21;
  int *v22;
  int v23;
  int v24;
  _BOOL4 v25;
  uint64_t v26;
  int v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  _BOOL4 v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;

  v4 = ((char *)a2 - (char *)a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 2);
      v7 = v6 == *a1;
      v8 = v6 < *a1;
      if (v7)
        v8 = *(a2 - 1) < a1[1];
      if (v8)
      {
        v9 = *(_QWORD *)a1;
        *(_QWORD *)a1 = *((_QWORD *)a2 - 1);
        *((_QWORD *)a2 - 1) = v9;
      }
      return result;
    case 3:
      sub_1D3E3B998(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      sub_1D3E3BA70(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      sub_1D3E3BA70(a1, a1 + 2, a1 + 4, a1 + 6);
      v23 = *(a2 - 2);
      v24 = a1[6];
      v7 = v23 == v24;
      v25 = v23 < v24;
      if (v7)
        v25 = *(a2 - 1) < a1[7];
      if (v25)
      {
        v26 = *((_QWORD *)a1 + 3);
        *((_QWORD *)a1 + 3) = *((_QWORD *)a2 - 1);
        *((_QWORD *)a2 - 1) = v26;
        LODWORD(v26) = a1[6];
        v27 = a1[4];
        v7 = (_DWORD)v26 == v27;
        v28 = (int)v26 < v27;
        if (v7)
          v28 = a1[7] < a1[5];
        if (v28)
        {
          v30 = *((_QWORD *)a1 + 2);
          v29 = *((_QWORD *)a1 + 3);
          *((_QWORD *)a1 + 2) = v29;
          *((_QWORD *)a1 + 3) = v30;
          v31 = a1[2];
          v7 = v31 == (_DWORD)v29;
          v32 = v31 > (int)v29;
          if (v7)
            v32 = a1[3] > SHIDWORD(v29);
          if (v32)
          {
            v33 = *((_QWORD *)a1 + 1);
            *((_QWORD *)a1 + 1) = v29;
            *((_QWORD *)a1 + 2) = v33;
            v34 = a1[1] > SHIDWORD(v29);
            if (*a1 != (_DWORD)v29)
              v34 = *a1 > (int)v29;
            if (v34)
            {
              v35 = *(_QWORD *)a1;
              *(_QWORD *)a1 = v29;
              *((_QWORD *)a1 + 1) = v35;
            }
          }
        }
      }
      return 1;
    default:
      v10 = a1 + 4;
      sub_1D3E3B998(a1, a1 + 2, a1 + 4);
      v11 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11 < *v10;
    if (*v11 == *v10)
      v14 = v11[1] < v10[1];
    if (v14)
    {
      v15 = *(_QWORD *)v11;
      v16 = HIDWORD(*(_QWORD *)v11);
      v17 = v12;
      while (1)
      {
        v18 = (char *)a1 + v17;
        *(_QWORD *)((char *)a1 + v17 + 24) = *(_QWORD *)((char *)a1 + v17 + 16);
        if (v17 == -16)
          break;
        v19 = *((_DWORD *)v18 + 2);
        v20 = *((_DWORD *)v18 + 3) > (int)v16;
        v7 = v19 == (_DWORD)v15;
        v21 = v19 > (int)v15;
        if (!v7)
          v20 = v21;
        v17 -= 8;
        if (!v20)
        {
          v22 = (int *)((char *)a1 + v17 + 24);
          goto LABEL_19;
        }
      }
      v22 = a1;
LABEL_19:
      *(_QWORD *)v22 = v15;
      if (++v13 == 8)
        return v11 + 2 == a2;
    }
    v10 = v11;
    v12 += 8;
    v11 += 2;
    if (v11 == a2)
      return 1;
  }
}

void *sub_1D3E3BD9C(int *a1, int a2, uint64_t a3, uint64_t a4)
{
  int v8;
  int v9;
  int v10;
  void *v11;
  void *result;
  int v13;
  int v14;
  _DWORD *v15;
  char v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  _DWORD *v21;

  if (a2 >= 0)
    v8 = a2;
  else
    v8 = a2 + 1;
  v9 = v8 >> 1;
  v10 = a2 - (v8 >> 1);
  if (*(_DWORD *)a3 < v10)
  {
    v11 = *(void **)(a3 + 8);
    if (v11)
      free(v11);
    *(_QWORD *)(a3 + 8) = malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  }
  result = *(void **)(a4 + 8);
  if (*(_DWORD *)a4 < v9)
  {
    if (result)
      free(result);
    result = malloc_type_malloc(4 * v9, 0x100004052888210uLL);
    *(_QWORD *)(a4 + 8) = result;
  }
  *(_DWORD *)a3 = v10;
  *(_DWORD *)a4 = v9;
  if (a2 >= 1)
  {
    v13 = 0;
    v14 = 0;
    v15 = *(_DWORD **)(a3 + 8);
    v16 = 1;
    v17 = a2;
    do
    {
      v18 = *a1++;
      v19 = v18;
      if ((v16 & 1) != 0)
        v20 = v14;
      else
        v20 = v13;
      if ((v16 & 1) != 0)
        v21 = v15;
      else
        v21 = result;
      if ((v16 & 1) != 0)
        ++v14;
      else
        ++v13;
      v21[v20] = v19;
      v16 ^= 1u;
      --v17;
    }
    while (v17);
  }
  return result;
}

uint64_t sub_1D3E3BE98(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  float *v10;
  int v11;
  int *v12;
  int v13;
  _BOOL4 v14;
  float v15;
  float v16;
  float v17;
  BOOL v18;
  float v19;
  uint64_t v20;
  int32x2_t v21;
  float v22;
  int v23;
  int v24;
  int v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v3 = *(_DWORD *)(a1 + 16);
  v4 = *(int *)(a1 + 12);
  if (v3 <= (int)v4)
    return 15;
  v5 = v3 - v4 + 1;
  if (v5 < 41)
    return 16;
  v10 = (float *)(*(_QWORD *)a1 + 4 * v4);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = sub_1D3E0418C((uint64_t)&v28, v10, v5, 0.5);
  v12 = *(int **)(a2 + 64);
  v13 = *v12;
  v14 = *v12 != a3;
  *v12 = a3;
  v6 = sub_1D3E3C070((int *)v29, v11, a2, v14, (uint64_t)v10, v5);
  if (v6 >= 2)
  {
    v22 = *(float *)(*(_QWORD *)(a2 + 64) + 24);
    if (v22 <= 0.5)
    {
      v22 = 0.5;
      if ((float)((float)v5 / 104.5) > 0.5)
        v22 = (float)v5 / 104.5;
    }
    v23 = 2 * v11;
    v24 = 3;
    do
    {
      v25 = sub_1D3E043B8((uint64_t)&v28, v22);
      if (v25 < 1 || v25 > v23)
        break;
      v6 = sub_1D3E3C070((int *)v29, v25, a2, v13 != a3, (uint64_t)v10, v5);
      if (v6 <= 1)
        goto LABEL_6;
      --v24;
    }
    while (v24);
    sub_1D3E04604((void **)&v28);
  }
  else
  {
LABEL_6:
    sub_1D3E04604((void **)&v28);
    v15 = *(float *)(a2 + 72);
    v16 = *(float *)(a2 + 76);
    if (v15 <= v16)
      v17 = *(float *)(a2 + 76);
    else
      v17 = *(float *)(a2 + 72);
    v18 = v16 <= 0.0 || v15 <= 0.0;
    v19 = (float)(v15 + v16) * 0.5;
    if (v18)
      v19 = v17;
    v20 = *(_QWORD *)(a2 + 64);
    *(float *)(v20 + 24) = v19;
    sub_1D3E36D94((int *)v20, *(_QWORD *)(a1 + 80));
    *(float *)v21.i32 = (float)*(int *)(a1 + 12);
    *(float32x2_t *)(a1 + 20) = vadd_f32(*(float32x2_t *)(*(_QWORD *)(a2 + 64) + 48), (float32x2_t)vdup_lane_s32(v21, 0));
  }
  return v6;
}

uint64_t sub_1D3E3C070(int *a1, int a2, uint64_t a3, int a4, uint64_t a5, signed int a6)
{
  uint64_t v6;
  float *v7;
  unsigned int v8;
  int v11;
  unsigned int v12;
  float v16;
  float v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int *v21;
  int *v22;
  uint64_t v23;
  float *v24;
  float v25;
  float32x2_t *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  if (a2 < 2 * *(_DWORD *)(*(_QWORD *)(a3 + 64) + 20))
    return 16;
  v7 = (float *)a1;
  v8 = (int)(float)(*(float *)a1 + -0.5);
  if ((v8 & 0x80000000) != 0)
    return 15;
  v6 = 15;
  if ((int)(v8 + 1) < a6)
  {
    v11 = a2 - 1;
    v12 = (int)(float)(*(float *)&a1[a2 - 1] + -0.5);
    if ((v12 & 0x80000000) == 0 && (int)(v12 + 1) < a6)
    {
      v16 = *(float *)(a5 + 4 * v12);
      v17 = *(float *)(a5 + 4 * (v12 + 1));
      v18 = *(float *)(a5 + 4 * v8) < *(float *)(a5 + 4 * (v8 + 1));
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v29 = 0;
      sub_1D3E3BD9C(a1, a2, (uint64_t)&v30, (uint64_t)&v28);
      v19 = v31;
      v20 = v29;
      v6 = sub_1D3E3C278(v30, (uint64_t)v31, v28, (uint64_t)v29, a3, a5, a6, v18);
      if (v6 > 1)
      {
        if (a4)
        {
          v21 = (int *)malloc_type_malloc(4 * a2, 0x100004052888210uLL);
          v22 = v21;
          if (a2 >= 1)
          {
            v23 = a2;
            v24 = (float *)&v21[v11];
            do
            {
              v25 = *v7++;
              *v24-- = -v25;
              --v23;
            }
            while (v23);
          }
          sub_1D3E3BD9C(v21, a2, (uint64_t)&v30, (uint64_t)&v28);
          free(v22);
          v19 = v31;
          v20 = v29;
          v6 = sub_1D3E3C278(v30, (uint64_t)v31, v28, (uint64_t)v29, a3, a5, a6, v16 > v17);
          if (v6 < 2)
          {
            v26 = *(float32x2_t **)(a3 + 64);
            v26[3].i8[4] = 1;
            v26[6] = vneg_f32(v26[6]);
          }
        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a3 + 64) + 28) = 0;
      }
      if (v19)
        free(v19);
      if (v20)
        free(v20);
    }
  }
  return v6;
}

uint64_t sub_1D3E3C278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, int a8)
{
  unint64_t v8;
  int v9;
  uint64_t result;
  char v11;
  float *v15;
  float *v16;
  uint64_t v17;
  float *v18;
  int v19;
  float v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  float *v24;
  uint64_t v25;
  float *v26;
  uint64_t v27;
  int v28;
  float v29;
  float *v30;
  float *v31;
  uint64_t v32;
  unsigned int v33;

  v8 = a3;
  v9 = *(_DWORD *)(*(_QWORD *)(a5 + 64) + 20);
  if (v9 > (int)a3)
    return 16;
  v11 = a8;
  v15 = (float *)a4;
  v16 = (float *)a2;
  v17 = a1;
  result = sub_1D3E375DC(a1, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 1)
      return result;
    v18 = *(float **)(a5 + 64);
  }
  else
  {
    v18 = *(float **)(a5 + 64);
    v19 = *((_DWORD *)v18 + 11);
    if (v19 < 3 || (float)(v16[(int)v17 - v19 + 2] - v18[13]) >= (float)(*(float *)(a5 + 76) * 10.0))
      return 0;
  }
  v20 = *v18;
  *(_DWORD *)v18 &= 0xFFFE9FFF;
  if ((LODWORD(v20) & 0xFFFE9FFF) != 0)
  {
    v29 = v20;
    v31 = v15;
    v32 = a6;
    v33 = a7;
    v30 = v16;
    if (*((_BYTE *)v18 + 30))
      v21 = 5;
    else
      v21 = 65;
    v22 = 1;
    v23 = v17;
    while ((int)v17 > v9)
    {
      v24 = v16;
      v25 = v8;
      v16 = v15;
      v15 = v24 + 1;
      v11 ^= 1u;
      v8 = v23 & 0xFFFFFFFF00000000 | (v17 - 1);
      LODWORD(v17) = v25;
      if (v22 < 5)
        goto LABEL_29;
      v26 = &v31[(v22 >> 1) - 3];
      if ((v22 & 1) != 0)
        v26 = &v30[(v22 >> 1) - 2];
      if ((float)(*v16 - *v26) >= (float)((float)((float)(v15[v9 - 1] - *v16) / (float)(3 * v9)) * 10.0))
      {
LABEL_29:
        result = sub_1D3E375DC(v25, (uint64_t)v16, v8, (uint64_t)(v24 + 1), a5, v32, v33, v11 & 1);
        if (!(_DWORD)result)
        {
          v27 = *(_QWORD *)(a5 + 64);
          v28 = *(_DWORD *)(v27 + 44);
          if (v28 < 3)
          {
            result = 0;
            break;
          }
          result = 0;
          if ((float)(v16[(int)v25 - v28 + 2] - *(float *)(v27 + 52)) >= (float)(*(float *)(a5 + 76) * 10.0))
            break;
        }
      }
      ++v22;
      v23 = v25;
      if (v21 == v22)
        break;
    }
    v18 = *(float **)(a5 + 64);
    v20 = v29;
  }
  *v18 = v20;
  return result;
}

float sub_1D3E3C4AC(float *a1, int a2, float *a3, float *a4, int a5, int a6)
{
  float v6;
  float v7;
  float v8;
  float *v9;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float result;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  float *i;
  float v29;
  float v30;
  float v31;
  float v32;

  v6 = 3.0;
  if (!a6)
    v6 = 2.0;
  if (a2 < 1)
  {
    result = 3.4028e38;
    v15 = 0.0;
    v14 = 0.0;
    if ((float)(v6 * 3.4028e38) < 1.1755e-38)
      return result;
  }
  else
  {
    v7 = 3.4028e38;
    v8 = 1.1755e-38;
    v9 = a1;
    v10 = a2;
    do
    {
      v11 = *v9++;
      v12 = v11;
      if (v7 >= v11)
        v7 = v12;
      if (v8 <= v12)
        v8 = v12;
      --v10;
    }
    while (v10);
    if (v8 > (float)(v6 * v7))
      return 3.4028e38;
    v13 = 0;
    v14 = 0.0;
    v15 = 0.0;
    do
    {
      v16 = a1[v13];
      v15 = v15 + v16;
      if ((v13 & 1) != 0)
        v16 = -v16;
      v14 = v14 + v16;
      ++v13;
    }
    while (a2 != v13);
  }
  v18 = v15 / (float)a2;
  v19 = (float)-(float)(v14 - (float)((float)a2 * v15)) / (float)(a2 * a2 - 1);
  v20 = v14 - v19;
  if ((a2 & 1) != 0)
  {
    v21 = v19;
  }
  else
  {
    v20 = v14;
    v21 = v18;
  }
  v22 = v20 / (float)(2 * a2);
  *a3 = v21;
  v23 = -v22;
  if (a5)
    v23 = v22;
  *a4 = v23;
  v24 = *a3;
  if (fabsf(v22) > (float)(*a3 * 0.2))
    return 3.4028e38;
  v25 = (float)(v24 * 0.4) + 0.5;
  if (!a6)
    v25 = v24 * 0.4;
  result = 0.0;
  if (a2 >= 1)
  {
    v26 = a2;
    v27 = a2;
    for (i = a1; vabds_f32(*i, v24) <= v25; ++i)
    {
      if (!--v27)
        return result;
    }
    v29 = 0.0;
    do
    {
      v30 = *a1++;
      v31 = v30;
      if ((a5 & 1) != 0)
        v32 = -v23;
      else
        v32 = v23;
      v29 = v29
          + (float)((float)((float)((float)(v31 + (float)(v32 * 2.0)) / v24) + -1.0)
                  * (float)((float)((float)(v31 + (float)(v32 * 2.0)) / v24) + -1.0));
      LOBYTE(a5) = a5 ^ 1;
      --v26;
    }
    while (v26);
    return v29 / (float)a2;
  }
  return result;
}

BOOL sub_1D3E3C668(uint64_t a1, float *a2, uint64_t a3, float *a4, int a5)
{
  float v8;
  uint64_t v9;
  uint64_t v10;
  float *v11;
  float v12;
  float *v13;
  float *v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  _BOOL8 result;
  float v20;
  float v21;
  float v22;
  float v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  float *v27;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  uint64_t v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  uint64_t v37;
  float *v38;
  float *v39;
  uint64_t i;
  float *v41;
  uint64_t v42;
  uint64_t v43;
  float v44[3];
  float v45[9];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    if (a5 == 1)
    {
      v8 = 67.0;
      v9 = 21;
    }
    else
    {
      if (a5 != 2)
        return 0;
      v8 = 51.0;
      v9 = 16;
    }
  }
  else
  {
    v8 = 95.0;
    v9 = 29;
  }
  v10 = 0;
  v11 = &a4[v9];
  v12 = *v11 - *a2;
  v13 = a4;
  v14 = a2;
  do
  {
    v15 = v13;
    v44[v10++] = *v13 - *v14;
    v13 = v14 + 1;
    v14 = v15;
  }
  while (v10 != 4);
  v16 = v12 / v8;
  v17 = v45[0];
  v43 = 0;
  v18 = sub_1D3E3C4AC(v44, 3, (float *)&v43 + 1, (float *)&v43, 1, (float)(v12 / v8) < 5.0);
  result = 0;
  if (v18 > 0.01)
    return result;
  v20 = v16 * 0.5;
  if (vabds_f32(*((float *)&v43 + 1), v16) > (float)(v16 * 0.5))
    return 0;
  v21 = *(float *)&v43;
  v22 = v17 + (float)(*(float *)&v43 * 2.0);
  v23 = (float)(*((float *)&v43 + 1) * 0.5) + 0.5;
  if (v16 >= 5.0)
    v23 = *((float *)&v43 + 1) * 0.5;
  if (v22 < (float)(*((float *)&v43 + 1) - v23))
    return 0;
  v24 = a5 == 2 ? 4 : 3;
  if (v22 > (float)(v23 + (float)((float)v24 * *((float *)&v43 + 1))))
    return 0;
  if (a5 == 2)
  {
    v25 = 6;
    v26 = 3;
  }
  else
  {
    v37 = 13;
    if (a5)
      v37 = 9;
    v38 = &a4[v37];
    v39 = &a2[v37];
    for (i = 3; i != 8; ++i)
    {
      v41 = v39 + 1;
      v44[i] = v39[1] - *v38;
      v39 = v38;
      v38 = v41;
    }
    v42 = 0;
    if (sub_1D3E3C4AC(v45, 5, (float *)&v42 + 1, (float *)&v42, 0, v16 < 5.0) > 0.01
      || vabds_f32(*((float *)&v42 + 1), v16) > v20
      || vabds_f32(*(float *)&v42, v21) > (float)(v16 * 0.3))
    {
      return 0;
    }
    v25 = 3;
    v26 = 8;
  }
  v27 = &a2[v9];
  v28 = v25 + 1;
  v29 = v26;
  do
  {
    v30 = v27;
    v31 = v29++;
    v44[v31] = *v11 - *v27;
    v27 = v11 - 1;
    v11 = v30;
    --v28;
  }
  while (v28);
  v32 = v44[(int)v31];
  v42 = 0;
  v33 = sub_1D3E3C4AC(&v44[v26], v31 - v26, (float *)&v42 + 1, (float *)&v42, 1, v16 < 5.0);
  result = 0;
  if (v33 > 0.01)
    return result;
  if (vabds_f32(*((float *)&v42 + 1), v16) > v20)
    return 0;
  v34 = *(float *)&v42;
  if (vabds_f32(*(float *)&v42, v21) > (float)(v16 * 0.3))
    return 0;
  if ((v25 & 1) == 0)
    v34 = -*(float *)&v42;
  v35 = v32 + (float)(v34 * 2.0);
  v36 = (float)(*((float *)&v42 + 1) * 0.5) + 0.5;
  if (v16 >= 5.0)
    v36 = *((float *)&v42 + 1) * 0.5;
  return v35 <= (float)(v36 + (float)(*((float *)&v42 + 1) * 4.0)) && v35 >= (float)(*((float *)&v42 + 1) - v36);
}

void sub_1D3E3C9D8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, float *a6, double a7, double a8, int32x2_t a9)
{
  float *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  int v15;
  uint64_t v16;
  int v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float *v31;
  float v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  float v36;
  float v37;
  float v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  uint64_t v51;
  float v52;
  float v53;
  uint64_t i;
  float v55;
  uint64_t v56;
  float v57;
  float v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  uint64_t j;
  float v64;
  uint64_t v65;
  float v66;
  float v67;
  float v68;
  uint64_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float v72;
  float32x2x2_t v73;
  unint64_t v74;
  float *v75;
  float v76;
  uint64_t v77;
  float v78;
  uint64_t v79;
  float v80;
  float v81;
  float v82;
  uint64_t v83;
  uint64_t v84;
  float v85;
  uint64_t v86;
  float v87;
  float v88;
  float v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  float *v95;
  float *v96;
  float v97;
  float v98;
  int v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  char v108;
  BOOL v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  float *v113;
  float *v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  BOOL v122;
  float v123;
  float v124;
  float v125;
  int v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v133;
  float v134[20];
  float v135[6];
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  uint64_t v143;
  float32x2x2_t v144;

  v9 = a6;
  v10 = a5;
  v11 = 0;
  v143 = *MEMORY[0x1E0C80C00];
  v12 = *(float *)(a3 + 4);
  v13 = *(float *)(a4 + 4);
  v14 = v12 - *(float *)a4;
  v136 = *(float *)a4 - *(float *)a3;
  v137 = v14;
  v15 = a2[1];
  v16 = *a2;
  v17 = a2[2];
  v138 = v13 - v12;
  v18 = 0.0;
  v19 = 1;
  v20 = 4;
  do
  {
    v21 = *(&v136 + v11);
    v22 = v20;
    do
    {
      v23 = *(float *)((char *)&v136 + v22);
      v122 = v21 <= v23;
      v24 = v23 / v21;
      v25 = v21 / v23;
      if (v122)
        v25 = v24;
      if (v18 <= v25)
        v18 = v25;
      v22 += 4;
    }
    while (v22 != 12);
    ++v19;
    v20 += 4;
    v11 = 1;
  }
  while (v19 != 3);
  if (v18 >= 1.0)
    v26 = v18;
  else
    v26 = 100.0;
  if (v17 < 1)
  {
    v69 = 0;
    v70.i64[0] = *(_QWORD *)(a4 + 52);
    v71.i64[0] = *(_QWORD *)(a3 + 56);
    v70.i64[1] = v71.i64[0];
    v71.i32[2] = vdup_lane_s32(*(int32x2_t *)v70.f32, 1).u32[0];
    v72 = *(float *)(a4 + 60);
    v71.f32[3] = v72;
    v73 = (float32x2x2_t)vsubq_f32(v71, v70);
    v74 = vextq_s8((int8x16_t)v73, (int8x16_t)v73, 8uLL).u64[0];
    v75 = &v136;
    vst2_f32(v75, v73);
    v75 += 4;
    v70.i32[0] = *(_DWORD *)(a3 + 64);
    *v75 = v70.f32[0] - v72;
    v139 = *(float *)(a4 + 64) - v70.f32[0];
    v76 = 0.0;
    v77 = 4;
    do
    {
      v78 = *(&v136 + v69);
      v79 = v77;
      do
      {
        v80 = *(float *)((char *)&v136 + v79);
        v122 = v78 <= v80;
        v81 = v80 / v78;
        v82 = v78 / v80;
        if (v122)
          v82 = v81;
        if (v76 <= v82)
          v76 = v82;
        v79 += 4;
      }
      while (v79 != 24);
      ++v69;
      v77 += 4;
    }
    while (v69 != 5);
    if (v76 < 1.0)
      v76 = 100.0;
    if (v26 <= v76)
    {
      v83 = 0;
      v62 = 0.0;
      v84 = 4;
      do
      {
        v85 = *(&v136 + v83);
        v86 = v84;
        do
        {
          v87 = *(float *)((char *)&v136 + v86);
          v122 = v85 <= v87;
          v88 = v87 / v85;
          v89 = v85 / v87;
          if (v122)
            v89 = v88;
          if (v62 <= v89)
            v62 = v89;
          v86 += 4;
        }
        while (v86 != 24);
        ++v83;
        v84 += 4;
      }
      while (v83 != 5);
      goto LABEL_74;
    }
  }
  else
  {
    v27 = 0;
    v28 = 4 * (2 * v15 + 2);
    v29 = *(float32x2_t *)(a3 + v28);
    v30 = *(float32x2_t *)(a4 + v28);
    a9.i32[0] = *(_DWORD *)(a4 + 4 * ((2 * v15) | 1));
    v144.val[0] = vsub_f32(v29, (float32x2_t)vzip1_s32(a9, (int32x2_t)v30));
    v144.val[1] = vsub_f32(v30, v29);
    v31 = &v136;
    vst2_f32(v31, v144);
    v31 += 4;
    *v31 = *(float *)(a3 + 4 * (2 * v15 + 4)) - v30.f32[1];
    v32 = 0.0;
    v33 = 4;
    do
    {
      v34 = *(&v136 + v27);
      v35 = v33;
      do
      {
        v36 = *(float *)((char *)&v136 + v35);
        v122 = v34 <= v36;
        v37 = v36 / v34;
        v38 = v34 / v36;
        if (v122)
          v38 = v37;
        if (v32 <= v38)
          v32 = v38;
        v35 += 4;
      }
      while (v35 != 20);
      ++v27;
      v33 += 4;
    }
    while (v27 != 4);
    v39 = 2 * (v15 + 2 + v17);
    if (v32 < 1.0)
      v32 = 100.0;
    if (v26 <= v32)
    {
      v40 = 0;
      v41 = 0;
      v42 = 0.0;
      do
      {
        v43 = *(&v136 + v41);
        v44 = v40;
        do
        {
          v45 = *(float *)((char *)&v137 + v44);
          v122 = v43 <= v45;
          v46 = v45 / v43;
          v47 = v43 / v45;
          if (v122)
            v47 = v46;
          if (v42 <= v47)
            v42 = v47;
          v44 += 4;
        }
        while (v44 != 16);
        ++v41;
        v40 += 4;
      }
      while (v41 != 4);
      if (v42 >= 1.0)
        v26 = v42;
      else
        v26 = 100.0;
    }
    v48 = 0;
    v49 = 0;
    v50 = *(float *)(a4 + 4 * v39);
    v51 = (8 * (v15 + 2 + v17)) | 4;
    v52 = *(float *)(a3 + v51);
    v136 = v50 - *(float *)(a3 + 4 * v39);
    v137 = v52 - v50;
    v138 = *(float *)(a4 + v51) - v52;
    v53 = 0.0;
    for (i = 1; i != 3; ++i)
    {
      v55 = *(&v136 + v49);
      v56 = v48;
      do
      {
        v57 = *(float *)((char *)&v137 + v56);
        v122 = v55 <= v57;
        v58 = v57 / v55;
        v59 = v55 / v57;
        if (v122)
          v59 = v58;
        if (v53 <= v59)
          v53 = v59;
        v56 += 4;
      }
      while (v56 != 8);
      v48 += 4;
      v49 = 1;
    }
    if (v53 < 1.0)
      v53 = 100.0;
    if (v26 <= v53)
    {
      v60 = 0;
      v61 = 0;
      v62 = 0.0;
      for (j = 1; j != 3; ++j)
      {
        v64 = *(&v136 + v61);
        v65 = v60;
        do
        {
          v66 = *(float *)((char *)&v137 + v65);
          v122 = v64 <= v66;
          v67 = v66 / v64;
          v68 = v64 / v66;
          if (v122)
            v68 = v67;
          if (v62 <= v68)
            v62 = v68;
          v65 += 4;
        }
        while (v65 != 8);
        v60 += 4;
        v61 = 1;
      }
LABEL_74:
      if (v62 >= 1.0)
        v26 = v62;
      else
        v26 = 100.0;
    }
  }
  v133 = 0;
  v90 = v15 + v16;
  if (v15 < 1)
  {
    LODWORD(v91) = 0;
    v97 = 0.0;
    v100 = INFINITY;
    v110 = 2;
    v98 = INFINITY;
  }
  else
  {
    v127 = v17;
    v91 = 0;
    v126 = v15 + v16;
    v92 = v90;
    v93 = a1 + v16;
    v94 = a5 + v16;
    v128 = a4;
    v129 = a3;
    v95 = (float *)(a3 + 12);
    v96 = (float *)(a4 + 12);
    v97 = 0.0;
    v98 = INFINITY;
    v99 = 2;
    v100 = INFINITY;
    do
    {
      v101 = v100;
      v102 = *(v96 - 1);
      v103 = 1.0 / (float)(*v96 - *(v96 - 2));
      v105 = *(v95 - 1);
      v104 = *v95;
      v106 = v103 * (float)(*v96 - v102);
      v140 = v103 * (float)((float)(*v96 + v102) - (float)(*v95 + v105));
      v141 = v106;
      v142 = v103 * (float)(v104 - v105);
      sub_1D3E3EF34(20, 3u, 6u, v135, v134, &v140, flt_1D3E760A4, (_DWORD *)&v133 + 1, (float *)&v133);
      v97 = v97 + *(float *)&v133;
      if (*(float *)&v133 <= v98)
        v107 = *(float *)&v133;
      else
        v107 = v98;
      if (*(float *)&v133 > v100)
      {
        v98 = v107;
      }
      else
      {
        v100 = *(float *)&v133;
        v98 = v101;
      }
      v108 = BYTE4(v133);
      v109 = SHIDWORD(v133) > 9;
      if (SHIDWORD(v133) > 9)
        v108 = BYTE4(v133) - 10;
      *(_BYTE *)(v93 + v91) = v108;
      *(_BYTE *)(v94 + v91) = v109;
      v99 += 2;
      ++v91;
      v95 += 2;
      v96 += 2;
    }
    while (v16 + v91 < v92);
    v110 = v99 & 0xFFFFFFFE;
    v10 = a5;
    v9 = a6;
    a4 = v128;
    a3 = v129;
    v17 = v127;
    v90 = v126;
  }
  if (v17 < 1)
  {
    v120 = v100;
  }
  else
  {
    v111 = v90;
    v112 = v90 + v17;
    v113 = (float *)(a4 + 4 * v110 + 12);
    v114 = (float *)(a3 + 4 * v110 + 16);
    do
    {
      v115 = *(v114 - 1);
      v116 = *(v114 - 2);
      v117 = 1.0 / (float)(*v114 - v116);
      v118 = *(v113 - 1);
      v119 = *v113;
      v140 = v117 * (float)((float)(v118 + *v113) - (float)(v116 + v115));
      v141 = v117 * (float)(v115 - v116);
      v142 = v117 * (float)(v119 - v118);
      sub_1D3E3EF34(10, 3u, 5u, v135, v134, &v140, flt_1D3E76334, (_DWORD *)&v133 + 1, (float *)&v133);
      v120 = *(float *)&v133;
      v97 = v97 + *(float *)&v133;
      if (*(float *)&v133 <= v98)
        v121 = *(float *)&v133;
      else
        v121 = v98;
      v122 = *(float *)&v133 > v100;
      if (*(float *)&v133 > v100)
        v120 = v100;
      *(_BYTE *)(a1 + v111) = BYTE4(v133);
      *(_BYTE *)(v10 + v111++) = 0;
      v113 += 2;
      if (v122)
        v98 = v121;
      else
        v98 = v100;
      v114 += 2;
      LODWORD(v91) = v91 + 1;
      v100 = v120;
    }
    while (v111 < v112);
  }
  v123 = (float)((float)(v98 * 0.3) + (float)(v120 * 0.55)) + (float)((float)(v97 / (float)(int)v91) * 0.15);
  v124 = 0.0;
  if (v26 >= 2.0)
    v124 = (float)(2.0 - v26) * 0.1;
  v125 = v124 + v123;
  if (v125 > 1.0)
    v125 = 1.0;
  *v9 = v125;
}

uint64_t sub_1D3E3D0D8(uint64_t a1, uint64_t a2, unsigned __int8 *a3, float *a4, double a5, double a6, int32x2_t a7)
{
  uint64_t result;
  uint64_t v10;
  int v11;
  int v12;
  _BYTE v13[13];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  sub_1D3E3C9D8((uint64_t)a3, dword_1D3E75D64, a1, a2, (uint64_t)v13, a4, a5, a6, a7);
  if (*a4 < 0.1)
    return 2;
  v10 = 0;
  v11 = 0;
  do
  {
    v11 |= v13[v10 + 1] << v10;
    ++v10;
  }
  while (v10 != 6);
  result = 4;
  if ((char)v11 > 37)
  {
    if ((char)v11 <= 43)
    {
      if ((char)v11 == 38)
      {
        LOBYTE(v11) = 5;
      }
      else
      {
        if ((char)v11 != 42)
          return result;
        LOBYTE(v11) = 7;
      }
    }
    else
    {
      switch((char)v11)
      {
        case ',':
          LOBYTE(v11) = 2;
          break;
        case '2':
          LOBYTE(v11) = 4;
          break;
        case '4':
          LOBYTE(v11) = 1;
          break;
        default:
          return result;
      }
    }
  }
  else if ((char)v11 <= 21)
  {
    if ((_BYTE)v11)
    {
      if ((char)v11 != 14)
        return result;
      LOBYTE(v11) = 6;
    }
  }
  else
  {
    switch((char)v11)
    {
      case 22:
        LOBYTE(v11) = 9;
        break;
      case 26:
        LOBYTE(v11) = 8;
        break;
      case 28:
        LOBYTE(v11) = 3;
        break;
      default:
        return result;
    }
  }
  *a3 = v11;
  v12 = a3[12];
  if (v12 == sub_1D3E3D264(a3))
    return 0;
  else
    return 5;
}

uint64_t sub_1D3E3D264(unsigned __int8 *a1)
{
  __int16 v1;

  v1 = (unsigned __int16)(a1[2]
                        + *a1
                        + a1[4]
                        + a1[6]
                        + a1[8]
                        + a1[10]
                        + 3 * (a1[3] + a1[1] + a1[5] + a1[7] + a1[9] + a1[11]))
     % 0xAu;
  if (v1)
    return (char)(10 - v1);
  else
    return 0;
}

uint64_t sub_1D3E3D2F0(uint64_t a1, float *a2, uint64_t a3, float *a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v8;
  float *v12;
  float *v13;
  size_t v14;
  unsigned __int8 *v15;
  double v16;
  double v17;
  int32x2_t v18;
  float v19;
  unsigned __int8 *v20;
  float v21;
  uint64_t v22;
  float32x4_t *v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  float v28;
  float *v29;
  uint64_t i;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  float32x4_t *v35;
  uint64_t v36;
  char v37;
  float v38;
  float *v39;
  int v40;
  uint64_t j;
  int v42;
  BOOL v43;
  char *v44;
  float *v45;
  uint64_t v46;
  _OWORD *v47;
  char *v48;
  float *v49;
  float v50;
  float *v51;
  int v52;
  uint64_t v53;
  float v54;
  float *v55;
  uint64_t v56;
  char *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  float *v63;
  char *v64;
  double v65;
  double v66;
  int32x2_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  float *v72;
  _DWORD *v73;
  unsigned int v74;
  uint64_t v75;
  float *v76;
  uint64_t v77;
  int v78;
  char *v79;
  uint64_t v80;
  float v81;
  float *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  unint64_t v93;
  uint64_t v94;
  float v95;
  float v96;
  float v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  float v105;
  float v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  int v111;
  unsigned int v112;
  uint64_t v113;
  float v114;
  float v115;
  float v116;
  uint64_t k;
  unint64_t v118;
  uint64_t v119;
  float *v120;
  float *v121;
  float v122;
  uint64_t v123;
  BOOL v124;
  uint64_t v125;
  float *v126;
  uint64_t v127;
  float v128;
  float v129;
  float *v130;
  float v131;
  uint64_t v132;
  float *v133;
  float v134;
  float *v135;
  uint64_t v136;
  float *v137;
  float v138;
  float v139;
  float v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  float v144;
  float *v145;
  uint64_t v146;
  int v147;
  uint64_t v149;
  float v150;
  float v151;
  uint64_t v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float v157;
  unint64_t v158;
  float v159;
  float v160;
  int v161;
  uint64_t v162;
  float v163;
  uint64_t v164;
  float v165;
  float v166;
  uint64_t v167;
  float v168;
  int v169;
  int v170;
  int v171;
  int v172;
  uint64_t v173;
  char v174;
  float *v175;
  float v176;
  uint64_t v177;
  int v178;
  float *v179;
  uint64_t v180;
  char *v181;
  float v182;
  float v183;
  float v184;
  float *v185;
  uint64_t v186;
  int v187;
  float *v188;
  uint64_t v189;
  _DWORD *v190;
  _DWORD *v191;
  uint64_t v192;
  float v193;
  float v194;
  float v195;
  uint64_t v196;
  const float *v197;
  int8x16_t v198;
  uint64_t v199;
  float v200;
  float v201;
  float v202;
  uint64_t v203;
  const float *v204;
  int8x16_t v205;
  uint64_t v206;
  float v207;
  float v208;
  float v209;
  uint64_t v210;
  float v211;
  void *v212;
  _DWORD *v213;
  float *v215;
  char *v216;
  int v217;
  float *v218;
  char *v219;
  uint64_t v220;
  unsigned __int8 *v221;
  uint64_t v222;
  char *v223;
  char *v224;
  char *v225;
  float *v226;
  uint64_t v227;
  float *v228;
  float *v229;
  int v230;
  float *v231;
  char *v232;
  _OWORD *v233;
  float *v234;
  float *v235;
  char *v236;
  uint64_t v237;
  uint64_t v238;
  float *v239;
  uint64_t v240;
  int v241;
  char *v242;
  unsigned int v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  char *v248;
  _BYTE v249[7];
  float v250;
  uint64_t v251;
  float32x4_t v252;
  uint64_t v253;

  v253 = *MEMORY[0x1E0C80C00];
  if ((int)a3 < 30)
    return 16;
  v12 = a4;
  v13 = a2;
  v230 = a3 - 30;
  if (!sub_1D3E3C668(a1, a2, a3, a4, 0))
    return 23;
  v14 = 13;
  *(_QWORD *)(a5 + 8) = 13;
  *(_QWORD *)(a5 + 80) = 0xD00000001;
  if (*(_QWORD *)(a5 + 16))
  {
    free(*(void **)(a5 + 16));
    v14 = *(_QWORD *)(a5 + 8);
  }
  *(_QWORD *)(a5 + 16) = 0;
  v15 = (unsigned __int8 *)malloc_type_malloc(v14, 0x100004077774924uLL);
  *(_QWORD *)(a5 + 16) = v15;
  v226 = (float *)(a5 + 24);
  if (!sub_1D3E3D0D8((uint64_t)v13, (uint64_t)v12, v15, (float *)(a5 + 24), v16, v17, v18))
    goto LABEL_203;
  v251 = 0;
  v250 = 0.0;
  v19 = *(float *)((char *)v12 + (((a3 << 32) - 0x100000000) >> 30));
  v227 = a5;
  v20 = *(unsigned __int8 **)(a5 + 16);
  v21 = v19 - *v12;
  if (v21 < 300.0)
    sub_1D3E17528(a6, (int)*v13, (int)v19, (float *)&v251 + 1, (float *)&v251, &v250);
  v229 = v13;
  v22 = 0;
  v23 = &v252;
  v24 = 1;
  do
  {
    if (v21 >= 300.0)
    {
      v25 = v22 + 3;
      sub_1D3E17528(a6, (int)v12[v22 + 1], (int)v12[v22 + 3], (float *)&v251 + 1, (float *)&v251, &v250);
    }
    else
    {
      v25 = (2 * v24) | 1;
    }
    v26 = *((float *)&v251 + 1);
    v27 = *(float *)&v251;
    v28 = v250;
    sub_1D3E3E334(a6, a7, 0, (uint64_t)v23, v12[v22 + 1], v12[v25], *((float *)&v251 + 1), *(float *)&v251, v250);
    ++v24;
    v22 += 2;
    v23 = (float32x4_t *)((char *)v23 + 72);
  }
  while (v22 != 12);
  v29 = v229 + 18;
  for (i = 432; i != 864; i += 72)
  {
    v31 = *(v29 - 2);
    v32 = *v29;
    v29 += 2;
    sub_1D3E3E334(a6, a7, 1, (uint64_t)&v252 + i, v31, v32, v26, v27, v28);
  }
  v33 = 100.0;
  v34 = 1;
  v35 = &v252;
  v13 = v229;
  a5 = v227;
  while (1)
  {
    v36 = 0;
    v37 = -1;
    v38 = -1.0;
    do
    {
      if (v35->f32[v36 + 1] > v38)
      {
        v37 = v35->i8[v36 * 4];
        v38 = v35->f32[v36 + 1];
      }
      v36 += 2;
    }
    while (v36 != 16);
    if (v37 == -1)
      break;
    if (v34 > 6)
    {
      v37 -= 20;
    }
    else
    {
      v249[v34] = v37 > 9;
      if (v37 > 9)
        v37 -= 10;
    }
    v20[v34] = v37;
    v39 = &v252.f32[18 * v34 - 18];
    if (v33 > v39[9])
      v33 = v39[9];
    ++v34;
    v35 = (float32x4_t *)((char *)v35 + 72);
    if (v34 == 13)
    {
      if (v33 > -0.15)
        *v226 = v33 + 0.5;
      v40 = 0;
      for (j = 1; j != 7; ++j)
        v40 |= v249[j] << (j - 1);
      if ((char)v40 > 37)
      {
        if ((char)v40 <= 43)
        {
          if ((char)v40 == 38)
          {
            LOBYTE(v40) = 5;
          }
          else
          {
            if ((char)v40 != 42)
              break;
            LOBYTE(v40) = 7;
          }
        }
        else
        {
          switch((char)v40)
          {
            case ',':
              LOBYTE(v40) = 2;
              break;
            case '2':
              LOBYTE(v40) = 4;
              break;
            case '4':
              LOBYTE(v40) = 1;
              break;
            default:
              goto LABEL_58;
          }
        }
      }
      else if ((char)v40 <= 21)
      {
        if ((_BYTE)v40)
        {
          if ((char)v40 != 14)
            break;
          LOBYTE(v40) = 6;
        }
      }
      else
      {
        switch((char)v40)
        {
          case 22:
            LOBYTE(v40) = 9;
            break;
          case 26:
            LOBYTE(v40) = 8;
            break;
          case 28:
            LOBYTE(v40) = 3;
            break;
          default:
            goto LABEL_58;
        }
      }
      *v20 = v40;
      v42 = v20[12];
      v43 = v42 == sub_1D3E3D264(v20);
      a5 = v227;
      if (v43)
        goto LABEL_203;
      break;
    }
  }
LABEL_58:
  v221 = *(unsigned __int8 **)(a5 + 16);
  v44 = (char *)malloc_type_malloc(0x300uLL, 0x100004052888210uLL);
  v45 = (float *)v44;
  v46 = 0;
  v47 = v44 + 240;
  v48 = v44 + 744;
  v49 = v12;
  do
  {
    v50 = *v13++;
    v51 = (float *)&v44[v46];
    *v51 = v50;
    v52 = *(_DWORD *)v49++;
    *((_DWORD *)v51 + 1) = v52;
    v46 += 8;
  }
  while (v46 != 240);
  v220 = (uint64_t)(v44 + 600);
  v53 = 0;
  v54 = (float)(*((float *)v44 + 59) - *(float *)v44) / 95.0;
  *((_QWORD *)v44 + 90) = 0;
  *((float *)v44 + 182) = v54;
  *(_QWORD *)(v44 + 732) = 0;
  *((float *)v44 + 185) = v54;
  *((_OWORD *)v44 + 27) = xmmword_1D3E75E30;
  *((_OWORD *)v44 + 28) = unk_1D3E75E40;
  *((_OWORD *)v44 + 29) = xmmword_1D3E75E50;
  *((_OWORD *)v44 + 23) = xmmword_1D3E75DF0;
  *((_OWORD *)v44 + 24) = unk_1D3E75E00;
  v236 = v44 + 720;
  v55 = (float *)(v44 + 756);
  *((_OWORD *)v44 + 25) = xmmword_1D3E75E10;
  *((_OWORD *)v44 + 26) = unk_1D3E75E20;
  *((_OWORD *)v44 + 19) = xmmword_1D3E75DB0;
  *((_OWORD *)v44 + 20) = unk_1D3E75DC0;
  *((_OWORD *)v44 + 21) = xmmword_1D3E75DD0;
  *((_OWORD *)v44 + 22) = unk_1D3E75DE0;
  *v47 = xmmword_1D3E75D70;
  *((_OWORD *)v44 + 16) = unk_1D3E75D80;
  *((_OWORD *)v44 + 17) = xmmword_1D3E75D90;
  *((_OWORD *)v44 + 18) = unk_1D3E75DA0;
  do
  {
    v56 = dword_1D3E75E60[v53];
    v57 = &v44[v53 * 4];
    *((_DWORD *)v57 + 186) = *(_DWORD *)&v44[4 * v56];
    *((_DWORD *)v57 + 189) = *((_DWORD *)v47 + v56);
    ++v53;
  }
  while (v53 != 3);
  v58 = 0;
  v59 = 0;
  do
  {
    v60 = v59 + 1;
    v61 = dword_1D3E75E60[v59 + 1];
    if (v58 < v61)
    {
      v62 = v61 - (uint64_t)v58;
      v63 = (float *)&v44[4 * v58];
      do
      {
        *v63 = *v63 - *(float *)&v48[4 * v59];
        ++v63;
        --v62;
      }
      while (v62);
    }
    v58 = v61;
    v59 = 1;
  }
  while (v60 != 2);
  v222 = (uint64_t)(v44 + 480);
  v64 = (char *)malloc_type_malloc(0xECuLL, 0x100004052888210uLL);
  v217 = 0;
  v228 = v45 + 61;
  v225 = v64 + 12;
  v218 = v45 + 88;
  v219 = v64 + 108;
  v223 = v64 + 128;
  v215 = v45 + 117;
  v216 = v64 + 224;
  v234 = v45;
  v235 = v12;
  v232 = v48;
  v233 = v47;
  v231 = v45 + 189;
  v224 = v64;
  while (2)
  {
    v68 = 0;
    v69 = v236;
LABEL_69:
    if (v68 != 2)
    {
      v70 = dword_1D3E75E60[v68];
      v71 = dword_1D3E75E60[v68 + 1];
      v72 = &v45[v70];
      *v72 = 0.0;
      v45[v71] = *(float *)&v48[4 * v68 + 4] - *(float *)&v48[4 * v68];
      v73 = (_DWORD *)v47 + v70;
      *v73 = 0;
      v74 = v71 - v70;
      if ((int)v71 > (int)v70)
      {
        v75 = v71 - v70;
        v76 = &v228[v70];
        do
        {
          *v76 = *v76 - v55[v68];
          ++v76;
          --v75;
        }
        while (v75);
      }
      v77 = v74 + 1;
      if ((int)v77 < 3)
        goto LABEL_197;
      v243 = v74;
      v246 = (uint64_t)v73;
      v78 = 3 * v77;
      v79 = (char *)malloc_type_malloc(4 * (5 * (int)v77 + 30), 0x100004052888210uLL);
      if (!v79)
        goto LABEL_197;
      v237 = v68 + 1;
      v82 = (float *)&v236[12 * v68];
      v83 = &v79[4 * v77];
      v84 = (uint64_t)&v83[4 * v77];
      v240 = v78;
      v85 = v84 + 12 + 4 * v78;
      v86 = v85 + 36;
      v247 = v85;
      v248 = v79;
      v238 = v85 + 60;
      v245 = v84 + 12;
      sub_1D3D70C5C(v82, v84 + 12, v81, v80, v77, v246);
      v87 = 0;
      v88 = v82[2];
      v239 = v82;
      v89 = -*v82;
      v90 = -v82[1];
      do
      {
        if ((v87 & 1) != 0)
          v91 = -1.0;
        else
          v91 = 1.0;
        v92 = *(float *)(v246 + 4 * v87) + (float)(v89 * v91);
        *(float *)&v83[4 * v87++] = (float)(v88 * v92) / (float)((float)(v90 * v92) + 1.0);
      }
      while (v77 != v87);
      v93 = 0;
      v94 = 4 * v77;
      v95 = 0.0;
      do
      {
        v96 = v72[v93 / 4] - *(float *)&v248[4 * v77 + v93];
        *(float *)&v248[v93] = v96;
        v95 = v95 + (float)(v96 * v96);
        v93 += 4;
      }
      while (v94 != v93);
      v97 = fabsf(v95);
      if (v97 >= INFINITY && v97 <= INFINITY)
      {
        free(v248);
        v8 = 15;
        v45 = v234;
        v12 = v235;
        goto LABEL_198;
      }
      v98 = v247 + 72;
      v244 = v77;
      v242 = v83;
      sub_1D3D6D028(v245, (uint64_t)v248, v247, v84, v77);
      v100 = v83;
      v102 = v247;
      v101 = v248;
      v103 = v77;
      v104 = 0;
      v105 = *(float *)(v245 + 4 * v240);
      if (*(float *)(v247 + 16) > v105)
        v105 = *(float *)(v247 + 16);
      if (*(float *)(v247 + 32) > v105)
        v105 = *(float *)(v247 + 32);
      v106 = v105 * 0.001;
      v107 = &v248[8 * v77 + 4 * v240];
      v108 = v107 + 48;
      v109 = &v248[v94];
      v110 = v84 + 4 * v240;
      v111 = 2;
      v112 = v243;
LABEL_90:
      if (v95 <= 0.000001)
        goto LABEL_154;
      v113 = 0;
      v114 = 0.0;
      v115 = 0.0;
      do
      {
        v116 = *(float *)(v84 + v113);
        if (v116 < 0.0)
          v116 = -v116;
        if (v114 < v116)
          v114 = v116;
        *(_DWORD *)&v107[v113 + 60] = *(_DWORD *)&v107[4 * v113 + 12];
        v115 = v115 + (float)(*(float *)&v69[v113] * *(float *)&v69[v113]);
        v113 += 4;
      }
      while (v113 != 12);
      if (v114 <= 0.000001)
      {
LABEL_154:
        v161 = v104;
        goto LABEL_155;
      }
      for (k = 12; k != 60; k += 16)
        *(float *)&v107[k] = v106 + *(float *)&v107[k];
      v118 = 0;
      v119 = 1;
      v120 = (float *)(v247 + 84);
      v121 = (float *)v102;
      while (1)
      {
        v122 = *v121;
        *v120 = *v121;
        if (!v118)
          break;
        v123 = -(uint64_t)v118;
        do
        {
          v122 = v122 - (float)(v120[v123] * v120[v123]);
          *v120 = v122;
          v124 = __CFADD__(v123++, 1);
        }
        while (!v124);
        *v120 = sqrtf(v122);
        v125 = v118 + 1;
        if (v118 <= 1)
          goto LABEL_108;
LABEL_114:
        v120 += v118 + 2;
        v121 += v125 + 1;
        ++v119;
        v118 = v125;
        if (v125 == 3)
        {
          v132 = 0;
          v133 = (float *)(v247 + 84);
          do
          {
            v134 = *(float *)(v84 + 4 * v132);
            *(float *)(v98 + 4 * v132) = v134;
            if (v132)
            {
              v135 = (float *)(v247 + 72);
              v136 = v132;
              v137 = v133;
              do
              {
                v138 = *v137++;
                v139 = v138;
                v140 = *v135++;
                v134 = v134 - (float)(v139 * v140);
                *(float *)(v98 + 4 * v132) = v134;
                --v136;
              }
              while (v136);
            }
            else
            {
              v137 = v133;
            }
            v133 = v137 + 1;
            *(float *)(v98 + 4 * v132++) = v134 / *v137;
          }
          while (v132 != 3);
          v141 = 15;
          v142 = 3;
          do
          {
            v143 = v142 - 1;
            v144 = *(float *)(v98 + 4 * (v142 - 1));
            *(float *)(v86 + 4 * (v142 - 1)) = v144;
            if (v142 <= 2)
            {
              v145 = &v137[v142];
              v146 = v141;
              do
              {
                v144 = v144 - (float)(*v145 * *(float *)&v107[4 * v146]);
                *(float *)(v86 + 4 * v143) = v144;
                v147 = v146 - 11;
                v145 += v146 - 11;
                ++v146;
              }
              while (v147 != 3);
            }
            *(float *)(v86 + 4 * v143) = v144 / *v137;
            v137 -= v142;
            --v141;
          }
          while (v142-- > 1);
          v149 = 0;
          v150 = 0.0;
          do
          {
            v151 = *(float *)&v108[v149];
            *(float *)&v108[v149 + 24] = *(float *)&v69[v149] + v151;
            v150 = v150 + (float)(v151 * v151);
            v149 += 4;
          }
          while (v149 != 12);
          if (v150 <= (float)(v115 * 1.0e-12))
            goto LABEL_154;
          if ((float)(v150 * 1.0e-12) >= (float)(v115 + 0.000001))
          {
            v161 = -7;
          }
          else
          {
            if (v112 <= 0x7FFFFFFE)
            {
              v152 = 0;
              v153 = *(float *)(v102 + 68);
              v154 = -*(float *)(v102 + 60);
              v155 = -*(float *)(v102 + 64);
              do
              {
                if ((v152 & 1) != 0)
                  v156 = -1.0;
                else
                  v156 = 1.0;
                v157 = *(float *)(v246 + 4 * v152) + (float)(v154 * v156);
                *(float *)&v100[4 * v152++] = (float)(v153 * v157) / (float)((float)(v155 * v157) + 1.0);
              }
              while (v103 != v152);
            }
            v158 = 0;
            v159 = 0.0;
            do
            {
              v160 = v72[v158 / 4] - *(float *)&v109[v158];
              *(float *)&v109[v158] = v160;
              v159 = v159 + (float)(v160 * v160);
              v158 += 4;
            }
            while (v94 != v158);
            v161 = -8;
            if (fabsf(v159) == INFINITY)
              goto LABEL_155;
            if (v159 >= v95)
              goto LABEL_154;
            v162 = 0;
            v163 = 0.0;
            do
            {
              v163 = v163
                   + (float)(*(float *)(v110 + v162 + 48)
                           * (float)(*(float *)(v84 + v162) + (float)(v106 * *(float *)(v110 + v162 + 48))));
              v162 += 4;
            }
            while (v162 != 12);
            if (v163 > 0.0 && (float)(v95 - v159) > 0.0)
            {
              v164 = 0;
              v165 = (float)((float)((float)(v95 - v159) + (float)(v95 - v159)) / v163) + -1.0;
              v166 = (float)((float)-(float)(v165 * v165) * v165) + 1.0;
              do
              {
                *(_DWORD *)&v69[v164] = *(_DWORD *)(v238 + v164);
                v164 += 4;
              }
              while (v164 != 12);
              v241 = v104;
              v167 = 0;
              do
              {
                *(_DWORD *)&v101[v167] = *(_DWORD *)&v109[v167];
                v167 += 4;
              }
              while (v94 != v167);
              v168 = fmaxf(v166, 0.3333);
              sub_1D3D70C5C(v239, v245, v166, v99, v103, v246);
              sub_1D3D6D028(v245, (uint64_t)v248, v247, v84, v244);
              v102 = v247;
              v101 = v248;
              v103 = v244;
              v111 = 2;
              v95 = v159;
              v112 = v243;
              v100 = v242;
              v104 = v241;
LABEL_152:
              v106 = v106 * v168;
              if (++v104 == 50)
              {
                v161 = 50;
                goto LABEL_155;
              }
              goto LABEL_90;
            }
            if (2 * v111 > v111)
            {
              v168 = (float)v111;
              v169 = *(_DWORD *)(v102 + 52);
              *(_DWORD *)v102 = *(_DWORD *)(v102 + 48);
              *(_DWORD *)(v102 + 16) = v169;
              *(_DWORD *)(v102 + 32) = *(_DWORD *)(v102 + 56);
              v111 *= 2;
              goto LABEL_152;
            }
            v161 = -6;
          }
LABEL_155:
          v170 = *(_DWORD *)(v102 + 52);
          *(_DWORD *)v102 = *(_DWORD *)(v102 + 48);
          *(_DWORD *)(v102 + 16) = v170;
          *(_DWORD *)(v102 + 32) = *(_DWORD *)(v102 + 56);
          v171 = v161;
          free(v101);
          v69 += 12;
          v45 = v234;
          v12 = v235;
          v48 = v232;
          v47 = v233;
          v55 = v231;
          v68 = v237;
          if (v171 < 0)
          {
LABEL_197:
            v8 = 15;
LABEL_198:
            v13 = v229;
            goto LABEL_199;
          }
          goto LABEL_69;
        }
      }
      *v120 = sqrtf(v122);
      v125 = 1;
LABEL_108:
      v126 = &v120[v118 + 1];
      v127 = v119;
      do
      {
        v128 = v121[1];
        ++v121;
        v129 = v128;
        *v126 = v128;
        if (v118)
        {
          v130 = &v126[-v118];
          v99 = -(uint64_t)v118;
          do
          {
            v131 = *v130++;
            v129 = v129 - (float)(v131 * v120[v99]);
            *v126 = v129;
            v124 = __CFADD__(v99++, 1);
          }
          while (!v124);
        }
        *v126 = v129 / *v120;
        v126 += ++v127;
      }
      while (v127 != 3);
      goto LABEL_114;
    }
    v172 = 0;
    v173 = 0;
    v174 = 1;
    v175 = (float *)v47;
    v13 = v229;
    a5 = v227;
    do
    {
      v176 = *v175;
      v177 = v173 + 1;
      v178 = dword_1D3E75E60[v173 + 1];
      v179 = &v45[v172];
      *v179 = 0.0;
      v67.i32[0] = *(_DWORD *)&v48[4 * v173];
      v45[v178] = *(float *)&v48[4 * v173 + 4] - *(float *)v67.i32;
      if (v178 - v172 >= 0)
      {
        v180 = 0;
        v181 = &v236[12 * v173];
        v182 = *(float *)v181;
        v67.i32[0] = *((_DWORD *)v181 + 1);
        v183 = *((float *)v181 + 2);
        do
        {
          if ((v180 & 1) != 0)
            v184 = -1.0;
          else
            v184 = 1.0;
          v179[v180 + 60] = (float)(v179[v180] / (float)(v183 + (float)(*(float *)v67.i32 * v179[v180])))
                          + (float)(v182 * v184);
          ++v180;
        }
        while (v178 - v172 + 1 != v180);
      }
      v185 = (float *)v47 + v172;
      *(float *)&v66 = fabsf(*v185);
      if (*(float *)&v66 > 1.0)
      {
LABEL_205:
        v8 = 13;
        goto LABEL_200;
      }
      if ((v174 & 1) == 0)
      {
        v186 = v172;
        if (v178 >= v172)
        {
          v187 = v178 - v172 + 1;
          v188 = v185;
          do
          {
            v67.i32[0] = *(__int32 *)v188;
            *v188 = v45[190] + *v188;
            ++v188;
            --v187;
          }
          while (v187);
        }
        if (v176 > *((float *)v47 + v186 + 1))
          goto LABEL_205;
        *(float *)&v66 = *v185;
        *v185 = (float)(v176 + *v185) * 0.5;
      }
      v174 = 0;
      v175 = (float *)v47 + v178;
      v172 = v178;
      v173 = 1;
    }
    while (v177 != 2);
    v189 = 0;
    v190 = (_DWORD *)v222;
    do
    {
      *v190 = *(_DWORD *)(v220 + v189 - 360);
      v191 = (_DWORD *)(v220 + v189 - 356);
      LODWORD(v65) = *v191;
      v190[30] = *v191;
      v189 += 8;
      ++v190;
    }
    while (v189 != 240);
    v8 = sub_1D3E3D0D8(v222, v220, v221, v226, v65, v66, v67);
    if (!(_DWORD)v8)
    {
LABEL_200:
      v212 = v224;
      if (!v224)
        goto LABEL_202;
      break;
    }
    if (!v224)
    {
      free(v45);
      return v8;
    }
    v192 = 0;
    v193 = *(float *)v47;
    v194 = 0.0;
    do
    {
      v195 = v228[v192];
      *(_DWORD *)&v224[v192 * 4] = 1;
      v194 = v194 + fabsf((float)(v195 - v193) + -1.0);
      ++v192;
      v193 = v195;
    }
    while (v192 != 3);
    if (v194 >= 2.1)
      goto LABEL_199;
    v196 = 0;
    do
    {
      v197 = &v45[v196 + 63];
      v198 = (int8x16_t)vld1q_dup_f32(v197);
      v252 = vsubq_f32(*(float32x4_t *)&v45[v196 + 64], (float32x4_t)vextq_s8(v198, *(int8x16_t *)&v45[v196 + 64], 0xCuLL));
      if (sub_1D3D7CA88(&v252, (int32x4_t *)&v225[v196 * 4]) >= 4.9)
        goto LABEL_199;
      v196 += 4;
    }
    while ((_DWORD)(v196 * 4) != 96);
    v199 = 0;
    v200 = v45[87];
    v201 = 0.0;
    do
    {
      v202 = v218[v199];
      *(_DWORD *)&v219[v199 * 4] = 1;
      v201 = v201 + fabsf((float)(v202 - v200) + -1.0);
      ++v199;
      v200 = v202;
    }
    while (v199 != 5);
    if (v201 >= 3.5)
      goto LABEL_199;
    v203 = 0;
    do
    {
      v204 = &v45[v203 + 92];
      v205 = (int8x16_t)vld1q_dup_f32(v204);
      v252 = vsubq_f32(*(float32x4_t *)&v45[v203 + 93], (float32x4_t)vextq_s8(v205, *(int8x16_t *)&v45[v203 + 93], 0xCuLL));
      if (sub_1D3D7CA88(&v252, (int32x4_t *)&v223[v203 * 4]) >= 4.9)
        goto LABEL_199;
      v203 += 4;
    }
    while ((_DWORD)(v203 * 4) != 96);
    v206 = 0;
    v207 = v45[116];
    v208 = 0.0;
    do
    {
      v209 = v215[v206];
      *(_DWORD *)&v216[v206 * 4] = 1;
      v208 = v208 + fabsf((float)(v209 - v207) + -1.0);
      ++v206;
      v207 = v209;
    }
    while (v206 != 3);
    if (v208 >= 2.1)
    {
LABEL_199:
      a5 = v227;
      goto LABEL_200;
    }
    v210 = 0;
    *(_DWORD *)v47 = 0;
    v211 = 0.0;
    v212 = v224;
    do
    {
      v211 = v211 + (float)*(int *)&v224[v210 * 4];
      v228[v210++] = v211;
    }
    while (v210 != 59);
    ++v217;
    a5 = v227;
    if (v217 != 4)
      continue;
    break;
  }
  free(v212);
LABEL_202:
  free(v45);
  if ((_DWORD)v8)
    return v8;
LABEL_203:
  v8 = 0;
  *(float *)(a5 + 72) = (float)(v12[1] - *v13) / 3.0;
  *(float *)(a5 + 76) = (float)(v12[29] - v13[28]) / 3.0;
  v213 = *(_DWORD **)(a5 + 64);
  v213[10] = 0;
  v213[11] = v230;
  v213[12] = *(_DWORD *)v13;
  v213[13] = *((_DWORD *)v12 + 29);
  v213[5] = 30;
  return v8;
}

uint64_t sub_1D3E3E334(uint64_t result, int a2, int a3, uint64_t a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t i;
  BOOL v10;
  float v11;
  unint64_t v12;
  unint64_t v13;
  float v14;
  char v15;
  char *v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  signed int v23;
  uint64_t v24;
  signed int v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  float v30;
  float v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  unint64_t v42;
  float v43;
  uint64_t v44;
  float *v45;
  float v46;
  float v47;
  float v48;
  uint64_t v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  int v55;
  int v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  float v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  unsigned int v84;
  uint64_t v85;
  float *v86;
  float v87;
  float v88;
  _DWORD v90[5];
  _DWORD v91[5];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  for (i = 4; i != 76; i += 8)
    *(_DWORD *)(a4 + i) = -1082130432;
  if (a5 >= 0.0)
  {
    v10 = (float)a2 < a6 || (float)(a2 - 1) < a5;
    if (!v10 && a6 >= 0.0)
    {
      v11 = (float)(a6 - a5) / 7.0;
      v12 = 20;
      if (a3)
        v13 = 20;
      else
        v13 = 0;
      if (a3)
        v12 = 30;
      v14 = 1.0 / (float)(a7 + a7);
      v15 = a3;
      v16 = (char *)&unk_1D3E75EC4 + 16 * v13;
      do
      {
        v17 = 0;
        *(float *)v91 = a5;
        v18 = a5;
        do
        {
          v18 = v18 + (float)(*(float *)&v16[v17 * 4] * v11);
          *(float *)&v91[++v17] = v18;
        }
        while (v17 != 4);
        if (result)
        {
          v19 = 0;
          v20 = 0.0;
          v21 = a5;
          do
          {
            v22 = v21;
            v23 = vcvtms_s32_f32(v21);
            v24 = v19 + 1;
            v21 = *(float *)&v91[v19 + 1];
            v25 = vcvtps_s32_f32(v21);
            if (v23 == v25)
            {
              v26 = *(float *)(result + 4 * v23);
              v27 = fmaxf(v26 - a9, 0.0);
              v28 = v26 - a8;
              if (v28 > 0.0)
                v28 = 0.0;
              if ((((_BYTE)v19 + v15) & 1) == 0)
                v28 = v27;
              v20 = v20 + (float)((float)(v21 - v22) * (float)(v14 * (float)(v28 * v28)));
            }
            else if (v23 < v25)
            {
              v29 = 0;
              v30 = (float)(v23 + 1) - v22;
              v31 = (float)(v21 - (float)(int)ceilf(v21)) + 1.0;
              v32 = v19 + v15;
              v33 = v25 - (uint64_t)v23;
              v34 = result + 4 * v23;
              do
              {
                v35 = *(float *)(v34 + 4 * v29);
                if ((v32 & 1) != 0)
                {
                  v36 = fmaxf(v35 - a9, 0.0);
                }
                else
                {
                  v36 = v35 - a8;
                  if (v36 > 0.0)
                    v36 = 0.0;
                }
                v37 = v14 * (float)(v36 * v36);
                if (v33 - 1 == v29)
                  v38 = v31;
                else
                  v38 = 1.0;
                if (!v29)
                  v38 = v30;
                v20 = v20 + (float)(v38 * v37);
                ++v29;
              }
              while (v33 != v29);
            }
            v19 = v24;
          }
          while (v24 != 4);
          v39 = (float)-v20 / (float)(a6 - a5);
        }
        else
        {
          v39 = -100.0;
        }
        v40 = *(float *)(a4 + 36);
        if (v40 == 0.0 || v40 < v39)
        {
          *(float *)(a4 + 36) = v39;
          *(_BYTE *)(a4 + 32) = v13;
        }
        v42 = 0;
        v43 = -(float)(v39 * (float)(*(float *)&v91[4] - a5));
        do
        {
          v44 = 0;
          v45 = (float *)((char *)&unk_1D3E75E84 + 8 * v42);
          v46 = (float)((float)((float)(a6 + (float)(v11 * v45[1])) - a5) + (float)((float)-v11 * *v45)) / 7.0;
          v47 = a5 + (float)(v11 * *v45);
          *(float *)v90 = v47;
          v48 = v47;
          do
          {
            v48 = v48 + (float)(*(float *)&v16[v44 * 4] * v46);
            *(float *)&v90[++v44] = v48;
          }
          while (v44 != 4);
          if (result)
          {
            v49 = 0;
            v50 = v43;
            do
            {
              v51 = *(float *)&v91[v49];
              v52 = *(float *)&v90[v49];
              if (vabds_f32(v51, v52) >= 0.1)
              {
                if (v51 <= v52)
                  v53 = *(float *)&v91[v49];
                else
                  v53 = *(float *)&v90[v49];
                if (v51 <= v52)
                  v54 = *(float *)&v90[v49];
                else
                  v54 = *(float *)&v91[v49];
                v55 = (int)v53;
                v56 = (int)v54;
                if (SLODWORD(v53) == SLODWORD(v54))
                {
                  v57 = *(float *)(result + 4 * v55);
                  v58 = v54 - v53;
                  v59 = fmaxf(v57 - a9, 0.0);
                  v60 = v57 - a8;
                  if (v60 > 0.0)
                    v60 = 0.0;
                  v61 = v58 * (float)(v14 * (float)(v59 * v59));
                  v62 = v58 * (float)(v14 * (float)(v60 * v60));
                }
                else
                {
                  v62 = 0.0;
                  v61 = 0.0;
                  if (v55 <= v56)
                  {
                    v63 = 0;
                    v64 = v56;
                    v65 = v54 - (float)v56;
                    v66 = (float)(v55 + 1) - v53;
                    v67 = v56 - v55 + 1;
                    v68 = v64 - v55;
                    v69 = result + 4 * v55;
                    v62 = 0.0;
                    do
                    {
                      v70 = *(float *)(v69 + 4 * v63);
                      v71 = v70 - a8;
                      if ((float)(v70 - a8) > 0.0)
                        v71 = 0.0;
                      v72 = fmaxf(v70 - a9, 0.0);
                      v73 = v14 * (float)(v72 * v72);
                      v74 = v14 * (float)(v71 * v71);
                      v75 = v65 * v73;
                      v76 = v65 * v74;
                      if (v68 != v63)
                      {
                        v76 = v74;
                        v75 = v73;
                      }
                      v77 = v66 * v73;
                      v78 = v66 * v74;
                      if (v63)
                      {
                        v78 = v76;
                        v77 = v75;
                      }
                      v62 = v62 + v78;
                      v61 = v61 + v77;
                      ++v63;
                    }
                    while (v67 != (_DWORD)v63);
                  }
                }
                if ((v49 & 0x7FFFFFFFFFFFFFFBLL) != 0)
                  v79 = v62;
                else
                  v79 = 0.0;
                v80 = v61 - v79;
                if ((v49 & 0x7FFFFFFFFFFFFFFBLL) == 0)
                  v61 = 0.0;
                v81 = v62 - v61;
                if ((v49 & 1) != 0)
                  v81 = v80;
                if (v51 <= v52)
                  v82 = -v81;
                else
                  v82 = v81;
                v50 = v50 + v82;
              }
              ++v49;
            }
            while (v49 != 5);
            v83 = (float)-v50 / (float)(*(float *)&v90[4] - v47);
          }
          else
          {
            v83 = -100.0;
          }
          if (v42 <= 3)
            v84 = v42;
          else
            v84 = v42 + 1;
          v85 = a4 + 8 * v84;
          v87 = *(float *)(v85 + 4);
          v86 = (float *)(v85 + 4);
          v88 = v87;
          if (v87 == 0.0 || v88 < v83)
          {
            *v86 = v83;
            *(_BYTE *)(a4 + 8 * v84) = v13;
          }
          ++v42;
        }
        while (v42 != 8);
        ++v13;
        v16 += 16;
      }
      while (v13 < v12);
    }
  }
  return result;
}

uint64_t sub_1D3E3E794(uint64_t a1, float *a2, uint64_t a3, float *a4, uint64_t a5)
{
  int v5;
  uint64_t result;
  __n128 v10;
  unsigned __int8 *v11;
  double v12;
  double v13;
  int32x2_t v14;
  void *v15;
  int v16;
  _DWORD *v17;
  uint64_t v18;
  float v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if ((a3 - 25) < 0xFFFFFFFD)
    return 16;
  if (!sub_1D3E3C668(a1, a2, a3, a4, 1))
    return 23;
  *(_QWORD *)(a5 + 8) = 13;
  v10.n128_u64[0] = 0x800000001;
  *(_QWORD *)(a5 + 80) = 0x800000001;
  MEMORY[0x1E0C80A78](v10);
  v11 = (unsigned __int8 *)malloc_type_malloc(*(_QWORD *)(a5 + 8), 0x100004077774924uLL);
  v15 = *(void **)(a5 + 16);
  if (v15)
    free(v15);
  *(_QWORD *)(a5 + 16) = v11;
  v19 = 0.0;
  sub_1D3E3C9D8((uint64_t)v11, dword_1D3E75E6C, (uint64_t)a2, (uint64_t)a4, (uint64_t)&v18, &v19, v12, v13, v14);
  if (v19 < 0.65)
    return 2;
  *(float *)(a5 + 24) = v19;
  v11[4] = 0;
  *(_DWORD *)v11 = 0;
  v16 = v11[12];
  if (v16 != sub_1D3E3D264(v11))
    return 5;
  result = 0;
  *(float *)(a5 + 72) = (float)(a4[1] - *a2) / 3.0;
  *(float *)(a5 + 76) = (float)(a4[21] - a2[20]) / 3.0;
  v17 = *(_DWORD **)(a5 + 64);
  v17[10] = 0;
  v17[11] = v5 - 22;
  v17[12] = *(_DWORD *)a2;
  v17[13] = *((_DWORD *)a4 + 21);
  v17[5] = 22;
  *(_QWORD *)v11 = *(_QWORD *)(v11 + 5);
  *((_DWORD *)v11 + 2) = 0;
  v11[12] = 0;
  return result;
}

uint64_t sub_1D3E3E960(uint64_t a1, float *a2, uint64_t a3, float *a4, uint64_t a5)
{
  int v5;
  uint64_t result;
  __n128 v10;
  char *v11;
  double v12;
  double v13;
  int32x2_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned __int8 v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  char v27;
  char v28;
  _DWORD *v29;
  _BYTE v30[28];
  int v31;
  int v32;
  float v33;
  uint64_t v34;

  v5 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  if ((a3 - 20) < 0xFFFFFFFD)
    return 16;
  if (!sub_1D3E3C668(a1, a2, a3, a4, 2))
    return 23;
  *(_QWORD *)(a5 + 8) = 13;
  v10.n128_u64[0] = 0x700000001;
  *(_QWORD *)(a5 + 80) = 0x700000001;
  MEMORY[0x1E0C80A78](v10);
  v11 = (char *)malloc_type_malloc(*(_QWORD *)(a5 + 8), 0x100004077774924uLL);
  v15 = *(void **)(a5 + 16);
  if (v15)
    free(v15);
  *(_QWORD *)(a5 + 16) = v11;
  v33 = 0.0;
  sub_1D3E3C9D8((uint64_t)v11, dword_1D3E75E78, (uint64_t)a2, (uint64_t)a4, (uint64_t)v30, &v33, v12, v13, v14);
  if (v33 < 0.65)
    return 2;
  v16 = 0;
  v17 = 0;
  *(float *)(a5 + 24) = v33;
  do
  {
    v17 |= v30[v16 + 1] << v16;
    ++v16;
  }
  while (v16 != 6);
  v18 = ((char)v17 - 7);
  if (v18 >= 0x32 || ((0x22C2CD02CD0D1uLL >> v18) & 1) == 0)
    return 4;
  v19 = byte_1D3E76474[v18];
  v20 = byte_1D3E764A6[v18];
  v21 = v11[5];
  v22 = *(_DWORD *)(v11 + 1);
  v23 = v11[6];
  v31 = v21;
  v32 = v20;
  switch(v23)
  {
    case 0:
      *v11 = 0;
      v24 = HIBYTE(v22);
      v11[1] = v20;
      v25 = HIWORD(v22);
      *((_WORD *)v11 + 1) = v22;
      *((_DWORD *)v11 + 1) = 0;
      v11[8] = 0;
      goto LABEL_21;
    case 1:
      *v11 = 0;
      v24 = HIBYTE(v22);
      v11[1] = v20;
      v25 = HIWORD(v22);
      *((_WORD *)v11 + 1) = v22;
      v27 = 1;
      goto LABEL_20;
    case 2:
      *v11 = 0;
      v24 = HIBYTE(v22);
      v11[1] = v20;
      v25 = HIWORD(v22);
      *((_WORD *)v11 + 1) = v22;
      v27 = 2;
LABEL_20:
      v11[4] = v27;
      *(_DWORD *)(v11 + 5) = 0;
LABEL_21:
      v11[9] = v25;
      v11[10] = v24;
      goto LABEL_24;
    case 3:
      *v11 = 0;
      v11[1] = v20;
      *((_WORD *)v11 + 1) = v22;
      v11[4] = BYTE2(v22);
      *(_DWORD *)(v11 + 5) = 0;
      v11[9] = 0;
      v11[10] = HIBYTE(v22);
      goto LABEL_24;
    case 4:
      *v11 = 0;
      v11[1] = v20;
      *(_DWORD *)(v11 + 2) = v22;
      *(_DWORD *)(v11 + 6) = 0;
      v11[10] = 0;
LABEL_24:
      v11[11] = v21;
      goto LABEL_31;
    case 5:
      *v11 = 0;
      v11[1] = v20;
      *(_DWORD *)(v11 + 2) = v22;
      v11[6] = v21;
      *(_DWORD *)(v11 + 7) = 0;
      v28 = 5;
      goto LABEL_30;
    case 6:
      *v11 = 0;
      v11[1] = v20;
      *(_DWORD *)(v11 + 2) = v22;
      v11[6] = v21;
      *(_DWORD *)(v11 + 7) = 0;
      v28 = 6;
      goto LABEL_30;
    case 7:
      *v11 = 0;
      v11[1] = v20;
      *(_DWORD *)(v11 + 2) = v22;
      v11[6] = v21;
      *(_DWORD *)(v11 + 7) = 0;
      v28 = 7;
      goto LABEL_30;
    case 8:
      *v11 = 0;
      v11[1] = v20;
      *(_DWORD *)(v11 + 2) = v22;
      v11[6] = v21;
      *(_DWORD *)(v11 + 7) = 0;
      v28 = 8;
      goto LABEL_30;
    case 9:
      *v11 = 0;
      v11[1] = v20;
      *(_DWORD *)(v11 + 2) = v22;
      v11[6] = v21;
      *(_DWORD *)(v11 + 7) = 0;
      v28 = 9;
LABEL_30:
      v11[11] = v28;
LABEL_31:
      v26 = v19;
      v11[12] = v19;
      break;
    default:
      v26 = v11[12];
      break;
  }
  if (v26 != sub_1D3E3D264((unsigned __int8 *)v11))
    return 5;
  result = 0;
  *(float *)(a5 + 72) = (float)(a4[1] - *a2) / 3.0;
  *(float *)(a5 + 76) = (float)(a4[16] - a2[14]) / 5.0;
  v29 = *(_DWORD **)(a5 + 64);
  v29[10] = 0;
  v29[11] = v5 - 17;
  v29[12] = *(_DWORD *)a2;
  v29[13] = *((_DWORD *)a4 + 16);
  v29[5] = 17;
  *v11 = v32;
  *(_DWORD *)(v11 + 1) = v22;
  v11[5] = v31;
  v11[6] = v23;
  v11[7] = v19;
  *((_DWORD *)v11 + 2) = 0;
  v11[12] = 0;
  return result;
}

uint64_t sub_1D3E3EDE4(uint64_t result, _BYTE *a2, uint64_t a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  _BYTE *v5;
  unint64_t v6;
  int v7;

  v3 = a3 - 1;
  if (*(_QWORD *)(result + 8) < (unint64_t)(a3 - 1))
    v3 = *(_QWORD *)(result + 8);
  if (v3 >= 0xD)
    v3 = 13;
  if (v3)
  {
    v4 = *(unsigned __int8 **)(result + 16);
    v5 = a2;
    v6 = v3;
    do
    {
      v7 = *v4++;
      *v5++ = (v7 - 10 * ((205 * v7) >> 11)) | 0x30;
      --v6;
    }
    while (v6);
  }
  a2[v3] = 0;
  return result;
}

uint64_t sub_1D3E3EE40(uint64_t result, _BYTE *a2, uint64_t a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  _BYTE *v5;
  unint64_t v6;
  int v7;

  v3 = a3 - 1;
  if (*(_QWORD *)(result + 8) < (unint64_t)(a3 - 1))
    v3 = *(_QWORD *)(result + 8);
  if (v3 >= 8)
    v3 = 8;
  if (v3)
  {
    v4 = *(unsigned __int8 **)(result + 16);
    v5 = a2;
    v6 = v3;
    do
    {
      v7 = *v4++;
      *v5++ = (v7 - 10 * ((205 * v7) >> 11)) | 0x30;
      --v6;
    }
    while (v6);
  }
  a2[v3] = 0;
  return result;
}

uint64_t sub_1D3E3EE9C(uint64_t result, _BYTE *a2, uint64_t a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  _BYTE *v5;
  unint64_t v6;
  int v7;

  v3 = a3 - 1;
  if (*(_QWORD *)(result + 8) < (unint64_t)(a3 - 1))
    v3 = *(_QWORD *)(result + 8);
  if (v3 >= 8)
    v3 = 8;
  if (v3)
  {
    v4 = *(unsigned __int8 **)(result + 16);
    v5 = a2;
    v6 = v3;
    do
    {
      v7 = *v4++;
      *v5++ = (v7 - 10 * ((205 * v7) >> 11)) | 0x30;
      --v6;
    }
    while (v6);
  }
  a2[v3] = 0;
  return result;
}

uint64_t sub_1D3E3EEF8(unsigned int a1)
{
  return (a1 < 0x2F) & (0x402040000000uLL >> a1);
}

BOOL sub_1D3E3EF14(int a1)
{
  return a1 == 22;
}

BOOL sub_1D3E3EF20(int a1)
{
  return a1 == 17;
}

void sub_1D3E3EF2C(int a1, void *a2)
{
  free(a2);
}

void sub_1D3E3EF34(int a1, unsigned int a2, unsigned int a3, float *a4, float *a5, float *a6, float *a7, _DWORD *a8, float *a9)
{
  float *v9;
  uint64_t v14;
  float *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float *v20;
  float *v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  float *v27;
  float *v28;
  float v29;
  float *v30;
  float *v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  float v36;
  uint64_t v37;
  float v38;
  uint64_t v39;
  float v40;
  float v41;
  float v42;
  int v43;
  uint64_t v44;
  float v45;
  uint64_t v46;

  v9 = a7;
  v14 = 0;
  v15 = &a7[a3 * a2];
  v16 = a3;
  v46 = a3 * a1;
  v17 = a2;
  v18 = 4 * a2;
  do
  {
    v19 = 0.0;
    v20 = v9;
    v21 = a6;
    v22 = v17;
    do
    {
      v23 = *v20++;
      v24 = v23;
      v25 = *v21++;
      v19 = v19 + (float)(v24 * v25);
      --v22;
    }
    while (v22);
    a4[v14] = 1.0 / (float)(expf(-(float)(v19 + v15[v14])) + 1.0);
    ++v14;
    v9 = (float *)((char *)v9 + v18);
  }
  while (v14 != v16);
  v26 = 0;
  v27 = &v15[v16];
  v28 = &v27[v46];
  do
  {
    v29 = 0.0;
    v30 = v27;
    v31 = a4;
    v32 = v16;
    do
    {
      v33 = *v30++;
      v34 = v33;
      v35 = *v31++;
      v29 = v29 + (float)(v34 * v35);
      --v32;
    }
    while (v32);
    a5[v26] = v29 + v28[v26];
    ++v26;
    v27 += v16;
  }
  while (v26 != a1);
  v36 = *a5;
  v37 = 1;
  v38 = *a5;
  do
  {
    if (a5[v37] > v38)
      v38 = a5[v37];
    ++v37;
  }
  while (a1 != v37);
  v39 = 0;
  v40 = 0.0;
  do
    v40 = v40 + expf(a5[v39++] - v38);
  while (a1 != v39);
  v41 = v38 + logf(v40);
  v42 = expf(v36 - v41);
  v43 = 0;
  *a5 = v42;
  v44 = 1;
  do
  {
    v45 = expf(a5[v44] - v41);
    a5[v44] = v45;
    if (v45 > v42)
    {
      v42 = v45;
      v43 = v44;
    }
    ++v44;
  }
  while (a1 != v44);
  *a8 = v43;
  *a9 = v42;
}

uint64_t sub_1D3E3F110(int *a1, size_t count, uint64_t a3)
{
  uint64_t result;
  int v5;
  uint64_t v7;
  int v8;
  int v9;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if ((int)count < 4)
    return 6;
  v5 = *a1;
  if ((*a1 - 106) < 0xFFFFFFFD || a1[(count - 1)] != 106)
    return 6;
  v7 = 0;
  v8 = count - 2;
  do
  {
    v9 = a1[v7 + 1];
    if (v9 > 102)
      return 5;
    v5 += v9 + v9 * v7++;
  }
  while ((_DWORD)count - 3 != (_DWORD)v7);
  if (v5 % 103 != a1[v8])
    return 5;
  v10 = count;
  *(_QWORD *)(a3 + 8) = count;
  *(_DWORD *)(a3 + 80) = 1;
  *(_DWORD *)(a3 + 84) = v8;
  v11 = *(void **)(a3 + 16);
  if (v11)
    free(v11);
  *(_QWORD *)(a3 + 16) = 0;
  v12 = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
  v13 = 0;
  *(_QWORD *)(a3 + 16) = v12;
  do
  {
    result = 0;
    *(_BYTE *)(*(_QWORD *)(a3 + 16) + v13) = a1[v13];
    ++v13;
  }
  while (v10 != v13);
  return result;
}

uint64_t sub_1D3E3F238(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t *a6, int a7, float32x2_t *a8, uint64_t a9)
{
  uint64_t result;
  float32x2_t v14;
  uint64_t v15;
  __int32 v16;
  float v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x2_t v20;
  float v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  float v25;
  int v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  float32x4_t v33;
  float32x2_t v34;
  float32x4_t v35;
  int32x4_t v36;
  float v37;
  float v38;
  int v39;
  uint64_t i;
  size_t v41;
  int v42;
  int v43;
  uint64_t v44;
  _DWORD *v45;
  int v46;
  uint64_t v47;
  float v48;
  uint64_t v49;
  int v50[128];
  float v51[107];
  float v52[15];
  _BYTE v53[24];
  float v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (a7 < 13)
    return 16;
  *(_DWORD *)(a9 + 24) = 0;
  *(_QWORD *)(a9 + 8) = 0;
  v49 = 0;
  v14 = *a8;
  v15 = *a6;
  v16 = *((_DWORD *)a6 + 2);
  v48 = *((float *)a6 + 3);
  v17 = a8[1].f32[0];
  *(float32x2_t *)v18.f32 = *a8;
  v18.f32[2] = v17;
  v18.i32[3] = HIDWORD(*a6);
  *(float *)&a4 = 1.0 / (float)(v48 - COERCE_FLOAT(*a6));
  v19.i64[0] = *a6;
  v19.i64[1] = __PAIR64__(*a6, v16);
  *(float32x4_t *)v53 = vmulq_n_f32(vsubq_f32(v18, v19), *(float *)&a4);
  v19.i32[0] = v14.i32[1];
  v20.i32[0] = vdup_lane_s32((int32x2_t)v14, 1).u32[0];
  v20.i32[1] = v16;
  v14.i32[1] = HIDWORD(v15);
  *(float32x2_t *)&v53[16] = vmul_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)&a4, 0), vsub_f32(v20, v14));
  v54 = *(float *)&a4 * (float)(v17 - v19.f32[0]);
  sub_1D3E3EF34(107, 7u, 0xFu, v52, v51, (float *)v53, flt_1D3E764D8, (_DWORD *)&v49 + 1, (float *)&v49);
  result = 6;
  if ((HIDWORD(v49) - 106) >= 0xFFFFFFFD)
  {
    v21 = *(float *)&v49;
    if (*(float *)&v49 >= 0.4)
    {
      v46 = a7;
      v47 = a9;
      v50[0] = HIDWORD(v49);
      v22 = a7;
      v23 = 1;
      v24 = 3;
      v25 = *(float *)&v49;
      v26 = -1;
      v27 = -1;
      v28 = v48;
      while (1)
      {
        if (v24 + 3 >= v22 || v23 > 0x7F)
        {
          v42 = v46;
          v43 = v46;
          v41 = v23;
          goto LABEL_26;
        }
        v29 = *((float *)a6 + v24 + 3);
        v30 = 1.0 / (float)(v29 - v28);
        v31 = a8->f32[v24];
        v32 = 4 * v24 + 4;
        *(float32x2_t *)v33.f32 = *(float32x2_t *)((char *)a8 + v32);
        v34 = *(float32x2_t *)((char *)a6 + v32);
        *(float *)v53 = v30 * (float)(v31 - v28);
        *(float *)&v53[4] = v30 * vsub_f32(*(float32x2_t *)v33.f32, v34).f32[0];
        *(float32x2_t *)&v33.u32[2] = v34;
        v35.i64[0] = __PAIR64__(v34.u32[1], LODWORD(v31));
        v35.i64[1] = __PAIR64__(v34.u32[0], LODWORD(v28));
        v36 = (int32x4_t)vmulq_n_f32(vsubq_f32(v33, v35), v30);
        *(int32x4_t *)&v53[8] = vzip2q_s32(vzip1q_s32(v36, (int32x4_t)vextq_s8((int8x16_t)v36, (int8x16_t)v36, 0xCuLL)), v36);
        v54 = v30 * vsub_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.f32, 1), *(float32x2_t *)v33.f32).f32[0];
        sub_1D3E3EF34(107, 7u, 0xFu, v52, v51, (float *)v53, flt_1D3E764D8, (_DWORD *)&v49 + 1, (float *)&v49);
        v37 = *(float *)&v49;
        if (*(float *)&v49 >= 0.4)
        {
          v39 = HIDWORD(v49);
        }
        else
        {
          if (v27 != -1)
            return 13;
          v26 = 0;
          v38 = v51[0];
          v39 = HIDWORD(v49);
          for (i = 1; i != 107; ++i)
          {
            if (HIDWORD(v49) != i && v51[i] > v38)
            {
              v26 = i;
              v38 = v51[i];
            }
          }
          v27 = (float)(*(float *)&v49 - v38) > 0.1 ? -1 : v23;
        }
        v41 = v23 + 1;
        v50[v23] = v39;
        v21 = v21 + v37;
        if (v37 < v25)
          v25 = v37;
        if (v39 == 106)
          break;
        v24 += 3;
        v28 = v29;
        ++v23;
        if (v39 > 102)
          return 6;
      }
      v43 = v24 + 4;
      v42 = v46;
LABEL_26:
      result = sub_1D3E3F110(v50, v41, v47);
      if ((_DWORD)result && v27 != -1)
      {
        v50[v27] = v26;
        result = sub_1D3E3F110(v50, v41, v47);
      }
      if (!(_DWORD)result)
      {
        if ((*(int *)((char *)v50 + ((uint64_t)((v41 << 32) - 0x300000000) >> 30)) - 98) <= 3)
          *(_DWORD *)(v47 + 4) = 4;
        result = 0;
        *(float *)(v47 + 24) = (float)((float)(v21 / (float)(int)v41) * 0.3) + (float)(v25 * 0.7);
        *(float *)(v47 + 72) = (float)(*((float *)a6 + 6) - *(float *)a6) / 22.0;
        v44 = 4 * v43 - 4;
        *(float *)(v47 + 76) = (float)(*(float *)((char *)a6 + v44) - *((float *)a6 + v43 - 7)) / 22.0;
        v45 = *(_DWORD **)(v47 + 64);
        v45[10] = 0;
        v45[11] = v42 - v43;
        v45[12] = *(_DWORD *)a6;
        v45[13] = *(__int32 *)((char *)a8->i32 + v44);
        v45[5] = v43;
      }
    }
  }
  return result;
}

void sub_1D3E3F640(uint64_t a1, _BYTE *a2, uint64_t a3, _QWORD *a4, const char *a5)
{
  uint64_t v5;
  char *v6;
  unsigned int v7;
  _BYTE *v12;
  uint64_t v13;
  char v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  char v21;
  int v22;
  char v23;
  int v24;
  unsigned int v25;
  char v26;
  _BYTE *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char *v34;
  _BYTE *v35;
  char v36;
  NSObject *v37;
  int v38;
  NSObject *v39;
  int v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  uint8_t v44[4];
  int v45;
  _BYTE buf[12];
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 8);
  if ((int)v5 < 4)
    return;
  v6 = *(char **)(a1 + 16);
  v7 = *v6 - 103;
  if (v7 > 2 || v6[(v5 - 1)] != 106)
    return;
  v12 = malloc_type_calloc((2 * v5), 1uLL, 0x100004077774924uLL);
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = -1;
  v19 = -1;
  v20 = -1;
  while (1)
  {
    v21 = v6[v13 + 1];
    if (!v7 && (v16 & 1) == 0 || v7 == 1 && ((v16 ^ 1) & 1) == 0)
    {
      if (v6[v13 + 1] > 0x3Fu)
      {
        if ((v21 & 0xE0) != 0x40)
        {
          v22 = 0;
          v16 = 0;
          switch(v6[v13 + 1])
          {
            case 'a':
              goto LABEL_15;
            case 'b':
              goto LABEL_33;
            case 'c':
              goto LABEL_39;
            case 'd':
              v22 = 0;
              v16 = 0;
              v7 = 1;
              break;
            case 'e':
              v22 = 0;
              v16 = 0;
              if (v6[v13] == 101)
                v19 = v17;
              else
                v20 = v17;
              if (v6[v13] == 101)
              {
                v18 = v17 - 1;
                v15 ^= 1u;
              }
              break;
            case 'f':
              goto LABEL_40;
            default:
              goto LABEL_38;
          }
          goto LABEL_15;
        }
        v22 = 0;
        v16 = 0;
        v23 = v21 - 64;
        goto LABEL_13;
      }
LABEL_10:
      v22 = 0;
      v16 = 0;
      v23 = v21 + 32;
LABEL_13:
      v12[v17] = v23;
LABEL_14:
      ++v17;
      goto LABEL_15;
    }
    if (!((v7 != 1) | v16 & 1) || !((v7 != 0) | (v16 ^ 1) & 1))
      break;
    if (v7 != 2)
      goto LABEL_56;
    v25 = v6[v13 + 1];
    if (v25 <= 0x63)
    {
      v26 = v6[v13 + 1] / 0xAu;
      v27 = &v12[v17];
      *v27 = v26 + 48;
      v17 += 2;
      v27[1] = (v21 - 10 * v26) | 0x30;
LABEL_28:
      v7 = 2;
      goto LABEL_21;
    }
    if (v25 == 100)
    {
      v7 = 1;
      goto LABEL_21;
    }
    if (v25 == 102)
    {
      if (v13 >= 2)
      {
        v12[v17] = 29;
        v7 = 2;
        ++v17;
        goto LABEL_21;
      }
      goto LABEL_28;
    }
    if (v25 != 101)
      goto LABEL_56;
    v7 = 0;
LABEL_21:
    if ((v5 - 2) - 1 == ++v13)
    {
      if ((v14 & 1) != 0)
      {
        if (a5)
          v28 = a5;
        else
          v28 = "ISO-8859-1";
        v29 = MEMORY[0x1D8255020]("UTF-8", v28, v16);
        if (v29 == -1)
        {
          if (qword_1EFE31880 != -1)
            dispatch_once(&qword_1EFE31880, &unk_1E95B3648);
          v37 = qword_1EFE31878;
          if (os_log_type_enabled((os_log_t)qword_1EFE31878, OS_LOG_TYPE_ERROR))
          {
            v38 = *__error();
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "UTF-8";
            v47 = 2082;
            v48 = v28;
            v49 = 1026;
            v50 = v38;
            _os_log_error_impl(&dword_1D3D6B000, v37, OS_LOG_TYPE_ERROR, "[Code128] iconv_open(\"%{public}s\", \"%{public}s\") failed: %{public, errno}d", buf, 0x1Cu);
          }
        }
        else
        {
          v30 = v29;
          *(_QWORD *)buf = v17;
          v42 = a2;
          v43 = a3;
          v41 = v12;
          if (MEMORY[0x1D8255008](v29, &v41, buf, &v42, &v43) == -1)
          {
            if (qword_1EFE31880 != -1)
              dispatch_once(&qword_1EFE31880, &unk_1E95B3648);
            v39 = qword_1EFE31878;
            if (os_log_type_enabled((os_log_t)qword_1EFE31878, OS_LOG_TYPE_ERROR))
            {
              v40 = *__error();
              *(_DWORD *)v44 = 67240192;
              v45 = v40;
              _os_log_error_impl(&dword_1D3D6B000, v39, OS_LOG_TYPE_ERROR, "[Code128] iconv failed: %{public, errno}d", v44, 8u);
            }
            MEMORY[0x1D8255014](v30);
          }
          else
          {
            MEMORY[0x1D8255014](v30);
            if (v43)
            {
              v31 = a3 - v43;
              *a4 = a3 - v43;
              a2[v31] = 0;
            }
          }
        }
      }
      else
      {
        v32 = v17;
        if (a3 - 1 < (unint64_t)v17)
          v32 = a3 - 1;
        if (v32 >= 1)
        {
          v33 = v32;
          v34 = v12;
          v35 = a2;
          do
          {
            v36 = *v34++;
            *v35++ = v36;
            --v33;
          }
          while (v33);
        }
        a2[v32] = 0;
        *a4 = v32;
      }
      goto LABEL_81;
    }
  }
  if (v6[v13 + 1] <= 0x5Fu)
    goto LABEL_10;
  v22 = 0;
  v16 = 0;
  switch(v6[v13 + 1])
  {
    case 'a':
      break;
    case 'b':
LABEL_33:
      v22 = 0;
      v16 = 1;
      break;
    case 'c':
LABEL_39:
      v22 = 0;
      v16 = 0;
      v7 = 2;
      break;
    case 'd':
      v22 = 0;
      v16 = 0;
      if (v6[v13] == 100)
      {
        v15 ^= 1u;
        v18 = v17 - 1;
        v19 = v17;
      }
      else
      {
        v20 = v17;
      }
      break;
    case 'e':
      v7 = 0;
      goto LABEL_53;
    case 'f':
LABEL_40:
      if (v13 >= 2)
      {
        v22 = 0;
        v16 = 0;
        v12[v17] = 29;
        goto LABEL_14;
      }
LABEL_53:
      v22 = 0;
      v16 = 0;
      break;
    default:
LABEL_38:
      v16 = 0;
      v22 = 7;
      break;
  }
LABEL_15:
  v24 = v17 - 1;
  if (v20 == v17 - 1 && v19 < v24)
  {
    v12[v20] ^= 0x80u;
    v14 = 1;
    v19 = v20;
  }
  if ((v15 & (v18 < v24)) != 0)
  {
    v12[v24] ^= 0x80u;
    v15 = 1;
    v18 = v17 - 1;
    v14 = 1;
  }
  if (!v22)
    goto LABEL_21;
LABEL_56:
  if (a3)
    *a2 = 0;
LABEL_81:
  free(v12);
}

BOOL sub_1D3E3FC38(int a1)
{
  return a1 > 12 && a1 % 3 == 1;
}

float sub_1D3E3FC68(uint64_t a1, uint64_t a2, int a3, float *a4)
{
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  float result;

  v4 = 4 * a3;
  v5 = v4 + 16;
  v6 = *(float *)(a1 + v4);
  v7 = 1.0 / (float)(*(float *)(a2 + v4 + 16) - v6);
  *a4 = v7 * (float)(*(float *)(a2 + v4) - v6);
  v8 = v4 + 4;
  a4[1] = v7 * (float)(*(float *)(a2 + v4 + 4) - *(float *)(a1 + v4 + 4));
  v9 = v4 + 8;
  a4[2] = v7 * (float)(*(float *)(a2 + v4 + 8) - *(float *)(a1 + v4 + 8));
  v4 += 12;
  a4[3] = v7 * (float)(*(float *)(a2 + v4) - *(float *)(a1 + v4));
  a4[4] = v7 * (float)(*(float *)(a2 + v5) - *(float *)(a1 + v5));
  a4[5] = v7 * (float)(*(float *)(a1 + v8) - *(float *)(a1 + 4 * a3));
  a4[6] = v7 * (float)(*(float *)(a2 + v8) - *(float *)(a2 + 4 * a3));
  a4[7] = v7 * (float)(*(float *)(a1 + v9) - *(float *)(a1 + v8));
  a4[8] = v7 * (float)(*(float *)(a2 + v9) - *(float *)(a2 + v8));
  a4[9] = v7 * (float)(*(float *)(a1 + v4) - *(float *)(a1 + v9));
  a4[10] = v7 * (float)(*(float *)(a2 + v4) - *(float *)(a2 + v9));
  a4[11] = v7 * (float)(*(float *)(a1 + v5) - *(float *)(a1 + v4));
  result = v7 * (float)(*(float *)(a2 + v5) - *(float *)(a2 + v4));
  a4[12] = result;
  return result;
}

uint64_t sub_1D3E3FD94(uint64_t a1, float *a2, int a3, float *a4, uint64_t a5, int a6, int a7)
{
  char v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int *v13;
  unsigned int *v14;
  int v15;
  uint64_t v16;
  float v17;
  float v18;
  uint64_t v19;
  float v20;
  BOOL v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  unsigned int *v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  char v32;
  int v33;
  int v34;
  uint64_t v35;
  int *v36;
  int v37;
  uint64_t v38;
  void *v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v46;
  float v48;
  float v49[44];
  float v50[20];
  float v51[13];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (a3 < 20)
    v8 = a7;
  else
    v8 = 0;
  v9 = 16;
  if (a3 < 15 || (v8 & 1) != 0)
    return v9;
  v10 = a3 / 5u;
  if (a3 % 5u)
    return 2;
  v13 = (unsigned int *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  v48 = 0.0;
  sub_1D3E3FC68((uint64_t)a2, (uint64_t)a4, 5 * (v10 - 1), v51);
  v46 = v10 - 1;
  v14 = &v13[v10 - 1];
  sub_1D3E3EF34(44, 0xDu, 0x14u, v50, v49, v51, flt_1D3E78178, v14, &v48);
  if (*v14 != 43)
    goto LABEL_89;
  v15 = 0;
  v16 = 0;
  v17 = v48 + 0.0;
  v18 = fminf(v48, INFINITY);
  v19 = v10 - 1;
  do
  {
    sub_1D3E3FC68((uint64_t)a2, (uint64_t)a4, v15, v51);
    sub_1D3E3EF34(44, 0xDu, 0x14u, v50, v49, v51, flt_1D3E78178, &v13[v16], &v48);
    if (!(v16 * 4) && *v13 != 43)
      goto LABEL_89;
    v17 = v17 + v48;
    if (v48 < v18)
      v18 = v48;
    ++v16;
    v15 += 5;
    --v19;
  }
  while (v19);
  v20 = (float)((float)(v17 / (float)(int)v10) * 0.2) + (float)(v18 * 0.8);
  *(float *)(a5 + 24) = v20;
  v21 = v20 > 0.65 && a3 > 0x1D;
  if (!v21 && v20 <= 0.85 || *v13 != 43 || v13[v46] != 43)
  {
LABEL_89:
    *(_DWORD *)(a5 + 24) = 0;
    *(_QWORD *)(a5 + 8) = 0;
    v9 = 6;
    goto LABEL_90;
  }
  v22 = malloc_type_malloc(v10, 0x100004077774924uLL);
  v23 = v10 - 2;
  if (a7)
    v24 = v23;
  else
    v24 = v46;
  if ((int)v24 < 2)
  {
    v26 = 0;
    v33 = 0;
    v29 = a5;
    if ((a7 & 1) != 0)
      goto LABEL_80;
    goto LABEL_81;
  }
  v25 = 0;
  v26 = 0;
  v27 = v24 - 1;
  v28 = v13 + 1;
  v29 = a5;
  while (2)
  {
    v31 = *v28++;
    v30 = v31;
    switch(v25)
    {
      case 0u:
        if (v30 - 39 > 3)
        {
          if (v30 <= 9)
          {
            v25 = 0;
            v32 = v30 + 48;
            goto LABEL_56;
          }
          if (v30 - 10 <= 0x19)
          {
            v25 = 0;
            v32 = v30 + 55;
            goto LABEL_56;
          }
          switch(v30)
          {
            case '&':
              v25 = 0;
              v22[v26] = 32;
              break;
            case '%':
              v25 = 0;
              v22[v26] = 46;
              break;
            case '$':
              v25 = 0;
              v22[v26] = 45;
              break;
            default:
              goto LABEL_88;
          }
        }
        else
        {
          if (a6)
          {
            v25 = v30 - 38;
            goto LABEL_58;
          }
          if (v30 == 41)
          {
            v25 = 0;
            v22[v26] = 43;
          }
          else if (v30 == 40)
          {
            v25 = 0;
            v22[v26] = 47;
          }
          else
          {
            v25 = 0;
            if (v30 == 39)
              v22[v26] = 36;
            else
              v22[v26] = 37;
          }
        }
        goto LABEL_57;
      case 1u:
        if (v30 - 10 > 0x19)
          goto LABEL_88;
        v25 = 0;
        v32 = v30 - 9;
        goto LABEL_56;
      case 2u:
        if (v30 - 10 <= 4)
        {
          v25 = 0;
          v32 = v30 + 17;
LABEL_56:
          v22[v26] = v32;
          goto LABEL_57;
        }
        if (v30 - 15 <= 4)
        {
          v25 = 0;
          v32 = v30 + 44;
          goto LABEL_56;
        }
        if (v30 - 20 <= 4)
        {
          v25 = 0;
          v32 = v30 + 71;
          goto LABEL_56;
        }
        if (v30 - 25 <= 4)
        {
          v25 = 0;
          v32 = v30 + 98;
          goto LABEL_56;
        }
        switch(v30)
        {
          case 0x20u:
            v25 = 0;
            v22[v26] = 96;
            break;
          case 0x1Fu:
            v25 = 0;
            v22[v26] = 64;
            break;
          case 0x1Eu:
            v25 = 0;
            v22[v26] = 0;
            break;
          default:
            if (v30 - 33 > 2)
              goto LABEL_88;
            v25 = 0;
            v22[v26] = 127;
            break;
        }
LABEL_57:
        ++v26;
LABEL_58:
        if (--v27)
          continue;
        if ((a7 & 1) != 0)
        {
          v34 = 0;
          v35 = v23 - 1;
          v36 = (int *)(v13 + 1);
          do
          {
            v37 = *v36++;
            v34 += v37;
            --v35;
          }
          while (v35);
          v33 = v34 % 43;
LABEL_80:
          if (v33 != v13[(int)v24])
          {
LABEL_88:
            *(_DWORD *)(v29 + 24) = 0;
            *(_QWORD *)(v29 + 8) = 0;
            free(v22);
            goto LABEL_89;
          }
        }
LABEL_81:
        v38 = v26;
        *(_QWORD *)(v29 + 8) = v26;
        *(_DWORD *)(v29 + 80) = 1;
        *(_DWORD *)(v29 + 84) = v26;
        v39 = *(void **)(v29 + 16);
        if (v39)
          free(v39);
        *(_QWORD *)(v29 + 16) = 0;
        v40 = malloc_type_malloc((int)v38 + 1, 0x100004077774924uLL);
        *(_QWORD *)(v29 + 16) = v40;
        if ((int)v38 >= 1)
        {
          v41 = 0;
          do
          {
            *(_BYTE *)(*(_QWORD *)(v29 + 16) + v41) = v22[v41];
            ++v41;
          }
          while (v38 != v41);
          v40 = *(_BYTE **)(v29 + 16);
        }
        v40[v38] = 0;
        free(v22);
        v9 = 0;
        *(float *)(v29 + 72) = (float)((float)((float)((float)(*a4 - *a2) + (float)(a2[2] - a2[1]))
                                             + (float)(a2[3] - a4[2]))
                                     + (float)(a4[4] - a4[3]))
                             / 6.0;
        *(float *)(v29 + 76) = (float)((float)((float)((float)(a4[a3 - 5] - a2[a3 - 5])
                                                     + (float)(a2[a3 - 3] - a2[a3 - 4]))
                                             + (float)(a2[a3 - 2] - a4[a3 - 3]))
                                     + (float)(a4[a3 - 1] - a4[a3 - 2]))
                             / 6.0;
        v42 = *(_QWORD *)(v29 + 64);
        *(_QWORD *)(v42 + 40) = 0;
        *(float *)(v42 + 48) = *a2;
        *(float *)(v42 + 52) = a4[a3 - 1];
        *(_DWORD *)(v42 + 20) = a3;
LABEL_90:
        free(v13);
        return v9;
      case 3u:
        if (v30 - 10 > 0x19)
          goto LABEL_88;
        v25 = 0;
        v32 = v30 + 23;
        goto LABEL_56;
      case 4u:
        if (v30 - 10 > 0x19)
          goto LABEL_88;
        v25 = 0;
        v32 = v30 + 87;
        goto LABEL_56;
      default:
        goto LABEL_88;
    }
  }
}

uint64_t sub_1D3E4040C(uint64_t a1, float *a2, int a3, float *a4, uint64_t a5)
{
  return sub_1D3E3FD94(a1, a2, a3, a4, a5, 0, 0);
}

uint64_t sub_1D3E40418(uint64_t a1, float *a2, int a3, float *a4, uint64_t a5)
{
  return sub_1D3E3FD94(a1, a2, a3, a4, a5, 1, 0);
}

uint64_t sub_1D3E40424(uint64_t a1, float *a2, int a3, float *a4, uint64_t a5)
{
  return sub_1D3E3FD94(a1, a2, a3, a4, a5, 0, 1);
}

uint64_t sub_1D3E40430(uint64_t a1, float *a2, int a3, float *a4, uint64_t a5)
{
  return sub_1D3E3FD94(a1, a2, a3, a4, a5, 1, 1);
}

uint64_t sub_1D3E4043C(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;

  v3 = a3 - 1;
  v4 = *(_QWORD *)(result + 8);
  if (v4)
    v5 = a3 == 1;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = 0;
    do
    {
      *(_BYTE *)(a2 + v6) = *(_BYTE *)(*(_QWORD *)(result + 16) + v6);
      ++v6;
      v4 = *(_QWORD *)(result + 8);
    }
    while (v4 > v6 && v3 > v6);
  }
  if (v4 < v3)
    v3 = v4;
  *(_BYTE *)(a2 + v3) = 0;
  return result;
}

BOOL sub_1D3E40484(int a1)
{
  return a1 > 14 && (-858993459 * a1 + 429496729) < 0x33333333;
}

BOOL sub_1D3E404AC(int a1)
{
  return a1 > 19 && (-858993459 * a1 + 429496729) < 0x33333333;
}

float sub_1D3E404D4(uint64_t a1, uint64_t a2, int a3, float *a4)
{
  float *v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  float result;

  v4 = (float *)(a1 + 4 * a3);
  v5 = 4 * a3;
  v6 = 1.0 / (float)(v4[3] - *v4);
  *a4 = v6 * (float)(*(float *)(a2 + v5) - *v4);
  v7 = v5 + 4;
  a4[1] = v6 * (float)(*(float *)(a2 + v5 + 4) - *(float *)(a1 + v5 + 4));
  v5 += 8;
  a4[2] = v6 * (float)(*(float *)(a2 + v5) - *(float *)(a1 + v5));
  a4[3] = v6 * (float)(*(float *)(a1 + v7) - *v4);
  a4[4] = v6 * (float)(*(float *)(a2 + v7) - *(float *)(a2 + 4 * a3));
  a4[5] = v6 * (float)(*(float *)(a1 + v5) - *(float *)(a1 + v7));
  result = v6 * (float)(*(float *)(a2 + v5) - *(float *)(a2 + v7));
  a4[6] = result;
  return result;
}

uint64_t sub_1D3E40584(uint64_t a1, float *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  unint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int *v12;
  int v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  _BYTE *v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  char v26;
  unint64_t v27;
  int32x2_t v28;
  int32x2_t v29;
  int8x8_t v30;
  int32x2_t v31;
  const float *v32;
  int32x2_t v33;
  void *v35;
  _BYTE *v36;
  uint64_t i;
  uint64_t v38;
  unsigned int v40;
  size_t v41;
  float v43;
  float v44[48];
  float v45[15];
  float v46[7];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a3 < 16)
    return 16;
  if ((-1431655765 * a3 + 1431655765) > 0x55555554)
    return 2;
  v40 = a3 - 1;
  v9 = (a3 - 1) / 3uLL;
  v10 = (unsigned int *)malloc_type_malloc(4 * v9, 0x100004052888210uLL);
  v43 = 0.0;
  v41 = v9;
  v11 = (v9 - 1);
  sub_1D3E404D4((uint64_t)a2, a4, 3 * v11, v46);
  v12 = &v10[v11];
  sub_1D3E3EF34(48, 7u, 0xFu, v45, v44, v46, flt_1D3E79448, v12, &v43);
  if (*v12 != 47)
  {
LABEL_56:
    *(_DWORD *)(a5 + 24) = 0;
    *(_QWORD *)(a5 + 8) = 0;
    v6 = 6;
    goto LABEL_72;
  }
  v13 = 0;
  v14 = 0;
  v15 = v43 + 0.0;
  v16 = fminf(v43, INFINITY);
  do
  {
    sub_1D3E404D4((uint64_t)a2, a4, v13, v46);
    sub_1D3E3EF34(48, 7u, 0xFu, v45, v44, v46, flt_1D3E79448, &v10[v14], &v43);
    if (!(v14 * 4) && *v10 != 47)
      goto LABEL_56;
    v15 = v15 + v43;
    if (v43 < v16)
      v16 = v43;
    ++v14;
    v13 += 3;
    --v11;
  }
  while (v11);
  v17 = (float)((float)(v15 / (float)(int)v41) * 0.3) + (float)(v16 * 0.7);
  *(float *)(a5 + 24) = v17;
  if (*v10 != 47 || *v12 != 47)
  {
    v6 = 6;
LABEL_71:
    *(float *)(a5 + 24) = v17 / 100.0;
    goto LABEL_72;
  }
  v18 = malloc_type_malloc(v41, 0x100004077774924uLL);
  v19 = 0;
  v20 = 0;
  v21 = (v41 - 3);
  v22 = v21 - 1;
  v23 = v10 + 1;
  while (2)
  {
    v25 = *v23++;
    v24 = v25;
    switch(v19)
    {
      case 0u:
        if (v24 - 43 <= 3)
        {
          v19 = v24 - 42;
          goto LABEL_39;
        }
        if (v24 > 9)
        {
          if (v24 - 10 > 0x19)
          {
            switch(v24)
            {
              case '$':
                v19 = 0;
                v18[v20] = 45;
                goto LABEL_38;
              case '%':
                v19 = 0;
                v18[v20] = 46;
                goto LABEL_38;
              case '&':
                v19 = 0;
                v18[v20] = 32;
                goto LABEL_38;
              case '\'':
                v19 = 0;
                v18[v20] = 36;
                goto LABEL_38;
              case '(':
                v19 = 0;
                v18[v20] = 47;
                goto LABEL_38;
              case ')':
                v19 = 0;
                v18[v20] = 43;
                goto LABEL_38;
              case '*':
                v19 = 0;
                v18[v20] = 37;
                goto LABEL_38;
              default:
                goto LABEL_68;
            }
          }
          v19 = 0;
          v26 = v24 + 55;
        }
        else
        {
          v19 = 0;
          v26 = v24 + 48;
        }
        goto LABEL_37;
      case 1u:
        if (v24 - 10 > 0x19)
          goto LABEL_68;
        v19 = 0;
        v26 = v24 - 9;
        goto LABEL_37;
      case 2u:
        if (v24 - 10 <= 4)
        {
          v19 = 0;
          v26 = v24 + 17;
LABEL_37:
          v18[v20] = v26;
          goto LABEL_38;
        }
        if (v24 - 15 <= 4)
        {
          v19 = 0;
          v26 = v24 + 44;
          goto LABEL_37;
        }
        if (v24 - 20 <= 4)
        {
          v19 = 0;
          v26 = v24 + 71;
          goto LABEL_37;
        }
        if (v24 - 25 <= 4)
        {
          v19 = 0;
          v26 = v24 + 98;
          goto LABEL_37;
        }
        switch(v24)
        {
          case 0x20u:
            v19 = 0;
            v18[v20] = 96;
            break;
          case 0x1Fu:
            v19 = 0;
            v18[v20] = 64;
            break;
          case 0x1Eu:
            v19 = 0;
            v18[v20] = 0;
            break;
          default:
            if (v24 - 33 > 2)
            {
LABEL_68:
              v6 = 7;
LABEL_70:
              *(_QWORD *)(a5 + 8) = 0;
              free(v18);
              v17 = *(float *)(a5 + 24);
              goto LABEL_71;
            }
            v19 = 0;
            v18[v20] = 127;
            break;
        }
LABEL_38:
        ++v20;
LABEL_39:
        if (--v22)
          continue;
        v27 = (v41 - 4);
        v28 = (int32x2_t)1;
        v29 = 0;
        do
        {
          v30 = (int8x8_t)vadd_s32(v28, (int32x2_t)0x100000001);
          v31 = vcgt_s32(v28, (int32x2_t)0x130000000ELL);
          v32 = (const float *)&v10[v27];
          v28 = vsub_s32((int32x2_t)vbic_s8(v30, (int8x8_t)v31), v31);
          v33 = (int32x2_t)vld1_dup_f32(v32);
          v29 = vmla_s32(v29, v33, v28);
        }
        while (v27-- > 1);
        if (v29.i32[1] % 47 != v10[v21] || (v29.i32[0] + v29.i32[1] % 47) % 47 != v10[(v41 - 2)])
        {
          v6 = 5;
          goto LABEL_70;
        }
        *(_QWORD *)(a5 + 8) = v20;
        v35 = *(void **)(a5 + 16);
        if (v35)
          free(v35);
        *(_QWORD *)(a5 + 16) = 0;
        v36 = malloc_type_malloc(v20 + 1, 0x100004077774924uLL);
        *(_QWORD *)(a5 + 16) = v36;
        if (v20 >= 1)
        {
          for (i = 0; i != v20; ++i)
            *(_BYTE *)(*(_QWORD *)(a5 + 16) + i) = v18[i];
          v36 = *(_BYTE **)(a5 + 16);
        }
        v36[v20] = 0;
        *(_DWORD *)(a5 + 80) = 1;
        *(_DWORD *)(a5 + 84) = v41;
        free(v18);
        v6 = 0;
        *(float *)(a5 + 72) = (float)(a2[6] - *a2) / 18.0;
        *(float *)(a5 + 76) = (float)(a2[v40] - a2[a3 - 7]) / 18.0;
        v38 = *(_QWORD *)(a5 + 64);
        *(_QWORD *)(v38 + 40) = 0;
        *(float *)(v38 + 48) = *a2;
        *(_DWORD *)(v38 + 52) = *(_DWORD *)(a4 + 4 * v40);
        *(_DWORD *)(v38 + 20) = a3;
LABEL_72:
        free(v10);
        return v6;
      case 3u:
        if (v24 - 10 > 0x19)
          goto LABEL_68;
        v19 = 0;
        v26 = v24 + 23;
        goto LABEL_37;
      case 4u:
        if (v24 - 10 > 0x19)
          goto LABEL_68;
        v19 = 0;
        v26 = v24 + 87;
        goto LABEL_37;
      default:
        goto LABEL_68;
    }
  }
}

uint64_t sub_1D3E40BB0(uint64_t result, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(result + 8);
  if (v4 >= a3 - 1)
    v4 = a3 - 1;
  if (v4)
  {
    v5 = 0;
    do
    {
      *(_BYTE *)(a2 + v5) = *(_BYTE *)(*(_QWORD *)(result + 16) + v5);
      ++v5;
      v6 = *(_QWORD *)(result + 8);
      if (v6 >= a3 - 1)
        v6 = a3 - 1;
    }
    while (v6 > v5);
  }
  else
  {
    v6 = 0;
  }
  *a4 = v6;
  *(_BYTE *)(a2 + v6) = 0;
  return result;
}

BOOL sub_1D3E40C00(int a1)
{
  return a1 > 15 && a1 % 3 == 1;
}

_QWORD *sub_1D3E40C30(_QWORD *a1)
{
  *a1 = &off_1E95AF018;
  sub_1D3D96F10((uint64_t)(a1 + 1));
  return a1;
}

void sub_1D3E40C60(_QWORD *a1)
{
  *a1 = &off_1E95AF018;
  sub_1D3D96F10((uint64_t)(a1 + 1));
  JUMPOUT(0x1D8254C54);
}

uint64_t sub_1D3E40CA0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));
}

uint64_t sub_1D3E40CB0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
}

BOOL sub_1D3E40CC0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, int a5)
{
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unsigned int v21;
  unsigned int v22;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v10 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));
  if (v10 < 3)
    return 0;
  LODWORD(v12) = v10;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v13 = (unsigned __int8 *)(*(uint64_t (**)(_QWORD, uint64_t, void **, _QWORD))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), a2, &v27, 0);
  if (a5)
  {
    if ((int)a2 < 1)
    {
      v14 = 0;
      v15 = 1;
    }
    else
    {
      v14 = (*(uint64_t (**)(_QWORD, _QWORD, void **, _QWORD))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), (a2 - 1), &v24, 0);
      v15 = 2;
    }
    if ((int)a2 + 1 >= (*(int (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8)))
    {
      v16 = 0;
    }
    else
    {
      v16 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8));
      ++v15;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
    v15 = 1;
  }
  v12 = v12;
  v17 = (_BYTE *)*a4;
  v18 = a4[1] - *a4;
  if (v12 <= v18)
  {
    if (v12 < v18)
      a4[1] = (unint64_t)&v17[v12];
  }
  else
  {
    sub_1D3E3AF38(a4, v12 - v18);
    v17 = (_BYTE *)*a4;
  }
  v19 = (unsigned __int8 *)v14;
  v20 = (unsigned __int8 *)v16;
  do
  {
    v22 = *v13++;
    v21 = v22;
    if (v14)
      v21 += *v19;
    if (v16)
      v21 += *v20;
    *v17++ = v21 / v15;
    ++v20;
    ++v19;
    --v12;
  }
  while (v12);
  v11 = sub_1D3E41A30((unsigned __int8 **)a4, a3);
  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
  return v11;
}

void sub_1D3E40EA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

BOOL sub_1D3E40EE8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, int a5)
{
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  unint64_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v10 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
  if (v10 < 3)
    return 0;
  LODWORD(v12) = v10;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  (*(void (**)(_QWORD, uint64_t, void **))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8), a2, &v26);
  v13 = (unsigned __int8 *)v26;
  if (a5)
  {
    if ((int)a2 < 1)
    {
      v15 = 0;
      v14 = 1;
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, void **))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8), (a2 - 1), &v23);
      v14 = 2;
      v15 = (unsigned __int8 *)v23;
    }
    if ((int)a2 + 1 < (*(int (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8)))
    {
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8));
      ++v14;
    }
  }
  else
  {
    v15 = 0;
    v14 = 1;
  }
  v12 = v12;
  v16 = (_BYTE *)*a4;
  v17 = a4[1] - *a4;
  if (v12 <= v17)
  {
    if (v12 < v17)
      a4[1] = (unint64_t)&v16[v12];
  }
  else
  {
    sub_1D3E3AF38(a4, v12 - v17);
    v16 = (_BYTE *)*a4;
  }
  v18 = v15;
  v19 = 0;
  do
  {
    v21 = *v13++;
    v20 = v21;
    if (v15)
      v20 += *v18;
    *v16++ = v20 / v14;
    ++v19;
    ++v18;
    --v12;
  }
  while (v12);
  v11 = sub_1D3E41A30((unsigned __int8 **)a4, a3);
  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }
  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }
  return v11;
}

void sub_1D3E410C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

BOOL sub_1D3E41104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), a4, a2);
  return *(_DWORD *)(a4 + 8) - *(_DWORD *)a4 >= 3 && sub_1D3E41A30((unsigned __int8 **)a4, a3);
}

BOOL sub_1D3E41168(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v6;
  _BOOL8 v7;
  unsigned int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  BOOL v17;
  unint64_t v18;
  _WORD *v19;
  _WORD *v20;
  _WORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _WORD *v29;
  uint64_t v30;
  __int16 v31;
  unsigned __int8 *v32;
  unsigned __int8 *v33;
  __int16 v34;
  int v35;
  int v36;
  int v37;
  _BOOL4 v38;
  __int16 v39;
  unint64_t v40;
  _WORD *v41;
  _WORD *v42;
  _WORD *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _WORD *v50;
  __int16 v51;
  int v52;
  unint64_t v53;
  _WORD *v54;
  __int16 v55;
  _WORD *v56;
  _WORD *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _WORD *v64;
  __int16 v65;
  __int16 v66;
  _WORD *v67;
  _WORD *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _WORD *v75;
  uint64_t v76;
  __int16 v77;
  unint64_t v78;
  _WORD *v79;
  _WORD *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _WORD *v87;
  uint64_t v88;
  __int16 v89;
  _OWORD v91[8];
  void *v92;
  void *v93;
  uint64_t v94;

  v6 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));
  if (v6 < 3)
    return 0;
  v8 = v6;
  a3[1] = *a3;
  v92 = 0;
  v93 = 0;
  v94 = 0;
  v9 = (*(uint64_t (**)(_QWORD, uint64_t, void **, _QWORD))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), a2, &v92, 0);
  v10 = (unsigned __int8 *)v9;
  v11 = 0;
  v12 = v8;
  memset(v91, 0, sizeof(v91));
  do
  {
    v13 = ((unint64_t)*(unsigned __int8 *)(v9 + v11) >> 1) & 0x7C;
    ++*(_DWORD *)((char *)v91 + v13);
    ++v11;
  }
  while (v8 != v11);
  v14 = sub_1D3E41944((char *)v91);
  v7 = v14 > 0;
  if (v14 > 0)
  {
    v15 = v14;
    v16 = *v10;
    v17 = v14 > v16;
    if (v14 > v16)
    {
      v19 = (_WORD *)a3[1];
      v18 = a3[2];
      if ((unint64_t)v19 >= v18)
      {
        v21 = (_WORD *)*a3;
        v22 = (uint64_t)v19 - *a3;
        if (v22 <= -3)
          sub_1D3D6D4F8();
        v23 = v22 >> 1;
        v24 = v18 - (_QWORD)v21;
        if (v24 <= (v22 >> 1) + 1)
          v25 = v23 + 1;
        else
          v25 = v24;
        v26 = v24 >= 0x7FFFFFFFFFFFFFFELL;
        v27 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v26)
          v27 = v25;
        if (v27)
        {
          v27 = (uint64_t)sub_1D3E2D848(v27);
          v21 = (_WORD *)*a3;
          v19 = (_WORD *)a3[1];
        }
        else
        {
          v28 = 0;
        }
        v29 = (_WORD *)(v27 + 2 * v23);
        v30 = v27 + 2 * v28;
        *v29 = 0;
        v20 = v29 + 1;
        while (v19 != v21)
        {
          v31 = *--v19;
          *--v29 = v31;
        }
        *a3 = v29;
        a3[1] = v20;
        a3[2] = v30;
        if (v21)
          operator delete(v21);
      }
      else
      {
        *v19 = 0;
        v20 = v19 + 1;
      }
      a3[1] = v20;
    }
    v32 = &v10[v12 - 1];
    v33 = v10 + 1;
    v34 = (__int16)v10;
    do
    {
      v35 = *v10;
      v36 = v10[1];
      v37 = v10[2];
      v10 = v33;
      v38 = v15 > (int)(4 * v36 - (v37 + v35) + (((4 * v36 - (v37 + v35)) & 0x8000u) >> 15)) >> 1;
      if (v38 != v17)
      {
        v39 = (_WORD)v33 - v34;
        v41 = (_WORD *)a3[1];
        v40 = a3[2];
        if ((unint64_t)v41 >= v40)
        {
          v43 = (_WORD *)*a3;
          v44 = (uint64_t)v41 - *a3;
          if (v44 <= -3)
            sub_1D3D6D4F8();
          v45 = v44 >> 1;
          v46 = v40 - (_QWORD)v43;
          if (v46 <= (v44 >> 1) + 1)
            v47 = v45 + 1;
          else
            v47 = v46;
          if (v46 >= 0x7FFFFFFFFFFFFFFELL)
            v48 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v48 = v47;
          if (v48)
          {
            v48 = (uint64_t)sub_1D3E2D848(v48);
            v43 = (_WORD *)*a3;
            v41 = (_WORD *)a3[1];
          }
          else
          {
            v49 = 0;
          }
          v50 = (_WORD *)(v48 + 2 * v45);
          *v50 = v39;
          v42 = v50 + 1;
          while (v41 != v43)
          {
            v51 = *--v41;
            *--v50 = v51;
          }
          *a3 = v50;
          a3[1] = v42;
          a3[2] = v48 + 2 * v49;
          if (v43)
            operator delete(v43);
        }
        else
        {
          *v41 = v39;
          v42 = v41 + 1;
        }
        a3[1] = v42;
        v17 = v38;
        v34 = (__int16)v10;
      }
      v33 = v10 + 1;
    }
    while (v10 + 1 < v32);
    v52 = *v32;
    v54 = (_WORD *)a3[1];
    v53 = a3[2];
    if (v15 > v52 != v17)
    {
      v55 = (_WORD)v32 - v34;
      if ((unint64_t)v54 >= v53)
      {
        v57 = (_WORD *)*a3;
        v58 = (uint64_t)v54 - *a3;
        if (v58 <= -3)
          sub_1D3D6D4F8();
        v59 = v58 >> 1;
        v60 = v53 - (_QWORD)v57;
        if (v60 <= (v58 >> 1) + 1)
          v61 = v59 + 1;
        else
          v61 = v60;
        v26 = v60 >= 0x7FFFFFFFFFFFFFFELL;
        v62 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v26)
          v62 = v61;
        if (v62)
        {
          v62 = (uint64_t)sub_1D3E2D848(v62);
          v57 = (_WORD *)*a3;
          v54 = (_WORD *)a3[1];
        }
        else
        {
          v63 = 0;
        }
        v64 = (_WORD *)(v62 + 2 * v59);
        v53 = v62 + 2 * v63;
        *v64 = v55;
        v56 = v64 + 1;
        while (v54 != v57)
        {
          v65 = *--v54;
          *--v64 = v65;
        }
        *a3 = v64;
        a3[1] = v56;
        a3[2] = v53;
        if (v57)
        {
          operator delete(v57);
          v53 = a3[2];
        }
      }
      else
      {
        *v54 = v55;
        v56 = v54 + 1;
      }
      a3[1] = v56;
      v34 = (__int16)v32;
      v54 = v56;
    }
    v66 = (_WORD)v32 - v34 + 1;
    if ((unint64_t)v54 >= v53)
    {
      v68 = (_WORD *)*a3;
      v69 = (uint64_t)v54 - *a3;
      if (v69 <= -3)
        sub_1D3D6D4F8();
      v70 = v69 >> 1;
      v71 = v53 - (_QWORD)v68;
      if (v71 <= (v69 >> 1) + 1)
        v72 = v70 + 1;
      else
        v72 = v71;
      v26 = v71 >= 0x7FFFFFFFFFFFFFFELL;
      v73 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v26)
        v73 = v72;
      if (v73)
      {
        v73 = (uint64_t)sub_1D3E2D848(v73);
        v68 = (_WORD *)*a3;
        v54 = (_WORD *)a3[1];
      }
      else
      {
        v74 = 0;
      }
      v75 = (_WORD *)(v73 + 2 * v70);
      v76 = v73 + 2 * v74;
      *v75 = v66;
      v67 = v75 + 1;
      while (v54 != v68)
      {
        v77 = *--v54;
        *--v75 = v77;
      }
      *a3 = v75;
      a3[1] = v67;
      a3[2] = v76;
      if (v68)
        operator delete(v68);
    }
    else
    {
      *v54 = v66;
      v67 = v54 + 1;
    }
    a3[1] = v67;
    if (v15 > v52)
    {
      v78 = a3[2];
      if ((unint64_t)v67 >= v78)
      {
        v80 = (_WORD *)*a3;
        v81 = (uint64_t)v67 - *a3;
        if (v81 <= -3)
          sub_1D3D6D4F8();
        v82 = v81 >> 1;
        v83 = v78 - (_QWORD)v80;
        if (v83 <= (v81 >> 1) + 1)
          v84 = v82 + 1;
        else
          v84 = v83;
        v26 = v83 >= 0x7FFFFFFFFFFFFFFELL;
        v85 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v26)
          v85 = v84;
        if (v85)
        {
          v85 = (uint64_t)sub_1D3E2D848(v85);
          v80 = (_WORD *)*a3;
          v67 = (_WORD *)a3[1];
        }
        else
        {
          v86 = 0;
        }
        v87 = (_WORD *)(v85 + 2 * v82);
        v88 = v85 + 2 * v86;
        *v87 = 0;
        v79 = v87 + 1;
        while (v67 != v80)
        {
          v89 = *--v67;
          *--v87 = v89;
        }
        *a3 = v87;
        a3[1] = v79;
        a3[2] = v88;
        if (v80)
          operator delete(v80);
      }
      else
      {
        *v67 = 0;
        v79 = v67 + 1;
      }
      a3[1] = v79;
    }
  }
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  return v7;
}

void sub_1D3E4165C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 112);
  if (v3)
  {
    *(_QWORD *)(v1 - 104) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D3E41690(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 56))(*(_QWORD *)(a1 + 8));
}

void sub_1D3E416A0(_QWORD **a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;

  (*(void (**)(__int128 *__return_ptr))(*a1[1] + 64))(&v8);
  v9 = v8;
  v8 = 0uLL;
  ((void (*)(_QWORD **, __int128 *))(*a1)[12])(a1, &v9);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_1D3E41770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  sub_1D3D96F10((uint64_t)&a11);
  sub_1D3D96F10((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E4178C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 72))(*(_QWORD *)(a1 + 8));
}

void sub_1D3E4179C(_QWORD **a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;

  (*(void (**)(__int128 *__return_ptr))(*a1[1] + 80))(&v8);
  v9 = v8;
  v8 = 0uLL;
  ((void (*)(_QWORD **, __int128 *))(*a1)[12])(a1, &v9);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_1D3E4186C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  sub_1D3D96F10((uint64_t)&a11);
  sub_1D3D96F10((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_1D3E41888@<X0>(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  result = operator new(0x30uLL);
  result[1] = 0;
  result[2] = 0;
  *result = &off_1E95B0350;
  v6 = *a1;
  v5 = a1[1];
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  result[3] = &off_1E95AF018;
  result[4] = v6;
  result[5] = v5;
  *a2 = result + 3;
  a2[1] = result;
  return result;
}

void sub_1D3E418F4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E95B0350;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1D3E41904(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E95B0350;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D8254C54);
}

uint64_t sub_1D3E41934(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_1D3E41944(char *a1)
{
  int v1;
  uint64_t v2;
  char *v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  int v10;
  int v11;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;

  v1 = *(_DWORD *)a1;
  v2 = 4;
  v3 = a1;
  do
  {
    v4 = *(_DWORD *)&a1[v2];
    v5 = v1 < v4;
    if (v1 <= v4)
      v1 = *(_DWORD *)&a1[v2];
    if (v5)
      v3 = &a1[v2];
    v2 += 4;
  }
  while (v2 != 128);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = (unint64_t)(v3 - a1) >> 2;
  v10 = *(_DWORD *)v3;
  do
  {
    if (((int)v6 - (int)v9) * ((int)v6 - (int)v9) * *(_DWORD *)&a1[4 * v6] > v7)
    {
      v8 = v6;
      v7 = (v6 - v9) * (v6 - v9) * *(_DWORD *)&a1[4 * v6];
    }
    ++v6;
  }
  while (v6 != 32);
  if (v8 >= (int)v9)
    v11 = v9;
  else
    v11 = v8;
  if (v8 <= (int)v9)
    v8 = v9;
  if (v8 - v11 < 3)
    return 0xFFFFFFFFLL;
  v13 = v8 - 1;
  if (v13 > v11)
  {
    v14 = v13;
    v15 = v11;
    v16 = -v11;
    v17 = -1;
    v18 = 1;
    do
    {
      if ((v16 + (int)v14) * (v16 + (int)v14) * v18 * (v10 - *(_DWORD *)&a1[4 * v14]) > v17)
      {
        v13 = v14;
        v17 = (v16 + v14) * (v16 + v14) * v18 * (v10 - *(_DWORD *)&a1[4 * v14]);
      }
      --v14;
      ++v18;
    }
    while (v14 > v15);
  }
  return (8 * v13);
}

BOOL sub_1D3E41A30(unsigned __int8 **a1, uint64_t a2)
{
  int64_t v4;
  _BYTE *v5;
  int64_t v6;
  _BYTE *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;

  v4 = a1[1] - *a1;
  v5 = *(_BYTE **)a2;
  v6 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if ((_DWORD)v6 == (_DWORD)v4)
  {
    if (v6 >= 1)
      bzero(v5, v6);
  }
  else
  {
    v26 = 0;
    sub_1D3D81DF8(&v18, (int)v4, &v26);
    v7 = *(_BYTE **)a2;
    if (*(_QWORD *)a2)
    {
      *(_QWORD *)(a2 + 8) = v7;
      operator delete(v7);
    }
    *(_OWORD *)a2 = v18;
    *(_QWORD *)(a2 + 16) = v19;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *a1;
  if ((int)v4 >= 1)
  {
    v9 = v4;
    v10 = v8;
    do
    {
      v11 = *v10++;
      ++*(_DWORD *)((char *)&v18 + (((unint64_t)v11 >> 1) & 0x7C));
      --v9;
    }
    while (v9);
  }
  v12 = sub_1D3E41944((char *)&v18);
  if (v12 > 0)
  {
    if (v12 > *v8)
    {
      if (*(_QWORD *)(a2 + 8) == *(_QWORD *)a2)
        goto LABEL_24;
      **(_BYTE **)a2 = 1;
    }
    if (v4 << 32 >= 0x200000001)
    {
      v13 = 0;
      do
      {
        v14 = v13 + 1;
        v15 = 4 * v8[v13 + 1] - (v8[v13 + 2] + v8[v13]);
        if (v12 > (v15 + ((unsigned __int16)(v15 & 0x8000) >> 15)) >> 1)
        {
          if (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2 <= v14)
            goto LABEL_24;
          *(_BYTE *)(*(_QWORD *)a2 + v13 + 1) = 1;
        }
        ++v13;
      }
      while (&v8[v14 + 1] < &v8[(int)v4 - 1]);
    }
    v16 = ((v4 << 32) - 0x100000000) >> 32;
    if (v12 > v8[v16])
    {
      if (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2 > v16)
      {
        *(_BYTE *)(*(_QWORD *)a2 + v16) = 1;
        return v12 > 0;
      }
LABEL_24:
      sub_1D3DB6E04();
    }
  }
  return v12 > 0;
}

uint64_t sub_1D3E41BF4(int a1, int a2)
{
  unint64_t v2;
  unsigned int v3;
  char v4;
  char v5;
  char v6;

  switch(a1)
  {
    case 0:
      v2 = 0x252B2F24202E2DuLL >> (8 * (a2 - 36));
      if ((a2 - 36) >= 7)
        LOBYTE(v2) = 0;
      if (a2 <= 0x23)
        LOBYTE(v2) = a2 + 55;
      if (a2 <= 9)
        LOBYTE(v2) = a2 + 48;
      break;
    case 1:
      LOBYTE(v2) = a2 - 9;
      break;
    case 2:
      v3 = 0x604000u >> (8 * (a2 - 30));
      if ((a2 - 30) >= 3)
        LOBYTE(v3) = 127;
      if ((a2 - 25) <= 4)
        v4 = a2 + 98;
      else
        v4 = v3;
      if ((a2 - 20) <= 4)
        v5 = a2 + 71;
      else
        v5 = v4;
      if ((a2 - 15) <= 4)
        v6 = a2 + 44;
      else
        v6 = v5;
      if ((a2 - 10) <= 4)
        LOBYTE(v2) = a2 + 17;
      else
        LOBYTE(v2) = v6;
      break;
    case 3:
      LOBYTE(v2) = a2 + 23;
      break;
    case 4:
      LOBYTE(v2) = a2 + 87;
      break;
    default:
      LOBYTE(v2) = 0;
      break;
  }
  return (char)v2;
}

BOOL sub_1D3E41CE0(uint64_t a1, int a2, int a3, int *a4, char *__s1)
{
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  char *v27;
  size_t v28;
  uint8_t v29[4];
  int v30;
  _BYTE buf[12];
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  result = 1;
  if (__s1 && *a4 != a3)
  {
    if (!strcmp(__s1, "UTF-8"))
      return 1;
    v11 = MEMORY[0x1D8255020]("UTF-8", __s1);
    if (v11 == -1)
    {
      if (qword_1EFE31880 != -1)
        dispatch_once(&qword_1EFE31880, &unk_1E95B3648);
      v22 = qword_1EFE31878;
      result = os_log_type_enabled((os_log_t)qword_1EFE31878, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        v23 = *__error();
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "UTF-8";
        v32 = 2082;
        v33 = __s1;
        v34 = 1026;
        v35 = v23;
        _os_log_error_impl(&dword_1D3D6B000, v22, OS_LOG_TYPE_ERROR, "[Code93i] iconv_open(\"%{public}s\", \"%{public}s\") failed: %{public, errno}d", buf, 0x1Cu);
        return 0;
      }
    }
    else
    {
      v12 = v11;
      v13 = *a4;
      *(_QWORD *)buf = v13 - a3;
      v14 = 8 * *(_DWORD *)buf + 8;
      v28 = 8 * *(_QWORD *)buf + 8;
      v15 = (char *)malloc_type_malloc(v28, 0x85B62F8AuLL);
      v26 = a1 + a3;
      v27 = v15;
      if (MEMORY[0x1D8255008](v12, &v26, buf, &v27, &v28) == -1)
      {
        v16 = 8 * v13 - 8 * a3 + 136;
        while (*__error() == 7)
        {
          v28 += 128;
          v17 = v27 - v15;
          v15 = (char *)malloc_type_realloc(v15, v16, 0xF7CEEB7BuLL);
          v27 = &v15[v17];
          v16 += 128;
          if (MEMORY[0x1D8255008](v12, &v26, buf, &v27, &v28) != -1)
          {
            v14 = v16 - 128;
            goto LABEL_10;
          }
        }
        if (qword_1EFE31880 != -1)
          dispatch_once(&qword_1EFE31880, &unk_1E95B3648);
        v24 = qword_1EFE31878;
        if (os_log_type_enabled((os_log_t)qword_1EFE31878, OS_LOG_TYPE_ERROR))
        {
          v25 = *__error();
          *(_DWORD *)v29 = 67240192;
          v30 = v25;
          _os_log_error_impl(&dword_1D3D6B000, v24, OS_LOG_TYPE_ERROR, "[Code93i] iconv failed: %{public, errno}d", v29, 8u);
        }
        free(v15);
        MEMORY[0x1D8255014](v12);
        return 0;
      }
LABEL_10:
      MEMORY[0x1D8255014](v12);
      LODWORD(v18) = v14 - v28;
      *a4 = a3;
      if ((int)v18 >= 1)
      {
        v18 = v18;
        v19 = v15;
        do
        {
          v20 = *a4;
          if ((int)v20 < a2)
          {
            v21 = *v19;
            *a4 = v20 + 1;
            *(_BYTE *)(a1 + v20) = v21;
          }
          ++v19;
          --v18;
        }
        while (v18);
      }
      free(v15);
      return *a4 <= a2;
    }
  }
  return result;
}

uint64_t sub_1D3E42004(uint64_t a1, int a2, int *a3, int *a4, _QWORD *a5)
{
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v11;
  int *v12;
  int v13;
  uint64_t v14;

  v5 = *a3;
  if ((int)v5 > a2 - 2 || *(_BYTE *)(a1 + v5) != 47)
    return 0;
  v6 = *(char *)(v5 + a1 + 1);
  if (v6 < 44)
  {
    v7 = 1;
    goto LABEL_14;
  }
  if ((int)v5 > a2 - 3)
    return 0;
  v8 = *(char *)(v5 + a1 + 2);
  if (v6 == 44)
  {
    v6 = v8 + 44;
    v7 = 2;
    goto LABEL_14;
  }
  if ((int)v5 > a2 - 4)
    return 0;
  v9 = *(char *)(v5 + a1 + 3);
  if (v6 == 45)
  {
    v6 = v9 + 52 * v8 + 96;
    v7 = 3;
    goto LABEL_14;
  }
  if ((int)v5 > a2 - 5)
    return 0;
  v6 = *(char *)(v5 + a1 + 4) + 52 * (v9 + 52 * (v8 + 52 * v6 - 2392)) + 2800;
  v7 = 4;
LABEL_14:
  v11 = 0;
  *a4 = v6;
  *a3 += v7;
  v12 = dword_1E95B4248;
  while (1)
  {
    v13 = *v12;
    v12 += 4;
    if (v13 == *a4)
      break;
    if (++v11 == 32)
    {
      v14 = 0;
      goto LABEL_19;
    }
  }
  v14 = *(_QWORD *)&dword_1E95B4248[4 * v11 + 2];
LABEL_19:
  *a5 = v14;
  return 1;
}

uint64_t sub_1D3E42120()
{
  uint64_t result;

  result = sub_1D3E285B4(0x35u, 2);
  qword_1EFE31A10 = result;
  return result;
}

uint64_t sub_1D3E42144(uint64_t a1, float *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  int v9;
  size_t v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  float *v16;
  float v17;
  float v18;
  BOOL v19;
  size_t v20;
  _BOOL4 v21;
  int v22;
  size_t v24;
  char *v25;
  unsigned int *v26;
  unint64_t v27;
  int32x2_t v28;
  int32x2_t v29;
  int8x8_t v30;
  int32x2_t v31;
  const float *v32;
  int32x2_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  int v39;
  int *v40;
  int v41;
  uint64_t v42;
  int v43;
  _DWORD *v44;
  uint64_t v45;
  uint64_t v46;
  _DWORD *v47;
  int v48;
  char *v49;
  BOOL v50;
  int v51;
  _DWORD *v52;
  uint64_t v53;
  _DWORD *v54;
  char *v55;
  unsigned int v56;
  int v57;
  _DWORD *v58;
  uint64_t v59;
  size_t count;
  _DWORD *v61;
  float v63;
  int v64;
  float v65[55];
  float v66[15];
  float v67[7];
  uint64_t v68;
  int v69;
  char v70[12];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (a3 < 16)
    return 16;
  if ((-1431655765 * a3 + 1431655765) > 0x55555554)
    return 2;
  v9 = a3 - 1;
  v10 = (a3 - 1) / 3uLL;
  v11 = malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  v63 = 0.0;
  v12 = (v10 - 1);
  sub_1D3E404D4((uint64_t)a2, a4, 3 * v12, v67);
  sub_1D3E3EF34(55, 7u, 0xFu, v66, v65, v67, flt_1D3E7A34C, &v11[v12], &v63);
  v13 = v11[v12];
  if ((v13 - 53) > 1)
  {
    v16 = 0;
LABEL_30:
    *(_DWORD *)(a5 + 24) = 0;
    *(_QWORD *)(a5 + 8) = 0;
    v6 = 6;
    goto LABEL_31;
  }
  v57 = a3;
  v58 = &v11[v12];
  v56 = v9;
  v59 = a5;
  count = v10;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = v63 + 0.0;
  v18 = fminf(v63, INFINITY);
  v19 = v13 == 53;
  v61 = v11;
  do
  {
    sub_1D3E404D4((uint64_t)a2, a4, v14, v67);
    sub_1D3E3EF34(55, 7u, 0xFu, v66, v65, v67, flt_1D3E7A34C, v11, &v63);
    if (v15)
    {
      if (v15 >= 4 && v19 && v15 <= (v10 - 5))
      {
        v16[v15] = v63;
LABEL_13:
        v19 = 1;
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if ((*v61 - 53) > 1)
    {
      v11 = v61;
      goto LABEL_30;
    }
    if (*v61 == 54 && v19)
    {
      v16 = (float *)malloc_type_calloc(v10, 4uLL, 0x100004052888210uLL);
      goto LABEL_13;
    }
    v19 = 0;
LABEL_15:
    v17 = v17 + v63;
    if (v63 < v18)
      v18 = v63;
    ++v15;
    ++v11;
    v14 += 3;
  }
  while (v12 != v15);
  v20 = v10;
  *(float *)(a5 + 24) = (float)((float)(v17 / (float)(int)v10) * 0.3) + (float)(v18 * 0.7);
  v11 = v61;
  if ((*v61 - 53) > 1 || (*v58 - 53) > 1)
  {
    v6 = 6;
LABEL_28:
    *(float *)(v59 + 24) = *(float *)(v59 + 24) / 100.0;
    goto LABEL_31;
  }
  pthread_once(&stru_1EFE316D0, (void (*)(void))sub_1D3E42120);
  if (*v61 == 53)
  {
    if (*v58 == 54)
    {
      if ((v10 - 11) > 0x2B)
      {
        v6 = 7;
      }
      else
      {
        v24 = (v10 - 8);
        v25 = (char *)malloc_type_malloc(2 * v24, 0x1000040BDFB0063uLL);
        if (v16)
          v26 = (unsigned int *)malloc_type_calloc((v10 - 8), 4uLL, 0x100004052888210uLL);
        else
          v26 = 0;
        v64 = 0;
        v38 = (char *)malloc_type_calloc(v24, 2uLL, 0x1000040BDFB0063uLL);
        v69 = 0;
        v68 = 0;
        v39 = count - 9;
        v40 = v61 + 4;
        v41 = count - 9;
        v42 = (count - 8);
        do
        {
          v43 = *v40++;
          *(_WORD *)&v25[2 * v41--] = v43;
          --v42;
        }
        while (v42);
        v44 = v61;
        v45 = (count - 4);
        v46 = 10;
        v47 = v61;
        do
        {
          v48 = v47[1];
          ++v47;
          v49 = &v70[v46];
          *(_WORD *)v49 = v48;
          *((_WORD *)v49 - 3) = v44[v45];
          v46 -= 2;
          v44 = v47;
        }
        while (v46 != 4);
        if (sub_1D3E287FC(qword_1EFE31A10, v25, v24, v70, 6u, v26, 0, &v64, v38, &v68))
          v50 = 1;
        else
          v50 = (2 * v64) > 4;
        if (v50)
        {
          v51 = 0;
          v6 = 7;
          v11 = v61;
        }
        else
        {
          v52 = v61 + 4;
          do
          {
            *v52++ = v38[2 * v39--];
            --v24;
          }
          while (v24);
          v53 = 0;
          v54 = &v61[v45];
          v11 = v61;
          v55 = (char *)&v69 + 2;
          do
          {
            v61[v53 + 1] = *v55;
            v54[v53++] = *(v55 - 6);
            v55 -= 2;
          }
          while (v53 != 3);
          if (v61[v12 >> 1] == 52 && v61[(v12 >> 1) + 1] == (_DWORD)count - 10)
          {
            v6 = 0;
            v51 = 1;
          }
          else
          {
            v51 = 0;
            v6 = 7;
          }
        }
        free(v25);
        free(v38);
        if (v26)
          free(v26);
        v20 = count;
        if (v51)
          goto LABEL_45;
      }
      goto LABEL_51;
    }
    v21 = *v58 == 53;
LABEL_40:
    v22 = 53;
    goto LABEL_41;
  }
  if (*v61 != 54)
  {
    v21 = 0;
    goto LABEL_40;
  }
  v21 = 0;
  if (*v58 == 54)
    v22 = 47;
  else
    v22 = 53;
LABEL_41:
  v27 = (v10 - 4);
  v28 = 0;
  v29 = (int32x2_t)0x100000000;
  do
  {
    v30 = (int8x8_t)vadd_s32(v29, (int32x2_t)0x100000001);
    v31 = vcgt_s32(v29, (int32x2_t)0xE00000013);
    v32 = (const float *)&v61[v27];
    v29 = vsub_s32((int32x2_t)vbic_s8(v30, (int8x8_t)v31), v31);
    v33 = (int32x2_t)vld1_dup_f32(v32);
    v28 = vmla_s32(v28, v33, v29);
    v50 = v27-- > 1;
  }
  while (v50);
  if (v28.i32[0] % v22 != v61[(v10 - 3)]
    || (v28.i32[1] + v21 + v28.i32[0] % v22) % v22 != v61[(v10 - 2)])
  {
    v6 = 5;
LABEL_51:
    *(_QWORD *)(v59 + 8) = 0;
    goto LABEL_28;
  }
LABEL_45:
  *(_QWORD *)(v59 + 8) = v20;
  v34 = *(void **)(v59 + 16);
  if (v34)
    free(v34);
  *(_QWORD *)(v59 + 16) = 0;
  v35 = malloc_type_malloc(v20, 0x100004077774924uLL);
  v36 = 0;
  *(_QWORD *)(v59 + 16) = v35;
  do
  {
    *(_BYTE *)(*(_QWORD *)(v59 + 16) + v36) = v11[v36];
    ++v36;
  }
  while (v20 != v36);
  v6 = 0;
  *(_DWORD *)(v59 + 80) = 1;
  *(_DWORD *)(v59 + 84) = v20;
  *(float *)(v59 + 72) = (float)(a2[6] - *a2) / 18.0;
  *(float *)(v59 + 76) = (float)(a2[v56] - a2[v57 - 7]) / 18.0;
  v37 = *(_QWORD *)(v59 + 64);
  *(_QWORD *)(v37 + 40) = 0;
  *(float *)(v37 + 48) = *a2;
  *(_DWORD *)(v37 + 52) = *(_DWORD *)(a4 + 4 * v56);
  *(_DWORD *)(v37 + 20) = v57;
LABEL_31:
  free(v11);
  if (v16)
    free(v16);
  return v6;
}

void sub_1D3E427F4(uint64_t a1, _BYTE *a2, int a3, unint64_t *a4, char *a5)
{
  unsigned __int8 *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  int v9;
  unint64_t v11;
  BOOL v12;
  unsigned int v13;
  signed int v14;
  int v15;
  unsigned __int8 *v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  signed int v23;
  int v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
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
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  int v55;
  int v56;
  char v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  unint64_t v66;
  int v67;
  unint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unsigned __int16 v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  unsigned __int16 v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  int v106;
  int v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  _BOOL4 v129;
  uint64_t v130;
  int v131;
  int v132;
  unsigned int v133;
  int v134;
  BOOL v135;
  int v136;
  int v137;
  int v138;
  unint64_t *v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  _BYTE *v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  int v149;
  unsigned __int8 v150;
  uint64_t v151;
  uint64_t v152;
  int32x2_t v153;
  int32x2_t v154;
  int8x8_t v155;
  int32x2_t v156;
  int v157;
  int v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  int v164;
  uint64_t v165;
  int v166;
  int v167;
  unsigned int v168;
  _BOOL4 v170;
  BOOL v171;
  int v172;
  int v174;
  _BYTE *v175;
  int v176;
  signed int v177;
  int v178;
  uint64_t v179;
  int v180;
  char *v181;
  int v182;
  int v183;
  int v184[3];

  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(unsigned __int8 **)(a1 + 16);
  if (v5)
    v7 = (int)v6 <= 4;
  else
    v7 = 1;
  if (v7)
  {
    if (a2)
      *a2 = 0;
    return;
  }
  v8 = *v5;
  if ((v8 - 53) > 1)
    return;
  v9 = v5[(v6 - 1)];
  if ((v9 - 53) > 1)
    return;
  v11 = (v6 - 4);
  v12 = v9 == 54;
  if (v8 == 54)
  {
    v175 = a2;
    v170 = v9 != 54;
    v13 = 1;
    v14 = v6 - 4;
  }
  else
  {
    if (v9 != 54)
      return;
    v175 = a2;
    v12 = 0;
    v14 = v6 - 5;
    v170 = 1;
    v13 = 4;
  }
  v15 = 2 * v6;
  v16 = (unsigned __int8 *)malloc_type_malloc((2 * v6), 0xF58C8A8AuLL);
  v17 = v14 - v13;
  if (v14 < (int)v13)
    ++v17;
  v183 = v13;
  v184[0] = 0;
  v182 = -1;
  v18 = v13 + (v17 >> 1);
  v181 = a5;
  v179 = (uint64_t)v16;
  v172 = 2 * v6;
  if (v14 >= v13)
  {
    v23 = v14;
    v168 = v14 - v13;
    v171 = v12;
    v166 = 0;
    v21 = 0;
    v174 = 0;
    v176 = 0;
    v178 = 0;
    v180 = 0;
    v24 = 0;
    v25 = 0;
    v19 = 0;
    v26 = v18 + 1;
    v27 = v18 + 2;
    v28 = v18 + 3;
    v162 = v13 | 2;
    v29 = v18 - 2;
    v165 = v13 + 1;
    v163 = v15 - 2;
    v164 = v15 - 1;
    v161 = v13 + 3;
    v167 = v13;
    v20 = v13;
    v177 = v14;
    v22 = v8;
    while (1)
    {
      if (v24 <= 0)
        v30 = 0;
      else
        v30 = v25;
      if (v24 <= 0)
        v31 = 0;
      else
        v31 = v25;
      v32 = v20 != v18 && v20 != (_DWORD)v26 && v24 > 0;
      if (v20 != v18 && v20 != (_DWORD)v26)
        v33 = v31;
      else
        v33 = v25;
      if (v20 == v28)
        v34 = -4;
      else
        v34 = -2;
      v35 = v34 + v20;
      if (v20 == v27)
        v36 = v18;
      else
        v36 = v20;
      if (v20 == v27)
        v35 = v29;
      if (v22 == 54)
      {
        v32 = v24 > 0;
        v25 = v30;
      }
      else
      {
        v25 = v33;
      }
      if (v22 == 54)
        v37 = v20;
      else
        v37 = v36;
      if (v22 == 54)
        v38 = v20 - 2;
      else
        v38 = v35;
      if (v38 < 1)
        v39 = 0;
      else
        v39 = (char)v5[v38];
      v24 -= v32;
      v40 = (char)v5[v20];
      v41 = (char)v5[v37 - 1];
      switch(v21)
      {
        case 0:
          if (v40 <= 9)
          {
            if (!(_DWORD)v19)
            {
              v21 = 0;
              v69 = v184[0]++;
              v16[v69] = v40 + 48;
              goto LABEL_304;
            }
            if (v171)
              goto LABEL_346;
            v21 = 0;
            v24 = v40 + 3;
            goto LABEL_53;
          }
          if ((v40 - 10) <= 0x19)
          {
            if ((_DWORD)v19 == v25)
              v55 = 0;
            else
              v55 = v19;
            if ((_DWORD)v19)
              v56 = v55;
            else
              v56 = v25;
            v57 = sub_1D3E41BF4(v56, (char)v5[v20]);
            v29 = v18 - 2;
            v28 = v18 + 3;
            v27 = v18 + 2;
            v26 = v18 + 1;
            v23 = v177;
            v21 = 0;
            v19 = 0;
            v58 = v184[0]++;
            *(_BYTE *)(v179 + v58) = v57;
            v16 = (unsigned __int8 *)v179;
            goto LABEL_304;
          }
          if ((v40 - 36) <= 0xA)
          {
            if (!(_DWORD)v19)
            {
              switch(v5[v20])
              {
                case '$':
                  v21 = 0;
                  v19 = 0;
                  v64 = v184[0]++;
                  v65 = 45;
                  goto LABEL_201;
                case '%':
                  v21 = 0;
                  v19 = 0;
                  v64 = v184[0]++;
                  v65 = 46;
                  goto LABEL_201;
                case '&':
                  v21 = 0;
                  v19 = 0;
                  v64 = v184[0]++;
                  v65 = 32;
                  goto LABEL_201;
                case '\'':
                  v21 = 0;
                  v19 = 0;
                  v64 = v184[0]++;
                  v65 = 36;
                  goto LABEL_201;
                case '(':
                  v21 = 0;
                  v19 = 0;
                  v64 = v184[0]++;
                  v65 = 47;
                  goto LABEL_201;
                case ')':
                  v21 = 0;
                  v19 = 0;
                  v64 = v184[0]++;
                  v65 = 43;
                  goto LABEL_201;
                case '*':
                  v21 = 0;
                  v19 = 0;
                  v64 = v184[0]++;
                  v65 = 37;
                  goto LABEL_201;
                default:
                  v21 = 0;
                  v19 = (v40 - 42);
                  break;
              }
              goto LABEL_304;
            }
            v21 = 0;
            v24 = v40 - 23;
LABEL_53:
            v25 = v19;
            v19 = 0;
            goto LABEL_304;
          }
          if (v171)
            goto LABEL_346;
          v21 = 3;
          switch(v5[v20])
          {
            case '/':
              if (v25)
                goto LABEL_346;
              v82 = v19;
              if ((sub_1D3E42004((uint64_t)v5, v6, &v183, &v182, &v181) & 1) == 0)
                goto LABEL_395;
              v21 = 0;
              v25 = 0;
              v16 = (unsigned __int8 *)v179;
              v23 = v177;
              v26 = v18 + 1;
              v28 = v18 + 3;
              v27 = v18 + 2;
              v29 = v18 - 2;
              v19 = v82;
              break;
            case '0':
              v48 = v24 + 2;
              v49 = v24 <= 0;
              goto LABEL_58;
            case '1':
              v21 = 2;
              v174 = v184[0];
              break;
            case '2':
              break;
            case '3':
              v106 = v166 + v167;
              if (v20 < v166 + v167 + 3)
              {
                if (v20 == v106)
                  goto LABEL_167;
                if (v20 == v106 + 1)
                {
                  if (v184[0] >= 1)
                  {
                    v59 = 0;
                    v118 = *v16;
                    if ((v118 - 65) < 0x1A || (v118 - 48) < 0xA)
                      goto LABEL_281;
                  }
LABEL_280:
                  v59 = 7;
                }
                else
                {
                  if (v184[0] == 1)
                  {
                    v59 = 0;
                    v122 = *v16;
                    if ((v122 - 65) >= 0x1A && (v122 - 48) >= 0xA)
                    {
                      if ((v122 - 97) >= 0x1A)
                        v59 = 7;
                      else
                        v59 = 0;
                    }
                    goto LABEL_281;
                  }
                  if (v184[0] < 2 || *v16 - 48 > 9 || v16[1] - 48 >= 0xA)
                    goto LABEL_280;
LABEL_167:
                  v59 = 0;
                }
LABEL_281:
                v21 = 0;
                v184[0] = 0;
                goto LABEL_303;
              }
              if (v20 >= v23)
                goto LABEL_206;
              v21 = 0;
              v64 = v184[0]++;
              v65 = 29;
LABEL_201:
              v16[v64] = v65;
              break;
            case '4':
              if (v22 != 54 && v20 == v18)
              {
                v107 = (char)v5[v26] + 1;
                v183 = v26;
                if (v107 != v168)
                  goto LABEL_346;
LABEL_206:
                v21 = 0;
                break;
              }
              if (v20 != v167)
                goto LABEL_346;
              if (v23 >= v162 && v5[v165] == 51 && v5[v162] == 50)
                goto LABEL_206;
              if (v167 > (int)v6 - 3 || v40 != 52)
                goto LABEL_346;
              v115 = (char)v5[v165];
              v116 = (char)v5[v162];
              if (v115 > 44)
              {
                if ((char)v5[v161] > 50)
                  goto LABEL_346;
                v119 = v116 + 52 * v115 - 2340;
                if (v119 > 360)
                  goto LABEL_346;
                v120 = 0x28u;
                while (v119 > *(_DWORD *)((char *)&unk_1D3E7A2D8 + v120))
                {
                  v120 += 4;
                  if (v120 == 116)
                    goto LABEL_346;
                }
                v166 = 4;
                v117 = v161;
              }
              else
              {
                if (v116 > 50)
                  goto LABEL_346;
                v166 = 3;
                v117 = v162;
              }
              v21 = 0;
              v183 = v117;
              break;
            default:
              goto LABEL_346;
          }
LABEL_304:
          v132 = v183;
          v20 = ++v183;
          if (v132 >= v23)
            goto LABEL_305;
          break;
        case 1:
          if (v40 > 0x2F)
          {
            v59 = 0;
            if (v180 >= 1 && v40 >= 48 && v40 <= 50)
            {
              if (v180 == 1)
              {
                if (v41 > 9)
                  goto LABEL_138;
                v59 = 0;
                v180 = 0;
                v84 = v41 + 48;
                v85 = v184[0]++;
                v16[v85] = v84;
              }
              else
              {
                v60 = v41 + 48 * v39;
                if (v60 <= 0x3E7)
                {
                  v59 = 0;
                  v180 = 0;
                  v61 = v184[0]++;
                  v16[v61] = ((unsigned __int16)v60 / 0x64u) | 0x30;
                  v62 = v184[0]++;
                  v16[v62] = (((unsigned __int16)v60 / 0xAu) % 0xAu) | 0x30;
                  v63 = v184[0]++;
                  v16[v63] = ((unsigned __int16)v60 % 0xAu) | 0x30;
                  v24 -= v24 > 0;
                  goto LABEL_139;
                }
LABEL_138:
                v180 = 0;
                v59 = 7;
              }
            }
LABEL_139:
            v21 = 0;
            switch(v40)
            {
              case '0':
                goto LABEL_303;
              case '1':
                goto LABEL_272;
              case '2':
                goto LABEL_294;
              case '3':
                if (v20 < v23)
                {
                  v86 = v184[0]++;
                  v16[v86] = 29;
                }
                goto LABEL_145;
              case '4':
                if (v22 == 54)
                  goto LABEL_346;
                if (v20 != v18)
                  goto LABEL_346;
                v87 = (char)v5[v26] + 1;
                v183 = v26;
                if (v87 != v168)
                  goto LABEL_346;
LABEL_145:
                v21 = 1;
                break;
              default:
                goto LABEL_346;
            }
            goto LABEL_303;
          }
          if (v180 < 2)
          {
            ++v180;
          }
          else
          {
            v42 = v40 + 48 * (v41 + 48 * v39);
            if (v42 >> 5 > 0xC34)
            {
              v77 = v42 - 100000;
              if (v77 >> 4 > 0x270)
                goto LABEL_346;
              v180 = 0;
              v78 = v184[0]++;
              v16[v78] = ((unsigned __int16)v77 / 0x3E8u) | 0x30;
              v79 = v184[0]++;
              v16[v79] = (((unsigned __int16)v77 / 0x64u) % 0xAu) | 0x30;
              v80 = v184[0]++;
              v16[v80] = ((unsigned __int16)v77 / 0xAu - 10 * ((6554 * ((unsigned __int16)v77 / 0xAu)) >> 16)) | 0x30;
              v81 = v184[0]++;
              v16[v81] = ((unsigned __int16)v77 % 0xAu) | 0x30;
              v24 -= v24 > 0;
            }
            else
            {
              v180 = 0;
              v43 = v184[0]++;
              v16[v43] = (v42 / 0x2710) | 0x30;
              v44 = v184[0]++;
              v16[v44] = ((v42 / 0x3E8) % 0xAu) | 0x30;
              v45 = v184[0]++;
              v16[v45] = ((unsigned __int16)(v42 / 0x64) % 0xAu) | 0x30;
              v46 = v184[0]++;
              v16[v46] = ((unsigned __int16)(v42 / 0xA) % 0xAu) | 0x30;
              v47 = v184[0]++;
              v16[v47] = (v42 % 0xA) | 0x30;
              v48 = v24 - 2;
              v49 = v24 <= 1;
LABEL_58:
              if (!v49)
                v24 = v48;
            }
          }
          v21 = 1;
          goto LABEL_304;
        case 2:
          if (v25)
            goto LABEL_346;
          v50 = (v40 - 42);
          if (v40 > 0x2A)
          {
            if ((v40 - 43) <= 3u)
            {
              v25 = 0;
              v21 = 2;
              goto LABEL_91;
            }
            if ((v40 - 48) > 2)
            {
              v83 = v19;
              v59 = 0;
            }
            else
            {
              if (v176 < 1)
              {
                v83 = v19;
                v88 = 0;
              }
              else if (v176 == 1)
              {
                if ((_DWORD)v19)
                  goto LABEL_155;
                if (v41 > 9)
                {
                  if (v41 > 0x23)
                  {
                    if ((v41 - 36) > 6)
                      LOBYTE(v114) = 0;
                    else
                      v114 = 0x252B2F24202E2DuLL >> (8 * (v41 - 36));
                  }
                  else
                  {
                    LOBYTE(v114) = v41 + 55;
                  }
                }
                else
                {
                  LOBYTE(v114) = v41 + 48;
                }
                LOBYTE(v114) = v114 ^ 0x80;
LABEL_284:
                v83 = v19;
                v88 = 0;
                v176 = 0;
                v128 = v184[0]++;
                v16[v128] = v114;
              }
              else
              {
                if (!(_DWORD)v19)
                {
                  if (v39 > 9)
                  {
                    if (v39 > 0x23)
                    {
                      if ((v39 - 36) > 6)
                        LOBYTE(v66) = 0;
                      else
                        v66 = 0x252B2F24202E2DuLL >> (8 * (v39 - 36));
                    }
                    else
                    {
                      LOBYTE(v66) = v39 + 55;
                    }
                  }
                  else
                  {
                    LOBYTE(v66) = v39 + 48;
                  }
                  v123 = v184[0]++;
                  v16[v123] = v66;
                  if (v41 > 9)
                  {
                    if (v41 > 0x23)
                    {
                      if ((v41 - 36) > 6)
                        LOBYTE(v114) = 0;
                      else
                        v114 = 0x252B2F24202E2DuLL >> (8 * (v41 - 36));
                    }
                    else
                    {
                      LOBYTE(v114) = v41 + 55;
                    }
                  }
                  else
                  {
                    LOBYTE(v114) = v41 + 48;
                  }
                  goto LABEL_284;
                }
LABEL_155:
                v83 = v19;
                v176 = 0;
                v88 = 7;
              }
              v129 = sub_1D3E41CE0((uint64_t)v16, v172, v174, v184, v181);
              v174 = v184[0];
              if (v129)
                v59 = v88;
              else
                v59 = 7;
              v23 = v177;
              v26 = v18 + 1;
              v28 = v18 + 3;
              v27 = v18 + 2;
              v29 = v18 - 2;
            }
            v25 = 0;
            v21 = 1;
            v16 = (unsigned __int8 *)v179;
            v19 = v83;
            switch(v40)
            {
              case '/':
                v125 = v59;
                if ((sub_1D3E42004((uint64_t)v5, v6, &v183, &v182, &v181) & 1) == 0)
                  goto LABEL_395;
                v25 = 0;
                v21 = 2;
                goto LABEL_292;
              case '0':
                break;
              case '1':
                goto LABEL_295;
              case '2':
                goto LABEL_293;
              case '3':
                if (v20 >= v23)
                  goto LABEL_301;
                v25 = 0;
                v130 = v184[0]++;
                *(_BYTE *)(v179 + v130) = 29;
                goto LABEL_302;
              case '4':
                if (v22 == 54)
                  goto LABEL_346;
                if (v20 != v18)
                  goto LABEL_346;
                v131 = (char)v5[v26] + 1;
                v183 = v26;
                if (v131 != v168)
                  goto LABEL_346;
LABEL_301:
                v25 = 0;
LABEL_302:
                v21 = 2;
                break;
              default:
                goto LABEL_395;
            }
LABEL_303:
            if (v59)
              goto LABEL_346;
            goto LABEL_304;
          }
          if (!(_DWORD)v19)
          {
            if (v176 < 2)
            {
              v25 = 0;
              v19 = 0;
              ++v176;
              goto LABEL_186;
            }
            v70 = v40 + 43 * (v41 + 43 * v39);
            if (v70 < 0x10000)
            {
              v176 = 0;
              v25 = 0;
              v19 = 0;
              v71 = v184[0]++;
              v72 = v70 + 255;
              if (v70 >= 0)
                HIBYTE(v72) = BYTE1(v70);
              v16[v71] = HIBYTE(v72);
              v73 = v184[0]++;
LABEL_185:
              v16[v73] = v70;
LABEL_186:
              v21 = 2;
              goto LABEL_304;
            }
            if (v70 < 0x12710)
            {
              v176 = 0;
              v25 = 0;
              v19 = 0;
              v89 = v184[0]++;
              v16[v89] = ((unsigned __int16)v70 / 0x3E8u) | 0x30;
              v90 = v184[0]++;
              v16[v90] = (((unsigned __int16)v70 / 0x64u) % 0xAu) | 0x30;
              v91 = (unsigned __int16)v70 / 0xAu;
              v92 = v184[0]++;
              v16[v92] = (v91 - 10 * ((6554 * v91) >> 16)) | 0x30;
              goto LABEL_183;
            }
            if (v70 >= 0x12AF8)
            {
              if (v70 >= 0x12B5C)
                return;
              v176 = 0;
              v25 = 0;
              v19 = 0;
              LOBYTE(v70) = v70 + 8;
              LOBYTE(v91) = v70 / 0xAu;
              v111 = v184[0]++;
              v16[v111] = (v70 / 0xAu) | 0x30;
LABEL_183:
              v101 = v70 - 10 * v91;
            }
            else
            {
              v176 = 0;
              v25 = 0;
              v19 = 0;
              v98 = v70 - 10000;
              v99 = v184[0]++;
              v16[v99] = (v98 / 0x64u) | 0x30;
              v100 = v184[0]++;
              v16[v100] = ((v98 / 0xAu) % 0xAu) | 0x30;
              v101 = v98 % 0xAu;
            }
            v73 = v184[0]++;
            LOBYTE(v70) = v101 | 0x30;
            goto LABEL_185;
          }
          if ((v40 - 10) <= 0x19)
            goto LABEL_72;
          if ((_DWORD)v19 != 1 || v40 > 9)
            goto LABEL_346;
          v25 = 0;
          v51 = v184[0]++;
          v16[v51] = v40 + 48;
          v19 = 1;
          v21 = 2;
          goto LABEL_124;
        case 3:
          if (v25)
            goto LABEL_346;
          v50 = (v40 - 42);
          if (v40 > 0x2A)
          {
            if ((v40 - 43) > 3u)
            {
              v59 = 0;
              v67 = v178;
              if (v178 >= 1 && v40 >= 48 && v40 <= 50)
              {
                if (v178 == 1)
                {
                  if ((_DWORD)v19)
                    goto LABEL_153;
                  if (v41 > 9)
                  {
                    if (v41 > 0x23)
                    {
                      if ((v41 - 36) > 6)
                        LOBYTE(v108) = 0;
                      else
                        v108 = 0x252B2F24202E2DuLL >> (8 * (v41 - 36));
                    }
                    else
                    {
                      LOBYTE(v108) = v41 + 55;
                    }
                  }
                  else
                  {
                    LOBYTE(v108) = v41 + 48;
                  }
                  LOBYTE(v108) = v108 ^ 0x80;
LABEL_265:
                  v59 = 0;
                  v67 = 0;
                  v124 = v184[0]++;
                  v16[v124] = v108;
                }
                else
                {
                  if (!(_DWORD)v19)
                  {
                    if (v39 > 9)
                    {
                      if (v39 > 0x23)
                      {
                        if ((v39 - 36) > 6)
                          LOBYTE(v68) = 0;
                        else
                          v68 = 0x252B2F24202E2DuLL >> (8 * (v39 - 36));
                      }
                      else
                      {
                        LOBYTE(v68) = v39 + 55;
                      }
                    }
                    else
                    {
                      LOBYTE(v68) = v39 + 48;
                    }
                    v121 = v184[0]++;
                    v16[v121] = v68;
                    if (v41 > 9)
                    {
                      if (v41 > 0x23)
                      {
                        if ((v41 - 36) > 6)
                          LOBYTE(v108) = 0;
                        else
                          v108 = 0x252B2F24202E2DuLL >> (8 * (v41 - 36));
                      }
                      else
                      {
                        LOBYTE(v108) = v41 + 55;
                      }
                    }
                    else
                    {
                      LOBYTE(v108) = v41 + 48;
                    }
                    goto LABEL_265;
                  }
LABEL_153:
                  v67 = 0;
                  v59 = 7;
                }
              }
              v178 = v67;
              v25 = 0;
              v21 = 1;
              switch(v40)
              {
                case '/':
                  v125 = v59;
                  v83 = v19;
                  if ((sub_1D3E42004((uint64_t)v5, v6, &v183, &v182, &v181) & 1) == 0)
                  {
LABEL_395:
                    v16 = (unsigned __int8 *)v179;
LABEL_346:
                    v144 = v175;
                    goto LABEL_393;
                  }
                  v25 = 0;
                  v21 = 3;
LABEL_292:
                  v16 = (unsigned __int8 *)v179;
                  v23 = v177;
                  v26 = v18 + 1;
                  v28 = v18 + 3;
                  v27 = v18 + 2;
                  v29 = v18 - 2;
                  v19 = v83;
                  v59 = v125;
                  break;
                case '0':
                  goto LABEL_303;
                case '1':
                  v25 = 0;
LABEL_272:
                  v21 = 2;
                  v174 = v184[0];
                  goto LABEL_303;
                case '2':
LABEL_295:
                  v25 = 0;
                  v21 = 0;
                  goto LABEL_303;
                case '3':
                  if (v20 >= v23)
                    goto LABEL_293;
                  v25 = 0;
                  v126 = v184[0]++;
                  v16[v126] = 29;
                  goto LABEL_294;
                case '4':
                  if (v22 == 54)
                    goto LABEL_346;
                  if (v20 != v18)
                    goto LABEL_346;
                  v127 = (char)v5[v26] + 1;
                  v183 = v26;
                  if (v127 != v168)
                    goto LABEL_346;
LABEL_293:
                  v25 = 0;
LABEL_294:
                  v21 = 3;
                  goto LABEL_303;
                default:
                  goto LABEL_346;
              }
              goto LABEL_303;
            }
            v25 = 0;
            v21 = 3;
LABEL_91:
            v19 = v50;
          }
          else
          {
            if (!(_DWORD)v19)
            {
              if (v178 < 2)
              {
                v25 = 0;
                v19 = 0;
                ++v178;
              }
              else
              {
                v74 = v40 + 43 * (v41 + 43 * v39);
                if ((int)v74 < 0x10000)
                {
                  if ((int)v74 > 127)
                  {
                    if (v74 > 0x7FF)
                    {
                      if (v74 >> 11 == 27)
                        goto LABEL_346;
                      v109 = v184[0];
                      if (v184[0] >= v163)
                        goto LABEL_346;
                      ++v184[0];
                      v16[v109] = (v74 >> 12) - 32;
                      v110 = v184[0]++;
                      v16[v110] = (v74 >> 6) & 0x3F | 0x80;
                    }
                    else
                    {
                      v97 = v184[0];
                      if (v184[0] >= v164)
                        goto LABEL_346;
                      ++v184[0];
                      v16[v97] = (v74 >> 6) - 64;
                    }
                    v75 = v184[0];
                    LOBYTE(v74) = v74 & 0x3F | 0x80;
                  }
                  else
                  {
                    v75 = v184[0];
                    if (v184[0] >= v172)
                      goto LABEL_346;
                  }
                  v178 = 0;
                  v25 = 0;
                  v19 = 0;
                  v184[0] = v75 + 1;
                  v16[v75] = v74;
                  goto LABEL_191;
                }
                if (v74 < 0x12710)
                {
                  v178 = 0;
                  v25 = 0;
                  v19 = 0;
                  v93 = v184[0]++;
                  v16[v93] = ((unsigned __int16)v74 / 0x3E8u) | 0x30;
                  v94 = v184[0]++;
                  v16[v94] = (((unsigned __int16)v74 / 0x64u) % 0xAu) | 0x30;
                  v95 = (unsigned __int16)v74 / 0xAu;
                  v96 = v184[0]++;
                  v16[v96] = (v95 - 10 * ((6554 * v95) >> 16)) | 0x30;
                  goto LABEL_189;
                }
                if (v74 >= 0x12AF8)
                {
                  if (v74 >= 0x12B5C)
                    return;
                  v178 = 0;
                  v25 = 0;
                  v19 = 0;
                  LOBYTE(v74) = v74 + 8;
                  LOBYTE(v95) = v74 / 0xAu;
                  v112 = v184[0]++;
                  v16[v112] = (v74 / 0xAu) | 0x30;
LABEL_189:
                  v105 = v74 - 10 * v95;
                }
                else
                {
                  v178 = 0;
                  v25 = 0;
                  v19 = 0;
                  v102 = v74 - 10000;
                  v103 = v184[0]++;
                  v16[v103] = (v102 / 0x64u) | 0x30;
                  v104 = v184[0]++;
                  v16[v104] = ((v102 / 0xAu) % 0xAu) | 0x30;
                  v105 = v102 % 0xAu;
                }
                v113 = v184[0]++;
                v16[v113] = v105 | 0x30;
              }
LABEL_191:
              v21 = 3;
              goto LABEL_304;
            }
            if ((v40 - 10) > 0x19)
            {
              if ((_DWORD)v19 != 1 || v40 > 9)
                goto LABEL_346;
              v25 = 0;
              v76 = v184[0]++;
              v16[v76] = v40 + 48;
              v19 = 1;
              v21 = 3;
            }
            else
            {
LABEL_72:
              v52 = sub_1D3E41BF4(v19, (char)v5[v20]);
              v21 = 0;
              v25 = 0;
              v19 = 0;
              v53 = v52 ^ 0x80;
              v16 = (unsigned __int8 *)v179;
              v54 = v184[0]++;
              *(_BYTE *)(v179 + v54) = v53;
            }
LABEL_124:
            v23 = v177;
            v26 = v18 + 1;
            v28 = v18 + 3;
            v27 = v18 + 2;
            v29 = v18 - 2;
          }
          goto LABEL_304;
        default:
          goto LABEL_304;
      }
    }
  }
  LODWORD(v19) = 0;
  v20 = v13;
  v180 = 0;
  v178 = 0;
  v176 = 0;
  v174 = 0;
  v21 = 0;
  v22 = v8;
LABEL_305:
  v133 = v18 + 2;
  if (v20 == v18 + 3)
    v134 = v20 - 4;
  else
    v134 = v20 - 2;
  v135 = v20 == v133;
  if (v20 == v133)
    v136 = v18;
  else
    v136 = v20;
  if (v135)
    v134 = v18 - 2;
  if (v22 == 54)
  {
    v136 = v20;
    v134 = v20 - 2;
  }
  v137 = (char)v5[v136 - 1];
  v138 = (char)v5[v134];
  if (v21 == 1 && v180 >= 1)
  {
    v139 = a4;
    if (v180 == 1)
    {
      if (v137 > 9)
        goto LABEL_346;
      LOBYTE(v140) = v137 + 48;
    }
    else
    {
      LODWORD(v140) = v137 + 48 * v138;
      if (v140 > 0x3E7)
        goto LABEL_346;
      v141 = v184[0]++;
      v16[v141] = ((unsigned __int16)v140 / 0x64u) | 0x30;
      v142 = v184[0]++;
      v16[v142] = (((unsigned __int16)v140 / 0xAu) % 0xAu) | 0x30;
      LOBYTE(v140) = ((unsigned __int16)v140 % 0xAu) | 0x30;
    }
LABEL_359:
    v147 = v184[0]++;
    v16[v147] = v140;
    goto LABEL_360;
  }
  v139 = a4;
  if (v21 == 3 && v178 >= 1)
  {
    if (v178 == 1)
    {
      if ((_DWORD)v19)
        goto LABEL_346;
      v140 = 0x252B2F24202E2DuLL >> (8 * (v137 - 36));
      if ((v137 - 36) > 6)
        LOBYTE(v140) = 0;
      if (v137 <= 0x23)
        LOBYTE(v140) = v137 + 55;
      if (v137 <= 9)
        LOBYTE(v140) = v137 + 48;
      LOBYTE(v140) = v140 ^ 0x80;
    }
    else
    {
      if ((_DWORD)v19)
        goto LABEL_346;
      v145 = 0x252B2F24202E2DuLL >> (8 * (v138 - 36));
      if ((v138 - 36) > 6)
        LOBYTE(v145) = 0;
      if (v138 <= 0x23)
        LOBYTE(v145) = v138 + 55;
      if (v138 <= 9)
        LOBYTE(v145) = v138 + 48;
      v146 = v184[0]++;
      v16[v146] = v145;
      v140 = 0x252B2F24202E2DuLL >> (8 * (v137 - 36));
      if ((v137 - 36) > 6)
        LOBYTE(v140) = 0;
      if (v137 <= 0x23)
        LOBYTE(v140) = v137 + 55;
      if (v137 <= 9)
        LOBYTE(v140) = v137 + 48;
    }
    goto LABEL_359;
  }
  if (v21 == 2)
  {
    if (v176 < 1)
    {
LABEL_372:
      v149 = 1;
      goto LABEL_373;
    }
    if (v176 == 1)
    {
      if (!(_DWORD)v19)
      {
        v143 = 0x252B2F24202E2DuLL >> (8 * (v137 - 36));
        if ((v137 - 36) > 6)
          LOBYTE(v143) = 0;
        if (v137 <= 0x23)
          LOBYTE(v143) = v137 + 55;
        if (v137 <= 9)
          LOBYTE(v143) = v137 + 48;
        LOBYTE(v143) = v143 ^ 0x80;
LABEL_371:
        v152 = v184[0]++;
        v16[v152] = v143;
        goto LABEL_372;
      }
    }
    else if (!(_DWORD)v19)
    {
      v149 = 0;
      if (v138 > 9 || v137 > 42)
        goto LABEL_373;
      v150 = v138 + 48;
      v151 = v184[0]++;
      v16[v151] = v150;
      v143 = 0x252B2F24202E2DuLL >> (8 * (v137 - 36));
      if ((v137 - 36) > 6)
        LOBYTE(v143) = 0;
      if (v137 <= 0x23)
        LOBYTE(v143) = v137 + 55;
      if (v137 <= 9)
        LOBYTE(v143) = v137 + 48;
      goto LABEL_371;
    }
    v149 = 0;
LABEL_373:
    v148 = sub_1D3E41CE0(v179, v172, v174, v184, v181) & v149;
    v16 = (unsigned __int8 *)v179;
    goto LABEL_374;
  }
LABEL_360:
  v148 = 1;
LABEL_374:
  if (v22 == 54 && v148)
  {
    v153 = (int32x2_t)1;
    v154 = 0;
    v144 = v175;
    do
    {
      v155 = (int8x8_t)vadd_s32(v153, (int32x2_t)0x100000001);
      v156 = vcgt_s32(v153, (int32x2_t)0x130000000ELL);
      v153 = vsub_s32((int32x2_t)vbic_s8(v155, (int8x8_t)v156), v156);
      v154 = vmla_s32(v154, v153, vdup_n_s32((char)v5[v11]));
      v7 = v11-- > 1;
    }
    while (v7);
    if (v170)
      v157 = 53;
    else
      v157 = 47;
    if (v154.i32[1] % v157 != (char)v5[(v6 - 3)]
      || (v154.i32[1] % v157 + v154.i32[0]) % v157 != (char)v5[(v6 - 2)])
    {
      goto LABEL_393;
    }
  }
  else
  {
    v144 = v175;
    if (!v148)
      goto LABEL_393;
  }
  v158 = v184[0];
  if (v184[0] >= a3 - 1)
    v158 = a3 - 1;
  *v139 = v158;
  if (v158)
  {
    v159 = 0;
    do
    {
      v144[v159] = v16[v159];
      ++v159;
      v160 = *v139;
    }
    while (*v139 > v159);
  }
  else
  {
    v160 = 0;
  }
  v144 += v160;
LABEL_393:
  *v144 = 0;
  free(v16);
}

BOOL sub_1D3E44118(int a1)
{
  return a1 > 15 && a1 % 3 == 1;
}

_QWORD *sub_1D3E44148(_QWORD *__dst)
{
  _QWORD *v1;
  void *v2;
  void *v3;

  if (__dst)
  {
    v1 = __dst;
    v2 = (void *)__dst[88];
    if (v2)
      free(v2);
    v3 = (void *)v1[87];
    if (v3)
      free(v3);
    return memcpy(v1, &unk_1D3E7B2F0, 0x2C8uLL);
  }
  return __dst;
}

float sub_1D3E44194(uint64_t a1, uint64_t a2, int a3, int *a4, _DWORD *a5, float *a6, float *a7, float result, float a9, float a10)
{
  int v10;
  BOOL v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v10 = *(_DWORD *)a1;
  v11 = *(int *)a1 >= 5 && v10 == *(_DWORD *)a2;
  if (v11 && v10 - 4 > a3)
  {
    v12 = *(_QWORD *)(a1 + 8);
    v13 = vabds_f32(*(float *)(v12 + 4 * a3), result);
    v14 = INFINITY;
    if (v13 <= INFINITY)
    {
      v15 = a3;
      v16 = v10 - a3 - 5;
      while (1)
      {
        v14 = v13;
        if (!v16)
          break;
        v17 = v15 + 1;
        v13 = vabds_f32(*(float *)(v12 + 4 + 4 * v15), result);
        --v16;
        ++v15;
        if (v13 > v14)
        {
          a3 = v17 - 1;
          goto LABEL_13;
        }
      }
      a3 = *(_DWORD *)a1 - 5;
    }
LABEL_13:
    if (v14 <= a10)
    {
      v18 = a3 + 4;
      result = *(float *)(v12 + 4 * v18);
      if (vabds_f32(result, a9) <= a10)
      {
        v19 = *(_QWORD *)(a2 + 8);
        v20 = *(float *)(v12 + 4 * a3);
        result = result - v20;
        v21 = 4 * a3 + 4;
        *a7 = (float)(1.0 / result) * (float)(*(float *)(v12 + v21) - v20);
        a7[1] = (float)(1.0 / result) * (float)(*(float *)(v19 + v21) - *(float *)(v19 + 4 * a3));
        v22 = 4 * a3 + 8;
        a7[2] = (float)(1.0 / result) * (float)(*(float *)(v12 + v22) - *(float *)(v12 + v21));
        a7[3] = (float)(1.0 / result) * (float)(*(float *)(v19 + v22) - *(float *)(v19 + v21));
        v23 = 4 * a3 + 12;
        a7[4] = (float)(1.0 / result) * (float)(*(float *)(v12 + v23) - *(float *)(v12 + v22));
        a7[5] = (float)(1.0 / result) * (float)(*(float *)(v19 + v23) - *(float *)(v19 + v22));
        *a6 = result;
        *a4 = a3;
        *a5 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_1D3E442E8(uint64_t result, uint64_t a2, unsigned int a3, float *a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;

  if ((a3 & 0x80000000) == 0 && *(_DWORD *)result == *(_DWORD *)a2)
  {
    v5 = a3 + 4;
    if ((int)v5 < *(_DWORD *)result)
    {
      v6 = *(_QWORD *)(result + 8);
      v7 = *(_QWORD *)(a2 + 8);
      v8 = *(float *)(v6 + 4 * a3);
      v9 = *(float *)(v6 + 4 * v5) - v8;
      v10 = 1.0;
      if (v9 > 0.0)
        v10 = 1.0 / v9;
      *a4 = (float)(*(float *)(v6 + 4 * (a3 + 1)) - v8) * v10;
      a4[1] = v10 * (float)(*(float *)(v7 + 4 * (a3 + 1)) - *(float *)(v7 + 4 * a3));
      a4[2] = v10 * (float)(*(float *)(v6 + 4 * (a3 + 2)) - *(float *)(v6 + 4 * (a3 + 1)));
      a4[3] = v10 * (float)(*(float *)(v7 + 4 * (a3 + 2)) - *(float *)(v7 + 4 * (a3 + 1)));
      v11 = a3 + 3;
      a4[4] = v10 * (float)(*(float *)(v6 + 4 * v11) - *(float *)(v6 + 4 * (a3 + 2)));
      a4[5] = v10 * (float)(*(float *)(v7 + 4 * v11) - *(float *)(v7 + 4 * (a3 + 2)));
      if (a5)
        a4[6] = v10 * (float)(*(float *)(v6 + 4 * v5) - *(float *)(v6 + 4 * v11));
    }
  }
  return result;
}

float sub_1D3E443CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  float v3;
  float v4;
  float v5;
  int v6;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;

  v2 = 0;
  v3 = 0.0;
  do
  {
    v4 = *(float *)(a1 + v2);
    if (v4 < 0.088235 || v4 >= 0.14706)
    {
      if (v4 < 0.14706 || v4 >= 0.20588)
      {
        if (v4 < 0.20588 || v4 >= 0.26471)
        {
          if (v4 < 0.26471 || v4 >= 0.32353)
          {
            if (v4 < 0.32353 || v4 >= 0.38235)
            {
              if (v4 < 0.38235 || v4 >= 0.44118)
              {
                if (v4 >= 0.44118 && v4 < 0.5)
                {
                  v5 = v4 + -0.47059;
                  v6 = 8;
                }
                else
                {
                  v8 = v4 >= 0.5;
                  v9 = v4 < 0.55882;
                  v5 = v4 + -0.52941;
                  v10 = !v8 || !v9;
                  if (v8 && v9)
                    v6 = 9;
                  else
                    v6 = -1;
                  if (v10)
                    v5 = 1000000.0;
                }
              }
              else
              {
                v5 = v4 + -0.41176;
                v6 = 7;
              }
            }
            else
            {
              v5 = v4 + -0.35294;
              v6 = 6;
            }
          }
          else
          {
            v5 = v4 + -0.29412;
            v6 = 5;
          }
        }
        else
        {
          v5 = v4 + -0.23529;
          v6 = 4;
        }
      }
      else
      {
        v5 = v4 + -0.17647;
        v6 = 3;
      }
    }
    else
    {
      v5 = v4 + -0.11765;
      v6 = 2;
    }
    *(_DWORD *)(a2 + v2) = v6;
    v3 = v3 + (float)(v5 * v5);
    v2 += 4;
  }
  while (v2 != 24);
  return expf(v3 * -20.0);
}

uint64_t sub_1D3E44568(int a1, int32x4_t *a2, float *a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v3 = 0;
  v4 = vaddvq_s32(vmulq_s32(*a2, (int32x4_t)xmmword_1D3E821A0)) + 10 * a2[1].i32[0] + a2[1].i32[1];
  v5 = (uint64_t)*(&off_1E95B40E8 + a1 / 3);
  v6 = (uint64_t)*(&off_1E95B4100 + a1 / 3);
  v7 = 928;
  v8 = 464;
  while (1)
  {
    v9 = v8;
    v10 = *(_DWORD *)(v5 + 4 * v8);
    v11 = v10 >= v4;
    if (v10 == v4)
      break;
    if (v10 <= v4)
      v12 = v7;
    else
      v12 = v9;
    if (v11)
      v7 = v12;
    if (!v11)
      v3 = v9 + 1;
    v13 = v7 + v3;
    if (v7 + v3 < 0 != __OFADD__(v7, v3))
      ++v13;
    v8 = v13 >> 1;
    if (v7 <= v3)
    {
      if (*(_DWORD *)(v5 + 4 * v8) == v4)
      {
        v9 = v8;
      }
      else
      {
        v14 = *(_DWORD *)(v5 + 4 * v3) - v4;
        if (v14 < 0)
          v14 = v4 - *(_DWORD *)(v5 + 4 * v3);
        v15 = *(_DWORD *)(v5 + 4 * v7) - v4;
        if (v15 < 0)
          v15 = -v15;
        *a3 = *a3 * 0.5;
        if (v14 >= v15)
          v3 = v7;
        v9 = v3;
      }
      return *(unsigned int *)(v6 + 4 * v9);
    }
  }
  return *(unsigned int *)(v6 + 4 * v9);
}

uint64_t sub_1D3E4464C(unsigned int a1, int a2, int a3, int a4, signed int a5, uint64_t a6)
{
  signed int v7;
  uint64_t result;
  unsigned int v10;
  uint64_t v11;
  int v12;
  unsigned __int16 v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unsigned __int16 v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  unsigned __int16 v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unsigned __int16 v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  unsigned __int16 v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;

  v7 = 3 * (a1 / 0x1E) + a2 / 3;
  result = (v7 + 1);
  if ((int)result < a4 || v7 >= a5)
    return 0xFFFFFFFFLL;
  if (!*(_DWORD *)a6)
  {
    v10 = a1 - 30 * (v7 / 3);
    if (a3)
    {
      if (a2 != 6)
      {
        if (a2 != 3)
        {
          if (a2 || v10 > 0x1D)
            goto LABEL_64;
          v11 = 0;
          v12 = 0;
          ++*(_WORD *)(a6 + 104 + 2 * v10);
          v13 = *(_WORD *)(a6 + 104);
          do
          {
            v14 = *(unsigned __int16 *)(a6 + 106 + 2 * v11++);
            if (v14 > v13)
            {
              v12 = v11;
              v13 = v14;
            }
          }
          while (v11 != 29);
LABEL_43:
          *(_WORD *)(a6 + 228) = v13;
          *(_DWORD *)(a6 + 16) = v12;
          goto LABEL_64;
        }
        if (v10 + 2 >= 0x1D)
        {
          v21 = *(_DWORD *)(a6 + 12);
        }
        else
        {
          v20 = 0;
          v21 = 0;
          v22 = ((((86 * (char)v10) & 0x8000) != 0) + ((unsigned __int16)(86 * (char)v10) >> 8));
          ++*(_WORD *)(a6 + 86 + 2 * v22);
          v23 = *(_WORD *)(a6 + 86);
          do
          {
            v24 = *(unsigned __int16 *)(a6 + 88 + 2 * v20++);
            if (v24 > v23)
            {
              v21 = v20;
              v23 = v24;
            }
          }
          while (v20 != 8);
          *(_WORD *)(a6 + 224) = v23;
          *(_DWORD *)(a6 + 12) = v21;
        }
        v35 = -3 * v21 + v10;
        if (v35 > 2)
          goto LABEL_64;
        v36 = 0;
        v37 = 0;
        ++*(_WORD *)(a6 + 164 + 2 * v35);
        v38 = *(_WORD *)(a6 + 164);
        do
        {
          v39 = *(unsigned __int16 *)(a6 + 166 + 2 * v36++);
          if (v39 > v38)
          {
            v37 = v36;
            v38 = v39;
          }
        }
        while (v36 != 2);
LABEL_63:
        *(_WORD *)(a6 + 230) = v38;
        *(_DWORD *)(a6 + 20) = v37;
LABEL_64:
        v43 = *(_DWORD *)(a6 + 16);
        if ((v43 & 0x80000000) == 0)
        {
          v44 = *(_DWORD *)(a6 + 20);
          if ((v44 & 0x80000000) == 0)
            *(_DWORD *)(a6 + 4) = 3 * v43 + v44 + 1;
        }
        if (*(unsigned __int16 *)(a6 + 226) < 3u
          || *(unsigned __int16 *)(a6 + 224) < 3u
          || *(unsigned __int16 *)(a6 + 228) < 3u
          || *(unsigned __int16 *)(a6 + 230) < 3u
          || (v45 = *(_DWORD *)(a6 + 4), (v45 - 3) > 0x57))
        {
          v47 = 0;
        }
        else
        {
          v46 = *(int *)(a6 + 12);
          v47 = 1;
          if (1 << (v46 + 1) >= *(_DWORD *)(a6 + 8) * v45)
          {
            v47 = 0;
            *(_WORD *)(a6 + 2 * v46 + 86) = 0;
            *(_WORD *)(a6 + 224) = 0;
          }
        }
        *(_DWORD *)a6 = v47;
        return result;
      }
      if (v10 > 0x1D)
        goto LABEL_64;
      v25 = 0;
      v16 = 0;
      v26 = v10 + 1;
      v18 = *(_WORD *)(a6 + 24);
      ++*(_WORD *)(a6 + 24 + 2 * v26);
      do
      {
        v27 = *(unsigned __int16 *)(a6 + 26 + 2 * v25++);
        if (v27 > v18)
        {
          v16 = v25;
          v18 = v27;
        }
      }
      while (v25 != 30);
    }
    else
    {
      if (a2 == 6)
      {
        if (v10 + 2 >= 0x1D)
        {
          v31 = *(_DWORD *)(a6 + 12);
        }
        else
        {
          v30 = 0;
          v31 = 0;
          v32 = ((((86 * (char)v10) & 0x8000) != 0) + ((unsigned __int16)(86 * (char)v10) >> 8));
          ++*(_WORD *)(a6 + 86 + 2 * v32);
          v33 = *(_WORD *)(a6 + 86);
          do
          {
            v34 = *(unsigned __int16 *)(a6 + 88 + 2 * v30++);
            if (v34 > v33)
            {
              v31 = v30;
              v33 = v34;
            }
          }
          while (v30 != 8);
          *(_WORD *)(a6 + 224) = v33;
          *(_DWORD *)(a6 + 12) = v31;
        }
        v40 = -3 * v31 + v10;
        if (v40 > 2)
          goto LABEL_64;
        v41 = 0;
        v37 = 0;
        ++*(_WORD *)(a6 + 164 + 2 * v40);
        v38 = *(_WORD *)(a6 + 164);
        do
        {
          v42 = *(unsigned __int16 *)(a6 + 166 + 2 * v41++);
          if (v42 > v38)
          {
            v37 = v41;
            v38 = v42;
          }
        }
        while (v41 != 2);
        goto LABEL_63;
      }
      if (a2 == 3)
      {
        if (v10 > 0x1D)
          goto LABEL_64;
        v28 = 0;
        v12 = 0;
        ++*(_WORD *)(a6 + 104 + 2 * v10);
        v13 = *(_WORD *)(a6 + 104);
        do
        {
          v29 = *(unsigned __int16 *)(a6 + 106 + 2 * v28++);
          if (v29 > v13)
          {
            v12 = v28;
            v13 = v29;
          }
        }
        while (v28 != 29);
        goto LABEL_43;
      }
      if (a2 || v10 > 0x1D)
        goto LABEL_64;
      v15 = 0;
      v16 = 0;
      v17 = v10 + 1;
      v18 = *(_WORD *)(a6 + 24);
      ++*(_WORD *)(a6 + 24 + 2 * v17);
      do
      {
        v19 = *(unsigned __int16 *)(a6 + 26 + 2 * v15++);
        if (v19 > v18)
        {
          v16 = v15;
          v18 = v19;
        }
      }
      while (v15 != 30);
    }
    *(_WORD *)(a6 + 226) = v18;
    *(_DWORD *)(a6 + 8) = v16;
    goto LABEL_64;
  }
  return result;
}

uint64_t sub_1D3E44A68(float *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v9;
  int v10;
  uint64_t result;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  float v23;
  unsigned int v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  int v34;
  int v35;
  float v36;
  int v37;
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
  __int128 v50;
  float *v51;
  _DWORD *v52;
  float v53[7];
  float v54[6];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v51 = a1;
  v52 = a2;
  *(_QWORD *)&v50 = a3;
  *((_QWORD *)&v50 + 1) = a4;
  sub_1D3E4E5F4(&v51, &v50, a6, a7);
  v9 = v50;
  v10 = v50 - 12;
  if ((int)v50 < 12)
    return 16;
  v12 = v50 - 1;
  v13 = *(_QWORD *)(a5 + 64);
  if (*(_BYTE *)(v13 + 30))
    v14 = 4;
  else
    v14 = v50;
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)(a5 + 72) = _D0;
  *(_QWORD *)(v13 + 40) = 0;
  v20 = (uint64_t)v52;
  *(_DWORD *)(v13 + 48) = *v52;
  v21 = *((_QWORD *)&v50 + 1);
  *(_DWORD *)(v13 + 52) = *(_DWORD *)(*((_QWORD *)&v50 + 1) + 4 * v12);
  *(_QWORD *)(v13 + 32) = _D0;
  if (v14 - 1 >= v10)
    v22 = v10;
  else
    v22 = v14 - 1;
  v23 = -1.0;
  v24 = 0;
  if (v22)
  {
    while (1)
    {
      sub_1D3E442E8((uint64_t)&v51, (uint64_t)&v50, v24, v54, 0);
      v26 = v25;
      v27 = 0.0;
      if (v25 > 0.0)
      {
        v28 = fmaxf(fabsf(9.0 - (float)(v54[0] * 17.0)) / 17.0, 0.0);
        v29 = fabsf(2.0 - (float)(v54[1] * 17.0)) / 17.0;
        if (v29 > v28)
          v28 = v29;
        v30 = fabsf(2.0 - (float)(v54[2] * 17.0)) / 17.0;
        if (v30 > v28)
          v28 = v30;
        v31 = fabsf(2.0 - (float)(v54[3] * 17.0)) / 17.0;
        if (v31 > v28)
          v28 = v31;
        v32 = fabsf(2.0 - (float)(v54[4] * 17.0)) / 17.0;
        if (v32 > v28)
          v28 = v32;
        v33 = fabsf(2.0 - (float)(v54[5] * 17.0)) / 17.0;
        if (v33 > v28)
          v28 = v33;
        v27 = fmaxf(1.0 - v28, 0.0);
        if (v27 > 0.93)
          break;
      }
      if (v22 == ++v24)
      {
        v24 = v22;
        v23 = -1.0;
        if (!a6)
          goto LABEL_28;
        goto LABEL_29;
      }
    }
    v23 = v26 / 17.0;
    *(float *)(a5 + 72) = v26 / 17.0;
    *(float *)(v13 + 32) = v26;
    *(_DWORD *)(v13 + 40) = v24;
    *(_DWORD *)(v13 + 48) = *(_DWORD *)(v20 + 4 * v24);
    if (a6)
      goto LABEL_29;
  }
  else
  {
    v26 = 0.0;
    v27 = 0.0;
    if (a6)
      goto LABEL_29;
  }
LABEL_28:
  if (v23 <= 0.0)
    return 6;
LABEL_29:
  v34 = v24 + 12;
  if (v23 <= 0.0)
    v34 = 4;
  if (v9 - v14 <= v34)
    v35 = v34;
  else
    v35 = v9 - v14;
  v36 = -1.0;
  if (v9 <= v35)
  {
    v38 = 0.0;
    v39 = 0.0;
    if (a6)
      goto LABEL_59;
  }
  else
  {
    v48 = v23;
    while (1)
    {
      v37 = v9 - 1;
      sub_1D3E442E8((uint64_t)&v51, (uint64_t)&v50, v9 - 5, v53, 1);
      v39 = 0.0;
      if (v38 > 0.0)
      {
        v40 = fmaxf(fabsf(8.0 - (float)(v53[0] * 17.0)) / 17.0, 0.0);
        v41 = fabsf(2.0 - (float)(v53[1] * 17.0)) / 17.0;
        if (v41 > v40)
          v40 = v41;
        v42 = fabsf(4.0 - (float)(v53[2] * 17.0)) / 17.0;
        if (v42 > v40)
          v40 = v42;
        v43 = fabsf(4.0 - (float)(v53[3] * 17.0)) / 17.0;
        if (v43 > v40)
          v40 = v43;
        v44 = fabsf(2.0 - (float)(v53[4] * 17.0)) / 17.0;
        if (v44 > v40)
          v40 = v44;
        v45 = fabsf(2.0 - (float)(v53[5] * 17.0)) / 17.0;
        if (v45 > v40)
          v40 = v45;
        v46 = fabsf(3.0 - (float)(v53[6] * 17.0)) / 17.0;
        if (v46 > v40)
          v40 = v46;
        v39 = fmaxf(1.0 - v40, 0.0);
        if (v39 > 0.93)
          break;
      }
      --v9;
      if (v37 <= v35)
      {
        v12 = v37 - 1;
        v23 = v48;
        v36 = -1.0;
        if (!a6)
          goto LABEL_56;
        goto LABEL_59;
      }
    }
    v36 = v38 / 17.0;
    *(float *)(a5 + 76) = v38 / 17.0;
    *(float *)(v13 + 36) = v38;
    *(_DWORD *)(v13 + 44) = v12 - v37;
    *(_DWORD *)(v13 + 52) = *(_DWORD *)(v21 + 4 * v37);
    v12 = v9 - 1;
    v23 = v48;
    if (a6)
      goto LABEL_59;
  }
LABEL_56:
  if (v36 <= 0.0)
    return 6;
LABEL_59:
  if ((float)(v27 * v39) > 0.93)
  {
    *(float *)(a5 + 24) = v27 * v39;
LABEL_75:
    *(_DWORD *)(v13 + 20) = 12;
    return 1;
  }
  if (v27 <= 0.93 || v23 <= 0.0)
  {
    if (v39 <= 0.93 || v36 <= 0.0)
    {
      *(_DWORD *)(a5 + 24) = 0;
      return 6;
    }
    v49 = 0.0;
    if ((int)sub_1D3E44F10((uint64_t)v51, v20, v50, v21, v12 - 8, &v49, v38) >= 1)
    {
      v47 = v49;
      if (v39 < v49)
        v47 = v39;
      goto LABEL_72;
    }
  }
  else
  {
    v49 = 0.0;
    if ((int)sub_1D3E44F10((uint64_t)v51, v20, v50, v21, v24 + 4, &v49, v26) >= 1)
    {
      v47 = v49;
      if (v27 < v49)
        v47 = v27;
LABEL_72:
      *(float *)(a5 + 24) = v47;
      result = 1;
      goto LABEL_74;
    }
  }
  result = 14;
LABEL_74:
  if ((_DWORD)result == 1)
    goto LABEL_75;
  return result;
}

uint64_t sub_1D3E44F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, float *a6, float a7)
{
  float v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int v13;
  uint64_t result;
  float v15;
  _QWORD v16[2];
  _QWORD v17[2];
  int32x4_t v18;
  int v19;
  int v20;
  float v21[6];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17[0] = a1;
  v17[1] = a2;
  v16[0] = a3;
  v16[1] = a4;
  sub_1D3E442E8((uint64_t)v17, (uint64_t)v16, a5, v21, 0);
  if ((float)(vabds_f32(a7, v9) / a7) >= 0.2)
    return 0xFFFFFFFFLL;
  v15 = sub_1D3E443CC((uint64_t)v21, (uint64_t)&v18);
  if (v15 <= 0.9)
    return 0xFFFFFFFFLL;
  v10 = (v18.i32[0] + v19 - (v18.i32[1] + v20) + 9) % 9;
  if (v10 > 6 || ((1 << v10) & 0x49) == 0)
    return 0xFFFFFFFFLL;
  v12 = sub_1D3E44568(v10, &v18, &v15);
  if (v12 > 0x3A0)
    return 0xFFFFFFFFLL;
  v13 = 3 * ((unsigned __int16)v12 / 0x1Eu) + v10 / 3u;
  if (v13 - 90 <= 0xFFFFFFA5)
    return 0xFFFFFFFFLL;
  result = v13 + 1;
  *a6 = v15;
  return result;
}

uint64_t sub_1D3E45078(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, int *a8, float a9, float a10, float a11, float a12, _QWORD *a13, float *a14)
{
  int *v14;
  _DWORD *v15;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  float v25;
  uint64_t v27;
  int v28;
  int *v29;
  int v30;
  int v31;
  float v32;
  int v33;
  BOOL v34;
  int v35;
  _DWORD *v36;
  _DWORD *v37;
  int v38;
  unsigned int v39;
  int v40;
  float *v41;
  __int32 v42;
  int v43;
  __int32 *v44;
  __int32 *v45;
  char *v46;
  float32x2_t v47;
  float32x2_t *v48;
  int v49;
  int *v50;
  unsigned int v51;
  float v52;
  unsigned int v54;
  int v55;
  _BOOL4 v58;
  int v61;
  uint64_t v62;
  float v63;
  float v64;
  uint64_t v65;
  float v66;
  float v67;
  unsigned int v68;
  uint64_t v69;
  float v70;
  int v71;
  uint64_t v72;
  float v73;
  int v74;
  unsigned int v75;
  unsigned int v78;
  uint64_t v79;
  float v80;
  float v81;
  int v82;
  float v83;
  unsigned int v84;
  unsigned int v86;
  int v87;
  int v88;
  uint64_t v89;
  uint64_t v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int *v96;
  int *v97;
  _DWORD *v98;
  char *v99;
  uint64_t v100;
  int *v101;
  int v102;
  int v103;
  _DWORD *v104;
  int v105;
  uint64_t v106;
  float v107;
  float v108;
  unsigned int v109;
  int v110;
  BOOL v111;
  BOOL v112;
  int v113;
  unsigned int v114;
  char v115;
  char v116;
  int v117;
  uint64_t v118;
  float v119;
  float v120;
  int v121;
  float v122;
  float v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  float v127;
  int v128;
  float v129;
  int v130;
  unsigned int v131;
  unsigned int v134;
  uint64_t v135;
  float v136;
  float v137;
  unsigned int v138;
  unsigned int v139;
  int v141;
  uint64_t v142;
  int *v143;
  int *v144;
  int *v145;
  _DWORD *v146;
  _DWORD *v147;
  _BYTE *v148;
  __int32 *v149;
  __int32 *v150;
  float32x2_t v151;
  int v152;
  int v153;
  uint64_t v154;
  int v155;
  int v156;
  _QWORD *v158;
  uint64_t v159;
  uint64_t v161;
  int v162;
  _BYTE *v163;
  int v165;
  int v166;
  uint64_t v167;
  unsigned int v168;
  unsigned int v169;
  uint64_t v170;
  int32x4_t v171;
  int v172;
  int v173;
  float v174[6];
  int32x4_t v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _QWORD v180[6];
  __int128 v181;
  __int128 v182;
  uint64_t v183;
  uint64_t v184;

  v14 = a8;
  v15 = a7;
  v18 = a4;
  v184 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a4 + 29) && *(int *)(a4 + 4) >= 1 && *(int *)(a4 + 12) >= 1)
  {
    v25 = *(float *)(a4 + 16);
    if (v25 > 0.0)
    {
      ++*a13;
      *a8 = -1;
      *a7 = -1;
      if (dword_1EDB89DD8 < 1)
      {
        v28 = 0;
      }
      else
      {
        v27 = 0;
        v28 = 0;
        v29 = dword_1EDB895D0;
        do
        {
          v30 = *v29;
          v29 += 16;
          if (v30 == 13)
            v31 = 1 << v27;
          else
            v31 = 0;
          v28 |= v31;
          ++v27;
        }
        while (dword_1EDB89DD8 != v27);
      }
      v89 = *(_QWORD *)(a5 + 80);
      v91 = sub_1D3E4EA7C(a1, a2, v28, *(_DWORD *)(a4 + 4), *(_DWORD *)(a4 + 12), (_QWORD *)a5, v89 + 56, v89 + 72, a9, a10, a11, a12, 1.0, v25, a14);
      if ((_DWORD)v91)
      {
        v21 = v91;
        v92 = -1;
        v93 = -1;
LABEL_223:
        *v15 = v93 - 1;
        v88 = v92 - 1;
        goto LABEL_224;
      }
      v167 = v89;
      v147 = v15;
      if (a2)
      {
        v95 = *(_DWORD *)(a4 + 40);
        v94 = *(_DWORD *)(a4 + 44);
        v96 = (int *)(a4 + 48);
        v97 = (int *)(a4 + 52);
      }
      else
      {
        v95 = 0;
        v94 = 0;
        v96 = *(int **)(v89 + 64);
        v97 = (int *)(*(_QWORD *)(v89 + 80) + 4 * *(int *)(v89 + 72) - 4);
      }
      v98 = (_DWORD *)(v89 + 72);
      if (a3)
      {
        v183 = 0;
        v181 = 0u;
        v182 = 0u;
        memset(v180, 0, sizeof(v180));
        v179 = 0u;
        v99 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
        *(_QWORD *)&v181 = v99;
        *((_QWORD *)v99 + 8) = 0;
        *((_DWORD *)v99 + 18) = 0;
        *((_QWORD *)v99 + 10) = 0;
        *(_OWORD *)v99 = 0u;
        *((_OWORD *)v99 + 1) = 0u;
        *((_OWORD *)v99 + 2) = 0u;
        *(_OWORD *)(v99 + 44) = 0u;
        v100 = sub_1D3E44A68(*(float **)(v89 + 56), *(_DWORD **)(v89 + 64), *(_QWORD *)(v89 + 72), *(_QWORD *)(v89 + 80), (uint64_t)&v179, 0, 0);
        if ((_DWORD)v100 != 1)
        {
          v21 = v100;
          sub_1D3E36E54((uint64_t)&v179);
          v92 = -1;
          v93 = -1;
          v15 = v147;
          goto LABEL_223;
        }
        v101 = (int *)(v89 + 56);
        v95 = *(_DWORD *)(v181 + 40);
        v94 = *(_DWORD *)(v181 + 44);
        v103 = *(_DWORD *)(v181 + 48);
        v102 = *(_DWORD *)(v181 + 52);
        sub_1D3E36E54((uint64_t)&v179);
      }
      else
      {
        v102 = *v97;
        v103 = *v96;
        v101 = (int *)(v89 + 56);
      }
      v104 = *(_DWORD **)(a5 + 80);
      v104[12] = v103;
      v104[13] = v102;
      v104[10] = v95;
      v104[11] = v94;
      v179 = xmmword_1D3E7B5B8;
      v180[0] = 0x3F8000003F800000;
      v175.i64[1] = -1;
      *(_QWORD *)&v176 = -1;
      v175.i64[0] = -1;
      v105 = *v101;
      v106 = a6;
      if (*v101 - (v95 + v94) < 17 || *v98 != v105)
      {
        v93 = -1;
        v109 = -1;
        goto LABEL_157;
      }
      sub_1D3E442E8((uint64_t)v101, v89 + 72, v95 + 4, (float *)&v179, 0);
      if (!a14 && (float)(vabds_f32(*(float *)(a4 + 32), v107) / *(float *)(a4 + 32)) >= 0.3)
      {
        sub_1D3E442E8((uint64_t)v101, v89 + 72, v105 - v94 - 9, (float *)&v179, 0);
        v109 = -1;
        v93 = -1;
        goto LABEL_211;
      }
      v171.i32[0] = sub_1D3E443CC((uint64_t)&v179, (uint64_t)&v175);
      if (*(float *)v171.i32 <= 0.9)
      {
        v93 = -1;
      }
      else
      {
        v109 = (v175.i32[0] + (int)v176 - (v175.i32[1] + DWORD1(v176)) + 9) % 9;
        v93 = -1;
        if (v109 <= 6 && ((1 << v109) & 0x49) != 0)
        {
          v138 = sub_1D3E44568(v109, &v175, (float *)v171.i32);
          if (v138 <= 0x3A0)
          {
            v93 = sub_1D3E4464C(v138, v109, 1, 1, 90, a6);
            v105 = *v101;
          }
LABEL_210:
          sub_1D3E442E8((uint64_t)v101, (uint64_t)v98, v105 - v94 - 9, (float *)&v179, 0);
          if (a14)
          {
LABEL_212:
            v171.i32[0] = sub_1D3E443CC((uint64_t)&v179, (uint64_t)&v175);
            if (*(float *)v171.i32 > 0.9)
            {
              v114 = (v175.i32[0] + (int)v176 - (v175.i32[1] + DWORD1(v176)) + 9) % 9;
              v110 = -1;
              if (v114 <= 6 && ((1 << v114) & 0x49) != 0)
              {
                v139 = sub_1D3E44568(v114, &v175, (float *)v171.i32);
                if (v139 < 0x3A1)
                {
                  v113 = sub_1D3E4464C(v139, v114, 0, 1, 90, a6);
                  v165 = *(_DWORD *)(a6 + 8);
                  v112 = v93 > 0;
                  v111 = v113 > 0;
                  if (v113 >= 1 && v93 >= 1)
                  {
                    v115 = 0;
                    v92 = v93;
                    if (v93 == v113)
                      goto LABEL_170;
                  }
                  goto LABEL_159;
                }
                v110 = v114;
              }
LABEL_158:
              v111 = 0;
              v165 = *(_DWORD *)(a6 + 8);
              v112 = v93 > 0;
              v113 = -1;
              v114 = v110;
LABEL_159:
              if (!a14)
              {
                v92 = v113;
                goto LABEL_222;
              }
              if (v113 != -1)
                v112 = 0;
              if (v112)
              {
                v115 = 0;
                v92 = -1;
              }
              else
              {
                v116 = !v111;
                if (v93 == -1)
                  v115 = v116;
                else
                  v115 = 1;
                v92 = v113;
              }
LABEL_170:
              if ((v115 & 1) == 0 && *(_DWORD *)a6)
              {
                v117 = v93 <= v92 ? v92 : v93;
                v118 = (v117 - 1);
                if (v117 >= 1 && v117 <= *(_DWORD *)(a6 + 4))
                {
                  v119 = *(float *)(*(_QWORD *)(v167 + 64) + 4 * v95);
                  v120 = *(float *)(*(_QWORD *)(v167 + 80) + 4 * (*(_DWORD *)(v167 + 72) - v94 - 5));
                  LODWORD(v170) = 0;
                  v121 = v165;
                  if (v165 > 0)
                  {
                    v168 = v109;
                    v145 = v14;
                    v122 = (float)(v120 - v119) / (float)((float)((float)((float)(v165 + 2) * 17.0) + 17.0) + 7.0);
                    v123 = v122 * 17.0;
                    v124 = v95 + 8;
                    v159 = (v117 - 1);
                    v163 = (_BYTE *)(a6 + v118 + 240);
                    v125 = 30 * (int)v118;
                    v126 = v165;
                    v127 = 0.0;
                    v128 = 2;
                    while (1)
                    {
                      sub_1D3E442E8((uint64_t)v101, (uint64_t)v98, v124, (float *)&v179, 0);
                      if ((float)(vabds_f32(v123, v129) / v123) < 0.03)
                        break;
                      sub_1D3E44194((uint64_t)v101, (uint64_t)v98, v95, (int *)&v170 + 1, &v170, v174, (float *)&v179, v119 + (float)((float)v128 * v123), v123 + (float)(v119 + (float)((float)v128 * v123)), v122);
                      if (!v130)
                      {
                        v124 = v170;
                        v95 = v170;
                        goto LABEL_183;
                      }
LABEL_201:
                      ++v128;
                      ++v125;
                      if (!--v126)
                      {
                        v14 = v145;
                        v118 = v159;
                        v106 = a6;
                        v121 = v165;
                        goto LABEL_221;
                      }
                    }
                    v124 += 4;
LABEL_183:
                    v171.i32[0] = sub_1D3E443CC((uint64_t)&v179, (uint64_t)&v175);
                    v131 = (v175.i32[0] + (int)v176 - (v175.i32[1] + DWORD1(v176)) + 9) % 9;
                    if (v131 <= 6 && ((1 << v131) & 0x49) != 0 && (v131 == v168 || v131 == v114))
                    {
                      v134 = sub_1D3E44568(v131, &v175, (float *)v171.i32);
                      if (v134 <= 0x3A0)
                      {
                        if (!*v163)
                        {
                          *v163 = 1;
                          ++*(_DWORD *)(a6 + 232);
                        }
                        v135 = *(_QWORD *)(a6 + 696);
                        v136 = *(float *)(v135 + 4 * v125);
                        v137 = *(float *)v171.i32;
                        if (v136 <= 0.9 && *(float *)v171.i32 > 0.9)
                          ++*(_DWORD *)(a6 + 236);
                        if (v137 > v136)
                        {
                          *(_WORD *)(*(_QWORD *)(a6 + 704) + 2 * v125) = v134;
                          *(float *)(v135 + 4 * v125) = v137;
                          v136 = v137;
                        }
                        v127 = v127 + v136;
                      }
                    }
                    goto LABEL_201;
                  }
                  v127 = 0.0;
LABEL_221:
                  *(float *)(v106 + 4 * v118 + 332) = v127 / (float)v121;
                }
              }
LABEL_222:
              v15 = v147;
              v21 = 0;
              goto LABEL_223;
            }
LABEL_157:
            v110 = -1;
            goto LABEL_158;
          }
LABEL_211:
          if ((float)(vabds_f32(*(float *)(a4 + 36), v108) / *(float *)(a4 + 36)) >= 0.3)
            goto LABEL_157;
          goto LABEL_212;
        }
      }
      v109 = -1;
      goto LABEL_210;
    }
  }
  ++*a13;
  *a8 = -1;
  *a7 = -1;
  v20 = *(_QWORD *)(a5 + 80);
  v21 = sub_1D3E4E580(a1, a14, (_QWORD *)a5, a9, a10, a11, a12);
  if ((_DWORD)v21)
    return v21;
  v22 = *(_DWORD *)a6;
  v155 = a2;
  if (!a14)
  {
    if (v22)
    {
      v23 = *(_DWORD *)(a6 + 8);
LABEL_19:
      v24 = 1000;
      goto LABEL_20;
    }
LABEL_18:
    v23 = llroundf((float)((float)(vabds_f32(*(float *)(v18 + 52), *(float *)(v18 + 48)) / *(float *)(v18 + 24)) + -69.0)/ 17.0);
    goto LABEL_19;
  }
  if (!v22)
    goto LABEL_18;
  v23 = *(_DWORD *)(a6 + 8);
  v24 = (int)(float)((float)(int)(8 * v23 + 34) * 1.5);
LABEL_20:
  v32 = 7.0;
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v33 = sub_1D3E0418C((uint64_t)&v175, *(float **)a5, *(_DWORD *)(a5 + 8), (float)(7.0 / (float)(int)(34 * v23 + 138)) + 0.5);
  if (v33)
    v34 = v33 <= v24;
  else
    v34 = 0;
  if (!v34)
  {
    sub_1D3E04604((void **)&v175);
    return 2;
  }
  v35 = v33;
  v153 = v24;
  v158 = (_QWORD *)a5;
  v161 = a6;
  v36 = (_DWORD *)(v20 + 56);
  v154 = v20;
  v37 = (_DWORD *)(v20 + 72);
  v170 = 0;
  v149 = (__int32 *)(v18 + 52);
  v150 = (__int32 *)(v18 + 48);
  v38 = -1;
  v21 = 14;
  v39 = 1;
  v156 = -1;
  v162 = -1;
  v40 = -1;
  v146 = v15;
  while (1)
  {
    if (v35 < 24)
      goto LABEL_89;
    v166 = v38;
    v41 = (float *)(*v158 + 4 * (int)(float)(*(float *)v176 + -0.5));
    LODWORD(v41) = *v41 <= v41[1];
    sub_1D3E3BD9C((int *)(v176 + 4 * v41), (v35 - (_DWORD)v41) & 0xFFFFFFFE, (uint64_t)v36, (uint64_t)v37);
    if (v155)
    {
      v43 = *(_DWORD *)(v18 + 40);
      v42 = *(_DWORD *)(v18 + 44);
      v45 = v149;
      v44 = v150;
    }
    else
    {
      v43 = 0;
      v42 = 0;
      v44 = *(__int32 **)(v154 + 64);
      v45 = (__int32 *)(*(_QWORD *)(v154 + 80) + 4 * *(int *)(v154 + 72) - 4);
    }
    if (a3)
    {
      v183 = 0;
      v181 = 0u;
      v182 = 0u;
      memset(v180, 0, sizeof(v180));
      v179 = 0u;
      v46 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
      *(_QWORD *)&v181 = v46;
      *(_OWORD *)((char *)&v180[1] + 4) = 0u;
      *(_OWORD *)((char *)&v180[3] + 4) = 0u;
      *((_QWORD *)v46 + 8) = 0;
      *((_DWORD *)v46 + 18) = 0;
      *((_QWORD *)v46 + 10) = 0;
      *(_OWORD *)v46 = 0u;
      *((_OWORD *)v46 + 1) = 0u;
      *((_OWORD *)v46 + 2) = 0u;
      *(_OWORD *)(v46 + 44) = 0u;
      if (sub_1D3E44A68(*(float **)(v154 + 56), *(_DWORD **)(v154 + 64), *(_QWORD *)(v154 + 72), *(_QWORD *)(v154 + 80), (uint64_t)&v179, 0, 0) != 1)
      {
        sub_1D3E36E54((uint64_t)&v179);
LABEL_88:
        v18 = a4;
        v38 = v166;
        goto LABEL_89;
      }
      v43 = *(_DWORD *)(v181 + 40);
      v42 = *(_DWORD *)(v181 + 44);
      v151 = *(float32x2_t *)(v181 + 48);
      sub_1D3E36E54((uint64_t)&v179);
      v47 = v151;
    }
    else
    {
      v47.i32[0] = *v44;
      v47.i32[1] = *v45;
    }
    v48 = (float32x2_t *)v158[10];
    v48[6] = vcvt_f32_s32(vcvt_s32_f32(v47));
    v48[5].i32[0] = v43;
    v48[5].i32[1] = v42;
    v49 = v162;
    if (*v36 - (v43 + v42) < 12 || *v37 != *v36)
      goto LABEL_55;
    v50 = v14;
    v51 = v156;
    if (v40 <= 0)
    {
      sub_1D3E442E8((uint64_t)v36, (uint64_t)v37, v43 + 4, v174, 0);
      if (!a14 && (float)(vabds_f32(*(float *)(a4 + 32), v52) / *(float *)(a4 + 32)) >= 0.3)
        goto LABEL_50;
      LODWORD(v170) = sub_1D3E443CC((uint64_t)v174, (uint64_t)&v171);
      if (*(float *)&v170 > 0.9)
      {
        v51 = (v171.i32[0] + v172 - (v171.i32[1] + v173) + 9) % 9;
        if (v51 <= 6 && ((1 << v51) & 0x49) != 0)
        {
          v54 = sub_1D3E44568(v51, &v171, (float *)&v170);
          if (v54 > 0x3A0)
            goto LABEL_53;
          v156 = v51;
          v55 = sub_1D3E4464C(v54, v51, 1, 1, 90, v161);
          v40 = v55;
          if (*(_DWORD *)v161)
          {
            if (v55 > *(_DWORD *)(v161 + 4))
              v40 = -1;
            else
              v40 = v55;
          }
          v49 = v162;
LABEL_50:
          v51 = v156;
          goto LABEL_53;
        }
      }
      v51 = -1;
    }
LABEL_53:
    v156 = v51;
    if (v49 <= 0)
    {
      sub_1D3E442E8((uint64_t)v36, (uint64_t)v37, *v36 - v42 - 9, v174, 0);
      v14 = v50;
      if (!a14 && (float)(vabds_f32(*(float *)(a4 + 36), v83) / *(float *)(a4 + 36)) >= 0.3)
      {
        v58 = 0;
        v15 = v146;
        goto LABEL_75;
      }
      LODWORD(v170) = sub_1D3E443CC((uint64_t)v174, (uint64_t)&v171);
      v15 = v146;
      if (*(float *)&v170 <= 0.9)
      {
        v166 = -1;
      }
      else
      {
        v144 = v14;
        v84 = (v171.i32[0] + v172 - (v171.i32[1] + v173) + 9) % 9;
        if (v84 > 6 || ((1 << v84) & 0x49) == 0)
        {
          v166 = -1;
        }
        else
        {
          v86 = sub_1D3E44568(v84, &v171, (float *)&v170);
          v166 = v84;
          if (v86 <= 0x3A0)
          {
            v87 = sub_1D3E4464C(v86, v84, 0, 1, 90, v161);
            if (*(_DWORD *)v161)
            {
              if (v87 > *(_DWORD *)(v161 + 4))
                v49 = -1;
              else
                v49 = v87;
            }
            else
            {
              v49 = v87;
            }
          }
        }
        v14 = v144;
      }
    }
    else
    {
      v14 = v50;
      v15 = v146;
    }
LABEL_55:
    v58 = v40 > 0 && v40 == v49 && v49 > 0;
    if (a14 && !v58)
      v58 = v40 >= 1 && v49 == -1 || v40 == -1 && v49 > 0;
LABEL_75:
    v162 = v49;
    if ((a3 & 1) != 0)
      break;
    if (!*(_DWORD *)v161 && v58)
      break;
    v21 = 0;
    if (!*(_DWORD *)v161 || !v58)
      goto LABEL_88;
    if (v40 <= v162)
      v61 = v162;
    else
      v61 = v40;
    v62 = (v61 - 1);
    if (v61 < 1 || v61 > *(_DWORD *)(v161 + 4))
    {
      v21 = 0;
      goto LABEL_88;
    }
    v63 = *(float *)(*(_QWORD *)(v154 + 64) + 4 * v43);
    v64 = *(float *)(*(_QWORD *)(v154 + 80) + 4 * (*(_DWORD *)(v154 + 72) - v42 - 5));
    v65 = *(int *)(v161 + 8);
    v169 = 0;
    if ((int)v65 > 0)
    {
      v142 = (v61 - 1);
      v143 = v14;
      v152 = 0;
      v66 = (float)(v64 - v63) / (float)((float)((float)((float)(v65 + 2) * 17.0) + 17.0) + v32);
      v67 = v66 * 17.0;
      v68 = v43 + 8;
      v148 = (_BYTE *)(v161 + v62 + 240);
      v69 = 30 * (int)v62;
      v70 = 0.0;
      v71 = 2;
      v141 = v65;
      v72 = v65;
      while (1)
      {
        sub_1D3E442E8((uint64_t)v36, (uint64_t)v37, v68, v174, 0);
        *((float *)&v170 + 1) = v73;
        if ((float)(vabds_f32(v67, v73) / v67) < 0.03)
          break;
        sub_1D3E44194((uint64_t)v36, (uint64_t)v37, v43, (int *)&v179, &v169, (float *)&v170 + 1, v174, v63 + (float)((float)v71 * v67), v67 + (float)(v63 + (float)((float)v71 * v67)), v66);
        if (!v74)
        {
          v68 = v169;
          v43 = v169;
          goto LABEL_99;
        }
LABEL_117:
        ++v69;
        ++v71;
        if (!--v72)
        {
          v14 = v143;
          v15 = v146;
          v32 = 7.0;
          LODWORD(v65) = v141;
          v62 = v142;
          v82 = v152;
          goto LABEL_133;
        }
      }
      v68 += 4;
LABEL_99:
      LODWORD(v170) = sub_1D3E443CC((uint64_t)v174, (uint64_t)&v171);
      v75 = (v171.i32[0] + v172 - (v171.i32[1] + v173) + 9) % 9;
      if (v75 <= 6 && ((1 << v75) & 0x49) != 0 && (v75 == v156 || v75 == v166))
      {
        v78 = sub_1D3E44568(v75, &v171, (float *)&v170);
        if (v78 <= 0x3A0)
        {
          if (!*v148)
          {
            *v148 = 1;
            ++*(_DWORD *)(v161 + 232);
          }
          v79 = *(_QWORD *)(v161 + 696);
          v80 = *(float *)(v79 + 4 * v69);
          v81 = *(float *)&v170;
          if (v80 <= 0.9 && *(float *)&v170 > 0.9)
            ++*(_DWORD *)(v161 + 236);
          if (v81 > v80)
          {
            *(_WORD *)(*(_QWORD *)(v161 + 704) + 2 * v69) = v78;
            *(float *)(v79 + 4 * v69) = v81;
            v80 = v81;
          }
          ++v152;
          v70 = v70 + v80;
        }
      }
      goto LABEL_117;
    }
    v82 = 0;
    v70 = 0.0;
LABEL_133:
    v21 = 0;
    *(float *)(v161 + 4 * v62 + 332) = v70 / (float)(int)v65;
    v18 = a4;
    v38 = v166;
    if (v82 == (_DWORD)v65)
      goto LABEL_140;
LABEL_89:
    if (v39 > 2 || (v35 = sub_1D3E043B8((uint64_t)&v175, *(float *)(v18 + 24)), v35 <= v153))
    {
      if (++v39 != 4)
        continue;
    }
    goto LABEL_140;
  }
  v21 = 0;
LABEL_140:
  sub_1D3E04604((void **)&v175);
  *v15 = v40 - 1;
  v88 = v162 - 1;
LABEL_224:
  *v14 = v88;
  return v21;
}

void sub_1D3E46140(uint64_t a1, float *a2, float *a3, float *a4, float *a5, uint64_t a6, int a7)
{
  int v14;
  unsigned int v15;
  float *v16;
  float v17;
  float *v18;
  float *v19;
  float v20;
  uint64_t i;
  int v22;
  int v23;
  float v24;
  int v25;
  int v26;
  char *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  float v31;
  float v32;
  uint64_t v33;
  int v34;
  float v35;
  float v36;
  float v38;
  float *v39;
  float *v40;
  float v41;
  float v42;
  int v44;
  float v45;
  float v46;
  float v47;
  float *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  int v52;
  void *v53;
  float v54[2];
  float v55[2];
  float v56[2];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v53 = 0;
  v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  v14 = sub_1D3E5178C(*(_QWORD *)(a1 + 32), *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), (float **)&v53, (float *)&v49, (float)(int)roundf(*a2), (float)(int)roundf(a2[1]), (float)(int)roundf(*a3), (float)(int)roundf(a3[1]), 5.0);
  if (v14 < 9)
  {
    *(_QWORD *)a5 = *(_QWORD *)a2;
    *(_QWORD *)a6 = *(_QWORD *)a3;
    v16 = (float *)v53;
    if (!v53)
      return;
    goto LABEL_23;
  }
  v15 = v14;
  v48 = a5;
  v16 = (float *)v53;
  sub_1D3E5194C((float *)v53, v14);
  v17 = *((float *)&v50 + 1)
      + (float)((float)(*((float *)&v49 + 1) * (float)(*a4 - *((float *)&v50 + 3)))
              - (float)(*((float *)&v49 + 2) * (float)(*(float *)&v51 - a4[1])));
  v18 = (float *)malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  v19 = v18;
  v20 = *v16;
  *v18 = *v16;
  for (i = 1; i != v15; ++i)
  {
    v20 = v20 + v16[i];
    v18[i] = v20;
  }
  v22 = v15 >> 2;
  if ((int)(v15 >> 2) >= a7)
    v22 = a7;
  if (a7 >= 2)
    v23 = v22;
  else
    v23 = 2;
  v24 = 1.0 / (float)v23;
  if (v23 + 1 > (int)v17)
    v25 = v23 + 1;
  else
    v25 = (int)v17;
  if ((int)(v15 - 1 - v23) >= v25)
    v26 = v25;
  else
    v26 = v15 - 1 - v23;
  v27 = (char *)malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  bzero(v27, 4 * v15);
  v28 = v26;
  v29 = v26 + 2;
  v30 = v26;
  while (v30 > v23)
  {
    v31 = v19[v30 - 1 - v23];
    v32 = v19[v23 + v30];
    v33 = v30;
    v34 = v30-- + 1;
    v35 = v24 * (float)((float)(v19[v30] - v31) - (float)(v32 - v19[v33]));
    *(float *)&v27[v33 * 4] = v35;
    v36 = *(float *)&v27[4 * v34];
    --v29;
    if (v36 > 0.4 && v36 > v35)
    {
      v38 = (float)v29;
      goto LABEL_25;
    }
  }
  v38 = 0.0;
LABEL_25:
  v56[0] = v38;
  bzero(v27, 4 * v15);
  if (v26 >= (int)(v15 - v23))
  {
LABEL_33:
    v44 = v15 - 1;
  }
  else
  {
    v39 = &v19[v26];
    v40 = (float *)&v27[4 * v26];
    while (1)
    {
      v41 = v24 * (float)((float)(v19[v23 + v28] - *v39) - (float)(*(v39 - 1) - v19[v28 - 1 - v23]));
      *v40 = v41;
      v42 = *(v40 - 1);
      if (v42 > 0.4 && v42 > v41)
        break;
      ++v28;
      ++v39;
      ++v40;
      if (v28 >= (int)(v15 - v23))
        goto LABEL_33;
    }
    v44 = v28 - 1;
  }
  v56[1] = (float)v44;
  sub_1D3E511F8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), (float *)&v49, 2u, v56, v55, v54);
  v45 = v55[1];
  v46 = v54[0];
  v47 = v54[1];
  *v48 = v55[0];
  v48[1] = v46;
  *(float *)a6 = v45;
  *(float *)(a6 + 4) = v47;
  free(v27);
  free(v19);
  if (v16)
LABEL_23:
    free(v16);
}

uint64_t sub_1D3E464E0(float32x2_t *a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v8;
  float32x2_t v9;
  float v10;
  int32x2_t v11;
  float v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char *v17;
  __float2 v18;
  float v19;
  float v20;
  float v21;
  _QWORD *v22;
  float *v23;
  uint64_t v24;
  float *v25;
  char *v26;
  float v27;
  int v28;
  int v29;
  float v30;
  __float2 v31;
  float v32;
  __float2 v33;
  char *v34;
  char *v35;
  uint64_t v36;
  float v37;
  float *v38;
  _QWORD *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  unint64_t v47;
  unint64_t v48;
  float v49;
  float v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  float v56;
  float v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  float v62;
  int v63;
  uint64_t v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  int v73;
  int v74;
  float v75;
  float v76;
  int v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  uint64_t v89;
  float v90;
  uint64_t v91;
  float32x4_t v92;
  float v93;
  float v94;
  float v95;
  float v96;
  int v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  char *v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  int v111;
  float v112;
  unsigned int v113;
  unsigned int v114;
  int v115;
  int v116;
  uint64_t v117;
  float v118;
  char *v119;
  unsigned int v120;
  uint64_t v122;
  char *v123;
  float v124;
  float v125;
  float v126;
  float v127;
  uint64_t v128;
  unsigned int v129;
  int v130;
  float v131;
  float v132;
  float v133;
  float v134;
  char v135;
  int v136;
  unint64_t *v137;
  uint64_t v138;
  int v139;
  uint64_t v140;
  unsigned int v141;
  char *v142;
  int v143;
  int v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  float v148;
  uint64_t v149;
  float v150;
  uint64_t v151;
  float *v153;
  int v154;
  float v155;
  int v157;
  float *v158;
  float v159;
  float v160;
  float *v161;
  int v162;
  uint64_t v163;
  int v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  int v168;
  float v169;
  uint64_t v170;
  int v171;
  int v172;
  float v173;
  float v174;
  int v175;
  float *v176;
  unsigned int v177;
  float v178;
  int v179;
  char v180;
  int v181;
  int v182;
  float v183;
  float v184;
  BOOL v185;
  unint64_t *v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  char *v192;
  uint64_t v193;
  int v194;
  float v195;
  float v196;
  int v197;
  float v198;
  float v199;
  unint64_t v200;
  unint64_t v201;
  float v202;
  float v203;
  float v204;
  float v205;
  float v206;
  float v207;
  float v208;
  float v209;
  float v210;
  float v211;
  float v212;
  float v213;
  float v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  int v246;
  int v247;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  uint64_t v257;
  unint64_t v258;
  unint64_t v259;
  int v260;
  uint64_t v261;
  float v262;
  float v263;
  float v264;
  float v265;
  float v266;
  uint64_t v267;
  _DWORD *v268;
  float v269;
  float v270;
  float v271;
  int v272;
  float v273;
  float v274;
  int v275;
  float v276;
  int v277;
  float v278;
  float v279;
  int v280;
  float v281;
  int v282;
  float v283;
  float v284;
  char v285;
  float v286;
  float v287;
  __int128 *v288;
  uint64_t v289;
  int32x2_t v290;
  float v291;
  float v292;
  float v293;
  int v294;
  int32x2_t v295;
  unint64_t *v296;
  unint64_t v297;
  unint64_t v298;
  uint64_t v299;
  uint64_t v300;
  unint64_t v301;
  int v302;
  int v303;
  __int128 v304;
  _OWORD v305[4];
  char *v306;
  float v307;
  float v308;
  float v309;
  float v310;
  float v311[2];
  float v312[2];
  int v313[2];
  int v314[2];
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  int v319;
  float v320;
  __int128 __src;
  __int128 v322;
  __int128 v323;
  _OWORD v324[2];
  _QWORD v325[8];
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  _QWORD v331[8];
  __int128 v332;
  __int128 v333;
  __int128 v334;
  int v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  int v339;
  _QWORD __dst[87];
  void *v341;
  _WORD *v342;
  float v343;
  float v344;
  float v345;
  float v346;
  unint64_t v347;
  int v348;
  int v349;
  uint64_t v350;
  int v351;
  int v352;
  uint64_t v353;

  v353 = *MEMORY[0x1E0C80C00];
  pthread_once(&stru_1EFE316E0, (void (*)(void))sub_1D3E47FD0);
  v8 = *(_QWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v9.i32[0] = *(_DWORD *)(a3 + 40);
  if (v9.f32[0] >= 0.0)
    v10 = *(float *)(a3 + 40);
  else
    v10 = v9.f32[0] + 6.2832;
  if (*(_BYTE *)(v8 + 28))
    v10 = fmodf(v10 + 3.1416, 6.2832);
  if (*(_BYTE *)(v8 + 30))
  {
    v11 = *(int32x2_t *)(a3 + 32);
    v9.i32[0] = *(_DWORD *)(a3 + 44);
  }
  else
  {
    v9 = a1[7];
    v11 = vcvt_s32_f32(v9);
    v9.f32[0] = (float)(a1[2].i32[0] - a1[1].i32[1]);
  }
  v290 = (int32x2_t)v9;
  if (!*(_BYTE *)(v8 + 29) && *(int *)(v8 + 4) >= 1 && *(int *)(v8 + 12) >= 1 && *(float *)(v8 + 16) > 0.0)
  {
    v11 = *(int32x2_t *)(a3 + 32);
    v9.i32[0] = *(_DWORD *)(a3 + 44);
    v290 = (int32x2_t)v9;
  }
  v295 = v11;
  v306 = 0;
  memset(v305, 0, sizeof(v305));
  v304 = 0u;
  v289 = v8;
  sub_1D3E36D94((int *)v8, (uint64_t)&v304);
  BYTE12(v305[0]) = 0;
  v303 = -1;
  v302 = -1;
  v301 = 1;
  memcpy(__dst, &unk_1D3E7B2F0, sizeof(__dst));
  v342 = malloc_type_calloc(0xA8CuLL, 2uLL, 0x1000040BDFB0063uLL);
  v341 = malloc_type_malloc(0x2A30uLL, 0x100004052888210uLL);
  bzero(v341, 0x2A30uLL);
  v299 = 0;
  v300 = 0;
  v297 = 0;
  v298 = 0;
  v12 = (float)v295.i32[1];
  v14 = *(_DWORD *)(a2 + 28);
  v13 = *(_DWORD *)(a2 + 32);
  v15 = *(_DWORD *)(a2 + 44);
  v16 = *(_DWORD *)(a2 + 48);
  v329 = 0u;
  v330 = 0u;
  v327 = 0u;
  v328 = 0u;
  v326 = 0u;
  v17 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
  v331[0] = v17;
  *((_QWORD *)v17 + 8) = 0;
  *((_DWORD *)v17 + 18) = 0;
  *((_QWORD *)v17 + 10) = 0;
  *(_OWORD *)v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  *((_OWORD *)v17 + 2) = 0u;
  *(_OWORD *)(v17 + 44) = 0u;
  v320 = NAN;
  v319 = -1;
  v18 = __sincosf_stret(v10);
  v19 = v10;
  v20 = v18.__cosval * (float)(*(float *)v290.i32 * 0.5);
  v21 = v18.__sinval * (float)(*(float *)v290.i32 * 0.5);
  v276 = (float)v295.i32[0];
  v296 = a4;
  v281 = v12;
  if (sub_1D3E45078((uint64_t)a4, 1, 1, (uint64_t)&v304, (uint64_t)&v326, (uint64_t)__dst, &v320, &v319, v276 - v20, v12 - v21, v20 + v276, v21 + v12, &v301, 0) >= 2)
  {
    sub_1D3E36F54((uint64_t)&v326);
    v36 = 21;
    v37 = v19;
  }
  else
  {
    v277 = v14;
    v272 = v13;
    v282 = v15;
    v22 = v325;
    v23 = (float *)&v322 + 3;
    v24 = *(_QWORD *)(v331[0] + 64);
    v25 = (float *)(v24 + 4 * *(int *)(v331[0] + 40));
    v286 = (float)(vabds_f32(v25[4], *v25)
                 + vabds_f32(*(float *)(*(_QWORD *)(v331[0] + 80)+ 4 * (*(_DWORD *)(v331[0] + 72) + ~*(_DWORD *)(v331[0] + 44))), *(float *)(v24 + 4 * (*(_DWORD *)(v331[0] + 72) - *(_DWORD *)(v331[0] + 44) - 5))))/ 35.0;
    memset(v324, 0, sizeof(v324));
    v322 = 0u;
    v323 = 0u;
    __src = 0u;
    v26 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
    v325[0] = v26;
    *((_QWORD *)v26 + 8) = 0;
    *((_DWORD *)v26 + 18) = 0;
    *((_QWORD *)v26 + 10) = 0;
    *(_OWORD *)v26 = 0u;
    *((_OWORD *)v26 + 1) = 0u;
    *((_OWORD *)v26 + 2) = 0u;
    *(_OWORD *)(v26 + 44) = 0u;
    if ((float)((float)(v286 * 3.0) * 3.0) <= 2.0)
      v27 = 1.0;
    else
      v27 = (float)((float)(v286 * 3.0) * 3.0) * 0.5;
    v28 = vcvtps_s32_f32(log2f(v27) + 0.5);
    if (v28 <= 1)
      v29 = 1;
    else
      v29 = v28;
    v270 = v19;
    v30 = v19 + -1.57079633;
    v31 = __sincosf_stret(v30);
    v32 = v19 + 1.57079633;
    v33 = __sincosf_stret(v32);
    while (1)
    {
      if (sub_1D3E45078((uint64_t)a4, 1, 1, (uint64_t)&v304, (uint64_t)&__src, (uint64_t)__dst, &v320, &v319, (float)((float)(v31.__cosval * v27) + v276) - v20, (float)((float)(v31.__sinval * v27) + v12) - v21, v20 + (float)((float)(v31.__cosval * v27) + v276), v21 + (float)((float)(v31.__sinval * v27) + v12), &v301, 0) < 2)
      {
        v260 = v16;
        v267 = a2;
        v38 = (float *)&v327 + 3;
        v39 = v331;
        goto LABEL_29;
      }
      sub_1D3E36F54((uint64_t)&__src);
      memset(v324, 0, sizeof(v324));
      v322 = 0u;
      v323 = 0u;
      __src = 0u;
      v34 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
      v325[0] = v34;
      *((_QWORD *)v34 + 8) = 0;
      *((_DWORD *)v34 + 18) = 0;
      *((_QWORD *)v34 + 10) = 0;
      *(_OWORD *)v34 = 0u;
      *((_OWORD *)v34 + 1) = 0u;
      *((_OWORD *)v34 + 2) = 0u;
      *(_OWORD *)(v34 + 44) = 0u;
      if (sub_1D3E45078((uint64_t)a4, 1, 1, (uint64_t)&v304, (uint64_t)&__src, (uint64_t)__dst, &v320, &v319, (float)((float)(v33.__cosval * v27) + v276) - v20, (float)((float)(v33.__sinval * v27) + v12) - v21, v20 + (float)((float)(v33.__cosval * v27) + v276), v21 + (float)((float)(v33.__sinval * v27) + v12), &v301, 0) < 2)break;
      sub_1D3E36F54((uint64_t)&__src);
      memset(v324, 0, sizeof(v324));
      v322 = 0u;
      v323 = 0u;
      __src = 0u;
      v35 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
      v325[0] = v35;
      *((_QWORD *)v35 + 8) = 0;
      *((_DWORD *)v35 + 18) = 0;
      *((_QWORD *)v35 + 10) = 0;
      *(_OWORD *)v35 = 0u;
      *((_OWORD *)v35 + 1) = 0u;
      *((_OWORD *)v35 + 2) = 0u;
      v27 = v27 * 0.5;
      *(_OWORD *)(v35 + 44) = 0u;
      if (!--v29)
      {
        v259 = 0;
        v36 = 21;
        v291 = 0.0;
        v273 = 0.0;
        v283 = 0.0;
        v264 = 0.0;
        v278 = 0.0;
        v262 = 0.0;
        v287 = 0.0;
        v266 = 0.0;
        v258 = 0;
        v257 = 0;
        v261 = 0;
        v8 = v289;
        v37 = v19;
        goto LABEL_52;
      }
    }
    v260 = v16;
    v267 = a2;
    v38 = (float *)&v322 + 3;
    v39 = v325;
    v23 = (float *)&v327 + 3;
    v22 = v331;
LABEL_29:
    v40 = *v22;
    v41 = *(_DWORD *)(*v22 + 44);
    v42 = *(int *)(*v22 + 40);
    v43 = *(_QWORD *)(*v22 + 64);
    v44 = *(_QWORD *)(*v22 + 80);
    v45 = *(_DWORD *)(v44 + 4 * v42);
    LODWORD(v350) = *(_DWORD *)(v43 + 4 * v42);
    HIDWORD(v350) = v45;
    LODWORD(v40) = *(_DWORD *)(v40 + 56) - v41 - 5;
    v46 = *(_DWORD *)(v44 + 4 * (int)v40);
    v351 = *(_DWORD *)(v43 + 4 * (int)v40);
    v352 = v46;
    v47 = *a4;
    v48 = a4[1];
    sub_1D3E511F8(*a4, v48, v23, 4u, (float *)&v350, (float *)&v336, (float *)&v332);
    v49 = (float)(*(float *)&v336 + *((float *)&v336 + 1)) * 0.5;
    v50 = (float)(*(float *)&v332 + *((float *)&v332 + 1)) * 0.5;
    v263 = (float)(*((float *)&v336 + 2) + *((float *)&v336 + 3)) * 0.5;
    v51 = *v39;
    v52 = *(_DWORD *)(*v39 + 44);
    v53 = *(int *)(*v39 + 40);
    v54 = *(_QWORD *)(*v39 + 64);
    v55 = *(_QWORD *)(v51 + 80);
    v56 = *(float *)(v55 + 4 * v53);
    v57 = (float)(*((float *)&v332 + 2) + *((float *)&v332 + 3)) * 0.5;
    v249 = *(float *)(v54 + 4 * v53);
    v347 = __PAIR64__(LODWORD(v56), LODWORD(v249));
    LODWORD(v53) = *(_DWORD *)(v51 + 56) - v52 - 5;
    v58 = *(_DWORD *)(v55 + 4 * (int)v53);
    v348 = *(_DWORD *)(v54 + 4 * (int)v53);
    v349 = v58;
    sub_1D3E511F8(v47, v48, v38, 4u, (float *)&v347, (float *)&v336, (float *)&v332);
    v59 = *(_DWORD *)(*v22 + 72) + ~v41;
    v60 = *(_DWORD *)(v51 + 72);
    a4 = v296;
    v61 = *(_QWORD *)(*v22 + 80);
    v62 = *(float *)(v61 + 4 * v59);
    v63 = v60 + ~v52;
    v64 = *(_QWORD *)(*v22 + 64);
    v65 = *(float *)(v64 + 4 * v42);
    v66 = *(float *)(v55 + 4 * v63);
    v67 = *(float *)(v61 + 4 * v42);
    v68 = *(float *)(v64 + 4 * v59 - 16);
    v69 = *(float *)(v54 + 4 * v63 - 16);
    v318 = 0;
    v317 = 0;
    v316 = 0;
    v315 = 0;
    v70 = (float)(*v296 - 2);
    v71 = (float)(v296[1] - 2);
    v72 = 1.0;
    v255 = v62;
    v256 = v56;
    v253 = v66;
    v254 = v65;
    v251 = v68;
    v252 = v67;
    v250 = v69;
    v265 = (float)(*((float *)&v336 + 2) + *((float *)&v336 + 3)) * 0.5;
    v292 = (float)(*((float *)&v332 + 2) + *((float *)&v332 + 3)) * 0.5;
    if (BYTE14(v305[0]))
    {
      v73 = v277;
      v8 = v289;
      if (v277 >= v282)
      {
        v75 = 1.0;
        a2 = v267;
      }
      else
      {
        a2 = v267;
        if (v272 >= v260)
        {
          v75 = 1.0;
        }
        else
        {
          if (v277 <= 1)
            v73 = 1;
          v72 = (float)v73;
          if (v272 <= 1)
            v74 = 1;
          else
            v74 = v272;
          v75 = (float)v74;
          if (v70 >= (float)v282)
            v70 = (float)v282;
          if (v71 >= (float)v260)
            v71 = (float)v260;
        }
      }
    }
    else
    {
      v75 = 1.0;
      a2 = v267;
      v8 = v289;
    }
    v279 = (float)(*(float *)&v336 + *((float *)&v336 + 1)) * 0.5;
    v284 = (float)(*(float *)&v332 + *((float *)&v332 + 1)) * 0.5;
    v76 = v71;
    sub_1D3E50F40((float *)&v318 + 1, (float *)&v318, (float *)&v317 + 1, (float *)&v317, v49, v50, v279, v284, v72, v70, v75, v71);
    sub_1D3E50F40((float *)&v316 + 1, (float *)&v316, (float *)&v315 + 1, (float *)&v315, v263, v57, v265, v292, v72, v70, v75, v76);
    v345 = *((float *)&v318 + 1);
    v346 = *(float *)&v318;
    v343 = *((float *)&v317 + 1);
    v344 = *(float *)&v317;
    *(float *)v314 = (float)(v49 + v279) * 0.5;
    *(float *)&v314[1] = (float)(v50 + v284) * 0.5;
    v77 = vcvtps_s32_f32(v286 + v286);
    sub_1D3E46140((uint64_t)v296, &v345, &v343, (float *)v314, (float *)&v300, (uint64_t)&v299, v77);
    v313[0] = HIDWORD(v316);
    v313[1] = v316;
    v312[0] = *((float *)&v315 + 1);
    LODWORD(v312[1]) = v315;
    v311[0] = (float)(v263 + v265) * 0.5;
    v311[1] = (float)(v57 + v292) * 0.5;
    sub_1D3E46140((uint64_t)v296, (float *)v313, v312, v311, (float *)&v297, (uint64_t)&v298, v77);
    v261 = v300;
    v257 = v299;
    v258 = v298;
    v259 = v297;
    LODWORD(v283) = v297;
    v278 = *((float *)&v300 + 1);
    v287 = *(float *)&v300;
    v293 = *((float *)&v297 + 1);
    LODWORD(v264) = v298;
    v262 = *((float *)&v299 + 1);
    v266 = *(float *)&v299;
    v274 = *((float *)&v298 + 1);
    if (sub_1D3E50C24(&v310, &v309, &v308, &v307, *(float *)&v300, *((float *)&v300 + 1), *(float *)&v297, *((float *)&v297 + 1), *(float *)&v299, *((float *)&v299 + 1), *(float *)&v298, *((float *)&v298 + 1)) == 2)
    {
      v36 = 22;
      v12 = v281;
      v78 = v293;
      v79 = v274;
      v37 = v270;
    }
    else
    {
      v80 = v283 - v287;
      v78 = v293;
      v81 = v293 - v278;
      v82 = v264 - v266;
      v79 = v274;
      v83 = v274 - v262;
      v84 = sqrtf((float)(v81 * v81) + (float)(v80 * v80));
      v12 = v281;
      v37 = v270;
      if ((float)(vabds_f32(v84, sqrtf((float)(v83 * v83) + (float)(v82 * v82))) / v84) < 0.5
        && (v85 = sqrtf((float)((float)(v262 - v278) * (float)(v262 - v278))+ (float)((float)(v266 - v287) * (float)(v266 - v287))), (float)(vabds_f32(v85, sqrtf((float)((float)(v274 - v293) * (float)(v274 - v293))+ (float)((float)(v264 - v283) * (float)(v264 - v283))))/ v85) < 0.5))
      {
        v36 = 0;
        v86 = (float)((float)((float)(v255 - v251) / (float)(v255 - v254))
                    + (float)((float)(v253 - v250) / (float)(v253 - v249)))
            * 0.55;
        v87 = (float)((float)((float)(v252 - v254) / (float)(v255 - v254))
                    + (float)((float)(v256 - v249) / (float)(v253 - v249)))
            * -0.55;
        v88 = v287 + (float)(v87 * v80);
        *(float *)&v89 = v88;
        v278 = *((float *)&v261 + 1) + (float)(v87 * v81);
        *((float *)&v89 + 1) = v278;
        v90 = *((float *)&v257 + 1) + (float)(v87 * v83);
        *(float *)&v91 = v266 + (float)(v87 * v82);
        v261 = v89;
        v262 = v90;
        *((float *)&v91 + 1) = v90;
        v78 = *((float *)&v259 + 1) + (float)(v86 * v81);
        v283 = v283 + (float)(v86 * v80);
        v287 = v88;
        v79 = *((float *)&v258 + 1) + (float)(v86 * v83);
        v264 = v264 + (float)(v86 * v82);
        v266 = *(float *)&v91;
        v299 = v91;
        v300 = v89;
        v257 = v91;
        v258 = __PAIR64__(LODWORD(v79), LODWORD(v264));
        v297 = __PAIR64__(LODWORD(v78), LODWORD(v283));
        v298 = __PAIR64__(LODWORD(v79), LODWORD(v264));
        v259 = __PAIR64__(LODWORD(v78), LODWORD(v283));
      }
      else
      {
        v36 = 22;
      }
    }
    v273 = v79;
    v291 = v78;
LABEL_52:
    sub_1D3E36F54((uint64_t)&__src);
    sub_1D3E36F54((uint64_t)&v326);
    if (!(_DWORD)v36)
    {
      v92.i64[0] = v261;
      v92.i64[1] = v257;
      *(int32x4_t *)(a2 + 28) = vcvtq_s32_f32(vrndaq_f32(v92));
      v92.i64[0] = v258;
      v92.i64[1] = v259;
      *(int32x4_t *)(a2 + 44) = vcvtq_s32_f32(vrndaq_f32(v92));
      v93 = v266 - v287;
      v94 = v262 - v278;
      v95 = v264 - v283;
      v96 = v273 - v291;
      v97 = __dst[0];
      if (!LODWORD(__dst[0]))
      {
        if (v301 > 0x13)
        {
          v97 = 0;
        }
        else
        {
          do
          {
            v98 = (float)rand() * 4.6566e-10;
            v99 = v287 + (float)(v98 * v93);
            v100 = v278 + (float)(v98 * v94);
            v101 = v283 + (float)(v98 * v95);
            v329 = 0u;
            v330 = 0u;
            v327 = 0u;
            v328 = 0u;
            v102 = v291 + (float)(v98 * v96);
            v326 = 0u;
            v103 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
            v331[0] = v103;
            *((_QWORD *)v103 + 8) = 0;
            *((_DWORD *)v103 + 18) = 0;
            *((_QWORD *)v103 + 10) = 0;
            *(_OWORD *)v103 = 0u;
            *((_OWORD *)v103 + 1) = 0u;
            *((_OWORD *)v103 + 2) = 0u;
            *(_OWORD *)(v103 + 44) = 0u;
            sub_1D3E45078((uint64_t)a4, 0, 0, (uint64_t)&v304, (uint64_t)&v326, (uint64_t)__dst, &v303, &v302, v99, v100, v101, v102, &v301, 0);
            sub_1D3E36F54((uint64_t)&v326);
            v97 = __dst[0];
          }
          while (!LODWORD(__dst[0]) && v301 < 0x14);
        }
      }
      v12 = v281;
      if (v97
        && SHIDWORD(__dst[0]) >= 3
        && SHIDWORD(__dst[0]) <= 90
        && SLODWORD(__dst[1]) >= 1
        && SLODWORD(__dst[1]) <= 30)
      {
        v104 = (float)((float)(v291 - v278) * (float)(v291 - v278))
             + (float)((float)(v283 - v287) * (float)(v283 - v287));
        v105 = (float)(v94 * v94) + (float)(v93 * v93);
        if (v104 <= (float)((float)((float)(v273 - v262) * (float)(v273 - v262))
                           + (float)((float)(v264 - v266) * (float)(v264 - v266))))
          v104 = (float)((float)(v273 - v262) * (float)(v273 - v262))
               + (float)((float)(v264 - v266) * (float)(v264 - v266));
        v106 = sqrtf(v104);
        if (v105 <= (float)((float)(v96 * v96) + (float)(v95 * v95)))
          v105 = (float)(v96 * v96) + (float)(v95 * v95);
        v107 = v106 / (float)((float)((float)((float)(LODWORD(__dst[1]) + 2) * 17.0) + 17.0) + 18.0);
        v108 = 1.0;
        if (v107 > 0.0)
        {
          v109 = 3.0 / v107;
          v110 = 4.0;
          if (v109 <= 4.0)
            v110 = v109;
          if (v109 >= 0.5)
            v108 = v110;
          else
            v108 = 0.5;
        }
        v111 = 2 * HIDWORD(__dst[0]);
        v112 = sqrtf(v105);
        *((float *)v305 + 2) = v108 * *((float *)v305 + 2);
        if (SDWORD1(v304) >= 1 && SHIDWORD(v304) >= 1 && *(float *)v305 > 0.0)
          HIDWORD(v304) = vcvtps_s32_f32(v108 * (float)SHIDWORD(v304));
        v113 = (int)(float)(ceilf(v106 * v108) + 1.0);
        v114 = (int)(float)(ceilf(v112 * v108) + 1.0);
        v323 = 0u;
        memset(v324, 0, 28);
        __src = 0u;
        v322 = 0u;
        sub_1D3E4EFE8(v113, v114, (uint64_t)&__src, *(float *)&v261, *((float *)&v261 + 1), *(float *)&v257, *((float *)&v257 + 1), *(float *)&v258, *((float *)&v258 + 1), *(float *)&v259, *((float *)&v259 + 1));
        v115 = 0;
        v116 = 0;
        v117 = 0;
        do
        {
          v329 = 0u;
          v330 = 0u;
          v327 = 0u;
          v328 = 0u;
          v118 = (float)((float)v115 / (float)(v111 - 1)) * (float)(int)(v114 - 1);
          v326 = 0u;
          v119 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
          v331[0] = v119;
          *((_QWORD *)v119 + 8) = 0;
          *((_DWORD *)v119 + 18) = 0;
          *((_QWORD *)v119 + 10) = 0;
          *(_OWORD *)v119 = 0u;
          *((_OWORD *)v119 + 1) = 0u;
          *((_OWORD *)v119 + 2) = 0u;
          *(_OWORD *)(v119 + 44) = 0u;
          sub_1D3E45078((uint64_t)a4, 0, 0, (uint64_t)&v304, (uint64_t)&v326, (uint64_t)__dst, &v303, &v302, 0.0, v118, (float)(int)(v113 - 1), v118, &v301, (float *)&__src);
          if (v303 >= 0)
            v120 = -1;
          else
            v120 = v302;
          if (v302 < 0 || v303 == v302)
            v122 = v303;
          else
            v122 = v120;
          if ((v122 & 0x80000000) != 0 || SHIDWORD(__dst[0]) <= (int)v122)
          {
            v122 = v117;
          }
          else if ((int)v122 >= (int)v117)
          {
            v116 -= (int)v122 > (int)v117;
          }
          else
          {
            ++v116;
          }
          sub_1D3E36F54((uint64_t)&v326);
          ++v115;
          v117 = v122;
          a4 = v296;
        }
        while (v111 != v115);
        if (v116 > 0)
        {
          *(int8x16_t *)(a2 + 28) = vextq_s8(*(int8x16_t *)(a2 + 28), *(int8x16_t *)(a2 + 28), 8uLL);
          *(int8x16_t *)(a2 + 44) = vextq_s8(*(int8x16_t *)(a2 + 44), *(int8x16_t *)(a2 + 44), 8uLL);
        }
      }
      v36 = sub_1D3E47FF4((uint64_t)__dst, a2);
      v8 = v289;
      v37 = v270;
      if (!(_DWORD)v36)
      {
        if (v342[1] == 920)
          *(_DWORD *)(a2 + 4) = 3;
        sub_1D3E36D94((int *)&v304, v289);
        v36 = 0;
      }
    }
  }
  sub_1D3E44148(__dst);
  sub_1D3E36D4C((uint64_t)&v304);
  if (!(_DWORD)v36)
    return v36;
  if (!*(_BYTE *)(v8 + 29))
    return 21;
  memcpy(__dst, &unk_1D3E7B2F0, sizeof(__dst));
  v342 = malloc_type_calloc(0xA8CuLL, 2uLL, 0x1000040BDFB0063uLL);
  v341 = malloc_type_malloc(0x2A30uLL, 0x100004052888210uLL);
  bzero(v341, 0x2A30uLL);
  memset(v305, 0, sizeof(v305));
  v304 = 0u;
  v123 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
  v306 = v123;
  *((_QWORD *)v123 + 8) = 0;
  *((_DWORD *)v123 + 18) = 0;
  *((_QWORD *)v123 + 10) = 0;
  *(_OWORD *)v123 = 0u;
  *((_OWORD *)v123 + 1) = 0u;
  *((_OWORD *)v123 + 2) = 0u;
  *(_OWORD *)(v123 + 44) = 0u;
  *(int32x2_t *)(v8 + 40) = vadd_s32(*(int32x2_t *)(v8 + 40), (int32x2_t)0x800000004);
  if (*(_BYTE *)(v8 + 28))
    *(float32x2_t *)(v8 + 48) = vsub_f32((float32x2_t)vdup_lane_s32(v290, 0), *(float32x2_t *)(v8 + 48));
  v124 = *(float *)(v8 + 32);
  if (v124 <= 0.0)
    v125 = NAN;
  else
    v125 = v124 + *(float *)(v8 + 48);
  *(float *)(v8 + 48) = v125;
  v126 = *(float *)(v8 + 36);
  if (v126 <= 0.0)
    v127 = NAN;
  else
    v127 = *(float *)(v8 + 52) + (float)(v126 * -2.0);
  *(float *)(v8 + 52) = v127;
  v314[0] = -1;
  v36 = sub_1D3E482B4((uint64_t)a4, 1, 90, v8, (uint64_t)&v304, __dst, v314, 0, v276, v12, v37, *(float *)v290.i32);
  sub_1D3E36F54((uint64_t)&v304);
  if ((_DWORD)v36 || v314[0] < 1)
    goto LABEL_281;
  v268 = (_DWORD *)a2;
  v285 = 0;
  v128 = 0;
  v129 = 0;
  v288 = 0;
  v130 = 0;
  v131 = *(float *)(v8 + 24);
  v132 = v18.__sinval * v131;
  v133 = -(float)(v131 * v18.__cosval);
  v339 = 0;
  v337 = 0u;
  v338 = 0u;
  v336 = 0u;
  v335 = 0;
  v333 = 0u;
  v334 = 0u;
  v332 = 0u;
  v275 = 1;
  v134 = 2147500000.0;
  v271 = -2147500000.0;
  v294 = 4;
  v135 = 1;
  v269 = v127;
  while (1)
  {
    v136 = v314[0];
    v313[0] = v314[0];
    *(float *)(v8 + 48) = v125;
    *(float *)(v8 + 52) = v127;
    if (v129 != 2)
    {
      if (v129 == 3)
      {
        v137 = v296;
        if (SLODWORD(__dst[1]) >= 1)
          memcpy(&v326, &__src, 4 * LODWORD(__dst[1]));
      }
      else
      {
        v137 = v296;
      }
      goto LABEL_180;
    }
    if (!LODWORD(__dst[0]))
      break;
    v138 = v128;
    v139 = __dst[1];
    v140 = (LODWORD(__dst[1]) + 3);
    if (SLODWORD(__dst[1]) >= -2)
    {
      if ((int)v140 <= 1)
        v141 = 1;
      else
        v141 = LODWORD(__dst[1]) + 3;
      memset_pattern16(&__src, &unk_1D3E82250, 4 * v141);
    }
    memset(v305, 0, sizeof(v305));
    v304 = 0u;
    v142 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
    v306 = v142;
    *((_QWORD *)v142 + 8) = 0;
    *((_DWORD *)v142 + 18) = 0;
    *((_QWORD *)v142 + 10) = 0;
    *(_OWORD *)v142 = 0u;
    *((_OWORD *)v142 + 1) = 0u;
    *((_OWORD *)v142 + 2) = 0u;
    v143 = v136 - 1;
    v144 = v136 + 1;
    *(_OWORD *)(v142 + 44) = 0u;
    v137 = v296;
    v145 = sub_1D3E482B4((uint64_t)v296, v143, v144, v8, (uint64_t)&v304, __dst, v313, &__src, v276, v281, v37, *(float *)v290.i32);
    sub_1D3E36F54((uint64_t)&v304);
    if (v145)
      goto LABEL_229;
    if (*(float *)&__src <= 0.0)
    {
      v146 = 0;
      while (v140 != v146)
      {
        v147 = v146++;
        if (*((float *)&__src + v147 + 1) > 0.0)
        {
          if (!(_DWORD)v146)
            goto LABEL_138;
          v148 = *((float *)&__src + (int)v146);
          v149 = (int)v146;
          v150 = *(float *)((char *)&__src + (((v147 << 32) + 0x200000000) >> 30)) - v148;
          goto LABEL_136;
        }
      }
      if ((_DWORD)v140)
      {
        v148 = *((float *)&__src + (int)v140);
        v149 = (int)v140;
        v150 = *((float *)&__src + v139 + 4) - v148;
        LODWORD(v146) = v140;
LABEL_136:
        v151 = v149 - 1;
        do
        {
          v148 = v148 - v150;
          *((float *)&__src + v151) = v148;
        }
        while ((_DWORD)v151--);
        goto LABEL_138;
      }
      LODWORD(v146) = 0;
      v154 = 0;
      v157 = 0;
      if (v320 > 0.0)
        goto LABEL_154;
    }
    else
    {
      LODWORD(v146) = 0;
LABEL_138:
      if (*((float *)&__src + v139 + 2) > 0.0)
        goto LABEL_150;
      if ((_DWORD)v140)
      {
        v153 = &v320 + (int)v140;
        v154 = v140;
        do
          v155 = *v153--;
        while (v155 <= 0.0 && v154-- != 1);
      }
      else
      {
        v154 = 0;
      }
    }
    if (v154 != (_DWORD)v140)
    {
      v158 = (float *)&__src + v154;
      v159 = *v158;
      v160 = *v158 - *(v158 - 1);
      v161 = (float *)&__src + v154 + 1;
      v162 = v140;
      do
      {
        v159 = v160 + v159;
        *v161++ = v159;
        --v162;
      }
      while (v154 != v162);
      v157 = v146;
      goto LABEL_154;
    }
LABEL_150:
    v157 = v146;
    v154 = v140;
LABEL_154:
    if (v157 + 1 < v154)
    {
LABEL_155:
      v163 = v157;
      v164 = -v157;
      while (v154 != v163)
      {
        v165 = v163;
        v166 = v164;
        ++v163;
        --v164;
        if (*((float *)&__src + v165 + 1) <= 0.0)
        {
          if (v154 != (_DWORD)v163)
          {
            v167 = (int)v163;
            while (v154 != v167)
            {
              v168 = v167 + 1;
              v169 = *((float *)&__src + ++v167);
              if (v169 > 0.0)
              {
                v170 = v168;
                v157 = v168;
                goto LABEL_164;
              }
            }
            v170 = v154;
            v157 = v154;
LABEL_164:
            v171 = v163 - 1;
            v172 = v157 - (v163 - 1);
            if (v157 != v171)
            {
              v173 = *((float *)&__src + v171);
              v174 = (float)(*((float *)&__src + v170) - v173) / (float)v172;
              v175 = v157 + v166;
              v176 = (float *)&__src + (int)v165 + 1;
              do
              {
                v173 = v174 + v173;
                *v176++ = v173;
                --v175;
              }
              while (v175);
            }
            if (v157 != v154)
              goto LABEL_155;
          }
          break;
        }
      }
    }
    if (v139 >= -2)
    {
      if ((int)v140 <= 1)
        v177 = 1;
      else
        v177 = v140;
      memcpy(&v326, &__src, 4 * v177);
    }
    v178 = *(float *)(v8 + 24);
    if (v178 <= 5.0)
      v179 = 2;
    else
      v179 = 4;
    v275 = v179;
    v132 = v132 / (float)v179;
    v133 = v133 / (float)v179;
    if (v178 <= 5.0)
      v180 = 1;
    else
      v180 = 2;
    v294 <<= v180;
    v288 = &v326;
    v128 = v138;
LABEL_180:
    v280 = v130;
    if ((v294 & 0x80000000) == 0)
    {
      v181 = 0;
      v182 = 1;
      v183 = v281;
      v184 = v276;
      while (1)
      {
        if (v129 <= 1 && LODWORD(__dst[0]))
          goto LABEL_226;
        v184 = v132 + v184;
        if (v184 < 1.0)
          goto LABEL_226;
        v183 = v133 + v183;
        v185 = v184 > (float)(*v137 - 2) || v183 < 1.0;
        if (v185 || v183 > (float)(v137[1] - 2))
          goto LABEL_226;
        v186 = v137;
        v187 = v313[0];
        memset(&v305[2], 0, 32);
        v188 = ((v135 ^ v285) & 1) != 0 ? v313[0] - v182 : v313[0];
        v189 = ((v135 ^ v285) & 1) != 0 ? v313[0] : v313[0] + v182;
        memset(v305, 0, 32);
        v190 = (v128 & 1) != 0 ? v188 : v313[0] - v182;
        v191 = (v128 & 1) != 0 ? v189 : v313[0] + v182;
        v304 = 0uLL;
        v192 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
        v306 = v192;
        *((_QWORD *)v192 + 8) = 0;
        *((_DWORD *)v192 + 18) = 0;
        *((_QWORD *)v192 + 10) = 0;
        *(_OWORD *)v192 = 0u;
        *((_OWORD *)v192 + 1) = 0u;
        *((_OWORD *)v192 + 2) = 0u;
        *(_OWORD *)(v192 + 44) = 0u;
        v193 = (uint64_t)v186;
        v8 = v289;
        if (!sub_1D3E482B4(v193, v190, v191, v289, (uint64_t)&v304, __dst, v313, v288, v184, v183, v37, *(float *)v290.i32))break;
        if (++v181 / v275 < 2)
          v182 = v181 / v275 + 1;
        else
          v182 = 3;
        v137 = v296;
LABEL_216:
        sub_1D3E36F54((uint64_t)&v304);
        if (v181 > v294)
          goto LABEL_226;
      }
      if ((v128 & 1) != 0)
      {
        v128 = 1;
        goto LABEL_211;
      }
      if (v313[0] == v187)
      {
        v128 = 0;
LABEL_211:
        v137 = v296;
      }
      else
      {
        if (((v135 ^ (v313[0] >= v187)) & 1) != 0)
          v194 = v280 - 1;
        else
          v194 = v280 + 1;
        v137 = v296;
        v280 = v194;
        if (v194 == -2)
        {
          v285 = 0;
          v128 = 1;
        }
        else if (v194 == 2)
        {
          v128 = 1;
          v280 = 2;
          v285 = 1;
        }
        else
        {
          v128 = 0;
        }
      }
      if (v134 >= (float)v313[0])
      {
        v181 = 0;
        v350 = *(_QWORD *)(v289 + 48);
        v336 = *(_OWORD *)((char *)v305 + 12);
        v337 = *(_OWORD *)((char *)&v305[1] + 12);
        v338 = *(_OWORD *)((char *)&v305[2] + 12);
        v339 = HIDWORD(v305[3]);
        v134 = (float)v313[0];
      }
      else
      {
        v181 = 0;
        if (v271 <= (float)v313[0])
        {
          v347 = *(_QWORD *)(v289 + 48);
          v332 = *(_OWORD *)((char *)v305 + 12);
          v333 = *(_OWORD *)((char *)&v305[1] + 12);
          v334 = *(_OWORD *)((char *)&v305[2] + 12);
          v335 = HIDWORD(v305[3]);
          v271 = (float)v313[0];
        }
      }
      goto LABEL_216;
    }
LABEL_226:
    ++v129;
    v132 = -v132;
    v133 = -v133;
    v135 ^= 1u;
    v127 = v269;
    v130 = v280;
    if (v129 == 4)
      goto LABEL_229;
  }
  v137 = v296;
LABEL_229:
  v36 = sub_1D3E47FF4((uint64_t)__dst, (uint64_t)v268);
  if (!(_DWORD)v36)
  {
    if (v342[1] == 920)
      v268[1] = 3;
    v195 = *(float *)(v8 + 32);
    v196 = *(float *)(v8 + 36);
    v197 = __dst[1];
    if (v195 <= 0.0)
    {
      v198 = v196 * (float)~LODWORD(__dst[1]);
      *(float *)&v350 = *((float *)&v350 + 1) + v198;
      *(float *)&v347 = v198 + *((float *)&v347 + 1);
    }
    if (v196 <= 0.0)
    {
      v199 = v195 * (float)(LODWORD(__dst[1]) + 1);
      *((float *)&v350 + 1) = *(float *)&v350 + v199;
      *((float *)&v347 + 1) = *(float *)&v347 + v199;
    }
    v201 = *v137;
    v200 = v137[1];
    sub_1D3E511F8(v201, v200, (float *)&v336, 2u, (float *)&v350, &v345, &v343);
    v203 = v345;
    v202 = v346;
    v204 = v343;
    v205 = v344;
    sub_1D3E511F8(v201, v200, (float *)&v332, 2u, (float *)&v347, &v345, &v343);
    v206 = (float)(17 * v197 + 17);
    v207 = 35.0 / v206;
    v208 = -17.0 / v206;
    v209 = v203 + (float)(v208 * (float)(v202 - v203));
    v210 = v204 + (float)(v208 * (float)(v205 - v204));
    v211 = v202 + (float)(v207 * (float)(v202 - v203));
    v212 = v205 + (float)(v207 * (float)(v205 - v204));
    v213 = v345 + (float)(v208 * (float)(v346 - v345));
    v214 = v343 + (float)(v208 * (float)(v344 - v343));
    v215 = v346 + (float)(v207 * (float)(v346 - v345));
    v216 = v344 + (float)(v207 * (float)(v344 - v343));
    v217 = (float)(int)(float)((float)(v271 - v134) + 1.0);
    v218 = (float)(int)(float)((float)SHIDWORD(__dst[0]) - v271) / v217;
    v219 = (float)-(float)(int)(float)(v134 + -1.0) / v217;
    v220 = v209 + (float)(v219 * (float)(v213 - v209));
    v221 = v210 + (float)(v219 * (float)(v214 - v210));
    v222 = v213 + (float)(v218 * (float)(v213 - v209));
    v223 = v214 + (float)(v218 * (float)(v214 - v210));
    v224 = v211 + (float)(v219 * (float)(v215 - v211));
    v225 = v212 + (float)(v219 * (float)(v216 - v212));
    v226 = v215 + (float)(v218 * (float)(v215 - v211));
    v227 = v216 + (float)(v218 * (float)(v216 - v212));
    if (sub_1D3E50C24(v312, v311, (float *)&v301, (float *)&v300, v220, v221, v224, v225, v222, v223, v226, v227) == 2)
    {
      v36 = 22;
    }
    else
    {
      v36 = 0;
      v228 = llroundf(v220);
      v229 = llroundf(v221);
      v230 = llroundf(v222);
      v231 = llroundf(v223);
      v232 = llroundf(v226);
      v233 = llroundf(v227);
      v234 = llroundf(v224);
      v235 = v201 - 1;
      v236 = v200 - 1;
      if (v228 >= (int)v201 - 1)
        v237 = v201 - 1;
      else
        v237 = v228;
      if (v228 >= 0)
        v238 = v237;
      else
        v238 = 0;
      if (v229 >= v236)
        v239 = v200 - 1;
      else
        v239 = v229;
      v185 = v229 < 0;
      v240 = llroundf(v225);
      if (v185)
        v239 = 0;
      v268[7] = v238;
      v268[8] = v239;
      if (v230 >= v235)
        v241 = v201 - 1;
      else
        v241 = v230;
      if (v230 < 0)
        v241 = 0;
      if (v231 >= v236)
        v242 = v200 - 1;
      else
        v242 = v231;
      if (v231 < 0)
        v242 = 0;
      v268[9] = v241;
      v268[10] = v242;
      if (v232 >= v235)
        v243 = v201 - 1;
      else
        v243 = v232;
      if (v232 < 0)
        v243 = 0;
      if (v233 >= v236)
        v244 = v200 - 1;
      else
        v244 = v233;
      if (v233 < 0)
        v244 = 0;
      v268[11] = v243;
      v268[12] = v244;
      if (v234 >= v235)
        v245 = v201 - 1;
      else
        v245 = v234;
      if (v234 < 0)
        v245 = 0;
      if (v240 >= v236)
        v246 = v200 - 1;
      else
        v246 = v240;
      if (v240 >= 0)
        v247 = v246;
      else
        v247 = 0;
      v268[13] = v245;
      v268[14] = v247;
    }
  }
LABEL_281:
  sub_1D3E44148(__dst);
  return v36;
}

uint64_t sub_1D3E47FD0()
{
  uint64_t result;

  result = sub_1D3E285B4(0x3A1u, 3);
  qword_1EFE31A18 = result;
  return result;
}

uint64_t sub_1D3E47FF4(uint64_t a1, uint64_t a2)
{
  int v3;
  BOOL v4;
  int v6;
  BOOL v7;
  BOOL v8;
  unsigned int v9;
  int v10;
  int v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  unsigned int v16;
  unsigned int v17;
  int v18;
  void *v20;
  size_t v21;
  char *v22;
  char *v23;
  unsigned int *v24;
  unsigned int *v25;
  int v26;
  unsigned int v27;
  int v28;
  signed int v29;
  int v30;
  char *v31;
  int v32;
  float *v33;
  __int16 *v34;
  __int16 v35;
  int v36;
  int v37;

  v3 = *(_DWORD *)(a1 + 4);
  if (*(_DWORD *)a1)
    v4 = v3 < 3;
  else
    v4 = 1;
  if (v4)
    goto LABEL_16;
  v6 = *(_DWORD *)(a1 + 8);
  v7 = v3 > 90 || v6 < 1;
  v8 = !v7 && v6 <= 30;
  if (!v8
    || (v9 = *(_DWORD *)(a1 + 12), v9 > 8)
    || (v10 = v6 * v3, v11 = *(_DWORD *)(a1 + 236), v12 = __OFSUB__(v10, v11), v13 = v10 - v11, (v13 < 0) ^ v12))
  {
LABEL_16:
    *(_DWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 8) = 0;
    return 6;
  }
  *(_DWORD *)(a2 + 24) = 0;
  v16 = 2 << v9;
  v17 = v10 - (2 << v9);
  v18 = (2 << v9) - 2;
  if (v13 > v18 || (int)v17 < 1)
    return 6;
  *(_QWORD *)(a2 + 8) = 2 * v10;
  v20 = *(void **)(a2 + 16);
  if (v20)
  {
    free(v20);
    *(_QWORD *)(a2 + 16) = 0;
  }
  v21 = v10;
  v22 = (char *)malloc_type_calloc(v10, 2uLL, 0x1000040BDFB0063uLL);
  v23 = (char *)malloc_type_calloc(v21, 2uLL, 0x1000040BDFB0063uLL);
  v24 = (unsigned int *)malloc_type_calloc(v21, 4uLL, 0x100004052888210uLL);
  v25 = v24;
  if (!v22 || !v23 || !v24)
  {
    if (v23)
      free(v23);
    *(_DWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v14 = 15;
    if (!v22)
      goto LABEL_46;
    goto LABEL_45;
  }
  v26 = *(_DWORD *)(a1 + 4);
  if (v26 < 1)
  {
    v29 = 0;
  }
  else
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = *(_DWORD *)(a1 + 8);
    v31 = v22;
    do
    {
      if (v30 >= 1)
      {
        v32 = 0;
        v33 = (float *)(*(_QWORD *)(a1 + 696) + 4 * v27);
        v34 = (__int16 *)(*(_QWORD *)(a1 + 704) + 2 * v27);
        do
        {
          v35 = *v34++;
          *(_WORD *)v31 = v35;
          v31 += 2;
          if (*v33 < 0.9)
          {
            v24[v29++] = v32 + v28 * v30;
            v30 = *(_DWORD *)(a1 + 8);
          }
          ++v32;
          ++v33;
        }
        while (v32 < v30);
        v26 = *(_DWORD *)(a1 + 4);
      }
      ++v28;
      v27 += 30;
    }
    while (v28 < v26);
  }
  v37 = 0;
  if (sub_1D3E287FC(qword_1EFE31A18, v22, v17, &v22[2 * v17], v16, v24, v29, &v37, v23, &v23[2 * v17]))
    goto LABEL_44;
  v36 = v37 - v29;
  if (v37 - v29 > 3 || *(int *)(a1 + 12) < 1)
  {
    if (v29 + 2 * v36 <= v18)
    {
LABEL_53:
      v14 = 0;
      *(_DWORD *)(a2 + 24) = 1065353216;
      *(_QWORD *)(a2 + 16) = v23;
      *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 4);
      goto LABEL_45;
    }
  }
  else if (v29 + 2 * v36 <= (int)(v16 - 3))
  {
    goto LABEL_53;
  }
LABEL_44:
  free(v23);
  *(_QWORD *)(a2 + 8) = 0;
  v14 = 5;
LABEL_45:
  free(v22);
LABEL_46:
  if (v25)
    free(v25);
  return v14;
}

uint64_t sub_1D3E482B4(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, _DWORD *a6, int *a7, _DWORD *a8, float a9, float a10, float a11, float a12)
{
  float v22;
  __float2 v23;
  uint64_t v24;
  uint64_t result;
  float v26;
  int v27;
  int v28;
  float v29;
  int v30;
  int v31;
  int v32;
  _DWORD *v33;
  char v34;
  float v35;
  float v36;
  float v37;
  int v38;
  float v39;
  _DWORD *v40;
  int v41;
  char v42;
  float v43;
  int v44;
  uint64_t v45;
  char v46;
  float *v47;
  int v48;
  BOOL v49;
  uint64_t v50;
  signed int v51;
  float *v52;
  float v53;
  unsigned int v54;
  BOOL v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  _DWORD *v59;
  uint64_t v60;
  int v61;
  signed int v62;
  float *v63;
  float v64;
  unsigned int v65;
  BOOL v66;
  unsigned int v67;
  uint64_t v68;
  _DWORD *v69;
  int v70;
  uint64_t v71;
  int v72;
  unsigned int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  float v79;
  int v80;
  int v81;
  int v82;
  float v83;
  int v84;
  int v85;
  uint64_t v86;
  float v87;
  float v88;
  float v89;
  float v90;
  BOOL v91;
  float v92;
  float v93;
  BOOL v94;
  float v95;
  float v96;
  float *v97;
  uint64_t v98;
  uint64_t v99;
  float v100;
  unsigned int v101;
  unsigned int v103;
  float v104;
  unsigned int v105;
  uint64_t v106;
  _DWORD *v107;
  uint64_t v108;
  float v109;
  _DWORD *v110;
  _DWORD *v111;
  int v112;
  int v113;
  signed int v114;
  int v115;
  float v116;
  float v117;
  float v118;
  float v119;
  uint64_t v120;
  int v121;
  int v122;
  char v123;
  uint64_t v124;
  int *v125;
  _DWORD *v126;
  int v127;
  int v128;
  int v129;
  _DWORD *v130;
  unsigned int v131;
  int v132;
  uint64_t v133;
  float v134;
  _DWORD *v135;
  int *v136;
  int v137;
  uint64_t v138;
  _DWORD *v139;
  uint64_t v140;
  int v141;
  float v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  int32x4_t v147;
  int v148;
  int v149;
  float v150[6];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v22 = a12 * 0.5;
  v23 = __sincosf_stret(a11);
  v24 = *(_QWORD *)(a5 + 80);
  result = sub_1D3E4E580(a1, 0, (_QWORD *)a5, a9 - (float)(v23.__cosval * v22), a10 - (float)(v23.__sinval * v22), (float)(v23.__cosval * v22) + a9, (float)(v23.__sinval * v22) + a10);
  if ((_DWORD)result)
    return result;
  v135 = a8;
  if (*a6)
  {
    v26 = (float)((float)*(int *)(a4 + 40) + (float)((float)(8 * a6[2] + 34) * 1.5)) + (float)*(int *)(a4 + 44);
  }
  else if (*(_BYTE *)(a4 + 30))
  {
    v26 = 288.0;
  }
  else
  {
    v26 = 1000.0;
  }
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v27 = sub_1D3E0418C((uint64_t)&v143, *(float **)a5, *(_DWORD *)(a5 + 8), 0.5);
  if (!v27 || (v28 = v27, v27 > (int)v26))
  {
    sub_1D3E04604((void **)&v143);
    return 2;
  }
  v140 = v24 + 72;
  v29 = *(float *)(a4 + 32);
  v133 = *(unsigned int *)(a4 + 40);
  if (a2 >= 90)
    v30 = 90;
  else
    v30 = a2;
  if (v30 <= 1)
    v30 = 1;
  if (a3 >= 90)
    v31 = 90;
  else
    v31 = a3;
  if (v31 <= 1)
    v32 = 1;
  else
    v32 = v31;
  v125 = a7;
  if (*a6 && v32 >= a6[1])
    v32 = a6[1];
  v33 = a8;
  v34 = 0;
  v138 = v24;
  v136 = (int *)(v24 + 56);
  v35 = *(float *)(a4 + 36);
  v36 = *(float *)(a4 + 48);
  v37 = *(float *)(a4 + 52);
  v132 = *(_DWORD *)(a4 + 44);
  v114 = v32;
  v115 = v30;
  if (v32 - v30 <= 1)
    v38 = 1;
  else
    v38 = 2;
  v39 = *(float *)(a4 + 24) * (float)v38;
  v40 = a8 + 1;
  v130 = a8 + 1;
  if (!a8)
    v40 = 0;
  v139 = v40;
  if (v29 <= 0.0)
    v41 = -4;
  else
    v41 = 4;
  v112 = v41;
  v134 = -1.0;
  v129 = -1;
  v42 = 1;
  v128 = -1;
  v43 = -1.0;
  v44 = -1;
  v137 = -1;
  v45 = 0xFFFFFFFFLL;
  v126 = a6;
  v120 = a5;
  v124 = a4;
  v118 = *(float *)(a4 + 48);
  v119 = *(float *)(a4 + 36);
  v116 = v39;
  v117 = *(float *)(a4 + 52);
  while (1)
  {
    v46 = v34;
    if (v28 < 16)
      goto LABEL_100;
    v47 = (float *)(*(_QWORD *)a5 + 4 * (int)(float)(*(float *)v144 + -0.5));
    LODWORD(v47) = *v47 <= v47[1];
    sub_1D3E3BD9C((int *)(v144 + 4 * v47), (v28 - (_DWORD)v47) & 0xFFFFFFFE, (uint64_t)v136, v140);
    v48 = *v136;
    v49 = v29 > 0.0 && (int)v45 <= 0;
    v141 = *v136;
    if (!v49)
      goto LABEL_60;
    v50 = v45;
    v51 = v133;
    if ((v133 & 0x80000000) != 0 || (int)v133 >= v48)
    {
      v52 = *(float **)(v138 + 64);
    }
    else
    {
      v52 = *(float **)(v138 + 64);
      if (vabds_f32(v52[v133], v36) <= v39)
        goto LABEL_44;
    }
    v51 = sub_1D3E48DCC(*(_QWORD *)v136, v52, v36);
LABEL_44:
    sub_1D3E442E8((uint64_t)v136, v140, v51, v150, 0);
    v43 = v53;
    if ((float)(vabds_f32(*(float *)(a4 + 32), v53) / *(float *)(a4 + 32)) >= 0.2)
      goto LABEL_58;
    v142 = sub_1D3E443CC((uint64_t)v150, (uint64_t)&v147);
    if (v142 <= 0.9
      || ((v54 = (v147.i32[0] + v148 - (v147.i32[1] + v149) + 9) % 9, v54 <= 6)
        ? (v55 = ((1 << v54) & 0x49) == 0)
        : (v55 = 1),
          v55))
    {
      v128 = -1;
LABEL_58:
      v45 = v50;
LABEL_59:
      v48 = v141;
      goto LABEL_60;
    }
    v128 = (v147.i32[0] + v148 - (v147.i32[1] + v149) + 9) % 9;
    v56 = sub_1D3E44568(v54, &v147, &v142);
    if (v56 > 0x3A0 || v142 <= 0.9)
      goto LABEL_58;
    v57 = sub_1D3E4464C(v56, v128, 1, v115, v114, (uint64_t)a6);
    if ((int)v57 < 1)
    {
      v45 = v57;
      goto LABEL_59;
    }
    *(_DWORD *)(a4 + 40) = v51;
    v58 = *(_QWORD *)(v138 + 64);
    *(_DWORD *)(a4 + 48) = *(_DWORD *)(v58 + 4 * v51);
    v48 = v141;
    if (v33 && *a6)
    {
      v59 = (_DWORD *)(v58 + 4 * v51);
      *v33 = *v59;
      v33[1] = v59[4];
    }
    v45 = v57;
LABEL_60:
    if (v35 <= 0.0 || v137 > 0)
      goto LABEL_81;
    v60 = v45;
    v61 = v48 - 1;
    v62 = v48 - 1 - v132;
    if (v62 < 0 || v62 >= v48)
    {
      v63 = *(float **)(v138 + 64);
    }
    else
    {
      v63 = *(float **)(v138 + 64);
      if (vabds_f32(v63[v62], v37) <= v39)
        goto LABEL_68;
    }
    v62 = sub_1D3E48DCC(*(_QWORD *)v136, v63, v37);
LABEL_68:
    sub_1D3E442E8((uint64_t)v136, v140, v62, v150, 0);
    v134 = v64;
    if ((float)(vabds_f32(*(float *)(a4 + 36), v64) / *(float *)(a4 + 36)) >= 0.2)
      goto LABEL_90;
    v142 = sub_1D3E443CC((uint64_t)v150, (uint64_t)&v147);
    if (v142 <= 0.9
      || ((v65 = (v147.i32[0] + v148 - (v147.i32[1] + v149) + 9) % 9, v65 <= 6)
        ? (v66 = ((1 << v65) & 0x49) == 0)
        : (v66 = 1),
          v66))
    {
      v129 = -1;
LABEL_90:
      v48 = v141;
      v45 = v60;
      v33 = v135;
      if ((int)v60 <= 0)
        goto LABEL_99;
LABEL_91:
      v44 = v45 - 1;
      goto LABEL_92;
    }
    v129 = (v147.i32[0] + v148 - (v147.i32[1] + v149) + 9) % 9;
    v67 = sub_1D3E44568(v65, &v147, &v142);
    if (v67 > 0x3A0)
      goto LABEL_90;
    if (v142 <= 0.9)
      goto LABEL_90;
    v137 = sub_1D3E4464C(v67, v129, 0, v115, v114, (uint64_t)a6);
    if (v137 < 1)
      goto LABEL_90;
    *(_DWORD *)(a4 + 44) = v61 - v62;
    v68 = *(_QWORD *)(v138 + 64);
    *(_DWORD *)(a4 + 52) = *(_DWORD *)(v68 + 4 * v62);
    v33 = v135;
    v48 = v141;
    if (v135 && *a6)
    {
      v69 = (_DWORD *)(v68 + 4 * v62);
      v70 = a6[2];
      v135[v70 + 1] = *v69;
      v135[v70 + 2] = v69[4];
    }
    v45 = v60;
LABEL_81:
    v44 = v45 - 1;
    if ((int)v45 < 1 || v137 < 1)
    {
      if ((int)v45 >= 1)
        goto LABEL_91;
      v44 = v137 <= 0 ? -1 : v137 - 1;
    }
    else if ((_DWORD)v45 == v137)
    {
      v137 = v45;
    }
    else
    {
      v72 = *v125;
      if (*v125 < 1)
      {
        v45 = 0xFFFFFFFFLL;
        v137 = -1;
        goto LABEL_99;
      }
      v73 = v45 - v72;
      if ((int)v45 - v72 < 0)
        v73 = v72 - v45;
      v74 = v137 - v72;
      if (v74 < 0)
        v74 = -v74;
      v75 = v73 >= v74 ? v137 : v45;
      v44 = v75 - 1;
    }
LABEL_92:
    if (!*a6)
      break;
    if (v44 < 0 || v44 >= a6[1])
      goto LABEL_99;
    v131 = v45;
    if (v29 <= 0.0)
    {
      v71 = (v48 + ~*(_DWORD *)(a4 + 44) - 4);
      if ((v71 & 0x80000000) != 0)
        goto LABEL_189;
    }
    else
    {
      v71 = (*(_DWORD *)(a4 + 40) + 4);
      if ((v71 & 0x80000000) != 0)
        goto LABEL_189;
    }
    if ((int)v71 + 4 >= v48)
    {
LABEL_189:
      v45 = v131;
      goto LABEL_100;
    }
    v76 = v129;
    if (v44 + 1 == v131)
      v76 = v128;
    v77 = v76 - 3;
    if (!v76)
      v77 = 6;
    v121 = v77;
    if (v76 == 6)
      v78 = 0;
    else
      v78 = v76 + 3;
    v113 = v78;
    if (v29 <= 0.0)
      v79 = v134;
    else
      v79 = v43;
    v122 = a6[2];
    v123 = v46;
    v80 = v122 - 1;
    if (v122 >= 1)
    {
      v81 = 0;
      v82 = 0;
      v127 = 0;
      v83 = *(float *)(v124 + 24) * 1.5;
      while (1)
      {
        v84 = v82;
        if (v29 <= 0.0)
          v85 = v80;
        else
          v85 = v81;
        v82 = 14;
        if (!v84 && (v71 & 0x80000000) == 0 && (int)v71 + 4 < v48)
        {
          v86 = *(_QWORD *)(v138 + 64);
          v87 = *(float *)(v86 + 4 * v71);
          v88 = *(float *)(v86 + 4 * (v71 + 4));
          if (v33)
          {
            v89 = *(float *)&v130[v85];
            v49 = v89 <= 0.0;
            v90 = vabds_f32(v87, v89);
            v91 = v49 || v90 <= v83;
            if (!v91
              || ((v92 = *(float *)&v130[v85 + 1], v49 = v92 <= 0.0, v93 = vabds_f32(v88, v92), !v49)
                ? (v94 = v93 <= v83)
                : (v94 = 1),
                  !v94))
            {
              v82 = 7;
              goto LABEL_148;
            }
          }
          if ((float)(vabds_f32(v79, v88 - v87) / v79) < 0.2)
            v82 = 1;
          else
            v82 = 14;
        }
        if (!v33)
          goto LABEL_159;
LABEL_148:
        if (v82 == 1)
        {
LABEL_159:
          v99 = v71;
          if (v82 == 1)
          {
LABEL_160:
            sub_1D3E442E8((uint64_t)v136, v140, v99, v150, 0);
            v142 = sub_1D3E443CC((uint64_t)v150, (uint64_t)&v147);
            if (v142 <= 0.9)
            {
              v82 = 1;
              goto LABEL_174;
            }
            v101 = (v147.i32[0] + v148 - (v147.i32[1] + v149) + 9) % 9;
            if (v101 > 6 || ((1 << v101) & 0x49) == 0)
            {
              v82 = 1;
            }
            else
            {
              v103 = sub_1D3E44568(v101, &v147, &v142);
              v82 = 1;
              if (v103 <= 0x3A0)
              {
                v104 = v142;
                if (v142 > 0.9)
                {
                  v105 = v85 + 30 * v44;
                  if (v101 == v121)
                  {
                    v33 = v135;
                    v106 = v138;
                    v107 = v130;
                    if (v44)
                    {
                      v105 -= 30;
LABEL_181:
                      if ((v105 & 0x80000000) == 0)
                      {
                        v108 = *((_QWORD *)v126 + 87);
                        v109 = *(float *)(v108 + 4 * v105);
                        if (v109 <= 0.9)
                          ++v126[59];
                        if (v104 > v109)
                        {
                          *(_WORD *)(*((_QWORD *)v126 + 88) + 2 * v105) = v103;
                          *(float *)(v108 + 4 * v105) = v104;
                        }
                        if (v33)
                        {
                          v110 = (_DWORD *)(*(_QWORD *)(v106 + 64) + 4 * (int)v99);
                          v111 = &v107[v85];
                          *v111 = *v110;
                          v111[1] = v110[4];
                        }
                        v82 = 0;
                        ++v127;
                        v99 = (v99 + v112);
                      }
                    }
                  }
                  else
                  {
                    v55 = v101 == v113;
                    v33 = v135;
                    v106 = v138;
                    v107 = v130;
                    if (!v55)
                      goto LABEL_181;
                    if (v44 <= 0x58)
                    {
                      v105 += 30;
                      goto LABEL_181;
                    }
                  }
LABEL_174:
                  v48 = v141;
                  goto LABEL_175;
                }
              }
            }
LABEL_173:
            v33 = v135;
            goto LABEL_174;
          }
          goto LABEL_156;
        }
        v95 = *(float *)&v139[v85];
        if (v95 > 0.0)
        {
          v96 = *(float *)&v139[v85 + 1];
          if (v96 > 0.0)
          {
            v97 = *(float **)(v138 + 64);
            v98 = sub_1D3E48DCC(*(_QWORD *)(v138 + 56), v97, *(float *)&v139[v85]);
            if ((_DWORD)v98 == (_DWORD)v71)
            {
              v99 = v71;
              goto LABEL_173;
            }
            v99 = v98;
            v48 = v141;
            if ((v98 & 0x80000000) != 0 || (int)v98 + 4 >= v141 || vabds_f32(v97[v98], v95) >= v83)
            {
              v99 = v71;
              v33 = v135;
              goto LABEL_175;
            }
            v100 = vabds_f32(v97[(v98 + 4)], v96);
            v33 = v135;
            if (v100 < v83)
              goto LABEL_160;
          }
        }
LABEL_156:
        v99 = v71;
LABEL_175:
        ++v81;
        --v80;
        v71 = v99;
        if (v80 == -1)
          goto LABEL_192;
      }
    }
    v127 = 0;
LABEL_192:
    v46 = v123;
    a6 = v126;
    a5 = v120;
    a4 = v124;
    v36 = v118;
    v35 = v119;
    v39 = v116;
    v37 = v117;
    v45 = v131;
    if (v127 == v122)
    {
LABEL_196:
      sub_1D3E04604((void **)&v143);
      if ((v44 & 0x80000000) == 0)
        goto LABEL_197;
      return 13;
    }
LABEL_100:
    if ((v42 & 1) == 0 || (v28 = sub_1D3E043B8((uint64_t)&v143, *(float *)(a4 + 24)), v28 <= (int)v26))
    {
      v42 = 0;
      v34 = 1;
      if ((v46 & 1) == 0)
        continue;
    }
    goto LABEL_196;
  }
  if (v44 < 0)
  {
LABEL_99:
    v44 = -1;
    goto LABEL_100;
  }
  sub_1D3E04604((void **)&v143);
LABEL_197:
  result = 0;
  *v125 = v44 + 1;
  return result;
}

uint64_t sub_1D3E48DCC(int a1, float *a2, float a3)
{
  uint64_t result;
  uint64_t v5;
  float v6;
  float v7;
  float v9;
  float v10;

  result = (a1 - 1);
  if ((float)((float)(*a2 + a2[(int)result]) * 0.5) <= a3)
  {
    if (a1 < 1)
      return 0;
    v5 = result;
    while (1)
    {
      v7 = a2[v5];
      if (v7 < a3)
        break;
      if (v5-- <= 0)
        return 0;
    }
    result = (v5 + 1);
    if ((int)result >= a1)
      return v5;
    v9 = a2[result] - a3;
    v10 = a3 - v7;
  }
  else
  {
    if (a1 < 1)
      return result;
    v5 = 0;
    while (1)
    {
      v6 = a2[v5];
      if (v6 > a3)
        break;
      if (a1 == ++v5)
        return result;
    }
    if (!(_DWORD)v5)
      return v5;
    result = (v5 - 1);
    v9 = a3 - a2[result];
    v10 = v6 - a3;
  }
  if (v9 >= v10)
    return v5;
  return result;
}

uint64_t sub_1D3E48E8C(uint64_t result, char *a2, std::string::size_type a3, size_t *a4, const char *a5)
{
  unint64_t v5;
  unsigned __int16 *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;

  v5 = *(_QWORD *)(result + 8);
  if (v5 >= 4)
  {
    v9 = *(unsigned __int16 **)(result + 16);
    v10 = v5 >> 1;
    if (v10 >= *v9)
      v11 = *v9;
    else
      v11 = v10;
    result = sub_1D3E4F654((uint64_t)v9, 1uLL, v11, a2, a3, a4, a5);
    if ((result & 1) != 0)
    {
      v12 = a3 - 1;
      if (a3 - 1 >= *a4)
        v12 = *a4;
      a2[v12] = 0;
    }
    else
    {
      *a2 = 0;
      *a4 = 0;
    }
  }
  return result;
}

BOOL sub_1D3E48F14(int a1, uint64_t a2, int a3)
{
  return a1 > 8 && a3 > 9;
}

BOOL sub_1D3E48F24(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BOOL8 v11;
  __CFData *Mutable;
  __CFData *v13;
  UInt8 *MutableBytePtr;
  uint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  const void *v19;
  uint64_t v20;
  unint64_t v21;
  void **v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  double v26;
  double v27;
  unint64_t v28;
  double *v29;
  double *v30;
  double *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  double *v37;
  double *v38;
  unint64_t v39;
  unint64_t v40;
  void **v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  double v46;
  double v47;
  unint64_t v48;
  double *v49;
  double *v50;
  double *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  double *v57;
  double *v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  __int16 v62;
  unint64_t v63;
  int v64;
  unint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  const void *v68;
  unint64_t v69;
  unint64_t *v70;
  unint64_t v71;
  const void *v72;
  unint64_t v73;
  unint64_t *v74;
  unint64_t v75;
  const void *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t *v84;
  unint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (**v97)(_QWORD);
  int v98;
  uint64_t v99;
  _OWORD *v100;
  void **v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t *v105;

  if (*a1)
  {
    v99 = 0;
    v100 = sub_1D3DB36B4();
    v4 = *a1;
    v98 = 0;
    v97 = &off_1E95AF9B0;
    v5 = *(_QWORD *)(v4 + 40);
    if (v5)
    {
      v6 = (unsigned int *)(v5 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    v99 = v5;
    v9 = *(_QWORD *)(v5 + 16);
    v8 = *(_QWORD *)(v5 + 24);
    v10 = v8 - v9 - 1;
    v11 = v10 < 0xB8C;
    if (v10 >= 0xB8C)
      goto LABEL_113;
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8 - v9);
    v13 = Mutable;
    if (Mutable)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      CFDataSetLength(v13, v8 - v9);
      if (v8 != v9)
      {
        v15 = 0;
        do
        {
          MutableBytePtr[v15] = *(_BYTE *)(*(_QWORD *)(v99 + 16) + v15);
          ++v15;
        }
        while (v8 - v9 != v15);
      }
      v101 = (void **)v13;
      v16 = atomic_load((unint64_t *)&v100);
      v17 = (unint64_t *)(v16 + 24);
      do
        v18 = __ldaxr((unint64_t *)&v101);
      while (__stlxr(0, (unint64_t *)&v101));
      do
        v19 = (const void *)__ldaxr(v17);
      while (__stlxr(v18, v17));
      if (v19)
        CFRelease(v19);
      sub_1D3DB386C((unint64_t *)&v101);
    }
    v20 = *a1;
    v95 = 0;
    v96 = 0;
    v94 = 0;
    sub_1D3D6D6A8((unsigned int *)&v94, *(unsigned int ***)(v20 + 48), *(unsigned int ***)(v20 + 56), (uint64_t)(*(_QWORD *)(v20 + 56) - *(_QWORD *)(v20 + 48)) >> 3);
    v21 = atomic_load((unint64_t *)&v100);
    v22 = (void **)(v21 + 40);
    if (*(_BYTE *)(v21 + 64))
    {
      v23 = *v22;
      if (*v22)
      {
        *(_QWORD *)(v21 + 48) = v23;
        operator delete(v23);
      }
    }
    *v22 = 0;
    *(_QWORD *)(v21 + 48) = 0;
    *(_QWORD *)(v21 + 56) = 0;
    *(_BYTE *)(v21 + 64) = 1;
    if ((int)((unint64_t)(v95 - v94) >> 3) >= 1)
    {
      v24 = 0;
      do
      {
        v25 = (_QWORD *)atomic_load((unint64_t *)&v100);
        v26 = (*(float (**)(_QWORD))(**(_QWORD **)(v94 + 8 * v24) + 16))(*(_QWORD *)(v94 + 8 * v24));
        v27 = (*(float (**)(_QWORD))(**(_QWORD **)(v94 + 8 * v24) + 24))(*(_QWORD *)(v94 + 8 * v24));
        v29 = (double *)v25[6];
        v28 = v25[7];
        if ((unint64_t)v29 >= v28)
        {
          v31 = (double *)v25[5];
          v32 = ((char *)v29 - (char *)v31) >> 4;
          v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 60)
            sub_1D3D6D4F8();
          v34 = v28 - (_QWORD)v31;
          if (v34 >> 3 > v33)
            v33 = v34 >> 3;
          if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0)
            v35 = 0xFFFFFFFFFFFFFFFLL;
          else
            v35 = v33;
          if (v35)
          {
            v35 = (unint64_t)sub_1D3D6DB64(v35);
            v31 = (double *)v25[5];
            v29 = (double *)v25[6];
          }
          else
          {
            v36 = 0;
          }
          v37 = (double *)(v35 + 16 * v32);
          *v37 = v26;
          v37[1] = v27;
          v38 = v37;
          if (v29 != v31)
          {
            do
            {
              *((_OWORD *)v38 - 1) = *((_OWORD *)v29 - 1);
              v38 -= 2;
              v29 -= 2;
            }
            while (v29 != v31);
            v31 = (double *)v25[5];
          }
          v30 = v37 + 2;
          v25[5] = v38;
          v25[6] = v37 + 2;
          v25[7] = v35 + 16 * v36;
          if (v31)
            operator delete(v31);
        }
        else
        {
          *v29 = v26;
          v29[1] = v27;
          v30 = v29 + 2;
        }
        v25[6] = v30;
        ++v24;
        v39 = (unint64_t)(v95 - v94) >> 3;
        if ((int)v39 >= 4)
          LODWORD(v39) = 4;
      }
      while (v24 < (int)v39);
    }
    v40 = atomic_load((unint64_t *)&v100);
    v41 = (void **)(v40 + 72);
    if (*(_BYTE *)(v40 + 96))
    {
      v42 = *v41;
      if (*v41)
      {
        *(_QWORD *)(v40 + 80) = v42;
        operator delete(v42);
      }
    }
    *v41 = 0;
    *(_QWORD *)(v40 + 80) = 0;
    *(_QWORD *)(v40 + 88) = 0;
    *(_BYTE *)(v40 + 96) = 1;
    v43 = (unint64_t)(v95 - v94) >> 3;
    if ((int)v43 >= 7)
      LODWORD(v43) = 7;
    if ((int)v43 >= 5)
    {
      v44 = 4;
      do
      {
        v45 = (_QWORD *)atomic_load((unint64_t *)&v100);
        v46 = (*(float (**)(_QWORD))(**(_QWORD **)(v94 + 8 * v44) + 16))(*(_QWORD *)(v94 + 8 * v44));
        v47 = (*(float (**)(_QWORD))(**(_QWORD **)(v94 + 8 * v44) + 24))(*(_QWORD *)(v94 + 8 * v44));
        v49 = (double *)v45[10];
        v48 = v45[11];
        if ((unint64_t)v49 >= v48)
        {
          v51 = (double *)v45[9];
          v52 = ((char *)v49 - (char *)v51) >> 4;
          v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 60)
            sub_1D3D6D4F8();
          v54 = v48 - (_QWORD)v51;
          if (v54 >> 3 > v53)
            v53 = v54 >> 3;
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF0)
            v55 = 0xFFFFFFFFFFFFFFFLL;
          else
            v55 = v53;
          if (v55)
          {
            v55 = (unint64_t)sub_1D3D6DB64(v55);
            v51 = (double *)v45[9];
            v49 = (double *)v45[10];
          }
          else
          {
            v56 = 0;
          }
          v57 = (double *)(v55 + 16 * v52);
          *v57 = v46;
          v57[1] = v47;
          v58 = v57;
          if (v49 != v51)
          {
            do
            {
              *((_OWORD *)v58 - 1) = *((_OWORD *)v49 - 1);
              v58 -= 2;
              v49 -= 2;
            }
            while (v49 != v51);
            v51 = (double *)v45[9];
          }
          v50 = v57 + 2;
          v45[9] = v58;
          v45[10] = v57 + 2;
          v45[11] = v55 + 16 * v56;
          if (v51)
            operator delete(v51);
        }
        else
        {
          *v49 = v46;
          v49[1] = v47;
          v50 = v49 + 2;
        }
        v45[10] = v50;
        ++v44;
        v59 = (unint64_t)(v95 - v94) >> 3;
        if ((int)v59 >= 7)
          LODWORD(v59) = 7;
      }
      while (v44 < (int)v59);
    }
    v60 = (_QWORD *)(*a1 + 80);
    v61 = atomic_load((unint64_t *)&v100);
    sub_1D3E366D0(v61 + 112, v60);
    v62 = *(_DWORD *)sub_1D3E3690C(*(uint64_t **)(*a1 + 88)) != 0;
    v63 = atomic_load((unint64_t *)&v100);
    *(_WORD *)(v63 + 104) = v62 | 0x100;
    v64 = *(_DWORD *)(*a1 + 72);
    if (v64 <= 9)
    {
      if (v64 == 1)
      {
        v101 = (void **)CFRetain(CFSTR("QR"));
        v65 = atomic_load((unint64_t *)&v100);
        v66 = (unint64_t *)(v65 + 16);
        do
          v67 = __ldaxr((unint64_t *)&v101);
        while (__stlxr(0, (unint64_t *)&v101));
        do
          v68 = (const void *)__ldaxr(v66);
        while (__stlxr(v67, v66));
        if (v68)
          CFRelease(v68);
        sub_1D3D8C70C((unint64_t *)&v101);
        if ((**(_BYTE **)(v99 + 16) & 0xF0) != 0x50)
          goto LABEL_97;
      }
      else
      {
        v101 = (void **)CFRetain(CFSTR("DataMatrix"));
        v73 = atomic_load((unint64_t *)&v100);
        v74 = (unint64_t *)(v73 + 16);
        do
          v75 = __ldaxr((unint64_t *)&v101);
        while (__stlxr(0, (unint64_t *)&v101));
        do
          v76 = (const void *)__ldaxr(v74);
        while (__stlxr(v75, v74));
        if (v76)
          CFRelease(v76);
        sub_1D3D8C70C((unint64_t *)&v101);
        if (**(unsigned __int8 **)(v99 + 16) != 232)
          goto LABEL_97;
      }
      v77 = atomic_load((unint64_t *)&v100);
      if (*(_BYTE *)(v77 + 208))
        sub_1D3DB386C((unint64_t *)(v77 + 200));
      *(_QWORD *)(v77 + 200) = 0;
      *(_OWORD *)(v77 + 168) = 0u;
      *(_OWORD *)(v77 + 184) = 0u;
      *(_BYTE *)(v77 + 208) = 1;
      v78 = atomic_load((unint64_t *)&v100);
      *(_BYTE *)(v78 + 168) = 1;
LABEL_97:
      v82 = atomic_load((unint64_t *)&v100);
      *(_DWORD *)(v82 + 32) = 1065353216;
      *(_BYTE *)(v82 + 36) = 1;
      v83 = a2[2];
      v84 = (unint64_t *)a2[1];
      if ((unint64_t)v84 >= v83)
      {
        v87 = ((uint64_t)v84 - *a2) >> 3;
        if ((unint64_t)(v87 + 1) >> 61)
          sub_1D3D6D4F8();
        v88 = v83 - *a2;
        v89 = v88 >> 2;
        if (v88 >> 2 <= (unint64_t)(v87 + 1))
          v89 = v87 + 1;
        if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF8)
          v90 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v90 = v89;
        v105 = a2 + 2;
        if (v90)
          v90 = (unint64_t)sub_1D3D6D8A0(v90);
        else
          v91 = 0;
        v101 = (void **)v90;
        v102 = v90 + 8 * v87;
        v103 = v102;
        v104 = v90 + 8 * v91;
        do
          v92 = __ldaxr((unint64_t *)&v100);
        while (__stlxr(0, (unint64_t *)&v100));
        *(_QWORD *)(v90 + 8 * v87) = v92;
        v103 += 8;
        sub_1D3DB37F8(a2, &v101);
        v86 = (_QWORD *)a2[1];
        sub_1D3D75F10((uint64_t)&v101);
      }
      else
      {
        do
          v85 = __ldaxr((unint64_t *)&v100);
        while (__stlxr(0, (unint64_t *)&v100));
        *v84 = v85;
        v86 = v84 + 1;
        a2[1] = (uint64_t)v86;
      }
      a2[1] = (uint64_t)v86;
      v101 = (void **)&v94;
      sub_1D3D6D79C(&v101);
LABEL_113:
      sub_1D3D7F558(&v97);
      sub_1D3D74F14((unint64_t *)&v100);
      return v11;
    }
    if (v64 == 10)
    {
      v101 = (void **)CFRetain(CFSTR("Aztec"));
      v69 = atomic_load((unint64_t *)&v100);
      v70 = (unint64_t *)(v69 + 16);
      do
        v71 = __ldaxr((unint64_t *)&v101);
      while (__stlxr(0, (unint64_t *)&v101));
      do
        v72 = (const void *)__ldaxr(v70);
      while (__stlxr(v71, v70));
      if (!v72)
        goto LABEL_96;
    }
    else
    {
      v101 = (void **)CFRetain(CFSTR("MicroQR"));
      v79 = atomic_load((unint64_t *)&v100);
      v80 = (unint64_t *)(v79 + 16);
      do
        v81 = __ldaxr((unint64_t *)&v101);
      while (__stlxr(0, (unint64_t *)&v101));
      do
        v72 = (const void *)__ldaxr(v80);
      while (__stlxr(v81, v80));
      if (!v72)
        goto LABEL_96;
    }
    CFRelease(v72);
LABEL_96:
    sub_1D3D8C70C((unint64_t *)&v101);
    goto LABEL_97;
  }
  return 0;
}

void sub_1D3E49674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, unint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void **a22)
{
  sub_1D3D8C70C(&a17);
  a22 = (void **)&a10;
  sub_1D3D6D79C(&a22);
  sub_1D3D7F558(&a13);
  sub_1D3D74F14(&a16);
  _Unwind_Resume(a1);
}

void sub_1D3E49720()
{
  JUMPOUT(0x1D8254C54);
}

__n128 sub_1D3E49734(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_1E95B41B8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 sub_1D3E49774(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E95B41B8;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_1D3E4979C(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t **v9;
  __int128 *v10;
  __int128 v11;
  uint64_t v12;
  os_signpost_id_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  const vImage_Buffer *v36;
  void ***v37;
  uint64_t v38;
  uint64_t v39;
  const void *v40;
  const char *v41;
  CFTypeRef *v42;
  uint64_t v43;
  const void *v44;
  __CVBuffer *v46;
  NSObject *v47;
  NSObject *v48;
  __CVBuffer *v49;
  __CVBuffer *v50;
  vImagePixelCount Height;
  __CVBuffer *v52;
  OSType PixelFormatType;
  OSType v54;
  void *v55;
  __CVBuffer *v56;
  __CVBuffer *v57;
  size_t BytesPerRow;
  vImage_Error v59;
  NSObject *v60;
  NSObject *v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v65;
  __CVBuffer *v66;
  const void *IOSurface;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (***v71)();
  uint64_t v72;
  const char *v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  vImage_Buffer *rowBytes;
  uint64_t v78;
  vImagePixelCount v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD *v84;
  int v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  vImagePixelCount v89;
  _QWORD *v90;
  _QWORD *v91;
  unint64_t *p_rowBytes;
  unint64_t *v93;
  unint64_t *v94;
  unint64_t *v95;
  unint64_t *v96;
  BOOL v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  unint64_t v102;
  NSObject *v103;
  _QWORD *v104;
  uint64_t v105;
  const char *v106;
  int v107;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  char v112;
  NSObject *v113;
  void *BaseAddress;
  vImagePixelCount Width;
  vImagePixelCount v116[3];
  uint64_t v117;
  const vImage_Buffer *src;
  vImage_Buffer *srca[2];
  void *v120;
  char v121;
  __int128 v122;
  __int128 v123;
  unint64_t v124;
  const __CFString *v125;
  const __CFString *v126;
  _BYTE buf[32];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  CFTypeRef v132[3];
  CFTypeRef *v133;
  __int128 v134;
  uint64_t v135;
  char v136;
  int v137;
  char v138;
  char v139;
  _QWORD v140[3];
  _QWORD *v141;
  _QWORD v142[3];
  _QWORD *v143;
  void **v144;
  _QWORD v145[3];
  _QWORD *v146;
  _BYTE v147[12];
  uint64_t (**v148)();
  uint64_t v149;
  char v150;
  CFTypeRef *v151;
  vImage_Buffer v152;
  void **v153;
  _QWORD v154[2];
  CFErrorRef *v155;
  _QWORD *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)a2 + 8))
    v4 = *(_BYTE *)(a3 + 96) == 0;
  else
    v4 = 0;
  if (!v4)
  {
    sub_1D3D74C98(*(unint64_t **)(a1[1] + 40), a3);
    if (qword_1EDB89FA0 != -1)
      dispatch_once(&qword_1EDB89FA0, &unk_1E95B04B0);
    v5 = qword_1EDB89FA8;
    if (os_log_type_enabled((os_log_t)qword_1EDB89FA8, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1[1] + 40);
      if (*(_BYTE *)(v6 + 96))
      {
        sub_1D3DF4F6C((uint64_t)buf, v6);
      }
      else
      {
        v128 = 0u;
        *(_QWORD *)buf = -1;
        memset(&buf[8], 0, 24);
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
      }
      sub_1D3DF53CC((CFErrorRef *)&v153, (uint64_t)buf);
      v40 = (const void *)atomic_load((unint64_t *)&v153);
      LODWORD(v132[0]) = 138543362;
      *(CFTypeRef *)((char *)v132 + 4) = v40;
      v41 = "Cannot retrieve or instantiate IIE model: %{public}@";
LABEL_83:
      _os_log_error_impl(&dword_1D3D6B000, v5, OS_LOG_TYPE_ERROR, v41, (uint8_t *)v132, 0xCu);
      sub_1D3D7448C((unint64_t *)&v153);
      sub_1D3DF4F24((unint64_t *)buf);
      return;
    }
    return;
  }
  v7 = *a2;
  v8 = a1[1];
  v9 = *(unint64_t ***)(v8 + 8);
  v10 = (__int128 *)a1[3];
  v11 = v10[1];
  v122 = *v10;
  v123 = v11;
  v12 = *(_QWORD *)(v8 + 40);
  if (qword_1EDB89FA0 != -1)
    dispatch_once(&qword_1EDB89FA0, &unk_1E95B04B0);
  v5 = qword_1EDB89FA8;
  v13 = os_signpost_id_generate((os_log_t)qword_1EDB89FA8);
  v120 = (void *)v13;
  v121 = 1;
  if (!*(_BYTE *)(v7 + 200)
    || !*(_BYTE *)(v7 + 392)
    || !*(_BYTE *)(v7 + 344)
    || (v14 = atomic_load((unint64_t *)(v7 + 400))) == 0)
  {
    if (qword_1EFE31860 != -1)
      dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
    v17 = qword_1EFE31858;
    if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D3D6B000, v17, OS_LOG_TYPE_ERROR, "IIEModel is not ready.", buf, 2u);
    }
    *(_QWORD *)buf = -6005;
    v132[0] = CFSTR("IIEModel is not ready.");
    sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, v132);
    v18 = 0;
    buf[0] = 0;
    BYTE8(v130) = 0;
    goto LABEL_24;
  }
  v143 = v142;
  v140[0] = &off_1E95AD680;
  v141 = v140;
  v142[0] = &off_1E95AD628;
  v146 = v145;
  v144 = &v120;
  v145[0] = &off_1E95AD680;
  *(_QWORD *)buf = v120;
  sub_1D3DFB8A0(v13, (os_signpost_id_t *)buf);
  v15 = v141;
  if (v141 == v140)
  {
    v16 = 4;
    v15 = v140;
  }
  else
  {
    if (!v141)
      goto LABEL_42;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_42:
  v26 = v143;
  if (v143 == v142)
  {
    v27 = 4;
    v26 = v142;
    goto LABEL_46;
  }
  if (v143)
  {
    v27 = 5;
LABEL_46:
    v26 = (_QWORD *)(*(uint64_t (**)(void))(*v26 + 8 * v27))();
  }
  if (*(_BYTE *)(v7 + 200)
    && *(_BYTE *)(v7 + 392)
    && *(_BYTE *)(v7 + 344)
    && (v28 = atomic_load((unint64_t *)(v7 + 400))) != 0
    && sub_1D3DF60F0((uint64_t)v26, *v9))
  {
    v29 = 0;
    v30 = (unint64_t)*v9 & 0xFFFFFFFFFFFFFF00;
    v31 = *v9;
  }
  else
  {
    v31 = 0;
    v30 = 0;
    v29 = 1;
  }
  if (qword_1EFE31860 != -1)
    dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
  v32 = qword_1EFE31858;
  if (!v29)
  {
    if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_DEBUG))
    {
      v76 = atomic_load((unint64_t *)(v30 | v31));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v76;
      _os_log_debug_impl(&dword_1D3D6B000, v32, OS_LOG_TYPE_DEBUG, "Found best pixel buffer: %{public}@", buf, 0xCu);
    }
    v33 = v123;
    *(_OWORD *)(v7 + 352) = v122;
    *(_OWORD *)(v7 + 368) = v33;
    *(_BYTE *)(v7 + 384) = 1;
    v34 = sub_1D3DF6604(v7 + 280, (unint64_t *)(v30 | v31), v12, (uint64_t)&v120);
    if ((v34 & 1) == 0)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3D6B000, v32, OS_LOG_TYPE_INFO, "Failed to run image preprocessor.", buf, 2u);
      }
      goto LABEL_60;
    }
    v35 = *(_QWORD *)(*(_QWORD *)(v7 + 208) + 8);
    v36 = (const vImage_Buffer *)(v7 + 312);
    if (!*(_BYTE *)(v7 + 344))
      v36 = 0;
    v117 = v7 + 280;
    src = v36;
    v132[0] = &off_1E95AC6C8;
    v133 = v132;
    v153 = (void **)&off_1E95AC720;
    v155 = (CFErrorRef *)&v153;
    *(_QWORD *)&v128 = &buf[8];
    *(_QWORD *)buf = &v120;
    *(_QWORD *)&buf[8] = &off_1E95AC720;
    if (!v121
      || (v152.data = v120,
          sub_1D3DF42BC(v34, (os_signpost_id_t *)&v152),
          v37 = (void ***)v155,
          v155 == (CFErrorRef *)&v153))
    {
      v38 = 4;
      v37 = &v153;
    }
    else
    {
      if (!v155)
        goto LABEL_78;
      v38 = 5;
    }
    ((void (*)(void))(*v37)[v38])();
LABEL_78:
    v42 = v133;
    if (v133 == v132)
    {
      v43 = 4;
      v42 = v132;
    }
    else
    {
      if (!v133)
        goto LABEL_86;
      v43 = 5;
    }
    (*((void (**)(void))*v42 + v43))();
LABEL_86:
    sub_1D3DD5F9C((CVPixelBufferRef *)&v126, (unint64_t *)(v7 + 400), v12);
    if (!atomic_load((unint64_t *)&v126))
    {
      if (qword_1EDB89F90 != -1)
        dispatch_once(&qword_1EDB89F90, &unk_1E95B34C8);
      v48 = qword_1EDB89F98;
      if (os_log_type_enabled((os_log_t)qword_1EDB89F98, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v152.data) = 0;
        _os_log_error_impl(&dword_1D3D6B000, v48, OS_LOG_TYPE_ERROR, "Failed to create input pixel buffer from pixel buffer pool", (uint8_t *)&v152, 2u);
      }
      goto LABEL_116;
    }
    v46 = (__CVBuffer *)atomic_load((unint64_t *)&v126);
    if (CVPixelBufferIsPlanar(v46))
    {
      if (qword_1EDB89F90 != -1)
        dispatch_once(&qword_1EDB89F90, &unk_1E95B34C8);
      v47 = qword_1EDB89F98;
      if (os_log_type_enabled((os_log_t)qword_1EDB89F98, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v152.data) = 0;
        _os_log_error_impl(&dword_1D3D6B000, v47, OS_LOG_TYPE_ERROR, "Invalid input pixel buffer", (uint8_t *)&v152, 2u);
      }
LABEL_115:
      v152.data = (void *)-2001;
      v148 = (uint64_t (**)())CFSTR("Invalid input pixel buffer.");
      sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)&v152, (CFTypeRef *)&v148);
LABEL_116:
      v124 = 0;
      goto LABEL_117;
    }
    v49 = (__CVBuffer *)atomic_load((unint64_t *)&v126);
    Width = CVPixelBufferGetWidth(v49);
    v50 = (__CVBuffer *)atomic_load((unint64_t *)&v126);
    Height = CVPixelBufferGetHeight(v50);
    v52 = (__CVBuffer *)atomic_load((unint64_t *)&v126);
    PixelFormatType = CVPixelBufferGetPixelFormatType(v52);
    if (Width != *(_QWORD *)(v35 + 80)
      || Height != *(_QWORD *)(v35 + 72)
      || (v54 = PixelFormatType, PixelFormatType != 1278226534) && PixelFormatType != 1278226536)
    {
      if (qword_1EDB89F90 != -1)
        dispatch_once(&qword_1EDB89F90, &unk_1E95B34C8);
      v61 = qword_1EDB89F98;
      if (os_log_type_enabled((os_log_t)qword_1EDB89F98, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v152.data) = 0;
        _os_log_error_impl(&dword_1D3D6B000, v61, OS_LOG_TYPE_ERROR, "Invalid input pixel buffer", (uint8_t *)&v152, 2u);
      }
      goto LABEL_115;
    }
    v55 = (void *)atomic_load((unint64_t *)&v126);
    if (v55)
      v55 = (void *)CFRetain(v55);
    v148 = (uint64_t (**)())v55;
    v149 = v12;
    v150 = sub_1D3DD48A0((unint64_t *)&v148, 0, v12);
    if ((v150 & 1) == 0)
    {
      if (qword_1EDB89F90 != -1)
        dispatch_once(&qword_1EDB89F90, &unk_1E95B34C8);
      v100 = qword_1EDB89F98;
      if (os_log_type_enabled((os_log_t)qword_1EDB89F98, OS_LOG_TYPE_ERROR))
      {
        v107 = *(_DWORD *)(v12 + 24);
        LODWORD(v152.data) = 67240192;
        HIDWORD(v152.data) = v107;
        _os_log_error_impl(&dword_1D3D6B000, v100, OS_LOG_TYPE_ERROR, "CVPixelBufferLockBaseAddress failed: %{public}d", (uint8_t *)&v152, 8u);
      }
      v124 = 0;
      goto LABEL_250;
    }
    v56 = (__CVBuffer *)atomic_load((unint64_t *)&v126);
    BaseAddress = CVPixelBufferGetBaseAddress(v56);
    v57 = (__CVBuffer *)atomic_load((unint64_t *)&v126);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v57);
    v152.data = BaseAddress;
    v152.height = Height;
    v152.width = Width;
    v152.rowBytes = BytesPerRow;
    if (v54 == 1278226536)
    {
      v59 = vImageConvert_Planar8toPlanar16F(src, &v152, 0);
      if (v59)
      {
        if (qword_1EDB89F90 != -1)
          dispatch_once(&qword_1EDB89F90, &unk_1E95B34C8);
        v60 = qword_1EDB89F98;
        if (os_log_type_enabled((os_log_t)qword_1EDB89F98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v147 = 134349056;
          *(_QWORD *)&v147[4] = v59;
          _os_log_error_impl(&dword_1D3D6B000, v60, OS_LOG_TYPE_ERROR, "vImageConvert_Planar8toPlanar16F failed: %{public}zd", v147, 0xCu);
        }
        *(_QWORD *)v147 = -2005;
        v125 = CFSTR("vImageConvert_Planar8toPlanar16F failed.");
        sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)v147, (CFTypeRef *)&v125);
LABEL_216:
        v102 = 0;
        *(_QWORD *)(v12 + 32) = v59;
        *(_BYTE *)(v12 + 40) = 1;
LABEL_249:
        v124 = v102;
LABEL_250:
        if (v150)
          v150 = sub_1D3DD4A58((unint64_t *)&v148, 0, v149) ^ 1;
        sub_1D3D74EDC((unint64_t *)&v148);
LABEL_117:
        sub_1D3D74EDC((unint64_t *)&v126);
        v62 = (_BYTE *)v128;
        if (*(_BYTE *)(*(_QWORD *)buf + 8))
        {
          if (!(_QWORD)v128)
            goto LABEL_125;
          v152.data = **(void ***)buf;
          (*(void (**)(void))(*(_QWORD *)v128 + 48))();
          v62 = (_BYTE *)v128;
        }
        if (v62 == &buf[8])
        {
          v63 = 4;
          v62 = &buf[8];
        }
        else
        {
          if (!v62)
            goto LABEL_125;
          v63 = 5;
        }
        (*(void (**)(void))(*(_QWORD *)v62 + 8 * v63))();
LABEL_125:
        if (atomic_load(&v124))
        {
          v65 = *(_QWORD *)(v7 + 208);
          v66 = (__CVBuffer *)atomic_load(&v124);
          IOSurface = CVPixelBufferGetIOSurface(v66);
          if (IOSurface)
            IOSurface = CFRetain(IOSurface);
          *(_QWORD *)buf = IOSurface;
          v68 = sub_1D3D835F8(v65, (unint64_t *)buf, v12);
          sub_1D3D82B54((unint64_t *)buf);
          if ((v68 & 1) != 0)
          {
            v69 = sub_1D3D87334(v7 + 72, (qos_class_t *)(v7 + 24), v12, (uint64_t)&v120);
            if ((v69 & 1) != 0)
            {
              v70 = *(_QWORD *)(v7 + 248);
              *(_OWORD *)srca = *(_OWORD *)(v7 + 216);
              *(_OWORD *)v116 = *(_OWORD *)(v7 + 232);
              v152.rowBytes = (size_t)&v152;
              v148 = &off_1E95ADAF8;
              v151 = (CFTypeRef *)&v148;
              v152.data = &off_1E95AC930;
              v156 = v154;
              v153 = &v120;
              v154[0] = &off_1E95ADAF8;
              if (!v121
                || (*(_QWORD *)buf = v120,
                    sub_1D3DF7854(v69, (os_signpost_id_t *)buf),
                    v71 = (uint64_t (***)())v151,
                    v151 == (CFTypeRef *)&v148))
              {
                v72 = 4;
                v71 = &v148;
              }
              else
              {
                if (!v151)
                  goto LABEL_153;
                v72 = 5;
              }
              (*v71)[v72]();
LABEL_153:
              rowBytes = (vImage_Buffer *)v152.rowBytes;
              if ((vImage_Buffer *)v152.rowBytes == &v152)
              {
                v78 = 4;
                rowBytes = &v152;
              }
              else
              {
                if (!v152.rowBytes)
                  goto LABEL_158;
                v78 = 5;
              }
              (*((void (**)(void))rowBytes->data + v78))();
LABEL_158:
              v79 = srca[1]->height;
              if (*(_QWORD *)(v79 + 64) == 4)
              {
                if (*(_QWORD *)(v79 + 48) == 4
                  && *(_QWORD *)(v79 + 56) == 1
                  && *(_QWORD *)(v79 + 120) / *(_QWORD *)(v79 + 32) == 1)
                {
                  v80 = *(_QWORD *)(v116[0] + 8);
                  if (*(_QWORD *)(v80 + 48) == 4 && *(_QWORD *)(v80 + 56) == 1 && *(_QWORD *)(v80 + 64) == 4)
                  {
                    v81 = *(_QWORD *)(v79 + 72);
                    if (*(_QWORD *)(v80 + 72) == v81)
                    {
                      v82 = *(_QWORD *)(v79 + 80);
                      if (*(_QWORD *)(v80 + 80) == v82 && *(_QWORD *)(v80 + 120) / *(_QWORD *)(v80 + 32) == 1)
                      {
                        v83 = (_QWORD *)(v79 + 16);
                        v84 = (_QWORD *)(v80 + 16);
                        v85 = *(_DWORD *)(v80 + 16);
                        if (v85 == *(_DWORD *)(v79 + 16))
                        {
                          v86 = *(_DWORD *)(v80 + 20);
                          if (v86 == *(_DWORD *)(v79 + 20))
                          {
                            v87 = *(_QWORD *)(v116[1] + 8);
                            if (*(_QWORD *)(v87 + 48) == 4
                              && *(_QWORD *)(v87 + 56) == 1
                              && *(_QWORD *)(v87 + 64) == 4
                              && *(_QWORD *)(v87 + 72) == v81
                              && *(_QWORD *)(v87 + 80) == v82
                              && *(_QWORD *)(v87 + 120) / *(_QWORD *)(v87 + 32) == 1
                              && *(_DWORD *)(v87 + 16) == v85
                              && *(_DWORD *)(v87 + 20) == v86)
                            {
                              v88 = *(_QWORD *)(v70 + 8);
                              if (*(_QWORD *)(v88 + 48) == 4
                                && *(_QWORD *)(v88 + 56) == 1
                                && *(_QWORD *)(v88 + 64) == 8
                                && *(_QWORD *)(v88 + 72) == 1
                                && *(_QWORD *)(v88 + 80) == 1
                                && *(_QWORD *)(v88 + 120) / *(_QWORD *)(v88 + 32) == 1
                                && *(_DWORD *)(v88 + 16) == v85
                                && *(_DWORD *)(v88 + 20) == v86)
                              {
                                v89 = srca[0]->height;
                                if (*(_QWORD *)(v89 + 48) == 4
                                  && *(_QWORD *)(v89 + 56) == 1
                                  && *(_QWORD *)(v89 + 120) / *(_QWORD *)(v89 + 32) == 1
                                  && *(_DWORD *)(v89 + 16) == v85
                                  && *(_DWORD *)(v89 + 20) == v86)
                                {
                                  buf[0] = 0;
                                  BYTE8(v130) = 0;
                                  if (v85 == 4)
                                  {
                                    v90 = (_QWORD *)(v89 + 16);
                                    v91 = (_QWORD *)(v87 + 16);
                                    p_rowBytes = &srca[0]->rowBytes;
                                    v93 = &srca[1]->rowBytes;
                                    v94 = (unint64_t *)(v116[0] + 24);
                                    v95 = (unint64_t *)(v116[1] + 24);
                                    v96 = (unint64_t *)(v70 + 24);
                                    if (v86 == 6)
                                    {
                                      v97 = sub_1D3DF8BB8((uint64_t)buf, v117, p_rowBytes, v93, v94, v95, v96, v90, v83, v84, v91, v88 + 16, v12);
                                      goto LABEL_279;
                                    }
                                    if (v86 == 3)
                                    {
                                      v97 = sub_1D3DF78F4((uint64_t)buf, v117, p_rowBytes, v93, v94, v95, v96, v90, v83, v84, v91, v88 + 16, v12);
LABEL_279:
                                      if (v97)
                                      {
                                        *(_OWORD *)&v132[1] = *(_OWORD *)&buf[8];
                                        v132[0] = *(CFTypeRef *)buf;
                                        v133 = *(CFTypeRef **)&buf[24];
                                        v134 = v128;
                                        v135 = v129;
                                        *(_QWORD *)buf = 0;
                                        v128 = 0uLL;
                                        *(_QWORD *)&v129 = 0;
                                        v136 = BYTE8(v129);
                                        v138 = v130;
                                        v112 = 1;
                                        v137 = HIDWORD(v129);
LABEL_276:
                                        v139 = v112;
                                        if (BYTE8(v130))
                                          sub_1D3DF7818((uint64_t)buf);
LABEL_223:
                                        v104 = v156;
                                        if (*((_BYTE *)v153 + 8))
                                        {
                                          if (!v156)
                                            goto LABEL_231;
                                          *(_QWORD *)buf = *v153;
                                          (*(void (**)(void))(*v156 + 48))();
                                          v104 = v156;
                                        }
                                        if (v104 == v154)
                                        {
                                          v105 = 4;
                                          v104 = v154;
                                        }
                                        else
                                        {
                                          if (!v104)
                                            goto LABEL_231;
                                          v105 = 5;
                                        }
                                        (*(void (**)(void))(*v104 + 8 * v105))();
LABEL_231:
                                        if (v139)
                                        {
                                          if (sub_1D3D87F0C(v7 + 72, v12))
                                          {
                                            if (sub_1D3D83A2C(*(_QWORD **)(v7 + 208), v12))
                                            {
                                              buf[0] = 0;
                                              BYTE8(v130) = 0;
                                              if (v139)
                                              {
                                                *(CFTypeRef *)buf = v132[0];
                                                *(_OWORD *)&buf[8] = *(_OWORD *)&v132[1];
                                                *(_QWORD *)&buf[24] = v133;
                                                v128 = v134;
                                                *(_QWORD *)&v129 = v135;
                                                v132[0] = 0;
                                                v134 = 0uLL;
                                                v135 = 0;
                                                BYTE8(v129) = v136;
                                                HIDWORD(v129) = v137;
                                                LOBYTE(v130) = v138;
                                                v18 = 1;
                                                BYTE8(v130) = 1;
                                                goto LABEL_244;
                                              }
                                              v18 = 0;
LABEL_142:
                                              sub_1D3D74EDC(&v124);
                                              goto LABEL_143;
                                            }
                                            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                                            {
                                              *(_WORD *)buf = 0;
                                              v106 = "Failed to unbind input surface.";
                                              goto LABEL_242;
                                            }
LABEL_243:
                                            v18 = 0;
                                            buf[0] = 0;
                                            BYTE8(v130) = 0;
LABEL_244:
                                            if (v139)
                                              sub_1D3DF7818((uint64_t)v132);
                                            goto LABEL_142;
                                          }
                                          if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                                            goto LABEL_243;
                                          *(_WORD *)buf = 0;
                                          v106 = "Failed to reset network.";
                                        }
                                        else
                                        {
                                          if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                                            goto LABEL_243;
                                          *(_WORD *)buf = 0;
                                          v106 = "Failed to run postprocessor.";
                                        }
LABEL_242:
                                        _os_log_impl(&dword_1D3D6B000, v32, OS_LOG_TYPE_INFO, v106, buf, 2u);
                                        goto LABEL_243;
                                      }
                                      if (qword_1EFE31860 != -1)
                                        dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                                      v113 = qword_1EFE31858;
                                      if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_INFO))
                                      {
                                        *(_WORD *)v147 = 0;
                                        _os_log_impl(&dword_1D3D6B000, v113, OS_LOG_TYPE_INFO, "Failed to postprocess.", v147, 2u);
                                      }
LABEL_275:
                                      v112 = 0;
                                      LOBYTE(v132[0]) = 0;
                                      goto LABEL_276;
                                    }
                                  }
                                  if (qword_1EFE31860 != -1)
                                    dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                                  v111 = qword_1EFE31858;
                                  if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)v147 = 0;
                                    _os_log_error_impl(&dword_1D3D6B000, v111, OS_LOG_TYPE_ERROR, "Unsupported output tensor data type", v147, 2u);
                                  }
                                  *(_QWORD *)v147 = -2001;
                                  v126 = CFSTR("Unsupported output tensor data type.");
                                  sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)v147, (CFTypeRef *)&v126);
                                  goto LABEL_275;
                                }
                                if (qword_1EFE31860 != -1)
                                  dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                                v110 = qword_1EFE31858;
                                if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_error_impl(&dword_1D3D6B000, v110, OS_LOG_TYPE_ERROR, "Unexpected output thresmap.", buf, 2u);
                                }
                                *(_QWORD *)buf = -6009;
                                *(_QWORD *)v147 = CFSTR("Unexpected output thresmap.");
                                sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, (CFTypeRef *)v147);
                              }
                              else
                              {
                                if (qword_1EFE31860 != -1)
                                  dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                                v109 = qword_1EFE31858;
                                if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_error_impl(&dword_1D3D6B000, v109, OS_LOG_TYPE_ERROR, "Unexpected output attributes.", buf, 2u);
                                }
                                *(_QWORD *)buf = -6009;
                                *(_QWORD *)v147 = CFSTR("Unexpected output attributes.");
                                sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, (CFTypeRef *)v147);
                              }
                            }
                            else
                            {
                              if (qword_1EFE31860 != -1)
                                dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                              v108 = qword_1EFE31858;
                              if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_error_impl(&dword_1D3D6B000, v108, OS_LOG_TYPE_ERROR, "Unexpected output offset_y.", buf, 2u);
                              }
                              *(_QWORD *)buf = -6009;
                              *(_QWORD *)v147 = CFSTR("Unexpected output offset_y.");
                              sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, (CFTypeRef *)v147);
                            }
                            LOBYTE(v132[0]) = 0;
                            v139 = 0;
                            goto LABEL_223;
                          }
                        }
                      }
                    }
                  }
                  if (qword_1EFE31860 != -1)
                    dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                  v103 = qword_1EFE31858;
                  if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1D3D6B000, v103, OS_LOG_TYPE_ERROR, "Unexpected output offset_x.", buf, 2u);
                  }
                  *(_QWORD *)buf = -6009;
                  *(_QWORD *)v147 = CFSTR("Unexpected output offset_x.");
                  sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, (CFTypeRef *)v147);
                }
                else
                {
                  if (qword_1EFE31860 != -1)
                    dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                  v99 = qword_1EFE31858;
                  if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1D3D6B000, v99, OS_LOG_TYPE_ERROR, "Unexpected output heatmap.", buf, 2u);
                  }
                  *(_QWORD *)buf = -6009;
                  *(_QWORD *)v147 = CFSTR("Unexpected output heatmap.");
                  sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, (CFTypeRef *)v147);
                }
              }
              else
              {
                if (qword_1EFE31860 != -1)
                  dispatch_once(&qword_1EFE31860, &unk_1E95B04F0);
                v98 = qword_1EFE31858;
                if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1D3D6B000, v98, OS_LOG_TYPE_ERROR, "Output heatmap buffer num of channels should be 4 for 4 corners.", buf, 2u);
                }
                *(_QWORD *)buf = -6009;
                *(_QWORD *)v147 = CFSTR("Output heatmap buffer not equals to 4.");
                sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, (CFTypeRef *)v147);
              }
              LOBYTE(v132[0]) = 0;
              v139 = 0;
              goto LABEL_223;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v73 = "Failed to execute.";
              goto LABEL_140;
            }
LABEL_141:
            v18 = 0;
            buf[0] = 0;
            BYTE8(v130) = 0;
            goto LABEL_142;
          }
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            goto LABEL_141;
          *(_WORD *)buf = 0;
          v73 = "Failed to bind input surface.";
        }
        else
        {
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            goto LABEL_141;
          *(_WORD *)buf = 0;
          v73 = "Failed to create input pixel buffer.";
        }
LABEL_140:
        _os_log_impl(&dword_1D3D6B000, v32, OS_LOG_TYPE_INFO, v73, buf, 2u);
        goto LABEL_141;
      }
      sub_1D3DF3738((uint64_t *)&v152);
    }
    else
    {
      v59 = vImageConvert_Planar8toPlanarF(src, &v152, 255.0, 0.0, 0);
      if (v59)
      {
        if (qword_1EDB89F90 != -1)
          dispatch_once(&qword_1EDB89F90, &unk_1E95B34C8);
        v101 = qword_1EDB89F98;
        if (os_log_type_enabled((os_log_t)qword_1EDB89F98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v147 = 134349056;
          *(_QWORD *)&v147[4] = v59;
          _os_log_error_impl(&dword_1D3D6B000, v101, OS_LOG_TYPE_ERROR, "vImageConvert_Planar8toPlanarF failed: %{public}zd", v147, 0xCu);
        }
        *(_QWORD *)v147 = -2005;
        v125 = CFSTR("vImageConvert_Planar8toPlanarF failed.");
        sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)v147, (CFTypeRef *)&v125);
        goto LABEL_216;
      }
    }
    do
      v102 = __ldaxr((unint64_t *)&v126);
    while (__stlxr(0, (unint64_t *)&v126));
    goto LABEL_249;
  }
  if (os_log_type_enabled((os_log_t)qword_1EFE31858, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9 - 2;
    _os_log_error_impl(&dword_1D3D6B000, v32, OS_LOG_TYPE_ERROR, "Unable to find any supported pixel buffer from MRCSample: %{public}@", buf, 0xCu);
  }
  *(_QWORD *)buf = -6007;
  v132[0] = CFSTR("Unable to find any supported pixel buffer from MRCSample.");
  sub_1D3D73E0C((unint64_t *)v12, (uint64_t *)buf, v132);
LABEL_60:
  v18 = 0;
  buf[0] = 0;
  BYTE8(v130) = 0;
LABEL_143:
  v74 = v146;
  if (*((_BYTE *)v144 + 8))
  {
    if (!v146)
      goto LABEL_24;
    v132[0] = *v144;
    (*(void (**)(void))(*v146 + 48))();
    v74 = v146;
  }
  if (v74 == v145)
  {
    v75 = 4;
    v74 = v145;
  }
  else
  {
    if (!v74)
      goto LABEL_24;
    v75 = 5;
  }
  (*(void (**)(void))(*v74 + 8 * v75))();
  v18 = BYTE8(v130);
LABEL_24:
  v19 = a1[2];
  if (*(unsigned __int8 *)(v19 + 72) == v18)
  {
    if (*(_BYTE *)(v19 + 72))
    {
      v20 = sub_1D3DF7818(v19);
      v21 = *(_QWORD *)buf;
      *(_QWORD *)buf = 0;
      *(_QWORD *)v20 = v21;
      *(_OWORD *)(v20 + 8) = *(_OWORD *)&buf[8];
      *(_QWORD *)(v20 + 24) = *(_QWORD *)&buf[24];
      *(_OWORD *)(v20 + 32) = v128;
      *(_QWORD *)(v20 + 48) = v129;
      v128 = 0uLL;
      *(_QWORD *)&v129 = 0;
      *(_BYTE *)(v20 + 56) = BYTE8(v129);
      *(_DWORD *)(v20 + 60) = HIDWORD(v129);
      *(_BYTE *)(v20 + 64) = v130;
      if (!v18)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else
  {
    if (!*(_BYTE *)(v19 + 72))
    {
      v25 = *(_QWORD *)buf;
      *(_QWORD *)buf = 0;
      *(_QWORD *)v19 = v25;
      *(_OWORD *)(v19 + 8) = *(_OWORD *)&buf[8];
      *(_QWORD *)(v19 + 24) = *(_QWORD *)&buf[24];
      *(_OWORD *)(v19 + 32) = v128;
      *(_QWORD *)(v19 + 48) = v129;
      v128 = 0uLL;
      *(_QWORD *)&v129 = 0;
      *(_BYTE *)(v19 + 56) = BYTE8(v129);
      *(_DWORD *)(v19 + 60) = HIDWORD(v129);
      *(_BYTE *)(v19 + 64) = v130;
      *(_BYTE *)(v19 + 72) = 1;
      if (!v18)
        goto LABEL_32;
      goto LABEL_31;
    }
    *(_BYTE *)(sub_1D3DF7818(v19) + 72) = 0;
  }
  if (v18)
LABEL_31:
    sub_1D3DF7818((uint64_t)buf);
LABEL_32:
  v22 = a1[2];
  if (*(_BYTE *)(v22 + 72) && !*(_BYTE *)(*(_QWORD *)(a1[1] + 40) + 96))
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v23 = (uint64_t)(*(_QWORD *)(v22 + 40) - *(_QWORD *)(v22 + 32)) >> 3;
      v24 = *(float *)(v22 + 60);
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2050;
      *(double *)&buf[14] = v24;
      _os_log_impl(&dword_1D3D6B000, v5, OS_LOG_TYPE_INFO, "IIE inference yields %{public}zu key point(s), module size is %{public}f.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v39 = *(_QWORD *)(a1[1] + 40);
    if (*(_BYTE *)(v39 + 96))
    {
      sub_1D3DF4F6C((uint64_t)buf, v39);
    }
    else
    {
      v128 = 0u;
      *(_QWORD *)buf = -1;
      memset(&buf[8], 0, 24);
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
    }
    sub_1D3DF53CC((CFErrorRef *)&v153, (uint64_t)buf);
    v44 = (const void *)atomic_load((unint64_t *)&v153);
    LODWORD(v132[0]) = 138543362;
    *(CFTypeRef *)((char *)v132 + 4) = v44;
    v41 = "Cannot run IIE inference: %{public}@";
    goto LABEL_83;
  }
}

void sub_1D3E4AFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  uint64_t v64;

  if (a42)
    sub_1D3DF7818((uint64_t)&a33);
  sub_1D3D87C3C((_QWORD *)(v64 - 144));
  sub_1D3D74EDC(&a30);
  sub_1D3D87C3C(&a64);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E4B0E0(uint64_t a1, uint64_t a2)
{
  if (sub_1D3D7521C(*(_QWORD *)(a2 + 8), (uint64_t)"ZNK3mrc7Decoder24decodeUsingZXing_V4_IIE_ERKNS0_4PassEE3$_0"))
    return a1 + 8;
  else
    return 0;
}

void *sub_1D3E4B118()
{
  return &unk_1E95B4218;
}

void sub_1D3E4B124(uint64_t a1, uint64_t a2)
{
  NSObject *v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t *v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  CFTypeID v34;
  _QWORD *v35;
  simd_float3x3 v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  unint64_t *v42;
  const __CFString *v43;
  double v44;
  uint64_t v45;
  float v46;
  float v47;
  float32x2_t *v48;
  float32x2_t *v49;
  float v50;
  unint64_t v51;
  uint64_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float v56;
  float32x2_t *v57;
  float32x2_t *v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x2_t *v62;
  int32x4_t v63;
  int v64;
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
  int32x4_t v75;
  int32x4_t v76;
  int8x16_t v77;
  float32x2_t v78;
  float32x4_t v79;
  int v80;
  float v81;
  int32x2_t v82;
  int32x4_t v83;
  float32x2_t v84;
  float32x2_t v85;
  float32x2_t v86;
  float32x2_t v87;
  float32x2_t v88;
  float v89;
  float32x2_t v90;
  float32x2_t v91;
  float v92;
  int32x2_t *v93;
  uint64_t v94;
  uint64_t v95;
  float v96;
  float v97;
  int32x2_t *v98;
  int *v99;
  uint64_t v100;
  int v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unsigned int *v110;
  unsigned int v111;
  int32x4_t *v112;
  int32x4_t *v113;
  unint64_t v114;
  uint64_t v115;
  int v116;
  __int32 v117;
  int32x2_t v118;
  int32x4_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  int32x4_t *v124;
  int32x4_t *v125;
  int32x4_t v126;
  unint64_t v127;
  uint64_t v128;
  char *v129;
  char *v130;
  unint64_t v131;
  int32x4_t *v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  int32x2_t *v141;
  uint64_t v142;
  int32x2_t *v143;
  int32x2_t *v144;
  int32x2_t *v145;
  unsigned int v146;
  char *v147;
  _BOOL4 v148;
  float v149;
  int32x2_t v150;
  int v151;
  int32x2_t v152;
  int32x2_t v153;
  int v154;
  float v155;
  float32x2_t *v156;
  unint64_t v157;
  int32x2_t v158;
  float32x2_t v159;
  float32x2_t *v160;
  uint64_t v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  float32x2_t *v165;
  float32x2_t *v166;
  float32x2_t v167;
  int32x2_t v168;
  int32x2_t v169;
  __int32 v170;
  __int32 v171;
  unsigned __int32 v172;
  unsigned __int32 v173;
  signed __int32 v174;
  int32x2_t v175;
  int32x2_t v176;
  int32x2_t v177;
  int32x2_t v178;
  int v179;
  unsigned int v180;
  uint32x2_t v181;
  float32x2_t *v182;
  uint32x2_t v183;
  char *v184;
  char *v185;
  char *v186;
  char *v187;
  uint64_t v188;
  char *v190;
  float32x2_t v191;
  float32x2_t v192;
  char *v193;
  char *v194;
  float32x2_t v195;
  int8x8_t v196;
  float32x2_t v197;
  int32x2_t v198;
  float32x2_t v199;
  int32x2_t v200;
  float32x2_t v201;
  unsigned __int8 v202;
  unsigned int v203;
  double v204;
  double v205;
  float32x2_t *v206;
  float32x2_t *v207;
  float32x4_t v208;
  float32x4_t v209;
  float32x4_t v210;
  int32x4_t v211;
  int v212;
  int v213;
  int v214;
  _BOOL4 v215;
  int v216;
  unsigned int *v217;
  float v218;
  __float2 v219;
  unsigned int *v220;
  unsigned int v221;
  uint64_t v222;
  unsigned int *v223;
  unsigned int v224;
  float *v225;
  unsigned int v226;
  unsigned int *v227;
  unsigned int *v228;
  unsigned int v229;
  unsigned int v230;
  _BOOL4 v231;
  int v232;
  int v233;
  int v234;
  unsigned int *v235;
  unsigned int v236;
  unsigned int *v237;
  unsigned int *v238;
  unsigned int v239;
  double v240;
  double v241;
  unsigned int *v242;
  unsigned int v243;
  double v244;
  int32x2_t v245;
  _BOOL4 v246;
  int v247;
  int v248;
  int v249;
  unsigned int *v250;
  unsigned int *v251;
  unsigned int v252;
  unsigned int *v253;
  unsigned int *v254;
  unsigned int v255;
  double v256;
  int32x2_t v257;
  _BOOL4 v258;
  int v259;
  int v260;
  int v261;
  unsigned int *v262;
  unsigned int *v263;
  unsigned int v264;
  unsigned int *v265;
  unsigned int *v266;
  unsigned int v267;
  uint64_t v268;
  unint64_t v269;
  int32x2_t *v270;
  uint64_t v271;
  uint64_t v272;
  unsigned int v273;
  uint64_t v274;
  unint64_t v275;
  int32x2_t *v276;
  unint64_t v277;
  int32x2_t *v278;
  int32x2_t *v279;
  int32x2_t v280;
  int v281;
  int v282;
  __int32 v283;
  __int32 v284;
  int32x2_t *v285;
  uint64_t v286;
  uint64_t v287;
  unsigned int *v288;
  unsigned int *v289;
  unsigned int v290;
  uint64_t v291;
  float v292;
  float v293;
  unsigned int *v294;
  unsigned int *v295;
  unsigned int v296;
  uint64_t v297;
  int v298;
  float *v299;
  char *v300;
  unint64_t v301;
  unsigned int *v302;
  unsigned int *v303;
  unsigned int v304;
  unsigned int *v305;
  unsigned int *v306;
  unsigned int v307;
  int v308;
  unsigned int *v309;
  unsigned int *v310;
  unsigned int v311;
  unsigned int *v312;
  unsigned int *v313;
  unsigned int v314;
  unsigned int *v315;
  float32x2_t *v316;
  float32x2_t *v317;
  char *v321;
  int32x4_t v322;
  unsigned int *v323;
  unsigned int **v324;
  unsigned int v325;
  uint64_t v326;
  unsigned int *v327;
  uint64_t v328;
  unsigned int *v329;
  unsigned int v330;
  unsigned int *v331;
  unsigned int v332;
  unsigned int v333;
  int32x2_t *v334;
  float v335;
  int v336;
  int v337;
  int32x2_t *v338;
  int v339;
  int v340;
  unint64_t v341;
  float v342;
  int32x4_t v343;
  int32x2_t *v344;
  double v345;
  uint64_t v346;
  int32x4_t v347;
  float32x4_t v348;
  float v349;
  void *v350;
  int32x4_t v351;
  int32x4_t v352;
  int32x4_t v353;
  int32x2_t v354;
  int v355;
  float32x2_t v356;
  unsigned int *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  float32x2_t *v362;
  float32x2_t *v363;
  unsigned __int8 v364;
  float v365;
  unsigned __int8 v366;
  char v367;
  _QWORD v368[4];
  CGAffineTransform v369;
  unsigned int *v370;
  unsigned int *v371;
  unsigned int *v372;
  unsigned int *v373;
  unsigned int *v374;
  unsigned int *v375;
  void *__p[2];
  __int128 v377;
  __int128 v378;
  void **v379;
  int32x4_t *v380;
  unsigned int **v381;
  BOOL *v382;
  char *v383;
  int *v384;
  char *v385;
  uint64_t *v386;
  void *p_buf;
  char *v388;
  int32x2_t v389;
  uint64_t v390;
  unsigned int **v391;
  BOOL *v392;
  char *v393;
  int *v394;
  char *v395;
  uint64_t *v396;
  float *v397;
  BOOL *v398;
  void **p_src;
  int *v400;
  void **v401;
  void *v402;
  void *v403;
  uint64_t v404;
  unsigned __int8 v405;
  int32x4_t *v406;
  int v407;
  uint64_t v408;
  int v409;
  char v410;
  BOOL v411;
  void *__src;
  char *v413;
  int32x2_t v414;
  int v415;
  float32x2_t *v416;
  float32x2_t *v417;
  uint64_t v418;
  BOOL v419;
  float v420;
  void *v421;
  float32x2_t *v422;
  uint64_t v423;
  int32x4_t buf;
  unint64_t v425;
  void *v426;
  unint64_t v427;
  unint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  simd_float3 v434;
  simd_float3 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  int32x4_t v443;
  int32x4_t v444;
  int32x4_t v445;
  unsigned int *v446;
  _QWORD v447[3];
  _QWORD *v448;
  uint64_t v449;
  simd_float3x3 v450;
  CGRect v451;
  CGRect v452;
  CGRect v453;
  CGRect v454;
  CGRect v455;
  CGRect v456;
  CGRect v457;

  v449 = *MEMORY[0x1E0C80C00];
  if (sub_1D3DDD9BC(*(_QWORD *)(a1 + 8)))
    _ZF = *(_BYTE *)(a2 + 32) == 0;
  else
    _ZF = 1;
  if (!_ZF)
  {
    if (qword_1EDB89FA0 != -1)
      dispatch_once(&qword_1EDB89FA0, &unk_1E95B04B0);
    v5 = qword_1EDB89FA8;
    if (os_log_type_enabled((os_log_t)qword_1EDB89FA8, OS_LOG_TYPE_INFO))
    {
      buf.i16[0] = 0;
      _os_log_impl(&dword_1D3D6B000, v5, OS_LOG_TYPE_INFO, "All prerequisites are met, will run IIE inference.", (uint8_t *)&buf, 2u);
    }
    v6 = *(_QWORD *)(a2 + 8);
    if (CGRectIsEmpty(*(CGRect *)(v6 + 16))
      || CGRectIsInfinite(*(CGRect *)(v6 + 16))
      || CGRectIsNull(*(CGRect *)(v6 + 16)))
    {
      **(_WORD **)(a2 + 64) = 256;
      goto LABEL_13;
    }
    v9 = *(_OWORD **)(a2 + 24);
    v451.origin.x = sub_1D3D8F9B0((uint64_t)v9, 0.1);
    v10 = v9[5];
    *(_OWORD *)&v369.a = v9[4];
    v11 = v9[6];
    *(_OWORD *)&v369.c = v10;
    *(_OWORD *)&v369.tx = v11;
    v457 = CGRectApplyAffineTransform(v451, &v369);
    v452 = CGRectIntersection(*(CGRect *)(v6 + 16), v457);
    x = v452.origin.x;
    y = v452.origin.y;
    width = v452.size.width;
    height = v452.size.height;
    v16 = **(_QWORD **)(a2 + 8);
    v350 = sub_1D3DE7F08((unint64_t *)v16);
    v345 = CGRectGetWidth(*(CGRect *)(v16 + 8));
    v17 = CGRectGetHeight(*(CGRect *)(v16 + 8));
    v18 = *(_QWORD *)(v16 + 40);
    v453.origin.x = x;
    v453.origin.y = y;
    v453.size.width = width;
    v453.size.height = height;
    MinX = CGRectGetMinX(v453);
    v454.origin.x = x;
    v454.origin.y = y;
    v454.size.width = width;
    v454.size.height = height;
    MinY = CGRectGetMinY(v454);
    v455.origin.x = x;
    v455.origin.y = y;
    v455.size.width = width;
    v455.size.height = height;
    MaxX = CGRectGetMaxX(v455);
    v456.origin.x = x;
    v456.origin.y = y;
    v456.size.width = width;
    v456.size.height = height;
    MaxY = CGRectGetMaxY(v456);
    v23 = (unint64_t)v345;
    v24 = vcvtmd_s64_f64(MinX);
    v25 = vcvtmd_s64_f64(MinY);
    v26 = vcvtpd_s64_f64(MaxX);
    v27 = vcvtpd_s64_f64(MaxY);
    if ((uint64_t)(unint64_t)v345 >= v26)
      v28 = v26;
    else
      v28 = (unint64_t)v345;
    if ((uint64_t)(unint64_t)v17 >= v27)
      v29 = v27;
    else
      v29 = (unint64_t)v17;
    v30 = ((_BYTE)v24 + (_BYTE)v350) & 0xF;
    v346 = v18;
    if ((v18 & 0xF) != 0)
      v30 = 0;
    v31 = (v24 - v30) & ~((uint64_t)(v24 - v30) >> 63);
    v32 = v25 & ~(v25 >> 63);
    v368[0] = v31;
    v368[1] = v28;
    v341 = v28;
    v368[2] = v32;
    v368[3] = v29;
    LOBYTE(v358) = 0;
    v367 = 0;
    v33 = (const void *)atomic_load((unint64_t *)a1);
    if (v33)
    {
      v34 = CFGetTypeID(v33);
      if (qword_1EDB893E0 != -1)
        dispatch_once_f(&qword_1EDB893E0, 0, (dispatch_function_t)sub_1D3D73FB8);
      if (v34 != qword_1EDB893D8)
        _os_assumes_log();
    }
    v448 = 0;
    v35 = operator new(0x20uLL);
    *v35 = &off_1E95B41B8;
    v35[1] = a2;
    v35[2] = &v358;
    v35[3] = v368;
    v448 = v35;
    sub_1D3DFBE58((uint64_t)v33 + 16, v447);
    v37 = v448;
    if (v448 == v447)
    {
      v38 = 4;
      v37 = v447;
    }
    else
    {
      if (!v448)
      {
LABEL_38:
        v39 = *(_QWORD *)(a2 + 40);
        if (*(_BYTE *)(v39 + 96) && *(_QWORD *)v39 != -6001)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            buf.i16[0] = 0;
            _os_log_error_impl(&dword_1D3D6B000, v5, OS_LOG_TYPE_ERROR, "Underlying errors occurred during inference, bail out immediately.", (uint8_t *)&buf, 2u);
          }
        }
        else
        {
          if (!v367)
          {
            sub_1D3E4EEF0((unint64_t *)a1, a2);
            goto LABEL_308;
          }
          v40 = v364;
          if (v364)
          {
            v41 = v364 & 0xFE;
            if (v41 == 4)
            {
              buf.i32[0] = 1;
              buf.i8[4] = 1;
              v42 = *(unint64_t **)(a1 + 8);
              v43 = CFSTR("Aztec");
            }
            else if (v41 == 2)
            {
              buf.i32[0] = 1;
              buf.i8[4] = 1;
              v42 = *(unint64_t **)(a1 + 8);
              v43 = CFSTR("DataMatrix");
            }
            else
            {
              if (v364 != 1)
                goto LABEL_52;
              buf.i32[0] = 1;
              buf.i8[4] = 1;
              v42 = *(unint64_t **)(a1 + 8);
              v43 = CFSTR("MicroQR");
            }
            if ((sub_1D3DDC428(v42, v43, (uint64_t)&buf) & 1) != 0)
            {
LABEL_52:
              v337 = v40;
              v36.columns[0].i64[0] = COERCE_UNSIGNED_INT(1.0);
              v36.columns[1].i32[0] = 0;
              v36.columns[1].i32[1] = 1.0;
              v44 = (double)(uint64_t)(v29 - v32);
              v36.columns[0].f32[2] = (float)v31;
              v335 = (float)v32;
              v36.columns[1].f32[2] = (float)v32;
              if ((double)(uint64_t)(v341 - v31) >= v44)
                v44 = (double)(uint64_t)(v341 - v31);
              v45 = v359;
              v46 = v44;
              v47 = (float)(int)v359 / v46;
              v48 = v362;
              v49 = v363;
              v342 = v46;
              if (v362 != v363)
              {
                do
                {
                  *v48 = vmul_n_f32(*v48, v46);
                  ++v48;
                }
                while (v48 != v49);
                v45 = v359;
              }
              v50 = v365;
              LODWORD(v51) = 0;
              *((float *)&v51 + 1) = v47;
              v36.columns[2] = (simd_float3)xmmword_1D3E821B0;
              v336 = v366;
              buf.i8[0] = v366;
              buf.i64[1] = v23;
              v425 = (unint64_t)v17;
              v426 = v350;
              v427 = v23;
              v428 = (unint64_t)v17;
              v429 = v346;
              v430 = v358;
              v431 = v360;
              v432 = v45;
              v433 = v361;
              v434 = v36.columns[0];
              v435 = v36.columns[1];
              v436 = xmmword_1D3E821B0;
              v437 = LODWORD(v47);
              v438 = v51;
              v439 = xmmword_1D3E821B0;
              v446 = 0;
              v444 = 0u;
              v445 = 0u;
              v442 = 0u;
              v443 = 0u;
              v440 = 0u;
              v441 = 0u;
              v349 = (float)v31;
              v450 = __invert_f3(v36);
              v52 = 0;
              v443.i32[2] = v450.columns[0].i32[2];
              v443.i64[0] = v450.columns[0].i64[0];
              v444.i32[2] = v450.columns[1].i32[2];
              v444.i64[0] = v450.columns[1].i64[0];
              v445.i32[2] = v450.columns[2].i32[2];
              v445.i64[0] = v450.columns[2].i64[0];
              v53 = (float32x4_t)v443;
              v54 = (float32x4_t)v444;
              v55 = (float32x4_t)v445;
              *(_OWORD *)__p = v437;
              v377 = v438;
              v378 = v439;
              do
              {
                *(float32x4_t *)((char *)&p_buf + v52 * 8) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(_OWORD *)&__p[v52])), v54, (float32x2_t)__p[v52], 1), v55, *(float32x4_t *)&__p[v52], 2);
                v52 += 2;
              }
              while (v52 != 6);
              v56 = v50 * v342;
              DWORD2(v440) = (_DWORD)v388;
              DWORD2(v441) = v390;
              *(_QWORD *)&v440 = p_buf;
              *(int32x2_t *)&v441 = v389;
              DWORD2(v442) = (_DWORD)v392;
              *(_QWORD *)&v442 = v391;
              if (v41 == 4)
              {
                v420 = v50 * v342;
                v419 = v40 == 5;
                v357 = 0;
                v343 = (int32x4_t)v435;
                v347 = (int32x4_t)v436;
                v351 = (int32x4_t)v434;
                v417 = 0;
                v416 = 0;
                v418 = 0;
                sub_1D3D6F268(&v416, v362, (uint64_t)v363, v363 - v362);
                v57 = v416;
                v58 = v417;
                if (v416 != v417)
                {
                  v59 = (float32x4_t)vzip1q_s32(v351, v343);
                  v59.i32[2] = v347.i32[0];
                  v60 = (float32x4_t)vzip2q_s32(vzip1q_s32(v351, v347), vdupq_lane_s32(*(int32x2_t *)v343.i8, 1));
                  v61 = (float32x4_t)vzip2q_s32(v351, v343);
                  v61.i32[2] = v347.i32[2];
                  v62 = v416;
                  do
                  {
                    v63 = (int32x4_t)vaddq_f32(v61, vmlaq_lane_f32(vmulq_n_f32(v59, COERCE_FLOAT(*v62)), v60, *v62, 1));
                    *v62++ = vdiv_f32(*(float32x2_t *)v63.i8, (float32x2_t)vdup_laneq_s32(v63, 2));
                  }
                  while (v62 != v58);
                }
                if (v40 == 5)
                  v64 = 7;
                else
                  v64 = 11;
                if (!sub_1D3D6F09C(v57, (uint64_t)v58, v64))
                {
LABEL_299:
                  if (!v57)
                  {
LABEL_301:
                    if (v357)
                    {
                      v242 = v357 + 2;
                      do
                        v243 = __ldxr(v242);
                      while (__stxr(v243 + 1, v242));
                      p_buf = v357;
                      **(_WORD **)(a2 + 64) = sub_1D3E48F24((uint64_t *)&p_buf, *(uint64_t **)a2) | 0x100;
                      sub_1D3D7F7E4((unsigned int **)&p_buf);
                    }
                    else
                    {
                      **(_WORD **)(a2 + 64) = 256;
                    }
                    sub_1D3D7F7E4(&v357);
                    goto LABEL_307;
                  }
LABEL_300:
                  v417 = v57;
                  operator delete(v57);
                  goto LABEL_301;
                }
                *(float32x2_t *)v65.i8 = *v57;
                *(float32x2_t *)v66.i8 = v57[1];
                v69 = v65;
                v69.i32[2] = 1.0;
                *(float32x2_t *)v67.i8 = v57[2];
                *(float32x2_t *)v68.i8 = v57[3];
                v70 = v67;
                v70.i32[2] = 1.0;
                v71 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v70, v70), (int8x16_t)v70, 0xCuLL), vnegq_f32((float32x4_t)v69)), (float32x4_t)v70, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v69, v69), (int8x16_t)v69, 0xCuLL));
                v72 = v66;
                v72.i32[2] = 1.0;
                v73 = v68;
                v73.i32[2] = 1.0;
                v74 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v71, v71), (int8x16_t)v71, 0xCuLL);
                v75 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v73, v73), (int8x16_t)v73, 0xCuLL), vnegq_f32((float32x4_t)v72)), (float32x4_t)v73, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v72, v72), (int8x16_t)v72, 0xCuLL));
                v76 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v75, v75), (int8x16_t)v75, 0xCuLL);
                v77 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v76, v76), (int8x16_t)v76, 0xCuLL), vnegq_f32((float32x4_t)v74)), (float32x4_t)v76, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v74, v74), (int8x16_t)v74, 0xCuLL));
                v76.i32[0] = vextq_s8(v77, v77, 8uLL).u32[0];
                v76.i32[1] = v77.i32[0];
                v78 = vdiv_f32(*(float32x2_t *)v76.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v77.i8, 1));
                *(int32x2_t *)v79.f32 = vrev64_s32((int32x2_t)vmul_f32(vsub_f32(v78, *v57), vsub_f32(v78, *(float32x2_t *)v67.i8)));
                *(float32x2_t *)&v79.u32[2] = vmul_f32(vsub_f32(v78, *(float32x2_t *)v66.i8), vsub_f32(v78, *(float32x2_t *)v68.i8));
                if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcgezq_f32(v79))) & 1) != 0)
                  goto LABEL_300;
                if (v419)
                  v80 = 7;
                else
                  v80 = 11;
                v415 = v80;
                v81 = v420;
                v82 = vcvt_s32_f32(v78);
                p_buf = &buf;
                v388 = (char *)v82;
                v390 = 1;
                v389 = 0;
                if (sub_1D3D6D9B8(&p_buf, *(double *)&v82))
                {
                  if (!sub_1D3D6DA18((int32x2_t *)&p_buf, v81))
                    goto LABEL_230;
                }
                else
                {
                  v339 = v80;
                  v112 = 0;
                  v113 = 0;
                  v114 = 0;
                  v115 = 0;
                  v116 = (int)v81;
                  do
                  {
                    if (v116 >= 1)
                    {
                      v117 = 0;
                      v118 = qword_1D3E6B6D0[v115];
                      *(int32x2_t *)v83.i8 = v82;
                      v352 = v83;
                      while (1)
                      {
                        v119.i64[1] = v352.i64[1];
                        *(int32x2_t *)v119.i8 = vadd_s32(*(int32x2_t *)v352.i8, v118);
                        v352 = v119;
                        if (sub_1D3E0BA8C(&buf, *(double *)v119.i64))
                          break;
                        if (v116 == ++v117)
                          goto LABEL_129;
                      }
                      v83 = v352;
                      v83.i32[2] = v117;
                      if ((unint64_t)v113 >= v114)
                      {
                        v353 = v83;
                        v120 = v113 - v112;
                        v121 = v120 + 1;
                        if ((unint64_t)(v120 + 1) >> 60)
                          sub_1D3D6D4F8();
                        if ((uint64_t)(v114 - (_QWORD)v112) >> 3 > v121)
                          v121 = (uint64_t)(v114 - (_QWORD)v112) >> 3;
                        if (v114 - (unint64_t)v112 >= 0x7FFFFFFFFFFFFFF0)
                          v122 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v122 = v121;
                        if (v122)
                          v122 = (unint64_t)sub_1D3D6DB64(v122);
                        else
                          v123 = 0;
                        v124 = (int32x4_t *)(v122 + 16 * v120);
                        v83.i64[1] = v353.i64[1];
                        *v124 = v353;
                        v125 = v124 + 1;
                        while (v113 != v112)
                        {
                          v126 = v113[-1];
                          --v113;
                          v83.i64[1] = v126.i64[1];
                          v124[-1] = v126;
                          --v124;
                        }
                        v114 = v122 + 16 * v123;
                        if (v112)
                          operator delete(v112);
                        v112 = v124;
                        v113 = v125;
                      }
                      else
                      {
                        *v113++ = v83;
                      }
                    }
LABEL_129:
                    ++v115;
                  }
                  while (v115 != 8);
                  v127 = 126 - 2 * __clz(v113 - v112);
                  if (v113 == v112)
                    v128 = 0;
                  else
                    v128 = v127;
                  sub_1D3D6DB98((uint64_t)v112, v113, v128, 1);
                  if (v113 == v112)
                  {
                    v129 = 0;
                    v134 = 0;
                  }
                  else
                  {
                    v129 = 0;
                    v130 = 0;
                    v131 = 0;
                    v132 = v112;
                    do
                    {
                      v133 = v132->i64[0];
                      if ((unint64_t)v130 >= v131)
                      {
                        v135 = (v130 - v129) >> 3;
                        v136 = v135 + 1;
                        if ((unint64_t)(v135 + 1) >> 61)
                          sub_1D3D6D4F8();
                        if ((uint64_t)(v131 - (_QWORD)v129) >> 2 > v136)
                          v136 = (uint64_t)(v131 - (_QWORD)v129) >> 2;
                        if (v131 - (unint64_t)v129 >= 0x7FFFFFFFFFFFFFF8)
                          v137 = 0x1FFFFFFFFFFFFFFFLL;
                        else
                          v137 = v136;
                        if (v137)
                          v137 = (unint64_t)sub_1D3D6D8A0(v137);
                        else
                          v138 = 0;
                        v139 = (char *)(v137 + 8 * v135);
                        *(_QWORD *)v139 = v133;
                        v134 = v139 + 8;
                        while (v130 != v129)
                        {
                          v140 = *((_QWORD *)v130 - 1);
                          v130 -= 8;
                          *((_QWORD *)v139 - 1) = v140;
                          v139 -= 8;
                        }
                        v131 = v137 + 8 * v138;
                        if (v129)
                          operator delete(v129);
                        v129 = v139;
                      }
                      else
                      {
                        *(_QWORD *)v130 = v133;
                        v134 = v130 + 8;
                      }
                      ++v132;
                      v130 = v134;
                    }
                    while (v132 != v113);
                  }
                  if (v112)
                    operator delete(v112);
                  if (v129 == v134)
                  {
                    v148 = 0;
                  }
                  else
                  {
                    v147 = v129 + 8;
                    do
                    {
                      v388 = (char *)*((_QWORD *)v147 - 1);
                      v148 = sub_1D3D6DA18((int32x2_t *)&p_buf, v81);
                      if (v148)
                        break;
                      _ZF = v147 == v134;
                      v147 += 8;
                    }
                    while (!_ZF);
                  }
                  if (v129)
                    operator delete(v129);
                  v80 = v339;
                  if (!v148)
                  {
LABEL_230:
                    v156 = 0;
                    v422 = 0;
                    v421 = 0;
                    v423 = 0;
LABEL_235:
                    v413 = 0;
                    __src = 0;
                    v182 = v156;
                    v414 = 0;
LABEL_236:
                    if (v182)
                    {
                      v422 = v182;
                      operator delete(v182);
                    }
                    v411 = __src != v413;
                    if (__src == v413 || (v190 = (char *)__src + 8, (char *)__src + 8 == v413))
                    {
                      v193 = (char *)__src;
                    }
                    else
                    {
                      v191 = *v416;
                      v192 = *(float32x2_t *)__src;
                      v193 = (char *)__src;
                      v194 = (char *)__src + 8;
                      do
                      {
                        v195 = *(float32x2_t *)v194;
                        v194 += 8;
                        v196 = (int8x8_t)v195;
                        v197 = vsub_f32(v191, v195);
                        v198 = (int32x2_t)vmul_f32(v197, v197);
                        v199 = vsub_f32(v191, v192);
                        v200 = (int32x2_t)vmul_f32(v199, v199);
                        v201 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v198, v200), (float32x2_t)vzip2_s32(v198, v200)));
                        v202 = vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v201, 1), v201).u8[0];
                        if ((v202 & 1) != 0)
                          v203 = -1;
                        else
                          v203 = 0;
                        v192 = (float32x2_t)vbsl_s8((int8x8_t)vdup_n_s32(v203), v196, (int8x8_t)v192);
                        if ((v202 & 1) != 0)
                          v193 = v190;
                        v190 = v194;
                      }
                      while (v194 != v413);
                    }
                    sub_1D3D6F124((char *)__src, v193, v413);
                    v410 = 0;
                    v409 = 0;
                    v408 = 0;
                    v407 = 0;
                    v406 = &buf;
                    v405 = 0;
                    v422 = 0;
                    v421 = 0;
                    v423 = 0;
                    sub_1D3D6F268(&v421, __src, (uint64_t)v413, (v413 - (_BYTE *)__src) >> 3);
                    if (v411)
                    {
                      v206 = (float32x2_t *)v421;
                      v207 = v422;
                      if (v421 != v422)
                      {
                        v208 = (float32x4_t)vzip1q_s32(v443, v444);
                        v208.i32[2] = v445.i32[0];
                        v209 = (float32x4_t)vzip2q_s32(vzip1q_s32(v443, v445), vdupq_lane_s32(*(int32x2_t *)v444.i8, 1));
                        v210 = (float32x4_t)vzip2q_s32(v443, v444);
                        v210.i32[2] = v445.i32[2];
                        do
                        {
                          v211 = (int32x4_t)vaddq_f32(v210, vmlaq_lane_f32(vmulq_n_f32(v208, COERCE_FLOAT(*v206)), v209, *v206, 1));
                          *v206++ = vdiv_f32(*(float32x2_t *)v211.i8, (float32x2_t)vdup_laneq_s32(v211, 2));
                        }
                        while (v206 != v207);
                        v206 = (float32x2_t *)v421;
                      }
                      sub_1D3E0B678((uint64_t)&buf, v206, (float)v415 * 0.5);
                      v212 = sub_1D3DDFE8C((uint64_t)v406, v419, &v407, &v410, &v409, (int *)&v408 + 1, &v408);
                      v405 = v212;
                    }
                    else
                    {
                      v212 = v405;
                    }
                    v403 = 0;
                    v402 = 0;
                    v404 = 0;
                    p_buf = &v405;
                    v388 = (char *)&v407;
                    v389 = (int32x2_t)&buf;
                    v390 = (uint64_t)&v362;
                    v391 = (unsigned int **)&v406;
                    v392 = &v419;
                    v393 = &v410;
                    v394 = &v409;
                    v395 = (char *)&v408 + 4;
                    v396 = &v408;
                    v397 = &v420;
                    v398 = &v411;
                    p_src = &__src;
                    v400 = &v415;
                    v401 = &v402;
                    v355 = v212;
                    if (v212)
                    {
                      v213 = 1;
                    }
                    else
                    {
                      v213 = sub_1D3DE00B0((uint64_t)&p_buf, v204, v205);
                      v405 = v213;
                    }
                    __p[0] = &v405;
                    __p[1] = &v407;
                    *(_QWORD *)&v377 = &v402;
                    *((_QWORD *)&v377 + 1) = &v411;
                    *(_QWORD *)&v378 = &v362;
                    *((_QWORD *)&v378 + 1) = &v415;
                    v379 = &v421;
                    v380 = &buf;
                    v381 = (unsigned int **)&v406;
                    v382 = &v419;
                    v383 = &v410;
                    v384 = &v409;
                    v385 = (char *)&v408 + 4;
                    v386 = &v408;
                    v214 = v213;
                    if (!v213)
                    {
                      v215 = sub_1D3DE0500((uint64_t)__p);
                      v405 = v215;
                      if (!v215)
                        goto LABEL_292;
                    }
                    v375 = 0;
                    v216 = v409;
                    if (v409)
                    {
                      v217 = (unsigned int *)operator new();
                      v218 = (double)v216 * 1.57079633;
                      v219 = __sincosf_stret(v218);
                      *(float *)&v205 = v219.__cosval;
                      v217[2] = 0;
                      v220 = v217 + 2;
                      *(_QWORD *)v217 = &off_1E95AF428;
                      v217[3] = LODWORD(v219.__cosval);
                      *((float *)v217 + 4) = -v219.__sinval;
                      v217[5] = 0;
                      *((__float2 *)v217 + 3) = v219;
                      v204 = 0.0;
                      *((_OWORD *)v217 + 2) = xmmword_1D3E821D0;
                      do
                        v221 = __ldxr(v220);
                      while (__stxr(v221 + 1, v220));
                      if (v375)
                        sub_1D3D6D13C(v375);
                      v375 = v217;
                    }
                    else
                    {
                      v217 = 0;
                    }
                    if (v410)
                    {
                      v222 = operator new();
                      *(_DWORD *)(v222 + 8) = 0;
                      v223 = (unsigned int *)(v222 + 8);
                      *(_QWORD *)v222 = &off_1E95AF428;
                      *(_OWORD *)(v222 + 12) = xmmword_1D3E821E0;
                      *(_OWORD *)(v222 + 28) = xmmword_1D3E82060;
                      *(_DWORD *)(v222 + 44) = 1065353216;
                      do
                        v224 = __ldxr(v223);
                      while (__stxr(v224 + 1, v223));
                      v374 = (unsigned int *)v222;
                      v225 = (float *)v375;
                      if (v375)
                      {
                        do
                          v226 = __ldxr(v223);
                        while (__stxr(v226 + 1, v223));
                        v372 = (unsigned int *)v222;
                        sub_1D3DB9654((uint64_t *)&v373, v225, (uint64_t)&v372);
                        v227 = v373;
                        if (v373)
                        {
                          v228 = v373 + 2;
                          do
                            v229 = __ldxr(v228);
                          while (__stxr(v229 + 1, v228));
                        }
                        if (v375)
                          sub_1D3D6D13C(v375);
                        v375 = v227;
                        sub_1D3D6F2E0(&v373);
                        sub_1D3D6F2E0(&v372);
                      }
                      else
                      {
                        do
                          v230 = __ldxr(v223);
                        while (__stxr(v230 + 1, v223));
                        v375 = (unsigned int *)v222;
                      }
                      sub_1D3D6F2E0(&v374);
                      v217 = v375;
                    }
                    v231 = v419;
                    v232 = v407;
                    v233 = v408;
                    v234 = HIDWORD(v408);
                    if (v217)
                    {
                      v235 = v217 + 2;
                      do
                        v236 = __ldxr(v235);
                      while (__stxr(v236 + 1, v235));
                    }
                    v373 = v217;
                    sub_1D3DE0BC4(&v374, (uint64_t)&buf, v231, v232, v233, v234, v217, v204, *(int32x2_t *)&v205);
                    v237 = v374;
                    if (v374)
                    {
                      v238 = v374 + 2;
                      do
                        v239 = __ldxr(v238);
                      while (__stxr(v239 + 1, v238));
                    }
                    if (v357)
                      sub_1D3D6D13C(v357);
                    v357 = v237;
                    sub_1D3D7F7E4(&v374);
                    sub_1D3D6F2E0(&v373);
                    if (v237)
                    {
LABEL_291:
                      sub_1D3D6F2E0(&v375);
LABEL_292:
                      if (v402)
                      {
                        v403 = v402;
                        operator delete(v402);
                      }
                      if (v421)
                      {
                        v422 = (float32x2_t *)v421;
                        operator delete(v421);
                      }
                      if (__src)
                      {
                        v413 = (char *)__src;
                        operator delete(__src);
                      }
                      v57 = v416;
                      goto LABEL_299;
                    }
                    if (v355 && sub_1D3DE00B0((uint64_t)&p_buf, v240, v241))
                    {
                      v246 = v419;
                      v247 = v407;
                      v248 = v408;
                      v249 = HIDWORD(v408);
                      v250 = v375;
                      if (v375)
                      {
                        v251 = v375 + 2;
                        do
                          v252 = __ldxr(v251);
                        while (__stxr(v252 + 1, v251));
                      }
                      v371 = v250;
                      sub_1D3DE0BC4(&v374, (uint64_t)&buf, v246, v247, v248, v249, v250, v244, v245);
                      v253 = v374;
                      if (v374)
                      {
                        v254 = v374 + 2;
                        do
                          v255 = __ldxr(v254);
                        while (__stxr(v255 + 1, v254));
                      }
                      v357 = v253;
                      sub_1D3D7F7E4(&v374);
                      sub_1D3D6F2E0(&v371);
                      if (!v214 || v253)
                        goto LABEL_291;
                    }
                    else if (!v214)
                    {
                      goto LABEL_291;
                    }
                    if (sub_1D3DE0500((uint64_t)__p))
                    {
                      v258 = v419;
                      v259 = v407;
                      v260 = v408;
                      v261 = HIDWORD(v408);
                      v262 = v375;
                      if (v375)
                      {
                        v263 = v375 + 2;
                        do
                          v264 = __ldxr(v263);
                        while (__stxr(v264 + 1, v263));
                      }
                      v370 = v262;
                      sub_1D3DE0BC4(&v374, (uint64_t)&buf, v258, v259, v260, v261, v262, v256, v257);
                      v265 = v374;
                      if (v374)
                      {
                        v266 = v374 + 2;
                        do
                          v267 = __ldxr(v266);
                        while (__stxr(v267 + 1, v266));
                      }
                      v357 = v265;
                      sub_1D3D7F7E4(&v374);
                      sub_1D3D6F2E0(&v370);
                    }
                    goto LABEL_291;
                  }
                }
                v149 = v81 * (float)v80;
                v150 = (int32x2_t)v388;
                v389 = (int32x2_t)0x100000000;
                v151 = (int)v149;
                if (sub_1D3D6E654((int32x2_t *)&p_buf, (v80 + 1) >> 1, (int)v149, (int)(float)(v81 / 5.0), (int)(float)(v81 * 0.5)) != -1)
                {
                  v340 = v80;
                  v153 = (int32x2_t)v388;
                  v152.i32[0] = -v389.i32[1];
                  v389 = vzip1_s32(v152, v389);
                  __p[0] = 0;
                  __p[1] = 0;
                  *(_QWORD *)&v377 = 0;
                  sub_1D3D6E838(__p, vcvts_n_u32_f32(v149, 2uLL));
                  v154 = 0;
                  v155 = v149 * 8.0;
                  v156 = (float32x2_t *)__p[1];
                  v157 = v377;
                  v158 = v153;
                  while (1)
                  {
                    v159 = vadd_f32(vcvt_f32_s32(v158), (float32x2_t)0x3F0000003F000000);
                    if ((unint64_t)v156 >= v157)
                    {
                      v160 = (float32x2_t *)__p[0];
                      v161 = ((char *)v156 - (char *)__p[0]) >> 3;
                      v162 = v161 + 1;
                      if ((unint64_t)(v161 + 1) >> 61)
                        sub_1D3D6D4F8();
                      if ((uint64_t)(v157 - (unint64_t)__p[0]) >> 2 > v162)
                        v162 = (uint64_t)(v157 - (unint64_t)__p[0]) >> 2;
                      if (v157 - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFF8)
                        v163 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v163 = v162;
                      if (v163)
                        v163 = (unint64_t)sub_1D3D6D8A0(v163);
                      else
                        v164 = 0;
                      v165 = (float32x2_t *)(v163 + 8 * v161);
                      *v165 = v159;
                      v166 = v165 + 1;
                      if (v156 != v160)
                      {
                        do
                        {
                          v167 = v156[-1];
                          --v156;
                          v165[-1] = v167;
                          --v165;
                        }
                        while (v156 != v160);
                        v156 = (float32x2_t *)__p[0];
                      }
                      v157 = v163 + 8 * v164;
                      __p[0] = v165;
                      __p[1] = v166;
                      *(_QWORD *)&v377 = v157;
                      if (v156)
                        operator delete(v156);
                      v156 = v166;
                    }
                    else
                    {
                      *v156++ = v159;
                    }
                    __p[1] = v156;
                    v168 = (int32x2_t)v388;
                    v169 = vsub_s32((int32x2_t)v388, v150);
                    v170 = v169.i32[1];
                    v171 = v169.i32[0];
                    v172 = v169.i32[0] >= 0 ? v169.i32[0] : -v169.i32[0];
                    v173 = v169.i32[1] >= 0 ? v169.i32[1] : -v169.i32[1];
                    v174 = v172 <= v173 ? v173 : v172;
                    v169.i32[0] = -v389.i32[1];
                    v354 = v389;
                    v175 = vzip1_s32(v169, v389);
                    v176 = vneg_s32(v175);
                    if (sub_1D3D6F420((uint64_t)&p_buf, v176) == -1)
                    {
                      v389 = v176;
                    }
                    else if (sub_1D3D6F420((uint64_t)&p_buf, v354) == -1)
                    {
                      v176 = v354;
                    }
                    else
                    {
                      v389 = v175;
                      if (sub_1D3D6F420((uint64_t)&p_buf, v175) == -1)
                      {
                        v176 = v175;
                      }
                      else
                      {
                        v177.i32[1] = v354.i32[1];
                        v177.i32[0] = -v354.i32[0];
                        v176 = vzip1_s32(v177, v175);
                        v389 = v176;
                        if (sub_1D3D6F420((uint64_t)&p_buf, v176) != -1)
                          break;
                      }
                    }
                    v158 = vadd_s32(v176, v168);
                    v388 = (char *)v158;
                    if (v158.i32[0] < 0
                      || *((_QWORD *)p_buf + 1) <= (unint64_t)v158.u32[0]
                      || v158.i32[1] < 0
                      || *((_QWORD *)p_buf + 2) <= (unint64_t)v158.u32[1])
                    {
                      break;
                    }
                    v178 = vsub_s32(v158, v150);
                    v179 = v178.i32[1];
                    v180 = v178.i32[0];
                    if (v178.i32[0] < 0)
                      v180 = -v178.i32[0];
                    if (v178.i32[1] < 0)
                      v179 = -v178.i32[1];
                    if (v180 > v179)
                      v179 = v180;
                    if (v179 > v151)
                      break;
                    v181 = (uint32x2_t)vceq_s32(v158, v150);
                    if ((vpmin_u32(v181, v181).u32[0] & 0x80000000) != 0)
                      break;
                    v182 = (float32x2_t *)__p[0];
                    if (v155 < (float)(unint64_t)(((char *)v156 - (char *)__p[0]) >> 3))
                      break;
                    v154 |= 1 << (v171 / v174 + 3 * (v170 / v174) + 4);
                    v183 = (uint32x2_t)vceq_s32(v158, v153);
                    if ((vpmin_u32(v183, v183).u32[0] & 0x80000000) != 0)
                    {
                      if (v154 == 495)
                      {
                        v421 = __p[0];
                        v422 = v156;
                        v423 = v377;
                        if (__p[0] == v156)
                          goto LABEL_235;
                        sub_1D3D6E8CC((float32x2_t **)&p_buf, (char **)&v421, vadd_f32(vcvt_f32_s32(v150), (float32x2_t)0x3F0000003F000000));
                        v184 = (char *)p_buf;
                        v185 = v388;
                        if (p_buf == v388 || !sub_1D3D6F09C((float32x2_t *)p_buf, (uint64_t)v388, v340))
                        {
                          v413 = 0;
                          __src = 0;
                          v414 = 0;
                          if (v184)
                            operator delete(v184);
                        }
                        else
                        {
                          v186 = v185 - 8;
                          if (v185 - 8 > v184)
                          {
                            v187 = v184 + 8;
                            do
                            {
                              v188 = *((_QWORD *)v187 - 1);
                              *((_QWORD *)v187 - 1) = *(_QWORD *)v186;
                              *(_QWORD *)v186 = v188;
                              v186 -= 8;
                              _CF = v187 >= v186;
                              v187 += 8;
                            }
                            while (!_CF);
                          }
                          __src = v184;
                          v413 = v185;
                          v414 = v389;
                        }
                        goto LABEL_236;
                      }
LABEL_232:
                      v422 = 0;
                      v421 = 0;
                      v423 = 0;
                      if (v182)
                        operator delete(v182);
                      v156 = 0;
                      goto LABEL_235;
                    }
                  }
                  v182 = (float32x2_t *)__p[0];
                  goto LABEL_232;
                }
                goto LABEL_230;
              }
              v84 = v362[1];
              v85 = vsub_f32(*v362, v84);
              v86 = v362[2];
              v87 = v362[3];
              v88 = vsub_f32(v86, v87);
              v85.f32[0] = sqrtf(vaddv_f32(vmul_f32(v85, v85))) + sqrtf(vaddv_f32(vmul_f32(v88, v88)));
              v88.f32[0] = v56 + v56;
              v89 = v85.f32[0] / (float)(v56 + v56);
              v90 = vsub_f32(*v362, v87);
              v91 = vsub_f32(v84, v86);
              v92 = (float)(sqrtf(vaddv_f32(vmul_f32(v91, v91))) + sqrtf(vaddv_f32(vmul_f32(v90, v90)))) / v88.f32[0];
              switch(v40)
              {
                case 1:
                  v99 = &dword_1D3E8100C;
                  v100 = 4;
                  break;
                case 2:
                  v99 = &dword_1D3E8101C;
                  v100 = 24;
                  break;
                case 3:
                  v93 = 0;
                  if (v92 < 54.4 && v89 < 22.4 && v89 > 5.4 && v92 > 15.4)
                  {
                    v94 = 0;
                    v95 = 0;
                    v96 = 1.0;
                    do
                    {
                      v97 = (float)(vabds_f32((float)*(int *)&asc_1D3E80FDC[4 * v94], v89)
                                  + vabds_f32((float)dword_1D3E80FF4[v94], v92))
                          / (float)(dword_1D3E80FF4[v94] + *(_DWORD *)&asc_1D3E80FDC[4 * v94]);
                      if (v97 < v96)
                      {
                        v95 = v94;
                        v96 = v97;
                      }
                      ++v94;
                    }
                    while (v94 != 6);
                    if (v96 <= 0.1)
                    {
                      v98 = (int32x2_t *)sub_1D3D6D8A0(1uLL);
                      v98->i32[0] = *(_DWORD *)&asc_1D3E80FDC[4 * v95];
                      v98->i32[1] = dword_1D3E80FF4[v95];
                      v338 = v98 + 1;
                      v93 = v98;
LABEL_355:
                      v334 = v93;
                      v285 = v93;
                      while (1)
                      {
                        v286 = v285->i32[0];
                        v287 = v285->i32[1];
                        sub_1D3DB93EC((uint64_t *)&p_buf, 0.0, 0.0, 0.0, (float)(int)v286, (float)(int)v287, (float)(int)v286, (float)(int)v287, 0.0, COERCE_FLOAT(*v362), COERCE_FLOAT(HIDWORD(*(unint64_t *)v362)), COERCE_FLOAT(*(_QWORD *)&v362[1]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&v362[1])), COERCE_FLOAT(*(_QWORD *)&v362[2]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&v362[2])), COERCE_FLOAT(*(_QWORD *)&v362[3]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&v362[3])));
                        v288 = (unsigned int *)p_buf;
                        if (p_buf)
                        {
                          v289 = (unsigned int *)((char *)p_buf + 8);
                          do
                            v290 = __ldxr(v289);
                          while (__stxr(v290 + 1, v289));
                        }
                        v344 = v285;
                        if (v446)
                          sub_1D3D6D13C(v446);
                        v446 = v288;
                        sub_1D3D6F2E0((unsigned int **)&p_buf);
                        v291 = 0;
                        do
                        {
                          v292 = flt_1D3E80CE8[v291++];
                          v293 = flt_1D3E80CE8[v291];
                          v294 = (unsigned int *)operator new();
                          sub_1D3D938C4((uint64_t)v294, v287, v286);
                          v295 = v294 + 2;
                          do
                            v296 = __ldxr(v295);
                          while (__stxr(v296 + 1, v295));
                          v402 = v294;
                          sub_1D3D8D5CC(&p_buf, 2 * v287);
                          if ((int)v286 >= 1)
                          {
                            v297 = 0;
                            while (1)
                            {
                              if ((int)v287 >= 1)
                              {
                                v298 = 0;
                                v299 = (float *)((char *)p_buf + 4);
                                do
                                {
                                  *(v299 - 1) = v292 + (float)((float)v298 + 0.5);
                                  *v299 = v293 + (float)((float)(int)v297 + 0.5);
                                  ++v298;
                                  v299 += 2;
                                }
                                while ((_DWORD)v287 != v298);
                              }
                              sub_1D3E0B720(__p, (uint64_t)&buf, (uint64_t *)&p_buf);
                              v300 = (char *)__p[0];
                              if ((int)v287 >= 1)
                                break;
                              if (__p[0])
                                goto LABEL_376;
LABEL_377:
                              if (++v297 == v286)
                                goto LABEL_378;
                            }
                            v301 = 0;
                            do
                            {
                              if (((*(_QWORD *)&v300[(v301 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v301) & 1) != 0)
                                *(_DWORD *)(*((_QWORD *)v294 + 6)
                                          + (((v301 + v297 * *((_QWORD *)v294 + 3)) >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << (v301 + v297 * *((_QWORD *)v294 + 3));
                              ++v301;
                            }
                            while (v287 != v301);
LABEL_376:
                            operator delete(v300);
                            goto LABEL_377;
                          }
LABEL_378:
                          if (p_buf)
                          {
                            v388 = (char *)p_buf;
                            operator delete(p_buf);
                          }
                          v406 = 0;
                          if ((v337 - 2) >= 2)
                          {
                            if (v337 != 1)
                              goto LABEL_401;
                            v309 = (unsigned int *)v402;
                            if (v402)
                            {
                              v310 = (unsigned int *)((char *)v402 + 8);
                              do
                                v311 = __ldxr(v310);
                              while (__stxr(v311 + 1, v310));
                            }
                            v375 = v309;
                            sub_1D3E163D8(&p_buf, (uint64_t)v309);
                            v312 = (unsigned int *)p_buf;
                            if (p_buf)
                            {
                              v313 = (unsigned int *)((char *)p_buf + 8);
                              do
                                v314 = __ldxr(v313);
                              while (__stxr(v314 + 1, v313));
                            }
                            if (v406)
                              sub_1D3D6D13C((unsigned int *)v406);
                            v406 = (int32x4_t *)v312;
                            sub_1D3D7F814((unsigned int **)&p_buf);
                            sub_1D3D6D10C(&v375);
                            v308 = 11;
                          }
                          else
                          {
                            v302 = (unsigned int *)v402;
                            if (v402)
                            {
                              v303 = (unsigned int *)((char *)v402 + 8);
                              do
                                v304 = __ldxr(v303);
                              while (__stxr(v304 + 1, v303));
                            }
                            v374 = v302;
                            sub_1D3DC7D80((unsigned int **)&p_buf, &v374);
                            v305 = (unsigned int *)p_buf;
                            if (p_buf)
                            {
                              v306 = (unsigned int *)((char *)p_buf + 8);
                              do
                                v307 = __ldxr(v306);
                              while (__stxr(v307 + 1, v306));
                            }
                            if (v406)
                              sub_1D3D6D13C((unsigned int *)v406);
                            v406 = (int32x4_t *)v305;
                            sub_1D3D7F814((unsigned int **)&p_buf);
                            sub_1D3D6D10C(&v374);
                            v308 = 2;
                          }
                          v315 = (unsigned int *)v406;
                          if (v406)
                          {
                            p_buf = 0;
                            v388 = 0;
                            v389 = 0;
                            v316 = v362;
                            v317 = v363;
                            if (v362 == v363)
                            {
                              v93 = v334;
                            }
                            else
                            {
                              __asm { FMOV            V1.4S, #1.0 }
                              _Q1.i64[0] = __PAIR64__(LODWORD(v335), LODWORD(v349));
                              v348 = _Q1;
                              v93 = v334;
                              do
                              {
                                v356 = *v316;
                                v321 = (char *)operator new();
                                v322 = (int32x4_t)vaddq_f32(v348, vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1D3E82060, v356.f32[0]), (float32x4_t)xmmword_1D3E821C0, v356, 1));
                                *((_DWORD *)v321 + 2) = 0;
                                v323 = (unsigned int *)(v321 + 8);
                                *(_QWORD *)v321 = &off_1E95AF250;
                                *(float32x2_t *)(v321 + 12) = vdiv_f32(*(float32x2_t *)v322.i8, (float32x2_t)vdup_laneq_s32(v322, 2));
                                __p[0] = v321;
                                v324 = (unsigned int **)v388;
                                if ((unint64_t)v388 >= *(_QWORD *)&v389)
                                {
                                  v326 = sub_1D3DD1D5C((uint64_t)&p_buf, (unsigned int **)__p);
                                }
                                else
                                {
                                  *(_QWORD *)v388 = 0;
                                  do
                                    v325 = __ldxr(v323);
                                  while (__stxr(v325 + 1, v323));
                                  if (*v324)
                                    sub_1D3D6D13C(*v324);
                                  *v324 = (unsigned int *)v321;
                                  v326 = (uint64_t)(v324 + 1);
                                }
                                v388 = (char *)v326;
                                ++v316;
                              }
                              while (v316 != v317);
                              v315 = (unsigned int *)v406;
                            }
                            *((_DWORD *)sub_1D3D7F308((uint64_t **)v315 + 12, 9, (unsigned int *)&unk_1D3E80D00) + 8) = v336;
                            v327 = (unsigned int *)operator new();
                            v372 = 0;
                            LODWORD(__p[1]) = 0;
                            __p[0] = &off_1E95AF9B0;
                            *(_QWORD *)&v377 = 0;
                            v328 = v406[2].i64[0];
                            if (v328)
                            {
                              v329 = (unsigned int *)(v328 + 8);
                              do
                                v330 = __ldxr(v329);
                              while (__stxr(v330 + 1, v329));
                              if ((_QWORD)v377)
                                sub_1D3D6D13C((unsigned int *)v377);
                            }
                            *(_QWORD *)&v377 = v328;
                            v423 = 0;
                            v421 = 0;
                            v422 = 0;
                            sub_1D3D6D6A8((unsigned int *)&v421, (unsigned int **)p_buf, (unsigned int **)v388, (v388 - (_BYTE *)p_buf) >> 3);
                            sub_1D3D7F3AC((uint64_t)&v416, (int32x4_t *)v406[6].i64);
                            sub_1D3E17B10((uint64_t)v327, (uint64_t *)&v372, (uint64_t)__p, (unsigned int ***)&v421, v308, &v416);
                            v331 = v327 + 2;
                            do
                              v332 = __ldxr(v331);
                            while (__stxr(v332 + 1, v331));
                            v373 = v327;
                            sub_1D3D7F520(v417);
                            __src = &v421;
                            sub_1D3D6D79C((void ***)&__src);
                            sub_1D3D7F558(__p);
                            sub_1D3D7F598(&v372);
                            do
                              v333 = __ldxr(v331);
                            while (__stxr(v333 + 1, v331));
                            v371 = v327;
                            **(_WORD **)(a2 + 64) = sub_1D3E48F24((uint64_t *)&v371, *(uint64_t **)a2) | 0x100;
                            sub_1D3D7F7E4(&v371);
                            sub_1D3D7F7E4(&v373);
                            __src = &p_buf;
                            sub_1D3D6D79C((void ***)&__src);
                            sub_1D3D7F814((unsigned int **)&v406);
                            sub_1D3D6D10C((unsigned int **)&v402);
                            if (!v93)
                              goto LABEL_307;
LABEL_105:
                            operator delete(v93);
LABEL_307:
                            sub_1D3D6F2E0(&v446);
LABEL_308:
                            if (v367)
                              sub_1D3DF7818((uint64_t)&v358);
LABEL_13:
                            v7 = *(_BYTE **)(a2 + 64);
                            if (v7[1] && *v7)
                              return;
                            goto LABEL_15;
                          }
LABEL_401:
                          sub_1D3D7F814((unsigned int **)&v406);
                          sub_1D3D6D10C((unsigned int **)&v402);
                        }
                        while (v291 != 5);
                        ++v285;
                        v93 = v334;
                        if (&v344[1] == v338)
                          goto LABEL_104;
                      }
                    }
LABEL_103:
                    v93 = 0;
                  }
LABEL_104:
                  **(_WORD **)(a2 + 64) = 256;
                  if (v93)
                    goto LABEL_105;
                  goto LABEL_307;
                default:
                  goto LABEL_103;
              }
              v101 = *v99;
              if (v92 >= v89)
                v102 = v89;
              else
                v102 = v92;
              if (v102 <= (float)((float)v101 - (float)((float)*v99 * 0.4)))
                goto LABEL_103;
              v103 = (float)v99[v100 - 1];
              v104 = v103 * 0.4;
              v105 = v89 >= v92 ? v89 : v92;
              if (v105 >= (float)(v104 + v103))
                goto LABEL_103;
              v106 = (float)(v89 + v92) * 0.5;
              v107 = (unint64_t)&v99[v100];
              v108 = 4 * v100;
              v109 = 4;
              v110 = (unsigned int *)v99;
              do
              {
                if (vabds_f32((float)v99[(unint64_t)v109 / 4], v106) < vabds_f32((float)v101, v106))
                {
                  v101 = v99[(unint64_t)v109 / 4];
                  v110 = (unsigned int *)&v99[(unint64_t)v109 / 4];
                }
                v109 += 4;
              }
              while (v108 != v109);
              v111 = *v110;
              if (vabds_f32((float)(int)*v110, v106) > v104)
                goto LABEL_103;
              v141 = (int32x2_t *)sub_1D3D6D8A0(1uLL);
              v143 = v141;
              v144 = &v141[v142];
              *v141 = vdup_n_s32(v111);
              v145 = v141 + 1;
              if (v99 < (int *)v110)
              {
                v146 = *(v110 - 1);
                if (v142 < 2)
                {
                  v268 = 2;
                  if ((unint64_t)((8 * v142) >> 2) > 2)
                    v268 = (8 * v142) >> 2;
                  if ((unint64_t)(8 * v142) >= 0x7FFFFFFFFFFFFFF8)
                    v269 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v269 = v268;
                  v270 = (int32x2_t *)sub_1D3D6D8A0(v269);
                  v271 = 0;
                  v144 = &v270[v272];
                  v270[1] = vdup_n_s32(v146);
                  v145 = v270 + 2;
                  do
                  {
                    v270[v271] = v143[v271];
                    --v271;
                  }
                  while (v271 != -1);
                  v93 = v270;
                  operator delete(v143);
LABEL_338:
                  if ((unint64_t)(v110 + 1) < v107)
                  {
                    v273 = v110[1];
                    if (v145 >= v144)
                    {
                      v274 = v145 - v93;
                      v275 = v274 + 1;
                      if ((unint64_t)(v274 + 1) >> 61)
                        sub_1D3D6D4F8();
                      v276 = v145;
                      if (((char *)v144 - (char *)v93) >> 2 > v275)
                        v275 = ((char *)v144 - (char *)v93) >> 2;
                      if ((unint64_t)((char *)v144 - (char *)v93) >= 0x7FFFFFFFFFFFFFF8)
                        v277 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v277 = v275;
                      v278 = (int32x2_t *)((char *)sub_1D3D6D8A0(v277) + 8 * v274);
                      *v278 = vdup_n_s32(v273);
                      v279 = v278 + 1;
                      while (v276 != v93)
                      {
                        v280 = v276[-1];
                        --v276;
                        v278[-1] = v280;
                        --v278;
                      }
                      operator delete(v93);
                      v93 = v278;
                      v145 = v279;
                    }
                    else
                    {
                      v145->i32[0] = v273;
                      v145->i32[1] = v273;
                      ++v145;
                    }
                  }
                  if ((char *)v145 - (char *)v93 == 24)
                  {
                    v281 = v93[2].i32[0];
                    v282 = v93[1].i32[0];
                    if (vabds_f32((float)v281, v106) < vabds_f32((float)v282, v106))
                    {
                      v283 = v93[1].i32[1];
                      v284 = v93[2].i32[1];
                      v93[1].i32[0] = v281;
                      v93[1].i32[1] = v284;
                      v93[2].i32[0] = v282;
                      v93[2].i32[1] = v283;
                    }
                  }
                  v338 = v145;
                  if (v93 != v145)
                    goto LABEL_355;
                  goto LABEL_104;
                }
                v141[1].i32[0] = v146;
                v141[1].i32[1] = v146;
                v145 = v141 + 2;
              }
              v93 = v141;
              goto LABEL_338;
            }
          }
        }
        **(_WORD **)(a2 + 64) = 256;
        goto LABEL_308;
      }
      v38 = 5;
    }
    (*(void (**)(void))(*v37 + 8 * v38))();
    goto LABEL_38;
  }
LABEL_15:
  v8 = *(unint64_t **)(a1 + 8);
  if (!sub_1D3DDD9BC((uint64_t)v8)
    || (buf.i8[0] = 0, buf.i8[4] = 0, (sub_1D3DDC428(v8, CFSTR("QR"), (uint64_t)&buf) & 1) != 0)
    || !*(_BYTE *)(a2 + 32))
  {
    sub_1D3E4EEF0((unint64_t *)a1, a2);
  }
}

void sub_1D3E4D030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,unsigned int *a28,__int16 a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  void *v38;

  if (v38)
    operator delete(v38);
  if (STACK[0x2B8])
    operator delete((void *)STACK[0x2B8]);
  sub_1D3D7F7E4(&a28);
  sub_1D3D6F2E0((unsigned int **)&STACK[0x410]);
  if (a38)
    sub_1D3DF7818((uint64_t)&a29);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E4D334(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  uint64_t v3;
  uint64_t j;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v12;
  char v13;
  BOOL v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  char v18;

  for (i = 0; i != 4; ++i)
  {
    v3 = 0;
    while (i == v3 || *(float *)(a1 + 4 * v3) <= *(float *)(a1 + 4 * i))
    {
      if (++v3 == 5)
        goto LABEL_8;
    }
  }
LABEL_8:
  for (j = 0; j != 4; ++j)
  {
    if (j != i)
    {
      v5 = 0;
      while (i == v5 || j == v5 || *(float *)(a1 + 4 * v5) <= *(float *)(a1 + 4 * j))
      {
        if (++v5 == 5)
          goto LABEL_17;
      }
    }
  }
LABEL_17:
  v6 = 0;
  v7 = *(float *)(a1 + 4 * (int)i);
  if (v7 >= *(float *)(a1 + 4 * (int)j))
    v7 = *(float *)(a1 + 4 * (int)j);
  *(float *)a2 = v7;
  v8 = *(float *)(a1 + 4 * (int)i);
  if (v8 <= *(float *)(a1 + 4 * (int)j))
    v8 = *(float *)(a1 + 4 * (int)j);
  *(float *)(a2 + 4) = v8;
  *(float *)(a2 + 8) = *(float *)(a1 + 4 * (int)i) + *(float *)(a1 + 4 * (int)j);
  *(_DWORD *)(a2 + 12) = 2;
  v9 = v8 + 1.0;
  *(float *)(a2 + 16) = v9;
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 28) = 3;
  v10 = 0.0;
  v11 = 0.0;
  do
  {
    if (4 * i != v6 && 4 * j != v6)
    {
      if (v9 >= *(float *)(a1 + v6))
        v9 = *(float *)(a1 + v6);
      *(float *)(a2 + 16) = v9;
      if (v11 <= *(float *)(a1 + v6))
        v11 = *(float *)(a1 + v6);
      *(float *)(a2 + 20) = v11;
      v10 = *(float *)(a1 + v6) + v10;
      *(float *)(a2 + 24) = v10;
    }
    v6 += 4;
  }
  while (v6 != 20);
  if ((int)i >= (int)j)
    v12 = j;
  else
    v12 = i;
  v13 = 7;
  switch(v12)
  {
    case 0:
      if ((int)i <= (int)j)
        LODWORD(i) = j;
      v14 = i >= 5;
      v15 = 8 * i;
      v16 = 0x1080503FFLL;
      goto LABEL_41;
    case 1:
      if ((int)i <= (int)j)
        LODWORD(i) = j;
      v14 = i >= 5;
      v15 = 8 * i;
      v16 = 0x20906FFFFLL;
LABEL_41:
      v17 = v16 >> v15;
      if (v14)
        v13 = -1;
      else
        v13 = v17;
      break;
    case 2:
      if ((int)i <= (int)j)
        LODWORD(i) = j;
      if ((_DWORD)i == 4)
        v18 = 4;
      else
        v18 = -1;
      if ((_DWORD)i == 3)
        v13 = 0;
      else
        v13 = v18;
      break;
    case 3:
      return v13;
    default:
      v13 = -1;
      break;
  }
  return v13;
}

float sub_1D3E4D518(uint64_t a1)
{
  float v1;
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  _BOOL4 v7;
  float result;

  v1 = *(float *)(a1 + 8) / (float)*(int *)(a1 + 12);
  v2 = (float)(*(float *)(a1 + 4) - *(float *)a1) / v1;
  v3 = (float)(*(float *)(a1 + 20) - *(float *)(a1 + 16)) / v1;
  v4 = 1.0;
  v5 = 1.0;
  if (v2 >= 0.2)
  {
    v5 = 0.0;
    if (v2 < 0.4)
      v5 = (float)(0.4 - v2) / 0.2;
  }
  if (v3 >= 0.3)
  {
    v4 = 0.0;
    if (v3 < 0.4)
      v4 = (float)(0.4 - v3) / 0.1;
  }
  v6 = v1 / (float)(*(float *)(a1 + 24) / (float)*(int *)(a1 + 28));
  v7 = v6 >= 1.5;
  if (v6 > 3.5)
    v7 = 0;
  result = (float)v7;
  if (v4 < (float)v7)
    result = v4;
  if (v5 < result)
    return v5;
  return result;
}

uint64_t sub_1D3E4D5E4(int a1, float *a2, int a3, float *a4, uint64_t a5, unsigned int a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v27;
  float v28;
  float v29;
  float v30;
  size_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float *v46;
  float *v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float *v63;
  signed int v64;
  int v65;
  uint64_t v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  char v72;
  float v73;
  char v74;
  uint64_t v75;
  char v76;
  float *v77;
  uint64_t v78;
  int v79;
  char v80;
  float v81;
  float v82;
  _DWORD *v83;
  float v84;
  float32x2_t v85;
  uint64_t v86;
  float v87;
  int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  float v92;
  float v93;
  float v94;
  uint64_t v95;
  float v96;
  int v97;
  float *v98;
  int *v99;
  int v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  int v104;
  float v105;
  float v106;
  float32x2_t v107;
  float v108;
  int v109;
  int v110;
  uint64_t v111;
  float *v112;
  float v113;
  float v114;
  float v115;
  float v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  float v122;
  float v123;
  float v124;
  uint64_t i;
  uint64_t v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  uint64_t v132;
  float *v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v140;
  float v141;
  float v142;
  float v143;
  void *v144;
  float v145;
  float v146;
  unsigned int v147;
  int v148;
  uint64_t v149;
  char *v150;
  unint64_t v151;
  double v152;
  double v153;
  _DWORD *v155;
  _BOOL8 v156;
  float v157;
  int v161;
  float64x2_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  float *v166;
  float *v167;
  uint64_t v168;
  float v169;
  float v170;
  float v171;
  float v172;
  float v173;
  float v174;
  uint64_t v175;
  char *v176;
  float *v177;
  float *v178;
  uint64_t v179;
  int v180;
  int v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int16 v186;
  uint64_t v187;
  float v188;
  _BYTE v189[10];
  _BYTE v190[10];
  _BYTE v191[20];
  _BYTE v192[60];
  int v193;
  _DWORD v194[11];
  uint64_t v195;

  v195 = *MEMORY[0x1E0C80C00];
  v8 = a3 % 5;
  v9 = 6;
  if (a1 >= 3 && a3 >= 2)
  {
    v11 = a2[2];
    v12 = (float)(v11 - *a2) * 0.25;
    v13 = v12 * 0.4;
    if (v12 < 5.0)
      v13 = (float)(v12 * 0.4) + 0.5;
    if (vabds_f32(*a4 - *a2, v12) <= v13)
    {
      v14 = a2[1];
      if (vabds_f32(v14 - *a4, v12) <= v13)
      {
        v15 = a4[1];
        if (vabds_f32(v15 - v14, v12) <= v13 && vabds_f32(v11 - v15, v12) <= v13)
        {
          v16 = a3 - (unint64_t)(v8 == 1);
          v17 = ((int)v16 - 4) / 5;
          v18 = 5 * v17 + 2;
          v19 = a4[v18];
          v20 = 20 * v17 + 12;
          v21 = *(float *)((char *)a2 + v20);
          v22 = v21 - v19;
          v23 = *(float *)((char *)a4 + v20) - v21;
          v24 = (float)(v22 + v23) * 0.5;
          v25 = (float)(v23 - v22) * 0.5;
          if (v25 <= (float)(v24 * 0.4))
          {
            v27 = (float)(v19 - a2[v18]) - v25;
            v28 = v27 / v24;
            if ((float)(v27 / v24) >= 1.6 && v28 <= 3.4)
            {
              v29 = 0.0;
              if (v24 < 5.0)
                v29 = 0.5;
              v30 = v29 + (float)(v24 * 0.4);
              if (fabsf(v27 - (float)(v24 * v28)) <= v30
                && vabds_f32(v22 + v25, v24) <= v30
                && vabds_f32(v23 - v25, v24) <= v30)
              {
                v157 = (float)(v22 + v23) * 0.5;
                v156 = v8 == 1;
                v161 = ((int)v16 - 4) / 5;
                v33 = 2 * v17;
                v176 = (char *)malloc_type_calloc(v33, 1uLL, 0x100004077774924uLL);
                v167 = (float *)malloc_type_calloc(v33, 4uLL, 0x100004052888210uLL);
                v166 = (float *)malloc_type_calloc(v33, 4uLL, 0x100004052888210uLL);
                v186 = 0;
                v184 = 0u;
                v185 = 0u;
                v182 = 0u;
                v183 = 0u;
                v34 = 1.0;
                v35 = 1.0;
                v36 = 0.0;
                v37 = 0.0;
                v38 = 0.0;
                if ((int)v16 >= 9)
                {
                  v39 = 0;
                  if (v8 == 1)
                    v40 = 3;
                  else
                    v40 = 2;
                  v164 = (v161 - 1);
                  if (v161 <= 1)
                    v41 = 1;
                  else
                    v41 = v161;
                  v163 = v41;
                  __asm { FMOV            V20.2D, #0.5 }
                  v46 = &a2[v40];
                  v165 = v40;
                  v47 = &a4[v40];
                  v162 = _Q20;
                  do
                  {
                    v172 = v36;
                    v173 = v37;
                    v174 = v38;
                    v48 = 0;
                    v49 = v165 + 5 * v39;
                    do
                    {
                      *(float *)&v192[v48 * 4] = v47[v48] - v46[v48];
                      ++v48;
                    }
                    while (v48 != 5);
                    v177 = v46;
                    v178 = v47;
                    v175 = 2 * v39;
                    v176[2 * v39] = sub_1D3E4D334((uint64_t)v192, (uint64_t)&v184);
                    v50 = *((float *)&v185 + 2);
                    v51 = sub_1D3E4D518((uint64_t)&v184);
                    v52 = 0;
                    v167[v39] = *((float *)&v184 + 2);
                    v179 = v39;
                    v53 = v39 + v161;
                    v167[v53] = v50;
                    do
                    {
                      *(float *)&v191[v52 * 4] = v177[v52 + 1] - v178[v52];
                      ++v52;
                    }
                    while (v52 != 5);
                    v54 = sub_1D3E4D334((uint64_t)v191, (uint64_t)&v182);
                    if (v179)
                      v55 = -0.0;
                    else
                      v55 = v50;
                    v56 = *((float *)&v183 + 2);
                    v57 = *((float *)&v182 + 2);
                    if (v179)
                      v58 = -0.0;
                    else
                      v58 = *((float *)&v183 + 2);
                    v170 = v58;
                    v171 = v55;
                    v168 = v175 | 1;
                    v176[v175 | 1] = v54;
                    if (v179 == v164)
                      v59 = v50;
                    else
                      v59 = -0.0;
                    v169 = v59;
                    v166[v179] = v57;
                    v166[v53] = v56;
                    if (v179 == v164)
                      v60 = v56;
                    else
                      v60 = -0.0;
                    v61 = sub_1D3E4D518((uint64_t)&v182);
                    v62 = v61;
                    if (v51 < v61)
                      v61 = v51;
                    if (v61 < 0.1)
                    {
                      if (v62 <= 0.3)
                      {
                        if (v51 <= 0.3)
                        {
                          sub_1D3E4E290((uint64_t)v192, (uint64_t)v190, (_BYTE *)&v186 + 1);
                          sub_1D3E4E290((uint64_t)v191, (uint64_t)v189, &v186);
                        }
                        else
                        {
                          sub_1D3E4E290((uint64_t)v191, (uint64_t)v189, &v186);
                          v190[0] = v176[v175];
                          HIBYTE(v186) = 1;
                        }
                      }
                      else
                      {
                        sub_1D3E4E290((uint64_t)v192, (uint64_t)v190, (_BYTE *)&v186 + 1);
                        v189[0] = v176[v168];
                        LOBYTE(v186) = 1;
                      }
                      v63 = &a2[v49];
                      v64 = (int)(*v63 + 0.5);
                      v65 = (int)(v63[5] + 0.5);
                      v180 = SHIBYTE(v186);
                      v181 = (char)v186;
                      v188 = 0.0;
                      v187 = 0;
                      if (sub_1D3E17528(a7, v64, v65, &v188, (float *)&v187 + 1, (float *)&v187))
                      {
                        if (v180 >= 1)
                        {
                          v66 = 0;
                          v67 = (double)(v65 - v64) * 0.0625;
                          v68 = *((float *)&v187 + 1);
                          v69 = *(float *)&v187;
                          v70 = 1.0 / (float)(v188 + v188);
                          v71 = (float)(v65 - v64);
                          v72 = 127;
                          v73 = -100.0;
                          v74 = 127;
                          while (1)
                          {
                            if (v181 < 1)
                              goto LABEL_134;
                            v75 = 0;
                            v76 = v190[v66];
                            v77 = &flt_1D3E81220[5 * v76];
                            do
                            {
                              v78 = 0;
                              v79 = (char)v189[v75];
                              v80 = v189[v75];
                              v194[0] = 0;
                              v81 = 0.0;
                              do
                              {
                                v82 = v77[v78];
                                v83 = &v194[2 * v78];
                                v84 = flt_1D3E81220[5 * v79 + v78++];
                                v85.f32[0] = v81 + v82;
                                v81 = v85.f32[0] + v84;
                                v85.f32[1] = v85.f32[0] + v84;
                                *(int32x2_t *)(v83 + 1) = vmovn_s64(vcvtq_s64_f64(vaddq_f64(vcvtq_f64_f32(vmul_n_f32(v85, v67)), v162)));
                              }
                              while (v78 != 5);
                              if (a7)
                              {
                                v86 = 0;
                                v87 = 0.0;
                                v88 = v194[0];
                                do
                                {
                                  v89 = v86 + 1;
                                  v90 = v194[v86 + 1];
                                  if (v88 < v90)
                                  {
                                    v91 = v88 + v64;
                                    do
                                    {
                                      v92 = *(float *)(a7 + 4 * v91);
                                      if ((v86 & 1) != 0)
                                      {
                                        v93 = v92 - v68;
                                        if (v93 > 0.0)
                                          v93 = 0.0;
                                      }
                                      else
                                      {
                                        v93 = fmaxf(v92 - v69, 0.0);
                                      }
                                      v87 = v87 + (float)(v70 * (float)(v93 * v93));
                                      ++v91;
                                    }
                                    while (v91 < v90 + v64);
                                  }
                                  v88 = v194[++v86];
                                }
                                while (v89 != 10);
                                v94 = (float)-v87 / v71;
                              }
                              else
                              {
                                v94 = -100.0;
                              }
                              if (v94 > -0.12 && v94 > v73)
                              {
                                v73 = v94;
                                v74 = v80;
                                v72 = v76;
                              }
                              if (v67 <= 1.5)
                                goto LABEL_133;
                              v95 = 0;
                              v96 = v94 * v71;
                              v97 = v194[10];
                              v98 = &flt_1D3E81220[5 * v79];
                              do
                              {
                                v99 = (int *)((char *)&unk_1D3E812E8 + 8 * v95);
                                v100 = *v99;
                                v101 = (*v99 + v64);
                                if (*v99 + v64 < 0)
                                  goto LABEL_132;
                                v102 = v99[1] + v65;
                                if (v102 >= a8)
                                  goto LABEL_132;
                                v103 = 0;
                                v104 = v102 - v101;
                                v106 = 0.0;
                                do
                                {
                                  v107.f32[0] = v106 + v77[v103];
                                  v106 = v107.f32[0] + v98[v103];
                                  v107.f32[1] = v106;
                                  v105 = (double)v104 * 0.0625;
                                  *(int32x2_t *)&v192[8 * v103++ + 24] = vmovn_s64(vcvtq_s64_f64(vaddq_f64(vcvtq_f64_f32(vmul_n_f32(v107, v105)), v162)));
                                }
                                while (v103 != 5);
                                if (!a7)
                                {
                                  v138 = -100.0;
                                  goto LABEL_127;
                                }
                                v108 = v96;
                                if (v100)
                                {
                                  v109 = v100 <= 0 ? v101 : v64;
                                  v110 = v100 <= 0 ? v64 : v101;
                                  v108 = v96;
                                  if (v109 < v110)
                                  {
                                    v111 = v110 - (uint64_t)v109;
                                    v108 = v96;
                                    v112 = (float *)(a7 + 4 * v109);
                                    do
                                    {
                                      v113 = *v112++;
                                      v114 = fmaxf(v113 - v69, 0.0);
                                      v115 = v70 * (float)(v114 * v114);
                                      v116 = -v115;
                                      if (v100 <= 0)
                                        v116 = v115;
                                      v108 = v108 + v116;
                                      --v111;
                                    }
                                    while (v111);
                                  }
                                }
                                v117 = v97 - v100;
                                if (v117 != v193)
                                {
                                  v118 = v117 >= v193 ? v193 : v117;
                                  v119 = v117 < v193 ? v193 : v117;
                                  if (v118 < v119)
                                  {
                                    v120 = v118 + (int)v101;
                                    v121 = v119 + (int)v101;
                                    do
                                    {
                                      v122 = *(float *)(a7 + 4 * v120) - v68;
                                      if (v122 > 0.0)
                                        v122 = 0.0;
                                      v123 = v70 * (float)(v122 * v122);
                                      v124 = -v123;
                                      if (v117 < v193)
                                        v124 = v123;
                                      v108 = v108 + v124;
                                      ++v120;
                                    }
                                    while (v120 < v121);
                                  }
                                }
                                for (i = 1; i != 10; ++i)
                                {
                                  v126 = *(int *)&v192[4 * i + 20];
                                  v127 = v126 + v101;
                                  v128 = v194[i] + v64;
                                  if ((_DWORD)v126 + (_DWORD)v101 != v128)
                                  {
                                    v129 = v128 >= v127 ? v126 + v101 : v194[i] + v64;
                                    v130 = v127 <= v128 ? v194[i] + v64 : v126 + v101;
                                    _VF = __OFSUB__(v130, v129);
                                    v131 = v130 - v129;
                                    if (!((v131 < 0) ^ _VF | (v131 == 0)))
                                    {
                                      v132 = v101 + v126;
                                      if (v101 + v126 >= v128)
                                        v132 = v128;
                                      v133 = (float *)(a7 + 4 * v132);
                                      do
                                      {
                                        v134 = *v133 - v68;
                                        if (v134 > 0.0)
                                          v134 = 0.0;
                                        v135 = fmaxf(*v133 - v69, 0.0);
                                        v136 = v70 * (float)(v134 * v134);
                                        v137 = v70 * (float)(v135 * v135);
                                        if ((i & 1) != 0)
                                        {
                                          if (v128 < v127)
                                          {
LABEL_122:
                                            v108 = (float)(v108 + v136) - v137;
                                            goto LABEL_123;
                                          }
                                        }
                                        else if (v127 < v128)
                                        {
                                          goto LABEL_122;
                                        }
                                        v108 = v137 + (float)(v108 - v136);
LABEL_123:
                                        ++v133;
                                        --v131;
                                      }
                                      while (v131);
                                    }
                                  }
                                }
                                v138 = v108 / (float)v104;
LABEL_127:
                                if (v138 > -0.12 && v138 > v73)
                                {
                                  v73 = v138;
                                  v74 = v80;
                                  v72 = v76;
                                }
LABEL_132:
                                ++v95;
                              }
                              while (v95 != 8);
LABEL_133:
                              ++v75;
                            }
                            while (v75 != v181);
LABEL_134:
                            if (++v66 == v180)
                              goto LABEL_137;
                          }
                        }
                        v74 = 127;
                        v73 = -100.0;
                        v72 = 127;
LABEL_137:
                        if (v73 > -0.12)
                        {
                          v190[0] = v72;
                          v189[0] = v74;
                          v176[v175] = v72;
                          v176[v168] = v74;
                          v51 = 0.3;
                          v62 = 0.3;
                        }
                      }
                    }
                    v37 = (float)(v173 + v171) + v170;
                    v38 = (float)(v174 + v169) + v60;
                    if (v51 < v35)
                      v140 = v51;
                    else
                      v140 = v35;
                    if (v51 >= v34)
                      v141 = v34;
                    else
                      v141 = v51;
                    if (v51 < v34)
                      v140 = v34;
                    v36 = (float)(v172 + v51) + v62;
                    if (v62 < v140)
                      v142 = v62;
                    else
                      v142 = v140;
                    if (v62 >= v141)
                      v34 = v141;
                    else
                      v34 = v62;
                    if (v62 >= v141)
                      v35 = v142;
                    else
                      v35 = v141;
                    v39 = v179 + 1;
                    v46 = v177 + 5;
                    v47 = v178 + 5;
                  }
                  while (v179 + 1 != v163);
                }
                v143 = (float)((float)(v35 * 0.3) + (float)(v34 * 0.2)) + (float)((float)(v36 / (float)(int)v33) * 0.5);
                if (v34 < 0.1)
                  v143 = 0.0;
                *(float *)(a5 + 24) = v143;
                *(_QWORD *)(a5 + 8) = v33;
                *(_DWORD *)(a5 + 80) = 1;
                *(_DWORD *)(a5 + 84) = v161;
                v144 = *(void **)(a5 + 16);
                if (v144)
                {
                  v145 = v38;
                  v146 = v37;
                  free(v144);
                  v37 = v146;
                  v38 = v145;
                }
                *(_QWORD *)(a5 + 16) = v176;
                v147 = a6;
                if (a6)
                {
                  if ((int)v16 < 9)
                  {
                    v147 = 0;
LABEL_178:
                    if (*(float *)(a5 + 24) < 0.1 && v147 == 0)
                      v9 = 7;
                    else
                      v9 = v147;
                    if (!(_DWORD)v9)
                    {
                      if (vabds_f32(v12, v37 / 6.0) <= (float)((float)(v37 / 6.0) * 0.3)
                        && vabds_f32(v157, v38 / 6.0) <= (float)((float)(v38 / 6.0) * 0.3))
                      {
                        v9 = 0;
                        *(float *)(a5 + 72) = (float)((float)(v37 + a2[v156 + 2]) - a2[v156]) * 0.1;
                        *(float *)(a5 + 76) = (float)((float)(v38 + a4[v16 - 1]) - a4[(int)v16 - 2]) * 0.125;
                        v155 = *(_DWORD **)(a5 + 64);
                        v155[10] = 0;
                        v155[11] = v156;
                        v155[12] = *(_DWORD *)a2;
                        v155[13] = LODWORD(a4[v16 - 1]);
                        v155[5] = v16;
                      }
                      else
                      {
                        v9 = 6;
                      }
                    }
                    free(v167);
                    free(v166);
                    return v9;
                  }
                  v148 = 0;
                  if (v161 <= 1)
                    v149 = 1;
                  else
                    v149 = v161;
                  v150 = v176 + 1;
                  do
                  {
                    v148 += *v150 + 3 * *(v150 - 1);
                    v150 += 2;
                    --v149;
                  }
                  while (v149);
                  HIDWORD(v151) = -858993459 * v148 + 429496728;
                  LODWORD(v151) = HIDWORD(v151);
                  if ((v151 >> 1) < 0x19999999)
                  {
                    v147 = 0;
                  }
                  else
                  {
                    *(_DWORD *)(a5 + 24) = 0;
                    v147 = 5;
                  }
                }
                if ((v16 - 14) <= 4)
                {
                  v152 = fmaxf(v167[2], v167[3]) * 1.2;
                  if (v152 >= *v167
                    || v152 >= v167[1]
                    || (v153 = fmaxf(v166[2], v166[3]) * 1.2, v153 >= *v166)
                    || v153 >= v166[1])
                  {
                    v147 = 2;
                  }
                }
                goto LABEL_178;
              }
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t sub_1D3E4E290(uint64_t result, uint64_t a2, _BYTE *a3)
{
  int v3;
  int v4;
  uint64_t i;
  float v6;
  uint64_t v7;
  int v8;
  float *v9;
  float *v10;

  v3 = 0;
  v4 = 0;
  for (i = 1; i != 5; ++i)
  {
    v6 = *(float *)(result + 4 * i);
    if (v6 > *(float *)(result + 4 * v4))
      v4 = i;
    if (v6 < *(float *)(result + 4 * v3))
      v3 = i;
  }
  v7 = 0;
  v8 = 0;
  v9 = (float *)((char *)&unk_1D3E81220 + 4 * v4);
  v10 = (float *)((char *)&unk_1D3E81220 + 4 * v3);
  do
  {
    if (*v10 < 1.1 && *v9 > 2.0)
      *(_BYTE *)(a2 + v8++) = v7;
    ++v7;
    v9 += 5;
    v10 += 5;
  }
  while (v7 != 10);
  *a3 = v8;
  return result;
}

uint64_t sub_1D3E4E328(int a1, float *a2, int a3, float *a4, uint64_t a5, uint64_t a6, int a7)
{
  if (a3 < 9)
    return 16;
  if ((-858993459 * a3 - 858993460) > 0x33333332)
    return 2;
  return sub_1D3E4D5E4(a1, a2, a3, a4, a5, 0, a6, a7);
}

uint64_t sub_1D3E4E370(int a1, float *a2, int a3, float *a4, uint64_t a5, uint64_t a6, int a7)
{
  if (a3 < 9)
    return 16;
  if ((-858993459 * a3 - 858993460) > 0x33333332)
    return 2;
  return sub_1D3E4D5E4(a1, a2, a3, a4, a5, 1u, a6, a7);
}

uint64_t sub_1D3E4E3B8(int a1, float *a2, int a3, float *a4, uint64_t a5, uint64_t a6, int a7)
{
  if (a3 >= 39)
    return sub_1D3E4D5E4(a1, a2, a3, a4, a5, 0, a6, a7);
  else
    return 16;
}

uint64_t sub_1D3E4E3D8(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 8);
  if (v3 >= a3 - 1)
    LODWORD(v3) = a3 - 1;
  if ((int)v3 >= 1)
  {
    v4 = 0;
    do
    {
      *(_BYTE *)(a2 + v4) = *(_BYTE *)(*(_QWORD *)(result + 16) + v4) + 48;
      ++v4;
    }
    while (v3 != v4);
  }
  *(_BYTE *)(a2 + (int)v3) = 0;
  return result;
}

BOOL sub_1D3E4E41C(int a1)
{
  return a1 > 8 && a1 % 5 == 4;
}

BOOL sub_1D3E4E44C(int a1)
{
  return a1 == 39 || a1 == 41;
}

uint64_t sub_1D3E4E460(uint64_t a1, int a2, uint64_t a3, float a4, float a5, float a6, float a7)
{
  char *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  uint64_t v20;
  int v21;
  _OWORD v23[5];
  char *v24;

  memset(v23, 0, sizeof(v23));
  v14 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
  v24 = v14;
  *((_QWORD *)v14 + 8) = 0;
  *((_DWORD *)v14 + 18) = 0;
  *((_QWORD *)v14 + 10) = 0;
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *(_OWORD *)(v14 + 44) = 0u;
  if (a2)
    v15 = a7;
  else
    v15 = a5;
  if (a2)
    v16 = a4;
  else
    v16 = a6;
  if (a2)
    v17 = a5;
  else
    v17 = a7;
  if (a2)
    v18 = a6;
  else
    v18 = a4;
  v19 = sub_1D3E5178C(*(_QWORD *)(a1 + 32), *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), (float **)v23, (float *)&v23[1] + 3, v18, v15, v16, v17, 3.0);
  if (v19 >= 22)
  {
    *((_QWORD *)&v23[0] + 1) = v19;
    LODWORD(v23[1]) = v19 - 1;
    v21 = 1 << *(_DWORD *)a3;
    **(_DWORD **)(a3 + 64) = v21;
    v20 = sub_1D3E3BE98((uint64_t)v23, a3, v21);
  }
  else
  {
    v20 = 16;
  }
  sub_1D3E36F54((uint64_t)v23);
  return v20;
}

uint64_t sub_1D3E4E580(uint64_t a1, float *a2, _QWORD *a3, float a4, float a5, float a6, float a7)
{
  int v8;
  uint64_t v9;

  if (a2)
    v8 = sub_1D3E4F3F0((uint64_t *)a1, a2, a3, a4, a5, a6, a7, 1.0);
  else
    v8 = sub_1D3E5178C(*(_QWORD *)(a1 + 32), *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), (float **)a3, (float *)a3 + 7, a4, a5, a6, a7, 1.0);
  if (v8 < 41)
    return 16;
  v9 = 0;
  *((_DWORD *)a3 + 2) = v8;
  *((_DWORD *)a3 + 3) = 0;
  *((_DWORD *)a3 + 4) = v8 - 1;
  return v9;
}

float **sub_1D3E4E5F4(float **result, __int128 *a2, uint64_t a3, int a4)
{
  int v4;
  float v5;
  int v6;
  int v7;
  __int128 v8;
  float *v9;
  float **v10;

  if (a3)
  {
    if (*(int *)result >= 1)
    {
      v4 = *(_DWORD *)a2;
      if (*(int *)a2 >= 1)
      {
        v5 = *result[1];
        v6 = (int)(float)(fabsf(v5) + -0.5);
        if (v6 + 1 >= a4)
          v7 = v6;
        else
          v7 = v6 + 1;
        if (v5 > 0.0 == *(float *)(a3 + 4 * (v6 - (v6 + 1 >= a4))) <= *(float *)(a3 + 4 * v7))
        {
          v8 = *(_OWORD *)result;
          *(_OWORD *)result = *a2;
          *a2 = v8;
          v5 = *result[1];
          v4 = *(_DWORD *)a2;
        }
        v9 = (float *)*((_QWORD *)a2 + 1);
        if (v5 > *v9)
        {
          *((_QWORD *)a2 + 1) = v9 + 1;
          *(_DWORD *)a2 = --v4;
        }
        if (*(_DWORD *)result != v4)
        {
          if (*(_DWORD *)result <= v4)
            v10 = (float **)a2;
          else
            v10 = result;
          --*(_DWORD *)v10;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D3E4E6C0(double *a1, double a2, double a3, double a4, double a5, float a6, double a7, double a8, double a9, double a10, double a11)
{
  float v21;
  float v22;
  __float2 v23;
  float v24;
  float v25;
  float v26;
  double v27;
  float v28;
  __float2 v29;
  double v30;
  float v31;
  float v32;
  double v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  uint64_t result;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  float v50;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;

  v21 = a6 * 3.14159265 / 180.0;
  v22 = a10 - a7;
  v23 = __sincosf_stret(v21);
  v24 = a11 - a8;
  if ((float)((float)(v23.__sinval * v24) + (float)(v22 * v23.__cosval)) >= 0.0)
  {
    v26 = v21;
  }
  else
  {
    v25 = v21 + 3.14159265;
    v26 = v25;
  }
  if (a4 <= a5)
    v27 = a5;
  else
    v27 = a4;
  v28 = v27 + v27;
  v29 = __sincosf_stret(v26);
  v30 = (float)(v29.__sinval * v28);
  v31 = a7 + v30;
  v32 = a7 - v30;
  v60 = v32;
  v61 = v31;
  v33 = (float)(v29.__cosval * v28);
  v34 = a8 - v33;
  v35 = a8 + v33;
  v58 = v35;
  v59 = v34;
  v36 = a10 - v30;
  v50 = v36;
  v37 = a10 + v30;
  v56 = v37;
  v57 = v36;
  v38 = a11 + v33;
  v39 = a11 - v33;
  v54 = v39;
  v55 = v38;
  v40 = a2;
  v41 = a3;
  v42 = a2 + a4;
  v43 = a3 + a5;
  result = sub_1D3E50CA8(&v61, &v59, &v60, &v58, v31, v34, v32, v35, v40, v42, v41, v43);
  if ((_DWORD)result
    && (result = sub_1D3E50CA8(&v57, &v55, &v56, &v54, v50, v38, v37, v39, v40, v42, v41, v43), (_DWORD)result))
  {
    v45 = v59;
    *a1 = v61;
    a1[1] = v45;
    v46 = v58;
    a1[2] = v60;
    a1[3] = v46;
    v47 = v55;
    a1[4] = v57;
    a1[5] = v47;
    a1[6] = v56;
    v48 = v54;
    v49 = 3;
  }
  else
  {
    a1[6] = v42;
    a1[7] = v41;
    *a1 = v40;
    a1[1] = v41;
    a1[2] = v40;
    v48 = v43;
    v49 = 1;
    a1[4] = v42;
    a1[5] = v43;
  }
  a1[2 * v49 + 1] = v48;
  return result;
}

uint64_t sub_1D3E4E8F0(uint64_t a1, int a2, int a3, int a4, unsigned int *a5, float a6, float a7, float a8, float a9, float a10)
{
  char *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v28[5];
  int *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;

  v32 = 0;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  memset(v28, 0, sizeof(v28));
  v20 = (char *)malloc_type_malloc(0x58uLL, 0x1080040FF0494E1uLL);
  v29 = (int *)v20;
  *((_QWORD *)v20 + 8) = 0;
  *((_DWORD *)v20 + 18) = 0;
  *((_QWORD *)v20 + 10) = 0;
  *(_OWORD *)v20 = 0u;
  *((_OWORD *)v20 + 1) = 0u;
  *((_OWORD *)v20 + 2) = 0u;
  *(_OWORD *)(v20 + 44) = 0u;
  if (a2)
    v21 = a8;
  else
    v21 = a6;
  if (a2)
    v22 = a9;
  else
    v22 = a7;
  if (a2)
    v23 = a6;
  else
    v23 = a8;
  if (a2)
    v24 = a7;
  else
    v24 = a9;
  v25 = sub_1D3E4EA7C(a1, 1, 1 << *a5, a3, a4, v28, (uint64_t)&v32, (uint64_t)&v30, v21, v22, v23, v24, 3.0, a10, 0);
  if (!(_DWORD)v25)
  {
    sub_1D3E36D94(v29, *((_QWORD *)a5 + 8));
    v26 = *a5;
    if (((**((_DWORD **)a5 + 8) >> v26) & 1) != 0)
      v25 = (*(uint64_t (**)(uint64_t, void *, uint64_t, void *, unsigned int *, _QWORD, _QWORD))&dword_1EDB895D0[16 * v26 + 10])(v32, v33, v30, v31, a5, *(_QWORD *)&v28[0], DWORD2(v28[0]));
    else
      v25 = 2;
  }
  if (v33)
    free(v33);
  if (v31)
    free(v31);
  sub_1D3E36F54((uint64_t)v28);
  return v25;
}

uint64_t sub_1D3E4EA7C(uint64_t a1, int a2, int a3, int a4, int a5, _QWORD *a6, uint64_t a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, float *a15)
{
  int v23;
  float v24;
  float *v25;
  signed int v26;
  void *v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  BOOL v37;
  int v38;
  int v39;
  size_t v40;
  _DWORD *v41;
  _DWORD *v42;
  uint64_t v43;
  uint64_t v45;
  int *v46;
  int v47;
  uint64_t v48;
  int *v49;
  int v50;
  uint64_t v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  unsigned int v57;
  float *v58;
  float v59;
  float *v60;
  float v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _DWORD *v69;
  float v70;
  float v71;

  if (a15)
    v23 = sub_1D3E4F3F0((uint64_t *)a1, a15, a6, a9, a10, a11, a12, a13);
  else
    v23 = sub_1D3E5178C(*(_QWORD *)(a1 + 32), *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), (float **)a6, (float *)a6 + 7, a9, a10, a11, a12, a13);
  *((_DWORD *)a6 + 2) = v23;
  if (v23 <= 21)
  {
    if (*a6)
      free((void *)*a6);
    *a6 = 0;
    *((_DWORD *)a6 + 2) = 0;
    return 16;
  }
  sub_1D3E51ED4((float *)*a6, v23, &v71, &v70);
  if (v24 == 0.0)
    return 18;
  *(_DWORD *)(a6[10] + 4) = a4;
  v25 = (float *)*a6;
  v26 = *((_DWORD *)a6 + 2);
  if (a2)
  {
    LODWORD(v64) = 0;
    v68 = 0;
    v66 = 0;
    sub_1D3E51ADC(v25, v26, a4, (int *)&v64, &v68, &v66);
    v27 = v66;
    if ((int)v64 < 1)
    {
      v33 = 0;
    }
    else
    {
      v28 = 0;
      v29 = 0;
      v30 = -v26;
      do
      {
        v31 = *((_DWORD *)v66 + v28) - *((_DWORD *)v68 + v28);
        v32 = v30 < v31;
        if (v30 <= v31)
          v30 = *((_DWORD *)v66 + v28) - *((_DWORD *)v68 + v28);
        if (v32)
          v29 = v28;
        ++v28;
      }
      while (v64 != v28);
      v33 = v29;
    }
    v35 = *((_DWORD *)v68 + v33);
    v36 = *((_DWORD *)v66 + v33);
    free(v68);
    free(v27);
    if (v35 < 0 || v35 >= v26 || v36 < 0 || (v36 < v26 ? (v37 = v35 < v36) : (v37 = 0), !v37))
    {
      v35 = 0;
      *((_DWORD *)a6 + 3) = 0;
      v36 = v26 - 1;
    }
    else
    {
      *((_DWORD *)a6 + 3) = v35;
    }
  }
  else
  {
    v35 = 0;
    v36 = v26 - 1;
    *((_DWORD *)a6 + 3) = 0;
  }
  *((_DWORD *)a6 + 4) = v36;
  sub_1D3E51F70(v25, v26, v35, v36);
  v39 = *((_DWORD *)a6 + 3);
  v38 = *((_DWORD *)a6 + 4);
  v40 = (v38 - v39 + 1);
  *(_DWORD *)(a6[10] + 8) = v40;
  if (v39 >= v38)
    return 15;
  if ((int)v40 < 41)
    return 16;
  v68 = 0;
  v66 = 0;
  v64 = 0;
  v62 = 0;
  v41 = malloc_type_calloc(4uLL, (v38 - v39 + 1), 0x9ACECC79uLL);
  v69 = v41;
  v42 = malloc_type_calloc(4uLL, v40, 0x1BE3430AuLL);
  v67 = v42;
  v65 = malloc_type_calloc(4uLL, v40, 0x9737F225uLL);
  v63 = malloc_type_calloc(4uLL, v40, 0x90D5D658uLL);
  v43 = sub_1D3DE3318((uint64_t)a6, (uint64_t)&v64, (uint64_t)&v62);
  if (!(_DWORD)v43)
  {
    v43 = sub_1D3DE33E4(a6, (unsigned int *)&v64, (int *)&v62, v40, 0.8, 0.0);
    if (!(_DWORD)v43)
    {
      v45 = (int)v62;
      LODWORD(v66) = v62;
      if ((int)v62 >= 1)
      {
        v46 = (int *)v63;
        do
        {
          v47 = *v46++;
          *v42++ = v47;
          --v45;
        }
        while (v45);
      }
      v48 = (int)v64;
      LODWORD(v68) = v64;
      if ((int)v64 >= 1)
      {
        v49 = (int *)v65;
        do
        {
          v50 = *v49++;
          *v41++ = v50;
          --v48;
        }
        while (v48);
      }
      v51 = sub_1D3DE33E4(a6, (unsigned int *)&v68, (int *)&v66, a5, a14, 0.02);
      if ((_DWORD)v51)
      {
        v34 = v51;
        v41 = v69;
        goto LABEL_37;
      }
      v52 = (int)v68;
      v41 = v69;
      v53 = v67;
      sub_1D3E377AC((uint64_t)v68, (uint64_t)v69, (uint64_t)v66, (uint64_t)v67, (_DWORD *)a6[10], a3);
      if (!*(_DWORD *)a6[10])
      {
        v34 = 2;
        goto LABEL_37;
      }
      if (a7)
      {
        v54 = *(void **)(a7 + 8);
        if (v54)
          free(v54);
        *(_QWORD *)(a7 + 8) = 0;
        *(_DWORD *)a7 = 0;
      }
      if (a8)
      {
        v55 = *(void **)(a8 + 8);
        if (v55)
          free(v55);
        *(_QWORD *)(a8 + 8) = 0;
        *(_DWORD *)a8 = 0;
      }
      *(_QWORD *)(a7 + 8) = malloc_type_calloc(4uLL, *((int *)a6 + 2), 0x1A493BD8uLL);
      *(_QWORD *)(a8 + 8) = malloc_type_calloc(4uLL, *((int *)a6 + 2), 0xAFDFE941uLL);
      v43 = sub_1D3DE3B58(*a6, v52, (uint64_t)v41, (uint64_t)v53, a7, a8);
      if (!(_DWORD)v43)
      {
        v56 = *(_DWORD *)a8 - 1;
        if (*(int *)a8 < 1 || (v57 = *(_DWORD *)a7 - 1, *(int *)a7 < 1))
        {
          v34 = 10;
        }
        else
        {
          v34 = 0;
          v58 = *(float **)(a7 + 8);
          v59 = *v58;
          v60 = *(float **)(a8 + 8);
          if (*v58 >= *v60)
            v59 = *v60;
          *((float *)a6 + 5) = v59;
          v61 = v58[v57];
          if (v61 <= v60[v56])
            v61 = v60[v56];
          *((float *)a6 + 6) = v61;
        }
        goto LABEL_37;
      }
    }
  }
  v34 = v43;
LABEL_37:
  if (v41)
    free(v41);
  if (v67)
    free(v67);
  if (v65)
    free(v65);
  if (v63)
    free(v63);
  return v34;
}

uint64_t sub_1D3E4EEF0(unint64_t *a1, uint64_t a2)
{
  unint64_t *v4;
  uint64_t result;
  int v6;
  char v7;
  int v8;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;

  v12 = 1;
  v13 = 1;
  v4 = (unint64_t *)a1[1];
  if ((sub_1D3DDC428(v4, CFSTR("QR"), (uint64_t)&v12) & 1) != 0
    || (v10 = 1, v11 = 1, (sub_1D3DDC428(v4, CFSTR("MicroQR"), (uint64_t)&v10) & 1) != 0)
    || (v8 = 1, v9 = 1, (sub_1D3DDC428(v4, CFSTR("Aztec"), (uint64_t)&v8) & 1) != 0)
    || (v6 = 1, v7 = 1, result = sub_1D3DDC428(v4, CFSTR("DataMatrix"), (uint64_t)&v6), (result & 1) != 0))
  {
    result = sub_1D3E335B4(a1, *(_QWORD *)(a2 + 8), *(uint64_t **)(a2 + 16), a2 + 24, *(_QWORD **)a2);
    **(_WORD **)(a2 + 64) = ((_DWORD)result == 0) | 0x100;
  }
  else
  {
    **(_WORD **)(a2 + 64) = 256;
  }
  return result;
}

uint64_t sub_1D3E4EFE8(unsigned int a1, unsigned int a2, uint64_t a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10, float a11)
{
  int32x2_t v11;
  int32x2_t v12;
  int32x2_t v13;
  float32x2_t v25;
  float32x2_t v26;
  unsigned int v27;
  int32x4_t v28;
  int32x4_t v29;
  float32x2_t v30;
  float32x4_t v31;
  float v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x2_t v35;
  unsigned int v36;
  unsigned int v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float *v42;
  float *v43;
  float *v44;
  float *v45;
  float *v46;
  float *v47;
  uint64_t result;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float32x2_t v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  char v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  _OWORD v88[4];
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[5];
  float32x4x2_t v92;
  float32x4x2_t v93;
  float32x4x2_t v94;
  float32x4x2_t v95;

  v91[4] = *MEMORY[0x1E0C80C00];
  *(float *)v12.i32 = (float)((float)((float)(a4 + a6) + a8) + a10) * 0.25;
  *(float *)v11.i32 = (float)((float)((float)(a5 + a7) + a9) + a11) * 0.25;
  v25 = vcvt_f32_s32(vadd_s32((int32x2_t)__PAIR64__(a2, a1), (int32x2_t)-1));
  v26 = vmul_f32(v25, (float32x2_t)0x3F0000003F000000);
  *(float *)&v27 = 0.0 - v26.f32[1];
  v74 = v26;
  *(float32x2_t *)v28.i8 = vsub_f32(v25, v26);
  v25.i32[0] = 0;
  *(float32x2_t *)v29.i8 = vsub_f32(v25, v74);
  v30 = vmul_f32(*(float32x2_t *)v29.i8, *(float32x2_t *)v29.i8);
  v31.i64[0] = __PAIR64__(v29.u32[1], v27);
  v31.i64[1] = __PAIR64__(v27, v29.u32[1]);
  v29.i64[1] = v29.i64[0];
  v28.i64[1] = v28.i64[0];
  v68 = *(float *)v12.i32;
  v69 = *(float *)v11.i32;
  v32 = vmlas_n_f32(*(float *)&v27 * *(float *)&v27, *(float *)v28.i32, *(float *)v28.i32)
      + (float)(vmlas_n_f32(v30.f32[1], *(float *)v28.i32, *(float *)v28.i32)
              + (float)(vmlas_n_f32(*(float *)&v27 * *(float *)&v27, *(float *)v29.i32, *(float *)v29.i32)
                      + vmlas_n_f32(v30.f32[1], *(float *)v29.i32, *(float *)v29.i32)));
  *(float32x2_t *)v33.f32 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(a6), LODWORD(a4)), (float32x2_t)vdup_lane_s32(v12, 0));
  *(float32x2_t *)v34.f32 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(a7), LODWORD(a5)), (float32x2_t)vdup_lane_s32(v11, 0));
  v35 = vmla_f32(vmul_f32(*(float32x2_t *)v34.f32, *(float32x2_t *)v34.f32), *(float32x2_t *)v33.f32, *(float32x2_t *)v33.f32);
  *(float *)&v36 = a9 - *(float *)v11.i32;
  *(float *)&v37 = a11 - *(float *)v11.i32;
  *(float *)v13.i32 = sqrt(v32 * 0.125);
  v35.f32[0] = sqrt((float)((float)((float)(*(float *)&v37 * *(float *)&v37)+ (float)((float)(a10 - *(float *)v12.i32) * (float)(a10 - *(float *)v12.i32)))+ (float)((float)((float)(*(float *)&v36 * *(float *)&v36)+ (float)((float)(a8 - *(float *)v12.i32) * (float)(a8 - *(float *)v12.i32)))+ vaddv_f32(v35)))* 0.125);
  v66 = *(float *)v13.i32;
  v67 = v35.f32[0];
  v38 = (float32x4_t)vdupq_lane_s32(v13, 0);
  v39 = (float32x4_t)vdupq_lane_s32((int32x2_t)v35, 0);
  v33.f32[2] = a8 - *(float *)v12.i32;
  v33.f32[3] = a10 - *(float *)v12.i32;
  v34.i64[1] = __PAIR64__(v37, v36);
  v92.val[1] = vdivq_f32((float32x4_t)vuzp1q_s32(v29, v28), v38);
  v95.val[1] = vdivq_f32(v31, v38);
  v40 = vdivq_f32(v33, v39);
  v93.val[0] = vdivq_f32(v34, v39);
  v93.val[1] = vnegq_f32(v40);
  v41 = vnegq_f32(v92.val[1]);
  v95.val[0] = 0uLL;
  v94.val[0] = vmulq_f32(v92.val[1], v93.val[0]);
  v92.val[0] = 0u;
  v42 = (float *)&v84;
  vst2q_f32(v42, v92);
  v42 += 8;
  vst2q_f32(v42, v95);
  v43 = (float *)&v87;
  vst2q_f32(v43, v95);
  v44 = (float *)v88;
  v92.val[0] = vnegq_f32(v95.val[1]);
  v92.val[1] = 0u;
  vst2q_f32(v44, v92);
  v45 = (float *)&v89;
  v94.val[1] = vmulq_f32(v40, v41);
  vst2q_f32(v45, v94);
  v46 = (float *)&v90;
  v94.val[0] = vmulq_f32(v95.val[1], v93.val[0]);
  v94.val[1] = vmulq_f32(v40, v92.val[0]);
  vst2q_f32(v46, v94);
  v47 = (float *)v91;
  vst2q_f32(v47, v93);
  v85 = xmmword_1D3E821F0;
  v86 = xmmword_1D3E821F0;
  v88[2] = xmmword_1D3E82200;
  v88[3] = xmmword_1D3E82200;
  result = sgesvd_NEWLAPACK();
  v49 = -(float)(1.0 / v66);
  v50 = v49 * v74.f32[0];
  v51 = vmuls_lane_f32(v49, v74, 1);
  v52 = (float)(v68 * v81) + (float)(v67 * v75);
  v53 = (float)(1.0 / v66) * v52;
  v54 = (float)(v68 * v82) + (float)(v67 * v76);
  v55 = (float)(1.0 / v66) * v54;
  v56 = (float)((float)((float)(v68 * v83) + (float)(v67 * v77)) + (float)(v52 * v50)) + (float)(v54 * v51);
  v57 = (float)(v69 * v81) + (float)(v67 * v78);
  v58 = (float)(1.0 / v66) * v57;
  v59 = (float)(v69 * v82) + (float)(v67 * v79);
  v60 = (float)(1.0 / v66) * v59;
  v61 = (float)((float)((float)(v69 * v83) + (float)(v67 * v80)) + (float)(v57 * v50)) + (float)(v59 * v51);
  v62 = (float)(1.0 / v66) * v81;
  v63 = (float)(1.0 / v66) * v82;
  v64 = (float)(v83 + (float)(v81 * v50)) + (float)(v82 * v51);
  v65 = 1.0
      / sqrtf((float)((float)((float)((float)((float)((float)((float)((float)(v55 * v55) + (float)(v53 * v53))+ (float)(v56 * v56))+ (float)(v58 * v58))+ (float)(v60 * v60))+ (float)(v61 * v61))+ (float)(v62 * v62))+ (float)(v63 * v63))+ (float)(v64 * v64));
  *(float *)(a3 + 40) = v53 * v65;
  *(float *)(a3 + 44) = v55 * v65;
  *(float *)(a3 + 48) = v56 * v65;
  *(float *)(a3 + 52) = v58 * v65;
  *(float *)(a3 + 56) = v60 * v65;
  *(float *)(a3 + 60) = v61 * v65;
  *(float *)(a3 + 64) = v62 * v65;
  *(float *)(a3 + 68) = v63 * v65;
  *(float *)(a3 + 72) = v64 * v65;
  *(float *)(a3 + 8) = a6;
  *(float *)(a3 + 12) = a7;
  *(float *)(a3 + 16) = a8;
  *(float *)(a3 + 20) = a9;
  *(float *)a3 = a4;
  *(float *)(a3 + 4) = a5;
  *(float *)(a3 + 24) = a10;
  *(float *)(a3 + 28) = a11;
  *(_DWORD *)(a3 + 32) = a1;
  *(_DWORD *)(a3 + 36) = a2;
  return result;
}

uint64_t sub_1D3E4F3F0(uint64_t *a1, float *a2, _QWORD *a3, float a4, float a5, float a6, float a7, float a8)
{
  int v13;
  int v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  float v27;
  float v28;
  float v29;
  float v30;
  int v31;
  float v32;
  float v33;
  float v34;
  float v35;
  uint64_t v36;
  unint64_t v37;
  float v38;
  float v39;
  float v40;
  unint64_t v41;
  unint64_t v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  uint64_t v49;

  v13 = vcvtps_s32_f32(fmaxf(a8, 1.0));
  if (v13 >= 0)
    v14 = v13;
  else
    v14 = v13 + 1;
  v15 = a6 - a4;
  v16 = a7 - a5;
  v17 = atan2f(a7 - a5, a6 - a4);
  v18 = cosf(v17 + -1.5708);
  v19 = vcvtps_s32_f32(sqrtf((float)(v16 * v16) + (float)(v15 * v15)));
  v20 = (v19 + 1);
  v21 = malloc_type_malloc(4 * (int)v20, 0x100004052888210uLL);
  if (!v21)
    return 0;
  if ((v19 & 0x80000000) == 0)
  {
    v23 = 0;
    v24 = v14 >> 1;
    if (v14 >> 1 < 0)
      v24 = -v24;
    v25 = v24 + 1;
    do
    {
      v21[v23] = 0;
      if (v13 >= -1)
      {
        v26 = 0;
        v27 = (float)(int)v23 / (float)v19;
        v28 = a4 + (float)(v27 * v15);
        v29 = a5 + (float)(v27 * v16);
        v30 = 0.0;
        v31 = -(v14 >> 1);
        do
        {
          v32 = v28 + (float)((float)v31 * v18);
          v33 = v29 + (float)((float)v31 * v18);
          v34 = a2[18] + (float)((float)(v33 * a2[17]) + (float)(a2[16] * v32));
          v35 = (float)(a2[12] + (float)((float)(v33 * a2[11]) + (float)(a2[10] * v32))) / v34;
          LODWORD(v22) = vcvtmd_s64_f64(v35);
          if ((v22 & 0x80000000) == 0)
          {
            v36 = *a1;
            v37 = *a1 - 1;
            if (v37 >= v22)
            {
              LODWORD(v36) = vcvtpd_s64_f64(v35);
              if ((v36 & 0x80000000) == 0 && v37 >= v36)
              {
                v38 = a2[13];
                v39 = a2[14];
                v40 = (float)(a2[15] + (float)((float)(v33 * v39) + (float)(v38 * v32))) / v34;
                LODWORD(v37) = vcvtmd_s64_f64(v40);
                if ((v37 & 0x80000000) == 0)
                {
                  v41 = a1[1];
                  v42 = v41 - 1;
                  if (v41 - 1 >= v37)
                  {
                    LODWORD(v41) = vcvtpd_s64_f64(v40);
                    if ((v41 & 0x80000000) == 0 && v42 >= v41)
                    {
                      *(float *)&v43 = (float)(int)v22;
                      *(float *)&v44 = (float)(int)v37;
                      v45 = a1[4];
                      v46 = a1[2];
                      v47 = v45 + v46 * v37;
                      LOBYTE(v43) = *(_BYTE *)(v47 + v22);
                      v48 = v40 - *(float *)&v44;
                      LOBYTE(v44) = *(_BYTE *)(v47 + v36);
                      v49 = v45 + v46 * v41;
                      LOBYTE(v38) = *(_BYTE *)(v49 + v22);
                      LOBYTE(v39) = *(_BYTE *)(v49 + v36);
                      v30 = v30
                          + (float)((float)(v48
                                          * (float)((float)((float)(v35 - (float)(int)v22) * (float)LODWORD(v39))
                                                  + (float)((float)(1.0 - (float)(v35 - (float)(int)v22))
                                                          * (float)LODWORD(v38))))
                                  + (float)((float)(1.0 - v48)
                                          * (float)((float)((float)(v35 - (float)(int)v22) * (float)v44)
                                                  + (float)((float)(1.0 - (float)(v35 - (float)(int)v22)) * (float)v43))));
                      *(float *)&v21[v23] = v30;
                      ++v26;
                    }
                  }
                }
              }
            }
          }
          ++v31;
        }
        while (v25 != v31);
        if (v26 > 1)
          *(float *)&v21[v23] = v30 / (float)v26;
      }
      ++v23;
    }
    while (v23 != v20);
  }
  *a3 = v21;
  return v20;
}

uint64_t sub_1D3E4F654(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, std::string::size_type a5, size_t *a6, const char *a7)
{
  uint64_t v7;
  unint64_t v9;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  size_t v19;
  std::string::size_type v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  int v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  int v29;
  uint64_t v30;
  size_t v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  size_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  NSObject *v48;
  unint64_t v49;
  unsigned int v50;
  unint64_t v51;
  BOOL v52;
  unint64_t v53;
  int v54;
  unint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  int v68;
  _DWORD *v69;
  int v70;
  size_t v71;
  unsigned int *v72;
  unsigned int *v73;
  unsigned int *v74;
  int v75;
  unsigned int v76;
  unsigned int *v77;
  unsigned int *v78;
  unsigned int v79;
  unint64_t v80;
  unint64_t v81;
  BOOL v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  int v90;
  unsigned int v91;
  uint64_t v92;
  char v93;
  char v94;
  uint64_t v95;
  const char *v96;
  int v98;
  int v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  int v103;
  int v104;
  uint64_t v105;
  size_t v106;
  _DWORD *v107;
  unint64_t v108;
  _BYTE *v109;
  uint64x2_t v110;
  int32x2_t v111;
  int16x8_t v112;
  uint64_t j;
  unint64_t v114;
  int v115;
  int v116;
  size_t v117;
  uint64_t v118;
  unsigned int v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  int v123;
  int v124;
  int v125;
  unsigned int v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  unsigned int v130;
  uint64_t v131;
  int v132;
  _DWORD *v133;
  int v134;
  int v135;
  _DWORD *v136;
  int v137;
  int v138;
  int v139;
  unsigned int v140;
  _DWORD *v141;
  uint64_t v142;
  int v143;
  int v144;
  _DWORD *v145;
  void *v146;
  int v147;
  unsigned int v148;
  int v149;
  _DWORD *v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int *v153;
  size_t v154;
  unsigned int v155;
  int v156;
  size_t v157;
  char v158;
  char *v159;
  unint64_t v160;
  size_t *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  size_t v165;
  int v167;
  uint64_t v168;
  unsigned int v169;
  size_t v170;
  int v171;
  uint64_t v172;
  size_t v173;
  unsigned int v174;
  size_t *v175;
  uint64_t v177;
  int v178;
  char v180;
  size_t __n;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  void *__dst;
  char *v188;
  void *v189;
  size_t v190;
  void *v191;
  _BYTE buf[12];
  __int16 v193;
  const char *v194;
  __int16 v195;
  int v196;
  _BYTE v197[32];
  uint64_t v198;
  uint64_t v199;
  uint8_t v200[8];
  _DWORD *v201;
  _BYTE __src[88];
  uint64_t v203;

  v7 = 0;
  v203 = *MEMORY[0x1E0C80C00];
  if (a3 > 0xA8C)
    return v7;
  v9 = a2;
  if (a2 >= a3)
    return v7;
  v13 = a2;
  do
  {
    if (*(unsigned __int16 *)(a1 + 2 * v13) > 0x3A0u)
      return 0;
    ++v13;
  }
  while (a3 != v13);
  pthread_once(&stru_1EFE316F0, (void (*)(void))sub_1D3E50B1C);
  if (a7)
    v14 = a7;
  else
    v14 = "ISO-8859-1";
  v15 = MEMORY[0x1D8255020]("UTF-8", v14);
  if (v15 == -1)
  {
    if (qword_1EFE31880 != -1)
      dispatch_once(&qword_1EFE31880, &unk_1E95B3648);
    v16 = qword_1EFE31878;
    if (os_log_type_enabled((os_log_t)qword_1EFE31878, OS_LOG_TYPE_ERROR))
    {
      v167 = *__error();
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "UTF-8";
      v193 = 2082;
      v194 = v14;
      v195 = 1026;
      v196 = v167;
      _os_log_error_impl(&dword_1D3D6B000, v16, OS_LOG_TYPE_ERROR, "[PDF417] iconv_open(\"%{public}s\", \"%{public}s\") failed: %{public, errno}d", buf, 0x1Cu);
    }
    v15 = -1;
  }
  v175 = a6;
  v177 = 0;
  v17 = 0;
  v180 = 0;
  v18 = 0;
  __n = 0;
  v19 = 0;
  __src[87] = 0;
  v20 = a5 - 1;
  i = 3;
  v22 = 3;
  while (2)
  {
    if (a3 <= v9 || (v23 = v20 - v19, v20 <= v19))
    {
      if ((v18 & 1) == 0)
      {
        v159 = a4;
        goto LABEL_345;
      }
      v160 = v19 >> 1;
      v159 = a4;
      v161 = v175;
      if (v19 >= 2)
      {
        if (v160 <= 1)
          v162 = 1;
        else
          v162 = v19 >> 1;
        v163 = a4;
        do
        {
          *(_WORD *)v163 = bswap32(*(unsigned __int16 *)v163) >> 16;
          v163 += 2;
          --v162;
        }
        while (v162);
      }
      v164 = v15;
      if ((v19 & 1) != 0)
        *(_WORD *)&a4[2 * v160] = a4[v19 - 1] << 8;
      v19 = sub_1D3DD4144((uint64_t)a4, 8 * v19, a4, a5);
      v15 = v164;
LABEL_346:
      v165 = a5 - 1;
      if (v19 < a5 - 1)
        v165 = v19;
      if (v161)
        *v161 = v165;
      v159[v165] = 0;
      v7 = 1;
      goto LABEL_351;
    }
    v24 = *(__int16 *)(a1 + 2 * v9);
    switch(*(_WORD *)(a1 + 2 * v9))
    {
      case 0x384:
        v177 = 0;
        v17 = 0;
        goto LABEL_19;
      case 0x385:
        v60 = 1;
        goto LABEL_160;
      case 0x386:
        v60 = 3;
        goto LABEL_160;
      case 0x387:
      case 0x388:
      case 0x389:
      case 0x38A:
      case 0x38B:
      case 0x38C:
      case 0x38D:
      case 0x38E:
      case 0x38F:
      case 0x390:
      case 0x392:
      case 0x393:
      case 0x394:
      case 0x395:
      case 0x396:
      case 0x397:
      case 0x39B:
        goto LABEL_19;
      case 0x391:
        if (HIDWORD(v177))
          goto LABEL_333;
        HIDWORD(v177) = 0;
        v17 = 4;
        goto LABEL_19;
      case 0x398:
        v18 = 1;
        goto LABEL_19;
      case 0x399:
        if (v9 != 1)
          goto LABEL_333;
        goto LABEL_19;
      case 0x39A:
        v180 = 0;
        goto LABEL_19;
      case 0x39C:
        goto LABEL_159;
      case 0x39D:
        if (++v9 >= a3)
          goto LABEL_333;
        v61 = *(unsigned __int16 *)(a1 + 2 * v9);
        if (v61 > 0x383)
          goto LABEL_333;
        v22 = v61 + 810900;
        goto LABEL_19;
      case 0x39E:
        if (v9 + 2 >= a3)
          goto LABEL_333;
        v62 = *(unsigned __int16 *)(a1 + 2 * v9 + 2);
        if (v62 > 0x383)
          goto LABEL_333;
        v63 = *(unsigned __int16 *)(a1 + 2 * (v9 + 2));
        if (v63 >= 0x384)
          goto LABEL_333;
        v22 = v63 + 900 * v62 + 900;
        v9 += 2;
        goto LABEL_19;
      case 0x39F:
        if (++v9 >= a3)
          goto LABEL_333;
        v22 = *(unsigned __int16 *)(a1 + 2 * v9);
        if (v22 > 0x383)
          goto LABEL_333;
        goto LABEL_19;
      case 0x3A0:
        v9 += 2;
        v180 = 1;
        goto LABEL_19;
      default:
        if (!HIDWORD(v177))
        {
          if ((_DWORD)v17 != 4)
          {
            v92 = 0;
            *(_DWORD *)buf = ((__int16)((34953 * v24) >> 16) >> 4)
                           + (((v24 + ((-30583 * v24) >> 16)) & 0x8000) >> 15);
            *(_DWORD *)&buf[4] = (__int16)(v24 - 30 * *(_WORD *)buf);
            v93 = 1;
            do
            {
              v94 = v93;
              v95 = *(int *)&buf[4 * v92];
              switch((int)v17)
              {
                case 0:
                  if ((int)v95 <= 26)
                  {
                    v96 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";
                    goto LABEL_198;
                  }
                  v98 = v177;
                  if ((_DWORD)v95 == 27)
                    v99 = 1;
                  else
                    v99 = v177;
                  v100 = v95 == 27;
                  if ((_DWORD)v95 == 28)
                  {
                    v99 = 2;
                    v100 = 2;
                  }
                  if ((_DWORD)v95 != 29)
                    v98 = v99;
                  LODWORD(v177) = v98;
                  if ((_DWORD)v95 == 29)
                    v17 = 3;
                  else
                    v17 = v100;
                  break;
                case 1:
                  if ((int)v95 <= 26)
                  {
                    v96 = "abcdefghijklmnopqrstuvwxyz ";
                    goto LABEL_198;
                  }
                  v101 = v95 != 27;
                  v102 = v177;
                  if ((_DWORD)v95 == 28)
                    v103 = 2;
                  else
                    v103 = v177;
                  if ((_DWORD)v95 == 28)
                    v101 = 2;
                  if ((_DWORD)v95 != 29)
                    v102 = v103;
                  LODWORD(v177) = v102;
                  if ((_DWORD)v95 == 29)
                    v17 = 3;
                  else
                    v17 = v101;
                  break;
                case 2:
                  if ((int)v95 <= 26 && (_DWORD)v95 != 25)
                  {
                    v96 = "0123456789&\r\t,:#-.$/+%*=^";
                    goto LABEL_198;
                  }
                  v17 = 2;
                  switch((int)v95)
                  {
                    case 25:
                      LODWORD(v177) = 3;
                      goto LABEL_174;
                    case 27:
                      LODWORD(v177) = 1;
                      v17 = 1;
                      goto LABEL_199;
                    case 28:
                      goto LABEL_176;
                    case 29:
LABEL_174:
                      v17 = 3;
                      break;
                    default:
                      goto LABEL_199;
                  }
                  break;
                case 3:
                  if ((_DWORD)v95 == 29)
                  {
LABEL_176:
                    LODWORD(v177) = 0;
                    v17 = 0;
                  }
                  else
                  {
LABEL_198:
                    __src[__n] = v96[v95];
                    v17 = v177;
                    ++__n;
                  }
                  break;
                default:
                  break;
              }
LABEL_199:
              v93 = 0;
              v92 = 1;
            }
            while ((v94 & 1) != 0);
            HIDWORD(v177) = 0;
            goto LABEL_19;
          }
          if (v24 <= 255)
          {
            HIDWORD(v177) = 0;
            __src[__n] = v24;
            v17 = v177;
            ++__n;
            goto LABEL_19;
          }
          goto LABEL_333;
        }
        v174 = v17;
        if ((HIDWORD(v177) - 1) > 1)
        {
          if (HIDWORD(v177) != 3)
          {
LABEL_159:
            v60 = 2;
LABEL_160:
            HIDWORD(v177) = v60;
            goto LABEL_19;
          }
          v186 = 0x800000000;
          __dst = buf;
          *(_QWORD *)v200 = 0x800000000;
          v201 = v197;
          v184 = 0x800000000;
          v185 = &v198;
          v182 = 0x800000000;
          v183 = &v199;
          if (v24)
          {
            v24 = (unsigned __int16)v24;
            LODWORD(v186) = 1;
          }
          *(_DWORD *)buf = v24;
          v66 = v9 + 1;
          v171 = v18;
          v169 = i;
          v172 = v15;
          v173 = v19;
          if (v9 + 1 >= a3)
          {
            v105 = v15;
            v106 = v19;
            v107 = v197;
            v67 = 1;
            goto LABEL_219;
          }
          v67 = 1;
          while (1)
          {
            if (v67 > 0xE || *(unsigned __int16 *)(a1 + 2 * v66) > 0x383u)
              goto LABEL_218;
            if (!(_DWORD)v186)
              goto LABEL_156;
            v68 = (int)v186 >= 0 ? v186 : -(int)v186;
            v69 = __dst;
            v70 = v68;
            while (!*v69)
            {
              ++v69;
              if (!--v70)
                goto LABEL_156;
            }
            v71 = 4 * (v68 + 1);
            v178 = v68;
            v72 = (unsigned int *)off_1EFE319B0(qword_1EFE319B8, 0, v71);
            if (!v72)
              goto LABEL_156;
            v73 = v72;
            bzero(v72, v71);
            v74 = (unsigned int *)__dst;
            if ((int)v186 >= 0)
              v75 = v186;
            else
              v75 = -(int)v186;
            if ((_DWORD)v186)
            {
              v76 = 0;
              v77 = v73;
              v78 = (unsigned int *)__dst;
              do
              {
                v79 = *v78++;
                v80 = 900 * v79;
                v81 = HIDWORD(v80);
                v82 = __CFADD__(*v77, (_DWORD)v80);
                v83 = *v77 + v80;
                v84 = v82;
                if (v83 < *v77)
                  v85 = 1;
                else
                  v85 = v84;
                v86 = v85 + v81;
                v82 = __CFADD__(v83, v76);
                v87 = v83 + v76;
                v88 = v82;
                if (v87 < v76)
                  v89 = 1;
                else
                  v89 = v88;
                v76 = v86 + v89;
                *v77++ = v87;
                --v75;
              }
              while (v75);
              v73[v178] = v76;
              if (v76)
              {
                if ((v186 & 0x80000000) != 0)
                  v90 = v186 - 1;
                else
                  v90 = v186 + 1;
                goto LABEL_150;
              }
            }
            else
            {
              v73[v178] = 0;
            }
            v90 = v186;
LABEL_150:
            if (v73 != v74)
            {
              if (v90 >= 0)
                v91 = v90;
              else
                v91 = -v90;
              memcpy(v74, v73, 4 * v91);
              LODWORD(v186) = v90;
            }
            off_1EFE319A8(qword_1EFE319B8);
LABEL_156:
            sub_1D3E2198C(*(unsigned __int16 *)(a1 + 2 * v66), (uint64_t)&v186);
            v66 = ++v67 + v9;
            v15 = v172;
            v19 = v173;
            if (v67 == a3 - v9)
            {
              v67 = a3 - v9;
LABEL_218:
              v105 = v15;
              v106 = v19;
              v107 = v201;
LABEL_219:
              v20 = a5 - 1;
              v9 = v9 + v67 - 1;
              *v107 = 10;
              *(_DWORD *)v200 = 1;
              sub_1D3E22784((uint64_t)v200, (uint64_t)&v184);
              v116 = 0;
              v117 = __n;
              v19 = v106;
              v15 = v105;
              while (2)
              {
                v18 = v171;
                if (!(_DWORD)v186)
                  goto LABEL_333;
                v118 = 0;
                if ((int)v186 >= 0)
                  v119 = v186;
                else
                  v119 = -(int)v186;
                if ((((int)v186 & 0x4000000000000000) != 0) ^ __OFSUB__((int)v186, -(uint64_t)(int)v186) | ((int)v186 == -(uint64_t)(int)v186))
                  v120 = -(uint64_t)(int)v186;
                else
                  LODWORD(v120) = v186;
                while (!*((_DWORD *)__dst + v118))
                {
                  if ((_DWORD)v120 == (_DWORD)++v118)
                  {
                    if ((_DWORD)v186 != 1 || *(_DWORD *)__dst != 1)
                      goto LABEL_333;
LABEL_324:
                    if (v117 <= __n)
                    {
                      HIDWORD(v177) = 3;
                      __n = v117;
                      v17 = v174;
                      i = v169;
                    }
                    else
                    {
                      v157 = v117 - 1;
                      v17 = v174;
                      for (i = v169; v157 > __n; ++__n)
                      {
                        v158 = __src[v157];
                        __src[v157] = __src[__n];
                        __src[__n] = v158;
                        --v157;
                      }
                      HIDWORD(v177) = 3;
                      __n = v117;
                    }
                    goto LABEL_19;
                  }
                }
                if ((_DWORD)v186 == 1 && *(_DWORD *)__dst == 1)
                  goto LABEL_324;
                v170 = v117;
                if (__dst != v183)
                {
                  memcpy(v183, __dst, 4 * v119);
                  v116 = v186;
                  LODWORD(v182) = v186;
                }
                v121 = v116;
                v122 = sub_1D3E21864(v184, v185);
                v123 = *(_DWORD *)v200;
                if (*(int *)v200 < 0)
                  v123 = -*(_DWORD *)v200;
                v124 = v121;
                if (v121 >= 0)
                  v125 = v121;
                else
                  v125 = -v121;
                v126 = v125 + 4 * v123;
                v190 = 0;
                v191 = 0;
                if (!v126)
                {
                  v127 = 0;
                  goto LABEL_244;
                }
                v191 = (void *)off_1EFE319B0(qword_1EFE319B8, 0, 4 * (v125 + 4 * v123));
                if (v191)
                {
                  HIDWORD(v190) = v126;
                  v127 = off_1EFE319B0(qword_1EFE319B8, 0, 4 * v126);
                  if (!v127)
                  {
                    v128 = 0;
                    goto LABEL_258;
                  }
LABEL_244:
                  v168 = v127;
                  LODWORD(v182) = v125;
                  do
                  {
                    if (v183 != v191)
                    {
                      v129 = v182;
                      if ((int)v182 >= 0)
                        v130 = v182;
                      else
                        v130 = -(int)v182;
                      memcpy(v191, v183, 4 * v130);
                      LODWORD(v190) = v129;
                    }
                    if ((_DWORD)v122 == 1)
                    {
                      v131 = 1;
                      sub_1D3E21FE0(1u, (uint64_t)&v190);
                    }
                    else
                    {
                      sub_1D3E22144((v122 - 2), (uint64_t)&v190);
                      v131 = v122;
                    }
                    sub_1D3E22234((int *)&v184, (int *)&v190);
                    sub_1D3E22144(v131, (uint64_t)&v190);
                    sub_1D3E22234((int *)v200, (int *)&v190);
                    sub_1D3E21EA0((int *)&v190, (uint64_t)&v182);
                    v132 = *(_DWORD *)v200;
                    v133 = v201;
                    if ((sub_1D3E218CC((uint64_t)&v182, *(int *)v200, v201) & 0x80000000) == 0)
                    {
                      sub_1D3E21EA0((int *)v200, (uint64_t)&v182);
                      v132 = *(_DWORD *)v200;
                      v133 = v201;
                    }
                  }
                  while ((sub_1D3E218CC((uint64_t)&v182, v132, v133) & 0x80000000) == 0);
                  if (v124 < 0)
                  {
                    v128 = v168;
                    if ((_DWORD)v182)
                    {
                      if ((int)v182 >= 0)
                        v149 = v182;
                      else
                        v149 = -(int)v182;
                      v150 = v183;
                      while (!*v150)
                      {
                        ++v150;
                        if (!--v149)
                          goto LABEL_258;
                      }
                      LODWORD(v182) = -(int)v182;
                      sub_1D3E21A34((unsigned int *)v200, (uint64_t)&v182);
                    }
                  }
                  else
                  {
                    v128 = v168;
                  }
LABEL_258:
                  if (v191)
                    off_1EFE319A8(qword_1EFE319B8);
                  v190 = 0;
                  v191 = 0;
                  if (v128)
                    off_1EFE319A8(qword_1EFE319B8);
                }
                v134 = sub_1D3E21864(v184, v185);
                if ((_DWORD)v186)
                {
                  if ((int)v186 >= 0)
                    v135 = v186;
                  else
                    v135 = -(int)v186;
                  v136 = __dst;
                  v137 = v135;
                  while (!*v136)
                  {
                    ++v136;
                    if (!--v137)
                      goto LABEL_271;
                  }
                  if ((int)v186 < 1)
                    v138 = -1;
                  else
                    v138 = 1;
                }
                else
                {
                  v135 = 0;
LABEL_271:
                  v138 = 0;
                }
                v139 = *(_DWORD *)v200;
                if (*(int *)v200 < 0)
                  v139 = -*(_DWORD *)v200;
                v140 = v135 + 4 * v139;
                v188 = 0;
                v189 = 0;
                v190 = 0;
                v191 = 0;
                v191 = (void *)off_1EFE319B0(qword_1EFE319B8, 0, 4 * v140);
                if (v191)
                {
                  HIDWORD(v190) = v140;
                  v141 = (_DWORD *)off_1EFE319B0(qword_1EFE319B8, 0, 4 * v140);
                  v189 = v141;
                  if (v141)
                  {
                    v142 = (2 * v134 - 2);
                    HIDWORD(v188) = v140;
                    v143 = v186;
                    if ((int)v186 < 0)
                      v143 = -(int)v186;
                    LODWORD(v186) = v143;
                    *v141 = 0;
                    do
                    {
                      sub_1D3E223FC((uint64_t)&v186, (uint64_t)&v184, (uint64_t)&v190);
                      sub_1D3E22144(v142, (uint64_t)&v190);
                      sub_1D3E21A34((unsigned int *)&v190, (uint64_t)&v188);
                      sub_1D3E22234((int *)v200, (int *)&v190);
                      sub_1D3E21EA0((int *)&v190, (uint64_t)&v186);
                      v144 = *(_DWORD *)v200;
                      v145 = v201;
                      if ((sub_1D3E218CC((uint64_t)&v186, *(int *)v200, v201) & 0x80000000) == 0)
                      {
                        sub_1D3E21EA0((int *)v200, (uint64_t)&v186);
                        sub_1D3E2198C(1, (uint64_t)&v188);
                        v144 = *(_DWORD *)v200;
                        v145 = v201;
                      }
                    }
                    while ((sub_1D3E218CC((uint64_t)&v186, v144, v145) & 0x80000000) == 0);
                    v146 = v189;
                    if (v189 == __dst)
                    {
                      v147 = v186;
                    }
                    else
                    {
                      v147 = (int)v188;
                      if ((int)v188 >= 0)
                        v148 = v188;
                      else
                        v148 = -(int)v188;
                      memcpy(__dst, v189, 4 * v148);
                    }
                    LODWORD(v186) = v147 * v138;
                  }
                  else
                  {
                    v146 = 0;
                  }
                  if (v191)
                    off_1EFE319A8(qword_1EFE319B8);
                  v190 = 0;
                  v191 = 0;
                  if (v146)
                    off_1EFE319A8(qword_1EFE319B8);
                }
                v116 = v182;
                if ((_DWORD)v182)
                {
                  v151 = 0;
                  LODWORD(v152) = v182;
                  v153 = (unsigned int *)v183;
                  if ((((int)v182 & 0x4000000000000000) != 0) ^ __OFSUB__((int)v182, -(uint64_t)(int)v182) | ((int)v182 == -(uint64_t)(int)v182))
                    v152 = -(uint64_t)(int)v182;
                  v15 = v172;
                  v19 = v173;
                  v154 = v170;
                  while (!*((_DWORD *)v183 + v151))
                  {
                    if ((_DWORD)v152 == (_DWORD)++v151)
                      goto LABEL_316;
                  }
                  if ((v182 & 0x80000000) != 0)
                  {
LABEL_316:
                    v155 = 0;
                  }
                  else
                  {
                    v156 = v182;
                    if (sub_1D3E21864(v182, v183) <= 0x20)
                      v155 = *v153;
                    else
                      v155 = 0;
                    v15 = v172;
                    v19 = v173;
                    v116 = v156;
LABEL_319:
                    v154 = v170;
                  }
                  __src[v154] = (v155 % 0xA) | 0x30;
                  v117 = v154 + 1;
                  v20 = a5 - 1;
                  continue;
                }
                break;
              }
              v155 = 0;
              v15 = v172;
              v19 = v173;
              goto LABEL_319;
            }
          }
        }
        v49 = 0;
        *(_WORD *)&buf[8] = 0;
        *(_QWORD *)buf = 0;
        do
        {
          v50 = *(unsigned __int16 *)(a1 + 2 * v9 + 2 * v49);
          if (v50 > 0x383)
          {
            v52 = 1;
            v51 = v49;
            v54 = HIDWORD(v177);
LABEL_104:
            v64 = v51 % 5;
            if (v54 != 2 || !v64)
            {
              if (v54 != 1)
                v52 = 0;
              if (!v64 && !v52)
              {
                v65 = v51;
                goto LABEL_210;
              }
              if (v51)
                goto LABEL_211;
              goto LABEL_214;
            }
            goto LABEL_333;
          }
          *(_WORD *)&buf[2 * v49] = v50;
          v51 = v49 + 1;
          v52 = v49 < 4;
          if (v49 > 3)
            break;
          v53 = v9 + 1 + v49++;
        }
        while (v53 < a3);
        v54 = HIDWORD(v177);
        if (HIDWORD(v177) != 1 || v51 != 5)
          goto LABEL_104;
        v55 = v9 + 5;
        if (v9 + 5 >= a3)
        {
          v59 = 0;
        }
        else
        {
          v56 = 5;
          while (1)
          {
            v57 = *(__int16 *)(a1 + 2 * v55);
            v58 = v57 - 900;
            if (v57 < 900)
            {
LABEL_206:
              v59 = 0;
              goto LABEL_207;
            }
            if ((v57 - 903) >= 0xA
              && (unsigned __int16)v57 - 914 >= 4
              && (unsigned __int16)v57 != 919)
            {
              break;
            }
LABEL_71:
            ++v56;
LABEL_72:
            v55 = v56 + v9;
            if (v56 + v9 >= a3)
              goto LABEL_206;
          }
          if ((unsigned __int16)v57 != 913)
          {
            v59 = 1;
            switch(v58)
            {
              case 0:
              case 1:
              case 2:
              case 22:
              case 23:
              case 24:
              case 28:
                goto LABEL_207;
              case 18:
              case 20:
                goto LABEL_71;
              case 21:
                goto LABEL_333;
              case 25:
              case 27:
                v56 += 2;
                goto LABEL_72;
              case 26:
                v56 += 3;
                goto LABEL_72;
              default:
                goto LABEL_72;
            }
          }
          v59 = 1;
LABEL_207:
          v55 = v56 + v9;
        }
        v51 = 5;
        if (v55 < a3)
        {
          v65 = 5;
          if (!v59)
          {
LABEL_210:
            v108 = 656100000000 * *(__int16 *)buf
                 + 729000000 * *(__int16 *)&buf[2]
                 + 810000 * *(__int16 *)&buf[4]
                 + 900 * *(__int16 *)&buf[6]
                 + *(__int16 *)&buf[8];
            v109 = &__src[__n];
            v110 = (uint64x2_t)vdupq_n_s64(v108);
            v111 = vmovn_s64((int64x2_t)vshlq_u64(v110, (uint64x2_t)xmmword_1D3E82220));
            v112 = (int16x8_t)vshlq_u64(v110, (uint64x2_t)xmmword_1D3E82210);
            *(int32x2_t *)v112.i8 = vmovn_s64((int64x2_t)v112);
            v112.i16[1] = v112.i16[2];
            v112.i16[2] = v111.i16[0];
            v112.i16[3] = v111.i16[2];
            *(_DWORD *)v109 = vmovn_s16(v112).u32[0];
            v109[4] = BYTE1(v108);
            __n += 6;
            v109[5] = v108;
            v51 = v65;
            goto LABEL_214;
          }
        }
LABEL_211:
        for (j = 0; j != v51; ++j)
          __src[__n + j] = *(_WORD *)&buf[2 * j];
        __n += j;
LABEL_214:
        v17 = v174;
        v82 = v51 != 0;
        v114 = v51 - 1;
        if (!v82)
          v114 = 0;
        v9 += v114;
LABEL_19:
        if ((_DWORD)v22 != (_DWORD)i)
        {
          if (v15 != -1)
          {
            v25 = v19;
            v26 = v17;
            MEMORY[0x1D8255014](v15);
            v17 = v26;
            v19 = v25;
          }
          v27 = 0;
          v28 = dword_1E95B4248;
          while (1)
          {
            v29 = *v28;
            v28 += 4;
            if (v29 == (_DWORD)v22)
              break;
            if (++v27 == 32)
              goto LABEL_27;
          }
          if ((unint64_t)(v27 - 27) < 5)
          {
LABEL_27:
            __n = 0;
            v15 = -1;
            i = v22;
            goto LABEL_36;
          }
          v30 = v17;
          v31 = v19;
          v32 = *(const char **)&dword_1E95B4248[4 * v27 + 2];
          v33 = MEMORY[0x1D8255020]("UTF-8", v32);
          if (v33 == -1)
          {
            if (qword_1EFE31880 != -1)
              dispatch_once(&qword_1EFE31880, &unk_1E95B3648);
            v34 = qword_1EFE31878;
            if (os_log_type_enabled((os_log_t)qword_1EFE31878, OS_LOG_TYPE_ERROR))
            {
              v104 = *__error();
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "UTF-8";
              v193 = 2082;
              v194 = v32;
              v195 = 1026;
              v196 = v104;
              _os_log_error_impl(&dword_1D3D6B000, v34, OS_LOG_TYPE_ERROR, "[PDF417] iconv_open(\"%{public}s\", \"%{public}s\") failed: %{public, errno}d", buf, 0x1Cu);
            }
            __n = 0;
            v15 = -1;
          }
          else
          {
            v15 = v33;
            __n = 0;
          }
          i = v22;
          v20 = a5 - 1;
          v19 = v31;
          v17 = v30;
        }
LABEL_36:
        if ((v180 & 1) != 0)
        {
LABEL_37:
          __n = 0;
          v35 = 0;
          goto LABEL_98;
        }
        if ((v18 & 1) != 0)
        {
          if (__n)
          {
            v43 = v19;
            v44 = i;
            v45 = v17;
            v46 = v15;
            memcpy(&a4[v19], __src, __n);
            i = v44;
            v15 = v46;
            v17 = v45;
            v35 = 0;
            v19 = __n + v43;
            v18 = 1;
            __n = 0;
          }
          else
          {
            __n = 0;
            v35 = 0;
            v18 = 1;
          }
          goto LABEL_98;
        }
        if (v15 == -1)
        {
          v18 = 0;
          goto LABEL_37;
        }
        v36 = i;
        v37 = v17;
        *(_QWORD *)buf = __src;
        v190 = __n;
        v38 = &a4[v19];
        v188 = &a4[v19];
        v186 = v23;
        v39 = v19;
        v40 = v15;
        v41 = MEMORY[0x1D8255008](v15, buf, &v190, &v188, &v186);
        v42 = v188 - v38 + v39;
        if (v41 == -1)
        {
          v47 = *__error();
          if (v47 == 7)
          {
            v35 = 31;
          }
          else
          {
            if (v47 == 22)
              goto LABEL_43;
            if (qword_1EFE31880 != -1)
              dispatch_once(&qword_1EFE31880, &unk_1E95B3648);
            v48 = qword_1EFE31878;
            if (os_log_type_enabled((os_log_t)qword_1EFE31878, OS_LOG_TYPE_ERROR))
            {
              v115 = *__error();
              *(_DWORD *)v200 = 67240192;
              *(_DWORD *)&v200[4] = v115;
              v35 = 8;
              _os_log_error_impl(&dword_1D3D6B000, v48, OS_LOG_TYPE_ERROR, "[PDF417] iconv failed: %{public, errno}d", v200, 8u);
            }
            else
            {
              v35 = 8;
            }
          }
          v20 = a5 - 1;
          v19 = v42;
          v17 = v37;
          v18 = 0;
          v15 = v40;
          i = v36;
          goto LABEL_98;
        }
LABEL_43:
        if (v190)
        {
          __memmove_chk();
          __n = v190;
        }
        else
        {
          __n = 0;
        }
        v20 = a5 - 1;
        v19 = v42;
        v17 = v37;
        v15 = v40;
        i = v36;
        v18 = 0;
        v35 = 0;
LABEL_98:
        ++v9;
        if (!v35)
          continue;
        v159 = a4;
        if (v35 != 8)
        {
LABEL_345:
          v161 = v175;
          goto LABEL_346;
        }
LABEL_333:
        v7 = 0;
LABEL_351:
        if (v15 != -1)
          MEMORY[0x1D8255014](v15);
        return v7;
    }
  }
}

double sub_1D3E50B1C()
{
  malloc_zone_t *zone;
  double result;

  zone = malloc_create_zone(0, 0);
  qword_1EFE31A30 = (uint64_t)zone;
  if (!zone)
  {
    perror("malloc_create_zone");
    zone = (malloc_zone_t *)qword_1EFE31A30;
  }
  *(_QWORD *)&result = 0x1D3E50B88;
  unk_1EFE319A0 = xmmword_1E95B0550;
  off_1EFE319B0 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_1D3E50B98;
  qword_1EFE319B8 = (uint64_t)zone;
  return result;
}

void *sub_1D3E50B88(malloc_zone_t *a1, size_t a2)
{
  return malloc_type_zone_malloc(a1, a2, 0xE5344F27uLL);
}

void *sub_1D3E50B98(malloc_zone_t *a1, void *a2, size_t a3)
{
  return malloc_type_zone_realloc(a1, a2, a3, 0x3C15DCA2uLL);
}

FFTSetup sub_1D3E50BA4()
{
  _QWORD *v0;

  v0 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
  qword_1EFE31A38 = (uint64_t)v0;
  v0[1] = 0;
  return sub_1D3E50BDC((uint64_t)v0, 0xDuLL);
}

FFTSetup sub_1D3E50BDC(uint64_t a1, vDSP_Length __Log2n)
{
  unsigned int v2;
  OpaqueFFTSetup *v4;
  FFTSetup result;

  v2 = __Log2n;
  *(_DWORD *)a1 = 1 << __Log2n;
  *(_DWORD *)(a1 + 4) = __Log2n;
  v4 = *(OpaqueFFTSetup **)(a1 + 8);
  if (v4)
    vDSP_destroy_fftsetup(v4);
  result = vDSP_create_fftsetup(v2, 0);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1D3E50C24(float *a1, float *a2, float *a3, float *a4, float a5, float a6, float a7, float a8, float a9, float a10, float a11, float a12)
{
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t result;
  float v18;
  float v19;
  float v20;
  float v21;
  BOOL v24;

  v12 = a7 - a5;
  v13 = a8 - a6;
  v14 = a11 - a9;
  v15 = a12 - a10;
  v16 = (float)(v12 * (float)(a12 - a10)) - (float)(v14 * v13);
  if (v16 == 0.0)
    return 0;
  v18 = a5 - a9;
  v19 = a6 - a10;
  v20 = (float)((float)(v12 * v19) - (float)(v13 * v18)) / v16;
  v21 = (float)((float)(v14 * v19) - (float)(v15 * v18)) / v16;
  v24 = v21 < 0.0 || v20 > 1.0 || v20 < 0.0 || v21 > 1.0;
  *a1 = a5 + (float)(v21 * v12);
  *a2 = a6 + (float)(v21 * v13);
  if (v24)
    result = 1;
  else
    result = 2;
  *a3 = v21;
  *a4 = v20;
  return result;
}

uint64_t sub_1D3E50CA8(float *a1, float *a2, float *a3, float *a4, float a5, float a6, float a7, float a8, float a9, float a10, float a11, float a12)
{
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  *a1 = a5;
  *a2 = a6;
  *a3 = a7;
  *a4 = a8;
  if (a5 >= a9 && a5 <= a10 && a8 >= a11 && a8 <= a12 && a7 >= a9 && a7 <= a10 && a6 >= a11 && a6 <= a12)
    return 1;
  v47 = 0;
  v48 = 0;
  v45 = 0;
  v46 = 0;
  v31 = sub_1D3E50C24((float *)&v48 + 1, (float *)&v48, &v44, &v43, a9, a11, a9, a12, a5, a6, a7, a8);
  v32 = sub_1D3E50C24((float *)&v47 + 1, (float *)&v47, &v42, &v41, a10, a11, a10, a12, a5, a6, a7, a8);
  v33 = sub_1D3E50C24((float *)&v46 + 1, (float *)&v46, &v40, &v39, a9, a11, a10, a11, a5, a6, a7, a8);
  v34 = sub_1D3E50C24((float *)&v45 + 1, (float *)&v45, &v38, &v37, a9, a12, a10, a12, a5, a6, a7, a8);
  v35 = 0;
  if (v31 == 2)
  {
    if (a7 < a9 || a5 >= a9)
    {
      *a3 = *((float *)&v48 + 1);
      *(_DWORD *)a4 = v48;
    }
    else
    {
      *a1 = *((float *)&v48 + 1);
      *(_DWORD *)a2 = v48;
    }
    v35 = 1;
  }
  if (v32 == 2)
  {
    if (a7 > a10 || a5 <= a10)
    {
      *a3 = *((float *)&v47 + 1);
      *(_DWORD *)a4 = v47;
    }
    else
    {
      *a1 = *((float *)&v47 + 1);
      *(_DWORD *)a2 = v47;
    }
    v35 = 1;
  }
  if (v33 == 2)
  {
    if (a8 < a11 || a6 >= a11)
    {
      *a3 = *((float *)&v46 + 1);
      *(_DWORD *)a4 = v46;
    }
    else
    {
      *a1 = *((float *)&v46 + 1);
      *(_DWORD *)a2 = v46;
    }
    v35 = 1;
  }
  if (v34 == 2)
  {
    if (a8 > a12 || a6 <= a12)
    {
      *a3 = *((float *)&v45 + 1);
      *(_DWORD *)a4 = v45;
    }
    else
    {
      *a1 = *((float *)&v45 + 1);
      *(_DWORD *)a2 = v45;
    }
    return 1;
  }
  return v35;
}

float sub_1D3E50F40(float *a1, float *a2, float *a3, float *a4, float result, float a6, float a7, float a8, float a9, float a10, float a11, float a12)
{
  float v12;
  float v13;
  BOOL v14;
  BOOL v15;
  float v16;
  BOOL v17;
  float v18;
  uint64_t v19;
  int v20;
  char v21;
  int v22;
  int v23;
  char v24;
  float v25;
  int v26;
  char v27;
  uint64_t v28;
  char v29;
  float v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  _DWORD v42[2];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a8 - a6;
  v13 = a7 - result;
  if ((float)(a7 - result) != 0.0 || v12 != 0.0)
  {
    if (a6 < a11 || (v12 == 0.0 ? (v14 = a6 > a12) : (v14 = 1), v14))
    {
      if (result < a9 || (v13 == 0.0 ? (v17 = result > a10) : (v17 = 1), v17))
      {
        v19 = 0;
        v20 = 0;
        *(float *)v42 = a9;
        *(float *)&v42[1] = a10;
        v43 = 0;
        v39 = 0;
        v40 = a11;
        v41 = a12;
        v37 = -1;
        v38 = -1;
        v21 = 1;
        v22 = -1;
        v23 = -1;
        do
        {
          v24 = v21;
          if (*((_DWORD *)&v37 + v19) == -1)
          {
            v25 = (float)(a6 - (float)((float)(v12 / v13) * result)) + (float)((float)(v12 / v13) * *(float *)&v42[v19]);
            *((float *)&v39 + v19) = v25;
            v26 = v25 >= a11;
            if (v25 == a11)
              v23 = 0;
            if (v25 > a12)
              v26 = 0;
            *((_DWORD *)&v37 + v19) = v26;
            if (v25 == a12)
              v22 = 0;
            v20 += v26;
          }
          v21 = 0;
          v19 = 1;
        }
        while ((v24 & 1) != 0);
        v27 = 0;
        v38 = __PAIR64__(v22, v23);
        result = result - (float)((float)(v13 / v12) * a6);
        v28 = 2;
        do
        {
          v29 = v27;
          if (*((_DWORD *)&v37 + v28) == -1)
          {
            v30 = result + (float)((float)(v13 / v12) * *((float *)&v39 + v28));
            *(float *)&v42[v28] = v30;
            v31 = v30 >= a9;
            if (v30 > a10)
              v31 = 0;
            *((_DWORD *)&v37 + v28) = v31;
            v20 += v31;
          }
          v27 = 1;
          v28 = 3;
        }
        while ((v29 & 1) == 0);
        if (v20 == 2)
        {
          v32 = 0;
          while (!*((_DWORD *)&v37 + v32))
          {
            if (++v32 == 4)
              goto LABEL_49;
          }
          *a1 = *(float *)&v42[v32];
          *a2 = *((float *)&v39 + v32);
LABEL_49:
          v33 = v32;
          if (v32 <= 3)
            v32 = 3;
          else
            v32 = v32;
          while (v32 != v33)
          {
            v34 = v33 + 1;
            if (*((_DWORD *)&v37 + ++v33))
            {
              *a3 = *(float *)&v42[v34];
              *a4 = *((float *)&v39 + v34);
              break;
            }
          }
          result = *a3;
          v36 = *a1;
          if ((__PAIR64__(v13 > 0.0, LODWORD(v13)) - COERCE_UNSIGNED_INT(0.0)) >> 32 != (__PAIR64__((float)(*a3 - *a1) > 0.0, *a3 - *a1)- COERCE_UNSIGNED_INT(0.0)) >> 32|| (__PAIR64__(v12 > 0.0, LODWORD(v12)) - COERCE_UNSIGNED_INT(0.0)) >> 32 != (__PAIR64__((float)(*a4 - *a2) > 0.0, *a4 - *a2)- COERCE_UNSIGNED_INT(0.0)) >> 32)
          {
            *a1 = result;
            *a3 = v36;
            result = *a2;
            *a2 = *a4;
            *a4 = result;
          }
        }
      }
      else
      {
        *a1 = result;
        *a3 = a7;
        if (a6 >= a8)
          result = a12;
        else
          result = a11;
        if (a6 >= a8)
          v18 = a11;
        else
          v18 = a12;
        *a2 = result;
        *a4 = v18;
      }
    }
    else
    {
      *a2 = a6;
      *a4 = a8;
      v15 = result < a7;
      if (result >= a7)
        result = a10;
      else
        result = a9;
      if (v15)
        v16 = a10;
      else
        v16 = a9;
      *a1 = result;
      *a3 = v16;
    }
  }
  return result;
}

unint64_t sub_1D3E511F8(unint64_t result, unint64_t a2, float *a3, unsigned int a4, float *a5, float *a6, float *a7)
{
  float v7;
  uint64_t v8;
  int v9;
  float v10;
  float v11;
  float v12;
  _BOOL4 v13;

  v7 = (float)result;
  LODWORD(result) = 1;
  v8 = a4;
  do
  {
    v9 = result;
    v10 = *a5 - a3[5];
    v11 = (float)((float)(a3[2] * 0.0) + (float)(a3[1] * v10)) + a3[7];
    v12 = a3[8] - (float)((float)(a3[4] * 0.0) + (float)(a3[3] * v10));
    *a6 = v11;
    *a7 = v12;
    result = 0;
    if (v9 && v11 >= 0.0)
    {
      v13 = v11 < v7;
      if (v12 < 0.0)
        v13 = 0;
      result = v12 < (float)a2 && v13;
    }
    ++a7;
    ++a6;
    ++a5;
    --v8;
  }
  while (v8);
  return result;
}

uint64_t sub_1D3E51288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float **a5, float *a6, float a7, float a8, float a9, float a10, float a11)
{
  float v11;
  float v12;
  int v13;
  int v14;
  float v26;
  unsigned int v27;
  float v28;
  float v29;
  size_t v30;
  __float2 v31;
  float v32;
  float v33;
  float v34;
  int v35;
  float *v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  float v42;
  float v43;
  float v44;
  int *v45;
  float v46;
  float v47;
  float v48;
  int v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  unsigned int v60;
  float v61;
  uint64_t v62;
  float v63;
  uint64_t v64;
  int v65;
  int v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  float v70;
  uint64_t v71;
  float *v72;
  int *v73;
  size_t v74;
  BOOL v75;
  int v76;
  int v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  float v81;
  _BYTE *v82;
  _BYTE *v83;
  float *v84;
  int *v85;
  size_t v86;
  uint64_t v87;
  int v88;
  int v89;
  float v90;
  float *v91;
  float *v92;
  uint64_t v93;
  int v94;
  uint64_t v96;
  float v97;
  float v98;
  float **v99;
  float v100;
  float v101;

  v11 = a9 - a7;
  v12 = a10 - a8;
  v13 = (int)(float)(a9 - a7);
  v14 = (int)(float)(a10 - a8);
  if (!(v13 | v14))
    return 0;
  v26 = atan2f(a10 - a8, v11);
  v27 = vcvtms_s32_f32(sqrtf((float)(v12 * v12) + (float)(v11 * v11)));
  if ((v27 & 0x80000000) != 0)
    return 0;
  v96 = a3;
  v99 = a5;
  v100 = a9;
  v28 = (float)(a7 + a9) * 0.5;
  v97 = a10;
  v98 = v26;
  v101 = a8;
  v29 = (float)(a8 + a10) * 0.5;
  v30 = v27 + 1;
  v31 = __sincosf_stret(v26);
  v32 = -v31.__sinval;
  v33 = fmaxf(a11, 1.0);
  v34 = ceilf(v33);
  v35 = vcvtps_s32_f32(v33);
  v36 = (float *)malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
  v37 = (int *)malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
  v45 = v37;
  v46 = (float)((float)(int)v30 + -1.0) * 0.5;
  v47 = (float)((float)(int)v34 + -1.0) * 0.5;
  if (v13)
  {
    if (v14)
    {
      v48 = v97;
      if (v35 >= 1)
      {
        v49 = 0;
        v50 = a2 - 1;
        v51 = v96 - 1;
        do
        {
          v52 = 0;
          v53 = v47 - (float)v49;
          v54 = v31.__sinval * v53;
          v55 = v31.__cosval * v53;
          do
          {
            v56 = (float)(int)v52 - v46;
            v57 = v28 + (float)(v54 + (float)(v31.__cosval * v56));
            LODWORD(v38) = vcvtmd_s64_f64(v57);
            if ((v38 & 0x80000000) == 0 && v50 >= v38)
            {
              LODWORD(v39) = vcvtpd_s64_f64(v57);
              if ((v39 & 0x80000000) == 0 && v50 >= v39)
              {
                v58 = v29 - (float)(v55 + (float)(v32 * v56));
                LODWORD(v40) = vcvtmd_s64_f64(v58);
                if ((v40 & 0x80000000) == 0 && v51 >= v40)
                {
                  LODWORD(v41) = vcvtpd_s64_f64(v58);
                  if ((v41 & 0x80000000) == 0 && v51 >= v41)
                  {
                    v59 = v57 - (float)(int)v38;
                    *(float *)&v60 = (float)(int)v40;
                    v61 = v58 - (float)(int)v40;
                    v62 = a1 + v40 * a4;
                    LOBYTE(v60) = *(_BYTE *)(v62 + v38);
                    LOBYTE(v42) = *(_BYTE *)(v62 + v39);
                    v40 = a1 + v41 * a4;
                    LOBYTE(v43) = *(_BYTE *)(v40 + v38);
                    v43 = (float)LODWORD(v43);
                    LOBYTE(v44) = *(_BYTE *)(v40 + v39);
                    v44 = (float)LODWORD(v44);
                    v63 = (float)(v59 * (float)LODWORD(v42)) + (float)((float)(1.0 - v59) * (float)v60);
                    v42 = 1.0 - v61;
                    v36[v52] = v36[v52]
                             + (float)((float)(v61 * (float)((float)(v59 * v44) + (float)((float)(1.0 - v59) * v43)))
                                     + (float)((float)(1.0 - v61) * v63));
                    v38 = (v37[v52] + 1);
                    v37[v52] = v38;
                  }
                }
              }
            }
            ++v52;
          }
          while (v30 != v52);
          ++v49;
        }
        while (v49 != v35);
      }
    }
    else
    {
      v76 = (int)v101;
      if (v35 >= 0)
        v77 = v35;
      else
        v77 = v35 + 1;
      v78 = (v76 - (v77 >> 1)) & ~((v76 - (v77 >> 1)) >> 31);
      v79 = v76 + (v77 >> 1);
      if (v96 - 1 >= v79)
        v80 = v79;
      else
        v80 = v96 - 1;
      v48 = v97;
      if (v80 >= v78)
      {
        v81 = a7;
        v82 = (_BYTE *)(a1 + a4 * v78 + (int)a7);
        do
        {
          v83 = v82;
          v84 = v36;
          v85 = v37;
          v86 = v30;
          do
          {
            LOBYTE(v81) = *v83;
            v81 = *v84 + (float)LODWORD(v81);
            *v84++ = v81;
            ++*v85++;
            v83 += (v11 > 0.0) - (unint64_t)(v11 < 0.0);
            --v86;
          }
          while (v86);
          v82 += a4;
          v75 = v78++ == v80;
        }
        while (!v75);
      }
    }
  }
  else
  {
    v65 = (int)a7;
    if (v35 >= 0)
      v66 = v35;
    else
      v66 = v35 + 1;
    v67 = (v65 - (v66 >> 1)) & ~((v65 - (v66 >> 1)) >> 31);
    v68 = v65 + (v66 >> 1);
    if (a2 - 1 >= v68)
      v69 = v68;
    else
      v69 = a2 - 1;
    v48 = v97;
    if (v69 >= v67)
    {
      v70 = v101;
      do
      {
        v71 = a1 + a4 * (int)v101;
        v72 = v36;
        v73 = v37;
        v74 = v30;
        do
        {
          LOBYTE(v70) = *(_BYTE *)(v71 + v67);
          v70 = *v72 + (float)LODWORD(v70);
          *v72++ = v70;
          ++*v73++;
          v71 += a4 * ((v12 > 0.0) - (unint64_t)(v12 < 0.0));
          --v74;
        }
        while (v74);
        v75 = v67++ == v69;
      }
      while (!v75);
    }
  }
  v87 = 0;
  v88 = 0;
  do
  {
    v89 = v37[v87];
    if (v89 < 1)
      ++v88;
    else
      v36[v87] = v36[v87] / (float)v89;
    ++v87;
  }
  while (v30 != v87);
  v64 = (v30 - v88);
  v90 = v47;
  if (v88 < 1 || (int)v64 <= 0)
  {
    v92 = v36;
  }
  else
  {
    v91 = (float *)malloc_type_malloc(4 * (v30 - v88), 0x100004052888210uLL);
    v92 = v91;
    v93 = 0;
    v94 = 0;
    do
    {
      if (v45[v93] >= 1)
        v91[v94++] = v36[v93];
      ++v93;
    }
    while (v30 != v93);
    free(v36);
  }
  free(v45);
  if (!(_DWORD)v64)
  {
    free(v92);
    v92 = 0;
  }
  *v99 = v92;
  *a6 = v98;
  a6[1] = v31.__cosval;
  a6[2] = v31.__sinval;
  a6[3] = v32;
  a6[4] = v31.__cosval;
  a6[5] = v46;
  a6[6] = v90;
  a6[7] = v28;
  a6[8] = v29;
  a6[9] = a7;
  a6[10] = v101;
  a6[11] = v100;
  a6[12] = v48;
  return v64;
}

uint64_t sub_1D3E5178C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, float **a5, float *a6, float a7, float a8, float a9, float a10, float a11)
{
  uint64_t result;
  uint64_t v19;
  uint64_t v20;

  result = 0;
  if (a2 >= 3 && a3 >= 3)
  {
    v19 = 0;
    v20 = 0;
    result = sub_1D3E50CA8((float *)&v20 + 1, (float *)&v20, (float *)&v19 + 1, (float *)&v19, a7, a8, a9, a10, 1.0, (float)(a2 - 2), 1.0, (float)(a3 - 2));
    if ((_DWORD)result)
      return sub_1D3E51288(a1, a2, a3, a4, a5, a6, *((float *)&v20 + 1), *(float *)&v20, *((float *)&v19 + 1), *(float *)&v19, a11);
  }
  return result;
}

uint64_t sub_1D3E51850(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, float **a5, float *a6, float a7, float a8, float a9, float a10, float a11)
{
  uint64_t result;
  float v21;
  __float2 v22;
  uint64_t v23;
  uint64_t v24;

  result = 0;
  if (a2 >= 3 && a3 >= 3)
  {
    v21 = a9 * 0.5;
    v22 = __sincosf_stret(a10);
    v23 = 0;
    v24 = 0;
    result = sub_1D3E50CA8((float *)&v24 + 1, (float *)&v24, (float *)&v23 + 1, (float *)&v23, a7 - (float)(v21 * v22.__cosval), a8 - (float)(v21 * v22.__sinval), (float)(v21 * v22.__cosval) + a7, (float)(v21 * v22.__sinval) + a8, 1.0, (float)(a2 - 2), 1.0, (float)(a3 - 2));
    if ((_DWORD)result)
      return sub_1D3E51288(a1, a2, a3, a4, a5, a6, *((float *)&v24 + 1), *(float *)&v24, *((float *)&v23 + 1), *(float *)&v23, a11);
  }
  return result;
}

float *sub_1D3E5194C(float *result, int a2)
{
  uint64_t v2;
  float v3;
  float v4;
  float *v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;

  if (a2 >= 1)
  {
    v2 = a2;
    v3 = INFINITY;
    v4 = -INFINITY;
    v5 = result;
    v6 = a2;
    do
    {
      v7 = *v5++;
      v8 = v7;
      if (v7 < v3)
        v3 = v8;
      if (v8 > v4)
        v4 = v8;
      --v6;
    }
    while (v6);
    v9 = v4 - v3;
    if (v9 == 0.0)
    {
      do
      {
        *result++ = 0.5;
        --v2;
      }
      while (v2);
    }
    else
    {
      do
      {
        *result = (float)((float)(*result - v3) / v9) + 0.0;
        ++result;
        --v2;
      }
      while (v2);
    }
  }
  return result;
}

float sub_1D3E519E0(uint64_t a1, float *a2, unsigned int a3)
{
  double v3;
  double v4;
  uint64_t i;
  float v6;
  float v7;
  uint64_t v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;

  v3 = *a2;
  v4 = 0.0;
  if (a3 >= 2)
  {
    for (i = 1; i != a3; v4 = v4 + (float)(v6 * (float)i++))
    {
      v6 = a2[i];
      v3 = v3 + v6;
    }
  }
  v7 = 1.0 / (float)a3;
  if (a3)
  {
    v8 = 0;
    v9 = (float)(a3 - 1) * 0.5;
    v10 = (float)((float)(v7 * 0.16667) * (float)((a3 - 1) * a3 * (2 * a3 - 1))) - (float)(v9 * v9);
    v11 = v3 * v7;
    v12 = v9;
    v13 = (v7 * v4 - v11 * v12) / v10;
    v14 = v11 - v13 * v12;
    v15 = 0.0;
    v16 = 0.0;
    do
    {
      v17 = v14 + v13 * (double)v8;
      v18 = a2[v8] - v17;
      *(float *)(a1 + 4 * v8) = v18;
      v16 = v16 + v18;
      v15 = v15 + (float)(v18 * v18);
      ++v8;
    }
    while (a3 != v8);
  }
  else
  {
    v16 = 0.0;
    v15 = 0.0;
  }
  return (float)(v7 * v15) - (float)(v16 * v16);
}

_DWORD *sub_1D3E51ADC(float *a1, signed int a2, int a3, int *a4, void **a5, _QWORD *a6)
{
  size_t v12;
  _DWORD *v13;
  float *v14;
  double v15;
  double v16;
  float v17;
  unsigned int v18;
  unint64_t v19;
  double v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  float v28;
  float v29;
  float v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  char *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  double v45;
  double v46;
  int v47;
  _BOOL4 v48;
  int v49;
  size_t v50;
  _DWORD *result;
  uint64_t v52;
  _DWORD *v53;
  _OWORD v54[2];
  uint64_t v55;
  _OWORD v56[2];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v12 = 4 * a2;
  v13 = malloc_type_malloc(v12, 0x100004052888210uLL);
  v14 = (float *)malloc_type_malloc(v12, 0x100004052888210uLL);
  v15 = *a1;
  v16 = v15 * v15;
  *v13 = *(_DWORD *)a1;
  v17 = v15 * v15;
  *v14 = v17;
  if (a2 >= 2)
  {
    v18 = 2;
    v19 = 1;
    do
    {
      v20 = a1[v19];
      v15 = v15 + v20;
      v16 = v16 + v20 * v20;
      *(float *)&v20 = v15;
      v13[v19] = LODWORD(v20);
      *(float *)&v20 = v16;
      v14[v19] = *(float *)&v20;
      v19 = v18++;
    }
    while (v19 < a2);
  }
  v57 = 0;
  memset(v56, 0, sizeof(v56));
  v55 = 0;
  memset(v54, 0, sizeof(v54));
  v21 = a2 - 2 * a3;
  v22 = -1;
  if (((2 * a3) | 1) >= v21)
  {
    LOBYTE(v24) = 0;
  }
  else
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = v21 - 1;
    v28 = *(float *)&v13[2 * a3];
    v29 = v14[2 * a3];
    v30 = 1.0 / (float)((float)(2 * a3) + 1.0);
    v31 = ~(4 * a3) + a2;
    v32 = ~(uint64_t)(2 * a3) + v27;
    v33 = 8 * a3 + 4;
    v34 = (char *)v14 + v33;
    v35 = (16 * a3) | 4;
    v36 = (char *)v14 + v35;
    v37 = (char *)v13 + v35;
    v38 = 2 * a3 + 1;
    v39 = (char *)v13 + v33;
    do
    {
      v40 = *(float *)&v37[4 * v23] - v28;
      v28 = *(float *)&v39[4 * v23];
      v41 = v30 * (float)(v28 - *(float *)&v13[(int)v23]);
      v42 = v30 * v40;
      v43 = *(float *)&v36[4 * v23] - v29;
      v29 = *(float *)&v34[4 * v23];
      v44 = (float)(v30 * v43) - (float)(v42 * v42);
      v45 = (float)((float)(v30 * (float)(v29 - v14[(int)v23])) - (float)(v41 * v41));
      v46 = v44;
      if (v46 * 50.0 >= v45 || v41 * 1.2 >= v42)
        v24 &= v25 ^ 1;
      v47 = v38 + v23;
      if (v45 * 50.0 >= v46 || v42 * 1.2 >= v41)
      {
        v48 = v26;
        v26 = 0;
      }
      else
      {
        if ((v26 & 1) == 0)
        {
          v22 += (v24 & 1) == 0;
          if (v22 <= 9)
            *((_DWORD *)v56 + v22) = v47;
        }
        v48 = v32 == v23;
        v26 = 1;
      }
      v24 |= v48;
      v25 = (v22 < 0) & v25;
      if (v46 * 50.0 < v45 && (v22 & 0x80000000) == 0)
      {
        if (v41 * 1.2 >= v42)
        {
          v25 = 0;
        }
        else
        {
          if (v22 <= 9 && (v24 & 1) != 0)
            *((_DWORD *)v54 + v22) = v47;
          v24 = (v32 != v23) & v24;
          v25 = 1;
        }
      }
      ++v23;
    }
    while (v31 != (_DWORD)v23);
  }
  v49 = v22 + ((v24 & 1) == 0);
  free(v14);
  free(v13);
  if (v49 >= 10)
    v50 = 10;
  else
    v50 = v49;
  *a4 = v50;
  if (v49 <= 0)
  {
    *a4 = 1;
    *a5 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
    result = malloc_type_calloc(*a4, 4uLL, 0x100004052888210uLL);
    *a6 = result;
    *(_DWORD *)*a5 = 0;
    *result = a2 - 1;
  }
  else
  {
    *a5 = malloc_type_calloc(v50, 4uLL, 0x100004052888210uLL);
    result = malloc_type_calloc(*a4, 4uLL, 0x100004052888210uLL);
    *a6 = result;
    if (*a4 >= 1)
    {
      v52 = 0;
      v53 = *a5;
      do
      {
        v53[v52] = *((_DWORD *)v56 + v52);
        result[v52] = *((_DWORD *)v54 + v52);
        ++v52;
      }
      while (v52 < *a4);
    }
  }
  return result;
}

float *sub_1D3E51ED4(float *a1, int a2, float *a3, float *a4)
{
  float *result;
  int v8;
  uint64_t v9;
  float *v10;
  float v11;
  float v12;
  uint64_t v13;
  float v14;
  float v15;

  *a3 = sub_1D3E519E0((uint64_t)a1, a1, a2);
  result = sub_1D3E5194C(a1, a2);
  v8 = 0;
  if (a2 <= 3)
    v9 = 3;
  else
    v9 = a2;
  v11 = *a1;
  v10 = a1 + 1;
  v12 = v11;
  v13 = v9 - 1;
  do
  {
    v14 = *v10++;
    v15 = v14;
    if (vabds_f32(v14, v12) > 0.2)
      ++v8;
    v12 = v15;
    --v13;
  }
  while (v13);
  *a4 = (float)v8 / (float)(v9 - 1);
  return result;
}

float *sub_1D3E51F70(float *result, int a2, int a3, int a4)
{
  int v4;
  float *v5;
  int v6;

  if (a4 <= a2 && (a3 & 0x80000000) == 0)
  {
    v4 = a4 - a3;
    if (a4 > a3)
    {
      v5 = &result[a3];
      v6 = v4 + 1;
      sub_1D3E519E0((uint64_t)v5, v5, v4 + 1);
      return sub_1D3E5194C(v5, v6);
    }
  }
  return result;
}

uint64_t AppC3DConfigCreate()
{
  return MEMORY[0x1E0CF8760]();
}

uint64_t AppC3DConfigRelease()
{
  return MEMORY[0x1E0CF8768]();
}

uint64_t AppC3DConfigSetANEFallbackDevice()
{
  return MEMORY[0x1E0CF8770]();
}

uint64_t AppC3DConfigSetTrackingConfig()
{
  return MEMORY[0x1E0CF8780]();
}

uint64_t AppC3DConfigSetTrackingMode()
{
  return MEMORY[0x1E0CF8788]();
}

uint64_t AppC3DCreate()
{
  return MEMORY[0x1E0CF8790]();
}

uint64_t AppC3DFlush()
{
  return MEMORY[0x1E0CF8798]();
}

uint64_t AppC3DProcessCameraFrameData()
{
  return MEMORY[0x1E0CF87A8]();
}

uint64_t AppC3DRelease()
{
  return MEMORY[0x1E0CF87B0]();
}

uint64_t AppC3DSetUpdateCallback()
{
  return MEMORY[0x1E0CF87C0]();
}

uint64_t AppC3DTrackingResultCreateCorners()
{
  return MEMORY[0x1E0CF87D0]();
}

uint64_t AppC3DTrackingResultCreateData()
{
  return MEMORY[0x1E0CF87D8]();
}

uint64_t AppC3DTrackingResultGetConfidence()
{
  return MEMORY[0x1E0CF87E0]();
}

uint64_t AppC3DTrackingResultGetDataVersion()
{
  return MEMORY[0x1E0CF87E8]();
}

uint64_t AppC3DTrackingResultGetMetadata()
{
  return MEMORY[0x1E0CF87F8]();
}

uint64_t AppC3DTrackingResultGetNumberOfTrackingData()
{
  return MEMORY[0x1E0CF8800]();
}

uint64_t AppC3DWait()
{
  return MEMORY[0x1E0CF8818]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1E0C98AF0](plist, format);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x1E0C98DD0](theSet, values);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F88](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1E0C99128](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x1E0C991F8](theString, replacement);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

CFDictionaryRef CVPixelBufferCopyCreationAttributes(CVPixelBufferRef pixelBuffer)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8A90](pixelBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AB8](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B40](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1E0CA8B48]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B68](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1E0CA8B78](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B88](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8C08](allocator, *(_QWORD *)&pixelFormat);
}

uint64_t FigCreateIOSurfacePropertiesDictionary()
{
  return MEMORY[0x1E0CEC8D8]();
}

uint64_t IOSurfaceCreateChildSurface()
{
  return MEMORY[0x1E0CBBAF8]();
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CBBB68](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBB88](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBBA0](buffer, planeIndex);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBC38](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBCF0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

uint64_t IOSurfaceLockPlane()
{
  return MEMORY[0x1E0CBBD30]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t IOSurfaceUnlockPlane()
{
  return MEMORY[0x1E0CBBE90]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1E0CEC9D8](pixelBuffer, options, imageOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1E0CECCD8](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
  MEMORY[0x1E0CECCE8](session);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECCF0](session, sourceBuffer, destinationBuffer);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x1E0CECCF8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x1E0CECD68](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x1E0C9A1D8]();
}

uint64_t _CFNonObjCEqual()
{
  return MEMORY[0x1E0C9A270]();
}

uint64_t _CFNonObjCHash()
{
  return MEMORY[0x1E0C9A278]();
}

uint64_t _CFNonObjCRelease()
{
  return MEMORY[0x1E0C9A280]();
}

uint64_t _CFNonObjCRetain()
{
  return MEMORY[0x1E0C9A288]();
}

uint64_t _CFRuntimeBridgeClasses()
{
  return MEMORY[0x1E0C9A490]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFTryRetain()
{
  return MEMORY[0x1E0C9A5A8]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x1E0C9A710]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x1E0DE41A0](retstr, this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4220](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::wstring *__cdecl std::to_wstring(std::wstring *__return_ptr retstr, int __val)
{
  return (std::wstring *)MEMORY[0x1E0DE43A0](retstr, *(_QWORD *)&__val);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::wstring *__cdecl std::wstring::append(std::wstring *this, std::wstring::size_type __n, std::wstring::value_type __c)
{
  return (std::wstring *)MEMORY[0x1E0DE44F0](this, __n, *(_QWORD *)&__c);
}

std::wstring *__cdecl std::wstring::insert(std::wstring *this, std::wstring::size_type __pos, const std::wstring::value_type *__s, std::wstring::size_type __n)
{
  return (std::wstring *)MEMORY[0x1E0DE4500](this, __pos, __s, __n);
}

void std::wstring::resize(std::wstring *this, std::wstring::size_type __n, std::wstring::value_type __c)
{
  MEMORY[0x1E0DE4508](this, __n, *(_QWORD *)&__c);
}

void std::wstring::push_back(std::wstring *this, std::wstring::value_type __c)
{
  MEMORY[0x1E0DE4520](this, *(_QWORD *)&__c);
}

std::wstring *__cdecl std::wstring::operator=(std::wstring *this, const std::wstring *__str)
{
  return (std::wstring *)MEMORY[0x1E0DE4528](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::wistream::get()
{
  return MEMORY[0x1E0DE4680]();
}

uint64_t std::wistream::~wistream()
{
  return MEMORY[0x1E0DE4688]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4710]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4730]();
}

{
  return MEMORY[0x1E0DE4738]();
}

uint64_t std::wostream::put()
{
  return MEMORY[0x1E0DE4740]();
}

uint64_t std::wostream::~wostream()
{
  return MEMORY[0x1E0DE4748]();
}

uint64_t std::wostream::operator<<()
{
  return MEMORY[0x1E0DE4768]();
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

uint64_t std::wstreambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47F0]();
}

uint64_t std::wstreambuf::~wstreambuf()
{
  return MEMORY[0x1E0DE47F8]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

BOOL std::__fs::filesystem::__create_directory(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x1E0DE49D8](a1, a2);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__temp_directory_path(std::__fs::filesystem::path *__return_ptr retstr, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x1E0DE4A08](retstr, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1E0DE4B48]();
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

uint64_t std::wios::~wios()
{
  return MEMORY[0x1E0DE4D30]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete[](void *__p, std::align_val_t a2)
{
  off_1E95AAC90(__p, a2);
}

uint64_t operator delete[]()
{
  return off_1E95AAC98();
}

void operator delete(void *__p)
{
  off_1E95AACA0(__p);
}

uint64_t operator delete()
{
  return off_1E95AACA8();
}

void *__cdecl operator new[](size_t __sz, std::align_val_t a2)
{
  return (void *)off_1E95AACB0(__sz, a2);
}

uint64_t operator new[]()
{
  return off_1E95AACB8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E95AACC0(__sz);
}

uint64_t operator new()
{
  return off_1E95AACC8();
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_pure_virtual(void)
{
  MEMORY[0x1E0DE50C8]();
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_barrier_async_and_wait_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C38](queue, context, work);
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C40](queue, context, work);
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C50](queue, context, work);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F50](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82FA0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t e5rt_compute_gpu_device_retain_from_mtl_device()
{
  return MEMORY[0x1E0D1F950]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

size_t iconv(iconv_t a1, char **a2, size_t *a3, char **a4, size_t *a5)
{
  return MEMORY[0x1E0DE5900](a1, a2, a3, a4, a5);
}

int iconv_close(iconv_t a1)
{
  return MEMORY[0x1E0DE5910](a1);
}

iconv_t iconv_open(const char *a1, const char *a2)
{
  return (iconv_t)MEMORY[0x1E0DE5920](a1, a2);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E78](start_size, *(_QWORD *)&flags);
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

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F28](zone, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F40](zone, ptr, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x1E0C83F70](zone, ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeakOrNil(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE8](location, val);
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

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1E0C849E8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

uint64_t sgesvd_NEWLAPACK()
{
  return MEMORY[0x1E0C8BDF8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C050](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x1E0C8C060](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x1E0C8C070](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x1E0C8C0A0](__setup);
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C130](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_vfixu8(const float *__A, vDSP_Stride __IA, unsigned __int8 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C580](__A, __IA, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_zvcmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA88](__A, __IA, __B, __IB, __C, __IC, __N);
}

vImage_Error vImageBufferFill_CbCr8(const vImage_Buffer *dest, const Pixel_88 color, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CBE8](dest, color, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC00](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CD70](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB16UtoPlanar16U(const vImage_Buffer *argbSrc, const vImage_Buffer *aDest, const vImage_Buffer *rDest, const vImage_Buffer *gDest, const vImage_Buffer *bDest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CE20](argbSrc, aDest, rDest, gDest, bDest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1E0C8CE40](src, destYp, destCbCr, info, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CEE8](matrix, pixelRange, outInfo, *(_QWORD *)&inARGBType, *(_QWORD *)&outYpCbCrType, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_BGRX8888ToPlanar8(const vImage_Buffer *src, const vImage_Buffer *blue, const vImage_Buffer *green, const vImage_Buffer *red, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CEF8](src, blue, green, red, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_BGRXFFFFToPlanarF(const vImage_Buffer *src, const vImage_Buffer *blue, const vImage_Buffer *green, const vImage_Buffer *red, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF00](src, blue, green, red, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF20](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF88](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF90](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D0F8](matrix, pixelRange, outInfo, *(_QWORD *)&inYpCbCrType, *(_QWORD *)&outARGBType, *(_QWORD *)&flags);
}

vImage_Error vImageCopyBuffer(const vImage_Buffer *src, const vImage_Buffer *dest, size_t pixelSize, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D1E0](src, dest, pixelSize, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D680](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D688](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_CbCr8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D710](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D728](src, dest, tempBuffer, *(_QWORD *)&flags);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

int wmemcmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x1E0C85CC0](a1, a2, a3);
}

