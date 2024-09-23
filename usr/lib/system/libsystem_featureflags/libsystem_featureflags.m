char *_os_feature_enabled_envvar_check_once(_BYTE *a1)
{
  char *result;

  result = getenv("FEATUREFLAGS_ENABLED");
  if (result || (result = getenv("FEATUREFLAGS_DISABLED")) != 0)
    *a1 = 1;
  return result;
}

uint64_t _os_feature_table_once(_QWORD *a1)
{
  uint64_t result;
  int v3;
  _QWORD *v4;
  stat v5;

  result = shm_open("com.apple.featureflags.shm", 0);
  if ((result & 0x80000000) == 0)
  {
    v3 = result;
    memset(&v5, 0, sizeof(v5));
    if ((fstat(result, &v5) & 0x80000000) == 0)
    {
      v4 = mmap(0, v5.st_size, 1, 1, v3, 0);
      if (v4 != (_QWORD *)-1)
      {
        if (v5.st_size >= 0x20uLL && *v4 == 0x47414C4654414546 && (unint64_t)(8 * v4[2] + 32) <= v5.st_size)
          *a1 = v4;
        else
          munmap(v4, v5.st_size);
      }
    }
    return close(v3);
  }
  return result;
}

BOOL _os_feature_enabled_simple_impl(const char *a1, const char *a2, _BOOL8 a3)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  const char *v15;
  _QWORD *v16;
  const char *v17;
  BOOL v18;
  unsigned int v19;
  uint64_t v20;
  int64_t v21;
  unsigned int v22;
  unint64_t v23;
  _BOOL8 v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  char *v33;
  char *v34;
  unsigned int v35;
  size_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  const char *v40;
  unint64_t v41;
  unsigned int v42;
  unint64_t v43;
  const char *v44;
  _QWORD *v45;
  const char *v46;
  int64_t v47;
  unsigned int v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;

  v6 = _os_feature_table();
  if (!v6)
    return a3;
  v7 = v6;
  v8 = strlen(a1);
  v9 = strlen(a2);
  v10 = v8 + v9 + 1;
  v11 = *(_QWORD *)(v7 + 24) ^ (0xC6A4A7935BD1E995 * v10);
  v56 = v10;
  v57 = v11;
  v58 = 0u;
  v59 = 0u;
  if (v10 < v8)
    v12 = v8 + v9 + 1;
  else
    v12 = v8;
  v13 = (unint64_t)&a1[v12];
  if (v12 >= 16)
  {
    v15 = a1;
    do
    {
      v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995
              * ((0xC6A4A7935BD1E995 * *(_QWORD *)v15) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v15) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v15 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v15 + 1)) >> 47))));
      v14 = v15 + 16;
      v16 = v15 + 32;
      v15 += 16;
    }
    while ((unint64_t)v16 <= v13);
  }
  else
  {
    v14 = a1;
  }
  if ((unint64_t)(v14 + 8) <= v13)
  {
    do
    {
      v17 = v14 + 8;
      v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995 * *(_QWORD *)v14) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v14) >> 47))) ^ v11);
      v18 = (unint64_t)(v14 + 16) > v13;
      v14 += 8;
    }
    while (!v18);
  }
  else
  {
    v17 = v14;
  }
  if ((unint64_t)v17 >= v13)
  {
    v20 = 0;
    v19 = 0;
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v21 = &a1[v12] - v17;
    do
    {
      v22 = *(unsigned __int8 *)v17++;
      v20 |= (unint64_t)v22 << v19;
      v19 += 8;
      --v21;
    }
    while (v21);
  }
  v23 = v10 - v12;
  v56 = v23;
  v57 = v11;
  *(_QWORD *)&v58 = v20;
  DWORD2(v58) = v19;
  v24 = v10 > v8;
  if (v10 <= v8)
    v25 = &sep;
  else
    v25 = (uint64_t *)((char *)&sep + 1);
  if (v19)
  {
    if (v10 <= v8 || v19 > 0x3F)
    {
      if (v19 < 0x40)
        goto LABEL_45;
      v27 = &sep;
    }
    else
    {
      v26 = 0;
      v27 = &sep;
      do
      {
        v28 = v19 + v26;
        v29 = *(unsigned __int8 *)v27;
        v27 = (uint64_t *)((char *)v27 + 1);
        v20 |= (unint64_t)v29 << (v19 + v26);
        v26 += 8;
      }
      while (v27 < v25 && v28 < 0x38);
      if (v28 <= 0x37)
      {
        v19 += v26;
        goto LABEL_45;
      }
    }
    v30 = 0xC6A4A7935BD1E995 * v20;
    v20 = 0;
    v11 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v30 ^ (v30 >> 47))) ^ v11);
  }
  else
  {
    v27 = &sep;
  }
  if (v27 + 2 <= v25)
  {
    do
    {
      v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v27) ^ ((0xC6A4A7935BD1E995 * *v27) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v27[1]) ^ ((0xC6A4A7935BD1E995 * v27[1]) >> 47))));
      v31 = v27 + 2;
      v32 = v27 + 4;
      v27 += 2;
    }
    while (v32 <= v25);
  }
  else
  {
    v31 = v27;
  }
  if (v31 + 1 <= v25)
  {
    do
    {
      v33 = (char *)(v31 + 1);
      v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v31) ^ ((0xC6A4A7935BD1E995 * *v31) >> 47))) ^ v11);
      v18 = v31 + 2 > v25;
      ++v31;
    }
    while (!v18);
  }
  else
  {
    v33 = (char *)v31;
  }
  if (v33 >= (char *)v25)
  {
    v19 = 0;
  }
  else
  {
    v19 = 0;
    v34 = (char *)((char *)&sep + v24 - v33);
    do
    {
      v35 = *v33++;
      v20 |= (unint64_t)v35 << v19;
      v19 += 8;
      --v34;
    }
    while (v34);
  }
LABEL_45:
  v36 = v23 - v24;
  v56 = v36;
  v57 = v11;
  *(_QWORD *)&v58 = v20;
  DWORD2(v58) = v19;
  if (v36 >= v9)
    v37 = v9;
  else
    v37 = v36;
  v38 = (unint64_t)&a2[v37];
  if (v19)
  {
    if (v37 < 1 || v19 > 0x3F)
    {
      v40 = a2;
      if (v19 < 0x40)
        goto LABEL_71;
    }
    else
    {
      v39 = 0;
      v40 = a2;
      do
      {
        v41 = v19 + v39;
        v42 = *(unsigned __int8 *)v40++;
        v20 |= (unint64_t)v42 << (v19 + v39);
        v39 += 8;
      }
      while ((unint64_t)v40 < v38 && v41 < 0x38);
      if (v41 <= 0x37)
      {
        v19 += v39;
        goto LABEL_71;
      }
    }
    v43 = 0xC6A4A7935BD1E995 * v20;
    v20 = 0;
    v11 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v43 ^ (v43 >> 47))) ^ v11);
  }
  else
  {
    v40 = a2;
  }
  if ((unint64_t)(v40 + 16) <= v38)
  {
    do
    {
      v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995
              * ((0xC6A4A7935BD1E995 * *(_QWORD *)v40) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v40) >> 47))) ^ v11)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v40 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v40 + 1)) >> 47))));
      v44 = v40 + 16;
      v45 = v40 + 32;
      v40 += 16;
    }
    while ((unint64_t)v45 <= v38);
  }
  else
  {
    v44 = v40;
  }
  if ((unint64_t)(v44 + 8) <= v38)
  {
    do
    {
      v46 = v44 + 8;
      v11 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995 * *(_QWORD *)v44) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v44) >> 47))) ^ v11);
      v18 = (unint64_t)(v44 + 16) > v38;
      v44 += 8;
    }
    while (!v18);
  }
  else
  {
    v46 = v44;
  }
  if ((unint64_t)v46 >= v38)
  {
    v19 = 0;
  }
  else
  {
    v19 = 0;
    v47 = v46 - a2 - v37;
    do
    {
      v48 = *(unsigned __int8 *)v46++;
      v20 |= (unint64_t)v48 << v19;
      v19 += 8;
      ++v47;
    }
    while (v47);
  }
LABEL_71:
  v56 = v36 - v37;
  v57 = v11;
  *(_QWORD *)&v58 = v20;
  DWORD2(v58) = v19;
  v49 = simple_hash_final((uint64_t)&v56);
  v50 = *(_QWORD *)(v7 + 16);
  if (!v50)
    return 0;
  v51 = 0;
  v52 = v50 - 1;
  while (1)
  {
    a3 = v51 <= v52;
    if (v51 > v52)
      break;
    v53 = (v52 + v51) >> 1;
    v54 = *(_QWORD *)(v7 + 32 + 8 * v53);
    if (v54 < v49)
    {
      v51 = v53 + 1;
    }
    else
    {
      v52 = v53 - 1;
      if (v54 <= v49)
        return a3;
    }
  }
  return a3;
}

BOOL _os_feature_enabled_impl(const char *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  size_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  const char *v13;
  _QWORD *v14;
  const char *v15;
  BOOL v16;
  unsigned int v17;
  uint64_t v18;
  int64_t v19;
  unsigned int v20;
  unint64_t v21;
  _BOOL8 v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  char *v31;
  char *v32;
  unsigned int v33;
  size_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  const char *v38;
  unint64_t v39;
  unsigned int v40;
  unint64_t v41;
  const char *v42;
  _QWORD *v43;
  const char *v44;
  int64_t v45;
  unsigned int v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v54;
  unint64_t v55;
  __int128 v56;
  __int128 v57;

  if (_os_feature_enabled_impl_envvar_once != -1)
    _os_once();
  v4 = _os_feature_table();
  if (!v4 || _os_feature_enabled_impl__os_feature_enabled_envvar_present)
    return _os_feature_enabled_SLOWPATH(a1, a2);
  v5 = v4;
  v6 = strlen(a1);
  v7 = strlen(a2);
  v8 = v6 + v7 + 1;
  v9 = *(_QWORD *)(v5 + 24) ^ (0xC6A4A7935BD1E995 * v8);
  v54 = v8;
  v55 = v9;
  v56 = 0u;
  v57 = 0u;
  if (v8 < v6)
    v10 = v6 + v7 + 1;
  else
    v10 = v6;
  v11 = (unint64_t)&a1[v10];
  if (v10 >= 16)
  {
    v13 = a1;
    do
    {
      v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(_QWORD *)v13) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v13) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v13 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v13 + 1)) >> 47))));
      v12 = v13 + 16;
      v14 = v13 + 32;
      v13 += 16;
    }
    while ((unint64_t)v14 <= v11);
  }
  else
  {
    v12 = a1;
  }
  if ((unint64_t)(v12 + 8) <= v11)
  {
    do
    {
      v15 = v12 + 8;
      v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * *(_QWORD *)v12) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v12) >> 47))) ^ v9);
      v16 = (unint64_t)(v12 + 16) > v11;
      v12 += 8;
    }
    while (!v16);
  }
  else
  {
    v15 = v12;
  }
  if ((unint64_t)v15 >= v11)
  {
    v18 = 0;
    v17 = 0;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = &a1[v10] - v15;
    do
    {
      v20 = *(unsigned __int8 *)v15++;
      v18 |= (unint64_t)v20 << v17;
      v17 += 8;
      --v19;
    }
    while (v19);
  }
  v21 = v8 - v10;
  v54 = v21;
  v55 = v9;
  *(_QWORD *)&v56 = v18;
  DWORD2(v56) = v17;
  v22 = v8 > v6;
  if (v8 <= v6)
    v23 = &sep;
  else
    v23 = (uint64_t *)((char *)&sep + 1);
  if (v17)
  {
    if (v8 <= v6 || v17 > 0x3F)
    {
      if (v17 < 0x40)
        goto LABEL_48;
      v25 = &sep;
    }
    else
    {
      v24 = 0;
      v25 = &sep;
      do
      {
        v26 = v17 + v24;
        v27 = *(unsigned __int8 *)v25;
        v25 = (uint64_t *)((char *)v25 + 1);
        v18 |= (unint64_t)v27 << (v17 + v24);
        v24 += 8;
      }
      while (v25 < v23 && v26 < 0x38);
      if (v26 <= 0x37)
      {
        v17 += v24;
        goto LABEL_48;
      }
    }
    v28 = 0xC6A4A7935BD1E995 * v18;
    v18 = 0;
    v9 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v28 ^ (v28 >> 47))) ^ v9);
  }
  else
  {
    v25 = &sep;
  }
  if (v25 + 2 <= v23)
  {
    do
    {
      v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v25) ^ ((0xC6A4A7935BD1E995 * *v25) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v25[1]) ^ ((0xC6A4A7935BD1E995 * v25[1]) >> 47))));
      v29 = v25 + 2;
      v30 = v25 + 4;
      v25 += 2;
    }
    while (v30 <= v23);
  }
  else
  {
    v29 = v25;
  }
  if (v29 + 1 <= v23)
  {
    do
    {
      v31 = (char *)(v29 + 1);
      v9 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *v29) ^ ((0xC6A4A7935BD1E995 * *v29) >> 47))) ^ v9);
      v16 = v29 + 2 > v23;
      ++v29;
    }
    while (!v16);
  }
  else
  {
    v31 = (char *)v29;
  }
  if (v31 >= (char *)v23)
  {
    v17 = 0;
  }
  else
  {
    v17 = 0;
    v32 = (char *)((char *)&sep + v22 - v31);
    do
    {
      v33 = *v31++;
      v18 |= (unint64_t)v33 << v17;
      v17 += 8;
      --v32;
    }
    while (v32);
  }
LABEL_48:
  v34 = v21 - v22;
  v54 = v34;
  v55 = v9;
  *(_QWORD *)&v56 = v18;
  DWORD2(v56) = v17;
  if (v34 >= v7)
    v35 = v7;
  else
    v35 = v34;
  v36 = (unint64_t)&a2[v35];
  if (!v17)
  {
    v38 = a2;
LABEL_62:
    if ((unint64_t)(v38 + 16) <= v36)
    {
      do
      {
        v9 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995 * *(_QWORD *)v38) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v38) >> 47))) ^ v9)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v38 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v38 + 1)) >> 47))));
        v42 = v38 + 16;
        v43 = v38 + 32;
        v38 += 16;
      }
      while ((unint64_t)v43 <= v36);
    }
    else
    {
      v42 = v38;
    }
    if ((unint64_t)(v42 + 8) <= v36)
    {
      do
      {
        v44 = v42 + 8;
        v9 = 0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(_QWORD *)v42) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v42) >> 47))) ^ v9);
        v16 = (unint64_t)(v42 + 16) > v36;
        v42 += 8;
      }
      while (!v16);
    }
    else
    {
      v44 = v42;
    }
    if ((unint64_t)v44 >= v36)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      v45 = v44 - a2 - v35;
      do
      {
        v46 = *(unsigned __int8 *)v44++;
        v18 |= (unint64_t)v46 << v17;
        v17 += 8;
        ++v45;
      }
      while (v45);
    }
    goto LABEL_74;
  }
  if (v35 < 1 || v17 > 0x3F)
  {
    v38 = a2;
    if (v17 < 0x40)
      goto LABEL_74;
    goto LABEL_61;
  }
  v37 = 0;
  v38 = a2;
  do
  {
    v39 = v17 + v37;
    v40 = *(unsigned __int8 *)v38++;
    v18 |= (unint64_t)v40 << (v17 + v37);
    v37 += 8;
  }
  while ((unint64_t)v38 < v36 && v39 < 0x38);
  if (v39 > 0x37)
  {
LABEL_61:
    v41 = 0xC6A4A7935BD1E995 * v18;
    v18 = 0;
    v9 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v41 ^ (v41 >> 47))) ^ v9);
    goto LABEL_62;
  }
  v17 += v37;
LABEL_74:
  v54 = v34 - v35;
  v55 = v9;
  *(_QWORD *)&v56 = v18;
  DWORD2(v56) = v17;
  v47 = simple_hash_final((uint64_t)&v54);
  v48 = *(_QWORD *)(v5 + 16);
  if (v48)
  {
    v49 = 0;
    v50 = v48 - 1;
    while (1)
    {
      v48 = v49 <= v50;
      if (v49 > v50)
        break;
      v51 = (v50 + v49) >> 1;
      v52 = *(_QWORD *)(v5 + 32 + 8 * v51);
      if (v52 < v47)
      {
        v49 = v51 + 1;
      }
      else
      {
        v50 = v51 - 1;
        if (v52 <= v47)
          return v48;
      }
    }
  }
  return v48;
}

uint64_t _os_feature_table()
{
  if (_os_feature_table_table_once != -1)
    _os_once();
  return _os_feature_table_table;
}

unint64_t simple_hash_final(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  char *v13;
  BOOL v14;
  char *v15;
  unsigned int v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  char *v23;
  unsigned __int8 *v24;
  char *v25;
  char *v26;
  unsigned int v27;
  _OWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C874D8];
  v1 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (!*(_DWORD *)(a1 + 24))
      return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
    goto LABEL_61;
  }
  memset(v29, 0, sizeof(v29));
  if (v1 > 0x1F)
  {
    v2 = *(_QWORD *)(a1 + 8);
    v3 = *(_QWORD *)(a1 + 16);
    v4 = v1;
    v5 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      v6 = v1 >= 0x20 ? 32 : v1;
      v7 = (char *)v29 + v6;
      if (!v5)
        break;
      if (v6 && v5 <= 0x3F)
      {
        v8 = 0;
        v9 = (char *)v29;
        do
        {
          v10 = v5 + v8;
          v11 = *v9++;
          v3 |= (unint64_t)v11 << (v5 + v8);
          v8 += 8;
        }
        while (v9 < v7 && v10 < 0x38);
        if (v10 > 0x37)
          goto LABEL_18;
        v5 += v8;
      }
      else if (v5 >= 0x40)
      {
        v9 = (char *)v29;
LABEL_18:
        v12 = 0xC6A4A7935BD1E995 * v3;
        v3 = 0;
        v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ v2);
LABEL_19:
        v13 = v9 + 16;
        while (v13 <= v7)
        {
          v2 = 0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v9 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v9 + 1)) >> 47))));
          v13 = v9 + 32;
          v9 += 16;
        }
        if (v9 + 8 <= v7)
        {
          do
          {
            v2 = 0xC6A4A7935BD1E995
               * ((0xC6A4A7935BD1E995
                 * ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v9) >> 47))) ^ v2);
            v14 = v9 + 16 > v7;
            v9 += 8;
          }
          while (!v14);
        }
        if (v9 >= v7)
        {
          v5 = 0;
        }
        else
        {
          v5 = 0;
          v15 = (char *)((char *)v29 + v6 - v9);
          do
          {
            v16 = *v9++;
            v3 |= (unint64_t)v16 << v5;
            v5 += 8;
            --v15;
          }
          while (v15);
        }
      }
      v1 -= v6;
      v4 -= 32;
      if (v4 <= 0x1F)
      {
        *(_QWORD *)a1 = v1;
        *(_QWORD *)(a1 + 8) = v2;
        *(_QWORD *)(a1 + 16) = v3;
        *(_DWORD *)(a1 + 24) = v5;
        goto LABEL_35;
      }
    }
    v9 = (char *)v29;
    goto LABEL_19;
  }
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = v1;
  v5 = *(_DWORD *)(a1 + 24);
LABEL_35:
  if (v1 < v4)
    v4 = v1;
  v17 = (unsigned __int8 *)v29;
  v18 = (unsigned __int8 *)v29 + v4;
  if (v5)
  {
    if (v4 && v5 <= 0x3F)
    {
      v19 = 0;
      v17 = (unsigned __int8 *)v29;
      do
      {
        v20 = v5 + v19;
        v21 = *v17++;
        v3 |= (unint64_t)v21 << (v5 + v19);
        v19 += 8;
      }
      while (v17 < v18 && v20 < 0x38);
      if (v20 <= 0x37)
      {
        v5 += v19;
        goto LABEL_60;
      }
    }
    else
    {
      if (v5 < 0x40)
        goto LABEL_60;
      v17 = (unsigned __int8 *)v29;
    }
    v22 = 0xC6A4A7935BD1E995 * v3;
    v3 = 0;
    v2 = 0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * (v22 ^ (v22 >> 47))) ^ v2);
  }
  if (v17 + 16 <= v18)
  {
    do
    {
      v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995
             * ((0xC6A4A7935BD1E995 * *(_QWORD *)v17) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v17) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * *((_QWORD *)v17 + 1)) ^ ((0xC6A4A7935BD1E995 * *((_QWORD *)v17 + 1)) >> 47))));
      v23 = (char *)(v17 + 16);
      v24 = v17 + 32;
      v17 += 16;
    }
    while (v24 <= v18);
  }
  else
  {
    v23 = (char *)v17;
  }
  if (v23 + 8 <= (char *)v18)
  {
    do
    {
      v25 = v23 + 8;
      v2 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995
           * ((0xC6A4A7935BD1E995 * *(_QWORD *)v23) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)v23) >> 47))) ^ v2);
      v14 = v23 + 16 > (char *)v18;
      v23 += 8;
    }
    while (!v14);
  }
  else
  {
    v25 = v23;
  }
  if (v25 >= (char *)v18)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v26 = (char *)((char *)v29 + v4 - v25);
    do
    {
      v27 = *v25++;
      v3 |= (unint64_t)v27 << v5;
      v5 += 8;
      --v26;
    }
    while (v26);
  }
LABEL_60:
  *(_QWORD *)a1 = v1 - v4;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = v5;
  if (v5)
LABEL_61:
    v2 = 0xC6A4A7935BD1E995 * (*(_QWORD *)(a1 + 16) ^ v2);
  return (0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v2 ^ (v2 >> 47))) >> 47);
}

BOOL _os_feature_enabled_SLOWPATH(const char *a1, const char *a2)
{
  unint64_t v3;
  uint64_t v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  char **v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;
  xpc_object_t empty;
  uint64_t v17;
  id v18;
  char **v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  id v30;
  const char *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *string_ptr;
  void *v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  const char *v51;
  char **v52;
  const char *v53;
  id v54;
  void *v55;
  char *v56;
  xpc_object_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  void *v63;
  char *v64;
  char *v65;
  char *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  xpc_dictionary_applier_t v71;
  _BOOL4 v72;
  xpc_dictionary_applier_t applier;
  xpc_dictionary_applier_t appliera;
  xpc_dictionary_applier_t applierb;
  _QWORD v77[4];
  id v78;
  char *__stringp[4];
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C874D8];
  os_unfair_lock_lock((os_unfair_lock_t)&_slow_cache_lock);
  v3 = 0x1EF9DC000uLL;
  if (_slow_cache)
  {
    xpc_dictionary_get_value((xpc_object_t)_slow_cache, a1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (xpc_object_t)v4;
    if (v4)
    {
      if (MEMORY[0x1D17AFF80](v4) != MEMORY[0x1E0C88FE8])
        goto LABEL_19;
      xpc_dictionary_get_value(v5, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v6 == (void *)MEMORY[0x1E0C88F90];
      if (v6 == (void *)MEMORY[0x1E0C88F90] || v6 == (void *)MEMORY[0x1E0C88F88])
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);

        goto LABEL_22;
      }

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);
  v10 = _os_feature_search_paths();
  if ((unint64_t)__strlcpy_chk() <= 0x3FF
    && (unint64_t)__strlcat_chk() <= 0x3FF
    && (unint64_t)__strlcat_chk() <= 0x3FF)
  {
    empty = xpc_dictionary_create_empty();
    v17 = MEMORY[0x1E0C87450];
    __stringp[0] = (char *)MEMORY[0x1E0C87450];
    __stringp[1] = (char *)3221225472;
    __stringp[2] = (char *)___os_featureenabled_slow_load_disclosures_block_invoke;
    __stringp[3] = (char *)&unk_1E88E1AB8;
    v18 = empty;
    v80 = v18;
    applier = (xpc_dictionary_applier_t)MEMORY[0x1D17AFE30](__stringp);
    v77[0] = v17;
    v77[1] = 3221225472;
    v77[2] = ___os_featureenabled_slow_load_disclosures_block_invoke_2;
    v77[3] = &unk_1E88E1AB8;
    v70 = v18;
    v78 = v70;
    v71 = (xpc_dictionary_applier_t)MEMORY[0x1D17AFE30](v77);
    v19 = _os_feature_search_paths();
    if (*v19)
    {
      v20 = MEMORY[0x1E0C88FE8];
      do
      {
        _os_feature_enabled_load();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21 && MEMORY[0x1D17AFF80](v21) == v20)
          xpc_dictionary_apply(v22, applier);
        _os_feature_internal_search_path();
        _os_feature_enabled_load();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23 && MEMORY[0x1D17AFF80](v23) == v20)
          xpc_dictionary_apply(v24, v71);
        if ((_os_feature_enabled_is_safe_mode() & 1) == 0)
        {
          _os_feature_enabled_load();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v25 && MEMORY[0x1D17AFF80](v25) == v20)
            xpc_dictionary_apply(v26, applier);
          _os_feature_enabled_load();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          if (v27 && MEMORY[0x1D17AFF80](v27) == v20)
            xpc_dictionary_apply(v28, applier);

        }
        v29 = v19[1];
        ++v19;
      }
      while (v29);
    }
    v30 = v70;

    if (*v10)
    {
      LOBYTE(v8) = 0;
      v31 = "/Global.plist";
      do
      {
        _os_feature_enabled_load();
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = v30;
        if (v32 && MEMORY[0x1D17AFF80](v32) == MEMORY[0x1E0C88FE8])
        {
          xpc_dictionary_get_value(v32, a2);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          if (v34 && MEMORY[0x1D17AFF80](v34) == MEMORY[0x1E0C88FE8])
          {
            xpc_dictionary_get_value(v35, "DisclosureRequired");
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = (void *)v36;
            if (!v36
              || MEMORY[0x1D17AFF80](v36) != MEMORY[0x1E0C89020]
              || (v38 = xpc_string_get_string_ptr(v37), xpc_dictionary_get_BOOL(v33, v38)))
            {
              appliera = v33;
              xpc_dictionary_get_value(v35, "Enabled");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              xpc_dictionary_get_value(v35, "DevelopmentPhase");
              v40 = objc_claimAutoreleasedReturnValue();
              v41 = (void *)v40;
              if (!v39 || !v40)
              {
                if (v39 && MEMORY[0x1D17AFF80](v39) == MEMORY[0x1E0C88FC8])
                {
                  LOBYTE(v8) = xpc_BOOL_get_value(v39);
                }
                else if (v41 && MEMORY[0x1D17AFF80](v41) == MEMORY[0x1E0C89020])
                {
                  string_ptr = xpc_string_get_string_ptr(v41);
                  LOBYTE(v8) = strcmp(string_ptr, "FeatureComplete") == 0;
                }
              }

              v33 = appliera;
            }

          }
        }

        _os_feature_enabled_load();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        _os_feature_enabled_extract_domain(v43, a1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = _os_feature_enabled_extract(v44, a2, v8, v33);

        if ((_os_feature_enabled_is_safe_mode() & 1) == 0)
        {
          _os_feature_enabled_load();
          applierb = (xpc_dictionary_applier_t)objc_claimAutoreleasedReturnValue();
          _os_feature_enabled_extract_domain(applierb, a1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v8;
          v47 = v33;
          v48 = v45;
          v72 = _os_feature_enabled_extract(v45, a2, v46, v47);

          _os_feature_enabled_load();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          _os_feature_enabled_extract_domain(v49, a1);
          v50 = v32;
          v51 = v31;
          v52 = v10;
          v53 = a1;
          v54 = v30;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = _os_feature_enabled_extract(v55, a2, v72, v47);

          v30 = v54;
          a1 = v53;
          v10 = v52;
          v31 = v51;
          v32 = v50;

        }
        v56 = v10[1];
        ++v10;
      }
      while (v56);
    }
    else
    {
      v8 = 0;
    }
    v57 = xpc_dictionary_create_empty();
    v58 = getenv("FEATUREFLAGS_ENABLED");
    v59 = getenv("FEATUREFLAGS_DISABLED");
    if (v58)
    {
      v60 = strdup(v58);
      __stringp[0] = v60;
      v61 = strsep(__stringp, ":");
      if (v61)
      {
        v62 = v61;
        v63 = (void *)MEMORY[0x1E0C88F90];
        do
        {
          _os_feature_enabled_write_nested_value_into_plist(v57, v62, v63);
          v62 = strsep(__stringp, ":");
        }
        while (v62);
      }
      free(v60);
    }
    if (v59)
    {
      v64 = strdup(v59);
      __stringp[0] = v64;
      v65 = strsep(__stringp, ":");
      if (v65)
      {
        v66 = v65;
        v67 = (void *)MEMORY[0x1E0C88F88];
        do
        {
          _os_feature_enabled_write_nested_value_into_plist(v57, v66, v67);
          v66 = strsep(__stringp, ":");
        }
        while (v66);
      }
      free(v64);
    }
    if (v57)
    {
      xpc_dictionary_get_dictionary(v57, a1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v3 = 0x1EF9DC000;
      if (v68)
        v8 = _os_feature_enabled_extract(v68, a2, v8, v30);

    }
    else
    {
      v3 = 0x1EF9DC000;
    }

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_slow_cache_lock);
  v11 = *(void **)(v3 + 3240);
  if (!v11)
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    v13 = *(void **)(v3 + 3240);
    *(_QWORD *)(v3 + 3240) = v12;

    v11 = *(void **)(v3 + 3240);
  }
  xpc_dictionary_get_value(v11, a1);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v5 = (xpc_object_t)v14;
    if (MEMORY[0x1D17AFF80]() != MEMORY[0x1E0C88FE8])
LABEL_19:
      abort();
  }
  else
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(*(xpc_object_t *)(v3 + 3240), a1, v5);
  }
  xpc_dictionary_set_BOOL(v5, a2, v8);
  os_unfair_lock_unlock((os_unfair_lock_t)&_slow_cache_lock);
LABEL_22:

  return v8;
}

char **_os_feature_search_paths()
{
  return _os_feature_search_paths_paths;
}

const char *_os_feature_internal_search_path()
{
  return "/System/AppleInternal/Library/FeatureFlags";
}

id _os_feature_enabled_load()
{
  void *v0;
  int v2;
  int v3;
  size_t v4;
  int64_t v5;
  char *v6;
  off_t v7;
  int v8;
  ssize_t v9;
  char v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if ((unint64_t)__strlcpy_chk() > 0x3FF || (unint64_t)__strlcat_chk() > 0x3FF)
  {
    v0 = 0;
    return v0;
  }
  v2 = open(v10, 16777476);
  if (v2 < 0)
  {
    v0 = 0;
    v8 = *__error();
    if (!v8)
      return v0;
    goto LABEL_24;
  }
  v3 = v2;
  v4 = lseek(v2, 0, 2);
  if ((v4 & 0x8000000000000000) != 0)
  {
    v0 = 0;
    v8 = *__error();
  }
  else
  {
    v5 = v4;
    v6 = (char *)malloc_type_malloc(v4, 0xDAAF447uLL);
    if (v5)
    {
      v7 = 0;
      v8 = 0;
      while (1)
      {
        v9 = pread(v3, &v6[v7], v5 - v7, v7);
        if (v9 < 0)
        {
          v8 = *__error();
          if (v8 != 4)
          {
            v0 = 0;
            goto LABEL_22;
          }
        }
        else
        {
          if (!v9)
          {
            v0 = 0;
            v8 = 70;
            goto LABEL_22;
          }
          v7 += v9;
        }
        if (v7 >= v5)
          goto LABEL_19;
      }
    }
    v8 = 0;
LABEL_19:
    v0 = (void *)xpc_create_from_plist();
LABEL_22:
    free(v6);
  }
  close(v3);
  if (v8)
LABEL_24:
    *__error() = v8;
  return v0;
}

BOOL _os_feature_enabled_extract(void *a1, const char *a2, _BOOL8 value, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *string_ptr;
  uint64_t v16;
  void *v17;

  v7 = a1;
  v8 = a4;
  if (v7)
  {
    v9 = MEMORY[0x1D17AFF80](v7);
    v10 = MEMORY[0x1E0C88FE8];
    if (v9 == MEMORY[0x1E0C88FE8])
    {
      xpc_dictionary_get_value(v7, a2);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11 && MEMORY[0x1D17AFF80](v11) == v10)
      {
        xpc_dictionary_get_value(v12, "DisclosureRequired");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (!v13
          || MEMORY[0x1D17AFF80](v13) != MEMORY[0x1E0C89020]
          || (string_ptr = xpc_string_get_string_ptr(v14), xpc_dictionary_get_BOOL(v8, string_ptr)))
        {
          xpc_dictionary_get_value(v12, "Enabled");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16 && MEMORY[0x1D17AFF80](v16) == MEMORY[0x1E0C88FC8])
            value = xpc_BOOL_get_value(v17);

        }
      }

    }
  }

  return value;
}

id _os_feature_enabled_extract_domain(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (a1)
  {
    xpc_dictionary_get_value(a1, a2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2 && MEMORY[0x1D17AFF80](v2) == MEMORY[0x1E0C88FE8])
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t ___os_featureenabled_slow_load_disclosures_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (MEMORY[0x1D17AFF80]() == MEMORY[0x1E0C88FE8] && xpc_dictionary_get_BOOL(v5, "Disclosed"))
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), a2, 1);

  return 1;
}

uint64_t ___os_featureenabled_slow_load_disclosures_block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  if (MEMORY[0x1D17AFF80]() == MEMORY[0x1E0C88FE8])
  {
    xpc_dictionary_get_value(v5, "Disclosed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = xpc_dictionary_get_BOOL(v5, "Disclosed");
      xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), a2, v7);
    }
  }

  return 1;
}

void _os_feature_enabled_write_nested_value_into_plist(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  char *v8;
  const char *v9;
  char *v10;
  const char *v11;
  void *empty;
  void *v13;
  xpc_object_t v14;
  char *__stringp;

  v5 = a1;
  v6 = a3;
  v7 = strdup(a2);
  __stringp = v7;
  v8 = strsep(&__stringp, "/");
  if (v8 && (v9 = v8, (v10 = strsep(&__stringp, "/")) != 0) && (v11 = v10, !strsep(&__stringp, "/")))
  {
    xpc_dictionary_get_dictionary(v5, v9);
    empty = (void *)objc_claimAutoreleasedReturnValue();
    if (!empty)
    {
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(v5, v9, empty);
    }
    xpc_dictionary_get_value(empty, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      _os_feature_enabled_write_nested_value_into_plist_cold_1();
    v14 = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(v14, "Enabled", v6);
    xpc_dictionary_set_value(empty, v11, v14);
    free(v7);

  }
  else
  {
    free(v7);
  }

}

uint64_t _os_feature_enabled_is_safe_mode()
{
  os_parse_boot_arg_int();
  return 0;
}

void _os_feature_enabled_write_nested_value_into_plist_cold_1()
{
  _os_crash();
  __break(1u);
  __error();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C87500]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

uint64_t _os_once()
{
  return MEMORY[0x1E0C88AA0]();
}

void abort(void)
{
  MEMORY[0x1E0C87558]();
}

int close(int a1)
{
  return MEMORY[0x1E0C88018](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C882A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C88500](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C88518](a1, a2);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C88528](a1, *(_QWORD *)&a2);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1E0C87C40]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BD0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C885F0](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C88700](a1, *(_QWORD *)&a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C87A20](__stringp, __delim);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C890A8](xBOOL);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C89158]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C89190](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C891A8]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891C0](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C891D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C89200](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C89208](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C89248](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}

