unint64_t os_simple_hash(unsigned __int8 *a1, unint64_t a2)
{
  return os_simple_hash_with_seed(a1, a2, 0);
}

unint64_t os_simple_hash_with_seed(unsigned __int8 *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (0xC6A4A7935BD1E995 * a2) ^ a3;
  if (a2 >= 8)
  {
    v4 = &a1[8 * (a2 >> 3)];
    v5 = 8 * (a2 >> 3);
    do
    {
      v6 = *(_QWORD *)a1;
      a1 += 8;
      v3 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v6) ^ ((0xC6A4A7935BD1E995 * v6) >> 47))) ^ v3);
      v5 -= 8;
    }
    while (v5);
    a1 = v4;
  }
  switch(a2 & 7)
  {
    case 1uLL:
      goto LABEL_12;
    case 2uLL:
      goto LABEL_11;
    case 3uLL:
      goto LABEL_10;
    case 4uLL:
      goto LABEL_9;
    case 5uLL:
      goto LABEL_8;
    case 6uLL:
      goto LABEL_7;
    case 7uLL:
      v3 ^= (unint64_t)a1[6] << 48;
LABEL_7:
      v3 ^= (unint64_t)a1[5] << 40;
LABEL_8:
      v3 ^= (unint64_t)a1[4] << 32;
LABEL_9:
      v3 ^= (unint64_t)a1[3] << 24;
LABEL_10:
      v3 ^= (unint64_t)a1[2] << 16;
LABEL_11:
      v3 ^= (unint64_t)a1[1] << 8;
LABEL_12:
      v3 = 0xC6A4A7935BD1E995 * (v3 ^ *a1);
      break;
    default:
      return (0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) >> 47);
  }
  return (0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v3 ^ (v3 >> 47))) >> 47);
}

uint64_t os_variant_uses_ephemeral_storage()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (is_ephemeral == 2)
    return 0;
  if (is_ephemeral != 3)
    _check_internal_release_type_cold_1();
  return 1;
}

uint64_t os_variant_allows_internal_security_policies()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (HIBYTE(disabled_status))
    return 0;
  if (can_has_debugger == 2)
  {
    if (development_kernel == 2)
      return 0;
    if (development_kernel != 3)
      _check_internal_release_type_cold_1();
  }
  else if (can_has_debugger != 3)
  {
    _check_internal_release_type_cold_1();
  }
  return 1;
}

int8x8_t ___initialize_status_block_invoke()
{
  int v0;
  int v1;
  void *file;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int data_np;
  char *v8;
  int v9;
  int8x8_t result;
  int64x2_t v11;
  int16x8_t v12;
  const char *string;
  char *v14;
  int v15;
  int v16;
  int v17;
  size_t v18;
  size_t v19[11];

  v19[10] = *MEMORY[0x1E0C874D8];
  v18 = 8;
  v19[0] = 0;
  if (!sysctlbyname("kern.osvariant_status", v19, &v18, 0, 0) && v19[0])
  {
    if ((v19[0] & 8) != 0)
    {
      can_has_debugger = (LODWORD(v19[0]) >> 2) & 3;
      if ((v19[0] & 0x8000) == 0)
      {
LABEL_40:
        if ((v19[0] & 0x2000000) == 0)
          goto LABEL_41;
        goto LABEL_52;
      }
    }
    else if ((v19[0] & 0x8000) == 0)
    {
      goto LABEL_40;
    }
    is_ephemeral = LOWORD(v19[0]) >> 14;
    if ((v19[0] & 0x2000000) == 0)
    {
LABEL_41:
      if ((v19[0] & 0x20) == 0)
        goto LABEL_42;
      goto LABEL_53;
    }
LABEL_52:
    has_full_logging = HIBYTE(LODWORD(v19[0])) & 3;
    if ((v19[0] & 0x20) == 0)
    {
LABEL_42:
      if ((v19[0] & 0x800) == 0)
        goto LABEL_43;
      goto LABEL_54;
    }
LABEL_53:
    internal_release_type = (LODWORD(v19[0]) >> 4) & 3;
    if ((v19[0] & 0x800) == 0)
    {
LABEL_43:
      if ((v19[0] & 0x2000) == 0)
        goto LABEL_44;
      goto LABEL_55;
    }
LABEL_54:
    factory_release_type = (LODWORD(v19[0]) >> 10) & 3;
    if ((v19[0] & 0x2000) == 0)
    {
LABEL_44:
      if ((v19[0] & 0x20000) == 0)
        goto LABEL_45;
      goto LABEL_56;
    }
LABEL_55:
    darwin_release_type = (LODWORD(v19[0]) >> 12) & 3;
    if ((v19[0] & 0x20000) == 0)
    {
LABEL_45:
      if ((v19[0] & 0x200000) == 0)
        goto LABEL_46;
      goto LABEL_57;
    }
LABEL_56:
    recovery_release_type = HIWORD(LODWORD(v19[0])) & 3;
    if ((v19[0] & 0x200000) == 0)
    {
LABEL_46:
      if ((v19[0] & 0x8000000) == 0)
      {
LABEL_48:
        v11 = vdupq_n_s64(v19[0]);
        v12 = (int16x8_t)vuzp1q_s32((int32x4_t)vtstq_s64(v11, (int64x2_t)xmmword_1DEED46A0), (int32x4_t)vtstq_s64(v11, (int64x2_t)xmmword_1DEED46B0));
        *(int8x8_t *)v12.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v12), (int8x8_t)0x1000100010001);
        result = vmovn_s16(v12);
        disabled_status = result.i32[0];
        return result;
      }
LABEL_47:
      allows_security_research = (LODWORD(v19[0]) >> 26) & 3;
      goto LABEL_48;
    }
LABEL_57:
    development_kernel = (LODWORD(v19[0]) >> 20) & 3;
    if ((v19[0] & 0x8000000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
  if (is_ephemeral)
    ___initialize_status_block_invoke_cold_8(&v18, v19);
  LODWORD(v18) = 0;
  v19[0] = 4;
  sysctlbyname("hw.ephemeral_storage", &v18, v19, 0, 0);
  if ((_DWORD)v18)
    v0 = 3;
  else
    v0 = 2;
  is_ephemeral = v0;
  if (can_has_debugger)
    ___initialize_status_block_invoke_cold_7(&v18, v19);
  if (MEMORY[0xFFFFF4084])
    v1 = 3;
  else
    v1 = 2;
  can_has_debugger = v1;
  if (internal_release_type)
    ___initialize_status_block_invoke_cold_6(&v18, v19);
  if (factory_release_type)
    ___initialize_status_block_invoke_cold_5(&v18, v19);
  if (darwin_release_type)
    ___initialize_status_block_invoke_cold_4(&v18, v19);
  if (recovery_release_type)
    ___initialize_status_block_invoke_cold_3(&v18, v19);
  v19[0] = 0x4000;
  file = _read_file((uint64_t)"/System/Library/CoreServices/SystemVersion.plist", v19);
  if (!file)
    goto LABEL_19;
  v3 = file;
  v4 = xpc_create_from_plist();
  if (!v4)
  {
LABEL_18:
    free(v3);
LABEL_19:
    if (access("/AppleInternal/Library/PreferenceBundles/Internal Settings.bundle", 0))
      v6 = 2;
    else
      v6 = 3;
    internal_release_type = v6;
    factory_release_type = 2;
    darwin_release_type = 2;
    recovery_release_type = 2;
    goto LABEL_23;
  }
  v5 = (void *)v4;
  if (MEMORY[0x1DF0F1A34]() != MEMORY[0x1E0C88FE8])
  {
    xpc_release(v5);
    goto LABEL_18;
  }
  free(v3);
  string = xpc_dictionary_get_string(v5, "ReleaseType");
  if (string)
  {
    v14 = (char *)string;
    if (strcmp(string, "NonUI"))
    {
      factory_release_type = 2;
      if (strstr(v14, "Internal"))
        v15 = 3;
      else
        v15 = 2;
      internal_release_type = v15;
      if (strstr(v14, "Darwin"))
        v16 = 3;
      else
        v16 = 2;
      darwin_release_type = v16;
      if (strstr(v14, "Recovery"))
        v17 = 3;
      else
        v17 = 2;
      goto LABEL_73;
    }
    factory_release_type = 3;
    internal_release_type = 3;
    v17 = 2;
  }
  else
  {
    v17 = 2;
    internal_release_type = 2;
    factory_release_type = 2;
  }
  darwin_release_type = 2;
LABEL_73:
  recovery_release_type = v17;
  xpc_release(v5);
LABEL_23:
  if (development_kernel)
    ___initialize_status_block_invoke_cold_2(&v18, v19);
  v18 = 0;
  v19[0] = 0;
  data_np = sysctlbyname_get_data_np("kern.osbuildconfig", v19, &v18);
  v8 = (char *)v19[0];
  if (!data_np
    && (!strcmp((const char *)v19[0], "development")
     || !strcmp(v8, "debug")
     || !strcmp(v8, "profile")
     || !strcmp(v8, "kasan")))
  {
    development_kernel = 3;
  }
  free(v8);
  if (!development_kernel)
    development_kernel = 2;
  if (allows_security_research)
    ___initialize_status_block_invoke_cold_1(&v18, v19);
  LODWORD(v18) = 0;
  v19[0] = 4;
  sysctlbyname("hw.features.allows_security_research", &v18, v19, 0, 0);
  if ((_DWORD)v18)
    v9 = 3;
  else
    v9 = 2;
  allows_security_research = v9;
  _parse_disabled_status();
  return result;
}

uint64_t os_variant_has_internal_ui()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (BYTE2(disabled_status))
    return 0;
  else
    return _check_internal_release_type();
}

uint64_t os_variant_has_factory_content()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (factory_release_type == 2)
    return 0;
  if (factory_release_type != 3)
    _check_internal_release_type_cold_1();
  return 1;
}

uint64_t dirstatat_np()
{
  _OWORD *v0;
  size_t v1;
  char v2;
  size_t v3;
  _OWORD *v4;
  int v5;
  int v6;
  char **v7;
  _QWORD *v8;
  int v9;
  char *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int *v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int *v20;
  const char *v21;
  int v22;
  int v23;
  char *v24;
  char *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  int v31;
  char *v32;
  uint64_t v33;
  int v34;
  size_t v36;
  _OWORD *v37;
  __int128 __src;
  __int128 v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  _BYTE v43[32768];
  uint64_t v44;

  MEMORY[0x1E0C86820]();
  v44 = *MEMORY[0x1E0C874D8];
  if ((v2 & 1) != 0)
  {
    *__error() = 45;
    return 0xFFFFFFFFLL;
  }
  v3 = v1;
  v4 = v0;
  v5 = openat_NOCANCEL();
  if (v5 == -1)
    return 0xFFFFFFFFLL;
  v6 = v5;
  v36 = v3;
  v37 = v4;
  __src = 0uLL;
  v7 = (char **)_dirstat_fileid_set_create();
  v41 = 0;
  v42 = &v41;
  v39 = xmmword_1DEED46C8;
  v40 = 1029;
  bzero(v43, 0x8000uLL);
  v8 = 0;
  v9 = 0;
  do
  {
    if (v8)
    {
      v41 = (_QWORD *)*v8;
      if (!v41)
        v42 = &v41;
      v10 = (char *)v8[1];
      free(v8);
      v11 = openat_NOCANCEL();
      if ((v11 & 0x80000000) == 0)
      {
        v12 = v11;
        goto LABEL_10;
      }
      goto LABEL_55;
    }
    v10 = 0;
    v12 = v6;
LABEL_10:
    while (1)
    {
      v13 = getattrlistbulk(v12, &v39, v43, 0x8000uLL, 0);
      if (v13 == -1)
        break;
      v14 = v13;
      if (!v13)
        goto LABEL_53;
      if (v13 >= 1)
      {
        v15 = (unsigned int *)v43;
        while (1)
        {
          v16 = v15[1];
          v17 = (unint64_t)v15 + *v15;
          v19 = v15[3];
          v18 = v15[4];
          if ((v16 & 0x20000000) == 0)
            break;
          if (!v15[6])
          {
            v20 = (int *)(v15 + 7);
            if ((v16 & 1) != 0)
            {
LABEL_21:
              if ((unint64_t)v20 + *v20 + v20[1] <= v17)
                v21 = (char *)v20 + *v20;
              else
                v21 = 0;
              v20 += 2;
              if ((v16 & 8) == 0)
              {
LABEL_25:
                v22 = 0;
                if ((v16 & 0x2000000) == 0)
                {
LABEL_26:
                  v24 = 0;
LABEL_27:
                  if (v22 == 2)
                  {
                    if (((v19 & 2) == 0 || *v20) && v21)
                    {
                      v29 = malloc_type_malloc(0x10uLL, 0x30040E4270A41uLL);
                      v30 = v29;
                      if (v10)
                      {
                        asprintf((char **)v29 + 1, "%s/%s", v10, v21);
                        if (v30[1])
                          goto LABEL_38;
LABEL_50:
                        free(v30);
                      }
                      else
                      {
                        v32 = strdup(v21);
                        v30[1] = v32;
                        if (!v32)
                          goto LABEL_50;
LABEL_38:
                        *v30 = 0;
                        *v42 = v30;
                        v42 = v30;
                      }
                    }
LABEL_46:
                    ++*((_QWORD *)&__src + 1);
                    goto LABEL_47;
                  }
                  if ((v18 & 1) != 0)
                  {
                    v31 = *v20++;
                    v26 = v31;
                    if ((v18 & 4) == 0)
                      goto LABEL_40;
LABEL_32:
                    v28 = *(_QWORD *)v20;
                    v20 += 2;
                    v27 = v28;
                    if ((v18 & 0x400) != 0)
                    {
LABEL_41:
                      if (!v27)
                        v27 = *(_QWORD *)v20;
                    }
                  }
                  else
                  {
                    v26 = 0;
                    if ((v18 & 4) != 0)
                      goto LABEL_32;
LABEL_40:
                    v27 = 0;
                    if ((v18 & 0x400) != 0)
                      goto LABEL_41;
                  }
                  if (v26 == 1 || !_dirstat_fileid_set_add(v7, v24))
                    *(_QWORD *)&__src = __src + v27;
                  goto LABEL_46;
                }
LABEL_18:
                v25 = *(char **)v20;
                v20 += 2;
                v24 = v25;
                goto LABEL_27;
              }
LABEL_17:
              v23 = *v20++;
              v22 = v23;
              if ((v16 & 0x2000000) == 0)
                goto LABEL_26;
              goto LABEL_18;
            }
LABEL_16:
            v21 = 0;
            if ((v16 & 8) == 0)
              goto LABEL_25;
            goto LABEL_17;
          }
LABEL_47:
          v15 = (unsigned int *)v17;
          if (!--v14)
            goto LABEL_10;
        }
        v20 = (int *)(v15 + 6);
        if ((v16 & 1) != 0)
          goto LABEL_21;
        goto LABEL_16;
      }
    }
    if (v12 == v6)
      v9 = *__error();
LABEL_53:
    if (v10)
    {
      close_NOCANCEL();
LABEL_55:
      free(v10);
    }
    v8 = v41;
  }
  while (v41);
  _dirstat_fileid_set_destroy(v7);
  if (v9)
  {
    *__error() = v9;
    v33 = 0xFFFFFFFFLL;
  }
  else
  {
    v33 = 0;
  }
  v34 = *__error();
  if (v36 < 0x10)
    memcpy(v37, &__src, v36);
  else
    *v37 = __src;
  close_NOCANCEL();
  *__error() = v34;
  return v33;
}

void _dirstat_fileid_set_destroy(char **a1)
{
  unint64_t v2;
  char *v3;
  unint64_t i;
  char *v5;
  _QWORD *v6;

  v2 = (unint64_t)a1[2];
  v3 = *a1;
  if (v2)
  {
    for (i = 0; i < v2; ++i)
    {
      v5 = &v3[8 * i];
      v6 = *(_QWORD **)v5;
      if (*(_QWORD *)v5)
      {
        do
        {
          *(_QWORD *)v5 = *v6;
          free(v6);
          v3 = *a1;
          v5 = &(*a1)[8 * i];
          v6 = *(_QWORD **)v5;
        }
        while (*(_QWORD *)v5);
        v2 = (unint64_t)a1[2];
      }
    }
  }
  free(v3);
  free(a1);
}

_QWORD *_dirstat_fileid_set_create()
{
  _QWORD *v0;
  void *v1;

  v0 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040EE89F85BuLL);
  v0[2] = 0x2000;
  v1 = malloc_type_calloc(0x2000uLL, 8uLL, 0x2004093837F09uLL);
  *v0 = v1;
  if (!v1)
  {
    free(v0);
    return 0;
  }
  return v0;
}

uint64_t os_variant_has_internal_content()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if ((_BYTE)disabled_status)
    return 0;
  else
    return _check_internal_release_type();
}

uint64_t _check_internal_release_type()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (internal_release_type == 2)
    return 0;
  if (internal_release_type != 3)
    _check_internal_release_type_cold_1();
  return 1;
}

uint64_t os_parse_boot_arg_string(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  size_t v9;
  _QWORD v10[3];
  uint64_t v11;

  v10[0] = 0;
  sysctlbyname_get_data_np("kern.bootargs", v10, &v9);
  v6 = (char *)v10[0];
  v10[0] = a1;
  v10[1] = a2;
  v10[2] = a3;
  v11 = 0;
  _enum_boot_arg_values(v6, (uint64_t)v10, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_check_boot_arg_value);
  v7 = BYTE1(v11);
  free(v6);
  return v7;
}

BOOL os_parse_boot_arg_int(char *a1, uint64_t *a2)
{
  char *v4;
  _BOOL8 v5;
  size_t v7;
  char *v8;

  v8 = 0;
  sysctlbyname_get_data_np("kern.bootargs", &v8, &v7);
  v4 = v8;
  v5 = _parse_boot_arg_int(v8, a1, a2);
  free(v4);
  return v5;
}

uint64_t sysctlbyname_get_data_np(const char *a1, _QWORD *a2, size_t *a3)
{
  size_t v6;
  int v7[4];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  v6 = 4;
  if (sysctlnametomib(a1, v7, &v6))
    return *__error();
  else
    return sysctl_get_data_np(v7, v6, a2, a3);
}

uint64_t sysctl_get_data_np(int *a1, u_int a2, _QWORD *a3, size_t *a4)
{
  void *v8;
  uint64_t v9;
  size_t size;

  size = 0;
  v8 = 0;
  if (sysctl(a1, a2, 0, &size, 0, 0)
    || (v8 = malloc_type_malloc(size, 0x78E5241DuLL)) == 0
    || sysctl(a1, a2, v8, &size, 0, 0))
  {
    v9 = *__error();
    if ((_DWORD)v9)
      free(v8);
  }
  else
  {
    v9 = 0;
    *a3 = v8;
    *a4 = size;
  }
  return v9;
}

BOOL _parse_boot_arg_int(char *a1, char *a2, uint64_t *a3)
{
  _BOOL8 result;
  uint64_t v5;
  char *v6[2];
  __int128 v7;
  char __str[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  *(_QWORD *)__str = 0;
  v9 = 0;
  v10 = 0;
  v6[0] = a2;
  v6[1] = __str;
  v7 = xmmword_1DEED46E0;
  _enum_boot_arg_values(a1, (uint64_t)v6, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_check_boot_arg_value);
  result = BYTE9(v7) != 0;
  if (a3 && BYTE9(v7))
  {
    if (BYTE8(v7))
    {
      v5 = 1;
LABEL_5:
      *a3 = v5;
      return 1;
    }
    v6[0] = 0;
    v5 = strtoll(__str, v6, 0);
    result = 0;
    if (!*v6[0])
      goto LABEL_5;
  }
  return result;
}

char *_enum_boot_arg_values(char *a1, uint64_t a2, uint64_t (*a3)(uint64_t, unsigned __int8 *, const char *, BOOL))
{
  char *result;
  unsigned __int8 *v6;
  char *v7;
  int v8;
  const char *v9;
  char *__stringp;

  __stringp = a1;
  do
  {
    result = strsep(&__stringp, " \t");
    if (!result)
      break;
    v6 = (unsigned __int8 *)result;
    v7 = strchr(result, 61);
    v8 = *v6;
    if (v8 == 45)
    {
      v9 = 0;
    }
    else if (v7)
    {
      *v7 = 0;
      v9 = v7 + 1;
    }
    else
    {
      v9 = "1";
    }
    result = (char *)a3(a2, v6, v9, v8 == 45);
  }
  while ((result & 1) != 0);
  return result;
}

BOOL _check_boot_arg_value(uint64_t a1, const char *a2, const char *a3, int a4)
{
  char *v7;
  int v8;
  const char *v9;

  if (!strcmp(*(const char **)a1, a2))
  {
    *(_BYTE *)(a1 + 25) = 1;
    *(_BYTE *)(a1 + 24) = a4;
    v7 = *(char **)(a1 + 8);
    if (v7)
    {
      if (a3)
        v8 = a4;
      else
        v8 = 1;
      if (v8)
        v9 = "";
      else
        v9 = a3;
      strlcpy(v7, v9, *(_QWORD *)(a1 + 16));
    }
  }
  return *(_BYTE *)(a1 + 25) == 0;
}

uint64_t os_variant_has_internal_diagnostics()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (BYTE1(disabled_status))
    return 0;
  else
    return _check_internal_release_type();
}

uint64_t dirstat_np()
{
  return dirstatat_np();
}

uint64_t os_variant_is_darwinos()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (darwin_release_type == 2)
    return 0;
  if (darwin_release_type != 3)
    _check_internal_release_type_cold_1();
  return 1;
}

uint64_t os_variant_is_recovery()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (recovery_release_type == 2)
    return 0;
  if (recovery_release_type != 3)
    _check_internal_release_type_cold_1();
  return 1;
}

uint64_t os_mach_msg_get_trailer(uint64_t a1)
{
  return a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL);
}

uint64_t os_mach_msg_get_audit_trailer(uint64_t a1)
{
  _DWORD *v1;

  v1 = (_DWORD *)(a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL));
  if (*v1)
    return 0;
  if (v1[1] <= 0x33u)
    return 0;
  return a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL);
}

uint64_t os_mach_msg_get_context_trailer(uint64_t a1)
{
  _DWORD *v1;

  v1 = (_DWORD *)(a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL));
  if (*v1)
    return 0;
  if (v1[1] <= 0x3Bu)
    return 0;
  return a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL);
}

void os_assert_mach_port_status(uint64_t a1, mach_port_name_t a2, int *a3)
{
  kern_return_t attributes;
  int v5;
  int v7;
  int v8;
  integer_t v9;
  int v10;
  integer_t v11;
  int v12;
  integer_t v13;
  int v14;
  integer_t v15;
  int v16;
  integer_t v17;
  int v18;
  integer_t v19;
  int v20;
  integer_t v21;
  int v22;
  integer_t v23;
  int v24;
  integer_t v25;
  int v26;
  integer_t v27;
  int v28;
  integer_t v29;
  int v30;
  integer_t v31;
  int v32;
  integer_t v33;
  int v34;
  integer_t v35;
  int v36;
  integer_t v37;
  int v38;
  integer_t v39;
  int v40;
  integer_t v41;
  int v42;
  integer_t v43;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  __int128 v46;
  uint64_t v47;
  int v48;
  integer_t v49;
  __int16 v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C874D8];
  v47 = 0;
  *(_OWORD *)port_info_out = 0u;
  v46 = 0u;
  port_info_outCnt = 10;
  attributes = mach_port_get_attributes(*MEMORY[0x1E0C883F0], a2, 2, port_info_out, &port_info_outCnt);
  if (attributes)
    os_assert_mach((int)"get status", attributes);
  v5 = *a3;
  if (*a3 != -1 && v5 != port_info_out[0])
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v24 = v5;
    v25 = port_info_out[0];
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v25;
    v50 = 1024;
    v51 = v24;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  v7 = a3[1];
  if (v7 != -1 && v7 != port_info_out[1])
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v26 = v7;
    v27 = port_info_out[1];
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v27;
    v50 = 1024;
    v51 = v26;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_28:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v28 = v8;
    v29 = v9;
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v29;
    v50 = 1024;
    v51 = v28;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_29:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v30 = v10;
    v31 = v11;
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v31;
    v50 = 1024;
    v51 = v30;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_30:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v32 = v12;
    v33 = v13;
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v33;
    v50 = 1024;
    v51 = v32;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_31:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v34 = v14;
    v35 = v15;
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    v48 = 67109376;
    v49 = v35;
    v50 = 1024;
    v51 = v34;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_32;
  }
  v8 = a3[2];
  if (v8 != -1)
  {
    v9 = port_info_out[2];
    if (v8 != port_info_out[2])
      goto LABEL_28;
  }
  v10 = a3[3];
  if (v10 != -1)
  {
    v11 = port_info_out[3];
    if (v10 != port_info_out[3])
      goto LABEL_29;
  }
  v12 = a3[4];
  if (v12 != -1)
  {
    v13 = v46;
    if (v12 != (_DWORD)v46)
      goto LABEL_30;
  }
  v14 = a3[5];
  if (v14 != -1)
  {
    v15 = DWORD1(v46);
    if (v14 != DWORD1(v46))
      goto LABEL_31;
  }
  v16 = a3[6];
  if (v16 != 0x7FFFFFFF)
  {
    v17 = DWORD2(v46);
    if (v16 != DWORD2(v46))
      goto LABEL_33;
  }
  v18 = a3[7];
  if (v18 != 0x7FFFFFFF)
  {
    v19 = HIDWORD(v46);
    if (v18 != HIDWORD(v46))
      goto LABEL_34;
  }
  v20 = a3[8];
  if (v20 != 0x7FFFFFFF)
  {
    v21 = v47;
    if (v20 != (_DWORD)v47)
      goto LABEL_35;
  }
  v22 = a3[9];
  if (v22)
  {
    v23 = HIDWORD(v47);
    if (v22 != HIDWORD(v47))
    {
LABEL_32:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      v36 = v22;
      v37 = v23;
      os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v37;
      v50 = 1024;
      v51 = v36;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
LABEL_33:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      v38 = v16;
      v39 = v17;
      os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v39;
      v50 = 1024;
      v51 = v38;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
LABEL_34:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      v40 = v18;
      v41 = v19;
      os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v41;
      v50 = 1024;
      v51 = v40;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
LABEL_35:
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v52 = 0u;
      v42 = v20;
      v43 = v21;
      os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
      v48 = 67109376;
      v49 = v43;
      v50 = 1024;
      v51 = v42;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
  }
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 - 96) = 0u;
  *(_OWORD *)(v0 - 80) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  *(_OWORD *)(v0 - 144) = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_3()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t result, float a2)
{
  uint64_t v2;
  uint64_t v3;

  *(float *)(v3 - 176) = a2;
  *(_QWORD *)(v2 + 4) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_7(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_11()
{
  _OWORD *v0;
  uint64_t v1;
  double result;

  result = 0.0;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  *(_OWORD *)(v1 - 144) = 0u;
  return result;
}

char *OUTLINED_FUNCTION_12(int *a1)
{
  return strerror(*a1);
}

void OUTLINED_FUNCTION_13(int a1@<W8>, float a2@<S0>)
{
  uint64_t v2;

  *(float *)(v2 - 64) = a2;
  *(_DWORD *)(v2 - 60) = a1;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return _os_crash_msg();
}

uint64_t OUTLINED_FUNCTION_16(char *a1, uint64_t a2, const char *a3)
{
  size_t v3;

  return snprintf(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return _os_crash_msg();
}

double OUTLINED_FUNCTION_18()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 64) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return _os_crash_msg();
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v3;

  return snprintf((char *)(v3 - 152), 0x10uLL, a3);
}

uint64_t os_variant_allows_security_research()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (allows_security_research == 2)
    return 0;
  if (allows_security_research != 3)
    _check_internal_release_type_cold_1();
  return 1;
}

uint64_t os_variant_check(uint64_t a1, const char *a2)
{
  const char *v4;
  char **i;
  size_t v6;
  char *v7;

  v4 = "AllowsInternalSecurityPolicies";
  for (i = &off_1EA95D0B0; ; i += 2)
  {
    v6 = strlen(v4);
    if (!strncasecmp(v4, a2, v6))
      break;
    v7 = *i;
    v4 = v7;
    if (!v7)
      return 0;
  }
  return ((uint64_t (*)(uint64_t))*(i - 1))(a1);
}

char *os_variant_copy_description(uint64_t a1)
{
  char *result;
  FILE *v3;
  char v4;
  const char *v5;
  char **v6;
  char *v7;
  int v8;
  int *v9;
  size_t v10;
  char *__bufp;

  v10 = 0;
  __bufp = 0;
  result = (char *)open_memstream(&__bufp, &v10);
  if (result)
  {
    v3 = (FILE *)result;
    v4 = 0;
    v5 = "AllowsInternalSecurityPolicies";
    v6 = &off_1EA95D0B0;
    do
    {
      if (((unsigned int (*)(uint64_t))*(v6 - 1))(a1))
      {
        if ((v4 & 1) != 0 && fputc(32, v3) == -1 || fputs(v5, v3) == -1)
        {
          v8 = *__error();
          fclose(v3);
          goto LABEL_13;
        }
        v4 = 1;
      }
      v7 = *v6;
      v6 += 2;
      v5 = v7;
    }
    while (v7);
    if (fclose(v3) != -1)
      return __bufp;
    v8 = *__error();
LABEL_13:
    free(__bufp);
    v9 = __error();
    result = 0;
    *v9 = v8;
  }
  return result;
}

uint64_t os_variant_init_4launchd()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (getpid() != 1)
    os_variant_init_4launchd_cold_10(&v5, v6);
  has_full_logging = 3;
  _parse_disabled_status();
  v4 = 0;
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (!can_has_debugger)
    os_variant_init_4launchd_cold_1(&v5, v6);
  if (!is_ephemeral)
    os_variant_init_4launchd_cold_2(&v5, v6);
  if (!has_full_logging)
    os_variant_init_4launchd_cold_3(&v5, v6);
  if (!internal_release_type)
    os_variant_init_4launchd_cold_4(&v5, v6);
  if (!factory_release_type)
    os_variant_init_4launchd_cold_5(&v5, v6);
  if (!darwin_release_type)
    os_variant_init_4launchd_cold_6(&v5, v6);
  if (!recovery_release_type)
    os_variant_init_4launchd_cold_7(&v5, v6);
  if (!development_kernel)
    os_variant_init_4launchd_cold_8(&v5, v6);
  if (!allows_security_research)
    os_variant_init_4launchd_cold_9(&v5, v6);
  v0 = 0;
  v1 = (is_ephemeral << 14) | (4 * can_has_debugger) | (has_full_logging << 24) | (16 * internal_release_type) | (factory_release_type << 10) | (darwin_release_type << 12) | (recovery_release_type << 16) | (development_kernel << 20) | (allows_security_research << 26) | 0x70000000F0000000;
  do
  {
    if (*((_BYTE *)&disabled_status + v0))
      v2 = 0x100000000 << v0;
    else
      v2 = 0;
    v1 |= v2;
    ++v0;
  }
  while (v0 != 4);
  v4 = v1;
  return sysctlbyname("kern.osvariant_status", 0, 0, &v4, 8uLL);
}

void _parse_disabled_status()
{
  char *file;
  char *v1;
  char *v2;
  uint64_t v3;
  char *__stringp[11];

  __stringp[10] = *(char **)MEMORY[0x1E0C874D8];
  disabled_status = 0;
  if (!access("/var/db/disableAppleInternal", 0) || !access("/usr/share/misc/os_variant_override", 0))
  {
    file = (char *)_read_file((uint64_t)"/usr/share/misc/os_variant_override", 0);
    if (!file)
    {
      file = strdup("content,diagnostics,ui,security");
      if (!file)
        _parse_disabled_status_cold_1(&v3, __stringp);
    }
    __stringp[0] = file;
    v1 = strsep(__stringp, ",\n");
    if (v1)
    {
      v2 = v1;
      do
      {
        if (!strcmp(v2, "content"))
        {
          LOBYTE(disabled_status) = 1;
        }
        else if (!strcmp(v2, "diagnostics"))
        {
          BYTE1(disabled_status) = 1;
        }
        else if (!strcmp(v2, "ui"))
        {
          BYTE2(disabled_status) = 1;
        }
        else if (!strcmp(v2, "security"))
        {
          HIBYTE(disabled_status) = 1;
        }
        v2 = strsep(__stringp, ",\n");
      }
      while (v2);
    }
    free(file);
  }
}

void *_read_file(uint64_t a1, unint64_t *a2)
{
  int v3;
  void *v4;
  unint64_t st_size;
  unint64_t v6;
  uint64_t NOCANCEL;
  stat v9;

  v3 = open_NOCANCEL();
  if (v3 == -1)
    return 0;
  memset(&v9, 0, sizeof(v9));
  v4 = 0;
  if (fstat(v3, &v9) || (st_size = v9.st_size) == 0)
  {
LABEL_14:
    close_NOCANCEL();
    free(v4);
    return 0;
  }
  if (a2)
  {
    v6 = *a2;
    if (!*a2)
      v6 = 1024;
    *a2 = v9.st_size;
  }
  else
  {
    v6 = 1024;
  }
  if (st_size > v6)
  {
    v4 = 0;
    goto LABEL_14;
  }
  v4 = malloc_type_malloc(st_size + 1, 0x5A98C297uLL);
  if (!v4)
    goto LABEL_14;
  NOCANCEL = read_NOCANCEL();
  *((_BYTE *)v4 + st_size) = 0;
  if (NOCANCEL != st_size)
    goto LABEL_14;
  close_NOCANCEL();
  return v4;
}

uint64_t os_variant_has_full_logging()
{
  if (_initialize_status_once != -1)
    dispatch_once(&_initialize_status_once, &__block_literal_global);
  if (has_full_logging == 2)
    return 0;
  if (has_full_logging != 3)
    _check_internal_release_type_cold_1();
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_0(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_3_0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return _os_crash_msg();
}

uint64_t os_localtime_file(char *a1)
{
  uint64_t v3;
  tm v4;
  timeval v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  v5.tv_sec = 0;
  *(_QWORD *)&v5.tv_usec = 0;
  memset(&v4, 0, sizeof(v4));
  if (gettimeofday(&v5, 0) == -1)
    os_localtime_file_cold_1(&v3, v6);
  localtime_r(&v5.tv_sec, &v4);
  return snprintf(a1, 0x20uLL, "%d-%02d-%02d_%02d.%02d.%02d.%06d", v4.tm_year + 1900, v4.tm_mon + 1, v4.tm_mday, v4.tm_hour, v4.tm_min, v4.tm_sec, v5.tv_usec);
}

unint64_t os_simple_hash_string_with_seed(char *a1, uint64_t a2)
{
  size_t v4;

  v4 = strlen(a1);
  return os_simple_hash_with_seed((unsigned __int8 *)a1, v4, a2);
}

unint64_t os_simple_hash_string(char *a1)
{
  size_t v2;

  v2 = strlen(a1);
  return os_simple_hash_with_seed((unsigned __int8 *)a1, v2, 0);
}

uint64_t realpath_np()
{
  uint64_t result;

  result = fcntl_NOCANCEL();
  if ((_DWORD)result)
    return *__error();
  return result;
}

uint64_t memdup_np(_QWORD *a1, const void *a2, size_t size)
{
  void *v6;
  void *v7;
  uint64_t result;

  v6 = malloc_type_malloc(size, 0x22C6FF7FuLL);
  if (!v6)
    return *__error();
  v7 = v6;
  memcpy(v6, a2, size);
  result = 0;
  *a1 = v7;
  return result;
}

void *memdup2_np(const void *a1, size_t a2)
{
  void *v4;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v4 = malloc_type_malloc(a2, 0x2D5C015EuLL);
      if (v4)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v4 = malloc_type_malloc(a2, 0x18EC0261uLL);
    if (!v4)
      memdup2_np_cold_1(&v6, v7);
  }
  return memcpy(v4, a1, a2);
}

uint64_t os_subcommand_main(int a1, uint64_t a2)
{
  char *v4;
  char *v5;
  __int16 v6;
  mach_header_64 *v7;
  char *v8;
  unint64_t v9;
  mach_header_64 *v10;
  char *v11;
  mach_header_64 *v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  char **v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  FILE *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char *__endptr;

  v42 = 5242904;
  __endptr = 0;
  v4 = getenv("COLUMNS");
  if (v4)
  {
    v5 = v4;
    v6 = strtoul(v4, &__endptr, 0);
    if (__endptr != v5 && *__endptr)
      LOWORD(v42) = v6;
  }
  else
  {
    v41 = &v42;
    if (ioctl(0, 0x40087468uLL))
      LODWORD(v42) = 5242904;
  }
  __ttys = v42;
  v7 = _NSGetMachExecuteHeader();
  __endptr = 0;
  v8 = getsectdatafromheader_64(v7, "__DATA_CONST", "__subcommands", (uint64_t *)&__endptr);
  v9 = (unint64_t)&v8[_dyld_get_image_slide()];
  v10 = _NSGetMachExecuteHeader();
  __endptr = 0;
  v11 = getsectdatafromheader_64(v10, "__DATA_CONST", "__subcommands", (uint64_t *)&__endptr);
  if ((char *)v9 < &v11[_dyld_get_image_slide() + (_QWORD)__endptr])
  {
    while ((*(_BYTE *)(*(_QWORD *)v9 + 8) & 8) == 0)
    {
      v9 += 8;
      v12 = _NSGetMachExecuteHeader();
      __endptr = 0;
      v13 = getsectdatafromheader_64(v12, "__DATA_CONST", "__subcommands", (uint64_t *)&__endptr);
      if ((char *)v9 >= &v13[_dyld_get_image_slide() + (_QWORD)__endptr])
        goto LABEL_12;
    }
    _main_cmd = *(_UNKNOWN **)v9;
  }
LABEL_12:
  if (_os_subcommand_be_helpful((uint64_t)_main_cmd, a1, a2))
  {
    _print_subcommand_list((FILE *)*MEMORY[0x1E0C874E8]);
    return 0;
  }
  result = (*((uint64_t (**)(void))_main_cmd + 9))();
  if ((_DWORD)result == 64)
    goto LABEL_25;
  if ((_DWORD)result)
    return result;
  v20 = (int)*MEMORY[0x1E0C87880];
  v21 = __OFSUB__(a1, (_DWORD)v20);
  v22 = (a1 - v20);
  if (((int)v22 < 0) ^ v21 | ((_DWORD)v22 == 0))
  {
    v33 = (FILE *)*MEMORY[0x1E0C874E0];
    v34 = "please provide a subcommand";
LABEL_24:
    os_subcommand_fprintf(result, v33, v34, v15, v16, v17, v18, v19, (char)v41);
LABEL_25:
    _print_subcommand_list((FILE *)*MEMORY[0x1E0C874E0]);
    return 64;
  }
  v23 = (char **)(a2 + 8 * v20);
  v24 = *v23;
  result = (uint64_t)_os_subcommand_find(*v23);
  if (!result)
  {
    v33 = (FILE *)*MEMORY[0x1E0C874E0];
    LOBYTE(v41) = (_BYTE)v24;
    v34 = "unknown subcommand: %s";
    goto LABEL_24;
  }
  v25 = result;
  v26 = *(_QWORD *)(result + 8);
  if ((v26 & 1) != 0)
  {
    v27 = geteuid();
    if ((_DWORD)v27)
    {
      os_subcommand_fprintf(v27, (FILE *)*MEMORY[0x1E0C874E0], "subcommand requires root: %s", v28, v29, v30, v31, v32, (char)v24);
      return 77;
    }
    v26 = *(_QWORD *)(v25 + 8);
  }
  if ((v26 & 2) != 0)
  {
    v35 = isatty(1);
    if (!(_DWORD)v35 || (v35 = isatty(0), !(_DWORD)v35))
    {
      os_subcommand_fprintf(v35, (FILE *)*MEMORY[0x1E0C874E0], "subcommand requires a tty: %s", v36, v37, v38, v39, v40, (char)v24);
      return 69;
    }
  }
  if (_os_subcommand_be_helpful(v25, v22, (uint64_t)v23))
    return 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, char **))(v25 + 72))(v25, v22, v23);
  if ((_DWORD)result == 64)
  {
    _os_subcommand_print_usage(v25, (FILE *)*MEMORY[0x1E0C874E0]);
    return 64;
  }
  return result;
}

uint64_t _os_subcommand_be_helpful(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;
  const char *v6;

  v4 = *(_QWORD *)(a1 + 8);
  if (a2 == 1 && (v4 & 0x10) != 0)
  {
LABEL_3:
    _os_subcommand_print_usage(a1, (FILE *)*MEMORY[0x1E0C874E8]);
    return 1;
  }
  result = 0;
  if (a2 == 2 && (v4 & 0x20) != 0)
  {
    v6 = *(const char **)(a3 + 8);
    if (strcmp(v6, "help") && strcmp(v6, "-h") && strcmp(v6, "-help") && strcmp(v6, "--help"))
      return 0;
    goto LABEL_3;
  }
  return result;
}

void _print_subcommand_list(FILE *a1)
{
  mach_header_64 *v2;
  char *v3;
  uint64_t *v4;
  mach_header_64 *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_header_64 *v13;
  char *v14;
  char v15;
  char v16;
  uint64_t size;

  v16 = 0;
  v2 = _NSGetMachExecuteHeader();
  size = 0;
  v3 = getsectdatafromheader_64(v2, "__DATA_CONST", "__subcommands", &size);
  v4 = (uint64_t *)&v3[_dyld_get_image_slide()];
  v5 = _NSGetMachExecuteHeader();
  size = 0;
  v6 = getsectdatafromheader_64(v5, "__DATA_CONST", "__subcommands", &size);
  if (v4 < (uint64_t *)&v6[_dyld_get_image_slide() + size])
  {
    do
    {
      v12 = *v4;
      _print_header(a1, (char)"SUBCOMMANDS", &v16, v7, v8, v9, v10, v11, v15);
      if ((*(_BYTE *)(v12 + 8) & 0xC) == 0)
        _os_subcommand_print_help_line(v12, a1);
      ++v4;
      v13 = _NSGetMachExecuteHeader();
      size = 0;
      v14 = getsectdatafromheader_64(v13, "__DATA_CONST", "__subcommands", &size);
    }
    while (v4 < (uint64_t *)&v14[_dyld_get_image_slide() + size]);
  }
  _os_subcommand_print_help_line((uint64_t)&__help_cmd, a1);
}

uint64_t os_subcommand_fprintf(uint64_t a1, FILE *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return vcrfprintf_np(a2, a3, &a9);
}

void *_os_subcommand_find(char *__s2)
{
  mach_header_64 *v2;
  char *v3;
  uint64_t v4;
  mach_header_64 *v5;
  char *v6;
  uint64_t v7;
  mach_header_64 *v8;
  char *v9;
  uint64_t size;

  if (!__s2)
    return _main_cmd;
  if (!strcmp("help", __s2))
    return &__help_cmd;
  v2 = _NSGetMachExecuteHeader();
  size = 0;
  v3 = getsectdatafromheader_64(v2, "__DATA_CONST", "__subcommands", &size);
  v4 = (uint64_t)&v3[_dyld_get_image_slide()];
  v5 = _NSGetMachExecuteHeader();
  size = 0;
  v6 = getsectdatafromheader_64(v5, "__DATA_CONST", "__subcommands", &size);
  v7 = 0;
  if (v4 < (unint64_t)&v6[_dyld_get_image_slide() + size])
  {
    while (1)
    {
      v7 = *(_QWORD *)v4;
      if ((*(_BYTE *)(*(_QWORD *)v4 + 8) & 8) == 0 && !strcmp(*(const char **)(v7 + 16), __s2))
        break;
      v4 += 8;
      v8 = _NSGetMachExecuteHeader();
      size = 0;
      v9 = getsectdatafromheader_64(v8, "__DATA_CONST", "__subcommands", &size);
      if (v4 >= (unint64_t)&v9[_dyld_get_image_slide() + size])
        return 0;
    }
  }
  return (void *)v7;
}

void _os_subcommand_print_usage(uint64_t a1, FILE *a2)
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
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
  uint64_t v38;
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
  uint64_t v49;
  uint64_t v50;
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
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  uint64_t v96;
  char *v97;
  _OWORD v98[5];
  char __str[64];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C874D8];
  v95 = 0;
  v94 = 1;
  v97 = 0;
  if (*(_QWORD *)(a1 + 56))
    v4 = " [options]";
  else
    v4 = "";
  if (_main_cmd == (_UNKNOWN *)a1)
    __str[0] = 0;
  else
    snprintf(__str, 0x40uLL, " %s", *(const char **)(a1 + 16));
  v5 = getprogname();
  if (asprintf(&v97, "%s%s%s", v5, __str, v4) < 0)
    _os_subcommand_print_usage_cold_1(&v96, v98);
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    v10 = 0;
    v11 = 8;
    v12 = *(_QWORD *)(a1 + 48);
    do
    {
      if ((*(_BYTE *)(v12 + v11) & 1) != 0)
        break;
      v13 = v97;
      v14 = _os_subcommand_copy_option_spec_long(v9);
      if (asprintf(&v97, "%s %s", v97, v14) < 0)
        _os_subcommand_print_usage_cold_1(&v96, v98);
      ++v10;
      free(v14);
      free(v13);
      v12 = *(_QWORD *)(a1 + 48);
      v9 = v12 + 40 * v10;
      v11 += 40;
    }
    while (v12);
  }
  v15 = *(_QWORD *)(a1 + 64);
  if (v15)
  {
    v16 = 0;
    v17 = 8;
    v18 = *(_QWORD *)(a1 + 64);
    do
    {
      v19 = *(_QWORD *)(v18 + v17);
      if ((v19 & 1) != 0)
        break;
      if ((v19 & 2) != 0)
        v20 = "]";
      else
        v20 = ">";
      if ((v19 & 2) != 0)
        v21 = "[";
      else
        v21 = "<";
      v22 = v97;
      v23 = _os_subcommand_copy_option_spec_long(v15);
      if (asprintf(&v97, "%s %s%s%s", v97, v21, v23, v20) < 0)
        _os_subcommand_print_usage_cold_1(&v96, v98);
      ++v16;
      free(v23);
      free(v22);
      v18 = *(_QWORD *)(a1 + 64);
      v15 = v18 + 40 * v16;
      v17 += 40;
    }
    while (v18);
  }
  if ((_UNKNOWN *)a1 != &__main_cmd && _main_cmd == (_UNKNOWN *)a1)
  {
    v24 = v97;
    v25 = _os_subcommand_copy_option_spec_long((uint64_t)&_main_positional);
    if (asprintf(&v97, "%s <%s>", v97, v25) < 0)
      _os_subcommand_print_usage_cold_1(&v96, v98);
    free(v25);
    free(v24);
  }
  v26 = v97;
  wfprintf_np(a2, 0, 4uLL, WORD1(__ttys), "USAGE:", v6, v7, v8, v91);
  crfprintf_np(a2, "", v27, v28, v29, v30, v31, v32, v92);
  wfprintf_np(a2, 4, 4uLL, WORD1(__ttys), "%s", v33, v34, v35, (char)v26);
  if (*(_QWORD *)(a1 + 80))
  {
    _print_header(a2, (char)"DESCRIPTION", 0, v37, v38, v39, v40, v41, v93);
    wfprintf_np(a2, 4, 4uLL, WORD1(__ttys), "%s", v42, v43, v44, *(_QWORD *)(a1 + 80));
  }
  else if (*(_QWORD *)(a1 + 24))
  {
    crfprintf_np(a2, "", v36, v37, v38, v39, v40, v41, v93);
    wfprintf_np(a2, 0, 4uLL, WORD1(__ttys), "DESCRIPTION: %s", v45, v46, v47, *(_QWORD *)(a1 + 24));
  }
  v48 = *(_QWORD *)(a1 + 48);
  if (v48)
  {
    v49 = 0;
    v50 = 8;
    v51 = *(_QWORD *)(a1 + 48);
    do
    {
      if ((*(_BYTE *)(v51 + v50) & 1) != 0)
        break;
      ++v49;
      _print_header(a2, (char)"REQUIRED", &v95, v37, v38, v39, v40, v41, v93);
      _os_subcommand_print_option_usage(v48, a2, &v94, v52, v53, v54, v55, v56);
      v51 = *(_QWORD *)(a1 + 48);
      v48 = v51 + 40 * v49;
      v50 += 40;
    }
    while (v51);
    v57 = *(_QWORD *)(a1 + 64);
  }
  else
  {
    v57 = *(_QWORD *)(a1 + 64);
    if (!v57 && _main_cmd != (_UNKNOWN *)a1)
      goto LABEL_48;
  }
  if (v57)
  {
    v58 = 0;
    v59 = 8;
    v60 = v57;
    do
    {
      v61 = *(_QWORD *)(v57 + v59);
      if ((v61 & 1) != 0)
        break;
      if ((v61 & 2) == 0)
      {
        _print_header(a2, (char)"REQUIRED", &v95, v37, v38, v39, v40, v41, v93);
        _os_subcommand_print_option_usage(v60, a2, &v94, v62, v63, v64, v65, v66);
        v57 = *(_QWORD *)(a1 + 64);
      }
      ++v58;
      v60 = v57 + 40 * v58;
      v59 += 40;
    }
    while (v57);
  }
  if ((_UNKNOWN *)a1 != &__main_cmd && _main_cmd == (_UNKNOWN *)a1)
  {
    _print_header(a2, (char)"REQUIRED", &v95, v37, v38, v39, v40, v41, v93);
    _os_subcommand_print_option_usage((uint64_t)&_main_positional, a2, &v94, v67, v68, v69, v70, v71);
  }
LABEL_48:
  v95 = 0;
  v94 = 1;
  v72 = *(_QWORD *)(a1 + 56);
  if (v72)
  {
    v73 = 0;
    v74 = 8;
    v75 = *(_QWORD *)(a1 + 56);
    do
    {
      if ((*(_BYTE *)(v75 + v74) & 1) != 0)
        break;
      ++v73;
      _print_header(a2, (char)"OPTIONAL", &v95, v37, v38, v39, v40, v41, v93);
      _os_subcommand_print_option_usage(v72, a2, &v94, v76, v77, v78, v79, v80);
      v75 = *(_QWORD *)(a1 + 56);
      v72 = v75 + 40 * v73;
      v74 += 40;
    }
    while (v75);
  }
  v81 = *(_QWORD *)(a1 + 64);
  if (v81)
  {
    v82 = 0;
    v83 = 8;
    v84 = *(_QWORD *)(a1 + 64);
    do
    {
      v85 = *(_QWORD *)(v81 + v83);
      if ((v85 & 1) != 0)
        break;
      if ((v85 & 2) != 0)
      {
        _print_header(a2, (char)"OPTIONAL", &v95, v37, v38, v39, v40, v41, v93);
        _os_subcommand_print_option_usage(v84, a2, &v94, v86, v87, v88, v89, v90);
        v81 = *(_QWORD *)(a1 + 64);
      }
      ++v82;
      v84 = v81 + 40 * v82;
      v83 += 40;
    }
    while (v81);
  }
  free(v26);
}

uint64_t os_subcommand_vfprintf(uint64_t a1, FILE *a2, const char *a3, va_list a4)
{
  if (!a1 || (*(_BYTE *)(a1 + 8) & 8) != 0)
  {
    getprogname();
    fprintf(a2, "%s: ");
  }
  else
  {
    getprogname();
    fprintf(a2, "%s-%s: ");
  }
  return vcrfprintf_np(a2, a3, a4);
}

uint64_t _main_invoke()
{
  return 0;
}

FILE *_print_header(FILE *result, char a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  FILE *v10;
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
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;

  v10 = result;
  if (a3)
  {
    if (!*a3)
    {
      crfprintf_np(result, "", (uint64_t)a3, a4, a5, a6, a7, a8, v36);
      crfprintf_np(v10, "%s:", v12, v13, v14, v15, v16, v17, a2);
      result = (FILE *)crfprintf_np(v10, "", v18, v19, v20, v21, v22, v23, v37);
      *a3 = 1;
    }
  }
  else
  {
    crfprintf_np(result, "", 0, a4, a5, a6, a7, a8, v36);
    crfprintf_np(v10, "%s:", v24, v25, v26, v27, v28, v29, a2);
    return (FILE *)crfprintf_np(v10, "", v30, v31, v32, v33, v34, v35, a9);
  }
  return result;
}

void _os_subcommand_print_help_line(uint64_t a1, FILE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  char v11;

  fprintf(a2, "    %-8s    ", *(const char **)(a1 + 16));
  if (strlen(*(const char **)(a1 + 16)) < 0xC)
  {
    v10 = -16;
  }
  else
  {
    crfprintf_np(a2, "", v4, v5, v6, v7, v8, v9, v11);
    v10 = 16;
  }
  wfprintf_np(a2, v10, 0x10uLL, WORD1(__ttys), "%s", v7, v8, v9, *(_QWORD *)(a1 + 24));
}

uint64_t _help_invoke(uint64_t a1, int a2, uint64_t a3)
{
  char *v3;
  FILE *v4;
  void *v5;
  void *v6;
  FILE **v7;
  uint64_t v8;
  void *v9;
  FILE *v10;

  if (a2 < 2)
    v3 = 0;
  else
    v3 = *(char **)(a3 + 8);
  v4 = (FILE *)*MEMORY[0x1E0C874E8];
  v5 = _os_subcommand_find(v3);
  v6 = v5;
  v7 = (FILE **)MEMORY[0x1E0C874E0];
  if (v5)
  {
    v8 = 0;
    v9 = v5;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E0C874E0], "unrecognized subcommand: %s\n", v3);
    v9 = _main_cmd;
    v8 = 69;
  }
  if (v6)
    v10 = v4;
  else
    v10 = *v7;
  _os_subcommand_print_usage((uint64_t)v9, v10);
  if (v9 == _main_cmd)
    _print_subcommand_list(v10);
  return v8;
}

void _os_subcommand_print_option_usage(uint64_t a1, FILE *a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  char *v25;
  _OWORD v26[5];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C874D8];
  if (!*a3)
    crfprintf_np(a2, "", (uint64_t)a3, a4, a5, a6, a7, a8, v22);
  v11 = _os_subcommand_copy_option_spec_long(a1);
  v12 = v11;
  v25 = v11;
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    if (asprintf(&v25, "-%c | %s", *(unsigned int *)(v13 + 24), v11) < 0)
      _os_subcommand_print_usage_cold_1(&v24, v26);
    v14 = v25;
  }
  else
  {
    v14 = v11;
    v12 = 0;
  }
  free(v12);
  fprintf(a2, "    %-8s    ", v14);
  if (strlen(v14) < 0xC)
  {
    v21 = -16;
  }
  else
  {
    crfprintf_np(a2, "", v15, v16, v17, v18, v19, v20, v23);
    v21 = 16;
  }
  wfprintf_np(a2, v21, 0x10uLL, WORD1(__ttys), "%s", v18, v19, v20, *(_QWORD *)(a1 + 32));
  *a3 = 0;
  free(v14);
}

char *_os_subcommand_copy_option_spec_long(uint64_t a1)
{
  uint64_t v2;
  int v3;
  char *v4;
  uint64_t v6;
  char *v7;
  _OWORD v8[5];
  char v9[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char __str[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  v2 = *(_QWORD *)(a1 + 16);
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)__str = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)v9 = 0u;
  v10 = 0u;
  v7 = 0;
  if (v2)
  {
    snprintf(__str, 0x40uLL, "--%s", *(const char **)v2);
    v3 = *(_DWORD *)(v2 + 8);
    if (v3)
    {
      if (v3 == 2)
        snprintf(v9, 0x40uLL, "[=%s]");
      else
        snprintf(v9, 0x40uLL, "=<%s>");
    }
    if ((*(_BYTE *)(a1 + 8) & 4) == 0)
    {
      v4 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = __str;
    snprintf(__str, 0x40uLL, "%s", *(const char **)(a1 + 24));
    if ((*(_BYTE *)(a1 + 8) & 4) == 0)
LABEL_10:
      _stoupper(v4);
  }
  if (asprintf(&v7, "%s%s", __str, v9) < 0)
    _os_subcommand_print_usage_cold_1(&v6, v8);
  return v7;
}

size_t _stoupper(const char *a1)
{
  char *v1;
  size_t result;
  size_t v3;

  v1 = (char *)a1;
  result = strlen(a1);
  if (result)
  {
    v3 = result;
    do
    {
      result = ___toupper(*v1);
      *v1++ = result;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_1(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_3_1()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return _os_crash_msg();
}

uint64_t fcheck_np(FILE *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == a3)
    return 0;
  if (feof(a1))
    return 0xFFFFFFFFLL;
  ferror(a1);
  return 1;
}

uint64_t dup_np(int a1)
{
  uint64_t result;
  int v3;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  while (1)
  {
    result = dup(a1);
    if ((result & 0x80000000) == 0)
      break;
    v3 = *__error();
    if (v3 != 4)
    {
      if ((v3 - 23) < 2)
        dup_np_cold_3();
      if (v3 == 9)
        dup_np_cold_2();
      dup_np_cold_1(&v4, v5);
    }
  }
  return result;
}

uint64_t claimfd_np(_DWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  v3 = *a1;
  if (a2 && change_fdguard_np())
    claimfd_np_cold_1(&v5, v6);
  *a1 = -1;
  return v3;
}

uint64_t xferfd_np(_DWORD *a1)
{
  uint64_t v2;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  v2 = *a1;
  if (change_fdguard_np())
    claimfd_np_cold_1(&v4, v5);
  *a1 = -1;
  return v2;
}

uint64_t close_drop_np(_DWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  if (a2)
    result = guarded_close_np();
  else
    result = close_NOCANCEL();
  if ((_DWORD)result == -1)
    close_drop_np_cold_1(&v4, v5);
  *a1 = -1;
  return result;
}

_DWORD *close_drop_optional_np(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) == 0)
    return (_DWORD *)close_drop_np(a1, a2);
  return a1;
}

uint64_t zsnprintf_np(char *a1, size_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  int v11;

  v10 = vsnprintf(a1, a2, a3, &a9);
  if (v10 >= a2)
    v11 = a2 - 1;
  else
    v11 = v10;
  if (v10 < 0)
    return 0;
  return v11;
}

uint64_t crfprintf_np(FILE *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vfprintf(a1, a2, &a9);
  return fputc(10, a1);
}

uint64_t vcrfprintf_np(FILE *a1, const char *a2, va_list a3)
{
  vfprintf(a1, a2, a3);
  return fputc(10, a1);
}

void wfprintf_np(FILE *a1, int64_t a2, size_t a3, unint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vwfprintf_np(a1, a2, a3, a4, a5, &a9);
}

void vwfprintf_np(FILE *a1, int64_t a2, size_t a3, unint64_t a4, char *a5, va_list a6)
{
  unint64_t v6;
  unsigned int v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  size_t v19;
  const char *v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  char *v24;
  size_t v26;
  char *v27;

  v27 = 0;
  if (a2 >= 0)
    v6 = a2;
  else
    v6 = -a2;
  v26 = v6;
  if (a4 - 1 < a3)
    vwfprintf_np_cold_1();
  if (a2 >= 1 && a4 && v6 >= a4)
    vwfprintf_np_cold_3();
  if (a2 < 0 && a4 && v6 >= a4)
    vwfprintf_np_cold_2();
  v10 = vasprintf(&v27, a5, a6);
  v11 = 0;
  if ((v10 & 0x80000000) != 0)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_39;
  }
  v12 = v27;
  v13 = 0;
  v14 = 0;
  if (v27)
  {
    v15 = v10;
    v11 = (char *)malloc_type_malloc(v10 + 1, 0x92326105uLL);
    if (v11)
    {
      v16 = (char *)malloc_type_malloc(v26 + 1, 0x432809DCuLL);
      v13 = v16;
      if (v16)
      {
        v17 = v16;
        if ((a2 & 0x8000000000000000) == 0)
        {
          memset(v16, 32, a2);
          v17 = &v13[a2];
        }
        *v17 = 0;
        v18 = (char *)malloc_type_malloc(a3 + 1, 0x686005C4uLL);
        v14 = v18;
        if (v18)
        {
          memset(v18, 32, a3);
          v14[a3] = 0;
          do
          {
            v19 = v26;
            if (v12 == v27)
            {
              v20 = v13;
            }
            else
            {
              v19 = a3;
              v20 = v14;
            }
            v21 = a4 - v19;
            if (a4 - v19 >= v15)
              v22 = v15;
            else
              v22 = a4 - v19;
            if (a4)
              v23 = v22;
            else
              v23 = v15;
            strlcpy(v11, v12, v23 + 1);
            v24 = strchr(v11, 10);
            if (!v24 && a4 && v21 < v15)
              v24 = strrchr(v11, 32);
            if (v24)
            {
              *v24 = 0;
              v23 = v24 - v11;
              v12 += v24 - v11 + 1;
            }
            fprintf(a1, "%s%s\n", v20, v11);
            v15 -= v23;
          }
          while (v15);
        }
        goto LABEL_39;
      }
    }
    else
    {
      v13 = 0;
    }
    v14 = 0;
  }
LABEL_39:
  free(v14);
  free(v13);
  free(v11);
  free(v27);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return _os_log_send_and_compose_impl();
}

uint64_t os_crash_set_reporter_port(host_priv_t a1, unsigned int a2, mach_port_t a3)
{
  exception_mask_t v6;
  host_priv_t v7;
  uint64_t special_port;
  mach_port_t port;

  if ((a2 & 8) != 0)
    v6 = (a2 << 11) & 0x1000 | (((a2 >> 2) & 1) << 11) | 0x2000;
  else
    v6 = (a2 << 11) & 0x1000 | ((a2 & 1) << 10) & 0xF7FF | (((a2 >> 2) & 1) << 11);
  port = 0;
  v7 = MEMORY[0x1DF0F1854]();
  special_port = host_get_special_port(v7, -1, 2, &port);
  if (!a2)
    return 0;
  if (MEMORY[0x1DF0F1854](special_port) == a1 || port == a1)
    return host_set_exception_ports(a1, v6, a3, -2147483645, 1);
  return task_set_exception_ports(a1, v6, a3, -2147483645, 1);
}

uint64_t os_crash_get_reporter_port_array(task_t a1, _OWORD *a2)
{
  host_priv_t v4;
  uint64_t special_port;
  uint64_t exception_ports;
  host_priv_t v7;
  uint64_t v8;
  uint64_t v10;
  unint64_t v11;
  ipc_space_t *v12;
  exception_mask_t v13;
  _DWORD *v14;
  mach_port_name_t v15;
  int v16;
  _DWORD *v17;
  mach_port_name_t v18;
  int v19;
  _DWORD *v20;
  mach_port_name_t v21;
  int v22;
  _DWORD *v23;
  mach_port_name_t v24;
  int v25;
  mach_port_t port[2];
  thread_state_flavor_t old_flavors[14];
  exception_behavior_t old_behaviors[14];
  exception_handler_t old_handlers[14];
  exception_mask_t masks[14];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  *(_QWORD *)port = 0;
  v4 = MEMORY[0x1DF0F1854]();
  special_port = host_get_special_port(v4, -1, 2, port);
  if (MEMORY[0x1DF0F1854](special_port) == a1 || port[0] == a1)
  {
    v7 = MEMORY[0x1DF0F1854]();
    exception_ports = host_get_exception_ports(v7, 0x3C00u, masks, &port[1], old_handlers, old_behaviors, old_flavors);
  }
  else
  {
    exception_ports = task_get_exception_ports(a1, 0x3C00u, masks, &port[1], old_handlers, old_behaviors, old_flavors);
  }
  v8 = exception_ports;
  if (!(_DWORD)exception_ports)
  {
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
    if (!port[1])
      return 0;
    v10 = 0;
    v11 = 0;
    v12 = (ipc_space_t *)MEMORY[0x1E0C883F0];
    do
    {
      v13 = masks[v11];
      if ((v13 & 0x400) != 0)
      {
        v17 = (_DWORD *)a2 + 2 * v10;
        v18 = old_handlers[v11];
        *v17 = 1;
        v17[1] = v18;
        if (mach_port_mod_refs(*v12, v18, 0, 1))
          v19 = -1;
        else
          v19 = v18;
        v17[1] = v19;
        ++v10;
        v13 = masks[v11];
        if ((v13 & 0x1000) == 0)
        {
LABEL_11:
          if ((v13 & 0x800) == 0)
            goto LABEL_12;
          goto LABEL_29;
        }
      }
      else if ((v13 & 0x1000) == 0)
      {
        goto LABEL_11;
      }
      v20 = (_DWORD *)a2 + 2 * v10;
      v21 = old_handlers[v11];
      *v20 = 2;
      v20[1] = v21;
      if (mach_port_mod_refs(*v12, v21, 0, 1))
        v22 = -1;
      else
        v22 = v21;
      v20[1] = v22;
      ++v10;
      v13 = masks[v11];
      if ((v13 & 0x800) == 0)
      {
LABEL_12:
        if ((v13 & 0x2000) == 0)
          goto LABEL_17;
LABEL_13:
        v14 = (_DWORD *)a2 + 2 * v10;
        v15 = old_handlers[v11];
        *v14 = 4;
        v14[1] = v15;
        if (mach_port_mod_refs(*v12, v15, 0, 1))
          v16 = -1;
        else
          v16 = v15;
        v14[1] = v16;
        ++v10;
        goto LABEL_17;
      }
LABEL_29:
      v23 = (_DWORD *)a2 + 2 * v10;
      v24 = old_handlers[v11];
      *v23 = 3;
      v23[1] = v24;
      if (mach_port_mod_refs(*v12, v24, 0, 1))
        v25 = -1;
      else
        v25 = v24;
      v23[1] = v25;
      ++v10;
      if ((masks[v11] & 0x2000) != 0)
        goto LABEL_13;
LABEL_17:
      v8 = mach_port_deallocate(*v12, old_handlers[v11]);
      if ((_DWORD)v8)
        os_assert_mach((int)"deallocate port", v8);
      ++v11;
    }
    while (v11 < port[1]);
  }
  return v8;
}

void os_crash_port_array_deallocate(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  ipc_space_t *v3;
  mach_port_name_t v4;
  kern_return_t v5;

  v1 = 0;
  v2 = a1 + 4;
  v3 = (ipc_space_t *)MEMORY[0x1E0C883F0];
  do
  {
    v4 = *(_DWORD *)(v2 + v1);
    if (v4 + 1 >= 2)
    {
      v5 = mach_port_deallocate(*v3, v4);
      if (v5)
        os_assert_mach((int)"deallocate port", v5);
    }
    v1 += 8;
  }
  while (v1 != 128);
}

uint64_t os_crash_spawnattr_set_reporter_port(posix_spawnattr_t *a1, unsigned int a2, mach_port_t a3)
{
  exception_mask_t v3;
  uint64_t result;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  v3 = (a2 << 11) & 0x1000 | (((a2 >> 2) & 1) << 11) | 0x2000;
  if ((a2 & 8) == 0)
    v3 = (a2 << 11) & 0x1000 | ((a2 & 1) << 10) & 0xF7FF | (((a2 >> 2) & 1) << 11);
  if (a3 - 1 > 0xFFFFFFFD)
    return 15;
  if (!a2)
    return 0;
  result = posix_spawnattr_setexceptionports_np(a1, v3, a3, -2147483645, 1);
  if ((_DWORD)result)
    os_crash_spawnattr_set_reporter_port_cold_1(&v5, v6);
  return result;
}

uint64_t __os_temporary_resource_shortage()
{
  sleep_NOCANCEL();
  return _os_avoid_tail_call();
}

uint64_t _print_preamble(FILE *a1, const char *a2, va_list a3)
{
  const char *v6;

  v6 = getprogname();
  fprintf(a1, "%s: ", v6);
  return vfprintf(a1, a2, a3);
}

char *OUTLINED_FUNCTION_0_3()
{
  int v0;

  return strerror_np(v0);
}

BOOL os_parse_boot_arg_from_buffer_int(const char *a1, char *a2, uint64_t *a3)
{
  char *v5;
  _BOOL8 v6;

  v5 = strdup(a1);
  v6 = _parse_boot_arg_int(v5, a2, a3);
  free(v5);
  return v6;
}

uint64_t os_parse_boot_arg_from_buffer_string(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v7;
  uint64_t v8;
  _QWORD v10[3];
  uint64_t v11;

  v7 = strdup(a1);
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a4;
  v11 = 0;
  _enum_boot_arg_values(v7, (uint64_t)v10, (uint64_t (*)(uint64_t, unsigned __int8 *, const char *, BOOL))_check_boot_arg_value);
  v8 = BYTE1(v11);
  free(v7);
  return v8;
}

BOOL os_boot_arg_string_to_int(const char *a1, uint64_t *a2)
{
  uint64_t v3;
  int v4;
  char *__endptr;

  __endptr = 0;
  v3 = strtoll(a1, &__endptr, 0);
  v4 = *__endptr;
  if (!*__endptr)
    *a2 = v3;
  return v4 == 0;
}

void os_enumerate_boot_args(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, const char *, BOOL))
{
  char *v4;
  size_t v5;
  char *v6;

  v6 = 0;
  sysctlbyname_get_data_np("kern.bootargs", &v6, &v5);
  v4 = v6;
  _enum_boot_arg_values(v6, a1, a2);
  free(v4);
}

void os_enumerate_boot_args_from_buffer(const char *a1, uint64_t a2, uint64_t (*a3)(uint64_t, unsigned __int8 *, const char *, BOOL))
{
  char *v5;

  v5 = strdup(a1);
  _enum_boot_arg_values(v5, a2, a3);
  free(v5);
}

void os_enumerate_boot_args_b(uint64_t a1)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  const char *v8;
  size_t v9;
  char *__s1;

  __s1 = 0;
  sysctlbyname_get_data_np("kern.bootargs", &__s1, &v9);
  v2 = __s1;
  v3 = strdup(__s1);
  __s1 = v3;
  do
  {
    v4 = strsep(&__s1, " \t");
    if (!v4)
      break;
    v5 = v4;
    v6 = strchr(v4, 61);
    v7 = *v5;
    if (v7 == 45)
    {
      v8 = 0;
    }
    else if (v6)
    {
      *v6 = 0;
      v8 = v6 + 1;
    }
    else
    {
      v8 = "1";
    }
  }
  while (((*(uint64_t (**)(uint64_t, char *, const char *, BOOL))(a1 + 16))(a1, v5, v8, v7 == 45) & 1) != 0);
  free(v3);
  free(v2);
}

void os_enumerate_boot_args_from_buffer_b(const char *a1, uint64_t a2)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  const char *v8;
  char *__stringp;

  v3 = strdup(a1);
  __stringp = v3;
  do
  {
    v4 = strsep(&__stringp, " \t");
    if (!v4)
      break;
    v5 = v4;
    v6 = strchr(v4, 61);
    v7 = *v5;
    if (v7 == 45)
    {
      v8 = 0;
    }
    else if (v6)
    {
      *v6 = 0;
      v8 = v6 + 1;
    }
    else
    {
      v8 = "1";
    }
  }
  while (((*(uint64_t (**)(uint64_t, char *, const char *, BOOL))(a2 + 16))(a2, v5, v8, v7 == 45) & 1) != 0);
  free(v3);
}

BOOL _dirstat_fileid_set_add(char **a1, char *a2)
{
  size_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *i;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char **v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char **v17;
  uint64_t v18;

  v4 = (size_t)a1[2];
  if ((unint64_t)a1[3] > 10 * v4 && !*((_BYTE *)a1 + 32))
  {
    v4 *= 2;
    v5 = (char *)malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
    if (v5)
      goto LABEL_4;
    v13 = (char **)a1[1];
    if (!v13)
      goto LABEL_16;
    do
    {
      a1[1] = *v13;
      free(v13);
      v13 = (char **)a1[1];
    }
    while (v13);
    v5 = (char *)malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
    if (v5)
    {
LABEL_4:
      v6 = a1[2];
      v7 = *a1;
      if (v6)
      {
        for (i = 0; i != v6; ++i)
        {
          v9 = &v7[8 * (_QWORD)i];
          v10 = *(_QWORD **)v9;
          if (*(_QWORD *)v9)
          {
            v11 = (int)((unint64_t)a2 % v4);
            do
            {
              *(_QWORD *)v9 = *v10;
              v12 = *(_QWORD *)&v5[8 * v11];
              if (v12)
              {
                *(_QWORD *)(v12 + 8) = v10;
                v12 = *(_QWORD *)&v5[8 * v11];
              }
              *v10 = v12;
              v10[1] = 0;
              *(_QWORD *)&v5[8 * v11] = v10;
              v7 = *a1;
              v9 = &(*a1)[8 * (_QWORD)i];
              v10 = *(_QWORD **)v9;
            }
            while (*(_QWORD *)v9);
          }
        }
      }
      free(v7);
      *a1 = v5;
      a1[2] = (char *)v4;
    }
    else
    {
LABEL_16:
      *((_BYTE *)a1 + 32) = 1;
      v4 = (size_t)a1[2];
    }
  }
  v14 = *a1;
  v15 = (int)((unint64_t)a2 % v4);
  v16 = &(*a1)[(uint64_t)(((unint64_t)a2 % v4) << 32) >> 29];
  while (1)
  {
    v16 = *(char **)v16;
    if (!v16)
      break;
    if (*((char **)v16 + 2) == a2)
      return v16 != 0;
  }
  if (!*((_BYTE *)a1 + 32))
  {
    v17 = (char **)a1[1];
    if (v17)
    {
      a1[1] = *v17;
    }
    else
    {
      v17 = (char **)malloc_type_malloc(0x18uLL, 0x102004062D53EE8uLL);
      if (!v17)
      {
        *((_BYTE *)a1 + 32) = 1;
        return v16 != 0;
      }
      v14 = *a1;
    }
    v17[2] = a2;
    ++a1[3];
    *v17 = *(char **)&v14[8 * v15];
    v17[1] = 0;
    v18 = *(_QWORD *)&v14[8 * v15];
    if (v18)
      *(_QWORD *)(v18 + 8) = v17;
    *(_QWORD *)&v14[8 * v15] = v17;
  }
  return v16 != 0;
}

uint64_t sysexit_np(int a1)
{
  unsigned int *v1;
  uint64_t v2;
  char *v3;
  char *v4;

  v1 = (unsigned int *)&_negative_one;
  v2 = (a1 - 200);
  v3 = (char *)&unk_1EA95F820;
  if (a1 <= 0x6A)
    v3 = (char *)&_posix_errors + 32 * a1;
  if (v2 <= 0x16)
    v4 = (char *)&_darwin_errors + 32 * v2;
  else
    v4 = v3;
  if (a1 >= 0)
    v1 = (unsigned int *)v4;
  return v1[1];
}

char *os_flagset_copy_string(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  char *v10;
  unint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *result;
  uint64_t v19;
  char __s1[6];
  __int16 v21;
  _OWORD v22[5];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  bzero(&v21, 0x3FAuLL);
  qmemcpy(__s1, "[none]", sizeof(__s1));
  if (a1)
  {
    v9 = (uint64_t *)(a1 + 8);
    v10 = __s1;
    v11 = -1;
    v12 = 1024;
    do
    {
      v13 = *(v9 - 1);
      if (!v13)
        break;
      if ((v13 & a2) != 0)
      {
        v14 = *v9;
        v15 = __s1;
        if (v10 != __s1)
        {
          v16 = zsnprintf_np(v10, v12, "%s", v4, v5, v6, v7, v8, (char)"|");
          v15 = &v10[v16];
          v12 -= v16;
        }
        v17 = zsnprintf_np(v15, v12, "%s", v4, v5, v6, v7, v8, v14);
        v10 = &v15[v17];
        v12 -= v17;
      }
      v9 += 2;
      ++v11;
    }
    while (v11 < 0x3F);
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = strdup(__s1);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = strdup(__s1);
    if (!result)
      os_flagset_copy_string_cold_1(__s1, &v19, v22);
  }
  return result;
}

char *os_mach_msg_copy_description(unsigned int *a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  unsigned int v9;
  char *v10;
  char *v11;
  int v13;
  char *v14;
  int v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C874D8];
  v2 = *a1;
  v3 = (v2 >> 8) & 0x1F;
  v4 = v2 & 0x1F;
  v5 = (v2 >> 16) & 0x1F;
  if ((v3 - 27) >= 0xFFFFFFF5)
    v6 = (const char *)_mach_port_dispositions[2 * v3 + 1];
  else
    v6 = "[invalid]";
  if ((v4 - 27) >= 0xFFFFFFF5)
    v7 = (const char *)_mach_port_dispositions[2 * v4 + 1];
  else
    v7 = "[invalid]";
  if ((v5 - 27) >= 0xFFFFFFF5)
    v8 = (const char *)_mach_port_dispositions[2 * v5 + 1];
  else
    v8 = "[invalid]";
  v14 = 0;
  if ((v2 & 0x80000000) != 0)
    v9 = a1[6];
  else
    v9 = 0;
  v10 = os_flagset_copy_string((uint64_t)&_mach_msgh_bits, v2);
  if (asprintf(&v14, "id = %#x, size = %u, bits = %s, local disp = %s, local port = %#x, remote disp = %s, remote port = %#x, voucher disp = %s, voucher port = %#x, out-of-line descriptor cnt = %u", a1[5], a1[1], v10, v6, a1[3], v7, a1[2], v8, a1[4], v9) == -1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_10();
    v13 = *__error();
    v15 = 67109120;
    v16 = v13;
    OUTLINED_FUNCTION_1();
    _os_crash_msg();
    __break(1u);
  }
  v11 = v14;
  free(v10);
  return v11;
}

char *os_mach_msg_trailer_copy_description(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  char *result;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  char v30;
  int *v31;
  char *v32;
  int v33;
  size_t v34;
  unsigned int v35;
  int *v36;
  char *v37;
  unsigned int v38;
  int *v39;
  char *v40;
  int v41;
  unsigned int v42;
  int *v43;
  char *v44;
  int v45;
  unsigned int v46;
  int *v47;
  char *v48;
  int v49;
  int v50;
  unsigned int v51;
  int *v52;
  char *v53;
  int v54;
  unsigned int v55;
  int *v56;
  char *v57;
  int v58;
  char *v59;
  char __str[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[22];
  __int16 v66;
  char *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C874D8];
  v59 = 0;
  v2 = a1[1];
  if (!*a1)
  {
    if (v2 >= 8)
    {
      v6 = snprintf(__str, 0x200uLL, "format = %u, size = %u", 0, v2);
      if ((v6 & 0x80000000) != 0)
      {
        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_10();
        if (v30)
          v8 = v29;
        else
          v8 = v29 + 1;
        v31 = __error();
        v32 = OUTLINED_FUNCTION_12(v31);
        OUTLINED_FUNCTION_4((uint64_t)v32, 4.8149e-34);
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_5();
        __break(1u);
      }
      else
      {
        v8 = v6;
        if (v6 < 0x201)
        {
          if (a1[1] >= 0xCu)
          {
            v9 = &__str[v6];
            v10 = 512 - v6;
            v11 = OUTLINED_FUNCTION_16(v9, v7, ", seqno = %u");
            if ((v11 & 0x80000000) != 0)
            {
LABEL_37:
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_3();
              OUTLINED_FUNCTION_10();
              if (v30)
                v10 = v38;
              else
                v10 = v38 + 1;
              v39 = __error();
              v40 = OUTLINED_FUNCTION_12(v39);
              OUTLINED_FUNCTION_4((uint64_t)v40, 4.8149e-34);
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_5();
              __break(1u);
              goto LABEL_41;
            }
            v1 = v11;
            if (v10 < v11)
            {
LABEL_41:
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_3();
              OUTLINED_FUNCTION_10();
              *(_DWORD *)v65 = v41;
              *(_DWORD *)&v65[4] = v1;
              *(_WORD *)&v65[8] = 2048;
              *(_QWORD *)&v65[10] = v10;
              OUTLINED_FUNCTION_6();
              OUTLINED_FUNCTION_1();
              OUTLINED_FUNCTION_5();
              __break(1u);
              goto LABEL_42;
            }
            if (a1[1] >= 0x14u)
            {
              v13 = &v9[v11];
              v14 = v10 - v11;
              v15 = OUTLINED_FUNCTION_16(v13, v12, ", security.uid = %u, security.gid = %u");
              if ((v15 & 0x80000000) != 0)
              {
LABEL_42:
                OUTLINED_FUNCTION_2();
                OUTLINED_FUNCTION_3();
                OUTLINED_FUNCTION_10();
                if (v30)
                  v14 = v42;
                else
                  v14 = v42 + 1;
                v43 = __error();
                v44 = OUTLINED_FUNCTION_12(v43);
                OUTLINED_FUNCTION_4((uint64_t)v44, 4.8149e-34);
                OUTLINED_FUNCTION_0();
                OUTLINED_FUNCTION_5();
                __break(1u);
                goto LABEL_46;
              }
              v1 = v15;
              if (v14 < v15)
              {
LABEL_46:
                OUTLINED_FUNCTION_2();
                OUTLINED_FUNCTION_3();
                OUTLINED_FUNCTION_10();
                *(_DWORD *)v65 = v45;
                *(_DWORD *)&v65[4] = v1;
                *(_WORD *)&v65[8] = 2048;
                *(_QWORD *)&v65[10] = v14;
                OUTLINED_FUNCTION_6();
                OUTLINED_FUNCTION_1();
                OUTLINED_FUNCTION_5();
                __break(1u);
                goto LABEL_47;
              }
              if (a1[1] >= 0x34u)
              {
                v17 = &v13[v15];
                v18 = v14 - v15;
                v19 = OUTLINED_FUNCTION_16(v17, v16, ", audit.auid = %u, audit.euid = %u, audit.egid = %u, audit.ruid = %u, audit.rgid = %u, audit.pid = %u, audit.asid = %u, audit.pidvers = %u");
                if ((v19 & 0x80000000) != 0)
                {
LABEL_47:
                  OUTLINED_FUNCTION_2();
                  OUTLINED_FUNCTION_3();
                  OUTLINED_FUNCTION_10();
                  if (v30)
                    v18 = v46;
                  else
                    v18 = v46 + 1;
                  v47 = __error();
                  v48 = OUTLINED_FUNCTION_12(v47);
                  OUTLINED_FUNCTION_4((uint64_t)v48, 4.8149e-34);
                  OUTLINED_FUNCTION_0();
                  OUTLINED_FUNCTION_5();
                  __break(1u);
                  goto LABEL_51;
                }
                if (v18 < v19)
                {
LABEL_51:
                  OUTLINED_FUNCTION_2();
                  LODWORD(v17) = v49;
                  OUTLINED_FUNCTION_3();
                  OUTLINED_FUNCTION_10();
                  *(_DWORD *)v65 = v50;
                  *(_DWORD *)&v65[4] = (_DWORD)v17;
                  *(_WORD *)&v65[8] = 2048;
                  *(_QWORD *)&v65[10] = v18;
                  OUTLINED_FUNCTION_6();
                  OUTLINED_FUNCTION_1();
                  OUTLINED_FUNCTION_5();
                  __break(1u);
                  goto LABEL_52;
                }
                if (a1[1] >= 0x3Cu)
                {
                  v21 = &v17[v19];
                  v22 = v18 - v19;
                  v23 = OUTLINED_FUNCTION_16(v21, v20, ", context = %#llx");
                  if ((v23 & 0x80000000) != 0)
                  {
LABEL_52:
                    OUTLINED_FUNCTION_2();
                    OUTLINED_FUNCTION_3();
                    OUTLINED_FUNCTION_10();
                    if (v30)
                      v22 = v51;
                    else
                      v22 = v51 + 1;
                    v52 = __error();
                    v53 = OUTLINED_FUNCTION_12(v52);
                    OUTLINED_FUNCTION_4((uint64_t)v53, 4.8149e-34);
                    OUTLINED_FUNCTION_0();
                    OUTLINED_FUNCTION_5();
                    __break(1u);
                    goto LABEL_56;
                  }
                  LODWORD(v17) = v23;
                  if (v22 < v23)
                  {
LABEL_56:
                    OUTLINED_FUNCTION_2();
                    OUTLINED_FUNCTION_3();
                    OUTLINED_FUNCTION_10();
                    *(_DWORD *)v65 = v54;
                    *(_DWORD *)&v65[4] = (_DWORD)v17;
                    *(_WORD *)&v65[8] = 2048;
                    *(_QWORD *)&v65[10] = v22;
                    OUTLINED_FUNCTION_6();
                    OUTLINED_FUNCTION_1();
                    OUTLINED_FUNCTION_5();
                    __break(1u);
                    goto LABEL_57;
                  }
                  if (a1[1] >= 0x44u)
                  {
                    v25 = v22 - v23;
                    v26 = OUTLINED_FUNCTION_16(&v21[v23], v24, ", labels.sender = %#x");
                    if ((v26 & 0x80000000) != 0)
                    {
LABEL_57:
                      OUTLINED_FUNCTION_2();
                      v27 = MEMORY[0x1E0C88E98];
                      OUTLINED_FUNCTION_3();
                      OUTLINED_FUNCTION_10();
                      if (v30)
                        v25 = v55;
                      else
                        v25 = v55 + 1;
                      v56 = __error();
                      v57 = OUTLINED_FUNCTION_12(v56);
                      OUTLINED_FUNCTION_4((uint64_t)v57, 4.8149e-34);
                      OUTLINED_FUNCTION_0();
                      OUTLINED_FUNCTION_5();
                      __break(1u);
                      goto LABEL_61;
                    }
                    v27 = v26;
                    if (v25 < v26)
                    {
LABEL_61:
                      OUTLINED_FUNCTION_2();
                      OUTLINED_FUNCTION_7(MEMORY[0x1E0C88E98]);
                      OUTLINED_FUNCTION_10();
                      *(_DWORD *)v65 = v58;
                      *(_DWORD *)&v65[4] = v27;
                      *(_WORD *)&v65[8] = 2048;
                      *(_QWORD *)&v65[10] = v25;
                      OUTLINED_FUNCTION_6();
                      OUTLINED_FUNCTION_8();
                      result = (char *)OUTLINED_FUNCTION_5();
                      __break(1u);
                      return result;
                    }
                  }
                }
              }
            }
          }
          goto LABEL_22;
        }
      }
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_10();
      *(_DWORD *)v65 = v33;
      *(_DWORD *)&v65[4] = v8;
      *(_WORD *)&v65[8] = 2048;
      *(_QWORD *)&v65[10] = 512;
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_5();
      __break(1u);
LABEL_33:
      v34 = strlen(__str);
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_7(MEMORY[0x1E0C88E98]);
      OUTLINED_FUNCTION_10();
      if (v30)
        v1 = v35;
      else
        v1 = v35 + 1;
      v36 = __error();
      v37 = OUTLINED_FUNCTION_12(v36);
      *(_DWORD *)v65 = 136315650;
      *(_QWORD *)&v65[4] = "known-constant allocation";
      *(_WORD *)&v65[12] = 2048;
      *(_QWORD *)&v65[14] = v34;
      v66 = 2080;
      v67 = v37;
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_5();
      __break(1u);
      goto LABEL_37;
    }
LABEL_22:
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        result = strdup(__str);
        if (result)
          break;
        __os_temporary_resource_shortage();
      }
      return result;
    }
    result = strdup(__str);
    if (result)
      return result;
    goto LABEL_33;
  }
  v3 = asprintf(&v59, "type = %u, size = %u", *a1, v2);
  if (v3)
  {
    v28 = v3;
    *(_QWORD *)v65 = 0;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    *(_OWORD *)__str = 0u;
    OUTLINED_FUNCTION_7(MEMORY[0x1E0C88E98]);
    OUTLINED_FUNCTION_10();
    v68 = 134217984;
    v69 = v28;
    OUTLINED_FUNCTION_8();
    _os_crash_msg();
    __break(1u);
  }
  return v59;
}

char *os_mach_port_copy_description(uint64_t name)
{
  uint64_t v1;
  char *v2;
  int *v3;
  char *v4;
  char *v5;
  unint64_t v6;
  ipc_space_read_t *v7;
  kern_return_t v8;
  int attributes;
  char *v10;
  unsigned int v11;
  char v12;
  int *v13;
  unsigned int v14;
  int *v15;
  uint64_t v16;
  char *result;
  int *v18;
  int *v19;
  int *v20;
  int *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  __int128 v28;
  uint64_t v29;
  mach_port_type_t ptype[2];
  _BYTE v31[12];
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C874D8];
  v29 = 0;
  *(_QWORD *)ptype = 0;
  *(_OWORD *)port_info_out = 0u;
  v28 = 0u;
  port_info_outCnt = 10;
  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  if ((_DWORD)name != -1)
  {
    v1 = name;
    if (!(_DWORD)name)
    {
      v2 = strdup("null");
      if (v2)
      {
LABEL_6:
        v4 = v2;
        v5 = 0;
        v6 = 0;
LABEL_36:
        free(v5);
        free(v23);
        free((void *)v6);
        free(v24);
        return v4;
      }
      v33 = 0;
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_10();
      v3 = __error();
      OUTLINED_FUNCTION_12(v3);
      *(_DWORD *)v31 = 136315650;
      *(_QWORD *)&v31[4] = "known-constant allocation";
      v32 = 2048;
      OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_14();
      __break(1u);
      goto LABEL_5;
    }
    v7 = (ipc_space_read_t *)MEMORY[0x1E0C883F0];
    v8 = mach_port_type(*MEMORY[0x1E0C883F0], name, &ptype[1]);
    if (v8)
    {
      if (asprintf(&v24, "[%#x]", v8) == -1)
        goto LABEL_38;
      v6 = 0;
    }
    else
    {
      v24 = os_flagset_copy_string((uint64_t)&_mach_port_rights, ptype[1]);
      v6 = (unint64_t)os_flagset_copy_string((uint64_t)&_mach_port_requests, ptype[1]);
    }
    attributes = mach_port_get_attributes(*v7, v1, 2, port_info_out, &port_info_outCnt);
    if (attributes == 17)
    {
      if ((ptype[1] & 0x20000) == 0)
      {
        v10 = strdup("[none]");
        if (v10)
          goto LABEL_27;
        v33 = 0;
        OUTLINED_FUNCTION_11();
        v1 = MEMORY[0x1E0C88E98];
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_10();
        if (v12)
          v6 = v11;
        else
          v6 = v11 + 1;
        v13 = __error();
        OUTLINED_FUNCTION_12(v13);
        *(_DWORD *)v31 = 136315650;
        *(_QWORD *)&v31[4] = "known-constant allocation";
        v32 = 2048;
        OUTLINED_FUNCTION_9();
        OUTLINED_FUNCTION_0();
        attributes = OUTLINED_FUNCTION_14();
        __break(1u);
      }
    }
    else if (!attributes)
    {
      if (HIDWORD(v29))
      {
        v10 = os_flagset_copy_string((uint64_t)&_mach_port_status, HIDWORD(v29));
LABEL_27:
        v23 = v10;
        goto LABEL_28;
      }
LABEL_26:
      v10 = strdup("[none]");
      if (!v10)
        goto LABEL_40;
      goto LABEL_27;
    }
    if (asprintf(&v23, "[%#x]", attributes) != -1)
    {
LABEL_28:
      if ((ptype[1] & 0x10000) != 0)
        v16 = 0;
      else
        v16 = (ptype[1] & 0x100000) >> 18;
      if (MEMORY[0x1DF0F1878](*v7, v1, v16, ptype))
        asprintf(&v22, ", %s urefs = [%#x]");
      else
        asprintf(&v22, ", %s urefs = %u");
      if (asprintf(&v25, "name = %#x, rights = %s, requests = %s, status = %s%s", v1, v24, (const char *)v6, v23, v22) != -1)
      {
        v4 = v25;
        v5 = v22;
        goto LABEL_36;
      }
      *(_QWORD *)v31 = 0;
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_10();
      v18 = __error();
      OUTLINED_FUNCTION_13(*v18, 1.5047e-36);
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_17();
      __break(1u);
LABEL_38:
      *(_QWORD *)v31 = 0;
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_10();
      v19 = __error();
      OUTLINED_FUNCTION_13(*v19, 1.5047e-36);
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_17();
      __break(1u);
    }
    *(_QWORD *)v31 = 0;
    OUTLINED_FUNCTION_11();
    v1 = MEMORY[0x1E0C88E98];
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_10();
    if (v12)
      v6 = v14;
    else
      v6 = v14 + 1;
    v15 = __error();
    OUTLINED_FUNCTION_13(*v15, 1.5047e-36);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_17();
    __break(1u);
    goto LABEL_26;
  }
LABEL_5:
  v2 = strdup("dead-name");
  if (v2)
    goto LABEL_6;
  v33 = 0;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10();
  v20 = __error();
  OUTLINED_FUNCTION_12(v20);
  *(_DWORD *)v31 = 136315650;
  *(_QWORD *)&v31[4] = "known-constant allocation";
  v32 = 2048;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_14();
  __break(1u);
LABEL_40:
  v33 = 0;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10();
  v21 = __error();
  OUTLINED_FUNCTION_12(v21);
  *(_DWORD *)v31 = 136315650;
  *(_QWORD *)&v31[4] = "known-constant allocation";
  v32 = 2048;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0();
  result = (char *)OUTLINED_FUNCTION_14();
  __break(1u);
  return result;
}

void os_assert_mach(int a1, unsigned int r)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char __str[64];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (r)
  {
    v2 = r;
    if (r - 1100 > 6)
    {
      v5 = mach_error_string(r & 0xFFFFC1FF);
      v3 = strcmp(v5, "unknown error code");
      if (!(_DWORD)v3)
        v3 = snprintf(__str, 0x40uLL, "[%#x|%#x|%#x]", v2 >> 26, (v2 >> 14) & 0xFFF, v2 & 0x1FF);
      if (v2 + 309 >= 0xA)
        goto LABEL_9;
    }
    else
    {
      v3 = (uint64_t)bootstrap_strerror(r);
    }
    OUTLINED_FUNCTION_20(v3, v4, "%d");
    do
    {
      OUTLINED_FUNCTION_18();
      LOWORD(v2) = MEMORY[0x1E0C88E98];
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_1();
      v3 = OUTLINED_FUNCTION_19();
      __break(1u);
LABEL_9:
      OUTLINED_FUNCTION_20(v3, v4, "%#x");
    }
    while (!os_flagset_copy_string((uint64_t)&_mach_special_bits, v2 & 0x3E00));
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_7(MEMORY[0x1E0C88E98]);
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_19();
    __break(1u);
  }
}

void _check_internal_release_type_cold_1()
{
  _os_crash();
  __break(1u);
}

void os_variant_init_4launchd_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_6(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_7(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_8(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_9(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_variant_init_4launchd_cold_10(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void _parse_disabled_status_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3_0();
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_6(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_7(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void ___initialize_status_block_invoke_cold_8(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void os_localtime_file_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void memdup2_np_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _os_subcommand_print_usage_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_1();
  __break(1u);
}

void dup_np_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  v2 = __error();
  symerror_np(*v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void dup_np_cold_2()
{
  _os_crash();
  __break(1u);
}

void dup_np_cold_3()
{
  _os_crash();
  __break(1u);
}

void claimfd_np_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  __error();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void close_drop_np_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  __error();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0();
  __break(1u);
}

void vwfprintf_np_cold_1()
{
  _os_crash();
  __break(1u);
}

void vwfprintf_np_cold_2()
{
  _os_crash();
  __break(1u);
}

void vwfprintf_np_cold_3()
{
  _os_crash();
  __break(1u);
}

void os_crash_spawnattr_set_reporter_port_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void err_np(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  verr_np(a1, a2, &a9);
}

void verr_np(int a1, const char *a2, va_list a3)
{
  FILE *v4;
  char *v5;
  int v6;

  v4 = (FILE *)MEMORY[0x1E0C874E0];
  _print_preamble((FILE *)*MEMORY[0x1E0C874E0], a2, a3);
  v5 = OUTLINED_FUNCTION_0_3();
  fprintf(v4, ": %s\n", v5);
  v6 = sysexit_np(a1);
  exit(v6);
}

void errc_np(int a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  verrc_np(a1, a2, a3, &a9);
}

void verrc_np(int a1, int a2, const char *a3, va_list a4)
{
  FILE **v6;
  FILE *v7;
  char *v8;

  v6 = (FILE **)MEMORY[0x1E0C874E0];
  _print_preamble((FILE *)*MEMORY[0x1E0C874E0], a3, a4);
  v7 = *v6;
  v8 = strerror_np(a2);
  fprintf(v7, ": %s\n", v8);
  exit(a1);
}

uint64_t warn_np(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return vwarn_np(a1, a2, &a9);
}

uint64_t vwarn_np(uint64_t a1, const char *a2, va_list a3)
{
  FILE *v3;
  char *v4;

  v3 = (FILE *)MEMORY[0x1E0C874E0];
  _print_preamble((FILE *)*MEMORY[0x1E0C874E0], a2, a3);
  v4 = OUTLINED_FUNCTION_0_3();
  return fprintf(v3, ": %s\n", v4);
}

char *strerror_np(int a1)
{
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  char *v6;

  if (a1 <= 0x6A)
    return strerror(a1);
  v2 = &_negative_one;
  v3 = (a1 - 200);
  v4 = v3 >= 0x16;
  v5 = (_DWORD)v3 == 22;
  v6 = (char *)&_darwin_errors + 32 * v3;
  if (!v5 && v4)
    v6 = (char *)&unk_1EA95F820;
  if (a1 >= 0)
    v2 = v6;
  return (char *)v2[3];
}

uint64_t strexit_np(int a1)
{
  _QWORD *v1;
  char *v2;

  v1 = &_zero;
  if ((a1 - 79) >= 0xFFFFFFF1)
    v2 = (char *)&_sysexits + 32 * (a1 - 64);
  else
    v2 = (char *)&unk_1EA95F920;
  if (a1 == 173)
    v2 = (char *)&_badreceipt;
  if (a1)
    v1 = v2;
  return v1[3];
}

uint64_t symerror_np(int a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *v3;
  char *v4;

  v1 = &_negative_one;
  v2 = (a1 - 200);
  v3 = (char *)&unk_1EA95F820;
  if (a1 <= 0x6A)
    v3 = (char *)&_posix_errors + 32 * a1;
  if (v2 <= 0x16)
    v4 = (char *)&_darwin_errors + 32 * v2;
  else
    v4 = v3;
  if (a1 >= 0)
    v1 = v4;
  return v1[2];
}

uint64_t symexit_np(int a1)
{
  _QWORD *v1;
  char *v2;

  v1 = &_zero;
  if ((a1 - 79) >= 0xFFFFFFF1)
    v2 = (char *)&_sysexits + 32 * (a1 - 64);
  else
    v2 = (char *)&unk_1EA95F920;
  if (a1 == 173)
    v2 = (char *)&_badreceipt;
  if (a1)
    v1 = v2;
  return v1[2];
}

void os_flagset_copy_string_cold_1(const char *a1, _QWORD *a2, _OWORD *a3)
{
  int *v5;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
  v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
  _NSGetMachExecuteHeader();
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1E0C87478]();
}

__darwin_ct_rune_t ___toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C87480](*(_QWORD *)&a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1E0C86EF0]();
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1E0C872D0]();
}

uint64_t _os_avoid_tail_call()
{
  return MEMORY[0x1E0C87540]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C87550]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C88EC0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C87FC8](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C89048](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x1E0C87FE8]();
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1E0C88020]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

int dup(int a1)
{
  return MEMORY[0x1E0C88050](*(_QWORD *)&a1);
}

void exit(int a1)
{
  MEMORY[0x1E0C876B0](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C876C0](a1);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1E0C88098]();
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C876D8](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C876E0](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87730](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C87738](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C87740](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1E0C88140](*(_QWORD *)&a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C877C0]();
}

char *__cdecl getsectdatafromheader_64(const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  return (char *)MEMORY[0x1E0C873A8](mhp, segname, sectname, size);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C877C8](a1, a2);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x1E0C881D0]();
}

kern_return_t host_get_exception_ports(host_priv_t host_priv, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  return MEMORY[0x1E0C881F0](*(_QWORD *)&host_priv, *(_QWORD *)&exception_mask, masks, masksCnt, old_handlers, old_behaviors, old_flavors);
}

kern_return_t host_get_special_port(host_priv_t host_priv, int node, int which, mach_port_t *port)
{
  return MEMORY[0x1E0C88200](*(_QWORD *)&host_priv, *(_QWORD *)&node, *(_QWORD *)&which, port);
}

kern_return_t host_set_exception_ports(host_priv_t host_priv, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return MEMORY[0x1E0C88220](*(_QWORD *)&host_priv, *(_QWORD *)&exception_mask, *(_QWORD *)&new_port, *(_QWORD *)&behavior, *(_QWORD *)&new_flavor);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C88228](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C87800](*(_QWORD *)&a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C87810](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C882D8](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C88328]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1E0C88380](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1E0C88390](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, refs);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C883B8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C883D0](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C87840](__b, *(_QWORD *)&__c, __len);
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x1E0C88530]();
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x1E0C87870](__bufp, __sizep);
}

uint64_t openat_NOCANCEL()
{
  return MEMORY[0x1E0C88548]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

int posix_spawnattr_setexceptionports_np(posix_spawnattr_t *a1, exception_mask_t a2, mach_port_t a3, exception_behavior_t a4, thread_state_flavor_t a5)
{
  return MEMORY[0x1E0C885C8](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x1E0C88648]();
}

uint64_t sleep_NOCANCEL()
{
  return MEMORY[0x1E0C87948]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87988](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C879B0](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879D0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C879E0](a1, a2, a3);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87A18](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C87A20](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C87A30](__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A50](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A58](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C87A90](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C87A98](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1E0C87AA0](a1, a2, a3);
}

kern_return_t task_get_exception_ports(task_t task, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  return MEMORY[0x1E0C88768](*(_QWORD *)&task, *(_QWORD *)&exception_mask, masks, masksCnt, old_handlers, old_behaviors, old_flavors);
}

kern_return_t task_set_exception_ports(task_t task, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return MEMORY[0x1E0C88790](*(_QWORD *)&task, *(_QWORD *)&exception_mask, *(_QWORD *)&new_port, *(_QWORD *)&behavior, *(_QWORD *)&new_flavor);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B20](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B28](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C87B30](__str, __size, __format, a4);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C89158]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C891E8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}

