double bdz_config_new()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x40uLL, 0x1030040D3CFC0C8uLL);
  if (v0)
  {
    result = 0.0;
    v0[2] = 0u;
    v0[3] = 0u;
    *v0 = 0u;
    v0[1] = 0u;
    *((_BYTE *)v0 + 36) = 7;
    *((_QWORD *)v0 + 6) = 0;
  }
  return result;
}

void bdz_config_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t bdz_config_set_b(uint64_t result, int a2)
{
  char v2;

  if ((a2 - 11) >= 0xFFFFFFF8)
    v2 = a2;
  else
    v2 = 7;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 36) = v2;
  return result;
}

uint64_t bdz_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1)
    *(_DWORD *)(*(_QWORD *)(result + 32) + 56) = *a2;
  return result;
}

_QWORD *bdz_new(uint64_t a1, double a2)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  unsigned int v5;
  size_t v6;
  unsigned int v7;
  unsigned int *v8;
  char *v9;
  void *v10;
  int v11;
  unsigned int *v12;
  size_t v13;
  uint64_t v14;
  int v15;
  _DWORD *v16;
  unsigned int v17;
  unsigned __int32 v18;
  unsigned __int32 v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  unsigned int *v26;
  uint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  int v31;
  unsigned int *v32;
  uint64_t v33;
  char *v34;
  unsigned int i;
  unsigned int *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  FILE **v50;
  char *v51;
  unint64_t v52;
  unsigned int v53;
  unsigned int *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char v58;
  char *v59;
  char v60;
  int v61;
  uint64_t v62;
  int v63;
  char v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  unint64_t v70;
  unsigned int v71;
  _DWORD *v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unint64_t v78;
  unsigned int v79;
  unsigned __int8 *v80;
  int v81;
  _OWORD *v82;
  __int128 v83;
  _QWORD *v84;
  _DWORD *v86;
  unsigned int *v87;
  int v88;
  unsigned int *v89;
  uint64_t v90;
  int v91;
  _QWORD v92[4];
  unsigned __int8 *v93;
  unsigned int v94;
  int32x2_t v95;
  unsigned int v96;
  uint64_t v97;

  v2 = a1;
  v97 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned int **)(a1 + 32);
  if (a2 == 0.0)
    a2 = 1.23;
  v4 = *(unsigned int *)(*(_QWORD *)(a1 + 8) + 8);
  v5 = vcvtpd_u64_f64(a2 * (double)v4 / 3.0) | 1;
  v6 = 3 * v5;
  *v3 = v4;
  v3[1] = v6;
  v3[2] = v5;
  v7 = 1 << *((_BYTE *)v3 + 36);
  v3[8] = v7;
  v3[10] = vcvtpd_u64_f64((double)v6 / (double)v7);
  v8 = (unsigned int *)malloc_type_malloc(24 * v4, 0x1000040504FFAC1uLL);
  v92[1] = v8;
  v9 = (char *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v92[2] = v9;
  v10 = malloc_type_malloc(v6, 0xD764A694uLL);
  v92[3] = v10;
  v86 = malloc_type_malloc(4 * *v3, 0x100004052888210uLL);
  if (*(_DWORD *)(v2 + 16))
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *v3, v3[1]);
  v92[0] = 0;
  v11 = 1000;
  v90 = v2;
  v87 = v3;
  while (1)
  {
    v88 = v11;
    *((_QWORD *)v3 + 3) = hash_state_new(v3[14], 0xFu);
    v12 = *(unsigned int **)(v2 + 32);
    v13 = v12[1];
    memset(v9, 255, 4 * v13);
    bzero(v10, v13);
    LODWORD(v92[0]) = 0;
    (*(void (**)(_QWORD))(*(_QWORD *)(v2 + 8) + 32))(**(_QWORD **)(v2 + 8));
    v14 = *(_QWORD *)(v2 + 8);
    if (*(_DWORD *)(v14 + 8))
    {
      v15 = 0;
      v16 = v8 + 3;
      v89 = v12;
      do
      {
        v91 = v15;
        v94 = 0;
        v93 = 0;
        (*(void (**)(_QWORD, unsigned __int8 **, unsigned int *))(v14 + 16))(*(_QWORD *)v14, &v93, &v94);
        hash_vector(*((_DWORD **)v12 + 3), v93, v94, &v95);
        v17 = v12[2];
        v18 = v95.i32[0] % v17;
        v19 = v95.i32[1] % v17 + v17;
        v20 = v96 % v17 + 2 * v17;
        (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(v90 + 8) + 24))(**(_QWORD **)(v90 + 8), v93, v94);
        *(v16 - 3) = v18;
        *(v16 - 2) = v19;
        *(v16 - 1) = v20;
        *v16 = *(_DWORD *)&v9[4 * v18];
        v16[1] = *(_DWORD *)&v9[4 * v19];
        v16[2] = *(_DWORD *)&v9[4 * v20];
        *(_DWORD *)&v9[4 * v20] = v91;
        *(_DWORD *)&v9[4 * v19] = v91;
        *(_DWORD *)&v9[4 * v18] = v91;
        ++*((_BYTE *)v10 + v18);
        ++*((_BYTE *)v10 + v19);
        ++*((_BYTE *)v10 + v20);
        v12 = v89;
        v15 = v91 + 1;
        v14 = *(_QWORD *)(v90 + 8);
        v16 += 6;
      }
      while ((v91 + 1) < *(_DWORD *)(v14 + 8));
      v21 = v91 + 1;
      LODWORD(v92[0]) = v91 + 1;
    }
    else
    {
      v21 = 0;
    }
    v22 = *v12;
    v23 = malloc_type_malloc((v22 >> 3) + 1, 0xAD381DACuLL);
    bzero(v23, (v22 >> 3) + 1);
    if (!(_DWORD)v22)
      goto LABEL_46;
    v24 = 0;
    v25 = 0;
    v26 = v8 + 1;
    do
    {
      if (*((_BYTE *)v10 + *(v26 - 1)) == 1 || *((_BYTE *)v10 + *v26) == 1 || *((_BYTE *)v10 + v26[1]) == 1)
      {
        v27 = v24 >> 3;
        v28 = bitmask[v24 & 7];
        if (!((v28 & *((_BYTE *)v23 + v27)) >> (v24 & 7)))
        {
          v86[v25++] = v24;
          *((_BYTE *)v23 + v27) |= v28;
        }
      }
      ++v24;
      v26 += 6;
    }
    while (v22 != v24);
    if (v25)
    {
      v29 = 0;
      do
      {
        v30 = 0;
        v31 = v86[v29++];
        v32 = &v8[6 * v31];
        do
        {
          v33 = v32[v30];
          v34 = &v9[4 * v33];
          for (i = *(_DWORD *)v34; i != v31 && i != -1; i = v40)
          {
            v37 = &v8[6 * i];
            if (*v37 == (_DWORD)v33)
            {
              v38 = 0;
            }
            else if (v37[1] == (_DWORD)v33)
            {
              v38 = 1;
            }
            else
            {
              v38 = 2;
            }
            v39 = (uint64_t)&v8[6 * i + v38];
            v40 = *(_DWORD *)(v39 + 12);
            v34 = (char *)(v39 + 12);
          }
          if (i == -1)
          {
            printf("\nerror remove edge %d dump graph", v31);
            bdz_dump_graph((uint64_t)v92, v21);
            exit(-1);
          }
          *(_DWORD *)v34 = v8[6 * i + 3 + v30];
          --*((_BYTE *)v10 + v33);
          ++v30;
        }
        while (v30 != 3);
        v42 = *v32;
        v41 = v32[1];
        v43 = v32[2];
        if (*((_BYTE *)v10 + v42) == 1)
        {
          v44 = *(unsigned int *)&v9[4 * v42];
          v45 = bitmask[v44 & 7];
          if (!((v45 & *((_BYTE *)v23 + (v44 >> 3))) >> (v44 & 7)))
          {
            v86[v25++] = v44;
            *((_BYTE *)v23 + (v44 >> 3)) |= v45;
          }
        }
        if (*((_BYTE *)v10 + v41) == 1)
        {
          v46 = *(unsigned int *)&v9[4 * v41];
          v47 = bitmask[v46 & 7];
          if (!((v47 & *((_BYTE *)v23 + (v46 >> 3))) >> (v46 & 7)))
          {
            v86[v25++] = v46;
            *((_BYTE *)v23 + (v46 >> 3)) |= v47;
          }
        }
        if (*((_BYTE *)v10 + v43) == 1)
        {
          v48 = *(unsigned int *)&v9[4 * v43];
          v49 = bitmask[v48 & 7];
          if (!((v49 & *((_BYTE *)v23 + (v48 >> 3))) >> (v48 & 7)))
          {
            v86[v25++] = v48;
            *((_BYTE *)v23 + (v48 >> 3)) |= v49;
          }
        }
      }
      while (v29 != v25);
    }
    else
    {
LABEL_46:
      v29 = 0;
    }
    free(v23);
    if (v29 == (_DWORD)v22)
      break;
    v3 = v87;
    v11 = v88 - 1;
    hash_state_destroy(*((_DWORD **)v87 + 3));
    *((_QWORD *)v87 + 3) = 0;
    v2 = v90;
    if (*(_DWORD *)(v90 + 16))
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "acyclic graph creation failure - %u iterations remaining\n", v11);
    if (v88 == 1)
    {
      free(v86);
      free(v8);
      free(v9);
      free(v10);
      return 0;
    }
  }
  free(v9);
  free(v10);
  v50 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*(_DWORD *)(v90 + 16))
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Entering assigning step for mph creation of %u keys with graph sized %u\n", *v87, v87[1]);
  v51 = (char *)malloc_type_malloc(((unint64_t)v87[1] >> 3) + 1, 0xB0CDE37CuLL);
  LODWORD(v52) = v87[1];
  LODWORD(v10) = vcvtpd_u64_f64((double)v52 * 0.25);
  *((_QWORD *)v87 + 2) = malloc_type_calloc((size_t)v10, 1uLL, 0x100004077774924uLL);
  bzero(v51, ((unint64_t)v87[1] >> 3) + 1);
  memset(*((void **)v87 + 2), 255, (size_t)v10);
  if (v21)
  {
    v53 = v21 - 1;
    do
    {
      v54 = &v8[6 * v86[v53]];
      v55 = *v54;
      v56 = v54[1];
      v57 = v54[2];
      v58 = bitmask[v55 & 7];
      v59 = &v51[v56 >> 3];
      v60 = bitmask[v56 & 7];
      v61 = (v60 & *v59) >> (v56 & 7);
      if ((v58 & v51[v55 >> 3]) >> (v55 & 7))
      {
        if (v61)
        {
          v62 = *((_QWORD *)v87 + 2);
          v63 = 8
              - (((*(unsigned __int8 *)(v62 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3)
               + ((*(unsigned __int8 *)(v62 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3));
          *(_BYTE *)(v62 + (v57 >> 2)) &= valuemask[v57 & 3] | ((v63
                                                                                - 3 * ((86 * v63) >> 8)) << (2 * (v57 & 3)));
          v58 = bitmask[v57 & 7];
          v59 = &v51[v57 >> 3];
        }
        else
        {
          v65 = bitmask[v57 & 7];
          if (!((v65 & v51[v57 >> 3]) >> (v57 & 7)))
          {
            *(_BYTE *)(*((_QWORD *)v87 + 2) + (v57 >> 2)) &= valuemask[v57 & 3] | (3 << (2 * (v57 & 3)));
            v51[v57 >> 3] |= v65;
          }
          v67 = *((_QWORD *)v87 + 2);
          v68 = (((*(unsigned __int8 *)(v67 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
               + ((*(unsigned __int8 *)(v67 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3)) ^ 7;
          *(_BYTE *)(v67 + (v56 >> 2)) &= valuemask[v56 & 3] | ((v68
                                                                                - 3 * ((86 * v68) >> 8)) << (2 * (v56 & 3)));
          v58 = v60;
        }
      }
      else
      {
        if (!v61)
        {
          *(_BYTE *)(*((_QWORD *)v87 + 2) + (v56 >> 2)) &= valuemask[v56 & 3] | (3 << (2 * (v56 & 3)));
          *v59 |= v60;
        }
        v64 = bitmask[v57 & 7];
        if (!((v64 & v51[v57 >> 3]) >> (v57 & 7)))
        {
          *(_BYTE *)(*((_QWORD *)v87 + 2) + (v57 >> 2)) &= valuemask[v57 & 3] | (3 << (2 * (v57 & 3)));
          v51[v57 >> 3] |= v64;
        }
        v66 = *((_QWORD *)v87 + 2);
        *(_BYTE *)(v66 + (v55 >> 2)) &= valuemask[v55 & 3] | (((6
                                                                                                - (((*(unsigned __int8 *)(v66 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
                                                                                                 + ((*(unsigned __int8 *)(v66 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3)))
                                                                              % 3u) << (2 * (v55 & 3)));
        v59 = &v51[v55 >> 3];
      }
      *v59 |= v58;
    }
    while ((unint64_t)v53--);
  }
  free(v51);
  free(v86);
  free(v8);
  if (*(_DWORD *)(v90 + 16))
    fprintf(*v50, "Entering ranking step for mph creation of %u keys with graph sized %u\n", *v87, v87[1]);
  v70 = v87[8];
  v71 = v87[1];
  v72 = malloc_type_calloc(v87[10], 4uLL, 0x100004052888210uLL);
  *((_QWORD *)v87 + 6) = v72;
  *v72 = 0;
  if (v87[10] != 1)
  {
    v73 = 0;
    v74 = 0;
    v75 = v70 >> 2;
    v76 = vcvtpd_u64_f64((double)v71 * 0.25);
    v77 = 1;
    do
    {
      if (v70 >> 2 >= v76)
        v78 = v76;
      else
        v78 = v70 >> 2;
      if (v75 >= v76)
        v79 = v76;
      else
        v79 = v70 >> 2;
      if (v79)
      {
        v80 = (unsigned __int8 *)(*((_QWORD *)v87 + 2) + v74);
        do
        {
          v81 = *v80++;
          v73 += bdz_lookup_table[v81];
          --v78;
        }
        while (v78);
      }
      v72[v77] = v73;
      v74 += v79;
      v76 -= v75;
      ++v77;
    }
    while (v77 != v87[10]);
  }
  v84 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v84 = *(_DWORD *)v90;
  v82 = malloc_type_malloc(0x38uLL, 0x1030040C16D3081uLL);
  v83 = *((_OWORD *)v87 + 1);
  *((_QWORD *)v87 + 2) = 0;
  v82[1] = v83;
  *((_QWORD *)v87 + 3) = 0;
  *((_QWORD *)v82 + 6) = *((_QWORD *)v87 + 6);
  *((_QWORD *)v87 + 6) = 0;
  *((_DWORD *)v82 + 10) = v87[10];
  *((_DWORD *)v82 + 8) = v87[8];
  *((_BYTE *)v82 + 36) = *((_BYTE *)v87 + 36);
  *(_QWORD *)&v83 = *(_QWORD *)v87;
  *(_QWORD *)v82 = *(_QWORD *)v87;
  *((_DWORD *)v82 + 2) = v87[2];
  v84[2] = v82;
  *((_DWORD *)v84 + 1) = v83;
  if (*(_DWORD *)(v90 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v50);
  return v84;
}

uint64_t bdz_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  unint64_t v4;
  size_t v5;
  unsigned int __ptr;
  void *v8;

  v8 = 0;
  __ptr = 0;
  v3 = *(_QWORD *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 24), &v8, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v8, __ptr, 1uLL, a2);
  free(v8);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 4uLL, 1uLL, a2);
  LODWORD(v4) = *(_DWORD *)(v3 + 4);
  LODWORD(v5) = vcvtpd_u64_f64((double)v4 * 0.25);
  fwrite(*(const void **)(v3 + 16), v5, 1uLL, a2);
  fwrite((const void *)(v3 + 32), 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 36), 1uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 40), 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 48), 4 * *(unsigned int *)(v3 + 40), 1uLL, a2);
  return 1;
}

size_t bdz_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  size_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unsigned int __ptr;

  __ptr = 0;
  v4 = malloc_type_malloc(0x38uLL, 0x1030040C16D3081uLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(&__ptr, 4uLL, 1uLL, a1);
  v5 = __ptr;
  v6 = malloc_type_malloc(__ptr, 0x8E9CA22uLL);
  fread(v6, v5, 1uLL, a1);
  v4[3] = hash_state_load((const char *)v6);
  free(v6);
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 1, 4uLL, 1uLL, a1);
  LODWORD(v7) = *((_DWORD *)v4 + 1);
  LODWORD(v5) = vcvtpd_u64_f64((double)v7 * 0.25);
  v8 = malloc_type_calloc(v5, 1uLL, 0x100004077774924uLL);
  v4[2] = v8;
  fread(v8, v5, 1uLL, a1);
  fread(v4 + 4, 4uLL, 1uLL, a1);
  fread((char *)v4 + 36, 1uLL, 1uLL, a1);
  fread(v4 + 5, 4uLL, 1uLL, a1);
  v9 = malloc_type_calloc(*((unsigned int *)v4 + 10), 4uLL, 0x100004052888210uLL);
  v4[6] = v9;
  return fread(v9, 4 * *((unsigned int *)v4 + 10), 1uLL, a1);
}

uint64_t bdz_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  char v8;
  uint64_t result;
  unint64_t v10;
  unsigned __int8 *v11;
  unint64_t v12;
  int v13;
  unsigned int v14;
  char v15;
  int32x2_t v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 16);
  hash_vector(*(_DWORD **)(v3 + 24), a2, a3, &v16);
  v4 = *(_DWORD *)(v3 + 8);
  v16.i32[0] %= v4;
  v16.i32[1] = v16.i32[1] % v4 + v4;
  v17 = v17 % v4 + 2 * v4;
  v5 = *(_QWORD *)(v3 + 16);
  v6 = ((*(unsigned __int8 *)(v5 + ((unint64_t)v16.u32[1] >> 2)) >> (2 * (v16.i8[4] & 3))) & 3)
     + ((*(unsigned __int8 *)(v5 + ((unint64_t)v16.u32[0] >> 2)) >> (2 * (v16.i8[0] & 3))) & 3)
     + ((*(unsigned __int8 *)(v5 + ((unint64_t)v17 >> 2)) >> (2 * (v17 & 3))) & 3);
  v7 = v16.u32[(v6 - 3 * ((unsigned __int16)(86 * v6) >> 8))];
  v8 = *(_BYTE *)(v3 + 36);
  result = *(unsigned int *)(*(_QWORD *)(v3 + 48) + 4 * (v7 >> v8));
  LODWORD(v10) = v7 >> v8 << v8 >> 2;
  if (v10 < (v7 >> 2))
  {
    v11 = (unsigned __int8 *)(v5 + v10);
    v12 = (v7 >> 2) - v10;
    do
    {
      v13 = *v11++;
      result = result + bdz_lookup_table[v13];
      --v12;
    }
    while (v12);
    v10 = v7 >> 2;
  }
  v14 = 4 * v10;
  if (4 * (int)v10 < v7)
  {
    v15 = 8 * v10;
    do
    {
      if ((~(*(unsigned __int8 *)(v5 + ((unint64_t)v14 >> 2)) >> (v15 & 6)) & 3) != 0)
        result = (result + 1);
      else
        result = result;
      ++v14;
      v15 += 2;
    }
    while ((_DWORD)v7 != v14);
  }
  return result;
}

void bdz_destroy(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[2];
  free(*(void **)(v2 + 16));
  hash_state_destroy(*(_DWORD **)(v2 + 24));
  free(*(void **)(v2 + 48));
  free((void *)v2);
  free(a1);
}

void *bdz_pack(uint64_t a1, int *a2)
{
  uint64_t v3;
  int type;
  _DWORD *v5;
  _DWORD *v6;
  _BYTE *v7;
  unint64_t v8;
  size_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v3 + 24));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 24), a2);
  v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  *v5 = *(_DWORD *)(v3 + 8);
  v5[1] = *(_DWORD *)(v3 + 40);
  v6 = v5 + 2;
  memcpy(v5 + 2, *(const void **)(v3 + 48), 4 * *(unsigned int *)(v3 + 40));
  v7 = &v6[*(unsigned int *)(v3 + 40)];
  *v7 = *(_BYTE *)(v3 + 36);
  LODWORD(v8) = *(_DWORD *)(v3 + 4);
  LODWORD(v9) = vcvtpd_u64_f64((double)v8 * 0.25);
  return memcpy(v7 + 1, *(const void **)(v3 + 16), v9);
}

uint64_t bdz_packed_size(uint64_t a1)
{
  uint64_t v1;
  int type;
  int v3;
  unint64_t v4;

  v1 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v1 + 24));
  v3 = hash_state_packed_size(type);
  LODWORD(v4) = *(_DWORD *)(v1 + 4);
  return v3 + 4 * *(_DWORD *)(v1 + 40) + vcvtpd_u64_f64((double)v4 * 0.25) + 17;
}

uint64_t bdz_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int v7;
  unsigned int *v8;
  _DWORD *v9;
  unsigned int v10;
  uint64_t v11;
  char *v12;
  _BYTE *v13;
  char v14;
  int v15;
  unint64_t v16;
  uint64_t result;
  unint64_t v18;
  unsigned __int8 *v19;
  unint64_t v20;
  int v21;
  unsigned int v22;
  char v23;
  int32x2_t v25;
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (unsigned int *)(a1 + 1);
  v6 = *a1;
  v7 = hash_state_packed_size(*a1);
  v8 = (unsigned int *)((char *)v5 + v7);
  v9 = v8 + 2;
  v10 = *v8;
  v11 = v8[1];
  v12 = (char *)&v8[v11 + 2];
  v14 = *v12;
  v13 = v12 + 1;
  hash_vector_packed(v5, v6, a2, a3, &v25);
  v25.i32[0] %= v10;
  v25.i32[1] = v25.i32[1] % v10 + v10;
  v26 = v26 % v10 + 2 * v10;
  v15 = ((v13[(unint64_t)v25.u32[1] >> 2] >> (2 * (v25.i8[4] & 3))) & 3)
      + ((v13[(unint64_t)v25.u32[0] >> 2] >> (2 * (v25.i8[0] & 3))) & 3)
      + ((v13[(unint64_t)v26 >> 2] >> (2 * (v26 & 3))) & 3);
  v16 = v25.u32[(v15 - 3 * ((unsigned __int16)(86 * v15) >> 8))];
  result = v9[v16 >> v14];
  LODWORD(v18) = v16 >> v14 << v14 >> 2;
  if (v18 < (v16 >> 2))
  {
    v19 = (unsigned __int8 *)&a1[v11 + 3] + v7 + v18 + 1;
    v20 = (v16 >> 2) - v18;
    do
    {
      v21 = *v19++;
      result = result + bdz_lookup_table[v21];
      --v20;
    }
    while (v20);
    v18 = v16 >> 2;
  }
  v22 = 4 * v18;
  if (4 * (int)v18 < v16)
  {
    v23 = 8 * v18;
    do
    {
      if ((~(v13[(unint64_t)v22 >> 2] >> (v23 & 6)) & 3) != 0)
        result = (result + 1);
      else
        result = result;
      ++v22;
      v23 += 2;
    }
    while ((_DWORD)v16 != v22);
  }
  return result;
}

uint64_t bdz_dump_graph(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  if (a2)
  {
    v2 = result;
    v3 = 0;
    v4 = 0;
    v5 = 24 * a2;
    do
    {
      printf("\nedge %d %d %d %d ", v4, *(_DWORD *)(*(_QWORD *)(v2 + 8) + v3), *(_DWORD *)(*(_QWORD *)(v2 + 8) + v3 + 4), *(_DWORD *)(*(_QWORD *)(v2 + 8) + v3 + 8));
      result = printf(" nexts %d %d %d", *(_DWORD *)(*(_QWORD *)(v2 + 8) + v3 + 12), *(_DWORD *)(*(_QWORD *)(v2 + 8) + v3 + 16), *(_DWORD *)(*(_QWORD *)(v2 + 8) + v3 + 20));
      ++v4;
      v3 += 24;
    }
    while (v5 != v3);
  }
  return result;
}

double bdz_ph_config_new()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x20uLL, 0x1030040D1A1786CuLL);
  if (!v0)
    bdz_ph_config_new_cold_1();
  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  return result;
}

void bdz_ph_config_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t bdz_ph_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1)
    **(_DWORD **)(result + 32) = *a2;
  return result;
}

_QWORD *bdz_ph_new(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  size_t v6;
  unsigned int *v7;
  char *v8;
  void *v9;
  int v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  int v14;
  _DWORD *v15;
  unsigned int v16;
  unsigned __int32 v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  unsigned int *v25;
  uint64_t v26;
  unsigned __int8 v27;
  int v28;
  uint64_t v29;
  int v30;
  unsigned int *v31;
  uint64_t v32;
  char *v33;
  unsigned int i;
  unsigned int *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned __int8 v44;
  unint64_t v45;
  unsigned __int8 v46;
  unint64_t v47;
  unsigned __int8 v48;
  FILE **v49;
  char *v50;
  char *v51;
  unint64_t v52;
  unsigned int v53;
  unsigned int *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unsigned __int8 v58;
  char *v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  int v64;
  unsigned int v65;
  int v66;
  uint64_t v67;
  unsigned int v68;
  int v69;
  uint64_t v70;
  int v71;
  size_t v73;
  unint64_t v74;
  _BYTE *v75;
  _BYTE *v76;
  int v77;
  unint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  _QWORD *v82;
  _DWORD *v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  _QWORD v90[4];
  unsigned __int8 *v91;
  unsigned int v92;
  int32x2_t v93;
  unsigned int v94;
  uint64_t v95;

  v2 = a1;
  v95 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2 == 0.0)
    a2 = 1.23;
  v4 = *(unsigned int *)(*(_QWORD *)(a1 + 8) + 8);
  v5 = vcvtpd_u64_f64(a2 * (double)v4 / 3.0) | 1;
  v6 = 3 * v5;
  *(_DWORD *)(v3 + 4) = v4;
  *(_DWORD *)(v3 + 8) = v6;
  *(_DWORD *)(v3 + 12) = v5;
  v7 = (unsigned int *)malloc_type_malloc(24 * v4, 0x1000040504FFAC1uLL);
  v90[1] = v7;
  v8 = (char *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v90[2] = v8;
  v9 = malloc_type_malloc(v6, 0xB0CACD9AuLL);
  v90[3] = v9;
  v84 = malloc_type_malloc(4 * *(unsigned int *)(v3 + 4), 0x100004052888210uLL);
  if (*(_DWORD *)(v2 + 16))
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v3 + 4), *(_DWORD *)(v3 + 8));
  v90[0] = 0;
  v10 = 100;
  v88 = v2;
  v85 = v3;
  while (1)
  {
    v86 = v10;
    *(_QWORD *)(v3 + 24) = hash_state_new(*(_DWORD *)v3, 0xFu);
    v11 = *(_QWORD *)(v2 + 32);
    v12 = *(unsigned int *)(v11 + 8);
    memset(v8, 255, 4 * v12);
    bzero(v9, v12);
    LODWORD(v90[0]) = 0;
    (*(void (**)(_QWORD))(*(_QWORD *)(v2 + 8) + 32))(**(_QWORD **)(v2 + 8));
    v13 = *(_QWORD *)(v2 + 8);
    if (*(_DWORD *)(v13 + 8))
    {
      v14 = 0;
      v15 = v7 + 3;
      v87 = v11;
      do
      {
        v89 = v14;
        v92 = 0;
        v91 = 0;
        (*(void (**)(_QWORD, unsigned __int8 **, unsigned int *))(v13 + 16))(*(_QWORD *)v13, &v91, &v92);
        hash_vector(*(_DWORD **)(v11 + 24), v91, v92, &v93);
        v16 = *(_DWORD *)(v11 + 12);
        v17 = v93.i32[0] % v16;
        v18 = v93.i32[1] % v16 + v16;
        v19 = v94 % v16 + 2 * v16;
        (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(v88 + 8) + 24))(**(_QWORD **)(v88 + 8), v91, v92);
        *(v15 - 3) = v17;
        *(v15 - 2) = v18;
        *(v15 - 1) = v19;
        *v15 = *(_DWORD *)&v8[4 * v17];
        v15[1] = *(_DWORD *)&v8[4 * v18];
        v15[2] = *(_DWORD *)&v8[4 * v19];
        *(_DWORD *)&v8[4 * v19] = v89;
        *(_DWORD *)&v8[4 * v18] = v89;
        *(_DWORD *)&v8[4 * v17] = v89;
        ++*((_BYTE *)v9 + v17);
        ++*((_BYTE *)v9 + v18);
        ++*((_BYTE *)v9 + v19);
        v11 = v87;
        v14 = v89 + 1;
        v13 = *(_QWORD *)(v88 + 8);
        v15 += 6;
      }
      while ((v89 + 1) < *(_DWORD *)(v13 + 8));
      v20 = v89 + 1;
      LODWORD(v90[0]) = v89 + 1;
    }
    else
    {
      v20 = 0;
    }
    v21 = *(unsigned int *)(v11 + 4);
    v22 = malloc_type_malloc((v21 >> 3) + 1, 0xF0A07DF0uLL);
    bzero(v22, (v21 >> 3) + 1);
    if (!(_DWORD)v21)
      goto LABEL_46;
    v23 = 0;
    v24 = 0;
    v25 = v7 + 1;
    do
    {
      if (*((_BYTE *)v9 + *(v25 - 1)) == 1 || *((_BYTE *)v9 + *v25) == 1 || *((_BYTE *)v9 + v25[1]) == 1)
      {
        v26 = v23 >> 3;
        v27 = bitmask_0[v23 & 7];
        if (!((v27 & *((_BYTE *)v22 + v26)) >> (v23 & 7)))
        {
          v84[v24++] = v23;
          *((_BYTE *)v22 + v26) |= v27;
        }
      }
      ++v23;
      v25 += 6;
    }
    while (v21 != v23);
    if (v24)
    {
      v28 = 0;
      do
      {
        v29 = 0;
        v30 = v84[v28++];
        v31 = &v7[6 * v30];
        do
        {
          v32 = v31[v29];
          v33 = &v8[4 * v32];
          for (i = *(_DWORD *)v33; i != v30 && i != -1; i = v39)
          {
            v36 = &v7[6 * i];
            if (*v36 == (_DWORD)v32)
            {
              v37 = 0;
            }
            else if (v36[1] == (_DWORD)v32)
            {
              v37 = 1;
            }
            else
            {
              v37 = 2;
            }
            v38 = (uint64_t)&v7[6 * i + v37];
            v39 = *(_DWORD *)(v38 + 12);
            v33 = (char *)(v38 + 12);
          }
          if (i == -1)
          {
            printf("\nerror remove edge %d dump graph", v30);
            bdz_ph_dump_graph((uint64_t)v90, v20, v20 + (v20 >> 2));
            exit(-1);
          }
          *(_DWORD *)v33 = v7[6 * i + 3 + v29];
          --*((_BYTE *)v9 + v32);
          ++v29;
        }
        while (v29 != 3);
        v41 = *v31;
        v40 = v31[1];
        v42 = v31[2];
        if (*((_BYTE *)v9 + v41) == 1)
        {
          v43 = *(unsigned int *)&v8[4 * v41];
          v44 = bitmask_0[v43 & 7];
          if (!((v44 & *((_BYTE *)v22 + (v43 >> 3))) >> (v43 & 7)))
          {
            v84[v24++] = v43;
            *((_BYTE *)v22 + (v43 >> 3)) |= v44;
          }
        }
        if (*((_BYTE *)v9 + v40) == 1)
        {
          v45 = *(unsigned int *)&v8[4 * v40];
          v46 = bitmask_0[v45 & 7];
          if (!((v46 & *((_BYTE *)v22 + (v45 >> 3))) >> (v45 & 7)))
          {
            v84[v24++] = v45;
            *((_BYTE *)v22 + (v45 >> 3)) |= v46;
          }
        }
        if (*((_BYTE *)v9 + v42) == 1)
        {
          v47 = *(unsigned int *)&v8[4 * v42];
          v48 = bitmask_0[v47 & 7];
          if (!((v48 & *((_BYTE *)v22 + (v47 >> 3))) >> (v47 & 7)))
          {
            v84[v24++] = v47;
            *((_BYTE *)v22 + (v47 >> 3)) |= v48;
          }
        }
      }
      while (v28 != v24);
    }
    else
    {
LABEL_46:
      v28 = 0;
    }
    free(v22);
    if (v28 == (_DWORD)v21)
      break;
    v3 = v85;
    v10 = v86 - 1;
    hash_state_destroy(*(_DWORD **)(v85 + 24));
    *(_QWORD *)(v85 + 24) = 0;
    v2 = v88;
    if (*(_DWORD *)(v88 + 16))
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "acyclic graph creation failure - %u iterations remaining\n", v10);
    if (v86 == 1)
    {
      free(v84);
      free(v7);
      free(v8);
      free(v9);
      return 0;
    }
  }
  free(v8);
  free(v9);
  v49 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*(_DWORD *)(v88 + 16))
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Entering assigning step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v85 + 4), *(_DWORD *)(v85 + 8));
  v50 = (char *)malloc_type_malloc(((unint64_t)*(unsigned int *)(v85 + 8) >> 3) + 1, 0xD2234E03uLL);
  v51 = v50;
  LODWORD(v52) = *(_DWORD *)(v85 + 8);
  LODWORD(v50) = vcvtpd_u64_f64((double)v52 * 0.25);
  *(_QWORD *)(v85 + 16) = malloc_type_calloc((size_t)v50, 1uLL, 0x100004077774924uLL);
  bzero(v51, ((unint64_t)*(unsigned int *)(v85 + 8) >> 3) + 1);
  if (v20)
  {
    v53 = v20 - 1;
    do
    {
      v54 = &v7[6 * v84[v53]];
      v56 = *v54;
      v55 = v54[1];
      v57 = v54[2];
      v58 = bitmask_0[v56 & 7];
      v59 = &v51[v55 >> 3];
      v60 = *v59;
      v61 = bitmask_0[v55 & 7];
      v62 = (v61 & v60) >> (v55 & 7);
      if ((v58 & v51[v56 >> 3]) >> (v56 & 7))
      {
        if (v62)
        {
          v63 = *(_QWORD *)(v85 + 16);
          v64 = 8
              - (((*(unsigned __int8 *)(v63 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3)
               + ((*(unsigned __int8 *)(v63 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3));
          *(_BYTE *)(v63 + (v57 >> 2)) |= (v64 - 3 * ((86 * v64) >> 8)) << (2 * (v57 & 3));
          v58 = bitmask_0[v57 & 7];
          v59 = &v51[v57 >> 3];
        }
        else
        {
          v68 = v51[v57 >> 3];
          v69 = bitmask_0[v57 & 7];
          if (!((v69 & v68) >> (v57 & 7)))
            v51[v57 >> 3] = v69 | v68;
          v70 = *(_QWORD *)(v85 + 16);
          v71 = (((*(unsigned __int8 *)(v70 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
               + ((*(unsigned __int8 *)(v70 + (v56 >> 2)) >> (2 * (v56 & 3))) & 3)) ^ 7;
          *(_BYTE *)(v70 + (v55 >> 2)) |= (v71 - 3 * ((86 * v71) >> 8)) << (2 * (v55 & 3));
          v58 = v61;
        }
      }
      else
      {
        if (!v62)
          *v59 = v61 | v60;
        v65 = v51[v57 >> 3];
        v66 = bitmask_0[v57 & 7];
        if (!((v66 & v65) >> (v57 & 7)))
          v51[v57 >> 3] = v66 | v65;
        v67 = *(_QWORD *)(v85 + 16);
        *(_BYTE *)(v67 + (v56 >> 2)) |= ((6
                                                         - (((*(unsigned __int8 *)(v67 + (v57 >> 2)) >> (2 * (v57 & 3))) & 3)
                                                          + ((*(unsigned __int8 *)(v67 + (v55 >> 2)) >> (2 * (v55 & 3))) & 3)))
                                       % 3u) << (2 * (v56 & 3));
        v59 = &v51[v56 >> 3];
      }
      *v59 |= v58;
    }
    while ((unint64_t)v53--);
  }
  free(v51);
  free(v84);
  free(v7);
  if (*(_DWORD *)(v88 + 16))
    v73 = fwrite("Starting optimization step\n", 0x1BuLL, 1uLL, *v49);
  LODWORD(v74) = *(_DWORD *)(v85 + 8);
  LODWORD(v73) = vcvtpd_u64_f64((double)v74 / 5.0);
  v75 = malloc_type_calloc(v73, 1uLL, 0x100004077774924uLL);
  v76 = v75;
  if (*(_DWORD *)(v85 + 8))
  {
    v77 = 0;
    v78 = 0;
    v79 = (char *)&pow3_table;
    do
    {
      v75[v78 / 5uLL] += ((*(unsigned __int8 *)(*(_QWORD *)(v85 + 16) + (v78 >> 2)) >> (v77 & 6)) & 3)
                                     * v79[-5 * (v78 / 5)];
      ++v78;
      ++v79;
      v77 += 2;
    }
    while (v78 < *(_DWORD *)(v85 + 8));
  }
  free(*(void **)(v85 + 16));
  *(_QWORD *)(v85 + 16) = v76;
  v82 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v82 = *(_DWORD *)v88;
  v80 = (char *)malloc_type_malloc(0x20uLL, 0x1030040ECD7FD48uLL);
  *((_OWORD *)v80 + 1) = *(_OWORD *)(v85 + 16);
  *(_QWORD *)(v85 + 16) = 0;
  *(_QWORD *)(v85 + 24) = 0;
  *(_DWORD *)v80 = *(_DWORD *)(v85 + 4);
  v81 = *(_QWORD *)(v85 + 8);
  *(_QWORD *)(v80 + 4) = v81;
  v82[2] = v80;
  *((_DWORD *)v82 + 1) = v81;
  if (*(_DWORD *)(v88 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v49);
  return v82;
}

uint64_t bdz_ph_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  unint64_t v4;
  size_t v5;
  unsigned int __ptr;
  void *v8;

  v8 = 0;
  __ptr = 0;
  v3 = *(_QWORD *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 24), &v8, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v8, __ptr, 1uLL, a2);
  free(v8);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 4uLL, 1uLL, a2);
  LODWORD(v4) = *(_DWORD *)(v3 + 4);
  LODWORD(v5) = vcvtpd_u64_f64((double)v4 / 5.0);
  fwrite(*(const void **)(v3 + 16), v5, 1uLL, a2);
  return 1;
}

size_t bdz_ph_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  size_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unsigned int __ptr;

  __ptr = 0;
  v4 = malloc_type_malloc(0x20uLL, 0x1030040ECD7FD48uLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(&__ptr, 4uLL, 1uLL, a1);
  v5 = __ptr;
  v6 = malloc_type_malloc(__ptr, 0x44FAF061uLL);
  fread(v6, v5, 1uLL, a1);
  v4[3] = hash_state_load((const char *)v6);
  free(v6);
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 1, 4uLL, 1uLL, a1);
  LODWORD(v7) = *((_DWORD *)v4 + 1);
  LODWORD(v5) = vcvtpd_u64_f64((double)v7 / 5.0);
  v8 = malloc_type_calloc(v5, 1uLL, 0x100004077774924uLL);
  v4[2] = v8;
  return fread(v8, v5, 1uLL, a1);
}

uint64_t bdz_ph_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  int32x2_t v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 16);
  hash_vector(*(_DWORD **)(v3 + 24), a2, a3, &v8);
  v4 = *(_DWORD *)(v3 + 8);
  v8.i32[0] %= v4;
  v8.i32[1] = v8.i32[1] % v4 + v4;
  v9 = v9 % v4 + 2 * v4;
  v5 = *(_QWORD *)(v3 + 16);
  v6 = lookup_table[256 * (unint64_t)(v8.i32[1] % 5u) + *(unsigned __int8 *)(v5 + v8.u32[1] / 5uLL)]
     + lookup_table[256 * (unint64_t)(v8.i32[0] % 5u) + *(unsigned __int8 *)(v5 + v8.u32[0] / 5uLL)]
     + lookup_table[256 * (unint64_t)(v9 % 5) + *(unsigned __int8 *)(v5 + v9 / 5uLL)];
  return v8.u32[(unsigned __int16)(v6 - 3 * ((21846 * v6) >> 16))];
}

void bdz_ph_destroy(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[2];
  free(*(void **)(v2 + 16));
  hash_state_destroy(*(_DWORD **)(v2 + 24));
  free((void *)v2);
  free(a1);
}

void *bdz_ph_pack(uint64_t a1, int *a2)
{
  uint64_t v3;
  int type;
  _DWORD *v5;
  unint64_t v6;
  size_t v7;

  v3 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v3 + 24));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 24), a2);
  v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  *v5 = *(_DWORD *)(v3 + 8);
  LODWORD(v6) = *(_DWORD *)(v3 + 4);
  LODWORD(v7) = vcvtpd_u64_f64((double)v6 / 5.0);
  return memcpy(v5 + 1, *(const void **)(v3 + 16), v7);
}

uint64_t bdz_ph_packed_size(uint64_t a1)
{
  uint64_t v1;
  int type;
  unint64_t v3;

  v1 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v1 + 24));
  LODWORD(v3) = *(_DWORD *)(v1 + 4);
  return hash_state_packed_size(type) + vcvtpd_u64_f64((double)v3 / 5.0) + 12;
}

uint64_t bdz_ph_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int32x2_t v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (unsigned int *)(a1 + 1);
  v6 = *a1;
  v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  v9 = *v7++;
  v8 = v9;
  hash_vector_packed(v5, v6, a2, a3, &v14);
  v14.i32[0] %= v9;
  v14.i32[1] = v14.i32[1] % v8 + v8;
  v10 = *((unsigned __int8 *)v7 + v14.u32[0] / 5uLL);
  v11 = *((unsigned __int8 *)v7 + v14.u32[1] / 5uLL);
  v15 = v15 % v8 + 2 * v8;
  v12 = lookup_table[256 * (unint64_t)(v14.i32[1] % 5u) + v11]
      + lookup_table[256 * (unint64_t)(v14.i32[0] % 5u) + v10]
      + lookup_table[256 * (unint64_t)(v15 % 5) + *((unsigned __int8 *)v7 + v15 / 5uLL)];
  return v14.u32[(unsigned __int16)(v12 - 3 * ((21846 * v12) >> 16))];
}

uint64_t bdz_ph_dump_graph(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = result;
  if (a2)
  {
    v5 = 0;
    v6 = 0;
    v7 = 24 * a2;
    do
    {
      printf("\nedge %d %d %d %d ", v6, *(_DWORD *)(*(_QWORD *)(v4 + 8) + v5), *(_DWORD *)(*(_QWORD *)(v4 + 8) + v5 + 4), *(_DWORD *)(*(_QWORD *)(v4 + 8) + v5 + 8));
      result = printf(" nexts %d %d %d", *(_DWORD *)(*(_QWORD *)(v4 + 8) + v5 + 12), *(_DWORD *)(*(_QWORD *)(v4 + 8) + v5 + 16), *(_DWORD *)(*(_QWORD *)(v4 + 8) + v5 + 20));
      ++v6;
      v5 += 24;
    }
    while (v7 != v5);
  }
  if (a3)
  {
    v8 = 0;
    do
    {
      result = printf("\nfirst for vertice %d %d ", v8, *(_DWORD *)(*(_QWORD *)(v4 + 16) + 4 * v8));
      ++v8;
    }
    while (a3 != v8);
  }
  return result;
}

double bmz_config_new()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x28uLL, 0x10B004021B77C51uLL);
  if (v0)
  {
    v0[4] = 0;
    result = 0.0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void bmz_config_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t bmz_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  _DWORD *v2;
  int v3;

  if (*a2 != 1)
  {
    v2 = *(_DWORD **)(result + 32);
    *v2 = *a2;
    v3 = a2[1];
    if (v3 != 1)
      v2[1] = v3;
  }
  return result;
}

_QWORD *bmz_new(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  double v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  FILE **v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  void **v31;
  int v32;
  void **v33;
  void *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int k;
  unint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int m;
  unint64_t v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int n;
  unint64_t v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int i;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unint64_t v59;
  unsigned int v60;
  void *v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int j;
  unint64_t v67;
  int v68;
  unsigned int ii;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  unint64_t v74;
  unint64_t jj;
  uint64_t v76;
  char v77;
  _QWORD *v78;
  char *v80;
  __int128 v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  void **ptr;
  void *ptra;
  char v89;
  unsigned int v90;
  unsigned int v91;
  unint64_t v92;
  unsigned __int8 *v93;

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8);
  if (a2 == 0.0)
    v5 = 1.15;
  else
    v5 = a2;
  v6 = vcvtpd_u64_f64(v5 * (double)v4);
  *(_DWORD *)(v3 + 8) = v4;
  *(_DWORD *)(v3 + 12) = v6;
  *(_QWORD *)(v3 + 16) = graph_new(v6, v4);
  v7 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
  v8 = 0;
  *(_QWORD *)(v3 + 32) = v7;
  do
  {
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + v8) = 0;
    v8 += 8;
  }
  while (v8 != 24);
  v9 = 0;
  v10 = 20;
  v82 = v2;
  do
  {
    v85 = v10;
    if (*(_DWORD *)(v2 + 16))
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v3 + 8), *(_DWORD *)(v3 + 12));
    v11 = 100;
    while (1)
    {
      **(_QWORD **)(v3 + 32) = hash_state_new(*(_DWORD *)v3, *(_DWORD *)(v3 + 12));
      *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) = hash_state_new(*(_DWORD *)(v3 + 4), *(_DWORD *)(v3 + 12));
      v12 = *(_QWORD *)(v2 + 32);
      graph_clear_edges(*(unsigned int **)(v12 + 16));
      (*(void (**)(_QWORD))(*(_QWORD *)(v2 + 8) + 32))(**(_QWORD **)(v2 + 8));
      v13 = *(_QWORD *)(v2 + 8);
      if (!*(_DWORD *)(v13 + 8))
        break;
      v14 = 0;
      while (1)
      {
        LODWORD(v92) = 0;
        v93 = 0;
        (*(void (**)(_QWORD, unsigned __int8 **, unint64_t *))(v13 + 16))(*(_QWORD *)v13, &v93, &v92);
        v15 = hash(**(_DWORD ***)(v12 + 32), v93, v92) % *(_DWORD *)(v12 + 12);
        v16 = hash(*(_DWORD **)(*(_QWORD *)(v12 + 32) + 8), v93, v92);
        v17 = *(_DWORD *)(v12 + 12);
        v18 = v16 % v17;
        v19 = v16 % v17 + 1 < v17 ? v18 + 1 : 0;
        v20 = v15 == v18 ? v19 : v18;
        if (v15 == v20)
          break;
        (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(v2 + 8) + 24))(**(_QWORD **)(v2 + 8), v93, v92);
        v21 = graph_contains_edge(*(_QWORD *)(v12 + 16), v15, v20);
        if (*(_DWORD *)(v2 + 16) && v21)
        {
          fwrite("A non simple graph was generated\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
          goto LABEL_28;
        }
        if (v21)
          goto LABEL_28;
        graph_add_edge(*(_QWORD *)(v12 + 16), v15, v20);
        ++v14;
        v13 = *(_QWORD *)(v2 + 8);
        if (v14 >= *(_DWORD *)(v13 + 8))
          goto LABEL_32;
      }
      if (*(_DWORD *)(v2 + 16))
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Self loop for key %u\n", v14);
      (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(v2 + 8) + 24))(**(_QWORD **)(v2 + 8), v93, v92);
LABEL_28:
      --v11;
      hash_state_destroy(**(_DWORD ***)(v3 + 32));
      **(_QWORD **)(v3 + 32) = 0;
      hash_state_destroy(*(_DWORD **)(*(_QWORD *)(v3 + 32) + 8));
      *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) = 0;
      if (*(_DWORD *)(v2 + 16))
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "simple graph creation failure - %u iterations remaining\n", v11);
      if (!v11)
      {
        graph_destroy(*(void ***)(v3 + 16));
        return 0;
      }
    }
LABEL_32:
    if (*(_DWORD *)(v2 + 16))
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    graph_obtain_critical_nodes(*(void ***)(v3 + 16));
    if (*(_DWORD *)(v2 + 16))
    {
      v22 = (FILE **)MEMORY[0x24BDAC8D8];
      fwrite("Starting Searching step.\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      fwrite("\tTraversing critical vertices.\n", 0x1FuLL, 1uLL, *v22);
    }
    v23 = malloc_type_malloc(((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1, 0x6CF02805uLL);
    bzero(v23, ((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1);
    v24 = malloc_type_malloc(((unint64_t)*(unsigned int *)(v3 + 8) >> 3) + 1, 0x18E0B029uLL);
    bzero(v24, ((unint64_t)*(unsigned int *)(v3 + 8) >> 3) + 1);
    free(*(void **)(v3 + 24));
    v25 = malloc_type_calloc(*(unsigned int *)(v3 + 12), 4uLL, 0x100004052888210uLL);
    *(_QWORD *)(v3 + 24) = v25;
    if (!v25)
      bmz_new_cold_1();
    if (*(_DWORD *)(v3 + 12))
    {
      v26 = 0;
      v91 = 0;
      v27 = 1;
      do
      {
        if (graph_node_is_critical(*(_QWORD *)(v3 + 16), v26))
        {
          v28 = v26 >> 3;
          v29 = bitmask_1[v26 & 7];
          if (!((v29 & *((_BYTE *)v23 + v28)) >> (v26 & 7)))
          {
            v30 = graph_ncritical_nodes(*(_QWORD *)(v3 + 16));
            if (v5 <= 1.14)
            {
              v33 = (void **)vqueue_new(((double)v30 * 0.5) + 1);
              v92 = 0;
              v93 = 0;
              *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * v26) = vcvtpd_u64_f64((double)v27 * 0.5) - 1;
              *((_BYTE *)v23 + v28) |= v29;
              vqueue_insert((uint64_t)v33, v26);
              if (vqueue_is_empty((uint64_t)v33))
              {
                v34 = 0;
                v35 = 0;
              }
              else
              {
                v90 = 0;
                v83 = 0;
                v84 = (uint64_t)v33;
                v34 = 0;
                do
                {
                  v50 = vqueue_remove((uint64_t)v33);
                  v93 = (unsigned __int8 *)graph_neighbors_it(*(_QWORD *)(v3 + 16), v50);
                  v51 = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v93);
                  if (v51 != -1)
                  {
                    for (i = v51; i != -1; i = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v93))
                    {
                      if (graph_node_is_critical(*(_QWORD *)(v3 + 16), i))
                      {
                        v53 = i & 7;
                        if (!((bitmask_1[v53] & *((_BYTE *)v23 + ((unint64_t)i >> 3))) >> v53))
                        {
                          v86 = bitmask_1[v53];
                          v54 = 0;
                          v55 = v90;
                          while (1)
                          {
                            v90 = v55;
                            ptra = v34;
                            if (v54 >= v55)
                            {
                              v56 = v91 + 1;
                              v54 = -1;
                            }
                            else
                            {
                              v56 = *((_DWORD *)v34 + v54++);
                            }
                            v92 = graph_neighbors_it(*(_QWORD *)(v3 + 16), i);
                            v57 = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92);
                            if (v57 == -1)
                              break;
                            v58 = v57;
                            while (1)
                            {
                              if (graph_node_is_critical(*(_QWORD *)(v3 + 16), v58)
                                && (bitmask_1[v58 & 7] & *((_BYTE *)v23 + ((unint64_t)v58 >> 3))) >> (v58 & 7))
                              {
                                v59 = *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * v58) + v56;
                                if (v59 >= *(_DWORD *)(v3 + 8))
                                {
                                  v35 = 1;
                                  v33 = (void **)v84;
                                  v34 = ptra;
                                  goto LABEL_116;
                                }
                                if ((bitmask_1[v59 & 7] & *((_BYTE *)v24 + (v59 >> 3))) >> (v59 & 7))
                                  break;
                              }
                              v58 = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92);
                              if (v58 == -1)
                                goto LABEL_100;
                            }
                            v34 = ptra;
                            if (v56 <= v91)
                            {
                              v55 = v90;
                            }
                            else
                            {
                              v60 = v90;
                              if (v90 == v83)
                              {
                                v83 = v90 + 1024;
                                v61 = malloc_type_realloc(ptra, 4 * (v90 + 1024), 0x100004052888210uLL);
                                v60 = v90;
                                v34 = v61;
                              }
                              *((_DWORD *)v34 + v60) = v56;
                              v55 = v60 + 1;
                            }
                            v62 = v91;
                            if (v56 > v91)
                              v62 = v56;
                            v91 = v62;
                          }
LABEL_100:
                          v64 = v90;
                          v63 = v91;
                          if (v56 > v91)
                            v63 = v56;
                          v91 = v63;
                          if (v54 - 1 < v90)
                          {
                            --v90;
                            *((_DWORD *)ptra + v54 - 1) = *((_DWORD *)ptra + v64 - 1);
                          }
                          v92 = graph_neighbors_it(*(_QWORD *)(v3 + 16), i);
                          v65 = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92);
                          if (v65 != -1)
                          {
                            for (j = v65; j != -1; j = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92))
                            {
                              if (graph_node_is_critical(*(_QWORD *)(v3 + 16), j))
                              {
                                if ((bitmask_1[j & 7] & *((_BYTE *)v23 + ((unint64_t)j >> 3))) >> (j & 7))
                                {
                                  v67 = *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * j) + v56;
                                  *((_BYTE *)v24 + (v67 >> 3)) |= bitmask_1[v67 & 7];
                                  if (*(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * j) + v56 > v27)
                                    v27 = *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * j) + v56;
                                }
                              }
                            }
                          }
                          *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * i) = v56;
                          *((_BYTE *)v23 + ((unint64_t)i >> 3)) |= v86;
                          v33 = (void **)v84;
                          vqueue_insert(v84, i);
                          v34 = ptra;
                        }
                      }
                    }
                  }
                  v35 = 0;
                }
                while (!vqueue_is_empty((uint64_t)v33));
              }
LABEL_116:
              vqueue_destroy(v33);
              free(v34);
              if (v35)
              {
LABEL_144:
                v9 = 1;
                goto LABEL_123;
              }
            }
            else
            {
              v31 = (void **)vqueue_new(v30 + 1);
              v92 = 0;
              v93 = 0;
              *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * v26) = vcvtpd_u64_f64((double)v27 * 0.5) - 1;
              *((_BYTE *)v23 + v28) |= v29;
              vqueue_insert((uint64_t)v31, v26);
              if (vqueue_is_empty((uint64_t)v31))
              {
                v32 = 0;
                goto LABEL_119;
              }
              ptr = v31;
              do
              {
                v36 = vqueue_remove((uint64_t)v31);
                v93 = (unsigned __int8 *)graph_neighbors_it(*(_QWORD *)(v3 + 16), v36);
                v37 = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v93);
                if (v37 != -1)
                {
                  for (k = v37; k != -1; k = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v93))
                  {
                    if (graph_node_is_critical(*(_QWORD *)(v3 + 16), k))
                    {
                      v39 = (unint64_t)k >> 3;
                      v40 = k & 7;
                      if (!((bitmask_1[v40] & *((_BYTE *)v23 + v39)) >> v40))
                      {
                        v89 = bitmask_1[v40];
                        v41 = v91 + 1;
                        v92 = graph_neighbors_it(*(_QWORD *)(v3 + 16), k);
                        v42 = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92);
                        if (v42 != -1)
                        {
                          for (m = v42; m != -1; m = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92))
                          {
                            if (graph_node_is_critical(*(_QWORD *)(v3 + 16), m)
                              && (bitmask_1[m & 7] & *((_BYTE *)v23 + ((unint64_t)m >> 3))) >> (m & 7))
                            {
                              v44 = *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * m) + v41;
                              if (v44 >= *(_DWORD *)(v3 + 8))
                              {
                                v32 = 1;
                                v31 = ptr;
                                goto LABEL_119;
                              }
                              if ((bitmask_1[v44 & 7] & *((_BYTE *)v24 + (v44 >> 3))) >> (v44 & 7))
                              {
                                v45 = v91;
                                if (v41 > v91)
                                  v45 = v41;
                                v91 = v45;
                                v41 = v45 + 1;
                                v92 = graph_neighbors_it(*(_QWORD *)(v3 + 16), k);
                              }
                            }
                          }
                        }
                        v46 = v91;
                        if (v41 > v91)
                          v46 = v41;
                        v91 = v46;
                        v92 = graph_neighbors_it(*(_QWORD *)(v3 + 16), k);
                        v47 = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92);
                        if (v47 != -1)
                        {
                          for (n = v47; n != -1; n = graph_next_neighbor(*(_QWORD *)(v3 + 16), &v92))
                          {
                            if (graph_node_is_critical(*(_QWORD *)(v3 + 16), n))
                            {
                              if ((bitmask_1[n & 7] & *((_BYTE *)v23 + ((unint64_t)n >> 3))) >> (n & 7))
                              {
                                v49 = *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * n) + v41;
                                *((_BYTE *)v24 + (v49 >> 3)) |= bitmask_1[v49 & 7];
                                if (*(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * n) + v41 > v27)
                                  v27 = *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * n) + v41;
                              }
                            }
                          }
                        }
                        *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * k) = v41;
                        *((_BYTE *)v23 + v39) |= v89;
                        v31 = ptr;
                        vqueue_insert((uint64_t)ptr, k);
                      }
                    }
                  }
                }
                v32 = 0;
              }
              while (!vqueue_is_empty((uint64_t)v31));
LABEL_119:
              vqueue_destroy(v31);
              if (v32)
                goto LABEL_144;
            }
            v9 = 0;
          }
        }
        ++v26;
      }
      while (v26 < *(unsigned int *)(v3 + 12));
    }
    if (v9)
    {
LABEL_123:
      v68 = v85 - 1;
      v2 = v82;
      v85 = (v85 - 1);
      if (*(_DWORD *)(v82 + 16))
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Restarting mapping step. %u iterations remaining.\n", v68);
      goto LABEL_141;
    }
    v2 = v82;
    if (*(_DWORD *)(v82 + 16))
      fwrite("\tTraversing non critical vertices.\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    LODWORD(v93) = 0;
    if (*(_DWORD *)(v3 + 8))
    {
      for (ii = 0; ii < *(_DWORD *)(v3 + 8); ++ii)
      {
        v70 = graph_vertex_id(*(_QWORD *)(v3 + 16), ii, 0);
        v71 = graph_vertex_id(*(_QWORD *)(v3 + 16), ii, 1);
        v72 = (bitmask_1[v71 & 7] & *((_BYTE *)v23 + ((unint64_t)v71 >> 3))) >> (v71 & 7);
        if ((bitmask_1[v70 & 7] & *((_BYTE *)v23 + ((unint64_t)v70 >> 3))) >> (v70 & 7))
        {
          if (!v72)
          {
            v73 = v70;
LABEL_133:
            bmz_traverse(v3, (uint64_t)v24, v73, (unsigned int *)&v93, (uint64_t)v23);
          }
        }
        else
        {
          v73 = v71;
          if (v72)
            goto LABEL_133;
        }
      }
    }
    v74 = *(unsigned int *)(v3 + 12);
    if ((_DWORD)v74)
    {
      for (jj = 0; jj < v74; ++jj)
      {
        v76 = jj >> 3;
        v77 = bitmask_1[jj & 7];
        if (!((v77 & *((_BYTE *)v23 + v76)) >> (jj & 7)))
        {
          *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * jj) = 0;
          *((_BYTE *)v23 + v76) |= v77;
          bmz_traverse(v3, (uint64_t)v24, jj, (unsigned int *)&v93, (uint64_t)v23);
          v74 = *(unsigned int *)(v3 + 12);
        }
      }
    }
    v9 = 0;
LABEL_141:
    free(v24);
    free(v23);
    v10 = v85;
  }
  while (v9 && (_DWORD)v85);
  graph_destroy(*(void ***)(v3 + 16));
  *(_QWORD *)(v3 + 16) = 0;
  if (!(_DWORD)v85)
    return 0;
  v78 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v78 = *(_DWORD *)v2;
  v80 = (char *)malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  v81 = *(_OWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;
  *(_OWORD *)(v80 + 8) = v81;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)&v81 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v80 = v81;
  v78[2] = v80;
  *((_DWORD *)v78 + 1) = v81;
  if (*(_DWORD *)(v2 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  return v78;
}

uint64_t bmz_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  int v5;
  unsigned int __ptr;
  void *v7;

  v7 = 0;
  v5 = 2;
  __ptr = 0;
  v3 = *(_QWORD *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(&v5, 4uLL, 1uLL, a2);
  hash_state_dump(**(_DWORD ***)(v3 + 16), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  hash_state_dump(*(_DWORD **)(*(_QWORD *)(v3 + 16) + 8), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 8), 4 * *(unsigned int *)(v3 + 4), 1uLL, a2);
  return 1;
}

size_t bmz_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  unsigned int size;
  unsigned int size_4;

  size_4 = 0;
  v4 = malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(&size_4, 4uLL, 1uLL, a1);
  v5 = size_4;
  v6 = malloc_type_malloc(8 * (size_4 + 1), 0x2004093837F09uLL);
  v4[2] = v6;
  v6[v5] = 0;
  if ((_DWORD)v5)
  {
    v7 = 0;
    size = 0;
    v8 = 8 * v5;
    do
    {
      fread(&size, 4uLL, 1uLL, a1);
      v9 = size;
      v10 = malloc_type_malloc(size, 0x26E2CE4BuLL);
      fread(v10, v9, 1uLL, a1);
      *(_QWORD *)(v4[2] + v7) = hash_state_load((const char *)v10);
      free(v10);
      v7 += 8;
    }
    while (v8 != v7);
  }
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  v11 = malloc_type_malloc(4 * *((unsigned int *)v4 + 1), 0x100004052888210uLL);
  v4[1] = v11;
  return fread(v11, 4 * *((unsigned int *)v4 + 1), 1uLL, a1);
}

uint64_t bmz_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = hash(**(_DWORD ***)(v5 + 16), a2, a3) % *(_DWORD *)(v5 + 4);
  v7 = hash(*(_DWORD **)(*(_QWORD *)(v5 + 16) + 8), a2, a3) % *(_DWORD *)(v5 + 4);
  if (v6 == v7)
    ++v7;
  return (*(_DWORD *)(*(_QWORD *)(v5 + 8) + 4 * v7) + *(_DWORD *)(*(_QWORD *)(v5 + 8) + 4 * v6));
}

void bmz_destroy(_QWORD *a1)
{
  void **v2;

  v2 = (void **)a1[2];
  free(v2[1]);
  hash_state_destroy(*(_DWORD **)v2[2]);
  hash_state_destroy(*((_DWORD **)v2[2] + 1));
  free(v2[2]);
  free(v2);
  free(a1);
}

void *bmz_pack(uint64_t a1, int *a2)
{
  uint64_t v3;
  int type;
  int *v5;
  int v6;
  _DWORD *v7;

  v3 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(**(unsigned int ***)(v3 + 16));
  *a2++ = type;
  hash_state_pack(**(_DWORD ***)(v3 + 16), a2);
  v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  v6 = hash_get_type(*(unsigned int **)(*(_QWORD *)(v3 + 16) + 8));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(*(_QWORD *)(v3 + 16) + 8), v5);
  v7 = (int *)((char *)v5 + hash_state_packed_size(v6));
  *v7 = *(_DWORD *)(v3 + 4);
  return memcpy(v7 + 1, *(const void **)(v3 + 8), 4 * *(unsigned int *)(v3 + 4));
}

uint64_t bmz_packed_size(uint64_t a1)
{
  uint64_t v1;
  int type;
  int v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(**(unsigned int ***)(v1 + 16));
  v3 = hash_get_type(*(unsigned int **)(*(_QWORD *)(v1 + 16) + 8));
  v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + 4 * *(_DWORD *)(v1 + 4) + 16;
}

uint64_t bmz_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  int v8;
  int v9;
  unsigned int *v10;
  _DWORD *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  v5 = (unsigned int *)(a1 + 1);
  v6 = *a1;
  v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  v9 = *v7++;
  v8 = v9;
  v10 = (unsigned int *)((char *)v7 + hash_state_packed_size(v9));
  v12 = *v10;
  v11 = v10 + 1;
  v13 = hash_packed(v5, v6, a2, a3) % v12;
  v14 = hash_packed(v7, v8, a2, a3) % v12;
  if (v13 == v14)
    ++v14;
  return (v11[v14] + v11[v13]);
}

uint64_t bmz_traverse(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4, uint64_t a5)
{
  uint64_t result;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;

  v17 = graph_neighbors_it(*(_QWORD *)(a1 + 16), a3);
  result = graph_next_neighbor(*(_QWORD *)(a1 + 16), &v17);
  if ((_DWORD)result != -1)
  {
    v11 = result;
    do
    {
      v12 = (unint64_t)v11 >> 3;
      v13 = v11 & 7;
      v14 = bitmask_1[v13];
      if (!((v14 & *(_BYTE *)(a5 + v12)) >> v13))
      {
        v15 = *a4;
        v16 = *(_DWORD *)(a1 + 8);
        if (v16 <= *a4)
LABEL_11:
          bmz_traverse_cold_1();
        while ((bitmask_1[v15 & 7] & *(_BYTE *)(a2 + ((unint64_t)v15 >> 3))) >> (v15 & 7))
        {
          if (v16 == ++v15)
            goto LABEL_11;
        }
        *a4 = v15;
        *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * v11) = v15 - *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * a3);
        *(_BYTE *)(a5 + v12) |= v14;
        ++*a4;
        bmz_traverse(a1, a2);
      }
      result = graph_next_neighbor(*(_QWORD *)(a1 + 16), &v17);
      v11 = result;
    }
    while ((_DWORD)result != -1);
  }
  return result;
}

double bmz8_config_new()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x28uLL, 0x10B0040F28A43C1uLL);
  if (v0)
  {
    v0[4] = 0;
    result = 0.0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void bmz8_config_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t bmz8_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  _DWORD *v2;
  int v3;

  if (*a2 != 1)
  {
    v2 = *(_DWORD **)(result + 32);
    *v2 = *a2;
    v3 = a2[1];
    if (v3 != 1)
      v2[1] = v3;
  }
  return result;
}

_QWORD *bmz8_new(uint64_t a1, double a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  double v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  FILE **v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned __int8 v21;
  unsigned int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unsigned int v28;
  unsigned __int8 v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  int v33;
  void **v34;
  void **v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int j;
  unint64_t v43;
  uint64_t v44;
  char v45;
  unsigned __int8 v46;
  unsigned int v47;
  unsigned int v48;
  unint64_t v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  int v52;
  unsigned int v53;
  unsigned int k;
  unint64_t v55;
  uint64_t v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unsigned __int8 v63;
  unsigned int v64;
  unsigned int v65;
  unint64_t v66;
  unsigned __int8 v67;
  unsigned __int8 v68;
  unsigned int v69;
  unsigned int i;
  unint64_t v71;
  unsigned int m;
  unsigned __int8 v73;
  unsigned __int8 v74;
  unsigned int v75;
  int v76;
  unsigned __int8 v77;
  unint64_t n;
  uint64_t v79;
  char v80;
  _QWORD *v81;
  char *v83;
  __int128 v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  void *ptr;
  unsigned __int8 v91;
  unsigned __int8 v92;
  uint64_t v93;
  unsigned __int8 v94;
  unint64_t v95;
  unsigned __int8 *v96;

  v2 = a1;
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8);
  if (v3 >= 0x100)
  {
    if (*(_DWORD *)(a1 + 16))
      fwrite("The number of keys in BMZ8 must be lower than 256.\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    return 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (a2 == 0.0)
    v5 = 1.15;
  else
    v5 = a2;
  *(_BYTE *)(v4 + 8) = v3;
  v6 = vcvtpd_s64_f64(v5 * (double)v3);
  *(_BYTE *)(v4 + 9) = v6;
  *(_QWORD *)(v4 + 16) = graph_new(v6, v3);
  v7 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
  v8 = 0;
  *(_QWORD *)(v4 + 32) = v7;
  do
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 32) + v8) = 0;
    v8 += 8;
  }
  while (v8 != 24);
  v9 = 0;
  v10 = 20;
  v11 = (FILE **)MEMORY[0x24BDAC8D8];
  v86 = v2;
  do
  {
    if (*(_DWORD *)(v2 + 16))
      fprintf(*v11, "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(unsigned __int8 *)(v4 + 8), *(unsigned __int8 *)(v4 + 9));
    v12 = 100;
LABEL_13:
    **(_QWORD **)(v4 + 32) = hash_state_new(*(_DWORD *)v4, *(unsigned __int8 *)(v4 + 9));
    *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) = hash_state_new(*(_DWORD *)(v4 + 4), *(unsigned __int8 *)(v4 + 9));
    v13 = *(_QWORD *)(v2 + 32);
    graph_clear_edges(*(unsigned int **)(v13 + 16));
    (*(void (**)(_QWORD))(*(_QWORD *)(v2 + 8) + 32))(**(_QWORD **)(v2 + 8));
    v14 = *(_QWORD *)(v2 + 8);
    if (!*(_DWORD *)(v14 + 8))
      goto LABEL_35;
    v15 = 0;
    v16 = 0;
    do
    {
      LODWORD(v95) = 0;
      v96 = 0;
      (*(void (**)(_QWORD, unsigned __int8 **, unint64_t *))(v14 + 16))(*(_QWORD *)v14, &v96, &v95);
      v17 = hash(**(_DWORD ***)(v13 + 32), v96, v95) % *(unsigned __int8 *)(v13 + 9);
      v18 = hash(*(_DWORD **)(*(_QWORD *)(v13 + 32) + 8), v96, v95);
      v19 = *(unsigned __int8 *)(v13 + 9);
      v20 = v18 % v19;
      if (v19 > (v18 % v19 + 1))
        v21 = v20 + 1;
      else
        v21 = 0;
      if (v17 != v20)
        v21 = v20;
      if (v17 == v21)
      {
        if (*(_DWORD *)(v2 + 16))
          fprintf(*v11, "Self loop for key %u\n", v15);
        (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(v2 + 8) + 24))(**(_QWORD **)(v2 + 8), v96, v95);
LABEL_30:
        --v12;
        hash_state_destroy(**(_DWORD ***)(v4 + 32));
        **(_QWORD **)(v4 + 32) = 0;
        hash_state_destroy(*(_DWORD **)(*(_QWORD *)(v4 + 32) + 8));
        *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) = 0;
        if (*(_DWORD *)(v2 + 16))
          fprintf(*v11, "simple graph creation failure - %u iterations remaining\n", v12);
        if (!v12)
          goto LABEL_150;
        goto LABEL_13;
      }
      v22 = v21;
      (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(v2 + 8) + 24))(**(_QWORD **)(v2 + 8), v96, v95);
      v23 = graph_contains_edge(*(_QWORD *)(v13 + 16), v17, v22);
      if (*(_DWORD *)(v2 + 16) && v23)
      {
        fwrite("A non simple graph was generated\n", 0x21uLL, 1uLL, *v11);
        goto LABEL_30;
      }
      if (v23)
        goto LABEL_30;
      graph_add_edge(*(_QWORD *)(v13 + 16), v17, v22);
      v15 = ++v16;
      v14 = *(_QWORD *)(v2 + 8);
    }
    while (*(_DWORD *)(v14 + 8) > v16);
    if (!(_BYTE)v12)
    {
LABEL_150:
      graph_destroy(*(void ***)(v4 + 16));
      return 0;
    }
LABEL_35:
    if (*(_DWORD *)(v2 + 16))
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, *v11);
    graph_obtain_critical_nodes(*(void ***)(v4 + 16));
    if (*(_DWORD *)(v2 + 16))
    {
      fwrite("Starting Searching step.\n", 0x19uLL, 1uLL, *v11);
      fwrite("\tTraversing critical vertices.\n", 0x1FuLL, 1uLL, *v11);
    }
    v24 = malloc_type_malloc(((unint64_t)*(unsigned __int8 *)(v4 + 9) >> 3) + 1, 0x5DAEEA1CuLL);
    bzero(v24, ((unint64_t)*(unsigned __int8 *)(v4 + 9) >> 3) + 1);
    v25 = malloc_type_malloc(((unint64_t)*(unsigned __int8 *)(v4 + 8) >> 3) + 1, 0xBC889664uLL);
    bzero(v25, ((unint64_t)*(unsigned __int8 *)(v4 + 8) >> 3) + 1);
    free(*(void **)(v4 + 24));
    v26 = malloc_type_calloc(*(unsigned __int8 *)(v4 + 9), 1uLL, 0x100004077774924uLL);
    *(_QWORD *)(v4 + 24) = v26;
    if (!v26)
      bmz8_new_cold_1();
    v87 = v10;
    if (*(_BYTE *)(v4 + 9))
    {
      v27 = 0;
      v28 = 0;
      v94 = 0;
      v29 = 1;
      do
      {
        if (graph_node_is_critical(*(_QWORD *)(v4 + 16), v28))
        {
          v30 = (unint64_t)v28 >> 3;
          v31 = v28 & 7;
          v32 = bitmask_2[v31];
          if (!((v32 & *((_BYTE *)v24 + v30)) >> v31))
          {
            v33 = graph_ncritical_nodes(*(_QWORD *)(v4 + 16));
            v34 = (void **)vqueue_new(v33);
            v35 = v34;
            v36 = (int)(ceil((double)v29 * 0.5) + -1.0);
            v93 = (uint64_t)v34;
            if (v5 <= 1.14)
            {
              v95 = 0;
              v96 = 0;
              *(_BYTE *)(*(_QWORD *)(v4 + 24) + v27) = v36;
              *((_BYTE *)v24 + v30) |= v32;
              vqueue_insert((uint64_t)v34, v28);
              if (vqueue_is_empty((uint64_t)v35))
              {
                v38 = 0;
                v39 = 0;
              }
              else
              {
                v56 = 0;
                v38 = 0;
                do
                {
                  v57 = vqueue_remove((uint64_t)v35);
                  v96 = (unsigned __int8 *)graph_neighbors_it(*(_QWORD *)(v4 + 16), v57);
                  v58 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v96);
                  if (v58 == -1)
                  {
                    v60 = v56;
                  }
                  else
                  {
                    v59 = v58;
                    v60 = v56;
                    do
                    {
                      if (graph_node_is_critical(*(_QWORD *)(v4 + 16), v59))
                      {
                        v61 = (unint64_t)v59 >> 3;
                        v62 = v59 & 7;
                        if ((bitmask_2[v62] & *((_BYTE *)v24 + v61)) >> v62)
                        {
                          v35 = (void **)v93;
                        }
                        else
                        {
                          v88 = bitmask_2[v62];
                          v63 = 0;
                          while (1)
                          {
                            v89 = v60;
                            ptr = v38;
                            if (v63 >= v60)
                            {
                              v92 = v94 + 1;
                              v63 = -1;
                            }
                            else
                            {
                              v92 = *((_BYTE *)v38 + v63++);
                            }
                            v95 = graph_neighbors_it(*(_QWORD *)(v4 + 16), v59);
                            v64 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95);
                            if (v64 == -1)
                              break;
                            v65 = v64;
                            while (1)
                            {
                              if (graph_node_is_critical(*(_QWORD *)(v4 + 16), v65)
                                && (bitmask_2[v65 & 7] & *((_BYTE *)v24 + ((unint64_t)v65 >> 3))) >> (v65 & 7))
                              {
                                v66 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 24) + v65) + v92;
                                if (v66 >= *(unsigned __int8 *)(v4 + 8))
                                {
                                  v39 = 1;
                                  v35 = (void **)v93;
                                  v38 = ptr;
                                  goto LABEL_120;
                                }
                                if ((bitmask_2[v66 & 7] & *((_BYTE *)v25 + (v66 >> 3))) >> (v66 & 7))
                                  break;
                              }
                              v65 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95);
                              if (v65 == -1)
                                goto LABEL_102;
                            }
                            v38 = ptr;
                            if (v92 > v94)
                            {
                              if (!(_BYTE)v60)
                                v38 = malloc_type_realloc(ptr, 0x400uLL, 0x100004077774924uLL);
                              *((_BYTE *)v38 + v60) = v92;
                              v89 = (v60 + 1);
                            }
                            v67 = v94;
                            if (v92 > v94)
                              v67 = v92;
                            v94 = v67;
                            v60 = v89;
                          }
LABEL_102:
                          v68 = v94;
                          if (v92 > v94)
                            v68 = v92;
                          v94 = v68;
                          if ((v63 - 1) < v60)
                          {
                            *((_BYTE *)ptr + (v63 - 1)) = *((_BYTE *)ptr + (v60 - 1));
                            v60 = (v60 - 1);
                          }
                          v95 = graph_neighbors_it(*(_QWORD *)(v4 + 16), v59);
                          v69 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95);
                          if (v69 != -1)
                          {
                            for (i = v69; i != -1; i = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95))
                            {
                              if (graph_node_is_critical(*(_QWORD *)(v4 + 16), i))
                              {
                                if ((bitmask_2[i & 7] & *((_BYTE *)v24 + ((unint64_t)i >> 3))) >> (i & 7))
                                {
                                  v71 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 24) + i) + v92;
                                  *((_BYTE *)v25 + (v71 >> 3)) |= bitmask_2[v71 & 7];
                                  if (*(unsigned __int8 *)(*(_QWORD *)(v4 + 24) + i) + v92 > v29)
                                    v29 = *(_BYTE *)(*(_QWORD *)(v4 + 24) + i) + v92;
                                }
                              }
                            }
                          }
                          *(_BYTE *)(*(_QWORD *)(v4 + 24) + v59) = v92;
                          *((_BYTE *)v24 + v61) |= v88;
                          v35 = (void **)v93;
                          vqueue_insert(v93, v59);
                          v38 = ptr;
                        }
                      }
                      v59 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v96);
                    }
                    while (v59 != -1);
                  }
                  v56 = v60;
                  v39 = 0;
                }
                while (!vqueue_is_empty((uint64_t)v35));
              }
LABEL_120:
              vqueue_destroy(v35);
              free(v38);
              if (v39)
              {
LABEL_149:
                v9 = 1;
                goto LABEL_127;
              }
            }
            else
            {
              v95 = 0;
              v96 = 0;
              *(_BYTE *)(*(_QWORD *)(v4 + 24) + v27) = v36;
              *((_BYTE *)v24 + v30) |= v32;
              vqueue_insert((uint64_t)v34, v28);
              if (vqueue_is_empty((uint64_t)v35))
              {
                v37 = 0;
                goto LABEL_123;
              }
              do
              {
                v40 = vqueue_remove((uint64_t)v35);
                v96 = (unsigned __int8 *)graph_neighbors_it(*(_QWORD *)(v4 + 16), v40);
                v41 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v96);
                if (v41 != -1)
                {
                  for (j = v41; j != -1; j = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v96))
                  {
                    if (graph_node_is_critical(*(_QWORD *)(v4 + 16), j))
                    {
                      v43 = (unint64_t)j >> 3;
                      v44 = j & 7;
                      v45 = bitmask_2[v44];
                      if (!((v45 & *((_BYTE *)v24 + v43)) >> v44))
                      {
                        v46 = v94 + 1;
                        v95 = graph_neighbors_it(*(_QWORD *)(v4 + 16), j);
                        v47 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95);
                        if (v47 != -1)
                        {
                          v48 = v47;
                          while (1)
                          {
                            if (!graph_node_is_critical(*(_QWORD *)(v4 + 16), v48)
                              || !((bitmask_2[v48 & 7] & *((_BYTE *)v24 + ((unint64_t)v48 >> 3))) >> (v48 & 7)))
                            {
                              goto LABEL_59;
                            }
                            v49 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 24) + v48) + v46;
                            if (v49 >= *(unsigned __int8 *)(v4 + 8))
                            {
                              v37 = 1;
                              v35 = (void **)v93;
                              goto LABEL_123;
                            }
                            if ((bitmask_2[v49 & 7] & *((_BYTE *)v25 + (v49 >> 3))) >> (v49 & 7))
                            {
                              v50 = v94;
                              if (v46 > v94)
                                v50 = v46;
                              v94 = v50;
                              v46 = v50 + 1;
                              v95 = graph_neighbors_it(*(_QWORD *)(v4 + 16), j);
                              v48 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95);
                              if (v48 == -1)
                                break;
                            }
                            else
                            {
LABEL_59:
                              v48 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95);
                              if (v48 == -1)
                                break;
                            }
                          }
                        }
                        v51 = v94;
                        v91 = v46;
                        v52 = v46;
                        if (v46 > v94)
                          v51 = v46;
                        v94 = v51;
                        v95 = graph_neighbors_it(*(_QWORD *)(v4 + 16), j);
                        v53 = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95);
                        if (v53 != -1)
                        {
                          for (k = v53; k != -1; k = graph_next_neighbor(*(_QWORD *)(v4 + 16), &v95))
                          {
                            if (graph_node_is_critical(*(_QWORD *)(v4 + 16), k))
                            {
                              if ((bitmask_2[k & 7] & *((_BYTE *)v24 + ((unint64_t)k >> 3))) >> (k & 7))
                              {
                                v55 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 24) + k) + v52;
                                *((_BYTE *)v25 + (v55 >> 3)) |= bitmask_2[v55 & 7];
                                if (*(unsigned __int8 *)(*(_QWORD *)(v4 + 24) + k) + v52 > v29)
                                  v29 = *(_BYTE *)(*(_QWORD *)(v4 + 24) + k) + v52;
                              }
                            }
                          }
                        }
                        *(_BYTE *)(*(_QWORD *)(v4 + 24) + j) = v91;
                        *((_BYTE *)v24 + v43) |= v45;
                        v35 = (void **)v93;
                        vqueue_insert(v93, j);
                      }
                    }
                  }
                }
                v37 = 0;
              }
              while (!vqueue_is_empty((uint64_t)v35));
LABEL_123:
              vqueue_destroy(v35);
              if (v37)
                goto LABEL_149;
            }
            v9 = 0;
          }
        }
        v28 = ++v27;
      }
      while (v27 < *(unsigned __int8 *)(v4 + 9));
    }
    if (v9)
    {
LABEL_127:
      v2 = v86;
      v10 = (v87 - 1);
      v11 = (FILE **)MEMORY[0x24BDAC8D8];
      if (*(_DWORD *)(v86 + 16))
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Restarting mapping step. %u iterations remaining.\n", (v87 - 1));
      goto LABEL_146;
    }
    v2 = v86;
    v10 = v87;
    v11 = (FILE **)MEMORY[0x24BDAC8D8];
    if (*(_DWORD *)(v86 + 16))
      fwrite("\tTraversing non critical vertices.\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    LOBYTE(v96) = 0;
    if (*(_BYTE *)(v4 + 8))
    {
      for (m = 0; m < *(unsigned __int8 *)(v4 + 8); ++m)
      {
        v73 = graph_vertex_id(*(_QWORD *)(v4 + 16), m, 0);
        v74 = graph_vertex_id(*(_QWORD *)(v4 + 16), m, 1);
        v75 = v73;
        v76 = (bitmask_2[v74 & 7] & *((_BYTE *)v24 + (v74 >> 3))) >> (v74 & 7);
        if ((bitmask_2[v73 & 7] & *((_BYTE *)v24 + ((unint64_t)v73 >> 3))) >> (v73 & 7))
        {
          if (!v76)
            goto LABEL_138;
        }
        else if (v76)
        {
          v75 = v74;
LABEL_138:
          bmz8_traverse(v4, (uint64_t)v25, v75, &v96, (uint64_t)v24);
        }
      }
    }
    v77 = *(_BYTE *)(v4 + 9);
    if (v77)
    {
      for (n = 0; n < v77; ++n)
      {
        v79 = n >> 3;
        v80 = bitmask_2[n & 7];
        if (!((v80 & *((_BYTE *)v24 + v79)) >> (n & 7)))
        {
          *(_BYTE *)(*(_QWORD *)(v4 + 24) + n) = 0;
          *((_BYTE *)v24 + v79) |= v80;
          bmz8_traverse(v4, (uint64_t)v25, n, &v96, (uint64_t)v24);
          v77 = *(_BYTE *)(v4 + 9);
        }
      }
    }
    v9 = 0;
LABEL_146:
    free(v25);
    free(v24);
  }
  while (v9 && (_BYTE)v10);
  graph_destroy(*(void ***)(v4 + 16));
  *(_QWORD *)(v4 + 16) = 0;
  if (!(_BYTE)v10)
    return 0;
  v81 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v81 = *(_DWORD *)v2;
  v83 = (char *)malloc_type_malloc(0x18uLL, 0x109004087376023uLL);
  v84 = *(_OWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;
  *(_OWORD *)(v83 + 8) = v84;
  *(_QWORD *)(v4 + 32) = 0;
  v83[1] = *(_BYTE *)(v4 + 9);
  v85 = *(unsigned __int8 *)(v4 + 8);
  *v83 = v85;
  v81[2] = v83;
  *((_DWORD *)v81 + 1) = v85;
  if (*(_DWORD *)(v2 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v11);
  return v81;
}

uint64_t bmz8_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  char __ptr;
  _DWORD __size[3];

  memset(__size, 0, sizeof(__size));
  __ptr = 2;
  v3 = *(_QWORD *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(&__ptr, 1uLL, 1uLL, a2);
  hash_state_dump(**(_DWORD ***)(v3 + 16), &__size[1], __size);
  fwrite(__size, 4uLL, 1uLL, a2);
  fwrite(*(const void **)&__size[1], __size[0], 1uLL, a2);
  free(*(void **)&__size[1]);
  hash_state_dump(*(_DWORD **)(*(_QWORD *)(v3 + 16) + 8), &__size[1], __size);
  fwrite(__size, 4uLL, 1uLL, a2);
  fwrite(*(const void **)&__size[1], __size[0], 1uLL, a2);
  free(*(void **)&__size[1]);
  fwrite((const void *)(v3 + 1), 1uLL, 1uLL, a2);
  fwrite((const void *)v3, 1uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 8), *(unsigned __int8 *)(v3 + 1), 1uLL, a2);
  return 1;
}

size_t bmz8_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  unsigned int size;
  unsigned __int8 size_7;

  size_7 = 0;
  v4 = malloc_type_malloc(0x18uLL, 0x109004087376023uLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(&size_7, 1uLL, 1uLL, a1);
  v5 = size_7;
  v6 = 8 * size_7;
  v7 = malloc_type_malloc(v6 + 8, 0x2004093837F09uLL);
  v4[2] = v7;
  v7[v5] = 0;
  if (v5)
  {
    v8 = 0;
    size = 0;
    do
    {
      fread(&size, 4uLL, 1uLL, a1);
      v9 = size;
      v10 = malloc_type_malloc(size, 0x55842EDEuLL);
      fread(v10, v9, 1uLL, a1);
      *(_QWORD *)(v4[2] + v8) = hash_state_load((const char *)v10);
      free(v10);
      v8 += 8;
    }
    while (v6 != v8);
  }
  fread((char *)v4 + 1, 1uLL, 1uLL, a1);
  fread(v4, 1uLL, 1uLL, a1);
  v11 = malloc_type_malloc(*((unsigned __int8 *)v4 + 1), 0x100004077774924uLL);
  v4[1] = v11;
  return fread(v11, *((unsigned __int8 *)v4 + 1), 1uLL, a1);
}

uint64_t bmz8_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned __int8 v10;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = hash(**(_DWORD ***)(v5 + 16), a2, a3) % *(unsigned __int8 *)(v5 + 1);
  v7 = hash(*(_DWORD **)(*(_QWORD *)(v5 + 16) + 8), a2, a3);
  v8 = *(unsigned __int8 *)(v5 + 1);
  v9 = v7 % v8;
  if (v8 > v7 % v8)
    v10 = v9 + 1;
  else
    v10 = 0;
  if (v6 != v9)
    v10 = v9;
  return (*(_BYTE *)(*(_QWORD *)(v5 + 8) + v10) + *(_BYTE *)(*(_QWORD *)(v5 + 8) + v6));
}

void bmz8_destroy(_QWORD *a1)
{
  void **v2;

  v2 = (void **)a1[2];
  free(v2[1]);
  hash_state_destroy(*(_DWORD **)v2[2]);
  hash_state_destroy(*((_DWORD **)v2[2] + 1));
  free(v2[2]);
  free(v2);
  free(a1);
}

void *bmz8_pack(uint64_t a1, int *a2)
{
  uint64_t v3;
  int type;
  int *v5;
  int v6;
  _BYTE *v7;

  v3 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(**(unsigned int ***)(v3 + 16));
  *a2++ = type;
  hash_state_pack(**(_DWORD ***)(v3 + 16), a2);
  v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  v6 = hash_get_type(*(unsigned int **)(*(_QWORD *)(v3 + 16) + 8));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(*(_QWORD *)(v3 + 16) + 8), v5);
  v7 = (char *)v5 + hash_state_packed_size(v6);
  *v7 = *(_BYTE *)(v3 + 1);
  return memcpy(v7 + 1, *(const void **)(v3 + 8), *(unsigned __int8 *)(v3 + 1));
}

uint64_t bmz8_packed_size(uint64_t a1)
{
  uint64_t v1;
  int type;
  int v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(**(unsigned int ***)(v1 + 16));
  v3 = hash_get_type(*(unsigned int **)(*(_QWORD *)(v1 + 16) + 8));
  v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + *(unsigned __int8 *)(v1 + 1) + 13;
}

uint64_t bmz8_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  int v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  char v16;

  v5 = (unsigned int *)(a1 + 1);
  v6 = *a1;
  v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  v9 = *v7++;
  v8 = v9;
  v10 = (unsigned __int8 *)v7 + hash_state_packed_size(v9);
  v12 = *v10;
  v11 = v10 + 1;
  v13 = hash_packed(v5, v6, a2, a3) % v12;
  v14 = hash_packed(v7, v8, a2, a3);
  v15 = v14 % v12;
  if (v12 > v14 % v12)
    v16 = v15 + 1;
  else
    v16 = 0;
  if (v13 == v15)
    LOBYTE(v15) = v16;
  return (v11[v15] + v11[v13]);
}

uint64_t bmz8_traverse(uint64_t a1, uint64_t a2, unsigned int a3, _BYTE *a4, uint64_t a5)
{
  uint64_t result;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;

  v17 = graph_neighbors_it(*(_QWORD *)(a1 + 16), a3);
  result = graph_next_neighbor(*(_QWORD *)(a1 + 16), &v17);
  if ((_DWORD)result != -1)
  {
    v11 = result;
    do
    {
      v12 = (unint64_t)v11 >> 3;
      v13 = v11 & 7;
      v14 = bitmask_2[v13];
      if (!((v14 & *(_BYTE *)(a5 + v12)) >> v13))
      {
        v15 = *a4;
        v16 = *(unsigned __int8 *)(a1 + 8);
        if (v16 <= v15)
LABEL_11:
          bmz8_traverse_cold_1();
        while ((bitmask_2[v15 & 7] & *(_BYTE *)(a2 + ((unint64_t)v15 >> 3))) >> (v15 & 7))
        {
          if (v16 == ++v15)
            goto LABEL_11;
        }
        *a4 = v15;
        *(_BYTE *)(*(_QWORD *)(a1 + 24) + v11) = v15 - *(_BYTE *)(*(_QWORD *)(a1 + 24) + a3);
        *(_BYTE *)(a5 + v12) |= v14;
        ++*a4;
        bmz8_traverse(a1, a2);
      }
      result = graph_next_neighbor(*(_QWORD *)(a1 + 16), &v17);
      v11 = result;
    }
    while ((_DWORD)result != -1);
  }
  return result;
}

_BYTE *brz_config_new()
{
  _BYTE *v0;
  _BYTE *v1;
  char *v2;

  v0 = malloc_type_malloc(0x70uLL, 0x10B004044A9B6D4uLL);
  v1 = v0;
  if (v0)
  {
    v0[56] = 0x80;
    *(_OWORD *)v0 = xmmword_2084C4370;
    *((_QWORD *)v0 + 5) = 0;
    *((_QWORD *)v0 + 6) = 0;
    *((_QWORD *)v0 + 4) = 0;
    *((_QWORD *)v0 + 9) = 0;
    *((_QWORD *)v0 + 10) = 0;
    *((_QWORD *)v0 + 8) = 0;
    *((_DWORD *)v0 + 22) = 0x100000;
    v2 = (char *)malloc_type_calloc(0xAuLL, 1uLL, 0x100004077774924uLL);
    *((_QWORD *)v1 + 12) = v2;
    *((_QWORD *)v1 + 13) = 0;
    strcpy(v2, "/var/tmp/");
  }
  return v1;
}

void brz_config_destroy(uint64_t a1)
{
  void **v1;

  v1 = *(void ***)(a1 + 32);
  free(v1[12]);
  free(v1);
}

uint64_t brz_config_set_hashfuncs(uint64_t result, int *a2)
{
  int v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *a2;
  if (*a2 != 1)
  {
    v3 = 0;
    v4 = *(_QWORD *)(result + 32);
    do
    {
      *(_DWORD *)(v4 + 4 * v3) = v2;
      v2 = a2[v3 + 1];
    }
    while (v2 != 1 && v3++ < 2);
  }
  return result;
}

uint64_t brz_config_set_memory_availability(uint64_t result, int a2)
{
  if (a2)
    *(_DWORD *)(*(_QWORD *)(result + 32) + 88) = a2 << 20;
  return result;
}

char *brz_config_set_tmp_dir(char *result, char *__s)
{
  uint64_t v3;
  size_t v4;
  char *v5;
  char *v6;

  if (__s)
  {
    v3 = *((_QWORD *)result + 4);
    v4 = strlen(__s);
    free(*(void **)(v3 + 96));
    if (__s[v4 - 1] == 47)
    {
      v5 = (char *)malloc_type_calloc(v4 + 1, 1uLL, 0x100004077774924uLL);
      *(_QWORD *)(v3 + 96) = v5;
      return strcpy(v5, __s);
    }
    else
    {
      v6 = (char *)malloc_type_calloc(v4 + 2, 1uLL, 0x100004077774924uLL);
      *(_QWORD *)(v3 + 96) = v6;
      return (char *)sprintf(v6, "%s/", __s);
    }
  }
  return result;
}

uint64_t brz_config_set_mphf_fd(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 104) = a2;
  if (!a2)
    brz_config_set_mphf_fd_cold_1();
  return result;
}

uint64_t brz_config_set_b(uint64_t result, int a2)
{
  char v2;

  if ((a2 - 175) >= 0xFFFFFF92)
    v2 = a2;
  else
    v2 = 0x80;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = v2;
  return result;
}

uint64_t brz_config_set_algo(uint64_t result, int a2)
{
  if (a2 == 4 || a2 == 1)
    *(_DWORD *)(*(_QWORD *)(result + 32) + 12) = a2;
  return result;
}

_QWORD *brz_new(size_t a1, double a2)
{
  size_t v2;
  uint64_t v3;
  int v4;
  BOOL v5;
  double v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  char *v10;
  unsigned int *v11;
  int *v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unint64_t v18;
  int v19;
  unint64_t i;
  int v21;
  uint64_t v22;
  int *v23;
  int v24;
  int v25;
  unsigned __int8 *v26;
  unsigned int v27;
  unsigned int v28;
  size_t v29;
  char *v30;
  FILE *v31;
  int *v32;
  int v33;
  int v34;
  char *v35;
  unsigned __int8 *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  double v40;
  int v41;
  unint64_t v42;
  int v43;
  unint64_t j;
  int v45;
  int *v46;
  int v47;
  int v48;
  unsigned __int8 *v49;
  unsigned int v50;
  unsigned int v51;
  size_t v52;
  char *v53;
  FILE *v54;
  int *v55;
  int v56;
  unsigned int v57;
  uint64_t v58;
  FILE **v59;
  size_t v60;
  _QWORD *v61;
  uint64_t k;
  size_t v63;
  char *v64;
  int v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t m;
  uint64_t v69;
  uint64_t v70;
  unsigned __int8 *v71;
  unsigned int v72;
  int v73;
  void **v74;
  _QWORD *v75;
  double v76;
  double v77;
  double v78;
  _QWORD *v79;
  unint64_t v80;
  int v81;
  _QWORD *v82;
  uint64_t v83;
  unsigned int v84;
  _DWORD *v85;
  _DWORD *v86;
  _DWORD *v87;
  uint64_t v88;
  uint64_t v89;
  _DWORD *v90;
  size_t v91;
  _DWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void **v96;
  void **v97;
  void **v98;
  int *v99;
  uint64_t v100;
  uint64_t v101;
  _DWORD *v102;
  int v103;
  int v104;
  unint64_t v105;
  _QWORD *v106;
  __int128 v107;
  __int128 v108;
  int v109;
  _QWORD *v110;
  uint64_t v112;
  int v113;
  uint64_t v114;
  _DWORD *v115;
  int *v116;
  size_t __size;
  size_t __sizea;
  _QWORD *v119;
  void **v120;
  _DWORD *v121;
  unsigned int *v122;
  size_t v123;
  unsigned int *__ptr;
  unsigned int v125;
  unsigned int v126;
  uint64_t v127;
  void **v128;
  unsigned int v129;
  unsigned __int8 *key;
  void *v131;
  void *v132;
  unsigned int v133[4];

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 12);
  if (v4 == 4)
  {
    v6 = 2.0;
    if (a2 <= 2.0)
      a2 = 2.6;
  }
  else
  {
    if (v4 != 1)
      brz_new_cold_1();
    v5 = a2 >= 2.0 || a2 == 0.0;
    v6 = 1.0;
    if (v5)
      a2 = 1.0;
  }
  *(double *)(v3 + 16) = a2;
  v7 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8);
  *(_DWORD *)(v3 + 24) = v7;
  LOBYTE(v6) = *(_BYTE *)(v3 + 56);
  LODWORD(a1) = vcvtpd_u64_f64((double)v7 / (double)*(unint64_t *)&v6);
  *(_DWORD *)(v3 + 60) = a1;
  *(_QWORD *)(v3 + 32) = malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (*(_DWORD *)(v2 + 16))
    fwrite("Partioning the set of keys.\n", 0x1CuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v8 = 20;
  v123 = v2;
  v112 = v3;
  while (1)
  {
    *(_QWORD *)(v3 + 80) = hash_state_new(*(_DWORD *)(v3 + 8), *(_DWORD *)(v3 + 60));
    v9 = *(_QWORD *)(v2 + 32);
    v10 = (char *)malloc_type_malloc(*(unsigned int *)(v9 + 88), 0xEA3D2230uLL);
    v11 = (unsigned int *)(v9 + 60);
    v12 = (int *)malloc_type_calloc(*(unsigned int *)(v9 + 60), 4uLL, 0x100004052888210uLL);
    key = 0;
    v129 = 0;
    (*(void (**)(_QWORD))(*(_QWORD *)(v2 + 8) + 32))(**(_QWORD **)(v2 + 8));
    __ptr = (unsigned int *)(v9 + 24);
    v122 = (unsigned int *)(v9 + 60);
    v113 = v8;
    if (!*(_DWORD *)(v9 + 24))
    {
      v57 = 0;
      goto LABEL_55;
    }
    v125 = 0;
    LODWORD(v13) = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      (*(void (**)(_QWORD, unsigned __int8 **, unsigned int *))(*(_QWORD *)(v2 + 8) + 16))(**(_QWORD **)(v2 + 8), &key, &v129);
      v16 = v129;
      if ((unint64_t)(v129 + v14) + 4 <= *(unsigned int *)(v9 + 88))
      {
        v34 = v13;
      }
      else
      {
        if (*(_DWORD *)(v2 + 16))
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Flushing  %u\n", v13);
        v17 = *v12;
        *v12 = 0;
        v18 = *v11;
        if (v18 >= 2)
        {
          v19 = 0;
          for (i = 1; i < v18; ++i)
          {
            v21 = v12[i];
            if (v21)
            {
              v19 += v17;
              v12[i] = v19;
              v18 = *v11;
              v17 = v21;
            }
          }
        }
        v22 = v13;
        v23 = (int *)malloc_type_calloc(v13, 4uLL, 0x100004052888210uLL);
        if ((_DWORD)v13)
        {
          v24 = 0;
          v25 = v13;
          do
          {
            v26 = (unsigned __int8 *)&v10[v24];
            v27 = *(_DWORD *)v26;
            v28 = hash(*(_DWORD **)(v9 + 80), v26 + 4, *(_DWORD *)v26) % *(_DWORD *)(v9 + 60);
            v23[v12[v28]++] = v24;
            v24 += v27 + 4;
            --v25;
          }
          while (v25);
        }
        v29 = strlen(*(const char **)(v9 + 96));
        v30 = (char *)malloc_type_calloc(v29 + 11, 1uLL, 0x100004077774924uLL);
        sprintf(v30, "%s%u.cmph", *(const char **)(v9 + 96), v125);
        v31 = fopen(v30, "wb");
        free(v30);
        if ((_DWORD)v13)
        {
          v32 = v23;
          do
          {
            v33 = *v32++;
            fwrite(&v10[v33], 1uLL, *(unsigned int *)&v10[v33] + 4, v31);
            --v22;
          }
          while (v22);
        }
        v11 = (unsigned int *)(v9 + 60);
        bzero(v12, 4 * *v122);
        ++v125;
        free(v23);
        fclose(v31);
        v14 = 0;
        v34 = 0;
        v16 = v129;
        v2 = v123;
      }
      v35 = &v10[v14];
      *(_DWORD *)v35 = v129;
      v36 = key;
      memcpy(v35 + 4, key, v16);
      v37 = hash(*(_DWORD **)(v9 + 80), v36, v16) % *(_DWORD *)(v9 + 60);
      v38 = *(_QWORD *)(v9 + 32);
      v39 = *(unsigned __int8 *)(v38 + v37);
      if (v39 == 255
        || *(_DWORD *)(v9 + 12) == 1 && (v40 = *(double *)(v9 + 16), v40 >= 1.0) && v39 > (int)(v40 * (double)v39))
      {
        LODWORD(v58) = 0;
        v3 = v112;
        v8 = v113;
        v59 = (FILE **)MEMORY[0x24BDAC8D8];
        goto LABEL_108;
      }
      *(_BYTE *)(v38 + v37) = v39 + 1;
      v14 += v16 + 4;
      ++v12[v37];
      v13 = (v34 + 1);
      (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(v2 + 8) + 24))(**(_QWORD **)(v2 + 8), key, v129);
      ++v15;
    }
    while (v15 < *__ptr);
    if (v14)
    {
      if (*(_DWORD *)(v2 + 16))
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Flushing  %u\n", v34 + 1);
      v41 = *v12;
      *v12 = 0;
      v42 = *v11;
      if (v42 >= 2)
      {
        v43 = 0;
        for (j = 1; j < v42; ++j)
        {
          v45 = v12[j];
          if (v45)
          {
            v43 += v41;
            v12[j] = v43;
            v42 = *v11;
            v41 = v45;
          }
        }
      }
      v46 = (int *)malloc_type_calloc((v34 + 1), 4uLL, 0x100004052888210uLL);
      if (v34 != -1)
      {
        v47 = 0;
        v48 = v34 + 1;
        do
        {
          v49 = (unsigned __int8 *)&v10[v47];
          v50 = *(_DWORD *)v49;
          v51 = hash(*(_DWORD **)(v9 + 80), v49 + 4, *(_DWORD *)v49) % *(_DWORD *)(v9 + 60);
          v46[v12[v51]++] = v47;
          v47 += v50 + 4;
          --v48;
        }
        while (v48);
      }
      v52 = strlen(*(const char **)(v9 + 96));
      v53 = (char *)malloc_type_calloc(v52 + 11, 1uLL, 0x100004077774924uLL);
      sprintf(v53, "%s%u.cmph", *(const char **)(v9 + 96), v125);
      v54 = fopen(v53, "wb");
      free(v53);
      if ((_DWORD)v13)
      {
        v55 = v46;
        do
        {
          v56 = *v55++;
          fwrite(&v10[v56], 1uLL, *(unsigned int *)&v10[v56] + 4, v54);
          --v13;
        }
        while (v13);
      }
      v11 = (unsigned int *)(v9 + 60);
      bzero(v12, 4 * *v122);
      v57 = v125 + 1;
      free(v46);
      fclose(v54);
      v8 = v113;
    }
    else
    {
      v8 = v113;
      v57 = v125;
    }
LABEL_55:
    free(v10);
    free(v12);
    v126 = v57;
    if (v57 >= 0x401)
    {
      v59 = (FILE **)MEMORY[0x24BDAC8D8];
      v3 = v112;
      goto LABEL_109;
    }
    v3 = v112;
    if (*(_DWORD *)(v2 + 16))
      fwrite("\nMPHF generation \n", 0x12uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    v60 = strlen(off_25453D108[0]);
    fwrite(off_25453D108[0], v60 + 1, 1uLL, *(FILE **)(v9 + 104));
    fwrite(__ptr, 4uLL, 1uLL, *(FILE **)(v9 + 104));
    fwrite((const void *)(v9 + 16), 8uLL, 1uLL, *(FILE **)(v9 + 104));
    v116 = (int *)(v9 + 12);
    fwrite((const void *)(v9 + 12), 4uLL, 1uLL, *(FILE **)(v9 + 104));
    fwrite(v11, 4uLL, 1uLL, *(FILE **)(v9 + 104));
    fwrite(*(const void **)(v9 + 32), *(unsigned int *)(v9 + 60), 1uLL, *(FILE **)(v9 + 104));
    v61 = buffer_manager_new(*(_DWORD *)(v9 + 88), v126);
    v10 = (char *)malloc_type_calloc(v126, 8uLL, 0x10040436913F5uLL);
    v12 = (int *)malloc_type_calloc(v126, 4uLL, 0x100004052888210uLL);
    if (v126)
    {
      for (k = 0; k != v126; ++k)
      {
        v63 = strlen(*(const char **)(v9 + 96));
        v64 = (char *)malloc_type_calloc(v63 + 11, 1uLL, 0x100004077774924uLL);
        sprintf(v64, "%s%u.cmph", *(const char **)(v9 + 96), k);
        buffer_manager_open((uint64_t)v61, k, v64);
        free(v64);
        key = (unsigned __int8 *)buffer_manager_read_key((uint64_t)v61, k, (char *)&v129);
        v12[k] = hash(*(_DWORD **)(v9 + 80), key + 4, v129) % *(_DWORD *)(v9 + 60);
        *(_QWORD *)&v10[8 * k] = key;
        key = 0;
      }
    }
    v128 = (void **)malloc_type_calloc(0xFFuLL, 8uLL, 0x10040436913F5uLL);
    if (*__ptr)
    {
      v65 = 0;
      v66 = 0;
      v127 = (uint64_t)v61;
      while (1)
      {
        if (v126 < 2)
        {
          v67 = 0;
        }
        else
        {
          v67 = 0;
          for (m = 1; m != v126; ++m)
          {
            if (v12[m] < v12[v67])
              v67 = m;
          }
        }
        v69 = v12[v67];
        v70 = v67;
        v71 = (unsigned __int8 *)buffer_manager_read_key(v127, v67, (char *)&v129);
        key = v71;
        if (!v71)
          break;
        while (1)
        {
          v72 = hash(*(_DWORD **)(v9 + 80), v71 + 4, v129) % *(_DWORD *)(v9 + 60);
          if (v72 != v12[v70])
            break;
          v73 = v65 + 1;
          v128[v65] = key;
          key = 0;
          ++v66;
          v71 = (unsigned __int8 *)buffer_manager_read_key(v127, v70, (char *)&v129);
          key = v71;
          ++v65;
          if (!v71)
            goto LABEL_80;
        }
        if (!key)
          break;
        if (*(unsigned __int8 *)(*(_QWORD *)(v9 + 32) + v69) <= v65)
          brz_new_cold_4();
        v73 = v65 + 1;
        v128[v65] = *(void **)&v10[8 * v70];
        *(_QWORD *)&v10[8 * v70] = 0;
        v12[v70] = v72;
        ++v66;
        *(_QWORD *)&v10[8 * v70] = key;
        ++v65;
        if (!key)
          goto LABEL_80;
LABEL_82:
        if (*(unsigned __int8 *)(*(_QWORD *)(v9 + 32) + v69) == v65)
        {
          v74 = (void **)cmph_io_byte_vector_adapter((uint64_t)v128, v65);
          v75 = cmph_config_new((uint64_t)v74);
          cmph_config_set_algo((uint64_t)v75, *v116);
          cmph_config_set_graphsize((uint64_t)v75, *(double *)(v9 + 16));
          v121 = v75;
          v79 = cmph_new((uint64_t)v75, v76, v77, v78);
          v2 = v123;
          v81 = *(_DWORD *)(v123 + 16);
          if (!v79)
          {
            v97 = v74;
            v59 = (FILE **)MEMORY[0x24BDAC8D8];
            if (v81)
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ERROR: Can't generate MPHF for bucket %u out of %u\n", v69 + 1, *v122);
            cmph_config_destroy(v121);
            v58 = v65;
            v98 = v128;
            v8 = v113;
            do
            {
              free(*v98);
              *v98++ = 0;
              --v58;
            }
            while (v58);
            cmph_io_byte_vector_adapter_destroy(v97);
            v3 = v112;
            v61 = (_QWORD *)v127;
            goto LABEL_107;
          }
          if (v81 && !(v69 % 0x3E8))
          {
            v82 = v79;
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "MPHF for bucket %u out of %u was generated.\n", v69 + 1, *v122);
            v79 = v82;
          }
          v119 = v79;
          v120 = v74;
          if (*v116 == 1)
          {
            v93 = v79[2];
            v132 = 0;
            *(_QWORD *)v133 = 0;
            v131 = 0;
            LOBYTE(v80) = *(_BYTE *)(*(_QWORD *)(v9 + 32) + v69);
            LODWORD(v74) = vcvtpd_u64_f64(*(double *)(v9 + 16) * (double)v80);
            hash_state_dump(**(_DWORD ***)(v93 + 16), &v132, &v133[1]);
            hash_state_dump(*(_DWORD **)(*(_QWORD *)(v93 + 16) + 8), &v131, v133);
            __sizea = v74 + v133[1] + v133[0] + 8;
            v92 = malloc_type_malloc(__sizea, 0xE268128DuLL);
            *v92 = v133[1];
            v94 = v133[1];
            memcpy(v92 + 1, v132, v133[1]);
            *(_DWORD *)((char *)v92 + v94 + 4) = v133[0];
            memcpy((char *)v92 + v133[1] + 8, v131, v133[0]);
            memcpy((char *)v92 + v133[1] + (unint64_t)v133[0] + 8, *(const void **)(v93 + 8), (size_t)v74);
            free(v132);
            free(v131);
            v91 = __sizea;
            v61 = (_QWORD *)v127;
            v90 = v121;
          }
          else
          {
            if (*v116 != 4)
              brz_new_cold_2();
            v83 = v79[2];
            v132 = 0;
            *(_QWORD *)v133 = 0;
            v131 = 0;
            v84 = *(_DWORD *)(v83 + 16);
            v114 = v84;
            hash_state_dump(*(_DWORD **)(v83 + 48), &v132, &v133[1]);
            hash_state_dump(*(_DWORD **)(v83 + 56), &v131, v133);
            __size = v84 + v133[1] + v133[0] + 8;
            v85 = malloc_type_malloc(__size, 0xBC03A31AuLL);
            *v85 = v133[1];
            v86 = v85 + 2;
            v115 = v85;
            v87 = v85 + 1;
            v88 = v133[1];
            memcpy(v85 + 1, v132, v133[1]);
            *(_DWORD *)((char *)v87 + v88) = v133[0];
            memcpy((char *)v86 + v133[1], v131, v133[0]);
            if ((_DWORD)v114)
            {
              v89 = 0;
              do
              {
                *((_BYTE *)v86 + v133[1] + (unint64_t)v133[0]) = *(_BYTE *)(*(_QWORD *)(v83 + 40) + v89);
                v89 += 4;
                v86 = (_DWORD *)((char *)v86 + 1);
              }
              while (4 * v114 != v89);
            }
            free(v132);
            free(v131);
            v61 = (_QWORD *)v127;
            v90 = v121;
            v91 = __size;
            v92 = v115;
          }
          fwrite(v92, v91, 1uLL, *(FILE **)(v9 + 104));
          free(v92);
          cmph_config_destroy(v90);
          v95 = v65;
          v96 = v128;
          do
          {
            free(*v96);
            *v96++ = 0;
            --v95;
          }
          while (v95);
          cmph_destroy(v119);
          cmph_io_byte_vector_adapter_destroy(v120);
          v65 = 0;
          v2 = v123;
        }
        else
        {
          v2 = v123;
          v61 = (_QWORD *)v127;
        }
        if (v66 >= *__ptr)
        {
          LODWORD(v58) = 1;
          v3 = v112;
          goto LABEL_101;
        }
      }
      v73 = v65;
LABEL_80:
      if (*(unsigned __int8 *)(*(_QWORD *)(v9 + 32) + v69) <= v73)
        brz_new_cold_3();
      v128[v73] = *(void **)&v10[8 * v70];
      v65 = v73 + 1;
      *(_QWORD *)&v10[8 * v70] = 0;
      ++v66;
      v12[v70] = -1;
      goto LABEL_82;
    }
    LODWORD(v58) = 1;
LABEL_101:
    v59 = (FILE **)MEMORY[0x24BDAC8D8];
    v8 = v113;
LABEL_107:
    buffer_manager_destroy((uint64_t)v61);
    free(v128);
LABEL_108:
    free(v10);
    free(v12);
    if ((_DWORD)v58)
      break;
LABEL_109:
    --v8;
    hash_state_destroy(*(_DWORD **)(v3 + 80));
    *(_QWORD *)(v3 + 80) = 0;
    if (*(_DWORD *)(v2 + 16))
      fprintf(*v59, "Failure: A graph with more than 255 keys was created - %u iterations remaining\n", v8);
    if (!v8)
    {
      free(*(void **)(v3 + 32));
      return 0;
    }
  }
  v99 = (int *)malloc_type_calloc(*(unsigned int *)(v3 + 60), 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(v3 + 40) = v99;
  if (*(_DWORD *)(v3 + 60) >= 2u)
  {
    v100 = 0;
    v101 = *(_QWORD *)(v3 + 32);
    v104 = *v99;
    v102 = v99 + 1;
    v103 = v104;
    do
    {
      v103 += *(unsigned __int8 *)(v101 + v100);
      v102[v100] = v103;
      v105 = v100 + 2;
      ++v100;
    }
    while (v105 < *(unsigned int *)(v3 + 60));
  }
  v110 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v110 = *(_DWORD *)v2;
  v106 = malloc_type_malloc(0x48uLL, 0x10B00409DD511FCuLL);
  v106[4] = *(_QWORD *)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;
  v107 = *(_OWORD *)(v3 + 64);
  *(_QWORD *)(v3 + 64) = 0;
  *((_OWORD *)v106 + 3) = v107;
  v106[8] = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  v108 = *(_OWORD *)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;
  *((_OWORD *)v106 + 1) = v108;
  *(_QWORD *)(v3 + 40) = 0;
  *((_DWORD *)v106 + 10) = *(_DWORD *)(v3 + 60);
  v106[1] = *(_QWORD *)(v3 + 16);
  v109 = *(_DWORD *)(v3 + 24);
  *((_DWORD *)v106 + 1) = v109;
  *(_DWORD *)v106 = *(_DWORD *)(v3 + 12);
  v110[2] = v106;
  *((_DWORD *)v110 + 1) = v109;
  if (*(_DWORD *)(v2 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v59);
  return v110;
}

uint64_t brz_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  unsigned int __ptr;
  void *v6;

  v3 = *(_QWORD *)(a1 + 16);
  v6 = 0;
  __ptr = 0;
  hash_state_dump(*(_DWORD **)(v3 + 64), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 24), 4 * *(unsigned int *)(v3 + 40), 1uLL, a2);
  return 1;
}

size_t brz_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  unint64_t v6;
  size_t v7;
  void *v8;
  size_t v9;
  void *v10;
  unint64_t v11;
  unsigned int v12;
  size_t v13;
  size_t v14;
  void *v15;
  void *v16;
  unsigned int __ptr;

  __ptr = 0;
  v4 = malloc_type_malloc(0x48uLL, 0x10B00409DD511FCuLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(v4 + 1, 8uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 5, 4uLL, 1uLL, a1);
  v5 = malloc_type_malloc(*((unsigned int *)v4 + 10), 0x100004077774924uLL);
  v4[2] = v5;
  fread(v5, *((unsigned int *)v4 + 10), 1uLL, a1);
  v4[6] = malloc_type_malloc(8 * *((unsigned int *)v4 + 10), 0x2004093837F09uLL);
  v4[7] = malloc_type_malloc(8 * *((unsigned int *)v4 + 10), 0x2004093837F09uLL);
  v4[4] = malloc_type_calloc(*((unsigned int *)v4 + 10), 8uLL, 0x10040436913F5uLL);
  if (*((_DWORD *)v4 + 10))
  {
    v6 = 0;
    do
    {
      fread(&__ptr, 4uLL, 1uLL, a1);
      v7 = __ptr;
      v8 = malloc_type_malloc(__ptr, 0xC2345852uLL);
      fread(v8, v7, 1uLL, a1);
      *(_QWORD *)(v4[6] + 8 * v6) = hash_state_load((const char *)v8);
      free(v8);
      fread(&__ptr, 4uLL, 1uLL, a1);
      v9 = __ptr;
      v10 = malloc_type_malloc(__ptr, 0xB0893B3CuLL);
      fread(v10, v9, 1uLL, a1);
      *(_QWORD *)(v4[7] + 8 * v6) = hash_state_load((const char *)v10);
      free(v10);
      if (*(_DWORD *)v4 == 1)
      {
        LOBYTE(v11) = *(_BYTE *)(v4[2] + v6);
        v12 = vcvtpd_u64_f64(*((double *)v4 + 1) * (double)v11);
      }
      else
      {
        if (*(_DWORD *)v4 != 4)
          brz_load_cold_1();
        v12 = fch_calc_b(*(unsigned __int8 *)(v4[2] + v6), *((double *)v4 + 1));
      }
      v13 = v12;
      *(_QWORD *)(v4[4] + 8 * v6) = malloc_type_calloc(v12, 1uLL, 0x100004077774924uLL);
      fread(*(void **)(v4[4] + 8 * v6++), v13, 1uLL, a1);
    }
    while (v6 < *((unsigned int *)v4 + 10));
  }
  fread(&__ptr, 4uLL, 1uLL, a1);
  v14 = __ptr;
  v15 = malloc_type_malloc(__ptr, 0x2A09125AuLL);
  fread(v15, v14, 1uLL, a1);
  v4[8] = hash_state_load((const char *)v15);
  free(v15);
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  v16 = malloc_type_malloc(4 * *((unsigned int *)v4 + 10), 0x100004052888210uLL);
  v4[3] = v16;
  return fread(v16, 4 * *((unsigned int *)v4 + 10), 1uLL, a1);
}

uint64_t brz_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  double v9;
  double v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int32x2_t v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)v5 == 1)
  {
    hash_vector(*(_DWORD **)(v5 + 64), a2, a3, &v22);
    v6 = v23 % *(_DWORD *)(v5 + 40);
    LOBYTE(v14) = *(_BYTE *)(*(_QWORD *)(v5 + 16) + v6);
    v15 = vcvtpd_u64_f64(*(double *)(v5 + 8) * (double)v14);
    v16 = hash(*(_DWORD **)(*(_QWORD *)(v5 + 48) + 8 * v6), a2, a3) % v15;
    v17 = hash(*(_DWORD **)(*(_QWORD *)(v5 + 56) + 8 * v6), a2, a3);
    v18 = v17 % v15;
    if (v17 % v15 + 1 < v15)
      v19 = v18 + 1;
    else
      v19 = 0;
    if (v16 == v18)
      v18 = v19;
    v20 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8 * v6);
    v13 = (*(_BYTE *)(v20 + v18) + *(_BYTE *)(v20 + v16));
  }
  else
  {
    if (*(_DWORD *)v5 != 4)
      brz_search_cold_1();
    hash_vector(*(_DWORD **)(v5 + 64), a2, a3, &v22);
    v6 = v23 % *(_DWORD *)(v5 + 40);
    v7 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 16) + v6);
    v8 = fch_calc_b(v7, *(double *)(v5 + 8));
    v9 = fch_calc_p1(v7);
    v10 = fch_calc_p2(v8);
    v11 = hash(*(_DWORD **)(*(_QWORD *)(v5 + 48) + 8 * v6), a2, a3) % v7;
    v12 = hash(*(_DWORD **)(*(_QWORD *)(v5 + 56) + 8 * v6), a2, a3) % v7;
    v13 = (v12
         + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8 * v6)
                              + mixh10h11h12(v8, v11, v9, v10)))
        % v7;
  }
  return *(_DWORD *)(*(_QWORD *)(v5 + 24) + 4 * v6) + v13;
}

void brz_destroy(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;

  v2 = a1[2];
  v3 = *(void **)(v2 + 32);
  if (v3)
  {
    if (*(_DWORD *)(v2 + 40))
    {
      v4 = 0;
      do
      {
        free(*(void **)(*(_QWORD *)(v2 + 32) + 8 * v4));
        hash_state_destroy(*(_DWORD **)(*(_QWORD *)(v2 + 48) + 8 * v4));
        hash_state_destroy(*(_DWORD **)(*(_QWORD *)(v2 + 56) + 8 * v4++));
      }
      while (v4 < *(unsigned int *)(v2 + 40));
      v3 = *(void **)(v2 + 32);
    }
    free(v3);
    free(*(void **)(v2 + 48));
    free(*(void **)(v2 + 56));
  }
  hash_state_destroy(*(_DWORD **)(v2 + 64));
  free(*(void **)(v2 + 16));
  free(*(void **)(v2 + 24));
  free((void *)v2);
  free(a1);
}

void *brz_pack(uint64_t a1, _DWORD *a2)
{
  _DWORD *v2;
  uint64_t v3;
  int type;
  char *v5;
  int v6;
  int v7;
  uint64_t v8;
  char *v9;
  void *result;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int v18;
  char *v19;

  v2 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  *a2 = *(_DWORD *)v3;
  type = hash_get_type(*(unsigned int **)(v3 + 64));
  v2[1] = type;
  v2 += 2;
  hash_state_pack(*(_DWORD **)(v3 + 64), v2);
  v5 = (char *)v2 + hash_state_packed_size(type);
  *(_DWORD *)v5 = *(_DWORD *)(v3 + 40);
  *(_QWORD *)(v5 + 4) = (unint64_t)*(double *)(v3 + 8);
  v6 = hash_get_type(**(unsigned int ***)(v3 + 48));
  *((_DWORD *)v5 + 3) = v6;
  v7 = hash_get_type(**(unsigned int ***)(v3 + 56));
  *((_DWORD *)v5 + 4) = v7;
  v5 += 20;
  memcpy(v5, *(const void **)(v3 + 16), *(unsigned int *)(v3 + 40));
  v8 = *(unsigned int *)(v3 + 40);
  v9 = &v5[v8];
  result = memcpy(v9, *(const void **)(v3 + 24), 4 * v8);
  v11 = *(unsigned int *)(v3 + 40);
  if ((_DWORD)v11)
  {
    v12 = 0;
    v13 = &v9[4 * v11];
    v14 = &v13[4 * v11];
    do
    {
      *(_DWORD *)&v13[4 * v12] = (_DWORD)v14;
      hash_state_pack(*(_DWORD **)(*(_QWORD *)(v3 + 48) + 8 * v12), v14);
      v15 = &v14[hash_state_packed_size(v6)];
      hash_state_pack(*(_DWORD **)(*(_QWORD *)(v3 + 56) + 8 * v12), v15);
      v16 = hash_state_packed_size(v7);
      if (*(_DWORD *)v3 == 1)
      {
        LOBYTE(v17) = *(_BYTE *)(*(_QWORD *)(v3 + 16) + v12);
        v18 = vcvtpd_u64_f64(*(double *)(v3 + 8) * (double)v17);
      }
      else
      {
        if (*(_DWORD *)v3 != 4)
          brz_pack_cold_1();
        v18 = fch_calc_b(*(unsigned __int8 *)(*(_QWORD *)(v3 + 16) + v12), *(double *)(v3 + 8));
      }
      v19 = &v15[v16];
      result = memcpy(v19, *(const void **)(*(_QWORD *)(v3 + 32) + 8 * v12), v18);
      v14 = &v19[v18];
      ++v12;
    }
    while (v12 < *(unsigned int *)(v3 + 40));
  }
  return result;
}

uint64_t brz_packed_size(uint64_t a1)
{
  uint64_t v1;
  int type;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  double v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t i;
  unsigned int v12;

  v1 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v1 + 64));
  v3 = hash_get_type(**(unsigned int ***)(v1 + 48));
  v4 = hash_get_type(**(unsigned int ***)(v1 + 56));
  v5 = hash_state_packed_size(type) + *(_DWORD *)(v1 + 40) + 8 * *(_DWORD *)(v1 + 40);
  v6 = v5 + *(_DWORD *)(v1 + 40) * hash_state_packed_size(v3);
  v7 = hash_state_packed_size(v4);
  v9 = *(_DWORD *)(v1 + 40);
  v10 = v6 + v9 * v7 + 32;
  if (v9)
  {
    for (i = 0; i < v9; ++i)
    {
      if (*(_DWORD *)v1 == 1)
      {
        LOBYTE(v8) = *(_BYTE *)(*(_QWORD *)(v1 + 16) + i);
        v8 = (double)*(unint64_t *)&v8;
        v12 = vcvtpd_u64_f64(*(double *)(v1 + 8) * v8);
      }
      else
      {
        if (*(_DWORD *)v1 != 4)
          brz_packed_size_cold_1();
        v12 = fch_calc_b(*(unsigned __int8 *)(*(_QWORD *)(v1 + 16) + i), *(double *)(v1 + 8));
        v9 = *(_DWORD *)(v1 + 40);
      }
      v10 = v12 + v10;
    }
  }
  return v10;
}

uint64_t brz_search_packed(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  uint64_t v8;
  double v9;
  unsigned int *v10;
  int v11;
  int v12;
  char *v13;
  unsigned int v14;
  unsigned int v15;
  double v16;
  double v17;
  char *v18;
  unsigned int *v19;
  unsigned int *v20;
  char *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int *v25;
  int v26;
  unsigned int *v27;
  uint64_t v28;
  double v29;
  unsigned int *v30;
  int v31;
  int v32;
  char *v33;
  unint64_t v34;
  unsigned int *v35;
  unsigned int *v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  int32x2_t v43;
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (*a1 == 1)
  {
    v25 = a1 + 2;
    v26 = a1[1];
    v27 = (_DWORD *)((char *)a1 + hash_state_packed_size(v26) + 8);
    v28 = *v27;
    v29 = (double)*(unint64_t *)(v27 + 1);
    v30 = v27 + 5;
    v31 = v27[3];
    v32 = v27[4];
    v33 = (char *)v27 + v28 + 20;
    hash_vector_packed(v25, v26, a2, a3, &v43);
    LOBYTE(v34) = *((_BYTE *)v30 + v44 % v28);
    LODWORD(v30) = vcvtpd_u64_f64(v29 * (double)v34);
    v18 = &v33[4 * (v44 % v28)];
    v35 = (unsigned int *)*(unsigned int *)&v18[4 * v28];
    v36 = (unsigned int *)((char *)v35 + hash_state_packed_size(v31));
    v37 = hash_state_packed_size(v32);
    v38 = hash_packed(v35, v31, a2, a3) % v30;
    v39 = hash_packed(v36, v32, a2, a3);
    v40 = v39 % v30;
    if (v39 % v30 + 1 < v30)
      v41 = v40 + 1;
    else
      v41 = 0;
    if (v38 == v40)
      v40 = v41;
    v24 = (*((_BYTE *)v36 + v37 + v40) + *((_BYTE *)v36 + v37 + v38));
  }
  else
  {
    if (*a1 != 4)
      brz_search_packed_cold_1();
    v5 = a1 + 2;
    v6 = a1[1];
    v7 = (_DWORD *)((char *)a1 + hash_state_packed_size(v6) + 8);
    v8 = *v7;
    v9 = (double)*(unint64_t *)(v7 + 1);
    v10 = v7 + 5;
    v11 = v7[3];
    v12 = v7[4];
    v13 = (char *)v7 + v8 + 20;
    hash_vector_packed(v5, v6, a2, a3, &v43);
    v14 = v44 % v8;
    LODWORD(v5) = *((unsigned __int8 *)v10 + v44 % v8);
    v15 = fch_calc_b(v5, v9);
    v16 = fch_calc_p1(v5);
    v17 = fch_calc_p2(v15);
    v18 = &v13[4 * v14];
    v19 = (unsigned int *)*(unsigned int *)&v18[4 * v8];
    v20 = (unsigned int *)((char *)v19 + hash_state_packed_size(v11));
    v21 = (char *)v20 + hash_state_packed_size(v12);
    v22 = hash_packed(v19, v11, a2, a3) % v5;
    v23 = hash_packed(v20, v12, a2, a3) % v5;
    v24 = (v23 + v21[mixh10h11h12(v15, v22, v16, v17)]) % v5;
  }
  return *(_DWORD *)v18 + v24;
}

_QWORD *buffer_entry_new(int a1)
{
  _QWORD *result;

  result = malloc_type_malloc(0x20uLL, 0x1030040D278AA01uLL);
  if (result)
  {
    *result = 0;
    result[1] = 0;
    *((_DWORD *)result + 4) = a1;
    *((_DWORD *)result + 5) = a1;
    *((_DWORD *)result + 6) = a1;
    *((_BYTE *)result + 28) = 0;
  }
  return result;
}

FILE *buffer_entry_open(FILE **a1, char *__filename)
{
  FILE *result;

  result = fopen(__filename, "rb");
  *a1 = result;
  return result;
}

uint64_t buffer_entry_set_capacity(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t buffer_entry_get_capacity(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

_DWORD *buffer_entry_read_key(uint64_t a1, char *__dst)
{
  uint64_t v2;
  unsigned int v3;
  BOOL v4;
  unsigned int v7;
  size_t v8;
  _DWORD *v9;
  size_t v10;
  _DWORD *v11;
  uint64_t v12;
  unsigned int v13;
  size_t v14;
  size_t v15;

  v3 = *(_DWORD *)(a1 + 20);
  v2 = *(unsigned int *)(a1 + 24);
  if (*(_BYTE *)(a1 + 28))
    v4 = v3 == (_DWORD)v2;
  else
    v4 = 0;
  if (v4)
    return 0;
  v7 = v2 + 4 - v3;
  if ((int)v2 + 4 <= v3)
  {
    v8 = 0;
    v7 = 4;
  }
  else
  {
    v8 = v3 - v2;
    if (v3 != (_DWORD)v2)
      memcpy(__dst, (const void *)(*(_QWORD *)(a1 + 8) + v2), v8);
    buffer_entry_load(a1);
    LODWORD(v2) = *(_DWORD *)(a1 + 24);
  }
  memcpy(&__dst[4 * v8], (const void *)(*(_QWORD *)(a1 + 8) + v2), v7);
  *(_DWORD *)(a1 + 24) += v7;
  v10 = *(unsigned int *)__dst;
  v11 = malloc_type_malloc(v10 + 4, 0xAEC110B1uLL);
  v9 = v11;
  *v11 = *(_DWORD *)__dst;
  v13 = *(_DWORD *)(a1 + 20);
  v12 = *(unsigned int *)(a1 + 24);
  v14 = (_DWORD)v12 + (_DWORD)v10 - v13;
  if ((int)v12 + (int)v10 <= v13)
  {
    v15 = 0;
    LODWORD(v14) = v10;
  }
  else
  {
    v15 = v13 - v12;
    if (v13 != (_DWORD)v12)
      memcpy(v11 + 1, (const void *)(*(_QWORD *)(a1 + 8) + v12), v15);
    buffer_entry_load(a1);
    LODWORD(v12) = *(_DWORD *)(a1 + 24);
    v10 = v14;
  }
  memcpy((char *)v9 + v15 + 4, (const void *)(*(_QWORD *)(a1 + 8) + v12), v10);
  *(_DWORD *)(a1 + 24) += v14;
  return v9;
}

size_t buffer_entry_load(uint64_t a1)
{
  void *v2;
  size_t result;

  free(*(void **)(a1 + 8));
  v2 = malloc_type_calloc(*(unsigned int *)(a1 + 16), 1uLL, 0x100004077774924uLL);
  *(_QWORD *)(a1 + 8) = v2;
  result = fread(v2, 1uLL, *(unsigned int *)(a1 + 16), *(FILE **)a1);
  *(_DWORD *)(a1 + 20) = result;
  if (*(_DWORD *)(a1 + 16) != (_DWORD)result)
    *(_BYTE *)(a1 + 28) = 1;
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

void buffer_entry_destroy(uint64_t a1)
{
  fclose(*(FILE **)a1);
  *(_QWORD *)a1 = 0;
  free(*(void **)(a1 + 8));
  free((void *)a1);
}

_QWORD *buffer_manager_new(int a1, unsigned int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  int v7;

  v4 = malloc_type_malloc(0x28uLL, 0x1090040C43F5BDEuLL);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)v4 = a1;
    v4[1] = malloc_type_calloc(a2, 8uLL, 0x2004093837F09uLL);
    v5[3] = malloc_type_calloc(a2, 4uLL, 0x100004052888210uLL);
    *((_DWORD *)v5 + 8) = -1;
    *((_DWORD *)v5 + 4) = a2;
    if (a2)
    {
      v6 = 0;
      v7 = *(_DWORD *)v5 / a2 + 1;
      do
        *(_QWORD *)(v5[1] + 8 * v6++) = buffer_entry_new(v7);
      while (v6 < *((unsigned int *)v5 + 4));
    }
  }
  return v5;
}

FILE *buffer_manager_open(uint64_t a1, unsigned int a2, char *__filename)
{
  return buffer_entry_open(*(FILE ***)(*(_QWORD *)(a1 + 8) + 8 * a2), __filename);
}

_DWORD *buffer_manager_read_key(uint64_t a1, unsigned int a2, char *a3)
{
  uint64_t v6;
  int capacity;
  uint64_t v8;
  uint64_t v9;
  _DWORD *key;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  if ((*(_DWORD *)(a1 + 32) & 0x80000000) == 0)
  {
    capacity = buffer_entry_get_capacity(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * a2));
    v8 = *(_QWORD *)(a1 + 24);
    v9 = *(int *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v9 - 1;
    buffer_entry_set_capacity(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * a2), *(_DWORD *)(v8 + 4 * v9) + capacity);
  }
  key = buffer_entry_read_key(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v6), a3);
  if (!key)
  {
    v11 = buffer_entry_get_capacity(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v6));
    v12 = *(_QWORD *)(a1 + 24);
    v13 = *(int *)(a1 + 32) + 1;
    *(_DWORD *)(a1 + 32) = v13;
    *(_DWORD *)(v12 + 4 * v13) = v11;
  }
  return key;
}

void buffer_manager_destroy(uint64_t a1)
{
  unint64_t v2;

  if (*(_DWORD *)(a1 + 16))
  {
    v2 = 0;
    do
      buffer_entry_destroy(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 16));
  }
  free(*(void **)(a1 + 24));
  free(*(void **)(a1 + 8));
  free((void *)a1);
}

_QWORD *chd_config_new(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  v3 = v2;
  if (v2)
  {
    *v2 = 0;
    *v2 = cmph_config_new(v1);
    cmph_config_set_algo();
  }
  return v3;
}

void chd_config_destroy(uint64_t a1)
{
  _DWORD **v1;

  v1 = *(_DWORD ***)(a1 + 32);
  if (*v1)
    cmph_config_destroy(*v1);
  free(v1);
}

uint64_t chd_config_set_hashfuncs(uint64_t a1, _DWORD *a2)
{
  return cmph_config_set_hashfuncs(**(_QWORD **)(a1 + 32), a2);
}

uint64_t chd_config_set_b(uint64_t a1, int a2)
{
  return cmph_config_set_b(**(_QWORD **)(a1 + 32), a2);
}

uint64_t chd_config_set_keys_per_bin(uint64_t a1, int a2)
{
  return cmph_config_set_keys_per_bin(**(_QWORD **)(a1 + 32), a2);
}

int *chd_new(uint64_t a1, double a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  FILE **v7;
  int *v8;
  int *v9;
  unsigned int v10;
  int *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  _QWORD *v21;
  _OWORD v23[3];

  v4 = *(uint64_t **)(a1 + 32);
  v5 = *v4;
  v6 = *(_QWORD *)(*v4 + 32);
  memset(v23, 0, sizeof(v23));
  cmph_config_set_verbosity(v5, *(_DWORD *)(a1 + 16));
  cmph_config_set_graphsize(*v4, a2);
  v7 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*(_DWORD *)(a1 + 16))
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Generating a CHD_PH perfect hash function with a load factor equal to %.3f\n", a2);
  v8 = (int *)cmph_new(*v4);
  v9 = v8;
  if (v8)
  {
    v10 = cmph_packed_size(v8);
    v11 = (int *)malloc_type_calloc(v10, 1uLL, 0xE1512BACuLL);
    cmph_pack(v9, v11);
    cmph_destroy(v9);
    if (*(_DWORD *)(a1 + 16))
      fwrite("Compressing the range of the resulting CHD_PH perfect hash function\n", 0x44uLL, 1uLL, *v7);
    compressed_rank_init((uint64_t)v23);
    v12 = *(_DWORD *)(v6 + 20);
    v13 = *(_DWORD *)(v6 + 32);
    v14 = malloc_type_calloc((v12 - v13), 4uLL, 0x100004052888210uLL);
    v15 = v14;
    if (v12)
    {
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)(v6 + 48);
      do
      {
        if ((bitmask32[v17 & 0x1F] & *(_DWORD *)(v18 + 4 * (v17 >> 5))) == 0)
          *((_DWORD *)v14 + v16++) = v17;
        ++v17;
      }
      while (v12 != v17);
    }
    compressed_rank_generate((uint64_t)v23, (uint64_t)v14, v12 - v13);
    free(v15);
    v19 = compressed_rank_packed_size(v23);
    v20 = malloc_type_calloc(v19, 1uLL, 0x100004077774924uLL);
    compressed_rank_pack((uint64_t)v23, v20);
    compressed_rank_destroy((uint64_t)v23);
    v9 = (int *)malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
    *v9 = *(_DWORD *)a1;
    v21 = malloc_type_malloc(0x20uLL, 0x101004097AD5072uLL);
    v21[1] = v20;
    v21[3] = v11;
    *((_DWORD *)v21 + 4) = v10;
    *(_DWORD *)v21 = v19;
    *((_QWORD *)v9 + 2) = v21;
    v9[1] = v13;
    if (*(_DWORD *)(a1 + 16))
      fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v7);
  }
  return v9;
}

size_t chd_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = malloc_type_malloc(0x20uLL, 0x101004097AD5072uLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(v4 + 2, 4uLL, 1uLL, a1);
  v5 = malloc_type_calloc(*((unsigned int *)v4 + 4), 1uLL, 0x9AE89B98uLL);
  v4[3] = v5;
  fread(v5, *((unsigned int *)v4 + 4), 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  v6 = malloc_type_calloc(*(unsigned int *)v4, 1uLL, 0x49D48493uLL);
  v4[1] = v6;
  return fread(v6, *(unsigned int *)v4, 1uLL, a1);
}

uint64_t chd_dump(uint64_t a1, FILE *a2)
{
  const void **v3;

  v3 = *(const void ***)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(v3 + 2, 4uLL, 1uLL, a2);
  fwrite(v3[3], *((unsigned int *)v3 + 4), 1uLL, a2);
  fwrite(v3, 4uLL, 1uLL, a2);
  fwrite(v3[1], *(unsigned int *)v3, 1uLL, a2);
  return 1;
}

void chd_destroy(_QWORD *a1)
{
  void **v2;

  v2 = (void **)a1[2];
  free(v2[3]);
  free(v2[1]);
  free(v2);
  free(a1);
}

uint64_t chd_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned int **)(v3 + 8);
  v5 = cmph_search_packed(*(_DWORD **)(v3 + 24), a2, a3);
  return v5 - compressed_rank_query_packed(v4, v5);
}

void *chd_pack(uint64_t a1, _DWORD *a2)
{
  const void **v2;
  _DWORD *v3;
  _DWORD *v4;

  v2 = *(const void ***)(a1 + 16);
  *a2 = *(_DWORD *)v2;
  v3 = a2 + 1;
  memcpy(a2 + 1, v2[1], *(unsigned int *)v2);
  v4 = (_DWORD *)((char *)v3 + *(unsigned int *)v2);
  *v4 = *((_DWORD *)v2 + 4);
  return memcpy(v4 + 1, v2[3], *((unsigned int *)v2 + 4));
}

uint64_t chd_packed_size(uint64_t a1)
{
  return (**(_DWORD **)(a1 + 16) + *(_DWORD *)(*(_QWORD *)(a1 + 16) + 16) + 12);
}

uint64_t chd_search_packed(unsigned int *a1)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = a1 + 1;
  v2 = cmph_search_packed((char *)a1 + *a1 + 8);
  return v2 - compressed_rank_query_packed(v1, v2);
}

double chd_ph_config_new()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x38uLL, 0x10300403C8AB7B5uLL);
  if (v0)
  {
    v0[4] = 0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
    *((_BYTE *)v0 + 36) = 1;
    *(_QWORD *)&result = 0x400000001;
    v0[5] = 0x400000001;
    v0[6] = 0;
  }
  return result;
}

void chd_ph_config_destroy(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[6];
  if (v2)
    free(v2);
  free(v1);
}

uint64_t chd_ph_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  if (*a2 != 1)
    **(_DWORD **)(result + 32) = *a2;
  return result;
}

uint64_t chd_ph_config_set_b(uint64_t result, int a2)
{
  int v2;

  if (!result)
    chd_ph_config_set_b_cold_1();
  if ((a2 - 15) >= 0xFFFFFFF2)
    v2 = a2;
  else
    v2 = 4;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 44) = v2;
  return result;
}

uint64_t chd_ph_config_set_keys_per_bin(uint64_t result, int a2)
{
  int v2;

  if (!result)
    chd_ph_config_set_keys_per_bin_cold_1();
  if ((a2 - 128) < 0xFFFFFF82)
    v2 = 1;
  else
    v2 = a2;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 40) = v2;
  return result;
}

_QWORD *chd_ph_new(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  FILE **v11;
  char *v12;
  unint64_t v13;
  double v14;
  size_t v15;
  size_t v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  char *v20;
  unsigned int *v21;
  uint64_t v22;
  unsigned __int32 *v23;
  unsigned int v24;
  unsigned int *v25;
  int v26;
  _DWORD *v27;
  uint64_t v28;
  _DWORD *v29;
  unint64_t v30;
  unsigned __int32 *v31;
  unsigned int v32;
  unsigned __int32 v33;
  unsigned int *v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  int v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unsigned __int32 *v44;
  unsigned int *v45;
  char *v46;
  _DWORD *v47;
  unsigned int v48;
  unsigned int v49;
  unsigned __int32 v50;
  size_t v51;
  size_t v52;
  char *v53;
  unsigned int *v54;
  size_t v55;
  uint64_t v56;
  unsigned int v57;
  unsigned int v58;
  int v59;
  unsigned int v60;
  char *v61;
  unsigned int *v62;
  uint64_t i;
  uint64_t v64;
  char *v65;
  unsigned int *v66;
  char *v67;
  unsigned int v68;
  unsigned int j;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int v73;
  int k;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  int v83;
  uint64_t v84;
  unsigned int v85;
  unsigned int v86;
  size_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  unint64_t v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  int v96;
  FILE **v97;
  void *v98;
  void *v99;
  _QWORD *v100;
  _QWORD *v101;
  int v102;
  uint64_t v103;
  _DWORD *v104;
  int v106;
  unsigned int v107;
  uint64_t v108;
  unsigned int *v109;
  char *v110;
  unsigned int v112;
  int v113;
  char *v114;
  void *v115;
  int v116;
  unsigned int *v117;
  unsigned int v118;
  unsigned __int8 *v119;
  int32x2_t v120;
  unsigned int v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8);
  *(_DWORD *)(v4 + 32) = v5;
  v6 = v5 / *(_DWORD *)(v4 + 44) + 1;
  if (a2 < 0.5)
    a2 = 0.5;
  if (a2 >= 0.99)
    a2 = 0.99;
  LODWORD(a4) = *(_DWORD *)(v4 + 40);
  v7 = ((double)v5 / (a2 * (double)*(unint64_t *)&a4));
  if ((((_BYTE)v7 + 1) & 1) != 0)
    v8 = v7 + 1;
  else
    v8 = v7 + 2;
  *(_DWORD *)(v4 + 16) = v6;
  while (1)
  {
    *(_DWORD *)(v4 + 20) = v8;
    if (check_primality(v8) == 1)
      break;
    v8 = (*(_DWORD *)(v4 + 20) + 2);
  }
  v10 = 0.0;
  v108 = v4;
  if (*(_DWORD *)(v4 + 40) == 1)
  {
    LODWORD(v10) = *(_DWORD *)(v4 + 20);
    LODWORD(v9) = *(_DWORD *)(v4 + 32);
    v10 = ((1.0 / ((double)v9 + (double)v9) + (double)*(unint64_t *)&v10 / (double)v9 + -1.0)
         * log(1.0 - (double)v9 / (double)*(unint64_t *)&v10)
         + 1.0)
        / 0.693147181;
  }
  v11 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*(_DWORD *)(a1 + 16))
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "space lower bound is %.3f bits per key\n", v10);
  v109 = (unsigned int *)malloc_type_calloc(*(unsigned int *)(v4 + 16), 8uLL, 0x100004000313F17uLL);
  v12 = (char *)malloc_type_calloc(*(unsigned int *)(v4 + 32), 8uLL, 0x100004000313F17uLL);
  LODWORD(v13) = *(_DWORD *)(v4 + 32);
  v14 = log((double)v13) / 0.693147181 / 20.0;
  v15 = *(unsigned int *)(v4 + 20);
  if (*(_DWORD *)(v4 + 40) == 1)
  {
    v15 = (v15 + 31) >> 5;
    v16 = 4;
    v17 = 1384677904;
  }
  else
  {
    v16 = 1;
    v17 = 2004306212;
  }
  v18 = a1;
  v112 = vcvtd_n_u64_f64(v14, 0x14uLL);
  *(_QWORD *)(v4 + 48) = malloc_type_calloc(v15, v16, v17 | 0x100004000000000);
  v115 = malloc_type_calloc(*(unsigned int *)(v4 + 16), 4uLL, 0x100004052888210uLL);
  v110 = 0;
  v19 = 100;
  while (1)
  {
    v20 = v12;
    v21 = v109;
    if (*(_DWORD *)(v18 + 16))
      fprintf(*v11, "Starting mapping step for mph creation of %u keys with %u bins\n", *(_DWORD *)(v108 + 32), *(_DWORD *)(v108 + 20));
    v106 = v19 - 1;
    v22 = *(_QWORD *)(v18 + 32);
    v119 = 0;
    v118 = 0;
    v23 = (unsigned __int32 *)malloc_type_malloc(12 * *(unsigned int *)(v22 + 32), 0x10000403E1C8BA9uLL);
    v24 = 0;
    v25 = v109 + 1;
    v26 = 1000;
    while (1)
    {
      v27 = *(_DWORD **)(v22 + 24);
      if (v27)
        hash_state_destroy(v27);
      *(_QWORD *)(v22 + 24) = hash_state_new(*(_DWORD *)v22, *(_DWORD *)(v22 + 32));
      if (!v109)
        chd_ph_new_cold_1();
      v28 = *(unsigned int *)(v22 + 16);
      v29 = v109 + 1;
      if ((_DWORD)v28)
      {
        do
        {
          *v29 = 0;
          v29 += 2;
          --v28;
        }
        while (v28);
      }
      v116 = v26;
      (*(void (**)(_QWORD))(*(_QWORD *)(v18 + 8) + 32))(**(_QWORD **)(v18 + 8));
      if (*(_DWORD *)(v22 + 32))
      {
        v30 = 0;
        v31 = v23 + 2;
        do
        {
          (*(void (**)(_QWORD, unsigned __int8 **, unsigned int *))(*(_QWORD *)(a1 + 8) + 16))(**(_QWORD **)(a1 + 8), &v119, &v118);
          hash_vector(*(_DWORD **)(v22 + 24), v119, v118, &v120);
          v32 = *(_DWORD *)(v22 + 20);
          v33 = v120.i32[0] % *(_DWORD *)(v22 + 16);
          *(v31 - 2) = v120.i32[1] % v32;
          *(v31 - 1) = v121 % (v32 - 1) + 1;
          *v31 = v33;
          (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(a1 + 8) + 24))(**(_QWORD **)(a1 + 8), v119, v118);
          v34 = &v109[2 * v33];
          v35 = v34[1];
          v34[1] = v35 + 1;
          if (v35 + 1 > v24)
            v24 = v35 + 1;
          ++v30;
          v31 += 3;
        }
        while (v30 < *(unsigned int *)(v22 + 32));
      }
      *v109 = 0;
      if (*(_DWORD *)(v22 + 16) < 2u)
      {
        v40 = 0;
        v18 = a1;
        v39 = v116;
      }
      else
      {
        v36 = 0;
        v37 = 0;
        v38 = v109 + 1;
        v18 = a1;
        v39 = v116;
        do
        {
          v37 += *v38;
          *v38 = 0;
          v38[1] = v37;
          v38 += 2;
          v40 = v36 + 1;
          v41 = v36 + 2;
          ++v36;
        }
        while (v41 < *(unsigned int *)(v22 + 16));
      }
      v109[2 * v40 + 1] = 0;
      LODWORD(v42) = *(_DWORD *)(v22 + 32);
      if (!(_DWORD)v42)
        break;
      v43 = 0;
      v26 = v39 - 1;
      while (1)
      {
        v44 = &v23[3 * v43];
        v45 = &v109[2 * v44[2]];
        v46 = &v20[8 * *v45];
        v49 = v45[1];
        v47 = v45 + 1;
        v48 = v49;
        v50 = *v44;
        if (v49)
          break;
LABEL_43:
        *(_DWORD *)v46 = v50;
        *((_DWORD *)v46 + 1) = v23[3 * v43 + 1];
        ++*v47;
        ++v43;
        v42 = *(unsigned int *)(v22 + 32);
        if (v43 >= v42)
          goto LABEL_44;
      }
      while (*(_DWORD *)v46 != v50 || *((_DWORD *)v46 + 1) != v23[3 * v43 + 1])
      {
        v46 += 8;
        if (!--v48)
          goto LABEL_43;
      }
LABEL_44:
      if ((_DWORD)v42 == (_DWORD)v43)
        break;
      if (!v26)
      {
        free(v23);
        hash_state_destroy(*(_DWORD **)(v22 + 24));
        *(_QWORD *)(v22 + 24) = 0;
        if (*(_DWORD *)(v18 + 16))
          fwrite("Failure in mapping step\n", 0x18uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
LABEL_124:
        free(v21);
        free(v20);
        free(v110);
        free(v115);
        v103 = v108;
        v104 = *(_DWORD **)(v108 + 24);
        if (v104)
        {
          hash_state_destroy(v104);
          v103 = v108;
        }
        v100 = 0;
        *(_QWORD *)(v103 + 24) = 0;
        return v100;
      }
    }
    free(v23);
    if (*(_DWORD *)(v18 + 16))
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    if (v110)
      free(v110);
    v51 = *(unsigned int *)(v108 + 16);
    v52 = *(unsigned int *)(v108 + 32);
    v53 = (char *)malloc_type_calloc(v24 + 1, 8uLL, 0x100004000313F17uLL);
    if ((_DWORD)v51)
    {
      v54 = v109 + 1;
      v55 = v51;
      do
      {
        v57 = *v54;
        v54 += 2;
        v56 = v57;
        if (v57)
          ++*(_DWORD *)&v53[8 * v56 + 4];
        --v55;
      }
      while (v55);
    }
    *((_DWORD *)v53 + 2) = 0;
    if (v24 >= 2)
    {
      v59 = 0;
      v60 = 1;
      do
      {
        v58 = v60 + 1;
        v61 = &v53[8 * v60];
        v59 += *((_DWORD *)v61 + 1);
        *(_DWORD *)&v53[8 * v60 + 8] = v59;
        *((_DWORD *)v61 + 1) = 0;
        LODWORD(v61) = v60 + 2;
        ++v60;
      }
      while (v61 <= v24);
    }
    else
    {
      v58 = 1;
    }
    v110 = v53;
    *(_DWORD *)&v53[8 * v58 + 4] = 0;
    v62 = (unsigned int *)malloc_type_calloc(v51, 8uLL, 0x100004000313F17uLL);
    if ((_DWORD)v51)
    {
      for (i = 0; i != v51; ++i)
      {
        v64 = *v25;
        if ((_DWORD)v64)
        {
          v65 = &v110[8 * v64];
          v66 = &v62[2 * (*((_DWORD *)v65 + 1) + *(_DWORD *)v65)];
          v66[1] = i;
          *v66 = *(v25 - 1);
          ++*((_DWORD *)v65 + 1);
        }
        v25 += 2;
      }
    }
    v109 = v62;
    free(v21);
    v67 = (char *)malloc_type_calloc(v52, 8uLL, 0x100004000313F17uLL);
    v12 = v67;
    if (v24)
    {
      v68 = 0;
      for (j = 1; j <= v24; ++j)
      {
        v70 = &v110[8 * j];
        v71 = *(unsigned int *)v70;
        v72 = (*((_DWORD *)v70 + 1) + v71);
        if (v71 < v72)
        {
          do
          {
            v73 = v109[2 * v71];
            v109[2 * v71] = v68;
            if (j)
            {
              for (k = 0; k != j; ++k)
                *(_QWORD *)&v67[8 * v68 + 8 * k] = *(_QWORD *)&v20[8 * v73 + 8 * k];
              v68 += k;
            }
            ++v71;
          }
          while (v71 != v72);
        }
      }
    }
    free(v20);
    if (*(_DWORD *)(v18 + 16))
      fwrite("Starting searching step\n", 0x18uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    v75 = v108;
    if (!*(_BYTE *)(v108 + 36))
      break;
    if (!v24)
      goto LABEL_116;
    v76 = v24;
    while (1)
    {
      v114 = &v110[8 * v76];
      v117 = (unsigned int *)(v114 + 4);
      v107 = *((_DWORD *)v114 + 1);
      if (v107)
        break;
LABEL_93:
      *v117 = v107;
      if (!(_DWORD)--v76)
        goto LABEL_116;
    }
    v77 = 0;
    v78 = 0;
    v79 = 0;
    while (1)
    {
      v113 = v79;
      v80 = 0;
      v81 = 0;
      v82 = *(_DWORD *)v114;
      do
      {
        v83 = v82 + v81;
        v84 = v76;
        if (place_bucket_probe(v108, (uint64_t)v109, (uint64_t)v12, v78, v77, v82 + v81, v76))
          *((_DWORD *)v115 + v109[2 * v83 + 1]) = v78 + *(_DWORD *)(v108 + 20) * v77;
        else
          *(_QWORD *)&v109[2 * *(_DWORD *)v114 + 2 * v80++] = *(_QWORD *)&v109[2 * v83];
        ++v81;
        v76 = v84;
      }
      while (v81 < *v117);
      *v117 = v80;
      v85 = v78 + 1;
      v86 = *(_DWORD *)(v108 + 20);
      if (v78 + 1 >= v86)
        ++v77;
      v79 = v113 + 1;
      if (v113 + 1 >= v112 || v77 >= v86)
        break;
      if (v85 < v86)
        v86 = 0;
      v78 = v85 - v86;
      if (!v80)
        goto LABEL_93;
    }
    *v117 = v107;
LABEL_96:
    if (*(_DWORD *)(v108 + 40) <= 1u)
      v87 = ((v86 + 31) >> 3) & 0x1FFFFFFC;
    else
      v87 = v86;
    bzero(*(void **)(v108 + 48), v87);
    v18 = a1;
    v11 = (FILE **)MEMORY[0x24BDAC8D8];
    v19 = v106;
    if (!v106)
    {
      if (*(_DWORD *)(a1 + 16))
        fwrite("Failure because the max trials was exceeded\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      v21 = v109;
      v20 = v12;
      goto LABEL_124;
    }
  }
  v88 = (uint64_t)v109;
  if (v24)
  {
    v89 = v24;
    do
    {
      v90 = &v110[8 * v89];
      v91 = *(unsigned int *)v90;
      if (v91 < *((_DWORD *)v90 + 1) + (int)v91)
      {
        do
        {
          v92 = 0;
          v93 = 0;
          v94 = 1;
          while (!place_bucket_probe(v108, v88, (uint64_t)v12, v92, v93, v91, v89))
          {
            v95 = v92 + 1;
            v86 = *(_DWORD *)(v108 + 20);
            if (v92 + 1 < v86)
              v96 = 0;
            else
              v96 = *(_DWORD *)(v108 + 20);
            if (v95 >= v86)
              ++v93;
            if (v94 < v112)
            {
              v92 = v95 - v96;
              ++v94;
              v88 = (uint64_t)v109;
              if (v93 < v86)
                continue;
            }
            goto LABEL_96;
          }
          v88 = (uint64_t)v109;
          *((_DWORD *)v115 + v109[2 * v91++ + 1]) = v92 + *(_DWORD *)(v108 + 20) * v93;
        }
        while (v91 < (*(_DWORD *)v90 + *((_DWORD *)v90 + 1)));
      }
      --v89;
    }
    while ((_DWORD)v89);
  }
LABEL_116:
  v97 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*(_DWORD *)(a1 + 16))
  {
    fwrite("Starting compressing step\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    v75 = v108;
  }
  v98 = *(void **)(v75 + 8);
  if (v98)
    free(v98);
  v99 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100406BA554FBuLL);
  *(_QWORD *)(v108 + 8) = v99;
  compressed_seq_init((uint64_t)v99);
  compressed_seq_generate(*(unsigned int **)(v108 + 8), (uint64_t)v115, *(unsigned int *)(v108 + 16));
  free(v109);
  free(v12);
  free(v110);
  free(v115);
  v100 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v100 = *(_DWORD *)a1;
  v101 = malloc_type_malloc(0x18uLL, 0x102004014030ADEuLL);
  *v101 = *(_QWORD *)(v108 + 8);
  *(_QWORD *)(v108 + 8) = 0;
  v101[2] = *(_QWORD *)(v108 + 24);
  *(_QWORD *)(v108 + 24) = 0;
  v102 = *(_DWORD *)(v108 + 20);
  *((_DWORD *)v101 + 3) = v102;
  *((_DWORD *)v101 + 2) = *(_DWORD *)(v108 + 16);
  v100[2] = v101;
  *((_DWORD *)v100 + 1) = v102;
  if (*(_DWORD *)(a1 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v97);
  return v100;
}

size_t chd_ph_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  size_t v5;
  void *v6;
  size_t v7;
  _DWORD *v8;
  void *v9;
  unsigned int __ptr;

  __ptr = 0;
  v4 = malloc_type_malloc(0x18uLL, 0x102004014030ADEuLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(&__ptr, 4uLL, 1uLL, a1);
  v5 = __ptr;
  v6 = malloc_type_malloc(__ptr, 0xA1556DE2uLL);
  fread(v6, v5, 1uLL, a1);
  v4[2] = hash_state_load((const char *)v6);
  free(v6);
  fread(&__ptr, 4uLL, 1uLL, a1);
  v7 = __ptr;
  v8 = malloc_type_malloc(__ptr, 0x4531BB4AuLL);
  fread(v8, v7, 1uLL, a1);
  v9 = malloc_type_calloc(1uLL, 0x38uLL, 0x10100406BA554FBuLL);
  *v4 = v9;
  compressed_seq_load((uint64_t)v9, v8);
  free(v8);
  fread((char *)v4 + 12, 4uLL, 1uLL, a1);
  return fread(v4 + 1, 4uLL, 1uLL, a1);
}

uint64_t chd_ph_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  unsigned int __ptr;
  void *v6;

  v6 = 0;
  __ptr = 0;
  v3 = *(_QWORD *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 16), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  compressed_seq_dump(*(_QWORD *)v3, (uint64_t)&v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  fwrite((const void *)(v3 + 12), 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 4uLL, 1uLL, a2);
  return 1;
}

void chd_ph_destroy(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[2];
  compressed_seq_destroy(*(_QWORD *)v2);
  free(*(void **)v2);
  hash_state_destroy(*(_DWORD **)(v2 + 16));
  free((void *)v2);
  free(a1);
}

unint64_t chd_ph_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned __int32 v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int32x2_t v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 16);
  hash_vector(*(_DWORD **)(v3 + 16), a2, a3, &v9);
  v4 = v9.u32[1];
  v5 = *(_DWORD *)(v3 + 12);
  v6 = v10;
  v7 = compressed_seq_query(*(_QWORD *)v3, v9.i32[0] % *(_DWORD *)(v3 + 8));
  return (v4 % v5 + v7 % *(_DWORD *)(v3 + 12) * (unint64_t)(v6 % (v5 - 1) + 1) + v7 / *(_DWORD *)(v3 + 12))
       % *(unsigned int *)(v3 + 12);
}

void chd_ph_pack(uint64_t a1, int *a2)
{
  uint64_t v3;
  int type;
  _DWORD *v5;

  v3 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v3 + 16));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 16), a2);
  v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  *v5 = *(_DWORD *)(v3 + 12);
  v5[1] = *(_DWORD *)(v3 + 8);
  compressed_seq_pack(*(_QWORD *)v3, v5 + 2);
}

uint64_t chd_ph_packed_size(uint64_t a1)
{
  _DWORD **v1;
  int type;
  int v3;

  v1 = *(_DWORD ***)(a1 + 16);
  type = hash_get_type(v1[2]);
  v3 = hash_state_packed_size(type);
  return v3 + compressed_seq_packed_size(*v1) + 16;
}

uint64_t chd_ph_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  int *v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int packed;
  int32x2_t v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (unsigned int *)(a1 + 1);
  v6 = *a1;
  v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  v8 = (int *)(v7 + 2);
  v9 = *v7;
  v10 = v7[1];
  hash_vector_packed(v5, v6, a2, a3, &v14);
  LODWORD(a2) = v14.i32[1];
  v11 = v15;
  packed = compressed_seq_query_packed(v8, v14.i32[0] % v10);
  return ((a2 % v9
                       + packed % v9 * (unint64_t)(v11 % ((int)v9 - 1) + 1)
                       + packed / v9)
                      % v9);
}

uint64_t place_bucket_probe(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7)
{
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  unsigned int *v18;
  uint64_t v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;

  v7 = (unsigned int *)(a2 + 8 * a6);
  v8 = (unsigned int *)(a3 + 8 * *v7);
  if (*(_DWORD *)(a1 + 40) <= 1u)
  {
    if (a7)
    {
      v9 = 0;
      v13 = *(_QWORD *)(a1 + 48);
      while (1)
      {
        v14 = ((*v8 + (unint64_t)a5 + v8[1] * (unint64_t)a4) % *(unsigned int *)(a1 + 20)) >> 5;
        v15 = *(_DWORD *)(v13 + 4 * v14);
        v16 = bitmask32_0[((*v8 + (unint64_t)a5 + v8[1] * (unint64_t)a4) % *(unsigned int *)(a1 + 20)) & 0x1F];
        if ((v16 & v15) != 0)
          break;
        *(_DWORD *)(v13 + 4 * v14) = v16 | v15;
        ++v9;
        v8 += 2;
        if (a7 == v9)
          return 1;
      }
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (!a7)
  {
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 0;
  while (1)
  {
    v10 = (*v8 + (unint64_t)a5 + v8[1] * (unint64_t)a4) % *(unsigned int *)(a1 + 20);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(unsigned __int8 *)(v11 + v10);
    if (*(_DWORD *)(a1 + 40) <= v12)
      break;
    *(_BYTE *)(v11 + v10) = v12 + 1;
    ++v9;
    v8 += 2;
    if (a7 == v9)
      return 1;
  }
LABEL_13:
  if (v9 == a7)
    return 1;
  v18 = (unsigned int *)(a3 + 8 * *v7);
  if (*(_DWORD *)(a1 + 40) <= 1u)
  {
    if (v9)
    {
      v22 = *(_QWORD *)(a1 + 48);
      do
      {
        v23 = *v18;
        v24 = v18[1];
        v18 += 2;
        v25 = (v23 + a5 + v24 * (unint64_t)a4) % *(unsigned int *)(a1 + 20);
        *(_DWORD *)(v22 + ((v25 >> 3) & 0x1FFFFFFC)) ^= bitmask32_0[v25 & 0x1F];
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    for (; v9; --v9)
    {
      v19 = *v18;
      v20 = v18[1];
      v18 += 2;
      v21 = (v19 + a5 + v20 * (unint64_t)a4) % *(unsigned int *)(a1 + 20);
      --*(_BYTE *)(*(_QWORD *)(a1 + 48) + v21);
    }
  }
  return 0;
}

double chm_config_new()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x28uLL, 0x10B004021B77C51uLL);
  if (v0)
  {
    v0[4] = 0;
    result = 0.0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void chm_config_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t chm_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  _DWORD *v2;
  int v3;

  if (*a2 != 1)
  {
    v2 = *(_DWORD **)(result + 32);
    *v2 = *a2;
    v3 = a2[1];
    if (v3 != 1)
      v2[1] = v3;
  }
  return result;
}

_QWORD *chm_new(uint64_t a1, double a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  FILE **v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  int is_cyclic;
  int v20;
  _QWORD *v21;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t i;
  char *v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8);
  if (a2 == 0.0)
    a2 = 2.09;
  v5 = vcvtpd_u64_f64(a2 * (double)v4);
  *(_DWORD *)(v3 + 8) = v4;
  *(_DWORD *)(v3 + 12) = v5;
  *(_QWORD *)(v3 + 16) = graph_new(v5, v4);
  v6 = malloc_type_malloc(0x18uLL, 0x2004093837F09uLL);
  v7 = 0;
  *(_QWORD *)(v3 + 32) = v6;
  do
  {
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + v7) = 0;
    v7 += 8;
  }
  while (v7 != 24);
  v8 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*(_DWORD *)(a1 + 16))
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Entering mapping step for mph creation of %u keys with graph sized %u\n", *(_DWORD *)(v3 + 8), *(_DWORD *)(v3 + 12));
  v9 = 20;
  while (1)
  {
    **(_QWORD **)(v3 + 32) = hash_state_new(*(_DWORD *)v3, *(_DWORD *)(v3 + 12));
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) = hash_state_new(*(_DWORD *)(v3 + 4), *(_DWORD *)(v3 + 12));
    v10 = *(_QWORD *)(a1 + 32);
    graph_clear_edges(*(unsigned int **)(v10 + 16));
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 8) + 32))(**(_QWORD **)(a1 + 8));
    v11 = *(_QWORD *)(a1 + 8);
    if (*(_DWORD *)(v11 + 8))
    {
      v12 = 0;
      while (1)
      {
        v30 = 0;
        v29 = 0;
        (*(void (**)(_QWORD, unsigned __int8 **, unsigned int *))(v11 + 16))(*(_QWORD *)v11, &v29, &v30);
        v13 = hash(**(_DWORD ***)(v10 + 32), v29, v30) % *(_DWORD *)(v10 + 12);
        v14 = hash(*(_DWORD **)(*(_QWORD *)(v10 + 32) + 8), v29, v30);
        v15 = *(_DWORD *)(v10 + 12);
        v16 = v14 % v15;
        v17 = v14 % v15 + 1 < v15 ? v16 + 1 : 0;
        v18 = v13 == v16 ? v17 : v16;
        if (v13 == v18)
          break;
        (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(a1 + 8) + 24))(**(_QWORD **)(a1 + 8), v29, v30);
        graph_add_edge(*(_QWORD *)(v10 + 16), v13, v18);
        ++v12;
        v11 = *(_QWORD *)(a1 + 8);
        if (v12 >= *(_DWORD *)(v11 + 8))
          goto LABEL_18;
      }
      if (*(_DWORD *)(a1 + 16))
        fprintf(*v8, "Self loop for key %u\n", v12);
      (*(void (**)(_QWORD, unsigned __int8 *, _QWORD))(*(_QWORD *)(a1 + 8) + 24))(**(_QWORD **)(a1 + 8), v29, v30);
      goto LABEL_26;
    }
LABEL_18:
    is_cyclic = graph_is_cyclic(*(unsigned int **)(v10 + 16));
    v20 = *(_DWORD *)(a1 + 16);
    if (!v20 || !is_cyclic)
      break;
    fwrite("Cyclic graph generated\n", 0x17uLL, 1uLL, *v8);
LABEL_26:
    --v9;
    hash_state_destroy(**(_DWORD ***)(v3 + 32));
    **(_QWORD **)(v3 + 32) = 0;
    hash_state_destroy(*(_DWORD **)(*(_QWORD *)(v3 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) = 0;
    if (*(_DWORD *)(a1 + 16))
      fprintf(*v8, "Acyclic graph creation failure - %u iterations remaining\n", v9);
    if (!v9)
    {
      graph_destroy(*(void ***)(v3 + 16));
      return 0;
    }
  }
  if (is_cyclic)
    goto LABEL_26;
  if (v20)
    fwrite("Starting assignment step\n", 0x19uLL, 1uLL, *v8);
  v23 = malloc_type_malloc(((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1, 0x97A21AE3uLL);
  bzero(v23, ((unint64_t)*(unsigned int *)(v3 + 12) >> 3) + 1);
  free(*(void **)(v3 + 24));
  v24 = malloc_type_malloc(4 * *(unsigned int *)(v3 + 12), 0x100004052888210uLL);
  *(_QWORD *)(v3 + 24) = v24;
  if (!v24)
    chm_new_cold_1();
  v25 = *(unsigned int *)(v3 + 12);
  if ((_DWORD)v25)
  {
    for (i = 0; i < v25; ++i)
    {
      if (!((bitmask_3[i & 7] & *((_BYTE *)v23 + (i >> 3))) >> (i & 7)))
      {
        *(_DWORD *)(*(_QWORD *)(v3 + 24) + 4 * i) = 0;
        chm_traverse(v3, (uint64_t)v23, i);
        v25 = *(unsigned int *)(v3 + 12);
      }
    }
  }
  graph_destroy(*(void ***)(v3 + 16));
  free(v23);
  *(_QWORD *)(v3 + 16) = 0;
  v21 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v21 = *(_DWORD *)a1;
  v27 = (char *)malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 32) = 0;
  v28 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v27 = v28;
  v21[2] = v27;
  *((_DWORD *)v21 + 1) = v28;
  if (*(_DWORD *)(a1 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, *v8);
  return v21;
}

uint64_t chm_traverse(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  v8 = graph_neighbors_it(*(_QWORD *)(a1 + 16), a3);
  *(_BYTE *)(a2 + ((unint64_t)a3 >> 3)) |= bitmask_3[a3 & 7];
  result = graph_next_neighbor(*(_QWORD *)(a1 + 16), &v8);
  if ((_DWORD)result != -1)
  {
    v7 = result;
    do
    {
      if (!((bitmask_3[v7 & 7] & *(_BYTE *)(a2 + ((unint64_t)v7 >> 3))) >> (v7 & 7)))
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * v7) = graph_edge_id(*(_QWORD *)(a1 + 16), a3, v7)
                                                                   - *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * a3);
        chm_traverse(a1, a2, v7);
      }
      result = graph_next_neighbor(*(_QWORD *)(a1 + 16), &v8);
      v7 = result;
    }
    while ((_DWORD)result != -1);
  }
  return result;
}

uint64_t chm_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  int v5;
  unsigned int __ptr;
  void *v7;

  v7 = 0;
  v5 = 2;
  __ptr = 0;
  v3 = *(_QWORD *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  fwrite(&v5, 4uLL, 1uLL, a2);
  hash_state_dump(**(_DWORD ***)(v3 + 16), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  hash_state_dump(*(_DWORD **)(*(_QWORD *)(v3 + 16) + 8), &v7, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v7, __ptr, 1uLL, a2);
  free(v7);
  fwrite((const void *)(v3 + 4), 4uLL, 1uLL, a2);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 8), 4 * *(unsigned int *)(v3 + 4), 1uLL, a2);
  return 1;
}

size_t chm_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  unsigned int size;
  unsigned int size_4;

  size_4 = 0;
  v4 = malloc_type_malloc(0x18uLL, 0x1090040F2DB8820uLL);
  *(_QWORD *)(a2 + 16) = v4;
  fread(&size_4, 4uLL, 1uLL, a1);
  v5 = size_4;
  v6 = malloc_type_malloc(8 * (size_4 + 1), 0x2004093837F09uLL);
  v4[2] = v6;
  v6[v5] = 0;
  if ((_DWORD)v5)
  {
    v7 = 0;
    size = 0;
    v8 = 8 * v5;
    do
    {
      fread(&size, 4uLL, 1uLL, a1);
      v9 = size;
      v10 = malloc_type_malloc(size, 0xAF90B24AuLL);
      fread(v10, v9, 1uLL, a1);
      *(_QWORD *)(v4[2] + v7) = hash_state_load((const char *)v10);
      free(v10);
      v7 += 8;
    }
    while (v8 != v7);
  }
  fread((char *)v4 + 4, 4uLL, 1uLL, a1);
  fread(v4, 4uLL, 1uLL, a1);
  v11 = malloc_type_malloc(4 * *((unsigned int *)v4 + 1), 0x100004052888210uLL);
  v4[1] = v11;
  return fread(v11, 4 * *((unsigned int *)v4 + 1), 1uLL, a1);
}

uint64_t chm_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = hash(**(_DWORD ***)(v5 + 16), a2, a3) % *(_DWORD *)(v5 + 4);
  v7 = hash(*(_DWORD **)(*(_QWORD *)(v5 + 16) + 8), a2, a3);
  v8 = *(_DWORD *)(v5 + 4);
  v9 = v7 % v8;
  if (v7 % v8 + 1 < v8)
    v10 = v9 + 1;
  else
    v10 = 0;
  if (v6 != v9)
    v10 = v9;
  return (*(_DWORD *)(*(_QWORD *)(v5 + 8) + 4 * v10) + *(_DWORD *)(*(_QWORD *)(v5 + 8) + 4 * v6))
       % *(_DWORD *)v5;
}

void chm_destroy(_QWORD *a1)
{
  void **v2;

  v2 = (void **)a1[2];
  free(v2[1]);
  hash_state_destroy(*(_DWORD **)v2[2]);
  hash_state_destroy(*((_DWORD **)v2[2] + 1));
  free(v2[2]);
  free(v2);
  free(a1);
}

void *chm_pack(uint64_t a1, int *a2)
{
  uint64_t v3;
  int type;
  int *v5;
  int v6;
  _DWORD *v7;

  v3 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(**(unsigned int ***)(v3 + 16));
  *a2++ = type;
  hash_state_pack(**(_DWORD ***)(v3 + 16), a2);
  v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  v6 = hash_get_type(*(unsigned int **)(*(_QWORD *)(v3 + 16) + 8));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(*(_QWORD *)(v3 + 16) + 8), v5);
  v7 = (int *)((char *)v5 + hash_state_packed_size(v6));
  *v7 = *(_DWORD *)(v3 + 4);
  v7[1] = *(_DWORD *)v3;
  return memcpy(v7 + 2, *(const void **)(v3 + 8), 4 * *(unsigned int *)(v3 + 4));
}

uint64_t chm_packed_size(uint64_t a1)
{
  uint64_t v1;
  int type;
  int v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(**(unsigned int ***)(v1 + 16));
  v3 = hash_get_type(*(unsigned int **)(*(_QWORD *)(v1 + 16) + 8));
  v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + 4 * *(_DWORD *)(v1 + 4) + 20;
}

uint64_t chm_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  v5 = (unsigned int *)(a1 + 1);
  v6 = *a1;
  v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  v8 = *v7++;
  v9 = (unsigned int *)((char *)v7 + hash_state_packed_size(v8));
  v10 = *v9;
  v11 = v9[1];
  v12 = hash_packed(v5, v6, a2, a3) % v10;
  v13 = hash_packed(v7, v8, a2, a3);
  v14 = v13 % v10;
  if (v13 % v10 + 1 < v10)
    v15 = v14 + 1;
  else
    v15 = 0;
  if (v12 == v14)
    v14 = v15;
  return (v9[v14 + 2] + v9[v12 + 2]) % v11;
}

_QWORD *cmph_io_nlfile_adapter(FILE *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  char *v4;
  int v5;
  int v6;
  char __s[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  if (!v2)
    cmph_io_nlfile_adapter_cold_1();
  v3 = v2;
  *v2 = a1;
  rewind(a1);
  v4 = fgets(__s, 1024, a1);
  v5 = 0;
  if (feof(a1))
  {
LABEL_8:
    rewind(a1);
  }
  else
  {
    while (1)
    {
      v6 = ferror(a1);
      if (!v4 || v6)
        break;
      if (__s[strlen(__s) - 1] == 10)
        ++v5;
      v4 = fgets(__s, 1024, a1);
      if (feof(a1))
        goto LABEL_8;
    }
    perror("Error reading input file");
    v5 = 0;
  }
  *((_DWORD *)v3 + 2) = v5;
  v3[2] = key_nlfile_read;
  v3[3] = key_nlfile_dispose;
  v3[4] = key_nlfile_rewind;
  return v3;
}

uint64_t key_nlfile_read(FILE *a1, void **a2, _DWORD *a3)
{
  size_t v6;
  char *v7;
  char *v8;
  size_t v9;
  size_t v10;
  uint64_t result;
  uint64_t v12;
  char __s[1024];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  *a3 = 0;
  do
  {
    if (!fgets(__s, 1024, a1) || feof(a1))
      return 0xFFFFFFFFLL;
    v6 = strlen(__s);
    v7 = (char *)malloc_type_realloc(*a2, *a3 + v6 + 1, 0xBFEBC41AuLL);
    *a2 = v7;
    v8 = &v7[*a3];
    v9 = strlen(__s);
    memcpy(v8, __s, v9);
    v10 = strlen(__s);
    result = (*a3 + v10);
    *a3 = result;
  }
  while (__s[v10 - 1] != 10);
  if ((_DWORD)result)
  {
    v12 = (result - 1);
    if (*((_BYTE *)*a2 + v12) == 10)
    {
      *((_BYTE *)*a2 + v12) = 0;
      result = (*a3 - 1);
      *a3 = result;
    }
  }
  return result;
}

void key_nlfile_dispose(int a1, void *a2)
{
  free(a2);
}

_DWORD *cmph_io_nlnkfile_adapter(uint64_t a1, int a2)
{
  _DWORD *result;

  result = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  if (!result)
    cmph_io_nlnkfile_adapter_cold_1();
  *(_QWORD *)result = a1;
  result[2] = a2;
  *((_QWORD *)result + 2) = key_nlfile_read;
  *((_QWORD *)result + 3) = key_nlfile_dispose;
  *((_QWORD *)result + 4) = key_nlfile_rewind;
  return result;
}

_QWORD *cmph_io_byte_vector_adapter(uint64_t a1, int a2)
{
  _QWORD *result;

  result = cmph_io_vector_new(a1, a2);
  result[2] = key_byte_vector_read;
  result[3] = key_vector_dispose;
  result[4] = key_vector_rewind;
  return result;
}

_DWORD *cmph_io_vector_new(uint64_t a1, int a2)
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  v5 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  if (!v4)
    cmph_io_vector_new_cold_1();
  if (!v5)
    cmph_io_vector_new_cold_2();
  *(_QWORD *)v5 = a1;
  v5[2] = 0;
  *(_QWORD *)v4 = v5;
  v4[2] = a2;
  return v4;
}

uint64_t key_byte_vector_read(uint64_t *a1, _QWORD *a2, unsigned int *a3)
{
  uint64_t v6;
  size_t v7;
  void *v8;

  v6 = *a1;
  v7 = **(unsigned int **)(*a1 + 8 * *((unsigned int *)a1 + 2));
  *a3 = v7;
  v8 = malloc_type_malloc(v7, 0x7CFFFF5AuLL);
  *a2 = v8;
  memcpy(v8, (const void *)(*(_QWORD *)(v6 + 8 * *((unsigned int *)a1 + 2)) + 4), v7);
  ++*((_DWORD *)a1 + 2);
  return *a3;
}

void key_vector_dispose(int a1, void *a2)
{
  free(a2);
}

uint64_t key_vector_rewind(uint64_t result)
{
  *(_DWORD *)(result + 8) = 0;
  return result;
}

void cmph_io_byte_vector_adapter_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

_DWORD *cmph_io_struct_vector_adapter(uint64_t a1, int a2, int a3, int a4, int a5)
{
  _DWORD *v10;
  _DWORD *v11;

  v10 = malloc_type_malloc(0x28uLL, 0x1080040F159ABB6uLL);
  v11 = malloc_type_malloc(0x18uLL, 0x1080040468F112EuLL);
  if (!v10)
    cmph_io_struct_vector_adapter_cold_1();
  if (!v11)
    cmph_io_struct_vector_adapter_cold_2();
  *(_QWORD *)v11 = a1;
  v11[2] = 0;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = a4;
  *(_QWORD *)v10 = v11;
  v10[2] = a5;
  *((_QWORD *)v10 + 2) = key_struct_vector_read;
  *((_QWORD *)v10 + 3) = key_vector_dispose;
  *((_QWORD *)v10 + 4) = key_struct_vector_rewind;
  return v10;
}

uint64_t key_struct_vector_read(uint64_t *a1, _QWORD *a2, unsigned int *a3)
{
  uint64_t v6;
  size_t v7;
  void *v8;

  v6 = *a1;
  v7 = *((unsigned int *)a1 + 5);
  *a3 = v7;
  v8 = malloc_type_malloc(v7, 0xE391A227uLL);
  *a2 = v8;
  memcpy(v8, (const void *)(v6 + *((unsigned int *)a1 + 4) + (*((_DWORD *)a1 + 3) * *((_DWORD *)a1 + 2))), v7);
  ++*((_DWORD *)a1 + 2);
  return *a3;
}

uint64_t key_struct_vector_rewind(uint64_t result)
{
  *(_DWORD *)(result + 8) = 0;
  return result;
}

void cmph_io_struct_vector_adapter_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

_QWORD *cmph_io_vector_adapter(uint64_t a1, int a2)
{
  _QWORD *result;

  result = cmph_io_vector_new(a1, a2);
  result[2] = key_vector_read;
  result[3] = key_vector_dispose;
  result[4] = key_vector_rewind;
  return result;
}

uint64_t key_vector_read(uint64_t *a1, char **a2, unsigned int *a3)
{
  uint64_t v6;
  unsigned int v7;
  char *v8;

  v6 = *a1;
  v7 = strlen(*(const char **)(*a1 + 8 * *((unsigned int *)a1 + 2)));
  *a3 = v7;
  v8 = (char *)malloc_type_malloc(v7 + 1, 0x4CF63ABuLL);
  *a2 = v8;
  strcpy(v8, *(const char **)(v6 + 8 * *((unsigned int *)a1 + 2)));
  ++*((_DWORD *)a1 + 2);
  return *a3;
}

void cmph_io_vector_adapter_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

_QWORD *cmph_config_new(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = __config_new(a1);
  if (!v1)
    cmph_config_new_cold_1();
  v2 = v1;
  *(_DWORD *)v1 = 2;
  chm_config_new();
  v2[4] = v3;
  return v2;
}

void cmph_config_set_algo(uint64_t a1, int a2)
{
  void *v4;

  if (*(_DWORD *)a1 != a2)
  {
    switch(*(_DWORD *)a1)
    {
      case 0:
        bmz_config_destroy(a1);
        break;
      case 1:
        bmz8_config_destroy(a1);
        break;
      case 2:
        chm_config_destroy(a1);
        break;
      case 3:
        brz_config_destroy(a1);
        break;
      case 4:
        fch_config_destroy(a1);
        break;
      case 5:
        bdz_config_destroy(a1);
        break;
      case 6:
        bdz_ph_config_destroy(a1);
        break;
      case 7:
        chd_ph_config_destroy(a1);
        break;
      case 8:
        chd_config_destroy(a1);
        break;
      default:
        cmph_config_set_algo_cold_1();
    }
    switch(a2)
    {
      case 0:
        bmz_config_new();
        break;
      case 1:
        bmz8_config_new();
        break;
      case 2:
        chm_config_new();
        break;
      case 3:
        v4 = brz_config_new();
        break;
      case 4:
        fch_config_new();
        break;
      case 5:
        bdz_config_new();
        break;
      case 6:
        bdz_ph_config_new();
        break;
      case 7:
        chd_ph_config_new();
        break;
      case 8:
        v4 = chd_config_new(a1);
        break;
      default:
        cmph_config_set_algo_cold_2();
    }
    *(_QWORD *)(a1 + 32) = v4;
  }
  *(_DWORD *)a1 = a2;
}

char *cmph_config_set_tmp_dir(char *result, char *__s)
{
  if (*(_DWORD *)result == 3)
    return brz_config_set_tmp_dir(result, __s);
  return result;
}

uint64_t cmph_config_set_mphf_fd(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result == 3)
    return brz_config_set_mphf_fd(result, a2);
  return result;
}

uint64_t cmph_config_set_b(uint64_t result, int a2)
{
  switch(*(_DWORD *)result)
  {
    case 3:
      result = brz_config_set_b(result, a2);
      break;
    case 5:
      result = bdz_config_set_b(result, a2);
      break;
    case 7:
      result = chd_ph_config_set_b(result, a2);
      break;
    case 8:
      result = chd_config_set_b();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t cmph_config_set_keys_per_bin(uint64_t result, int a2)
{
  if (*(_DWORD *)result == 8)
    return chd_config_set_keys_per_bin();
  if (*(_DWORD *)result == 7)
    return chd_ph_config_set_keys_per_bin(result, a2);
  return result;
}

uint64_t cmph_config_set_memory_availability(uint64_t result, int a2)
{
  if (*(_DWORD *)result == 3)
    return brz_config_set_memory_availability(result, a2);
  return result;
}

void cmph_config_destroy(_DWORD *a1)
{
  if (a1)
  {
    switch(*a1)
    {
      case 0:
        bmz_config_destroy((uint64_t)a1);
        break;
      case 1:
        bmz8_config_destroy((uint64_t)a1);
        break;
      case 2:
        chm_config_destroy((uint64_t)a1);
        break;
      case 3:
        brz_config_destroy((uint64_t)a1);
        break;
      case 4:
        fch_config_destroy((uint64_t)a1);
        break;
      case 5:
        bdz_config_destroy((uint64_t)a1);
        break;
      case 6:
        bdz_ph_config_destroy((uint64_t)a1);
        break;
      case 7:
        chd_ph_config_destroy((uint64_t)a1);
        break;
      case 8:
        chd_config_destroy(a1);
        break;
      default:
        cmph_config_destroy_cold_1();
    }
    __config_destroy(a1);
  }
}

uint64_t cmph_config_set_verbosity(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t cmph_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  switch(*(_DWORD *)result)
  {
    case 0:
      result = bmz_config_set_hashfuncs(result, a2);
      break;
    case 1:
      result = bmz8_config_set_hashfuncs(result, a2);
      break;
    case 2:
      result = chm_config_set_hashfuncs(result, a2);
      break;
    case 3:
      result = brz_config_set_hashfuncs(result, a2);
      break;
    case 4:
      result = fch_config_set_hashfuncs(result, a2);
      break;
    case 5:
      result = bdz_config_set_hashfuncs(result, a2);
      break;
    case 6:
      result = bdz_ph_config_set_hashfuncs(result, a2);
      break;
    case 7:
      result = chd_ph_config_set_hashfuncs(result, a2);
      break;
    case 8:
      result = chd_config_set_hashfuncs();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t cmph_config_set_graphsize(uint64_t result, double a2)
{
  *(double *)(result + 24) = a2;
  return result;
}

void *cmph_new(uint64_t a1, double a2, double a3, double a4)
{
  double v5;
  void *result;
  int v7;

  v5 = *(double *)(a1 + 24);
  switch(*(_DWORD *)a1)
  {
    case 0:
      result = bmz_new(a1, *(double *)(a1 + 24));
      break;
    case 1:
      result = bmz8_new(a1, *(double *)(a1 + 24));
      break;
    case 2:
      result = chm_new(a1, *(double *)(a1 + 24));
      break;
    case 3:
      if (v5 < 2.0)
        v7 = 1;
      else
        v7 = 4;
      brz_config_set_algo(a1, v7);
      result = (void *)brz_new(a1, v5);
      break;
    case 4:
      result = fch_new(a1, *(double *)(a1 + 24));
      break;
    case 5:
      result = bdz_new(a1, *(double *)(a1 + 24));
      break;
    case 6:
      result = bdz_ph_new(a1, *(double *)(a1 + 24));
      break;
    case 7:
      result = chd_ph_new(a1, *(double *)(a1 + 24), a3, a4);
      break;
    case 8:
      result = chd_new(a1, *(double *)(a1 + 24));
      break;
    default:
      cmph_new_cold_1();
  }
  return result;
}

uint64_t cmph_dump(_DWORD *a1, FILE *a2)
{
  uint64_t result;

  switch(*a1)
  {
    case 0:
      result = bmz_dump((uint64_t)a1, a2);
      break;
    case 1:
      result = bmz8_dump((uint64_t)a1, a2);
      break;
    case 2:
      result = chm_dump((uint64_t)a1, a2);
      break;
    case 3:
      result = brz_dump((uint64_t)a1, a2);
      break;
    case 4:
      result = fch_dump((uint64_t)a1, a2);
      break;
    case 5:
      result = bdz_dump((uint64_t)a1, a2);
      break;
    case 6:
      result = bdz_ph_dump((uint64_t)a1, a2);
      break;
    case 7:
      result = chd_ph_dump((uint64_t)a1, a2);
      break;
    case 8:
      result = chd_dump((uint64_t)a1, a2);
      break;
    default:
      cmph_dump_cold_1();
  }
  return result;
}

_QWORD *cmph_load(FILE *a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = __cmph_load(a1);
  v3 = v2;
  if (v2)
  {
    switch(*(_DWORD *)v2)
    {
      case 0:
        bmz_load(a1, (uint64_t)v2);
        break;
      case 1:
        bmz8_load(a1, (uint64_t)v2);
        break;
      case 2:
        chm_load(a1, (uint64_t)v2);
        break;
      case 3:
        brz_load(a1, (uint64_t)v2);
        break;
      case 4:
        fch_load(a1, (uint64_t)v2);
        break;
      case 5:
        bdz_load(a1, (uint64_t)v2);
        break;
      case 6:
        bdz_ph_load(a1, (uint64_t)v2);
        break;
      case 7:
        chd_ph_load(a1, (uint64_t)v2);
        break;
      case 8:
        chd_load(a1, (uint64_t)v2);
        break;
      default:
        cmph_load_cold_1();
    }
  }
  return v3;
}

unint64_t cmph_search(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  unint64_t result;

  switch(*a1)
  {
    case 0:
      result = bmz_search((uint64_t)a1, a2, a3);
      break;
    case 1:
      result = bmz8_search((uint64_t)a1, a2, a3);
      break;
    case 2:
      result = chm_search((uint64_t)a1, a2, a3);
      break;
    case 3:
      result = brz_search((uint64_t)a1, a2, a3);
      break;
    case 4:
      result = fch_search((uint64_t)a1, a2, a3);
      break;
    case 5:
      result = bdz_search((uint64_t)a1, a2, a3);
      break;
    case 6:
      result = bdz_ph_search((uint64_t)a1, a2, a3);
      break;
    case 7:
      result = chd_ph_search((uint64_t)a1, a2, a3);
      break;
    case 8:
      result = chd_search((uint64_t)a1, a2, a3);
      break;
    default:
      cmph_search_cold_1();
  }
  return result;
}

uint64_t cmph_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

void cmph_destroy(_QWORD *a1)
{
  switch(*(_DWORD *)a1)
  {
    case 0:
      bmz_destroy(a1);
      break;
    case 1:
      bmz8_destroy(a1);
      break;
    case 2:
      chm_destroy(a1);
      break;
    case 3:
      brz_destroy(a1);
      break;
    case 4:
      fch_destroy(a1);
      break;
    case 5:
      bdz_destroy(a1);
      break;
    case 6:
      bdz_ph_destroy(a1);
      break;
    case 7:
      chd_ph_destroy(a1);
      break;
    case 8:
      chd_destroy(a1);
      break;
    default:
      cmph_destroy_cold_1();
  }
}

void cmph_pack(int *a1, int *a2)
{
  int v2;
  int *v3;

  v2 = *a1;
  *a2 = *a1;
  v3 = a2 + 1;
  switch(v2)
  {
    case 0:
      bmz_pack((uint64_t)a1, v3);
      break;
    case 1:
      bmz8_pack((uint64_t)a1, v3);
      break;
    case 2:
      chm_pack((uint64_t)a1, v3);
      break;
    case 3:
      brz_pack((uint64_t)a1, v3);
      break;
    case 4:
      fch_pack((uint64_t)a1, v3);
      break;
    case 5:
      bdz_pack((uint64_t)a1, v3);
      break;
    case 6:
      bdz_ph_pack((uint64_t)a1, v3);
      break;
    case 7:
      chd_ph_pack((uint64_t)a1, v3);
      break;
    case 8:
      chd_pack((uint64_t)a1, v3);
      break;
    default:
      cmph_pack_cold_1();
  }
}

uint64_t cmph_packed_size(_DWORD *a1)
{
  uint64_t result;

  switch(*a1)
  {
    case 0:
      result = bmz_packed_size((uint64_t)a1);
      break;
    case 1:
      result = bmz8_packed_size((uint64_t)a1);
      break;
    case 2:
      result = chm_packed_size((uint64_t)a1);
      break;
    case 3:
      result = brz_packed_size((uint64_t)a1);
      break;
    case 4:
      result = fch_packed_size((uint64_t)a1);
      break;
    case 5:
      result = bdz_packed_size((uint64_t)a1);
      break;
    case 6:
      result = bdz_ph_packed_size((uint64_t)a1);
      break;
    case 7:
      result = chd_ph_packed_size((uint64_t)a1);
      break;
    case 8:
      result = chd_packed_size((uint64_t)a1);
      break;
    default:
      cmph_packed_size_cold_1();
  }
  return result;
}

uint64_t cmph_search_packed(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result;

  switch(*a1)
  {
    case 0:
      result = bmz_search_packed(a1 + 1, a2, a3);
      break;
    case 1:
      result = bmz8_search_packed(a1 + 1, a2, a3);
      break;
    case 2:
      result = chm_search_packed(a1 + 1, a2, a3);
      break;
    case 3:
      result = brz_search_packed(a1 + 1, a2, a3);
      break;
    case 4:
      result = fch_search_packed(a1 + 1, a2, a3);
      break;
    case 5:
      result = bdz_search_packed(a1 + 1, a2, a3);
      break;
    case 6:
      result = bdz_ph_search_packed(a1 + 1, a2, a3);
      break;
    case 7:
      result = chd_ph_search_packed(a1 + 1, a2, a3);
      break;
    case 8:
      result = chd_search_packed(a1 + 1);
      break;
    default:
      cmph_search_packed_cold_1();
  }
  return result;
}

_QWORD *__config_new(uint64_t a1)
{
  _QWORD *result;

  result = malloc_type_malloc(0x28uLL, 0x10A0040FEEBFC31uLL);
  if (result)
  {
    result[2] = 0;
    result[3] = 0;
    *result = 0;
    result[1] = a1;
    result[4] = 0;
  }
  return result;
}

size_t __cmph_dump(unsigned int *a1, FILE *a2)
{
  const void *v3;
  const char *v4;
  size_t v5;

  v3 = a1 + 1;
  v4 = cmph_names[*a1];
  v5 = strlen(v4);
  fwrite(v4, v5 + 1, 1uLL, a2);
  return fwrite(v3, 4uLL, 1uLL, a2);
}

_QWORD *__cmph_load(FILE *__stream)
{
  char *v2;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  char __ptr[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = __ptr;
  do
  {
    if (fread(v2, 1uLL, 1uLL, __stream) != 1)
      return 0;
  }
  while (*v2++);
  v4 = 0;
  v5 = 9;
  do
  {
    if (!strcmp(__ptr, cmph_names[v4]))
      v5 = v4;
    ++v4;
  }
  while (v4 != 9);
  if (v5 == 9)
    return 0;
  v6 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v6 = v5;
  fread((char *)v6 + 4, 4uLL, 1uLL, __stream);
  v6[2] = 0;
  return v6;
}

_QWORD *compressed_rank_init(uint64_t a1)
{
  _QWORD *result;

  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  result = select_init((_QWORD *)(a1 + 16));
  *(_QWORD *)(a1 + 40) = 0;
  return result;
}

void compressed_rank_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  select_destroy(a1 + 16);
}

void compressed_rank_generate(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v5;
  unsigned int v6;
  int v7;
  BOOL v8;
  _DWORD *v9;
  _DWORD *v10;
  int v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;

  *(_DWORD *)(a1 + 4) = a3;
  v5 = *(_DWORD *)(a2 + 4 * (a3 - 1));
  *(_DWORD *)a1 = v5;
  v6 = v5 / a3;
  if (v5 / a3 < 2)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    do
    {
      ++v7;
      v8 = v6 > 3;
      v6 >>= 1;
    }
    while (v8);
  }
  *(_DWORD *)(a1 + 8) = v7;
  v9 = malloc_type_calloc(v5 >> v7, 4uLL, 0x100004052888210uLL);
  v10 = malloc_type_calloc((*(_DWORD *)(a1 + 8) * *(_DWORD *)(a1 + 4) + 31) >> 5, 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 40) = v10;
  v11 = *(_DWORD *)(a1 + 8);
  if (*(_DWORD *)(a1 + 4))
  {
    v12 = 0;
    v13 = ~(-1 << v11);
    do
    {
      v14 = *(_DWORD *)(a2 + 4 * v12) & v13;
      v15 = *(_DWORD *)(a1 + 8);
      v16 = (v15 * v12) >> 5;
      v17 = 32 - ((v15 * v12) & 0x1F);
      v10[v16] = v10[v16] & ~(v13 << (v15 * v12)) | (v14 << (v15 * v12));
      if (v17 < v15)
        v10[v16 + 1] = v10[v16 + 1] & ~(v13 >> v17) | (v14 >> v17);
      ++v12;
      v18 = *(unsigned int *)(a1 + 4);
    }
    while (v12 < v18);
    v11 = *(_DWORD *)(a1 + 8);
  }
  else
  {
    LODWORD(v18) = 0;
  }
  if (*(_DWORD *)a1 >> v11)
  {
    v19 = 0;
    v20 = 1;
    do
    {
      do
        v21 = *(_DWORD *)(a2 + 4 * v19++) >> v11;
      while (v20 > v21);
      v9[v20++ - 1] = --v19;
      v11 = *(_DWORD *)(a1 + 8);
      v22 = *(_DWORD *)a1 >> v11;
    }
    while (v20 <= v22);
    LODWORD(v18) = *(_DWORD *)(a1 + 4);
  }
  else
  {
    v22 = 0;
  }
  select_generate(a1 + 16, (uint64_t)v9, v22, v18);
  free(v9);
}

uint64_t compressed_rank_query(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;

  if (*(_DWORD *)a1 < a2)
    return *(unsigned int *)(a1 + 4);
  v5 = *(_DWORD *)(a1 + 8);
  v6 = a2 >> v5;
  if (a2 >> v5)
  {
    v7 = select_query(a1 + 16, v6 - 1) + 1;
    result = v7 - v6;
  }
  else
  {
    v7 = 0;
    result = 0;
  }
  v8 = *(_QWORD *)(a1 + 24);
  if ((bitmask32_1[v7 & 0x1F] & *(_DWORD *)(v8 + 4 * (v7 >> 5))) == 0)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 8);
    v11 = result * v10;
    v12 = v7 + 1;
    do
    {
      v13 = 32 - (v11 & 0x1F);
      v14 = *(_DWORD *)(v9 + 4 * (v11 >> 5)) >> v11;
      if (v13 < v10)
        v14 |= *(_DWORD *)(v9 + 4 * ((v11 >> 5) + 1)) << v13;
      if ((v14 & ~(-1 << v5)) >= (a2 & ~(-1 << v5)))
        break;
      result = (result + 1);
      v15 = *(_DWORD *)(v8 + 4 * (v12 >> 5));
      v16 = bitmask32_1[v12 & 0x1F];
      v11 += v10;
      ++v12;
    }
    while ((v16 & v15) == 0);
  }
  return result;
}

uint64_t compressed_rank_get_space_usage(_DWORD *a1)
{
  return select_get_space_usage(a1 + 4) + ((a1[2] * a1[1] + 31) & 0xFFFFFFE0) + 96;
}

_DWORD *compressed_rank_dump(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  const void **v6;
  int v7;
  size_t v8;
  size_t v9;
  _DWORD *result;
  size_t v11;
  void *v12;
  _DWORD __n[3];

  v6 = (const void **)(a1 + 16);
  v7 = select_packed_size((_DWORD *)(a1 + 16));
  v8 = ((*(_DWORD *)(a1 + 8) * *(_DWORD *)(a1 + 4) + 31) >> 3) & 0x1FFFFFFC;
  memset(__n, 0, sizeof(__n));
  v9 = (v7 + v8 + 16);
  *a3 = v9;
  result = malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
  *(_QWORD *)a2 = result;
  if (result)
  {
    *result = *(_DWORD *)a1;
    *(_DWORD *)(*(_QWORD *)a2 + 4) = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(*(_QWORD *)a2 + 8) = *(_DWORD *)(a1 + 8);
    select_dump(v6, (uint64_t)&__n[1], __n);
    v11 = __n[0];
    *(_DWORD *)(*(_QWORD *)a2 + 12) = __n[0];
    v12 = *(void **)&__n[1];
    memcpy((void *)(*(_QWORD *)a2 + 16), *(const void **)&__n[1], v11);
    free(v12);
    return memcpy((void *)(*(_QWORD *)a2 + (v11 + 16)), *(const void **)(a1 + 40), v8);
  }
  else
  {
    *a3 = -1;
  }
  return result;
}

void *compressed_rank_load(uint64_t a1, _DWORD *a2)
{
  int v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;

  *(_DWORD *)a1 = *a2;
  *(_DWORD *)(a1 + 4) = a2[1];
  *(_DWORD *)(a1 + 8) = a2[2];
  v4 = a2[3];
  select_load(a1 + 16, a2 + 4);
  v5 = *(void **)(a1 + 40);
  if (v5)
    free(v5);
  v6 = (v4 + 16);
  v7 = (*(_DWORD *)(a1 + 8) * *(_DWORD *)(a1 + 4) + 31) >> 5;
  v8 = malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 40) = v8;
  return memcpy(v8, (char *)a2 + v6, 4 * v7);
}

void compressed_rank_pack(uint64_t a1, void *a2)
{
  void *v3;
  _DWORD __n[3];

  if (a1)
  {
    if (a2)
    {
      memset(__n, 0, sizeof(__n));
      compressed_rank_dump(a1, (uint64_t)&__n[1], __n);
      v3 = *(void **)&__n[1];
      memcpy(a2, *(const void **)&__n[1], __n[0]);
      free(v3);
    }
  }
}

uint64_t compressed_rank_packed_size(_DWORD *a1)
{
  return select_packed_size(a1 + 4) + 4 * ((a1[2] * a1[1] + 31) >> 5) + 16;
}

uint64_t compressed_rank_query_packed(unsigned int *a1, unsigned int a2)
{
  uint64_t result;
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;

  if (*a1 < a2)
    return a1[1];
  v4 = a1 + 4;
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1 + 6;
  v8 = a2 >> v5;
  if (a2 >> v5)
  {
    v9 = select_query_packed(a1 + 4, v8 - 1) + 1;
    result = v9 - v8;
  }
  else
  {
    v9 = 0;
    result = 0;
  }
  if ((bitmask32_1[v9 & 0x1F] & v7[v9 >> 5]) == 0)
  {
    v10 = (char *)v4 + (v6 & 0xFFFFFFFC);
    v11 = result * v5;
    v12 = v9 + 1;
    do
    {
      v13 = 32 - (v11 & 0x1F);
      v14 = *(_DWORD *)&v10[4 * (v11 >> 5)] >> v11;
      if (v13 < v5)
        v14 |= *(_DWORD *)&v10[4 * (v11 >> 5) + 4] << v13;
      if ((v14 & ~(-1 << v5)) >= (a2 & ~(-1 << v5)))
        break;
      result = (result + 1);
      v15 = v7[v12 >> 5];
      v16 = bitmask32_1[v12 & 0x1F];
      v11 += v5;
      ++v12;
    }
    while ((v16 & v15) == 0);
  }
  return result;
}

_QWORD *compressed_seq_init(uint64_t a1)
{
  _QWORD *result;

  result = select_init((_QWORD *)(a1 + 16));
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  return result;
}

void compressed_seq_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 48));
  *(_QWORD *)(a1 + 48) = 0;
  free(*(void **)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  select_destroy(a1 + 16);
}

void compressed_seq_generate(unsigned int *a1, uint64_t a2, size_t count)
{
  unsigned int v3;
  _DWORD *v6;
  _DWORD *v7;
  unint64_t v8;
  int v9;
  unsigned int v10;
  int v11;
  BOOL v12;
  void *v13;
  _DWORD *v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  void *v25;
  _DWORD *v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;

  v3 = count;
  v6 = malloc_type_calloc(count, 4uLL, 0x100004052888210uLL);
  v7 = v6;
  *a1 = v3;
  a1[2] = 0;
  if (v3)
  {
    v8 = 0;
    do
    {
      v9 = *(_DWORD *)(a2 + 4 * v8);
      if (v9)
      {
        v10 = v9 + 1;
        if ((v9 + 1) < 2)
        {
          v11 = 0;
        }
        else
        {
          v11 = 0;
          do
          {
            ++v11;
            v12 = v10 > 3;
            v10 >>= 1;
          }
          while (v12);
        }
        v6[v8] = v11;
        a1[2] += v11;
      }
      else
      {
        v6[v8] = 0;
      }
      ++v8;
    }
    while (v8 < *a1);
  }
  v13 = (void *)*((_QWORD *)a1 + 6);
  if (v13)
    free(v13);
  v14 = malloc_type_calloc((a1[2] + 31) >> 5, 4uLL, 0x100004052888210uLL);
  *((_QWORD *)a1 + 6) = v14;
  a1[2] = 0;
  v15 = *a1;
  if (*a1)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = *(_DWORD *)(a2 + 4 * v17);
      if (v18)
      {
        v19 = v7[v17];
        v20 = v18 + (-1 << v19) + 1;
        v21 = 32 - (v16 & 0x1F);
        v22 = ~(-1 << v19);
        v14[v16 >> 5] = v14[v16 >> 5] & ~(v22 << v16) | (v20 << v16);
        if (v21 < v19)
          v14[(v16 >> 5) + 1] = v14[(v16 >> 5) + 1] & ~(v22 >> v21) | (v20 >> v21);
        v16 = a1[2] + v7[v17];
        a1[2] = v16;
        v15 = *a1;
      }
      ++v17;
    }
    while (v17 < v15);
  }
  else
  {
    v16 = 0;
  }
  v23 = v16 / v15;
  if (v16 / v15 < 2)
  {
    v24 = 1;
  }
  else
  {
    v24 = 0;
    do
    {
      ++v24;
      v12 = v23 > 3;
      v23 >>= 1;
    }
    while (v12);
  }
  a1[1] = v24;
  v25 = (void *)*((_QWORD *)a1 + 5);
  if (v25)
  {
    free(v25);
    v15 = *a1;
    v24 = a1[1];
  }
  v26 = malloc_type_calloc((v24 * v15 + 31) >> 5, 4uLL, 0x100004052888210uLL);
  *((_QWORD *)a1 + 5) = v26;
  a1[2] = 0;
  if (*a1)
  {
    v27 = 0;
    v28 = ~(-1 << a1[1]);
    do
    {
      v29 = a1[1];
      v30 = a1[2] + v7[v27];
      a1[2] = v30;
      v31 = v30 & v28;
      v32 = (v29 * v27) >> 5;
      v33 = 32 - ((v29 * v27) & 0x1F);
      v26[v32] = v26[v32] & ~(v28 << (v29 * v27)) | (v31 << (v29 * v27));
      if (v33 < v29)
        v26[v32 + 1] = v26[v32 + 1] & ~(v28 >> v33) | (v31 >> v33);
      v7[v27++] = a1[2] >> a1[1];
    }
    while (v27 < *a1);
  }
  select_init((_QWORD *)a1 + 2);
  select_generate((uint64_t)(a1 + 4), (uint64_t)v7, *a1, a1[2] >> a1[1]);
  free(v7);
}

uint64_t compressed_seq_get_space_usage(_DWORD *a1)
{
  return select_get_space_usage(a1 + 4)
       + ((a1[2] + 31) & 0xFFFFFFE0)
       + ((a1[1] * *a1 + 31) & 0xFFFFFFE0)
       + 128;
}

uint64_t compressed_seq_query(uint64_t a1, unsigned int a2)
{
  int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  int query;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  uint64_t v22;
  unsigned int v23;
  int v24;

  if (*(_DWORD *)a1 <= a2)
    compressed_seq_query_cold_1();
  v4 = ~(-1 << *(_DWORD *)(a1 + 4));
  v5 = a1 + 16;
  if (a2)
  {
    v6 = a2 - 1;
    v7 = select_query(a1 + 16, a2 - 1);
    v8 = *(_DWORD *)(a1 + 4);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (v8 * v6) >> 5;
    v11 = 32 - ((v8 * v6) & 0x1F);
    v12 = *(_DWORD *)(v9 + 4 * v10) >> (v8 * v6);
    if (v11 < v8)
      v12 |= *(_DWORD *)(v9 + 4 * (v10 + 1)) << v11;
    v13 = (v12 & v4) + ((v7 - v6) << v8);
    query = select_next_query(v5, v7);
  }
  else
  {
    query = select_query(a1 + 16, 0);
    v13 = 0;
  }
  v15 = *(_DWORD *)(a1 + 4);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = (v15 * a2) >> 5;
  v18 = 32 - ((v15 * a2) & 0x1F);
  v19 = *(_DWORD *)(v16 + 4 * v17) >> (v15 * a2);
  if (v18 < v15)
    v19 |= *(_DWORD *)(v16 + 4 * (v17 + 1)) << v18;
  v20 = (v19 & v4) + ((query - a2) << v15) - v13;
  if (!v20)
    return 0;
  v22 = *(_QWORD *)(a1 + 48);
  v23 = 32 - (v13 & 0x1F);
  v24 = *(_DWORD *)(v22 + 4 * (v13 >> 5)) >> v13;
  if (v23 < v20)
    v24 |= *(_DWORD *)(v22 + 4 * ((v13 >> 5) + 1)) << v23;
  return (v24 & ~(-1 << v20)) + ~(-1 << v20);
}

_DWORD *compressed_seq_dump(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  const void **v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;
  _DWORD *result;
  size_t v12;
  void *v13;
  uint64_t v14;
  _DWORD __n[3];

  v6 = (const void **)(a1 + 16);
  v7 = select_packed_size((_DWORD *)(a1 + 16));
  v8 = ((*(_DWORD *)(a1 + 4) * *(_DWORD *)a1 + 31) >> 3) & 0x1FFFFFFC;
  v9 = ((*(_DWORD *)(a1 + 8) + 31) >> 3) & 0x1FFFFFFC;
  memset(__n, 0, sizeof(__n));
  v10 = (v7 + v9 + v8 + 16);
  *a3 = v10;
  result = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
  *(_QWORD *)a2 = result;
  if (result)
  {
    *result = *(_DWORD *)a1;
    *(_DWORD *)(*(_QWORD *)a2 + 4) = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(*(_QWORD *)a2 + 8) = *(_DWORD *)(a1 + 8);
    select_dump(v6, (uint64_t)&__n[1], __n);
    v12 = __n[0];
    *(_DWORD *)(*(_QWORD *)a2 + 12) = __n[0];
    v13 = *(void **)&__n[1];
    memcpy((void *)(*(_QWORD *)a2 + 16), *(const void **)&__n[1], v12);
    v14 = (v12 + 16);
    free(v13);
    memcpy((void *)(*(_QWORD *)a2 + v14), *(const void **)(a1 + 40), v8);
    return memcpy((void *)(*(_QWORD *)a2 + (v14 + v8)), *(const void **)(a1 + 48), v9);
  }
  else
  {
    *a3 = -1;
  }
  return result;
}

void *compressed_seq_load(uint64_t a1, _DWORD *a2)
{
  int v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  size_t v9;
  int v10;
  void *v11;
  size_t v12;
  void *v13;

  *(_DWORD *)a1 = *a2;
  *(_DWORD *)(a1 + 4) = a2[1];
  *(_DWORD *)(a1 + 8) = a2[2];
  v4 = a2[3];
  select_load(a1 + 16, a2 + 4);
  v5 = v4 + 16;
  v6 = *(void **)(a1 + 40);
  if (v6)
    free(v6);
  v7 = (*(_DWORD *)(a1 + 4) * *(_DWORD *)a1 + 31) >> 5;
  v8 = malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 40) = v8;
  v9 = 4 * v7;
  memcpy(v8, (char *)a2 + v5, v9);
  v10 = *(_DWORD *)(a1 + 8);
  v11 = *(void **)(a1 + 48);
  if (v11)
    free(v11);
  v12 = (v10 + 31) >> 5;
  v13 = malloc_type_calloc(v12, 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 48) = v13;
  return memcpy(v13, (char *)a2 + v9 + v5, (4 * v12));
}

void compressed_seq_pack(uint64_t a1, void *a2)
{
  void *v3;
  _DWORD __n[3];

  if (a1)
  {
    if (a2)
    {
      memset(__n, 0, sizeof(__n));
      compressed_seq_dump(a1, (uint64_t)&__n[1], __n);
      v3 = *(void **)&__n[1];
      memcpy(a2, *(const void **)&__n[1], __n[0]);
      free(v3);
    }
  }
}

uint64_t compressed_seq_packed_size(_DWORD *a1)
{
  return select_packed_size(a1 + 4)
       + 4 * ((a1[2] + 31) >> 5)
       + 4 * ((a1[1] * *a1 + 31) >> 5)
       + 16;
}

uint64_t compressed_seq_query_packed(int *a1, int a2)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int packed;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  int query_packed;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  uint64_t v20;
  unsigned int v21;
  int v22;

  v3 = *a1;
  v4 = a1[1];
  v5 = (uint64_t)(a1 + 4);
  v6 = (uint64_t)a1 + (a1[3] & 0xFFFFFFFC) + 16;
  v7 = ~(-1 << v4);
  if (a2)
  {
    v8 = a2 - 1;
    packed = select_query_packed(a1 + 4, a2 - 1);
    v10 = (v4 * v8) >> 5;
    v11 = 32 - ((v4 * v8) & 0x1F);
    v12 = *(_DWORD *)(v6 + 4 * v10) >> (v4 * v8);
    if (v11 < v4)
      v12 |= *(_DWORD *)(v6 + 4 * (v10 + 1)) << v11;
    v13 = (v12 & v7) + ((packed - v8) << v4);
    query_packed = select_next_query_packed(v5, packed);
  }
  else
  {
    query_packed = select_query_packed(a1 + 4, 0);
    v13 = 0;
  }
  v15 = (v4 * a2) >> 5;
  v16 = 32 - ((v4 * a2) & 0x1F);
  v17 = *(_DWORD *)(v6 + 4 * v15) >> (v4 * a2);
  if (v16 < v4)
    v17 |= *(_DWORD *)(v6 + 4 * (v15 + 1)) << v16;
  v18 = (v17 & v7) + ((query_packed - a2) << v4) - v13;
  if (!v18)
    return 0;
  v20 = v6 + 4 * ((v4 * v3 + 31) >> 5);
  v21 = 32 - (v13 & 0x1F);
  v22 = *(_DWORD *)(v20 + 4 * (v13 >> 5)) >> v13;
  if (v21 < v18)
    v22 |= *(_DWORD *)(v20 + 4 * ((v13 >> 5) + 1)) << v21;
  return (v22 & ~(-1 << v18)) + ~(-1 << v18);
}

double fch_config_new()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x48uLL, 0x1030040D598EF6FuLL);
  if (v0)
  {
    v0[8] = 0;
    result = 0.0;
    *((_OWORD *)v0 + 2) = 0u;
    *((_OWORD *)v0 + 3) = 0u;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void fch_config_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

uint64_t fch_config_set_hashfuncs(uint64_t result, _DWORD *a2)
{
  _DWORD *v2;
  int v3;

  if (*a2 != 1)
  {
    v2 = *(_DWORD **)(result + 32);
    *v2 = *a2;
    v3 = a2[1];
    if (v3 != 1)
      v2[1] = v3;
  }
  return result;
}

uint64_t mixh10h11h12(unsigned int a1, unsigned int a2, double a3, double a4)
{
  unsigned int v4;
  uint64_t result;

  v4 = a4;
  if ((double)a2 < a3)
    return a2 % v4;
  result = a2 % a1;
  if ((double)result < a4)
    return result + v4;
  return result;
}

unsigned int fch_calc_b(unsigned int a1, double a2)
{
  return vcvtpd_u64_f64((double)a1 * a2 / (log((double)a1) / 0.693147181 + 1.0));
}

double fch_calc_p1(unsigned int a1)
{
  return ceil((double)a1 * 0.55);
}

double fch_calc_p2(unsigned int a1)
{
  return ceil((double)a1 * 0.3);
}

_QWORD *fch_new(uint64_t a1, double a2)
{
  uint64_t v2;
  unsigned int *v3;
  _DWORD *indexes_sorted_by_size;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  unsigned int v10;
  float64x2_t v11;
  unsigned int v12;
  unsigned int v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  int *v17;
  _DWORD *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  int *v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  unint64_t v26;
  unsigned int v27;
  _DWORD *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  int size;
  unsigned int v34;
  unsigned __int8 *key;
  unsigned int keylength;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  void *v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  unsigned __int8 *v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  unsigned int v54;
  unsigned __int8 *v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  unsigned int v61;
  int v62;
  _QWORD *v63;
  char *v64;
  __int128 v65;
  __int128 v66;
  int v67;
  int v70;
  int nbuckets;
  unsigned int v72;
  unsigned int v73;
  int v74;
  uint64_t v75;
  unsigned int v76;
  _DWORD *v77;
  double v78;
  uint64_t *v79;
  unsigned __int8 *v80;
  unsigned int v81[3];

  v2 = a1;
  v3 = 0;
  indexes_sorted_by_size = 0;
  v5 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v5 + 8) = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8);
  if (a2 <= 2.0)
    a2 = 2.6;
  *(double *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 64) = 0;
  *(_QWORD *)(v5 + 48) = 0;
  v6 = 100;
  do
  {
    if (*(_DWORD *)(v2 + 16))
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Entering mapping step for mph creation of %u keys\n", *(_DWORD *)(v5 + 8));
    if (v3)
      fch_buckets_destroy((uint64_t)v3);
    v7 = *(_QWORD *)(v2 + 32);
    v8 = *(_DWORD **)(v7 + 56);
    if (v8)
      hash_state_destroy(v8);
    *(_QWORD *)(v7 + 56) = hash_state_new(*(_DWORD *)v7, *(_DWORD *)(v7 + 8));
    LODWORD(v9) = *(_DWORD *)(v7 + 8);
    v78 = (double)v9;
    v10 = vcvtpd_u64_f64(*(double *)(v7 + 16) * (double)v9 / (log((double)v9) / 0.693147181 + 1.0));
    *(_DWORD *)(v7 + 24) = v10;
    v11.f64[0] = v78;
    v11.f64[1] = (double)v10;
    *(float64x2_t *)(v7 + 32) = vrndpq_f64(vmulq_f64(v11, (float64x2_t)xmmword_2084C45C0));
    v3 = fch_buckets_new(v10);
    (*(void (**)(_QWORD))(*(_QWORD *)(v2 + 8) + 32))(**(_QWORD **)(v2 + 8));
    if (*(_DWORD *)(v7 + 8))
    {
      v12 = 0;
      do
      {
        v81[0] = 0;
        v80 = 0;
        (*(void (**)(_QWORD, unsigned __int8 **, unsigned int *))(*(_QWORD *)(v2 + 8) + 16))(**(_QWORD **)(v2 + 8), &v80, v81);
        v13 = hash(*(_DWORD **)(v7 + 56), v80, v81[0]) % *(_DWORD *)(v7 + 8);
        v14 = *(double *)(v7 + 40);
        v15 = v14;
        if (*(double *)(v7 + 32) <= (double)v13)
        {
          v16 = v13 % *(_DWORD *)(v7 + 24);
          if (v14 > (double)v16)
            v16 += v15;
        }
        else
        {
          v16 = v13 % v15;
        }
        fch_buckets_insert(v3, v16, (uint64_t)v80, v81[0]);
        ++v12;
      }
      while (v12 < *(_DWORD *)(v7 + 8));
    }
    if (*(_DWORD *)(v2 + 16))
      fwrite("Starting ordering step\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    if (indexes_sorted_by_size)
      free(indexes_sorted_by_size);
    v70 = v6;
    indexes_sorted_by_size = fch_buckets_get_indexes_sorted_by_size(v3);
    if (*(_DWORD *)(v2 + 16))
      fwrite("Starting searching step.\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    v17 = (int *)malloc_type_calloc(*(unsigned int *)(v5 + 8), 4uLL, 0x100004052888210uLL);
    v18 = malloc_type_calloc(*(unsigned int *)(v5 + 8), 4uLL, 0x100004052888210uLL);
    nbuckets = fch_buckets_get_nbuckets((uint64_t)v3);
    v19 = *(void **)(v5 + 48);
    if (v19)
      free(v19);
    *(_QWORD *)(v5 + 48) = malloc_type_calloc(*(unsigned int *)(v5 + 24), 4uLL, 0x100004052888210uLL);
    v77 = v18;
    if (*(_DWORD *)(v5 + 8))
    {
      v20 = 0;
      do
      {
        v17[v20] = v20;
        ++v20;
        v21 = *(unsigned int *)(v5 + 8);
      }
      while (v20 < v21);
      if ((_DWORD)v21)
      {
        v22 = v17;
        v23 = *(unsigned int *)(v5 + 8);
        do
        {
          v24 = rand();
          v25 = *v22;
          *v22++ = v17[v24 % v21];
          v17[v24 % v21] = v25;
          --v23;
        }
        while (v23);
        if (*(_DWORD *)(v5 + 8))
        {
          v26 = 0;
          do
          {
            v77[v17[v26]] = v26;
            ++v26;
          }
          while (v26 < *(unsigned int *)(v5 + 8));
        }
      }
    }
    v27 = 0;
    v72 = 0;
    v79 = (uint64_t *)v3;
    while (1)
    {
      v73 = v27;
      v28 = *(_DWORD **)(v5 + 64);
      if (v28)
        hash_state_destroy(v28);
      *(_QWORD *)(v5 + 64) = hash_state_new(*(_DWORD *)(v5 + 4), *(_DWORD *)(v5 + 8));
      v29 = malloc_type_calloc(*(unsigned int *)(v5 + 8), 1uLL, 0x100004077774924uLL);
      v30 = fch_buckets_get_nbuckets((uint64_t)v3);
      if (v30)
      {
        v32 = 0;
        v75 = v30;
        while (1)
        {
          size = fch_buckets_get_size((uint64_t)v79, indexes_sorted_by_size[v32], v31);
          bzero(v29, *(unsigned int *)(v5 + 8));
          if (size)
            break;
LABEL_43:
          if (++v32 == v75)
            goto LABEL_44;
        }
        v34 = 0;
        while (1)
        {
          key = (unsigned __int8 *)fch_buckets_get_key(v79, indexes_sorted_by_size[v32], v34);
          keylength = fch_buckets_get_keylength(v79, indexes_sorted_by_size[v32], v34);
          v37 = hash(*(_DWORD **)(v5 + 64), key, keylength) % *(_DWORD *)(v5 + 8);
          if (*((_BYTE *)v29 + v37))
            break;
          *((_BYTE *)v29 + v37) = 1;
          if (size == ++v34)
            goto LABEL_43;
        }
        free(v29);
        v27 = v73 + 1;
        v41 = v77;
        v3 = (unsigned int *)v79;
        goto LABEL_61;
      }
LABEL_44:
      free(v29);
      if (!nbuckets)
        break;
      v39 = 0;
      v40 = 0;
      ++v72;
      v41 = v77;
      v3 = (unsigned int *)v79;
      while (2)
      {
        v42 = fch_buckets_get_size((uint64_t)v3, indexes_sorted_by_size[v39], v38);
        if (!v42)
          goto LABEL_65;
        if (*(_DWORD *)(v5 + 8) != v40)
        {
          v43 = v42;
          v44 = 0;
          LODWORD(v45) = indexes_sorted_by_size[v39];
          v76 = v42 - 1;
LABEL_49:
          v46 = (unsigned __int8 *)fch_buckets_get_key((uint64_t *)v3, v45, 0);
          v47 = fch_buckets_get_keylength((uint64_t *)v3, indexes_sorted_by_size[v39], 0);
          v48 = hash(*(_DWORD **)(v5 + 64), v46, v47);
          v49 = 0;
          v74 = v44;
          v50 = (*(_DWORD *)(v5 + 8) + v17[v44 + v40] + v48 / *(_DWORD *)(v5 + 8) * *(_DWORD *)(v5 + 8) - v48)
              % *(_DWORD *)(v5 + 8);
          v51 = v5;
          *(_DWORD *)(*(_QWORD *)(v5 + 48) + 4 * indexes_sorted_by_size[v39]) = v50;
          do
          {
            v52 = v40 + v49;
            v53 = fch_buckets_get_key((uint64_t *)v3, indexes_sorted_by_size[v39], v49);
            v54 = fch_buckets_get_keylength((uint64_t *)v3, indexes_sorted_by_size[v39], v49);
            v55 = (unsigned __int8 *)v53;
            v41 = v77;
            v56 = hash(*(_DWORD **)(v51 + 64), v55, v54);
            v57 = *(_DWORD *)(v51 + 8);
            v45 = indexes_sorted_by_size[v39];
            v58 = v77[(*(_DWORD *)(*(_QWORD *)(v51 + 48) + 4 * v45) + v56 % v57) % v57];
            if (v58 < v40 + v49)
            {
              v5 = v51;
              v44 = v74 + 1;
              v3 = (unsigned int *)v79;
              if (v74 + 1 < v57 - v40)
                goto LABEL_49;
              v27 = 0;
              goto LABEL_61;
            }
            v59 = v17[v58];
            v17[v58] = v17[v52];
            v17[v52] = v59;
            v77[v17[v58]] = v58;
            v77[v17[v52]] = v52;
            v60 = v49 + 1;
            if (v76 == v49)
              v61 = 0;
            else
              v61 = v49 + 1;
            ++v49;
            v3 = (unsigned int *)v79;
          }
          while (v61 % v43);
          ++v39;
          v40 += v60;
          v5 = v51;
          if (v39 != nbuckets)
            continue;
LABEL_65:
          v62 = 0;
          goto LABEL_66;
        }
        break;
      }
      v27 = 0;
LABEL_61:
      v62 = 1;
      if (v72 > 9 || v27 >= 0x3E8)
        goto LABEL_66;
    }
    v62 = 0;
    v41 = v77;
    v3 = (unsigned int *)v79;
LABEL_66:
    free(v41);
    free(v17);
    v6 = v70 - 1;
    v2 = a1;
  }
  while (v62 && v70 != 1);
  if (v3)
    fch_buckets_destroy((uint64_t)v3);
  if (indexes_sorted_by_size)
    free(indexes_sorted_by_size);
  if (v70 == 1)
    return 0;
  v63 = malloc_type_malloc(0x18uLL, 0x10A0040B7BF8CC9uLL);
  *(_DWORD *)v63 = *(_DWORD *)a1;
  v64 = (char *)malloc_type_malloc(0x40uLL, 0x1030040C682B652uLL);
  v66 = *(_OWORD *)(v5 + 32);
  v65 = *(_OWORD *)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0;
  *(_OWORD *)(v64 + 40) = v65;
  *((_QWORD *)v64 + 7) = *(_QWORD *)(v5 + 64);
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 64) = 0;
  *(_OWORD *)(v64 + 24) = v66;
  *((_DWORD *)v64 + 4) = *(_DWORD *)(v5 + 24);
  *((_QWORD *)v64 + 1) = *(_QWORD *)(v5 + 16);
  v67 = *(_DWORD *)(v5 + 8);
  *(_DWORD *)v64 = v67;
  v63[2] = v64;
  *((_DWORD *)v63 + 1) = v67;
  if (*(_DWORD *)(a1 + 16))
    fwrite("Successfully generated minimal perfect hash function\n", 0x35uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  return v63;
}

uint64_t fch_dump(uint64_t a1, FILE *a2)
{
  uint64_t v3;
  unsigned int __ptr;
  void *v6;

  v6 = 0;
  __ptr = 0;
  v3 = *(_QWORD *)(a1 + 16);
  __cmph_dump((unsigned int *)a1, a2);
  hash_state_dump(*(_DWORD **)(v3 + 48), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  hash_state_dump(*(_DWORD **)(v3 + 56), &v6, &__ptr);
  fwrite(&__ptr, 4uLL, 1uLL, a2);
  fwrite(v6, __ptr, 1uLL, a2);
  free(v6);
  fwrite((const void *)v3, 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 8), 8uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 16), 4uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 24), 8uLL, 1uLL, a2);
  fwrite((const void *)(v3 + 32), 8uLL, 1uLL, a2);
  fwrite(*(const void **)(v3 + 40), 4 * *(unsigned int *)(v3 + 16), 1uLL, a2);
  return 1;
}

size_t fch_load(FILE *a1, uint64_t a2)
{
  _QWORD *v4;
  size_t v5;
  void *v6;
  size_t v7;
  void *v8;
  void *v9;
  unsigned int __ptr;

  __ptr = 0;
  v4 = malloc_type_malloc(0x40uLL, 0x1030040C682B652uLL);
  *(_QWORD *)(a2 + 16) = v4;
  v4[6] = 0;
  fread(&__ptr, 4uLL, 1uLL, a1);
  v5 = __ptr;
  v6 = malloc_type_malloc(__ptr, 0xEFEF8821uLL);
  fread(v6, v5, 1uLL, a1);
  v4[6] = hash_state_load((const char *)v6);
  free(v6);
  *(_QWORD *)(a2 + 16) = v4;
  v4[7] = 0;
  fread(&__ptr, 4uLL, 1uLL, a1);
  v7 = __ptr;
  v8 = malloc_type_malloc(__ptr, 0x2D20F13BuLL);
  fread(v8, v7, 1uLL, a1);
  v4[7] = hash_state_load((const char *)v8);
  free(v8);
  fread(v4, 4uLL, 1uLL, a1);
  fread(v4 + 1, 8uLL, 1uLL, a1);
  fread(v4 + 2, 4uLL, 1uLL, a1);
  fread(v4 + 3, 8uLL, 1uLL, a1);
  fread(v4 + 4, 8uLL, 1uLL, a1);
  v9 = malloc_type_malloc(4 * *((unsigned int *)v4 + 4), 0x100004052888210uLL);
  v4[5] = v9;
  return fread(v9, 4 * *((unsigned int *)v4 + 4), 1uLL, a1);
}

uint64_t fch_search(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  double v8;
  unsigned int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = hash(*(_DWORD **)(v5 + 48), a2, a3) % *(_DWORD *)v5;
  v7 = hash(*(_DWORD **)(v5 + 56), a2, a3);
  v8 = *(double *)(v5 + 32);
  v9 = v8;
  if (*(double *)(v5 + 24) <= (double)v6)
  {
    v10 = v6 % *(_DWORD *)(v5 + 16);
    if (v8 > (double)v10)
      v10 += v9;
  }
  else
  {
    v10 = v6 % v9;
  }
  return (*(_DWORD *)(*(_QWORD *)(v5 + 40) + 4 * v10) + v7 % *(_DWORD *)v5) % *(_DWORD *)v5;
}

void fch_destroy(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[2];
  free(*(void **)(v2 + 40));
  hash_state_destroy(*(_DWORD **)(v2 + 48));
  hash_state_destroy(*(_DWORD **)(v2 + 56));
  free((void *)v2);
  free(a1);
}

void *fch_pack(uint64_t a1, int *a2)
{
  uint64_t v3;
  int type;
  int *v5;
  int v6;
  char *v7;

  v3 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v3 + 48));
  *a2++ = type;
  hash_state_pack(*(_DWORD **)(v3 + 48), a2);
  v5 = (int *)((char *)a2 + hash_state_packed_size(type));
  v6 = hash_get_type(*(unsigned int **)(v3 + 56));
  *v5++ = v6;
  hash_state_pack(*(_DWORD **)(v3 + 56), v5);
  v7 = (char *)v5 + hash_state_packed_size(v6);
  *(_DWORD *)v7 = *(_DWORD *)v3;
  *((_DWORD *)v7 + 1) = *(_DWORD *)(v3 + 16);
  *(uint64x2_t *)(v7 + 8) = vcvtq_u64_f64(*(float64x2_t *)(v3 + 24));
  return memcpy(v7 + 24, *(const void **)(v3 + 40), 4 * *(unsigned int *)(v3 + 16));
}

uint64_t fch_packed_size(uint64_t a1)
{
  uint64_t v1;
  int type;
  int v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  type = hash_get_type(*(unsigned int **)(v1 + 48));
  v3 = hash_get_type(*(unsigned int **)(v1 + 56));
  v4 = hash_state_packed_size(type);
  return v4 + hash_state_packed_size(v3) + 4 * *(_DWORD *)(v1 + 16) + 36;
}

uint64_t fch_search_packed(int *a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  int v8;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;

  v5 = (unsigned int *)(a1 + 1);
  v6 = *a1;
  v7 = (unsigned int *)((char *)a1 + hash_state_packed_size(*a1) + 4);
  v8 = *v7++;
  v9 = (char *)v7 + hash_state_packed_size(v8);
  v10 = *(_DWORD *)v9;
  v11 = *((_DWORD *)v9 + 1);
  v12 = (double)*((unint64_t *)v9 + 1);
  v13 = *((_QWORD *)v9 + 2);
  v14 = hash_packed(v5, v6, a2, a3) % v10;
  v15 = hash_packed(v7, v8, a2, a3);
  if ((double)v14 >= v12)
  {
    v16 = v14 % v11;
    if ((double)(v14 % v11) < (double)v13)
      v16 += v13;
  }
  else
  {
    v16 = v14 % v13;
  }
  return (*(_DWORD *)&v9[4 * v16 + 24] + v15 % v10) % v10;
}

_DWORD *fch_buckets_new(unsigned int a1)
{
  _DWORD *v2;
  char *v3;
  uint64_t v4;
  char *v5;

  v2 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  if (v2)
  {
    v3 = (char *)malloc_type_calloc(a1, 0x10uLL, 0x1020040EDED9539uLL);
    *(_QWORD *)v2 = v3;
    if (a1)
    {
      v4 = 0;
      do
      {
        if (!v3)
          fch_buckets_new_cold_2();
        v5 = &v3[v4];
        *(_QWORD *)v5 = 0;
        *((_QWORD *)v5 + 1) = 0;
        v3 = *(char **)v2;
        v4 += 16;
      }
      while (16 * a1 != v4);
    }
    if (!v3)
      fch_buckets_new_cold_1();
    v2[2] = a1;
    v2[3] = 0;
  }
  return v2;
}

BOOL fch_buckets_is_empty(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 8) <= a2)
    fch_buckets_is_empty_cold_2();
  if (!*(_QWORD *)a1)
    fch_buckets_is_empty_cold_1();
  return *(_DWORD *)(*(_QWORD *)a1 + 16 * a2 + 12) == 0;
}

_DWORD *fch_buckets_insert(_DWORD *result, unsigned int a2, uint64_t a3, int a4)
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  void **v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  char *v22;
  uint64_t v23;
  unsigned int v24;

  if (result[2] <= a2)
    fch_buckets_insert_cold_4();
  v4 = result;
  v5 = *(_QWORD *)result;
  if (!*(_QWORD *)result)
    fch_buckets_insert_cold_1();
  v8 = a2;
  v9 = v5 + 16 * a2;
  v12 = *(_DWORD *)(v9 + 12);
  v11 = (unsigned int *)(v9 + 12);
  v10 = v12;
  v13 = (void **)(v5 + 16 * a2);
  v14 = v12 + 1;
  v15 = *(v11 - 1);
  if (v15 >= v12 + 1)
  {
    v23 = (uint64_t)*v13 + 16 * v10;
    *(_QWORD *)v23 = a3;
    *(_DWORD *)(v23 + 8) = a4;
    *v11 = v14;
  }
  else
  {
    v16 = v15 + 1;
    do
    {
      v17 = v16;
      v16 *= 2;
    }
    while (v17 < v14);
    result = malloc_type_realloc(*v13, 16 * v17, 0x1010040A1D9428BuLL);
    *v13 = result;
    if (!result)
      fch_buckets_insert_cold_2();
    *(v11 - 1) = v17;
    v20 = *v11;
    v21 = v20 + 1;
    v5 = *(_QWORD *)v4;
    v22 = (char *)&result[4 * v20];
    *(_QWORD *)v22 = a3;
    *((_DWORD *)v22 + 2) = a4;
    *v11 = v21;
    if (!v5)
      fch_buckets_insert_cold_3((uint64_t)result, v18, v19);
  }
  v24 = *(_DWORD *)(v5 + 16 * v8 + 12);
  if (v24 > v4[3])
    v4[3] = v24;
  return result;
}

uint64_t fch_buckets_get_size(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8) <= a2)
    fch_buckets_get_size_cold_2();
  if (!*(_QWORD *)a1)
    fch_buckets_insert_cold_3(a1, a2, a3);
  return *(unsigned int *)(*(_QWORD *)a1 + 16 * a2 + 12);
}

uint64_t fch_buckets_get_key(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (*((_DWORD *)a1 + 2) <= a2)
    fch_buckets_get_key_cold_3();
  v3 = *a1;
  if (!*a1)
    fch_buckets_get_key_cold_1();
  if (*(_DWORD *)(v3 + 16 * a2 + 12) <= a3)
    fch_buckets_get_key_cold_2();
  return *(_QWORD *)(*(_QWORD *)(v3 + 16 * a2) + 16 * a3);
}

uint64_t fch_buckets_get_keylength(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (*((_DWORD *)a1 + 2) <= a2)
    fch_buckets_get_keylength_cold_3();
  v3 = *a1;
  if (!*a1)
    fch_buckets_get_keylength_cold_1();
  if (*(_DWORD *)(v3 + 16 * a2 + 12) <= a3)
    fch_buckets_get_keylength_cold_2();
  return *(unsigned int *)(*(_QWORD *)(v3 + 16 * a2) + 16 * a3 + 8);
}

uint64_t fch_buckets_get_max_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t fch_buckets_get_nbuckets(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

_DWORD *fch_buckets_get_indexes_sorted_by_size(unsigned int *a1)
{
  _DWORD *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  int *v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  int v17;

  v2 = malloc_type_calloc(a1[3] + 1, 4uLL, 0x100004052888210uLL);
  v3 = malloc_type_calloc(a1[2], 4uLL, 0x100004052888210uLL);
  v6 = v3;
  if ((int)a1[2] >= 1)
  {
    if (!*(_QWORD *)a1)
      fch_buckets_insert_cold_3((uint64_t)v3, v4, v5);
    v7 = 0;
    v8 = (int *)(*(_QWORD *)a1 + 12);
    do
    {
      v9 = *v8;
      v8 += 4;
      ++v2[v9];
      ++v7;
    }
    while (v7 < (int)a1[2]);
  }
  v10 = a1[3];
  v11 = v2[v10];
  v2[v10] = 0;
  v12 = a1[3];
  if ((int)v12 >= 1)
  {
    v13 = 0;
    v14 = v12 + 1;
    do
    {
      v13 += v11;
      v11 = v2[(v14 - 2)];
      v2[(v14-- - 2)] = v13;
    }
    while (v14 > 1);
  }
  if ((int)a1[2] >= 1)
  {
    if (!*(_QWORD *)a1)
      fch_buckets_insert_cold_3((uint64_t)v3, v4, v5);
    v15 = 0;
    v16 = (unsigned int *)(*(_QWORD *)a1 + 12);
    do
    {
      v3[v2[*v16]] = v15++;
      v17 = *v16;
      v16 += 4;
      ++v2[v17];
    }
    while (v15 < (int)a1[2]);
  }
  free(v2);
  return v6;
}

uint64_t fch_buckets_print(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  FILE **v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (*(_DWORD *)(result + 8))
  {
    v1 = result;
    v2 = 0;
    v3 = (FILE **)MEMORY[0x24BDAC8D8];
    do
    {
      if (!*(_QWORD *)v1)
        fch_buckets_print_cold_1();
      v4 = *(_QWORD *)v1 + 16 * v2;
      result = fprintf(*v3, "Printing bucket %u ...\n", v2);
      if (*(_DWORD *)(v4 + 12))
      {
        v5 = 0;
        v6 = 0;
        do
        {
          result = fprintf(*v3, "  key: %s\n", *(const char **)(*(_QWORD *)v4 + v5));
          ++v6;
          v5 += 16;
        }
        while (v6 < *(unsigned int *)(v4 + 12));
      }
      ++v2;
    }
    while (v2 < *(unsigned int *)(v1 + 8));
  }
  return result;
}

void fch_buckets_destroy(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (*(_DWORD *)(a1 + 8))
  {
    v2 = 0;
    do
    {
      if (!*(_QWORD *)a1)
        fch_buckets_destroy_cold_1();
      v3 = *(_QWORD *)a1 + 16 * v2;
      if (*(_DWORD *)(v3 + 12))
      {
        v4 = 0;
        v5 = 0;
        do
        {
          free(*(void **)(*(_QWORD *)v3 + v4));
          ++v5;
          v4 += 16;
        }
        while (v5 < *(unsigned int *)(v3 + 12));
      }
      free(*(void **)v3);
      ++v2;
    }
    while (v2 < *(unsigned int *)(a1 + 8));
  }
  free(*(void **)a1);
  free((void *)a1);
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 79, a4);
}

_QWORD *graph_new(unsigned int a1, unsigned int a2)
{
  _QWORD *v4;

  v4 = malloc_type_malloc(0x38uLL, 0x101004041DD7EF0uLL);
  if (v4)
  {
    v4[1] = malloc_type_malloc(8 * a2, 0xEA1230D8uLL);
    v4[3] = malloc_type_malloc(8 * a2, 0xD3A46243uLL);
    v4[2] = malloc_type_malloc(4 * a1, 0x100004052888210uLL);
    v4[4] = 0;
    *((_DWORD *)v4 + 10) = 0;
    *(_DWORD *)v4 = a1;
    *((_DWORD *)v4 + 1) = a2;
    graph_clear_edges((unsigned int *)v4);
  }
  return v4;
}

unsigned int *graph_clear_edges(unsigned int *result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*result)
  {
    v1 = 0;
    v2 = *((_QWORD *)result + 2);
    do
      *(_DWORD *)(v2 + 4 * v1++) = -1;
    while (v1 < *result);
  }
  if ((result[1] & 0x7FFFFFFF) != 0)
  {
    v3 = 0;
    v4 = *((_QWORD *)result + 1);
    v5 = *((_QWORD *)result + 3);
    do
    {
      *(_DWORD *)(v4 + 4 * v3) = -1;
      *(_DWORD *)(v5 + 4 * v3++) = -1;
    }
    while (v3 < 2 * result[1]);
  }
  result[11] = 0;
  result[12] = 0;
  return result;
}

void graph_destroy(void **a1)
{
  free(a1[1]);
  free(a1[2]);
  free(a1[3]);
  free(a1[4]);
  free(a1);
}

unsigned int *graph_print(unsigned int *result)
{
  unsigned int *v1;
  unint64_t v2;
  uint64_t v3;
  unsigned int i;

  if (*result)
  {
    v1 = result;
    v2 = 0;
    do
    {
      v3 = *(unsigned int *)(*((_QWORD *)v1 + 2) + 4 * v2);
      if ((_DWORD)v3 != -1)
      {
        result = (unsigned int *)printf("%u -> %u\n", *(_DWORD *)(*((_QWORD *)v1 + 1) + 4 * (v3 % v1[1])), *(_DWORD *)(*((_QWORD *)v1 + 1) + 4 * (v3 % v1[1] + v1[1])));
        for (i = *(_DWORD *)(*((_QWORD *)v1 + 3) + 4 * v3); i != -1; i = *(_DWORD *)(*((_QWORD *)v1 + 3) + 4 * i))
          result = (unsigned int *)printf("%u -> %u\n", *(_DWORD *)(*((_QWORD *)v1 + 1) + 4 * (i % v1[1])), *(_DWORD *)(*((_QWORD *)v1 + 1) + 4 * (i % v1[1] + v1[1])));
      }
      ++v2;
    }
    while (v2 < *v1);
  }
  return result;
}

uint64_t graph_add_edge(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_DWORD *)result <= a2)
    graph_add_edge_cold_4();
  if (*(_DWORD *)result <= a3)
    graph_add_edge_cold_3();
  v3 = *(unsigned int *)(result + 44);
  if (v3 >= *(_DWORD *)(result + 4))
    graph_add_edge_cold_2();
  if (*(_DWORD *)(result + 48))
    graph_add_edge_cold_1();
  v5 = *(_QWORD *)(result + 8);
  v4 = *(_QWORD *)(result + 16);
  v6 = *(_QWORD *)(result + 24);
  *(_DWORD *)(v6 + 4 * v3) = *(_DWORD *)(v4 + 4 * a2);
  *(_DWORD *)(v4 + 4 * a2) = v3;
  *(_DWORD *)(v5 + 4 * v3) = a3;
  *(_DWORD *)(v6 + 4 * (*(_DWORD *)(result + 4) + v3)) = *(_DWORD *)(v4 + 4 * a3);
  *(_DWORD *)(v4 + 4 * a3) = *(_DWORD *)(result + 4) + v3;
  *(_DWORD *)(v5 + 4 * (*(_DWORD *)(result + 4) + v3)) = a2;
  ++*(_DWORD *)(result + 44);
  return result;
}

uint64_t graph_edge_id(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v5;
  unsigned int v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  unsigned int i;
  int v11;

  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 4 * a2);
  if ((_DWORD)v3 == -1)
    graph_edge_id_cold_1();
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_DWORD *)(a1 + 4);
  result = v3 % v6;
  v8 = *(_DWORD *)(v5 + 4 * result);
  if ((v8 != a2 || *(_DWORD *)(v5 + 4 * (result + v6)) != a3)
    && (v8 != a3 || *(_DWORD *)(v5 + 4 * (result + v6)) != a2))
  {
    v9 = *(_QWORD *)(a1 + 24);
    for (i = *(_DWORD *)(v9 + 4 * v3); ; i = *(_DWORD *)(v9 + 4 * i))
    {
      if (i == -1)
        graph_edge_id_cold_2();
      result = i % v6;
      v11 = *(_DWORD *)(v5 + 4 * result);
      if (v11 == a2 && *(_DWORD *)(v5 + 4 * (result + v6)) == a3)
        break;
      if (v11 == a3 && *(_DWORD *)(v5 + 4 * (result + v6)) == a2)
        break;
    }
  }
  return result;
}

uint64_t graph_del_edge(uint64_t a1, unsigned int a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 48) = 1;
  del_edge_point(a1, a2, a3);
  return del_edge_point(a1, a3, a2);
}

uint64_t del_edge_point(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  unsigned int i;
  int v11;
  int v12;

  v3 = *(_QWORD *)(result + 8);
  v4 = (unsigned int *)(*(_QWORD *)(result + 16) + 4 * a2);
  v5 = *v4;
  v6 = *(_DWORD *)(result + 4);
  v7 = v5 % v6;
  v8 = *(_DWORD *)(v3 + 4 * (v5 % v6));
  if (v8 == a2 && *(_DWORD *)(v3 + 4 * (v7 + v6)) == a3 || v8 == a3 && *(_DWORD *)(v3 + 4 * (v7 + v6)) == a2)
  {
    v9 = *(_QWORD *)(result + 24);
    i = *v4;
  }
  else
  {
    v9 = *(_QWORD *)(result + 24);
    for (i = *(_DWORD *)(v9 + 4 * v5); ; i = *(_DWORD *)(v9 + 4 * i))
    {
      if (i == -1)
        del_edge_point_cold_1();
      v11 = i % v6;
      v12 = *(_DWORD *)(v3 + 4 * (i % v6));
      if (v12 == a2 && *(_DWORD *)(v3 + 4 * (v11 + v6)) == a3)
        break;
      if (v12 == a3 && *(_DWORD *)(v3 + 4 * (v11 + v6)) == a2)
        break;
      v5 = i;
    }
    v4 = (unsigned int *)(v9 + 4 * v5);
  }
  *v4 = *(_DWORD *)(v9 + 4 * i);
  return result;
}

uint64_t graph_is_cyclic(unsigned int *a1)
{
  void *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v2 = malloc_type_malloc(((unint64_t)a1[1] >> 3) + 1, 0x7815BD4EuLL);
  bzero(v2, ((unint64_t)a1[1] >> 3) + 1);
  if (*a1)
  {
    v3 = 0;
    do
      cyclic_del_edge((uint64_t)a1, v3++, (uint64_t)v2);
    while (v3 < *a1);
  }
  v4 = a1[1];
  if (v4)
  {
    v5 = 0;
    while ((bitmask_4[v5 & 7] & *((_BYTE *)v2 + ((unint64_t)v5 >> 3))) >> (v5 & 7))
    {
      if (v4 == ++v5)
        goto LABEL_8;
    }
    free(v2);
    return 1;
  }
  else
  {
LABEL_8:
    free(v2);
    return 0;
  }
}

uint64_t cyclic_del_edge(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t result;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v4 = a2;
  v12 = 0;
  result = find_degree1_edge(a1, a2, a3, &v12);
  if ((_DWORD)result)
  {
    v7 = *(_DWORD *)(a1 + 4);
    do
    {
      v8 = v12;
      *(_BYTE *)(a3 + ((unint64_t)(v12 % v7) >> 3)) |= bitmask_4[(v12 % v7) & 7];
      v9 = *(_QWORD *)(a1 + 8);
      v7 = *(_DWORD *)(a1 + 4);
      v10 = v8 % v7;
      v11 = *(_DWORD *)(v9 + 4 * v10);
      if (v11 == v4)
        v11 = *(_DWORD *)(v9 + 4 * (v10 + v7));
      result = find_degree1_edge(a1, v11, a3, &v12);
      v4 = v11;
    }
    while ((_DWORD)result);
  }
  return result;
}

uint64_t graph_node_is_critical(uint64_t a1, unsigned int a2)
{
  return (bitmask_4[a2 & 7] & *(_BYTE *)(*(_QWORD *)(a1 + 32) + ((unint64_t)a2 >> 3))) >> (a2 & 7);
}

void graph_obtain_critical_nodes(void **a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  unint64_t v5;
  unint64_t i;
  _BYTE *v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;

  v2 = malloc_type_malloc(((unint64_t)*((unsigned int *)a1 + 1) >> 3) + 1, 0x35F3F3CuLL);
  bzero(v2, ((unint64_t)*((unsigned int *)a1 + 1) >> 3) + 1);
  free(a1[4]);
  v3 = malloc_type_malloc(((unint64_t)*(unsigned int *)a1 >> 3) + 1, 0xF8ABB3F2uLL);
  a1[4] = v3;
  *((_DWORD *)a1 + 10) = 0;
  bzero(v3, ((unint64_t)*(unsigned int *)a1 >> 3) + 1);
  if (*(_DWORD *)a1)
  {
    v4 = 0;
    do
      cyclic_del_edge((uint64_t)a1, v4++, (uint64_t)v2);
    while (v4 < *(_DWORD *)a1);
  }
  v5 = *((unsigned int *)a1 + 1);
  if ((_DWORD)v5)
  {
    for (i = 0; i < v5; ++i)
    {
      if (!((bitmask_4[i & 7] & *((_BYTE *)v2 + (i >> 3))) >> (i & 7)))
      {
        v7 = a1[4];
        v8 = a1[1];
        if (!((bitmask_4[v8[i] & 7] & v7[(unint64_t)v8[i] >> 3]) >> (v8[i] & 7)))
        {
          ++*((_DWORD *)a1 + 10);
          v7[(unint64_t)v8[i] >> 3] |= bitmask_4[v8[i] & 7];
          v7 = a1[4];
          v8 = a1[1];
          v5 = *((unsigned int *)a1 + 1);
        }
        v9 = (i + v5);
        v10 = v8[v9];
        if (!((bitmask_4[v10 & 7] & v7[v10 >> 3]) >> (v10 & 7)))
        {
          ++*((_DWORD *)a1 + 10);
          v7[(unint64_t)v8[v9] >> 3] |= bitmask_4[v8[v9] & 7];
          v5 = *((unsigned int *)a1 + 1);
        }
      }
    }
  }
  free(v2);
}

uint64_t graph_contains_edge(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v9;
  unsigned int i;
  int v11;
  int v12;

  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 4 * a2);
  if ((_DWORD)v3 != -1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(_DWORD *)(a1 + 4);
    v6 = v3 % v5;
    v7 = *(_DWORD *)(v4 + 4 * (v3 % v5));
    if (v7 == a2 && *(_DWORD *)(v4 + 4 * (v6 + v5)) == a3 || v7 == a3 && *(_DWORD *)(v4 + 4 * (v6 + v5)) == a2)
      return 1;
    v9 = *(_QWORD *)(a1 + 24);
    for (i = *(_DWORD *)(v9 + 4 * v3); i != -1; i = *(_DWORD *)(v9 + 4 * i))
    {
      v11 = i % v5;
      v12 = *(_DWORD *)(v4 + 4 * (i % v5));
      if (v12 == a2 && *(_DWORD *)(v4 + 4 * (v11 + v5)) == a3
        || v12 == a3 && *(_DWORD *)(v4 + 4 * (v11 + v5)) == a2)
      {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t graph_vertex_id(uint64_t a1, int a2, int a3)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 8) + 4 * (a2 + *(_DWORD *)(a1 + 4) * a3));
}

uint64_t graph_ncritical_nodes(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

unint64_t graph_neighbors_it(uint64_t a1, unsigned int a2)
{
  return a2 | ((unint64_t)*(unsigned int *)(*(_QWORD *)(a1 + 16) + 4 * a2) << 32);
}

uint64_t graph_next_neighbor(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2[1];
  if ((_DWORD)v2 == -1)
    return 0xFFFFFFFFLL;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned int *)(v3 + 4 * v2);
  if ((_DWORD)v4 == *a2)
    v4 = *(unsigned int *)(v3 + 4 * (*(_DWORD *)(a1 + 4) + v2));
  a2[1] = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * v2);
  return v4;
}

uint64_t find_degree1_edge(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  unint64_t v4;
  int v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 4 * a2);
  if ((_DWORD)v4 == -1)
  {
LABEL_2:
    LOBYTE(v5) = 0;
  }
  else
  {
    v7 = v4 - (v4 / *(unsigned int *)(a1 + 4)) * (unint64_t)*(unsigned int *)(a1 + 4);
    if ((bitmask_4[v7 & 7] & *(_BYTE *)(a3 + (v7 >> 3))) >> (v7 & 7))
    {
      v5 = 0;
    }
    else
    {
      *a4 = v4;
      v5 = 1;
    }
    v8 = *(_QWORD *)(a1 + 24);
    while (1)
    {
      v4 = *(unsigned int *)(v8 + 4 * v4);
      if ((_DWORD)v4 == -1)
        break;
      v9 = v4 - (v4 / *(unsigned int *)(a1 + 4)) * (unint64_t)*(unsigned int *)(a1 + 4);
      if (!((bitmask_4[v9 & 7] & *(_BYTE *)(a3 + (v9 >> 3))) >> (v9 & 7)))
      {
        if (v5)
          goto LABEL_2;
        *a4 = v4;
        v5 = 1;
      }
    }
  }
  return v5;
}

_DWORD *hash_state_new(int a1, unsigned int a2)
{
  _DWORD *result;

  if (a1)
    hash_state_new_cold_1();
  result = jenkins_state_new(a2);
  *result = 0;
  return result;
}

uint64_t hash(_DWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  if (*a1)
    hash_cold_1();
  return jenkins_hash((uint64_t)a1, a2, a3);
}

uint64_t hash_vector(_DWORD *a1, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  if (*a1)
    hash_vector_cold_1();
  return jenkins_hash_vector_((uint64_t)a1, a2, a3, a4);
}

void hash_state_dump(_DWORD *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v6;
  size_t v7;
  void *v8;
  size_t v9;
  size_t v10;
  void *__src;

  if (*a1)
    hash_state_dump_cold_1();
  __src = 0;
  jenkins_state_dump((uint64_t)a1, &__src, a3);
  v6 = *a3;
  if ((_DWORD)v6 != -1)
  {
    v7 = strlen((const char *)cmph_hash_names[*a1]);
    v8 = malloc_type_malloc(v6 + v7 + 1, 0xC17D6035uLL);
    *a2 = v8;
    v9 = strlen((const char *)cmph_hash_names[*a1]);
    memcpy(v8, (const void *)cmph_hash_names[*a1], v9 + 1);
    v10 = strlen((const char *)cmph_hash_names[*a1]);
    memcpy((void *)(*a2 + v10 + 1), __src, *a3);
    *a3 += strlen((const char *)cmph_hash_names[*a1]) + 1;
  }
  free(__src);
}

void hash_state_copy(double *a1)
{
  _DWORD *v2;

  if (*(_DWORD *)a1)
    hash_state_copy_cold_1();
  jenkins_state_copy(a1);
  *v2 = *(_DWORD *)a1;
}

_DWORD *hash_state_load(const char *a1)
{
  const char *v2;
  int *v4;

  v2 = (const char *)cmph_hash_names[0];
  if (strcmp(a1, (const char *)cmph_hash_names[0]))
    return 0;
  v4 = (int *)&a1[strlen(v2) + 1];
  return jenkins_state_load(v4);
}

void hash_state_destroy(_DWORD *a1)
{
  if (*a1)
    hash_state_destroy_cold_1();
  jenkins_state_destroy(a1);
}

uint64_t hash_state_pack(_DWORD *a1, _DWORD *a2)
{
  if (*a1)
    hash_state_pack_cold_1();
  return jenkins_state_pack((uint64_t)a1, a2);
}

uint64_t hash_state_packed_size(int a1)
{
  if (a1)
    hash_state_packed_size_cold_1();
  return jenkins_state_packed_size();
}

uint64_t hash_packed(unsigned int *a1, int a2, unsigned __int8 *a3, unsigned int a4)
{
  if (a2)
    hash_packed_cold_1();
  return jenkins_hash_packed(a1, a3, a4);
}

uint64_t hash_vector_packed(unsigned int *a1, int a2, unsigned __int8 *a3, unsigned int a4, int32x2_t *a5)
{
  if (a2)
    hash_vector_packed_cold_1();
  return jenkins_hash_vector_packed(a1, a3, a4, a5);
}

uint64_t hash_get_type(unsigned int *a1)
{
  return *a1;
}

_DWORD *jenkins_state_new(unsigned int a1)
{
  _DWORD *v2;

  v2 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v2)
    v2[1] = rand() % a1;
  return v2;
}

uint64_t jenkins_hash(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  int32x2_t v4;
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  __jenkins_hash_vector(*(unsigned int *)(a1 + 4), a2, a3, &v4);
  return v5;
}

uint64_t __jenkins_hash_vector(uint64_t result, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  unsigned int v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned __int32 v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;

  v4 = -1640531527;
  *a4 = vdup_n_s32(0x9E3779B9);
  a4[1].i32[0] = result;
  v5 = -1640531527;
  v6 = a3;
  if (a3 >= 0xC)
  {
    do
    {
      v7 = (char)*a2 + ((char)a2[1] << 8) + ((char)a2[2] << 16) + v5 + (a2[3] << 24);
      a4->i32[0] = v7;
      v8 = (char)a2[4] + ((char)a2[5] << 8) + ((char)a2[6] << 16) + v4 + (a2[7] << 24);
      a4->i32[1] = v8;
      v9 = (char)a2[8] + ((char)a2[9] << 8) + ((char)a2[10] << 16) + result + (a2[11] << 24);
      v10 = (v7 - (v8 + v9)) ^ (v9 >> 13);
      v11 = (v8 - v9 - v10) ^ (v10 << 8);
      v12 = (v9 - v10 - v11) ^ (v11 >> 13);
      v13 = (v10 - v11 - v12) ^ (v12 >> 12);
      v14 = (v11 - v12 - v13) ^ (v13 << 16);
      v15 = (v12 - v13 - v14) ^ (v14 >> 5);
      v5 = (v13 - v14 - v15) ^ (v15 >> 3);
      v4 = (v14 - v15 - v5) ^ (v5 << 10);
      a4->i32[0] = v5;
      a4->i32[1] = v4;
      result = (v15 - v5 - v4) ^ (v4 >> 15);
      a4[1].i32[0] = result;
      a2 += 12;
      v6 -= 12;
    }
    while (v6 > 0xB);
  }
  v16 = result + a3;
  a4[1].i32[0] = result + a3;
  switch(v6)
  {
    case 1u:
      goto LABEL_14;
    case 2u:
      goto LABEL_13;
    case 3u:
      goto LABEL_12;
    case 4u:
      goto LABEL_11;
    case 5u:
      goto LABEL_10;
    case 6u:
      goto LABEL_9;
    case 7u:
      goto LABEL_8;
    case 8u:
      goto LABEL_7;
    case 9u:
      goto LABEL_6;
    case 0xAu:
      goto LABEL_5;
    case 0xBu:
      v16 += a2[10] << 24;
      a4[1].i32[0] = v16;
LABEL_5:
      v16 += (char)a2[9] << 16;
      a4[1].i32[0] = v16;
LABEL_6:
      v16 += (char)a2[8] << 8;
      a4[1].i32[0] = v16;
LABEL_7:
      v4 += a2[7] << 24;
      a4->i32[1] = v4;
LABEL_8:
      v4 += (char)a2[6] << 16;
      a4->i32[1] = v4;
LABEL_9:
      v4 += (char)a2[5] << 8;
      a4->i32[1] = v4;
LABEL_10:
      v4 += a2[4];
      a4->i32[1] = v4;
LABEL_11:
      v5 += a2[3] << 24;
      a4->i32[0] = v5;
LABEL_12:
      v5 += (char)a2[2] << 16;
      a4->i32[0] = v5;
LABEL_13:
      v5 += (char)a2[1] << 8;
      a4->i32[0] = v5;
LABEL_14:
      v5 += *a2;
      break;
    default:
      break;
  }
  v17 = (v5 - v4 - v16) ^ (v16 >> 13);
  v18 = (v4 - v16 - v17) ^ (v17 << 8);
  v19 = (v16 - v17 - v18) ^ (v18 >> 13);
  v20 = (v17 - v18 - v19) ^ (v19 >> 12);
  v21 = (v18 - v19 - v20) ^ (v20 << 16);
  v22 = (v19 - v20 - v21) ^ (v21 >> 5);
  v23 = (v20 - v21 - v22) ^ (v22 >> 3);
  v24 = (v21 - v22 - v23) ^ (v23 << 10);
  a4->i32[0] = v23;
  a4->i32[1] = v24;
  a4[1].i32[0] = (v22 - v23 - v24) ^ (v24 >> 15);
  return result;
}

uint64_t jenkins_hash_vector_(uint64_t a1, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  return __jenkins_hash_vector(*(unsigned int *)(a1 + 4), a2, a3, a4);
}

_DWORD *jenkins_state_dump(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  _DWORD *result;

  *a3 = 4;
  result = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  *a2 = result;
  if (result)
    *result = *(_DWORD *)(a1 + 4);
  else
    *a3 = -1;
  return result;
}

double jenkins_state_copy(double *a1)
{
  _QWORD *v2;
  double result;

  v2 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  result = *a1;
  *v2 = *(_QWORD *)a1;
  return result;
}

_DWORD *jenkins_state_load(int *a1)
{
  _DWORD *result;
  int v3;

  result = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v3 = *a1;
  *result = 0;
  result[1] = v3;
  return result;
}

uint64_t jenkins_state_pack(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2)
      *a2 = *(_DWORD *)(result + 4);
  }
  return result;
}

uint64_t jenkins_state_packed_size()
{
  return 4;
}

uint64_t jenkins_hash_packed(unsigned int *a1, unsigned __int8 *a2, unsigned int a3)
{
  int32x2_t v4;
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  __jenkins_hash_vector(*a1, a2, a3, &v4);
  return v5;
}

uint64_t jenkins_hash_vector_packed(unsigned int *a1, unsigned __int8 *a2, unsigned int a3, int32x2_t *a4)
{
  return __jenkins_hash_vector(*a1, a2, a3, a4);
}

_QWORD *lsmap_new()
{
  _QWORD *result;

  result = malloc_type_malloc(0x18uLL, 0xF00409C84318DuLL);
  if (result)
  {
    *result = "dummy node";
    result[2] = 0;
  }
  return result;
}

uint64_t lsmap_size(uint64_t a1)
{
  while (*(_QWORD *)(a1 + 16))
    ;
  return 0;
}

_QWORD *lsmap_append(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *result;

  do
  {
    v5 = a1;
    a1 = (_QWORD *)a1[2];
  }
  while (a1);
  result = malloc_type_malloc(0x18uLL, 0xF00409C84318DuLL);
  v5[1] = a3;
  v5[2] = result;
  *v5 = a2;
  *result = "dummy node";
  result[2] = 0;
  return result;
}

uint64_t lsmap_search(uint64_t a1, char *__s2)
{
  uint64_t v4;

  while (1)
  {
    v4 = a1;
    a1 = *(_QWORD *)(a1 + 16);
    if (!a1)
      break;
    if (!strcmp(*(const char **)v4, __s2))
      return *(_QWORD *)(v4 + 8);
  }
  return 0;
}

uint64_t lsmap_foreach_key(uint64_t result, uint64_t (*a2)(_QWORD))
{
  _QWORD *v3;

  if (*(_QWORD *)(result + 16))
  {
    v3 = (_QWORD *)result;
    do
    {
      result = a2(*v3);
      v3 = (_QWORD *)v3[2];
    }
    while (v3[2]);
  }
  return result;
}

uint64_t lsmap_foreach_value(uint64_t result, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  if (*(_QWORD *)(result + 16))
  {
    v3 = result;
    do
    {
      result = a2(*(_QWORD *)(v3 + 8));
      v3 = *(_QWORD *)(v3 + 16);
    }
    while (*(_QWORD *)(v3 + 16));
  }
  return result;
}

void lsmap_destroy(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)a1[2];
  if (v1)
  {
    do
    {
      v2 = v1;
      free(a1);
      v1 = (_QWORD *)v2[2];
      a1 = v2;
    }
    while (v1);
  }
  else
  {
    v2 = a1;
  }
  free(v2);
}

uint64_t check_primality(unint64_t a1)
{
  uint64_t v1;
  uint64x2_t v2;
  int32x2_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = 0;
  v2.i64[0] = 0x6DB6DB6DB6DB6DB7 * a1;
  v2.i64[1] = 0xCCCCCCCCCCCCCCCDLL * a1;
  v3 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)xmmword_2084C45F0, v2));
  if ((v3.i8[0] & 1) != 0 || (v3.i8[4] & 1) != 0 || (a1 & 1) == 0 || !(a1 % 3))
    return v1;
  v4 = a1 - 1;
  v5 = -1;
  v6 = a1 - 1;
  do
  {
    v7 = v6;
    v6 >>= 1;
    ++v5;
  }
  while ((v7 & 2) == 0);
  v8 = v5 + 1;
  v9 = 2;
  v10 = 1;
  v11 = v6;
  do
  {
    if ((v11 & 1) != 0)
      v10 = v9 * v10 % a1;
    v9 = v9 * v9 % a1;
    v12 = v11 > 1;
    v11 >>= 1;
  }
  while (v12);
  if (v10 != 1 && v4 != v10)
  {
    if (v8 < 2)
      return 0;
    v13 = v5;
    while (1)
    {
      v10 = v10 * v10 % a1;
      if (v10 == v4)
        break;
      if (!--v13)
        return 0;
    }
  }
  v14 = 7;
  v15 = 1;
  v16 = v6;
  do
  {
    if ((v16 & 1) != 0)
      v15 = v14 * v15 % a1;
    v14 = v14 * v14 % a1;
    v12 = v16 > 1;
    v16 >>= 1;
  }
  while (v12);
  if (v15 != 1 && v4 != v15)
  {
    if (v8 < 2)
      return 0;
    v17 = v5;
    while (1)
    {
      v15 = v15 * v15 % a1;
      if (v15 == v4)
        break;
      if (!--v17)
        return 0;
    }
  }
  v18 = 61;
  v19 = 1;
  do
  {
    if ((v6 & 1) != 0)
      v19 = v18 * v19 % a1;
    v18 = v18 * v18 % a1;
    v12 = v6 > 1;
    v6 >>= 1;
  }
  while (v12);
  v1 = 1;
  if (v19 == 1 || v4 == v19)
    return v1;
  if (v8 < 2)
    return 0;
  while (1)
  {
    v19 = v19 * v19 % a1;
    if (v19 == v4)
      break;
    v1 = 0;
    if (!--v5)
      return v1;
  }
  return 1;
}

_QWORD *select_init(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

uint64_t select_get_space_usage(_DWORD *a1)
{
  return ((*a1 + a1[1] + 31) & 0xFFFFFFE0) + 32 * (*a1 >> 7) + 96;
}

void select_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  free(*(void **)(a1 + 16));
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
}

_DWORD *select_generate(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  size_t v6;
  unsigned int v7;
  void *v8;
  size_t v9;
  void *v10;
  _DWORD *result;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;

  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = a4;
  v6 = (a3 + a4 + 31) >> 5;
  v7 = a3 >> 7;
  v8 = *(void **)(a1 + 8);
  if (v8)
    free(v8);
  v9 = v7 + 1;
  *(_QWORD *)(a1 + 8) = malloc_type_calloc(v6, 4uLL, 0x100004052888210uLL);
  v10 = *(void **)(a1 + 16);
  if (v10)
    free(v10);
  result = malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  *(_QWORD *)(a1 + 16) = result;
  while (1)
  {
    while (1)
    {
      v16 = *(_DWORD *)(a2 + 4 * v13);
      if (v16 != v15)
        break;
      v17 = (v12 >> 1) | 0x80000000;
      v18 = ++v14 & 0x1F;
      if ((v14 & 0x1F) == 0)
        *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4 * ((v14 >> 5) - 1)) = v17;
      ++v13;
      v12 = (v12 >> 1) | 0x80000000;
      if (v13 == *(_DWORD *)a1)
        goto LABEL_19;
    }
    if (v15 == *(_DWORD *)(a1 + 4))
      break;
    if (v16 > v15)
    {
      v19 = 0;
      do
      {
        v12 >>= 1;
        v20 = v14 + v19 + 1;
        if ((v20 & 0x1F) == 0)
        {
          *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4 * ((v20 >> 5) - 1)) = v12;
          v16 = *(_DWORD *)(a2 + 4 * v13);
        }
        ++v19;
      }
      while (v16 > v15 + v19);
      v14 += v19;
      v15 += v19;
    }
  }
  v18 = v14 & 0x1F;
  v17 = v12;
LABEL_19:
  v21 = *(_QWORD *)(a1 + 8);
  if (v18)
    *(_DWORD *)(v21 + 4 * ((v14 - 1) >> 5)) = v17 >> -(char)v18;
  if (*(_DWORD *)a1)
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    do
    {
      v26 = 8 * v24 - 8;
      do
      {
        v27 = v25;
        v28 = *(unsigned __int8 *)(v21 + v24);
        v25 += rank_lookup_table[v28];
        ++v24;
        v26 += 8;
      }
      while (v25 <= v23);
      result[v22] = select_lookup_table[8 * v28 + v23 - v27] + v26;
      v23 += 128;
      ++v22;
    }
    while (v23 < *(_DWORD *)a1);
  }
  return result;
}

uint64_t select_query(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 4 * (a2 >> 7));
  v5 = v4 >> 3;
  v6 = (a2 & 0x7F)
     + rank_lookup_table[*(unsigned __int8 *)(v3 + (v4 >> 3)) & (unint64_t)~(-1 << (v4 & 7))];
  v7 = 8 * (*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4 * (a2 >> 7)) >> 3) - 8;
  do
  {
    v8 = v2;
    v9 = *(unsigned __int8 *)(v3 + v5);
    v2 += rank_lookup_table[v9];
    LODWORD(v5) = v5 + 1;
    v7 += 8;
  }
  while (v2 <= v6);
  return select_lookup_table[8 * v9 + v6 - v8] + v7;
}

uint64_t select_next_query(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = (unint64_t)a2 >> 3;
  v5 = rank_lookup_table[*(unsigned __int8 *)(v3 + v4) & (unint64_t)~(-1 << (a2 & 7))] + 1;
  v6 = 8 * v4 - 8;
  do
  {
    v7 = v2;
    v8 = *(unsigned __int8 *)(v3 + v4);
    v2 += rank_lookup_table[v8];
    LODWORD(v4) = v4 + 1;
    v6 += 8;
  }
  while (v2 <= v5);
  return select_lookup_table[8 * v8 + v5 - v7] + v6;
}

_DWORD *select_dump(const void **a1, uint64_t a2, _DWORD *a3)
{
  unint64_t v6;
  size_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  _DWORD *result;

  v6 = *(unsigned int *)a1;
  v7 = ((v6 + *((_DWORD *)a1 + 1) + 31) >> 3) & 0x1FFFFFFC;
  v8 = (v6 >> 5) & 0x7FFFFFC;
  v9 = v8 + 4;
  v10 = (v7 + 8 + v8 + 4);
  *a3 = v10;
  result = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
  *(_QWORD *)a2 = result;
  if (result)
  {
    *result = *(_DWORD *)a1;
    *(_DWORD *)(*(_QWORD *)a2 + 4) = *((_DWORD *)a1 + 1);
    memcpy((void *)(*(_QWORD *)a2 + 8), a1[1], v7);
    return memcpy((void *)(*(_QWORD *)a2 + (v7 + 8)), a1[2], v9);
  }
  else
  {
    *a3 = -1;
  }
  return result;
}

void *select_load(uint64_t a1, unsigned int *a2)
{
  unint64_t v4;
  unsigned int v5;
  size_t v6;
  void *v7;
  void *v8;
  size_t v9;

  v4 = *a2;
  *(_DWORD *)a1 = v4;
  v5 = a2[1];
  *(_DWORD *)(a1 + 4) = v5;
  v6 = ((v4 + v5 + 31) >> 3) & 0x1FFFFFFC;
  v7 = *(void **)(a1 + 8);
  if (v7)
    free(v7);
  *(_QWORD *)(a1 + 8) = malloc_type_calloc(v6 >> 2, 4uLL, 0x100004052888210uLL);
  v8 = *(void **)(a1 + 16);
  if (v8)
    free(v8);
  v9 = ((v4 >> 5) & 0x7FFFFFC) + 4;
  *(_QWORD *)(a1 + 16) = malloc_type_calloc(v9 >> 2, 4uLL, 0x100004052888210uLL);
  memcpy(*(void **)(a1 + 8), a2 + 2, v6);
  return memcpy(*(void **)(a1 + 16), (char *)a2 + (v6 + 8), v9);
}

void select_pack(const void **a1, void *a2)
{
  void *v3;
  _DWORD __n[3];

  if (a1)
  {
    if (a2)
    {
      memset(__n, 0, sizeof(__n));
      select_dump(a1, (uint64_t)&__n[1], __n);
      v3 = *(void **)&__n[1];
      memcpy(a2, *(const void **)&__n[1], __n[0]);
      free(v3);
    }
  }
}

uint64_t select_packed_size(_DWORD *a1)
{
  return ((*a1 >> 5) & 0x7FFFFFC) + 4 * ((*a1 + a1[1] + 31) >> 5) + 12;
}

uint64_t select_query_packed(_DWORD *a1, unsigned int a2)
{
  unsigned int v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;

  v2 = 0;
  v3 = a1[((*a1 + a1[1] + 31) >> 5) + 2 + (a2 >> 7)];
  v4 = v3 >> 3;
  v5 = (a2 & 0x7F)
     + rank_lookup_table[*((unsigned __int8 *)a1 + (v3 >> 3) + 8) & (unint64_t)~(-1 << (v3 & 7))];
  v6 = 8 * (a1[((*a1 + a1[1] + 31) >> 5) + 2 + (a2 >> 7)] >> 3) - 8;
  do
  {
    v7 = v2;
    v8 = *((unsigned __int8 *)a1 + v4 + 8);
    v2 += rank_lookup_table[v8];
    LODWORD(v4) = v4 + 1;
    v6 += 8;
  }
  while (v2 <= v5);
  return select_lookup_table[8 * v8 + v5 - v7] + v6;
}

uint64_t select_next_query_packed(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  unint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  v2 = 0;
  v3 = (unint64_t)a2 >> 3;
  v4 = rank_lookup_table[*(unsigned __int8 *)(a1 + 8 + v3) & (unint64_t)~(-1 << (a2 & 7))] + 1;
  v5 = 8 * v3 - 8;
  do
  {
    v6 = v2;
    v7 = *(unsigned __int8 *)(a1 + 8 + v3);
    v2 += rank_lookup_table[v7];
    LODWORD(v3) = v3 + 1;
    v5 += 8;
  }
  while (v2 <= v4);
  return select_lookup_table[8 * v7 + v4 - v6] + v5;
}

_QWORD *vqueue_new(int a1)
{
  _QWORD *v2;
  size_t v3;

  v2 = malloc_type_malloc(0x18uLL, 0x1010040E2407E0AuLL);
  if (v2)
  {
    v3 = (a1 + 1);
    *v2 = malloc_type_calloc(v3, 4uLL, 0x100004052888210uLL);
    v2[1] = 0;
    *((_DWORD *)v2 + 4) = v3;
  }
  return v2;
}

BOOL vqueue_is_empty(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) == *(_DWORD *)(a1 + 12);
}

uint64_t vqueue_insert(uint64_t result, int a2)
{
  unsigned int v2;

  v2 = (*(_DWORD *)(result + 12) + 1) % *(_DWORD *)(result + 16);
  if (v2 == *(_DWORD *)(result + 8))
    vqueue_insert_cold_1();
  *(_DWORD *)(result + 12) = v2;
  *(_DWORD *)(*(_QWORD *)result + 4 * v2) = a2;
  return result;
}

uint64_t vqueue_remove(uint64_t a1)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(a1 + 8);
  if (v1 == *(_DWORD *)(a1 + 12))
    vqueue_remove_cold_1();
  v2 = (v1 + 1) % *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 8) = v2;
  return *(unsigned int *)(*(_QWORD *)a1 + 4 * v2);
}

_DWORD *vqueue_print(_DWORD *result)
{
  int v1;
  _DWORD *v2;
  unsigned int v3;
  FILE **v4;
  unsigned int v5;

  v1 = result[2];
  if (v1 != result[3])
  {
    v2 = result;
    v3 = result[4];
    v4 = (FILE **)MEMORY[0x24BDAC8D8];
    do
    {
      v5 = v1 + 1;
      result = (_DWORD *)fprintf(*v4, "%u\n", *(_DWORD *)(*(_QWORD *)v2 + 4 * ((v1 + 1) % v3)));
      v3 = v2[4];
      v1 = v5 % v3;
    }
    while (v5 % v3 != v2[3]);
  }
  return result;
}

void vqueue_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

_QWORD *vstack_new()
{
  _QWORD *result;

  result = malloc_type_malloc(0x18uLL, 0x10100400FFEF802uLL);
  if (!result)
    vstack_new_cold_1();
  *(_DWORD *)result = 0;
  result[1] = 0;
  *((_DWORD *)result + 4) = 0;
  return result;
}

void vstack_destroy(void **a1)
{
  if (!a1)
    vstack_destroy_cold_1();
  free(a1[1]);
  free(a1);
}

void **vstack_push(uint64_t a1, int a2)
{
  void **result;

  if (!a1)
    vstack_push_cold_1();
  result = vstack_reserve((void **)a1, *(_DWORD *)a1 + 1);
  *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4 * (*(_DWORD *)a1)++) = a2;
  return result;
}

void **vstack_reserve(void **result, unsigned int a2)
{
  void **v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  if (!result)
    vstack_reserve_cold_1();
  v2 = result;
  v3 = *((_DWORD *)result + 4);
  if (v3 < a2)
  {
    v4 = v3 + 1;
    do
    {
      v5 = v4;
      v4 *= 2;
    }
    while (v5 < a2);
    result = (void **)malloc_type_realloc(result[1], 4 * v5, 0x100004052888210uLL);
    v2[1] = result;
    if (!result)
      vstack_reserve_cold_2();
    *((_DWORD *)v2 + 4) = v5;
  }
  return result;
}

_DWORD *vstack_pop(_DWORD *result)
{
  if (!result)
    vstack_pop_cold_1();
  if (!*result)
    vstack_pop_cold_2();
  --*result;
  return result;
}

uint64_t vstack_top(uint64_t a1)
{
  if (!a1)
    vstack_top_cold_1();
  if (!*(_DWORD *)a1)
    vstack_top_cold_2();
  return *(unsigned int *)(*(_QWORD *)(a1 + 8) + 4 * (*(_DWORD *)a1 - 1));
}

BOOL vstack_empty(_DWORD *a1)
{
  if (!a1)
    vstack_empty_cold_1();
  return *a1 == 0;
}

uint64_t vstack_size(unsigned int *a1)
{
  return *a1;
}

void bdz_ph_config_new_cold_1()
{
  __assert_rtn("bdz_ph_config_new", "bdz_ph.c", 209, "bdz_ph");
}

void bmz_new_cold_1()
{
  __assert_rtn("bmz_new", "bmz.c", 140, "bmz->g");
}

void bmz_traverse_cold_1()
{
  __assert_rtn("next_unused_edge", "bmz.c", 363, "unused_edge_index < bmz->m");
}

void bmz8_new_cold_1()
{
  __assert_rtn("bmz8_new", "bmz8.c", 146, "bmz8->g");
}

void bmz8_traverse_cold_1()
{
  __assert_rtn("next_unused_edge", "bmz8.c", 370, "unused_edge_index < bmz8->m");
}

void brz_config_set_mphf_fd_cold_1()
{
  __assert_rtn("brz_config_set_mphf_fd", "brz.c", 103, "brz->mphf_fd");
}

void brz_new_cold_1()
{
  __assert_rtn("brz_new", "brz.c", 143, "0");
}

void brz_new_cold_2()
{
  __assert_rtn("brz_gen_mphf", "brz.c", 480, "0");
}

void brz_new_cold_3()
{
  __assert_rtn("brz_gen_mphf", "brz.c", 427, "nkeys_vd < brz->size[cur_bucket]");
}

void brz_new_cold_4()
{
  __assert_rtn("brz_gen_mphf", "brz.c", 417, "nkeys_vd < brz->size[cur_bucket]");
}

void brz_load_cold_1()
{
  __assert_rtn("brz_load", "brz.c", 625, "0");
}

void brz_search_cold_1()
{
  __assert_rtn("brz_search", "brz.c", 696, "0");
}

void brz_pack_cold_1()
{
  __assert_rtn("brz_pack", "brz.c", 805, "0");
}

void brz_packed_size_cold_1()
{
  __assert_rtn("brz_packed_size", "brz.c", 850, "0");
}

void brz_search_packed_cold_1()
{
  __assert_rtn("brz_search_packed", "brz.c", 983, "0");
}

void chd_ph_config_set_b_cold_1()
{
  __assert_rtn("chd_ph_config_set_b", "chd_ph.c", 195, "mph");
}

void chd_ph_config_set_keys_per_bin_cold_1()
{
  __assert_rtn("chd_ph_config_set_keys_per_bin", "chd_ph.c", 207, "mph");
}

void chd_ph_new_cold_1()
{
  __assert_rtn("chd_ph_bucket_clean", "chd_ph.c", 76, "buckets");
}

void chm_new_cold_1()
{
  __assert_rtn("chm_new", "chm.c", 114, "chm->g");
}

void cmph_io_nlfile_adapter_cold_1()
{
  __assert_rtn("cmph_io_nlfile_adapter", "cmph.c", 175, "key_source");
}

void cmph_io_nlnkfile_adapter_cold_1()
{
  __assert_rtn("cmph_io_nlnkfile_adapter", "cmph.c", 192, "key_source");
}

void cmph_io_vector_new_cold_1()
{
  __assert_rtn("cmph_io_vector_new", "cmph.c", 235, "key_source");
}

void cmph_io_vector_new_cold_2()
{
  __assert_rtn("cmph_io_vector_new", "cmph.c", 236, "cmph_vector");
}

void cmph_io_struct_vector_adapter_cold_1()
{
  __assert_rtn("cmph_io_struct_vector_new", "cmph.c", 211, "key_source");
}

void cmph_io_struct_vector_adapter_cold_2()
{
  __assert_rtn("cmph_io_struct_vector_new", "cmph.c", 212, "cmph_struct_vector");
}

void cmph_config_new_cold_1()
{
  __assert_rtn("cmph_config_new", "cmph.c", 297, "mph");
}

void cmph_config_set_algo_cold_1()
{
  __assert_rtn("cmph_config_set_algo", "cmph.c", 337, "0");
}

void cmph_config_set_algo_cold_2()
{
  __assert_rtn("cmph_config_set_algo", "cmph.c", 369, "0");
}

void cmph_config_destroy_cold_1()
{
  __assert_rtn("cmph_config_destroy", "cmph.c", 467, "0");
}

void cmph_new_cold_1()
{
  __assert_rtn("cmph_new", "cmph.c", 567, "0");
}

void cmph_dump_cold_1()
{
  __assert_rtn("cmph_dump", "cmph.c", 595, "0");
}

void cmph_load_cold_1()
{
  __assert_rtn("cmph_load", "cmph.c", 646, "0");
}

void cmph_search_cold_1()
{
  __assert_rtn("cmph_search", "cmph.c", 685, "0");
}

void cmph_destroy_cold_1()
{
  __assert_rtn("cmph_destroy", "cmph.c", 728, "0");
}

void cmph_pack_cold_1()
{
  __assert_rtn("cmph_pack", "cmph.c", 776, "0");
}

void cmph_packed_size_cold_1()
{
  __assert_rtn("cmph_packed_size", "cmph.c", 809, "0");
}

void cmph_search_packed_cold_1()
{
  __assert_rtn("cmph_search_packed", "cmph.c", 846, "0");
}

void compressed_seq_query_cold_1()
{
  __assert_rtn("compressed_seq_query", "compressed_seq.c", 133, "idx < cs->n");
}

void fch_buckets_new_cold_1()
{
  __assert_rtn("fch_buckets_new", "fch_buckets.c", 122, "buckets->values");
}

void fch_buckets_new_cold_2()
{
  __assert_rtn("fch_bucket_new", "fch_buckets.c", 25, "bucket");
}

void fch_buckets_is_empty_cold_1()
{
  __assert_rtn("fch_bucket_is_empty", "fch_buckets.c", 73, "bucket");
}

void fch_buckets_is_empty_cold_2()
{
  __assert_rtn("fch_buckets_is_empty", "fch_buckets.c", 130, "index < buckets->nbuckets");
}

void fch_buckets_insert_cold_1()
{
  __assert_rtn("fch_bucket_insert", "fch_buckets.c", 63, "bucket");
}

void fch_buckets_insert_cold_2()
{
  __assert_rtn("fch_bucket_reserve", "fch_buckets.c", 55, "bucket->entries");
}

void fch_buckets_insert_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("fch_bucket_size", "fch_buckets.c", a3, "bucket");
}

void fch_buckets_insert_cold_4()
{
  __assert_rtn("fch_buckets_insert", "fch_buckets.c", 136, "index < buckets->nbuckets");
}

void fch_buckets_get_size_cold_2()
{
  __assert_rtn("fch_buckets_get_size", "fch_buckets.c", 146, "index < buckets->nbuckets");
}

void fch_buckets_get_key_cold_1()
{
  __assert_rtn("fch_bucket_get_key", "fch_buckets.c", 85, "bucket");
}

void fch_buckets_get_key_cold_2()
{
  __assert_rtn("fch_bucket_get_key", "fch_buckets.c", 85, "index_key < bucket->size");
}

void fch_buckets_get_key_cold_3()
{
  __assert_rtn("fch_buckets_get_key", "fch_buckets.c", 153, "index < buckets->nbuckets");
}

void fch_buckets_get_keylength_cold_1()
{
  __assert_rtn("fch_bucket_get_length", "fch_buckets.c", 91, "bucket");
}

void fch_buckets_get_keylength_cold_2()
{
  __assert_rtn("fch_bucket_get_length", "fch_buckets.c", 91, "index_key < bucket->size");
}

void fch_buckets_get_keylength_cold_3()
{
  __assert_rtn("fch_buckets_get_keylength", "fch_buckets.c", 159, "index < buckets->nbuckets");
}

void fch_buckets_print_cold_1()
{
  __assert_rtn("fch_bucket_print", "fch_buckets.c", 98, "bucket");
}

void fch_buckets_destroy_cold_1()
{
  __assert_rtn("fch_bucket_destroy", "fch_buckets.c", 34, "bucket");
}

void graph_add_edge_cold_1()
{
  __assert_rtn("graph_add_edge", "graph.c", 92, "!g->shrinking");
}

void graph_add_edge_cold_2()
{
  __assert_rtn("graph_add_edge", "graph.c", 91, "e < g->nedges");
}

void graph_add_edge_cold_3()
{
  __assert_rtn("graph_add_edge", "graph.c", 90, "v2 < g->nnodes");
}

void graph_add_edge_cold_4()
{
  __assert_rtn("graph_add_edge", "graph.c", 89, "v1 < g->nnodes");
}

void graph_edge_id_cold_1()
{
  __assert_rtn("graph_edge_id", "graph.c", 117, "e != EMPTY");
}

void graph_edge_id_cold_2()
{
  __assert_rtn("graph_edge_id", "graph.c", 122, "e != EMPTY");
}

void del_edge_point_cold_1()
{
  __assert_rtn("del_edge_point", "graph.c", 145, "e != EMPTY");
}

void hash_state_new_cold_1()
{
  __assert_rtn("hash_state_new", "hash.c", 23, "0");
}

void hash_cold_1()
{
  __assert_rtn("hash", "hash.c", 35, "0");
}

void hash_vector_cold_1()
{
  __assert_rtn("hash_vector", "hash.c", 49, "0");
}

void hash_state_dump_cold_1()
{
  __assert_rtn("hash_state_dump", "hash.c", 67, "0");
}

void hash_state_copy_cold_1()
{
  __assert_rtn("hash_state_copy", "hash.c", 89, "0");
}

void hash_state_destroy_cold_1()
{
  __assert_rtn("hash_state_destroy", "hash.c", 127, "0");
}

void hash_state_pack_cold_1()
{
  __assert_rtn("hash_state_pack", "hash.c", 149, "0");
}

void hash_state_packed_size_cold_1()
{
  __assert_rtn("hash_state_packed_size", "hash.c", 168, "0");
}

void hash_packed_cold_1()
{
  __assert_rtn("hash_packed", "hash.c", 187, "0");
}

void hash_vector_packed_cold_1()
{
  __assert_rtn("hash_vector_packed", "hash.c", 207, "0");
}

void vqueue_insert_cold_1()
{
  __assert_rtn("vqueue_insert", "vqueue.c", 29, "(q->end + 1)%q->capacity != q->beg");
}

void vqueue_remove_cold_1()
{
  __assert_rtn("vqueue_remove", "vqueue.c", 36, "!vqueue_is_empty(q)");
}

void vstack_new_cold_1()
{
  __assert_rtn("vstack_new", "vstack.c", 19, "stack");
}

void vstack_destroy_cold_1()
{
  __assert_rtn("vstack_destroy", "vstack.c", 28, "stack");
}

void vstack_push_cold_1()
{
  __assert_rtn("vstack_push", "vstack.c", 35, "stack");
}

void vstack_reserve_cold_1()
{
  __assert_rtn("vstack_reserve", "vstack.c", 64, "stack");
}

void vstack_reserve_cold_2()
{
  __assert_rtn("vstack_reserve", "vstack.c", 74, "stack->values");
}

void vstack_pop_cold_1()
{
  __assert_rtn("vstack_pop", "vstack.c", 42, "stack");
}

void vstack_pop_cold_2()
{
  __assert_rtn("vstack_pop", "vstack.c", 43, "stack->pointer > 0");
}

void vstack_top_cold_1()
{
  __assert_rtn("vstack_top", "vstack.c", 49, "stack");
}

void vstack_top_cold_2()
{
  __assert_rtn("vstack_top", "vstack.c", 50, "stack->pointer > 0");
}

void vstack_empty_cold_1()
{
  __assert_rtn("vstack_empty", "vstack.c", 55, "stack");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

