int AAHeaderSetFieldBlob(AAHeader header, uint32_t i, AAFieldKey key, uint64_t size)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  __int16 v25;
  char v27;
  AAFieldKey __src;
  uint64_t v29;
  uint64_t v30;

  v12 = MEMORY[0x24BDAC740];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL))
      goto LABEL_31;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_31;
  }
  v13 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v13, 0x500uLL))
      goto LABEL_9;
LABEL_31:
    v24 = "invalid key";
    v25 = 799;
    goto LABEL_32;
  }
  if ((*(_DWORD *)(v12 + 4 * v13 + 60) & 0x500) == 0)
    goto LABEL_31;
LABEL_9:
  v14 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0)
    v15 = __maskrune(v14, 0x500uLL);
  else
    v15 = *(_DWORD *)(v12 + 4 * v14 + 60) & 0x500;
  if ((key.ikey & 0xFF000000) != 0 || !v15)
    goto LABEL_31;
  if (HIDWORD(size))
    v16 = 12;
  else
    v16 = 8;
  if (HIDWORD(size))
    v17 = 67;
  else
    v17 = 66;
  if (size >= 0x10000)
    v18 = v16;
  else
    v18 = 6;
  if (size >= 0x10000)
    v19 = v17;
  else
    v19 = 65;
  if (i == -1)
    i = append_field((unsigned int *)header);
  if ((update_field_sizes((uint64_t)header, i, v18, size, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    v24 = "update_field_sizes failed";
    v25 = 808;
  }
  else
  {
    v20 = *((_QWORD *)header + 1) + 48 * i;
    *(AAFieldKey *)v20 = key;
    *(_DWORD *)(v20 + 4) = 5;
    *(_DWORD *)(v20 + 8) = v19;
    *(_QWORD *)(v20 + 40) = 0;
    v29 = size;
    v30 = 0;
    __src = key;
    __src.skey[3] = v19;
    v23 = v20 + 12;
    v22 = *(unsigned int *)(v20 + 12);
    v21 = *(unsigned int *)(v23 + 4);
    if (v22 + v21 <= *((_QWORD *)header + 2))
    {
      memcpy((void *)(*((_QWORD *)header + 4) + v22), &__src, v21);
      return 0;
    }
    v24 = "invalid blob segment";
    v25 = 820;
  }
LABEL_32:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c", (uint64_t)"AAHeaderSetFieldBlob", v25, 101, 0, v24, v6, v7, v27);
  return -1;
}

uint64_t AAHeaderGetPayloadSize(AAHeader header)
{
  return *((_QWORD *)header + 5);
}

size_t AAHeaderGetEncodedSize(AAHeader header)
{
  return *((_QWORD *)header + 2);
}

const uint8_t *__cdecl AAHeaderGetEncodedData(AAHeader header)
{
  return (const uint8_t *)*((_QWORD *)header + 4);
}

uint64_t aaEntryXATBlobInitWithEncodedData(unint64_t *a1, char *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  char v12;
  rsize_t *v13;
  char v14;
  rsize_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  rsize_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  rsize_t v27;
  rsize_t v28;
  size_t v29;
  void *v30;
  void *v31;
  rsize_t v32;
  size_t v33;
  rsize_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unsigned int *v40;
  uint64_t v41;
  unsigned __int8 *v42;
  uint64_t v43;
  uint64_t result;
  const char *v46;
  __int16 v47;
  char v48;

  *a1 = 0;
  a1[3] = 0;
  v8 = a1 + 3;
  if (!__smax)
    return 0;
  v12 = 0;
  v13 = a1 + 4;
  v14 = 1;
  while (2)
  {
    v15 = 0;
    v16 = 0;
    v17 = v14;
    do
    {
      if (v15 + 4 > __smax)
        goto LABEL_77;
      v18 = *(unsigned int *)&__src[v15];
      if (v18 < 4)
        goto LABEL_77;
      v19 = __CFADD__(v18, v15);
      v20 = v18 + v15;
      if (v19 || v20 > __smax)
        goto LABEL_77;
      if ((v12 & 1) != 0)
      {
        v21 = a1[2];
        v22 = (*a1)++;
        *(_QWORD *)(v21 + 8 * v22) = v15;
      }
      ++v16;
      v15 = v20;
    }
    while (v20 < __smax);
    if (v20 != __smax)
      goto LABEL_77;
    if ((v17 & 1) == 0)
      break;
    if (v16 > 0xFFFFFFFE)
      goto LABEL_77;
    v23 = a1[1];
    if (v23 < v16)
    {
      v24 = a1[1];
      do
      {
        if (v24)
          v24 *= 2;
        else
          v24 = 16;
      }
      while (v24 < v16);
      if (v24 > v23)
      {
        a1[1] = v24;
        if (8 * v24 >= 0x2000000001)
        {
          *__error() = 12;
        }
        else
        {
          v25 = (void *)a1[2];
          v26 = realloc(v25, 8 * v24);
          if (v26)
          {
            a1[2] = (unint64_t)v26;
            goto LABEL_24;
          }
          free(v25);
        }
        a1[2] = 0;
LABEL_77:
        *a1 = 0;
        a1[3] = 0;
        v46 = "invalid XAT blob";
        v47 = 72;
LABEL_78:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithEncodedData", v47, 104, 0, v46, a7, a8, v48);
        *a1 = 0;
        a1[3] = 0;
        return 0xFFFFFFFFLL;
      }
    }
LABEL_24:
    if ((__smax & 0x8000000000000000) != 0)
      goto LABEL_77;
    v27 = *v13;
    if (*v13 < __smax)
    {
      do
      {
        while (!v27)
        {
          v27 = 0x4000;
          v29 = 0x4000;
          if (__smax <= 0x4000)
            goto LABEL_34;
        }
        v28 = v27 >> 1;
        if ((v27 & (v27 >> 1)) != 0)
          v28 = v27 & (v27 >> 1);
        v27 += v28;
      }
      while (v27 < __smax);
      v29 = v27;
      if (v27 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_71;
      }
LABEL_34:
      v30 = (void *)a1[5];
      v31 = realloc(v30, v29);
      if (v31)
      {
        a1[4] = v29;
        a1[5] = (unint64_t)v31;
        goto LABEL_36;
      }
      free(v30);
LABEL_71:
      *v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      goto LABEL_77;
    }
LABEL_36:
    v14 = 0;
    v12 = 1;
    if ((v17 & 1) != 0)
      continue;
    break;
  }
  *v8 = 0;
  if ((__smax & 0x8000000000000000) != 0)
    goto LABEL_77;
  v32 = *v13;
  if (*v13 < __smax)
  {
    v33 = 0x4000;
    do
    {
      while (!v32)
      {
        v32 = 0x4000;
        if (__smax <= 0x4000)
          goto LABEL_50;
      }
      v34 = v32 >> 1;
      if ((v32 & (v32 >> 1)) != 0)
        v34 = v32 & (v32 >> 1);
      v32 += v34;
    }
    while (v32 < __smax);
    v33 = v32;
    if (v32 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_76;
    }
LABEL_50:
    v35 = (void *)a1[5];
    v36 = realloc(v35, v33);
    if (v36)
    {
      a1[4] = v33;
      a1[5] = (unint64_t)v36;
      goto LABEL_52;
    }
    free(v35);
LABEL_76:
    *v13 = 0;
    v13[1] = 0;
    goto LABEL_77;
  }
LABEL_52:
  v37 = a1[5];
  if (__src)
  {
    memcpy((void *)(v37 + *v8), __src, __smax);
  }
  else if (v37)
  {
    memset_s((void *)(v37 + *v8), __smax, 0, __smax);
  }
  a1[3] += __smax;
  v38 = *a1;
  if (*a1)
  {
    v39 = 0;
    while (1)
    {
      if (v38 <= v39)
      {
        v40 = 0;
        v41 = 0xFFFFFFFFLL;
      }
      else
      {
        v40 = (unsigned int *)(a1[5] + *(_QWORD *)(a1[2] + 8 * v39));
        v41 = *v40;
        if (v41 < 5)
        {
LABEL_69:
          v46 = "invalid XAT key";
          v47 = 84;
          goto LABEL_78;
        }
      }
      v42 = (unsigned __int8 *)(v40 + 1);
      v43 = v41 - 4;
      while (*v42++)
      {
        if (!--v43)
          goto LABEL_69;
      }
      result = 0;
      if (++v39 == v38)
        return result;
    }
  }
  return 0;
}

uint64_t aaEntryXATBlobInitWithPath(AAEntryXATBlob_impl *a1, char *__s, const char *a3)
{
  char v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v16[2048];
  uint64_t v17;

  v3 = (char)__s;
  v17 = *MEMORY[0x24BDAC8D0];
  if ((concatPath(v16, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithPath", 99, 104, 0, "invalid path %s/%s", v5, v6, v3);
    return 0xFFFFFFFFLL;
  }
  v7 = open(v16, 0x200000);
  if (v7 < 0)
  {
    v12 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithPath", 110, 104, v12, "open: %s", v13, v14, (char)v16);
    return 0xFFFFFFFFLL;
  }
  v8 = v7;
  if ((aaEntryXATBlobInitWithFD(a1, v7) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithPath", 112, 104, 0, "aaEntryXATBlobInitWithFD failed: %s", v9, v10, (char)v16);
    v11 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = 0;
  }
  close(v8);
  return v11;
}

uint64_t aaEntryXATBlobInitWithFD(AAEntryXATBlob_impl *a1, int fd)
{
  ssize_t v4;
  size_t v5;
  uint8_t *v6;
  char *v7;
  char *v9;
  ssize_t v10;
  uint64_t v11;
  size_t v12;
  const char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  ssize_t v36;

  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 3) = 0;
  v4 = flistxattr(fd, 0, 0, 0);
  if (v4 < 1)
  {
    v6 = 0;
    v7 = 0;
LABEL_5:
    free(v6);
    free(v7);
    return 0;
  }
  v5 = v4;
  if ((unint64_t)v4 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_27:
    v21 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 144, 104, *v21, "malloc", v22, v23, v35);
    v6 = 0;
    v7 = 0;
    goto LABEL_28;
  }
  v9 = (char *)malloc(v4);
  if (!v9)
    goto LABEL_27;
  v7 = v9;
  v10 = flistxattr(fd, v9, v5, 0);
  if (v10 < 1)
  {
    v24 = *__error();
    v27 = "listxattr";
    v28 = 153;
    goto LABEL_30;
  }
  v11 = 0;
  v6 = 0;
  v12 = 0;
  v13 = v7;
  v36 = v10;
  while (v7[v11])
  {
    ++v11;
LABEL_25:
    if (v11 == v10)
      goto LABEL_5;
  }
  v14 = fgetxattr(fd, v13, 0, 0, 0, 0);
  if ((v14 & 0x8000000000000000) != 0)
  {
    v29 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 167, 104, v29, "getxattr failed for name=%s", v30, v31, (char)v13);
    goto LABEL_28;
  }
  v17 = v14;
  if (v14 >= 0xFFFFFFFF)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 169, 104, 0, "attribute data is too large name=%s", v15, v16, (char)v13);
    goto LABEL_28;
  }
  if (v14 <= v12)
  {
    v18 = v6;
    goto LABEL_22;
  }
  do
  {
    if (v12)
      v12 += v12 >> 1;
    else
      v12 = 256;
  }
  while (v14 > v12);
  if (v12 < 0x2000000001)
  {
    v18 = (uint8_t *)realloc(v6, v12);
    if (!v18)
    {
      free(v6);
      goto LABEL_37;
    }
LABEL_22:
    if (fgetxattr(fd, v13, v18, v12, 0, 0) < 0)
    {
      v32 = *__error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 187, 104, v32, "getxattr failed for name=%s", v33, v34, (char)v13);
    }
    else
    {
      if ((AAEntryXATBlobAppendEntry(a1, v13, v18, v17) & 0x80000000) == 0)
      {
        v13 = &v7[++v11];
        v6 = v18;
        v10 = v36;
        goto LABEL_25;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", 190, 104, 0, "inserting XAT entry", v19, v20, v35);
    }
    v6 = v18;
    goto LABEL_28;
  }
  *__error() = 12;
LABEL_37:
  v24 = *__error();
  v27 = "malloc";
  v28 = 178;
LABEL_30:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobInitWithFD", v28, 104, v24, v27, v25, v26, v35);
  v6 = 0;
LABEL_28:
  free(v6);
  free(v7);
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 3) = 0;
  return 0xFFFFFFFFLL;
}

int AAEntryXATBlobAppendEntry(AAEntryXATBlob xat, const char *key, const uint8_t *data, size_t data_size)
{
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  size_t v12;
  const char *v13;
  __int16 v14;
  rsize_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void **v23;
  _QWORD *v24;
  void *v25;
  size_t v26;
  size_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  size_t v32;
  void **v33;
  char *v34;
  _QWORD *v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void **v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v8 = strlen(key);
  v11 = v8 + 1;
  v12 = v8 + 5;
  if (v8 + 1 >= 0xFFFFFFFFFFFFFFFCLL || (v15 = data_size + v12, __CFADD__(data_size, v12)) || v15 >= 0xFFFFFFFF)
  {
    v13 = "invalid attribute size";
    v14 = 377;
LABEL_49:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobAppendEntry", v14, 104, 0, v13, v9, v10, (char)v43);
    return -1;
  }
  if (v15 < 4)
    goto LABEL_48;
  v16 = (_QWORD *)((char *)xat + 24);
  v17 = *((_QWORD *)xat + 3);
  v18 = v17 + v15;
  if (__CFADD__(v17, v15))
    goto LABEL_48;
  v20 = *(_QWORD *)xat;
  v19 = *((_QWORD *)xat + 1);
  v21 = *(_QWORD *)xat + 1;
  if (v19 < v21)
  {
    v22 = *((_QWORD *)xat + 1);
    do
    {
      if (v22)
        v22 *= 2;
      else
        v22 = 16;
    }
    while (v22 < v21);
    if (v22 > v19)
    {
      v24 = (_QWORD *)((char *)xat + 16);
      v23 = (void **)*((_QWORD *)xat + 2);
      *((_QWORD *)xat + 1) = v22;
      if (8 * v22 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_47:
        *(_QWORD *)xat = 0;
        *v24 = 0;
        *((_QWORD *)xat + 3) = 0;
        goto LABEL_48;
      }
      v43 = v23;
      v44 = v20;
      v25 = realloc(v23, 8 * v22);
      if (!v25)
      {
        free(v43);
        goto LABEL_47;
      }
      *v24 = v25;
      v20 = v44;
    }
  }
  if ((v18 & 0x8000000000000000) != 0)
    goto LABEL_43;
  v26 = *((_QWORD *)xat + 4);
  if (v26 < v18)
  {
    do
    {
      while (!v26)
      {
        v26 = 0x4000;
        if (v18 <= 0x4000)
        {
          v26 = 0x4000;
          goto LABEL_29;
        }
      }
      v27 = v26 >> 1;
      if ((v26 & (v26 >> 1)) != 0)
        v27 = v26 & (v26 >> 1);
      v26 += v27;
    }
    while (v26 < v18);
    if (v26 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_42;
    }
LABEL_29:
    v45 = v20;
    v28 = (void *)*((_QWORD *)xat + 5);
    v29 = realloc(v28, v26);
    if (v29)
    {
      *((_QWORD *)xat + 4) = v26;
      *((_QWORD *)xat + 5) = v29;
      v20 = v45;
      goto LABEL_31;
    }
    free(v28);
LABEL_42:
    *((_QWORD *)xat + 4) = 0;
    *((_QWORD *)xat + 5) = 0;
LABEL_43:
    *(_QWORD *)xat = 0;
    *((_QWORD *)xat + 3) = 0;
    goto LABEL_48;
  }
LABEL_31:
  v30 = *v16;
  v31 = *v16 + v15;
  if (__CFADD__(*v16, v15) || (v31 & 0x8000000000000000) != 0)
    goto LABEL_48;
  if (v26 < v31)
  {
    do
    {
      while (!v26)
      {
        v26 = 0x4000;
        if (v31 <= 0x4000)
        {
          v46 = v20;
          v33 = (void **)((char *)xat + 40);
          v26 = 0x4000;
          goto LABEL_53;
        }
      }
      v32 = v26 >> 1;
      if ((v26 & (v26 >> 1)) != 0)
        v32 = v26 & (v26 >> 1);
      v26 += v32;
    }
    while (v26 < v31);
    v33 = (void **)((char *)xat + 40);
    if (v26 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_61;
    }
    v46 = v20;
LABEL_53:
    v43 = v33;
    v37 = *v33;
    v34 = (char *)realloc(v37, v26);
    if (v34)
    {
      *((_QWORD *)xat + 5) = v34;
      v35 = (_QWORD *)((char *)xat + 40);
      *((_QWORD *)xat + 4) = v26;
      v30 = *((_QWORD *)xat + 3);
      goto LABEL_55;
    }
    free(v37);
    v33 = v43;
LABEL_61:
    *v33 = 0;
    *v16 = 0;
    *((_QWORD *)xat + 4) = 0;
    goto LABEL_48;
  }
  v46 = v20;
  v35 = (_QWORD *)((char *)xat + 40);
  v34 = (char *)*((_QWORD *)xat + 5);
  if (v34)
  {
LABEL_55:
    memset_s(&v34[v30], v15, 0, v15);
    v30 = *v16;
  }
  *((_QWORD *)xat + 3) = v30 + v15;
  v38 = *((_QWORD *)xat + 2);
  v39 = (*(_QWORD *)xat)++;
  *(_QWORD *)(v38 + 8 * v39) = v17;
  if (v17 >= 0xFFFFFFFFFFFFFFFCLL || v17 + 4 > *v16 || (*(_DWORD *)(*v35 + v17) = v15, v46 < 0))
  {
LABEL_48:
    v13 = "alloc XAT entry";
    v14 = 381;
    goto LABEL_49;
  }
  v40 = *((_QWORD *)xat + 5);
  v41 = *(_QWORD *)(*((_QWORD *)xat + 2) + 8 * v46);
  *(_DWORD *)(v40 + v41) = v15;
  v42 = (char *)(v40 + v41 + 4);
  memcpy(v42, key, v11);
  memcpy(&v42[v11], data, data_size);
  return 0;
}

uint64_t aaEntryXATBlobApplyToFD(_QWORD *a1, int fd, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v11;
  size_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;
  _DWORD *v20;
  const char *v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  int *v28;
  const char *v30;
  __int16 v31;
  char *v32;
  ssize_t v33;
  ssize_t v34;
  uint64_t v35;
  const char *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  __int16 v42;
  char v43;

  if ((a3 & 8) != 0)
  {
    v11 = flistxattr(fd, 0, 0, 0);
    if ((v11 & 0x8000000000000000) != 0)
    {
      v13 = *__error();
      v16 = "listxattr";
      v17 = 28;
LABEL_40:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"clearXATFD", v17, 104, v13, v16, v14, v15, v43);
      v18 = 0;
      goto LABEL_41;
    }
    v12 = v11;
    if (v11)
    {
      if (v11 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_39:
        v13 = *__error();
        v16 = "malloc";
        v17 = 34;
        goto LABEL_40;
      }
      v32 = (char *)malloc(v11);
      if (!v32)
        goto LABEL_39;
      v18 = v32;
      v33 = flistxattr(fd, v32, v12, 0);
      if (v33 < 0)
      {
        v38 = *__error();
        v41 = "listxattr";
        v42 = 43;
        goto LABEL_47;
      }
      v34 = v33;
      if (v33)
      {
        v35 = 0;
        v36 = v18;
        do
        {
          if (v18[v35])
          {
            ++v35;
          }
          else
          {
            if (fremovexattr(fd, v36, 0) < 0)
            {
              v38 = *__error();
              v43 = (char)v36;
              v41 = "removexattr failed for name=%s";
              v42 = 57;
LABEL_47:
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"clearXATFD", v42, 104, v38, v41, v39, v40, v43);
LABEL_41:
              free(v18);
              v30 = "clearing extended attributes";
              v31 = 212;
LABEL_42:
              v37 = 0;
LABEL_43:
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"aaEntryXATBlobApplyToFD", v31, 104, v37, v30, a7, a8, v43);
              return 0xFFFFFFFFLL;
            }
            v36 = &v18[++v35];
          }
        }
        while (v35 != v34);
      }
    }
    else
    {
      v18 = 0;
    }
    free(v18);
  }
  if (*a1)
  {
    v19 = 0;
    while (1)
    {
      v20 = (_DWORD *)(a1[5] + *(_QWORD *)(a1[2] + 8 * v19));
      v23 = *v20;
      v21 = (const char *)(v20 + 1);
      v22 = v23;
      if (v23 < 5)
      {
        LOBYTE(v24) = 0;
LABEL_28:
        v43 = v24;
        v30 = "invalid XAT entry key %zu";
        v31 = 225;
        goto LABEL_42;
      }
      v24 = 0;
      v25 = (const char *)(a1[5] + *(_QWORD *)(a1[2] + 8 * v19) + v22);
      while (v21[v24])
      {
        v26 = &v21[++v24];
        if (&v21[v24] >= v25)
        {
          if (!v24)
            goto LABEL_28;
          goto LABEL_18;
        }
      }
      v26 = &v21[v24];
      if (!v24)
        goto LABEL_28;
LABEL_18:
      if (v26 == v25)
        goto LABEL_28;
      v27 = v25 == v26 + 1 ? 0 : v26 + 1;
      if (fsetxattr(fd, v21, v27, v25 - (v26 + 1), 0, 0) < 0)
      {
        v28 = __error();
        if ((a3 & 1) == 0 || *v28 != 1)
          break;
      }
      if ((unint64_t)++v19 >= *a1)
        return 0;
    }
    v37 = *__error();
    v30 = "setxattr";
    v31 = 238;
    goto LABEL_43;
  }
  return 0;
}

AAEntryXATBlob AAEntryXATBlobCreate(void)
{
  AAEntryXATBlob_impl *v0;
  AAEntryXATBlob_impl *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v0 = (AAEntryXATBlob_impl *)malloc(0x30uLL);
  v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x30uLL, 0, 0x30uLL);
  }
  else
  {
    v2 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobCreate", 251, 104, *v2, "malloc", v3, v4, v6);
  }
  return v1;
}

void AAEntryXATBlobDestroy(AAEntryXATBlob xat)
{
  if (xat)
  {
    free(*((void **)xat + 2));
    free(*((void **)xat + 5));
    memset_s((char *)xat + 24, 0x18uLL, 0, 0x18uLL);
    memset_s(xat, 0x30uLL, 0, 0x30uLL);
    free(xat);
  }
}

AAEntryXATBlob AAEntryXATBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AAEntryXATBlob_impl *v10;

  v4 = (unint64_t *)AAEntryXATBlobCreate();
  v10 = (AAEntryXATBlob_impl *)v4;
  if (v4 && (aaEntryXATBlobInitWithEncodedData(v4, (char *)data, data_size, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryXATBlobDestroy(v10);
    return 0;
  }
  return v10;
}

AAEntryXATBlob AAEntryXATBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  AAEntryXATBlob_impl *v5;
  AAEntryXATBlob_impl *v6;

  v5 = AAEntryXATBlobCreate();
  v6 = v5;
  if (v5 && (aaEntryXATBlobInitWithPath(v5, (char *)dir, path) & 0x80000000) != 0)
  {
    AAEntryXATBlobDestroy(v6);
    return 0;
  }
  return v6;
}

int AAEntryXATBlobClear(AAEntryXATBlob xat)
{
  *(_QWORD *)xat = 0;
  *((_QWORD *)xat + 3) = 0;
  return 0;
}

int AAEntryXATBlobApplyToPath(AAEntryXATBlob xat, const char *dir, const char *path, AAFlagSet flags)
{
  char v4;
  char v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v23[2048];
  uint64_t v24;

  v4 = flags;
  v5 = (char)dir;
  v24 = *MEMORY[0x24BDAC8D0];
  if ((concatPath(v23, 0x800uLL, (char *)dir, path) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobApplyToPath", 299, 104, 0, "invalid path %s/%s", v7, v8, v5);
    return -1;
  }
  v9 = open(v23, 0x200000);
  if (v9 < 0)
  {
    v19 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobApplyToPath", 304, 104, v19, "open: %s", v20, v21, (char)v23);
    return -1;
  }
  v15 = v9;
  if ((aaEntryXATBlobApplyToFD(xat, v9, v4, v10, v11, v12, v13, v14) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobApplyToPath", 306, 104, 0, "applying XAT blob: %s", v16, v17, (char)v23);
    v18 = -1;
  }
  else
  {
    v18 = 0;
  }
  close(v15);
  return v18;
}

uint32_t AAEntryXATBlobGetEntryCount(AAEntryXATBlob xat)
{
  return *(_DWORD *)xat;
}

int AAEntryXATBlobGetEntry(AAEntryXATBlob xat, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  unsigned int *v8;
  _BYTE *v9;
  unint64_t v10;
  size_t v14;
  size_t v15;
  char v17;

  if (*(_QWORD *)xat <= (unint64_t)i)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobGetEntry", 328, 104, 0, "invalid XAT index %u", (uint64_t)data, (uint64_t)data_size, i);
    return -1;
  }
  v8 = (unsigned int *)(*((_QWORD *)xat + 5) + *(_QWORD *)(*((_QWORD *)xat + 2) + 8 * i));
  v9 = v8 + 1;
  v10 = *v8;
  if (v10 < 5)
    goto LABEL_15;
  v14 = 0;
  while (v9[v14])
  {
    if ((unint64_t)++v14 + 4 >= v10)
      goto LABEL_15;
  }
  if ((int)v10 - 5 - (int)v14 >= v10)
  {
LABEL_15:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobGetEntry", 338, 104, 0, "invalid XAT blob", (uint64_t)data, (uint64_t)data_size, v17);
    return -1;
  }
  v15 = (v10 - 5 - v14);
  if (key_length)
    *key_length = v14;
  if (data_size)
    *data_size = v15;
  if (v14 >= key_capacity)
  {
    if (key_capacity)
      return -1;
  }
  else
  {
    memcpy(key, v9, v14);
    key[v14] = 0;
  }
  if (v15 > data_capacity)
  {
    if (!data_capacity)
      return 0;
    return -1;
  }
  memcpy(data, (char *)v8 + v10 - (v10 - 5 - v14), (v10 - 5 - v14));
  return 0;
}

int AAEntryXATBlobSetEntry(AAEntryXATBlob xat, uint32_t i, const char *key, const uint8_t *data, size_t data_size)
{
  uint64_t v5;
  uint64_t v6;
  size_t v12;
  size_t v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  size_t v23;
  const char *v24;
  __int16 v25;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  size_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char v48;
  size_t v49;
  uint64_t v50;
  unint64_t v51;

  if (*(_QWORD *)xat <= (unint64_t)i)
  {
    v24 = "invalid XAT index";
    v25 = 401;
    goto LABEL_11;
  }
  v12 = strlen(key);
  v13 = v12 + 1;
  v14 = v12 + 5;
  if (v12 + 1 >= 0xFFFFFFFFFFFFFFFCLL || (v15 = data_size + v14, __CFADD__(data_size, v14)) || v15 >= 0xFFFFFFFF)
  {
    v24 = "invalid attribute size";
    v25 = 409;
    goto LABEL_11;
  }
  if (v15 < 4)
    goto LABEL_8;
  v16 = i;
  v17 = *(_QWORD *)(*((_QWORD *)xat + 2) + 8 * i);
  v18 = (char *)*((_QWORD *)xat + 5);
  v19 = *(unsigned int *)&v18[v17];
  v20 = v17 + v19;
  if (__CFADD__(v17, v19)
    || (v21 = (unint64_t *)((char *)xat + 24), v22 = *((_QWORD *)xat + 3), v23 = v22 - v20, v22 < v20))
  {
LABEL_8:
    v24 = "alloc XAT entry";
    v25 = 412;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobSetEntry", v25, 104, 0, v24, v5, v6, v48);
    return -1;
  }
  v27 = v15 - v19;
  if (v15 > v19)
  {
    v28 = v22 + v27;
    if ((uint64_t)(v22 + v27) < 0)
      goto LABEL_8;
    v29 = *((_QWORD *)xat + 4);
    if (v29 < v28)
    {
      v30 = 0x4000;
      do
      {
        while (!v29)
        {
          v29 = 0x4000;
          if (v28 <= 0x4000)
            goto LABEL_29;
        }
        v31 = v29 >> 1;
        if ((v29 & (v29 >> 1)) != 0)
          v31 = v29 & (v29 >> 1);
        v29 += v31;
      }
      while (v29 < v28);
      v30 = v29;
      if (v29 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_44;
      }
LABEL_29:
      v50 = v27;
      v51 = v16;
      v49 = v30;
      v37 = (char *)realloc(v18, v30);
      if (v37)
      {
        v27 = v50;
        *((_QWORD *)xat + 4) = v49;
        *((_QWORD *)xat + 5) = v37;
        v18 = v37;
        v16 = v51;
        v21 = (unint64_t *)((char *)xat + 24);
        v23 = v22 - v20;
        goto LABEL_31;
      }
      free(v18);
LABEL_44:
      *((_QWORD *)xat + 3) = 0;
      *((_QWORD *)xat + 4) = 0;
      *((_QWORD *)xat + 5) = 0;
      goto LABEL_8;
    }
LABEL_31:
    if (v22 != v20)
    {
      v38 = &v18[v20];
      v39 = &v18[v20 + v27];
      v40 = v21;
      v41 = v16;
      v42 = v27;
      memmove(v39, v38, v23);
      v27 = v42;
      v16 = v41;
      v21 = v40;
    }
    v22 = *v21 + v27;
    goto LABEL_34;
  }
  if (v15 < v19)
  {
    v32 = v19 - v15;
    if (v22 != v20)
    {
      v33 = &v18[v20];
      v34 = &v18[v20 - v32];
      v35 = v16;
      v36 = v32;
      memmove(v34, v33, v23);
      v32 = v36;
      v16 = v35;
      v21 = (unint64_t *)((char *)xat + 24);
      v20 = *((_QWORD *)xat + 3);
    }
    v22 = v20 - v32;
LABEL_34:
    *v21 = v22;
  }
  if (v17 >= 0xFFFFFFFFFFFFFFFCLL || v17 + 4 > v22)
    goto LABEL_8;
  *(_DWORD *)(*((_QWORD *)xat + 5) + v17) = v15;
  if (*(_QWORD *)xat > v16)
  {
    v43 = v16;
    while (v17 < 0xFFFFFFFFFFFFFFFCLL && v17 + 4 <= *v21)
    {
      v44 = *(unsigned int *)(*((_QWORD *)xat + 5) + v17);
      *(_QWORD *)(*((_QWORD *)xat + 2) + 8 * v43) = v17;
      v17 += v44;
      if (++v43 >= *(_QWORD *)xat)
        goto LABEL_42;
    }
    goto LABEL_8;
  }
LABEL_42:
  v45 = *((_QWORD *)xat + 5);
  v46 = *(_QWORD *)(*((_QWORD *)xat + 2) + 8 * v16);
  *(_DWORD *)(v45 + v46) = v15;
  v47 = (char *)(v45 + v46 + 4);
  memcpy(v47, key, v13);
  memcpy(&v47[v13], data, data_size);
  return 0;
}

int AAEntryXATBlobRemoveEntry(AAEntryXATBlob xat, uint32_t i)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)xat;
  if (*(_QWORD *)xat <= (unint64_t)i
    || (v6 = i,
        v7 = *(_QWORD *)(*((_QWORD *)xat + 2) + 8 * i),
        v8 = *((_QWORD *)xat + 5),
        v9 = *(unsigned int *)(v8 + v7),
        v10 = __CFADD__(v7, v9),
        v11 = v7 + v9,
        v10)
    || (v12 = *((_QWORD *)xat + 3), v12 < v11))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c", (uint64_t)"AAEntryXATBlobRemoveEntry", 426, 104, 0, "invalid XAT index %u", v2, v3, i);
    return -1;
  }
  else
  {
    if ((_DWORD)v9)
    {
      if (v12 != v11)
      {
        memmove((void *)(v8 + v11 - v9), (const void *)(v8 + v11), v12 - v11);
        v11 = *((_QWORD *)xat + 3);
        v4 = *(_QWORD *)xat;
      }
      *((_QWORD *)xat + 3) = v11 - v9;
    }
    v14 = v4 - 1;
    *(_QWORD *)xat = v14;
    if (v14 > v6)
    {
      v15 = *((_QWORD *)xat + 2);
      do
      {
        *(_QWORD *)(v15 + 8 * v6) = *(_QWORD *)(v15 + 8 * v6 + 8) - v9;
        ++v6;
      }
      while (v6 < *(_QWORD *)xat);
    }
    return 0;
  }
}

size_t AAEntryXATBlobGetEncodedSize(AAEntryXATBlob xat)
{
  return *((_QWORD *)xat + 3);
}

const uint8_t *__cdecl AAEntryXATBlobGetEncodedData(AAEntryXATBlob xat)
{
  return (const uint8_t *)*((_QWORD *)xat + 5);
}

uint64_t loadAndDecodeHeader_Ustar(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  BOOL v32;
  char *v33;
  char *v34;
  char *v35;
  int v36;
  uint64_t v37;
  const char *v38;
  int v39;
  char v40;
  AAFieldKey v41;
  int v42;
  AAFieldKey v43;
  uint64_t v44;
  uint64_t v45;
  AAHeader_impl *v46;
  AAFieldKey v47;
  int KeyIndex;
  uint32_t v49;
  AAFieldKey v50;
  AAHeader_impl *v51;
  uint32_t v52;
  AAFieldKey v53;
  char v54;
  size_t v55;
  size_t v56;
  AAFieldKey v57;
  AAFieldKey v58;
  char *v59;
  AAFieldKey v60;
  uint64_t v61;
  AAFieldKey v62;
  uint64_t v63;
  uint64_t v64;
  AAHeader_impl *v65;
  AAFieldKey v66;
  int v67;
  uint32_t v68;
  AAFieldKey v69;
  AAHeader_impl *v70;
  AAFieldKey v71;
  AAFieldKey v72;
  int v73;
  uint32_t v74;
  AAFieldKey v75;
  AAHeader_impl *v76;
  AAFieldKey v77;
  AAFieldKey v78;
  int v79;
  uint32_t v80;
  AAFieldKey v81;
  AAHeader_impl *v82;
  AAFieldKey v83;
  uint32_t v84;
  unsigned int FieldString;
  int v86;
  size_t v87;
  _BYTE *v88;
  uint64_t i;
  size_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  char *v94;
  int v95;
  char *p_s;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t tv_sec;
  BOOL v103;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  uint64_t v110;
  AAFieldKey v111;
  AAFieldKey v112;
  char *v113;
  size_t v114;
  size_t v115;
  AAFieldKey v116;
  AAFieldKey v117;
  size_t v118;
  const char *v119;
  AAFieldKey v120;
  AAFieldKey v121;
  AAFieldKey v122;
  AAFieldKey v123;
  uint32_t v124;
  AAFieldKey v125;
  AAFieldKey v126;
  AAFieldKey v127;
  AAFieldKey v128;
  size_t v129;
  const char *v130;
  AAFieldKey v131;
  size_t v132;
  const char *v133;
  AAFieldKey v134;
  char v135;
  uint64_t *v136;
  unint64_t v137;
  __darwin_time_t v138;
  timespec v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t size;
  timespec value;
  char *__endptr;
  uint64_t v146;
  char __s;
  char v148;
  _BYTE v149[1038];

  *(_QWORD *)&v149[1022] = *MEMORY[0x24BDAC8D0];
  if (AAHeaderAssign(*(AAHeader *)(a1 + 88), *(AAHeader *)(a1 + 96)) < 0)
  {
    v16 = "init header";
    v17 = 199;
    goto LABEL_242;
  }
  if ((decodeStreamLoadHeader((_QWORD *)a1, 0x200uLL, v4, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    v16 = "invalid tar archive";
    v17 = 202;
    goto LABEL_242;
  }
  v10 = *(_BYTE **)(a1 + 64);
  if (isZero(v10, 512))
  {
    if ((decodeStreamLoadHeader((_QWORD *)a1, 0x400uLL, v11, v12, v13, v14, v8, v9) & 0x80000000) != 0)
    {
      v16 = "invalid tar archive";
      v17 = 207;
      goto LABEL_242;
    }
    if (!isZero(*(_BYTE **)(a1 + 64), 1024))
    {
      v16 = "Invalid EOF record header";
      v17 = 209;
      goto LABEL_242;
    }
    return 1;
  }
  while (1)
  {
    while (1)
    {
      v18 = *(_QWORD *)(a1 + 72);
      v19 = &v10[v18];
      v20 = &v10[v18 - 356];
      v21 = *v20;
      if (v21 != 120 && v21 != 103)
        break;
      v146 = 0;
      if ((tarParseInt(v19 - 388, 0xCuLL, &v146) & 0x80000000) != 0)
      {
        v16 = "invalid pax header";
        v17 = 229;
        goto LABEL_242;
      }
      v26 = v146;
      if (v21 == 103 && AAHeaderClear(*(AAHeader *)(a1 + 88)) < 0)
      {
        v16 = "clear header";
        v17 = 233;
        goto LABEL_242;
      }
      if ((decodeStreamLoadHeader((_QWORD *)a1, v18 + ((v26 + 511) & 0xFFFFFFFFFFFFFE00) + 512, v22, v23, v24, v25, v8, v9) & 0x80000000) != 0)
      {
        v16 = "truncated stream";
        v17 = 236;
        goto LABEL_242;
      }
      if (v26)
      {
        v27 = 0;
        v28 = *(_QWORD *)(a1 + 64) + v18;
        v29 = v28 + v26;
        v137 = v28 + v26;
        while (1)
        {
          __endptr = 0;
          v30 = strtoll((const char *)(v28 + v27), &__endptr, 10);
          if (!v30
            || ((v27 += v30, v31 = __endptr, v27 <= v26) ? (v32 = (unint64_t)__endptr > v29) : (v32 = 1),
                v32 || (v33 = (char *)(v27 - 1), v34 = (char *)(v28 + v27 - 1), *v34 != 10)))
          {
            v16 = "invalid xhdr entry";
            v17 = 249;
            goto LABEL_242;
          }
          v33[v28] = 0;
          v35 = &v31[-v28];
          if (&v31[-v28] < v33)
          {
            while (1)
            {
              v36 = *v31++;
              if (v36 != 32)
                break;
              if (++v35 >= v33)
                goto LABEL_145;
            }
          }
          if (v35 >= v33)
          {
LABEL_145:
            v16 = "invalid xhdr entry";
            v17 = 257;
            goto LABEL_242;
          }
          v37 = v28;
          while (v35[v37] != 61)
          {
            --v33;
            ++v37;
            if (v35 == v33)
              goto LABEL_145;
          }
          v136 = a2;
          v35[v37] = 0;
          v38 = &v35[v37 + 1];
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "xhdr %s: %s\n", &v35[v28], v38);
          if (!strcmp(&v35[v28], "size"))
          {
            v41.ikey = 5521732;
            v39 = 5;
LABEL_42:
            v40 = 1;
            goto LABEL_47;
          }
          if (!strcmp(&v35[v28], "path"))
          {
            v40 = 0;
            v39 = 2;
            v41.ikey = 5521744;
            goto LABEL_47;
          }
          if (!strcmp(&v35[v28], "uid"))
            break;
          if (!strcmp(&v35[v28], "gid"))
          {
            v40 = 1;
            v41.ikey = 4475207;
            goto LABEL_46;
          }
          if (!strcmp(&v35[v28], "uname"))
          {
            v41.ikey = 5130581;
            v39 = 2;
            goto LABEL_42;
          }
          if (!strcmp(&v35[v28], "gname"))
          {
            v39 = 2;
            v40 = 1;
            v41.ikey = 5130567;
          }
          else if (!strcmp(&v35[v28], "linkpath"))
          {
            v40 = 0;
            v39 = 2;
            v41.ikey = 4935244;
          }
          else
          {
            if (strcmp(&v35[v28], "mtime"))
              goto LABEL_97;
            v39 = 4;
            v40 = 1;
            v41.ikey = 5067853;
          }
LABEL_47:
          v42 = *(unsigned __int8 *)v38;
          if (*v38)
          {
            switch(v39)
            {
              case 1:
                v43 = v41;
                v44 = strtoll(v38, &__endptr, 10);
                if (__endptr != v34)
                {
                  v16 = "xhdr value parsing";
                  v17 = 295;
                  goto LABEL_242;
                }
                v45 = v44;
                v46 = *(AAHeader_impl **)(a1 + 88);
                v47 = v43;
                KeyIndex = AAHeaderGetKeyIndex(v46, v47);
                if (KeyIndex < 0)
                  v49 = -1;
                else
                  v49 = KeyIndex;
                v50 = v43;
                if (AAHeaderSetFieldUInt(v46, v49, v50, v45) < 0)
                {
                  v16 = "creating header";
                  v17 = 296;
                  goto LABEL_242;
                }
                break;
              case 2:
                v53 = v41;
                v54 = v40;
                v55 = strlen(&v35[v37 + 1]);
                if ((v54 & 1) != 0)
                {
                  v56 = v55;
                  v57 = v53;
                  goto LABEL_92;
                }
                if (v55 == 1)
                {
                  v57 = v53;
                  if (v42 == 46)
                    goto LABEL_83;
                  v55 = 1;
                }
                else
                {
                  v57 = v53;
                  if (!v55)
                  {
                    v56 = 0;
                    goto LABEL_92;
                  }
                  if (v42 == 46 && v35[v37 + 2] == 47)
                  {
                    v38 = &v35[v37 + 3];
                    v55 -= 2;
                    if (!v55)
                    {
LABEL_83:
                      v56 = 0;
                      goto LABEL_92;
                    }
                  }
                }
                if (v38[v55 - 1] == 47)
                  v56 = v55 - 1;
                else
                  v56 = v55;
LABEL_92:
                v76 = *(AAHeader_impl **)(a1 + 88);
                v77 = v57;
                v78 = v57;
                v79 = AAHeaderGetKeyIndex(v76, v78);
                if (v79 < 0)
                  v80 = -1;
                else
                  v80 = v79;
                v81 = v77;
                if (AAHeaderSetFieldString(v76, v80, v81, v38, v56) < 0)
                {
                  v16 = "creating header";
                  v17 = 309;
                  goto LABEL_242;
                }
                v26 = v146;
                break;
              case 4:
                v58 = v41;
                value.tv_sec = 0;
                value.tv_nsec = 0;
                value.tv_sec = strtoll(v38, &__endptr, 10);
                v59 = __endptr;
                if (__endptr)
                {
                  v60 = v58;
                  if (*__endptr == 46)
                  {
                    v61 = strtoll(__endptr + 1, &__endptr, 10);
                    v60 = v58;
                    value.tv_nsec = v61;
                    v59 = __endptr;
                  }
                }
                else
                {
                  v60 = v58;
                }
                if (v59 != v34)
                {
                  v16 = "xhdr value parsing";
                  v17 = 317;
                  goto LABEL_242;
                }
                v70 = *(AAHeader_impl **)(a1 + 88);
                v71 = v60;
                v72 = v60;
                v73 = AAHeaderGetKeyIndex(v70, v72);
                if (v73 < 0)
                  v74 = -1;
                else
                  v74 = v73;
                v75 = v71;
                if (AAHeaderSetFieldTimespec(v70, v74, v75, &value) < 0)
                {
                  v16 = "creating header";
                  v17 = 318;
                  goto LABEL_242;
                }
                break;
              case 5:
                v62 = v41;
                v63 = strtoll(v38, &__endptr, 10);
                if (__endptr != v34)
                {
                  v16 = "xhdr value parsing";
                  v17 = 288;
                  goto LABEL_242;
                }
                v64 = v63;
                v65 = *(AAHeader_impl **)(a1 + 88);
                v66 = v62;
                v67 = AAHeaderGetKeyIndex(v65, v66);
                if (v67 < 0)
                  v68 = -1;
                else
                  v68 = v67;
                v69 = v62;
                if (AAHeaderSetFieldBlob(v65, v68, v69, v64) < 0)
                {
                  v16 = "creating header";
                  v17 = 289;
                  goto LABEL_242;
                }
                break;
              default:
                break;
            }
          }
          else
          {
            v51 = *(AAHeader_impl **)(a1 + 88);
            v52 = AAHeaderGetKeyIndex(v51, v41);
            if ((v52 & 0x80000000) == 0 && AAHeaderRemoveField(v51, v52) < 0)
            {
              v16 = "removing header field";
              v17 = 278;
              goto LABEL_242;
            }
          }
LABEL_97:
          a2 = v136;
          v29 = v137;
          if (v27 >= v26)
            goto LABEL_98;
        }
        v41.ikey = 4475221;
        v40 = 1;
LABEL_46:
        v39 = 1;
        goto LABEL_47;
      }
LABEL_98:
      if (*v20 == 103 && AAHeaderAssign(*(AAHeader *)(a1 + 96), *(AAHeader *)(a1 + 88)) < 0)
      {
        v16 = "update global header";
        v17 = 330;
        goto LABEL_242;
      }
      v10 = *(_BYTE **)(a1 + 64);
    }
    if ((v82 = *(AAHeader_impl **)(a1 + 88)) != 0
      && (v83.ikey = 5521744, v84 = AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v83), (v84 & 0x80000000) == 0)
      && ((FieldString = AAHeaderGetFieldString(v82, v84, 0x400uLL, &__s, 0), FieldString <= 1)
        ? (v86 = 1)
        : (v86 = FieldString),
          v86 < 0 || FieldString < 2))
    {
      if (v86 < 0)
        goto LABEL_144;
    }
    else
    {
      v87 = 0;
      v88 = v19 - 512;
      do
      {
        if (!v88[v87])
          break;
        ++v87;
      }
      while (v87 != 100);
      for (i = 0; i != 155; ++i)
      {
        if (!v19[i - 167])
          break;
      }
      do
      {
        v90 = v87;
        if (!v87)
          break;
        --v87;
      }
      while (v88[v90 - 1] == 47);
      v91 = i - 1022;
      while (v91 != -1022)
      {
        v92 = v19[v91-- + 854];
        if (v92 != 47)
        {
          if (v90 + v91 >= 0xFFFFFFFFFFFFFBFFLL)
          {
            __memcpy_chk();
            v93 = v91 + 1024;
            v149[v91 + 1021] = 47;
            goto LABEL_123;
          }
LABEL_144:
          v16 = "invalid header";
          v17 = 337;
          goto LABEL_242;
        }
      }
      if (v90 - 1023 < 0xFFFFFFFFFFFFFBFFLL)
        goto LABEL_144;
      v93 = 0;
LABEL_123:
      memcpy(&__s + v93, v19 - 512, v90);
      *(&__s + v93 + v90) = 0;
    }
    v94 = strrchr(&__s, 47);
    v95 = (char)*v20;
    if (v95 != 48)
      break;
    if (v94)
      p_s = v94 + 1;
    else
      p_s = &__s;
    if (*p_s != 46)
      goto LABEL_159;
    v97 = v94 + 2;
    if (!v94)
      v97 = &v148;
    if (*v97 != 95)
    {
LABEL_159:
      v105 = 0;
      v106 = 0;
      v107 = 0;
      v108 = 0;
      v109 = 1;
      v110 = 70;
LABEL_160:
      v111.ikey = 5265748;
      if (AAHeaderSetFieldUInt(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v111, v110) < 0)
      {
        v16 = "creating header";
        v17 = 394;
        goto LABEL_242;
      }
      v112.ikey = 5521744;
      if (AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v112) < 0)
      {
        v113 = &__s;
        v114 = strlen(&__s);
        v115 = v114;
        if (v114 == 1 && __s == 46)
        {
          v115 = 0;
        }
        else
        {
          v113 = &__s;
          if (v114 >= 2 && __s == 46 && v148 == 47)
          {
            v113 = v149;
            v115 = v114 - 2;
          }
        }
        v116.ikey = 5521744;
        if (AAHeaderSetFieldString(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v116, v113, v115) < 0)
        {
          v16 = "creating header";
          v17 = 405;
          goto LABEL_242;
        }
      }
      if ((v105 | v106) == 1)
      {
        v117.ikey = 4935244;
        if (AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v117) < 0)
        {
          v118 = 0;
          v119 = v19 - 355;
          while (v119[v118])
          {
            if (++v118 == 100)
              goto LABEL_180;
          }
          if (!v118)
          {
            v16 = "invalid linkname";
            v17 = 412;
            goto LABEL_243;
          }
          if (v118 != 1)
          {
LABEL_180:
            if (*v119 == 46 && *(v19 - 354) == 47)
            {
              v119 = v19 - 353;
              v118 -= 2;
            }
          }
          v120.ikey = 4935244;
          if (AAHeaderSetFieldString(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v120, v119, v118) < 0)
          {
            v16 = "creating header";
            v17 = 417;
            goto LABEL_242;
          }
        }
      }
      if ((v107 | v108) == 1)
      {
        value.tv_sec = 0;
        v146 = 0;
        if ((tarParseInt(v19 - 183, 8uLL, (unint64_t *)&value) & 0x80000000) != 0)
        {
          v16 = "invalid header";
          v17 = 424;
          goto LABEL_242;
        }
        if ((tarParseInt(v19 - 175, 8uLL, &v146) & 0x80000000) != 0)
        {
          v16 = "invalid header";
          v17 = 425;
          goto LABEL_242;
        }
        v121.ikey = 5653828;
        if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v121, value.tv_sec) & 0x80000000) != 0)
        {
          v16 = "creating header";
          v17 = 426;
          goto LABEL_242;
        }
        v122.ikey = 3294532;
        if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v122, v146) & 0x80000000) != 0)
        {
          v16 = "creating header";
          v17 = 427;
          goto LABEL_242;
        }
      }
      size = 0;
      if ((tarParseInt(v19 - 388, 0xCuLL, &size) & 0x80000000) != 0)
      {
        v16 = "invalid header";
        v17 = 432;
        goto LABEL_242;
      }
      if (v109)
      {
        v123.ikey = 5521732;
        v124 = AAHeaderGetKeyIndex(*(AAHeader *)(a1 + 88), v123);
        if ((v124 & 0x80000000) != 0)
        {
          v125.ikey = 5521732;
          if (AAHeaderSetFieldBlob(*(AAHeader *)(a1 + 88), 0xFFFFFFFF, v125, size) < 0)
          {
            v16 = "creating header";
            v17 = 438;
            goto LABEL_242;
          }
        }
        else
        {
          value.tv_sec = 0;
          if (AAHeaderGetFieldBlob(*(AAHeader *)(a1 + 88), v124, &size, (uint64_t *)&value) < 0)
          {
            v16 = "looking up header";
            v17 = 443;
            goto LABEL_242;
          }
        }
      }
      v141 = 0;
      v142 = 0;
      v140 = 0;
      if ((tarParseInt(v19 - 412, 8uLL, &v142) & 0x80000000) != 0)
      {
        v16 = "invalid header";
        v17 = 449;
        goto LABEL_242;
      }
      if ((tarParseInt(v19 - 404, 8uLL, &v141) & 0x80000000) != 0)
      {
        v16 = "invalid header";
        v17 = 450;
        goto LABEL_242;
      }
      if ((tarParseInt(v19 - 396, 8uLL, &v140) & 0x80000000) != 0)
      {
        v16 = "invalid header";
        v17 = 451;
        goto LABEL_242;
      }
      v126.ikey = 4476749;
      if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v126, v142) & 0x80000000) != 0)
      {
        v16 = "creating header";
        v17 = 452;
        goto LABEL_242;
      }
      v127.ikey = 4475221;
      if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v127, v141) & 0x80000000) != 0)
      {
        v16 = "creating header";
        v17 = 453;
        goto LABEL_242;
      }
      v128.ikey = 4475207;
      if ((appendFieldIfNotDefinedUInt(*(AAHeader_impl **)(a1 + 88), v128, v140) & 0x80000000) != 0)
      {
        v16 = "creating header";
        v17 = 454;
        goto LABEL_242;
      }
      v139.tv_sec = 0;
      v139.tv_nsec = 0;
      v138 = 0;
      if ((tarParseInt(v19 - 376, 0xCuLL, (unint64_t *)&v138) & 0x80000000) != 0)
      {
        v16 = "invalid header";
        v17 = 459;
        goto LABEL_242;
      }
      v139.tv_sec = v138;
      if ((appendFieldIfNotDefinedTimespec(*(AAHeader_impl **)(a1 + 88), &v139) & 0x80000000) != 0)
      {
        v16 = "creating header";
        v17 = 461;
        goto LABEL_242;
      }
      v129 = 0;
      v130 = v19 - 247;
      while (v130[v129])
      {
        if (++v129 == 32)
          goto LABEL_232;
      }
      if (v129)
      {
LABEL_232:
        v131.ikey = 5130581;
        if ((appendFieldIfNotDefinedString(*(AAHeader_impl **)(a1 + 88), v131, v130, v129) & 0x80000000) != 0)
        {
          v16 = "creating header";
          v17 = 465;
          goto LABEL_242;
        }
      }
      v132 = 0;
      v133 = v19 - 215;
      while (v133[v132])
      {
        if (++v132 == 32)
          goto LABEL_238;
      }
      if (v132)
      {
LABEL_238:
        v134.ikey = 5130567;
        if ((appendFieldIfNotDefinedString(*(AAHeader_impl **)(a1 + 88), v134, v133, v132) & 0x80000000) != 0)
        {
          v16 = "creating header";
          v17 = 467;
          goto LABEL_242;
        }
      }
      result = 0;
      *a2 = (size + 511) & 0xFFFFFFFFFFFFFE00;
      return result;
    }
    value.tv_sec = 0;
    if ((tarParseInt(v19 - 388, 0xCuLL, (unint64_t *)&value) & 0x80000000) != 0)
    {
      v16 = "invalid header";
      v17 = 346;
      goto LABEL_242;
    }
    tv_sec = value.tv_sec;
    if ((decodeStreamLoadHeader((_QWORD *)a1, v18 + ((value.tv_sec + 511) & 0xFFFFFFFFFFFFFE00) + 512, v98, v99, v100, v101, v8, v9) & 0x80000000) != 0)
    {
      v16 = "truncated stream";
      v17 = 350;
      goto LABEL_242;
    }
    if (tv_sec >= 0x18)
    {
      v10 = *(_BYTE **)(a1 + 64);
      v103 = *(_QWORD *)&v10[v18] == 0x20007160500 && *(_QWORD *)&v10[v18 + 8] == 0x5820534F2063614DLL;
      if (v103 && *(_QWORD *)&v10[v18 + 16] == 0x2020202020202020)
        continue;
    }
    v16 = "invalid ._ entry";
    v17 = 361;
    goto LABEL_242;
  }
  v105 = 0;
  v106 = 0;
  v107 = 0;
  v108 = 0;
  v109 = 0;
  v110 = 68;
  switch(v95)
  {
    case '0':
    case '7':
      goto LABEL_159;
    case '1':
      v105 = 0;
      v107 = 0;
      v108 = 0;
      v109 = 0;
      v106 = 1;
      v110 = 72;
      goto LABEL_160;
    case '2':
      v106 = 0;
      v107 = 0;
      v108 = 0;
      v109 = 0;
      v105 = 1;
      v110 = 76;
      goto LABEL_160;
    case '3':
      v105 = 0;
      v106 = 0;
      v107 = 0;
      v109 = 0;
      v108 = 1;
      v110 = 67;
      goto LABEL_160;
    case '4':
      v105 = 0;
      v106 = 0;
      v108 = 0;
      v109 = 0;
      v107 = 1;
      v110 = 66;
      goto LABEL_160;
    case '5':
      goto LABEL_160;
    case '6':
      break;
    default:
      if (!v95)
        goto LABEL_159;
      break;
  }
  v135 = v95;
  v16 = "Non supported entry type %u";
  v17 = 392;
LABEL_242:
  LODWORD(v118) = 0;
LABEL_243:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStreamTar.c", (uint64_t)"loadAndDecodeHeader_Ustar", v17, 70, v118, v16, v8, v9, v135);
  return 0xFFFFFFFFLL;
}

uint64_t isZero(_BYTE *a1, uint64_t a2)
{
  unint64_t v2;
  _BYTE *v3;
  uint64_t v5;

  v2 = (unint64_t)&a1[a2];
  if (a2 >= 1 && (a1 & 7) != 0)
  {
    v3 = a1 + 1;
    while (!*a1)
    {
      if ((unint64_t)++a1 < v2)
      {
        if ((unint64_t)(v3++ & 7))
          continue;
      }
      goto LABEL_9;
    }
    return 0;
  }
  else
  {
LABEL_9:
    while ((unint64_t)(a1 + 8) <= v2)
    {
      v5 = *(_QWORD *)a1;
      a1 += 8;
      if (v5)
        return 0;
    }
    while ((unint64_t)a1 < v2)
    {
      if (*a1)
        return 0;
      ++a1;
    }
    return 1;
  }
}

uint64_t tarParseInt(_BYTE *a1, unint64_t a2, unint64_t *a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  char v12;

  v3 = *a1;
  v4 = 0xFFFFFFFFLL;
  if (*a1 && v3 != 128 && v3 != 255)
  {
    v5 = 0;
    if (a2)
    {
      while (a1[v5] == 32)
      {
        if (a2 == ++v5)
          return 0xFFFFFFFFLL;
      }
    }
    v6 = a2 - v5;
    if (a2 <= v5)
      return 0xFFFFFFFFLL;
    v7 = 0;
    v8 = 0;
    v9 = -3 * v5 + 3 * a2;
    v10 = &a1[v5];
    while (1)
    {
      v12 = *v10++;
      v11 = v12;
      if ((v12 & 0xF8) != 0x30)
        break;
      v7 += 3;
      v8 = v11 & 7 | (8 * v8);
      if (!--v6)
      {
        v7 = v9;
        break;
      }
    }
    if ((unint64_t)(v7 - 65) >= 0xFFFFFFFFFFFFFFC0)
    {
      v4 = 0;
      *a3 = v8;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v4;
}

uint64_t appendFieldIfNotDefinedUInt(AAHeader_impl *a1, AAFieldKey a2, uint64_t a3)
{
  AAFieldKey v7;

  if ((AAHeaderGetKeyIndex(a1, a2) & 0x80000000) == 0)
    return 0;
  v7 = a2;
  return AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v7, a3);
}

uint64_t appendFieldIfNotDefinedTimespec(AAHeader_impl *a1, const timespec *a2)
{
  AAFieldKey v4;
  AAFieldKey v6;

  v4.ikey = 5067853;
  if ((AAHeaderGetKeyIndex(a1, v4) & 0x80000000) == 0)
    return 0;
  v6.ikey = 5067853;
  return AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v6, a2);
}

uint64_t appendFieldIfNotDefinedString(AAHeader_impl *a1, AAFieldKey a2, const char *a3, size_t a4)
{
  AAFieldKey v9;

  if ((AAHeaderGetKeyIndex(a1, a2) & 0x80000000) == 0)
    return 0;
  v9 = a2;
  return AAHeaderSetFieldString(a1, 0xFFFFFFFF, v9, a3, a4);
}

uint64_t aaEntryACLBlobInitWithEncodedData(_QWORD *a1, char *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  char v12;
  rsize_t *v13;
  char v14;
  rsize_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  rsize_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  rsize_t v27;
  rsize_t v28;
  size_t v29;
  void *v30;
  void *v31;
  rsize_t v32;
  size_t v33;
  rsize_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v42;
  unint64_t v43;
  BOOL v44;
  int v45;
  uint64_t v47;
  uint64_t result;
  __int16 v49;
  char v50;

  *a1 = 0;
  a1[3] = 0;
  v8 = a1 + 3;
  if (!__smax)
    return 0;
  v12 = 0;
  v13 = a1 + 4;
  v14 = 1;
  while (2)
  {
    v15 = 0;
    v16 = 0;
    v17 = v14;
    do
    {
      if (v15 + 4 > __smax)
        goto LABEL_81;
      v18 = *(unsigned int *)&__src[v15];
      if (v18 < 4)
        goto LABEL_81;
      v19 = __CFADD__(v18, v15);
      v20 = v18 + v15;
      if (v19 || v20 > __smax)
        goto LABEL_81;
      if ((v12 & 1) != 0)
      {
        v21 = a1[2];
        v22 = (*a1)++;
        *(_QWORD *)(v21 + 8 * v22) = v15;
      }
      ++v16;
      v15 = v20;
    }
    while (v20 < __smax);
    if (v20 != __smax)
      goto LABEL_81;
    if ((v17 & 1) == 0)
      break;
    if (v16 > 0xFFFFFFFE)
      goto LABEL_81;
    v23 = a1[1];
    if (v23 < v16)
    {
      v24 = a1[1];
      do
      {
        if (v24)
          v24 *= 2;
        else
          v24 = 16;
      }
      while (v24 < v16);
      if (v24 > v23)
      {
        a1[1] = v24;
        if (8 * v24 >= 0x2000000001)
        {
          *__error() = 12;
        }
        else
        {
          v25 = (void *)a1[2];
          v26 = realloc(v25, 8 * v24);
          if (v26)
          {
            a1[2] = v26;
            goto LABEL_24;
          }
          free(v25);
        }
        a1[2] = 0;
LABEL_81:
        *a1 = 0;
        a1[3] = 0;
        v49 = 169;
LABEL_82:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", v49, 100, 0, "invalid ACL blob", a7, a8, v50);
LABEL_83:
        *a1 = 0;
        a1[3] = 0;
        return 0xFFFFFFFFLL;
      }
    }
LABEL_24:
    if ((__smax & 0x8000000000000000) != 0)
      goto LABEL_81;
    v27 = *v13;
    if (*v13 < __smax)
    {
      do
      {
        while (!v27)
        {
          v27 = 0x4000;
          v29 = 0x4000;
          if (__smax <= 0x4000)
            goto LABEL_34;
        }
        v28 = v27 >> 1;
        if ((v27 & (v27 >> 1)) != 0)
          v28 = v27 & (v27 >> 1);
        v27 += v28;
      }
      while (v27 < __smax);
      v29 = v27;
      if (v27 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_74;
      }
LABEL_34:
      v30 = (void *)a1[5];
      v31 = realloc(v30, v29);
      if (v31)
      {
        a1[4] = v29;
        a1[5] = v31;
        goto LABEL_36;
      }
      free(v30);
LABEL_74:
      *v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      goto LABEL_81;
    }
LABEL_36:
    v14 = 0;
    v12 = 1;
    if ((v17 & 1) != 0)
      continue;
    break;
  }
  *v8 = 0;
  if ((__smax & 0x8000000000000000) != 0)
    goto LABEL_81;
  v32 = *v13;
  if (*v13 < __smax)
  {
    v33 = 0x4000;
    do
    {
      while (!v32)
      {
        v32 = 0x4000;
        if (__smax <= 0x4000)
          goto LABEL_50;
      }
      v34 = v32 >> 1;
      if ((v32 & (v32 >> 1)) != 0)
        v34 = v32 & (v32 >> 1);
      v32 += v34;
    }
    while (v32 < __smax);
    v33 = v32;
    if (v32 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_80;
    }
LABEL_50:
    v35 = (void *)a1[5];
    v36 = realloc(v35, v33);
    if (v36)
    {
      a1[4] = v33;
      a1[5] = v36;
      goto LABEL_52;
    }
    free(v35);
LABEL_80:
    *v13 = 0;
    v13[1] = 0;
    goto LABEL_81;
  }
LABEL_52:
  v37 = a1[5];
  if (__src)
  {
    memcpy((void *)(v37 + *v8), __src, __smax);
  }
  else if (v37)
  {
    memset_s((void *)(v37 + *v8), __smax, 0, __smax);
  }
  a1[3] += __smax;
  v38 = *a1;
  if (*a1)
  {
    v39 = 0;
    while (1)
    {
      if (v38 == v39 || (v40 = a1[5] + *(_QWORD *)(a1[2] + 8 * v39), (*(_DWORD *)v40 + 1) <= 0x16))
      {
        v49 = 179;
        goto LABEL_82;
      }
      if ((*(char *)(v40 + 4) - 65) > 0x14 || ((1 << (*(_BYTE *)(v40 + 4) - 65)) & 0x100809) == 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 188, 100, 0, "invalid ACL entry type %c", a7, a8, *(_BYTE *)(v40 + 4));
        goto LABEL_83;
      }
      HIDWORD(v43) = *(char *)(v40 + 21) - 71;
      LODWORD(v43) = HIDWORD(v43);
      v42 = v43 >> 1;
      v44 = v42 > 7;
      v45 = (1 << v42) & 0xC3;
      if (v44 || v45 == 0)
        break;
      if ((*(_QWORD *)(v40 + 5) & 0xFFFFFFFFFCFDFE0FLL) != 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 199, 100, 0, "invalid ACL flags 0x%llx", a7, a8, *(_QWORD *)(v40 + 5));
        goto LABEL_83;
      }
      v47 = *(_QWORD *)(v40 + 13);
      if ((v47 & 0xFFFFFFFFFFEFC001) != 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 200, 100, 0, "invalid ACL perms 0x%llx", a7, a8, v47);
        goto LABEL_83;
      }
      result = 0;
      if (v38 == ++v39)
        return result;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithEncodedData", 197, 100, 0, "invalid ACL qualifier type %c", a7, a8, *(_BYTE *)(v40 + 21));
    goto LABEL_83;
  }
  return 0;
}

uint64_t aaEntryACLBlobInitWithPath(AAEntryACLBlob_impl *a1, char *__s, const char *a3, char a4)
{
  char v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v18[2048];
  uint64_t v19;

  v5 = (char)__s;
  v19 = *MEMORY[0x24BDAC8D0];
  if ((concatPath(v18, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithPath", 215, 100, 0, "invalid path %s/%s", v7, v8, v5);
    return 0xFFFFFFFFLL;
  }
  v9 = open(v18, 0x200000);
  if (v9 < 0)
  {
    v14 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithPath", 219, 100, v14, "open: %s", v15, v16, (char)v18);
    return 0xFFFFFFFFLL;
  }
  v10 = v9;
  if ((aaEntryACLBlobInitWithFD(a1, v9, a4) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithPath", 221, 100, 0, "initializing ACL blob: %s", v11, v12, (char)v18);
    v13 = 0xFFFFFFFFLL;
  }
  else
  {
    v13 = 0;
  }
  close(v10);
  return v13;
}

uint64_t aaEntryACLBlobInitWithFD(AAEntryACLBlob_impl *a1, int a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  _acl *fd_np;
  _acl *v13;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  AAACEFlagSet v21;
  const unsigned __int8 *qualifier;
  unsigned __int8 *v23;
  AAACEQualifierType v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  __int16 v32;
  char v33;
  passwd *v34;
  passwd v35;
  AAAccessControlEntry ace;
  nt_sid_t sid;
  int id_type[2];
  acl_flagset_t flagset_p;
  acl_permset_mask_t mask_p;
  acl_tag_t tag_type_p;
  acl_entry_t entry_p;
  uint8_t out[264];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = sysconf(71);
  v7 = sysconf(70);
  if (v6 <= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8 <= 4096)
    v9 = 4096;
  else
    v9 = v8;
  if (v9 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_14:
    v15 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", 243, 100, *v15, "malloc", v16, v17, v33);
    goto LABEL_15;
  }
  v10 = malloc(v9);
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 3) = 0;
  fd_np = acl_get_fd_np(a2, ACL_TYPE_EXTENDED);
  if (!fd_np)
  {
LABEL_13:
    free(v11);
    return 0;
  }
  v13 = fd_np;
  entry_p = 0;
  if (acl_get_entry(fd_np, 0, &entry_p))
  {
LABEL_12:
    acl_free(v13);
    goto LABEL_13;
  }
  while (1)
  {
    tag_type_p = ACL_UNDEFINED_TAG;
    flagset_p = 0;
    mask_p = 0;
    *(_QWORD *)id_type = 0;
    memset(&sid, 0, sizeof(sid));
    memset(&ace, 0, sizeof(ace));
    memset(out, 0, 256);
    if (acl_get_tag_type(entry_p, &tag_type_p))
    {
      v28 = *__error();
      v31 = "acl_get_tag_type";
      v32 = 272;
LABEL_66:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", v32, 100, v28, v31, v29, v30, v33);
      goto LABEL_67;
    }
    if (tag_type_p - 1 <= 1)
      break;
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", 274, 100, "Warning: ACL tag type is not ALLOW/DENY (ignoring entry): %d\n", v18, v19, v20, tag_type_p);
LABEL_60:
    if (acl_get_entry(v13, -1, &entry_p))
      goto LABEL_12;
  }
  ace.tag = tag_type_p;
  if (acl_get_flagset_np(entry_p, &flagset_p))
  {
    v28 = *__error();
    v31 = "acl_get_flagset_np";
    v32 = 278;
    goto LABEL_66;
  }
  if (acl_get_flag_np(flagset_p, ACL_FLAG_NO_INHERIT))
  {
    ace.flags = 0x20000;
    v21 = 0x20000;
  }
  else
  {
    v21 = 0;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
  {
    v21 |= 0x10uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_FILE_INHERIT))
  {
    v21 |= 0x20uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_DIRECTORY_INHERIT))
  {
    v21 |= 0x40uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_LIMIT_INHERIT))
  {
    v21 |= 0x80uLL;
    ace.flags = v21;
  }
  if (acl_get_flag_np(flagset_p, ACL_ENTRY_ONLY_INHERIT))
    ace.flags = v21 | 0x100;
  if (acl_get_permset_mask_np(entry_p, &mask_p))
  {
    v28 = *__error();
    v31 = "acl_get_permset_mask_np";
    v32 = 289;
    goto LABEL_66;
  }
  ace.perms = mask_p & 0x103FFE;
  qualifier = (const unsigned __int8 *)acl_get_qualifier(entry_p);
  if (!qualifier)
  {
    v28 = *__error();
    v31 = "acl_get_qualifier";
    v32 = 294;
    goto LABEL_66;
  }
  v23 = (unsigned __int8 *)qualifier;
  if ((a3 & 4) != 0)
    goto LABEL_57;
  if (mbr_uuid_to_id(qualifier, (id_t *)&id_type[1], id_type))
    goto LABEL_53;
  if (id_type[0] == 1)
  {
    memset(&v35, 0, 32);
    v34 = 0;
    v24 = 0;
    if (!getgrgid_r(id_type[1], (group *)&v35, (char *)v11, v9, (group **)&v34) && v34 && v35.pw_name)
    {
      if (strlen(v35.pw_name) > 0xFF)
        goto LABEL_51;
      v24 = 71;
LABEL_50:
      ace.qualifier_type = v24;
      __strlcpy_chk();
    }
  }
  else
  {
    if (id_type[0])
      goto LABEL_53;
    memset(&v35, 0, sizeof(v35));
    v34 = 0;
    v24 = 0;
    if (!getpwuid_r(id_type[1], &v35, (char *)v11, v9, &v34) && v34 && v35.pw_name)
    {
      if (strlen(v35.pw_name) <= 0xFF)
      {
        v24 = 85;
        goto LABEL_50;
      }
LABEL_51:
      v24 = 0;
    }
  }
  if (!v24)
  {
LABEL_53:
    if (!mbr_uuid_to_sid(v23, &sid) && !mbr_sid_to_string(&sid, (char *)v11) && strlen((const char *)v11) <= 0xFF)
    {
      ace.qualifier_type = 83;
      __strlcpy_chk();
      goto LABEL_58;
    }
LABEL_57:
    ace.qualifier_type = 73;
    uuid_unparse_upper(v23, (char *)out);
  }
LABEL_58:
  v25 = strlen((const char *)out);
  if ((AAEntryACLBlobAppendEntry(a1, &ace, out, v25) & 0x80000000) == 0)
  {
    acl_free(v23);
    goto LABEL_60;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobInitWithFD", 340, 100, 0, "encoding entry", v26, v27, v33);
  acl_free(v23);
LABEL_67:
  acl_free(v13);
  free(v11);
LABEL_15:
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 3) = 0;
  return 0xFFFFFFFFLL;
}

int AAEntryACLBlobAppendEntry(AAEntryACLBlob acl, const AAAccessControlEntry *ace, const uint8_t *qualifier_value, size_t qualifier_size)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  _QWORD *v23;
  const char *v24;
  __int16 v25;
  void *v26;
  size_t v27;
  size_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  size_t v33;
  void **v34;
  char *v35;
  _QWORD *v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  uint64_t v45;
  void **v46;

  if ((ace_check_entry((uint64_t)ace, (uint64_t)ace, (uint64_t)qualifier_value, qualifier_size, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    v24 = "invalid ACL entry";
    v25 = 618;
LABEL_50:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobAppendEntry", v25, 100, 0, v24, v12, v13, v44);
    return -1;
  }
  if (qualifier_size > 0xFFFFFFE9 || (v14 = (qualifier_size + 22), (_DWORD)qualifier_size == -23))
  {
    v24 = "ACL entry size out of range";
    v25 = 622;
    goto LABEL_50;
  }
  if (v14 < 4)
    goto LABEL_49;
  v15 = (_QWORD *)((char *)acl + 24);
  v16 = *((_QWORD *)acl + 3);
  v17 = v16 + v14;
  if (__CFADD__(v16, v14))
    goto LABEL_49;
  v19 = *(_QWORD *)acl;
  v18 = *((_QWORD *)acl + 1);
  v20 = *(_QWORD *)acl + 1;
  if (v18 < v20)
  {
    v21 = *((_QWORD *)acl + 1);
    do
    {
      if (v21)
        v21 *= 2;
      else
        v21 = 16;
    }
    while (v21 < v20);
    if (v21 > v18)
    {
      v45 = *(_QWORD *)acl;
      v23 = (_QWORD *)((char *)acl + 16);
      v22 = (void *)*((_QWORD *)acl + 2);
      *((_QWORD *)acl + 1) = v21;
      if (8 * v21 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_48:
        *(_QWORD *)acl = 0;
        *v23 = 0;
        *((_QWORD *)acl + 3) = 0;
        goto LABEL_49;
      }
      v26 = realloc(v22, 8 * v21);
      if (!v26)
      {
        free(v22);
        goto LABEL_48;
      }
      *v23 = v26;
      v19 = v45;
    }
  }
  if ((v17 & 0x8000000000000000) != 0)
    goto LABEL_44;
  v27 = *((_QWORD *)acl + 4);
  if (v27 < v17)
  {
    do
    {
      while (!v27)
      {
        v27 = 0x4000;
        if (v17 <= 0x4000)
        {
          v27 = 0x4000;
          goto LABEL_30;
        }
      }
      v28 = v27 >> 1;
      if ((v27 & (v27 >> 1)) != 0)
        v28 = v27 & (v27 >> 1);
      v27 += v28;
    }
    while (v27 < v17);
    if (v27 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_43;
    }
LABEL_30:
    v29 = (void *)*((_QWORD *)acl + 5);
    v30 = realloc(v29, v27);
    if (v30)
    {
      *((_QWORD *)acl + 4) = v27;
      *((_QWORD *)acl + 5) = v30;
      goto LABEL_32;
    }
    free(v29);
LABEL_43:
    *((_QWORD *)acl + 4) = 0;
    *((_QWORD *)acl + 5) = 0;
LABEL_44:
    *(_QWORD *)acl = 0;
    *((_QWORD *)acl + 3) = 0;
    goto LABEL_49;
  }
LABEL_32:
  v31 = *v15;
  v32 = *v15 + v14;
  if (__CFADD__(*v15, v14) || (v32 & 0x8000000000000000) != 0)
    goto LABEL_49;
  if (v27 < v32)
  {
    do
    {
      while (!v27)
      {
        v27 = 0x4000;
        if (v32 <= 0x4000)
        {
          v34 = (void **)((char *)acl + 40);
          v27 = 0x4000;
          goto LABEL_53;
        }
      }
      v33 = v27 >> 1;
      if ((v27 & (v27 >> 1)) != 0)
        v33 = v27 & (v27 >> 1);
      v27 += v33;
    }
    while (v27 < v32);
    v34 = (void **)((char *)acl + 40);
    if (v27 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_69;
    }
LABEL_53:
    v46 = v34;
    v38 = *v34;
    v35 = (char *)realloc(v38, v27);
    if (v35)
    {
      *((_QWORD *)acl + 5) = v35;
      v36 = (_QWORD *)((char *)acl + 40);
      *((_QWORD *)acl + 4) = v27;
      v31 = *((_QWORD *)acl + 3);
      goto LABEL_55;
    }
    free(v38);
    v34 = v46;
LABEL_69:
    *v34 = 0;
    *v15 = 0;
    *((_QWORD *)acl + 4) = 0;
    goto LABEL_49;
  }
  v36 = (_QWORD *)((char *)acl + 40);
  v35 = (char *)*((_QWORD *)acl + 5);
  if (v35)
  {
LABEL_55:
    memset_s(&v35[v31], (qualifier_size + 22), 0, (qualifier_size + 22));
    v31 = *v15;
  }
  *((_QWORD *)acl + 3) = v31 + v14;
  v39 = *((_QWORD *)acl + 2);
  v40 = (*(_QWORD *)acl)++;
  *(_QWORD *)(v39 + 8 * v40) = v16;
  if (v16 >= 0xFFFFFFFFFFFFFFFCLL || v16 + 4 > *v15 || (*(_DWORD *)(*v36 + v16) = v14, v19 < 0))
  {
LABEL_49:
    v24 = "alloc ACL entry";
    v25 = 626;
    goto LABEL_50;
  }
  v41 = *((_QWORD *)acl + 5) + *(_QWORD *)(*((_QWORD *)acl + 2) + 8 * v19);
  *(_DWORD *)v41 = v14;
  if (ace->tag == ACL_EXTENDED_DENY)
    v42 = 68;
  else
    v42 = 0;
  if (ace->tag == ACL_EXTENDED_ALLOW)
    v43 = 65;
  else
    v43 = v42;
  *(_BYTE *)(v41 + 4) = v43;
  *(_QWORD *)(v41 + 5) = ace->flags;
  *(_QWORD *)(v41 + 13) = ace->perms;
  *(_BYTE *)(v41 + 21) = ace->qualifier_type;
  if (qualifier_size)
    memcpy((void *)(v41 + 22), qualifier_value, qualifier_size);
  return 0;
}

uint64_t aaEntryACLBlobApplyToFD(unint64_t *a1, uint64_t a2, char a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _acl *fd_np;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  int v32;
  acl_tag_t v33;
  int v34;
  unint64_t v35;
  int v36;
  _BOOL4 v37;
  int v38;
  int v39;
  int *v40;
  int v41;
  const char *v42;
  __int16 v43;
  uint64_t v45;
  group *v46;
  passwd v47;
  acl_flagset_t flagset_p;
  acl_entry_t entry_p;
  acl_t acl_p;
  stat v51;
  char in[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uuid_t uu;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  memset(&v51, 0, sizeof(v51));
  if (fstat(a2, &v51))
  {
    v6 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobApplyToFD", 370, 100, *v6, "fstat", v7, v8, v45);
    return 0xFFFFFFFFLL;
  }
  v10 = v51.st_mode & 0xF000;
  if (v10 != 0x8000 && v10 != 0x4000)
    return 0;
  v11 = *a1;
  if (!*a1)
    return 0;
  v12 = 0;
  v13 = (uint64_t *)a1[2];
  do
  {
    v14 = *v13++;
    v15 = *(char *)(a1[5] + 4 + v14);
    if (v15 == 68 || v15 == 65)
      ++v12;
    --v11;
  }
  while (v11);
  if (!v12)
    return 0;
  acl_p = 0;
  v16 = sysconf(71);
  v17 = sysconf(70);
  if (v16 <= v17)
    v18 = v17;
  else
    v18 = v16;
  if (v18 <= 4096)
    v19 = 4096;
  else
    v19 = v18;
  if (v19 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_24:
    v25 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobApplyToFD", 403, 100, *v25, "malloc", v26, v27, v45);
    v23 = 0;
    goto LABEL_79;
  }
  v20 = (char *)malloc(v19);
  if (!v20)
    goto LABEL_24;
  v23 = v20;
  if ((a3 & 8) != 0)
  {
    fd_np = acl_p;
  }
  else
  {
    fd_np = acl_get_fd_np(a2, ACL_TYPE_EXTENDED);
    acl_p = fd_np;
  }
  if (!fd_np)
  {
    fd_np = acl_init(v12);
    acl_p = fd_np;
    if (!fd_np)
    {
      v41 = *__error();
      v42 = "acl_init";
      v43 = 415;
      goto LABEL_78;
    }
  }
  v28 = *a1;
  if (!*a1)
  {
LABEL_60:
    if ((MEMORY[0x20BD2435C](a2, fd_np) & 0x80000000) != 0)
    {
      v40 = __error();
      if ((a3 & 1) == 0 || *v40 != 1)
      {
        v41 = *__error();
        v42 = "acl_set_fd";
        v43 = 499;
        goto LABEL_78;
      }
    }
    v9 = 0;
    goto LABEL_80;
  }
  v29 = 0;
  while (1)
  {
    v30 = (int *)(a1[5] + *(_QWORD *)(a1[2] + 8 * v29));
    flagset_p = 0;
    entry_p = 0;
    memset(uu, 0, sizeof(uu));
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    *(_OWORD *)in = 0u;
    v53 = 0u;
    v31 = *v30;
    v32 = *((char *)v30 + 4);
    if (v32 == 65)
      break;
    if (v32 == 68)
    {
      v33 = ACL_EXTENDED_DENY;
      goto LABEL_34;
    }
LABEL_58:
    if (++v29 >= v28)
    {
      fd_np = acl_p;
      goto LABEL_60;
    }
  }
  v33 = ACL_EXTENDED_ALLOW;
LABEL_34:
  if ((*(_QWORD *)((_BYTE *)v30 + 5) & 0xFFFFFFFFFCFDFE0FLL) != 0)
  {
    v45 = *(_QWORD *)((char *)v30 + 5);
    v42 = "invalid ACE flags: 0x%016llx";
    v43 = 444;
    goto LABEL_77;
  }
  if ((*(_QWORD *)((_BYTE *)v30 + 13) & 0xFFFFFFFFFFEFC001) != 0)
  {
    v45 = *(_QWORD *)((char *)v30 + 13);
    v42 = "invalid ACE perms: 0x%016llx";
    v43 = 445;
    goto LABEL_77;
  }
  if ((v31 - 278) <= 0xFFFFFEFE)
  {
    v42 = "qualifier too long";
    v43 = 448;
    goto LABEL_77;
  }
  v34 = v31 - 22;
  __memcpy_chk();
  in[v34] = 0;
  HIDWORD(v35) = *((char *)v30 + 21) - 71;
  LODWORD(v35) = HIDWORD(v35);
  switch((v35 >> 1))
  {
    case 0u:
      memset(&v47, 0, 32);
      v46 = 0;
      v36 = getgrnam_r(in, (group *)&v47, v23, v19, &v46);
      v37 = 0;
      if (v36 || !v46)
        goto LABEL_50;
      v38 = mbr_gid_to_uuid(v47.pw_uid, uu);
      goto LABEL_49;
    case 1u:
      if (uuid_parse(in, uu))
        goto LABEL_69;
      goto LABEL_51;
    case 6u:
      memset(&v47, 0, sizeof(v47));
      if (mbr_string_to_sid(in, (nt_sid_t *)&v47))
      {
        v37 = 0;
      }
      else
      {
        v38 = mbr_sid_to_uuid((const nt_sid_t *)&v47, uu);
LABEL_49:
        v37 = v38 == 0;
      }
LABEL_50:
      if (v37)
      {
LABEL_51:
        if (acl_create_entry(&acl_p, &entry_p))
        {
          v41 = *__error();
          v42 = "acl_create_entry";
          v43 = 489;
          goto LABEL_78;
        }
        if (acl_set_tag_type(entry_p, v33))
        {
          v41 = *__error();
          v42 = "acl_set_tag_type";
          v43 = 490;
          goto LABEL_78;
        }
        if (acl_set_permset_mask_np(entry_p, *(_QWORD *)((char *)v30 + 13)))
        {
          v41 = *__error();
          v42 = "acl_set_permset_mask_np";
          v43 = 491;
          goto LABEL_78;
        }
        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          v41 = *__error();
          v42 = "acl_get_flagset_np";
          v43 = 492;
          goto LABEL_78;
        }
        if (acl_add_flag_np(flagset_p, *(acl_flag_t *)((char *)v30 + 5)))
        {
          v41 = *__error();
          v42 = "acl_add_flag_np";
          v43 = 493;
          goto LABEL_78;
        }
        if (acl_set_qualifier(entry_p, uu))
        {
          v41 = *__error();
          v42 = "acl_set_qualifier";
          v43 = 494;
          goto LABEL_78;
        }
        v28 = *a1;
        goto LABEL_58;
      }
LABEL_69:
      LOBYTE(v45) = *((_BYTE *)v30 + 21);
      v42 = "could not resolve qualifier (type %c): %s";
      v43 = 486;
LABEL_77:
      v41 = 0;
LABEL_78:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"aaEntryACLBlobApplyToFD", v43, 100, v41, v42, v21, v22, v45);
LABEL_79:
      v9 = 0xFFFFFFFFLL;
LABEL_80:
      if (acl_p)
        acl_free(acl_p);
      free(v23);
      return v9;
    case 7u:
      memset(&v47, 0, sizeof(v47));
      v46 = 0;
      v39 = getpwnam_r(in, &v47, v23, v19, (passwd **)&v46);
      v37 = 0;
      if (v39 || !v46)
        goto LABEL_50;
      v38 = mbr_uid_to_uuid(v47.pw_uid, uu);
      goto LABEL_49;
    default:
      LOBYTE(v45) = *((_BYTE *)v30 + 21);
      v42 = "invalid qualifier type: %d";
      v43 = 483;
      goto LABEL_77;
  }
}

AAEntryACLBlob AAEntryACLBlobCreate(void)
{
  AAEntryACLBlob_impl *v0;
  AAEntryACLBlob_impl *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v0 = (AAEntryACLBlob_impl *)malloc(0x30uLL);
  v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x30uLL, 0, 0x30uLL);
  }
  else
  {
    v2 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobCreate", 521, 100, *v2, "malloc", v3, v4, v6);
  }
  return v1;
}

void AAEntryACLBlobDestroy(AAEntryACLBlob acl)
{
  if (acl)
  {
    free(*((void **)acl + 2));
    free(*((void **)acl + 5));
    memset_s((char *)acl + 24, 0x18uLL, 0, 0x18uLL);
    memset_s(acl, 0x30uLL, 0, 0x30uLL);
    free(acl);
  }
}

AAEntryACLBlob AAEntryACLBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  AAEntryACLBlob v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AAEntryACLBlob_impl *v10;

  v4 = AAEntryACLBlobCreate();
  v10 = v4;
  if (v4 && (aaEntryACLBlobInitWithEncodedData(v4, (char *)data, data_size, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryACLBlobDestroy(v10);
    return 0;
  }
  return v10;
}

AAEntryACLBlob AAEntryACLBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  char v3;
  AAEntryACLBlob_impl *v6;
  AAEntryACLBlob_impl *v7;

  v3 = flags;
  v6 = AAEntryACLBlobCreate();
  v7 = v6;
  if (v6 && (aaEntryACLBlobInitWithPath(v6, (char *)dir, path, v3) & 0x80000000) != 0)
  {
    AAEntryACLBlobDestroy(v7);
    return 0;
  }
  return v7;
}

int AAEntryACLBlobClear(AAEntryACLBlob acl)
{
  *(_QWORD *)acl = 0;
  *((_QWORD *)acl + 3) = 0;
  return 0;
}

int AAEntryACLBlobApplyToPath(AAEntryACLBlob acl, const char *dir, const char *path, AAFlagSet flags)
{
  char v4;
  char v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v18[2048];
  uint64_t v19;

  v4 = flags;
  v5 = (char)dir;
  v19 = *MEMORY[0x24BDAC8D0];
  if ((concatPath(v18, 0x800uLL, (char *)dir, path) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobApplyToPath", 569, 100, 0, "invalid path %s/%s", v7, v8, v5);
    return -1;
  }
  v9 = open(v18, 0x200000);
  if ((v9 & 0x80000000) != 0)
  {
    v14 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobApplyToPath", 571, 100, v14, "open: %s", v15, v16, (char)v18);
    return -1;
  }
  v10 = v9;
  if ((aaEntryACLBlobApplyToFD((unint64_t *)acl, v9, v4) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobApplyToPath", 573, 100, 0, "applying ACL blob: %s", v11, v12, (char)v18);
    v13 = -1;
  }
  else
  {
    v13 = 0;
  }
  close(v10);
  return v13;
}

uint32_t AAEntryACLBlobGetEntryCount(AAEntryACLBlob acl)
{
  return *(_DWORD *)acl;
}

int AAEntryACLBlobGetEntry(AAEntryACLBlob acl, uint32_t i, AAAccessControlEntry *ace, size_t qualifier_capacity, uint8_t *qualifier_value, size_t *qualifier_size)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  size_t v10;
  int v11;
  AAACETag v12;

  if (*(_QWORD *)acl <= (unint64_t)i)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobGetEntry", 593, 100, 0, "invalid ACL index %u", v6, v7, i);
  }
  else
  {
    v9 = *((_QWORD *)acl + 5) + *(_QWORD *)(*((_QWORD *)acl + 2) + 8 * i);
    v10 = (*(_DWORD *)v9 - 22);
    v11 = *(unsigned __int8 *)(v9 + 4);
    if (v11 == 65)
      v12 = ACL_EXTENDED_ALLOW;
    else
      v12 = 2 * (v11 == 68);
    ace->tag = v12;
    ace->qualifier_type = *(char *)(v9 + 21);
    ace->flags = *(_QWORD *)(v9 + 5);
    ace->perms = *(_QWORD *)(v9 + 13);
    if (qualifier_size)
      *qualifier_size = v10;
    if (!qualifier_capacity)
      return 0;
    if (v10 <= qualifier_capacity)
    {
      memcpy(qualifier_value, (const void *)(v9 + 22), v10);
      return 0;
    }
  }
  return -1;
}

uint64_t ace_check_entry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned int v9;
  unint64_t v10;
  BOOL v11;
  int v12;

  if ((*(_DWORD *)a1 - 3) > 0xFFFFFFFD)
  {
    v8 = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v8 - 71;
    LODWORD(v10) = v8 - 71;
    v9 = v10 >> 1;
    v11 = v9 > 7;
    v12 = (1 << v9) & 0xC3;
    if (v11 || v12 == 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 156, 100, 0, "invalid ACL qualifier type %c", a7, a8, v8);
    }
    else if ((*(_QWORD *)(a1 + 16) & 0xFFFFFFFFFCFDFE0FLL) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 158, 100, 0, "invalid ACL flags 0x%llx", a7, a8, *(_QWORD *)(a1 + 16));
    }
    else
    {
      if ((*(_QWORD *)(a1 + 8) & 0xFFFFFFFFFFEFC001) == 0)
        return 0;
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 159, 100, 0, "invalid ACL perms 0x%llx", a7, a8, *(_QWORD *)(a1 + 8));
    }
  }
  else
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"ace_check_entry", 148, 100, 0, "invalid ACL entry tag %c", a7, a8, *(_DWORD *)a1);
  }
  return 0xFFFFFFFFLL;
}

int AAEntryACLBlobSetEntry(AAEntryACLBlob acl, uint32_t i, const AAAccessControlEntry *ace, const uint8_t *qualifier_value, size_t qualifier_size)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  size_t v23;
  const char *v24;
  __int16 v25;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  size_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  int *v36;
  _QWORD *v37;
  char *v38;
  char *v39;
  char *v40;
  unint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  char v50;
  size_t v51;
  uint64_t v52;

  if ((ace_check_entry((uint64_t)ace, *(uint64_t *)&i, (uint64_t)ace, (uint64_t)qualifier_value, qualifier_size, v5, v6, v7) & 0x80000000) != 0)
  {
    v24 = "invalid ACL entry";
    v25 = 648;
    goto LABEL_11;
  }
  if (*(_QWORD *)acl <= (unint64_t)i)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobSetEntry", 649, 100, 0, "invalid ACL index %u", v13, v14, i);
    return -1;
  }
  if (qualifier_size > 0xFFFFFFE9 || (v15 = (qualifier_size + 22), (_DWORD)qualifier_size == -23))
  {
    v24 = "ACL entry size out of range";
    v25 = 653;
    goto LABEL_11;
  }
  v16 = i;
  v17 = *(_QWORD *)(*((_QWORD *)acl + 2) + 8 * i);
  v18 = (char *)*((_QWORD *)acl + 5);
  v19 = *(unsigned int *)&v18[v17];
  v20 = v17 + v19;
  if (__CFADD__(v17, v19)
    || (v21 = (unint64_t *)((char *)acl + 24), v22 = *((_QWORD *)acl + 3), v23 = v22 - v20, v22 < v20))
  {
LABEL_7:
    v24 = "alloc ACL entry";
    v25 = 656;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobSetEntry", v25, 100, 0, v24, v13, v14, v50);
    return -1;
  }
  if (v15 > v19)
  {
    v27 = v15 - v19;
    v28 = v22 + v15 - v19;
    if ((v28 & 0x8000000000000000) != 0)
      goto LABEL_7;
    v29 = *((_QWORD *)acl + 4);
    if (v29 < v28)
    {
      v30 = 0x4000;
      do
      {
        while (!v29)
        {
          v29 = 0x4000;
          if (v28 <= 0x4000)
            goto LABEL_30;
        }
        v31 = v29 >> 1;
        if ((v29 & (v29 >> 1)) != 0)
          v31 = v29 & (v29 >> 1);
        v29 += v31;
      }
      while (v29 < v28);
      v30 = v29;
      if (v29 >= 0x2000000001)
      {
        v36 = __error();
        v37 = (_QWORD *)((char *)acl + 24);
        *v36 = 12;
        goto LABEL_55;
      }
LABEL_30:
      v52 = v27;
      v51 = v30;
      v38 = (char *)realloc(v18, v30);
      if (v38)
      {
        v27 = v52;
        *((_QWORD *)acl + 4) = v51;
        *((_QWORD *)acl + 5) = v38;
        v18 = v38;
        v23 = v22 - v20;
        v21 = (unint64_t *)((char *)acl + 24);
        goto LABEL_32;
      }
      free(v18);
      v37 = (_QWORD *)((char *)acl + 24);
LABEL_55:
      *v37 = 0;
      v37[1] = 0;
      v37[2] = 0;
      goto LABEL_7;
    }
LABEL_32:
    if (v22 != v20)
    {
      v39 = &v18[v20];
      v40 = &v18[v20 + v27];
      v41 = v21;
      v42 = v27;
      memmove(v40, v39, v23);
      v27 = v42;
      v21 = v41;
    }
    v22 = *v21 + v27;
    goto LABEL_35;
  }
  if (v15 < v19)
  {
    v32 = v19 - v15;
    if (v22 != v20)
    {
      v33 = &v18[v20];
      v34 = &v18[v20 - v32];
      v35 = v32;
      memmove(v34, v33, v23);
      v32 = v35;
      v21 = (unint64_t *)((char *)acl + 24);
      v20 = *((_QWORD *)acl + 3);
    }
    v22 = v20 - v32;
LABEL_35:
    *v21 = v22;
  }
  if (v17 >= 0xFFFFFFFFFFFFFFFCLL || v17 + 4 > v22)
    goto LABEL_7;
  *(_DWORD *)(*((_QWORD *)acl + 5) + v17) = v15;
  if (*(_QWORD *)acl > v16)
  {
    v43 = v16;
    while (v17 < 0xFFFFFFFFFFFFFFFCLL && v17 + 4 <= *v21)
    {
      v44 = *((_QWORD *)acl + 5);
      v45 = *(unsigned int *)(v44 + v17);
      v46 = *((_QWORD *)acl + 2);
      *(_QWORD *)(v46 + 8 * v43) = v17;
      v17 += v45;
      if (++v43 >= *(_QWORD *)acl)
        goto LABEL_45;
    }
    goto LABEL_7;
  }
  v44 = *((_QWORD *)acl + 5);
  v46 = *((_QWORD *)acl + 2);
LABEL_45:
  v47 = v44 + *(_QWORD *)(v46 + 8 * v16);
  *(_DWORD *)v47 = v15;
  if (ace->tag == ACL_EXTENDED_DENY)
    v48 = 68;
  else
    v48 = 0;
  if (ace->tag == ACL_EXTENDED_ALLOW)
    v49 = 65;
  else
    v49 = v48;
  *(_BYTE *)(v47 + 4) = v49;
  *(_QWORD *)(v47 + 5) = ace->flags;
  *(_QWORD *)(v47 + 13) = ace->perms;
  *(_BYTE *)(v47 + 21) = ace->qualifier_type;
  if (qualifier_size)
    memcpy((void *)(v47 + 22), qualifier_value, qualifier_size);
  return 0;
}

int AAEntryACLBlobRemoveEntry(AAEntryACLBlob acl, uint32_t i)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)acl;
  if (*(_QWORD *)acl <= (unint64_t)i
    || (v6 = i,
        v7 = *(_QWORD *)(*((_QWORD *)acl + 2) + 8 * i),
        v8 = *((_QWORD *)acl + 5),
        v9 = *(unsigned int *)(v8 + v7),
        v10 = __CFADD__(v7, v9),
        v11 = v7 + v9,
        v10)
    || (v12 = *((_QWORD *)acl + 3), v12 < v11))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c", (uint64_t)"AAEntryACLBlobRemoveEntry", 673, 100, 0, "invalid ACL index %u", v2, v3, i);
    return -1;
  }
  else
  {
    if ((_DWORD)v9)
    {
      if (v12 != v11)
      {
        memmove((void *)(v8 + v11 - v9), (const void *)(v8 + v11), v12 - v11);
        v11 = *((_QWORD *)acl + 3);
        v4 = *(_QWORD *)acl;
      }
      *((_QWORD *)acl + 3) = v11 - v9;
    }
    v14 = v4 - 1;
    *(_QWORD *)acl = v14;
    if (v14 > v6)
    {
      v15 = *((_QWORD *)acl + 2);
      do
      {
        *(_QWORD *)(v15 + 8 * v6) = *(_QWORD *)(v15 + 8 * v6 + 8) - v9;
        ++v6;
      }
      while (v6 < *(_QWORD *)acl);
    }
    return 0;
  }
}

size_t AAEntryACLBlobGetEncodedSize(AAEntryACLBlob acl)
{
  return *((_QWORD *)acl + 3);
}

const uint8_t *__cdecl AAEntryACLBlobGetEncodedData(AAEntryACLBlob acl)
{
  return (const uint8_t *)*((_QWORD *)acl + 5);
}

uint64_t AAAssetBuilderGenerate(_QWORD *a1, uint64_t a2, int DefaultNThreads, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  AAFieldKeySet_impl *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t **v30;
  uint64_t **v31;
  uint64_t *v32;
  uint64_t *v33;
  BOOL v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  AAFieldKeySet_impl *v38;
  uint64_t v39;
  uint64_t v40;
  AAArchiveStream_impl *v41;
  AAArchiveStream_impl *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  size_t v48;
  _DWORD *v49;
  _DWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _DWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  size_t *v71;
  uint64_t v72;
  uint64_t v73;
  const void *v74;
  void **v75;
  const void *v76;
  size_t v77;
  uint64_t v78;
  size_t *v79;
  size_t v80;
  size_t v81;
  size_t v82;
  void **v83;
  void **v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  size_t *v91;
  uint64_t v92;
  uint64_t v93;
  const void *v94;
  void **v95;
  const void *v96;
  size_t v97;
  uint64_t v98;
  size_t *v99;
  size_t v100;
  size_t v101;
  size_t v102;
  void **v103;
  void **v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  size_t *v111;
  uint64_t v112;
  uint64_t v113;
  const void *v114;
  void **v115;
  const void *v116;
  size_t v117;
  uint64_t v118;
  size_t *v119;
  size_t v120;
  size_t v121;
  size_t v122;
  void **v123;
  void **v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  uint64_t v130;
  size_t *v131;
  uint64_t v132;
  uint64_t v133;
  const void *v134;
  void **v135;
  const void *v136;
  size_t v137;
  uint64_t v138;
  size_t *v139;
  size_t v140;
  size_t v141;
  size_t v142;
  void **v143;
  void **v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  int v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  uint64_t v159;
  __int128 *v160;
  int v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint64_t v165;
  _QWORD *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  unsigned int *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  int *v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  AAArchiveStream_impl *v184;
  uint64_t v185;
  uint64_t v186;
  FILE **v187;
  uint64_t v188;
  int v189;
  unint64_t v190;
  int *v191;
  uint64_t v192;
  int v193;
  const char *v194;
  __int16 v195;
  int v196;
  const char *v197;
  __int16 v198;
  const char *v199;
  __int16 v200;
  int v201;
  uint64_t v202;
  const char *v204;
  __int16 v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  __int16 v209;
  FILE **v210;
  AAArchiveStream_impl *v211;
  unint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unsigned int *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  unsigned int v222;
  uint64_t v223;
  int *v224;
  uint64_t v225;
  int v226;
  _QWORD *v227;
  uint64_t v228;
  BOOL v229;
  BOOL v230;
  unsigned int v232;
  int v233;
  const char *v234;
  uint64_t *v235;
  uint64_t v236;
  uint64_t v237;
  size_t v238;
  uint64_t v239;
  AAArchiveStream_impl *v240;
  AAFieldKeySet_impl *v241;
  __int16 v242;
  int *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  AAArchiveStream_impl *v248;
  char *v249;
  unint64_t v250;
  uint64_t v251;
  unint64_t v252;
  char *v253;
  size_t v254;
  uint64_t v255;
  size_t v256;
  unint64_t v257;
  unint64_t v258;
  char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  int *v263;
  uint64_t v264;
  uint64_t v265;
  char v266;
  char v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  size_t *v272;
  size_t *v273;
  size_t *v274;
  size_t *v275;
  const void *v276;
  const void *v277;
  const void *v278;
  const void *v279;
  void **v280;
  void **v281;
  void **v282;
  void **v283;
  void **v284;
  void **v285;
  void **v286;
  void **v287;
  size_t *__s;
  size_t *__sa;
  size_t *__sb;
  size_t *__sc;
  AAFieldKeySet_impl *v292;
  AAFieldKeySet_impl *v293;
  AAFieldKeySet_impl *v294;
  AAFieldKeySet_impl *v295;
  uint64_t v296;
  AAFieldKeySet_impl *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  char *v302;
  AAArchiveStream_impl *s;
  AAArchiveStream sa;
  AAArchiveStream sb;
  AAArchiveStream_impl *v306;
  uint64_t v307;
  uint64_t v308;
  _DWORD *v309;
  int v310;

  v8 = a1[2];
  if (!v8 || v8 != a1[1] + 1)
  {
    v194 = "exactly one output, and 0 or more inputs expected";
    v195 = 1547;
LABEL_200:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"AAAssetBuilderGenerate", v195, 27, 0, v194, a7, a8, v266);
    v13 = 0;
    goto LABEL_201;
  }
  v12 = malloc(0x460uLL);
  v13 = (uint64_t)v12;
  if (!v12)
  {
    v196 = *__error();
    v197 = "malloc";
    v198 = 646;
LABEL_195:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCreate", v198, 27, v196, v197, v15, v16, v266);
LABEL_199:
    stateDestroy_0(v13);
    v194 = "stateCreate";
    v195 = 1550;
    goto LABEL_200;
  }
  memset_s(v12, 0x460uLL, 0, 0x460uLL);
  *(_QWORD *)(v13 + 32) = StringTableCreate();
  v14 = StringTableCreate();
  *(_QWORD *)(v13 + 40) = v14;
  if (!*(_QWORD *)(v13 + 32) || !v14)
  {
    v197 = "StringTableCreate";
    v198 = 650;
    v196 = 0;
    goto LABEL_195;
  }
  *(_QWORD *)v13 = a2;
  *(_QWORD *)(v13 + 8) = a1;
  if (!DefaultNThreads)
    DefaultNThreads = getDefaultNThreads();
  v17 = *a1;
  v18 = *a1 >> 62;
  *(_DWORD *)(v13 + 20) = DefaultNThreads;
  *(_DWORD *)(v13 + 24) = v18;
  *(_DWORD *)(v13 + 16) = v17 & 1;
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a1 + 1);
  if ((getTempDir((char *)(v13 + 92), 0x3F6uLL) & 0x80000000) != 0)
  {
    v199 = "getTempDir";
    v200 = 658;
    v201 = 0;
LABEL_198:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCreate", v200, 27, v201, v199, v19, v20, v266);
    memset_s((void *)(v13 + 92), 0x400uLL, 0, 0x400uLL);
    goto LABEL_199;
  }
  __strlcat_chk();
  if (!mkdtemp((char *)(v13 + 92)))
  {
    v201 = *__error();
    v199 = "mkdtemp";
    v200 = 660;
    goto LABEL_198;
  }
  v21 = *(_QWORD *)(v13 + 56);
  v22 = **(_QWORD **)(v13 + 8);
  if ((v22 & 0x10) != 0)
    v23 = "DAT,YEC";
  else
    v23 = "DAT";
  v26 = AAFieldKeySetCreateWithString(v23);
  if (!v26)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 863, 27, 0, "AAFieldKeySetCreateWithString", v24, v25, v266);
    v38 = 0;
    v31 = 0;
    goto LABEL_204;
  }
  if (!*(_QWORD *)(v13 + 56))
    goto LABEL_157;
  v27 = 0;
  v28 = v21 - 1;
  v29 = v22 & 0x10;
  v296 = v21 - 1;
  do
  {
    if (*(_DWORD *)(v13 + 24))
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Scanning archive for variant %zu...\n", v27);
    AAByteStreamSeek(*(AAByteStream *)(*(_QWORD *)(v13 + 8) + 8 * v27 + 24), 0, 0);
    v30 = (uint64_t **)malloc(0x38uLL);
    v31 = v30;
    if (!v30)
    {
      v241 = v26;
      v242 = 376;
LABEL_271:
      v243 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCollectorStreamOpen", v242, 27, *v243, "malloc", v244, v245, v266);
      free(v31);
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 874, 27, 0, "collector stream", v246, v247, v267);
      v38 = 0;
      v31 = 0;
      v42 = 0;
      v41 = 0;
      v26 = v241;
      goto LABEL_208;
    }
    memset_s(v30, 0x38uLL, 0, 0x38uLL);
    v32 = (uint64_t *)malloc(0x40uLL);
    if (!v32)
    {
      v241 = v26;
      v242 = 378;
      goto LABEL_271;
    }
    v33 = v32;
    memset_s(v32, 0x40uLL, 0, 0x40uLL);
    v34 = v27 == v28 && v29 == 0;
    *v33 = v13;
    v33[1] = v27;
    *v31 = v33;
    v31[1] = (uint64_t *)stateCollectorStreamClose;
    v31[3] = (uint64_t *)stateCollectorStreamWriteHeader;
    v31[4] = (uint64_t *)stateCollectorStreamWriteBlob;
    if (v34)
      v35 = "SH2,IDX,IDZ,SIZ,YEC";
    else
      v35 = "SH2,IDX,IDZ,SIZ";
    v38 = AAFieldKeySetCreateWithString(v35);
    if (!v38)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 880, 27, 0, "AAFieldKeySetCreateWithString", v36, v37, v266);
LABEL_204:
      v42 = 0;
      v41 = 0;
      goto LABEL_208;
    }
    v41 = AADecodeArchiveInputStreamOpen(*(AAByteStream *)(*(_QWORD *)(v13 + 8) + 8 * v27 + 24), 0, 0, 0x100uLL, *(_DWORD *)(v13 + 20));
    if (!v41)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", 882, 27, 0, "AADecodeArchiveInputStreamOpen", v39, v40, v266);
      v42 = 0;
      goto LABEL_208;
    }
    v42 = AAConvertArchiveOutputStreamOpen((AAArchiveStream)v31, v38, v26, 0, 0, 0, *(_DWORD *)(v13 + 20));
    if (AAArchiveStreamProcess(v41, v42, 0, 0, 0, *(_DWORD *)(v13 + 20)) < 0)
    {
      v204 = "processing manifest";
      v205 = 885;
LABEL_207:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateScanVariants", v205, 27, 0, v204, v43, v44, v266);
LABEL_208:
      AAArchiveStreamClose((AAArchiveStream)v31);
      AAArchiveStreamClose(v42);
      AAArchiveStreamClose(v41);
      AAFieldKeySetDestroy(v38);
      AAFieldKeySetDestroy(v26);
      v208 = "loading manifests / scanning directories";
      v209 = 1553;
      goto LABEL_209;
    }
    v309 = 0;
    if ((StringTableSort(*(unsigned int **)(v13 + 32), &v309) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateAggregateEntries", 800, 27, 0, "StringTableSort", v45, v46, v266);
      goto LABEL_206;
    }
    v48 = *(_QWORD *)(v13 + 72);
    v47 = *(void **)(v13 + 80);
    if (v48)
    {
      v49 = v309;
      v50 = *(_DWORD **)(v13 + 80);
      v51 = *(_QWORD *)(v13 + 72);
      do
      {
        *v50 = v49[*v50];
        v50 += 246;
        --v51;
      }
      while (v51);
    }
    s = v42;
    v306 = v41;
    v300 = v27;
    qsort(v47, v48, 0x3D8uLL, (int (__cdecl *)(const void *, const void *))entryVectorCmp);
    if (!*(_QWORD *)(v13 + 72))
    {
      v55 = 0;
      goto LABEL_156;
    }
    v54 = 0;
    v55 = 0;
    v56 = 264;
    v297 = v38;
    v299 = v29;
    do
    {
      v57 = *(_QWORD *)(v13 + 80);
      v58 = (_DWORD *)(v57 + 984 * v54);
      if (!v55 || (v59 = v55 - 1, *(_DWORD *)(v57 + 984 * (v55 - 1)) != *v58))
      {
        if (v54 != v55)
          memcpy((void *)(v57 + 984 * v55), v58, 0x3D8uLL);
        ++v55;
        goto LABEL_56;
      }
      v60 = 0;
      v61 = v57 + 984 * v59 + 264;
      v62 = v57 + v56;
      do
      {
        if (*(_DWORD *)(v62 + v60))
        {
          if (*(_DWORD *)(v61 + v60))
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateAggregateEntries", 830, 27, 0, "entry defined multiple times in the same variant", v52, v53, v266);
            v41 = v306;
            v42 = s;
LABEL_206:
            free(v309);
            v204 = "aggregating entries";
            v205 = 888;
            goto LABEL_207;
          }
          v63 = v61 + v60;
          *(_OWORD *)v63 = *(_OWORD *)(v62 + v60);
          v64 = *(_OWORD *)(v62 + v60 + 16);
          v65 = *(_OWORD *)(v62 + v60 + 32);
          v66 = *(_OWORD *)(v62 + v60 + 48);
          *(_QWORD *)(v63 + 64) = *(_QWORD *)(v62 + v60 + 64);
          *(_OWORD *)(v63 + 32) = v65;
          *(_OWORD *)(v63 + 48) = v66;
          *(_OWORD *)(v63 + 16) = v64;
        }
        v60 += 72;
      }
      while (v60 != 720);
      v67 = v57 + 984 * v59;
      v69 = *(_QWORD *)(v67 + 56);
      v68 = (_QWORD *)(v67 + 56);
      if (!v69)
      {
        v70 = v57 + 984 * v54;
        v72 = *(_QWORD *)(v70 + 56);
        v71 = (size_t *)(v70 + 56);
        if (v72)
        {
          *v68 = 0;
          v73 = v57 + 984 * v54;
          v76 = *(const void **)(v73 + 72);
          v75 = (void **)(v73 + 72);
          v74 = v76;
          __s = v71;
          v77 = *v71;
          if ((*v71 & 0x8000000000000000) == 0)
          {
            v284 = v75;
            v292 = v26;
            v78 = v57 + 984 * v59;
            v81 = *(_QWORD *)(v78 + 64);
            v79 = (size_t *)(v78 + 64);
            v80 = v81;
            if (v81 >= v77)
            {
LABEL_63:
              v86 = *(_QWORD *)(v57 + 984 * v59 + 72);
              if (v74)
              {
                memcpy((void *)(v86 + *v68), v74, v77);
                v26 = v292;
              }
              else
              {
                v26 = v292;
                if (v86)
                  memset_s((void *)(v86 + *v68), v77, 0, v77);
              }
              *v68 += v77;
            }
            else
            {
              do
              {
                while (!v80)
                {
                  v80 = 0x4000;
                  if (v77 <= 0x4000)
                  {
                    v272 = v79;
                    v276 = v74;
                    v83 = (void **)(v57 + 984 * v59 + 72);
                    v80 = 0x4000;
                    goto LABEL_61;
                  }
                }
                v82 = v80 >> 1;
                if ((v80 & (v80 >> 1)) != 0)
                  v82 = v80 & (v80 >> 1);
                v80 += v82;
              }
              while (v80 < v77);
              v83 = (void **)(v57 + 984 * v59 + 72);
              if (v80 >= 0x2000000001)
              {
                v84 = (void **)(v57 + 984 * v59 + 72);
                *__error() = 12;
                goto LABEL_69;
              }
              v272 = v79;
              v276 = v74;
LABEL_61:
              v280 = v83;
              v268 = *v83;
              v85 = realloc(*v83, v80);
              if (v85)
              {
                v74 = v276;
                *v280 = v85;
                *v272 = v80;
                goto LABEL_63;
              }
              v84 = v280;
              free(v268);
LABEL_69:
              *v84 = 0;
              *v68 = 0;
              v68[1] = 0;
              v26 = v292;
            }
            v75 = v284;
          }
          free(*v75);
          memset_s(__s, 0x18uLL, 0, 0x18uLL);
          v38 = v297;
        }
      }
      v87 = v57 + 984 * v59;
      v89 = *(_QWORD *)(v87 + 32);
      v88 = (_QWORD *)(v87 + 32);
      if (!v89)
      {
        v90 = v57 + 984 * v54;
        v92 = *(_QWORD *)(v90 + 32);
        v91 = (size_t *)(v90 + 32);
        if (v92)
        {
          *v88 = 0;
          v93 = v57 + 984 * v54;
          v96 = *(const void **)(v93 + 48);
          v95 = (void **)(v93 + 48);
          v94 = v96;
          __sa = v91;
          v97 = *v91;
          if ((*v91 & 0x8000000000000000) == 0)
          {
            v285 = v95;
            v293 = v26;
            v98 = v57 + 984 * v59;
            v101 = *(_QWORD *)(v98 + 40);
            v99 = (size_t *)(v98 + 40);
            v100 = v101;
            if (v101 >= v97)
            {
LABEL_88:
              v106 = *(_QWORD *)(v57 + 984 * v59 + 48);
              if (v94)
              {
                memcpy((void *)(v106 + *v88), v94, v97);
                v26 = v293;
              }
              else
              {
                v26 = v293;
                if (v106)
                  memset_s((void *)(v106 + *v88), v97, 0, v97);
              }
              *v88 += v97;
            }
            else
            {
              do
              {
                while (!v100)
                {
                  v100 = 0x4000;
                  if (v97 <= 0x4000)
                  {
                    v273 = v99;
                    v277 = v94;
                    v103 = (void **)(v57 + 984 * v59 + 48);
                    v100 = 0x4000;
                    goto LABEL_86;
                  }
                }
                v102 = v100 >> 1;
                if ((v100 & (v100 >> 1)) != 0)
                  v102 = v100 & (v100 >> 1);
                v100 += v102;
              }
              while (v100 < v97);
              v103 = (void **)(v57 + 984 * v59 + 48);
              if (v100 >= 0x2000000001)
              {
                v104 = (void **)(v57 + 984 * v59 + 48);
                *__error() = 12;
                goto LABEL_94;
              }
              v273 = v99;
              v277 = v94;
LABEL_86:
              v281 = v103;
              v269 = *v103;
              v105 = realloc(*v103, v100);
              if (v105)
              {
                v94 = v277;
                *v281 = v105;
                *v273 = v100;
                goto LABEL_88;
              }
              v104 = v281;
              free(v269);
LABEL_94:
              *v104 = 0;
              *v88 = 0;
              v88[1] = 0;
              v26 = v293;
            }
            v95 = v285;
          }
          free(*v95);
          memset_s(__sa, 0x18uLL, 0, 0x18uLL);
          v38 = v297;
        }
      }
      v107 = v57 + 984 * v59;
      v109 = *(_QWORD *)(v107 + 80);
      v108 = (_QWORD *)(v107 + 80);
      if (!v109)
      {
        v110 = v57 + 984 * v54;
        v112 = *(_QWORD *)(v110 + 80);
        v111 = (size_t *)(v110 + 80);
        if (v112)
        {
          *v108 = 0;
          v113 = v57 + 984 * v54;
          v116 = *(const void **)(v113 + 96);
          v115 = (void **)(v113 + 96);
          v114 = v116;
          __sb = v111;
          v117 = *v111;
          if ((*v111 & 0x8000000000000000) == 0)
          {
            v286 = v115;
            v294 = v26;
            v118 = v57 + 984 * v59;
            v121 = *(_QWORD *)(v118 + 88);
            v119 = (size_t *)(v118 + 88);
            v120 = v121;
            if (v121 >= v117)
            {
LABEL_113:
              v126 = *(_QWORD *)(v57 + 984 * v59 + 96);
              if (v114)
              {
                memcpy((void *)(v126 + *v108), v114, v117);
                v26 = v294;
              }
              else
              {
                v26 = v294;
                if (v126)
                  memset_s((void *)(v126 + *v108), v117, 0, v117);
              }
              *v108 += v117;
            }
            else
            {
              do
              {
                while (!v120)
                {
                  v120 = 0x4000;
                  if (v117 <= 0x4000)
                  {
                    v274 = v119;
                    v278 = v114;
                    v123 = (void **)(v57 + 984 * v59 + 96);
                    v120 = 0x4000;
                    goto LABEL_111;
                  }
                }
                v122 = v120 >> 1;
                if ((v120 & (v120 >> 1)) != 0)
                  v122 = v120 & (v120 >> 1);
                v120 += v122;
              }
              while (v120 < v117);
              v123 = (void **)(v57 + 984 * v59 + 96);
              if (v120 >= 0x2000000001)
              {
                v124 = (void **)(v57 + 984 * v59 + 96);
                *__error() = 12;
                goto LABEL_119;
              }
              v274 = v119;
              v278 = v114;
LABEL_111:
              v282 = v123;
              v270 = *v123;
              v125 = realloc(*v123, v120);
              if (v125)
              {
                v114 = v278;
                *v282 = v125;
                *v274 = v120;
                goto LABEL_113;
              }
              v124 = v282;
              free(v270);
LABEL_119:
              *v124 = 0;
              *v108 = 0;
              v108[1] = 0;
              v26 = v294;
            }
            v115 = v286;
          }
          free(*v115);
          memset_s(__sb, 0x18uLL, 0, 0x18uLL);
          v38 = v297;
        }
      }
      v127 = v57 + 984 * v59;
      v129 = *(_QWORD *)(v127 + 104);
      v128 = (_QWORD *)(v127 + 104);
      if (!v129)
      {
        v130 = v57 + 984 * v54;
        v132 = *(_QWORD *)(v130 + 104);
        v131 = (size_t *)(v130 + 104);
        if (v132)
        {
          *v128 = 0;
          v133 = v57 + 984 * v54;
          v136 = *(const void **)(v133 + 120);
          v135 = (void **)(v133 + 120);
          v134 = v136;
          __sc = v131;
          v137 = *v131;
          if ((*v131 & 0x8000000000000000) == 0)
          {
            v287 = v135;
            v295 = v26;
            v138 = v57 + 984 * v59;
            v141 = *(_QWORD *)(v138 + 112);
            v139 = (size_t *)(v138 + 112);
            v140 = v141;
            if (v141 >= v137)
            {
LABEL_138:
              v146 = *(_QWORD *)(v57 + 984 * v59 + 120);
              if (v134)
              {
                memcpy((void *)(v146 + *v128), v134, v137);
                v26 = v295;
              }
              else
              {
                v26 = v295;
                if (v146)
                  memset_s((void *)(v146 + *v128), v137, 0, v137);
              }
              *v128 += v137;
            }
            else
            {
              do
              {
                while (!v140)
                {
                  v140 = 0x4000;
                  if (v137 <= 0x4000)
                  {
                    v275 = v139;
                    v279 = v134;
                    v143 = (void **)(v57 + 984 * v59 + 120);
                    v140 = 0x4000;
                    goto LABEL_136;
                  }
                }
                v142 = v140 >> 1;
                if ((v140 & (v140 >> 1)) != 0)
                  v142 = v140 & (v140 >> 1);
                v140 += v142;
              }
              while (v140 < v137);
              v143 = (void **)(v57 + 984 * v59 + 120);
              if (v140 >= 0x2000000001)
              {
                v144 = (void **)(v57 + 984 * v59 + 120);
                *__error() = 12;
                goto LABEL_144;
              }
              v275 = v139;
              v279 = v134;
LABEL_136:
              v283 = v143;
              v271 = *v143;
              v145 = realloc(*v143, v140);
              if (v145)
              {
                v134 = v279;
                *v283 = v145;
                *v275 = v140;
                goto LABEL_138;
              }
              v144 = v283;
              free(v271);
LABEL_144:
              *v144 = 0;
              *v128 = 0;
              v128[1] = 0;
              v26 = v295;
            }
            v135 = v287;
          }
          free(*v135);
          memset_s(__sc, 0x18uLL, 0, 0x18uLL);
          v38 = v297;
        }
      }
      v147 = v57 + 984 * v59;
      v149 = *(_DWORD *)(v147 + 136);
      v148 = v147 + 136;
      if (!v149)
      {
        v150 = v57 + 984 * v54;
        v152 = *(_DWORD *)(v150 + 136);
        v151 = v150 + 136;
        if (v152)
        {
          *(_OWORD *)v148 = *(_OWORD *)v151;
          v153 = *(_OWORD *)(v151 + 16);
          v154 = *(_OWORD *)(v151 + 32);
          v155 = *(_OWORD *)(v151 + 48);
          *(_QWORD *)(v148 + 64) = *(_QWORD *)(v151 + 64);
          *(_OWORD *)(v148 + 32) = v154;
          *(_OWORD *)(v148 + 48) = v155;
          *(_OWORD *)(v148 + 16) = v153;
        }
      }
      v156 = v57 + 984 * v59;
      v158 = *(_DWORD *)(v156 + 208);
      v157 = v156 + 208;
      v29 = v299;
      if (!v158)
      {
        v159 = v57 + 984 * v54;
        v161 = *(_DWORD *)(v159 + 208);
        v160 = (__int128 *)(v159 + 208);
        if (v161)
        {
          v162 = *v160;
          v163 = v160[1];
          v164 = v160[2];
          *(_QWORD *)(v157 + 48) = *((_QWORD *)v160 + 6);
          *(_OWORD *)(v157 + 16) = v163;
          *(_OWORD *)(v157 + 32) = v164;
          *(_OWORD *)v157 = v162;
        }
      }
      v165 = v57 + 984 * v59;
      v167 = *(_QWORD *)(v165 + 128);
      v166 = (_QWORD *)(v165 + 128);
      if (v167 == -1)
        *v166 = *(_QWORD *)(v57 + 984 * v54 + 128);
LABEL_56:
      ++v54;
      v56 += 984;
    }
    while (v54 < *(_QWORD *)(v13 + 72));
LABEL_156:
    *(_QWORD *)(v13 + 72) = v55;
    free(v309);
    AAArchiveStreamClose((AAArchiveStream)v31);
    AAArchiveStreamClose(s);
    AAArchiveStreamClose(v306);
    AAFieldKeySetDestroy(v38);
    v27 = v300 + 1;
    v28 = v296;
  }
  while ((unint64_t)(v300 + 1) < *(_QWORD *)(v13 + 56));
LABEL_157:
  AAArchiveStreamClose(0);
  AAArchiveStreamClose(0);
  AAArchiveStreamClose(0);
  AAFieldKeySetDestroy(0);
  AAFieldKeySetDestroy(v26);
  v172 = *(_QWORD *)(v13 + 72);
  if (v172)
  {
    v173 = *(unsigned int **)(v13 + 80);
    do
    {
      if (v173[18 * *(_QWORD *)(v13 + 56) + 48] == 70 && *((_QWORD *)v173 + 16) != -1)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"AAAssetBuilderGenerate", 1562, 27, 0, "HLC field found, not supported: %s", v170, v171, *(_BYTE *)(*(_QWORD *)(v13 + 32) + 32) + *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v13 + 32) + 8) + 16 * *v173));
        goto LABEL_201;
      }
      v173 += 246;
      --v172;
    }
    while (v172);
  }
  v310 = -1;
  *(_DWORD *)(v13 + 88) = 1;
  if ((StringTableAppend(*(unsigned int **)(v13 + 40), "main", 4uLL, &v310, v168, v169, v170, v171) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateAssignLabels", 913, 27, 0, "string table", v177, v178, v266);
    v208 = "assigning labels";
    v209 = 1568;
    goto LABEL_209;
  }
  v179 = *(_QWORD *)(v13 + 72);
  if (v179)
  {
    v180 = (int *)(*(_QWORD *)(v13 + 80) + 4);
    do
    {
      *v180 = v310;
      v180 += 246;
      --v179;
    }
    while (v179);
    v179 = *(_QWORD *)(v13 + 72);
  }
  if (*(_DWORD *)(v13 + 24))
  {
    if (v179)
    {
      v181 = 0;
      v182 = 0;
      v183 = 0;
      v184 = 0;
      v185 = *(_QWORD *)(v13 + 56) - 1;
      v186 = 264;
      v187 = (FILE **)MEMORY[0x24BDAC8D8];
      v298 = v185;
      do
      {
        v188 = *(_QWORD *)(v13 + 80);
        v189 = *(_DWORD *)(v188 + 984 * v181 + 72 * v185 + 264);
        if (v189)
          ++v182;
        if (v189 == 70)
          v184 = (AAArchiveStream_impl *)((char *)v184 + 1);
        if (v189 == 68)
          ++v183;
        if (*(_DWORD *)(v13 + 24) >= 2u)
        {
          v301 = v182;
          sa = v184;
          v307 = v183;
          if (!v181)
            fwrite("All entries:\n", 0xDuLL, 1uLL, *v187);
          if (*(_QWORD *)(v13 + 56))
          {
            v190 = 0;
            v191 = (int *)(v188 + v186);
            do
            {
              v193 = *v191;
              v191 += 18;
              LODWORD(v192) = v193;
              if ((_BYTE)v193)
                v192 = v192;
              else
                v192 = 45;
              fprintf(*v187, " %c", v192);
              ++v190;
            }
            while (v190 < *(_QWORD *)(v13 + 56));
          }
          fprintf(*v187, " lbl=%s", (const char *)(*(_QWORD *)(*(_QWORD *)(v13 + 40) + 32)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + 40) + 8)+ 16 * *(unsigned int *)(v188 + 984 * v181 + 4))));
          if (v189 == 70)
          {
            v185 = v298;
            fprintf(*v187, " siz=%llu yec=%zu", *(_QWORD *)(v188 + 984 * v181 + 72 * v298 + 280), *(_QWORD *)(v188 + 984 * v181 + 32));
            v183 = v307;
          }
          else
          {
            v183 = v307;
            v185 = v298;
            if (v189 == 76)
              fprintf(*v187, " lnk=%s", *(const char **)(v188 + 984 * v181 + 72));
          }
          fprintf(*v187, " pat=%s", (const char *)(*(_QWORD *)(*(_QWORD *)(v13 + 32) + 32)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + 32) + 8)+ 16 * *(unsigned int *)(v188 + 984 * v181))));
          fputc(10, *v187);
          v179 = *(_QWORD *)(v13 + 72);
          v182 = v301;
          v184 = sa;
        }
        ++v181;
        v186 += 984;
      }
      while (v181 < v179);
    }
    else
    {
      v184 = 0;
      v183 = 0;
      v182 = 0;
    }
    v210 = (FILE **)MEMORY[0x24BDAC8D8];
    v211 = v184;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%12zu entries in output\n", v182);
    fprintf(*v210, "%12zu regular files\n", (size_t)v211);
    fprintf(*v210, "%12zu directories\n", v183);
    v179 = *(_QWORD *)(v13 + 72);
  }
  if (!v179)
  {
LABEL_263:
    v240 = 0;
    goto LABEL_264;
  }
  v212 = 0;
  v308 = *(_QWORD *)(v13 + 56);
  v213 = v308 - 1;
  v214 = 264;
  v215 = 304;
  v216 = 280;
  while (2)
  {
    v217 = *(_QWORD *)(v13 + 80);
    v218 = (unsigned int *)(v217 + 984 * v212);
    v219 = *(_QWORD *)(v13 + 32);
    v220 = *(_QWORD *)(v219 + 32);
    v221 = *(_QWORD *)(*(_QWORD *)(v219 + 8) + 16 * *v218);
    v222 = v218[18 * v213 + 66];
    if (!v222)
    {
      v232 = *(_DWORD *)(v13 + 24);
      v233 = 2;
      v234 = "REMOVE (not in output): %s\n";
      goto LABEL_251;
    }
    v223 = *(_QWORD *)(v13 + 48);
    if (!v223)
    {
      v232 = *(_DWORD *)(v13 + 24);
      v233 = 3;
      v234 = "ARCHIVE (full replacement): %s\n";
      goto LABEL_251;
    }
    if (v222 != 70)
    {
      v232 = *(_DWORD *)(v13 + 24);
      v233 = 3;
      v234 = "ARCHIVE (not a regular file): %s\n";
LABEL_251:
      if (v232 <= 1)
        goto LABEL_253;
      goto LABEL_252;
    }
    v224 = (int *)(v217 + v214);
    v225 = *(_QWORD *)(v13 + 48);
    do
    {
      v226 = *v224;
      v224 += 18;
      if (v226 != 70)
      {
        v232 = *(_DWORD *)(v13 + 24);
        v233 = 3;
        v234 = "ARCHIVE (different type/missing in some inputs): %s\n";
        goto LABEL_251;
      }
      --v225;
    }
    while (v225);
    v227 = (_QWORD *)(v217 + v215);
    v228 = *(_QWORD *)(v13 + 48);
    while (1)
    {
      v174 = v227[3];
      v175 = *(_QWORD *)(v217 + 984 * v212 + 72 * v213 + 320);
      v176 = *(_QWORD *)(v217 + 984 * v212 + 72 * v213 + 328);
      v229 = *v227 == *(_QWORD *)(v217 + 984 * v212 + 72 * v213 + 304)
          && v227[1] == *(_QWORD *)(v217 + 984 * v212 + 72 * v213 + 312);
      v230 = v229 && v227[2] == v175;
      if (!v230 || v174 != v176)
        break;
      v227 += 9;
      if (!--v228)
      {
        v232 = *(_DWORD *)(v13 + 24);
        v233 = 1;
        v234 = "COPY: %s\n";
        goto LABEL_251;
      }
    }
    v235 = (uint64_t *)(v217 + v216);
    do
    {
      v236 = *v235;
      v235 += 9;
      if (!v236)
      {
        v232 = *(_DWORD *)(v13 + 24);
        v233 = 3;
        v234 = "ARCHIVE (empty in some inputs): %s\n";
        goto LABEL_251;
      }
      --v223;
    }
    while (v223);
    if (*(_QWORD *)(v217 + 984 * v212 + 72 * v213 + 280) >= *(_QWORD *)(*(_QWORD *)(v13 + 8) + 104))
      v234 = "PATCH: %s\n";
    else
      v234 = "ARCHIVE (too small for patching): %s\n";
    if (*(_QWORD *)(v217 + 984 * v212 + 72 * v213 + 280) < *(_QWORD *)(*(_QWORD *)(v13 + 8) + 104))
      v233 = 3;
    else
      v233 = 4;
    if (*(_DWORD *)(v13 + 24) >= 2u)
    {
LABEL_252:
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], v234, v174, v175, v176, v220 + v221);
      v179 = *(_QWORD *)(v13 + 72);
    }
LABEL_253:
    v237 = v217 + 984 * v212++;
    *(_DWORD *)(v237 + 8) = v233;
    v214 += 984;
    v215 += 984;
    v216 += 984;
    if (v212 < v179)
      continue;
    break;
  }
  if (!v179)
    goto LABEL_263;
  v238 = 0;
  v239 = *(_QWORD *)(v13 + 80) + 192;
  do
  {
    if (*(_DWORD *)(v239 + 72 * v308) == 70 && *(_QWORD *)(v239 - 64) != -1)
      ++v238;
    v239 += 984;
    --v179;
  }
  while (v179);
  if (!v238)
    goto LABEL_263;
  if (v238 > 0x400000000)
  {
    *__error() = 12;
    goto LABEL_298;
  }
  v248 = (AAArchiveStream_impl *)calloc(v238, 8uLL);
  if (v248)
  {
    v240 = v248;
    v250 = *(_QWORD *)(v13 + 72);
    v249 = *(char **)(v13 + 80);
    if (v250)
    {
      v251 = 0;
      v252 = 0;
      v253 = v249 + 192;
      do
      {
        if (*(_DWORD *)&v253[72 * v308] == 70 && *((_QWORD *)v253 - 8) != -1)
        {
          *((_QWORD *)v248 + v251++) = v252;
          v250 = *(_QWORD *)(v13 + 72);
        }
        ++v252;
        v253 += 984;
      }
      while (v252 < v250);
    }
    qsort_r(v248, v238, 8uLL, v249, (int (__cdecl *)(void *, const void *, const void *))entryIndexCmpHLC);
    v254 = 0;
    v255 = -(uint64_t)v238;
    v302 = (char *)v240 + 8;
    sb = v240;
    do
    {
      v256 = v254 + 1;
      if (v254 + 1 < v238)
      {
        v257 = 1;
        while (*(_QWORD *)(*(_QWORD *)(v13 + 80) + 984 * *((_QWORD *)v240 + v254 + v257) + 128) == *(_QWORD *)(*(_QWORD *)(v13 + 80) + 984 * *((_QWORD *)v240 + v254) + 128))
        {
          ++v257;
          if (!(v255 + v254 + v257))
          {
            v257 = v238 - v254;
            v256 = v238;
            goto LABEL_290;
          }
        }
        v256 = v254 + v257;
LABEL_290:
        if (v257 >= 2)
        {
          v258 = v257 - 1;
          v259 = &v302[8 * v254];
          do
          {
            v260 = *(_QWORD *)(v13 + 80);
            v262 = *(_QWORD *)v259;
            v259 += 8;
            v261 = v262;
            if (*(_DWORD *)(v13 + 24) >= 2u)
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FIXUP (hard linked): %s\n", (const char *)(*(_QWORD *)(*(_QWORD *)(v13 + 32) + 32)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + 32) + 8)+ 16 * *(unsigned int *)(v260 + 984 * v261))));
            *(_DWORD *)(v260 + 984 * v261 + 8) = 5;
            --v258;
          }
          while (v258);
          v240 = sb;
          v255 = -(uint64_t)v238;
        }
      }
      v254 = v256;
    }
    while (v256 < v238);
LABEL_264:
    free(v240);
    if ((stateComputePatches(v13) & 0x80000000) != 0)
    {
      v208 = "compute patches";
      v209 = 1601;
    }
    else
    {
      if ((stateGenerateArchive(v13) & 0x80000000) == 0)
      {
        v202 = 0;
        goto LABEL_202;
      }
      v208 = "generate archive";
      v209 = 1602;
    }
  }
  else
  {
LABEL_298:
    v263 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateInitOps", 1029, 27, *v263, "malloc", v264, v265, v266);
    v208 = "init ops";
    v209 = 1600;
  }
LABEL_209:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"AAAssetBuilderGenerate", v209, 27, 0, v208, v206, v207, v266);
LABEL_201:
  v202 = 0xFFFFFFFFLL;
LABEL_202:
  stateDestroy_0(v13);
  return v202;
}

uint64_t stateComputePatches(uint64_t a1)
{
  uint64_t v2;
  size_t v3;
  void **v4;
  void **v5;
  size_t v6;
  void **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t i;
  uint64_t v20;
  _QWORD *Worker;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;
  void **v45;
  void *v46;
  _QWORD v48[2];

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(unsigned int *)(a1 + 20);
  if (*(_DWORD *)(a1 + 24))
    fwrite("Computing patches...\n", 0x15uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v4 = (void **)calloc(v3, 8uLL);
  v5 = v4;
  if (!v4)
  {
    v37 = *__error();
    v40 = 1072;
    goto LABEL_28;
  }
  if ((_DWORD)v3)
  {
    v6 = v3;
    v7 = v4;
    while (1)
    {
      v8 = malloc(0x10uLL);
      *v7 = v8;
      if (!v8)
        break;
      ++v7;
      if (!--v6)
        goto LABEL_8;
    }
    v37 = *__error();
    v40 = 1076;
LABEL_28:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateComputePatches", v40, 27, v37, "malloc", v38, v39, v48[0]);
    v16 = 0;
    goto LABEL_35;
  }
LABEL_8:
  v16 = ThreadPoolCreate(v3, (uint64_t)v5, (uint64_t)computePatchesWorkerProc);
  if (!v16)
  {
    v41 = "ThreadPoolCreate";
    v42 = 1081;
    goto LABEL_34;
  }
  v17 = *(_QWORD *)(a1 + 72);
  if (v17)
  {
    v18 = 0;
    for (i = 0; i < v17; ++i)
    {
      v20 = *(_QWORD *)(a1 + 80);
      if (*(_DWORD *)(v20 + v18 + 8) == 4
        && *(_QWORD *)(v20 + 72 * v2 + 208 + v18) < *(_QWORD *)(*(_QWORD *)(a1 + 8) + 152))
      {
        Worker = (_QWORD *)ThreadPoolGetWorker((uint64_t)v16, v9, v10, v11, v12, v13, v14, v15);
        if (!Worker)
        {
          v41 = "ThreadPoolGetWorker";
          v42 = 1089;
          goto LABEL_34;
        }
        *Worker = a1;
        Worker[1] = i;
        if ((ThreadPoolRunWorker((uint64_t)v16, (uint64_t)Worker, v22, v23, v24, v25, v14, v15) & 0x80000000) != 0)
        {
          v41 = "ThreadPoolRunWorker";
          v42 = 1093;
          goto LABEL_34;
        }
        v17 = *(_QWORD *)(a1 + 72);
      }
      v18 += 984;
    }
  }
  if ((ThreadPoolSync(v16) & 0x80000000) != 0)
  {
    v41 = "ThreadPoolSync";
    v42 = 1095;
    goto LABEL_34;
  }
  v31 = *(_QWORD *)(a1 + 72);
  if (!v31)
  {
LABEL_25:
    v36 = 1;
    goto LABEL_36;
  }
  v32 = 0;
  v33 = 0;
  v34 = 72 * v2 + 208;
  while (1)
  {
    v35 = *(_QWORD *)(a1 + 80);
    if (*(_DWORD *)(v35 + v32 + 8) != 4 || *(_QWORD *)(v35 + v34 + v32) < *(_QWORD *)(*(_QWORD *)(a1 + 8) + 152))
      goto LABEL_24;
    v48[0] = a1;
    v48[1] = v33;
    if ((computePatchesWorkerProc((uint64_t)v48, v26, v27, v28, v29, v30, v14, v15) & 0x80000000) != 0)
      break;
    v31 = *(_QWORD *)(a1 + 72);
LABEL_24:
    ++v33;
    v32 += 984;
    if (v33 >= v31)
      goto LABEL_25;
  }
  v41 = "compute patch";
  v42 = 1105;
LABEL_34:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateComputePatches", v42, 27, 0, v41, v14, v15, v48[0]);
LABEL_35:
  v36 = 0;
LABEL_36:
  if ((ThreadPoolDestroy((uint64_t)v16) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateComputePatches", 1109, 27, 0, "ThreadPoolDestroy", v43, v44, v48[0]);
    v36 = 0;
  }
  if (v5)
  {
    if ((_DWORD)v3)
    {
      v45 = v5;
      do
      {
        v46 = *v45++;
        free(v46);
        --v3;
      }
      while (v3);
    }
    free(v5);
  }
  if (v36)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t stateGenerateArchive(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AAHeader_impl *v10;
  uint64_t v11;
  uint64_t v12;
  AAFieldKeySet_impl *v13;
  uint64_t v14;
  uint64_t v15;
  AAFieldKeySet_impl *v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  BOOL v20;
  AAByteStream *v21;
  uint64_t v22;
  uint64_t v23;
  AAByteStream *v24;
  unint64_t v25;
  int v26;
  unsigned int v27;
  unint64_t v28;
  AAByteStream_impl *v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int *v33;
  const char *v34;
  uint64_t v35;
  int v36;
  uint64_t v38;
  int v39;
  int v40;
  AAFieldKey v41;
  int v42;
  size_t v43;
  AAFieldKey v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  unint64_t v48;
  unint64_t i;
  _QWORD *v50;
  unint64_t v51;
  BOOL v52;
  BOOL v53;
  AAFieldKey v55;
  AAByteStream_impl *v56;
  size_t EncodedSize;
  uint64_t v58;
  uint64_t v59;
  const uint8_t *EncodedData;
  uint64_t v61;
  size_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  AAFieldKey v69;
  int v70;
  size_t v71;
  AAFieldKey v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 v75;
  size_t v76;
  AAFieldKey v77;
  size_t v78;
  AAFieldKey v79;
  int v80;
  AAFieldKey v81;
  int v82;
  size_t v83;
  AAFieldKey v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  _BOOL4 v88;
  uint64_t v89;
  AAFieldKey v90;
  AAFieldKey v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  AAFieldKey v95;
  uint64_t v96;
  AAFieldKey v97;
  AAByteStream_impl *v98;
  size_t v99;
  const uint8_t *v100;
  uint64_t v101;
  size_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  AAFieldKey v116;
  char v117;
  char *v118;
  char v119;
  AAFieldKey v120;
  AAFieldKey v121;
  AAFieldKey v122;
  uint64_t v123;
  AAFieldKey v124;
  size_t v125;
  const uint8_t *v126;
  _QWORD *v127;
  uint64_t v128;
  size_t v129;
  uint64_t v130;
  int v131;
  AAHeader_impl *EntryHeader;
  uint64_t v133;
  uint64_t v134;
  AAHeader_impl *v135;
  AAFieldKey v136;
  uint32_t KeyIndex;
  unsigned int FieldBlob;
  int v139;
  uint64_t v140;
  size_t v141;
  uint64_t v142;
  off_t v143;
  size_t v144;
  ssize_t v145;
  uint64_t v146;
  uint64_t v147;
  ssize_t v148;
  uint64_t v149;
  char *v150;
  ssize_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  AAByteStream *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  AAByteStream v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  AAByteStream v170;
  uint64_t v171;
  uint64_t v172;
  AAFieldKey v173;
  AAFieldKey v174;
  int v175;
  size_t v176;
  AAFieldKey v177;
  int v178;
  size_t v179;
  AAFieldKey v180;
  _BOOL4 v181;
  AAFieldKey v182;
  char v183;
  AAFieldKey v184;
  AAFieldKey v185;
  AAFieldKey v186;
  uint64_t v187;
  uint64_t v188;
  char *v189;
  uint64_t v190;
  AAHeader_impl *v191;
  uint64_t v192;
  AAFieldKey v193;
  size_t v194;
  const uint8_t *v195;
  uint64_t v196;
  uint64_t v197;
  const uint8_t *v198;
  uint64_t v199;
  size_t v200;
  uint64_t v201;
  uint64_t v202;
  off_t v203;
  off_t v204;
  off_t v205;
  off_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  AAByteStream_impl *v215;
  AAArchiveStream_impl *v216;
  AAArchiveStream_impl *v217;
  AAArchiveStream_impl *v218;
  uint64_t v219;
  uint64_t v220;
  AAByteStream_impl *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v226;
  __int16 v227;
  int v228;
  const char *v229;
  __int16 v230;
  const char *v231;
  __int16 v232;
  const char *v233;
  __int16 v234;
  const char *v235;
  __int16 v236;
  const char *v237;
  __int16 v238;
  const char *v239;
  __int16 v240;
  int v241;
  const char *v242;
  __int16 v243;
  const char *v244;
  __int16 v245;
  const char *v246;
  __int16 v247;
  char v248;
  int v249;
  int v250;
  uint64_t v251;
  AAHeader_impl *v252;
  AAHeader v253;
  AAHeader v254;
  char v255;
  uint64_t v256;
  char *__s;
  unint64_t v258;
  uint64_t size;
  off_t sizea;
  _BOOL4 v261;
  uint64_t v262;
  AAByteStream *v263;
  int buf;
  int bufa;
  char *bufb;
  int value;
  uint64_t valuea;
  uint64_t valueb;
  uint64_t v270;
  unsigned int v271;
  AAFieldKeySet_impl *v272;
  AAFieldKeySet_impl *v273;
  void *v274;
  AAHeader_impl *header;
  uint64_t v276;
  AAByteStream ostream;
  stat offset;
  uint64_t v279;
  char __str[1024];
  uint64_t v281;

  v281 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(uint64_t **)(a1 + 8);
  v4 = v3[16];
  v5 = *v3;
  if (*(_DWORD *)(a1 + 24))
  {
    fwrite("Generating asset...\n", 0x14uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    v3 = *(uint64_t **)(a1 + 8);
  }
  ostream = (AAByteStream)AATempStreamOpen(v3[14]);
  if (!ostream)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1159, 27, 0, "AATempStreamOpen", v6, v7, v248);
    v19 = 0;
    v10 = 0;
LABEL_315:
    v16 = 0;
    v13 = 0;
LABEL_316:
    v217 = 0;
    v218 = 0;
    v216 = 0;
    v24 = 0;
LABEL_317:
    v159 = 0;
LABEL_318:
    v224 = 0xFFFFFFFFLL;
    goto LABEL_319;
  }
  v10 = AAHeaderCreate();
  if (!v10)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1161, 27, 0, "AAHeaderCreate", v8, v9, v248);
    v19 = 0;
    goto LABEL_315;
  }
  v13 = AAFieldKeySetCreateWithString("IDX,IDZ,SIZ");
  if (!v13)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1163, 27, 0, "AAFieldKeySetCreateWithString", v11, v12, v248);
    v19 = 0;
    v16 = 0;
    goto LABEL_316;
  }
  v16 = AAFieldKeySetCreateWithString("DAT,YEC,UID,GID,FLG,AFT,AFR");
  if (!v16)
  {
    v226 = "AAFieldKeySetCreateWithString";
    v227 = 1165;
    v228 = 0;
LABEL_325:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v227, 27, v228, v226, v14, v15, v248);
    v19 = 0;
    goto LABEL_316;
  }
  v274 = malloc(0x10000uLL);
  if (!v274)
  {
    v228 = *__error();
    v226 = "malloc";
    v227 = 1167;
    goto LABEL_325;
  }
  if (!*(_DWORD *)(a1 + 88))
  {
LABEL_304:
    v159 = (AAByteStream *)subArchiveCreate(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 112), 0, 0, 0);
    if (v159)
    {
      v19 = v274;
      if (AAByteStreamSeek(ostream, 0, 0) < 0)
      {
        v231 = "seek";
        v232 = 1500;
        goto LABEL_329;
      }
      v215 = v159[4];
      if (!v215)
        v215 = v159[3];
      v216 = AAEncodeArchiveOutputStreamOpen(v215, 0, 0, 0, *(_DWORD *)(a1 + 20));
      v217 = AAConvertArchiveOutputStreamOpen(v216, v13, v16, 0, 0, 0, *(_DWORD *)(a1 + 20));
      v218 = AADecodeArchiveInputStreamOpen(ostream, 0, 0, 0x100uLL, *(_DWORD *)(a1 + 20));
      if (AAArchiveStreamProcess(v218, v217, 0, 0, 0, *(_DWORD *)(a1 + 20)) < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1507, 27, 0, "processing manifest", v219, v220, v248);
        goto LABEL_335;
      }
      AAArchiveStreamClose(v218);
      AAArchiveStreamClose(v217);
      AAArchiveStreamClose(v216);
      v221 = *(AAByteStream_impl **)a1;
      AAByteStreamClose(v159[4]);
      v159[4] = 0;
      if ((encodeYOPEntry(v221, 0x4Du, 0, 0, v159[3]) & 0x80000000) == 0)
      {
        subArchiveDestroy(v159);
        v19 = v274;
        if (AAByteStreamSeek(ostream, 0, 0) < 0)
        {
          v239 = "seek";
          v240 = 1520;
        }
        else
        {
          if ((AAByteStreamProcess(ostream, *(AAByteStream *)a1) & 0x8000000000000000) == 0)
          {
            v217 = 0;
            v218 = 0;
            v216 = 0;
            v24 = 0;
            v159 = 0;
            v224 = 0;
            goto LABEL_319;
          }
          v239 = "writing archive";
          v240 = 1521;
        }
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v240, 27, 0, v239, v222, v223, v248);
        goto LABEL_316;
      }
      v229 = "encode entry";
      v230 = 1514;
    }
    else
    {
      v229 = "sub_asset";
      v230 = 1498;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v230, 27, 0, v229, v213, v214, v248);
    v217 = 0;
    v218 = 0;
    v216 = 0;
LABEL_335:
    v24 = 0;
    v224 = 0xFFFFFFFFLL;
    v19 = v274;
    goto LABEL_319;
  }
  v17 = 0;
  header = v10;
  v276 = v2 - 1;
  v255 = v5;
  v256 = v4 != 0;
  v272 = v13;
  v273 = v16;
  v262 = v4;
  v261 = v4 != 0;
LABEL_10:
  v18 = 0;
  v251 = v17;
  __s = (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32)
               + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16 * v17));
  v19 = v274;
  while (v18 <= 3 && !*(_QWORD *)(a1 + 48))
  {
LABEL_302:
    if (++v18 == 10)
    {
      v17 = v251 + 1;
      if (v251 + 1 >= (unint64_t)*(unsigned int *)(a1 + 88))
        goto LABEL_304;
      goto LABEL_10;
    }
  }
  v271 = v18;
  v21 = (AAByteStream *)subArchiveCreate(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 112), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 136), *(_QWORD *)(*(_QWORD *)(a1 + 8) + 144), *(_DWORD *)(a1 + 20));
  v24 = v21;
  if (!v21)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1190, 27, 0, "subArchiveCreate", v22, v23, v248);
    v217 = 0;
    v218 = 0;
    v216 = 0;
    goto LABEL_317;
  }
  v25 = *(_QWORD *)(a1 + 72);
  if (!v25)
  {
LABEL_301:
    AAByteStreamClose(v24[4]);
    AAByteStreamClose(v24[3]);
    free(v24);
    v18 = v271;
    goto LABEL_302;
  }
  v263 = v21;
  v270 = 0;
  v26 = 0;
  v27 = 0;
  v258 = 0;
  v28 = 0;
  v29 = ostream;
  v30 = v271;
  while (2)
  {
    v31 = v25 + ~v28;
    if (v20)
      v32 = v31;
    else
      v32 = v28;
    v13 = *(AAFieldKeySet_impl **)(a1 + 80);
    v33 = (unsigned int *)((char *)v13 + 984 * v32);
    v34 = (const char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)
                       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16 * *v33));
    v35 = v33[18 * v276 + 66];
    switch(v30)
    {
      case 0u:
        if ((_DWORD)v35 != 70)
        {
          v27 = 73;
          v26 = 1;
          goto LABEL_156;
        }
        v36 = *((_DWORD *)v13 + 246 * v32 + 2);
        v26 = 1;
        if (v36 != 1 && v36 != 4)
        {
          v27 = 73;
          goto LABEL_156;
        }
        v38 = v35;
        buf = 1;
        goto LABEL_35;
      case 1u:
        v39 = *((_DWORD *)v13 + 246 * v32 + 2);
        v13 = v272;
        v16 = v273;
        if (v39 == 2 || v39 == 3 && (_DWORD)v35 != 68)
        {
          if (v262)
          {
            v92 = (uint64_t)v263[4];
            if (!v92)
              v92 = (uint64_t)v263[3];
            if ((encodeEntry(v92, v35, v34) & 0x80000000) == 0)
            {
              ++v270;
              v27 = 82;
LABEL_104:
              v26 = 1;
LABEL_242:
              v30 = v271;
              goto LABEL_243;
            }
            v244 = "encode entry";
            v245 = 1336;
LABEL_379:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v245, 27, 0, v244, v65, v66, v248);
            v217 = 0;
            v218 = 0;
            v216 = 0;
            v24 = 0;
            v224 = 0xFFFFFFFFLL;
            goto LABEL_361;
          }
          v27 = 82;
          if ((encodeYOPEntry(v29, 0x52u, v34, __s, 0) & 0x80000000) != 0)
          {
            v244 = "encode entry";
            v245 = 1341;
            goto LABEL_379;
          }
LABEL_149:
          v26 = 0;
          goto LABEL_242;
        }
        v27 = 82;
LABEL_233:
        v26 = v261;
LABEL_243:
        ++v28;
        v25 = *(_QWORD *)(a1 + 72);
        v20 = v28 == v25;
        if (v28 >= v25)
        {
          v24 = v263;
          if (!v26)
            goto LABEL_301;
          if (!v270)
            goto LABEL_301;
          AAByteStreamClose(v263[4]);
          v263[4] = 0;
          if ((encodeYOPEntry(ostream, v27, 0, __s, v263[3]) & 0x80000000) == 0)
            goto LABEL_301;
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1488, 27, 0, "encode entry", v211, v212, v248);
          v217 = 0;
          v159 = v263;
          goto LABEL_330;
        }
        continue;
      case 2u:
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 4)
          goto LABEL_156;
        if (v27 == 79)
          goto LABEL_89;
        buf = v26;
        if (v27 == 73)
        {
          v38 = v33[18 * v276 + 66];
LABEL_35:
          v40 = AAHeaderClear(v10);
          v41.ikey = 5265748;
          v42 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v41, v38);
          v43 = strlen(v34);
          v44.ikey = 5521744;
          v47 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v44, v34, v43) | v42 | v40) >= 0;
          v48 = *(_QWORD *)(a1 + 48);
          if (v48)
          {
            for (i = 0; i < v48; ++i)
            {
              if (*((_DWORD *)v13 + 246 * v32 + 18 * i + 66) == 70)
              {
                if (i)
                {
                  v50 = (_QWORD *)((char *)v13 + 984 * v32 + 304);
                  v51 = i;
                  while (1)
                  {
                    if (*((_DWORD *)v50 - 10) == 70)
                    {
                      v52 = *v50 == *((_QWORD *)v13 + 123 * v32 + 9 * i + 38)
                         && v50[1] == *((_QWORD *)v13 + 123 * v32 + 9 * i + 39);
                      v53 = v52 && v50[2] == *((_QWORD *)v13 + 123 * v32 + 9 * i + 40);
                      if (v53 && v50[3] == *((_QWORD *)v13 + 123 * v32 + 9 * i + 41))
                        break;
                    }
                    v50 += 9;
                    if (!--v51)
                      goto LABEL_52;
                  }
                }
                else
                {
LABEL_52:
                  v55.ikey = 3295315;
                  if (AAHeaderSetFieldHash(header, 0xFFFFFFFF, v55, 3u, (const uint8_t *)v13 + 984 * v32 + 72 * i + 304) < 0)v47 = 0;
                  v48 = *(_QWORD *)(a1 + 48);
                }
              }
            }
          }
          if (!v47)
          {
            v235 = "setup header";
            v236 = 1284;
            goto LABEL_352;
          }
          v56 = v29;
          EncodedSize = AAHeaderGetEncodedSize(header);
          EncodedData = AAHeaderGetEncodedData(header);
          v13 = v272;
          v16 = v273;
          if (buf)
          {
            v56 = v263[4];
            if (!v56)
              v56 = v263[3];
          }
          if (*((_QWORD *)v56 + 3))
          {
            v61 = 0;
            if (EncodedSize)
            {
              v62 = EncodedSize;
              while (1)
              {
                v63 = (*((uint64_t (**)(_QWORD, const uint8_t *, size_t))v56 + 3))(*(_QWORD *)v56, EncodedData, v62);
                if (v63 < 1)
                  break;
                EncodedData += v63;
                v61 += v63;
                v62 -= v63;
                if (!v62)
                  goto LABEL_238;
              }
              v61 = v63;
            }
          }
          else
          {
            v61 = -1;
          }
LABEL_238:
          if (v61 != EncodedSize)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1290, 27, 0, "write header", v58, v59, v248);
            v217 = 0;
            v218 = 0;
            v216 = 0;
            v24 = 0;
            v224 = 0xFFFFFFFFLL;
            v10 = header;
            goto LABEL_355;
          }
          v26 = buf;
          v165 = v270;
          if (buf)
            v165 = v270 + 1;
          v270 = v165;
          v27 = 73;
          v29 = ostream;
          v19 = v274;
          v10 = header;
          goto LABEL_242;
        }
        v113 = (char *)v13 + 984 * v32;
        v115 = *((_QWORD *)v113 + 3);
        v114 = (uint64_t)(v113 + 24);
        valueb = v114;
        if (v115)
        {
          v24 = 0;
          sizea = *(_QWORD *)(v114 - 8);
          goto LABEL_250;
        }
        if (snprintf(__str, 0x400uLL, "%s/0x%08zx", (const char *)(a1 + 92), v28) >= 0x400)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1369, 27, 0, "patch path: %s", v166, v167, (char)v34);
        }
        else
        {
          memset(&offset, 0, sizeof(offset));
          if (stat(__str, &offset) < 0 || (offset.st_mode & 0xF000) != 0x8000)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1371, 27, 0, "invalid patch: %s", v168, v169, (char)__str);
          }
          else
          {
            sizea = offset.st_size;
            v170 = AAFileStreamOpenWithPath(__str, 0, 0);
            if (v170)
            {
              v24 = (AAByteStream *)v170;
              v114 = valueb;
LABEL_250:
              v253 = (AAHeader)(v114 + 112);
              v250 = AAHeaderClear(v10);
              v173.ikey = 5265748;
              v249 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v173, 0x4DuLL);
              v174.ikey = 5263193;
              v175 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v174, 0x50uLL);
              v176 = strlen(v34);
              v177.ikey = 5521744;
              v178 = AAHeaderSetFieldString(v10, 0xFFFFFFFF, v177, v34, v176);
              v179 = strlen(__s);
              v180.ikey = 4997708;
              v181 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v180, __s, v179) | v175 | v249 | v250 | v178) >= 0;
              if ((*(_BYTE *)v253 & 4) != 0)
              {
                v182.ikey = 4672582;
                if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v182, *((unsigned int *)v13 + 246 * v32 + 37)) < 0)
                  v181 = 0;
              }
              v183 = *(_BYTE *)(valueb + 184);
              if ((v183 & 1) != 0)
              {
                v184.ikey = 5523009;
                if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v184, *((int *)v13 + 246 * v32 + 54)) < 0)
                  v181 = 0;
                v183 = *(_BYTE *)(valueb + 184);
              }
              if ((v183 & 2) != 0)
              {
                v10 = header;
                v185.ikey = 5391937;
                if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v185, *((unsigned int *)v13 + 246 * v32 + 55)) < 0)
                  v181 = 0;
              }
              else
              {
                v10 = header;
              }
              v186.ikey = 5521732;
              if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v186, sizea) < 0)
                v181 = 0;
              v189 = (char *)v13 + 984 * v32;
              v192 = *((_QWORD *)v189 + 4);
              v191 = (AAHeader_impl *)(v189 + 32);
              v190 = v192;
              if (!v192 || (v193.ikey = 4408665, (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v193, v190) & 0x80000000) == 0))
              {
                if (v181)
                {
                  v254 = v191;
                  v194 = AAHeaderGetEncodedSize(v10);
                  v195 = AAHeaderGetEncodedData(v10);
                  if (*((_QWORD *)ostream + 3))
                  {
                    if (v194)
                    {
                      v198 = v195;
                      v199 = 0;
                      v200 = v194;
                      while (1)
                      {
                        v201 = (*((uint64_t (**)(_QWORD, const uint8_t *, size_t))ostream + 3))(*(_QWORD *)ostream, v198, v200);
                        if (v201 < 1)
                          break;
                        v198 += v201;
                        v199 += v201;
                        v200 -= v201;
                        if (!v200)
                          goto LABEL_276;
                      }
                      v199 = v201;
                    }
                    else
                    {
                      v199 = 0;
                    }
                  }
                  else
                  {
                    v199 = -1;
                  }
LABEL_276:
                  if (v199 != v194)
                  {
                    v242 = "write header";
                    v243 = 1398;
                    goto LABEL_374;
                  }
                  v202 = *(_QWORD *)valueb;
                  if (*(_QWORD *)valueb)
                  {
                    v203 = sizea;
                    if (!*((_QWORD *)ostream + 3))
                      goto LABEL_366;
                    v204 = 0;
                    if (!sizea)
                    {
LABEL_287:
                      if (v204 < 0 || v204 != v203)
                      {
LABEL_366:
                        v242 = "write patch payload";
                        v243 = 1404;
                      }
                      else
                      {
                        v207 = *(_QWORD *)v254;
                        v29 = ostream;
                        if (!*(_QWORD *)v254)
                          goto LABEL_297;
                        if (*((_QWORD *)ostream + 3))
                        {
                          v208 = 0;
                          v209 = *((_QWORD *)v13 + 123 * v32 + 6);
                          while (1)
                          {
                            v210 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t))ostream + 3))(*(_QWORD *)ostream, v209, v207);
                            if (v210 < 1)
                              break;
                            v209 += v210;
                            v208 += v210;
                            v207 -= v210;
                            if (!v207)
                              goto LABEL_296;
                          }
                          v208 = v210;
LABEL_296:
                          v29 = ostream;
                          if ((v208 & 0x8000000000000000) == 0)
                          {
LABEL_297:
                            AAByteStreamClose((AAByteStream)v24);
                            v19 = v274;
                            v10 = header;
                            v13 = v272;
                            v16 = v273;
                            v30 = v271;
                            v26 = buf;
                            goto LABEL_243;
                          }
                        }
                        v242 = "write YEC";
                        v243 = 1409;
                      }
LABEL_374:
                      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v243, 27, 0, v242, v196, v197, v248);
                      v217 = 0;
                      v218 = 0;
                      v216 = 0;
                      goto LABEL_353;
                    }
                    v205 = sizea;
                    while (1)
                    {
                      v206 = (*((uint64_t (**)(_QWORD, uint64_t, off_t))ostream + 3))(*(_QWORD *)ostream, v202, v205);
                      if (v206 < 1)
                        break;
                      v202 += v206;
                      v204 += v206;
                      v205 -= v206;
                      if (!v205)
                        goto LABEL_287;
                    }
                  }
                  else
                  {
                    v203 = sizea;
                    if (!v24)
                      goto LABEL_366;
                    v206 = AAByteStreamProcess((AAByteStream)v24, ostream);
                  }
                  v204 = v206;
                  goto LABEL_287;
                }
              }
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1392, 27, 0, "setup header", v187, v188, v248);
              v217 = 0;
              v218 = 0;
              v216 = 0;
LABEL_337:
              v224 = 0xFFFFFFFFLL;
              goto LABEL_354;
            }
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1375, 27, 0, "open: %s", v171, v172, (char)__str);
          }
        }
        goto LABEL_360;
      case 3u:
        if (*((_DWORD *)v13 + 246 * v32 + 2) == 1)
        {
          v13 = v272;
          v16 = v273;
          if (v262)
          {
            v64 = (uint64_t)v263[4];
            if (!v64)
              v64 = (uint64_t)v263[3];
            if ((encodeEntry(v64, v35, v34) & 0x80000000) == 0)
            {
              ++v270;
              v27 = 67;
              goto LABEL_104;
            }
            v244 = "encode entry";
            v245 = 1350;
            goto LABEL_379;
          }
          v27 = 67;
          if ((encodeYOPEntry(v29, 0x43u, v34, __s, 0) & 0x80000000) != 0)
          {
            v244 = "encode entry";
            v245 = 1355;
            goto LABEL_379;
          }
          goto LABEL_149;
        }
        v27 = 67;
LABEL_106:
        v26 = v261;
        goto LABEL_156;
      case 4u:
        v27 = 69;
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 3 || (_DWORD)v35 == 70)
          goto LABEL_106;
        goto LABEL_77;
      case 5u:
        v27 = 69;
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 3 || (_DWORD)v35 != 70)
          goto LABEL_106;
LABEL_77:
        size = *((_QWORD *)v13 + 123 * v32 + 9 * v276 + 35);
        v67 = v33[18 * v276 + 66];
        v68 = AAHeaderClear(v10);
        v69.ikey = 5265748;
        v70 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v69, v67);
        v71 = strlen(v34);
        v72.ikey = 5521744;
        v75 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v72, v34, v71) | v70 | v68) >= 0;
        if (!v262)
        {
          v76 = strlen(__s);
          v77.ikey = 4997708;
          if (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v77, __s, v76) < 0)
            v75 = 0;
        }
        v19 = v274;
        value = v67;
        if ((_DWORD)v67 == 70)
        {
          v93 = (char *)v13 + 984 * v32;
          if ((v93[136] & 4) != 0)
          {
            v116.ikey = 4672582;
            if (AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v116, *((unsigned int *)v13 + 246 * v32 + 37)) < 0)
              v75 = 0;
          }
          v119 = v93[208];
          v118 = v93 + 208;
          v117 = v119;
          if ((v119 & 1) != 0)
          {
            v120.ikey = 5523009;
            if (AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v120, *((int *)v13 + 246 * v32 + 54)) < 0)
              v75 = 0;
            v117 = *v118;
          }
          v19 = v274;
          if ((v117 & 2) != 0)
          {
            v121.ikey = 5391937;
            if (AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v121, *((unsigned int *)v13 + 246 * v32 + 55)) < 0)
              v75 = 0;
          }
          v122.ikey = 5521732;
          if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v122, size) < 0)
            v75 = 0;
          v123 = *((_QWORD *)v13 + 123 * v32 + 4);
          if (v123)
          {
            v124.ikey = 4408665;
            if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v124, v123) < 0)
            {
LABEL_338:
              v233 = "setup header";
              v234 = 1442;
LABEL_359:
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v234, 27, 0, v233, v73, v74, v248);
LABEL_360:
              v217 = 0;
              v218 = 0;
              v216 = 0;
              v24 = 0;
              v224 = 0xFFFFFFFFLL;
              v13 = v272;
              v16 = v273;
              goto LABEL_361;
            }
          }
        }
        else if ((_DWORD)v67 == 76)
        {
          if (*((_QWORD *)v13 + 123 * v32 + 7))
          {
            v78 = strlen(*((const char **)v13 + 123 * v32 + 9));
            v79.ikey = 4935244;
            v19 = v274;
            if (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v79, *((const char **)v13 + 123 * v32 + 9), v78) < 0)
              goto LABEL_338;
          }
        }
        if (!v75)
          goto LABEL_338;
        v125 = AAHeaderGetEncodedSize(v10);
        v126 = AAHeaderGetEncodedData(v10);
        v127 = ostream;
        if (v262)
        {
          v127 = v263[4];
          if (!v127)
            v127 = v263[3];
        }
        if (v127[3])
        {
          v128 = 0;
          if (v125)
          {
            v129 = v125;
            while (1)
            {
              v130 = ((uint64_t (*)(_QWORD, const uint8_t *, size_t))v127[3])(*v127, v126, v129);
              if (v130 < 1)
                break;
              v126 += v130;
              v128 += v130;
              v129 -= v130;
              if (!v129)
                goto LABEL_185;
            }
            v128 = v130;
          }
        }
        else
        {
          v128 = -1;
        }
LABEL_185:
        if (v128 != v125)
        {
          v235 = "write header";
          v236 = 1448;
          goto LABEL_352;
        }
        v131 = value;
        v19 = v274;
        v10 = header;
        if (value != 70 || !size)
          goto LABEL_215;
        *(_QWORD *)&offset.st_dev = 0;
        v279 = 0;
        EntryHeader = stateLoadEntryHeader(a1, v276, v28);
        v135 = EntryHeader;
        if (!EntryHeader)
        {
          v237 = "loading entry header";
          v238 = 767;
          goto LABEL_350;
        }
        v136.ikey = 5521732;
        KeyIndex = AAHeaderGetKeyIndex(EntryHeader, v136);
        if ((KeyIndex & 0x80000000) != 0
          || ((FieldBlob = AAHeaderGetFieldBlob(v135, KeyIndex, &v279, (uint64_t *)&offset), FieldBlob <= 1)
            ? (v139 = 1)
            : (v139 = FieldBlob),
              v139 <= 0))
        {
          v237 = "blob not found";
          v238 = 768;
LABEL_350:
          v241 = 0;
LABEL_357:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateStreamEntryBlob", v238, 27, v241, v237, v133, v134, v248);
          bufb = 0;
LABEL_358:
          AAHeaderDestroy(v135);
          free(bufb);
          v233 = "write DAT";
          v234 = 1453;
          goto LABEL_359;
        }
        bufb = (char *)malloc(0x40000uLL);
        if (!bufb)
        {
          v241 = *__error();
          v237 = "malloc";
          v238 = 771;
          goto LABEL_357;
        }
        v140 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 984 * v28 + 72 * v276 + 288);
        v252 = v135;
        v141 = AAHeaderGetEncodedSize(v135);
        v142 = v279;
        if (v279)
        {
          v143 = v141 + v140 + *(_QWORD *)&offset.st_dev;
          while (1)
          {
            if (v142 >= 0x40000)
              v144 = 0x40000;
            else
              v144 = v142;
            v145 = AAByteStreamPRead(*(AAByteStream *)(*(_QWORD *)(a1 + 8) + 8 * v276 + 24), bufb, v144, v143);
            v19 = v274;
            if (v145 < 0)
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateStreamEntryBlob", 779, 27, 0, "read blob from archive", v146, v147, v248);
              goto LABEL_333;
            }
            v148 = v145;
            if (!v145)
              goto LABEL_212;
            if (v127[3])
            {
              v149 = 0;
              v150 = bufb;
              v151 = v145;
              while (1)
              {
                v152 = ((uint64_t (*)(_QWORD, char *, ssize_t))v127[3])(*v127, v150, v151);
                if (v152 < 1)
                  break;
                v150 += v152;
                v149 += v152;
                v151 -= v152;
                if (!v151)
                  goto LABEL_209;
              }
              v149 = v152;
            }
            else
            {
              v149 = -1;
            }
LABEL_209:
            if (v149 != v148)
              break;
            v143 += v148;
            v142 = v279 - v148;
            v20 = v279 == v148;
            v279 -= v148;
            v10 = header;
            if (v20)
              goto LABEL_212;
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateStreamEntryBlob", 781, 27, 0, "write blob to stream", v146, v147, v248);
          v19 = v274;
          v10 = header;
LABEL_333:
          v135 = v252;
          goto LABEL_358;
        }
LABEL_212:
        AAHeaderDestroy(v252);
        free(bufb);
        v153 = size;
        if (!v262)
          v153 = 0;
        v258 += v153;
        v131 = value;
LABEL_215:
        v30 = v271;
        if (v131 != 70)
          goto LABEL_224;
        v154 = *((_QWORD *)v13 + 123 * v32 + 4);
        if (!v154)
          goto LABEL_224;
        if (v127[3])
        {
          v155 = 0;
          v156 = *((_QWORD *)v13 + 123 * v32 + 6);
          while (1)
          {
            v157 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v127[3])(*v127, v156, v154);
            if (v157 < 1)
              break;
            v156 += v157;
            v155 += v157;
            v154 -= v157;
            if (!v154)
              goto LABEL_223;
          }
          v155 = v157;
LABEL_223:
          v30 = v271;
          if ((v155 & 0x8000000000000000) == 0)
          {
LABEL_224:
            v158 = v270 + v256;
            v27 = 69;
            v270 += v256;
            if (v262)
            {
              v29 = ostream;
              if (v158)
              {
                v19 = v274;
                v10 = header;
                v13 = v272;
                v16 = v273;
                if (v258 <= *(_QWORD *)(*(_QWORD *)(a1 + 8) + 128))
                  goto LABEL_233;
                v159 = v263;
                AAByteStreamClose(v263[4]);
                v263[4] = 0;
                if ((encodeYOPEntry(ostream, 0x45u, 0, __s, v263[3]) & 0x80000000) == 0)
                {
                  if ((AAByteStreamTruncate(v263[3]) & 0x80000000) != 0)
                  {
                    v246 = "AAByteStreamTruncate";
                    v247 = 195;
                  }
                  else if (AAByteStreamSeek(v263[3], 0, 0) < 0)
                  {
                    v246 = "AAByteStreamSeek";
                    v247 = 196;
                  }
                  else
                  {
                    AAByteStreamClose(v263[4]);
                    v263[4] = 0;
                    if (!*(_DWORD *)v263)
                    {
                      v258 = 0;
                      v270 = 0;
                      v26 = v261;
                      v29 = ostream;
                      goto LABEL_242;
                    }
                    v164 = AACompressionOutputStreamOpen(v263[3], *(_DWORD *)v263, (size_t)v263[1], 0, *((_DWORD *)v263 + 4));
                    v263[4] = v164;
                    if (v164)
                    {
                      v258 = 0;
                      v270 = 0;
                      v26 = v261;
                      v29 = ostream;
                      goto LABEL_242;
                    }
                    v246 = "AACompressionOutputStreamOpen";
                    v247 = 201;
                  }
                  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"subArchiveReset", v247, 27, 0, v246, v162, v163, v248);
                  v244 = "truncating sub asset";
                  v245 = 1472;
                  goto LABEL_379;
                }
                v231 = "encode entry";
                v232 = 1469;
LABEL_329:
                pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v232, 27, 0, v231, v160, v161, v248);
                v217 = 0;
LABEL_330:
                v218 = 0;
                v216 = 0;
                v24 = 0;
                goto LABEL_318;
              }
              v26 = v261;
            }
            else
            {
              v26 = v261;
              v29 = ostream;
            }
            v19 = v274;
            v10 = header;
            v13 = v272;
            v16 = v273;
            goto LABEL_243;
          }
        }
        v235 = "write YEC";
        v236 = 1460;
LABEL_352:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", v236, 27, 0, v235, v45, v46, v248);
        v217 = 0;
        v218 = 0;
        v216 = 0;
        v24 = 0;
LABEL_353:
        v224 = 0xFFFFFFFFLL;
        v10 = header;
LABEL_354:
        v13 = v272;
        v16 = v273;
LABEL_355:
        v19 = v274;
LABEL_361:
        v159 = v263;
LABEL_319:
        AAArchiveStreamClose(v216);
        AAArchiveStreamClose(v218);
        AAArchiveStreamClose(v217);
        AAByteStreamClose(ostream);
        if (v159)
        {
          AAByteStreamClose(v159[4]);
          AAByteStreamClose(v159[3]);
          free(v159);
        }
        AAByteStreamClose((AAByteStream)v24);
        AAHeaderDestroy(v10);
        AAFieldKeySetDestroy(v13);
        AAFieldKeySetDestroy(v16);
        free(v19);
        return v224;
      case 6u:
        v27 = 79;
        v26 = 1;
        if ((_DWORD)v35 && (_DWORD)v35 != 68)
          goto LABEL_89;
        goto LABEL_156;
      case 7u:
        v26 = 1;
        if ((_DWORD)v35 != 68)
        {
          v27 = 79;
LABEL_156:
          v13 = v272;
LABEL_157:
          v16 = v273;
          goto LABEL_243;
        }
LABEL_89:
        bufa = v26;
        valuea = v33[18 * v276 + 66];
        v80 = AAHeaderClear(v10);
        v81.ikey = 5265748;
        v82 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v81, valuea);
        v83 = strlen(v34);
        v84.ikey = 5521744;
        v85 = AAHeaderSetFieldString(v10, 0xFFFFFFFF, v84, v34, v83);
        v88 = (int)(aaHeaderAppendEntryAttributes(v10, (char *)v13 + 984 * v32 + 136, (char *)v13 + 984 * v32 + 208) | v82 | v80 | v85) >= 0;
        if ((_DWORD)valuea == 68)
        {
          v10 = header;
        }
        else
        {
          if ((_DWORD)valuea != 70)
          {
            v10 = header;
            goto LABEL_118;
          }
          v89 = *((_QWORD *)v13 + 123 * v32 + 16);
          v10 = header;
          if (v89 != -1)
          {
            v90.ikey = 4410440;
            if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v90, v89) < 0)
              v88 = 0;
          }
          if ((v255 & 0x10) == 0)
          {
            v91.ikey = 3295315;
            if (AAHeaderSetFieldHash(header, 0xFFFFFFFF, v91, 3u, (const uint8_t *)v13 + 984 * v32 + 72 * v276 + 304) < 0)
              v88 = 0;
          }
        }
        v94 = *((_QWORD *)v13 + 123 * v32 + 10);
        if (v94)
        {
          v95.ikey = 5521752;
          if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v95, v94) < 0)
            v88 = 0;
        }
        v96 = *((_QWORD *)v13 + 123 * v32 + 13);
        if (v96)
        {
          v97.ikey = 4997953;
          if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v97, v96) < 0)
          {
LABEL_336:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateGenerateArchive", 1312, 27, 0, "setup header", v86, v87, v248);
            v217 = 0;
            v218 = 0;
            v216 = 0;
            v24 = 0;
            goto LABEL_337;
          }
        }
LABEL_118:
        if (!v88)
          goto LABEL_336;
        v98 = v29;
        v99 = AAHeaderGetEncodedSize(v10);
        v100 = AAHeaderGetEncodedData(v10);
        if (bufa)
        {
          v98 = v263[4];
          if (!v98)
            v98 = v263[3];
        }
        if (*((_QWORD *)v98 + 3))
        {
          v101 = 0;
          if (v99)
          {
            v102 = v99;
            while (1)
            {
              v103 = (*((uint64_t (**)(_QWORD, const uint8_t *, size_t))v98 + 3))(*(_QWORD *)v98, v100, v102);
              if (v103 < 1)
                break;
              v100 += v103;
              v101 += v103;
              v102 -= v103;
              if (!v102)
                goto LABEL_130;
            }
            v101 = v103;
          }
        }
        else
        {
          v101 = -1;
        }
LABEL_130:
        if (v101 != v99)
        {
          v235 = "write header";
          v236 = 1318;
          goto LABEL_352;
        }
        v29 = ostream;
        v30 = v271;
        v26 = bufa;
        if ((valuea | 2) == 0x46)
        {
          v104 = *((_QWORD *)v13 + 123 * v32 + 10);
          if (v104)
          {
            if (!*((_QWORD *)v98 + 3))
              goto LABEL_344;
            v105 = 0;
            v106 = *((_QWORD *)v13 + 123 * v32 + 12);
            while (1)
            {
              v107 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t))v98 + 3))(*(_QWORD *)v98, v106, v104);
              if (v107 < 1)
                break;
              v106 += v107;
              v105 += v107;
              v104 -= v107;
              if (!v104)
                goto LABEL_139;
            }
            v105 = v107;
LABEL_139:
            v29 = ostream;
            v30 = v271;
            v26 = bufa;
            if (v105 < 0)
            {
LABEL_344:
              v235 = "write XAT";
              v236 = 1322;
              goto LABEL_352;
            }
          }
          v108 = *((_QWORD *)v13 + 123 * v32 + 13);
          if (v108)
          {
            if (!*((_QWORD *)v98 + 3))
              goto LABEL_345;
            v109 = 0;
            v110 = *((_QWORD *)v13 + 123 * v32 + 15);
            while (1)
            {
              v111 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t))v98 + 3))(*(_QWORD *)v98, v110, v108);
              if (v111 < 1)
                break;
              v110 += v111;
              v109 += v111;
              v108 -= v111;
              if (!v108)
                goto LABEL_151;
            }
            v109 = v111;
LABEL_151:
            v29 = ostream;
            v30 = v271;
            v26 = bufa;
            if (v109 < 0)
            {
LABEL_345:
              v235 = "write ACL";
              v236 = 1323;
              goto LABEL_352;
            }
          }
        }
        v112 = v270;
        if (v26)
          v112 = v270 + 1;
        v270 = v112;
        v27 = 79;
        v19 = v274;
        v10 = header;
        v13 = v272;
        v16 = v273;
        goto LABEL_243;
      default:
        goto LABEL_157;
    }
  }
}

void stateDestroy_0(uint64_t a1)
{
  char *v2;
  int v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void **v7;

  if (a1)
  {
    v3 = *(unsigned __int8 *)(a1 + 92);
    v2 = (char *)(a1 + 92);
    if (v3)
      removeTree(v2);
    v4 = *(void **)(a1 + 80);
    if (v4)
    {
      if (*(_QWORD *)(a1 + 72))
      {
        v5 = 0;
        v6 = 120;
        do
        {
          v7 = (void **)(*(_QWORD *)(a1 + 80) + v6);
          free(*(v7 - 12));
          free(*(v7 - 9));
          memset_s(v7 - 11, 0x18uLL, 0, 0x18uLL);
          free(*(v7 - 3));
          memset_s(v7 - 5, 0x18uLL, 0, 0x18uLL);
          free(*v7);
          memset_s(v7 - 2, 0x18uLL, 0, 0x18uLL);
          free(*(v7 - 6));
          memset_s(v7 - 8, 0x18uLL, 0, 0x18uLL);
          ++v5;
          v6 += 984;
        }
        while (v5 < *(_QWORD *)(a1 + 72));
        v4 = *(void **)(a1 + 80);
      }
      free(v4);
    }
    StringTableDestroy(*(void ***)(a1 + 32));
    StringTableDestroy(*(void ***)(a1 + 40));
    free((void *)a1);
  }
}

uint64_t stateCollectorStreamClose(void *a1)
{
  free(a1);
  return 0;
}

uint64_t stateCollectorStreamWriteHeader(_QWORD *a1, AAHeader header)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  AAFieldKey v9;
  uint32_t KeyIndex;
  uint64_t v11;
  uint64_t v12;
  unsigned int FieldUInt;
  int v14;
  uint64_t result;
  const char *v16;
  __int16 v17;
  int v18;
  AAFieldKey v19;
  uint32_t v20;
  unsigned int FieldString;
  int v22;
  AAFieldKey v23;
  uint32_t v24;
  unsigned int v25;
  int v26;
  AAFieldKey v27;
  uint32_t v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  AAFieldKey v33;
  uint32_t v34;
  unsigned int FieldHash;
  int v36;
  AAFieldKey v37;
  uint32_t v38;
  unsigned int v39;
  int v40;
  AAFieldKey v41;
  uint32_t v42;
  unsigned int v43;
  int v44;
  AAFieldKey v45;
  uint32_t v46;
  unsigned int FieldBlob;
  int v48;
  AAFieldKey v49;
  uint32_t v50;
  unsigned int v51;
  int v52;
  AAFieldKey v53;
  uint32_t v54;
  unsigned int v55;
  int v56;
  AAFieldKey v57;
  uint32_t v58;
  unsigned int v59;
  int v60;
  unint64_t v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  void *v65;
  void *v66;
  size_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  size_t v83;
  size_t *v84;
  size_t v85;
  size_t v86;
  void **v87;
  void *v88;
  size_t v89;
  void *v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  size_t v94;
  size_t *v95;
  size_t v96;
  size_t v97;
  void **v98;
  void *v99;
  void *v100;
  unint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  size_t v104;
  size_t *v105;
  size_t v106;
  size_t v107;
  void **v108;
  void *v109;
  void *v110;
  size_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  size_t v118;
  size_t *v119;
  size_t v120;
  size_t v121;
  void **v122;
  char *v123;
  void *v124;
  char *v125;
  uint64_t offset;
  AAHashFunction hash_function;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t value;
  uint8_t v133[16];
  __int128 v134;
  uint64_t size[128];
  char __s[1024];
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v131 = 0;
  value = 0;
  v129 = 0;
  v130 = -1;
  v128 = 0;
  hash_function = 0;
  v5 = *(_QWORD *)(v4 + 56);
  *((_OWORD *)a1 + 1) = 0u;
  v6 = a1 + 2;
  v7 = a1[1];
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  v9.ikey = 5265748;
  KeyIndex = AAHeaderGetKeyIndex(header, v9);
  if ((KeyIndex & 0x80000000) != 0
    || ((FieldUInt = AAHeaderGetFieldUInt(header, KeyIndex, &value), FieldUInt <= 1) ? (v14 = 1) : (v14 = FieldUInt),
        v14 <= 0))
  {
    v16 = "no TYP";
    v17 = 245;
LABEL_9:
    v18 = 0;
LABEL_10:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCollectorStreamWriteHeader", v17, 27, v18, v16, v11, v12, (char)v125);
    return 0xFFFFFFFFLL;
  }
  if (value == 77)
    return 0;
  v19.ikey = 5521744;
  v20 = AAHeaderGetKeyIndex(header, v19);
  if ((v20 & 0x80000000) != 0
    || ((FieldString = AAHeaderGetFieldString(header, v20, 0x400uLL, __s, 0), FieldString <= 1)
      ? (v22 = 1)
      : (v22 = FieldString),
        v22 <= 0))
  {
    v16 = "no PAT";
    v17 = 247;
    goto LABEL_9;
  }
  v23.ikey = 5784649;
  v24 = AAHeaderGetKeyIndex(header, v23);
  if ((v24 & 0x80000000) != 0
    || ((v25 = AAHeaderGetFieldUInt(header, v24, &v129), v25 <= 1) ? (v26 = 1) : (v26 = v25), v26 <= 0))
  {
    v16 = "no IDX";
    v17 = 248;
    goto LABEL_9;
  }
  v27.ikey = 5915721;
  v28 = AAHeaderGetKeyIndex(header, v27);
  if ((v28 & 0x80000000) != 0
    || ((v29 = AAHeaderGetFieldUInt(header, v28, &v128), v29 <= 1) ? (v30 = 1) : (v30 = v29), v30 <= 0))
  {
    v16 = "no IDZ";
    v17 = 249;
    goto LABEL_9;
  }
  v31 = v5 - 1;
  v32 = value;
  if (value != 70)
    goto LABEL_51;
  v33.ikey = 3295315;
  v34 = AAHeaderGetKeyIndex(header, v33);
  if ((v34 & 0x80000000) != 0
    || ((FieldHash = AAHeaderGetFieldHash(header, v34, 0x20uLL, &hash_function, v133), FieldHash <= 1)
      ? (v36 = 1)
      : (v36 = FieldHash),
        v36 <= 0))
  {
    v125 = __s;
    v16 = "no hash: %s";
    v17 = 254;
    goto LABEL_9;
  }
  v37.ikey = 5917011;
  v38 = AAHeaderGetKeyIndex(header, v37);
  if ((v38 & 0x80000000) != 0
    || ((v39 = AAHeaderGetFieldUInt(header, v38, &v131), v39 <= 1) ? (v40 = 1) : (v40 = v39), v40 <= 0))
  {
    v125 = __s;
    v16 = "no SIZ: %s";
    v17 = 255;
    goto LABEL_9;
  }
  v41.ikey = 4410440;
  v42 = AAHeaderGetKeyIndex(header, v41);
  if ((v42 & 0x80000000) != 0
    || ((v43 = AAHeaderGetFieldUInt(header, v42, &v130), v43 <= 1) ? (v44 = 1) : (v44 = v43), v44 <= 0))
  {
    v130 = -1;
  }
  if (v7 != v31)
    goto LABEL_65;
  size[0] = 0;
  offset = 0;
  v45.ikey = 4408665;
  v46 = AAHeaderGetKeyIndex(header, v45);
  if ((v46 & 0x80000000) == 0)
  {
    FieldBlob = AAHeaderGetFieldBlob(header, v46, size, &offset);
    v48 = FieldBlob <= 1 ? 1 : FieldBlob;
    if (v48 >= 1)
      *v6 = size[0];
  }
  v32 = value;
LABEL_51:
  if ((v32 & 0xFFFFFFFFFFFFFFFDLL) != 0x44 || v7 != v31)
    goto LABEL_66;
  size[0] = 0;
  offset = 0;
  v49.ikey = 5521752;
  v50 = AAHeaderGetKeyIndex(header, v49);
  if ((v50 & 0x80000000) == 0)
  {
    v51 = AAHeaderGetFieldBlob(header, v50, size, &offset);
    v52 = v51 <= 1 ? 1 : v51;
    if (v52 >= 1)
      a1[4] = size[0];
  }
  v53.ikey = 4997953;
  v54 = AAHeaderGetKeyIndex(header, v53);
  if ((v54 & 0x80000000) == 0)
  {
    v55 = AAHeaderGetFieldBlob(header, v54, size, &offset);
    v56 = v55 <= 1 ? 1 : v55;
    if (v56 >= 1)
      a1[6] = size[0];
  }
LABEL_65:
  v32 = value;
LABEL_66:
  if (v32 == 76)
  {
    v57.ikey = 4935244;
    v58 = AAHeaderGetKeyIndex(header, v57);
    if ((v58 & 0x80000000) != 0
      || ((v59 = AAHeaderGetFieldString(header, v58, 0x400uLL, (char *)size, 0), v59 <= 1) ? (v60 = 1) : (v60 = v59),
          v60 <= 0))
    {
      v16 = "no LNK";
      v17 = 283;
      goto LABEL_9;
    }
  }
  v61 = *(_QWORD *)(v4 + 64);
  if (*(_QWORD *)(v4 + 72) >= v61)
  {
    v62 = 2 * v61;
    v63 = v61 == 0;
    v64 = 32;
    if (!v63)
      v64 = v62;
    *(_QWORD *)(v4 + 64) = v64;
    if ((unint64_t)(984 * v64) >= 0x2000000001)
    {
      *__error() = 12;
LABEL_103:
      *(_QWORD *)(v4 + 80) = 0;
      v18 = *__error();
      v16 = "malloc";
      v17 = 291;
      goto LABEL_10;
    }
    v65 = *(void **)(v4 + 80);
    v66 = realloc(v65, 984 * v64);
    if (!v66)
    {
      free(v65);
      goto LABEL_103;
    }
    *(_QWORD *)(v4 + 80) = v66;
  }
  LODWORD(offset) = -1;
  v67 = strlen(__s);
  if ((StringTableAppend(*(unsigned int **)(v4 + 32), __s, v67, &offset, v68, v69, v70, v71) & 0x80000000) != 0)
  {
    v16 = "string table append";
    v17 = 294;
    goto LABEL_9;
  }
  v73 = *(_QWORD *)(v4 + 72);
  v72 = *(_QWORD *)(v4 + 80);
  *(_QWORD *)(v4 + 72) = v73 + 1;
  if (v72)
    memset_s((void *)(v72 + 984 * v73), 0x3D8uLL, 0, 0x3D8uLL);
  *(_DWORD *)(v72 + 984 * v73) = offset;
  v74 = v72 + 984 * v73;
  *(_QWORD *)(v74 + 128) = -1;
  v75 = (uint64_t *)(v74 + 128);
  v76 = a1[1];
  v77 = v72 + 984 * v73 + 72 * v76;
  *(_DWORD *)(v77 + 264) = value;
  *(_QWORD *)(v77 + 280) = v131;
  *(_QWORD *)(v77 + 288) = v129;
  *(_QWORD *)(v77 + 296) = v128;
  if (hash_function)
  {
    v78 = v134;
    v79 = v72 + 984 * v73 + 72 * v76;
    *(_OWORD *)(v79 + 304) = *(_OWORD *)v133;
    *(_OWORD *)(v79 + 320) = v78;
  }
  if (v7 != v31)
    return 0;
  v80 = *v6;
  if (*v6)
  {
    if ((v80 & 0x8000000000000000) != 0)
    {
LABEL_152:
      v16 = "YEC blob";
      v17 = 314;
      goto LABEL_9;
    }
    v81 = (_QWORD *)(v72 + 984 * v73 + 32);
    v82 = v72 + 984 * v73;
    v85 = *(_QWORD *)(v82 + 40);
    v84 = (size_t *)(v82 + 40);
    v83 = v85;
    if (v85 < v80)
    {
      do
      {
        while (!v83)
        {
          v83 = 0x4000;
          if (v80 <= 0x4000)
          {
            v87 = (void **)(v72 + 984 * v73 + 48);
            v83 = 0x4000;
            goto LABEL_106;
          }
        }
        v86 = v83 >> 1;
        if ((v83 & (v83 >> 1)) != 0)
          v86 = v83 & (v83 >> 1);
        v83 += v86;
      }
      while (v83 < v80);
      v87 = (void **)(v72 + 984 * v73 + 48);
      if (v83 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_151;
      }
LABEL_106:
      v88 = *v87;
      v89 = v83;
      v90 = realloc(*v87, v83);
      if (v90)
      {
        *v87 = v90;
        *v84 = v89;
        goto LABEL_108;
      }
      free(v88);
LABEL_151:
      *v87 = 0;
      *v81 = 0;
      *(_QWORD *)(v72 + 984 * v73 + 40) = 0;
      goto LABEL_152;
    }
LABEL_108:
    a1[3] = v81;
  }
  v91 = a1[4];
  if (v91)
  {
    if ((v91 & 0x8000000000000000) != 0)
    {
LABEL_155:
      v16 = "XAT blob";
      v17 = 319;
      goto LABEL_9;
    }
    v92 = (_QWORD *)(v72 + 984 * v73 + 80);
    v93 = v72 + 984 * v73;
    v96 = *(_QWORD *)(v93 + 88);
    v95 = (size_t *)(v93 + 88);
    v94 = v96;
    if (v96 < v91)
    {
      do
      {
        while (!v94)
        {
          v94 = 0x4000;
          if (v91 <= 0x4000)
          {
            v98 = (void **)(v72 + 984 * v73 + 96);
            v94 = 0x4000;
            goto LABEL_121;
          }
        }
        v97 = v94 >> 1;
        if ((v94 & (v94 >> 1)) != 0)
          v97 = v94 & (v94 >> 1);
        v94 += v97;
      }
      while (v94 < v91);
      v98 = (void **)(v72 + 984 * v73 + 96);
      if (v94 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_154;
      }
LABEL_121:
      v99 = *v98;
      v100 = realloc(*v98, v94);
      if (v100)
      {
        *v98 = v100;
        *v95 = v94;
        goto LABEL_123;
      }
      free(v99);
LABEL_154:
      *v98 = 0;
      *v92 = 0;
      *(_QWORD *)(v72 + 984 * v73 + 88) = 0;
      goto LABEL_155;
    }
LABEL_123:
    a1[5] = v92;
  }
  v101 = a1[6];
  if (v101)
  {
    if ((v101 & 0x8000000000000000) != 0)
    {
LABEL_159:
      v16 = "ACL blob";
      v17 = 324;
      goto LABEL_9;
    }
    v102 = (_QWORD *)(v72 + 984 * v73 + 104);
    v103 = v72 + 984 * v73;
    v106 = *(_QWORD *)(v103 + 112);
    v105 = (size_t *)(v103 + 112);
    v104 = v106;
    if (v106 < v101)
    {
      do
      {
        while (!v104)
        {
          v104 = 0x4000;
          if (v101 <= 0x4000)
          {
            v108 = (void **)(v72 + 984 * v73 + 120);
            v104 = 0x4000;
            goto LABEL_136;
          }
        }
        v107 = v104 >> 1;
        if ((v104 & (v104 >> 1)) != 0)
          v107 = v104 & (v104 >> 1);
        v104 += v107;
      }
      while (v104 < v101);
      v108 = (void **)(v72 + 984 * v73 + 120);
      if (v104 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_158;
      }
LABEL_136:
      v109 = *v108;
      v110 = realloc(*v108, v104);
      if (v110)
      {
        *v108 = v110;
        *v105 = v104;
        goto LABEL_138;
      }
      free(v109);
LABEL_158:
      *v108 = 0;
      *v102 = 0;
      *(_QWORD *)(v72 + 984 * v73 + 112) = 0;
      goto LABEL_159;
    }
LABEL_138:
    a1[7] = v102;
  }
  if (value == 76)
  {
    v111 = strlen((const char *)size) + 1;
    v112 = v72 + 984 * v73;
    v115 = *(_QWORD *)(v112 + 56);
    v114 = (uint64_t *)(v112 + 56);
    v113 = v115;
    v116 = v115 + v111;
    if (__CFADD__(v115, v111) || (v116 & 0x8000000000000000) != 0)
      goto LABEL_170;
    v117 = v72 + 984 * v73;
    v120 = *(_QWORD *)(v117 + 64);
    v119 = (size_t *)(v117 + 64);
    v118 = v120;
    if (v120 < v116)
    {
      do
      {
        while (!v118)
        {
          v118 = 0x4000;
          if (v116 <= 0x4000)
          {
            v122 = (void **)(v72 + 984 * v73 + 72);
            v118 = 0x4000;
            goto LABEL_162;
          }
        }
        v121 = v118 >> 1;
        if ((v118 & (v118 >> 1)) != 0)
          v121 = v118 & (v118 >> 1);
        v118 += v121;
      }
      while (v118 < v116);
      v122 = (void **)(v72 + 984 * v73 + 72);
      if (v118 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_169;
      }
LABEL_162:
      v124 = *v122;
      v123 = (char *)realloc(*v122, v118);
      if (v123)
      {
        *v122 = v123;
        *v119 = v118;
        v113 = *v114;
        goto LABEL_164;
      }
      free(v124);
LABEL_169:
      *v122 = 0;
      *v114 = 0;
      v114[1] = 0;
      goto LABEL_170;
    }
    v123 = *(char **)(v72 + 984 * v73 + 72);
LABEL_164:
    memcpy(&v123[v113], size, v111);
    *v114 += v111;
    if ((v111 & 0x8000000000000000) != 0)
    {
LABEL_170:
      v16 = "LNK blob";
      v17 = 330;
      goto LABEL_9;
    }
  }
  if ((aaEntryAttributesInitWithHeader((char *)(v72 + 984 * v73 + 136), (char *)(v72 + 984 * v73 + 208), 0, header) & 0x80000000) != 0)
  {
    v16 = "attributes from header";
    v17 = 332;
    goto LABEL_9;
  }
  result = 0;
  *v75 = v130;
  return result;
}

uint64_t stateCollectorStreamWriteBlob(_QWORD *a1, int a2, void *__src, rsize_t __smax, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t result;
  _QWORD *v17;
  const char *v18;
  __int16 v19;
  unint64_t v20;
  size_t v21;
  size_t v22;
  unint64_t v23;
  size_t v24;
  size_t v25;
  unint64_t v26;
  size_t v27;
  size_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char v38;

  v11 = (_QWORD *)a1[3];
  v12 = *(_QWORD *)&a2 & 0xFFFFFFLL;
  if (v11)
    v13 = v12 == 4408665;
  else
    v13 = 0;
  if (!v13)
    goto LABEL_5;
  if (a1[2] < __smax)
  {
    v18 = "invalid blob size";
    v19 = 344;
    goto LABEL_86;
  }
  v20 = *v11 + __smax;
  if (__CFADD__(*v11, __smax) || (v20 & 0x8000000000000000) != 0)
    goto LABEL_69;
  v21 = v11[1];
  if (v21 < v20)
  {
    do
    {
      while (!v21)
      {
        v21 = 0x4000;
        if (v20 <= 0x4000)
        {
          v21 = 0x4000;
          goto LABEL_49;
        }
      }
      v22 = v21 >> 1;
      if ((v21 & (v21 >> 1)) != 0)
        v22 = v21 & (v21 >> 1);
      v21 += v22;
    }
    while (v21 < v20);
    if (v21 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_68;
    }
LABEL_49:
    v29 = (void *)v11[2];
    v30 = realloc(v29, v21);
    if (v30)
    {
      v11[1] = v21;
      v11[2] = v30;
      goto LABEL_51;
    }
    free(v29);
LABEL_68:
    v11[1] = 0;
    v11[2] = 0;
    *v11 = 0;
    goto LABEL_69;
  }
LABEL_51:
  v31 = v11[2];
  if (__src)
  {
    memcpy((void *)(v31 + *v11), __src, __smax);
  }
  else if (v31)
  {
    memset_s((void *)(v31 + *v11), __smax, 0, __smax);
  }
  *v11 += __smax;
  if ((__smax & 0x8000000000000000) != 0)
  {
LABEL_69:
    v18 = "blob append";
    v19 = 345;
    goto LABEL_86;
  }
  a1[2] -= __smax;
LABEL_5:
  v14 = (_QWORD *)a1[5];
  if (v14)
    v15 = v12 == 5521752;
  else
    v15 = 0;
  if (v15)
  {
    if (a1[4] >= __smax)
    {
      v23 = *v14 + __smax;
      if (!__CFADD__(*v14, __smax) && (v23 & 0x8000000000000000) == 0)
      {
        v24 = v14[1];
        if (v24 >= v23)
        {
LABEL_61:
          v34 = v14[2];
          if (__src)
          {
            memcpy((void *)(v34 + *v14), __src, __smax);
          }
          else if (v34)
          {
            memset_s((void *)(v34 + *v14), __smax, 0, __smax);
          }
          *v14 += __smax;
          if ((__smax & 0x8000000000000000) == 0)
          {
            a1[4] -= __smax;
            goto LABEL_9;
          }
        }
        else
        {
          do
          {
            while (!v24)
            {
              v24 = 0x4000;
              if (v23 <= 0x4000)
              {
                v24 = 0x4000;
                goto LABEL_59;
              }
            }
            v25 = v24 >> 1;
            if ((v24 & (v24 >> 1)) != 0)
              v25 = v24 & (v24 >> 1);
            v24 += v25;
          }
          while (v24 < v23);
          if (v24 >= 0x2000000001)
          {
            *__error() = 12;
            goto LABEL_81;
          }
LABEL_59:
          v32 = (void *)v14[2];
          v33 = realloc(v32, v24);
          if (v33)
          {
            v14[1] = v24;
            v14[2] = v33;
            goto LABEL_61;
          }
          free(v32);
LABEL_81:
          v14[1] = 0;
          v14[2] = 0;
          *v14 = 0;
        }
      }
      v18 = "blob append";
      v19 = 351;
    }
    else
    {
      v18 = "invalid blob size";
      v19 = 350;
    }
LABEL_86:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateCollectorStreamWriteBlob", v19, 27, 0, v18, a7, a8, v38);
    return 0xFFFFFFFFLL;
  }
LABEL_9:
  result = 0;
  v17 = (_QWORD *)a1[7];
  if (v17 && v12 == 4997953)
  {
    if (a1[6] >= __smax)
    {
      v26 = *v17 + __smax;
      if (!__CFADD__(*v17, __smax) && (v26 & 0x8000000000000000) == 0)
      {
        v27 = v17[1];
        if (v27 >= v26)
        {
LABEL_74:
          v37 = v17[2];
          if (__src)
          {
            memcpy((void *)(v37 + *v17), __src, __smax);
          }
          else if (v37)
          {
            memset_s((void *)(v37 + *v17), __smax, 0, __smax);
          }
          *v17 += __smax;
          if ((__smax & 0x8000000000000000) == 0)
          {
            result = 0;
            a1[6] -= __smax;
            return result;
          }
        }
        else
        {
          do
          {
            while (!v27)
            {
              v27 = 0x4000;
              if (v26 <= 0x4000)
              {
                v27 = 0x4000;
                goto LABEL_72;
              }
            }
            v28 = v27 >> 1;
            if ((v27 & (v27 >> 1)) != 0)
              v28 = v27 & (v27 >> 1);
            v27 += v28;
          }
          while (v27 < v26);
          if (v27 >= 0x2000000001)
          {
            *__error() = 12;
            goto LABEL_84;
          }
LABEL_72:
          v35 = (void *)v17[2];
          v36 = realloc(v35, v27);
          if (v36)
          {
            v17[1] = v27;
            v17[2] = v36;
            goto LABEL_74;
          }
          free(v35);
LABEL_84:
          v17[1] = 0;
          v17[2] = 0;
          *v17 = 0;
        }
      }
      v18 = "blob append";
      v19 = 357;
    }
    else
    {
      v18 = "invalid blob size";
      v19 = 356;
    }
    goto LABEL_86;
  }
  return result;
}

uint64_t entryVectorCmp(_DWORD *a1, _DWORD *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a2 < *a1;
}

uint64_t entryIndexCmpHLC(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 984 * *a2 + 128);
  v4 = *(_QWORD *)(a1 + 984 * *a3 + 128);
  if (v3 < v4)
    return 0xFFFFFFFFLL;
  else
    return v4 < v3;
}

uint64_t computePatchesWorkerProc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  AAHeader_impl *EntryHeader;
  uint64_t v20;
  uint64_t v21;
  AAHeader_impl *v22;
  AAFieldKey v23;
  uint32_t KeyIndex;
  unsigned int FieldBlob;
  int v26;
  char *v27;
  uint64_t v28;
  size_t EncodedSize;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char v45;
  uint64_t v46;
  uint64_t CompressedSize;
  unint64_t v48;
  uint64_t v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  size_t v65;
  size_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  size_t v71;
  void *v72;
  char **v73;
  unint64_t v74;
  size_t v75;
  size_t v76;
  char *v77;
  char *v78;
  char **v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *__s;
  AAHeader_impl *header;
  uint64_t v92;
  stat size;
  void *v94[2];
  char *v95[2];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  void *v101;
  unint64_t st_size;
  __int128 offset[512];
  _OWORD v104[5];
  _OWORD v105[5];
  char v106[1024];
  uint64_t v107;

  v8 = (uint64_t *)MEMORY[0x24BDAC7A8](a1, a2, a3, a4, a5, a6, a7, a8);
  v107 = *MEMORY[0x24BDAC8D0];
  v9 = *v8;
  bzero(v106, 0x400uLL);
  memset(v105, 0, sizeof(v105));
  memset(v104, 0, sizeof(v104));
  v101 = 0;
  st_size = 0;
  v100 = 0;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  *(_OWORD *)v94 = 0u;
  *(_OWORD *)v95 = 0u;
  v15 = v8[1];
  if (v15 >= *(_QWORD *)(v9 + 72))
  {
    v50 = "invalid entry";
    v51 = 509;
    goto LABEL_53;
  }
  v16 = *(_QWORD *)(v9 + 80);
  v89 = v16;
  __s = (char *)(*(_QWORD *)(*(_QWORD *)(v9 + 32) + 32)
               + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 32) + 8) + 16 * *(unsigned int *)(v16 + 984 * v15)));
  v88 = *(_QWORD *)(v9 + 56);
  if (v88)
  {
    v17 = 0;
    v86 = v8;
    v87 = v16 + 984 * v15;
    v85 = v8[1];
    while (1)
    {
      v18 = v8[1];
      *(_QWORD *)&offset[0] = 0;
      *(_QWORD *)&size.st_dev = 0;
      EntryHeader = stateLoadEntryHeader(v9, v17, v18);
      v22 = EntryHeader;
      if (!EntryHeader)
      {
        v52 = "loading entry header";
        v53 = 726;
        goto LABEL_51;
      }
      v23.ikey = 5521732;
      KeyIndex = AAHeaderGetKeyIndex(EntryHeader, v23);
      if ((KeyIndex & 0x80000000) != 0
        || ((FieldBlob = AAHeaderGetFieldBlob(v22, KeyIndex, (uint64_t *)&size, (uint64_t *)offset), FieldBlob <= 1)
          ? (v26 = 1)
          : (v26 = FieldBlob),
            v26 <= 0))
      {
        v52 = "blob not found";
        v53 = 727;
        goto LABEL_51;
      }
      if (*(_QWORD *)&size.st_dev >= 0x2000000001uLL)
        break;
      v27 = (char *)malloc(*(size_t *)&size.st_dev);
      if (!v27)
      {
        v59 = __error();
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryBlob", 730, 27, *v59, "malloc", v60, v61, v84);
        goto LABEL_52;
      }
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 80) + 984 * v18 + 72 * v17 + 288);
      header = v22;
      EncodedSize = AAHeaderGetEncodedSize(v22);
      v32 = *(_QWORD *)&size.st_dev;
      if (*(_QWORD *)&size.st_dev)
      {
        v33 = 0;
        v92 = EncodedSize + *(_QWORD *)&offset[0] + v28;
        while (1)
        {
          v34 = v32 - v33;
          v35 = v34 >= 0x7FFFFFFF ? 0x7FFFFFFFLL : v34;
          v36 = *(_QWORD **)(*(_QWORD *)(v9 + 8) + 8 * v17 + 24);
          if (!v36[4])
            break;
          v37 = 0;
          if (v35)
          {
            v38 = &v27[v33];
            v39 = v92 + v33;
            v40 = v35;
            while (1)
            {
              v41 = ((uint64_t (*)(_QWORD, char *, uint64_t, uint64_t))v36[4])(*v36, v38, v40, v39);
              if (v41 < 0)
                break;
              if (v41)
              {
                v38 += v41;
                v37 += v41;
                v39 += v41;
                v40 -= v41;
                if (v40)
                  continue;
              }
              goto LABEL_25;
            }
            v37 = v41;
          }
LABEL_25:
          if (v37 != v35)
            break;
          v33 += v35;
          v32 = *(_QWORD *)&size.st_dev;
          if (v33 >= *(_QWORD *)&size.st_dev)
            goto LABEL_27;
        }
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryBlob", 740, 27, 0, "loading entry blob", v30, v31, v84);
        v22 = header;
        goto LABEL_52;
      }
LABEL_27:
      AAHeaderDestroy(header);
      *((_QWORD *)v104 + v17) = v27;
      v42 = *(_QWORD *)&size.st_dev;
      *((_QWORD *)v105 + v17) = *(_QWORD *)&size.st_dev;
      if (v42 != *(_QWORD *)(v87 + 72 * v17 + 280))
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 516, 27, 0, "size mismatch: %s", v13, v14, (char)__s);
        goto LABEL_54;
      }
      ++v17;
      v15 = v85;
      v8 = v86;
      v16 = v89;
      if (v17 >= *(_QWORD *)(v9 + 56))
        goto LABEL_29;
    }
    v52 = "blob too large";
    v53 = 728;
LABEL_51:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryBlob", v53, 27, 0, v52, v20, v21, v84);
    v27 = 0;
LABEL_52:
    AAHeaderDestroy(v22);
    free(v27);
    *((_QWORD *)v104 + v17) = 0;
    *((_QWORD *)v105 + v17) = 0;
    v84 = (char)__s;
    v50 = "loading file contents: %s";
    v51 = 515;
    goto LABEL_53;
  }
LABEL_29:
  v43 = v88 - 1;
  if ((**(_BYTE **)(v9 + 8) & 4) == 0 || (v44 = strrchr(__s, 46)) == 0 || strcasecmp(v44, ".dmg"))
  {
LABEL_32:
    v45 = 1;
    HIDWORD(v100) = 1;
    v46 = *((_QWORD *)v104 + v43);
    *(_QWORD *)&v97 = *(_QWORD *)(v9 + 48);
    *((_QWORD *)&v97 + 1) = v104;
    *(_QWORD *)&v98 = v105;
    *((_QWORD *)&v98 + 1) = v46;
    *(_QWORD *)&v99 = *((_QWORD *)v105 + v43);
    LODWORD(v100) = 2 * (*(_DWORD *)(*v8 + 16) != 0);
    if ((BXDiff5((uint64_t)&v97, &v101, &st_size, v10, v11, v12, v13, v14) & 0x80000000) == 0)
      goto LABEL_33;
    v50 = "BXDiff5";
    v51 = 586;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", v51, 27, 0, v50, v13, v14, v84);
    goto LABEL_54;
  }
  if (snprintf(v106, 0x400uLL, "%s/0x%08zx", (const char *)(v9 + 92), v8[1]) >= 0x400)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 525, 27, 0, "patch path: %s", v55, v56, (char)__s);
    goto LABEL_54;
  }
  v64 = v15;
  v65 = strlen(v106);
  v66 = v65 + 1;
  if (v65 + 1 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_73:
    v95[1] = 0;
    v50 = "aaStrdup";
    v51 = 527;
    goto LABEL_53;
  }
  v69 = (char *)malloc(v65 + 1);
  if (!v69)
    goto LABEL_73;
  v70 = v69;
  memcpy(v69, v106, v66);
  v95[1] = v70;
  v71 = *(_QWORD *)(v9 + 56);
  if (v71 >= 0x400000001)
  {
    *__error() = 12;
    v94[1] = 0;
LABEL_86:
    v50 = "aaCalloc";
    v51 = 531;
    goto LABEL_53;
  }
  v72 = calloc(v71, 8uLL);
  v94[1] = v72;
  if (!v72)
    goto LABEL_86;
  if (*(_QWORD *)(v9 + 56))
  {
    v73 = (char **)v72;
    v74 = 0;
    while (1)
    {
      snprintf(v106, 0x400uLL, "%s-%zd.dmg", v70, v74);
      v75 = strlen(v106);
      v76 = v75 + 1;
      if (v75 + 1 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_94:
        v50 = "aaStrdup";
        v51 = 539;
        goto LABEL_53;
      }
      v77 = (char *)malloc(v75 + 1);
      if (!v77)
        goto LABEL_94;
      v78 = v77;
      memcpy(v77, v106, v76);
      v79 = v74 >= *(_QWORD *)(v9 + 56) - 1 ? v95 : v73;
      *v79 = v78;
      if ((storeFileContents(v106, *((_QWORD *)v104 + v74), *((_QWORD *)v105 + v74)) & 0x80000000) != 0)
        break;
      ++v74;
      v82 = *(_QWORD *)(v9 + 56);
      ++v73;
      if (v74 >= v82)
      {
        v83 = v82 - 1;
        goto LABEL_88;
      }
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 546, 27, 0, "storeFileContents %s", v80, v81, (char)v106);
    goto LABEL_54;
  }
  v83 = -1;
LABEL_88:
  v94[0] = (void *)v83;
  LODWORD(v96) = 1;
  DWORD2(v96) = 1;
  saveThreadErrorContext(offset);
  v15 = v64;
  if (RawImageDiff((uint64_t)v94))
  {
    unlink(v95[1]);
    v16 = v89;
    if ((**(_BYTE **)(v9 + 8) & 8) != 0)
    {
      v50 = "RawImageDiff";
      v51 = 573;
      goto LABEL_53;
    }
    restoreThreadErrorContext(offset);
    goto LABEL_32;
  }
  memset(&size, 0, sizeof(size));
  if (stat(v95[1], &size))
  {
    v50 = "stat";
    v51 = 563;
    goto LABEL_53;
  }
  v45 = 0;
  st_size = size.st_size;
  v16 = v89;
LABEL_33:
  CompressedSize = ParallelCompressionGetCompressedSize(*((_QWORD *)v104 + v43), *((_QWORD *)v105 + v43), 1);
  if (CompressedSize <= 0)
    CompressedSize = *((_QWORD *)v105 + v43);
  v48 = st_size;
  if (CompressedSize >= st_size)
  {
    if ((v45 & 1) == 0)
    {
      v54 = v16 + 984 * v15;
      free(*(void **)(v54 + 48));
      memset_s((void *)(v54 + 32), 0x18uLL, 0, 0x18uLL);
      v49 = 0;
      *(_QWORD *)(v54 + 16) = st_size;
      goto LABEL_55;
    }
    if (st_size < *(_QWORD *)(*(_QWORD *)(v9 + 8) + 120))
    {
      *(_QWORD *)(v16 + 984 * v15 + 24) = v101;
      v101 = 0;
LABEL_69:
      v49 = 0;
      *(_QWORD *)(v16 + 984 * v15 + 16) = v48;
      goto LABEL_55;
    }
    if (snprintf(v106, 0x400uLL, "%s/0x%08zx", (const char *)(v9 + 92), v8[1]) >= 0x400)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 612, 27, 0, "patch path: %s", v62, v63, (char)__s);
      goto LABEL_54;
    }
    if ((storeFileContents(v106, (uint64_t)v101, st_size) & 0x80000000) == 0)
    {
      v48 = st_size;
      goto LABEL_69;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"computePatchesWorkerProc", 613, 27, 0, "storing patch: %s", v67, v68, (char)__s);
LABEL_54:
    v49 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }
  *(_DWORD *)(v16 + 984 * v15 + 8) = 3;
  if (*(_DWORD *)(v9 + 24) >= 2u)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ARCHIVE (smaller than patch): %s\n", __s);
  v49 = 0;
LABEL_55:
  if (*(_QWORD *)(v9 + 56))
  {
    v57 = 0;
    do
    {
      free(*((void **)v104 + v57));
      if (v94[1])
        free(*((void **)v94[1] + v57));
      ++v57;
    }
    while (v57 < *(_QWORD *)(v9 + 56));
  }
  free(v94[1]);
  free(v95[0]);
  free(v95[1]);
  free(v101);
  return v49;
}

AAHeader stateLoadEntryHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int16 v17;
  int v18;
  AAHeader v19;
  _QWORD *v21;
  size_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  AAHeader v27;
  char v28;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 984 * a3 + 72 * a2 + 288);
  v6 = (uint8_t *)malloc(0x10000uLL);
  v9 = v6;
  if (v6)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * a2 + 24);
    if (*(_QWORD *)(v10 + 32))
    {
      v11 = 0;
      v12 = 6;
      v13 = (char *)v6;
      v14 = v5;
      while (1)
      {
        v15 = (*(uint64_t (**)(_QWORD, char *, uint64_t, uint64_t))(v10 + 32))(*(_QWORD *)v10, v13, v12, v14);
        if (v15 < 0)
          break;
        if (v15)
        {
          v13 += v15;
          v11 += v15;
          v14 += v15;
          v12 -= v15;
          if (v12)
            continue;
        }
        if (v11 != 6)
          break;
        if (*(_DWORD *)v9 != 826360153 && *(_DWORD *)v9 != 825246017)
        {
          v16 = "invalid header magic";
          v17 = 704;
          goto LABEL_12;
        }
        v21 = *(_QWORD **)(*(_QWORD *)(a1 + 8) + 8 * a2 + 24);
        if (!v21[4])
          goto LABEL_28;
        v22 = *((unsigned __int16 *)v9 + 2);
        if (*((_WORD *)v9 + 2))
        {
          v23 = 0;
          v24 = v9;
          v25 = *((unsigned __int16 *)v9 + 2);
          while (1)
          {
            v26 = ((uint64_t (*)(_QWORD, uint8_t *, uint64_t, uint64_t))v21[4])(*v21, v24, v25, v5);
            if (v26 < 0)
              break;
            if (v26)
            {
              v24 += v26;
              v23 += v26;
              v5 += v26;
              v25 -= v26;
              if (v25)
                continue;
            }
            goto LABEL_25;
          }
          v23 = v26;
        }
        else
        {
          v23 = 0;
        }
LABEL_25:
        if (v23 == v22)
        {
          v27 = AAHeaderCreateWithEncodedData(v22, v9);
          if (v27)
          {
            v19 = v27;
            free(v9);
            return v19;
          }
          v16 = "invalid header";
          v17 = 709;
        }
        else
        {
LABEL_28:
          v16 = "reading header";
          v17 = 706;
        }
        goto LABEL_12;
      }
    }
    v16 = "reading header magic";
    v17 = 703;
LABEL_12:
    v18 = 0;
  }
  else
  {
    v18 = *__error();
    v16 = "malloc";
    v17 = 700;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"stateLoadEntryHeader", v17, 27, v18, v16, v7, v8, v28);
  free(v9);
  AAHeaderDestroy(0);
  return 0;
}

void *subArchiveCreate(unint64_t a1, int a2, uint64_t a3, int a4)
{
  void *v8;
  void *v9;
  AAByteStream_impl *v10;
  uint64_t v11;
  uint64_t v12;
  AAByteStream v13;
  const char *v14;
  __int16 v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  char v20;

  v8 = malloc(0x28uLL);
  v9 = v8;
  if (v8)
  {
    memset_s(v8, 0x28uLL, 0, 0x28uLL);
    *(_DWORD *)v9 = a2;
    *((_QWORD *)v9 + 1) = a3;
    *((_DWORD *)v9 + 4) = a4;
    v10 = (AAByteStream_impl *)AATempStreamOpen(a1);
    *((_QWORD *)v9 + 3) = v10;
    if (!v10)
    {
      v14 = "AATempStreamOpen";
      v15 = 165;
      goto LABEL_8;
    }
    if (*(_DWORD *)v9)
    {
      v13 = AACompressionOutputStreamOpen(v10, *(_DWORD *)v9, *((_QWORD *)v9 + 1), 0, *((_DWORD *)v9 + 4));
      *((_QWORD *)v9 + 4) = v13;
      if (!v13)
      {
        v14 = "AACompressionOutputStreamOpen";
        v15 = 169;
LABEL_8:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"subArchiveCreate", v15, 27, 0, v14, v11, v12, v20);
        AAByteStreamClose(*((AAByteStream *)v9 + 4));
        AAByteStreamClose(*((AAByteStream *)v9 + 3));
        free(v9);
        return 0;
      }
    }
  }
  else
  {
    v16 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"subArchiveCreate", 159, 27, *v16, "malloc", v17, v18, v20);
  }
  return v9;
}

uint64_t encodeEntry(uint64_t a1, unsigned int a2, const char *a3)
{
  AAHeader_impl *v6;
  uint64_t v7;
  uint64_t v8;
  AAHeader_impl *v9;
  AAFieldKey v10;
  int v11;
  size_t v12;
  AAFieldKey v13;
  size_t EncodedSize;
  const uint8_t *EncodedData;
  const uint8_t *v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  char v24;

  v6 = AAHeaderCreate();
  v9 = v6;
  if (!v6)
  {
    v20 = "AAHeaderCreate";
    v21 = 468;
LABEL_18:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"encodeEntry", v21, 27, 0, v20, v7, v8, v24);
    v22 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  v10.ikey = 5265748;
  v11 = AAHeaderSetFieldUInt(v6, 0xFFFFFFFF, v10, a2);
  v12 = strlen(a3);
  v13.ikey = 5521744;
  if (AAHeaderSetFieldString(v9, 0xFFFFFFFF, v13, a3, v12) < 0 || v11 < 0)
  {
    v20 = "setup header";
    v21 = 473;
    goto LABEL_18;
  }
  EncodedSize = AAHeaderGetEncodedSize(v9);
  EncodedData = AAHeaderGetEncodedData(v9);
  if (*(_QWORD *)(a1 + 24))
  {
    if (EncodedSize)
    {
      v16 = EncodedData;
      v17 = 0;
      v18 = EncodedSize;
      while (1)
      {
        v19 = (*(uint64_t (**)(_QWORD, const uint8_t *, size_t))(a1 + 24))(*(_QWORD *)a1, v16, v18);
        if (v19 < 1)
          break;
        v16 += v19;
        v17 += v19;
        v18 -= v19;
        if (!v18)
          goto LABEL_15;
      }
      v17 = v19;
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = -1;
  }
LABEL_15:
  if (v17 != EncodedSize)
  {
    v20 = "write header";
    v21 = 477;
    goto LABEL_18;
  }
  v22 = 0;
LABEL_19:
  AAHeaderDestroy(v9);
  return v22;
}

uint64_t encodeYOPEntry(AAByteStream_impl *a1, unsigned int a2, const char *a3, const char *a4, AAByteStream s)
{
  uint64_t v10;
  uint64_t v11;
  off_t v12;
  AAHeader_impl *v13;
  AAHeader_impl *v14;
  uint64_t v15;
  uint64_t v16;
  AAFieldKey v17;
  int v18;
  AAFieldKey v19;
  _BOOL4 v20;
  size_t v21;
  AAFieldKey v22;
  size_t v23;
  AAFieldKey v24;
  AAFieldKey v25;
  size_t EncodedSize;
  const uint8_t *EncodedData;
  const uint8_t *v28;
  uint64_t v29;
  size_t v30;
  uint64_t v31;
  const char *v32;
  __int16 v33;
  off_t v34;
  uint64_t v35;
  char v37;

  if (s)
  {
    v12 = AAByteStreamSeek(s, 0, 2);
    if (v12 < 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"encodeYOPEntry", 416, 27, 0, "seek dat stream", v10, v11, v37);
      v13 = 0;
LABEL_37:
      v35 = 0xFFFFFFFFLL;
      goto LABEL_38;
    }
  }
  else
  {
    v12 = -1;
  }
  v14 = AAHeaderCreate();
  v13 = v14;
  if (!v14)
  {
    v32 = "AAHeaderCreate";
    v33 = 421;
    goto LABEL_36;
  }
  v17.ikey = 5265748;
  v18 = AAHeaderSetFieldUInt(v14, 0xFFFFFFFF, v17, 0x4DuLL);
  v19.ikey = 5263193;
  v20 = (AAHeaderSetFieldUInt(v13, 0xFFFFFFFF, v19, a2) | v18) >= 0;
  if (a3)
  {
    v21 = strlen(a3);
    v22.ikey = 5521744;
    if (AAHeaderSetFieldString(v13, 0xFFFFFFFF, v22, a3, v21) < 0)
      v20 = 0;
  }
  if (a4)
  {
    v23 = strlen(a4);
    v24.ikey = 4997708;
    if (AAHeaderSetFieldString(v13, 0xFFFFFFFF, v24, a4, v23) < 0)
      v20 = 0;
  }
  if (v12 != -1 && (v25.ikey = 5521732, AAHeaderSetFieldBlob(v13, 0xFFFFFFFF, v25, v12) < 0) || !v20)
  {
    v32 = "setup header";
    v33 = 427;
    goto LABEL_36;
  }
  EncodedSize = AAHeaderGetEncodedSize(v13);
  EncodedData = AAHeaderGetEncodedData(v13);
  if (*((_QWORD *)a1 + 3))
  {
    if (EncodedSize)
    {
      v28 = EncodedData;
      v29 = 0;
      v30 = EncodedSize;
      while (1)
      {
        v31 = (*((uint64_t (**)(_QWORD, const uint8_t *, size_t))a1 + 3))(*(_QWORD *)a1, v28, v30);
        if (v31 < 1)
          break;
        v28 += v31;
        v29 += v31;
        v30 -= v31;
        if (!v30)
          goto LABEL_26;
      }
      v29 = v31;
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = -1;
  }
LABEL_26:
  if (v29 != EncodedSize)
  {
    v32 = "write header";
    v33 = 431;
    goto LABEL_36;
  }
  if (v12 != -1)
  {
    if (s)
    {
      if (AAByteStreamSeek(s, 0, 0) < 0)
      {
        v32 = "seek dat stream";
        v33 = 437;
        goto LABEL_36;
      }
      v34 = AAByteStreamProcess(s, a1);
      if ((v34 & 0x8000000000000000) == 0 && v34 == v12)
        goto LABEL_32;
    }
    v32 = "write blob";
    v33 = 440;
LABEL_36:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c", (uint64_t)"encodeYOPEntry", v33, 27, 0, v32, v15, v16, v37);
    goto LABEL_37;
  }
LABEL_32:
  v35 = 0;
LABEL_38:
  AAHeaderDestroy(v13);
  return v35;
}

void subArchiveDestroy(AAByteStream *a1)
{
  if (a1)
  {
    AAByteStreamClose(a1[4]);
    AAByteStreamClose(a1[3]);
    free(a1);
  }
}

uint64_t aaEntryYECBlobInitWithEncodedData(_QWORD *a1, void *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v11;
  size_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t result;
  char v17;

  *a1 = 0;
  if ((__smax & 0x8000000000000000) != 0)
  {
LABEL_21:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithEncodedData", 22, 105, 0, "malloc", a7, a8, v17);
    return 0xFFFFFFFFLL;
  }
  v11 = a1[1];
  if (v11 < __smax)
  {
    do
    {
      while (!v11)
      {
        v11 = 0x4000;
        if (__smax <= 0x4000)
        {
          v11 = 0x4000;
          goto LABEL_12;
        }
      }
      v12 = v11 >> 1;
      if ((v11 & (v11 >> 1)) != 0)
        v12 = v11 & (v11 >> 1);
      v11 += v12;
    }
    while (v11 < __smax);
    if (v11 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_20;
    }
LABEL_12:
    v13 = (void *)a1[2];
    v14 = realloc(v13, v11);
    if (v14)
    {
      a1[1] = v11;
      a1[2] = v14;
      goto LABEL_14;
    }
    free(v13);
LABEL_20:
    a1[1] = 0;
    a1[2] = 0;
    *a1 = 0;
    goto LABEL_21;
  }
LABEL_14:
  v15 = a1[2];
  if (__src)
  {
    memcpy((void *)(v15 + *a1), __src, __smax);
  }
  else if (v15)
  {
    memset_s((void *)(v15 + *a1), __smax, 0, __smax);
  }
  result = 0;
  *a1 += __smax;
  return result;
}

uint64_t aaEntryYECBlobInitWithPath(_QWORD *a1, int a2, char *a3, const char *a4)
{
  char v4;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v23[2048];
  uint64_t v24;

  v4 = (char)a3;
  v24 = *MEMORY[0x24BDAC8D0];
  if ((concatPath(v23, 0x800uLL, a3, a4) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithPath", 34, 105, 0, "invalid path %s/%s", v7, v8, v4);
    return 0xFFFFFFFFLL;
  }
  v9 = open(v23, 0);
  if (v9 < 0)
  {
    v19 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithPath", 38, 105, v19, "open: %s", v20, v21, (char)v23);
    return 0xFFFFFFFFLL;
  }
  v15 = v9;
  if ((aaEntryYECBlobInitWithFD(a1, a2, v9, v10, v11, v12, v13, v14) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithPath", 40, 105, 0, "computing YEC blob: %s", v16, v17, (char)v23);
    v18 = 0xFFFFFFFFLL;
  }
  else
  {
    v18 = 0;
  }
  close(v15);
  return v18;
}

uint64_t aaEntryYECBlobInitWithFD(_QWORD *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  off_t st_size;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  unint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  size_t DataSize;
  uint64_t DataPtr;
  const void *v26;
  size_t v27;
  size_t v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  const char *v33;
  __int16 v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char v38;
  stat v39;

  if (a2 == 65552)
  {
    memset(&v39, 0, sizeof(v39));
    if (fstat(a3, &v39) || (v39.st_mode & 0xF000) != 0x8000)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", 71, 105, 0, "entry not found, or not a regular file", v10, v11, v38);
      v22 = 0;
      v18 = 0;
      v15 = 0;
    }
    else
    {
      st_size = v39.st_size;
      v15 = (char *)IFileStreamCreateWithFD(a3, 0, v39.st_size);
      if (v15)
      {
        v18 = (void **)OECCStreamCreate(1, 0x4000u, st_size);
        if (v18)
        {
          v19 = (unint64_t *)MemBufferCreate(0x10000uLL);
          v22 = (void **)v19;
          if (v19)
          {
            v23 = MemBufferTransmit(v19, st_size, (size_t (*)(int, void *, size_t))IFileStreamRead, (uint64_t)v15, (uint64_t (*)(uint64_t, uint64_t, uint64_t))OECCStreamWrite, (uint64_t)v18, v20, v21);
            if ((v23 & 0x8000000000000000) == 0 && v23 == st_size)
            {
              DataSize = OECCStreamGetDataSize((uint64_t)v18);
              DataPtr = OECCStreamGetDataPtr((uint64_t)v18);
              *a1 = 0;
              if ((DataSize & 0x8000000000000000) != 0)
              {
LABEL_40:
                v29 = "alloc blob failed";
                v30 = 89;
                goto LABEL_19;
              }
              v26 = (const void *)DataPtr;
              v27 = a1[1];
              if (v27 < DataSize)
              {
                do
                {
                  while (!v27)
                  {
                    v27 = 0x4000;
                    if (DataSize <= 0x4000)
                    {
                      v27 = 0x4000;
                      goto LABEL_31;
                    }
                  }
                  v28 = v27 >> 1;
                  if ((v27 & (v27 >> 1)) != 0)
                    v28 = v27 & (v27 >> 1);
                  v27 += v28;
                }
                while (v27 < DataSize);
                if (v27 >= 0x2000000001)
                {
                  *__error() = 12;
                  goto LABEL_39;
                }
LABEL_31:
                v35 = (void *)a1[2];
                v36 = realloc(v35, v27);
                if (v36)
                {
                  a1[1] = v27;
                  a1[2] = v36;
                  goto LABEL_33;
                }
                free(v35);
LABEL_39:
                a1[1] = 0;
                a1[2] = 0;
                *a1 = 0;
                goto LABEL_40;
              }
LABEL_33:
              v37 = a1[2];
              if (v26)
              {
                memcpy((void *)(v37 + *a1), v26, DataSize);
              }
              else if (v37)
              {
                memset_s((void *)(v37 + *a1), DataSize, 0, DataSize);
              }
              v31 = 0;
              *a1 += DataSize;
LABEL_22:
              IFileStreamDestroy(v15);
              OECCStreamDestroy(v18);
              MemBufferDestroy(v22);
              return v31;
            }
            v33 = "reading file data for ECC";
            v34 = 84;
          }
          else
          {
            v33 = "allocating mem buffer";
            v34 = 80;
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", v34, 105, 0, v33, v20, v21, v38);
        }
        else
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", 78, 105, 0, "creating the ECC stream", v16, v17, v38);
          v22 = 0;
        }
      }
      else
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", 76, 105, 0, "opening file", v13, v14, v38);
        v22 = 0;
        v18 = 0;
      }
    }
    v31 = 0xFFFFFFFFLL;
    goto LABEL_22;
  }
  v38 = a2;
  v29 = "invalid YEC variant: %u";
  v30 = 57;
LABEL_19:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"aaEntryYECBlobInitWithFD", v30, 105, 0, v29, a7, a8, v38);
  return 0xFFFFFFFFLL;
}

void *AAEntryYECBlobCreate()
{
  void *v0;
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v0 = malloc(0x18uLL);
  v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x18uLL, 0, 0x18uLL);
  }
  else
  {
    v2 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobCreate", 105, 105, *v2, "malloc", v3, v4, v6);
  }
  return v1;
}

void AAEntryYECBlobDestroy(void **a1)
{
  if (a1)
  {
    free(a1[2]);
    memset_s(a1, 0x18uLL, 0, 0x18uLL);
    free(a1);
  }
}

void **AAEntryYECBlobCreateWithEncodedData(void *a1, rsize_t a2)
{
  void **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;

  v4 = (void **)AAEntryYECBlobCreate();
  v10 = v4;
  if (v4 && (aaEntryYECBlobInitWithEncodedData(v4, a1, a2, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryYECBlobDestroy(v10);
    return 0;
  }
  return v10;
}

void **AAEntryYECBlobCreateWithPath(int a1, char *a2, const char *a3)
{
  void **v6;
  void **v7;

  v6 = (void **)AAEntryYECBlobCreate();
  v7 = v6;
  if (v6 && (aaEntryYECBlobInitWithPath(v6, a1, a2, a3) & 0x80000000) != 0)
  {
    AAEntryYECBlobDestroy(v7);
    return 0;
  }
  return v7;
}

uint64_t AAEntryYECBlobApplyToPath(uint64_t a1, char *__s, const char *a3, int *a4, uint64_t a5, int a6)
{
  char v8;
  uint64_t v10;
  uint64_t v11;
  off_t st_size;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  __int16 v23;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD __sa[2];
  uint64_t v30;
  stat v31;
  char v32[2048];
  uint64_t v33;

  v8 = (char)__s;
  v33 = *MEMORY[0x24BDAC8D0];
  memset(&v31, 0, sizeof(v31));
  __sa[0] = 0;
  __sa[1] = 0;
  v30 = 0;
  if ((concatPath(v32, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    LOBYTE(v28) = v8;
    v22 = "invalid path %s/%s";
    v23 = 153;
    goto LABEL_12;
  }
  if (lstat(v32, &v31) || (v31.st_mode & 0xF000) != 0x8000)
  {
    v28 = v32;
    v22 = "entry not found, or not a regular file: %s";
    v23 = 156;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", v23, 105, 0, v22, v10, v11, (char)v28);
    goto LABEL_13;
  }
  st_size = v31.st_size;
  memset_s(__sa, 0x18uLL, 0, 0x18uLL);
  HIDWORD(__sa[0]) = a6;
  v13 = open(v32, 2);
  if ((v13 & 0x80000000) == 0)
  {
    v14 = v13;
    v15 = ParallelArchiveECCFixFileSegment(v13, 0, st_size, *(__int128 **)(a1 + 16), *(_QWORD *)a1, (uint64_t)__sa);
    v18 = HIDWORD(v30);
    if (v15 < 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", 166, 105, 0, "file can't be fixed: %s", v16, v17, (char)v32);
    }
    else
    {
      if (!v15
        || !statIsCompressed(v31.st_flags)
        || (ParallelCompressionAFSCCompress(v32, 1) & 0x80000000) == 0)
      {
        v21 = 0;
        goto LABEL_19;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", 171, 105, 0, "file can't be re-compressed: %s", v19, v20, (char)v32);
    }
    v21 = 0xFFFFFFFFLL;
LABEL_19:
    close(v14);
    if (!a4)
      return v21;
    goto LABEL_14;
  }
  v25 = *__error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c", (uint64_t)"AAEntryYECBlobApplyToPath", 163, 105, v25, "opening file RW: %s", v26, v27, (char)v32);
LABEL_13:
  v21 = 0xFFFFFFFFLL;
  v18 = -1;
  if (a4)
LABEL_14:
    *a4 = v18;
  return v21;
}

uint64_t AAEntryYECBlobGetEncodedSize(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t AAEntryYECBlobGetEncodedData(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  double RealTime;
  void *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  char v23;

  v10 = (uint64_t *)malloc(0x38uLL);
  v11 = v10;
  if (v10)
    memset_s(v10, 0x38uLL, 0, 0x38uLL);
  v12 = malloc(0x478uLL);
  v13 = (uint64_t)v12;
  if (!v12 || (memset_s(v12, 0x478uLL, 0, 0x478uLL), !v11))
  {
    v16 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"AAEncodeArchiveOutputStreamOpen", 246, 99, *v16, "malloc", v17, v18, v23);
LABEL_11:
    encoderStreamClose(v13);
    free(v11);
    return 0;
  }
  *(_QWORD *)v13 = flags;
  if (!n_threads)
    n_threads = getDefaultNThreads();
  *(_DWORD *)(v13 + 8) = n_threads;
  *(_QWORD *)(v13 + 16) = stream;
  *(_QWORD *)(v13 + 80) = msg_data;
  *(_QWORD *)(v13 + 88) = msg_proc;
  RealTime = getRealTime();
  *(_OWORD *)(v13 + 24) = xmmword_20A40C150;
  *(double *)(v13 + 1136) = RealTime;
  v15 = malloc(0x40000uLL);
  *(_QWORD *)(v13 + 40) = v15;
  if (!v15)
  {
    v19 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"AAEncodeArchiveOutputStreamOpen", 260, 99, *v19, "malloc", v20, v21, v23);
    *(_QWORD *)(v13 + 24) = 0;
    *(_QWORD *)(v13 + 32) = 0;
    goto LABEL_11;
  }
  *v11 = v13;
  v11[1] = (uint64_t)encoderStreamClose;
  v11[2] = (uint64_t)encoderStreamAbort;
  v11[3] = (uint64_t)encoderStreamWriteHeader;
  v11[4] = (uint64_t)encoderStreamWriteBlob;
  return (AAArchiveStream)v11;
}

uint64_t encoderStreamClose(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  double v6;
  FILE **v7;
  char v8;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)result;
    if ((flushOBuf(result) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamClose", 98, 99, 0, "flushing buffer", v3, v4, v8);
      v5 = 0;
    }
    else
    {
      v5 = 1;
    }
    if (*(_QWORD *)(v1 + 32))
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamClose", 99, 99, 0, "bytes remaining in obuf", v3, v4, v8);
      v5 = 0;
    }
    if (*(_DWORD *)(v1 + 72))
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamClose", 100, 99, 0, "truncated entry when encoder destroyed", v3, v4, v8);
      v5 = 0;
    }
    free(*(void **)(v1 + 56));
    memset_s((void *)(v1 + 48), 0x10uLL, 0, 0x10uLL);
    free(*(void **)(v1 + 40));
    if (v5 && v2 >> 62)
    {
      v6 = getRealTime() - *(double *)(v1 + 1136);
      v7 = (FILE **)MEMORY[0x24BDAC8D8];
      fwrite("Encode archive\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      fprintf(*v7, "%12u entries in archive\n", *(_DWORD *)(v1 + 1128));
      fprintf(*v7, "%12llu bytes in archive (uncompressed)\n", *(_QWORD *)(v1 + 1120));
      fprintf(*v7, "%12.0f MB/s\n", (double)*(unint64_t *)(v1 + 1120) * 0.000000953674316 / v6);
      fprintf(*v7, "%12.2f encoding time (s)\n", v6);
    }
    free((void *)v1);
    if (v5)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

void encoderStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 68))
  {
    *(_DWORD *)(a1 + 68) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 16));
  }
}

uint64_t encoderStreamWriteHeader(uint64_t a1, AAHeader header, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v9;
  __int16 v10;
  uint64_t result;
  AAFieldKey v14;
  uint32_t KeyIndex;
  unsigned int FieldString;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  if (*(_DWORD *)(a1 + 68))
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a1 + 72))
  {
    v9 = "truncated entry when header encoded";
    v10 = 136;
LABEL_4:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteHeader", v10, 99, 0, v9, a7, a8, v24);
    return 0xFFFFFFFFLL;
  }
  *(_BYTE *)(a1 + 96) = 0;
  if (!*((_QWORD *)header + 2))
    return 0;
  if (*(_QWORD *)(a1 + 88))
  {
    v14.ikey = 5521744;
    KeyIndex = AAHeaderGetKeyIndex(header, v14);
    if ((KeyIndex & 0x80000000) == 0)
    {
      FieldString = AAHeaderGetFieldString(header, KeyIndex, 0x400uLL, (char *)(a1 + 96), 0);
      v17 = FieldString <= 1 ? 1 : FieldString;
      if (v17 >= 1
        && ((*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 88))(*(_QWORD *)(a1 + 80), 31, a1 + 96, 0) & 0x80000000) != 0)
      {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if ((aaHeaderBlobArrayInitWithHeader(a1 + 48, header) & 0x80000000) != 0)
  {
    v9 = "initializing blob array";
    v10 = 159;
    goto LABEL_4;
  }
  if ((writeOBuf((_QWORD *)a1, *((char **)header + 4), *((_QWORD *)header + 2)) & 0x80000000) != 0)
  {
    v9 = "writing header blob";
    v10 = 162;
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 64) = 0;
  v18 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v18 && (v19 = *(_QWORD *)(a1 + 56), !*(_QWORD *)(v19 + 8)))
  {
    v21 = (uint64_t *)(v19 + 32);
    v22 = 1;
    do
    {
      v20 = v22;
      if (v18 == v22)
        break;
      v23 = *v21;
      v21 += 3;
      ++v22;
    }
    while (!v23);
    *(_DWORD *)(a1 + 64) = v20;
  }
  else
  {
    v20 = 0;
  }
  result = 0;
  *(_DWORD *)(a1 + 72) = v20 < v18;
  ++*(_DWORD *)(a1 + 1128);
  return result;
}

uint64_t encoderStreamWriteBlob(uint64_t a1, int a2, char *a3, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  size_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD, uint64_t, uint64_t, _QWORD *);
  BOOL v32;
  size_t v33;
  int *v34;
  int v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v35 = a2;
  if (*(_DWORD *)(a1 + 68))
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0;
  if (!*(_DWORD *)(a1 + 72))
  {
    v17 = "receiving blob data outside of entry";
    v18 = 187;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", v18, 99, 0, v17, a7, a8, (char)v34);
    return 0xFFFFFFFFLL;
  }
  v11 = *(_DWORD *)(a1 + 64);
  if (v11 >= *(_DWORD *)(a1 + 48))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", 190, 99, 0, "unexpected blob data received: %llu B", a7, a8, a4);
    return 0xFFFFFFFFLL;
  }
  v12 = *(_QWORD *)(a1 + 56);
  if (*(_DWORD *)(v12 + 24 * v11) != a2)
  {
    v34 = &v35;
    v17 = "unexpected blob key: received %s, expecting %s";
    v18 = 192;
    goto LABEL_12;
  }
  v13 = v12 + 24 * v11;
  v15 = *(_QWORD *)(v13 + 8);
  v14 = (_QWORD *)(v13 + 8);
  if (v15 >= a4)
  {
    v21 = writeOBuf((_QWORD *)a1, a3, a4);
    if (v21 < 0)
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", 201, 99, 0, "writing data blob", v19, v20, (char)v34);
    v22 = *v14 - a4;
    v32 = *v14 == a4;
    *v14 = v22;
    if (v32)
    {
      v23 = *(_DWORD *)(a1 + 64);
      v24 = (v23 + 1);
      *(_DWORD *)(a1 + 64) = v24;
      v25 = *(unsigned int *)(a1 + 48);
      if (v24 < v25)
      {
        v26 = *(_QWORD *)(a1 + 56);
        if (!*(_QWORD *)(v26 + 24 * v24 + 8))
        {
          v27 = (uint64_t *)(v26 + 24 * v24 + 32);
          v28 = ~v24 + v25;
          v29 = v23 + 2;
          do
          {
            LODWORD(v24) = v29;
            if (!v28)
              break;
            v30 = *v27;
            v27 += 3;
            --v28;
            ++v29;
          }
          while (!v30);
          *(_DWORD *)(a1 + 64) = v24;
        }
      }
      *(_DWORD *)(a1 + 72) = v24 < v25;
    }
    v31 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD *))(a1 + 88);
    if (v31)
      v32 = (a2 & 0xFFFFFF) == 5521732;
    else
      v32 = 0;
    if (!v32)
      return (v21 >> 31);
    if (!*(_BYTE *)(a1 + 96))
      return (v21 >> 31);
    v33 = *(_QWORD *)(v12 + 24 * v11 + 16) - v22;
    v36[0] = *(_QWORD *)(v12 + 24 * v11 + 16);
    v36[1] = v33;
    if ((v31(*(_QWORD *)(a1 + 80), 31, a1 + 96, v36) & 0x80000000) == 0)
      return (v21 >> 31);
    v17 = "client callback cancel";
    v18 = 220;
    goto LABEL_12;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"encoderStreamWriteBlob", 193, 99, 0, "extra data received for blob %s: received %llu, expecting %llu", a7, a8, a4);
  return 0xFFFFFFFFLL;
}

uint64_t flushOBuf(uint64_t a1)
{
  unint64_t v1;
  unint64_t v3;
  ssize_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    return 0;
  v3 = 0;
  while (1)
  {
    v4 = AAByteStreamWrite(*(AAByteStream *)(a1 + 16), (const void *)(*(_QWORD *)(a1 + 40) + v3), v1 - v3);
    if (v4 < 1)
      break;
    v3 += v4;
    *(_QWORD *)(a1 + 1120) += v4;
    v1 = *(_QWORD *)(a1 + 32);
    if (v3 >= v1)
    {
      result = 0;
      *(_QWORD *)(a1 + 32) = 0;
      return result;
    }
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"flushOBuf", 54, 99, 0, "Writing to ostream failed", v5, v6, v8);
  return 0xFFFFFFFFLL;
}

uint64_t writeOBuf(_QWORD *a1, char *__src, size_t a3)
{
  size_t v3;
  size_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  char v12;

  if (!a3)
    return 0;
  v3 = a3;
  v6 = a1[4];
  while (1)
  {
    v7 = a1[3];
    if (v6 == v7)
      break;
LABEL_6:
    if (v6 + v3 <= v7)
      v10 = v3;
    else
      v10 = v7 - v6;
    memcpy((void *)(a1[5] + v6), __src, v10);
    v6 = a1[4] + v10;
    a1[4] = v6;
    __src += v10;
    v3 -= v10;
    if (!v3)
      return 0;
  }
  if ((flushOBuf((uint64_t)a1) & 0x80000000) == 0)
  {
    v7 = a1[3];
    v6 = a1[4];
    goto LABEL_6;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c", (uint64_t)"writeOBuf", 70, 99, 0, "flush output buffer failed", v8, v9, v12);
  return 0xFFFFFFFFLL;
}

uint64_t forceInPlaceControls(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  unint64_t v8;
  size_t v9;
  _DWORD *v10;
  char *v11;
  char *v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  _DWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  unint64_t v44;
  int v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  FILE **v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  _DWORD *v58;
  uint64_t v59;
  BOOL v60;
  unint64_t v61;
  unint64_t v62;
  int64x2_t v63;
  int64x2_t *v64;
  int64x2_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  int v71;
  unint64_t v72;
  int64x2_t v73;
  unint64_t v74;
  int64x2_t v75;
  uint64_t v76;
  uint64_t v78;
  char v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  int64x2_t v84;
  int64x2_t v85;
  unint64_t v86;
  int64x2_t v87;
  int64x2_t v88;

  if (a1 <= a2)
    v8 = a2;
  else
    v8 = a1;
  v9 = ((v8 + 4095) >> 12) + 16;
  if (a5 >= 3)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Post-processing ctrl for in-place patching, %u pages\n", v9);
  v10 = calloc(v9, 4uLL);
  v11 = (char *)calloc(v9, 4uLL);
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    if (a4)
    {
      v19 = 0;
      v20 = 0;
      v21 = v9;
      do
      {
        v22 = (unint64_t *)(a3 + 24 * v19);
        v23 = *v22;
        if ((*v22 & 0x8000000000000000) != 0)
          v23 = 0x8000000000000000 - *v22;
        v24 = v22[2];
        if (v24 < 0)
          v24 = 0x8000000000000000 - v24;
        v25 = v20 >> 12;
        if (v23)
          v26 = ((v20 + v23 - 1) >> 12) - (v20 >> 12) + 1;
        else
          v26 = 0;
        v27 = (v26 + v25);
        if (v27 > v25)
        {
          v28 = &v10[v25];
          v29 = v27 - v25;
          do
          {
            v21 = (__PAIR64__(v21, (*v28++)++) - 1) >> 32;
            --v29;
          }
          while (v29);
        }
        v20 += v23 + v24;
        ++v19;
      }
      while (v19 != a4);
    }
    else
    {
      v21 = v9;
    }
    if (a5 > 1)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "After input pages retained, %u free pages\n", v21);
    if (a4)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = v21;
      do
      {
        v34 = (unint64_t *)(a3 + 24 * v30);
        v35 = v34[1];
        v36 = 0x8000000000000000 - *v34;
        if ((*v34 & 0x8000000000000000) == 0)
          v36 = *v34;
        v37 = 0x8000000000000000 - v35;
        if (v35 >= 0)
          v37 = v34[1];
        v38 = v34[2];
        if (v38 < 0)
          v38 = 0x8000000000000000 - v38;
        if (v36)
        {
          v39 = v36 + v31;
          do
          {
            v40 = (v31 & 0xFFFFFFFFFFFFF000) + 4096;
            if (v40 >= v39)
              v40 = v39;
            v41 = v32 >> 12;
            v42 = v40 - v31;
            if (v40 == v31)
              v43 = 0;
            else
              v43 = ((v32 + v42 - 1) >> 12) - v41 + 1;
            v44 = v31 >> 12;
            v45 = v10[v44] - 1;
            v10[v44] = v45;
            if (!v45)
              ++v21;
            v46 = (v43 + v41);
            if (v46 > v41)
            {
              v47 = &v12[4 * v41];
              v48 = v46 - v41;
              do
              {
                v21 = (__PAIR64__(v21, (*(_DWORD *)v47)++) - 1) >> 32;
                v47 += 4;
                --v48;
              }
              while (v48);
            }
            v32 += v42;
            if (v21 < v33)
              v33 = v21;
            v31 = v40;
            v36 -= v42;
          }
          while (v36);
        }
        else
        {
          v40 = v31;
        }
        v31 = v40 + v38;
        v32 += v37;
        ++v30;
      }
      while (v30 != a4);
    }
    else
    {
      v33 = v21;
    }
    if (a5 > 2)
    {
      v49 = (FILE **)MEMORY[0x24BDAC8D8];
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Free pages after diff controls: %u\n", v21);
      fprintf(*v49, "Min free pages reached: %d\n", v33);
    }
    bzero(v10, 4 * v9);
    if (a4)
    {
      v50 = 0;
      v51 = 0;
      do
      {
        v52 = (unint64_t *)(a3 + 24 * v50);
        v53 = *v52;
        if ((*v52 & 0x8000000000000000) != 0)
          v53 = 0x8000000000000000 - *v52;
        v54 = v52[2];
        if (v54 < 0)
          v54 = 0x8000000000000000 - v54;
        v55 = v51 >> 12;
        if (v53)
          v56 = ((v51 + v53 - 1) >> 12) - (v51 >> 12) + 1;
        else
          v56 = 0;
        v57 = (v56 + v55);
        if (v57 > v55)
        {
          v58 = &v10[v55];
          v59 = v57 - v55;
          do
          {
            ++*v58++;
            --v59;
          }
          while (v59);
        }
        v51 += v53 + v54;
        ++v50;
      }
      while (v50 != a4);
      v60 = v33 < 4;
      v81 = v12;
      if (v33 <= 3)
      {
        v82 = a3;
        v83 = a4;
        v61 = 0;
        v62 = 0;
        v63 = vdupq_n_s64(0x8000000000000000);
        v84 = v63;
        do
        {
          v64 = (int64x2_t *)(v82 + 24 * v61);
          v65 = (int64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(*v64), (int8x16_t)vsubq_s64(v63, *v64), *(int8x16_t *)v64);
          v66 = v64[1].i64[0];
          if (v66 >= 0)
            v67 = v64[1].i64[0];
          else
            v67 = 0x8000000000000000 - v66;
          if (a5 >= 3)
          {
            v87 = v65;
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ctrl[%zu]: ndiff=%llu nlit=%llu\n", v61, v65.i64[0], v65.i64[1]);
            v65 = v87;
            v63 = v84;
          }
          v68 = v65.i64[0];
          if (v65.i64[0])
          {
            do
            {
              v69 = v65.i64[0] + v62;
              v70 = (v65.i64[0] + v62 - 1) & 0xFFFFFFFFFFFFF000;
              if (v70 <= v62)
                v70 = v62;
              v71 = v10[(v70 >> 12)] - 1;
              v10[(v70 >> 12)] = v71;
              if (!v71)
                ++v33;
              v72 = v69 - v70;
              v73 = vdupq_n_s64(v69 - v70);
              v74 = vsubq_s64(v65, v73).u64[0];
              if (a5 >= 3)
              {
                v88 = v65;
                v85 = v73;
                v86 = v74;
                fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ctrl[%zu]: moving %llu bytes from diff to lit (minFree=%d, ndiff=%llu)\n", v61, v72, v33, v74);
                v73 = v85;
                v74 = v86;
                v65 = v88;
                v63 = v84;
              }
              v75 = vaddq_s64(v65, v73);
              v65.i64[0] = v74;
              v65.i64[1] = v75.i64[1];
              v67 += v72;
              *(int8x16_t *)v64 = vbslq_s8((int8x16_t)vcltzq_s64(v65), (int8x16_t)vsubq_s64(v63, v65), (int8x16_t)v65);
              v76 = 0x8000000000000000 - v67;
              if (v67 >= 0)
                v76 = v67;
              v64[1].i64[0] = v76;
              v68 = v74;
            }
            while (v33 <= 3 && v74 != 0);
          }
          ++v61;
          v60 = v33 < 4;
          if (v61 >= v83)
            break;
          v62 += v68 + v67;
        }
        while (v33 <= 3);
      }
      v12 = v81;
      if (v60)
        goto LABEL_96;
    }
    else if (v33 < 4)
    {
LABEL_96:
      v80 = 4;
      v17 = "Could not reduce minFree to %d, something is wrong";
      v18 = 264;
      v14 = 0;
      goto LABEL_97;
    }
    v78 = 0;
    goto LABEL_100;
  }
  v14 = *__error();
  v17 = "malloc";
  v18 = 139;
LABEL_97:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"forceInPlaceControls", v18, 53, v14, v17, v15, v16, v80);
  v78 = 0xFFFFFFFFLL;
LABEL_100:
  free(v10);
  free(v12);
  return v78;
}

_QWORD *initDiffSegmentVector(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

uint64_t reserveDiffSegmentVector(uint64_t a1, unint64_t a2)
{
  void *v3;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (*(_QWORD *)(a1 + 8) >= a2)
    return 0;
  *(_QWORD *)(a1 + 8) = a2;
  v3 = reallocf(*(void **)(a1 + 16), 24 * a2);
  *(_QWORD *)(a1 + 16) = v3;
  if (v3)
    return 0;
  v5 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"reserveDiffSegmentVector", 327, 53, *v5, "reallocf", v6, v7, v8);
  return 0xFFFFFFFFLL;
}

__n128 pushDiffSegment(unint64_t *a1, __n128 *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __n128 result;
  unint64_t v8;
  __n128 *v9;

  if (!a2[1].n128_u64[0])
    return result;
  v4 = *a1;
  v5 = a1[1];
  if (*a1 < v5)
  {
LABEL_10:
    v8 = a1[2];
    *a1 = v4 + 1;
    v9 = (__n128 *)(v8 + 24 * v4);
    result = *a2;
    v9[1].n128_u64[0] = a2[1].n128_u64[0];
    *v9 = result;
    return result;
  }
  if (v5)
    v6 = v5 + (v5 >> 1);
  else
    v6 = 64;
  if (!reserveDiffSegmentVector((uint64_t)a1, v6))
  {
    v4 = *a1;
    goto LABEL_10;
  }
  return result;
}

uint64_t pushControls(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v9;
  unint64_t *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  int v19;
  __n128 v21;
  unint64_t v22;

  if (a3)
  {
    v9 = 0;
    v10 = (unint64_t *)(a2 + 16);
    v11 = 1;
    do
    {
      v12 = *(v10 - 2);
      v13 = *(v10 - 1);
      if (v12 >= 0)
        v14 = *(v10 - 2);
      else
        v14 = 0x8000000000000000 - v12;
      if (v13 >= 0)
        v15 = *(v10 - 1);
      else
        v15 = 0x8000000000000000 - v13;
      if ((*v10 & 0x8000000000000000) == 0)
        v16 = *v10;
      else
        v16 = 0x8000000000000000 - *v10;
      v21.n128_u64[0] = a5;
      v21.n128_u64[1] = a4;
      v22 = v14;
      pushDiffSegment(a1, &v21);
      if (v17)
        break;
      v18 = v14 + a5;
      v21.n128_u64[0] = v18;
      v21.n128_u64[1] = -1;
      v22 = v15;
      pushDiffSegment(a1, &v21);
      if (v19)
        break;
      v10 += 3;
      a4 += v14 + v16;
      a5 = v18 + v15;
      v11 = ++v9 < a3;
    }
    while (a3 != v9);
  }
  else
  {
    v11 = 0;
  }
  return (v11 << 31 >> 31);
}

uint64_t mergeDiffSegmentVectors(unint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  size_t v24;
  char *v25;
  size_t v26;
  unint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  size_t v31;
  char *v32;
  int v33;
  int v34;
  char *v35;
  char *v36;
  int v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  __n128 v59;
  unint64_t v60;
  __int128 v61;
  void *v62;

  if (!a1)
    return 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v61 = 0uLL;
  v62 = 0;
  do
  {
    v14 = &a2[3 * v13];
    v15 = *v14;
    if (!*v14)
    {
      v38 = "empty segment vector";
      v39 = 429;
LABEL_62:
      v37 = 0;
LABEL_32:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"mergeDiffSegmentVectors", v39, 53, v37, v38, a7, a8, v56);
      goto LABEL_33;
    }
    v16 = (_QWORD *)(v14[2] + 16);
    do
    {
      if (v10 + 4 > v11)
      {
        v11 += 0x4000;
        v12 = (char *)reallocf(v12, 16 * v11);
        if (!v12)
        {
          v37 = *__error();
          v38 = "malloc";
          v39 = 437;
          goto LABEL_32;
        }
      }
      v17 = *(v16 - 2);
      if (*(v16 - 1) == -1)
      {
        v21 = *v16 + v17;
        v20 = v10 + 1;
        v22 = &v12[16 * v10];
        *(_QWORD *)v22 = v17;
        *((_QWORD *)v22 + 1) = 1;
        v19 = &v12[16 * v10 + 16];
        *(_QWORD *)v19 = v21;
        v18 = -1;
      }
      else
      {
        v18 = 0;
        v19 = &v12[16 * v10];
        *(_QWORD *)v19 = v17;
        v20 = v10;
      }
      *((_DWORD *)v19 + 2) = v18;
      *((_DWORD *)v19 + 3) = 0;
      v10 = v20 + 1;
      v16 += 3;
      --v15;
    }
    while (v15);
    ++v13;
  }
  while (v13 != a1);
  v23 = a2[2] + 24 * *a2;
  v24 = v20 + 2;
  v25 = &v12[16 * v10];
  *(_QWORD *)v25 = *(_QWORD *)(v23 - 8) + *(_QWORD *)(v23 - 24);
  *((_QWORD *)v25 + 1) = 0;
  qsort(v12, v24, 0x10uLL, (int (__cdecl *)(const void *, const void *))mergeDiffSegmentEventCompareProc);
  if (v24)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    while (1)
    {
      v29 = 0;
      v30 = *(_QWORD *)&v12[16 * v26];
      if (v24 <= v26 + 1)
        v31 = v26 + 1;
      else
        v31 = v24;
      v32 = &v12[16 * v26 + 8];
      while (*((_QWORD *)v32 - 1) == v30)
      {
        v33 = *(_DWORD *)v32;
        v32 += 16;
        v29 += v33;
        if (v31 == ++v26)
        {
          v26 = v31;
          break;
        }
      }
      if (v29 | v28)
      {
        if (!v29)
          goto LABEL_28;
        if (!v28)
        {
          v36 = &v12[16 * v27];
          *(_QWORD *)v36 = v30;
          *((_DWORD *)v36 + 2) = 1;
          ++v27;
        }
        v28 += v29;
        if (v28)
          goto LABEL_28;
        v34 = -1;
      }
      else
      {
        v34 = 0;
      }
      v28 = 0;
      v35 = &v12[16 * v27];
      *(_QWORD *)v35 = v30;
      *((_DWORD *)v35 + 2) = v34;
      ++v27;
LABEL_28:
      if (v26 >= v24)
        goto LABEL_39;
    }
  }
  v27 = 0;
LABEL_39:
  v42 = 0;
  if (a1 <= 1)
    v43 = 1;
  else
    v43 = a1;
  v56 = v43;
  while (1)
  {
    v44 = &a2[3 * v42];
    v45 = *v44;
    v58 = v44[2];
    if (reserveDiffSegmentVector((uint64_t)&v61, v27))
      break;
    v57 = v42;
    if (v27)
    {
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      while (1)
      {
        v50 = (unint64_t *)&v12[16 * v46];
        v51 = *v50;
        if (v49 < v45)
        {
          v52 = (_QWORD *)(v58 + 16 + 24 * v49);
          while (*v52 + *(v52 - 2) < v51)
          {
            v52 += 3;
            if (v45 == ++v49)
              goto LABEL_61;
          }
        }
        if (v49 == v45)
          break;
        if (v46)
        {
          if (v48)
            v53 = -1;
          else
            v53 = *(_QWORD *)(v58 + 24 * v49 + 8) + v47 - *(_QWORD *)(v58 + 24 * v49);
          v59.n128_u64[0] = v47;
          v59.n128_u64[1] = v53;
          v60 = v51 - v47;
          pushDiffSegment((unint64_t *)&v61, &v59);
          v47 = *v50;
        }
        else
        {
          v47 = *v50;
        }
        v48 += *(_DWORD *)&v12[16 * v46++ + 8];
        if (v46 == v27)
          goto LABEL_59;
      }
LABEL_61:
      v38 = "no overlapping segment found";
      v39 = 539;
      goto LABEL_62;
    }
LABEL_59:
    v54 = v61;
    v55 = reallocToFit(v62, 24 * v61);
    *((_QWORD *)&v61 + 1) = v54;
    v62 = v55;
    free((void *)v44[2]);
    *(_OWORD *)v44 = v61;
    v44[2] = (unint64_t)v62;
    v62 = 0;
    v61 = 0uLL;
    v42 = v57 + 1;
    if (v57 + 1 == v56)
    {
      v40 = 0;
      goto LABEL_34;
    }
  }
LABEL_33:
  v40 = 0xFFFFFFFFLL;
LABEL_34:
  free(v12);
  free(v62);
  return v40;
}

uint64_t mergeDiffSegmentEventCompareProc(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    return 0xFFFFFFFFLL;
  if (*(_QWORD *)a2 >= *(_QWORD *)a1)
    return (*(_DWORD *)(a1 + 8) - *(_DWORD *)(a2 + 8));
  return 1;
}

uint64_t getComboControlsFromMergedDiffSegmentVectors(char *a1, uint64_t *a2, _QWORD *a3, uint64_t *a4)
{
  size_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  int v21;
  uint64_t *v22;
  _QWORD *v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  __int16 v38;
  uint64_t v39;
  char v41;

  if (!a1)
  {
    v16 = 0;
LABEL_39:
    v39 = 0;
    goto LABEL_40;
  }
  v7 = (size_t)a1;
  v8 = *a2;
  v9 = a1 + 2;
  v10 = (char *)calloc((size_t)&v9[(_QWORD)v9 * *a2], 8uLL);
  if (v10)
  {
    v11 = calloc(v7, 8uLL);
    if (v11)
    {
      if (v8)
      {
        v12 = 0;
        v15 = a2[2];
        v14 = a2 + 2;
        v13 = v15;
        v16 = 1;
        while (1)
        {
          v17 = (uint64_t *)&v10[8 * v16 * (_QWORD)v9];
          v18 = (uint64_t *)&v10[8 * (v16 - 1) * (_QWORD)v9];
          v19 = *(_QWORD *)(v13 + 24 * v12 + 16);
          if (*(_QWORD *)(v13 + 24 * v12 + 8) == -1)
          {
            if (v19 < 0)
              v19 = 0x8000000000000000 - v19;
            if (!v18[1])
            {
              v18[1] = v19;
              goto LABEL_25;
            }
            v17[1] = v19;
          }
          else
          {
            v20 = (uint64_t *)&v10[8 * (_QWORD)v9 * (v16 - 1) + 16];
            v21 = 1;
            v22 = v14;
            v23 = v11;
            v24 = v7;
            do
            {
              v25 = *v22;
              v22 += 3;
              v26 = *(_QWORD *)(v25 + 24 * v12 + 8);
              v27 = v26 - *v23;
              if (v26 != *v23)
                v21 = 0;
              *v23++ = v26 + v19;
              v28 = 0x8000000000000000 - v27;
              if (v27 >= 0)
                v28 = v27;
              *v20++ = v28;
              --v24;
            }
            while (v24);
            if (v21)
            {
              v29 = v18[1];
              if (v29 < 0)
                v29 = 0x8000000000000000 - v29;
              if (!v29)
              {
                v31 = *v18;
                if (*v18 < 0)
                  v31 = 0x8000000000000000 - *v18;
                v32 = __OFADD__(v31, v19);
                v33 = v31 + v19;
                if (v33 < 0 != v32)
                  v33 = 0x8000000000000000 - v33;
                *v18 = v33;
                goto LABEL_25;
              }
            }
            v30 = 0x8000000000000000 - v19;
            if (v19 >= 0)
              v30 = v19;
            *v17 = v30;
          }
          ++v16;
LABEL_25:
          if (++v12 == v8)
            goto LABEL_38;
        }
      }
      v16 = 1;
LABEL_38:
      free(v11);
      a1 = (char *)reallocToFit(v10, 8 * (_QWORD)v9 * v16);
      goto LABEL_39;
    }
    v34 = *__error();
    v37 = "calloc ipos";
    v38 = 600;
  }
  else
  {
    v34 = *__error();
    v37 = "calloc controls";
    v38 = 596;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c", (uint64_t)"getComboControlsFromMergedDiffSegmentVectors", v38, 53, v34, v37, v35, v36, v41);
  free(v10);
  a1 = 0;
  v16 = 0;
  v39 = 0xFFFFFFFFLL;
LABEL_40:
  *a3 = a1;
  *a4 = v16;
  return v39;
}

ssize_t decodeStreamRefillBuffer(uint64_t a1)
{
  ssize_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  if (!*(_DWORD *)(a1 + 1128))
  {
    v3 = *(_QWORD *)(a1 + 32);
    do
    {
      v4 = *(_QWORD *)(a1 + 40);
      if (v4 == v3)
        break;
      result = AAByteStreamRead(*(AAByteStream *)(a1 + 8), (void *)(*(_QWORD *)(a1 + 48) + v3), v4 - v3);
      if (!result)
      {
        *(_DWORD *)(a1 + 1128) = 1;
        return result;
      }
      if (result < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamRefillBuffer", 35, 61, 0, "istream read error", v5, v6, v8);
        return 0xFFFFFFFFLL;
      }
      v3 = *(_QWORD *)(a1 + 32);
      v7 = v3 + result;
      if (!__CFADD__(v3, result) && v7 <= *(_QWORD *)(a1 + 40))
      {
        *(_QWORD *)(a1 + 32) = v7;
        v3 += result;
      }
    }
    while (!*(_DWORD *)(a1 + 1128));
  }
  return 0;
}

uint64_t decodeStreamDiscard(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v10;
  __int16 v11;
  char v12;

  if (!a2)
    return 0;
  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  while (1)
  {
    if (v4 >= v2)
      v5 = v2;
    else
      v5 = v4;
    if (v5)
    {
      v6 = v4 - v5;
      if (v4 > v2)
        memmove(*(void **)(a1 + 48), (const void *)(*(_QWORD *)(a1 + 48) + v5), v4 - v5);
      *(_QWORD *)(a1 + 32) = v6;
      v2 -= v5;
      *(_QWORD *)(a1 + 1136) += v5;
      goto LABEL_12;
    }
    if ((decodeStreamRefillBuffer(a1) & 0x80000000) != 0)
    {
      v10 = "refill buffer failed";
      v11 = 56;
      goto LABEL_17;
    }
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
      break;
LABEL_12:
    v4 = v6;
    if (!v2)
      return 0;
  }
  v10 = "discard data failed";
  v11 = 58;
LABEL_17:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamDiscard", v11, 61, 0, v10, v7, v8, v12);
  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamReadData(uint64_t a1, char *__dst, size_t a3)
{
  size_t v3;
  size_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v12;
  __int16 v13;
  char v14;

  if (!a3)
    return 0;
  v3 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  while (1)
  {
    if (v6 >= v3)
      v7 = v3;
    else
      v7 = v6;
    if (v7)
    {
      memcpy(__dst, *(const void **)(a1 + 48), v7);
      v3 -= v7;
      v10 = *(_QWORD *)(a1 + 32);
      v6 = v10 - v7;
      if (v10 < v7)
      {
        v12 = "updating buffer";
        v13 = 76;
        goto LABEL_19;
      }
      if (v10 != v7)
        memmove(*(void **)(a1 + 48), (const void *)(*(_QWORD *)(a1 + 48) + v7), v10 - v7);
      __dst += v7;
      *(_QWORD *)(a1 + 32) = v6;
      *(_QWORD *)(a1 + 1136) += v7;
      goto LABEL_13;
    }
    if ((decodeStreamRefillBuffer(a1) & 0x80000000) != 0)
    {
      v12 = "refill buffer failed";
      v13 = 82;
      goto LABEL_19;
    }
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
      break;
LABEL_13:
    if (!v3)
      return 0;
  }
  v12 = "load header failed";
  v13 = 84;
LABEL_19:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamReadData", v13, 61, 0, v12, v8, v9, v14);
  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamLoadHeader(_QWORD *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  size_t v9;
  const char *v11;
  __int16 v12;
  uint64_t result;
  char v14;

  v8 = a1[9];
  v9 = a2 - v8;
  if (a2 <= v8)
    return 0;
  if (a1[10] >= a2)
  {
    if ((decodeStreamReadData((uint64_t)a1, (char *)(a1[8] + v8), v9) & 0x80000000) == 0)
    {
      result = 0;
      a1[9] += v9;
      return result;
    }
    v11 = "read error";
    v12 = 96;
  }
  else
  {
    v11 = "invalid header size";
    v12 = 94;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamLoadHeader", v12, 61, 0, v11, a7, a8, v14);
  return 0xFFFFFFFFLL;
}

uint64_t loadAndDecodeHeader_AA(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v8;
  __int16 v9;
  char v12;

  if (*(_QWORD *)(a1 + 72) > 5uLL)
  {
    if ((decodeStreamLoadHeader((_QWORD *)a1, *(unsigned __int16 *)(*(_QWORD *)(a1 + 64) + 4), a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
    {
      v8 = "truncated stream";
      v9 = 110;
    }
    else
    {
      if ((aaHeaderInitWithEncodedData(*(_QWORD *)(a1 + 88), *(unsigned __int16 **)(a1 + 64), *(_QWORD *)(a1 + 72)) & 0x80000000) == 0)
        return 0;
      v8 = "corrupted archive header";
      v9 = 113;
    }
  }
  else
  {
    v8 = "Invalid decoder state";
    v9 = 106;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"loadAndDecodeHeader_AA", v9, 61, 0, v8, a7, a8, v12);
  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamHLCFromINO(_QWORD *a1, unint64_t a2, unint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v12 = a1[147];
  if (v12 && (v13 = (unint64_t *)a1[149], *v13 < a2))
  {
    if (v12 < 2)
    {
      v14 = 1;
LABEL_10:
      v18 = a1[148];
      if (v12 >= v18)
      {
        v19 = 2 * v18;
        if (!v18)
          v19 = 32;
        a1[148] = v19;
        if ((unint64_t)(32 * v19) >= 0x2000000001)
        {
          *__error() = 12;
LABEL_31:
          a1[149] = 0;
          v31 = __error();
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamHLCFromINO", 146, 61, *v31, "malloc", v32, v33, v34);
          a1[147] = 0;
          a1[148] = 0;
          return -1;
        }
        v20 = (void *)a1[149];
        v21 = realloc(v20, 32 * v19);
        if (!v21)
        {
          free(v20);
          goto LABEL_31;
        }
        a1[149] = v21;
        v12 = a1[147];
      }
      v22 = v14;
      v23 = v12 - v14;
      if (v23)
      {
        memmove((void *)(a1[149] + 32 * v14 + 32), (const void *)(a1[149] + 32 * v14), 32 * v23);
        v22 = a1[147];
      }
      a1[147] = v22 + 1;
      v15 = a1[149];
      v24 = v15 + 32 * v14;
      *(_QWORD *)v24 = a2;
      *(_QWORD *)(v24 + 24) = v22;
      *(int64x2_t *)(v24 + 8) = vdupq_n_s64(a3);
      goto LABEL_20;
    }
    v28 = 0;
    v29 = a1[147];
    v14 = v29;
    do
    {
      v30 = v28 + (v29 >> 1);
      if (v13[4 * v30] >= a2)
        v14 = v30;
      else
        v28 = v30;
      v29 = v14 - v28;
    }
    while ((unint64_t)(v14 - v28) > 1);
  }
  else
  {
    v14 = 0;
  }
  if (v14 == v12)
    goto LABEL_10;
  v15 = a1[149];
  if (*(_QWORD *)(v15 + 32 * v14) != a2)
    goto LABEL_10;
  if (*(_QWORD *)(v15 + 32 * v14 + 8) == a3)
  {
LABEL_20:
    v25 = v15 + 32 * v14;
    v26 = *(_QWORD *)(v25 + 16) - 1;
    *(_QWORD *)(v25 + 16) = v26;
    if (v26 < a3)
    {
      *a4 = v26 == 0;
      return *(_QWORD *)(v25 + 24);
    }
    v16 = "invalid nlink";
    v17 = 165;
    goto LABEL_23;
  }
  v16 = "nlink mismatch";
  v17 = 163;
LABEL_23:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamHLCFromINO", v17, 61, 0, v16, a7, a8, v34);
  return -1;
}

AAArchiveStream AADecodeArchiveInputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  char *v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  size_t v13;
  size_t v14;
  void *v15;
  void *v16;
  void *v17;
  AAHeader v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  char v25;

  v9 = (char *)malloc(0x4C0uLL);
  v10 = v9;
  if (v9)
    memset_s(v9, 0x4C0uLL, 0, 0x4C0uLL);
  v11 = malloc(0x38uLL);
  v12 = v11;
  if (!v11 || (memset_s(v11, 0x38uLL, 0, 0x38uLL), !v10))
  {
    v21 = *__error();
    v22 = "malloc";
    v23 = 388;
LABEL_19:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"AADecodeArchiveInputStreamOpen", v23, 61, v21, v22, v19, v20, v25);
    free(v12);
    decodeStreamClose(v10);
    return 0;
  }
  v13 = *((_QWORD *)v10 + 5);
  if (!(v13 >> 18))
  {
    do
    {
      v14 = (v13 >> 1) + v13;
      if (((v13 >> 1) & v13) != 0)
        v14 = ((v13 >> 1) & v13) + v13;
      if (v13)
        v13 = v14;
      else
        v13 = 0x4000;
    }
    while (v13 < 0x40000);
    v15 = (void *)*((_QWORD *)v10 + 6);
    v16 = realloc(v15, v13);
    if (!v16)
    {
      free(v15);
      *((_QWORD *)v10 + 4) = 0;
      *((_QWORD *)v10 + 5) = 0;
      *((_QWORD *)v10 + 6) = 0;
      v22 = "init buffer";
      v23 = 391;
      goto LABEL_24;
    }
    *((_QWORD *)v10 + 5) = v13;
    *((_QWORD *)v10 + 6) = v16;
  }
  *((_QWORD *)v10 + 1) = stream;
  *((_DWORD *)v10 + 14) = -1;
  *(_OWORD *)(v10 + 72) = xmmword_20A40C170;
  v17 = malloc(0x10000uLL);
  *((_QWORD *)v10 + 8) = v17;
  if (!v17)
  {
    v21 = *__error();
    v22 = "malloc";
    v23 = 397;
    goto LABEL_19;
  }
  *((_QWORD *)v10 + 11) = AAHeaderCreate();
  v18 = AAHeaderCreate();
  *((_QWORD *)v10 + 12) = v18;
  if (!*((_QWORD *)v10 + 11) || !v18)
  {
    v22 = "allocating header";
    v23 = 400;
LABEL_24:
    v21 = 0;
    goto LABEL_19;
  }
  *(_QWORD *)v10 = flags;
  *((_QWORD *)v10 + 2) = msg_proc;
  *((_QWORD *)v10 + 3) = msg_data;
  *((double *)v10 + 151) = getRealTime();
  v12[5] = decodeStreamReadHeader;
  v12[6] = decodeStreamReadBlob;
  *v12 = v10;
  v12[1] = decodeStreamClose;
  v12[2] = decodeStreamAbort;
  return (AAArchiveStream)v12;
}

uint64_t decodeStreamReadHeader(uint64_t a1, AAHeader *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int *v25;
  int v27;
  int v28;
  int v30;
  int v31;
  uint64_t v33;
  AAHeader_impl *v34;
  AAFieldKey v35;
  uint32_t KeyIndex;
  unsigned int FieldUInt;
  int v38;
  AAHeader_impl *v39;
  AAFieldKey v40;
  uint32_t v41;
  unsigned int FieldString;
  int v43;
  size_t v44;
  uint64_t (*v45)(_QWORD, uint64_t, uint64_t, _QWORD);
  AAHeader_impl *v46;
  AAFieldKey v47;
  AAFieldKey v48;
  AAFieldKey v49;
  AAFieldKey v50;
  uint64_t v51;
  uint64_t v52;

  if (*(_DWORD *)(a1 + 1132))
    return 0xFFFFFFFFLL;
  v51 = 0;
  v52 = 0;
  v10 = *(_QWORD *)(a1 + 1136);
  v11 = *(_QWORD *)(a1 + 1144);
  if (v11 < v10)
  {
    v12 = "invalid state";
    v13 = 193;
    goto LABEL_66;
  }
  if ((decodeStreamDiscard(a1, v11 - v10) & 0x80000000) != 0)
  {
    v12 = "truncated archive";
    v13 = 194;
    goto LABEL_66;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    if (*(_DWORD *)(a1 + 1128))
      goto LABEL_85;
    if ((decodeStreamRefillBuffer(a1) & 0x80000000) != 0)
    {
      v12 = "refill buffer";
      v13 = 199;
      goto LABEL_66;
    }
    if (!*(_QWORD *)(a1 + 32))
    {
LABEL_85:
      if (*(_DWORD *)(a1 + 1128))
        return 0;
    }
  }
  v18 = *(_QWORD *)(a1 + 1136);
  *(_BYTE *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  if ((decodeStreamLoadHeader((_QWORD *)a1, 6uLL, v14, v15, v16, v17, a7, a8) & 0x80000000) != 0)
  {
    v12 = "truncated stream";
    v13 = 209;
    goto LABEL_66;
  }
  v24 = *(_DWORD *)(a1 + 56);
  if (v24 < 0)
  {
    v25 = *(int **)(a1 + 64);
    if (*v25 == 825246017 || *v25 == 826360153)
    {
      *(_DWORD *)(a1 + 56) = 0;
LABEL_32:
      v30 = loadAndDecodeHeader_AA(a1, v19, v20, v21, v22, v23, a7, a8);
      goto LABEL_39;
    }
    if (*v25 == 925906736 && *((_WORD *)v25 + 2) == 12592)
    {
      v31 = 1;
    }
    else
    {
      v27 = *v25;
      v28 = *((unsigned __int16 *)v25 + 2);
      if (v27 != 925906736 || v28 != 14128)
      {
        v12 = "Invalid/non-supported archive stream";
        v13 = 226;
        goto LABEL_66;
      }
      v31 = 2;
    }
    *(_DWORD *)(a1 + 56) = v31;
    goto LABEL_38;
  }
  if ((v24 - 1) < 2)
  {
LABEL_38:
    v30 = loadAndDecodeHeader_Cpio((uint64_t *)a1, (unint64_t *)&v52);
    goto LABEL_39;
  }
  if (v24 != 3)
  {
    if (v24)
    {
      v12 = "Invalid archive stream";
      v13 = 240;
      goto LABEL_66;
    }
    goto LABEL_32;
  }
  v30 = loadAndDecodeHeader_Ustar(a1, (uint64_t *)&v52);
LABEL_39:
  if (v30 < 0)
  {
    v12 = "parsing entry header";
    v13 = 242;
    goto LABEL_66;
  }
  if (v30)
    return 0;
  v33 = *(_QWORD *)(a1 + 72);
  v34 = *(AAHeader_impl **)(a1 + 88);
  v35.ikey = 5265748;
  KeyIndex = AAHeaderGetKeyIndex(v34, v35);
  if ((KeyIndex & 0x80000000) != 0
    || ((FieldUInt = AAHeaderGetFieldUInt(v34, KeyIndex, &v51), FieldUInt <= 1) ? (v38 = 1) : (v38 = FieldUInt), v38 <= 0))
  {
    v12 = "Invalid entry: no TYP field";
    v13 = 249;
    goto LABEL_66;
  }
  if (v51 != 77)
  {
    v39 = *(AAHeader_impl **)(a1 + 88);
    v40.ikey = 5521744;
    v41 = AAHeaderGetKeyIndex(v39, v40);
    if ((v41 & 0x80000000) == 0)
    {
      FieldString = AAHeaderGetFieldString(v39, v41, 0x400uLL, (char *)(a1 + 104), 0);
      v43 = FieldString <= 1 ? 1 : FieldString;
      if (v43 >= 1)
      {
        v44 = strlen((const char *)(a1 + 104));
        if (!pathIsValid((_BYTE *)(a1 + 104), v44))
        {
          v12 = "Invalid entry path";
          v13 = 255;
          goto LABEL_66;
        }
      }
    }
  }
  v45 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 16);
  if (v45 && *(_BYTE *)(a1 + 104) && (v45(*(_QWORD *)(a1 + 24), 60, a1 + 104, 0) & 0x80000000) != 0)
  {
    v12 = "callback cancel";
    v13 = 262;
    goto LABEL_66;
  }
  if ((aaHeaderBlobArrayInitWithHeader(a1 + 1152, *(AAHeader_impl **)(a1 + 88)) & 0x80000000) != 0)
  {
    v12 = "initializing blob array";
    v13 = 266;
    goto LABEL_66;
  }
  *(_DWORD *)(a1 + 1168) = 0;
  if (!*(_DWORD *)(a1 + 56))
    v52 = aaHeaderBlobArrayPayloadSize((unsigned int *)(a1 + 1152));
  if (!a2)
  {
LABEL_77:
    ++*(_QWORD *)(a1 + 1200);
    *(_QWORD *)(a1 + 1144) = v33 + v18 + v52;
    return 1;
  }
  v46 = *a2;
  if (*a2)
  {
    if (AAHeaderAssign(*a2, *(AAHeader *)(a1 + 88)) < 0)
    {
      v12 = "header init";
      v13 = 286;
      goto LABEL_66;
    }
  }
  else
  {
    v46 = AAHeaderClone(*(AAHeader *)(a1 + 88));
    if (!v46)
    {
      v12 = "header init";
      v13 = 282;
      goto LABEL_66;
    }
  }
  if ((*(_BYTE *)(a1 + 1) & 1) == 0
    || (v47.ikey = 5784649, (AAHeaderGetKeyIndex(v46, v47) & 0x80000000) == 0)
    || (v48.ikey = 5915721, (AAHeaderGetKeyIndex(v46, v48) & 0x80000000) == 0)
    || (v49.ikey = 5784649, (AAHeaderSetFieldUInt(v46, 0xFFFFFFFF, v49, v18) & 0x80000000) == 0)
    && (v50.ikey = 5915721, (AAHeaderSetFieldUInt(v46, 0xFFFFFFFF, v50, v52 + v33) & 0x80000000) == 0))
  {
    *a2 = v46;
    goto LABEL_77;
  }
  v12 = "inserting IDX,IDZ fields";
  v13 = 295;
LABEL_66:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamReadHeader", v13, 61, 0, v12, a7, a8, v51);
  if (!*(_DWORD *)(a1 + 1132))
  {
    *(_DWORD *)(a1 + 1132) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 8));
  }
  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamReadBlob(uint64_t a1, int a2, char *__dst, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  const char *v17;
  __int16 v18;
  BOOL v20;
  size_t v21;
  uint64_t (*v22)(_QWORD, uint64_t, uint64_t, _QWORD *);
  size_t v23;
  char v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v9 = *(_DWORD *)(a1 + 1168);
    if (v9 >= *(_DWORD *)(a1 + 1152))
      goto LABEL_7;
    while (1)
    {
      v13 = *(_QWORD *)(a1 + 1160);
      v14 = v13 + 24 * v9;
      v16 = (_QWORD *)(v14 + 8);
      v15 = *(_QWORD *)(v14 + 8);
      if (((*(_DWORD *)v14 ^ a2) & 0xFFFFFF) == 0)
      {
        if (v15)
          break;
      }
      if ((decodeStreamDiscard(a1, v15) & 0x80000000) != 0)
      {
        v17 = "reading blob data";
        v18 = 321;
        goto LABEL_9;
      }
      *v16 = 0;
      v9 = *(_DWORD *)(a1 + 1168) + 1;
      *(_DWORD *)(a1 + 1168) = v9;
      if (v9 >= *(_DWORD *)(a1 + 1152))
        goto LABEL_7;
    }
    if (v15 < a4)
    {
LABEL_7:
      v17 = "invalid read blob request";
      v18 = 326;
    }
    else if ((decodeStreamReadData(a1, __dst, a4) & 0x80000000) != 0)
    {
      v17 = "read error";
      v18 = 329;
    }
    else
    {
      v21 = *v16 - a4;
      v20 = *v16 == a4;
      *v16 = v21;
      if (v20)
        ++*(_DWORD *)(a1 + 1168);
      v22 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD *))(a1 + 16);
      if (!v22)
        return 0;
      if (!*(_BYTE *)(a1 + 104))
        return 0;
      if ((*(_DWORD *)v14 & 0xFFFFFF) != 0x544144)
        return 0;
      v23 = *(_QWORD *)(v13 + 24 * v9 + 16) - v21;
      v25[0] = *(_QWORD *)(v13 + 24 * v9 + 16);
      v25[1] = v23;
      if ((v22(*(_QWORD *)(a1 + 24), 60, a1 + 104, v25) & 0x80000000) == 0)
        return 0;
      v17 = "callback cancel";
      v18 = 342;
    }
LABEL_9:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c", (uint64_t)"decodeStreamReadBlob", v18, 61, 0, v17, a7, a8, v24);
    return 0xFFFFFFFFLL;
  }
  return 0;
}

void decodeStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 1132))
  {
    *(_DWORD *)(a1 + 1132) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 8));
  }
}

uint64_t decodeStreamClose(char *a1)
{
  void *v2;
  double v3;
  FILE **v4;

  if (a1)
  {
    v2 = a1 + 32;
    free(*((void **)a1 + 6));
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(*((void **)a1 + 8));
    free(*((void **)a1 + 149));
    free(*((void **)a1 + 145));
    memset_s(a1 + 1152, 0x10uLL, 0, 0x10uLL);
    AAHeaderDestroy(*((AAHeader *)a1 + 11));
    AAHeaderDestroy(*((AAHeader *)a1 + 12));
    if (*(_QWORD *)a1 >> 62)
    {
      v3 = getRealTime() - *((double *)a1 + 151);
      v4 = (FILE **)MEMORY[0x24BDAC8D8];
      fwrite("Decode archive\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      fprintf(*v4, "%12llu entries in archive\n", *((_QWORD *)a1 + 150));
      fprintf(*v4, "%12llu bytes in archive (uncompressed)\n", *((_QWORD *)a1 + 142));
      fprintf(*v4, "%12.0f MB/s\n", (double)*((unint64_t *)a1 + 142) * 0.000000953674316 / v3);
      fprintf(*v4, "%12.2f decoding time (s)\n", v3);
    }
    free(a1);
  }
  return 0;
}

uint64_t aaByteStreamSimulate(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))a1[11];
  if (v1)
    return v1(*a1);
  else
    return -1;
}

uint64_t aaByteStreamPCWriteProc(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))a1[3];
  if (v1)
    return v1(*a1);
  else
    return -1;
}

ssize_t AAByteStreamWrite(AAByteStream s, const void *buf, size_t nbyte)
{
  uint64_t (*v3)(_QWORD, const void *, size_t);

  v3 = (uint64_t (*)(_QWORD, const void *, size_t))*((_QWORD *)s + 3);
  if (v3)
    return v3(*(_QWORD *)s, buf, nbyte);
  else
    return -1;
}

uint64_t aaFileStreamGetFD(unsigned int **a1)
{
  uint64_t (*v1)(int *);

  v1 = (uint64_t (*)(int *))a1[1];
  if (v1 == aaFileStreamClose || (char *)v1 == (char *)aaTempFileStreamClose)
    return **a1;
  else
    return 0xFFFFFFFFLL;
}

uint64_t aaFileStreamClose(int *a1)
{
  int v2;

  if (a1)
  {
    if (a1[1])
    {
      v2 = *a1;
      if ((v2 & 0x80000000) == 0)
        close(v2);
    }
    free(a1);
  }
  return 0;
}

uint64_t aaTempFileStreamClose(char *a1)
{
  int v2;

  if (a1)
  {
    v2 = *(_DWORD *)a1;
    if ((v2 & 0x80000000) == 0)
    {
      close(v2);
      unlink(a1 + 12);
    }
    free(a1);
  }
  return 0;
}

ssize_t AAByteStreamPWrite(AAByteStream s, const void *buf, size_t nbyte, off_t offset)
{
  uint64_t (*v4)(_QWORD, const void *, size_t, off_t);

  v4 = (uint64_t (*)(_QWORD, const void *, size_t, off_t))*((_QWORD *)s + 5);
  if (v4)
    return v4(*(_QWORD *)s, buf, nbyte, offset);
  else
    return -1;
}

ssize_t AAByteStreamRead(AAByteStream s, void *buf, size_t nbyte)
{
  uint64_t (*v3)(_QWORD, void *, size_t);

  v3 = (uint64_t (*)(_QWORD, void *, size_t))*((_QWORD *)s + 2);
  if (v3)
    return v3(*(_QWORD *)s, buf, nbyte);
  else
    return -1;
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  uint64_t (*v4)(_QWORD, void *, size_t, off_t);

  v4 = (uint64_t (*)(_QWORD, void *, size_t, off_t))*((_QWORD *)s + 4);
  if (v4)
    return v4(*(_QWORD *)s, buf, nbyte, offset);
  else
    return -1;
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  uint64_t (*v3)(_QWORD, off_t, _QWORD);

  v3 = (uint64_t (*)(_QWORD, off_t, _QWORD))*((_QWORD *)s + 6);
  if (v3)
    return v3(*(_QWORD *)s, offset, *(_QWORD *)&whence);
  else
    return -1;
}

void AAByteStreamCancel(AAByteStream s)
{
  void (*v1)(_QWORD);

  v1 = (void (*)(_QWORD))*((_QWORD *)s + 7);
  if (v1)
    v1(*(_QWORD *)s);
}

int AAByteStreamClose(AAByteStream s)
{
  int v2;

  if (!s)
    return 0;
  if (*(_QWORD *)s)
    v2 = (*((uint64_t (**)(void))s + 1))();
  else
    v2 = 0;
  free(s);
  return v2;
}

uint64_t AAByteStreamCloseWithState(uint64_t (**a1)(void))
{
  uint64_t (*v2)(void);
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    v2 = a1[12];
    v3 = *a1;
    if (v2)
    {
      if (v3)
      {
        v4 = v2();
LABEL_8:
        v5 = v4;
LABEL_10:
        free(a1);
        return v5;
      }
    }
    else if (v3)
    {
      v4 = a1[1]();
      goto LABEL_8;
    }
    v5 = 0;
    goto LABEL_10;
  }
  return 0;
}

uint64_t AAByteStreamFlush(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))a1[9];
  if (v1)
    return v1(*a1);
  else
    return 0xFFFFFFFFLL;
}

uint64_t AAByteStreamTruncate(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))a1[8];
  if (v1)
    return v1(*a1);
  else
    return 0xFFFFFFFFLL;
}

uint64_t AAByteStreamPReadAsync(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))a1[10];
  if (v1)
    return v1(*a1);
  else
    return 0xFFFFFFFFLL;
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  _QWORD *v4;
  _DWORD *v5;
  void *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v4 = calloc(1uLL, 0x68uLL);
  v5 = malloc(0xCuLL);
  v6 = v5;
  if (v5 && v4)
  {
    *v5 = fd;
    v5[1] = automatic_close;
    v5[2] = 0;
    *v4 = v5;
    v4[1] = aaFileStreamClose;
    v4[2] = aaFileStreamRead;
    v4[3] = aaFileStreamWrite;
    v4[4] = aaFileStreamPRead;
    v4[5] = aaFileStreamPWrite;
    v4[6] = aaFileStreamSeek;
    v4[7] = aaFileStreamAbort;
    v4[8] = aaFileStreamTruncate;
    v4[9] = aaFileStreamFlush;
  }
  else
  {
    v7 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AAFileStreamOpenWithFD", 402, 17, *v7, "malloc", v8, v9, v11);
    free(v4);
    free(v6);
    return 0;
  }
  return (AAByteStream)v4;
}

uint64_t aaFileStreamRead(int *a1, void *a2, size_t a3)
{
  ssize_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1[2])
    return -1;
  v3 = read(*a1, a2, a3);
  if (v3 < 0)
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamRead", 92, 17, "aaFileStreamRead err=%zd buf=%p n=%zu", v4, v5, v6, v3);
  return v3;
}

uint64_t aaFileStreamWrite(int *a1, const void *a2, size_t a3)
{
  ssize_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1[2])
    return -1;
  v3 = write(*a1, a2, a3);
  if (v3 < 0)
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamWrite", 104, 17, "aaFileStreamWrite err=%zd buf=%p n=%zu", v4, v5, v6, v3);
  return v3;
}

uint64_t aaFileStreamPRead(int *a1, void *a2, size_t a3, off_t a4)
{
  ssize_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1[2])
    return -1;
  v4 = pread(*a1, a2, a3, a4);
  if (v4 < 0)
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamPRead", 116, 17, "aaFileStreamPRead err=%zd buf=%p n=%zu off=%llu", v5, v6, v7, v4);
  return v4;
}

uint64_t aaFileStreamPWrite(int *a1, const void *a2, size_t a3, off_t a4)
{
  ssize_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1[2])
    return -1;
  v4 = pwrite(*a1, a2, a3, a4);
  if (v4 < 0)
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamPWrite", 128, 17, "aaFileStreamPWrite err=%zd buf=%p n=%zu off=%llu", v5, v6, v7, v4);
  return v4;
}

uint64_t aaFileStreamAbort(uint64_t result)
{
  *(_DWORD *)(result + 8) = 1;
  return result;
}

off_t aaFileStreamSeek(int *a1, off_t a2, int a3)
{
  if (a1[2])
    return -1;
  else
    return lseek(*a1, a2, a3);
}

uint64_t aaFileStreamTruncate(int *a1, off_t a2)
{
  if (a1[2])
    return 0xFFFFFFFFLL;
  else
    return ftruncate(*a1, a2);
}

uint64_t aaFileStreamFlush(int *a1)
{
  uint64_t result;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  char vars0;

  if (!a1[2])
  {
    result = fsync(*a1);
    if (!(_DWORD)result)
      return result;
    v2 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"aaFileStreamFlush", 151, 17, *v2, "fsync", v3, v4, vars0);
  }
  return 0xFFFFFFFFLL;
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  char v3;
  int v4;
  int v5;
  AAByteStream result;
  int *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (char)path;
  v4 = open(path, open_flags, open_mode);
  if (v4 < 0)
  {
    v7 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AAFileStreamOpenWithPath", 428, 17, *v7, "open: %s", v8, v9, v3);
  }
  else
  {
    v5 = v4;
    result = AAFileStreamOpenWithFD(v4, 1);
    if (result)
      return result;
    close(v5);
  }
  return 0;
}

AAByteStream AATempFileStreamOpen(void)
{
  return (AAByteStream)AATempFileStreamOpenWithDirectory(0);
}

_QWORD *AATempFileStreamOpenWithDirectory(const char *a1)
{
  _QWORD *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  __int16 v8;
  int v9;
  int v10;
  char v12;
  stat v13;

  v2 = calloc(1uLL, 0x68uLL);
  v3 = (char *)malloc(0x40CuLL);
  v4 = v3;
  if (!v2 || !v3)
  {
    v9 = *__error();
    v7 = "malloc";
    v8 = 447;
LABEL_16:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AATempFileStreamOpenWithDirectory", v8, 17, v9, v7, v5, v6, v12);
    free(v2);
    free(v4);
    return 0;
  }
  memset_s(v3, 0x40CuLL, 0, 0x40CuLL);
  if (a1)
  {
    memset(&v13, 0, sizeof(v13));
    if (!realpath_DARWIN_EXTSN(a1, v4 + 12) || stat(v4 + 12, &v13) || (v13.st_mode & 0xF000) != 0x4000)
    {
      v12 = (char)a1;
      v7 = "invalid temp_dir: %s";
      v8 = 457;
LABEL_15:
      v9 = 0;
      goto LABEL_16;
    }
  }
  else if ((getTempDir(v4 + 12, 0x400uLL) & 0x80000000) != 0)
  {
    v7 = "get temp dir";
    v8 = 462;
    goto LABEL_15;
  }
  if ((unint64_t)__strlcat_chk() >= 0x400)
  {
    v12 = (_BYTE)v4 + 12;
    v7 = "Invalid temp dir path: %s";
    v8 = 464;
    goto LABEL_15;
  }
  v10 = mkostemp(v4 + 12, 0x1000000);
  *(_DWORD *)v4 = v10;
  if (v10 < 0)
  {
    v9 = *__error();
    v7 = "mkostemp";
    v8 = 466;
    goto LABEL_16;
  }
  *v2 = v4;
  v2[1] = aaTempFileStreamClose;
  v2[2] = aaFileStreamRead;
  v2[3] = aaFileStreamWrite;
  v2[4] = aaFileStreamPRead;
  v2[5] = aaFileStreamPWrite;
  v2[6] = aaFileStreamSeek;
  v2[7] = aaFileStreamAbort;
  v2[8] = aaFileStreamTruncate;
  v2[9] = aaFileStreamFlush;
  return v2;
}

int AASharedBufferPipeOpen(AAByteStream *ostream, AAByteStream *istream, size_t buffer_capacity)
{
  AAByteStream_impl *v6;
  AAByteStream_impl *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AAByteStream_impl *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int result;
  int v21;
  const char *v22;
  __int16 v23;
  char v24;

  v6 = (AAByteStream_impl *)calloc(1uLL, 0x68uLL);
  v7 = (AAByteStream_impl *)calloc(1uLL, 0x68uLL);
  v15 = v7;
  if (v6 && v7)
  {
    v16 = SharedBufferCreate(buffer_capacity, v8, v9, v10, v11, v12, v13, v14);
    if (v16)
    {
      v19 = v16;
      result = 0;
      *(_QWORD *)v15 = v19;
      *((_QWORD *)v15 + 1) = aaSharedBufferOStreamClose;
      *((_QWORD *)v15 + 3) = aaSharedBufferWrite;
      *(_QWORD *)v6 = v19;
      *((_QWORD *)v6 + 1) = aaSharedBufferIStreamClose;
      *((_QWORD *)v6 + 2) = aaSharedBufferRead;
      *((_QWORD *)v15 + 7) = SharedBufferAbort;
      *((_QWORD *)v6 + 7) = SharedBufferAbort;
      *ostream = v15;
      *istream = v6;
      return result;
    }
    v22 = "SharedBufferCreate";
    v23 = 503;
    v21 = 0;
  }
  else
  {
    v21 = *__error();
    v22 = "malloc";
    v23 = 499;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AASharedBufferPipeOpen", v23, 17, v21, v22, v17, v18, v24);
  free(v6);
  free(v15);
  SharedBufferDestroy(0);
  return -1;
}

uint64_t aaSharedBufferOStreamClose(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SharedBufferWrite(a1, 0, 0, a4, a5, a6, a7, a8);
  if (SharedBufferDecRefCount((uint64_t)a1))
    SharedBufferDestroy((uint64_t)a1);
  return 0;
}

uint64_t aaSharedBufferIStreamClose(uint64_t a1)
{
  if (SharedBufferDecRefCount(a1))
    SharedBufferDestroy(a1);
  return 0;
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)aaSequentialDecompressionIStreamOpen((uint64_t)compressed_stream, n_threads);
}

_QWORD *AAMagicInputStreamOpen(_QWORD *a1, size_t a2, void *a3, size_t *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t (*v17)(_QWORD, void *, size_t);
  size_t v18;
  size_t v19;
  char v21;

  v8 = calloc(1uLL, 0x68uLL);
  v9 = malloc(0x18uLL);
  v10 = v9;
  if (!v8 || !v9)
  {
    v11 = *__error();
    v14 = "malloc";
    v15 = 552;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AAMagicInputStreamOpen", v15, 17, v11, v14, v12, v13, v21);
    free(v8);
    free(v10);
    return 0;
  }
  memset_s(v9, 0x18uLL, 0, 0x18uLL);
  *v10 = a1;
  if (a2 >= 0x2000000001)
  {
    *__error() = 12;
    v10[2] = 0;
LABEL_10:
    v11 = *__error();
    v14 = "malloc";
    v15 = 558;
    goto LABEL_11;
  }
  v16 = malloc(a2);
  v10[2] = v16;
  if (!v16)
    goto LABEL_10;
  v17 = (uint64_t (*)(_QWORD, void *, size_t))a1[2];
  if (!v17 || (v18 = v17(*a1, v16, a2), (v18 & 0x8000000000000000) != 0))
  {
    v14 = "reading magic bytes\n";
    v15 = 562;
    v11 = 0;
    goto LABEL_11;
  }
  v19 = v18;
  v10[1] = v18;
  memcpy(a3, (const void *)v10[2], v18);
  *a4 = v19;
  *v8 = v10;
  v8[1] = aaMagicStreamClose;
  v8[2] = aaMagicStreamRead;
  v8[7] = aaMagicStreamAbort;
  return v8;
}

uint64_t aaMagicStreamClose(void **a1)
{
  free(a1[2]);
  free(a1);
  return 0;
}

uint64_t aaMagicStreamRead(_QWORD **a1, char *__dst, size_t a3)
{
  size_t v3;
  char *v4;
  _QWORD *v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t (*v11)(_QWORD, char *, size_t);
  uint64_t v12;
  uint64_t (*v13)(_QWORD, char *, size_t);

  v3 = a3;
  v4 = __dst;
  v6 = a1[1];
  if (v6)
  {
    v7 = 0;
    if (!a3)
      return v7;
    do
    {
      if ((unint64_t)v6 >= v3)
        v8 = v3;
      else
        v8 = (size_t)v6;
      memcpy(v4, a1[2], v8);
      v9 = a1[1];
      if ((unint64_t)v9 > v8)
      {
        memmove(a1[2], (char *)a1[2] + v8, (size_t)v9 - v8);
        v9 = a1[1];
      }
      v4 += v8;
      v3 -= v8;
      v7 += v8;
      v6 = (_QWORD *)((char *)v9 - v8);
      a1[1] = v6;
      if (v6)
        v10 = v3 == 0;
      else
        v10 = 1;
    }
    while (!v10);
    if (!v3)
      return v7;
    v11 = (uint64_t (*)(_QWORD, char *, size_t))(*a1)[2];
    if (v11)
    {
      v12 = v11(**a1, v4, v3);
      if (v12 < 0)
        return v12;
      v7 += v12;
      return v7;
    }
  }
  else
  {
    v13 = (uint64_t (*)(_QWORD, char *, size_t))(*a1)[2];
    if (v13)
      return v13(**a1, __dst, a3);
  }
  return -1;
}

_QWORD **aaMagicStreamAbort(_QWORD **result)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))(*result)[7];
  if (v1)
    return (_QWORD **)v1(**result);
  return result;
}

_QWORD *AATeeOutputStreamOpen(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v4 = calloc(1uLL, 0x68uLL);
  v5 = malloc(0x10uLL);
  v6 = v5;
  if (v5 && (memset_s(v5, 0x10uLL, 0, 0x10uLL), v4))
  {
    *v6 = a1;
    v6[1] = a2;
    *v4 = v6;
    v4[1] = aaTeeStreamClose;
    v4[3] = aaTeeStreamWrite;
    v4[5] = aaTeeStreamPWrite;
    v4[7] = aaTeeStreamAbort;
  }
  else
  {
    v7 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AATeeOutputStreamOpen", 591, 17, *v7, "malloc", v8, v9, v11);
    free(v4);
    free(v6);
    return 0;
  }
  return v4;
}

uint64_t aaTeeStreamClose(void *a1)
{
  free(a1);
  return 0;
}

uint64_t aaTeeStreamWrite(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2;
  v6 = *a1;
  if (*(_QWORD *)(*a1 + 24))
  {
    v7 = 0;
    if (!a3)
    {
      if (*(_QWORD *)(a1[1] + 24))
        v11 = 0;
      else
        v11 = -1;
      goto LABEL_20;
    }
    v8 = a2;
    v9 = a3;
    while (1)
    {
      v10 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v6 + 24))(*(_QWORD *)v6, v8, v9);
      if (v10 < 1)
        break;
      v8 += v10;
      v7 += v10;
      v9 -= v10;
      if (!v9)
        goto LABEL_12;
    }
    v7 = v10;
  }
  else
  {
    v7 = -1;
  }
LABEL_12:
  v12 = a1[1];
  if (*(_QWORD *)(v12 + 24))
  {
    v11 = 0;
    if (a3)
    {
      v13 = a3;
      while (1)
      {
        v14 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v12 + 24))(*(_QWORD *)v12, v4, v13);
        if (v14 < 1)
          break;
        v4 += v14;
        v11 += v14;
        v13 -= v14;
        if (!v13)
          goto LABEL_20;
      }
      v11 = v14;
    }
  }
  else
  {
    v11 = -1;
  }
LABEL_20:
  if (v11 == a3 && v7 == a3)
    return a3;
  else
    return -1;
}

uint64_t aaTeeStreamPWrite(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  v6 = a2;
  v8 = *a1;
  if (*(_QWORD *)(*a1 + 40))
  {
    v9 = 0;
    if (!a3)
    {
      if (*(_QWORD *)(a1[1] + 40))
        v14 = 0;
      else
        v14 = -1;
      goto LABEL_20;
    }
    v10 = a2;
    v11 = a4;
    v12 = a3;
    while (1)
    {
      v13 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v8 + 40))(*(_QWORD *)v8, v10, v12, v11);
      if (v13 < 1)
        break;
      v10 += v13;
      v9 += v13;
      v11 += v13;
      v12 -= v13;
      if (!v12)
        goto LABEL_12;
    }
    v9 = v13;
  }
  else
  {
    v9 = -1;
  }
LABEL_12:
  v15 = a1[1];
  if (*(_QWORD *)(v15 + 40))
  {
    v14 = 0;
    if (a3)
    {
      v16 = a3;
      while (1)
      {
        v17 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v15 + 40))(*(_QWORD *)v15, v6, v16, v4);
        if (v17 < 1)
          break;
        v6 += v17;
        v14 += v17;
        v4 += v17;
        v16 -= v17;
        if (!v16)
          goto LABEL_20;
      }
      v14 = v17;
    }
  }
  else
  {
    v14 = -1;
  }
LABEL_20:
  if (v14 == a3 && v9 == a3)
    return a3;
  else
    return -1;
}

_QWORD **aaTeeStreamAbort(_QWORD **result)
{
  _QWORD **v1;
  uint64_t (*v2)(_QWORD);
  _QWORD *v3;
  uint64_t (*v4)(_QWORD);

  v1 = result;
  v2 = (uint64_t (*)(_QWORD))(*result)[7];
  if (v2)
    result = (_QWORD **)v2(**result);
  v3 = v1[1];
  v4 = (uint64_t (*)(_QWORD))v3[7];
  if (v4)
    return (_QWORD **)v4(*v3);
  return result;
}

AAByteStream AACustomByteStreamOpen(void)
{
  AAByteStream_impl *v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = (AAByteStream_impl *)calloc(1uLL, 0x68uLL);
  if (!v0)
  {
    v1 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c", (uint64_t)"AACustomByteStreamOpen", 619, 17, *v1, "malloc", v2, v3, v5);
  }
  return v0;
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
  *(_QWORD *)s = data;
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
  *((_QWORD *)s + 1) = proc;
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
  *((_QWORD *)s + 2) = proc;
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
  *((_QWORD *)s + 4) = proc;
}

void AACustomByteStreamSetWriteProc(AAByteStream s, AAByteStreamWriteProc proc)
{
  *((_QWORD *)s + 3) = proc;
}

void AACustomByteStreamSetPWriteProc(AAByteStream s, AAByteStreamPWriteProc proc)
{
  *((_QWORD *)s + 5) = proc;
}

void AACustomByteStreamSetSeekProc(AAByteStream s, AAByteStreamSeekProc proc)
{
  *((_QWORD *)s + 6) = proc;
}

void AACustomByteStreamSetCancelProc(AAByteStream s, AAByteStreamCancelProc proc)
{
  *((_QWORD *)s + 7) = proc;
}

AAByteStream_impl *AAAFSCStreamOpen(int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  AAByteStream_impl *v11;
  const char *v12;
  __int16 v13;
  char v15;

  v11 = (AAByteStream_impl *)afscStreamOpen(a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v11)
  {
    v12 = "alloc stream";
    v13 = 1041;
    goto LABEL_5;
  }
  if ((stripAFSC(a1) & 0x80000000) != 0)
  {
    v12 = "clearing file";
    v13 = 1043;
LABEL_5:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpen", v13, 55, 0, v12, v9, v10, v15);
    AAByteStreamClose(v11);
    return 0;
  }
  return v11;
}

_QWORD *afscStreamOpen(int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  __int16 v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  compression_algorithm v36;
  size_t v37;
  void *v38;
  size_t v39;
  _QWORD *v40;
  size_t v41;
  void *v42;
  void *v43;
  size_t v44;
  size_t v45;
  void *v46;
  unsigned __int8 v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;

  if (!a2 || a2 >= 4194304001)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamOpen", 959, 55, 0, "invalid uncompressed size", a7, a8, v51);
    goto LABEL_7;
  }
  if (a3 < 0xF && ((0x7F99u >> a3) & 1) != 0)
  {
    v22 = dword_20A40C1CC[a3];
    v17 = calloc(1uLL, 0x68uLL);
    v23 = malloc(0x80uLL);
    v18 = (uint64_t)v23;
    if (v23 && (memset_s(v23, 0x80uLL, 0, 0x80uLL), v17))
    {
      *(_DWORD *)v18 = a1;
      *(_QWORD *)(v18 + 8) = a4;
      *(_QWORD *)(v18 + 16) = a2;
      *(_DWORD *)(v18 + 32) = v22;
      if ((unint64_t)(a2 + 0xFFFF) >> 48)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"chunkCount", 128, 55, 0, "invalid uncompressed size", v24, v25, v51);
        v26 = 0;
        *(_DWORD *)(v18 + 44) = -1;
      }
      else
      {
        v32 = (unint64_t)(a2 + 0xFFFF) >> 16;
        *(_DWORD *)(v18 + 44) = v32;
        v26 = v32 + 1;
      }
      v33 = calloc(v26, 4uLL);
      *(_QWORD *)(v18 + 48) = v33;
      if (v33)
      {
        v36 = 1285;
        switch(v22)
        {
          case 4:
            goto LABEL_24;
          case 7:
          case 8:
            v36 = 2304;
            goto LABEL_24;
          case 10:
            goto LABEL_28;
          case 11:
          case 12:
            v36 = COMPRESSION_LZFSE;
            goto LABEL_24;
          case 13:
          case 14:
            v36 = COMPRESSION_LZBITMAP;
            goto LABEL_24;
          default:
            v36 = -1;
LABEL_24:
            v37 = compression_encode_scratch_buffer_size(v36);
            if (!v37)
              goto LABEL_28;
            if (v37 >= 0x2000000001)
            {
              *__error() = 12;
              *(_QWORD *)(v18 + 56) = 0;
LABEL_50:
              v27 = *__error();
              v30 = "malloc";
              v31 = 1002;
              break;
            }
            v38 = malloc(v37);
            *(_QWORD *)(v18 + 56) = v38;
            if (!v38)
              goto LABEL_50;
LABEL_28:
            v39 = *(_QWORD *)(v18 + 72);
            if (v39 >> 16)
              goto LABEL_38;
            v40 = (_QWORD *)(v18 + 64);
            do
            {
              v41 = (v39 >> 1) + v39;
              if (((v39 >> 1) & v39) != 0)
                v41 = ((v39 >> 1) & v39) + v39;
              if (v39)
                v39 = v41;
              else
                v39 = 0x4000;
            }
            while (v39 < 0x10000);
            v42 = *(void **)(v18 + 80);
            v43 = realloc(v42, v39);
            if (!v43)
              goto LABEL_51;
            *(_QWORD *)(v18 + 72) = v39;
            *(_QWORD *)(v18 + 80) = v43;
LABEL_38:
            v44 = *(_QWORD *)(v18 + 96);
            if (v44 >= 0x80008)
              goto LABEL_48;
            v40 = (_QWORD *)(v18 + 88);
            do
            {
              v45 = (v44 >> 1) + v44;
              if (((v44 >> 1) & v44) != 0)
                v45 = ((v44 >> 1) & v44) + v44;
              if (v44)
                v44 = v45;
              else
                v44 = 0x4000;
            }
            while (v44 < 0x80008);
            v42 = *(void **)(v18 + 104);
            v46 = realloc(v42, v44);
            if (v46)
            {
              *(_QWORD *)(v18 + 96) = v44;
              *(_QWORD *)(v18 + 104) = v46;
LABEL_48:
              if ((v22 - 3) > 0xB)
                v47 = 0;
              else
                v47 = byte_20A40C208[v22 - 3];
              *(_BYTE *)(v18 + 36) = v47;
              v48 = *(unsigned int *)(v18 + 44);
              v49 = 8 * v48 + 264;
              v50 = 4 * v48 + 4;
              if (a3 < 7)
                v50 = v49;
              if (v50 < 0xFFFFFFFF)
              {
                **(_DWORD **)(v18 + 48) = v50;
                *v17 = v18;
                v17[1] = afscStreamClose;
                v17[7] = afscStreamCancel;
                v17[3] = afscStreamWrite;
                v17[12] = afscStreamCloseWithState;
                return v17;
              }
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", v34, v35, v51);
              **(_DWORD **)(v18 + 48) = -1;
              v31 = 1010;
              v27 = 0;
              v30 = "invalid file size";
            }
            else
            {
LABEL_51:
              free(v42);
              *v40 = 0;
              v40[1] = 0;
              v40[2] = 0;
              v27 = *__error();
              v30 = "malloc";
              v31 = 1005;
            }
            break;
        }
      }
      else
      {
        v27 = *__error();
        v30 = "malloc";
        v31 = 997;
      }
    }
    else
    {
      v27 = *__error();
      v30 = "malloc";
      v31 = 988;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamOpen", v31, 55, v27, v30, v28, v29, v51);
    goto LABEL_8;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamOpen", 981, 55, 0, "invalid compression type: %d", a7, a8, a3);
LABEL_7:
  v17 = 0;
  v18 = 0;
LABEL_8:
  afscStreamClose(v18, v10, v11, v12, v13, v14, v15, v16);
  free(v17);
  return 0;
}

uint64_t stripAFSC(int a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  stat v17;

  memset(&v17, 0, sizeof(v17));
  if (fstat(a1, &v17))
  {
    v2 = *__error();
    v5 = "fstat";
    v6 = 100;
  }
  else
  {
    if ((v17.st_flags & 0x20) == 0 || (fchflags(a1, v17.st_flags & 0xFFFFFFDF) & 0x80000000) == 0)
    {
      v9 = 1;
      goto LABEL_7;
    }
    v2 = *__error();
    v5 = "fchflags UF_COMPRESSED";
    v6 = 105;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"clearUFCompressedBit", v6, 55, v2, v5, v3, v4, v17.st_dev);
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"stripAFSC", 154, 55, 0, "clearing UF_COMPRESSED", v7, v8, v17.st_dev);
  v9 = 0;
LABEL_7:
  if ((fgetxattr(a1, "com.apple.ResourceFork", 0, 0, 0, 32) & 0x8000000000000000) == 0
    && fremovexattr(a1, "com.apple.ResourceFork", 32) < 0)
  {
    v10 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"stripAFSC", 159, 55, *v10, "fremovexattr", v11, v12, v17.st_dev);
    v9 = 0;
  }
  if ((fgetxattr(a1, "com.apple.decmpfs", 0, 0, 0, 32) & 0x8000000000000000) == 0
    && fremovexattr(a1, "com.apple.decmpfs", 32) < 0)
  {
    v13 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"stripAFSC", 161, 55, *v13, "fremovexattr", v14, v15, v17.st_dev);
    v9 = 0;
  }
  if (v9)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

AAByteStream_impl *AAAFSCStreamOpenWithMetadata(int a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AAByteStream_impl *v11;
  AAByteStream_impl *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int16 v17;
  char v19;

  if (a3 > 0xE)
    goto LABEL_4;
  if (((1 << a3) & 0x2A88) != 0)
  {
    if (a4)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithMetadata", 1060, 55, 0, "invalid resource fork for type", a7, a8, v19);
      goto LABEL_7;
    }
  }
  else if (((1 << a3) & 0x5510) == 0)
  {
LABEL_4:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithMetadata", 1059, 55, 0, "invalid compression_type: %d", a7, a8, a3);
LABEL_7:
    v11 = 0;
LABEL_13:
    AAByteStreamClose(v11);
    return 0;
  }
  v12 = (AAByteStream_impl *)afscStreamOpen(a1, a2, a3, 0, a5, a6, a7, a8);
  v11 = v12;
  if (!v12)
  {
    v16 = "alloc stream";
    v17 = 1064;
    goto LABEL_12;
  }
  v15 = *(_QWORD *)v12;
  *(_DWORD *)(v15 + 112) = a3;
  *(_DWORD *)(v15 + 116) = a4;
  if ((stripAFSC(a1) & 0x80000000) != 0)
  {
    v16 = "clearing file";
    v17 = 1070;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithMetadata", v17, 55, 0, v16, v13, v14, v19);
    goto LABEL_13;
  }
  return v11;
}

AAByteStream_impl *AAAFSCStreamOpenWithState(int a1, AAByteStream_impl *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AAByteStream_impl *v17;
  uint64_t v18;
  uint64_t v19;
  AAByteStream_impl *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  size_t v36;
  void *v37;
  void *v38;
  size_t v39;
  ssize_t v40;
  size_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  size_t v47;
  void *v48;
  size_t v49;
  ssize_t v50;
  const char *v51;
  __int16 v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v55 = 0u;
  v56 = 0u;
  v54 = 0u;
  if (!*((_QWORD *)a2 + 2))
    goto LABEL_69;
  v11 = 0;
  v12 = &v54;
  v13 = 48;
  do
  {
    v14 = (*((uint64_t (**)(_QWORD, __int128 *, uint64_t))a2 + 2))(*(_QWORD *)a2, v12, v13);
    if (v14 < 0)
      goto LABEL_69;
    if (!v14)
      break;
    v12 = (__int128 *)((char *)v12 + v14);
    v11 += v14;
    v13 -= v14;
  }
  while (v13);
  if (v11 < 0)
  {
LABEL_69:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithState", 1088, 55, 0, "loading state", a7, a8, v54);
    v20 = 0;
LABEL_76:
    AAByteStreamClose(v20);
    return 0;
  }
  v17 = (AAByteStream_impl *)afscStreamOpen(a1, *((uint64_t *)&v54 + 1), DWORD2(v55), v54, v15, v16, a7, a8);
  v20 = v17;
  if (!v17)
  {
    v51 = "open AFSC stream";
    v52 = 1092;
LABEL_75:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCStreamOpenWithState", v52, 55, 0, v51, v18, v19, v54);
    goto LABEL_76;
  }
  v21 = *(_QWORD *)v17;
  *(_QWORD *)(v21 + 24) = v55;
  *(_DWORD *)(v21 + 40) = HIDWORD(v55);
  *(_QWORD *)(v21 + 112) = v56;
  if (!*((_QWORD *)a2 + 2))
    goto LABEL_74;
  v22 = *(_DWORD *)(v21 + 44);
  v23 = __CFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    v25 = 0;
    v26 = 4 * v24;
    v27 = *(_QWORD *)(v21 + 48);
    do
    {
      v28 = (*((uint64_t (**)(_QWORD, uint64_t, uint64_t))a2 + 2))(*(_QWORD *)a2, v27, v26);
      if (v28 < 0)
        goto LABEL_74;
      if (!v28)
        break;
      v27 += v28;
      v25 += v28;
      v26 -= v28;
    }
    while (v26);
    if (v25 < 0)
    {
LABEL_74:
      v51 = "loading state";
      v52 = 1103;
      goto LABEL_75;
    }
  }
  v29 = DWORD2(v56);
  if (!DWORD2(v56))
    goto LABEL_41;
  v30 = 0;
  v31 = (unint64_t *)(v21 + 64);
  v33 = *(_QWORD *)(v21 + 64);
  v32 = *(_QWORD *)(v21 + 72);
  do
  {
    if (v33 != v32)
      goto LABEL_28;
    v34 = v32 + 0x40000;
    if ((uint64_t)(v32 + 0x40000) < 0)
      goto LABEL_74;
    if (v32 > 0xFFFFFFFFFFFBFFFFLL)
    {
      v33 = v32;
LABEL_28:
      v36 = v32;
      goto LABEL_32;
    }
    do
    {
      while (!v32)
      {
        v32 = 0x4000;
        v36 = 0x4000;
        if (v34 <= 0x4000)
          goto LABEL_30;
      }
      v35 = v32 >> 1;
      if ((v32 & (v32 >> 1)) != 0)
        v35 = v32 & (v32 >> 1);
      v32 += v35;
    }
    while (v32 < v34);
    v36 = v32;
    if (v32 >= 0x2000000001)
    {
LABEL_72:
      *__error() = 12;
      goto LABEL_73;
    }
LABEL_30:
    v37 = *(void **)(v21 + 80);
    v38 = realloc(v37, v36);
    if (!v38)
    {
LABEL_71:
      free(v37);
LABEL_73:
      *v31 = 0;
      v31[1] = 0;
      v31[2] = 0;
      goto LABEL_74;
    }
    *(_QWORD *)(v21 + 72) = v36;
    *(_QWORD *)(v21 + 80) = v38;
    v33 = *(_QWORD *)(v21 + 64);
LABEL_32:
    if (v36 - v33 >= v29)
      v39 = v29;
    else
      v39 = v36 - v33;
    v40 = AAByteStreamRead(a2, (void *)(*(_QWORD *)(v21 + 80) + v33), v39);
    if (v40 < 0)
      goto LABEL_74;
    if (!v40)
      break;
    v33 = *v31 + v40;
    if (!__CFADD__(*v31, v40))
    {
      v32 = *(_QWORD *)(v21 + 72);
      if (v33 <= v32)
        continue;
    }
    goto LABEL_74;
    *v31 = v33;
    v30 += v40;
    v29 -= v40;
  }
  while (v29);
  if (v30 < 0)
    goto LABEL_74;
LABEL_41:
  v41 = HIDWORD(v56);
  if (HIDWORD(v56))
  {
    v42 = 0;
    v31 = (unint64_t *)(v21 + 88);
    v44 = *(_QWORD *)(v21 + 88);
    v43 = *(_QWORD *)(v21 + 96);
    while (1)
    {
      if (v44 == v43)
      {
        v45 = v43 + 0x40000;
        if ((uint64_t)(v43 + 0x40000) < 0)
          goto LABEL_74;
        if (v43 <= 0xFFFFFFFFFFFBFFFFLL)
        {
          do
          {
            while (!v43)
            {
              v43 = 0x4000;
              v47 = 0x4000;
              if (v45 <= 0x4000)
                goto LABEL_56;
            }
            v46 = v43 >> 1;
            if ((v43 & (v43 >> 1)) != 0)
              v46 = v43 & (v43 >> 1);
            v43 += v46;
          }
          while (v43 < v45);
          v47 = v43;
          if (v43 >= 0x2000000001)
            goto LABEL_72;
LABEL_56:
          v37 = *(void **)(v21 + 104);
          v48 = realloc(v37, v47);
          if (!v48)
            goto LABEL_71;
          *(_QWORD *)(v21 + 96) = v47;
          *(_QWORD *)(v21 + 104) = v48;
          v44 = *(_QWORD *)(v21 + 88);
          goto LABEL_58;
        }
        v44 = v43;
      }
      v47 = v43;
LABEL_58:
      if (v47 - v44 >= v41)
        v49 = v41;
      else
        v49 = v47 - v44;
      v50 = AAByteStreamRead(a2, (void *)(*(_QWORD *)(v21 + 104) + v44), v49);
      if (v50 < 0)
        goto LABEL_74;
      if (v50)
      {
        v44 = *v31 + v50;
        if (__CFADD__(*v31, v50))
          goto LABEL_74;
        v43 = *(_QWORD *)(v21 + 96);
        if (v44 > v43)
          goto LABEL_74;
        *v31 = v44;
        v42 += v50;
        v41 -= v50;
        if (v41)
          continue;
      }
      if ((v42 & 0x8000000000000000) == 0)
        break;
      goto LABEL_74;
    }
  }
  if (a3)
    *a3 = *(_QWORD *)(v21 + 24);
  return v20;
}

uint64_t AAAFSCGetMetadata(int a1, _DWORD *a2, _DWORD *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  unint64_t __s[2];
  void *v16;
  stat v17;

  memset(&v17, 0, sizeof(v17));
  __s[0] = 0;
  __s[1] = 0;
  v16 = 0;
  if (!fstat(a1, &v17))
  {
    if (statIsCompressed(v17.st_flags))
    {
      if ((loadDecmpfsXattr(a1, a2, &v14, __s) & 0x80000000) != 0)
      {
        v9 = "loading decmpfs";
        v10 = 1137;
      }
      else
      {
        if (*a2 <= 0xDu && ((1 << *a2) & 0x2A88) != 0)
        {
          v11 = 0;
LABEL_10:
          *a3 = 0;
          goto LABEL_11;
        }
        v13 = resourceForkSize(a1);
        *a3 = v13;
        if (v13 != -1)
        {
          v11 = 0;
          goto LABEL_11;
        }
        v9 = "invalid resource fork";
        v10 = 1140;
      }
      v6 = 0;
      goto LABEL_3;
    }
    v11 = 0;
    *a2 = -1;
    goto LABEL_10;
  }
  v6 = *__error();
  v9 = "fstat";
  v10 = 1123;
LABEL_3:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCGetMetadata", v10, 55, v6, v9, v7, v8, v14);
  v11 = 0xFFFFFFFFLL;
LABEL_11:
  free(v16);
  memset_s(__s, 0x18uLL, 0, 0x18uLL);
  return v11;
}

uint64_t loadDecmpfsXattr(int a1, _DWORD *a2, _QWORD *a3, unint64_t *a4)
{
  size_t v8;
  size_t v9;
  void *v10;
  char *v11;
  unint64_t v12;
  ssize_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;
  char v23;

  *a4 = 0;
  v8 = a4[1];
  if (v8 >> 16)
  {
    v12 = 0;
    v11 = (char *)a4[2];
  }
  else
  {
    do
    {
      v9 = (v8 >> 1) + v8;
      if (((v8 >> 1) & v8) != 0)
        v9 = ((v8 >> 1) & v8) + v8;
      if (v8)
        v8 = v9;
      else
        v8 = 0x4000;
    }
    while (v8 < 0x10000);
    v10 = (void *)a4[2];
    v11 = (char *)realloc(v10, v8);
    if (!v11)
    {
      free(v10);
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
      v17 = "blob reserve";
      v18 = 255;
      goto LABEL_20;
    }
    a4[1] = v8;
    a4[2] = (unint64_t)v11;
    v12 = *a4;
  }
  v13 = fgetxattr(a1, "com.apple.decmpfs", &v11[v12], v8 - v12, 0, 32);
  if (v13 < 16 || (v16 = *a4 + v13, __CFADD__(*a4, v13)) || v16 > a4[1])
  {
    v17 = "invalid/missing decmpfs";
    v18 = 261;
LABEL_20:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"loadDecmpfsXattr", v18, 55, 0, v17, v14, v15, v23);
    return 0xFFFFFFFFLL;
  }
  *a4 = v16;
  v19 = a4[2];
  if (*(_DWORD *)v19 != 1668116582)
  {
    v17 = "Invalid decmpfs xattr";
    v18 = 263;
    goto LABEL_20;
  }
  v20 = *(_QWORD *)(v19 + 8);
  *a2 = *(_DWORD *)(v19 + 4);
  *a3 = v20;
  v21 = v16 - 16;
  if (v16 < 0x10)
  {
    v17 = "blob resize";
    v18 = 268;
    goto LABEL_20;
  }
  if (v16 != 16)
    memmove((void *)v19, (const void *)(v19 + 16), v16 - 16);
  result = 0;
  *a4 = v21;
  return result;
}

unint64_t resourceForkSize(int a1)
{
  unint64_t result;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  __int16 v5;
  char vars0;

  result = fgetxattr(a1, "com.apple.ResourceFork", 0, 0, 0, 32);
  if ((result & 0x8000000000000000) != 0)
  {
    v4 = "Missing resource fork xattr";
    v5 = 309;
  }
  else
  {
    if (!HIDWORD(result))
      return result;
    v4 = "Invalid resource fork xattr";
    v5 = 310;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkSize", v5, 55, 0, v4, v2, v3, vars0);
  return 0xFFFFFFFFLL;
}

uint64_t AAAFSCSetMetadata(int a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v11;
  __int16 v12;
  int v13;
  _BOOL4 v14;
  AAByteStream_impl *v15;
  uint64_t v16;
  unint64_t st_size;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  size_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  size_t v30;
  uint64_t v31;
  size_t v32;
  uint64_t v33;
  const char *v34;
  __int16 v35;
  char *v36;
  unint64_t v37;
  uint64_t __s;
  size_t v39;
  void *v40;
  unsigned int v41;
  int v42;
  stat v43;

  memset(&v43, 0, sizeof(v43));
  v41 = 0;
  v42 = -1;
  __s = 0;
  v39 = 0;
  v40 = 0;
  if (a2 <= 0xD && ((1 << a2) & 0x2A88) != 0)
  {
    if (a3)
    {
      v11 = "invalid resource fork size";
      v12 = 1169;
LABEL_5:
      v13 = 0;
LABEL_10:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCSetMetadata", v12, 55, v13, v11, a7, a8, (char)v36);
      v15 = 0;
LABEL_11:
      v16 = 0xFFFFFFFFLL;
      goto LABEL_12;
    }
    v14 = 0;
  }
  else
  {
    v14 = a3 != 0;
  }
  if (fstat(a1, &v43))
  {
    v13 = *__error();
    v11 = "fstat";
    v12 = 1171;
    goto LABEL_10;
  }
  st_size = v43.st_size;
  if ((AAAFSCGetMetadata(a1, &v42, &v41) & 0x80000000) != 0)
  {
    v11 = "reading current metadata";
    v12 = 1175;
    goto LABEL_5;
  }
  v21 = v42 != -1;
  v22 = v42 != a2 && v42 != -1;
  if (v42 != a2)
    v21 = 0;
  if (v41 <= a3)
    v21 = 0;
  if (v22 || v14 && v21)
  {
    if ((decompressToData(a1) & 0x80000000) != 0)
    {
      v11 = "decompression failed";
      v12 = 1188;
      goto LABEL_5;
    }
    v41 = 0;
    v42 = -1;
    if (a2 == -1)
      goto LABEL_61;
  }
  else
  {
    if (v42 == a2)
      goto LABEL_61;
    if (v42 != -1)
    {
      v11 = "invalid state";
      v12 = 1200;
      goto LABEL_5;
    }
  }
  v15 = AAAFSCStreamOpenWithMetadata(a1, st_size, a2, a3, v19, v20, a7, a8);
  if (!v15)
  {
    v34 = "open AFSC stream";
    v35 = 1202;
LABEL_75:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"AAAFSCSetMetadata", v35, 55, 0, v34, v23, v24, (char)v36);
    goto LABEL_11;
  }
  v25 = 0;
  do
  {
    v26 = (v25 >> 1) + v25;
    if (((v25 >> 1) & v25) != 0)
      v26 = ((v25 >> 1) & v25) + v25;
    if (v25)
      v25 = v26;
    else
      v25 = 0x4000;
  }
  while (v25 < 0x80000);
  v27 = (char *)malloc(v25);
  if (!v27)
  {
    __s = 0;
    v39 = 0;
    v40 = 0;
    v34 = "blob alloc";
    v35 = 1205;
    goto LABEL_75;
  }
  v28 = v27;
  v39 = v25;
  v40 = v27;
  if (st_size)
  {
    v29 = 0;
    v36 = v27;
    v37 = st_size;
    while (1)
    {
      __s = 0;
      if (v25 >= st_size - v29)
        v30 = st_size - v29;
      else
        v30 = v25;
      if (pread(a1, v28, v30, v29) != v30)
      {
LABEL_72:
        v34 = "read data";
        v35 = 1213;
        goto LABEL_75;
      }
      if (v30)
      {
        if (__CFADD__(__s, v30))
          goto LABEL_72;
        v25 = v39;
        if (__s + v30 > v39)
          goto LABEL_72;
        __s += v30;
        if (*((_QWORD *)v15 + 3))
        {
          v31 = 0;
          v32 = v30;
          while (1)
          {
            v33 = (*((uint64_t (**)(_QWORD, char *, size_t))v15 + 3))(*(_QWORD *)v15, v28, v32);
            if (v33 < 1)
              break;
            v28 += v33;
            v31 += v33;
            v32 -= v33;
            if (!v32)
              goto LABEL_57;
          }
          v31 = v33;
LABEL_57:
          v28 = v36;
          st_size = v37;
        }
        else
        {
          v31 = -1;
        }
      }
      else
      {
        v31 = *((_QWORD *)v15 + 3) ? 0 : -1;
      }
      if (v31 != v30)
        break;
      v29 += v30;
      if (v29 >= st_size)
        goto LABEL_60;
    }
    v34 = "write data";
    v35 = 1215;
    goto LABEL_75;
  }
LABEL_60:
  if (AAByteStreamClose(v15) < 0)
  {
    v11 = "AFSC stream close";
    v12 = 1222;
    goto LABEL_5;
  }
LABEL_61:
  if ((AAAFSCGetMetadata(a1, &v42, &v41) & 0x80000000) != 0)
  {
    v11 = "reading current metadata";
    v12 = 1229;
    goto LABEL_5;
  }
  if (v42 != a2 || (v16 = 0, v15 = 0, a3) && v41 != a3)
  {
    if ((resizeResourceFork(a1, a3) & 0x80000000) == 0)
    {
      v15 = 0;
      v16 = 0;
      goto LABEL_12;
    }
    v11 = "resizing resource fork";
    v12 = 1236;
    goto LABEL_5;
  }
LABEL_12:
  free(v40);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  AAByteStreamClose(v15);
  return v16;
}

uint64_t decompressToData(int a1)
{
  size_t v2;
  size_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  size_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  size_t *p_s;
  const char *v16;
  __int16 v17;
  char v18;
  compression_algorithm v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  int v24;
  void *v25;
  _DWORD *v26;
  uint64_t v27;
  uint8_t *v29;
  size_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  __int16 v34;
  ssize_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  off_t v43;
  size_t v44;
  u_int32_t *v45;
  u_int32_t v46;
  u_int32_t v47;
  size_t v48;
  char *v49;
  size_t v50;
  uint64_t v51;
  size_t v52;
  BOOL v53;
  int v54;
  const char *v55;
  __int16 v56;
  char *__src;
  unint64_t v58;
  int v59;
  size_t v60;
  unint64_t v61;
  off_t v62;
  size_t v63;
  uint8_t *value;
  uint64_t v65;
  size_t v66;
  size_t v67;
  uint64_t v68;
  int v69;
  size_t v70;
  size_t v71;
  char *v72;
  size_t __s;
  size_t v74;
  uint8_t *v75;

  v2 = 0;
  __s = 0;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  v69 = -1;
  v68 = 0;
  do
  {
    v3 = (v2 >> 1) + v2;
    if (((v2 >> 1) & v2) != 0)
      v3 = ((v2 >> 1) & v2) + v2;
    if (v2)
      v2 = v3;
    else
      v2 = 0x4000;
  }
  while (v2 <= 0x10000);
  v4 = (uint8_t *)malloc(v2);
  if (!v4)
  {
    p_s = &__s;
LABEL_22:
    *p_s = 0;
    p_s[1] = 0;
    p_s[2] = 0;
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", 448, 55, 0, "blob alloc", v5, v6, (char)__src);
    v10 = 0;
LABEL_41:
    v25 = 0;
LABEL_42:
    v26 = 0;
    goto LABEL_43;
  }
  v7 = 0;
  v74 = v2;
  v75 = v4;
  do
  {
    v8 = (v7 >> 1) + v7;
    if (((v7 >> 1) & v7) != 0)
      v8 = ((v7 >> 1) & v7) + v7;
    if (v7)
      v7 = v8;
    else
      v7 = 0x4000;
  }
  while (v7 < 0x80000);
  v9 = (char *)malloc(v7);
  if (!v9)
  {
    p_s = &v70;
    goto LABEL_22;
  }
  v10 = v9;
  v71 = v7;
  v72 = v9;
  if ((loadDecmpfsXattr(a1, &v69, &v68, &__s) & 0x80000000) != 0)
  {
    v16 = "loading decmpfs xattr";
    v17 = 451;
LABEL_39:
    v24 = 0;
LABEL_40:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", v17, 55, v24, v16, v11, v12, (char)__src);
    goto LABEL_41;
  }
  v13 = v69;
  if ((v69 - 3) > 0xB)
    v14 = 0;
  else
    v14 = byte_20A40C208[v69 - 3];
  v18 = 0;
  v19 = 1285;
  switch(v69)
  {
    case 3:
    case 4:
      break;
    case 7:
    case 8:
      v18 = 0;
      v19 = 2304;
      break;
    case 11:
    case 12:
      v18 = 0;
      v19 = COMPRESSION_LZFSE;
      break;
    case 13:
    case 14:
      v18 = 0;
      v19 = COMPRESSION_LZBITMAP;
      break;
    default:
      v19 = -1;
      v18 = 1;
      break;
  }
  v20 = v68;
  if (!v68 || (v21 = v68 + 0xFFFF, (unint64_t)(v68 + 0xFFFF) >> 48))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"chunkCount", 128, 55, 0, "invalid uncompressed size", v11, v12, (char)__src);
    goto LABEL_38;
  }
  v22 = v21 >> 16;
  if ((v21 >> 16) == -1)
  {
LABEL_38:
    v16 = "invalid uncompressed size";
    v17 = 457;
    goto LABEL_39;
  }
  if ((v18 & 1) != 0 || (v23 = compression_decode_scratch_buffer_size(v19)) == 0)
  {
    v25 = 0;
  }
  else
  {
    if (v23 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_60:
      v24 = *__error();
      v16 = "malloc";
      v17 = 463;
      goto LABEL_40;
    }
    v25 = malloc(v23);
    if (!v25)
      goto LABEL_60;
  }
  if (v13 <= 0xD && ((1 << v13) & 0x2A88) != 0)
  {
    v29 = v75;
    if (*v75 == v14)
    {
      v30 = __s - 1;
      memcpy(v10, v75 + 1, __s - 1);
    }
    else
    {
      v30 = compression_decode_buffer((uint8_t *)v10, 0x10000uLL, v75, __s, v25, v19);
    }
    if (v30 - 65537 <= 0xFFFFFFFFFFFEFFFFLL)
    {
      v33 = "invalid chunk";
      v34 = 487;
LABEL_58:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", v34, 55, 0, v33, v31, v32, (char)__src);
      goto LABEL_42;
    }
    v70 = v30;
    v35 = pwrite(a1, v29, v30, 0);
    v26 = 0;
    if (v35 != v30)
    {
      v33 = "writing chunk";
      v34 = 490;
      goto LABEL_58;
    }
LABEL_54:
    if (fremovexattr(a1, "com.apple.ResourceFork", 32) < 0)
    {
      v54 = *__error();
      v55 = "Removing xattr";
      v56 = 548;
      goto LABEL_104;
    }
    if (fremovexattr(a1, "com.apple.decmpfs", 32) < 0)
    {
      v54 = *__error();
      v55 = "Removing xattr";
      v56 = 549;
      goto LABEL_104;
    }
    v27 = 0;
    goto LABEL_44;
  }
  v26 = calloc((v22 + 1), 4uLL);
  if (!v26)
  {
    v54 = *__error();
    v55 = "malloc";
    v56 = 498;
    goto LABEL_104;
  }
  if ((loadChunkOffsets(a1, v13, v22, v26, v36, v37, v38, v39) & 0x80000000) != 0)
  {
    v55 = "loading chunk offsets";
    v56 = 499;
    goto LABEL_103;
  }
  if (!(_DWORD)v22)
  {
    v44 = 0;
    v43 = 0;
LABEL_95:
    if (v43 != v20 || v44)
    {
      v55 = "corrupted resource fork";
      v56 = 544;
      goto LABEL_103;
    }
    goto LABEL_54;
  }
  v42 = 0;
  v43 = 0;
  v44 = 0;
  value = v75;
  __src = (char *)(v75 + 1);
  v58 = v22;
  v60 = v74;
  v61 = v22 - 1;
  v59 = v14;
  while (1)
  {
    __s = 0;
    if (!((v7 - v44) >> 16))
    {
      v55 = "obuf full";
      v56 = 507;
      goto LABEL_103;
    }
    v62 = v43;
    v45 = &v26[v42];
    v47 = *v45;
    v46 = v45[1];
    v48 = v46 - *v45;
    if (v60 < v48)
    {
      v55 = "invalid chunk size";
      v56 = 510;
      goto LABEL_103;
    }
    v63 = v7 - v44;
    v65 = v42;
    v66 = v44;
    if (fgetxattr(a1, "com.apple.ResourceFork", value, v46 - v47, v47, 32) != v48)
    {
      v55 = "read resource fork chunk";
      v56 = 513;
      goto LABEL_103;
    }
    if (v46 != v47)
      __s = v46 - v47;
    v49 = &v10[v66];
    if (*value == v59)
    {
      v50 = (v48 - 1);
      memcpy(v49, __src, v50);
    }
    else
    {
      v50 = compression_decode_buffer((uint8_t *)v49, 0x10000uLL, value, v48, v25, v19);
    }
    v51 = v65;
    v44 = v66;
    v52 = v63;
    if (v50 == 0x10000)
      goto LABEL_81;
    if (v50)
      v53 = v61 == v65;
    else
      v53 = 0;
    if (!v53 || v50 > 0x10000)
    {
LABEL_98:
      v55 = "invalid chunk";
      v56 = 532;
      goto LABEL_103;
    }
    if (v50)
    {
LABEL_81:
      v44 = v66 + v50;
      if (__CFADD__(v66, v50))
        goto LABEL_98;
      v52 = v7 - v44;
      if (v7 < v44)
        goto LABEL_98;
      v70 = v66 + v50;
    }
    v43 = v62;
    if (v61 == v65 || !(v52 >> 16))
      break;
LABEL_88:
    v42 = v51 + 1;
    if (v58 == v42)
      goto LABEL_95;
  }
  v67 = v44;
  if (pwrite(a1, v10, v44, v62) == v44)
  {
    v43 = v67 + v62;
    v70 = 0;
    v44 = 0;
    v51 = v65;
    goto LABEL_88;
  }
  v55 = "writing chunk";
  v56 = 539;
LABEL_103:
  v54 = 0;
LABEL_104:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"decompressToData", v56, 55, v54, v55, v40, v41, (char)__src);
LABEL_43:
  v27 = 0xFFFFFFFFLL;
LABEL_44:
  free(v75);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  free(v10);
  memset_s(&v70, 0x18uLL, 0, 0x18uLL);
  free(v25);
  free(v26);
  return v27;
}

uint64_t resizeResourceFork(int a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v8;
  __int16 v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  BOOL v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  size_t v42;
  size_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  char *v47;
  u_int32_t v48;
  u_int32_t v49;
  int v50;
  unint64_t v52;
  unint64_t v53;
  u_int32_t v54;
  ssize_t v55;
  unsigned int v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  u_int32_t *v60;
  char *v61;
  char *v62;
  int v63;
  const char *v64;
  __int16 v65;
  char v66;
  char *v67;
  u_int32_t *v68;
  int __n;
  rsize_t __na;
  unsigned int size;
  int size_4;
  uint64_t v73;
  int v74;
  unint64_t __s;
  unint64_t v76;
  void *__ptr;

  __s = 0;
  v76 = 0;
  __ptr = 0;
  v74 = -1;
  v73 = 0;
  if ((loadDecmpfsXattr(a1, &v74, &v73, &__s) & 0x80000000) != 0)
  {
    v8 = "loading decmpfs xattr";
    v9 = 574;
    goto LABEL_8;
  }
  v6 = v74;
  if ((v74 + 1) <= 0xE && ((1 << (v74 + 1)) & 0x5511) != 0)
  {
    v8 = "invalid compression type";
    v9 = 575;
LABEL_8:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resizeResourceFork", v9, 55, 0, v8, v4, v5, v66);
LABEL_9:
    v10 = 0;
    v11 = 0;
    goto LABEL_10;
  }
  v14 = resourceForkSize(a1);
  if (v14 == -1)
  {
    v8 = "invalid resource fork";
    v9 = 579;
    goto LABEL_8;
  }
  if (a2 < v14)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resizeResourceFork", 580, 55, 0, "can't resize resource fork %u to %u", v4, v5, v14);
    goto LABEL_9;
  }
  v15 = a2 - v14;
  if (a2 == v14)
  {
    v10 = 0;
    v11 = 0;
LABEL_18:
    v12 = 0;
    goto LABEL_11;
  }
  v16 = v73;
  if (!v73 || (v17 = v73 + 0xFFFF, (unint64_t)(v73 + 0xFFFF) >> 48))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"chunkCount", 128, 55, 0, "invalid uncompressed size", v4, v5, v66);
    goto LABEL_45;
  }
  v18 = v17 >> 16;
  v19 = (v17 >> 16) + 1;
  if (v19 <= 1)
  {
LABEL_45:
    v8 = "invalid uncompressed size";
    v9 = 589;
    goto LABEL_8;
  }
  v11 = calloc((v17 >> 16) + 1, 4uLL);
  v20 = calloc(v19, 4uLL);
  v10 = v20;
  if (!v11 || !v20)
  {
    v41 = *__error();
    v64 = "malloc";
    v65 = 594;
    goto LABEL_91;
  }
  if ((loadChunkOffsets(a1, v6, v18, v11, v21, v22, v23, v24) & 0x80000000) != 0)
  {
    v64 = "loading chunk offsets";
    v65 = 595;
    goto LABEL_90;
  }
  v10[v18] = v15 + v11[v18];
  v29 = v18;
  while (v29)
  {
    v30 = (v29 - 1);
    v31 = v16 - (v30 << 16);
    if (v31 >= 0x10000)
      LODWORD(v31) = 0x10000;
    v32 = v11[v29];
    v33 = v11[v30];
    v34 = v10[v29];
    v35 = v32 - v33;
    v36 = v34 - v33;
    if (v36 >= 0x10000)
      v36 = 0x10000;
    v38 = v35 > v36 || (v35 & 0xFFFF0000) != 0 || v35 >= v31;
    if (v38)
      v39 = v35;
    else
      v39 = v36;
    v38 = v34 >= v39;
    v40 = v34 - v39;
    v10[v30] = v40;
    if (!v38)
    {
      v64 = "resource fork resize failed";
      v65 = 607;
      goto LABEL_90;
    }
    v29 = v30;
    if (v40 < v11[v30])
    {
      v64 = "invalid state when resizing resource fork";
      v65 = 608;
      goto LABEL_90;
    }
  }
  if (*v10 != *v11)
  {
    v64 = "resource fork resize failed";
    v65 = 610;
    goto LABEL_90;
  }
  v42 = v76;
  if (v76 <= 0x10000)
  {
    do
    {
      v43 = (v42 >> 1) + v42;
      if (((v42 >> 1) & v42) != 0)
        v43 = ((v42 >> 1) & v42) + v42;
      if (v42)
        v42 = v43;
      else
        v42 = 0x4000;
    }
    while (v42 < 0x10001);
    v44 = __ptr;
    v45 = realloc(__ptr, v42);
    if (!v45)
    {
      free(v44);
      __s = 0;
      v76 = 0;
      __ptr = 0;
      v64 = "blob alloc";
      v65 = 613;
      goto LABEL_90;
    }
    __ptr = v45;
  }
  v46 = __s;
  if (!(_DWORD)v18)
    goto LABEL_97;
  v47 = (char *)__ptr;
  v48 = v11[(v18 - 1)];
  __n = v11[v18];
  v49 = __n - v48;
  size_4 = v18 - 1;
  v68 = &v10[(v18 - 1)];
  v50 = v10[v18] - *v68;
  if (v48 == *v68 && v49 == v50)
  {
LABEL_96:
    __ptr = v47;
LABEL_97:
    __s = v46;
    v76 = v42;
    if ((storeChunkOffsets(a1, v6, v18, v10, v25, v26, v27, v28) & 0x80000000) != 0)
    {
      v64 = "storing new offsets";
      v65 = 635;
      goto LABEL_90;
    }
    goto LABEL_18;
  }
  v52 = v42;
  while (1)
  {
    size = v50;
    v53 = v49;
    v67 = v47;
    v54 = v49;
    v55 = fgetxattr(a1, "com.apple.ResourceFork", v47, v49, v48, 32);
    v56 = size;
    if (v55 != v54)
    {
LABEL_93:
      v76 = v42;
      __ptr = v67;
      __s = 0;
      v64 = "read chunk";
      v65 = 628;
      goto LABEL_90;
    }
    if (__n == v48)
    {
      v57 = 0;
    }
    else
    {
      v57 = v53;
      if (v52 < v53)
        goto LABEL_93;
    }
    if (size <= v53)
    {
      v46 = v57;
      v59 = v67;
      v60 = v68;
      goto LABEL_84;
    }
    v46 = v57 + size - v53;
    __na = size - v53;
    if (v52 < v46)
      break;
    v61 = v67;
    if (v67)
    {
LABEL_82:
      memset_s(&v61[v57], __na, 0, __na);
      v59 = v61;
    }
    else
    {
      v59 = 0;
    }
    v60 = v68;
    v56 = size;
LABEL_84:
    v62 = v59;
    if (fsetxattr(a1, "com.apple.ResourceFork", v59, v56, *v60, 0) < 0)
    {
      v76 = v42;
      __ptr = v62;
      __s = v46;
      v64 = "write chunk";
      v65 = 631;
      goto LABEL_90;
    }
    if (!size_4)
    {
      v47 = v62;
      goto LABEL_96;
    }
    v63 = size_4 - 1;
    v48 = v11[size_4 - 1];
    __n = v11[size_4];
    v49 = __n - v48;
    v68 = &v10[size_4 - 1];
    v50 = v10[size_4--] - *v68;
    v47 = v62;
    if (v48 == *v68)
    {
      size_4 = v63;
      if (v49 == v50)
        goto LABEL_96;
    }
  }
  do
  {
    while (!v52)
    {
      v52 = 0x4000;
      v42 = 0x4000;
      if (v46 <= 0x4000)
        goto LABEL_81;
    }
    v58 = v52 >> 1;
    if ((v52 & (v52 >> 1)) != 0)
      v58 = v52 & (v52 >> 1);
    v52 += v58;
  }
  while (v52 < v46);
  v42 = v52;
  if (v52 >= 0x2000000001)
  {
    *__error() = 12;
    goto LABEL_101;
  }
LABEL_81:
  v61 = (char *)realloc(v67, v42);
  v52 = v42;
  if (v61)
    goto LABEL_82;
  free(v67);
LABEL_101:
  __s = 0;
  v76 = 0;
  __ptr = 0;
  v64 = "store padding";
  v65 = 629;
LABEL_90:
  v41 = 0;
LABEL_91:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resizeResourceFork", v65, 55, v41, v64, v27, v28, v66);
LABEL_10:
  v12 = 0xFFFFFFFFLL;
LABEL_11:
  free(__ptr);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  free(v11);
  free(v10);
  return v12;
}

uint64_t afscStreamClose(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  unint64_t v11;
  const char *v12;
  __int16 v13;
  int v14;
  size_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  const void *v25;
  size_t i;
  size_t v27;
  const char *v28;
  __int16 v29;
  char *v30;
  void *v31;
  int v32;
  const char *v33;
  __int16 v34;
  unint64_t v35;
  int v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  __int128 __s;
  char *v41;

  if (result)
  {
    v8 = result;
    v9 = atomic_load((unsigned int *)(result + 120));
    v10 = v9 == 0;
    v11 = *(_QWORD *)(result + 16);
    if (*(_QWORD *)(result + 24) < v11 || *(_QWORD *)(result + 64))
      goto LABEL_4;
    v15 = *(_QWORD *)(result + 88);
    v16 = *(_DWORD *)(result + 40);
    if (v15)
    {
      if (v16)
      {
LABEL_4:
        v39 = *(_QWORD *)(result + 24);
        v12 = "invalid final AFSC stream state, received %zu/%zu bytes";
        v13 = 826;
        goto LABEL_5;
      }
LABEL_17:
      v18 = *(_DWORD *)(v8 + 32) - (v15 != 0);
      v19 = *(_DWORD *)v8;
      __s = 0uLL;
      v41 = 0;
      if ((v18 - 7) >= 8 && (v18 - 3) >= 2)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeDecmpfsXattr", 286, 55, 0, "unsupported compression type: %d", a7, a8, v18);
        v23 = 0;
LABEL_55:
        free(v23);
        memset_s(&__s, 0x18uLL, 0, 0x18uLL);
        v12 = "store decmpfs xattr";
        v13 = 837;
        goto LABEL_5;
      }
      v20 = (char *)malloc(0x4000uLL);
      if (!v20)
        goto LABEL_52;
      v23 = v20;
      v41 = v20;
      *(_DWORD *)v20 = 1668116582;
      *((_DWORD *)v20 + 1) = v18;
      *((_QWORD *)v20 + 1) = v11;
      __s = xmmword_20A40C250;
      v24 = v15 + 16;
      if (v15 >= 0xFFFFFFFFFFFFFFF0 || (v24 & 0x8000000000000000) != 0)
        goto LABEL_53;
      v25 = *(const void **)(v8 + 104);
      if (v24 > 0x4000)
      {
        for (i = 0x4000; i < v24; i += v27)
        {
          v27 = i >> 1;
          if ((i & (i >> 1)) != 0)
            v27 = i & (i >> 1);
        }
        if (i >= 0x2000000001)
        {
          *__error() = 12;
LABEL_52:
          v23 = 0;
          __s = 0uLL;
          v41 = 0;
          goto LABEL_53;
        }
        v30 = (char *)realloc(v20, i);
        if (!v30)
        {
          free(v23);
          goto LABEL_52;
        }
        *((_QWORD *)&__s + 1) = i;
        v41 = v30;
        v23 = v30;
      }
      v31 = v23 + 16;
      if (v25)
        memcpy(v31, v25, v15);
      else
        memset_s(v31, v15, 0, v15);
      *(_QWORD *)&__s = v15 + 16;
      if ((v15 & 0x8000000000000000) == 0)
      {
        if ((fsetxattr(v19, "com.apple.decmpfs", v23, v15 + 16, 0, 0) & 0x80000000) == 0)
        {
          free(v23);
          memset_s(&__s, 0x18uLL, 0, 0x18uLL);
          if (ftruncate(*(_DWORD *)v8, 0))
          {
            v14 = *__error();
            v12 = "ftruncate";
            v13 = 840;
            goto LABEL_6;
          }
          if ((*(_BYTE *)(v8 + 8) & 4) != 0
            || (v35 = *(unsigned int *)(v8 + 40), !(_DWORD)v35)
            || 93 * *(_QWORD *)(v8 + 16) / 0x64uLL >= v35
            || *(_DWORD *)(v8 + 32) == 10
            || *(_DWORD *)(v8 + 112))
          {
            v36 = *(_DWORD *)(v8 + 112);
            if (!v36 || v36 == v18)
            {
              v37 = *(_DWORD *)(v8 + 116);
              if (v37
                && (v38 = *(_DWORD *)(v8 + 40)) != 0
                && v37 != v38
                && (resizeResourceFork(*(_DWORD *)v8, v37) & 0x80000000) != 0)
              {
                v12 = "resizing resource fork";
                v13 = 861;
              }
              else
              {
                if ((setUFCompressedBit(*(_DWORD *)v8) & 0x80000000) == 0)
                  goto LABEL_7;
                v12 = "set UF_COMPRESSED";
                v13 = 865;
              }
            }
            else
            {
              v12 = "compression type mismatch";
              v13 = 858;
            }
          }
          else
          {
            if ((decompressToData(*(_DWORD *)v8) & 0x80000000) == 0)
              goto LABEL_7;
            v12 = "decompressing to regular data file";
            v13 = 853;
          }
LABEL_5:
          v14 = 0;
LABEL_6:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamClose", v13, 55, v14, v12, a7, a8, v39);
          v10 = 0;
LABEL_7:
          free(*(void **)(v8 + 48));
          free(*(void **)(v8 + 56));
          free(*(void **)(v8 + 80));
          memset_s((void *)(v8 + 64), 0x18uLL, 0, 0x18uLL);
          free(*(void **)(v8 + 104));
          memset_s((void *)(v8 + 88), 0x18uLL, 0, 0x18uLL);
          free((void *)v8);
          return (v10 - 1);
        }
        v32 = *__error();
        v33 = "fsetxattr decmpfs";
        v34 = 297;
        goto LABEL_54;
      }
LABEL_53:
      v33 = "prepare decmpfs header";
      v34 = 291;
      v32 = 0;
LABEL_54:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeDecmpfsXattr", v34, 55, v32, v33, v21, v22, v39);
      goto LABEL_55;
    }
    if (!v16)
    {
      v15 = 0;
      goto LABEL_17;
    }
    if ((storeChunkOffsets(*(_DWORD *)result, *(_DWORD *)(result + 32), *(_DWORD *)(result + 44), *(_DWORD **)(result + 48), a5, a6, a7, a8) & 0x80000000) != 0)
    {
      v28 = "storing offsets";
      v29 = 796;
    }
    else
    {
      v17 = resourceForkSize(*(_DWORD *)v8);
      *(_DWORD *)(v8 + 40) = v17;
      if (v17 != -1)
      {
        v15 = *(_QWORD *)(v8 + 88);
        v11 = *(_QWORD *)(v8 + 16);
        goto LABEL_17;
      }
      v28 = "invalid resource fork";
      v29 = 800;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"finalizeResourceFork", v29, 55, 0, v28, a7, a8, v39);
    v12 = "finalize resource fork";
    v13 = 832;
    goto LABEL_5;
  }
  return result;
}

uint64_t afscStreamCancel(uint64_t result)
{
  unsigned int *v1;

  v1 = (unsigned int *)(result + 120);
  while (!__ldaxr(v1))
  {
    if (!__stlxr(1u, v1))
      return result;
  }
  __clrex();
  return result;
}

uint64_t afscStreamWrite(uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int *v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  const char *v16;
  __int16 v17;
  char *v20;
  size_t v21;
  _QWORD *v22;
  size_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  size_t v31;
  unint64_t v32;
  uint64_t v33;
  const uint8_t *v34;
  uint8_t *v35;
  int v36;
  unsigned int v37;
  compression_algorithm v38;
  const uint8_t *v39;
  size_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  const char *v44;
  __int16 v45;
  char v46;
  _QWORD *v47;

  v8 = (unsigned int *)(a1 + 120);
  if (atomic_load((unsigned int *)(a1 + 120)))
    return -1;
  v11 = a3;
  v13 = *(_QWORD *)(a1 + 24);
  v14 = __CFADD__(v13, a3);
  v15 = v13 + a3;
  if (v14 || v15 > *(_QWORD *)(a1 + 16))
  {
    v16 = "too many bytes received";
    v17 = 923;
    goto LABEL_6;
  }
  if (!a3)
    return 0;
  v20 = __src;
  v10 = 0;
  v22 = (_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 64);
  v47 = (_QWORD *)(a1 + 64);
  do
  {
    if (v11 >= 0x10000 - v21)
      v23 = 0x10000 - v21;
    else
      v23 = v11;
    v24 = v21 + v23;
    if (__CFADD__(v21, v23) || (v24 & 0x8000000000000000) != 0)
      goto LABEL_72;
    v25 = *(_QWORD *)(a1 + 72);
    if (v25 < v24)
    {
      do
      {
        while (!v25)
        {
          v25 = 0x4000;
          v27 = 0x4000;
          if (v24 <= 0x4000)
            goto LABEL_28;
        }
        v26 = v25 >> 1;
        if ((v25 & (v25 >> 1)) != 0)
          v26 = v25 & (v25 >> 1);
        v25 += v26;
      }
      while (v25 < v24);
      v27 = v25;
      if (v25 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_71;
      }
LABEL_28:
      v28 = *(void **)(a1 + 80);
      v29 = realloc(v28, v27);
      if (!v29)
      {
        free(v28);
LABEL_71:
        *v22 = 0;
        v22[1] = 0;
        v22[2] = 0;
LABEL_72:
        v16 = "append to ibuf";
        v17 = 928;
LABEL_6:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamWrite", v17, 55, 0, v16, a7, a8, v46);
        v10 = -1;
        goto LABEL_7;
      }
      *(_QWORD *)(a1 + 72) = v27;
      *(_QWORD *)(a1 + 80) = v29;
    }
    v30 = *(_QWORD *)(a1 + 80);
    if (v20)
    {
      memcpy((void *)(v30 + *v22), v20, v23);
    }
    else if (v30)
    {
      memset_s((void *)(v30 + *v22), v23, 0, v23);
    }
    v21 = *v22 + v23;
    *v22 = v21;
    if ((v23 & 0x8000000000000000) != 0)
      goto LABEL_72;
    v31 = *(_QWORD *)(a1 + 24) + v23;
    *(_QWORD *)(a1 + 24) = v31;
    if (v21 == 0x10000 || v21 && v31 == *(_QWORD *)(a1 + 16))
    {
      v32 = (v31 + 0xFFFFFFFFFFFFLL) >> 16;
      if (*(_DWORD *)(a1 + 44) <= v32)
      {
        v44 = "invalid state";
        v45 = 740;
        goto LABEL_75;
      }
      v33 = *(_QWORD *)(a1 + 88);
      if ((unint64_t)(*(_QWORD *)(a1 + 96) - v33) <= 0x10000)
      {
        if ((flushOBuf_0(a1, (uint64_t)__src, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
        {
          v44 = "flushing obuf";
          v45 = 744;
          goto LABEL_75;
        }
        v21 = *(_QWORD *)(a1 + 64);
        v33 = *(_QWORD *)(a1 + 88);
      }
      v34 = *(const uint8_t **)(a1 + 80);
      v35 = (uint8_t *)(*(_QWORD *)(a1 + 104) + v33);
      v36 = *(_DWORD *)(a1 + 32);
      if (v36 != 10
        && v21 >= 0x78
        && ((v37 = v36 - 3, v37 > 0xB) ? (v38 = -1) : (v38 = dword_20A40C214[v37]),
            (v39 = *(const uint8_t **)(a1 + 80),
             v40 = compression_encode_buffer(v35, 0x10000uLL, v39, v21, *(void **)(a1 + 56), v38),
             v34 = v39,
             v40)
         && ((*(_BYTE *)(a1 + 8) & 1) != 0 ? (__src = (char *)((v40 >> 6) + 32)) : (__src = 0),
             (v41 = &__src[v40]) != 0 && (unint64_t)v41 < v21)))
      {
        if ((unint64_t)v41 > v40)
          memset_s(&v35[v40], (rsize_t)__src, 0, (rsize_t)__src);
      }
      else
      {
        *v35 = *(_BYTE *)(a1 + 36);
        memcpy(v35 + 1, v34, v21);
        v41 = (char *)(v21 + 1);
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * (v32 + 1)) = *(_DWORD *)(*(_QWORD *)(a1 + 48)
                                                                                    + 4 * v32)
                                                                        + (_DWORD)v41;
      if (v41)
      {
        v42 = *(_QWORD *)(a1 + 88);
        v14 = __CFADD__(v42, v41);
        v43 = &v41[v42];
        if (v14 || (unint64_t)v43 > *(_QWORD *)(a1 + 96))
        {
          v44 = "expand obuf";
          v45 = 780;
LABEL_75:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"flushIBuf", v45, 55, 0, v44, a7, a8, v46);
          v16 = "flushing ibuf";
          v17 = 938;
          goto LABEL_6;
        }
        *(_QWORD *)(a1 + 88) = v43;
      }
      if (*(_QWORD *)(a1 + 24) == *(_QWORD *)(a1 + 16)
        && (flushOBuf_0(a1, (uint64_t)__src, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
      {
        v44 = "flushing obuf";
        v45 = 784;
        goto LABEL_75;
      }
      v21 = 0;
      v22 = v47;
      *v47 = 0;
    }
    v20 += v23;
    v10 += v23;
    v11 -= v23;
  }
  while (v11);
  if (v10 < 0)
  {
LABEL_7:
    while (!__ldaxr(v8))
    {
      if (!__stlxr(1u, v8))
        return v10;
    }
    __clrex();
  }
  return v10;
}

uint64_t afscStreamCloseWithState(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  __int128 *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;

  if (atomic_load((unsigned int *)(a1 + 120)))
    return 0xFFFFFFFFLL;
  v13 = (_DWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 88);
  if (v12)
  {
    if ((flushOBuf_0(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
    {
      v26 = "flushing obuf";
      v27 = 884;
LABEL_41:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"afscStreamCloseWithState", v27, 55, 0, v26, a7, a8, v37);
      return 0xFFFFFFFFLL;
    }
    LODWORD(v12) = *v13;
  }
  v14 = *(_QWORD *)(a1 + 64);
  v37 = *(_OWORD *)(a1 + 8);
  v38 = *(_QWORD *)(a1 + 24);
  v15 = *(_DWORD *)(a1 + 40);
  v39 = *(_DWORD *)(a1 + 32);
  v40 = v15;
  v41 = *(_QWORD *)(a1 + 112);
  v42 = v14;
  v43 = v12;
  if (!a2[3])
    goto LABEL_40;
  v16 = 0;
  v17 = *(_DWORD *)(a1 + 44);
  v18 = &v37;
  v19 = 48;
  while (1)
  {
    v20 = ((uint64_t (*)(_QWORD, __int128 *, uint64_t))a2[3])(*a2, v18, v19);
    if (v20 < 1)
      break;
    v18 = (__int128 *)((char *)v18 + v20);
    v16 += v20;
    v19 -= v20;
    if (!v19)
    {
      if (v16 < 0)
        goto LABEL_40;
      goto LABEL_12;
    }
  }
  if (v20 < 0)
    goto LABEL_40;
LABEL_12:
  if (!a2[3])
    goto LABEL_40;
  v21 = v17 + 1;
  if (v17 != -1)
  {
    v22 = 0;
    v23 = 4 * v21;
    v24 = *(_QWORD *)(a1 + 48);
    while (1)
    {
      v25 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))a2[3])(*a2, v24, v23);
      if (v25 < 1)
        break;
      v24 += v25;
      v22 += v25;
      v23 -= v25;
      if (!v23)
        goto LABEL_20;
    }
    v22 = v25;
LABEL_20:
    if (v22 < 0 || !a2[3])
      goto LABEL_40;
  }
  v28 = *(_QWORD *)(a1 + 64);
  if (v28)
  {
    v29 = 0;
    v30 = *(_QWORD *)(a1 + 80);
    while (1)
    {
      v31 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))a2[3])(*a2, v30, v28);
      if (v31 < 1)
        break;
      v30 += v31;
      v29 += v31;
      v28 -= v31;
      if (!v28)
        goto LABEL_28;
    }
    v29 = v31;
LABEL_28:
    if (v29 < 0)
      goto LABEL_40;
  }
  if (!a2[3])
    goto LABEL_40;
  v32 = *(_QWORD *)v13;
  if (*(_QWORD *)v13)
  {
    v33 = 0;
    v34 = *(_QWORD *)(a1 + 104);
    while (1)
    {
      v35 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))a2[3])(*a2, v34, v32);
      if (v35 < 1)
        break;
      v34 += v35;
      v33 += v35;
      v32 -= v35;
      if (!v32)
        goto LABEL_36;
    }
    v33 = v35;
LABEL_36:
    if (v33 < 0)
    {
LABEL_40:
      v26 = "serializing state";
      v27 = 901;
      goto LABEL_41;
    }
  }
  if (a3)
    *a3 = *(_QWORD *)(a1 + 24);
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 80));
  memset_s((void *)(a1 + 64), 0x18uLL, 0, 0x18uLL);
  free(*(void **)(a1 + 104));
  memset_s(v13, 0x18uLL, 0, 0x18uLL);
  free((void *)a1);
  return 0;
}

uint64_t setUFCompressedBit(int a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  __int16 v6;
  stat v8;

  memset(&v8, 0, sizeof(v8));
  if (fstat(a1, &v8))
  {
    v2 = *__error();
    v5 = "fstat";
    v6 = 115;
LABEL_3:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"setUFCompressedBit", v6, 55, v2, v5, v3, v4, v8.st_dev);
    return 0xFFFFFFFFLL;
  }
  if ((v8.st_flags & 0x20) == 0 && fchflags(a1, v8.st_flags | 0x20) < 0)
  {
    v2 = *__error();
    v5 = "fchflags UF_COMPRESSED";
    v6 = 120;
    goto LABEL_3;
  }
  return 0;
}

uint64_t storeChunkOffsets(int fd, int a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  const char *v14;
  char *v15;
  uint64_t v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  rsize_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  unint64_t v36;
  size_t v37;
  char *v38;
  size_t v39;
  size_t v40;
  char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  __int16 v45;
  __int128 v47;
  void *value;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v47 = 0uLL;
  value = 0;
  v9 = 8 * a3 + 264;
  if (a2 != 4)
    v9 = 4 * a3 + 4;
  if (v9 >= 0xFFFFFFFF)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", a7, a8, v47);
    v12 = 373;
    v13 = 0;
    v14 = "invalid file size";
LABEL_5:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeChunkOffsets", v12, 55, v13, v14, v10, v11, v47);
    v15 = 0;
LABEL_54:
    v42 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }
  if (a2 == 4)
  {
    v18 = a3;
    if (fsetxattr(fd, "com.apple.ResourceFork", &old_resource_fork_map_0, 0x32uLL, a4[a3], 0) < 0)
    {
      v13 = *__error();
      v14 = "fsetxattr resource fork";
      v12 = 379;
      goto LABEL_5;
    }
    v19 = a4[a3];
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    v20 = (char *)malloc(0x4000uLL);
    v15 = v20;
    if (!v20)
    {
      v47 = 0uLL;
      v45 = 399;
LABEL_49:
      value = 0;
LABEL_52:
      v44 = "prepare zlib header";
      v43 = 0;
      goto LABEL_53;
    }
    value = v20;
    *(_DWORD *)v20 = 0x10000;
    *((_DWORD *)v20 + 1) = bswap32(v19);
    *((_DWORD *)v20 + 2) = bswap32(v19 - 256);
    *((_DWORD *)v20 + 3) = 838860800;
    v23 = v62;
    *((_OWORD *)v20 + 13) = v61;
    *((_OWORD *)v20 + 14) = v23;
    *((_OWORD *)v20 + 15) = v63;
    v24 = v58;
    *((_OWORD *)v20 + 9) = v57;
    *((_OWORD *)v20 + 10) = v24;
    v25 = v60;
    *((_OWORD *)v20 + 11) = v59;
    *((_OWORD *)v20 + 12) = v25;
    v26 = v54;
    *((_OWORD *)v20 + 5) = v53;
    *((_OWORD *)v20 + 6) = v26;
    v27 = v56;
    *((_OWORD *)v20 + 7) = v55;
    *((_OWORD *)v20 + 8) = v27;
    v28 = v50;
    *((_OWORD *)v20 + 1) = v49;
    *((_OWORD *)v20 + 2) = v28;
    v29 = v52;
    *((_OWORD *)v20 + 3) = v51;
    *((_OWORD *)v20 + 4) = v29;
    *((_DWORD *)v20 + 64) = bswap32(v19 - 260);
    *((_DWORD *)v20 + 65) = a3;
    v47 = xmmword_20A40C260;
    if (a3)
    {
      v30 = 0;
      v31 = 264;
      v32 = 0x4000;
      while (1)
      {
        v33 = v31 + 8;
        if (v31 >= 0xFFFFFFFFFFFFFFF8 || (v33 & 0x8000000000000000) != 0)
        {
          v45 = 406;
          v15 = (char *)value;
          goto LABEL_52;
        }
        v34 = a4[v30++];
        v35 = a4[v30];
        if (v32 < v33)
          break;
LABEL_24:
        *(_QWORD *)&v15[v31] = (v34 - 260) | ((unint64_t)(v35 - v34) << 32);
        v31 = v47 + 8;
        *(_QWORD *)&v47 = v47 + 8;
        if (v30 == v18)
        {
          v15 = (char *)value;
          goto LABEL_44;
        }
      }
      do
      {
        while (!v32)
        {
          v32 = 0x4000;
          v37 = 0x4000;
          if (v33 <= 0x4000)
            goto LABEL_22;
        }
        v36 = v32 >> 1;
        if ((v32 & (v32 >> 1)) != 0)
          v36 = v32 & (v32 >> 1);
        v32 += v36;
      }
      while (v32 < v33);
      v37 = v32;
      if (v32 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_58;
      }
LABEL_22:
      v38 = (char *)realloc(v15, v37);
      if (v38)
      {
        *((_QWORD *)&v47 + 1) = v37;
        value = v38;
        v15 = v38;
        v32 = v37;
        goto LABEL_24;
      }
      free(v15);
LABEL_58:
      v15 = 0;
      v47 = 0uLL;
      v45 = 406;
      goto LABEL_49;
    }
    v31 = 264;
  }
  else
  {
    v31 = v9 & 0xFFFFFFFC;
    if ((v9 & 0xFFFFFFFC) != 0)
    {
      v39 = 0;
      do
      {
        while (!v39)
        {
          v39 = 0x4000;
          if (v31 <= 0x4000)
          {
            v39 = 0x4000;
            goto LABEL_37;
          }
        }
        v40 = v39 >> 1;
        if ((v39 & (v39 >> 1)) != 0)
          v40 = v39 & (v39 >> 1);
        v39 += v40;
      }
      while (v39 < v31);
      if (v39 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_46:
        value = 0;
        v47 = 0uLL;
        v14 = "prepare non zlib header";
        v12 = 411;
        v13 = 0;
        goto LABEL_5;
      }
LABEL_37:
      v41 = (char *)malloc(v39);
      if (!v41)
        goto LABEL_46;
      v15 = v41;
      *((_QWORD *)&v47 + 1) = v39;
      value = v41;
      if (a4)
        goto LABEL_42;
      memset_s(v41, v31, 0, v31);
    }
    else
    {
      v15 = 0;
LABEL_42:
      memcpy(v15, a4, v31);
    }
    *(_QWORD *)&v47 = v31;
  }
LABEL_44:
  if (fsetxattr(fd, "com.apple.ResourceFork", v15, v31, 0, 0) < 0)
  {
    v43 = *__error();
    v44 = "fsetxattr resource fork";
    v45 = 420;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"storeChunkOffsets", v45, 55, v43, v44, v21, v22, v47);
    goto LABEL_54;
  }
  v42 = 0;
LABEL_55:
  free(v15);
  memset_s(&v47, 0x18uLL, 0, 0x18uLL);
  return v42;
}

uint64_t flushOBuf_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL4 v9;
  unsigned int v10;
  unint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  char v28;

  v9 = (*(_BYTE *)(a1 + 8) & 2) != 0 && *(_DWORD *)(a1 + 32) != 10;
  v10 = *(_DWORD *)(a1 + 112);
  if (v10)
  {
    if (v10 > 0xD || ((1 << v10) & 0x2A88) == 0)
    {
      v13 = (_DWORD *)(a1 + 40);
      LODWORD(v12) = *(_DWORD *)(a1 + 40);
LABEL_15:
      v15 = v10 > 0xD;
      v16 = (1 << v10) & 0x2A88;
      if (!v15 && v16 != 0)
      {
        v18 = "requested compression type requests inline storage";
        v19 = 704;
        v20 = 0;
        goto LABEL_31;
      }
LABEL_20:
      if (!(_DWORD)v12)
      {
        v21 = *(unsigned int *)(a1 + 44);
        v22 = 8 * v21 + 264;
        v23 = 4 * v21 + 4;
        if (*(_DWORD *)(a1 + 32) == 4)
          v12 = v22;
        else
          v12 = v23;
        v14 = 0xFFFFFFFFLL;
        if (v12 >= 0xFFFFFFFF)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", a7, a8, v27);
          *v13 = -1;
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"flushOBuf", 714, 55, 0, "File too large for AFSC", v24, v25, v28);
          return v14;
        }
        *v13 = v12;
      }
      if ((fsetxattr(*(_DWORD *)a1, "com.apple.ResourceFork", *(const void **)(a1 + 104), *(_QWORD *)(a1 + 88), v12, 0) & 0x80000000) == 0)
      {
        v14 = 0;
        *(_DWORD *)(a1 + 40) += *(_DWORD *)(a1 + 88);
        *(_QWORD *)(a1 + 88) = 0;
        return v14;
      }
      v20 = *__error();
      v18 = "fsetxattr resource fork";
      v19 = 723;
LABEL_31:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"flushOBuf", v19, 55, v20, v18, a7, a8, v27);
      return 0xFFFFFFFFLL;
    }
  }
  v13 = (_DWORD *)(a1 + 40);
  LODWORD(v12) = *(_DWORD *)(a1 + 40);
  if (v12 | v9
    || *(_DWORD *)(a1 + 44) != 1
    || *(_QWORD *)(a1 + 24) != *(_QWORD *)(a1 + 16)
    || (unint64_t)(*(_QWORD *)(a1 + 88) + 16) >= 0xE01)
  {
    if (!v10)
      goto LABEL_20;
    goto LABEL_15;
  }
  return 0;
}

uint64_t loadChunkOffsets(int fd, int a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  unint64_t v17;
  size_t v18;
  size_t v19;
  char *v20;
  char *v21;
  ssize_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t v27;
  char v29;
  uint64_t __s;
  size_t v31;
  char *v32;

  __s = 0;
  v31 = 0;
  v32 = 0;
  if (a2 == 4)
    v9 = 8 * a3 + 264;
  else
    v9 = 4 * a3 + 4;
  if (v9 >= 0xFFFFFFFF)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"resourceForkHeaderSize", 146, 55, 0, "invalid file size", a7, a8, v29);
    v12 = 329;
    v13 = "invalid file size";
LABEL_27:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"loadChunkOffsets", v12, 55, 0, v13, v10, v11, v29);
    v21 = 0;
LABEL_28:
    v27 = 0xFFFFFFFFLL;
    goto LABEL_29;
  }
  v17 = v9 & 0xFFFFFFFC;
  if ((v9 & 0xFFFFFFFC) != 0)
  {
    v18 = 0;
    do
    {
      while (!v18)
      {
        v18 = 0x4000;
        if (v17 <= 0x4000)
        {
          v18 = 0x4000;
          goto LABEL_17;
        }
      }
      v19 = v18 >> 1;
      if ((v18 & (v18 >> 1)) != 0)
        v19 = v18 & (v18 >> 1);
      v18 += v19;
    }
    while (v18 < v17);
    if (v18 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_26;
    }
LABEL_17:
    v20 = (char *)malloc(v18);
    if (v20)
    {
      v21 = v20;
      v31 = v18;
      v32 = v20;
      v22 = fgetxattr(fd, "com.apple.ResourceFork", v20, v9 & 0xFFFFFFFC, 0, 32);
      goto LABEL_20;
    }
LABEL_26:
    v31 = 0;
    v32 = 0;
    __s = 0;
    v13 = "alloc buffer";
    v12 = 332;
    goto LABEL_27;
  }
  v22 = fgetxattr(fd, "com.apple.ResourceFork", 0, 0, 0, 32);
  v21 = 0;
LABEL_20:
  if (v22 != v17)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c", (uint64_t)"loadChunkOffsets", 335, 55, 0, "read resource fork header", v23, v24, v29);
    goto LABEL_28;
  }
  __s = v9 & 0xFFFFFFFC;
  if (a2 == 4)
  {
    *a4 = v9;
    if (a3)
    {
      v25 = 0;
      v26 = a4 + 1;
      do
      {
        LODWORD(v9) = v9 + *(_DWORD *)&v21[v25 + 268];
        *v26++ = v9;
        v25 += 8;
      }
      while (8 * a3 != v25);
    }
  }
  else
  {
    memcpy(a4, v21, v9 & 0xFFFFFFFC);
  }
  v27 = 0;
LABEL_29:
  free(v21);
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  return v27;
}

AAByteStream AACompressionOutputStreamOpen(AAByteStream compressed_stream, AACompressionAlgorithm compression_algorithm, size_t block_size, AAFlagSet flags, int n_threads)
{
  _QWORD *v9;
  uint64_t *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  unsigned int *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  _BYTE buf[3];
  char v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = calloc(1uLL, 0x68uLL);
  if (!v9)
  {
    v16 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpen", 254, 19, *v16, "malloc", v17, v18, v32);
    v10 = 0;
LABEL_37:
    free(v9);
    aaCompressionOutputStreamClose(v10, v24, v25, v26, v27, v28, v29, v30);
    return 0;
  }
  v10 = (uint64_t *)calloc(1uLL, 0x30uLL);
  if (!v10)
  {
    v19 = *__error();
    v20 = "malloc";
    v21 = 256;
LABEL_36:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpen", v21, 19, v19, v20, v13, v14, v32);
    goto LABEL_37;
  }
  if (!n_threads)
    n_threads = getDefaultNThreads();
  *((_DWORD *)v10 + 2) = n_threads;
  v11 = calloc(n_threads, 8uLL);
  v10[2] = (uint64_t)v11;
  if (*((_DWORD *)v10 + 2))
  {
    v12 = 0;
    while (1)
    {
      *(_QWORD *)(v10[2] + 8 * v12) = CompressionWorkerDataCreate(block_size, (compression_algorithm)compression_algorithm);
      v15 = v10[2];
      if (!*(_QWORD *)(v15 + 8 * v12))
        break;
      ++v12;
      v11 = (void *)*((unsigned int *)v10 + 2);
      if (v12 >= (unint64_t)v11)
        goto LABEL_13;
    }
    v20 = "Worker data allocation";
    v21 = 264;
    goto LABEL_35;
  }
  v15 = (uint64_t)v11;
  LODWORD(v11) = 0;
LABEL_13:
  v22 = ThreadPipelineCreate(v11, v15, (uint64_t)CompressionWorkerProc, (uint64_t)v10, (uint64_t)CompressionConsumerProc, 0);
  *v10 = (uint64_t)v22;
  if (!v22)
  {
    v20 = "Thread allocation";
    v21 = 267;
LABEL_35:
    v19 = 0;
    goto LABEL_36;
  }
  v10[3] = (uint64_t)compressed_stream;
  qmemcpy(buf, "pbz", sizeof(buf));
  v23 = 122;
  if ((int)compression_algorithm <= 1284)
  {
    if (compression_algorithm)
    {
      if (compression_algorithm == 256)
      {
        v23 = 52;
      }
      else
      {
        if (compression_algorithm != 774)
          goto LABEL_34;
        v23 = 120;
      }
    }
    else
    {
      v23 = 45;
    }
  }
  else
  {
    if ((int)compression_algorithm <= 2048)
    {
      if (compression_algorithm == 1285)
        goto LABEL_31;
      if (compression_algorithm == 1794)
      {
        v23 = 98;
        goto LABEL_31;
      }
LABEL_34:
      v20 = "Invalid compression algorithm";
      v21 = 274;
      goto LABEL_35;
    }
    if (compression_algorithm == 2049)
    {
      v23 = 101;
    }
    else
    {
      if (compression_algorithm != 2304)
        goto LABEL_34;
      v23 = 102;
    }
  }
LABEL_31:
  v34 = v23;
  v35 = bswap64(block_size);
  if (AAByteStreamWrite(compressed_stream, buf, 0xCuLL) != 12)
  {
    v20 = "writing stream magic";
    v21 = 277;
    goto LABEL_35;
  }
  v9[3] = aaCompressionOutputStreamWrite;
  v9[7] = aaCompressionOutputStreamAbort;
  *v9 = v10;
  v9[1] = aaCompressionOutputStreamClose;
  v9[9] = aaCompressionOutputStreamFlush;
  return (AAByteStream)v9;
}

_QWORD *CompressionWorkerDataCreate(size_t a1, compression_algorithm a2)
{
  __int16 v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  void *v13;
  size_t v14;
  void *v15;
  char v16;

  v4 = 56;
  v5 = calloc(1uLL, 0x38uLL);
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  v5[1] = 0;
  v5[2] = 0;
  *v5 = a1;
  if (a1 >= 0x2000000001)
  {
    *__error() = 12;
    v6[3] = 0;
    *__error() = 12;
    v7 = v6 + 4;
    v4 = 62;
LABEL_4:
    *v7 = 0;
LABEL_5:
    v8 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"CompressionWorkerDataCreate", v4, 19, *v8, "malloc", v9, v10, v16);
    CompressionWorkerDataDestroy((void **)v6);
    return 0;
  }
  v12 = malloc(a1);
  v6[3] = v12;
  v13 = malloc(a1);
  v6[4] = v13;
  v4 = 62;
  if (!v12 || !v13)
    goto LABEL_5;
  *((_DWORD *)v6 + 10) = a2;
  if (a2)
  {
    if (a2 != COMPRESSION_LZMA)
    {
      v14 = compression_encode_scratch_buffer_size(a2);
      if (v14)
      {
        if (v14 < 0x2000000001)
        {
          v15 = malloc(v14);
          v6[6] = v15;
          if (v15)
            return v6;
          v4 = 68;
          goto LABEL_5;
        }
        *__error() = 12;
        v7 = v6 + 6;
        v4 = 68;
        goto LABEL_4;
      }
    }
  }
  return v6;
}

uint64_t CompressionWorkerProc(uint64_t a1)
{
  size_t v2;
  compression_algorithm v3;
  int64_t v4;
  size_t v5;
  BOOL v6;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_DWORD *)(a1 + 40);
  if (!v3
    || (v3 != COMPRESSION_LZMA
      ? (v5 = compression_encode_buffer(*(uint8_t **)(a1 + 32), *(_QWORD *)a1, *(const uint8_t **)(a1 + 24), v2, *(void **)(a1 + 48), v3)): (v4 = PCompressLZMA6Encode(*(uint8_t **)(a1 + 32), *(_QWORD *)a1, *(const uint8_t **)(a1 + 24), v2), v5 = v4 & ~(v4 >> 63)), v5 ? (v6 = v5 + (v2 >> 4) >= v2) : (v6 = 1), v6))
  {
    memcpy(*(void **)(a1 + 32), *(const void **)(a1 + 24), v2);
    v5 = v2;
  }
  *(_QWORD *)(a1 + 16) = v5;
  return 0;
}

uint64_t CompressionConsumerProc(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int16 v7;
  int8x16_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!*(_DWORD *)(a1 + 40))
  {
    v8 = vrev64q_s8(*(int8x16_t *)(a2 + 8));
    if (AAByteStreamWrite(*(AAByteStream *)(a1 + 24), &v8, 0x10uLL) == 16)
    {
      if (AAByteStreamWrite(*(AAByteStream *)(a1 + 24), *(const void **)(a2 + 32), *(_QWORD *)(a2 + 16)) == *(_QWORD *)(a2 + 16))
        return 0;
      v7 = 119;
    }
    else
    {
      v7 = 115;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"CompressionConsumerProc", v7, 19, 0, "Stream write failed", v4, v5, v8.i8[0]);
    *(_DWORD *)(a1 + 40) = 1;
  }
  return 0xFFFFFFFFLL;
}

uint64_t aaCompressionOutputStreamWrite(uint64_t a1, uint64_t __src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;
  char *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t Worker;
  size_t v15;
  uint64_t v16;
  size_t v17;
  const char *v18;
  __int16 v19;
  char v21;

  if (!a3)
    return 0;
  v8 = a3;
  v9 = (char *)__src;
  v11 = 0;
  while (1)
  {
    v12 = *(uint64_t **)(a1 + 32);
    if (v12)
    {
      v13 = v12[1];
      goto LABEL_7;
    }
    Worker = ThreadPipelineGetWorker(*(_QWORD *)a1, __src, a3, a4, a5, a6, a7, a8);
    *(_QWORD *)(a1 + 32) = Worker;
    if (!Worker)
      break;
    v12 = (uint64_t *)Worker;
    v13 = 0;
    *(_QWORD *)(Worker + 8) = 0;
    *(_QWORD *)(Worker + 16) = 0;
LABEL_7:
    if (*v12 - v13 >= v8)
      v15 = v8;
    else
      v15 = *v12 - v13;
    memcpy((void *)(v12[3] + v13), v9, v15);
    v16 = *v12;
    v17 = v12[1] + v15;
    v12[1] = v17;
    if (v17 == v16)
    {
      if ((ThreadPipelineRunWorker(*(_QWORD *)a1, *(_QWORD *)(a1 + 32), a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
      {
        v18 = "running worker";
        v19 = 186;
        goto LABEL_18;
      }
      *(_QWORD *)(a1 + 32) = 0;
    }
    v9 += v15;
    v11 += v15;
    v8 -= v15;
    if (!v8)
      return v11;
  }
  v18 = "getting next worker";
  v19 = 168;
LABEL_18:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamWrite", v19, 19, 0, v18, a7, a8, v21);
  *(_DWORD *)(a1 + 40) = 1;
  return -1;
}

uint64_t aaCompressionOutputStreamAbort(uint64_t result)
{
  *(_DWORD *)(result + 40) = 1;
  return result;
}

uint64_t *aaCompressionOutputStreamClose(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  if (result)
  {
    v8 = result;
    v9 = result[4];
    if (v9)
    {
      if ((ThreadPipelineRunWorker(*result, v9, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamClose", 133, 19, 0, "RunWorker", v10, v11, v20);
        v12 = 0;
      }
      else
      {
        v12 = 1;
      }
      v8[4] = 0;
    }
    else
    {
      v12 = 1;
    }
    if ((ThreadPipelineDestroy(*v8) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamClose", 138, 19, 0, "Thread shutdown", v13, v14, v20);
      v12 = 0;
    }
    v15 = (void *)v8[2];
    if (v15)
    {
      if (*((_DWORD *)v8 + 2))
      {
        v16 = 0;
        do
          CompressionWorkerDataDestroy(*(void ***)(v8[2] + 8 * v16++));
        while (v16 < *((unsigned int *)v8 + 2));
        v15 = (void *)v8[2];
      }
      free(v15);
    }
    if (*((_DWORD *)v8 + 11)
      && (AAByteStreamSeek((AAByteStream)v8[3], 0, 1) < 0 || (AAByteStreamTruncate((_QWORD *)v8[3]) & 0x80000000) != 0))
    {
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamClose", 151, 19, "Truncate on compressed stream failed", v17, v18, v19, v20);
    }
    free(v8);
    if (v12)
      return 0;
    else
      return (uint64_t *)0xFFFFFFFFLL;
  }
  return result;
}

uint64_t aaCompressionOutputStreamFlush(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  off_t v4;
  off_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v10;
  __int16 v11;
  char v12;

  if (*(_DWORD *)(a1 + 40))
    return 0xFFFFFFFFLL;
  if ((ThreadPipelineFlush(*(_QWORD *)a1) & 0x80000000) != 0)
  {
    v10 = "ThreadPipelineFlush";
    v11 = 209;
LABEL_15:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamFlush", v11, 19, 0, v10, v2, v3, v12);
    *(_DWORD *)(a1 + 40) = 1;
    return 0xFFFFFFFFLL;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = AAByteStreamSeek(*(AAByteStream *)(a1 + 24), 0, 1);
    if (v4 < 0)
    {
      v10 = "AAByteStreamSeek";
      v11 = 216;
    }
    else
    {
      v5 = v4;
      CompressionWorkerProc(*(_QWORD *)(a1 + 32));
      if ((CompressionConsumerProc(a1, *(_QWORD *)(a1 + 32)) & 0x80000000) != 0)
      {
        v10 = "CompressionConsumerProc";
        v11 = 220;
      }
      else
      {
        if (v5 == AAByteStreamSeek(*(AAByteStream *)(a1 + 24), v5, 0))
        {
          *(_DWORD *)(a1 + 44) = 1;
          goto LABEL_8;
        }
        v10 = "AAByteStreamSeek";
        v11 = 223;
      }
    }
    goto LABEL_15;
  }
LABEL_8:
  if ((AAByteStreamFlush(*(_QWORD **)(a1 + 24)) & 0x80000000) != 0)
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"aaCompressionOutputStreamFlush", 230, 19, "Flush on underlying stream failed", v6, v7, v8, v12);
  return 0;
}

AAByteStream AACompressionOutputStreamOpenExisting(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  off_t v5;
  uint64_t v6;
  uint64_t v7;
  off_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v15;
  __int16 v16;
  uint8_t *v17;
  uint8_t *v18;
  unsigned int *v19;
  _QWORD *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v30;
  size_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  __int16 v48;
  compression_algorithm v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  size_t v56;
  size_t v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t *v60;
  size_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  __int16 v68;
  unsigned int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int64_t v73;
  size_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  unint64_t v80;
  off_t v81;
  compression_algorithm algorithm;
  unint64_t __size;
  unint64_t v84;
  unint64_t v85;
  __int16 v86;
  char v87;
  char v88;
  unint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v5 = AAByteStreamSeek(compressed_stream, 0, 2);
  if (v5 < 0)
  {
    v15 = "Stream seek";
    v16 = 311;
    goto LABEL_15;
  }
  if (!*((_QWORD *)compressed_stream + 4))
  {
LABEL_13:
    v15 = "Truncated stream";
    v16 = 315;
LABEL_15:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", v16, 19, 0, v15, v6, v7, v78);
    v17 = 0;
    v18 = 0;
LABEL_16:
    v19 = 0;
    v20 = 0;
LABEL_17:
    v21 = 1;
    goto LABEL_18;
  }
  v8 = v5;
  v9 = 0;
  v10 = 0;
  v11 = &v86;
  v12 = 12;
  do
  {
    v13 = (*((uint64_t (**)(_QWORD, __int16 *, uint64_t, uint64_t))compressed_stream + 4))(*(_QWORD *)compressed_stream, v11, v12, v10);
    if (v13 < 0)
      goto LABEL_13;
    if (!v13)
      break;
    v11 = (__int16 *)((char *)v11 + v13);
    v9 += v13;
    v10 += v13;
    v12 -= v13;
  }
  while (v12);
  if (v9 != 12)
    goto LABEL_13;
  if (v86 != 25200 || v87 != 122)
  {
    v15 = "Invalid stream magic";
    v16 = 316;
    goto LABEL_15;
  }
  if (v88 <= 100)
  {
    switch(v88)
    {
      case '-':
        v30 = 0;
        v79 = 0x100000000;
        break;
      case '4':
        v79 = 0;
        v30 = 256;
        break;
      case 'b':
        v79 = 0;
        v30 = 1794;
        break;
      default:
        goto LABEL_60;
    }
  }
  else if (v88 > 119)
  {
    if (v88 == 120)
    {
      v30 = 774;
      v79 = 1;
    }
    else
    {
      if (v88 != 122)
        goto LABEL_60;
      v79 = 0;
      v30 = 1285;
    }
  }
  else
  {
    if (v88 != 101)
    {
      if (v88 == 102)
      {
        v79 = 0;
        v30 = 2304;
        goto LABEL_37;
      }
LABEL_60:
      v15 = "Invalid stream compression key";
      v16 = 317;
      goto LABEL_15;
    }
    v79 = 0;
    v30 = 2049;
  }
LABEL_37:
  algorithm = v30;
  v31 = bswap64(v89);
  __size = v31;
  if (v8 >= 13)
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 12;
LABEL_39:
    v80 = v33;
    if (*((_QWORD *)compressed_stream + 4))
    {
      v36 = v34;
      v37 = v32;
      v38 = 0;
      v39 = &v84;
      v40 = v35;
      v41 = 16;
      while (1)
      {
        v42 = (*((uint64_t (**)(_QWORD, unint64_t *, uint64_t, uint64_t))compressed_stream + 4))(*(_QWORD *)compressed_stream, v39, v41, v40);
        if (v42 < 0)
          break;
        if (v42)
        {
          v39 = (unint64_t *)((char *)v39 + v42);
          v38 += v42;
          v40 += v42;
          v41 -= v42;
          if (v41)
            continue;
        }
        if ((v38 & 0x8000000000000000) != 0)
          break;
        if (!v38)
        {
          v32 = v37;
          v31 = __size;
          v33 = v80;
          goto LABEL_53;
        }
        v31 = __size;
        if (v38 <= 0xF)
        {
          v15 = "Truncated stream";
          v16 = 329;
          goto LABEL_15;
        }
        v43 = v85;
        v32 = bswap64(v84);
        v33 = bswap64(v85);
        v84 = v32;
        v85 = v33;
        if (v32 < v33 || v32 - 1 >= __size || !v43)
        {
          v15 = "Corrupted stream";
          v16 = 339;
          goto LABEL_15;
        }
        v36 = v35;
        v35 += v33 + 16;
        v34 = v36;
        if (v35 < v8)
          goto LABEL_39;
        goto LABEL_53;
      }
    }
    v15 = "reading block header";
    v16 = 327;
    goto LABEL_15;
  }
  v36 = 0;
  v33 = 0;
  v32 = 0;
  v35 = 12;
LABEL_53:
  if (v35 != v8)
  {
    v15 = "Corrupted stream";
    v16 = 342;
    goto LABEL_15;
  }
  if (v32 >= v31)
  {
    v17 = 0;
    v18 = 0;
    v49 = algorithm;
  }
  else
  {
    if (v31 >= 0x2000000001)
    {
      *__error() = 12;
      v17 = 0;
      v18 = 0;
      *__error() = 12;
LABEL_57:
      v44 = *__error();
      v47 = "malloc";
      v48 = 349;
LABEL_105:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", v48, 19, v44, v47, v45, v46, v78);
      goto LABEL_16;
    }
    v18 = (uint8_t *)malloc(v31);
    v55 = (uint8_t *)malloc(v31);
    v17 = v55;
    if (!v18 || !v55)
      goto LABEL_57;
    v81 = v36;
    if (*((_QWORD *)compressed_stream + 4))
    {
      v56 = v32;
      v57 = v33;
      if (v33)
      {
        v58 = 0;
        v59 = v36 + 16;
        v60 = v55;
        v61 = v57;
        while (1)
        {
          v62 = (*((uint64_t (**)(_QWORD, uint8_t *, size_t, uint64_t))compressed_stream + 4))(*(_QWORD *)compressed_stream, v60, v57, v59);
          if (v62 < 0)
            break;
          if (v62)
          {
            v60 += v62;
            v58 += v62;
            v59 += v62;
            v57 -= v62;
            if (v57)
              continue;
          }
          goto LABEL_100;
        }
        v58 = v62;
      }
      else
      {
        v61 = 0;
        v58 = 0;
      }
    }
    else
    {
      v61 = v33;
      v56 = v32;
      v58 = -1;
    }
LABEL_100:
    if (v58 != v61)
    {
      v47 = "loading last block";
      v48 = 352;
      goto LABEL_104;
    }
    v32 = v56;
    if (((v61 != v56) & ~HIDWORD(v79)) != 0)
    {
      v31 = __size;
      v8 = v81;
      if ((_DWORD)v79)
      {
        v73 = PCompressLZMADecode(v18, __size, v17, v61);
        v74 = v73 & ~(v73 >> 63);
        v49 = algorithm;
      }
      else
      {
        v49 = algorithm;
        v74 = compression_decode_buffer(v18, __size, v17, v61, 0, algorithm);
      }
      if (v74 != v32)
      {
        v47 = "Last block decompression";
        v48 = 369;
        goto LABEL_104;
      }
    }
    else
    {
      memcpy(v18, v17, v56);
      v49 = algorithm;
      v31 = __size;
      v8 = v81;
    }
    if ((AAByteStreamTruncate(compressed_stream) & 0x80000000) != 0)
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", 375, 19, "Warning: container truncate failed", v75, v76, v77, v78);
  }
  if (AAByteStreamSeek(compressed_stream, v8, 0) < 0)
  {
    v47 = "Stream seek";
    v48 = 380;
LABEL_104:
    v44 = 0;
    goto LABEL_105;
  }
  v20 = calloc(1uLL, 0x68uLL);
  if (!v20)
  {
    v63 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", 384, 19, *v63, "malloc", v64, v65, v78);
    v19 = 0;
    goto LABEL_17;
  }
  v19 = (unsigned int *)calloc(1uLL, 0x30uLL);
  if (!v19)
  {
    v66 = *__error();
    v67 = "malloc";
    v68 = 386;
LABEL_98:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c", (uint64_t)"AACompressionOutputStreamOpenExisting", v68, 19, v66, v67, v52, v53, v78);
    goto LABEL_17;
  }
  if (!n_threads)
    n_threads = getDefaultNThreads();
  v19[2] = n_threads;
  v50 = calloc(n_threads, 8uLL);
  *((_QWORD *)v19 + 2) = v50;
  if (v19[2])
  {
    v51 = 0;
    while (1)
    {
      *(_QWORD *)(*((_QWORD *)v19 + 2) + 8 * v51) = CompressionWorkerDataCreate(v31, v49);
      v54 = *((_QWORD *)v19 + 2);
      if (!*(_QWORD *)(v54 + 8 * v51))
        break;
      ++v51;
      v50 = (void *)v19[2];
      if (v51 >= (unint64_t)v50)
        goto LABEL_88;
    }
    v67 = "Worker data allocation";
    v68 = 394;
    goto LABEL_97;
  }
  v54 = (uint64_t)v50;
  LODWORD(v50) = 0;
LABEL_88:
  v69 = ThreadPipelineCreate(v50, v54, (uint64_t)CompressionWorkerProc, (uint64_t)v19, (uint64_t)CompressionConsumerProc, 0);
  *(_QWORD *)v19 = v69;
  if (!v69)
  {
    v67 = "Thread allocation";
    v68 = 397;
LABEL_97:
    v66 = 0;
    goto LABEL_98;
  }
  *((_QWORD *)v19 + 3) = compressed_stream;
  if (v18 && aaCompressionOutputStreamWrite((uint64_t)v19, (uint64_t)v18, v32, v70, v71, v72, v52, v53) != v32)
  {
    v67 = "re-writing last block";
    v68 = 404;
    goto LABEL_97;
  }
  v21 = 0;
  v20[3] = aaCompressionOutputStreamWrite;
  v20[7] = aaCompressionOutputStreamAbort;
  *v20 = v19;
  v20[1] = aaCompressionOutputStreamClose;
  v20[9] = aaCompressionOutputStreamFlush;
LABEL_18:
  free(v18);
  free(v17);
  if (v21)
  {
    free(v20);
    aaCompressionOutputStreamClose((uint64_t *)v19, v22, v23, v24, v25, v26, v27, v28);
    return 0;
  }
  return (AAByteStream)v20;
}

void CompressionWorkerDataDestroy(void **a1)
{
  if (a1)
  {
    free(a1[3]);
    free(a1[4]);
    free(a1[6]);
    free(a1);
  }
}

_QWORD *aaSequentialDecompressionIStreamOpen(uint64_t a1, int a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  size_t v7;
  size_t v8;
  void *v9;
  void *v10;
  size_t v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  char v20;

  if (!a2)
    getDefaultNThreads();
  v3 = calloc(1uLL, 0x68uLL);
  v4 = malloc(0x160uLL);
  v5 = (uint64_t)v4;
  if (!v4 || (memset_s(v4, 0x160uLL, 0, 0x160uLL), !v3))
  {
    v16 = *__error();
    v17 = "malloc";
    v18 = 266;
LABEL_31:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASequentialDecompressionStream.c", (uint64_t)"aaSequentialDecompressionIStreamOpen", v18, 20, v16, v17, v14, v15, v20);
    free(v3);
    aaDecompressionStreamClose(v5);
    return 0;
  }
  *(_QWORD *)v5 = a1;
  *(_DWORD *)(v5 + 56) = -1;
  v6 = (_QWORD *)(v5 + 8);
  v7 = *(_QWORD *)(v5 + 16);
  if (!(v7 >> 16))
  {
    do
    {
      v8 = (v7 >> 1) + v7;
      if (((v7 >> 1) & v7) != 0)
        v8 = ((v7 >> 1) & v7) + v7;
      if (v7)
        v7 = v8;
      else
        v7 = 0x4000;
    }
    while (v7 < 0x10000);
    v9 = *(void **)(v5 + 24);
    v10 = realloc(v9, v7);
    if (!v10)
      goto LABEL_29;
    *(_QWORD *)(v5 + 16) = v7;
    *(_QWORD *)(v5 + 24) = v10;
  }
  v11 = *(_QWORD *)(v5 + 40);
  if (v11 >> 16)
    goto LABEL_23;
  do
  {
    v12 = (v11 >> 1) + v11;
    if (((v11 >> 1) & v11) != 0)
      v12 = ((v11 >> 1) & v11) + v11;
    if (v11)
      v11 = v12;
    else
      v11 = 0x4000;
  }
  while (v11 < 0x10000);
  v9 = *(void **)(v5 + 48);
  v13 = realloc(v9, v11);
  if (!v13)
  {
    v6 = (_QWORD *)(v5 + 32);
LABEL_29:
    free(v9);
    *v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    v17 = "allocating buffer";
    v18 = 273;
    goto LABEL_30;
  }
  *(_QWORD *)(v5 + 40) = v11;
  *(_QWORD *)(v5 + 48) = v13;
LABEL_23:
  if (aaDecompressionStreamRefill(v5, 0xCuLL) < 0)
  {
    v17 = "reading magic";
    v18 = 276;
LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  __memcpy_chk();
  if (*(_DWORD *)(v5 + 56) == -1)
    *(_DWORD *)(v5 + 56) = 0;
  *v3 = v5;
  v3[1] = aaDecompressionStreamClose;
  v3[2] = aaDecompressionStreamRead;
  v3[7] = aaDecompressionStreamAbort;
  return v3;
}

uint64_t aaDecompressionStreamRefill(uint64_t a1, size_t a2)
{
  size_t v2;
  uint64_t v4;
  AAByteStream_impl *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  void *v13;
  size_t v14;
  ssize_t v15;

  if (!a2)
    return 0;
  v2 = a2;
  v4 = 0;
  v6 = (unint64_t *)(a1 + 8);
  v5 = *(AAByteStream_impl **)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  while (1)
  {
    if (v8 != v7)
      goto LABEL_14;
    v9 = v7 + 0x40000;
    if ((uint64_t)(v7 + 0x40000) < 0)
      return -1;
    if (v7 <= 0xFFFFFFFFFFFBFFFFLL)
      break;
    v8 = v7;
LABEL_14:
    v11 = v7;
LABEL_18:
    if (v11 - v8 >= v2)
      v14 = v2;
    else
      v14 = v11 - v8;
    v15 = AAByteStreamRead(v5, (void *)(*(_QWORD *)(a1 + 24) + v8), v14);
    if (v15 < 0)
      return -1;
    if (!v15)
      return v4;
    v8 = *v6 + v15;
    if (__CFADD__(*v6, v15))
      return -1;
    v7 = *(_QWORD *)(a1 + 16);
    if (v8 > v7)
      return -1;
    *v6 = v8;
    v4 += v15;
    v2 -= v15;
    if (!v2)
      return v4;
  }
  do
  {
    while (!v7)
    {
      v7 = 0x4000;
      v11 = 0x4000;
      if (v9 <= 0x4000)
        goto LABEL_16;
    }
    v10 = v7 >> 1;
    if ((v7 & (v7 >> 1)) != 0)
      v10 = v7 & (v7 >> 1);
    v7 += v10;
  }
  while (v7 < v9);
  v11 = v7;
  if (v7 >= 0x2000000001)
  {
    *__error() = 12;
    goto LABEL_32;
  }
LABEL_16:
  v12 = *(void **)(a1 + 24);
  v13 = realloc(v12, v11);
  if (v13)
  {
    *(_QWORD *)(a1 + 16) = v11;
    *(_QWORD *)(a1 + 24) = v13;
    v8 = *(_QWORD *)(a1 + 8);
    goto LABEL_18;
  }
  free(v12);
LABEL_32:
  *v6 = 0;
  v6[1] = 0;
  v4 = -1;
  v6[2] = 0;
  return v4;
}

size_t aaDecompressionStreamReadInput(uint64_t a1, uint64_t a2, size_t nbyte)
{
  size_t v3;
  uint64_t v6;
  size_t v7;
  size_t v8;
  unint64_t v9;
  size_t v10;
  ssize_t v11;

  if (nbyte)
  {
    v3 = nbyte;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a1 + 8);
      if (v7)
      {
        if (v3 >= v7)
          v8 = *(_QWORD *)(a1 + 8);
        else
          v8 = v3;
        memcpy((void *)(a2 + v6), *(const void **)(a1 + 24), v8);
        if ((v8 & 0x8000000000000000) != 0)
          return v8;
        v9 = *(_QWORD *)(a1 + 8);
        v10 = v9 - v8;
        if (v9 >= v8)
        {
          if (v9 != v8)
            memmove(*(void **)(a1 + 24), (const void *)(*(_QWORD *)(a1 + 24) + v8), v9 - v8);
          *(_QWORD *)(a1 + 8) = v10;
        }
      }
      else
      {
        if (*(_DWORD *)(a1 + 60))
          return v6;
        v11 = AAByteStreamRead(*(AAByteStream *)a1, (void *)(a2 + v6), v3);
        v8 = v11;
        if (v11 < 0)
          return v8;
        if (!v11)
        {
          *(_DWORD *)(a1 + 60) = 1;
          return v6;
        }
      }
      v6 += v8;
      v3 -= v8;
      if (!v3)
        return v6;
    }
  }
  return 0;
}

uint64_t aaDecompressionStreamClose(uint64_t a1)
{
  int v2;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 56);
    switch(v2)
    {
      case 2:
        compression_stream_destroy((compression_stream *)(a1 + 312));
        break;
      case 4:
        BZ2_bzDecompressEnd((bz_stream *)(a1 + 96));
        break;
      case 3:
        lzma_end();
        break;
    }
    IDecoderStreamDestroy(*(_QWORD **)(a1 + 72));
    free(*(void **)(a1 + 24));
    memset_s((void *)(a1 + 8), 0x18uLL, 0, 0x18uLL);
    free(*(void **)(a1 + 48));
    memset_s((void *)(a1 + 32), 0x18uLL, 0, 0x18uLL);
    free((void *)a1);
  }
  return 0;
}

size_t aaDecompressionStreamRead(uint64_t a1, uint64_t a2, size_t nbyte, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;
  size_t v10;
  uint64_t v13;
  int v14;
  int v15;
  size_t v16;
  size_t v17;
  unint64_t v18;
  size_t v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  AAByteStream_impl *v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  void *v27;
  void *v28;
  size_t v29;
  ssize_t v30;
  uint64_t v31;
  unint64_t *v32;
  size_t v33;
  _BYTE *v34;
  unint64_t v35;
  size_t v36;
  unint64_t v37;
  size_t v38;
  unint64_t v40;
  unint64_t v41;
  compression_status v42;
  compression_status v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  size_t v48;
  uint64_t v49;
  size_t v50;
  unsigned int v52;
  unsigned int v53;
  int v54;
  unint64_t *v55;
  _BYTE *v56;
  unint64_t v57;
  size_t v58;
  uint64_t v59;
  unint64_t v60;
  int v62;
  int v63;
  int v64;
  unint64_t *v65;
  _BYTE *v66;
  unint64_t v67;
  size_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v72;
  uint64_t v73;
  BOOL v74;
  size_t v75;
  const char *v76;
  __int16 v77;
  char v78;
  int v79;
  size_t v80;
  size_t v81;
  size_t v82;
  unint64_t *v83;

  if (*(_DWORD *)(a1 + 68))
    return -1;
  v10 = nbyte;
  v13 = *(_QWORD *)(a1 + 72);
  if (v13)
    return IDecoderStreamRead(v13, a2, nbyte);
  v14 = *(_DWORD *)(a1 + 56);
  if (v14 == -1)
    return -1;
  if (!v14)
    return aaDecompressionStreamReadInput(a1, a2, nbyte);
  if (!nbyte)
    return 0;
  v15 = 0;
  v16 = 0;
  v83 = (unint64_t *)(a1 + 8);
LABEL_11:
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
  {
    if (v10 >= v17)
      v8 = *(_QWORD *)(a1 + 32);
    else
      v8 = v10;
    memcpy((void *)(a2 + v16), *(const void **)(a1 + 48), v8);
    if ((v8 & 0x8000000000000000) == 0)
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = v18 - v8;
      if (v18 >= v8)
      {
        if (v18 != v8)
          memmove(*(void **)(a1 + 48), (const void *)(*(_QWORD *)(a1 + 48) + v8), v18 - v8);
        *(_QWORD *)(a1 + 32) = v19;
      }
      v16 += v8;
      v10 -= v8;
      goto LABEL_137;
    }
    return v8;
  }
  if (*(_DWORD *)(a1 + 64))
    return v16;
  v21 = *(_QWORD *)(a1 + 8);
  v20 = *(_QWORD *)(a1 + 16);
  if (v20 == v21)
    goto LABEL_53;
  if (*(_DWORD *)(a1 + 60))
    goto LABEL_52;
  v22 = v20 - v21;
  if (v20 == v21)
    goto LABEL_51;
  v8 = 0;
  v23 = *(AAByteStream_impl **)a1;
  while (1)
  {
    if (v21 != v20)
      goto LABEL_37;
    v24 = v20 + 0x40000;
    if ((uint64_t)(v20 + 0x40000) < 0)
      goto LABEL_140;
    if (v20 > 0xFFFFFFFFFFFBFFFFLL)
    {
      v21 = v20;
LABEL_37:
      v26 = v20;
      goto LABEL_41;
    }
    do
    {
      while (!v20)
      {
        v20 = 0x4000;
        v26 = 0x4000;
        if (v24 <= 0x4000)
          goto LABEL_39;
      }
      v25 = v20 >> 1;
      if ((v20 & (v20 >> 1)) != 0)
        v25 = v20 & (v20 >> 1);
      v20 += v25;
    }
    while (v20 < v24);
    v26 = v20;
    if (v20 >= 0x2000000001)
    {
      *__error() = 12;
      goto LABEL_152;
    }
LABEL_39:
    v27 = *(void **)(a1 + 24);
    v28 = realloc(v27, v26);
    if (!v28)
      break;
    *(_QWORD *)(a1 + 16) = v26;
    *(_QWORD *)(a1 + 24) = v28;
    v21 = *(_QWORD *)(a1 + 8);
LABEL_41:
    if (v26 - v21 >= v22)
      v29 = v22;
    else
      v29 = v26 - v21;
    v30 = AAByteStreamRead(v23, (void *)(*(_QWORD *)(a1 + 24) + v21), v29);
    if (v30 < 0)
      goto LABEL_140;
    if (!v30)
      goto LABEL_49;
    v21 = *v83 + v30;
    if (__CFADD__(*v83, v30) || (v20 = *(_QWORD *)(a1 + 16), v21 > v20))
    {
LABEL_140:
      v8 = -1;
      goto LABEL_141;
    }
    *v83 = v21;
    v8 += v30;
    v22 -= v30;
    if (!v22)
    {
LABEL_49:
      if ((v8 & 0x8000000000000000) != 0)
        goto LABEL_141;
      if (!v8)
LABEL_51:
        *(_DWORD *)(a1 + 60) = 1;
LABEL_52:
      v21 = *v83;
LABEL_53:
      v32 = *(unint64_t **)(a1 + 24);
      v31 = *(_QWORD *)(a1 + 32);
      v33 = *(_QWORD *)(a1 + 40) - v31;
      v34 = (_BYTE *)(*(_QWORD *)(a1 + 48) + v31);
      switch(*(_DWORD *)(a1 + 56))
      {
        case 1:
          if (!v21)
          {
            if (!*(_DWORD *)(a1 + 60))
            {
LABEL_146:
              v76 = "truncated stream header";
              v77 = 208;
              goto LABEL_154;
            }
LABEL_120:
            *(_DWORD *)(a1 + 64) = 1;
            goto LABEL_136;
          }
          if (v21 <= 0xF)
            goto LABEL_146;
          v35 = v32[1];
          v36 = bswap64(*v32);
          v37 = bswap64(v35);
          v38 = *(_QWORD *)(a1 + 80);
          if (v36 > v38 || v37 > v38)
          {
            v76 = "corrupted stream header";
            v77 = 217;
            goto LABEL_154;
          }
          v79 = v15;
          v40 = v37 + 16;
          if (v37 + 16 > v21)
          {
            v76 = "truncated stream payload";
            v77 = 218;
            goto LABEL_154;
          }
          if (v36 > v33)
          {
            v76 = "unexpected output buffer size";
            v77 = 219;
            goto LABEL_154;
          }
          v41 = *v32;
          if (*v32 != v35)
          {
            if ((*(uint64_t (**)(_BYTE *, size_t, unint64_t *))(a1 + 88))(v34, v33, v32 + 2) == v36)
              goto LABEL_122;
            v76 = "block decompression failed";
            v77 = 229;
LABEL_154:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASequentialDecompressionStream.c", (uint64_t)"aaDecompressionStreamRead", v77, 20, 0, v76, a7, a8, v78);
            return -1;
          }
          memcpy(v34, v32 + 2, v36);
LABEL_122:
          if (v40)
          {
            v72 = *v83 - v40;
            if (*v83 >= v40)
            {
              if (*v83 != v40)
                memmove(*(void **)(a1 + 24), (const void *)(*(_QWORD *)(a1 + 24) + v40), *v83 - v40);
              *v83 = v72;
            }
          }
          if (v41)
          {
            v73 = *(_QWORD *)(a1 + 32);
            v74 = __CFADD__(v73, v36);
            v75 = v73 + v36;
            v15 = v79;
            if (!v74 && v75 <= *(_QWORD *)(a1 + 40))
              *(_QWORD *)(a1 + 32) = v75;
          }
          else
          {
            v15 = v79;
          }
LABEL_136:
          if (v15 >= 3)
          {
            v76 = "truncated stream";
            v77 = 240;
            goto LABEL_154;
          }
LABEL_137:
          v8 = v16;
          if (!v10)
            return v8;
          break;
        case 2:
          *(_QWORD *)(a1 + 328) = v32;
          *(_QWORD *)(a1 + 336) = v21;
          *(_QWORD *)(a1 + 312) = v34;
          *(_QWORD *)(a1 + 320) = v33;
          v42 = compression_stream_process((compression_stream *)(a1 + 312), *(_DWORD *)(a1 + 60) != 0);
          if (v42 < 0)
          {
            v76 = "decoding compression payload";
            v77 = 162;
            goto LABEL_154;
          }
          v43 = v42;
          v44 = v15;
          v45 = *(_QWORD *)(a1 + 336);
          v46 = *(_QWORD *)(a1 + 320);
          v47 = v21 - v45;
          if (v21 != v45)
          {
            v48 = *v83 - v47;
            if (*v83 >= v47)
            {
              if (*v83 != v47)
              {
                v80 = *v83 - v47;
                memmove(*(void **)(a1 + 24), (const void *)(*(_QWORD *)(a1 + 24) + v47), v48);
                v48 = v80;
              }
              *v83 = v48;
            }
          }
          if (v33 != v46)
          {
            v49 = *(_QWORD *)(a1 + 32);
            v50 = v49 + v33 - v46;
            if (!__CFADD__(v49, v33 - v46) && v50 <= *(_QWORD *)(a1 + 40))
              *(_QWORD *)(a1 + 32) = v50;
          }
          if (v33 == v46 && v21 == v45)
            v15 = v44 + 1;
          else
            v15 = 0;
          if (v43 != COMPRESSION_STATUS_END)
            goto LABEL_136;
          goto LABEL_120;
        case 3:
          *(_QWORD *)(a1 + 176) = v32;
          *(_QWORD *)(a1 + 184) = v21;
          *(_QWORD *)(a1 + 200) = v34;
          *(_QWORD *)(a1 + 208) = v33;
          v52 = lzma_code();
          v53 = v52;
          if (v52 <= 0xA && ((1 << v52) & 0x403) != 0)
          {
            v54 = v15;
            v55 = *(unint64_t **)(a1 + 176);
            v56 = *(_BYTE **)(a1 + 200);
            v57 = (char *)v55 - (char *)v32;
            if (v55 != v32)
            {
              v58 = *v83 - v57;
              if (*v83 >= v57)
              {
                if (*v83 != v57)
                {
                  v81 = *v83 - v57;
                  memmove(*(void **)(a1 + 24), (const void *)(*(_QWORD *)(a1 + 24) + v57), v58);
                  v58 = v81;
                }
                *v83 = v58;
              }
            }
            if (v56 != v34)
            {
              v59 = *(_QWORD *)(a1 + 32);
              v60 = v59 + v56 - v34;
              if (!__CFADD__(v59, v56 - v34) && v60 <= *(_QWORD *)(a1 + 40))
                *(_QWORD *)(a1 + 32) = v60;
            }
            if (v56 == v34 && v55 == v32)
              v15 = v54 + 1;
            else
              v15 = 0;
            if (v53 == 1)
              goto LABEL_120;
          }
          else
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASequentialDecompressionStream.c", (uint64_t)"aaDecompressionStreamRead", 194, 20, 0, "decoding lzma payload", a7, a8, v78);
          }
          v8 = -1;
          if (v53 <= 0xA && ((1 << v53) & 0x403) != 0)
            goto LABEL_136;
          return v8;
        case 4:
          *(_QWORD *)(a1 + 96) = v32;
          *(_DWORD *)(a1 + 104) = v21;
          *(_QWORD *)(a1 + 120) = v34;
          *(_DWORD *)(a1 + 128) = v33;
          v62 = BZ2_bzDecompress((bz_stream *)(a1 + 96));
          if (v62 < 0)
          {
            v76 = "decoding bzip2 payload";
            v77 = 178;
            goto LABEL_154;
          }
          v63 = v62;
          v64 = v15;
          v65 = *(unint64_t **)(a1 + 96);
          v66 = *(_BYTE **)(a1 + 120);
          v67 = (char *)v65 - (char *)v32;
          if (v65 != v32)
          {
            v68 = *v83 - v67;
            if (*v83 >= v67)
            {
              if (*v83 != v67)
              {
                v82 = *v83 - v67;
                memmove(*(void **)(a1 + 24), (const void *)(*(_QWORD *)(a1 + 24) + v67), v68);
                v68 = v82;
              }
              *v83 = v68;
            }
          }
          if (v66 != v34)
          {
            v69 = *(_QWORD *)(a1 + 32);
            v70 = v69 + v66 - v34;
            if (!__CFADD__(v69, v66 - v34) && v70 <= *(_QWORD *)(a1 + 40))
              *(_QWORD *)(a1 + 32) = v70;
          }
          if (v66 == v34 && v65 == v32)
            v15 = v64 + 1;
          else
            v15 = 0;
          if (v63 != 4)
            goto LABEL_136;
          goto LABEL_120;
        default:
          return -1;
      }
      goto LABEL_11;
    }
  }
  free(v27);
LABEL_152:
  *v83 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v8 = -1;
  *(_QWORD *)(a1 + 24) = 0;
LABEL_141:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASequentialDecompressionStream.c", (uint64_t)"aaDecompressionStreamRead", 144, 20, 0, "stream read failed", a7, a8, v78);
  return v8;
}

size_t aaDecompressionStreamAbort(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t result;

  *(_DWORD *)(a1 + 68) = 1;
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return IDecoderStreamAbort(result, a2, a3, a4, a5, a6, a7, a8, a9);
  return result;
}

uint64_t jsonPushLabel(uint64_t a1, char a2)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _BYTE *v7;
  size_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = (_QWORD *)(a1 + 72);
  if (v5 >= v4)
  {
    if (v4)
      v8 = v4 + (v4 >> 1);
    else
      v8 = 256;
    *(_QWORD *)(a1 + 72) = v8;
    v7 = reallocf(*(void **)(a1 + 88), v8);
    *(_QWORD *)(a1 + 88) = v7;
    if (!v7)
    {
      v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushLabel", 358, 109, *v10, "malloc", v11, v12, v14);
      *v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    v5 = *(_QWORD *)(a1 + 80);
  }
  else
  {
    v7 = *(_BYTE **)(a1 + 88);
  }
  v9 = 0;
  *(_QWORD *)(a1 + 80) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

uint64_t jsonPushValue(uint64_t a1, char a2)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _BYTE *v7;
  size_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = (_QWORD *)(a1 + 96);
  if (v5 >= v4)
  {
    if (v4)
      v8 = v4 + (v4 >> 1);
    else
      v8 = 256;
    *(_QWORD *)(a1 + 96) = v8;
    v7 = reallocf(*(void **)(a1 + 112), v8);
    *(_QWORD *)(a1 + 112) = v7;
    if (!v7)
    {
      v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushValue", 372, 109, *v10, "malloc", v11, v12, v14);
      *v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    v5 = *(_QWORD *)(a1 + 104);
  }
  else
  {
    v7 = *(_BYTE **)(a1 + 112);
  }
  v9 = 0;
  *(_QWORD *)(a1 + 104) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

_QWORD *AAJSONInputStreamOpen(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v2 = malloc(0x78uLL);
  v3 = v2;
  if (v2)
  {
    memset_s(v2, 0x78uLL, 0, 0x78uLL);
    v3[1] = a1;
    v3[5] = 0x10000;
    v4 = malloc(0x10000uLL);
    v3[8] = v4;
    if (v4)
    {
      *(_QWORD *)((char *)v3 + 20) = 32;
      v3[4] = calloc(0x20uLL, 4uLL);
    }
    else
    {
      v8 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 387, 109, *v8, "malloc", v9, v10, v12);
      AAJSONInputStreamClose((void **)v3);
      return 0;
    }
  }
  else
  {
    v5 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 382, 109, *v5, "malloc", v6, v7, v12);
  }
  return v3;
}

void AAJSONInputStreamClose(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1[11]);
    free(a1[14]);
    free(a1[8]);
    free(a1);
  }
}

uint64_t AAJSONInputStreamRead(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unsigned __int8 *v16;
  ssize_t v17;
  int v18;
  char v19;
  unsigned __int8 v20;
  unint64_t v21;
  char v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  const char *v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  int v37;
  uint64_t v38;
  int v39;
  const char *v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;

  if (atomic_load((unsigned int *)a1))
    return 0xFFFFFFFFLL;
  v10 = *(_DWORD *)(a1 + 16);
  if (v10 == 9 || v10 == -1)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 418, 109, 0, "unexpected read call", a7, a8, v46);
    return 0xFFFFFFFFLL;
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  v14 = MEMORY[0x24BDAC740];
  while (2)
  {
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(unsigned __int8 **)(a1 + 64);
    if (v15 >= *(_QWORD *)(a1 + 48))
    {
      v17 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), v16, *(_QWORD *)(a1 + 40));
      if (v17 < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 430, 109, 0, "read error: %zd", a7, a8, v17);
LABEL_104:
        result = 0xFFFFFFFFLL;
        *(_DWORD *)(a1 + 16) = -1;
        return result;
      }
      if (!v17)
      {
        v30 = "EOF reached";
        v31 = 431;
        goto LABEL_103;
      }
      v15 = 0;
      *(_QWORD *)(a1 + 48) = v17;
      v16 = *(unsigned __int8 **)(a1 + 64);
    }
    *(_QWORD *)(a1 + 56) = v15 + 1;
    v18 = v16[v15];
    v19 = v16[v15];
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        *(_QWORD *)(a1 + 104) = 0;
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL))
            continue;
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if (v18 == 34)
          goto LABEL_68;
        if (v18 == 43 || v18 == 45 || ((char)v18 - 48) <= 9)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            v23 = 3;
            goto LABEL_69;
          }
          v30 = "jsonPushValue";
          v31 = 451;
          goto LABEL_103;
        }
        if (v18 == 123)
        {
          v32 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v32 == *(_DWORD *)(a1 + 20))
          {
            v30 = "max level reached";
            v31 = 465;
            goto LABEL_103;
          }
          v27 = 0;
          v44 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v32 + 1;
          *(_DWORD *)(v44 + 4 * v32) = 0;
          v37 = 6;
          goto LABEL_125;
        }
        if (v18 == 91)
        {
          v33 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v33 == *(_DWORD *)(a1 + 20))
          {
            v30 = "max level reached";
            v31 = 457;
            goto LABEL_103;
          }
          v37 = 0;
          v45 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v33 + 1;
          v27 = 1;
          *(_DWORD *)(v45 + 4 * v33) = 1;
          goto LABEL_125;
        }
        if (((char)v18 - 97) <= 0x19)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            v23 = 4;
            goto LABEL_69;
          }
          v30 = "jsonPushValue";
          v31 = 473;
          goto LABEL_103;
        }
        v25 = *(_DWORD *)(a1 + 24) - 1;
        v34 = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25) & 1) == 0 || (char)v18 != 93;
        v35 = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25) & 1) == 0 && (char)v18 == 125;
        if (v34 && !v35)
          goto LABEL_102;
        goto LABEL_121;
      case 1:
        if (v18 == 92)
        {
          v23 = 2;
          goto LABEL_69;
        }
        if (v18 == 34)
        {
          *(_DWORD *)(a1 + 16) = 5;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            v27 = 3;
            goto LABEL_126;
          }
          v30 = "jsonPushValue";
          v31 = 499;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 503;
          goto LABEL_103;
        }
        continue;
      case 2:
        HIDWORD(v21) = (char)v18;
        LODWORD(v21) = ((char)v18 << 24) - 1644167168;
        v20 = v21 >> 25;
        if (v20 < 0xAu && ((0x341u >> v20) & 1) != 0)
        {
          v22 = byte_20A40C289[(char)v20];
        }
        else if ((char)v18 == 102)
        {
          v22 = 12;
        }
        else
        {
          v22 = v19;
        }
        if ((jsonPushValue(a1, v22) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 512;
          goto LABEL_103;
        }
LABEL_68:
        v23 = 1;
        goto LABEL_69;
      case 3:
        if (((char)v18 - 48) > 9)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(_QWORD *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            v27 = 4;
            goto LABEL_126;
          }
          v30 = "jsonPushValue";
          v31 = 539;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 533;
          goto LABEL_103;
        }
        continue;
      case 4:
        if (((char)v18 - 97) > 0x19)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(_QWORD *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            v28 = *(const char **)(a1 + 112);
            if (!strcmp(v28, "false") || !strcmp(v28, "true"))
            {
              v27 = 6;
            }
            else
            {
              if (strcmp(v28, "null"))
                goto LABEL_102;
              v27 = 7;
            }
            goto LABEL_126;
          }
          v30 = "jsonPushValue";
          v31 = 524;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 519;
          goto LABEL_103;
        }
        continue;
      case 5:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL))
            continue;
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        v24 = *(_DWORD *)(a1 + 24);
        if (!v24)
        {
          v30 = "invalid JSON state";
          v31 = 546;
          goto LABEL_103;
        }
        v25 = v24 - 1;
        v26 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25);
        if (v18 != 44)
        {
          if (v18 == 93)
          {
            if ((v26 & 1) != 0)
              goto LABEL_121;
            v19 = 93;
          }
          else if (v18 == 125)
          {
            goto LABEL_91;
          }
LABEL_102:
          v46 = v19;
          v30 = "invalid char %c %s";
          v31 = 610;
          goto LABEL_103;
        }
        if ((v26 & 1) != 0)
          v23 = 0;
        else
          v23 = 6;
LABEL_69:
        *(_DWORD *)(a1 + 16) = v23;
        continue;
      case 6:
        *(_QWORD *)(a1 + 80) = 0;
        if (((char)v18 & 0x80000000) == 0)
        {
          if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) == 0)
            goto LABEL_61;
          continue;
        }
        if (__maskrune((char)v18, 0x4000uLL))
          continue;
LABEL_61:
        if (v18 == 34)
        {
          v23 = 7;
          goto LABEL_69;
        }
        if (v18 != 125)
          goto LABEL_102;
        v29 = *(_DWORD *)(a1 + 24);
        if (!v29)
          goto LABEL_92;
        v25 = v29 - 1;
        v26 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25);
LABEL_91:
        if ((v26 & 1) != 0)
        {
LABEL_92:
          v19 = 125;
          goto LABEL_102;
        }
LABEL_121:
        *(_DWORD *)(a1 + 24) = v25;
        if (v25)
          v37 = 5;
        else
          v37 = 9;
        v27 = 2;
LABEL_125:
        *(_DWORD *)(a1 + 16) = v37;
LABEL_126:
        if (a2)
          memset_s(a2, 0x38uLL, 0, 0x38uLL);
        *a2 = v27;
        v38 = *(_QWORD *)(a1 + 80);
        if (v38)
          v38 = *(_QWORD *)(a1 + 88);
        *((_QWORD *)a2 + 1) = v38;
        a2[12] = *(_DWORD *)(a1 + 24);
        if (v27 == 6)
        {
          v39 = strcmp(*(const char **)(a1 + 112), "true");
          result = 0;
          a2[9] = v39 == 0;
        }
        else if (v27 == 4)
        {
          v40 = *(const char **)(a1 + 112);
          if (*v40 == 45)
          {
            v41 = strtoull(v40 + 1, 0, 10);
            result = 0;
            *((_QWORD *)a2 + 3) = v41;
            v42 = -1;
          }
          else
          {
            v43 = strtoull(v40, 0, 0);
            result = 0;
            *((_QWORD *)a2 + 3) = v43;
            v42 = v43 != 0;
          }
          a2[8] = v42;
        }
        else
        {
          result = 0;
          if (v27 == 3)
            *((_QWORD *)a2 + 2) = *(_QWORD *)(a1 + 112);
        }
        return result;
      case 7:
        if ((char)v18 == 34)
        {
          if ((jsonPushLabel(a1, 0) & 0x80000000) == 0)
          {
            v23 = 8;
            goto LABEL_69;
          }
          v30 = "jsonPushLabel";
          v31 = 587;
LABEL_103:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", v31, 109, 0, v30, a7, a8, v46);
          goto LABEL_104;
        }
        if ((jsonPushLabel(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushLabel";
          v31 = 591;
          goto LABEL_103;
        }
        continue;
      case 8:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL))
            continue;
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if ((char)v18 != 58)
          goto LABEL_102;
        v23 = 0;
        goto LABEL_69;
      default:
        goto LABEL_102;
    }
  }
}

unsigned int *ThreadPoolCreate(unsigned int a1, uint64_t a2, uint64_t a3)
{
  unsigned int *v6;
  unsigned int *v7;
  void *v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  __int16 v20;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v6 = (unsigned int *)calloc(1uLL, 0xA8uLL);
  v7 = v6;
  if (v6)
  {
    *v6 = a1;
    v8 = calloc(a1, 0xA8uLL);
    *((_QWORD *)v7 + 1) = v8;
    if (v8)
    {
      v9 = *v7;
      v7[8] = 0;
      v7[9] = v9;
      v10 = calloc(v9, 4uLL);
      *((_QWORD *)v7 + 5) = v10;
      if (v10)
      {
        if (pthread_mutex_init((pthread_mutex_t *)(v7 + 12), 0))
        {
          v14 = "SharedArrayInit: pthread_mutex_init failed\n";
          v15 = 56;
        }
        else
        {
          if (!pthread_cond_init((pthread_cond_t *)(v7 + 28), 0))
          {
            v7[4] = -1;
            if (!*v7)
              return v7;
            v22 = 0;
            v23 = 0;
            while (1)
            {
              v24 = *((_QWORD *)v7 + 1);
              v25 = v24 + v22;
              *(_QWORD *)(v25 + 16) = v7;
              *(_DWORD *)(v25 + 8) = v23;
              *(_QWORD *)(v25 + 24) = *(_QWORD *)(a2 + 8 * v23);
              *(_QWORD *)(v25 + 32) = a3;
              *(_DWORD *)(v25 + 40) = 0;
              if (pthread_mutex_init((pthread_mutex_t *)(v24 + v22 + 48), 0)
                || pthread_cond_init((pthread_cond_t *)(v25 + 112), 0))
              {
                v19 = "SemInit";
                v20 = 115;
                goto LABEL_12;
              }
              if ((createThread((pthread_t *)(v24 + v22), (uint64_t)threadPoolWorkerThreadProc, v24 + v22, 0) & 0x80000000) != 0)
                break;
              ++v23;
              v22 += 168;
              if (v23 >= *v7)
                return v7;
            }
            v19 = "Thread creation";
            v20 = 116;
            goto LABEL_12;
          }
          v14 = "SharedArrayInit: pthread_cond_init failed\n";
          v15 = 57;
        }
      }
      else
      {
        v14 = "SharedArrayInit: malloc failed\n";
        v15 = 55;
      }
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayInit", v15, 0, v14, v11, v12, v13, v26);
      v19 = "SharedArrayInit";
      v20 = 104;
LABEL_12:
      v16 = 0;
      goto LABEL_13;
    }
    v16 = *__error();
    v19 = "malloc";
    v20 = 103;
  }
  else
  {
    v16 = *__error();
    v19 = "malloc";
    v20 = 98;
  }
LABEL_13:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolCreate", v20, 90, v16, v19, v17, v18, v26);
  ThreadPoolDestroy((uint64_t)v7);
  return 0;
}

uint64_t threadPoolWorkerThreadProc(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  __int16 v12;
  unsigned int *v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  char v25;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_DWORD *)(a1 + 8);
  if (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48)))
  {
LABEL_2:
    v7 = "SharedArrayPush: pthread_mutex_lock failed\n";
    v8 = 117;
  }
  else
  {
    v13 = (unsigned int *)(v2 + 160);
    while (1)
    {
      v14 = *(unsigned int *)(v2 + 32);
      v15 = *(_DWORD *)(v2 + 36);
      v16 = v14;
      if (v14 < v15)
      {
        *(_DWORD *)(*(_QWORD *)(v2 + 40) + 4 * v14) = v3;
        v16 = *(_DWORD *)(v2 + 32);
      }
      *(_DWORD *)(v2 + 32) = v16 + 1;
      if (!v16)
      {
        if (pthread_cond_broadcast((pthread_cond_t *)(v2 + 112)))
          break;
      }
      if (pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48)))
      {
        v7 = "SharedArrayPush: pthread_mutex_unlock failed\n";
        v8 = 124;
        goto LABEL_3;
      }
      if (v14 >= v15)
      {
        v7 = "SharedArrayPush: stack is full\n";
        v8 = 125;
        goto LABEL_3;
      }
      if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48)))
        goto LABEL_23;
      while (1)
      {
        v17 = *(_DWORD *)(a1 + 40);
        if (v17 > 0)
          break;
        if (pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)(a1 + 48)))
          goto LABEL_23;
      }
      *(_DWORD *)(a1 + 40) = v17 - 1;
      if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48)))
      {
LABEL_23:
        v11 = "SemAcquire";
        v12 = 59;
        goto LABEL_24;
      }
      v18 = *(_QWORD *)(a1 + 160);
      if (v18 != -2)
      {
        if (v18 < 0)
          return a1;
        if (((*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24)) & 0x80000000) != 0)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"threadPoolWorkerThreadProc", 72, 90, 0, "worker proc reported an error", v19, v20, v25);
          do
            v21 = __ldxr(v13);
          while (__stxr(v21 + 1, v13));
        }
      }
      v3 = *(_DWORD *)(a1 + 8);
      if (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48)))
        goto LABEL_2;
    }
    v7 = "SharedArrayPush: pthread_cond_broadcast failed\n";
    v8 = 122;
  }
LABEL_3:
  pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPush", v8, 0, v7, v4, v5, v6, v25);
  v11 = "SharedArrayPush";
  v12 = 56;
LABEL_24:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"threadPoolWorkerThreadProc", v12, 90, 0, v11, v9, v10, v25);
  v22 = (unsigned int *)(v2 + 160);
  do
    v23 = __ldxr(v22);
  while (__stxr(v23 + 1, v22));
  return a1;
}

uint64_t ThreadPoolDestroy(uint64_t result)
{
  unsigned int *v1;
  uint64_t *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  pthread_cond_t *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  char v35;
  char v36;

  if (result)
  {
    v1 = (unsigned int *)result;
    v2 = *(uint64_t **)(result + 8);
    if (v2)
    {
      v3 = *(unsigned int *)result;
      if (!(_DWORD)v3)
      {
        v7 = 1;
        goto LABEL_37;
      }
      v4 = 0;
      do
      {
        v5 = *v2;
        v2 += 21;
        if (v5)
          ++v4;
        --v3;
      }
      while (v3);
      if (v4)
      {
        v6 = 0;
        v7 = 1;
        while (1)
        {
          if (pthread_mutex_lock((pthread_mutex_t *)(v1 + 12)))
          {
            v11 = 91;
            v12 = "SharedArrayPop: pthread_mutex_lock failed\n";
LABEL_15:
            pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", v11, 0, v12, v8, v9, v10, v35);
            v16 = -1;
          }
          else
          {
            while (1)
            {
              v13 = v1[8];
              if (v13)
                break;
              if (pthread_cond_wait((pthread_cond_t *)(v1 + 28), (pthread_mutex_t *)(v1 + 12)))
              {
                v11 = 94;
                v12 = "SharedArrayPop: pthread_cond_wait failed\n";
                goto LABEL_15;
              }
            }
            v23 = v13 - 1;
            v1[8] = v23;
            v16 = *(_DWORD *)(*((_QWORD *)v1 + 5) + 4 * v23);
            if (!pthread_mutex_unlock((pthread_mutex_t *)(v1 + 12)))
              goto LABEL_17;
            pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", 98, 0, "SharedArrayPop: pthread_mutex_unlock failed\n", v24, v25, v26, v35);
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 147, 90, 0, "SharedArrayPop", v14, v15, v36);
          v7 = 0;
LABEL_17:
          v17 = *((_QWORD *)v1 + 1);
          v18 = v17 + 168 * v16;
          *(_QWORD *)(v18 + 160) = -1;
          if (pthread_mutex_lock((pthread_mutex_t *)(v18 + 48))
            || (v21 = v17 + 168 * v16, v22 = *(_DWORD *)(v21 + 40), *(_DWORD *)(v21 + 40) = v22 + 1, !v22)
            && pthread_cond_broadcast((pthread_cond_t *)(v17 + 168 * v16 + 112))
            || pthread_mutex_unlock((pthread_mutex_t *)(v18 + 48)))
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 155, 90, 0, "SemRelease", v19, v20, v35);
            v7 = 0;
          }
          if ((joinThread(*(_opaque_pthread_t **)v18) & 0x80000000) != 0)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 156, 90, 0, "joinThread", v27, v28, v35);
            v7 = 0;
          }
          *(_QWORD *)v18 = 0;
          if (++v6 == v4)
          {
            if (!*v1)
              goto LABEL_37;
            goto LABEL_33;
          }
        }
      }
      v7 = 1;
LABEL_33:
      v29 = 0;
      v30 = 112;
      do
      {
        v31 = (pthread_cond_t *)(*((_QWORD *)v1 + 1) + v30);
        if (!pthread_mutex_destroy((pthread_mutex_t *)&v31[-2].__opaque[24]))
          pthread_cond_destroy(v31);
        ++v29;
        v30 += 168;
      }
      while (v29 < *v1);
LABEL_37:
      free(*((void **)v1 + 1));
      *((_QWORD *)v1 + 1) = 0;
    }
    else
    {
      v7 = 1;
    }
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 12)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 28)))
      free(*((void **)v1 + 5));
    v34 = atomic_load(v1 + 40);
    if (v34 >= 1)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolDestroy", 171, 90, 0, "Threads reported errors", v32, v33, v35);
      v7 = 0;
    }
    free(v1);
    if (v7)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t ThreadPoolGetWorker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v8;
  __int16 v9;
  pthread_mutex_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  __int16 v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  char v21;

  if (*(_DWORD *)(a1 + 16) != -1)
  {
    v8 = "Missing call to RunWorker before GetWorker";
    v9 = 182;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolGetWorker", v9, 90, 0, v8, a7, a8, v21);
    return 0;
  }
  v11 = (pthread_mutex_t *)(a1 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48)))
  {
    v15 = "SharedArrayPop: pthread_mutex_lock failed\n";
    v16 = 91;
LABEL_10:
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", v16, 0, v15, v12, v13, v14, v21);
    v8 = "SharedArrayPop failed";
    v9 = 186;
    goto LABEL_11;
  }
  while (1)
  {
    v17 = *(_DWORD *)(a1 + 32);
    if (v17)
      break;
    if (pthread_cond_wait((pthread_cond_t *)(a1 + 112), v11))
    {
      v15 = "SharedArrayPop: pthread_cond_wait failed\n";
      v16 = 94;
      goto LABEL_10;
    }
  }
  v18 = v17 - 1;
  *(_DWORD *)(a1 + 32) = v18;
  v19 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v18);
  if (pthread_mutex_unlock(v11))
  {
    v15 = "SharedArrayPop: pthread_mutex_unlock failed\n";
    v16 = 98;
    goto LABEL_10;
  }
  *(_DWORD *)(a1 + 16) = v19;
  return *(_QWORD *)(*(_QWORD *)(a1 + 8) + 168 * v19 + 24);
}

uint64_t ThreadPoolRunWorker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  pthread_mutex_t *v12;
  uint64_t v13;
  int v14;
  uint64_t result;
  const char *v16;
  __int16 v17;
  char v18;

  v8 = *(_DWORD *)(a1 + 16);
  if (v8 == -1)
  {
    v16 = "Missing call to GetWorker before RunWorker";
    v17 = 199;
LABEL_9:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolRunWorker", v17, 90, 0, v16, a7, a8, v18);
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 16) = -1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v10 + 1;
  v11 = v9 + 168 * v8;
  *(_QWORD *)(v11 + 160) = v10;
  v12 = (pthread_mutex_t *)(v11 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(v11 + 48))
    || (v13 = v9 + 168 * v8, v14 = *(_DWORD *)(v13 + 40), *(_DWORD *)(v13 + 40) = v14 + 1, !v14)
    && pthread_cond_broadcast((pthread_cond_t *)(v9 + 168 * v8 + 112))
    || (result = pthread_mutex_unlock(v12), (_DWORD)result))
  {
    v16 = "SemRelease failed";
    v17 = 211;
    goto LABEL_9;
  }
  return result;
}

uint64_t ThreadPoolSync(unsigned int *a1)
{
  uint64_t v1;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char v24;
  char v25;

  v1 = *a1;
  if (!(_DWORD)v1)
  {
    v7 = 1;
    goto LABEL_30;
  }
  v3 = 0;
  v4 = (uint64_t *)*((_QWORD *)a1 + 1);
  do
  {
    v5 = *v4;
    v4 += 21;
    if (v5)
      ++v3;
    --v1;
  }
  while (v1);
  if (v3)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 12)))
      {
        v11 = 91;
        v12 = "SharedArrayPop: pthread_mutex_lock failed\n";
      }
      else
      {
        while (1)
        {
          v13 = a1[8];
          if (v13)
            break;
          if (pthread_cond_wait((pthread_cond_t *)(a1 + 28), (pthread_mutex_t *)(a1 + 12)))
          {
            v11 = 94;
            v12 = "SharedArrayPop: pthread_cond_wait failed\n";
            goto LABEL_15;
          }
        }
        a1[8] = v13 - 1;
        if (!pthread_mutex_unlock((pthread_mutex_t *)(a1 + 12)))
          goto LABEL_16;
        v11 = 98;
        v12 = "SharedArrayPop: pthread_mutex_unlock failed\n";
      }
LABEL_15:
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h", (uint64_t)"SharedArrayPop", v11, 0, v12, v8, v9, v10, v24);
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolSync", 231, 90, 0, "SharedArrayPop", v14, v15, v25);
      v7 = 0;
LABEL_16:
      if (++v6 == v3)
      {
        if (!*a1)
          goto LABEL_30;
        goto LABEL_21;
      }
    }
  }
  v7 = 1;
LABEL_21:
  v16 = 0;
  v17 = 0;
  do
  {
    v18 = *((_QWORD *)a1 + 1);
    if (*(_QWORD *)(v18 + v16))
    {
      if ((v19 = v18 + v16, *(_QWORD *)(v18 + v16 + 160) = -2,
                             pthread_mutex_lock((pthread_mutex_t *)(v18 + v16 + 48)))
        || (v22 = *(_DWORD *)(v19 + 40), *(_DWORD *)(v19 + 40) = v22 + 1, !v22)
        && pthread_cond_broadcast((pthread_cond_t *)(v18 + v16 + 112))
        || pthread_mutex_unlock((pthread_mutex_t *)(v18 + v16 + 48)))
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c", (uint64_t)"ThreadPoolSync", 240, 90, 0, "SemRelease", v20, v21, v24);
        v7 = 0;
      }
    }
    ++v17;
    v16 += 168;
  }
  while (v17 < *a1);
LABEL_30:
  if (v7)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

AAByteStream AADecompressionRandomAccessInputStreamOpen(AAByteStream compressed_stream, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  void *v7;
  uint64_t v8;
  off_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  FILE **v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  void *v48;
  char *v49;
  char v50;
  const char *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55[2];
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v56 = 0uLL;
  v7 = malloc(0x40uLL);
  v8 = (uint64_t)v7;
  if (!v7)
  {
    v22 = *__error();
    v23 = "malloc";
    v24 = 106;
LABEL_18:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecompressionStream.c", (uint64_t)"AADecompressionRandomAccessInputStreamOpen", v24, 110, v22, v23, v10, v11, v50);
    RandomAccessDecompressStreamDestroy(v8);
    return 0;
  }
  memset_s(v7, 0x40uLL, 0, 0x40uLL);
  *(_QWORD *)v8 = compressed_stream;
  *(_QWORD *)(v8 + 8) = flags;
  v9 = AAByteStreamSeek(compressed_stream, 0, 2);
  if (v9 < 0)
  {
    v23 = "seek to end of stream";
    v24 = 112;
    goto LABEL_17;
  }
  v12 = *(_QWORD *)v8;
  if (!*(_QWORD *)(*(_QWORD *)v8 + 32))
    goto LABEL_15;
  v13 = v9;
  v14 = 0;
  v15 = 0;
  v16 = &v56;
  v17 = 12;
  do
  {
    v18 = (*(uint64_t (**)(_QWORD, __int128 *, uint64_t, uint64_t))(v12 + 32))(*(_QWORD *)v12, v16, v17, v15);
    if (v18 < 0)
      goto LABEL_15;
    if (!v18)
      break;
    v16 = (__int128 *)((char *)v16 + v18);
    v14 += v18;
    v15 += v18;
    v17 -= v18;
  }
  while (v17);
  if (v14 != 12)
  {
LABEL_15:
    v23 = "reading file header";
    v24 = 116;
LABEL_17:
    v22 = 0;
    goto LABEL_18;
  }
  if (BYTE3(v56) <= 0x64u)
  {
    switch(BYTE3(v56))
    {
      case '-':
        v19 = 0;
        v20 = "none";
        v21 = PCompressCopyDecode;
        goto LABEL_31;
      case '4':
        v19 = 0;
        v20 = "lz4";
        v21 = PCompressLZ4Decode;
        goto LABEL_31;
      case 'b':
        v19 = 0;
        v20 = "lzbitmap";
        v21 = PCompressLZBITMAPDecode;
        goto LABEL_31;
    }
LABEL_30:
    v21 = 0;
    v20 = "???";
    v19 = 1;
    goto LABEL_31;
  }
  if (BYTE3(v56) > 0x77u)
  {
    if (BYTE3(v56) == 122)
    {
      v19 = 0;
      v20 = "zlib";
      v21 = PCompressZLIBDecode;
      goto LABEL_31;
    }
    if (BYTE3(v56) == 120)
    {
      v19 = 0;
      v20 = "lzma";
      v21 = PCompressLZMADecode;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (BYTE3(v56) == 101)
  {
    v19 = 0;
    v20 = "lzfse";
    v21 = PCompressLZFSEDecode;
    goto LABEL_31;
  }
  if (BYTE3(v56) != 102)
    goto LABEL_30;
  v19 = 0;
  v20 = "lzvn";
  v21 = PCompressLZVNDecode;
LABEL_31:
  *(_QWORD *)(v8 + 16) = v21;
  if (v56 != 112 || BYTE1(v56) != 98 || BYTE2(v56) != 122 || v19)
  {
    v23 = "invalid file header";
    v24 = 128;
    goto LABEL_17;
  }
  v55[0] = *(_QWORD *)((char *)&v56 + 4);
  v26 = bswap64(*(unint64_t *)((char *)&v56 + 4));
  if (HIDWORD(v26))
  {
    v23 = "invalid block size";
    v24 = 131;
    goto LABEL_17;
  }
  *(_QWORD *)(v8 + 24) = 0;
  if (v13 == 12)
  {
    v27 = 0;
    goto LABEL_40;
  }
  v53 = v26;
  v51 = v20;
  v33 = 0;
  v27 = 0;
  v34 = 12;
  while (2)
  {
    if (v34 + 16 > v13)
    {
      v23 = "truncated file";
      v24 = 138;
      goto LABEL_17;
    }
    v54 = v34 + 16;
    v52 = v33;
    v35 = v27;
    v36 = *(_QWORD *)v8;
    if (!*(_QWORD *)(*(_QWORD *)v8 + 32))
    {
LABEL_75:
      v23 = "reading block header";
      v24 = 139;
      goto LABEL_17;
    }
    v37 = 0;
    v38 = v55;
    v39 = 16;
    do
    {
      v40 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t, uint64_t))(v36 + 32))(*(_QWORD *)v36, v38, v39, v34);
      if (v40 < 0)
        goto LABEL_75;
      if (!v40)
        break;
      v38 = (unint64_t *)((char *)v38 + v40);
      v37 += v40;
      v34 += v40;
      v39 -= v40;
    }
    while (v39);
    if (v37 != 16)
      goto LABEL_75;
    v41 = bswap64(v55[0]);
    v42 = bswap64(v55[1]);
    if (v41 > v53 || v42 > v53)
    {
      v23 = "invalid block header";
      v24 = 143;
      goto LABEL_17;
    }
    v44 = v54;
    v34 = v42 + v54;
    if (v42 + v54 > v13)
    {
      v23 = "truncated file";
      v24 = 144;
      goto LABEL_17;
    }
    v45 = v35;
    v46 = *(_QWORD *)(v8 + 24);
    if (v35 != v46 * v53)
    {
      v23 = "invalid block size";
      v24 = 147;
      goto LABEL_17;
    }
    v33 = v52;
    if (v46 < v52)
    {
      v47 = *(char **)(v8 + 32);
      goto LABEL_72;
    }
    if (v52)
      v33 = 2 * v52;
    else
      v33 = 32;
    if ((unint64_t)(16 * v33) >= 0x2000000001)
    {
      *__error() = 12;
LABEL_84:
      *(_QWORD *)(v8 + 32) = 0;
      v22 = *__error();
      v23 = "malloc";
      v24 = 154;
      goto LABEL_18;
    }
    v48 = *(void **)(v8 + 32);
    v47 = (char *)realloc(v48, 16 * v33);
    if (!v47)
    {
      free(v48);
      goto LABEL_84;
    }
    *(_QWORD *)(v8 + 32) = v47;
    v46 = *(_QWORD *)(v8 + 24);
    v44 = v54;
LABEL_72:
    *(_QWORD *)(v8 + 24) = v46 + 1;
    v49 = &v47[16 * v46];
    *(_QWORD *)v49 = v44;
    *((_DWORD *)v49 + 2) = v42;
    *((_DWORD *)v49 + 3) = v41;
    v27 = v41 + v45;
    if (v34 != v13)
      continue;
    break;
  }
  v20 = v51;
  v26 = v53;
  if (v27 < 0)
  {
    v23 = "invalid file sizes";
    v24 = 169;
    goto LABEL_17;
  }
LABEL_40:
  if (!n_threads)
    n_threads = getDefaultNThreads();
  *(_DWORD *)(v8 + 40) = n_threads;
  v28 = (char *)calloc(n_threads, 8uLL);
  *(_QWORD *)(v8 + 48) = v28;
  if (!v28)
  {
    v22 = *__error();
    v23 = "malloc";
    v24 = 174;
    goto LABEL_18;
  }
  v29 = v27;
  v30 = (FILE **)*(unsigned int *)(v8 + 40);
  if ((_DWORD)v30)
  {
    v31 = v28;
    v32 = 0;
    while (1)
    {
      *(_QWORD *)&v31[v32] = malloc(v26);
      v31 = *(char **)(v8 + 48);
      if (!*(_QWORD *)&v31[v32])
        break;
      v32 += 8;
      if (8 * (_QWORD)v30 == v32)
        goto LABEL_47;
    }
    v22 = *__error();
    v23 = "malloc";
    v24 = 178;
    goto LABEL_18;
  }
LABEL_47:
  if (flags >> 62)
  {
    v30 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%12llu B block size\n", v26);
    fprintf(*v30, "%12llu B file size\n", v13);
    fprintf(*v30, "%12llu B data size\n", v29);
    fprintf(*v30, "%12.2f x compression ratio (%s)\n", (double)(unint64_t)v29 / (double)v13, v20);
    fprintf(*v30, "%12llu blocks\n", *(_QWORD *)(v8 + 24));
    LODWORD(v30) = *(_DWORD *)(v8 + 40);
  }
  return (AAByteStream)AAGenericRandomAccessInputStreamOpen(v29, v26, v30, 2 * (int)v30, v8, (uint64_t)RandomAccessDecompressStreamGetBlock, (uint64_t)RandomAccessDecompressStreamAbort, (uint64_t)RandomAccessDecompressStreamDestroy, flags);
}

uint64_t RandomAccessDecompressStreamDestroy(uint64_t a1)
{
  void *v2;
  unint64_t v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      if (*(_DWORD *)(a1 + 40))
      {
        v3 = 0;
        do
          free(*(void **)(*(_QWORD *)(a1 + 48) + 8 * v3++));
        while (v3 < *(unsigned int *)(a1 + 40));
        v2 = *(void **)(a1 + 48);
      }
      free(v2);
    }
    free(*(void **)(a1 + 32));
    free((void *)a1);
  }
  return 0;
}

uint64_t RandomAccessDecompressStreamGetBlock(uint64_t *a1, unsigned int a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  __int16 v22;
  char v24;

  if (*((_DWORD *)a1 + 10) <= a2 || a1[3] <= a3)
  {
    v21 = "Invalid worker/block id";
    v22 = 66;
LABEL_14:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecompressionStream.c", (uint64_t)"RandomAccessDecompressStreamGetBlock", v22, 110, 0, v21, a7, a8, v24);
    return 0xFFFFFFFFLL;
  }
  v10 = a1[4];
  v11 = v10 + 16 * a3;
  v13 = *(_DWORD *)(v11 + 12);
  v12 = (_DWORD *)(v11 + 12);
  v14 = *(v12 - 1);
  if (v13 == (_DWORD)v14)
    v15 = a4;
  else
    v15 = *(_QWORD *)(a1[6] + 8 * a2);
  v16 = *a1;
  if (!*(_QWORD *)(*a1 + 32))
    goto LABEL_20;
  v17 = 0;
  if ((_DWORD)v14)
  {
    v18 = *(_QWORD *)(v10 + 16 * a3);
    v19 = v15;
    while (1)
    {
      v20 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v16 + 32))(*(_QWORD *)v16, v19, v14, v18);
      if (v20 < 0)
        break;
      if (v20)
      {
        v19 += v20;
        v17 += v20;
        v18 += v20;
        v14 -= v20;
        if (v14)
          continue;
      }
      goto LABEL_16;
    }
    v17 = v20;
LABEL_16:
    if (v17 != *(v12 - 1))
    {
LABEL_20:
      v21 = "loading block";
      v22 = 74;
      goto LABEL_14;
    }
  }
  if (v15 != a4
    && ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))a1[2])(a4, *v12, v15, v17) != *v12)
  {
    v21 = "decompressing block";
    v22 = 79;
    goto LABEL_14;
  }
  return 0;
}

void RandomAccessDecompressStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 56))
  {
    *(_DWORD *)(a1 + 56) = 1;
    AAByteStreamCancel(*(AAByteStream *)a1);
  }
}

_QWORD *aaAsyncByteStreamAlloc(uint64_t a1, uint64_t a2, int a3, float a4, float a5)
{
  _QWORD *v10;
  _QWORD *v11;
  float *v12;
  float *v13;
  int v14;
  float v15;
  float v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v10 = malloc(0x38uLL);
  v11 = v10;
  if (!v10)
  {
    v17 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"aaAsyncByteStreamAlloc", 191, 97, *v17, "malloc", v18, v19, v21);
    return v11;
  }
  memset_s(v10, 0x38uLL, 0, 0x38uLL);
  *v11 = a1;
  v11[1] = a2;
  if (a3)
  {
    v12 = (float *)malloc(0x70uLL);
    v13 = v12;
    if (!v12)
      goto LABEL_14;
    memset_s(v12, 0x70uLL, 0, 0x70uLL);
    if (a3 >= 1)
      v14 = a3;
    else
      v14 = 5;
    *((_DWORD *)v13 + 24) = v14;
    v15 = 10.0;
    if (a4 > 0.0)
      v15 = a4;
    v16 = 5.0;
    if (a5 > 0.0)
      v16 = a5;
    v13[25] = v15;
    v13[26] = v16;
    *((_QWORD *)v13 + 10) = -1;
    *((_QWORD *)v13 + 11) = -1;
    if ((pthread_mutex_init((pthread_mutex_t *)v13, 0) & 0x80000000) == 0)
      goto LABEL_14;
    free(v13);
  }
  v13 = 0;
LABEL_14:
  v11[6] = v13;
  return v11;
}

uint64_t AAAsyncByteStreamGetRange(_QWORD *a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t (*v3)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double RealTime;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  double v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;

  v3 = (uint64_t (*)(_QWORD))a1[2];
  if (!v3)
    return 0xFFFFFFFFLL;
  v7 = v3(*a1);
  v8 = v7;
  if ((v7 & 0x80000000) != 0)
    return v8;
  v9 = a1[6];
  if (!(_DWORD)v7)
  {
    if (!v9)
      return 0;
    if (pthread_mutex_lock((pthread_mutex_t *)v9) < 0)
    {
      v36 = *__error();
      v39 = "mutex lock";
      v40 = 149;
    }
    else
    {
      RealTime = getRealTime();
      v26 = *(_QWORD *)(v9 + 80);
      if (v26 < 0)
      {
LABEL_20:
        v8 = 0;
      }
      else
      {
        v27 = *(_QWORD *)(v9 + 72);
        while (1)
        {
          v28 = v27 + 40 * v26;
          v30 = *(double *)(v28 + 24);
          v29 = (double *)(v28 + 24);
          if (v30 < RealTime)
            break;
          v26 = *(_QWORD *)(v27 + 40 * v26 + 32);
          if (v26 < 0)
            goto LABEL_20;
        }
        v41 = v27 + 40 * v26;
        v42 = *(_DWORD *)(v41 + 16);
        if (v42 <= 0)
        {
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataGetRange", 159, 97, 0, "Async stream range timed out (FAIL): %zu bytes at %llu", v23, v24, *(_QWORD *)v41);
          v8 = 0xFFFFFFFFLL;
        }
        else
        {
          v43 = *(_QWORD *)v41;
          *v29 = RealTime
               + *(float *)(v9 + 100)
               + (double)*(unint64_t *)v41 * 0.000000953674316 * *(float *)(v9 + 104);
          *(_DWORD *)(v41 + 16) = v42 - 1;
          *a2 = v43;
          *a3 = *(_QWORD *)(v27 + 40 * v26 + 8);
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataGetRange", 170, 97, "Async stream range timed out (retry): %zu bytes at %llu", v22, v23, v24, *(_QWORD *)v41);
          v8 = 1;
        }
      }
      if ((pthread_mutex_unlock((pthread_mutex_t *)v9) & 0x80000000) == 0)
        return v8;
      v36 = *__error();
      v39 = "mutex unlock";
      v40 = 177;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataGetRange", v40, 97, v36, v39, v37, v38, v56);
    return 0xFFFFFFFFLL;
  }
  if (!v9)
    return v8;
  v10 = *a2;
  v11 = *a3;
  if (pthread_mutex_lock((pthread_mutex_t *)v9) < 0)
  {
    v31 = *__error();
    v34 = "mutex lock";
    v35 = 64;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataInsert", v35, 97, v31, v34, v32, v33, v56);
    return v8;
  }
  v15 = *(_QWORD *)(v9 + 80);
  if (!v10)
  {
    if ((v15 & 0x8000000000000000) == 0)
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataInsert", 68, 97, "Async stream returning EOF, but we still have ranges in flight", v12, v13, v14, v56);
    goto LABEL_51;
  }
  if (v15 < 0)
  {
LABEL_12:
    v18 = *(_QWORD *)(v9 + 88);
    if ((v18 & 0x8000000000000000) == 0)
    {
LABEL_13:
      v19 = *(_QWORD *)(v9 + 72) + 40 * v18;
      v20 = *(_QWORD *)(v19 + 32);
      *(_QWORD *)(v19 + 32) = v15;
      *(_QWORD *)(v9 + 80) = v18;
      *(_QWORD *)(v9 + 88) = v20;
      *(_QWORD *)v19 = v10;
      *(_QWORD *)(v19 + 8) = v11;
      *(_DWORD *)(v19 + 16) = *(_DWORD *)(v9 + 96) - 1;
      v21 = *(float *)(v9 + 100) + (double)v10 * 0.000000953674316 * *(float *)(v9 + 104);
      *(double *)(v19 + 24) = getRealTime() + v21;
      goto LABEL_51;
    }
    v44 = *(_QWORD *)(v9 + 64);
    if (v44)
      v45 = 2 * v44;
    else
      v45 = 32;
    if (40 * v45 < 0x2000000001)
    {
      v46 = *(void **)(v9 + 72);
      v47 = (char *)realloc(v46, 40 * v45);
      if (v47)
      {
        v48 = v47;
        *(_QWORD *)(v9 + 72) = v47;
        v18 = *(_QWORD *)(v9 + 64);
        if (v18 < v45)
        {
          v49 = 40 * v18;
          v50 = v18 + 1;
LABEL_36:
          memset_s(&v48[v49], 0x28uLL, 0, 0x28uLL);
          while (1)
          {
            v51 = v45 == v50 ? -1 : v50;
            *(_QWORD *)&v48[v49 + 32] = v51;
            if (v45 == v50)
              break;
            v48 = *(char **)(v9 + 72);
            v49 += 40;
            ++v50;
            if (v48)
              goto LABEL_36;
          }
          v18 = *(_QWORD *)(v9 + 64);
        }
        *(_QWORD *)(v9 + 64) = v45;
        v15 = *(_QWORD *)(v9 + 80);
        goto LABEL_13;
      }
      free(v46);
    }
    else
    {
      *__error() = 12;
    }
    *(_QWORD *)(v9 + 72) = 0;
    v53 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataInsert", 84, 97, *v53, "malloc", v54, v55, v56);
    *(_QWORD *)(v9 + 64) = 0;
    *(_QWORD *)(v9 + 80) = -1;
    *(_QWORD *)(v9 + 88) = -1;
    goto LABEL_51;
  }
  v16 = *(_QWORD *)(v9 + 72);
  v17 = *(_QWORD *)(v9 + 80);
  while (*(_QWORD *)(v16 + 40 * v17 + 8) != v11 || *(_QWORD *)(v16 + 40 * v17) != v10)
  {
    v17 = *(_QWORD *)(v16 + 40 * v17 + 32);
    if (v17 < 0)
      goto LABEL_12;
  }
LABEL_51:
  if (pthread_mutex_unlock((pthread_mutex_t *)v9) < 0)
  {
    v31 = *__error();
    v34 = "mutex unlock";
    v35 = 108;
    goto LABEL_53;
  }
  return v8;
}

uint64_t AAAsyncByteStreamProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  if (!*(_QWORD *)(a1 + 24))
    return 0xFFFFFFFFLL;
  if (a3)
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      if (pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48)) < 0)
      {
        v18 = *__error();
        v21 = "mutex lock";
        v22 = 116;
      }
      else
      {
        v12 = (_QWORD *)(v8 + 80);
        v13 = *(_QWORD *)(v8 + 80);
        if (v13 < 0)
        {
LABEL_10:
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataRemove", 128, 97, "Async stream receiving an unknown segment", v9, v10, v11, v25);
        }
        else
        {
          v14 = *(_QWORD *)(v8 + 72);
          v15 = -1;
          while (1)
          {
            v16 = v13;
            if (*(_QWORD *)(v14 + 40 * v13 + 8) == a4 && *(_QWORD *)(v14 + 40 * v13) == a3)
              break;
            v13 = *(_QWORD *)(v14 + 40 * v13 + 32);
            v15 = v16;
            if (v13 < 0)
              goto LABEL_10;
          }
          v23 = v14 + 40 * v13;
          v24 = v14 + 40 * v15 + 32;
          if (v15 >= 0)
            v12 = (_QWORD *)v24;
          *v12 = *(_QWORD *)(v23 + 32);
          *(_QWORD *)(v23 + 32) = *(_QWORD *)(v8 + 88);
          *(_QWORD *)(v8 + 88) = v16;
        }
        if ((pthread_mutex_unlock((pthread_mutex_t *)v8) & 0x80000000) == 0)
          return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 24))(*(_QWORD *)a1, a2, a3, a4);
        v18 = *__error();
        v21 = "mutex unlock";
        v22 = 140;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c", (uint64_t)"rangeDataRemove", v22, 97, v18, v21, v19, v20, v25);
    }
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 24))(*(_QWORD *)a1, a2, a3, a4);
}

_QWORD *AAAsyncByteStreamCancel(_QWORD *result)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))result[4];
  if (v1)
    return (_QWORD *)v1(*result);
  return result;
}

uint64_t AAAsyncByteStreamClose(uint64_t (**a1)(void))
{
  uint64_t v2;
  uint64_t (*v3)(void);

  if (!a1)
    return 0;
  if (*a1)
  {
    v2 = a1[1]();
    *a1 = 0;
  }
  else
  {
    v2 = 0;
  }
  v3 = a1[6];
  if (v3)
  {
    free(*((void **)v3 + 9));
    pthread_mutex_destroy((pthread_mutex_t *)v3);
    free(v3);
  }
  free(a1);
  return v2;
}

uint64_t aaAsyncByteStreamIsCancelled(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = (uint64_t (*)(_QWORD))a1[5];
  if (v1)
    return v1(*a1);
  else
    return 0;
}

uint64_t graisClose(uint64_t result)
{
  unsigned int *v1;
  int v2;
  _BOOL4 v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int (*v19)(_QWORD);
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  pthread_cond_t *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  pthread_cond_t *v31;
  FILE **v32;
  FILE *v33;
  unint64_t v34;
  FILE *v35;
  unint64_t v36;

  if (result)
  {
    v1 = (unsigned int *)result;
    v2 = *(_DWORD *)(result + 576);
    v3 = v2 == 0;
    if (*(_QWORD *)(result + 136))
    {
      sendMessage_0(result, -1, -1);
      joinThread(*((_opaque_pthread_t **)v1 + 17));
    }
    v4 = (uint64_t *)*((_QWORD *)v1 + 12);
    if (v4)
    {
      v5 = v1[22];
      if ((_DWORD)v5)
      {
        v6 = 0;
        do
        {
          v7 = v6;
          v9 = *v4;
          v4 += 20;
          v8 = v9;
          if (v9)
            ++v6;
          --v5;
        }
        while (v5);
        if (v6)
        {
          if (v8)
            v10 = v7 + 1;
          else
            v10 = v7;
          do
          {
            v11 = v1[37];
            if (!v11)
              break;
            v12 = v1[39];
            if (!v12)
              v12 = v1[36];
            v13 = v12 - 1;
            v14 = *(_DWORD *)(*((_QWORD *)v1 + 20) + 4 * v13);
            v1[39] = v13;
            v1[37] = v11 - 1;
            if (v14 >= v1[22])
              break;
            v15 = *((_QWORD *)v1 + 12);
            v16 = v15 + 160 * v14;
            *(_QWORD *)(v16 + 144) = -1;
            if (!pthread_mutex_lock((pthread_mutex_t *)(v16 + 24)))
            {
              v17 = v15 + 160 * v14;
              v18 = *(_DWORD *)(v17 + 16);
              *(_DWORD *)(v17 + 16) = v18 + 1;
              if (v18 || !pthread_cond_broadcast((pthread_cond_t *)(v15 + 160 * v14 + 88)))
                pthread_mutex_unlock((pthread_mutex_t *)(v16 + 24));
            }
            joinThread(*(_opaque_pthread_t **)v16);
            *(_QWORD *)v16 = 0;
            --v10;
          }
          while (v10);
        }
      }
    }
    v19 = (int (*)(_QWORD))*((_QWORD *)v1 + 4);
    if (v19)
      v3 = v19(*((_QWORD *)v1 + 1)) >= 0 && v2 == 0;
    v21 = (void *)*((_QWORD *)v1 + 14);
    if (v21)
    {
      if (v1[26])
      {
        v22 = 0;
        v23 = 16;
        do
        {
          free(*(void **)(*((_QWORD *)v1 + 14) + v23));
          ++v22;
          v23 += 32;
        }
        while (v22 < v1[26]);
        v21 = (void *)*((_QWORD *)v1 + 14);
      }
      free(v21);
    }
    free(*((void **)v1 + 10));
    v24 = (void *)*((_QWORD *)v1 + 16);
    if (v24)
    {
      if (v1[30])
      {
        v25 = 0;
        v26 = 88;
        do
        {
          v27 = (pthread_cond_t *)(*((_QWORD *)v1 + 16) + v26);
          if (!pthread_mutex_destroy((pthread_mutex_t *)&v27[-2].__opaque[24]))
            pthread_cond_destroy(v27);
          ++v25;
          v26 += 136;
        }
        while (v25 < v1[30]);
        v24 = (void *)*((_QWORD *)v1 + 16);
      }
      free(v24);
    }
    free(*((void **)v1 + 23));
    *((_QWORD *)v1 + 21) = 0;
    *((_QWORD *)v1 + 22) = 0;
    *((_QWORD *)v1 + 23) = 0;
    v28 = (void *)*((_QWORD *)v1 + 12);
    if (v28)
    {
      if (v1[22])
      {
        v29 = 0;
        v30 = 88;
        do
        {
          v31 = (pthread_cond_t *)(*((_QWORD *)v1 + 12) + v30);
          if (!pthread_mutex_destroy((pthread_mutex_t *)&v31[-2].__opaque[24]))
            pthread_cond_destroy(v31);
          ++v29;
          v30 += 160;
        }
        while (v29 < v1[22]);
        v28 = (void *)*((_QWORD *)v1 + 12);
      }
      free(v28);
    }
    free(*((void **)v1 + 20));
    *((_QWORD *)v1 + 18) = 0;
    *((_QWORD *)v1 + 19) = 0;
    *((_QWORD *)v1 + 20) = 0;
    free(*((void **)v1 + 8));
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 52)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 68)))
      free(*((void **)v1 + 25));
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 84)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 100)))
      free(*((void **)v1 + 41));
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 116)) && !pthread_cond_destroy((pthread_cond_t *)v1 + 11))
      free(*((void **)v1 + 57));
    if ((*(_QWORD *)v1 & 0x8000000000000000) != 0)
    {
      v32 = (FILE **)MEMORY[0x24BDAC8D8];
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%12llu blocks\n", *((_QWORD *)v1 + 7));
      fprintf(*v32, "%12u blocks in cache\n", v1[26]);
      v33 = *v32;
      v34 = atomic_load((unint64_t *)v1 + 75);
      fprintf(v33, "%12llu blocks computed\n", v34);
      v35 = *v32;
      v36 = atomic_load((unint64_t *)v1 + 76);
      fprintf(v35, "%12llu requests processed\n", v36);
    }
    free(v1);
    return (v3 - 1);
  }
  return result;
}

_QWORD *AAGenericRandomAccessInputStreamOpen(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  __int16 v23;
  int v24;
  unsigned int v25;
  FILE **v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  __int16 v32;
  size_t v33;
  void *v34;
  size_t v35;
  void *v36;
  size_t v37;
  void *v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  size_t v44;
  unsigned int *v45;
  void *v46;
  void *v47;
  int v48;
  size_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  size_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  char v65;

  v17 = calloc(1uLL, 0x68uLL);
  v18 = malloc(0x268uLL);
  v19 = (uint64_t)v18;
  if (v18)
  {
    memset_s(v18, 0x268uLL, 0, 0x268uLL);
    if (v17)
    {
      if (a4 < a3)
      {
        v22 = "Cache size must be >= n_workers";
        v23 = 653;
        goto LABEL_23;
      }
      *(_QWORD *)(v19 + 16) = a6;
      *(_QWORD *)(v19 + 24) = a7;
      *(_QWORD *)v19 = a9;
      *(_QWORD *)(v19 + 8) = a5;
      *(_DWORD *)(v19 + 48) = a2;
      *(_QWORD *)(v19 + 32) = a8;
      *(_QWORD *)(v19 + 40) = a1;
      *(_QWORD *)(v19 + 56) = (a1 + (unint64_t)a2 - 1) / a2;
      *(_DWORD *)(v19 + 104) = a4;
      *(_DWORD *)(v19 + 88) = a3;
      *(_DWORD *)(v19 + 120) = 2 * a3;
      v25 = 3 * a3 + 1;
      *(_DWORD *)(v19 + 72) = v25;
      if (a9 < 0)
      {
        v26 = (FILE **)MEMORY[0x24BDAC8D8];
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%12llu blocks in file\n", (a1 + (unint64_t)a2 - 1) / a2);
        fprintf(*v26, "%12u blocks in cache\n", *(_DWORD *)(v19 + 104));
        fprintf(*v26, "%12u workers\n", *(_DWORD *)(v19 + 88));
        fprintf(*v26, "%12u requests\n", *(_DWORD *)(v19 + 120));
        fprintf(*v26, "%12u messages\n", *(_DWORD *)(v19 + 72));
        v25 = *(_DWORD *)(v19 + 72);
      }
      *(_DWORD *)(v19 + 192) = 0;
      *(_DWORD *)(v19 + 196) = v25;
      v27 = calloc(v25, 4uLL);
      *(_QWORD *)(v19 + 200) = v27;
      if (v27)
      {
        if (pthread_mutex_init((pthread_mutex_t *)(v19 + 208), 0))
        {
LABEL_10:
          v31 = "SharedArrayInit: pthread_mutex_init failed\n";
          v32 = 56;
LABEL_22:
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayInit", v32, 0, v31, v28, v29, v30, v65);
          v22 = "SharedArrayInit";
          v23 = 684;
          goto LABEL_23;
        }
        if (pthread_cond_init((pthread_cond_t *)(v19 + 272), 0))
        {
LABEL_12:
          v31 = "SharedArrayInit: pthread_cond_init failed\n";
          v32 = 57;
          goto LABEL_22;
        }
        v33 = *(unsigned int *)(v19 + 72);
        *(_DWORD *)(v19 + 320) = 0;
        *(_DWORD *)(v19 + 324) = v33;
        v34 = calloc(v33, 4uLL);
        *(_QWORD *)(v19 + 328) = v34;
        if (v34)
        {
          if (pthread_mutex_init((pthread_mutex_t *)(v19 + 336), 0))
            goto LABEL_10;
          if (pthread_cond_init((pthread_cond_t *)(v19 + 400), 0))
            goto LABEL_12;
          v35 = *(unsigned int *)(v19 + 120);
          *(_DWORD *)(v19 + 448) = 0;
          *(_DWORD *)(v19 + 452) = v35;
          v36 = calloc(v35, 4uLL);
          *(_QWORD *)(v19 + 456) = v36;
          if (v36)
          {
            if (pthread_mutex_init((pthread_mutex_t *)(v19 + 464), 0))
              goto LABEL_10;
            if (!pthread_cond_init((pthread_cond_t *)(v19 + 528), 0))
            {
              v37 = *(_QWORD *)(v19 + 56);
              if (v37 < 0x800000001)
              {
                v39 = calloc(v37, 4uLL);
                *(_QWORD *)(v19 + 64) = v39;
                if (v39)
                {
                  v40 = *(_QWORD *)(v19 + 56);
                  if (v40)
                    memset(v39, 255, 4 * v40);
                  v41 = (char *)calloc(*(unsigned int *)(v19 + 104), 0x20uLL);
                  *(_QWORD *)(v19 + 112) = v41;
                  if (!v41)
                  {
                    v24 = *__error();
                    v22 = "malloc";
                    v23 = 693;
                    goto LABEL_24;
                  }
                  v42 = *(unsigned int *)(v19 + 104);
                  if ((_DWORD)v42)
                  {
                    v43 = 0;
                    v44 = *(unsigned int *)(v19 + 48);
                    v45 = (unsigned int *)(v41 + 16);
                    while (1)
                    {
                      *((_QWORD *)v45 - 1) = -1;
                      atomic_store(0, v45 - 4);
                      v46 = malloc(v44);
                      *(_QWORD *)v45 = v46;
                      if (!v46)
                        break;
                      ++v43;
                      v45 += 8;
                      if (v43 >= v42)
                        goto LABEL_34;
                    }
                    v24 = *__error();
                    v22 = "malloc";
                    v23 = 700;
                    goto LABEL_24;
                  }
LABEL_34:
                  v47 = calloc(*(unsigned int *)(v19 + 72), 8uLL);
                  *(_QWORD *)(v19 + 80) = v47;
                  if (!v47)
                  {
                    v24 = *__error();
                    v22 = "malloc";
                    v23 = 705;
                    goto LABEL_24;
                  }
                  if (*(_DWORD *)(v19 + 72))
                  {
                    v48 = 0;
                    while ((SharedArrayPush_0((unsigned int *)(v19 + 192), v48) & 0x80000000) == 0)
                    {
                      if (++v48 >= *(_DWORD *)(v19 + 72))
                        goto LABEL_39;
                    }
                    v22 = "SharedArrayPush";
                    v23 = 708;
                    goto LABEL_23;
                  }
LABEL_39:
                  v49 = *(unsigned int *)(v19 + 120);
                  if (v49 < 0x3C3C3C3D)
                  {
                    v50 = calloc(v49, 0x88uLL);
                    *(_QWORD *)(v19 + 128) = v50;
                    if (v50)
                    {
                      v51 = *(unsigned int *)(v19 + 120);
                      v52 = malloc(4 * v51);
                      *(_QWORD *)(v19 + 184) = v52;
                      if (v52)
                      {
                        *(_QWORD *)(v19 + 176) = 0;
                        *(_DWORD *)(v19 + 168) = v51;
                        *(_DWORD *)(v19 + 172) = 0;
                        if (!(_DWORD)v51)
                        {
LABEL_52:
                          v55 = *(unsigned int *)(v19 + 88);
                          if (v55 < 0x33333334)
                          {
                            v56 = calloc(v55, 0xA0uLL);
                            *(_QWORD *)(v19 + 96) = v56;
                            if (v56)
                            {
                              v57 = *(unsigned int *)(v19 + 88);
                              v58 = malloc(4 * v57);
                              *(_QWORD *)(v19 + 160) = v58;
                              if (v58)
                              {
                                *(_QWORD *)(v19 + 152) = 0;
                                *(_DWORD *)(v19 + 144) = v57;
                                *(_DWORD *)(v19 + 148) = 0;
                                if ((_DWORD)v57)
                                {
                                  v59 = 0;
                                  v60 = 0;
                                  while (1)
                                  {
                                    v61 = *(_QWORD *)(v19 + 96) + v59;
                                    if ((SemInit(v61 + 16) & 0x80000000) != 0)
                                    {
                                      v22 = "SemInit";
                                      v23 = 729;
                                      goto LABEL_23;
                                    }
                                    *(_QWORD *)(v61 + 8) = v19;
                                    *(_DWORD *)(v61 + 136) = v60;
                                    if (*(_DWORD *)(v19 + 148) >= *(_DWORD *)(v19 + 144))
                                    {
                                      v22 = "LocalArrayPush";
                                      v23 = 732;
                                      goto LABEL_23;
                                    }
                                    v62 = *(unsigned int *)(v19 + 156);
                                    *(_DWORD *)(*(_QWORD *)(v19 + 160) + 4 * v62) = v60;
                                    v63 = *(_DWORD *)(v19 + 148);
                                    v64 = (_DWORD)v62 + 1 == *(_DWORD *)(v19 + 144) ? 0 : v62 + 1;
                                    *(_DWORD *)(v19 + 156) = v64;
                                    *(_DWORD *)(v19 + 148) = v63 + 1;
                                    if ((createThread((pthread_t *)v61, (uint64_t)workerProc_4, v61, 0) & 0x80000000) != 0)
                                      break;
                                    ++v60;
                                    v59 += 160;
                                    if (v60 >= *(unsigned int *)(v19 + 88))
                                      goto LABEL_68;
                                  }
                                  v22 = "Worker thread creation";
                                  v23 = 733;
                                }
                                else
                                {
LABEL_68:
                                  if ((createThread((pthread_t *)(v19 + 136), (uint64_t)streamProc_0, v19, 0) & 0x80000000) == 0)
                                  {
                                    v17[4] = graisPRead;
                                    v17[6] = graisSeek;
                                    v17[7] = graisAbort;
                                    *v17 = v19;
                                    v17[1] = graisClose;
                                    v17[2] = graisRead;
                                    return v17;
                                  }
                                  v22 = "Stream thread creation";
                                  v23 = 737;
                                }
                              }
                              else
                              {
                                v22 = "LocalArrayInit";
                                v23 = 725;
                              }
                              goto LABEL_23;
                            }
                          }
                          else
                          {
                            *__error() = 12;
                            *(_QWORD *)(v19 + 96) = 0;
                          }
                          v24 = *__error();
                          v22 = "malloc";
                          v23 = 724;
                          goto LABEL_24;
                        }
                        v53 = 0;
                        v54 = 16;
                        while (1)
                        {
                          if ((SemInit(*(_QWORD *)(v19 + 128) + v54) & 0x80000000) != 0)
                          {
                            v22 = "SemInit";
                            v23 = 718;
                            goto LABEL_23;
                          }
                          if ((SharedArrayPush_0((unsigned int *)(v19 + 448), v53) & 0x80000000) != 0)
                            break;
                          ++v53;
                          v54 += 136;
                          if (v53 >= *(unsigned int *)(v19 + 120))
                            goto LABEL_52;
                        }
                        v22 = "SharedArrayPush";
                        v23 = 719;
                      }
                      else
                      {
                        v22 = "LocalArrayInit";
                        v23 = 714;
                      }
LABEL_23:
                      v24 = 0;
                      goto LABEL_24;
                    }
                  }
                  else
                  {
                    *__error() = 12;
                    *(_QWORD *)(v19 + 128) = 0;
                  }
                  v24 = *__error();
                  v22 = "malloc";
                  v23 = 713;
                  goto LABEL_24;
                }
              }
              else
              {
                *__error() = 12;
                *(_QWORD *)(v19 + 64) = 0;
              }
              v24 = *__error();
              v22 = "malloc";
              v23 = 688;
              goto LABEL_24;
            }
            goto LABEL_12;
          }
        }
      }
      v31 = "SharedArrayInit: malloc failed\n";
      v32 = 55;
      goto LABEL_22;
    }
  }
  v24 = *__error();
  v22 = "malloc";
  v23 = 650;
LABEL_24:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"AAGenericRandomAccessInputStreamOpen", v23, 33, v24, v22, v20, v21, v65);
  free(v17);
  graisClose(v19);
  return 0;
}

uint64_t SharedArrayPush_0(unsigned int *a1, int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  char v14;

  v4 = (pthread_mutex_t *)(a1 + 4);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 4)))
  {
    v8 = "SharedArrayPush: pthread_mutex_lock failed\n";
    v9 = 117;
  }
  else
  {
    v10 = *a1;
    v11 = a1[1];
    v12 = v10;
    if (v10 < v11)
    {
      *(_DWORD *)(*((_QWORD *)a1 + 1) + 4 * v10) = a2;
      v12 = *a1;
    }
    *a1 = v12 + 1;
    if (v12 || !pthread_cond_broadcast((pthread_cond_t *)(a1 + 20)))
    {
      if (pthread_mutex_unlock(v4))
      {
        v8 = "SharedArrayPush: pthread_mutex_unlock failed\n";
        v9 = 124;
      }
      else
      {
        if (v10 < v11)
          return 0;
        v8 = "SharedArrayPush: stack is full\n";
        v9 = 125;
      }
    }
    else
    {
      v8 = "SharedArrayPush: pthread_cond_broadcast failed\n";
      v9 = 122;
    }
  }
  pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPush", v9, 0, v8, v5, v6, v7, v14);
  return 0xFFFFFFFFLL;
}

uint64_t workerProc_4(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  pthread_cond_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;

  v2 = (pthread_mutex_t *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = (pthread_cond_t *)(a1 + 88);
  v5 = 1;
  while (1)
  {
    if (pthread_mutex_lock(v2))
      goto LABEL_7;
    while (1)
    {
      v8 = *(_DWORD *)(a1 + 16);
      if (v8 > 0)
        break;
      if (pthread_cond_wait(v4, v2))
        goto LABEL_7;
    }
    *(_DWORD *)(a1 + 16) = v8 - 1;
    if (pthread_mutex_unlock(v2))
    {
LABEL_7:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"workerProc", 365, 33, 0, "SemAcquire", v6, v7, v15);
      v5 = 0;
    }
    v9 = *(_QWORD *)(a1 + 144);
    if (v9 == -1)
      return a1;
    if (((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(v3 + 8), *(unsigned int *)(a1 + 136), v9, *(_QWORD *)(*(_QWORD *)(v3 + 112) + 32 * *(unsigned int *)(a1 + 152) + 16)) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"workerProc", 374, 33, 0, "get block data", v10, v11, v15);
      v5 = 0;
    }
    *(_DWORD *)(a1 + 156) = v5;
    if ((sendMessage_0(v3, -1, *(_DWORD *)(a1 + 136)) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"workerProc", 381, 33, 0, "send worker message", v12, v13, v15);
      v5 = 0;
    }
  }
}

uint64_t streamProc_0(uint64_t a1)
{
  int v2;
  pthread_mutex_t *v3;
  pthread_cond_t *v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  unint64_t v38;
  int v39;
  unsigned int *v40;
  unsigned int v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  unint64_t v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  unsigned int v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  pthread_mutex_t *v61;
  uint64_t v62;
  int v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int *v67;
  unsigned int v68;
  unint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  pthread_mutex_t *v73;
  uint64_t v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v86;
  uint64_t v87;
  unsigned int *v88;
  unsigned int v89;
  __int16 v90;
  const char *v91;
  uint64_t v92;
  unsigned int *v93;
  unsigned int v94;
  int v95;
  int v96;
  unsigned int v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  pthread_mutex_t *v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t *v107;
  char v108;
  char v109;
  unint64_t *v110;
  unsigned int *v111;
  unsigned int v112;
  int v113;
  int v114;

  v2 = 0;
  v3 = (pthread_mutex_t *)(a1 + 336);
  v4 = (pthread_cond_t *)(a1 + 400);
  v110 = (unint64_t *)(a1 + 600);
  v111 = (unsigned int *)(a1 + 192);
  v5 = (unint64_t *)(a1 + 592);
  v107 = (unint64_t *)(a1 + 608);
  while (1)
  {
    v113 = v2;
    while (pthread_mutex_lock(v3))
    {
      v9 = 91;
      v10 = "SharedArrayPop: pthread_mutex_lock failed\n";
LABEL_8:
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPop", v9, 0, v10, v6, v7, v8, (char)v107);
LABEL_9:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 186, 33, 0, "SharedArrayPop", v12, v13, v108);
      *(_DWORD *)(a1 + 576) = 1;
    }
    while (1)
    {
      v11 = *(_DWORD *)(a1 + 320);
      if (v11)
        break;
      if (pthread_cond_wait(v4, v3))
      {
        v9 = 94;
        v10 = "SharedArrayPop: pthread_cond_wait failed\n";
        goto LABEL_8;
      }
    }
    v14 = v11 - 1;
    *(_DWORD *)(a1 + 320) = v14;
    v15 = *(unsigned int *)(*(_QWORD *)(a1 + 328) + 4 * v14);
    if (pthread_mutex_unlock(v3))
    {
      pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPop", 98, 0, "SharedArrayPop: pthread_mutex_unlock failed\n", v16, v17, v18, (char)v107);
      goto LABEL_9;
    }
    v19 = (int *)(*(_QWORD *)(a1 + 80) + 8 * v15);
    v21 = *v19;
    v20 = v19[1];
    if ((SharedArrayPush_0(v111, v15) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 192, 33, 0, "SharedArrayPush", v22, v23, (char)v107);
      *(_DWORD *)(a1 + 576) = 1;
    }
    v24 = v21;
    v25 = v113;
    if ((v20 & v21) == 0xFFFFFFFF)
      v25 = 1;
    v114 = v25;
    v26 = v107;
    if (v20 != -1)
    {
      do
        v27 = __ldxr(v110);
      while (__stxr(v27 + 1, v110));
      v28 = *(_QWORD *)(a1 + 96);
      v29 = v28 + 160 * v20;
      v31 = *(unsigned int *)(v29 + 152);
      v32 = *(_DWORD *)(v29 + 156);
      v30 = (int *)(v29 + 152);
      v33 = *(_QWORD *)(a1 + 112);
      if (v32)
      {
        v34 = (unsigned int *)(v33 + 32 * v31);
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 + 1, v34));
        v36 = (unsigned int *)(v33 + 32 * v31 + 4);
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        do
          v38 = __ldaxr(v5);
        while (__stlxr(v38 + 1, v5));
        *(_QWORD *)(v33 + 32 * v31 + 24) = v38;
        v39 = *v30;
      }
      else
      {
        v40 = (unsigned int *)(v33 + 32 * v31 + 4);
        do
          v41 = __ldaxr(v40);
        while (__stlxr(v41 - 1, v40));
        do
          v42 = __ldaxr(v5);
        while (__stlxr(v42 + 1, v5));
        v43 = v33 + 32 * v31;
        *(_QWORD *)(v43 + 24) = v42;
        *(_QWORD *)(v43 + 8) = -1;
        v39 = -3;
      }
      v44 = v28 + 160 * v20;
      *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * *(_QWORD *)(v44 + 144)) = v39;
      *(_QWORD *)(v44 + 144) = -1;
      *v30 = -1;
      if (*(_DWORD *)(a1 + 148) >= *(_DWORD *)(a1 + 144))
      {
        v48 = v24;
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 242, 33, 0, "LocalArrayPush", v22, v23, (char)v107);
        v24 = v48;
        *(_DWORD *)(a1 + 576) = 1;
      }
      else
      {
        v45 = *(unsigned int *)(a1 + 156);
        *(_DWORD *)(*(_QWORD *)(a1 + 160) + 4 * v45) = v20;
        v46 = *(_DWORD *)(a1 + 148);
        if ((_DWORD)v45 + 1 == *(_DWORD *)(a1 + 144))
          v47 = 0;
        else
          v47 = v45 + 1;
        *(_DWORD *)(a1 + 156) = v47;
        *(_DWORD *)(a1 + 148) = v46 + 1;
      }
    }
    v49 = *(_DWORD *)(a1 + 172);
    if (v24 == -1)
    {
      if (!v49)
        goto LABEL_115;
    }
    else
    {
      do
        v50 = __ldxr(v26);
      while (__stxr(v50 + 1, v26));
      v51 = *(_DWORD *)(a1 + 168);
      if (v49 >= v51)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 254, 33, 0, "LocalArrayEnqueue", v22, v23, (char)v107);
        *(_DWORD *)(a1 + 576) = 1;
        v49 = *(_DWORD *)(a1 + 172);
        if (!v49)
          goto LABEL_115;
      }
      else
      {
        if (*(_DWORD *)(a1 + 176))
          v51 = *(_DWORD *)(a1 + 176);
        v52 = v51 - 1;
        *(_DWORD *)(*(_QWORD *)(a1 + 184) + 4 * v52) = v24;
        v53 = *(_DWORD *)(a1 + 172);
        v49 = v53 + 1;
        *(_DWORD *)(a1 + 172) = v53 + 1;
        *(_DWORD *)(a1 + 176) = v52;
        if (v53 == -1)
          goto LABEL_115;
      }
    }
    v54 = 0;
    v112 = v49;
    while (2)
    {
      v55 = *(_DWORD *)(a1 + 172);
      if (v55)
      {
        v56 = *(_DWORD *)(a1 + 180);
        if (!v56)
          v56 = *(_DWORD *)(a1 + 168);
        v57 = v56 - 1;
        v58 = *(_DWORD *)(*(_QWORD *)(a1 + 184) + 4 * v57);
        *(_DWORD *)(a1 + 180) = v57;
        *(_DWORD *)(a1 + 172) = v55 - 1;
      }
      else
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 262, 33, 0, "LocalArrayDequeue", v22, v23, (char)v107);
        *(_DWORD *)(a1 + 576) = 1;
        v58 = -1;
      }
      v59 = *(_QWORD *)(a1 + 128);
      if (v114)
      {
        v60 = v59 + 136 * v58;
        *(_DWORD *)(v60 + 8) = -1;
        v61 = (pthread_mutex_t *)(v60 + 24);
        if (!pthread_mutex_lock((pthread_mutex_t *)(v60 + 24)))
        {
          v62 = v59 + 136 * v58;
          v63 = *(_DWORD *)(v62 + 16);
          *(_DWORD *)(v62 + 16) = v63 + 1;
          if ((v63 || !pthread_cond_broadcast((pthread_cond_t *)(v59 + 136 * v58 + 88)))
            && !pthread_mutex_unlock(v61))
          {
            goto LABEL_99;
          }
        }
        v78 = 272;
        goto LABEL_97;
      }
      v64 = (uint64_t *)(v59 + 136 * v58);
      v65 = *(unsigned int *)(*(_QWORD *)(a1 + 64) + 4 * *v64);
      if (v65 < *(_DWORD *)(a1 + 104))
      {
        *(_DWORD *)(v59 + 136 * v58 + 8) = v65;
        v66 = *(_QWORD *)(a1 + 112);
        v67 = (unsigned int *)(v66 + 32 * v65);
        do
          v68 = __ldaxr(v67);
        while (__stlxr(v68 + 1, v67));
        do
          v69 = __ldaxr(v5);
        while (__stlxr(v69 + 1, v5));
        *(_QWORD *)(v66 + 32 * v65 + 24) = v69;
        if (!pthread_mutex_lock((pthread_mutex_t *)(v59 + 136 * v58 + 24)))
        {
          v70 = v59 + 136 * v58;
          v71 = *(_DWORD *)(v70 + 16);
          *(_DWORD *)(v70 + 16) = v71 + 1;
          if ((v71 || !pthread_cond_broadcast((pthread_cond_t *)(v59 + 136 * v58 + 88)))
            && !pthread_mutex_unlock((pthread_mutex_t *)(v59 + 136 * v58 + 24)))
          {
            goto LABEL_99;
          }
        }
        v78 = 292;
        goto LABEL_97;
      }
      if ((_DWORD)v65 == -3)
      {
        v72 = v59 + 136 * v58;
        *(_DWORD *)(v72 + 8) = -1;
        v73 = (pthread_mutex_t *)(v72 + 24);
        if (!pthread_mutex_lock((pthread_mutex_t *)(v72 + 24)))
        {
          v74 = v59 + 136 * v58;
          v75 = *(_DWORD *)(v74 + 16);
          *(_DWORD *)(v74 + 16) = v75 + 1;
          if ((v75 || !pthread_cond_broadcast((pthread_cond_t *)(v59 + 136 * v58 + 88)))
            && !pthread_mutex_unlock(v73))
          {
            goto LABEL_99;
          }
        }
        v78 = 303;
LABEL_97:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", v78, 33, 0, "SemRelease", v22, v23, (char)v107);
        goto LABEL_98;
      }
      v76 = *(_DWORD *)(a1 + 168);
      if (*(_DWORD *)(a1 + 172) >= v76)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 308, 33, 0, "LocalArrayEnqueue", v22, v23, (char)v107);
        *(_DWORD *)(a1 + 576) = 1;
      }
      else
      {
        if (*(_DWORD *)(a1 + 176))
          v76 = *(_DWORD *)(a1 + 176);
        v77 = v76 - 1;
        *(_DWORD *)(*(_QWORD *)(a1 + 184) + 4 * v77) = v58;
        ++*(_DWORD *)(a1 + 172);
        *(_DWORD *)(a1 + 176) = v77;
      }
      if ((_DWORD)v65 != -1 || !*(_DWORD *)(a1 + 148))
        goto LABEL_99;
      v79 = *v64;
      if (*(_QWORD *)(a1 + 56) <= (unint64_t)*v64)
      {
        v90 = 149;
        v91 = "Invalid block_id, or no workers available";
        goto LABEL_112;
      }
      while (!*(_DWORD *)(a1 + 104))
      {
        v83 = -1;
LABEL_88:
        v87 = *(_QWORD *)(a1 + 112);
        v81 = v83;
        v88 = (unsigned int *)(v87 + 32 * v83);
        while (1)
        {
          v89 = __ldaxr(v88);
          if (v89 != 1)
            break;
          if (!__stlxr(0, v88))
          {
            v92 = v87 + 32 * v83;
            *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * *(_QWORD *)(v92 + 8)) = -1;
            *(_QWORD *)(v92 + 8) = -1;
            v93 = (unsigned int *)(v92 + 4);
            goto LABEL_103;
          }
        }
        __clrex();
      }
      v80 = 0;
      v81 = 0;
      v82 = -1;
      v83 = -1;
      while (2)
      {
        v84 = *(_QWORD *)(a1 + 112);
        if (atomic_load((unsigned int *)(v84 + v80 + 4)))
        {
LABEL_85:
          ++v81;
          v80 += 32;
          if (v81 >= *(unsigned int *)(a1 + 104))
            goto LABEL_88;
          continue;
        }
        break;
      }
      if (*(_QWORD *)(v84 + v80 + 8) != -1)
      {
        v86 = *(_QWORD *)(v84 + v80 + 24);
        if (v86 < v82)
        {
          v82 = v86;
          v83 = v81;
        }
        goto LABEL_85;
      }
      v93 = (unsigned int *)(v84 + v80 + 4);
      v83 = v81;
      do
LABEL_103:
        v94 = __ldaxr(v93);
      while (__stlxr(v94 + 1, v93));
      *(_QWORD *)(*(_QWORD *)(a1 + 112) + 32 * v81 + 8) = v79;
      v95 = *(_DWORD *)(a1 + 148);
      if (!v95)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"runWorker", 159, 33, 0, "LocalArrayPop", v22, v23, (char)v107);
        goto LABEL_113;
      }
      v96 = *(_DWORD *)(a1 + 156);
      if (!v96)
        v96 = *(_DWORD *)(a1 + 144);
      v97 = v96 - 1;
      v98 = *(_DWORD *)(*(_QWORD *)(a1 + 160) + 4 * v97);
      *(_DWORD *)(a1 + 156) = v97;
      *(_DWORD *)(a1 + 148) = v95 - 1;
      v99 = *(_QWORD *)(a1 + 96);
      v100 = v99 + 160 * v98;
      *(_QWORD *)(v100 + 144) = v79;
      *(_DWORD *)(v100 + 152) = v83;
      *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v79) = -2;
      v101 = (pthread_mutex_t *)(v100 + 24);
      if (pthread_mutex_lock((pthread_mutex_t *)(v100 + 24))
        || (v102 = v99 + 160 * v98, v103 = *(_DWORD *)(v102 + 16), *(_DWORD *)(v102 + 16) = v103 + 1, !v103)
        && pthread_cond_broadcast((pthread_cond_t *)(v99 + 160 * v98 + 88))
        || pthread_mutex_unlock(v101))
      {
        v90 = 167;
        v91 = "SemRelease";
LABEL_112:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"runWorker", v90, 33, 0, v91, v22, v23, (char)v107);
LABEL_113:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"streamProc", 313, 33, 0, "run worker", v104, v105, v109);
LABEL_98:
        *(_DWORD *)(a1 + 576) = 1;
      }
LABEL_99:
      if (++v54 != v112)
        continue;
      break;
    }
LABEL_115:
    v2 = 0;
    if (v114)
    {
      v2 = v114;
      if (*(_DWORD *)(a1 + 148) == *(_DWORD *)(a1 + 88))
        return a1;
    }
  }
}

uint64_t graisRead(uint64_t a1, char *a2, uint64_t a3)
{
  unint64_t *v4;
  unint64_t v5;

  if (*(_DWORD *)(a1 + 576))
    return -1;
  v4 = (unint64_t *)(a1 + 584);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + a3, v4));
  return graisPRead(a1, a2, a3, v5);
}

uint64_t graisPRead(uint64_t a1, char *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  pthread_mutex_t *v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  pthread_cond_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int *v34;
  unsigned int v35;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  unsigned int *v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unsigned int v46;
  unint64_t v47;

  if (*(_DWORD *)(a1 + 576))
    return -1;
  if (!a3)
    return 0;
  v5 = a4;
  if ((a4 & 0x8000000000000000) == 0)
  {
    v7 = a4 + a3;
    if (a4 + a3 >= *(_QWORD *)(a1 + 40))
      v7 = *(_QWORD *)(a1 + 40);
    if (__CFADD__(a4, a3))
      v8 = *(_QWORD *)(a1 + 40);
    else
      v8 = v7;
    if (v8 > a4)
    {
      v9 = a4 / *(unsigned int *)(a1 + 48);
      if (v9 < *(_QWORD *)(a1 + 56))
      {
        v4 = 0;
        v11 = (_DWORD *)(a1 + 448);
        while (1)
        {
          v12 = *(unsigned int *)(a1 + 48);
          if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 464)))
          {
            v37 = "SharedArrayPop: pthread_mutex_lock failed\n";
            v38 = 91;
LABEL_40:
            pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPop", v38, 0, v37, v13, v14, v15, v41);
            v39 = "SharedArrayPop";
            v40 = 395;
            goto LABEL_41;
          }
          while (!*v11)
          {
            if (pthread_cond_wait((pthread_cond_t *)(a1 + 528), (pthread_mutex_t *)(a1 + 464)))
            {
              v37 = "SharedArrayPop: pthread_cond_wait failed\n";
              v38 = 94;
              goto LABEL_40;
            }
          }
          v44 = v8;
          v16 = *v11 - 1;
          *(_DWORD *)(a1 + 448) = v16;
          v17 = *(_DWORD *)(*(_QWORD *)(a1 + 456) + 4 * v16);
          if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 464)))
          {
            v37 = "SharedArrayPop: pthread_mutex_unlock failed\n";
            v38 = 98;
            goto LABEL_40;
          }
          v41 = v12;
          v18 = *(_QWORD *)(a1 + 128);
          v19 = v18 + 136 * v17;
          *(_QWORD *)v19 = v9;
          *(_DWORD *)(v19 + 8) = -1;
          v42 = (unsigned int *)(v19 + 8);
          v46 = v17;
          v45 = v9;
          if ((sendMessage_0(a1, v17, -1) & 0x80000000) != 0)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"acquireCachedBlock", 404, 33, 0, "send request", v20, v21, v41);
            v43 = 0;
          }
          else
          {
            v43 = 1;
          }
          v22 = v18 + 136 * v17;
          v23 = (pthread_mutex_t *)(v22 + 24);
          if (pthread_mutex_lock((pthread_mutex_t *)(v22 + 24)))
            goto LABEL_27;
          v26 = (int *)(v22 + 16);
          v27 = (pthread_cond_t *)(v18 + 136 * v46 + 88);
          while (*v26 <= 0)
          {
            if (pthread_cond_wait(v27, v23))
              goto LABEL_27;
          }
          --*v26;
          if (pthread_mutex_unlock(v23))
          {
LABEL_27:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"acquireCachedBlock", 410, 33, 0, "SemAcquire", v24, v25, v41);
            v43 = 0;
          }
          v28 = *v42;
          if ((SharedArrayPush_0((unsigned int *)(a1 + 448), v46) & 0x80000000) != 0)
            break;
          if (!v43 || (_DWORD)v28 == -1)
            goto LABEL_42;
          v31 = v45 * v41;
          v32 = v44;
          if (v45 * v41 + v41 < v44)
            v32 = v31 + v41;
          v47 = v32;
          v33 = v32 - v5;
          memcpy(a2, (const void *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 32 * v28 + 16) + v5 - v31), v32 - v5);
          a2 += v33;
          v4 += v33;
          v34 = (unsigned int *)(*(_QWORD *)(a1 + 112) + 32 * v28);
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          v8 = v44;
          if (v44 > v45 * v41 + v41)
          {
            v5 = v47;
            v9 = v45 + 1;
            if (v45 + 1 < *(_QWORD *)(a1 + 56))
              continue;
          }
          return v4;
        }
        v39 = "SharedArrayPush";
        v40 = 418;
LABEL_41:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"acquireCachedBlock", v40, 33, 0, v39, v29, v30, v41);
LABEL_42:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"graisPRead", 464, 33, 0, "acquire segment in cache", v29, v30, v41);
        return -1;
      }
    }
    return 0;
  }
  return -1;
}

uint64_t graisSeek(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;

  if (*(_DWORD *)(a1 + 576))
    return -1;
  if (!a3)
    goto LABEL_7;
  if (a3 != 1)
  {
    if (a3 != 2)
      return -1;
    a2 += *(_QWORD *)(a1 + 40);
LABEL_7:
    atomic_store(a2, (unint64_t *)(a1 + 584));
    return a2;
  }
  v3 = (unint64_t *)(a1 + 584);
  do
  {
    v4 = __ldaxr(v3);
    v5 = v4 + a2;
  }
  while (__stlxr(v5, v3));
  return v5;
}

uint64_t graisAbort(uint64_t result)
{
  uint64_t (*v1)(_QWORD);

  if (!*(_DWORD *)(result + 576))
  {
    *(_DWORD *)(result + 576) = 1;
    v1 = *(uint64_t (**)(_QWORD))(result + 24);
    if (v1)
      return v1(*(_QWORD *)(result + 8));
  }
  return result;
}

uint64_t sendMessage_0(uint64_t a1, int a2, int a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  __int16 v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  __int16 v18;
  _DWORD *v20;
  char v21;

  v6 = (pthread_mutex_t *)(a1 + 208);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 208)))
  {
    v10 = "SharedArrayPop: pthread_mutex_lock failed\n";
    v11 = 91;
LABEL_8:
    pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h", (uint64_t)"SharedArrayPop", v11, 0, v10, v7, v8, v9, v21);
    v17 = "SharedArrayPop";
    v18 = 339;
LABEL_9:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c", (uint64_t)"sendMessage", v18, 33, 0, v17, v15, v16, v21);
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    v12 = *(_DWORD *)(a1 + 192);
    if (v12)
      break;
    if (pthread_cond_wait((pthread_cond_t *)(a1 + 272), v6))
    {
      v10 = "SharedArrayPop: pthread_cond_wait failed\n";
      v11 = 94;
      goto LABEL_8;
    }
  }
  v13 = v12 - 1;
  *(_DWORD *)(a1 + 192) = v13;
  v14 = *(unsigned int *)(*(_QWORD *)(a1 + 200) + 4 * v13);
  if (pthread_mutex_unlock(v6))
  {
    v10 = "SharedArrayPop: pthread_mutex_unlock failed\n";
    v11 = 98;
    goto LABEL_8;
  }
  v20 = (_DWORD *)(*(_QWORD *)(a1 + 80) + 8 * v14);
  *v20 = a2;
  v20[1] = a3;
  if ((SharedArrayPush_0((unsigned int *)(a1 + 320), v14) & 0x80000000) != 0)
  {
    v17 = "SharedArrayPush";
    v18 = 347;
    goto LABEL_9;
  }
  return 0;
}

uint64_t contextPassThroughProc(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t (*v5)(_QWORD);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(_OWORD *)(a1 + 56) = v2;
  v5 = *(uint64_t (**)(_QWORD))(a1 + 120);
  if (v5)
    return v5(*(_QWORD *)(a1 + 112));
  else
    return 0;
}

uint64_t verifySegmentProc(uint64_t a1, size_t __size, uint64_t a3, int a4, const void *a5, size_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v10;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  size_t v24;
  uint64_t v25;
  int v26;
  uint64_t (*v28)(_QWORD, float);
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  _OWORD v37[16];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned int *)(a1 + 56) >= __size)
  {
    v38 = 0;
    memset(v37, 0, sizeof(v37));
    if (__size < 0x2000000001)
    {
      v16 = malloc(__size);
      if (v16)
      {
        v21 = *(_QWORD *)(a1 + 8);
        v36 = v16;
        if (*(_QWORD *)(v21 + 32))
        {
          v22 = 0;
          if (__size)
          {
            v23 = v16;
            v24 = __size;
            while (1)
            {
              v25 = (*(uint64_t (**)(_QWORD, _QWORD *, size_t, uint64_t))(v21 + 32))(*(_QWORD *)v21, v23, v24, a3);
              if (v25 < 0)
                break;
              if (v25)
              {
                v23 = (_QWORD *)((char *)v23 + v25);
                v22 += v25;
                a3 += v25;
                v24 -= v25;
                if (v24)
                  continue;
              }
              goto LABEL_16;
            }
            v22 = v25;
          }
        }
        else
        {
          v22 = -1;
        }
LABEL_16:
        if (v22 != __size)
        {
          v8 = 0;
          v10 = v36;
          goto LABEL_22;
        }
        v10 = v36;
        v26 = aeaChecksum((uint64_t)v37, a4, v36, __size, v17, v18, v19, v20);
        v8 = 0;
        if (v26 < 0 || LODWORD(v37[0]) != a6)
          goto LABEL_22;
        if (!memcmp((char *)v37 + 4, a5, a6))
        {
          v28 = *(uint64_t (**)(_QWORD, float))(a1 + 128);
          if (!v28)
            goto LABEL_29;
          v29 = *(_QWORD *)(a1 + 72);
          if (!v29)
            goto LABEL_29;
          v30 = (unint64_t *)(a1 + 368);
          do
          {
            v31 = __ldxr(v30);
            v32 = v31 + __size;
          }
          while (__stxr(v32, v30));
          if ((v28(*(_QWORD *)(a1 + 112), (float)((float)v32 * 100.0) / (float)v29) & 0x80000000) != 0)
          {
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"verifySegmentProc", 128, 128, 0, "progress_proc", v33, v34, v35);
            v8 = 0xFFFFFFFFLL;
          }
          else
          {
LABEL_29:
            v8 = 1;
          }
          goto LABEL_22;
        }
      }
      else
      {
        v10 = 0;
      }
      v8 = 0;
    }
    else
    {
      v10 = 0;
      v8 = 0;
      *__error() = 12;
    }
LABEL_22:
    free(v10);
    return v8;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"verifySegmentProc", 112, 128, 0, "Invalid segment size", a7, a8, v35);
  return 0xFFFFFFFFLL;
}

uint64_t readerProc(uint64_t **a1)
{
  uint64_t *v2;
  size_t v3;
  char v4;
  int v5;
  int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v22;
  char *v23;

  v2 = *a1;
  v3 = (size_t)a1[2];
  if (v3 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_19:
    v17 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"readerProc", 142, 128, *v17, "aaMalloc", v18, v19, v22);
    v23 = 0;
    goto LABEL_20;
  }
  v23 = (char *)malloc(v3);
  if (!v23)
    goto LABEL_19;
  v4 = 0;
  v5 = 3;
  do
  {
    v6 = v5;
    v7 = a1[2];
    v8 = *v2;
    if (*(_QWORD *)(*v2 + 32))
    {
      if (!v7)
        break;
      v9 = 0;
      v10 = a1[1];
      v11 = v23;
      v12 = a1[2];
      while (1)
      {
        v13 = (*(uint64_t (**)(_QWORD, char *, uint64_t *, uint64_t *))(v8 + 32))(*(_QWORD *)v8, v11, v12, v10);
        if (v13 < 0)
          break;
        if (v13)
        {
          v11 += v13;
          v9 += v13;
          v10 = (uint64_t *)((char *)v10 + v13);
          v12 = (uint64_t *)((char *)v12 - v13);
          if (v12)
            continue;
        }
        goto LABEL_14;
      }
      v9 = v13;
    }
    else
    {
      v9 = -1;
    }
LABEL_14:
    if (v7 == (uint64_t *)v9)
      break;
    v5 = v6 - 1;
    v4 = 1;
  }
  while (v6);
  if ((AAAsyncByteStreamProcess(v2[4], (uint64_t)v23, (uint64_t)a1[2], (uint64_t)a1[1]) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"readerProc", 149, 128, 0, "AAAsyncByteStreamProcess", v14, v15, v22);
  }
  else if ((v4 & 1) == 0)
  {
    v16 = 0;
    goto LABEL_25;
  }
LABEL_20:
  if (!pthread_mutex_lock((pthread_mutex_t *)(v2 + 29)))
  {
    v20 = *((_DWORD *)v2 + 56);
    *((_DWORD *)v2 + 56) = v20 + 1;
    if (v20 || !pthread_cond_broadcast((pthread_cond_t *)(v2 + 37)))
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 29));
  }
  v16 = 0xFFFFFFFFLL;
LABEL_25:
  free(v23);
  return v16;
}

uint64_t writerProc_0(uint64_t a1, size_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v10;
  pthread_mutex_t *v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t (*v22)(_QWORD, float);
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  __int16 v30;
  size_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  uint64_t v40;
  void (*v41)(_QWORD, float);
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  uint64_t v46;
  char *v48;
  void *v49;
  char *v50;
  char *v51;
  char v52;

  v10 = a2;
  if (*(_DWORD *)(a1 + 384))
  {
    v12 = (pthread_mutex_t *)(a1 + 160);
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 160)))
    {
      v13 = "MutexLock";
      v14 = 172;
LABEL_24:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"writerProc", v14, 128, 0, v13, a7, a8, v52);
      return 0xFFFFFFFFLL;
    }
    v19 = (unsigned int *)(a1 + 376);
    if (!atomic_load((unsigned int *)(a1 + 376)))
    {
      while (!__ldaxr(v19))
      {
        if (!__stlxr(1u, v19))
          goto LABEL_26;
      }
      __clrex();
    }
LABEL_26:
    v28 = *(_QWORD *)(a1 + 360);
    if (v28 <= a3)
    {
      if (v28 < a3)
      {
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v34 = *(_QWORD *)(a1 + 344);
        do
        {
          if (!*(_QWORD *)(v34 + v32))
          {
            v48 = (char *)(v34 + v32);
            goto LABEL_63;
          }
          ++v33;
          v32 += 24;
          v31 += 2;
        }
        while (v33 != *(_QWORD *)(a1 + 352));
        if (*(_DWORD *)(a1 + 388))
        {
          v29 = "too many writes pending";
          v30 = 190;
          goto LABEL_28;
        }
        if (v33 < 0)
        {
          v29 = "too many writes pending";
          v30 = 198;
          goto LABEL_28;
        }
        if (is_mul_ok(v31, 0x18uLL) && 24 * v31 <= 0x2000000000)
        {
          v50 = (char *)calloc(v31, 0x18uLL);
          if (v50)
          {
            v51 = v50;
            memcpy(v50, *(const void **)(a1 + 344), 24 * *(_QWORD *)(a1 + 352));
            free(*(void **)(a1 + 344));
            *(_QWORD *)(a1 + 344) = v51;
            *(_QWORD *)(a1 + 352) = v31;
            v48 = &v51[v32];
LABEL_63:
            if (v10 < 0x2000000001)
            {
              v49 = malloc(v10);
              *(_QWORD *)v48 = v49;
              if (v49)
              {
                memcpy(v49, a4, v10);
                v27 = 0;
                *((_QWORD *)v48 + 1) = a3;
                *((_QWORD *)v48 + 2) = v10;
                goto LABEL_60;
              }
            }
            else
            {
              *__error() = 12;
              *(_QWORD *)v48 = 0;
            }
            v29 = "malloc";
            v30 = 217;
            goto LABEL_28;
          }
        }
        else
        {
          *__error() = 12;
        }
        v29 = "too many writes pending";
        v30 = 200;
        goto LABEL_28;
      }
      v35 = 0;
      v36 = (unint64_t *)(a1 + 368);
      while (1)
      {
        v37 = *(_QWORD *)(a1 + 8);
        if (*(_QWORD *)(v37 + 24))
        {
          v38 = 0;
          if (v10)
          {
            v39 = v10;
            while (1)
            {
              v40 = (*(uint64_t (**)(_QWORD, char *, size_t))(v37 + 24))(*(_QWORD *)v37, a4, v39);
              if (v40 < 1)
                break;
              a4 += v40;
              v38 += v40;
              v39 -= v40;
              if (!v39)
                goto LABEL_44;
            }
            v38 = v40;
          }
        }
        else
        {
          v38 = -1;
        }
LABEL_44:
        if (v10 != v38)
          break;
        if (v35)
        {
          free(*v35);
          *v35 = 0;
        }
        *(_QWORD *)(a1 + 360) += v10;
        v41 = *(void (**)(_QWORD, float))(a1 + 128);
        if (v41)
        {
          v42 = *(_QWORD *)(a1 + 72);
          if (v42)
          {
            do
            {
              v43 = __ldxr(v36);
              v44 = v43 + v10;
            }
            while (__stxr(v44, v36));
            v41(*(_QWORD *)(a1 + 112), (float)((float)v44 * 100.0) / (float)v42);
          }
        }
        if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 232))
          || (v45 = *(_DWORD *)(a1 + 224), *(_DWORD *)(a1 + 224) = v45 + 1, !v45)
          && pthread_cond_broadcast((pthread_cond_t *)(a1 + 296))
          || pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232)))
        {
          v29 = "SemRelease";
          v30 = 241;
          goto LABEL_28;
        }
        v46 = 0;
        v35 = *(void ***)(a1 + 344);
        while (v35[1] != *(void **)(a1 + 360))
        {
          ++v46;
          v35 += 3;
          if (v46 == *(_QWORD *)(a1 + 352))
          {
            v27 = 0;
            goto LABEL_60;
          }
        }
        a4 = (char *)*v35;
        v10 = (size_t)v35[2];
      }
      v29 = "aaByteStreamWriteExpected";
      v30 = 229;
    }
    else
    {
      v29 = "data already written";
      v30 = 178;
    }
LABEL_28:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"writerProc", v30, 128, 0, v29, a7, a8, v52);
    v27 = 0xFFFFFFFFLL;
LABEL_60:
    pthread_mutex_unlock(v12);
    return v27;
  }
  v15 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(v15 + 40))
  {
    v16 = 0;
    if (a2)
    {
      v17 = a2;
      while (1)
      {
        v18 = (*(uint64_t (**)(_QWORD, char *, size_t, uint64_t))(v15 + 40))(*(_QWORD *)v15, a4, v17, a3);
        if (v18 < 1)
          break;
        a4 += v18;
        v16 += v18;
        a3 += v18;
        v17 -= v18;
        if (!v17)
          goto LABEL_16;
      }
      v16 = v18;
    }
  }
  else
  {
    v16 = -1;
  }
LABEL_16:
  if (v16 != v10)
  {
    v13 = "aaByteStreamPWriteExpected";
    v14 = 166;
    goto LABEL_24;
  }
  v22 = *(uint64_t (**)(_QWORD, float))(a1 + 128);
  if (v22)
  {
    v23 = *(_QWORD *)(a1 + 72);
    if (v23)
    {
      v24 = (unint64_t *)(a1 + 368);
      do
      {
        v25 = __ldxr(v24);
        v26 = v25 + v10;
      }
      while (__stxr(v26, v24));
      if ((v22(*(_QWORD *)(a1 + 112), (float)((float)v26 * 100.0) / (float)v23) & 0x80000000) != 0)
      {
        v13 = "progress_proc";
        v14 = 167;
        goto LABEL_24;
      }
    }
  }
  return 0;
}

uint64_t AEADecryptToStreamChunk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6, unint64_t a7, unint64_t a8, int a9)
{
  int DefaultNThreads;
  _BOOL4 v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  __int16 v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  int v37;
  int v38;
  int *v39;
  void *v40;
  void *v41;
  int *v42;
  uint64_t (*v43)(uint64_t, size_t, uint64_t, int, const void *, size_t, uint64_t, uint64_t);
  uint64_t (**v44)(void);
  uint64_t v45;
  uint64_t (**v46)(void);
  uint64_t (**v47)(void);
  uint64_t i;
  _QWORD *v49;
  unsigned int v50;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  __darwin_time_t v55;
  int v56;
  int Range;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t Worker;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  unint64_t v72;
  uint64_t v73;
  timeval v74;
  timespec v75;
  _QWORD v76[2];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  void *v84[2];
  void *v85[2];
  _BYTE v86[176];
  __int128 v87;
  __int128 __count;
  __int128 v89;
  _BOOL4 v90;
  _BOOL4 v91;
  uint64_t v92;

  DefaultNThreads = a9;
  v92 = *MEMORY[0x24BDAC8D0];
  v89 = 0u;
  __count = 0u;
  v87 = 0u;
  memset(v86, 0, sizeof(v86));
  *(_OWORD *)v85 = 0u;
  *(_OWORD *)v84 = 0u;
  v83 = 0u;
  v82 = 0u;
  v81 = 0u;
  v80 = 0u;
  v79 = 0u;
  v78 = 0u;
  v77 = 0u;
  if (!a9)
    DefaultNThreads = getDefaultNThreads();
  v76[0] = a1;
  v76[1] = a2;
  *(_QWORD *)&v83 = a3;
  *((_QWORD *)&v83 + 1) = a4;
  v84[0] = a5;
  *(_QWORD *)&__count = 3 * DefaultNThreads - 1;
  v18 = (a8 & 0x400) == 0 || *(_QWORD *)(a2 + 40) == 0;
  v90 = v18;
  if ((a8 & 0x100000000000000) != 0)
  {
    v19 = !v18;
    if (!*(_QWORD *)(a2 + 32))
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  HIDWORD(v89) = v19;
  v91 = a6 == 0;
  if (pthread_mutex_init((pthread_mutex_t *)v86, 0))
  {
    v22 = "MutexInit";
    v23 = 288;
    goto LABEL_15;
  }
  *(_DWORD *)&v86[64] = 0;
  if (pthread_mutex_init((pthread_mutex_t *)&v86[72], 0) || pthread_cond_init((pthread_cond_t *)&v86[136], 0))
  {
    v22 = "SemInit";
    v23 = 289;
    goto LABEL_15;
  }
  if (DefaultNThreads >= 2)
  {
    v37 = DefaultNThreads - 1;
    do
    {
      if (pthread_mutex_lock((pthread_mutex_t *)&v86[72])
        || (v38 = *(_DWORD *)&v86[64], ++*(_DWORD *)&v86[64], !v38)
        && pthread_cond_broadcast((pthread_cond_t *)&v86[136])
        || pthread_mutex_unlock((pthread_mutex_t *)&v86[72]))
      {
        v22 = "SemRelease";
        v23 = 292;
        goto LABEL_15;
      }
      --v37;
    }
    while (v37);
  }
  if (is_mul_ok(__count, 0x18uLL) && (unint64_t)(24 * __count) < 0x2000000001)
  {
    v40 = calloc(__count, 0x18uLL);
  }
  else
  {
    v39 = __error();
    v40 = 0;
    *v39 = 12;
  }
  *((_QWORD *)&v87 + 1) = v40;
  if (DefaultNThreads < 0)
  {
    *__error() = 12;
    v84[1] = 0;
    v42 = __error();
    v41 = 0;
    *v42 = 12;
  }
  else
  {
    v84[1] = calloc(DefaultNThreads, 0x18uLL);
    v41 = calloc(DefaultNThreads, 8uLL);
  }
  v85[0] = v41;
  if (!*((_QWORD *)&v87 + 1) || !v84[1] || !v41)
  {
    v24 = *__error();
    v22 = "malloc";
    v23 = 299;
    goto LABEL_16;
  }
  if (HIDWORD(v89))
    v43 = verifySegmentProc;
  else
    v43 = 0;
  v44 = (uint64_t (**)(void))AEADecryptAsyncStreamOpen((uint64_t)v76, (uint64_t)contextPassThroughProc, (uint64_t)v43, (uint64_t)writerProc_0, a8, DefaultNThreads);
  *(_QWORD *)&v77 = v44;
  if (!v44)
  {
    v22 = "AEADecryptAsyncStreamOpen";
    v23 = 308;
    goto LABEL_15;
  }
  if (a6)
  {
    v46 = AAChunkAsyncStreamOpen((uint64_t)v44, a6, a7, a8, DefaultNThreads, v45, v20, v21);
    *((_QWORD *)&v77 + 1) = v46;
    if (!v46)
    {
      v22 = "AAChunkAsyncStreamOpen";
      v23 = 317;
      goto LABEL_15;
    }
    v47 = v46;
    v44 = (uint64_t (**)(void))v77;
  }
  else
  {
    v47 = (uint64_t (**)(void))*((_QWORD *)&v77 + 1);
  }
  if (!v47)
    v47 = v44;
  *(_QWORD *)&v78 = v47;
  if (DefaultNThreads >= 1)
  {
    for (i = 0; i != DefaultNThreads; *((_QWORD *)v85[0] + i++) = v49)
    {
      v49 = (char *)v84[1] + 24 * i;
      *v49 = v76;
    }
  }
  v85[1] = ThreadPoolCreate(DefaultNThreads, (uint64_t)v85[0], (uint64_t)readerProc);
  if (!v85[1])
  {
    v22 = "ThreadPoolCreate";
    v23 = 329;
    goto LABEL_15;
  }
  while (2)
  {
    if (v90)
    {
      v50 = atomic_load((unsigned int *)&v89 + 2);
      if (v50 && v91)
      {
        while (!pthread_mutex_lock((pthread_mutex_t *)&v86[72]))
        {
          v74.tv_sec = 0;
          *(_QWORD *)&v74.tv_usec = 0;
          gettimeofday(&v74, 0);
          v52 = 1000 * v74.tv_usec;
          if (v74.tv_usec < 1000000)
          {
            v55 = v74.tv_sec + 1;
          }
          else
          {
            if (v52 >= 1999999999)
              v53 = 1999999999;
            else
              v53 = 1000 * v74.tv_usec;
            v54 = (v52 + 999999999 - v53) / 0x3B9ACA00uLL;
            v55 = v74.tv_sec + v54 + 2;
            v52 = v52 - 1000000000 * v54 - 1000000000;
          }
          v75.tv_sec = v55;
          v75.tv_nsec = v52;
          do
          {
            if (*(int *)&v86[64] > 0)
            {
              --*(_DWORD *)&v86[64];
              if (!pthread_mutex_unlock((pthread_mutex_t *)&v86[72]))
                goto LABEL_97;
              goto LABEL_107;
            }
            v56 = pthread_cond_timedwait((pthread_cond_t *)&v86[136], (pthread_mutex_t *)&v86[72], &v75);
          }
          while (!v56);
          if (v56 != 60 || pthread_mutex_unlock((pthread_mutex_t *)&v86[72]))
            break;
          if (aaAsyncByteStreamIsCancelled((_QWORD *)v78))
          {
            v22 = "aaAsyncByteStreamIsCancelled";
            v23 = 343;
            goto LABEL_15;
          }
          if (!v91)
            goto LABEL_97;
        }
LABEL_107:
        v22 = "SemTimedAcquire";
        v23 = 341;
        break;
      }
    }
    while (1)
    {
LABEL_97:
      v72 = 0;
      v73 = 0;
      Range = AAAsyncByteStreamGetRange((_QWORD *)v78, &v72, &v73);
      if (Range < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 352, 128, 0, "AAAsyncByteStreamGetRange", v63, v64, v71);
        v25 = 0;
LABEL_104:
        ThreadPoolSync((unsigned int *)v85[1]);
        goto LABEL_17;
      }
      if (Range)
        break;
      usleep(0x186A0u);
    }
    if (!v72)
    {
      v25 = 1;
      goto LABEL_104;
    }
    Worker = ThreadPoolGetWorker((uint64_t)v85[1], v58, v59, v60, v61, v62, v63, v64);
    if (Worker)
    {
      v70 = v72;
      *(_QWORD *)(Worker + 8) = v73;
      *(_QWORD *)(Worker + 16) = v70;
      if ((ThreadPoolRunWorker((uint64_t)v85[1], Worker, v66, v67, v68, v69, v20, v21) & 0x80000000) == 0)
        continue;
      v22 = "ThreadPoolRunWorker";
      v23 = 365;
    }
    else
    {
      v22 = "ThreadPoolGetWorker";
      v23 = 362;
    }
    break;
  }
LABEL_15:
  v24 = 0;
LABEL_16:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", v23, 128, v24, v22, v20, v21, v71);
  v25 = 0;
LABEL_17:
  if (DefaultNThreads >= 1)
  {
    do
    {
      if (!pthread_mutex_lock((pthread_mutex_t *)&v86[72]))
      {
        v26 = (*(_DWORD *)&v86[64])++;
        if (v26 || !pthread_cond_broadcast((pthread_cond_t *)&v86[136]))
          pthread_mutex_unlock((pthread_mutex_t *)&v86[72]);
      }
      --DefaultNThreads;
    }
    while (DefaultNThreads);
  }
  if ((ThreadPoolDestroy((uint64_t)v85[1]) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 373, 128, 0, "Readers reported errors", v27, v28, v71);
    v25 = 0;
  }
  if ((AAAsyncByteStreamClose(*((uint64_t (***)(void))&v77 + 1)) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 374, 128, 0, "Async stream reported errors", v29, v30, v71);
    v25 = 0;
  }
  if ((AAAsyncByteStreamClose((uint64_t (**)(void))v77) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c", (uint64_t)"AEADecryptToStreamChunk", 375, 128, 0, "Async stream reported errors", v31, v32, v71);
    v25 = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)v86);
  if (!pthread_mutex_destroy((pthread_mutex_t *)&v86[72]))
    pthread_cond_destroy((pthread_cond_t *)&v86[136]);
  v33 = (void *)*((_QWORD *)&v87 + 1);
  if (*((_QWORD *)&v87 + 1))
  {
    if ((_QWORD)__count)
    {
      v34 = 0;
      v35 = 0;
      do
      {
        free(*(void **)(*((_QWORD *)&v87 + 1) + v34));
        ++v35;
        v34 += 24;
      }
      while (v35 < (unint64_t)__count);
      v33 = (void *)*((_QWORD *)&v87 + 1);
    }
    free(v33);
  }
  free(v84[1]);
  free(v85[0]);
  if (v25)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t AEADecryptToStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6, int a7)
{
  return AEADecryptToStreamChunk(a1, a2, a3, a4, a5, 0, 0, a6, a7);
}

size_t PCompressLZBITMAPEncode(uint8_t *a1, size_t a2, const uint8_t *a3, size_t a4)
{
  size_t result;

  result = compression_encode_buffer(a1, a2, a3, a4, 0, COMPRESSION_LZBITMAP);
  if (!result)
    return -1;
  return result;
}

size_t PCompressLZBITMAPDecode(uint8_t *a1, size_t a2, const uint8_t *a3, size_t a4)
{
  size_t result;

  result = compression_decode_buffer(a1, a2, a3, a4, 0, COMPRESSION_LZBITMAP);
  if (!result)
    return -1;
  return result;
}

_QWORD *PagedFileCreate(const char *a1, unint64_t a2, unint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t st_size;
  off_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  size_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  __int16 v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unsigned int v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  stat v57;

  memset(&v57, 0, sizeof(v57));
  if (stat(a1, &v57))
  {
    v10 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", 320, 21, v10, "%s", v11, v12, (char)a1);
    return 0;
  }
  st_size = v57.st_size;
  if (v57.st_size <= a2)
    v14 = a2;
  else
    v14 = v57.st_size;
  v15 = v14 + 4095;
  if (v15 >= 0xFFFFFFEF000)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", 324, 21, 0, "File is too large to be patched in place", v8, v9, v55);
    return 0;
  }
  v18 = (v15 >> 12) + 16;
  if ((a3 >> 12) <= 1)
    v19 = 1;
  else
    v19 = a3 >> 12;
  v20 = v19 + v18;
  v21 = (v19 << 12) + 4096 + 4 * v19 + 16 * (v18 & 0x3FFFFFFF) + 8 * v20 + 8 * v20 + 216;
  v22 = malloc(v21);
  v16 = v22;
  if (!v22)
  {
    v29 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", 339, 21, *v29, "malloc", v30, v31, v55);
    return v16;
  }
  bzero(v22, v21);
  if (a4 >= 2)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Opening paged file %s, %u pages in file, %u pages in cache, %u pages total, memory usage: %zu B\n", a1, v18, v19, v19 + v18, v21);
  *(_DWORD *)v16 = -1;
  v16[1] = st_size;
  v16[2] = a2;
  *((_DWORD *)v16 + 32) = a4;
  *((_DWORD *)v16 + 6) = v18;
  *((_DWORD *)v16 + 7) = v19;
  *((_DWORD *)v16 + 8) = v20;
  v23 = open(a1, 2);
  *(_DWORD *)v16 = v23;
  if (v23 < 0)
  {
    v26 = *__error();
    v56 = (char)a1;
    v27 = "%s";
    v28 = 357;
    goto LABEL_23;
  }
  v56 = 1;
  if (fcntl(v23, 48))
    fwrite("Warning: couldn't set F_NOCACHE on paged file\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  if (ftruncate(*(_DWORD *)v16, v18 << 12))
  {
    v26 = *__error();
    v56 = (char)a1;
    v27 = "%s";
    v28 = 365;
LABEL_23:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileCreate", v28, 21, v26, v27, v24, v25, v56);
    if ((*(_DWORD *)v16 & 0x80000000) == 0)
      close(*(_DWORD *)v16);
    free(v16);
    return 0;
  }
  v32 = (char *)(v16 + 24);
  v33 = *((unsigned int *)v16 + 6);
  v34 = *((unsigned int *)v16 + 7);
  v35 = (uint64_t)v16 + 4 * v33 + 192;
  v36 = v35 + 4 * v33;
  v37 = v36 + 4 * v33;
  v16[14] = v36;
  v16[15] = v37;
  v38 = v37 + 4 * v33;
  v16[7] = v38;
  v16[8] = v35;
  v39 = *((unsigned int *)v16 + 8);
  v40 = v38 + 4 * v39;
  v41 = v40 + 4 * v39;
  v16[5] = v41;
  v16[6] = v16 + 24;
  v42 = v41 + 8 * v39;
  v16[9] = v40;
  v16[10] = v42;
  v43 = v42 + 4096;
  v44 = v42 + 4096 + ((_DWORD)v34 << 12);
  v16[11] = v43;
  v16[12] = v44;
  if (v44 + 4 * v34 > (unint64_t)v16 + v21)
  {
    v27 = "in memory allocation for PagedFile";
    v28 = 378;
    v26 = 0;
    goto LABEL_23;
  }
  if ((_DWORD)v39)
  {
    v45 = 0;
    do
    {
      *(_QWORD *)(v38 + 8 * v39) = 0;
      *(_DWORD *)(v38 + 4 * v45) = -1;
      *(_DWORD *)(v38 + 4 * v39) = -1;
      ++v45;
      ++v39;
    }
    while (v45 < *((unsigned int *)v16 + 8));
    v46 = *((_DWORD *)v16 + 6);
  }
  else
  {
    v46 = v33;
  }
  if (v46)
  {
    v47 = 0;
    v48 = &v32[4 * v33];
    v49 = &v32[12 * v33];
    v50 = &v32[8 * v33];
    do
    {
      *(_DWORD *)&v32[4 * v47] = -1;
      *(_DWORD *)&v48[4 * v47] = -1;
      *(_DWORD *)&v50[4 * v47] = -1;
      *(_DWORD *)&v49[4 * v47++] = -1;
    }
    while (v47 < v46);
    v51 = 0;
    v52 = 0;
    v53 = st_size;
    do
    {
      if (v51 >= st_size)
        break;
      v54 = v53 - 4096;
      if (v53 >= 0x1000)
        v53 = 4096;
      *(_QWORD *)(v41 + 8 * v52) = v53;
      *(_DWORD *)(v38 + 4 * v52) = v52;
      *(_DWORD *)&v32[4 * v52] = v52;
      ++v52;
      v51 += 4096;
      v53 = v54;
    }
    while (v52 < v46);
  }
  return v16;
}

uint64_t PagedFileDestroy(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int i;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;

  if (result)
  {
    v8 = result;
    for (i = *(_DWORD *)(result + 24); ; ++i)
    {
      if (i >= *(_DWORD *)(v8 + 32))
      {
        v10 = 1;
        goto LABEL_8;
      }
      if (storeCachePos(v8, i, a3, a4, a5, a6, a7, a8))
        break;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"flushCache", 243, 21, 0, "flushing cache pos", a7, a8, v19);
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDestroy", 423, 21, 0, "flush cache", v11, v12, v20);
    v10 = 0;
LABEL_8:
    if ((*(_DWORD *)v8 & 0x80000000) == 0)
    {
      if (ftruncate(*(_DWORD *)v8, *(_QWORD *)(v8 + 16)))
      {
        v13 = __error();
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDestroy", 427, 21, *v13, "Final truncate", v14, v15, v19);
        v10 = 0;
      }
      if (fcntl(*(_DWORD *)v8, 51, 0) == -1)
      {
        v16 = __error();
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDestroy", 432, 21, *v16, "Final FULLSYNC", v17, v18, v21);
        v10 = 0;
      }
      close(*(_DWORD *)v8);
    }
    if (*(int *)(v8 + 128) >= 2)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Closing paged file, input size: %llu B, output size: %llu B, bytes read: %llu B, bytes written: %llu B\n", *(_QWORD *)(v8 + 8), *(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 136), *(_QWORD *)(v8 + 144));
    free((void *)v8);
    if (v10)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t PagedFileDump(uint64_t a1, const char *a2)
{
  FILE **v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int16 v19;
  const char *v20;
  char v22;

  v3 = (FILE **)MEMORY[0x24BDAC8D8];
  v4 = "current PagedFile state";
  if (a2)
    v4 = a2;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "*** %s\n", v4);
  LODWORD(v7) = *(_DWORD *)(a1 + 32);
  if (!(_DWORD)v7)
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
    goto LABEL_29;
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  do
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v8);
    if (!v15)
    {
      if (v8 < *(unsigned int *)(a1 + 24))
        ++v13;
      else
        ++v14;
    }
    v16 = *(unsigned int *)(*(_QWORD *)(a1 + 56) + 4 * v8);
    if ((_DWORD)v16 != -1)
    {
      ++v9;
      v11 += v15;
      if (v8 != *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v16))
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", 472, 21, 0, "invalid reverse index for IN", v5, v6, v22);
    }
    v17 = *(unsigned int *)(*(_QWORD *)(a1 + 72) + 4 * v8);
    if ((_DWORD)v17 != -1)
    {
      ++v10;
      v12 += v15;
      if (v8 != *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v17))
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", 480, 21, 0, "invalid reverse index for OUT", v5, v6, v22);
    }
    if (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v8) != -1 && *(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * v8) != -1)
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", 483, 21, 0, "inconsistency in inPage/outPage indices", v5, v6, v22);
    v18 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v8);
    if (v15)
    {
      if (v18 == -1 && *(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * v8) == -1)
      {
        v19 = 485;
        v20 = "inconsistency in nRefs != 0";
LABEL_25:
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileDump", v19, 21, 0, v20, v5, v6, v22);
      }
    }
    else if (v18 != -1 || *(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * v8) != -1)
    {
      v19 = 486;
      v20 = "inconsistency in nRefs == 0";
      goto LABEL_25;
    }
    ++v8;
    v7 = *(unsigned int *)(a1 + 32);
  }
  while (v8 < v7);
  v3 = (FILE **)MEMORY[0x24BDAC8D8];
LABEL_29:
  fprintf(*v3, "  %u total pages\n", v7);
  fprintf(*v3, "  %u free pages in file\n", v13);
  fprintf(*v3, "  %u free pages in cache\n", v14);
  fprintf(*v3, "  %u input pages stored, %llu bytes referenced\n", v9, v11);
  return fprintf(*v3, "  %u output pages stored, %llu bytes referenced\n", v10, v12);
}

uint64_t PagedFileRetainIn(_QWORD *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char vars0;

  if (!a3)
    return 0;
  v8 = a1[6];
  while (1)
  {
    v9 = *(unsigned int *)(v8 + 4 * (a2 >> 12));
    if ((_DWORD)v9 == -1)
      break;
    v10 = a1[15];
    *(_DWORD *)(a1[14] + 4 * (a2 >> 12)) = v9;
    v11 = 4096 - (a2 & 0xFFF);
    *(_DWORD *)(v10 + 4 * v9) = a2 >> 12;
    if (v11 >= a3)
      v11 = a3;
    *(_QWORD *)(a1[5] + 8 * v9) += v11;
    a2 += v11;
    a3 -= v11;
    if (!a3)
      return 0;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileRetainIn", 503, 21, 0, "input page is not stored", a7, a8, vars0);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileReleaseIn(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  uint64_t v11;
  FILE **v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v18;

  if (!a3)
    return 0;
  v8 = a3;
  v11 = *(_QWORD *)(a1 + 48);
  v12 = (FILE **)MEMORY[0x24BDAC8D8];
  while (1)
  {
    v13 = 4096 - (a2 & 0xFFF) >= v8 ? v8 : 4096 - (a2 & 0xFFF);
    v14 = *(unsigned int *)(v11 + 4 * (a2 >> 12));
    if ((_DWORD)v14 == -1)
      break;
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(v15 + 8 * v14) - v13;
    *(_QWORD *)(v15 + 8 * v14) = v16;
    if (!v16)
    {
      if (*(int *)(a1 + 128) >= 3)
      {
        fprintf(*v12, "PagedFile: input page %u removed from storage\n", a2 >> 12);
        v11 = *(_QWORD *)(a1 + 48);
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v14) = -1;
      *(_DWORD *)(v11 + 4 * (a2 >> 12)) = -1;
    }
    a2 += v13;
    v8 -= v13;
    if (!v8)
      return 0;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileReleaseIn", 525, 21, 0, "input page is not stored", a7, a8, v18);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileRetainOut(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  FILE **v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int FreeCachePos;
  unsigned int v17;
  char v19;

  if (!a3)
    return 0;
  v8 = a3;
  v9 = a2;
  v11 = *(_QWORD *)(a1 + 64);
  v12 = (FILE **)MEMORY[0x24BDAC8D8];
  while (1)
  {
    v13 = v9 >> 12;
    if (4096 - (v9 & 0xFFF) >= v8)
      v14 = v8;
    else
      v14 = 4096 - (v9 & 0xFFF);
    v15 = *(unsigned int *)(v11 + 4 * v13);
    if ((_DWORD)v15 != -1)
      goto LABEL_11;
    FreeCachePos = getFreeCachePos(a1, a2, a3, a4, a5, a6, a7, a8);
    if (FreeCachePos == -1)
      break;
    v17 = FreeCachePos;
    if (*(int *)(a1 + 128) >= 3)
      fprintf(*v12, "PagedFile: assigning cache[%u] to new output page %u\n", FreeCachePos, v9 >> 12);
    v15 = v17;
    v11 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * v17) = v13;
    *(_DWORD *)(v11 + 4 * (v9 >> 12)) = v17;
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v15) += v14;
    v9 += v14;
    v8 -= v14;
    if (!v8)
      return 0;
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileRetainOut", 555, 21, 0, "no storage available for output page", a7, a8, v19);
  return 0xFFFFFFFFLL;
}

uint64_t getFreeCachePos(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  __int16 v15;
  char v17;

  v8 = *(unsigned int *)(a1 + 24);
  v9 = *(unsigned int *)(a1 + 32);
  if (v8 >= v9)
  {
LABEL_13:
    v14 = "no cache";
    v15 = 231;
LABEL_14:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"getFreeCachePos", v15, 21, 0, v14, a7, a8, v17);
    return 0xFFFFFFFFLL;
  }
  else
  {
    v11 = 0;
    v12 = v8 - v9;
    v13 = 0xFFFFFFFFLL;
    do
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v8 + 8 * v11))
        return (v8 + v11);
      if ((_DWORD)v13 == -1
        || *(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v11) < *(_DWORD *)(*(_QWORD *)(a1 + 96)
                                                                   + 4 * (v13 - v8)))
      {
        v13 = (v8 + v11);
      }
      ++v11;
    }
    while (v12 + v11);
    if ((_DWORD)v13 == -1)
      goto LABEL_13;
    if (*(int *)(a1 + 128) >= 3)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "PagedFile: storing oldest cache[%u] to file\n", v13);
    if (storeCachePos(a1, v13, a3, a4, a5, a6, a7, a8))
    {
      v14 = "flushing cache pos";
      v15 = 235;
      goto LABEL_14;
    }
  }
  return v13;
}

uint64_t PagedFileReleaseAllIn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PagedFileReleaseIn(a1, 0, *(_QWORD *)(a1 + 8), a4, a5, a6, a7, a8);
}

BOOL PagedFileHasNoIn(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v2) != -1 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v2))
        break;
      v3 = ++v2 >= v1;
    }
    while (v1 != v2);
  }
  else
  {
    return 1;
  }
  return v3;
}

BOOL PagedFileHasAllOut(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v2)
  {
    v3 = 0;
    v4 = 0;
    while (1)
    {
      if (*(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * v3) != -1)
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v3);
        v4 += v5;
        if (v3 < (v1 >> 12) && v5 != 4096)
          break;
      }
      if (v2 == ++v3)
        return v4 == v1;
    }
    return 0;
  }
  else
  {
    v4 = 0;
    return v4 == v1;
  }
}

uint64_t PagedFileReadAndReleaseIn(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  unint64_t v9;
  unint64_t v12;
  size_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t FreeCachePos;
  uint64_t v18;
  BOOL v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v31;
  __int16 v32;
  char v33;

  if (!a3)
    return 0;
  v8 = (char *)a4;
  v9 = a3;
  while (1)
  {
    v12 = a2 >> 12;
    if (4096 - (a2 & 0xFFF) >= v9)
      v13 = v9;
    else
      v13 = 4096 - (a2 & 0xFFF);
    v14 = *(_DWORD *)(a1 + 24);
    if (v14 <= v12)
    {
      v31 = "invalid input PAGE";
      v32 = 252;
      goto LABEL_27;
    }
    v15 = *(unsigned int *)(*(_QWORD *)(a1 + 48) + 4 * v12);
    if ((_DWORD)v15 == -1)
    {
      v31 = "input page is not stored";
      v32 = 254;
      goto LABEL_27;
    }
    v16 = (a2 >> 12);
    if (v15 >= v14)
    {
      v18 = 0xFFFFFFFFLL;
    }
    else
    {
      FreeCachePos = getFreeCachePos(a1, v15, a3, a4, a5, a6, a7, a8);
      if ((_DWORD)FreeCachePos == -1)
      {
        v31 = "could not get a free pos from cache";
        v32 = 261;
        goto LABEL_27;
      }
      v18 = FreeCachePos;
      LODWORD(v15) = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v16);
      v14 = *(_DWORD *)(a1 + 24);
    }
    if (v15 < v14)
      break;
LABEL_15:
    v19 = v15 >= v14;
    v20 = v15 - v14;
    if (!v19 || v15 >= *(_DWORD *)(a1 + 32))
    {
      v31 = "could not move input page in cache";
      v32 = 273;
      goto LABEL_27;
    }
    v21 = *(_DWORD *)(a1 + 104);
    *(_DWORD *)(a1 + 104) = v21 + 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v20) = v21;
    v22 = cacheData(a1, v15, v18, a4, a5, a6, a7, a8);
    if (!v22)
      goto LABEL_28;
    memcpy(v8, (const void *)(v22 + (a2 & 0xFFF)), v13);
    PagedFileReleaseIn(a1, a2, v13, v25, v26, v27, v28, v29);
    a2 += v13;
    v8 += v13;
    v9 -= v13;
    if (!v9)
      return 0;
  }
  if (!movePage(a1, v15, v18, a4, a5, a6, a7, a8))
  {
    LODWORD(v15) = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v16);
    v14 = *(_DWORD *)(a1 + 24);
    goto LABEL_15;
  }
  v31 = "moving page from disk to cache";
  v32 = 268;
LABEL_27:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"inputPageData", v32, 21, 0, v31, a7, a8, v33);
LABEL_28:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileReadAndReleaseIn", 615, 21, 0, "unable to load input page", v23, v24, v33);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileRetainAndWriteOut(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  unint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t FreeCachePos;
  uint64_t v23;
  BOOL v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  char v33;

  if (!a3)
    return 0;
  v8 = (char *)a4;
  v9 = a3;
  while (1)
  {
    if (4096 - (a2 & 0xFFF) >= v9)
      v12 = v9;
    else
      v12 = 4096 - (a2 & 0xFFF);
    if (PagedFileRetainOut(a1, a2, v12, a4, a5, a6, a7, a8))
    {
      v31 = "retain output chunk";
      v32 = 639;
      goto LABEL_31;
    }
    v19 = *(_DWORD *)(a1 + 24);
    if (v19 <= (a2 >> 12))
    {
      v29 = "invalid output PAGE";
      v30 = 286;
      goto LABEL_29;
    }
    v20 = *(unsigned int *)(*(_QWORD *)(a1 + 64) + 4 * (a2 >> 12));
    if ((_DWORD)v20 == -1)
    {
      v29 = "output page is not stored";
      v30 = 288;
      goto LABEL_29;
    }
    v21 = (a2 >> 12);
    if (v20 >= v19)
    {
      v23 = 0xFFFFFFFFLL;
    }
    else
    {
      FreeCachePos = getFreeCachePos(a1, v20, v13, v14, v15, v16, v17, v18);
      if ((_DWORD)FreeCachePos == -1)
      {
        v29 = "could not get a free pos from cache";
        v30 = 294;
        goto LABEL_29;
      }
      v23 = FreeCachePos;
      LODWORD(v20) = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v21);
      v19 = *(_DWORD *)(a1 + 24);
    }
    if (v20 < v19)
      break;
LABEL_16:
    v24 = v20 >= v19;
    v25 = v20 - v19;
    if (!v24 || v20 >= *(_DWORD *)(a1 + 32))
    {
      v29 = "could not move output page in cache";
      v30 = 305;
      goto LABEL_29;
    }
    v26 = *(_DWORD *)(a1 + 104);
    *(_DWORD *)(a1 + 104) = v26 + 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v25) = v26;
    v27 = cacheData(a1, v20, v23, v14, v15, v16, v17, v18);
    if (!v27)
      goto LABEL_30;
    memcpy((void *)(v27 + (a2 & 0xFFF)), v8, v12);
    a2 += v12;
    v8 += v12;
    v9 -= v12;
    if (!v9)
      return 0;
  }
  if (!movePage(a1, v20, v23, v14, v15, v16, v17, v18))
  {
    LODWORD(v20) = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v21);
    v19 = *(_DWORD *)(a1 + 24);
    goto LABEL_16;
  }
  v29 = "moving page from disk to cache";
  v30 = 301;
LABEL_29:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"outputPageData", v30, 21, 0, v29, v17, v18, v33);
LABEL_30:
  v31 = "unable to load output page";
  v32 = 643;
LABEL_31:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"PagedFileRetainAndWriteOut", v32, 21, 0, v31, v17, v18, v33);
  return 0xFFFFFFFFLL;
}

uint64_t storeCachePos(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v8 = *(unsigned int *)(a1 + 24);
  if (v8 > a2 || *(_DWORD *)(a1 + 32) <= a2)
  {
    v18 = "invalid cache POS";
    v19 = 165;
    goto LABEL_9;
  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(v11 + 8 * a2);
  if (!v12)
    return 0;
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(unsigned int *)(v13 + 4 * a2);
  if ((_DWORD)v14 == -1)
  {
    v20 = *(unsigned int *)(*(_QWORD *)(a1 + 72) + 4 * a2);
    if ((_DWORD)v20 != -1)
    {
      if (*(_QWORD *)(v11 + 8 * v20))
      {
        v21 = -(int)v8;
        v22 = v8 - 1;
        do
        {
          if (v22 == -1)
            goto LABEL_18;
          v23 = *(_QWORD *)(v11 + 8 * v22);
          ++v21;
          --v22;
        }
        while (v23);
        if (v21 == 1)
        {
LABEL_18:
          v18 = "no free pages in file";
          v19 = 208;
          goto LABEL_9;
        }
        v28 = -v21;
        if (*(int *)(a1 + 128) >= 3)
          fwrite("PagedFile: vacating file pos\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        if (movePage(a1, v20, v28, a4, a5, a6, a7, a8))
        {
          v18 = "vacating page in file";
          v19 = 210;
          goto LABEL_9;
        }
      }
      if (*(int *)(a1 + 128) >= 3)
        fwrite("PagedFile: storing cached output page to file\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      result = movePage(a1, a2, v20, a4, a5, a6, a7, a8);
      if ((_DWORD)result)
      {
        v18 = "moving output page from cache to disk";
        v19 = 213;
        goto LABEL_9;
      }
      return result;
    }
    v18 = "nRefs inconsistency";
    v19 = 215;
LABEL_9:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"storeCachePos", v19, 21, 0, v18, a7, a8, v29);
    return 0xFFFFFFFFLL;
  }
  v15 = *(unsigned int *)(*(_QWORD *)(a1 + 112) + 4 * v14);
  if ((_DWORD)v15 == -1)
  {
    v18 = "cached input page does not have a file position";
    v19 = 175;
    goto LABEL_9;
  }
  if (*(_DWORD *)(*(_QWORD *)(a1 + 120) + 4 * v15) == (_DWORD)v14)
  {
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v14) = v15;
    *(_QWORD *)(v11 + 8 * v15) = v12;
    *(_DWORD *)(v13 + 4 * v15) = v14;
    v17 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)(v17 + 4 * v15) = -1;
    *(_QWORD *)(v11 + 8 * a2) = 0;
    *(_DWORD *)(v13 + 4 * a2) = -1;
    *(_DWORD *)(v17 + 4 * a2) = -1;
    return result;
  }
  v24 = -(int)v8;
  v25 = v8 - 1;
  do
  {
    if (v25 == -1)
      goto LABEL_24;
    v26 = *(_QWORD *)(v11 + 8 * v25);
    ++v24;
    --v25;
  }
  while (v26);
  if (v24 == 1)
  {
LABEL_24:
    v18 = "no free pages in file";
    v19 = 196;
    goto LABEL_9;
  }
  v27 = -v24;
  if (*(int *)(a1 + 128) >= 3)
    fwrite("PagedFile: storing cached input page to file\n", 0x2DuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  result = movePage(a1, a2, v27, a4, a5, a6, a7, a8);
  if ((_DWORD)result)
  {
    v18 = "moving input page from cache to disk";
    v19 = 198;
    goto LABEL_9;
  }
  return result;
}

uint64_t movePage(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  const char *v10;
  __int16 v11;
  uint64_t v14;
  unsigned int v15;
  uint64_t result;
  unsigned int v17;
  uint64_t v19;
  int v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v8 = *(_DWORD *)(a1 + 32);
  if (v8 <= a2 || v8 <= a3)
  {
    v10 = "invalid SRC/DST";
    v11 = 77;
LABEL_10:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"movePage", v11, 21, 0, v10, a7, a8, v39);
    return 0xFFFFFFFFLL;
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v14 + 8 * a2))
  {
    v10 = "SRC is empty";
    v11 = 78;
    goto LABEL_10;
  }
  v15 = a3;
  if (*(_QWORD *)(v14 + 8 * a3))
  {
    v10 = "DST is not empty";
    v11 = 79;
    goto LABEL_10;
  }
  v17 = *(_DWORD *)(a1 + 24);
  if (v17 > a2 && v17 > a3)
  {
    v22 = *(unsigned int *)(*(_QWORD *)(a1 + 56) + 4 * a2);
    if ((_DWORD)v22 != -1)
      *(_DWORD *)(*(_QWORD *)(a1 + 112) + 4 * v22) = a3;
    *(_DWORD *)(*(_QWORD *)(a1 + 120) + 4 * a3) = v22;
    if (*(int *)(a1 + 128) >= 3)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "PagedFile: moving page from file[%u] to file[%u]\n", a2, a3);
    if (pread(*(_DWORD *)a1, *(void **)(a1 + 80), 0x1000uLL, a2 << 12) != 4096)
    {
      v10 = "reading page";
      v11 = 93;
      goto LABEL_10;
    }
    if (pwrite(*(_DWORD *)a1, *(const void **)(a1 + 80), 0x1000uLL, v15 << 12) != 4096)
    {
      v10 = "writing page";
      v11 = 94;
      goto LABEL_10;
    }
    *(int64x2_t *)(a1 + 136) = vaddq_s64(*(int64x2_t *)(a1 + 136), vdupq_n_s64(0x1000uLL));
  }
  else if (v17 > a2 || v17 <= a3)
  {
    if (v17 <= a2 || v17 > a3)
    {
      if (*(int *)(a1 + 128) >= 3)
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "PagedFile: moving page from cache[%u] to cache[%u]\n", a2, a3);
      v26 = (void *)cacheData(a1, v15, a3, a4, a5, a6, a7, a8);
      v33 = (const void *)cacheData(a1, a2, v27, v28, v29, v30, v31, v32);
      memcpy(v26, v33, 0x1000uLL);
    }
    else
    {
      v23 = *(unsigned int *)(*(_QWORD *)(a1 + 56) + 4 * a2);
      if ((_DWORD)v23 != -1)
        *(_DWORD *)(*(_QWORD *)(a1 + 112) + 4 * v23) = a2;
      *(_DWORD *)(*(_QWORD *)(a1 + 120) + 4 * a2) = v23;
      if (*(int *)(a1 + 128) >= 3)
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "PagedFile: moving page from file[%u] to cache[%u]\n", a2, a3);
      v24 = *(_DWORD *)a1;
      v25 = (void *)cacheData(a1, v15, a3, a4, a5, a6, a7, a8);
      if (pread(v24, v25, 0x1000uLL, a2 << 12) != 4096)
      {
        v10 = "reading page";
        v11 = 121;
        goto LABEL_10;
      }
      *(_QWORD *)(a1 + 136) += 4096;
    }
  }
  else
  {
    v19 = *(unsigned int *)(*(_QWORD *)(a1 + 56) + 4 * a2);
    if ((_DWORD)v19 != -1)
      *(_DWORD *)(*(_QWORD *)(a1 + 112) + 4 * v19) = a3;
    *(_DWORD *)(*(_QWORD *)(a1 + 120) + 4 * a3) = v19;
    if (*(int *)(a1 + 128) >= 3)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "PagedFile: moving page from cache[%u] to file[%u]\n", a2, a3);
    v20 = *(_DWORD *)a1;
    v21 = (const void *)cacheData(a1, a2, a3, a4, a5, a6, a7, a8);
    if (pwrite(v20, v21, 0x1000uLL, v15 << 12) != 4096)
    {
      v10 = "writing page";
      v11 = 108;
      goto LABEL_10;
    }
    *(_QWORD *)(a1 + 144) += 4096;
  }
  v34 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v34 + 8 * v15) = *(_QWORD *)(v34 + 8 * a2);
  *(_QWORD *)(v34 + 8 * a2) = 0;
  v35 = *(_QWORD *)(a1 + 56);
  v36 = *(unsigned int *)(v35 + 4 * a2);
  *(_DWORD *)(v35 + 4 * v15) = v36;
  *(_DWORD *)(v35 + 4 * a2) = -1;
  if ((_DWORD)v36 != -1)
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v36) = v15;
  v37 = *(_QWORD *)(a1 + 72);
  v38 = *(unsigned int *)(v37 + 4 * a2);
  *(_DWORD *)(v37 + 4 * v15) = v38;
  *(_DWORD *)(v37 + 4 * a2) = -1;
  result = 0;
  if ((_DWORD)v38 != -1)
    *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v38) = v15;
  return result;
}

uint64_t cacheData(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  char vars0;

  v8 = *(_DWORD *)(a1 + 24);
  v9 = a2 >= v8;
  v10 = a2 - v8;
  if (v9 && *(_DWORD *)(a1 + 32) > a2)
    return *(_QWORD *)(a1 + 88) + (v10 << 12);
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c", (uint64_t)"cacheData", 66, 21, 0, "invalid cache pos", a7, a8, vars0);
  return 0;
}

void AAPathFilterApply_cold_1(int a1, const regex_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;

  v2 = a1;
  OUTLINED_FUNCTION_0(a1, a2, *MEMORY[0x24BDAC8D0], v7, v8, v9, v10, v11, v12, v13, v14, v15);
  OUTLINED_FUNCTION_2((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathFilter.c", (uint64_t)"prepareFilter", 130, v3, v4, "compile regex (err=%i, msg=%s)", v5, v6, v2);
  OUTLINED_FUNCTION_1();
}

void AAPathFilterApply_cold_2(int a1, const regex_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;

  v2 = a1;
  OUTLINED_FUNCTION_0(a1, a2, *MEMORY[0x24BDAC8D0], v7, v8, v9, v10, v11, v12, v13, v14, v15);
  OUTLINED_FUNCTION_2((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathFilter.c", (uint64_t)"prepareFilter", 119, v3, v4, "compile regex (err=%i, msg=%s)", v5, v6, v2);
  OUTLINED_FUNCTION_1();
}

void pc_log_error_cold_1(uint64_t a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109378;
  v2[1] = a2;
  v3 = 2080;
  v4 = a1;
  _os_log_error_impl(&dword_20A376000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[0x%08x] %s", (uint8_t *)v2, 0x12u);
}

int BZ2_bzDecompress(bz_stream *strm)
{
  return MEMORY[0x24BEDA940](strm);
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  return MEMORY[0x24BEDA948](strm);
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  return MEMORY[0x24BEDA950](strm, *(_QWORD *)&verbosity, *(_QWORD *)&small);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x24BDAC2D0](bytes, count);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
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

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x24BDAD040](flagset_d, *(_QWORD *)&flag);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x24BDAD058](acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x24BDAD060](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x24BDAD070](acl, *(_QWORD *)&entry_id, entry_p);
}

acl_t acl_get_fd_np(int fd, acl_type_t type)
{
  return (acl_t)MEMORY[0x24BDAD078](*(_QWORD *)&fd, *(_QWORD *)&type);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x24BDAD088](flagset_d, *(_QWORD *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x24BDAD090](obj_p, flagset_p);
}

int acl_get_permset_mask_np(acl_entry_t entry_d, acl_permset_mask_t *mask_p)
{
  return MEMORY[0x24BDAD0A0](entry_d, mask_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x24BDAD0A8](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x24BDAD0B0](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x24BDAD0B8](*(_QWORD *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x24BDAD0C0](*(_QWORD *)&fd, acl);
}

int acl_set_permset_mask_np(acl_entry_t entry_d, acl_permset_mask_t mask)
{
  return MEMORY[0x24BDAD0E0](entry_d, mask);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x24BDAD0E8](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x24BDAD0F0](entry_d, *(_QWORD *)&tag_type);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x24BDAD368]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x24BDAD590]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x24BDAD5B8]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x24BDAD5E0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x24BDAD5F0]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x24BDAD600]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x24BDAD608]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x24BDAD610]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x24BDAD628]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x24BDAD6B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x24BDAD6B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x24BDAD6C0]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccscrypt()
{
  return MEMORY[0x24BDAD808]();
}

uint64_t ccscrypt_storage_size()
{
  return MEMORY[0x24BDAD810]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x24BDAD988](a1, *(_QWORD *)&a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x24BDAD9C8](a1, a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB980](*(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB990](*(_QWORD *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

uint64_t compression_stream_identify_algorithm()
{
  return MEMORY[0x24BEDB9A0]();
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x24BDAE2B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x24BDAE2B8](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAE2C8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE360](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE388](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x24BDAE3A8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x24BDAE420](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x24BDAE478](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE4E8](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE4F8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x24BDAE510](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x24BDAE588](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x24BDAE620](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x24BDAE630](a1, a2, a3, a4, a5);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x24BDAE718](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x24BDAE728](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x24BDAE908]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x24BDAEA18](a1, *(_QWORD *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEA20](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAEA28](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAEA70](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

uint64_t lzma_code()
{
  return MEMORY[0x24BEDC560]();
}

uint64_t lzma_end()
{
  return MEMORY[0x24BEDC568]();
}

uint64_t lzma_stream_buffer_bound()
{
  return MEMORY[0x24BEDC570]();
}

uint64_t lzma_stream_decoder()
{
  return MEMORY[0x24BEDC578]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x24BDAEE10](*(_QWORD *)&gid, uu);
}

int mbr_sid_to_string(const nt_sid_t *sid, char *string)
{
  return MEMORY[0x24BDAEE20](sid, string);
}

int mbr_sid_to_uuid(const nt_sid_t *sid, uuid_t uu)
{
  return MEMORY[0x24BDAEE28](sid, uu);
}

int mbr_string_to_sid(const char *string, nt_sid_t *sid)
{
  return MEMORY[0x24BDAEE30](string, sid);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x24BDAEE38](*(_QWORD *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x24BDAEE40](uu, uid_or_gid, id_type);
}

int mbr_uuid_to_sid(const uuid_t uu, nt_sid_t *sid)
{
  return MEMORY[0x24BDAEE48](uu, sid);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF38](a1);
}

int mkfifo(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF48](a1, a2);
}

int mkostemp(char *path, int oflags)
{
  return MEMORY[0x24BDAEF58](path, *(_QWORD *)&oflags);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x24BDAF240](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pclose(FILE *a1)
{
  return MEMORY[0x24BDAF5A0](a1);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAF5E0](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x24BDAF798](__attr, *(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x24BDAF7C0](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x24BDAF838](__pthread, __qos_class, __relative_priority);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

void pthread_yield_np(void)
{
  MEMORY[0x24BDAF9D0]();
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  MEMORY[0x24BDAFA28](__base, __nel, __width, a4, __compar);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x24BDAFA90](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB0](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x24BDAFAF8](a1, a2, *(_QWORD *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x24BDAFB00](*(_QWORD *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x24BDAFB08](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x24BDAFB10](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAFD00](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x24BDB0090](a1, a2);
}

int symlinkat(const char *a1, int a2, const char *a3)
{
  return MEMORY[0x24BDB0098](a1, *(_QWORD *)&a2, a3);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x24BDB00F0](*(_QWORD *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x24BDB02B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x24BDB02F8](a1, a2);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0348](uu, out);
}

void *__cdecl valloc(size_t a1)
{
  return (void *)MEMORY[0x24BDB0350](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

