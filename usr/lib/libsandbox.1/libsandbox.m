unsigned __int16 *sb_packbuff_unpack_string(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v6;
  unsigned __int16 *v8;
  int v9;

  v9 = 0;
  v8 = 0;
  v5 = sb_packbuff_unpack_item(a1, 2, 0, &v8, &v9);
  if (!v5)
  {
    if (v9 && (v6 = (v9 - 1), !*((_BYTE *)v8 + v6)))
    {
      v5 = 0;
      if (a2)
        *a2 = v6;
    }
    else
    {
      v5 = 22;
    }
  }
  if (a3)
    *a3 = v5;
  return v8;
}

uint64_t sb_packbuff_unpack_item(_QWORD *a1, int a2, _DWORD *a3, unsigned __int16 **a4, _DWORD *a5)
{
  unint64_t v5;
  unint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  v5 = a1[5];
  v6 = a1[6];
  if (v6 < v5)
    return 34;
  v7 = (unsigned __int16 *)(v6 + 8);
  if (v6 + 8 > v5 + a1[4])
    return 34;
  if (*(unsigned __int16 *)v6 != a2)
    return 22;
  if ((a2 - 2) >= 2)
  {
    if (a2 == 1 && a3)
    {
      *a3 = *(_DWORD *)(v6 + 4);
      v11 = 8;
      goto LABEL_16;
    }
    return 22;
  }
  v8 = 22;
  if (!a4 || !a5)
    return v8;
  v10 = *(unsigned int *)(v6 + 4);
  LODWORD(v6) = 8 - (*(_DWORD *)(v6 + 4) & 7);
  *a4 = v7;
  *a5 = v10;
  if ((v10 & 7) != 0)
    v6 = v6;
  else
    v6 = 0;
  v11 = v10 + v6 + 8;
  v5 = a1[5];
  v6 = a1[6];
LABEL_16:
  v12 = (char *)(v6 + v11);
  if ((unint64_t)v12 < v5 || (unint64_t)v12 >= v5 + a1[2])
    return 34;
  if ((v11 & 7) != 0)
    sb_packbuff_unpack_item_cold_1();
  v8 = 0;
  a1[6] = v12;
  return v8;
}

void *sb_packbuff_new(unint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;

  v2 = malloc_type_calloc(1uLL, 0x38uLL, 0x1010040EDCA6020uLL);
  v3 = v2;
  if (v2)
  {
    v4 = 256;
    if (a1 >= 8)
      v4 = a1;
    v2[1] = v4;
    *(_DWORD *)v2 = 1;
    if (sb_packbuff_realloc((uint64_t)v2, 0))
    {
      free(v3);
      return 0;
    }
    else
    {
      *((_QWORD *)v3 + 3) -= 8;
      *((_QWORD *)v3 + 4) = 8;
      **((_QWORD **)v3 + 6) = 0;
    }
  }
  return v3;
}

uint64_t sb_packbuff_realloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v5;
  BOOL v6;
  size_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2 || *(_DWORD *)a1 != 1)
    return 45;
  v5 = 8 - (a2 & 7);
  v6 = (a2 & 7) == 0;
  v7 = *(_QWORD *)(a1 + 16) + v2;
  *(_QWORD *)(a1 + 16) = v7;
  if (v6)
    v8 = 0;
  else
    v8 = v5;
  v9 = v8 + a2;
  if (v9 > v7 - *(_QWORD *)(a1 + 32))
  {
    v7 += v9;
    *(_QWORD *)(a1 + 16) = v7;
  }
  v10 = reallocf(*(void **)(a1 + 40), v7);
  *(_QWORD *)(a1 + 40) = v10;
  if (!v10)
    return 12;
  v11 = (uint64_t)v10;
  result = 0;
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16) - v13;
  if (v13)
    v11 = v11 + v13 - 8;
  *(_QWORD *)(a1 + 48) = v11;
  return result;
}

_QWORD *sb_packbuff_init_with_buffer(_QWORD *a1, uint64_t a2, int a3, int a4)
{
  _QWORD *result;
  uint64_t v9;

  result = malloc_type_calloc(1uLL, 0x38uLL, 0x1010040EDCA6020uLL);
  if (result)
  {
    *(_DWORD *)result = a4;
    result[1] = 0;
    result[2] = a2;
    v9 = a2;
    result[5] = a1;
    result[6] = a1;
    if (!a3)
    {
      *a1 = 0;
      a2 = result[2];
      v9 = 8;
    }
    result[3] = a2 - v9;
    result[4] = v9;
  }
  return result;
}

void sb_packbuff_free(uint64_t *a1)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 2)
    {
      if (MEMORY[0x20BCFD2CC](*MEMORY[0x24BDAEC58], a1[5], a1[2])
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        sb_packbuff_free_cold_1(a1 + 5, a1 + 2);
      }
    }
    else if (*(_DWORD *)a1 == 1)
    {
      free((void *)a1[5]);
    }
    free(a1);
  }
}

uint64_t sb_packbuff_get_bytes(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t sb_packbuff_get_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sb_packbuff_get_item_value_type(_QWORD *a1, _WORD *a2)
{
  _WORD *v2;
  unint64_t v3;

  v3 = a1[5];
  v2 = (_WORD *)a1[6];
  if ((unint64_t)v2 < v3 || (unint64_t)(v2 + 4) > v3 + a1[4] || !*v2)
    return 0;
  *a2 = v2[1];
  return 1;
}

uint64_t sb_packbuff_unpack_uint32(_QWORD *a1, int *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;
  uint64_t result;
  int v7;

  v2 = a1[5];
  v3 = a1[6];
  if (v3 < v2 || (v5 = v3 + 8, v3 + 8 > v2 + a1[4]))
  {
    result = 0;
LABEL_4:
    v7 = 34;
    goto LABEL_5;
  }
  if (*(_WORD *)v3 == 1)
  {
    result = *(unsigned int *)(v3 + 4);
    if (v5 >= v2 + a1[2])
      goto LABEL_4;
    v7 = 0;
    a1[6] = v5;
  }
  else
  {
    result = 0;
    v7 = 22;
  }
LABEL_5:
  if (a2)
    *a2 = v7;
  return result;
}

uint64_t sb_packbuff_pack_uint32(_QWORD *a1, __int16 a2, int a3)
{
  return sb_packbuff_pack_item(a1, 1u, a2, a3, 0, 0);
}

uint64_t sb_packbuff_pack_item(_QWORD *a1, unsigned int a2, __int16 a3, int a4, void *__src, size_t __n)
{
  unsigned int v6;
  unint64_t v12;
  unsigned int v13;
  uint64_t result;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  _QWORD *v19;

  v6 = __n;
  v12 = 8;
  if ((_DWORD)__n)
  {
    if ((__n & 7) != 0)
      v13 = 8 - (__n & 7);
    else
      v13 = 0;
    result = 34;
    v15 = __n + v13;
    if (__CFADD__((_DWORD)__n, v13) || v15 > 0xFFFFFFF7)
      return result;
    v12 = v15 + 8;
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }
  if (a1[3] >= v12 || (result = sb_packbuff_realloc((uint64_t)a1, v12), !(_DWORD)result))
  {
    v16 = a1[6];
    *(_WORD *)v16 = a2;
    *(_WORD *)(v16 + 2) = a3;
    if (a2 - 2 < 2)
    {
      if (!__src)
        sb_packbuff_pack_item_cold_2();
      *(_DWORD *)(v16 + 4) = v6;
      v17 = (char *)(a1[6] + 8);
      memcpy(v17, __src, v6);
      if (v13)
        bzero(&v17[v6], v13);
      goto LABEL_18;
    }
    if (a2 <= 1)
    {
      if (v15)
        sb_packbuff_pack_item_cold_1();
      *(_DWORD *)(v16 + 4) = a4;
LABEL_18:
      result = 0;
      v18 = a1[4] + v12;
      a1[3] -= v12;
      a1[4] = v18;
      v19 = (_QWORD *)(a1[6] + v12);
      a1[6] = v19;
      *v19 = 0;
      return result;
    }
    return 22;
  }
  return result;
}

uint64_t sb_packbuff_pack_string(_QWORD *a1, __int16 a2, void *__src, unint64_t a4)
{
  if (a4 > 0xFFFFFFFE || *((_BYTE *)__src + a4))
    return 22;
  else
    return sb_packbuff_pack_item(a1, 2u, a2, 0, __src, (a4 + 1));
}

uint64_t sb_packbuff_pack_key_with_string_value(_QWORD *a1, __int16 a2, char *__s, __int16 a4, char *a5)
{
  size_t v10;
  uint64_t result;
  size_t v12;

  v10 = strlen(__s);
  if (v10 > 0xFFFFFFFE || __s[v10])
    return 22;
  result = sb_packbuff_pack_item(a1, 2u, a2, 0, __s, (v10 + 1));
  if (!(_DWORD)result)
  {
    v12 = strlen(a5);
    if (v12 <= 0xFFFFFFFE && !a5[v12])
      return sb_packbuff_pack_item(a1, 2u, a4, 0, a5, (v12 + 1));
    return 22;
  }
  return result;
}

uint64_t sb_packbuff_unpack_key_with_string_value(_QWORD *a1, unsigned __int16 **a2, _WORD *a3, unsigned __int16 **a4, _QWORD *a5)
{
  unsigned __int16 *v10;
  uint64_t result;
  _WORD *v12;
  unint64_t v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;

  v16 = 0;
  v15 = 0;
  v10 = sb_packbuff_unpack_string(a1, &v16, (int *)&v15);
  result = v15;
  if (!v15)
  {
    if (a2)
      *a2 = v10;
    if (a3)
    {
      v13 = a1[5];
      v12 = (_WORD *)a1[6];
      if ((unint64_t)v12 >= v13 && (unint64_t)(v12 + 4) <= v13 + a1[4] && *v12)
        *a3 = v12[1];
    }
    v14 = sb_packbuff_unpack_string(a1, &v16, (int *)&v15);
    result = v15;
    if (!v15)
    {
      if (a4)
        *a4 = v14;
      result = 0;
      if (a5)
        *a5 = v16;
    }
  }
  return result;
}

char *sandbox_create_params()
{
  char *v0;
  void *v1;

  v0 = (char *)malloc_type_malloc(0x18uLL, 0x1080040468F112EuLL);
  if (v0)
  {
    v1 = malloc_type_malloc(0x10uLL, 0x10040B8F86A93uLL);
    *(_QWORD *)v0 = v1;
    if (v1)
    {
      *(_OWORD *)(v0 + 8) = xmmword_2067C3D60;
    }
    else
    {
      free(v0);
      return 0;
    }
  }
  return v0;
}

uint64_t sandbox_set_param(uint64_t a1, char *__s2, const char *a3)
{
  uint64_t v6;
  unint64_t v7;
  const char **v8;
  uint64_t result;
  _QWORD *v10;
  _QWORD *v11;
  int *v12;
  int v13;
  _QWORD *v14;

  if (!__s2 || !a3)
  {
    v12 = __error();
    v13 = 22;
    goto LABEL_13;
  }
  v6 = *(_QWORD *)(a1 + 8);
  if (!v6)
  {
LABEL_7:
    if (v6 != *(_QWORD *)(a1 + 16))
    {
      v11 = *(_QWORD **)a1;
      goto LABEL_16;
    }
    if (v6 >= 1 && !((unint64_t)(2 * v6) >> 61))
    {
      v10 = malloc_type_realloc(*(void **)a1, 16 * v6, 0x10040436913F5uLL);
      if (v10)
      {
        v11 = v10;
        *(_QWORD *)a1 = v10;
        *(_QWORD *)(a1 + 16) = 2 * v6;
        v6 = *(_QWORD *)(a1 + 8);
LABEL_16:
        result = 0;
        v11[v6] = __s2;
        v14 = *(_QWORD **)a1;
        *(_QWORD *)(a1 + 8) = v6 + 2;
        v14[v6 + 1] = a3;
        return result;
      }
      return 0xFFFFFFFFLL;
    }
    v12 = __error();
    v13 = 12;
LABEL_13:
    *v12 = v13;
    return 0xFFFFFFFFLL;
  }
  v7 = 0;
  v8 = *(const char ***)a1;
  while (1)
  {
    result = strcmp(v8[v7], __s2);
    if (!(_DWORD)result)
      break;
    v7 += 2;
    if (v7 >= v6)
      goto LABEL_7;
  }
  *(const char **)((char *)v8 + ((8 * v7) | 8)) = a3;
  return result;
}

void sandbox_free_params(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1);
  }
}

uint64_t sandbox_compile_file(char *__filename, uint64_t a2, char **a3)
{
  FILE *v5;
  int *v6;
  const char *v7;
  char **i;
  FILE *v9;
  char *v10;
  char *__filenamea;

  __filenamea = 0;
  if (!*__filename)
  {
    asprintf(a3, "path is empty");
    return 0;
  }
  if (*__filename != 47)
  {
    v7 = "/System/Library/Sandbox/Profiles";
    for (i = &off_24BFDE910; ; ++i)
    {
      asprintf(&__filenamea, "%s/%s.sb", v7, __filename);
      if (!__filenamea)
      {
        asprintf(a3, "out of memory");
        return 0;
      }
      v9 = fopen(__filenamea, "r");
      if (v9)
        break;
      free(__filenamea);
      v10 = *i;
      v7 = v10;
      if (!v10)
      {
        asprintf(a3, "%s: profile not found");
        return 0;
      }
    }
    v5 = v9;
    goto LABEL_14;
  }
  v5 = fopen(__filename, "r");
  if (v5)
  {
LABEL_14:
    asprintf(a3, "%s", "profile compilation not supported on this platform");
    free(__filenamea);
    fclose(v5);
    return 0;
  }
  v6 = __error();
  strerror(*v6);
  asprintf(a3, "%s: %s");
  return 0;
}

_QWORD *sandbox_compile_named(char *a1, uint64_t a2, char **a3)
{
  uint64_t v5;
  _QWORD *v6;
  char *v7;

  if (__sandbox_ms())
  {
    sandbox_compile_file(a1, v5, a3);
    return 0;
  }
  else
  {
    v6 = malloc_type_malloc(0x18uLL, 0x10100403CCBF1C1uLL);
    if (v6)
    {
      v7 = strdup(a1);
      v6[1] = 0;
      v6[2] = 0;
      *v6 = v7;
    }
    else
    {
      asprintf(a3, "out of memory");
    }
  }
  return v6;
}

uint64_t sandbox_compile_string(int a1, int a2, char **a3)
{
  asprintf(a3, "%s", "profile compilation not supported on this platform");
  return 0;
}

uint64_t sandbox_compile_entitlements(int a1, int a2, int a3, char **a4)
{
  asprintf(a4, "%s", "profile compilation not supported on this platform");
  return 0;
}

void sandbox_free_profile(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1[1]);
    free(a1);
  }
}

uint64_t sandbox_apply_container(_QWORD *a1, char *__s)
{
  uint64_t v2;

  if (*a1)
  {
    if (!__s)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (__s)
LABEL_3:
    strlen(__s);
LABEL_5:
  v2 = __sandbox_ms();
  if (!(_DWORD)v2)
    _sandbox_enter_notify_libxpc();
  return v2;
}

uint64_t sandbox_apply(_QWORD *a1)
{
  return sandbox_apply_container(a1, 0);
}

uint64_t sandbox_register_profile()
{
  return 45;
}

uint64_t sandbox_unregister_profile()
{
  return 45;
}

uint64_t sandbox_unregister_all_profiles()
{
  return 45;
}

uint64_t sandbox_inspect_pid(int a1, _QWORD *a2, _QWORD *a3)
{
  return sb_inspect_subsystem(1, a1, a2, a3);
}

uint64_t sb_inspect_subsystem(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  void *v6;
  int v7;
  uint64_t result;
  void *v9;

  v6 = 0;
  v7 = 10;
  while (1)
  {
    if (v6)
      free(v6);
    v9 = malloc_type_malloc(0x1000uLL, 0xAC28D51FuLL);
    if (!__sandbox_ms())
      break;
    if (*__error() != 63)
    {
      if (v9)
        free(v9);
      return *__error();
    }
    v6 = v9;
    if (!--v7)
    {
      free(v9);
      return 26;
    }
  }
  if (a3)
    *a3 = v9;
  result = 0;
  if (a4)
    *a4 = 0;
  return result;
}

uint64_t sandbox_inspect_smemory()
{
  return 45;
}

void *sandbox_user_state_item_buffer_create()
{
  return sb_packbuff_new(0x800uLL);
}

uint64_t sandbox_user_state_item_buffer_send(uint64_t a1)
{
  if (!a1)
    return 22;
  sb_packbuff_get_bytes(a1);
  sb_packbuff_get_size(a1);
  return __sandbox_ms();
}

uint64_t sandbox_user_state_item_buffer_destroy(uint64_t *a1)
{
  if (!a1)
    return 22;
  sb_packbuff_free(a1);
  return 0;
}

uint64_t sandbox_set_user_state_item(int a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sandbox_set_user_state_item_with_persona(a1, -1, a2, a3, a4);
}

uint64_t sandbox_set_user_state_item_with_persona(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  size_t v13;
  int v14;
  uint64_t *v15;
  __int16 v16;
  void *v17;
  char *v18;
  uint64_t *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  uint64_t v23;
  int v24;
  size_t v25;
  uint64_t *v26;
  __int16 v27;

  if (a5)
  {
    v9 = a5;
    v10 = 0;
  }
  else
  {
    v9 = (uint64_t *)sb_packbuff_new(0x800uLL);
    v10 = v9;
    if (!v9)
      return 22;
  }
  v11 = sb_packbuff_pack_uint32(v9, 0, a1);
  if (!(_DWORD)v11)
  {
    switch(a3)
    {
      case 0:
        v11 = sb_packbuff_pack_uint32(v9, 1, *(_DWORD *)a4);
        if ((_DWORD)v11)
          break;
        v12 = *(void **)(a4 + 8);
        if (!v12)
          goto LABEL_10;
        v13 = strlen(*(const char **)(a4 + 8));
        v14 = sb_packbuff_pack_string(v9, 2, v12, v13);
        v11 = sb_packbuff_pack_uint32(v9, 17, 0) | v14;
        break;
      case 1:
        v17 = *(void **)a4;
        if (!*(_QWORD *)a4)
          goto LABEL_27;
        v18 = *(char **)(a4 + 8);
        if (v18)
        {
          v19 = v9;
          v20 = 4;
          v21 = *(char **)a4;
          v22 = 5;
          goto LABEL_26;
        }
        v25 = strlen(*(const char **)a4);
        v26 = v9;
        v27 = 6;
        goto LABEL_31;
      case 2:
        if (!*(_QWORD *)a4)
          goto LABEL_27;
        v11 = sb_packbuff_pack_uint32(v9, 18, a2);
        if ((_DWORD)v11)
          break;
        v17 = *(void **)a4;
        v18 = *(char **)(a4 + 8);
        if (v18)
        {
          v19 = v9;
          v20 = 7;
          v21 = *(char **)a4;
          v22 = 8;
          goto LABEL_26;
        }
        v25 = strlen(*(const char **)a4);
        v26 = v9;
        v27 = 9;
        goto LABEL_31;
      case 4:
        v17 = *(void **)a4;
        if (!*(_QWORD *)a4)
          goto LABEL_27;
        v18 = *(char **)(a4 + 8);
        if (v18)
        {
          v19 = v9;
          v20 = 10;
          v21 = *(char **)a4;
          v22 = 11;
          goto LABEL_26;
        }
        v25 = strlen(*(const char **)a4);
        v26 = v9;
        v27 = 12;
        goto LABEL_31;
      case 8:
        v17 = *(void **)a4;
        if (*(_QWORD *)a4)
        {
          v18 = *(char **)(a4 + 8);
          if (v18)
          {
            v19 = v9;
            v20 = 13;
            v21 = *(char **)a4;
            v22 = 14;
LABEL_26:
            v23 = sb_packbuff_pack_key_with_string_value(v19, v20, v21, v22, v18);
          }
          else
          {
            v25 = strlen(*(const char **)a4);
            v26 = v9;
            v27 = 15;
LABEL_31:
            v23 = sb_packbuff_pack_string(v26, v27, v17, v25);
          }
LABEL_35:
          v11 = v23;
        }
        else
        {
LABEL_27:
          v11 = 22;
        }
        break;
      case 16:
LABEL_10:
        v15 = v9;
        v16 = 3;
        goto LABEL_33;
      case 17:
        v24 = *(_DWORD *)a4;
        v15 = v9;
        v16 = 1;
        goto LABEL_34;
      case 18:
        v17 = *(void **)a4;
        v25 = strlen(*(const char **)a4);
        v26 = v9;
        v27 = 2;
        goto LABEL_31;
      case 19:
        v17 = *(void **)a4;
        v25 = strlen(*(const char **)a4);
        v26 = v9;
        v27 = 16;
        goto LABEL_31;
      case 20:
        v15 = v9;
        v16 = 17;
LABEL_33:
        v24 = 0;
LABEL_34:
        v23 = sb_packbuff_pack_uint32(v15, v16, v24);
        goto LABEL_35;
      default:
        v11 = 22;
        if (v10)
          goto LABEL_39;
        return v11;
    }
  }
  if (v10)
  {
    if (!(_DWORD)v11)
      v11 = sandbox_user_state_item_buffer_send((uint64_t)v10);
LABEL_39:
    sb_packbuff_free(v10);
  }
  return v11;
}

uint64_t sandbox_user_state_iterate_items(unsigned int a1, uint64_t a2)
{
  return inspect_iterate_items(a1, 2, a2);
}

uint64_t inspect_iterate_items(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  int v10;
  __int16 v11;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  uint64_t v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;
  _QWORD *v20;

  v20 = 0;
  v19 = 0;
  result = sb_inspect_subsystem(a2, a1, &v20, &v19);
  if (!(_DWORD)result)
  {
    v5 = sb_packbuff_init_with_buffer(v20, v19, 1, 1);
    if (v5)
    {
      v6 = v5;
      v18 = 0;
      v17 = 0;
      v14 = 0;
      v15 = 0;
      v7 = 0x7FFFFFFFLL;
      v16 = 0;
      while (2)
      {
        if (sb_packbuff_get_item_value_type(v6, &v17))
        {
          switch(v17)
          {
            case 0:
              v7 = sb_packbuff_unpack_uint32(v6, (int *)&v18);
              if (!v18)
                continue;
              break;
            case 1:
              LODWORD(v14) = sb_packbuff_unpack_uint32(v6, (int *)&v18);
              if (!v18)
              {
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 17, &v14);
                continue;
              }
              break;
            case 2:
              if ((_DWORD)v7 == 0x7FFFFFFF)
                goto LABEL_34;
              v13 = 0;
              v8 = sb_packbuff_unpack_string(v6, &v13, (int *)&v18);
              if (!v18)
              {
                v14 = v8;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 18, &v14);
                continue;
              }
              break;
            case 4:
              if ((_DWORD)v7 == 0x7FFFFFFF)
                goto LABEL_34;
              v12 = 0;
              v13 = 0;
              v11 = 0;
              v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0);
              if (!v18)
              {
                if (v11 != 5)
                  goto LABEL_34;
                LODWORD(v16) = 0;
                v14 = v13;
                v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 1, &v14);
                continue;
              }
              break;
            case 7:
              if ((_DWORD)v7 == 0x7FFFFFFF)
                goto LABEL_34;
              v12 = 0;
              v13 = 0;
              v11 = 0;
              v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0);
              if (!v18)
              {
                if (v11 != 8)
                  goto LABEL_34;
                v14 = v13;
                v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 2, &v14);
                continue;
              }
              break;
            case 10:
              v12 = 0;
              v13 = 0;
              v11 = 0;
              v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0);
              if (!v18)
              {
                if (v11 != 11)
                  goto LABEL_34;
                LODWORD(v16) = 0;
                v14 = v13;
                v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 4, &v14);
                continue;
              }
              break;
            case 13:
              v12 = 0;
              v13 = 0;
              v11 = 0;
              v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0);
              if (!v18)
              {
                if (v11 != 14)
                  goto LABEL_34;
                LODWORD(v16) = 0;
                v14 = v13;
                v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 8, &v14);
                continue;
              }
              break;
            case 16:
              if ((_DWORD)v7 == 0x7FFFFFFF)
                goto LABEL_34;
              v13 = 0;
              v9 = sb_packbuff_unpack_string(v6, &v13, (int *)&v18);
              if (!v18)
              {
                v14 = v9;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 19, &v14);
                continue;
              }
              break;
            case 18:
              if ((_DWORD)v7 == 0x7FFFFFFF)
                goto LABEL_34;
              v10 = sb_packbuff_unpack_uint32(v6, (int *)&v18);
              if (!v18)
              {
                LODWORD(v16) = v10;
                continue;
              }
              break;
            default:
LABEL_34:
              v18 = 22;
              break;
          }
        }
        break;
      }
      sb_packbuff_free(v6);
      return v18;
    }
    else
    {
      return 12;
    }
  }
  return result;
}

uint64_t sandbox_container_paths_iterate_items(int a1, uint64_t a2)
{
  return inspect_iterate_items(a1, 4, a2);
}

uint64_t sandbox_prepare_user_home_mount()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_exempt_from_network_approval_policy()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_register_network_approval_policy_exemption_for_share()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_register_sync_root()
{
  uint64_t result;

  result = __sandbox_ms();
  if ((_DWORD)result)
    return *__error();
  return result;
}

void sb_packbuff_free_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = *a2;
  v4 = 134218240;
  v5 = v2;
  v6 = 2048;
  v7 = v3;
  _os_log_error_impl(&dword_2067C2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed: vm_deallocate(%p, %zu)", (uint8_t *)&v4, 0x16u);
}

void sb_packbuff_unpack_item_cold_1()
{
  __assert_rtn("sb_packbuff_unpack_item", "packbuff.c", 369, "(bytes_to_advance % BYTE_ALIGNMENT) == 0");
}

void sb_packbuff_pack_item_cold_1()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 267, "extra_bytes_needed == 0");
}

void sb_packbuff_pack_item_cold_2()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 273, "additional_bytes != NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x24BDAC888]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sandbox_enter_notify_libxpc()
{
  return MEMORY[0x24BDACC30]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

