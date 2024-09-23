uint64_t sub_1B68FB668(uint64_t result, uint64_t a2, unsigned int a3, int *a4, int *a5, _WORD *a6, _WORD *a7, double a8, double a9, double a10, double a11, double a12)
{
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
  int32x2_t v22;
  int32x2_t v23;
  int v24;
  int v25;
  int v26;
  int32x2_t v27;
  int32x2_t v28;

  v12 = (unsigned __int8 *)(a2 + 16 * (int)a3);
  if (v12[31] == 3)
  {
    a3 = 0;
    v13 = 4112;
  }
  else
  {
    v13 = *((unsigned __int16 *)&unk_1B69360A0 + 40 * *(unsigned __int16 *)(a2 + 26) + a3 + 24);
  }
  v14 = v12[24];
  v15 = v12[25];
  v17 = *a4;
  v16 = a4[1];
  v18 = a4[2];
  LOWORD(a9) = a6[2];
  WORD2(a9) = a6[3];
  LOWORD(a8) = a6[6];
  WORD2(a8) = a6[7];
  LOWORD(a11) = *a6;
  WORD2(a11) = a6[1];
  LOWORD(a10) = a6[4];
  WORD2(a10) = a6[5];
  LOWORD(a12) = a6[8];
  WORD2(a12) = a6[9];
  v19 = *a5;
  v20 = a5[4];
  if (v13 == 4104)
  {
    if (!a3 && v19 == v14)
      goto LABEL_22;
    if (a3 == 1 && v20 == v14)
      goto LABEL_27;
    v21 = a5[2];
LABEL_15:
    if (v17 && !v16 && !v18)
    {
      v21 = *a5;
      v20 = *a5;
      a10 = a11;
      a12 = a11;
    }
    if (v19 == v14)
    {
      if (v21 != v14 && v20 != v14)
      {
LABEL_22:
        a10 = a11;
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    if (v21 == v14)
    {
      if (v20 != v14)
        goto LABEL_29;
      goto LABEL_28;
    }
    if (v20 != v14)
    {
LABEL_28:
      v22 = vshr_n_s32(vshl_n_s32(*(int32x2_t *)&a10, 0x10uLL), 0x10uLL);
      v23 = vshr_n_s32(vshl_n_s32(*(int32x2_t *)&a11, 0x10uLL), 0x10uLL);
      a10 = COERCE_DOUBLE(vmin_s32(vmax_s32(vmin_s32(v23, v22), vshr_n_s32(vshl_n_s32(*(int32x2_t *)&a12, 0x10uLL), 0x10uLL)), vmax_s32(v23, v22)));
      goto LABEL_29;
    }
LABEL_27:
    a10 = a12;
    goto LABEL_29;
  }
  v21 = a5[2];
  if (v13 != 2064)
    goto LABEL_15;
  if (a3 || v21 != v14)
  {
    if (a3 == 1 && v19 == v14)
      goto LABEL_22;
    goto LABEL_15;
  }
LABEL_29:
  *a7 = LOWORD(a10);
  a7[1] = WORD2(a10);
  if (result == 5 || result == 3)
  {
    LOWORD(a10) = a6[10];
    WORD2(a10) = a6[11];
    v24 = a5[1];
    v25 = a5[5];
    if (v13 == 4104)
    {
      if (!a3 && v24 == v15)
        goto LABEL_49;
      if (a3 == 1 && v25 == v15)
        goto LABEL_54;
      v26 = a5[3];
    }
    else
    {
      v26 = a5[3];
      if (v13 == 2064)
      {
        if (!a3 && v26 == v15)
          goto LABEL_56;
        if (a3 == 1 && v24 == v15)
          goto LABEL_49;
      }
    }
    if (v17 && !v16 && !v18)
    {
      v26 = a5[1];
      v25 = v26;
      a8 = a9;
      a10 = a9;
    }
    if (v24 == v15)
    {
      if (v26 != v15 && v25 != v15)
      {
LABEL_49:
        a8 = a9;
LABEL_56:
        a7[2] = LOWORD(a8);
        a7[3] = WORD2(a8);
        return result;
      }
      goto LABEL_55;
    }
    if (v26 == v15)
    {
      if (v25 != v15)
        goto LABEL_56;
      goto LABEL_55;
    }
    if (v25 != v15)
    {
LABEL_55:
      v27 = vshr_n_s32(vshl_n_s32(*(int32x2_t *)&a8, 0x10uLL), 0x10uLL);
      v28 = vshr_n_s32(vshl_n_s32(*(int32x2_t *)&a9, 0x10uLL), 0x10uLL);
      a8 = COERCE_DOUBLE(vmin_s32(vmax_s32(vmin_s32(v28, v27), vshr_n_s32(vshl_n_s32(*(int32x2_t *)&a10, 0x10uLL), 0x10uLL)), vmax_s32(v28, v27)));
      goto LABEL_56;
    }
LABEL_54:
    a8 = a10;
    goto LABEL_56;
  }
  return result;
}

uint64_t sub_1B68FB914(uint64_t result, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8)
{
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  *(_QWORD *)a6 = 0;
  *(_QWORD *)a7 = 0x2000000020;
  *a8 = 0;
  if ((_DWORD)result)
  {
    v8 = (char *)&unk_1B69360A0 + 80 * *(unsigned __int16 *)(a4 + 10);
    v9 = v8[a3];
    if (v9 >= v8[a2])
      return result;
    v10 = a4 + 16 * v9;
  }
  else
  {
    if (!a5)
      return result;
    v10 = a5 + 16 * *((unsigned __int8 *)&unk_1B69360A0 + 80 * *(unsigned __int16 *)(a5 + 10) + a3);
  }
  v11 = *(unsigned __int8 *)(v10 + 8);
  *(_DWORD *)a7 = v11;
  v12 = *(unsigned __int8 *)(v10 + 9);
  *(_DWORD *)(a7 + 4) = v12;
  if (v11 != 32)
  {
    *(_DWORD *)a6 = *(_DWORD *)v10;
    v12 = *(unsigned __int8 *)(a7 + 4);
  }
  if (v12 != 32)
    *(_DWORD *)(a6 + 4) = *(_DWORD *)(v10 + 4);
  *a8 = 1;
  return result;
}

float sub_1B68FB9B4(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  char v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  unsigned __int8 *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unsigned __int8 *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _BOOL4 v33;
  char v34;
  int16x4_t *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  __int16 v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  __int16 v48;
  unsigned __int8 v49;
  __int16 *v50;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  int v54;
  int v55;
  BOOL v56;
  int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  int v65;
  BOOL v66;
  __int16 v67;
  __int16 v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  unsigned int v75;
  unsigned int v76;
  _BYTE *v77;
  char v79;
  char v81;
  _BOOL4 v82;
  char v83;
  char v84;
  uint64_t v85;
  int v86;
  int32x2_t v87[2];
  int32x2_t v88;
  int v89[3];
  _WORD v90[12];
  double v91;
  int v92;
  int16x4_t v93;
  int16x4_t v94[4];

  v94[2] = *(int16x4_t *)MEMORY[0x1E0C80C00];
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(unsigned __int8 *)(v9 + 272);
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 272) + 10) = *(_WORD *)(v9 + 26);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(unsigned __int8 *)(a1 + 31);
  v13 = *(unsigned __int8 *)(v9 + 272);
  v14 = *(unsigned __int8 *)(v11 + 1);
  v15 = v14 == 4 || v14 == 2;
  if (!v15)
    goto LABEL_18;
  if (v12 == 2 || *(_BYTE *)(v9 + 2))
  {
    if (v14 != 2)
      goto LABEL_18;
    if (*(_BYTE *)(v11 + 2) != 4 || (_DWORD)v13 == 0)
      goto LABEL_39;
LABEL_15:
    v17 = (_BYTE *)(v9 + 24);
    v18 = *(unsigned __int8 *)(v9 + 272);
    do
    {
      *v17 = 0;
      v17 += 16;
      --v18;
    }
    while (v18);
    v14 = *(unsigned __int8 *)(v11 + 1);
    goto LABEL_18;
  }
  if (*(_BYTE *)(v9 + 272))
    goto LABEL_15;
LABEL_18:
  if (v14 == 5 || v14 == 3)
  {
    if (v12 != 2 && !*(_BYTE *)(v9 + 3) && (_DWORD)v13 != 0)
    {
      v21 = (_BYTE *)(v9 + 25);
      v22 = v13;
      do
      {
        if (v21[6] - 5 <= 1)
          *v21 = 0;
        v21 += 16;
        --v22;
      }
      while (v22);
    }
    if (v12 != 2 && !*(_BYTE *)(v9 + 2) && (_DWORD)v13)
    {
      v23 = (_BYTE *)(v9 + 24);
      do
      {
        if ((v23[7] & 0xFD) == 4)
          *v23 = 0;
        v23 += 16;
        --v13;
      }
      while (v13);
    }
  }
LABEL_39:
  v24 = *(unsigned __int8 **)(a1 + 48);
  v25 = v24[272];
  v26 = v24[5];
  v92 = 0;
  if (!v25)
  {
    if (!(_DWORD)v10)
      return *(float *)&a2;
    goto LABEL_52;
  }
  v27 = 0;
  v28 = v24 + 31;
  while (1)
  {
    v29 = *v28;
    v28 += 16;
    if (v29 == 3)
      break;
    if (v25 == ++v27)
      goto LABEL_51;
  }
  if (v26 != 1)
  {
    v6 = 0;
    v7 = 0;
    v91 = 0.0;
LABEL_51:
    if (!(_DWORD)v10)
      return *(float *)&a2;
LABEL_52:
    v30 = 0;
    v31 = v9 + 16;
    if (v6 == 32)
      v32 = 4;
    else
      v32 = 6;
    v33 = v6 != 32 || v7 != 32;
    v86 = v92;
    if (v7 == 32)
      v34 = 5;
    else
      v34 = v32;
    v85 = v10;
    v83 = v7;
    v84 = v6;
    v81 = v34;
    v82 = v33;
    while (1)
    {
      v35 = (int16x4_t *)(v31 + 16 * v30);
      if (v35[1].i8[7] == 3)
        break;
      sub_1B68FB254((_QWORD *)a1, v30, v94);
LABEL_149:
      v93 = vadd_s16(*v35, v94[0]);
      sub_1B689CBF8(a1, &v93, v35[1].u8[7], v35[1].u8[0], v35[1].u8[1], v30++);
      if (v30 == v10)
        return *(float *)&a2;
    }
    v36 = *(_QWORD *)(a1 + 48);
    v37 = *((unsigned __int8 *)&unk_1B69360A0 + 80 * *(unsigned __int16 *)(v36 + 26) + v30 + 32);
    if (*(_BYTE *)v36)
      v37 = byte_1B693608C[v37];
    v38 = *(unsigned __int8 *)(v36 + 5);
    *(_QWORD *)(a1 + 2640) = *(_QWORD *)(*(_QWORD *)(**(_QWORD **)(a1 + 232) + 1256) + 8
                                                                                       * *(unsigned int *)(a1 + 16));
    v39 = (_BYTE *)(v36 + 16 + 16 * (int)v30);
    v39[8] = v7;
    v39[9] = v6;
    v40 = *(_QWORD *)(a1 + 48);
    v41 = v40 + 16;
    if (v38 == 1)
    {
      v42 = *(_QWORD *)(a1 + 2640)
          + 16
          * *((unsigned __int8 *)&unk_1B69360A0 + 80 * *(unsigned __int16 *)(*(_QWORD *)(a1 + 2640) + 10) + v37);
      v43 = *(unsigned __int8 *)(v42 + 8);
      if (v43 == 32)
      {
        v43 = *(unsigned __int8 *)(v42 + 9);
        if (v43 == 32)
        {
          v44 = 0;
          v45 = 0;
          goto LABEL_82;
        }
        v50 = (__int16 *)(v42 + 6);
        v42 += 4;
      }
      else
      {
        v50 = (__int16 *)(v42 + 2);
      }
      v45 = *(_WORD *)v42;
      v44 = *v50;
LABEL_82:
      v53 = v41 + 16 * (int)v30;
      v54 = *(unsigned __int8 *)(v53 + 8);
      v55 = *(unsigned __int8 *)(v53 + 9);
      sub_1B68FB668(*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1), v40, v30, v89, (int *)v87, v90, v94, a2, a3, a4, a5, a6);
      if (*(unsigned __int8 *)(**(_QWORD **)(a1 + 232) + 1356) | v43)
        v56 = 1;
      else
        v56 = v45 <= -2;
      v60 = !v56 && v45 < 2 && v44 > -2 && v44 < 2;
      if (v86 == 1)
      {
        v94[0].i32[0] = 0;
        v10 = v85;
        v7 = v83;
        v6 = v84;
        v34 = v81;
        v33 = v82;
      }
      else
      {
        if (v54)
          v61 = 0;
        else
          v61 = v60;
        v15 = v54 == 32;
        v7 = v83;
        v6 = v84;
        v34 = v81;
        v33 = v82;
        if (v15 || v61)
          v94[0].i32[0] = 0;
        if (v55)
          v60 = 0;
        v15 = v55 == 32;
        v10 = v85;
        if (!v15 && !v60)
          goto LABEL_147;
      }
      v94[0].i32[1] = 0;
LABEL_147:
      if (!v33)
        return *(float *)&a2;
      v39[15] = v34;
      goto LABEL_149;
    }
    v46 = *(_QWORD *)(a1 + 2640)
        + 16 * *((unsigned __int8 *)&unk_1B69360A0 + 80 * *(unsigned __int16 *)(*(_QWORD *)(a1 + 2640) + 10) + v37);
    if (*(_BYTE *)(v46 + 8) == 32)
    {
      if (*(_BYTE *)(v46 + 9) == 32)
      {
        v47 = 0;
        v48 = 0;
        v49 = 0;
LABEL_118:
        *(_BYTE *)(a1 + 187) = 0;
        v63 = *(_QWORD *)(*(_QWORD *)(a1 + 224) + 8 * v49);
        v64 = *(_DWORD *)(**(_QWORD **)(a1 + 232) + 1288);
        v65 = *(_DWORD *)(v63 + 1288);
        if (*(_BYTE *)(v63 + 1356))
          v66 = 1;
        else
          v66 = v64 == v65;
        if (v66)
        {
          v67 = 0;
          v68 = 0;
        }
        else
        {
          v69 = v64 - v65;
          v70 = *(_DWORD *)(*(_QWORD *)(a1 + 216) + 1288) - v65;
          if (v70 >= 127)
            v70 = 127;
          if (v70 <= -128)
            v70 = -128;
          if (v69 >= 127)
            v69 = 127;
          if (v69 <= -128)
            v69 = -128;
          v71 = (v69 + ((v69 & 0x80) >> 7)) << 24 >> 25;
          if (v69 <= -2)
            v71 = -v71;
          v72 = v70 * (__int16)((__int16)(v71 + 0x4000) / v69);
          v73 = (v72 + 32) >> 6;
          if (v72 > 65503)
            v73 = 1023;
          if (v72 >= -65568)
            v74 = v73;
          else
            v74 = -1024;
          v75 = (v74 * v48 + 128) >> 8;
          v76 = (v74 * v47 + 128) >> 8;
          v67 = v75 - v48;
          v68 = v76 - v47;
          v48 = v75;
          v47 = v76;
        }
        v94[0].i16[0] = v48;
        v94[0].i16[1] = v47;
        v94[0].i16[2] = v67;
        v94[0].i16[3] = v68;
        v77 = (_BYTE *)(v41 + 16 * (int)v30);
        v77[8] = v49;
        v77[9] = 0;
        v79 = v49 != 32 && *(_BYTE *)(a1 + 31) == 2;
        v77[12] = *(_BYTE *)(*(_QWORD *)(a1 + 256) + (v49 >> v79));
        v77[13] = *(_BYTE *)(*(_QWORD *)(a1 + 256) + 33);
        goto LABEL_147;
      }
      v48 = *(_WORD *)(v46 + 4);
      v47 = *(_WORD *)(v46 + 6);
      v51 = *(unsigned __int8 *)(v46 + 13);
      if (v51 < 0x29)
      {
LABEL_112:
        v49 = *(_BYTE *)(*(_QWORD *)(a1 + 264) + v51);
        goto LABEL_118;
      }
      v62 = *(_DWORD *)(a1 + 240);
      if (v62)
      {
        v49 = 0;
        while (*(unsigned __int8 *)(*(_QWORD *)(a1 + 256) + v49) != v51)
        {
          if (v62 <= ++v49)
            goto LABEL_117;
        }
        goto LABEL_118;
      }
    }
    else
    {
      v48 = *(_WORD *)v46;
      v47 = *(_WORD *)(v46 + 2);
      v51 = *(unsigned __int8 *)(v46 + 12);
      if (v51 < 0x29)
        goto LABEL_112;
      v52 = *(_DWORD *)(a1 + 240);
      if (v52)
      {
        v49 = 0;
        while (*(unsigned __int8 *)(*(_QWORD *)(a1 + 256) + v49) != v51)
        {
          if (v52 <= ++v49)
            goto LABEL_117;
        }
        goto LABEL_118;
      }
    }
LABEL_117:
    v49 = 32;
    goto LABEL_118;
  }
  sub_1B68FB2FC((_QWORD *)a1, v27, v89, v87, v90, 0);
  a5 = 0.0;
  a2 = COERCE_DOUBLE(vadd_s32(vmin_s32(vsub_s32(vadd_s32(vmin_s32(vsub_s32(v87[1], v88), 0), v88), v87[0]), 0), v87[0]));
  v91 = a2;
  *(_QWORD *)&a4 = 0x2000000020;
  a3 = COERCE_DOUBLE(vceq_s32((int32x2_t)vand_s8(*(int8x8_t *)&a2, (int8x8_t)0xFF000000FFLL), (int32x2_t)0x2000000020));
  if ((LODWORD(a3) & HIDWORD(a3) & 1) != 0)
  {
    v6 = 0;
    v7 = 0;
    v91 = 0.0;
    v92 = 1;
    if (!(_DWORD)v10)
      return *(float *)&a2;
    goto LABEL_52;
  }
  v7 = LOBYTE(a2);
  v6 = BYTE4(a2);
  if ((_DWORD)v10)
    goto LABEL_52;
  return *(float *)&a2;
}

uint64_t sub_1B68FC078(uint64_t result, int a2, uint64_t a3, int a4)
{
  int i;
  uint64_t j;

  for (i = 0; i != 4; ++i)
  {
    for (j = 0; j != 4; ++j)
      *(_BYTE *)(result + j) = *(_BYTE *)(a3 + j);
    result += a2;
    a3 += a4;
  }
  return result;
}

uint64_t sub_1B68FC0B4(uint64_t result, int a2, uint64_t a3, int a4)
{
  int i;
  uint64_t j;

  for (i = 0; i != 8; ++i)
  {
    for (j = 0; j != 4; ++j)
      *(_BYTE *)(result + j) = *(_BYTE *)(a3 + j);
    result += a2;
    a3 += a4;
  }
  return result;
}

uint64_t sub_1B68FC0F0(uint64_t result, int a2, uint64_t a3, int a4)
{
  int i;
  uint64_t j;

  for (i = 0; i != 4; ++i)
  {
    for (j = 0; j != 8; ++j)
      *(_BYTE *)(result + j) = *(_BYTE *)(a3 + j);
    result += a2;
    a3 += a4;
  }
  return result;
}

uint64_t sub_1B68FC12C(uint64_t result, int a2, uint64_t a3, int a4)
{
  int i;
  uint64_t j;

  for (i = 0; i != 8; ++i)
  {
    for (j = 0; j != 8; ++j)
      *(_BYTE *)(result + j) = *(_BYTE *)(a3 + j);
    result += a2;
    a3 += a4;
  }
  return result;
}

uint64_t sub_1B68FC168(uint64_t result, int a2, uint64_t a3, int a4)
{
  int i;
  uint64_t j;

  for (i = 0; i != 16; ++i)
  {
    for (j = 0; j != 8; ++j)
      *(_BYTE *)(result + j) = *(_BYTE *)(a3 + j);
    result += a2;
    a3 += a4;
  }
  return result;
}

uint64_t sub_1B68FC1A4(uint64_t result, int a2, uint64_t a3, int a4)
{
  int i;
  uint64_t j;

  for (i = 0; i != 8; ++i)
  {
    for (j = 0; j != 16; ++j)
      *(_BYTE *)(result + j) = *(_BYTE *)(a3 + j);
    result += a2;
    a3 += a4;
  }
  return result;
}

uint64_t sub_1B68FC1E0(uint64_t result, int a2, uint64_t a3, int a4)
{
  int i;
  uint64_t j;

  for (i = 0; i != 16; ++i)
  {
    for (j = 0; j != 16; ++j)
      *(_BYTE *)(result + j) = *(_BYTE *)(a3 + j);
    result += a2;
    a3 += a4;
  }
  return result;
}

uint64_t sub_1B68FC21C(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int i;
  uint64_t j;

  for (i = 0; i != 4; ++i)
  {
    for (j = 0; j != 4; ++j)
      *(_BYTE *)(result + j) = (*(unsigned __int8 *)(a3 + j) + *(unsigned __int8 *)(a5 + j) + 1) >> 1;
    result += a2;
    a3 += a4;
    a5 += a4;
  }
  return result;
}

uint64_t sub_1B68FC26C(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int i;
  uint64_t j;

  for (i = 0; i != 8; ++i)
  {
    for (j = 0; j != 4; ++j)
      *(_BYTE *)(result + j) = (*(unsigned __int8 *)(a3 + j) + *(unsigned __int8 *)(a5 + j) + 1) >> 1;
    result += a2;
    a3 += a4;
    a5 += a4;
  }
  return result;
}

uint64_t sub_1B68FC2BC(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int i;
  uint64_t j;

  for (i = 0; i != 4; ++i)
  {
    for (j = 0; j != 8; ++j)
      *(_BYTE *)(result + j) = (*(unsigned __int8 *)(a3 + j) + *(unsigned __int8 *)(a5 + j) + 1) >> 1;
    result += a2;
    a3 += a4;
    a5 += a4;
  }
  return result;
}

uint64_t sub_1B68FC30C(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int i;
  uint64_t j;

  for (i = 0; i != 8; ++i)
  {
    for (j = 0; j != 8; ++j)
      *(_BYTE *)(result + j) = (*(unsigned __int8 *)(a3 + j) + *(unsigned __int8 *)(a5 + j) + 1) >> 1;
    result += a2;
    a3 += a4;
    a5 += a4;
  }
  return result;
}

uint64_t sub_1B68FC35C(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int i;
  uint64_t j;

  for (i = 0; i != 16; ++i)
  {
    for (j = 0; j != 8; ++j)
      *(_BYTE *)(result + j) = (*(unsigned __int8 *)(a3 + j) + *(unsigned __int8 *)(a5 + j) + 1) >> 1;
    result += a2;
    a3 += a4;
    a5 += a4;
  }
  return result;
}

uint64_t sub_1B68FC3AC(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int i;
  uint64_t j;

  for (i = 0; i != 8; ++i)
  {
    for (j = 0; j != 16; ++j)
      *(_BYTE *)(result + j) = (*(unsigned __int8 *)(a3 + j) + *(unsigned __int8 *)(a5 + j) + 1) >> 1;
    result += a2;
    a3 += a4;
    a5 += a4;
  }
  return result;
}

uint64_t sub_1B68FC3FC(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int i;
  uint64_t j;

  for (i = 0; i != 16; ++i)
  {
    for (j = 0; j != 16; ++j)
      *(_BYTE *)(result + j) = (*(unsigned __int8 *)(a3 + j) + *(unsigned __int8 *)(a5 + j) + 1) >> 1;
    result += a2;
    a3 += a4;
    a5 += a4;
  }
  return result;
}

__int32 *sub_1B68FC44C(__int32 *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5, double a6, double a7, double a8, double a9, double a10, double a11, uint8x8_t a12)
{
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int v15;
  int32x4_t v16;
  int32x4_t v17;
  int16x8_t v18;

  v12 = vdupq_n_s32(a3);
  v13 = vdupq_n_s32(1 << (a5 - 1));
  v14 = vdupq_n_s32(a4);
  v15 = 4;
  v16 = vnegq_s32(vdupq_n_s32(a5));
  v17.i64[0] = 0xFF000000FFLL;
  v17.i64[1] = 0xFF000000FFLL;
  do
  {
    a12.i32[0] = *result;
    v18 = (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v13, v12, (int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a12))), v16), v14), v17), (int32x4_t)0);
    *(int16x4_t *)v18.i8 = vmovn_s32((int32x4_t)v18);
    a12 = (uint8x8_t)vmovn_s16(v18);
    *result = a12.i32[0];
    result = (__int32 *)((char *)result + a2);
    --v15;
  }
  while (v15);
  return result;
}

__int32 *sub_1B68FC4BC(__int32 *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5, double a6, double a7, double a8, double a9, double a10, double a11, uint8x8_t a12)
{
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int v15;
  int32x4_t v16;
  int32x4_t v17;
  int16x8_t v18;

  v12 = vdupq_n_s32(a3);
  v13 = vdupq_n_s32(1 << (a5 - 1));
  v14 = vdupq_n_s32(a4);
  v15 = 8;
  v16 = vnegq_s32(vdupq_n_s32(a5));
  v17.i64[0] = 0xFF000000FFLL;
  v17.i64[1] = 0xFF000000FFLL;
  do
  {
    a12.i32[0] = *result;
    v18 = (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v13, v12, (int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a12))), v16), v14), v17), (int32x4_t)0);
    *(int16x4_t *)v18.i8 = vmovn_s32((int32x4_t)v18);
    a12 = (uint8x8_t)vmovn_s16(v18);
    *result = a12.i32[0];
    result = (__int32 *)((char *)result + a2);
    --v15;
  }
  while (v15);
  return result;
}

uint8x8_t *sub_1B68FC52C(uint8x8_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int v8;
  int32x4_t v9;
  int32x4_t v10;
  uint16x8_t v11;

  v5 = vdupq_n_s32(a3);
  v6 = vdupq_n_s32(1 << (a5 - 1));
  v7 = vdupq_n_s32(a4);
  v8 = 4;
  v9 = vnegq_s32(vdupq_n_s32(a5));
  v10.i64[0] = 0xFF000000FFLL;
  v10.i64[1] = 0xFF000000FFLL;
  do
  {
    v11 = vmovl_u8(*result);
    *result = (uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_u16(*(uint16x4_t *)v11.i8)), v9), v7), v10), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_high_u16(v11)), v9), v7), v10), (int32x4_t)0)));
    result = (uint8x8_t *)((char *)result + a2);
    --v8;
  }
  while (v8);
  return result;
}

uint8x8_t *sub_1B68FC5B8(uint8x8_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int v8;
  int32x4_t v9;
  int32x4_t v10;
  uint16x8_t v11;

  v5 = vdupq_n_s32(a3);
  v6 = vdupq_n_s32(1 << (a5 - 1));
  v7 = vdupq_n_s32(a4);
  v8 = 8;
  v9 = vnegq_s32(vdupq_n_s32(a5));
  v10.i64[0] = 0xFF000000FFLL;
  v10.i64[1] = 0xFF000000FFLL;
  do
  {
    v11 = vmovl_u8(*result);
    *result = (uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_u16(*(uint16x4_t *)v11.i8)), v9), v7), v10), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_high_u16(v11)), v9), v7), v10), (int32x4_t)0)));
    result = (uint8x8_t *)((char *)result + a2);
    --v8;
  }
  while (v8);
  return result;
}

uint8x8_t *sub_1B68FC644(uint8x8_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int v8;
  int32x4_t v9;
  int32x4_t v10;
  uint16x8_t v11;

  v5 = vdupq_n_s32(a3);
  v6 = vdupq_n_s32(1 << (a5 - 1));
  v7 = vdupq_n_s32(a4);
  v8 = 16;
  v9 = vnegq_s32(vdupq_n_s32(a5));
  v10.i64[0] = 0xFF000000FFLL;
  v10.i64[1] = 0xFF000000FFLL;
  do
  {
    v11 = vmovl_u8(*result);
    *result = (uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_u16(*(uint16x4_t *)v11.i8)), v9), v7), v10), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_high_u16(v11)), v9), v7), v10), (int32x4_t)0)));
    result = (uint8x8_t *)((char *)result + a2);
    --v8;
  }
  while (v8);
  return result;
}

uint8x8_t *sub_1B68FC6D0(uint8x8_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int v8;
  int32x4_t v9;
  int32x4_t v10;
  uint16x8_t v11;
  uint16x8_t v12;

  v5 = vdupq_n_s32(a3);
  v6 = vdupq_n_s32(1 << (a5 - 1));
  v7 = vdupq_n_s32(a4);
  v8 = 8;
  v9 = vnegq_s32(vdupq_n_s32(a5));
  v10.i64[0] = 0xFF000000FFLL;
  v10.i64[1] = 0xFF000000FFLL;
  do
  {
    v11 = vmovl_u8(*result);
    v12 = vmovl_high_u8(*(uint8x16_t *)result->i8);
    *(int8x16_t *)result->i8 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_u16(*(uint16x4_t *)v11.i8)), v9), v7), v10), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_high_u16(v11)), v9),
                                                               v7),
                                                             v10),
                                                           (int32x4_t)0)),
                                 (int8x16_t)vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_u16(*(uint16x4_t *)v12.i8)), v9), v7), v10), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_high_u16(v12)), v9), v7),
                                                             v10),
                                                           (int32x4_t)0)));
    result = (uint8x8_t *)((char *)result + a2);
    --v8;
  }
  while (v8);
  return result;
}

uint8x8_t *sub_1B68FC79C(uint8x8_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int v8;
  int32x4_t v9;
  int32x4_t v10;
  uint16x8_t v11;
  uint16x8_t v12;

  v5 = vdupq_n_s32(a3);
  v6 = vdupq_n_s32(1 << (a5 - 1));
  v7 = vdupq_n_s32(a4);
  v8 = 16;
  v9 = vnegq_s32(vdupq_n_s32(a5));
  v10.i64[0] = 0xFF000000FFLL;
  v10.i64[1] = 0xFF000000FFLL;
  do
  {
    v11 = vmovl_u8(*result);
    v12 = vmovl_high_u8(*(uint8x16_t *)result->i8);
    *(int8x16_t *)result->i8 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_u16(*(uint16x4_t *)v11.i8)), v9), v7), v10), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_high_u16(v11)), v9),
                                                               v7),
                                                             v10),
                                                           (int32x4_t)0)),
                                 (int8x16_t)vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_u16(*(uint16x4_t *)v12.i8)), v9), v7), v10), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v6, v5, (int32x4_t)vmovl_high_u16(v12)), v9), v7),
                                                             v10),
                                                           (int32x4_t)0)));
    result = (uint8x8_t *)((char *)result + a2);
    --v8;
  }
  while (v8);
  return result;
}

uint64_t sub_1B68FC868(uint64_t result, int a2, int a3, int a4, int a5, int a6, char a7)
{
  char v7;
  int v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  int v13;
  uint64_t v14;
  int v15;

  v7 = 1;
  v8 = 1 << (a7 - 1);
  do
  {
    v9 = 0;
    v10 = v7;
    v11 = 1;
    do
    {
      v12 = v11;
      v13 = ((v8 + *(unsigned __int8 *)(result + v9) * a3) >> a7) + a5;
      if (v13 >= 255)
        v13 = 255;
      *(_BYTE *)(result + v9) = v13 & ~(v13 >> 31);
      v14 = v9 | 1;
      v15 = ((v8 + *(unsigned __int8 *)(result + v14) * a4) >> a7) + a6;
      if (v15 >= 255)
        v15 = 255;
      *(_BYTE *)(result + v14) = v15 & ~(v15 >> 31);
      v9 = 2;
      v11 = 0;
    }
    while ((v12 & 1) != 0);
    v7 = 0;
    result += a2;
  }
  while ((v10 & 1) != 0);
  return result;
}

uint64_t sub_1B68FC8EC(uint64_t result, int a2, int a3, int a4, int a5, int a6, char a7)
{
  int v7;
  int v8;
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  uint64_t v13;
  int v14;

  v7 = 0;
  v8 = 1 << (a7 - 1);
  do
  {
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = v10;
      v12 = ((v8 + *(unsigned __int8 *)(result + v9) * a3) >> a7) + a5;
      if (v12 >= 255)
        v12 = 255;
      *(_BYTE *)(result + v9) = v12 & ~(v12 >> 31);
      v13 = v9 | 1;
      v14 = ((v8 + *(unsigned __int8 *)(result + v13) * a4) >> a7) + a6;
      if (v14 >= 255)
        v14 = 255;
      *(_BYTE *)(result + v13) = v14 & ~(v14 >> 31);
      v9 = 2;
      v10 = 0;
    }
    while ((v11 & 1) != 0);
    result += a2;
    ++v7;
  }
  while (v7 != 4);
  return result;
}

uint16x4_t *sub_1B68FC974(uint16x4_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  char v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  char v15;

  v7 = 1;
  v8 = vdupq_n_s32(a3);
  v9 = vdupq_n_s32(1 << (a7 - 1));
  v10 = vdupq_n_s32(a5);
  v11 = vdupq_n_s32(a4);
  v12 = vdupq_n_s32(a6);
  v13.i64[0] = 0xFF000000FFLL;
  v13.i64[1] = 0xFF000000FFLL;
  v14 = vnegq_s32(vdupq_n_s32(a7));
  do
  {
    v15 = v7;
    *result = (uint16x4_t)vtrn1_s8((int8x8_t)vmovn_s32(vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v9, v8, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*result), (int8x16_t)v13)), v14), v10), v13), (int32x4_t)0)), (int8x8_t)vmovn_s32(vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(
                                                  v9,
                                                  v11,
                                                  (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vrev16_s8((int8x8_t)*result)), (int8x16_t)v13)), v14), v12), v13), (int32x4_t)0)));
    result = (uint16x4_t *)((char *)result + a2);
    v7 = 0;
  }
  while ((v15 & 1) != 0);
  return result;
}

uint16x4_t *sub_1B68FCA14(uint16x4_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int v12;
  int32x4_t v13;
  int32x4_t v14;

  v7 = vdupq_n_s32(a3);
  v8 = vdupq_n_s32(1 << (a7 - 1));
  v9 = vdupq_n_s32(a5);
  v10 = vdupq_n_s32(a4);
  v11 = vdupq_n_s32(a6);
  v12 = 4;
  v13.i64[0] = 0xFF000000FFLL;
  v13.i64[1] = 0xFF000000FFLL;
  v14 = vnegq_s32(vdupq_n_s32(a7));
  do
  {
    *result = (uint16x4_t)vtrn1_s8((int8x8_t)vmovn_s32(vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v7, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*result), (int8x16_t)v13)), v14), v9), v13), (int32x4_t)0)), (int8x8_t)vmovn_s32(vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(
                                                  v8,
                                                  v10,
                                                  (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vrev16_s8((int8x8_t)*result)), (int8x16_t)v13)), v14), v11), v13), (int32x4_t)0)));
    result = (uint16x4_t *)((char *)result + a2);
    --v12;
  }
  while (v12);
  return result;
}

uint16x4_t *sub_1B68FCAB4(uint16x4_t *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int v12;
  int32x4_t v13;
  int32x4_t v14;

  v7 = vdupq_n_s32(a3);
  v8 = vdupq_n_s32(1 << (a7 - 1));
  v9 = vdupq_n_s32(a5);
  v10 = vdupq_n_s32(a4);
  v11 = vdupq_n_s32(a6);
  v12 = 8;
  v13.i64[0] = 0xFF000000FFLL;
  v13.i64[1] = 0xFF000000FFLL;
  v14 = vnegq_s32(vdupq_n_s32(a7));
  do
  {
    *result = (uint16x4_t)vtrn1_s8((int8x8_t)vmovn_s32(vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v7, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*result), (int8x16_t)v13)), v14), v9), v13), (int32x4_t)0)), (int8x8_t)vmovn_s32(vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(
                                                  v8,
                                                  v10,
                                                  (int32x4_t)vandq_s8((int8x16_t)vmovl_u16((uint16x4_t)vrev16_s8((int8x8_t)*result)), (int8x16_t)v13)), v14), v11), v13), (int32x4_t)0)));
    result = (uint16x4_t *)((char *)result + a2);
    --v12;
  }
  while (v12);
  return result;
}

char *sub_1B68FCB54(char *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int v12;
  int32x4_t v13;
  int32x4_t v14;
  int8x8x2_t v15;
  int8x8_t v16;
  uint16x8_t v17;

  v7 = vdupq_n_s32(a3);
  v8 = vdupq_n_s32(1 << (a7 - 1));
  v9 = vdupq_n_s32(a5);
  v10 = vdupq_n_s32(a4);
  v11 = vdupq_n_s32(a6);
  v12 = 4;
  v13 = vnegq_s32(vdupq_n_s32(a7));
  v14.i64[0] = 0xFF000000FFLL;
  v14.i64[1] = 0xFF000000FFLL;
  do
  {
    v17 = (uint16x8_t)vld2_s8(result);
    v15 = (int8x8x2_t)vmovl_u8(*(uint8x8_t *)v17.i8);
    v15.val[0] = vmovn_s16(vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v7, (int32x4_t)vmovl_u16((uint16x4_t)v15.val[0])), v13), v9), v14), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v7, (int32x4_t)vmovl_high_u16((uint16x8_t)v15)), v13), v9), v14), (int32x4_t)0)));
    v17 = vmovl_u8((uint8x8_t)v17.u64[1]);
    v16 = vmovn_s16(vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v10, (int32x4_t)vmovl_u16(*(uint16x4_t *)v17.i8)), v13), v11), v14), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v10, (int32x4_t)vmovl_high_u16(v17)), v13), v11), v14), (int32x4_t)0)));
    vst2_s8(result, v15);
    result += a2;
    --v12;
  }
  while (v12);
  return result;
}

char *sub_1B68FCC28(char *result, int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int v12;
  int32x4_t v13;
  int32x4_t v14;
  int8x8x2_t v15;
  int8x8_t v16;
  uint16x8_t v17;

  v7 = vdupq_n_s32(a3);
  v8 = vdupq_n_s32(1 << (a7 - 1));
  v9 = vdupq_n_s32(a5);
  v10 = vdupq_n_s32(a4);
  v11 = vdupq_n_s32(a6);
  v12 = 8;
  v13 = vnegq_s32(vdupq_n_s32(a7));
  v14.i64[0] = 0xFF000000FFLL;
  v14.i64[1] = 0xFF000000FFLL;
  do
  {
    v17 = (uint16x8_t)vld2_s8(result);
    v15 = (int8x8x2_t)vmovl_u8(*(uint8x8_t *)v17.i8);
    v15.val[0] = vmovn_s16(vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v7, (int32x4_t)vmovl_u16((uint16x4_t)v15.val[0])), v13), v9), v14), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v7, (int32x4_t)vmovl_high_u16((uint16x8_t)v15)), v13), v9), v14), (int32x4_t)0)));
    v17 = vmovl_u8((uint8x8_t)v17.u64[1]);
    v16 = vmovn_s16(vuzp1q_s16((int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v10, (int32x4_t)vmovl_u16(*(uint16x4_t *)v17.i8)), v13), v11), v14), (int32x4_t)0), (int16x8_t)vmaxq_s32(vminq_s32(vaddq_s32(vshlq_s32(vmlaq_s32(v8, v10, (int32x4_t)vmovl_high_u16(v17)), v13), v11), v14), (int32x4_t)0)));
    vst2_s8(result, v15);
    result += a2;
    --v12;
  }
  while (v12);
  return result;
}

uint64_t sub_1B68FCCFC(uint64_t result, int a2, uint64_t a3, int a4, int a5, char a6, char a7)
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;

  if (a5 >= 1)
  {
    v7 = 0;
    v8 = 8 - (a6 & 7);
    v9 = (8 - (a7 & 7)) * v8;
    v10 = (8 - (a7 & 7)) * (a6 & 7);
    v11 = v8 * (a7 & 7);
    v12 = (a7 & 7) * (a6 & 7);
    do
    {
      v13 = 0;
      v14 = a3 + a4;
      v15 = 1;
      do
      {
        *(_BYTE *)(result + v13) = (v10 * *(unsigned __int8 *)(a3 + v13 + 2)
                                  + v9 * *(unsigned __int8 *)(a3 + v13)
                                  + v11 * *(unsigned __int8 *)(v14 + v13)
                                  + v12 * *(unsigned __int8 *)(v14 + v13 + 2)
                                  + 32) >> 6;
        v16 = v15;
        *(_BYTE *)(result + (v13 | 1)) = (v10 * *(unsigned __int8 *)(a3 + v13 + 3)
                                        + v9 * *(unsigned __int8 *)(a3 + (v13 | 1))
                                        + v11 * *(unsigned __int8 *)(v14 + (v13 | 1))
                                        + v12 * *(unsigned __int8 *)(v14 + v13 + 3)
                                        + 32) >> 6;
        v13 = 2;
        v15 = 0;
      }
      while ((v16 & 1) != 0);
      result += a2;
      ++v7;
      a3 += a4;
    }
    while (v7 != a5);
  }
  return result;
}

uint64_t sub_1B68FCDCC(uint64_t result, int a2, uint64_t a3, int a4, int a5, char a6, char a7)
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  _BYTE *v15;

  if (a5 >= 1)
  {
    v7 = 0;
    v8 = 8 - (a6 & 7);
    v9 = (8 - (a7 & 7)) * v8;
    v10 = (8 - (a7 & 7)) * (a6 & 7);
    v11 = v8 * (a7 & 7);
    v12 = a4 + a3 + 1;
    v13 = (a7 & 7) * (a6 & 7);
    do
    {
      for (i = 0; i != 8; i += 2)
      {
        v15 = (_BYTE *)(result + i);
        *v15 = (v10 * *(unsigned __int8 *)(a3 + i + 2)
              + v9 * *(unsigned __int8 *)(a3 + i)
              + v11 * *(unsigned __int8 *)(v12 + i - 1)
              + v13 * *(unsigned __int8 *)(v12 + i + 1)
              + 32) >> 6;
        v15[1] = (v10 * *(unsigned __int8 *)(a3 + i + 3)
                + v9 * *(unsigned __int8 *)(a3 + i + 1)
                + v11 * *(unsigned __int8 *)(v12 + i)
                + v13 * *(unsigned __int8 *)(v12 + i + 2)
                + 32) >> 6;
      }
      result += a2;
      ++v7;
      v12 += a4;
      a3 += a4;
    }
    while (v7 != a5);
  }
  return result;
}

uint64_t sub_1B68FCEA8(uint64_t result, int a2, uint64_t a3, int a4, int a5, char a6, char a7)
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  _BYTE *v15;

  if (a5 >= 1)
  {
    v7 = 0;
    v8 = 8 - (a6 & 7);
    v9 = (8 - (a7 & 7)) * v8;
    v10 = (8 - (a7 & 7)) * (a6 & 7);
    v11 = v8 * (a7 & 7);
    v12 = a4 + a3 + 1;
    v13 = (a7 & 7) * (a6 & 7);
    do
    {
      for (i = 0; i != 16; i += 2)
      {
        v15 = (_BYTE *)(result + i);
        *v15 = (v10 * *(unsigned __int8 *)(a3 + i + 2)
              + v9 * *(unsigned __int8 *)(a3 + i)
              + v11 * *(unsigned __int8 *)(v12 + i - 1)
              + v13 * *(unsigned __int8 *)(v12 + i + 1)
              + 32) >> 6;
        v15[1] = (v10 * *(unsigned __int8 *)(a3 + i + 3)
                + v9 * *(unsigned __int8 *)(a3 + i + 1)
                + v11 * *(unsigned __int8 *)(v12 + i)
                + v13 * *(unsigned __int8 *)(v12 + i + 2)
                + 32) >> 6;
      }
      result += a2;
      ++v7;
      v12 += a4;
      a3 += a4;
    }
    while (v7 != a5);
  }
  return result;
}

uint64_t sub_1B68FCF84(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(v4 + 272);
  if (*(_BYTE *)(v4 + 272))
  {
    v6 = v4 + 24;
    do
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 224 + 8 * (*(unsigned __int8 *)(v6 + 7) - 4))
                                 + 8 * *(unsigned __int8 *)(v6 + *(unsigned __int8 *)(v6 + 7) - 4))
                     + 488);
      if (*(_DWORD *)(v7 + 152))
        sub_1B68BBBC8(v7);
      v6 += 16;
      --v5;
    }
    while (v5);
  }
  return sub_1B68FD004(a1, a2, 0);
}

uint64_t sub_1B68FD004(uint64_t result, uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  void (*v29)(void);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void);
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned __int8 v51;
  unsigned int v52;
  uint64_t v53;

  v3 = *(_QWORD *)(result + 48);
  v4 = *(unsigned __int8 *)(v3 + 272);
  if (*(_BYTE *)(v3 + 272))
  {
    v5 = result;
    v6 = 0;
    v35 = *a2;
    v39 = a2[2];
    v48 = *((_DWORD *)a2 + 6);
    v49 = *((_DWORD *)a2 + 2);
    v7 = (char *)&unk_1B69360C0;
    v8 = (char *)&unk_1B69360D0;
    v9 = 16 * v4;
    v37 = *(_QWORD *)(*(_QWORD *)(result + 176) + 272);
    v50 = result;
    v38 = 16 * v4;
    v40 = *(_QWORD *)(result + 48);
    while (1)
    {
      v10 = *(unsigned __int8 *)(v3 + v6 + 31);
      if (v10 != 6)
        break;
LABEL_16:
      ++v7;
      v8 += 2;
      v6 += 16;
      if (v9 == v6)
        return result;
    }
    v11 = (v10 - 4);
    v12 = *(unsigned __int8 *)(v3 + v6 + v11 + 24);
    v13 = *(_QWORD *)(v5 + 112);
    v14 = *(unsigned int *)(v13 + 4);
    v15 = (1 << v14);
    v53 = v12;
    v47 = *(unsigned int *)(v13 + 8);
    if (*(_BYTE *)(v5 + 186))
    {
      v16 = v13 + 32 * v11 + v12;
      if (*(_BYTE *)(v16 + 12))
      {
        v17 = v13 + 384 * v11 + 12 * v12;
        v15 = *(unsigned int *)(v17 + 140);
        v42 = *(_DWORD *)(v17 + 908);
      }
      else
      {
        v42 = 0;
      }
      if (*(_BYTE *)(v16 + 76))
      {
        v18 = (_DWORD *)(v13 + 384 * v11 + 12 * v12);
        v46 = v18[37];
        v45 = v18[228];
        v43 = v18[36];
        v44 = v18[229];
        goto LABEL_12;
      }
    }
    else
    {
      v42 = 0;
    }
    v44 = 0;
    v45 = 0;
    v46 = 1 << *(_DWORD *)(v13 + 8);
    v43 = v46;
LABEL_12:
    v19 = 80 * *(unsigned __int16 *)(v3 + 26);
    v20 = *(_WORD *)&v8[v19];
    v21 = (unint64_t)*(unsigned __int16 *)&v8[v19] >> 8;
    v22 = v7[v19];
    v23 = byte_1B693C147[v22];
    v24 = byte_1B693C157[v22];
    v25 = v37 + 4 * v11;
    v26 = v20 >> 3;
    v51 = v21;
    v52 = v20 >> 3;
    if (!a3)
    {
      v36 = *(__int16 *)(v25 + v6);
      if (HIWORD(*(_DWORD *)(v25 + v6)) & 1 | (4 * (*(_BYTE *)(v25 + v6) & 3)) & 0x55)
      {
        v29 = *(void (**)(void))((char *)&off_1EF137AF8[3 * (v20 >> 3)] + (v21 & 0xF8));
        v30 = v14;
        v31 = v15;
        v29();
        v26 = v52;
        v32 = v31;
      }
      else
      {
        v33 = *(void (**)(void))((char *)&off_1EF137B60[3 * v26] + (v21 & 0xF8));
        v30 = v14;
        v34 = v15;
        v33();
        v26 = v52;
        v32 = v34;
      }
      if (*(_BYTE *)(*(_QWORD *)(v50 + 112) + 32 * v11 + v53 + 12) && *(_BYTE *)(v50 + 186))
      {
        (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))((char *)&off_1EF137C00[3 * v52]
                                                                                  + (v51 & 0xF8)))(v35 + v23 + v49 * v24, v49, v32, v42, v30, v36);
        v26 = v52;
      }
    }
    v27 = v39 + v23 + (v24 >> 1) * v48;
    result = ((uint64_t (*)(uint64_t))off_1EF137B48[v26])(v27);
    v5 = v50;
    v28 = *(unsigned __int8 *)(*(_QWORD *)(v50 + 112) + 32 * v11 + v53 + 76);
    v3 = v40;
    v9 = v38;
    if (v28)
    {
      if (*(_BYTE *)(v50 + 186))
        result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))((char *)&off_1E6A14760[3 * v52] + (v51 & 0xF8)))(v27, v48, v43, v46, v45, v44, v47);
    }
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_1B68FD510(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_1B68FCF84(a1, (uint64_t *)a3);
  v7 = *a4;
  v8 = a4[2];
  v9 = *((unsigned int *)a2 + 2);
  v10 = *((unsigned int *)a2 + 6);
  v11 = *(unsigned int *)(a3 + 8);
  v12 = *(unsigned int *)(a3 + 24);
  v13 = *a2;
  v14 = *(_QWORD *)a3;
  v15 = a2[2];
  v16 = *(_QWORD *)(a3 + 16);
  off_1EF13A5B8(v13, v9, v14, v11, v7, 16);
  return off_1EF13A5B8(v15, v10, v16, v12, v8, 8);
}

void sub_1B68FD5A0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(*(_QWORD *)(a1 + 488) + 152))
    sub_1B68BBBC8(*(_QWORD *)(a1 + 488));
  __asm { BR              X4 }
}

void sub_1B68FD674(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  v5 = 0;
  v6 = v3 + v2 + (int)a1 * (uint64_t)v1;
  do
  {
    for (i = 0; i != 16; ++i)
      *(_BYTE *)(v4 + i) = *(_BYTE *)(v6 + i);
    ++v5;
    v4 += 16;
    v6 += a1;
  }
  while (v5 != 16);
}

void sub_1B68FDD20(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    free(*(void **)(a1 + 80));
    free(*(void **)(a1 + 88));
    free(*(void **)(a1 + 96));
    *(_QWORD *)(a1 + 80) = 0;
    *(_QWORD *)(a1 + 88) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    free(*(void **)(a1 + 24));
    *(_QWORD *)(a1 + 24) = 0;
    v2 = *(void **)(a1 + 40);
    if (v2)
      pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 40));
    free(v2);
    *(_QWORD *)(a1 + 40) = 0;
    v3 = *(void **)(a1 + 48);
    if (v3)
      pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 48));
    free(v3);
    *(_QWORD *)(a1 + 48) = 0;
    v4 = *(void **)(a1 + 136);
    if (v4)
      pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 136));
    free(v4);
    *(_QWORD *)(a1 + 136) = 0;
    v5 = *(void **)(a1 + 144);
    if (v5)
      pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 144));
    free(v5);
    *(_QWORD *)(a1 + 144) = 0;
  }
}

uint64_t sub_1B68FDDDC(uint64_t result, int a2)
{
  _WORD *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64x2_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int32x2_t v12;
  int v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  if (result && a2)
  {
    v2 = *(_WORD **)(result + 1032);
    v3 = *(_QWORD *)(result + 1040);
    v4 = *(_DWORD *)(result + 148);
    v5 = *(unsigned int *)(result + 116);
    *v2 = 0x4000;
    v6 = (v4 >> 4) - 1;
    if (v4 >= 0x20)
    {
      v7 = 0;
      if (v6 <= 1)
        v8 = 1;
      else
        v8 = v6;
      v9 = (uint64x2_t)vdupq_n_s64(v8 - 1);
      v10 = (int64x2_t)xmmword_1B6917590;
      v11 = vdupq_n_s64(2uLL);
      do
      {
        v12 = vmovn_s64((int64x2_t)vcgeq_u64(v9, (uint64x2_t)v10));
        if ((v12.i8[0] & 1) != 0)
          v2[v7 + 1] = v7 & 0x1FFE | 0xA000;
        if ((v12.i8[4] & 1) != 0)
          v2[v7 + 2] = v7 & 0x1FFE | 0xA001;
        v7 += 2;
        v10 = vaddq_s64(v10, v11);
      }
      while ((((_DWORD)v8 + 1) & 0x1FFFFFFE) != v7);
    }
    v2[v6 + 1] = v6 & 0x1FFF | 0x6000;
    *(_DWORD *)(v3 + 32) = 0;
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    if ((int)v5 >= 1)
    {
      v13 = 0;
      v14 = (_DWORD *)(v3 + 36);
      v15 = v5;
      do
      {
        *v14++ = v13;
        v13 += a2;
        --v15;
      }
      while (v15);
    }
    v16 = 0;
    v17 = v3 + 4 * (int)v5 + 36;
    do
    {
      *(_DWORD *)(v17 + v16) = (v5 - 1) * a2;
      v16 += 4;
    }
    while (v16 != 36);
    if (*(_BYTE *)result)
      v5 = v5;
    else
      v5 = ((int)v5 / 2);
    v18 = *(_QWORD *)(result + 1048);
    if (v18)
    {
      *(_DWORD *)(v18 + 32) = 0;
      *(_OWORD *)v18 = 0u;
      *(_OWORD *)(v18 + 16) = 0u;
      if ((int)v5 >= 1)
      {
        v19 = 0;
        v20 = (_DWORD *)(v18 + 36);
        v21 = v5;
        do
        {
          *v20++ = v19;
          v19 += a2;
          --v21;
        }
        while (v21);
      }
      v22 = 0;
      v23 = (v5 - 1) * a2;
      v24 = v18 + 4 * (int)v5 + 36;
      do
      {
        *(_DWORD *)(v24 + v22) = v23;
        v22 += 4;
      }
      while (v22 != 36);
    }
  }
  return result;
}

void sub_1B68FDF64(_QWORD *a1, int a2, unsigned int a3)
{
  sub_1B68FDFB0(*(_QWORD *)(a1[2] + 32) - (32 * *(_DWORD *)(a1[2] + 136)) - 32, a1[10], a1[11], a1[12], *(_DWORD *)(a1[2] + 136), a2, a3, 0, a3);
}

void sub_1B68FDFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, unsigned int a7, unsigned int a8, unsigned int a9)
{
  unsigned int v9;
  unsigned int v12;
  int v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char *v23;
  int v24;
  uint64_t v25;
  char *v26;
  int v27;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (a8 <= a7)
  {
    v9 = a8;
    if (a9 >= a7)
      v12 = a7;
    else
      v12 = a9;
    v13 = 16 * a6;
    v14 = (char *)malloc_type_calloc((qword_1EF13A068 + 2 * (unint64_t)(16 * a6 + 80) - 1) >> qword_1EF13A070, qword_1EF13A068, 0x68FC2D8FuLL);
    v31 = v14;
    if (v9)
    {
      v15 = (v13 + 64);
      v16 = a5;
    }
    else
    {
      v17 = 13 * a5;
      v15 = (v13 + 64);
      v32 = a4;
      v18 = v14 + 16;
      v19 = 19;
      do
      {
        off_1EF13A440(a3 + v17, a1 + v17, v18);
        off_1EF13A450(v32 + v17, v18, v15);
        off_1EF13A448(a2 + v17, a1 + v17, v15);
        v16 = a5;
        v17 += a5;
        --v19;
      }
      while (v19);
      a4 = v32;
      v9 = 0;
    }
    v20 = a4;
    if (16 * v12 > 16 * v9)
    {
      v21 = 16 * v9;
      v22 = (16 * v9 + 32) * v16;
      v23 = v31 + 16;
      v33 = v16;
      v24 = 16 * v12 - v21;
      do
      {
        off_1EF13A440(a3 + v22, a1 + v22, v23);
        off_1EF13A450(a4 + v22, v23, v15);
        a4 = v20;
        off_1EF13A448(a2 + v22, a1 + v22, v15);
        v16 = a5;
        v22 += v33;
        --v24;
      }
      while (v24);
    }
    if (a7 <= a9)
    {
      v25 = (16 * a7 + 32) * v16;
      v26 = v31 + 16;
      v34 = v16;
      v27 = 19;
      do
      {
        off_1EF13A440(a3 + v25, a1 + v25, v26);
        off_1EF13A450(a4 + v25, v26, v15);
        a4 = v20;
        off_1EF13A448(a2 + v25, a1 + v25, v15);
        v25 += v34;
        --v27;
      }
      while (v27);
    }
    free(v31);
  }
}

void sub_1B68FE254(uint64_t a1, unsigned int a2, unsigned int a3)
{
  sub_1B68FDFB0(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 32) - (32 * *(_DWORD *)(*(_QWORD *)(a1 + 16) + 136)) - 32, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 136), *(_DWORD *)(a1 + 168), *(_DWORD *)(a1 + 172), a2, a3);
}

uint64_t sub_1B68FE2A4(uint64_t a1)
{
  off_1EF13A458(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 32)
              - (32 * *(_DWORD *)(*(_QWORD *)(a1 + 16) + 136)) - 32);
  return off_1EF13A460(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 40), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 152), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 148), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 116));
}

uint64_t sub_1B68FE308(uint64_t a1)
{
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v2 = *(unsigned __int8 **)(a1 + 16);
  v3 = *((unsigned int *)v2 + 34);
  v4 = *((_QWORD *)v2 + 4);
  if (v2[3])
  {
    v5 = *(_DWORD *)(a1 + 36);
    v6 = *((_DWORD *)v2 + 34);
    if (*v2 | (v5 != 0))
    {
      v6 = 2 * v3;
      if (v2[5] | (v5 == 1))
        v4 += v3;
    }
  }
  else
  {
    v6 = *((_DWORD *)v2 + 34);
  }
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v10 = v4 - 32 * v6 - 32;
  v11 = *(_DWORD *)(a1 + 164);
  off_1EF13A458(v10);
  if (!v11)
    sub_1B68FDFB0(v10, v7, v8, v9, v3, *(_DWORD *)(a1 + 168), *(_DWORD *)(a1 + 172), 0, *(_DWORD *)(a1 + 172) >> 1);
  return off_1EF13A460(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 40), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 152), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 148), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 116));
}

uint64_t sub_1B68FE418(uint64_t a1)
{
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v2 = *(unsigned __int8 **)(a1 + 16);
  v3 = *((unsigned int *)v2 + 34);
  v4 = *((_QWORD *)v2 + 4);
  if (v2[3])
  {
    v5 = *(_DWORD *)(a1 + 36);
    v6 = *((_DWORD *)v2 + 34);
    if (*v2 | (v5 != 0))
    {
      v6 = 2 * v3;
      if (v2[5] | (v5 == 1))
        v4 += v3;
    }
  }
  else
  {
    v6 = *((_DWORD *)v2 + 34);
  }
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v10 = v4 - 32 * v6 - 32;
  v11 = *(_DWORD *)(a1 + 164);
  off_1EF13A458(v10);
  if (!v11)
    sub_1B68FDFB0(v10, v7, v8, v9, v3, *(_DWORD *)(a1 + 168), *(_DWORD *)(a1 + 172), *(_DWORD *)(a1 + 172) >> 1, *(_DWORD *)(a1 + 172));
  return off_1EF13A460(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 40), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 152), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 148), *(unsigned int *)(*(_QWORD *)(a1 + 16) + 116));
}

uint64_t sub_1B68FE524(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int32x4_t *v18;
  int32x4_t v19;
  int32x4_t *v20;
  int32x4_t v21;
  BOOL v22;
  uint64_t result;
  int32x4_t *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_DWORD *)(a1 + 136);
  v6 = *(_DWORD *)(a1 + 152);
  v7 = *(int *)(a1 + 100);
  if (*(_BYTE *)a1)
  {
    v8 = v5;
    v9 = v6;
    if (!*(_BYTE *)(a1 + 5))
      v9 = 0;
    v3 += v9;
    if (!*(_BYTE *)(a1 + 5))
      v8 = 0;
    v4 += v8;
    v5 *= 2;
    v6 *= 2;
  }
  v10 = *(int *)(a1 + 132);
  v11 = *(int *)(a1 + 148);
  v12 = *(int *)(a1 + 116);
  if (a2 >= 1)
    v13 = 16 * a2 - 4;
  else
    v13 = 0;
  v14 = 16 * a3;
  if (16 * a3 != (_DWORD)v7)
    v14 = 16 * a3 - 4;
  v15 = v13 >> 1;
  v16 = v14 >> 1;
  v17 = v14 - v13;
  if (v14 > v13)
  {
    v18 = (int32x4_t *)(v4 + v5 * (uint64_t)v13);
    do
    {
      v19 = vdupq_n_s32(16843009 * v18->u8[0]);
      v18[-2] = v19;
      v18[-1] = v19;
      v20 = (int32x4_t *)((char *)v18 + v10);
      v21 = vdupq_n_s32(16843009 * v18->u8[v10 - 1]);
      *v20 = v21;
      v20[1] = v21;
      v18 = (int32x4_t *)((char *)v18 + v5);
      --v17;
    }
    while (v17);
  }
  v22 = __OFSUB__(v16, v15);
  result = (v16 - v15);
  if (!(((int)result < 0) ^ v22 | ((_DWORD)result == 0)))
  {
    v24 = (int32x4_t *)(v3 + v6 * (uint64_t)v15);
    do
    {
      v24[-1] = vdupq_n_s32(65537 * v24->u16[0]);
      *(int32x4_t *)((char *)v24 + v11) = vdupq_n_s32(65537 * *(unsigned __int16 *)((char *)&v24->u16[-1]
                                                                                                + v11));
      v24 = (int32x4_t *)((char *)v24 + v6);
      result = (result - 1);
    }
    while ((_DWORD)result);
  }
  if (a2 <= 0)
  {
    v25 = 0;
    v26 = v4 - 32;
    v27 = -2 * v5;
    v28 = v4 - 2 * v5 - 32;
    v29 = v4 - v5 - 32;
    do
    {
      if ((int)v10 >= -63)
      {
        v30 = 0;
        do
        {
          v31 = *(_DWORD *)(v26 + v30);
          *(_DWORD *)(v29 + v30) = v31;
          *(_DWORD *)(v28 + v30) = v31;
          v32 = v30 < v10 + 60;
          v30 += 4;
        }
        while (v32);
      }
      v26 += v27;
      ++v25;
      v28 += v27;
      v29 += v27;
    }
    while (v25 != 12);
    v33 = 0;
    result = v3 - 16;
    v34 = v3 - v6 - 16;
    do
    {
      if ((int)v11 >= -31)
      {
        v35 = 0;
        do
        {
          *(_DWORD *)(v34 + v35) = *(_DWORD *)(result + v35);
          v32 = v35 < v11 + 28;
          v35 += 4;
        }
        while (v32);
      }
      result -= v6;
      ++v33;
      v34 -= v6;
    }
    while (v33 != 8);
  }
  if (v14 == (_DWORD)v7)
  {
    v36 = 0;
    v37 = v5 * (v7 - 1);
    v38 = v4 + v37;
    v39 = 2 * v5;
    v40 = v37 + v5;
    result = v37 + v39 + v4 - 32;
    v41 = v40 + v4 - 32;
    do
    {
      if ((int)v10 >= -63)
      {
        v42 = 0;
        do
        {
          v43 = *(_DWORD *)(v38 + v42 - 32);
          *(_DWORD *)(v41 + v42) = v43;
          *(_DWORD *)(result + v42) = v43;
          v32 = v42 < (int)v10 + 60;
          v42 += 4;
        }
        while (v32);
      }
      ++v36;
      result += v39;
      v41 += v39;
      v38 += v39;
    }
    while (v36 != 12);
    v44 = 0;
    v45 = v12 - 1;
    v46 = v6;
    v47 = v6 * v45;
    v48 = v3 + v47 - 16;
    v49 = v47 + v6 + v3 - 16;
    do
    {
      if ((int)v11 >= -31)
      {
        v50 = 0;
        do
        {
          *(_DWORD *)(v49 + v50) = *(_DWORD *)(v48 + v50);
          v32 = v50 < (int)v11 + 28;
          v50 += 4;
        }
        while (v32);
      }
      v48 += v46;
      ++v44;
      v49 += v46;
    }
    while (v44 != 8);
  }
  return result;
}

uint64_t sub_1B68FE7E0(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = *(unsigned int *)(a2 + 16);
  v7 = 0;
  v8 = 0;
  v5 = *(_QWORD *)(a2 + 56);
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v8, &v7))
    result = off_1EF13A3F0(v5, 16, v8, v7, v4);
  else
    result = off_1EF13A3D0(v5, 16, v8, v4);
  *a3 = result;
  return result;
}

uint64_t sub_1B68FE86C(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = *(unsigned int *)(a2 + 16);
  v7 = 0;
  v8 = 0;
  v5 = *(_QWORD *)(a2 + 56);
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v8, &v7))
    result = off_1EF13A3F8(v5, 16, v8, v7, v4);
  else
    result = off_1EF13A3D8(v5, 16, v8, v4);
  *a3 = result;
  return result;
}

uint64_t sub_1B68FE8F8(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = *(unsigned int *)(a2 + 16);
  v7 = 0;
  v8 = 0;
  v5 = *(_QWORD *)(a2 + 56);
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v8, &v7))
    result = off_1EF13A400(v5, 16, v8, v7, v4);
  else
    result = off_1EF13A3E0(v5, 16, v8, v4);
  *a3 = result;
  return result;
}

uint64_t sub_1B68FE984(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v4 = *(unsigned int *)(a2 + 16);
  v8 = 0;
  v9 = 0;
  v5 = *(_QWORD *)(a2 + 56);
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v9, &v8))
    result = off_1EF13A408(v5, 16, v9, v8, v4);
  else
    result = off_1EF13A3E8(v5, 16, v9, v4, v6);
  *a3 = result;
  return result;
}

uint64_t sub_1B68FEA10()
{
  return puts("Unimplemented function");
}

uint64_t sub_1B68FEA1C(unsigned int a1, _DWORD *a2, _QWORD *a3, _QWORD *a4)
{
  unsigned int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v4 = HIWORD(a1) & 3 | (4 * (a1 & 3));
  v5 = a2[4];
  v6 = *(_QWORD *)&a2[2 * byte_1B693B2D4[v4] + 6];
  v7 = *a2 + ((__int16)a1 >> 2) + v5 * (a2[1] + ((int)a1 >> 18));
  v8 = *(_QWORD *)&a2[2 * byte_1B693B2C4[v4] + 6] + v7;
  if ((a1 & 3) == 3)
    ++v8;
  *a3 = v8;
  v9 = v6 + v7;
  if ((HIWORD(a1) & 3) == 3)
    v10 = v5;
  else
    v10 = 0;
  *a4 = v9 + v10;
  return HIWORD(a1) & 1 | (4 * (a1 & 3)) & 0x55;
}

uint64_t sub_1B68FEA94(unsigned int a1)
{
  return ((uint64_t (*)(void))((char *)sub_1B68FEAD4 + 4 * byte_1B6918D92[HIWORD(a1) & 3 | (4 * (a1 & 3))]))();
}

uint64_t sub_1B68FEAD4@<X0>(_QWORD *a1@<X2>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = 0;
  v6 = v4 + a2;
  *a1 = v6 - v2;
  a1[1] = v6;
  v7 = v3 + a2;
  a1[2] = v7 - 1;
  a1[3] = v7;
  return result;
}

uint64_t sub_1B68FEDFC()
{
  return puts("Unimplemented function");
}

uint64_t sub_1B68FEE08(int a1, unsigned int a2, uint64_t a3, int a4, char a5)
{
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  char v13;
  size_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  size_t v18;
  void *v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _DWORD *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  char v43;

  v9 = (-a1 & 0xF) + a1;
  v10 = (-a2 & 0xF) + a2;
  v11 = v9 + 64;
  v12 = (v10 + 80) * (v9 + 64);
  v13 = (a4 - 3) < 2;
  v14 = (((v10 >> 1) + 64) * (v9 + 64)) << v13;
  v15 = v12 << v13;
  v43 = v13;
  if ((a5 & 1) == 0)
  {
    *(_DWORD *)(a3 + 24) = v15 + v14;
LABEL_11:
    *(_OWORD *)(a3 + 160) = 0u;
    *(_QWORD *)(a3 + 384) = 0;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    if (a4)
    {
      v20 = 2 * v15;
      if (!(_DWORD)v20)
        goto LABEL_27;
      v21 = malloc_type_malloc(v20, 0x4CF1F002uLL);
      *(_QWORD *)(a3 + 160) = v21;
      if (!v21)
        goto LABEL_27;
    }
    v22 = *(_QWORD *)(a3 + 8);
    v23 = (40 * v11);
    v24 = v22 + (v23 + 32);
    v25 = v22 + v15 + v23 + 32;
    *(_QWORD *)(a3 + 32) = v24;
    *(_QWORD *)(a3 + 40) = v25;
    *(_QWORD *)(a3 + 48) = v24;
    *(_QWORD *)(a3 + 56) = v25;
    *(_DWORD *)(a3 + 128) = a1;
    *(_DWORD *)(a3 + 132) = v9;
    *(_DWORD *)(a3 + 136) = v11;
    *(_DWORD *)(a3 + 144) = (a1 & 1) + a1;
    *(_DWORD *)(a3 + 148) = v9;
    *(_DWORD *)(a3 + 152) = v11;
    *(_DWORD *)(a3 + 96) = a2;
    *(_DWORD *)(a3 + 100) = v10;
    *(_DWORD *)(a3 + 112) = a2 >> 1;
    *(_DWORD *)(a3 + 116) = v10 >> 1;
    v26 = sub_1B68BB904(a3, a4);
    *(_QWORD *)(a3 + 392) = v26;
    if (!v26)
      goto LABEL_27;
    *((_DWORD *)v26 + 9) = 0;
    if (a4 == 4)
    {
      v27 = sub_1B68BB904(a3, 4);
      *(_QWORD *)(a3 + 400) = v27;
      if (!v27)
        goto LABEL_27;
      *((_DWORD *)v27 + 9) = 2;
      v28 = sub_1B68BB904(a3, 4);
      *(_QWORD *)(a3 + 408) = v28;
      if (!v28)
        goto LABEL_27;
      *((_DWORD *)v28 + 9) = 1;
    }
    else
    {
      *(_QWORD *)(a3 + 400) = 0;
      *(_QWORD *)(a3 + 408) = 0;
    }
    *(_DWORD *)(a3 + 416) = 0x40000;
    v29 = 4 * v11 + 4;
    *(_WORD *)(a3 + 420) = 4 * v11;
    *(_WORD *)(a3 + 422) = v29;
    *(_DWORD *)(a3 + 424) = 786440;
    *(_WORD *)(a3 + 428) = 4 * v11 + 8;
    *(_WORD *)(a3 + 430) = 4 * v11 + 12;
    *(_WORD *)(a3 + 432) = 8 * v11;
    *(_WORD *)(a3 + 434) = (8 * v11) | 4;
    *(_WORD *)(a3 + 436) = 12 * v11;
    *(_WORD *)(a3 + 438) = v29 + 8 * v11;
    *(_WORD *)(a3 + 440) = 8 * v11 + 8;
    *(_WORD *)(a3 + 442) = 8 * v11 + 12;
    *(_WORD *)(a3 + 444) = 8 * v11 + 8 + 4 * v11;
    *(_WORD *)(a3 + 446) = 8 * v11 + 8 + v29;
    *(_DWORD *)(a3 + 448) = 0x40000;
    *(_WORD *)(a3 + 452) = 8 * v11;
    *(_WORD *)(a3 + 454) = (8 * v11) | 4;
    *(_DWORD *)(a3 + 456) = 786440;
    *(_WORD *)(a3 + 460) = 8 * v11 + 8;
    *(_WORD *)(a3 + 462) = 8 * v11 + 12;
    *(_WORD *)(a3 + 464) = 16 * v11;
    *(_WORD *)(a3 + 466) = (16 * v11) | 4;
    *(_WORD *)(a3 + 468) = 24 * v11;
    *(_WORD *)(a3 + 470) = ((8 * v11) | 4) + 16 * v11;
    *(_WORD *)(a3 + 472) = (16 * v11) | 8;
    *(_WORD *)(a3 + 474) = (16 * v11) | 0xC;
    *(_WORD *)(a3 + 476) = ((16 * v11) | 8) + 8 * v11;
    *(_WORD *)(a3 + 478) = ((16 * v11) | 8) + ((8 * v11) | 4);
    *(_OWORD *)(a3 + 480) = xmmword_1B6917FE0;
    *(_DWORD *)(a3 + 496) = v9 + 2;
    *(_DWORD *)(a3 + 500) = v9 - 1;
    *(_DWORD *)(a3 + 504) = v10 + 2;
    *(_DWORD *)(a3 + 508) = v10 - 1;
    *(_DWORD *)(a3 + 512) = v9 + 2;
    *(_DWORD *)(a3 + 516) = v9 - 1;
    *(_DWORD *)(a3 + 520) = v10 + 2;
    v30 = &byte_1B693B259;
    v31 = 528;
    *(_DWORD *)(a3 + 524) = v10 - 1;
    do
    {
      v32 = *v30;
      v33 = v30[21];
      v34 = v30[42];
      v35 = v30[63];
      v36 = v30[84];
      v37 = (_DWORD *)(a3 + v31);
      *v37 = v11 * *(v30 - 21);
      v37[21] = v11 * v32;
      v37[42] = v11 * v33;
      v37[63] = v11 * v34;
      v37[84] = v11 * v35;
      v37[105] = v11 * v36;
      ++v30;
      v31 += 4;
    }
    while (v31 != 612);
    v38 = *(_DWORD *)(a3 + 116);
    v39 = malloc_type_malloc((((unint64_t)*(unsigned int *)(a3 + 148) >> 3) & 0x1FFFFFFE) + 4, 0x82ECD37AuLL);
    *(_QWORD *)(a3 + 1032) = v39;
    if (v39)
    {
      v40 = malloc_type_malloc(4 * ((v38 << v43) + 19), 0x82ECD37AuLL);
      *(_QWORD *)(a3 + 1040) = v40;
      if (v40)
      {
        v41 = malloc_type_malloc(4 * (v38 + 19), 0x82ECD37AuLL);
        *(_QWORD *)(a3 + 1048) = v41;
        if (v41)
        {
          sub_1B68FDDDC(a3, v9 + 64);
          return 0;
        }
      }
    }
    goto LABEL_27;
  }
  if (v15)
    v16 = malloc_type_malloc((v12 << v13), 0x4CF1F002uLL);
  else
    v16 = 0;
  *(_QWORD *)(a3 + 64) = v16;
  if ((_DWORD)v14)
    v17 = malloc_type_malloc(v14, 0x4CF1F002uLL);
  else
    v17 = 0;
  *(_QWORD *)(a3 + 72) = v17;
  v18 = v15 + v14;
  *(_DWORD *)(a3 + 24) = v18;
  if (!(v15 + (_DWORD)v14))
  {
    *(_QWORD *)(a3 + 8) = 0;
    goto LABEL_27;
  }
  v19 = malloc_type_malloc(v18, 0x4CF1F002uLL);
  *(_QWORD *)(a3 + 8) = v19;
  if (v19)
    goto LABEL_11;
LABEL_27:
  sub_1B68FF21C(a3);
  return 4294967188;
}

void sub_1B68FF21C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    v2 = *(void **)(a1 + 160);
    if (v2)
      free(v2);
    free(*(void **)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
    free(*(void **)(a1 + 64));
    *(_QWORD *)(a1 + 64) = 0;
    free(*(void **)(a1 + 72));
    *(_QWORD *)(a1 + 72) = 0;
    v3 = *(void **)(a1 + 16);
    if (v3)
    {
      free(v3);
      *(_QWORD *)(a1 + 16) = 0;
    }
    v4 = *(void **)(a1 + 392);
    if (v4)
    {
      sub_1B68BBB78((uint64_t)v4);
      v4 = *(void **)(a1 + 392);
    }
    free(v4);
    *(_QWORD *)(a1 + 392) = 0;
    v5 = *(_QWORD *)(a1 + 400);
    if (v5)
      sub_1B68BBB78(v5);
    v6 = *(_QWORD *)(a1 + 408);
    if (v6)
      sub_1B68BBB78(v6);
    free(*(void **)(a1 + 400));
    free(*(void **)(a1 + 408));
    *(_OWORD *)(a1 + 400) = 0u;
    free(*(void **)(a1 + 1032));
    free(*(void **)(a1 + 1040));
    *(_OWORD *)(a1 + 1032) = 0u;
    free(*(void **)(a1 + 1048));
    *(_QWORD *)(a1 + 1048) = 0;
  }
}

_QWORD *sub_1B68FF2F8(_QWORD *result, int a2)
{
  char v3;
  uint64_t v4;
  char v5;
  _DWORD *v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  size_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  char *v21;
  int v22;
  uint64_t v23;
  char *v24;
  int v25;
  char *v26;
  _QWORD *v27;
  char v28;

  v27 = result;
  v3 = 0;
  v4 = 0;
  v5 = 1;
  do
  {
    v28 = v5;
    v6 = &v27[2 * v4];
    v7 = v6[32];
    v8 = v6[33];
    v9 = v6[34];
    v10 = v6[24];
    v11 = v6[25];
    v12 = v27[v4 + 4];
    v13 = (v8 - v7);
    if ((int)v13 >= 1)
    {
      if ((v3 & 1) != 0)
      {
        if (!v10)
        {
          if (v11 <= 0)
            return result;
          goto LABEL_26;
        }
        v14 = 0;
        v15 = v12 + (((_DWORD)v7 + 1) & 0xFFFFFFFE);
        if (v13 >> 1 <= 1)
          v16 = 1;
        else
          v16 = v13 >> 1;
        if (v13 < 2)
          v17 = 1;
        else
          v17 = a2;
        v18 = 2 * v16;
        do
        {
          if ((v17 & 1) == 0)
          {
            v19 = 0;
            v20 = *(_WORD *)(v15 - 2);
            do
            {
              *(_WORD *)(v15 + v19) = v20;
              v19 += 2;
            }
            while (v18 != v19);
          }
          v15 += v9 & 0xFFFFFFFE;
          ++v14;
        }
        while (v14 != v10);
      }
      else
      {
        if (!v10)
        {
          if (v11 <= 0)
            goto LABEL_39;
LABEL_34:
          v26 = (char *)(v12 + (v10 * v9));
          do
          {
            if (a2)
              result = memset(v26, 255, v8);
            else
              result = memcpy(v26, (const void *)(v12 + ((v10 - 1) * v9)), v8);
            v26 += v9;
            --v11;
          }
          while (v11);
          goto LABEL_39;
        }
        v21 = (char *)(v12 + v7);
        v22 = v6[24];
        do
        {
          if ((a2 & 1) == 0)
            result = memset(v21, *(v21 - 1), v13);
          v21 += v9;
          --v22;
        }
        while (v22);
      }
    }
    v11 -= v10;
    if (v11 <= 0)
      goto LABEL_39;
    if ((v3 & 1) == 0)
      goto LABEL_34;
LABEL_26:
    v23 = (v10 * v9);
    result = memcpy((void *)(v12 + v23), (const void *)(v12 + ((v10 - 1) * v9)), v8);
    if (v11 < 2)
      return result;
    v24 = (char *)(v12 + v9 + v23);
    v25 = v11 - 1;
    do
    {
      if (a2)
        result = memset(v24, 255, v8);
      else
        result = memcpy(v24, (const void *)(v12 + ((v10 - 1) * v9)), v8);
      v24 += v9;
      --v25;
    }
    while (v25);
LABEL_39:
    v5 = 0;
    v3 = 1;
    v4 = 1;
  }
  while ((v28 & 1) != 0);
  return result;
}

uint64_t sub_1B68FF4EC(_WORD *a1, unsigned __int16 *a2, _WORD *a3)
{
  __int16 v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  int v21;
  int v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  int v30;
  int v31;
  __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  __int16 v35;
  __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  __int16 v39;
  int v40;
  __int16 v41;
  __int16 v42;
  int v43;
  int v44;
  int v45;
  unsigned __int16 v46;
  unsigned __int16 v47;
  __int16 v48;
  __int16 v49;
  unsigned __int16 v50;
  __int16 v51;
  __int16 v52;
  int v53;
  int v54;
  __int16 v55;
  __int16 v56;
  __int16 v57;
  __int16 v58;
  __int16 v59;
  __int16 v60;
  __int16 v61;
  __int16 v62;
  __int16 v63;
  __int16 v64;
  __int16 v65;
  int v66;
  __int16 v67;
  __int16 v68;
  __int16 v69;
  uint64_t result;
  __int16 v71;
  int v72;
  __int16 v73;
  __int16 v74;
  int v75;
  __int16 v76;
  __int16 v77;
  __int16 v78;
  __int16 v79;
  __int16 v80;
  __int16 v81;
  __int16 v82;
  int v83;
  __int16 v84;
  __int16 v85;
  __int16 v86;
  __int16 v87;
  __int16 v88;
  __int16 v89;

  v3 = a1[4];
  v4 = a1[8];
  v5 = a1[12];
  v6 = a1[5];
  v7 = a1[9];
  v8 = a1[1];
  v9 = a1[13];
  v88 = v6 - v7 + 2 * (v8 - v9);
  v89 = v3 - v4 + 2 * (*a1 - v5);
  v10 = a1[6];
  v11 = a1[10];
  v12 = a1[2];
  v13 = a1[14];
  v86 = *a1 - v5 - 2 * (v3 - v4);
  v87 = v10 - v11 + 2 * (v12 - v13);
  v14 = v8 - v9 - 2 * (v6 - v7);
  v15 = v5 + *a1;
  v16 = v9 + v8;
  v17 = v13 + v12;
  v84 = v12 - v13 - 2 * (v10 - v11);
  v85 = v14;
  v18 = a1[3];
  v19 = a1[15];
  v20 = v19 + v18;
  v21 = *a2;
  v22 = a2[12];
  v23 = v22 + v21;
  v24 = v4 + v3;
  v25 = v7 + v6;
  v26 = v11 + v10;
  v27 = a1[7];
  v28 = a1[11];
  v29 = v28 + v27;
  v30 = a2[4];
  v31 = a2[8];
  v32 = v31 + v30;
  v33 = a2[5];
  v34 = a2[9];
  v35 = v34 + v33;
  v36 = v27 - v28;
  v37 = a2[6];
  v38 = a2[10];
  v39 = v38 + v37;
  v40 = v30 - v31;
  v41 = v33 - v34;
  v42 = v37 - v38;
  v43 = a2[7];
  v44 = a2[11];
  v79 = v44 + v43;
  v83 = v43 - v44;
  LOWORD(v43) = v18 - v19;
  v45 = v21 - v22;
  v46 = a2[1];
  v47 = a2[13];
  v48 = v47 + v46;
  v49 = v46 - v47;
  v50 = a2[2];
  LOWORD(v21) = a2[14];
  v51 = v21 + v50;
  v52 = v50 - v21;
  v53 = a2[3];
  v54 = a2[15];
  LOWORD(v21) = v54 + v53;
  v75 = v53 - v54;
  v55 = v16 - v25;
  LOWORD(v54) = v17 + v26;
  LOWORD(v44) = v17 - v26;
  v56 = v20 + v29;
  v57 = v20 - v29;
  v73 = v23 + v32;
  v74 = v23 - v32;
  v58 = v51 + v39;
  v81 = v51 - v39;
  v82 = v48 - v35;
  v59 = v36 + 2 * v43;
  v60 = v43 - 2 * v36;
  v72 = v40 + 2 * v45;
  v76 = v48 + v35;
  v77 = v45 - 2 * v40;
  v61 = v41 + 2 * v49;
  v80 = v49 - 2 * v41;
  LOWORD(v45) = v42 + 2 * v52;
  v78 = v52 - 2 * v42;
  LOWORD(v40) = v54 + v16 + v25;
  v62 = v16 + v25 - v54;
  LOWORD(v43) = v56 + v15 + v24;
  *a3 = v43 + v40;
  a3[1] = v59 + v89 + v87 + v88;
  a3[2] = v57 + v15 - v24 + v44 + v55;
  v63 = v60 + v86;
  a3[3] = v60 + v86 + v84 + v85;
  v64 = v15 + v24 - v56;
  a3[4] = v62 + 2 * v64;
  a3[5] = v88 - v87 + 2 * (v89 - v59);
  v65 = v86 - v60;
  a3[6] = v55 - v44 + 2 * (v15 - v24 - v57);
  a3[7] = v85 - v84 + 2 * v65;
  v66 = v83 + 2 * v75;
  v67 = v75 - 2 * v83;
  a3[8] = v43 - v40;
  a3[9] = v59 + v89 - (v87 + v88);
  v68 = v21 + v79 + v73;
  a3[10] = v57 + v15 - v24 - (v44 + v55);
  a3[11] = v63 - (v84 + v85);
  a3[12] = v64 - 2 * v62;
  a3[13] = v89 - v59 - 2 * (v88 - v87);
  a3[14] = v15 - v24 - v57 - 2 * (v55 - v44);
  a3[15] = v65 - 2 * (v85 - v84);
  a3[16] = v68 + v58 + v76;
  a3[17] = v66 + v72 + v45 + v61;
  a3[18] = v21 - v79 + v74 + v81 + v82;
  v69 = v67 + v77;
  a3[19] = v67 + v77 + v78 + v80;
  a3[20] = v76 - v58 + 2 * (v73 - (v21 + v79));
  result = (v72 - v66);
  a3[21] = v61 - v45 + 2 * (v72 - v66);
  a3[22] = v82 - v81 + 2 * (v74 - (v21 - v79));
  v71 = v77 - v67;
  a3[23] = v80 - v78 + 2 * v71;
  a3[24] = v68 - (v58 + v76);
  a3[25] = v66 + v72 - (v45 + v61);
  a3[26] = v21 - v79 + v74 - (v81 + v82);
  a3[27] = v69 - (v78 + v80);
  a3[28] = v73 - (v21 + v79) - 2 * (v76 - v58);
  a3[29] = v72 - v66 - 2 * (v61 - v45);
  a3[30] = v74 - (v21 - v79) - 2 * (v82 - v81);
  a3[31] = v71 - 2 * (v80 - v78);
  return result;
}

uint64_t sub_1B68FF888(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, BOOL *a5, int a6)
{
  __int128 v6;
  int32x4_t v7;
  int8x16_t v8;
  int32x4_t v9;
  int16x8_t v10;
  uint16x8_t v11;
  uint16x4_t v12;
  uint32x4_t v13;
  uint32x4_t v14;
  uint32x4_t v15;
  uint32x4_t v16;
  int32x4_t v17;
  uint32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int v22;
  int v23;
  int8x16_t v24;
  uint16x8_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int v30;
  int v31;
  int32x4_t v32;
  int8x16_t v33;
  int32x4_t v34;
  int32x4_t v35;
  int16x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int v39;
  int8x16_t v40;
  int32x4_t v41;
  int8x16_t v42;
  int32x4_t v43;
  int8x16_t v44;
  int16x8_t v45;
  int32x4_t v46;
  int8x16_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int8x16_t v52;
  int32x4_t v53;
  int32x4_t v54;
  int8x16_t v55;
  int16x4_t v56;
  int32x4_t v57;
  int32x4_t v58;
  int v59;
  int32x4_t v60;
  int32x4_t v61;
  int8x16_t v62;
  int8x16_t v63;
  int16x8_t v64;
  int32x4_t v65;
  int8x16_t v66;
  int v67;
  int v68;
  __int16 v69;
  __int16 v70;
  __int16 v71;
  __int16 v72;
  int v73;
  uint64_t result;
  int v75;
  int v76;
  int v77;
  int v78;

  v7 = *((int32x4_t *)a2 + 1);
  v8 = *((int8x16_t *)a2 + 2);
  v9 = *(int32x4_t *)a2;
  v10 = *(int16x8_t *)(a1 + 32);
  v11 = (uint16x8_t)vabsq_s16(v10);
  v12 = (uint16x4_t)vextq_s8(v8, v8, 8uLL).u64[0];
  v13 = (uint32x4_t)vzip1q_s32(v7, v7);
  v14 = vmlal_u16(v13, *(uint16x4_t *)v11.i8, *(uint16x4_t *)v8.i8);
  v15 = (uint32x4_t)vzip2q_s32(v7, v7);
  v16 = (uint32x4_t)vnegq_s32(vzip2q_s32(v9, v9));
  v17 = (int32x4_t)vshlq_u32(vmlal_high_u16(v15, v11, (uint16x8_t)v8), v16);
  v18 = (uint32x4_t)vnegq_s32(vzip1q_s32(v9, v9));
  v19 = (int32x4_t)vshlq_u32(v14, v18);
  v20 = vshlq_n_s32(v17, 0x10uLL);
  v21 = vshlq_n_s32(v19, 0x10uLL);
  if (v10.i16[1] >= 0)
    LOWORD(v22) = v19.i16[2];
  else
    v22 = -v19.u16[2];
  if (v10.i16[4] >= 0)
    LOWORD(v23) = v17.i16[0];
  else
    v23 = -v17.u16[0];
  v24 = *(int8x16_t *)a1;
  v25 = (uint16x8_t)vabsq_s16(*(int16x8_t *)a1);
  v26 = (int32x4_t)vshlq_u32(vmlal_high_u16(v15, v25, (uint16x8_t)v8), v16);
  v27 = (int32x4_t)vshlq_u32(vmlal_u16(v13, *(uint16x4_t *)v25.i8, *(uint16x4_t *)v8.i8), v18);
  v28 = vshlq_n_s32(v26, 0x10uLL);
  v29 = vshlq_n_s32(v27, 0x10uLL);
  if ((WORD1(*(_OWORD *)a1) & 0x8000u) == 0)
    LOWORD(v30) = v27.i16[2];
  else
    v30 = -v27.u16[2];
  if ((*(_QWORD *)(a1 + 8) & 0x8000u) == 0)
    LOWORD(v31) = v26.i16[0];
  else
    v31 = -v26.u16[0];
  v32.i64[0] = 0xFF000000FF0000;
  v32.i64[1] = 0xFF000000FF0000;
  v33.i64[0] = 0xFF000000FFLL;
  v33.i64[1] = 0xFF000000FFLL;
  v34 = (int32x4_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v26, (int8x16_t)vcgezq_s32(v28)), (int8x16_t)vcgtq_s32(v28, v32)), v33);
  v35 = (int32x4_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v27, (int8x16_t)vcgezq_s32(v29)), (int8x16_t)vcgtq_s32(v29, v32)), v33);
  *(_QWORD *)&v6 = *(_QWORD *)(a1 + 16);
  v36 = *(int16x4_t *)(a1 + 24);
  v37 = (int32x4_t)vshlq_u32(vmlal_u16(v13, *(uint16x4_t *)v8.i8, (uint16x4_t)vabs_s16(*(int16x4_t *)&v6)), v18);
  v38 = vshlq_n_s32(v37, 0x10uLL);
  if ((SWORD3(v6) & 0x8000u) == 0)
    LOWORD(v39) = v37.i16[6];
  else
    v39 = -v37.u16[6];
  v40 = vorrq_s8(vandq_s8((int8x16_t)v37, (int8x16_t)vcgezq_s32(v38)), (int8x16_t)vcgtq_s32(v38, v32));
  v41 = (int32x4_t)vshlq_u32(vmlal_u16(v15, v12, (uint16x4_t)vabs_s16(v36)), v16);
  v42 = vqtbl1q_s8(v24, (int8x16_t)xmmword_1B6917FF0);
  v42.i16[1] = *(_QWORD *)(a1 + 16);
  v42.i16[2] = *(_QWORD *)(a1 + 24);
  v43 = (int32x4_t)vandq_s8(v40, v33);
  v44 = vqtbl2q_s8(*(int8x16x2_t *)v27.i8, (int8x16_t)xmmword_1B6918010);
  v44.i16[1] = v37.i16[0];
  v44.i16[2] = v41.i16[0];
  v45 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)(&v37 - 1), (int8x16_t)xmmword_1B6918020);
  v46 = vshlq_n_s32(v41, 0x10uLL);
  v47 = vbslq_s8((int8x16_t)vcltzq_s16((int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)(&v6 - 1), (int8x16_t)xmmword_1B6918000)), (int8x16_t)vnegq_s16(v45), (int8x16_t)v45);
  if (v36.i16[1] >= 0)
    LOWORD(v48) = v41.i16[2];
  else
    v48 = -v41.u16[2];
  if (v36.i16[2] >= 0)
    LOWORD(v49) = v41.i16[4];
  else
    v49 = -v41.u16[4];
  v50 = vaddvq_s32((int32x4_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v41, (int8x16_t)vcgezq_s32(v46)), (int8x16_t)vcgtq_s32(v46, v32)), v33));
  v51 = vaddvq_s32(vaddq_s32(vaddq_s32(v35, v34), v43));
  v52 = (int8x16_t)vcgtq_s32(v21, v32);
  v55 = vandq_s8((int8x16_t)v19, (int8x16_t)vcgezq_s32(v21));
  v53 = (int32x4_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v17, (int8x16_t)vcgezq_s32(v20)), (int8x16_t)vcgtq_s32(v20, v32)), v33);
  v54 = (int32x4_t)vandq_s8(vorrq_s8(v55, v52), v33);
  v55.i64[0] = *(_QWORD *)(a1 + 48);
  v56 = *(int16x4_t *)(a1 + 56);
  v57 = (int32x4_t)vshlq_u32(vmlal_u16(v13, *(uint16x4_t *)v8.i8, (uint16x4_t)vabs_s16(*(int16x4_t *)v55.i8)), v18);
  v58 = vshlq_n_s32(v57, 0x10uLL);
  if (v55.i16[3] >= 0)
    LOWORD(v59) = v57.i16[6];
  else
    v59 = -v57.u16[6];
  v60 = (int32x4_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v57, (int8x16_t)vcgezq_s32(v58)), (int8x16_t)vcgtq_s32(v58, v32)), v33);
  v61 = (int32x4_t)vshlq_u32(vmlal_u16(v15, v12, (uint16x4_t)vabs_s16(v56)), v16);
  v62 = vqtbl1q_s8((int8x16_t)v10, (int8x16_t)xmmword_1B6917FF0);
  v62.i16[1] = v55.i16[0];
  v62.i16[2] = v56.i16[0];
  v63 = vqtbl2q_s8(*(int8x16x2_t *)v19.i8, (int8x16_t)xmmword_1B6918010);
  v63.i16[1] = v57.i16[0];
  v63.i16[2] = v61.i16[0];
  v64 = (int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)(&v57 - 1), (int8x16_t)xmmword_1B6918020);
  v65 = vshlq_n_s32(v61, 0x10uLL);
  v66 = vbslq_s8((int8x16_t)vcltzq_s16((int16x8_t)vqtbl2q_s8(*(int8x16x2_t *)(&v55 - 1), (int8x16_t)xmmword_1B6918000)), (int8x16_t)vnegq_s16(v64), (int8x16_t)v64);
  if (v56.i16[1] >= 0)
    LOWORD(v67) = v61.i16[2];
  else
    v67 = -v61.u16[2];
  if (v56.i16[2] >= 0)
    LOWORD(v68) = v61.i16[4];
  else
    v68 = -v61.u16[4];
  *a5 = v51 + v50 != 0;
  a5[1] = vaddvq_s32(vaddq_s32(vaddq_s32(v54, v53), v60))
        + vaddvq_s32((int32x4_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v61, (int8x16_t)vcgezq_s32(v65)), (int8x16_t)vcgtq_s32(v65, v32)), v33)) != 0;
  if (a6)
  {
    v69 = v47.i16[2];
    v47 = vqtbl1q_s8(v47, (int8x16_t)xmmword_1B6918030);
    v47.i16[7] = v39;
    v70 = v66.i16[2];
    v66 = vqtbl1q_s8(v66, (int8x16_t)xmmword_1B6918030);
    v66.i16[7] = v59;
    v71 = v30;
    v72 = v22;
  }
  else
  {
    v71 = v31;
    LOWORD(v31) = v30;
    v69 = v48;
    LOWORD(v48) = v49;
    LOWORD(v49) = v39;
    v72 = v23;
    LOWORD(v23) = v22;
    v70 = v67;
    LOWORD(v67) = v68;
    LOWORD(v68) = v59;
  }
  LOWORD(v73) = v61.i16[6];
  if (v56.i16[3] < 0)
    v73 = -v61.u16[6];
  if (v10.i16[2] >= 0)
    result = v19.u16[4];
  else
    result = -v19.u16[4];
  LOWORD(v75) = v19.i16[0];
  if (v10.i16[0] < 0)
    v75 = -v19.u16[0];
  LOWORD(v76) = v41.i16[6];
  if (v36.i16[3] < 0)
    v76 = -v41.u16[6];
  LOWORD(v77) = v27.i16[4];
  if (v24.i16[2] < 0)
    v77 = -v27.u16[4];
  LOWORD(v78) = v27.i16[0];
  if (v24.i16[0] < 0)
    v78 = -v27.u16[0];
  *(_WORD *)a3 = v78;
  *(_WORD *)(a3 + 2) = v71;
  *(_WORD *)(a3 + 4) = v31;
  *(_WORD *)(a3 + 6) = v77;
  *(int8x16_t *)(a3 + 8) = v47;
  *(_WORD *)(a3 + 24) = v69;
  *(_WORD *)(a3 + 26) = v48;
  *(_WORD *)(a3 + 28) = v49;
  *(_WORD *)(a3 + 30) = v76;
  *(_WORD *)a4 = v75;
  *(_WORD *)(a4 + 2) = v72;
  *(_WORD *)(a4 + 4) = v23;
  *(_WORD *)(a4 + 6) = result;
  *(int8x16_t *)(a4 + 8) = v66;
  *(_WORD *)(a4 + 24) = v70;
  *(_WORD *)(a4 + 26) = v67;
  *(_WORD *)(a4 + 28) = v68;
  *(_WORD *)(a4 + 30) = v73;
  return result;
}

__n128 sub_1B68FFC78(__int16 *a1, __int16 *a2, unsigned int a3, uint64_t a4, _OWORD *a5, int a6)
{
  uint16x8_t v8;
  uint32x4_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __n128 result;
  _QWORD v14[2];
  int16x8_t v15;
  _QWORD v16[18];

  v16[17] = *MEMORY[0x1E0C80C00];
  v8 = *(uint16x8_t *)&asc_1EF138180[(a3 >> 2) & 0x38];
  v9 = (uint32x4_t)vdupq_n_s32(a3 & 0x1F);
  v15 = vuzp1q_s16((int16x8_t)vshlq_u32(vmovl_u16(*(uint16x4_t *)v8.i8), v9), (int16x8_t)vshlq_u32(vmovl_high_u16(v8), v9));
  v14[0] = 0;
  v14[1] = 0;
  sub_1B68FFD6C(a1, a2, (__int16 *)&xmmword_1B6917610, (__int16 *)&xmmword_1B6917610, (unsigned __int16 *)v14, (unsigned __int16 *)&v15, v16, a6, 0, 0, 0, 0, 0, 0);
  result.n128_u64[0] = v16[0];
  *(_QWORD *)&v10 = v16[8];
  *(_QWORD *)&v11 = v16[1];
  *(_QWORD *)&v12 = v16[9];
  result.n128_u64[1] = v16[4];
  *((_QWORD *)&v10 + 1) = v16[12];
  *((_QWORD *)&v11 + 1) = v16[5];
  *((_QWORD *)&v12 + 1) = v16[13];
  *(__n128 *)a4 = result;
  *(_OWORD *)(a4 + 16) = v10;
  *a5 = v11;
  a5[1] = v12;
  return result;
}

uint64_t sub_1B68FFD6C(__int16 *a1, __int16 *a2, __int16 *a3, __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, _WORD *a7, int a8, int a9, char a10, char a11, char a12, unsigned __int16 a13, int a14)
{
  int v14;
  int v15;
  int v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  int v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  __int16 v30;
  __int16 v31;
  int v32;
  int v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  __int16 v43;
  int v44;
  int v45;
  int v46;
  __int16 v47;
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
  __int16 v81;
  int v82;
  int v83;
  int v84;
  int v85;
  __int16 v86;
  __int16 v87;
  __int16 v88;
  __int16 v89;
  __int16 v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  __int16 v97;
  int v98;
  int v99;
  __int16 v100;
  int v101;
  int v102;
  int v103;
  int v104;
  __int16 v105;
  int v106;
  int v107;
  __int16 v108;
  int v109;
  __int16 v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  __int16 v124;
  int v125;
  int v126;
  __int16 v127;
  __int16 v128;
  __int16 v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  __int16 v137;
  __int16 v138;
  __int16 v139;
  int v140;
  int v141;
  __int16 v142;
  __int16 v143;
  __int16 v144;
  __int16 v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  __int16 v157;
  __int16 v158;
  __int16 v159;
  int v160;
  __int16 v161;
  __int16 v162;
  int v163;
  int v164;
  int v165;
  __int16 v166;
  __int16 v167;
  __int16 v168;
  __int16 v169;
  int v170;
  __int16 v171;
  __int16 v172;
  __int16 v173;
  __int16 v174;
  __int16 v175;
  __int16 v176;
  __int16 v177;
  __int16 v178;
  __int16 v179;
  int v180;
  __int16 v181;
  uint64_t result;
  int v183;
  int v184;
  int v185;
  __int16 v186;
  int v187;
  __int16 v188;
  int v189;
  __int16 v190;
  int v191;
  int v192;
  __int16 v193;
  int v194;
  __int16 v195;
  __int16 v196;
  int v197;
  int v198;
  int v199;
  __int16 v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  __int16 v210;
  int v211;
  __int16 v212;
  int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  __int16 v218;
  int v219;
  int v220;
  __int16 v221;
  int v222;
  int v223;
  int v224;
  __int16 v225;
  int v226;
  int v227;
  int v228;
  __int16 v229;
  int v230;
  __int16 v231;
  int v232;
  int v233;
  __int16 v234;
  int v235;
  int v236;
  __int16 v237;
  int v238;
  int v239;
  __int16 v240;
  int v241;
  int v242;
  int v243;
  int v244;
  __int16 v245;
  int v246;
  int v247;
  __int16 v248;
  int v249;
  int v250;
  __int16 v251;
  int v252;
  int v253;
  __int16 v254;
  int v255;
  int v256;
  __int16 v257;
  __int16 v258;
  int v259;
  __int16 v260;
  __int16 v261;
  __int16 v262;
  __int16 v263;
  __int16 v264;
  int v265;
  __int16 v266;
  __int16 v267;
  int v268;
  int v269;
  __int16 v270;
  __int16 v271;
  int v272;
  int v273;
  __int16 v274;
  int v275;
  int v276;
  __int16 v277;
  __int16 v278;
  int v279;
  int v280;
  int v281;
  __int16 v282;
  int v283;
  __int16 v284;
  int v285;
  int v286;
  __int16 v287;
  int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  __int16 v293;
  __int16 v294;
  int v295;
  __int16 v296;
  int v297;
  int v298;
  __int16 v299;
  __int16 v300;
  __int16 v301;

  v14 = (unsigned __int16)a2[13];
  if (a8)
    v15 = (unsigned __int16)a2[14];
  else
    v15 = (unsigned __int16)a2[13];
  if (!a8)
    v14 = (unsigned __int16)a2[12];
  v249 = v14;
  if (a8)
    v16 = (unsigned __int16)a2[12];
  else
    v16 = (unsigned __int16)a2[6];
  v238 = v16;
  if (a8)
    v17 = a2[11];
  else
    v17 = a2[14];
  v229 = v17;
  if (a8)
    v18 = a2[10];
  else
    v18 = a2[11];
  v221 = v18;
  if (a8)
    v19 = a2[7];
  else
    v19 = a2[10];
  v255 = v15;
  v258 = v19;
  if (a8)
    v20 = (unsigned __int16)a2[9];
  else
    v20 = (unsigned __int16)a2[7];
  if (a8)
    v21 = (unsigned __int16)a2[6];
  else
    v21 = (unsigned __int16)a2[8];
  v252 = v21;
  if (a8)
    v22 = a2[8];
  else
    v22 = a2[5];
  v223 = v20;
  v225 = v22;
  if (a8)
    v23 = (unsigned __int16)a2[5];
  else
    v23 = (unsigned __int16)a2[4];
  if (a8)
    v24 = a2[4];
  else
    v24 = a2[9];
  if (a8)
    v25 = (unsigned __int16)a2[2];
  else
    v25 = (unsigned __int16)a2[1];
  v227 = v25;
  if (a8)
    v26 = (unsigned __int16)a2[1];
  else
    v26 = (unsigned __int16)a2[2];
  v209 = v26;
  if (a8)
    v27 = (unsigned __int16)a1[14];
  else
    v27 = (unsigned __int16)a1[13];
  v241 = v23;
  v243 = v27;
  if (a8)
    v28 = (unsigned __int16)a1[13];
  else
    v28 = (unsigned __int16)a1[12];
  if (a8)
    v29 = (unsigned __int16)a1[12];
  else
    v29 = (unsigned __int16)a1[6];
  v215 = v29;
  v218 = v24;
  if (a8)
    v30 = a1[11];
  else
    v30 = a1[14];
  v212 = v30;
  if (a8)
    v31 = a1[10];
  else
    v31 = a1[11];
  if (a8)
    v32 = (unsigned __int16)a1[7];
  else
    v32 = (unsigned __int16)a1[10];
  v246 = v32;
  if (a8)
    v33 = (unsigned __int16)a1[9];
  else
    v33 = (unsigned __int16)a1[7];
  if (a8)
    v34 = (unsigned __int16)a1[6];
  else
    v34 = (unsigned __int16)a1[8];
  v232 = v28;
  v235 = v34;
  if (a8)
    v35 = a1[8];
  else
    v35 = a1[5];
  if (a8)
    v36 = (unsigned __int16)a1[5];
  else
    v36 = (unsigned __int16)a1[4];
  if (a8)
    v37 = a1[4];
  else
    v37 = a1[9];
  if (a8)
    v38 = (unsigned __int16)a1[2];
  else
    v38 = (unsigned __int16)a1[1];
  if (a8)
    v39 = (unsigned __int16)a1[1];
  else
    v39 = (unsigned __int16)a1[2];
  v40 = *a3;
  v41 = (unsigned __int16)a3[1];
  v42 = a3[2];
  v43 = a3[3];
  v283 = (unsigned __int16)a3[4];
  v285 = (unsigned __int16)a3[5];
  v44 = (unsigned __int16)a3[6];
  v45 = (unsigned __int16)a3[7];
  v261 = *a4;
  v271 = a4[3];
  v275 = (unsigned __int16)a4[4];
  v277 = v43;
  v46 = (unsigned __int16)a4[6];
  v47 = a4[7];
  v286 = *a5;
  v288 = a5[1];
  v290 = a5[2];
  v292 = a5[3];
  v295 = (unsigned __int16)a4[1];
  v265 = a5[4];
  v267 = a4[2];
  v269 = a5[5];
  v273 = a5[6];
  v279 = a5[7];
  v281 = (unsigned __int16)a4[5];
  v48 = *a6;
  v49 = a6[1];
  v50 = a6[2];
  v51 = a6[3];
  v52 = a6[4];
  v53 = a6[5];
  v54 = a6[6];
  v55 = a6[7];
  v56 = *a1;
  v57 = a1[3];
  v58 = a1[15];
  v59 = *a2;
  v60 = a2[3];
  v61 = a2[15];
  v300 = v47;
  v298 = v46;
  v263 = v40;
  if (a14)
  {
    v183 = v49;
    v184 = v55;
    v185 = v60;
    v186 = v33;
    v187 = v50;
    v188 = v31;
    v189 = v41;
    v194 = v51;
    v196 = v37;
    v198 = v52;
    v200 = v38;
    v202 = v53;
    v204 = v54;
    v190 = v42;
    v191 = v44;
    v192 = v45;
    v62 = v56 * v48;
    v63 = v35;
    if (a9)
    {
      v64 = v62;
      v65 = v229 * v51;
      v66 = (__int16)v238 * v52;
      v67 = (__int16)v232 * v202;
      v68 = (__int16)v241 * v202;
      v69 = (__int16)v249 * v202;
      v70 = (__int16)v243 * v204;
      v71 = (__int16)v252 * v204;
      v72 = (__int16)v255 * v204;
      v73 = v258 * v184;
      v74 = v64 << a10;
      v259 = ((__int16)v39 * v49) << a10;
      v256 = (v57 * v50) << a10;
      v230 = (v200 * v52) << a10;
      v250 = ((__int16)v235 * v204) << a10;
      v236 = ((__int16)v246 * v184) << a10;
      v239 = ((__int16)v36 * v202) << a10;
      v201 = (v63 * v48) << a10;
      v203 = ((__int16)v33 * v49) << a10;
      v205 = (v37 * v194) << a10;
      v206 = (v188 * v50) << a10;
      v247 = (v212 * v194) << a10;
      v207 = ((__int16)v215 * v52) << a10;
      v75 = v67 << a10;
      v253 = (v58 * v184) << a10;
      v76 = (v59 * v48) << a10;
      v233 = ((__int16)v209 * v49) << a10;
      v197 = (v218 * v194) << a10;
      v199 = (v185 * v50) << a10;
      v228 = ((__int16)v227 * v52) << a10;
      v242 = v68 << a10;
      v244 = v70 << a10;
      v77 = v71 << a10;
      v54 = v73 << a10;
      v224 = ((__int16)v223 * v49) << a10;
      v226 = (v225 * v48) << a10;
      v219 = v65 << a10;
      v222 = (v221 * v50) << a10;
      v216 = v66 << a10;
      v78 = v69 << a10;
      v79 = v72 << a10;
      v80 = (v61 * v184) << a10;
    }
    else
    {
      v111 = v225 * v48;
      v112 = (__int16)v235 * v204 + a13;
      v113 = v35 * v48 + a13;
      v114 = v212 * v51 + a13;
      v115 = (__int16)v215 * v198 + a13;
      v116 = (__int16)v243 * v204 + a13;
      v117 = v59 * v48 + a13;
      v118 = (__int16)v209 * v49 + a13;
      v119 = v218 * v194 + a13;
      v120 = (__int16)v227 * v198 + a13;
      v121 = (__int16)v252 * v204 + a13;
      v122 = v258 * v55 + a13;
      v123 = v111 + a13;
      v220 = v229 * v194 + a13;
      v217 = (__int16)v238 * v198 + a13;
      v214 = (__int16)v249 * v53 + a13;
      v211 = (__int16)v255 * v204 + a13;
      v74 = (v62 + a13) >> a12;
      v259 = ((__int16)v39 * v183 + a13) >> a12;
      v256 = (v57 * v187 + a13) >> a12;
      v205 = (v196 * v194 + a13) >> a12;
      v230 = (v200 * v198 + a13) >> a12;
      v239 = ((__int16)v36 * v53 + a13) >> a12;
      v250 = v112 >> a12;
      v236 = ((__int16)v246 * v55 + a13) >> a12;
      v201 = v113 >> a12;
      v203 = (v186 * v183 + a13) >> a12;
      v206 = (v31 * v187 + a13) >> a12;
      v207 = v115 >> a12;
      v75 = ((__int16)v232 * v53 + a13) >> a12;
      v244 = v116 >> a12;
      v247 = v114 >> a12;
      v253 = (v58 * v55 + a13) >> a12;
      v76 = v117 >> a12;
      v233 = v118 >> a12;
      v197 = v119 >> a12;
      v199 = (v185 * v187 + a13) >> a12;
      v228 = v120 >> a12;
      v242 = ((__int16)v241 * v53 + a13) >> a12;
      v77 = v121 >> a12;
      v54 = v122 >> a12;
      v224 = ((__int16)v223 * v183 + a13) >> a12;
      v226 = v123 >> a12;
      v219 = v220 >> a12;
      v222 = (v221 * v187 + a13) >> a12;
      v216 = v217 >> a12;
      v78 = v214 >> a12;
      v79 = v211 >> a12;
      v80 = (v61 * v55 + a13) >> a12;
    }
    v208 = v78;
    v210 = v80;
    v213 = v79;
    v110 = v40;
    v109 = v265;
    v97 = v40 + v74;
    v195 = v40 + v76;
    v44 = v191;
    v45 = v192;
    v91 = v283;
    v92 = v285;
    v102 = v279;
    v101 = v281;
    v103 = v275;
    v89 = v277;
    v105 = v271;
    v104 = v273;
    v107 = v189;
    v86 = v190;
    v108 = v267;
    v106 = v269;
    v94 = v259;
    v100 = v261;
    v99 = v253;
    v87 = v256;
    v90 = v247;
    v98 = v236;
    v96 = v239;
    v85 = v233;
  }
  else
  {
    v193 = v40 + v56 * v48;
    LOWORD(v201) = v35 * v48;
    v195 = v40 + v59 * v48;
    v81 = v225 * v48;
    v82 = v41;
    v83 = v41 + v39 * v49;
    v84 = v33 * v49;
    v85 = v41 + v209 * v49;
    v224 = v223 * v49;
    LOWORD(v226) = v81;
    v86 = v42;
    v87 = v42 + v57 * v50;
    LOWORD(v206) = v31 * v50;
    v88 = v42 + v60 * v50;
    v89 = v277;
    v203 = v84;
    LOWORD(v205) = v277 + v37 * v51;
    v90 = v212 * v51;
    LOWORD(v197) = v277 + v218 * v51;
    LOWORD(v199) = v88;
    LOWORD(v219) = v229 * v51;
    LOWORD(v222) = v221 * v50;
    v91 = v283;
    v92 = v285;
    v93 = v283 + v38 * v52;
    v94 = v83;
    v95 = v215 * v52;
    v228 = v283 + v227 * v52;
    v230 = v93;
    v216 = v238 * v52;
    v96 = v285 + v36 * v53;
    v75 = v232 * v53;
    v207 = v95;
    v208 = v249 * v53;
    v250 = v44 + v235 * v54;
    v242 = v285 + v241 * v53;
    v244 = v243 * v54;
    v97 = v193;
    v77 = v44 + v252 * v54;
    v213 = v255 * v54;
    v98 = v45 + v246 * v55;
    v99 = v58 * v55;
    v100 = v261;
    LOWORD(v54) = v45 + v258 * v55;
    v210 = v61 * v55;
    v102 = v279;
    v101 = v281;
    v104 = v273;
    v103 = v275;
    v106 = v269;
    v105 = v271;
    v107 = v82;
    v109 = v265;
    v108 = v267;
    v110 = v263;
  }
  if (v286)
    v97 = v110;
  v124 = v195;
  if (v286)
    v124 = v100;
  v287 = v124;
  if (v288)
    v125 = v107;
  else
    v125 = v94;
  v126 = v295;
  if (!v288)
    v126 = v85;
  v289 = v126;
  if (!v290)
    v86 = v87;
  v127 = v199;
  if (v290)
    v127 = v108;
  v296 = v127;
  if (v292)
    v128 = v89;
  else
    v128 = v205;
  v129 = v197;
  if (v292)
    v129 = v105;
  v293 = v129;
  if (v109)
    v130 = v91;
  else
    v130 = v230;
  if (v109)
    v131 = v103;
  else
    v131 = v228;
  if (v106)
    v132 = v92;
  else
    v132 = v96;
  if (v106)
    v133 = v101;
  else
    v133 = v242;
  if (v104)
    v134 = v44;
  else
    v134 = v250;
  if (v104)
    v135 = v298;
  else
    v135 = v77;
  if (v102)
    v136 = v45;
  else
    v136 = v98;
  if (v102)
    v137 = v300;
  else
    v137 = v54;
  v231 = v135;
  v138 = v97 + v201;
  v139 = v97 - v201;
  v140 = v125 + v203;
  v141 = v125 - v203;
  v142 = v86 + v206;
  v143 = v86 - v206;
  v144 = v128 + v90;
  v145 = v128 - v90;
  v146 = v130 + ((__int16)v207 >> 1);
  v147 = ((__int16)v130 >> 1) - v207;
  v148 = v132 + ((__int16)v75 >> 1);
  v149 = ((__int16)v132 >> 1) - v75;
  v150 = v134 + ((__int16)v244 >> 1);
  v151 = ((__int16)v134 >> 1) - v244;
  v152 = v136 + ((__int16)v99 >> 1);
  v153 = ((__int16)v136 >> 1) - v99;
  v248 = v139 - v147;
  v264 = v141 + v149;
  v257 = v139 + v147;
  v260 = v141 - v149;
  v301 = v144 + v152;
  v291 = v140 + v148 + ((__int16)(v144 + v152) >> 1);
  v284 = v138 + v146;
  v282 = v142 + v150;
  v299 = v138 + v146 + v142 + v150;
  *a7 = (__int16)(v299 + v291) >> 6;
  v262 = v145 + v153;
  v245 = v143 + v151;
  v274 = v139 + v147 + v143 + v151;
  v276 = v141 + v149 + ((__int16)(v145 + v153) >> 1);
  a7[1] = (__int16)(v274 + v276) >> 6;
  v251 = v143 - v151;
  v254 = v145 - v153;
  v270 = v139 - v147 + v143 - v151;
  v272 = v141 - v149 + ((__int16)(v145 - v153) >> 1);
  a7[2] = (__int16)(v270 + v272) >> 6;
  v234 = v142 - v150;
  v237 = v138 - v146;
  v240 = v144 - v152;
  v266 = v138 - v146 + v142 - v150;
  v268 = v140 - v148 + ((__int16)(v144 - v152) >> 1);
  a7[3] = (__int16)(v266 + v268) >> 6;
  v154 = v131 + ((__int16)v216 >> 1);
  v155 = v133 + ((__int16)v208 >> 1);
  v156 = v135 + ((__int16)v213 >> 1);
  v157 = v137 + (v210 >> 1);
  v158 = v293 + v219;
  v159 = v293 + v219 + v157;
  v160 = v289 + v224 + v155;
  LOWORD(v146) = v296 + v222;
  v161 = v287 + v226 + v154;
  v162 = v296 + v222 + v156;
  v278 = v161 + v162;
  v280 = v160 + (v159 >> 1);
  a7[4] = (__int16)(v161 + v162 + v280) >> 6;
  LOWORD(v147) = v296 - v222;
  LOWORD(v153) = v293 - v219;
  v163 = ((__int16)v131 >> 1) - v216;
  v164 = ((__int16)v133 >> 1) - v208;
  v165 = (v231 >> 1) - v213;
  v166 = (v137 >> 1) - v210;
  v167 = v153 + v166;
  v168 = v289 - v224 + v164;
  LOWORD(v151) = v296 - v222 + v165;
  v294 = v287 - v226 + v163 + v151;
  v297 = v289 - v224 + v164 + ((__int16)(v153 + v166) >> 1);
  a7[5] = (__int16)(v294 + v297) >> 6;
  v169 = v287 - v226 - v163;
  v170 = v289 - v224 - v164;
  LOWORD(v165) = v147 - v165;
  v171 = v153 - v166;
  v172 = v289 + v224 - v155;
  v173 = v158 - v157;
  v174 = v161 - v162;
  LOWORD(v163) = v287 - v226 + v163 - v151;
  LOWORD(v164) = v169 + v165;
  v175 = v169 - v165;
  LOWORD(v151) = v287 + v226 - v154 - (v146 - v156);
  LOWORD(v147) = ((__int16)(v140 + v148) >> 1) - v301;
  v176 = (v264 >> 1) - v262;
  LOWORD(v153) = (v260 >> 1) - v254;
  v177 = ((__int16)(v140 - v148) >> 1) - v240;
  v178 = ((__int16)v160 >> 1) - v159;
  v179 = (v168 >> 1) - v167;
  v180 = v170 + (v171 >> 1);
  v181 = ((__int16)v170 >> 1) - v171;
  LOWORD(v149) = (v172 >> 1) - v173;
  a7[6] = (__int16)(v164 + v180) >> 6;
  a7[7] = (__int16)(v287 + v226 - v154 + v146 - v156 + v172 + (v173 >> 1)) >> 6;
  a7[16] = (__int16)(v284 - v282 + v147) >> 6;
  a7[17] = (__int16)(v257 - v245 + v176) >> 6;
  a7[18] = (__int16)(v248 - v251 + v153) >> 6;
  a7[19] = (__int16)(v237 - v234 + v177) >> 6;
  a7[20] = (__int16)(v174 + v178) >> 6;
  a7[21] = (__int16)(v163 + v179) >> 6;
  a7[22] = (__int16)(v175 + v181) >> 6;
  result = (__int16)(v248 - v251 - v153) >> 6;
  a7[23] = (__int16)(v151 + v149) >> 6;
  a7[32] = (__int16)(v284 - v282 - v147) >> 6;
  a7[33] = (__int16)(v257 - v245 - v176) >> 6;
  a7[34] = result;
  a7[35] = (__int16)(v237 - v234 - v177) >> 6;
  a7[36] = (__int16)(v174 - v178) >> 6;
  a7[37] = (__int16)(v163 - v179) >> 6;
  a7[38] = (__int16)(v175 - v181) >> 6;
  a7[39] = (__int16)(v151 - v149) >> 6;
  a7[48] = (__int16)(v299 - v291) >> 6;
  a7[49] = (__int16)(v274 - v276) >> 6;
  a7[50] = (__int16)(v270 - v272) >> 6;
  a7[51] = (__int16)(v266 - v268) >> 6;
  a7[52] = (__int16)(v278 - v280) >> 6;
  a7[53] = (__int16)(v294 - v297) >> 6;
  a7[54] = (__int16)(v164 - v180) >> 6;
  a7[55] = (__int16)(v287 + v226 - v154 + v146 - v156 - (v172 + (v173 >> 1))) >> 6;
  return result;
}

uint64_t sub_1B6900C48(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __int32 *v16;
  int v17;
  __int32 v18;
  uint64_t result;
  unsigned int v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  int v31;
  int v33;
  char v34;
  _DWORD v36[2];
  char *v37;
  char *v38;
  int v39;
  int32x4_t v40;
  uint64_t v41;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  v41 = *MEMORY[0x1E0C80C00];
  v36[0] = (a4 & 0x1F) + 15;
  v36[1] = ((0x8000 << a4) / 3) >> 1;
  v10 = (a4 >> 1) & 0x70;
  v39 = a4 & 0x1F;
  v37 = (char *)&unk_1EF138120 + v10;
  v38 = (char *)asc_1EF138180 + v10;
  v11 = 1;
  do
  {
    v12 = 0;
    v13 = 0;
    v34 = v11;
    v14 = a2 + ((uint64_t)v9 << 7);
    v33 = v9;
    v15 = v9;
    do
    {
      v16 = &v40.i32[v15];
      off_1EF13A4C0(v36, a1 + 2 * (v13 | v7), v14, v16, a5);
      if (*v16)
      {
        v17 = off_1EF13A4E8(v14, &v40.i8[v15 * 4]);
        v8 += v17;
        v18 = *v16;
        if (!v17)
          v18 = 0;
        *v16 = v18;
      }
      ++v12;
      v14 += 128;
      ++v15;
      v13 = 8;
    }
    while ((_DWORD)v12 != 2);
    v11 = 0;
    v9 = v33 + 2;
    v7 = 128;
  }
  while ((v34 & 1) != 0);
  result = 0;
  if (a3)
  {
    v20 = vaddvq_s32((int32x4_t)vbicq_s8((int8x16_t)xmmword_1B6917D10, (int8x16_t)vceqzq_s32(v40)));
    v21 = v20;
    if (v20 && (v8 - 1) >= 5)
    {
      v23 = 0;
      v24 = 0;
      v25 = 1;
      do
      {
        v26 = 0;
        v27 = 0;
        v28 = v25;
        v29 = v24;
        v30 = a2 + ((uint64_t)v24 << 7);
        v31 = 4 * v24;
        do
        {
          off_1EF13A4C8(v36, v30, a3 + 2 * (v27 | v23), &v40.i8[v31], a5);
          ++v26;
          v30 += 128;
          v31 += 4;
          v27 = 8;
        }
        while ((_DWORD)v26 != 2);
        v25 = 0;
        v24 = v29 + 2;
        v23 = 128;
      }
      while ((v28 & 1) != 0);
      return v21;
    }
  }
  return result;
}

uint64_t sub_1B6900E90(unsigned __int8 *a1)
{
  unsigned __int8 *v1;
  unint64_t v2;
  char v3;
  int v4;
  uint64_t v5;
  _DWORD v7[2];
  char *v8;
  char *v9;
  int v10;
  _BYTE v11[16];
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 912;
  v2 = a1[1];
  v3 = (byte_1B693B900[*a1] & 0x20) == 0;
  v4 = v2 & 0x1F;
  v7[0] = v4 + 15;
  v7[1] = ((0x8000 << v2) / 3) >> v3;
  v5 = (v2 >> 1) & 0x70;
  v10 = v4;
  v8 = (char *)&unk_1EF138120 + v5;
  v9 = (char *)asc_1EF138180 + v5;
  off_1EF13A4D0(v7, a1 + 144, a1 + 656, a1 + 784, 0, v11, v12);
  return off_1EF13A4D8(v7, v12, v1);
}

uint64_t sub_1B6900F94(uint64_t result, unsigned __int8 a2, uint64_t a3, unsigned int a4, uint64_t a5, _DWORD *a6, uint64_t a7)
{
  char v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char v13;
  uint64_t v14;
  char v15;
  int v16;
  int v17;
  int v18;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  char v24;
  int v25;
  int v26;
  int v27;
  BOOL v28;
  int v29;
  int v30;

  v7 = a2 & 0x1F;
  v8 = 1431655766 * (1 << ((a2 & 0x1F) + 15));
  v9 = 2 * (HIDWORD(v8) + (v8 >> 63));
  v10 = a2 >> 5;
  v11 = (char *)&unk_1B693B990 + 768 * a4 + 128 * v10;
  v12 = (char *)&unk_1B693B600 + 128 * v10;
  *a6 = 0;
  v13 = (a2 & 0x1F) - 6;
  if ((a2 & 0x1Fu) >= 6)
  {
    v14 = 0;
    v15 = (a2 & 0x1F) + 16;
    while (1)
    {
      v16 = *(__int16 *)(result + 2 * v14);
      v17 = v16 >= 0 ? *(__int16 *)(result + 2 * v14) : -v16;
      v18 = (v9 + v17 * *(unsigned __int16 *)&v11[2 * v14]) >> v15;
      if (!*a6 && v18 != 0)
        break;
      if (v18)
        goto LABEL_13;
      LOWORD(v20) = 0;
      *(_WORD *)(a5 + 2 * (unsigned __int16)word_1B693BF90[v14]) = 0;
LABEL_21:
      *(_WORD *)(a7 + 2 * v14++) = v20;
      if (v14 == 64)
        return result;
    }
    *a6 = 1;
LABEL_13:
    v21 = (v18 ^ (v16 >> 31)) - (v16 >> 31);
    if (v21 >= 0x7FFF)
      v21 = 0x7FFF;
    if (v21 <= -32768)
      v21 = -32768;
    *(_WORD *)(a5 + 2 * (unsigned __int16)word_1B693BF90[v14]) = v21;
    v20 = (v21 * *(unsigned __int16 *)&v12[2 * v14] * *(unsigned __int8 *)(a3 + v14)) << v13;
    if (v20 >= 0x7FFF)
      v20 = 0x7FFF;
    if (v20 <= -32768)
      LOWORD(v20) = 0x8000;
    goto LABEL_21;
  }
  v22 = 0;
  v23 = 0x20u >> v7;
  v24 = 6 - v7;
  do
  {
    v25 = *(__int16 *)(result + 2 * v22);
    if (v25 >= 0)
      v26 = *(__int16 *)(result + 2 * v22);
    else
      v26 = -v25;
    v27 = (v9 + v26 * *(unsigned __int16 *)&v11[2 * v22]) >> ((a2 & 0x1F) + 16);
    if (*a6)
      v28 = 1;
    else
      v28 = v27 == 0;
    if (v28)
    {
      if (!v27)
      {
        LOWORD(v29) = 0;
        *(_WORD *)(a5 + 2 * (unsigned __int16)word_1B693BF90[v22]) = 0;
        goto LABEL_42;
      }
    }
    else
    {
      *a6 = 1;
    }
    v30 = (v27 ^ (v25 >> 31)) - (v25 >> 31);
    if (v30 >= 0x7FFF)
      v30 = 0x7FFF;
    if (v30 <= -32768)
      v30 = -32768;
    *(_WORD *)(a5 + 2 * (unsigned __int16)word_1B693BF90[v22]) = v30;
    v29 = (int)(v23 + v30 * *(unsigned __int16 *)&v12[2 * v22] * *(unsigned __int8 *)(a3 + v22)) >> v24;
    if (v29 >= 0x7FFF)
      v29 = 0x7FFF;
    if (v29 <= -32768)
      LOWORD(v29) = 0x8000;
LABEL_42:
    *(_WORD *)(a7 + 2 * v22++) = v29;
  }
  while (v22 != 64);
  return result;
}

uint64_t sub_1B6901168(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  unsigned __int8 *v4;
  __int16 *v5;
  unsigned __int8 *v6;
  _OWORD *v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  __int16 *v12;
  uint64_t v13;
  uint64_t result;
  int32x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int32x2_t v22;
  int32x2_t v23;
  int32x2_t v24;
  int32x2_t v25;
  int32x2_t v26;
  int32x2_t v27;
  uint32x2_t v28;
  uint32x2_t v29;
  int32x2_t v30;
  int32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  int32x2_t v34;
  int32x2_t v35;
  uint64_t v36;
  int16x4_t v37;
  int32x2_t v38;
  int32x2_t v39;
  int32x2_t v40;
  int16x4_t v41;
  int32x2_t v42;
  int16x4_t *v43;
  __int16 v44;
  __int16 v45;
  __int32 v46;
  __int32 v47;
  __int32 v48;
  __int32 v49;
  __int32 v50;
  __int32 v51;
  unsigned __int8 *v52;
  BOOL v53;
  __int16 v54;
  int v55;
  int v56;
  int v57;
  int v58;
  __int16 v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  int v64;
  int v65;
  int v66;
  __int16 v67;
  int v68;
  int v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  int v75;
  int v76;
  int v77;
  __int16 v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  __int16 v84;
  __int16 v85;
  __int16 v86;
  __int16 v87;
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
  _WORD *v100;
  __int16 v101;
  __int16 v102;
  __int16 v103;
  __int16 v104;
  int v105;
  int v106;
  __int16 v107;
  int v108;
  __int16 v109;
  __int16 v110;
  __int16 v111;
  int v112;
  unsigned __int8 *v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  _OWORD *v123;
  int v124;
  __int16 v125;
  __int16 v126;
  __int16 v127;
  __int16 v128;
  __int16 v129;
  __int16 v130;
  __int16 v131;
  __int16 v132;
  __int16 v133;
  __int16 v134;
  __int16 v135;
  int v136;
  __int16 v137;
  __int16 v138;
  int v139;
  __int16 v140;
  int v141;
  __int16 v142;
  int v143;
  int v144;
  __int16 v145;
  int v146;
  int v147;
  int v148;
  __int16 v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  __int16 v157;
  __int16 v158;
  int v159;
  __int16 v160;
  __int16 v161;
  __int16 v162;
  int v163;
  int v164;
  int v165;
  int v166;
  __int16 v167;
  __int16 v168;
  __int16 v169;
  __int16 v170;
  __int32 v171;
  __int32 v172;
  __int32 v173;
  __int32 v174;
  __int32 v175;
  __int32 v176;
  uint64_t v177;
  unsigned __int8 *v178;
  _DWORD v179[2];
  char *v180;
  __int16 *v181;
  int v182;
  _DWORD v183[4];
  _BYTE v184[16];
  uint64_t v185;

  v2 = a2;
  v185 = *MEMORY[0x1E0C80C00];
  v4 = a1 + 656;
  v5 = (__int16 *)(a1 + 912);
  v6 = a1 + 784;
  v7 = a1 + 400;
  v8 = a1[1];
  v9 = (byte_1B693B900[*a1] & 0x20) == 0;
  v10 = v8 & 0x1F;
  v179[0] = (v8 & 0x1F) + 15;
  v179[1] = ((0x8000 << v8) / 3) >> v9;
  v11 = (v8 >> 2) & 0x38;
  v182 = v8 & 0x1F;
  v180 = (char *)&unk_1EF138120 + 2 * v11;
  v181 = &asc_1EF138180[v11];
  off_1EF13A4D0(v179, a1 + 144, a1 + 656, a1 + 784, a2, v183, v184);
  v13 = off_1EF13A4D8(v179, v184, v5);
  result = off_1EF13A4F0(v4, v6, v183[0], v183[1], v13);
  v113 = a1;
  v112 = result;
  if ((_DWORD)result)
  {
    v12 = &asc_1EF138180[v11];
    v15.i16[0] = *v5;
    v15.i16[2] = *((_WORD *)a1 + 460);
    v19 = vdup_n_s32((unsigned __int16)*v12 << v10);
    v20 = vshl_n_s32(vmul_s32(v15, v19), 0x10uLL);
    v16.i16[0] = *((_WORD *)a1 + 457);
    v16.i16[2] = *((_WORD *)a1 + 461);
    v21 = vshl_n_s32(vmul_s32(v16, v19), 0x10uLL);
    v17.i16[0] = *((_WORD *)a1 + 458);
    v17.i16[2] = *((_WORD *)a1 + 462);
    v18.i16[0] = *((_WORD *)a1 + 459);
    v18.i16[2] = *((_WORD *)a1 + 463);
    v22 = vshr_n_s32(vshl_n_s32(vmul_s32(v17, v19), 0x10uLL), 0x10uLL);
    v23 = vshr_n_s32(vshl_n_s32(vmul_s32(v18, v19), 0x10uLL), 0x10uLL);
    v24 = vsub_s32(vshr_n_s32(v20, 0x10uLL), v22);
    v25 = vsra_n_s32(v22, v20, 0x10uLL);
    v26 = vsub_s32(vshr_n_s32(v21, 0x10uLL), v23);
    v27 = vsra_n_s32(v23, v21, 0x10uLL);
    v28 = (uint32x2_t)vsub_s32(v25, v27);
    v29 = (uint32x2_t)vsub_s32(v24, v26);
    v30 = vhadd_s32(v27, v25);
    v31 = vhadd_s32(v26, v24);
    v32 = vadd_s32(v30, (int32x2_t)0x2000000020);
    v33 = (int32x2_t)vsra_n_u32((uint32x2_t)0x2000000020, v28, 1uLL);
    v34 = vadd_s32(v31, (int32x2_t)0x2000000020);
    v35 = (int32x2_t)vsra_n_u32((uint32x2_t)0x2000000020, v29, 1uLL);
    if ((result & 2) != 0)
    {
      v177 = 0;
      v121 = (unsigned __int16)*v12 << v10;
      v119 = (unsigned __int16)asc_1EF138180[v11 | 6] << v10;
      v120 = (unsigned __int16)asc_1EF138180[v11 | 7] << v10;
      v117 = (unsigned __int16)asc_1EF138180[v11 | 4] << v10;
      v118 = (unsigned __int16)asc_1EF138180[v11 | 5] << v10;
      v115 = (unsigned __int16)asc_1EF138180[v11 | 2] << v10;
      v116 = (unsigned __int16)asc_1EF138180[v11 | 3] << v10;
      v114 = (unsigned __int16)asc_1EF138180[v11 | 1] << v10;
      v44 = v32.i16[0];
      v45 = v32.i16[2];
      v46 = v33.i32[0];
      v47 = v33.i32[1];
      v48 = v34.i32[0];
      v49 = v34.i32[1];
      v50 = v35.i32[0];
      v51 = v35.i32[1];
      v52 = a1 + 814;
      v123 = v7;
      v122 = v2;
      do
      {
        v178 = v52;
        v171 = v51;
        v172 = v47;
        v173 = v48;
        v174 = v46;
        v175 = v50;
        v176 = v49;
        v53 = v2 == 0;
        v54 = *((_WORD *)v52 - 1);
        if (v2)
          v55 = *((unsigned __int16 *)v52 - 1);
        else
          v55 = *((unsigned __int16 *)v52 - 2);
        v155 = v55;
        v56 = *((unsigned __int16 *)v52 - 3);
        if (v2)
          v57 = *((unsigned __int16 *)v52 - 2);
        else
          v57 = *((unsigned __int16 *)v52 - 3);
        v58 = *((unsigned __int16 *)v52 - 9);
        if (v2)
        {
          v59 = *((_WORD *)v178 - 4);
        }
        else
        {
          v56 = v58;
          v59 = v54;
        }
        if (v2)
          v60 = *((_WORD *)v178 - 5);
        else
          v60 = *((_WORD *)v178 - 4);
        if (v2)
          v61 = *((unsigned __int16 *)v178 - 6);
        else
          v61 = *((unsigned __int16 *)v178 - 8);
        if (v2)
          v62 = *((_WORD *)v178 - 7);
        else
          v62 = *((_WORD *)v178 - 10);
        if (v2)
          v63 = *((unsigned __int16 *)v178 - 8);
        else
          v63 = *((unsigned __int16 *)v178 - 5);
        v151 = v63;
        if (v2)
          v64 = v58;
        else
          v64 = *((unsigned __int16 *)v178 - 7);
        if (v2)
          v65 = *((unsigned __int16 *)v178 - 10);
        else
          v65 = *((unsigned __int16 *)v178 - 11);
        if (v2)
          v66 = *((unsigned __int16 *)v178 - 13);
        else
          v66 = *((unsigned __int16 *)v178 - 14);
        if (v2)
          v67 = *((_WORD *)v178 - 11);
        else
          v67 = *((_WORD *)v178 - 6);
        if (v2)
          v68 = *((unsigned __int16 *)v178 - 14);
        else
          v68 = *((unsigned __int16 *)v178 - 13);
        if (v2)
          v69 = *((unsigned __int16 *)v178 - 65);
        else
          v69 = *((unsigned __int16 *)v178 - 66);
        if (v2)
          v70 = *((unsigned __int16 *)v178 - 66);
        else
          v70 = *((unsigned __int16 *)v178 - 67);
        if (v2)
          v71 = *((_WORD *)v178 - 67);
        else
          v71 = *((_WORD *)v178 - 73);
        if (v2)
          v72 = *((unsigned __int16 *)v178 - 68);
        else
          v72 = *((unsigned __int16 *)v178 - 65);
        if (v2)
          v73 = *((_WORD *)v178 - 69);
        else
          v73 = *((_WORD *)v178 - 68);
        v74 = *((unsigned __int16 *)v178 - 72);
        v75 = *((unsigned __int16 *)v178 - 70);
        if (v2)
          v76 = *((unsigned __int16 *)v178 - 70);
        else
          v76 = *((unsigned __int16 *)v178 - 72);
        if (v53)
        {
          v74 = *((unsigned __int16 *)v178 - 69);
          v77 = *((unsigned __int16 *)v178 - 71);
        }
        else
        {
          v77 = *((unsigned __int16 *)v178 - 73);
        }
        if (v53)
          v78 = *((_WORD *)v178 - 74);
        else
          v78 = *((_WORD *)v178 - 71);
        if (v53)
          v79 = *((unsigned __int16 *)v178 - 75);
        else
          v79 = *((unsigned __int16 *)v178 - 74);
        if (v53)
        {
          v80 = *((unsigned __int16 *)v178 - 78);
        }
        else
        {
          v75 = *((unsigned __int16 *)v178 - 75);
          v80 = *((unsigned __int16 *)v178 - 77);
        }
        if (v53)
          v81 = *((unsigned __int16 *)v178 - 77);
        else
          v81 = *((unsigned __int16 *)v178 - 78);
        v145 = v78 * v121 + v44;
        v167 = v44 - v78 * v121;
        v162 = v62 * v121 + v45;
        v169 = v45 - v62 * v121;
        v82 = v114;
        v147 = v76 * v114 + v81 * v114;
        v163 = v81 * v114 - v76 * v114;
        v83 = v61 * v82 + v68 * v82;
        v165 = v68 * v82 - v61 * v82;
        v84 = *((_WORD *)v178 - 76) * v115;
        v142 = v73 * v115 + v84;
        v158 = v84 - v73 * v115;
        v85 = *((_WORD *)v178 - 12) * v115;
        v86 = v60 * v115;
        v87 = v60 * v115 + v85;
        v160 = v85 - v86;
        v153 = v72 * v116 + v75 * v116;
        v156 = v75 * v116 - v72 * v116;
        v128 = v59 * v116 + v67 * v116;
        v157 = v67 * v116 - v59 * v116;
        v144 = v80 * v117 + ((__int16)(v71 * v117) >> 1);
        v88 = v56 * v117;
        v89 = v66 * v117 + ((__int16)(v56 * v117) >> 1);
        v154 = ((v66 * v117) << 16 >> 17) - v88;
        v146 = v79 * v118 + ((__int16)(v70 * v118) >> 1);
        v90 = ((v79 * v118) << 16 >> 17) - v70 * v118;
        v91 = v65 * v118 + ((__int16)(v57 * v118) >> 1);
        v124 = v91;
        v150 = ((v65 * v118) << 16 >> 17) - v57 * v118;
        v143 = v77 * v119 + ((__int16)(v69 * v119) >> 1);
        v92 = ((v77 * v119) << 16 >> 17) - v69 * v119;
        v93 = v64 * v119 + ((__int16)(v155 * v119) >> 1);
        v94 = ((v64 * v119) << 16 >> 17) - v155 * v119;
        v95 = *((unsigned __int16 *)v178 - 64) * v120;
        v148 = v74 * v120 + ((__int16)v95 >> 1);
        v96 = ((v74 * v120) << 16 >> 17) - v95;
        v97 = *(unsigned __int16 *)v178 * v120;
        v98 = v151 * v120 + ((__int16)v97 >> 1);
        v129 = v98;
        v99 = ((v151 * v120) << 16 >> 17) - v97;
        v152 = v146 + v147 + ((__int16)(v148 + v153) >> 1);
        v100 = (_WORD *)((char *)v123 + *((unsigned __int8 *)&word_1B693B2E4 + v177 + 16));
        v149 = v143 + v142 + v144 + v145;
        *v100 = (__int16)(v152 + v149) >> 6;
        v133 = v91 + v83;
        v134 = v98 + v128;
        v141 = v91 + v83 + ((__int16)(v98 + v128) >> 1);
        LOWORD(v98) = v89;
        v101 = v89 + v162;
        v102 = v93;
        v140 = v93 + v87 + v89 + v162;
        v100[1] = (__int16)(v141 + v140) >> 6;
        v131 = v156 + v96;
        v132 = v90 + v163;
        v139 = v90 + v163 + ((__int16)(v156 + v96) >> 1);
        v135 = ((__int16)(v80 * v117) >> 1) - v71 * v117 + v167;
        v103 = v92 + v158;
        v138 = v92 + v158 + v135;
        v100[2] = (__int16)(v139 + v138) >> 6;
        v130 = v150 + v165;
        v136 = v150 + v165 + ((__int16)(v157 + v99) >> 1);
        v127 = v154 + v169;
        v104 = v94 + v160;
        v137 = v94 + v160 + v154 + v169;
        v100[3] = (__int16)(v136 + v137) >> 6;
        v125 = v163 - v90;
        v126 = v167 - (((__int16)(v80 * v117) >> 1) - v71 * v117);
        LOWORD(v92) = v158 - v92;
        v105 = v156 - v96;
        v164 = v163 - v90 + ((__int16)(v156 - v96) >> 1);
        v168 = v92 + v126;
        v100[4] = (__int16)(v164 + v92 + v126) >> 6;
        LOWORD(v91) = v169 - v154;
        LOWORD(v156) = v165 - v150;
        LOWORD(v89) = v160 - v94;
        v166 = v165 - v150 + ((__int16)(v157 - v99) >> 1);
        v170 = v160 - v94 + v169 - v154;
        v100[5] = (__int16)(v166 + v170) >> 6;
        result = (v153 - v148);
        v159 = v147 - v146 + ((__int16)(v153 - v148) >> 1);
        v161 = v142 - v143 + v145 - v144;
        v100[6] = (__int16)(v159 + v161) >> 6;
        LOWORD(v82) = v83 - v124;
        v106 = v83 - v124 + ((__int16)(v128 - v129) >> 1);
        v100[7] = (__int16)(v83 - v124 + ((__int16)(v128 - v129) >> 1) + v87 - v93 + v162 - v98) >> 6;
        v100[16] = (__int16)(v144 + v145 - (v143 + v142) + ((__int16)(v146 + v147) >> 1) - (v148 + v153)) >> 6;
        v107 = v101 - (v93 + v87);
        v100[17] = (__int16)(v107 + (v133 >> 1) - v134) >> 6;
        v100[18] = (__int16)(v135 - v103 + (v132 >> 1) - v131) >> 6;
        v2 = v122;
        v100[19] = (__int16)(v127 - v104 + (v130 >> 1) - (v157 + v99)) >> 6;
        LOWORD(v92) = v126 - v92;
        v108 = (v125 >> 1) - v105;
        v100[20] = (__int16)(v92 + v108) >> 6;
        LOWORD(v89) = v91 - v89;
        LOWORD(v93) = ((__int16)v156 >> 1) - (v157 - v99);
        v100[21] = (__int16)(v89 + v93) >> 6;
        v109 = v145 - v144 - (v142 - v143);
        v110 = ((__int16)(v147 - v146) >> 1) - (v153 - v148);
        v100[22] = (__int16)(v109 + v110) >> 6;
        v111 = v162 - v98 - (v87 - v102);
        LOWORD(v97) = ((__int16)v82 >> 1) - (v128 - v129);
        v100[23] = (__int16)(v111 + v97) >> 6;
        v100[32] = (__int16)(v144 + v145 - (v143 + v142) - (((__int16)(v146 + v147) >> 1) - (v148 + v153))) >> 6;
        v100[33] = (__int16)(v107 - ((v133 >> 1) - v134)) >> 6;
        v100[34] = (__int16)(v135 - v103 - ((v132 >> 1) - v131)) >> 6;
        v100[35] = (__int16)(v127 - v104 - ((v130 >> 1) - (v157 + v99))) >> 6;
        v100[36] = (__int16)(v92 - v108) >> 6;
        v100[37] = (__int16)(v89 - v93) >> 6;
        v100[38] = (__int16)(v109 - v110) >> 6;
        v100[39] = (__int16)(v111 - v97) >> 6;
        v100[48] = (__int16)(v149 - v152) >> 6;
        v100[49] = (__int16)(v140 - v141) >> 6;
        v100[50] = (__int16)(v138 - v139) >> 6;
        v100[51] = (__int16)(v137 - v136) >> 6;
        v100[52] = (__int16)(v168 - v164) >> 6;
        v100[53] = (__int16)(v170 - v166) >> 6;
        v100[54] = (__int16)(v161 - v159) >> 6;
        v46 = v173;
        v44 = v174;
        v49 = v171;
        v45 = v172;
        v48 = v175;
        v47 = v176;
        v100[55] = (__int16)(v87 - v102 + v162 - v98 - v106) >> 6;
        v52 = v178 + 32;
        v51 = v172;
        v50 = v174;
        ++v177;
      }
      while (v177 != 4);
    }
    else
    {
      v36 = 0;
      v37 = (int16x4_t)vshr_n_s32(vshr_n_s32(vshl_n_s32(v32, 0x10uLL), 0x10uLL), 6uLL);
      v38 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v33, 0x10uLL), 0x10uLL), 6uLL);
      v39 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v34, 0x10uLL), 0x10uLL), 6uLL);
      v40 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v35, 0x10uLL), 0x10uLL), 6uLL);
      do
      {
        v41 = vuzp1_s16(v37, v37);
        v42 = v38;
        v43 = (int16x4_t *)((char *)v7 + *((unsigned __int8 *)&word_1B693B2E4 + v36 + 16));
        *v43 = v41;
        v43[1] = v41;
        v43[4] = v41;
        v43[5] = v41;
        v43[8] = v41;
        v43[9] = v41;
        ++v36;
        v38 = v39;
        v43[12] = v41;
        v43[13] = v41;
        v39 = v40;
        v40 = v42;
        v37 = (int16x4_t)v42;
      }
      while (v36 != 4);
    }
  }
  else
  {
    v7[14] = 0u;
    v7[15] = 0u;
    v7[12] = 0u;
    v7[13] = 0u;
    v7[10] = 0u;
    v7[11] = 0u;
    v7[8] = 0u;
    v7[9] = 0u;
    v7[6] = 0u;
    v7[7] = 0u;
    v7[4] = 0u;
    v7[5] = 0u;
    v7[2] = 0u;
    v7[3] = 0u;
    *v7 = 0u;
    v7[1] = 0u;
  }
  *((_DWORD *)v113 + 2) = v112;
  return result;
}

uint64_t sub_1B6901C8C(uint64_t a1, unint64_t a2, uint64_t a3, __int16 *a4, __int16 *a5, uint64_t a6)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __int16 *v16;
  int v17;
  int v18;
  int8x16_t v19;
  int32x4_t v20;
  int16x8_t v21;
  int32x4_t v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  __int16 v39;
  __int16 v40;
  __int16 v41;
  __int16 v42;
  __int16 v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  __int16 v55;
  __int16 v56;
  __int16 v57;
  __int16 v58;
  __int16 v59;
  __int16 v60;
  __int16 v61;
  __int16 v62;
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
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int32x2_t v112;
  int32x2_t v113;
  int32x2_t v114;
  int32x2_t v115;
  int32x2_t v116;
  int32x2_t v117;
  int32x2_t v118;
  int32x2_t v119;
  int32x2_t v120;
  int32x2_t v121;
  int32x2_t v122;
  int32x2_t v123;
  int32x2_t v124;
  int32x2_t v125;
  int32x2_t v126;
  int32x2_t v127;
  int32x2_t v128;
  int32x2_t v129;
  int32x2_t v130;
  int32x2_t v131;
  int32x2_t v132;
  int32x2_t v133;
  int32x2_t v134;
  int32x2_t v135;
  int32x2_t v136;
  int32x2_t v137;
  int32x2_t v138;
  int8x8_t v139;
  int32x2_t v140;
  int32x2_t v141;
  int32x2_t v142;
  int32x2_t v143;
  int32x2_t v144;
  __int16 v145;
  __int16 v146;
  __int16 v147;
  __int16 v148;
  int v149;
  __int16 v150;
  __int16 v151;
  __int16 v152;
  int v153;
  int v154;
  __int16 v155;
  __int16 v156;
  int v157;
  int v158;
  int v159;
  int v160;
  __int16 v161;
  int v162;
  int v163;
  __int16 v164;
  int v165;
  __int16 v166;
  int v167;
  char v168;
  __int16 v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int8x8_t v200;
  int8x8_t v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  int v215;
  int32x2_t v216;
  int32x2_t v217;
  int32x2_t v218;
  int32x2_t v219;
  int32x2_t v220;
  int32x2_t v221;
  int32x2_t v222;
  int32x2_t v223;
  int32x2_t v224;
  __int16 *v225;
  uint64_t v226;
  int32x2_t v227;
  int32x2_t v228;
  int32x2_t v229;
  int32x2_t v230;
  int32x2_t v231;
  int32x2_t v232;
  int32x2_t v233;
  uint64_t v234;
  int16x4_t v235;
  int16x4_t v236;
  uint64_t v237;
  int32x2_t v238;
  int32x2_t v239;
  int32x2_t v240;
  int32x2_t v241;
  int32x2_t v242;
  int32x2_t v243;
  int32x2_t v244;
  int8x16_t v245;
  int32x2_t v246;
  int16x4_t *v247;
  int16x4_t v248;
  unsigned int v250;
  uint16x4_t *v251;
  char v252;
  unsigned int v253;
  char v256;
  _BOOL4 v257;
  _DWORD v258[2];
  char *v259;
  char *v260;
  int v261;
  int v262;
  int v263;
  int v264;
  int v265;
  int v266;
  int32x4_t v267;
  int16x8_t v268;
  __int16 v269;
  _QWORD v270[3];

  v9 = 0;
  v10 = 0;
  *(_QWORD *)((char *)&v270[1] + 6) = *MEMORY[0x1E0C80C00];
  v258[0] = (a2 & 0x1F) + 15;
  v258[1] = (0x8000 << a2) / 3;
  v11 = (a2 >> 1) & 0x70;
  v261 = a2 & 0x1F;
  v259 = (char *)&unk_1EF138120 + v11;
  v260 = (char *)asc_1EF138180 + v11;
  v251 = (uint16x4_t *)((char *)asc_1EF138180 + v11);
  v252 = a2;
  v12 = 1;
  do
  {
    v13 = 0;
    v14 = 0;
    v256 = v12;
    v15 = v10;
    v16 = &a5[64 * (uint64_t)v10];
    v17 = 4 * v10;
    do
    {
      off_1EF13A4B0(v258, a1 + 2 * (v14 | v9), v16, (char *)&v262 + v17, a6, &a4[v17]);
      ++v13;
      v16 += 64;
      v17 += 4;
      v14 = 8;
    }
    while ((_DWORD)v13 != 2);
    v12 = 0;
    v10 = v15 + 2;
    v9 = 128;
  }
  while ((v256 & 1) != 0);
  v257 = (v262 | v263 | v264 | v265) == 0;
  if (v262 | v263 | v264 | v265)
    v18 = 15;
  else
    v18 = 0;
  off_1EF13A4B8(v258, a4, a6);
  v250 = v18;
  v266 = v18;
  v20 = vdupq_n_s32(v252 & 0x1F);
  v21 = (int16x8_t)vshlq_u32(vmovl_u16(*v251), (uint32x4_t)v20);
  v22 = (int32x4_t)vuzp1q_s16(v21, (int16x8_t)vshlq_u32(vmovl_high_u16(*(uint16x8_t *)v251->i8), (uint32x4_t)v20));
  v267 = v22;
  if (6 * (v252 & 0x1F) + ((v252 & 0xE0) >> 5) < 9u)
  {
    v21.i32[0] = 0;
    v145 = a4[10];
    if ((_DWORD)a6)
      v146 = a4[10];
    else
      v146 = a4[11];
    v147 = a4[13];
    if ((_DWORD)a6)
      v148 = a4[14];
    else
      v148 = a4[13];
    v149 = v146 - v148;
    v150 = a4[6];
    v151 = a4[8];
    if ((_DWORD)a6)
      v152 = a4[6];
    else
      v152 = a4[8];
    v153 = a4[3];
    v154 = v153 - v152;
    v155 = a4[9];
    if ((_DWORD)a6)
      v156 = a4[4];
    else
      v156 = a4[9];
    if ((_DWORD)a6)
      v145 = a4[7];
    v157 = v156 - v145;
    if ((_DWORD)a6)
      v150 = a4[12];
    else
      v151 = a4[5];
    v158 = v151 - v150;
    v159 = v153 + v152;
    v160 = v148 + v146;
    if ((_DWORD)a6)
      v161 = a4[2];
    else
      v161 = a4[1];
    if (!(_DWORD)a6)
    {
      v155 = a4[7];
      v147 = a4[12];
    }
    v162 = *a4;
    v163 = v162 - v161;
    if ((_DWORD)a6)
      v164 = a4[1];
    else
      v164 = a4[2];
    v165 = v155 - v147;
    if ((_DWORD)a6)
      v166 = a4[5];
    else
      v166 = a4[4];
    v167 = v164 - v166;
    v20.i32[0] = v22.i8[0] & 3;
    v168 = 2 * ((v22.i8[0] & 3) != 0);
    if ((_DWORD)a6)
      v169 = a4[11];
    else
      v169 = a4[14];
    v170 = v149 + v154;
    v171 = v145;
    v172 = a4[15];
    v173 = v169 - v172;
    v174 = v154 - v149;
    v175 = v173 + v157;
    v176 = v150;
    v177 = v157 - v173;
    v178 = v158 + v163;
    v179 = v147;
    v180 = v166;
    v181 = v163 - v158;
    v182 = v165 + v167;
    v183 = v167 - v165;
    v184 = v159 - v160;
    v185 = v171 + v156;
    v186 = v172 + v169;
    v187 = v185 - v186;
    v188 = v159 - v160 - (v185 - v186);
    v189 = v162 + v161;
    v190 = v176 + v151;
    v191 = v189 - v190;
    v192 = v180 + v164;
    v193 = v179 + v155;
    v194 = v189 - v190 - (v192 - v193);
    v195 = v160 + v159;
    v196 = v186 + v185;
    v197 = v195 - v196;
    v198 = v190 + v189;
    v199 = v193 + v192;
    v200 = (int8x8_t)vdup_lane_s16(*(int16x4_t *)v22.i8, 0);
    v201 = vbsl_s8((int8x8_t)vdup_lane_s16(vceq_s16(*(int16x4_t *)v20.i8, *(int16x4_t *)v21.i8), 0), (int8x8_t)vshr_n_u16((uint16x4_t)v200, 2uLL), v200);
    v202 = v192 - v193 + v191;
    v203 = v184 + v187;
    v204 = v202 - v203;
    v205 = v195 + v196;
    v206 = v193 + v192 + v198 - v205;
    v207 = v201.u16[3];
    v208 = (int)((v205 + v199 + v198) * v201.u16[3] + ((1 << v168) >> 1)) >> v168;
    v209 = v201.u16[2];
    v129.i32[0] = v208;
    v129.i32[1] = (int)((v203 + v202) * v201.u16[2] + ((1 << v168) >> 1)) >> v168;
    v131.i32[0] = (int)(v206 * v201.u16[3] + ((1 << v168) >> 1)) >> v168;
    v210 = v201.u16[1];
    v131.i32[1] = (int)(v204 * v201.u16[2] + ((1 << v168) >> 1)) >> v168;
    v211 = v201.u16[0];
    v130.i32[0] = (int)((v174 + v177 + v183 + v181) * v201.u16[1] + ((1 << v168) >> 1)) >> v168;
    v130.i32[1] = (int)((v170 + v175 + v182 + v178) * v211 + ((1 << v168) >> 1)) >> v168;
    v132.i32[0] = (int)((v183 + v181 - (v174 + v177)) * v210 + ((1 << v168) >> 1)) >> v168;
    v132.i32[1] = (int)((v182 + v178 - (v170 + v175)) * v211 + ((1 << v168) >> 1)) >> v168;
    v212 = v198 - v199;
    v137.i32[0] = (int)((v212 - v197) * v207 + ((1 << v168) >> 1)) >> v168;
    v137.i32[1] = (int)((v194 - v188) * v209 + ((1 << v168) >> 1)) >> v168;
    v213 = v170 - v175;
    v138.i32[0] = (int)((v197 + v212) * v207 + ((1 << v168) >> 1)) >> v168;
    v138.i32[1] = (int)((v188 + v194) * v209 + ((1 << v168) >> 1)) >> v168;
    v214 = v178 - v182;
    v215 = v174 - v177;
    v143.i32[0] = (int)((v181 - v183 - v215) * v210 + ((1 << v168) >> 1)) >> v168;
    v143.i32[1] = (int)((v214 - v213) * v211 + ((1 << v168) >> 1)) >> v168;
    v144.i32[0] = (int)((v215 + v181 - v183) * v210 + ((1 << v168) >> 1)) >> v168;
    v144.i32[1] = (int)((v213 + v214) * v211 + ((1 << v168) >> 1)) >> v168;
  }
  else
  {
    v23 = *a4;
    v24 = a4[1];
    v25 = a4[2];
    v26 = a4[3];
    v27 = a4[4];
    v28 = a4[5];
    v29 = a4[6];
    v30 = a4[7];
    v31 = a4[8];
    v32 = a4[9];
    v33 = a4[10];
    v34 = a4[11];
    v35 = a4[14];
    v36 = a4[15];
    if ((_DWORD)a6)
      v37 = a4[14];
    else
      v37 = a4[13];
    if ((_DWORD)a6)
      v38 = a4[13];
    else
      v38 = a4[12];
    if ((_DWORD)a6)
      v39 = a4[12];
    else
      v39 = a4[6];
    if ((_DWORD)a6)
      v40 = a4[7];
    else
      v40 = a4[10];
    if ((_DWORD)a6)
    {
      v41 = v28;
    }
    else
    {
      v29 = v31;
      v41 = v27;
    }
    if ((_DWORD)a6)
      v42 = v25;
    else
      v42 = v24;
    if ((_DWORD)a6)
      v43 = v34;
    else
      v43 = v35;
    if ((_DWORD)a6)
      v44 = v33;
    else
      v44 = v34;
    if ((_DWORD)a6)
    {
      v30 = v32;
      v28 = v31;
    }
    else
    {
      v27 = v32;
    }
    if (!(_DWORD)a6)
      v24 = v25;
    v45 = (v22.i8[0] & 3) != 0;
    v46 = (unsigned __int16)v22.i16[0] >> 2;
    if ((v22.i8[0] & 3) != 0)
      v46 = v22.i16[0];
    v253 = 2 * v45;
    v47 = (__int16)(v23 * v46 + 2 * v45);
    v48 = (__int16)(v24 * v46);
    v49 = (__int16)(v26 * v46);
    v50 = (__int16)(v27 * v46);
    v51 = (__int16)(v28 * v46);
    v52 = (__int16)(v30 * v46);
    v53 = (__int16)(v44 * v46);
    v54 = (__int16)(v43 * v46);
    v55 = v42 * v46;
    v56 = v41 * v46;
    v57 = v29 * v46;
    v58 = v40 * v46;
    v59 = v39 * v46;
    v60 = v38 * v46;
    v61 = v37 * v46;
    v62 = v36 * v46;
    if (v47 + v55 >= 0x7FFF)
      v63 = 0x7FFF;
    else
      v63 = v47 + v55;
    if (v63 <= -32768)
      v63 = -32768;
    v64 = v48 + v56;
    if (v64 >= 0x7FFF)
      v64 = 0x7FFF;
    if (v64 <= -32768)
      v64 = -32768;
    v65 = v49 + v57;
    if (v65 >= 0x7FFF)
      v65 = 0x7FFF;
    if (v65 <= -32768)
      v65 = -32768;
    v66 = v50 + v58;
    if (v66 >= 0x7FFF)
      v66 = 0x7FFF;
    if (v66 <= -32768)
      v66 = -32768;
    v67 = v51 + v59;
    if (v67 >= 0x7FFF)
      v67 = 0x7FFF;
    if (v67 <= -32768)
      v67 = -32768;
    v68 = v52 + v60;
    if (v68 >= 0x7FFF)
      v68 = 0x7FFF;
    if (v68 <= -32768)
      v68 = -32768;
    v69 = v53 + v61;
    if (v69 >= 0x7FFF)
      v69 = 0x7FFF;
    if (v69 <= -32768)
      v70 = -32768;
    else
      v70 = v69;
    v71 = v54 + v62;
    if (v71 >= 0x7FFF)
      v71 = 0x7FFF;
    if (v71 <= -32768)
      v72 = -32768;
    else
      v72 = v71;
    v73 = v47 - v55;
    if (v73 >= 0x7FFF)
      v73 = 0x7FFF;
    if (v73 <= -32768)
      v73 = -32768;
    v74 = v48 - v56;
    if (v74 >= 0x7FFF)
      v74 = 0x7FFF;
    if (v74 <= -32768)
      v74 = -32768;
    v75 = v49 - v57;
    if (v75 >= 0x7FFF)
      v75 = 0x7FFF;
    if (v75 <= -32768)
      v76 = -32768;
    else
      v76 = v75;
    v77 = v50 - v58;
    if (v77 >= 0x7FFF)
      v77 = 0x7FFF;
    if (v77 <= -32768)
      v78 = -32768;
    else
      v78 = v77;
    v79 = v51 - v59;
    if (v79 >= 0x7FFF)
      v79 = 0x7FFF;
    if (v79 <= -32768)
      v80 = -32768;
    else
      v80 = v79;
    v81 = v52 - v60;
    if (v81 >= 0x7FFF)
      v81 = 0x7FFF;
    if (v81 <= -32768)
      v82 = -32768;
    else
      v82 = v81;
    v83 = v53 - v61;
    if (v83 >= 0x7FFF)
      v83 = 0x7FFF;
    if (v83 <= -32768)
      v84 = -32768;
    else
      v84 = v83;
    v85 = v54 - v62;
    if (v85 >= 0x7FFF)
      v85 = 0x7FFF;
    if (v85 <= -32768)
      v86 = -32768;
    else
      v86 = v85;
    v87 = v63 + v67;
    if (v63 + v67 >= 0x7FFF)
      v87 = 0x7FFF;
    if (v87 <= -32768)
      v88 = -32768;
    else
      v88 = v87;
    v89 = v64 + v68;
    if (v64 + v68 >= 0x7FFF)
      v89 = 0x7FFF;
    if (v89 <= -32768)
      v90 = -32768;
    else
      v90 = v89;
    v91 = v65 + v70;
    if (v65 + v70 >= 0x7FFF)
      v91 = 0x7FFF;
    if (v91 <= -32768)
      v92 = -32768;
    else
      v92 = v91;
    v93 = v66 + v72;
    if (v66 + v72 >= 0x7FFF)
      v93 = 0x7FFF;
    if (v93 <= -32768)
      v94 = -32768;
    else
      v94 = v93;
    v95 = v63 - v67;
    if (v63 - v67 >= 0x7FFF)
      v95 = 0x7FFF;
    if (v95 <= -32768)
      v96 = -32768;
    else
      v96 = v95;
    v97 = v64 - v68;
    if (v64 - v68 >= 0x7FFF)
      v97 = 0x7FFF;
    if (v97 <= -32768)
      v98 = -32768;
    else
      v98 = v97;
    v99 = v65 - v70;
    if (v65 - v70 >= 0x7FFF)
      v99 = 0x7FFF;
    if (v99 <= -32768)
      v100 = -32768;
    else
      v100 = v99;
    v101 = v66 - v72;
    if (v66 - v72 >= 0x7FFF)
      v101 = 0x7FFF;
    if (v101 <= -32768)
      v102 = -32768;
    else
      v102 = v101;
    v103 = v73 - v80;
    if (v73 - v80 >= 0x7FFF)
      v103 = 0x7FFF;
    if (v103 <= -32768)
      v103 = -32768;
    v104 = v74 - v82;
    if (v74 - v82 >= 0x7FFF)
      v104 = 0x7FFF;
    if (v104 <= -32768)
      v104 = -32768;
    v105 = v76 - v84;
    if (v76 - v84 >= 0x7FFF)
      v105 = 0x7FFF;
    if (v105 <= -32768)
      v105 = -32768;
    v106 = v78 - v86;
    if (v78 - v86 >= 0x7FFF)
      v106 = 0x7FFF;
    if (v106 <= -32768)
      v106 = -32768;
    v107 = v73 + v80;
    if (v107 >= 0x7FFF)
      v107 = 0x7FFF;
    if (v107 <= -32768)
      v107 = -32768;
    v108 = v74 + v82;
    if (v108 >= 0x7FFF)
      v108 = 0x7FFF;
    if (v108 <= -32768)
      v108 = -32768;
    v109 = v76 + v84;
    if (v109 >= 0x7FFF)
      v109 = 0x7FFF;
    if (v109 <= -32768)
      v109 = -32768;
    v110 = v78 + v86;
    if (v110 >= 0x7FFF)
      v111 = 0x7FFF;
    else
      v111 = v110;
    if (v111 <= -32768)
      v111 = -32768;
    v112 = vshl_n_s32((int32x2_t)__PAIR64__(v108, v104), 0x10uLL);
    v113 = vshl_n_s32((int32x2_t)__PAIR64__(v107, v103), 0x10uLL);
    v114 = vshl_n_s32((int32x2_t)__PAIR64__(v111, v106), 0x10uLL);
    v115 = vshl_n_s32((int32x2_t)__PAIR64__(v109, v105), 0x10uLL);
    v116 = (int32x2_t)vand_s8((int8x8_t)vqadd_s32(v115, v114), (int8x8_t)0xFFFF0000FFFF0000);
    v117 = (int32x2_t)vand_s8((int8x8_t)vqadd_s32(v113, v112), (int8x8_t)0xFFFF0000FFFF0000);
    v118 = vshr_n_s32(vqsub_s32(v117, v116), 0x10uLL);
    v119 = vshl_n_s32((int32x2_t)__PAIR64__(v98, v90), 0x10uLL);
    v120 = vshl_n_s32((int32x2_t)__PAIR64__(v96, v88), 0x10uLL);
    v121 = vshl_n_s32((int32x2_t)__PAIR64__(v102, v94), 0x10uLL);
    v122 = vshl_n_s32((int32x2_t)__PAIR64__(v100, v92), 0x10uLL);
    v123 = (int32x2_t)vand_s8((int8x8_t)vqadd_s32(v122, v121), (int8x8_t)0xFFFF0000FFFF0000);
    v124 = (int32x2_t)vand_s8((int8x8_t)vqadd_s32(v120, v119), (int8x8_t)0xFFFF0000FFFF0000);
    v125 = vshr_n_s32(vqadd_s32(v124, v123), 0x10uLL);
    v126 = vshr_n_s32(vqadd_s32(v117, v116), 0x10uLL);
    v127 = vshr_n_s32(vqsub_s32(v124, v123), 0x10uLL);
    v128 = vneg_s32(vdup_n_s32(v253));
    v129 = vshl_s32(v125, v128);
    v130 = vshl_s32(v126, v128);
    v131 = vshl_s32(v127, v128);
    v132 = vshl_s32(v118, v128);
    v133 = (int32x2_t)vand_s8((int8x8_t)vqsub_s32(v122, v121), (int8x8_t)0xFFFF0000FFFF0000);
    v134 = (int32x2_t)vand_s8((int8x8_t)vqsub_s32(v120, v119), (int8x8_t)0xFFFF0000FFFF0000);
    v135 = vshr_n_s32(vqsub_s32(v134, v133), 0x10uLL);
    v136 = vshr_n_s32(vqadd_s32(v134, v133), 0x10uLL);
    v137 = vshl_s32(v135, v128);
    v138 = vshl_s32(v136, v128);
    v139 = (int8x8_t)vqsub_s32(v113, v112);
    v140 = (int32x2_t)vand_s8((int8x8_t)vqsub_s32(v115, v114), (int8x8_t)0xFFFF0000FFFF0000);
    v141 = (int32x2_t)vand_s8(v139, (int8x8_t)0xFFFF0000FFFF0000);
    v142 = vshr_n_s32(vqadd_s32(v141, v140), 0x10uLL);
    v143 = vshl_s32(vshr_n_s32(vqsub_s32(v141, v140), 0x10uLL), v128);
    v144 = vshl_s32(v142, v128);
  }
  v216 = vdup_n_s32(0x7FDFu);
  v217 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v129, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v218 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v131, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v219 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v130, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v220 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v132, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v221 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v137, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v222 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v138, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v223 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v143, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v224 = vadd_s32(vmin_s32(vshr_n_s32(vshl_n_s32(v144, 0x10uLL), 0x10uLL), v216), (int32x2_t)0x2000000020);
  v225 = a5;
  if (v257)
  {
    v226 = 0;
    *(int32x2_t *)v20.i8 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v217, 0x10uLL), 0x10uLL), 6uLL);
    v227 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v218, 0x10uLL), 0x10uLL), 6uLL);
    v228 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v219, 0x10uLL), 0x10uLL), 6uLL);
    v229 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v220, 0x10uLL), 0x10uLL), 6uLL);
    v230 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v221, 0x10uLL), 0x10uLL), 6uLL);
    v231 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v222, 0x10uLL), 0x10uLL), 6uLL);
    v232 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v223, 0x10uLL), 0x10uLL), 6uLL);
    v233 = vshr_n_s32(vshr_n_s32(vshl_n_s32(v224, 0x10uLL), 0x10uLL), 6uLL);
    do
    {
      *(int16x4_t *)v19.i8 = vmovn_s32(v20);
      v19 = vqtbl1q_s8(v19, (int8x16_t)xmmword_1B6917770);
      v234 = a3 + (unsigned __int16)word_1B693B2E4[v226];
      v235 = vdup_lane_s16(*(int16x4_t *)v20.i8, 0);
      v236 = vdup_lane_s16(*(int16x4_t *)v20.i8, 2);
      *(int8x16_t *)v234 = v19;
      *(int32x2_t *)v20.i8 = v227;
      v227 = v228;
      v228 = v229;
      v229 = v230;
      v230 = v231;
      *(int16x4_t *)(v234 + 32) = v235;
      *(int16x4_t *)(v234 + 40) = v236;
      *(int16x4_t *)(v234 + 64) = v235;
      *(int16x4_t *)(v234 + 72) = v236;
      ++v226;
      v231 = v232;
      *(int16x4_t *)(v234 + 96) = v235;
      *(int16x4_t *)(v234 + 104) = v236;
      v232 = v233;
      v233 = v230;
    }
    while (v226 != 8);
  }
  else
  {
    v237 = 0;
    v238 = vshr_n_s32(vshl_n_s32(v224, 0x10uLL), 0x10uLL);
    v239 = vshr_n_s32(vshl_n_s32(v223, 0x10uLL), 0x10uLL);
    v240 = vshr_n_s32(vshl_n_s32(v222, 0x10uLL), 0x10uLL);
    v241 = vshr_n_s32(vshl_n_s32(v221, 0x10uLL), 0x10uLL);
    v242 = vshr_n_s32(vshl_n_s32(v220, 0x10uLL), 0x10uLL);
    v243 = vshr_n_s32(vshl_n_s32(v219, 0x10uLL), 0x10uLL);
    v244 = vshr_n_s32(vshl_n_s32(v218, 0x10uLL), 0x10uLL);
    v245.i64[1] = 0x302030203020302;
    *(int32x2_t *)v22.i8 = vshr_n_s32(vshl_n_s32(v217, 0x10uLL), 0x10uLL);
    do
    {
      v246 = v240;
      v247 = (int16x4_t *)(a3 + (unsigned __int16)word_1B693B2E4[v237]);
      if (*(_WORD *)((char *)&v262 + v237 * 2))
      {
        v268 = vdupq_lane_s16(*(int16x4_t *)v22.i8, 2);
        v269 = v22.i16[0];
        v270[0] = 0;
        *(_QWORD *)((char *)v270 + 6) = 0;
        sub_1B68FFD6C(v225, v225 + 16, &v269, v268.i16, word_1B69181D0, (unsigned __int16 *)&v267, v247, a6, 0, 0, 0, 0, 0, 0);
      }
      else
      {
        *(uint32x2_t *)v22.i8 = vshr_n_u32(*(uint32x2_t *)v22.i8, 6uLL);
        *(int16x4_t *)v245.i8 = vmovn_s32(v22);
        v245 = vqtbl1q_s8(v245, (int8x16_t)xmmword_1B6917770);
        *(int8x16_t *)v247->i8 = v245;
        *(int16x4_t *)v245.i8 = vdup_lane_s16(*(int16x4_t *)v22.i8, 0);
        v248 = vdup_lane_s16(*(int16x4_t *)v22.i8, 2);
        v247[4] = *(int16x4_t *)v245.i8;
        v247[5] = v248;
        v247[8] = *(int16x4_t *)v245.i8;
        v247[9] = v248;
        v247[12] = *(int16x4_t *)v245.i8;
        v247[13] = v248;
      }
      ++v237;
      v225 += 32;
      *(int32x2_t *)v22.i8 = v244;
      v244 = v243;
      v243 = v242;
      v242 = v241;
      v241 = v246;
      v240 = v239;
      v239 = v238;
      v238 = v246;
    }
    while (v237 != 8);
  }
  return v250;
}

uint64_t sub_1B690288C(uint64_t result, int a2, _BYTE *a3, _BYTE *a4)
{
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  signed int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;

  v4 = a4[3];
  if (a4[3])
    v5 = -1;
  else
    v5 = 0;
  if (a4[2])
    v6 = 15;
  else
    v6 = 7;
  if (a4[1])
  {
    v7 = 0;
    if (a4[3])
      v8 = -1;
    else
      v8 = 0;
    *a3 = (*(unsigned __int8 *)(result + v8 - a2)
         + 2 * *(unsigned __int8 *)(result - a2)
         + *(unsigned __int8 *)(result - a2 + 1)
         + 2) >> 2;
    v9 = result - a2;
    do
    {
      if ((int)v7 >= (int)v6)
        v10 = v6;
      else
        v10 = v7;
      v11 = *(unsigned __int8 *)(v9 + v10);
      v12 = v7 + 1;
      if ((int)v7 + 1 >= v6)
        v13 = v6;
      else
        v13 = v7 + 1;
      v14 = *(unsigned __int8 *)(v9 + v13);
      v15 = v7 + 2;
      if ((int)v7 + 2 >= v6)
        v15 = v6;
      a3[++v7] = (v11 + 2 * v14 + *(unsigned __int8 *)(v9 + v15) + 2) >> 2;
    }
    while (v12 != 16);
    a3[16] = a3[15];
  }
  if (*a4)
  {
    v16 = 0;
    if (v4)
      v17 = -1;
    else
      v17 = 0;
    v18 = a3 - 2;
    v19 = (unsigned __int8 *)(result - 1);
    do
    {
      v20 = v16 - 1;
      if (v16 <= v17)
        v20 = v5;
      v21 = *(unsigned __int8 *)(result + a2 * (uint64_t)v20 - 1);
      if (++v16 >= 7)
        v22 = 7;
      else
        v22 = v16;
      *v18-- = (v21 + 2 * *v19 + *(unsigned __int8 *)(result + v22 * a2 - 1) + 2) >> 2;
      v19 += a2;
    }
    while (v16 != 8);
    *(a3 - 10) = *(a3 - 9);
  }
  if (a4[3])
  {
    if (*a4)
    {
      v23 = *(unsigned __int8 *)(result - 1);
      if (v4)
        v24 = -1;
      else
        v24 = 0;
      if (a4[1])
      {
        v25 = v23 + 2 * *(unsigned __int8 *)(result + v24 - a2) + *(unsigned __int8 *)(result - a2);
      }
      else
      {
        v27 = *(unsigned __int8 *)(result + v24 * a2 - 1);
        v25 = v23 + v27 + 2 * v27;
      }
    }
    else
    {
      if (!a4[1])
        return result;
      if (v4)
        v26 = -1;
      else
        v26 = 0;
      v25 = *(unsigned __int8 *)(result - a2) + 3 * *(unsigned __int8 *)(result + v26 - a2);
    }
    *(a3 - 1) = (v25 + 2) >> 2;
  }
  return result;
}

_QWORD *sub_1B6902A50(_QWORD *result, int a2, uint64_t *a3)
{
  uint64_t v3;
  int v4;

  v3 = *a3;
  v4 = 8;
  do
  {
    *result = v3;
    result = (_QWORD *)((char *)result + a2);
    --v4;
  }
  while (v4);
  return result;
}

_QWORD *sub_1B6902A70(_QWORD *result, int a2, uint64_t a3)
{
  uint64_t i;

  for (i = -2; i != -10; --i)
  {
    *result = 0x101010101010101 * *(unsigned __int8 *)(a3 + i);
    result = (_QWORD *)((char *)result + a2);
  }
  return result;
}

uint64_t *sub_1B6902A9C(uint64_t *result, int a2, uint64_t a3, _BYTE *a4)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  uint64_t v14;
  int v15;
  int v16;

  v4 = a4[1];
  if (*a4)
  {
    if (a4[1])
    {
      v5 = 0;
      v6 = 0;
      v7 = -2;
      do
        v6 += *(unsigned __int8 *)(a3 + v7--) + *(unsigned __int8 *)(a3 + v5++);
      while (v5 != 8);
      v8 = 8;
      do
      {
        *result = 0x101010101010101 * ((uint64_t)(v6 + 8) >> 4);
        result = (uint64_t *)((char *)result + a2);
        --v8;
      }
      while (v8);
    }
    else
    {
      for (i = -2; i != -10; --i)
        v4 += *(unsigned __int8 *)(a3 + i);
      v14 = 0x101010101010101 * ((v4 + 4) >> 3);
      v15 = 8;
      do
      {
        *result = v14;
        result = (uint64_t *)((char *)result + a2);
        --v15;
      }
      while (v15);
    }
  }
  else if (a4[1])
  {
    v9 = 0;
    v10 = 0;
    do
      v10 += *(unsigned __int8 *)(a3 + v9++);
    while (v9 != 8);
    v11 = 0x101010101010101 * ((v10 + 4) >> 3);
    v12 = 8;
    do
    {
      *result = v11;
      result = (uint64_t *)((char *)result + a2);
      --v12;
    }
    while (v12);
  }
  else
  {
    v16 = 8;
    do
    {
      *result = 0x8080808080808080;
      result = (uint64_t *)((char *)result + a2);
      --v16;
    }
    while (v16);
  }
  return result;
}

uint64_t sub_1B6902BB4(uint64_t a1, int a2, unsigned __int8 *a3, double a4, double a5, double a6, double a7, double a8, uint16x8_t a9)
{
  uint8x8_t v9;
  int16x8_t v10;
  uint8x8_t v11;
  uint16x8_t v12;
  int16x8_t v13;
  int8x8_t v14;
  int8x8_t v15;
  int16x4_t v16;
  int v17;
  int v18;
  int16x8_t v19;
  unsigned int v20;
  char v21;
  int16x8_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;

  v9 = *(uint8x8_t *)(a3 + 7);
  v10 = (int16x8_t)vmovl_u8(v9);
  v11 = *(uint8x8_t *)(a3 + 8);
  v12 = vshll_n_u8(v11, 1uLL);
  v13 = (int16x8_t)vaddw_u8(v12, v9);
  v12.i32[0] = *(_DWORD *)(a3 + 3);
  v14 = (int8x8_t)vmovl_u8(*(uint8x8_t *)v12.i8).u64[0];
  a9.i32[0] = 131074;
  a9.i16[2] = 2;
  a9.i16[3] = 2;
  v12.i64[0] = vaddw_u8(a9, *(uint8x8_t *)v12.i8).u64[0];
  v15 = (int8x8_t)vdup_lane_s16(*(int16x4_t *)v10.i8, 0);
  v16 = (int16x4_t)vext_s8(v14, vext_s8(v15, v15, 6uLL), 2uLL);
  v17 = a3[1];
  v18 = a3[2];
  v19 = (int16x8_t)vextq_s8((int8x16_t)vmovl_u8(v11), (int8x16_t)v13, 2uLL);
  v19.i16[7] = a3[16];
  v20 = (v18 + 2 + *a3 + 2 * v17) >> 2;
  LOBYTE(v17) = (v12.u16[0] + v17 + 2 * v18) >> 2;
  v21 = (v18 + 2 + 2 * v14.u16[0] + v14.u16[1]) >> 2;
  *(uint16x4_t *)v10.i8 = vshr_n_u16((uint16x4_t)vadd_s16(vadd_s16(*(int16x4_t *)v12.i8, (int16x4_t)vext_s8(v14, *(int8x8_t *)v10.i8, 4uLL)), vadd_s16(v16, v16)), 2uLL);
  *(_BYTE *)a1 = v20;
  *(_BYTE *)(a1 + 1) = v17;
  *(_BYTE *)(a1 + 2) = v21;
  v12.i32[0] = vmovn_s16(v10).u32[0];
  *(_DWORD *)(a1 + 3) = v12.i32[0];
  v22 = vaddq_s16(v13, v19);
  *(int8x8_t *)v22.i8 = vrshrn_n_s16(v22, 2uLL);
  *(_BYTE *)(a1 + 7) = v22.i8[0];
  v23 = a1 + a2;
  *(_BYTE *)v23 = v17;
  *(_BYTE *)(v23 + 1) = v21;
  *(_BYTE *)(v23 + 6) = v22.i8[0];
  *(_DWORD *)(v23 + 2) = v12.i32[0];
  *(_BYTE *)(v23 + 7) = v22.i8[1];
  v24 = a1 + 2 * a2;
  *(_BYTE *)v24 = v21;
  *(_DWORD *)(v24 + 1) = v12.i32[0];
  *(_WORD *)(v24 + 5) = v22.i16[0];
  *(_BYTE *)(v24 + 7) = v22.i8[2];
  v12.i32[1] = vmovn_s16((int16x8_t)vzip1q_s8((int8x16_t)v22, (int8x16_t)v22)).u32[0];
  *(_QWORD *)(a1 + 3 * a2) = v12.i64[0];
  v25 = a1 + 4 * a2;
  *(_BYTE *)v25 = v10.i8[2];
  v26 = a1 + 5 * a2;
  *(_BYTE *)(v25 + 1) = v10.i8[4];
  v27 = a1 + 6 * a2;
  *(_BYTE *)(v25 + 2) = v10.i8[6];
  *(_BYTE *)(v25 + 7) = v22.i8[4];
  result = a1 - a2;
  *(_DWORD *)(v25 + 3) = v12.i32[1];
  *(_BYTE *)v26 = v10.i8[4];
  *(_BYTE *)(v26 + 1) = v10.i8[6];
  *(_DWORD *)(v26 + 2) = v12.i32[1];
  *(_WORD *)(v26 + 6) = v22.i16[2];
  *(_BYTE *)v27 = v10.i8[6];
  *(_DWORD *)(v27 + 1) = v12.i32[1];
  *(_WORD *)(v27 + 5) = v22.i16[2];
  *(_BYTE *)(v27 + 7) = v22.i8[6];
  *(_QWORD *)(result + 8 * a2) = v22.i64[0];
  return result;
}

double sub_1B6902D4C(_QWORD *a1, int a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint8x8_t v12;
  unsigned __int16 v13;
  uint8x8_t v14;
  uint16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  unsigned int v20;
  unsigned int v21;
  char *v22;
  unsigned __int32 v23;
  int v24;
  char *v25;
  unsigned int v26;
  char *v27;
  unsigned int v28;
  unsigned int v29;
  char *v30;
  char *v31;
  char *v32;
  _BYTE *v33;

  v3 = *(unsigned __int8 *)(a3 - 3);
  v4 = *(unsigned __int8 *)(a3 - 4);
  v5 = *(unsigned __int8 *)(a3 - 5);
  v6 = (v3 + v5 + 2 * v4 + 2) >> 2;
  v7 = *(unsigned __int8 *)(a3 - 6);
  v8 = *(unsigned __int8 *)(a3 - 7);
  v9 = (v4 + v7 + 2 * v5 + 2) >> 2;
  v10 = *(unsigned __int8 *)(a3 - 8);
  v11 = *(unsigned __int8 *)(a3 - 9);
  v12 = *(uint8x8_t *)(a3 - 2);
  v13 = vmovl_u8(v12).u16[0];
  v14 = *(uint8x8_t *)(a3 - 1);
  v15.i64[0] = 0x2000200020002;
  v15.i64[1] = 0x2000200020002;
  v16 = (int16x8_t)vaddw_u8(v15, v12);
  v17 = vaddq_s16(v16, (int16x8_t)vshll_n_u8(v14, 1uLL));
  v18 = (int16x8_t)vextq_s8((int8x16_t)vmovl_u8(v14), (int8x16_t)v17, 2uLL);
  v18.i16[7] = *(unsigned __int8 *)(a3 + 7);
  v19 = vaddq_s16(v17, v18);
  *(int8x8_t *)v19.i8 = vshrn_n_s16(v19, 2uLL);
  v20 = ((v16.u16[1] + 2 * v13 + v3) >> 2) & 0x1FF;
  *a1 = v19.i64[0];
  v21 = v16.u16[0] + v4 + 2 * v3;
  v22 = (char *)a1 + a2;
  *v22 = v20;
  v23 = vmovn_s16((int16x8_t)vzip1q_s8((int8x16_t)v19, (int8x16_t)v19)).u32[0];
  *(_DWORD *)(v22 + 1) = v23;
  *(_WORD *)(v22 + 5) = v19.i16[2];
  v22[7] = v19.i8[6];
  v24 = (v21 >> 2) & 0x1FF;
  v25 = (char *)a1 + 2 * a2;
  *v25 = v24;
  v25[1] = v20;
  v25[6] = v19.i8[4];
  v26 = (v5 + v8 + 2 * v7 + 2) >> 2;
  *(_DWORD *)(v25 + 2) = v23;
  v25[7] = v19.i8[5];
  v27 = (char *)a1 + 3 * a2;
  *v27 = v6;
  v27[1] = v24;
  v28 = (v7 + v10 + 2 * v8 + 2) >> 2;
  v27[2] = v20;
  *(_DWORD *)(v27 + 3) = v23;
  v27[7] = v19.i8[4];
  v29 = v8 + v11 + 2 * v10 + 2;
  v30 = (char *)a1 + 4 * a2;
  *v30 = v9;
  v30[1] = v6;
  v30[2] = v24;
  v30[3] = v20;
  *((_DWORD *)v30 + 1) = v23;
  v31 = (char *)a1 + 5 * a2;
  *v31 = v26;
  v31[1] = v9;
  v31[2] = v6;
  v31[3] = v24;
  *(_WORD *)(v31 + 5) = v19.i16[0];
  v31[4] = v20;
  v31[7] = v19.i8[2];
  v32 = (char *)a1 + 6 * a2;
  *v32 = v28;
  v32[1] = v26;
  v32[2] = v9;
  v32[3] = v6;
  v32[4] = v24;
  v32[5] = v20;
  *((_WORD *)v32 + 3) = v19.i16[0];
  v33 = (char *)&a1[a2] - a2;
  *v33 = v29 >> 2;
  v33[1] = v28;
  v33[2] = v26;
  v33[3] = v9;
  v33[4] = v6;
  v33[5] = v24;
  v33[6] = v20;
  v33[7] = v19.i8[0];
  return *(double *)v19.i64;
}

_BYTE *sub_1B6902F34(_BYTE *result, int a2, unsigned __int8 *a3)
{
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
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
  unsigned int v28;
  unsigned int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  _BYTE *v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  _BYTE *v48;
  _BYTE *v49;
  unsigned int v50;
  _BYTE *v51;
  _BYTE *v52;
  _BYTE *v53;
  _BYTE *v54;

  v3 = *(a3 - 1);
  v4 = *a3;
  v5 = v4 + 1 + v3;
  v6 = a3[1];
  v7 = v4 + 1 + v6;
  v8 = a3[2];
  v9 = v6 + v8;
  v10 = a3[3];
  v11 = v8 + v10;
  v12 = a3[4];
  v13 = v10 + v12;
  v14 = a3[5];
  v15 = v12 + v14;
  v16 = a3[6];
  v17 = v14 + v16;
  v18 = a3[7];
  v19 = *(a3 - 2);
  v20 = v4 + 2;
  v21 = *(a3 - 3);
  v22 = *(a3 - 4);
  v23 = *(a3 - 5);
  v24 = *(a3 - 6);
  v25 = *(a3 - 7);
  v26 = *(a3 - 8);
  result[7] = (v16 + v18 + 1) >> 1;
  v27 = v4 + 2 + 2 * v3;
  v3 += 2;
  v28 = v3 + 2 * v4 + v6;
  v29 = v20 + 2 * v6 + v8;
  v30 = v6 + 2 * v8 + v10;
  v31 = v8 + 2 * v10 + v12;
  v32 = v10 + 2 * v12 + v14;
  v33 = v12 + 2 * v14 + v16;
  v34 = v14 + 2 * v16;
  v5 >>= 1;
  *result = v5;
  v7 >>= 1;
  result[1] = v7;
  v35 = (v9 + 1) >> 1;
  result[2] = v35;
  v36 = (v11 + 1) >> 1;
  result[3] = v36;
  v37 = (v13 + 1) >> 1;
  result[4] = v37;
  v38 = (v15 + 1) >> 1;
  result[5] = v38;
  v39 = (v17 + 1) >> 1;
  result[6] = v39;
  v40 = (v27 + v19) >> 2;
  v41 = v34 + v18;
  v42 = &result[a2];
  *v42 = v40;
  v28 >>= 2;
  v42[1] = v28;
  v29 >>= 2;
  v42[2] = v29;
  v43 = (v30 + 2) >> 2;
  v42[3] = v43;
  v44 = (v31 + 2) >> 2;
  v42[4] = v44;
  v45 = (v32 + 2) >> 2;
  v42[5] = v45;
  v46 = (v33 + 2) >> 2;
  v42[6] = v46;
  v42[7] = (v41 + 2) >> 2;
  v47 = (v3 + v21 + 2 * v19) >> 2;
  v48 = &result[2 * a2];
  *v48 = v47;
  v48[1] = v5;
  v48[2] = v7;
  v48[3] = v35;
  v48[4] = v36;
  v48[5] = v37;
  v48[6] = v38;
  v48[7] = v39;
  v49 = &result[3 * a2];
  v50 = (v19 + v22 + 2 * v21 + 2) >> 2;
  *v49 = v50;
  v49[1] = v40;
  v49[2] = v28;
  v49[3] = v29;
  v49[4] = v43;
  v49[5] = v44;
  v49[6] = v45;
  v49[7] = v46;
  LODWORD(v49) = (v21 + v23 + 2 * v22 + 2) >> 2;
  v51 = &result[4 * a2];
  *v51 = (_BYTE)v49;
  v51[1] = v47;
  v51[2] = v5;
  v51[3] = v7;
  v51[4] = v35;
  v51[5] = v36;
  v51[6] = v37;
  v51[7] = v38;
  v52 = &result[5 * a2];
  LODWORD(v51) = (v22 + v24 + 2 * v23 + 2) >> 2;
  *v52 = (_BYTE)v51;
  v52[1] = v50;
  v52[2] = v40;
  v52[3] = v28;
  v52[4] = v29;
  v52[5] = v43;
  v52[6] = v44;
  v52[7] = v45;
  v53 = &result[6 * a2];
  *v53 = (v23 + v25 + 2 * v24 + 2) >> 2;
  v53[1] = (_BYTE)v49;
  v53[2] = v47;
  v53[3] = v5;
  v53[4] = v7;
  v53[5] = v35;
  v53[6] = v36;
  v53[7] = v37;
  v54 = &result[8 * a2 - a2];
  *v54 = (v24 + v26 + 2 * v25 + 2) >> 2;
  v54[1] = (_BYTE)v51;
  v54[2] = v50;
  v54[3] = v40;
  v54[4] = v28;
  v54[5] = v29;
  v54[6] = v43;
  v54[7] = v44;
  return result;
}

uint16x4_t sub_1B6903208(uint64_t a1, int a2, unsigned __int8 *a3, uint8x8_t a4)
{
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  uint8x8_t v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  int v26;
  uint16x8_t v27;
  int16x4_t v28;
  unsigned int v29;
  int16x8_t v30;
  unsigned int v31;
  _BYTE *v32;
  unsigned int v33;
  unsigned int v34;
  uint16x4_t result;
  unsigned int v36;
  _BYTE *v37;
  unsigned int v38;
  unsigned int v39;
  _BYTE *v40;
  unsigned int v41;
  _BYTE *v42;
  _BYTE *v43;
  _BYTE *v44;
  _BYTE *v45;

  v4 = *(a3 - 2);
  v5 = *(a3 - 1);
  v6 = *a3;
  v7 = (v4 + 1 + v5) >> 1;
  v8 = v4 + 2;
  a4.i32[0] = *(_DWORD *)(a3 + 1);
  v9 = (uint8x8_t)vmovl_u8(a4).u64[0];
  v10 = v9.u16[0];
  v11 = (v4 + 2 + 2 * v5 + v6) >> 2;
  v12 = v5 + 2;
  v13 = *(a3 - 3);
  v14 = v5 + 2 + 2 * v6;
  v15 = *(a3 - 4);
  v16 = v6 + 2 * v9.u16[0];
  v17 = *(a3 - 5);
  v18 = (v4 + 1 + v13) >> 1;
  v19 = *(a3 - 6);
  v20 = *(a3 - 7);
  v21 = v12 + 2 * v4 + v13;
  v22 = *(a3 - 8);
  v23 = v21 >> 2;
  v24 = *(a3 - 9);
  v25 = (v13 + v15 + 1) >> 1;
  v26 = v9.u16[1];
  v9.i32[0] = *(_DWORD *)(a3 + 2);
  v27 = vmovl_u8(v9);
  v28 = (int16x4_t)vext_s8(*(int8x8_t *)v27.i8, (int8x8_t)a4, 2uLL);
  v28.i16[3] = a3[6];
  v29 = (v8 + v15 + 2 * v13) >> 2;
  *(_BYTE *)a1 = v7;
  LOBYTE(v14) = (v14 + v10) >> 2;
  *(_BYTE *)(a1 + 1) = v11;
  *(_BYTE *)(a1 + 2) = v14;
  LOBYTE(v16) = (v16 + v26 + 2) >> 2;
  *(int16x4_t *)v27.i8 = vadd_s16(*(int16x4_t *)v27.i8, *(int16x4_t *)v27.i8);
  v30 = (int16x8_t)vaddw_u8(v27, a4);
  *(_BYTE *)(a1 + 3) = v16;
  *(int16x4_t *)v30.i8 = vadd_s16(*(int16x4_t *)v30.i8, v28);
  *(_DWORD *)(a1 + 4) = vrshrn_n_s16(v30, 2uLL).u32[0];
  v31 = (v15 + v17 + 1) >> 1;
  v32 = (_BYTE *)(a1 + a2);
  *v32 = v18;
  v32[1] = v23;
  v32[2] = v7;
  v33 = (v13 + v17 + 2 * v15 + 2) >> 2;
  v32[3] = v11;
  v34 = (v17 + v19 + 1) >> 1;
  v32[4] = v14;
  v32[5] = v16;
  result = vshr_n_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v30.i8, (int16x4_t)0x2000200020002), 2uLL);
  v32[6] = result.i8[0];
  v36 = (v15 + v19 + 2 * v17 + 2) >> 2;
  v32[7] = result.i8[2];
  LODWORD(v32) = (v19 + v20 + 1) >> 1;
  v37 = (_BYTE *)(a1 + 2 * a2);
  *v37 = v25;
  v37[1] = v29;
  v37[2] = v18;
  v38 = (v17 + v20 + 2 * v19 + 2) >> 2;
  v37[3] = v23;
  v39 = (v20 + v22 + 1) >> 1;
  v37[4] = v7;
  v37[5] = v11;
  v37[6] = v14;
  v37[7] = v16;
  v40 = (_BYTE *)(a1 + 3 * a2);
  *v40 = v31;
  v40[1] = v33;
  v41 = (v19 + v22 + 2 * v20 + 2) >> 2;
  v40[2] = v25;
  v40[3] = v29;
  v40[4] = v18;
  v40[5] = v23;
  v40[6] = v7;
  v40[7] = v11;
  v42 = (_BYTE *)(a1 + 4 * a2);
  *v42 = v34;
  v42[1] = v36;
  v42[2] = v31;
  v42[3] = v33;
  v42[4] = v25;
  v42[5] = v29;
  v42[6] = v18;
  v42[7] = v23;
  v43 = (_BYTE *)(a1 + 5 * a2);
  *v43 = (_BYTE)v32;
  v43[1] = v38;
  v43[2] = v34;
  v43[3] = v36;
  v43[4] = v31;
  v43[5] = v33;
  v43[6] = v25;
  v43[7] = v29;
  v44 = (_BYTE *)(a1 + 6 * a2);
  *v44 = v39;
  v44[1] = v41;
  v44[2] = (_BYTE)v32;
  v44[3] = v38;
  v44[4] = v34;
  v44[5] = v36;
  v44[6] = v31;
  v44[7] = v33;
  v45 = (_BYTE *)(a1 - a2 + 8 * a2);
  *v45 = (v22 + v24 + 1) >> 1;
  v45[1] = (v20 + v24 + 2 * v22 + 2) >> 2;
  v45[2] = v39;
  v45[3] = v41;
  v45[4] = (_BYTE)v32;
  v45[5] = v38;
  v45[6] = v34;
  v45[7] = v36;
  return result;
}

_BYTE *sub_1B69034B0(_BYTE *result, int a2, unsigned __int8 *a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  _BYTE *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  _BYTE *v34;
  unsigned int v35;
  _BYTE *v36;
  unsigned int v37;
  _BYTE *v38;
  unsigned int v39;
  _BYTE *v40;
  unsigned int v41;
  _BYTE *v42;
  _BYTE *v43;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[2];
  v6 = a3[3];
  v7 = (v4 + 1 + v5) >> 1;
  v8 = a3[4];
  v9 = (v5 + v6 + 1) >> 1;
  v10 = a3[5];
  v11 = a3[6];
  v12 = (v6 + v8 + 1) >> 1;
  v13 = a3[7];
  v14 = (v8 + v10 + 1) >> 1;
  v15 = a3[8];
  v16 = a3[9];
  v17 = (v10 + v11 + 1) >> 1;
  v18 = a3[10];
  v19 = (v11 + v13 + 1) >> 1;
  v20 = a3[11];
  v21 = a3[12];
  v22 = (v13 + v15 + 1) >> 1;
  v23 = v5 + 2;
  *result = (v4 + 1 + v3) >> 1;
  result[1] = v7;
  v24 = (v5 + 2 + v3 + 2 * v4) >> 2;
  result[2] = v9;
  v25 = v6 + 2;
  result[3] = v12;
  result[4] = v14;
  v26 = (v6 + 2 + v4 + 2 * v5) >> 2;
  result[5] = v17;
  result[6] = v19;
  v27 = (v23 + 2 * v6 + v8) >> 2;
  result[7] = v22;
  v28 = &result[a2];
  *v28 = v24;
  v28[1] = v26;
  v29 = (v25 + 2 * v8 + v10) >> 2;
  v28[2] = v27;
  v28[3] = v29;
  v30 = (v8 + 2 * v10 + v11 + 2) >> 2;
  v28[4] = v30;
  v31 = (v10 + 2 * v11 + v13 + 2) >> 2;
  v28[5] = v31;
  v32 = (v11 + 2 * v13 + v15 + 2) >> 2;
  v28[6] = v32;
  v33 = (v13 + 2 * v15 + v16 + 2) >> 2;
  v28[7] = v33;
  v34 = &result[2 * a2];
  *v34 = v7;
  v34[1] = v9;
  v34[2] = v12;
  v34[3] = v14;
  v34[4] = v17;
  v34[5] = v19;
  v34[6] = v22;
  v35 = (v15 + v16 + 1) >> 1;
  v34[7] = v35;
  v36 = &result[3 * a2];
  *v36 = v26;
  v36[1] = v27;
  v36[2] = v29;
  v36[3] = v30;
  v36[4] = v31;
  v36[5] = v32;
  v37 = (v15 + 2 * v16 + v18 + 2) >> 2;
  v36[6] = v33;
  v36[7] = v37;
  v38 = &result[4 * a2];
  *v38 = v9;
  v38[1] = v12;
  v38[2] = v14;
  v38[3] = v17;
  v38[4] = v19;
  v39 = (v16 + v18 + 1) >> 1;
  v38[5] = v22;
  v38[6] = v35;
  v38[7] = v39;
  v40 = &result[5 * a2];
  *v40 = v27;
  v41 = (v16 + 2 * v18 + v20 + 2) >> 2;
  v40[1] = v29;
  v40[2] = v30;
  v40[3] = v31;
  v40[4] = v32;
  v40[5] = v33;
  v40[6] = v37;
  v40[7] = v41;
  v42 = &result[6 * a2];
  *v42 = v12;
  v42[1] = v14;
  v42[2] = v17;
  v42[3] = v19;
  v42[4] = v22;
  v42[5] = v35;
  v42[6] = v39;
  v42[7] = (v18 + v20 + 1) >> 1;
  v43 = &result[8 * a2 - a2];
  *v43 = v29;
  v43[1] = v30;
  v43[2] = v31;
  v43[3] = v32;
  v43[4] = v33;
  v43[5] = v37;
  v43[6] = v41;
  v43[7] = (v18 + 2 * v20 + v21 + 2) >> 2;
  return result;
}

int8x8_t sub_1B690375C(_BYTE *a1, int a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  _BYTE *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  _BYTE *v25;
  unsigned int v26;
  unsigned int v27;
  _BYTE *v28;
  unsigned int v29;
  _BYTE *v30;
  _BYTE *v31;
  int8x8_t result;
  _BYTE *v33;

  v3 = *(unsigned __int8 *)(a3 - 3);
  v4 = *(unsigned __int8 *)(a3 - 2);
  v5 = *(unsigned __int8 *)(a3 - 4);
  v6 = (v3 + 1 + v4) >> 1;
  v7 = *(unsigned __int8 *)(a3 - 5);
  v8 = *(unsigned __int8 *)(a3 - 6);
  v9 = (v5 + 2 + 2 * v3 + v4) >> 2;
  v10 = *(unsigned __int8 *)(a3 - 7);
  v11 = (v3 + 1 + v5) >> 1;
  v12 = *(unsigned __int8 *)(a3 - 8);
  v13 = v7 + 2 + v3;
  v14 = *(unsigned __int8 *)(a3 - 9);
  v15 = *(unsigned __int8 *)(a3 - 10);
  v16 = (v13 + 2 * v5) >> 2;
  *a1 = v6;
  v17 = (v5 + v7 + 1) >> 1;
  a1[1] = v9;
  a1[2] = v11;
  v18 = (v5 + 2 + v8 + 2 * v7) >> 2;
  a1[3] = v16;
  a1[4] = v17;
  v19 = (v7 + v8 + 1) >> 1;
  a1[5] = v18;
  a1[6] = v19;
  v20 = (v7 + 2 + v10 + 2 * v8) >> 2;
  a1[7] = v20;
  v21 = &a1[a2];
  *v21 = v11;
  v21[1] = v16;
  v22 = (v8 + v10 + 1) >> 1;
  v21[2] = v17;
  v21[3] = v18;
  v21[4] = v19;
  v23 = (v8 + v12 + 2 * v10 + 2) >> 2;
  v24 = v10 + v12 + 1;
  v21[5] = v20;
  v21[6] = v22;
  v21[7] = v23;
  v25 = &a1[2 * a2];
  *v25 = v17;
  v26 = v10 + v14 + 2 * v12 + 2;
  v27 = v12 + v14 + 1;
  v25[1] = v18;
  v25[2] = v19;
  v25[3] = v20;
  v25[4] = v22;
  v26 >>= 2;
  v25[5] = v23;
  v25[6] = v24 >> 1;
  v25[7] = v26;
  v28 = &a1[3 * a2];
  *v28 = v19;
  v28[1] = v20;
  v29 = (v12 + v15 + 2 * v14 + 2) >> 2;
  v28[2] = v22;
  v28[3] = v23;
  v28[4] = v24 >> 1;
  v28[5] = v26;
  v28[6] = v27 >> 1;
  v28[7] = v29;
  v30 = &a1[4 * a2];
  *v30 = v22;
  v30[1] = v23;
  v30[2] = v24 >> 1;
  v30[3] = v26;
  v30[4] = v27 >> 1;
  v30[5] = v29;
  v30[6] = v14;
  v30[7] = v14;
  v31 = &a1[5 * a2];
  *v31 = v24 >> 1;
  v31[1] = v26;
  v31[2] = v27 >> 1;
  result = vdup_n_s8(v14);
  v31[3] = v29;
  *((_DWORD *)v31 + 1) = result.i32[0];
  v33 = &a1[6 * a2];
  *v33 = v27 >> 1;
  v33[1] = v29;
  *(_DWORD *)(v33 + 2) = result.i32[0];
  v33[6] = v14;
  v33[7] = v14;
  *(int8x8_t *)&a1[8 * a2 - a2] = result;
  return result;
}

uint64_t sub_1B690393C(int a1, int a2, uint64_t a3)
{
  unsigned __int8 *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unsigned int v9;
  int v10;

  v3 = (unsigned __int8 *)&unk_1B693C018 + (4 * a1);
  v4 = *v3;
  v5 = v3[16];
  v6 = *(_QWORD *)(a3 + 8 * (~(2 * (_BYTE)v5) & 2));
  v7 = *(_QWORD *)(a3 + 8 * ((v4 & 1) == 0));
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    return 2;
  v9 = *(unsigned __int8 *)(v7 + ((v4 >> 1) & 0xF));
  v10 = *(unsigned __int8 *)(v6 + ((v5 >> 1) & 0xF));
  if ((a2 & ((v10 | v9) >> 5) & 1) != 0)
    return 2;
  else
    return (((v9 & 0xF) - (v10 & 0xF)) & ((int)((v9 & 0xF) - (v10 & 0xF)) >> 31)) + (v10 & 0xF);
}

uint64_t sub_1B69039B8(unsigned int a1, int a2, uint64_t a3)
{
  unsigned __int8 *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unsigned int v9;
  int v10;

  v3 = (unsigned __int8 *)&unk_1B693C018 + a1;
  v4 = *v3;
  v5 = v3[16];
  v6 = *(_QWORD *)(a3 + 8 * (~(2 * (_BYTE)v5) & 2));
  v7 = *(_QWORD *)(a3 + 8 * ((v4 & 1) == 0));
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    return 2;
  v9 = *(unsigned __int8 *)(v7 + ((v4 >> 1) & 0xF));
  v10 = *(unsigned __int8 *)(v6 + ((v5 >> 1) & 0xF));
  if ((a2 & ((v10 | v9) >> 5) & 1) != 0)
    return 2;
  else
    return (((v9 & 0xF) - (v10 & 0xF)) & ((int)((v9 & 0xF) - (v10 & 0xF)) >> 31)) + (v10 & 0xF);
}

double sub_1B6903A30(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  int v12;
  int v13;
  double result;

  v12 = sub_1B6903AB8(a2, a4, 0x10u);
  v13 = sub_1B6903AB8(a3, a5, 8u);
  result = (double)a1 * a7;
  *(_DWORD *)a6 = a1;
  *(_DWORD *)(a6 + 4) = v13 + v12;
  *(_DWORD *)(a6 + 8) = v13 + v12 + result;
  *(double *)(a6 + 16) = a7;
  return result;
}

uint64_t sub_1B6903AB8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
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
  unint64_t v26;
  unsigned int v27;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = a3;
  do
  {
    v9 = (unsigned __int8 *)(a1 + (v3 & 0xFFFFFFF0));
    v10 = (unsigned __int8 *)(a2 + (v3 & 0xFFFFFFF0));
    v11 = *v9 - *v10;
    v12 = v9[1] - v10[1];
    v13 = v9[2] - v10[2];
    v14 = v9[3] - v10[3];
    v15 = v9[4] - v10[4];
    v16 = v9[5] - v10[5];
    v17 = v9[6] - v10[6];
    v18 = v9[7] - v10[7];
    v19 = v9[8] - v10[8];
    v20 = v9[9] - v10[9];
    v21 = v9[10] - v10[10];
    v22 = v9[11] - v10[11];
    v23 = v9[12] - v10[12];
    v24 = v9[13] - v10[13];
    v25 = v9[14] - v10[14];
    LODWORD(v10) = v9[15] - v10[15];
    v7 += v11 * v11 + v12 * v12 + v19 * v19 + v20 * v20;
    v6 += v13 * v13 + v14 * v14 + v21 * v21 + v22 * v22;
    v5 += v15 * v15 + v16 * v16 + v23 * v23 + v24 * v24;
    v4 += v17 * v17 + v18 * v18 + v25 * v25 + (_DWORD)v10 * (_DWORD)v10;
    v3 += 16;
    --v8;
  }
  while (v8);
  v26 = v6 + (uint64_t)v7 + v5 + v4;
  v27 = v6 + v7 + v5 + v4;
  if (HIDWORD(v26))
    return 0xFFFFFFFFLL;
  else
    return v27;
}

double sub_1B6903C34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  int v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  int v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  void (*v18)(__int128 *, _BYTE *, _BYTE *);
  void (*v19)(__int128 *, _BYTE *, _BYTE *);
  void (*v20)(void);
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  int *v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  int *v29;
  int v30;
  signed int v31;
  signed int v32;
  int32x4_t v33;
  int32x4_t v34;
  int8x8_t v35;
  uint64_t v36;
  int8x16_t v37;
  uint64_t v38;
  int32x4_t v39;
  int8x8_t v40;
  uint64_t v41;
  unsigned int v42;
  unint64_t v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  unsigned int *v52;
  unsigned __int16 *v53;
  unint64_t v54;
  unsigned int v55;
  char v56;
  char v57;
  double result;
  __int128 v59;
  int v61;
  int v62;
  int32x4_t v63;
  int32x4_t v64;
  _BYTE v65[16];
  unsigned int v66;
  uint64_t v67;
  char v68;
  char v69;
  char v70;
  __int128 v71;
  __int128 v72;
  _DWORD v73[2];
  _BYTE v74[2];
  _BYTE v75[6];
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  _DWORD v80[4];
  __int16 v81;
  __int16 v82;
  uint64_t v83;
  int32x4_t v84;

  v3 = 0;
  v83 = *MEMORY[0x1E0C80C00];
  *(_WORD *)((char *)v73 + 1) = 8224;
  *(_QWORD *)&v71 = 0x8000800080008000;
  *((_QWORD *)&v71 + 1) = -1;
  *(_QWORD *)&v72 = -1;
  *((_QWORD *)&v72 + 1) = -1;
  v4 = *(__int16 *)(a1 + 348);
  v5 = *(__int16 *)(a1 + 350);
  v79 = 0;
  v77 = 0uLL;
  v78 = 0uLL;
  v61 = 16 * v5;
  v62 = 16 * v4;
  v6 = 1;
  v63 = vdupq_n_s32(16 * v5);
  v64 = vdupq_n_s32(16 * v4);
  do
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 8 * v3 + 56);
    if (!v8)
      goto LABEL_53;
    v9 = 0;
    v10 = *(_QWORD *)(v8 + 488);
    v12 = *(_DWORD *)(v8 + 228);
    v11 = *(_DWORD *)(v8 + 232);
    v66 = v11;
    v67 = *(_QWORD *)(a1 + 336);
    v68 = *(_BYTE *)(a1 + v3 + 34);
    v69 = *(_BYTE *)(a1 + v3 + 36);
    v70 = *(_BYTE *)(a1 + 38);
    v13 = *(_DWORD *)(v8 + 196);
    v14 = &qword_1EF13A328;
    if (*(_BYTE *)(a1 + v3 + 32))
    {
      v15 = &qword_1EF13A248;
    }
    else
    {
      v14 = &qword_1EF13A1D8;
      v15 = &qword_1EF13A0F8;
    }
    if (*(_BYTE *)(a1 + v3 + 32))
      v16 = &qword_1EF13A3B0;
    else
      v16 = &qword_1EF13A3A8;
    v17 = &qword_1EF13A280;
    if (!*(_BYTE *)(a1 + v3 + 32))
      v17 = &qword_1EF13A130;
    *(_QWORD *)a1 = *v14;
    v18 = (void (*)(__int128 *, _BYTE *, _BYTE *))*v17;
    v19 = (void (*)(__int128 *, _BYTE *, _BYTE *))*v15;
    v20 = (void (*)(void))*v16;
    *(_QWORD *)(a1 + 16) = v19;
    *(_QWORD *)(a1 + 24) = v18;
    *(_QWORD *)(a1 + 8) = v20;
    v80[0] = 0;
    v21 = 1;
    do
    {
      while (1)
      {
        v22 = *(_QWORD *)(a1 + 8 * v9 + 360);
        if (!v22 || *(_BYTE *)(v22 + v3 + 33))
          goto LABEL_14;
        v23 = *(_DWORD *)(v22 + 4 * v3) & 0xFFFCFFFC;
        v80[v21] = v23;
        if (v21)
          break;
        ++v9;
        v21 = 1;
        if (v9 == 4)
          goto LABEL_24;
      }
      v24 = v21;
      v25 = v80;
      while (1)
      {
        v26 = *v25++;
        if (v26 == v23)
          break;
        if (!--v24)
        {
          ++v21;
          break;
        }
      }
LABEL_14:
      ++v9;
    }
    while (v9 != 4);
    if (v21 >= 5)
      goto LABEL_31;
LABEL_24:
    if (*(_BYTE *)(a1 + 52) == 1)
    {
      v27 = *(_DWORD *)(a1 + 48) & 0xFFFCFFFC;
      v80[v21] = v27;
      if (v21)
      {
        v28 = v21;
        v29 = v80;
        while (1)
        {
          v30 = *v29++;
          if (v30 == v27)
            break;
          if (!--v28)
          {
            ++v21;
            break;
          }
        }
      }
      else
      {
        v21 = 1;
      }
    }
LABEL_31:
    v31 = (__int16)(v12 + 2);
    v32 = (__int16)(v13 + 2);
    v84 = (int32x4_t)vld2_s16((const __int16 *)v80);
    v33 = vaddw_s16(v64, vshr_n_s16(*(int16x4_t *)v84.i8, 2uLL));
    v34.i64[0] = 0x1200000012;
    v34.i64[1] = 0x1200000012;
    v35 = (int8x8_t)vmovn_s32(vcgtq_s32(v34, v33));
    v84 = vaddw_s16(v63, vshr_n_s16((int16x4_t)v84.u64[1], 2uLL));
    *(int32x4_t *)((char *)&v84 + 8) = vcgtq_s32(v34, v84);
    v36 = *(_QWORD *)(v10 + 72);
    v37 = vbicq_s8((int8x16_t)vshrq_n_s32(vshlq_n_s32(vminq_s32(v84, vdupq_n_s32(v32)), 0x10uLL), 0x10uLL), *(int8x16_t *)((char *)&v84 + 8));
    v84.i64[1] &= 0xFFFFFFEDFFFFFFEDLL;
    v38 &= 0xFFFFFFEDFFFFFFEDLL;
    v39 = vmulq_s32(vdupq_n_s32(v11), (int32x4_t)vorrq_s8(*(int8x16_t *)((char *)&v84 + 8), v37));
    v40 = vorr_s8((int8x8_t)(*(_QWORD *)&v35 & 0xFFEDFFEDFFEDFFEDLL), vbic_s8((int8x8_t)vmovn_s32(vminq_s32(v33, vdupq_n_s32(v31))), v35));
    *(_QWORD *)&v77 = v36 + v39.i32[0] + v40.i16[0];
    *((_QWORD *)&v77 + 1) = v36 + v39.i32[1] + v40.i16[1];
    *(_QWORD *)&v78 = v36 + v39.i32[2] + v40.i16[2];
    *((_QWORD *)&v78 + 1) = v36 + v39.i32[3] + v40.i16[3];
    v41 = v21;
    v42 = 0xFFFF;
    v43 = 0xFFFFLL;
    switch(v21)
    {
      case 0u:
        goto LABEL_52;
      case 1u:
        v20();
        goto LABEL_48;
      case 2u:
        v20();
        (*(void (**)(_QWORD, _BYTE *, _BYTE *))(a1 + 8))(*((_QWORD *)&v77 + 1), v65, v75);
        goto LABEL_48;
      case 3u:
        v19(&v77, v65, v74);
        goto LABEL_48;
      case 4u:
        v18(&v77, v65, v74);
        goto LABEL_48;
      case 5u:
        v44 = v62 + (v81 >> 2);
        if (v44 >= v31)
          v45 = v31;
        else
          v45 = v62 + (v81 >> 2);
        v46 = v61 + (v82 >> 2);
        if (v46 >= v32)
          v47 = v32;
        else
          v47 = v61 + (v82 >> 2);
        if (v46 >= -19)
          v48 = v47;
        else
          v48 = -19;
        v49 = v36 + (int)(v48 * v11);
        v50 = v44 < -19;
        v51 = -19;
        if (!v50)
          v51 = v45;
        v79 = v49 + v51;
        v18(&v77, v65, v74);
        (*(void (**)(uint64_t, _BYTE *, uint64_t *))(a1 + 8))(v79, v65, &v76);
        goto LABEL_48;
      default:
LABEL_48:
        v21 = 0;
        v43 = 0xFFFFLL;
        v52 = v80;
        v53 = (unsigned __int16 *)v74;
        v42 = 0xFFFF;
        do
        {
          v55 = *v53++;
          v54 = v55;
          if (v55 < v43)
          {
            v21 = *v52;
            v43 = v54;
            v42 = v54;
          }
          ++v52;
          --v41;
        }
        while (v41);
LABEL_52:
        *((_BYTE *)v73 + v3 + 1) = 0;
        *((_DWORD *)&v71 + v3) = v21;
        *((_QWORD *)&v71 + v3 + 1) = v42 | (v43 << 32);
        break;
    }
LABEL_53:
    v6 = 0;
    v3 = 1;
  }
  while ((v7 & 1) != 0);
  if (BYTE2(v73[0]) == 32)
    v56 = 4;
  else
    v56 = 6;
  if (BYTE1(v73[0]) == 32)
    v57 = 5;
  else
    v57 = v56;
  LOBYTE(v73[0]) = v57;
  result = *(double *)&v71;
  v59 = v72;
  *(_OWORD *)a2 = v71;
  *(_OWORD *)(a2 + 16) = v59;
  *(_DWORD *)(a2 + 32) = v73[0];
  return result;
}

void sub_1B6904100(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 v21;
  uint64_t v22;
  unsigned int v23;
  __int16 v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  unsigned int v29;
  unsigned int v30;
  int16x4_t *v31;
  unsigned int v32;
  int16x4_t *v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  int32x4_t v43;
  int32x4_t v44;
  int8x8_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int8x8_t v48;
  int32x4_t v49;
  int16x8_t v50;
  uint64_t v51;
  int32x4_t v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  _BYTE *v56;
  _BYTE *v57;
  _BYTE *v58;
  uint64_t i;
  int v60;
  __int16 v61;
  __int16 v62;
  int v63;
  __int16 v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  char *v71;
  char *v72;
  int v73;
  int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  BOOL v86;
  unsigned int v87;
  BOOL v88;
  unsigned int v89;
  unsigned int v90;
  BOOL v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  BOOL v101;
  _BOOL4 v102;
  BOOL v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE *v112;
  __int128 *v113;
  uint8x8_t v114;
  uint16x4_t v115;
  int8x16_t v116;
  int32x4_t v117;
  int32x4_t v118;
  uint32x2_t v119;
  int8x16_t v120;
  int8x16_t v121;
  int32x4_t v122;
  int32x4_t v123;
  uint16x4_t v124;
  uint16x4_t v125;
  uint32x2_t v126;
  int32x4_t v127;
  int32x4_t v128;
  uint16x4_t v129;
  uint8x8_t v130;
  uint16x4_t v131;
  int v132;
  unsigned __int16 *v133;
  unint64_t v134;
  int16x8_t v135;
  uint64_t v136;
  int32x4_t v137;
  int8x16_t v138;
  uint64x2_t v139;
  int32x4_t v140;
  int32x4_t v141;
  int32x4_t v142;
  uint16x4_t v143;
  uint16x4_t v144;
  uint16x4_t v145;
  uint16x4_t v146;
  uint16x4_t v147;
  uint16x4_t v148;
  uint16x4_t v149;
  uint16x4_t v150;
  uint16x4_t v151;
  uint16x4_t v152;
  uint16x4_t v153;
  uint16x4_t v154;
  uint16x4_t v155;
  uint16x4_t v156;
  uint16x4_t v157;
  uint16x4_t v158;
  uint16x4_t v159;
  uint16x4_t v160;
  uint16x4_t v161;
  uint16x4_t v162;
  uint16x4_t v163;
  uint16x4_t v164;
  uint16x4_t v165;
  uint16x4_t v166;
  uint16x4_t v167;
  uint16x4_t v168;
  uint16x4_t v169;
  uint16x4_t v170;
  uint16x4_t v171;
  unsigned int v172;
  int v173;
  uint32x2_t v174;
  unsigned int v175;
  uint32x2_t v176;
  int32x4_t v177;
  uint64x2_t v178;
  uint64x2_t v179;
  int32x4_t v180;
  int32x4_t v181;
  unsigned __int16 v182;
  unsigned __int16 v183;
  uint64_t v184;
  unsigned int v185;
  _BOOL4 v187;
  unsigned int v188;
  _BOOL4 v189;
  unsigned int v190;
  _BOOL4 v192;
  _BOOL4 v193;
  _BOOL4 v197;
  BOOL v198;
  int v199;
  unsigned __int16 v200;
  char v201;
  int v202;
  char v203;
  char v204;
  char v206;
  uint64_t v207;
  int v208;
  int v209;
  signed int v210;
  signed int v211;
  uint64_t v212;
  uint64_t v213;
  unsigned int v214;
  unsigned int v215;
  unsigned int v216;
  int32x4_t v217;
  int32x4_t v218;
  int32x4_t v219;
  char v220;
  int32x4_t v221;
  int32x4_t v222;
  uint32x4_t v223;
  uint64_t v224;
  uint64_t v225;
  int v226;
  int v227;
  int v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int v231;
  uint64_t v232;
  unsigned int v233;
  unsigned int v234;
  unsigned int v235;
  unsigned int v236;
  unsigned int v237;
  unsigned int v238;
  unsigned int v239;
  int v240;
  unsigned int v241;
  int v242;
  __int16 v243;
  int16x8_t v244;
  int v245;
  _OWORD v246[2];
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  _DWORD v250[2];
  unsigned __int16 v251;
  _BYTE v252[2];
  _BYTE v253[2];
  _BYTE v254[2];
  _BYTE v255[2];
  _BYTE v256[6];
  _BYTE v257[240];
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  _BYTE v262[16];
  signed int v263;
  uint64_t v264;
  char v265;
  char v266;
  char v267;
  uint64_t v268;

  v3 = a3;
  v5 = 0;
  v268 = *MEMORY[0x1E0C80C00];
  *(_WORD *)(a3 + 32) = 0x2000;
  *(_BYTE *)(a3 + 34) = 32;
  *(_QWORD *)a3 = 0x8000800080008000;
  *(_QWORD *)(a3 + 8) = -1;
  *(_QWORD *)(a3 + 16) = -1;
  *(_QWORD *)(a3 + 24) = -1;
  v248 = -1;
  v249 = -1;
  v243 = *(_WORD *)((char *)a2 + 33);
  v247 = *a2;
  v6 = (unint64_t)&v243;
  v246[0] = *(_OWORD *)(a2 + 1);
  v7 = 1;
  v225 = a1;
  do
  {
    v8 = v7;
    if (!*((_BYTE *)&v243 + v5))
    {
      v9 = *(_QWORD *)(a1 + 8 * v5 + 56);
      v10 = *((_DWORD *)&v247 + v5);
      v11 = *((unsigned __int16 *)v246 + 4 * v5 + 2);
      if (v11 >= 0x4B1)
        v12 = 5;
      else
        v12 = 3;
      *(_DWORD *)(a1 + 404) = v12;
      *(_WORD *)(a1 + 396) = v11;
      *(_WORD *)(a1 + 398) = 0;
      *(_DWORD *)(a1 + 392) = v11;
      v13 = v10 & 0xFFFCFFFC;
      *(_DWORD *)(a1 + 400) = v10 & 0xFFFCFFFC;
      v228 = *(_DWORD *)(a1 + 352);
      v14 = *(__int16 *)(a1 + 348);
      v15 = *(__int16 *)(a1 + 350);
      v16 = (__int16)(v10 & 0xFFFC);
      if (v16 < 0)
        v16 = -v16;
      v17 = *(_DWORD *)(a1 + 44);
      v18 = v13 >> 16;
      if (v13 >> 16 < 0)
        v18 = -v18;
      if ((1 << v12) + v16 <= v17 && (1 << v12) + v18 <= v17)
        goto LABEL_24;
      do
        v21 = (1 << --v12) + v16 > v17 || (1 << v12) + v18 > v17;
      while (v12 >= 3 && v21);
      *(_DWORD *)(a1 + 404) = v12;
      if (!v21)
      {
LABEL_24:
        v206 = v8;
        v241 = 0;
        v23 = HIWORD(v13);
        v224 = *(_QWORD *)(v9 + 488);
        v263 = *(_DWORD *)(v9 + 232);
        v264 = *(_QWORD *)(a1 + 336);
        v260 = 0u;
        v261 = 0u;
        v258 = 0u;
        v259 = 0u;
        v207 = v5;
        v265 = *(_BYTE *)(a1 + v5 + 34);
        v266 = *(_BYTE *)(a1 + v5 + 36);
        v209 = 16 * v14;
        v24 = *(_WORD *)(v9 + 228);
        v25 = *(_WORD *)(v9 + 196);
        v208 = 16 * v15;
        v267 = *(_BYTE *)(a1 + 38);
        v212 = 2 * v263;
        v213 = v263;
        v226 = v10 >> 16;
        v227 = (__int16)v10;
        v210 = (__int16)(v25 + 2);
        v211 = (__int16)(v24 + 2);
        v218 = vdupq_n_s32(v210);
        v219 = vdupq_n_s32(v211);
        v26 = v10 & 0xFFFCFFFC;
        v239 = v11;
        v217 = vdupq_n_s32(v263);
        do
        {
          while (1)
          {
            v27 = 0;
            v229 = v12 - 2;
            v215 = v209 + ((__int16)v26 >> 2);
            v222 = vdupq_n_s32(v215);
            v223 = (uint32x4_t)vdupq_n_s32(v12 - 2);
            v214 = v208 + ((__int16)v23 >> 2);
            v221 = vdupq_n_s32(v214);
            v28 = 4;
            v29 = v26;
            v30 = v23;
            v220 = v12;
            do
            {
              v31 = (int16x4_t *)((char *)&unk_1B693C9A4 + 2 * v27);
              v32 = v26 + (v31->u16[0] << v12);
              v33 = (int16x4_t *)((char *)&unk_1B693C9B4 + 2 * v27);
              v34 = v23 + (v33->u16[0] << v12);
              v35 = (2 * v27) | 2;
              v36 = v26 + (*(unsigned __int16 *)((char *)&unk_1B693C9A4 + v35) << v12);
              v238 = v23 + (*(unsigned __int16 *)((char *)&unk_1B693C9B4 + v35) << v12);
              v37 = (2 * v27) | 4;
              v38 = *(unsigned __int16 *)((char *)&unk_1B693C9A4 + v37) << v12;
              v39 = v26 + v38;
              v237 = v23 + (*(unsigned __int16 *)((char *)&unk_1B693C9B4 + v37) << v12);
              v40 = (2 * v27) | 6;
              v41 = *(unsigned __int16 *)((char *)&unk_1B693C9A4 + v40) << v12;
              v42 = v26 + v41;
              v236 = v23 + (*(unsigned __int16 *)((char *)&unk_1B693C9B4 + v40) << v12);
              if (v229)
              {
                v43 = vaddq_s32((int32x4_t)vshlq_u32((uint32x4_t)vmovl_s16(*v31), v223), v222);
                v44.i64[0] = 0x1200000012;
                v44.i64[1] = 0x1200000012;
                v45 = (int8x8_t)vmovn_s32(vcgtq_s32(v44, v43));
                v46 = vminq_s32(v43, v219);
                *(int8x8_t *)v46.i8 = vorr_s8((int8x8_t)(*(_QWORD *)&v45 & 0xFFEDFFEDFFEDFFEDLL), vbic_s8((int8x8_t)vmovn_s32(v46), v45));
                v47 = vaddq_s32((int32x4_t)vshlq_u32((uint32x4_t)vmovl_s16(*v33), v223), v221);
                v48 = (int8x8_t)vmovn_s32(vcgtq_s32(v44, v47));
                v49 = vminq_s32(v47, v218);
                *(int8x8_t *)v49.i8 = vorr_s8((int8x8_t)(*(_QWORD *)&v48 & 0xFFEDFFEDFFEDFFEDLL), vbic_s8((int8x8_t)vmovn_s32(v49), v48));
                v50 = vzip1q_s16((int16x8_t)v46, (int16x8_t)v49);
                v51 = *(_QWORD *)(v224 + 72);
                v52 = vmulq_s32(v217, vmovl_s16(*(int16x4_t *)v49.i8));
                *(_QWORD *)&v258 = v51 + v52.i32[0] + v46.i16[0];
                *((_QWORD *)&v258 + 1) = v51 + v52.i32[1] + v46.i16[1];
                v244 = v50;
                *(_QWORD *)&v259 = v51 + v52.i32[2] + v46.i16[2];
                *((_QWORD *)&v259 + 1) = v51 + v52.i32[3] + v46.i16[3];
                v232 = v27;
                v234 = v34;
                v53 = v11;
                v54 = v36;
                v12 = v26 + v41;
                (*(void (**)(__int128 *, _BYTE *, unsigned __int16 *, unint64_t))(v225 + 24))(&v258, v262, &v251, v6);
                v42 = v12;
                v36 = v54;
                v11 = v53;
                LOBYTE(v12) = v220;
                v27 = v232;
                v34 = v234;
                v55 = v251;
                v57 = v254;
                v56 = v252;
                v58 = v253;
              }
              else if (v27)
              {
                v55 = *(unsigned __int16 *)&v256[4];
                v56 = v253;
                v57 = v256;
                v58 = v255;
              }
              else
              {
                v235 = v23 + (v33->u16[0] << v12);
                v216 = v26 + v38;
                v230 = v26 + v41;
                v231 = v36;
                v233 = v11;
                for (i = 0; i != 6; i += 2)
                {
                  v60 = v215 + *(__int16 *)((char *)&unk_1B693C9D0 + i * 2);
                  if (v60 >= v211)
                    v61 = v211;
                  else
                    v61 = v215 + *(_WORD *)((char *)&unk_1B693C9D0 + i * 2);
                  if (v60 >= -19)
                    v62 = v61;
                  else
                    v62 = -19;
                  v244.i16[i] = v62;
                  v63 = v214 + *(__int16 *)((char *)&unk_1B693C9D0 + i * 2 + 2);
                  if (v63 >= v210)
                    v64 = v210;
                  else
                    v64 = v214 + *(_WORD *)((char *)&unk_1B693C9D0 + i * 2 + 2);
                  if (v63 >= -19)
                    v65 = v64;
                  else
                    v65 = -19;
                  v244.i16[i + 1] = v65;
                }
                v66 = *(_QWORD *)(v224 + 72);
                v67 = v66 + (int)v213 * (uint64_t)v244.i16[1] + v244.i16[0];
                v68 = v66 + (int)v213 * (uint64_t)v244.i16[3] + v244.i16[2];
                v69 = v66 + (int)v213 * (uint64_t)v244.i16[5] + v244.i16[4];
                *(_QWORD *)&v259 = v67 + v213;
                *((_QWORD *)&v259 + 1) = v69 + v213;
                *(_QWORD *)&v260 = v67;
                *((_QWORD *)&v260 + 1) = v67 + v212;
                *(_QWORD *)&v258 = v68;
                *((_QWORD *)&v258 + 1) = v68 + v212;
                *(_QWORD *)&v261 = v69;
                *((_QWORD *)&v261 + 1) = v69 + v212;
                (*(void (**)(__int128 *, _BYTE *, unsigned __int16 *, unint64_t))v225)(&v258, v262, &v251, v6);
                v55 = v251;
                v58 = v254;
                v56 = v252;
                v57 = &v256[2];
                v11 = v233;
                v42 = v230;
                v36 = v231;
                v39 = v216;
                v34 = v235;
              }
              v70 = *(unsigned __int16 *)v56;
              v71 = (char *)&unk_1B693C9E0 - v227;
              v72 = (char *)&unk_1B693C9E0 - v226;
              v73 = v71[(__int16)v32 + 2047] + v72[(__int16)v34 + 2047];
              v74 = v71[(__int16)v36 + 2047] + v72[(__int16)v238 + 2047];
              v75 = v71[(__int16)v39 + 2047] + v72[(__int16)v237 + 2047];
              LODWORD(v71) = v71[(__int16)v42 + 2047] + v72[(__int16)v236 + 2047];
              v76 = v73 * v228;
              v77 = v74 * v228;
              v78 = v75 * v228;
              v79 = (_DWORD)v71 * v228;
              v80 = v55 + HIWORD(v76);
              v81 = v70 + HIWORD(v77);
              v82 = *(unsigned __int16 *)v58;
              v83 = *(unsigned __int16 *)v57;
              v84 = v82 + HIWORD(v78);
              v85 = v83 + HIWORD(v79);
              v86 = v80 >= v11;
              v87 = HIWORD(v76);
              if (v80 < v11)
              {
                LODWORD(v6) = v32;
              }
              else
              {
                v34 = v30;
                LODWORD(v6) = v29;
              }
              if (v80 >= v11)
                v80 = v11;
              if (v86)
              {
                v55 = v239;
                v87 = v241;
              }
              v88 = v81 >= v80;
              v89 = HIWORD(v77);
              if (v81 >= v80)
              {
                v6 = v6;
              }
              else
              {
                v34 = v238;
                v6 = v36;
              }
              if (v81 < v80)
                v80 = v81;
              if (v88)
              {
                v90 = v87;
              }
              else
              {
                v55 = v70;
                v90 = v89;
              }
              v91 = v84 >= v80;
              v92 = HIWORD(v78);
              if (v84 < v80)
                v93 = v237;
              else
                v93 = v34;
              if (v84 < v80)
                v94 = v39;
              else
                v94 = v6;
              if (v84 < v80)
                v80 = v84;
              if (v91)
              {
                v95 = v90;
              }
              else
              {
                v55 = v82;
                v95 = v92;
              }
              if (v85 < v80)
                v30 = v236;
              else
                v30 = v93;
              if (v85 < v80)
                v29 = v42;
              else
                v29 = v94;
              if (v85 < v80)
                v11 = v83 + HIWORD(v79);
              else
                v11 = v80;
              if (v85 < v80)
                v55 = v83;
              v239 = v55;
              if (v85 < v80)
                v96 = HIWORD(v79);
              else
                v96 = v95;
              v241 = v96;
              v27 += 4;
              v86 = v28 >= 5;
              v28 += 4;
            }
            while (!v86);
            v13 = (unsigned __int16)v29 | ((unsigned __int16)v30 << 16);
            a1 = v225;
            if (v13 == *(_DWORD *)(v225 + 400))
            {
              v97 = *(_DWORD *)(v225 + 404);
              v12 = v97 - 1;
              *(_DWORD *)(v225 + 404) = v97 - 1;
              if (v97 == 2)
                goto LABEL_114;
            }
            else
            {
              *(_DWORD *)(v225 + 392) = v11;
              *(_WORD *)(v225 + 396) = v239;
              *(_WORD *)(v225 + 398) = v241;
              *(_DWORD *)(v225 + 400) = v13;
              v12 = *(_DWORD *)(v225 + 404);
            }
            v98 = (__int16)v29;
            if ((v29 & 0x8000u) != 0)
              v98 = -(__int16)v29;
            v99 = *(_DWORD *)(v225 + 44);
            v100 = (__int16)v30;
            if ((v30 & 0x8000u) != 0)
              v100 = -(__int16)v30;
            v101 = (1 << v12) + v98 <= v99 && (1 << v12) + v100 <= v99;
            v102 = !v101;
            if (v12 >= 3 && v102)
              break;
            v23 = v30;
            v26 = v29;
            if (v102)
              goto LABEL_114;
          }
          do
            v104 = (1 << --v12) + v98 > v99 || (1 << v12) + v100 > v99;
          while (v12 >= 3 && v104);
          *(_DWORD *)(v225 + 404) = v12;
          v23 = v30;
          v26 = v29;
        }
        while (!v104);
LABEL_114:
        v22 = *(_QWORD *)(v225 + 392);
        v3 = a3;
        v5 = v207;
        v6 = (unint64_t)&v243;
        v8 = v206;
      }
      else
      {
        v22 = *(_QWORD *)(a1 + 392);
      }
      *(_BYTE *)(v3 + v5 + 33) = 0;
      *(_DWORD *)(v3 + 4 * v5) = v13;
      *(_QWORD *)(v3 + 8 * v5 + 8) = v22;
      *(&v248 + v5) = v22;
      v250[v5] = v13;
    }
    v7 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
  v105 = v248;
  v106 = WORD2(v248);
  v107 = v249;
  v108 = WORD2(v249);
  v109 = *(_QWORD *)(a1 + 56);
  if (v109 && (v110 = *(_QWORD *)(a1 + 64)) != 0)
  {
    v242 = HIWORD(v248);
    v240 = HIWORD(v249);
    v111 = *(_QWORD *)(a1 + 336);
    v244.i32[0] = v250[0];
    v245 = v250[1];
    v112 = v262;
    sub_1B68FD5A0(v109, (uint64_t)&v244);
    v113 = &v258;
    v3 = a3;
    sub_1B68FD5A0(v110, (uint64_t)&v245);
    v132 = 0;
    v133 = &v251;
    do
    {
      v134 = 0;
      do
      {
        v114.i32[0] = *(_DWORD *)&v112[v134 * 2];
        v135 = (int16x8_t)vmovl_u8(v114);
        v115.i32[0] = *(_DWORD *)((char *)v113 + v134 * 2);
        v115 = (uint16x4_t)vmovl_u8((uint8x8_t)v115).u64[0];
        *(uint16x4_t *)v135.i8 = vrhadd_u16(*(uint16x4_t *)v135.i8, v115);
        v114 = (uint8x8_t)vmovn_s16(v135);
        *(_DWORD *)&v133[v134] = v114.i32[0];
        v86 = v134 >= 6;
        v134 += 2;
      }
      while (!v86);
      v112 += 16;
      ++v113;
      v133 += 8;
      ++v132;
    }
    while (v132 != 16);
    v136 = 0;
    v137 = 0uLL;
    v138.i64[0] = 0xFF000000FFLL;
    v138.i64[1] = 0xFF000000FFLL;
    v139.i64[0] = 0xFFFFFFFFLL;
    v139.i64[1] = 0xFFFFFFFFLL;
    v140 = 0uLL;
    v141 = 0uLL;
    v142 = 0uLL;
    do
    {
      v116.i32[0] = *(_DWORD *)(v111 + v136);
      v117.i32[0] = *(_DWORD *)(v111 + v136 + 4);
      v118.i32[0] = *(_DWORD *)&v252[v136 - 2];
      v119.i32[0] = *(_DWORD *)&v253[v136];
      v143 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v116.i8), (uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v118.i8));
      v144 = (uint16x4_t)vmovl_u8((uint8x8_t)v119).u64[0];
      v119.i32[0] = *(_DWORD *)(v111 + v136 + 8);
      v120.i32[0] = *(_DWORD *)(v111 + v136 + 12);
      v145 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v117.i8), v144);
      v121.i32[0] = *(_DWORD *)&v255[v136];
      v144.i32[0] = *(_DWORD *)&v256[v136 + 2];
      v146 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v121.i8).u64[0];
      v147 = (uint16x4_t)vmovl_u8((uint8x8_t)v144).u64[0];
      v148 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v119), v146);
      v122.i32[0] = *(_DWORD *)(v111 + v136 + 16);
      v146.i32[0] = *(_DWORD *)(v111 + v136 + 20);
      v149 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v122.i8).u64[0];
      v122.i32[0] = *(_DWORD *)&v257[v136];
      v123.i32[0] = *(_DWORD *)&v257[v136 + 4];
      v150 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v122.i8).u64[0];
      v151 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v120.i8), v147);
      v152 = vabd_u16(v149, v150);
      v153 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v123.i8).u64[0];
      v150.i32[0] = *(_DWORD *)(v111 + v136 + 24);
      v123.i32[0] = *(_DWORD *)(v111 + v136 + 28);
      v154 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v146), v153);
      v155 = (uint16x4_t)vmovl_u8((uint8x8_t)v150).u64[0];
      v150.i32[0] = *(_DWORD *)&v257[v136 + 8];
      v124.i32[0] = *(_DWORD *)&v257[v136 + 12];
      v156 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v123.i8).u64[0];
      v157 = vabd_u16(v155, (uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v150));
      v158 = (uint16x4_t)vmovl_u8((uint8x8_t)v124).u64[0];
      v124.i32[0] = *(_DWORD *)(v111 + v136 + 32);
      v125.i32[0] = *(_DWORD *)(v111 + v136 + 36);
      v159 = vabd_u16(v156, v158);
      v126.i32[0] = *(_DWORD *)&v257[v136 + 16];
      v156.i32[0] = *(_DWORD *)&v257[v136 + 20];
      v160 = (uint16x4_t)vmovl_u8((uint8x8_t)v126).u64[0];
      v161 = (uint16x4_t)vmovl_u8((uint8x8_t)v156).u64[0];
      v162 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v124), v160);
      v127.i32[0] = *(_DWORD *)(v111 + v136 + 40);
      v160.i32[0] = *(_DWORD *)(v111 + v136 + 44);
      v163 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v127.i8).u64[0];
      v127.i32[0] = *(_DWORD *)&v257[v136 + 24];
      v128.i32[0] = *(_DWORD *)&v257[v136 + 28];
      v164 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v127.i8).u64[0];
      v125 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v125), v161);
      v124 = vabd_u16(v163, v164);
      v165 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v128.i8).u64[0];
      v164.i32[0] = *(_DWORD *)(v111 + v136 + 48);
      v128.i32[0] = *(_DWORD *)(v111 + v136 + 52);
      v166 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v160), v165);
      v167 = (uint16x4_t)vmovl_u8((uint8x8_t)v164).u64[0];
      v164.i32[0] = *(_DWORD *)&v257[v136 + 32];
      v129.i32[0] = *(_DWORD *)&v257[v136 + 36];
      v168 = (uint16x4_t)vmovl_u8(*(uint8x8_t *)v128.i8).u64[0];
      v169 = vabd_u16(v167, (uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v164));
      v170 = (uint16x4_t)vmovl_u8((uint8x8_t)v129).u64[0];
      v129.i32[0] = *(_DWORD *)(v111 + v136 + 56);
      v130.i32[0] = *(_DWORD *)(v111 + v136 + 60);
      v171 = vabd_u16(v168, v170);
      v131.i32[0] = *(_DWORD *)&v257[v136 + 40];
      v168.i32[0] = *(_DWORD *)&v257[v136 + 44];
      v131 = (uint16x4_t)vmovl_u8((uint8x8_t)v131).u64[0];
      v129 = vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v129), v131);
      v131.i32[0] = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v143), v138));
      v172 = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v145), v138));
      v173 = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v148), v138));
      v174 = (uint32x2_t)__PAIR64__(v173, vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v151), v138)));
      v175 = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v152), v138));
      v157.i32[0] = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v157), v138));
      v176 = (uint32x2_t)__PAIR64__(v157.u32[0], vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v159), v138)));
      v124.i32[0] = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v124), v138));
      v126 = (uint32x2_t)__PAIR64__(v124.u32[0], vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v166), v138)));
      v145.i32[0] = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v169), v138));
      v143.i32[0] = vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v171), v138));
      v118 = (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v129), v138);
      v118.i32[0] = vaddvq_s32(v118);
      v177.i64[0] = __PAIR64__(v173, v174.u32[0]);
      v177.i64[1] = __PAIR64__(v131.u32[0], v172);
      v119 = (uint32x2_t)__PAIR64__(v118.u32[0], vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(vabd_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v130), (uint16x4_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v168))), v138)));
      v127.i64[0] = __PAIR64__(v157.u32[0], v176.u32[0]);
      v127.i64[1] = __PAIR64__(v175, vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v154), v138)));
      v178.i64[0] = v172;
      v178.i64[1] = v131.u32[0];
      v179 = vaddw_high_u32(v178, (uint32x4_t)v142);
      v178.i64[0] = v127.u32[2];
      v178.i64[1] = v175;
      v128.i64[0] = __PAIR64__(v124.u32[0], v126.u32[0]);
      v128.i64[1] = __PAIR64__(vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v162), v138)), vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vmovl_u16(v125), v138)));
      v180 = (int32x4_t)vcgtq_u64(vaddw_high_u32(v178, (uint32x4_t)v141), v139);
      v125.i32[1] = v128.i32[3];
      v178.i64[0] = v128.u32[2];
      v178.i64[1] = v128.u32[3];
      v121 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(vaddl_u32(v176, *(uint32x2_t *)v141.i8), v139), v180);
      v123.i64[0] = __PAIR64__(v118.u32[0], v119.u32[0]);
      v122 = (int32x4_t)vcgtq_u64(vaddw_high_u32(v178, (uint32x4_t)v137), v139);
      v123.i64[1] = __PAIR64__(v145.u32[0], v143.u32[0]);
      v142 = (int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v177, v142), (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(vaddl_u32(v174, *(uint32x2_t *)v142.i8), v139), (int32x4_t)vcgtq_u64(v179, v139)));
      v120 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(vaddl_u32(v126, *(uint32x2_t *)v137.i8), v139), v122);
      v141 = (int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v127, v141), v121);
      v178.i64[0] = v143.u32[0];
      v178.i64[1] = v145.u32[0];
      v117 = (int32x4_t)vcgtq_u64(vaddl_u32(v119, *(uint32x2_t *)v140.i8), v139);
      v137 = (int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v128, v137), v120);
      v116 = (int8x16_t)vuzp1q_s32(v117, (int32x4_t)vcgtq_u64(vaddw_high_u32(v178, (uint32x4_t)v140), v139));
      v136 += 64;
      v140 = (int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v123, v140), v116);
    }
    while ((_DWORD)v136 != 256);
    v181 = vaddq_s32(vaddq_s32(v137, v140), vaddq_s32(v141, v142));
    v182 = vaddvq_s32(v181);
    if (vaddlvq_u32((uint32x4_t)v181) >> 32)
      v183 = -1;
    else
      v183 = v182;
    v184 = v183 + (unsigned __int16)(v240 + v242);
    *(_QWORD *)(a3 + 24) = ((unint64_t)(v240 + v242) << 48) | ((unint64_t)v183 << 32) | v184;
    a1 = v225;
  }
  else
  {
    v183 = -1;
    LODWORD(v184) = -1;
  }
  v185 = 2 * v107;
  v187 = v105 != -1 && v105 <= v185;
  v188 = *(_DWORD *)(a1 + 356);
  v189 = v188 > v106;
  v190 = 2 * v105;
  v192 = v107 != -1 && v107 <= v190;
  v193 = v188 > v108;
  v197 = (_DWORD)v184 != -1 && v184 <= v190 && v184 <= v185 && v188 > v183;
  v199 = v187 && v189;
  v198 = !v187 || !v189;
  if (v187 && v189)
    v200 = v106;
  else
    v200 = 0;
  if (v198)
    v201 = 0;
  else
    v201 = 4;
  v202 = v197 && v192 && v193;
  if (v192 && v193)
  {
    v200 = v108;
    v201 = 5;
  }
  if ((v199 & v202) != 0)
  {
    v203 = 6;
  }
  else
  {
    v183 = v200;
    v203 = v201;
  }
  if (v188 >= v183)
    v204 = v203;
  else
    v204 = 0;
  *(_BYTE *)(v3 + 32) = v204;
}

void sub_1B6904DDC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, int a5, int a6, int a7, unsigned int a8, unsigned __int8 a9, unsigned __int8 a10, char a11, unsigned __int8 a12)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int16 *v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  _BYTE *v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  int v52;
  _BOOL4 v53;
  uint64_t v54;
  unsigned __int16 *v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  BOOL v62;
  int v63;
  unsigned int v64;
  int i;
  unsigned int v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t j;
  int v76;
  _BOOL4 v77;
  unsigned int v78;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  int v82;
  char v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  unsigned int v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int v91;
  char v92;
  uint64_t v93;
  char *v94;
  unsigned int v95;
  char v96;
  uint64_t *v97;
  int v98;
  uint64_t v99;
  unsigned int v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  uint64_t v111;
  unsigned int v112;
  uint64_t v113;
  unsigned int v114;
  int v115;
  int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  uint64_t v127;
  unsigned int v128;
  unsigned int v129;
  unint64_t v130;
  uint64_t v131;
  unsigned int v132;
  unint64_t k;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  int v138;
  uint64_t v139;
  int v140;
  int v141;
  int v142;
  unsigned __int8 v143;
  _BOOL4 v145;
  unsigned int v146;
  uint64_t v147;
  int v148;
  int v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;
  uint64_t v154;
  int v155;
  unsigned int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unsigned int v160;
  unsigned __int8 v161;
  unsigned __int8 v162;
  uint64_t v163;
  unsigned __int8 v164;
  unsigned int v165;
  uint64_t v166;
  char v167;
  int v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unsigned __int8 v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  unint64_t v176;
  unsigned int v177;
  uint64_t v178;
  int v179;
  _BYTE *v180;
  uint64_t v181;
  unsigned int v182;
  unint64_t v183;
  uint64_t v184;
  unsigned int v185;
  int v186;
  unsigned int v187;
  unsigned int v188;
  uint64_t v190;
  int v191;
  uint64_t v192;
  unsigned int v193;
  unsigned int v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  int32x4_t v199;
  int32x4_t v200;
  uint64_t v201;
  int v202;
  unint64_t v203;
  int v204;
  int v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  unsigned int v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint8x16_t *v215;
  uint8x8_t *v216;
  uint64_t v217;
  const float *v218;
  const float *v219;
  int32x4_t v220;
  int32x4_t v221;
  int v222;
  uint16x8_t v223;
  uint16x8_t v224;
  int32x4_t v225;
  uint16x8_t v226;
  int32x4_t v227;
  int32x4_t v228;
  int32x4_t v229;
  int32x4_t v230;
  int32x4_t v231;
  int v232;
  _BOOL4 v233;
  int v234;
  _BOOL4 v235;
  int v236;
  unsigned int v237;
  _BYTE *v238;
  int v239;
  BOOL v240;
  unsigned int v241;
  unsigned int v242;
  BOOL v243;
  uint64_t v244;
  _BYTE *v245;
  int v246;
  int v247;
  uint64_t v248;
  int v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  unsigned int v253;
  uint64_t v254;
  _BYTE *v255;
  uint64_t v256;
  unsigned int v257;
  unsigned int v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  unsigned int v262;
  unsigned int v263;
  unsigned int *v264;
  unsigned int v265;
  unsigned int v266;
  unsigned int v267;
  unsigned int v268;
  int v269;
  int v270;
  int v271;
  unsigned int v272;
  BOOL v273;
  BOOL v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  _BYTE *v278;
  uint64_t v279;
  int v280;
  unsigned int v281;
  unsigned int v282;
  uint64_t v283;
  unint64_t v284;
  int v285;
  unsigned int v286;
  int v287;
  unint64_t v288;
  int v289;
  BOOL v290;
  int v291;
  int v292;
  int v293;
  BOOL v294;
  int v296;
  BOOL v297;
  int v298;
  int v299;
  BOOL v300;
  int v302;
  __int16 v303;
  BOOL v304;
  int v305;
  unsigned int m;
  unsigned int n;
  BOOL v308;
  char v309;
  unsigned int v310;
  int v311;
  _DWORD *v312;
  _DWORD *v313;
  _OWORD *v314;
  uint64_t v315;
  unsigned int v316;
  unsigned int v317;
  _BYTE *v318;
  int *v319;
  _OWORD *v320;
  uint64_t v321;
  int v322;
  int v323;
  int v324;
  unsigned int v325;
  int ii;
  uint64_t v327;
  unsigned int v328;
  uint64_t v329;
  uint64_t v330;
  int v331;
  int v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t jj;
  uint64_t v337;
  _BYTE *v338;
  _DWORD *v339;
  unsigned int *v340;
  _OWORD *v341;
  unsigned __int8 *v342;
  uint64_t v343;
  uint64_t v345;
  uint64_t v346;
  _BYTE *v347;
  _OWORD *kk;
  unsigned int v349;
  unsigned int v350;
  unsigned int v351;
  unsigned int v352;
  unsigned __int16 *v353;
  unsigned int v354;
  int v355;
  unsigned int v356;
  unsigned int v357;
  uint64_t v358;
  unint64_t v359;
  unsigned __int8 *v361;
  unsigned int v362;
  unsigned int v363;
  unsigned int v364;
  int v365;
  int v366;
  unsigned int v367;
  int v368;
  int v369;
  uint64_t v370;
  uint64_t v371;
  unsigned int v372;
  int v373;
  uint64_t v374;
  uint64_t v375;
  _DWORD *v376;
  unsigned int v377;
  _DWORD *v378;
  uint64_t v379;
  unint64_t v380;
  unsigned int v381;
  _DWORD *v382;
  unsigned int v383;
  int v384;
  _DWORD *v385;
  char v386;
  _DWORD *v387;
  _BOOL4 v388;
  uint64_t v389;
  _DWORD *v390;
  int v391;
  uint64_t v392;
  unsigned int v393;
  uint64_t v394;
  uint64_t v395;
  int v396;
  uint64_t v397;
  BOOL v398;
  _WORD *v399;
  int v401;
  uint64_t v402;
  int v403;
  int v404;
  int v405;
  unsigned int v406;
  _BYTE *v407;
  int v409;
  unsigned int v410;
  unsigned int v411;
  _DWORD v412[16];
  _BYTE v413[16];
  _DWORD v414[64];
  _OWORD v415[8];
  _BYTE v416[40];
  uint64_t v417;
  char v418;
  uint64_t v419;
  uint64_t v420;
  _QWORD v421[33];
  unsigned int v422;
  __int16 v423;
  __int16 v424;
  int v425;
  int v426;
  __int128 v427;
  __int128 v428;
  _DWORD v429[16];
  uint64_t v430[6];

  v14 = a3;
  v15 = a2;
  v16 = a1;
  v17 = a10;
  *(uint64_t *)((char *)&v430[4] + 4) = *MEMORY[0x1E0C80C00];
  v18 = (unsigned __int16 *)(a1 + 19112);
  v361 = (unsigned __int8 *)(a1 + 4912);
  if (a10 == 2)
    v17 = *v361 == 2;
  v409 = v17;
  v19 = *(unsigned __int8 *)(a1 + 19136);
  v404 = *v18;
  v401 = *(unsigned __int16 *)(a1 + 19114);
  v371 = *(unsigned __int8 *)(a1 + 19137);
  v20 = *a4;
  v21 = a4[1];
  v354 = *(unsigned __int8 *)(a1 + 19138);
  v362 = *(unsigned __int8 *)(a1 + 19139);
  v22 = *((_QWORD *)a4 + 15);
  memset(v415, 0, sizeof(v415));
  if (*(_BYTE *)(a1 + 24))
  {
    v25 = sub_1B68B436C(a3, v415, 1, 0);
    v15 = a2;
    v14 = a3;
    v16 = a1;
    if (v25)
    {
      v26 = v25;
      v27 = (uint64_t *)v415;
      do
      {
        v28 = *v27++;
        *(_DWORD *)(v28 + 19116) = 0;
        --v26;
      }
      while (v26);
    }
  }
  v29 = a12;
  v359 = v19;
  if (v14)
  {
    if (a12)
      goto LABEL_9;
    v30 = 0;
    if (*(_BYTE *)(v16 + 24) || !v409)
      goto LABEL_10;
    if (v361[2] <= 3u)
LABEL_9:
      v30 = 1;
    else
      v30 = 0;
LABEL_10:
    if (*((_BYTE *)v18 + 16) == 1)
    {
      v31 = sub_1B68B43F0(v14, v415, v30);
      v32 = v31;
      if (v31)
      {
        v33 = v31;
        v34 = (uint64_t *)v415;
        v35 = v31;
        do
        {
          v36 = *v34++;
          *(_BYTE *)(v36 + 23) = -1;
          --v35;
        }
        while (v35);
        v37 = v14;
        v38 = 0;
        v39 = 0;
        v40 = (uint64_t *)v415;
        do
        {
          v41 = *v40;
          if (*v40)
          {
            v42 = v39;
            if (!*(_BYTE *)(v41 + 14))
            {
              v43 = *(_DWORD *)(v41 + 1276);
              if (v43 >= v38 && v43 < *(_DWORD *)(a1 + 1276))
              {
                v42 = *v40;
                v38 = *(_DWORD *)(v41 + 1276);
              }
            }
            v39 = v42;
          }
          ++v40;
          --v33;
        }
        while (v33);
      }
      else
      {
        v37 = v14;
        v39 = 0;
      }
      v47 = v39;
      v44 = sub_1B68B460C(v37);
      if (v44 && *((unsigned __int16 *)v44 + 9556) != *v18 && *((unsigned __int16 *)v44 + 9557) != v18[1])
        v44 = 0;
    }
    else
    {
      if (a7)
      {
        v37 = v14;
        v45 = sub_1B68B4654(v14, v415, v16, v30, *((unsigned __int8 *)v18 + 266));
        v32 = v45;
        if (v45)
        {
          v46 = 0;
          v47 = 0;
          v48 = (uint64_t *)v415;
          v49 = v45;
          do
          {
            v50 = *v48;
            if (*v48)
            {
              if (!*(_BYTE *)(v50 + 14))
              {
                v51 = *(_DWORD *)(v50 + 1276);
                if (v51 >= v46 && v51 < *(_DWORD *)(a1 + 1276))
                {
                  v47 = *v48;
                  v46 = *(_DWORD *)(v50 + 1276);
                }
              }
            }
            ++v48;
            --v49;
          }
          while (v49);
        }
        else
        {
          v47 = 0;
        }
      }
      else
      {
        v37 = v14;
        v32 = sub_1B68B436C(v14, v415, 1, (_BYTE *)v16);
        v47 = sub_1B68B459C(v14, v16);
      }
      v44 = sub_1B68B460C(v37);
    }
    v16 = a1;
    v15 = v47;
    v14 = v37;
    v29 = a12;
    goto LABEL_48;
  }
  v44 = 0;
  v32 = v15 != 0;
  *(_QWORD *)&v415[0] = v15;
LABEL_48:
  v407 = v44;
  v367 = v20;
  v355 = a7;
  v356 = v21;
  v370 = v22;
  if (!a11 || v29)
  {
    v63 = v409;
    if (v32)
      goto LABEL_97;
    goto LABEL_69;
  }
  v52 = *((unsigned __int8 *)v18 + 266);
  v53 = v32 < 2;
  if (!v32)
  {
    v56 = 0;
    v63 = v409;
    goto LABEL_91;
  }
  v391 = *((unsigned __int8 *)v18 + 266);
  v394 = v14;
  v396 = a5;
  v54 = v15;
  v55 = v18;
  v56 = 0;
  v57 = v16 + 19320;
  v58 = (uint64_t *)v415;
  v372 = v32;
  v59 = v32;
  do
  {
    v60 = *v58;
    v61 = sub_1B68BF148(v57, *v58 + 19320) + -1.0;
    if (v61 <= 0.0)
      v61 = -v61;
    if (*(_BYTE *)(v60 + 14))
      goto LABEL_55;
    v62 = v61 >= 0.001 || v60 == v54;
    if (!v62)
      v53 = 1;
    if (v60 == v54)
    {
LABEL_55:
      v16 = a1;
LABEL_56:
      *((_QWORD *)v415 + v56++) = v60;
      goto LABEL_57;
    }
    v16 = a1;
    if (*(_DWORD *)(v60 + 19352) == *((_DWORD *)v55 + 60) && v61 < 0.005)
      goto LABEL_56;
LABEL_57:
    ++v58;
    --v59;
  }
  while (v59);
  v63 = v409;
  v18 = v55;
  if (v56 >= v372)
  {
    v21 = v356;
    v15 = v54;
    a5 = v396;
LABEL_89:
    v14 = v394;
    goto LABEL_90;
  }
  v21 = v356;
  a5 = v396;
  if (!v56)
  {
    v15 = 0;
    goto LABEL_89;
  }
  v68 = 0;
  v15 = 0;
  v69 = (uint64_t *)v415;
  v70 = v56;
  v14 = v394;
  do
  {
    v71 = *v69;
    if (*v69)
    {
      v72 = v15;
      if (!*(_BYTE *)(v71 + 14))
      {
        v73 = *(_DWORD *)(v71 + 1276);
        if (v73 >= v68 && v73 < *(_DWORD *)(a1 + 1276))
        {
          v72 = *v69;
          v68 = *(_DWORD *)(v71 + 1276);
        }
      }
      v15 = v72;
    }
    ++v69;
    --v70;
  }
  while (v70);
LABEL_90:
  v52 = v391;
LABEL_91:
  if (!v53 || v52 != 0)
    v63 = 1;
  v32 = v56;
  a7 = v355;
  v29 = a12;
  if (!v32)
  {
LABEL_69:
    if (v21)
    {
      v64 = 0;
      for (i = 0; i != v21; ++i)
      {
        v66 = v64;
        v67 = v20;
        if ((_DWORD)v20)
        {
          do
          {
            *(_WORD *)(v22 + 216 * v66++ + 56) = 4096;
            --v67;
          }
          while (v67);
        }
        v64 += v20;
      }
    }
    return;
  }
LABEL_97:
  v395 = v15;
  for (j = 0; j != v32; v412[j++] = v77)
  {
    v76 = *(unsigned __int16 *)(*((_QWORD *)v415 + j) + 19112);
    if (*(unsigned __int16 *)(*((_QWORD *)v415 + j) + 19116) == v76
      && *(unsigned __int16 *)(*((_QWORD *)v415 + j) + 19118) == *(unsigned __int16 *)(*((_QWORD *)v415 + j) + 19114))
    {
      v77 = 0;
    }
    else
    {
      v77 = v76 != *(unsigned __int16 *)(*((_QWORD *)v415 + j) + 19120)
         || *(unsigned __int16 *)(*((_QWORD *)v415 + j) + 19114) != *(unsigned __int16 *)(*((_QWORD *)v415 + j)
                                                                                          + 19122);
    }
  }
  if ((v404 + 15) >> 4 >= v20)
    v78 = v20;
  else
    v78 = (v404 + 15) >> 4;
  if ((v401 + 15) >> 4 >= v21)
    v79 = v21;
  else
    v79 = (v401 + 15) >> 4;
  v349 = v79;
  v350 = v78;
  v351 = (v401 + 15) >> 4;
  v352 = (v404 + 15) >> 4;
  if (!v29 && v32 > a9)
  {
    if (v32 < 1)
    {
      v82 = 0;
      LODWORD(v85) = 0;
    }
    else
    {
      v80 = 0;
      v81 = 0;
      v82 = 0;
      v83 = 1;
      do
      {
        v84 = v83 | (v81 < *(_DWORD *)(*((_QWORD *)v415 + v80) + 1276));
        v83 = 0;
        if ((v84 & 1) != 0)
        {
          v82 = v80;
          v81 = *(_DWORD *)(*((_QWORD *)v415 + v80) + 1276);
        }
        ++v80;
      }
      while (v32 != v80);
      v85 = *(_QWORD *)&v415[0];
      *(_QWORD *)&v415[0] = *((_QWORD *)v415 + v82);
      *((_QWORD *)v415 + v82) = v85;
      LODWORD(v85) = 1;
    }
    if (v85 >= a9)
      goto LABEL_139;
    v86 = v85;
    v85 = v32 <= (uint64_t)v85 ? v85 : v32;
    while (2)
    {
      if (v86 == v85)
      {
LABEL_139:
        if ((int)v85 < a9)
        {
          v94 = (char *)v415 + 8 * v85;
          v85 = v85;
          do
          {
            if (v32 <= (int)v85)
              break;
            v95 = 0;
            v96 = 1;
            v97 = (uint64_t *)v94;
            v98 = v85;
            do
            {
              v99 = *v97++;
              v100 = *(_DWORD *)(v99 + 1276);
              v101 = v96 | (v100 > v95);
              v96 = 0;
              if ((v101 & 1) != 0)
              {
                v82 = v98;
                v95 = v100;
              }
              ++v98;
            }
            while (v32 > v98);
            v102 = *((_QWORD *)v415 + v85);
            *((_QWORD *)v415 + v85) = *((_QWORD *)v415 + v82);
            *((_QWORD *)v415 + v82) = v102;
            ++v85;
            v94 += 8;
          }
          while ((int)v85 < a9);
        }
      }
      else
      {
        v87 = 0;
        v88 = 1;
        v89 = v86;
        do
        {
          while (1)
          {
            v90 = *((_QWORD *)v415 + v89);
            if (!*(_BYTE *)(v90 + 25) || !*(_BYTE *)(v90 + 1356))
              break;
            v91 = *(_DWORD *)(v90 + 1276);
            v92 = v88 | (v91 > v87);
            v88 = 0;
            if ((v92 & 1) != 0)
            {
              v82 = v89;
              v87 = v91;
            }
            if (++v89 >= v32)
              goto LABEL_135;
          }
          ++v89;
        }
        while (v89 < v32);
        if ((v88 & 1) != 0)
        {
          LODWORD(v85) = v86;
          goto LABEL_139;
        }
LABEL_135:
        v93 = *((_QWORD *)v415 + v86);
        *((_QWORD *)v415 + v86) = *((_QWORD *)v415 + v82);
        *((_QWORD *)v415 + v82) = v93;
        if (++v86 != a9)
          continue;
        LODWORD(v85) = a9;
      }
      break;
    }
    if ((int)v85 < v32)
    {
      v103 = 0;
      do
        *(_BYTE *)(*((_QWORD *)v415 + v85 + v103++) + 32) = 0;
      while (v32 > (int)v85 + (int)v103);
    }
    v32 = v85;
  }
  v104 = v32;
  if (v14)
  {
    v104 = v32;
    if (a7)
    {
      v104 = sub_1B68B4314(v14);
      v16 = a1;
    }
  }
  if (v32)
  {
    v105 = 0;
    v106 = 1 << v361[112];
    do
    {
      v107 = *((_QWORD *)v415 + v105);
      v414[v105] = 0;
      v413[v105] = 0;
      v414[v105 + 48] = 0;
      v414[v105 + 32] = v106;
      v414[v105 + 16] = 0;
      if (v107)
      {
        LOBYTE(v108) = v105;
        if (a7)
        {
          LOBYTE(v108) = v105;
          if (v104)
          {
            v109 = 0;
            v108 = 0;
            v110 = *(_DWORD *)(v107 + 1276);
            while (v110 != *(_DWORD *)(v16 + (v109 >> 54) + 18468))
            {
              ++v108;
              v109 += 0x100000000000000;
              if (v104 == v108)
              {
                LOBYTE(v108) = v105;
                break;
              }
            }
          }
        }
        if (a5 && *(_BYTE *)(v16 + 3 * (char)v108 + 5026))
        {
          v414[v105 + 48] = 1;
          v111 = v16 + 6 * (char)v108;
          v414[v105 + 32] = *(__int16 *)(v111 + 5410);
          v414[v105 + 16] = *(__int16 *)(v111 + 5794);
        }
      }
      ++v105;
    }
    while (v105 != v32);
  }
  v373 = v32;
  v353 = v18;
  if (!v63)
  {
    v159 = v370;
    if (v354 > v362)
    {
      v364 = 0;
      v160 = 0;
      goto LABEL_399;
    }
    v160 = 0;
    v364 = 0;
    v366 = ~(_DWORD)v20;
    v380 = (v20 - 1);
    v199 = 0uLL;
    v200.i64[0] = 0xFF000000FFLL;
    v200.i64[1] = 0xFF000000FFLL;
    v411 = v354;
    v201 = v395;
    v202 = a6;
    while (1)
    {
      v203 = v359;
      if (v359 <= v371)
        break;
LABEL_354:
      v62 = v411++ == v362;
      if (v62)
        goto LABEL_400;
    }
    v369 = v411 * v367;
    v204 = 16 * v411;
LABEL_286:
    v205 = v369 + v203;
    if (!v32)
    {
      v160 = 0;
      v393 = 0;
      v403 = 0;
      LODWORD(v211) = -1;
      LODWORD(v217) = -1;
      v209 = -1;
      if (!v202)
        goto LABEL_339;
LABEL_327:
      ++v414[v160];
      v238 = (_BYTE *)*((_QWORD *)v415 + v160);
      if (v407)
      {
        v239 = v369 + v203;
        if (v238 == v407)
        {
          v238 = v407;
        }
        else
        {
          v240 = v209 > ((v217 >> 1) & 0x3FFFFFFF) && v209 > 0x200;
          v241 = v364;
          if (v240)
            v242 = v364 + 1;
          else
            v242 = v364;
          if (*((_BYTE **)v415 + v393) != v407)
            v241 = v242;
          v364 = v241;
        }
      }
      else
      {
        v239 = v369 + v203;
      }
      v159 = v370;
      if (v238[1356])
        v243 = v238[14] == 0;
      else
        v243 = 0;
      v244 = v370 + 216 * v239;
      *(_BYTE *)(v244 + 67) = v243;
      v245 = (_BYTE *)(v244 + 69);
      if (v211 > 0x2FF)
      {
        *v245 = 0;
        v249 = *((_DWORD *)v238 + 319);
        v247 = *(_DWORD *)(v201 + 1276);
        v202 = a6;
        if (v249 != v247)
        {
LABEL_351:
          v251 = v370 + 216 * v239;
          *(_DWORD *)(v251 + 52) = v247;
          *(_BYTE *)(v251 + 66) = 2;
          goto LABEL_352;
        }
      }
      else
      {
        *v245 = 1;
        v246 = *((_DWORD *)v238 + 319);
        v247 = *(_DWORD *)(v201 + 1276);
        v202 = a6;
        if (v246 != v247)
        {
          if (3 * v403 > (4 * v211))
          {
            v248 = v370 + 216 * v239;
            *(_DWORD *)(v248 + 52) = 0;
            *(_BYTE *)(v248 + 66) = 1;
            goto LABEL_352;
          }
          goto LABEL_351;
        }
      }
      v250 = v370 + 216 * v239;
      *(_BYTE *)(v250 + 66) = 1;
      *(_DWORD *)(v250 + 52) = 0;
      goto LABEL_352;
    }
    v206 = 0;
    v403 = 0;
    v393 = 0;
    v160 = 0;
    v207 = 16 * v203;
    v208 = v159 + 216 * v205;
    v399 = (_WORD *)(v208 + 56);
    v385 = (_DWORD *)(v208 - 168);
    v378 = (_DWORD *)(v159 + 216 * (v205 + v366) + 48);
    v382 = (_DWORD *)(v159 + 216 * (v205 - v367) + 48);
    v376 = (_DWORD *)(v159 + 216 * (v205 - v367 + 1) + 48);
    v387 = (_DWORD *)(v208 + 48);
    v390 = (_DWORD *)(v208 + 52);
    v209 = -1;
    v210 = 0xFFFFFFFFLL;
    v211 = 0xFFFFFFFFLL;
    while (1)
    {
      v212 = *((_QWORD *)v415 + v206);
      v213 = *(int *)(v16 + 232);
      v214 = *(int *)(v212 + 232);
      v215 = (uint8x16_t *)(*(_QWORD *)(v16 + 128) + v207 + (v213 * v204));
      v216 = (uint8x8_t *)(*(_QWORD *)(v212 + 128) + v207 + (v214 * v204));
      if (v414[v206 + 48])
      {
        LODWORD(v217) = 0;
        v218 = (const float *)&v414[v206 + 32];
        v219 = (const float *)&v414[v206 + 16];
        v220 = (int32x4_t)vld1q_dup_f32(v218);
        v221 = (int32x4_t)vld1q_dup_f32(v219);
        v222 = 16;
        do
        {
          v223 = vmovl_high_u8(*v215);
          v224 = vmovl_u8(*(uint8x8_t *)v215->i8);
          v225 = (int32x4_t)vmovl_u8(*v216);
          v226 = vmovl_high_u8(*(uint8x16_t *)v216->i8);
          v227.i64[0] = 0x2000000020;
          v227.i64[1] = 0x2000000020;
          v228 = vmlaq_s32(v227, v220, (int32x4_t)vmovl_high_u16((uint16x8_t)v225));
          v229.i64[0] = 0x2000000020;
          v229.i64[1] = 0x2000000020;
          v230 = vmlaq_s32(v229, v220, (int32x4_t)vmovl_u16(*(uint16x4_t *)v225.i8));
          v225.i64[0] = 0x2000000020;
          v225.i64[1] = 0x2000000020;
          v231.i64[0] = 0x2000000020;
          v231.i64[1] = 0x2000000020;
          v217 = vaddvq_s32(vaddq_s32((int32x4_t)vabaq_u32(vabaq_u32((uint32x4_t)v217, (uint32x4_t)vmaxq_s32(vminq_s32(vsraq_n_s32(v221, v230, 6uLL), v200), v199), vmovl_u16(*(uint16x4_t *)v224.i8)), (uint32x4_t)vmaxq_s32(vminq_s32(vsraq_n_s32(v221, vmlaq_s32(v231, v220, (int32x4_t)vmovl_u16(*(uint16x4_t *)v226.i8)), 6uLL), v200), v199),
                                                vmovl_u16(*(uint16x4_t *)v223.i8)),
                                   (int32x4_t)vabaq_u32(vabdq_u32((uint32x4_t)vmaxq_s32(vminq_s32(vsraq_n_s32(v221, v228, 6uLL), v200), v199), vmovl_high_u16(v224)), (uint32x4_t)vmaxq_s32(vminq_s32(vsraq_n_s32(v221, vmlaq_s32(v225, v220, (int32x4_t)vmovl_high_u16(v226)), 6uLL), v200), v199), vmovl_high_u16(v223))));
          v215 = (uint8x16_t *)((char *)v215 + v213);
          v216 = (uint8x8_t *)((char *)v216 + v214);
          --v222;
        }
        while (v222);
      }
      else
      {
        v217 = off_1EF13A3C8(*(_QWORD *)(v16 + 128) + v207 + (v213 * v204));
        v200.i64[0] = 0xFF000000FFLL;
        v200.i64[1] = 0xFF000000FFLL;
        v199 = 0uLL;
        v202 = a6;
        v201 = v395;
        v16 = a1;
      }
      if (v212 == v201)
      {
        *v399 = v217;
        v217 = v217 - (v217 >> 2);
        v403 = v217;
        if (!v202)
          goto LABEL_324;
      }
      else if (!v202)
      {
        goto LABEL_324;
      }
      if (v411 | v203)
      {
        v232 = *(_DWORD *)(v212 + 1276);
        if (v203)
        {
          if (v411)
            v233 = v232 != *v378;
          else
            v233 = 1;
          v234 = v233 + (v232 != *v385);
        }
        else
        {
          v234 = 2;
        }
        if (v411)
        {
          if (v232 != *v382)
            ++v234;
          v235 = v203 >= v380 || v232 != *v376;
          v236 = v234 + v235;
        }
        else
        {
          v236 = v234 + 2;
        }
        if (v236 == 4)
          v237 = v217 >> 1;
        else
          v237 = 0;
        v217 = v237 + v217;
      }
      if ((_BYTE *)v212 == v407)
        v209 = v217;
      if (v217 < v211)
        break;
      if (v217 >= v210)
        goto LABEL_324;
      *v390 = *(_DWORD *)(v212 + 1276);
      v393 = v206;
LABEL_325:
      ++v206;
      v210 = v217;
      if (v206 == v32)
      {
        if (v202)
          goto LABEL_327;
LABEL_339:
        v159 = v370;
LABEL_352:
        v62 = v203++ == v371;
        if (v62)
          goto LABEL_354;
        goto LABEL_286;
      }
    }
    if (v211 < v210)
    {
      *v390 = *(_DWORD *)(*((_QWORD *)v415 + v160) + 1276);
      v210 = v211;
      v393 = v160;
    }
    *v387 = *(_DWORD *)(v212 + 1276);
    v160 = v206;
    v211 = v217;
LABEL_324:
    v217 = v210;
    goto LABEL_325;
  }
  v112 = *((unsigned __int8 *)v18 + 26);
  v113 = *((unsigned __int8 *)v18 + 25);
  v114 = *((unsigned __int8 *)v18 + 27);
  v392 = *(_QWORD *)(v16 + 4920);
  v410 = *(_DWORD *)(v16 + 4800);
  v379 = *((unsigned __int8 *)v18 + 24);
  v115 = v113 - v379 + ((v114 - v112 - (v113 - v379)) & ((int)(v114 - v112 - (v113 - v379)) >> 31)) + 3;
  v116 = v115 >> 2;
  if ((v115 >> 2) >= 4)
    v116 = 4;
  if (v115 < 4)
    v117 = 1;
  else
    v117 = v116;
  bzero(*(void **)(v16 + 4616), *(unsigned int *)(v16 + 4564));
  v118 = v112 + (v117 >> 1);
  v119 = v118 + v117;
  v377 = v114;
  if (v118 + v117 - 1 <= v114)
  {
    v120 = 0;
    v121 = (v117 >> 1) + v379;
    do
    {
      v122 = v118;
      v118 = v119;
      if (v121 + v117 - 1 <= v113)
      {
        v123 = (v117 >> 1) + v379;
        v124 = v121 + v117;
        do
        {
          if (v122 < v118)
          {
            v125 = 0;
            v126 = v122;
            do
            {
              if (v123 < v124)
              {
                v128 = v123 + v126 * *(unsigned __int16 *)(a1 + 4562);
                v129 = v117;
                do
                {
                  v127 = *(_QWORD *)(a1 + 4696);
                  if (v125 <= *(unsigned __int16 *)(v127 + 2 * v128))
                  {
                    v125 = *(unsigned __int16 *)(v127 + 2 * v128);
                    v120 = v128;
                  }
                  ++v128;
                  --v129;
                }
                while (v129);
              }
              ++v126;
            }
            while (v126 != v118);
          }
          *(_BYTE *)(*(_QWORD *)(a1 + 4616) + v120) = 1;
          v124 += v117;
          v123 += v117;
        }
        while (v124 - 1 <= v113);
      }
      v119 = v118 + v117;
    }
    while (v118 + v117 - 1 <= v114);
  }
  *(_DWORD *)(a1 + 4600) = 0;
  v130 = *(unsigned int *)(a1 + 4564);
  v131 = v395;
  v132 = v410;
  if ((_DWORD)v130)
  {
    for (k = 0; k < v130; ++k)
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 4616) + k))
      {
        v134 = *(_QWORD *)(a1 + 4608);
        v135 = *(unsigned int *)(a1 + 4600);
        *(_DWORD *)(a1 + 4600) = v135 + 1;
        *(_DWORD *)(v134 + 4 * v135) = k;
        v130 = *(unsigned int *)(a1 + 4564);
      }
    }
  }
  v375 = v113;
  v363 = v112;
  if (v32 < 1)
  {
    v138 = -1;
    v137 = -1;
LABEL_222:
    v161 = v373;
    if (v373 >= 3)
      v162 = 3;
    else
      v162 = v373;
    v406 = v162;
    if (v162 && v373)
    {
      v163 = 0;
      v164 = 0;
      v165 = ~(-1 << v373);
      v402 = 4 * v373;
      v398 = v137 >= 0 && v138 == -1 || v138 >= 0;
      if (v137 >= 0 && v138 == -1)
        v166 = v137;
      else
        v166 = v138;
      v389 = v166;
      if (v137 >= 0 && v138 == -1)
        v167 = 3;
      else
        v167 = 2;
      v386 = v167;
      if (v137 >= 0 && v138 == -1)
        v168 = 4;
      else
        v168 = 2;
      v384 = v168;
      v169 = v392 + 72;
      v170 = 1;
      do
      {
        v171 = v169;
        v172 = v164;
        v173 = v170;
        bzero(v414, v402);
        v174 = v163;
        v175 = *(_DWORD *)(a1 + 4600);
        if (v163 == 0 && v398)
          v414[v389] = (v175 + v384) >> v386;
        v169 = v171;
        if (v175)
        {
          v176 = 0;
          do
          {
            v177 = *(_DWORD *)(*(_QWORD *)(a1 + 4608) + 4 * v176);
            *(_BYTE *)(v392 + 216 * v177 + 200) = v373;
            if ((_BYTE)v373)
            {
              v178 = 0;
              v179 = 0;
              v180 = (_BYTE *)(v392 + 216 * v177 + 201);
              v181 = v169 + 216 * v177;
              v182 = -1;
              do
              {
                if (v182 >= *(_DWORD *)(v181 + 4 * v178) && ((v165 >> v178) & 1) != 0)
                {
                  *v180 = v178;
                  v182 = *(_DWORD *)(v181 + 4 * v178);
                  v179 = 1;
                }
                ++v178;
              }
              while (v373 != v178);
              if (v179)
                ++v414[*v180];
            }
            ++v176;
            v183 = *(unsigned int *)(a1 + 4600);
          }
          while (v176 < v183);
        }
        else
        {
          LODWORD(v183) = 0;
        }
        if (v373 < 1)
        {
          v186 = 0;
        }
        else
        {
          v184 = 0;
          v185 = 0;
          v186 = 0;
          do
          {
            v187 = v414[v184];
            if (v187 == v185 && v137 == v184)
            {
              v186 = v184;
              v188 = v414[v184];
            }
            else
            {
              v188 = v185;
            }
            if (v187 <= v185)
            {
              v185 = v188;
            }
            else
            {
              v186 = v184;
              v185 = v414[v184];
            }
            ++v184;
          }
          while (v373 != v184);
        }
        *((_BYTE *)v430 + v163) = v186;
        v165 &= ~(1 << v186);
        if (v412[v186])
          v164 = v172 + 1;
        else
          v164 = v172;
        if (a8 == v164 && v373 >= 1)
        {
          v190 = 0;
          do
          {
            if (v412[v190])
              v191 = ~(1 << v190);
            else
              v191 = -1;
            v165 &= v191;
            ++v190;
          }
          while (v373 != v190);
        }
        ++v163;
        if (v406 <= (int)v174 + 1)
          break;
        v170 = v173 + 1;
      }
      while (v165);
      v192 = v174;
      v193 = LOBYTE(v430[0]);
      bzero(v414, v402);
      if ((_BYTE)v163)
      {
        v194 = 0;
        v195 = v430;
        v16 = a1;
        v161 = v373;
        v196 = v392;
        v197 = v192;
        do
        {
          v198 = *(unsigned __int8 *)v195;
          v195 = (uint64_t *)((char *)v195 + 1);
          v194 |= 1 << v198;
          v414[v198] = v173;
          --v197;
          --v173;
        }
        while (v197 != -1);
        if (!(_DWORD)v183)
          goto LABEL_367;
        goto LABEL_359;
      }
      v194 = 0;
      v16 = a1;
      v161 = v373;
    }
    else
    {
      bzero(v414, 4 * v373);
      v193 = 0;
      v194 = 0;
      v16 = a1;
      LODWORD(v183) = *(_DWORD *)(a1 + 4600);
    }
    v196 = v392;
    if (!(_DWORD)v183)
    {
LABEL_367:
      v258 = v363;
      if (v363 > v377)
        goto LABEL_398;
      while (v379 > v375)
      {
LABEL_396:
        v62 = v258++ == v377;
        if (v62)
          goto LABEL_398;
      }
      v259 = *((_QWORD *)v415 + v193);
      v260 = v379;
      while (1)
      {
        v261 = *(unsigned int *)(a1 + 4600);
        if ((_DWORD)v261)
        {
          v262 = 0;
          v263 = 0;
          v264 = *(unsigned int **)(a1 + 4608);
          v265 = -1;
          v266 = -1;
          do
          {
            v268 = *v264++;
            v267 = v268;
            v269 = v268 / v410;
            v270 = v268 / v410 * v410 - v268 + v260;
            if (v270 < 0)
              v270 = -v270;
            v271 = v258 - v269;
            if (v271 < 0)
              v271 = -v271;
            v272 = v271 + v270;
            v273 = v265 > v272;
            if (v265 >= v272)
              v265 = v272;
            if (v273)
              v262 = v267;
            v274 = v266 > v272;
            if (v266 <= v272)
            {
              v267 = v263;
            }
            else
            {
              v265 = v266;
              v266 = v272;
            }
            if (v274)
              v262 = v263;
            v263 = v267;
            --v261;
          }
          while (v261);
        }
        else
        {
          v267 = 0;
          v262 = 0;
        }
        v275 = *(unsigned __int8 *)(v196 + 216 * v267 + 201);
        v276 = *(unsigned __int8 *)(v196 + 216 * v262 + 201);
        v277 = (int)(v258 * v410 + v260);
        *(_DWORD *)(v196 + 216 * v277 + 48) = *(_DWORD *)(v259 + 1276);
        if (v193 != (_DWORD)v275)
          break;
        v278 = (_BYTE *)(v196 + 216 * (int)v277 + 66);
        if (v193 != (_DWORD)v276)
        {
          *v278 = 2;
          v280 = *(_DWORD *)(*((_QWORD *)v415 + v276) + 1276);
          v279 = v196 + 216 * (int)v277;
          goto LABEL_393;
        }
        *v278 = 1;
LABEL_394:
        v62 = v260++ == v375;
        if (v62)
          goto LABEL_396;
      }
      v279 = v196 + 216 * (int)v277;
      *(_BYTE *)(v279 + 66) = 2;
      v280 = *(_DWORD *)(*((_QWORD *)v415 + v275) + 1276);
LABEL_393:
      *(_DWORD *)(v279 + 52) = v280;
      goto LABEL_394;
    }
LABEL_359:
    v252 = 0;
    do
    {
      v253 = *(_DWORD *)(*(_QWORD *)(a1 + 4608) + 4 * v252);
      *(_BYTE *)(v196 + 216 * v253 + 200) = v161;
      if (v161)
      {
        v254 = 0;
        v255 = (_BYTE *)(v196 + 216 * v253 + 201);
        v256 = v196 + 72 + 216 * v253;
        v257 = -1;
        do
        {
          if (v257 >= *(_DWORD *)(v256 + 4 * v254) && ((v194 >> v254) & 1) != 0)
          {
            *v255 = v254;
            v257 = *(_DWORD *)(v256 + 4 * v254);
          }
          ++v254;
        }
        while (v161 != v254);
      }
      ++v252;
    }
    while (v252 < *(unsigned int *)(a1 + 4600));
    goto LABEL_367;
  }
  v136 = 0;
  v374 = v113 - v379 + 1;
  v357 = v379 + v410 * v112;
  v137 = -1;
  v138 = -1;
  v358 = v32;
  while (1)
  {
    v139 = *((_QWORD *)v415 + v136);
    v140 = *(unsigned __int8 *)(v139 + 14);
    if (v139 == v131)
      v137 = v136;
    if (*(_BYTE *)(v139 + 14))
      v138 = v136;
    v368 = v138;
    v16 = a1;
    if (sub_1B68BB95C(*(unsigned __int8 **)(v139 + 488)))
      break;
    v365 = v137;
    *(_DWORD *)(*(_QWORD *)(v139 + 488) + 164) = 1;
    v141 = v414[v136 + 32];
    v397 = v136;
    v142 = v414[v136 + 16];
    v143 = v361[112];
    v416[32] = v414[v136 + 48];
    v416[33] = 0;
    v416[34] = v141;
    v416[35] = 0;
    v416[36] = v142;
    v416[37] = 0;
    v416[38] = v143;
    v418 = 0;
    if (v112 <= v377)
    {
      v145 = v139 == v395 || v140 != 0;
      v388 = v145;
      v383 = v357;
      v381 = v363;
      do
      {
        if (v379 <= v113)
        {
          v405 = v381 * v132;
          v146 = v383;
          v147 = v374;
          v148 = v379;
          do
          {
            if (*(_BYTE *)(*(_QWORD *)(a1 + 4616) + v146))
            {
              v419 = v139;
              v420 = 0;
              v417 = 0x10000000040;
              v425 = 0;
              v149 = v146 / v132;
              v150 = v405 + v148 - v146 / v132 * v410;
              v151 = *(_QWORD *)(a1 + 4816);
              v152 = v151 + 36 * v146;
              off_1EF13A478(v421, *(_QWORD *)(a1 + 128) + (16 * v150) + (16 * v149 * *(_DWORD *)(a1 + 232)));
              v423 = v150;
              v132 = v410;
              v424 = v149;
              v422 = v146;
              v421[32] = v421;
              v426 = 0xFFFF;
              v427 = 0u;
              v428 = 0u;
              sub_1B6903C34((uint64_t)v416, (uint64_t)v430);
              sub_1B6904100((uint64_t)v416, v430, v152);
              if (*(_BYTE *)(v152 + 32))
              {
                v153 = *(unsigned __int8 *)(v152 + 32) - 4;
                v154 = v151 + 36 * v146 + 8 * v153;
                v155 = *(_DWORD *)(v152 + 4 * v153);
                v156 = *(unsigned __int16 *)(v154 + 12);
                v429[v397] += v156;
                if (v388)
                  v156 = (7 * v156) >> 3;
                v157 = v392 + 216 * (int)v146;
                *(_DWORD *)(v157 + 4 * v397 + 72) = v156;
                v158 = v157 + 2 * v397;
                *(_WORD *)(v158 + 136) = v155;
                *(_WORD *)(v158 + 168) = HIWORD(v155);
              }
            }
            ++v148;
            ++v146;
            --v147;
          }
          while (v147);
        }
        v383 += v132;
        v62 = v381++ == v377;
        LODWORD(v113) = v375;
      }
      while (!v62);
    }
    *(_DWORD *)(*(_QWORD *)(v139 + 488) + 164) = 0;
    v131 = v395;
    v136 = v397 + 1;
    v112 = v363;
    v137 = v365;
    v138 = v368;
    if (v397 + 1 == v358)
      goto LABEL_222;
  }
LABEL_398:
  v364 = 0;
  v160 = 0;
  v159 = v370;
LABEL_399:
  v201 = v395;
  v202 = a6;
LABEL_400:
  if (v202)
  {
    v281 = a8;
    v282 = v354;
    if (v201 && v354 <= v362)
    {
      v283 = *(_QWORD *)(v395 + 4920);
      v284 = v367 - 1;
      v285 = v367 * v354;
      v286 = v367 + v367 * v354;
      v287 = v367 * (v354 - 1);
      while (1)
      {
        v288 = v359;
        if (v359 <= v371)
          break;
LABEL_454:
        v285 += v367;
        v286 += v367;
        v287 += v367;
        v62 = v282++ == v362;
        if (v62)
          goto LABEL_456;
      }
      while (2)
      {
        if (*(_BYTE *)(v283 + 216 * (v285 + (int)v288) + 67))
        {
          if (v282)
          {
            if (v288)
              v289 = *(unsigned __int8 *)(v283 + 216 * (v287 + v288 - 1) + 69);
            else
              v289 = 1;
            if (v288 >= v284)
              v293 = 1;
            else
              v293 = *(unsigned __int8 *)(v283 + 216 * (v287 + v288 + 1) + 69);
            if (*(_BYTE *)(v283 + 216 * (v287 + v288) + 69))
              v294 = v293 == 0;
            else
              v294 = 1;
            v291 = v294 || v289 == 0;
            if (v288)
            {
LABEL_426:
              v292 = *(unsigned __int8 *)(v283 + 216 * (v285 + (int)v288 - 1) + 69);
LABEL_427:
              if (v288 >= v284)
                v296 = 1;
              else
                v296 = *(unsigned __int8 *)(v283 + 216 * (v285 + (int)v288 + 1) + 69);
              if (v292)
                v297 = v296 == 0;
              else
                v297 = 1;
              if (v297)
                v291 = 1;
              if (v282 < v356 - 1)
              {
                v298 = v288 ? *(unsigned __int8 *)(v283 + 216 * (v286 + v288 - 1) + 69) : 1;
                v299 = v288 >= v284 ? 1 : *(unsigned __int8 *)(v283 + 216 * (v286 + v288 + 1) + 69);
                v300 = !v298 || *(_BYTE *)(v283 + 216 * (v286 + v288) + 69) == 0;
                if (v300 || v299 == 0)
                  v291 = 1;
              }
              v290 = v291 == 0;
LABEL_453:
              *(_BYTE *)(v159 + 216 * (v285 + v288++) + 68) = v290;
              if (v371 + 1 == v288)
                goto LABEL_454;
              continue;
            }
          }
          else
          {
            v291 = 0;
            if (v288)
              goto LABEL_426;
          }
          v292 = 1;
          goto LABEL_427;
        }
        break;
      }
      v290 = 1;
      goto LABEL_453;
    }
LABEL_456:
    if (v407)
    {
      v302 = *((__int16 *)v407 + 10);
      if (v364 > (v356 * v367) >> 1)
      {
        v303 = 1;
        goto LABEL_461;
      }
      if (v302 >= 1)
      {
        v303 = -1;
LABEL_461:
        *((_WORD *)v407 + 10) = v302 + v303;
      }
    }
    v304 = v367 > v352 || v356 > v351;
    if (v304 && v356)
    {
      v305 = 0;
      for (m = 0; m != v356; ++m)
      {
        if (v367)
        {
          for (n = 0; n != v367; ++n)
          {
            v308 = m >= v349 || n >= v350;
            v309 = v308;
            *(_BYTE *)(v159 + 216 * (int)(v305 + n) + 70) = v309;
          }
        }
        v305 += v367;
      }
    }
    *(_BYTE *)(v16 + 16) = 1;
    if (v373)
    {
      v310 = 0;
      v311 = 0;
      v312 = v412;
      v313 = v414;
      v314 = v415;
      v315 = v373;
      do
      {
        if (!v355 || *(_BYTE *)(*(_QWORD *)v314 + 32))
        {
          if (*v313)
          {
            ++v311;
            if (*v312)
              ++v310;
          }
        }
        ++v312;
        ++v313;
        v314 = (_OWORD *)((char *)v314 + 8);
        --v315;
      }
      while (v315);
      v308 = v310 >= a8;
      v316 = v310 - a8;
      if (!v308)
        v316 = 0;
      v317 = v311 - v316;
      *(_BYTE *)(v16 + 22) = v317;
      v318 = (_BYTE *)(v16 + 22);
      if (a12)
      {
        *v318 = v373;
        v319 = v414;
        v320 = v415;
        v321 = v373;
        do
        {
          if (*(_BYTE *)(*(_QWORD *)v320 + 14))
            v322 = *(_DWORD *)(v395 + 1276);
          else
            v322 = *(_DWORD *)(*(_QWORD *)v320 + 1276) + 1;
          *v319++ = v322;
          v320 = (_OWORD *)((char *)v320 + 8);
          --v321;
        }
        while (v321);
        v281 = 255;
        v317 = v373;
      }
      if (v317)
      {
        v323 = 0;
        v324 = 0;
        v325 = 0;
        for (ii = 0; ii != v317; ++ii)
        {
          v327 = 0;
          v328 = 0;
          v329 = 0;
          do
          {
            if (v414[v327] > v328 && (v325 < v281 || !v412[v327]))
            {
              v329 = v327;
              v328 = v414[v327];
            }
            ++v327;
          }
          while (v373 != v327);
          if (v328)
          {
            v413[v329] = 1;
            v330 = *((_QWORD *)v415 + v329);
            v414[v329] = 0;
            v331 = v412[v329];
            *(_BYTE *)(v330 + 23) = ii;
            if (v331)
              ++v325;
            v332 = *(_DWORD *)(v330 + 1276);
            if (!ii)
              v160 = *(_DWORD *)(v330 + 1276);
            if (v332 == *((_DWORD *)v353 + 61))
              v324 = 1;
            if (v332 == *((_DWORD *)v353 + 62))
              v323 = 1;
          }
        }
      }
      else
      {
        v324 = 0;
        v323 = 0;
      }
    }
    else
    {
      v317 = 0;
      v324 = 0;
      v323 = 0;
      *(_BYTE *)(v16 + 22) = 0;
      v318 = (_BYTE *)(v16 + 22);
    }
    if (*((_BYTE *)v353 + 266) && !v324 && v323)
    {
      if (v373)
      {
        v333 = 0;
        while (1)
        {
          v334 = *((_QWORD *)v415 + v333);
          if (*(_DWORD *)(v334 + 1276) == *((_DWORD *)v353 + 61))
            break;
          if (v373 == ++v333)
            goto LABEL_524;
        }
        v413[v333] = 1;
        *(_BYTE *)(v334 + 23) = v317++;
      }
      else
      {
LABEL_524:
        *((_BYTE *)v353 + 266) = 0;
      }
      *v318 = v317;
    }
    if (v317 < v373)
    {
      v335 = v356 * v367;
      if ((_DWORD)v335)
      {
        for (jj = 0; jj != v335; ++jj)
        {
          v337 = v159 + 216 * jj;
          v338 = (_BYTE *)(v337 + 66);
          v339 = (_DWORD *)(v337 + 52);
          v340 = (unsigned int *)(v337 + 48);
          v341 = v415;
          v342 = v413;
          v343 = v373;
          do
          {
            if (!*v342++)
            {
              if (*v338 <= 1u)
              {
                v345 = *(_QWORD *)v341;
              }
              else
              {
                v345 = *(_QWORD *)v341;
                if (*v339 == *(_DWORD *)(*(_QWORD *)v341 + 1276))
                {
                  *v338 = 1;
                  *v339 = 0;
                }
              }
              if (*v340 == *(_DWORD *)(v345 + 1276))
                *v340 = v160;
            }
            v341 = (_OWORD *)((char *)v341 + 8);
            --v343;
          }
          while (v343);
        }
      }
    }
    if (*((_BYTE *)v353 + 266) == 1)
    {
      *((_BYTE *)v353 + 266) = 0;
      if (v373)
      {
        v346 = v373;
        v347 = v413;
        for (kk = v415; !*(_BYTE *)(*(_QWORD *)kk + 14) || !*v347; kk = (_OWORD *)((char *)kk + 8))
        {
          ++v347;
          if (!--v346)
            return;
        }
        *((_BYTE *)v353 + 266) = 1;
      }
    }
  }
}

void sub_1B6906A88(int a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, uint64_t a8, unsigned int *a9)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int v22;
  int8x16_t v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  int8x16_t v28;
  int v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  unint64_t v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  int v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46[4];
  _BYTE v47[32];
  int v48;
  __int16 v49;
  char v50;
  int v51;
  int v52;
  int v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[33];
  unsigned int v58;
  __int16 v59;
  __int16 v60;
  int v61;
  int v62;
  int8x16_t v63;
  int8x16_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v55 = a2;
  v56 = a3;
  v51 = a1;
  v52 = 4 * a1;
  v61 = a6;
  v48 = 0;
  v49 = 0;
  v50 = 6;
  v10 = *(unsigned int *)(a8 + 18980);
  if ((_DWORD)v10)
  {
    v11 = 0;
    while (*(_DWORD *)(a8 + 18852 + 4 * v11) != *(_DWORD *)(a2 + 1276))
    {
      if (v10 == ++v11)
      {
        LOBYTE(v10) = 0;
        goto LABEL_7;
      }
    }
    v53 = *(_DWORD *)(a8 + 4 * v11 + 18724);
    LOBYTE(v10) = 1;
  }
LABEL_7:
  v54 = v10;
  v12 = *(unsigned __int8 *)(a8 + 19138);
  if (a7)
    v13 = 1;
  else
    v13 = 2;
  v43 = v13;
  v38 = *(unsigned __int8 *)(a8 + 19138);
  v36 = *(unsigned __int8 *)(a8 + 19139);
  if (v12 <= v36)
  {
    v14 = *a9;
    v42 = *(unsigned __int8 *)(a8 + 19137);
    v35 = v13 * *a9;
    v37 = *(unsigned __int8 *)(a8 + 19136);
    v44 = *a9 * v12 - 2;
    v45 = *a9 * v12;
    v39 = a8;
    while (v37 > v42)
    {
LABEL_38:
      v45 += v35;
      v44 += v35;
      v38 += v43;
      if (v38 > v36)
        return;
    }
    v41 = v38 * v14;
    v15 = v37;
    while (1)
    {
      v16 = v45 + v15;
      v17 = (v45 + v15) / v14;
      v18 = v41 + v15 - v17 * v14;
      v19 = *((_QWORD *)a9 + 2);
      off_1EF13A478(v57, *(_QWORD *)(a8 + 128) + 16 * v17 * *(_DWORD *)(a8 + 232) + (16 * v18));
      v59 = v41 + v15 - v17 * v14;
      v60 = v17;
      v58 = v45 + v15;
      v57[32] = v57;
      v22 = v44 + v15;
      v23 = 0uLL;
      v62 = 0xFFFF;
      if ((int)(v44 + v15) < a4)
      {
        v24 = a5;
      }
      else
      {
        v24 = a5;
        if (v22 < a5)
          v23.i64[0] = *((_QWORD *)a9 + 2) + 36 * v22;
      }
      v25 = *a9;
      v26 = v16 - 2 * *a9;
      if (v26 >= a4 && v26 < v24)
        v23.i64[1] = *((_QWORD *)a9 + 2) + 36 * v26;
      v27 = v26 + 2;
      v28 = 0uLL;
      if (v27 >= a4 && v27 < v24)
        v28.i64[0] = *((_QWORD *)a9 + 2) + 36 * v27;
      v29 = v22 - 2 * v25;
      if (v29 >= a4 && v29 < v24)
        v28.i64[1] = *((_QWORD *)a9 + 2) + 36 * v29;
      v20.i32[0] = v17 * v14;
      v21.i32[0] = v45 + v15;
      v30 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v21, v20), 0);
      v31.i64[1] = v23.i64[1];
      v31.i64[0] = 0;
      v32 = vbslq_s8(v30, v31, v23);
      if (v14 > v16)
        break;
      if (v18 == v25 - 1)
        goto LABEL_30;
LABEL_31:
      if (v14 > v16 || v16 == v17 * v14)
        v34 = -1;
      else
        v34 = 0;
      v63 = v32;
      v64 = vbslq_s8((int8x16_t)vdupq_n_s64(v34), (int8x16_t)v28.u64[0], v28);
      sub_1B6903C34((uint64_t)v47, (uint64_t)v46);
      sub_1B6904100((uint64_t)v47, v46, v19 + 36 * v16);
      v15 += v43;
      a8 = v39;
      if (v15 > v42)
        goto LABEL_38;
    }
    v32.i64[1] = 0;
LABEL_30:
    v28.i64[0] = 0;
    goto LABEL_31;
  }
}

uint64_t sub_1B6906E00(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v8;
  unsigned __int8 *v9;
  int v10;
  _QWORD block[5];
  int v12;
  int v13;
  _QWORD v14[4];
  float v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v8 = *(_DWORD *)(a4 + 8);
    v9 = (unsigned __int8 *)(a3 + 19136);
    v15[0] = 0.0;
    LODWORD(v15[1]) = v8 >> 1;
    v16 = a3;
    v17 = a2;
    v18 = 0;
    v19 = 16;
    v20 = a4;
    v21[0] = v8 >> 1;
    v21[1] = v8;
    v22 = a3;
    v23 = a2;
    v24 = 0;
    v25 = 16;
    v26 = a4;
    v14[0] = sub_1B6906F50;
    v14[1] = v15;
    v14[2] = sub_1B6906F50;
    v14[3] = v21;
    v10 = *(_DWORD *)(result + 32) + 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = sub_1B68CAF14;
    block[3] = &unk_1E6A17CD0;
    v12 = 2;
    v13 = v10;
    block[4] = v14;
    dispatch_apply(v10, 0, block);
    return sub_1B68BF570(a4, a5, *v9, v9[1], v9[2], v9[3], *(_QWORD *)(a3 + 4624), *(_QWORD *)(a3 + 4680), v9[28], a3 + 19168, v15);
  }
  return result;
}

void sub_1B6906F50(uint64_t a1)
{
  sub_1B6906A88(*(_DWORD *)(a1 + 88), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_DWORD *)a1, *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 92), 0, *(_QWORD *)(a1 + 8), *(unsigned int **)(a1 + 104));
}

double sub_1B6906F8C(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t j;
  double result;

  v5 = 0;
  v6 = a3 + 8;
  v7 = a3;
  v8 = a1 + 16 * a3 + a4;
  v9 = a3;
  do
  {
    for (i = 0; i != 8; ++i)
      v5 += *(unsigned __int8 *)(v8 + i);
    ++v9;
    v8 += 16;
  }
  while (v9 < v6);
  v11 = 0;
  v13 = v5 + 32;
  v12 = v5 < -32;
  v14 = v5 + 95;
  if (!v12)
    v14 = v13;
  v15 = v14 >> 6;
  v16 = a1 + a4 + 16 * a3;
  do
  {
    for (j = 0; j != 8; ++j)
      v11 += (*(unsigned __int8 *)(v16 + j) - v15) * (*(unsigned __int8 *)(v16 + j) - v15);
    ++v7;
    v16 += 16;
  }
  while (v7 < v6);
  *(float *)(a5 + 4 * a2 + 176) = (float)((v11 + 32) >> 6);
  result = *(double *)(a5 + 216) + (double)v15;
  *(double *)(a5 + 216) = result;
  return result;
}

uint64_t sub_1B6907044(uint64_t result, int a2, unsigned int a3, unsigned int a4, uint64_t a5, double a6, uint8x8_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  int v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;

  v7 = 0;
  v8 = 0;
  v9 = a3;
  do
  {
    a7.i32[0] = *(_DWORD *)(result + 16 * a3 + a4 + v7);
    a7 = (uint8x8_t)vmovl_u8(a7).u64[0];
    v8 = vaddvq_s32((int32x4_t)vaddw_u16((uint32x4_t)v8, (uint16x4_t)a7));
    v7 += 16;
  }
  while (v7 != 64);
  v10 = 0;
  v12 = v8 + 8;
  v11 = v8 < -8;
  v13 = v8 + 23;
  if (!v11)
    v13 = v12;
  v14 = -(v13 >> 4);
  v15 = (unsigned __int8 *)(result + a4 + 16 * a3);
  do
  {
    v16 = v15;
    v17 = a4 + 4 - (unint64_t)a4;
    do
    {
      v18 = *v16++;
      v19 = v18 + (uint64_t)v14;
      v10 += v19 * v19;
      ++*(_DWORD *)(a5 + 4 * v19 + 2500);
      --v17;
    }
    while (v17);
    ++v9;
    v15 += 16;
  }
  while (v9 != a3 + 4);
  *(_DWORD *)(a5 + 4 * a2 + 376) = (v10 + 8) >> 4;
  return result;
}

float sub_1B6907100(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t j;
  float result;

  v5 = 0;
  v6 = a3 + 8;
  v7 = a3;
  v8 = a1 + 16 * a3 + a4;
  v9 = a3;
  do
  {
    for (i = 0; i != 8; ++i)
      v5 += *(unsigned __int8 *)(v8 + i);
    ++v9;
    v8 += 16;
  }
  while (v9 < v6);
  v11 = 0;
  v13 = v5 + 32;
  v12 = v5 < -32;
  v14 = v5 + 95;
  if (!v12)
    v14 = v13;
  v15 = -(v14 >> 6);
  v16 = a1 + a4 + 16 * a3;
  do
  {
    for (j = 0; j != 8; ++j)
      v11 += (v15 + *(unsigned __int8 *)(v16 + j)) * (v15 + *(unsigned __int8 *)(v16 + j));
    ++v7;
    v16 += 16;
  }
  while (v7 < v6);
  result = (float)((v11 + 32) >> 6);
  *(float *)(a5 + 4 * a2 + 176) = result;
  return result;
}

uint64_t sub_1B69071A8(uint64_t result, int a2, unsigned int a3, unsigned int a4, uint64_t a5, double a6, uint8x8_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  int v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;

  v7 = 0;
  v8 = 0;
  v9 = a3;
  do
  {
    a7.i32[0] = *(_DWORD *)(result + 16 * a3 + a4 + v7);
    a7 = (uint8x8_t)vmovl_u8(a7).u64[0];
    v8 = vaddvq_s32((int32x4_t)vaddw_u16((uint32x4_t)v8, (uint16x4_t)a7));
    v7 += 16;
  }
  while (v7 != 64);
  v10 = 0;
  v12 = v8 + 8;
  v11 = v8 < -8;
  v13 = v8 + 23;
  if (!v11)
    v13 = v12;
  v14 = -(v13 >> 4);
  v15 = (unsigned __int8 *)(result + a4 + 16 * a3);
  do
  {
    v16 = v15;
    v17 = a4 + 4 - (unint64_t)a4;
    do
    {
      v18 = *v16++;
      v19 = v18 + (uint64_t)v14;
      v10 += v19 * v19;
      ++*(_DWORD *)(a5 + 4 * v19 + 2564);
      --v17;
    }
    while (v17);
    ++v9;
    v15 += 16;
  }
  while (v9 != a3 + 4);
  *(_DWORD *)(a5 + 4 * a2 + 440) = (v10 + 8) >> 4;
  return result;
}

uint64_t sub_1B6907264(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;
  _BYTE *v4;
  _BYTE *v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  char v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned int v50;
  char v51;
  BOOL v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int8 v57;
  unsigned int v58;
  char v59;
  BOOL v60;
  char v61;
  uint64_t v62;
  _BYTE *v63;
  char v64;
  char v65;
  uint64_t result;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD v72[33];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE **)(a1 + 40);
  v2 = *(_BYTE **)(a1 + 48);
  v4 = *(_BYTE **)(a1 + 2624);
  if (!v2[1])
  {
    v9 = 0;
    goto LABEL_31;
  }
  v5 = *(_BYTE **)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 136);
  v7 = v6 != 0;
  if (v2[4])
  {
    if (v5)
    {
      if (v5[224] == 34)
      {
        v8 = v5[208] != 34 && v5 != 0;
        if (!v6)
          goto LABEL_9;
LABEL_13:
        if (*(_BYTE *)(v6 + 224) == 34)
        {
          if (*(_BYTE *)(v6 + 208) == 34)
            v7 = 0;
        }
        else
        {
          v7 = 1;
        }
        goto LABEL_20;
      }
      v8 = 1;
      if (v6)
        goto LABEL_13;
    }
    else
    {
      v8 = 0;
      if (v6)
        goto LABEL_13;
    }
LABEL_9:
    v7 = 0;
LABEL_20:
    if ((*(_BYTE *)(a1 + 185) & (v5 != 0)) != 0 && *(_BYTE *)(a1 + 31) == 1 && v5[200] == 1 && v8)
    {
      v10 = *(_QWORD *)(a1 + 168);
      v8 = *(_BYTE *)(v10 + 224) != 34 || *(unsigned __int8 *)(v10 + 208) != 34;
    }
    goto LABEL_27;
  }
  v8 = v5 != 0;
LABEL_27:
  v11 = v8 | (2 * v7);
  v12 = *(_QWORD *)(a1 + 216);
  v13 = *(unsigned int *)(v12 + 248);
  v14 = *(_QWORD *)(v12 + 136) + (16 * *(_DWORD *)a1) + (8 * *(_DWORD *)(a1 + 4) * v13);
  v15 = (char)v3[55] + (char)v3[56];
  if (v15 >= 51)
    v16 = 51;
  else
    v16 = (char)v3[55] + (char)v3[56];
  v17 = byte_1B6932724[v16 - (v15 & (v15 >> 31))];
  ((void (*)(uint64_t, uint64_t, uint64_t *, uint64_t))*(&off_1EF13A548 + v2[289]))(v14, v13, &v69, v11);
  off_1EF13A5B8(v14, v13, &v69, 16, &v71, 8);
  BYTE1(v67) = (v17 / 6u) & 0x1F | (32 * (v17 % 6u));
  LOBYTE(v67) = *(_BYTE *)(a1 + 28);
  sub_1B6901168((unsigned __int8 *)&v67, *(unsigned __int8 *)(a1 + 29));
  *(_OWORD *)(*(_QWORD *)(a1 + 56) + 800) = v72[32];
  v18 = *(_OWORD **)(a1 + 56);
  v19 = v72[16];
  v20 = v72[17];
  v21 = v72[19];
  v18[36] = v72[18];
  v18[37] = v21;
  v18[34] = v19;
  v18[35] = v20;
  v22 = v72[20];
  v23 = v72[21];
  v24 = v72[23];
  v18[40] = v72[22];
  v18[41] = v24;
  v18[38] = v22;
  v18[39] = v23;
  v25 = *(_OWORD **)(a1 + 56);
  v26 = v72[24];
  v27 = v72[25];
  v28 = v72[27];
  v25[44] = v72[26];
  v25[45] = v28;
  v25[42] = v26;
  v25[43] = v27;
  v29 = v72[28];
  v30 = v72[29];
  v31 = v72[31];
  v25[48] = v72[30];
  v25[49] = v31;
  v25[46] = v29;
  v25[47] = v30;
  v9 = v68;
  off_1EF13A5B0(v14, v13, &v69, v72, 8);
LABEL_31:
  v3[53] = v9;
  if (v3[2])
  {
    v3[52] = *v4;
    v32 = *(_QWORD *)(a1 + 176);
    *(_QWORD *)(v32 + 208) = 0x1212121212121212;
    *(_QWORD *)(v32 + 216) = 0x1212121212121212;
    memset((void *)(*(_QWORD *)(a1 + 176) + 224), 34, 16);
  }
  else
  {
    if (v3[3])
    {
      v69 = 0;
      v70 = 0;
      v34 = *(_QWORD *)(a1 + 128);
      v33 = *(_QWORD *)(a1 + 136);
      v67 = *(_QWORD *)(a1 + 176) + 224;
      v68 = 0;
      if (v34)
      {
        v35 = *(unsigned __int8 *)(v34 + 284);
        v36 = v34 + 224;
        v37 = v34 + 208;
        if (v35)
          v37 = v36;
        v68 = v37;
      }
      if (v33)
      {
        if (*(_BYTE *)(v33 + 284))
          v38 = v33 + 224;
        else
          v38 = v33 + 208;
        v69 = v38;
      }
      else
      {
        v69 = 0;
      }
      v45 = 0;
      v46 = 0;
      v47 = 224;
      do
      {
        v48 = *(_QWORD *)(a1 + 48);
        v49 = sub_1B690393C(v45, *(unsigned __int8 *)(v48 + 4), (uint64_t)&v67);
        v50 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 176) + v47);
        v51 = v50 - (v49 <= v50);
        v52 = v49 == v50;
        if (v52)
          v53 = 0;
        else
          v53 = v51;
        v54 = v48 + v45;
        *(_BYTE *)(v54 + 306) = v52;
        *(_BYTE *)(v54 + 326) = v53;
        v46 |= v4[v45++];
        v47 += 4;
      }
      while (v45 != 4);
    }
    else
    {
      v69 = 0;
      v70 = 0;
      v40 = *(_QWORD *)(a1 + 128);
      v39 = *(_QWORD *)(a1 + 136);
      v67 = *(_QWORD *)(a1 + 176) + 208;
      v68 = 0;
      if (v40)
      {
        v41 = *(unsigned __int8 *)(v40 + 284);
        v42 = v40 + 224;
        v43 = v40 + 208;
        if (v41)
          v43 = v42;
        v68 = v43;
      }
      if (v39)
      {
        if (*(_BYTE *)(v39 + 284))
          v44 = v39 + 224;
        else
          v44 = v39 + 208;
        v69 = v44;
      }
      else
      {
        v69 = 0;
      }
      v55 = 0;
      v46 = 0;
      do
      {
        v56 = *(_QWORD *)(a1 + 48);
        v57 = sub_1B69039B8(v55, *(unsigned __int8 *)(v56 + 4), (uint64_t)&v67);
        v58 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 176) + v55 + 208);
        v59 = v58 - (v57 <= v58);
        v60 = v57 == v58;
        if (v60)
          v61 = 0;
        else
          v61 = v59;
        v62 = v56 + v55;
        *(_BYTE *)(v62 + 290) = v60;
        *(_BYTE *)(v62 + 310) = v61;
        v46 |= v4[v55++];
      }
      while (v55 != 16);
    }
    v3[52] = v46;
  }
  off_1EF13A5B0(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 128)+ (16 * *(_DWORD *)a1)+ (16 * *(_DWORD *)(a1 + 4) * *(_DWORD *)(*(_QWORD *)(a1 + 216) + 232)), *(unsigned int *)(*(_QWORD *)(a1 + 216) + 232), v4 + 32, v4 + 800, 16);
  v63 = *(_BYTE **)(a1 + 40);
  v64 = v63[2];
  if (v64)
  {
    v65 = *(_BYTE *)(*(_QWORD *)(a1 + 48) + 288) + 4 * v63[53];
    if (v63[52] == 15)
      v64 = v65 + 13;
    else
      v64 = v65 + 1;
  }
  v63[2] = v64;
  result = sub_1B68BA138(v3[1], v3[2], v3[3], v2 + 16);
  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8) = v2[31];
  return result;
}

uint64_t sub_1B6907748(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int16x8_t *v26;
  uint64_t v27;
  uint64_t i;
  _BYTE *v29;
  int v30;
  uint64_t v31;
  uint64_t j;
  int v33;
  _OWORD *v34;
  uint64_t k;
  int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int16x8_t *v42;
  __int16 *v43;
  uint64_t m;
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
  __int32 *v69;
  int32x4_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int32x4_t v84;
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
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  int32x4_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int32x4_t v105;
  uint32x4_t v106;
  uint32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  int32x4_t v111;
  uint32x4_t v112;
  int32x4_t v113;
  int32x4_t v114;
  int32x4_t v115;
  uint32x4_t v116;
  int32x4_t v117;
  uint32x4_t v118;
  uint32x4_t v119;
  int32x4_t v120;
  int32x4_t v121;
  int32x4_t v122;
  int32x4_t v123;
  char v124;
  uint64_t n;
  unint64_t ii;
  __int16 v127;
  __int16 v128;
  __int16 v129;
  __int16 v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  __int16 v143;
  __int16 v144;
  int v145;
  __int16 v146;
  int v147;
  __int16 *v148;
  int16x8_t v149;
  int16x8_t v150;
  int16x8_t v151;
  int16x8_t v152;
  int16x8_t v153;
  int16x8_t v154;
  int16x8_t v155;
  int16x8_t v156;
  int16x8_t v157;
  int16x8_t v158;
  int16x8_t v159;
  int16x8_t v160;
  int16x8_t v161;
  int16x8_t v162;
  int16x8_t v163;
  int16x8_t v164;
  int16x8_t v165;
  int16x8_t v166;
  int16x8_t v167;
  int16x8_t v168;
  int16x8_t v169;
  int16x8_t v170;
  int16x8_t v171;
  int16x8_t v172;
  int16x8_t v173;
  int16x8_t v174;
  uint64_t jj;
  _QWORD *v176;
  uint64_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  int v190;
  int v191;
  char v192;
  uint64_t result;
  __int32 v194;
  _OWORD *v195;
  _OWORD *v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _OWORD *v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _OWORD *v210;
  _BYTE *v211;
  uint64_t v212;
  char *v213;
  uint64_t v214;
  unsigned int v215;
  char *v216;
  unsigned int v217;
  uint64_t v218;
  int v219;
  _OWORD *v220;
  int v221;
  uint64_t v222;
  unsigned int v223;
  uint64_t v224;
  unsigned int v225;
  uint64_t v226;
  int v227;
  uint64_t v228;
  int v229;
  int16x8_t v230;
  int16x8_t v231;
  int16x8_t v232;
  int16x8_t v233;
  int16x8_t v234;
  int16x8_t v235;
  int16x8_t v236;
  int16x8_t v237;
  unsigned int v238;
  unsigned int v239;
  unsigned int v240;
  unsigned int v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  _OWORD v258[33];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _DWORD v262[8];
  _OWORD v263[8];
  uint64_t v264;

  v2 = a1;
  v264 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 2528);
  v4 = *(_QWORD *)(a1 + 2536);
  v5 = *(_QWORD *)(a1 + 2544);
  v6 = *(_OWORD **)(a1 + 2552);
  v7 = *(_DWORD *)(a1 + 4);
  v8 = *(_QWORD *)(a1 + 216);
  v9 = (16 * *(_DWORD *)a1);
  v10 = *(_QWORD *)(v8 + 136);
  v11 = *(_DWORD *)(v8 + 232);
  v12 = *(_QWORD *)(v8 + 128) + v9 + (16 * v7 * v11);
  v13 = *(_BYTE **)(a1 + 40);
  LODWORD(v8) = *(_DWORD *)(v8 + 248);
  v226 = v12;
  v228 = v10 + v9 + (8 * v7 * v8);
  v227 = v11;
  v229 = v8;
  v222 = v3;
  v224 = v4;
  v223 = 16;
  v225 = 16;
  v218 = v5;
  v220 = v6;
  v219 = 32;
  v221 = 32;
  v14 = v13;
  if (a2)
  {
    sub_1B68FD510(a1, &v226, (uint64_t)&v222, &v218);
    v14 = *(_BYTE **)(v2 + 40);
  }
  v15 = *(_QWORD *)(v2 + 56) + 32;
  if (v14[3])
  {
    v210 = v6;
    v211 = v13;
    v16 = *(unsigned __int8 *)(v2 + 336);
    v17 = v13[55] / 6u;
    v18 = v13[55] % 6u;
    v212 = v2;
    if (v16)
    {
      v19 = v5;
      v20 = 0;
      v21 = v2 + 498;
      v22 = v17 & 0x1F | (32 * v18);
      do
      {
        v23 = 0;
        v24 = ((_DWORD)v20 << 6) & 0x3F80;
        v25 = v19 + 2 * v24 + 16 * (v20 & 1);
        v26 = &v230;
        v27 = v25;
        do
        {
          for (i = 0; i != 8; ++i)
            v26->i16[i] = *(_WORD *)(v27 + i * 2);
          ++v26;
          v27 += 32;
          ++v23;
        }
        while (v23 != 8);
        off_1EF13A4F8(&v230, v259);
        v29 = v261;
        sub_1B6900F94((uint64_t)v259, v22, v21, 1u, (uint64_t)v261, &v262[v20], (uint64_t)v260);
        off_1EF13A500(v260, v263);
        v30 = 0;
        v31 = v15 + 2 * v24 + 16 * (v20 & 1);
        do
        {
          for (j = 0; j != 16; j += 2)
            *(_WORD *)(v31 + j) = *(_WORD *)&v29[j];
          v29 += 16;
          v31 += 32;
          ++v30;
        }
        while (v30 != 8);
        v33 = 0;
        v34 = v263;
        do
        {
          for (k = 0; k != 16; k += 2)
            *(_WORD *)(v25 + k) = *(_WORD *)((char *)v34 + k);
          ++v34;
          v25 += 32;
          ++v33;
        }
        while (v33 != 8);
        ++v20;
      }
      while (v20 != 4);
      v36 = (v262[0] != 0) | (2 * (v262[1] != 0)) | (4 * (v262[2] != 0)) | (8 * (v262[3] != 0));
      v13 = v211;
      v2 = v212;
      v6 = v210;
      v5 = v19;
    }
    else
    {
      v37 = 0;
      v217 = v17 + 15;
      v216 = (char *)&unk_1B693B300 + 128 * (unint64_t)v18;
      v38 = v17;
      v215 = 0x8000 << v17 >> 3;
      v213 = (char *)&unk_1B693B600 + 128 * (unint64_t)v18;
      v214 = v5 + 8;
      v39 = (unint64_t)v263 | 0xE;
      v40 = v15;
      do
      {
        v41 = word_1B693C010[v37];
        v42 = (int16x8_t *)(v5 + 2 * v41);
        v43 = (__int16 *)(v214 + 2 * v41);
        for (m = 56; m != 64; ++m)
        {
          v45 = *(v43 - 4);
          v46 = *(v43 - 3);
          v47 = *(v43 - 2);
          v48 = *(v43 - 1);
          v49 = v43[1];
          v50 = v43[2];
          v51 = v43[3];
          v52 = v51 + v45;
          v53 = v50 + v46;
          v54 = v49 + v47;
          v55 = v45 - v51;
          v56 = v46 - v50;
          v57 = v47 - v49;
          v58 = v56 + v57 + v55 + (v55 >> 1);
          v59 = *v43;
          v60 = v59 + v48;
          v61 = v48 - v59;
          v62 = v52 + v60;
          v63 = v53 + v54;
          v64 = v52 - v60;
          v65 = v53 - v54;
          v66 = v55 - (v57 + v61 + (v57 >> 1));
          v67 = v61 + v55 - (v56 + (v56 >> 1));
          v68 = v61 + (v61 >> 1) + v56 - v57;
          v69 = &v230.i32[m];
          *(v69 - 56) = v62 + v63;
          *(v69 - 40) = v64 + (v65 >> 1);
          *(v69 - 24) = v62 - v63;
          *(v69 - 8) = (v64 >> 1) - v65;
          *(v69 - 48) = v58 + (v68 >> 2);
          *(v69 - 32) = v66 + (v67 >> 2);
          *(v69 - 16) = v67 - (v66 >> 2);
          *v69 = (v58 >> 2) - v68;
          v43 += 16;
        }
        v70.i64[0] = __PAIR64__(v232.u32[0], v230.u32[0]);
        v70.i64[1] = __PAIR64__(v236.u32[0], v234.u32[0]);
        v71.i64[0] = __PAIR64__(v243, v238);
        v72.i64[0] = __PAIR64__(DWORD1(v243), v239);
        v71.i64[1] = __PAIR64__(v247, v245);
        v73.i64[0] = __PAIR64__(v233.u32[3], v231.u32[3]);
        v73.i64[1] = __PAIR64__(v237.u32[3], v235.u32[3]);
        v74.i64[0] = __PAIR64__(HIDWORD(v244), HIDWORD(v242));
        v75.i64[0] = __PAIR64__(DWORD2(v244), DWORD2(v242));
        v74.i64[1] = __PAIR64__(HIDWORD(v248), HIDWORD(v246));
        v76 = vaddq_s32(v74, v71);
        v77 = vaddq_s32(v73, v70);
        v78.i64[0] = __PAIR64__(v232.u32[1], v230.u32[1]);
        v78.i64[1] = __PAIR64__(v236.u32[1], v234.u32[1]);
        v72.i64[1] = __PAIR64__(DWORD1(v247), DWORD1(v245));
        v79.i64[0] = __PAIR64__(v233.u32[2], v231.u32[2]);
        v79.i64[1] = __PAIR64__(v237.u32[2], v235.u32[2]);
        v75.i64[1] = __PAIR64__(DWORD2(v248), DWORD2(v246));
        v80 = vaddq_s32(v75, v72);
        v81 = vaddq_s32(v79, v78);
        v82.i64[0] = __PAIR64__(v232.u32[2], v230.u32[2]);
        v83.i64[0] = __PAIR64__(DWORD2(v243), v240);
        v84.i64[0] = __PAIR64__(HIDWORD(v243), v241);
        v83.i64[1] = __PAIR64__(DWORD2(v247), DWORD2(v245));
        v85.i64[0] = __PAIR64__(DWORD1(v244), DWORD1(v242));
        v86.i64[0] = __PAIR64__(v244, v242);
        v85.i64[1] = __PAIR64__(DWORD1(v248), DWORD1(v246));
        v87 = vaddq_s32(v85, v83);
        v82.i64[1] = __PAIR64__(v236.u32[2], v234.u32[2]);
        v88.i64[0] = __PAIR64__(v233.u32[1], v231.u32[1]);
        v88.i64[1] = __PAIR64__(v237.u32[1], v235.u32[1]);
        v89 = vaddq_s32(v88, v82);
        v90.i64[0] = __PAIR64__(v232.u32[3], v230.u32[3]);
        v90.i64[1] = __PAIR64__(v236.u32[3], v234.u32[3]);
        v84.i64[1] = __PAIR64__(HIDWORD(v247), HIDWORD(v245));
        v91.i64[0] = __PAIR64__(v233.u32[0], v231.u32[0]);
        v91.i64[1] = __PAIR64__(v237.u32[0], v235.u32[0]);
        v86.i64[1] = __PAIR64__(v248, v246);
        v92 = vaddq_s32(v86, v84);
        v93 = vaddq_s32(v91, v90);
        v94 = vsubq_s32(v71, v74);
        v95 = vsubq_s32(v70, v73);
        v96 = vsubq_s32(v78, v79);
        v97 = vsubq_s32(v72, v75);
        v98 = vsubq_s32(v83, v85);
        v99 = vsubq_s32(v82, v88);
        v100 = vsubq_s32(v90, v91);
        v101 = vsubq_s32(v84, v86);
        v102 = vaddq_s32(v93, v77);
        v103 = vaddq_s32(v92, v76);
        v104 = vaddq_s32(v89, v81);
        v105 = vaddq_s32(v87, v80);
        v106 = (uint32x4_t)vsubq_s32(v77, v93);
        v107 = (uint32x4_t)vsubq_s32(v76, v92);
        v108 = vsubq_s32(v81, v89);
        v109 = vsubq_s32(v80, v87);
        v110 = vaddq_s32(v96, v99);
        v111 = vsubq_s32(v96, v99);
        v112 = (uint32x4_t)vsubq_s32(v95, vaddq_s32(vsraq_n_s32(v99, v99, 1uLL), v100));
        v113 = vsubq_s32(v95, vsraq_n_s32(v96, v96, 1uLL));
        v114 = vaddq_s32(v97, v98);
        v115 = vsubq_s32(v97, v98);
        v116 = (uint32x4_t)vsubq_s32(v94, vaddq_s32(vsraq_n_s32(v98, v98, 1uLL), v101));
        v117 = vsubq_s32(v94, vsraq_n_s32(v97, v97, 1uLL));
        v118 = (uint32x4_t)vaddq_s32(vsraq_n_s32(v95, v95, 1uLL), v110);
        v119 = (uint32x4_t)vaddq_s32(vsraq_n_s32(v94, v94, 1uLL), v114);
        v120 = vaddq_s32(v113, v100);
        v121 = vaddq_s32(v117, v101);
        v122 = vsraq_n_s32(vaddq_s32(v100, v111), v100, 1uLL);
        v123 = vsraq_n_s32(vaddq_s32(v101, v115), v101, 1uLL);
        v263[0] = vuzp1q_s16((int16x8_t)vaddq_s32(v102, v104), (int16x8_t)vaddq_s32(v103, v105));
        v263[1] = vuzp1q_s16((int16x8_t)vsraq_n_u32(v118, (uint32x4_t)v122, 2uLL), (int16x8_t)vsraq_n_u32(v119, (uint32x4_t)v123, 2uLL));
        v263[2] = vuzp1q_s16((int16x8_t)vsraq_n_u32(v106, (uint32x4_t)v108, 1uLL), (int16x8_t)vsraq_n_u32(v107, (uint32x4_t)v109, 1uLL));
        v263[3] = vuzp1q_s16((int16x8_t)vsraq_n_u32(v112, (uint32x4_t)v120, 2uLL), (int16x8_t)vsraq_n_u32(v116, (uint32x4_t)v121, 2uLL));
        v263[4] = vuzp1q_s16((int16x8_t)vsubq_s32(v102, v104), (int16x8_t)vsubq_s32(v103, v105));
        v263[5] = vuzp1q_s16((int16x8_t)vsubq_s32(v120, (int32x4_t)vshrq_n_u32(v112, 2uLL)), (int16x8_t)vsubq_s32(v121, (int32x4_t)vshrq_n_u32(v116, 2uLL)));
        v263[6] = vuzp1q_s16((int16x8_t)vsubq_s32((int32x4_t)vshrq_n_u32(v106, 1uLL), v108), (int16x8_t)vsubq_s32((int32x4_t)vshrq_n_u32(v107, 1uLL), v109));
        v263[7] = vuzp1q_s16((int16x8_t)vsubq_s32((int32x4_t)vshrq_n_u32(v118, 2uLL), v122), (int16x8_t)vsubq_s32((int32x4_t)vshrq_n_u32(v119, 2uLL), v123));
        v124 = off_1EF13A508(v263, v263, v216, v215, v217);
        v261[v37] = v124;
        if (v124)
        {
          for (n = 0; n != 64; ++n)
            *(_WORD *)(v40 + 2 * v41 + 2 * (unsigned __int16)word_1B693B90A[n]) = *(_WORD *)((char *)v263 + n * 2);
          off_1EF13A510(v263, v263, v213, v38);
          for (ii = 0; ii != 128; ii += 16)
          {
            v127 = v263[ii / 0x10];
            v128 = *(_WORD *)(v39 + ii - 6);
            v129 = v128 + v127;
            v130 = v127 - v128;
            v131 = *(__int16 *)(v39 + ii - 10);
            v132 = *(__int16 *)(v39 + ii - 2);
            v133 = (v131 >> 1) - v132;
            v134 = v131 + (v132 >> 1);
            v135 = *(__int16 *)(v39 + ii - 4);
            v136 = *(__int16 *)(v39 + ii - 8);
            v137 = *(__int16 *)(v39 + ii);
            v138 = v135 - (v136 + v137 + (v137 >> 1));
            v139 = *(__int16 *)(v39 + ii - 12);
            v140 = v137 - (v136 + (v136 >> 1)) + v139;
            v141 = v136 + v135 + v139 + (v139 >> 1);
            LOWORD(v139) = *(_WORD *)(v39 + ii - 4) + (*(__int16 *)(v39 + ii - 4) >> 1) + v137 - v139;
            v142 = (__int16)v139;
            v143 = v134 + v129;
            LOWORD(v134) = v129 - v134;
            v144 = v133 + v130;
            v145 = v138 + ((__int16)v141 >> 2);
            v146 = v130 - v133;
            v147 = v141 - ((__int16)v138 >> 2);
            LOWORD(v139) = ((__int16)v140 >> 2) - v139;
            LOWORD(v141) = v141 - ((__int16)v138 >> 2) + v143;
            v148 = &v230.i16[ii / 2];
            *v148 = v141;
            v148[1] = v139 + v144;
            v148[2] = v140 + (v142 >> 2) + v146;
            v148[3] = v145 + v134;
            v148[4] = v134 - v145;
            v148[5] = v146 - (v140 + (v142 >> 2));
            v148[6] = v144 - v139;
            v148[7] = v143 - v147;
          }
          v149 = vaddq_s16(v234, v230);
          v150 = vsubq_s16(v235, vsraq_n_s16(vaddq_s16(v233, v237), v237, 1uLL));
          v151 = vsubq_s16(v230, v234);
          v152 = vaddq_s16(vsubq_s16(v237, vsraq_n_s16(v233, v233, 1uLL)), v231);
          v153 = vsubq_s16(vshrq_n_s16(v232, 1uLL), v236);
          v154 = vsubq_s16(vaddq_s16(vsraq_n_s16(v235, v235, 1uLL), v237), v231);
          v155 = vsraq_n_s16(v232, v236, 1uLL);
          v156 = vsraq_n_s16(vaddq_s16(vaddq_s16(v233, v235), v231), v231, 1uLL);
          v157 = vaddq_s16(v153, v151);
          v158 = vsubq_s16(v151, v153);
          v159 = vaddq_s16(v155, v149);
          v160 = vsubq_s16(v149, v155);
          v161 = vshrq_n_s16(v150, 2uLL);
          v162 = vsraq_n_s16(v150, v156, 2uLL);
          v163 = vsubq_s16(v156, v161);
          v164 = vshrq_n_s16(v152, 2uLL);
          v165 = vsraq_n_s16(v152, v154, 2uLL);
          v166 = vsubq_s16(v164, v154);
          v167 = vaddq_s16(v159, v163);
          *v42 = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v167.i8), 6uLL), vmovl_high_s16(v167), 6uLL);
          v168 = vaddq_s16(v157, v166);
          v42[2] = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v168.i8), 6uLL), vmovl_high_s16(v168), 6uLL);
          v169 = vaddq_s16(v165, v158);
          v42[4] = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v169.i8), 6uLL), vmovl_high_s16(v169), 6uLL);
          v170 = vaddq_s16(v160, v162);
          v42[6] = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v170.i8), 6uLL), vmovl_high_s16(v170), 6uLL);
          v171 = vsubq_s16(v160, v162);
          v42[8] = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v171.i8), 6uLL), vmovl_high_s16(v171), 6uLL);
          v172 = vsubq_s16(v158, v165);
          v42[10] = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v172.i8), 6uLL), vmovl_high_s16(v172), 6uLL);
          v173 = vsubq_s16(v157, v166);
          v42[12] = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v173.i8), 6uLL), vmovl_high_s16(v173), 6uLL);
          v174 = vsubq_s16(v159, v163);
          v42[14] = vrshrn_high_n_s32(vrshrn_n_s32(vmovl_s16(*(int16x4_t *)v174.i8), 6uLL), vmovl_high_s16(v174), 6uLL);
        }
        ++v37;
      }
      while (v37 != 4);
      v36 = v261[0] | (2 * v261[1]) | (4 * v261[2]) | (8 * v261[3]);
      v13 = v211;
      v2 = v212;
      v6 = v210;
      if (v36)
      {
        for (jj = 0; jj != 4; ++jj)
        {
          if (!v261[jj])
          {
            v176 = (_QWORD *)(v5 + 2 * word_1B693C010[jj]);
            *v176 = 0;
            v176[1] = 0;
            v176[4] = 0;
            v176[5] = 0;
            v176[8] = 0;
            v176[9] = 0;
            v176[12] = 0;
            v176[13] = 0;
            v176[16] = 0;
            v176[17] = 0;
            v176[20] = 0;
            v176[21] = 0;
            v176[24] = 0;
            v176[25] = 0;
            v176[28] = 0;
            v176[29] = 0;
          }
        }
      }
    }
  }
  else
  {
    v36 = sub_1B6900C48(v5, v15, v5, ((32 * (v13[55] % 6u)) | (v13[55] / 6u) & 0x1F), *(unsigned __int8 *)(v2 + 29));
  }
  v13[52] = v36;
  if (v36)
    v177 = v5;
  else
    v177 = 0;
  v178 = *v6;
  v179 = v6[1];
  v180 = v6[3];
  v244 = v6[2];
  v245 = v180;
  v242 = v178;
  v243 = v179;
  v181 = v6[4];
  v182 = v6[5];
  v183 = v6[7];
  v248 = v6[6];
  v249 = v183;
  v246 = v181;
  v247 = v182;
  v184 = v6[8];
  v185 = v6[9];
  v186 = v6[11];
  v252 = v6[10];
  v253 = v186;
  v250 = v184;
  v251 = v185;
  v187 = v6[12];
  v188 = v6[13];
  v189 = v6[15];
  v256 = v6[14];
  v257 = v189;
  v254 = v187;
  v255 = v188;
  v190 = (char)v13[55] + *(char *)(*(_QWORD *)(v2 + 40) + 56);
  if (v190 >= 51)
    v191 = 51;
  else
    v191 = (char)v13[55] + *(char *)(*(_QWORD *)(v2 + 40) + 56);
  v192 = byte_1B6932724[v191 - (v190 & (v190 >> 31))];
  v230.i8[1] = (v192 / 6u) & 0x1F | (32 * (v192 % 6u));
  v230.i8[0] = *(_BYTE *)(v2 + 28);
  result = sub_1B6901168((unsigned __int8 *)&v230, *(unsigned __int8 *)(v2 + 29));
  v194 = v230.i32[2];
  v13[53] = v230.i8[8];
  if (v194)
  {
    v195 = v258;
    *(_OWORD *)(*(_QWORD *)(v2 + 56) + 800) = v258[32];
    v196 = *(_OWORD **)(v2 + 56);
    v197 = v258[16];
    v198 = v258[17];
    v199 = v258[19];
    v196[36] = v258[18];
    v196[37] = v199;
    v196[34] = v197;
    v196[35] = v198;
    v200 = v258[20];
    v201 = v258[21];
    v202 = v258[23];
    v196[40] = v258[22];
    v196[41] = v202;
    v196[38] = v200;
    v196[39] = v201;
    v203 = *(_OWORD **)(v2 + 56);
    v204 = v258[24];
    v205 = v258[25];
    v206 = v258[27];
    v203[44] = v258[26];
    v203[45] = v206;
    v203[42] = v204;
    v203[43] = v205;
    v207 = v258[28];
    v208 = v258[29];
    v209 = v258[31];
    v203[48] = v258[30];
    v203[49] = v209;
    v203[46] = v207;
    v203[47] = v208;
  }
  else
  {
    v195 = 0;
  }
  if (v177)
    result = off_1EF13A5A8(v222, v223, v177, 16);
  if (v195)
    return off_1EF13A5A8(v224, v225, v195, 8);
  return result;
}

uint64_t sub_1B6908320(uint64_t result)
{
  _BYTE *v1;
  __int16 v2;

  v1 = (_BYTE *)(result + 79);
  if (*(_BYTE *)result)
  {
    v2 = 0;
    *(_BYTE *)(result + 272) = 4;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 31) = 3;
    *(_BYTE *)(result + 47) = 3;
    *(_BYTE *)(result + 63) = 3;
    *(_WORD *)(result + 24) = 8224;
    *(_QWORD *)(result + 32) = 0;
    *(_WORD *)(result + 40) = 8224;
    *(_QWORD *)(result + 48) = 0;
    *(_WORD *)(result + 56) = 8224;
    *(_QWORD *)(result + 64) = 0;
    *(_WORD *)(result + 72) = 8224;
  }
  else
  {
    *(_BYTE *)(result + 272) = 16;
    *(_QWORD *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 8224;
    *(_BYTE *)(result + 31) = 3;
    *(_QWORD *)(result + 32) = 0;
    *(_WORD *)(result + 40) = 8224;
    *(_BYTE *)(result + 47) = 3;
    *(_QWORD *)(result + 48) = 0;
    *(_WORD *)(result + 56) = 8224;
    *(_BYTE *)(result + 63) = 3;
    *(_QWORD *)(result + 64) = 0;
    *(_WORD *)(result + 72) = 8224;
    *(_BYTE *)(result + 79) = 3;
    *(_QWORD *)(result + 80) = 0;
    *(_WORD *)(result + 88) = 8224;
    *(_BYTE *)(result + 95) = 3;
    *(_QWORD *)(result + 96) = 0;
    *(_WORD *)(result + 104) = 8224;
    *(_BYTE *)(result + 111) = 3;
    *(_QWORD *)(result + 112) = 0;
    *(_WORD *)(result + 120) = 8224;
    *(_BYTE *)(result + 127) = 3;
    *(_QWORD *)(result + 128) = 0;
    *(_WORD *)(result + 136) = 8224;
    *(_BYTE *)(result + 143) = 3;
    *(_QWORD *)(result + 144) = 0;
    *(_WORD *)(result + 152) = 8224;
    *(_BYTE *)(result + 159) = 3;
    *(_QWORD *)(result + 160) = 0;
    *(_WORD *)(result + 168) = 8224;
    *(_BYTE *)(result + 175) = 3;
    *(_QWORD *)(result + 176) = 0;
    *(_WORD *)(result + 184) = 8224;
    *(_BYTE *)(result + 191) = 3;
    *(_QWORD *)(result + 192) = 0;
    *(_WORD *)(result + 200) = 8224;
    *(_BYTE *)(result + 207) = 3;
    *(_QWORD *)(result + 208) = 0;
    *(_WORD *)(result + 216) = 8224;
    *(_BYTE *)(result + 223) = 3;
    *(_QWORD *)(result + 224) = 0;
    *(_WORD *)(result + 232) = 8224;
    *(_BYTE *)(result + 239) = 3;
    *(_QWORD *)(result + 240) = 0;
    *(_WORD *)(result + 248) = 8224;
    *(_BYTE *)(result + 255) = 3;
    *(_WORD *)(result + 264) = 8224;
    v1 = (_BYTE *)(result + 271);
    v2 = 255;
    *(_QWORD *)(result + 256) = 0;
  }
  *v1 = 3;
  *(_WORD *)(result + 26) = v2;
  *(_DWORD *)(result + 8) = 3;
  return result;
}

uint64_t sub_1B6908460(uint64_t result, uint64_t a2, int a3, int a4, int a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  int v15;

  if (a5 < 1)
  {
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = a3;
    do
    {
      if (a4 >= 1)
      {
        for (i = 0; i != a4; ++i)
        {
          v14 = *(unsigned __int8 *)(a2 + i);
          v10 += v14;
          v15 = *(unsigned __int8 *)(result + i);
          v9 += v15;
          v7 += (v14 * v14);
          v6 += (v15 * v15);
          v8 += (v15 * v14);
        }
      }
      a2 += v12;
      result += v12;
      ++v11;
    }
    while (v11 != a5);
  }
  *a6 = v10;
  a6[1] = v9;
  a6[2] = v7;
  a6[3] = v6;
  a6[4] = v8;
  return result;
}

uint64_t sub_1B690850C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, _QWORD *a10)
{
  int v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v13 = a4 * a3;
  if ((a3 & 0xF) != 0)
    result = sub_1B6908460(a1, a2, a5, a3, a4, &v20);
  else
    result = off_1EF13A4A8(a1, a2, a5, a3);
  v15 = (int)v20;
  v16 = v22;
  v17 = v23;
  v18 = v24;
  if (v22 * v13 - (int)v15 * (uint64_t)(int)v15 >= 1 && v23 * v13 - v21 * (uint64_t)v21 >= 1)
  {
    if (!a6)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (a6)
LABEL_12:
    *a6 = v21;
LABEL_13:
  if (a7)
    *a7 = v15;
  if (a8)
    *a8 = v17;
  if (a9)
    *a9 = v16;
  if (a10)
    *a10 = v18;
  return result;
}

uint64_t sub_1B6908654(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v4;
  int v5;
  uint64_t result;
  uint8x16_t *v7;
  uint8x16_t *v8;

  v4 = *(uint8x8_t **)(a2 + 56);
  v5 = *(_DWORD *)(a2 + 16);
  v7 = 0;
  v8 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v8, &v7))
    result = sub_1B690F53C(v4, v8, v7, v5);
  else
    result = sub_1B690F2C0(v4, 16, (uint8x8_t *)v8, v5);
  *a3 = result;
  return result;
}

uint64_t sub_1B69086D4(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  uint8x16_t *v7;
  uint8x16_t *v8;

  v4 = *(_QWORD *)(a2 + 56);
  v5 = *(_DWORD *)(a2 + 16);
  v7 = 0;
  v8 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v8, &v7))
    result = sub_1B690F680(v4, v8, v7, v5);
  else
    result = sub_1B690F3D8(v4, v8, v5);
  *a3 = result;
  return result;
}

uint64_t sub_1B6908748(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v4;
  int v5;
  uint64_t result;
  uint8x8_t *v7;
  uint8x8_t *v8;

  v4 = *(uint8x8_t **)(a2 + 56);
  v5 = *(_DWORD *)(a2 + 16);
  v7 = 0;
  v8 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v8, &v7))
    result = sub_1B690F78C(v4, v8, v7, v5);
  else
    result = sub_1B690F478(v4, v8, v5);
  *a3 = result;
  return result;
}

uint64_t sub_1B69087BC(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v4;
  uint64_t v5;
  uint64_t result;
  uint8x8_t *v7;
  uint8x8_t v8;
  uint8x8_t *v9;
  uint8x8_t v10;
  uint8x8_t *v11;
  uint8x8_t *v12;
  uint8x8_t *v13;

  v4 = *(uint8x8_t **)(a2 + 56);
  v5 = *(int *)(a2 + 16);
  v12 = 0;
  v13 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v13, &v12))
  {
    result = sub_1B690F8BC(v4, v13, v12, v5);
  }
  else
  {
    v7 = (uint8x8_t *)((char *)v13 + v5 + v5);
    v8 = *v7;
    v9 = (uint8x8_t *)((char *)v7 + v5);
    v10 = *v9;
    v11 = (uint8x8_t *)((char *)v9 + v5);
    result = vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v4[4], v8), v4[12], *(uint8x8_t *)((char *)v11 + v5 + v5)), (int16x8_t)vabal_u8(vabdl_u8(v4[6], v10), v4[14], *(uint8x8_t *)((char *)v11 + v5 + v5 + v5))), vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v4[2], *(uint8x8_t *)((char *)v13 + v5)), v4[10], *(uint8x8_t *)((char *)v11 + v5)), (int16x8_t)vabal_u8(vabdl_u8(*v4, *v13), v4[8], *v11))));
  }
  *a3 = result;
  return result;
}

int16x4_t sub_1B69088B0(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B69100D4(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B69088CC(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B6910228(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B69088E8(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B691035C(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B6908904(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B6910478(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B6908920(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B691001C(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B690893C(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B6910170(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B6908958(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B69102C4(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B6908974(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  return sub_1B69103E0(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], *(_DWORD *)(a2 + 16), a3);
}

int16x4_t sub_1B6908990(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  int v4;
  uint8x8_t *v5;
  int16x4_t result;

  v4 = *(_DWORD *)(a2 + 16);
  v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1B68FEA94(a1))
    return sub_1B691001C(v5, 0, 0, 0, 0, v4, a3);
  a3->i16[0] = sub_1B690F53C(v5, 0, 0, v4);
  a3->i16[1] = sub_1B690F53C(v5, 0, 0, v4);
  a3->i16[2] = sub_1B690F53C(v5, 0, 0, v4);
  a3->i16[3] = sub_1B690F53C(v5, 0, 0, v4);
  return result;
}

int16x4_t sub_1B6908A8C(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  int v4;
  uint8x8_t *v5;
  int16x4_t result;

  v4 = *(_DWORD *)(a2 + 16);
  v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1B68FEA94(a1))
    return sub_1B6910170(v5, 0, 0, 0, 0, v4, a3);
  a3->i16[0] = sub_1B690F680((uint64_t)v5, 0, 0, v4);
  a3->i16[1] = sub_1B690F680((uint64_t)v5, 0, 0, v4);
  a3->i16[2] = sub_1B690F680((uint64_t)v5, 0, 0, v4);
  a3->i16[3] = sub_1B690F680((uint64_t)v5, 0, 0, v4);
  return result;
}

int16x4_t sub_1B6908B88(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  int v4;
  uint8x8_t *v5;
  int16x4_t result;

  v4 = *(_DWORD *)(a2 + 16);
  v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1B68FEA94(a1))
    return sub_1B69102C4(v5, 0, 0, 0, 0, v4, a3);
  a3->i16[0] = sub_1B690F78C(v5, 0, 0, v4);
  a3->i16[1] = sub_1B690F78C(v5, 0, 0, v4);
  a3->i16[2] = sub_1B690F78C(v5, 0, 0, v4);
  a3->i16[3] = sub_1B690F78C(v5, 0, 0, v4);
  return result;
}

int16x4_t sub_1B6908C84(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  int v4;
  uint8x8_t *v5;
  int16x4_t result;

  v4 = *(_DWORD *)(a2 + 16);
  v5 = *(uint8x8_t **)(a2 + 56);
  if (!sub_1B68FEA94(a1))
    return sub_1B69103E0(v5, 0, 0, 0, 0, v4, a3);
  a3->i16[0] = sub_1B690F8BC(v5, 0, 0, v4);
  a3->i16[1] = sub_1B690F8BC(v5, 0, 0, v4);
  a3->i16[2] = sub_1B690F8BC(v5, 0, 0, v4);
  a3->i16[3] = sub_1B690F8BC(v5, 0, 0, v4);
  return result;
}

int16x4_t sub_1B6908D80(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B69100D4(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  return sub_1B69100D4(*(uint8x8_t **)(a2 + 56), a1[3], a1[4], a1[5], v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1B6908DDC(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B6910228(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  return sub_1B6910228(*(uint8x8_t **)(a2 + 56), a1[3], a1[4], a1[5], v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1B6908E38(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B691035C(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  return sub_1B691035C(*(uint8x8_t **)(a2 + 56), a1[3], a1[4], a1[5], v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1B6908E94(uint8x8_t **a1, uint64_t a2, uint64_t a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B6910478(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], v6, (int16x4_t *)a3);
  return sub_1B6910478(*(uint8x8_t **)(a2 + 56), a1[3], a1[4], a1[5], v6, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1B6908EF0(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B691001C(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  return sub_1B691001C(*(uint8x8_t **)(a2 + 56), a1[4], a1[5], a1[6], a1[7], v6, a3 + 1);
}

int16x4_t sub_1B6908F4C(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B6910170(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  return sub_1B6910170(*(uint8x8_t **)(a2 + 56), a1[4], a1[5], a1[6], a1[7], v6, a3 + 1);
}

int16x4_t sub_1B6908FA8(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B69102C4(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  return sub_1B69102C4(*(uint8x8_t **)(a2 + 56), a1[4], a1[5], a1[6], a1[7], v6, a3 + 1);
}

int16x4_t sub_1B6909004(uint8x8_t **a1, uint64_t a2, int16x4_t *a3)
{
  int v6;

  v6 = *(_DWORD *)(a2 + 16);
  sub_1B69103E0(*(uint8x8_t **)(a2 + 56), *a1, a1[1], a1[2], a1[3], v6, a3);
  return sub_1B69103E0(*(uint8x8_t **)(a2 + 56), a1[4], a1[5], a1[6], a1[7], v6, a3 + 1);
}

uint64_t sub_1B6909060(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v5;
  int v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t result;
  uint64_t v11;
  uint8x16_t *v12;
  int8x16_t v13[16];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(uint8x8_t **)(a2 + 56);
  v6 = *(_DWORD *)(a2 + 16);
  v11 = 0;
  v12 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v12, &v11))
    sub_1B690DEF8(v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  else
    sub_1B690DE78(v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  result = sub_1B690F2C0(v5, 16, (uint8x8_t *)v13, 16);
  *a3 = result;
  return result;
}

uint64_t sub_1B6909138(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint64_t v5;
  int v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t result;
  uint64_t v11;
  uint8x16_t *v12;
  uint8x16_t v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a2 + 56);
  v6 = *(_DWORD *)(a2 + 16);
  v11 = 0;
  v12 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v12, &v11))
    sub_1B690E094((int8x16_t *)v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  else
    sub_1B690E014((int8x16_t *)v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  result = sub_1B690F3D8(v5, v13, 16);
  *a3 = result;
  return result;
}

uint64_t sub_1B6909204(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  int8x8_t v10;
  uint8x8_t *v11;
  int16x8_t v12;
  int16x8_t v13;
  int8x8_t *v14;
  unsigned int v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  int8x8_t v20;
  int8x8_t v21;
  uint64_t result;
  uint64_t v23;
  uint8x8_t *v24;
  uint8x8_t v25[18];

  v25[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v5 = *(uint8x8_t **)(a2 + 56);
  v6 = *(int *)(a2 + 16);
  v23 = 0;
  v24 = 0;
  v7 = sub_1B68FEA1C(a1, (_DWORD *)a2, &v24, &v23);
  v11 = v24;
  if (v7)
  {
    sub_1B690E1D0((int8x8_t *)v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(_BYTE *)(a2 + 72);
    v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v13 = vdupq_n_s16(*(char *)(a2 + 73));
    v14 = (int8x8_t *)v25;
    v15 = 20;
    v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v6);
      v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  result = sub_1B690F478(v5, v25, 8);
  *a3 = result;
  return result;
}

float sub_1B6909354(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  int8x8_t v10;
  uint8x8_t *v11;
  int16x8_t v12;
  int16x8_t v13;
  int8x8_t *v14;
  unsigned int v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  int8x8_t v20;
  int8x8_t v21;
  float result;
  uint64_t v23;
  uint8x8_t *v24;
  int8x8_t v25[10];

  v25[9] = *(int8x8_t *)MEMORY[0x1E0C80C00];
  v5 = *(uint8x8_t **)(a2 + 56);
  v6 = *(int *)(a2 + 16);
  v23 = 0;
  v24 = 0;
  v7 = sub_1B68FEA1C(a1, (_DWORD *)a2, &v24, &v23);
  v11 = v24;
  if (v7)
  {
    sub_1B690E340(v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(_BYTE *)(a2 + 72);
    v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v13 = vdupq_n_s16(*(char *)(a2 + 73));
    v14 = v25;
    v15 = 12;
    v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v6);
      v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  result = COERCE_FLOAT(vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v5[4], (uint8x8_t)v25[2]), v5[12], (uint8x8_t)v25[6]), (int16x8_t)vabal_u8(vabdl_u8(v5[6], (uint8x8_t)v25[3]), v5[14], (uint8x8_t)v25[7])), vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(v5[2], (uint8x8_t)v25[1]), v5[10], (uint8x8_t)v25[5]), (int16x8_t)vabal_u8(vabdl_u8(*v5, (uint8x8_t)v25[0]), v5[8], (uint8x8_t)v25[4])))));
  *a3 = LOWORD(result);
  return result;
}

int16x4_t sub_1B69094F8(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  uint8x8_t *v10;
  int v11;
  uint8x16_t *v12;
  uint8x8_t v14[32];
  uint8x8_t v15[32];
  uint8x8_t v16[34];

  v9 = 0;
  v16[33] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(uint8x8_t **)(a2 + 56);
  v11 = *(_DWORD *)(a2 + 16);
  do
  {
    v12 = *a1++;
    sub_1B690DE78((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 96);
  return sub_1B69100D4(v10, v14, v15, v16, 16, a3);
}

int16x4_t sub_1B69095C0(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  uint8x8_t *v10;
  int v11;
  uint8x16_t *v12;
  uint8x8_t v14[16];
  uint8x8_t v15[16];
  uint8x8_t v16[18];

  v9 = 0;
  v16[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(uint8x8_t **)(a2 + 56);
  v11 = *(_DWORD *)(a2 + 16);
  do
  {
    v12 = *a1++;
    sub_1B690E014((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 48);
  return sub_1B6910228(v10, v14, v15, v16, 16, a3);
}

int16x4_t sub_1B6909688(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6;
  uint8x8_t *v7;
  uint64_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint8x8_t v11;
  uint8x8_t *v12;
  unsigned int v13;
  int8x8_t *v14;
  uint8x8_t v15;
  uint8x8_t *v16;
  uint8x8_t v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  int8x8_t v21;
  uint8x8_t *v22;
  uint8x8_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  uint64_t v27;
  uint8x8_t v28;
  int16x4_t result;
  uint8x8_t v30[50];

  v6 = 0;
  v30[49] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v7 = *(uint8x8_t **)(a2 + 56);
  v8 = *(int *)(a2 + 16);
  v9 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v10 = vdupq_n_s16(*(char *)(a2 + 73));
  v11 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v12 = *(uint8x8_t **)(a1 + 8 * v6);
    v13 = 20;
    v14 = (int8x8_t *)&v30[16 * v6];
    do
    {
      v15 = *v12;
      v16 = (uint8x8_t *)((char *)v12 + v8);
      v17 = *v16;
      v18 = (uint8x8_t *)((char *)v16 + v8);
      v19 = *v18;
      v20 = (uint8x8_t *)((char *)v18 + v8);
      v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v20, v11), v9), v10));
      *v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v15, v11), v9), v10));
      v14[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v11), v9), v10));
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v11), v9), v10));
      v14[3] = v21;
      v14 += 4;
      v13 -= 4;
      v12 = (uint8x8_t *)((char *)v20 + v8);
    }
    while (v13 > 4);
    ++v6;
  }
  while (v6 != 3);
  v23 = *v7;
  v22 = v7 + 2;
  v24 = (int8x16_t)vabdl_u8(v23, v30[0]);
  v25 = (int8x16_t)vabdl_u8(v23, v30[16]);
  v26 = (int8x16_t)vabdl_u8(v23, v30[32]);
  v27 = 33;
  do
  {
    v28 = *v22;
    v22 += 2;
    v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v30[v27 - 32]);
    v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v30[v27 - 16]);
    v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v30[v27++]);
  }
  while ((_DWORD)(v27 * 8) != 384);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  *a3 = result;
  return result;
}

int16x4_t sub_1B690980C(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6;
  uint8x8_t *v7;
  uint64_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint8x8_t v11;
  uint8x8_t *v12;
  unsigned int v13;
  int8x8_t *v14;
  uint8x8_t v15;
  uint8x8_t *v16;
  uint8x8_t v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  int8x8_t v21;
  uint8x8_t *v22;
  uint8x8_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  uint64_t v27;
  uint8x8_t v28;
  int16x4_t result;
  uint8x8_t v30[26];

  v6 = 0;
  v30[25] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v7 = *(uint8x8_t **)(a2 + 56);
  v8 = *(int *)(a2 + 16);
  v9 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v10 = vdupq_n_s16(*(char *)(a2 + 73));
  v11 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v12 = *(uint8x8_t **)(a1 + 8 * v6);
    v13 = 12;
    v14 = (int8x8_t *)&v30[8 * v6];
    do
    {
      v15 = *v12;
      v16 = (uint8x8_t *)((char *)v12 + v8);
      v17 = *v16;
      v18 = (uint8x8_t *)((char *)v16 + v8);
      v19 = *v18;
      v20 = (uint8x8_t *)((char *)v18 + v8);
      v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v20, v11), v9), v10));
      *v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v15, v11), v9), v10));
      v14[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v11), v9), v10));
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v11), v9), v10));
      v14[3] = v21;
      v14 += 4;
      v13 -= 4;
      v12 = (uint8x8_t *)((char *)v20 + v8);
    }
    while (v13 > 4);
    ++v6;
  }
  while (v6 != 3);
  v23 = *v7;
  v22 = v7 + 2;
  v24 = (int8x16_t)vabdl_u8(v23, v30[0]);
  v25 = (int8x16_t)vabdl_u8(v23, v30[8]);
  v26 = (int8x16_t)vabdl_u8(v23, v30[16]);
  v27 = 17;
  do
  {
    v28 = *v22;
    v22 += 2;
    v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v30[v27 - 16]);
    v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v30[v27 - 8]);
    v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v30[v27++]);
  }
  while ((_DWORD)(v27 * 8) != 192);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  *a3 = result;
  return result;
}

int16x4_t sub_1B6909988(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  uint8x8_t *v10;
  int v11;
  uint8x16_t *v12;
  uint8x8_t v14[32];
  uint8x8_t v15[32];
  uint8x8_t v16[32];
  uint8x8_t v17[34];

  v9 = 0;
  v17[33] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(uint8x8_t **)(a2 + 56);
  v11 = *(_DWORD *)(a2 + 16);
  do
  {
    v12 = *a1++;
    sub_1B690DE78((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 128);
  return sub_1B691001C(v10, v14, v15, v16, v17, 16, a3);
}

int16x4_t sub_1B6909A54(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  uint8x8_t *v10;
  int v11;
  uint8x16_t *v12;
  uint8x8_t v14[16];
  uint8x8_t v15[16];
  uint8x8_t v16[16];
  uint8x8_t v17[18];

  v9 = 0;
  v17[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(uint8x8_t **)(a2 + 56);
  v11 = *(_DWORD *)(a2 + 16);
  do
  {
    v12 = *a1++;
    sub_1B690E014((int8x16_t *)&v14[v9], v12, v11, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 64);
  return sub_1B6910170(v10, v14, v15, v16, v17, 16, a3);
}

int16x4_t sub_1B6909B20(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v7;
  uint8x8_t *v8;
  uint64_t v9;
  int16x8_t v10;
  int16x8_t v11;
  uint8x8_t v12;
  uint8x8_t *v13;
  unsigned int v14;
  int8x8_t *v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  uint8x8_t v20;
  uint8x8_t *v21;
  int8x8_t v22;
  uint8x8_t v24[16];
  uint8x8_t v25[16];
  uint8x8_t v26[16];
  uint8x8_t v27[18];

  v7 = 0;
  v27[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v8 = *(uint8x8_t **)(a2 + 56);
  v9 = *(int *)(a2 + 16);
  v10 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v11 = vdupq_n_s16(*(char *)(a2 + 73));
  v12 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v13 = *(uint8x8_t **)(a1 + 8 * v7);
    v14 = 20;
    v15 = (int8x8_t *)&v24[16 * v7];
    do
    {
      v16 = *v13;
      v17 = (uint8x8_t *)((char *)v13 + v9);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v9);
      v20 = *v19;
      v21 = (uint8x8_t *)((char *)v19 + v9);
      v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v21, v12), v10), v11));
      *v15 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v12), v10), v11));
      v15[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v12), v10), v11));
      v15[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v20, v12), v10), v11));
      v15[3] = v22;
      v15 += 4;
      v14 -= 4;
      v13 = (uint8x8_t *)((char *)v21 + v9);
    }
    while (v14 > 4);
    ++v7;
  }
  while (v7 != 4);
  return sub_1B69102C4(v8, v24, v25, v26, v27, 8, a3);
}

int16x4_t sub_1B6909C4C(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v7;
  uint8x8_t *v8;
  uint64_t v9;
  int16x8_t v10;
  int16x8_t v11;
  uint8x8_t v12;
  uint8x8_t *v13;
  unsigned int v14;
  int8x8_t *v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  uint8x8_t v20;
  uint8x8_t *v21;
  int8x8_t v22;
  uint8x8_t v24[8];
  uint8x8_t v25[8];
  uint8x8_t v26[8];
  uint8x8_t v27[10];

  v7 = 0;
  v27[9] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v8 = *(uint8x8_t **)(a2 + 56);
  v9 = *(int *)(a2 + 16);
  v10 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v11 = vdupq_n_s16(*(char *)(a2 + 73));
  v12 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v13 = *(uint8x8_t **)(a1 + 8 * v7);
    v14 = 12;
    v15 = (int8x8_t *)&v24[8 * v7];
    do
    {
      v16 = *v13;
      v17 = (uint8x8_t *)((char *)v13 + v9);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v9);
      v20 = *v19;
      v21 = (uint8x8_t *)((char *)v19 + v9);
      v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v21, v12), v10), v11));
      *v15 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v12), v10), v11));
      v15[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v12), v10), v11));
      v15[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v20, v12), v10), v11));
      v15[3] = v22;
      v15 += 4;
      v14 -= 4;
      v13 = (uint8x8_t *)((char *)v21 + v9);
    }
    while (v14 > 4);
    ++v7;
  }
  while (v7 != 4);
  return sub_1B69103E0(v8, v24, v25, v26, v27, 8, a3);
}

int16x4_t sub_1B6909D78(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  int v5;
  uint8x8_t *v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t v10;
  int8x16_t *v11;
  uint64_t v12;
  int8x16_t *v13;
  uint8x8_t v15[32];
  uint8x8_t v16[32];
  uint8x8_t v17[32];
  uint8x8_t v18[32];
  _OWORD v19[2];
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(_DWORD *)(a2 + 16);
  memset(v20, 0, sizeof(v20));
  memset(v19, 0, sizeof(v19));
  v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1B68FEA94(a1))
  {
    v10 = 0;
    v11 = (int8x16_t *)v15;
    do
    {
      sub_1B690DEF8(v11, *(_QWORD *)((char *)v20 + v10), *(_QWORD *)((char *)v19 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 16;
    }
    while (v10 != 32);
  }
  else
  {
    v12 = 0;
    v13 = (int8x16_t *)v15;
    do
    {
      sub_1B690DE78(v13, *(uint8x16_t **)((char *)v20 + v12), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v12 += 8;
      v13 += 16;
    }
    while (v12 != 32);
  }
  return sub_1B691001C(v6, v15, v16, v17, v18, 16, a3);
}

int16x4_t sub_1B6909EB0(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  int v5;
  uint8x8_t *v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t v10;
  int8x16_t *v11;
  uint64_t v12;
  int8x16_t *v13;
  uint8x8_t v15[16];
  uint8x8_t v16[16];
  uint8x8_t v17[16];
  uint8x8_t v18[16];
  _OWORD v19[2];
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(_DWORD *)(a2 + 16);
  memset(v20, 0, sizeof(v20));
  memset(v19, 0, sizeof(v19));
  v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1B68FEA94(a1))
  {
    v10 = 0;
    v11 = (int8x16_t *)v15;
    do
    {
      sub_1B690E094(v11, *(_QWORD *)((char *)v20 + v10), *(_QWORD *)((char *)v19 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 8;
    }
    while (v10 != 32);
  }
  else
  {
    v12 = 0;
    v13 = (int8x16_t *)v15;
    do
    {
      sub_1B690E014(v13, *(uint8x16_t **)((char *)v20 + v12), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v12 += 8;
      v13 += 8;
    }
    while (v12 != 32);
  }
  return sub_1B6910170(v6, v15, v16, v17, v18, 16, a3);
}

int16x4_t sub_1B6909FE8(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v5;
  uint8x8_t *v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t v10;
  int8x8_t *v11;
  uint64_t v12;
  int16x8_t v13;
  int16x8_t v14;
  uint8x8_t v15;
  uint8x8_t *v16;
  unsigned int v17;
  int8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  uint8x8_t v21;
  uint8x8_t *v22;
  uint8x8_t v23;
  uint8x8_t *v24;
  int8x8_t v25;
  uint8x8_t v27[16];
  uint8x8_t v28[16];
  uint8x8_t v29[16];
  uint8x8_t v30[16];
  _OWORD v31[2];
  _OWORD v32[2];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = *(int *)(a2 + 16);
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1B68FEA94(a1))
  {
    v10 = 0;
    v11 = (int8x8_t *)v27;
    do
    {
      sub_1B690E1D0(v11, *(_QWORD *)((char *)v32 + v10), *(_QWORD *)((char *)v31 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 16;
    }
    while (v10 != 32);
  }
  else
  {
    v12 = 0;
    v13 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v9.i8[0] = *(_BYTE *)(a2 + 72);
    v14 = vdupq_n_s16(*(char *)(a2 + 73));
    v15 = (uint8x8_t)vdup_lane_s8(v9, 0);
    do
    {
      v16 = (uint8x8_t *)*((_QWORD *)v32 + v12);
      v17 = 20;
      v18 = (int8x8_t *)&v27[16 * v12];
      do
      {
        v19 = *v16;
        v20 = (uint8x8_t *)((char *)v16 + v5);
        v21 = *v20;
        v22 = (uint8x8_t *)((char *)v20 + v5);
        v23 = *v22;
        v24 = (uint8x8_t *)((char *)v22 + v5);
        v25 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v24, v15), v13), v14));
        *v18 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v15), v13), v14));
        v18[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v15), v13), v14));
        v18[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v23, v15), v13), v14));
        v18[3] = v25;
        v18 += 4;
        v17 -= 4;
        v16 = (uint8x8_t *)((char *)v24 + v5);
      }
      while (v17 > 4);
      ++v12;
    }
    while (v12 != 4);
  }
  return sub_1B69102C4(v6, v27, v28, v29, v30, 8, a3);
}

int16x4_t sub_1B690A1A0(unsigned int a1, uint64_t a2, int16x4_t *a3)
{
  uint64_t v5;
  uint8x8_t *v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t v10;
  int8x8_t *v11;
  uint64_t v12;
  int16x8_t v13;
  int16x8_t v14;
  uint8x8_t v15;
  uint8x8_t *v16;
  unsigned int v17;
  int8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  uint8x8_t v21;
  uint8x8_t *v22;
  uint8x8_t v23;
  uint8x8_t *v24;
  int8x8_t v25;
  uint8x8_t v27[8];
  uint8x8_t v28[8];
  uint8x8_t v29[8];
  uint8x8_t v30[8];
  _OWORD v31[2];
  _OWORD v32[2];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = *(int *)(a2 + 16);
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  v6 = *(uint8x8_t **)(a2 + 56);
  if (sub_1B68FEA94(a1))
  {
    v10 = 0;
    v11 = (int8x8_t *)v27;
    do
    {
      sub_1B690E340(v11, *(_QWORD *)((char *)v32 + v10), *(_QWORD *)((char *)v31 + v10), v5, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
      v10 += 8;
      v11 += 8;
    }
    while (v10 != 32);
  }
  else
  {
    v12 = 0;
    v13 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v9.i8[0] = *(_BYTE *)(a2 + 72);
    v14 = vdupq_n_s16(*(char *)(a2 + 73));
    v15 = (uint8x8_t)vdup_lane_s8(v9, 0);
    do
    {
      v16 = (uint8x8_t *)*((_QWORD *)v32 + v12);
      v17 = 12;
      v18 = (int8x8_t *)&v27[8 * v12];
      do
      {
        v19 = *v16;
        v20 = (uint8x8_t *)((char *)v16 + v5);
        v21 = *v20;
        v22 = (uint8x8_t *)((char *)v20 + v5);
        v23 = *v22;
        v24 = (uint8x8_t *)((char *)v22 + v5);
        v25 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v24, v15), v13), v14));
        *v18 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v15), v13), v14));
        v18[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v15), v13), v14));
        v18[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v23, v15), v13), v14));
        v18[3] = v25;
        v18 += 4;
        v17 -= 4;
        v16 = (uint8x8_t *)((char *)v24 + v5);
      }
      while (v17 > 4);
      ++v12;
    }
    while (v12 != 4);
  }
  return sub_1B69103E0(v6, v27, v28, v29, v30, 8, a3);
}

int16x4_t sub_1B690A358(uint8x16_t **a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  int v10;
  uint8x16_t **v11;
  uint8x16_t *v12;
  double v13;
  double v14;
  int8x8_t v15;
  uint64_t v16;
  uint8x16_t **v17;
  uint8x16_t *v18;
  uint8x8_t v20[32];
  uint8x8_t v21[32];
  uint8x8_t v22[34];

  v9 = 0;
  v22[33] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(_DWORD *)(a2 + 16);
  v11 = a1;
  do
  {
    v12 = *v11++;
    sub_1B690DE78((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 96);
  *(int16x4_t *)&v13 = sub_1B69100D4(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)a3);
  v16 = 0;
  v17 = a1 + 3;
  do
  {
    v18 = *v17++;
    sub_1B690DE78((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 32;
  }
  while (v16 != 96);
  return sub_1B69100D4(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1B690A47C(uint8x16_t **a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  int v10;
  uint8x16_t **v11;
  uint8x16_t *v12;
  double v13;
  double v14;
  int8x8_t v15;
  uint64_t v16;
  uint8x16_t **v17;
  uint8x16_t *v18;
  uint8x8_t v20[16];
  uint8x8_t v21[16];
  uint8x8_t v22[18];

  v9 = 0;
  v22[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(_DWORD *)(a2 + 16);
  v11 = a1;
  do
  {
    v12 = *v11++;
    sub_1B690E014((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 48);
  *(int16x4_t *)&v13 = sub_1B6910228(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)a3);
  v16 = 0;
  v17 = a1 + 3;
  do
  {
    v18 = *v17++;
    sub_1B690E014((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 16;
  }
  while (v16 != 48);
  return sub_1B6910228(*(uint8x8_t **)(a2 + 56), v20, v21, v22, 16, (int16x4_t *)(a3 + 6));
}

int16x4_t sub_1B690A5A0(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6;
  uint64_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint8x8_t v10;
  uint8x8_t *v11;
  unsigned int v12;
  int8x8_t *v13;
  uint8x8_t v14;
  uint8x8_t *v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  int8x8_t v20;
  uint8x8_t *v21;
  uint8x8_t *v22;
  uint8x8_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  uint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  int16x8_t v30;
  int16x8_t v31;
  uint8x8_t v32;
  int8x8_t *v33;
  uint8x8_t *v34;
  unsigned int i;
  uint8x8_t v36;
  uint8x8_t *v37;
  uint8x8_t v38;
  uint8x8_t *v39;
  uint8x8_t v40;
  uint8x8_t *v41;
  int8x8_t v42;
  uint8x8_t *v43;
  uint8x8_t *v44;
  uint8x8_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  uint64_t v49;
  uint8x8_t v50;
  int16x4_t result;
  uint8x8_t v52[16];
  uint8x8_t v53;
  uint8x8_t v54;
  uint64_t v55;

  v6 = 0;
  v55 = *MEMORY[0x1E0C80C00];
  v7 = *(int *)(a2 + 16);
  v8 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v9 = vdupq_n_s16(*(char *)(a2 + 73));
  v10 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v11 = *(uint8x8_t **)(a1 + 8 * v6);
    v12 = 20;
    v13 = (int8x8_t *)&v52[16 * v6];
    do
    {
      v14 = *v11;
      v15 = (uint8x8_t *)((char *)v11 + v7);
      v16 = *v15;
      v17 = (uint8x8_t *)((char *)v15 + v7);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v7);
      v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v10), v8), v9));
      *v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v14, v10), v8), v9));
      v13[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v10), v8), v9));
      v13[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v10), v8), v9));
      v13[3] = v20;
      v13 += 4;
      v12 -= 4;
      v11 = (uint8x8_t *)((char *)v19 + v7);
    }
    while (v12 > 4);
    ++v6;
  }
  while (v6 != 3);
  v21 = *(uint8x8_t **)(a2 + 56);
  v23 = *v21;
  v22 = v21 + 2;
  v24 = (int8x16_t)vabdl_u8(v23, v52[0]);
  v25 = (int8x16_t)vabdl_u8(v23, v53);
  v26 = (int8x16_t)vabdl_u8(v23, v54);
  v27 = 33;
  do
  {
    v28 = *v22;
    v22 += 2;
    v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v52[v27 - 32]);
    v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v52[v27 - 16]);
    v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v52[v27++]);
  }
  while ((_DWORD)(v27 * 8) != 384);
  v29 = 0;
  *(int16x4_t *)a3 = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  v30 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  v31 = vdupq_n_s16(*(char *)(a2 + 73));
  v32 = (uint8x8_t)vdup_lane_s8((int8x8_t)*(unsigned __int8 *)(a2 + 72), 0);
  do
  {
    v33 = (int8x8_t *)&v52[16 * v29];
    v34 = *(uint8x8_t **)(a1 + 8 * v29 + 24);
    for (i = 20; i > 4; i -= 4)
    {
      v36 = *v34;
      v37 = (uint8x8_t *)((char *)v34 + v7);
      v38 = *v37;
      v39 = (uint8x8_t *)((char *)v37 + v7);
      v40 = *v39;
      v41 = (uint8x8_t *)((char *)v39 + v7);
      v42 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v41, v32), v30), v31));
      *v33 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v32), v30), v31));
      v33[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v38, v32), v30), v31));
      v33[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v40, v32), v30), v31));
      v33[3] = v42;
      v33 += 4;
      v34 = (uint8x8_t *)((char *)v41 + v7);
    }
    ++v29;
  }
  while (v29 != 3);
  v43 = *(uint8x8_t **)(a2 + 56);
  v45 = *v43;
  v44 = v43 + 2;
  v46 = (int8x16_t)vabdl_u8(v45, v52[0]);
  v47 = (int8x16_t)vabdl_u8(v45, v53);
  v48 = (int8x16_t)vabdl_u8(v45, v54);
  v49 = 33;
  do
  {
    v50 = *v44;
    v44 += 2;
    v46 = (int8x16_t)vabal_u8((uint16x8_t)v46, v50, v52[v49 - 32]);
    v47 = (int8x16_t)vabal_u8((uint16x8_t)v47, v50, v52[v49 - 16]);
    v48 = (int8x16_t)vabal_u8((uint16x8_t)v48, v50, v52[v49++]);
  }
  while ((_DWORD)(v49 * 8) != 384);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v46.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v46, v46, 8uLL)), vadd_s16(*(int16x4_t *)v47.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v48.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)), 0));
  *(int16x4_t *)(a3 + 6) = result;
  return result;
}

int16x4_t sub_1B690A85C(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v6;
  uint64_t v7;
  int16x8_t v8;
  int16x8_t v9;
  uint8x8_t v10;
  uint8x8_t *v11;
  unsigned int v12;
  int8x8_t *v13;
  uint8x8_t v14;
  uint8x8_t *v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  int8x8_t v20;
  uint8x8_t *v21;
  uint8x8_t *v22;
  uint8x8_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  uint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  int16x8_t v30;
  int16x8_t v31;
  uint8x8_t v32;
  int8x8_t *v33;
  uint8x8_t *v34;
  unsigned int i;
  uint8x8_t v36;
  uint8x8_t *v37;
  uint8x8_t v38;
  uint8x8_t *v39;
  uint8x8_t v40;
  uint8x8_t *v41;
  int8x8_t v42;
  uint8x8_t *v43;
  uint8x8_t *v44;
  uint8x8_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  uint64_t v49;
  uint8x8_t v50;
  int16x4_t result;
  uint8x8_t v52[8];
  uint8x8_t v53;
  uint8x8_t v54;
  uint64_t v55;

  v6 = 0;
  v55 = *MEMORY[0x1E0C80C00];
  v7 = *(int *)(a2 + 16);
  v8 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v9 = vdupq_n_s16(*(char *)(a2 + 73));
  v10 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v11 = *(uint8x8_t **)(a1 + 8 * v6);
    v12 = 12;
    v13 = (int8x8_t *)&v52[8 * v6];
    do
    {
      v14 = *v11;
      v15 = (uint8x8_t *)((char *)v11 + v7);
      v16 = *v15;
      v17 = (uint8x8_t *)((char *)v15 + v7);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v7);
      v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v10), v8), v9));
      *v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v14, v10), v8), v9));
      v13[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v16, v10), v8), v9));
      v13[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v10), v8), v9));
      v13[3] = v20;
      v13 += 4;
      v12 -= 4;
      v11 = (uint8x8_t *)((char *)v19 + v7);
    }
    while (v12 > 4);
    ++v6;
  }
  while (v6 != 3);
  v21 = *(uint8x8_t **)(a2 + 56);
  v23 = *v21;
  v22 = v21 + 2;
  v24 = (int8x16_t)vabdl_u8(v23, v52[0]);
  v25 = (int8x16_t)vabdl_u8(v23, v53);
  v26 = (int8x16_t)vabdl_u8(v23, v54);
  v27 = 17;
  do
  {
    v28 = *v22;
    v22 += 2;
    v24 = (int8x16_t)vabal_u8((uint16x8_t)v24, v28, v52[v27 - 16]);
    v25 = (int8x16_t)vabal_u8((uint16x8_t)v25, v28, v52[v27 - 8]);
    v26 = (int8x16_t)vabal_u8((uint16x8_t)v26, v28, v52[v27++]);
  }
  while ((_DWORD)(v27 * 8) != 192);
  v29 = 0;
  *(int16x4_t *)a3 = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v24.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v24, v24, 8uLL)), vadd_s16(*(int16x4_t *)v25.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v26.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)), 0));
  v30 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  v31 = vdupq_n_s16(*(char *)(a2 + 73));
  v32 = (uint8x8_t)vdup_lane_s8((int8x8_t)*(unsigned __int8 *)(a2 + 72), 0);
  do
  {
    v33 = (int8x8_t *)&v52[8 * v29];
    v34 = *(uint8x8_t **)(a1 + 8 * v29 + 24);
    for (i = 12; i > 4; i -= 4)
    {
      v36 = *v34;
      v37 = (uint8x8_t *)((char *)v34 + v7);
      v38 = *v37;
      v39 = (uint8x8_t *)((char *)v37 + v7);
      v40 = *v39;
      v41 = (uint8x8_t *)((char *)v39 + v7);
      v42 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v41, v32), v30), v31));
      *v33 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v32), v30), v31));
      v33[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v38, v32), v30), v31));
      v33[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v40, v32), v30), v31));
      v33[3] = v42;
      v33 += 4;
      v34 = (uint8x8_t *)((char *)v41 + v7);
    }
    ++v29;
  }
  while (v29 != 3);
  v43 = *(uint8x8_t **)(a2 + 56);
  v45 = *v43;
  v44 = v43 + 2;
  v46 = (int8x16_t)vabdl_u8(v45, v52[0]);
  v47 = (int8x16_t)vabdl_u8(v45, v53);
  v48 = (int8x16_t)vabdl_u8(v45, v54);
  v49 = 17;
  do
  {
    v50 = *v44;
    v44 += 2;
    v46 = (int8x16_t)vabal_u8((uint16x8_t)v46, v50, v52[v49 - 16]);
    v47 = (int8x16_t)vabal_u8((uint16x8_t)v47, v50, v52[v49 - 8]);
    v48 = (int8x16_t)vabal_u8((uint16x8_t)v48, v50, v52[v49++]);
  }
  while ((_DWORD)(v49 * 8) != 192);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v46.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v46, v46, 8uLL)), vadd_s16(*(int16x4_t *)v47.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v47, v47, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v48.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)), 0));
  *(int16x4_t *)(a3 + 6) = result;
  return result;
}

int16x4_t sub_1B690AB10(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  int v10;
  uint8x16_t **v11;
  uint8x16_t *v12;
  double v13;
  double v14;
  int8x8_t v15;
  uint64_t v16;
  uint8x16_t **v17;
  uint8x16_t *v18;
  uint8x8_t v20[32];
  uint8x8_t v21[32];
  uint8x8_t v22[32];
  uint8x8_t v23[34];

  v9 = 0;
  v23[33] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(_DWORD *)(a2 + 16);
  v11 = a1;
  do
  {
    v12 = *v11++;
    sub_1B690DE78((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 32;
  }
  while (v9 != 128);
  *(int16x4_t *)&v13 = sub_1B691001C(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3);
  v16 = 0;
  v17 = a1 + 4;
  do
  {
    v18 = *v17++;
    sub_1B690DE78((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 32;
  }
  while (v16 != 128);
  return sub_1B691001C(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3 + 1);
}

int16x4_t sub_1B690AC40(uint8x16_t **a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  int v10;
  uint8x16_t **v11;
  uint8x16_t *v12;
  double v13;
  double v14;
  int8x8_t v15;
  uint64_t v16;
  uint8x16_t **v17;
  uint8x16_t *v18;
  uint8x8_t v20[16];
  uint8x8_t v21[16];
  uint8x8_t v22[16];
  uint8x8_t v23[18];

  v9 = 0;
  v23[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(_DWORD *)(a2 + 16);
  v11 = a1;
  do
  {
    v12 = *v11++;
    sub_1B690E014((int8x16_t *)&v20[v9], v12, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
    v9 += 16;
  }
  while (v9 != 64);
  *(int16x4_t *)&v13 = sub_1B6910170(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3);
  v16 = 0;
  v17 = a1 + 4;
  do
  {
    v18 = *v17++;
    sub_1B690E014((int8x16_t *)&v20[v16], v18, v10, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v13, v14, v15);
    v16 += 16;
  }
  while (v16 != 64);
  return sub_1B6910170(*(uint8x8_t **)(a2 + 56), v20, v21, v22, v23, 16, a3 + 1);
}

int16x4_t sub_1B690AD70(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  uint64_t v10;
  int16x8_t v11;
  int16x8_t v12;
  uint8x8_t v13;
  uint8x8_t *v14;
  unsigned int v15;
  int8x8_t *v16;
  uint8x8_t v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  uint8x8_t v21;
  uint8x8_t *v22;
  int8x8_t v23;
  uint64_t v24;
  int8x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  uint8x8_t v28;
  int8x8_t *v29;
  uint8x8_t *v30;
  unsigned int i;
  uint8x8_t v32;
  uint8x8_t *v33;
  uint8x8_t v34;
  uint8x8_t *v35;
  uint8x8_t v36;
  uint8x8_t *v37;
  int8x8_t v38;
  uint8x8_t v40[16];
  uint8x8_t v41[16];
  uint8x8_t v42[16];
  uint8x8_t v43[18];

  v9 = 0;
  v43[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(int *)(a2 + 16);
  v11 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v12 = vdupq_n_s16(*(char *)(a2 + 73));
  v13 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v14 = *(uint8x8_t **)(a1 + 8 * v9);
    v15 = 20;
    v16 = (int8x8_t *)&v40[16 * v9];
    do
    {
      v17 = *v14;
      v18 = (uint8x8_t *)((char *)v14 + v10);
      v19 = *v18;
      v20 = (uint8x8_t *)((char *)v18 + v10);
      v21 = *v20;
      v22 = (uint8x8_t *)((char *)v20 + v10);
      v23 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v22, v13), v11), v12));
      *v16 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v13), v11), v12));
      v16[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v13), v11), v12));
      v16[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v13), v11), v12));
      v16[3] = v23;
      v16 += 4;
      v15 -= 4;
      v14 = (uint8x8_t *)((char *)v22 + v10);
    }
    while (v15 > 4);
    ++v9;
  }
  while (v9 != 4);
  sub_1B69102C4(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3);
  v24 = 0;
  v25.i8[0] = *(_BYTE *)(a2 + 72);
  v26 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  v27 = vdupq_n_s16(*(char *)(a2 + 73));
  v28 = (uint8x8_t)vdup_lane_s8(v25, 0);
  do
  {
    v29 = (int8x8_t *)&v40[16 * v24];
    v30 = *(uint8x8_t **)(a1 + 8 * v24 + 32);
    for (i = 20; i > 4; i -= 4)
    {
      v32 = *v30;
      v33 = (uint8x8_t *)((char *)v30 + v10);
      v34 = *v33;
      v35 = (uint8x8_t *)((char *)v33 + v10);
      v36 = *v35;
      v37 = (uint8x8_t *)((char *)v35 + v10);
      v38 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v37, v28), v26), v27));
      *v29 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v32, v28), v26), v27));
      v29[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v34, v28), v26), v27));
      v29[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v28), v26), v27));
      v29[3] = v38;
      v29 += 4;
      v30 = (uint8x8_t *)((char *)v37 + v10);
    }
    ++v24;
  }
  while (v24 != 4);
  return sub_1B69102C4(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3 + 1);
}

int16x4_t sub_1B690AFA4(uint64_t a1, uint64_t a2, int16x4_t *a3, double a4, double a5, int8x8_t a6)
{
  uint64_t v9;
  uint64_t v10;
  int16x8_t v11;
  int16x8_t v12;
  uint8x8_t v13;
  uint8x8_t *v14;
  unsigned int v15;
  int8x8_t *v16;
  uint8x8_t v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  uint8x8_t v21;
  uint8x8_t *v22;
  int8x8_t v23;
  uint64_t v24;
  int8x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  uint8x8_t v28;
  int8x8_t *v29;
  uint8x8_t *v30;
  unsigned int i;
  uint8x8_t v32;
  uint8x8_t *v33;
  uint8x8_t v34;
  uint8x8_t *v35;
  uint8x8_t v36;
  uint8x8_t *v37;
  int8x8_t v38;
  uint8x8_t v40[8];
  uint8x8_t v41[8];
  uint8x8_t v42[8];
  uint8x8_t v43[10];

  v9 = 0;
  v43[9] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v10 = *(int *)(a2 + 16);
  v11 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  a6.i8[0] = *(_BYTE *)(a2 + 72);
  v12 = vdupq_n_s16(*(char *)(a2 + 73));
  v13 = (uint8x8_t)vdup_lane_s8(a6, 0);
  do
  {
    v14 = *(uint8x8_t **)(a1 + 8 * v9);
    v15 = 12;
    v16 = (int8x8_t *)&v40[8 * v9];
    do
    {
      v17 = *v14;
      v18 = (uint8x8_t *)((char *)v14 + v10);
      v19 = *v18;
      v20 = (uint8x8_t *)((char *)v18 + v10);
      v21 = *v20;
      v22 = (uint8x8_t *)((char *)v20 + v10);
      v23 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v22, v13), v11), v12));
      *v16 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v17, v13), v11), v12));
      v16[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v19, v13), v11), v12));
      v16[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v21, v13), v11), v12));
      v16[3] = v23;
      v16 += 4;
      v15 -= 4;
      v14 = (uint8x8_t *)((char *)v22 + v10);
    }
    while (v15 > 4);
    ++v9;
  }
  while (v9 != 4);
  sub_1B69103E0(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3);
  v24 = 0;
  v25.i8[0] = *(_BYTE *)(a2 + 72);
  v26 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
  v27 = vdupq_n_s16(*(char *)(a2 + 73));
  v28 = (uint8x8_t)vdup_lane_s8(v25, 0);
  do
  {
    v29 = (int8x8_t *)&v40[8 * v24];
    v30 = *(uint8x8_t **)(a1 + 8 * v24 + 32);
    for (i = 12; i > 4; i -= 4)
    {
      v32 = *v30;
      v33 = (uint8x8_t *)((char *)v30 + v10);
      v34 = *v33;
      v35 = (uint8x8_t *)((char *)v33 + v10);
      v36 = *v35;
      v37 = (uint8x8_t *)((char *)v35 + v10);
      v38 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v37, v28), v26), v27));
      *v29 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v32, v28), v26), v27));
      v29[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v34, v28), v26), v27));
      v29[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v36, v28), v26), v27));
      v29[3] = v38;
      v29 += 4;
      v30 = (uint8x8_t *)((char *)v37 + v10);
    }
    ++v24;
  }
  while (v24 != 4);
  return sub_1B69103E0(*(uint8x8_t **)(a2 + 56), v40, v41, v42, v43, 8, a3 + 1);
}

uint64_t sub_1B690B1D8(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v5;
  int v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t result;
  uint64_t v11;
  uint8x16_t *v12;
  int8x16_t v13[16];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(uint8x8_t **)(a2 + 56);
  v6 = *(_DWORD *)(a2 + 16);
  v11 = 0;
  v12 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v12, &v11))
    sub_1B690DEF8(v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  else
    sub_1B690DE78(v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  result = sub_1B690E49C(v5, 16, (uint8x8_t *)v13, 16, 16);
  *a3 = result;
  return result;
}

uint64_t sub_1B690B2B4(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v5;
  int v6;
  double v7;
  double v8;
  int8x8_t v9;
  uint64_t result;
  uint64_t v11;
  uint8x16_t *v12;
  int8x16_t v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(uint8x8_t **)(a2 + 56);
  v6 = *(_DWORD *)(a2 + 16);
  v11 = 0;
  v12 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v12, &v11))
    sub_1B690E094(v13, (uint64_t)v12, v11, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  else
    sub_1B690E014(v13, v12, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v7, v8, v9);
  result = sub_1B690E49C(v5, 16, (uint8x8_t *)v13, 16, 8);
  *a3 = result;
  return result;
}

uint64_t sub_1B690B388(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  int8x8_t v10;
  uint8x8_t *v11;
  int16x8_t v12;
  int16x8_t v13;
  int8x8_t *v14;
  unsigned int v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  int8x8_t v20;
  int8x8_t v21;
  uint64_t result;
  uint64_t v23;
  uint8x8_t *v24;
  uint8x8_t v25[18];

  v25[17] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v5 = *(uint8x8_t **)(a2 + 56);
  v6 = *(int *)(a2 + 16);
  v23 = 0;
  v24 = 0;
  v7 = sub_1B68FEA1C(a1, (_DWORD *)a2, &v24, &v23);
  v11 = v24;
  if (v7)
  {
    sub_1B690E1D0((int8x8_t *)v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(_BYTE *)(a2 + 72);
    v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v13 = vdupq_n_s16(*(char *)(a2 + 73));
    v14 = (int8x8_t *)v25;
    v15 = 20;
    v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v6);
      v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  result = sub_1B690E624(v5, 16, v25, 8, 16);
  *a3 = result;
  return result;
}

uint64_t sub_1B690B4E0(unsigned int a1, uint64_t a2, _WORD *a3)
{
  uint8x8_t *v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  int8x8_t v10;
  uint8x8_t *v11;
  int16x8_t v12;
  int16x8_t v13;
  int8x8_t *v14;
  unsigned int v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t v18;
  uint8x8_t *v19;
  int8x8_t v20;
  int8x8_t v21;
  uint64_t result;
  uint64_t v23;
  uint8x8_t *v24;
  uint8x8_t v25[10];

  v25[9] = *(uint8x8_t *)MEMORY[0x1E0C80C00];
  v5 = *(uint8x8_t **)(a2 + 56);
  v6 = *(int *)(a2 + 16);
  v23 = 0;
  v24 = 0;
  v7 = sub_1B68FEA1C(a1, (_DWORD *)a2, &v24, &v23);
  v11 = v24;
  if (v7)
  {
    sub_1B690E340((int8x8_t *)v25, (uint64_t)v24, v23, v6, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v8, v9, v10);
  }
  else
  {
    v10.i8[0] = *(_BYTE *)(a2 + 72);
    v12 = vdupq_n_s16(-*(unsigned __int8 *)(a2 + 74));
    v13 = vdupq_n_s16(*(char *)(a2 + 73));
    v14 = (int8x8_t *)v25;
    v15 = 12;
    v16 = (uint8x8_t)vdup_lane_s8(v10, 0);
    do
    {
      v17 = (uint8x8_t *)((char *)v11 + v6 + v6);
      v18 = *v17;
      v19 = (uint8x8_t *)((char *)v17 + v6);
      v20 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)v11 + v6), v16), v12), v13));
      v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v19, v16), v12), v13));
      *v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*v11, v16), v12), v13));
      v14[1] = v20;
      v14[2] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(v18, v16), v12), v13));
      v14[3] = v21;
      v14 += 4;
      v15 -= 4;
      v11 = (uint8x8_t *)((char *)v19 + v6);
    }
    while (v15 > 4);
  }
  result = sub_1B690E624(v5, 16, v25, 8, 8);
  *a3 = result;
  return result;
}

int16x8_t sub_1B690B638(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2;
  int16x8_t v3;
  int16x8_t v4;
  int16x8_t v5;
  int16x8_t v6;
  int32x4_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
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
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int64x2_t v68;
  int64x2_t v69;
  int64x2_t v70;
  int64x2_t v71;
  int64x2_t v72;
  int64x2_t v73;
  int64x2_t v74;
  int64x2_t v75;
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
  int16x8_t result;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = (int32x4_t)vtrn1q_s16(*a1, v2);
  v8 = a1[6];
  v9 = a1[7];
  v10 = (int32x4_t)vtrn2q_s16(*a1, v2);
  v11 = (int32x4_t)vtrn1q_s16(v3, v4);
  v12 = (int32x4_t)vtrn2q_s16(v3, v4);
  v13 = (int32x4_t)vtrn1q_s16(v5, v6);
  v14 = (int32x4_t)vtrn2q_s16(v5, v6);
  v15 = (int32x4_t)vtrn1q_s16(v8, v9);
  v16 = (int32x4_t)vtrn2q_s16(v8, v9);
  v17 = (int64x2_t)vtrn1q_s32(v7, v11);
  v18 = (int64x2_t)vtrn2q_s32(v7, v11);
  v19 = (int64x2_t)vtrn1q_s32(v10, v12);
  v20 = (int64x2_t)vtrn2q_s32(v10, v12);
  v21 = (int64x2_t)vtrn1q_s32(v13, v15);
  v22 = (int64x2_t)vtrn2q_s32(v13, v15);
  v23 = (int64x2_t)vtrn1q_s32(v14, v16);
  v24 = (int64x2_t)vtrn2q_s32(v14, v16);
  v25 = (int16x8_t)vzip1q_s64(v17, v21);
  v26 = (int16x8_t)vzip1q_s64(v19, v23);
  v27 = (int16x8_t)vzip1q_s64(v18, v22);
  v28 = (int16x8_t)vzip1q_s64(v20, v24);
  v29 = (int16x8_t)vzip2q_s64(v17, v21);
  v30 = (int16x8_t)vzip2q_s64(v19, v23);
  v31 = (int16x8_t)vzip2q_s64(v18, v22);
  v32 = (int16x8_t)vzip2q_s64(v20, v24);
  v33 = vaddq_s16(v32, v25);
  v34 = vaddq_s16(v31, v26);
  v35 = vaddq_s16(v30, v27);
  v36 = vaddq_s16(v29, v28);
  v37 = vsubq_s16(v25, v32);
  v38 = vsubq_s16(v26, v31);
  v39 = vsubq_s16(v27, v30);
  v40 = vsubq_s16(v28, v29);
  v41 = vaddq_s16(v36, v33);
  v42 = vaddq_s16(v35, v34);
  v43 = vsubq_s16(v33, v36);
  v44 = vsubq_s16(v34, v35);
  v45 = vsraq_n_s16(vaddq_s16(vaddq_s16(v38, v37), v39), v37, 1uLL);
  v46 = vsubq_s16(v37, vsraq_n_s16(vaddq_s16(v40, v39), v39, 1uLL));
  v47 = vsubq_s16(vaddq_s16(v37, v40), vsraq_n_s16(v38, v38, 1uLL));
  v48 = vsraq_n_s16(vaddq_s16(vsubq_s16(v38, v39), v40), v40, 1uLL);
  v49 = vaddq_s16(v41, v42);
  v50 = vsubq_s16(v41, v42);
  v51 = vshrq_n_s16(v43, 1uLL);
  v52 = vsraq_n_s16(v43, v44, 1uLL);
  v53 = vsubq_s16(v51, v44);
  v54 = vshrq_n_s16(v46, 2uLL);
  v55 = vsraq_n_s16(v46, v47, 2uLL);
  v56 = vsubq_s16(v47, v54);
  v57 = vshrq_n_s16(v45, 2uLL);
  v58 = vsraq_n_s16(v45, v48, 2uLL);
  v59 = vsubq_s16(v57, v48);
  v60 = (int32x4_t)vtrn1q_s16(v49, v58);
  v61 = (int32x4_t)vtrn2q_s16(v49, v58);
  v62 = (int32x4_t)vtrn1q_s16(v52, v55);
  v63 = (int32x4_t)vtrn2q_s16(v52, v55);
  v64 = (int32x4_t)vtrn1q_s16(v50, v56);
  v65 = (int32x4_t)vtrn2q_s16(v50, v56);
  v66 = (int32x4_t)vtrn1q_s16(v53, v59);
  v67 = (int32x4_t)vtrn2q_s16(v53, v59);
  v68 = (int64x2_t)vtrn1q_s32(v60, v62);
  v69 = (int64x2_t)vtrn2q_s32(v60, v62);
  v70 = (int64x2_t)vtrn1q_s32(v61, v63);
  v71 = (int64x2_t)vtrn2q_s32(v61, v63);
  v72 = (int64x2_t)vtrn1q_s32(v64, v66);
  v73 = (int64x2_t)vtrn2q_s32(v64, v66);
  v74 = (int64x2_t)vtrn1q_s32(v65, v67);
  v75 = (int64x2_t)vtrn2q_s32(v65, v67);
  v76 = (int16x8_t)vzip1q_s64(v68, v72);
  v77 = (int16x8_t)vzip1q_s64(v70, v74);
  v78 = (int16x8_t)vzip1q_s64(v69, v73);
  v79 = (int16x8_t)vzip1q_s64(v71, v75);
  v80 = (int16x8_t)vzip2q_s64(v68, v72);
  v81 = (int16x8_t)vzip2q_s64(v70, v74);
  v82 = (int16x8_t)vzip2q_s64(v69, v73);
  v83 = (int16x8_t)vzip2q_s64(v71, v75);
  v84 = vaddq_s16(v83, v76);
  v85 = vaddq_s16(v82, v77);
  v86 = vaddq_s16(v81, v78);
  v87 = vaddq_s16(v80, v79);
  v88 = vsubq_s16(v76, v83);
  v89 = vsubq_s16(v77, v82);
  v90 = vsubq_s16(v78, v81);
  v91 = vsubq_s16(v79, v80);
  v92 = vaddq_s16(v87, v84);
  v93 = vaddq_s16(v86, v85);
  v94 = vsubq_s16(v84, v87);
  v95 = vsubq_s16(v85, v86);
  v96 = vsraq_n_s16(vaddq_s16(vaddq_s16(v89, v88), v90), v88, 1uLL);
  v97 = vsubq_s16(v88, vsraq_n_s16(vaddq_s16(v91, v90), v90, 1uLL));
  v98 = vsubq_s16(vaddq_s16(v88, v91), vsraq_n_s16(v89, v89, 1uLL));
  v99 = vsraq_n_s16(vaddq_s16(vsubq_s16(v89, v90), v91), v91, 1uLL);
  *a2 = vaddq_s16(v92, v93);
  a2[1] = vsraq_n_s16(v96, v99, 2uLL);
  a2[2] = vsraq_n_s16(v94, v95, 1uLL);
  a2[3] = vsraq_n_s16(v97, v98, 2uLL);
  a2[4] = vsubq_s16(v92, v93);
  a2[5] = vsubq_s16(v98, vshrq_n_s16(v97, 2uLL));
  result = vsubq_s16(vshrq_n_s16(v96, 2uLL), v99);
  a2[6] = vsubq_s16(vshrq_n_s16(v94, 1uLL), v95);
  a2[7] = result;
  return result;
}

int16x8_t sub_1B690B834(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2;
  int16x8_t v3;
  int16x8_t v4;
  int16x8_t v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
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
  int32x4_t v59;
  int32x4_t v60;
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int64x2_t v67;
  int64x2_t v68;
  int64x2_t v69;
  int64x2_t v70;
  int64x2_t v71;
  int64x2_t v72;
  int64x2_t v73;
  int64x2_t v74;
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
  int16x8_t result;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = (int32x4_t)vtrn1q_s16(*a1, v2);
  v10 = (int32x4_t)vtrn2q_s16(*a1, v2);
  v11 = (int32x4_t)vtrn1q_s16(v3, v4);
  v12 = (int32x4_t)vtrn2q_s16(v3, v4);
  v13 = (int32x4_t)vtrn1q_s16(v5, v6);
  v14 = (int32x4_t)vtrn2q_s16(v5, v6);
  v15 = (int32x4_t)vtrn1q_s16(v7, v8);
  v16 = (int32x4_t)vtrn2q_s16(v7, v8);
  v17 = (int64x2_t)vtrn1q_s32(v9, v11);
  v18 = (int64x2_t)vtrn2q_s32(v9, v11);
  v19 = (int64x2_t)vtrn1q_s32(v10, v12);
  v20 = (int64x2_t)vtrn2q_s32(v10, v12);
  v21 = (int64x2_t)vtrn1q_s32(v13, v15);
  v22 = (int64x2_t)vtrn2q_s32(v13, v15);
  v23 = (int64x2_t)vtrn1q_s32(v14, v16);
  v24 = (int64x2_t)vtrn2q_s32(v14, v16);
  v25 = (int16x8_t)vzip1q_s64(v17, v21);
  v26 = (int16x8_t)vzip1q_s64(v19, v23);
  v27 = (int16x8_t)vzip1q_s64(v18, v22);
  v28 = (int16x8_t)vzip1q_s64(v20, v24);
  v29 = (int16x8_t)vzip2q_s64(v17, v21);
  v30 = (int16x8_t)vzip2q_s64(v19, v23);
  v31 = (int16x8_t)vzip2q_s64(v18, v22);
  v32 = (int16x8_t)vzip2q_s64(v20, v24);
  v33 = vaddq_s16(v29, v25);
  v34 = vsubq_s16(v25, v29);
  v35 = vsubq_s16(vshrq_n_s16(v27, 1uLL), v31);
  v36 = vsraq_n_s16(v27, v31, 1uLL);
  v37 = vsubq_s16(v30, vsraq_n_s16(vaddq_s16(v28, v32), v32, 1uLL));
  v38 = vsubq_s16(vaddq_s16(v32, v26), vsraq_n_s16(v28, v28, 1uLL));
  v39 = vaddq_s16(vsraq_n_s16(v30, v30, 1uLL), vsubq_s16(v32, v26));
  v40 = vsraq_n_s16(vaddq_s16(vaddq_s16(v28, v30), v26), v26, 1uLL);
  v41 = vaddq_s16(v36, v33);
  v42 = vsubq_s16(v33, v36);
  v43 = vaddq_s16(v35, v34);
  v44 = vsubq_s16(v34, v35);
  v45 = vshrq_n_s16(v37, 2uLL);
  v46 = vsraq_n_s16(v37, v40, 2uLL);
  v47 = vsubq_s16(v40, v45);
  v48 = vshrq_n_s16(v38, 2uLL);
  v49 = vsraq_n_s16(v38, v39, 2uLL);
  v50 = vsubq_s16(v48, v39);
  v51 = vaddq_s16(v47, v41);
  v52 = vaddq_s16(v50, v43);
  v53 = vaddq_s16(v49, v44);
  v54 = vaddq_s16(v46, v42);
  v55 = vsubq_s16(v42, v46);
  v56 = vsubq_s16(v44, v49);
  v57 = vsubq_s16(v43, v50);
  v58 = vsubq_s16(v41, v47);
  v59 = (int32x4_t)vtrn1q_s16(v51, v52);
  v60 = (int32x4_t)vtrn2q_s16(v51, v52);
  v61 = (int32x4_t)vtrn1q_s16(v53, v54);
  v62 = (int32x4_t)vtrn2q_s16(v53, v54);
  v63 = (int32x4_t)vtrn1q_s16(v55, v56);
  v64 = (int32x4_t)vtrn2q_s16(v55, v56);
  v65 = (int32x4_t)vtrn1q_s16(v57, v58);
  v66 = (int32x4_t)vtrn2q_s16(v57, v58);
  v67 = (int64x2_t)vtrn1q_s32(v59, v61);
  v68 = (int64x2_t)vtrn2q_s32(v59, v61);
  v69 = (int64x2_t)vtrn1q_s32(v60, v62);
  v70 = (int64x2_t)vtrn2q_s32(v60, v62);
  v71 = (int64x2_t)vtrn1q_s32(v63, v65);
  v72 = (int64x2_t)vtrn2q_s32(v63, v65);
  v73 = (int64x2_t)vtrn1q_s32(v64, v66);
  v74 = (int64x2_t)vtrn2q_s32(v64, v66);
  v75 = (int16x8_t)vzip1q_s64(v67, v71);
  v76 = (int16x8_t)vzip1q_s64(v69, v73);
  v77 = (int16x8_t)vzip1q_s64(v68, v72);
  v78 = (int16x8_t)vzip1q_s64(v70, v74);
  v79 = (int16x8_t)vzip2q_s64(v67, v71);
  v80 = (int16x8_t)vzip2q_s64(v69, v73);
  v81 = (int16x8_t)vzip2q_s64(v68, v72);
  v82 = (int16x8_t)vzip2q_s64(v70, v74);
  v83 = vaddq_s16(v79, v75);
  v84 = vsubq_s16(v75, v79);
  v85 = vsubq_s16(vshrq_n_s16(v77, 1uLL), v81);
  v86 = vsraq_n_s16(v77, v81, 1uLL);
  v87 = vsubq_s16(v80, vsraq_n_s16(vaddq_s16(v78, v82), v82, 1uLL));
  v88 = vsubq_s16(vaddq_s16(v82, v76), vsraq_n_s16(v78, v78, 1uLL));
  v89 = vaddq_s16(vsraq_n_s16(v80, v80, 1uLL), vsubq_s16(v82, v76));
  v90 = vsraq_n_s16(vaddq_s16(vaddq_s16(v78, v80), v76), v76, 1uLL);
  v91 = vaddq_s16(v86, v83);
  v92 = vsubq_s16(v83, v86);
  v93 = vaddq_s16(v85, v84);
  v94 = vsubq_s16(v84, v85);
  v95 = vshrq_n_s16(v87, 2uLL);
  v96 = vsraq_n_s16(v87, v90, 2uLL);
  v97 = vsubq_s16(v90, v95);
  v98 = vshrq_n_s16(v88, 2uLL);
  v99 = vsraq_n_s16(v88, v89, 2uLL);
  v100 = vsubq_s16(v98, v89);
  v101 = vaddq_s16(v100, v93);
  result = vrshrq_n_s16(vsubq_s16(v93, v100), 6uLL);
  *a2 = vrshrq_n_s16(vaddq_s16(v97, v91), 6uLL);
  a2[1] = vrshrq_n_s16(v101, 6uLL);
  a2[2] = vrshrq_n_s16(vaddq_s16(v99, v94), 6uLL);
  a2[3] = vrshrq_n_s16(vaddq_s16(v96, v92), 6uLL);
  a2[4] = vrshrq_n_s16(vsubq_s16(v92, v96), 6uLL);
  a2[5] = vrshrq_n_s16(vsubq_s16(v94, v99), 6uLL);
  a2[6] = result;
  a2[7] = vrshrq_n_s16(vsubq_s16(v91, v97), 6uLL);
  return result;
}

int8x16_t *sub_1B690BA50(int8x16_t *result, uint8x8_t *a2, int16x8_t *a3, int a4, int a5)
{
  int v5;
  uint8x16_t v6;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t v10;
  uint8x16_t v11;
  uint8x16_t v12;
  int16x8_t v13;
  int16x8_t v14;

  v5 = a5 + 16;
  v6.i64[0] = 0x1414141414141414;
  v6.i64[1] = 0x1414141414141414;
  v7.i64[0] = 0x505050505050505;
  v7.i64[1] = 0x505050505050505;
  do
  {
    v8 = *(uint8x16_t *)&a2->i8[-2 * a4];
    v9 = *(uint8x16_t *)&a2->i8[-a4];
    v10 = *(uint8x16_t *)&a2->i8[a4];
    v11 = *(uint8x16_t *)&a2->i8[3 * a4];
    v12 = *(uint8x16_t *)&a2->i8[2 * a4];
    v13 = (int16x8_t)vmlsl_u8(vmlsl_u8(vmlal_u8(vaddw_u8(vaddw_u8(vmull_u8(*a2, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v8.i8), *(uint8x8_t *)v11.i8), *(uint8x8_t *)v10.i8, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v9.i8, (uint8x8_t)0x505050505050505), *(uint8x8_t *)v12.i8, (uint8x8_t)0x505050505050505);
    v14 = (int16x8_t)vmlsl_high_u8(vmlsl_high_u8(vmlal_high_u8(vmlal_high_u8(vaddl_high_u8(v11, v8), *(uint8x16_t *)a2->i8, v6), v10, v6), v9, v7), v12, v7);
    *result++ = vqrshrun_high_n_s16(vqrshrun_n_s16(v13, 5uLL), v14, 5uLL);
    *a3 = v13;
    a3[1] = v14;
    a3 += 2;
    a2 += 2;
    v5 -= 16;
  }
  while (v5 > 16);
  return result;
}

int8x16_t *sub_1B690BAE4(int8x16_t *result, int8x16_t *a2, int a3)
{
  int8x16_t v3;
  int8x16_t v4;
  int v5;
  int8x16_t *v6;
  uint8x16_t v7;
  uint8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint8x16_t v11;
  uint8x16_t v12;
  uint8x16_t v13;
  uint8x16_t v14;
  uint8x16_t v15;

  v4 = a2[-1];
  v3 = *a2;
  v5 = a3 + 16;
  v6 = a2 + 1;
  v7.i64[0] = 0x1414141414141414;
  v7.i64[1] = 0x1414141414141414;
  v8.i64[0] = 0x505050505050505;
  v8.i64[1] = 0x505050505050505;
  do
  {
    v9 = v3;
    v10 = *v6++;
    v3 = v10;
    v11 = (uint8x16_t)vextq_s8(v4, v9, 0xEuLL);
    v12 = (uint8x16_t)vextq_s8(v4, v9, 0xFuLL);
    v13 = (uint8x16_t)vextq_s8(v9, v10, 1uLL);
    v14 = (uint8x16_t)vextq_s8(v9, v10, 2uLL);
    v15 = (uint8x16_t)vextq_s8(v9, v10, 3uLL);
    *result++ = vqrshrun_high_n_s16(vqrshrun_n_s16((int16x8_t)vmlsl_u8(vmlsl_u8(vaddw_u8(vmlal_u8(vaddw_u8(vmull_u8(*(uint8x8_t *)v9.i8, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v11.i8), *(uint8x8_t *)v13.i8, (uint8x8_t)0x1414141414141414), *(uint8x8_t *)v15.i8), *(uint8x8_t *)v12.i8, (uint8x8_t)0x505050505050505), *(uint8x8_t *)v14.i8, (uint8x8_t)0x505050505050505), 5uLL), (int16x8_t)vmlsl_high_u8(vmlsl_high_u8(vmlal_high_u8(vmlal_high_u8(vaddl_high_u8(v15, v11), (uint8x16_t)v9, v7), v13, v7),
                                 v12,
                                 v8),
                               v14,
                               v8),
                  5uLL);
    v5 -= 16;
    v4 = v9;
  }
  while (v5 > 16);
  return result;
}

__n128 sub_1B690BB68(int8x16_t *a1, __n128 *a2, int a3)
{
  __n128 result;
  int8x16_t v4;
  int v5;
  int8x16_t *v6;
  int16x8_t v7;
  int16x8_t v8;
  __n128 v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;

  v4 = (int8x16_t)a2[-1];
  result = *a2;
  v5 = a3 + 16;
  v6 = (int8x16_t *)&a2[2];
  do
  {
    v7 = (int16x8_t)vextq_s8(v4, (int8x16_t)result, 0xCuLL);
    v8 = (int16x8_t)v6[-1];
    v9 = *(__n128 *)v6;
    v10 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 2uLL), (int16x8_t)result);
    v11 = (int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 0xCuLL);
    v12 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 4uLL), (int16x8_t)vextq_s8(v4, (int8x16_t)result, 0xEuLL));
    *(int8x8_t *)v12.i8 = vqrshrun_n_s16(vsraq_n_s16(v10, vsraq_n_s16(vsubq_s16(v10, v12), vsubq_s16(vaddq_s16((int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 6uLL), v7), v12), 2uLL), 2uLL), 6uLL);
    v13 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)v8, *v6, 4uLL), (int16x8_t)vextq_s8((int8x16_t)result, (int8x16_t)v8, 0xEuLL));
    v14 = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)v8, *v6, 2uLL), v8);
    *a1++ = vqrshrun_high_n_s16(*(int8x8_t *)v12.i8, vsraq_n_s16(v14, vsraq_n_s16(vsubq_s16(v14, v13), vsubq_s16(vaddq_s16((int16x8_t)vextq_s8((int8x16_t)v8, *v6, 6uLL), v11), v13), 2uLL), 2uLL), 6uLL);
    v5 -= 16;
    v6 += 2;
    result = v9;
    v4 = (int8x16_t)v8;
  }
  while (v5 > 16);
  return result;
}

const char *sub_1B690BC00(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  const char *v11;
  const char *v12;
  const char *v13;
  int8x16_t v14;
  const char *v15;
  int8x16_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int8x16_t *v21;
  const char *v22;
  int8x16_t v23;
  int8x16_t *v24;
  const char *v25;
  int8x16_t v26;

  v6 = (32 * a2);
  v7 = (const char *)(a1 + v6 + 32);
  v8 = 16 * a3;
  v9 = 16 * a4;
  sub_1B690BCF0(v7, -a2, 16 * a3);
  if (v9 >= 1)
  {
    v10 = 0;
    v11 = v7;
    do
    {
      v12 = v11;
      v14 = vld1q_dup_s8(v12);
      v13 = &v12[a2];
      *((int8x16_t *)v11 - 2) = v14;
      *((int8x16_t *)v11 - 1) = v14;
      v15 = v13;
      v16 = vld1q_dup_s8(v15);
      v11 = &v15[a2];
      *((int8x16_t *)v13 - 2) = v16;
      *((int8x16_t *)v13 - 1) = v16;
      v10 += 2;
    }
    while (v10 < v9);
    v17 = 0;
    v18 = a1 + a2 + (uint64_t)v8;
    v19 = 2 * a2;
    v20 = a1 + v8;
    do
    {
      v21 = (int8x16_t *)(v20 + v6);
      v22 = (const char *)(v20 + v6 + 31);
      v23 = vld1q_dup_s8(v22);
      v21[2] = v23;
      v21[3] = v23;
      v24 = (int8x16_t *)(v18 + v6);
      v25 = (const char *)(v18 + v6 + 31);
      v26 = vld1q_dup_s8(v25);
      v24[2] = v26;
      v24[3] = v26;
      v17 += 2;
      v18 += v19;
      v20 += v19;
    }
    while (v17 < v9);
  }
  return sub_1B690BCF0(&v7[(v9 - 1) * a2], a2, v8);
}

const char *sub_1B690BCF0(const char *result, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int8x16_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  int8x16_t *v21;
  int8x16_t *v28;
  int8x16_t *v29;
  int8x16_t *v30;
  uint64_t v31;
  int v32;
  _OWORD *v33;
  __int128 v34;
  __int128 v35;
  unsigned int v36;
  _OWORD *v37;
  _OWORD *v40;
  _OWORD *v47;
  _OWORD *v48;
  _OWORD *v49;
  const char *v50;
  const char *v51;
  int8x16_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int8x16_t *v60;
  int8x16_t *v67;
  int8x16_t *v68;
  int8x16_t *v69;

  v3 = a2;
  v4 = 4 * a2;
  v5 = vld1q_dup_s8(result);
  v6 = 5 * a2;
  v7 = 6 * a2;
  v8 = 7 * a2;
  v9 = 2 * a2;
  v10 = 3 * a2;
  v11 = a2 - 32;
  v12 = 2 * a2 - 32;
  v13 = -4;
  v14 = result;
  do
  {
    _X20 = &v14[v11 + v4];
    __asm { PRFM            #0x10, [X20] }
    v21 = (int8x16_t *)&v14[v11];
    _X21 = &v14[v11 + v6];
    __asm { PRFM            #0x10, [X21] }
    _X21 = &v14[v11 + v7];
    __asm { PRFM            #0x10, [X21] }
    _X21 = &v14[v11 + v8];
    __asm { PRFM            #0x10, [X21] }
    *v21 = v5;
    v21[1] = v5;
    v28 = (int8x16_t *)&v14[v12];
    *v28 = v5;
    v28[1] = v5;
    v29 = (int8x16_t *)&v14[v11 + v9];
    *v29 = v5;
    v29[1] = v5;
    v30 = (int8x16_t *)&v14[v11 + v10];
    v13 += 4;
    v14 += v4;
    *v30 = v5;
    v30[1] = v5;
  }
  while (v13 < 0x1C);
  v31 = 2 * v3;
  if (a3 >= 1)
  {
    v32 = 0;
    v33 = result;
    do
    {
      v34 = *v33;
      v35 = v33[1];
      v36 = -4;
      v37 = v33;
      do
      {
        _X21 = (char *)v37 + v3 + v4;
        __asm { PRFM            #0x10, [X21] }
        v40 = (_OWORD *)((char *)v37 + v3);
        _X22 = (char *)v37 + v3 + v6;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v7;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v8;
        __asm { PRFM            #0x10, [X22] }
        *v40 = v34;
        v40[1] = v35;
        v47 = (_OWORD *)((char *)v37 + v31);
        *v47 = v34;
        v47[1] = v35;
        v48 = (_OWORD *)((char *)v37 + v3 + v9);
        *v48 = v34;
        v48[1] = v35;
        v49 = (_OWORD *)((char *)v37 + v3 + v10);
        v36 += 4;
        v37 = (_OWORD *)((char *)v37 + v4);
        *v49 = v34;
        v49[1] = v35;
      }
      while (v36 < 0x1C);
      v33 += 2;
      v32 += 32;
    }
    while (v32 < a3);
  }
  v50 = &result[a3];
  v51 = v50 - 1;
  v52 = vld1q_dup_s8(v51);
  v53 = v3 + v10;
  v54 = v3 + v9;
  v55 = v3 + v6;
  v56 = v3 + v7;
  v57 = v3 + v8;
  LODWORD(result) = -4;
  do
  {
    _X1 = &v50[v3 + v4];
    __asm { PRFM            #0x10, [X1] }
    v60 = (int8x16_t *)&v50[v3];
    _X2 = &v50[v55];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v56];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v57];
    __asm { PRFM            #0x10, [X2] }
    *v60 = v52;
    v60[1] = v52;
    v67 = (int8x16_t *)&v50[v31];
    *v67 = v52;
    v67[1] = v52;
    v68 = (int8x16_t *)&v50[v54];
    *v68 = v52;
    v68[1] = v52;
    v69 = (int8x16_t *)&v50[v53];
    result = (const char *)((_DWORD)result + 4);
    v50 += v4;
    *v69 = v52;
    v69[1] = v52;
  }
  while (result < 0x1C);
  return result;
}

const __int16 *sub_1B690BEC8(const __int16 *a1, int a2, int a3, int a4)
{
  int v8;
  const __int16 *v9;
  int16x8_t *v10;
  const __int16 *v11;
  const __int16 *v12;
  int16x8_t v13;
  const __int16 *v14;
  int16x8_t v15;
  int v16;
  const __int16 *v17;
  int16x8_t v18;
  int16x8_t *v19;
  const __int16 *v20;
  int16x8_t v21;

  sub_1B690BF88(a1, -a2, a3);
  if (a4 >= 1)
  {
    v8 = 0;
    v9 = a1;
    v10 = (int16x8_t *)((char *)a1 + a3);
    do
    {
      v11 = v9;
      v13 = vld1q_dup_s16(v11);
      v12 = (const __int16 *)((char *)v11 + a2);
      *((int16x8_t *)v9 - 2) = v13;
      *((int16x8_t *)v9 - 1) = v13;
      v14 = v12;
      v15 = vld1q_dup_s16(v14);
      v9 = (const __int16 *)((char *)v14 + a2);
      *((int16x8_t *)v12 - 2) = v15;
      *((int16x8_t *)v12 - 1) = v15;
      v8 += 2;
    }
    while (v8 < a4);
    v16 = 0;
    do
    {
      v17 = &v10[-1].i16[7];
      v18 = vld1q_dup_s16(v17);
      *v10 = v18;
      v10[1] = v18;
      v19 = (int16x8_t *)((char *)v10 + a2);
      v20 = &v19[-1].i16[7];
      v21 = vld1q_dup_s16(v20);
      *v19 = v21;
      v19[1] = v21;
      v10 = (int16x8_t *)((char *)v19 + a2);
      v16 += 2;
    }
    while (v16 < a4);
  }
  return sub_1B690BF88((const __int16 *)((char *)a1 + (a4 - 1) * a2), a2, a3);
}

const __int16 *sub_1B690BF88(const __int16 *result, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int16x8_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  const __int16 *v14;
  int16x8_t *v21;
  int16x8_t *v28;
  int16x8_t *v29;
  int16x8_t *v30;
  uint64_t v31;
  int v32;
  _OWORD *v33;
  __int128 v34;
  __int128 v35;
  unsigned int v36;
  _OWORD *v37;
  _OWORD *v40;
  _OWORD *v47;
  _OWORD *v48;
  _OWORD *v49;
  char *v50;
  const __int16 *v51;
  int16x8_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int16x8_t *v60;
  int16x8_t *v67;
  int16x8_t *v68;
  int16x8_t *v69;

  v3 = a2;
  v4 = 4 * a2;
  v5 = vld1q_dup_s16(result);
  v6 = 5 * a2;
  v7 = 6 * a2;
  v8 = 7 * a2;
  v9 = 2 * a2;
  v10 = 3 * a2;
  v11 = a2 - 32;
  v12 = 2 * a2 - 32;
  v13 = -4;
  v14 = result;
  do
  {
    _X20 = (char *)v14 + v11 + v4;
    __asm { PRFM            #0x10, [X20] }
    v21 = (int16x8_t *)((char *)v14 + v11);
    _X21 = (char *)v14 + v11 + v6;
    __asm { PRFM            #0x10, [X21] }
    _X21 = (char *)v14 + v11 + v7;
    __asm { PRFM            #0x10, [X21] }
    _X21 = (char *)v14 + v11 + v8;
    __asm { PRFM            #0x10, [X21] }
    *v21 = v5;
    v21[1] = v5;
    v28 = (int16x8_t *)((char *)v14 + v12);
    *v28 = v5;
    v28[1] = v5;
    v29 = (int16x8_t *)((char *)v14 + v11 + v9);
    *v29 = v5;
    v29[1] = v5;
    v30 = (int16x8_t *)((char *)v14 + v11 + v10);
    v13 += 4;
    v14 = (const __int16 *)((char *)v14 + v4);
    *v30 = v5;
    v30[1] = v5;
  }
  while (v13 < 0xC);
  v31 = 2 * v3;
  if (a3 >= 1)
  {
    v32 = 0;
    v33 = result;
    do
    {
      v34 = *v33;
      v35 = v33[1];
      v36 = -4;
      v37 = v33;
      do
      {
        _X21 = (char *)v37 + v3 + v4;
        __asm { PRFM            #0x10, [X21] }
        v40 = (_OWORD *)((char *)v37 + v3);
        _X22 = (char *)v37 + v3 + v6;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v7;
        __asm { PRFM            #0x10, [X22] }
        _X22 = (char *)v37 + v3 + v8;
        __asm { PRFM            #0x10, [X22] }
        *v40 = v34;
        v40[1] = v35;
        v47 = (_OWORD *)((char *)v37 + v31);
        *v47 = v34;
        v47[1] = v35;
        v48 = (_OWORD *)((char *)v37 + v3 + v9);
        *v48 = v34;
        v48[1] = v35;
        v49 = (_OWORD *)((char *)v37 + v3 + v10);
        v36 += 4;
        v37 = (_OWORD *)((char *)v37 + v4);
        *v49 = v34;
        v49[1] = v35;
      }
      while (v36 < 0xC);
      v33 += 2;
      v32 += 32;
    }
    while (v32 < a3);
  }
  v50 = (char *)result + a3;
  v51 = (const __int16 *)(v50 - 2);
  v52 = vld1q_dup_s16(v51);
  v53 = v3 + v10;
  v54 = v3 + v9;
  v55 = v3 + v6;
  v56 = v3 + v7;
  v57 = v3 + v8;
  LODWORD(result) = -4;
  do
  {
    _X1 = &v50[v3 + v4];
    __asm { PRFM            #0x10, [X1] }
    v60 = (int16x8_t *)&v50[v3];
    _X2 = &v50[v55];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v56];
    __asm { PRFM            #0x10, [X2] }
    _X2 = &v50[v57];
    __asm { PRFM            #0x10, [X2] }
    *v60 = v52;
    v60[1] = v52;
    v67 = (int16x8_t *)&v50[v31];
    *v67 = v52;
    v67[1] = v52;
    v68 = (int16x8_t *)&v50[v54];
    *v68 = v52;
    v68[1] = v52;
    v69 = (int16x8_t *)&v50[v53];
    result = (const __int16 *)((_DWORD)result + 4);
    v50 += v4;
    *v69 = v52;
    v69[1] = v52;
  }
  while (result < 0xC);
  return result;
}

uint8x16_t sub_1B690C160(uint8x16_t *a1, int a2, unsigned int a3, unsigned int a4, unsigned int *a5)
{
  int8x8_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int8x16_t v10;
  int8x16_t v11;
  uint8x16_t v12;
  uint8x16_t *v13;
  uint8x16_t *v14;
  int8x16_t v15;
  uint8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  uint8x16_t v20;
  int8x16_t v21;
  uint8x16_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  uint8x16_t v26;
  uint8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  uint8x16_t v30;
  int8x16_t v31;
  uint8x16_t v32;
  int8x16_t v33;
  int8x16_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  uint8x16_t result;

  if (*a5 != -1)
  {
    v5 = (int8x8_t)vdup_n_s32(*a5);
    v6 = (int32x2_t)vtrn1_s8(v5, v5);
    v7 = (int32x2_t)vtrn2_s8(v5, v5);
    v8 = (int16x4_t)vzip1_s32(v6, v7);
    v9 = (int16x4_t)vzip2_s32(v6, v7);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v8, v9);
    v10.u64[1] = (unint64_t)vtrn2_s16(v8, v9);
    v11 = vdupq_n_s8(a4);
    v12 = *(uint8x16_t *)((char *)a1 - 3 * a2);
    v13 = (uint8x16_t *)((char *)a1 - 2 * a2);
    v14 = (uint8x16_t *)((char *)a1 - a2);
    v15 = *(int8x16_t *)((char *)a1 + a2);
    v16 = *(uint8x16_t *)((char *)a1 + 2 * a2);
    v17.i64[0] = -1;
    v17.i64[1] = -1;
    v18 = vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)vdupq_n_s8(a3), vabdq_u8(*v14, *a1)), (int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8(*v13, *v14))), (int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8((uint8x16_t)v15, *a1))), vcgtq_s8(v10, v17));
    v19.i64[0] = 0x101010101010101;
    v19.i64[1] = 0x101010101010101;
    v20 = (uint8x16_t)vandq_s8(v11, v18);
    v21 = vandq_s8(v10, v18);
    v22 = vrhaddq_u8(*v14, *a1);
    v23 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8(*v13, (uint8x16_t)v15), 1uLL), vandq_s8(veorq_s8(*(int8x16_t *)a1, *(int8x16_t *)v14), v19)), (int8x16_t)vhsubq_u8(*a1, *v14));
    v24 = (int8x16_t)vcgtq_u8(v20, vabdq_u8(v12, *v14));
    v25 = (int8x16_t)vcgtq_u8(v20, vabdq_u8(v16, *a1));
    v26 = vhaddq_u8(v12, v22);
    v27 = vhaddq_u8(v16, v22);
    v28 = vandq_s8((int8x16_t)vminq_u8(vabdq_u8(v26, *v13), (uint8x16_t)v21), v24);
    v29 = vandq_s8((int8x16_t)vminq_u8(vabdq_u8(v27, (uint8x16_t)v15), (uint8x16_t)v21), v25);
    v30 = (uint8x16_t)vsubq_s8(vsubq_s8(v21, v24), v25);
    v31 = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8(*v13, v26), vnegq_s8(v28), v28), *(int8x16_t *)v13);
    v32 = vminq_u8((uint8x16_t)vqabsq_s8(v23), v30);
    v33 = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v15, v27), vnegq_s8(v29), v29), v15);
    v34 = (int8x16_t)vqaddq_u8(*v14, v32);
    v35 = (int8x16_t)vqsubq_u8(*v14, v32);
    v36 = (int8x16_t)vqaddq_u8(*a1, v32);
    v37 = (int8x16_t)vqsubq_u8(*a1, v32);
    v38 = vcltzq_s8(v23);
    *v13 = (uint8x16_t)v31;
    *(int8x16_t *)v14 = vbslq_s8(v38, v35, v34);
    result = (uint8x16_t)vbslq_s8(v38, v36, v37);
    *a1 = result;
    *(int8x16_t *)((char *)a1 + a2) = v33;
  }
  return result;
}

int16x8_t sub_1B690C2A8(uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int *a5)
{
  int8x8_t v5;
  int32x2_t v6;
  int32x2_t v7;
  int16x4_t v8;
  int16x4_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  uint64_t v15;
  int8x16_t v16;
  uint64_t v17;
  uint64_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  uint64_t v23;
  uint64_t v24;
  int8x16_t v25;
  uint64_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int8x16_t v35;
  uint8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  uint8x16_t v40;
  int8x16_t v41;
  int8x16_t v42;
  int8x16_t v43;
  int8x16_t v44;
  uint8x16_t v45;
  uint8x16_t v46;
  int8x16_t v47;
  uint8x16_t v48;
  int8x16_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  uint64_t v57;
  int16x8_t v58;
  int16x8_t result;
  int8x16x2_t v60;
  int8x16x2_t v61;

  if (*a5 != -1)
  {
    v5 = (int8x8_t)vdup_n_s32(*a5);
    v6 = (int32x2_t)vtrn1_s8(v5, v5);
    v7 = (int32x2_t)vtrn2_s8(v5, v5);
    v8 = (int16x4_t)vzip1_s32(v6, v7);
    v9 = (int16x4_t)vzip2_s32(v6, v7);
    *(int16x4_t *)v10.i8 = vtrn1_s16(v8, v9);
    v10.u64[1] = (unint64_t)vtrn2_s16(v8, v9);
    v11 = vdupq_n_s8(a4);
    v12.i64[0] = *(_QWORD *)(a1 - 4);
    v12.i64[1] = *(_QWORD *)(a1 - 4 + 8 * a2);
    v13.i64[0] = *(_QWORD *)(a1 - 4 + a2);
    v14 = 9 * a2;
    v13.i64[1] = *(_QWORD *)(a1 - 4 + v14);
    v15 = 2 * a2;
    v16.i64[0] = *(_QWORD *)(a1 - 4 + v15);
    v17 = 5 * a2;
    v16.i64[1] = *(_QWORD *)(a1 - 4 + 10 * a2);
    v18 = 3 * a2;
    v19.i64[0] = *(_QWORD *)(a1 - 4 + v18);
    v19.i64[1] = *(_QWORD *)(a1 - 4 + 11 * a2);
    v20.i64[0] = *(_QWORD *)(a1 - 4 + 4 * a2);
    v20.i64[1] = *(_QWORD *)(a1 - 4 + 12 * a2);
    v21.i64[0] = *(_QWORD *)(a1 - 4 + v17);
    v21.i64[1] = *(_QWORD *)(a1 - 4 + 13 * a2);
    v22.i64[0] = *(_QWORD *)(a1 - 4 + 6 * a2);
    v23 = 14 * a2;
    v22.i64[1] = *(_QWORD *)(a1 - 4 + v23);
    v24 = 7 * a2;
    v25.i64[0] = *(_QWORD *)(a1 - 4 + v24);
    v26 = 15 * a2;
    v25.i64[1] = *(_QWORD *)(a1 - 4 + v26);
    v61.val[0] = vtrn1q_s8(v12, v13);
    v61.val[1] = vtrn1q_s8(v16, v19);
    v27 = (int16x8_t)vtrn2q_s8(v12, v13);
    v28 = (int16x8_t)vtrn2q_s8(v16, v19);
    v60.val[0] = vtrn1q_s8(v20, v21);
    v60.val[1] = vtrn1q_s8(v22, v25);
    v29 = (int16x8_t)vtrn2q_s8(v20, v21);
    v30 = (int16x8_t)vtrn2q_s8(v22, v25);
    v31 = (int32x4_t)vqtbl2q_s8(v61, (int8x16_t)xmmword_1B6918040);
    v61.val[0] = (int8x16_t)vtrn2q_s16((int16x8_t)v61.val[0], (int16x8_t)v61.val[1]);
    v61.val[1] = (int8x16_t)vtrn1q_s16(v27, v28);
    v32 = (int32x4_t)vtrn2q_s16(v27, v28);
    v33 = (int32x4_t)vqtbl2q_s8(v60, (int8x16_t)xmmword_1B6918040);
    v60.val[0] = (int8x16_t)vtrn2q_s16((int16x8_t)v60.val[0], (int16x8_t)v60.val[1]);
    v60.val[1] = (int8x16_t)vtrn1q_s16(v29, v30);
    v34 = (int32x4_t)vtrn2q_s16(v29, v30);
    v35 = (int8x16_t)vtrn2q_s32(v31, v33);
    v36 = (uint8x16_t)vtrn1q_s32((int32x4_t)v61.val[1], (int32x4_t)v60.val[1]);
    v60.val[1] = (int8x16_t)vtrn2q_s32((int32x4_t)v61.val[1], (int32x4_t)v60.val[1]);
    v37 = (int8x16_t)vtrn1q_s32((int32x4_t)v61.val[0], (int32x4_t)v60.val[0]);
    v60.val[0] = (int8x16_t)vtrn2q_s32((int32x4_t)v61.val[0], (int32x4_t)v60.val[0]);
    v38 = (int8x16_t)vtrn1q_s32(v32, v34);
    v61.val[1].i64[0] = -1;
    v61.val[1].i64[1] = -1;
    v39 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)vdupq_n_s8(a3), vabdq_u8((uint8x16_t)v38, (uint8x16_t)v35)), vcgtq_s8(v10, v61.val[1])), vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8((uint8x16_t)v37, (uint8x16_t)v38)), (int8x16_t)vcgtq_u8((uint8x16_t)v11, vabdq_u8((uint8x16_t)v60.val[1], (uint8x16_t)v35))));
    v31.i64[0] = 0x101010101010101;
    v31.i64[1] = 0x101010101010101;
    v40 = (uint8x16_t)vandq_s8(v11, v39);
    v41 = vandq_s8(v10, v39);
    v61.val[1] = (int8x16_t)vrhaddq_u8((uint8x16_t)v38, (uint8x16_t)v35);
    v42 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8((uint8x16_t)v37, (uint8x16_t)v60.val[1]), 1uLL), vandq_s8(veorq_s8(v35, v38), (int8x16_t)v31)), (int8x16_t)vhsubq_u8((uint8x16_t)v35, (uint8x16_t)v38));
    v43 = (int8x16_t)vcgtq_u8(v40, vabdq_u8(v36, (uint8x16_t)v38));
    v44 = (int8x16_t)vcgtq_u8(v40, vabdq_u8((uint8x16_t)v60.val[0], (uint8x16_t)v35));
    v45 = vhaddq_u8(v36, (uint8x16_t)v61.val[1]);
    v60.val[0] = (int8x16_t)vhaddq_u8((uint8x16_t)v60.val[0], (uint8x16_t)v61.val[1]);
    v61.val[0] = vandq_s8((int8x16_t)vminq_u8(vabdq_u8(v45, (uint8x16_t)v37), (uint8x16_t)v41), v43);
    v61.val[1] = vandq_s8((int8x16_t)vminq_u8(vabdq_u8((uint8x16_t)v60.val[0], (uint8x16_t)v60.val[1]), (uint8x16_t)v41), v44);
    v46 = (uint8x16_t)vsubq_s8(vsubq_s8(v41, v43), v44);
    v47 = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v37, v45), vnegq_s8(v61.val[0]), v61.val[0]), v37);
    v48 = vminq_u8((uint8x16_t)vqabsq_s8(v42), v46);
    v60.val[0] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v60.val[1], (uint8x16_t)v60.val[0]), vnegq_s8(v61.val[1]), v61.val[1]), v60.val[1]);
    v49 = vcltzq_s8(v42);
    v50 = vbslq_s8(v49, (int8x16_t)vqsubq_u8((uint8x16_t)v38, v48), (int8x16_t)vqaddq_u8((uint8x16_t)v38, v48));
    v51 = vbslq_s8(v49, (int8x16_t)vqaddq_u8((uint8x16_t)v35, v48), (int8x16_t)vqsubq_u8((uint8x16_t)v35, v48));
    v52 = (int16x8_t)vtrn1q_s8(v47, v50);
    v53 = (int16x8_t)vtrn2q_s8(v47, v50);
    v54 = (int16x8_t)vtrn1q_s8(v51, v60.val[0]);
    v55 = (int16x8_t)vtrn2q_s8(v51, v60.val[0]);
    v56 = vtrn1q_s16(v52, v54);
    v60.val[0] = (int8x16_t)vtrn1q_s16(v53, v55);
    *(_DWORD *)(a1 - 2) = v56.i32[0];
    v57 = a1 - 2;
    *(_DWORD *)(v57 + a2) = v60.val[0].i32[0];
    v58 = vtrn2q_s16(v52, v54);
    result = vtrn2q_s16(v53, v55);
    *(_DWORD *)(v57 + v15) = v58.i32[0];
    *(_DWORD *)(v57 + v18) = result.i32[0];
    *(_DWORD *)(v57 + 4 * a2) = v56.i32[1];
    *(_DWORD *)(v57 + v17) = v60.val[0].i32[1];
    *(_DWORD *)(v57 + 6 * a2) = v58.i32[1];
    *(_DWORD *)(v57 + v24) = result.i32[1];
    *(_DWORD *)(v57 + 8 * a2) = v56.i32[2];
    *(_DWORD *)(v57 + v14) = v60.val[0].i32[2];
    *(_DWORD *)(v57 + 10 * a2) = v58.i32[2];
    *(_DWORD *)(v57 + 11 * a2) = result.i32[2];
    *(_DWORD *)(v57 + 12 * a2) = v56.i32[3];
    *(_DWORD *)(v57 + 13 * a2) = v60.val[0].i32[3];
    *(_DWORD *)(v57 + v23) = v58.i32[3];
    *(_DWORD *)(v57 + v26) = result.i32[3];
  }
  return result;
}

uint8x16_t sub_1B690C550(uint8x16_t *a1, int a2, unsigned int a3, unsigned int a4)
{
  uint8x16_t v4;
  int8x16_t v5;
  uint64_t v6;
  uint8x16_t *v7;
  uint8x16_t *v8;
  int8x16_t v9;
  int8x16_t v10;
  uint8x16_t v11;
  uint64_t v12;
  int8x16_t v13;
  uint8x16_t v14;
  uint8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  uint8x16_t v18;
  uint8x16_t v19;
  uint16x8_t v20;
  int16x8_t v21;
  uint8x16_t v22;
  uint16x8_t v23;
  int16x8_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  uint8x16_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int8x16_t v32;
  int8x16_t v33;
  uint8x16_t result;

  v4 = (uint8x16_t)vdupq_n_s8(a3);
  v5 = vdupq_n_s8(a4);
  v6 = 2 * a2;
  v7 = (uint8x16_t *)((char *)a1 - v6);
  v8 = (uint8x16_t *)((char *)a1 - a2);
  v9 = *(int8x16_t *)a1;
  v10 = *(int8x16_t *)((char *)a1 + a2);
  v11 = vabdq_u8(*v8, *a1);
  v12 = 3 * a2;
  v13 = *(int8x16_t *)((char *)a1 - v12);
  v14.i64[0] = 0x202020202020202;
  v14.i64[1] = 0x202020202020202;
  v15 = vsraq_n_u8(v14, v4, 2uLL);
  v16 = *(int8x16_t *)((char *)a1 + v6);
  v17 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8(*(uint8x16_t *)((char *)a1 - v6), *v8)), (int8x16_t)vcgtq_u8(v4, v11)), (int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8((uint8x16_t)v10, *a1)));
  v18 = (uint8x16_t)vandq_s8(vandq_s8(v5, (int8x16_t)vcgtq_u8(v15, v11)), v17);
  v19 = vhaddq_u8((uint8x16_t)v13, (uint8x16_t)v10);
  v20 = vaddl_u8(*(uint8x8_t *)a1->i8, *(uint8x8_t *)v8->i8);
  v21 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)&a1->i8[-v6], *(uint8x8_t *)v13.i8), v20);
  v22 = *(uint8x16_t *)((char *)a1 + v12);
  v23 = vaddl_high_u8(*a1, *v8);
  v24 = (int16x8_t)vhaddq_u16(vaddl_high_u8(*(uint8x16_t *)((char *)a1 - v6), (uint8x16_t)v13), v23);
  v25 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v13, *v8), v18);
  v26 = vbslq_s8(v25, v13, vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)&a1->i8[-4 * a2]), v21), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v13, *(uint8x16_t *)((char *)a1 - 4 * a2)), v24), 2uLL));
  v27 = vbslq_s8(v25, *(int8x16_t *)((char *)a1 - v6), vrshrn_high_n_s16(vrshrn_n_s16(v21, 1uLL), v24, 1uLL));
  v28 = vbslq_s8(v17, vbslq_s8(v25, (int8x16_t)vrhaddq_u8(vhaddq_u8(*v8, (uint8x16_t)v10), *v7), vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8(v20, *(uint8x8_t *)v7->i8), *(uint8x8_t *)v19.i8), 2uLL), (int16x8_t)vaddw_high_u8(vaddw_high_u8(v23, *v7), v19), 2uLL)), *(int8x16_t *)v8);
  v29 = vhaddq_u8((uint8x16_t)v16, *(uint8x16_t *)((char *)a1 - v6));
  v30 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v10.i8), v20);
  v31 = (int16x8_t)vhaddq_u16(vaddl_high_u8((uint8x16_t)v16, (uint8x16_t)v10), v23);
  v32 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v16, *a1), v18);
  v33 = vbslq_s8(v32, (int8x16_t)vrhaddq_u8(vhaddq_u8(*a1, *(uint8x16_t *)((char *)a1 - v6)), (uint8x16_t)v10), vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8(v20, *(uint8x8_t *)v10.i8), *(uint8x8_t *)v29.i8), 2uLL), (int16x8_t)vaddw_high_u8(vaddw_high_u8(v23, (uint8x16_t)v10), v29), 2uLL));
  *(int8x16_t *)((char *)a1 - v12) = v26;
  *v7 = (uint8x16_t)v27;
  *v8 = (uint8x16_t)v28;
  result = (uint8x16_t)vbslq_s8(v17, v33, v9);
  *a1 = result;
  *(int8x16_t *)((char *)a1 + a2) = vbslq_s8(v32, v10, vrshrn_high_n_s16(vrshrn_n_s16(v30, 1uLL), v31, 1uLL));
  *(int8x16_t *)((char *)a1 + v6) = vbslq_s8(v32, v16, vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v22.i8, *(uint8x8_t *)v16.i8), v30), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8(v22, (uint8x16_t)v16), v31), 2uLL));
  return result;
}

int32x4_t sub_1B690C6CC(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  uint8x16_t v4;
  int8x16_t v5;
  _QWORD *v6;
  uint64_t v7;
  int8x16_t v8;
  uint64_t *v9;
  int8x16_t v10;
  uint64_t *v11;
  uint64_t v12;
  int8x16_t v13;
  uint64_t *v14;
  uint64_t v15;
  int8x16_t v16;
  uint64_t *v17;
  uint64_t v18;
  int8x16_t v19;
  uint64_t *v20;
  uint64_t v21;
  int8x16_t v22;
  uint64_t *v23;
  uint64_t v24;
  int8x16_t v25;
  uint64_t *v26;
  uint64_t v27;
  int8x16_t v28;
  uint64_t *v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  int8x16_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  uint8x16_t v54;
  uint8x16_t v55;
  uint8x16_t v56;
  int8x16_t v57;
  uint8x16_t v58;
  uint8x16_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int8x16_t v64;
  int8x16_t v65;
  int8x16_t v66;
  int8x16_t v67;
  int8x16_t v68;
  uint8x16_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int8x16_t v72;
  int8x16_t v73;
  int8x16_t v74;
  int8x16_t v75;
  int8x16_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
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
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t result;

  v4 = (uint8x16_t)vdupq_n_s8(a3);
  v5 = vdupq_n_s8(a4);
  v7 = *(_QWORD *)(a1 - 4);
  v6 = (_QWORD *)(a1 - 4);
  v8.i64[0] = v7;
  v9 = &v6[a2];
  v8.i64[1] = *v9;
  v10.i64[0] = *(_QWORD *)((char *)v6 + a2);
  v11 = (_QWORD *)((char *)v6 + 9 * a2);
  v10.i64[1] = *v11;
  v12 = 2 * a2;
  v13.i64[0] = *(_QWORD *)((char *)v6 + v12);
  v14 = (_QWORD *)((char *)v6 + 10 * a2);
  v13.i64[1] = *v14;
  v15 = 3 * a2;
  v16.i64[0] = *(_QWORD *)((char *)v6 + v15);
  v17 = (_QWORD *)((char *)v6 + 11 * a2);
  v16.i64[1] = *v17;
  v18 = 4 * a2;
  v19.i64[0] = *(_QWORD *)((char *)v6 + v18);
  v20 = (_QWORD *)((char *)v6 + 12 * a2);
  v19.i64[1] = *v20;
  v21 = 5 * a2;
  v22.i64[0] = *(_QWORD *)((char *)v6 + v21);
  v23 = (_QWORD *)((char *)v6 + 13 * a2);
  v22.i64[1] = *v23;
  v24 = 6 * a2;
  v25.i64[0] = *(_QWORD *)((char *)v6 + v24);
  v26 = (_QWORD *)((char *)v6 + 14 * a2);
  v25.i64[1] = *v26;
  v27 = 7 * a2;
  v28.i64[0] = *(_QWORD *)((char *)v6 + v27);
  v29 = (_QWORD *)((char *)&v6[2 * a2] - a2);
  v28.i64[1] = *v29;
  v30 = (int16x8_t)vtrn1q_s8(v8, v10);
  v31 = (int16x8_t)vtrn2q_s8(v8, v10);
  v32 = (int16x8_t)vtrn1q_s8(v13, v16);
  v33 = (int16x8_t)vtrn2q_s8(v13, v16);
  v34 = (int16x8_t)vtrn1q_s8(v19, v22);
  v35 = (int16x8_t)vtrn2q_s8(v19, v22);
  v36 = (int16x8_t)vtrn1q_s8(v25, v28);
  v37 = (int16x8_t)vtrn2q_s8(v25, v28);
  v38 = (int32x4_t)vtrn1q_s16(v30, v32);
  v39 = (int32x4_t)vtrn2q_s16(v30, v32);
  v40 = (int32x4_t)vtrn1q_s16(v31, v33);
  v41 = (int32x4_t)vtrn2q_s16(v31, v33);
  v42 = (int32x4_t)vtrn1q_s16(v34, v36);
  v43 = (int32x4_t)vtrn2q_s16(v34, v36);
  v44 = (int32x4_t)vtrn1q_s16(v35, v37);
  v45 = (int32x4_t)vtrn2q_s16(v35, v37);
  v46 = (int8x16_t)vtrn1q_s32(v38, v42);
  v47 = (int8x16_t)vtrn2q_s32(v38, v42);
  v48 = (int8x16_t)vtrn1q_s32(v40, v44);
  v49 = (int8x16_t)vtrn2q_s32(v40, v44);
  v50 = (int8x16_t)vtrn1q_s32(v39, v43);
  v51 = (int8x16_t)vtrn2q_s32(v39, v43);
  v52 = (int8x16_t)vtrn1q_s32(v41, v45);
  v53 = (int8x16_t)vtrn2q_s32(v41, v45);
  v54 = vabdq_u8((uint8x16_t)v52, (uint8x16_t)v47);
  v55.i64[0] = 0x202020202020202;
  v55.i64[1] = 0x202020202020202;
  v56 = vsraq_n_u8(v55, v4, 2uLL);
  v57 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8((uint8x16_t)v50, (uint8x16_t)v52)), (int8x16_t)vcgtq_u8(v4, v54)), (int8x16_t)vcgtq_u8((uint8x16_t)v5, vabdq_u8((uint8x16_t)v49, (uint8x16_t)v47)));
  v58 = (uint8x16_t)vandq_s8(vandq_s8(v5, (int8x16_t)vcgtq_u8(v56, v54)), v57);
  v59 = vhaddq_u8((uint8x16_t)v48, (uint8x16_t)v49);
  v60 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v47.i8, *(uint8x8_t *)v52.i8);
  v61 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)v50.i8, *(uint8x8_t *)v48.i8), (uint16x8_t)v60);
  v62 = (int16x8_t)vaddl_high_u8((uint8x16_t)v47, (uint8x16_t)v52);
  v63 = (int16x8_t)vhaddq_u16(vaddl_high_u8((uint8x16_t)v50, (uint8x16_t)v48), (uint16x8_t)v62);
  v64 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v48, (uint8x16_t)v52), v58);
  v65 = vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v50.i8, *(uint8x8_t *)v59.i8), v60), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v50, v59), v62), 2uLL);
  v66 = vbslq_s8(v64, v48, vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8((uint16x8_t)v61, *(uint8x8_t *)v46.i8), *(uint8x8_t *)v48.i8), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v48, (uint8x16_t)v46), v63), 2uLL));
  v67 = vbslq_s8(v64, v50, vrshrn_high_n_s16(vrshrn_n_s16(v61, 1uLL), v63, 1uLL));
  v68 = vbslq_s8(v57, vbslq_s8(v64, (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v52, (uint8x16_t)v49), (uint8x16_t)v50), v65), v52);
  v69 = vhaddq_u8((uint8x16_t)v51, (uint8x16_t)v50);
  v70 = (int16x8_t)vhaddq_u16(vaddl_u8(*(uint8x8_t *)v49.i8, *(uint8x8_t *)v51.i8), (uint16x8_t)v60);
  v71 = (int16x8_t)vhaddq_u16(vaddl_high_u8((uint8x16_t)v49, (uint8x16_t)v51), (uint16x8_t)v62);
  v72 = (int8x16_t)vcgeq_u8(vabdq_u8((uint8x16_t)v51, (uint8x16_t)v47), v58);
  v73 = vbslq_s8(v72, v51, vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v51.i8, *(uint8x8_t *)v53.i8), v70), 2uLL), vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v51, (uint8x16_t)v53), v71), 2uLL));
  v74 = vbslq_s8(v72, (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v47, (uint8x16_t)v50), (uint8x16_t)v49), vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8(vaddw_u8((uint16x8_t)v60, *(uint8x8_t *)v49.i8), *(uint8x8_t *)v69.i8), 2uLL), (int16x8_t)vaddw_high_u8(vaddw_high_u8((uint16x8_t)v62, (uint8x16_t)v49), v69), 2uLL));
  v75 = vbslq_s8(v72, v49, vrshrn_high_n_s16(vrshrn_n_s16(v70, 1uLL), v71, 1uLL));
  v76 = vbslq_s8(v57, v74, v47);
  v77 = (int16x8_t)vtrn1q_s8(v46, v66);
  v78 = (int16x8_t)vtrn2q_s8(v46, v66);
  v79 = (int16x8_t)vtrn1q_s8(v67, v68);
  v80 = (int16x8_t)vtrn2q_s8(v67, v68);
  v81 = (int16x8_t)vtrn1q_s8(v76, v75);
  v82 = (int16x8_t)vtrn2q_s8(v76, v75);
  v83 = (int16x8_t)vtrn1q_s8(v73, v53);
  v84 = (int16x8_t)vtrn2q_s8(v73, v53);
  v85 = (int32x4_t)vtrn1q_s16(v77, v79);
  v86 = (int32x4_t)vtrn1q_s16(v78, v80);
  v87 = (int32x4_t)vtrn1q_s16(v81, v83);
  v88 = vtrn1q_s32(v85, v87);
  *v6 = v88.i64[0];
  v89 = (int32x4_t)vtrn1q_s16(v82, v84);
  v90 = vtrn1q_s32(v86, v89);
  *(_QWORD *)((char *)v6 + a2) = v90.i64[0];
  v91 = (int32x4_t)vtrn2q_s16(v77, v79);
  v92 = (int32x4_t)vtrn2q_s16(v81, v83);
  v93 = vtrn1q_s32(v91, v92);
  *(_QWORD *)((char *)v6 + v12) = v93.i64[0];
  v94 = (int32x4_t)vtrn2q_s16(v78, v80);
  v95 = (int32x4_t)vtrn2q_s16(v82, v84);
  v96 = vtrn1q_s32(v94, v95);
  *(_QWORD *)((char *)v6 + v15) = v96.i64[0];
  v97 = vtrn2q_s32(v85, v87);
  *(_QWORD *)((char *)v6 + v18) = v97.i64[0];
  v98 = vtrn2q_s32(v86, v89);
  *(_QWORD *)((char *)v6 + v21) = v98.i64[0];
  v99 = vtrn2q_s32(v91, v92);
  *(_QWORD *)((char *)v6 + v24) = v99.i64[0];
  result = vtrn2q_s32(v94, v95);
  *(_QWORD *)((char *)v6 + v27) = result.i64[0];
  *v9 = v88.i64[1];
  *v11 = v90.i64[1];
  *v14 = v93.i64[1];
  *v17 = v96.i64[1];
  *v20 = v97.i64[1];
  *v23 = v98.i64[1];
  *v26 = v99.i64[1];
  *v29 = result.i64[1];
  return result;
}

int8x16_t sub_1B690C9B0(int8x16_t *a1, int a2, const __int16 *a3, const __int16 *a4, unint64_t *a5, double a6, double a7, int16x8_t a8)
{
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t v10;
  uint8x16_t *v11;
  uint8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  uint8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t result;

  if (*a5 != -1)
  {
    v8 = (uint8x16_t)vld1q_dup_s16(a3);
    v9 = (uint8x16_t)vld1q_dup_s16(a4);
    a8.i64[0] = *a5;
    v10 = *(uint8x16_t *)((char *)a1 - 2 * a2);
    v11 = (uint8x16_t *)((char *)a1 - a2);
    v12 = *(uint8x16_t *)((char *)a1 + a2);
    v13 = (int8x16_t)vcgtq_u8(v9, vabdq_u8(v10, *v11));
    v14.i64[0] = 0x101010101010101;
    v14.i64[1] = 0x101010101010101;
    v15 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8(v10, v12), 1uLL), vandq_s8(veorq_s8(*a1, *(int8x16_t *)v11), v14)), (int8x16_t)vhsubq_u8(*(uint8x16_t *)a1, *v11));
    v16 = vminq_u8((uint8x16_t)vqabsq_s8(v15), (uint8x16_t)vandq_s8(vandq_s8(vaddq_s8((int8x16_t)vzip1q_s16(a8, a8), v14), v13), vandq_s8((int8x16_t)vcgtq_u8(v8, vabdq_u8(*v11, *(uint8x16_t *)a1)), (int8x16_t)vcgtq_u8(v9, vabdq_u8(v12, *(uint8x16_t *)a1)))));
    v17 = (int8x16_t)vqaddq_u8(*v11, v16);
    v18 = (int8x16_t)vqsubq_u8(*v11, v16);
    v19 = vcltzq_s8(v15);
    result = vbslq_s8(v19, (int8x16_t)vqaddq_u8(*(uint8x16_t *)a1, v16), (int8x16_t)vqsubq_u8(*(uint8x16_t *)a1, v16));
    *(int8x16_t *)v11 = vbslq_s8(v19, v18, v17);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B690CA60(uint64_t result, int a2, const __int16 *a3, const __int16 *a4, unint64_t *a5, double a6, double a7, double a8, double a9, int16x8_t a10)
{
  uint8x16_t v10;
  uint8x16_t v11;
  int16x8_t v12;
  int16x8_t v13;
  uint64_t v14;
  int16x8_t v15;
  uint64_t v16;
  int16x8_t v17;
  uint64_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  uint8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  uint8x16_t v26;
  uint8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  uint8x16_t v30;
  int8x16_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;

  if (*a5 != -1)
  {
    v10 = (uint8x16_t)vld1q_dup_s16(a3);
    v11 = (uint8x16_t)vld1q_dup_s16(a4);
    v12.i64[0] = *(_QWORD *)(result - 4);
    v12.i64[1] = *(_QWORD *)(result - 4 + 4 * a2);
    v13.i64[0] = *(_QWORD *)(result - 4 + a2);
    a10.i64[0] = *a5;
    v14 = 5 * a2;
    v13.i64[1] = *(_QWORD *)(result - 4 + v14);
    v15.i64[0] = *(_QWORD *)(result - 4 + 2 * a2);
    v16 = 3 * a2;
    v15.i64[1] = *(_QWORD *)(result - 4 + 6 * a2);
    v17.i64[0] = *(_QWORD *)(result - 4 + v16);
    v18 = 7 * a2;
    v17.i64[1] = *(_QWORD *)(result - 4 + v18);
    v19 = (int32x4_t)vtrn1q_s16(v12, v13);
    v20 = (int32x4_t)vtrn2q_s16(v12, v13);
    v21 = (int32x4_t)vtrn1q_s16(v15, v17);
    v22 = (int32x4_t)vtrn2q_s16(v15, v17);
    v23 = (uint8x16_t)vtrn1q_s32(v19, v21);
    v24 = (int8x16_t)vtrn2q_s32(v19, v21);
    v25 = (int8x16_t)vtrn1q_s32(v20, v22);
    v26 = (uint8x16_t)vtrn2q_s32(v20, v22);
    v27 = vabdq_u8(v26, (uint8x16_t)v24);
    v28.i64[0] = 0x101010101010101;
    v28.i64[1] = 0x101010101010101;
    v29 = vqaddq_s8(vrhaddq_s8(vshrq_n_s8((int8x16_t)vhsubq_u8(v23, v26), 1uLL), vandq_s8(veorq_s8(v24, v25), v28)), (int8x16_t)vhsubq_u8((uint8x16_t)v24, (uint8x16_t)v25));
    v30 = vminq_u8((uint8x16_t)vqabsq_s8(v29), (uint8x16_t)vandq_s8(vandq_s8(vaddq_s8((int8x16_t)vzip1q_s16(a10, a10), v28), (int8x16_t)vcgtq_u8(v11, v27)), vandq_s8((int8x16_t)vcgtq_u8(v11, vabdq_u8(v23, (uint8x16_t)v25)), (int8x16_t)vcgtq_u8(v10, vabdq_u8((uint8x16_t)v25, (uint8x16_t)v24)))));
    v31 = vcltzq_s8(v29);
    v32 = (int16x8_t)vbslq_s8(v31, (int8x16_t)vqsubq_u8((uint8x16_t)v25, v30), (int8x16_t)vqaddq_u8((uint8x16_t)v25, v30));
    v33 = (int16x8_t)vbslq_s8(v31, (int8x16_t)vqaddq_u8((uint8x16_t)v24, v30), (int8x16_t)vqsubq_u8((uint8x16_t)v24, v30));
    v34 = vtrn1q_s16(v32, v33);
    v35 = vtrn2q_s16(v32, v33);
    *(_DWORD *)(result - 2) = v34.i32[0];
    result -= 2;
    *(_DWORD *)(result + a2) = v35.i32[0];
    *(_DWORD *)(result + 2 * a2) = v34.i32[1];
    *(_DWORD *)(result + v16) = v35.i32[1];
    *(_DWORD *)(result + 4 * a2) = v34.i32[2];
    *(_DWORD *)(result + v14) = v35.i32[2];
    *(_DWORD *)(result + 6 * a2) = v34.i32[3];
    *(_DWORD *)(result + v18) = v35.i32[3];
  }
  return result;
}

uint8x16_t sub_1B690CBA0(uint8x16_t *a1, int a2, const __int16 *a3, const __int16 *a4)
{
  uint8x16_t v4;
  uint8x16_t v5;
  uint8x16_t v6;
  uint8x16_t *v7;
  uint8x16_t v8;
  uint8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  uint8x16_t result;

  v4 = (uint8x16_t)vld1q_dup_s16(a3);
  v5 = (uint8x16_t)vld1q_dup_s16(a4);
  v6 = *(uint8x16_t *)((char *)a1 - 2 * a2);
  v7 = (uint8x16_t *)((char *)a1 - a2);
  v8 = *(uint8x16_t *)((char *)a1 + a2);
  v9 = vhaddq_u8(*a1, v6);
  v10 = vandq_s8((int8x16_t)vcgtq_u8(v5, vabdq_u8(v6, *v7)), vandq_s8((int8x16_t)vcgtq_u8(v4, vabdq_u8(*v7, *a1)), (int8x16_t)vcgtq_u8(v5, vabdq_u8(v8, *a1))));
  v11 = vbslq_s8(v10, (int8x16_t)vrhaddq_u8(vhaddq_u8(*v7, v8), v6), *(int8x16_t *)v7);
  result = (uint8x16_t)vbslq_s8(v10, (int8x16_t)vrhaddq_u8(v9, v8), *(int8x16_t *)a1);
  *v7 = (uint8x16_t)v11;
  *a1 = result;
  return result;
}

uint64_t sub_1B690CC08(uint64_t a1, int a2, const __int16 *a3, const __int16 *a4)
{
  uint8x16_t v4;
  uint8x16_t v5;
  int16x8_t v6;
  int16x8_t v7;
  uint64_t v8;
  int16x8_t v9;
  uint64_t v10;
  int16x8_t v11;
  uint64_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  uint8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  uint8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  uint64_t result;

  v4 = (uint8x16_t)vld1q_dup_s16(a3);
  v5 = (uint8x16_t)vld1q_dup_s16(a4);
  v6.i64[0] = *(_QWORD *)(a1 - 4);
  v6.i64[1] = *(_QWORD *)(a1 - 4 + 4 * a2);
  v7.i64[0] = *(_QWORD *)(a1 - 4 + a2);
  v8 = 5 * a2;
  v7.i64[1] = *(_QWORD *)(a1 - 4 + v8);
  v9.i64[0] = *(_QWORD *)(a1 - 4 + 2 * a2);
  v10 = 3 * a2;
  v9.i64[1] = *(_QWORD *)(a1 - 4 + 6 * a2);
  v11.i64[0] = *(_QWORD *)(a1 - 4 + v10);
  v12 = 7 * a2;
  v11.i64[1] = *(_QWORD *)(a1 - 4 + v12);
  v13 = (int32x4_t)vtrn1q_s16(v6, v7);
  v14 = (int32x4_t)vtrn2q_s16(v6, v7);
  v15 = (int32x4_t)vtrn1q_s16(v9, v11);
  v16 = (int32x4_t)vtrn2q_s16(v9, v11);
  v17 = (uint8x16_t)vtrn1q_s32(v13, v15);
  v18 = (int8x16_t)vtrn2q_s32(v13, v15);
  v19 = (int8x16_t)vtrn1q_s32(v14, v16);
  v20 = (uint8x16_t)vtrn2q_s32(v14, v16);
  v21 = vandq_s8(vandq_s8((int8x16_t)vcgtq_u8(v5, vabdq_u8(v17, (uint8x16_t)v19)), (int8x16_t)vcgtq_u8(v4, vabdq_u8((uint8x16_t)v19, (uint8x16_t)v18))), (int8x16_t)vcgtq_u8(v5, vabdq_u8(v20, (uint8x16_t)v18)));
  v22 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v18, v17), v20);
  v23 = (int16x8_t)vbslq_s8(v21, (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)v19, v20), v17), v19);
  v24 = (int16x8_t)vbslq_s8(v21, v22, v18);
  v25 = vtrn1q_s16(v23, v24);
  v26 = vtrn2q_s16(v23, v24);
  *(_DWORD *)(a1 - 2) = v25.i32[0];
  result = a1 - 2;
  *(_DWORD *)(result + a2) = v26.i32[0];
  *(_DWORD *)(result + 2 * a2) = v25.i32[1];
  *(_DWORD *)(result + v10) = v26.i32[1];
  *(_DWORD *)(result + 4 * a2) = v25.i32[2];
  *(_DWORD *)(result + v8) = v26.i32[2];
  *(_DWORD *)(result + 6 * a2) = v25.i32[3];
  *(_DWORD *)(result + v12) = v26.i32[3];
  return result;
}

BOOL sub_1B690CD04(uint64_t a1, int16x8_t *a2, uint64_t a3, _DWORD *a4, int a5)
{
  uint64_t v9;
  int8x16_t *v10;
  int v11;
  unsigned int v12;
  char v13;
  char v14;
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
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int8x16_t *v42;
  uint64_t v43;
  _BOOL8 result;
  int16x8_t v45;
  int16x8_t v46;
  uint16x8_t v47;

  v9 = 0;
  if (a5)
    v10 = (int8x16_t *)&unk_1EF1381E0;
  else
    v10 = (int8x16_t *)&unk_1EF138200;
  v11 = *(_DWORD *)a1;
  v12 = *(_DWORD *)(a1 + 4);
  v47 = *(uint16x8_t *)*(_QWORD *)(a1 + 8);
  *a4 = 0;
  v13 = 1;
  do
  {
    v14 = v13;
    v15 = a2[2];
    v16 = a2[4];
    v17 = a2[6];
    v18 = vaddq_s16(v17, *a2);
    v19 = vsubq_s16(*a2, v17);
    v20 = vaddq_s16(v16, v15);
    v21 = vsubq_s16(v15, v16);
    v22 = vaddq_s16(v18, v20);
    v23 = vsubq_s16(v18, v20);
    v24 = vaddq_s16(vaddq_s16(v19, v19), v21);
    v25 = vsubq_s16(v19, vaddq_s16(v21, v21));
    v26 = (int32x4_t)vtrn1q_s16(v22, v24);
    v27 = (int32x4_t)vtrn2q_s16(v22, v24);
    v28 = (int32x4_t)vtrn1q_s16(v23, v25);
    v29 = (int32x4_t)vtrn2q_s16(v23, v25);
    v30 = (int16x8_t)vtrn1q_s32(v26, v28);
    v31 = (int16x8_t)vtrn2q_s32(v26, v28);
    v32 = (int16x8_t)vtrn1q_s32(v27, v29);
    v33 = (int16x8_t)vtrn2q_s32(v27, v29);
    v34 = vaddq_s16(v33, v30);
    v35 = vsubq_s16(v30, v33);
    v36 = vaddq_s16(v31, v32);
    v37 = vsubq_s16(v32, v31);
    v40 = vaddq_s16(v36, v34);
    v41 = vsubq_s16(v34, v36);
    v38 = (int64x2_t)vaddq_s16(vaddq_s16(v35, v35), v37);
    v39 = (int64x2_t)vsubq_s16(v35, vaddq_s16(v37, v37));
    v45 = (int16x8_t)vzip2q_s64((int64x2_t)v41, v39);
    v46 = (int16x8_t)vzip2q_s64((int64x2_t)v40, v38);
    v40.i64[1] = v38.i64[0];
    v41.i64[1] = v39.i64[0];
    if (a5)
      v42 = (int8x16_t *)&unk_1EF1381F0;
    else
      v42 = (int8x16_t *)&unk_1EF138210;
    *((_BYTE *)a4 + v9) = sub_1B690CE90((int8x16_t *)(a3 + 32 * v9), v12, v11, *v10, *v42, v40, v41, v47);
    v43 = v9 | 1;
    result = sub_1B690CE90((int8x16_t *)(a3 + 32 * v43), v12, v11, *v10, *v42, v46, v45, v47);
    v13 = 0;
    *((_BYTE *)a4 + v43) = result;
    a2 += 8;
    v9 = 2;
  }
  while ((v14 & 1) != 0);
  return result;
}

BOOL sub_1B690CE90(int8x16_t *a1, unsigned int a2, int a3, int8x16_t a4, int8x16_t a5, int16x8_t a6, int16x8_t a7, uint16x8_t a8)
{
  uint32x4_t v8;
  uint32x4_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  uint32x4_t v14;
  uint32x4_t v15;
  uint32x4_t v16;
  uint32x4_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16x2_t v22;

  v8 = (uint32x4_t)vdupq_n_s32(a2);
  v9 = (uint32x4_t)vdupq_n_s32(-a3);
  v10 = (uint16x8_t)vabsq_s16(a6);
  v11 = (uint16x8_t)vabsq_s16(a7);
  v12 = vcltzq_s16(a6);
  v13 = vcltzq_s16(a7);
  v14 = vmlal_u16(v8, *(uint16x4_t *)v10.i8, *(uint16x4_t *)a8.i8);
  v15 = vmlal_high_u16(v8, v10, a8);
  v16 = vmlal_u16(v8, *(uint16x4_t *)v11.i8, *(uint16x4_t *)a8.i8);
  v17 = vmlal_high_u16(v8, v11, a8);
  v18 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v14, v9)), vshlq_u32(v15, v9));
  v19 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v16, v9)), vshlq_u32(v17, v9));
  v22.val[0] = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v18, (int8x16_t)v12), v12);
  v22.val[1] = (int8x16_t)vsubq_s16((int16x8_t)veorq_s8(v19, (int8x16_t)v13), v13);
  v20 = vqtbl2q_s8(v22, a4);
  *a1 = v20;
  a1[1] = vqtbl2q_s8(v22, a5);
  v20.i16[0] = vmaxvq_u16((uint16x8_t)vorrq_s8(v19, v18));
  return v20.i32[0] != 0;
}

BOOL sub_1B690CF1C(uint64_t a1, int16x8_t *a2, uint64_t a3, _DWORD *a4, int a5, uint64_t a6)
{
  uint64_t v10;
  int8x16_t *v11;
  int v12;
  unsigned int v13;
  char v14;
  char v15;
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
  int32x4_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int8x16_t v39;
  int64x2_t v40;
  _WORD *v41;
  int64x2_t v42;
  int64x2_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int8x16_t *v46;
  uint64_t v47;
  _BOOL8 result;
  int16x8_t v50;
  int16x8_t v51;
  uint16x8_t v52;

  v10 = 0;
  if (a5)
    v11 = (int8x16_t *)&unk_1EF1381E0;
  else
    v11 = (int8x16_t *)&unk_1EF138200;
  v12 = *(_DWORD *)a1;
  v13 = *(_DWORD *)(a1 + 4);
  v52 = *(uint16x8_t *)*(_QWORD *)(a1 + 8);
  *a4 = 0;
  v14 = 1;
  do
  {
    v15 = v14;
    v16 = a2[2];
    v17 = a2[4];
    v18 = a2[6];
    v19 = vaddq_s16(v18, *a2);
    v20 = vsubq_s16(*a2, v18);
    v21 = vaddq_s16(v17, v16);
    v22 = vsubq_s16(v16, v17);
    v23 = vaddq_s16(v19, v21);
    v24 = vsubq_s16(v19, v21);
    v25 = vaddq_s16(vaddq_s16(v20, v20), v22);
    v26 = vsubq_s16(v20, vaddq_s16(v22, v22));
    v27 = (int32x4_t)vtrn1q_s16(v23, v25);
    v28 = (int32x4_t)vtrn2q_s16(v23, v25);
    v29 = (int32x4_t)vtrn1q_s16(v24, v26);
    v30 = (int32x4_t)vtrn2q_s16(v24, v26);
    v31 = (int16x8_t)vtrn1q_s32(v27, v29);
    v32 = (int16x8_t)vtrn2q_s32(v27, v29);
    v33 = (int16x8_t)vtrn1q_s32(v28, v30);
    v34 = (int16x8_t)vtrn2q_s32(v28, v30);
    v35 = vaddq_s16(v34, v31);
    v36 = vsubq_s16(v31, v34);
    v37 = vaddq_s16(v32, v33);
    v38 = vsubq_s16(v33, v32);
    v39 = (int8x16_t)vaddq_s16(v37, v35);
    v45 = vsubq_s16(v35, v37);
    v40 = (int64x2_t)vaddq_s16(vaddq_s16(v36, v36), v38);
    v41 = (_WORD *)(a6 + 2 * v10);
    *v41 = v39.i16[0];
    v41[1] = vextq_s8(v39, v39, 8uLL).u16[0];
    v42 = (int64x2_t)vsubq_s16(v36, vaddq_s16(v38, v38));
    v38.i64[0] = -65536;
    v38.i64[1] = -65536;
    v43 = (int64x2_t)vandq_s8(v39, (int8x16_t)v38);
    v44 = (int16x8_t)vzip1q_s64(v43, v40);
    v50 = (int16x8_t)vzip2q_s64((int64x2_t)v45, v42);
    v51 = (int16x8_t)vzip2q_s64(v43, v40);
    v45.i64[1] = v42.i64[0];
    if (a5)
      v46 = (int8x16_t *)&unk_1EF1381F0;
    else
      v46 = (int8x16_t *)&unk_1EF138210;
    *((_BYTE *)a4 + v10) = sub_1B690CE90((int8x16_t *)(a3 + 32 * v10), v13, v12, *v11, *v46, v44, v45, v52);
    v47 = v10 | 1;
    result = sub_1B690CE90((int8x16_t *)(a3 + 32 * v47), v13, v12, *v11, *v46, v51, v50, v52);
    v14 = 0;
    *((_BYTE *)a4 + v47) = result;
    a2 += 8;
    v10 = 2;
  }
  while ((v15 & 1) != 0);
  return result;
}

BOOL sub_1B690D0C4(uint64_t a1, float *a2, int a3)
{
  const __int16 *v4;
  uint16x8_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int64x2_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int8x16_t *v21;
  int8x16_t v22;
  int8x16_t *v23;
  float32x4x2_t v25;

  v25 = vld2q_f32(a2);
  v4 = *(const __int16 **)(a1 + 8);
  v5 = (uint16x8_t)vld1q_dup_s16(v4);
  v6 = vaddl_s16(*(int16x4_t *)v25.val[1].f32, *(int16x4_t *)v25.val[0].f32);
  v7 = vsubl_s16(*(int16x4_t *)v25.val[0].f32, *(int16x4_t *)v25.val[1].f32);
  v8 = vaddl_high_s16((int16x8_t)v25.val[1], (int16x8_t)v25.val[0]);
  v25.val[0] = (float32x4_t)vsubl_high_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
  v25.val[1] = (float32x4_t)vaddq_s32(v8, v6);
  v9 = vsubq_s32(v6, v8);
  v10 = vsubq_s32(v7, (int32x4_t)v25.val[0]);
  v25.val[0] = (float32x4_t)vaddq_s32((int32x4_t)v25.val[0], v7);
  v11 = vtrn1q_s32((int32x4_t)v25.val[1], v9);
  v25.val[1] = (float32x4_t)vtrn2q_s32((int32x4_t)v25.val[1], v9);
  v12 = (int64x2_t)vtrn1q_s32(v10, (int32x4_t)v25.val[0]);
  v13 = (int32x4_t)vzip2q_s64((int64x2_t)v11, v12);
  v11.i64[1] = v12.i64[0];
  v25.val[0] = (float32x4_t)vtrn2q_s32(v10, (int32x4_t)v25.val[0]);
  v14 = (int32x4_t)vzip2q_s64((int64x2_t)v25.val[1], (int64x2_t)v25.val[0]);
  v25.val[1].i64[1] = v25.val[0].i64[0];
  v25.val[0] = (float32x4_t)vaddq_s32((int32x4_t)v25.val[1], v11);
  v25.val[1] = (float32x4_t)vsubq_s32(v11, (int32x4_t)v25.val[1]);
  v15 = vaddq_s32(v14, v13);
  v16 = vsubq_s32(v13, v14);
  v17 = vaddq_s32(v15, (int32x4_t)v25.val[0]);
  v25.val[0] = (float32x4_t)vsubq_s32((int32x4_t)v25.val[0], v15);
  v18 = vsubq_s32((int32x4_t)v25.val[1], v16);
  v25.val[1] = (float32x4_t)vaddq_s32(v16, (int32x4_t)v25.val[1]);
  v19 = vshrn_high_n_s32(vshrn_n_s32(v17, 1uLL), (int32x4_t)v25.val[0], 1uLL);
  v20 = vshrn_high_n_s32(vshrn_n_s32(v18, 1uLL), (int32x4_t)v25.val[1], 1uLL);
  if (a3)
    v21 = (int8x16_t *)&unk_1EF1381E0;
  else
    v21 = (int8x16_t *)&unk_1EF138200;
  v22 = *v21;
  v23 = (int8x16_t *)&unk_1EF138210;
  if (a3)
    v23 = (int8x16_t *)&unk_1EF1381F0;
  return sub_1B690CE90((int8x16_t *)a2, 2 * *(_DWORD *)(a1 + 4), *(_DWORD *)a1 + 1, v22, *v23, v19, v20, v5);
}

BOOL sub_1B690D188(uint64_t a1, const __int16 *a2, uint64_t a3, uint64_t a4, int a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v9;
  int v10;
  unsigned int v11;
  int8x16_t *v12;
  char v13;
  const __int16 *v14;
  const __int16 *v15;
  const __int16 *v16;
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
  int8x16_t v28;
  int8x16_t v29;
  _WORD *v30;
  uint64_t v31;
  _WORD *v32;
  int16x8_t v33;
  int16x8_t v34;
  int8x16_t *v35;
  int16x8_t v36;
  _BOOL8 result;
  int16x8_t v42;
  int16x8_t v43;
  uint64_t v44;
  int64x2_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  char v49;
  uint16x8_t v50;
  int16x8x2_t v51;
  int16x8x2_t v52;
  int16x8x2_t v53;
  int16x8x2_t v54;

  v9 = 0;
  v10 = *(_DWORD *)a1;
  v11 = *(_DWORD *)(a1 + 4);
  v50 = *(uint16x8_t *)*(_QWORD *)(a1 + 8);
  if (a5)
    v12 = (int8x16_t *)&unk_1EF1381E0;
  else
    v12 = (int8x16_t *)&unk_1EF138200;
  *a6 = 0;
  v13 = 1;
  do
  {
    v14 = a2;
    v51 = vld2q_s16(v14);
    v14 += 16;
    v52 = vld2q_s16(v14);
    v15 = a2 + 32;
    v53 = vld2q_s16(v15);
    v16 = a2 + 48;
    v54 = vld2q_s16(v16);
    v17 = vaddq_s16(v54.val[0], v51.val[0]);
    v18 = vsubq_s16(v51.val[0], v54.val[0]);
    v19 = vaddq_s16(v53.val[0], v52.val[0]);
    v20 = vsubq_s16(v52.val[0], v53.val[0]);
    v21 = vaddq_s16(v17, v19);
    v49 = v13;
    v22 = vsubq_s16(v17, v19);
    v23 = vaddq_s16(vaddq_s16(v18, v18), v20);
    v24 = vsubq_s16(v18, vaddq_s16(v20, v20));
    v25 = vaddq_s16(v54.val[1], v51.val[1]);
    v51.val[0] = vsubq_s16(v51.val[1], v54.val[1]);
    v51.val[1] = vaddq_s16(v53.val[1], v52.val[1]);
    v52.val[0] = vsubq_s16(v52.val[1], v53.val[1]);
    v52.val[1] = vaddq_s16(v25, v51.val[1]);
    v51.val[1] = vsubq_s16(v25, v51.val[1]);
    v53.val[0] = vaddq_s16(vaddq_s16(v51.val[0], v51.val[0]), v52.val[0]);
    v51.val[0] = vsubq_s16(v51.val[0], vaddq_s16(v52.val[0], v52.val[0]));
    v52.val[0] = vtrn1q_s16(v21, v23);
    v53.val[1] = vtrn2q_s16(v21, v23);
    v54.val[0] = vtrn1q_s16(v22, v24);
    v54.val[1] = vtrn2q_s16(v22, v24);
    v26 = (int16x8_t)vtrn1q_s32((int32x4_t)v52.val[0], (int32x4_t)v54.val[0]);
    v52.val[0] = (int16x8_t)vtrn2q_s32((int32x4_t)v52.val[0], (int32x4_t)v54.val[0]);
    v54.val[0] = (int16x8_t)vtrn1q_s32((int32x4_t)v53.val[1], (int32x4_t)v54.val[1]);
    v53.val[1] = (int16x8_t)vtrn2q_s32((int32x4_t)v53.val[1], (int32x4_t)v54.val[1]);
    v54.val[1] = vtrn1q_s16(v52.val[1], v53.val[0]);
    v52.val[1] = vtrn2q_s16(v52.val[1], v53.val[0]);
    v53.val[0] = vtrn1q_s16(v51.val[1], v51.val[0]);
    v51.val[0] = vtrn2q_s16(v51.val[1], v51.val[0]);
    v51.val[1] = (int16x8_t)vtrn1q_s32((int32x4_t)v54.val[1], (int32x4_t)v53.val[0]);
    v53.val[0] = (int16x8_t)vtrn2q_s32((int32x4_t)v54.val[1], (int32x4_t)v53.val[0]);
    v54.val[1] = (int16x8_t)vtrn1q_s32((int32x4_t)v52.val[1], (int32x4_t)v51.val[0]);
    v51.val[0] = (int16x8_t)vtrn2q_s32((int32x4_t)v52.val[1], (int32x4_t)v51.val[0]);
    v52.val[1] = vaddq_s16(v53.val[1], v26);
    v53.val[1] = vsubq_s16(v26, v53.val[1]);
    v27 = vaddq_s16(v52.val[0], v54.val[0]);
    v52.val[0] = vsubq_s16(v54.val[0], v52.val[0]);
    v28 = (int8x16_t)vaddq_s16(v27, v52.val[1]);
    v34 = vsubq_s16(v52.val[1], v27);
    v54.val[0] = vaddq_s16(vaddq_s16(v53.val[1], v53.val[1]), v52.val[0]);
    v53.val[1] = vsubq_s16(v53.val[1], vaddq_s16(v52.val[0], v52.val[0]));
    v52.val[0] = vaddq_s16(v51.val[0], v51.val[1]);
    v51.val[0] = vsubq_s16(v51.val[1], v51.val[0]);
    v51.val[1] = vaddq_s16(v53.val[0], v54.val[1]);
    v53.val[0] = vsubq_s16(v54.val[1], v53.val[0]);
    v29 = (int8x16_t)vaddq_s16(v51.val[1], v52.val[0]);
    v54.val[1] = vsubq_s16(v52.val[0], v51.val[1]);
    v51.val[1] = vaddq_s16(vaddq_s16(v51.val[0], v51.val[0]), v53.val[0]);
    v44 = v54.val[1].i64[0];
    v45 = (int64x2_t)vsubq_s16(v51.val[0], vaddq_s16(v53.val[0], v53.val[0]));
    v30 = (_WORD *)(a7 + 4 * v9);
    *v30 = v28.i16[0];
    v30[1] = v29.i16[0];
    v31 = v9 | 1;
    v32 = (_WORD *)(a7 + 4 * (v9 | 1));
    *v32 = vextq_s8(v28, v28, 8uLL).u16[0];
    v32[1] = vextq_s8(v29, v29, 8uLL).u16[0];
    v52.val[0].i64[0] = -65536;
    v52.val[0].i64[1] = -65536;
    v51.val[0] = (int16x8_t)vandq_s8(v28, (int8x16_t)v52.val[0]);
    v53.val[0] = (int16x8_t)vandq_s8(v29, (int8x16_t)v52.val[0]);
    v33 = (int16x8_t)vzip1q_s64((int64x2_t)v51.val[0], (int64x2_t)v54.val[0]);
    v43 = (int16x8_t)vzip2q_s64((int64x2_t)v51.val[0], (int64x2_t)v54.val[0]);
    v42 = (int16x8_t)vzip2q_s64((int64x2_t)v34, (int64x2_t)v53.val[1]);
    v48 = (int16x8_t)vzip2q_s64((int64x2_t)v53.val[0], (int64x2_t)v51.val[1]);
    v46 = (int16x8_t)vzip1q_s64((int64x2_t)v53.val[0], (int64x2_t)v51.val[1]);
    v47 = (int16x8_t)vzip2q_s64((int64x2_t)v54.val[1], v45);
    v34.i64[1] = v53.val[1].i64[0];
    if (a5)
      v35 = (int8x16_t *)&unk_1EF1381F0;
    else
      v35 = (int8x16_t *)&unk_1EF138210;
    *((_BYTE *)a6 + v9) = sub_1B690CE90((int8x16_t *)(a3 + 32 * v9), v11, v10, *v12, *v35, v33, v34, v50);
    *((_BYTE *)a6 + v31) = sub_1B690CE90((int8x16_t *)(a3 + 32 * v31), v11, v10, *v12, *v35, v43, v42, v50);
    v36.i64[0] = v44;
    v36.i64[1] = v45.i64[0];
    *((_BYTE *)a6 + v9 + 4) = sub_1B690CE90((int8x16_t *)(a4 + 32 * v9), v11, v10, *v12, *v35, v46, v36, v50);
    result = sub_1B690CE90((int8x16_t *)(a4 + 32 * v31), v11, v10, *v12, *v35, v48, v47, v50);
    v13 = 0;
    *((_BYTE *)a6 + v31 + 4) = result;
    a2 += 64;
    v9 = 2;
  }
  while ((v49 & 1) != 0);
  return result;
}

BOOL sub_1B690D43C(uint64_t a1, int16x4_t *a2, int8x16_t *a3)
{
  uint32x4_t v3;
  uint32x4_t v4;
  const __int16 *v5;
  int16x4_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int16x4_t v9;
  int16x4_t v10;
  int16x8_t v11;
  uint16x8_t v12;
  int16x8_t v13;
  uint16x8_t v14;
  uint32x4_t v15;
  uint32x4_t v16;
  uint32x4_t v17;
  uint32x4_t v18;

  v3 = (uint32x4_t)vdupq_n_s32(~*(_DWORD *)a1);
  v4 = (uint32x4_t)vdupq_n_s32(2 * *(_DWORD *)(a1 + 4));
  v5 = *(const __int16 **)(a1 + 8);
  v6 = a2[1];
  v7 = (int32x2_t)vadd_s16(v6, *a2);
  v8 = (int32x2_t)vsub_s16(*a2, v6);
  v9 = (int16x4_t)vzip1_s32(v7, v8);
  v10 = (int16x4_t)vzip2_s32(v7, v8);
  *(int16x4_t *)v11.i8 = vadd_s16(v9, v10);
  v11.u64[1] = (unint64_t)vsub_s16(v9, v10);
  v12 = (uint16x8_t)vabsq_s16(v11);
  v13 = vcltzq_s16(v11);
  v14 = (uint16x8_t)vld1q_dup_s16(v5);
  v15 = vmlal_u16(v4, *(uint16x4_t *)v12.i8, *(uint16x4_t *)v14.i8);
  v16 = vmlal_high_u16(v4, v12, v14);
  v17 = vshlq_u32(v15, v3);
  v18 = vshlq_u32(v16, v3);
  *(uint16x4_t *)v16.i8 = vqmovn_u32(v17);
  *a3 = vqtbl1q_s8((int8x16_t)vsubq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_u32(*(uint16x4_t *)v16.i8, v18), (int8x16_t)v13), v13), (int8x16_t)xmmword_1B6918050);
  return vorr_s8((int8x8_t)vqmovn_u32(v18), *(int8x8_t *)v16.i8) != 0;
}

uint64_t sub_1B690D4CC(uint64_t result, uint64_t a2, int16x8_t *a3, int32x4_t a4, double a5, double a6, int32x4_t a7, uint64_t a8, unsigned __int32 a9)
{
  uint64_t v9;
  const __int16 *v10;
  uint16x8_t v11;
  int8x16_t v12;
  int16x8_t v13;
  int8x16_t v14;
  int8x16_t v15;
  char v16;
  char v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int32x4_t v23;
  int16x8_t v24;
  int8x16x2_t v25;
  int8x16x2_t v26;

  a4.i32[0] = 0;
  v9 = 0;
  v10 = (const __int16 *)(result + 24);
  v11 = (uint16x8_t)vld1q_dup_s16(v10);
  a7.i32[0] = a9;
  v12 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(a7, a4), 0);
  v13 = (int16x8_t)vshlq_u16(*(uint16x8_t *)*(_QWORD *)(result + 16), v11);
  v14 = vbslq_s8(v12, (int8x16_t)xmmword_1B6918070, (int8x16_t)xmmword_1B6918060);
  v15 = vbslq_s8(v12, (int8x16_t)xmmword_1B6918090, (int8x16_t)xmmword_1B6918080);
  v16 = 1;
  do
  {
    v17 = v16;
    v25 = *(int8x16x2_t *)(a2 + 32 * v9);
    v26 = *(int8x16x2_t *)(a2 + ((32 * v9) | 0x20));
    v18 = (int16x8_t)vqtbl2q_s8(v25, v14);
    v25.val[0] = vqtbl2q_s8(v25, v15);
    v25.val[1] = vqtbl2q_s8(v26, v14);
    v26.val[0] = vqtbl2q_s8(v26, v15);
    v26.val[1] = (int8x16_t)vmulq_s16(v13, v18);
    v25.val[1] = (int8x16_t)vmulq_s16(v13, (int16x8_t)v25.val[1]);
    v25.val[0] = (int8x16_t)vmulq_s16(v13, (int16x8_t)v25.val[0]);
    v26.val[0] = (int8x16_t)vmulq_s16(v13, (int16x8_t)v26.val[0]);
    v19 = (int16x8_t)vzip2q_s64((int64x2_t)v26.val[1], (int64x2_t)v25.val[1]);
    v20 = (int16x8_t)vzip2q_s64((int64x2_t)v25.val[0], (int64x2_t)v26.val[0]);
    v26.val[1].i64[1] = v25.val[1].i64[0];
    v25.val[0].i64[1] = v26.val[0].i64[0];
    v25.val[1] = (int8x16_t)vaddq_s16((int16x8_t)v25.val[0], (int16x8_t)v26.val[1]);
    v25.val[0] = (int8x16_t)vsubq_s16((int16x8_t)v26.val[1], (int16x8_t)v25.val[0]);
    v26.val[0] = (int8x16_t)vsubq_s16(vshrq_n_s16(v19, 1uLL), v20);
    v21 = vsraq_n_s16(v19, v20, 1uLL);
    v26.val[1] = (int8x16_t)vaddq_s16(v21, (int16x8_t)v25.val[1]);
    v25.val[1] = (int8x16_t)vsubq_s16((int16x8_t)v25.val[1], v21);
    v22 = vaddq_s16((int16x8_t)v26.val[0], (int16x8_t)v25.val[0]);
    v25.val[0] = (int8x16_t)vsubq_s16((int16x8_t)v25.val[0], (int16x8_t)v26.val[0]);
    v26.val[0] = (int8x16_t)vtrn1q_s16((int16x8_t)v26.val[1], v22);
    v26.val[1] = (int8x16_t)vtrn2q_s16((int16x8_t)v26.val[1], v22);
    v23 = (int32x4_t)vtrn2q_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
    v25.val[0] = (int8x16_t)vtrn1q_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
    v25.val[1] = (int8x16_t)vtrn1q_s32((int32x4_t)v26.val[0], (int32x4_t)v25.val[0]);
    v25.val[0] = (int8x16_t)vtrn2q_s32((int32x4_t)v26.val[0], (int32x4_t)v25.val[0]);
    v26.val[0] = (int8x16_t)vtrn1q_s32((int32x4_t)v26.val[1], v23);
    v26.val[1] = (int8x16_t)vtrn2q_s32((int32x4_t)v26.val[1], v23);
    v24 = vaddq_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]);
    v25.val[0] = (int8x16_t)vsubq_s16((int16x8_t)v25.val[1], (int16x8_t)v25.val[0]);
    v25.val[1] = (int8x16_t)vsubq_s16(vshrq_n_s16((int16x8_t)v26.val[0], 1uLL), (int16x8_t)v26.val[1]);
    v26.val[0] = (int8x16_t)vsraq_n_s16((int16x8_t)v26.val[0], (int16x8_t)v26.val[1], 1uLL);
    *a3 = vrshrq_n_s16(vaddq_s16((int16x8_t)v26.val[0], v24), 6uLL);
    a3[2] = vrshrq_n_s16(vaddq_s16((int16x8_t)v25.val[1], (int16x8_t)v25.val[0]), 6uLL);
    a3[4] = vrshrq_n_s16(vsubq_s16((int16x8_t)v25.val[0], (int16x8_t)v25.val[1]), 6uLL);
    a3[6] = vrshrq_n_s16(vsubq_s16(v24, (int16x8_t)v26.val[0]), 6uLL);
    a3 += 8;
    v9 = 2;
    v16 = 0;
  }
  while ((v17 & 1) != 0);
  return result;
}

uint64_t sub_1B690D608(int16x8_t *a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  int16x8_t *v6;

  v4 = 0;
  v5 = 0;
  v6 = a1;
  do
  {
    if (*((_BYTE *)a2 + v4))
      v5 = sub_1B690D694(v6, 0) + v5;
    ++v4;
    v6 += 2;
  }
  while (v4 != 4);
  if ((int)v5 < 5)
  {
    v5 = 0;
    a1[6] = 0u;
    a1[7] = 0u;
    a1[4] = 0u;
    a1[5] = 0u;
    a1[2] = 0u;
    a1[3] = 0u;
    *a1 = 0u;
    a1[1] = 0u;
    *a2 = 0;
  }
  return v5;
}

uint64_t sub_1B690D694(int16x8_t *a1, int a2)
{
  int8x16_t v2;
  int8x16_t v3;
  uint64_t result;
  int16x8_t v5;
  unsigned int v6;
  unsigned int v7;
  char v8;
  int i;

  v2 = (int8x16_t)vabsq_s16(*a1);
  v3 = (int8x16_t)vabsq_s16(a1[1]);
  if ((vmaxvq_u16((uint16x8_t)vorrq_s8(v3, v2)) & 0xFFFE) != 0)
    return 0x100000;
  v5 = (int16x8_t)vorrq_s8((int8x16_t)vshlq_u16((uint16x8_t)v3, (uint16x8_t)xmmword_1B6917680), (int8x16_t)vshlq_u16((uint16x8_t)v2, (uint16x8_t)xmmword_1B6917670));
  v5.i16[0] = vaddvq_s16(v5);
  v6 = ((v5.i32[0] << 16) | 0x8000) << a2;
  v7 = __clz(v6);
  v8 = v7 + 1;
  result = 0;
  for (i = 16 - a2 - (v7 + 1); i >= 0; i -= v7 + 1)
  {
    v6 <<= v8;
    result = result + byte_1B693D9DF[v7];
    v7 = __clz(v6);
    v8 = v7 + 1;
  }
  return result;
}

uint64_t sub_1B690D730(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  _BOOL4 v18;

  if (a4 | a3)
  {
    if (a3)
    {
      v9 = sub_1B690D694((int16x8_t *)a1, 1);
      v10 = sub_1B690D694((int16x8_t *)(a1 + 32), 1) + v9;
      v11 = sub_1B690D694((int16x8_t *)(a1 + 64), 1);
      v12 = v10 + v11 + sub_1B690D694((int16x8_t *)(a1 + 96), 1);
      if (v12 <= 3)
      {
        *(_OWORD *)(a1 + 96) = 0u;
        *(_OWORD *)(a1 + 112) = 0u;
        *(_OWORD *)(a1 + 64) = 0u;
        *(_OWORD *)(a1 + 80) = 0u;
        *(_OWORD *)(a1 + 32) = 0u;
        *(_OWORD *)(a1 + 48) = 0u;
        *(_OWORD *)a1 = 0u;
        *(_OWORD *)(a1 + 16) = 0u;
      }
      v13 = v12 > 3;
      if (a4)
        goto LABEL_6;
    }
    else
    {
      v13 = 0;
      if (a4)
      {
LABEL_6:
        v14 = sub_1B690D694((int16x8_t *)a2, 1);
        v15 = sub_1B690D694((int16x8_t *)(a2 + 32), 1) + v14;
        v16 = sub_1B690D694((int16x8_t *)(a2 + 64), 1);
        v17 = v15 + v16 + sub_1B690D694((int16x8_t *)(a2 + 96), 1);
        if (v17 <= 3)
        {
          *(_OWORD *)(a2 + 96) = 0u;
          *(_OWORD *)(a2 + 112) = 0u;
          *(_OWORD *)(a2 + 64) = 0u;
          *(_OWORD *)(a2 + 80) = 0u;
          *(_OWORD *)(a2 + 32) = 0u;
          *(_OWORD *)(a2 + 48) = 0u;
          *(_OWORD *)a2 = 0u;
          *(_OWORD *)(a2 + 16) = 0u;
        }
        v18 = v17 > 3;
        goto LABEL_11;
      }
    }
    v18 = 0;
LABEL_11:
    if (v18 || v13)
      return 2;
    else
      return a5;
  }
  return a5;
}

BOOL sub_1B690D868(int16x8_t *a1, int16x8_t *a2, uint16x8_t *a3, int a4, int a5)
{
  uint32x4_t v5;
  uint32x4_t v6;
  int8x16_t v7;
  unsigned int v8;
  int16x8_t v9;
  int16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  uint32x4_t v17;
  uint32x4_t v18;
  uint32x4_t v19;
  uint32x4_t v20;
  int8x16_t v21;
  int8x16_t v22;

  v5 = (uint32x4_t)vdupq_n_s32(2 * a4);
  v6 = (uint32x4_t)vdupq_n_s32(~a5);
  v7 = 0uLL;
  v8 = -2;
  do
  {
    v9 = *a2;
    v10 = a2[1];
    a2 += 2;
    v11 = *a3;
    v12 = a3[1];
    a3 += 2;
    v13 = (uint16x8_t)vabsq_s16(v9);
    v14 = (uint16x8_t)vabsq_s16(v10);
    v15 = vcltzq_s16(v9);
    v16 = vcltzq_s16(v10);
    v17 = vmlal_u16(v5, *(uint16x4_t *)v13.i8, *(uint16x4_t *)v11.i8);
    v18 = vmlal_high_u16(v5, v13, v11);
    v19 = vmlal_u16(v5, *(uint16x4_t *)v14.i8, *(uint16x4_t *)v12.i8);
    v20 = vmlal_high_u16(v5, v14, v12);
    v21 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v17, v6)), vshlq_u32(v18, v6));
    v22 = (int8x16_t)vqmovn_high_u32(vqmovn_u32(vshlq_u32(v19, v6)), vshlq_u32(v20, v6));
    v7 = vorrq_s8(vorrq_s8(v21, v7), v22);
    v8 += 2;
    *a1 = vsubq_s16((int16x8_t)veorq_s8(v21, (int8x16_t)v15), v15);
    a1[1] = vsubq_s16((int16x8_t)veorq_s8(v22, (int8x16_t)v16), v16);
    a1 += 2;
  }
  while (v8 < 6);
  v5.i16[0] = vmaxvq_u16((uint16x8_t)v7);
  return v5.i32[0] != 0;
}

int16x8_t *sub_1B690D914(int16x8_t *result, int16x8_t *a2, int16x8_t *a3, int a4)
{
  int32x4_t v4;
  unsigned int v5;
  int16x8_t v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;

  v4 = vdupq_n_s32(a4 - 6);
  v5 = -2;
  do
  {
    v6 = *a2;
    v7 = a2[1];
    a2 += 2;
    v8 = *a3;
    v9 = a3[1];
    a3 += 2;
    v10 = vshlq_n_s16(v8, 4uLL);
    v11 = vshlq_n_s16(v9, 4uLL);
    v5 += 2;
    *result = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v10.i8), v4)), vrshlq_s32(vmull_high_s16(v6, v10), v4));
    result[1] = vqmovn_high_s32(vqmovn_s32(vrshlq_s32(vmull_s16(*(int16x4_t *)v7.i8, *(int16x4_t *)v11.i8), v4)), vrshlq_s32(vmull_high_s16(v7, v11), v4));
    result += 2;
  }
  while (v5 < 6);
  return result;
}

_OWORD *sub_1B690D974(_OWORD *result, int a2, _OWORD *a3, int a4)
{
  int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = a4 + 4;
  do
  {
    v5 = a3[1];
    v6 = a3[2];
    v7 = a3[3];
    *result = *a3;
    *(_OWORD *)((char *)result + a2) = v5;
    *(_OWORD *)((char *)result + 2 * a2) = v6;
    *(_OWORD *)((char *)result + 3 * a2) = v7;
    a3 += 4;
    result = (_OWORD *)((char *)result + 4 * a2);
    v4 -= 4;
  }
  while (v4 > 4);
  return result;
}

_QWORD *sub_1B690D9B8(_QWORD *result, int a2, int8x16_t *a3, int a4)
{
  int v4;
  int8x16_t v5;
  int8x16_t v6;

  v4 = a4 + 4;
  do
  {
    v5 = *a3;
    v6 = a3[1];
    a3 += 2;
    *result = v5.i64[0];
    *(_QWORD *)((char *)result + a2) = vextq_s8(v5, v5, 8uLL).u64[0];
    *(_QWORD *)((char *)result + 2 * a2) = v6.i64[0];
    *(_QWORD *)((char *)result + 3 * a2) = vextq_s8(v6, v6, 8uLL).u64[0];
    result = (_QWORD *)((char *)result + 4 * a2);
    v4 -= 4;
  }
  while (v4 > 4);
  return result;
}

uint16x8_t sub_1B690D9FC(uint16x8_t *a1, const float *a2, int a3)
{
  uint64_t v3;
  const float *v4;
  const float *v5;
  const float *v6;
  uint8x8_t v7;
  uint8x8_t v8;
  uint8x8_t v9;
  uint8x8_t v10;
  uint16x8_t result;

  v3 = 3 * a3;
  v4 = (const float *)((char *)a2 + a3);
  v5 = (const float *)((char *)a2 + 2 * a3);
  v7 = (uint8x8_t)vld1_dup_f32(a2);
  v6 = (const float *)((char *)a2 + v3);
  v8 = (uint8x8_t)vld1_dup_f32(v4);
  v9 = (uint8x8_t)vld1_dup_f32(v5);
  v10 = (uint8x8_t)vld1_dup_f32(v6);
  *a1 = vmovl_u8(v7);
  a1[1] = vmovl_u8(v8);
  result = vmovl_u8(v10);
  a1[2] = vmovl_u8(v9);
  a1[3] = result;
  return result;
}

_OWORD *sub_1B690DA38(_OWORD *result, int a2, _OWORD *a3, int a4)
{
  unsigned int i;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  for (i = 20; i > 4; i -= 4)
  {
    v5 = *(_OWORD *)((char *)a3 + a4);
    v6 = *(_OWORD *)((char *)a3 + 2 * a4);
    v7 = *(_OWORD *)((char *)a3 + 3 * a4);
    *result = *a3;
    *(_OWORD *)((char *)result + a2) = v5;
    *(_OWORD *)((char *)result + 2 * a2) = v6;
    *(_OWORD *)((char *)result + 3 * a2) = v7;
    a3 = (_OWORD *)((char *)a3 + 4 * a4);
    result = (_OWORD *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x16_t *sub_1B690DA94(uint8x16_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1B690DA9C(a1, a2, a3, a4, a5, 16);
}

uint8x16_t *sub_1B690DA9C(uint8x16_t *result, int a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8x16_t v14;
  uint8x16_t v15;
  uint8x16_t v16;

  v6 = 0;
  v7 = 3 * a4;
  v8 = 4 * a4;
  v9 = a6 + 4;
  v10 = a5 + 2 * a4;
  v11 = a5 + a4;
  v12 = a3 + 2 * a4;
  v13 = a3 + a4;
  do
  {
    v14 = vrhaddq_u8(*(uint8x16_t *)(v13 + v6), *(uint8x16_t *)(v11 + v6));
    v15 = vrhaddq_u8(*(uint8x16_t *)(v12 + v6), *(uint8x16_t *)(v10 + v6));
    v16 = vrhaddq_u8(*(uint8x16_t *)(a3 + v7 + v6), *(uint8x16_t *)(a5 + v7 + v6));
    *result = vrhaddq_u8(*(uint8x16_t *)(a3 + v6), *(uint8x16_t *)(a5 + v6));
    *(uint8x16_t *)((char *)result + a2) = v14;
    *(uint8x16_t *)((char *)result + 2 * a2) = v15;
    *(uint8x16_t *)((char *)result + 3 * a2) = v16;
    result = (uint8x16_t *)((char *)result + 4 * a2);
    v9 -= 4;
    v6 += v8;
  }
  while (v9 > 4);
  return result;
}

_OWORD *sub_1B690DB34(_OWORD *result, int a2, _OWORD *a3, int a4)
{
  unsigned int i;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  for (i = 12; i > 4; i -= 4)
  {
    v5 = *(_OWORD *)((char *)a3 + a4);
    v6 = *(_OWORD *)((char *)a3 + 2 * a4);
    v7 = *(_OWORD *)((char *)a3 + 3 * a4);
    *result = *a3;
    *(_OWORD *)((char *)result + a2) = v5;
    *(_OWORD *)((char *)result + 2 * a2) = v6;
    *(_OWORD *)((char *)result + 3 * a2) = v7;
    a3 = (_OWORD *)((char *)a3 + 4 * a4);
    result = (_OWORD *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x16_t *sub_1B690DB90(uint8x16_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1B690DA9C(a1, a2, a3, a4, a5, 8);
}

_QWORD *sub_1B690DB98(_QWORD *result, int a2, _QWORD *a3, int a4)
{
  unsigned int i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  for (i = 20; i > 4; i -= 4)
  {
    v5 = *(_QWORD *)((char *)a3 + a4);
    v6 = *(_QWORD *)((char *)a3 + 2 * a4);
    v7 = *(_QWORD *)((char *)a3 + 3 * a4);
    *result = *a3;
    *(_QWORD *)((char *)result + a2) = v5;
    *(_QWORD *)((char *)result + 2 * a2) = v6;
    *(_QWORD *)((char *)result + 3 * a2) = v7;
    a3 = (_QWORD *)((char *)a3 + 4 * a4);
    result = (_QWORD *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x8_t *sub_1B690DBF4(uint8x8_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1B690DBFC(a1, a2, a3, a4, a5, 16);
}

uint8x8_t *sub_1B690DBFC(uint8x8_t *result, int a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8x8_t v14;
  uint8x8_t v15;
  uint8x8_t v16;

  v6 = 0;
  v7 = 3 * a4;
  v8 = 4 * a4;
  v9 = a6 + 4;
  v10 = a5 + 2 * a4;
  v11 = a5 + a4;
  v12 = a3 + 2 * a4;
  v13 = a3 + a4;
  do
  {
    v14 = vrhadd_u8(*(uint8x8_t *)(v13 + v6), *(uint8x8_t *)(v11 + v6));
    v15 = vrhadd_u8(*(uint8x8_t *)(v12 + v6), *(uint8x8_t *)(v10 + v6));
    v16 = vrhadd_u8(*(uint8x8_t *)(a3 + v7 + v6), *(uint8x8_t *)(a5 + v7 + v6));
    *result = vrhadd_u8(*(uint8x8_t *)(a3 + v6), *(uint8x8_t *)(a5 + v6));
    *(uint8x8_t *)((char *)result + a2) = v14;
    *(uint8x8_t *)((char *)result + 2 * a2) = v15;
    *(uint8x8_t *)((char *)result + 3 * a2) = v16;
    result = (uint8x8_t *)((char *)result + 4 * a2);
    v9 -= 4;
    v6 += v8;
  }
  while (v9 > 4);
  return result;
}

_QWORD *sub_1B690DC94(_QWORD *result, int a2, _QWORD *a3, int a4)
{
  unsigned int i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  for (i = 12; i > 4; i -= 4)
  {
    v5 = *(_QWORD *)((char *)a3 + a4);
    v6 = *(_QWORD *)((char *)a3 + 2 * a4);
    v7 = *(_QWORD *)((char *)a3 + 3 * a4);
    *result = *a3;
    *(_QWORD *)((char *)result + a2) = v5;
    *(_QWORD *)((char *)result + 2 * a2) = v6;
    *(_QWORD *)((char *)result + 3 * a2) = v7;
    a3 = (_QWORD *)((char *)a3 + 4 * a4);
    result = (_QWORD *)((char *)result + 4 * a2);
  }
  return result;
}

uint8x8_t *sub_1B690DCF0(uint8x8_t *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  return sub_1B690DBFC(a1, a2, a3, a4, a5, 8);
}

int8x16_t *sub_1B690DCF8(int8x16_t *result, int a2, int8x16_t *a3, int a4, int a5, char a6, char a7, double a8, double a9, double a10, int8x8_t a11, double a12, int8x8_t a13, int8x8_t a14, int8x8_t a15)
{
  int v15;
  int v16;
  uint8x16_t v17;
  int8x16_t *v18;
  uint8x16_t v19;
  uint8x16_t v20;
  uint8x16_t v21;
  int v22;
  uint8x16_t v23;
  uint8x16_t v24;
  uint8x16_t v25;
  uint8x16_t v26;
  int8x16_t *v27;
  int8x16_t *v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;

  v15 = 8 - (a6 & 7);
  v16 = 8 - (a7 & 7);
  a11.i32[0] = v16 * v15;
  a13.i32[0] = v16 * (a6 & 7);
  a14.i32[0] = v15 * (a7 & 7);
  a15.i32[0] = (a7 & 7) * (a6 & 7);
  v17 = *(uint8x16_t *)a3;
  v18 = (int8x16_t *)((char *)a3 + a4);
  v19 = *(uint8x16_t *)v18;
  v20 = (uint8x16_t)vextq_s8(*a3, a3[1], 2uLL);
  v21 = (uint8x16_t)vextq_s8(*v18, v18[1], 2uLL);
  v22 = a5 + 2;
  v23 = (uint8x16_t)vdupq_lane_s8(a11, 0);
  v24 = (uint8x16_t)vdupq_lane_s8(a13, 0);
  v25 = (uint8x16_t)vdupq_lane_s8(a14, 0);
  v26 = (uint8x16_t)vdupq_lane_s8(a15, 0);
  do
  {
    v27 = (int8x16_t *)((char *)a3 + 2 * a4);
    v28 = (int8x16_t *)((char *)a3 + 3 * a4);
    a3 = (int8x16_t *)((char *)a3 + a4 + (uint64_t)a4);
    v29 = (int16x8_t)vmlal_u8(vmlal_u8(vmlal_u8(vmull_u8(*(uint8x8_t *)v20.i8, *(uint8x8_t *)v24.i8), *(uint8x8_t *)v17.i8, *(uint8x8_t *)v23.i8), *(uint8x8_t *)v19.i8, *(uint8x8_t *)v25.i8), *(uint8x8_t *)v21.i8, *(uint8x8_t *)v26.i8);
    v30 = (int16x8_t)vmlal_high_u8(vmlal_high_u8(vmlal_high_u8(vmull_high_u8(v20, v24), v17, v23), v19, v25), v21, v26);
    v17 = *(uint8x16_t *)v27;
    v20 = (uint8x16_t)vextq_s8(*v27, v27[1], 2uLL);
    v31 = (int16x8_t)vmlal_u8(vmlal_u8(vmlal_u8(vmull_u8(*(uint8x8_t *)v21.i8, *(uint8x8_t *)v24.i8), *(uint8x8_t *)v19.i8, *(uint8x8_t *)v23.i8), *(uint8x8_t *)v27->i8, *(uint8x8_t *)v25.i8), *(uint8x8_t *)v20.i8, *(uint8x8_t *)v26.i8);
    v32 = (int16x8_t)vmlal_high_u8(vmlal_high_u8(vmlal_high_u8(vmull_high_u8(v21, v24), v19, v23), *(uint8x16_t *)v27, v25), v20, v26);
    v19 = *(uint8x16_t *)v28;
    v21 = (uint8x16_t)vextq_s8(*v28, v28[1], 2uLL);
    *result = vrshrn_high_n_s16(vrshrn_n_s16(v29, 6uLL), v30, 6uLL);
    *(int8x16_t *)((char *)result + a2) = vrshrn_high_n_s16(vrshrn_n_s16(v31, 6uLL), v32, 6uLL);
    result = (int8x16_t *)((char *)result + a2 + (uint64_t)a2);
    v22 -= 2;
  }
  while (v22 > 2);
  return result;
}

uint8x8_t *sub_1B690DDF4(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  int16x8_t v8;
  int16x8_t v9;
  unsigned int v10;
  uint8x16_t v11;
  uint8x16_t *v12;
  uint8x16_t v13;

  a8.i32[0] = a3;
  v8 = vdupq_n_s16(-a5);
  v9 = vdupq_n_s16(a4);
  v10 = 18;
  v11 = (uint8x16_t)vdupq_lane_s8(a8, 0);
  do
  {
    v12 = (uint8x16_t *)((char *)result + a2);
    v13 = *v12;
    *(int8x16_t *)result->i8 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(*(uint8x16_t *)result->i8, v11), v8), v9));
    result = (uint8x8_t *)&v12->i8[a2];
    *(int8x16_t *)v12 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v11), v8), v9));
    v10 -= 2;
  }
  while (v10 > 2);
  return result;
}

int8x16_t *sub_1B690DE78(int8x16_t *result, uint8x16_t *a2, int a3, __int32 a4, unsigned int a5, int a6, double a7, double a8, int8x8_t a9)
{
  int16x8_t v9;
  int16x8_t v10;
  unsigned int v11;
  uint8x16_t v12;
  uint8x16_t v13;
  uint8x16_t v14;

  a9.i32[0] = a4;
  v9 = vdupq_n_s16(-a6);
  v10 = vdupq_n_s16(a5);
  v11 = 18;
  v12 = (uint8x16_t)vdupq_lane_s8(a9, 0);
  do
  {
    v13 = *a2;
    v14 = *(uint8x16_t *)((char *)a2 + a3);
    a2 = (uint8x16_t *)((char *)a2 + a3 + (uint64_t)a3);
    *result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v12), v9), v10));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v14.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v14, v12), v9), v10));
    result += 2;
    v11 -= 2;
  }
  while (v11 > 2);
  return result;
}

int8x16_t *sub_1B690DEF8(int8x16_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10;
  int16x8_t v11;
  int16x8_t v12;
  unsigned int v13;
  uint8x16_t v14;
  uint8x16_t v15;
  uint8x16_t v16;

  v10 = 0;
  a10.i32[0] = a5;
  v11 = vdupq_n_s16(-a7);
  v12 = vdupq_n_s16(a6);
  v13 = 18;
  v14 = (uint8x16_t)vdupq_lane_s8(a10, 0);
  do
  {
    v15 = vrhaddq_u8(*(uint8x16_t *)(a2 + v10), *(uint8x16_t *)(a3 + v10));
    v16 = vrhaddq_u8(*(uint8x16_t *)(a2 + a4 + v10), *(uint8x16_t *)(a3 + a4 + v10));
    *result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v15.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v15, v14), v11), v12));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v16, v14), v11), v12));
    result += 2;
    v13 -= 2;
    v10 += 2 * a4;
  }
  while (v13 > 2);
  return result;
}

uint8x8_t *sub_1B690DF90(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  int16x8_t v8;
  int16x8_t v9;
  unsigned int v10;
  uint8x16_t v11;
  uint8x16_t *v12;
  uint8x16_t v13;

  a8.i32[0] = a3;
  v8 = vdupq_n_s16(-a5);
  v9 = vdupq_n_s16(a4);
  v10 = 10;
  v11 = (uint8x16_t)vdupq_lane_s8(a8, 0);
  do
  {
    v12 = (uint8x16_t *)((char *)result + a2);
    v13 = *v12;
    *(int8x16_t *)result->i8 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(*(uint8x16_t *)result->i8, v11), v8), v9));
    result = (uint8x8_t *)&v12->i8[a2];
    *(int8x16_t *)v12 = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v11.i8), v8), v9)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v11), v8), v9));
    v10 -= 2;
  }
  while (v10 > 2);
  return result;
}

int8x16_t *sub_1B690E014(int8x16_t *result, uint8x16_t *a2, int a3, __int32 a4, unsigned int a5, int a6, double a7, double a8, int8x8_t a9)
{
  int16x8_t v9;
  int16x8_t v10;
  unsigned int v11;
  uint8x16_t v12;
  uint8x16_t v13;
  uint8x16_t v14;

  a9.i32[0] = a4;
  v9 = vdupq_n_s16(-a6);
  v10 = vdupq_n_s16(a5);
  v11 = 10;
  v12 = (uint8x16_t)vdupq_lane_s8(a9, 0);
  do
  {
    v13 = *a2;
    v14 = *(uint8x16_t *)((char *)a2 + a3);
    a2 = (uint8x16_t *)((char *)a2 + a3 + (uint64_t)a3);
    *result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v13, v12), v9), v10));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v14.i8, *(uint8x8_t *)v12.i8), v9), v10)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v14, v12), v9), v10));
    result += 2;
    v11 -= 2;
  }
  while (v11 > 2);
  return result;
}

int8x16_t *sub_1B690E094(int8x16_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10;
  int16x8_t v11;
  int16x8_t v12;
  unsigned int v13;
  uint8x16_t v14;
  uint8x16_t v15;
  uint8x16_t v16;

  v10 = 0;
  a10.i32[0] = a5;
  v11 = vdupq_n_s16(-a7);
  v12 = vdupq_n_s16(a6);
  v13 = 10;
  v14 = (uint8x16_t)vdupq_lane_s8(a10, 0);
  do
  {
    v15 = vrhaddq_u8(*(uint8x16_t *)(a2 + v10), *(uint8x16_t *)(a3 + v10));
    v16 = vrhaddq_u8(*(uint8x16_t *)(a2 + a4 + v10), *(uint8x16_t *)(a3 + a4 + v10));
    *result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v15.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v15, v14), v11), v12));
    result[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v14.i8), v11), v12)), vaddq_s16(vrshlq_s16((int16x8_t)vmull_high_u8(v16, v14), v11), v12));
    result += 2;
    v13 -= 2;
    v10 += 2 * a4;
  }
  while (v13 > 2);
  return result;
}

uint8x8_t *sub_1B690E12C(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  int16x8_t v8;
  int16x8_t v9;
  unsigned int v10;
  uint8x8_t v11;
  int8x8_t v12;
  int8x8_t v13;
  int8x8_t v14;

  a8.i32[0] = a3;
  v8 = vdupq_n_s16(-a5);
  v9 = vdupq_n_s16(a4);
  v10 = 20;
  v11 = (uint8x8_t)vdup_lane_s8(a8, 0);
  do
  {
    v12 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + a2), v11), v8), v9));
    v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 2 * a2), v11), v8), v9));
    v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 3 * a2), v11), v8), v9));
    *result = (uint8x8_t)vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, v11), v8), v9));
    *(int8x8_t *)((char *)result + a2) = v12;
    *(int8x8_t *)((char *)result + 2 * a2) = v13;
    *(int8x8_t *)((char *)result + 3 * a2) = v14;
    result = (uint8x8_t *)((char *)result + 2 * a2 + a2 + a2);
    v10 -= 4;
  }
  while (v10 > 4);
  return result;
}

int8x8_t *sub_1B690E1D0(int8x8_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10;
  int16x8_t v11;
  int16x8_t v12;
  uint8x8_t v13;
  unsigned int i;
  uint8x8_t *v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  int8x8_t v21;
  int8x8_t v22;

  v10 = 0;
  v11 = vdupq_n_s16(-a7);
  v12 = vdupq_n_s16(a6);
  a10.i32[0] = a5;
  v13 = (uint8x8_t)vdup_lane_s8(a10, 0);
  for (i = 20; i > 4; i -= 4)
  {
    v15 = (uint8x8_t *)(a2 + v10 + a4);
    v16 = *v15;
    v17 = (uint8x8_t *)((char *)v15 + a4);
    v18 = (uint8x8_t *)(a3 + v10 + a4);
    v19 = *v18;
    v20 = (uint8x8_t *)((char *)v18 + a4);
    v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*v17, *v20), v13), v11), v12));
    v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)((char *)v17 + a4), *(uint8x8_t *)((char *)v20 + a4)), v13), v11), v12));
    *result = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)(a2 + v10), *(uint8x8_t *)(a3 + v10)), v13), v11), v12));
    result[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(v16, v19), v13), v11), v12));
    result[2] = v21;
    result[3] = v22;
    v10 += 4 * a4;
    result += 4;
  }
  return result;
}

uint8x8_t *sub_1B690E29C(uint8x8_t *result, int a2, __int32 a3, unsigned int a4, int a5, double a6, double a7, int8x8_t a8)
{
  int16x8_t v8;
  int16x8_t v9;
  unsigned int v10;
  uint8x8_t v11;
  int8x8_t v12;
  int8x8_t v13;
  int8x8_t v14;

  a8.i32[0] = a3;
  v8 = vdupq_n_s16(-a5);
  v9 = vdupq_n_s16(a4);
  v10 = 12;
  v11 = (uint8x8_t)vdup_lane_s8(a8, 0);
  do
  {
    v12 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + a2), v11), v8), v9));
    v13 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 2 * a2), v11), v8), v9));
    v14 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*(uint8x8_t *)((char *)result + 3 * a2), v11), v8), v9));
    *result = (uint8x8_t)vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(*result, v11), v8), v9));
    *(int8x8_t *)((char *)result + a2) = v12;
    *(int8x8_t *)((char *)result + 2 * a2) = v13;
    *(int8x8_t *)((char *)result + 3 * a2) = v14;
    result = (uint8x8_t *)((char *)result + 2 * a2 + a2 + a2);
    v10 -= 4;
  }
  while (v10 > 4);
  return result;
}

int8x8_t *sub_1B690E340(int8x8_t *result, uint64_t a2, uint64_t a3, int a4, __int32 a5, unsigned int a6, int a7, double a8, double a9, int8x8_t a10)
{
  uint64_t v10;
  int16x8_t v11;
  int16x8_t v12;
  uint8x8_t v13;
  unsigned int i;
  uint8x8_t *v15;
  uint8x8_t v16;
  uint8x8_t *v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  int8x8_t v21;
  int8x8_t v22;

  v10 = 0;
  v11 = vdupq_n_s16(-a7);
  v12 = vdupq_n_s16(a6);
  a10.i32[0] = a5;
  v13 = (uint8x8_t)vdup_lane_s8(a10, 0);
  for (i = 12; i > 4; i -= 4)
  {
    v15 = (uint8x8_t *)(a2 + v10 + a4);
    v16 = *v15;
    v17 = (uint8x8_t *)((char *)v15 + a4);
    v18 = (uint8x8_t *)(a3 + v10 + a4);
    v19 = *v18;
    v20 = (uint8x8_t *)((char *)v18 + a4);
    v21 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*v17, *v20), v13), v11), v12));
    v22 = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)((char *)v17 + a4), *(uint8x8_t *)((char *)v20 + a4)), v13), v11), v12));
    *result = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(*(uint8x8_t *)(a2 + v10), *(uint8x8_t *)(a3 + v10)), v13), v11), v12));
    result[1] = vqmovun_s16(vaddq_s16(vrshlq_s16((int16x8_t)vmull_u8(vrhadd_u8(v16, v19), v13), v11), v12));
    result[2] = v21;
    result[3] = v22;
    v10 += 4 * a4;
    result += 4;
  }
  return result;
}

uint32x2_t sub_1B690E40C(int16x8_t *a1, _DWORD *a2, _DWORD *a3)
{
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
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int16x8_t v22;
  uint32x2_t result;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = vaddq_s16(v3, *a1);
  v7 = vsubq_s16(*a1, v3);
  v8 = vaddq_s16(v5, v4);
  v9 = vsubq_s16(v4, v5);
  v10 = vaddq_s16(v8, v6);
  v11 = vsubq_s16(v6, v8);
  v12 = vaddq_s16(v9, v7);
  v13 = vsubq_s16(v7, v9);
  v14 = vtrn1q_s16(v10, v12);
  v15 = vtrn2q_s16(v10, v12);
  v16 = vtrn1q_s16(v11, v13);
  v17 = vtrn2q_s16(v11, v13);
  v18 = (int32x4_t)vaddq_s16(v15, v14);
  v19 = (int32x4_t)vsubq_s16(v14, v15);
  v20 = (int32x4_t)vaddq_s16(v17, v16);
  v21 = (int32x4_t)vsubq_s16(v16, v17);
  v22 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v19, v21)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v19, v21))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v18, v20)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v18, v20))));
  result = vpaddl_u16((uint16x4_t)*(_OWORD *)&vpaddq_s16(v22, v22));
  *a2 = result.i32[0];
  *a3 = result.i32[1];
  return result;
}

uint64_t sub_1B690E494(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1B690E49C(a1, a2, a3, a4, 16);
}

uint64_t sub_1B690E49C(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4, int a5)
{
  int v5;
  int32x4_t v6;
  int32x4_t v7;
  uint8x16_t v8;
  uint8x16_t *v9;
  uint8x16_t v10;
  uint8x8_t *v11;
  uint8x16_t v12;
  uint8x16_t *v13;
  uint8x16_t v14;
  uint8x8_t *v15;
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
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  uint16x8_t v40;
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
  int32x4_t v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  uint16x8_t v57;

  v5 = a5 + 4;
  v6 = 0uLL;
  v7 = 0uLL;
  do
  {
    v8 = *(uint8x16_t *)&a1->i8[a2];
    v9 = (uint8x16_t *)((char *)a1 + a2 + a2);
    v10 = *v9;
    v11 = (uint8x8_t *)&v9->i8[a2];
    v12 = *(uint8x16_t *)&a3->i8[a4];
    v13 = (uint8x16_t *)((char *)a3 + a4 + a4);
    v14 = *v13;
    v15 = (uint8x8_t *)&v13->i8[a4];
    v16 = (int16x8_t)vsubl_u8(*a1, *a3);
    v17 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v8.i8, *(uint8x8_t *)v12.i8);
    v18 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v10.i8, *(uint8x8_t *)v14.i8);
    v19 = (int16x8_t)vsubl_u8(*v11, *v15);
    v20 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
    v21 = (int16x8_t)vsubl_high_u8(v8, v12);
    v22 = (int16x8_t)vsubl_high_u8(v10, v14);
    v23 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v11->i8, *(uint8x16_t *)v15->i8);
    v24 = vaddq_s16(v17, v16);
    v25 = vsubq_s16(v16, v17);
    v26 = vaddq_s16(v19, v18);
    v27 = vsubq_s16(v18, v19);
    v28 = vaddq_s16(v26, v24);
    v29 = vsubq_s16(v24, v26);
    v30 = vaddq_s16(v27, v25);
    v31 = vsubq_s16(v25, v27);
    v32 = vtrn1q_s16(v28, v30);
    v33 = vtrn2q_s16(v28, v30);
    v34 = vtrn1q_s16(v29, v31);
    v35 = vtrn2q_s16(v29, v31);
    v36 = (int32x4_t)vaddq_s16(v33, v32);
    v37 = (int32x4_t)vsubq_s16(v32, v33);
    v38 = (int32x4_t)vaddq_s16(v35, v34);
    v39 = (int32x4_t)vsubq_s16(v34, v35);
    v40 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v37, v39)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v37, v39))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v36, v38)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v36, v38))));
    v41 = vaddq_s16(v21, v20);
    v42 = vsubq_s16(v20, v21);
    v43 = vaddq_s16(v23, v22);
    v44 = vsubq_s16(v22, v23);
    v45 = vaddq_s16(v43, v41);
    v46 = vsubq_s16(v41, v43);
    v47 = vaddq_s16(v44, v42);
    v48 = vsubq_s16(v42, v44);
    v49 = vtrn1q_s16(v45, v47);
    v50 = vtrn2q_s16(v45, v47);
    v51 = vtrn1q_s16(v46, v48);
    v52 = vtrn2q_s16(v46, v48);
    v53 = (int32x4_t)vaddq_s16(v50, v49);
    v54 = (int32x4_t)vsubq_s16(v49, v50);
    v55 = (int32x4_t)vaddq_s16(v52, v51);
    v56 = (int32x4_t)vsubq_s16(v51, v52);
    v57 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v54, v56)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v54, v56))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v53, v55)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v53, v55))));
    v6 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v6, *(uint16x4_t *)v40.i8), v40);
    v7 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v57.i8), v57);
    v5 -= 4;
    a1 = (uint8x8_t *)((char *)v11 + a2);
    a3 = (uint8x8_t *)((char *)v15 + a4);
  }
  while (v5 > 4);
  return vaddvq_s32(vaddq_s32(v7, v6));
}

uint64_t sub_1B690E614(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1B690E49C(a1, a2, a3, a4, 8);
}

uint64_t sub_1B690E61C(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1B690E624(a1, a2, a3, a4, 16);
}

uint64_t sub_1B690E624(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4, int a5)
{
  int v5;
  int32x4_t v6;
  int32x4_t v7;
  uint8x8_t *v8;
  uint8x8_t v9;
  uint8x8_t *v10;
  uint8x8_t *v11;
  uint8x8_t v12;
  uint8x8_t *v13;
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
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  uint16x8_t v34;

  v5 = a5 + 4;
  v6 = 0uLL;
  v7 = 0uLL;
  do
  {
    v8 = (uint8x8_t *)((char *)a1 + a2 + a2);
    v9 = *v8;
    v10 = (uint8x8_t *)((char *)v8 + a2);
    v11 = (uint8x8_t *)((char *)a3 + a4 + a4);
    v12 = *v11;
    v13 = (uint8x8_t *)((char *)v11 + a4);
    v14 = (int16x8_t)vsubl_u8(*a1, *a3);
    v15 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + a2), *(uint8x8_t *)((char *)a3 + a4));
    v16 = (int16x8_t)vsubl_u8(v9, v12);
    v17 = (int16x8_t)vsubl_u8(*v10, *v13);
    v18 = vaddq_s16(v15, v14);
    v19 = vsubq_s16(v14, v15);
    v20 = vaddq_s16(v17, v16);
    v21 = vsubq_s16(v16, v17);
    v22 = vaddq_s16(v20, v18);
    v23 = vsubq_s16(v18, v20);
    v24 = vaddq_s16(v21, v19);
    v25 = vsubq_s16(v19, v21);
    v26 = vtrn1q_s16(v22, v24);
    v27 = vtrn2q_s16(v22, v24);
    v28 = vtrn1q_s16(v23, v25);
    v29 = vtrn2q_s16(v23, v25);
    v30 = (int32x4_t)vaddq_s16(v27, v26);
    v31 = (int32x4_t)vsubq_s16(v26, v27);
    v32 = (int32x4_t)vaddq_s16(v29, v28);
    v33 = (int32x4_t)vsubq_s16(v28, v29);
    v34 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v31, v33)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v31, v33))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v30, v32)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v30, v32))));
    v7 = (int32x4_t)vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v34.i8);
    v6 = (int32x4_t)vaddw_high_u16((uint32x4_t)v6, v34);
    v5 -= 4;
    a1 = (uint8x8_t *)((char *)v10 + a2);
    a3 = (uint8x8_t *)((char *)v13 + a4);
  }
  while (v5 > 4);
  return vaddvq_s32(vaddq_s32(v7, v6));
}

uint64_t sub_1B690E718(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  return sub_1B690E624(a1, a2, a3, a4, 8);
}

uint64_t sub_1B690E720(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1B690E728(a1, a2, a3, a4, a5, 16);
}

uint64_t sub_1B690E728(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int v9;
  uint8x16_t v10;
  uint8x16_t *v11;
  uint8x16_t v12;
  uint8x8_t *v13;
  uint8x16_t *v14;
  uint8x16_t v15;
  uint8x16_t *v16;
  uint8x16_t *v17;
  uint8x16_t v18;
  uint8x16_t *v19;
  uint8x16_t v20;
  uint8x16_t v21;
  uint8x16_t v22;
  uint8x16_t v23;
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
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  uint16x8_t v48;
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
  int32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  uint16x8_t v65;

  v6 = 0;
  v7 = 0uLL;
  v8 = 0uLL;
  v9 = a6 + 4;
  do
  {
    v10 = *(uint8x16_t *)&a1->i8[a2];
    v11 = (uint8x16_t *)((char *)a1 + a2 + a2);
    v12 = *v11;
    v13 = (uint8x8_t *)&v11->i8[a2];
    v14 = (uint8x16_t *)(a3 + v6 + a5);
    v15 = *v14;
    v16 = (uint8x16_t *)((char *)v14 + a5);
    v17 = (uint8x16_t *)(a4 + v6 + a5);
    v18 = *v17;
    v19 = (uint8x16_t *)((char *)v17 + a5);
    v20 = vrhaddq_u8(*(uint8x16_t *)(a3 + v6), *(uint8x16_t *)(a4 + v6));
    v21 = vrhaddq_u8(v15, v18);
    v22 = vrhaddq_u8(*v16, *v19);
    v23 = vrhaddq_u8(*(uint8x16_t *)((char *)v16 + a5), *(uint8x16_t *)((char *)v19 + a5));
    v24 = (int16x8_t)vsubl_u8(*a1, *(uint8x8_t *)v20.i8);
    v25 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v10.i8, *(uint8x8_t *)v21.i8);
    v26 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v12.i8, *(uint8x8_t *)v22.i8);
    v27 = (int16x8_t)vsubl_u8(*v13, *(uint8x8_t *)v23.i8);
    v28 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)a1->i8, v20);
    v29 = (int16x8_t)vsubl_high_u8(v10, v21);
    v30 = (int16x8_t)vsubl_high_u8(v12, v22);
    v31 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v13->i8, v23);
    v32 = vaddq_s16(v25, v24);
    v33 = vsubq_s16(v24, v25);
    v34 = vaddq_s16(v27, v26);
    v35 = vsubq_s16(v26, v27);
    v36 = vaddq_s16(v34, v32);
    v37 = vsubq_s16(v32, v34);
    v38 = vaddq_s16(v35, v33);
    v39 = vsubq_s16(v33, v35);
    v40 = vtrn1q_s16(v36, v38);
    v41 = vtrn2q_s16(v36, v38);
    v42 = vtrn1q_s16(v37, v39);
    v43 = vtrn2q_s16(v37, v39);
    v44 = (int32x4_t)vaddq_s16(v41, v40);
    v45 = (int32x4_t)vsubq_s16(v40, v41);
    v46 = (int32x4_t)vaddq_s16(v43, v42);
    v47 = (int32x4_t)vsubq_s16(v42, v43);
    v48 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v45, v47)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v45, v47))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v44, v46)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v44, v46))));
    v49 = vaddq_s16(v29, v28);
    v50 = vsubq_s16(v28, v29);
    v51 = vaddq_s16(v31, v30);
    v52 = vsubq_s16(v30, v31);
    v53 = vaddq_s16(v51, v49);
    v54 = vsubq_s16(v49, v51);
    v55 = vaddq_s16(v52, v50);
    v56 = vsubq_s16(v50, v52);
    v57 = vtrn1q_s16(v53, v55);
    v58 = vtrn2q_s16(v53, v55);
    v59 = vtrn1q_s16(v54, v56);
    v60 = vtrn2q_s16(v54, v56);
    v61 = (int32x4_t)vaddq_s16(v58, v57);
    v62 = (int32x4_t)vsubq_s16(v57, v58);
    v63 = (int32x4_t)vaddq_s16(v60, v59);
    v64 = (int32x4_t)vsubq_s16(v59, v60);
    v65 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v62, v64)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v62, v64))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v61, v63)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v61, v63))));
    v7 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v48.i8), v48);
    v8 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v8, *(uint16x4_t *)v65.i8), v65);
    v9 -= 4;
    v6 += 4 * a5;
    a1 = (uint8x8_t *)((char *)v13 + a2);
  }
  while (v9 > 4);
  return vaddvq_s32(vaddq_s32(v8, v7));
}

uint64_t sub_1B690E8D4(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1B690E728(a1, a2, a3, a4, a5, 8);
}

uint64_t sub_1B690E8DC(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1B690E8E4(a1, a2, a3, a4, a5, 16);
}

uint64_t sub_1B690E8E4(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int v9;
  uint8x8_t *v10;
  uint8x8_t v11;
  uint8x8_t *v12;
  uint8x8_t *v13;
  uint8x8_t v14;
  uint8x8_t *v15;
  uint8x8_t *v16;
  uint8x8_t v17;
  uint8x8_t *v18;
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
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  uint16x8_t v39;

  v6 = 0;
  v7 = 0uLL;
  v8 = 0uLL;
  v9 = a6 + 4;
  do
  {
    v10 = (uint8x8_t *)((char *)a1 + a2 + a2);
    v11 = *v10;
    v12 = (uint8x8_t *)((char *)v10 + a2);
    v13 = (uint8x8_t *)(a3 + v6 + a5);
    v14 = *v13;
    v15 = (uint8x8_t *)((char *)v13 + a5);
    v16 = (uint8x8_t *)(a4 + v6 + a5);
    v17 = *v16;
    v18 = (uint8x8_t *)((char *)v16 + a5);
    v19 = (int16x8_t)vsubl_u8(*a1, vrhadd_u8(*(uint8x8_t *)(a3 + v6), *(uint8x8_t *)(a4 + v6)));
    v20 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + a2), vrhadd_u8(v14, v17));
    v21 = (int16x8_t)vsubl_u8(v11, vrhadd_u8(*v15, *v18));
    v22 = (int16x8_t)vsubl_u8(*v12, vrhadd_u8(*(uint8x8_t *)((char *)v15 + a5), *(uint8x8_t *)((char *)v18 + a5)));
    v23 = vaddq_s16(v20, v19);
    v24 = vsubq_s16(v19, v20);
    v25 = vaddq_s16(v22, v21);
    v26 = vsubq_s16(v21, v22);
    v27 = vaddq_s16(v25, v23);
    v28 = vsubq_s16(v23, v25);
    v29 = vaddq_s16(v26, v24);
    v30 = vsubq_s16(v24, v26);
    v31 = vtrn1q_s16(v27, v29);
    v32 = vtrn2q_s16(v27, v29);
    v33 = vtrn1q_s16(v28, v30);
    v34 = vtrn2q_s16(v28, v30);
    v35 = (int32x4_t)vaddq_s16(v32, v31);
    v36 = (int32x4_t)vsubq_s16(v31, v32);
    v37 = (int32x4_t)vaddq_s16(v34, v33);
    v38 = (int32x4_t)vsubq_s16(v33, v34);
    v39 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v36, v38)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v36, v38))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v35, v37)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v35, v37))));
    v8 = (int32x4_t)vaddw_u16((uint32x4_t)v8, *(uint16x4_t *)v39.i8);
    v7 = (int32x4_t)vaddw_high_u16((uint32x4_t)v7, v39);
    v9 -= 4;
    v6 += 4 * a5;
    a1 = (uint8x8_t *)((char *)v12 + a2);
  }
  while (v9 > 4);
  return vaddvq_s32(vaddq_s32(v8, v7));
}

uint64_t sub_1B690EA0C(uint8x8_t *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_1B690E8E4(a1, a2, a3, a4, a5, 8);
}

uint64_t sub_1B690EA14(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  int32x4_t v4;
  int16x4_t *v5;
  unsigned int v6;
  int32x4_t v7;
  uint8x16_t v8;
  uint8x16_t *v9;
  uint8x16_t v10;
  uint8x8_t *v11;
  uint8x16_t v12;
  uint8x16_t *v13;
  uint8x16_t v14;
  uint8x8_t *v15;
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
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
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
  int32x4_t v57;
  int16x8_t v58;
  uint16x8_t v59;
  int32x4_t v60;
  int32x4_t v61;
  uint16x8_t v62;
  int v63;
  int16x4_t v64;
  int16x4_t v65;
  int16x4_t v66;
  int16x4_t v67;
  int16x4_t v68;
  int16x4_t v69;
  int16x4_t v70;
  int16x4_t v71;
  int16x4_t v72;
  int16x4_t v73;
  int16x4_t v74;
  int16x4_t v75;
  int16x4_t v76;
  int16x4_t v77;
  int32x2_t v78;
  int32x2_t v79;
  int32x2_t v80;
  int32x2_t v81;
  int16x4_t v83;
  int16x4_t v84;
  int16x4_t v85;
  int16x4_t v86;
  uint64_t v87;
  int8x16x2_t v88;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = 0uLL;
  v5 = &v83;
  v6 = 20;
  v7 = 0uLL;
  do
  {
    v8 = *(uint8x16_t *)&a1->i8[a2];
    v9 = (uint8x16_t *)((char *)a1 + a2 + a2);
    v10 = *v9;
    v11 = (uint8x8_t *)&v9->i8[a2];
    v12 = *(uint8x16_t *)&a3->i8[a4];
    v13 = (uint8x16_t *)((char *)a3 + a4 + a4);
    v14 = *v13;
    v15 = (uint8x8_t *)&v13->i8[a4];
    v16 = (int16x8_t)vsubl_u8(*a3, *a1);
    v17 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v12.i8, *(uint8x8_t *)v8.i8);
    v18 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v14.i8, *(uint8x8_t *)v10.i8);
    v19 = (int16x8_t)vsubl_u8(*v15, *v11);
    v20 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)a3->i8, *(uint8x16_t *)a1->i8);
    v21 = (int16x8_t)vsubl_high_u8(v12, v8);
    v22 = (int16x8_t)vsubl_high_u8(v14, v10);
    v23 = (int16x8_t)vsubl_high_u8(*(uint8x16_t *)v15->i8, *(uint8x16_t *)v11->i8);
    v24 = vaddq_s16(v17, v16);
    v25 = vsubq_s16(v16, v17);
    v26 = vaddq_s16(v19, v18);
    v27 = vsubq_s16(v18, v19);
    v28 = vaddq_s16(v26, v24);
    v29 = vsubq_s16(v24, v26);
    v30 = vaddq_s16(v27, v25);
    v31 = vsubq_s16(v25, v27);
    v32 = vtrn1q_s16(v28, v30);
    v33 = vtrn2q_s16(v28, v30);
    v34 = vtrn1q_s16(v29, v31);
    v35 = vtrn2q_s16(v29, v31);
    v36 = vaddq_s16(v33, v32);
    v37 = (int32x4_t)vsubq_s16(v32, v33);
    v38 = (int32x4_t)vaddq_s16(v35, v34);
    v39 = (int32x4_t)vsubq_s16(v34, v35);
    v40 = (int16x8_t)vtrn1q_s32((int32x4_t)v36, v38);
    v41 = (int16x8_t)vtrn2q_s32((int32x4_t)v36, v38);
    v42 = (int16x8_t)vtrn1q_s32(v37, v39);
    v43 = (int16x8_t)vtrn2q_s32(v37, v39);
    v88.val[0] = (int8x16_t)vaddq_s16(v36, v41);
    v44 = vaddq_s16(v21, v20);
    v45 = vsubq_s16(v20, v21);
    v46 = vaddq_s16(v23, v22);
    v47 = vsubq_s16(v22, v23);
    v48 = vaddq_s16(v46, v44);
    v49 = vsubq_s16(v44, v46);
    v50 = vaddq_s16(v47, v45);
    v51 = vsubq_s16(v45, v47);
    v52 = vtrn1q_s16(v48, v50);
    v53 = vtrn2q_s16(v48, v50);
    v54 = vtrn1q_s16(v49, v51);
    v55 = vtrn2q_s16(v49, v51);
    v56 = vaddq_s16(v53, v52);
    v57 = (int32x4_t)vaddq_s16(v55, v54);
    v58 = (int16x8_t)vtrn2q_s32((int32x4_t)v56, v57);
    v88.val[1] = (int8x16_t)vaddq_s16(v56, v58);
    *v5++ = (int16x4_t)vqtbl2q_s8(v88, (int8x16_t)xmmword_1B69180A0).u64[0];
    v59 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v42), (uint16x8_t)vabsq_s16(v43)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v40), (uint16x8_t)vabsq_s16(v41)));
    v60 = (int32x4_t)vsubq_s16(v52, v53);
    v61 = (int32x4_t)vsubq_s16(v54, v55);
    v62 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v60, v61)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v60, v61))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32((int32x4_t)v56, v57)), (uint16x8_t)vabsq_s16(v58)));
    v7 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v7, *(uint16x4_t *)v59.i8), v59);
    v4 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v4, *(uint16x4_t *)v62.i8), v62);
    v6 -= 4;
    a1 = (uint8x8_t *)((char *)v11 + a2);
    a3 = (uint8x8_t *)((char *)v15 + a4);
  }
  while (v6 > 4);
  v63 = vaddvq_s32(vaddq_s32(v4, v7));
  v64 = vshr_n_s16(v84, 1uLL);
  v65 = vshr_n_s16(v86, 1uLL);
  v66 = vsub_s16(vshr_n_s16(v83, 1uLL), v64);
  v67 = vsra_n_s16(v64, v83, 1uLL);
  v68 = vsub_s16(vshr_n_s16(v85, 1uLL), v65);
  v69 = vsra_n_s16(v65, v85, 1uLL);
  v70 = vadd_s16(v69, v67);
  v71 = vsub_s16(v67, v69);
  v72 = vadd_s16(v68, v66);
  v73 = vsub_s16(v66, v68);
  v74 = vtrn1_s16(v70, v72);
  v75 = vtrn2_s16(v70, v72);
  v76 = vtrn1_s16(v71, v73);
  v77 = vtrn2_s16(v71, v73);
  v78 = (int32x2_t)vadd_s16(v75, v74);
  v79 = (int32x2_t)vsub_s16(v74, v75);
  v80 = (int32x2_t)vadd_s16(v77, v76);
  v81 = (int32x2_t)vsub_s16(v76, v77);
  return (v63
                      - ((int)(vaddlv_u16((uint16x4_t)vadd_s16(vadd_s16(vabs_s16(v84), vabs_s16(v83)), vadd_s16(vabs_s16(v85), vabs_s16(v86))))- vaddlv_u16((uint16x4_t)vadd_s16((int16x4_t)vmax_u16((uint16x4_t)vabs_s16((int16x4_t)vzip1_s32(v79, v81)), (uint16x4_t)vabs_s16((int16x4_t)vzip2_s32(v79, v81))), (int16x4_t)vmax_u16((uint16x4_t)vabs_s16((int16x4_t)vzip1_s32(v78, v80)), (uint16x4_t)vabs_s16((int16x4_t)vzip2_s32(v78, v80)))))) >> 1));
}

uint64_t sub_1B690ECA0(int16x8_t *a1)
{
  int16x8_t v1;
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
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  uint16x8_t v24;
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
  int32x4_t v37;
  int32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  uint16x8_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  unsigned int v47;
  int32x4_t v48;

  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = vaddq_s16(v2, *a1);
  v9 = vsubq_s16(*a1, v2);
  v10 = vaddq_s16(v6, v4);
  v11 = vsubq_s16(v4, v6);
  v12 = vaddq_s16(v10, v8);
  v13 = vsubq_s16(v8, v10);
  v14 = vaddq_s16(v11, v9);
  v15 = vsubq_s16(v9, v11);
  v16 = vtrn1q_s16(v12, v14);
  v17 = vtrn2q_s16(v12, v14);
  v18 = vtrn1q_s16(v13, v15);
  v19 = vtrn2q_s16(v13, v15);
  v20 = (int32x4_t)vaddq_s16(v17, v16);
  v21 = (int32x4_t)vsubq_s16(v16, v17);
  v22 = (int32x4_t)vaddq_s16(v19, v18);
  v23 = (int32x4_t)vsubq_s16(v18, v19);
  v24 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v21, v23)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v21, v23))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v20, v22)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v20, v22))));
  v25 = vaddq_s16(v3, v1);
  v26 = vsubq_s16(v1, v3);
  v27 = vaddq_s16(v7, v5);
  v28 = vsubq_s16(v5, v7);
  v29 = vaddq_s16(v27, v25);
  v30 = vsubq_s16(v25, v27);
  v31 = vaddq_s16(v28, v26);
  v32 = vsubq_s16(v26, v28);
  v33 = vtrn1q_s16(v29, v31);
  v34 = vtrn2q_s16(v29, v31);
  v35 = vtrn1q_s16(v30, v32);
  v36 = vtrn2q_s16(v30, v32);
  v37 = (int32x4_t)vaddq_s16(v34, v33);
  v38 = (int32x4_t)vsubq_s16(v33, v34);
  v39 = (int32x4_t)vaddq_s16(v36, v35);
  v40 = (int32x4_t)vsubq_s16(v35, v36);
  v41 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v38, v40)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v38, v40))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(v37, v39)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(v37, v39))));
  v42 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v24.i8);
  v43 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v41.i8);
  v44 = (int32x4_t)vmovl_high_u16(v24);
  v45 = (int32x4_t)vmovl_high_u16(v41);
  v46 = 0uLL;
  v47 = 20;
  v48 = 0uLL;
  do
  {
    v48 = vaddq_s32(vaddq_s32(v48, v42), v44);
    v46 = vaddq_s32(vaddq_s32(v46, v43), v45);
    v47 -= 4;
  }
  while (v47 > 4);
  return vaddvq_s32(vaddq_s32(v46, v48));
}

uint64_t sub_1B690EDD0(const char *a1, int a2, const char *a3, int a4)
{
  int32x4_t v4;
  unsigned int v5;
  int32x4_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  int16x8_t v11;
  const char *v12;
  int16x8_t v13;
  const char *v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int8x8x2_t v23;
  int8x8x2_t v24;
  int8x8x2_t v25;

  v4 = 0uLL;
  v5 = 12;
  v6 = 0uLL;
  do
  {
    v18 = (int16x8_t)vld2_s8(a1);
    v7 = &a1[a2];
    v19 = (int16x8_t)vld2_s8(v7);
    v8 = &v7[a2];
    v20 = (int16x8_t)vld2_s8(v8);
    v9 = &v8[a2];
    v21 = (int16x8_t)vld2_s8(v9);
    a1 = &v9[a2];
    v22 = (int16x8_t)vld2_s8(a3);
    v10 = &a3[a4];
    v11 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v18.i8, *(uint8x8_t *)v22.i8);
    v23 = vld2_s8(v10);
    v12 = &v10[a4];
    v13 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v19.i8, (uint8x8_t)v23.val[0]);
    v24 = vld2_s8(v12);
    v14 = &v12[a4];
    v15 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v20.i8, (uint8x8_t)v24.val[0]);
    v25 = vld2_s8(v14);
    a3 = &v14[a4];
    v16 = (int16x8_t)vsubl_u8(*(uint8x8_t *)v21.i8, (uint8x8_t)v25.val[0]);
    v18 = (int16x8_t)vsubl_u8((uint8x8_t)v18.u64[1], (uint8x8_t)v22.u64[1]);
    *(uint16x8_t *)((char *)&v18 + 8) = vsubl_u8((uint8x8_t)v19.u64[1], (uint8x8_t)v23.val[1]);
    v19 = (int16x8_t)vsubl_u8((uint8x8_t)v20.u64[1], (uint8x8_t)v24.val[1]);
    *(uint16x8_t *)((char *)&v19 + 8) = vsubl_u8((uint8x8_t)v21.u64[1], (uint8x8_t)v25.val[1]);
    v20 = vaddq_s16(v13, v11);
    *(int16x8_t *)((char *)&v20 + 8) = vsubq_s16(v11, v13);
    v21 = vaddq_s16(v16, v15);
    *(int16x8_t *)((char *)&v21 + 8) = vsubq_s16(v15, v16);
    v22 = vaddq_s16(v21, v20);
    v20 = vsubq_s16(v20, v21);
    v21 = vaddq_s16(*(int16x8_t *)((char *)&v21 + 8), *(int16x8_t *)((char *)&v20 + 8));
    *(int16x8_t *)((char *)&v20 + 8) = vsubq_s16(*(int16x8_t *)((char *)&v20 + 8), *(int16x8_t *)((char *)&v21 + 8));
    *(int16x8_t *)((char *)&v21 + 8) = vtrn1q_s16(v22, v21);
    v21 = vtrn2q_s16(v22, v21);
    v22 = vtrn1q_s16(v20, *(int16x8_t *)((char *)&v20 + 8));
    v20 = vtrn2q_s16(v20, *(int16x8_t *)((char *)&v20 + 8));
    *(int16x8_t *)((char *)&v20 + 8) = vaddq_s16(v21, *(int16x8_t *)((char *)&v21 + 8));
    v21 = vsubq_s16(*(int16x8_t *)((char *)&v21 + 8), v21);
    *(int16x8_t *)((char *)&v21 + 8) = vaddq_s16(v20, v22);
    v20 = vsubq_s16(v22, v20);
    v22 = (int16x8_t)vtrn1q_s32(*(int32x4_t *)((char *)&v20 + 8), *(int32x4_t *)((char *)&v21 + 8));
    *(int32x4_t *)((char *)&v20 + 8) = vtrn2q_s32(*(int32x4_t *)((char *)&v20 + 8), *(int32x4_t *)((char *)&v21 + 8));
    *(int32x4_t *)((char *)&v21 + 8) = vtrn1q_s32((int32x4_t)v21, (int32x4_t)v20);
    v20 = (int16x8_t)vtrn2q_s32((int32x4_t)v21, (int32x4_t)v20);
    v21 = vabsq_s16(v22);
    v22 = vaddq_s16(*(int16x8_t *)((char *)&v18 + 8), v18);
    v18 = vsubq_s16(v18, *(int16x8_t *)((char *)&v18 + 8));
    *(int16x8_t *)((char *)&v18 + 8) = vaddq_s16(*(int16x8_t *)((char *)&v19 + 8), v19);
    v19 = vsubq_s16(v19, *(int16x8_t *)((char *)&v19 + 8));
    *(int16x8_t *)((char *)&v19 + 8) = vaddq_s16(*(int16x8_t *)((char *)&v18 + 8), v22);
    *(int16x8_t *)((char *)&v18 + 8) = vsubq_s16(v22, *(int16x8_t *)((char *)&v18 + 8));
    v22 = vaddq_s16(v19, v18);
    v18 = vsubq_s16(v18, v19);
    v19 = vtrn1q_s16(*(int16x8_t *)((char *)&v19 + 8), v22);
    *(int16x8_t *)((char *)&v19 + 8) = vtrn2q_s16(*(int16x8_t *)((char *)&v19 + 8), v22);
    v22 = vtrn1q_s16(*(int16x8_t *)((char *)&v18 + 8), v18);
    v18 = vtrn2q_s16(*(int16x8_t *)((char *)&v18 + 8), v18);
    *(int16x8_t *)((char *)&v18 + 8) = vaddq_s16(*(int16x8_t *)((char *)&v19 + 8), v19);
    v19 = vsubq_s16(v19, *(int16x8_t *)((char *)&v19 + 8));
    *(int16x8_t *)((char *)&v19 + 8) = vaddq_s16(v18, v22);
    v18 = vsubq_s16(v22, v18);
    v20 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(*(int16x8_t *)((char *)&v21 + 8)), (uint16x8_t)vabsq_s16(v20)), (int16x8_t)vmaxq_u16((uint16x8_t)v21, (uint16x8_t)vabsq_s16(*(int16x8_t *)((char *)&v20 + 8))));
    v18 = vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32((int32x4_t)v19, (int32x4_t)v18)), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32((int32x4_t)v19, (int32x4_t)v18))), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16((int16x8_t)vtrn1q_s32(*(int32x4_t *)((char *)&v18 + 8), *(int32x4_t *)((char *)&v19 + 8))), (uint16x8_t)vabsq_s16((int16x8_t)vtrn2q_s32(*(int32x4_t *)((char *)&v18 + 8), *(int32x4_t *)((char *)&v19 + 8)))));
    v6 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v6, *(uint16x4_t *)v20.i8), (uint16x8_t)v20);
    v4 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v4, *(uint16x4_t *)v18.i8), (uint16x8_t)v18);
    v5 -= 4;
  }
  while (v5 > 4);
  return vaddvq_s32(vaddq_s32(v4, v6));
}

uint64_t sub_1B690EF28(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
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
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
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
  int64x2_t v64;
  int64x2_t v65;
  int64x2_t v66;
  int64x2_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  uint16x8_t v72;
  uint16x8_t v73;

  v4 = (int16x8_t)vsubl_u8(*a1, *a3);
  v5 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + a2), *(uint8x8_t *)((char *)a3 + a4));
  v6 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 2 * a2), *(uint8x8_t *)((char *)a3 + 2 * a4));
  v7 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 3 * a2), *(uint8x8_t *)((char *)a3 + 3 * a4));
  v8 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 4 * a2), *(uint8x8_t *)((char *)a3 + 4 * a4));
  v9 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 5 * a2), *(uint8x8_t *)((char *)a3 + 5 * a4));
  v10 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)a1 + 6 * a2), *(uint8x8_t *)((char *)a3 + 6 * a4));
  v11 = (int16x8_t)vsubl_u8(*(uint8x8_t *)((char *)&a1[a2] - a2), *(uint8x8_t *)((char *)&a3[a4] - a4));
  v12 = vaddq_s16(v5, v4);
  v13 = vsubq_s16(v4, v5);
  v14 = vaddq_s16(v7, v6);
  v15 = vsubq_s16(v6, v7);
  v16 = vaddq_s16(v9, v8);
  v17 = vsubq_s16(v8, v9);
  v18 = vaddq_s16(v11, v10);
  v19 = vsubq_s16(v10, v11);
  v20 = vaddq_s16(v14, v12);
  v21 = vsubq_s16(v12, v14);
  v22 = vaddq_s16(v15, v13);
  v23 = vsubq_s16(v13, v15);
  v24 = vaddq_s16(v18, v16);
  v25 = vsubq_s16(v16, v18);
  v26 = vaddq_s16(v19, v17);
  v27 = vsubq_s16(v17, v19);
  v28 = vaddq_s16(v24, v20);
  v29 = vsubq_s16(v20, v24);
  v30 = vaddq_s16(v26, v22);
  v31 = vsubq_s16(v22, v26);
  v32 = vaddq_s16(v25, v21);
  v33 = vsubq_s16(v21, v25);
  v34 = vaddq_s16(v27, v23);
  v35 = vsubq_s16(v23, v27);
  v36 = vtrn1q_s16(v28, v30);
  v37 = vtrn2q_s16(v28, v30);
  v38 = vtrn1q_s16(v32, v34);
  v39 = vtrn2q_s16(v32, v34);
  v40 = vtrn1q_s16(v29, v31);
  v41 = vtrn2q_s16(v29, v31);
  v42 = vtrn1q_s16(v33, v35);
  v43 = vtrn2q_s16(v33, v35);
  v44 = (int32x4_t)vaddq_s16(v37, v36);
  v45 = (int32x4_t)vsubq_s16(v36, v37);
  v46 = (int32x4_t)vaddq_s16(v39, v38);
  v47 = (int32x4_t)vsubq_s16(v38, v39);
  v48 = (int32x4_t)vaddq_s16(v41, v40);
  v49 = (int32x4_t)vsubq_s16(v40, v41);
  v50 = (int32x4_t)vaddq_s16(v43, v42);
  v51 = (int32x4_t)vsubq_s16(v42, v43);
  v52 = (int16x8_t)vtrn1q_s32(v44, v46);
  v53 = (int16x8_t)vtrn2q_s32(v44, v46);
  v54 = (int16x8_t)vtrn1q_s32(v45, v47);
  v55 = (int16x8_t)vtrn2q_s32(v45, v47);
  v56 = (int16x8_t)vtrn1q_s32(v48, v50);
  v57 = (int16x8_t)vtrn2q_s32(v48, v50);
  v58 = (int16x8_t)vtrn1q_s32(v49, v51);
  v59 = (int16x8_t)vtrn2q_s32(v49, v51);
  v60 = vaddq_s16(v53, v52);
  v61 = vsubq_s16(v52, v53);
  v62 = vaddq_s16(v55, v54);
  v63 = vsubq_s16(v54, v55);
  v64 = (int64x2_t)vaddq_s16(v57, v56);
  v65 = (int64x2_t)vsubq_s16(v56, v57);
  v66 = (int64x2_t)vaddq_s16(v59, v58);
  v67 = (int64x2_t)vsubq_s16(v58, v59);
  v68 = (int16x8_t)vzip2q_s64((int64x2_t)v60, v64);
  v69 = (int16x8_t)vzip2q_s64((int64x2_t)v62, v66);
  v70 = (int16x8_t)vzip2q_s64((int64x2_t)v61, v65);
  v60.i64[1] = v64.i64[0];
  v71 = (int16x8_t)vzip2q_s64((int64x2_t)v63, v67);
  v62.i64[1] = v66.i64[0];
  v72 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v62), (uint16x8_t)vabsq_s16(v69)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v60), (uint16x8_t)vabsq_s16(v68)));
  v61.i64[1] = v65.i64[0];
  v63.i64[1] = v67.i64[0];
  v73 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v63), (uint16x8_t)vabsq_s16(v71)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v61), (uint16x8_t)vabsq_s16(v70)));
  return ((vaddvq_s32((int32x4_t)vaddw_high_u16(vaddw_u16(vaddw_high_u16(vmovl_u16(*(uint16x4_t *)v72.i8), v72), *(uint16x4_t *)v73.i8), v73))+ 1) >> 1);
}

uint64_t sub_1B690F118(int16x8_t *a1, int a2)
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
  int32x4_t v41;
  int32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x4_t v48;
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
  int64x2_t v61;
  int64x2_t v62;
  int64x2_t v63;
  int64x2_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  uint16x8_t v69;
  uint16x8_t v70;

  v2 = *(int16x8_t *)((char *)a1 + 2 * a2);
  v3 = *(int16x8_t *)((char *)a1 + 4 * a2);
  v4 = *(int16x8_t *)((char *)a1 + 6 * a2);
  v5 = *(int16x8_t *)((char *)a1 + 8 * a2);
  v6 = *(int16x8_t *)((char *)a1 + 10 * a2);
  v7 = *(int16x8_t *)((char *)a1 + 12 * a2);
  v8 = *(int16x8_t *)((char *)a1 + 14 * a2);
  v9 = vaddq_s16(v2, *a1);
  v10 = vsubq_s16(*a1, v2);
  v11 = vaddq_s16(v4, v3);
  v12 = vsubq_s16(v3, v4);
  v13 = vaddq_s16(v6, v5);
  v14 = vsubq_s16(v5, v6);
  v15 = vaddq_s16(v8, v7);
  v16 = vsubq_s16(v7, v8);
  v17 = vaddq_s16(v11, v9);
  v18 = vsubq_s16(v9, v11);
  v19 = vaddq_s16(v12, v10);
  v20 = vsubq_s16(v10, v12);
  v21 = vaddq_s16(v15, v13);
  v22 = vsubq_s16(v13, v15);
  v23 = vaddq_s16(v16, v14);
  v24 = vsubq_s16(v14, v16);
  v25 = vaddq_s16(v21, v17);
  v26 = vsubq_s16(v17, v21);
  v27 = vaddq_s16(v23, v19);
  v28 = vsubq_s16(v19, v23);
  v29 = vaddq_s16(v22, v18);
  v30 = vsubq_s16(v18, v22);
  v31 = vaddq_s16(v24, v20);
  v32 = vsubq_s16(v20, v24);
  v33 = vtrn1q_s16(v25, v27);
  v34 = vtrn2q_s16(v25, v27);
  v35 = vtrn1q_s16(v29, v31);
  v36 = vtrn2q_s16(v29, v31);
  v37 = vtrn1q_s16(v26, v28);
  v38 = vtrn2q_s16(v26, v28);
  v39 = vtrn1q_s16(v30, v32);
  v40 = vtrn2q_s16(v30, v32);
  v41 = (int32x4_t)vaddq_s16(v34, v33);
  v42 = (int32x4_t)vsubq_s16(v33, v34);
  v43 = (int32x4_t)vaddq_s16(v36, v35);
  v44 = (int32x4_t)vsubq_s16(v35, v36);
  v45 = (int32x4_t)vaddq_s16(v38, v37);
  v46 = (int32x4_t)vsubq_s16(v37, v38);
  v47 = (int32x4_t)vaddq_s16(v40, v39);
  v48 = (int32x4_t)vsubq_s16(v39, v40);
  v49 = (int16x8_t)vtrn1q_s32(v41, v43);
  v50 = (int16x8_t)vtrn2q_s32(v41, v43);
  v51 = (int16x8_t)vtrn1q_s32(v42, v44);
  v52 = (int16x8_t)vtrn2q_s32(v42, v44);
  v53 = (int16x8_t)vtrn1q_s32(v45, v47);
  v54 = (int16x8_t)vtrn2q_s32(v45, v47);
  v55 = (int16x8_t)vtrn1q_s32(v46, v48);
  v56 = (int16x8_t)vtrn2q_s32(v46, v48);
  v57 = vaddq_s16(v50, v49);
  v58 = vsubq_s16(v49, v50);
  v59 = vaddq_s16(v52, v51);
  v60 = vsubq_s16(v51, v52);
  v61 = (int64x2_t)vaddq_s16(v54, v53);
  v62 = (int64x2_t)vsubq_s16(v53, v54);
  v63 = (int64x2_t)vaddq_s16(v56, v55);
  v64 = (int64x2_t)vsubq_s16(v55, v56);
  v65 = (int16x8_t)vzip2q_s64((int64x2_t)v57, v61);
  v66 = (int16x8_t)vzip2q_s64((int64x2_t)v59, v63);
  v67 = (int16x8_t)vzip2q_s64((int64x2_t)v58, v62);
  v57.i64[1] = v61.i64[0];
  v68 = (int16x8_t)vzip2q_s64((int64x2_t)v60, v64);
  v59.i64[1] = v63.i64[0];
  v69 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v59), (uint16x8_t)vabsq_s16(v66)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v57), (uint16x8_t)vabsq_s16(v65)));
  v58.i64[1] = v62.i64[0];
  v60.i64[1] = v64.i64[0];
  v70 = (uint16x8_t)vaddq_s16((int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v60), (uint16x8_t)vabsq_s16(v68)), (int16x8_t)vmaxq_u16((uint16x8_t)vabsq_s16(v58), (uint16x8_t)vabsq_s16(v67)));
  return ((vaddvq_s32((int32x4_t)vaddw_high_u16(vaddw_u16(vaddw_high_u16(vmovl_u16(*(uint16x4_t *)v69.i8), v69), *(uint16x4_t *)v70.i8), v70))+ 1) >> 1);
}

uint64_t sub_1B690F2C0(uint8x8_t *a1, int a2, uint8x8_t *a3, int a4)
{
  unsigned int v4;
  uint8x8_t *v5;
  uint8x16_t *v6;
  uint64_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t *v10;
  uint8x16_t v11;
  uint8x8_t *v12;
  uint8x16_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8x16_t v22;
  uint8x16_t v23;
  uint8x16_t v24;
  uint8x16_t v25;
  uint8x16_t v26;
  uint8x16_t v27;
  uint8x16_t v28;
  uint8x16_t v29;

  v4 = 0;
  v5 = (uint8x8_t *)((char *)a1 + a2);
  v6 = (uint8x16_t *)((char *)v5 + a2);
  v7 = a2;
  v8 = *v6;
  v9 = *(uint8x16_t *)((char *)v6 + a2);
  v10 = (uint8x16_t *)((char *)a3 + a4);
  v11 = *v10;
  v12 = (uint8x8_t *)&v10->i8[a4];
  v13 = *(uint8x16_t *)&v12->i8[a4];
  v14 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v8.i8, *v12), *a1, *a3);
  v15 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v8, *(uint8x16_t *)v12->i8), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  v16 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v13.i8), *v5, *(uint8x8_t *)v11.i8);
  v17 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v9, v13), *(uint8x16_t *)v5->i8, v11);
  v18 = 7 * a2;
  v19 = 6 * a2;
  v20 = 4 * a2;
  v21 = 5 * a2;
  do
  {
    v22 = *(uint8x16_t *)&a3->i8[4 * a4];
    v23 = *(uint8x16_t *)&a3->i8[5 * a4];
    v24 = *(uint8x16_t *)&a3->i8[6 * a4];
    v25 = *(uint8x16_t *)&a3->i8[7 * a4];
    a3 = (uint8x8_t *)((char *)a3 + 2 * a4 + a4 + a4);
    v26 = *(uint8x16_t *)&a1->i8[v20];
    v27 = *(uint8x16_t *)&a1->i8[v21];
    v28 = *(uint8x16_t *)&a1->i8[v19];
    v29 = *(uint8x16_t *)&a1->i8[v18];
    a1 = (uint8x8_t *)((char *)a1 + 2 * v7 + v7 + v7);
    v14 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v14, *(uint8x8_t *)v26.i8, *(uint8x8_t *)v22.i8), *(uint8x8_t *)v28.i8, *(uint8x8_t *)v24.i8);
    v15 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v15, v26, v22), v28, v24);
    v16 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v16, *(uint8x8_t *)v27.i8, *(uint8x8_t *)v23.i8), *(uint8x8_t *)v29.i8, *(uint8x8_t *)v25.i8);
    v17 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v17, v27, v23), v29, v25);
    v4 += 4;
  }
  while (v4 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v16, v17), vaddq_s16(v15, v14)));
}

uint64_t sub_1B690F3D8(uint64_t a1, uint8x16_t *a2, int a3)
{
  uint8x16_t *v3;
  uint8x16_t v4;
  uint8x16_t *v5;
  uint8x16_t v6;
  uint8x16_t *v7;
  uint8x16_t v8;
  uint8x16_t *v9;
  uint8x16_t v10;
  uint8x16_t *v11;
  uint8x16_t v12;
  uint8x16_t *v13;

  v3 = (uint8x16_t *)((char *)a2 + a3);
  v4 = *v3;
  v5 = (uint8x16_t *)((char *)v3 + a3);
  v6 = *v5;
  v7 = (uint8x16_t *)((char *)v5 + a3);
  v8 = *v7;
  v9 = (uint8x16_t *)((char *)v7 + a3);
  v10 = *v9;
  v11 = (uint8x16_t *)((char *)v9 + a3);
  v12 = *v11;
  v13 = (uint8x16_t *)((char *)v11 + a3);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 48), *(uint8x8_t *)v8.i8), *(uint8x8_t *)(a1 + 16), *(uint8x8_t *)v4.i8), *(uint8x8_t *)(a1 + 80), *(uint8x8_t *)v12.i8), *(uint8x8_t *)(a1 + 112), *(uint8x8_t *)&v13->i8[a3]), (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 48), v8), *(uint8x16_t *)(a1 + 16), v4), *(uint8x16_t *)(a1 + 80), v12),
                                                  *(uint8x16_t *)(a1 + 112),
                                                  *(uint8x16_t *)((char *)v13 + a3))),
                                   vaddq_s16((int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 32), v6), *(uint8x16_t *)a1, *a2), *(uint8x16_t *)(a1 + 64), v10), *(uint8x16_t *)(a1 + 96), *v13), (int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 32), *(uint8x8_t *)v6.i8), *(uint8x8_t *)a1, *(uint8x8_t *)a2->i8), *(uint8x8_t *)(a1 + 64), *(uint8x8_t *)v10.i8), *(uint8x8_t *)(a1 + 96),
                                                  *(uint8x8_t *)v13->i8))));
}

uint64_t sub_1B690F478(uint8x8_t *a1, uint8x8_t *a2, int a3)
{
  unsigned int v3;
  uint8x8_t *v4;
  uint8x8_t v5;
  uint8x8_t *v6;
  int16x8_t v7;
  int16x8_t v8;
  int16x8_t v9;
  int16x8_t v10;
  uint8x8_t *v11;
  uint8x8_t v12;
  uint8x8_t v13;
  uint8x8_t v14;
  uint8x8_t v15;
  uint8x8_t v16;
  uint8x8_t v17;
  uint8x8_t v18;
  uint8x8_t v19;

  v3 = 0;
  v4 = (uint8x8_t *)((char *)a2 + a3);
  v5 = *v4;
  v6 = (uint8x8_t *)((char *)v4 + a3);
  v7 = (int16x8_t)vabdl_u8(*a1, *a2);
  v8 = (int16x8_t)vabdl_u8(a1[2], v5);
  v9 = (int16x8_t)vabdl_u8(a1[4], *v6);
  v10 = (int16x8_t)vabdl_u8(a1[6], *(uint8x8_t *)((char *)v6 + a3));
  v11 = a1 + 14;
  do
  {
    v12 = *(uint8x8_t *)((char *)a2 + 4 * a3);
    v13 = *(uint8x8_t *)((char *)a2 + 5 * a3);
    v14 = *(uint8x8_t *)((char *)a2 + 6 * a3);
    v15 = *(uint8x8_t *)((char *)a2 + 7 * a3);
    a2 = (uint8x8_t *)((char *)a2 + 2 * a3 + a3 + a3);
    v16 = v11[-6];
    v17 = v11[-4];
    v18 = v11[-2];
    v19 = *v11;
    v11 += 8;
    v7 = (int16x8_t)vabal_u8((uint16x8_t)v7, v16, v12);
    v8 = (int16x8_t)vabal_u8((uint16x8_t)v8, v17, v13);
    v9 = (int16x8_t)vabal_u8((uint16x8_t)v9, v18, v14);
    v10 = (int16x8_t)vabal_u8((uint16x8_t)v10, v19, v15);
    v3 += 4;
  }
  while (v3 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v9, v10), vaddq_s16(v8, v7)));
}

uint64_t sub_1B690F53C(_OWORD *a1, uint8x16_t *a2, uint8x16_t *a3, int a4)
{
  uint8x16_t v4;
  uint8x16_t v5;
  uint8x16_t v6;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t *v9;
  uint8x16_t v10;
  uint8x16_t *v11;
  uint8x16_t v12;
  uint8x16_t v13;
  uint8x16_t *v14;
  uint8x16_t v15;
  uint8x16_t *v16;
  uint8x16_t v17;
  uint8x16_t *v18;
  unsigned int v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  uint8x8_t *v24;
  uint8x16_t v25;
  uint8x16_t v26;
  uint8x16_t v27;
  uint8x16_t v28;
  uint8x16_t v29;
  uint8x16_t *v30;
  uint8x16_t v31;
  uint8x16_t *v32;
  uint8x16_t v33;
  uint8x16_t *v34;
  uint8x16_t v35;
  uint8x16_t v36;
  uint8x16_t v37;
  uint8x16_t v38;

  v4 = *(uint8x16_t *)a1;
  v5 = *((uint8x16_t *)a1 + 1);
  v6 = *((uint8x16_t *)a1 + 2);
  v7 = *((uint8x16_t *)a1 + 3);
  v8 = *a2;
  v9 = (uint8x16_t *)((char *)a2 + a4);
  v10 = *v9;
  v11 = (uint8x16_t *)((char *)v9 + a4);
  v12 = *v11;
  v13 = *(uint8x16_t *)((char *)v11 + a4);
  if (a3)
  {
    v14 = (uint8x16_t *)((char *)a3 + a4 + a4);
    v15 = *v14;
    v16 = (uint8x16_t *)((char *)v14 + a4);
    v17 = *v16;
    v18 = (uint8x16_t *)((char *)v16 + a4);
    v8 = vrhaddq_u8(v8, *a3);
    v10 = vrhaddq_u8(v10, *(uint8x16_t *)((char *)a3 + a4));
    v12 = vrhaddq_u8(v12, v15);
    v13 = vrhaddq_u8(v13, v17);
  }
  else
  {
    v18 = 0;
  }
  v19 = 0;
  v20 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v6.i8, *(uint8x8_t *)v12.i8), *(uint8x8_t *)v4.i8, *(uint8x8_t *)v8.i8);
  v21 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v6, v12), v4, v8);
  v22 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v7.i8, *(uint8x8_t *)v13.i8), *(uint8x8_t *)v5.i8, *(uint8x8_t *)v10.i8);
  v23 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v7, v13), v5, v10);
  v24 = (uint8x8_t *)(a1 + 7);
  do
  {
    v25 = *(uint8x16_t *)((char *)a2 + 4 * a4);
    v26 = *(uint8x16_t *)((char *)a2 + 5 * a4);
    v27 = *(uint8x16_t *)((char *)a2 + 6 * a4);
    v28 = *(uint8x16_t *)((char *)a2 + 7 * a4);
    if (v18)
    {
      v29 = *v18;
      v30 = (uint8x16_t *)((char *)v18 + a4);
      v31 = *v30;
      v32 = (uint8x16_t *)((char *)v30 + a4);
      v33 = *v32;
      v34 = (uint8x16_t *)((char *)v32 + a4);
      v35 = *v34;
      v18 = (uint8x16_t *)((char *)v34 + a4);
      v25 = vrhaddq_u8(v25, v29);
      v26 = vrhaddq_u8(v26, v31);
      v27 = vrhaddq_u8(v27, v33);
      v28 = vrhaddq_u8(v28, v35);
    }
    a2 = (uint8x16_t *)((char *)a2 + 2 * a4 + a4 + a4);
    v36 = *(uint8x16_t *)v24[-6].i8;
    v37 = *(uint8x16_t *)v24[-4].i8;
    v38 = *(uint8x16_t *)v24[-2].i8;
    v20 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v20, *(uint8x8_t *)v36.i8, *(uint8x8_t *)v25.i8), *(uint8x8_t *)v38.i8, *(uint8x8_t *)v27.i8);
    v21 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v21, v36, v25), v38, v27);
    v22 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v22, *(uint8x8_t *)v37.i8, *(uint8x8_t *)v26.i8), *v24, *(uint8x8_t *)v28.i8);
    v23 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v23, v37, v26), *(uint8x16_t *)v24->i8, v28);
    v19 += 4;
    v24 += 8;
  }
  while (v19 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v22, v23), vaddq_s16(v21, v20)));
}

uint64_t sub_1B690F680(uint64_t a1, uint8x16_t *a2, uint8x16_t *a3, int a4)
{
  uint8x16_t v4;
  uint8x16_t *v5;
  uint8x16_t v6;
  uint8x16_t *v7;
  uint8x16_t v8;
  uint8x16_t *v9;
  uint8x16_t v10;
  uint8x16_t *v11;
  uint8x16_t v12;
  uint8x16_t *v13;
  uint8x16_t v14;
  uint8x16_t *v15;
  uint8x16_t *v16;
  uint8x16_t v17;
  uint8x16_t *v18;
  uint8x16_t v19;
  uint8x16_t *v20;
  uint8x16_t v21;
  uint8x16_t v22;
  uint8x16_t *v23;

  v4 = *a2;
  v5 = (uint8x16_t *)((char *)a2 + a4);
  v6 = *v5;
  v7 = (uint8x16_t *)((char *)v5 + a4);
  v8 = *v7;
  v9 = (uint8x16_t *)((char *)v7 + a4);
  v10 = *v9;
  if (a3)
  {
    v11 = (uint8x16_t *)((char *)a3 + a4 + a4);
    v12 = *v11;
    v13 = (uint8x16_t *)((char *)v11 + a4);
    v14 = *v13;
    v15 = (uint8x16_t *)((char *)v13 + a4);
    v4 = vrhaddq_u8(v4, *a3);
    v6 = vrhaddq_u8(v6, *(uint8x16_t *)((char *)a3 + a4));
    v8 = vrhaddq_u8(v8, v12);
    v10 = vrhaddq_u8(v10, v14);
  }
  else
  {
    v15 = 0;
  }
  v16 = (uint8x16_t *)((char *)v9 + a4);
  v17 = *v16;
  v18 = (uint8x16_t *)((char *)v16 + a4);
  v19 = *v18;
  v20 = (uint8x16_t *)((char *)v18 + a4);
  v21 = *v20;
  v22 = *(uint8x16_t *)((char *)v20 + a4);
  if (v15)
  {
    v23 = (uint8x16_t *)((char *)v15 + a4 + a4);
    v17 = vrhaddq_u8(v17, *v15);
    v19 = vrhaddq_u8(v19, *(uint8x16_t *)((char *)v15 + a4));
    v21 = vrhaddq_u8(v21, *v23);
    v22 = vrhaddq_u8(v22, *(uint8x16_t *)((char *)v23 + a4));
  }
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 48), *(uint8x8_t *)v10.i8), *(uint8x8_t *)(a1 + 16), *(uint8x8_t *)v6.i8), *(uint8x8_t *)(a1 + 80), *(uint8x8_t *)v19.i8), *(uint8x8_t *)(a1 + 112), *(uint8x8_t *)v22.i8), (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 48), v10), *(uint8x16_t *)(a1 + 16), v6), *(uint8x16_t *)(a1 + 80), v19),
                                                  *(uint8x16_t *)(a1 + 112),
                                                  v22)),
                                   vaddq_s16((int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabdl_high_u8(*(uint8x16_t *)(a1 + 32), v8), *(uint8x16_t *)a1, v4), *(uint8x16_t *)(a1 + 64), v17), *(uint8x16_t *)(a1 + 96), v21), (int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabdl_u8(*(uint8x8_t *)(a1 + 32), *(uint8x8_t *)v8.i8), *(uint8x8_t *)a1, *(uint8x8_t *)v4.i8), *(uint8x8_t *)(a1 + 64), *(uint8x8_t *)v17.i8), *(uint8x8_t *)(a1 + 96),
                                                  *(uint8x8_t *)v21.i8))));
}

uint64_t sub_1B690F78C(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, int a4)
{
  uint8x8_t v4;
  uint8x8_t *v5;
  uint8x8_t v6;
  uint8x8_t *v7;
  uint8x8_t v8;
  uint8x8_t v9;
  uint8x8_t *v10;
  uint8x8_t v11;
  uint8x8_t *v12;
  uint8x8_t v13;
  uint8x8_t *v14;
  unsigned int v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  uint8x8_t *v20;
  uint8x8_t v21;
  uint8x8_t v22;
  uint8x8_t v23;
  uint8x8_t v24;
  uint8x8_t v25;
  uint8x8_t *v26;
  uint8x8_t v27;
  uint8x8_t *v28;
  uint8x8_t v29;
  uint8x8_t *v30;
  uint8x8_t v31;
  uint8x8_t v32;
  uint8x8_t v33;
  uint8x8_t v34;
  uint8x8_t v35;

  v4 = *a2;
  v5 = (uint8x8_t *)((char *)a2 + a4);
  v6 = *v5;
  v7 = (uint8x8_t *)((char *)v5 + a4);
  v8 = *v7;
  v9 = *(uint8x8_t *)((char *)v7 + a4);
  if (a3)
  {
    v10 = (uint8x8_t *)((char *)a3 + a4 + a4);
    v11 = *v10;
    v12 = (uint8x8_t *)((char *)v10 + a4);
    v13 = *v12;
    v14 = (uint8x8_t *)((char *)v12 + a4);
    v4 = vrhadd_u8(v4, *a3);
    v6 = vrhadd_u8(v6, *(uint8x8_t *)((char *)a3 + a4));
    v8 = vrhadd_u8(v8, v11);
    v9 = vrhadd_u8(v9, v13);
  }
  else
  {
    v14 = 0;
  }
  v15 = 0;
  v16 = (int16x8_t)vabdl_u8(*a1, v4);
  v17 = (int16x8_t)vabdl_u8(a1[2], v6);
  v18 = (int16x8_t)vabdl_u8(a1[4], v8);
  v19 = (int16x8_t)vabdl_u8(a1[6], v9);
  v20 = a1 + 14;
  do
  {
    v21 = *(uint8x8_t *)((char *)a2 + 4 * a4);
    v22 = *(uint8x8_t *)((char *)a2 + 5 * a4);
    v23 = *(uint8x8_t *)((char *)a2 + 6 * a4);
    v24 = *(uint8x8_t *)((char *)a2 + 7 * a4);
    if (v14)
    {
      v25 = *v14;
      v26 = (uint8x8_t *)((char *)v14 + a4);
      v27 = *v26;
      v28 = (uint8x8_t *)((char *)v26 + a4);
      v29 = *v28;
      v30 = (uint8x8_t *)((char *)v28 + a4);
      v31 = *v30;
      v14 = (uint8x8_t *)((char *)v30 + a4);
      v21 = vrhadd_u8(v21, v25);
      v22 = vrhadd_u8(v22, v27);
      v23 = vrhadd_u8(v23, v29);
      v24 = vrhadd_u8(v24, v31);
    }
    a2 = (uint8x8_t *)((char *)a2 + 2 * a4 + a4 + a4);
    v32 = v20[-6];
    v33 = v20[-4];
    v34 = v20[-2];
    v35 = *v20;
    v20 += 8;
    v16 = (int16x8_t)vabal_u8((uint16x8_t)v16, v32, v21);
    v17 = (int16x8_t)vabal_u8((uint16x8_t)v17, v33, v22);
    v18 = (int16x8_t)vabal_u8((uint16x8_t)v18, v34, v23);
    v19 = (int16x8_t)vabal_u8((uint16x8_t)v19, v35, v24);
    v15 += 4;
  }
  while (v15 < 0xC);
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v18, v19), vaddq_s16(v17, v16)));
}

uint64_t sub_1B690F8BC(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, int a4)
{
  uint8x8_t v4;
  uint8x8_t *v5;
  uint8x8_t v6;
  uint8x8_t *v7;
  uint8x8_t v8;
  uint8x8_t *v9;
  uint8x8_t v10;
  uint8x8_t *v11;
  uint8x8_t v12;
  uint8x8_t *v13;
  uint8x8_t v14;
  uint8x8_t *v15;
  uint8x8_t *v16;
  uint8x8_t v17;
  uint8x8_t *v18;
  uint8x8_t v19;
  uint8x8_t *v20;
  uint8x8_t v21;
  uint8x8_t v22;
  uint8x8_t *v23;

  v4 = *a2;
  v5 = (uint8x8_t *)((char *)a2 + a4);
  v6 = *v5;
  v7 = (uint8x8_t *)((char *)v5 + a4);
  v8 = *v7;
  v9 = (uint8x8_t *)((char *)v7 + a4);
  v10 = *v9;
  if (a3)
  {
    v11 = (uint8x8_t *)((char *)a3 + a4 + a4);
    v12 = *v11;
    v13 = (uint8x8_t *)((char *)v11 + a4);
    v14 = *v13;
    v15 = (uint8x8_t *)((char *)v13 + a4);
    v4 = vrhadd_u8(v4, *a3);
    v6 = vrhadd_u8(v6, *(uint8x8_t *)((char *)a3 + a4));
    v8 = vrhadd_u8(v8, v12);
    v10 = vrhadd_u8(v10, v14);
  }
  else
  {
    v15 = 0;
  }
  v16 = (uint8x8_t *)((char *)v9 + a4);
  v17 = *v16;
  v18 = (uint8x8_t *)((char *)v16 + a4);
  v19 = *v18;
  v20 = (uint8x8_t *)((char *)v18 + a4);
  v21 = *v20;
  v22 = *(uint8x8_t *)((char *)v20 + a4);
  if (v15)
  {
    v23 = (uint8x8_t *)((char *)v15 + a4 + a4);
    v17 = vrhadd_u8(v17, *v15);
    v19 = vrhadd_u8(v19, *(uint8x8_t *)((char *)v15 + a4));
    v21 = vrhadd_u8(v21, *v23);
    v22 = vrhadd_u8(v22, *(uint8x8_t *)((char *)v23 + a4));
  }
  return vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(a1[4], v8), a1[12], v21), (int16x8_t)vabal_u8(vabdl_u8(a1[6], v10), a1[14], v22)), vaddq_s16((int16x8_t)vabal_u8(vabdl_u8(a1[2], v6), a1[10], v19), (int16x8_t)vabal_u8(vabdl_u8(*a1, v4), a1[8], v17))));
}

double sub_1B690F9B8(uint8x16_t **a1, _WORD *a2)
{
  double result;

  *(_QWORD *)&result = sub_1B690F9DC(a1[7], (uint8x16_t *)((char *)a1[3] + *((int *)a1 + 1) * (uint64_t)*((int *)a1 + 4) + *(int *)a1), *((_DWORD *)a1 + 4), a2);
  return result;
}

__int16 sub_1B690F9DC@<H0>(uint8x16_t *a1@<X0>, uint8x16_t *a2@<X1>, int a3@<W2>, _WORD *a4@<X3>)
{
  uint8x16_t v4;
  uint8x16_t v5;
  uint8x16_t v6;
  uint8x16_t *v7;
  uint8x16_t v8;
  uint8x16_t *v9;
  uint8x16_t v10;
  uint8x16_t *v11;
  uint8x16_t v12;
  uint8x16_t *v13;
  uint16x8_t v14;
  uint16x8_t v15;
  uint8x16_t v16;
  uint8x16_t v17;
  uint8x16_t v18;
  uint8x16_t v19;
  uint8x16_t v20;
  uint8x16_t *v21;
  uint8x16_t v22;
  uint8x16_t *v23;
  uint8x16_t v24;
  uint8x16_t *v25;
  uint8x16_t v26;
  uint8x16_t *v27;
  uint8x16_t v28;
  uint8x16_t v29;
  uint8x16_t v30;
  uint8x16_t v31;
  uint8x16_t v32;
  uint8x16_t *v33;
  uint8x16_t v34;
  uint8x16_t *v35;
  uint8x16_t v36;
  uint8x16_t *v37;
  uint8x16_t v38;
  uint8x16_t *v39;
  uint16x8_t v40;
  uint16x8_t v41;
  uint8x16_t v42;
  uint8x16_t v43;
  uint8x16_t v44;
  uint8x16_t v45;
  uint8x16_t v46;
  uint8x16_t *v47;
  uint8x16_t v48;
  uint8x8_t *v49;
  uint8x16_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  __int16 v54;
  __int16 v55;
  __int16 result;

  v4 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  v7 = (uint8x16_t *)((char *)a2 + a3);
  v8 = *v7;
  v9 = (uint8x16_t *)((char *)v7 + a3);
  v10 = *v9;
  v11 = (uint8x16_t *)((char *)v9 + a3);
  v12 = *v11;
  v13 = (uint8x16_t *)((char *)v11 + a3);
  v14 = vabdl_u8(*(uint8x8_t *)v4.i8, *(uint8x8_t *)v8.i8);
  v15 = vabdl_high_u8(v4, v8);
  v17 = a1[4];
  v16 = a1[5];
  v19 = a1[6];
  v18 = a1[7];
  v20 = *v13;
  v21 = (uint8x16_t *)((char *)v13 + a3);
  v22 = *v21;
  v23 = (uint8x16_t *)((char *)v21 + a3);
  v24 = *v23;
  v25 = (uint8x16_t *)((char *)v23 + a3);
  v26 = *v25;
  v27 = (uint8x16_t *)((char *)v25 + a3);
  v29 = a1[8];
  v28 = a1[9];
  v31 = a1[10];
  v30 = a1[11];
  v32 = *v27;
  v33 = (uint8x16_t *)((char *)v27 + a3);
  v34 = *v33;
  v35 = (uint8x16_t *)((char *)v33 + a3);
  v36 = *v35;
  v37 = (uint8x16_t *)((char *)v35 + a3);
  v38 = *v37;
  v39 = (uint8x16_t *)((char *)v37 + a3);
  v40 = vabdl_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v34.i8);
  v41 = vabdl_high_u8(v28, v34);
  v43 = a1[12];
  v42 = a1[13];
  v45 = a1[14];
  v44 = a1[15];
  v46 = *v39;
  v47 = (uint8x16_t *)((char *)v39 + a3);
  v48 = *v47;
  v49 = (uint8x8_t *)&v47->i8[a3];
  v50 = *(uint8x16_t *)&v49->i8[a3];
  v51 = (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(v15, *a1, *a2), v6, v10), v5, v12), v17, v20), v16, v22), v19, v24), v18, v26);
  v52 = (int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(v40, *(uint8x8_t *)v29.i8, *(uint8x8_t *)v32.i8), *(uint8x8_t *)v31.i8, *(uint8x8_t *)v36.i8), *(uint8x8_t *)v30.i8, *(uint8x8_t *)v38.i8), *(uint8x8_t *)v43.i8, *(uint8x8_t *)v46.i8), *(uint8x8_t *)v42.i8, *(uint8x8_t *)v48.i8), *(uint8x8_t *)v45.i8, *v49), *(uint8x8_t *)v44.i8, *(uint8x8_t *)v50.i8);
  v53 = (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(vabal_high_u8(v41, v29, v32), v31, v36), v30, v38), v43, v46), v42, v48), v45, *(uint8x16_t *)v49->i8), v44, v50);
  v14.i16[0] = vaddvq_s16((int16x8_t)vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(vabal_u8(v14, *(uint8x8_t *)a1->i8, *(uint8x8_t *)a2->i8), *(uint8x8_t *)v6.i8, *(uint8x8_t *)v10.i8), *(uint8x8_t *)v5.i8, *(uint8x8_t *)v12.i8), *(uint8x8_t *)v17.i8, *(uint8x8_t *)v20.i8), *(uint8x8_t *)v16.i8, *(uint8x8_t *)v22.i8), *(uint8x8_t *)v19.i8, *(uint8x8_t *)v24.i8), *(uint8x8_t *)v18.i8, *(uint8x8_t *)v26.i8));
  a4[12] = v14.i16[0];
  v51.i16[0] = vaddvq_s16(v51);
  a4[13] = v51.i16[0];
  v54 = v51.i16[0];
  v51.i16[0] = vaddvq_s16(v52);
  a4[14] = v51.i16[0];
  v55 = v51.i16[0];
  result = vaddvq_s16(v53);
  a4[15] = result;
  a4[8] = v55 + v14.i16[0];
  a4[9] = result + v54;
  a4[4] = v54 + v14.i16[0];
  a4[5] = result + v55;
  *a4 = result + v54 + v55 + v14.i16[0];
  return result;
}

double sub_1B690FB70(int *a1, _WORD *a2, double a3, double a4, int8x8_t a5)
{
  uint8x16_t *v6;
  double result;
  int8x16_t v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = (uint8x16_t *)*((_QWORD *)a1 + 7);
  sub_1B690DE78(v8, (uint8x16_t *)(*((_QWORD *)a1 + 3) + a1[1] * (uint64_t)a1[4] + *a1), a1[4], *((char *)a1 + 72), *((char *)a1 + 73), *((unsigned __int8 *)a1 + 74), a3, a4, a5);
  *(_QWORD *)&result = sub_1B690F9DC(v6, (uint8x16_t *)v8, 16, a2);
  return result;
}

uint64_t sub_1B690FC08(uint8x8_t *a1, uint64_t a2, _WORD *a3)
{
  uint64_t result;

  result = sub_1B690F2C0(*(uint8x8_t **)(a2 + 56), 16, a1, *(_DWORD *)(a2 + 16));
  *a3 = result;
  return result;
}

uint64_t sub_1B690FC3C(uint8x16_t *a1, uint64_t a2, _WORD *a3, double a4, double a5, int8x8_t a6)
{
  uint8x8_t *v7;
  uint64_t result;
  int8x16_t v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = *(uint8x8_t **)(a2 + 56);
  sub_1B690DE78(v9, a1, *(_DWORD *)(a2 + 16), *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), a4, a5, a6);
  result = sub_1B690F2C0(v7, 16, (uint8x8_t *)v9, 16);
  *a3 = result;
  return result;
}

float sub_1B690FCD0(unsigned int a1, uint64_t a2, uint8x16_t *a3, _WORD *a4)
{
  uint8x16_t *v6;
  uint64_t v7;
  int v8;
  uint8x16_t *v9;
  uint8x16_t *v10;
  uint8x16_t v11;
  uint8x16_t v12;
  uint8x16_t *v13;
  uint8x16_t v14;
  uint8x16_t v15;
  uint8x16_t *v16;
  uint8x16_t v17;
  uint8x16_t *v18;
  uint8x16_t v19;
  uint8x16_t v20;
  uint8x16_t v21;
  uint8x16_t v22;
  uint8x16_t v23;
  uint8x16_t *v24;
  uint8x16_t v25;
  uint8x16_t v26;
  uint8x16_t v27;
  uint8x16_t v28;
  uint8x16_t v29;
  uint8x16_t v30;
  uint8x16_t *v31;
  uint8x16_t v32;
  uint8x16_t v33;
  uint8x16_t *v34;
  unsigned int v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  uint8x16_t *v40;
  uint8x16_t v41;
  uint8x16_t v42;
  uint8x16_t v43;
  uint8x16_t v44;
  uint8x16_t v45;
  uint8x16_t *v46;
  uint8x16_t v47;
  uint8x16_t *v48;
  uint8x16_t v49;
  uint8x16_t *v50;
  uint8x16_t v51;
  uint8x16_t v52;
  uint8x16_t v53;
  uint8x16_t v54;
  uint8x16_t v55;
  unsigned int v56;
  uint8x16_t *v57;
  uint8x16_t v58;
  uint8x16_t v59;
  uint8x16_t v60;
  uint8x16_t v61;
  uint8x16_t v62;
  uint8x16_t v63;
  uint8x16_t v64;
  uint8x16_t v65;
  float result;
  uint8x16_t *v67;
  uint8x16_t *v68;

  v6 = *(uint8x16_t **)(a2 + 56);
  v7 = *(int *)(a2 + 16);
  v67 = 0;
  v68 = 0;
  v8 = sub_1B68FEA1C(a1, (_DWORD *)a2, &v68, &v67);
  v9 = v68;
  if (v8)
  {
    v10 = v67;
    v11 = *v68;
    v12 = *(uint8x16_t *)((char *)v68 + v7);
    v13 = (uint8x16_t *)((char *)v68 + v7 + v7);
    v14 = *v13;
    v15 = *(uint8x16_t *)((char *)v13 + v7);
    if (v67)
    {
      v16 = (uint8x16_t *)((char *)v67 + v7 + v7);
      v17 = *v16;
      v18 = (uint8x16_t *)((char *)v16 + v7);
      v19 = *v18;
      v10 = (uint8x16_t *)((char *)v18 + v7);
      v11 = vrhaddq_u8(v11, *v67);
      v12 = vrhaddq_u8(v12, *(uint8x16_t *)((char *)v67 + v7));
      v14 = vrhaddq_u8(v14, v17);
      v15 = vrhaddq_u8(v15, v19);
    }
    v21 = *v6;
    v20 = v6[1];
    v23 = v6[2];
    v22 = v6[3];
    if (a3)
    {
      *a3 = v11;
      a3[1] = v12;
      v24 = a3 + 4;
      a3[2] = v14;
      a3[3] = v15;
    }
    else
    {
      v24 = 0;
    }
    v35 = 0;
    v36 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v23.i8, *(uint8x8_t *)v14.i8), *(uint8x8_t *)v21.i8, *(uint8x8_t *)v11.i8);
    v37 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v23, v14), v21, v11);
    v38 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v22.i8, *(uint8x8_t *)v15.i8), *(uint8x8_t *)v20.i8, *(uint8x8_t *)v12.i8);
    v39 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v22, v15), v20, v12);
    v40 = v6 + 7;
    do
    {
      v41 = *(uint8x16_t *)((char *)v9 + 4 * v7);
      v42 = *(uint8x16_t *)((char *)v9 + 5 * v7);
      v43 = *(uint8x16_t *)((char *)v9 + 6 * v7);
      v44 = *(uint8x16_t *)((char *)v9 + 7 * v7);
      if (v10)
      {
        v45 = *v10;
        v46 = (uint8x16_t *)((char *)v10 + v7);
        v47 = *v46;
        v48 = (uint8x16_t *)((char *)v46 + v7);
        v49 = *v48;
        v50 = (uint8x16_t *)((char *)v48 + v7);
        v51 = *v50;
        v10 = (uint8x16_t *)((char *)v50 + v7);
        v41 = vrhaddq_u8(v41, v45);
        v42 = vrhaddq_u8(v42, v47);
        v43 = vrhaddq_u8(v43, v49);
        v44 = vrhaddq_u8(v44, v51);
      }
      v53 = v40[-3];
      v52 = v40[-2];
      v55 = v40[-1];
      v54 = *v40;
      if (v24)
      {
        *v24 = v41;
        v24[1] = v42;
        v24[2] = v43;
        v24[3] = v44;
        v24 += 4;
      }
      v9 = (uint8x16_t *)((char *)v9 + 2 * v7 + v7 + v7);
      v36 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v36, *(uint8x8_t *)v53.i8, *(uint8x8_t *)v41.i8), *(uint8x8_t *)v55.i8, *(uint8x8_t *)v43.i8);
      v37 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v37, v53, v41), v55, v43);
      v38 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v38, *(uint8x8_t *)v52.i8, *(uint8x8_t *)v42.i8), *(uint8x8_t *)v54.i8, *(uint8x8_t *)v44.i8);
      v35 += 4;
      v40 += 4;
      v39 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v39, v52, v42), v54, v44);
    }
    while (v35 < 0xC);
  }
  else
  {
    v25 = *v6;
    v26 = v6[1];
    v27 = v6[2];
    v28 = v6[3];
    v29 = *v68;
    v30 = *(uint8x16_t *)((char *)v68 + v7);
    v31 = (uint8x16_t *)((char *)v68 + v7 + v7);
    v32 = *v31;
    v33 = *(uint8x16_t *)((char *)v31 + v7);
    if (a3)
    {
      *a3 = v29;
      a3[1] = v30;
      v34 = a3 + 4;
      a3[2] = v32;
      a3[3] = v33;
    }
    else
    {
      v34 = 0;
    }
    v56 = 0;
    v36 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v32.i8), *(uint8x8_t *)v25.i8, *(uint8x8_t *)v29.i8);
    v37 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v27, v32), v25, v29);
    v38 = (int16x8_t)vabal_u8(vabdl_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v33.i8), *(uint8x8_t *)v26.i8, *(uint8x8_t *)v30.i8);
    v39 = (int16x8_t)vabal_high_u8(vabdl_high_u8(v28, v33), v26, v30);
    v57 = v6 + 7;
    do
    {
      v59 = v57[-3];
      v58 = v57[-2];
      v61 = v57[-1];
      v60 = *v57;
      v62 = *(uint8x16_t *)((char *)v9 + 4 * v7);
      v63 = *(uint8x16_t *)((char *)v9 + 5 * v7);
      v64 = *(uint8x16_t *)((char *)v9 + 6 * v7);
      v65 = *(uint8x16_t *)((char *)v9 + 7 * v7);
      if (v34)
      {
        *v34 = v62;
        v34[1] = v63;
        v34[2] = v64;
        v34[3] = v65;
        v34 += 4;
      }
      v9 = (uint8x16_t *)((char *)v9 + 2 * v7 + v7 + v7);
      v36 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v36, *(uint8x8_t *)v59.i8, *(uint8x8_t *)v62.i8), *(uint8x8_t *)v61.i8, *(uint8x8_t *)v64.i8);
      v37 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v37, v59, v62), v61, v64);
      v38 = (int16x8_t)vabal_u8(vabal_u8((uint16x8_t)v38, *(uint8x8_t *)v58.i8, *(uint8x8_t *)v63.i8), *(uint8x8_t *)v60.i8, *(uint8x8_t *)v65.i8);
      v56 += 4;
      v57 += 4;
      v39 = (int16x8_t)vabal_high_u8(vabal_high_u8((uint16x8_t)v39, v58, v63), v60, v65);
    }
    while (v56 < 0xC);
  }
  result = COERCE_FLOAT(vaddlvq_u16((uint16x8_t)vaddq_s16(vaddq_s16(v38, v39), vaddq_s16(v37, v36))));
  *a4 = LOWORD(result);
  return result;
}

uint64_t sub_1B690FF6C(unsigned int a1, uint64_t a2, int8x16_t *a3, _WORD *a4)
{
  uint8x8_t *v7;
  int v8;
  double v9;
  double v10;
  int8x8_t v11;
  uint64_t result;
  uint64_t v13;
  uint8x16_t *v14;

  v7 = *(uint8x8_t **)(a2 + 56);
  v8 = *(_DWORD *)(a2 + 16);
  v13 = 0;
  v14 = 0;
  if (sub_1B68FEA1C(a1, (_DWORD *)a2, &v14, &v13))
    sub_1B690DEF8(a3, (uint64_t)v14, v13, v8, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v9, v10, v11);
  else
    sub_1B690DE78(a3, v14, v8, *(char *)(a2 + 72), *(char *)(a2 + 73), *(unsigned __int8 *)(a2 + 74), v9, v10, v11);
  result = sub_1B690F2C0(v7, 16, (uint8x8_t *)a3, 16);
  *a4 = result;
  return result;
}

int16x4_t sub_1B691001C(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8x16_t v13;
  int16x4_t result;

  v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  v9 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  v10 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a5), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a5->i8);
  v11 = 2;
  v12 = a6;
  do
  {
    v13 = *(uint8x16_t *)a1[v11].i8;
    v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a2 + v12)), v13, *(uint8x16_t *)&a2->i8[v12]);
    v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a3 + v12)), v13, *(uint8x16_t *)&a3->i8[v12]);
    v9 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v9, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a4 + v12)), v13, *(uint8x16_t *)&a4->i8[v12]);
    v10 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v10, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a5 + v12)), v13, *(uint8x16_t *)&a5->i8[v12]);
    v11 += 2;
    v12 += a6;
  }
  while ((_DWORD)(v11 * 8) != 256);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1B69100D4(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8x16_t v11;
  int16x4_t result;

  v6 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  v9 = 2;
  v10 = a5;
  do
  {
    v11 = *(uint8x16_t *)a1[v9].i8;
    v6 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v6, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a2 + v10)), v11, *(uint8x16_t *)&a2->i8[v10]);
    v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a3 + v10)), v11, *(uint8x16_t *)&a3->i8[v10]);
    v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a4 + v10)), v11, *(uint8x16_t *)&a4->i8[v10]);
    v9 += 2;
    v10 += a5;
  }
  while ((_DWORD)(v9 * 8) != 256);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

int16x4_t sub_1B6910170(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8x16_t v13;
  int16x4_t result;

  v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  v9 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  v10 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a5), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a5->i8);
  v11 = 2;
  v12 = a6;
  do
  {
    v13 = *(uint8x16_t *)a1[v11].i8;
    v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a2 + v12)), v13, *(uint8x16_t *)&a2->i8[v12]);
    v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a3 + v12)), v13, *(uint8x16_t *)&a3->i8[v12]);
    v9 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v9, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a4 + v12)), v13, *(uint8x16_t *)&a4->i8[v12]);
    v10 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v10, *(uint8x8_t *)v13.i8, *(uint8x8_t *)((char *)a5 + v12)), v13, *(uint8x16_t *)&a5->i8[v12]);
    v11 += 2;
    v12 += a6;
  }
  while ((_DWORD)(v11 * 8) != 128);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1B6910228(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8x16_t v11;
  int16x4_t result;

  v6 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a2), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a2->i8);
  v7 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a3), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a3->i8);
  v8 = (int8x16_t)vabal_high_u8(vabdl_u8(*a1, *a4), *(uint8x16_t *)a1->i8, *(uint8x16_t *)a4->i8);
  v9 = 2;
  v10 = a5;
  do
  {
    v11 = *(uint8x16_t *)a1[v9].i8;
    v6 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v6, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a2 + v10)), v11, *(uint8x16_t *)&a2->i8[v10]);
    v7 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v7, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a3 + v10)), v11, *(uint8x16_t *)&a3->i8[v10]);
    v8 = (int8x16_t)vabal_high_u8(vabal_u8((uint16x8_t)v8, *(uint8x8_t *)v11.i8, *(uint8x8_t *)((char *)a4 + v10)), v11, *(uint8x16_t *)&a4->i8[v10]);
    v9 += 2;
    v10 += a5;
  }
  while ((_DWORD)(v9 * 8) != 128);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

int16x4_t sub_1B69102C4(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8x8_t v13;
  int16x4_t result;

  v7 = (int8x16_t)vabdl_u8(*a1, *a2);
  v8 = (int8x16_t)vabdl_u8(*a1, *a3);
  v9 = (int8x16_t)vabdl_u8(*a1, *a4);
  v10 = (int8x16_t)vabdl_u8(*a1, *a5);
  v11 = 2;
  v12 = a6;
  do
  {
    v13 = a1[v11];
    v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v13, *(uint8x8_t *)((char *)a2 + v12));
    v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v13, *(uint8x8_t *)((char *)a3 + v12));
    v9 = (int8x16_t)vabal_u8((uint16x8_t)v9, v13, *(uint8x8_t *)((char *)a4 + v12));
    v10 = (int8x16_t)vabal_u8((uint16x8_t)v10, v13, *(uint8x8_t *)((char *)a5 + v12));
    v11 += 2;
    v12 += a6;
  }
  while ((_DWORD)(v11 * 8) != 256);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1B691035C(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8x8_t v11;
  int16x4_t result;

  v6 = (int8x16_t)vabdl_u8(*a1, *a2);
  v7 = (int8x16_t)vabdl_u8(*a1, *a3);
  v8 = (int8x16_t)vabdl_u8(*a1, *a4);
  v9 = 2;
  v10 = a5;
  do
  {
    v11 = a1[v9];
    v6 = (int8x16_t)vabal_u8((uint16x8_t)v6, v11, *(uint8x8_t *)((char *)a2 + v10));
    v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v11, *(uint8x8_t *)((char *)a3 + v10));
    v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v11, *(uint8x8_t *)((char *)a4 + v10));
    v9 += 2;
    v10 += a5;
  }
  while ((_DWORD)(v9 * 8) != 256);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

int16x4_t sub_1B69103E0(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, uint8x8_t *a5, int a6, int16x4_t *a7)
{
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8x8_t v13;
  int16x4_t result;

  v7 = (int8x16_t)vabdl_u8(*a1, *a2);
  v8 = (int8x16_t)vabdl_u8(*a1, *a3);
  v9 = (int8x16_t)vabdl_u8(*a1, *a4);
  v10 = (int8x16_t)vabdl_u8(*a1, *a5);
  v11 = 2;
  v12 = a6;
  do
  {
    v13 = a1[v11];
    v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v13, *(uint8x8_t *)((char *)a2 + v12));
    v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v13, *(uint8x8_t *)((char *)a3 + v12));
    v9 = (int8x16_t)vabal_u8((uint16x8_t)v9, v13, *(uint8x8_t *)((char *)a4 + v12));
    v10 = (int8x16_t)vabal_u8((uint16x8_t)v10, v13, *(uint8x8_t *)((char *)a5 + v12));
    v11 += 2;
    v12 += a6;
  }
  while ((_DWORD)(v11 * 8) != 128);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)), vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v9.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)), vadd_s16(*(int16x4_t *)v10.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))));
  *a7 = result;
  return result;
}

int16x4_t sub_1B6910478(uint8x8_t *a1, uint8x8_t *a2, uint8x8_t *a3, uint8x8_t *a4, int a5, int16x4_t *a6)
{
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8x8_t v11;
  int16x4_t result;

  v6 = (int8x16_t)vabdl_u8(*a1, *a2);
  v7 = (int8x16_t)vabdl_u8(*a1, *a3);
  v8 = (int8x16_t)vabdl_u8(*a1, *a4);
  v9 = 2;
  v10 = a5;
  do
  {
    v11 = a1[v9];
    v6 = (int8x16_t)vabal_u8((uint16x8_t)v6, v11, *(uint8x8_t *)((char *)a2 + v10));
    v7 = (int8x16_t)vabal_u8((uint16x8_t)v7, v11, *(uint8x8_t *)((char *)a3 + v10));
    v8 = (int8x16_t)vabal_u8((uint16x8_t)v8, v11, *(uint8x8_t *)((char *)a4 + v10));
    v9 += 2;
    v10 += a5;
  }
  while ((_DWORD)(v9 * 8) != 128);
  result = vpadd_s16(vpadd_s16(vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)), vadd_s16(*(int16x4_t *)v7.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))), vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0));
  *a6 = result;
  return result;
}

uint32x2_t sub_1B69104FC(uint8x8_t *a1, int a2)
{
  int16x4_t v2;
  char v3;
  int8x16_t v4;
  uint8x16_t v5;
  uint8x16_t *v6;
  uint8x16_t v7;
  uint8x8_t *v8;
  uint8x16_t *v9;
  uint8x16_t v10;
  uint8x16_t *v11;
  uint8x16_t v12;
  uint8x16_t *v13;
  uint8x16_t v14;
  uint8x8_t *v15;
  uint8x16_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;

  v2 = 0;
  v3 = 1;
  v4 = 0uLL;
  do
  {
    v5 = *(uint8x16_t *)&a1->i8[a2];
    v6 = (uint8x16_t *)((char *)a1 + a2 + a2);
    v7 = *v6;
    v8 = (uint8x8_t *)&v6->i8[a2];
    v9 = (uint8x16_t *)((char *)v8 + a2);
    v10 = *v9;
    v11 = (uint8x16_t *)((char *)v9 + a2);
    v12 = *v11;
    v13 = (uint8x16_t *)((char *)v11 + a2);
    v14 = *v13;
    v15 = (uint8x8_t *)&v13->i8[a2];
    v16 = *(uint8x16_t *)v8->i8;
    v17 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v5.i8, *a1), *(uint8x8_t *)v7.i8), *v8);
    v18 = (int16x8_t)vaddw_high_u8(vaddw_high_u8(vaddl_high_u8(v5, *(uint8x16_t *)a1->i8), v7), *(uint8x16_t *)v8->i8);
    v19 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v12.i8, *(uint8x8_t *)v10.i8), *(uint8x8_t *)v14.i8), *v15);
    v20 = (int16x8_t)vaddw_high_u8(vaddw_high_u8(vaddl_high_u8(v12, v10), v14), *(uint8x16_t *)v15->i8);
    LOBYTE(v8) = v3;
    *(int16x4_t *)v17.i8 = vpadd_s16((int16x4_t)*(_OWORD *)&vpaddq_s16(v17, v17), (int16x4_t)*(_OWORD *)&vpaddq_s16(v18, v18));
    v17.u64[1] = (unint64_t)vpadd_s16((int16x4_t)*(_OWORD *)&vpaddq_s16(v19, v19), (int16x4_t)*(_OWORD *)&vpaddq_s16(v20, v20));
    *(int8x8_t *)v17.i8 = vrshrn_n_s16(v17, 4uLL);
    v2 = (int16x4_t)vpadal_u8((uint16x4_t)v2, *(uint8x8_t *)v17.i8);
    *(int8x8_t *)v18.i8 = vtrn1_s8(*(int8x8_t *)v17.i8, *(int8x8_t *)v17.i8);
    *(int8x8_t *)v17.i8 = vtrn2_s8(*(int8x8_t *)v17.i8, *(int8x8_t *)v17.i8);
    *(int32x2_t *)v19.i8 = vzip1_s32(*(int32x2_t *)v18.i8, *(int32x2_t *)v17.i8);
    *(int16x4_t *)v20.i8 = vtrn1_s16(*(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8);
    *(int32x2_t *)v17.i8 = vzip2_s32(*(int32x2_t *)v18.i8, *(int32x2_t *)v17.i8);
    *(int16x4_t *)v18.i8 = vtrn1_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
    v20.u64[1] = (unint64_t)vtrn2_s16(*(int16x4_t *)v19.i8, *(int16x4_t *)v19.i8);
    v18.u64[1] = (unint64_t)vtrn2_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
    v4 = (int8x16_t)vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8((uint16x8_t)v4, vabdq_u8(*(uint8x16_t *)a1->i8, (uint8x16_t)v20)), vabdq_u8(v5, (uint8x16_t)v20)), vabdq_u8(v7, (uint8x16_t)v20)), vabdq_u8(v16, (uint8x16_t)v20)), vabdq_u8(v10, (uint8x16_t)v18)), vabdq_u8(v12, (uint8x16_t)v18)), vabdq_u8(v14, (uint8x16_t)v18)), vabdq_u8(*(uint8x16_t *)v15->i8, (uint8x16_t)v18));
    a1 = (uint8x8_t *)((char *)v15 + a2);
    v3 = 0;
  }
  while ((v8 & 1) != 0);
  return vpaddl_u16((uint16x4_t)vpadd_s16(vadd_s16(*(int16x4_t *)v4.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)), v2));
}

uint8x8_t *sub_1B691062C(uint8x8_t *result, int a2, _WORD *a3, uint32x2_t *a4)
{
  char v4;
  uint8x16_t v5;
  uint8x16_t *v6;
  uint8x16_t v7;
  uint8x16_t *v8;
  uint8x16_t v9;
  uint8x16_t *v10;
  uint8x16_t v11;
  uint8x16_t *v12;
  uint8x16_t v13;
  uint8x16_t *v14;
  uint8x16_t v15;
  uint8x8_t *v16;
  int16x8_t v17;
  int16x8_t v18;
  uint8x16_t v19;
  char v20;
  uint8x16_t v21;
  uint8x16_t v22;
  uint8x16_t v23;
  uint8x16_t v24;
  uint8x16_t v25;
  uint8x16_t v26;
  uint8x16_t v27;
  uint8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;

  v4 = 1;
  do
  {
    v5 = *(uint8x16_t *)&result->i8[a2];
    v6 = (uint8x16_t *)((char *)result + a2 + a2);
    v7 = *v6;
    v8 = (uint8x16_t *)((char *)v6 + a2);
    v9 = *v8;
    v10 = (uint8x16_t *)((char *)v8 + a2);
    v11 = *v10;
    v12 = (uint8x16_t *)((char *)v10 + a2);
    v13 = *v12;
    v14 = (uint8x16_t *)((char *)v12 + a2);
    v15 = *v14;
    v16 = (uint8x8_t *)&v14->i8[a2];
    v17 = (int16x8_t)vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v5.i8, *result), *(uint8x8_t *)v7.i8), *(uint8x8_t *)v9.i8), *(uint8x8_t *)v11.i8), *(uint8x8_t *)v13.i8), *(uint8x8_t *)v15.i8), *v16);
    v18 = (int16x8_t)vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddl_high_u8(v5, *(uint8x16_t *)result->i8), v7), v9), v11), v13), v15), *(uint8x16_t *)v16->i8);
    *(int16x4_t *)v17.i8 = vpadd_s16((int16x4_t)*(_OWORD *)&vpaddq_s16(v17, v17), (int16x4_t)*(_OWORD *)&vpaddq_s16(v18, v18));
    *(int16x4_t *)v17.i8 = vpadd_s16(*(int16x4_t *)v17.i8, *(int16x4_t *)v17.i8);
    v17.i64[1] = v17.i64[0];
    *(int8x8_t *)v17.i8 = vrshrn_n_s16(v17, 6uLL);
    *(int8x8_t *)v19.i8 = vdup_lane_s8(*(int8x8_t *)v17.i8, 0);
    v19.u64[1] = (unint64_t)vdup_lane_s8(*(int8x8_t *)v17.i8, 1);
    v20 = v4;
    v21 = vabdq_u8(*(uint8x16_t *)result->i8, v19);
    v22 = vabdq_u8(v5, v19);
    v23 = vabdq_u8(v7, v19);
    v24 = vabdq_u8(v9, v19);
    v25 = vabdq_u8(v11, v19);
    v26 = vabdq_u8(v13, v19);
    v27 = vabdq_u8(v15, v19);
    v28 = vabdq_u8(*(uint8x16_t *)v16->i8, v19);
    v29 = (int8x16_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_u8(*(uint8x8_t *)v22.i8, *(uint8x8_t *)v22.i8)), vmull_u8(*(uint8x8_t *)v21.i8, *(uint8x8_t *)v21.i8)), vmull_u8(*(uint8x8_t *)v23.i8, *(uint8x8_t *)v23.i8)), vmull_u8(*(uint8x8_t *)v24.i8, *(uint8x8_t *)v24.i8)), vmull_u8(*(uint8x8_t *)v25.i8, *(uint8x8_t *)v25.i8)), vmull_u8(*(uint8x8_t *)v26.i8, *(uint8x8_t *)v26.i8)), vmull_u8(*(uint8x8_t *)v27.i8, *(uint8x8_t *)v27.i8)), vmull_u8(*(uint8x8_t *)v28.i8, *(uint8x8_t *)v28.i8));
    v30 = (int8x16_t)vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpadalq_u16(vpaddlq_u16(vmull_high_u8(v22, v22)), vmull_high_u8(v21, v21)), vmull_high_u8(v23, v23)), vmull_high_u8(v24, v24)), vmull_high_u8(v25, v25)), vmull_high_u8(v26, v26)), vmull_high_u8(v27, v27)), vmull_high_u8(v28, v28));
    *a3++ = v17.i16[0];
    *a4++ = vrshr_n_u32((uint32x2_t)vpadd_s32(vadd_s32(*(int32x2_t *)v29.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL)), vadd_s32(*(int32x2_t *)v30.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL))), 6uLL);
    result = (uint8x8_t *)((char *)v16 + a2);
    v4 = 0;
  }
  while ((v20 & 1) != 0);
  return result;
}

__n128 sub_1B69107A0(uint64_t a1, _OWORD *a2, int a3, uint64_t a4, _OWORD *a5, int a6)
{
  __int128 *v6;
  __int128 v7;
  __int128 *v8;
  __int128 v9;
  __int128 *v10;
  __int128 v11;
  __int128 *v12;
  __int128 v13;
  __int128 *v14;
  __int128 v15;
  __int128 *v16;
  __int128 v17;
  __int128 *v18;
  __int128 v19;
  __int128 *v20;
  __int128 v21;
  __int128 *v22;
  __int128 v23;
  __int128 *v24;
  __int128 v25;
  __int128 *v26;
  __int128 v27;
  __n128 *v28;
  __n128 result;
  __int128 *v30;
  __int128 v31;
  __int128 *v32;
  __int128 v33;
  __int128 v34;
  __int128 *v35;
  __int128 v36;
  __int128 *v37;
  __int128 v38;
  __int128 *v39;
  __int128 v40;
  __n128 *v41;
  __int128 *v42;
  __int128 v43;
  __int128 *v44;
  __int128 v45;
  __int128 v46;

  v6 = (_OWORD *)((char *)a2 + a3);
  v7 = *v6;
  v8 = (__int128 *)((char *)v6 + a3);
  v9 = *v8;
  v10 = (__int128 *)((char *)v8 + a3);
  v11 = *v10;
  v12 = (__int128 *)((char *)v10 + a3);
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = v9;
  *(_OWORD *)(a1 + 48) = v11;
  v13 = *v12;
  v14 = (__int128 *)((char *)v12 + a3);
  v15 = *v14;
  v16 = (__int128 *)((char *)v14 + a3);
  v17 = *v16;
  v18 = (__int128 *)((char *)v16 + a3);
  v19 = *v18;
  v20 = (__int128 *)((char *)v18 + a3);
  *(_OWORD *)(a1 + 64) = v13;
  *(_OWORD *)(a1 + 80) = v15;
  *(_OWORD *)(a1 + 96) = v17;
  *(_OWORD *)(a1 + 112) = v19;
  v21 = *v20;
  v22 = (__int128 *)((char *)v20 + a3);
  v23 = *v22;
  v24 = (__int128 *)((char *)v22 + a3);
  v25 = *v24;
  v26 = (__int128 *)((char *)v24 + a3);
  v27 = *v26;
  v28 = (__n128 *)((char *)v26 + a3);
  *(_OWORD *)(a1 + 128) = v21;
  *(_OWORD *)(a1 + 144) = v23;
  *(_OWORD *)(a1 + 160) = v25;
  *(_OWORD *)(a1 + 176) = v27;
  result = *v28;
  v30 = (__int128 *)((char *)v28 + a3);
  v31 = *v30;
  v32 = (__int128 *)((char *)v30 + a3);
  v33 = *v32;
  v34 = *(__int128 *)((char *)v32 + a3);
  *(__n128 *)(a1 + 192) = result;
  *(_OWORD *)(a1 + 208) = v31;
  *(_OWORD *)(a1 + 224) = v33;
  *(_OWORD *)(a1 + 240) = v34;
  if (a4)
  {
    v35 = (_OWORD *)((char *)a5 + a6);
    v36 = *v35;
    v37 = (__int128 *)((char *)v35 + a6);
    v38 = *v37;
    v39 = (__int128 *)((char *)v37 + a6);
    v40 = *v39;
    v41 = (__n128 *)((char *)v39 + a6);
    *(_OWORD *)a4 = *a5;
    *(_OWORD *)(a4 + 16) = v36;
    *(_OWORD *)(a4 + 32) = v38;
    *(_OWORD *)(a4 + 48) = v40;
    result = *v41;
    v42 = (__int128 *)((char *)v41 + a6);
    v43 = *v42;
    v44 = (__int128 *)((char *)v42 + a6);
    v45 = *v44;
    v46 = *(__int128 *)((char *)v44 + a6);
    *(__n128 *)(a4 + 64) = result;
    *(_OWORD *)(a4 + 80) = v43;
    *(_OWORD *)(a4 + 96) = v45;
    *(_OWORD *)(a4 + 112) = v46;
  }
  return result;
}

uint16x8_t sub_1B6910888(uint8x16_t *a1, unsigned int a2, uint8x16_t *a3, unsigned int a4, uint16x8_t *a5, int a6)
{
  int v6;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t v10;
  uint16x8_t v11;
  uint16x8_t result;

  v6 = a6 + 2;
  do
  {
    v7 = *a1;
    v8 = *a3;
    v9 = *(uint8x16_t *)((char *)a1 + a2);
    a1 = (uint8x16_t *)((char *)a1 + a2 + (unint64_t)a2);
    v10 = *(uint8x16_t *)((char *)a3 + a4);
    a3 = (uint8x16_t *)((char *)a3 + a4 + (unint64_t)a4);
    v11 = vsubl_u8(*(uint8x8_t *)v7.i8, *(uint8x8_t *)v8.i8);
    result = vsubl_high_u8(v7, v8);
    *a5 = v11;
    a5[1] = result;
    a5[2] = vsubl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v10.i8);
    a5[3] = vsubl_high_u8(v9, v10);
    v6 -= 2;
    a5 += 4;
  }
  while (v6 > 2);
  return result;
}

uint16x8_t sub_1B69108E0(uint8x8_t *a1, unsigned int a2, uint8x8_t *a3, unsigned int a4, uint16x8_t *a5, int a6)
{
  int v6;
  uint8x8_t v7;
  uint8x8_t v8;
  uint8x8_t v9;
  uint8x8_t v10;
  uint16x8_t result;

  v6 = a6 + 2;
  do
  {
    v7 = *a1;
    v8 = *a3;
    v9 = *(uint8x8_t *)((char *)a1 + a2);
    a1 = (uint8x8_t *)((char *)a1 + a2 + (unint64_t)a2);
    v10 = *(uint8x8_t *)((char *)a3 + a4);
    a3 = (uint8x8_t *)((char *)a3 + a4 + (unint64_t)a4);
    result = vsubl_u8(v7, v8);
    *a5 = result;
    a5[1] = vsubl_u8(v9, v10);
    a5 += 2;
    v6 -= 2;
  }
  while (v6 > 2);
  return result;
}

uint8x16_t sub_1B6910928(uint8x8_t *a1, int a2, uint16x8_t *a3, int a4)
{
  int v4;
  uint8x16_t *v5;
  uint8x16_t v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint8x16_t result;

  v4 = a4 + 2;
  do
  {
    v5 = (uint8x16_t *)((char *)a1 + a2);
    v6 = *v5;
    v7 = a3[2];
    v8 = a3[3];
    *(int8x16_t *)a1->i8 = vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(*a3, *a1)), (int16x8_t)vaddw_high_u8(a3[1], *(uint8x16_t *)a1->i8));
    a1 = (uint8x8_t *)&v5->i8[a2];
    result = (uint8x16_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(v7, *(uint8x8_t *)v6.i8)), (int16x8_t)vaddw_high_u8(v8, v6));
    *v5 = result;
    v4 -= 2;
    a3 += 4;
  }
  while (v4 > 2);
  return result;
}

int8x16_t *sub_1B6910984(int8x16_t *result, int a2, uint8x16_t *a3, uint16x8_t *a4, int a5)
{
  int v5;
  uint8x16_t v6;
  uint8x16_t v7;
  int8x16_t v8;

  v5 = a5 + 2;
  do
  {
    v6 = *a3;
    v7 = a3[1];
    a3 += 2;
    v8 = vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(a4[2], *(uint8x8_t *)v7.i8)), (int16x8_t)vaddw_high_u8(a4[3], v7));
    *result = vqmovun_high_s16(vqmovun_s16((int16x8_t)vaddw_u8(*a4, *(uint8x8_t *)v6.i8)), (int16x8_t)vaddw_high_u8(a4[1], v6));
    *(int8x16_t *)((char *)result + a2) = v8;
    result = (int8x16_t *)((char *)result + a2 + (uint64_t)a2);
    v5 -= 2;
    a4 += 4;
  }
  while (v5 > 2);
  return result;
}

int8x8_t sub_1B69109DC(_DWORD *a1, int a2, uint8x8_t *a3, uint16x8_t *a4)
{
  int8x8_t v4;
  int8x8_t result;

  v4 = vqmovun_s16((int16x8_t)vaddw_u8(*a4, *a3));
  result = vqmovun_s16((int16x8_t)vaddw_high_u8(a4[1], *(uint8x16_t *)a3->i8));
  *a1 = v4.i32[0];
  *(_DWORD *)((char *)a1 + a2) = v4.i32[1];
  *(_DWORD *)((char *)a1 + 2 * a2) = result.i32[0];
  *(_DWORD *)((char *)a1 + 3 * a2) = result.i32[1];
  return result;
}

int8x8_t sub_1B6910A18(int8x8_t *a1, int a2, uint8x16_t *a3, uint16x8_t *a4)
{
  uint8x16_t v4;
  uint8x16_t v5;
  uint8x16_t v6;
  uint16x8_t v7;
  uint16x8_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  uint16x8_t v11;
  uint16x8_t v12;
  int8x8_t v13;
  int8x8_t result;

  v4 = a3[1];
  v5 = a3[2];
  v6 = a3[3];
  v7 = a4[2];
  v8 = a4[3];
  v9 = a4[4];
  v10 = a4[5];
  v11 = a4[6];
  v12 = a4[7];
  v13 = vqmovun_s16((int16x8_t)vaddw_high_u8(a4[1], *a3));
  *a1 = vqmovun_s16((int16x8_t)vaddw_u8(*a4, *(uint8x8_t *)a3->i8));
  *(int8x8_t *)((char *)a1 + a2) = v13;
  *(int8x8_t *)((char *)a1 + 2 * a2) = vqmovun_s16((int16x8_t)vaddw_u8(v7, *(uint8x8_t *)v4.i8));
  result = vqmovun_s16((int16x8_t)vaddw_high_u8(v12, v6));
  *(int8x8_t *)((char *)a1 + 3 * a2) = vqmovun_s16((int16x8_t)vaddw_high_u8(v8, v4));
  *(int8x8_t *)((char *)a1 + 4 * a2) = vqmovun_s16((int16x8_t)vaddw_u8(v9, *(uint8x8_t *)v5.i8));
  *(int8x8_t *)((char *)a1 + 5 * a2) = vqmovun_s16((int16x8_t)vaddw_high_u8(v10, v5));
  *(int8x8_t *)((char *)a1 + 6 * a2) = vqmovun_s16((int16x8_t)vaddw_u8(v11, *(uint8x8_t *)v6.i8));
  *(int8x8_t *)((char *)&a1[a2] - a2) = result;
  return result;
}

uint64_t sub_1B6910AB0(uint64_t result, uint64_t a2, int a3, int a4, int a5, int64x2_t *a6)
{
  int64x2_t v6;
  int64x2_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  uint8x16_t v24;
  uint8x16_t v25;
  int32x4_t v26;
  int32x4_t v27;

  v6 = 0uLL;
  v7 = 0uLL;
  v8 = 0;
  do
  {
    v9 = 0;
    v10 = a4 + 16;
    v11 = 0uLL;
    v12 = 0uLL;
    v13 = 0uLL;
    v14 = 0uLL;
    v15 = 0uLL;
    do
    {
      _X12 = result + v9;
      _X13 = a2 + v9;
      __asm
      {
        PRFM            #0, [X12,#0x40]
        PRFM            #0, [X13,#0x40]
      }
      v24 = *(uint8x16_t *)(result + v9);
      v25 = *(uint8x16_t *)(a2 + v9);
      v12 = (int8x16_t)vpadalq_u16((uint32x4_t)v12, vaddw_high_u8(vmovl_u8(*(uint8x8_t *)v24.i8), v24));
      v11 = (int8x16_t)vpadalq_u16((uint32x4_t)v11, vaddw_high_u8(vmovl_u8(*(uint8x8_t *)v25.i8), v25));
      v15 = (int8x16_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v15, vmull_high_u8(v24, v25)), vmull_u8(*(uint8x8_t *)v24.i8, *(uint8x8_t *)v25.i8));
      v14 = (int8x16_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v14, vmull_high_u8(v24, v24)), vmull_u8(*(uint8x8_t *)v24.i8, *(uint8x8_t *)v24.i8));
      v13 = (int8x16_t)vpadalq_u16(vpadalq_u16((uint32x4_t)v13, vmull_high_u8(v25, v25)), vmull_u8(*(uint8x8_t *)v25.i8, *(uint8x8_t *)v25.i8));
      v9 += 16;
      v10 -= 16;
    }
    while (v10 > 16);
    *(int32x2_t *)v26.i8 = vadd_s32(*(int32x2_t *)v11.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
    *(int32x2_t *)v27.i8 = vadd_s32(*(int32x2_t *)v13.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL));
    v26.u64[1] = (unint64_t)vadd_s32(*(int32x2_t *)v12.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL));
    v27.u64[1] = (unint64_t)vadd_s32(*(int32x2_t *)v14.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL));
    v6 = vpadalq_s32(v6, v26);
    v7 = vpadalq_s32(v7, v27);
    v8 = vpadal_s32(v8, vadd_s32(*(int32x2_t *)v15.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL)));
    result += a3;
    a2 += a3;
    _VF = __OFSUB__(a5--, 1);
  }
  while (!((a5 < 0) ^ _VF | (a5 == 0)));
  *a6 = v6;
  a6[1] = v7;
  a6[2].i64[0] = v8;
  return result;
}

uint64_t sub_1B6910BA8(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2;
  int16x8_t v3;

  v2 = vsubq_s16(*a1, *a2);
  v3 = vsubq_s16(a1[1], a2[1]);
  return vaddvq_s32(vmlal_high_s16(vmlal_s16(vmlal_high_s16(vmull_s16(*(int16x4_t *)v2.i8, *(int16x4_t *)v2.i8), v2, v2), *(int16x4_t *)v3.i8, *(int16x4_t *)v3.i8), v3, v3));
}

uint64_t sub_1B6910BD4(uint64_t result, int a2, _OWORD *a3)
{
  __int128 v3;
  unsigned int v4;

  v3 = *(_OWORD *)(result - a2);
  v4 = -4;
  do
  {
    *a3 = v3;
    a3[1] = v3;
    a3[2] = v3;
    a3[3] = v3;
    a3 += 4;
    v4 += 4;
  }
  while (v4 < 0xC);
  return result;
}

int8x16_t sub_1B6910BFC(uint64_t a1, int a2, int8x16_t *a3)
{
  const char *v3;
  unsigned int v4;
  const char *v5;
  int8x16_t v6;
  const char *v7;
  int8x16_t v8;
  const char *v9;
  int8x16_t v10;
  int8x16_t result;

  v3 = (const char *)(a1 - 1);
  v4 = -4;
  do
  {
    v6 = vld1q_dup_s8(v3);
    v5 = &v3[a2];
    *a3 = v6;
    v8 = vld1q_dup_s8(v5);
    v7 = &v5[a2];
    a3[1] = v8;
    v10 = vld1q_dup_s8(v7);
    v9 = &v7[a2];
    a3[2] = v10;
    result = vld1q_dup_s8(v9);
    v3 = &v9[a2];
    a3[3] = result;
    a3 += 4;
    v4 += 4;
  }
  while (v4 < 0xC);
  return result;
}

__int8 *sub_1B6910C3C(__int8 *result, int a2, int8x16_t *a3, char a4)
{
  int v4;
  int8x16_t v5;
  __int8 *v6;
  __int8 v7;
  __int8 *v8;
  __int8 *v9;
  uint64_t v10;
  __int8 *v11;
  __int8 *v12;
  uint64_t v13;
  __int8 *v14;
  __int8 *v15;
  uint64_t v16;
  __int8 *v17;
  uint8x16_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8x8_t v22;
  __int8 *v23;
  uint8x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  unsigned int v28;

  v4 = a4 & 3;
  if (v4 == 3)
  {
    v19 = 3 * a2;
    v20 = 5 * a2;
    v21 = 7 * a2;
    v22.i8[0] = result[v21 - 1];
    v22.i8[1] = result[6 * a2 - 1];
    v22.i8[2] = result[v20 - 1];
    v22.i8[3] = result[4 * a2 - 1];
    v22.i8[4] = result[v19 - 1];
    v22.i8[5] = result[2 * a2 - 1];
    v22.i8[6] = result[a2 - 1];
    v22.i8[7] = *(result - 1);
    v23 = &result[8 * a2 - 1];
    v24.i8[0] = v23[v21];
    v24.i8[1] = v23[6 * a2];
    v24.i8[2] = v23[v20];
    v24.i8[3] = v23[4 * a2];
    v24.i8[4] = v23[v19];
    v24.i8[5] = v23[2 * a2];
    v24.i8[6] = v23[a2];
    v24.i8[7] = *v23;
    v25 = (int16x8_t)vaddw_u8(vaddw_u8(vaddw_high_u8(vmovl_u8(v22), *(uint8x16_t *)&result[-a2]), *(uint8x8_t *)&result[-a2]), v24);
    v25.i16[0] = vaddvq_s16(v25);
    v26 = vdupq_lane_s16(*(int16x4_t *)v25.i8, 0);
    v5 = vrshrn_high_n_s16(vrshrn_n_s16(v26, 5uLL), v26, 5uLL);
  }
  else
  {
    if (v4 == 2)
    {
      v18 = *(uint8x16_t *)&result[-a2];
      goto LABEL_7;
    }
    v5.i64[0] = 0x8080808080808080;
    v5.i64[1] = 0x8080808080808080;
    if (v4 == 1)
    {
      v7 = *(result - 1);
      v6 = result - 1;
      v8 = &v6[a2];
      v9 = &v6[2 * a2];
      v10 = 3 * a2;
      v11 = &v6[v10];
      v12 = &v6[4 * a2];
      v13 = 5 * a2;
      v14 = &v6[v13];
      v15 = &v6[6 * a2];
      v16 = 7 * a2;
      v17 = &v6[v16];
      result = &v6[8 * a2];
      v18.i8[0] = result[v16];
      v18.i8[1] = result[6 * a2];
      v18.i8[2] = result[v13];
      v18.i8[3] = result[4 * a2];
      v18.i8[4] = result[v10];
      v18.i8[5] = result[2 * a2];
      v18.i8[6] = result[a2];
      v18.i8[7] = *result;
      v18.i8[8] = *v17;
      v18.i8[9] = *v15;
      v18.i8[10] = *v14;
      v18.i8[11] = *v12;
      v18.i8[12] = *v11;
      v18.i8[13] = *v9;
      v18.i8[14] = *v8;
      v18.i8[15] = v7;
LABEL_7:
      v18.i16[0] = vaddlvq_u8(v18);
      v27 = vdupq_n_s16(v18.u32[0]);
      v5 = vrshrn_high_n_s16(vrshrn_n_s16(v27, 4uLL), v27, 4uLL);
    }
  }
  v28 = -4;
  do
  {
    *a3 = v5;
    a3[1] = v5;
    a3[2] = v5;
    a3[3] = v5;
    a3 += 4;
    v28 += 4;
  }
  while (v28 < 0xC);
  return result;
}

uint64_t sub_1B6910DEC(uint64_t a1, int a2, int8x16_t *a3)
{
  uint64_t result;
  __int8 v4;
  unsigned __int8 *v5;
  int8x16_t v6;
  uint8x8_t v7;
  int16x8_t v8;
  uint8x8_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  unsigned int v18;
  int16x8_t v19;
  int16x8_t v20;
  int8x8_t v21;
  int8x16_t v22;

  v4 = *(_BYTE *)(a1 - 1);
  result = a1 - 1;
  v5 = (unsigned __int8 *)(result - a2);
  v6 = *(int8x16_t *)(v5 + 1);
  v7.i8[0] = v5[8 * a2 - a2];
  v7.i8[1] = v5[6 * a2];
  v7.i8[2] = v5[5 * a2];
  v7.i8[3] = v5[4 * a2];
  v7.i8[4] = v5[3 * a2];
  v7.i8[5] = v5[2 * a2];
  v7.i8[6] = v4;
  v7.i8[7] = *v5;
  v8 = (int16x8_t)vmlsl_u8(vmull_u8((uint8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL), (uint8x8_t)0x807060504030201), (uint8x8_t)vrev64_s8(vext_s8(vdup_n_s8(*v5), *(int8x8_t *)v6.i8, 7uLL)), (uint8x8_t)0x807060504030201);
  v9.i8[0] = v5[9 * a2];
  v9.i8[1] = v5[10 * a2];
  v9.i8[2] = v5[11 * a2];
  v9.i8[3] = v5[12 * a2];
  v9.i8[4] = v5[13 * a2];
  v9.i8[5] = v5[14 * a2];
  v9.i8[6] = v5[15 * a2];
  v9.i8[7] = v5[16 * a2];
  v10 = (int8x16_t)vmovl_high_u8((uint8x16_t)v6);
  v11 = (int8x16_t)vmovl_u8(v9);
  v12 = (int8x16_t)vmlsl_u8(vmull_u8(v9, (uint8x8_t)0x807060504030201), v7, (uint8x8_t)0x807060504030201);
  v13 = vdupq_lane_s16(vshl_n_s16(vadd_s16((int16x4_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL), (int16x4_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)), 4uLL), 3);
  *(int16x4_t *)v10.i8 = vpadd_s16(vadd_s16(*(int16x4_t *)v8.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL)), vadd_s16(*(int16x4_t *)v12.i8, (int16x4_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)));
  *(int16x4_t *)v10.i8 = vpadd_s16(*(int16x4_t *)v10.i8, *(int16x4_t *)v10.i8);
  *(int16x4_t *)v12.i8 = vrshr_n_s16(vsra_n_s16(*(int16x4_t *)v10.i8, *(int16x4_t *)v10.i8, 2uLL), 4uLL);
  v14 = vdupq_lane_s16(*(int16x4_t *)v12.i8, 1);
  v8.i64[0] = 0x6000600060006;
  v8.i64[1] = 0x6000600060006;
  v15 = vmlaq_lane_s16(v13, v8, *(int16x4_t *)v12.i8, 1);
  v16 = vmlaq_lane_s16(v15, (int16x8_t)xmmword_1B69180B0, *(int16x4_t *)v12.i8, 0);
  v17 = vmlaq_lane_s16(v15, (int16x8_t)xmmword_1B6917640, *(int16x4_t *)v12.i8, 0);
  v18 = -2;
  do
  {
    v19 = vaddq_s16(v16, v14);
    v20 = vaddq_s16(v17, v14);
    v21 = vqrshrun_n_s16(v16, 5uLL);
    v16 = vaddq_s16(v19, v14);
    v22 = vqrshrun_high_n_s16(v21, v17, 5uLL);
    v17 = vaddq_s16(v20, v14);
    *a3 = v22;
    a3[1] = vqrshrun_high_n_s16(vqrshrun_n_s16(v19, 5uLL), v20, 5uLL);
    a3 += 2;
    v18 += 2;
  }
  while (v18 < 0xE);
  return result;
}

uint16x8_t sub_1B6910F6C(const float *a1, uint64_t a2, uint64_t a3, uint16x8_t *a4, unsigned int *a5, int a6, unsigned int a7)
{
  uint64_t v10;
  int v11;
  int32x4_t v12;
  int32x4_t v13;
  uint8x16_t v14;
  uint8x16_t v15;
  uint64_t v16;
  const float *v17;
  const float *v18;
  uint8x8_t v19;
  const float *v20;
  uint8x8_t v21;
  const float *v22;
  uint8x8_t v23;
  uint8x8_t v24;
  uint16x8_t result;
  int32x4_t v26;

  v10 = *a5;
  if (a7 <= 8)
    v11 = a7;
  else
    v11 = 2;
  *(double *)v12.i64 = ((double (*)(const float *, uint64_t, _QWORD))off_1E6A147B0[a6])(a1, a2, *a5);
  v26 = v12;
  *(double *)v13.i64 = ((double (*)(const float *, uint64_t, uint64_t))off_1E6A147B0[v11])(a1, a2, v10);
  v14 = (uint8x16_t)vtrn1q_s32(v26, v13);
  v15 = (uint8x16_t)vtrn2q_s32(v26, v13);
  v16 = (3 * a2);
  v17 = a1;
  v19 = (uint8x8_t)vld1_dup_f32(v17);
  v18 = (const float *)((char *)v17 + v16);
  v20 = (const float *)((char *)a1 + a2);
  v21 = (uint8x8_t)vld1_dup_f32(v20);
  v22 = (const float *)((char *)a1 + (2 * a2));
  v23 = (uint8x8_t)vld1_dup_f32(v22);
  v24 = (uint8x8_t)vld1_dup_f32(v18);
  *a4 = vsubl_u8(v19, *(uint8x8_t *)v14.i8);
  a4[1] = vsubl_u8(v21, *(uint8x8_t *)v15.i8);
  result = vsubw_high_u8(vmovl_u8(v24), v15);
  a4[2] = vsubw_high_u8(vmovl_u8(v23), v14);
  a4[3] = result;
  return result;
}

double sub_1B6911034(uint64_t a1, int a2)
{
  const float *v2;
  double result;

  v2 = (const float *)(a1 - a2);
  *(_QWORD *)&result = vld1q_dup_f32(v2).u64[0];
  return result;
}

double sub_1B6911040(uint64_t a1, int a2, int32x4_t a3, int32x4_t a4)
{
  uint64_t v4;
  unsigned __int8 v5;

  v5 = *(_BYTE *)(a1 - 1);
  v4 = a1 - 1;
  a3.i8[0] = v5;
  a3.i8[1] = v5;
  a3.i8[2] = v5;
  a3.i8[3] = v5;
  a3.i8[8] = *(_BYTE *)(v4 + 2 * a2);
  a3.i8[9] = a3.i8[8];
  a3.i8[10] = a3.i8[8];
  a3.i8[11] = a3.i8[8];
  a4.i8[0] = *(_BYTE *)(v4 + a2);
  a4.i8[1] = a4.i8[0];
  a4.i8[2] = a4.i8[0];
  a4.i8[3] = a4.i8[0];
  a4.i8[8] = *(_BYTE *)(v4 + 3 * a2);
  a4.i8[9] = a4.i8[8];
  a4.i8[10] = a4.i8[8];
  a4.i8[11] = a4.i8[8];
  a3.i64[0] = vtrn1q_s32(a3, a4).u64[0];
  return *(double *)a3.i64;
}

uint64_t sub_1B69110A0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __n128 v3;

  v3.n128_u64[0] = 0x8080808080808080;
  v3.n128_u64[1] = 0x8080808080808080;
  return ((uint64_t (*)(__n128))((char *)sub_1B69110C4
                                         + 4 * byte_1B6918DA8[(a3 | (a3 >> 7)) & 3]))(v3);
}

double sub_1B69110C4(uint64_t a1, int a2)
{
  double result;

  *(_QWORD *)&result = vdupq_n_s8((*(unsigned __int8 *)(a1 - 1)
                                 + *(unsigned __int8 *)(a1 + a2 - 1)
                                 + *(unsigned __int8 *)(a1 + 2 * a2 - 1)
                                 + *(unsigned __int8 *)(a1 + 2 * a2 + a2 - 1)
                                 + 2) >> 2).u64[0];
  return result;
}

double sub_1B6911158(uint64_t a1, int a2, int a3)
{
  int32x2_t v3;
  int8x8_t v4;
  int32x4_t v5;
  int32x4_t v6;
  double result;

  v3 = *(int32x2_t *)(a1 - a2);
  if ((a3 & 0xFF0000) == 0)
    v3 = vzip1_s32(v3, (int32x2_t)vdup_lane_s8((int8x8_t)v3, 3));
  v4 = vdup_lane_s8((int8x8_t)v3, 7);
  *(uint8x8_t *)v5.i8 = vrhadd_u8(vhadd_u8((uint8x8_t)v3, (uint8x8_t)vext_s8((int8x8_t)v3, v4, 2uLL)), (uint8x8_t)vext_s8((int8x8_t)v3, v4, 1uLL));
  *(int8x8_t *)v6.i8 = vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v5.i8, 1uLL);
  v5.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v5.i8, 2uLL);
  v6.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v5.i8, 3uLL);
  *(_QWORD *)&result = vtrn1q_s32(v5, v6).u64[0];
  return result;
}

double sub_1B69111A0(uint64_t a1, int a2)
{
  const float *v2;
  __int8 *v3;
  int8x8_t v4;
  int8x8_t v5;
  int8x8_t v6;
  int32x4_t v7;
  int32x4_t v8;
  double result;

  v2 = (const float *)(a1 - a2);
  v3 = (__int8 *)(a1 - 1 - a2);
  v4.i8[0] = *v3;
  v4.i8[1] = *v3;
  v4.i8[2] = *v3;
  v4.i8[3] = v3[4 * a2];
  v4.i8[4] = v3[3 * a2];
  v4.i8[5] = v3[2 * a2];
  v4.i8[6] = *(_BYTE *)(a1 - 1);
  v4.i8[7] = *v3;
  v5 = (int8x8_t)vld1_dup_f32(v2);
  v6 = (int8x8_t)vrhadd_u8(vhadd_u8((uint8x8_t)vext_s8(v4, v5, 3uLL), (uint8x8_t)vext_s8(v4, v5, 5uLL)), (uint8x8_t)vext_s8(v4, v5, 4uLL));
  *(int8x8_t *)v7.i8 = vext_s8(v6, v6, 2uLL);
  *(int8x8_t *)v8.i8 = vext_s8(v6, v6, 3uLL);
  v8.u64[1] = (unint64_t)vext_s8(v6, v6, 1uLL);
  v7.u64[1] = (unint64_t)v6;
  *(_QWORD *)&result = vtrn1q_s32(v8, v7).u64[0];
  return result;
}

double sub_1B6911218(uint64_t a1, int a2)
{
  const float *v2;
  int8x8_t v3;
  __int8 *v4;
  uint8x8_t v5;
  uint8x8_t v6;
  int8x8_t v7;
  int32x4_t v8;
  int32x4_t v9;
  double result;

  v2 = (const float *)(a1 - a2);
  v3 = (int8x8_t)vld1_dup_f32(v2);
  v4 = (__int8 *)(a1 - 1 - a2);
  v3.i8[0] = v4[3 * a2];
  v3.i8[1] = v4[2 * a2];
  v3.i8[2] = *(_BYTE *)(a1 - 1);
  v3.i8[3] = *v4;
  v5 = (uint8x8_t)vext_s8(v3, v3, 3uLL);
  v6 = (uint8x8_t)vext_s8(v3, v3, 4uLL);
  v7 = (int8x8_t)vrhadd_u8(vhadd_u8((uint8x8_t)v3, (uint8x8_t)vext_s8(v3, v3, 2uLL)), (uint8x8_t)vext_s8(v3, v3, 1uLL));
  *(uint8x8_t *)v8.i8 = vrhadd_u8(v5, v6);
  *(int8x8_t *)v9.i8 = vext_s8(v7, v7, 2uLL);
  v8.u64[1] = (unint64_t)vext_s8(vdup_lane_s8(v7, 1), *(int8x8_t *)v8.i8, 7uLL);
  v9.u64[1] = (unint64_t)vext_s8(vdup_lane_s8(v7, 0), *(int8x8_t *)v9.i8, 7uLL);
  *(_QWORD *)&result = vtrn1q_s32(v8, v9).u64[0];
  return result;
}

double sub_1B6911288(uint64_t a1, int a2)
{
  __int8 *v2;
  int8x8_t v3;
  const float *v4;
  int8x8_t v5;
  uint8x8_t v6;
  uint8x8_t v7;
  int32x2_t v8;
  int8x8_t v9;
  int32x2_t v10;
  int32x4_t v11;
  int32x4_t v12;
  double result;

  v2 = (__int8 *)(a1 - 1 - a2);
  v3.i8[0] = *v2;
  v3.i8[1] = *v2;
  v3.i8[2] = *v2;
  v3.i8[3] = v2[4 * a2];
  v3.i8[4] = v2[3 * a2];
  v3.i8[5] = v2[2 * a2];
  v3.i8[6] = *(_BYTE *)(a1 - 1);
  v4 = (const float *)(a1 - a2);
  v3.i8[7] = v3.i8[0];
  v5 = (int8x8_t)vld1_dup_f32(v4);
  v6 = (uint8x8_t)vext_s8(v3, v5, 3uLL);
  v7 = (uint8x8_t)vext_s8(v3, v5, 4uLL);
  v8 = (int32x2_t)vrhadd_u8(vhadd_u8(v6, (uint8x8_t)vext_s8(v3, v5, 5uLL)), v7);
  v9 = (int8x8_t)vdup_lane_s32(v8, 1);
  v10 = (int32x2_t)vzip1_s8((int8x8_t)vrhadd_u8(v6, v7), (int8x8_t)v8);
  *(int32x2_t *)v11.i8 = vdup_lane_s32(v10, 1);
  *(int8x8_t *)v12.i8 = vext_s8((int8x8_t)v10, v9, 6uLL);
  v12.u64[1] = (unint64_t)vext_s8((int8x8_t)v10, (int8x8_t)v10, 2uLL);
  v11.u64[1] = (unint64_t)v10;
  *(_QWORD *)&result = vtrn1q_s32(v12, v11).u64[0];
  return result;
}

double sub_1B6911310(uint64_t a1, int a2, int a3)
{
  int32x2_t v3;
  uint8x8_t v4;
  int32x4_t v5;
  int32x4_t v6;
  double result;

  v3 = *(int32x2_t *)(a1 - a2);
  if ((a3 & 0xFF0000) == 0)
    v3 = vzip1_s32(v3, (int32x2_t)vdup_lane_s8((int8x8_t)v3, 3));
  v4 = (uint8x8_t)vext_s8((int8x8_t)v3, (int8x8_t)v3, 1uLL);
  *(uint8x8_t *)v5.i8 = vrhadd_u8(vhadd_u8((uint8x8_t)v3, (uint8x8_t)vext_s8((int8x8_t)v3, (int8x8_t)v3, 2uLL)), v4);
  *(uint8x8_t *)v6.i8 = vrhadd_u8((uint8x8_t)v3, v4);
  v6.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v6.i8, *(int8x8_t *)v6.i8, 1uLL);
  v5.u64[1] = (unint64_t)vext_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v6.i8, 1uLL);
  *(_QWORD *)&result = vtrn1q_s32(v6, v5).u64[0];
  return result;
}

double sub_1B6911354(uint64_t a1, int a2)
{
  uint64_t v2;
  __int8 v3;
  int8x8_t v4;
  int8x8_t v5;
  uint8x8_t v6;
  int8x8_t v7;
  int8x8_t v8;
  int32x4_t v9;
  int32x4_t v10;
  double result;

  v3 = *(_BYTE *)(a1 - 1);
  v2 = a1 - 1;
  v4 = vdup_n_s8(*(unsigned __int8 *)(v2 + 3 * a2));
  v5.i8[0] = *(_BYTE *)(v2 + 3 * a2);
  v5.i8[1] = *(_BYTE *)(v2 + 2 * a2);
  v5.i8[2] = *(_BYTE *)(v2 + a2);
  v5.i8[3] = v3;
  v5.i8[4] = v3;
  v5.i8[5] = v3;
  v5.i8[6] = v3;
  v5.i8[7] = v3;
  v6 = (uint8x8_t)vext_s8(v4, v5, 7uLL);
  v7 = (int8x8_t)vrhadd_u8(vhadd_u8((uint8x8_t)v5, (uint8x8_t)vext_s8(v4, v5, 6uLL)), v6);
  v8 = vdup_lane_s8(v7, 0);
  *(int8x8_t *)v9.i8 = vrev64_s8(vzip1_s8(v7, (int8x8_t)vrhadd_u8((uint8x8_t)v5, v6)));
  *(int8x8_t *)v10.i8 = vext_s8(*(int8x8_t *)v9.i8, *(int8x8_t *)v9.i8, 2uLL);
  v9.u64[1] = (unint64_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1);
  v10.u64[1] = (unint64_t)v8;
  *(_QWORD *)&result = vtrn1q_s32(v9, v10).u64[0];
  return result;
}

uint16x8_t sub_1B69113C8(__int32 *a1, uint64_t a2, uint8x16_t *a3, uint16x8_t *a4, unsigned int *a5, int a6)
{
  unsigned int v8;
  uint8x16_t v10;
  uint8x8_t v11;
  uint8x8_t v12;
  uint16x8_t v13;
  uint16x8_t result;

  v8 = a2;
  *(double *)v10.i64 = ((double (*)(__int32 *, uint64_t, _QWORD))off_1E6A147B0[a6])(a1, a2, *a5);
  *a3 = v10;
  v11.i32[0] = *a1;
  v11.i32[1] = *(__int32 *)((char *)a1 + v8);
  v12.i32[0] = *(__int32 *)((char *)a1 + 2 * v8);
  v12.i32[1] = *(__int32 *)((char *)a1 + 3 * v8);
  v13 = vsubl_u8(v11, *(uint8x8_t *)v10.i8);
  result = vsubw_high_u8(vmovl_u8(v12), v10);
  *a4 = v13;
  a4[1] = result;
  return result;
}

__n128 sub_1B6911440(uint64_t a1, int a2, __n128 *a3)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(a1 - a2);
  result = *v3;
  *a3 = *v3;
  a3[1] = result;
  a3[2] = result;
  a3[3] = result;
  a3[4] = result;
  a3[5] = result;
  a3[6] = result;
  a3[7] = result;
  return result;
}

int16x8_t sub_1B691145C(uint64_t a1, int a2, int16x8_t *a3)
{
  const __int16 *v3;
  char v4;
  const __int16 *v5;
  int16x8_t v6;
  const __int16 *v7;
  int16x8_t v8;
  char v9;
  const __int16 *v10;
  int16x8_t v11;
  int16x8_t result;

  v3 = (const __int16 *)(a1 - 2);
  v4 = 1;
  do
  {
    v6 = vld1q_dup_s16(v3);
    v5 = (const __int16 *)((char *)v3 + a2);
    *a3 = v6;
    v8 = vld1q_dup_s16(v5);
    v7 = (const __int16 *)((char *)v5 + a2);
    v9 = v4;
    a3[1] = v8;
    v11 = vld1q_dup_s16(v7);
    v10 = (const __int16 *)((char *)v7 + a2);
    a3[2] = v11;
    result = vld1q_dup_s16(v10);
    v3 = (const __int16 *)((char *)v10 + a2);
    a3[3] = result;
    a3 += 4;
    v4 = 0;
  }
  while ((v9 & 1) != 0);
  return result;
}

uint64_t sub_1B691149C(uint64_t result, int a2, int8x16_t *a3, char a4)
{
  int v4;
  int8x16_t v5;
  int8x16_t v6;
  uint64_t v7;
  const __int16 *v8;
  const __int16 *v9;
  const __int16 *v10;
  const __int16 *v11;
  const __int16 *v12;
  const __int16 *v13;
  const __int16 *v14;
  uint8x8_t v15;
  uint8x8_t v16;
  uint8x8_t v17;
  uint8x8_t v18;
  uint8x8_t v19;
  uint8x8_t v20;
  uint8x8_t v21;
  const __int16 *v22;
  uint8x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  const char *v26;
  uint64_t v27;
  const __int16 *v28;
  const __int16 *v29;
  const __int16 *v30;
  const __int16 *v31;
  const __int16 *v32;
  const __int16 *v33;
  uint8x8_t v34;
  const __int16 *v35;
  uint8x8_t v36;
  uint8x8_t v37;
  int8x8_t v38;
  uint8x8_t v39;
  uint8x8_t v40;
  uint8x8_t v41;
  const __int16 *v42;
  uint8x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  const char *v46;
  int8x8_t v47;
  int16x4_t v48;
  int8x8x2_t v49;
  int8x8x2_t v50;

  v4 = a4 & 3;
  if (v4 == 3)
  {
    v26 = (const char *)(result - a2);
    v49 = vld2_s8(v26);
    v27 = 3 * a2;
    v28 = (const __int16 *)(result - 2 + a2);
    v29 = (const __int16 *)(result - 2 + 2 * a2);
    v30 = (const __int16 *)(result - 2 + 3 * a2);
    v31 = (const __int16 *)(result - 2 + 4 * a2);
    v32 = (const __int16 *)(result - 2);
    v34 = (uint8x8_t)vld1_dup_s16(v32);
    v33 = &v32[v27];
    v35 = (const __int16 *)(result - 2 + 5 * a2);
    v36 = (uint8x8_t)vld1_dup_s16(v28);
    v37 = (uint8x8_t)vld1_dup_s16(v29);
    v38 = v49.val[1];
    v49 = (int8x8x2_t)vpaddlq_u8((uint8x16_t)v49);
    v49.val[1] = (int8x8_t)vld1_dup_s16(v30);
    v39 = (uint8x8_t)vld1_dup_s16(v31);
    v40 = (uint8x8_t)vld1_dup_s16(v35);
    v41 = (uint8x8_t)vld1_dup_s16(v33);
    v49.val[0] = (int8x8_t)vpaddq_s16((int16x8_t)v49, (int16x8_t)v49).u64[0];
    v42 = (const __int16 *)(result - 2 - a2 + 8 * a2);
    v43 = (uint8x8_t)vld1_dup_s16(v42);
    v49.val[0] = (int8x8_t)vzip1_s16((int16x4_t)v49.val[0], (int16x4_t)vdup_lane_s32((int32x2_t)v49.val[0], 1));
    v44 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v40, v39), v41), v43);
    v45 = (int16x8_t)vdupq_lane_s32((int32x2_t)v49.val[0], 1);
    v6 = vrshrn_high_n_s16(vrshrn_n_s16((int16x8_t)vaddw_u8((uint16x8_t)vaddq_s16((int16x8_t)vaddw_u8(vaddl_u8(v36, v34), v37), (int16x8_t)vdupq_lane_s32((int32x2_t)v49.val[0], 0)), (uint8x8_t)v49.val[1]), 3uLL), v45, 2uLL);
    v5 = vrshrn_high_n_s16(vrshrn_n_s16(v44, 2uLL), vaddq_s16(v44, v45), 3uLL);
  }
  else if (v4 == 2)
  {
    v46 = (const char *)(result - a2);
    v50 = vld2_s8(v46);
    v47 = v50.val[1];
    v50 = (int8x8x2_t)vpaddlq_u8((uint8x16_t)v50);
    v50.val[0] = (int8x8_t)vpaddq_s16((int16x8_t)v50, (int16x8_t)v50).u64[0];
    v50.val[1] = (int8x8_t)vzip1_s16((int16x4_t)v50.val[0], (int16x4_t)vdup_lane_s32((int32x2_t)v50.val[0], 1));
    v48 = vzip2_s16((int16x4_t)v50.val[0], (int16x4_t)v50.val[0]);
    v50.val[1] = vrshrn_n_s16(*(int16x8_t *)((char *)&v50 + 8), 2uLL);
    *(int16x4_t *)v5.i8 = vdup_lane_s16((int16x4_t)v50.val[1], 0);
    v5.u64[1] = (unint64_t)vdup_lane_s16((int16x4_t)v50.val[1], 1);
    v6 = v5;
  }
  else
  {
    v5.i64[0] = 0x8080808080808080;
    v5.i64[1] = 0x8080808080808080;
    v6.i64[0] = 0x8080808080808080;
    v6.i64[1] = 0x8080808080808080;
    if (v4 == 1)
    {
      v7 = 3 * a2;
      v8 = (const __int16 *)(result - 2 + a2);
      v9 = (const __int16 *)(result - 2 + 2 * a2);
      v10 = (const __int16 *)(result - 2 + 3 * a2);
      v11 = (const __int16 *)(result - 2 + 4 * a2);
      v12 = (const __int16 *)(result - 2 + 5 * a2);
      v13 = (const __int16 *)(result - 2);
      v15 = (uint8x8_t)vld1_dup_s16(v13);
      v14 = &v13[v7];
      v16 = (uint8x8_t)vld1_dup_s16(v8);
      v17 = (uint8x8_t)vld1_dup_s16(v9);
      v18 = (uint8x8_t)vld1_dup_s16(v10);
      v19 = (uint8x8_t)vld1_dup_s16(v11);
      v20 = (uint8x8_t)vld1_dup_s16(v12);
      v21 = (uint8x8_t)vld1_dup_s16(v14);
      v22 = (const __int16 *)(result - 2 - a2 + 8 * a2);
      v23 = (uint8x8_t)vld1_dup_s16(v22);
      v24 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v16, v15), v17), v18);
      v25 = (int16x8_t)vaddw_u8(vaddw_u8(vaddl_u8(v20, v19), v21), v23);
      v6 = vrshrn_high_n_s16(vrshrn_n_s16(v24, 2uLL), v24, 2uLL);
      v5 = vrshrn_high_n_s16(vrshrn_n_s16(v25, 2uLL), v25, 2uLL);
    }
  }
  *a3 = v6;
  a3[1] = v6;
  a3[2] = v6;
  a3[3] = v6;
  a3[4] = v5;
  a3[5] = v5;
  a3[6] = v5;
  a3[7] = v5;
  return result;
}

uint64_t sub_1B6911644(uint64_t a1, int a2, int8x16_t *a3)
{
  uint64_t result;
  __int16 v4;
  unsigned __int16 *v5;
  int8x16_t v6;
  uint8x8_t v7;
  int16x8_t v8;
  uint8x8_t v9;
  int16x8_t v10;
  int8x16_t v11;
  int16x4_t v12;
  int16x4_t v13;
  int16x4_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  unsigned int v20;
  int16x8_t v21;
  int16x8_t v22;
  int8x8_t v23;
  int8x16_t v24;

  v4 = *(_WORD *)(a1 - 2);
  result = a1 - 2;
  v5 = (unsigned __int16 *)(result - a2);
  v6 = *(int8x16_t *)(v5 + 1);
  v7.i16[0] = *(unsigned __int16 *)((char *)v5 + 3 * a2);
  v7.i16[1] = v5[a2];
  v7.i16[2] = v4;
  v7.i16[3] = *v5;
  v8 = (int16x8_t)vmlsl_u8(vmull_u8((uint8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL), (uint8x8_t)0x404030302020101), (uint8x8_t)vrev64_s16((int16x4_t)vext_s8((int8x8_t)vdup_n_s16(*v5), *(int8x8_t *)v6.i8, 6uLL)), (uint8x8_t)0x404030302020101);
  v9.i16[0] = *(unsigned __int16 *)((char *)v5 + 5 * a2);
  v9.i16[1] = v5[3 * a2];
  v9.i16[2] = *(unsigned __int16 *)((char *)v5 + 7 * a2);
  v9.i16[3] = v5[4 * a2];
  v10 = (int16x8_t)vaddw_high_u8(vmovl_u8(v9), (uint8x16_t)v6);
  v11 = (int8x16_t)vmlsl_u8(vmull_u8(v9, (uint8x8_t)0x404030302020101), v7, (uint8x8_t)0x404030302020101);
  v12 = (int16x4_t)vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL).u64[0];
  v13 = vuzp1_s16(*(int16x4_t *)v8.i8, v12);
  *(int16x4_t *)v8.i8 = vuzp2_s16(*(int16x4_t *)v8.i8, v12);
  v14 = (int16x4_t)vextq_s8(v11, v11, 8uLL).u64[0];
  *(int16x4_t *)v11.i8 = vpadd_s16(vpadd_s16(v13, *(int16x4_t *)v8.i8), vpadd_s16(vuzp1_s16(*(int16x4_t *)v11.i8, v14), vuzp2_s16(*(int16x4_t *)v11.i8, v14)));
  *(int16x4_t *)v8.i8 = vrhadd_s16(*(int16x4_t *)v11.i8, vshr_n_s16(*(int16x4_t *)v11.i8, 4uLL));
  v15 = (int16x8_t)vdupq_lane_s32(*(int32x2_t *)v8.i8, 1);
  v16 = (int16x8_t)vdupq_lane_s32(*(int32x2_t *)v8.i8, 0);
  v8.i64[0] = 0x2000200020002;
  v8.i64[1] = 0x2000200020002;
  v17 = vmlaq_s16((int16x8_t)vdupq_laneq_s32((int32x4_t)vshlq_n_s16(v10, 4uLL), 3), v15, v8);
  v18 = vmlaq_s16(v17, v16, (int16x8_t)xmmword_1B69180C0);
  v19 = vmlaq_s16(v17, v16, (int16x8_t)xmmword_1B69177E0);
  v20 = -2;
  do
  {
    v21 = vaddq_s16(v18, v15);
    v22 = vaddq_s16(v19, v15);
    v23 = vqrshrun_n_s16(v18, 5uLL);
    v18 = vaddq_s16(v21, v15);
    v24 = vqrshrun_high_n_s16(v23, v19, 5uLL);
    v19 = vaddq_s16(v22, v15);
    *a3 = v24;
    a3[1] = vqrshrun_high_n_s16(vqrshrun_n_s16(v21, 5uLL), v22, 5uLL);
    a3 += 2;
    v20 += 2;
  }
  while (v20 < 6);
  return result;
}

uint8x16_t sub_1B6911768(uint64_t a1, int a2, uint8x16_t *a3, __int32 *a4, double a5, int8x8_t a6, double a7, uint32x4_t a8, uint32x4_t a9)
{
  int8x16_t *v9;
  int8x16_t v10;
  __int8 *v11;
  __int32 v12;
  int8x16_t v13;
  __int8 *v14;
  const char *v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  uint8x16_t result;

  v9 = (int8x16_t *)(a1 - a2);
  v10 = *v9;
  if ((*a4 & 0xFF0000) == 0)
  {
    a6 = vdup_lane_s8(*(int8x8_t *)v10.i8, 7);
    v10.u64[1] = (unint64_t)a6;
  }
  v12 = v9[-1].u8[15];
  v11 = &v9[-1].i8[15];
  a6.i32[0] = v12;
  if ((*a4 & 0xFF00) == 0)
  {
    *(int8x8_t *)v13.i8 = vdup_lane_s8(a6, 0);
    v13.i64[1] = vextq_s8(v10, v10, 8uLL).u64[0];
    v10 = v13;
  }
  if (*a4)
  {
    v14 = &v11[a2];
    v15 = &v14[8 * a2 - a2];
    v16 = vld1q_dup_s8(v15);
    v16.i8[9] = v14[6 * a2];
    v16.i8[10] = v14[5 * a2];
    v16.i8[11] = v14[4 * a2];
    v16.i8[12] = v14[3 * a2];
    v16.i8[13] = v14[2 * a2];
    v16.i8[14] = v14[a2];
    v16.i8[15] = *v14;
    v17 = vdupq_lane_s8(a6, 0);
  }
  else
  {
    v17 = vdupq_lane_s8(a6, 0);
    v16 = v17;
  }
  a8.i32[0] = *a4;
  a9.i32[0] = 0x1000000;
  v18 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_u32(a9, a8), 0);
  *(int8x8_t *)v19.i8 = vdup_laneq_s8(v16, 15);
  v19.u64[1] = (unint64_t)vdup_lane_s8(*(int8x8_t *)v10.i8, 0);
  v20 = vbslq_s8(v18, v19, v17);
  v21 = vextq_s8(v16, v20, 1uLL);
  v22 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(v21, v10, 1uLL), (uint8x16_t)v16), (uint8x16_t)v21);
  v18.i64[0] = vextq_s8(v22, v22, 8uLL).u64[0];
  *(int8x8_t *)v22.i8 = vdup_lane_s8(*(int8x8_t *)v22.i8, 7);
  v22.i64[1] = v18.i64[0];
  result = vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(v20, v10, 0xFuLL), (uint8x16_t)vextq_s8(v10, vdupq_laneq_s8(v10, 15), 1uLL)), (uint8x16_t)v10);
  a3[-1] = (uint8x16_t)v22;
  *a3 = result;
  a3[1].i8[0] = result.i8[15];
  return result;
}

double sub_1B6911874(_QWORD *a1, int a2, double *a3)
{
  double result;

  result = *a3;
  *a1 = *(_QWORD *)a3;
  *(double *)((char *)a1 + a2) = result;
  *(double *)((char *)a1 + 2 * a2) = result;
  *(double *)((char *)a1 + 3 * a2) = result;
  *(double *)((char *)a1 + 4 * a2) = result;
  *(double *)((char *)a1 + 5 * a2) = result;
  *(double *)((char *)a1 + 6 * a2) = result;
  *(double *)((char *)&a1[a2] - a2) = result;
  return result;
}

int8x8_t sub_1B69118B8(int8x8_t *a1, int a2, uint64_t a3)
{
  int8x8_t v3;
  int8x8_t v4;
  int8x8_t v5;
  int8x8_t v6;
  int8x8_t v7;
  int8x8_t result;

  v3 = *(int8x8_t *)(a3 - 9);
  v4 = vdup_lane_s8(v3, 4);
  v5 = vdup_lane_s8(v3, 3);
  v6 = vdup_lane_s8(v3, 2);
  v7 = vdup_lane_s8(v3, 1);
  *a1 = vdup_lane_s8(v3, 7);
  *(int8x8_t *)((char *)a1 + a2) = vdup_lane_s8(v3, 6);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vdup_lane_s8(v3, 5);
  result = vdup_lane_s8(v3, 0);
  *(int8x8_t *)((char *)a1 + 3 * a2) = v4;
  *(int8x8_t *)((char *)a1 + 4 * a2) = v5;
  *(int8x8_t *)((char *)a1 + 5 * a2) = v6;
  *(int8x8_t *)((char *)a1 + 6 * a2) = v7;
  *(int8x8_t *)((char *)&a1[a2] - a2) = result;
  return result;
}

int8x8_t *sub_1B691191C(int8x8_t *result, int a2, uint8x8_t *a3, _WORD *a4)
{
  uint8x8_t v4;
  int8x8_t v5;
  int16x8_t v6;
  int16x4_t v7;
  int16x4_t v8;
  int16x8_t v9;

  if (*a4)
  {
    if ((unsigned __int16)*a4 <= 0xFFu)
    {
      v4 = *(uint8x8_t *)((char *)a3 - 9);
LABEL_8:
      v7 = (int16x4_t)vpaddl_u8(v4);
      v8 = vpadd_s16(v7, v7);
      *(int16x4_t *)v9.i8 = vpadd_s16(v8, v8);
      v9.i64[1] = v9.i64[0];
      v5 = vrshrn_n_s16(v9, 3uLL);
      goto LABEL_9;
    }
    if (!*a4)
    {
      v4 = *a3;
      goto LABEL_8;
    }
    v6 = (int16x8_t)vaddl_u8(*a3, *(uint8x8_t *)((char *)a3 - 9));
    *(int16x4_t *)v6.i8 = vadd_s16(*(int16x4_t *)v6.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v6, (int8x16_t)v6, 8uLL));
    *(int16x4_t *)v6.i8 = vpadd_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v6.i8);
    *(int16x4_t *)v6.i8 = vpadd_s16(*(int16x4_t *)v6.i8, *(int16x4_t *)v6.i8);
    v6.i64[1] = v6.i64[0];
    v5 = vrshrn_n_s16(v6, 4uLL);
  }
  else
  {
    v5 = (int8x8_t)0x8080808080808080;
  }
LABEL_9:
  *result = v5;
  *(int8x8_t *)((char *)result + a2) = v5;
  *(int8x8_t *)((char *)result + 2 * a2) = v5;
  *(int8x8_t *)((char *)result + 3 * a2) = v5;
  *(int8x8_t *)((char *)result + 4 * a2) = v5;
  *(int8x8_t *)((char *)result + 5 * a2) = v5;
  *(int8x8_t *)((char *)result + 6 * a2) = v5;
  *(int8x8_t *)((char *)&result[a2] - a2) = v5;
  return result;
}

double sub_1B69119C4(_QWORD *a1, int a2, int8x16_t *a3)
{
  int8x16_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double result;

  v3 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(*a3, a3[1], 2uLL), *(uint8x16_t *)a3), (uint8x16_t)vextq_s8(*a3, a3[1], 1uLL));
  *a1 = v3.i64[0];
  *(_QWORD *)((char *)a1 + a2) = vextq_s8(v3, v3, 1uLL).u64[0];
  *(_QWORD *)((char *)a1 + 2 * a2) = vextq_s8(v3, v3, 2uLL).u64[0];
  v4 = vextq_s8(v3, v3, 3uLL).u64[0];
  v5 = vextq_s8(v3, v3, 4uLL).u64[0];
  v6 = vextq_s8(v3, v3, 5uLL).u64[0];
  v7 = vextq_s8(v3, v3, 6uLL).u64[0];
  *(_QWORD *)&result = vextq_s8(v3, v3, 7uLL).u64[0];
  *(_QWORD *)((char *)a1 + 3 * a2) = v4;
  *(_QWORD *)((char *)a1 + 4 * a2) = v5;
  *(_QWORD *)((char *)a1 + 5 * a2) = v6;
  *(_QWORD *)((char *)a1 + 6 * a2) = v7;
  *(double *)((char *)&a1[a2] - a2) = result;
  return result;
}

int8x16_t sub_1B6911A34(_QWORD *a1, int a2, uint64_t a3)
{
  int8x16_t result;

  result = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(*(int8x16_t *)(a3 - 9), *(int8x16_t *)(a3 + 7), 2uLL), *(uint8x16_t *)(a3 - 9)), (uint8x16_t)vextq_s8(*(int8x16_t *)(a3 - 9), *(int8x16_t *)(a3 + 7), 1uLL));
  *a1 = vextq_s8(result, result, 7uLL).u64[0];
  *(_QWORD *)((char *)a1 + a2) = vextq_s8(result, result, 6uLL).u64[0];
  *(_QWORD *)((char *)a1 + 2 * a2) = vextq_s8(result, result, 5uLL).u64[0];
  *(_QWORD *)((char *)a1 + 3 * a2) = vextq_s8(result, result, 4uLL).u64[0];
  *(_QWORD *)((char *)a1 + 4 * a2) = vextq_s8(result, result, 3uLL).u64[0];
  *(_QWORD *)((char *)a1 + 5 * a2) = vextq_s8(result, result, 2uLL).u64[0];
  *(_QWORD *)((char *)a1 + 6 * a2) = vextq_s8(result, result, 1uLL).u64[0];
  *(_QWORD *)((char *)&a1[a2] - a2) = result.i64[0];
  return result;
}

int8x8_t sub_1B6911AA8(_QWORD *a1, int a2, uint64_t a3)
{
  int8x16_t v3;
  uint8x16_t v4;
  uint8x16_t v5;
  uint8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x8_t v9;
  int8x8_t v10;
  int8x8_t result;

  v3 = *(int8x16_t *)(a3 - 8);
  v4 = (uint8x16_t)vextq_s8(v3, v3, 2uLL);
  v5 = (uint8x16_t)vextq_s8(v3, v3, 1uLL);
  v6 = vhaddq_u8(v4, (uint8x16_t)v3);
  v7 = (int8x16_t)vrhaddq_u8(v4, v5);
  v8 = (int8x16_t)vrhaddq_u8(v6, v5);
  v7.i64[0] = vextq_s8(v7, v7, 6uLL).u64[0];
  v5.i64[0] = vextq_s8(v8, v8, 6uLL).u64[0];
  *a1 = v7.i64[0];
  *(_QWORD *)((char *)a1 + a2) = v5.i64[0];
  *(int8x8_t *)v8.i8 = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v8.i8, 6uLL);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8, 7uLL);
  v9 = vuzp1_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v8.i8);
  *(int8x8_t *)v8.i8 = vuzp2_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v8.i8);
  v10 = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8, 6uLL);
  result = vext_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8, 5uLL);
  *(int8x8_t *)((char *)a1 + 3 * a2) = vext_s8(v9, *(int8x8_t *)v5.i8, 7uLL);
  *(int8x8_t *)((char *)a1 + 4 * a2) = v10;
  *(int8x8_t *)((char *)a1 + 5 * a2) = vext_s8(v9, *(int8x8_t *)v5.i8, 6uLL);
  *(int8x8_t *)((char *)a1 + 6 * a2) = result;
  *(int8x8_t *)((char *)&a1[a2] - a2) = vext_s8(v9, *(int8x8_t *)v5.i8, 5uLL);
  return result;
}

int8x8_t sub_1B6911B2C(int8x8_t *a1, int a2, uint64_t a3)
{
  int8x16_t v3;
  uint8x16_t v4;
  int8x16_t v5;
  int8x8_t v6;
  int8x8_t v7;
  int8x8_t v8;
  int8x8_t v9;
  int8x8_t result;

  v3 = *(int8x16_t *)(a3 - 9);
  v4 = (uint8x16_t)vextq_s8(v3, v3, 1uLL);
  v5 = (int8x16_t)vrhaddq_u8(vhaddq_u8((uint8x16_t)vextq_s8(v3, v3, 0xFuLL), v4), (uint8x16_t)v3);
  v6 = (int8x8_t)vextq_s8(v5, v5, 8uLL).u64[0];
  *(uint8x8_t *)v3.i8 = vrhadd_u8(*(uint8x8_t *)v4.i8, *(uint8x8_t *)v3.i8);
  *(int8x8_t *)v4.i8 = vzip2_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v3.i8);
  *a1 = vext_s8(*(int8x8_t *)v4.i8, v6, 7uLL);
  *(int8x8_t *)((char *)a1 + a2) = vext_s8(*(int8x8_t *)v4.i8, v6, 5uLL);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vext_s8(*(int8x8_t *)v4.i8, v6, 3uLL);
  *(int8x8_t *)v3.i8 = vzip1_s8(*(int8x8_t *)v5.i8, *(int8x8_t *)v3.i8);
  *(int8x8_t *)v5.i8 = vext_s8(*(int8x8_t *)v4.i8, v6, 1uLL);
  v7 = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 7uLL);
  v8 = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 5uLL);
  v9 = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 3uLL);
  result = vext_s8(*(int8x8_t *)v3.i8, *(int8x8_t *)v4.i8, 1uLL);
  *(int8x8_t *)((char *)a1 + 3 * a2) = *(int8x8_t *)v5.i8;
  *(int8x8_t *)((char *)a1 + 4 * a2) = v7;
  *(int8x8_t *)((char *)a1 + 5 * a2) = v8;
  *(int8x8_t *)((char *)a1 + 6 * a2) = v9;
  *(int8x8_t *)((char *)&a1[a2] - a2) = result;
  return result;
}

double sub_1B6911BB0(_QWORD *a1, int a2, uint8x16_t *a3)
{
  int8x16_t v3;
  uint8x16_t v4;
  uint8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  unint64_t v8;
  double result;

  v3 = *(int8x16_t *)a3;
  v4 = (uint8x16_t)vextq_s8(v3, v3, 1uLL);
  v5 = vhaddq_u8((uint8x16_t)vextq_s8(v3, v3, 2uLL), *a3);
  v6 = (int8x16_t)vrhaddq_u8(v4, *a3);
  v7 = (int8x16_t)vrhaddq_u8(v5, v4);
  *a1 = v6.i64[0];
  *(_QWORD *)((char *)a1 + a2) = v7.i64[0];
  *(_QWORD *)((char *)a1 + 2 * a2) = vextq_s8(v6, v6, 1uLL).u64[0];
  v8 = vextq_s8(v6, v6, 2uLL).u64[0];
  *(_QWORD *)&result = vextq_s8(v6, v6, 3uLL).u64[0];
  *(_QWORD *)((char *)a1 + 3 * a2) = vextq_s8(v7, v7, 1uLL).u64[0];
  *(_QWORD *)((char *)a1 + 4 * a2) = v8;
  *(_QWORD *)((char *)a1 + 5 * a2) = vextq_s8(v7, v7, 2uLL).u64[0];
  *(double *)((char *)a1 + 6 * a2) = result;
  *(_QWORD *)((char *)&a1[a2] - a2) = vextq_s8(v7, v7, 3uLL).u64[0];
  return result;
}

int8x8_t sub_1B6911C20(int8x8_t *a1, int a2, uint64_t a3)
{
  int8x8_t v3;
  int8x8_t v4;
  int8x8_t v5;
  uint8x8_t v6;
  uint8x8_t v7;
  int8x8_t v8;
  int8x8_t v9;
  int8x8_t v10;
  int8x8_t result;

  v3 = *(int8x8_t *)(a3 - 9);
  v4 = vdup_lane_s8(v3, 0);
  v5 = vrev64_s8(v3);
  v6 = (uint8x8_t)vext_s8(v5, v3, 1uLL);
  v7 = vhadd_u8((uint8x8_t)vext_s8(v5, v4, 2uLL), (uint8x8_t)v5);
  v8 = (int8x8_t)vrhadd_u8(v6, (uint8x8_t)v5);
  v9 = (int8x8_t)vrhadd_u8(v7, v6);
  v10 = vzip1_s8(v8, v9);
  result = vzip2_s8(v8, v9);
  *a1 = v10;
  *(int8x8_t *)((char *)a1 + a2) = vext_s8(v10, result, 2uLL);
  *(int8x8_t *)((char *)a1 + 2 * a2) = vext_s8(v10, result, 4uLL);
  *(int8x8_t *)((char *)a1 + 3 * a2) = vext_s8(v10, result, 6uLL);
  *(int8x8_t *)((char *)a1 + 4 * a2) = result;
  *(int8x8_t *)((char *)a1 + 5 * a2) = vext_s8(result, v4, 2uLL);
  *(int8x8_t *)((char *)a1 + 6 * a2) = vext_s8(result, v4, 4uLL);
  *(int8x8_t *)((char *)&a1[a2] - a2) = v4;
  return result;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
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

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C980B0](bundle);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
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

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
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

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
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

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98638](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

uint64_t CFLog()
{
  return MEMORY[0x1E0C98808]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
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

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F88](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x1E0C99360](alloc, relativeURLBytes, length, *(_QWORD *)&encoding, baseURL, useCompatibilityMode);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x1E0C9EB10]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

OSStatus CMBlockBufferAccessDataBytes(CMBlockBufferRef theBuffer, size_t offset, size_t length, void *temporaryBlock, char **returnedPointerOut)
{
  return MEMORY[0x1E0C9EB48](theBuffer, offset, length, temporaryBlock, returnedPointerOut);
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1E0C9EB50](theBuffer, targetBBuf, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferAppendMemoryBlock(CMBlockBufferRef theBuffer, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1E0C9EB58](theBuffer, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1E0C9EB68](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB80](structureAllocator, bufferReference, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1E0C9EBC8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x1E0C9ED90]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9EDC8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9EDD0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1E0C9F010](sbuf, createIfNecessary);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1E0C9F028](sbuf, sampleIndex, timingInfoOut);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateFromH264ParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F540](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(_QWORD *)&NALUnitHeaderLength, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8908](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x1E0CA8928](sourceBuffer, destinationBuffer);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8958](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

int CVColorPrimariesGetIntegerCodePointForString(CFStringRef colorPrimariesString)
{
  return MEMORY[0x1E0CA8960](colorPrimariesString);
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8968](*(_QWORD *)&colorPrimariesCodePoint);
}

Boolean CVIsCompressedPixelFormatAvailable(OSType pixelFormatType)
{
  return MEMORY[0x1E0CA8A08](*(_QWORD *)&pixelFormatType);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1E0CA8A30](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1E0CA8A38](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1E0CA8A50](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateResolvedAttributesDictionary(CFAllocatorRef allocator, CFArrayRef attributes, CFDictionaryRef *resolvedDictionaryOut)
{
  return MEMORY[0x1E0CA8AA8](allocator, attributes, resolvedDictionaryOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferFillExtendedPixels(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AD0](pixelBuffer);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1E0CA8AD8]();
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

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B08](pixelBuffer);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x1E0CA8B10](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
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

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

uint64_t CVPixelBufferIsCompatibleWithAttributes()
{
  return MEMORY[0x1E0CA8B60]();
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

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8BA8](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x1E0CA8BC8](pixelBufferPool);
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1E0CA8BD0](pixelBufferPool);
}

uint64_t CVPixelBufferPoolSetMaxBufferAge()
{
  return MEMORY[0x1E0CA8BE0]();
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

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1E0CA8C10]();
}

uint64_t CVPixelFormatTypeIsSubsampled()
{
  return MEMORY[0x1E0CA8C28]();
}

int CVTransferFunctionGetIntegerCodePointForString(CFStringRef transferFunctionString)
{
  return MEMORY[0x1E0CA8C30](transferFunctionString);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8C38](*(_QWORD *)&transferFunctionCodePoint);
}

int CVYCbCrMatrixGetIntegerCodePointForString(CFStringRef yCbCrMatrixString)
{
  return MEMORY[0x1E0CA8C40](yCbCrMatrixString);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x1E0CA8C48](*(_QWORD *)&yCbCrMatrixCodePoint);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x1E0CA0918]();
}

uint64_t FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer()
{
  return MEMORY[0x1E0CA1260]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferForCFType()
{
  return MEMORY[0x1E0CA12E8]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForCFType()
{
  return MEMORY[0x1E0CA1310]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1E0CA1550]();
}

uint64_t FigThreadGetMachThreadPriorityValue()
{
  return MEMORY[0x1E0CA17E0]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1E0CA1810]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1E0D3A1D0]();
}

uint64_t IOSurfaceAcceleratorSetCustomFilter()
{
  return MEMORY[0x1E0D3A1F0]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1E0D3A200]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBBAE8](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

uint64_t IOSurfaceGetAddressFormatOfPlane()
{
  return MEMORY[0x1E0CBBB30]();
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane()
{
  return MEMORY[0x1E0CBBB48]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return MEMORY[0x1E0CBBB58]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CBBB68](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1E0CBBB70]();
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBBA0](buffer, planeIndex);
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane()
{
  return MEMORY[0x1E0CBBBC8]();
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane()
{
  return MEMORY[0x1E0CBBBD0]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1E0CBBBD8]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC28](buffer);
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return MEMORY[0x1E0CBBC30]();
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBC38](buffer, planeIndex);
}

uint64_t IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane()
{
  return MEMORY[0x1E0CBBC40]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC70](buffer);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x1E0CBBC90]();
}

uint64_t IOSurfaceGetRegistryID()
{
  return MEMORY[0x1E0CBBCA0]();
}

uint64_t IOSurfaceGetTileFormat()
{
  return MEMORY[0x1E0CBBCC0]();
}

uint64_t IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane()
{
  return MEMORY[0x1E0CBBCD8]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBCE0](buffer);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return MEMORY[0x1E0CBBCE8]();
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBCF0](buffer, planeIndex);
}

uint64_t IOSurfaceIsTiled()
{
  return MEMORY[0x1E0CBBD20]();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD38](*(_QWORD *)&csid);
}

uint64_t IOSurfaceSetBulkAttachments()
{
  return MEMORY[0x1E0CBBDF0]();
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0CBBE40](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x1E0CEC938](session, completeUntilPresentationTimeStamp);
}

uint64_t VTCompressionSessionCreateWithOptions()
{
  return MEMORY[0x1E0CEC950]();
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1E0CEC958](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

CVPixelBufferPoolRef VTCompressionSessionGetPixelBufferPool(VTCompressionSessionRef session)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1E0CEC978](session);
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
  MEMORY[0x1E0CEC990](session);
}

OSStatus VTCompressionSessionPrepareToEncodeFrames(VTCompressionSessionRef session)
{
  return MEMORY[0x1E0CEC998](session);
}

uint64_t VTCompressionSessionSetProperty()
{
  return MEMORY[0x1E0CEC9A8]();
}

OSStatus VTCopyVideoEncoderList(CFDictionaryRef options, CFArrayRef *listOfVideoEncodersOut)
{
  return MEMORY[0x1E0CEC9D0](options, listOfVideoEncodersOut);
}

Boolean VTDecompressionSessionCanAcceptFormatDescription(VTDecompressionSessionRef session, CMFormatDescriptionRef newFormatDesc)
{
  return MEMORY[0x1E0CECA08](session, newFormatDesc);
}

OSStatus VTDecompressionSessionCopyBlackPixelBuffer(VTDecompressionSessionRef session, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CECA10](session, pixelBufferOut);
}

uint64_t VTDecompressionSessionCopyProperty()
{
  return MEMORY[0x1E0CECA18]();
}

uint64_t VTDecompressionSessionCopySerializableProperties()
{
  return MEMORY[0x1E0CECA20]();
}

uint64_t VTDecompressionSessionCopySupportedPropertyDictionary()
{
  return MEMORY[0x1E0CECA28]();
}

uint64_t VTDecompressionSessionCreateWithOptions()
{
  return MEMORY[0x1E0CECA38]();
}

uint64_t VTDecompressionSessionDecodeFrameWithOptions()
{
  return MEMORY[0x1E0CECA48]();
}

OSStatus VTDecompressionSessionFinishDelayedFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x1E0CECA58](session);
}

void VTDecompressionSessionInvalidate(VTDecompressionSessionRef session)
{
  MEMORY[0x1E0CECA70](session);
}

uint64_t VTDecompressionSessionSetProperties()
{
  return MEMORY[0x1E0CECA88]();
}

uint64_t VTDecompressionSessionSetProperty()
{
  return MEMORY[0x1E0CECA90]();
}

OSStatus VTDecompressionSessionWaitForAsynchronousFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x1E0CECA98](session);
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x1E0CECAB0]();
}

uint64_t VTEncoderSessionDequeueDecodeTimeStamp()
{
  return MEMORY[0x1E0CECAB8]();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return MEMORY[0x1E0CECAC0]();
}

uint64_t VTEncoderSessionEnqueuePresentationTimeStamp()
{
  return MEMORY[0x1E0CECAD0]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x1E0CECAD8]();
}

uint64_t VTMotionEstimationSessionCreate()
{
  return MEMORY[0x1E0CECBF8]();
}

uint64_t VTMotionEstimationSessionEstimateMotionVectors()
{
  return MEMORY[0x1E0CECC00]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

uint64_t VTRegisterVideoEncoderWithInfo()
{
  return MEMORY[0x1E0CECD48]();
}

uint64_t VTSelectAndCreateVideoEncoderInstance()
{
  return MEMORY[0x1E0CECD60]();
}

OSStatus VTSessionCopyProperty(VTSessionRef session, CFStringRef propertyKey, CFAllocatorRef allocator, void *propertyValueOut)
{
  return MEMORY[0x1E0CECD68](session, propertyKey, allocator, propertyValueOut);
}

OSStatus VTSessionCopySupportedPropertyDictionary(VTSessionRef session, CFDictionaryRef *supportedPropertyDictionaryOut)
{
  return MEMORY[0x1E0CECD70](session, supportedPropertyDictionaryOut);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

uint64_t VTVPParavirtualizedH264VideoEncoder_CreateInstance()
{
  return MEMORY[0x1E0CECE28]();
}

uint64_t VTVPParavirtualizedHEVCVideoEncoder_CreateInstance()
{
  return MEMORY[0x1E0CECE30]();
}

uint64_t VTVideoEncoderGetCMBaseObject()
{
  return MEMORY[0x1E0CECE58]();
}

uint64_t VTVideoEncoderGetClassID()
{
  return MEMORY[0x1E0CECE60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4298](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1E0DE42F0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x1E0DE42F8](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x1E0DE4538](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x1E0DE4540](this);
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x1E0DE4790](this);
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4818]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE4860](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x1E0DE4868](this, __p.__ptr_);
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
  MEMORY[0x1E0DE4870](this);
}

void std::__assoc_sub_state::set_value(std::__assoc_sub_state *this)
{
  MEMORY[0x1E0DE4878](this);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x1E0DE4890](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE48A8](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x1E0DE48B0](this);
}

void std::__shared_mutex_base::lock_shared(std::__shared_mutex_base *this)
{
  MEMORY[0x1E0DE48B8](this);
}

void std::__shared_mutex_base::unlock_shared(std::__shared_mutex_base *this)
{
  MEMORY[0x1E0DE48C0](this);
}

void std::__shared_mutex_base::lock(std::__shared_mutex_base *this)
{
  MEMORY[0x1E0DE48D0](this);
}

void std::__shared_mutex_base::unlock(std::__shared_mutex_base *this)
{
  MEMORY[0x1E0DE48D8](this);
}

std::__shared_mutex_base *__cdecl std::__shared_mutex_base::__shared_mutex_base(std::__shared_mutex_base *this)
{
  return (std::__shared_mutex_base *)MEMORY[0x1E0DE48E8](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return MEMORY[0x1E0DE4AF8]();
}

std::future<void> *__cdecl std::future<void>::future(std::future<void> *this, std::__assoc_sub_state *__state)
{
  return (std::future<void> *)MEMORY[0x1E0DE4B58](this, __state);
}

void std::future<void>::~future(std::future<void> *this)
{
  MEMORY[0x1E0DE4B60](this);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1E0DE4DF0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x1E0DE4DF8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E6A13438();
}

void operator delete(void *__p)
{
  off_1E6A13440(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  off_1E6A13448(__p, a2);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_1E6A13450(__p, a2);
}

uint64_t operator delete()
{
  return off_1E6A13458();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E6A13460(__sz, a2);
}

uint64_t operator new[]()
{
  return off_1E6A13468();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E6A13470(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E6A13478(__sz, a2);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_1E6A13480(__sz, a2);
}

uint64_t operator new()
{
  return off_1E6A13488();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
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

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x1E0C81658](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1E0C81678](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82D18](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD8]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1E0D20080]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
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

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83520](a1, a2);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
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

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
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

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1E0C84DD8](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1E0C852C8](*(_QWORD *)&task, semaphore, *(_QWORD *)&policy, *(_QWORD *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1E0C852D0](*(_QWORD *)&task, *(_QWORD *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1E0C852D8](*(_QWORD *)&semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1E0C852F0](*(_QWORD *)&semaphore);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1E0C85360](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

void srand(unsigned int a1)
{
  MEMORY[0x1E0C85478](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85510](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

intmax_t strtoimax(const char *__nptr, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85638](__nptr, __endptr, *(_QWORD *)&__base);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x1E0C85648](__str, __sep);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C3D8](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vfixru8(const float *__A, vDSP_Stride __IA, unsigned __int8 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C530](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C608](__A, __IA, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

