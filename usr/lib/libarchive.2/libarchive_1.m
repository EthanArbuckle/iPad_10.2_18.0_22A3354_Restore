uint64_t sub_1DB737A54(uint64_t a1, size_t *a2, unint64_t *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v11;
  uint64_t v13;
  size_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v11 = **(_QWORD ***)(a1 + 2472);
  v18 = 0;
  if (v11[1] >= *v11)
    goto LABEL_9;
  v13 = v11[2];
  if (v13)
  {
    sub_1DB6E26F0(a1, v13, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
    v11[2] = 0;
  }
  v14 = sub_1DB6E2588(a1, 1uLL, &v18, (uint64_t)a4, a5, a6, a7, a8);
  result = v18;
  if ((v18 & 0x8000000000000000) != 0)
  {
    *a3 = 0;
    return result;
  }
  if (!v18)
  {
LABEL_9:
    *a2 = 0;
    *a3 = 0;
    *a4 = v11[1] + 4;
    v11[2] = 0;
    return 1;
  }
  v16 = v11[1];
  v17 = *v11 - v16;
  if (v18 < v17)
    v17 = v18;
  *a4 = v16;
  *a3 = v17;
  *a2 = v14;
  v11[1] += v17;
  v11[2] = v17;
  return 0;
}

uint64_t sub_1DB737B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8 = **(_QWORD ***)(a1 + 2472);
  sub_1DB6E26F0(a1, *v8 + 4, a3, a4, a5, a6, a7, a8);
  *v8 = 0;
  v8[1] = 0;
  return 0;
}

uint64_t sub_1DB737B68(void *a1, size_t __n, char *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;
  char *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  size_t v23;
  size_t v24;

  result = (uint64_t)memchr(a1, *a3, __n);
  if (result)
  {
    v9 = result;
    v10 = (unint64_t)a1 + __n;
    v11 = (char *)(result + 1);
    if (result + 1 >= (unint64_t)a1 + __n || a4 < 2)
    {
      if (a4 > 1)
        return 0;
    }
    else
    {
      v13 = 0;
      v14 = &a3[a4];
      v15 = *(char *)result;
      LOBYTE(v16) = 1;
      v17 = v15;
      do
      {
        v18 = *(unsigned __int8 *)(result + v13 + 1);
        v17 ^= (char)v18;
        v19 = a3[v13 + 1];
        v15 ^= (char)v19;
        v16 = v16 & (v18 == v19);
        v20 = (unint64_t)&a3[v13 + 2];
        v21 = result + v13++ + 2;
      }
      while (v21 < v10 && v20 < (unint64_t)v14);
      if (v20 < (unint64_t)v14)
        return 0;
      if (!v16)
      {
        if (v21 >= v10)
          return 0;
        v22 = 0;
        v23 = (size_t)a1 + __n + ~result - v13;
        v24 = a4 - 1;
        while (1)
        {
          v17 ^= *(v11 - 1) ^ *(char *)(v9 + v22 + v13 + 1);
          if (v17 == v15 && !memcmp(v11, a3, v24))
            break;
          result = 0;
          ++v11;
          ++v22;
          if (!--v23)
            return result;
        }
        return (uint64_t)v11;
      }
    }
  }
  return result;
}

time_t sub_1DB737CCC(unsigned __int8 *a1, _QWORD *a2)
{
  int v3;
  int v4;
  unsigned __int8 *v5;
  int v6;
  unsigned __int8 *v7;
  int v8;
  int v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  unsigned __int8 *v14;
  unsigned int v15;
  int v16;
  time_t result;
  unsigned __int8 *v19;
  int v20;
  int v21;
  unsigned __int8 *v22;
  unsigned int v23;
  int v24;
  int v26;
  int v27;
  unsigned __int8 *v28;
  unsigned int v29;
  int v30;
  unsigned __int8 *v32;
  int v33;
  int v34;
  tm v35;
  unsigned __int8 *v36;

  memset(&v35, 0, sizeof(v35));
  while (1)
  {
    v3 = *a1;
    if (v3 != 9 && v3 != 32)
      break;
    ++a1;
  }
  if ((v3 - 48) > 9)
  {
    v8 = 0;
    v7 = a1;
  }
  else
  {
    v4 = 0;
    v5 = a1 + 1;
    v6 = 4095;
    do
    {
      v7 = v5;
      v8 = v4 + v3 - 48;
      if (v8 > 409 || (v6 - 10) >= 0xFFFFFFED)
        break;
      v6 /= 10;
      v4 = 10 * v8;
      ++v5;
      v3 = *v7;
    }
    while ((v3 - 48) <= 9);
  }
  if ((v8 - 4096) >= 0xFFFFF62F)
    v10 = v8;
  else
    v10 = -2;
  if (a1 == v7)
    v10 = -1;
  v36 = v7;
  v35.tm_year = v10;
  if (v10 < 0)
    goto LABEL_30;
  v11 = v7 + 1;
  v36 = v7 + 1;
  if (*v7 != 45)
    goto LABEL_30;
  v12 = *v11;
  if ((v12 - 48) > 9)
    goto LABEL_29;
  v13 = 0;
  v14 = v7 + 2;
  v15 = 12;
  do
  {
    v11 = v14;
    v16 = v13 + v12 - 48;
    if (v16 > 1 || v15 - 10 >= 0xFFFFFFED)
      break;
    v15 /= 0xAu;
    v13 = 10 * v16;
    ++v14;
    v12 = *v11;
  }
  while ((v12 - 48) <= 9);
  if ((v16 - 13) <= 0xFFFFFFF3)
    goto LABEL_29;
  v35.tm_mon = v16;
  v19 = v11 + 1;
  v36 = v11 + 1;
  if (*v11 != 45)
    goto LABEL_30;
  v20 = *v19;
  if ((v20 - 48) > 9)
    goto LABEL_42;
  v21 = 0;
  v22 = v11 + 2;
  v23 = 31;
  do
  {
    v19 = v22;
    v24 = v21 + v20 - 48;
    if (v24 > 3 || v23 - 10 >= 0xFFFFFFED)
      break;
    v23 /= 0xAu;
    v21 = 10 * v24;
    ++v22;
    v20 = *v19;
  }
  while ((v20 - 48) <= 9);
  if ((v24 - 32) <= 0xFFFFFFE0)
  {
LABEL_42:
    v36 = v19;
    goto LABEL_30;
  }
  v35.tm_mday = v24;
  v11 = v19 + 1;
  v36 = v19 + 1;
  if (*v19 != 84)
    goto LABEL_30;
  v26 = *v11;
  if ((v26 - 48) > 9)
    goto LABEL_29;
  v27 = 0;
  v28 = v19 + 2;
  v29 = 23;
  do
  {
    v11 = v28;
    v30 = v27 + v26 - 48;
    if (v30 > 2 || v29 - 10 >= 0xFFFFFFED)
      break;
    v29 /= 0xAu;
    v27 = 10 * v30;
    ++v28;
    v26 = *v11;
  }
  while ((v26 - 48) <= 9);
  if (v30 >= 0x18)
  {
LABEL_29:
    v36 = v11;
    goto LABEL_30;
  }
  v35.tm_hour = v30;
  v36 = v11 + 1;
  if (*v11 != 58
    || (v35.tm_min = sub_1DB737FF4(v11 + 1, &v36, 0, 59), v35.tm_min < 0)
    || (v33 = *v36, v32 = v36 + 1, ++v36, v33 != 58)
    || (v35.tm_sec = sub_1DB737FF4(v32, &v36, 0, 60), v35.tm_sec < 0)
    || (v34 = *v36, ++v36, v34 != 90))
  {
LABEL_30:
    result = -1;
    if (!a2)
      return result;
    goto LABEL_31;
  }
  *(int32x2_t *)&v35.tm_mon = vadd_s32(*(int32x2_t *)&v35.tm_mon, (int32x2_t)0xFFFFF894FFFFFFFFLL);
  result = timegm(&v35);
  if (!a2)
    return result;
LABEL_31:
  *a2 = v36;
  return result;
}

uint64_t sub_1DB737FF4(unsigned __int8 *a1, unsigned __int8 **a2, int a3, int a4)
{
  int v4;
  int v5;
  unsigned __int8 *v6;
  int v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t result;

  if (a4 < 1 || (v4 = *a1, (v4 - 48) > 9))
  {
    v9 = 0;
    v8 = a1;
  }
  else
  {
    v5 = 0;
    v6 = a1 + 1;
    v7 = a4;
    do
    {
      v8 = v6;
      v9 = v5 + v4 - 48;
      v5 = 10 * v9;
      if (10 * v9 > a4 || (v7 - 10) >= 0xFFFFFFED)
        break;
      v7 /= 10;
      ++v6;
      v4 = *v8;
    }
    while ((v4 - 48) <= 9);
  }
  if (v9 > a4 || v9 < a3)
    v9 = -2;
  if (v8 == a1)
    result = 0xFFFFFFFFLL;
  else
    result = v9;
  *a2 = v8;
  return result;
}

uint64_t archive_version_details()
{
  char *v0;
  char *v1;

  v0 = (char *)BZ2_bzlibVersion();
  qword_1F02F76C8 = 0;
  unk_1F02F76D0 = 0;
  qword_1F02F76C0 = 0;
  sub_1DB72CE50(&qword_1F02F76C0, "libarchive 3.5.3");
  sub_1DB72CE50(&qword_1F02F76C0, " zlib/");
  sub_1DB72CE50(&qword_1F02F76C0, "1.2.12");
  sub_1DB72CE50(&qword_1F02F76C0, " liblzma/");
  sub_1DB72CE50(&qword_1F02F76C0, "5.4.3");
  if (v0)
  {
    v1 = strchr(v0, 44);
    if (!v1)
      v1 = &v0[strlen(v0)];
    sub_1DB72CE50(&qword_1F02F76C0, " bz2lib/");
    sub_1DB6E323C(&qword_1F02F76C0, v0, v1 - v0);
  }
  return qword_1F02F76C0;
}

const char *archive_zlib_version()
{
  return "1.2.12";
}

const char *archive_liblzma_version()
{
  return "5.4.3";
}

uint64_t archive_liblz4_version()
{
  return 0;
}

uint64_t archive_libzstd_version()
{
  return 0;
}

uint64_t archive_write_set_format_cpio_newc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, "archive_write_set_format_cpio_newc", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10)
      v10(a1);
    v11 = malloc_type_calloc(1uLL, 0x28uLL, 0x1020040FC537BA2uLL);
    if (v11)
    {
      v17 = v11;
      result = 0;
      *(_QWORD *)(a1 + 264) = v17;
      *(_QWORD *)(a1 + 272) = "cpio";
      *(_QWORD *)(a1 + 304) = sub_1DB738334;
      *(_QWORD *)(a1 + 312) = sub_1DB738440;
      *(_QWORD *)(a1 + 288) = sub_1DB738290;
      *(_QWORD *)(a1 + 296) = sub_1DB738488;
      *(_QWORD *)(a1 + 320) = sub_1DB73849C;
      *(_QWORD *)(a1 + 328) = sub_1DB738500;
      *(_DWORD *)(a1 + 16) = 65540;
      *(_QWORD *)(a1 + 24) = "SVR4 cpio nocrc";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate cpio data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_1DB738290(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;

  v5 = *(_QWORD *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset"))
    return 4294967276;
  if (a3 && *a3)
  {
    v12 = sub_1DB72D08C(a1, a3, 0);
    *(_QWORD *)(v5 + 16) = v12;
    if (v12)
      return 0;
    else
      return 4294967266;
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_1DB738334(_DWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v11;
  char *v12;
  _BYTE *v13;

  if (archive_entry_filetype((uint64_t)a2) || archive_entry_hardlink((uint64_t)a2))
  {
    v12 = 0;
    v13 = 0;
    v9 = sub_1DB73852C((uint64_t)a1);
    if (sub_1DB6E9040(a2, &v13, &v12, v9) && *__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v4, v5, v6, v7, v8, v12);
      return 4294967266;
    }
    if (v12 && v13 && *v13)
    {
      if (archive_entry_hardlink((uint64_t)a2)
        || archive_entry_size_is_set((uint64_t)a2)
        && (archive_entry_size((uint64_t)a2) & 0x8000000000000000) == 0)
      {
        return sub_1DB738578((uint64_t)a1, a2);
      }
      v11 = "Size required";
    }
    else
    {
      v11 = "Pathname required";
    }
  }
  else
  {
    v11 = "Filetype required";
  }
  archive_set_error(a1, -1, v11, v4, v5, v6, v7, v8, v12);
  return 4294967271;
}

uint64_t sub_1DB738440(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3)
    v4 = a3;
  else
    v4 = *v3;
  LODWORD(result) = sub_1DB7322A8(a1, a2, v4);
  *v3 -= v4;
  if ((int)result >= 0)
    return v4;
  else
    return (int)result;
}

uint64_t sub_1DB738488(uint64_t a1)
{
  return sub_1DB732308((_QWORD *)a1, **(_QWORD **)(a1 + 264) + *(int *)(*(_QWORD *)(a1 + 264) + 8));
}

uint64_t sub_1DB73849C(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)archive_entry_new();
  archive_entry_set_nlink((uint64_t)v2, 1);
  archive_entry_set_size((uint64_t)v2, 0);
  archive_entry_set_pathname((uint64_t)v2, "TRAILER!!!");
  v3 = sub_1DB738578(a1, v2);
  archive_entry_free((void **)v2);
  return v3;
}

uint64_t sub_1DB738500(uint64_t a1)
{
  free(*(void **)(a1 + 264));
  *(_QWORD *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_1DB73852C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 264);
  result = *(_QWORD *)(v1 + 16);
  if (!result)
  {
    if (*(_DWORD *)(v1 + 32))
    {
      return *(_QWORD *)(v1 + 24);
    }
    else
    {
      result = sub_1DB6E54AC();
      *(_QWORD *)(v1 + 24) = result;
      *(_DWORD *)(v1 + 32) = 1;
    }
  }
  return result;
}

uint64_t sub_1DB738578(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  unsigned int v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  size_t v55;
  int v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *__s;
  _OWORD v61[7];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  __s = 0;
  v58 = 0;
  v4 = *(_QWORD *)(a1 + 264);
  v5 = sub_1DB73852C(a1);
  if (sub_1DB6E9040(a2, &v59, &v58, v5))
  {
    if (*__error() == 12)
    {
      v11 = "Can't allocate memory for Pathname";
LABEL_37:
      archive_set_error((_DWORD *)a1, 12, v11, v6, v7, v8, v9, v10, v57);
LABEL_50:
      v52 = 4294967266;
      goto LABEL_51;
    }
    v13 = (char *)archive_entry_pathname(a2);
    sub_1DB72D0D4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v14, v15, v16, v17, v18, v13);
    v12 = 4294967276;
  }
  else
  {
    v12 = 0;
  }
  v19 = v58;
  memset(v61, 0, 110);
  sub_1DB738A38(0x70701uLL, v61, 6);
  LODWORD(v20) = archive_entry_devmajor((uint64_t)a2);
  if ((v20 & 0x80000000) == 0)
    v20 = (int)v20;
  else
    v20 = 0xFFFFFFFFLL;
  sub_1DB738A38(v20, (_BYTE *)&v61[3] + 14, 8);
  LODWORD(v21) = archive_entry_devminor(a2);
  if ((v21 & 0x80000000) == 0)
    v21 = (int)v21;
  else
    v21 = 0xFFFFFFFFLL;
  sub_1DB738A38(v21, (_BYTE *)&v61[4] + 6, 8);
  v22 = archive_entry_ino64((uint64_t)a2);
  v28 = v22;
  if (v22 >= 0x100000000)
  {
    archive_set_error((_DWORD *)a1, 34, "large inode number truncated", v23, v24, v25, v26, v27, v57);
    v12 = 4294967276;
  }
  sub_1DB738A38(v28, (_BYTE *)v61 + 6, 8);
  v29 = archive_entry_mode((uint64_t)a2);
  sub_1DB738A38(v29, (_BYTE *)((unint64_t)v61 | 0xE), 8);
  v30 = archive_entry_uid((uint64_t)a2);
  if (v30 >= 0xFFFFFFFF)
    v30 = 0xFFFFFFFFLL;
  sub_1DB738A38(v30, (_BYTE *)&v61[1] + 6, 8);
  v31 = archive_entry_gid((uint64_t)a2);
  if (v31 >= 0xFFFFFFFF)
    v31 = 0xFFFFFFFFLL;
  sub_1DB738A38(v31, (_BYTE *)&v61[1] + 14, 8);
  v32 = archive_entry_nlink((uint64_t)a2);
  sub_1DB738A38(v32, (_BYTE *)&v61[2] + 6, 8);
  if (archive_entry_filetype((uint64_t)a2) == 24576
    || archive_entry_filetype((uint64_t)a2) == 0x2000)
  {
    LODWORD(v33) = archive_entry_rdevmajor((uint64_t)a2);
    if ((v33 & 0x80000000) == 0)
      v33 = (int)v33;
    else
      v33 = 0xFFFFFFFFLL;
    sub_1DB738A38(v33, (_BYTE *)&v61[4] + 14, 8);
    LODWORD(v34) = archive_entry_rdevminor(a2);
    if ((v34 & 0x80000000) == 0)
      v34 = (int)v34;
    else
      v34 = 0xFFFFFFFFLL;
  }
  else
  {
    sub_1DB738A38(0, (_BYTE *)&v61[4] + 14, 8);
    v34 = 0;
  }
  sub_1DB738A38(v34, (_BYTE *)&v61[5] + 6, 8);
  v35 = archive_entry_mtime((uint64_t)a2);
  if (v35 >= 0xFFFFFFFF)
    v35 = 0xFFFFFFFFLL;
  sub_1DB738A38(v35, (_BYTE *)&v61[2] + 14, 8);
  v36 = (v19 << 32) + 0x100000000;
  v37 = v36 >> 32;
  if (v36 >= 0)
    v38 = v36 >> 32;
  else
    v38 = 0xFFFFFFFFLL;
  sub_1DB738A38(v38, (_BYTE *)&v61[5] + 14, 8);
  sub_1DB738A38(0, (_BYTE *)&v61[6] + 6, 8);
  if (archive_entry_filetype((uint64_t)a2) != 0x8000)
    archive_entry_set_size((uint64_t)a2, 0);
  if (sub_1DB6E922C((uint64_t)a2, &__s, &v58, v5))
  {
    if (*__error() == 12)
    {
      v11 = "Can't allocate memory for Likname";
      goto LABEL_37;
    }
    v39 = (char *)archive_entry_symlink((uint64_t)a2);
    sub_1DB72D0D4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v40, v41, v42, v43, v44, v39);
    v12 = 4294967276;
  }
  if (v58 && __s && *__s)
    v45 = strlen(__s);
  else
    v45 = archive_entry_size((uint64_t)a2);
  v46 = v45;
  if (v45 >= 0xFFFFFFFF)
    v45 = 0xFFFFFFFFLL;
  sub_1DB738A38(v45, (_BYTE *)&v61[3] + 6, 8);
  if (HIDWORD(v46))
  {
    archive_set_error((_DWORD *)a1, 34, "File is too large for this format.", v47, v48, v49, v50, v51, v57);
    v52 = 4294967271;
  }
  else
  {
    if (sub_1DB7322A8(a1, (uint64_t)v61, 110)
      || sub_1DB7322A8(a1, v59, v37)
      || ((1 - (_BYTE)v19) & 3) != 0 && sub_1DB7322A8(a1, (uint64_t)&unk_1DB7542A0, (1 - (_BYTE)v19) & 3))
    {
      goto LABEL_50;
    }
    v54 = archive_entry_size((uint64_t)a2);
    *(_QWORD *)v4 = v54;
    *(_DWORD *)(v4 + 8) = -(int)v54 & 3;
    if (__s && *__s)
    {
      v55 = strlen(__s);
      v52 = 4294967266;
      if (!sub_1DB7322A8(a1, (uint64_t)__s, v55))
      {
        v56 = strlen(__s);
        if (sub_1DB7322A8(a1, (uint64_t)&unk_1DB7542A0, -v56 & 3))
          v52 = 4294967266;
        else
          v52 = v12;
      }
    }
    else
    {
      v52 = v12;
    }
  }
LABEL_51:
  archive_entry_free(0);
  return v52;
}

unint64_t sub_1DB738A38(unint64_t result, _BYTE *a2, int a3)
{
  unint64_t v4;

  if (a3)
  {
    v4 = sub_1DB738A38(result, a2 + 1, (a3 - 1));
    *a2 = a0123456789abcd[v4 & 0xF];
    return v4 >> 4;
  }
  return result;
}

uint64_t archive_write_set_format_mtree(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1DB738A88(a1, "archive_write_set_format_mtree", a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DB738A88(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void (*v10)(uint64_t);
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, a2, a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10)
      v10(a1);
    v11 = malloc_type_calloc(1uLL, 0x3C8uLL, 0x10B0040658C16C3uLL);
    if (v11)
    {
      v17 = v11;
      result = 0;
      *(_QWORD *)v17 = 0;
      v17[28] = 1;
      *((_QWORD *)v17 + 22) = 0;
      *((_OWORD *)v17 + 9) = 0u;
      *((_OWORD *)v17 + 10) = 0u;
      *((_OWORD *)v17 + 8) = 0u;
      *((_QWORD *)v17 + 119) = 4032058;
      *((_QWORD *)v17 + 6) = 0;
      v17[240] = 0;
      *((_OWORD *)v17 + 4) = 0u;
      *((_OWORD *)v17 + 5) = 0u;
      *((_QWORD *)v17 + 7) = v17 + 12;
      *((_OWORD *)v17 + 6) = 0u;
      *(_QWORD *)(a1 + 320) = sub_1DB73973C;
      *(_QWORD *)(a1 + 328) = sub_1DB738BE4;
      *(_QWORD *)(a1 + 304) = sub_1DB739038;
      *(_QWORD *)(a1 + 312) = sub_1DB739BD0;
      *(_QWORD *)(a1 + 288) = sub_1DB738C58;
      *(_QWORD *)(a1 + 296) = sub_1DB739D34;
      *(_DWORD *)(a1 + 16) = 0x80000;
      *(_QWORD *)(a1 + 264) = v17;
      *(_QWORD *)(a1 + 272) = "mtree";
      *(_QWORD *)(a1 + 24) = "mtree";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate mtree data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t archive_write_set_format_mtree_classic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;

  result = sub_1DB738A88(a1, "archive_write_set_format_mtree_classic", a3, a4, a5, a6, a7, a8);
  if (!(_DWORD)result)
  {
    v10 = *(_QWORD *)(a1 + 264);
    *(_DWORD *)(v10 + 216) = 1;
    *(_DWORD *)(v10 + 964) = 1;
  }
  return result;
}

uint64_t sub_1DB738BE4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD **)(a1 + 264);
  if (v1)
  {
    v3 = v1[6];
    if (v3)
    {
      do
      {
        v4 = *(_QWORD *)(v3 + 24);
        sub_1DB739EFC((void **)v3);
        v3 = v4;
      }
      while (v4);
    }
    sub_1DB6E7C3C((uint64_t)(v1 + 3));
    sub_1DB6E7C3C((uint64_t)(v1 + 8));
    sub_1DB6E7C3C((uint64_t)(v1 + 11));
    sub_1DB739E70(v1);
    free(v1);
    *(_QWORD *)(a1 + 264) = 0;
  }
  return 0;
}

uint64_t sub_1DB738C58(uint64_t a1, char *__s1, uint64_t a3)
{
  uint64_t result;
  _DWORD *v7;
  int v8;
  int v9;

  result = 4294967276;
  v7 = *(_DWORD **)(a1 + 264);
  switch(*__s1)
  {
    case 'a':
      if (strcmp(__s1, "all"))
        return 4294967276;
      v8 = -1;
      goto LABEL_63;
    case 'c':
      if (strcmp(__s1, "cksum"))
        return 4294967276;
      v8 = 1;
      goto LABEL_63;
    case 'd':
      if (!strcmp(__s1, "device"))
      {
        v8 = 2;
        goto LABEL_63;
      }
      result = strcmp(__s1, "dironly");
      if ((_DWORD)result)
        return 4294967276;
      v7[239] = a3 != 0;
      return result;
    case 'f':
      if (strcmp(__s1, "flags"))
        return 4294967276;
      v8 = 8;
      goto LABEL_63;
    case 'g':
      if (!strcmp(__s1, "gid"))
      {
        v8 = 16;
      }
      else
      {
        if (strcmp(__s1, "gname"))
          return 4294967276;
        v8 = 32;
      }
      goto LABEL_63;
    case 'i':
      result = strcmp(__s1, "indent");
      if (!(_DWORD)result)
      {
        v7[240] = a3 != 0;
        return result;
      }
      if (strcmp(__s1, "inode"))
        return 4294967276;
      v8 = 0x4000000;
      goto LABEL_63;
    case 'l':
      if (strcmp(__s1, "link"))
        return 4294967276;
      v8 = 0x10000;
      goto LABEL_63;
    case 'm':
      if (!strcmp(__s1, "md5") || !strcmp(__s1, "md5digest"))
        v8 = 256;
      else
        v8 = 0;
      if (strcmp(__s1, "mode"))
        goto LABEL_53;
      v8 = 512;
      goto LABEL_63;
    case 'n':
      if (strcmp(__s1, "nlink"))
        return 4294967276;
      v8 = 1024;
      goto LABEL_63;
    case 'r':
      if (!strcmp(__s1, "resdevice"))
      {
        v8 = 0x8000000;
        goto LABEL_63;
      }
      if (!strcmp(__s1, "ripemd160digest") || !strcmp(__s1, "rmd160") || !strcmp(__s1, "rmd160digest"))
      {
        v8 = 0x2000;
        goto LABEL_63;
      }
      return 4294967276;
    case 's':
      if (!strcmp(__s1, "sha1") || !strcmp(__s1, "sha1digest"))
        v8 = 0x4000;
      else
        v8 = 0;
      if (!strcmp(__s1, "sha256") || !strcmp(__s1, "sha256digest"))
        v8 = 0x800000;
      if (!strcmp(__s1, "sha384") || !strcmp(__s1, "sha384digest"))
        v8 = 0x1000000;
      if (!strcmp(__s1, "sha512") || !strcmp(__s1, "sha512digest"))
        v8 = 0x2000000;
      if (!strcmp(__s1, "size"))
      {
        v8 = 0x8000;
        goto LABEL_63;
      }
LABEL_53:
      if (v8)
        goto LABEL_63;
      return 4294967276;
    case 't':
      if (!strcmp(__s1, "time"))
      {
        v8 = 0x40000;
      }
      else
      {
        if (strcmp(__s1, "type"))
          return 4294967276;
        v8 = 0x80000;
      }
      goto LABEL_63;
    case 'u':
      if (!strcmp(__s1, "uid"))
      {
        v8 = 0x100000;
LABEL_63:
        result = 0;
        if (a3)
          v9 = v7[238] | v8;
        else
          v9 = v7[238] & ~v8;
        v7[238] = v9;
        return result;
      }
      if (!strcmp(__s1, "uname"))
      {
        v8 = 0x200000;
        goto LABEL_63;
      }
      result = strcmp(__s1, "use-set");
      if ((_DWORD)result)
        return 4294967276;
      v7[241] = a3 != 0;
      return result;
    default:
      return result;
  }
}

uint64_t sub_1DB739038(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void *v13;
  char *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  char *i;
  int v24;
  uint64_t v25;
  void **v26;
  char *v27;
  char *v28;
  int v29;
  uint64_t v30;
  char *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  time_t v39;
  int v40;
  void **v41;
  unsigned int v42;
  void *v43;
  int v44;
  uint64_t **v45;
  uint64_t *v46;
  _DWORD *v47;
  unsigned int v48;
  unsigned int v50;
  char *v51;
  void **v52;
  unsigned int v53;
  void **v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[256];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 264);
  if (*(_DWORD *)(v4 + 112))
  {
    *(_DWORD *)(v4 + 112) = 0;
    sub_1DB72CE50((uint64_t *)(v4 + 88), "#mtree\n");
    if ((*(_DWORD *)(v4 + 952) & 0x380238) == 0)
      *(_DWORD *)(v4 + 964) = 0;
  }
  *(_QWORD *)(v4 + 120) = archive_entry_size((uint64_t)a2);
  if (*(_DWORD *)(v4 + 956) && archive_entry_filetype((uint64_t)a2) != 0x4000)
    return 0;
  v54 = 0;
  v10 = sub_1DB739F64((_DWORD *)a1, a2, &v54);
  if ((int)v10 >= -20)
  {
    v11 = *(_QWORD *)(a1 + 264);
    v12 = v54;
    v13 = v54[8];
    if (v13)
    {
      v14 = (char *)v54[7];
      if (*(void **)(v11 + 32) != v13 || strcmp(*(const char **)(v11 + 24), (const char *)v54[7]))
      {
        v53 = v10;
        v15 = *(void ***)(v11 + 8);
        v21 = sub_1DB7033A8(v59, v14);
        for (i = v14; v21; v21 = sub_1DB7033A8(v59, i))
        {
          while (1)
          {
            if ((v21 & 0x80000000) != 0)
              goto LABEL_65;
            if (v21 == 1 && v59[0] == 46 && v15 != 0)
              break;
            if (!v15)
              goto LABEL_31;
LABEL_23:
            v25 = sub_1DB73322C((uint64_t *)v15[5], (uint64_t)v59);
            if (!v25)
              goto LABEL_31;
            v26 = (void **)v25;
            if (!*i)
            {
              v10 = v53;
              goto LABEL_69;
            }
            if (!*(_QWORD *)(v25 + 40))
            {
              goto LABEL_86;
            }
            v27 = &i[v21];
            v29 = *v27;
            v28 = v27 + 1;
            if (v29 == 47)
              i = v28;
            else
              i += v21;
            v21 = sub_1DB7033A8(v59, i);
            v15 = v26;
            if (!v21)
            {
              v15 = v26;
              goto LABEL_31;
            }
          }
          if (v15 != *(void ***)(v11 + 8))
            goto LABEL_23;
          v24 = *++i;
          if (v24 == 47)
            ++i;
        }
LABEL_31:
        v52 = (void **)(v11 + 24);
        if (*i)
        {
          while (1)
          {
            v30 = v21;
            v55 = 0;
            v56 = 0;
            v57 = 0;
            sub_1DB6E323C((uint64_t *)&v55, v14, (size_t)&i[v21 - (_QWORD)v14]);
            v31 = v55;
            if (v55[v56 - 1] == 47)
            {
              v55[v56 - 1] = 0;
              v31 = v55;
              --v56;
            }
            v32 = (uint64_t *)archive_entry_new();
            if (!v32)
              goto LABEL_57;
            v38 = v32;
            v58 = 0;
            archive_entry_copy_pathname((uint64_t)v32, v31);
            archive_entry_set_mode((uint64_t)v38, 16877);
            v39 = time(0);
            archive_entry_set_mtime((uint64_t)v38, v39, 0);
            v40 = sub_1DB739F64((_DWORD *)a1, v38, &v58);
            archive_entry_free((void **)v38);
            if (v40 <= -21)
            {
LABEL_57:
              archive_set_error((_DWORD *)a1, 12, "Can't allocate memory", v33, v34, v35, v36, v37, v51);
              sub_1DB6E7C3C((uint64_t)&v55);
              goto LABEL_66;
            }
            v41 = (void **)v58;
            *(_DWORD *)(*(_QWORD *)(v58 + 40) + 40) = 1;
            sub_1DB6E7C3C((uint64_t)&v55);
            if (!strcmp((const char *)v41[13], "."))
            {
              *(_QWORD *)(v11 + 8) = v41;
              v15 = v41;
            }
            else
            {
              sub_1DB733364((unint64_t)v15[5], v41);
            }
            v41[4] = v15;
            v41[3] = 0;
            **(_QWORD **)(v11 + 56) = v41;
            *(_QWORD *)(v11 + 56) = v41 + 3;
            i += i[v30] == 47 ? v30 + 1 : v30;
            v42 = sub_1DB7033A8(v59, i);
            if ((v42 & 0x80000000) != 0)
              break;
            v21 = v42;
            v15 = v41;
            if (!*i)
              goto LABEL_52;
          }
          sub_1DB6E7C3C((uint64_t)&v55);
LABEL_65:
          archive_set_error((_DWORD *)a1, -1, "A name buffer is too small", v16, v17, v18, v19, v20, v51);
LABEL_66:
          v10 = 4294967266;
          goto LABEL_87;
        }
        v41 = v15;
LABEL_52:
        *(_QWORD *)(v11 + 16) = v41;
        *(_QWORD *)(v11 + 32) = 0;
        sub_1DB6E3190(v52, (size_t)v41[11] + (_QWORD)v41[8] + 2);
        v43 = v41[8];
        if ((char *)v41[11] + (_QWORD)v43)
        {
          v10 = v53;
          if (v43)
          {
            *(_QWORD *)(v11 + 32) = 0;
            sub_1DB6E4384((uint64_t *)v52, (uint64_t)(v41 + 7));
            sub_1DB72CE60((uint64_t *)v52, 47);
          }
          sub_1DB6E4384((uint64_t *)v52, (uint64_t)(v41 + 10));
        }
        else
        {
          *(_BYTE *)*v52 = 0;
          v10 = v53;
        }
        if (sub_1DB733364((unint64_t)v41[5], v12))
        {
          v12[4] = v41;
          v12[3] = 0;
          **(_QWORD **)(v11 + 56) = v12;
          *(_QWORD *)(v11 + 56) = v12 + 3;
          v26 = v54;
          goto LABEL_73;
        }
        v46 = (uint64_t *)v41[5];
        goto LABEL_68;
      }
      v44 = sub_1DB733364(*(_QWORD *)(*(_QWORD *)(v11 + 16) + 40), v12);
      v45 = *(uint64_t ***)(v11 + 16);
      if (!v44)
      {
        v46 = v45[5];
LABEL_68:
        v26 = (void **)sub_1DB73322C(v46, (uint64_t)v12[10]);
        goto LABEL_69;
      }
      v12[4] = v45;
    }
    else
    {
      if (v54[11] != (void *)1 || *(_BYTE *)v54[10] != 46)
      {
        archive_set_error((_DWORD *)a1, -1, "Internal programming error in generating canonical name for %s", v5, v6, v7, v8, v9, (char *)v54[13]);
        goto LABEL_86;
      }
      v54[4] = v54;
      v26 = *(void ***)(v11 + 8);
      if (v26)
      {
LABEL_69:
        if ((*((unsigned __int16 *)v12 + 115) ^ *((unsigned __int16 *)v26 + 115)) < 0x1000)
        {
          v26[17] = 0;
          sub_1DB6E4384((uint64_t *)v26 + 16, (uint64_t)(v12 + 16));
          v26[20] = 0;
          sub_1DB6E4384((uint64_t *)v26 + 19, (uint64_t)(v12 + 19));
          v26[23] = 0;
          sub_1DB6E4384((uint64_t *)v26 + 22, (uint64_t)(v12 + 22));
          v26[26] = 0;
          sub_1DB6E4384((uint64_t *)v26 + 25, (uint64_t)(v12 + 25));
          *((_DWORD *)v26 + 56) = *((_DWORD *)v12 + 56);
          *((_DWORD *)v26 + 57) = *((_DWORD *)v12 + 57);
          *(_OWORD *)(v26 + 29) = *(_OWORD *)(v12 + 29);
          *((_OWORD *)v26 + 17) = *((_OWORD *)v12 + 17);
          *(_OWORD *)(v26 + 31) = *(_OWORD *)(v12 + 31);
          v26[33] = v12[33];
          *((_OWORD *)v26 + 18) = *((_OWORD *)v12 + 18);
          v26[38] = v12[38];
          v47 = v26[5];
          if (v47)
            v47[10] = 0;
          sub_1DB739EFC(v12);
LABEL_73:
          *(_QWORD *)v4 = v26;
          if (!v26[6])
            return v10;
          *(_DWORD *)(v4 + 224) = 0;
          v48 = *(_DWORD *)(v4 + 952);
          if ((v48 & 1) != 0)
          {
            *(_QWORD *)(v4 + 224) = 1;
            *(_QWORD *)(v4 + 232) = 0;
          }
          if ((v48 & 0x100) == 0)
          {
            if ((v48 & 0x4000) == 0)
              goto LABEL_78;
LABEL_90:
            if (sub_1DB73395C((CC_SHA1_CTX *)(v4 + 332)))
            {
              v48 = *(_DWORD *)(v4 + 952) & 0xFFFFBFFF;
              *(_DWORD *)(v4 + 952) = v48;
              if ((v48 & 0x800000) != 0)
                goto LABEL_94;
            }
            else
            {
              *(_DWORD *)(v4 + 224) |= 0x4000u;
              v48 = *(_DWORD *)(v4 + 952);
              if ((v48 & 0x800000) != 0)
                goto LABEL_94;
            }
LABEL_79:
            if ((v48 & 0x1000000) == 0)
              goto LABEL_80;
LABEL_98:
            if (sub_1DB733A04((CC_SHA512_CTX *)(v4 + 536)))
            {
              v50 = *(_DWORD *)(v4 + 952) & 0xFEFFFFFF;
              *(_DWORD *)(v4 + 952) = v50;
              if ((v50 & 0x2000000) == 0)
                return v10;
            }
            else
            {
              *(_DWORD *)(v4 + 224) |= 0x1000000u;
              if ((*(_DWORD *)(v4 + 952) & 0x2000000) == 0)
                return v10;
            }
LABEL_102:
            if (sub_1DB733A58((CC_SHA512_CTX *)(v4 + 744)))
              *(_DWORD *)(v4 + 952) &= ~0x2000000u;
            else
              *(_DWORD *)(v4 + 224) |= 0x2000000u;
            return v10;
          }
          if (sub_1DB7338F0((CC_MD5_CTX *)(v4 + 240)))
          {
            v48 = *(_DWORD *)(v4 + 952) & 0xFFFFFEFF;
            *(_DWORD *)(v4 + 952) = v48;
            if ((v48 & 0x4000) != 0)
              goto LABEL_90;
          }
          else
          {
            *(_DWORD *)(v4 + 224) |= 0x100u;
            v48 = *(_DWORD *)(v4 + 952);
            if ((v48 & 0x4000) != 0)
              goto LABEL_90;
          }
LABEL_78:
          if ((v48 & 0x800000) == 0)
            goto LABEL_79;
LABEL_94:
          if (sub_1DB7339B0((CC_SHA256_CTX *)(v4 + 428)))
          {
            v48 = *(_DWORD *)(v4 + 952) & 0xFF7FFFFF;
            *(_DWORD *)(v4 + 952) = v48;
            if ((v48 & 0x1000000) != 0)
              goto LABEL_98;
          }
          else
          {
            *(_DWORD *)(v4 + 224) |= 0x800000u;
            v48 = *(_DWORD *)(v4 + 952);
            if ((v48 & 0x1000000) != 0)
              goto LABEL_98;
          }
LABEL_80:
          if ((v48 & 0x2000000) == 0)
            return v10;
          goto LABEL_102;
        }
LABEL_86:
        v10 = 4294967271;
LABEL_87:
        sub_1DB739EFC(v54);
        return v10;
      }
      *(_QWORD *)(v11 + 8) = v12;
    }
    v12[3] = 0;
    **(_QWORD **)(v11 + 56) = v12;
    *(_QWORD *)(v11 + 56) = v12 + 3;
    v26 = v12;
    goto LABEL_73;
  }
  return v10;
}

uint64_t sub_1DB73973C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t **v11;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  int v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  int v45;
  uint64_t i;
  uint64_t *v47;
  char *v49;

  v9 = *(_QWORD *)(a1 + 264);
  v10 = *(_QWORD *)(v9 + 8);
  if (!v10)
  {
LABEL_75:
    archive_write_set_bytes_in_last_block((int *)a1, 1, a3, a4, a5, a6, a7, a8);
    return sub_1DB7322A8(a1, *(_QWORD *)(v9 + 88), *(_QWORD *)(v9 + 96));
  }
  v11 = (uint64_t **)(v9 + 184);
  v12 = (uint64_t **)(v9 + 192);
  v13 = (uint64_t **)(v9 + 200);
  v14 = (uint64_t *)(v9 + 208);
  while (1)
  {
    if (*(_DWORD *)(v9 + 964))
    {
      sub_1DB739E70((_QWORD *)v9);
      v15 = sub_1DB733688(*(unint64_t **)(v10 + 40), 0, 0);
      if (v15)
        break;
    }
LABEL_48:
    if (*(_DWORD *)(*(_QWORD *)(v10 + 40) + 40) && !*(_DWORD *)(v9 + 216))
    {
      if (*(_DWORD *)(v9 + 964))
        sub_1DB73AB50(v9, a2, a3, a4, a5, a6, a7, a8);
    }
    else if (sub_1DB73A59C(a1, v10, a3, a4, a5, a6, a7, a8))
    {
      return 4294967266;
    }
    ++*(_DWORD *)(v9 + 220);
    v41 = sub_1DB733688(*(unint64_t **)(v10 + 40), 0, 0);
    if (v41)
    {
      v42 = v41;
      do
      {
        v43 = *(_QWORD *)(v42 + 40);
        if (v43)
        {
          *(_QWORD *)(v43 + 32) = 0;
          **(_QWORD **)(*(_QWORD *)(v10 + 40) + 24) = v42;
          v44 = *(unint64_t **)(v10 + 40);
          v44[3] = *(_QWORD *)(v42 + 40) + 32;
        }
        else
        {
          if (sub_1DB73A59C(a1, v42, a3, a4, a5, a6, a7, a8))
            return 4294967266;
          v44 = *(unint64_t **)(v10 + 40);
        }
        v42 = sub_1DB733688(v44, v42, 1u);
      }
      while (v42);
    }
    v45 = *(_DWORD *)(v9 + 220);
    *(_DWORD *)(v9 + 220) = v45 - 1;
    i = *(_QWORD *)(*(_QWORD *)(v10 + 40) + 16);
    if (i)
    {
      if (*(_DWORD *)(v9 + 960))
        *(_DWORD *)(v9 + 220) = v45;
    }
    else
    {
      if (*(_DWORD *)(v9 + 216) && sub_1DB73AF24(a1, v10, a3, a4, a5, a6, a7, a8))
        return 4294967266;
      v47 = (uint64_t *)(v10 + 32);
      a2 = *(_QWORD *)(v10 + 32);
      for (i = v10; i != a2; a2 = *(_QWORD *)(a2 + 32))
      {
        i = *(_QWORD *)(*(_QWORD *)(i + 40) + 32);
        if (i)
          break;
        if (*(_DWORD *)(v9 + 960))
          --*(_DWORD *)(v9 + 220);
        if (*(_DWORD *)(v9 + 216))
        {
          if (sub_1DB73AF24(a1, a2, a3, a4, a5, a6, a7, a8))
            return 4294967266;
          a2 = *v47;
        }
        i = a2;
        v47 = (uint64_t *)(a2 + 32);
      }
    }
    v10 = i;
    if (i == *(_QWORD *)(i + 32))
      goto LABEL_75;
  }
  v16 = v15;
  while (1)
  {
    v17 = *(_DWORD *)(v9 + 952);
    if ((v17 & 0x300000) != 0)
    {
      v18 = *v11;
      if (*v11)
      {
        v19 = *(_QWORD *)(v16 + 240);
        if (*(_QWORD *)(v18[2] + 240) == v19)
        {
          v20 = 0;
        }
        else
        {
          do
          {
            v20 = (uint64_t)v18;
            v18 = (uint64_t *)v18[1];
          }
          while (v18 && *(_QWORD *)(v18[2] + 240) != v19);
        }
        if ((sub_1DB73B038((uint64_t *)(v9 + 184), v18, v20, v16) & 0x80000000) != 0)
          goto LABEL_80;
      }
      else
      {
        v26 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
        if (!v26)
          goto LABEL_79;
        *v26 = 0;
        v26[1] = 0;
        *((_DWORD *)v26 + 6) = 1;
        v26[2] = v16;
        *v11 = v26;
      }
    }
    if ((v17 & 0x30) == 0)
      goto LABEL_23;
    v27 = *v12;
    if (*v12)
    {
      v28 = *(_QWORD *)(v16 + 248);
      if (*(_QWORD *)(v27[2] + 248) == v28)
      {
        v29 = 0;
      }
      else
      {
        do
        {
          v29 = (uint64_t)v27;
          v27 = (uint64_t *)v27[1];
        }
        while (v27 && *(_QWORD *)(v27[2] + 248) != v28);
      }
      if ((sub_1DB73B038((uint64_t *)(v9 + 192), v27, v29, v16) & 0x80000000) != 0)
        goto LABEL_80;
LABEL_23:
      if ((v17 & 0x200) == 0)
        goto LABEL_33;
      goto LABEL_24;
    }
    v33 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
    if (!v33)
    {
      v11 = (uint64_t **)(v9 + 192);
      goto LABEL_79;
    }
    *v33 = 0;
    v33[1] = 0;
    *((_DWORD *)v33 + 6) = 1;
    v33[2] = v16;
    *v12 = v33;
    if ((v17 & 0x200) == 0)
      goto LABEL_33;
LABEL_24:
    v30 = *v13;
    if (*v13)
      break;
    v39 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
    if (!v39)
    {
      v11 = (uint64_t **)(v9 + 200);
      goto LABEL_79;
    }
    *v39 = 0;
    v39[1] = 0;
    *((_DWORD *)v39 + 6) = 1;
    v39[2] = v16;
    *v13 = v39;
    if ((v17 & 8) != 0)
      goto LABEL_34;
LABEL_47:
    v16 = sub_1DB733688(*(unint64_t **)(v10 + 40), v16, 1u);
    if (!v16)
      goto LABEL_48;
  }
  v31 = *(unsigned __int16 *)(v16 + 230);
  if (*(unsigned __int16 *)(v30[2] + 230) == v31)
  {
    v32 = 0;
  }
  else
  {
    do
    {
      v32 = (uint64_t)v30;
      v30 = (uint64_t *)v30[1];
    }
    while (v30 && *(unsigned __int16 *)(v30[2] + 230) != v31);
  }
  if ((sub_1DB73B038((uint64_t *)(v9 + 200), v30, v32, v16) & 0x80000000) != 0)
    goto LABEL_80;
LABEL_33:
  if ((v17 & 8) == 0)
    goto LABEL_47;
LABEL_34:
  v34 = *v14;
  if (*v14)
  {
    v35 = 0;
    while (1)
    {
      v36 = v34;
      v37 = *(_QWORD *)(v34 + 16);
      if (*(_QWORD *)(v37 + 272) == *(_QWORD *)(v16 + 272) && *(_QWORD *)(v37 + 280) == *(_QWORD *)(v16 + 280))
        break;
      v34 = *(_QWORD *)(v36 + 8);
      v35 = v36;
      if (!v34)
      {
        v38 = 0;
        goto LABEL_46;
      }
    }
    v38 = (uint64_t *)v36;
    v36 = v35;
LABEL_46:
    if ((sub_1DB73B038((uint64_t *)(v9 + 208), v38, v36, v16) & 0x80000000) != 0)
      goto LABEL_80;
    goto LABEL_47;
  }
  v40 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
  if (v40)
  {
    *v40 = 0;
    v40[1] = 0;
    *((_DWORD *)v40 + 6) = 1;
    v40[2] = v16;
    *v14 = (uint64_t)v40;
    goto LABEL_47;
  }
  v11 = (uint64_t **)(v9 + 208);
LABEL_79:
  *v11 = 0;
LABEL_80:
  archive_set_error((_DWORD *)a1, 12, "Can't allocate memory", v21, v22, v23, v24, v25, v49);
  return 4294967266;
}

unint64_t sub_1DB739BD0(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int v7;
  unsigned int v9;
  unint64_t v10;
  unsigned __int8 *v11;
  int v12;

  v3 = *(_QWORD *)(a1 + 264);
  v4 = *(_QWORD *)(v3 + 120);
  if (v4 >= a3)
    v5 = a3;
  else
    v5 = *(_QWORD *)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v4 - v5;
  if (!*(_QWORD *)v3 || *(__int16 *)(*(_QWORD *)v3 + 228) != -32768)
    return v5;
  v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 1) != 0)
  {
    if (v5)
    {
      v9 = *(_DWORD *)(v3 + 228);
      v10 = v5;
      v11 = a2;
      do
      {
        v12 = *v11++;
        v9 = dword_1DB7543D4[v12 ^ HIBYTE(v9)] ^ (v9 << 8);
        *(_DWORD *)(v3 + 228) = v9;
        --v10;
      }
      while (v10);
    }
    *(_QWORD *)(v3 + 232) += v5;
    if ((v7 & 0x100) == 0)
    {
LABEL_8:
      if ((v7 & 0x4000) == 0)
        goto LABEL_9;
      goto LABEL_19;
    }
  }
  else if ((v7 & 0x100) == 0)
  {
    goto LABEL_8;
  }
  sub_1DB733908((CC_MD5_CTX *)(v3 + 240), a2, v5);
  v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 0x4000) == 0)
  {
LABEL_9:
    if ((v7 & 0x800000) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  sub_1DB733974((CC_SHA1_CTX *)(v3 + 332), a2, v5);
  v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 0x800000) == 0)
  {
LABEL_10:
    if ((v7 & 0x1000000) == 0)
      goto LABEL_11;
LABEL_21:
    sub_1DB733A1C((CC_SHA512_CTX *)(v3 + 536), a2, v5);
    if ((*(_DWORD *)(v3 + 224) & 0x2000000) == 0)
      return v5;
    goto LABEL_12;
  }
LABEL_20:
  sub_1DB7339C8((CC_SHA256_CTX *)(v3 + 428), a2, v5);
  v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 0x1000000) != 0)
    goto LABEL_21;
LABEL_11:
  if ((v7 & 0x2000000) != 0)
LABEL_12:
    sub_1DB733A70((CC_SHA512_CTX *)(v3 + 744), a2, v5);
  return v5;
}

uint64_t sub_1DB739D34(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v6;
  unsigned int v7;
  BOOL v8;

  v1 = *(uint64_t **)(a1 + 264);
  v2 = *v1;
  if (*v1)
  {
    *v1 = 0;
    v3 = *(_QWORD *)(v2 + 48);
    if (v3)
    {
      v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 1) != 0)
      {
        v6 = v1[29];
        v7 = *((_DWORD *)v1 + 57);
        if (v6)
        {
          do
          {
            v7 = dword_1DB7543D4[v6 ^ (unint64_t)HIBYTE(v7)] ^ (v7 << 8);
            v8 = v6 > 0xFF;
            v6 >>= 8;
          }
          while (v8);
          *((_DWORD *)v1 + 57) = v7;
        }
        *(_DWORD *)(v3 + 4) = ~v7;
        if ((v4 & 0x100) == 0)
        {
LABEL_5:
          if ((v4 & 0x4000) == 0)
            goto LABEL_6;
          goto LABEL_17;
        }
      }
      else if ((v4 & 0x100) == 0)
      {
        goto LABEL_5;
      }
      sub_1DB733920((CC_MD5_CTX *)(v1 + 30), (unsigned __int8 *)(v3 + 8));
      v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x4000) == 0)
      {
LABEL_6:
        if ((v4 & 0x800000) == 0)
          goto LABEL_7;
        goto LABEL_18;
      }
LABEL_17:
      sub_1DB73398C((CC_SHA1_CTX *)((char *)v1 + 332), (unsigned __int8 *)(v3 + 44));
      v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x800000) == 0)
      {
LABEL_7:
        if ((v4 & 0x1000000) == 0)
          goto LABEL_8;
        goto LABEL_19;
      }
LABEL_18:
      sub_1DB7339E0((CC_SHA256_CTX *)((char *)v1 + 428), (unsigned __int8 *)(v3 + 64));
      v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x1000000) == 0)
      {
LABEL_8:
        if ((v4 & 0x2000000) == 0)
        {
LABEL_10:
          *(_DWORD *)v3 = v4;
          return 0;
        }
LABEL_9:
        sub_1DB733A88((CC_SHA512_CTX *)(v1 + 93), (unsigned __int8 *)(v3 + 144));
        v4 = *((_DWORD *)v1 + 56);
        goto LABEL_10;
      }
LABEL_19:
      sub_1DB733A34((CC_SHA512_CTX *)(v1 + 67), (unsigned __int8 *)(v3 + 96));
      v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x2000000) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  return 0;
}

_QWORD *sub_1DB739E70(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *result;
  _QWORD *v9;

  v2 = (_QWORD *)a1[23];
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)v2[1];
      free(v2);
      v2 = v3;
    }
    while (v3);
    a1[23] = 0;
  }
  v4 = (_QWORD *)a1[24];
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)v4[1];
      free(v4);
      v4 = v5;
    }
    while (v5);
    a1[24] = 0;
  }
  v6 = (_QWORD *)a1[25];
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)v6[1];
      free(v6);
      v6 = v7;
    }
    while (v7);
    a1[25] = 0;
  }
  result = (_QWORD *)a1[26];
  if (result)
  {
    do
    {
      v9 = (_QWORD *)result[1];
      free(result);
      result = v9;
    }
    while (v9);
    a1[26] = 0;
  }
  return result;
}

void sub_1DB739EFC(void **a1)
{
  sub_1DB6E7C3C((uint64_t)(a1 + 7));
  sub_1DB6E7C3C((uint64_t)(a1 + 10));
  sub_1DB6E7C3C((uint64_t)(a1 + 13));
  sub_1DB6E7C3C((uint64_t)(a1 + 16));
  sub_1DB6E7C3C((uint64_t)(a1 + 19));
  sub_1DB6E7C3C((uint64_t)(a1 + 22));
  sub_1DB6E7C3C((uint64_t)(a1 + 25));
  free(a1[5]);
  free(a1[6]);
  free(a1);
}

uint64_t sub_1DB739F64(_DWORD *a1, uint64_t *a2, _QWORD *a3)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const char **v13;
  _BYTE *v14;
  const char *v15;
  size_t v16;
  char *v17;
  size_t v18;
  uint64_t *v19;
  char *v20;
  size_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  BOOL v31;
  char *v32;
  const char *v33;
  int v34;
  size_t v35;
  char *v36;
  const void *v37;
  int v38;
  char *v39;
  size_t v40;
  char *v41;
  char *v42;
  const char *v43;
  char *v44;
  size_t v45;
  const char *v46;
  char *v47;
  size_t v48;
  const char *v49;
  char *v50;
  size_t v51;
  char *v52;
  char *v53;
  size_t v54;
  int v55;
  _QWORD *v56;
  uint64_t result;
  uint64_t v58;
  _DWORD *v59;
  _DWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67[3];

  v6 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x1030040643B09EFuLL);
  v12 = v6;
  if (!v6)
  {
    archive_set_error(a1, 12, "Can't allocate memory for a mtree entry", v7, v8, v9, v10, v11, v66);
LABEL_82:
    result = 4294967266;
    goto LABEL_83;
  }
  v13 = (const char **)(v6 + 104);
  *((_QWORD *)v6 + 14) = 0;
  v14 = (_BYTE *)archive_entry_pathname(a2);
  if (archive_entry_pathname(a2))
  {
    v15 = (const char *)archive_entry_pathname(a2);
    v16 = strlen(v15);
  }
  else
  {
    v16 = 0;
  }
  sub_1DB6E323C((uint64_t *)v12 + 13, v14, v16);
  v17 = (char *)*v13;
  if (!strcmp(*v13, "."))
  {
    v19 = (uint64_t *)(v12 + 80);
    *((_QWORD *)v12 + 11) = 0;
    v20 = ".";
    v21 = 1;
    goto LABEL_64;
  }
  *((_QWORD *)v12 + 8) = 0;
  if (v17)
    v18 = strlen(v17);
  else
    v18 = 0;
  sub_1DB6E323C((uint64_t *)v12 + 7, v17, v18);
  v22 = (char *)*((_QWORD *)v12 + 7);
  v23 = *((_QWORD *)v12 + 8);
  v24 = v22;
  while (1)
  {
    v25 = *v24;
    if (v25 != 47)
      break;
    v26 = -1;
    v27 = 1;
LABEL_18:
    v24 += v27;
    v23 += v26;
  }
  if (v25 == 46 && v24[1] == 46 && v24[2] == 47)
  {
    v26 = -3;
    v27 = 3;
    goto LABEL_18;
  }
  if (v24 != v22)
    memmove(*((void **)v12 + 7), v24, v23 + 1);
  do
  {
    if (!v23)
      break;
    v28 = v23;
    if (v22[v23 - 1] == 47)
    {
      v22[v23 - 1] = 0;
      v28 = v23 - 1;
    }
    v29 = v28 - 2;
    if (v28 >= 2)
    {
      if (v22[v29] == 47 && v22[v28 - 1] == 46)
      {
        v22[v29] = 0;
        v28 -= 2;
      }
      v30 = v28 - 3;
      if (v28 >= 3 && v22[v30] == 47 && v22[v28 - 2] == 46 && v22[v28 - 1] == 46)
      {
        v22[v30] = 0;
        v28 -= 3;
      }
    }
    v31 = v23 == v28;
    v23 = v28;
  }
  while (!v31);
LABEL_35:
  v32 = v22;
  while (2)
  {
    while (1)
    {
      v33 = v32;
      if (*v32 != 47)
        break;
      ++v32;
      v34 = *((unsigned __int8 *)v33 + 1);
      if (v34 != 46)
      {
        if (v34 != 47)
          continue;
        v35 = strlen(v33 + 1) + 1;
        v36 = (char *)v33;
        v37 = v33 + 1;
LABEL_45:
        memmove(v36, v37, v35);
        v32 = (char *)v33;
        continue;
      }
      v38 = *((unsigned __int8 *)v33 + 2);
      if (v38 != 46)
      {
        if (v38 != 47)
          continue;
        v35 = strlen(v33 + 2) + 1;
        v36 = (char *)v33;
        v37 = v33 + 2;
        goto LABEL_45;
      }
      if (v33[3] == 47)
      {
        v39 = (char *)(v33 - 1);
        do
        {
          v32 = v39;
          if (v39 < v22)
            break;
          --v39;
        }
        while (*v32 != 47);
        if (v32 <= v22)
        {
          strcpy(v22, v33 + 4);
          goto LABEL_35;
        }
        strcpy(v32, v33 + 3);
      }
    }
    if (*v32)
    {
      ++v32;
      continue;
    }
    break;
  }
  v40 = strlen(v22);
  if (strcmp(v22, ".") && strncmp(v22, "./", 2uLL))
  {
    memset(v67, 0, sizeof(v67));
    sub_1DB6E323C(v67, "./", 2uLL);
    sub_1DB6E323C(v67, v22, v40);
    *((_QWORD *)v12 + 8) = 0;
    sub_1DB6E4384((uint64_t *)v12 + 7, (uint64_t)v67);
    sub_1DB6E7C3C((uint64_t)v67);
    v22 = (char *)*((_QWORD *)v12 + 7);
    v40 = *((_QWORD *)v12 + 8);
  }
  v41 = 0;
  while (2)
  {
    if (*v22 == 47)
    {
      v41 = v22;
      goto LABEL_61;
    }
    if (*v22)
    {
LABEL_61:
      ++v22;
      continue;
    }
    break;
  }
  if (v41)
  {
    *v41 = 0;
    v42 = v41 + 1;
    *((_QWORD *)v12 + 8) = &v41[-*((_QWORD *)v12 + 7)];
    *((_QWORD *)v12 + 11) = 0;
    v21 = strlen(v41 + 1);
    v19 = (uint64_t *)(v12 + 80);
    v20 = v42;
LABEL_64:
    sub_1DB6E323C(v19, v20, v21);
  }
  else
  {
    *((_QWORD *)v12 + 8) = v40;
    *((_QWORD *)v12 + 11) = 0;
    sub_1DB6E4384((uint64_t *)v12 + 10, (uint64_t)(v12 + 56));
    *((_QWORD *)v12 + 8) = 0;
    **((_BYTE **)v12 + 7) = 0;
  }
  v43 = (const char *)archive_entry_symlink((uint64_t)a2);
  if (v43)
  {
    v44 = (char *)v43;
    *((_QWORD *)v12 + 17) = 0;
    v45 = strlen(v43);
    sub_1DB6E323C((uint64_t *)v12 + 16, v44, v45);
  }
  *((_DWORD *)v12 + 56) = archive_entry_nlink((uint64_t)a2);
  *((_WORD *)v12 + 114) = archive_entry_filetype((uint64_t)a2);
  *((_WORD *)v12 + 115) = archive_entry_mode((uint64_t)a2) & 0xFFF;
  *((_QWORD *)v12 + 30) = archive_entry_uid((uint64_t)a2);
  *((_QWORD *)v12 + 31) = archive_entry_gid((uint64_t)a2);
  v46 = (const char *)archive_entry_uname(a2);
  if (v46)
  {
    v47 = (char *)v46;
    *((_QWORD *)v12 + 20) = 0;
    v48 = strlen(v46);
    sub_1DB6E323C((uint64_t *)v12 + 19, v47, v48);
  }
  v49 = (const char *)archive_entry_gname(a2);
  if (v49)
  {
    v50 = (char *)v49;
    *((_QWORD *)v12 + 23) = 0;
    v51 = strlen(v49);
    sub_1DB6E323C((uint64_t *)v12 + 22, v50, v51);
  }
  v52 = archive_entry_fflags_text(a2);
  if (v52)
  {
    v53 = v52;
    *((_QWORD *)v12 + 26) = 0;
    v54 = strlen(v52);
    sub_1DB6E323C((uint64_t *)v12 + 25, v53, v54);
  }
  archive_entry_fflags((uint64_t)a2, (_QWORD *)v12 + 34, (_QWORD *)v12 + 35);
  *((_QWORD *)v12 + 32) = archive_entry_mtime((uint64_t)a2);
  *((_QWORD *)v12 + 33) = archive_entry_mtime_nsec((uint64_t)a2);
  *((_DWORD *)v12 + 72) = archive_entry_rdevmajor((uint64_t)a2);
  *((_DWORD *)v12 + 73) = archive_entry_rdevminor(a2);
  *((_DWORD *)v12 + 74) = archive_entry_devmajor((uint64_t)a2);
  *((_DWORD *)v12 + 75) = archive_entry_devminor(a2);
  *((_QWORD *)v12 + 38) = archive_entry_ino((uint64_t)a2);
  *((_QWORD *)v12 + 29) = archive_entry_size((uint64_t)a2);
  v55 = *((unsigned __int16 *)v12 + 114);
  if (v55 == 0x8000)
  {
    v59 = malloc_type_calloc(1uLL, 0xD0uLL, 0x10000400F93440CuLL);
    *((_QWORD *)v12 + 6) = v59;
    if (v59)
    {
      v60 = v59;
      result = 0;
      *v60 = 0;
      goto LABEL_83;
    }
    goto LABEL_81;
  }
  if (v55 != 0x4000)
  {
    result = 0;
    goto LABEL_83;
  }
  v56 = malloc_type_calloc(1uLL, 0x30uLL, 0x10E004059D07AFEuLL);
  *((_QWORD *)v12 + 5) = v56;
  if (!v56)
  {
LABEL_81:
    sub_1DB739EFC((void **)v12);
    archive_set_error(a1, 12, "Can't allocate memory for a mtree entry", v61, v62, v63, v64, v65, v66);
    v12 = 0;
    goto LABEL_82;
  }
  sub_1DB6E8388(v56, (uint64_t)&off_1EA321BA0);
  result = 0;
  v58 = *((_QWORD *)v12 + 5);
  *(_QWORD *)(v58 + 16) = 0;
  v58 += 16;
  *(_QWORD *)(v58 + 8) = v58;
  *(_QWORD *)(v58 + 16) = 0;
LABEL_83:
  *a3 = v12;
  return result;
}

uint64_t sub_1DB73A57C(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a2 + 80), *(const char **)(a1 + 80));
}

uint64_t sub_1DB73A58C(uint64_t a1, char *__s1)
{
  return strcmp(__s1, *(const char **)(a1 + 80));
}

uint64_t sub_1DB73A59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  void **v11;
  int v12;
  uint64_t *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  int v29;
  unint64_t v30;
  uint64_t result;
  int v32;

  v10 = *(_QWORD *)(a1 + 264);
  if (*(_QWORD *)(a2 + 40))
  {
    if (*(_DWORD *)(v10 + 216))
    {
      if (!*(_DWORD *)(v10 + 956))
        sub_1DB72CE60((uint64_t *)(v10 + 88), 10);
      v11 = (void **)(v10 + 88);
      if (*(_QWORD *)(a2 + 56))
        sub_1DB7303C0(v11, "# %s/%s\n", a3, a4, a5, a6, a7, a8, *(char **)(a2 + 56));
      else
        sub_1DB7303C0(v11, "# %s\n", a3, a4, a5, a6, a7, a8, *(char **)(a2 + 80));
    }
    if (*(_DWORD *)(v10 + 964))
      sub_1DB73AB50(v10, a2, a3, a4, a5, a6, a7, a8);
  }
  *(_QWORD *)(v10 + 72) = 0;
  v12 = *(_DWORD *)(v10 + 216);
  if (*(_DWORD *)(v10 + 960) | v12)
    v13 = (uint64_t *)(v10 + 64);
  else
    v13 = (uint64_t *)(v10 + 88);
  if (!v12)
  {
    v14 = *(unsigned __int8 **)(a2 + 56);
    if (v14)
    {
      sub_1DB73B140(v13, v14);
      sub_1DB72CE60(v13, 47);
    }
  }
  sub_1DB73B140(v13, *(unsigned __int8 **)(a2 + 80));
  v21 = *(_DWORD *)(v10 + 952);
  v22 = *(_DWORD *)(v10 + 136);
  if (v22)
  {
    if ((v22 & 0x30) != 0 && *(_QWORD *)(v10 + 152) == *(_QWORD *)(a2 + 248))
      v21 &= 0xFFFFFFCF;
    if ((v22 & 0x300000) != 0 && *(_QWORD *)(v10 + 144) == *(_QWORD *)(a2 + 240))
      v21 &= 0xFFCFFFFF;
    if ((v22 & 8) != 0
      && *(_QWORD *)(v10 + 168) == *(_QWORD *)(a2 + 272)
      && *(_QWORD *)(v10 + 176) == *(_QWORD *)(a2 + 280))
    {
      v21 &= ~8u;
    }
    if ((v22 & 0x200) != 0 && *(unsigned __int16 *)(v10 + 160) == *(unsigned __int16 *)(a2 + 230))
      v21 &= ~0x200u;
    HIDWORD(v24) = *(unsigned __int16 *)(a2 + 228);
    LODWORD(v24) = HIDWORD(v24) - 4096;
    v23 = v24 >> 12;
    if (v23 > 0xB)
      goto LABEL_107;
    if (((1 << v23) & 0xA23) != 0)
      goto LABEL_32;
    if (v23 == 3)
    {
      if ((v22 & 0x80000) == 0)
        goto LABEL_32;
      v32 = 0x4000;
    }
    else
    {
LABEL_107:
      if ((v22 & 0x80000) == 0)
        goto LABEL_32;
      v32 = 0x8000;
    }
    if (*(unsigned __int16 *)(v10 + 132) == v32)
      v21 &= ~0x80000u;
  }
LABEL_32:
  if ((v21 & 0x400) != 0 && *(_DWORD *)(a2 + 224) != 1 && *(_WORD *)(a2 + 228) != 0x4000)
    sub_1DB7303C0((void **)v13, " nlink=%u", v15, v16, v17, v18, v19, v20, (char *)*(unsigned int *)(a2 + 224));
  if ((v21 & 0x20) != 0 && *(_QWORD *)(a2 + 184))
  {
    sub_1DB72CE50(v13, " gname=");
    sub_1DB73B140(v13, *(unsigned __int8 **)(a2 + 176));
  }
  if ((v21 & 0x200000) != 0 && *(_QWORD *)(a2 + 160))
  {
    sub_1DB72CE50(v13, " uname=");
    sub_1DB73B140(v13, *(unsigned __int8 **)(a2 + 152));
  }
  if ((v21 & 8) != 0)
  {
    if (*(_QWORD *)(a2 + 208))
    {
      sub_1DB72CE50(v13, " flags=");
      sub_1DB73B140(v13, *(unsigned __int8 **)(a2 + 200));
    }
    else if (*(_DWORD *)(v10 + 128) && (*(_BYTE *)(v10 + 136) & 8) != 0)
    {
      sub_1DB72CE50(v13, " flags=none");
    }
  }
  if ((v21 & 0x40000) != 0)
  {
    sub_1DB7303C0((void **)v13, " time=%jd.%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 256));
    if ((v21 & 0x200) == 0)
    {
LABEL_47:
      if ((v21 & 0x10) == 0)
        goto LABEL_48;
      goto LABEL_57;
    }
  }
  else if ((v21 & 0x200) == 0)
  {
    goto LABEL_47;
  }
  sub_1DB7303C0((void **)v13, " mode=%o", v15, v16, v17, v18, v19, v20, (char *)*(unsigned __int16 *)(a2 + 230));
  if ((v21 & 0x10) == 0)
  {
LABEL_48:
    if ((v21 & 0x100000) == 0)
      goto LABEL_49;
    goto LABEL_58;
  }
LABEL_57:
  sub_1DB7303C0((void **)v13, " gid=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 248));
  if ((v21 & 0x100000) == 0)
  {
LABEL_49:
    if ((v21 & 0x4000000) == 0)
      goto LABEL_50;
    goto LABEL_59;
  }
LABEL_58:
  sub_1DB7303C0((void **)v13, " uid=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 240));
  if ((v21 & 0x4000000) == 0)
  {
LABEL_50:
    if ((v21 & 0x8000000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_59:
  sub_1DB7303C0((void **)v13, " inode=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 304));
  if ((v21 & 0x8000000) != 0)
LABEL_51:
    sub_1DB7303C0((void **)v13, " resdevice=native,%ju,%ju", v15, v16, v17, v18, v19, v20, (char *)*(int *)(a2 + 296));
LABEL_52:
  HIDWORD(v25) = *(unsigned __int16 *)(a2 + 228);
  LODWORD(v25) = HIDWORD(v25) - 4096;
  switch((v25 >> 12))
  {
    case 0u:
      if ((v21 & 0x80000) != 0)
      {
        v26 = " type=fifo";
        break;
      }
      goto LABEL_84;
    case 1u:
      if ((v21 & 0x80000) == 0)
        goto LABEL_75;
      v27 = " type=char";
      goto LABEL_74;
    case 3u:
      if ((v21 & 0x80000) == 0)
        goto LABEL_84;
      v26 = " type=dir";
      break;
    case 5u:
      if ((v21 & 0x80000) != 0)
      {
        v27 = " type=block";
LABEL_74:
        sub_1DB72CE50(v13, v27);
      }
LABEL_75:
      if ((v21 & 2) != 0)
        sub_1DB7303C0((void **)v13, " device=native,%ju,%ju", v15, v16, v17, v18, v19, v20, (char *)*(int *)(a2 + 288));
      goto LABEL_84;
    case 9u:
      if ((v21 & 0x80000) != 0)
        sub_1DB72CE50(v13, " type=link");
      if ((v21 & 0x10000) != 0)
      {
        sub_1DB72CE50(v13, " link=");
        sub_1DB73B140(v13, *(unsigned __int8 **)(a2 + 128));
      }
      goto LABEL_84;
    case 0xBu:
      if ((v21 & 0x80000) == 0)
        goto LABEL_84;
      v26 = " type=socket";
      break;
    default:
      if ((v21 & 0x80000) != 0)
        sub_1DB72CE50(v13, " type=file");
      if ((v21 & 0x8000) != 0)
        sub_1DB7303C0((void **)v13, " size=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 232));
      goto LABEL_84;
  }
  sub_1DB72CE50(v13, v26);
LABEL_84:
  v28 = *(char **)(a2 + 48);
  if (!v28)
    goto LABEL_92;
  v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 1) != 0)
  {
    sub_1DB7303C0((void **)v13, " cksum=%ju", v15, v16, v17, v18, v19, v20, (char *)*((unsigned int *)v28 + 1));
    v29 = *(_DWORD *)v28;
    if ((*(_DWORD *)v28 & 0x100) == 0)
    {
LABEL_87:
      if ((v29 & 0x4000) == 0)
        goto LABEL_88;
      goto LABEL_100;
    }
  }
  else if ((v29 & 0x100) == 0)
  {
    goto LABEL_87;
  }
  sub_1DB72CE50(v13, " md5digest=");
  sub_1DB73B4EC(v13, v28 + 8, 16);
  v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x4000) == 0)
  {
LABEL_88:
    if ((v29 & 0x800000) == 0)
      goto LABEL_89;
    goto LABEL_101;
  }
LABEL_100:
  sub_1DB72CE50(v13, " sha1digest=");
  sub_1DB73B4EC(v13, v28 + 44, 20);
  v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x800000) == 0)
  {
LABEL_89:
    if ((v29 & 0x1000000) == 0)
      goto LABEL_90;
LABEL_102:
    sub_1DB72CE50(v13, " sha384digest=");
    sub_1DB73B4EC(v13, v28 + 96, 48);
    if ((*(_DWORD *)v28 & 0x2000000) == 0)
      goto LABEL_92;
    goto LABEL_91;
  }
LABEL_101:
  sub_1DB72CE50(v13, " sha256digest=");
  sub_1DB73B4EC(v13, v28 + 64, 32);
  v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x1000000) != 0)
    goto LABEL_102;
LABEL_90:
  if ((v29 & 0x2000000) != 0)
  {
LABEL_91:
    sub_1DB72CE50(v13, " sha512digest=");
    sub_1DB73B4EC(v13, v28 + 144, 64);
  }
LABEL_92:
  sub_1DB72CE60(v13, 10);
  if (*(_DWORD *)(v10 + 960) || *(_DWORD *)(v10 + 216))
    sub_1DB73B214(v10);
  v30 = *(_QWORD *)(v10 + 96);
  if (v30 <= 0x8000)
    return 0;
  result = sub_1DB7322A8(a1, *(_QWORD *)(v10 + 88), v30);
  *(_QWORD *)(v10 + 96) = 0;
  return result;
}

void sub_1DB73AB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;

  v37 = 0;
  v38 = 0;
  v35 = 0;
  v36 = 0;
  v33 = 0;
  v34 = 0;
  v9 = *(_DWORD *)(a1 + 952);
  v10 = v9 & 0x380238;
  v11 = *(_DWORD *)(a1 + 136);
  if (*(_DWORD *)(a1 + 128))
  {
    v12 = *(_QWORD *)(a1 + 184);
    if (!v12
      || (v13 = v9 & 0x300238, (v11 & 0x300000) != 0)
      && (*(int *)(v12 + 24) < 2 || *(_QWORD *)(a1 + 144) == *(_QWORD *)(*(_QWORD *)(v12 + 16) + 240)))
    {
      v13 = *(_DWORD *)(a1 + 952) & 0x238;
    }
    v14 = *(_QWORD *)(a1 + 192);
    if (!v14
      || (v11 & 0x30) != 0
      && (*(int *)(v14 + 24) < 2 || *(_QWORD *)(a1 + 152) == *(_QWORD *)(*(_QWORD *)(v14 + 16) + 248)))
    {
      v13 &= 0x300208u;
    }
    v15 = *(_QWORD *)(a1 + 200);
    if (!v15
      || (v11 & 0x200) != 0
      && (*(int *)(v15 + 24) < 2
       || *(unsigned __int16 *)(a1 + 160) == *(unsigned __int16 *)(*(_QWORD *)(v15 + 16) + 230)))
    {
      v13 &= ~0x200u;
    }
    v16 = *(_QWORD *)(a1 + 208);
    if (!v16
      || (v11 & 8) != 0
      && (*(int *)(v16 + 24) < 2
       || (v17 = *(_QWORD *)(v16 + 16), *(_QWORD *)(v17 + 272) == *(_QWORD *)(a1 + 168))
       && *(_QWORD *)(v17 + 280) == *(_QWORD *)(a1 + 176)))
    {
      v18 = v10;
      v10 = v13 & 0xFFFFFFF7;
    }
    else
    {
      v18 = v10;
      v10 = v13;
    }
  }
  else
  {
    v19 = v9 & 0x80238;
    if (*(_QWORD *)(a1 + 184))
      v19 = v9 & 0x380238;
    if (!*(_QWORD *)(a1 + 192))
      v19 &= 0x380208u;
    if (!*(_QWORD *)(a1 + 200))
      v19 &= 0x380038u;
    if (*(_QWORD *)(a1 + 208))
      v18 = v19;
    else
      v18 = v19 & 0x380230;
  }
  if ((v10 & v18 & 0x80000) != 0)
  {
    v20 = *(_DWORD *)(a1 + 956);
    if (v20)
      v21 = " type=dir";
    else
      v21 = " type=file";
    if (v20)
      v22 = 0x4000;
    else
      v22 = 0x8000;
    sub_1DB72CE50((uint64_t *)&v36, v21);
    *(_WORD *)(a1 + 132) = v22;
  }
  if ((v10 & v18 & 0x200000) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 16) + 160))
    {
      sub_1DB72CE50((uint64_t *)&v36, " uname=");
      sub_1DB73B140((uint64_t *)&v36, *(unsigned __int8 **)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 16) + 152));
    }
    else
    {
      v18 &= ~0x200000u;
      if ((v11 & 0x200000) != 0)
        sub_1DB72CE50((uint64_t *)&v33, " uname");
    }
  }
  if ((v18 & v10 & 0x100000) != 0)
  {
    v23 = *(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 16) + 240);
    *(_QWORD *)(a1 + 144) = v23;
    sub_1DB7303C0((void **)&v36, " uid=%jd", a3, a4, a5, a6, a7, a8, v23);
  }
  if ((v18 & v10 & 0x20) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 16) + 184))
    {
      sub_1DB72CE50((uint64_t *)&v36, " gname=");
      sub_1DB73B140((uint64_t *)&v36, *(unsigned __int8 **)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 16) + 176));
    }
    else
    {
      v18 &= ~0x20u;
      if ((v11 & 0x20) != 0)
        sub_1DB72CE50((uint64_t *)&v33, " gname");
    }
  }
  v24 = v18 & v10;
  if ((v24 & 0x10) != 0)
  {
    v25 = *(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 16) + 248);
    *(_QWORD *)(a1 + 152) = v25;
    sub_1DB7303C0((void **)&v36, " gid=%jd", a3, a4, a5, a6, a7, a8, v25);
    if ((v24 & 0x200) == 0)
    {
LABEL_55:
      if ((v24 & 8) == 0)
        goto LABEL_63;
      goto LABEL_59;
    }
  }
  else if ((v24 & 0x200) == 0)
  {
    goto LABEL_55;
  }
  v26 = (char *)*(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 16) + 230);
  *(_WORD *)(a1 + 160) = (_WORD)v26;
  sub_1DB7303C0((void **)&v36, " mode=%o", a3, a4, a5, a6, a7, a8, v26);
  if ((v24 & 8) == 0)
    goto LABEL_63;
LABEL_59:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 16) + 208))
  {
    sub_1DB72CE50((uint64_t *)&v36, " flags=");
    sub_1DB73B140((uint64_t *)&v36, *(unsigned __int8 **)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 16) + 200));
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 16) + 272);
  }
  else
  {
    v18 &= ~8u;
    if ((v11 & 8) != 0)
      sub_1DB72CE50((uint64_t *)&v33, " flags");
  }
LABEL_63:
  if (v34)
    sub_1DB7303C0((void **)(a1 + 88), "/unset%s\n", a3, a4, a5, a6, a7, a8, v33);
  sub_1DB6E7C3C((uint64_t)&v33);
  if (v37)
    sub_1DB7303C0((void **)(a1 + 88), "/set%s\n", v27, v28, v29, v30, v31, v32, v36);
  sub_1DB6E7C3C((uint64_t)&v36);
  *(_DWORD *)(a1 + 136) = v18;
  *(_DWORD *)(a1 + 128) = 1;
}

uint64_t sub_1DB73AF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char *v10;
  int v12;
  int v13;
  size_t v14;
  size_t v15;
  unint64_t v16;
  uint64_t result;

  v9 = *(_QWORD *)(a1 + 264);
  v10 = *(char **)(a2 + 56);
  if (v10)
  {
    if (*(_DWORD *)(v9 + 960))
    {
      v12 = *(_DWORD *)(v9 + 220);
      if (v12 >= 1)
      {
        if (4 * v12 <= 1)
          v13 = 1;
        else
          v13 = 4 * v12;
        do
        {
          sub_1DB72CE60((uint64_t *)(v9 + 88), 32);
          --v13;
        }
        while (v13);
        v10 = *(char **)(a2 + 56);
      }
    }
    sub_1DB7303C0((void **)(v9 + 88), "# %s/%s\n", a3, a4, a5, a6, a7, a8, v10);
  }
  if (*(_DWORD *)(v9 + 960))
  {
    *(_QWORD *)(v9 + 72) = 0;
    if (*(_DWORD *)(v9 + 956))
      v14 = 3;
    else
      v14 = 4;
    sub_1DB6E323C((uint64_t *)(v9 + 64), "..\n\n", v14);
    sub_1DB73B214(v9);
  }
  else
  {
    if (*(_DWORD *)(v9 + 956))
      v15 = 3;
    else
      v15 = 4;
    sub_1DB6E323C((uint64_t *)(v9 + 88), "..\n\n", v15);
  }
  v16 = *(_QWORD *)(v9 + 96);
  if (v16 <= 0x8000)
    return 0;
  result = sub_1DB7322A8(a1, *(_QWORD *)(v9 + 88), v16);
  *(_QWORD *)(v9 + 96) = 0;
  return result;
}

uint64_t sub_1DB73B038(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t **v10;
  uint64_t v11;
  _QWORD *v14;

  if (a2)
  {
    v4 = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v4 + 1;
    if ((uint64_t *)*a1 != a2)
    {
      v5 = (uint64_t *)*a2;
      if (*(_DWORD *)(*a2 + 24) <= v4)
      {
        v6 = (uint64_t *)*a2;
        do
        {
          v7 = *((_DWORD *)v6 + 6);
          if (v7 > v4)
            break;
          v6 = (uint64_t *)*v6;
        }
        while (v6);
        v5[1] = a2[1];
        v8 = (_QWORD *)a2[1];
        if (v8)
          *v8 = v5;
        if (v7 <= v4)
        {
          v11 = 0;
          *a2 = 0;
          a2[1] = *a1;
          *a1 = (uint64_t)a2;
          v10 = (uint64_t **)a2[1];
          goto LABEL_17;
        }
        v9 = v6[1];
        *a2 = (uint64_t)v6;
        a2[1] = v9;
        v6[1] = (uint64_t)a2;
        v10 = (uint64_t **)a2[1];
        if (v10)
        {
          v11 = 0;
LABEL_17:
          *v10 = a2;
          return v11;
        }
      }
    }
    return 0;
  }
  if (!a3)
    return 0;
  v14 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
  if (!v14)
    return 0xFFFFFFFFLL;
  v11 = 0;
  *v14 = a3;
  v14[1] = 0;
  *((_DWORD *)v14 + 6) = 1;
  v14[2] = a4;
  *(_QWORD *)(a3 + 8) = v14;
  return v11;
}

uint64_t *sub_1DB73B140(uint64_t *result, unsigned __int8 *a2)
{
  unsigned int v2;
  uint64_t *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned int v6;
  _BYTE v7[4];

  v2 = *a2;
  if (*a2)
  {
    v3 = result;
    v4 = a2 + 1;
    v5 = a2;
    do
    {
      if (!byte_1DB7542D1[v2])
      {
        if (v4 - 1 != a2)
        {
          sub_1DB6E323C(v3, a2, v5 - a2);
          v2 = *(v4 - 1);
        }
        v7[0] = 92;
        v7[1] = (v2 >> 6) | 0x30;
        v7[2] = (v2 >> 3) & 7 | 0x30;
        v7[3] = v2 & 7 | 0x30;
        result = sub_1DB6E323C(v3, v7, 4uLL);
        a2 = v4;
      }
      v6 = *v4++;
      v2 = v6;
      ++v5;
    }
    while (v6);
    if (v4 - 1 != a2)
      return sub_1DB6E323C(v3, a2, v5 - a2);
  }
  return result;
}

uint64_t *sub_1DB73B214(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  char *v8;
  char *v9;
  int v10;
  char *v11;
  int v12;
  char *v13;
  char *v14;
  char v15;
  uint64_t *v16;
  char *v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t *result;

  if (*(_DWORD *)(a1 + 216))
  {
    v2 = *(_DWORD *)(a1 + 960);
    v3 = *(_DWORD *)(a1 + 220);
    v4 = 4 * (v3 != 0);
    v5 = 4 * v3;
    if (v2)
      v6 = 0;
    else
      v6 = v4;
    if (v2)
      v7 = v5;
    else
      v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = *(char **)(a1 + 64);
  v9 = v8 - 1;
  do
    v10 = *++v9;
  while (v10 == 32);
  v11 = strchr(v9, 32);
  v12 = v7 + v6;
  if (v11)
  {
    v13 = v11;
    v14 = 0;
    v15 = 0;
    v16 = (uint64_t *)(a1 + 88);
    while ((v15 & 1) != 0)
    {
      if ((uint64_t)&v13[v7 - (_QWORD)v8] > 62)
      {
        if (!v14)
          v14 = v13;
        sub_1DB6E323C(v16, v8, v14 - v8);
        sub_1DB6E323C(v16, " \\\n", 3uLL);
        if (v7 >= -15)
        {
          v20 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
          do
          {
            sub_1DB72CE60(v16, 32);
            --v20;
          }
          while (v20);
        }
        v13 = 0;
        v17 = v14 + 1;
LABEL_34:
        v8 = v17;
        goto LABEL_35;
      }
      v17 = v13 + 1;
LABEL_35:
      v14 = v13;
      v13 = strchr(v17, 32);
      v15 = 1;
      if (!v13)
      {
        if (v14 && strlen(v8) + v7 >= 0x3F)
        {
          sub_1DB6E323C((uint64_t *)(a1 + 88), v8, v14 - v8);
          sub_1DB6E323C((uint64_t *)(a1 + 88), " \\\n", 3uLL);
          if (v7 >= -15)
          {
            v22 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
            do
            {
              sub_1DB72CE60((uint64_t *)(a1 + 88), 32);
              --v22;
            }
            while (v22);
          }
          v8 = v14 + 1;
        }
        goto LABEL_46;
      }
    }
    if (v12 >= 1)
    {
      v18 = v7 + v6;
      do
      {
        sub_1DB72CE60(v16, 32);
        --v18;
      }
      while (v18);
    }
    sub_1DB6E323C(v16, v8, v13 - v8);
    if (v13 - v8 + v6 < 16)
    {
      if ((int)((_DWORD)v13 - (_DWORD)v8 + v6) <= 15)
      {
        v21 = v6 - 1 + (_DWORD)v13 - (_DWORD)v8;
        do
        {
          sub_1DB72CE60(v16, 32);
          ++v21;
        }
        while (v21 < 15);
      }
    }
    else
    {
      sub_1DB6E323C(v16, " \\\n", 3uLL);
      if (v7 >= -15)
      {
        v19 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
        do
        {
          sub_1DB72CE60(v16, 32);
          --v19;
        }
        while (v19);
      }
    }
    v17 = v13 + 1;
    v13 = 0;
    goto LABEL_34;
  }
  if (v12 >= 1)
  {
    do
    {
      sub_1DB72CE60((uint64_t *)(a1 + 88), 32);
      --v12;
    }
    while (v12);
  }
  sub_1DB72CE50((uint64_t *)(a1 + 88), v8);
  v8 += strlen(v8);
LABEL_46:
  result = sub_1DB72CE50((uint64_t *)(a1 + 88), v8);
  *(_QWORD *)(a1 + 72) = 0;
  return result;
}

uint64_t *sub_1DB73B4EC(uint64_t *result, char *a2, int a3)
{
  uint64_t *v4;
  uint64_t v5;
  char v6;

  if (a3 >= 1)
  {
    v4 = result;
    v5 = a3;
    do
    {
      sub_1DB72CE60(v4, a0123456789abcd_1[(unint64_t)*a2 >> 4]);
      v6 = *a2++;
      result = sub_1DB72CE60(v4, a0123456789abcd_1[v6 & 0xF]);
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t archive_read_support_filter_all(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = sub_1DB6E0594(a1, 14594245, 1, "archive_read_support_filter_all", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    archive_read_support_filter_bzip2(a1);
    archive_read_support_filter_compress(a1);
    archive_read_support_filter_gzip(a1);
    archive_read_support_filter_lzip(a1);
    archive_read_support_filter_lzma(a1);
    archive_read_support_filter_xz(a1);
    archive_read_support_filter_uu(a1);
    archive_read_support_filter_rpm(a1);
    archive_read_support_filter_lrzip(a1);
    archive_read_support_filter_lzop(a1);
    archive_read_support_filter_grzip(a1);
    archive_read_support_filter_lz4(a1);
    archive_read_support_filter_zstd(a1);
    archive_clear_error((uint64_t)a1);
    return 0;
  }
  return result;
}

uint64_t sub_1DB73B60C(unsigned __int8 *a1, unsigned __int8 *a2, unsigned int a3)
{
  int v3;
  BOOL v4;
  _BOOL8 v5;
  unsigned __int8 *v6;
  uint64_t v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  uint64_t result;
  unsigned __int8 *v13;

  if (a1 && (v3 = *a1) != 0)
  {
    if (!a2)
      return 0;
    v4 = v3 == 94;
    v5 = v3 == 94;
    if (v4)
      v6 = a1 + 1;
    else
      v6 = a1;
    if (v4)
      v7 = a3 & 0xFFFFFFFE;
    else
      v7 = a3;
    v8 = *v6;
    if (v8 == 42)
      goto LABEL_13;
    if (v8 == 47)
    {
      if (*a2 == 47)
      {
LABEL_13:
        v9 = &a1[v5 - 1];
        do
          v10 = *++v9;
        while (v10 == 47);
        --a2;
        do
          v11 = *++a2;
        while (v11 == 47);
        return sub_1DB73B714(v9, a2, v7);
      }
      return 0;
    }
    if ((v7 & 1) == 0)
    {
      v9 = v6;
      return sub_1DB73B714(v9, a2, v7);
    }
    while (1)
    {
      v13 = *a2 == 47 ? a2 + 1 : a2;
      if (sub_1DB73B714(v6, v13, v7))
        break;
      a2 = (unsigned __int8 *)strchr((char *)v13, 47);
      result = 0;
      if (!a2)
        return result;
    }
  }
  else if (a2)
  {
    return *a2 == 0;
  }
  return 1;
}

BOOL sub_1DB73B714(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 *i;
  unsigned __int8 *v5;
  int v6;
  int v8;
  int v10;
  int v11;
  char *j;
  int v13;
  int v14;
  int v16;
  int v17;
  char *v18;
  int v19;
  int v21;
  BOOL v22;
  int v23;
  char v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned __int8 v29;
  int v30;
  char v31;
  int v32;
  _BOOL8 result;
  unsigned __int8 *k;
  int v36;
  int v37;
  int v39;
  _BYTE *v40;
  int v41;

  i = a2;
  v5 = a1;
  if (*a2 == 46)
  {
    v6 = a2[1];
    if (v6 == 47)
    {
      for (i = a2 + 1; ; ++i)
      {
        if (v6 == 46)
        {
          v6 = i[1];
          if (v6 != 47 && v6 != 0)
            break;
        }
        else
        {
          if (v6 != 47)
            break;
          LOBYTE(v6) = i[1];
        }
      }
    }
  }
  if (*a1 != 46)
    goto LABEL_25;
  v8 = a1[1];
  if (v8 != 47)
    goto LABEL_25;
  v5 = a1 + 1;
  while (v8 != 46)
  {
    if (v8 != 47)
      goto LABEL_25;
    LOBYTE(v8) = v5[1];
LABEL_24:
    ++v5;
  }
  v8 = v5[1];
  if (v8 == 47 || v8 == 0)
    goto LABEL_24;
LABEL_25:
  v10 = (char)*v5;
  v11 = *v5;
  if (v10 > 62)
  {
    if (v10 == 63)
    {
      v17 = *i;
      j = (char *)v5;
      goto LABEL_109;
    }
    if (v10 == 91)
    {
      v18 = (char *)(v5 + 1);
      for (j = (char *)(v5 + 1); ; ++j)
      {
        v19 = *j;
        if (v19 == 92)
        {
          if (j[1])
            ++j;
        }
        else
        {
          if (!*j)
            goto LABEL_88;
          if (v19 == 93)
          {
            v21 = *v18;
            if (v21 == 94 || v21 == 33)
            {
              v22 = v18 >= j;
              if (v18 >= j)
                v18 = (char *)(v5 + 1);
              else
                v18 = (char *)(v5 + 2);
              v23 = v22;
              v17 = !v22;
            }
            else
            {
              v17 = 0;
              v23 = 1;
            }
            if (v18 >= j)
            {
LABEL_109:
              if (v17)
                goto LABEL_110;
              return 0;
            }
            v24 = 0;
            v25 = (char)*i;
            while (2)
            {
              v26 = *v18;
              if (v26 == 92)
              {
                v30 = *++v18;
                v27 = v30;
              }
              else
              {
                v27 = *v18;
                if (v26 == 45)
                {
                  if (!v24 || v18 == j - 1)
                  {
                    if (v27 == v25)
                      goto LABEL_108;
                    LOBYTE(v27) = 0;
                  }
                  else
                  {
                    v28 = v18[1];
                    if (v28 == 92)
                    {
                      v29 = v18[2];
                      v18 += 2;
                      LOBYTE(v28) = v29;
                    }
                    else
                    {
                      ++v18;
                    }
                    LOBYTE(v27) = 0;
                    if (v25 >= v24 && v25 <= (char)v28)
                    {
LABEL_108:
                      v17 = v23;
                      goto LABEL_109;
                    }
                  }
                  goto LABEL_101;
                }
              }
              if (v27 == v25)
                goto LABEL_108;
LABEL_101:
              ++v18;
              v24 = v27;
              if (v18 >= j)
                goto LABEL_109;
              continue;
            }
          }
        }
      }
    }
    if (v10 == 92)
    {
      j = (char *)(v5 + 1);
      v13 = *i;
      if (v5[1])
      {
        if (v5[1] == v13)
          goto LABEL_110;
      }
      else
      {
        j = (char *)v5;
        if (v13 == 92)
          goto LABEL_110;
      }
      return 0;
    }
    goto LABEL_88;
  }
  if (v10 > 41)
  {
    if (v10 != 47)
    {
      if (v10 != 42)
        goto LABEL_88;
      while (v11 == 42)
      {
        v31 = *++v5;
        LOBYTE(v11) = v31;
      }
      if (!(_BYTE)v11)
        return 1;
      if (*i)
      {
        do
        {
          v32 = sub_1DB73B60C(v5, i, a3);
          result = v32 != 0;
          if (v32)
            break;
        }
        while (*++i);
        return result;
      }
      return 0;
    }
    v14 = *i;
    if (v14 != 47 && v14 != 0)
      return 0;
    for (j = (char *)(v5 - 1); ; ++j)
    {
      if (v11 == 46)
      {
        v16 = j[2];
        if (j[2] && v16 != 47)
        {
LABEL_59:
          --i;
          while (1)
          {
            if (v14 == 46)
            {
              v14 = i[2];
              if (v14 != 47 && v14 != 0)
              {
LABEL_69:
                if ((a3 & 2) != 0 && !(_BYTE)v11)
                  return 1;
LABEL_110:
                v5 = (unsigned __int8 *)(j + 1);
                ++i;
                goto LABEL_25;
              }
            }
            else
            {
              if (v14 != 47)
                goto LABEL_69;
              LOBYTE(v14) = i[2];
            }
            ++i;
          }
        }
      }
      else
      {
        if (v11 != 47)
          goto LABEL_59;
        LOBYTE(v16) = j[2];
      }
      LOBYTE(v11) = v16;
    }
  }
  if (v10 == 36)
  {
    if ((a3 & 2) != 0 && !v5[1])
    {
      for (k = i + 1; ; ++k)
      {
        v36 = *(k - 1);
        if (v36 != 47)
        {
          if (v36 != 46)
            break;
          v37 = *k;
          if (v37 != 47 && v37 != 0)
            break;
        }
      }
      return v36 == 0;
    }
    goto LABEL_88;
  }
  if (*v5)
  {
LABEL_88:
    j = (char *)v5;
    if (v11 == *i)
      goto LABEL_110;
    return 0;
  }
  v39 = *i;
  if (v39 != 47)
    return v39 == 0;
  if ((a3 & 2) != 0)
    return 1;
  v40 = i + 1;
  LOBYTE(v41) = 47;
  while (2)
  {
    if (v41 != 46)
    {
      if (v41 != 47)
        break;
      LOBYTE(v41) = *v40;
      goto LABEL_138;
    }
    v41 = *v40;
    if (v41 == 47 || v41 == 0)
    {
LABEL_138:
      ++v40;
      continue;
    }
    break;
  }
  v39 = *(v40 - 1);
  return v39 == 0;
}

uint64_t archive_read_set_format(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  const char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char __s2[16];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  result = archive_read_support_format_by_code((int *)a1, a2, a3, a4, a5, a6, a7, a8);
  if ((result & 0x80000000) == 0)
  {
    if (*(_QWORD *)(a1 + 2472))
      v16 = -20;
    else
      v16 = 0;
    switch(((a2 & 0xFF0000u) - 0x10000) >> 16)
    {
      case 0u:
        __s2[4] = 0;
        v17 = 1869181027;
        goto LABEL_22;
      case 2u:
        v17 = 7496052;
        goto LABEL_22;
      case 3u:
        strcpy(__s2, "iso9660");
        goto LABEL_23;
      case 4u:
        v17 = 7367034;
        goto LABEL_22;
      case 5u:
        strcpy(&__s2[4], "y");
        v17 = 1953525093;
        goto LABEL_22;
      case 6u:
        strcpy(__s2, "ar");
        goto LABEL_23;
      case 7u:
        strcpy(&__s2[4], "e");
        v17 = 1701999725;
        goto LABEL_22;
      case 8u:
        v17 = 7823730;
        goto LABEL_22;
      case 9u:
        v17 = 7496056;
        goto LABEL_22;
      case 0xAu:
        v17 = 6383724;
        goto LABEL_22;
      case 0xBu:
        v17 = 6447459;
        goto LABEL_22;
      case 0xCu:
        v17 = 7496050;
        goto LABEL_22;
      case 0xDu:
        __s2[4] = 0;
        v17 = 1885960759;
        goto LABEL_22;
      case 0xEu:
        __s2[4] = 0;
        v17 = 1668440439;
        goto LABEL_22;
      case 0xFu:
        __s2[4] = 0;
        v17 = 896688498;
LABEL_22:
        *(_DWORD *)__s2 = v17;
LABEL_23:
        v18 = 0;
        *(_QWORD *)(a1 + 2472) = a1 + 1064;
        break;
      default:
        archive_set_error((_DWORD *)a1, 22, "Invalid format code specified", v11, v12, v13, v14, v15, v26);
        return 4294967266;
    }
    do
    {
      v19 = *(const char **)(a1 + v18 + 1072);
      if (!v19)
        goto LABEL_29;
      if (!strcmp(*(const char **)(a1 + v18 + 1072), __s2))
        goto LABEL_28;
      *(_QWORD *)(a1 + 2472) = a1 + v18 + 1152;
      v18 += 88;
    }
    while ((_DWORD)v18 != 1408);
    v19 = *(const char **)(a1 + v18 + 1072);
    if (!v19)
    {
LABEL_29:
      archive_set_error((_DWORD *)a1, 22, "Internal error: Unable to set format", v11, v12, v13, v14, v15, v26);
      v19 = *(const char **)(*(_QWORD *)(a1 + 2472) + 8);
      v20 = -30;
      goto LABEL_31;
    }
LABEL_28:
    if (strcmp(v19, __s2))
      goto LABEL_29;
    v20 = 0;
LABEL_31:
    if (!sub_1DB6DEC28(v19))
    {
      archive_set_error((_DWORD *)a1, -1, "Format not allow-listed in entitlements", v21, v22, v23, v24, v25, v26);
      v20 = -30;
    }
    if (v20 >= v16)
      return v16;
    else
      return v20;
  }
  return result;
}

uint64_t sub_1DB73BD94(uint64_t a1, uint64_t *a2, int *a3)
{
  const char *v6;
  _acl *file;
  uint64_t v8;
  _acl *v9;
  int entry;
  char *v11;
  int v12;
  const unsigned __int8 *qualifier;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t disk_uname;
  uint64_t v23;
  unsigned int v24;
  int flag_np;
  uint64_t v26;
  int perm_np;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  acl_flagset_t *v48;
  int v49;
  int v50;
  acl_flagset_t *v51;
  uint64_t i;
  unsigned int v53;
  char *v55;
  char *v56;
  int v57;
  acl_permset_t permset_p;
  acl_entry_t entry_p;
  acl_tag_t tag_type_p;
  int id_type[2];
  acl_flagset_t flagset_p[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (*a3 < 0)
  {
    v6 = (const char *)sub_1DB6FED34(a1, a2, a3);
    if (!v6)
      return 4294967276;
  }
  else
  {
    v6 = 0;
  }
  archive_entry_acl_clear((uint64_t)a2);
  if (*a3 < 0)
  {
    if (*(_BYTE *)(a1 + 169))
      file = acl_get_file(v6, ACL_TYPE_EXTENDED);
    else
      file = acl_get_link_np(v6, ACL_TYPE_EXTENDED);
  }
  else
  {
    file = acl_get_fd_np(*a3, ACL_TYPE_EXTENDED);
  }
  v9 = file;
  if (!file)
    return 0;
  tag_type_p = ACL_UNDEFINED_TAG;
  flagset_p[0] = 0;
  permset_p = 0;
  entry_p = 0;
  entry = acl_get_entry(file, 0, &entry_p);
  if (entry == -1)
  {
    v11 = "Failed to get first ACL entry";
    goto LABEL_46;
  }
  if (entry)
  {
LABEL_42:
    acl_free(v9);
    v8 = 0;
    goto LABEL_47;
  }
  v11 = "Failed to get ACL tag type";
  while (1)
  {
    if (acl_get_tag_type(entry_p, &tag_type_p))
      goto LABEL_46;
    if (tag_type_p == ACL_EXTENDED_ALLOW)
      break;
    if (tag_type_p == ACL_EXTENDED_DENY)
    {
      v12 = 2048;
      goto LABEL_19;
    }
LABEL_22:
    if (acl_get_entry(v9, -1, &entry_p))
      goto LABEL_42;
  }
  v12 = 1024;
LABEL_19:
  qualifier = (const unsigned __int8 *)acl_get_qualifier(entry_p);
  if (!qualifier)
    goto LABEL_22;
  v14 = (unsigned __int8 *)qualifier;
  *(_QWORD *)id_type = 0;
  if (mbr_uuid_to_id(qualifier, (id_t *)&id_type[1], id_type))
  {
LABEL_21:
    acl_free(v14);
    goto LABEL_22;
  }
  if (id_type[0] != 1)
  {
    if (!id_type[0])
    {
      v21 = id_type[1];
      disk_uname = archive_read_disk_uname(a1, id_type[1], v15, v16, v17, v18, v19, v20);
      v57 = 10001;
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  v21 = id_type[1];
  disk_uname = archive_read_disk_gname(a1, id_type[1], v15, v16, v17, v18, v19, v20);
  v57 = 10003;
LABEL_28:
  acl_free(v14);
  if (acl_get_flagset_np(entry_p, flagset_p))
  {
    v11 = "Failed to get flagset from a NFSv4 ACL entry";
  }
  else
  {
    v55 = (char *)disk_uname;
    v23 = 0;
    v24 = 0;
    do
    {
      flag_np = acl_get_flag_np(flagset_p[0], (acl_flag_t)dword_1DB7547E4[v23 + 1]);
      if (flag_np)
      {
        if (flag_np == -1)
        {
          v11 = "Failed to check flag in a NFSv4 ACL flagset";
          goto LABEL_46;
        }
        v24 |= dword_1DB7547E4[v23];
      }
      v23 += 2;
    }
    while (v23 != 10);
    if (!acl_get_permset(entry_p, &permset_p))
    {
      v26 = 0;
      while (1)
      {
        perm_np = acl_get_perm_np(permset_p, (acl_perm_t)dword_1DB75480C[v26 + 1]);
        if (perm_np)
        {
          if (perm_np == -1)
          {
            v11 = "Failed to check permission in an ACL permission set";
            goto LABEL_46;
          }
          v24 |= dword_1DB75480C[v26];
        }
        v26 += 2;
        if (v26 == 34)
        {
          archive_entry_acl_add_entry((uint64_t)a2, v12, v24, v57, v21, v55);
          goto LABEL_22;
        }
      }
    }
    v11 = "Failed to get ACL permission set";
  }
LABEL_46:
  v28 = __error();
  archive_set_error((_DWORD *)a1, *v28, v11, v29, v30, v31, v32, v33, v55);
  acl_free(v9);
  v34 = __error();
  archive_set_error((_DWORD *)a1, *v34, "Couldn't translate NFSv4 ACLs", v35, v36, v37, v38, v39, v56);
  v8 = 4294967276;
LABEL_47:
  if ((archive_entry_acl_types((uint64_t)a2) & 0x3C00) == 0)
    return v8;
  v66 = 0x92400000277BLL;
  *(_OWORD *)flagset_p = xmmword_1DB754894;
  v63 = unk_1DB7548A4;
  v64 = xmmword_1DB7548B4;
  v65 = unk_1DB7548C4;
  v40 = archive_entry_mode((uint64_t)a2);
  if ((v40 & 4) != 0)
  {
    v41 = 37448;
    HIDWORD(v66) = 37448;
    if ((v40 & 2) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
  v41 = 37440;
  if ((v40 & 2) != 0)
  {
LABEL_52:
    v41 |= 0x30u;
    HIDWORD(v66) = v41;
  }
LABEL_53:
  if ((v40 & 1) != 0)
  {
    HIDWORD(v66) = v41 | 1;
    if ((v40 & 0x20) != 0)
      goto LABEL_59;
LABEL_55:
    v42 = 37440;
    if ((v40 & 4) != 0)
    {
      v44 = 8;
      v45 = 1;
      v43 = 8;
      goto LABEL_61;
    }
    v43 = 0;
    if ((v40 & 0x10) != 0)
      goto LABEL_57;
LABEL_62:
    if ((v40 & 2) != 0)
    {
      v43 |= 0x30u;
      LODWORD(v64) = v43;
    }
  }
  else
  {
    if ((v40 & 0x20) == 0)
      goto LABEL_55;
LABEL_59:
    v43 = 0;
    v44 = 37448;
    v45 = 2;
    v42 = 37448;
LABEL_61:
    LODWORD(flagset_p[6 * v45 / 8 + 1]) = v44;
    if ((v40 & 0x10) == 0)
      goto LABEL_62;
LABEL_57:
    v42 |= 0x30u;
    DWORD2(v65) = v42;
  }
  if ((v40 & 9) != 0)
  {
    if ((v40 & 8) == 0)
      v42 = v43;
    v46 = 6;
    if ((v40 & 8) == 0)
      v46 = 3;
    LODWORD(flagset_p[v46 + 1]) = v42 | 1;
  }
  if ((v40 & 0x100) != 0)
  {
    v49 = 63176;
    HIDWORD(v64) = 63176;
    if ((v40 & 0x24) == 4)
    {
      v50 = 0;
      v48 = &flagset_p[1];
      v47 = 8;
LABEL_75:
      *(_DWORD *)v48 = 8;
      if ((v40 & 0x80) != 0)
        goto LABEL_81;
    }
    else
    {
      v50 = 0;
      v47 = 0;
      if ((v40 & 0x80) != 0)
        goto LABEL_81;
    }
  }
  else
  {
    if ((v40 & 0x24) != 0)
    {
      v47 = 0;
      v48 = (acl_flagset_t *)((char *)&v63 + 4);
      v49 = 63168;
      v50 = 8;
      goto LABEL_75;
    }
    v50 = 0;
    v47 = 0;
    v49 = 63168;
    if ((v40 & 0x80) != 0)
    {
LABEL_81:
      v49 |= 0x30u;
      HIDWORD(v64) = v49;
      if ((v40 & 0x12) == 2)
      {
        v47 |= 0x30u;
        LODWORD(flagset_p[1]) = v47;
      }
      goto LABEL_83;
    }
  }
  if ((v40 & 0x12) != 0)
  {
    v50 |= 0x30u;
    DWORD1(v63) = v50;
  }
LABEL_83:
  if ((v40 & 0x40) != 0)
  {
    HIDWORD(v64) = v49 | 1;
    if ((v40 & 9) == 1)
    {
      v51 = &flagset_p[1];
LABEL_88:
      *(_DWORD *)v51 = v47 | 1;
    }
  }
  else if ((v40 & 9) != 0)
  {
    v51 = (acl_flagset_t *)((char *)&v63 + 4);
    v47 = v50;
    goto LABEL_88;
  }
  for (i = 0; i != 72; i += 12)
  {
    v53 = *(_DWORD *)((char *)&flagset_p[1] + i);
    if (v53)
      archive_entry_acl_add_entry((uint64_t)a2, *(_DWORD *)((char *)flagset_p + i), v53, *(_DWORD *)((char *)flagset_p + i + 4), -1, 0);
  }
  return v8;
}

uint64_t sub_1DB73C2E8(_DWORD *a1, int a2, const char *a3, unsigned __int16 *a4)
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _acl_entry *v24;
  acl_tag_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uid_t v31;
  gid_t v32;
  uint64_t i;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  char *v42;
  _DWORD *v43;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  acl_flagset_t flagset_p;
  acl_permset_t permset_p;
  acl_entry_t entry_p;
  acl_t acl;
  uuid_t uu;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if ((sub_1DB71806C((uint64_t)a4) & 0x3C00) == 0)
    return 0;
  v8 = sub_1DB718074((uint64_t)a4, 15360);
  if (!v8)
    return 0;
  permset_p = 0;
  entry_p = 0;
  v48 = 0;
  flagset_p = 0;
  v46 = 0;
  v47 = 0;
  memset(uu, 0, sizeof(uu));
  acl = acl_init(v8);
  if (!acl)
  {
    v16 = __error();
    archive_set_error(a1, *v16, "Failed to initialize ACL working storage", v17, v18, v19, v20, v21, v45);
    return 4294967271;
  }
  if (sub_1DB7180D8((uint64_t)a1, a4, 15360, (_DWORD *)&v48 + 1, (int *)&v48, (_DWORD *)&v47 + 1, &v47, &v46))
  {
LABEL_5:
    if (a2 < 0)
    {
      if (acl_set_link_np(a3, ACL_TYPE_EXTENDED, acl) && *__error() != 102)
      {
        v35 = *__error();
        archive_set_error(a1, v35, "Failed to set acl: %s", v36, v37, v38, v39, v40, "nfs4");
        goto LABEL_49;
      }
    }
    else if (acl_set_fd_np(a2, acl, ACL_TYPE_EXTENDED) && *__error() != 102)
    {
      v9 = *__error();
      archive_set_error(a1, v9, "Failed to set acl on fd: %s", v10, v11, v12, v13, v14, "nfs4");
LABEL_49:
      v15 = 4294967276;
      goto LABEL_55;
    }
    v15 = 0;
    goto LABEL_55;
  }
  while (1)
  {
    if (HIDWORD(v47) == 10002 || HIDWORD(v47) == 10004 || HIDWORD(v47) == 10107)
      goto LABEL_19;
    if (acl_create_entry(&acl, &entry_p))
    {
      v41 = *__error();
      v42 = "Failed to create a new ACL entry";
LABEL_53:
      v43 = a1;
      goto LABEL_54;
    }
    if (HIDWORD(v48) == 1024)
    {
      v24 = entry_p;
      v25 = ACL_EXTENDED_ALLOW;
    }
    else
    {
      if (HIDWORD(v48) != 2048)
        goto LABEL_19;
      v24 = entry_p;
      v25 = ACL_EXTENDED_DENY;
    }
    acl_set_tag_type(v24, v25);
    if (HIDWORD(v47) != 10003)
      break;
    v32 = archive_write_disk_gid((uint64_t)a1, v46, (int)v47, v26, v27, v28, v29, v30);
    if (mbr_gid_to_uuid(v32, uu))
      goto LABEL_19;
LABEL_31:
    if (!acl_set_qualifier(entry_p, uu))
    {
      if (acl_get_permset(entry_p, &permset_p))
      {
        v41 = *__error();
        v42 = "Failed to get ACL permission set";
      }
      else if (acl_clear_perms(permset_p))
      {
        v41 = *__error();
        v42 = "Failed to clear ACL permissions";
      }
      else
      {
        for (i = 0; i != 34; i += 2)
        {
          if ((dword_1DB75480C[i] & v48) != 0
            && acl_add_perm(permset_p, (acl_perm_t)dword_1DB75480C[i + 1]))
          {
            v41 = *__error();
            v42 = "Failed to add ACL permission";
            goto LABEL_53;
          }
        }
        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          v41 = *__error();
          v42 = "Failed to get flagset from an NFSv4 ACL entry";
        }
        else if (acl_clear_flags_np(flagset_p))
        {
          v41 = *__error();
          v42 = "Failed to clear flags from an NFSv4 ACL flagset";
        }
        else
        {
          v34 = 0;
          while ((dword_1DB7547E4[v34] & v48) == 0
               || !acl_add_flag_np(flagset_p, (acl_flag_t)dword_1DB7547E4[v34 + 1]))
          {
            v34 += 2;
            if (v34 == 10)
              goto LABEL_19;
          }
          v41 = *__error();
          v42 = "Failed to add flag to NFSv4 ACL flagset";
        }
      }
      goto LABEL_53;
    }
LABEL_19:
    if (sub_1DB7180D8((uint64_t)a1, a4, 15360, (_DWORD *)&v48 + 1, (int *)&v48, (_DWORD *)&v47 + 1, &v47, &v46))goto LABEL_5;
  }
  if (HIDWORD(v47) == 10001)
  {
    v31 = archive_write_disk_uid((uint64_t)a1, v46, (int)v47, v26, v27, v28, v29, v30);
    if (mbr_uid_to_uuid(v31, uu))
      goto LABEL_19;
    goto LABEL_31;
  }
  v42 = "Unsupported ACL tag";
  v43 = a1;
  v41 = -1;
LABEL_54:
  archive_set_error(v43, v41, v42, v26, v27, v28, v29, v30, v45);
  v15 = 4294967271;
LABEL_55:
  acl_free(acl);
  return v15;
}

uint64_t archive_write_set_format_pax_restricted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, "archive_write_set_format_pax_restricted", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    result = archive_write_set_format_pax(a1, v10, v11, v12, v13, v14, v15, v16);
    *(_DWORD *)(a1 + 16) = 196611;
    *(_QWORD *)(a1 + 24) = "restricted POSIX pax interchange";
  }
  return result;
}

uint64_t archive_write_set_format_pax(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void (*v10)(uint64_t);
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, "archive_write_set_format_pax", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10)
      v10(a1);
    v11 = malloc_type_calloc(1uLL, 0x80uLL, 0x103004090A86EF5uLL);
    if (v11)
    {
      v17 = v11;
      result = 0;
      v17[31] = 3;
      *(_QWORD *)(a1 + 264) = v17;
      *(_QWORD *)(a1 + 272) = "pax";
      *(_QWORD *)(a1 + 304) = sub_1DB73CA14;
      *(_QWORD *)(a1 + 312) = sub_1DB73DC18;
      *(_QWORD *)(a1 + 320) = sub_1DB73DD14;
      *(_QWORD *)(a1 + 328) = sub_1DB73DD1C;
      *(_QWORD *)(a1 + 288) = sub_1DB73C838;
      *(_QWORD *)(a1 + 296) = sub_1DB73DD80;
      *(_DWORD *)(a1 + 16) = 196610;
      *(_QWORD *)(a1 + 24) = "POSIX pax interchange";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_1DB73C838(uint64_t a1, char *__s1, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char *v13;
  unsigned int v14;
  _QWORD *v15;
  char *v16;

  v6 = *(_QWORD *)(a1 + 264);
  if (!strcmp(__s1, "hdrcharset"))
  {
    if (!a3 || !*a3)
    {
      v13 = "pax: hdrcharset option needs a character-set name";
      goto LABEL_21;
    }
    if (!strcmp(a3, "BINARY") || !strcmp(a3, "binary"))
    {
      result = 0;
      *(_DWORD *)(v6 + 120) = 1;
    }
    else
    {
      if (strcmp(a3, "UTF-8"))
      {
        v13 = "pax: invalid charset name";
LABEL_21:
        archive_set_error((_DWORD *)a1, -1, v13, v7, v8, v9, v10, v11, v16);
        return 4294967271;
      }
      v15 = sub_1DB72D08C(a1, "UTF-8", 0);
      *(_QWORD *)(v6 + 112) = v15;
      if (v15)
        return 0;
      else
        return 4294967266;
    }
  }
  else
  {
    if (strcmp(__s1, "xattrheader"))
      return 4294967276;
    if (!a3 || !*a3)
    {
      v13 = "pax: xattrheader requires a value";
      goto LABEL_21;
    }
    if (!strcmp(a3, "ALL") || !strcmp(a3, "all"))
    {
      result = 0;
      v14 = *(_DWORD *)(v6 + 124) | 3;
    }
    else if (!strcmp(a3, "SCHILY") || !strcmp(a3, "schily"))
    {
      result = 0;
      v14 = *(_DWORD *)(v6 + 124) & 0xFFFFFFFC | 1;
    }
    else
    {
      if (strcmp(a3, "LIBARCHIVE") && strcmp(a3, "libarchive"))
      {
        v13 = "pax: invalid xattr header name";
        goto LABEL_21;
      }
      result = 0;
      v14 = *(_DWORD *)(v6 + 124) & 0xFFFFFFFC | 2;
    }
    *(_DWORD *)(v6 + 124) = v14;
  }
  return result;
}

uint64_t sub_1DB73CA14(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  const char *v25;
  size_t v26;
  char *v27;
  char *v28;
  char *i;
  char *v30;
  char *v31;
  void *v32;
  size_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  const char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  _QWORD *v60;
  uint64_t v61;
  char *v62;
  uint64_t *v63;
  uint64_t v64;
  char *v65;
  int v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  int v89;
  int v90;
  size_t v91;
  int v92;
  char *v93;
  int v94;
  int v95;
  size_t v96;
  int v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  BOOL v105;
  char **v107;
  _BYTE *v108;
  const char *v109;
  size_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  int v114;
  int v115;
  size_t v116;
  uint64_t v117;
  char *v118;
  int v119;
  int v120;
  size_t v121;
  int v122;
  int v123;
  _BOOL4 v124;
  _BOOL4 v125;
  int v126;
  __int16 v127;
  int v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  char *v139;
  size_t v140;
  size_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  _DWORD *v162;
  int v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  __int16 v173;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t *v183;
  size_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  char *v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  unint64_t v193;
  unint64_t v194;
  size_t __n;
  unint64_t v196;
  unint64_t v197;
  char *v198;
  char *v199;
  char *v200;
  char *__s;
  char *v202;
  char v203[256];
  char v204[256];
  char __dst[256];
  uint64_t *v206[64];
  char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v200 = 0;
  __s = 0;
  v198 = 0;
  v199 = 0;
  v4 = *(_QWORD *)(a1 + 264);
  if (!archive_entry_pathname(a2))
  {
    archive_set_error((_DWORD *)a1, -1, "Can't record entry in tar file without pathname", v5, v6, v7, v8, v9, v188);
    return 4294967271;
  }
  if (*(_DWORD *)(v4 + 120))
  {
    v10 = 0;
  }
  else
  {
    v10 = *(_QWORD **)(v4 + 112);
    if (!v10)
    {
      v10 = sub_1DB72D08C(a1, "UTF-8", 1);
      *(_QWORD *)(v4 + 112) = v10;
      if (!v10)
        return 4294967271;
    }
  }
  v202 = 0;
  v196 = 0;
  v197 = 0;
  v194 = 0;
  __n = 0;
  v192 = 0;
  v193 = 0;
  v190 = 0;
  v191 = 0;
  v189 = 0;
  v12 = sub_1DB73DDFC((_DWORD *)a1, (uint64_t)a2, &v202, &v196, (uint64_t)v10);
  v13 = v12;
  if ((_DWORD)v12 == -30)
    return v12;
  if ((_DWORD)v12)
  {
    if (sub_1DB73DDFC((_DWORD *)a1, (uint64_t)a2, &v202, &v196, 0) == -30)
      return 4294967266;
    v14 = v202;
    sub_1DB72D0D4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v15, v16, v17, v18, v19, v14);
    v10 = 0;
    v13 = 4294967276;
  }
  if (!v202)
  {
    HIDWORD(v21) = archive_entry_filetype((uint64_t)a2);
    LODWORD(v21) = HIDWORD(v21) - 4096;
    v20 = v21 >> 12;
    if (v20 > 9)
      goto LABEL_88;
    if (((1 << v20) & 0x2A3) != 0)
      goto LABEL_15;
    if (v20 != 3)
    {
LABEL_88:
      sub_1DB7355D0((_DWORD *)a1, a2);
      return 4294967271;
    }
    v44 = (const char *)archive_entry_pathname(a2);
    if (v44)
    {
      v45 = (char *)v44;
      if (*v44)
      {
        if (v44[strlen(v44) - 1] != 47)
        {
          v208 = 0;
          v207 = 0;
          v209 = 0;
          __n = strlen(v45);
          if (!sub_1DB6E3190((void **)&v207, __n + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v46, v47, v48, v49, v50, v188);
            v107 = &v207;
LABEL_230:
            sub_1DB6E7C3C((uint64_t)v107);
            return 4294967266;
          }
          v208 = 0;
          sub_1DB6E323C((uint64_t *)&v207, v45, __n);
          sub_1DB72CE60((uint64_t *)&v207, 47);
          archive_entry_copy_pathname((uint64_t)a2, v207);
          sub_1DB6E7C3C((uint64_t)&v207);
        }
      }
    }
  }
LABEL_15:
  v22 = archive_entry_mac_metadata((uint64_t)a2, &v197);
  if (!v22)
    goto LABEL_44;
  v23 = v22;
  v24 = (void **)archive_entry_new2(a1);
  v25 = (const char *)archive_entry_pathname(a2);
  v26 = strlen(v25);
  v27 = (char *)malloc_type_malloc(v26 + 3, 0xB889D8D5uLL);
  v28 = v27;
  if (!v27 || !v24)
  {
    archive_entry_free(v24);
    free(v28);
    return 4294967271;
  }
  for (i = strcpy(v27, v25); ; i = v28)
  {
    v30 = strrchr(i, 47);
    if (!v30)
    {
      memmove(v28 + 2, v28, v26 + 1);
      v31 = v28;
      goto LABEL_26;
    }
    if (v30[1])
      break;
    *v30 = 0;
  }
  v31 = v30 + 1;
  v32 = v30 + 3;
  v33 = strlen(v30 + 1);
  memmove(v32, v31, v33 + 1);
LABEL_26:
  *(_WORD *)v31 = 24366;
  archive_entry_copy_pathname((uint64_t)v24, v28);
  free(v28);
  archive_entry_set_size((uint64_t)v24, v197);
  archive_entry_set_filetype((uint64_t)v24, 0x8000);
  v34 = archive_entry_perm((uint64_t)a2);
  archive_entry_set_perm((uint64_t)v24, v34);
  v35 = archive_entry_mtime((uint64_t)a2);
  v36 = archive_entry_mtime_nsec((uint64_t)a2);
  archive_entry_set_mtime((uint64_t)v24, v35, v36);
  v37 = archive_entry_gid((uint64_t)a2);
  archive_entry_set_gid((uint64_t)v24, v37);
  v38 = (char *)archive_entry_gname(a2);
  archive_entry_set_gname((uint64_t)v24, v38);
  v39 = archive_entry_uid((uint64_t)a2);
  archive_entry_set_uid((uint64_t)v24, v39);
  v40 = (char *)archive_entry_uname(a2);
  archive_entry_set_uname((uint64_t)v24, v40);
  v41 = sub_1DB73CA14(a1, v24);
  archive_entry_free(v24);
  v11 = v41;
  if ((int)v41 < -20)
    return v11;
  v42 = sub_1DB73DC18((_QWORD *)a1, v23, v197);
  v43 = v42;
  if ((int)v42 < -20)
    return v42;
  v51 = sub_1DB73DD80((_QWORD *)a1);
  v11 = v51;
  if ((int)v51 < -20)
    return v11;
  if ((int)v41 >= (int)v13)
    v52 = v13;
  else
    v52 = v41;
  if (v52 >= v43)
    v52 = v43;
  if ((int)v51 >= v52)
    v13 = v52;
  else
    v13 = v51;
LABEL_44:
  v53 = archive_entry_clone(a2);
  if (!v53)
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v54, v55, v56, v57, v58, v188);
    return 4294967266;
  }
  v59 = (uint64_t *)v53;
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  while (1)
  {
    v60 = *(_QWORD **)(v4 + 96);
    if (!v60)
      break;
    *(_QWORD *)(v4 + 96) = *v60;
    free(v60);
  }
  *(_QWORD *)(v4 + 104) = 0;
  if (!v202
    && archive_entry_filetype((uint64_t)v59) == 0x8000
    && archive_entry_sparse_reset((uint64_t)v59))
  {
    v207 = 0;
    v206[0] = 0;
    v61 = 0;
    if (!archive_entry_sparse_next((uint64_t)v59, &v207, v206))
    {
      do
      {
        v62 = v207;
        v63 = v206[0];
      }
      while (!archive_entry_sparse_next((uint64_t)v59, &v207, v206));
      v61 = (uint64_t)&v62[(_QWORD)v63];
    }
    if (v61 < archive_entry_size((uint64_t)v59))
    {
      v64 = archive_entry_size((uint64_t)v59);
      archive_entry_sparse_add_entry(v59, v64, 0);
    }
    v65 = (char *)archive_entry_sparse_reset((uint64_t)v59);
  }
  else
  {
    v65 = 0;
  }
  v66 = sub_1DB73DE9C((_DWORD *)a1, v59, &__s, &__n, (uint64_t)v10);
  if (v66)
  {
    if (v66 == -30 || sub_1DB73DE9C((_DWORD *)a1, v59, &__s, &__n, 0) == -30)
      goto LABEL_108;
    v67 = __s;
    sub_1DB72D0D4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v68, v69, v70, v71, v72, v67);
    v10 = 0;
    v13 = 4294967276;
  }
  v73 = sub_1DB73DF00((_DWORD *)a1, v59, &v199, &v193, (uint64_t)v10);
  if (v73)
  {
    if (v73 == -30 || sub_1DB73DF00((_DWORD *)a1, v59, &v199, &v193, 0) == -30)
      goto LABEL_108;
    v74 = v199;
    sub_1DB72D0D4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate uname '%s' to %s", v75, v76, v77, v78, v79, v74);
    v10 = 0;
    v13 = 4294967276;
  }
  v80 = sub_1DB73DF64((_DWORD *)a1, v59, &v198, &v192, (uint64_t)v10);
  if (v80)
  {
    if (v80 == -30 || sub_1DB73DF64((_DWORD *)a1, v59, &v198, &v192, 0) == -30)
      goto LABEL_108;
    v81 = v198;
    sub_1DB72D0D4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate gname '%s' to %s", v82, v83, v84, v85, v86, v81);
    v10 = 0;
    v13 = 4294967276;
  }
  v200 = v202;
  v194 = v196;
  if (v202 || (v97 = sub_1DB73DFC8((_DWORD *)a1, (uint64_t)v59, &v200, &v194, (uint64_t)v10)) == 0)
  {
    if (v10)
      goto LABEL_74;
  }
  else
  {
    if (v97 == -30 || sub_1DB73DFC8((_DWORD *)a1, (uint64_t)v59, &v200, &v194, 0) == -30)
      goto LABEL_108;
    v98 = v200;
    sub_1DB72D0D4((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v99, v100, v101, v102, v103, v98);
    v13 = 4294967276;
  }
  if (!*(_DWORD *)(v4 + 120))
  {
    if (!v202)
    {
LABEL_105:
      if (sub_1DB73DE9C((_DWORD *)a1, v59, &__s, &__n, 0) != -30
        && sub_1DB73DF00((_DWORD *)a1, v59, &v199, &v193, 0) != -30
        && sub_1DB73DF64((_DWORD *)a1, v59, &v198, &v192, 0) != -30)
      {
        goto LABEL_73;
      }
      goto LABEL_108;
    }
    if (sub_1DB73DDFC((_DWORD *)a1, (uint64_t)v59, &v202, &v196, 0) != -30)
    {
      v200 = v202;
      v194 = v196;
      goto LABEL_105;
    }
LABEL_108:
    archive_entry_free((void **)v59);
    return 4294967266;
  }
LABEL_73:
  sub_1DB73ECAC((uint64_t *)(v4 + 40), "hdrcharset", "BINARY", 6uLL);
LABEL_74:
  v87 = __s;
  if (!__s)
    goto LABEL_78;
  v88 = __s;
  do
  {
    v90 = *v88++;
    v89 = v90;
  }
  while (v90 > 0);
  if (v89)
    goto LABEL_78;
  if (__n < 0x65)
    goto LABEL_101;
  v104 = strchr(&__s[__n - 101], 47);
  if (v104 == v87)
    v104 = strchr(v87 + 1, 47);
  if (!v104 || (v104 - v87 <= 155 ? (v105 = v104[1] == 0) : (v105 = 1), v105))
  {
LABEL_78:
    v91 = strlen(v87);
    sub_1DB73ECAC((uint64_t *)(v4 + 40), "path", v87, v91);
    sub_1DB73E02C(__dst, __s, __n, 0);
    archive_entry_set_pathname((uint64_t)v59, __dst);
    v92 = 1;
  }
  else
  {
LABEL_101:
    v92 = 0;
  }
  if (v200)
  {
    if (v194 > 0x64)
      goto LABEL_84;
    v93 = v200;
    do
    {
      v95 = *v93++;
      v94 = v95;
    }
    while (v95 > 0);
    if (v94)
    {
LABEL_84:
      v96 = strlen(v200);
      sub_1DB73ECAC((uint64_t *)(v4 + 40), "linkpath", v200, v96);
      if (v194 >= 0x65)
      {
        if (v202)
          archive_entry_set_hardlink((uint64_t)v59, "././@LongHardLink");
        else
          archive_entry_set_symlink((uint64_t)v59, "././@LongSymLink");
      }
      v92 = 1;
    }
  }
  v189 = 0;
  v190 = 0;
  v191 = 0;
  v108 = (_BYTE *)archive_entry_pathname(v59);
  if (archive_entry_pathname(v59))
  {
    v109 = (const char *)archive_entry_pathname(v59);
    v110 = strlen(v109);
  }
  else
  {
    v110 = 0;
  }
  sub_1DB6E323C((uint64_t *)&v189, v108, v110);
  if (archive_entry_size((uint64_t)v59) >= 0x200000000)
  {
    v111 = archive_entry_size((uint64_t)v59);
    sub_1DB73E2B8((uint64_t *)(v4 + 40), "size", v111);
    v92 = 1;
  }
  if ((archive_entry_gid((uint64_t)v59) & 0xFFFC0000) != 0)
  {
    v112 = archive_entry_gid((uint64_t)v59);
    sub_1DB73E2B8((uint64_t *)(v4 + 40), "gid", v112);
    v92 = 1;
  }
  if (v198)
  {
    if (v192 > 0x1F)
      goto LABEL_126;
    v113 = v198;
    do
    {
      v115 = *v113++;
      v114 = v115;
    }
    while (v115 > 0);
    if (v114)
    {
LABEL_126:
      v116 = strlen(v198);
      sub_1DB73ECAC((uint64_t *)(v4 + 40), "gname", v198, v116);
      v92 = 1;
    }
  }
  if ((archive_entry_uid((uint64_t)v59) & 0xFFFC0000) != 0)
  {
    v117 = archive_entry_uid((uint64_t)v59);
    sub_1DB73E2B8((uint64_t *)(v4 + 40), "uid", v117);
    v92 = 1;
  }
  if (v199)
  {
    if (v193 > 0x1F)
      goto LABEL_134;
    v118 = v199;
    do
    {
      v120 = *v118++;
      v119 = v120;
    }
    while (v120 > 0);
    if (v119)
    {
LABEL_134:
      v121 = strlen(v199);
      sub_1DB73ECAC((uint64_t *)(v4 + 40), "uname", v199, v121);
      v92 = 1;
    }
  }
  if (archive_entry_filetype((uint64_t)v59) == 24576
    || archive_entry_filetype((uint64_t)v59) == 0x2000)
  {
    v122 = archive_entry_rdevmajor((uint64_t)v59);
    v123 = archive_entry_rdevminor(v59);
    if (v122 >= 0x40000)
    {
      sub_1DB73E2B8((uint64_t *)(v4 + 40), "SCHILY.devmajor", v122);
      v92 = 1;
    }
    if (v123 >= 0x40000)
    {
      sub_1DB73E2B8((uint64_t *)(v4 + 40), "SCHILY.devminor", v123);
LABEL_142:
      archive_entry_fflags_text(v59);
LABEL_143:
      v124 = 0;
      goto LABEL_144;
    }
  }
  if (v92 || archive_entry_mtime((uint64_t)v59) < 0 || archive_entry_mtime((uint64_t)v59) >= 0x7FFFFFFF)
    goto LABEL_142;
  v179 = archive_entry_fflags_text(v59);
  if (v179 && *v179)
    goto LABEL_143;
  v124 = (int)archive_entry_xattr_count((uint64_t)a2) < 1;
LABEL_144:
  v125 = (int)v65 < 1 && v124;
  v126 = archive_entry_acl_types((uint64_t)a2);
  v127 = v126;
  v128 = 1;
  if (v125 && !v126)
    v128 = (int)archive_entry_symlink_type((uint64_t)v59) > 0;
  if (*(_DWORD *)(a1 + 16) != 196611)
  {
    if (archive_entry_ctime((uint64_t)v59) || archive_entry_ctime_nsec((uint64_t)v59))
    {
      v129 = archive_entry_ctime((uint64_t)v59);
      v130 = archive_entry_ctime_nsec((uint64_t)v59);
      sub_1DB73E38C((uint64_t *)(v4 + 40), "ctime", v129, v130);
    }
    if (archive_entry_atime((uint64_t)v59) || archive_entry_atime_nsec((uint64_t)v59))
    {
      v131 = archive_entry_atime((uint64_t)v59);
      v132 = archive_entry_atime_nsec((uint64_t)v59);
      sub_1DB73E38C((uint64_t *)(v4 + 40), "atime", v131, v132);
    }
    if (archive_entry_birthtime_is_set((uint64_t)v59))
    {
      v133 = archive_entry_birthtime((uint64_t)v59);
      if (v133 < archive_entry_mtime((uint64_t)v59))
      {
        v134 = archive_entry_birthtime((uint64_t)v59);
        v135 = archive_entry_birthtime_nsec((uint64_t)v59);
        sub_1DB73E38C((uint64_t *)(v4 + 40), "LIBARCHIVE.creationtime", v134, v135);
      }
    }
  }
  if (((*(_DWORD *)(a1 + 16) == 196611) & ~v128) != 0)
  {
    v149 = 0;
  }
  else
  {
    if (archive_entry_mtime((uint64_t)v59) < 0
      || archive_entry_mtime((uint64_t)v59) > 2147483646
      || archive_entry_mtime_nsec((uint64_t)v59))
    {
      v136 = archive_entry_mtime((uint64_t)v59);
      v137 = archive_entry_mtime_nsec((uint64_t)v59);
      sub_1DB73E38C((uint64_t *)(v4 + 40), "mtime", v136, v137);
    }
    v138 = archive_entry_fflags_text(v59);
    if (v138)
    {
      v139 = v138;
      if (*v138)
      {
        v140 = strlen(v138);
        sub_1DB73ECAC((uint64_t *)(v4 + 40), "SCHILY.fflags", v139, v140);
      }
    }
    if ((v127 & 0x3C00) != 0)
    {
      v13 = sub_1DB73E4E0((_DWORD *)a1, (uint64_t)a2, v4, 25);
      if ((_DWORD)v13 == -30)
        goto LABEL_229;
    }
    if ((v127 & 0x100) != 0)
    {
      v13 = sub_1DB73E4E0((_DWORD *)a1, (uint64_t)a2, v4, 265);
      if ((_DWORD)v13 == -30)
        goto LABEL_229;
    }
    if ((v127 & 0x200) != 0)
    {
      v13 = sub_1DB73E4E0((_DWORD *)a1, (uint64_t)a2, v4, 521);
      if ((_DWORD)v13 == -30)
        goto LABEL_229;
    }
    if ((int)v65 < 1)
    {
      v149 = 0;
    }
    else
    {
      v207 = 0;
      v206[0] = 0;
      sub_1DB73E2B8((uint64_t *)(v4 + 40), "GNU.sparse.major", 1);
      sub_1DB73E2B8((uint64_t *)(v4 + 40), "GNU.sparse.minor", 0);
      v141 = strlen(__s);
      sub_1DB73ECAC((uint64_t *)(v4 + 40), "GNU.sparse.name", __s, v141);
      v142 = archive_entry_size((uint64_t)v59);
      sub_1DB73E2B8((uint64_t *)(v4 + 40), "GNU.sparse.realsize", v142);
      sub_1DB73E614(v203, v189);
      archive_entry_set_pathname((uint64_t)v59, v203);
      sub_1DB7303C0((void **)(v4 + 64), "%d\n", v143, v144, v145, v146, v147, v148, v65);
      v149 = 0;
      while (!archive_entry_sparse_next((uint64_t)v59, &v207, v206))
      {
        sub_1DB7303C0((void **)(v4 + 64), "%jd\n%jd\n", v150, v151, v152, v153, v154, v155, v207);
        v149 += (uint64_t)v206[0];
        if (sub_1DB73E6D0(v4, (uint64_t)v207, (uint64_t)v206[0]))
        {
          v161 = "Can't allocate memory";
          v162 = (_DWORD *)a1;
          v163 = 12;
          goto LABEL_202;
        }
      }
    }
    if (sub_1DB73E74C((_DWORD *)a1, v4, (uint64_t)a2) == -30)
      goto LABEL_229;
    if (archive_entry_symlink_type((uint64_t)v59) == 1)
    {
      v182 = "file";
      v183 = (uint64_t *)(v4 + 40);
      v184 = 4;
LABEL_226:
      sub_1DB73ECAC(v183, "LIBARCHIVE.symlinktype", v182, v184);
      goto LABEL_180;
    }
    if (archive_entry_symlink_type((uint64_t)v59) == 2)
    {
      v182 = "dir";
      v183 = (uint64_t *)(v4 + 40);
      v184 = 3;
      goto LABEL_226;
    }
  }
LABEL_180:
  if (archive_entry_filetype((uint64_t)v59) != 0x8000)
    archive_entry_set_size((uint64_t)v59, 0);
  v164 = v202;
  if (*(_DWORD *)(a1 + 16) != 196610 && v202)
  {
    archive_entry_set_size((uint64_t)v59, 0);
    v164 = v202;
  }
  if (v164)
    archive_entry_set_size((uint64_t)v59, 0);
  v165 = archive_entry_size((uint64_t)v59);
  v166 = *(_QWORD *)(v4 + 72);
  if (v166)
  {
    v167 = -*(_WORD *)(v4 + 72) & 0x1FF;
    *(_QWORD *)(v4 + 88) = v167;
    archive_entry_set_size((uint64_t)v59, v166 + v149 + v167);
  }
  if (sub_1DB743574((_DWORD *)a1, (char *)v206, v59, -1, 0, 0) == -30)
    goto LABEL_229;
  if (*(_QWORD *)(v4 + 48))
  {
    v168 = (uint64_t *)archive_entry_new2(a1);
    sub_1DB73EB70((uint64_t)v204, v189);
    archive_entry_set_pathname((uint64_t)v168, v204);
    archive_entry_set_size((uint64_t)v168, *(_QWORD *)(v4 + 48));
    v169 = archive_entry_uid((uint64_t)v59);
    if (v169 >= 0x3FFFF)
      v170 = 0x3FFFFLL;
    else
      v170 = v169;
    archive_entry_set_uid((uint64_t)v168, v170);
    v171 = archive_entry_gid((uint64_t)v59);
    if (v171 >= 0x3FFFF)
      v172 = 0x3FFFFLL;
    else
      v172 = v171;
    archive_entry_set_gid((uint64_t)v168, v172);
    v173 = archive_entry_mode((uint64_t)v59);
    archive_entry_set_mode((uint64_t)v168, v173 & 0xF1FF);
    v174 = (char *)archive_entry_uname(v59);
    archive_entry_set_uname((uint64_t)v168, v174);
    v175 = (char *)archive_entry_gname(v59);
    archive_entry_set_gname((uint64_t)v168, v175);
    v176 = archive_entry_mtime((uint64_t)v59);
    if ((v176 & (unint64_t)~(v176 >> 63)) >= 0x7FFFFFFF)
      v177 = 0x7FFFFFFFLL;
    else
      v177 = v176 & ~(v176 >> 63);
    archive_entry_set_mtime((uint64_t)v168, v177, 0);
    archive_entry_set_atime((uint64_t)v168, 0, 0);
    archive_entry_set_ctime((uint64_t)v168, 0, 0);
    v178 = sub_1DB743574((_DWORD *)a1, (char *)&v207, v168, 120, 1, 0);
    archive_entry_free((void **)v168);
    if (v178 <= -21)
    {
      v161 = "archive_write_pax_header: 'x' header failed?!  This can't happen.\n";
      v162 = (_DWORD *)a1;
      v163 = -1;
LABEL_202:
      archive_set_error(v162, v163, v161, v156, v157, v158, v159, v160, v188);
      goto LABEL_229;
    }
    if (v178 >= (int)v13)
      v11 = v13;
    else
      v11 = v178;
    if (sub_1DB7322A8(a1, (uint64_t)&v207, 512))
    {
      sub_1DB73DE60(v4);
      *(_QWORD *)v4 = 0;
      *(_QWORD *)(v4 + 8) = 0;
LABEL_229:
      archive_entry_free((void **)v59);
      v107 = &v189;
      goto LABEL_230;
    }
    v185 = *(_QWORD *)(v4 + 40);
    v186 = *(_QWORD *)(v4 + 48);
    v187 = -*(_WORD *)(v4 + 48) & 0x1FF;
    *(_QWORD *)v4 = v186;
    *(_QWORD *)(v4 + 8) = v187;
    if (sub_1DB7322A8(a1, v185, v186) || sub_1DB732308((_QWORD *)a1, *(_QWORD *)(v4 + 8)))
      goto LABEL_229;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
  }
  else
  {
    v11 = v13;
  }
  v180 = sub_1DB7322A8(a1, (uint64_t)v206, 512);
  if ((_DWORD)v180)
  {
    v181 = v180;
    archive_entry_free((void **)v59);
    sub_1DB6E7C3C((uint64_t)&v189);
    return v181;
  }
  else
  {
    archive_entry_set_size((uint64_t)a2, v165);
    if (!*(_QWORD *)(v4 + 96) && v165)
    {
      sub_1DB73E6D0(v4, 0, v165);
      LODWORD(v149) = v165;
    }
    *(_QWORD *)(v4 + 8) = -(int)v149 & 0x1FFLL;
    archive_entry_free((void **)v59);
    sub_1DB6E7C3C((uint64_t)&v189);
  }
  return v11;
}

unint64_t sub_1DB73DC18(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;

  v6 = (_QWORD *)a1[33];
  v7 = v6[9];
  if (v7)
  {
    v8 = sub_1DB7322A8((uint64_t)a1, v6[8], v7);
    if (v8)
      return v8;
    v8 = sub_1DB732308(a1, v6[11]);
    if (v8)
      return v8;
    v6[9] = 0;
  }
  v9 = 0;
  if (a3)
  {
    v10 = (_QWORD *)v6[12];
    while (v10)
    {
      while (1)
      {
        v11 = v10[3];
        if (v11)
          break;
        v12 = (_QWORD *)*v10;
        free(v10);
        v6[12] = v12;
        v10 = v12;
        if (!v12)
          return v9;
      }
      if (a3 - v9 >= v11)
        v13 = v10[3];
      else
        v13 = a3 - v9;
      if (*((_DWORD *)v10 + 2))
      {
        v10[3] = v11 - v13;
      }
      else
      {
        v14 = sub_1DB7322A8((uint64_t)a1, a2 + v9, v13);
        v10 = (_QWORD *)v6[12];
        v10[3] -= v13;
        if (v14)
          return v14;
      }
      v9 += v13;
      if (v9 >= a3)
        return v9;
    }
  }
  return v9;
}

uint64_t sub_1DB73DD14(_QWORD *a1)
{
  return sub_1DB732308(a1, 0x400uLL);
}

uint64_t sub_1DB73DD1C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;

  v1 = *(_QWORD **)(a1 + 264);
  if (v1)
  {
    sub_1DB6E7C3C((uint64_t)(v1 + 5));
    sub_1DB6E7C3C((uint64_t)(v1 + 8));
    sub_1DB6E7C3C((uint64_t)(v1 + 2));
    while (1)
    {
      v3 = (_QWORD *)v1[12];
      if (!v3)
        break;
      v1[12] = *v3;
      free(v3);
    }
    free(v1);
    *(_QWORD *)(a1 + 264) = 0;
  }
  return 0;
}

uint64_t sub_1DB73DD80(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t result;

  v2 = (uint64_t *)a1[33];
  v3 = *v2;
  if (!*v2)
  {
    v4 = (_QWORD *)v2[12];
    if (v4)
    {
      v3 = 0;
      do
      {
        if (!*((_DWORD *)v4 + 2))
          v3 += v4[3];
        v5 = (_QWORD *)*v4;
        free(v4);
        v2[12] = (uint64_t)v5;
        v4 = v5;
      }
      while (v5);
    }
    else
    {
      v3 = 0;
    }
  }
  result = sub_1DB732308(a1, v2[1] + v3);
  *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t sub_1DB73DDFC(_DWORD *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  result = sub_1DB6E8FCC(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Linkname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

_QWORD *sub_1DB73DE60(uint64_t a1)
{
  _QWORD *result;

  for (result = *(_QWORD **)(a1 + 96); result; result = *(_QWORD **)(a1 + 96))
  {
    *(_QWORD *)(a1 + 96) = *result;
    free(result);
  }
  *(_QWORD *)(a1 + 104) = 0;
  return result;
}

uint64_t sub_1DB73DE9C(_DWORD *a1, uint64_t *a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  result = sub_1DB6E9040(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

uint64_t sub_1DB73DF00(_DWORD *a1, uint64_t *a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  result = sub_1DB6E9388(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Uname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

uint64_t sub_1DB73DF64(_DWORD *a1, uint64_t *a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  result = sub_1DB6E8EE0(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Gname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

uint64_t sub_1DB73DFC8(_DWORD *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  result = sub_1DB6E922C(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Linkname", v7, v8, v9, v10, v11, v12);
      return 4294967266;
    }
    else
    {
      return 4294967276;
    }
  }
  return result;
}

char *sub_1DB73E02C(char *__dst, char *__src, size_t __n, char *__s)
{
  uint64_t v5;
  size_t v8;
  char *v9;
  char *v10;
  char v11;
  int v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  size_t v23;
  char *v24;
  size_t v25;
  char *v26;
  _BYTE *v27;
  char *v28;
  char *v29;

  v5 = __n;
  if (__s)
  {
    v8 = strlen(__s) + 2;
  }
  else
  {
    if (__n < 0x64)
    {
      strncpy(__dst, __src, __n);
      v9 = &__dst[v5];
      goto LABEL_65;
    }
    v8 = 0;
  }
  v10 = &__src[v5];
  if (v5 < 1)
    goto LABEL_17;
  v11 = 1;
  while (1)
  {
    v12 = *(v10 - 1);
    if (v12 == 47)
    {
      v13 = v5 - 1;
      goto LABEL_13;
    }
    v13 = v5 - 2;
    if ((unint64_t)v5 < 2)
      break;
    if (v12 != 46 || __src[v13] != 47)
      goto LABEL_16;
LABEL_13:
    v11 = 0;
    v10 = &__src[v13];
    v5 = v13;
    if (v13 <= 0)
    {
      v14 = 0;
      v15 = v13 - 1;
      v16 = &__src[v15];
      v17 = 98;
      goto LABEL_26;
    }
  }
  v5 = 1;
LABEL_16:
  if ((v11 & 1) != 0)
  {
LABEL_17:
    v14 = 1;
    v17 = 99;
  }
  else
  {
    v14 = 0;
    v17 = 98;
  }
  v15 = v5 - 1;
  if (v5 < 2)
  {
    v16 = &__src[v15];
LABEL_26:
    v18 = v15;
  }
  else
  {
    v18 = v5 - 1;
    while (__src[v18] != 47)
    {
      v19 = v18-- <= 1;
      if (v19)
      {
        v18 = 0;
        v16 = __src;
        goto LABEL_28;
      }
    }
    v16 = &__src[v18];
  }
LABEL_28:
  v19 = *v16 == 47 && v18 < v15;
  if (v19)
    v20 = v18 + 1;
  else
    v20 = v18;
  v21 = &__src[v20];
  v22 = v17 - v8;
  if (v10 > &__src[v20 + v22])
    v10 = &__src[v20 + v22];
  v23 = v10 - v21;
  if (v20 >= 155)
    v24 = __src + 155;
  else
    v24 = &__src[v20];
  if (v24 > __src)
  {
    while (*v24 != 47)
    {
      if (--v24 <= __src)
      {
        v24 = __src;
        break;
      }
    }
  }
  v25 = v22 - v23;
  if (v24 < v21 && *v24 == 47)
    ++v24;
  v26 = &v24[v25];
  if (v26 > v21)
    v26 = &__src[v20];
  if (v26 >= v24)
    v27 = v26;
  else
    v27 = v24;
  if (v24 < v26)
  {
    do
    {
      if (*v27 == 47)
        break;
      --v27;
    }
    while (v27 > v24);
  }
  if (v27 < v21 && *v27 == 47)
    ++v27;
  v28 = __dst;
  if (v24 > __src)
  {
    strncpy(__dst, __src, v24 - __src);
    v28 = &__dst[v24 - __src];
  }
  if (v27 > v24)
  {
    strncpy(v28, v24, v27 - v24);
    v28 += v27 - v24;
  }
  if (__s)
  {
    strcpy(v28, __s);
    v29 = &v28[strlen(__s)];
    *v29 = 47;
    v28 = v29 + 1;
  }
  strncpy(v28, v21, v23);
  v9 = &v28[v23];
  if ((v14 & 1) == 0)
    *v9++ = 47;
LABEL_65:
  *v9 = 0;
  return __dst;
}

uint64_t *sub_1DB73E2B8(uint64_t *a1, char *a2, uint64_t a3)
{
  unint64_t v5;
  char *v6;
  BOOL v7;
  BOOL v8;
  size_t v9;
  _BYTE v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11[1] = 0;
  if (a3 >= 0)
    v5 = a3;
  else
    v5 = -a3;
  v6 = v11;
  do
  {
    *v6-- = a0123456789[v5 % 0xA];
    v7 = v5 >= 9;
    v8 = v5 == 9;
    v5 /= 0xAuLL;
  }
  while (!v8 && v7);
  if (a3 < 0)
    *v6 = 45;
  else
    ++v6;
  v9 = strlen(v6);
  return sub_1DB73ECAC(a1, a2, v6, v9);
}

uint64_t *sub_1DB73E38C(uint64_t *a1, char *a2, uint64_t a3, unint64_t a4)
{
  char *v6;
  int v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  size_t v14;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = &v16;
  v16 = 0;
  v7 = 11;
  do
  {
    v8 = a4;
    v9 = v7;
    a4 /= 0xAuLL;
    v10 = v8 - 10 * a4;
    --v7;
  }
  while (v9 != 2 && !v10);
  if (v9 != 2)
  {
    if (v7 >= 2)
    {
      do
      {
        *--v6 = a0123456789[v10];
        v10 = a4 % 0xA;
        --v7;
        a4 /= 0xAuLL;
      }
      while (v7 > 1);
    }
    *--v6 = 46;
  }
  if (a3 >= 0)
    v11 = a3;
  else
    v11 = -a3;
  v12 = v6 - 1;
  do
  {
    *v12-- = a0123456789[v11 % 0xA];
    v13 = v11 > 9;
    v11 /= 0xAuLL;
  }
  while (v13);
  if (a3 < 0)
    *v12 = 45;
  else
    ++v12;
  v14 = strlen(v12);
  return sub_1DB73ECAC(a1, a2, v12, v14);
}

uint64_t sub_1DB73E4E0(_DWORD *a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  char *v8;
  char *v9;
  char *v10;
  size_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((archive_entry_acl_types(a2) & 0x3C00) != 0)
  {
    v8 = "SCHILY.acl.ace";
  }
  else if ((a4 & 0x100) != 0)
  {
    v8 = "SCHILY.acl.access";
  }
  else
  {
    if ((a4 & 0x200) == 0)
      return 4294967266;
    v8 = "SCHILY.acl.default";
  }
  v9 = sub_1DB6EA1B4(a2, 0, a4, *(_QWORD *)(a3 + 112));
  if (!v9)
  {
    if (*__error() != 12)
    {
      archive_set_error(a1, 79, "%s %s %s", v13, v14, v15, v16, v17, "Can't translate ");
      return 4294967276;
    }
    archive_set_error(a1, 12, "%s %s", v13, v14, v15, v16, v17, "Can't allocate memory for ");
    return 4294967266;
  }
  v10 = v9;
  if (*v9)
  {
    v11 = strlen(v9);
    sub_1DB73ECAC((uint64_t *)(a3 + 40), v8, v10, v11);
  }
  free(v10);
  return 0;
}

char *sub_1DB73E614(char *a1, char *__s)
{
  uint64_t v4;
  int v5;

  if (!__s || !*__s)
  {
    strcpy(a1, "GNUSparseFile/blank");
    return a1;
  }
  v4 = strlen(__s);
  if (v4 < 1)
    goto LABEL_13;
  while (1)
  {
    v5 = __s[v4 - 1];
    if (v5 != 47)
      break;
LABEL_8:
    if (v4-- <= 1)
    {
      v4 = 0;
      goto LABEL_13;
    }
  }
  if ((unint64_t)v4 >= 2)
  {
    if (v5 != 46 || __s[v4 - 2] != 47)
      goto LABEL_13;
    goto LABEL_8;
  }
  v4 = 1;
LABEL_13:
  sub_1DB73E02C(a1, __s, v4, "GNUSparseFile.0");
  return a1;
}

uint64_t sub_1DB73E6D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 104);
  if (v6)
    v7 = *(_QWORD *)(v6 + 24) + *(_QWORD *)(v6 + 16);
  else
    v7 = 0;
  if (a2 <= v7)
    return sub_1DB73EE18(a1, a2, a3, 0);
  result = sub_1DB73EE18(a1, v7, a2 - v7, 1);
  if (!(_DWORD)result)
    return sub_1DB73EE18(a1, a2, a3, 0);
  return result;
}

uint64_t sub_1DB73E74C(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unsigned __int8 v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  unsigned __int8 v19;
  const char *v20;
  char *v21;
  char v22;
  const char *v23;
  char *v24;
  char v25;
  size_t v26;
  int v27;
  _QWORD *v28;
  _BYTE *v29;
  char *v30;
  size_t v31;
  int v32;
  char *v33;
  char *v34;
  unsigned __int8 *v35;
  unint64_t v36;
  char *v37;
  int v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unsigned __int8 v42;
  _BYTE *v43;
  unsigned int v44;
  uint64_t v45;
  int v46;
  int v47;
  size_t v48;
  char *v49;
  uint64_t *v50;
  uint64_t v51;
  size_t v52;
  char *v53;
  unsigned __int8 *v54;
  char *__s;
  uint64_t v56;
  uint64_t v57;

  v3 = a3;
  result = archive_entry_xattr_reset(a3);
  if (!(_DWORD)result)
    return result;
  v7 = result;
  v8 = (_QWORD *)(a2 + 16);
  v50 = (uint64_t *)(a2 + 40);
  v51 = v3;
  while (1)
  {
    v53 = 0;
    v54 = 0;
    v52 = 0;
    archive_entry_xattr_next(v3, &v54, &v53, &v52);
    v14 = (char *)v54;
    v15 = *v54;
    if (*v54)
    {
      v16 = 0;
      v17 = (char *)(v54 + 1);
      while (1)
      {
        if ((char)v15 < 33 || v15 == 37 || v15 == 127 || v15 == 61)
        {
          if (v16 > 0xFFFFFFFFFFFFFFFBLL)
            goto LABEL_46;
          v18 = 3;
        }
        else
        {
          if (v16 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_46;
          v18 = 1;
        }
        v16 += v18;
        v19 = *v17++;
        v15 = v19;
        if (!v19)
          goto LABEL_16;
      }
    }
    v16 = 0;
LABEL_16:
    v20 = (const char *)malloc_type_malloc(v16 + 1, 0xC67CD412uLL);
    if (!v20)
      goto LABEL_46;
    v21 = (char *)v20;
    v22 = *v14;
    v23 = v20;
    if (*v14)
    {
      v24 = (char *)v20;
      do
      {
        if (v22 < 33 || v22 == 37 || v22 == 127 || v22 == 61)
        {
          *v24 = 37;
          v24[1] = a0123456789abcd_2[(unint64_t)*v14 >> 4];
          v23 = v24 + 3;
          v24[2] = a0123456789abcd_2[*v14 & 0xF];
          v24 += 3;
        }
        else
        {
          *v24++ = v22;
          v23 = v24;
        }
        v25 = *++v14;
        v22 = v25;
      }
      while (v25);
    }
    *v23 = 0;
    v26 = strlen(v20);
    v27 = sub_1DB72D14C((uint64_t)v8, v21, v26, *(_QWORD *)(a2 + 112));
    free(v21);
    if (v27)
      break;
    v28 = v8;
    v29 = (_BYTE *)*v8;
    if (*v8)
    {
      v31 = v52;
      v30 = v53;
      __s = 0;
      v56 = 0;
      v57 = 0;
      v32 = *(_DWORD *)(a2 + 124);
      if ((v32 & 2) != 0)
      {
        v33 = (char *)malloc_type_malloc(((4 * v52) | 2) / 3 + 1, 0x54E2FD0uLL);
        v34 = v33;
        if (v33)
        {
          v35 = (unsigned __int8 *)v30;
          v36 = v31;
          v37 = v33;
          if (v31 >= 3)
          {
            v37 = v33;
            v36 = v31;
            v35 = (unsigned __int8 *)v30;
            do
            {
              v38 = (char)*v35;
              v39 = (char)v35[1];
              v40 = v35[2] & 0x3F;
              v41 = v35[2] | (v39 << 8);
              v35 += 3;
              v36 -= 3;
              *v37 = byte_1DB7548DC[v38 >> 2];
              v37[1] = byte_1DB7548DC[((unint64_t)((v39 << 8) & 0xF000 | (v38 << 16)) >> 12) & 0x3F];
              v37[2] = byte_1DB7548DC[(v41 >> 6) & 0x3F];
              v37[3] = byte_1DB7548DC[v40];
              v37 += 4;
            }
            while (v36 > 2);
          }
          v49 = v30;
          if (v36 == 2)
          {
            v46 = (char)*v35;
            v47 = (char)v35[1];
            *v37 = byte_1DB7548DC[v46 >> 2];
            v43 = v37 + 2;
            v37[1] = byte_1DB7548DC[((unint64_t)((v47 << 8) & 0xF000 | (v46 << 16)) >> 12) & 0x3F];
            v44 = 4 * (v47 & 0xF);
            v45 = 3;
LABEL_38:
            v37 += v45;
            *v43 = byte_1DB7548DC[v44];
          }
          else if (v36 == 1)
          {
            v42 = *v35;
            *v37 = byte_1DB7548DC[*v35 >> 2];
            v43 = v37 + 1;
            v44 = 16 * (v42 & 3);
            v45 = 2;
            goto LABEL_38;
          }
          *v37 = 0;
          __s = 0;
          v56 = 0;
          v57 = 0;
          sub_1DB6E323C((uint64_t *)&__s, "LIBARCHIVE.xattr.", 0x11uLL);
          sub_1DB72CE50((uint64_t *)&__s, v29);
          v48 = strlen(v34);
          sub_1DB73ECAC(v50, __s, v34, v48);
          sub_1DB6E7C3C((uint64_t)&__s);
        }
        free(v34);
        v32 = *(_DWORD *)(a2 + 124);
      }
      if ((v32 & 1) != 0)
      {
        __s = 0;
        v56 = 0;
        v57 = 0;
        sub_1DB6E323C((uint64_t *)&__s, "SCHILY.xattr.", 0xDuLL);
        sub_1DB72CE50((uint64_t *)&__s, v29);
        sub_1DB73ECAC(v50, __s, v30, v31);
        sub_1DB6E7C3C((uint64_t)&__s);
      }
    }
    --v7;
    v8 = v28;
    v3 = v51;
    if (!v7)
      return 0;
  }
  if (v27 == -1)
  {
LABEL_46:
    archive_set_error(a1, 12, "Can't allocate memory", v9, v10, v11, v12, v13, v49);
    return 4294967266;
  }
  archive_set_error(a1, -1, "Error encoding pax extended attribute", v9, v10, v11, v12, v13, v49);
  return 4294967271;
}

uint64_t sub_1DB73EB70(uint64_t a1, char *__s)
{
  int v4;
  int64_t v5;
  size_t v6;
  int v7;
  const char *v9;
  char __sa[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (__s && (v4 = *__s, *__s))
  {
    v5 = strlen(__s);
    v6 = v5;
    if (v5 >= 1)
    {
      while (1)
      {
        v7 = __s[v6 - 1];
        if (v7 != 47)
        {
          if (v6 < 2)
          {
            if (v4 == 46)
            {
              strcpy((char *)a1, "PaxHeader/currentdir");
              return a1;
            }
            v6 = 1;
LABEL_18:
            strcpy(__sa, "PaxHeader");
            sub_1DB73E02C((char *)a1, __s, v6, __sa);
            return a1;
          }
          if (v7 != 46 || __s[v6 - 2] != 47)
            goto LABEL_18;
        }
        if ((uint64_t)v6-- <= 1)
          goto LABEL_14;
      }
    }
    if (v5)
      goto LABEL_18;
LABEL_14:
    *(_DWORD *)(a1 + 15) = 7498084;
    v9 = "/PaxHeader/rootdir";
  }
  else
  {
    v9 = "PaxHeader/blank";
  }
  *(_OWORD *)a1 = *(_OWORD *)v9;
  return a1;
}

uint64_t *sub_1DB73ECAC(uint64_t *a1, char *__s, const void *a3, size_t a4)
{
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  BOOL v13;
  BOOL v14;
  int v15;
  unint64_t v16;
  _BYTE *v17;
  _BYTE v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = strlen(__s);
  v9 = a4 + v8 + 3;
  if (v9 < 1)
  {
    v10 = 0;
    v11 = 1;
  }
  else
  {
    v10 = 0;
    v11 = 1;
    v12 = a4 + v8 + 3;
    do
    {
      ++v10;
      v11 *= 10;
      v13 = v12 >= 9;
      v14 = v12 == 9;
      v12 /= 0xAu;
    }
    while (!v14 && v13);
  }
  v15 = v10 + v9;
  v19[1] = 0;
  if (v15 >= v11)
    ++v15;
  if (v15 >= 0)
    v16 = v15;
  else
    v16 = -v15;
  v17 = v19;
  do
  {
    *v17-- = a0123456789[v16 % 0xA];
    v13 = v16 >= 9;
    v14 = v16 == 9;
    v16 /= 0xAuLL;
  }
  while (!v14 && v13);
  if (v15 < 0)
    *v17 = 45;
  else
    ++v17;
  sub_1DB72CE50(a1, v17);
  sub_1DB72CE60(a1, 32);
  sub_1DB72CE50(a1, __s);
  sub_1DB72CE60(a1, 61);
  sub_1DB72CE00(a1, a3, a4);
  return sub_1DB72CE60(a1, 10);
}

uint64_t sub_1DB73EE18(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _DWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v8 = malloc_type_malloc(0x20uLL, 0x1020040A02120EAuLL);
  if (!v8)
    return 4294967266;
  *(_QWORD *)v8 = 0;
  v8[2] = a4;
  *((_QWORD *)v8 + 2) = a2;
  *((_QWORD *)v8 + 3) = a3;
  v9 = (_QWORD *)(a1 + 96);
  if (*(_QWORD *)(a1 + 96) && (v10 = *(_QWORD **)(a1 + 104)) != 0)
    v9 = (_QWORD *)(a1 + 104);
  else
    v10 = (_QWORD *)(a1 + 104);
  v11 = 0;
  *v10 = v8;
  *v9 = v8;
  return v11;
}

uint64_t sub_1DB73EEAC(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  char *v13;

  v5 = **(_QWORD **)(a1 + 2472);
  if (strcmp(__s1, "hdrcharset"))
    return 4294967276;
  if (a3 && *a3)
  {
    v12 = sub_1DB6E3A78(a1, a3, 0);
    *(_QWORD *)(v5 + 216) = v12;
    if (v12)
      return 0;
    else
      return 4294967266;
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "lha: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, v13);
    return 4294967271;
  }
}

uint64_t sub_1DB73EF44(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int v11;
  int v12;
  BOOL v13;
  uint64_t i;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  char *v24;
  uint64_t v25;
  _BYTE *v26;
  _DWORD *v27;
  int v28;
  size_t v30;
  size_t v31;
  uint64_t v32;
  size_t v33;
  _BYTE *v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  _BOOL4 v40;
  char v41;
  BOOL v42;
  BOOL v44;
  uint64_t *v45;
  __int16 v46;
  uint64_t v47;
  unsigned __int8 *v48;
  unsigned __int8 *v49;
  int v50;
  size_t v51;
  size_t v52;
  int v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 *v60;
  unsigned __int8 *v61;
  int v62;
  size_t v63;
  size_t v64;
  size_t v65;
  size_t v66;
  unsigned __int8 *v67;
  size_t v68;
  int v69;
  unsigned __int16 *v70;
  unint64_t v71;
  char *v72;
  size_t v73;
  uint64_t v74;
  size_t v75;
  size_t v76;
  size_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned __int8 v85;
  uint64_t v86;
  char *v87;
  char v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _DWORD *v107;
  int v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unsigned __int8 v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  char v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __int16 v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  __int16 v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  __int32 *v157;
  uint64_t v158;
  uint64_t v159;
  __int32 *v160;
  uint64_t v161;
  uint64_t v162;
  unsigned __int16 v163;
  _QWORD v164[2];

  if ((byte_1F02F76D8 & 1) == 0)
  {
    v10 = 0;
    byte_1F02F76D8 = 1;
    do
    {
      v11 = -8;
      v12 = v10;
      do
      {
        v12 = (v12 << 31 >> 31) & 0xA001 ^ ((unsigned __int16)v12 >> 1);
        v13 = __CFADD__(v11++, 1);
      }
      while (!v13);
      word_1F02F76DA[v10++] = v12;
    }
    while (v10 != 256);
    for (i = 0; i != 256; ++i)
      word_1F02F76DA[i + 256] = word_1F02F76DA[word_1F02F76DA[i]] ^ HIBYTE(word_1F02F76DA[i]);
  }
  *(_DWORD *)(a1 + 16) = 720896;
  if (!*(_QWORD *)(a1 + 24))
    *(_QWORD *)(a1 + 24) = "lha";
  v160 = 0;
  v161 = 0;
  v162 = 0;
  v158 = 0;
  v159 = 0;
  v156 = 0;
  v157 = 0;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v149 = 0;
  v15 = **(_QWORD **)(a1 + 2472);
  *(_WORD *)(v15 + 299) = 0;
  *(_BYTE *)(v15 + 301) = 0;
  *(_QWORD *)(v15 + 16) = 0;
  v16 = (unsigned __int8 *)sub_1DB6E2588(a1, 0x16uLL, 0, a4, a5, a6, a7, a8);
  if (!v16)
  {
    v25 = 1;
    v26 = (_BYTE *)sub_1DB6E2588(a1, 1uLL, 0, v17, v18, v19, v20, v21);
    if (!v26)
      return v25;
    if (*v26)
      goto LABEL_19;
    return 1;
  }
  v22 = v16;
  if (*(_BYTE *)(v15 + 297))
    goto LABEL_13;
  v23 = *v16;
  if (v23 == 77)
  {
    if (v16[1] == 90)
    {
      v164[0] = 0;
      v30 = 4096;
      while (1)
      {
        while (1)
        {
          v31 = sub_1DB6E2588(a1, v30, v164, v17, v18, v19, v20, v21);
          v33 = v31;
          if (v31)
            break;
          v13 = v30 >= 0x32;
          v30 >>= 1;
          if (!v13)
          {
LABEL_36:
            v24 = "Couldn't find out LHa header";
            goto LABEL_20;
          }
        }
        if (v164[0] < 22)
          goto LABEL_36;
        v34 = (_BYTE *)v31;
        if (v164[0] != 22)
          break;
LABEL_34:
        sub_1DB6E26F0(a1, (uint64_t)&v34[-v33], v32, v17, v18, v19, v20, v21);
      }
      v35 = v31 + v164[0];
      v34 = (_BYTE *)v31;
      while (1)
      {
        v36 = sub_1DB6E5B30(v34);
        if (!v36)
          break;
        v34 += v36;
        if ((unint64_t)(v34 + 22) >= v35)
          goto LABEL_34;
      }
      sub_1DB6E26F0(a1, (uint64_t)&v34[-v33], v32, v17, v18, v19, v20, v21);
      v22 = (unsigned __int8 *)sub_1DB6E2588(a1, 1uLL, 0, v55, v56, v57, v58, v59);
      if (!v22)
      {
LABEL_19:
        v24 = "Truncated LHa header";
LABEL_20:
        v27 = (_DWORD *)a1;
        v28 = 79;
LABEL_21:
        archive_set_error(v27, v28, v24, v17, v18, v19, v20, v21, v148);
        return 4294967266;
      }
    }
LABEL_13:
    v23 = *v22;
  }
  if (!v23)
    return 1;
  if (sub_1DB6E5B30(v22))
  {
    v24 = "Bad LHa file";
    goto LABEL_20;
  }
  *(_BYTE *)(v15 + 297) = 1;
  *(_QWORD *)(v15 + 32) = 0;
  *(_BYTE *)(v15 + 40) = v22[20];
  *(_BYTE *)(v15 + 41) = v22[3];
  *(_BYTE *)(v15 + 42) = v22[4];
  v37 = v22[5];
  *(_BYTE *)(v15 + 43) = v37;
  v38 = *(unsigned __int16 *)(v15 + 41);
  v39 = v38 ^ 0x686C | v37 ^ 0x64;
  v42 = v39 == 0;
  v40 = v39 != 0;
  v41 = v42;
  *(_BYTE *)(v15 + 298) = v41;
  v42 = v38 == 26732 && v37 == 48;
  v44 = !v42 && (*(_WORD *)(v15 + 41) != 31340 || *(_BYTE *)(v15 + 43) != 52);
  *(_QWORD *)(v15 + 48) = 0;
  v45 = (uint64_t *)(v15 + 48);
  *(_BYTE *)(v15 + 302) = v44;
  if (v40)
    v46 = 438;
  else
    v46 = 511;
  *(_QWORD *)(v15 + 56) = 0;
  *(_DWORD *)(v15 + 64) = 0;
  *(_OWORD *)(v15 + 72) = 0u;
  *(_OWORD *)(v15 + 88) = 0u;
  *(_OWORD *)(v15 + 104) = 0u;
  *(_WORD *)(v15 + 120) = v46;
  *(_QWORD *)(v15 + 232) = 0;
  *(_QWORD *)(v15 + 256) = 0;
  *(_BYTE *)(v15 + 296) = 0;
  *(_QWORD *)(v15 + 128) = 0;
  *(_QWORD *)(v15 + 136) = 0;
  v47 = *(_QWORD *)(v15 + 216);
  *(_QWORD *)(v15 + 200) = v47;
  *(_QWORD *)(v15 + 208) = v47;
  switch(v22[20])
  {
    case 0u:
      v48 = (unsigned __int8 *)sub_1DB6E2588(a1, 0x18uLL, 0, v17, v18, v19, v20, v21);
      if (!v48)
        goto LABEL_19;
      v49 = v48;
      *(_QWORD *)(v15 + 32) = *v48 + 2;
      v50 = v48[1];
      *(_QWORD *)(v15 + 48) = *(unsigned int *)(v48 + 7);
      *(_QWORD *)(v15 + 56) = *(unsigned int *)(v48 + 11);
      *(_QWORD *)(v15 + 88) = sub_1DB740DD0(v48 + 15);
      v51 = v49[21];
      v52 = *(_QWORD *)(v15 + 32);
      v53 = v52 - v51 - 24;
      v54 = v53 < 0 || v51 > 0xDD;
      if (v54 && (_DWORD)v52 - (_DWORD)v51 != 22)
      {
        v24 = "Invalid LHa header";
        goto LABEL_20;
      }
      v75 = sub_1DB6E2588(a1, v52, 0, v17, v18, v19, v20, v21);
      if (!v75)
        goto LABEL_19;
      v76 = v75;
      *(_QWORD *)(v15 + 256) = 0;
      v77 = v75 + 22;
      sub_1DB6E323C((uint64_t *)(v15 + 248), (_BYTE *)(v75 + 22), v51);
      if ((v53 & 0x80000000) == 0)
      {
        *(_WORD *)(v15 + 194) = *(_WORD *)(v77 + v51);
        *(_DWORD *)(v15 + 64) |= 8u;
      }
      v84 = *(_QWORD *)(v15 + 32);
      v85 = 0;
      v86 = v84 - 2;
      if (v84 != 2)
      {
        v87 = (char *)(v76 + 2);
        do
        {
          v88 = *v87++;
          v85 += v88;
          --v86;
        }
        while (v86);
      }
      if (v53 >= 1 && *(_BYTE *)(v51 + v76 + 24) == 85 && v53 == 12)
      {
        *(_QWORD *)(v15 + 88) = *(unsigned int *)(v51 + v76 + 26);
        *(_WORD *)(v15 + 120) = *(_WORD *)(v51 + v76 + 30);
        *(_QWORD *)(v15 + 128) = *(unsigned __int16 *)(v51 + v76 + 32);
        *(_QWORD *)(v15 + 136) = *(unsigned __int16 *)(v51 + v76 + 34);
        *(_DWORD *)(v15 + 64) |= 4u;
      }
      sub_1DB6E26F0(a1, v84, v78, v79, v80, v81, v82, v83);
      if (v50 == v85)
      {
        v25 = 0;
        goto LABEL_105;
      }
      v24 = "LHa header sum error";
      v27 = (_DWORD *)a1;
      v28 = -1;
      goto LABEL_21;
    case 1u:
      v60 = (unsigned __int8 *)sub_1DB6E2588(a1, 0x1BuLL, 0, v17, v18, v19, v20, v21);
      if (!v60)
        goto LABEL_101;
      v61 = v60;
      *(_QWORD *)(v15 + 32) = *v60 + 2;
      v62 = v60[1];
      *(_QWORD *)(v15 + 48) = *(unsigned int *)(v60 + 7);
      *(_QWORD *)(v15 + 56) = *(unsigned int *)(v60 + 11);
      *(_QWORD *)(v15 + 88) = sub_1DB740DD0(v60 + 15);
      v63 = v61[21];
      if (v63 > 0xE6)
        goto LABEL_81;
      v64 = *(_QWORD *)(v15 + 32);
      if ((int)v64 - 27 < (int)v63)
        goto LABEL_81;
      v65 = sub_1DB6E2588(a1, v64, 0, v17, v18, v19, v20, v21);
      if (!v65)
        goto LABEL_101;
      v66 = v65;
      if ((_DWORD)v63)
      {
        v67 = (unsigned __int8 *)(v65 + 22);
        v68 = v63;
        while (1)
        {
          v69 = *v67++;
          if (v69 == 255)
            break;
          if (!--v68)
            goto LABEL_119;
        }
LABEL_81:
        v72 = "Invalid LHa header";
        goto LABEL_102;
      }
      v63 = 0;
LABEL_119:
      *(_QWORD *)(v15 + 256) = 0;
      sub_1DB6E323C((uint64_t *)(v15 + 248), (_BYTE *)(v65 + 22), v63);
      *(_WORD *)(v15 + 194) = *(_WORD *)(v66 + 22 + v63);
      *(_DWORD *)(v15 + 64) |= 8u;
      v130 = *(_QWORD *)(v15 + 32);
      v131 = 0;
      v132 = v130 - 2;
      if (v130 != 2)
      {
        v133 = (char *)(v66 + 2);
        v134 = v132;
        do
        {
          v135 = *v133++;
          v131 += v135;
          --v134;
        }
        while (v134);
      }
      v164[0] = 0;
      sub_1DB6E26F0(a1, v132, v124, v125, v126, v127, v128, v129);
      v138 = sub_1DB740E44((_DWORD *)a1, v15, 0, 2, *(_QWORD *)(v15 + 48) + 2, v164, v136, v137);
      v25 = v138;
      if ((int)v138 >= -20)
      {
        v139 = *v45 - v164[0] + 2;
        *v45 = v139;
        if (v139 < 0)
          goto LABEL_81;
        if (v62 == v131)
        {
          v25 = v138 & ((int)v138 >> 31);
        }
        else
        {
          v72 = "LHa header sum error";
          v107 = (_DWORD *)a1;
          v108 = -1;
LABEL_103:
          archive_set_error(v107, v108, v72, v17, v18, v19, v20, v21, v148);
          v25 = 4294967266;
        }
      }
      goto LABEL_104;
    case 2u:
      v70 = (unsigned __int16 *)sub_1DB6E2588(a1, 0x18uLL, 0, v17, v18, v19, v20, v21);
      if (!v70)
        goto LABEL_101;
      v71 = *v70;
      *(_QWORD *)(v15 + 32) = v71;
      *(_QWORD *)(v15 + 48) = *(unsigned int *)((char *)v70 + 7);
      *(_QWORD *)(v15 + 56) = *(unsigned int *)((char *)v70 + 11);
      *(_QWORD *)(v15 + 88) = *(unsigned int *)((char *)v70 + 15);
      *(_WORD *)(v15 + 194) = *(unsigned __int16 *)((char *)v70 + 21);
      *(_DWORD *)(v15 + 64) |= 8u;
      if (v71 < 0x18)
      {
        v72 = "Invalid LHa header size";
LABEL_102:
        v107 = (_DWORD *)a1;
        v108 = 79;
        goto LABEL_103;
      }
      v164[0] = 0;
      v163 = sub_1DB741490(0, (char *)v70, 0x18uLL);
      sub_1DB6E26F0(a1, 24, v90, v91, v92, v93, v94, v95);
      v25 = sub_1DB740E44((_DWORD *)a1, v15, &v163, 2, *(_QWORD *)(v15 + 32) - 24, v164, v96, v97);
      if ((int)v25 < -20)
        goto LABEL_104;
      v98 = *(_DWORD *)(v15 + 32) - LODWORD(v164[0]);
      v99 = (v98 - 24);
      if ((int)v99 >= 1)
      {
        v100 = (char *)sub_1DB6E2588(a1, (v98 - 24), 0, v17, v18, v19, v20, v21);
        if (!v100)
        {
LABEL_101:
          v72 = "Truncated LHa header";
          goto LABEL_102;
        }
        v163 = sub_1DB741490(v163, v100, v99);
        sub_1DB6E26F0(a1, v99, v101, v102, v103, v104, v105, v106);
      }
LABEL_115:
      if (v163 != *(unsigned __int16 *)(v15 + 192))
      {
        v72 = "LHa header CRC error";
        goto LABEL_102;
      }
LABEL_104:
      if ((int)v25 < -20)
        return v25;
LABEL_105:
      if (!*(_BYTE *)(v15 + 298) && !*(_QWORD *)(v15 + 256))
        goto LABEL_19;
      v157 = 0;
      v158 = 0;
      v159 = 0;
      v161 = 0;
      v162 = 0;
      v160 = 0;
      v150 = 0u;
      v151 = 0u;
      v152 = 0u;
      v153 = 0u;
      v154 = 0u;
      v155 = 0u;
      if (sub_1DB6E2F34((uint64_t)&v150, *(char **)(v15 + 224), *(_QWORD *)(v15 + 232), *(_QWORD *)(v15 + 200)))
      {
        v109 = *(_QWORD *)(v15 + 200);
LABEL_109:
        v110 = (char *)sub_1DB72D0D4(v109);
        archive_set_error((_DWORD *)a1, 79, "Pathname cannot be converted from %s to Unicode.", v111, v112, v113, v114, v115, v110);
LABEL_111:
        sub_1DB6DEF44((uint64_t)&v150);
        sub_1DB6E7C3C((uint64_t)&v157);
        sub_1DB6E7C3C((uint64_t)&v160);
        return 4294967266;
      }
      if (sub_1DB6DF324(a1, (uint64_t)&v150, &v149))
        goto LABEL_111;
      v158 = 0;
      sub_1DB6E4290((uint64_t *)&v157, (uint64_t)&v153);
      *((_QWORD *)&v150 + 1) = 0;
      *(_QWORD *)&v152 = 0;
      *(_QWORD *)&v155 = 0;
      *((_QWORD *)&v153 + 1) = 0;
      if (sub_1DB6E2F34((uint64_t)&v150, *(char **)(v15 + 248), *(_QWORD *)(v15 + 256), *(_QWORD *)(v15 + 208)))
      {
        v109 = *(_QWORD *)(v15 + 208);
        goto LABEL_109;
      }
      if (sub_1DB6DF324(a1, (uint64_t)&v150, &v149))
        goto LABEL_111;
      sub_1DB6E4290((uint64_t *)&v157, (uint64_t)&v153);
      sub_1DB6DEF44((uint64_t)&v150);
      v140 = *(_WORD *)(v15 + 120);
      if ((v140 & 0xF000) == 0xA000)
      {
        if (!sub_1DB740C6C((uint64_t *)&v160, (uint64_t)&v157))
        {
          archive_set_error((_DWORD *)a1, 79, "Unknown symlink-name", v141, v142, v143, v144, v145, v148);
          sub_1DB6E7C3C((uint64_t)&v157);
          sub_1DB6E7C3C((uint64_t)&v160);
          return 4294967271;
        }
      }
      else
      {
        if (*(_BYTE *)(v15 + 298))
          v146 = 0x4000;
        else
          v146 = 0x8000;
        *(_WORD *)(v15 + 120) = v146 & 0xF000 | v140 & 0xFFF;
      }
      if ((*(_BYTE *)(v15 + 64) & 4) == 0 && (*(_BYTE *)(v15 + 296) & 1) != 0)
        *(_WORD *)(v15 + 120) &= 0xFF6Du;
      archive_entry_copy_pathname_w((uint64_t)a2, v157);
      sub_1DB6E7C3C((uint64_t)&v157);
      if (v161)
        archive_entry_copy_symlink_w((uint64_t)a2, v160);
      else
        archive_entry_set_symlink((uint64_t)a2, 0);
      sub_1DB6E7C3C((uint64_t)&v160);
      if (!v22[20])
        sub_1DB740CDC(v15, a2);
      archive_entry_set_mode((uint64_t)a2, *(_WORD *)(v15 + 120));
      archive_entry_set_uid((uint64_t)a2, *(_QWORD *)(v15 + 128));
      archive_entry_set_gid((uint64_t)a2, *(_QWORD *)(v15 + 136));
      if (*(_QWORD *)(v15 + 152))
        archive_entry_set_uname((uint64_t)a2, *(char **)(v15 + 144));
      if (*(_QWORD *)(v15 + 176))
        archive_entry_set_gname((uint64_t)a2, *(char **)(v15 + 168));
      if ((*(_BYTE *)(v15 + 64) & 1) != 0)
      {
        archive_entry_set_birthtime((uint64_t)a2, *(_QWORD *)(v15 + 72), *(_QWORD *)(v15 + 80));
        archive_entry_set_ctime((uint64_t)a2, *(_QWORD *)(v15 + 72), *(_QWORD *)(v15 + 80));
      }
      else
      {
        archive_entry_unset_birthtime((uint64_t)a2);
        archive_entry_unset_ctime((uint64_t)a2);
      }
      archive_entry_set_mtime((uint64_t)a2, *(_QWORD *)(v15 + 88), *(_QWORD *)(v15 + 96));
      if ((*(_BYTE *)(v15 + 64) & 2) != 0)
        archive_entry_set_atime((uint64_t)a2, *(_QWORD *)(v15 + 104), *(_QWORD *)(v15 + 112));
      else
        archive_entry_unset_atime((uint64_t)a2);
      if (*(_BYTE *)(v15 + 298) || archive_entry_symlink((uint64_t)a2))
        archive_entry_unset_size((uint64_t)a2);
      else
        archive_entry_set_size((uint64_t)a2, *(_QWORD *)(v15 + 56));
      v147 = *(_QWORD *)(v15 + 48);
      *(_QWORD *)(v15 + 8) = v147;
      if (v147 < 0)
      {
        v24 = "Invalid LHa entry size";
        goto LABEL_20;
      }
      *(_QWORD *)v15 = 0;
      *(_WORD *)(v15 + 24) = 0;
      if (!v147 || *(_BYTE *)(v15 + 298))
        *(_BYTE *)(v15 + 300) = 1;
      __sprintf_chk((char *)(v15 + 303), 0, 0x40uLL, "lha -%c%c%c-", *(char *)(v15 + 41), *(char *)(v15 + 42), *(char *)(v15 + 43));
      *(_QWORD *)(a1 + 24) = v15 + 303;
      break;
    case 3u:
      v73 = sub_1DB6E2588(a1, 0x1CuLL, 0, v17, v18, v19, v20, v21);
      if (!v73)
        goto LABEL_101;
      if (*(_WORD *)v73 != 4)
        goto LABEL_81;
      v74 = *(unsigned int *)(v73 + 24);
      *(_QWORD *)(v15 + 32) = v74;
      *(_QWORD *)(v15 + 48) = *(unsigned int *)(v73 + 7);
      *(_QWORD *)(v15 + 56) = *(unsigned int *)(v73 + 11);
      *(_QWORD *)(v15 + 88) = *(unsigned int *)(v73 + 15);
      *(_WORD *)(v15 + 194) = *(_WORD *)(v73 + 21);
      *(_DWORD *)(v15 + 64) |= 8u;
      if (v74 < 0x20)
        goto LABEL_81;
      v164[0] = 0;
      v163 = sub_1DB741490(0, (char *)v73, 0x1CuLL);
      sub_1DB6E26F0(a1, 28, v116, v117, v118, v119, v120, v121);
      v25 = sub_1DB740E44((_DWORD *)a1, v15, &v163, 4, *(_QWORD *)(v15 + 32) - 28, v164, v122, v123);
      if ((int)v25 >= -20)
        goto LABEL_115;
      goto LABEL_104;
    default:
      v148 = (char *)v22[20];
      v24 = "Unsupported LHa header level %d";
      goto LABEL_20;
  }
  return v25;
}

uint64_t sub_1DB73FA84(uint64_t a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t *v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  signed int v80;
  BOOL v81;
  BOOL v82;
  unsigned __int16 *v83;
  int v84;
  int v85;
  int v86;
  int v87;
  uint64_t v88;
  int v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  int v94;
  int i;
  int v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  int v100;
  int v101;
  int v102;
  unsigned int v103;
  int v104;
  signed int v105;
  signed int v106;
  int v108;
  unsigned __int16 *v109;
  unsigned int v110;
  int v111;
  signed int v112;
  int v114;
  unsigned __int16 *v115;
  int v116;
  uint64_t v117;
  int v118;
  unsigned int v119;
  int v120;
  int v121;
  unsigned __int16 *v123;
  unsigned int v124;
  int v125;
  int v126;
  unsigned __int16 *v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  char *v137;
  BOOL v138;
  unint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  _DWORD *v144;
  int v145;
  int v146;
  uint64_t v147;
  unint64_t v148;
  char *v149;
  __int16 v150;
  char *v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  _OWORD *v162;
  int *v163;
  char **v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  _DWORD *v170;
  _DWORD *v171;
  int *v172;
  int v173;
  uint64_t v174;
  _OWORD v175[2];

  v8 = (_QWORD *)a4;
  v9 = (_QWORD *)a3;
  v11 = a1;
  v12 = *(uint64_t **)(a1 + 2472);
  v13 = *v12;
  v14 = *(_QWORD *)(*v12 + 16);
  if (v14)
  {
    sub_1DB6E26F0(a1, v14, a3, a4, a5, a6, a7, a8);
    *(_QWORD *)(v13 + 16) = 0;
  }
  if (*(_BYTE *)(v13 + 300))
  {
    *v8 = *(_QWORD *)v13;
    *v9 = 0;
    *a2 = 0;
    return sub_1DB741584(v11, v14, a3, a4, a5, a6, a7, a8);
  }
  v16 = **(uint64_t ***)(v11 + 2472);
  if (!*(_BYTE *)(v13 + 302))
  {
    *(_QWORD *)&v175[0] = 0;
    if (!v16[1])
    {
      result = 0;
      *a2 = 0;
      *v9 = 0;
      *v8 = *v16;
      *((_BYTE *)v16 + 300) = 1;
      return result;
    }
    v23 = (char *)sub_1DB6E2588(v11, 1uLL, v175, a4, a5, a6, a7, a8);
    *a2 = v23;
    v24 = *(_QWORD *)&v175[0];
    if (*(uint64_t *)&v175[0] > 0)
    {
      v25 = v16[1];
      if (*(uint64_t *)&v175[0] > v25)
      {
        *(_QWORD *)&v175[0] = v16[1];
        v24 = v25;
      }
      *((_WORD *)v16 + 12) = sub_1DB741490(*((unsigned __int16 *)v16 + 12), v23, v24);
      *v9 = v24;
      *v8 = *v16;
      v26 = v16[1] - v24;
      *v16 += v24;
      v16[1] = v26;
      if (!v26)
        *((_BYTE *)v16 + 300) = 1;
      result = 0;
      v16[2] = v24;
      return result;
    }
    v39 = "Truncated LHa file data";
    goto LABEL_237;
  }
  v174 = 0;
  if (!*((_BYTE *)v16 + 299))
  {
    v27 = (char *)v16[52];
    if (!v27)
    {
      v27 = (char *)malloc_type_calloc(1uLL, 0x158uLL, 0x103004074F3FEA5uLL);
      v16[52] = (uint64_t)v27;
      if (!v27)
        goto LABEL_263;
    }
    *((_DWORD *)v27 + 85) = -25;
    if (*((_BYTE *)v16 + 41) != 108 || *((_BYTE *)v16 + 42) != 104)
      goto LABEL_27;
    v28 = *((char *)v16 + 43);
    switch(v28)
    {
      case '5':
        v31 = 0;
        v29 = 0;
        v30 = 13;
        break;
      case '7':
        v31 = 0;
        v30 = 16;
        v29 = 1;
        break;
      case '6':
        v29 = 0;
        v30 = 15;
        v31 = 1;
        break;
      default:
LABEL_27:
        *a2 = 0;
        *v9 = 0;
        *v8 = 0;
        archive_set_error((_DWORD *)v11, 79, "Unsupported lzh compression method -%c%c%c-", a4, a5, a6, a7, a8, (char *)*((char *)v16 + 41));
        sub_1DB740C00(v11, v32, v33, v34, v35, v36, v37, v38);
        return 4294967276;
    }
    *((_DWORD *)v27 + 85) = -30;
    *(_QWORD *)(v27 + 4) = 0x1FFFF00020000;
    v151 = (char *)*((_QWORD *)v27 + 2);
    if (v151)
    {
      v152 = 0x20000;
    }
    else
    {
      v151 = (char *)malloc_type_malloc(0x20000uLL, 0x2D29F6F8uLL);
      *((_QWORD *)v27 + 2) = v151;
      if (!v151)
        goto LABEL_263;
      v152 = *((int *)v27 + 1);
    }
    memset(&v151[v152 - (1 << v30)], 32, (1 << v30));
    *((_DWORD *)v27 + 6) = 0;
    *(_DWORD *)v27 = 0;
    *((_DWORD *)v27 + 79) = v30 + 1;
    if (v31 | v29)
      v153 = 5;
    else
      v153 = 4;
    *((_DWORD *)v27 + 80) = v153;
    *(_QWORD *)(v27 + 324) = 0x500000013;
    *((_QWORD *)v27 + 5) = 0;
    *((_DWORD *)v27 + 12) = 0;
    if (!sub_1DB7415F8((uint64_t)(v27 + 56), 0x1FEuLL))
    {
      *((_DWORD *)v27 + 16) = 9;
      if (!sub_1DB7415F8((uint64_t)(v27 + 184), 0x13uLL))
      {
        *((_DWORD *)v27 + 85) = 0;
        *((_BYTE *)v16 + 299) = 1;
        *((_DWORD *)v16 + 100) = 0;
        v16[51] = 0;
        goto LABEL_7;
      }
    }
LABEL_263:
    v39 = "Couldn't allocate memory for lzh decompression";
    v144 = (_DWORD *)v11;
    v145 = 12;
    goto LABEL_264;
  }
LABEL_7:
  v16[46] = sub_1DB6E2588(v11, 1uLL, &v174, a4, a5, a6, a7, a8);
  v19 = v174;
  if (v174 <= 0)
  {
    v39 = "Truncated LHa file body";
LABEL_237:
    v144 = (_DWORD *)v11;
    v145 = 79;
LABEL_264:
    archive_set_error(v144, v145, v39, a4, a5, a6, a7, a8, v156);
    return 4294967266;
  }
  v168 = v16[1];
  if (v174 > v168)
  {
    v19 = v16[1];
    v174 = v19;
  }
  *((_DWORD *)v16 + 94) = v19;
  v16[48] = 0;
  *((_DWORD *)v16 + 100) = 0;
  v20 = (int *)v16[52];
  v21 = v20[85];
  if (v21)
  {
    v22 = 0;
    goto LABEL_244;
  }
  v165 = v19;
  v157 = v9;
  v158 = v11;
  v171 = v16 + 46;
  v166 = v16;
  v161 = v8;
  v163 = (int *)v16[52];
  v164 = a2;
  while (1)
  {
    v40 = v16[52];
    if (*v20 <= 8)
      break;
    v162 = (_OWORD *)(v40 + 40);
    v175[0] = *(_OWORD *)(v40 + 40);
    v93 = *(_QWORD *)(v40 + 16);
    v169 = *(_QWORD *)(v40 + 136);
    v159 = *(_QWORD *)(v40 + 264);
    v94 = *(_DWORD *)(v40 + 312);
    i = *(_DWORD *)(v40 + 28);
    v96 = *(_DWORD *)(v40 + 32);
    LODWORD(v97) = *(_DWORD *)(v40 + 24);
    v98 = *(_DWORD *)(v40 + 4);
    v173 = *(_DWORD *)(v40 + 8);
    v99 = *(int *)(v40 + 144);
    v160 = *(int *)(v40 + 272);
    v100 = *(_DWORD *)v40;
    v167 = v99;
LABEL_127:
    while (2)
    {
      switch(v100)
      {
        case 9:
          v97 = (int)v97;
          break;
        case 10:
          v116 = DWORD2(v175[0]);
          goto LABEL_164;
        case 11:
          goto LABEL_193;
        case 12:
          goto LABEL_199;
        default:
          continue;
      }
      break;
    }
    while (1)
    {
      if (!v94)
      {
        *(_DWORD *)v40 = 0;
        *v162 = v175[0];
        *(_DWORD *)(v40 + 312) = 0;
        *(_DWORD *)(v40 + 24) = v97;
        *(_DWORD *)(v40 + 28) = 0;
        v21 = 100;
        goto LABEL_228;
      }
      v101 = DWORD2(v175[0]);
      if (SDWORD2(v175[0]) >= (int)v99)
        goto LABEL_145;
      v102 = sub_1DB7416B0(v171, (unint64_t *)v175);
      v101 = DWORD2(v175[0]);
      if (v102)
      {
        v99 = v167;
LABEL_145:
        v110 = (*(_QWORD *)&v175[0] >> (v101 - v99)) & *(unsigned __int16 *)&algn_1DB75496C[2 * v99 + 2];
        v111 = *(_DWORD *)(v40 + 148);
        v105 = *(unsigned __int16 *)(*(_QWORD *)(v40 + 168) + 2 * (v110 >> v111));
        v112 = *(_DWORD *)(v40 + 60);
        if (v112 <= v105 && v112 != 0)
        {
          while (1)
          {
            v82 = __OFSUB__(v111, 1);
            if (--v111 < 0 != v82)
              break;
            v114 = v105 - v112;
            if (v114 >= *(_DWORD *)(v40 + 156))
              break;
            v115 = (unsigned __int16 *)(*(_QWORD *)(v40 + 176) + 4 * v114);
            if (((v110 >> v111) & 1) == 0)
              ++v115;
            v105 = *v115;
            if (v112 > v105)
              goto LABEL_156;
          }
          v105 = 0;
        }
LABEL_156:
        v116 = v101 - *(unsigned __int8 *)(v169 + v105);
        DWORD2(v175[0]) = v116;
        goto LABEL_159;
      }
      v99 = v167;
      if ((int)v167 <= SDWORD2(v175[0]))
        goto LABEL_145;
      if (v165 != v168)
      {
        v143 = 9;
        goto LABEL_227;
      }
      v103 = (*(_QWORD *)&v175[0] << (v167 - BYTE8(v175[0]))) & *(unsigned __int16 *)&algn_1DB75496C[2 * v167 + 2];
      v104 = *(_DWORD *)(v40 + 148);
      v105 = *(unsigned __int16 *)(*(_QWORD *)(v40 + 168) + 2 * (v103 >> v104));
      v106 = *(_DWORD *)(v40 + 60);
      if (v106 <= v105 && v106 != 0)
      {
        while (1)
        {
          v82 = __OFSUB__(v104, 1);
          if (--v104 < 0 != v82)
            break;
          v108 = v105 - v106;
          if (v108 >= *(_DWORD *)(v40 + 156))
            break;
          v109 = (unsigned __int16 *)(*(_QWORD *)(v40 + 176) + 4 * v108);
          if (((v103 >> v104) & 1) == 0)
            ++v109;
          v105 = *v109;
          if (v106 > v105)
            goto LABEL_158;
        }
        v105 = 0;
      }
LABEL_158:
      v116 = DWORD2(v175[0]) - *(unsigned __int8 *)(v169 + v105);
      DWORD2(v175[0]) = v116;
      if (v116 < 0)
        goto LABEL_233;
LABEL_159:
      --v94;
      if (v105 > 0xFF)
        break;
      *(_BYTE *)(v93 + v97++) = v105;
      if (v97 >= v98)
      {
        LODWORD(v97) = 0;
        v142 = v16[51];
        v16[49] = *(_QWORD *)(v16[52] + 16);
        *((_DWORD *)v16 + 100) = v98;
        v16[51] = v142 + v98;
        v143 = 9;
LABEL_227:
        v21 = 0;
        *v162 = v175[0];
        *(_DWORD *)(v40 + 312) = v94;
        *(_DWORD *)v40 = v143;
        *(_DWORD *)(v40 + 24) = v97;
        goto LABEL_228;
      }
    }
    v96 = v105 - 253;
LABEL_164:
    v117 = v160;
    if (v116 >= (int)v160)
      goto LABEL_179;
    v118 = sub_1DB7416B0(v171, (unint64_t *)v175);
    v116 = DWORD2(v175[0]);
    if (v118)
    {
      v117 = v160;
LABEL_179:
      v124 = (*(_QWORD *)&v175[0] >> (v116 - v117)) & *(unsigned __int16 *)&algn_1DB75496C[2 * v117 + 2];
      v125 = *(_DWORD *)(v40 + 276);
      i = *(unsigned __int16 *)(*(_QWORD *)(v40 + 296) + 2 * (v124 >> v125));
      v126 = *(_DWORD *)(v40 + 188);
      if (v126 <= i && v126 != 0)
      {
        while (1)
        {
          v82 = __OFSUB__(v125, 1);
          if (--v125 < 0 != v82 || i - v126 >= *(_DWORD *)(v40 + 284))
            break;
          v128 = (unsigned __int16 *)(*(_QWORD *)(v40 + 304) + 4 * (i - v126));
          if (((v124 >> v125) & 1) == 0)
            ++v128;
          i = *v128;
          if (v126 > i)
            goto LABEL_190;
        }
        i = 0;
      }
LABEL_190:
      DWORD2(v175[0]) = v116 - *(unsigned __int8 *)(v159 + i);
      goto LABEL_193;
    }
    v117 = v160;
    if ((int)v160 <= SDWORD2(v175[0]))
      goto LABEL_179;
    if (v165 != v168)
    {
      *(_DWORD *)(v40 + 32) = v96;
      v143 = 10;
      goto LABEL_227;
    }
    v119 = (*(_QWORD *)&v175[0] << (v160 - BYTE8(v175[0]))) & *(unsigned __int16 *)&algn_1DB75496C[2 * v160 + 2];
    v120 = *(_DWORD *)(v40 + 276);
    i = *(unsigned __int16 *)(*(_QWORD *)(v40 + 296) + 2 * (v119 >> v120));
    v121 = *(_DWORD *)(v40 + 188);
    if (v121 <= i && v121 != 0)
    {
      while (1)
      {
        v82 = __OFSUB__(v120, 1);
        if (--v120 < 0 != v82 || i - v121 >= *(_DWORD *)(v40 + 284))
          break;
        v123 = (unsigned __int16 *)(*(_QWORD *)(v40 + 304) + 4 * (i - v121));
        if (((v119 >> v120) & 1) == 0)
          ++v123;
        i = *v123;
        if (v121 > i)
          goto LABEL_192;
      }
      i = 0;
    }
LABEL_192:
    DWORD2(v175[0]) -= *(unsigned __int8 *)(v159 + i);
    if ((SDWORD2(v175[0]) & 0x80000000) == 0)
    {
LABEL_193:
      if (i < 2)
        goto LABEL_198;
      v129 = i - 1;
      v130 = DWORD2(v175[0]);
      if (SDWORD2(v175[0]) >= i - 1
        || (v131 = sub_1DB7416B0(v171, (unint64_t *)v175), v130 = DWORD2(v175[0]), v131)
        || SDWORD2(v175[0]) >= v129)
      {
        v132 = v130 - v129;
        i = ((*(_QWORD *)&v175[0] >> v132) & *(unsigned __int16 *)&algn_1DB75496C[2 * v129 + 2]) + (1 << v129);
        DWORD2(v175[0]) = v132;
LABEL_198:
        for (i = (v97 + ~i) & v173; ; i = v136 & v173)
        {
LABEL_199:
          v133 = i <= (int)v97 ? v97 : i;
          v134 = v98 - v133;
          v135 = v96 >= v98 - v133 ? v98 - v133 : v96;
          v136 = v135 + i;
          v137 = (char *)(v93 + (int)v97);
          v138 = v135 + i < (int)v97;
          LODWORD(v97) = v135 + v97;
          v17 = v93 + i;
          v138 = v138 || (int)v97 < i;
          if (v138)
          {
            memcpy(v137, (const void *)v17, v135);
          }
          else
          {
            if (v135 < 2)
            {
              v139 = 0;
            }
            else
            {
              v139 = 0;
              do
              {
                v140 = &v137[v139];
                *v140 = *(_BYTE *)(v93 + i + v139);
                v140[1] = *(_BYTE *)(v93 + 1 + i + v139);
                v139 += 2;
              }
              while (v139 < (v135 - 1));
              v139 = v139;
            }
            if ((int)v139 < v135)
              v137[v139] = *(_BYTE *)(v17 + v139);
          }
          if ((_DWORD)v97 == v98)
            break;
          if (v96 <= v134)
          {
            v100 = 9;
            v16 = v166;
            v99 = v167;
            v8 = v161;
            goto LABEL_127;
          }
          v96 -= v135;
        }
        v141 = v166[51];
        v166[49] = *(_QWORD *)(v166[52] + 16);
        *((_DWORD *)v166 + 100) = v98;
        v166[51] = v141 + v98;
        LODWORD(v97) = 0;
        if (v96 <= v134)
        {
          v143 = 9;
        }
        else
        {
          *(_DWORD *)(v40 + 28) = v136 & v173;
          *(_DWORD *)(v40 + 32) = v96 - v135;
          v143 = 12;
        }
        v16 = v166;
        v8 = v161;
        goto LABEL_227;
      }
      if (v165 != v168)
      {
        *(_DWORD *)(v40 + 28) = i;
        *(_DWORD *)(v40 + 32) = v96;
        v143 = 11;
        goto LABEL_227;
      }
    }
LABEL_233:
    v21 = -25;
    *(_DWORD *)(v40 + 340) = -25;
LABEL_228:
    v20 = v163;
    a2 = v164;
    if (v21 != 100)
      goto LABEL_243;
  }
  v41 = (_QWORD *)(v40 + 40);
  v172 = (int *)(v40 + 184);
  v42 = *(_DWORD *)v40;
  v170 = (_DWORD *)(v40 + 56);
  while (2)
  {
    switch(v42)
    {
      case 0:
        v43 = *(_DWORD *)(v40 + 48);
        if (v43 > 15)
          goto LABEL_37;
        if (!sub_1DB7416B0(v171, (unint64_t *)(v40 + 40)))
        {
          if (v165 != v168)
          {
            v21 = 0;
            goto LABEL_242;
          }
          if (*(int *)(v40 + 48) <= 7)
          {
            v154 = *(unsigned int *)(v40 + 24);
            if ((int)v154 < 1)
            {
              v21 = 1;
            }
            else
            {
              v21 = 0;
              v155 = v16[51];
              v16[49] = *(_QWORD *)(v16[52] + 16);
              *((_DWORD *)v16 + 100) = v154;
              v16[51] = v155 + v154;
              *(_DWORD *)(v40 + 24) = 0;
            }
            goto LABEL_242;
          }
LABEL_239:
          v21 = -25;
          *(_DWORD *)(v40 + 340) = -25;
          goto LABEL_242;
        }
        v43 = *(_DWORD *)(v40 + 48);
LABEL_37:
        v44 = v43 - 16;
        v81 = (unsigned __int16)(*(_QWORD *)(v40 + 40) >> v44) == 0;
        *(_DWORD *)(v40 + 312) = (unsigned __int16)(*(_QWORD *)(v40 + 40) >> v44);
        if (v81)
          goto LABEL_239;
        *(_DWORD *)(v40 + 48) = v44;
        *(_DWORD *)(v40 + 184) = *(_DWORD *)(v40 + 324);
        v45 = *(_DWORD *)(v40 + 328);
        *(_DWORD *)(v40 + 192) = v45;
        *(_DWORD *)(v40 + 332) = 0;
LABEL_40:
        if (v44 < v45)
        {
          v46 = sub_1DB7416B0(v171, (unint64_t *)(v40 + 40));
          v44 = *(_DWORD *)(v40 + 48);
          v45 = *(_DWORD *)(v40 + 192);
          if (!v46 && v44 < v45)
          {
            if (v165 != v168)
            {
              v21 = 0;
              v146 = 1;
              goto LABEL_241;
            }
            goto LABEL_239;
          }
        }
        v47 = v44 - v45;
        v48 = (*(_QWORD *)(v40 + 40) >> (v44 - v45)) & *(unsigned __int16 *)&algn_1DB75496C[2 * v45 + 2];
        *(_DWORD *)(v40 + 188) = v48;
        *(_DWORD *)(v40 + 48) = v47;
        if (!v48)
        {
LABEL_49:
          v50 = *(_DWORD *)(v40 + 48);
          v51 = *(_DWORD *)(v40 + 192);
          if (v50 < v51)
          {
            v52 = sub_1DB7416B0(v171, (unint64_t *)(v40 + 40));
            v50 = *(_DWORD *)(v40 + 48);
            v51 = *(_DWORD *)(v40 + 192);
            if (!v52 && v50 < v51)
            {
              if (v165 != v168)
              {
                v21 = 0;
                v146 = 2;
                goto LABEL_241;
              }
              goto LABEL_239;
            }
          }
          v53 = (*v41 >> (v50 - v51)) & *(unsigned __int16 *)&algn_1DB75496C[2 * v51 + 2];
          if (*v172 <= (int)v53)
            goto LABEL_239;
          **(_WORD **)(v40 + 296) = v53;
          *(_QWORD *)(v40 + 272) = 0;
          *(_BYTE *)(*(_QWORD *)(v40 + 264) + v53) = 0;
          *(_DWORD *)(v40 + 48) -= *(_DWORD *)(v40 + 192);
          if (*(_DWORD *)(v40 + 332))
            v42 = 9;
          else
            v42 = 5;
LABEL_118:
          *(_DWORD *)v40 = v42;
          continue;
        }
LABEL_44:
        v49 = *v172;
        if (v48 > *v172)
          goto LABEL_239;
        *(_DWORD *)(v40 + 336) = 0;
        *(_OWORD *)(v40 + 196) = 0u;
        *(_OWORD *)(v40 + 212) = 0u;
        *(_OWORD *)(v40 + 228) = 0u;
        *(_OWORD *)(v40 + 244) = 0u;
        *(_DWORD *)(v40 + 260) = 0;
        if (v48 < 3 || v49 == *(_DWORD *)(v40 + 316))
        {
          v42 = 4;
          goto LABEL_118;
        }
        v54 = 0;
LABEL_61:
        v58 = sub_1DB741814((uint64_t)v171, v54, 3);
        *(_DWORD *)(v40 + 336) = v58;
        if (v58 <= 2)
        {
          if (v165 == v168 || v58 < 0)
            goto LABEL_239;
          goto LABEL_277;
        }
        v59 = *(_DWORD *)(v40 + 48);
        if (v59 < 2)
        {
          v60 = sub_1DB7416B0(v171, (unint64_t *)(v40 + 40));
          v59 = *(_DWORD *)(v40 + 48);
          if (!v60 && v59 <= 1)
          {
            if (v165 == v168)
              goto LABEL_239;
LABEL_277:
            v21 = 0;
            v146 = 3;
            goto LABEL_241;
          }
        }
        v61 = v59 - 2;
        v62 = *(_QWORD *)(v40 + 40) >> v61;
        *(_DWORD *)(v40 + 48) = v61;
        if ((v62 & 3) > *(_DWORD *)(v40 + 188) - 3)
          goto LABEL_239;
        if ((v62 & 3) != 0)
        {
          v63 = 0;
          v55 = (v62 & 3) + 3;
          v64 = v62 & 3;
          do
            *(_BYTE *)(*(_QWORD *)(v40 + 264) + v63++ + 3) = 0;
          while (v64 != v63);
        }
        else
        {
          v55 = 3;
        }
        *(_DWORD *)(v40 + 336) = v55;
LABEL_72:
        v65 = sub_1DB741814((uint64_t)v171, v55, *(unsigned int *)(v40 + 188));
        *(_DWORD *)(v40 + 336) = v65;
        if (v65 < *(_DWORD *)(v40 + 188))
        {
          if (v165 != v168 && (v65 & 0x80000000) == 0)
          {
            v21 = 0;
            v146 = 4;
            goto LABEL_241;
          }
          goto LABEL_239;
        }
        if (!sub_1DB741928((uint64_t)v172))
          goto LABEL_239;
        if (*(_DWORD *)(v40 + 332))
        {
          v42 = 9;
          goto LABEL_118;
        }
LABEL_76:
        v66 = *(_DWORD *)(v40 + 48);
        v67 = *(_DWORD *)(v40 + 64);
        if (v66 < v67)
        {
          v68 = sub_1DB7416B0(v171, (unint64_t *)(v40 + 40));
          v66 = *(_DWORD *)(v40 + 48);
          v67 = *(_DWORD *)(v40 + 64);
          if (!v68 && v66 < v67)
          {
            if (v165 != v168)
            {
              v21 = 0;
              v146 = 5;
              goto LABEL_241;
            }
            goto LABEL_239;
          }
        }
        v69 = v66 - v67;
        v56 = (*(_QWORD *)(v40 + 40) >> v69) & *(unsigned __int16 *)&algn_1DB75496C[2 * v67 + 2];
        *(_DWORD *)(v40 + 60) = v56;
        *(_DWORD *)(v40 + 48) = v69;
LABEL_80:
        if (!v56)
        {
          v70 = *(_DWORD *)(v40 + 48);
          v71 = *(_DWORD *)(v40 + 64);
          if (v70 < v71)
          {
            v72 = sub_1DB7416B0(v171, (unint64_t *)(v40 + 40));
            v70 = *(_DWORD *)(v40 + 48);
            v71 = *(_DWORD *)(v40 + 64);
            if (!v72 && v70 < v71)
            {
              if (v165 != v168)
              {
                v21 = 0;
                v146 = 6;
                goto LABEL_241;
              }
              goto LABEL_239;
            }
          }
          v73 = (*v41 >> (v70 - v71)) & *(unsigned __int16 *)&algn_1DB75496C[2 * v71 + 2];
          if (*v170 <= (int)v73)
            goto LABEL_239;
          **(_WORD **)(v40 + 168) = v73;
          *(_QWORD *)(v40 + 144) = 0;
          *(_BYTE *)(*(_QWORD *)(v40 + 136) + v73) = 0;
          *(_DWORD *)(v40 + 48) -= *(_DWORD *)(v40 + 64);
          v42 = 8;
          goto LABEL_118;
        }
        if (v56 > *v170)
          goto LABEL_239;
        v57 = 0;
        *(_DWORD *)(v40 + 336) = 0;
        *(_OWORD *)(v40 + 68) = 0u;
        *(_OWORD *)(v40 + 84) = 0u;
        *(_OWORD *)(v40 + 100) = 0u;
        *(_OWORD *)(v40 + 116) = 0u;
        *(_DWORD *)(v40 + 132) = 0;
        while (1)
        {
          if (v57 >= v56)
          {
            if (v57 > v56 || !sub_1DB741928((uint64_t)v170))
              goto LABEL_239;
LABEL_117:
            *(_DWORD *)(v40 + 184) = *(_DWORD *)(v40 + 316);
            *(_DWORD *)(v40 + 192) = *(_DWORD *)(v40 + 320);
            v42 = 1;
            *(_DWORD *)(v40 + 332) = 1;
            goto LABEL_118;
          }
          v74 = *(_DWORD *)(v40 + 48);
          v75 = *(_DWORD *)(v40 + 272);
          if (v74 < v75)
          {
            v76 = sub_1DB7416B0(v171, (unint64_t *)(v40 + 40));
            v74 = *(_DWORD *)(v40 + 48);
            v75 = *(_DWORD *)(v40 + 272);
            if (!v76 && v74 < v75)
              break;
          }
          v77 = (*(_QWORD *)(v40 + 40) >> (v74 - v75)) & *(unsigned __int16 *)&algn_1DB75496C[2 * v75 + 2];
          v78 = *(_DWORD *)(v40 + 276);
          v79 = *(unsigned __int16 *)(*(_QWORD *)(v40 + 296) + 2 * (v77 >> v78));
          v80 = *(_DWORD *)(v40 + 188);
          v81 = v80 > (int)v79 || v80 == 0;
          if (!v81)
          {
            while (1)
            {
              v82 = __OFSUB__(v78, 1);
              if (--v78 < 0 != v82 || (signed int)(v79 - v80) >= *(_DWORD *)(v40 + 284))
                break;
              v83 = (unsigned __int16 *)(*(_QWORD *)(v40 + 304) + 4 * (int)(v79 - v80));
              if (((v77 >> v78) & 1) == 0)
                ++v83;
              v79 = *v83;
              if (v80 > (int)v79)
                goto LABEL_101;
            }
LABEL_113:
            *(_DWORD *)(v40 + 48) = v74 - **(unsigned __int8 **)(v40 + 264);
            *(_BYTE *)(*(_QWORD *)(v40 + 136) + v57) = 0;
LABEL_114:
            ++v57;
            goto LABEL_125;
          }
LABEL_101:
          if (v79 >= 3)
          {
            *(_DWORD *)(v40 + 48) = v74 - *(unsigned __int8 *)(*(_QWORD *)(v40 + 264) + v79);
            ++*(_DWORD *)(v40 + 4 * (v79 - 2) + 68);
            *(_BYTE *)(*(_QWORD *)(v40 + 136) + v57) = v79 - 2;
            goto LABEL_114;
          }
          if (!v79)
            goto LABEL_113;
          if (v79 == 1)
            v84 = -4;
          else
            v84 = -9;
          if (v79 == 1)
            v85 = 4;
          else
            v85 = 9;
          v86 = *(unsigned __int8 *)(*(_QWORD *)(v40 + 264) + v79);
          if (v74 < v85 + v86)
          {
            v87 = sub_1DB7416B0(v171, (unint64_t *)(v40 + 40));
            v88 = *(_QWORD *)(v40 + 264);
            if (v87)
            {
              v86 = *(unsigned __int8 *)(v88 + v79);
              v74 = *(_DWORD *)(v40 + 48);
            }
            else
            {
              v74 = *(_DWORD *)(v40 + 48);
              v86 = *(unsigned __int8 *)(v88 + v79);
              if (v74 < v85 + v86)
                break;
            }
          }
          v89 = v84 - v86 + v74;
          v90 = (*(_QWORD *)(v40 + 40) >> v89) & *(unsigned __int16 *)&algn_1DB75496C[2 * v85 + 2];
          *(_DWORD *)(v40 + 48) = v89;
          if (v79 == 1)
            v91 = 3;
          else
            v91 = 20;
          v17 = (v90 + v91);
          v92 = v17 + v57;
          if ((int)v17 + v57 > *(_DWORD *)(v40 + 60))
            goto LABEL_239;
          bzero((void *)(*(_QWORD *)(v40 + 136) + v57), v17);
          v57 = v92;
LABEL_125:
          v56 = *(_DWORD *)(v40 + 60);
        }
        if (v165 == v168)
          goto LABEL_239;
        v21 = 0;
        *(_DWORD *)(v40 + 336) = v57;
        v146 = 7;
LABEL_241:
        *(_DWORD *)v40 = v146;
LABEL_242:
        a2 = v164;
LABEL_243:
        v22 = v16[48] - *((int *)v16 + 94) + (int)v165;
        v16[48] = v22;
        v9 = v157;
        v11 = v158;
        if (v21)
        {
LABEL_244:
          if (v21 == 1)
          {
            *((_BYTE *)v16 + 300) = 1;
            goto LABEL_246;
          }
          archive_set_error((_DWORD *)v11, -1, "Bad lzh data", a4, a5, a6, a7, a8, v156);
          return 4294967271;
        }
        else
        {
LABEL_246:
          v147 = *v16;
          v16[1] -= v22;
          v16[2] = v22;
          v148 = *((int *)v16 + 100);
          *v8 = v147;
          if ((_DWORD)v148)
          {
            *v9 = v148;
            v149 = (char *)v16[49];
            *a2 = v149;
            v150 = sub_1DB741490(*((unsigned __int16 *)v16 + 12), v149, v148);
            result = 0;
            *((_WORD *)v16 + 12) = v150;
            *v16 += v148;
          }
          else
          {
            *v9 = 0;
            *a2 = 0;
            if (*((_BYTE *)v16 + 300))
              return sub_1DB741584(v11, v17, v18, a4, a5, a6, a7, a8);
            else
              return 0;
          }
        }
        return result;
      case 1:
        v44 = *(_DWORD *)(v40 + 48);
        v45 = *(_DWORD *)(v40 + 192);
        goto LABEL_40;
      case 2:
        v48 = *(_DWORD *)(v40 + 188);
        if (!v48)
          goto LABEL_49;
        goto LABEL_44;
      case 3:
        v54 = *(unsigned int *)(v40 + 336);
        goto LABEL_61;
      case 4:
        v55 = *(unsigned int *)(v40 + 336);
        goto LABEL_72;
      case 5:
        goto LABEL_76;
      case 6:
        v56 = *(_DWORD *)(v40 + 60);
        goto LABEL_80;
      case 7:
        v57 = *(_DWORD *)(v40 + 336);
        goto LABEL_125;
      case 8:
        goto LABEL_117;
      case 9:
        v21 = 100;
        goto LABEL_228;
      default:
        continue;
    }
  }
}

uint64_t sub_1DB740C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v9 = *(uint64_t **)(a1 + 2472);
  v10 = *v9;
  v11 = *(_QWORD *)(*v9 + 16);
  if (v11)
  {
    sub_1DB6E26F0(a1, v11, a3, a4, a5, a6, a7, a8);
    *(_QWORD *)(v10 + 16) = 0;
  }
  if (*(_BYTE *)(v10 + 301))
    return 0;
  if (sub_1DB6E26F0(a1, *(_QWORD *)(v10 + 8), a3, a4, a5, a6, a7, a8) < 0)
    return 4294967266;
  result = 0;
  *(_WORD *)(v10 + 300) = 257;
  return result;
}

__int32 *sub_1DB740C6C(uint64_t *a1, uint64_t a2)
{
  __int32 *result;
  _DWORD *v5;
  const __int32 *v6;
  size_t v7;

  result = wcschr(*(__int32 **)a2, 124);
  if (result)
  {
    v5 = result;
    v6 = result + 1;
    v7 = wcslen(result + 1);
    a1[1] = 0;
    sub_1DB72CE04(a1, v6, v7);
    *v5 = 0;
    *(_QWORD *)(a2 + 8) = wcslen(*(const __int32 **)a2);
    return (__int32 *)1;
  }
  return result;
}

const __int32 *sub_1DB740CDC(uint64_t a1, uint64_t *a2)
{
  const __int32 *v4;
  const __int32 *v5;
  size_t v6;
  __int32 *v7;
  uint64_t v8;
  _DWORD *v9;
  const __int32 *result;
  const __int32 *v11;
  size_t v12;
  __int32 *v13;
  uint64_t v14;
  _DWORD *v15;

  v4 = (const __int32 *)archive_entry_pathname_w(a2);
  if (v4)
  {
    v5 = v4;
    *(_QWORD *)(a1 + 280) = 0;
    v6 = wcslen(v4);
    sub_1DB72CE04((uint64_t *)(a1 + 272), v5, v6);
    v7 = *(__int32 **)(a1 + 272);
    v8 = *(_QWORD *)(a1 + 280);
    if (v8)
    {
      v9 = *(_DWORD **)(a1 + 272);
      do
      {
        if (*v9 == 92)
          *v9 = 47;
        ++v9;
        --v8;
      }
      while (v8);
    }
    archive_entry_copy_pathname_w((uint64_t)a2, v7);
  }
  result = (const __int32 *)archive_entry_symlink_w((uint64_t)a2);
  if (result)
  {
    v11 = result;
    *(_QWORD *)(a1 + 280) = 0;
    v12 = wcslen(result);
    sub_1DB72CE04((uint64_t *)(a1 + 272), v11, v12);
    v13 = *(__int32 **)(a1 + 272);
    v14 = *(_QWORD *)(a1 + 280);
    if (v14)
    {
      v15 = *(_DWORD **)(a1 + 272);
      do
      {
        if (*v15 == 92)
          *v15 = 47;
        ++v15;
        --v14;
      }
      while (v14);
    }
    return (const __int32 *)archive_entry_copy_symlink_w((uint64_t)a2, v13);
  }
  return result;
}

time_t sub_1DB740DD0(unsigned __int8 *a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  int v4;
  tm v6;

  v1 = a1[1];
  v2 = *a1;
  v3 = a1[3];
  v4 = a1[2];
  memset(&v6.tm_wday, 0, 32);
  v6.tm_mon = (((v4 | (v3 << 8)) >> 5) & 0xF) - 1;
  v6.tm_year = (v3 >> 1) + 80;
  v6.tm_hour = v1 >> 3;
  v6.tm_mday = v4 & 0x1F;
  v6.tm_sec = 2 * (v2 & 0x1F);
  v6.tm_min = ((v2 | (v1 << 8)) >> 5) & 0x3F;
  v6.tm_isdst = -1;
  return mktime(&v6);
}

uint64_t sub_1DB740E44(_DWORD *a1, uint64_t a2, _WORD *a3, uint64_t a4, unint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  unint64_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  size_t v22;
  BOOL v23;
  char *v24;
  char *v25;
  int v26;
  size_t v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  int v41;
  uint64_t *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  int v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v68;
  uint64_t *v69;
  int v71;
  void *v72[3];

  v71 = a4;
  v12 = a4;
  *a6 = a4;
  v13 = sub_1DB6E2588((uint64_t)a1, a4, 0, a4, a5, (uint64_t)a6, a7, a8);
  if (v13)
  {
    v20 = (char *)v13;
    v21 = (v71 + 1);
    v69 = (uint64_t *)(a2 + 224);
    do
    {
      if (v71 == 2)
      {
        v22 = *(unsigned __int16 *)v20;
        if (!*(_WORD *)v20)
          goto LABEL_102;
      }
      else
      {
        v22 = *(unsigned int *)v20;
        if (!*(_DWORD *)v20)
        {
LABEL_102:
          if (a3)
            *a3 = sub_1DB741490((unsigned __int16)*a3, v20, v12);
          sub_1DB6E26F0((uint64_t)a1, v12, v14, v15, v16, v17, v18, v19);
          return 0;
        }
      }
      v23 = v22 <= v12 || *a6 + v22 > a5;
      if (v23)
        goto LABEL_99;
      v24 = (char *)sub_1DB6E2588((uint64_t)a1, v22, 0, v15, v16, v17, v18, v19);
      if (!v24)
        break;
      v25 = v24;
      *a6 += v22;
      v26 = v24[v12];
      if (a3 && v24[v12])
        *a3 = sub_1DB741490((unsigned __int16)*a3, v24, v22);
      v27 = v22 - v21;
      v28 = &v25[v21];
      if (v26 <= 63)
      {
        if (v26)
        {
          if (v26 == 1)
          {
            if (v22 == v21)
            {
LABEL_77:
              *(_QWORD *)(a2 + 256) = 0;
            }
            else
            {
              if (!*v28)
                goto LABEL_99;
              *(_QWORD *)(a2 + 256) = 0;
              v42 = (uint64_t *)(a2 + 248);
LABEL_83:
              sub_1DB6E323C(v42, &v25[v21], v27);
            }
          }
          else if (v26 == 2)
          {
            if (v22 == v21 || !*v28)
              goto LABEL_99;
            *(_QWORD *)(a2 + 232) = 0;
            sub_1DB6E323C(v69, &v25[v21], v27);
            v29 = *(_QWORD *)(a2 + 232);
            if (v29)
            {
              v30 = 0;
              v31 = 1;
              v32 = (_QWORD *)(a2 + 224);
              do
              {
                if (*(unsigned __int8 *)(*v69 + v30) == 255)
                {
                  *(_BYTE *)(*v69 + v30) = 47;
                  v29 = *(_QWORD *)(a2 + 232);
                }
                v30 = v31;
                v23 = v29 > v31++;
              }
              while (v23);
            }
            else
            {
              v32 = (_QWORD *)(a2 + 224);
            }
            v49 = *(unsigned __int8 *)(v29 + *v32 - 1);
LABEL_86:
            if (v49 != 47)
            {
LABEL_99:
              v66 = "Invalid extended LHa header";
              goto LABEL_100;
            }
          }
        }
        else
        {
          v50 = v27 - 2;
          if (v27 >= 2)
          {
            *(_WORD *)(a2 + 192) = *(_WORD *)v28;
            if (a3)
            {
              v51 = sub_1DB741490((unsigned __int16)*a3, v25, v21);
              *a3 = v51;
              v52 = sub_1DB741490(v51, &algn_1DB75496B, 2uLL);
              *a3 = v52;
              *a3 = sub_1DB741490(v52, v28 + 2, v50);
            }
          }
        }
      }
      else
      {
        switch(v26)
        {
          case '@':
            if (v27 == 2)
              *(_BYTE *)(a2 + 296) = *v28;
            break;
          case 'A':
            if (v27 != 24)
              break;
            v35 = *(_QWORD *)v28;
            if (*(_QWORD *)v28 <= 0x19DB1DED53E7FFFuLL)
            {
              v38 = 0;
              v37 = 0;
            }
            else
            {
              v36 = v35 - 116444736000000000;
              v37 = (v35 - 116444736000000000) / 0x989680uLL;
              v38 = 100 * (v36 - 10000000 * v37);
            }
            *(_QWORD *)(a2 + 72) = v37;
            *(_QWORD *)(a2 + 80) = v38;
            v53 = *((_QWORD *)v28 + 1);
            if (v53 <= 0x19DB1DED53E7FFFLL)
            {
              v56 = 0;
              v55 = 0;
            }
            else
            {
              v54 = v53 - 116444736000000000;
              v55 = (v53 - 116444736000000000) / 0x989680;
              v56 = 100 * (v54 - 10000000 * v55);
            }
            *(_QWORD *)(a2 + 88) = v55;
            *(_QWORD *)(a2 + 96) = v56;
            v57 = *((_QWORD *)v28 + 2);
            if (v57 <= 0x19DB1DED53E7FFFLL)
            {
              v60 = 0;
              v59 = 0;
            }
            else
            {
              v58 = v57 - 116444736000000000;
              v59 = (v57 - 116444736000000000) / 0x989680;
              v60 = 100 * (v58 - 10000000 * v59);
            }
            *(_QWORD *)(a2 + 104) = v59;
            *(_QWORD *)(a2 + 112) = v60;
            v41 = *(_DWORD *)(a2 + 64) | 3;
            goto LABEL_96;
          case 'B':
            if (v27 == 16)
            {
              *(_QWORD *)(a2 + 48) = *(_QWORD *)v28;
              *(_QWORD *)(a2 + 56) = *((_QWORD *)v28 + 1);
            }
            break;
          case 'C':
          case 'G':
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'L':
          case 'M':
          case 'N':
          case 'O':
            break;
          case 'D':
            if (v22 == v21)
              goto LABEL_77;
            if ((v27 & 1) != 0 || !*v28)
              goto LABEL_99;
            *(_QWORD *)(a2 + 256) = 0;
            sub_1DB72CE00((uint64_t *)(a2 + 248), &v25[v21], v27);
            v43 = sub_1DB6E3A78((uint64_t)a1, "UTF-16LE", 1);
            *(_QWORD *)(a2 + 208) = v43;
            if (!v43)
              return 4294967266;
            break;
          case 'E':
            if (v22 == v21 || (v27 & 1) != 0 || !*v28)
              goto LABEL_99;
            *(_QWORD *)(a2 + 232) = 0;
            sub_1DB72CE00(v69, &v25[v21], v27);
            v44 = sub_1DB6E3A78((uint64_t)a1, "UTF-16LE", 1);
            *(_QWORD *)(a2 + 200) = v44;
            if (!v44)
              return 4294967266;
            v45 = *(_QWORD *)(a2 + 224);
            v46 = *(_QWORD *)(a2 + 232);
            v47 = v46 >> 1;
            if (v46 >= 2)
            {
              v48 = 0;
              do
              {
                if (*(__int16 *)(v45 + 2 * v48) == -1)
                  *(_WORD *)(v45 + 2 * v48) = 47;
                ++v48;
              }
              while (v47 > v48);
            }
            v49 = *(unsigned __int16 *)(v45 + 2 * v47 - 2);
            goto LABEL_86;
          case 'F':
            if (v27 == 4)
            {
              memset(v72, 0, sizeof(v72));
              v39 = (char *)*(unsigned int *)v28;
              v40 = "UTF-8";
              if ((_DWORD)v39 != 65001)
              {
                sub_1DB7303C0(v72, "CP%d", 4, v15, v16, v17, v18, v19, v39);
                v40 = (char *)v72[0];
              }
              *(_QWORD *)(a2 + 200) = sub_1DB6E3A78((uint64_t)a1, v40, 1);
              *(_QWORD *)(a2 + 208) = sub_1DB6E3A78((uint64_t)a1, v40, 1);
              sub_1DB6E7C3C((uint64_t)v72);
              if (!*(_QWORD *)(a2 + 200) || !*(_QWORD *)(a2 + 208))
                return 4294967266;
            }
            break;
          case 'P':
            if (v27 != 2)
              break;
            *(_WORD *)(a2 + 120) = *(_WORD *)v28;
            v41 = *(_DWORD *)(a2 + 64) | 4;
            goto LABEL_96;
          case 'Q':
            if (v27 == 4)
            {
              *(_QWORD *)(a2 + 136) = *(unsigned __int16 *)v28;
              *(_QWORD *)(a2 + 128) = *((unsigned __int16 *)v28 + 1);
            }
            break;
          case 'R':
            if (v22 == v21)
              break;
            *(_QWORD *)(a2 + 176) = 0;
            v42 = (uint64_t *)(a2 + 168);
            goto LABEL_83;
          case 'S':
            if (v22 == v21)
              break;
            *(_QWORD *)(a2 + 152) = 0;
            v42 = (uint64_t *)(a2 + 144);
            goto LABEL_83;
          case 'T':
            if (v27 == 4)
              *(_QWORD *)(a2 + 88) = *(unsigned int *)v28;
            break;
          default:
            if (v26 == 127)
            {
              if (v27 != 16)
                break;
              *(_BYTE *)(a2 + 296) = *v28;
              *(_WORD *)(a2 + 120) = *((_WORD *)v28 + 1);
              *(_QWORD *)(a2 + 136) = *((unsigned __int16 *)v28 + 2);
              *(_QWORD *)(a2 + 128) = *((unsigned __int16 *)v28 + 3);
              *(_QWORD *)(a2 + 72) = *((unsigned int *)v28 + 2);
              v34 = *((unsigned int *)v28 + 3);
            }
            else
            {
              if (v26 != 255 || v27 != 20)
                break;
              *(_WORD *)(a2 + 120) = *(_DWORD *)v28;
              *(_QWORD *)(a2 + 136) = *((unsigned int *)v28 + 1);
              *(_QWORD *)(a2 + 128) = *((unsigned int *)v28 + 2);
              *(_QWORD *)(a2 + 72) = *((unsigned int *)v28 + 3);
              v34 = *((unsigned int *)v28 + 4);
            }
            *(_QWORD *)(a2 + 104) = v34;
            v41 = *(_DWORD *)(a2 + 64) | 7;
LABEL_96:
            *(_DWORD *)(a2 + 64) = v41;
            break;
        }
      }
      sub_1DB6E26F0((uint64_t)a1, v22, v27, v15, v16, v17, v18, v19);
      v20 = (char *)sub_1DB6E2588((uint64_t)a1, v12, 0, v61, v62, v63, v64, v65);
    }
    while (v20);
  }
  v66 = "Truncated LHa header";
LABEL_100:
  archive_set_error(a1, 79, v66, v15, v16, v17, v18, v19, v68);
  return 4294967266;
}

uint64_t sub_1DB741490(uint64_t result, char *a2, unint64_t a3)
{
  char v3;
  int v4;
  unsigned int v5;
  char v6;

  if (a3)
  {
    if ((a2 & 1) != 0)
    {
      v3 = *a2++;
      LODWORD(result) = word_1F02F76DA[(v3 ^ result)] ^ (result >> 8);
      --a3;
    }
    if (a3 >= 8)
    {
      do
      {
        v4 = word_1F02F76DA[(word_1F02F76DA[(word_1F02F76DA[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_1F02F76DA[(*(_WORD *)a2 ^ result) + 256] ^ *((unsigned __int16 *)a2 + 1)) >> 8] ^ word_1F02F76DA[(word_1F02F76DA[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_1F02F76DA[(*(_WORD *)a2 ^ result) + 256] ^ *((_WORD *)a2 + 1)) + 256] ^ *((_WORD *)a2 + 2))
                          + 256];
        v5 = word_1F02F76DA[(word_1F02F76DA[(word_1F02F76DA[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_1F02F76DA[(*(_WORD *)a2 ^ result) + 256] ^ *((unsigned __int16 *)a2 + 1)) >> 8] ^ word_1F02F76DA[(word_1F02F76DA[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_1F02F76DA[(*(_WORD *)a2 ^ result) + 256] ^ *((_WORD *)a2 + 1)) + 256] ^ *((unsigned __int16 *)a2 + 2)) >> 8] ^ v4 ^ *((unsigned __int16 *)a2 + 3);
        a2 += 8;
        LOWORD(result) = word_1F02F76DA[v5 >> 8] ^ word_1F02F76DA[v5 + 256];
        a3 -= 8;
      }
      while (a3 > 7);
    }
    for (; a3; --a3)
    {
      v6 = *a2++;
      LODWORD(result) = word_1F02F76DA[(v6 ^ result)] ^ ((unsigned __int16)(result & 0xFF00) >> 8);
    }
  }
  return (unsigned __int16)result;
}

uint64_t sub_1DB741584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  char *v11;

  v8 = **(_QWORD **)(a1 + 2472);
  if (*(_BYTE *)(v8 + 301))
    return 1;
  v9 = 1;
  if ((*(_BYTE *)(v8 + 64) & 8) != 0)
  {
    if (*(unsigned __int16 *)(v8 + 194) == *(unsigned __int16 *)(v8 + 24))
    {
      v9 = 1;
    }
    else
    {
      archive_set_error((_DWORD *)a1, -1, "LHa data CRC error", a4, a5, a6, a7, a8, v11);
      v9 = 4294967276;
    }
  }
  *(_BYTE *)(v8 + 301) = 1;
  return v9;
}

uint64_t sub_1DB7415F8(uint64_t a1, size_t size)
{
  int v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;

  v2 = size;
  if (!*(_QWORD *)(a1 + 80))
  {
    v4 = malloc_type_malloc(size, 0x100004077774924uLL);
    *(_QWORD *)(a1 + 80) = v4;
    if (!v4)
      return 4294967266;
  }
  if (!*(_QWORD *)(a1 + 112))
  {
    v5 = malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
    *(_QWORD *)(a1 + 112) = v5;
    if (!v5)
      return 4294967266;
  }
  if (!*(_QWORD *)(a1 + 120))
  {
    *(_DWORD *)(a1 + 104) = 1024;
    v6 = malloc_type_malloc(0x1000uLL, 0x100004052888210uLL);
    *(_QWORD *)(a1 + 120) = v6;
    if (!v6)
      return 4294967266;
  }
  result = 0;
  *(_DWORD *)a1 = v2;
  *(_DWORD *)(a1 + 96) = 16;
  return result;
}

uint64_t sub_1DB7416B0(_DWORD *a1, unint64_t *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;

  v2 = *((_DWORD *)a2 + 2);
  v3 = a1[2];
  v4 = -v2;
  v5 = v2 + 8;
  while (v3 < (v4 + 64) >> 3)
  {
LABEL_4:
    if (!v3)
      return 0;
    v7 = *a2;
    v8 = (unsigned __int8 *)(*(_QWORD *)a1)++;
    *a2 = *v8 | (v7 << 8);
    a1[2] = --v3;
    *((_DWORD *)a2 + 2) = v5;
    v4 -= 8;
    v5 += 8;
  }
  v6 = 1;
  switch((v4 + 64) >> 3)
  {
    case 0:
      return v6;
    case 6:
      v9 = *(_QWORD *)a1;
      *a2 = (*a2 << 48) | ((unint64_t)**(unsigned __int8 **)a1 << 40) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 1) << 32) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 2) << 24) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 3) << 16) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 4) << 8) | *(unsigned __int8 *)(*(_QWORD *)a1 + 5);
      v10 = v9 + 6;
      v11 = 48;
      v12 = -6;
      goto LABEL_10;
    case 7:
      v13 = *(_QWORD *)a1;
      *a2 = (*a2 << 56) | ((unint64_t)**(unsigned __int8 **)a1 << 48) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 1) << 40) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 2) << 32) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 3) << 24) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 4) << 16) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)a1 + 5) << 8) | *(unsigned __int8 *)(*(_QWORD *)a1 + 6);
      v10 = v13 + 7;
      v11 = 56;
      v12 = -7;
      goto LABEL_10;
    case 8:
      v10 = *(_QWORD *)a1 + 8;
      *a2 = bswap64(**(_QWORD **)a1);
      v11 = 64;
      v12 = -8;
LABEL_10:
      *(_QWORD *)a1 = v10;
      a1[2] = v12 + v3;
      *((_DWORD *)a2 + 2) = v11 - v4;
      v6 = 1;
      break;
    default:
      goto LABEL_4;
  }
  return v6;
}

uint64_t sub_1DB741814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v3 = a2;
  if ((int)a2 < (int)a3)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = (_QWORD *)(v6 + 40);
    v3 = (int)a2;
    while (1)
    {
      v8 = *(_DWORD *)(v6 + 48);
      if (v8 <= 2)
      {
        v9 = sub_1DB7416B0((_DWORD *)a1, (unint64_t *)(v6 + 40));
        v8 = *(_DWORD *)(v6 + 48);
        if (!v9 && v8 < 3)
          break;
      }
      v10 = v8 - 3;
      v11 = (*v7 >> (v8 - 3)) & 7;
      if ((_DWORD)v11 == 7)
      {
        if (v8 <= 12)
        {
          v12 = sub_1DB7416B0((_DWORD *)a1, (unint64_t *)(v6 + 40));
          v8 = *(_DWORD *)(v6 + 48);
          if (!v12 && v8 < 13)
            return v3;
        }
        v11 = (*v7 >> (v8 - 13)) & 0x3FFLL;
        if (v11 == 1023)
          return 0xFFFFFFFFLL;
        LODWORD(v11) = asc_1DB75DDDF[v11];
        v10 = v8 - v11 + 3;
      }
      *(_DWORD *)(v6 + 48) = v10;
      *(_BYTE *)(*(_QWORD *)(v6 + 264) + v3) = v11;
      ++*(_DWORD *)(v6 + 4 * (int)v11 + 196);
      if ((_DWORD)a3 == (_DWORD)++v3)
        return a3;
    }
  }
  return v3;
}

uint64_t sub_1DB741928(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  uint64_t result;
  char v8;
  int *v9;
  int *v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  char *v23;
  int16x8_t *v24;
  unsigned int v25;
  int16x8_t *v26;
  int16x8_t *v27;
  int16x8_t v28;
  int v29;
  int v30;
  uint64_t v31;
  unsigned __int16 *v32;
  uint64_t v33;
  _WORD *v34;
  _WORD *v35;
  int v36;
  BOOL v37;
  uint64_t v38;
  int v39;
  int v40;
  _BYTE v41[4];
  _DWORD v42[17];
  _DWORD v43[16];
  uint64_t v44;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  v44 = *MEMORY[0x1E0C80C00];
  v5 = 0x8000;
  do
  {
    v43[v2] = v3;
    v42[v2] = v5;
    v6 = *(_DWORD *)(a1 + 16 + 4 * v2++);
    if (v6)
      v4 = v2;
    v3 += v6 * v5;
    v5 >>= 1;
  }
  while (v2 != 16);
  if (v3 != 0x10000 || v4 > *(_DWORD *)(a1 + 96))
    return 0;
  *(_DWORD *)(a1 + 88) = v4;
  if (v4 > 15)
    goto LABEL_14;
  if (v4 < 1)
    goto LABEL_18;
  v8 = 16 - v4;
  v9 = v42;
  v10 = v43;
  v11 = (v4 + 1) - 1;
  do
  {
    *v10++ >>= v8;
    *v9++ >>= v8;
    --v11;
  }
  while (v11);
  if (v4 <= 10)
  {
LABEL_18:
    v12 = 0;
    v15 = *(_QWORD *)(a1 + 112);
  }
  else
  {
LABEL_14:
    v12 = v4 - 10;
    for (i = 1; i != 11; ++i)
    {
      v42[i + 16] = (int)v42[i + 16] >> v12;
      *(int *)&v41[i * 4] >>= v12;
    }
    v14 = v43[9] + *(_DWORD *)(a1 + 52) * v42[9];
    v15 = *(_QWORD *)(a1 + 112);
    if (v14 <= 0x3FF)
      bzero((void *)(v15 + 2 * v14), 2048 - 2 * v14);
  }
  *(_DWORD *)(a1 + 92) = v12;
  v16 = *(_QWORD *)(a1 + 80);
  v17 = *(unsigned int *)(a1 + 4);
  *(_DWORD *)(a1 + 100) = 0;
  result = 1;
  if ((int)v17 >= 1)
  {
    v18 = 0;
    while (1)
    {
      v19 = *(unsigned __int8 *)(v16 + v18);
      if (*(_BYTE *)(v16 + v18))
      {
        v20 = (int)v42[v19 + 16];
        v21 = *(_DWORD *)&v41[4 * v19];
        v42[v19 + 16] = v21 + v20;
        v22 = v19 - 10;
        if (v19 > 0xA)
        {
          v29 = *(unsigned __int16 *)(v15 + 2 * ((int)v20 >> v12));
          if (*(_WORD *)(v15 + 2 * ((int)v20 >> v12)))
          {
            if (v29 < (int)v17)
              return 0;
            v30 = *(_DWORD *)(a1 + 100);
            if (v30 + (int)v17 <= v29)
              return 0;
            v31 = *(_QWORD *)(a1 + 120);
            v32 = (unsigned __int16 *)(v31 + 4 * (v29 - (int)v17));
          }
          else
          {
            v38 = *(int *)(a1 + 100);
            *(_WORD *)(v15 + 2 * ((int)v20 >> v12)) = v38 + v17;
            v31 = *(_QWORD *)(a1 + 120);
            v30 = v38 + 1;
            *(_DWORD *)(a1 + 100) = v38 + 1;
            if ((int)v38 >= *(_DWORD *)(a1 + 104))
              return 0;
            v32 = (unsigned __int16 *)(v31 + 4 * v38);
            *(_DWORD *)v32 = 0;
          }
          if (v19 < 0xC)
          {
            v39 = 1 << (v12 - 1);
LABEL_54:
            if (((unsigned __int16)v20 & (unsigned __int16)v39) != 0)
            {
              if (*v32)
                return 0;
              *v32 = v18;
            }
            else
            {
              if (v32[1])
                return 0;
              v32[1] = v18;
            }
            goto LABEL_64;
          }
          v39 = 1 << (v12 - 1);
          while (2)
          {
            if (((unsigned __int16)v39 & (unsigned __int16)v20) != 0)
            {
              v40 = *v32;
              if (v40 < (int)v17)
              {
                *v32 = v30 + v17;
                goto LABEL_48;
              }
LABEL_50:
              v32 = (unsigned __int16 *)(v31 + 4 * (v40 - (int)v17));
            }
            else
            {
              v40 = v32[1];
              if ((int)v17 <= v40)
                goto LABEL_50;
              v32[1] = v30 + v17;
LABEL_48:
              *(_DWORD *)(a1 + 100) = v30 + 1;
              if (v30 >= *(_DWORD *)(a1 + 104))
                return 0;
              v32 = (unsigned __int16 *)(v31 + 4 * v30);
              *(_DWORD *)v32 = 0;
              ++v30;
            }
            v39 = (unsigned __int16)v39 >> 1;
            if (--v22 <= 1)
              goto LABEL_54;
            continue;
          }
        }
        if (v21 + (int)v20 > 1024)
          return 0;
        v23 = (char *)(v15 + 2 * v20);
        if (v21 > 7)
        {
          v24 = (int16x8_t *)&v23[2 * (v21 - 8)];
          *v24 = vdupq_n_s16(v18);
          v25 = v21 - 16;
          if (v21 < 0x10)
          {
            v25 = v21 - 8;
            v26 = (int16x8_t *)&v23[2 * (v21 - 8)];
          }
          else
          {
            v26 = (int16x8_t *)&v23[2 * v25];
            *v26 = *v24;
            if (v25 >= 0x10)
            {
              v27 = (int16x8_t *)(v15 + 2 * v20 + 2 * (v21 - 32));
              do
              {
                v28 = v26[1];
                *v27 = *v26;
                v27[1] = v28;
                v27 -= 2;
                v25 -= 16;
              }
              while (v25 > 0xF);
            }
          }
          if (v25)
            memcpy(v23, v26, 2 * v25);
          goto LABEL_64;
        }
        if (v21 >= 2)
        {
          v33 = 2 * v20;
          v34 = (_WORD *)(v15 + 2 * v20 + 2 * (v21 - 1));
          v35 = (_WORD *)(v15 + v33 + 2 * (v21 - 2));
          do
          {
            *v34 = v18;
            v34 -= 2;
            v36 = v21 - 2;
            *v35 = v18;
            v35 -= 2;
            v37 = v21 > 3;
            v21 -= 2;
          }
          while (v37);
          if (!v36)
            goto LABEL_64;
LABEL_63:
          *(_WORD *)&v23[2 * v36 - 2] = v18;
          goto LABEL_64;
        }
        v36 = v21;
        if (v21)
          goto LABEL_63;
      }
LABEL_64:
      if (++v18 == v17)
        return 1;
    }
  }
  return result;
}

void sub_1DB741D10(void **a1)
{
  free(a1[10]);
  free(a1[14]);
  free(a1[15]);
}

uint64_t archive_write_set_format_shar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void (*v10)(uint64_t);
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  char *v18;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, "archive_write_set_format_shar", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10)
      v10(a1);
    v11 = malloc_type_calloc(1uLL, 0x90uLL, 0x10300409387678EuLL);
    if (v11)
    {
      v17 = v11;
      result = 0;
      v17[7] = 0u;
      v17[8] = 0u;
      v17[6] = 0u;
      *(_QWORD *)(a1 + 328) = sub_1DB7422F0;
      *(_QWORD *)(a1 + 312) = sub_1DB742344;
      *(_QWORD *)(a1 + 320) = sub_1DB742290;
      *(_QWORD *)(a1 + 296) = sub_1DB7424A0;
      *(_QWORD *)(a1 + 304) = sub_1DB741E2C;
      *(_DWORD *)(a1 + 16) = 131073;
      *(_QWORD *)(a1 + 264) = v17;
      *(_QWORD *)(a1 + 272) = "shar";
      *(_QWORD *)(a1 + 24) = "shar";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate shar data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_1DB741E2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  const char *v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  _BYTE *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v4 = *(_QWORD *)(a1 + 264);
  if (!*(_DWORD *)(v4 + 88))
  {
    sub_1DB72CE50((uint64_t *)(v4 + 96), "#!/bin/sh\n");
    sub_1DB72CE50((uint64_t *)(v4 + 96), "# This is a shell archive\n");
    *(_DWORD *)(v4 + 88) = 1;
  }
  archive_entry_free(*(void ***)(v4 + 8));
  *(_QWORD *)(v4 + 8) = archive_entry_clone(a2);
  v5 = (char *)archive_entry_pathname(a2);
  HIDWORD(v6) = archive_entry_filetype((uint64_t)a2);
  LODWORD(v6) = HIDWORD(v6) - 4096;
  switch((v6 >> 12))
  {
    case 0u:
    case 1u:
    case 5u:
      archive_entry_set_size((uint64_t)a2, 0);
      goto LABEL_5;
    case 3u:
      archive_entry_set_size((uint64_t)a2, 0);
      result = strcmp(v5, ".");
      if (!(_DWORD)result)
        return result;
      result = strcmp(v5, "./");
      if (!(_DWORD)result)
        return result;
      goto LABEL_5;
    case 7u:
      goto LABEL_5;
    default:
      archive_entry_set_size((uint64_t)a2, 0);
      if (!archive_entry_hardlink((uint64_t)a2) && !archive_entry_symlink((uint64_t)a2))
      {
        sub_1DB7355D0((_DWORD *)a1, a2);
        return 4294967276;
      }
LABEL_5:
      v7 = (char **)(v4 + 120);
      *(_QWORD *)(v4 + 128) = 0;
      sub_1DB742840((uint64_t *)(v4 + 120), v5, 1);
      sub_1DB7303C0((void **)(v4 + 96), "echo x %s\n", v8, v9, v10, v11, v12, v13, *(char **)(v4 + 120));
      if (archive_entry_filetype((uint64_t)a2) != 0x4000)
      {
        v14 = strdup(v5);
        v15 = strrchr(v14, 47);
        if (!v15
          || (*v15 = 0, !strcmp(v14, "."))
          || (v16 = *(const char **)(v4 + 24)) != 0
          && (!strcmp(v14, *(const char **)(v4 + 24))
           || (v17 = strlen(v14), v17 < strlen(v16)) && !strncmp(v14, v16, v17)))
        {
          free(v14);
        }
        else
        {
          sub_1DB72CE50((uint64_t *)(v4 + 96), "mkdir -p ");
          sub_1DB742840((uint64_t *)(v4 + 96), v14, 1);
          sub_1DB72CE50((uint64_t *)(v4 + 96), " > /dev/null 2>&1\n");
          *(_QWORD *)(v4 + 24) = v14;
        }
      }
      *(_DWORD *)(v4 + 16) = 0;
      v18 = archive_entry_hardlink((uint64_t)a2);
      if (v18)
      {
        v19 = (char *)v18;
        v20 = "ln -f ";
        goto LABEL_18;
      }
      v21 = archive_entry_symlink((uint64_t)a2);
      if (v21)
      {
        v19 = (char *)v21;
        v20 = "ln -fs ";
LABEL_18:
        sub_1DB72CE50((uint64_t *)(v4 + 96), v20);
        sub_1DB742840((uint64_t *)(v4 + 96), v19, 1);
        sub_1DB7303C0((void **)(v4 + 96), " %s\n", v22, v23, v24, v25, v26, v27, *v7);
        return 0;
      }
      HIDWORD(v35) = archive_entry_filetype((uint64_t)a2);
      LODWORD(v35) = HIDWORD(v35) - 4096;
      result = 4294967276;
      switch((v35 >> 12))
      {
        case 0u:
          sub_1DB7303C0((void **)(v4 + 96), "mkfifo %s\n", v29, v30, v31, v32, v33, v34, *v7);
          return 0;
        case 1u:
          v36 = *v7;
          archive_entry_rdevmajor((uint64_t)a2);
          archive_entry_rdevminor(a2);
          sub_1DB7303C0((void **)(v4 + 96), "mknod %s c %ju %ju\n", v37, v38, v39, v40, v41, v42, v36);
          return 0;
        case 3u:
          sub_1DB7303C0((void **)(v4 + 96), "mkdir -p %s > /dev/null 2>&1\n", v29, v30, v31, v32, v33, v34, *(char **)(v4 + 120));
          free(*(void **)(v4 + 24));
          v43 = strdup(v5);
          *(_QWORD *)(v4 + 24) = v43;
          result = (uint64_t)strrchr(v43, 47);
          if (!result)
            return result;
          v44 = (_BYTE *)result;
          if (*(_BYTE *)(result + 1))
            return 0;
          result = 0;
          *v44 = 0;
          return result;
        case 5u:
          v45 = *v7;
          archive_entry_rdevmajor((uint64_t)a2);
          archive_entry_rdevminor(a2);
          sub_1DB7303C0((void **)(v4 + 96), "mknod %s b %ju %ju\n", v46, v47, v48, v49, v50, v51, v45);
          return 0;
        case 7u:
          if (!archive_entry_size((uint64_t)a2))
          {
            sub_1DB7303C0((void **)(v4 + 96), "test -e \"%s\" || :> \"%s\"\n", v52, v53, v54, v55, v56, v57, *v7);
            return 0;
          }
          if (*(_DWORD *)v4)
          {
            v58 = archive_entry_mode((uint64_t)a2);
            sub_1DB7303C0((void **)(v4 + 96), "uudecode -p > %s << 'SHAR_END'\n", v59, v60, v61, v62, v63, v64, *v7);
            sub_1DB7303C0((void **)(v4 + 96), "begin %o ", v65, v66, v67, v68, v69, v70, (char *)(v58 & 0x1FF));
            sub_1DB742840((uint64_t *)(v4 + 96), v5, 0);
            sub_1DB72CE50((uint64_t *)(v4 + 96), "\n");
          }
          else
          {
            sub_1DB7303C0((void **)(v4 + 96), "sed 's/^X//' > %s << 'SHAR_END'\n", v52, v53, v54, v55, v56, v57, *v7);
          }
          result = 0;
          *(_DWORD *)(v4 + 16) = 1;
          *(_DWORD *)(v4 + 4) = 1;
          *(_QWORD *)(v4 + 80) = 0;
          break;
        default:
          return result;
      }
      return result;
  }
}

uint64_t sub_1DB742290(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 264);
  if (*(_DWORD *)(v1 + 88))
  {
    sub_1DB72CE50((uint64_t *)(v1 + 96), "exit\n");
    if (sub_1DB7322A8(a1, *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104)))
      return 4294967266;
    archive_write_set_bytes_in_last_block((int *)a1, 1, v3, v4, v5, v6, v7, v8);
  }
  return 0;
}

uint64_t sub_1DB7422F0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 264);
  if (v1)
  {
    archive_entry_free(*(void ***)(v1 + 8));
    free(*(void **)(v1 + 24));
    sub_1DB6E7C3C(v1 + 96);
    sub_1DB6E7C3C(v1 + 120);
    free((void *)v1);
    *(_QWORD *)(a1 + 264) = 0;
  }
  return 0;
}

uint64_t sub_1DB742344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  _BYTE *v19;
  uint64_t v20;
  char *v21;

  result = 0;
  if (!a3)
    return result;
  v5 = *(_QWORD *)(a1 + 264);
  if (!*(_DWORD *)(v5 + 16))
    return result;
  if (!sub_1DB6E3190((void **)(v5 + 96), 0x10000uLL))
  {
    archive_set_error((_DWORD *)a1, 12, "Out of memory", v8, v9, v10, v11, v12, v21);
    return -30;
  }
  v13 = *(_QWORD *)(v5 + 104);
  if (v13 < 0xFFFE)
    goto LABEL_7;
  if (sub_1DB7322A8(a1, *(_QWORD *)(v5 + 96), v13))
    return -30;
  v13 = 0;
  *(_QWORD *)(v5 + 104) = 0;
LABEL_7:
  v14 = *(_QWORD *)(v5 + 96);
  v15 = (_BYTE *)(v14 + v13);
  if (*(_DWORD *)(v5 + 4))
  {
    *v15++ = 88;
    *(_DWORD *)(v5 + 4) = 0;
  }
  v16 = 0;
  v17 = v14 + 65533;
  do
  {
    v18 = *(unsigned __int8 *)(a2 + v16);
    *v15 = v18;
    v19 = v15 + 1;
    if (v18 == 10)
    {
      if (a3 - 1 == v16)
      {
        *(_DWORD *)(v5 + 4) = 1;
      }
      else
      {
        v19 = v15 + 2;
        v15[1] = 88;
      }
    }
    if ((unint64_t)v19 >= v17)
    {
      v20 = *(_QWORD *)(v5 + 96);
      *(_QWORD *)(v5 + 104) = &v19[-v20];
      if (sub_1DB7322A8(a1, v20, (uint64_t)&v19[-v20]))
        return -30;
      *(_QWORD *)(v5 + 104) = 0;
      v15 = *(_BYTE **)(v5 + 96);
    }
    else
    {
      v15 = v19;
    }
    ++v16;
  }
  while (a3 != v16);
  *(_QWORD *)(v5 + 104) = &v15[-*(_QWORD *)(v5 + 96)];
  return a3;
}

uint64_t sub_1DB7424A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  unint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t *v27;
  unint64_t v28;

  v2 = *(_QWORD *)(a1 + 264);
  result = *(_QWORD *)(v2 + 8);
  if (!result)
    return result;
  v4 = *(_DWORD *)(v2 + 16);
  if (*(_DWORD *)v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(v2 + 80);
      if (v5 && sub_1DB7428FC((_DWORD *)a1, v2, (unsigned __int8 *)(v2 + 32), v5))
        return 4294967266;
      sub_1DB72CE50((uint64_t *)(v2 + 96), "SHAR_END\n");
      result = *(_QWORD *)(v2 + 8);
    }
    v6 = archive_entry_mode(result);
    sub_1DB7303C0((void **)(v2 + 96), "chmod %o ", v7, v8, v9, v10, v11, v12, (char *)(v6 & 0xFFF));
    v13 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
    sub_1DB742840((uint64_t *)(v2 + 96), v13, 1);
    sub_1DB72CE50((uint64_t *)(v2 + 96), "\n");
    v14 = archive_entry_uname(*(uint64_t **)(v2 + 8));
    v15 = archive_entry_gname(*(uint64_t **)(v2 + 8));
    if (v14 | v15)
    {
      v16 = (char *)v15;
      sub_1DB72CE50((uint64_t *)(v2 + 96), "chown ");
      if (v14)
        sub_1DB742840((uint64_t *)(v2 + 96), (char *)v14, 1);
      if (v16)
      {
        sub_1DB72CE50((uint64_t *)(v2 + 96), ":");
        sub_1DB742840((uint64_t *)(v2 + 96), v16, 1);
      }
      sub_1DB72CE50((uint64_t *)(v2 + 96), " ");
      v17 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
      sub_1DB742840((uint64_t *)(v2 + 96), v17, 1);
      sub_1DB72CE50((uint64_t *)(v2 + 96), "\n");
    }
    v18 = archive_entry_fflags_text(*(uint64_t **)(v2 + 8));
    if (!v18)
      goto LABEL_20;
    sub_1DB7303C0((void **)(v2 + 96), "chflags %s ", v19, v20, v21, v22, v23, v24, v18);
    v25 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
    sub_1DB742840((uint64_t *)(v2 + 96), v25, 1);
    v26 = "\n";
    v27 = (uint64_t *)(v2 + 96);
    goto LABEL_19;
  }
  if (v4)
  {
    if (!*(_DWORD *)(v2 + 4))
      sub_1DB72CE60((uint64_t *)(v2 + 96), 10);
    v27 = (uint64_t *)(v2 + 96);
    v26 = "SHAR_END\n";
LABEL_19:
    sub_1DB72CE50(v27, v26);
  }
LABEL_20:
  archive_entry_free(*(void ***)(v2 + 8));
  *(_QWORD *)(v2 + 8) = 0;
  v28 = *(_QWORD *)(v2 + 104);
  if (v28 < 0x10000)
    return 0;
  result = sub_1DB7322A8(a1, *(_QWORD *)(v2 + 96), v28);
  if ((_DWORD)result)
    return 4294967266;
  *(_QWORD *)(v2 + 104) = 0;
  return result;
}

uint64_t archive_write_set_format_shar_dump(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  archive_write_set_format_shar(a1, a2, a3, a4, a5, a6, a7, a8);
  **(_DWORD **)(a1 + 264) = 1;
  *(_QWORD *)(a1 + 312) = sub_1DB742718;
  *(_DWORD *)(a1 + 16) = 131074;
  *(_QWORD *)(a1 + 24) = "shar dump";
  return 0;
}

size_t sub_1DB742718(uint64_t a1, unsigned __int8 *__src, size_t __n)
{
  uint64_t v3;
  size_t v4;
  unsigned __int8 *v5;
  uint64_t v7;
  size_t v8;
  size_t v9;
  unint64_t v10;

  v3 = *(_QWORD *)(a1 + 264);
  if (!*(_DWORD *)(v3 + 16))
    return 0;
  v4 = __n;
  v5 = __src;
  v7 = *(_QWORD *)(v3 + 80);
  if (!v7)
  {
    v9 = __n;
LABEL_12:
    if (v9 >= 0x2D)
    {
      while (!sub_1DB7428FC((_DWORD *)a1, v3, v5, 0x2DuLL))
      {
        v10 = *(_QWORD *)(v3 + 104);
        if (v10 >= 0x10000)
        {
          if (sub_1DB7322A8(a1, *(_QWORD *)(v3 + 96), v10))
            return -30;
          *(_QWORD *)(v3 + 104) = 0;
        }
        v5 += 45;
        v9 -= 45;
        if (v9 <= 0x2C)
          goto LABEL_18;
      }
      return -30;
    }
LABEL_18:
    if (!v9)
      return v4;
    memcpy((void *)(v3 + 32), v5, v9);
LABEL_20:
    *(_QWORD *)(v3 + 80) = v9;
    return v4;
  }
  if (45 - v7 >= __n)
    v8 = __n;
  else
    v8 = 45 - v7;
  memcpy((void *)(v3 + 32 + v7), __src, v8);
  v9 = *(_QWORD *)(v3 + 80) + v8;
  if (v9 < 0x2D)
    goto LABEL_20;
  if (!sub_1DB7428FC((_DWORD *)a1, v3, (unsigned __int8 *)(v3 + 32), 0x2DuLL))
  {
    v5 += v8;
    v9 = v4 - v8;
    goto LABEL_12;
  }
  return -30;
}

uint64_t *sub_1DB742840(uint64_t *result, char *__s, int a3)
{
  int v3;
  char *v4;
  uint64_t *v5;
  char *v6;
  size_t v7;
  uint64_t v8;

  v3 = *__s;
  if (*__s)
  {
    v4 = __s;
    v5 = result;
    if (a3)
      v6 = "\"\n\"";
    else
      v6 = "\\n";
    do
    {
      if (v7)
      {
        v8 = v7;
        result = sub_1DB6E323C(v5, v4, v7);
      }
      else
      {
        if (v3 == 10)
        {
          result = sub_1DB72CE50(v5, v6);
        }
        else
        {
          sub_1DB72CE60(v5, 92);
          result = sub_1DB72CE60(v5, *v4);
        }
        v8 = 1;
      }
      v4 += v8;
      v3 = *v4;
    }
    while (*v4);
  }
  return result;
}

uint64_t sub_1DB7428FC(_DWORD *a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  unsigned __int8 v15;
  char *v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  unsigned __int8 v22[3];

  if (!sub_1DB6E3190((void **)(a2 + 96), *(_QWORD *)(a2 + 104) + 62))
  {
    v16 = "Out of memory";
    v17 = a1;
    v18 = 12;
LABEL_12:
    archive_set_error(v17, v18, v16, v8, v9, v10, v11, v12, v21);
    return 4294967266;
  }
  v13 = (_BYTE *)(*(_QWORD *)(a2 + 96) + *(_QWORD *)(a2 + 104));
  *v13 = (a4 & 0x3F) + 32;
  v14 = v13 + 1;
  if (a4 >= 3)
  {
    do
    {
      sub_1DB742A1C(a3, v14);
      a4 -= 3;
      a3 += 3;
      v14 += 4;
    }
    while (a4 > 2);
  }
  if (a4)
  {
    v22[0] = *a3;
    if (a4 == 1)
      v15 = 0;
    else
      v15 = a3[1];
    v22[1] = v15;
    v22[2] = 0;
    sub_1DB742A1C(v22, v14);
    v14 += 4;
  }
  *v14 = 10;
  v19 = (uint64_t)&v14[-*(_QWORD *)(a2 + 96) + 1];
  if (v19 > *(_QWORD *)(a2 + 104) + 62)
  {
    v16 = "Buffer overflow";
    v17 = a1;
    v18 = -1;
    goto LABEL_12;
  }
  result = 0;
  *(_QWORD *)(a2 + 104) = v19;
  return result;
}

unsigned __int8 *sub_1DB742A1C(unsigned __int8 *result, _BYTE *a2)
{
  unsigned int v2;
  unsigned __int8 v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  int v8;
  char v9;
  int v10;
  char v11;

  v2 = *result;
  v3 = result[2];
  v4 = v3 | (result[1] << 8);
  v5 = (v2 << 16) | (result[1] << 8);
  v6 = (v2 >> 2) + 32;
  if (v2 < 4)
    LOBYTE(v6) = 96;
  *a2 = v6;
  v8 = (v5 >> 12) & 0x3F;
  v7 = v8 == 0;
  v9 = v8 + 32;
  if (v7)
    v9 = 96;
  a2[1] = v9;
  v10 = ((v4 >> 6) & 0x3F) + 32;
  if (((v4 >> 6) & 0x3F) == 0)
    LOBYTE(v10) = 96;
  a2[2] = v10;
  if ((v3 & 0x3F) != 0)
    v11 = (v3 & 0x3F) + 32;
  else
    v11 = 96;
  a2[3] = v11;
  return result;
}

void archive_read_support_filter_gzip(int *a1)
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD *v14;
  char *v15;
  _QWORD *v16;

  if (sub_1DB6E4544("gzip"))
  {
    if (sub_1DB6E0594(a1, 14594245, 1, "archive_read_support_filter_gzip", v3, v4, v5, v6) != -30)
    {
      v16 = 0;
      sub_1DB6F7FD0(a1, &v16, v7, v8, v9, v10, v11, v12);
      if (!v13)
      {
        *v16 = 0;
        v14 = v16;
        v16[1] = "gzip";
        v14[2] = sub_1DB742B40;
        v14[4] = 0;
        v14[5] = 0;
        v14[3] = sub_1DB742B78;
      }
    }
  }
  else
  {
    archive_set_error(a1, -1, "Format not allow-listed in entitlements", v2, v3, v4, v5, v6, v15);
  }
}

uint64_t sub_1DB742B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;

  v9 = 0;
  if (sub_1DB742C3C(a2, &v9, 0, a4, a5, a6, a7, a8))
    return v9;
  else
    return 0;
}

uint64_t sub_1DB742B78(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;

  *(_DWORD *)(a1 + 104) = 1;
  *(_QWORD *)(a1 + 96) = "gzip";
  v2 = malloc_type_calloc(0xB0uLL, 1uLL, 0xC329240EuLL);
  v3 = malloc_type_malloc(0x10000uLL, 0x4E38BFCBuLL);
  v4 = v3;
  if (v2 && v3)
  {
    result = 0;
    v2[15] = v4;
    v2[16] = 0x10000;
    *(_QWORD *)(a1 + 40) = sub_1DB742DD0;
    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 64) = sub_1DB74304C;
    *(_QWORD *)(a1 + 80) = sub_1DB7430BC;
    *(_QWORD *)(a1 + 88) = v2;
    *((_BYTE *)v2 + 112) = 0;
  }
  else
  {
    free(v3);
    free(v2);
    archive_set_error(*(_DWORD **)(a1 + 24), 12, "Can't allocate data for gzip decompression", v6, v7, v8, v9, v10, v11);
    return 4294967266;
  }
  return result;
}

size_t sub_1DB742C3C(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int16 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  unsigned int v20;
  uint64_t v21;
  int64_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v28;

  v28 = 0;
  v11 = (unsigned __int16 *)sub_1DB6E22F4(a1, 0xAuLL, &v28, a4, a5, a6, a7, a8);
  v17 = 0;
  if (!v11 || !v28)
    return v17;
  v18 = (size_t)v11;
  if (*v11 != 35615 || *((_BYTE *)v11 + 2) != 8)
    return 0;
  v20 = *((unsigned __int8 *)v11 + 3);
  if (v20 > 0x1F)
    return 0;
  if (a3)
    *(_DWORD *)(a3 + 152) = *((_DWORD *)v11 + 1);
  if ((v20 & 4) == 0)
  {
    v21 = 10;
    if ((v20 & 8) == 0)
      goto LABEL_13;
LABEL_16:
    v24 = v21;
    while (1)
    {
      v22 = v24 + 1;
      if (v28 <= v24)
      {
        v18 = sub_1DB6E22F4(a1, v24 + 1, &v28, v12, v13, v14, v15, v16);
        if (!v18)
          return 0;
      }
      if (!*(unsigned __int8 *)(v18 + v24++))
      {
        if (a3)
        {
          free(*(void **)(a3 + 160));
          *(_QWORD *)(a3 + 160) = strdup((const char *)(v18 + v21));
        }
        goto LABEL_22;
      }
    }
  }
  v23 = sub_1DB6E22F4(a1, 0xCuLL, &v28, v12, v13, v14, v15, v16);
  if (!v23)
    return 0;
  v18 = v23;
  v21 = *(unsigned __int16 *)(v23 + 10) + 12;
  if ((v20 & 8) != 0)
    goto LABEL_16;
LABEL_13:
  v22 = v21;
LABEL_22:
  if ((v20 & 0x10) != 0)
  {
    while (1)
    {
      v17 = v22 + 1;
      if (v28 <= v22)
      {
        v18 = sub_1DB6E22F4(a1, v22 + 1, &v28, v12, v13, v14, v15, v16);
        if (!v18)
          return 0;
      }
      if (!*(unsigned __int8 *)(v18 + v22++))
        goto LABEL_27;
    }
  }
  v17 = v22;
LABEL_27:
  if ((v20 & 2) != 0)
  {
    v17 += 2;
    if (!sub_1DB6E22F4(a1, v17, &v28, v12, v13, v14, v15, v16))
      return 0;
  }
  if (a2)
    *a2 = 27;
  return v17;
}

uint64_t sub_1DB742DD0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  uint64_t v12;
  size_t v13;
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
  uint64_t v24;
  char *v25;
  size_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  char *v34;
  _DWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  int v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;

  v9 = a1[11];
  *(_QWORD *)(v9 + 24) = *(_QWORD *)(v9 + 120);
  v10 = *(_DWORD *)(v9 + 128);
  *(_DWORD *)(v9 + 32) = v10;
  if (v10)
  {
    v42 = 0;
    do
    {
      if (*(_BYTE *)(v9 + 168))
        break;
      if (!*(_BYTE *)(v9 + 112))
      {
        v12 = a1[11];
        v13 = sub_1DB742C3C(a1[2], 0, v12, a4, a5, a6, a7, a8);
        if (!v13)
        {
          *(_BYTE *)(v9 + 168) = 1;
          break;
        }
        v43 = 0;
        sub_1DB6E26F8(a1[2], v13, v14, v15, v16, v17, v18, v19);
        *(_QWORD *)(v12 + 144) = crc32(0, 0, 0);
        *(_QWORD *)v12 = sub_1DB6E22F4(a1[2], 1uLL, &v43, v20, v21, v22, v23, v24);
        *(_DWORD *)(v12 + 8) = v43;
        v25 = (char *)inflateInit2_((z_streamp)v12, -15, "1.2.12", 112);
        if ((_DWORD)v25)
        {
          if ((_DWORD)v25 != -6)
          {
            if ((_DWORD)v25 == -4)
            {
              v33 = (_DWORD *)a1[3];
              v34 = "Internal error initializing compression library: out of memory";
              v40 = 12;
            }
            else
            {
              if ((_DWORD)v25 == -2)
              {
                v33 = (_DWORD *)a1[3];
                v34 = "Internal error initializing compression library: invalid setup parameter";
                goto LABEL_37;
              }
              v35 = (_DWORD *)a1[3];
              v41 = v25;
              v34 = "Internal error initializing compression library:  Zlib error %d";
LABEL_36:
              v33 = v35;
LABEL_37:
              v40 = -1;
            }
            archive_set_error(v33, v40, v34, a4, a5, a6, a7, a8, v41);
            return -30;
          }
          v33 = (_DWORD *)a1[3];
          v34 = "Internal error initializing compression library: invalid library version";
          goto LABEL_37;
        }
        *(_BYTE *)(v12 + 112) = 1;
      }
      v26 = sub_1DB6E22F4(a1[2], 1uLL, &v42, a4, a5, a6, a7, a8);
      *(_QWORD *)v9 = v26;
      if (!v26)
      {
        v33 = (_DWORD *)a1[3];
        v34 = "truncated gzip input";
        goto LABEL_37;
      }
      v27 = v42;
      if ((v42 & 0x8000000000000000) != 0)
        return -30;
      if (HIDWORD(v42))
      {
        v42 = 0xFFFFFFFFLL;
        v27 = -1;
      }
      *(_DWORD *)(v9 + 8) = v27;
      v28 = (char *)inflate((z_streamp)v9, 0);
      if ((_DWORD)v28 == 1)
      {
        sub_1DB6E26F8(a1[2], v42 - *(unsigned int *)(v9 + 8), v29, a4, a5, a6, a7, a8);
        v32 = a1[11];
        *(_BYTE *)(v32 + 112) = 0;
        if (inflateEnd((z_streamp)v32))
        {
          v33 = (_DWORD *)a1[3];
          v34 = "Failed to clean up gzip decompressor";
          goto LABEL_37;
        }
        v43 = 0;
        if (!sub_1DB6E22F4(a1[2], 8uLL, &v43, a4, a5, a6, a7, a8) || !v43)
          return -30;
        v30 = a1[2];
        v31 = 8;
      }
      else
      {
        if ((_DWORD)v28)
        {
          v35 = (_DWORD *)a1[3];
          v41 = v28;
          v34 = "gzip decompression failed (zlib returned error %d, msg %s)";
          goto LABEL_36;
        }
        v30 = a1[2];
        v31 = v42 - *(unsigned int *)(v9 + 8);
      }
      sub_1DB6E26F8(v30, v31, v29, a4, a5, a6, a7, a8);
    }
    while (*(_DWORD *)(v9 + 32));
  }
  v36 = *(_QWORD *)(v9 + 24);
  v37 = *(_QWORD *)(v9 + 120);
  result = v36 - v37;
  *(_QWORD *)(v9 + 136) += v36 - v37;
  if (v36 == v37)
    v39 = 0;
  else
    v39 = v37;
  *a2 = v39;
  return result;
}

uint64_t sub_1DB74304C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v10;

  v1 = *(_QWORD *)(a1 + 88);
  if (*(_BYTE *)(v1 + 112) && inflateEnd(*(z_streamp *)(a1 + 88)))
  {
    archive_set_error(*(_DWORD **)(a1 + 24), -1, "Failed to clean up gzip compressor", v3, v4, v5, v6, v7, v10);
    v8 = 4294967266;
  }
  else
  {
    v8 = 0;
  }
  free(*(void **)(v1 + 160));
  free(*(void **)(v1 + 120));
  free((void *)v1);
  return v8;
}

uint64_t sub_1DB7430BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(unsigned int *)(v3 + 152);
  if ((_DWORD)v4)
    archive_entry_set_mtime(a2, v4, 0);
  v5 = *(char **)(v3 + 160);
  if (v5)
    archive_entry_set_pathname(a2, v5);
  return 0;
}

uint64_t archive_write_set_format_ustar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, "archive_write_set_format_ustar", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10)
      v10(a1);
    v11 = malloc_type_calloc(1uLL, 0x28uLL, 0x10200404DE2C876uLL);
    if (v11)
    {
      v17 = v11;
      result = 0;
      *(_QWORD *)(a1 + 264) = v17;
      *(_QWORD *)(a1 + 272) = "ustar";
      *(_QWORD *)(a1 + 304) = sub_1DB743298;
      *(_QWORD *)(a1 + 312) = sub_1DB7434CC;
      *(_QWORD *)(a1 + 320) = sub_1DB743514;
      *(_QWORD *)(a1 + 328) = sub_1DB74351C;
      *(_QWORD *)(a1 + 288) = sub_1DB7431F4;
      *(_QWORD *)(a1 + 296) = sub_1DB743548;
      *(_DWORD *)(a1 + 16) = 196609;
      *(_QWORD *)(a1 + 24) = "POSIX ustar";
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v12, v13, v14, v15, v16, v18);
      return 4294967266;
    }
  }
  return result;
}

uint64_t sub_1DB7431F4(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;

  v5 = *(_QWORD *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset"))
    return 4294967276;
  if (a3 && *a3)
  {
    v12 = sub_1DB72D08C(a1, a3, 0);
    *(_QWORD *)(v5 + 16) = v12;
    if (v12)
      return 0;
    else
      return 4294967266;
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_1DB743298(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v24;
  char *__dst;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 264);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 32))
    {
      v5 = *(_QWORD *)(v4 + 24);
    }
    else
    {
      v5 = sub_1DB6E54AC();
      *(_QWORD *)(v4 + 24) = v5;
      *(_DWORD *)(v4 + 32) = 1;
    }
  }
  if (!archive_entry_pathname(a2))
  {
    archive_set_error((_DWORD *)a1, -1, "Can't record entry in tar file without pathname", v6, v7, v8, v9, v10, v24);
    return 4294967271;
  }
  if (archive_entry_hardlink((uint64_t)a2)
    || archive_entry_symlink((uint64_t)a2)
    || archive_entry_filetype((uint64_t)a2) != 0x8000)
  {
    archive_entry_set_size((uint64_t)a2, 0);
  }
  if (archive_entry_filetype((uint64_t)a2) == 0x4000)
  {
    v11 = (const char *)archive_entry_pathname(a2);
    if (v11)
    {
      v12 = (char *)v11;
      if (*v11)
      {
        if (v11[strlen(v11) - 1] != 47)
        {
          __dst = 0;
          v26 = 0;
          v27 = 0;
          v13 = strlen(v12);
          if (!sub_1DB6E3190((void **)&__dst, v13 + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v14, v15, v16, v17, v18, v24);
            sub_1DB6E7C3C((uint64_t)&__dst);
            return 4294967266;
          }
          v26 = 0;
          sub_1DB6E323C((uint64_t *)&__dst, v12, v13);
          sub_1DB72CE60((uint64_t *)&__dst, 47);
          archive_entry_copy_pathname((uint64_t)a2, __dst);
          sub_1DB6E7C3C((uint64_t)&__dst);
        }
      }
    }
  }
  v19 = sub_1DB743574((_DWORD *)a1, (char *)&__dst, a2, -1, 1, v5);
  if ((int)v19 <= -21)
  {
LABEL_24:
    archive_entry_free(0);
    return v19;
  }
  v20 = sub_1DB7322A8(a1, (uint64_t)&__dst, 512);
  v21 = v20;
  if ((int)v20 > -21)
  {
    if ((int)v20 >= (int)v19)
      v19 = v19;
    else
      v19 = v20;
    v22 = archive_entry_size((uint64_t)a2);
    *(_QWORD *)v4 = v22;
    *(_QWORD *)(v4 + 8) = -(int)v22 & 0x1FFLL;
    goto LABEL_24;
  }
  archive_entry_free(0);
  return v21;
}

uint64_t sub_1DB7434CC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3)
    v4 = a3;
  else
    v4 = *v3;
  LODWORD(result) = sub_1DB7322A8(a1, a2, v4);
  *v3 -= v4;
  if ((_DWORD)result)
    return (int)result;
  else
    return v4;
}

uint64_t sub_1DB743514(_QWORD *a1)
{
  return sub_1DB732308(a1, 0x400uLL);
}

uint64_t sub_1DB74351C(uint64_t a1)
{
  free(*(void **)(a1 + 264));
  *(_QWORD *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_1DB743548(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t result;

  v1 = (_QWORD *)a1[33];
  result = sub_1DB732308(a1, v1[1] + *v1);
  *v1 = 0;
  v1[1] = 0;
  return result;
}

uint64_t sub_1DB743574(_DWORD *a1, char *__dst, uint64_t *a3, int a4, int a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  char *v25;
  char *v26;
  void *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  size_t v47;
  char v48;
  size_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  size_t v67;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  size_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  unint64_t v125;
  char v126;
  uint64_t v127;
  int32x4_t v128;
  int32x4_t v129;
  int32x4_t v130;
  int32x4_t v131;
  uint8x16_t v132;
  uint16x8_t v133;
  uint16x8_t v134;
  unint64_t v135;
  char *v136;
  unsigned int i;
  unint64_t v138;
  char *v139;
  void *__src;
  char *__s;
  size_t __n;

  __s = 0;
  __n = 0;
  __src = 0;
  memcpy(__dst, &unk_1DB7549D4, 0x200uLL);
  if (sub_1DB6E9040(a3, &__src, &__n, a6))
  {
    if (*__error() == 12)
    {
      v16 = "Can't allocate memory for Pathname";
LABEL_43:
      archive_set_error(a1, 12, v16, v11, v12, v13, v14, v15, v139);
      return 4294967266;
    }
    v18 = (char *)__src;
    sub_1DB72D0D4(a6);
    archive_set_error(a1, 79, "Can't translate pathname '%s' to %s", v19, v20, v21, v22, v23, v18);
    v17 = 4294967276;
  }
  else
  {
    v17 = 0;
  }
  v24 = __n;
  v25 = (char *)__src;
  if (__n <= 0x64)
  {
    v26 = __dst;
    v27 = __src;
LABEL_8:
    memcpy(v26, v27, v24);
    goto LABEL_16;
  }
  v28 = (char *)__src + __n;
  v29 = strchr((char *)__src + __n - 101, 47);
  v35 = v29;
  __s = v29;
  if (v29 == v25)
  {
    v35 = strchr(v25 + 1, 47);
    __s = v35;
    if (!v35)
      goto LABEL_15;
  }
  else if (!v29)
  {
    goto LABEL_15;
  }
  if (v35[1] && v35 <= v25 + 155)
  {
    memcpy(__dst + 345, v25, v35 - v25);
    v24 = (size_t)&v28[~(unint64_t)v35];
    v26 = __dst;
    v27 = v35 + 1;
    goto LABEL_8;
  }
LABEL_15:
  archive_set_error(a1, 63, "Pathname too long", v30, v31, v32, v33, v34, v139);
  v17 = 4294967271;
LABEL_16:
  if (sub_1DB6E8FCC((uint64_t)a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
LABEL_23:
      v16 = "Can't allocate memory for Linkname";
      goto LABEL_43;
    }
    v41 = __s;
    sub_1DB72D0D4(a6);
    archive_set_error(a1, 79, "Can't translate linkname '%s' to %s", v42, v43, v44, v45, v46, v41);
    v17 = 4294967276;
  }
  v47 = __n;
  if (!__n)
  {
    if (sub_1DB6E922C((uint64_t)a3, &__s, &__n, a6))
    {
      if (*__error() == 12)
        goto LABEL_23;
      v50 = __s;
      sub_1DB72D0D4(a6);
      archive_set_error(a1, 79, "Can't translate linkname '%s' to %s", v51, v52, v53, v54, v55, v50);
      v17 = 4294967276;
    }
    v49 = __n;
    v48 = -1;
    if (!__n)
      goto LABEL_30;
    goto LABEL_27;
  }
  v48 = 49;
  v49 = __n;
LABEL_27:
  if (v49 >= 0x65)
  {
    archive_set_error(a1, 63, "Link contents too long", v36, v37, v38, v39, v40, v139);
    v49 = 100;
    __n = 100;
    v17 = 4294967271;
  }
  memcpy(__dst + 157, __s, v49);
LABEL_30:
  if (sub_1DB6E9388(a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
      v16 = "Can't allocate memory for Uname";
      goto LABEL_43;
    }
    v61 = __s;
    sub_1DB72D0D4(a6);
    archive_set_error(a1, 79, "Can't translate uname '%s' to %s", v62, v63, v64, v65, v66, v61);
    v17 = 4294967276;
  }
  v67 = __n;
  if (__n)
  {
    if (__n >= 0x21)
    {
      if (a4 != 120)
      {
        archive_set_error(a1, -1, "Username too long", v56, v57, v58, v59, v60, v139);
        v17 = 4294967271;
      }
      v67 = 32;
      __n = 32;
    }
    memcpy(__dst + 265, __s, v67);
  }
  if (sub_1DB6E8EE0(a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
      v16 = "Can't allocate memory for Gname";
      goto LABEL_43;
    }
    v69 = __s;
    sub_1DB72D0D4(a6);
    archive_set_error(a1, 79, "Can't translate gname '%s' to %s", v70, v71, v72, v73, v74, v69);
    v17 = 4294967276;
  }
  v75 = __n;
  if (__n)
  {
    v76 = __s;
    if (strlen(__s) >= 0x21)
    {
      if (a4 != 120)
      {
        archive_set_error(a1, -1, "Group name too long", v77, v78, v79, v80, v81, v139);
        v17 = 4294967271;
        v76 = __s;
      }
      v75 = 32;
      __n = 32;
    }
    memcpy(__dst + 297, v76, v75);
  }
  v82 = archive_entry_mode((uint64_t)a3);
  if (sub_1DB743C54(v82 & 0xFFF, __dst + 100, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric mode too large", v83, v84, v85, v86, v87, v139);
    v17 = 4294967271;
  }
  v88 = archive_entry_uid((uint64_t)a3);
  if (sub_1DB743C54(v88, __dst + 108, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric user ID too large", v89, v90, v91, v92, v93, v139);
    v17 = 4294967271;
  }
  v94 = archive_entry_gid((uint64_t)a3);
  if (sub_1DB743C54(v94, __dst + 116, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric group ID too large", v95, v96, v97, v98, v99, v139);
    v17 = 4294967271;
  }
  v100 = archive_entry_size((uint64_t)a3);
  if (sub_1DB743C54(v100, __dst + 124, 0xBuLL, 12, a5))
  {
    archive_set_error(a1, 34, "File size out of range", v101, v102, v103, v104, v105, v139);
    v17 = 4294967271;
  }
  v106 = archive_entry_mtime((uint64_t)a3);
  if (sub_1DB743C54(v106, __dst + 136, 0xBuLL, 11, a5))
  {
    archive_set_error(a1, 34, "File modification time too large", v107, v108, v109, v110, v111, v139);
    v17 = 4294967271;
  }
  if (archive_entry_filetype((uint64_t)a3) == 24576
    || archive_entry_filetype((uint64_t)a3) == 0x2000)
  {
    v112 = archive_entry_rdevmajor((uint64_t)a3);
    if (sub_1DB743C54(v112, __dst + 329, 6uLL, 8, a5))
    {
      archive_set_error(a1, 34, "Major device number too large", v113, v114, v115, v116, v117, v139);
      v17 = 4294967271;
    }
    v118 = archive_entry_rdevminor(a3);
    v124 = a4;
    if (sub_1DB743C54(v118, __dst + 337, 6uLL, 8, a5))
    {
      archive_set_error(a1, 34, "Minor device number too large", v119, v120, v121, v122, v123, v139);
      v17 = 4294967271;
    }
    if ((a4 & 0x80000000) == 0)
      goto LABEL_69;
LABEL_71:
    if (v47)
    {
      __dst[156] = v48;
    }
    else
    {
      HIDWORD(v125) = archive_entry_filetype((uint64_t)a3);
      LODWORD(v125) = HIDWORD(v125) - 4096;
      switch((v125 >> 12))
      {
        case 0u:
          v126 = 54;
          goto LABEL_81;
        case 1u:
          v126 = 51;
          goto LABEL_81;
        case 3u:
          v126 = 53;
          goto LABEL_81;
        case 5u:
          v126 = 52;
          goto LABEL_81;
        case 7u:
          v126 = 48;
          goto LABEL_81;
        case 9u:
          v126 = 50;
LABEL_81:
          __dst[156] = v126;
          break;
        default:
          sub_1DB7355D0(a1, a3);
          v17 = 4294967271;
          break;
      }
    }
    goto LABEL_82;
  }
  v124 = a4;
  if (a4 < 0)
    goto LABEL_71;
LABEL_69:
  __dst[156] = v124;
LABEL_82:
  v127 = 0;
  v128 = 0uLL;
  v129 = 0uLL;
  v130 = 0uLL;
  v131 = 0uLL;
  do
  {
    v132 = *(uint8x16_t *)&__dst[v127];
    v133 = vmovl_u8(*(uint8x8_t *)v132.i8);
    v134 = vmovl_high_u8(v132);
    v131 = (int32x4_t)vaddw_high_u16((uint32x4_t)v131, v134);
    v130 = (int32x4_t)vaddw_u16((uint32x4_t)v130, *(uint16x4_t *)v134.i8);
    v129 = (int32x4_t)vaddw_high_u16((uint32x4_t)v129, v133);
    v128 = (int32x4_t)vaddw_u16((uint32x4_t)v128, *(uint16x4_t *)v133.i8);
    v127 += 16;
  }
  while (v127 != 512);
  v135 = vaddvq_s32(vaddq_s32(vaddq_s32(v128, v130), vaddq_s32(v129, v131)));
  __dst[154] = 0;
  v136 = __dst + 154;
  for (i = 7; i > 1; --i)
  {
    v138 = v135;
    *--v136 = v135 & 7 | 0x30;
    v135 >>= 3;
  }
  if (v138 >= 8)
  {
    *((_WORD *)v136 + 2) = 14135;
    *(_DWORD *)v136 = 926365495;
  }
  return v17;
}

uint64_t sub_1DB743C54(int64_t a1, char *a2, size_t a3, int a4, int a5)
{
  uint64_t v6;
  char *v7;
  unsigned int v8;
  char v9;

  if (a5)
    return sub_1DB743CD0(a1, a2, a3);
  if ((a1 & 0x8000000000000000) == 0 && (int)a3 <= a4)
  {
    v6 = 1 << (3 * a3);
    while (v6 <= a1)
    {
      a3 = (a3 + 1);
      v6 *= 8;
      if (a4 + 1 == (_DWORD)a3)
        goto LABEL_8;
    }
    return sub_1DB743CD0(a1, a2, a3);
  }
LABEL_8:
  v7 = &a2[a4];
  if (a4 < 1)
  {
    v9 = *v7;
  }
  else
  {
    v8 = a4 + 1;
    do
    {
      v9 = a1;
      *--v7 = a1;
      a1 >>= 8;
      --v8;
    }
    while (v8 > 1);
  }
  *v7 = v9 | 0x80;
  return 0;
}

uint64_t sub_1DB743CD0(unint64_t a1, char *__b, size_t __len)
{
  unint64_t v3;
  char *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  int v8;

  if ((a1 & 0x8000000000000000) != 0)
  {
    if ((int)__len < 1)
      return 0xFFFFFFFFLL;
    __len = __len;
    v4 = __b;
    v8 = 48;
LABEL_12:
    memset(v4, v8, __len);
    return 0xFFFFFFFFLL;
  }
  v3 = a1;
  if ((int)__len < 1)
  {
    if (a1)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    v4 = &__b[(int)__len];
    v5 = __len + 1;
    do
    {
      v6 = v3;
      *--v4 = v3 & 7 | 0x30;
      v3 >>= 3;
      --v5;
    }
    while (v5 > 1);
    if (v6 <= 7)
      v7 = 0;
    else
      v7 = 0xFFFFFFFFLL;
    if (v6 >= 8)
    {
      __len = __len;
      v8 = 55;
      goto LABEL_12;
    }
  }
  return v7;
}

void *sub_1DB743D68(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  result = *(void **)(a1 + 2480);
  if (!result)
  {
    result = malloc_type_calloc(1uLL, 0x18uLL, 0xA00402214FCE6uLL);
    *(_QWORD *)(a1 + 2480) = result;
    if (result)
    {
      *(_QWORD *)(a1 + 2488) = sub_1DB743DD8;
    }
    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't extract", v3, v4, v5, v6, v7, v8);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1DB743DD8(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = *(uint64_t **)(a1 + 2480);
  if (*v2)
  {
    v3 = archive_write_free(*v2);
    v2 = *(uint64_t **)(a1 + 2480);
  }
  else
  {
    v3 = 0;
  }
  free(v2);
  *(_QWORD *)(a1 + 2480) = 0;
  return v3;
}

uint64_t archive_read_extract2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11;
  int v12;
  int v13;
  int v14;
  _QWORD *v16;
  _QWORD *v17;
  int data_block;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void (*v24)(_QWORD);
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (*(_DWORD *)(a1 + 168))
    archive_write_disk_set_skip_file(a3, *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), a4, a5, a6, a7, a8);
  v11 = archive_write_header(a3);
  if (v11 <= -20)
    v12 = -20;
  else
    v12 = v11;
  if (v12)
  {
    archive_copy_error(a1, a3);
  }
  else if (archive_entry_size_is_set(a2) && archive_entry_size(a2) < 1)
  {
    v12 = 0;
  }
  else
  {
    v16 = sub_1DB743D68(a1);
    if (v16)
    {
      v17 = v16;
      while (1)
      {
        data_block = archive_read_data_block(a1);
        if (data_block)
          break;
        v23 = archive_write_data_block(a3, 0, 0, 0, v19, v20, v21, v22);
        if (v23 <= -20)
          v12 = -20;
        else
          v12 = v23;
        if (v12 < 0)
        {
          v25 = archive_errno(a3);
          v26 = archive_error_string(a3);
          archive_set_error((_DWORD *)a1, v25, "%s", v27, v28, v29, v30, v31, v26);
          goto LABEL_8;
        }
        v24 = (void (*)(_QWORD))v17[1];
        if (v24)
          v24(v17[2]);
      }
      if (data_block == 1)
        v12 = 0;
      else
        v12 = data_block;
    }
    else
    {
      v12 = -30;
    }
  }
LABEL_8:
  v13 = archive_write_finish_entry(a3);
  if (v13 <= -20)
    v14 = -20;
  else
    v14 = v13;
  if (!v12 && v14)
    archive_copy_error(a1, a3);
  if (v14 >= v12)
    return v12;
  else
    return v14;
}

_QWORD *archive_read_extract_set_progress_callback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = sub_1DB743D68(a1);
  if (result)
  {
    result[1] = a2;
    result[2] = a3;
  }
  return result;
}

uint64_t archive_write_set_format_filter_by_ext(_DWORD *a1, char *__s)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t result;

  v4 = sub_1DB744070(__s);
  if ((v4 & 0x80000000) != 0)
  {
    archive_set_error(a1, 22, "No such format '%s'", v5, v6, v7, v8, v9, __s);
    a1[1] = 0x8000;
    return 4294967266;
  }
  else
  {
    v10 = v4;
    result = ((uint64_t (*)(_DWORD *))(&off_1EA321DB0)[3 * v4 + 1])(a1);
    if (!(_DWORD)result)
      return ((uint64_t (*)(_DWORD *))(&off_1EA321DB0)[3 * v10 + 2])(a1);
  }
  return result;
}

uint64_t sub_1DB744070(char *__s)
{
  uint64_t v2;
  const char *v3;
  char **i;
  size_t v5;
  size_t v6;
  char *v7;

  v2 = 0;
  v3 = ".7z";
  for (i = &off_1EA321DC8; ; i += 3)
  {
    if (__s)
    {
      v5 = strlen(__s);
      v6 = strlen(v3);
      if (v5 >= v6 && !strcmp(&__s[v5 - v6], v3))
        break;
    }
    ++v2;
    v7 = *i;
    v3 = v7;
    if (v2 == 12)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t archive_write_set_format_filter_by_ext_def(_DWORD *a1, char *__s, char *a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v6 = sub_1DB744070(__s);
  if ((v6 & 0x80000000) != 0 && (v6 = sub_1DB744070(a3), (v6 & 0x80000000) != 0))
  {
    archive_set_error(a1, 22, "No such format '%s'", v7, v8, v9, v10, v11, __s);
    a1[1] = 0x8000;
    return 4294967266;
  }
  else
  {
    result = ((uint64_t (*)(_DWORD *))(&off_1EA321DB0)[3 * v6 + 1])(a1);
    if (!(_DWORD)result)
      return ((uint64_t (*)(_DWORD *))(&off_1EA321DB0)[3 * v6 + 2])(a1);
  }
  return result;
}

uint64_t archive_write_set_compression_none()
{
  return 0;
}

uint64_t archive_write_add_filter_none()
{
  return 0;
}

uint64_t archive_write_zip_set_compression_deflate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;

  result = sub_1DB6E0594((int *)a1, -1329217314, 7, "archive_write_zip_set_compression_deflate", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    if (*(_DWORD *)(a1 + 16) == 327680)
    {
      result = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 264) + 656) = 8;
    }
    else
    {
      archive_set_error((_DWORD *)a1, -1, "Can only use archive_write_zip_set_compression_deflate with zip format", v10, v11, v12, v13, v14, v15);
      return 4294967266;
    }
  }
  return result;
}

uint64_t archive_write_zip_set_compression_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v9 = *(_QWORD *)(a1 + 264);
  result = sub_1DB6E0594((int *)a1, -1329217314, 7, "archive_write_zip_set_compression_deflate", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    if (*(_DWORD *)(a1 + 16) == 327680)
    {
      result = 0;
      *(_DWORD *)(v9 + 656) = 0;
    }
    else
    {
      archive_set_error((_DWORD *)a1, -1, "Can only use archive_write_zip_set_compression_store with zip format", v11, v12, v13, v14, v15, v16);
      return 4294967266;
    }
  }
  return result;
}

uint64_t archive_write_set_format_zip(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void (*v10)(uint64_t);
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  char *v19;
  char *v20;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, "archive_write_set_format_zip", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10)
      v10(a1);
    v11 = malloc_type_calloc(1uLL, 0x328uLL, 0x10B0040F059636CuLL);
    if (v11)
    {
      v17 = v11;
      v11[82] = -1;
      v11[74] = j__crc32_0;
      v11[99] = 0x10000;
      v18 = malloc_type_malloc(0x10000uLL, 0xFD82B85BuLL);
      v17[100] = v18;
      if (v18)
      {
        result = 0;
        *(_QWORD *)(a1 + 264) = v17;
        *(_QWORD *)(a1 + 272) = "zip";
        *(_QWORD *)(a1 + 304) = sub_1DB744748;
        *(_QWORD *)(a1 + 312) = sub_1DB7452B4;
        *(_QWORD *)(a1 + 288) = sub_1DB7443E4;
        *(_QWORD *)(a1 + 296) = sub_1DB745860;
        *(_QWORD *)(a1 + 320) = sub_1DB745CC8;
        *(_QWORD *)(a1 + 328) = sub_1DB745FD4;
        *(_DWORD *)(a1 + 16) = 327680;
        *(_QWORD *)(a1 + 24) = "ZIP";
        return result;
      }
      free(v17);
      v19 = "Can't allocate compression buffer";
    }
    else
    {
      v19 = "Can't allocate zip data";
    }
    archive_set_error((_DWORD *)a1, 12, v19, v12, v13, v14, v15, v16, v20);
    return 4294967266;
  }
  return result;
}

uint64_t sub_1DB7443E4(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v6;
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
  uint64_t result;
  unsigned int v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  int v28;
  int v29;
  char *v30;
  _BYTE v31[12];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 264);
  if (!strcmp(__s1, "compression"))
  {
    if (!a3 || !*a3)
    {
      v30 = *(char **)(a1 + 272);
      v20 = "%s: compression option needs a compression name";
LABEL_21:
      archive_set_error((_DWORD *)a1, -1, v20, v7, v8, v9, v10, v11, v30);
      return 4294967271;
    }
    result = strcmp(a3, "deflate");
    if (!(_DWORD)result)
    {
      *(_DWORD *)(v6 + 656) = 8;
      return result;
    }
    result = strcmp(a3, "store");
    if ((_DWORD)result)
      return 4294967271;
LABEL_53:
    *(_DWORD *)(v6 + 656) = 0;
    return result;
  }
  if (!strcmp(__s1, "compression-level"))
  {
    if (!a3)
      return 4294967276;
    v19 = *a3;
    if ((v19 - 48) > 9 || a3[1])
      return 4294967276;
    if (v19 != 48)
    {
      result = 0;
      *(_DWORD *)(v6 + 656) = 8;
      *(_DWORD *)(v6 + 660) = *a3 - 48;
      return result;
    }
    result = 0;
    goto LABEL_53;
  }
  if (!strcmp(__s1, "encryption"))
  {
    if (!a3)
    {
      result = 0;
      *(_DWORD *)(v6 + 668) = 0;
      return result;
    }
    if (*a3 == 49 || !strcmp(a3, "traditional") || !strcmp(a3, "zipcrypt") || !strcmp(a3, "ZipCrypt"))
    {
      result = sub_1DB746CE8(v31, 0xBuLL);
      if (!(_DWORD)result)
      {
        *(_DWORD *)(v6 + 668) = 1;
        return result;
      }
    }
    else
    {
      if (!strcmp(a3, "aes128"))
      {
        v28 = 2;
        v29 = 2;
      }
      else
      {
        if (strcmp(a3, "aes256"))
        {
          archive_set_error((_DWORD *)a1, -1, "%s: unknown encryption '%s'", v21, v22, v23, v24, v25, *(char **)(a1 + 272));
          return 4294967271;
        }
        v28 = 3;
        v29 = 3;
      }
      if (sub_1DB746078(v29))
      {
        result = 0;
        *(_DWORD *)(v6 + 668) = v28;
        return result;
      }
    }
    v20 = "encryption not supported";
    goto LABEL_21;
  }
  if (!strcmp(__s1, "experimental"))
  {
    if (a3 && *a3)
    {
      result = 0;
      v18 = *(_DWORD *)(v6 + 672) | 4;
    }
    else
    {
      result = 0;
      v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFB;
    }
    goto LABEL_40;
  }
  if (strcmp(__s1, "fakecrc32"))
  {
    if (strcmp(__s1, "hdrcharset"))
    {
      if (!strcmp(__s1, "zip64"))
      {
        if (a3 && *a3)
        {
          result = 0;
          v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFC | 2;
        }
        else
        {
          result = 0;
          v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFC | 1;
        }
LABEL_40:
        *(_DWORD *)(v6 + 672) = v18;
        return result;
      }
      return 4294967276;
    }
    if (a3 && *a3)
    {
      v27 = sub_1DB72D08C(a1, a3, 0);
      *(_QWORD *)(v6 + 640) = v27;
      if (v27)
        return 0;
      else
        return 4294967266;
    }
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v12, v13, v14, v15, v16, *(char **)(a1 + 272));
    return 4294967271;
  }
  if (a3 && *a3)
  {
    result = 0;
    v26 = sub_1DB7461D8;
  }
  else
  {
    result = 0;
    v26 = j__crc32_0;
  }
  *(_QWORD *)(v6 + 592) = v26;
  return result;
}

uint64_t sub_1DB744748(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  int v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  int v32;
  uint64_t v33;
  const char *v34;
  uint64_t *v35;
  int v36;
  const char *v37;
  const char *v38;
  size_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  size_t v43;
  uint64_t v44;
  int v45;
  __int16 v46;
  unsigned int v47;
  int v48;
  char v49;
  time_t v50;
  int v51;
  unsigned int v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unsigned int v57;
  _OWORD *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  time_t v64;
  uint64_t v65;
  __int16 v66;
  _QWORD *v67;
  uint64_t *v68;
  const char *v69;
  size_t v70;
  int is_set;
  char v72;
  char v73;
  BOOL v74;
  char v75;
  _BYTE *v76;
  _BYTE *v77;
  int v78;
  char v79;
  _QWORD *v80;
  __int16 v81;
  uint64_t v82;
  uint64_t *v84;
  const char *v85;
  int v86;
  int v87;
  size_t v88;
  size_t v89;
  int v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  BOOL v94;
  char *v95;
  uint64_t v96;
  _BYTE __src[18];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _WORD v104[15];
  uint64_t v105;
  char v106;
  char v107;
  int v108;
  _BYTE v109[10];
  uint64_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 264);
  v5 = *(_QWORD *)(v4 + 640);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 664))
    {
      v5 = *(_QWORD *)(v4 + 648);
    }
    else
    {
      v5 = sub_1DB6E54AC();
      *(_QWORD *)(v4 + 648) = v5;
      *(_DWORD *)(v4 + 664) = 1;
    }
  }
  v6 = archive_entry_filetype((uint64_t)a2);
  v7 = v6;
  if (v6 != 0x4000 && v6 != 0x8000 && v6 != 40960)
  {
    sub_1DB7355D0((_DWORD *)a1, a2);
    return 4294967271;
  }
  if ((*(_BYTE *)(v4 + 672) & 1) != 0)
  {
    if (archive_entry_size_is_set((uint64_t)a2) && archive_entry_size((uint64_t)a2) >= 0x100000000)
    {
      v13 = "Files > 4GB require Zip64 extensions";
LABEL_14:
      archive_set_error((_DWORD *)a1, -1, v13, v8, v9, v10, v11, v12, v95);
      return 4294967271;
    }
    if (*(uint64_t *)(v4 + 632) >= 0x100000000)
    {
      v13 = "Archives > 4GB require Zip64 extensions";
      goto LABEL_14;
    }
  }
  if (v7 != 0x8000)
    archive_entry_set_size((uint64_t)a2, 0);
  *(_QWORD *)v4 = *(_QWORD *)(v4 + 632);
  *(_QWORD *)(v4 + 40) = 0x7FFFFFFFFFFFFFFFLL;
  *(_OWORD *)(v4 + 8) = 0u;
  v14 = (uint64_t *)(v4 + 8);
  *(_DWORD *)(v4 + 68) = 0;
  *(_DWORD *)(v4 + 72) = 0;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_DWORD *)(v4 + 56) = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v4 + 592))(0, 0, 0);
  *(_DWORD *)(v4 + 64) = 0;
  archive_entry_free(*(void ***)(v4 + 48));
  *(_QWORD *)(v4 + 48) = 0;
  if (*(_BYTE *)(v4 + 184))
    sub_1DB6E8A6C(v4 + 104);
  if (*(_BYTE *)(v4 + 572))
    sub_1DB70C920((_OWORD *)(v4 + 188));
  *(_BYTE *)(v4 + 572) = 0;
  *(_BYTE *)(v4 + 184) = 0;
  *(_BYTE *)(v4 + 92) = 0;
  if (v7 == 0x8000 && (!archive_entry_size_is_set((uint64_t)a2) || archive_entry_size((uint64_t)a2) >= 1))
  {
    v15 = *(_DWORD *)(v4 + 668);
    if ((v15 - 1) <= 2)
    {
      v16 = *(_DWORD *)(v4 + 68) | 1;
      *(_DWORD *)(v4 + 64) = v15;
      *(_DWORD *)(v4 + 68) = v16;
    }
  }
  v17 = (uint64_t *)archive_entry_clone(a2);
  *(_QWORD *)(v4 + 48) = v17;
  if (!v17)
  {
    v23 = "Can't allocate zip header data";
    goto LABEL_34;
  }
  if (v5)
  {
    *(_QWORD *)__src = 0;
    v105 = 0;
    if (sub_1DB6E9040(a2, __src, &v105, v5))
    {
      if (*__error() == 12)
      {
        v23 = "Can't allocate memory for Pathname";
LABEL_34:
        archive_set_error((_DWORD *)a1, 12, v23, v18, v19, v20, v21, v22, v95);
        return 4294967266;
      }
      v25 = (char *)archive_entry_pathname(a2);
      sub_1DB72D0D4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate Pathname '%s' to %s", v26, v27, v28, v29, v30, v25);
      v24 = 4294967276;
    }
    else
    {
      v24 = 0;
    }
    if (v105)
      archive_entry_set_pathname(*(_QWORD *)(v4 + 48), *(char **)__src);
    if (v7 == 40960)
    {
      if (sub_1DB6E922C((uint64_t)a2, __src, &v105, v5))
      {
        if (*__error() == 12)
        {
          v23 = "Can't allocate memory  for Symlink";
          goto LABEL_34;
        }
      }
      else if (v105)
      {
        archive_entry_set_symlink(*(_QWORD *)(v4 + 48), *(char **)__src);
      }
    }
    v17 = *(uint64_t **)(v4 + 48);
  }
  else
  {
    v24 = 0;
  }
  v31 = (_BYTE *)archive_entry_pathname(v17);
  while (1)
  {
    v32 = (char)*v31;
    if (!*v31)
      break;
    ++v31;
    if (v32 < 0)
    {
      v33 = *(_QWORD *)(v4 + 640);
      if (v33)
        v34 = (const char *)sub_1DB72D0D4(v33);
      else
        v34 = nl_langinfo(0);
      if (!strcmp(v34, "UTF-8"))
        *(_DWORD *)(v4 + 68) |= 0x800u;
      break;
    }
  }
  v35 = *(uint64_t **)(v4 + 48);
  v36 = archive_entry_filetype((uint64_t)v35);
  v37 = (const char *)archive_entry_pathname(v35);
  if (v37)
  {
    v38 = v37;
    v39 = strlen(v37);
    v40 = v39;
    if (v36 == 0x4000 && (!*v38 || v38[v39 - 1] != 47))
      v40 = v39 + 1;
  }
  else
  {
    v40 = 0;
  }
  if (v7 == 40960)
  {
    v41 = (const char *)archive_entry_symlink(*(_QWORD *)(v4 + 48));
    v42 = v41;
    if (v41)
      v43 = strlen(v41);
    else
      v43 = 0;
    *(_QWORD *)(v4 + 40) = v43;
    *(_QWORD *)(v4 + 8) = v43;
    *(_QWORD *)(v4 + 16) = v43;
    v47 = (*(uint64_t (**)(_QWORD, const char *, size_t))(v4 + 592))(*(unsigned int *)(v4 + 56), v42, v43);
    LOWORD(v45) = 0;
    *(_QWORD *)(v4 + 56) = v47;
    goto LABEL_75;
  }
  if (v7 != 0x8000)
  {
    LOWORD(v45) = 0;
    v42 = 0;
    v43 = 0;
    *(_DWORD *)(v4 + 60) = 0;
    *(_QWORD *)(v4 + 40) = 0;
    goto LABEL_75;
  }
  if (!archive_entry_size_is_set(*(_QWORD *)(v4 + 48)))
  {
    LOWORD(v45) = 8;
    *(_DWORD *)(v4 + 60) = 8;
    *(_DWORD *)(v4 + 68) |= 8u;
    if ((*(_BYTE *)(v4 + 672) & 1) == 0)
    {
      v42 = 0;
      v43 = 0;
      *(_DWORD *)(v4 + 72) = 1;
      v46 = 45;
      LOWORD(v45) = 8;
      goto LABEL_76;
    }
    v42 = 0;
    v43 = 0;
LABEL_75:
    v46 = 20;
    goto LABEL_76;
  }
  v44 = archive_entry_size(*(_QWORD *)(v4 + 48));
  *(_QWORD *)(v4 + 40) = v44;
  v45 = *(_DWORD *)(v4 + 656);
  if (v45 == -1)
    v45 = 8;
  if (!v44)
    v45 = 0;
  *(_DWORD *)(v4 + 60) = v45;
  if (v45)
  {
    v46 = 20;
  }
  else
  {
    *v14 = v44;
    v46 = 10;
  }
  *(_QWORD *)(v4 + 16) = v44;
  v92 = *(_DWORD *)(v4 + 68);
  if ((v92 & 1) != 0)
  {
    if ((*(_DWORD *)(v4 + 64) - 1) >= 3)
    {
      v93 = 0;
    }
    else
    {
      v46 = 20;
      v93 = 8 * (*(_DWORD *)(v4 + 64) - 1) + 12;
    }
    if (!v45)
      *v14 += v93;
  }
  else
  {
    v93 = 0;
  }
  if (v45)
    v94 = v44 <= 4278190080;
  else
    v94 = 1;
  if (!v94 || (*(_DWORD *)(v4 + 672) & 2) != 0 || v93 + v44 >= 0x100000000)
  {
    *(_DWORD *)(v4 + 72) = 1;
    v46 = 45;
  }
  v42 = 0;
  v43 = 0;
  *(_DWORD *)(v4 + 68) = v92 | 8;
LABEL_76:
  *(_QWORD *)&v109[2] = 0;
  v110 = 0;
  LODWORD(v105) = 67324752;
  WORD2(v105) = v46;
  v48 = *(_DWORD *)(v4 + 64);
  HIWORD(v105) = *(_DWORD *)(v4 + 68);
  if ((v48 & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v45) = 99;
    v49 = 0;
  }
  else
  {
    v49 = BYTE1(v45);
  }
  v106 = v45;
  v107 = v49;
  v50 = archive_entry_mtime(*(_QWORD *)(v4 + 48));
  v51 = sub_1DB7461E0(v50);
  v108 = v51;
  v52 = *(_DWORD *)(v4 + 56);
  *(_DWORD *)v109 = v52;
  v96 = (uint64_t)v42;
  if (*(_DWORD *)(v4 + 72))
  {
    *(_DWORD *)&v109[4] = -1;
    LOBYTE(v53) = -1;
    LOBYTE(v54) = -1;
    LOBYTE(v55) = -1;
    LOBYTE(v56) = -1;
  }
  else
  {
    *(_DWORD *)&v109[4] = *(_QWORD *)(v4 + 8);
    v53 = *(_QWORD *)(v4 + 16);
    v54 = v53 >> 8;
    v55 = v53 >> 16;
    v56 = v53 >> 24;
  }
  v109[8] = v53;
  v109[9] = v54;
  LOBYTE(v110) = v55;
  BYTE1(v110) = v56;
  WORD1(v110) = v40;
  if (*(_DWORD *)(v4 + 64) == 1)
  {
    v57 = HIBYTE(v52);
    if ((*(_DWORD *)(v4 + 68) & 8) != 0)
      LOBYTE(v57) = BYTE1(v51);
    *(_BYTE *)(v4 + 93) = v57;
  }
  v58 = sub_1DB746278((_QWORD *)v4, 46);
  *(_QWORD *)(v4 + 576) = v58;
  ++*(_QWORD *)(v4 + 624);
  *v58 = 0u;
  v58[1] = 0u;
  *(_OWORD *)((char *)v58 + 30) = 0u;
  **(_DWORD **)(v4 + 576) = 33639248;
  v59 = *(_QWORD *)(v4 + 576);
  *(_BYTE *)(v59 + 4) = v46;
  *(_BYTE *)(v59 + 5) = 3;
  *(_WORD *)(*(_QWORD *)(v4 + 576) + 6) = v46;
  *(_WORD *)(*(_QWORD *)(v4 + 576) + 8) = *(_DWORD *)(v4 + 68);
  v60 = *(_QWORD *)(v4 + 576);
  if ((*(_DWORD *)(v4 + 64) & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v61) = 0;
    *(_BYTE *)(v60 + 10) = 99;
  }
  else
  {
    v62 = *(_DWORD *)(v4 + 60);
    *(_BYTE *)(v60 + 10) = v62;
    v61 = v62 >> 8;
  }
  *(_BYTE *)(v60 + 11) = v61;
  v63 = *(_QWORD *)(v4 + 576);
  v64 = archive_entry_mtime(*(_QWORD *)(v4 + 48));
  *(_DWORD *)(v63 + 12) = sub_1DB7461E0(v64);
  *(_WORD *)(*(_QWORD *)(v4 + 576) + 28) = v40;
  v65 = *(_QWORD *)(v4 + 576);
  v66 = archive_entry_mode(*(_QWORD *)(v4 + 48));
  *(_WORD *)(v65 + 38) = 0;
  *(_WORD *)(v65 + 40) = v66;
  v67 = sub_1DB746278((_QWORD *)v4, v40);
  v68 = *(uint64_t **)(v4 + 48);
  v69 = (const char *)archive_entry_pathname(v68);
  v70 = strlen(v69);
  LODWORD(v68) = archive_entry_filetype((uint64_t)v68);
  memcpy(v67, v69, v70);
  if ((_DWORD)v68 == 0x4000 && v69[v70 - 1] != 47)
    *((_BYTE *)v67 + v70) = 47;
  memset(v104, 0, sizeof(v104));
  v103 = 0u;
  v102 = 0u;
  v101 = 0u;
  v100 = 0u;
  v99 = 0u;
  v98 = 0u;
  *(_OWORD *)&__src[2] = 0u;
  *(_WORD *)__src = 21589;
  is_set = archive_entry_mtime_is_set((uint64_t)a2);
  v72 = 4 * (archive_entry_atime_is_set((uint64_t)a2) != 0);
  if (is_set)
    v73 = v72 + 5;
  else
    v73 = v72 + 1;
  *(_WORD *)&__src[2] = (v73 + 4 * (archive_entry_ctime_is_set((uint64_t)a2) != 0));
  v74 = archive_entry_mtime_is_set((uint64_t)a2) != 0;
  v75 = v74 | (2 * (archive_entry_atime_is_set((uint64_t)a2) != 0));
  __src[4] = v75 | (4 * (archive_entry_ctime_is_set((uint64_t)a2) != 0));
  if (archive_entry_mtime_is_set((uint64_t)a2))
  {
    *(_DWORD *)&__src[5] = archive_entry_mtime((uint64_t)a2);
    v76 = &__src[9];
  }
  else
  {
    v76 = &__src[5];
  }
  if (archive_entry_atime_is_set((uint64_t)a2))
  {
    *(_DWORD *)v76 = archive_entry_atime((uint64_t)a2);
    v76 += 4;
  }
  if (archive_entry_ctime_is_set((uint64_t)a2))
  {
    *(_DWORD *)v76 = archive_entry_ctime((uint64_t)a2);
    v76 += 4;
  }
  *(_DWORD *)v76 = 751733;
  *((_WORD *)v76 + 2) = 1025;
  *(_DWORD *)(v76 + 6) = archive_entry_uid((uint64_t)a2);
  v76[10] = 4;
  *(_DWORD *)(v76 + 11) = archive_entry_gid((uint64_t)a2);
  v77 = v76 + 15;
  if ((*(_BYTE *)(v4 + 68) & 1) != 0 && (*(_DWORD *)(v4 + 64) & 0xFFFFFFFE) == 2)
  {
    *(_QWORD *)v77 = 0x4541000100079901;
    if (archive_entry_size_is_set(*(_QWORD *)(v4 + 48)) && archive_entry_size(*(_QWORD *)(v4 + 48)) <= 19)
    {
      v78 = 2;
      *(_WORD *)(v76 + 19) = 2;
    }
    else
    {
      v78 = 1;
    }
    *(_DWORD *)(v4 + 96) = v78;
    if (*(_DWORD *)(v4 + 64) == 2)
      v79 = 1;
    else
      v79 = 3;
    v76[23] = v79;
    *((_WORD *)v76 + 12) = *(_DWORD *)(v4 + 60);
    v77 = v76 + 26;
  }
  *(_QWORD *)(v4 + 584) = *(_QWORD *)(v4 + 616);
  v80 = sub_1DB746278((_QWORD *)v4, v77 - __src);
  memcpy(v80, __src, v77 - __src);
  if (*(_DWORD *)(v4 + 72))
  {
    *(_DWORD *)v77 = 1048577;
    *(_QWORD *)(v77 + 4) = *(_QWORD *)(v4 + 16);
    *(_QWORD *)(v77 + 12) = *(_QWORD *)(v4 + 8);
    *((_WORD *)v77 + 1) = 16;
    v77 += 20;
  }
  if ((*(_BYTE *)(v4 + 672) & 4) != 0)
  {
    *(_DWORD *)v77 = 27768;
    v77[4] = 7;
    *(_WORD *)(v77 + 5) = v46 | 0x300;
    *(_WORD *)(v77 + 7) = 0;
    v81 = archive_entry_mode(*(_QWORD *)(v4 + 48));
    *(_WORD *)(v77 + 9) = 0;
    *(_WORD *)(v77 + 11) = v81;
    *((_WORD *)v77 + 1) = 9;
    v77 += 13;
  }
  v82 = v77 - __src;
  WORD2(v110) = v77 - __src;
  if (sub_1DB7322A8(a1, (uint64_t)&v105, 30))
    return 4294967266;
  *(_QWORD *)(v4 + 632) += 30;
  v84 = *(uint64_t **)(v4 + 48);
  v85 = (const char *)archive_entry_pathname(v84);
  v86 = archive_entry_filetype((uint64_t)v84);
  if (!v85)
    return 4294967266;
  v87 = v86;
  v88 = strlen(v85);
  if (sub_1DB7322A8(a1, (uint64_t)v85, v88))
    return 4294967266;
  v89 = strlen(v85);
  v90 = v89;
  if (v87 == 0x4000)
  {
    v91 = v96;
    if (v85[v89 - 1] != 47)
    {
      if (sub_1DB7322A8(a1, (uint64_t)"/", 1))
        return 4294967266;
      ++v90;
    }
  }
  else
  {
    v91 = v96;
  }
  if (v90 < 1)
    return 4294967266;
  *(_QWORD *)(v4 + 632) += v90;
  if (sub_1DB7322A8(a1, (uint64_t)__src, v82))
    return 4294967266;
  *(_QWORD *)(v4 + 632) += v82;
  if (v91)
  {
    if (sub_1DB7322A8(a1, v91, v43))
      return 4294967266;
    *(int64x2_t *)(v4 + 24) = vaddq_s64(*(int64x2_t *)(v4 + 24), vdupq_n_s64(v43));
    *(_QWORD *)(v4 + 632) += v43;
  }
  if (*(_DWORD *)(v4 + 60) == 8)
  {
    *(_QWORD *)(v4 + 752) = 0;
    *(_QWORD *)(v4 + 744) = 0;
    *(_QWORD *)(v4 + 760) = 0;
    *(_QWORD *)(v4 + 704) = *(_QWORD *)(v4 + 800);
    *(_DWORD *)(v4 + 712) = *(_QWORD *)(v4 + 792);
    if (deflateInit2_((z_streamp)(v4 + 680), *(_DWORD *)(v4 + 660), 8, -15, 8, 0, "1.2.12", 112))
    {
      v23 = "Can't init deflate compressor";
      goto LABEL_34;
    }
  }
  return v24;
}

uint64_t sub_1DB7452B4(uint64_t a1, Bytef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  size_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  char *v28;
  int v29;
  Bytef *v30;
  size_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  size_t v38;
  uint64_t v39;
  char *v40;
  Bytef *v41;
  size_t v42;
  size_t v43;
  Bytef v44;
  uint64_t v45;
  Bytef v46;
  uint64_t v47;
  char *v49;
  Bytef *v50;
  size_t dataLength;
  char v52;
  uint8_t salt[18];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 264);
  if (*(_QWORD *)(v8 + 40) >= a3)
    v9 = a3;
  else
    v9 = *(_QWORD *)(v8 + 40);
  *(_QWORD *)(v8 + 32) += v9;
  if (!v9)
    return v9;
  if ((*(_BYTE *)(v8 + 68) & 1) != 0)
  {
    v12 = *(_DWORD *)(v8 + 64);
    if ((v12 - 2) >= 2)
    {
      if (v12 != 1 || *(_BYTE *)(v8 + 92))
        goto LABEL_20;
      v40 = sub_1DB71F3B8(a1);
      if (v40)
      {
        v41 = (Bytef *)v40;
        if (!sub_1DB746CE8(&dataLength, 0xBuLL))
        {
          v42 = strlen((const char *)v41);
          *(_QWORD *)(v8 + 80) = 0x2345678912345678;
          *(_DWORD *)(v8 + 88) = 878082192;
          if (v42)
          {
            v43 = v42;
            do
            {
              v44 = *v41++;
              sub_1DB72B150((int *)(v8 + 80), v44);
              --v43;
            }
            while (v43);
          }
          v45 = 0;
          v52 = *(_BYTE *)(v8 + 93);
          do
          {
            v46 = *((_BYTE *)&dataLength + v45);
            salt[v45] = v46 ^ ((unsigned __int16)(((*(_WORD *)(v8 + 88) | 2) ^ 1) * (*(_WORD *)(v8 + 88) | 2)) >> 8);
            sub_1DB72B150((int *)(v8 + 80), v46);
            ++v45;
          }
          while (v45 != 12);
          v37 = sub_1DB7322A8(a1, (uint64_t)salt, 12);
          if (v37)
            return v37;
          *(_QWORD *)(v8 + 632) += 12;
          *(_QWORD *)(v8 + 24) += 12;
          *(_BYTE *)(v8 + 92) = 1;
          goto LABEL_20;
        }
        goto LABEL_51;
      }
    }
    else
    {
      if (*(_BYTE *)(v8 + 184))
        goto LABEL_20;
      v13 = sub_1DB71F3B8(a1);
      if (v13)
      {
        v19 = v13;
        if (*(_DWORD *)(v8 + 64) == 2)
          v20 = 16;
        else
          v20 = 32;
        if (*(_DWORD *)(v8 + 64) == 2)
          v21 = 8;
        else
          v21 = 16;
        if (!sub_1DB746CE8(salt, v21))
        {
          v27 = strlen(v19);
          sub_1DB6E883C(v19, v27, salt, v21, 0x3E8u, (uint8_t *)&dataLength, (2 * v20) | 2);
          if (sub_1DB6E8884(v8 + 104, &dataLength, v20))
          {
            v28 = "Decryption is unsupported due to lack of crypto library";
LABEL_53:
            archive_set_error((_DWORD *)a1, -1, v28, v14, v15, v16, v17, v18, v49);
            return -25;
          }
          if (sub_1DB70C8D0((CCHmacContext *)(v8 + 188), (char *)&dataLength + v20, v20))
          {
            sub_1DB6E8A6C(v8 + 104);
            v28 = "Failed to initialize HMAC-SHA1";
            goto LABEL_53;
          }
          salt[v21] = *((_BYTE *)&dataLength + 2 * v20);
          salt[v21 | 1] = *((_BYTE *)&dataLength + ((2 * v20) | 1));
          v47 = v21 | 2;
          v37 = sub_1DB7322A8(a1, (uint64_t)salt, v47);
          if (v37)
            return v37;
          *(_QWORD *)(v8 + 632) += v47;
          *(_QWORD *)(v8 + 24) += v47;
          *(_BYTE *)(v8 + 572) = 1;
          *(_BYTE *)(v8 + 184) = 1;
          goto LABEL_20;
        }
LABEL_51:
        archive_set_error((_DWORD *)a1, -1, "Can't generate random number for encryption", v22, v23, v24, v25, v26, v49);
        return -30;
      }
    }
    v28 = "Encryption needs passphrase";
    goto LABEL_53;
  }
LABEL_20:
  v29 = *(_DWORD *)(v8 + 60);
  if (v29 == 8)
  {
    v50 = a2;
    *(_QWORD *)(v8 + 680) = a2;
    *(_DWORD *)(v8 + 688) = v9;
    while (deflate((z_streamp)(v8 + 680), 0) != -2)
    {
      if (!*(_DWORD *)(v8 + 712))
      {
        if (*(_BYTE *)(v8 + 92))
        {
          sub_1DB746354(v8 + 80, *(Bytef **)(v8 + 800), *(_QWORD *)(v8 + 792), *(_BYTE **)(v8 + 800), *(_QWORD *)(v8 + 792));
        }
        else if (*(_BYTE *)(v8 + 184))
        {
          dataLength = *(_QWORD *)(v8 + 792);
          if ((sub_1DB6E8908(v8 + 104, *(_QWORD *)(v8 + 800), dataLength, *(_QWORD *)(v8 + 800), &dataLength) & 0x80000000) != 0)
          {
LABEL_56:
            archive_set_error((_DWORD *)a1, -1, "Failed to encrypt file", v32, v33, v34, v35, v36, v49);
            return -25;
          }
          j__CCHmacUpdate((CCHmacContext *)(v8 + 188), *(const void **)(v8 + 800), *(_QWORD *)(v8 + 792));
        }
        v37 = sub_1DB7322A8(a1, *(_QWORD *)(v8 + 800), *(_QWORD *)(v8 + 792));
        if (v37)
          return v37;
        v39 = *(_QWORD *)(v8 + 792);
        *(_QWORD *)(v8 + 24) += v39;
        *(_QWORD *)(v8 + 632) += v39;
        *(_QWORD *)(v8 + 704) = *(_QWORD *)(v8 + 800);
        *(_DWORD *)(v8 + 712) = v39;
      }
      if (!*(_DWORD *)(v8 + 688))
        goto LABEL_44;
    }
    return -30;
  }
  if (v29)
  {
    archive_set_error((_DWORD *)a1, -1, "Invalid ZIP compression type", a4, a5, a6, a7, a8, v49);
    return -30;
  }
  v50 = a2;
  if (*(_BYTE *)(v8 + 92) || *(_BYTE *)(v8 + 184))
  {
    if (v9 >= 1)
    {
      v30 = &a2[v9];
      do
      {
        dataLength = 0;
        if (*(_BYTE *)(v8 + 92))
        {
          v31 = sub_1DB746354(v8 + 80, a2, v30 - a2, *(_BYTE **)(v8 + 800), *(_QWORD *)(v8 + 792));
          dataLength = v31;
        }
        else
        {
          dataLength = *(_QWORD *)(v8 + 792);
          if ((sub_1DB6E8908(v8 + 104, (uint64_t)a2, v30 - a2, *(_QWORD *)(v8 + 800), &dataLength) & 0x80000000) != 0)
            goto LABEL_56;
          j__CCHmacUpdate((CCHmacContext *)(v8 + 188), *(const void **)(v8 + 800), dataLength);
          v31 = dataLength;
        }
        v37 = sub_1DB7322A8(a1, *(_QWORD *)(v8 + 800), v31);
        if (v37)
          return v37;
        v38 = dataLength;
        *(_QWORD *)(v8 + 24) += dataLength;
        *(_QWORD *)(v8 + 632) += v38;
        a2 += v38;
      }
      while (a2 < v30);
    }
  }
  else
  {
    v37 = sub_1DB7322A8(a1, (uint64_t)a2, v9);
    if (v37)
      return v37;
    *(_QWORD *)(v8 + 632) += v9;
    *(_QWORD *)(v8 + 24) += v9;
  }
LABEL_44:
  *(_QWORD *)(v8 + 40) -= v9;
  if (!*(_BYTE *)(v8 + 184) || *(_DWORD *)(v8 + 96) != 2)
    *(_DWORD *)(v8 + 56) = (*(uint64_t (**)(_QWORD, Bytef *, _QWORD))(v8 + 592))(*(unsigned int *)(v8 + 56), v50, v9);
  return v9;
}

uint64_t sub_1DB745860(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  size_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE __src[12];
  __int16 v35;
  char v36;
  char v37;
  __int16 v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = *(uint64_t **)(a1 + 264);
  if (*((_DWORD *)v2 + 15) == 8)
  {
    if (deflate((z_streamp)(v2 + 85), 4) != -2)
    {
      while (1)
      {
        v3 = *((unsigned int *)v2 + 178);
        v4 = v2[99] - v3;
        if (*((_BYTE *)v2 + 92))
        {
          sub_1DB746354((uint64_t)(v2 + 10), (Bytef *)v2[100], v2[99] - v3, (_BYTE *)v2[100], v2[99] - v3);
        }
        else if (*((_BYTE *)v2 + 184))
        {
          *(_QWORD *)__src = v2[99] - v3;
          if ((sub_1DB6E8908((uint64_t)(v2 + 13), v2[100], v4, v2[100], (unint64_t *)__src) & 0x80000000) != 0)
          {
            archive_set_error((_DWORD *)a1, -1, "Failed to encrypt file", v5, v6, v7, v8, v9, (char *)v33);
            return 4294967271;
          }
          j__CCHmacUpdate((CCHmacContext *)((char *)v2 + 188), (const void *)v2[100], v4);
        }
        result = sub_1DB7322A8(a1, v2[100], v4);
        if ((_DWORD)result)
          return result;
        v2[3] += v4;
        v2[79] += v4;
        v2[88] = v2[100];
        if (*((_DWORD *)v2 + 178))
        {
          deflateEnd((z_streamp)(v2 + 85));
          goto LABEL_13;
        }
        *((_DWORD *)v2 + 178) = v2[99];
        if (deflate((z_streamp)(v2 + 85), 4) == -2)
          return 4294967266;
      }
    }
    return 4294967266;
  }
LABEL_13:
  if (*((_BYTE *)v2 + 572))
  {
    v33 = 20;
    sub_1DB70C8F8((CCHmacContext *)((char *)v2 + 188), __src, &v33);
    result = sub_1DB7322A8(a1, (uint64_t)__src, 10);
    if ((_DWORD)result)
      return result;
    v2[3] += 10;
    v2[79] += 10;
  }
  if ((*((_BYTE *)v2 + 68) & 8) != 0)
  {
    *(_DWORD *)__src = 134695760;
    if (*((_BYTE *)v2 + 184) && *((_DWORD *)v2 + 24) == 2)
      *(_DWORD *)&__src[4] = 0;
    else
      *(_DWORD *)&__src[4] = *((_DWORD *)v2 + 14);
    v11 = *((_DWORD *)v2 + 18);
    v12 = v2[3];
    *(_DWORD *)&__src[8] = v12;
    if (v11)
    {
      LOBYTE(v35) = BYTE4(v12);
      HIBYTE(v35) = BYTE5(v12);
      v36 = BYTE6(v12);
      v37 = HIBYTE(v12);
      v13 = v2[4];
      v38 = v13;
      v39 = BYTE2(v13);
      v40 = BYTE3(v13);
      v41 = BYTE4(v13);
      v42 = BYTE5(v13);
      v43 = BYTE6(v13);
      v14 = HIBYTE(v13);
      v15 = 24;
      v16 = 23;
    }
    else
    {
      v17 = v2[4];
      v35 = v17;
      v36 = BYTE2(v17);
      v14 = v17 >> 24;
      v15 = 16;
      v16 = 15;
    }
    __src[v16] = v14;
    v18 = sub_1DB7322A8(a1, (uint64_t)__src, v15);
    v2[79] += v15;
    if (v18)
      return 4294967266;
  }
  v19 = v2[3];
  v20 = v2[4];
  if (v19 <= 0xFFFFFFFFLL)
  {
    if (v20 >= 0x100000000)
    {
      *(_DWORD *)__src = 1;
LABEL_30:
      *(_QWORD *)&__src[4] = v20;
      v21 = (uint64_t *)&v35;
      goto LABEL_31;
    }
    if (*v2 < 0x100000000)
      goto LABEL_38;
  }
  *(_DWORD *)__src = 1;
  v21 = (uint64_t *)&__src[4];
  if (v20 >= 0xFFFFFFFFLL)
    goto LABEL_30;
LABEL_31:
  if (v19 >= 0xFFFFFFFFLL)
    *v21++ = v19;
  if (*v2 >= 0xFFFFFFFFLL)
    *v21++ = *v2;
  *(_WORD *)&__src[2] = (_WORD)v21 - (unsigned __int16)&__src[4];
  v22 = (char *)v21 - __src;
  v23 = sub_1DB746278(v2, (char *)v21 - __src);
  if (!v23)
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate zip data", v24, v25, v26, v27, v28, (char *)v33);
    return 4294967266;
  }
  memcpy(v23, __src, v22);
  v29 = v2[72];
  if (*(unsigned __int16 *)(v29 + 6) <= 0x2Cu)
    *(_WORD *)(v29 + 6) = 45;
LABEL_38:
  if (*((_BYTE *)v2 + 184) && *((_DWORD *)v2 + 24) == 2)
    *(_DWORD *)(v2[72] + 16) = 0;
  else
    *(_DWORD *)(v2[72] + 16) = *((_DWORD *)v2 + 14);
  result = 0;
  v30 = v2[3];
  if (v30 >= 0xFFFFFFFFLL)
    LODWORD(v30) = -1;
  *(_DWORD *)(v2[72] + 20) = v30;
  v31 = v2[4];
  if (v31 >= 0xFFFFFFFFLL)
    LODWORD(v31) = -1;
  *(_DWORD *)(v2[72] + 24) = v31;
  *(_WORD *)(v2[72] + 30) = *((_DWORD *)v2 + 154) - *((_DWORD *)v2 + 146);
  v32 = *v2;
  if (*v2 >= 0xFFFFFFFFLL)
    LODWORD(v32) = -1;
  *(_DWORD *)(v2[72] + 42) = v32;
  return result;
}

uint64_t sub_1DB745CC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v9;
  int v10;
  int v11;
  uint64_t result;
  _BYTE v13[64];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 264);
  v3 = *(_QWORD *)(v2 + 632);
  v4 = *(_QWORD **)(v2 + 600);
  v5 = v3;
  if (v4)
  {
    while (!sub_1DB7322A8(a1, v4[2], v4[3] - v4[2]))
    {
      v5 = v4[3] - v4[2] + *(_QWORD *)(v2 + 632);
      *(_QWORD *)(v2 + 632) = v5;
      v4 = (_QWORD *)*v4;
      if (!v4)
        goto LABEL_4;
    }
    return 4294967266;
  }
LABEL_4:
  v6 = v5 - v3;
  v7 = *(_QWORD *)(v2 + 624);
  v9 = v3 <= 0xFFFFFFFFLL && v6 <= 0xFFFFFFFFLL && v7 >> 16 == 0;
  if (!v9 || (*(_BYTE *)(v2 + 672) & 2) != 0)
  {
    *(_QWORD *)&v13[16] = 0;
    *(_DWORD *)v13 = 101075792;
    strcpy(&v13[4], ",");
    *(_WORD *)&v13[6] = 0;
    *(_QWORD *)&v13[8] = 0x2D002D00000000;
    *(_QWORD *)&v13[24] = v7;
    *(_QWORD *)&v13[32] = v7;
    *(_QWORD *)&v13[40] = v5 - v3;
    *(_QWORD *)&v13[48] = v3;
    if (sub_1DB7322A8(a1, (uint64_t)v13, 56))
      return 4294967266;
    *(_QWORD *)(v2 + 632) += 56;
    *(_QWORD *)v13 = 117853008;
    *(_QWORD *)&v13[8] = v5;
    *(_DWORD *)&v13[16] = 1;
    if (sub_1DB7322A8(a1, (uint64_t)v13, 20))
      return 4294967266;
    *(_QWORD *)(v2 + 632) += 20;
    v7 = *(_QWORD *)(v2 + 624);
  }
  memset(&v13[4], 0, 60);
  *(_DWORD *)v13 = 101010256;
  if (v7 >= 0xFFFF)
    LOWORD(v7) = -1;
  *(_WORD *)&v13[8] = v7;
  *(_WORD *)&v13[10] = v7;
  v10 = -1;
  if (v6 >= 0xFFFFFFFFLL)
    v11 = -1;
  else
    v11 = v5 - v3;
  *(_DWORD *)&v13[12] = v11;
  if (v3 < 0xFFFFFFFFLL)
    v10 = v3;
  *(_DWORD *)&v13[16] = v10;
  result = sub_1DB7322A8(a1, (uint64_t)v13, 22);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(v2 + 632) += 22;
    return result;
  }
  return 4294967266;
}

uint64_t sub_1DB745FD4(uint64_t a1)
{
  uint64_t v2;
  void **v3;

  v2 = *(_QWORD *)(a1 + 264);
  while (1)
  {
    v3 = *(void ***)(v2 + 600);
    if (!v3)
      break;
    *(_QWORD *)(v2 + 600) = *v3;
    free(v3[2]);
    free(v3);
  }
  free(*(void **)(v2 + 800));
  archive_entry_free(*(void ***)(v2 + 48));
  if (*(_BYTE *)(v2 + 184))
    sub_1DB6E8A6C(v2 + 104);
  if (*(_BYTE *)(v2 + 572))
    sub_1DB70C920((_OWORD *)(v2 + 188));
  free((void *)v2);
  *(_QWORD *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_1DB746078(int a1)
{
  size_t v1;
  size_t v2;
  int v3;
  CCHmacContext v5;
  _OWORD v6[5];
  uint8_t derivedKey[66];
  uint8_t salt[18];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  memset(&v5.ctx[8], 0, 352);
  if (a1 == 2)
    v1 = 16;
  else
    v1 = 32;
  if (a1 == 2)
    v2 = 8;
  else
    v2 = 16;
  memset(&v5, 0, 32);
  if (sub_1DB746CE8(salt, v2))
    return 0;
  if (sub_1DB6E883C("p", 1uLL, salt, v2, 0x3E8u, derivedKey, (2 * v1) | 2))
    return 0;
  if (sub_1DB6E8884((uint64_t)v6, derivedKey, v1))
    return 0;
  v3 = sub_1DB70C8D0(&v5, &derivedKey[v1], v1);
  sub_1DB6E8A6C((uint64_t)v6);
  if (v3)
    return 0;
  sub_1DB70C920(&v5);
  return 1;
}

uint64_t sub_1DB7461D8()
{
  return 0;
}

uint64_t sub_1DB7461E0(time_t a1)
{
  tm *v1;
  int tm_year;
  tm v4;
  time_t v5;

  v5 = a1;
  memset(&v4, 0, sizeof(v4));
  v1 = localtime_r(&v5, &v4);
  tm_year = v1->tm_year;
  if (tm_year < 80)
    return 2162688;
  if (tm_year <= 0xCF)
    return (((v1->tm_hour & 0x1F) << 11) | (((32 * LOWORD(v1->tm_mon) + 32) & 0x1E0 | (tm_year << 9) | v1->tm_mday & 0x1F) << 16) | (32 * (v1->tm_min & 0x3F)) | (v1->tm_sec >> 1) & 0x1F)
         + 1610612736;
  return 4288659325;
}

_QWORD *sub_1DB746278(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *result;
  _QWORD **v6;
  _QWORD *v7;

  if (!a1[75] || (v4 = (_QWORD *)a1[76], result = (_QWORD *)v4[3], (unint64_t)result + a2 > v4[2] + v4[1]))
  {
    result = malloc_type_calloc(1uLL, 0x20uLL, 0x1030040322C5439uLL);
    if (!result)
      return result;
    v4 = result;
    result[1] = 0x10000;
    result = malloc_type_malloc(0x10000uLL, 0xA98E8E36uLL);
    v4[2] = result;
    if (!result)
    {
      free(v4);
      return 0;
    }
    v4[3] = result;
    v6 = (_QWORD **)(a1 + 76);
    if (a1[75])
    {
      v7 = *v6;
    }
    else
    {
      v7 = a1 + 76;
      v6 = (_QWORD **)(a1 + 75);
    }
    *v7 = v4;
    *v6 = v4;
  }
  v4[3] = (char *)result + a2;
  a1[77] += a2;
  return result;
}

unint64_t sub_1DB746354(uint64_t a1, Bytef *a2, unint64_t a3, _BYTE *a4, unint64_t a5)
{
  unint64_t v5;
  uint64_t v9;
  Bytef v10;

  if (a3 >= a5)
    v5 = a5;
  else
    v5 = a3;
  if ((_DWORD)v5)
  {
    v9 = v5;
    do
    {
      v10 = *a2++;
      *a4++ = v10 ^ ((unsigned __int16)(((*(_WORD *)(a1 + 8) | 2) ^ 1) * (*(_WORD *)(a1 + 8) | 2)) >> 8);
      sub_1DB72B150((int *)a1, v10);
      --v9;
    }
    while (v9);
  }
  return v5;
}

uint64_t archive_write_set_format_cpio_pwb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1DB7463D4(a1, 65543, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DB7463D4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  _DWORD *v20;
  int v21;
  char *v22;

  result = sub_1DB6E0594((int *)a1, -1329217314, 1, "archive_write_set_format_cpio_binary", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    v11 = *(void (**)(uint64_t))(a1 + 328);
    if (v11)
      v11(a1);
    v12 = malloc_type_calloc(1uLL, 0x40uLL, 0x102004099191E4EuLL);
    if (v12)
    {
      *(_QWORD *)(a1 + 264) = v12;
      *(_QWORD *)(a1 + 272) = "cpio";
      *(_QWORD *)(a1 + 304) = sub_1DB7465B0;
      *(_QWORD *)(a1 + 312) = sub_1DB7466B0;
      *(_QWORD *)(a1 + 288) = sub_1DB74650C;
      *(_QWORD *)(a1 + 296) = sub_1DB7466F8;
      *(_QWORD *)(a1 + 320) = sub_1DB746704;
      *(_QWORD *)(a1 + 328) = sub_1DB74676C;
      *(_DWORD *)(a1 + 16) = a2;
      if (a2 == 65538)
      {
        result = 0;
        v18 = "7th Edition cpio";
        goto LABEL_10;
      }
      if (a2 == 65543)
      {
        result = 0;
        v18 = "PWB cpio";
LABEL_10:
        *(_QWORD *)(a1 + 24) = v18;
        return result;
      }
      v19 = "binary format must be 'pwb' or 'bin'";
      v20 = (_DWORD *)a1;
      v21 = 22;
    }
    else
    {
      v19 = "Can't allocate cpio data";
      v20 = (_DWORD *)a1;
      v21 = 12;
    }
    archive_set_error(v20, v21, v19, v13, v14, v15, v16, v17, v22);
    return 4294967266;
  }
  return result;
}

uint64_t archive_write_set_format_cpio_bin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1DB7463D4(a1, 65538, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DB74650C(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;

  v5 = *(_QWORD *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset"))
    return 4294967276;
  if (a3 && *a3)
  {
    v12 = sub_1DB72D08C(a1, a3, 0);
    *(_QWORD *)(v5 + 40) = v12;
    if (v12)
      return 0;
    else
      return 4294967266;
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_1DB7465B0(_DWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v11;
  char *v12;
  _BYTE *v13;

  if (archive_entry_filetype((uint64_t)a2) || archive_entry_hardlink((uint64_t)a2))
  {
    v12 = 0;
    v13 = 0;
    v9 = sub_1DB71684C((uint64_t)a1);
    if (sub_1DB6E9040(a2, &v13, &v12, v9) && *__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v4, v5, v6, v7, v8, v12);
      return 4294967266;
    }
    if (v12 && v13 && *v13)
    {
      if (archive_entry_size_is_set((uint64_t)a2)
        && (archive_entry_size((uint64_t)a2) & 0x8000000000000000) == 0)
      {
        return sub_1DB7467A4((uint64_t)a1, a2);
      }
      v11 = "Size required";
    }
    else
    {
      v11 = "Pathname required";
    }
  }
  else
  {
    v11 = "Filetype required";
  }
  archive_set_error(a1, -1, v11, v4, v5, v6, v7, v8, v12);
  return 4294967271;
}

uint64_t sub_1DB7466B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3)
    v4 = a3;
  else
    v4 = *v3;
  LODWORD(result) = sub_1DB7322A8(a1, a2, v4);
  *v3 -= v4;
  if ((int)result >= 0)
    return v4;
  else
    return (int)result;
}

uint64_t sub_1DB7466F8(uint64_t a1)
{
  return sub_1DB732308((_QWORD *)a1, **(_QWORD **)(a1 + 264));
}

uint64_t sub_1DB746704(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)archive_entry_new2(0);
  archive_entry_set_nlink((uint64_t)v2, 1);
  archive_entry_set_size((uint64_t)v2, 0);
  archive_entry_set_pathname((uint64_t)v2, "TRAILER!!!");
  v3 = sub_1DB7467A4(a1, v2);
  archive_entry_free((void **)v2);
  return v3;
}

uint64_t sub_1DB74676C(uint64_t a1)
{
  void **v2;

  v2 = *(void ***)(a1 + 264);
  free(v2[2]);
  free(v2);
  *(_QWORD *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_1DB7467A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  _DWORD *v31;
  int v32;
  int v33;
  int v35;
  __int16 v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  int v50;
  unint64_t v51;
  uint64_t v52;
  size_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[2];
  uint64_t v59;
  char *__s;

  v59 = 0;
  __s = 0;
  v56 = 0;
  v57 = 0;
  memset(v58, 0, 10);
  v55 = 0;
  v4 = *(_QWORD *)(a1 + 264);
  v5 = sub_1DB71684C(a1);
  if (sub_1DB6E9040(a2, &v59, &v55, v5))
  {
    if (*__error() == 12)
    {
      v11 = "Can't allocate memory for Pathname";
LABEL_34:
      v31 = (_DWORD *)a1;
      v32 = 12;
      goto LABEL_35;
    }
    v13 = (char *)archive_entry_pathname(a2);
    sub_1DB72D0D4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v14, v15, v16, v17, v18, v13);
    v12 = 4294967276;
  }
  else
  {
    v12 = 0;
  }
  v19 = v55;
  LOWORD(v56) = 29127;
  WORD1(v56) = archive_entry_dev(a2);
  v20 = archive_entry_ino64((uint64_t)a2);
  if (v20)
  {
    v21 = v20;
    if (archive_entry_nlink((uint64_t)a2) >= 2)
    {
      v24 = *(_QWORD *)(v4 + 32);
      if (v24)
      {
        v25 = (_DWORD *)(*(_QWORD *)(v4 + 16) + 8);
        v26 = *(_QWORD *)(v4 + 32);
        while (*((_QWORD *)v25 - 1) != v21)
        {
          v25 += 4;
          if (!--v26)
            goto LABEL_15;
        }
        LODWORD(v23) = *v25;
        if ((*v25 & 0x80000000) != 0)
          goto LABEL_33;
      }
      else
      {
LABEL_15:
        v23 = *(_QWORD *)(v4 + 8) + 1;
        *(_QWORD *)(v4 + 8) = v23;
        v27 = *(_QWORD *)(v4 + 24);
        if (v27 <= v24)
        {
          if (v27 >= 0x200)
            v29 = 2 * v27;
          else
            v29 = 512;
          v28 = (char *)malloc_type_realloc(*(void **)(v4 + 16), 16 * v29, 0x1000040D9A13B51uLL);
          if (!v28)
            goto LABEL_33;
          *(_QWORD *)(v4 + 16) = v28;
          *(_QWORD *)(v4 + 24) = v29;
          v24 = *(_QWORD *)(v4 + 32);
        }
        else
        {
          v28 = *(char **)(v4 + 16);
        }
        v30 = &v28[16 * v24];
        *(_QWORD *)v30 = v21;
        *((_DWORD *)v30 + 2) = v23;
        *(_QWORD *)(v4 + 32) = v24 + 1;
        if ((v23 & 0x80000000) != 0)
        {
LABEL_33:
          v11 = "No memory for ino translation table";
          goto LABEL_34;
        }
      }
    }
    else
    {
      v22 = *(_QWORD *)(v4 + 8);
      LODWORD(v23) = v22 + 1;
      *(_QWORD *)(v4 + 8) = v22 + 1;
      if ((_DWORD)v22 + 1 < 0)
        goto LABEL_33;
    }
    if (v23 >= 0x8000)
    {
      v11 = "Too many files for this cpio format";
      v31 = (_DWORD *)a1;
      v32 = 34;
LABEL_35:
      archive_set_error(v31, v32, v11, v6, v7, v8, v9, v10, v54);
LABEL_36:
      v12 = 4294967266;
      goto LABEL_37;
    }
  }
  else
  {
    LOWORD(v23) = 0;
  }
  WORD2(v56) = v23;
  HIWORD(v56) = archive_entry_mode((uint64_t)a2);
  v33 = HIWORD(v56) & 0xF000;
  if (v33 == 49152 || v33 == 4096)
  {
    v11 = "sockets and fifos cannot be represented in the binary cpio formats";
LABEL_28:
    v31 = (_DWORD *)a1;
    v32 = 22;
    goto LABEL_35;
  }
  if (v33 == 40960 && *(_DWORD *)(a1 + 16) == 65543)
  {
    v11 = "symbolic links cannot be represented in the PWB cpio format";
    goto LABEL_28;
  }
  v35 = v19 + 1;
  LOWORD(v57) = archive_entry_uid((uint64_t)a2);
  WORD1(v57) = archive_entry_gid((uint64_t)a2);
  WORD2(v57) = archive_entry_nlink((uint64_t)a2);
  if (archive_entry_filetype((uint64_t)a2) == 24576
    || archive_entry_filetype((uint64_t)a2) == 0x2000)
  {
    v36 = archive_entry_rdev(a2);
  }
  else
  {
    v36 = 0;
  }
  HIWORD(v57) = v36;
  HIDWORD(v37) = archive_entry_mtime((uint64_t)a2);
  LODWORD(v37) = HIDWORD(v37);
  LODWORD(v58[0]) = v37 >> 16;
  WORD2(v58[0]) = v19 + 1;
  if (archive_entry_filetype((uint64_t)a2) != 0x8000)
    archive_entry_set_size((uint64_t)a2, 0);
  if (sub_1DB6E922C((uint64_t)a2, &__s, &v55, v5))
  {
    if (*__error() == 12)
    {
      v11 = "Can't allocate memory for Linkname";
      goto LABEL_34;
    }
    v38 = (char *)archive_entry_symlink((uint64_t)a2);
    sub_1DB72D0D4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v39, v40, v41, v42, v43, v38);
    v12 = 4294967276;
  }
  if (!v55 || !__s || !*__s)
  {
    if (*(_DWORD *)(a1 + 16) == 65543 && archive_entry_size((uint64_t)a2) >= 0x1000000)
    {
      v49 = "File is too large for PWB binary cpio format.";
    }
    else
    {
      if (archive_entry_size((uint64_t)a2) < 0x80000000)
      {
        v50 = archive_entry_size((uint64_t)a2);
        goto LABEL_61;
      }
      v49 = "File is too large for binary cpio format.";
    }
    archive_set_error((_DWORD *)a1, 34, v49, v44, v45, v46, v47, v48, v54);
    v12 = 4294967271;
    goto LABEL_37;
  }
  if (*(_DWORD *)(a1 + 16) == 65543)
  {
    v11 = "symlinks are not supported by UNIX V6 or by PWB cpio";
    goto LABEL_28;
  }
  v50 = strlen(__s);
LABEL_61:
  HIDWORD(v51) = v50;
  LODWORD(v51) = v50;
  *(_DWORD *)((char *)v58 + 6) = v51 >> 16;
  if (sub_1DB7322A8(a1, (uint64_t)&v56, 26)
    || sub_1DB7322A8(a1, v59, v35)
    || (v35 & 1) != 0 && sub_1DB732308((_QWORD *)a1, 1uLL))
  {
    goto LABEL_36;
  }
  v52 = archive_entry_size((uint64_t)a2);
  *(_QWORD *)v4 = (v52 & 1) + v52;
  if (__s)
  {
    if (*__s)
    {
      v53 = strlen(__s);
      if (sub_1DB7322A8(a1, (uint64_t)__s, v53)
        || (strlen(__s) & 1) != 0 && sub_1DB732308((_QWORD *)a1, 1uLL))
      {
        goto LABEL_36;
      }
    }
  }
LABEL_37:
  archive_entry_free(0);
  return v12;
}

uint64_t archive_write_add_filter_by_name(_DWORD *a1, char *__s1)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = 0;
  v5 = "b64encode";
  while (strcmp(__s1, v5))
  {
    v5 = (&off_1EA321EE8)[v4 + 2];
    v4 += 2;
    if (v4 == 26)
    {
      archive_set_error(a1, 22, "No such filter '%s'", v6, v7, v8, v9, v10, __s1);
      a1[1] = 0x8000;
      return 4294967266;
    }
  }
  return ((uint64_t (*)(_DWORD *))(&off_1EA321EE8)[v4 + 1])(a1);
}

uint64_t sub_1DB746CE8(void *a1, size_t a2)
{
  arc4random_buf(a1, a2);
  return 0;
}

uint64_t archive_read_support_filter_lz4(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
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
  uint64_t v18;
  int v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;

  if (sub_1DB6E4544("lz4"))
  {
    result = sub_1DB6E0594(a1, 14594245, 1, "archive_read_support_filter_lz4", v3, v4, v5, v6);
    if ((_DWORD)result == -30)
      return result;
    v22 = 0;
    sub_1DB6F7FD0(a1, &v22, v8, v9, v10, v11, v12, v13);
    if (!v19)
    {
      *v22 = 0;
      v20 = v22;
      v22[1] = "lz4";
      v20[2] = sub_1DB746DD4;
      v20[3] = sub_1DB746E60;
      v20[4] = 0;
      v20[5] = sub_1DB746E9C;
      archive_set_error(a1, -1, "Using external lz4 program", v14, v15, v16, v17, v18, v21);
      return 4294967276;
    }
  }
  else
  {
    archive_set_error(a1, -1, "Filter not allow-listed in entitlements", v2, v3, v4, v5, v6, v21);
  }
  return 4294967266;
}

size_t sub_1DB746DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t result;
  uint64_t v9;

  v9 = 0;
  result = sub_1DB6E22F4(a2, 0xBuLL, &v9, a4, a5, a6, a7, a8);
  if (result)
  {
    if (*(_DWORD *)result == 407642370)
    {
      return 32;
    }
    else if (*(_DWORD *)result == 407708164
           && (*(_BYTE *)(result + 4) & 0xC2) == 0x40
           && (*(_BYTE *)(result + 5) & 0xCF) == 0x40)
    {
      return 48;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1DB746E60(uint64_t a1)
{
  uint64_t result;

  result = sub_1DB6FE79C(a1, "lz4 -d -q");
  *(_DWORD *)(a1 + 104) = 13;
  *(_QWORD *)(a1 + 96) = "lz4";
  return result;
}

uint64_t sub_1DB746E9C()
{
  return 0;
}

uint64_t sub_1DB746EA4(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  char *v13;

  v5 = **(_QWORD **)(a1 + 2472);
  if (strcmp(__s1, "hdrcharset"))
    return 4294967276;
  if (a3 && *a3)
  {
    v12 = sub_1DB6E3A78(a1, a3, 0);
    *(_QWORD *)(v5 + 20192) = v12;
    if (v12)
      return 0;
    else
      return 4294967266;
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "rar: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, v13);
    return 4294967271;
  }
}

uint64_t sub_1DB746F3C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v10;
  _DWORD *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  int v20;
  size_t v21;
  int v22;
  unint64_t v23;
  uLong v24;
  uint64_t v25;
  const Bytef *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v34;
  unsigned __int16 *v35;
  int v36;
  uint64_t result;
  uint64_t v38;
  size_t v39;
  size_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  size_t v44;
  char *v46;
  char *v47;
  uint64_t v48;

  *(_DWORD *)(a1 + 16) = 851968;
  if (!*(_QWORD *)(a1 + 24))
    *(_QWORD *)(a1 + 24) = "RAR";
  v10 = **(int ***)(a1 + 2472);
  v11 = v10 + 5062;
  if (v10[5062] == -1)
    *v11 = 0;
  v12 = (_BYTE *)sub_1DB6E2588(a1, 7uLL, 0, a4, a5, a6, a7, a8);
  if (!v12)
    return 1;
  if (!v10[62] && (*v12 == 77 && v12[1] == 90 || *(_DWORD *)v12 == 1179403647))
  {
    v38 = 0;
    v48 = 0;
    v39 = 4096;
    while (1)
    {
LABEL_50:
      if (v39 + v38 > 0x20000)
      {
LABEL_62:
        v46 = "Couldn't find out RAR header";
        goto LABEL_69;
      }
      v40 = sub_1DB6E2588(a1, v39, &v48, v13, v14, v15, v16, v17);
      if (v40)
        break;
      v42 = v39 >= 0x80;
      v39 >>= 1;
      if (!v42)
        goto LABEL_62;
    }
    if (v48 < 64)
      goto LABEL_62;
    v43 = 0;
    while (1)
    {
      v44 = v40 + v43;
      if (*(_DWORD *)(v40 + v43) == 561144146 && *(_DWORD *)(v40 + v43 + 3) == 465441)
        break;
      v43 += 16;
      if (v44 + 23 >= v40 + v48)
      {
        sub_1DB6E26F0(a1, v43, v41, v13, v14, v15, v16, v17);
        v38 += v43;
        goto LABEL_50;
      }
    }
    sub_1DB6E26F0(a1, v43, v41, v13, v14, v15, v16, v17);
  }
  v10[62] = 1;
  v18 = (unsigned __int16 *)sub_1DB6E2588(a1, 7uLL, 0, v13, v14, v15, v16, v17);
  if (!v18)
    return 4294967266;
  v47 = a2;
  while (2)
  {
    v20 = *((unsigned __int8 *)v18 + 2);
    switch(*((_BYTE *)v18 + 2))
    {
      case 'r':
        if (*(_DWORD *)v18 != 561144146 || *(_DWORD *)((char *)v18 + 3) != 465441)
        {
          v46 = "Invalid marker header";
          goto LABEL_69;
        }
        v34 = 7;
        goto LABEL_43;
      case 's':
        *v10 = *(unsigned __int16 *)((char *)v18 + 3);
        v34 = *(unsigned __int16 *)((char *)v18 + 5);
        if (v34 <= 0xC)
          goto LABEL_66;
        v35 = (unsigned __int16 *)sub_1DB6E2588(a1, v34, 0, v13, v14, v15, v16, v17);
        if (!v35)
          return 4294967266;
        *((_WORD *)v10 + 8) = *(unsigned __int16 *)((char *)v35 + 7);
        *(int *)((char *)v10 + 18) = *(_DWORD *)((char *)v35 + 9);
        v36 = *v10;
        if ((*v10 & 0x200) == 0)
          goto LABEL_41;
        if (v34 <= 0xD)
        {
LABEL_66:
          v46 = "Invalid header size";
          goto LABEL_69;
        }
        *((_BYTE *)v10 + 22) = *((_BYTE *)v35 + 13);
LABEL_41:
        if ((v36 & 0x80) != 0)
        {
          archive_entry_set_is_metadata_encrypted((uint64_t)v47, 1);
          archive_entry_set_is_data_encrypted((uint64_t)v47, 1);
          *v11 = 1;
          v46 = "RAR encryption support unavailable.";
          goto LABEL_69;
        }
        if (*v35 != (unsigned __int16)crc32(0, (const Bytef *)v35 + 2, (int)v34 - 2))
          goto LABEL_65;
LABEL_43:
        sub_1DB6E26F0(a1, v34, v19, v13, v14, v15, v16, v17);
        goto LABEL_45;
      case 't':
        return sub_1DB748498(a1, (uint64_t)v47, (char)v20, v13, v14, v15, v16, v17);
      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case '{':
        v21 = *(unsigned __int16 *)((char *)v18 + 5);
        if (v21 <= 6)
          goto LABEL_63;
        if (((char)v18[2] & 0x80000000) == 0)
          goto LABEL_18;
        if (v21 <= 0xA)
        {
LABEL_63:
          v46 = "Invalid header size too small";
          goto LABEL_69;
        }
        v18 = (unsigned __int16 *)sub_1DB6E2588(a1, v21, 0, v13, v14, v15, v16, v17);
        if (!v18)
          return 4294967266;
        v21 += *(unsigned int *)((char *)v18 + 7);
LABEL_18:
        v22 = *v18;
        sub_1DB6E26F0(a1, 2, v19, v13, v14, v15, v16, v17);
        v23 = v21 - 2;
        if (v21 == 2)
        {
          LOWORD(v24) = 0;
LABEL_27:
          if (v22 != (unsigned __int16)v24)
          {
LABEL_65:
            v46 = "Header CRC error";
            goto LABEL_69;
          }
          if (v20 == 123)
            return 1;
LABEL_45:
          v18 = (unsigned __int16 *)sub_1DB6E2588(a1, 7uLL, 0, v13, v14, v15, v16, v17);
          if (!v18)
            return 4294967266;
          continue;
        }
        v24 = 0;
        while (1)
        {
          v25 = v23 >= 0x8000 ? 0x8000 : v23;
          v26 = (const Bytef *)sub_1DB6E2588(a1, v25, 0, v13, v14, v15, v16, v17);
          if (!v26)
            break;
          v24 = crc32(v24, v26, v25);
          sub_1DB6E26F0(a1, v25, v27, v28, v29, v30, v31, v32);
          v23 -= v25;
          if (!v23)
            goto LABEL_27;
        }
LABEL_48:
        v46 = "Bad RAR file";
LABEL_69:
        archive_set_error((_DWORD *)a1, 79, v46, v13, v14, v15, v16, v17, v47);
        return 4294967266;
      case 'z':
        result = sub_1DB748498(a1, (uint64_t)v47, (char)v20, v13, v14, v15, v16, v17);
        if ((int)result >= -20)
          goto LABEL_45;
        return result;
      default:
        goto LABEL_48;
    }
  }
}

uint64_t sub_1DB74733C(uint64_t a1, const Bytef **a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t a9)
{
  _QWORD *v10;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  int v20;
  char v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  char *v36;
  int v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  char v41;
  BOOL v42;
  BOOL v43;
  unsigned int v44;
  unsigned int v45;
  unint64_t v46;
  int v47;
  unsigned int v48;
  int v49;
  int v50;
  int *v51;
  int v52;
  int v53;
  int *v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int *v59;
  int v60;
  int v61;
  uint64_t v62;
  int v63;
  int v64;
  int *v65;
  int v66;
  int v67;
  unint64_t v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  unsigned int v75;
  uint64_t v76;
  _DWORD *v77;
  int v78;
  uint64_t v79;
  int v80;
  _DWORD *v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const Bytef *v97;
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
  uint64_t v109;
  uint64_t v110;
  _BYTE *v111;
  char *v112;
  int v113;
  int v114;
  uint64_t v116;
  char v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  _BYTE *v127;
  char *v128;
  int v129;
  int v130;
  uint64_t v132;
  char v133;
  uint64_t v134;
  int v135;
  int v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  const Bytef *v140;
  uint64_t v141;
  uint64_t v143;
  const Bytef *v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  const Bytef *v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  _QWORD *v155;
  _QWORD *v156;
  uint64_t v157;
  const Bytef **v158;
  _QWORD *v159;
  int *v160;
  uint64_t v161;
  unsigned __int16 **v162;
  int *v163;
  unint64_t *v164;
  uint64_t v165;
  uint64_t v166;

  v10 = (_QWORD *)a3;
  v13 = **(_QWORD **)(a1 + 2472);
  if (*(_DWORD *)(v13 + 20248) == -1)
    *(_DWORD *)(v13 + 20248) = 0;
  v14 = *(_QWORD *)(v13 + 160);
  if (v14 >= 1)
  {
    sub_1DB6E26F0(a1, v14, a3, (uint64_t)a4, a5, a6, a7, a8);
    *(_QWORD *)(v13 + 160) = 0;
  }
  *a2 = 0;
  if (*(_BYTE *)(v13 + 237) || *(_QWORD *)(v13 + 200) >= *(_QWORD *)(v13 + 40))
  {
    *v10 = 0;
    v141 = *(_QWORD *)(v13 + 184);
    *a4 = v141;
    if (v141 <= *(_QWORD *)(v13 + 40))
      v141 = *(_QWORD *)(v13 + 40);
    *a4 = v141;
    return 1;
  }
  v15 = *(char *)(v13 + 23);
  if ((v15 - 49) >= 5)
  {
    if (v15 == 48)
    {
      v166 = 0;
      v143 = **(_QWORD **)(a1 + 2472);
      if (*(_QWORD *)(v143 + 168) || (*(_BYTE *)v143 & 1) != 0 && (*(_BYTE *)(v143 + 24) & 2) != 0)
      {
        v144 = (const Bytef *)sub_1DB749130(a1, 1uLL, &v166, (uint64_t)a4, a5, a6, a7, a8);
        *a2 = v144;
        v145 = v166;
        if (v166 > 0)
        {
          *v10 = v166;
          *a4 = *(_QWORD *)(v143 + 184);
          *(_QWORD *)(v143 + 184) += v145;
          *(_QWORD *)(v143 + 200) += v145;
          v146 = *(_QWORD *)(v143 + 168) - v145;
          *(_QWORD *)(v143 + 160) = v145;
          *(_QWORD *)(v143 + 168) = v146;
          v17 = 0;
          *(_QWORD *)(v143 + 240) = crc32(*(_QWORD *)(v143 + 240), v144, v145);
          return v17;
        }
        v147 = "Truncated RAR file data";
      }
      else
      {
        *a2 = 0;
        *v10 = 0;
        *a4 = *(_QWORD *)(v143 + 184);
        if (*(_QWORD *)(v143 + 8) == *(_QWORD *)(v143 + 240))
        {
          v17 = 1;
          *(_BYTE *)(v143 + 237) = 1;
          return v17;
        }
        v147 = "File CRC error";
      }
    }
    else
    {
      v147 = "Unsupported compression method for RAR file.";
    }
    archive_set_error((_DWORD *)a1, 79, v147, (uint64_t)a4, a5, a6, a7, a8, v153);
    return 4294967266;
  }
  v155 = v10;
  v156 = a4;
  v16 = 0;
  while (2)
  {
    v17 = 0;
    v154 = v16 + 1;
    v18 = **(_QWORD **)(a1 + 2472);
    v162 = (unsigned __int16 **)(v18 + 928);
    v165 = v18 + 20112;
LABEL_10:
    while (2)
    {
      if (!*(_BYTE *)(v18 + 208))
        goto LABEL_214;
      if (*(_BYTE *)(v18 + 922))
        goto LABEL_215;
      if (*(_DWORD *)(v18 + 232))
      {
        a3 = *(_QWORD *)(v18 + 184);
        if (a3 >= *(_QWORD *)(v18 + 40))
        {
LABEL_215:
          v149 = *(unsigned int *)(v18 + 212);
          if ((_DWORD)v149)
          {
            v150 = *(const Bytef **)(v18 + 224);
            *a2 = v150;
            *v155 = v149;
            *v156 = *(_QWORD *)(v18 + 192);
            *(_QWORD *)(v18 + 192) += v149;
            v17 = 0;
            *(_QWORD *)(v18 + 240) = crc32(*(_QWORD *)(v18 + 240), v150, v149);
            *(_DWORD *)(v18 + 212) = 0;
            return v17;
          }
          *a2 = 0;
          *v155 = 0;
          *v156 = *(_QWORD *)(v18 + 184);
          if (*(_QWORD *)(v18 + 8) == *(_QWORD *)(v18 + 240))
          {
            v17 = 1;
            *(_BYTE *)(v18 + 237) = 1;
            goto LABEL_230;
          }
          v148 = "File CRC error";
LABEL_213:
          archive_set_error((_DWORD *)a1, 79, v148, (uint64_t)a4, a5, a6, a7, a8, v153);
LABEL_214:
          v17 = 4294967266;
LABEL_230:
          sub_1DB6E8390(v13 + 928);
          *(_WORD *)(v13 + 920) = 1;
          return v17;
        }
        if (!*(_BYTE *)(v18 + 923))
        {
          v92 = *(_QWORD *)(v18 + 176);
          if (v92 >= 1)
          {
            v93 = *(_DWORD *)(v18 + 212);
            if (v92 >= (unint64_t)(*(_DWORD *)(v18 + 216) - v93))
              v94 = (*(_DWORD *)(v18 + 216) - v93);
            else
              v94 = *(_QWORD *)(v18 + 176);
            v95 = sub_1DB749204(a1, a2, a3, v94, a5, a6, a7, a8);
            if ((_DWORD)v95)
            {
              v17 = v95;
              goto LABEL_228;
            }
            v96 = *(_QWORD *)(v18 + 184) + v94;
            *(_QWORD *)(v18 + 176) -= v94;
            *(_QWORD *)(v18 + 184) = v96;
            v97 = *a2;
            if (!*a2)
            {
              v17 = 0;
              continue;
            }
            *(_DWORD *)(v18 + 212) = 0;
            v152 = *(unsigned int *)(v18 + 216);
            *v155 = v152;
            *v156 = *(_QWORD *)(v18 + 192);
            *(_QWORD *)(v18 + 192) += v152;
            v17 = 0;
            *(_QWORD *)(v18 + 240) = crc32(*(_QWORD *)(v18 + 240), v97, v152);
            return v17;
          }
        }
      }
      break;
    }
    if (*(_QWORD *)(v18 + 20240))
      goto LABEL_21;
    if (*(uint64_t *)(**(_QWORD **)(a1 + 2472) + 168) >= 1)
    {
      v19 = sub_1DB749130(a1, 1uLL, (uint64_t *)(v18 + 20232), (uint64_t)a4, a5, a6, a7, a8);
      *(_QWORD *)(v18 + 20240) = v19;
      if (v19)
      {
        if (!*(_DWORD *)(v18 + 20224))
          a9 = sub_1DB749B24(a1, (unint64_t *)(v18 + 20216), a3, (uint64_t)a4, a5, a6, a7, a8, a9);
        goto LABEL_20;
      }
      v148 = "Truncated RAR file data";
      goto LABEL_213;
    }
LABEL_20:
    v17 = 0;
LABEL_21:
    if (*(_BYTE *)(v18 + 920))
    {
      v17 = sub_1DB749348(a1);
      if ((int)v17 < -20)
        goto LABEL_228;
    }
    if (*(_BYTE *)(v18 + 923))
    {
      v20 = sub_1DB722D68(v162, v165);
      if ((v20 & 0x80000000) == 0)
      {
        v21 = v20;
        if (v20 != *(_DWORD *)(v18 + 924))
        {
LABEL_135:
          *(_BYTE *)(*(_QWORD *)(v18 + 848) + (*(_DWORD *)(v18 + 856) & *(_DWORD *)(v18 + 864))) = v21;
          v90 = *(_QWORD *)(v18 + 864) + 1;
          v91 = 1;
LABEL_186:
          *(_QWORD *)(v18 + 864) = v90;
          v134 = *(_QWORD *)(v18 + 176) + v91;
          *(_QWORD *)(v18 + 176) = v134;
          goto LABEL_194;
        }
        v22 = sub_1DB722D68(v162, v165);
        if ((v22 & 0x80000000) == 0)
        {
          switch(v22)
          {
            case 0:
              *(_BYTE *)(v18 + 920) = 1;
              v16 = v154;
              if (v154 == 1025)
                goto LABEL_214;
              continue;
            case 2:
              *(_BYTE *)(v18 + 922) = 1;
              goto LABEL_199;
            case 3:
              archive_set_error((_DWORD *)a1, -1, "Parsing filters is unsupported.", (uint64_t)a4, a5, a6, a7, a8, v153);
              v17 = 4294967271;
              goto LABEL_230;
            case 4:
              v98 = 0;
              v99 = 16;
              break;
            case 5:
              v118 = sub_1DB722D68(v162, v165);
              if (v118 < 0)
                goto LABEL_212;
              v102 = v118 + 4;
              v119 = *(_DWORD *)(v18 + 856);
              v120 = v119 & *(_DWORD *)(v18 + 864);
              v121 = (v120 - 1) & v119;
              v122 = v118 + 4;
              do
              {
                if (v120 <= v121)
                  v123 = v121;
                else
                  v123 = v120;
                v124 = v119 - v123;
                if (v122 >= v124 + 1)
                  v125 = (v124 + 1);
                else
                  v125 = v122;
                v126 = *(_QWORD *)(v18 + 848);
                v127 = (_BYTE *)(v126 + v120);
                v128 = (char *)(v126 + v121);
                v129 = v125 + v120;
                v130 = v125 + v121;
                if ((int)v125 + v120 < v121 || v130 < v120)
                {
                  memcpy(v127, v128, (int)v125);
                }
                else if ((int)v125 >= 1)
                {
                  v132 = v125;
                  do
                  {
                    v133 = *v128++;
                    *v127++ = v133;
                    --v132;
                  }
                  while (v132);
                }
                v119 = *(_DWORD *)(v18 + 856);
                v120 = v119 & v129;
                v121 = v119 & v130;
                v42 = __OFSUB__(v122, (_DWORD)v125);
                v122 -= v125;
              }
              while (!((v122 < 0) ^ v42 | (v122 == 0)));
              goto LABEL_185;
            default:
              goto LABEL_135;
          }
          while (1)
          {
            v100 = sub_1DB722D68(v162, v165);
            if (v100 < 0)
              break;
            v98 |= v100 << v99;
            v99 -= 8;
            if (v99 == -8)
            {
              v101 = sub_1DB722D68(v162, v165);
              if (v101 < 0)
                break;
              v102 = v101 + 32;
              v103 = *(_DWORD *)(v18 + 856);
              v104 = v103 & *(_DWORD *)(v18 + 864);
              v105 = (v104 - v98 - 2) & v103;
              v106 = v101 + 32;
              do
              {
                if (v104 <= v105)
                  v107 = v105;
                else
                  v107 = v104;
                v108 = v103 - v107;
                if (v106 >= v108 + 1)
                  v109 = (v108 + 1);
                else
                  v109 = v106;
                v110 = *(_QWORD *)(v18 + 848);
                v111 = (_BYTE *)(v110 + v104);
                v112 = (char *)(v110 + v105);
                v113 = v109 + v104;
                v114 = v109 + v105;
                if ((int)v109 + v104 < v105 || v114 < v104)
                {
                  memcpy(v111, v112, (int)v109);
                }
                else if ((int)v109 >= 1)
                {
                  v116 = v109;
                  do
                  {
                    v117 = *v112++;
                    *v111++ = v117;
                    --v116;
                  }
                  while (v116);
                }
                v103 = *(_DWORD *)(v18 + 856);
                v104 = v103 & v113;
                v105 = v103 & v114;
                v42 = __OFSUB__(v106, (_DWORD)v109);
                v106 -= v109;
              }
              while (!((v106 < 0) ^ v42 | (v106 == 0)));
LABEL_185:
              v91 = v102;
              v90 = *(_QWORD *)(v18 + 864) + v102;
              goto LABEL_186;
            }
          }
        }
      }
LABEL_212:
      v148 = "Invalid symbol";
      goto LABEL_213;
    }
    break;
  }
  v157 = *(_QWORD *)(v18 + 184);
  v158 = a2;
  v23 = v157 + *(unsigned int *)(v18 + 232);
  *(_QWORD *)(v18 + 912) = 0x7FFFFFFFFFFFFFFFLL;
  v24 = **(_QWORD **)(a1 + 2472);
  v164 = (unint64_t *)(v24 + 20216);
  if (*(_QWORD *)(v24 + 912) >= v23)
    v25 = v23;
  else
    v25 = *(_QWORD *)(v24 + 912);
  v163 = (int *)(v24 + 20224);
  v153 = (char *)(v24 + 360);
  v160 = (int *)(v24 + 884);
  v161 = v25;
  v159 = (_QWORD *)(v24 + 888);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v17 = *(_QWORD *)(v24 + 864);
        if (*(_BYTE *)(v24 + 872))
        {
          v26 = *(unsigned int *)(v24 + 876);
          if (v17 + v26 > v25)
            goto LABEL_192;
          if ((int)v26 >= 1)
          {
            v27 = *(_DWORD *)(v24 + 856);
            v28 = v27 & v17;
            v29 = ((v27 & v17) - *(_DWORD *)(v24 + 880)) & v27;
            v30 = *(_DWORD *)(v24 + 876);
            do
            {
              if (v28 <= v29)
                v31 = v29;
              else
                v31 = v28;
              v32 = v27 - v31;
              if (v30 >= v32 + 1)
                v33 = (v32 + 1);
              else
                v33 = v30;
              v34 = *(_QWORD *)(v24 + 848);
              v35 = (_BYTE *)(v34 + v28);
              v36 = (char *)(v34 + v29);
              v37 = v33 + v28;
              v38 = v33 + v29;
              v39 = (int)v33 + v28 < v29 || v38 < v28;
              if (v39)
              {
                memcpy(v35, v36, (int)v33);
              }
              else if ((int)v33 >= 1)
              {
                v40 = v33;
                do
                {
                  v41 = *v36++;
                  *v35++ = v41;
                  --v40;
                }
                while (v40);
              }
              v27 = *(_DWORD *)(v24 + 856);
              v28 = v27 & v37;
              v29 = v27 & v38;
              v42 = __OFSUB__(v30, (_DWORD)v33);
              v30 -= v33;
            }
            while (!((v30 < 0) ^ v42 | (v30 == 0)));
            v17 = *(_QWORD *)(v24 + 864);
          }
          v17 += (int)v26;
          *(_QWORD *)(v24 + 864) = v17;
          *(_BYTE *)(v24 + 872) = 0;
        }
        if (*(_BYTE *)(v24 + 923))
          v43 = 0;
        else
          v43 = v17 < v25;
        if (!v43)
          goto LABEL_192;
        v44 = sub_1DB749FD8(a1, v24 + 280, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
        if ((v44 & 0x80000000) != 0)
          goto LABEL_227;
        v45 = v44;
        *(_BYTE *)(v24 + 872) = 0;
        if (v44 > 0xFF)
          break;
        *(_BYTE *)(*(_QWORD *)(v24 + 848) + (*(_DWORD *)(v24 + 856) & *(_DWORD *)(v24 + 864))) = v44;
        ++*(_QWORD *)(v24 + 864);
      }
      if (v44 == 256)
        break;
      if (v44 == 258)
      {
        v49 = *(_DWORD *)(v24 + 876);
        if (v49)
        {
          v47 = *(_DWORD *)(v24 + 880);
          goto LABEL_130;
        }
      }
      else
      {
        if (v44 == 257)
        {
          archive_set_error((_DWORD *)a1, -1, "Parsing filters is unsupported.", (uint64_t)a4, a5, a6, a7, a8, v153);
          v17 = -25;
          goto LABEL_228;
        }
        if (v44 <= 0x106)
        {
          v46 = v44 - 259;
          v47 = *(_DWORD *)(v24 + 4 * v46 + 884);
          v48 = sub_1DB749FD8(a1, v24 + 400, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          if (v48 > 0x1C)
            goto LABEL_225;
          v49 = byte_1DB754C94[v48] + 2;
          if (v48 >= 8)
          {
            v50 = byte_1DB754CB0[v48];
            v51 = (int *)(v24 + 20224);
            v52 = *v163;
            if (*v163 < v50)
            {
              a9 = sub_1DB749B24(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              v52 = *v163;
              if (v53)
              {
                v51 = (int *)(v24 + 20224);
              }
              else
              {
                v51 = (int *)(v24 + 20224);
                if (v52 < v50)
                  goto LABEL_226;
              }
            }
            v73 = v52 - v50;
            v49 += dword_1DB754C04[v50] & (*v164 >> v73);
            *v51 = v73;
            v25 = v161;
          }
          if (v45 >= 0x104)
          {
            do
            {
              v39 = v46 > 1;
              v160[v46] = *(_DWORD *)(v24 + 4 * (v46 - 1) + 884);
              --v46;
            }
            while (v39);
          }
          *v160 = v47;
          goto LABEL_130;
        }
        if (v44 > 0x10E)
        {
          if (v44 > 0x12B)
            goto LABEL_225;
          v62 = v44 - 271;
          v63 = byte_1DB754C94[v62] + 3;
          if (v62 >= 8)
          {
            v64 = byte_1DB754CB0[v62];
            v65 = (int *)(v24 + 20224);
            v66 = *v163;
            if (*v163 < v64)
            {
              a9 = sub_1DB749B24(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              v66 = *v163;
              if (v67)
              {
                v65 = (int *)(v24 + 20224);
              }
              else
              {
                v65 = (int *)(v24 + 20224);
                if (v66 < v64)
                  goto LABEL_226;
              }
            }
            v74 = v66 - v64;
            v63 += dword_1DB754C04[v64] & (*v164 >> v74);
            *v65 = v74;
            v25 = v161;
          }
          v75 = sub_1DB749FD8(a1, v24 + 320, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          if (v75 > 0x3C)
          {
LABEL_225:
            archive_set_error((_DWORD *)a1, 79, "Bad RAR file data", (uint64_t)a4, a5, a6, a7, a8, v153);
LABEL_227:
            v17 = -30;
            goto LABEL_228;
          }
          v47 = dword_1DB754CCC[v75] + 1;
          if (v75 >= 4)
          {
            v76 = byte_1DB754DBC[v75];
            if (v75 < 0xA)
            {
              v81 = (_DWORD *)(v24 + 20224);
              v82 = *v163;
              if (*v163 < (int)v76)
              {
                a9 = sub_1DB749B24(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
                v82 = *v163;
                if (v83)
                {
                  v81 = (_DWORD *)(v24 + 20224);
                }
                else
                {
                  v81 = (_DWORD *)(v24 + 20224);
                  if (v82 < (int)v76)
                    goto LABEL_226;
                }
              }
              v84 = v82 - v76;
              v47 += dword_1DB754C04[v76] & (*v164 >> v84);
              *v81 = v84;
LABEL_122:
              v25 = v161;
            }
            else
            {
              if ((unint64_t)v75 - 12 <= 0x2F)
              {
                v77 = (_DWORD *)(v24 + 20224);
                v78 = *v163;
                v79 = v76 - 4;
                if (*v163 < (int)v79)
                {
                  a9 = sub_1DB749B24(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
                  v78 = *v163;
                  if (v80)
                  {
                    v77 = (_DWORD *)(v24 + 20224);
                  }
                  else
                  {
                    v77 = (_DWORD *)(v24 + 20224);
                    if (v78 < (int)v79)
                      goto LABEL_226;
                  }
                }
                v85 = v78 - v79;
                v47 += 16 * (dword_1DB754C04[v79] & (*v164 >> v85));
                *v77 = v85;
              }
              v86 = *(_DWORD *)(v24 + 904);
              if (v86)
              {
                *(_DWORD *)(v24 + 904) = v86 - 1;
                v47 += *(_DWORD *)(v24 + 900);
                goto LABEL_122;
              }
              v89 = sub_1DB749FD8(a1, (uint64_t)v153, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              v25 = v161;
              if (v89 < 0)
                goto LABEL_227;
              if (v89 == 16)
              {
                *(_DWORD *)(v24 + 904) = 15;
                v47 += *(_DWORD *)(v24 + 900);
              }
              else
              {
                v47 += v89;
                *(_DWORD *)(v24 + 900) = v89;
              }
            }
          }
          if (v47 < 0x40000)
            v87 = v63;
          else
            v87 = v63 + 1;
          v88 = *(_QWORD *)v160;
          *(_DWORD *)(v24 + 896) = *(_DWORD *)(v24 + 892);
          *v159 = v88;
          if (v47 < 0x2000)
            v49 = v87;
          else
            v49 = v87 + 1;
          *v160 = v47;
          goto LABEL_130;
        }
        v57 = byte_1DB754DF8[v44 - 263];
        v58 = byte_1DB754E00[v44 - 263];
        v59 = (int *)(v24 + 20224);
        v60 = *v163;
        if (*v163 < v58)
        {
          a9 = sub_1DB749B24(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          v60 = *v163;
          if (v61)
          {
            v59 = (int *)(v24 + 20224);
          }
          else
          {
            v59 = (int *)(v24 + 20224);
            if (v60 < v58)
              goto LABEL_226;
          }
        }
        v70 = v60 - v58;
        v71 = dword_1DB754C04[v58] & (*v164 >> v70);
        *v59 = v70;
        v25 = v161;
        v72 = *(_DWORD *)(v24 + 892);
        *v159 = *(_QWORD *)v160;
        *(_DWORD *)(v24 + 896) = v72;
        v47 = v57 + 1 + v71;
        *v160 = v47;
        v49 = 2;
LABEL_130:
        *(_DWORD *)(v24 + 880) = v47;
        *(_DWORD *)(v24 + 876) = v49;
        *(_BYTE *)(v24 + 872) = 1;
      }
    }
    v54 = (int *)(v24 + 20224);
    v55 = *v163;
    if (*v163 <= 0)
    {
      a9 = sub_1DB749B24(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
      v55 = *v163;
      if (v56)
      {
        v54 = (int *)(v24 + 20224);
      }
      else
      {
        v54 = (int *)(v24 + 20224);
        if (v55 < 1)
          goto LABEL_226;
      }
    }
    v68 = *v164;
    v69 = v55 - 1;
    *v54 = v55 - 1;
    if (((v68 >> (v55 - 1)) & 1) == 0)
      break;
    v25 = v161;
    if (sub_1DB749348(a1))
      goto LABEL_227;
  }
  *(_BYTE *)(v24 + 236) = 1;
  if (v55 <= 1)
  {
    sub_1DB749B24(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
    v69 = *v54;
    if (!v135 && v69 < 1)
    {
LABEL_226:
      archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", (uint64_t)a4, a5, a6, a7, a8, v153);
      *(_BYTE *)(v24 + 208) = 0;
      goto LABEL_227;
    }
    v68 = *v164;
  }
  v136 = v69 - 1;
  *(_BYTE *)(v24 + 920) = (v68 >> v136) & 1;
  *v54 = v136;
  v17 = *(_QWORD *)(v24 + 864);
LABEL_192:
  if (v17 < 0)
    goto LABEL_228;
  a2 = v158;
  v134 = v17 - v157;
  *(_QWORD *)(v18 + 176) = v17 - v157;
  if (v17 == v157)
  {
    v148 = "Internal error extracting RAR file";
    goto LABEL_213;
  }
LABEL_194:
  v137 = *(_DWORD *)(v18 + 212);
  if (v134 >= (*(_DWORD *)(v18 + 216) - v137))
    v138 = (*(_DWORD *)(v18 + 216) - v137);
  else
    v138 = v134;
  v17 = sub_1DB749204(a1, a2, *(_QWORD *)(v18 + 184), v138, a5, a6, a7, a8);
  if (!(_DWORD)v17)
  {
    v139 = *(_QWORD *)(v18 + 184) + v138;
    *(_QWORD *)(v18 + 176) -= v138;
    *(_QWORD *)(v18 + 184) = v139;
LABEL_199:
    v140 = *a2;
    if (*a2)
    {
      *(_DWORD *)(v18 + 212) = 0;
      v151 = *(unsigned int *)(v18 + 216);
      *v155 = v151;
      *v156 = *(_QWORD *)(v18 + 192);
      *(_QWORD *)(v18 + 192) += v151;
      *(_QWORD *)(v18 + 240) = crc32(*(_QWORD *)(v18 + 240), v140, v151);
      goto LABEL_228;
    }
    goto LABEL_10;
  }
LABEL_228:
  if ((_DWORD)v17 != -20 && (_DWORD)v17)
    goto LABEL_230;
  return v17;
}

uint64_t sub_1DB7480F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  while (1)
  {
    v9 = *(uint64_t **)(a1 + 2472);
    v10 = *v9;
    v11 = *(_QWORD *)(*v9 + 160);
    if (v11 >= 1)
    {
      sub_1DB6E26F0(a1, v11, a3, a4, a5, a6, a7, a8);
      *(_QWORD *)(v10 + 160) = 0;
    }
    v12 = *(_QWORD *)(v10 + 168);
    if (v12 >= 1 && sub_1DB6E26F0(a1, v12, a3, a4, a5, a6, a7, a8) < 0)
      break;
    if ((*(_BYTE *)v10 & 1) == 0 || (*(_BYTE *)(v10 + 24) & 2) == 0)
      return 0;
    result = sub_1DB746F3C(a1, *(char **)(a1 + 160), a3, a4, a5, a6, a7, a8);
    if ((_DWORD)result == 1)
      result = sub_1DB746F3C(a1, *(char **)(a1 + 160), a3, a4, a5, a6, a7, a8);
    if ((_DWORD)result)
      return result;
  }
  return 4294967266;
}

uint64_t sub_1DB74818C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t *v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;

  v9 = **(_QWORD **)(a1 + 2472);
  if (*(_BYTE *)(v9 + 23) != 48)
  {
    v11 = "Seeking of compressed RAR files is unsupported";
LABEL_6:
    archive_set_error((_DWORD *)a1, -1, v11, a4, a5, a6, a7, a8, v46);
    return -25;
  }
  if (a3 == 2)
  {
    v10 = (uint64_t *)(v9 + 40);
  }
  else
  {
    if (a3 != 1)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v10 = (uint64_t *)(v9 + 200);
  }
  v13 = *v10;
LABEL_10:
  v14 = v13 + a2;
  if (v13 + a2 < 0)
    return -1;
  v15 = *(_QWORD *)(v9 + 40);
  if (v14 > v15)
  {
    *(_QWORD *)(v9 + 200) = v14;
    v14 = v15;
  }
  v16 = *(_QWORD *)(v9 + 256);
  v17 = *(_QWORD *)(v16 + 8) + v14;
  v18 = *(_DWORD *)(v9 + 264);
  if (v18)
  {
    v19 = (_QWORD *)(v16 + 32);
    v20 = *(unsigned int *)(v9 + 264);
    do
    {
      v17 = *v19 + v17 - *(v19 - 2);
      v19 += 3;
      --v20;
    }
    while (v20);
  }
  if ((*(_BYTE *)v9 & 1) == 0)
    goto LABEL_17;
  do
  {
    while (1)
    {
      v28 = *(_QWORD *)(v16 + 24 * v18 + 8);
      if (v17 < v28 && (*(_BYTE *)(v9 + 24) & 1) != 0)
        break;
      v29 = *(_QWORD *)(v16 + 24 * v18 + 16);
      if (v17 <= v29 || (*(_BYTE *)(v9 + 24) & 2) == 0)
        goto LABEL_17;
      v30 = v18 + 1;
      *(_DWORD *)(v9 + 264) = v18 + 1;
      if (v18 + 1 >= *(_DWORD *)(v9 + 268) || v17 <= *(_QWORD *)(v16 + 24 * v30 + 16))
      {
        *(_DWORD *)(v9 + 264) = v18;
        result = sub_1DB6F802C(a1, v29, 0);
        if (result < 0)
          return result;
        v38 = sub_1DB746F3C(a1, *(char **)(a1 + 160), v32, v33, v34, v35, v36, v37);
        if (v38 == 1)
        {
          *(_BYTE *)(v9 + 252) = 1;
          v38 = sub_1DB746F3C(a1, *(char **)(a1 + 160), v39, a4, a5, a6, a7, a8);
        }
        if (v38)
          goto LABEL_44;
        v16 = *(_QWORD *)(v9 + 256);
        v18 = *(_DWORD *)(v9 + 264);
        v17 = *(_QWORD *)(v16 + 24 * v18 + 8) + v17 - *(_QWORD *)(v16 + 24 * (v18 - 1) + 16);
      }
      else
      {
        v17 = v17 - v29 + *(_QWORD *)(v16 + 24 * v30 + 8);
        ++v18;
      }
    }
    if (!v18)
    {
      v11 = "Attempt to seek past beginning of RAR data block";
      goto LABEL_6;
    }
    *(_DWORD *)(v9 + 264) = --v18;
    v31 = *(_QWORD *)(v16 + 24 * v18 + 8);
    v17 += *(_QWORD *)(v16 + 24 * v18 + 16) - v28;
  }
  while (v17 < v31);
  result = sub_1DB6F802C(a1, v31 - *(_QWORD *)(v16 + 24 * v18), 0);
  if ((result & 0x8000000000000000) == 0)
  {
    if (sub_1DB746F3C(a1, *(char **)(a1 + 160), v40, v41, v42, v43, v44, v45))
    {
LABEL_44:
      v11 = "Error during seek of RAR file";
      goto LABEL_6;
    }
    --*(_DWORD *)(v9 + 264);
LABEL_17:
    result = sub_1DB6F802C(a1, v17, 0);
    if ((result & 0x8000000000000000) == 0)
    {
      v21 = *(_QWORD *)(v9 + 256);
      v22 = *(unsigned int *)(v9 + 264);
      *(_QWORD *)(v9 + 168) = *(_QWORD *)(v21 + 24 * v22 + 16) - result;
      if ((_DWORD)v22)
      {
        v23 = (uint64_t *)(v21 + 24 * v22 + 8);
        v24 = v22 - 1;
        do
        {
          v25 = *v23;
          v23 -= 3;
          v26 = v24;
          result = result - v25 + *(_QWORD *)(v21 + 24 * v24-- + 16);
        }
        while (v26);
      }
      v27 = result - *(_QWORD *)(v21 + 8);
      sub_1DB6F7F30(a1);
      *(_QWORD *)(v9 + 160) = 0;
      *(_QWORD *)(v9 + 184) = 0;
      if (v27 != *(_QWORD *)(v9 + 40) || (result = *(_QWORD *)(v9 + 200), result <= v27))
      {
        *(_QWORD *)(v9 + 200) = v27;
        return v27;
      }
    }
  }
  return result;
}

uint64_t sub_1DB748468()
{
  return 3;
}

uint64_t sub_1DB748470(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  if (a1 && (v1 = *(uint64_t **)(a1 + 2472)) != 0 && (v2 = *v1) != 0)
    return *(unsigned int *)(v2 + 20248);
  else
    return 0xFFFFFFFFLL;
}

uint64_t sub_1DB748498(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  char *v23;
  uLong v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const Bytef *v31;
  const Bytef *v32;
  double v33;
  uint32x4_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  size_t v47;
  char *v48;
  unint64_t v49;
  size_t v50;
  unint64_t v51;
  unsigned __int16 *v52;
  char *v53;
  unsigned __int16 *v54;
  uint64_t v55;
  char *j;
  _QWORD *v57;
  size_t v58;
  char *i;
  unsigned int v60;
  _QWORD *v61;
  _QWORD *v62;
  unsigned __int16 *v63;
  void *v65;
  uint64_t v66;
  _DWORD *v67;
  int v68;
  uint64_t result;
  void *v70;
  _QWORD *v71;
  uint32x4_t v72;
  int v73;
  uint64_t v74;
  unsigned __int16 *v75;
  unint64_t v76;
  unsigned int v77;
  unsigned int v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int16 v83;
  unsigned int v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  int v103;
  unsigned int v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unsigned __int16 *v108;
  uint64_t v109;
  int v110;

  v11 = **(_QWORD **)(a1 + 2472);
  v12 = (_DWORD *)(v11 + 20176);
  v13 = *(_QWORD *)(v11 + 20192);
  if (!v13)
  {
    if (*v12)
    {
      v13 = *(_QWORD *)(v11 + 20184);
    }
    else
    {
      v13 = sub_1DB6E54AC();
      *(_QWORD *)(v11 + 20184) = v13;
      *v12 = 1;
    }
  }
  v14 = (unsigned __int8 *)sub_1DB6E2588(a1, 7uLL, 0, a4, a5, a6, a7, a8);
  if (!v14)
    return 4294967266;
  v20 = *v14;
  v21 = v14[1];
  v22 = *(unsigned __int16 *)(v14 + 5);
  *(_DWORD *)(v11 + 24) = *(unsigned __int16 *)(v14 + 3);
  if (v22 <= 0x1F)
    goto LABEL_7;
  v24 = crc32(0, v14 + 2, 5u);
  sub_1DB6E26F0(a1, 7, v25, v26, v27, v28, v29, v30);
  if ((*(_BYTE *)(v11 + 24) & 0x10) != 0)
  {
    v23 = "RAR solid archive support unavailable.";
    goto LABEL_59;
  }
  v109 = a2;
  v110 = a3;
  *(_QWORD *)(v11 + 32) = 0;
  *(_BYTE *)(v11 + 23) = 0;
  *(_WORD *)(v11 + 64) = 0;
  *(_QWORD *)(v11 + 104) = 0;
  *(_QWORD *)(v11 + 48) = 0;
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 40) = 0;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 144) = 0u;
  v31 = (const Bytef *)sub_1DB6E2588(a1, v22 - 7, 0, v15, v16, v17, v18, v19);
  if (!v31)
    return 4294967266;
  v32 = v31;
  if ((v20 | (v21 << 8)) != (unsigned __int16)crc32(v24, v31, (int)v22 - 7))
  {
    v23 = "Header CRC error";
    goto LABEL_59;
  }
  v36 = *(unsigned int *)v32;
  v35 = *((unsigned int *)v32 + 1);
  v37 = *(unsigned int *)(v32 + 9);
  v38 = *(_DWORD *)(v32 + 13);
  v107 = v32[19];
  v105 = v32[20];
  v103 = *(_DWORD *)(v32 + 21);
  v104 = *((char *)v32 + 8);
  *(_BYTE *)(v11 + 23) = v32[18];
  *(_QWORD *)(v11 + 48) = sub_1DB748E38(v38, v33, v34);
  *(_QWORD *)(v11 + 8) = v37;
  v39 = *(_DWORD *)(v11 + 24);
  if ((v39 & 4) != 0)
  {
    archive_entry_set_is_data_encrypted(a2, 1);
    *(_DWORD *)(v11 + 20248) = 1;
    archive_set_error((_DWORD *)a1, 79, "RAR encryption support unavailable.", v40, v41, v42, v43, v44, v102);
    v39 = *(_DWORD *)(v11 + 24);
  }
  if ((v39 & 0x100) != 0)
  {
    if (v22 <= 0x27)
      goto LABEL_7;
    v36 |= (unint64_t)*(unsigned int *)(v32 + 25) << 32;
    v49 = v35 | ((unint64_t)*(unsigned int *)(v32 + 29) << 32);
    *(_QWORD *)(v11 + 32) = v36;
    *(_QWORD *)(v11 + 40) = v49;
    if (v36 < 0 || (v49 & 0x8000000000000000) != 0)
    {
      v23 = "Invalid sizes specified.";
      goto LABEL_59;
    }
    v45 = (char *)(v32 + 33);
  }
  else
  {
    v45 = (char *)(v32 + 25);
    *(_QWORD *)(v11 + 32) = v36;
    *(_QWORD *)(v11 + 40) = v35;
  }
  *(_QWORD *)(v11 + 168) = v36;
  if (v110 == 122)
  {
    v46 = v45;
    v22 += v36;
    v47 = sub_1DB6E2588(a1, v22 - 7, 0, v15, v16, v17, v18, v19);
    if (v47)
    {
      v48 = (char *)(v22 - 7 + v47);
      v45 = (char *)(v47 + v46 - (char *)v32);
      goto LABEL_25;
    }
    return 4294967266;
  }
  v48 = (char *)&v32[v22 - 7];
LABEL_25:
  v50 = v107 | (v105 << 8);
  if (&v45[v50] > v48)
  {
    v23 = "Invalid filename size";
    goto LABEL_59;
  }
  v106 = (unint64_t)v48;
  v108 = (unsigned __int16 *)&v45[v50];
  v51 = (2 * v50 + 2);
  v52 = *(unsigned __int16 **)(v11 + 72);
  if (*(_QWORD *)(v11 + 96) < v51)
  {
    v53 = v45;
    v54 = (unsigned __int16 *)malloc_type_realloc(*(void **)(v11 + 72), (2 * v50 + 2), 0x226407EDuLL);
    if (!v54)
      goto LABEL_81;
    v52 = v54;
    *(_QWORD *)(v11 + 72) = v54;
    *(_QWORD *)(v11 + 96) = v51;
    v45 = v53;
  }
  v55 = (uint64_t)v45;
  memcpy(v52, v45, v50);
  *((_BYTE *)v52 + v50) = 0;
  if ((*(_BYTE *)(v11 + 25) & 2) != 0)
  {
    v58 = strlen((const char *)v52);
    if (v58 == v50)
    {
      v57 = *(_QWORD **)(v11 + 20200);
      if (!v57)
      {
        v57 = sub_1DB6E3A78(a1, "UTF-8", 1);
        *(_QWORD *)(v11 + 20200) = v57;
        if (!v57)
          return 4294967266;
      }
      for (i = strchr((char *)v52, 92); i; i = strchr((char *)v52, 92))
        *i = 47;
    }
    else
    {
      v60 = v58 + 1;
      v16 = v55;
      if ((int)v58 + 1 < v50)
        v60 = v58 + 2;
      v17 = (2 * v50);
      if (v60 < v50 && (_DWORD)v50)
        __asm { BR              X15 }
      *v52 = 0;
      v61 = *(_QWORD **)(v11 + 20208);
      if (!v61)
      {
        v62 = sub_1DB6E3A78(a1, "UTF-16BE", 1);
        v16 = v55;
        *(_QWORD *)(v11 + 20208) = v62;
        v61 = v62;
        if (!v62)
          return 4294967266;
      }
      LODWORD(v50) = 1;
      v57 = v61;
      if (*v52)
      {
        v63 = v52 + 1;
        do
        {
          if (*(v63 - 1) == 23552)
            *((_BYTE *)v63 - 1) = 47;
        }
        while (*v63++);
      }
      v108 = (unsigned __int16 *)(v16 + v60);
    }
  }
  else
  {
    for (j = strchr((char *)v52, 92); j; j = strchr((char *)v52, 92))
      *j = 47;
    v57 = (_QWORD *)v13;
  }
  v65 = *(void **)(v11 + 80);
  if (v65
    && *(_QWORD *)(v11 + 88) == v50
    && !memcmp(*(const void **)(v11 + 72), *(const void **)(v11 + 80), (v50 + 1)))
  {
    sub_1DB6E26F0(a1, v22 - 7, v66, v15, v16, v17, v18, v19);
    v77 = *(_DWORD *)(v11 + 264) + 1;
    *(_DWORD *)(v11 + 264) = v77;
    v78 = *(_DWORD *)(v11 + 268);
    if (v77 < v78)
    {
      v79 = *(char **)(v11 + 256);
      if ((*(_QWORD *)&v79[24 * v77 + 8] & 0x8000000000000000) == 0)
        return 0;
      goto LABEL_80;
    }
    v84 = v78 + 1;
    *(_DWORD *)(v11 + 268) = v84;
    v85 = (char *)malloc_type_realloc(*(void **)(v11 + 256), 24 * v84, 0x1000040504FFAC1uLL);
    *(_QWORD *)(v11 + 256) = v85;
    if (v85)
    {
      v79 = v85;
      v77 = *(_DWORD *)(v11 + 264);
      v86 = &v85[24 * v77];
      *(_QWORD *)v86 = v22;
      *((_QWORD *)v86 + 1) = -1;
      *((_QWORD *)v86 + 2) = -1;
LABEL_80:
      result = 0;
      v87 = &v79[24 * v77];
      v88 = **(_QWORD **)(a1 + 1032);
      v89 = *(_QWORD *)(v11 + 32) + v88;
      *((_QWORD *)v87 + 1) = v88;
      *((_QWORD *)v87 + 2) = v89;
      return result;
    }
LABEL_81:
    v23 = "Couldn't allocate memory.";
LABEL_82:
    v67 = (_DWORD *)a1;
    v68 = 12;
    goto LABEL_60;
  }
  if (*(_BYTE *)(v11 + 272))
  {
    v23 = "Mismatch of file parts split across multi-volume archive";
    goto LABEL_59;
  }
  v70 = malloc_type_realloc(v65, (v50 + 1), 0xD9E89EF8uLL);
  *(_QWORD *)(v11 + 80) = v70;
  memcpy(v70, *(const void **)(v11 + 72), (v50 + 1));
  *(_QWORD *)(v11 + 88) = v50;
  free(*(void **)(v11 + 256));
  v71 = malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
  *(_QWORD *)(v11 + 256) = v71;
  if (!v71)
    goto LABEL_81;
  *v71 = v22;
  v71[1] = -1;
  v71[2] = -1;
  *(_QWORD *)(v11 + 264) = 0x100000000;
  v73 = *(_DWORD *)(v11 + 24);
  if ((v73 & 0x400) != 0)
  {
    v76 = v106;
    v74 = v11 + 20176;
    if ((unint64_t)(v108 + 4) <= v106)
    {
      *(_QWORD *)(v11 + 104) = *(_QWORD *)v108;
      v75 = v108 + 4;
      goto LABEL_71;
    }
LABEL_7:
    v23 = "Invalid header size";
LABEL_59:
    v67 = (_DWORD *)a1;
    v68 = 79;
LABEL_60:
    archive_set_error(v67, v68, v23, v15, v16, v17, v18, v19, v102);
    return 4294967266;
  }
  v74 = v11 + 20176;
  v76 = v106;
  v75 = v108;
LABEL_71:
  if ((v73 & 0x1000) != 0
    && (sub_1DB748EB4(v75, (_QWORD *)v11, v76, COERCE_DOUBLE(0x100000000), v72) & 0x80000000) != 0)
  {
    goto LABEL_7;
  }
  sub_1DB6E26F0(a1, v22 - 7, v76, v15, v16, v17, v18, v19);
  v80 = **(_QWORD **)(a1 + 1032);
  v81 = *(_QWORD *)(v11 + 256);
  v82 = *(_QWORD *)(v11 + 32) + v80;
  *(_QWORD *)(v81 + 8) = v80;
  *(_QWORD *)(v81 + 16) = v82;
  if (v104 - 3 < 3)
  {
    v83 = v103;
  }
  else
  {
    if (v104 > 2)
    {
      v23 = "Unknown file attributes from RAR file's host OS";
      goto LABEL_59;
    }
    if ((v103 & 0x10) != 0)
      v83 = 16877;
    else
      v83 = -32348;
  }
  *(_WORD *)(v11 + 64) = v83;
  *(_QWORD *)(v11 + 160) = 0;
  *(_QWORD *)(v11 + 864) = 0;
  *(_DWORD *)(v11 + 232) = 0;
  *(_DWORD *)(v74 + 48) = 0;
  *(_QWORD *)(v11 + 20232) = 0;
  *(_QWORD *)(v11 + 240) = 0;
  *(_BYTE *)(v11 + 237) = 0;
  *(_OWORD *)(v11 + 176) = 0u;
  *(_OWORD *)(v11 + 192) = 0u;
  *(_BYTE *)(v11 + 208) = 1;
  *(_BYTE *)(v11 + 923) = 0;
  *(_BYTE *)(v11 + 920) = 1;
  free(*(void **)(v11 + 224));
  *(_QWORD *)(v11 + 224) = 0;
  *(_QWORD *)(v11 + 212) = 0x2000000000000;
  *(_OWORD *)(v11 + 440) = 0u;
  *(_OWORD *)(v11 + 456) = 0u;
  *(_OWORD *)(v11 + 472) = 0u;
  *(_OWORD *)(v11 + 488) = 0u;
  *(_OWORD *)(v11 + 504) = 0u;
  *(_OWORD *)(v11 + 520) = 0u;
  *(_OWORD *)(v11 + 536) = 0u;
  *(_OWORD *)(v11 + 552) = 0u;
  *(_OWORD *)(v11 + 568) = 0u;
  *(_OWORD *)(v11 + 584) = 0u;
  *(_OWORD *)(v11 + 600) = 0u;
  *(_OWORD *)(v11 + 616) = 0u;
  *(_OWORD *)(v11 + 632) = 0u;
  *(_OWORD *)(v11 + 648) = 0u;
  *(_OWORD *)(v11 + 664) = 0u;
  *(_OWORD *)(v11 + 680) = 0u;
  *(_OWORD *)(v11 + 696) = 0u;
  *(_OWORD *)(v11 + 712) = 0u;
  *(_OWORD *)(v11 + 728) = 0u;
  *(_OWORD *)(v11 + 744) = 0u;
  *(_OWORD *)(v11 + 760) = 0u;
  *(_OWORD *)(v11 + 776) = 0u;
  *(_OWORD *)(v11 + 792) = 0u;
  *(_OWORD *)(v11 + 808) = 0u;
  *(_OWORD *)(v11 + 824) = 0u;
  *(_DWORD *)(v11 + 840) = 0;
  sub_1DB6E8390(v11 + 928);
  result = 0;
  *(_WORD *)(v11 + 921) = 0;
  if (v110 != 122)
  {
    archive_entry_set_mtime(v109, *(_QWORD *)(v11 + 48), *(_QWORD *)(v11 + 56));
    archive_entry_set_ctime(v109, *(_QWORD *)(v11 + 128), *(_QWORD *)(v11 + 136));
    archive_entry_set_atime(v109, *(_QWORD *)(v11 + 112), *(_QWORD *)(v11 + 120));
    archive_entry_set_size(v109, *(_QWORD *)(v11 + 40));
    archive_entry_set_mode(v109, *(_WORD *)(v11 + 64));
    if (sub_1DB6E3BD0(v109, (char *)v52, v50, (uint64_t)v57))
    {
      if (*__error() == 12)
      {
        v23 = "Can't allocate memory for Pathname";
        goto LABEL_82;
      }
      v91 = (char *)sub_1DB72D0D4((uint64_t)v57);
      archive_set_error((_DWORD *)a1, 79, "Pathname cannot be converted from %s to current locale.", v92, v93, v94, v95, v96, v91);
      v90 = 4294967276;
    }
    else
    {
      v90 = 0;
    }
    if ((*(_WORD *)(v11 + 64) & 0xF000) == 0xA000)
    {
      *(_QWORD *)(v11 + 168) = 0;
      archive_entry_set_size(v109, 0);
      result = sub_1DB749064(a1, v109, v13, v97, v98, v99, v100, v101);
      if ((int)result < -20)
        return result;
      if ((int)v90 >= (int)result)
        result = result;
      else
        result = v90;
    }
    else
    {
      result = v90;
    }
    if (!*(_QWORD *)(v11 + 168))
      *(_BYTE *)(v11 + 237) = 1;
  }
  return result;
}

time_t sub_1DB748E38(unsigned int a1, double a2, uint32x4_t a3)
{
  int8x16_t v3;
  tm v5;

  memset(&v5.tm_wday, 0, 32);
  a3.i32[0] = a1;
  v3 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_1DB754E30);
  v3.i32[0] = vshlq_u32(a3, (uint32x4_t)xmmword_1DB754E20).u32[0];
  *(int8x16_t *)&v5.tm_sec = vandq_s8(v3, (int8x16_t)xmmword_1DB754E40);
  v5.tm_mon = ((a1 >> 21) & 0xF) - 1;
  v5.tm_year = (a1 >> 25) + 80;
  v5.tm_isdst = -1;
  return mktime(&v5);
}

uint64_t sub_1DB748EB4(unsigned __int16 *a1, _QWORD *a2, unint64_t a3, double a4, uint32x4_t a5)
{
  unsigned int *v5;
  double v9;
  unsigned int v10;
  _QWORD *v11;
  _QWORD *v12;
  int v13;
  int v14;
  time_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int *v20;
  int v21;
  tm *v22;
  unsigned int tm_sec;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  tm v28;
  time_t v29;

  v5 = (unsigned int *)(a1 + 1);
  if ((unint64_t)(a1 + 1) > a3)
    return 0xFFFFFFFFLL;
  v9 = 0.0;
  memset(&v28, 0, sizeof(v28));
  v26 = a2 + 17;
  v27 = a2 + 15;
  v10 = *a1;
  v11 = a2 + 19;
  v12 = a2 + 7;
  v13 = 3;
  do
  {
    v14 = v13;
    v29 = 0;
    if (v13 == 3)
    {
      v15 = a2[6];
      v29 = v15;
      v16 = v10 >> 12;
      if (((v10 >> 12) & 8) == 0)
        goto LABEL_29;
      if (v15)
        goto LABEL_11;
    }
    else
    {
      v16 = v10 >> (4 * v13);
      if ((v16 & 8) == 0)
        goto LABEL_29;
    }
    if ((unint64_t)(v5 + 1) > a3)
      return 0xFFFFFFFFLL;
    v29 = sub_1DB748E38(*v5++, v9, a5);
LABEL_11:
    v17 = v16 & 3;
    if ((unint64_t)v5 + v17 > a3)
      return 0xFFFFFFFFLL;
    v18 = 0;
    if ((v16 & 3) != 0)
    {
      v19 = (v17 - 1);
      v20 = v5;
      do
      {
        v21 = *(unsigned __int8 *)v20;
        v20 = (unsigned int *)((char *)v20 + 1);
        v18 = (v21 << 16) | (v18 >> 8);
        LODWORD(v17) = v17 - 1;
      }
      while ((_DWORD)v17);
      v5 = (unsigned int *)((char *)v5 + v19 + 1);
    }
    v22 = localtime_r(&v29, &v28);
    tm_sec = v22->tm_sec;
    if (v18 <= 0x98967F)
      v24 = tm_sec;
    else
      v24 = tm_sec + 1;
    if ((v16 & 4) != 0)
    {
      v22->tm_sec = tm_sec + 1;
      v29 = mktime(v22);
    }
    switch(v14)
    {
      case 3:
        a2[6] = v29;
        v25 = v12;
        break;
      case 1:
        a2[14] = v29;
        v25 = v27;
        break;
      case 2:
        a2[16] = v29;
        v25 = v26;
        break;
      default:
        a2[18] = v29;
        v25 = v11;
        break;
    }
    *v25 = v24;
LABEL_29:
    v13 = v14 - 1;
  }
  while (v14);
  return 0;
}

uint64_t sub_1DB749064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v11;
  uint64_t v12;
  char *v13;
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
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;

  v11 = *(uint64_t **)(a1 + 2472);
  v12 = *v11;
  v13 = (char *)sub_1DB6E2588(a1, *(_QWORD *)(*v11 + 32), 0, a4, a5, a6, a7, a8);
  if (!v13)
    return 4294967266;
  if (!sub_1DB6E9E80(a2, v13, *(_QWORD *)(v12 + 32), a3))
  {
    v25 = 0;
LABEL_8:
    sub_1DB6E26F0(a1, *(_QWORD *)(v12 + 32), v14, v15, v16, v17, v18, v19);
    return v25;
  }
  if (*__error() != 12)
  {
    v26 = (char *)sub_1DB72D0D4(a3);
    archive_set_error((_DWORD *)a1, 79, "link cannot be converted from %s to current locale.", v27, v28, v29, v30, v31, v26);
    v25 = 4294967276;
    goto LABEL_8;
  }
  archive_set_error((_DWORD *)a1, 12, "Can't allocate memory for link", v20, v21, v22, v23, v24, v33);
  return 4294967266;
}

size_t sub_1DB749130(uint64_t a1, size_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  size_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  while (1)
  {
    v11 = **(_QWORD **)(a1 + 2472);
    result = sub_1DB6E2588(a1, a2, a3, a4, a5, a6, a7, a8);
    if (!a3)
      break;
    v19 = *a3;
    if (*(_BYTE *)(a1 + 144))
    {
      v20 = *(_QWORD *)(a1 + 152);
      if (v19 > v20)
      {
        *a3 = v20;
        v19 = v20;
      }
    }
    v21 = *(_QWORD *)(v11 + 168);
    if (v19 > v21)
    {
      *a3 = v21;
      v19 = v21;
    }
    if ((v19 & 0x8000000000000000) == 0)
    {
      if (v19 || (*(_BYTE *)v11 & 1) == 0 || (*(_BYTE *)(v11 + 24) & 2) == 0)
        return result;
      *(_BYTE *)(v11 + 272) = 1;
      v22 = sub_1DB746F3C(a1, *(char **)(a1 + 160), v13, v14, v15, v16, v17, v18);
      if (v22 == 1)
      {
        *(_BYTE *)(v11 + 252) = 1;
        v22 = sub_1DB746F3C(a1, *(char **)(a1 + 160), v23, a4, a5, a6, a7, a8);
      }
      *(_BYTE *)(v11 + 272) = 0;
      if (!v22)
        continue;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1DB749204(uint64_t a1, _QWORD *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char *v20;
  const void *v21;
  size_t v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  char *v26;
  _DWORD *v27;
  int v28;
  uint64_t result;
  char *v30;

  v8 = a4;
  v12 = *(uint64_t **)(a1 + 2472);
  v13 = *v12;
  v14 = *(char **)(*v12 + 224);
  if (!v14)
  {
    v14 = (char *)malloc_type_malloc(*(unsigned int *)(v13 + 216), 0xA97E328uLL);
    *(_QWORD *)(v13 + 224) = v14;
    if (!v14)
    {
      v26 = "Unable to allocate memory for uncompressed data.";
      v27 = (_DWORD *)a1;
      v28 = 12;
      goto LABEL_15;
    }
  }
  v15 = *(_DWORD *)(v13 + 856);
  v16 = v15 & a3;
  v17 = (v15 & a3) + v8;
  v18 = v15 + 1;
  if (v17 <= v18)
  {
    v20 = &v14[*(unsigned int *)(v13 + 212)];
    v21 = (const void *)(*(_QWORD *)(v13 + 848) + v16);
    v22 = v8;
    goto LABEL_9;
  }
  if (v18 < v8 || (v19 = v18 - v16, v18 - v16 < 0))
  {
    v26 = "Bad RAR file data";
    v27 = (_DWORD *)a1;
    v28 = 79;
LABEL_15:
    archive_set_error(v27, v28, v26, a4, a5, a6, a7, a8, v30);
    return 4294967266;
  }
  v20 = &v14[*(unsigned int *)(v13 + 212)];
  v21 = (const void *)(*(_QWORD *)(v13 + 848) + v16);
  if (v8 <= v19)
  {
    v22 = v8;
  }
  else
  {
    memcpy(v20, v21, (v18 - v16));
    v20 = (char *)(*(_QWORD *)(v13 + 224) + (*(_DWORD *)(v13 + 212) + v19));
    v21 = *(const void **)(v13 + 848);
    v22 = v8 - v19;
  }
LABEL_9:
  memcpy(v20, v21, v22);
  v23 = *(_DWORD *)(v13 + 216);
  v24 = *(_DWORD *)(v13 + 212) + v8;
  *(_DWORD *)(v13 + 212) = v24;
  if (v24 >= v23)
    v25 = *(_QWORD *)(v13 + 224);
  else
    v25 = 0;
  result = 0;
  *a2 = v25;
  return result;
}

uint64_t sub_1DB749348(uint64_t a1)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64x2_t v10;
  int v11;
  int *v12;
  signed int v13;
  char v14;
  int v15;
  int v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  unint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64x2_t v42;
  uint64_t v43;
  int v44;
  int v46;
  unint64_t v47;
  int v48;
  int v50;
  BOOL v51;
  int v52;
  int v53;
  int v54;
  char *v55;
  int v56;
  uint64_t v57;
  unsigned int v58;
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
  unint64_t v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  unint64_t v77;
  uint64_t v78;
  unsigned int v79;
  char v80;
  int v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  void *v88;
  _DWORD *v89;
  int v90;
  void *v92[2];
  __int128 v93;
  void *v94;
  _QWORD v95[2];
  int v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v2 = **(_QWORD **)(a1 + 2472);
  v3 = (unint64_t *)(v2 + 20216);
  *(double *)v10.i64 = sub_1DB6E7CE0(a1);
  v12 = (int *)(v2 + 20224);
  v11 = *(_DWORD *)(v2 + 20224);
  v13 = v11 & 0xFFFFFFF8;
  *(_DWORD *)(v2 + 20224) = v11 & 0xFFFFFFF8;
  if ((v11 < 0) ^ v14 | ((v11 & 0xFFFFFFF8) == 0))
  {
    v10 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
    v13 = *v12;
    if (!v15 && v13 < 1)
      goto LABEL_129;
  }
  v17 = v13 - 1;
  v18 = *(_QWORD *)(v2 + 20216) >> (v13 - 1);
  *(_BYTE *)(v2 + 923) = v18 & 1;
  *v12 = v13 - 1;
  if ((v18 & 1) == 0)
  {
    if (v13 > 1
      || ((v10 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10), v17 = *v12, !v19)
        ? (v20 = v17 < 1)
        : (v20 = 0),
          !v20))
    {
      v21 = v17 - 1;
      if (((*v3 >> (v17 - 1)) & 1) == 0)
      {
        *(_DWORD *)(v2 + 840) = 0;
        v10 = 0uLL;
        *(_OWORD *)(v2 + 808) = 0u;
        *(_OWORD *)(v2 + 824) = 0u;
        *(_OWORD *)(v2 + 776) = 0u;
        *(_OWORD *)(v2 + 792) = 0u;
        *(_OWORD *)(v2 + 744) = 0u;
        *(_OWORD *)(v2 + 760) = 0u;
        *(_OWORD *)(v2 + 712) = 0u;
        *(_OWORD *)(v2 + 728) = 0u;
        *(_OWORD *)(v2 + 680) = 0u;
        *(_OWORD *)(v2 + 696) = 0u;
        *(_OWORD *)(v2 + 648) = 0u;
        *(_OWORD *)(v2 + 664) = 0u;
        *(_OWORD *)(v2 + 616) = 0u;
        *(_OWORD *)(v2 + 632) = 0u;
        *(_OWORD *)(v2 + 584) = 0u;
        *(_OWORD *)(v2 + 600) = 0u;
        *(_OWORD *)(v2 + 552) = 0u;
        *(_OWORD *)(v2 + 568) = 0u;
        *(_OWORD *)(v2 + 520) = 0u;
        *(_OWORD *)(v2 + 536) = 0u;
        *(_OWORD *)(v2 + 488) = 0u;
        *(_OWORD *)(v2 + 504) = 0u;
        *(_OWORD *)(v2 + 456) = 0u;
        *(_OWORD *)(v2 + 472) = 0u;
        *(_OWORD *)(v2 + 440) = 0u;
      }
      v22 = 0;
      *v12 = v21;
      v95[0] = 0;
      v95[1] = 0;
      v96 = 0;
      while (1)
      {
        v23 = v21;
        if (v21 <= 3)
        {
          v10 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
          v23 = *v12;
          if (!v24 && v23 < 4)
            break;
        }
        v21 = v23 - 4;
        v25 = (*v3 >> (v23 - 4)) & 0xF;
        v26 = v22 + 1;
        *((_BYTE *)v95 + v22) = v25;
        *v12 = v23 - 4;
        if ((_DWORD)v25 == 15)
        {
          if (v23 <= 7)
          {
            v10 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
            v21 = *v12;
            if (!v27 && v21 < 4)
              goto LABEL_129;
          }
          v21 -= 4;
          v28 = *v3 >> v21;
          *v12 = v21;
          if ((v28 & 0xF) != 0)
          {
            v29 = (v28 & 0xF) + 2;
            v30 = v28 & 0xF;
            if (v30 + 1 < (unint64_t)(19 - v22))
              v31 = v30 + 1;
            else
              v31 = (19 - v22);
            bzero((char *)v95 + v22, v31 + 1);
            v32 = 0;
            do
              v33 = v22 + v32++;
            while (v32 < v29 && v33 < 19);
            v26 = v22 + v32;
          }
        }
        v22 = v26;
        if (v26 >= 20)
        {
          v94 = 0;
          *(_OWORD *)v92 = 0u;
          v93 = 0u;
          v35 = sub_1DB749DF4((_DWORD *)a1, (uint64_t)v92, (uint64_t)v95, 20);
          if ((_DWORD)v35)
          {
            v43 = v35;
            free(v92[0]);
            free(v94);
            return v43;
          }
          v56 = 0;
          v57 = v2 + 440;
          do
          {
            v58 = sub_1DB749FD8(a1, (uint64_t)v92, v36, v37, v38, v39, v40, v41, v42);
            if ((v58 & 0x80000000) != 0)
            {
              free(v92[0]);
              free(v94);
              return 4294967266;
            }
            if (v58 > 0xF)
            {
              if (v58 > 0x11)
              {
                v64 = *v12;
                if (v58 == 18)
                {
                  if (v64 <= 2)
                  {
                    sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    v64 = *v12;
                    if (!v65 && v64 < 3)
                      goto LABEL_128;
                  }
                  v66 = v64 - 3;
                  v67 = 3;
                  v68 = 7;
                }
                else
                {
                  if (v64 <= 6)
                  {
                    sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    v64 = *v12;
                    if (!v69 && v64 < 7)
                    {
LABEL_128:
                      free(v92[0]);
                      free(v94);
                      goto LABEL_129;
                    }
                  }
                  v66 = v64 - 7;
                  v67 = 11;
                  v68 = 127;
                }
                v70 = *v3;
                *v12 = v66;
                v71 = (v68 & (v70 >> v66)) + v67;
                LODWORD(v72) = v71 - 1;
                if (v71 - 1 >= 403 - v56)
                  v72 = (403 - v56);
                else
                  v72 = v72;
                bzero((void *)(v57 + v56), v72 + 1);
                v73 = 0;
                do
                {
                  v74 = v73 + 1;
                  if ((int)v73 + 1 >= v71)
                    break;
                  v75 = v56 + v73++;
                }
                while (v75 < 403);
                v56 += v74;
              }
              else
              {
                if (!v56)
                {
                  free(v92[0]);
                  free(v94);
                  v55 = "Internal error extracting RAR file.";
                  goto LABEL_126;
                }
                v59 = *v12;
                if (v58 == 16)
                {
                  if (v59 <= 2)
                  {
                    v42 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    v59 = *v12;
                    if (!v60 && v59 < 3)
                      goto LABEL_128;
                  }
                  v61 = v59 - 3;
                  v62 = 3;
                  v63 = 7;
                }
                else
                {
                  if (v59 <= 6)
                  {
                    v42 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    v59 = *v12;
                    if (!v76 && v59 < 7)
                      goto LABEL_128;
                  }
                  v61 = v59 - 7;
                  v62 = 11;
                  v63 = 127;
                }
                v77 = *v3;
                *v12 = v61;
                v78 = 0;
                v79 = (v63 & (v77 >> v61)) + v62;
                v80 = *(_BYTE *)(v2 + 439 + v56);
                do
                {
                  *(_BYTE *)(v57 + v56 + v78) = v80;
                  v81 = v78 + 1;
                  if ((int)v78 + 1 >= v79)
                    break;
                  v82 = v56 + v78++;
                }
                while (v82 < 403);
                v56 += v81;
              }
            }
            else
            {
              *(_BYTE *)(v2 + v56 + 440) = (*(_BYTE *)(v2 + v56 + 440) + v58) & 0xF;
              ++v56;
            }
          }
          while (v56 < 404);
          free(v92[0]);
          free(v94);
          v43 = sub_1DB749DF4((_DWORD *)a1, v2 + 280, v2 + 440, 299);
          if ((_DWORD)v43)
            return v43;
          v43 = sub_1DB749DF4((_DWORD *)a1, v2 + 320, v2 + 739, 60);
          if ((_DWORD)v43)
            return v43;
          v43 = sub_1DB749DF4((_DWORD *)a1, v2 + 360, v2 + 799, 17);
          if ((_DWORD)v43)
            return v43;
          v43 = sub_1DB749DF4((_DWORD *)a1, v2 + 400, v2 + 816, 28);
          if ((_DWORD)v43)
            return v43;
          goto LABEL_109;
        }
      }
    }
    goto LABEL_129;
  }
  if (v13 <= 7)
  {
    v10 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
    v17 = *v12;
    if (!v44 && v17 < 7)
      goto LABEL_129;
  }
  v46 = v17 - 7;
  v47 = *v3 >> (v17 - 7);
  *v12 = v17 - 7;
  if ((v47 & 0x20) != 0)
  {
    if (v17 <= 14)
    {
      v10 = sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
      v46 = *v12;
      if (!v48 && v46 < 8)
        goto LABEL_129;
    }
    v46 -= 8;
    *(_DWORD *)(v2 + 232) = ((*(_QWORD *)(v2 + 20216) >> v46) << 20) + 0x100000;
    *v12 = v46;
  }
  if ((v47 & 0x40) != 0)
  {
    if (v46 > 7
      || ((sub_1DB749B24(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10), v46 = *v12, !v50)
        ? (v51 = v46 < 8)
        : (v51 = 0),
          !v51))
    {
      v52 = v46 - 8;
      v53 = (*(_QWORD *)(v2 + 20216) >> v52);
      *(_DWORD *)(v2 + 956) = v53;
      *(_DWORD *)(v2 + 924) = v53;
      *v12 = v52;
      if ((v47 & 0x20) == 0)
        goto LABEL_50;
      goto LABEL_59;
    }
LABEL_129:
    archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", v5, v6, v7, v8, v9, (char *)v92[0]);
    *(_BYTE *)(v2 + 208) = 0;
    return 4294967266;
  }
  *(_DWORD *)(v2 + 924) = 2;
  if ((v47 & 0x20) == 0)
  {
LABEL_50:
    if (*(_BYTE *)(v2 + 921))
    {
      if (!sub_1DB722D38(v2 + 20112))
        goto LABEL_114;
      goto LABEL_109;
    }
    v55 = "Invalid PPMd sequence";
LABEL_126:
    v89 = (_DWORD *)a1;
    v90 = 79;
    goto LABEL_127;
  }
LABEL_59:
  if ((v47 & 0x10) != 0)
    v54 = 3 * (v47 & 0x1F) - 29;
  else
    v54 = (v47 & 0x1F) + 1;
  if (v54 == 1)
  {
    v55 = "Truncated RAR file data";
    goto LABEL_126;
  }
  sub_1DB6E8390(v2 + 928);
  *(_QWORD *)(v2 + 20160) = a1;
  *(_QWORD *)(v2 + 20168) = sub_1DB749D60;
  sub_1DB722CD4((_QWORD *)(v2 + 20112));
  *(_QWORD *)(v2 + 20152) = v2 + 20160;
  sub_1DB722AE4(v2 + 928);
  v83 = *(_DWORD *)(v2 + 232);
  if (!v83)
  {
    v55 = "Invalid zero dictionary size";
    goto LABEL_126;
  }
  if (!sub_1DB722C00(v2 + 928, v83))
  {
    v55 = "Out of memory";
LABEL_123:
    v89 = (_DWORD *)a1;
    v90 = 12;
LABEL_127:
    archive_set_error(v89, v90, v55, v5, v6, v7, v8, v9, (char *)v92[0]);
    return 4294967266;
  }
  if (!sub_1DB722D38(v2 + 20112))
  {
LABEL_114:
    v55 = "Unable to initialize PPMd range decoder";
    goto LABEL_126;
  }
  sub_1DB722C84(v2 + 928, v54);
  *(_BYTE *)(v2 + 921) = 1;
LABEL_109:
  if (*(_DWORD *)(v2 + 232) && *(_QWORD *)(v2 + 848))
    goto LABEL_120;
  v84 = *(_QWORD *)(v2 + 40);
  if (v84 < 0x400000)
  {
    v86 = v84 | (v84 >> 1) | ((v84 | (v84 >> 1)) >> 2);
    v87 = v86 | (v86 >> 4) | ((v86 | (v86 >> 4)) >> 8);
    v85 = 2 * ((v87 | HIWORD(v87)) - ((v87 | HIWORD(v87)) >> 1));
    if (!v85)
    {
      v55 = "Zero window size is invalid.";
      goto LABEL_126;
    }
  }
  else
  {
    v85 = 0x400000;
  }
  v88 = malloc_type_realloc(*(void **)(v2 + 848), v85, 0xA602A866uLL);
  if (!v88)
  {
    v55 = "Unable to allocate memory for uncompressed data.";
    goto LABEL_123;
  }
  *(_QWORD *)(v2 + 848) = v88;
  *(_DWORD *)(v2 + 232) = v85;
  bzero(v88, v85);
  *(_DWORD *)(v2 + 856) = *(_DWORD *)(v2 + 232) - 1;
LABEL_120:
  v43 = 0;
  *(_BYTE *)(v2 + 920) = 0;
  return v43;
}

int64x2_t sub_1DB749B24(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t result)
{
  int64x2_t *v11;
  int v12;
  int v13;
  uint64_t *v14;
  int64x2_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  unint64_t v20;
  unsigned __int8 *v21;
  int64x2_t v22;
  int v23;
  unsigned __int8 *v24;
  unint64_t *v25;

  v11 = **(int64x2_t ***)(a1 + 2472);
  v12 = *((_DWORD *)a2 + 2);
  v13 = 64 - v12;
  v14 = (uint64_t *)(a2 + 2);
  v15 = (int64x2_t)xmmword_1DB754E80;
  while (2)
  {
    switch(v13 >> 3)
    {
      case 0:
        return result;
      case 6:
        v16 = *v14;
        v17 = *v14 - 6;
        if (*v14 < 6)
          goto LABEL_10;
        v21 = (unsigned __int8 *)a2[3];
        *a2 = (*a2 << 48) | ((unint64_t)*v21 << 40) | ((unint64_t)v21[1] << 32) | ((unint64_t)v21[2] << 24) | ((unint64_t)v21[3] << 16) | ((unint64_t)v21[4] << 8) | v21[5];
        a2[3] = (unint64_t)(v21 + 6);
        v22 = (int64x2_t)xmmword_1DB754E50;
        v23 = 48;
        goto LABEL_19;
      case 7:
        v16 = *v14;
        v17 = *v14 - 7;
        if (*v14 < 7)
          goto LABEL_10;
        v24 = (unsigned __int8 *)a2[3];
        *a2 = (*a2 << 56) | ((unint64_t)*v24 << 48) | ((unint64_t)v24[1] << 40) | ((unint64_t)v24[2] << 32) | ((unint64_t)v24[3] << 24) | ((unint64_t)v24[4] << 16) | ((unint64_t)v24[5] << 8) | v24[6];
        a2[3] = (unint64_t)(v24 + 7);
        v22 = (int64x2_t)xmmword_1DB754E60;
        v23 = 56;
        goto LABEL_19;
      case 8:
        v16 = *v14;
        v17 = *v14 - 8;
        if (*v14 < 8)
          goto LABEL_10;
        v25 = (unint64_t *)a2[3];
        *a2 = bswap64(*v25);
        a2[3] = (unint64_t)(v25 + 1);
        v22 = (int64x2_t)xmmword_1DB754E70;
        v23 = 64;
LABEL_19:
        a2[2] = v17;
        *((_DWORD *)a2 + 2) = v12 + v23;
        result = vaddq_s64(v11[10], v22);
        v11[10] = result;
        return result;
      default:
        v16 = *v14;
LABEL_10:
        if (v16 >= 1)
        {
          v18 = (unsigned __int8 *)a2[3];
          goto LABEL_17;
        }
        v19 = v11[10].i64[0];
        if (v19 >= 1)
        {
          sub_1DB6E26F0(a1, v19, a3, a4, a5, a6, a7, a8);
          v11[10].i64[0] = 0;
        }
        v18 = (unsigned __int8 *)sub_1DB749130(a1, 1uLL, v14, a4, a5, a6, a7, a8);
        a2[3] = (unint64_t)v18;
        if (v18)
        {
          v16 = *v14;
          if (*v14)
          {
            v12 = *((_DWORD *)a2 + 2);
            v15 = (int64x2_t)xmmword_1DB754E80;
LABEL_17:
            v20 = *a2;
            a2[3] = (unint64_t)(v18 + 1);
            *a2 = *v18 | (v20 << 8);
            a2[2] = v16 - 1;
            v12 += 8;
            *((_DWORD *)a2 + 2) = v12;
            v13 -= 8;
            result = vaddq_s64(v11[10], v15);
            v11[10] = result;
            continue;
          }
        }
        return result;
    }
  }
}

uint64_t sub_1DB749D60(uint64_t *a1, int64x2_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _DWORD *v9;
  uint64_t v10;
  int v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  char *v23;

  v9 = (_DWORD *)*a1;
  v10 = **(_QWORD **)(*a1 + 2472);
  v12 = (int *)(v10 + 20224);
  v11 = *(_DWORD *)(v10 + 20224);
  if (v11 <= 7
    && ((sub_1DB749B24(*a1, (unint64_t *)(v10 + 20216), a4, a5, a6, a7, a8, a9, a2), v11 = *v12, !v18)
      ? (v19 = v11 <= 7)
      : (v19 = 0),
        v19))
  {
    archive_set_error(v9, 79, "Truncated RAR file data", v13, v14, v15, v16, v17, v23);
    LOBYTE(v21) = 0;
    *(_BYTE *)(v10 + 208) = 0;
  }
  else
  {
    v20 = v11 - 8;
    v21 = *(_QWORD *)(v10 + 20216) >> (v11 - 8);
    *v12 = v20;
  }
  return v21;
}

uint64_t sub_1DB749DF4(_DWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  _DWORD *v22;
  uint64_t v23;
  int v24;
  int32x2_t *v25;
  char *v27;
  _DWORD *v28;
  int v29;
  char *v30;
  _DWORD *v31;
  int v32;

  *(_QWORD *)(a2 + 8) = 0;
  if ((sub_1DB74A1A0(a2) & 0x80000000) != 0)
  {
    v27 = "Unable to allocate memory for node data.";
    v28 = a1;
LABEL_27:
    v29 = 12;
LABEL_28:
    archive_set_error(v28, v29, v27, v8, v9, v10, v11, v12, v30);
    return 4294967266;
  }
  else
  {
    v31 = a1;
    v13 = 0;
    v14 = 1;
    *(_DWORD *)(a2 + 8) = 1;
    *(_QWORD *)(a2 + 16) = 0x800000007FFFFFFFLL;
    v15 = a4;
    v16 = 2;
    v17 = a4;
    do
    {
      if (a4 >= 1)
      {
        v18 = 0;
        do
        {
          if (v14 == *(unsigned __int8 *)(a3 + v18))
          {
            v32 = v17;
            free(*(void **)(a2 + 32));
            *(_QWORD *)(a2 + 32) = 0;
            if (*(_DWORD *)(a2 + 20) < v14)
              *(_DWORD *)(a2 + 20) = v14;
            if (*(_DWORD *)(a2 + 16) > v14)
              *(_DWORD *)(a2 + 16) = v14;
            v19 = 0;
            v20 = *(_QWORD *)a2;
            v21 = v16;
            do
            {
              v22 = (_DWORD *)(v20 + 8 * v19);
              if (*v22 == v22[1])
                goto LABEL_24;
              v23 = (v13 >> (v21 - 2)) & 1;
              v24 = v22[v23];
              if (v24 < 0)
              {
                if ((sub_1DB74A1A0(a2) & 0x80000000) != 0)
                {
                  v27 = "Unable to allocate memory for node data.";
                  v28 = v31;
                  goto LABEL_27;
                }
                v24 = *(_DWORD *)(a2 + 8);
                *(_DWORD *)(a2 + 8) = v24 + 1;
                v20 = *(_QWORD *)a2;
                *(_DWORD *)(*(_QWORD *)a2 + 8 * v19 + 4 * v23) = v24;
              }
              --v21;
              v19 = v24;
            }
            while (v21 > 1);
            v25 = (int32x2_t *)(v20 + 8 * v24);
            if (v25->i32[0] != -1 || v25->i32[1] != -2)
            {
LABEL_24:
              v27 = "Prefix found";
              v28 = v31;
              v29 = 79;
              goto LABEL_28;
            }
            *v25 = vdup_n_s32(v18);
            if (v32 < 2)
              return 0;
            ++v13;
            v17 = v32 - 1;
            v15 = a4;
          }
          ++v18;
        }
        while (v18 != v15);
      }
      if (v17 < 1)
        break;
      v13 *= 2;
      ++v14;
      ++v16;
    }
    while (v14 != 16);
    return 0;
  }
}

uint64_t sub_1DB749FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t a9)
{
  uint64_t v11;
  _QWORD *v12;
  int v13;
  int *v14;
  int v15;
  int v16;
  int v18;
  int *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unsigned int *v24;
  int v25;
  uint64_t v26;
  int v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;

  if (!*(_QWORD *)(a2 + 32))
  {
    v27 = *(_DWORD *)(a2 + 20);
    if (v27 < *(_DWORD *)(a2 + 16) || v27 > 10)
      v27 = 10;
    *(_DWORD *)(a2 + 24) = v27;
    v29 = malloc_type_calloc(1uLL, 8 << v27, 0x100004000313F17uLL);
    *(_QWORD *)(a2 + 32) = v29;
    if (sub_1DB74A22C((_DWORD *)a1, (uint64_t *)a2, 0, (uint64_t)v29, 0, *(unsigned int *)(a2 + 24), v30, v31))return 0xFFFFFFFFLL;
  }
  v11 = **(_QWORD **)(a1 + 2472);
  v12 = (_QWORD *)(v11 + 20216);
  v14 = (int *)(v11 + 20224);
  v13 = *(_DWORD *)(v11 + 20224);
  v15 = *(_DWORD *)(a2 + 24);
  if (v13 < v15)
  {
    a9 = sub_1DB749B24(a1, (unint64_t *)(v11 + 20216), a3, a4, a5, a6, a7, a8, a9);
    v13 = *v14;
    v15 = *(_DWORD *)(a2 + 24);
    if (!v16 && v13 < v15)
    {
LABEL_23:
      archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", a4, a5, a6, a7, a8, v33);
      *(_BYTE *)(v11 + 208) = 0;
      return 0xFFFFFFFFLL;
    }
  }
  v18 = v13 - v15;
  v19 = (int *)(*(_QWORD *)(a2 + 32)
              + 8 * (dword_1DB754C04[v15] & (*v12 >> (v13 - v15))));
  v20 = *v19;
  if (*v19 < 0)
  {
LABEL_15:
    archive_set_error((_DWORD *)a1, 79, "Invalid prefix code in bitstream", a4, a5, a6, a7, a8, v33);
    return 0xFFFFFFFFLL;
  }
  v21 = v19[1];
  if (v20 <= v15)
  {
    *v14 = v13 - v20;
  }
  else
  {
    *v14 = v18;
    v22 = *(_QWORD *)a2;
    v23 = v18;
    while (1)
    {
      v24 = (unsigned int *)(v22 + 8 * (int)v21);
      if (*v24 == v24[1])
        return *v24;
      if (v23 <= 0)
      {
        a9 = sub_1DB749B24(a1, (unint64_t *)(v11 + 20216), a3, a4, a5, a6, a7, a8, a9);
        v23 = *v14;
        if (!v25 && v23 <= 0)
          goto LABEL_23;
      }
      v26 = (*v12 >> --v23) & 1;
      *v14 = v23;
      v22 = *(_QWORD *)a2;
      LODWORD(v21) = *(_DWORD *)(*(_QWORD *)a2 + 8 * (int)v21 + 4 * v26);
      if ((v21 & 0x80000000) != 0)
        goto LABEL_15;
    }
  }
  return v21;
}

uint64_t sub_1DB74A1A0(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  unsigned int v5;

  v2 = *(_DWORD *)(a1 + 8);
  v3 = *(_DWORD *)(a1 + 12);
  v4 = *(void **)a1;
  if (v3 != v2)
    goto LABEL_7;
  if (v3 <= 0)
    v5 = 256;
  else
    v5 = 2 * v3;
  v4 = malloc_type_realloc(v4, 8 * v5, 0x100004000313F17uLL);
  if (v4)
  {
    *(_QWORD *)a1 = v4;
    *(_DWORD *)(a1 + 12) = v5;
    v2 = *(_DWORD *)(a1 + 8);
LABEL_7:
    *((_DWORD *)v4 + 2 * v2) = -1;
    *((_DWORD *)v4 + 2 * *(int *)(a1 + 8) + 1) = -2;
    return 1;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1DB74A22C(_DWORD *a1, uint64_t *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  _DWORD *v13;
  unsigned int v15;
  int v16;
  int v17;
  _DWORD *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v23;
  _DWORD *v24;
  char *v25;

  v9 = *a2;
  if (*a2)
  {
    v10 = a3;
    if ((a3 & 0x80000000) != 0)
    {
      v15 = 0;
    }
    else
    {
      v11 = a6;
      v12 = a5;
      v13 = (_DWORD *)a4;
      v15 = 0;
      v16 = -(int)a5;
      while (*((_DWORD *)a2 + 2) > (int)v10)
      {
        v17 = 1 << (v11 + v16);
        v18 = (_DWORD *)(v9 + 8 * v10);
        if (*v18 == v18[1])
        {
          if (v11 - 31 != v12)
          {
            if (v17 <= 1)
              v23 = 1;
            else
              v23 = v17;
            v24 = v13 + 1;
            do
            {
              *(v24 - 1) = v12;
              *v24 = *v18;
              v24 += 2;
              --v23;
            }
            while (v23);
          }
          v21 = 0;
          return v21 | v15;
        }
        if (v11 == v12)
        {
          v21 = 0;
          *v13 = v11 + 1;
          v13[1] = v10;
          return v21 | v15;
        }
        ++v12;
        v19 = sub_1DB74A22C(a1, a2);
        v9 = *a2;
        v10 = *(unsigned int *)(*a2 + 8 * v10 + 4);
        if (v17 >= 0)
          v20 = 1 << (v11 + v16);
        else
          v20 = v17 + 1;
        v13 += 2 * (v20 >> 1);
        v15 |= v19;
        LOBYTE(v16) = v16 - 1;
        if ((v10 & 0x80000000) != 0)
          break;
      }
    }
    archive_set_error(a1, 79, "Invalid location to Huffman tree specified.", a4, a5, a6, a7, a8, v25);
  }
  else
  {
    archive_set_error(a1, 79, "Huffman tree was not created.", a4, a5, a6, a7, a8, v25);
    v15 = 0;
  }
  v21 = -30;
  return v21 | v15;
}

uint64_t archive_write_set_format_gnutar(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  char *v10;

  v2 = malloc_type_calloc(1uLL, 0x68uLL, 0x1070040395D5FD2uLL);
  if (v2)
  {
    v8 = v2;
    result = 0;
    *(_QWORD *)(a1 + 264) = v8;
    *(_QWORD *)(a1 + 272) = "gnutar";
    *(_QWORD *)(a1 + 304) = sub_1DB74A4EC;
    *(_QWORD *)(a1 + 312) = sub_1DB74AB18;
    *(_QWORD *)(a1 + 320) = sub_1DB74AB60;
    *(_QWORD *)(a1 + 328) = sub_1DB74AB68;
    *(_QWORD *)(a1 + 288) = sub_1DB74A448;
    *(_QWORD *)(a1 + 296) = sub_1DB74AB94;
    *(_DWORD *)(a1 + 16) = 196612;
    *(_QWORD *)(a1 + 24) = "GNU tar";
  }
  else
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate gnutar data", v3, v4, v5, v6, v7, v10);
    return 4294967266;
  }
  return result;
}

uint64_t sub_1DB74A448(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;

  v5 = *(_QWORD *)(a1 + 264);
  if (strcmp(__s1, "hdrcharset"))
    return 4294967276;
  if (a3 && *a3)
  {
    v12 = sub_1DB72D08C(a1, a3, 0);
    *(_QWORD *)(v5 + 80) = v12;
    if (v12)
      return 0;
    else
      return 4294967266;
  }
  else
  {
    archive_set_error((_DWORD *)a1, -1, "%s: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, *(char **)(a1 + 272));
    return 4294967271;
  }
}

uint64_t sub_1DB74A4EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  char *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t *v57;
  void **v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  unsigned int v68;
  unint64_t v69;
  char *v70;
  char *__dst;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 264);
  v5 = *(_QWORD *)(v4 + 80);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 96))
    {
      v5 = *(_QWORD *)(v4 + 88);
    }
    else
    {
      v5 = sub_1DB6E54AC();
      *(_QWORD *)(v4 + 88) = v5;
      *(_DWORD *)(v4 + 96) = 1;
    }
  }
  if (archive_entry_hardlink((uint64_t)a2)
    || archive_entry_symlink((uint64_t)a2)
    || archive_entry_filetype((uint64_t)a2) != 0x8000)
  {
    archive_entry_set_size((uint64_t)a2, 0);
  }
  if (archive_entry_filetype((uint64_t)a2) == 0x4000)
  {
    v6 = (const char *)archive_entry_pathname(a2);
    if (v6)
    {
      v7 = (char *)v6;
      if (*v6)
      {
        if (v6[strlen(v6) - 1] != 47)
        {
          __dst = 0;
          v72 = 0;
          v73 = 0;
          v8 = strlen(v7);
          if (!sub_1DB6E3190((void **)&__dst, v8 + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v9, v10, v11, v12, v13, v70);
            sub_1DB6E7C3C((uint64_t)&__dst);
            return 4294967266;
          }
          v72 = 0;
          sub_1DB6E323C((uint64_t *)&__dst, v7, v8);
          sub_1DB72CE60((uint64_t *)&__dst, 47);
          archive_entry_copy_pathname((uint64_t)a2, __dst);
          sub_1DB6E7C3C((uint64_t)&__dst);
        }
      }
    }
  }
  v14 = (uint64_t *)(v4 + 40);
  if (!sub_1DB6E9040(a2, (_QWORD *)(v4 + 32), (_QWORD *)(v4 + 40), v5))
  {
    v21 = 0;
    goto LABEL_20;
  }
  if (*__error() != 12)
  {
    v22 = (char *)archive_entry_pathname(a2);
    sub_1DB72D0D4(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v23, v24, v25, v26, v27, v22);
    v21 = -20;
LABEL_20:
    if (sub_1DB6E9388(a2, (_QWORD *)(v4 + 48), (_QWORD *)(v4 + 56), v5))
    {
      if (*__error() == 12)
      {
        v20 = "Can't allocate memory for Uname";
        goto LABEL_35;
      }
      v28 = (char *)archive_entry_uname(a2);
      sub_1DB72D0D4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate uname '%s' to %s", v29, v30, v31, v32, v33, v28);
      v21 = -20;
    }
    if (sub_1DB6E8EE0(a2, (_QWORD *)(v4 + 64), (_QWORD *)(v4 + 72), v5))
    {
      if (*__error() == 12)
      {
        v20 = "Can't allocate memory for Gname";
        goto LABEL_35;
      }
      v34 = (char *)archive_entry_gname(a2);
      sub_1DB72D0D4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate gname '%s' to %s", v35, v36, v37, v38, v39, v34);
      v21 = -20;
    }
    v40 = (unint64_t *)(v4 + 24);
    if (sub_1DB6E8FCC((uint64_t)a2, (_QWORD *)(v4 + 16), (_QWORD *)(v4 + 24), v5))
    {
      if (*__error() == 12)
      {
LABEL_34:
        v20 = "Can't allocate memory for Linkname";
        goto LABEL_35;
      }
      v41 = (char *)archive_entry_hardlink((uint64_t)a2);
      sub_1DB72D0D4(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v42, v43, v44, v45, v46, v41);
      v21 = -20;
    }
    v47 = *v40;
    if (!*v40)
    {
      if (sub_1DB6E922C((uint64_t)a2, (_QWORD *)(v4 + 16), (_QWORD *)(v4 + 24), v5))
      {
        if (*__error() == 12)
          goto LABEL_34;
        v50 = (char *)archive_entry_hardlink((uint64_t)a2);
        sub_1DB72D0D4(v5);
        archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v51, v52, v53, v54, v55, v50);
        v21 = -20;
      }
      v47 = *v40;
    }
    if (v47 >= 0x65)
    {
      v56 = v21;
      v57 = (uint64_t *)archive_entry_new2(a1);
      archive_entry_set_uname((uint64_t)v57, "root");
      archive_entry_set_gname((uint64_t)v57, "wheel");
      archive_entry_set_pathname((uint64_t)v57, "././@LongLink");
      archive_entry_set_size((uint64_t)v57, v47 + 1);
      v48 = sub_1DB74ABC0(a1, (char *)&__dst, v57, 75);
      v58 = (void **)v57;
      v21 = v56;
      archive_entry_free(v58);
      if ((int)v48 < -20)
        goto LABEL_36;
      v48 = sub_1DB7322A8(a1, (uint64_t)&__dst, 512);
      if ((int)v48 < -20)
        goto LABEL_36;
      v48 = sub_1DB7322A8(a1, *(_QWORD *)(v4 + 16), v47 + 1);
      if ((int)v48 < -20)
        goto LABEL_36;
      v48 = sub_1DB732308((_QWORD *)a1, ~(_WORD)v47 & 0x1FF);
      if ((int)v48 < -20)
        goto LABEL_36;
    }
    v59 = *v14;
    if ((unint64_t)*v14 >= 0x65)
    {
      v60 = *(_QWORD *)(v4 + 32);
      v61 = (uint64_t *)archive_entry_new2(a1);
      archive_entry_set_uname((uint64_t)v61, "root");
      archive_entry_set_gname((uint64_t)v61, "wheel");
      archive_entry_set_pathname((uint64_t)v61, "././@LongLink");
      archive_entry_set_size((uint64_t)v61, v59 + 1);
      v48 = sub_1DB74ABC0(a1, (char *)&__dst, v61, 76);
      archive_entry_free((void **)v61);
      if ((int)v48 < -20)
        goto LABEL_36;
      v48 = sub_1DB7322A8(a1, (uint64_t)&__dst, 512);
      if ((int)v48 < -20)
        goto LABEL_36;
      v48 = sub_1DB7322A8(a1, v60, v59 + 1);
      if ((int)v48 < -20)
        goto LABEL_36;
      v48 = sub_1DB732308((_QWORD *)a1, ~(_WORD)v59 & 0x1FF);
      if ((int)v48 < -20)
        goto LABEL_36;
    }
    if (archive_entry_hardlink((uint64_t)a2))
    {
      v62 = 49;
    }
    else
    {
      HIDWORD(v69) = archive_entry_filetype((uint64_t)a2);
      LODWORD(v69) = HIDWORD(v69) - 4096;
      v68 = v69 >> 12;
      if (v68 >= 0xA || ((0x2ABu >> v68) & 1) == 0)
      {
        sub_1DB7355D0((_DWORD *)a1, a2);
        v48 = 4294967271;
        goto LABEL_36;
      }
      v62 = dword_1DB755090[v68];
    }
    v63 = sub_1DB74ABC0(a1, (char *)&__dst, a2, v62);
    v48 = v63;
    if ((int)v63 >= -20)
    {
      v64 = v63;
      v65 = sub_1DB7322A8(a1, (uint64_t)&__dst, 512);
      v48 = v65;
      if ((int)v65 >= -20)
      {
        if (v21 >= v64)
          v66 = v64;
        else
          v66 = v21;
        if ((int)v65 >= v66)
          v48 = v66;
        else
          v48 = v65;
        v67 = archive_entry_size((uint64_t)a2);
        *(_QWORD *)v4 = v67;
        *(_QWORD *)(v4 + 8) = -(int)v67 & 0x1FFLL;
      }
    }
    goto LABEL_36;
  }
  v20 = "Can't allocate memory for Pathame";
LABEL_35:
  archive_set_error((_DWORD *)a1, 12, v20, v15, v16, v17, v18, v19, v70);
  v48 = 4294967266;
LABEL_36:
  archive_entry_free(0);
  return v48;
}

uint64_t sub_1DB74AB18(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3)
    v4 = a3;
  else
    v4 = *v3;
  LODWORD(result) = sub_1DB7322A8(a1, a2, v4);
  *v3 -= v4;
  if ((_DWORD)result)
    return (int)result;
  else
    return v4;
}

uint64_t sub_1DB74AB60(_QWORD *a1)
{
  return sub_1DB732308(a1, 0x400uLL);
}

uint64_t sub_1DB74AB68(uint64_t a1)
{
  free(*(void **)(a1 + 264));
  *(_QWORD *)(a1 + 264) = 0;
  return 0;
}

uint64_t sub_1DB74AB94(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t result;

  v1 = (_QWORD *)a1[33];
  result = sub_1DB732308(a1, v1[1] + *v1);
  *v1 = 0;
  v1[1] = 0;
  return result;
}

uint64_t sub_1DB74ABC0(uint64_t a1, char *__dst, uint64_t *a3, int a4)
{
  uint64_t v8;
  unsigned int v9;
  const char *v10;
  size_t v11;
  size_t v12;
  unint64_t v13;
  size_t v14;
  const char *v15;
  size_t v16;
  size_t v17;
  const char *v18;
  size_t v19;
  size_t v20;
  unint64_t v21;
  _DWORD *v22;
  unsigned int i;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
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
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  unsigned int j;
  unint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  unsigned int k;
  unint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  unsigned int m;
  unint64_t v70;
  uint64_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  uint8x16_t v76;
  uint16x8_t v77;
  uint16x8_t v78;
  unint64_t v79;
  char *v80;
  unsigned int n;
  unint64_t v82;
  char *v84;

  v8 = *(_QWORD *)(a1 + 264);
  memcpy(__dst, &unk_1DB754E90, 0x200uLL);
  v9 = a4 - 75;
  if ((a4 - 75) > 1)
  {
    v10 = *(const char **)(v8 + 32);
    v11 = *(_QWORD *)(v8 + 40);
  }
  else
  {
    v10 = (const char *)archive_entry_pathname(a3);
    v11 = strlen(v10);
  }
  if (v11 >= 0x64)
    v12 = 100;
  else
    v12 = v11;
  memcpy(__dst, v10, v12);
  v13 = *(_QWORD *)(v8 + 24);
  if (v13)
  {
    if (v13 >= 0x64)
      v14 = 100;
    else
      v14 = *(_QWORD *)(v8 + 24);
    memcpy(__dst + 157, *(const void **)(v8 + 16), v14);
  }
  if (v9 > 1)
  {
    v15 = *(const char **)(v8 + 48);
    v16 = *(_QWORD *)(v8 + 56);
    if (!v16)
      goto LABEL_20;
  }
  else
  {
    v15 = (const char *)archive_entry_uname(a3);
    v16 = strlen(v15);
    if (!v16)
      goto LABEL_20;
  }
  if (v16 >= 0x20)
    v17 = 32;
  else
    v17 = v16;
  memcpy(__dst + 265, v15, v17);
LABEL_20:
  if (v9 > 1)
  {
    v18 = *(const char **)(v8 + 64);
    v19 = *(_QWORD *)(v8 + 72);
    if (!v19)
      goto LABEL_28;
  }
  else
  {
    v18 = (const char *)archive_entry_gname(a3);
    v19 = strlen(v18);
    if (!v19)
      goto LABEL_28;
  }
  if (strlen(v18) <= 0x20)
    v20 = v19;
  else
    v20 = 32;
  memcpy(__dst + 297, v18, v20);
LABEL_28:
  v21 = archive_entry_mode((uint64_t)a3) & 0xFFF;
  v22 = __dst + 107;
  for (i = 8; i > 1; --i)
  {
    v24 = v21;
    *((_BYTE *)v22 - 1) = v21 & 7 | 0x30;
    v22 = (_DWORD *)((char *)v22 - 1);
    v21 >>= 3;
  }
  if (v24 >= 8)
  {
    *(_DWORD *)((char *)v22 + 3) = 926365495;
    *v22 = 926365495;
  }
  v25 = archive_entry_uid((uint64_t)a3);
  if (sub_1DB74AFDC(v25, (uint64_t)(__dst + 108), 7uLL, 8))
  {
    v26 = (char *)archive_entry_uid((uint64_t)a3);
    archive_set_error((_DWORD *)a1, 34, "Numeric user ID %jd too large", v27, v28, v29, v30, v31, v26);
    v32 = 4294967271;
  }
  else
  {
    v32 = 0;
  }
  v33 = archive_entry_gid((uint64_t)a3);
  if (sub_1DB74AFDC(v33, (uint64_t)(__dst + 116), 7uLL, 8))
  {
    v34 = (char *)archive_entry_gid((uint64_t)a3);
    archive_set_error((_DWORD *)a1, 34, "Numeric group ID %jd too large", v35, v36, v37, v38, v39, v34);
    v32 = 4294967271;
  }
  v40 = archive_entry_size((uint64_t)a3);
  if (sub_1DB74AFDC(v40, (uint64_t)(__dst + 124), 0xBuLL, 12))
  {
    archive_set_error((_DWORD *)a1, 34, "File size out of range", v41, v42, v43, v44, v45, v84);
    v32 = 4294967271;
  }
  v46 = archive_entry_mtime((uint64_t)a3);
  v47 = v46 & ~(v46 >> 63);
  v48 = __dst + 147;
  for (j = 12; j > 1; --j)
  {
    v50 = v47;
    *--v48 = v47 & 7 | 0x30;
    v47 >>= 3;
  }
  if (v50 >= 8)
    memset(v48, 55, 11);
  if (archive_entry_filetype((uint64_t)a3) == 24576
    || archive_entry_filetype((uint64_t)a3) == 0x2000)
  {
    v51 = archive_entry_rdevmajor((uint64_t)a3);
    v57 = v51 & ~(v51 >> 31);
    v58 = __dst + 335;
    for (k = 7; k > 1; --k)
    {
      v60 = v57;
      *--v58 = v57 & 7 | 0x30;
      v57 >>= 3;
    }
    if (v60 >= 8)
    {
      *((_WORD *)v58 + 2) = 14135;
      *(_DWORD *)v58 = 926365495;
      archive_set_error((_DWORD *)a1, 34, "Major device number too large", v52, v53, v54, v55, v56, v84);
      v32 = 4294967271;
    }
    v61 = archive_entry_rdevminor(a3);
    v67 = v61 & ~(v61 >> 31);
    v68 = __dst + 343;
    for (m = 7; m > 1; --m)
    {
      v70 = v67;
      *--v68 = v67 & 7 | 0x30;
      v67 >>= 3;
    }
    if (v70 >= 8)
    {
      *((_WORD *)v68 + 2) = 14135;
      *(_DWORD *)v68 = 926365495;
      archive_set_error((_DWORD *)a1, 34, "Minor device number too large", v62, v63, v64, v65, v66, v84);
      v32 = 4294967271;
    }
  }
  v71 = 0;
  __dst[156] = a4;
  v72 = 0uLL;
  v73 = 0uLL;
  v74 = 0uLL;
  v75 = 0uLL;
  do
  {
    v76 = *(uint8x16_t *)&__dst[v71];
    v77 = vmovl_u8(*(uint8x8_t *)v76.i8);
    v78 = vmovl_high_u8(v76);
    v75 = (int32x4_t)vaddw_high_u16((uint32x4_t)v75, v78);
    v74 = (int32x4_t)vaddw_u16((uint32x4_t)v74, *(uint16x4_t *)v78.i8);
    v73 = (int32x4_t)vaddw_high_u16((uint32x4_t)v73, v77);
    v72 = (int32x4_t)vaddw_u16((uint32x4_t)v72, *(uint16x4_t *)v77.i8);
    v71 += 16;
  }
  while (v71 != 512);
  v79 = vaddvq_s32(vaddq_s32(vaddq_s32(v72, v74), vaddq_s32(v73, v75)));
  __dst[154] = 0;
  v80 = __dst + 154;
  for (n = 7; n > 1; --n)
  {
    v82 = v79;
    *--v80 = v79 & 7 | 0x30;
    v79 >>= 3;
  }
  if (v82 >= 8)
  {
    *((_WORD *)v80 + 2) = 14135;
    *(_DWORD *)v80 = 926365495;
  }
  return v32;
}

uint64_t sub_1DB74AFDC(uint64_t a1, uint64_t a2, size_t __len, int a4)
{
  char *v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t result;
  char *v9;
  unsigned int v10;
  char v11;

  if (1 << (3 * __len) <= a1)
  {
    v9 = (char *)(a2 + a4);
    if (a4 < 1)
    {
      v11 = *v9;
    }
    else
    {
      v10 = a4 + 1;
      do
      {
        v11 = a1;
        *--v9 = a1;
        a1 >>= 8;
        --v10;
      }
      while (v10 > 1);
    }
    result = 0;
    *v9 = v11 | 0x80;
  }
  else if ((int)__len < 1)
  {
    if (a1 <= 0)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  else
  {
    v4 = (char *)(a2 + __len);
    v5 = a1 & ~(a1 >> 63);
    v6 = __len + 1;
    do
    {
      v7 = v5;
      *--v4 = v5 & 7 | 0x30;
      v5 >>= 3;
      --v6;
    }
    while (v6 > 1);
    if (v7 <= 7)
    {
      return 0;
    }
    else
    {
      memset(v4, 55, __len);
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

int BZ2_bzCompress(bz_stream *strm, int action)
{
  return MEMORY[0x1E0DE4120](strm, *(_QWORD *)&action);
}

int BZ2_bzCompressEnd(bz_stream *strm)
{
  return MEMORY[0x1E0DE4128](strm);
}

int BZ2_bzCompressInit(bz_stream *strm, int blockSize100k, int verbosity, int workFactor)
{
  return MEMORY[0x1E0DE4130](strm, *(_QWORD *)&blockSize100k, *(_QWORD *)&verbosity, *(_QWORD *)&workFactor);
}

int BZ2_bzDecompress(bz_stream *strm)
{
  return MEMORY[0x1E0DE4138](strm);
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  return MEMORY[0x1E0DE4140](strm);
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  return MEMORY[0x1E0DE4148](strm, *(_QWORD *)&verbosity, *(_QWORD *)&small);
}

const char *BZ2_bzlibVersion(void)
{
  return (const char *)MEMORY[0x1E0DE4188]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C800A0](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1E0C80110](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x1E0C801F8](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x1E0C80200](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x1E0C80218](ctx, data, dataLength);
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1E0C80240](*(_QWORD *)&algorithm, password, passwordLen, salt, saltLen, *(_QWORD *)&prf, *(_QWORD *)&rounds, derivedKey);
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

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C80390](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C80398](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803A0](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
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

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
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

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
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

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

int UTF8Toisolat1(unsigned __int8 *out, int *outlen, const unsigned __int8 *in, int *inlen)
{
  return MEMORY[0x1E0DE8BE0](out, outlen, in, inlen);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1E0C80C30]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1E0C813E0](flagset_d, *(_QWORD *)&flag);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C813E8](permset_d, *(_QWORD *)&perm);
}

int acl_clear_flags_np(acl_flagset_t flagset_d)
{
  return MEMORY[0x1E0C813F0](flagset_d);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x1E0C813F8](permset_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81418](acl_p, entry_p);
}

acl_t acl_dup(acl_t acl)
{
  return (acl_t)MEMORY[0x1E0C81430](acl);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C81438](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81448](acl, *(_QWORD *)&entry_id, entry_p);
}

acl_t acl_get_fd(int fd)
{
  return (acl_t)MEMORY[0x1E0C81450](*(_QWORD *)&fd);
}

acl_t acl_get_fd_np(int fd, acl_type_t type)
{
  return (acl_t)MEMORY[0x1E0C81458](*(_QWORD *)&fd, *(_QWORD *)&type);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1E0C81460](path_p, *(_QWORD *)&type);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1E0C81468](flagset_d, *(_QWORD *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1E0C81470](obj_p, flagset_p);
}

acl_t acl_get_link_np(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1E0C81478](path_p, *(_QWORD *)&type);
}

int acl_get_perm_np(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C81480](permset_d, *(_QWORD *)&perm);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1E0C81488](entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x1E0C81490](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1E0C81498](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C814A0](*(_QWORD *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1E0C814A8](*(_QWORD *)&fd, acl);
}

int acl_set_fd_np(int fd, acl_t acl, acl_type_t acl_type)
{
  return MEMORY[0x1E0C814B0](*(_QWORD *)&fd, acl, *(_QWORD *)&acl_type);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1E0C814C8](path_p, *(_QWORD *)&type, acl);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1E0C814E0](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1E0C814E8](entry_d, *(_QWORD *)&tag_type);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chdir(const char *a1)
{
  return MEMORY[0x1E0C82628](a1);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x1E0DE92A8](sourceLen);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C82B88](a1, a2);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92E0](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x1E0DE92F8](strm);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fchdir(int a1)
{
  return MEMORY[0x1E0C832C0](*(_QWORD *)&a1);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1E0C832C8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C83320](*(_QWORD *)&a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C833F8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x1E0C83470](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C834E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1E0C83568](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1E0C835D8](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1E0C83688](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1E0C83698](a1, a2, a3, a4, a5);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C83798](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C837A8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
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

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93D0](strm, version, *(_QWORD *)&stream_size);
}

int inflateReset(z_streamp strm)
{
  return MEMORY[0x1E0DE93D8](strm);
}

int inflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  return MEMORY[0x1E0DE93E8](strm, dictionary, *(_QWORD *)&dictLength);
}

int issetugid(void)
{
  return MEMORY[0x1E0C839B8]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1E0C83B28](a1, *(_QWORD *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C83B38](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  return MEMORY[0x1E0C83B78](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C83B88](path, namebuff, size, *(_QWORD *)&options);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

int lutimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1E0C83C48](a1, a2);
}

uint64_t lzma_alone_decoder()
{
  return MEMORY[0x1E0DE6CB8]();
}

uint64_t lzma_alone_encoder()
{
  return MEMORY[0x1E0DE6CC0]();
}

uint64_t lzma_code()
{
  return MEMORY[0x1E0DE6CD0]();
}

uint64_t lzma_crc32()
{
  return MEMORY[0x1E0DE6CD8]();
}

uint64_t lzma_end()
{
  return MEMORY[0x1E0DE6CF0]();
}

uint64_t lzma_lzma_preset()
{
  return MEMORY[0x1E0DE6CF8]();
}

uint64_t lzma_memusage()
{
  return MEMORY[0x1E0DE6D00]();
}

uint64_t lzma_properties_decode()
{
  return MEMORY[0x1E0DE6D08]();
}

uint64_t lzma_properties_encode()
{
  return MEMORY[0x1E0DE6D10]();
}

uint64_t lzma_properties_size()
{
  return MEMORY[0x1E0DE6D18]();
}

uint64_t lzma_raw_decoder()
{
  return MEMORY[0x1E0DE6D20]();
}

uint64_t lzma_raw_encoder()
{
  return MEMORY[0x1E0DE6D28]();
}

uint64_t lzma_stream_decoder()
{
  return MEMORY[0x1E0DE6D38]();
}

uint64_t lzma_stream_encoder()
{
  return MEMORY[0x1E0DE6D40]();
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

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1E0C84008](*(_QWORD *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1E0C84020](*(_QWORD *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1E0C84028](uu, uid_or_gid, id_type);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x1E0C84038](a1, a2, a3, a4);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkfifo(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84178](a1, a2);
}

int mknod(const char *a1, mode_t a2, dev_t a3)
{
  return MEMORY[0x1E0C84180](a1, a2, *(_QWORD *)&a3);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1E0C841C8](a1);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x1E0C843D0](*(_QWORD *)&a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1E0C84AD8](a1, *(_QWORD *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x1E0C84B20](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1E0C84B40](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1E0C84B48](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B60](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B68](a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84BB0](a1, a2, a3, a4, __argv, __envp);
}

uint64_t pthread_chdir_np()
{
  return MEMORY[0x1E0C84D10]();
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x1E0C84D90]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1E0C85010](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

ssize_t readlinkat(int a1, const char *a2, char *a3, size_t a4)
{
  return MEMORY[0x1E0C85020](*(_QWORD *)&a1, a2, a3, a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
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

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
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

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85608](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1E0C85958](a1);
}

void tzset(void)
{
  MEMORY[0x1E0C85990]();
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1E0C85998](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x1E0DE93F8](dest, destLen, source, sourceLen);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

size_t wcrtomb(char *a1, __int32 a2, mbstate_t *a3)
{
  return MEMORY[0x1E0C85BE8](a1, *(_QWORD *)&a2, a3);
}

__int32 *__cdecl wcschr(__int32 *__s, __int32 __c)
{
  return (__int32 *)MEMORY[0x1E0C85C00](__s, *(_QWORD *)&__c);
}

__int32 *__cdecl wcscpy(__int32 *a1, const __int32 *a2)
{
  return (__int32 *)MEMORY[0x1E0C85C18](a1, a2);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1E0C85C20](a1);
}

int wmemcmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x1E0C85CC0](a1, a2, a3);
}

__int32 *__cdecl wmemmove(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x1E0C85CD0](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x1E0DE8C80]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x1E0DE8C88](buf);
}

void xmlCleanupParser(void)
{
  MEMORY[0x1E0DE8CA8]();
}

void xmlFreeTextReader(xmlTextReaderPtr reader)
{
  MEMORY[0x1E0DE8D58](reader);
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
  MEMORY[0x1E0DE8D60](writer);
}

xmlTextWriterPtr xmlNewTextWriterMemory(xmlBufferPtr buf, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x1E0DE8E48](buf, *(_QWORD *)&compression);
}

xmlTextReaderPtr xmlReaderForIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void *ioctx, const char *URL, const char *encoding, int options)
{
  return (xmlTextReaderPtr)MEMORY[0x1E0DE8EF0](ioread, ioclose, ioctx, URL, encoding, *(_QWORD *)&options);
}

const xmlChar *__cdecl xmlTextReaderConstLocalName(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x1E0DE9038](reader);
}

const xmlChar *__cdecl xmlTextReaderConstValue(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x1E0DE9048](reader);
}

int xmlTextReaderIsEmptyElement(xmlTextReaderPtr reader)
{
  return MEMORY[0x1E0DE9068](reader);
}

int xmlTextReaderMoveToFirstAttribute(xmlTextReaderPtr reader)
{
  return MEMORY[0x1E0DE9080](reader);
}

int xmlTextReaderMoveToNextAttribute(xmlTextReaderPtr reader)
{
  return MEMORY[0x1E0DE9088](reader);
}

int xmlTextReaderNodeType(xmlTextReaderPtr reader)
{
  return MEMORY[0x1E0DE9098](reader);
}

int xmlTextReaderRead(xmlTextReaderPtr reader)
{
  return MEMORY[0x1E0DE90A0](reader);
}

void xmlTextReaderSetErrorHandler(xmlTextReaderPtr reader, xmlTextReaderErrorFunc f, void *arg)
{
  MEMORY[0x1E0DE90C0](reader, f, arg);
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x1E0DE90C8](writer);
}

int xmlTextWriterEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x1E0DE90D0](writer);
}

int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent)
{
  return MEMORY[0x1E0DE90E8](writer, *(_QWORD *)&indent);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x1E0DE90F8](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x1E0DE9100](writer, name);
}

int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *content)
{
  return MEMORY[0x1E0DE9108](writer, name, content);
}

int xmlTextWriterWriteBase64(xmlTextWriterPtr writer, const char *data, int start, int len)
{
  return MEMORY[0x1E0DE9110](writer, data, *(_QWORD *)&start, *(_QWORD *)&len);
}

int xmlTextWriterWriteFormatAttribute(xmlTextWriterPtr writer, const xmlChar *name, const char *format, ...)
{
  return MEMORY[0x1E0DE9118](writer, name, format);
}

