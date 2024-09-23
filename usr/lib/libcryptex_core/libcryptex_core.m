void _cryptex_core_dealloc(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  cryptex_asset_array_destroy((uint64_t)(a1 + 8));
  v2 = (void *)a1[20];
  if (v2)
    os_release(v2);
  v3 = (void *)a1[21];
  if (v3)
    os_release(v3);
  v4 = (void *)a1[27];
  if (v4)
    os_release(v4);
  v5 = (void *)a1[26];
  if (v5)
    xpc_release(v5);
  object_proto_destroy((uint64_t)(a1 + 2));
}

void _cryptex_core_cx1_properties_dealloc(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 56) = 0;
  }
  object_proto_destroy(a1 + 16);
}

_QWORD *cryptex_core_create(uint64_t a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)_cryptex_core_alloc();
  v2[5] = a1;
  v2[22] = &_cryptex_asset_type_pdmg;
  v2[23] = &_cryptex_asset_type_c411;
  v2[24] = &_cryptex_asset_type_ltrs;
  v2[25] = &_cryptex_asset_type_roothash;
  v2[26] = 0;
  object_proto_init((uint64_t)(v2 + 2), (int)"com.apple.security.libcryptex.core", "cryptex.core");
  return v2;
}

int *cryptex_core_set_asset(int *result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  int *v5;
  _QWORD *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint8_t buf[88];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = *(_QWORD **)(*a2 + 8);
  if (*(_QWORD *)&result[2 * v3[3] + 16])
    cryptex_core_set_asset_cold_1(&v11, buf);
  v5 = result;
  if (v3 == (_QWORD *)&_cryptex_asset_type_cpxd)
  {
    v7 = (const char *)*((_QWORD *)result + 2);
    *(_QWORD *)(v2 + 24) = v7;
    *((_QWORD *)result + 22) = &_cryptex_asset_type_cpxd;
    v8 = *__error();
    v9 = *((_QWORD *)v5 + 4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = "[anonymous]";
      if (v7)
        v10 = v7;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_211A95000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: core has research dmg asset", buf, 0xCu);
    }
    result = __error();
    *result = v8;
    v3 = *(_QWORD **)(v2 + 8);
  }
  else
  {
    v6 = &_cryptex_asset_type_gdmg;
    if (v3 == (_QWORD *)&_cryptex_asset_type_gdmg)
    {
      *(_QWORD *)(v2 + 24) = *((_QWORD *)result + 2);
      *((_QWORD *)result + 22) = &_cryptex_asset_type_gdmg;
LABEL_16:
      v3 = v6;
      goto LABEL_17;
    }
  }
  v6 = &_cryptex_asset_type_ginf;
  if (v3 == (_QWORD *)&_cryptex_asset_type_ginf)
  {
    *((_QWORD *)v5 + 23) = &_cryptex_asset_type_ginf;
    goto LABEL_16;
  }
  v6 = &_cryptex_asset_type_gtcd;
  if (v3 == (_QWORD *)&_cryptex_asset_type_gtcd)
  {
    *((_QWORD *)v5 + 24) = &_cryptex_asset_type_gtcd;
    goto LABEL_16;
  }
  v6 = &_cryptex_asset_type_gtgv;
  if (v3 == (_QWORD *)&_cryptex_asset_type_gtgv)
  {
    *((_QWORD *)v5 + 25) = &_cryptex_asset_type_gtgv;
    goto LABEL_16;
  }
LABEL_17:
  *(_QWORD *)&v5[2 * v3[3] + 16] = v2;
  *a2 = 0;
  return result;
}

uint64_t cryptex_core_set_assets_from_directory(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _UNKNOWN **v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  _UNKNOWN **v12;
  uint64_t v13;
  const char *v14;
  int v15;
  NSObject *v16;
  unint64_t v17;
  const char *v18;
  int v19;
  _QWORD *v20;
  _QWORD *v21;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  __n128 *v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  unsigned __int32 v35;
  unsigned __int32 v36;
  const char *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  void *v41;
  const char *v42;
  int v43;
  NSObject *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  unsigned __int32 file;
  void *object;
  _QWORD *v52;
  int v53;
  _BYTE v54[12];
  __int16 v55;
  unsigned __int32 v56;
  __n128 buf[3];
  uint64_t v58;
  uint64_t v59;

  v4 = 0;
  v5 = 0;
  file = 2;
  v6 = &cryptex_asset_types;
  v59 = *MEMORY[0x24BDAC8D0];
  v7 = &_cryptex_asset_type_root;
  do
  {
    v8 = (uint64_t)v6[v4];
    v53 = -1;
    object = 0;
    if ((void *)v8 == v7)
    {
      v53 = dup_np();
      v52 = cryptex_asset_new((uint64_t)v7);
LABEL_13:
      cryptex_core_set_asset((int *)a1, (uint64_t *)&v52);
      file = 0;
      v19 = 0;
      goto LABEL_27;
    }
    v53 = openat(a2, *(const char **)(v8 + 40), 0);
    if ((v53 & 0x80000000) == 0)
      *__error() = 0;
    v9 = *__error();
    if (!v9)
    {
      ++v5;
      v20 = cryptex_asset_new(v8);
      v21 = v20;
      v52 = v20;
      if ((_UNKNOWN *)v8 == &_cryptex_asset_type_im4m)
      {
        v58 = 0;
        memset(buf, 0, sizeof(buf));
        file = _read_file(*((_DWORD *)v20 + 4), buf);
        if (!file)
        {
          v35 = signature_metadata_read_from_file(*((_DWORD *)v21 + 4), &object);
          if (v35)
          {
            v36 = v35;
            v37 = *(const char **)(a1 + 16);
            v38 = *__error();
            v39 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v54 = 136446466;
              v40 = "[anonymous]";
              if (v37)
                v40 = v37;
              *(_QWORD *)&v54[4] = v40;
              v55 = 1024;
              v56 = v36;
              _os_log_impl(&dword_211A95000, v39, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load metadata for Image4 manifest.: %{darwin.errno}d", v54, 0x12u);
            }
            *__error() = v38;
          }
          v41 = (void *)cryptex_signature_create(buf, 0, object);
          cryptex_core_attach_signature(a1, v41);
          if (v41)
            os_release(v41);
          goto LABEL_13;
        }
        v32 = *(const char **)(a1 + 16);
        v23 = *__error();
        v33 = *(NSObject **)(a1 + 32);
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        *(_DWORD *)v54 = 136446466;
        v34 = "[anonymous]";
        if (v32)
          v34 = v32;
        *(_QWORD *)&v54[4] = v34;
        v55 = 1024;
        v56 = file;
        v26 = (__n128 *)v54;
        v27 = v33;
        v28 = "%{public}s: failed to read im4m: %{darwin.errno}d";
      }
      else
      {
        if ((_UNKNOWN *)v8 != &_cryptex_asset_type_cx1p)
          goto LABEL_13;
        *(_QWORD *)v54 = 0;
        file = cryptex_core_cx1_read_from_file(*((_DWORD *)v20 + 4), (void **)v54);
        if (!file)
        {
          *(_QWORD *)(a1 + 216) = os_retain(*(void **)v54);
          goto LABEL_13;
        }
        v22 = *(const char **)(a1 + 16);
        v23 = *__error();
        v24 = *(NSObject **)(a1 + 32);
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        buf[0].n128_u32[0] = 136446466;
        v25 = "[anonymous]";
        if (v22)
          v25 = v22;
        *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v25;
        buf[0].n128_u16[6] = 1024;
        *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = file;
        v26 = buf;
        v27 = v24;
        v28 = "%{public}s: Failed to read Cryptex1 properties.: %{darwin.errno}d";
      }
      goto LABEL_25;
    }
    if (v9 != 2)
    {
      file = *__error();
      v29 = *(const char **)(a1 + 16);
      v23 = *__error();
      v30 = *(NSObject **)(a1 + 32);
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        *__error() = v23;
        v19 = 14;
        goto LABEL_27;
      }
      buf[0].n128_u32[0] = 136446466;
      v31 = "[anonymous]";
      if (v29)
        v31 = v29;
      *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v31;
      buf[0].n128_u16[6] = 1024;
      *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = file;
      v26 = buf;
      v27 = v30;
      v28 = "%{public}s: openat: %{darwin.errno}d";
LABEL_25:
      _os_log_impl(&dword_211A95000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)v26, 0x12u);
      goto LABEL_26;
    }
    v10 = a2;
    v11 = v7;
    v12 = v6;
    v13 = v5;
    v14 = *(const char **)(a1 + 16);
    v15 = *__error();
    v16 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_QWORD *)(v8 + 40);
      v18 = "[anonymous]";
      if (v14)
        v18 = v14;
      buf[0].n128_u32[0] = 136446466;
      *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v18;
      buf[0].n128_u16[6] = 2080;
      *(unint64_t *)((char *)&buf[0].n128_u64[1] + 6) = v17;
      _os_log_impl(&dword_211A95000, v16, OS_LOG_TYPE_DEBUG, "%{public}s: no asset of type: %s", (uint8_t *)buf, 0x16u);
    }
    *__error() = v15;
    v19 = 4;
    v5 = v13;
    v6 = v12;
    v7 = v11;
    a2 = v10;
LABEL_27:
    if (object)
      os_release(object);
    if (v53 != -1 && close(v53) == -1)
      cryptex_core_set_assets_from_directory_cold_1(v54, buf);
    if ((v19 | 4) != 4)
      return file;
    ++v4;
  }
  while (v4 != 12);
  if (v5)
  {
    if (!*(_QWORD *)(a1 + 8 * *(_QWORD *)(*(_QWORD *)(a1 + 176) + 24) + 64))
    {
      v42 = *(const char **)(a1 + 16);
      v43 = *__error();
      v44 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = "[anonymous]";
        if (v42)
          v45 = v42;
        buf[0].n128_u32[0] = 136446466;
        *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v45;
        buf[0].n128_u16[6] = 1024;
        *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = 2;
        v46 = "%{public}s: No image asset was loaded from directory.: %{darwin.errno}d";
        goto LABEL_59;
      }
      goto LABEL_60;
    }
  }
  else
  {
    v47 = *(const char **)(a1 + 16);
    v43 = *__error();
    v44 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v48 = "[anonymous]";
      if (v47)
        v48 = v47;
      buf[0].n128_u32[0] = 136446466;
      *(unint64_t *)((char *)buf[0].n128_u64 + 4) = (unint64_t)v48;
      buf[0].n128_u16[6] = 1024;
      *(unsigned __int32 *)((char *)&buf[0].n128_u32[3] + 2) = 2;
      v46 = "%{public}s: No cryptex assets were loaded from directory.: %{darwin.errno}d";
LABEL_59:
      _os_log_impl(&dword_211A95000, v44, OS_LOG_TYPE_ERROR, v46, (uint8_t *)buf, 0x12u);
    }
LABEL_60:
    *__error() = v43;
    return 2;
  }
  return file;
}

void *cryptex_core_attach_signature(uint64_t a1, void *object)
{
  void *v4;
  void *result;

  v4 = *(void **)(a1 + 160);
  if (v4)
    os_release(v4);
  result = os_retain(object);
  *(_QWORD *)(a1 + 160) = result;
  return result;
}

uint64_t cryptex_core_cx1_read_from_file(int a1, void **a2)
{
  uint64_t file;
  uint64_t v4;
  int v5;
  NSObject *v6;
  const char *v7;
  const __CFData *v9;
  const __CFData *v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  CFTypeID v13;
  const __CFDictionary *v14;
  const __CFNumber *Value;
  const __CFNumber *v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFBoolean *v23;
  const __CFBoolean *v24;
  const __CFBoolean *v25;
  const __CFBoolean *v26;
  int UInt32;
  int v28;
  char v29;
  char v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  int v36;
  _OWORD v37[3];
  uint64_t v38;
  CFErrorRef error;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  char v44[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[2];
  char buffer[16];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[31];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  error = 0;
  memset(v37, 0, sizeof(v37));
  v72 = 0u;
  memset(v73, 0, sizeof(v73));
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  *(_OWORD *)buffer = 0u;
  v57 = 0u;
  memset(v58, 0, 31);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  *(_OWORD *)v44 = 0u;
  file = _read_file(a1, v37);
  if ((_DWORD)file)
  {
    v4 = file;
    v5 = *__error();
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      *__error() = v5;
      buff_destroy(v37);
      return v4;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v4;
    v6 = MEMORY[0x24BDACB70];
    v7 = "Failed to read properties from file.: %{darwin.errno}d";
LABEL_4:
    _os_log_impl(&dword_211A95000, v6, OS_LOG_TYPE_ERROR, v7, buf, 8u);
    goto LABEL_5;
  }
  v9 = CFDataCreate(0, *(const UInt8 **)&v37[0], *((CFIndex *)&v37[0] + 1));
  if (!v9)
  {
    v5 = *__error();
    v4 = 12;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = 12;
    v6 = MEMORY[0x24BDACB70];
    v7 = "Failed to create data.: %{darwin.errno}d";
    goto LABEL_4;
  }
  v10 = v9;
  v11 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v9, 0, 0, &error);
  if (v11)
  {
    v12 = v11;
    v13 = CFGetTypeID(v11);
    if (v13 == CFDictionaryGetTypeID())
      v14 = v12;
    else
      v14 = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(v14, CFSTR("Cryptex1,NonceDomain"));
    if (Value)
    {
      v16 = Value;
      v17 = (const __CFNumber *)CFDictionaryGetValue(v14, CFSTR("Cryptex1,SubType"));
      if (v17)
      {
        v18 = v17;
        v19 = (const __CFString *)CFDictionaryGetValue(v14, CFSTR("Cryptex1,Version"));
        if (v19)
        {
          v20 = v19;
          v21 = (const __CFString *)CFDictionaryGetValue(v14, CFSTR("Cryptex1,PreauthVersion"));
          if (v21)
          {
            v22 = v21;
            v23 = (const __CFBoolean *)CFDictionaryGetValue(v14, CFSTR("MountedCryptex"));
            if (v23)
            {
              v24 = v23;
              v25 = (const __CFBoolean *)CFDictionaryGetValue(v14, CFSTR("Cryptex1,UseProductClass"));
              if (v25)
              {
                v26 = v25;
                CFStringGetCString(v20, buffer, 255, 0x8000100u);
                CFStringGetCString(v22, v44, 255, 0x8000100u);
                UInt32 = _CFNumberGetUInt32(v16);
                v28 = _CFNumberGetUInt32(v18);
                v29 = CFBooleanGetValue(v24) != 0;
                v30 = CFBooleanGetValue(v26) != 0;
                v31 = (void *)cryptex_core_cx1_properties_create(UInt32, v28, buffer, v44, v29, v30);
                if (v31)
                {
                  v32 = v31;
                  v4 = 0;
                  if (a2)
                    *a2 = os_retain(v31);
                }
                else
                {
                  v36 = *__error();
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v41) = 12;
                    _os_log_impl(&dword_211A95000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create property object.: %{darwin.errno}d", buf, 8u);
                  }
                  v32 = 0;
                  *__error() = v36;
                  v4 = 12;
                }
                goto LABEL_40;
              }
              v34 = *__error();
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "Cryptex1,UseProductClass";
                v42 = 1024;
                v43 = 22;
                v35 = MEMORY[0x24BDACB70];
                goto LABEL_38;
              }
LABEL_39:
              v32 = 0;
              *__error() = v34;
              v4 = 22;
LABEL_40:
              buff_destroy(v37);
              CFRelease(v12);
              CFRelease(v10);
              if (v32)
                os_release(v32);
              return v4;
            }
            v34 = *__error();
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_39;
            *(_DWORD *)buf = 136315394;
            v41 = "MountedCryptex";
            v42 = 1024;
            v43 = 22;
            v35 = MEMORY[0x24BDACB70];
          }
          else
          {
            v34 = *__error();
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_39;
            *(_DWORD *)buf = 136315394;
            v41 = "Cryptex1,PreauthVersion";
            v42 = 1024;
            v43 = 22;
            v35 = MEMORY[0x24BDACB70];
          }
        }
        else
        {
          v34 = *__error();
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_39;
          *(_DWORD *)buf = 136315394;
          v41 = "Cryptex1,Version";
          v42 = 1024;
          v43 = 22;
          v35 = MEMORY[0x24BDACB70];
        }
      }
      else
      {
        v34 = *__error();
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_39;
        *(_DWORD *)buf = 136315394;
        v41 = "Cryptex1,SubType";
        v42 = 1024;
        v43 = 22;
        v35 = MEMORY[0x24BDACB70];
      }
    }
    else
    {
      v34 = *__error();
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_DWORD *)buf = 136315394;
      v41 = "Cryptex1,NonceDomain";
      v42 = 1024;
      v43 = 22;
      v35 = MEMORY[0x24BDACB70];
    }
LABEL_38:
    _os_log_impl(&dword_211A95000, v35, OS_LOG_TYPE_ERROR, "Cryptex1 property plist is missing expected key: %s: %{darwin.errno}d", buf, 0x12u);
    goto LABEL_39;
  }
  v33 = *__error();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v41 = (const char *)error;
    v42 = 1024;
    v43 = 12;
    _os_log_impl(&dword_211A95000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create property list: %{public}@: %{darwin.errno}d", buf, 0x12u);
  }
  *__error() = v33;
  buff_destroy(v37);
  CFRelease(v10);
  return 12;
}

void *cryptex_core_set_cryptex1_properties(uint64_t a1, void *object)
{
  void *result;

  result = os_retain(object);
  *(_QWORD *)(a1 + 216) = result;
  return result;
}

uint64_t cryptex_core_get_image_asset(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8 * *(_QWORD *)(*(_QWORD *)(a1 + 176) + 24) + 64);
}

uint64_t cryptex_core_set_assets_from_fds(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  _BYTE *v8;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  _BOOL4 is_cryptex1;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  int v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  int v37;
  NSObject *v38;
  const char *v39;
  const char *v40;
  int v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE buf[12];
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = *(&cryptex_asset_types + a2);
  if ((*v8 & 0x20) != 0)
  {
    is_cryptex1 = cryptex_asset_type_is_cryptex1(*(&cryptex_asset_types + a2));
    v21 = &_cryptex_asset_type_ltrs;
    if (is_cryptex1)
      v21 = &_cryptex_asset_type_gtcd;
    v44 = (uint64_t)v21;
    v22 = &_cryptex_asset_type_c411;
    if (is_cryptex1)
      v22 = &_cryptex_asset_type_ginf;
    v46 = (uint64_t)v22;
    v23 = &_cryptex_asset_type_roothash;
    if (is_cryptex1)
      v23 = &_cryptex_asset_type_gtgv;
    v45 = (uint64_t)v23;
    if ((*a3 & 0x80000000) != 0)
    {
      v36 = *(const char **)(a1 + 16);
      v37 = *__error();
      v38 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = "[anonymous]";
        if (v36)
          v39 = v36;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v39;
        v48 = 1024;
        LODWORD(v49) = 9;
        _os_log_impl(&dword_211A95000, v38, OS_LOG_TYPE_ERROR, "%{public}s: FD for image is invalid: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v37;
      return 9;
    }
    else
    {
      if (!a4 || (*a4 & 0x80000000) != 0)
      {
        v24 = *(const char **)(a1 + 16);
        v25 = *__error();
        v26 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = "[anonymous]";
          if (v24)
            v27 = v24;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v27;
          _os_log_impl(&dword_211A95000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s: FD for ltrs is invalid. OK for no-code cryptexes.", buf, 0xCu);
        }
        *__error() = v25;
      }
      if (!a5 || (*a5 & 0x80000000) != 0)
      {
        v28 = *(const char **)(a1 + 16);
        v29 = *__error();
        v30 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = "[anonymous]";
          if (v28)
            v31 = v28;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v31;
          _os_log_impl(&dword_211A95000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s: FD for c411 is invalid. Will generate one", buf, 0xCu);
        }
        *__error() = v29;
      }
      if ((*a6 & 0x80000000) != 0)
      {
        v40 = *(const char **)(a1 + 16);
        v41 = *__error();
        v42 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = "[anonymous]";
          if (v40)
            v43 = v40;
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v43;
          v48 = 1024;
          LODWORD(v49) = 81;
          _os_log_impl(&dword_211A95000, v42, OS_LOG_TYPE_ERROR, "%{public}s: FD for im4m is invalid: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v41;
        return 81;
      }
      else
      {
        if (!a7 || (*a7 & 0x80000000) != 0)
        {
          v32 = *(const char **)(a1 + 16);
          v33 = *__error();
          v34 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = "[anonymous]";
            if (v32)
              v35 = v32;
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v35;
            _os_log_impl(&dword_211A95000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s: FD for volume hash is invalid. AuthAPFS will not be supported.", buf, 0xCu);
          }
          *__error() = v33;
        }
        *(_QWORD *)buf = cryptex_asset_new((uint64_t)v8);
        cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        if (a4 && (*a4 & 0x80000000) == 0)
        {
          *(_QWORD *)buf = cryptex_asset_new(v44);
          cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        }
        if (a7 && (*a7 & 0x80000000) == 0)
        {
          *(_QWORD *)buf = cryptex_asset_new(v45);
          cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        }
        if (a5 && (*a5 & 0x80000000) == 0)
        {
          *(_QWORD *)buf = cryptex_asset_new(v46);
          cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        }
        *(_QWORD *)buf = cryptex_asset_new((uint64_t)&_cryptex_asset_type_im4m);
        cryptex_core_set_asset((int *)a1, (uint64_t *)buf);
        return 0;
      }
    }
  }
  else
  {
    v10 = *(const char **)(a1 + 16);
    v11 = *__error();
    v12 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = "[anonymous]";
      *(_DWORD *)buf = 136446722;
      if (v10)
        v13 = v10;
      *(_QWORD *)&buf[4] = v13;
      v48 = 2048;
      v49 = a2;
      v50 = 1024;
      v51 = 22;
      _os_log_impl(&dword_211A95000, v12, OS_LOG_TYPE_ERROR, "%{public}s: cryptex type is not image: %lld: %{darwin.errno}d", buf, 0x1Cu);
    }
    *__error() = v11;
    return 22;
  }
}

uint64_t cryptex_core_get_asset(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 8 * *(_QWORD *)(a2 + 24) + 64);
}

uint64_t cryptex_core_get_info_asset(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8 * *(_QWORD *)(*(_QWORD *)(a1 + 184) + 24) + 64);
}

uint64_t cryptex_core_get_tc_asset(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8 * *(_QWORD *)(*(_QWORD *)(a1 + 192) + 24) + 64);
}

uint64_t cryptex_core_get_volumehash_asset(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8 * *(_QWORD *)(*(_QWORD *)(a1 + 200) + 24) + 64);
}

uint64_t cryptex_core_image_authapfs_enabled(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 64 + 8 * *(_QWORD *)(*(_QWORD *)(a1 + 200) + 24));
  LODWORD(result) = cryptex_asset_type_is_cryptex1(*(void **)(*(_QWORD *)(a1
                                                                        + 64
                                                                        + 8
                                                                        * *(_QWORD *)(*(_QWORD *)(a1 + 176) + 24))
                                                            + 8));
  if (v1)
    return result;
  else
    return 0;
}

uint64_t cryptex_core_pop_asset(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1 + 8 * *(_QWORD *)(a2 + 24);
  result = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;
  return result;
}

void *cryptex_core_attach_host(uint64_t a1, void *object)
{
  void *v4;
  void *result;

  v4 = *(void **)(a1 + 168);
  if (v4)
    os_release(v4);
  result = os_retain(object);
  *(_QWORD *)(a1 + 168) = result;
  return result;
}

char *cryptex_core_generate_identifier(uint64_t a1)
{
  const char *v1;
  uint32_t v2;
  const char *v3;
  char *v5;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v1 = *(const char **)(a1 + 16);
  v2 = arc4random();
  v3 = "anonymous";
  if (v1)
    v3 = v1;
  if (asprintf(&v5, "%s.%#x", v3, v2) < 0)
    cryptex_core_generate_identifier_cold_1(&v6, v7);
  return v5;
}

char *cryptex_core_generate_version()
{
  char *result;
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  result = strdup("0.0.1");
  if (!result)
    cryptex_core_generate_version_cold_1(&v1, v2);
  return result;
}

BOOL cryptex_core_name_is_system_cryptex(char *a1)
{
  return cryptex_system_cryptex_lookup_by_name(a1) != 0;
}

uint64_t cryptex_core_get_nonce_domain_handle(_QWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t result;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (cryptex_core_is_cryptex1(a1))
    {
      v4 = a1[27];
      if (v4)
      {
        result = 0;
        *a2 = *(_DWORD *)(v4 + 40);
      }
      else
      {
        v15 = (const char *)a1[2];
        v16 = *__error();
        v17 = a1[4];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = "[anonymous]";
          if (v15)
            v18 = v15;
          v19 = 136446466;
          v20 = v18;
          v21 = 1024;
          LODWORD(v22) = 2;
          _os_log_impl(&dword_211A95000, v17, OS_LOG_TYPE_ERROR, "%{public}s: No Cryptex1 properties available.: %{darwin.errno}d", (uint8_t *)&v19, 0x12u);
        }
        *__error() = v16;
        return 2;
      }
    }
    else
    {
      v10 = (const char *)a1[2];
      v11 = *__error();
      v12 = a1[4];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = "[anonymous]";
        if (v10)
          v13 = v10;
        v14 = *(_QWORD *)(a1[22] + 40);
        v19 = 136446722;
        v20 = v13;
        v21 = 2080;
        v22 = v14;
        v23 = 1024;
        v24 = 45;
        _os_log_impl(&dword_211A95000, v12, OS_LOG_TYPE_ERROR, "%{public}s: not supported image type: %s: %{darwin.errno}d", (uint8_t *)&v19, 0x1Cu);
      }
      *__error() = v11;
      return 45;
    }
  }
  else
  {
    v6 = (const char *)a1[2];
    v7 = *__error();
    v8 = a1[4];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = "[anonymous]";
      if (v6)
        v9 = v6;
      v19 = 136446466;
      v20 = v9;
      v21 = 1024;
      LODWORD(v22) = 22;
      _os_log_impl(&dword_211A95000, v8, OS_LOG_TYPE_ERROR, "%{public}s: Invalid input.: %{darwin.errno}d", (uint8_t *)&v19, 0x12u);
    }
    *__error() = v7;
    return 22;
  }
  return result;
}

BOOL cryptex_core_is_cryptex1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 is_cryptex1;
  _BOOL4 v6;
  BOOL v7;
  _BOOL4 v8;
  BOOL v9;
  _BOOL8 result;
  BOOL v11;

  v1 = a1[*(_QWORD *)(a1[22] + 24) + 8];
  v2 = a1[*(_QWORD *)(a1[23] + 24) + 8];
  v3 = a1[*(_QWORD *)(a1[24] + 24) + 8];
  v4 = a1[*(_QWORD *)(a1[25] + 24) + 8];
  if (v1)
    is_cryptex1 = cryptex_asset_type_is_cryptex1(*(void **)(v1 + 8));
  else
    is_cryptex1 = 1;
  if (v2)
    v6 = 0;
  else
    v6 = is_cryptex1;
  if (v2)
    v7 = !is_cryptex1;
  else
    v7 = 1;
  if (!v7)
    v6 = cryptex_asset_type_is_cryptex1(*(void **)(v2 + 8));
  if (v3)
    v8 = 0;
  else
    v8 = v6;
  if (v3)
    v9 = !v6;
  else
    v9 = 1;
  if (!v9)
    v8 = cryptex_asset_type_is_cryptex1(*(void **)(v3 + 8));
  if (v4)
    result = 0;
  else
    result = v8;
  if (v4)
    v11 = !v8;
  else
    v11 = 1;
  if (!v11)
    return cryptex_asset_type_is_cryptex1(*(void **)(v4 + 8));
  return result;
}

uint64_t cryptex_core_copy_nonce_domain_desc(_QWORD *a1, char **a2)
{
  uint64_t nonce_domain_handle;
  uint64_t v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  uint64_t nonce_domain_index;
  const char *v12;
  const char *v13;
  char *v14;
  int v16;
  uint64_t v17;
  char __str[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)__str = 0u;
  v19 = 0u;
  v17 = 0;
  v16 = 0;
  if (!a1)
    return 22;
  if (cryptex_core_is_cryptex1(a1))
  {
    nonce_domain_handle = cryptex_core_get_nonce_domain_handle(a1, &v16);
    if ((_DWORD)nonce_domain_handle)
    {
      v5 = nonce_domain_handle;
      v6 = (const char *)a1[2];
      v7 = *__error();
      v8 = a1[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = "[anonymous]";
        if (v6)
          v9 = v6;
        *(_DWORD *)buf = 136446466;
        v26 = v9;
        v27 = 1024;
        v28 = v5;
        v10 = "%{public}s: Failed to get nonce domain handle.: %{darwin.errno}d";
LABEL_14:
        _os_log_impl(&dword_211A95000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    snprintf(__str, 0x64uLL, "Cryptex1 nonce domain = %u");
  }
  else
  {
    nonce_domain_index = cryptex_core_get_nonce_domain_index(a1, &v17);
    if ((_DWORD)nonce_domain_index)
    {
      v5 = nonce_domain_index;
      v12 = (const char *)a1[2];
      v7 = *__error();
      v8 = a1[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v13 = "[anonymous]";
        if (v12)
          v13 = v12;
        *(_DWORD *)buf = 136446466;
        v26 = v13;
        v27 = 1024;
        v28 = v5;
        v10 = "%{public}s: Failed to get nonce domain index.: %{darwin.errno}d";
        goto LABEL_14;
      }
LABEL_15:
      *__error() = v7;
      return v5;
    }
    snprintf(__str, 0x64uLL, "nonce domain index %llu");
  }
  if (!a2)
    return 0;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v14 = strdup(__str);
      if (v14)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v14 = strdup(__str);
    if (!v14)
      cryptex_core_copy_nonce_domain_desc_cold_1(__str);
  }
  v5 = 0;
  *a2 = v14;
  return v5;
}

uint64_t cryptex_core_get_nonce_domain_index(_QWORD *a1, uint64_t *a2)
{
  void *v2;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[22];
  if (v2 == &_cryptex_asset_type_cpxd)
  {
    result = 0;
    v10 = 3;
LABEL_13:
    *a2 = v10;
    return result;
  }
  if (v2 == &_cryptex_asset_type_pdmg)
  {
    v11 = a1[7];
    if (v11 >= 2)
    {
      result = 0;
      if (v11 != 2)
        return result;
      v10 = 4;
    }
    else
    {
      result = 0;
      v10 = 2;
    }
    goto LABEL_13;
  }
  v4 = (const char *)a1[2];
  v5 = *__error();
  v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v8 = *(_QWORD *)(a1[22] + 40);
    v12 = 136446722;
    v13 = v7;
    v14 = 2080;
    v15 = v8;
    v16 = 1024;
    v17 = 45;
    _os_log_impl(&dword_211A95000, v6, OS_LOG_TYPE_ERROR, "%{public}s: not supported image type: %s: %{darwin.errno}d", (uint8_t *)&v12, 0x1Cu);
  }
  *__error() = v5;
  return 45;
}

uint64_t cryptex_core_get_nonce_domain(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t nonce_domain_handle;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  uint64_t nonce_domain_index;
  const char *v12;
  const char *v13;
  uint64_t nonce_domain_from_index;
  int v16;
  unint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v16 = 0;
  v2 = 22;
  if (a1 && a2)
  {
    if (cryptex_core_is_cryptex1(a1))
    {
      nonce_domain_handle = cryptex_core_get_nonce_domain_handle(a1, &v16);
      if ((_DWORD)nonce_domain_handle)
      {
        v2 = nonce_domain_handle;
        v6 = (const char *)a1[2];
        v7 = *__error();
        v8 = a1[4];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = "[anonymous]";
          if (v6)
            v9 = v6;
          *(_DWORD *)buf = 136446466;
          v19 = v9;
          v20 = 1024;
          v21 = v2;
          v10 = "%{public}s: Failed to get nonce domain handle.: %{darwin.errno}d";
LABEL_14:
          _os_log_impl(&dword_211A95000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      nonce_domain_from_index = img4_nonce_domain_get_from_handle();
    }
    else
    {
      nonce_domain_index = cryptex_core_get_nonce_domain_index(a1, (uint64_t *)&v17);
      if ((_DWORD)nonce_domain_index)
      {
        v2 = nonce_domain_index;
        v12 = (const char *)a1[2];
        v7 = *__error();
        v8 = a1[4];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v13 = "[anonymous]";
          if (v12)
            v13 = v12;
          *(_DWORD *)buf = 136446466;
          v19 = v13;
          v20 = 1024;
          v21 = v2;
          v10 = "%{public}s: Failed to get nonce domain index.: %{darwin.errno}d";
          goto LABEL_14;
        }
LABEL_15:
        *__error() = v7;
        return v2;
      }
      nonce_domain_from_index = _img4_get_nonce_domain_from_index(v17);
    }
    v2 = 0;
    *a2 = nonce_domain_from_index;
  }
  return v2;
}

uint64_t cryptex_core_set_nonce_persistence(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 56) = a2;
  return result;
}

uint64_t cryptex_core_set_install_persistence(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = a2;
  return result;
}

uint64_t cryptex_core_get_cryptex1_properties(uint64_t a1)
{
  return *(_QWORD *)(a1 + 216);
}

uint64_t cryptex_core_cx1_properties_create(int a1, int a2, const char *a3, const char *a4, char a5, char a6)
{
  uint64_t v12;
  char *v13;
  char *v14;

  v12 = _cryptex_core_cx1_properties_alloc();
  *(_DWORD *)(v12 + 40) = a1;
  *(_DWORD *)(v12 + 44) = a2;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v13 = strdup(a3);
      if (v13)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v13 = strdup(a3);
    if (!v13)
      cryptex_core_copy_nonce_domain_desc_cold_1(a3);
  }
  *(_QWORD *)(v12 + 48) = v13;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v14 = strdup(a4);
      if (v14)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v14 = strdup(a4);
    if (!v14)
      cryptex_core_copy_nonce_domain_desc_cold_1(a4);
  }
  *(_QWORD *)(v12 + 56) = v14;
  *(_BYTE *)(v12 + 64) = a5;
  *(_BYTE *)(v12 + 65) = a6;
  object_proto_init(v12 + 16, (int)"com.apple.security.libcryptex.core", "cryptex.core");
  return v12;
}

uint64_t cryptex_core_cx1_properties_create_with_xpc_dictionary(void *a1)
{
  int uint64;
  int v3;
  int v4;
  NSObject *v5;
  const char *v6;
  int v7;
  int v8;
  int string;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint32_t v17;
  int *v18;
  uint64_t result;
  __int16 v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = 0;
  v21 = 0;
  v22 = 0;
  v20 = 0;
  uint64 = _xpc_dictionary_try_get_uint64(a1, "Cryptex1,NonceDomain", &v24);
  if (uint64)
  {
    v3 = uint64;
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "Cryptex1,NonceDomain";
      v27 = 1024;
      v28 = v3;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Dictionary missing key: %s: %{darwin.errno}d";
LABEL_19:
      v17 = 18;
LABEL_20:
      _os_log_impl(&dword_211A95000, v5, OS_LOG_TYPE_ERROR, v6, buf, v17);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v7 = _xpc_dictionary_try_get_uint64(a1, "Cryptex1,SubType", &v23);
  if (v7)
  {
    v8 = v7;
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "Cryptex1,SubType";
      v27 = 1024;
      v28 = v8;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
LABEL_21:
    v18 = __error();
    result = 0;
    *v18 = v4;
    return result;
  }
  string = _xpc_dictionary_try_get_string(a1, "Cryptex1,Version", &v22);
  if (string)
  {
    v10 = string;
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "Cryptex1,Version";
      v27 = 1024;
      v28 = v10;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v11 = _xpc_dictionary_try_get_string(a1, "Cryptex1,PreauthVersion", &v21);
  if (v11)
  {
    v12 = v11;
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "Cryptex1,PreauthVersion";
      v27 = 1024;
      v28 = v12;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v13 = _xpc_dictionary_try_get_BOOL(a1, "MountedCryptex", (BOOL *)&v20 + 1);
  if (v13)
  {
    v14 = v13;
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "MountedCryptex";
      v27 = 1024;
      v28 = v14;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v15 = _xpc_dictionary_try_get_BOOL(a1, "Cryptex1,UseProductClass", (BOOL *)&v20);
  if (v15)
  {
    v16 = v15;
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "Cryptex1,UseProductClass";
      v27 = 1024;
      v28 = v16;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Dictionary missing key: %s: %{darwin.errno}d";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (HIDWORD(v24) || HIDWORD(v23))
  {
    v4 = *__error();
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = 84;
    v5 = MEMORY[0x24BDACB70];
    v6 = "Integer overflow.: %{darwin.errno}d";
    goto LABEL_27;
  }
  result = cryptex_core_cx1_properties_create(v24, v23, v22, v21, SHIBYTE(v20), v20);
  if (!result)
  {
    v4 = *__error();
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 67109120;
    LODWORD(v26) = 12;
    v5 = MEMORY[0x24BDACB70];
    v6 = "Failed to create property object.: %{darwin.errno}d";
LABEL_27:
    v17 = 8;
    goto LABEL_20;
  }
  return result;
}

xpc_object_t cryptex_core_cx1_copy_xpc_dictionary(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Cryptex1,NonceDomain", *(unsigned int *)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "Cryptex1,SubType", *(unsigned int *)(a1 + 44));
  xpc_dictionary_set_string(v2, "Cryptex1,Version", *(const char **)(a1 + 48));
  xpc_dictionary_set_string(v2, "Cryptex1,PreauthVersion", *(const char **)(a1 + 56));
  xpc_dictionary_set_BOOL(v2, "MountedCryptex", *(_BYTE *)(a1 + 64));
  xpc_dictionary_set_BOOL(v2, "Cryptex1,UseProductClass", *(_BYTE *)(a1 + 65));
  return v2;
}

uint64_t cryptex_core_cx1_write_to_file(uint64_t a1, int a2)
{
  CFNumberRef v4;
  CFNumberRef v5;
  CFStringRef v6;
  CFStringRef v7;
  CFStringRef v8;
  void *v9;
  void *v10;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  const __CFData *v13;
  const __CFData *v14;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  _OWORD v22[3];
  uint64_t v23;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v26;
  __int16 v27;
  int v28;
  void *values[6];
  void *keys[2];
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  error = 0;
  v4 = _CFNumberCreateFromUInt32(*(_DWORD *)(a1 + 40));
  v5 = _CFNumberCreateFromUInt32(*(_DWORD *)(a1 + 44));
  v6 = _CFStringCreateFromUTF8String(*(char **)(a1 + 48));
  v7 = _CFStringCreateFromUTF8String(*(char **)(a1 + 56));
  v8 = v7;
  if (*(_BYTE *)(a1 + 64))
    v9 = (void *)*MEMORY[0x24BDBD270];
  else
    v9 = (void *)*MEMORY[0x24BDBD268];
  if (*(_BYTE *)(a1 + 65))
    v10 = (void *)*MEMORY[0x24BDBD270];
  else
    v10 = (void *)*MEMORY[0x24BDBD268];
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  *(_OWORD *)keys = xmmword_24CCE2CC0;
  v31 = *(_OWORD *)&off_24CCE2CD0;
  v32 = xmmword_24CCE2CE0;
  values[0] = v4;
  values[1] = v5;
  values[2] = (void *)v6;
  values[3] = (void *)v7;
  values[4] = v9;
  values[5] = v10;
  v11 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v11)
  {
    v12 = v11;
    v13 = CFPropertyListCreateData(0, v11, kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (v13)
    {
      v14 = v13;
      BytePtr = CFDataGetBytePtr(v13);
      Length = CFDataGetLength(v14);
      buff_init_signed(v22, 0, 0, (uint64_t)BytePtr, Length);
      v17 = _write_file(a2, (uint64_t)v22);
      if ((_DWORD)v17)
      {
        v18 = *__error();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v26) = v17;
          _os_log_impl(&dword_211A95000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to write properties to file.: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v18;
      }
      buff_destroy(v22);
      CFRelease(v14);
    }
    else
    {
      v20 = *__error();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = error;
        v27 = 1024;
        v28 = 12;
        _os_log_impl(&dword_211A95000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create property list data: %{public}@: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v20;
      buff_destroy(v22);
      v17 = 12;
    }
    CFRelease(v12);
    if (v10)
LABEL_22:
      CFRelease(v10);
  }
  else
  {
    v19 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 12;
      _os_log_impl(&dword_211A95000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create dictionary.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v19;
    buff_destroy(v22);
    v17 = 12;
    if (v10)
      goto LABEL_22;
  }
  if (v9)
    CFRelease(v9);
  if (v8)
    CFRelease(v8);
  if (v6)
    CFRelease(v6);
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
  return v17;
}

uint64_t cryptex_core_parse_info_asset(_QWORD *a1, char **a2, char ***a3, BOOL *a4)
{
  uint64_t v5;
  uint64_t file;
  uint64_t v10;
  const char *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  void *v19;
  void *v20;
  const char *string;
  const char *v22;
  const char *v23;
  const char *v24;
  char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  _OWORD v34[3];
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  memset(v34, 0, sizeof(v34));
  v5 = a1[*(_QWORD *)(a1[23] + 24) + 8];
  if (v5)
  {
    file = _read_file(*(_DWORD *)(v5 + 16), v34);
    if ((_DWORD)file)
    {
      v10 = file;
      v11 = (const char *)a1[2];
      v12 = *__error();
      v13 = a1[4];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = "[anonymous]";
        if (v11)
          v14 = v11;
        *(_DWORD *)buf = 136446466;
        v37 = v14;
        v38 = 1024;
        LODWORD(v39) = v10;
        v15 = "%{public}s: Failed to read info asset.: %{darwin.errno}d";
LABEL_11:
        _os_log_impl(&dword_211A95000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x12u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    v19 = (void *)xpc_create_from_plist();
    if (!v19)
    {
      v26 = (const char *)a1[2];
      v12 = *__error();
      v13 = a1[4];
      v10 = 22;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v27 = "[anonymous]";
      if (v26)
        v27 = v26;
      *(_DWORD *)buf = 136446466;
      v37 = v27;
      v38 = 1024;
      LODWORD(v39) = 22;
      v15 = "%{public}s: Failed to parse info asset as plist.: %{darwin.errno}d";
      goto LABEL_11;
    }
    v20 = v19;
    string = xpc_dictionary_get_string(v19, "CFBundleIdentifier");
    if (string)
    {
      v22 = string;
      v23 = xpc_dictionary_get_string(v20, "CFBundleVersion");
      if (v23)
      {
        v24 = v23;
        if (a4)
          _xpc_dictionary_try_get_BOOL(v20, "NoCode", a4);
        if (a2)
        {
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              v25 = strdup(v22);
              if (v25)
                break;
              __os_temporary_resource_shortage();
            }
          }
          else
          {
            v25 = strdup(v22);
            if (!v25)
              cryptex_core_copy_nonce_domain_desc_cold_1(v22);
          }
          *a2 = v25;
        }
        if (a3)
          *a3 = cryptex_version_new(v24);
        buff_destroy(v34);
        v10 = 0;
        goto LABEL_42;
      }
      v32 = (const char *)a1[2];
      v29 = *__error();
      v30 = a1[4];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v33 = "[anonymous]";
        *(_DWORD *)buf = 136446722;
        if (v32)
          v33 = v32;
        v37 = v33;
        v38 = 2080;
        v39 = "CFBundleVersion";
        v40 = 1024;
        v41 = 22;
LABEL_35:
        _os_log_impl(&dword_211A95000, v30, OS_LOG_TYPE_ERROR, "%{public}s: Info dictionary missing expected key: '%s': %{darwin.errno}d", buf, 0x1Cu);
      }
    }
    else
    {
      v28 = (const char *)a1[2];
      v29 = *__error();
      v30 = a1[4];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = "[anonymous]";
        *(_DWORD *)buf = 136446722;
        if (v28)
          v31 = v28;
        v37 = v31;
        v38 = 2080;
        v39 = "CFBundleIdentifier";
        v40 = 1024;
        v41 = 22;
        goto LABEL_35;
      }
    }
    *__error() = v29;
    buff_destroy(v34);
    v10 = 22;
LABEL_42:
    os_release(v20);
    return v10;
  }
  v16 = (const char *)a1[2];
  v12 = *__error();
  v13 = a1[4];
  v10 = 2;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v17 = "[anonymous]";
    if (v16)
      v17 = v16;
    *(_DWORD *)buf = 136446466;
    v37 = v17;
    v38 = 1024;
    LODWORD(v39) = 2;
    v15 = "%{public}s: Cryptex has no metadata.: %{darwin.errno}d";
    goto LABEL_11;
  }
LABEL_12:
  *__error() = v12;
  buff_destroy(v34);
  return v10;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_2()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_crash_msg();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_5(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

double OUTLINED_FUNCTION_6()
{
  _QWORD *v0;
  _OWORD *v1;
  double result;

  *v0 = 0;
  result = 0.0;
  *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  return result;
}

size_t OUTLINED_FUNCTION_7(const char *__s)
{
  return strlen(__s);
}

char *OUTLINED_FUNCTION_8(int *a1)
{
  return strerror(*a1);
}

double OUTLINED_FUNCTION_9(_QWORD *a1, _OWORD *a2)
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

uint64_t OUTLINED_FUNCTION_10()
{
  return _os_crash_msg();
}

const char **cryptex_content_type_parse(char *__s2)
{
  uint64_t v2;
  const char **v3;

  v2 = 0;
  while (1)
  {
    v3 = (const char **)cryptex_content_types[v2];
    if (!strcmp(*v3, __s2))
      break;
    if (++v2 == 6)
      return 0;
  }
  return v3;
}

const char *cryptex_session_state_to_string(unint64_t a1)
{
  if (a1 > 5)
    return "UNK";
  else
    return off_24CCE2DA8[a1];
}

const char *cryptex_session_event_to_string(uint64_t a1)
{
  const char *result;

  if (a1 > 15)
  {
    switch(a1)
    {
      case 16:
        return "TERMINATED";
      case 32:
        return "FAIL";
      case 64:
        return "ALL";
      default:
        return "UNKNOWN";
    }
  }
  else
  {
    result = "NONE";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "STAGING";
        break;
      case 2:
        result = "START";
        break;
      case 4:
        result = "READY";
        break;
      case 8:
        result = "STOP";
        break;
      default:
        return "UNKNOWN";
    }
  }
  return result;
}

void _session_core_dealloc(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)a1[12];
  if (v2)
    free(v2);
  v3 = (void *)a1[9];
  if (v3)
    xpc_release(v3);
  v4 = (void *)a1[10];
  if (v4)
    xpc_release(v4);
  v5 = (void *)a1[11];
  if (v5)
    xpc_release(v5);
  v6 = (void *)a1[13];
  if (v6)
    free(v6);
  v7 = (void *)a1[14];
  if (v7)
    free(v7);
  object_proto_destroy((uint64_t)(a1 + 2));
}

char *session_core_generate_username(const char *a1)
{
  char *v2;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  if (asprintf(&v2, "cryptex_%s", a1) < 0)
    session_core_generate_username_cold_1(&v3, v4);
  return v2;
}

uint64_t session_core_create(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  char *username;
  char *v6;
  uuid_t out;
  char __s1[88];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = _session_core_alloc();
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex.core", "cryptex.session");
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = 0x100000000;
  *(_QWORD *)(v2 + 72) = xpc_array_create_empty();
  *(_QWORD *)(v2 + 80) = xpc_dictionary_create_empty();
  memset(out, 0, sizeof(out));
  memset(__s1, 0, 37);
  uuid_generate_random(out);
  uuid_unparse(out, __s1);
  v3 = strdup(__s1);
  *(_DWORD *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 96) = v3;
  username = session_core_generate_username(v3);
  *(_QWORD *)(v2 + 104) = username;
  v6 = 0;
  if (asprintf(&v6, "/Users/%s", username) < 0)
    session_core_generate_username_cold_1(out, __s1);
  *(_QWORD *)(v2 + 112) = v6;
  *(_BYTE *)(v2 + 120) = 0;
  return v2;
}

uint64_t cryptex_session_core_transition(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a1[6];
  if (v4 != 3 && a2 == 8)
    v6 = 5;
  else
    v6 = 6;
  switch(v4)
  {
    case 0:
      if (a2 == 1)
        v6 = 1;
      goto LABEL_11;
    case 1:
LABEL_11:
      if (a2 == 2)
        v6 = 2;
      break;
    case 2:
      v7 = a2 == 4;
      v8 = 3;
      goto LABEL_15;
    case 3:
      if (a2 == 8)
        v6 = 4;
      else
        v6 = 6;
      break;
    case 4:
    case 5:
      v7 = a2 == 16;
      v8 = 5;
LABEL_15:
      if (v7)
        v6 = v8;
      break;
    default:
      break;
  }
  v9 = (const char *)a1[2];
  v10 = *__error();
  v11 = a1[4];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (!v9)
      v9 = "[anonymous]";
    v12 = a1[6];
    if (v12 > 5)
      v13 = "UNK";
    else
      v13 = off_24CCE2DA8[v12];
    v14 = a1[12];
    v15 = cryptex_session_event_to_string(a2);
    if ((unint64_t)(v6 - 1) > 4)
      v16 = "UNK";
    else
      v16 = off_24CCE2D80[v6 - 1];
    v18 = 136447234;
    v19 = v9;
    v20 = 2080;
    v21 = v14;
    v22 = 2080;
    v23 = v13;
    v24 = 2080;
    v25 = v15;
    v26 = 2080;
    v27 = v16;
    _os_log_impl(&dword_211A95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: %s: state %s, event %s -> state %s", (uint8_t *)&v18, 0x34u);
  }
  *__error() = v10;
  a1[6] = v6;
  return v6;
}

__n128 cryptex_session_core_merge(uint64_t a1, uint64_t a2)
{
  const char *v3;
  const char *v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __n128 result;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  const char *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  const char *v33;
  int v34;
  int v35;
  const char *v36;
  int v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  _BYTE v49[10];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = *(const char **)(a1 + 96);
  if (!v3)
  {
    v13 = *(const char **)(a1 + 16);
    v14 = *__error();
    v15 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = "[anonymous]";
      if (v13)
        v16 = v13;
      v42 = 136446210;
      v43 = v16;
      v17 = "%{public}s: Invalid session core main - failed to merge.";
      goto LABEL_17;
    }
LABEL_18:
    *__error() = v14;
    return result;
  }
  v5 = *(const char **)(a2 + 96);
  if (!v5)
  {
    v18 = *(const char **)(a1 + 16);
    v14 = *__error();
    v15 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "[anonymous]";
      if (v18)
        v19 = v18;
      v42 = 136446210;
      v43 = v19;
      v17 = "%{public}s: Invalid session core update - failed to merge.";
LABEL_17:
      _os_log_impl(&dword_211A95000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v42, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (!strcmp(v3, v5))
  {
    if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(a2 + 48))
    {
      v20 = *(const char **)(a1 + 16);
      v21 = *__error();
      v22 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = "[anonymous]";
        if (v20)
          v23 = v20;
        v24 = *(_QWORD *)(a1 + 48);
        if (v24 > 5)
          v25 = "UNK";
        else
          v25 = off_24CCE2DA8[v24];
        v26 = *(_QWORD *)(a1 + 96);
        v27 = *(_QWORD *)(a2 + 48);
        if (v27 > 5)
          v28 = "UNK";
        else
          v28 = off_24CCE2DA8[v27];
        v42 = 136447234;
        v43 = v23;
        v44 = 2048;
        v45 = a1;
        v46 = 2080;
        v47 = v26;
        v48 = 2080;
        *(_QWORD *)v49 = v25;
        *(_WORD *)&v49[8] = 2080;
        v50 = v28;
        _os_log_impl(&dword_211A95000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: (%p) Updating %s state: %s -> %s", (uint8_t *)&v42, 0x34u);
      }
      *__error() = v21;
    }
    if (*(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40))
    {
      v29 = *(const char **)(a1 + 16);
      v30 = *__error();
      v31 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(_QWORD *)(a1 + 96);
        v33 = "[anonymous]";
        v34 = *(_DWORD *)(a1 + 40);
        if (v29)
          v33 = v29;
        v35 = *(_DWORD *)(a2 + 40);
        v42 = 136447234;
        v43 = v33;
        v44 = 2048;
        v45 = a1;
        v46 = 2080;
        v47 = v32;
        v48 = 1024;
        *(_DWORD *)v49 = v34;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v35;
        _os_log_impl(&dword_211A95000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s: (%p) Updating %s uid: %d -> %d", (uint8_t *)&v42, 0x2Cu);
      }
      *__error() = v30;
    }
    if (!*(_QWORD *)(a1 + 112) && *(_QWORD *)(a2 + 112))
    {
      v36 = *(const char **)(a1 + 16);
      v37 = *__error();
      v38 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = "[anonymous]";
        if (v36)
          v39 = v36;
        v40 = *(_QWORD *)(a1 + 96);
        v41 = *(_QWORD *)(a2 + 112);
        v42 = 136446978;
        v43 = v39;
        v44 = 2048;
        v45 = a1;
        v46 = 2080;
        v47 = v40;
        v48 = 2080;
        *(_QWORD *)v49 = v41;
        _os_log_impl(&dword_211A95000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s: (%p) Updating %s homedir: (null) -> %s", (uint8_t *)&v42, 0x2Au);
      }
      *__error() = v37;
      *(_QWORD *)(a1 + 112) = strdup(*(const char **)(a2 + 112));
    }
    *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
    result = *(__n128 *)(a2 + 48);
    *(__n128 *)(a1 + 48) = result;
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  }
  else
  {
    v6 = *(const char **)(a1 + 16);
    v7 = *__error();
    v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "[anonymous]";
      if (v6)
        v9 = v6;
      v10 = *(_QWORD *)(a2 + 96);
      v11 = *(_QWORD *)(a1 + 96);
      v42 = 136446722;
      v43 = v9;
      v44 = 2080;
      v45 = v10;
      v46 = 2080;
      v47 = v11;
      _os_log_impl(&dword_211A95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Trying to merge %s onto different session %s", (uint8_t *)&v42, 0x20u);
    }
    *__error() = v7;
  }
  return result;
}

uint64_t cryptex_session_core_get_state(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t cryptex_session_core_get_uid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t cryptex_session_core_get_overrides(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

char *cryptex_session_core_copy_name(uint64_t a1)
{
  return strdup(*(const char **)(a1 + 96));
}

char *cryptex_session_core_copy_homedir(uint64_t a1)
{
  char *result;

  result = *(char **)(a1 + 112);
  if (result)
    return strdup(result);
  return result;
}

uint64_t cryptex_session_core_get_attributes(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t cryptex_session_core_get_homedir_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t cryptex_session_core_set_uid(uint64_t result, int a2)
{
  *(_DWORD *)(result + 40) = a2;
  return result;
}

void cryptex_session_core_set_homedir(uint64_t a1, char *__s1)
{
  void *v4;
  char *v5;
  xpc_object_t value;

  v4 = *(void **)(a1 + 112);
  if (v4)
    free(v4);
  v5 = strdup(__s1);
  *(_QWORD *)(a1 + 112) = v5;
  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 80), "CRYPTEX_SESSION");
  if (!value)
  {
    value = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 80), "CRYPTEX_SESSION", value);
  }
  xpc_dictionary_set_string(value, "~/", v5);
}

xpc_object_t cryptex_session_core_set_endpoint(uint64_t a1, xpc_object_t object)
{
  xpc_object_t result;

  result = xpc_copy(object);
  *(_QWORD *)(a1 + 88) = result;
  return result;
}

void cryptex_session_core_append_to_array(uint64_t a1, char *string)
{
  xpc_array_set_string(*(xpc_object_t *)(a1 + 72), 0xFFFFFFFFFFFFFFFFLL, string);
}

xpc_object_t cryptex_session_core_copy_xpc_object(uint64_t a1)
{
  xpc_object_t v2;
  const char *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "state", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "uid", *(unsigned int *)(a1 + 40));
  xpc_dictionary_set_int64(v2, "attributes", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_uint64(v2, "homesize", *(_QWORD *)(a1 + 64));
  xpc_dictionary_set_BOOL(v2, "simple_session", *(_BYTE *)(a1 + 120));
  v3 = *(const char **)(a1 + 96);
  if (v3)
    xpc_dictionary_set_string(v2, "name", v3);
  v4 = *(void **)(a1 + 72);
  if (v4)
    xpc_dictionary_set_value(v2, "cryptex_array", v4);
  v5 = *(void **)(a1 + 80);
  if (v5)
    xpc_dictionary_set_value(v2, "overrides", v5);
  v6 = *(const char **)(a1 + 104);
  if (v6)
    xpc_dictionary_set_string(v2, "username", v6);
  v7 = *(const char **)(a1 + 112);
  if (v7)
    xpc_dictionary_set_string(v2, "home_directory", v7);
  if (*(_QWORD *)(a1 + 88) && MEMORY[0x212BE5998]() == MEMORY[0x24BDACFB0])
    xpc_dictionary_set_value(v2, "endpoint", *(xpc_object_t *)(a1 + 88));
  return v2;
}

uint64_t cryptex_session_core_create_from_xpc(void *a1)
{
  uint64_t v2;
  xpc_object_t array;
  void *v4;
  xpc_object_t empty;
  xpc_object_t dictionary;
  const char *string;
  const char *v8;
  const char *v9;
  xpc_object_t value;
  void *v11;

  v2 = _session_core_alloc();
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex.core", "cryptex.session");
  *(_QWORD *)(v2 + 48) = xpc_dictionary_get_int64(a1, "state");
  *(_DWORD *)(v2 + 40) = xpc_dictionary_get_int64(a1, "uid");
  *(_QWORD *)(v2 + 56) = xpc_dictionary_get_int64(a1, "attributes");
  *(_QWORD *)(v2 + 64) = xpc_dictionary_get_uint64(a1, "homesize");
  array = xpc_dictionary_get_array(a1, "cryptex_array");
  if (!array)
    cryptex_session_core_create_from_xpc_cold_1();
  v4 = array;
  if (xpc_array_get_count(array))
    empty = xpc_copy(v4);
  else
    empty = xpc_array_create_empty();
  *(_QWORD *)(v2 + 72) = empty;
  dictionary = xpc_dictionary_get_dictionary(a1, "overrides");
  if (!dictionary)
    cryptex_session_core_create_from_xpc_cold_2();
  *(_QWORD *)(v2 + 80) = xpc_copy(dictionary);
  string = xpc_dictionary_get_string(a1, "username");
  if (!string)
    cryptex_session_core_create_from_xpc_cold_3();
  *(_QWORD *)(v2 + 104) = strdup(string);
  v8 = xpc_dictionary_get_string(a1, "name");
  if (!v8)
    cryptex_session_core_create_from_xpc_cold_4();
  *(_QWORD *)(v2 + 96) = strdup(v8);
  v9 = xpc_dictionary_get_string(a1, "home_directory");
  if (!v9)
    cryptex_session_core_create_from_xpc_cold_5();
  *(_QWORD *)(v2 + 112) = strdup(v9);
  if (xpc_dictionary_get_BOOL(a1, "simple_session"))
    *(_BYTE *)(v2 + 120) = 1;
  value = xpc_dictionary_get_value(a1, "endpoint");
  if (value)
  {
    v11 = value;
    if (MEMORY[0x212BE5998]() == MEMORY[0x24BDACFB0])
      *(_QWORD *)(v2 + 88) = xpc_copy(v11);
  }
  return v2;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_2_0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t _IOErrorGetErrno(uint64_t result)
{
  switch(result)
  {
    case 0xE00002BD:
    case 0xE00002BE:
    case 0xE00002C8:
    case 0xE00002DE:
      result = 12;
      break;
    case 0xE00002BF:
      result = 72;
      break;
    case 0xE00002C0:
    case 0xE00002D7:
    case 0xE00002D9:
    case 0xE00002DA:
      result = 19;
      break;
    case 0xE00002C1:
      result = 1;
      break;
    case 0xE00002C2:
      result = 22;
      break;
    case 0xE00002C3:
    case 0xE00002C4:
    case 0xE00002C5:
    case 0xE00002CC:
      result = 35;
      break;
    case 0xE00002C6:
      result = 94;
      break;
    case 0xE00002C7:
      result = 45;
      break;
    case 0xE00002C9:
    case 0xE00002CA:
    case 0xE00002D3:
    case 0xE00002D4:
      result = 5;
      break;
    case 0xE00002CB:
    case 0xE00002DC:
    case 0xE00002DF:
    case 0xE00002E0:
    case 0xE00002E3:
    case 0xE00002E4:
    case 0xE00002E5:
    case 0xE00002E6:
    case 0xE00002E7:
    case 0xE00002E8:
    case 0xE00002EA:
      goto LABEL_10;
    case 0xE00002CD:
      result = 9;
      break;
    case 0xE00002CE:
    case 0xE00002CF:
    case 0xE00002E2:
      result = 13;
      break;
    case 0xE00002D0:
      result = 14;
      break;
    case 0xE00002D1:
    case 0xE00002E9:
      result = 83;
      break;
    case 0xE00002D2:
    case 0xE00002D5:
      result = 16;
      break;
    case 0xE00002D6:
      result = 60;
      break;
    case 0xE00002D8:
      result = 6;
      break;
    case 0xE00002DB:
      result = 28;
      break;
    case 0xE00002DD:
      result = 17;
      break;
    case 0xE00002E1:
      result = 7;
      break;
    case 0xE00002EB:
      result = 89;
      break;
    default:
      if ((_DWORD)result)
LABEL_10:
        result = 104;
      break;
  }
  return result;
}

void _cryptex_base_dealloc(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void cryptex_init(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  NSObject *initially_inactive;

  *(_QWORD *)(a1 + 16) = a4;
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  *(_QWORD *)(a1 + 24) = dispatch_queue_create("com.apple.security.libcryptex.core.dq", initially_inactive);
  *(_QWORD *)(a1 + 32) = dispatch_queue_create("com.apple.security.libcryptex.core.targetdq", 0);
  *(_QWORD *)(a1 + 40) = a3;
  if (a3)
  {
    os_retain((void *)a1);
    dispatch_async_f(*(dispatch_queue_t *)(a1 + 24), (void *)a1, (dispatch_function_t)_cryptex_init);
  }
  if (a2)
    dispatch_set_target_queue(*(dispatch_object_t *)(a1 + 24), a2);
}

void _cryptex_init(void (**a1)(void))
{
  a1[5]();
  os_release(a1);
}

void cryptex_set_target_object(uint64_t a1, uint64_t a2)
{
  dispatch_set_target_queue(*(dispatch_object_t *)(a1 + 32), *(dispatch_queue_t *)(a2 + 24));
}

void cryptex_set_target_queue(uint64_t a1, NSObject *a2)
{
  dispatch_set_target_queue(*(dispatch_object_t *)(a1 + 32), a2);
}

void cryptex_activate(uint64_t a1)
{
  dispatch_activate(*(dispatch_object_t *)(a1 + 24));
}

void cryptex_async_f(uint64_t a1, void *a2, void (__cdecl *a3)(void *))
{
  dispatch_async_f(*(dispatch_queue_t *)(a1 + 24), a2, a3);
}

void cryptex_async(uint64_t a1, void *a2)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 24), a2);
}

void cryptex_sync_f(uint64_t a1, void *a2, void (__cdecl *a3)(void *))
{
  dispatch_sync_f(*(dispatch_queue_t *)(a1 + 24), a2, a3);
}

void cryptex_sync(uint64_t a1, void *a2)
{
  dispatch_sync(*(dispatch_queue_t *)(a1 + 24), a2);
}

void cryptex_assert_queue(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
}

void cryptex_target_async_f(uint64_t a1, void *a2, void (__cdecl *a3)(void *))
{
  dispatch_async_f(*(dispatch_queue_t *)(a1 + 32), a2, a3);
}

void cryptex_target_async(uint64_t a1, void *a2)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), a2);
}

uint64_t cryptex_set_error(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

dispatch_queue_t cryptex_queue_create_with_target(const char *a1, NSObject *a2, uint64_t a3)
{
  return dispatch_queue_create_with_target_V2(a1, a2, *(dispatch_queue_t *)(a3 + 32));
}

uint64_t cryptex_get_error(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t _cpxd_cdxn_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5)
{
  return _shared_cdxn_stamp(a1, a2, a3, a4, a5, (uint64_t)&_cxdn_tag);
}

uint64_t _cpxd_evaluate(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 48))
    return 0;
  if (*(_BYTE *)(a2 + 53))
    return 0;
  return 13;
}

uint64_t _cryptex_asset_generic_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, const char **a5)
{
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  const void *v13;
  uint64_t v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  unsigned int ImagePropertiesWithDeviceMapZipped;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v22;
  void *v23;
  const char *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  const void *v28;
  CFTypeRef cf;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  CFTypeRef v35;
  __int16 v36;
  CFMutableDictionaryRef v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v9 = *a5;
  v10 = *__error();
  v11 = a5[2];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = "[anonymous]";
    if (v9)
      v12 = v9;
    v13 = *(const void **)(*(_QWORD *)(a1 + 8) + 40);
    *(_DWORD *)buf = 136446466;
    v33 = v12;
    v34 = 2080;
    v35 = v13;
    _os_log_impl(&dword_211A95000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: initializing %s asset", buf, 0x16u);
  }
  *__error() = v10;
  v14 = _CFURLCreateFromFileDescriptor(*(unsigned int *)(a1 + 16), (CFURLRef *)&cf);
  v15 = *a5;
  v16 = *__error();
  v17 = a5[2];
  if ((_DWORD)v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = "[anonymous]";
      if (v15)
        v18 = v15;
      *(_DWORD *)buf = 136446466;
      v33 = v18;
      v34 = 1024;
      LODWORD(v35) = v14;
      _os_log_impl(&dword_211A95000, v17, OS_LOG_TYPE_ERROR, "%{public}s: _CFURLCreateFromFileDescriptor: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v16;
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = "[anonymous]";
      if (v15)
        v19 = v15;
      *(_DWORD *)buf = 136446466;
      v33 = v19;
      v34 = 2112;
      v35 = cf;
      _os_log_impl(&dword_211A95000, v17, OS_LOG_TYPE_DEBUG, "%{public}s: created url: %@", buf, 0x16u);
    }
    *__error() = v16;
    ImagePropertiesWithDeviceMapZipped = AMAuthInstallApCreateImagePropertiesWithDeviceMapZipped();
    if (ImagePropertiesWithDeviceMapZipped)
      _cryptex_asset_generic_stamp_cold_2(&v31, buf, ImagePropertiesWithDeviceMapZipped);
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, 0);
    if (!MutableCopy)
      _cryptex_asset_generic_stamp_cold_1(&v31, buf);
    v22 = MutableCopy;
    v23 = _cftag(*(_QWORD *)(a1 + 8));
    CFDictionarySetValue(a3, v23, v22);
    v24 = *a5;
    v25 = *__error();
    v26 = a5[2];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = "[anonymous]";
      if (v24)
        v27 = v24;
      v28 = *(const void **)(*(_QWORD *)(a1 + 8) + 40);
      *(_DWORD *)buf = 136446722;
      v33 = v27;
      v34 = 2080;
      v35 = v28;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_211A95000, v26, OS_LOG_TYPE_DEBUG, "%{public}s: %s image = %@", buf, 0x20u);
    }
    *__error() = v25;
    if (a4)
      *a4 = CFRetain(v22);
    if (v23)
      CFRelease(v23);
    CFRelease(v22);
  }
  if (cf)
    CFRelease(cf);
  return v14;
}

uint64_t _pdmg_cdxn_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5)
{
  return _shared_cdxn_stamp(a1, a2, a3, a4, a5, (uint64_t)&_pdnm_tag);
}

uint64_t _cryptex1_asset_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t generic_digest;
  uint64_t MutableForCFTypes;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  CFDataRef v18;
  CFDataRef v19;
  void *v20;
  const char *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  int v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  CFIndex length[2];
  _OWORD v35[3];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = ccsha384_di();
  *(_OWORD *)length = 0u;
  memset(v35, 0, sizeof(v35));
  generic_digest = cryptex_asset_create_generic_digest(a1, v9, (uint64_t)length, (const char **)a5);
  if ((_DWORD)generic_digest)
  {
    MutableForCFTypes = generic_digest;
    v12 = *(const char **)a5;
    v13 = *__error();
    v14 = *(NSObject **)(a5 + 16);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      *__error() = v13;
      return MutableForCFTypes;
    }
    v15 = "[anonymous]";
    if (v12)
      v15 = v12;
    v28 = 136446466;
    v29 = v15;
    v30 = 1024;
    LODWORD(v31) = MutableForCFTypes;
    v16 = "%{public}s: Failed to compute digest.: %{darwin.errno}d";
LABEL_6:
    _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 0x12u);
    goto LABEL_7;
  }
  v18 = CFDataCreate(0, (const UInt8 *)v35, length[1]);
  if (!v18)
  {
    v26 = *(const char **)a5;
    v13 = *__error();
    v14 = *(NSObject **)(a5 + 16);
    MutableForCFTypes = 12;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v27 = "[anonymous]";
    if (v26)
      v27 = v26;
    v28 = 136446466;
    v29 = v27;
    v30 = 1024;
    LODWORD(v31) = 12;
    v16 = "%{public}s: Failed to create data.: %{darwin.errno}d";
    goto LABEL_6;
  }
  v19 = v18;
  MutableForCFTypes = (uint64_t)_CFDictionaryCreateMutableForCFTypes();
  CFDictionarySetValue((CFMutableDictionaryRef)MutableForCFTypes, (const void *)*MEMORY[0x24BEDA890], v19);
  v20 = _cftag(*(_QWORD *)(a1 + 8));
  CFDictionarySetValue(a3, v20, (const void *)MutableForCFTypes);
  v21 = *(const char **)a5;
  v22 = *__error();
  v23 = *(NSObject **)(a5 + 16);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = "[anonymous]";
    if (v21)
      v24 = v21;
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 40);
    v28 = 136446722;
    v29 = v24;
    v30 = 2080;
    v31 = v25;
    v32 = 2112;
    v33 = MutableForCFTypes;
    _os_log_impl(&dword_211A95000, v23, OS_LOG_TYPE_DEBUG, "%{public}s: %s image = %@", (uint8_t *)&v28, 0x20u);
  }
  *__error() = v22;
  if (a4)
    *a4 = CFRetain((CFTypeRef)MutableForCFTypes);
  CFRelease(v19);
  if (v20)
    CFRelease(v20);
  if (MutableForCFTypes)
  {
    os_release((void *)MutableForCFTypes);
    return 0;
  }
  return MutableForCFTypes;
}

_QWORD *cryptex_asset_new(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  __int128 v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!v2)
    cryptex_asset_new_cold_1(&v5, v6);
  v3 = v2;
  v2[1] = a1;
  *((_DWORD *)v2 + 4) = claimfd_np();
  return v3;
}

_QWORD *cryptex_asset_new_borrowed(uint64_t a1, int a2)
{
  _QWORD *result;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!result)
    cryptex_asset_new_cold_1(&v5, v6);
  *result |= 1uLL;
  result[1] = a1;
  *((_DWORD *)result + 4) = a2;
  return result;
}

_QWORD *cryptex_asset_copy(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  result = malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!result)
    cryptex_asset_new_cold_1(&v3, v4);
  result[1] = *(_QWORD *)(a1 + 8);
  *((_DWORD *)result + 4) = -1;
  return result;
}

uint64_t cryptex_asset_evaluate(uint64_t a1)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t cryptex_asset_create_generic_digest(uint64_t a1, uint64_t a2, uint64_t a3, const char **a4)
{
  uint64_t v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  size_t st_size;
  void *v19;
  void *v20;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  stat v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  memset(&v27, 0, sizeof(v27));
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v25 - v8;
  bzero((char *)&v25 - v8, v10);
  if (*(_QWORD *)a2 >= 0x31uLL)
    cryptex_asset_create_generic_digest_cold_1(&v26, buf);
  if (fstat(*(_DWORD *)(a1 + 16), &v27))
  {
    v11 = *__error();
    v12 = *a4;
    v13 = *__error();
    v14 = a4[2];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      *__error() = v13;
      return v11;
    }
    v15 = "[anonymous]";
    if (v12)
      v15 = v12;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 40);
    *(_DWORD *)buf = 136446722;
    v29 = v15;
    v30 = 2080;
    v31 = v16;
    v32 = 1024;
    v33 = v11;
    v17 = "%{public}s: failed to stat object: %s: %{darwin.errno}d";
LABEL_7:
    _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x1Cu);
    goto LABEL_8;
  }
  st_size = v27.st_size;
  if (v27.st_size < 0)
    cryptex_asset_create_generic_digest_cold_2();
  v19 = mmap(0, v27.st_size, 1, 1, *(_DWORD *)(a1 + 16), 0);
  if (v19 == (void *)-1)
  {
    v11 = *__error();
    v22 = *a4;
    v13 = *__error();
    v14 = a4[2];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v23 = "[anonymous]";
    if (v22)
      v23 = v22;
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 40);
    *(_DWORD *)buf = 136446722;
    v29 = v23;
    v30 = 2080;
    v31 = v24;
    v32 = 1024;
    v33 = v11;
    v17 = "%{public}s: failed to map asset into memory: %s: %{darwin.errno}d";
    goto LABEL_7;
  }
  v20 = v19;
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, uint64_t))(a2 + 56))(a2, v9, a3 + 16);
  *(_QWORD *)(a3 + 8) = *(_QWORD *)a2;
  if (munmap(v20, st_size) == -1)
    cryptex_asset_create_generic_digest_cold_3(&v26, buf);
  return 0;
}

off_t cryptex_asset_len(off_t result, uint64_t a2)
{
  off_t v2;
  int v3;
  const char *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int *v10;
  stat v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  memset(&v11, 0, sizeof(v11));
  if (result)
  {
    v2 = result;
    v3 = *(_DWORD *)(result + 16);
    if (v3 < 0)
    {
      return 0;
    }
    else if (fstat(v3, &v11))
    {
      v5 = *(const char **)a2;
      v6 = *__error();
      v7 = *(NSObject **)(a2 + 16);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        if (!v5)
          v5 = "[anonymous]";
        v8 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
        v9 = *__error();
        *(_DWORD *)buf = 136446722;
        v13 = v5;
        v14 = 2080;
        v15 = v8;
        v16 = 1024;
        v17 = v9;
        _os_log_impl(&dword_211A95000, v7, OS_LOG_TYPE_ERROR, "%{public}s: fstat %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      v10 = __error();
      result = 0;
      *v10 = v6;
    }
    else
    {
      return v11.st_size;
    }
  }
  return result;
}

void cryptex_asset_destroy(_BYTE *a1)
{
  if (a1)
  {
    if ((*a1 & 1) == 0)
      close_drop_optional_np();
    free(a1);
  }
}

void cryptex_asset_array_destroy(uint64_t a1)
{
  uint64_t i;

  for (i = 0; i != 96; i += 8)
    cryptex_asset_destroy(*(_BYTE **)(a1 + i));
}

BOOL cryptex_asset_type_is_cryptex1(void *a1)
{
  return a1 == &_cryptex_asset_type_gdmg
      || a1 == &_cryptex_asset_type_gtgv
      || a1 == &_cryptex_asset_type_gtcd
      || a1 == &_cryptex_asset_type_ginf;
}

void *_cftag(uint64_t a1)
{
  CFStringRef v2;
  CFStringRef v3;
  const void *EntryNameForType;
  const void *v5;
  void *v6;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = CFStringCreateWithCString(0, *(const char **)(a1 + 40), 0x8000100u);
  if (!v2)
    _cftag_cold_1(&v8, v9);
  v3 = v2;
  EntryNameForType = (const void *)AMAuthInstallApImg4GetEntryNameForType();
  if (EntryNameForType && (v5 = EntryNameForType, !CFEqual(EntryNameForType, v3)))
  {
    v6 = (void *)CFRetain(v5);
  }
  else
  {
    v6 = (void *)CFStringCreateWithCString(0, *(const char **)(a1 + 48), 0x8000100u);
    if (!v6)
      _cftag_cold_1(&v8, v9);
  }
  CFRelease(v3);
  return v6;
}

uint64_t _shared_cdxn_stamp(uint64_t a1, uint64_t a2, __CFDictionary *a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  void *v11;
  char *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  CFTypeRef v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v10 = _cryptex_asset_generic_stamp(a1, a2, a3, &cf, (const char **)a5);
  if (!(_DWORD)v10)
  {
    v11 = _cftag(a6);
    v12 = *(char **)(a1 + 24);
    if (v12)
      _CFDictionarySetString((__CFDictionary *)cf, v11, v12);
    v13 = *(const char **)a5;
    v14 = *__error();
    v15 = *(NSObject **)(a5 + 16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = "[anonymous]";
      if (v13)
        v16 = v13;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 40);
      *(_DWORD *)buf = 136446722;
      v21 = v16;
      v22 = 2080;
      v23 = v17;
      v24 = 2112;
      v25 = cf;
      _os_log_impl(&dword_211A95000, v15, OS_LOG_TYPE_DEBUG, "%{public}s: %s image = %@", buf, 0x20u);
    }
    *__error() = v14;
    if (a4)
      *a4 = CFRetain(cf);
    if (v11)
      CFRelease(v11);
  }
  if (cf)
    os_release((void *)cf);
  return v10;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t _cryptex_base_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_base_alloc_cold_1();
  return result;
}

uint64_t _cryptex_core_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_core_alloc_cold_1();
  return result;
}

uint64_t _cryptex_core_cx1_properties_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_core_cx1_properties_alloc_cold_1();
  return result;
}

uint64_t _cryptex_host_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_host_alloc_cold_1();
  return result;
}

uint64_t _cryptex_magister_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_magister_alloc_cold_1();
  return result;
}

uint64_t _cryptex_signature_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_signature_alloc_cold_1();
  return result;
}

uint64_t _cryptex_scrivener_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_scrivener_alloc_cold_1();
  return result;
}

uint64_t _session_core_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _session_core_alloc_cold_1();
  return result;
}

uint64_t cryptex_core_parse_hdiid(char *a1, char **a2)
{
  char *v3;
  char *v4;
  uint64_t v5;
  char **v6;
  size_t v7;
  char *__stringp;

  __stringp = a1;
  v3 = strsep(&__stringp, ",");
  if (!v3)
    return 22;
  v4 = v3;
  v5 = 0;
  do
  {
    v6 = a2 + 1;
    switch(v5)
    {
      case 0:
        if (strcmp(v4, "cryptex"))
          return 22;
        break;
      case 1:
        goto LABEL_8;
      case 2:
        v6 = a2 + 2;
        goto LABEL_8;
      case 3:
        v7 = strlen(v4);
        v6 = a2 + 3;
        if (v7 != 96)
          return 22;
LABEL_8:
        *v6 = v4;
        break;
      default:
        break;
    }
    ++v5;
    v4 = strsep(&__stringp, ",");
  }
  while (v4);
  if (v5 == 4)
    return 0;
  else
    return 22;
}

char *cryptex_core_unparse_hdiid(const char **a1)
{
  char *v2;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  if (asprintf(&v2, "%s,%s,%s,%s", *a1, a1[1], a1[2], a1[3]) < 0)
    cryptex_core_unparse_hdiid_cold_1(&v3, v4);
  return v2;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2_2(_QWORD *a1, _OWORD *a2)
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

uint64_t _img4_get_nonce_domain_from_index(unint64_t a1)
{
  if (a1 > 0xA || a1 - 1 > 9)
    return 0;
  else
    return qword_24CCE30E8[a1 - 1];
}

void sub_211A9BE68(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_211A9C1D8(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_211A9C7E0(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_211A9D2B0(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

CryptexTSS *cryptex_tss_create(uint64_t a1)
{
  return -[CryptexTSS initWithFlags:]([CryptexTSS alloc], "initWithFlags:", a1);
}

void cryptex_tss_set_url(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURL:", v5);

}

void cryptex_tss_set_BOOL(void *a1, const char *a2, BOOL a3)
{
  id v5;

  objc_msgSend(a1, "tss_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v5, a2, a3);

}

void cryptex_tss_set_u32(void *a1, const char *a2, unsigned int a3)
{
  id v5;

  objc_msgSend(a1, "tss_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_int64(v5, a2, a3);

}

void cryptex_tss_set_u64(void *a1, const char *a2, int64_t a3)
{
  id v5;

  objc_msgSend(a1, "tss_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_int64(v5, a2, a3);

}

void cryptex_tss_set_dgst(void *a1, const char *a2, const void *a3, size_t a4)
{
  id v7;

  objc_msgSend(a1, "tss_request");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_data(v7, a2, a3, a4);

}

void cryptex_tss_set_data(void *a1, const char *a2, const void *a3, size_t a4)
{
  id v7;

  objc_msgSend(a1, "tss_request");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_data(v7, a2, a3, a4);

}

void cryptex_tss_set_string(void *a1, const char *a2, const char *a3)
{
  id v5;

  objc_msgSend(a1, "tss_request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v5, a2, a3);

}

void cryptex_tss_set_object_BOOL(void *a1, const char *a2, const char *a3, BOOL a4)
{
  void *v7;
  xpc_object_t xdict;

  objc_msgSend(a1, "tss_request");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_dictionary(xdict, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(xdict, a2, v7);
  }
  xpc_dictionary_set_BOOL(v7, a3, a4);

}

void cryptex_tss_set_object_dgst(void *a1, const char *a2, const char *a3, const void *a4, size_t a5)
{
  void *v9;
  xpc_object_t xdict;

  objc_msgSend(a1, "tss_request");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_dictionary(xdict, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(xdict, a2, v9);
  }
  xpc_dictionary_set_data(v9, a3, a4, a5);

}

void cryptex_tss_set_c411_from_file(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _OWORD v6[3];
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  if (_read_file(a2, v6))
    cryptex_tss_set_c411_from_file_cold_1(&v5, v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInfoData:", v4);
  buff_destroy(v6);

}

uint64_t cryptex_tss_set_im4m_array(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setManifestArray:", a2);
}

void cryptex_tss_submit(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a1;
  objc_msgSend(v5, "dq");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __cryptex_tss_submit_block_invoke;
  block[3] = &unk_24CCE3168;
  v9 = v5;
  v10 = a3;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __cryptex_tss_submit_block_invoke(uint64_t a1)
{
  void *v2;
  void (*v3)(void *, id, void *, _QWORD);
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tssSubmit");
  v2 = *(void **)(a1 + 32);
  v3 = *(void (**)(void *, id, void *, _QWORD))(a1 + 40);
  objc_msgSend(v2, "tssp_sign");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nserr");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3(v2, v5, v4, *(_QWORD *)(a1 + 48));

}

void cryptex_tss_async(void *a1, void *a2, void (__cdecl *a3)(void *))
{
  NSObject *v5;

  objc_msgSend(a1, "dq");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async_f(v5, a2, a3);

}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

char **cryptex_version_new(const char *a1)
{
  char **v2;
  char **v3;
  char *v4;
  uint64_t i;
  char *v6;
  int v7;
  char *v9;
  uint64_t v10;
  _OWORD v11[8];
  _OWORD v12[5];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  memset(v11, 0, sizeof(v11));
  v9 = (char *)v11;
  v2 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!v2)
    cryptex_version_new_cold_1(&v10, v12);
  v3 = v2;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v4 = strdup(a1);
      if (v4)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v4 = strdup(a1);
    if (!v4)
      cryptex_version_new_cold_2(a1, &v10, v12);
  }
  *v3 = v4;
  __strlcpy_chk();
  for (i = 8; i != 28; i += 4)
  {
    *(_QWORD *)&v12[0] = 0;
    v6 = strsep(&v9, ".");
    if (!v6)
      break;
    v7 = _strtou32(v6, (char **)v12, 10);
    if (*(_QWORD *)&v12[0] && **(_BYTE **)&v12[0])
      v7 = 0;
    *(_DWORD *)((char *)v3 + i) = v7;
  }
  return v3;
}

uint64_t cryptex_version_compare(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  BOOL v7;
  unsigned int v8;

  v2 = result;
  v3 = 8;
  while (1)
  {
    v4 = *(_DWORD *)(v2 + v3);
    v5 = *(_DWORD *)(a2 + v3);
    v6 = v4 == v5;
    v7 = v4 > v5;
    v8 = v4 < v5 ? -1 : result;
    result = v7 ? 1 : v8;
    if (!v6)
      break;
    v3 += 4;
    if (v3 == 28)
      return 0;
  }
  return result;
}

void cryptex_version_destroy(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*a1)
    free(*v2);
  free(v2);
  *a1 = 0;
}

uint64_t cryptex_system_cryptex_lookup_by_name(char *__s)
{
  uint64_t v1;

  v1 = _cryptex_system_cryptex_lookup((uint64_t)&cryptex_system_cryptexes_by_name, __s);
  if (v1)
    return v1 - 152;
  else
    return 0;
}

uint64_t _cryptex_system_cryptex_lookup(uint64_t a1, char *__s)
{
  if (_cryptex_system_cryptex_lookup_init_onceToken != -1)
    dispatch_once(&_cryptex_system_cryptex_lookup_init_onceToken, &__block_literal_global);
  return hash_lookup_cstr(a1, __s);
}

uint64_t cryptex_system_cryptex_lookup_by_graftpath(char *__s)
{
  uint64_t v1;

  v1 = _cryptex_system_cryptex_lookup((uint64_t)&cryptex_system_cryptexes_by_graftpath, __s);
  if (v1)
    return v1 - 184;
  else
    return 0;
}

uint64_t cryptex_system_cryptex_copy_launchjob_tag_for_name(char *__s)
{
  uint64_t result;
  const char *v2;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  result = _cryptex_system_cryptex_lookup((uint64_t)&cryptex_system_cryptexes_by_name, __s);
  if (result)
  {
    v2 = *(const char **)(result - 144);
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        result = (uint64_t)strdup(v2);
        if (result)
          break;
        __os_temporary_resource_shortage();
      }
    }
    else
    {
      result = (uint64_t)strdup(v2);
      if (!result)
        cryptex_system_cryptex_copy_launchjob_tag_for_name_cold_1(v2, &v3, v4);
    }
  }
  return result;
}

char *cryptex_system_cryptex_copy_graft_abspath(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  if (asprintf(&v2, "%s/%s", *(const char **)(a1 + 120), *(const char **)(a1 + 128)) < 0)
    cryptex_system_cryptex_copy_graft_abspath_cold_1(&v3, v4);
  return v2;
}

uint64_t ___cryptex_system_cryptex_lookup_init_block_invoke()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  hash_init(cryptex_system_cryptexes_by_name);
  hash_init(cryptex_system_cryptexes_by_graftpath);
  v0 = cryptex_system_cryptexes;
  v1 = cryptex_system_cryptexes + 152;
  v2 = cryptex_system_cryptexes + 184;
  hash_node_init_cstr((uint64_t)(cryptex_system_cryptexes + 152), *(char **)cryptex_system_cryptexes);
  hash_insert((uint64_t)cryptex_system_cryptexes_by_name, (uint64_t)v1);
  v3 = cryptex_system_cryptex_copy_graft_abspath((uint64_t)v0);
  hash_node_init_cstr((uint64_t)v2, v3);
  hash_insert((uint64_t)cryptex_system_cryptexes_by_graftpath, (uint64_t)v2);
  v4 = off_254ADD058;
  v5 = off_254ADD058 + 184;
  hash_node_init_cstr((uint64_t)(off_254ADD058 + 152), *(char **)off_254ADD058);
  hash_insert((uint64_t)cryptex_system_cryptexes_by_name, (uint64_t)(v4 + 152));
  v6 = cryptex_system_cryptex_copy_graft_abspath((uint64_t)v4);
  hash_node_init_cstr((uint64_t)v5, v6);
  return hash_insert((uint64_t)cryptex_system_cryptexes_by_graftpath, (uint64_t)v5);
}

void _cryptex_host_dealloc(uint64_t a1)
{
  object_proto_destroy(a1 + 16);
}

uint64_t cryptex_host_create(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v4 = _cryptex_host_alloc();
  v5 = v4;
  *(_QWORD *)(v4 + 40) = a2;
  if (!a1)
    goto LABEL_4;
  *(_OWORD *)(v4 + 48) = *(_OWORD *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v4 + 96) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v4 + 112) = v8;
  *(_OWORD *)(v4 + 64) = v6;
  *(_OWORD *)(v4 + 80) = v7;
  v9 = *(_OWORD *)(a1 + 80);
  v10 = *(_OWORD *)(a1 + 96);
  v11 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v4 + 160) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v4 + 176) = v11;
  *(_OWORD *)(v4 + 128) = v9;
  *(_OWORD *)(v4 + 144) = v10;
  *(_QWORD *)(v4 + 192) = v4 + 48;
  if (*(_QWORD *)(a1 + 8))
  {
    img4_chip_init_from_buff();
    v12 = img4_chip_custom();
  }
  else
  {
LABEL_4:
    if ((a2 & 3) == 3)
    {
      v12 = MEMORY[0x24BEDC3B8];
    }
    else
    {
      if ((a2 & 2) != 0)
        v12 = MEMORY[0x24BEDC3B0];
      else
        v12 = MEMORY[0x24BEDC3A8];
      if ((a2 & 3) == 0)
        v12 = img4_chip_select_personalized_ap();
    }
  }
  *(_QWORD *)(v5 + 1160) = v12;
  return v5;
}

uint64_t signature_metadata_read_from_file(int a1, _QWORD *a2)
{
  xpc_object_t v4;
  uint64_t v5;
  char v6;
  char v7;
  const char *v8;
  int v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  _OWORD value[16];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = v6;
    memset(value, 0, sizeof(value));
    v8 = _cs_metadata_keys[v5];
    if ((fgetxattr(a1, v8, value, 0x100uLL, 0, 2) & 0x8000000000000000) == 0)
      *__error() = 0;
    v9 = *__error();
    if (v9)
    {
      if (v9 == 93)
      {
        v11 = *__error();
        if (sig_metadata_log_onceToken != -1)
          dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
        v12 = sig_metadata_log_logHandle;
        if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_DEBUG))
        {
          v16 = 136315138;
          v17 = v8;
          _os_log_impl(&dword_211A95000, v12, OS_LOG_TYPE_DEBUG, "No xattr '%s'.", (uint8_t *)&v16, 0xCu);
        }
        *__error() = v11;
        v10 = 0;
        if (a2)
          *a2 = 0;
      }
      else
      {
        v10 = *__error();
        v13 = *__error();
        if (sig_metadata_log_onceToken != -1)
          dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
        v14 = sig_metadata_log_logHandle;
        if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_ERROR))
        {
          v16 = 136315394;
          v17 = v8;
          v18 = 1024;
          v19 = v10;
          _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_ERROR, "Failed to read xattr '%s'.: %{darwin.errno}d", (uint8_t *)&v16, 0x12u);
        }
        *__error() = v13;
      }
      goto LABEL_20;
    }
    xpc_dictionary_set_string(v4, v8, (const char *)value);
    v6 = 0;
    v5 = 1;
  }
  while ((v7 & 1) != 0);
  v10 = 0;
  if (a2)
  {
    *a2 = v4;
    return v10;
  }
LABEL_20:
  if (v4)
    os_release(v4);
  return v10;
}

uint64_t signature_metadata_read_from_cryptex(_QWORD *a1, _QWORD *a2)
{
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  const char **v14;
  void *v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
  {
    v10 = *__error();
    if (sig_metadata_log_onceToken != -1)
      dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
    v11 = sig_metadata_log_logHandle;
    if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = 12;
      _os_log_impl(&dword_211A95000, v11, OS_LOG_TYPE_ERROR, "Failed to create dictionary.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v10;
    v7 = 12;
    goto LABEL_16;
  }
  v5 = v4;
  v6 = cryptex_core_parse_info_asset(a1, (char **)&v15, (char ***)&v14, 0);
  if ((_DWORD)v6)
  {
    v7 = v6;
    v8 = *__error();
    if (sig_metadata_log_onceToken != -1)
      dispatch_once(&sig_metadata_log_onceToken, &__block_literal_global_0);
    v9 = sig_metadata_log_logHandle;
    if (os_log_type_enabled((os_log_t)sig_metadata_log_logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v7;
      _os_log_impl(&dword_211A95000, v9, OS_LOG_TYPE_ERROR, "Failed to extract cryptex identifier and version.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v8;
    goto LABEL_8;
  }
  v12 = *v14;
  xpc_dictionary_set_string(v5, "com.apple.CryptexIdentifier", (const char *)v15);
  xpc_dictionary_set_string(v5, "com.apple.CryptexVersion", v12);
  v7 = 0;
  if (a2)
  {
    *a2 = v5;
LABEL_16:
    cryptex_version_destroy((void ***)&v14);
    goto LABEL_17;
  }
LABEL_8:
  cryptex_version_destroy((void ***)&v14);
  os_release(v5);
LABEL_17:
  free(v15);
  return v7;
}

os_log_t __sig_metadata_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.libcryptex", "signature_metadata");
  sig_metadata_log_logHandle = (uint64_t)result;
  return result;
}

void _cryptex_magister_dealloc(uint64_t a1)
{
  void *v2;
  void *v3;

  os_release(*(void **)(a1 + 88));
  v2 = *(void **)(a1 + 96);
  if (v2)
    os_release(v2);
  v3 = *(void **)(a1 + 104);
  if (v3)
    os_release(v3);
  object_proto_destroy(a1 + 56);
}

uint64_t cryptex_magister_create(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = _cryptex_magister_alloc();
  *(_QWORD *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 88) = os_retain(a1);
  v5 = (void *)a1[20];
  if (v5)
    *(_QWORD *)(v4 + 96) = os_retain(v5);
  v6 = (void *)a1[21];
  if (v6)
    *(_QWORD *)(v4 + 104) = os_retain(v6);
  *(_WORD *)(v4 + 120) = 0;
  *(_DWORD *)(v4 + 172) = 48;
  object_proto_init(v4 + 56, (int)"com.apple.security.libcryptex.core", "magister");
  cryptex_init(v4, 0, (uint64_t)_cryptex_magister_init, 0);
  return v4;
}

void _cryptex_magister_init(_QWORD *a1)
{
  uint64_t v2;
  const char *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  int v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  int nonce_domain;
  int v25;
  const char *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t asset;
  uint64_t v38;
  int file;
  const char *v40;
  const char *v41;
  int v42;
  int v43;
  const char *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *object;
  __n128 v51[3];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t v57[4];
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v52 = 0;
  memset(v51, 0, sizeof(v51));
  v49 = 0;
  object = 0;
  v48 = MEMORY[0x24BEDC3C0];
  v2 = a1[13];
  if (v2 && (*(_BYTE *)(v2 + 40) & 1) != 0)
  {
    v3 = (const char *)a1[7];
    v4 = *__error();
    v5 = a1[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = "[anonymous]";
      if (v3)
        v6 = v3;
      *(_DWORD *)buf = 136446210;
      v63 = v6;
      _os_log_impl(&dword_211A95000, v5, OS_LOG_TYPE_DEBUG, "%{public}s: checking for supplemental fallback", buf, 0xCu);
    }
    *__error() = v4;
    v8 = a1[11];
    v7 = a1[12];
    v10 = *(_QWORD *)(v7 + 56);
    v9 = *(_QWORD *)(v7 + 64);
    v53 = 0;
    v54 = v10;
    v55 = v9;
    v56 = 0;
    if ((*(_BYTE *)(v8 + 40) & 1) == 0)
    {
      bzero(buf, 0x600uLL);
      img4_firmware_init_from_buff();
      img4_firmware_init_sentinel();
      img4_firmware_attach_manifest();
      v59 = *(_QWORD *)(a1[13] + 1160);
      v60 = img4_chip_select_personalized_ap();
      v61 = MEMORY[0x24BEDC3B0];
      v11 = img4_firmware_select_chip();
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)(a1[13] + 1160);
        v14 = (const char *)a1[7];
        v15 = *__error();
        v16 = a1[9];
        if (v12 == v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v23 = "[anonymous]";
            if (v14)
              v23 = v14;
            *(_DWORD *)v57 = 136446210;
            v58 = v23;
            _os_log_impl(&dword_211A95000, v16, OS_LOG_TYPE_DEBUG, "%{public}s: validated supplemental environment", v57, 0xCu);
          }
          *__error() = v15;
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = "[anonymous]";
            if (v14)
              v17 = v14;
            *(_DWORD *)v57 = 136446210;
            v58 = v17;
            _os_log_impl(&dword_211A95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: falling back from supplemental", v57, 0xCu);
          }
          *__error() = v15;
          v18 = a1[13];
          *(_QWORD *)(v18 + 1160) = v12;
          *(_QWORD *)(v18 + 40) &= ~1uLL;
        }
      }
      else
      {
        v19 = (const char *)a1[7];
        v20 = *__error();
        v21 = a1[9];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = "[anonymous]";
          if (v19)
            v22 = v19;
          *(_DWORD *)v57 = 136446210;
          v58 = v22;
          _os_log_impl(&dword_211A95000, v21, OS_LOG_TYPE_ERROR, "%{public}s: unable to detect chip environment, proceeding anyway", v57, 0xCu);
        }
        *__error() = v20;
      }
    }
  }
  a1[14] = _cryptex_magister_select_chip((uint64_t)a1);
  nonce_domain = cryptex_core_get_nonce_domain((_QWORD *)a1[11], &v48);
  if (nonce_domain)
  {
    v25 = nonce_domain;
    v26 = (const char *)a1[7];
    v27 = *__error();
    v28 = a1[9];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = "[anonymous]";
      if (v26)
        v29 = v26;
      *(_DWORD *)buf = 136446466;
      v63 = v29;
      v64 = 1024;
      LODWORD(v65) = v25;
      v30 = "%{public}s: failed to get nonce domain from core: %{darwin.errno}d";
LABEL_44:
      _os_log_impl(&dword_211A95000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0x12u);
      goto LABEL_45;
    }
    goto LABEL_45;
  }
  v25 = cryptex_core_copy_nonce_domain_desc((_QWORD *)a1[11], (char **)&v49);
  v31 = (const char *)a1[7];
  v27 = *__error();
  v28 = a1[9];
  if (v25)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = "[anonymous]";
      if (v31)
        v32 = v31;
      *(_DWORD *)buf = 136446466;
      v63 = v32;
      v64 = 1024;
      LODWORD(v65) = v25;
      v30 = "%{public}s: failed to get nonce domain description from core: %{darwin.errno}d";
      goto LABEL_44;
    }
LABEL_45:
    *__error() = v27;
    goto LABEL_46;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v33 = "[anonymous]";
    if (v31)
      v33 = v31;
    *(_DWORD *)buf = 136446466;
    v63 = v33;
    v64 = 2082;
    v65 = v49;
    _os_log_impl(&dword_211A95000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s: authenticating using nonce from %{public}s", buf, 0x16u);
  }
  *__error() = v27;
  v34 = img4_nonce_domain_copy_nonce();
  if (v34)
  {
    v25 = v34;
    v35 = (const char *)a1[7];
    v27 = *__error();
    v28 = a1[9];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v36 = "[anonymous]";
      if (v35)
        v36 = v35;
      *(_DWORD *)buf = 136446466;
      v63 = v36;
      v64 = 1024;
      LODWORD(v65) = v25;
      v30 = "%{public}s: copying cryptex nonce failed: %{darwin.errno}d";
      goto LABEL_44;
    }
    goto LABEL_45;
  }
  if (a1[12])
  {
    v25 = 0;
  }
  else
  {
    asset = cryptex_core_get_asset(a1[11], (uint64_t)&_cryptex_asset_type_im4m);
    if (!asset)
      _cryptex_magister_init_cold_1();
    v38 = asset;
    file = _read_file(*(_DWORD *)(asset + 16), v51);
    if (file)
    {
      v25 = file;
      v40 = (const char *)a1[7];
      v27 = *__error();
      v28 = a1[9];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      v41 = "[anonymous]";
      if (v40)
        v41 = v40;
      *(_DWORD *)buf = 136446466;
      v63 = v41;
      v64 = 1024;
      LODWORD(v65) = v25;
      v30 = "%{public}s: read im4m: %{darwin.errno}d";
      goto LABEL_44;
    }
    v42 = signature_metadata_read_from_file(*(_DWORD *)(v38 + 16), &object);
    if (v42)
    {
      v43 = v42;
      v44 = (const char *)a1[7];
      v45 = *__error();
      v46 = a1[9];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = "[anonymous]";
        if (v44)
          v47 = v44;
        *(_DWORD *)buf = 136446466;
        v63 = v47;
        v64 = 1024;
        LODWORD(v65) = v43;
        _os_log_impl(&dword_211A95000, v46, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load metadata for Image4 manifest.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v45;
    }
    v25 = 0;
    a1[12] = cryptex_signature_create(v51, 0, object);
  }
LABEL_46:
  cryptex_set_error((uint64_t)a1, v25);
  buff_destroy(v51);
  free(v49);
  if (object)
    os_release(object);
}

void cryptex_magister_authenticate(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  v8 = ctx_new(a1, 0x80uLL);
  v8[3] = cryptex_core_get_asset(a1[11], a2);
  v8[14] = a3;
  v8[15] = a4;
  cryptex_async_f((uint64_t)a1, v8, (void (__cdecl *)(void *))_cryptex_magister_authenticate_continue);
}

void _cryptex_magister_authenticate_continue(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  char *v7;
  CFErrorRef Error;

  v2 = *a1;
  v3 = a1[3];
  v4 = _cryptex_magister_select_chip(*a1);
  if ((**(_QWORD **)(v3 + 8) & 8) != 0)
    v5 = _cryptex_magister_authenticate_toutoc((_QWORD *)v2, v4, v3, (uint64_t)a1);
  else
    v5 = (uint64_t)_cryptex_magister_authenticate(v2, v4, v3, (uint64_t)a1);
  if (v5)
  {
    v6 = (const void *)v5;
    if (*(_QWORD *)(v2 + 72))
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    v7 = (char *)_os_log_send_and_compose_impl();
    Error = createError("_cryptex_magister_authenticate_continue", "magister.c", 378, "com.apple.security.cryptex", 12, v6, v7);
    free(v7);
    a1[2] = (uint64_t)Error;
    cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_magister_authenticate_callback);
    CFRelease(v6);
  }
  else
  {
    a1[2] = 0;
    cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_magister_authenticate_callback);
  }
}

void cryptex_magister_record_property(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  v8 = ctx_new(a1, 0x88uLL);
  v8[3] = a2;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_BYTE *)v8 + 96) = 0;
  v8[13] = 0;
  v8[14] = 0;
  v8[15] = a3;
  v8[16] = a4;
  cryptex_async_f((uint64_t)a1, v8, (void (__cdecl *)(void *))_cryptex_magister_record_property_continue);
}

void _cryptex_magister_record_property_continue(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  _BOOL4 is_cryptex1;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  int v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  CFErrorRef Error;
  const char *v25;
  const char *v26;
  char *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a1[3];
  v4 = *(_QWORD *)(*a1 + 96);
  v5 = *(const char **)(*a1 + 56);
  v6 = *__error();
  v7 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = "[anonymous]";
    v9 = *(const char **)(v4 + 64);
    if (v5)
      v8 = v5;
    *(_DWORD *)buf = 136446466;
    v29 = v8;
    v30 = 2048;
    v31 = v9;
    _os_log_impl(&dword_211A95000, v7, OS_LOG_TYPE_INFO, "%{public}s: im4m buff len: %zu", buf, 0x16u);
  }
  *__error() = v6;
  is_cryptex1 = cryptex_core_is_cryptex1(*(_QWORD **)(v2 + 88));
  v11 = *(_QWORD *)(v2 + 104);
  if (!v11 || (*(_BYTE *)(v11 + 40) & 1) == 0)
  {
    if (cryptex_core_is_cryptex1(*(_QWORD **)(v2 + 88)))
    {
      v12 = 3;
LABEL_19:
      v15 = *(const char **)(v2 + 56);
      v16 = *__error();
      v17 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = "[anonymous]";
        if (v15)
          v18 = v15;
        *(_DWORD *)buf = 136446722;
        v29 = v18;
        if (is_cryptex1)
          v19 = "CRYPTEX1";
        else
          v19 = "AP";
        v30 = 2082;
        v31 = v19;
        v32 = 2048;
        v33 = v12;
        _os_log_impl(&dword_211A95000, v17, OS_LOG_TYPE_INFO, "%{public}s: Authenticating with coprocessor %{public}s and handle %llu", buf, 0x20u);
      }
      *__error() = v16;
      goto LABEL_27;
    }
    v13 = *(_QWORD *)(v2 + 88);
    v14 = *(void **)(v13 + 176);
    if (v14 == &_cryptex_asset_type_cpxd)
    {
      v12 = 5;
      goto LABEL_19;
    }
    if (v14 == &_cryptex_asset_type_pdmg)
    {
      if (*(_QWORD *)(v13 + 56) == 2)
        v12 = 9;
      else
        v12 = 4;
      goto LABEL_19;
    }
LABEL_15:
    v12 = 4;
    goto LABEL_19;
  }
  if (cryptex_core_is_cryptex1(*(_QWORD **)(v2 + 88)))
    goto LABEL_15;
  if (*(_UNKNOWN **)(*(_QWORD *)(v2 + 88) + 176) != &_cryptex_asset_type_cpxd)
  {
    v12 = 7;
    goto LABEL_19;
  }
  if (*(_QWORD *)(v2 + 72))
  {
    os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    v25 = *(const char **)(v2 + 56);
    if (!v25)
      v25 = "[anonymous]";
    *(_DWORD *)buf = 136446210;
    v29 = v25;
  }
  else
  {
    v26 = *(const char **)(v2 + 56);
    if (!v26)
      v26 = "[anonymous]";
    *(_DWORD *)buf = 136446210;
    v29 = v26;
  }
  v27 = (char *)_os_log_send_and_compose_impl();
  Error = createError("_cryptex_magister_select_image4_coproc_and_handle", "magister.c", 455, "com.apple.security.cryptex", 10, 0, v27);
  free(v27);
  if (Error)
  {
    image4_environment_destroy();
LABEL_42:
    a1[2] = (uint64_t)CFRetain(Error);
    cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_magister_record_property_callback);
    CFRelease(Error);
    return;
  }
LABEL_27:
  image4_environment_new();
  image4_trust_new();
  v20 = *(_DWORD *)(v3 + 32);
  switch(v20)
  {
    case 2:
      image4_trust_record_property_integer();
      v21 = 8;
      goto LABEL_32;
    case 1:
      image4_trust_record_property_data();
      goto LABEL_34;
    case 0:
      image4_trust_record_property_BOOL();
      v21 = 1;
LABEL_32:
      a1[14] = v21;
LABEL_34:
      image4_trust_evaluate();
      image4_environment_destroy();
      return;
  }
  if (*(_QWORD *)(v2 + 72))
  {
    os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    v22 = *(const char **)(v2 + 56);
    if (!v22)
      v22 = "[anonymous]";
  }
  else
  {
    v22 = *(const char **)(v2 + 56);
    if (!v22)
      v22 = "[anonymous]";
  }
  *(_DWORD *)buf = 136446466;
  v29 = v22;
  v30 = 1024;
  LODWORD(v31) = v20;
  v23 = (char *)_os_log_send_and_compose_impl();
  Error = createError("_cryptex_magister_record_property_continue", "magister.c", 548, "com.apple.security.cryptex", 11, 0, v23);
  free(v23);
  image4_environment_destroy();
  if (Error)
    goto LABEL_42;
}

uint64_t _cryptex_magister_select_chip(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 104);
  if (v1)
    return *(_QWORD *)(v1 + 1160);
  if (cryptex_core_is_cryptex1(*(_QWORD **)(a1 + 88)))
    return MEMORY[0x24BEDC3B0];
  return img4_chip_select_personalized_ap();
}

uint64_t _cryptex_magister_authenticate_toutoc(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  off_t v16;
  uint64_t v17;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a1[12];
  v9 = *(_QWORD *)(v7 + 56);
  v8 = *(_QWORD *)(v7 + 64);
  v21 = 0;
  v22 = v9;
  v23 = v8;
  v24 = 0;
  v19[3] = a4;
  v20 = 0;
  v19[2] = _cryptex_magister_firmware_execute_toutoc;
  v19[1] = 1;
  v10 = (const char *)a1[7];
  v11 = *__error();
  v12 = a1[9];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = "[anonymous]";
    if (v10)
      v13 = v10;
    v14 = *(_QWORD *)(*(_QWORD *)(a3 + 8) + 40);
    v15 = *(_DWORD *)(a3 + 16);
    *(_DWORD *)buf = 136446722;
    v26 = v13;
    v27 = 2082;
    v28 = v14;
    v29 = 1024;
    v30 = v15;
    _os_log_impl(&dword_211A95000, v12, OS_LOG_TYPE_DEBUG, "%{public}s: authenticating asset [toutoc]: 4cc = %{public}s, fd = %d", buf, 0x1Cu);
  }
  *__error() = v11;
  v16 = lseek(*(_DWORD *)(a3 + 16), 0, 1);
  *(_QWORD *)(a4 + 104) = v16;
  if (v16 == -1)
    _cryptex_magister_authenticate_toutoc_cold_1(v19, buf);
  *(_DWORD *)buf = dup_np();
  if ((*(_BYTE *)(a1[11] + 40) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    v20 = img4_firmware_new_from_fd_4MSM();
    img4_firmware_attach_manifest();
    img4_firmware_execute();
    v17 = *(_QWORD *)(a4 + 16);
  }
  img4_firmware_destroy();
  return v17;
}

CFErrorRef _cryptex_magister_authenticate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int file;
  int v17;
  const char *v18;
  const char *v19;
  CFErrorRef Error;
  const char *v21;
  char *v22;
  CFIndex v23;
  const char *v24;
  int v25;
  const char *v26;
  _OWORD v28[3];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(v5 + 56);
  v6 = *(_QWORD *)(v5 + 64);
  v30 = 0;
  v31 = v7;
  v32 = v6;
  v33 = 0;
  v29 = 0;
  memset(v28, 0, sizeof(v28));
  if (!v6)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      v19 = *(const char **)(a1 + 56);
      if (!v19)
        v19 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v35 = v19;
    }
    else
    {
      v26 = *(const char **)(a1 + 56);
      if (!v26)
        v26 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v35 = v26;
    }
    v22 = (char *)_os_log_send_and_compose_impl();
    v24 = "com.apple.security.cryptex";
    v25 = 184;
    v23 = 12;
    goto LABEL_25;
  }
  v10 = *(const char **)(a1 + 56);
  v11 = *__error();
  v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = "[anonymous]";
    if (v10)
      v13 = v10;
    v14 = *(_QWORD *)(*(_QWORD *)(a3 + 8) + 40);
    v15 = *(_DWORD *)(a3 + 16);
    *(_DWORD *)buf = 136446722;
    v35 = v13;
    v36 = 2082;
    v37 = v14;
    v38 = 1024;
    v39 = v15;
    _os_log_impl(&dword_211A95000, v12, OS_LOG_TYPE_DEBUG, "%{public}s: authenticating asset: 4cc = %{public}s, fd = %d", buf, 0x1Cu);
  }
  *__error() = v11;
  file = _read_file(*(_DWORD *)(a3 + 16), v28);
  if (file)
  {
    v17 = file;
    if (*(_QWORD *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      v18 = *(const char **)(a1 + 56);
      if (!v18)
        v18 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v35 = v18;
      v36 = 1024;
      LODWORD(v37) = v17;
    }
    else
    {
      v21 = *(const char **)(a1 + 56);
      if (!v21)
        v21 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v35 = v21;
      v36 = 1024;
      LODWORD(v37) = file;
    }
    v22 = (char *)_os_log_send_and_compose_impl();
    v23 = v17;
    v24 = "com.apple.security.cryptex.posix";
    v25 = 194;
LABEL_25:
    Error = createError("_cryptex_magister_authenticate", "magister.c", v25, v24, v23, 0, v22);
    free(v22);
    goto LABEL_26;
  }
  *(_QWORD *)(a4 + 32) = v28;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 88) + 40) & 1) != 0)
  {
    Error = 0;
  }
  else
  {
    img4_firmware_new();
    img4_firmware_attach_manifest();
    img4_firmware_execute();
    Error = *(CFErrorRef *)(a4 + 16);
  }
LABEL_26:
  buff_destroy(v28);
  img4_firmware_destroy();
  return Error;
}

void _cryptex_magister_authenticate_callback(void **a1)
{
  const void *v2;
  _QWORD *v3;

  v2 = a1[2];
  v3 = a1[12];
  ((void (*)(void *, _QWORD, void *, void *, void *))a1[15])(*a1, *((_QWORD *)a1[3] + 1), a1[12], a1[2], a1[14]);
  buff_destroy(v3);
  ctx_destroy(a1);
  if (v2)
    CFRelease(v2);
}

void _cryptex_magister_firmware_execute_toutoc(int a1, uint64_t a2, int a3, _QWORD *a4)
{
  uint64_t v5;
  off_t v6;
  uint64_t v7;
  CFErrorRef v8;
  CFErrorRef v9;
  const char *v10;
  const char *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  CFErrorRef Error;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a2)
    _cryptex_magister_firmware_execute_toutoc_cold_2();
  v5 = a4[3];
  v6 = a4[13];
  v7 = *a4;
  v8 = _cryptex_magister_firmware_execute_cferr(a3, *(os_log_t *)(*a4 + 72));
  if (v8)
  {
    v9 = v8;
    if (*(_QWORD *)(v7 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v7 + 72), OS_LOG_TYPE_ERROR);
      v10 = *(const char **)(v7 + 56);
      if (!v10)
        v10 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v21 = v10;
    }
    else
    {
      v16 = *(const char **)(v7 + 56);
      if (!v16)
        v16 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v21 = v16;
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    Error = createError("_cryptex_magister_firmware_execute_toutoc", "magister.c", 246, "com.apple.security.cryptex", 12, v9, v17);
    free(v17);
    a4[2] = Error;
    CFRelease(v9);
  }
  else
  {
    v11 = *(const char **)(v7 + 56);
    v12 = *__error();
    v13 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = "[anonymous]";
      if (v11)
        v14 = v11;
      v15 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 40);
      *(_DWORD *)buf = 136446466;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      _os_log_impl(&dword_211A95000, v13, OS_LOG_TYPE_DEBUG, "%{public}s: executing image: %{public}s", buf, 0x16u);
    }
    *__error() = v12;
    if (lseek(*(_DWORD *)(v5 + 16), v6, 0) == -1)
      _cryptex_magister_firmware_execute_toutoc_cold_1(&v19, buf);
    a4[2] = 0;
  }
}

CFErrorRef _cryptex_magister_firmware_execute_cferr(int a1, os_log_t oslog)
{
  CFErrorRef Error;
  char *v4;
  int v5;
  CFIndex v6;

  if (a1 > 69)
  {
    if (a1 <= 79)
    {
      if (a1 == 70)
      {
        if (oslog)
          os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
        v4 = (char *)_os_log_send_and_compose_impl();
        v5 = 78;
        v6 = 70;
        goto LABEL_41;
      }
      if (a1 == 79)
      {
        if (oslog)
          os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
        v4 = (char *)_os_log_send_and_compose_impl();
        v5 = 88;
        v6 = 79;
        goto LABEL_41;
      }
    }
    else
    {
      switch(a1)
      {
        case 'P':
          if (oslog)
            os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
          v4 = (char *)_os_log_send_and_compose_impl();
          v5 = 95;
          v6 = 80;
          goto LABEL_41;
        case 'R':
          if (oslog)
            os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
          v4 = (char *)_os_log_send_and_compose_impl();
          v5 = 81;
          v6 = 82;
          goto LABEL_41;
        case '\\':
          if (oslog)
            os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
          v4 = (char *)_os_log_send_and_compose_impl();
          v5 = 84;
          v6 = 92;
LABEL_41:
          Error = createError("_cryptex_magister_firmware_execute_cferr", "magister.c", v5, "com.apple.security.cryptex.posix", v6, 0, v4);
          free(v4);
          return Error;
      }
    }
LABEL_30:
    if (oslog)
      os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
    v4 = (char *)_os_log_send_and_compose_impl();
    v6 = a1;
    v5 = 107;
    goto LABEL_41;
  }
  if (a1 > 7)
  {
    if (a1 == 8)
    {
      if (oslog)
        os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      v4 = (char *)_os_log_send_and_compose_impl();
      v5 = 104;
      v6 = 8;
      goto LABEL_41;
    }
    if (a1 == 13)
    {
      if (oslog)
        os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      v4 = (char *)_os_log_send_and_compose_impl();
      v5 = 99;
      v6 = 13;
      goto LABEL_41;
    }
    goto LABEL_30;
  }
  if (a1)
  {
    if (a1 == 2)
    {
      if (oslog)
        os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
      v4 = (char *)_os_log_send_and_compose_impl();
      v5 = 92;
      v6 = 2;
      goto LABEL_41;
    }
    goto LABEL_30;
  }
  return 0;
}

void _cryptex_magister_firmware_execute(int a1, int a2, int a3, uint64_t *a4)
{
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  CFErrorRef v8;
  CFErrorRef v9;
  const char *v10;
  uint64_t bytes;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  char *v20;
  CFErrorRef Error;
  _OWORD buf[5];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = *a4;
  v7 = a4[3];
  v6 = (__n128 *)a4[4];
  v8 = _cryptex_magister_firmware_execute_cferr(a3, *(os_log_t *)(*a4 + 72));
  if (v8)
  {
    v9 = v8;
    if (*(_QWORD *)(v5 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
      v10 = *(const char **)(v5 + 56);
      if (!v10)
        v10 = "[anonymous]";
      LODWORD(buf[0]) = 136446210;
      *(_QWORD *)((char *)buf + 4) = v10;
    }
    else
    {
      v19 = *(const char **)(v5 + 56);
      if (!v19)
        v19 = "[anonymous]";
      LODWORD(buf[0]) = 136446210;
      *(_QWORD *)((char *)buf + 4) = v19;
    }
    v20 = (char *)_os_log_send_and_compose_impl();
    Error = createError("_cryptex_magister_firmware_execute", "magister.c", 131, "com.apple.security.cryptex", 12, v9, v20);
    free(v20);
    a4[2] = (uint64_t)Error;
    CFRelease(v9);
  }
  else
  {
    bytes = img4_image_get_bytes();
    v12 = *(const char **)(v5 + 56);
    v13 = *__error();
    v14 = *(NSObject **)(v5 + 72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = "[anonymous]";
      if (v12)
        v15 = v12;
      v16 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40);
      LODWORD(buf[0]) = 136446466;
      *(_QWORD *)((char *)buf + 4) = v15;
      WORD6(buf[0]) = 2082;
      *(_QWORD *)((char *)buf + 14) = v16;
      _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: executing image: %{public}s", (uint8_t *)buf, 0x16u);
    }
    *__error() = v13;
    v17 = *(_QWORD *)(bytes + 8) - v6->n128_u64[0];
    if (v17 < 0 || (v18 = *(_QWORD *)(bytes + 16), v18 > v6->n128_u64[1]))
    {
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
    else
    {
      buff_xfer_subrange((__n128 *)(a4 + 5), v6, v17, v18);
      a4[12] = (uint64_t)(a4 + 5);
      a4[2] = 0;
    }
  }
}

void _cryptex_magister_record_property_continue2(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __n128 *a5)
{
  uint64_t v6;
  const char *v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  void *v12;
  const char *v13;
  char *v14;
  CFIndex v15;
  const char *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  unint64_t v26;
  const char *v27;
  const char *v28;
  unint64_t v29;
  const char *v30;
  CFErrorRef Error;
  void *__dst[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)__dst = 0u;
  v6 = a5->n128_u64[0];
  if (a4)
  {
    if (*(_QWORD *)(v6 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 72), OS_LOG_TYPE_ERROR);
      v8 = *(const char **)(v6 + 56);
      if (!v8)
        v8 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v38 = v8;
      v39 = 1024;
      LODWORD(v40) = a4;
    }
    else
    {
      v13 = *(const char **)(v6 + 56);
      if (!v13)
        v13 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v38 = v13;
      v39 = 1024;
      LODWORD(v40) = a4;
    }
    v14 = (char *)_os_log_send_and_compose_impl();
    v15 = a4;
    v16 = "com.apple.security.cryptex.posix";
    v17 = 403;
  }
  else
  {
    v9 = a5[1].n128_u64[1];
    v10 = *(_QWORD *)(v9 + 24);
    if (_dispatch_is_multithreaded())
    {
      v11 = malloc_type_calloc(1uLL, v10, 0x1B044E25uLL);
      if (!v11)
      {
        do
        {
          __os_temporary_resource_shortage();
          v12 = malloc_type_calloc(1uLL, v10, 0x1B044E25uLL);
        }
        while (!v12);
        v11 = v12;
      }
    }
    else
    {
      v11 = malloc_type_calloc(1uLL, v10, 0x61D5536CuLL);
      if (!v11)
        _cryptex_magister_record_property_continue2_cold_1(&v36, buf);
    }
    buff_init(__dst, 0, (uint64_t)_buff_destructor_free, (uint64_t)v11, *(_QWORD *)(v9 + 24));
    v18 = a5[7].n128_u64[0];
    v19 = *(_QWORD *)(v9 + 24);
    if (v18 == v19)
    {
      v20 = a5[6].n128_u64[1];
      v21 = *(const char **)(v6 + 56);
      v22 = *__error();
      v23 = *(NSObject **)(v6 + 72);
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v18 && v20)
      {
        if (v24)
        {
          v25 = "[anonymous]";
          v26 = *(_QWORD *)(v9 + 8);
          if (v21)
            v25 = v21;
          *(_DWORD *)buf = 136446466;
          v38 = v25;
          v39 = 2082;
          v40 = v26;
          _os_log_impl(&dword_211A95000, v23, OS_LOG_TYPE_INFO, "%{public}s: Successfully read property '%{public}s' from im4m", buf, 0x16u);
        }
        *__error() = v22;
        memcpy(__dst[0], (const void *)a5[6].n128_u64[1], a5[7].n128_u64[0]);
        buff_xfer(a5 + 2, (__n128 *)__dst);
      }
      else
      {
        if (v24)
        {
          v28 = "[anonymous]";
          v29 = *(_QWORD *)(v9 + 8);
          if (v21)
            v28 = v21;
          *(_DWORD *)buf = 136446466;
          v38 = v28;
          v39 = 2082;
          v40 = v29;
          _os_log_impl(&dword_211A95000, v23, OS_LOG_TYPE_INFO, "%{public}s: Property '%{public}s' not found in im4m", buf, 0x16u);
        }
        *__error() = v22;
      }
      buff_destroy(__dst);
      goto LABEL_39;
    }
    if (*(_QWORD *)(v6 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 72), OS_LOG_TYPE_ERROR);
      v27 = *(const char **)(v6 + 56);
      *(_DWORD *)buf = 136446722;
      if (!v27)
        v27 = "[anonymous]";
      v38 = v27;
      v39 = 2048;
      v40 = v18;
      v41 = 2048;
      v42 = v19;
    }
    else
    {
      v30 = "[anonymous]";
      if (*(_QWORD *)(v6 + 56))
        v30 = *(const char **)(v6 + 56);
      *(_DWORD *)buf = 136446722;
      v38 = v30;
      v39 = 2048;
      v40 = v18;
      v41 = 2048;
      v42 = v19;
    }
    v14 = (char *)_os_log_send_and_compose_impl();
    v16 = "com.apple.security.cryptex";
    v17 = 411;
    v15 = 24;
  }
  Error = createError("_cryptex_magister_record_property_continue2", "magister.c", v17, v16, v15, 0, v14);
  free(v14);
  buff_destroy(__dst);
  if (Error)
  {
    a5[1].n128_u64[0] = (unint64_t)CFRetain(Error);
    cryptex_target_async_f(v6, a5, (void (__cdecl *)(void *))_cryptex_magister_record_property_callback);
    CFRelease(Error);
    return;
  }
LABEL_39:
  a5[1].n128_u64[0] = 0;
  cryptex_target_async_f(v6, a5, (void (__cdecl *)(void *))_cryptex_magister_record_property_callback);
}

void _cryptex_magister_record_property_callback(uint64_t a1)
{
  void *v2;
  const void *v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(const void **)(a1 + 16);
  if (*(_QWORD *)(a1 + 32))
    v4 = a1 + 32;
  else
    v4 = 0;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD))(a1 + 128))(v2, v4, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 120));
  buff_destroy((_QWORD *)(a1 + 32));
  ctx_destroy((void **)a1);
  if (v3)
    CFRelease(v3);
}

void _cryptex_signature_dealloc(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 264);
  if (v2)
    os_release(v2);
  buff_destroy((_QWORD *)(a1 + 56));
  object_proto_destroy(a1 + 16);
}

uint64_t cryptex_signature_seal()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t Errno;
  int v5;
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = os_log_create("com.apple.libcryptex", "signature");
  v9 = xmmword_211AABDB0;
  v10 = xmmword_211AABDA0;
  v1 = aks_sealed_hashes_set();
  if ((_DWORD)v1 != -28)
  {
    v2 = v1;
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == -31)
        cryptex_signature_seal_cold_1();
      v3 = *__error();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      {
        v7 = 67109120;
        v8 = v2;
        _os_log_impl(&dword_211A95000, v0, OS_LOG_TYPE_ERROR, "aks_sealed_hashes_set: %#x", (uint8_t *)&v7, 8u);
      }
      *__error() = v3;
      _IOErrorGetErrno(v2);
    }
  }
  Errno = aks_seal_cryptex_manifest_lock();
  if ((_DWORD)Errno)
  {
    v5 = *__error();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      v7 = 67109120;
      v8 = Errno;
      _os_log_impl(&dword_211A95000, v0, OS_LOG_TYPE_ERROR, "aks_seal_cryptex_manifest_lock: %#x", (uint8_t *)&v7, 8u);
    }
    *__error() = v5;
    Errno = _IOErrorGetErrno(Errno);
  }
  if (v0)
    os_release(v0);
  return Errno;
}

uint64_t cryptex_signature_create(__n128 *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  xpc_object_t v7;

  v6 = _cryptex_signature_alloc();
  *(_QWORD *)(v6 + 40) = a2;
  if (a3)
    v7 = xpc_retain(a3);
  else
    v7 = 0;
  *(_QWORD *)(v6 + 264) = v7;
  buff_xfer((__n128 *)(v6 + 56), a1);
  if (*(uint64_t (**)(void *, size_t))(v6 + 96) == _buff_destructor_munmap)
    cryptex_signature_create_cold_1();
  *(_QWORD *)(v6 + 48) = ccsha384_di();
  _cryptex_signature_compute_hash(v6);
  object_proto_init(v6 + 16, (int)"com.apple.security.libcryptex.core", "signature");
  return v6;
}

int *_cryptex_signature_compute_hash(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  size_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  int *result;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _WORD v21[41];

  *(_QWORD *)&v21[37] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 48);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v16 - v3, v4);
  if (*v2 >= 0x31uLL)
    _cryptex_signature_compute_hash_cold_1(&v17, buf);
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 56))();
  v5 = *(const char **)(a1 + 16);
  v6 = *__error();
  v7 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
      v8 = v5;
    else
      v8 = "[anonymous]";
    v9 = **(_QWORD **)(a1 + 48);
    *(_DWORD *)buf = 136446722;
    v19 = v8;
    v20 = 1040;
    *(_DWORD *)v21 = v9;
    v21[2] = 2096;
    *(_QWORD *)&v21[3] = a1 + 112;
    _os_log_impl(&dword_211A95000, v7, OS_LOG_TYPE_DEBUG, "%{public}s: computed manifest hash: %.*P", buf, 0x1Cu);
  }
  *__error() = v6;
  v10 = a1 + 160;
  _sprintdgst(a1 + 160, (unsigned __int8 *)(a1 + 112), **(_QWORD **)(a1 + 48));
  v11 = *(const char **)(a1 + 16);
  v12 = *__error();
  v13 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (v11)
      v14 = v11;
    else
      v14 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    v19 = v14;
    v20 = 2080;
    *(_QWORD *)v21 = v10;
    _os_log_impl(&dword_211A95000, v13, OS_LOG_TYPE_DEBUG, "%{public}s: manifest hash cstring: %s", buf, 0x16u);
  }
  result = __error();
  *result = v12;
  return result;
}

uint64_t cryptex_signature_write(_QWORD *a1, int __fd)
{
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  void *v10;
  xpc_object_t v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  int v16;
  const char *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  int v21;
  const char *v22;
  const char *v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  _BYTE buf[24];
  void *v30;
  uint64_t *v31;
  _QWORD *v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = _write_file(__fd, (uint64_t)(a1 + 7));
  if ((_DWORD)v4)
  {
    v5 = (const char *)a1[2];
    v6 = *__error();
    v7 = a1[4];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = "[anonymous]";
      if (v5)
        v8 = v5;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      v9 = "%{public}s: Failed to write signature to file.: %{darwin.errno}d";
LABEL_26:
      _os_log_impl(&dword_211A95000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = 0;
  v10 = (void *)a1[33];
  if (v10)
  {
    v11 = xpc_retain(v10);
    if (MEMORY[0x212BE5998](v11) == MEMORY[0x24BDACFA0])
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 0x40000000;
      *(_QWORD *)&buf[16] = __cryptex_signature_write_metadata_to_file_block_invoke;
      v30 = &unk_24CCE33A0;
      v31 = &v25;
      v32 = a1;
      v33 = __fd;
      xpc_dictionary_apply(v11, buf);
    }
    else
    {
      *((_DWORD *)v26 + 6) = 22;
      v12 = (const char *)a1[2];
      v13 = *__error();
      v14 = a1[4];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = "[anonymous]";
        if (v12)
          v15 = v12;
        v16 = *((_DWORD *)v26 + 6);
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v16;
        _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_ERROR, "%{public}s: Signature has invalid metadata.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v13;
    }
    v21 = *((_DWORD *)v26 + 6);
    if (v11)
      os_release(v11);
  }
  else
  {
    v17 = (const char *)a1[2];
    v18 = *__error();
    v19 = a1[4];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = "[anonymous]";
      if (v17)
        v20 = v17;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_211A95000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: Signature has no metadata.", buf, 0xCu);
    }
    *__error() = v18;
    v21 = *((_DWORD *)v26 + 6);
  }
  _Block_object_dispose(&v25, 8);
  if (v21)
  {
    v22 = (const char *)a1[2];
    v6 = *__error();
    v7 = a1[4];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v23 = "[anonymous]";
      if (v22)
        v23 = v22;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v21;
      v9 = "%{public}s: Failed to write xattr metadata.: %{darwin.errno}d";
      goto LABEL_26;
    }
LABEL_27:
    *__error() = v6;
  }
  return v4;
}

CFTypeRef cryptex_signature_lock(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  CFTypeRef v10;
  const void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  int Errno;
  const char *v16;
  const char *v17;
  char *v18;
  const char *v19;
  int v20;
  const char *v21;
  CFIndex v22;
  CFTypeRef v23;
  CFErrorRef Error;
  const char *v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v35 = xmmword_211AABDA0;
  v4 = aks_sealed_hashes_set();
  if ((_DWORD)v4 == -31)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v13 = *(const char **)(a1 + 16);
      if (!v13)
        v13 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v30 = v13;
    }
    else
    {
      v17 = *(const char **)(a1 + 16);
      if (!v17)
        v17 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v30 = v17;
    }
    v18 = (char *)_os_log_send_and_compose_impl();
    v19 = "com.apple.security.cryptex";
    v20 = 318;
    goto LABEL_33;
  }
  v5 = v4;
  if ((_DWORD)v4 == -28)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v14 = *(const char **)(a1 + 16);
      if (!v14)
        v14 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v30 = v14;
    }
    else
    {
      v21 = *(const char **)(a1 + 16);
      if (!v21)
        v21 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v30 = v21;
    }
    v18 = (char *)_os_log_send_and_compose_impl();
    v19 = "com.apple.security.cryptex";
    v20 = 313;
LABEL_33:
    v22 = 36;
LABEL_39:
    Error = createError("cryptex_signature_lock", "signature.c", v20, v19, v22, 0, v18);
    v11 = 0;
    goto LABEL_40;
  }
  if ((_DWORD)v4)
  {
    Errno = _IOErrorGetErrno(v4);
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      if (*(_QWORD *)(a1 + 16))
        v16 = *(const char **)(a1 + 16);
      else
        v16 = "[anonymous]";
    }
    else if (*(_QWORD *)(a1 + 16))
    {
      v16 = *(const char **)(a1 + 16);
    }
    else
    {
      v16 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446722;
    v30 = v16;
    v31 = 1024;
    v32 = v5;
    v33 = 1024;
    v34 = _IOErrorGetErrno(v5);
    v18 = (char *)_os_log_send_and_compose_impl();
    v22 = Errno;
    v19 = "com.apple.security.cryptex.posix";
    v20 = 322;
    goto LABEL_39;
  }
  v6 = *(const char **)(a1 + 16);
  v7 = *__error();
  v8 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = "[anonymous]";
    if (v6)
      v9 = v6;
    *(_DWORD *)buf = 136446210;
    v30 = v9;
    _os_log_impl(&dword_211A95000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: successfully set cryptex sealed hash.", buf, 0xCu);
  }
  *__error() = v7;
  v27 = xmmword_211AABDB0;
  v28 = xmmword_211AABDA0;
  v10 = cryptex_signature_secureconfig_add_entry((uint64_t)&v28, a1, a2, (uint64_t)&v27);
  if (!v10)
    return 0;
  v11 = v10;
  if (*(_QWORD *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v12 = *(const char **)(a1 + 16);
    if (!v12)
      v12 = "[anonymous]";
    *(_DWORD *)buf = 136446210;
    v30 = v12;
  }
  else
  {
    v26 = *(const char **)(a1 + 16);
    if (!v26)
      v26 = "[anonymous]";
    *(_DWORD *)buf = 136446210;
    v30 = v26;
  }
  v18 = (char *)_os_log_send_and_compose_impl();
  Error = createError("cryptex_signature_lock", "signature.c", 334, "com.apple.security.cryptex", 36, v11, v18);
LABEL_40:
  free(v18);
  if (!Error)
  {
    v23 = 0;
    if (!v11)
      return v23;
    goto LABEL_42;
  }
  v23 = CFRetain(Error);
  CFRelease(Error);
  if (v11)
LABEL_42:
    CFRelease(v11);
  return v23;
}

CFTypeRef cryptex_signature_secureconfig_add_entry(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  void *default_database;
  void *slot_with_saltdata;
  void *v17;
  CFErrorRef Error;
  CFTypeRef v19;
  char v20;
  const char *v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  char *v28;
  int v29;
  uint64_t v30;
  int file;
  int v32;
  const char *v33;
  const char *v34;
  int v35;
  int v36;
  const char *v37;
  int appended;
  int v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  CFIndex v44;
  int v45;
  const char *v46;
  const char *v47;
  _OWORD v48[3];
  uint64_t v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v49 = 0;
  memset(v48, 0, sizeof(v48));
  v7 = *(const char **)(a2 + 16);
  v8 = *__error();
  v9 = *(NSObject **)(a2 + 32);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = "[anonymous]";
    if (v7)
      v10 = v7;
    *(_DWORD *)buf = 136446210;
    v51 = v10;
    _os_log_impl(&dword_211A95000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: Preparing to add entry to secure config.", buf, 0xCu);
  }
  *__error() = v8;
  if (!MEMORY[0x24BDE83F0])
  {
    v11 = *(const char **)(a2 + 16);
    v12 = *__error();
    v13 = *(NSObject **)(a2 + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = "[anonymous]";
      if (v11)
        v14 = v11;
      *(_DWORD *)buf = 136446210;
      v51 = v14;
      _os_log_impl(&dword_211A95000, v13, OS_LOG_TYPE_INFO, "%{public}s: SecureConfigDB not available", buf, 0xCu);
    }
    default_database = 0;
LABEL_11:
    slot_with_saltdata = 0;
    v17 = 0;
    *__error() = v12;
LABEL_12:
    buff_destroy(v48);
    Error = 0;
    goto LABEL_13;
  }
  default_database = (void *)secure_config_get_default_database();
  if (!default_database)
  {
    if (*(_QWORD *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      v23 = *(const char **)(a2 + 16);
      if (!v23)
        v23 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v51 = v23;
    }
    else
    {
      v27 = *(const char **)(a2 + 16);
      if (!v27)
        v27 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v51 = v27;
    }
    v28 = (char *)_os_log_send_and_compose_impl();
    v29 = 235;
    goto LABEL_68;
  }
  if (MEMORY[0x24BDE83D8])
  {
    slot_with_saltdata = (void *)secure_config_database_create_slot_with_saltdata();
    if (!slot_with_saltdata)
    {
      if (*(_QWORD *)(a2 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
        v22 = *(const char **)(a2 + 16);
        if (!v22)
          v22 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        v51 = v22;
      }
      else
      {
        v41 = *(const char **)(a2 + 16);
        if (!v41)
          v41 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        v51 = v41;
      }
      v28 = (char *)_os_log_send_and_compose_impl();
      v29 = 245;
LABEL_68:
      Error = createError("cryptex_signature_secureconfig_add_entry", "signature.c", v29, "com.apple.security.cryptex", 36, 0, v28);
      slot_with_saltdata = 0;
LABEL_69:
      v17 = 0;
      goto LABEL_87;
    }
  }
  else
  {
    if (a4)
    {
      v24 = *(const char **)(a2 + 16);
      v12 = *__error();
      v25 = *(NSObject **)(a2 + 32);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = "[anonymous]";
        if (v24)
          v26 = v24;
        *(_DWORD *)buf = 136446210;
        v51 = v26;
        _os_log_impl(&dword_211A95000, v25, OS_LOG_TYPE_ERROR, "%{public}s: Unable to create SecureConfigDB slot with salt", buf, 0xCu);
      }
      goto LABEL_11;
    }
    slot_with_saltdata = (void *)secure_config_database_create_slot();
  }
  v30 = secure_config_entry_create_with_buffer();
  if (!v30)
  {
    if (*(_QWORD *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      v34 = *(const char **)(a2 + 16);
      if (!v34)
        v34 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v51 = v34;
    }
    else
    {
      v42 = *(const char **)(a2 + 16);
      if (!v42)
        v42 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v51 = v42;
    }
    v28 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_signature_secureconfig_add_entry", "signature.c", 260, "com.apple.security.cryptex", 36, 0, v28);
    goto LABEL_69;
  }
  v17 = (void *)v30;
  if (a3 < 0)
    goto LABEL_59;
  file = _read_file(a3, v48);
  if (!file)
  {
    v35 = secure_config_entry_set_metadata();
    if (v35)
    {
      v36 = v35;
      if (*(_QWORD *)(a2 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
        v37 = *(const char **)(a2 + 16);
        if (!v37)
          v37 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v51 = v37;
        v52 = 1024;
        v53 = v36;
      }
      else
      {
        v47 = *(const char **)(a2 + 16);
        if (!v47)
          v47 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v51 = v47;
        v52 = 1024;
        v53 = v35;
      }
      v28 = (char *)_os_log_send_and_compose_impl();
      v44 = v36;
      v45 = 277;
      goto LABEL_86;
    }
LABEL_59:
    appended = secure_config_slot_append_entry();
    if (!appended)
      goto LABEL_12;
    v39 = appended;
    if (*(_QWORD *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      v40 = *(const char **)(a2 + 16);
      if (!v40)
        v40 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v51 = v40;
      v52 = 1024;
      v53 = v39;
    }
    else
    {
      v46 = *(const char **)(a2 + 16);
      if (!v46)
        v46 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v51 = v46;
      v52 = 1024;
      v53 = appended;
    }
    v28 = (char *)_os_log_send_and_compose_impl();
    v44 = v39;
    v45 = 286;
    goto LABEL_86;
  }
  v32 = file;
  if (*(_QWORD *)(a2 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
    v33 = *(const char **)(a2 + 16);
    if (!v33)
      v33 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    v51 = v33;
    v52 = 1024;
    v53 = v32;
  }
  else
  {
    v43 = *(const char **)(a2 + 16);
    if (!v43)
      v43 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    v51 = v43;
    v52 = 1024;
    v53 = file;
  }
  v28 = (char *)_os_log_send_and_compose_impl();
  v44 = v32;
  v45 = 269;
LABEL_86:
  Error = createError("cryptex_signature_secureconfig_add_entry", "signature.c", v45, "com.apple.security.cryptex.posix", v44, 0, v28);
LABEL_87:
  free(v28);
  buff_destroy(v48);
  if (!Error)
  {
LABEL_13:
    v19 = 0;
    v20 = 1;
    if (!v17)
      goto LABEL_15;
    goto LABEL_14;
  }
  v19 = CFRetain(Error);
  v20 = 0;
  if (v17)
LABEL_14:
    os_release(v17);
LABEL_15:
  if (slot_with_saltdata)
    os_release(slot_with_saltdata);
  if (default_database)
    os_release(default_database);
  if ((v20 & 1) == 0)
    CFRelease(Error);
  return v19;
}

CFTypeRef cryptex_signature_lock_with_sep(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  CFTypeRef v11;
  const void *v12;
  const char *v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  CFTypeRef v18;
  const char *v19;
  int Errno;
  const char *v21;
  char *v22;
  const char *v23;
  int v24;
  CFIndex v25;
  CFErrorRef Error;
  const char *v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = aks_measure_and_seal_cryptex_manifest();
  v5 = v4;
  if ((int)v4 > -536362987)
  {
    if ((_DWORD)v4 == -536362986)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v19 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v19 = *(const char **)(a1 + 16);
      }
      else
      {
        v19 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v19 = *(const char **)(a1 + 16);
      }
      *(_DWORD *)buf = 136446466;
      v31 = v19;
      v32 = 1024;
      v33 = -536362986;
      v22 = (char *)_os_log_send_and_compose_impl();
      v23 = "com.apple.security.cryptex";
      v24 = 381;
      goto LABEL_39;
    }
    if (!(_DWORD)v4)
    {
      v7 = *(const char **)(a1 + 16);
      v8 = *__error();
      v9 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = "[anonymous]";
        if (v7)
          v10 = v7;
        *(_DWORD *)buf = 136446210;
        v31 = v10;
        _os_log_impl(&dword_211A95000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: successfully sealed im4m.", buf, 0xCu);
      }
      *__error() = v8;
      v29 = xmmword_211AABDC0;
      v11 = cryptex_signature_secureconfig_add_entry((uint64_t)&v29, a1, a2, 0);
      if (!v11)
        return 0;
      v12 = v11;
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v13 = *(const char **)(a1 + 16);
        if (!v13)
          v13 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        v31 = v13;
      }
      else
      {
        v28 = *(const char **)(a1 + 16);
        if (!v28)
          v28 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        v31 = v28;
      }
      v22 = (char *)_os_log_send_and_compose_impl();
      Error = createError("cryptex_signature_lock_with_sep", "signature.c", 399, "com.apple.security.cryptex", 36, v12, v22);
      goto LABEL_45;
    }
LABEL_28:
    Errno = _IOErrorGetErrno(v4);
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      if (*(_QWORD *)(a1 + 16))
        v21 = *(const char **)(a1 + 16);
      else
        v21 = "[anonymous]";
    }
    else if (*(_QWORD *)(a1 + 16))
    {
      v21 = *(const char **)(a1 + 16);
    }
    else
    {
      v21 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446722;
    v31 = v21;
    v32 = 1024;
    v33 = v5;
    v34 = 1024;
    v35 = _IOErrorGetErrno(v5);
    v22 = (char *)_os_log_send_and_compose_impl();
    v25 = Errno;
    v23 = "com.apple.security.cryptex.posix";
    v24 = 386;
    goto LABEL_44;
  }
  if ((_DWORD)v4 == -536870170)
  {
    v14 = *(const char **)(a1 + 16);
    v15 = *__error();
    v16 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = "[anonymous]";
      if (v14)
        v17 = v14;
      *(_DWORD *)buf = 136446210;
      v31 = v17;
      _os_log_impl(&dword_211A95000, v16, OS_LOG_TYPE_INFO, "%{public}s: sealing im4m with SEP is unsupported on this device.", buf, 0xCu);
    }
    v18 = 0;
    *__error() = v15;
    return v18;
  }
  if ((_DWORD)v4 != -536363000)
    goto LABEL_28;
  if (*(_QWORD *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v6 = *(const char **)(a1 + 16);
    if (!v6)
      v6 = "[anonymous]";
  }
  else
  {
    v6 = *(const char **)(a1 + 16);
    if (!v6)
      v6 = "[anonymous]";
  }
  *(_DWORD *)buf = 136446466;
  v31 = v6;
  v32 = 1024;
  v33 = -536363000;
  v22 = (char *)_os_log_send_and_compose_impl();
  v23 = "com.apple.security.cryptex";
  v24 = 376;
LABEL_39:
  v25 = 36;
LABEL_44:
  Error = createError("cryptex_signature_lock_with_sep", "signature.c", v24, v23, v25, 0, v22);
  v12 = 0;
LABEL_45:
  free(v22);
  if (!Error)
  {
    v18 = 0;
    if (!v12)
      return v18;
    goto LABEL_47;
  }
  v18 = CFRetain(Error);
  CFRelease(Error);
  if (v12)
LABEL_47:
    CFRelease(v12);
  return v18;
}

uint64_t __cryptex_signature_write_metadata_to_file_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v6;
  _BOOL8 v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  const char *string_ptr;
  size_t v15;
  const char *v16;
  const char *v17;
  int v18;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x212BE5998](a3);
  v7 = v6 != MEMORY[0x24BDACFF0];
  if (v6 == MEMORY[0x24BDACFF0])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    v15 = strlen(string_ptr);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fsetxattr(*(_DWORD *)(a1 + 48), a2, string_ptr, v15 + 1, 0, 2);
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      return 1;
    v16 = *(const char **)(*(_QWORD *)(a1 + 40) + 16);
    v9 = *__error();
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = "[anonymous]";
      if (v16)
        v17 = v16;
      v18 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v20 = 136446722;
      v21 = v17;
      v22 = 2080;
      v23 = a2;
      v24 = 1024;
      v25 = v18;
      v13 = "%{public}s: Failed to apply xattr '%s'.: %{darwin.errno}d";
      goto LABEL_11;
    }
  }
  else
  {
    v8 = *(const char **)(*(_QWORD *)(a1 + 40) + 16);
    v9 = *__error();
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = "[anonymous]";
      if (v8)
        v11 = v8;
      v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v20 = 136446722;
      v21 = v11;
      v22 = 2080;
      v23 = a2;
      v24 = 1024;
      v25 = v12;
      v13 = "%{public}s: Unexpected value for metadata key '%s': %{darwin.errno}d";
LABEL_11:
      _os_log_impl(&dword_211A95000, v10, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v20, 0x1Cu);
    }
  }
  *__error() = v9;
  return v7;
}

char *_find_error(unsigned int a1)
{
  uint64_t v1;
  char *v2;
  char *v3;

  if (a1 < 0x1B)
  {
    v1 = 0;
    v2 = (char *)&_generic_errors;
    goto LABEL_7;
  }
  if (a1 - 3501 < 7)
  {
    v1 = -3501;
    v2 = (char *)&_http_errors;
    goto LABEL_7;
  }
  if (a1 - 5000 < 0xB)
  {
    v1 = -5000;
    v2 = (char *)&_zip_errors;
LABEL_7:
    v3 = &v2[32 * v1 + 32 * a1];
    if (*((_DWORD *)v3 + 2) == a1)
      return v3;
    else
      return (char *)&_unknown_error;
  }
  switch(a1)
  {
    case 0x63u:
      return (char *)&_generic_error;
    case 0xDACu:
      return (char *)&_http_internal_error;
    case 0xC7Au:
      return (char *)&_tss_declined_error;
  }
  if (a1 - 3100 >= 0x356)
    return (char *)&_unknown_error;
  return (char *)&_tss_error;
}

char *_AMAuthInstallErrorString(unsigned int a1, char *a2)
{
  char *error;
  char *v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  error = _find_error(a1);
  v5 = error;
  if (!a2)
    return (char *)*((_QWORD *)error + 2);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  if ((*error & 1) != 0)
    snprintf(__str, 0x200uLL, ": %#x [%d, %d]", a1 - *((_DWORD *)error + 6), a1 - *((_DWORD *)error + 6), a1);
  snprintf(a2, 0x100uLL, "%s%s", *((const char **)v5 + 2), __str);
  return a2;
}

uint64_t _AMAuthInstallPOSIXError(unsigned int a1)
{
  return *((unsigned int *)_find_error(a1) + 3);
}

void _AMAuthInstallSetAPParamsFromHost(uint64_t a1, __CFDictionary *a2)
{
  char *v4;

  if (*(_QWORD *)(a1 + 8) == MEMORY[0x24BEDC398])
    v4 = "sha1";
  else
    v4 = "sha2-384";
  _CFDictionarySetString(a2, (const void *)*MEMORY[0x24BEDA760], v4);
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x24BEDA738], *(_DWORD *)(a1 + 28));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x24BEDA740], *(_DWORD *)(a1 + 32));
  _CFDictionarySetUInt64(a2, (const void *)*MEMORY[0x24BEDA748], *(_QWORD *)(a1 + 40));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x24BEDA778], *(_DWORD *)(a1 + 36));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x24BEDA768], *(unsigned __int8 *)(a1 + 48));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x24BEDA780], *(unsigned __int8 *)(a1 + 49));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x24BEDA750], *(unsigned __int8 *)(a1 + 50));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x24BEDA758], *(unsigned __int8 *)(a1 + 51));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x24BEDA790], 1);
}

CFDataRef _AMAuthInstallCryptex1CopyUDID(const __CFNumber *a1, const __CFNumber *a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = 0;
  v5 = 0;
  CFNumberGetValue(a1, kCFNumberSInt32Type, (char *)&v4 + 4);
  CFNumberGetValue(a2, kCFNumberSInt64Type, &v5);
  HIDWORD(v4) = bswap32(HIDWORD(v4));
  v5 = bswap64(v5);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&v4, 16);
}

void _AMAuthInstallSetCryptex1ParamsFromHost(uint64_t a1, __CFDictionary *a2)
{
  const __CFNumber *v4;
  const __CFNumber *v5;
  CFDataRef v6;

  v4 = CFNumberCreate(0, kCFNumberLongType, (const void *)(a1 + 32));
  v5 = CFNumberCreate(0, kCFNumberLongLongType, (const void *)(a1 + 40));
  v6 = _AMAuthInstallCryptex1CopyUDID(v4, v5);
  CFDictionarySetValue(a2, (const void *)*MEMORY[0x24BEDA878], v6);
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x24BEDA828], *(_DWORD *)(a1 + 128));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x24BEDA870], *(_DWORD *)(a1 + 132));
  _CFDictionarySetUInt32(a2, (const void *)*MEMORY[0x24BEDA850], *(_DWORD *)(a1 + 140));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x24BEDA858], *(unsigned __int8 *)(a1 + 48));
  _CFDictionarySetBool(a2, (const void *)*MEMORY[0x24BEDA880], 1);
  if (v6)
    CFRelease(v6);
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
}

void _AMAuthInstallSetCryptex1ApParamsFromHost(uint64_t a1, CFMutableDictionaryRef theDict)
{
  CFDictionaryRemoveValue(theDict, (const void *)*MEMORY[0x24BEDA880]);
  _CFDictionarySetUInt32(theDict, (const void *)*MEMORY[0x24BEDA738], *(_DWORD *)(a1 + 28));
  _CFDictionarySetUInt32(theDict, (const void *)*MEMORY[0x24BEDA740], *(_DWORD *)(a1 + 32));
  _CFDictionarySetUInt32(theDict, (const void *)*MEMORY[0x24BEDA778], *(_DWORD *)(a1 + 36));
  _CFDictionarySetBool(theDict, (const void *)*MEMORY[0x24BEDA768], *(unsigned __int8 *)(a1 + 48));
}

uint64_t _init_authinstall_log()
{
  return AMAuthInstallLogSetHandler();
}

void _authinstall_logger(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.libcryptex", "authinstall");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = a2;
    _os_log_impl(&dword_211A95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }
}

void _cryptex_scrivener_dealloc(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  void *v6;

  os_release(*(void **)(a1 + 88));
  v2 = *(const void **)(a1 + 184);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 192);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 200);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 208);
  if (v5)
    CFRelease(v5);
  free(*(void **)(a1 + 160));
  *(_QWORD *)(a1 + 160) = 0;
  v6 = *(void **)(a1 + 216);
  if (v6)
    os_release(v6);
  free(*(void **)(a1 + 168));
  *(_QWORD *)(a1 + 168) = 0;
  object_proto_destroy(a1 + 56);
}

_QWORD *cryptex_scrivener_create(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  const char *v5;
  char *v6;
  uint64_t v7;

  v4 = (_QWORD *)_cryptex_scrivener_alloc();
  v4[10] = a2;
  v4[11] = os_retain(a1);
  if ((a2 & 1) != 0)
    v5 = "https://gs.apple.com:443";
  else
    v5 = "http://gs.apple.com";
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v6 = strdup(v5);
      if (v6)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v6 = strdup(v5);
    if (!v6)
      cryptex_scrivener_create_cold_1();
  }
  v4[20] = v6;
  v7 = a1[21];
  if (v7 && (*(_BYTE *)(v7 + 40) & 1) != 0)
    cryptex_scrivener_set_url(v4, "https://diavlo.apple.com:443");
  object_proto_init((uint64_t)(v4 + 7), (int)"com.apple.security.libcryptex.core", "scrivener");
  cryptex_init((uint64_t)v4, 0, (uint64_t)_cryptex_scrivener_init, 0);
  return v4;
}

void cryptex_scrivener_set_url(_QWORD *a1, const char *a2)
{
  void *v4;
  char *v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)a1[20];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v5 = strdup(a2);
      if (v5)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v5 = strdup(a2);
    if (!v5)
      cryptex_scrivener_set_url_cold_1();
  }
  a1[20] = v5;
  v6 = (const char *)a1[7];
  v7 = *__error();
  v8 = a1[9];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = "[anonymous]";
    *(_DWORD *)buf = 136446722;
    if (v6)
      v9 = v6;
    v11 = v9;
    v12 = 2080;
    v13 = v4;
    v14 = 2080;
    v15 = a2;
    _os_log_impl(&dword_211A95000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: signing service url: %s -> %s", buf, 0x20u);
  }
  *__error() = v7;
  free(v4);
}

uint64_t _cryptex_scrivener_init(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  __int128 *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  int v20;
  int v21;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  CFDataRef v27;
  CFDataRef v28;
  __CFDictionary *MutableForCFTypes;
  uint64_t v30;
  const char *v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  const char *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  const void **v45;
  int nonce_domain;
  const char *v47;
  int v48;
  NSObject *v49;
  const char *v50;
  const char *v51;
  NSObject *v52;
  const char *v53;
  int v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  const char *v59;
  int v60;
  NSObject *v61;
  const char *v62;
  const char *v63;
  NSObject *v64;
  const char *v65;
  const char *v67;
  int v68;
  const char *v69;
  const char *v70;
  __int128 v71;
  void *v72;
  uint64_t v73;
  uint8_t v74[4];
  const char *v75;
  __int16 v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[32];
  __int128 v88;
  _BYTE v89[10];
  __int16 v90;
  int v91;
  __int16 v92;
  int v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v2 = AMAuthInstallCreate();
  *(_QWORD *)(a1 + 192) = v2;
  if (!v2)
    _cryptex_scrivener_init_cold_1(buf, &v78);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 168);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v78 = 0u;
  LOWORD(v78) = 6;
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 192);
    v5 = *(const char **)(a1 + 56);
    v6 = *__error();
    v7 = *(NSObject **)(a1 + 72);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v8)
      {
        v9 = "[anonymous]";
        if (v5)
          v9 = v5;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_211A95000, v7, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip instance", buf, 0xCu);
      }
      *__error() = v6;
      v10 = *(__int128 **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 168) + 192);
LABEL_31:
      v26 = *(_QWORD *)(a1 + 152);
      if (v26)
      {
LABEL_32:
        v27 = CFDataCreate(0, (const UInt8 *)(v26 + 2), *(unsigned int *)(v26 + 52));
        if (!v27)
          _cryptex_scrivener_init_cold_2(v74, buf);
        v28 = v27;
        MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
        v30 = *(_QWORD *)(a1 + 80);
        v31 = *(const char **)(a1 + 56);
        v32 = *__error();
        v33 = *(NSObject **)(a1 + 72);
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
        if ((v30 & 8) != 0)
        {
          if (v34)
          {
            v53 = "[anonymous]";
            v54 = *((_DWORD *)v10 + 32);
            v55 = *((_DWORD *)v10 + 33);
            if (v31)
              v53 = v31;
            v56 = *((_DWORD *)v10 + 34);
            v57 = *((_DWORD *)v10 + 35);
            *(_DWORD *)buf = 136447234;
            *(_QWORD *)&buf[4] = v53;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v54;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v55;
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v56;
            *(_WORD *)&buf[30] = 1024;
            LODWORD(v88) = v57;
            _os_log_impl(&dword_211A95000, v33, OS_LOG_TYPE_DEBUG, "%{public}s: using Cryptex1 identity:\n    FCHP = %#x\n    TYPE = %#x\n    STYP = %#x\n    CLAS = %#x", buf, 0x24u);
          }
          *__error() = v32;
          _AMAuthInstallSetCryptex1ParamsFromHost((uint64_t)v10, MutableForCFTypes);
          v58 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 216);
          if (v58 && !*(_BYTE *)(v58 + 65))
            _AMAuthInstallSetCryptex1ApParamsFromHost((uint64_t)v10, MutableForCFTypes);
          v45 = (const void **)MEMORY[0x24BEDA838];
        }
        else
        {
          if (v34)
          {
            v35 = "[anonymous]";
            v36 = *((_DWORD *)v10 + 6);
            v37 = *((_DWORD *)v10 + 7);
            if (v31)
              v35 = v31;
            v38 = *((_DWORD *)v10 + 8);
            v39 = *((_DWORD *)v10 + 9);
            v40 = *((_QWORD *)v10 + 5);
            v41 = *((unsigned __int8 *)v10 + 48);
            v42 = *((unsigned __int8 *)v10 + 49);
            v43 = *((unsigned __int8 *)v10 + 50);
            v44 = *((unsigned __int8 *)v10 + 51);
            *(_DWORD *)buf = 136448514;
            *(_QWORD *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v36;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v37;
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v38;
            *(_WORD *)&buf[30] = 1024;
            LODWORD(v88) = v39;
            WORD2(v88) = 2048;
            *(_QWORD *)((char *)&v88 + 6) = v40;
            HIWORD(v88) = 1024;
            *(_DWORD *)v89 = v41;
            *(_WORD *)&v89[4] = 1024;
            *(_DWORD *)&v89[6] = v42;
            v90 = 1024;
            v91 = v43;
            v92 = 1024;
            v93 = v44;
            _os_log_impl(&dword_211A95000, v33, OS_LOG_TYPE_DEBUG, "%{public}s: using device identity:\n    CEPO = %#x\n    BORD = %#x\n    CHIP = %#x\n    SDOM = %#x\n    ECID = %#llx\n    CPRO = %#x\n    CSEC = %#x\n    EPRO = %#x\n    ESEC = %#x", buf, 0x46u);
          }
          *__error() = v32;
          _AMAuthInstallSetAPParamsFromHost((uint64_t)v10, MutableForCFTypes);
          v45 = (const void **)MEMORY[0x24BEDA730];
        }
        CFDictionarySetValue(MutableForCFTypes, *v45, v28);
        if ((*(_BYTE *)(a1 + 80) & 2) != 0)
          CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x24BEDA728], (const void *)*MEMORY[0x24BDBD270]);
        v59 = *(const char **)(a1 + 56);
        v60 = *__error();
        v61 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v62 = "[anonymous]";
          if (v59)
            v62 = v59;
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v62;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = MutableForCFTypes;
          _os_log_impl(&dword_211A95000, v61, OS_LOG_TYPE_DEBUG, "%{public}s: ap parameters = %@", buf, 0x16u);
        }
        *__error() = v60;
        *(_QWORD *)(a1 + 184) = CFDictionaryCreateCopy(0, MutableForCFTypes);
        CFRelease(v28);
        if (MutableForCFTypes)
          CFRelease(MutableForCFTypes);
        _init_authinstall_log();
        v21 = 0;
        return cryptex_set_error(a1, v21);
      }
      v72 = 0;
      v73 = MEMORY[0x24BEDC3C0];
      *(_QWORD *)v89 = 0;
      v88 = 0u;
      memset(buf, 0, sizeof(buf));
      nonce_domain = cryptex_core_get_nonce_domain(*(_QWORD **)(a1 + 88), &v73);
      if (nonce_domain)
      {
        v21 = nonce_domain;
        v47 = *(const char **)(a1 + 56);
        v48 = *__error();
        v49 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = "[anonymous]";
          if (v47)
            v50 = v47;
          *(_DWORD *)v74 = 136446466;
          v75 = v50;
          v76 = 1024;
          LODWORD(v77) = v21;
          v51 = "%{public}s: failed to get nonce domain from core: %{darwin.errno}d";
LABEL_44:
          v52 = v49;
LABEL_67:
          _os_log_impl(&dword_211A95000, v52, OS_LOG_TYPE_ERROR, v51, v74, 0x12u);
        }
      }
      else
      {
        v21 = cryptex_core_copy_nonce_domain_desc(*(_QWORD **)(a1 + 88), (char **)&v72);
        v63 = *(const char **)(a1 + 56);
        v48 = *__error();
        v64 = *(NSObject **)(a1 + 72);
        if (v21)
        {
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v65 = "[anonymous]";
            if (v63)
              v65 = v63;
            *(_DWORD *)v74 = 136446466;
            v75 = v65;
            v76 = 1024;
            LODWORD(v77) = v21;
            v51 = "%{public}s: failed to get nonce domain description from core: %{darwin.errno}d";
            v52 = v64;
            goto LABEL_67;
          }
        }
        else
        {
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v67 = "[anonymous]";
            if (v63)
              v67 = v63;
            *(_DWORD *)v74 = 136446466;
            v75 = v67;
            v76 = 2082;
            v77 = v72;
            _os_log_impl(&dword_211A95000, v64, OS_LOG_TYPE_DEFAULT, "%{public}s: signing using nonce from %{public}s", v74, 0x16u);
          }
          *__error() = v48;
          v68 = img4_nonce_domain_copy_nonce();
          if (!v68)
          {
            v71 = *(_OWORD *)&buf[16];
            *(_OWORD *)(a1 + 96) = *(_OWORD *)buf;
            *(_OWORD *)(a1 + 112) = v71;
            *(_OWORD *)(a1 + 128) = v88;
            *(_QWORD *)(a1 + 144) = *(_QWORD *)v89;
            *(_QWORD *)(a1 + 152) = a1 + 96;
            free(v72);
            v26 = *(_QWORD *)(a1 + 152);
            goto LABEL_32;
          }
          v21 = v68;
          v69 = *(const char **)(a1 + 56);
          v48 = *__error();
          v49 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v70 = "[anonymous]";
            if (v69)
              v70 = v69;
            *(_DWORD *)v74 = 136446466;
            v75 = v70;
            v76 = 1024;
            LODWORD(v77) = v21;
            v51 = "%{public}s: img4_nonce_domain_copy_nonce: %{darwin.errno}d";
            goto LABEL_44;
          }
        }
      }
      *__error() = v48;
      free(v72);
      return cryptex_set_error(a1, v21);
    }
    if (v8)
    {
      v18 = "[anonymous]";
      if (v5)
        v18 = v5;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_211A95000, v7, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip environment", buf, 0xCu);
    }
    *__error() = v6;
    v17 = *(_QWORD *)(v3 + 1160);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 80);
    v12 = *(const char **)(a1 + 56);
    v13 = *__error();
    v14 = *(NSObject **)(a1 + 72);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if ((v11 & 8) != 0)
    {
      if (v15)
      {
        v19 = "[anonymous]";
        if (v12)
          v19 = v12;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: using generic cryptex1 environment", buf, 0xCu);
      }
      *__error() = v13;
      v17 = MEMORY[0x24BEDC3B0];
    }
    else
    {
      if (v15)
      {
        v16 = "[anonymous]";
        if (v12)
          v16 = v12;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v16;
        _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: using personalized chip environment", buf, 0xCu);
      }
      *__error() = v13;
      v17 = img4_chip_select_personalized_ap();
    }
  }
  WORD3(v78) = 0;
  *(_DWORD *)((char *)&v78 + 2) = 0;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  LOWORD(v78) = 6;
  *((_QWORD *)&v78 + 1) = v17;
  v10 = &v78;
  v20 = img4_chip_instantiate();
  if (!v20)
    goto LABEL_31;
  v21 = v20;
  v22 = *(const char **)(a1 + 56);
  v23 = *__error();
  v24 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = "[anonymous]";
    if (v22)
      v25 = v22;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v21;
    _os_log_impl(&dword_211A95000, v24, OS_LOG_TYPE_ERROR, "%{public}s: failed to instantiate chip: %{darwin.errno}d", buf, 0x12u);
  }
  *__error() = v23;
  return cryptex_set_error(a1, v21);
}

void cryptex_scrivener_sign(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = ctx_new(a1, 0x30uLL);
  v6[3] = 0;
  v6[4] = a2;
  v6[5] = a3;
  v7 = (const char *)a1[7];
  v8 = *__error();
  v9 = a1[9];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = "[anonymous]";
    if (v7)
      v10 = v7;
    v11 = 136446210;
    v12 = v10;
    _os_log_impl(&dword_211A95000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: requesting signature", (uint8_t *)&v11, 0xCu);
  }
  *__error() = v8;
  cryptex_async_f((uint64_t)a1, v6, (void (__cdecl *)(void *))_cryptex_scrivener_sign_continue);
}

void _cryptex_scrivener_sign_continue(uint64_t *a1)
{
  uint64_t v2;
  int error;
  int v4;
  const char *v5;
  CFDataRef v6;
  int v7;
  const __CFString *v8;
  CFDataRef v9;
  CFMutableDictionaryRef v10;
  __CFDictionary *MutableCopy;
  const char *v12;
  char *v13;
  CFIndex v14;
  int v15;
  CFDataRef v16;
  int inited;
  __CFDictionary *MutableForCFTypes;
  CFDictionaryRef v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  int v36;
  const char *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const __CFString *v44;
  CFDataRef v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  CFDictionaryRef *v51;
  unsigned int PersonalizedResponse;
  unsigned int v53;
  int v54;
  const char *v55;
  char *v56;
  CFErrorRef v57;
  const void **v58;
  const void *v59;
  const char *v60;
  int v61;
  NSObject *v62;
  const char *v63;
  CFDictionaryRef v64;
  const void *Value;
  const void *v66;
  CFTypeID v67;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v70;
  int v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  int v84;
  __n128 v85[3];
  uint64_t v86;
  void *object;
  CFDictionaryRef theDict;
  uint64_t v89;
  _OWORD v90[16];
  UInt8 bytes[8];
  uint64_t v92;
  int v93;
  uint8_t buf[4];
  const char *v95;
  __int16 v96;
  _BYTE v97[14];
  __int16 v98;
  int v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v86 = 0;
  object = 0;
  memset(v85, 0, sizeof(v85));
  memset(v90, 0, sizeof(v90));
  error = cryptex_get_error(v2);
  if (error)
  {
    v4 = error;
    if (*(_QWORD *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      v5 = *(const char **)(v2 + 56);
      if (!v5)
        v5 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v95 = v5;
      v96 = 1024;
      *(_DWORD *)v97 = v4;
    }
    else
    {
      v12 = *(const char **)(v2 + 56);
      if (!v12)
        v12 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v95 = v12;
      v96 = 1024;
      *(_DWORD *)v97 = error;
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    v14 = v4;
    v15 = 550;
    goto LABEL_87;
  }
  if ((*(_BYTE *)(v2 + 80) & 8) != 0)
  {
    v16 = CFDataCreate(0, 0, 0);
    inited = _cryptex_scrivener_init_tss_common(v2);
    if (inited)
    {
      LODWORD(v8) = inited;
      MutableForCFTypes = 0;
      if (!v16)
      {
LABEL_16:
        if (!MutableForCFTypes)
          goto LABEL_72;
        v19 = MutableForCFTypes;
        goto LABEL_71;
      }
LABEL_15:
      CFRelease(v16);
      goto LABEL_16;
    }
    MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
    CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x24BEDA860], (const void *)*MEMORY[0x24BDBD270]);
    _CFDictionaryMergeDictionary(MutableForCFTypes, *(CFDictionaryRef *)(v2 + 184));
    v29 = *(_QWORD *)(*(_QWORD *)(v2 + 88) + 216);
    if (v29)
    {
      _CFDictionarySetUInt32(MutableForCFTypes, (const void *)*MEMORY[0x24BEDA840], *(_DWORD *)(v29 + 40));
      _CFDictionarySetUInt32(MutableForCFTypes, (const void *)*MEMORY[0x24BEDA868], *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 88) + 216) + 44));
      _CFDictionarySetString(MutableForCFTypes, (const void *)*MEMORY[0x24BEDA888], *(char **)(*(_QWORD *)(*(_QWORD *)(v2 + 88) + 216) + 48));
      _CFDictionarySetString(MutableForCFTypes, (const void *)*MEMORY[0x24BEDA848], *(char **)(*(_QWORD *)(*(_QWORD *)(v2 + 88) + 216) + 56));
    }
    v30 = _cryptex_scrivener_init_tss_assets((_QWORD *)v2, (uint64_t)MutableForCFTypes);
    if (v30)
    {
      LODWORD(v8) = v30;
      v31 = *(const char **)(v2 + 56);
      v32 = *__error();
      v33 = *(NSObject **)(v2 + 72);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_135;
      v34 = "[anonymous]";
      if (v31)
        v34 = v31;
      *(_DWORD *)buf = 136446466;
      v95 = v34;
      v96 = 1024;
      *(_DWORD *)v97 = (_DWORD)v8;
      v35 = "%{public}s: Failed to attach asset measurement(s).: %{darwin.errno}d";
      goto LABEL_36;
    }
    bytes[0] = 0;
    if (cryptex_core_get_info_asset(*(_QWORD *)(v2 + 88)))
    {
      v36 = cryptex_core_parse_info_asset(*(_QWORD **)(v2 + 88), 0, 0, (BOOL *)bytes);
      if (v36)
      {
        LODWORD(v8) = v36;
        v37 = *(const char **)(v2 + 56);
        v38 = *__error();
        v39 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = "[anonymous]";
          if (v37)
            v40 = v37;
          *(_DWORD *)buf = 136446466;
          v95 = v40;
          v96 = 1024;
          *(_DWORD *)v97 = (_DWORD)v8;
          _os_log_impl(&dword_211A95000, v39, OS_LOG_TYPE_ERROR, "%{public}s: failed to parse cryptex info: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v38;
        v41 = *(const char **)(v2 + 56);
        v32 = *__error();
        v33 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v42 = "[anonymous]";
          if (v41)
            v42 = v41;
          *(_DWORD *)buf = 136446466;
          v95 = v42;
          v96 = 1024;
          *(_DWORD *)v97 = (_DWORD)v8;
          v35 = "%{public}s: Failed to stamp DataOnly.: %{darwin.errno}d";
LABEL_36:
          _os_log_impl(&dword_211A95000, v33, OS_LOG_TYPE_ERROR, v35, buf, 0x12u);
        }
LABEL_135:
        *__error() = v32;
        if (!v16)
          goto LABEL_16;
        goto LABEL_15;
      }
      if (bytes[0])
        _CFDictionarySetBool(MutableForCFTypes, CFSTR("Cryptex1,DataOnly"), 1);
    }
    CFDictionarySetValue(MutableForCFTypes, CFSTR("Cryptex1,UniqueTagList"), v16);
    *(_QWORD *)(v2 + 200) = CFDictionaryCreateCopy(0, MutableForCFTypes);
    v80 = *(const char **)(v2 + 56);
    v32 = *__error();
    v81 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      v82 = "[anonymous]";
      v83 = *(_QWORD *)(v2 + 200);
      if (v80)
        v82 = v80;
      *(_DWORD *)buf = 136446466;
      v95 = v82;
      v96 = 2114;
      *(_QWORD *)v97 = v83;
      _os_log_impl(&dword_211A95000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s: tss request = %{public}@", buf, 0x16u);
    }
    LODWORD(v8) = 0;
    goto LABEL_135;
  }
  theDict = 0;
  *(_QWORD *)bytes = 0;
  v92 = 0;
  v93 = 0;
  v6 = CFDataCreate(0, 0, 0);
  v7 = _cryptex_scrivener_init_tss_common(v2);
  if (v7)
  {
    LODWORD(v8) = v7;
    v9 = 0;
    v10 = 0;
    MutableCopy = 0;
  }
  else
  {
    v20 = *(const char **)(v2 + 56);
    v21 = *__error();
    v22 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = "[anonymous]";
      v24 = *(_QWORD *)(v2 + 184);
      if (v20)
        v23 = v20;
      *(_DWORD *)buf = 136446466;
      v95 = v23;
      v96 = 2112;
      *(_QWORD *)v97 = v24;
      _os_log_impl(&dword_211A95000, v22, OS_LOG_TYPE_DEBUG, "%{public}s: setting ap parameters = %@", buf, 0x16u);
    }
    *__error() = v21;
    if (AMAuthInstallApSetParameters())
      _cryptex_scrivener_sign_continue_cold_3();
    v10 = _CFDictionaryCreateMutableForCFTypes();
    LODWORD(v8) = _cryptex_scrivener_init_tss_assets((_QWORD *)v2, (uint64_t)v10);
    v25 = *(const char **)(v2 + 56);
    v26 = *__error();
    v27 = *(NSObject **)(v2 + 72);
    if ((_DWORD)v8)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = "[anonymous]";
        if (v25)
          v28 = v25;
        *(_DWORD *)buf = 136446466;
        v95 = v28;
        v96 = 1024;
        *(_DWORD *)v97 = (_DWORD)v8;
        _os_log_impl(&dword_211A95000, v27, OS_LOG_TYPE_ERROR, "%{public}s: Failed to attach asset measurement(s).: %{darwin.errno}d", buf, 0x12u);
      }
      v9 = 0;
      MutableCopy = 0;
      *__error() = v26;
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v43 = "[anonymous]";
        if (v25)
          v43 = v25;
        *(_DWORD *)buf = 136446210;
        v95 = v43;
        _os_log_impl(&dword_211A95000, v27, OS_LOG_TYPE_DEBUG, "%{public}s: creating server request dictionary", buf, 0xCu);
      }
      *__error() = v26;
      if (AMAuthInstallApImg4CreateServerRequestDictionary())
        _cryptex_scrivener_sign_continue_cold_2();
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
      v44 = (const __CFString *)MGGetStringAnswer();
      v8 = v44;
      if (!v44 || !_CFStringLocalizeCaseInsensitiveContains(v44, CFSTR("z41")))
        CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BEDA8C0], (const void *)*MEMORY[0x24BDBD268]);
      v45 = CFDataCreate(0, bytes, 20);
      if (!v45)
        _cryptex_scrivener_init_cold_2(&v89, buf);
      v9 = v45;
      CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BEDA818], v45);
      CFDictionarySetValue(MutableCopy, CFSTR("Ap,UniqueTagList"), v6);
      *(_QWORD *)(v2 + 200) = CFDictionaryCreateCopy(0, MutableCopy);
      v46 = *(const char **)(v2 + 56);
      v84 = *__error();
      v47 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = "[anonymous]";
        v49 = *(_QWORD *)(v2 + 200);
        if (v46)
          v48 = v46;
        *(_DWORD *)buf = 136446466;
        v95 = v48;
        v96 = 2114;
        *(_QWORD *)v97 = v49;
        _os_log_impl(&dword_211A95000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s: tss request = %{public}@", buf, 0x16u);
      }
      *__error() = v84;
      if (v8)
      {
        CFRelease(v8);
        LODWORD(v8) = 0;
      }
    }
  }
  if (v6)
    CFRelease(v6);
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
  if (MutableCopy)
    CFRelease(MutableCopy);
  v19 = theDict;
  if (theDict)
LABEL_71:
    CFRelease(v19);
LABEL_72:
  if ((_DWORD)v8)
  {
    if (*(_QWORD *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      v50 = *(const char **)(v2 + 56);
      if (!v50)
        v50 = "[anonymous]";
    }
    else
    {
      v50 = *(const char **)(v2 + 56);
      if (!v50)
        v50 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v95 = v50;
    v96 = 1024;
    *(_DWORD *)v97 = (_DWORD)v8;
    v13 = (char *)_os_log_send_and_compose_impl();
    v14 = (int)v8;
    v15 = 557;
    goto LABEL_87;
  }
  if ((*(_BYTE *)(v2 + 80) & 4) == 0)
  {
    v51 = (CFDictionaryRef *)(v2 + 208);
    PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    if (PersonalizedResponse)
    {
      v53 = PersonalizedResponse;
      v54 = _AMAuthInstallPOSIXError(PersonalizedResponse);
      if (*(_QWORD *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        if (*(_QWORD *)(v2 + 56))
          v55 = *(const char **)(v2 + 56);
        else
          v55 = "[anonymous]";
        v56 = _AMAuthInstallErrorString(v53, (char *)v90);
        *(_DWORD *)buf = 136446978;
        v95 = v55;
        v96 = 1024;
        *(_DWORD *)v97 = v53;
        *(_WORD *)&v97[4] = 2082;
        *(_QWORD *)&v97[6] = v56;
        v98 = 1024;
        v99 = v54;
      }
      else
      {
        if (*(_QWORD *)(v2 + 56))
          v76 = *(const char **)(v2 + 56);
        else
          v76 = "[anonymous]";
        v77 = _AMAuthInstallErrorString(v53, (char *)v90);
        *(_DWORD *)buf = 136446978;
        v95 = v76;
        v96 = 1024;
        *(_DWORD *)v97 = v53;
        *(_WORD *)&v97[4] = 2082;
        *(_QWORD *)&v97[6] = v77;
        v98 = 1024;
        v99 = v54;
      }
      v13 = (char *)_os_log_send_and_compose_impl();
      v14 = v54;
      v15 = 568;
LABEL_87:
      v57 = createError("_cryptex_scrivener_sign_continue", "scrivener.c", v15, "com.apple.security.cryptex.posix", v14, 0, v13);
      free(v13);
      goto LABEL_88;
    }
    if ((*(_QWORD *)(v2 + 80) & 8) != 0)
      v58 = (const void **)MEMORY[0x24BEDA830];
    else
      v58 = (const void **)MEMORY[0x24BEDA7E0];
    v59 = *v58;
    v60 = *(const char **)(v2 + 56);
    v61 = *__error();
    v62 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      v63 = "[anonymous]";
      v64 = *v51;
      if (v60)
        v63 = v60;
      *(_DWORD *)buf = 136446466;
      v95 = v63;
      v96 = 2112;
      *(_QWORD *)v97 = v64;
      _os_log_impl(&dword_211A95000, v62, OS_LOG_TYPE_DEBUG, "%{public}s: tss response: %@", buf, 0x16u);
    }
    *__error() = v61;
    Value = CFDictionaryGetValue(*v51, v59);
    if (!Value || (v66 = Value, v67 = CFGetTypeID(Value), v67 != CFDataGetTypeID()))
    {
      if (*(_QWORD *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        v74 = *(const char **)(v2 + 56);
        *(_DWORD *)buf = 136446722;
        if (v74)
          v75 = v74;
        else
          v75 = "[anonymous]";
        v95 = v75;
        v96 = 2114;
        *(_QWORD *)v97 = v59;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = 94;
      }
      else
      {
        v79 = "[anonymous]";
        if (*(_QWORD *)(v2 + 56))
          v79 = *(const char **)(v2 + 56);
        *(_DWORD *)buf = 136446722;
        v95 = v79;
        v96 = 2114;
        *(_QWORD *)v97 = v59;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = 94;
      }
      v13 = (char *)_os_log_send_and_compose_impl();
      v15 = 585;
      v14 = 94;
      goto LABEL_87;
    }
    CFRetain(v66);
    BytePtr = CFDataGetBytePtr((CFDataRef)v66);
    Length = CFDataGetLength((CFDataRef)v66);
    buff_init_signed(v85, (uint64_t)v66, (uint64_t)_buff_destroy_CFData, (uint64_t)BytePtr, Length);
  }
  if (cryptex_core_get_info_asset(*(_QWORD *)(v2 + 88)))
  {
    v70 = signature_metadata_read_from_cryptex(*(_QWORD **)(v2 + 88), &object);
    if (v70)
    {
      v71 = v70;
      if (*(_QWORD *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        v72 = *(const char **)(v2 + 56);
        if (!v72)
          v72 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v95 = v72;
        v96 = 1024;
        *(_DWORD *)v97 = v71;
      }
      else
      {
        v78 = *(const char **)(v2 + 56);
        if (!v78)
          v78 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v95 = v78;
        v96 = 1024;
        *(_DWORD *)v97 = v70;
      }
      v13 = (char *)_os_log_send_and_compose_impl();
      v14 = v71;
      v15 = 598;
      goto LABEL_87;
    }
    v73 = object;
  }
  else
  {
    v73 = 0;
  }
  v57 = 0;
  *(_QWORD *)(v2 + 216) = cryptex_signature_create(v85, *(_QWORD *)(v2 + 80) & 1, v73);
LABEL_88:
  buff_destroy(v85);
  a1[2] = (uint64_t)v57;
  cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_scrivener_sign_callback);
  if (object)
    os_release(object);
}

__n128 cryptex_scrivener_set_nonce(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  uint64_t v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 128) = v3;
  *(__n128 *)(a1 + 96) = result;
  *(_QWORD *)(a1 + 144) = v4;
  *(_QWORD *)(a1 + 152) = a1 + 96;
  return result;
}

void cryptex_scrivener_read_signature(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = ctx_new(a1, 0x30uLL);
  v6[3] = 1;
  v6[4] = a2;
  v6[5] = a3;
  v7 = (const char *)a1[7];
  v8 = *__error();
  v9 = a1[9];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = "[anonymous]";
    if (v7)
      v10 = v7;
    v11 = 136446210;
    v12 = v10;
    _os_log_impl(&dword_211A95000, v9, OS_LOG_TYPE_DEBUG, "%{public}s: reading signature", (uint8_t *)&v11, 0xCu);
  }
  *__error() = v8;
  cryptex_async_f((uint64_t)a1, v6, (void (__cdecl *)(void *))_cryptex_scrivener_read_continue);
}

void _cryptex_scrivener_read_continue(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  int error;
  int v5;
  const char *v7;
  const char *v8;
  char *v9;
  CFIndex v10;
  int v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint64_t asset;
  uint64_t v17;
  int file;
  int v19;
  const char *v20;
  int v21;
  int v22;
  const char *v23;
  int v24;
  NSObject *v25;
  const char *v26;
  CFErrorRef v27;
  const char *v28;
  __n128 v29[3];
  uint64_t v30;
  void *object;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a1[3];
  v30 = 0;
  object = 0;
  memset(v29, 0, sizeof(v29));
  error = cryptex_get_error(v2);
  if (error)
  {
    v5 = error;
    if (error != 216 || v3 != 1)
    {
      if (*(_QWORD *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        v7 = *(const char **)(v2 + 56);
        if (!v7)
          v7 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v33 = v7;
        v34 = 1024;
        v35 = v5;
      }
      else
      {
        v8 = *(const char **)(v2 + 56);
        if (!v8)
          v8 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v33 = v8;
        v34 = 1024;
        v35 = error;
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      v10 = v5;
      v11 = 640;
LABEL_36:
      v27 = createError("_cryptex_scrivener_read_continue", "scrivener.c", v11, "com.apple.security.cryptex.posix", v10, 0, v9);
      free(v9);
      goto LABEL_37;
    }
    v12 = *(const char **)(v2 + 56);
    v13 = *__error();
    v14 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = "[anonymous]";
      if (v12)
        v15 = v12;
      *(_DWORD *)buf = 136446210;
      v33 = v15;
      _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: ignoring ap environment", buf, 0xCu);
    }
    *__error() = v13;
  }
  asset = cryptex_core_get_asset(*(_QWORD *)(v2 + 88), (uint64_t)&_cryptex_asset_type_im4m);
  if (!asset)
    _cryptex_scrivener_read_continue_cold_1();
  v17 = asset;
  file = _read_file(*(_DWORD *)(asset + 16), v29);
  if (file)
  {
    v19 = file;
    if (*(_QWORD *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      v20 = *(const char **)(v2 + 56);
      if (!v20)
        v20 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v33 = v20;
      v34 = 1024;
      v35 = v19;
    }
    else
    {
      v28 = *(const char **)(v2 + 56);
      if (!v28)
        v28 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v33 = v28;
      v34 = 1024;
      v35 = file;
    }
    v9 = (char *)_os_log_send_and_compose_impl();
    v10 = v19;
    v11 = 651;
    goto LABEL_36;
  }
  v21 = signature_metadata_read_from_file(*(_DWORD *)(v17 + 16), &object);
  if (v21)
  {
    v22 = v21;
    v23 = *(const char **)(v2 + 56);
    v24 = *__error();
    v25 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = "[anonymous]";
      if (v23)
        v26 = v23;
      *(_DWORD *)buf = 136446466;
      v33 = v26;
      v34 = 1024;
      v35 = v22;
      _os_log_impl(&dword_211A95000, v25, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load metadata for Image4 manifest.: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v24;
  }
  v27 = 0;
  *(_QWORD *)(v2 + 216) = cryptex_signature_create(v29, *(_QWORD *)(v2 + 80) & 1, object);
LABEL_37:
  buff_destroy(v29);
  a1[2] = (uint64_t)v27;
  cryptex_target_async_f(v2, a1, (void (__cdecl *)(void *))_cryptex_scrivener_sign_callback);
  if (object)
    os_release(object);
}

void cryptex_scrivener_set_socks_proxy(uint64_t a1, const char *a2, int a3)
{
  void *v6;
  char *v7;
  int v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = *(void **)(a1 + 168);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v7 = strdup(a2);
      if (v7)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v7 = strdup(a2);
    if (!v7)
      cryptex_scrivener_set_url_cold_1();
  }
  *(_QWORD *)(a1 + 168) = v7;
  v8 = *(_DWORD *)(a1 + 176);
  *(_DWORD *)(a1 + 176) = a3;
  v9 = *(const char **)(a1 + 56);
  v10 = *__error();
  v11 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = "[anonymous]";
    *(_DWORD *)buf = 136447234;
    if (v9)
      v12 = v9;
    v14 = v12;
    v15 = 2080;
    v16 = v6;
    v17 = 1024;
    v18 = v8;
    v19 = 2080;
    v20 = a2;
    v21 = 1024;
    v22 = a3;
    _os_log_impl(&dword_211A95000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: socks proxy: %s:%d -> %s:%d", buf, 0x2Cu);
  }
  *__error() = v10;
  free(v6);
}

void _buff_destroy_CFData(int a1, int a2, CFTypeRef cf)
{
  CFRelease(cf);
}

void _cryptex_scrivener_sign_callback(void **a1)
{
  const void *v2;

  v2 = a1[2];
  ((void (*)(void *, _QWORD, void *, void *))a1[5])(*a1, *((_QWORD *)*a1 + 27), a1[2], a1[4]);
  ctx_destroy(a1);
  if (v2)
    CFRelease(v2);
}

uint64_t _cryptex_scrivener_init_tss_common(uint64_t a1)
{
  const char *v2;
  int v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const __CFString *v7;
  CFURLRef v8;
  CFURLRef v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const __CFAllocator *v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFStringRef v17;
  CFStringRef v18;
  unsigned int v19;
  const char *v20;
  int v21;
  NSObject *v22;
  char *v23;
  uint64_t v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  unsigned int v34;
  unsigned int v35;
  const char *v36;
  int v37;
  NSObject *v38;
  char *v39;
  const char *v40;
  unsigned int v41;
  const char *v42;
  char *v43;
  uint64_t v45;
  _OWORD v46[16];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  _BYTE v50[14];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  memset(v46, 0, sizeof(v46));
  v2 = *(const char **)(a1 + 56);
  v3 = *__error();
  v4 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = "[anonymous]";
    v6 = *(_QWORD *)(a1 + 160);
    if (v2)
      v5 = v2;
    *(_DWORD *)buf = 136446466;
    v48 = v5;
    v49 = 2080;
    *(_QWORD *)v50 = v6;
    _os_log_impl(&dword_211A95000, v4, OS_LOG_TYPE_DEBUG, "%{public}s: setting url: %s", buf, 0x16u);
  }
  *__error() = v3;
  v7 = _CFStringCreateFromUTF8String(*(char **)(a1 + 160));
  v8 = CFURLCreateWithString(0, v7, 0);
  if (!v8)
    _cryptex_scrivener_init_tss_common_cold_1(&v45, buf);
  v9 = v8;
  if (AMAuthInstallSetSigningServerURL())
    _cryptex_scrivener_init_tss_common_cold_4();
  if (!*(_QWORD *)(a1 + 168) || !*(_DWORD *)(a1 + 176))
    goto LABEL_23;
  v10 = *(const char **)(a1 + 56);
  v11 = *__error();
  v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = "[anonymous]";
    if (v10)
      v13 = v10;
    *(_DWORD *)buf = 136446210;
    v48 = v13;
    _os_log_impl(&dword_211A95000, v12, OS_LOG_TYPE_DEBUG, "%{public}s: using socks proxy", buf, 0xCu);
  }
  *__error() = v11;
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, (const void *)(a1 + 176));
  if (!v15)
    _cryptex_scrivener_init_tss_common_cold_2(&v45, buf);
  v16 = v15;
  v17 = CFStringCreateWithCString(v14, *(const char **)(a1 + 168), 0x8000100u);
  if (!v17)
    _cryptex_scrivener_init_tss_common_cold_3(&v45, buf);
  v18 = v17;
  v19 = AMAuthInstallSetSOCKSProxyInformation();
  if (v19)
  {
    v20 = *(const char **)(a1 + 56);
    v21 = *__error();
    v22 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      if (!v20)
        v20 = "[anonymous]";
      v23 = _AMAuthInstallErrorString(v19, (char *)v46);
      *(_DWORD *)buf = 136446722;
      v48 = v20;
      v49 = 1024;
      *(_DWORD *)v50 = v19;
      *(_WORD *)&v50[4] = 2082;
      *(_QWORD *)&v50[6] = v23;
      _os_log_impl(&dword_211A95000, v22, OS_LOG_TYPE_ERROR, "%{public}s: AMAuthInstallSetSOCKSProxyInformation: [%d] %{public}s", buf, 0x1Cu);
    }
    *__error() = v21;
    v24 = _AMAuthInstallPOSIXError(v19);
  }
  else
  {
    v24 = 0xFFFFFFFFLL;
  }
  CFRelease(v18);
  CFRelease(v16);
  if (!v19)
  {
LABEL_23:
    if ((*(_BYTE *)(a1 + 80) & 1) == 0)
    {
LABEL_24:
      v25 = *(const char **)(a1 + 56);
      v26 = *__error();
      v27 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = "[anonymous]";
        v29 = *(_QWORD *)(a1 + 192);
        if (v25)
          v28 = v25;
        *(_DWORD *)buf = 136446466;
        v48 = v28;
        v49 = 2112;
        *(_QWORD *)v50 = v29;
        _os_log_impl(&dword_211A95000, v27, OS_LOG_TYPE_DEBUG, "%{public}s: auth install = %@", buf, 0x16u);
      }
      v24 = 0;
      *__error() = v26;
      goto LABEL_45;
    }
    v30 = *(const char **)(a1 + 56);
    v31 = *__error();
    v32 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = "[anonymous]";
      if (v30)
        v33 = v30;
      *(_DWORD *)buf = 136446210;
      v48 = v33;
      _os_log_impl(&dword_211A95000, v32, OS_LOG_TYPE_DEBUG, "%{public}s: using sso", buf, 0xCu);
    }
    *__error() = v31;
    v34 = AMAuthInstallSsoInitialize();
    if (v34)
    {
      v35 = v34;
      v36 = *(const char **)(a1 + 56);
      v37 = *__error();
      v38 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        if (!v36)
          v36 = "[anonymous]";
        v39 = _AMAuthInstallErrorString(v35, (char *)v46);
        *(_DWORD *)buf = 136446722;
        v48 = v36;
        v49 = 1024;
        *(_DWORD *)v50 = v35;
        *(_WORD *)&v50[4] = 2082;
        *(_QWORD *)&v50[6] = v39;
        v40 = "%{public}s: AMAuthInstallSsoInitialize: [%d] %{public}s";
LABEL_43:
        _os_log_impl(&dword_211A95000, v38, OS_LOG_TYPE_ERROR, v40, buf, 0x1Cu);
      }
    }
    else
    {
      v41 = AMAuthInstallSsoEnable();
      if (!v41)
        goto LABEL_24;
      v35 = v41;
      v42 = *(const char **)(a1 + 56);
      v37 = *__error();
      v38 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        if (!v42)
          v42 = "[anonymous]";
        v43 = _AMAuthInstallErrorString(v35, (char *)v46);
        *(_DWORD *)buf = 136446722;
        v48 = v42;
        v49 = 1024;
        *(_DWORD *)v50 = v35;
        *(_WORD *)&v50[4] = 2082;
        *(_QWORD *)&v50[6] = v43;
        v40 = "%{public}s: AMAuthInstallSsoEnable: [%d] %{public}s";
        goto LABEL_43;
      }
    }
    *__error() = v37;
    v24 = _AMAuthInstallPOSIXError(v35);
  }
LABEL_45:
  CFRelease(v9);
  if (v7)
    CFRelease(v7);
  return v24;
}

uint64_t _cryptex_scrivener_init_tss_assets(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v4 = 0;
  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a1 + 7;
  while (1)
  {
    v6 = a1[11];
    v7 = *(_QWORD *)(v6 + v4 + 64);
    if (!v7)
    {
      v16 = (const char *)a1[7];
      v10 = *__error();
      v17 = a1[9];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = "[anonymous]";
        if (v16)
          v18 = v16;
        v19 = (*(_QWORD **)((char *)&cryptex_asset_types + v4))[5];
        *(_DWORD *)buf = 136446466;
        v34 = v18;
        v35 = 2080;
        v36 = v19;
        v14 = v17;
        v15 = "%{public}s: no asset of type: %s";
LABEL_14:
        _os_log_impl(&dword_211A95000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 0x16u);
      }
LABEL_15:
      *__error() = v10;
      goto LABEL_21;
    }
    v8 = *(_BYTE **)(v7 + 8);
    if ((*v8 & 0x14) == 0)
      break;
LABEL_21:
    v4 += 8;
    if (v4 == 96)
      return 0;
  }
  if (v8 == (_BYTE *)&_cryptex_asset_type_gdmg && cryptex_core_image_authapfs_enabled(v6))
  {
    v9 = (const char *)a1[7];
    v10 = *__error();
    v11 = a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = "[anonymous]";
      if (v9)
        v12 = v9;
      v13 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40);
      *(_DWORD *)buf = 136446466;
      v34 = v12;
      v35 = 2080;
      v36 = v13;
      v14 = v11;
      v15 = "%{public}s: skip stamping asset: %s";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v20 = (const char *)a1[7];
  v21 = *__error();
  v22 = a1[9];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = "[anonymous]";
    if (v20)
      v23 = v20;
    v24 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40);
    *(_DWORD *)buf = 136446466;
    v34 = v23;
    v35 = 2080;
    v36 = v24;
    _os_log_impl(&dword_211A95000, v22, OS_LOG_TYPE_DEBUG, "%{public}s: stamping asset: %s", buf, 0x16u);
  }
  *__error() = v21;
  v25 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD *))(*(_QWORD *)(v7 + 8) + 8))(v7, a1[24], a2, 0, v5);
  if (!(_DWORD)v25)
    goto LABEL_21;
  v26 = v25;
  v28 = (const char *)a1[7];
  v29 = *__error();
  v30 = a1[9];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = "[anonymous]";
    if (v28)
      v31 = v28;
    v32 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40);
    *(_DWORD *)buf = 136446722;
    v34 = v31;
    v35 = 2082;
    v36 = v32;
    v37 = 1024;
    v38 = v26;
    _os_log_impl(&dword_211A95000, v30, OS_LOG_TYPE_ERROR, "%{public}s: failed to stamp asset: %{public}s: %{darwin.errno}d", buf, 0x1Cu);
  }
  *__error() = v29;
  return v26;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_2(_QWORD *a1, _OWORD *a2)
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

char *OUTLINED_FUNCTION_12()
{
  unsigned int v0;

  return _AMAuthInstallErrorString(v0, 0);
}

CFNumberRef _CFNumberCreateFromUInt32(int a1)
{
  int valuePtr;

  valuePtr = a1;
  return CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
}

unint64_t _CFNumberGetUInt32(const __CFNumber *a1)
{
  uint64_t v2;
  unint64_t valuePtr;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  valuePtr = -1;
  if (!CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr))
    _CFNumberGetUInt32_cold_1();
  if (HIDWORD(valuePtr))
    _CFNumberGetUInt32_cold_2(&v2, v4);
  return valuePtr;
}

CFStringRef _CFStringCreateFromUTF8String(char *cStr)
{
  return CFStringCreateWithCString(0, cStr, 0x8000100u);
}

BOOL _CFStringLocalizeCaseInsensitiveContains(const __CFString *a1, const __CFString *a2)
{
  CFRange v5;

  v5.length = CFStringGetLength(a1);
  v5.location = 0;
  return CFStringFindWithOptions(a1, a2, v5, 0x21uLL, 0) != 0;
}

uint64_t _CFURLCreateFromFileDescriptor(uint64_t a1, CFURLRef *a2)
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  CFURLRef v6;
  uint64_t v8;
  char cStr[1024];
  _OWORD v10[5];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  bzero(cStr, 0x400uLL);
  v3 = realpath_np();
  if (!(_DWORD)v3)
  {
    v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
    if (!v4)
      _cryptex_scrivener_init_tss_common_cold_3(&v8, v10);
    v5 = v4;
    v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
    if (!v6)
      _cryptex_scrivener_init_tss_common_cold_1(&v8, v10);
    *a2 = v6;
    CFRelease(v5);
  }
  return v3;
}

CFMutableDictionaryRef _CFDictionaryCreateMutableForCFTypes()
{
  CFMutableDictionaryRef result;
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  result = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!result)
    _CFDictionaryCreateMutableForCFTypes_cold_1(&v1, v2);
  return result;
}

void _CFDictionarySetBool(__CFDictionary *a1, const void *a2, int a3)
{
  const void **v3;

  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(a1, a2, *v3);
}

void _CFDictionarySetUInt32(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v5)
    _cryptex_scrivener_init_tss_common_cold_2(&v8, v9);
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void _CFDictionarySetUInt64(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t valuePtr;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (!v5)
    _cryptex_scrivener_init_tss_common_cold_2(&v8, v9);
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void _CFDictionarySetString(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5;
  CFStringRef v6;
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v5)
    _cryptex_scrivener_init_tss_common_cold_3(&v7, v8);
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void _CFDictionaryMergeDictionary(void *context, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_CFDictionaryMergeDictionaryKey, context);
}

void _CFDictionaryMergeDictionaryKey(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

CFErrorRef createError(const char *a1, const char *a2, int a3, const char *a4, CFIndex a5, const void *a6, char *cStr)
{
  CFStringRef v12;
  CFStringRef v13;
  const __CFString *v14;
  CFStringRef v15;
  CFNumberRef v16;
  __CFDictionary *MutableForCFTypes;
  CFErrorRef v18;
  int valuePtr;

  valuePtr = a3;
  v12 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  v14 = CFStringCreateWithCString(0, a4, 0x8000100u);
  v15 = CFStringCreateWithCString(0, a2, 0x8000100u);
  v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
  CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x24BDBD3A0], v12);
  if (os_variant_allows_internal_security_policies())
  {
    CFDictionarySetValue(MutableForCFTypes, CFSTR("FunctionName"), v13);
    CFDictionarySetValue(MutableForCFTypes, CFSTR("FileName"), v15);
    CFDictionarySetValue(MutableForCFTypes, CFSTR("LineNumber"), v16);
  }
  if (a6)
    CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x24BDBD3B0], a6);
  v18 = CFErrorCreate(0, v14, a5, MutableForCFTypes);
  CFRelease(MutableForCFTypes);
  CFRelease(v12);
  CFRelease(v13);
  CFRelease(v14);
  CFRelease(v15);
  CFRelease(v16);
  return v18;
}

double hash_init(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

size_t hash_node_init_cstr(uint64_t a1, char *__s)
{
  size_t result;

  result = strlen(__s);
  *(_DWORD *)a1 |= 2u;
  *(_QWORD *)(a1 + 16) = __s;
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t hash_insert(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t result;

  v4 = os_simple_hash();
  if ((*(_BYTE *)a2 & 2) == 0)
    hash_insert_cold_1();
  v5 = v4;
  result = hash_lookup(a1, *(const void **)(a2 + 16), *(_QWORD *)(a2 + 24));
  if (result)
    hash_insert_cold_3();
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8 * (v5 % 0x25));
  *(_QWORD *)(a1 + 8 * (v5 % 0x25)) = a2;
  if ((*(_DWORD *)a2 & 1) != 0)
    hash_insert_cold_2();
  *(_DWORD *)a2 |= 1u;
  ++*(_QWORD *)(a1 + 296);
  return result;
}

uint64_t hash_lookup(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 8 * (os_simple_hash() % 0x25uLL)); i; i = *(_QWORD *)(i + 8))
  {
    if (*(_QWORD *)(i + 24) == a3 && !memcmp(*(const void **)(i + 16), a2, a3))
      break;
  }
  return i;
}

uint64_t hash_lookup_cstr(uint64_t a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return hash_lookup(a1, __s, v4);
}

void hash_insert_cold_1()
{
  _os_crash();
  __break(1u);
}

void hash_insert_cold_2()
{
  _os_crash();
  __break(1u);
}

void hash_insert_cold_3()
{
  _os_crash();
  __break(1u);
}

os_log_t object_proto_init(uint64_t a1, int a2, char *category)
{
  os_log_t result;

  result = os_log_create("com.apple.libcryptex", category);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void object_proto_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  os_release(*(void **)(a1 + 16));
}

uint64_t _sprintdgst(uint64_t __str, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v3;
  char *v4;
  size_t v6;
  int v7;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 0x31)
    _sprintdgst_cold_1(&v8, v9);
  v4 = (char *)__str;
  *(_BYTE *)(__str + 96) = 0;
  *(_OWORD *)(__str + 64) = 0u;
  *(_OWORD *)(__str + 80) = 0u;
  *(_OWORD *)(__str + 32) = 0u;
  *(_OWORD *)(__str + 48) = 0u;
  *(_OWORD *)__str = 0u;
  *(_OWORD *)(__str + 16) = 0u;
  if (a3)
  {
    v6 = 97;
    do
    {
      v7 = *a2++;
      __str = snprintf(v4, v6, "%02x", v7);
      v4 += 2;
      v6 -= 2;
      --v3;
    }
    while (v3);
  }
  return __str;
}

unint64_t _strtou32(const char *a1, char **a2, int a3)
{
  unint64_t result;
  char *__endptr;

  __endptr = 0;
  *__error() = 0;
  result = strtoul(a1, &__endptr, a3);
  if (__endptr && *__endptr)
  {
    result = 0;
    if (a2)
      *a2 = __endptr;
  }
  else if (HIDWORD(result))
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _read_file(int a1, _QWORD *a2)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  off_t st_size;
  void *v8;
  void *v10;
  ssize_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  ssize_t v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  stat v20;
  uint8_t buf[4];
  off_t v22;
  __int16 v23;
  off_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20))
  {
    v4 = *__error();
    v5 = *__error();
    v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_211A95000, v6, OS_LOG_TYPE_ERROR, "stat: %{darwin.errno}d", buf, 8u);
    }
    st_size = 0;
LABEL_5:
    v8 = 0;
    *__error() = v5;
LABEL_6:
    if (!(_DWORD)v4)
      goto LABEL_7;
    goto LABEL_8;
  }
  st_size = v20.st_size;
  if (v20.st_size < 0)
    cryptex_asset_create_generic_digest_cold_2();
  v10 = malloc_type_malloc(v20.st_size, 0xD8A116BDuLL);
  if (!v10)
  {
    v4 = *__error();
    v5 = *__error();
    v15 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_211A95000, v15, OS_LOG_TYPE_ERROR, "malloc: %{darwin.errno}d", buf, 8u);
    }
    goto LABEL_5;
  }
  v8 = v10;
  while (1)
  {
    v11 = pread(a1, v8, st_size, 0);
    if ((v11 & 0x8000000000000000) == 0)
      break;
    v12 = *__error();
    v13 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v14;
      _os_log_impl(&dword_211A95000, v13, OS_LOG_TYPE_ERROR, "pread: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    v4 = *__error();
    if ((_DWORD)v4 != 4)
      goto LABEL_6;
  }
  v16 = v11;
  v17 = *__error();
  v18 = os_log_create("com.apple.libcryptex", "utility");
  v19 = v18;
  if (v16 == st_size)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v22 = st_size;
      _os_log_impl(&dword_211A95000, v19, OS_LOG_TYPE_DEBUG, "read %ld bytes", buf, 0xCu);
    }
    *__error() = v17;
LABEL_7:
    buff_init(a2, 0, (uint64_t)_buff_destructor_free, (uint64_t)v8, st_size);
    v4 = 0;
    v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v22 = v16;
    v23 = 2048;
    v24 = st_size;
    _os_log_impl(&dword_211A95000, v19, OS_LOG_TYPE_ERROR, "truncated read: actual = %ld, expected = %lu", buf, 0x16u);
  }
  *__error() = v17;
  v4 = 5;
LABEL_8:
  free(v8);
  return v4;
}

uint64_t _write_file(int __fd, uint64_t a2)
{
  ssize_t v4;
  int v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  ssize_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  ssize_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  while (1)
  {
    v4 = pwrite(__fd, *(const void **)a2, *(_QWORD *)(a2 + 8), 0);
    if ((v4 & 0x8000000000000000) == 0)
      break;
    v5 = *__error();
    v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v7;
      _os_log_impl(&dword_211A95000, v6, OS_LOG_TYPE_ERROR, "write: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v5;
    v8 = *__error();
    if ((_DWORD)v8 != 4)
      return v8;
  }
  v9 = v4;
  v10 = *(_QWORD *)(a2 + 8);
  v11 = *__error();
  v12 = os_log_create("com.apple.libcryptex", "utility");
  v13 = v12;
  if (v9 == v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v9;
      _os_log_impl(&dword_211A95000, v13, OS_LOG_TYPE_DEBUG, "wrote %ld bytes", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = 5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a2 + 8);
      *(_DWORD *)buf = 134218496;
      v17 = v9;
      v18 = 2048;
      v19 = v14;
      v20 = 1024;
      v21 = 5;
      _os_log_impl(&dword_211A95000, v13, OS_LOG_TYPE_ERROR, "truncated write: actual = %ld, expected = %ld: %{darwin.errno}d", buf, 0x1Cu);
    }
  }
  *__error() = v11;
  return v8;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return _os_crash_msg();
}

void _sprintdgst_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_0();
  __break(1u);
}

uint64_t _buff_destructor_munmap(void *a1, size_t a2)
{
  uint64_t result;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  result = munmap(a1, a2);
  if ((_DWORD)result == -1)
    _buff_destructor_munmap_cold_1(&v3, v4);
  return result;
}

_QWORD *buff_init(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *result = a4;
  result[1] = a5;
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  if (a5 < 0)
    buff_init_cold_1(&v5, v6);
  return result;
}

_QWORD *buff_init_signed(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a5 < 0)
    buff_init_signed_cold_1(&v6, v7);
  return buff_init(a1, a2, a3, a4, a5);
}

double buff_xfer(__n128 *a1, __n128 *a2)
{
  double result;

  *(_QWORD *)&result = buff_xfer_subrange(a1, a2, 0, a2->n128_u64[1]).n128_u64[0];
  return result;
}

__n128 buff_xfer_subrange(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4)
{
  __n128 result;

  if (a4 + a3 > a2->n128_u64[1])
  {
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  a1->n128_u64[0] = a2->n128_u64[0] + a3;
  a1->n128_u64[1] = a4;
  a1[1].n128_u64[0] = a2->n128_u64[0];
  a1[1].n128_u64[1] = a2->n128_u64[1];
  result = a2[2];
  a1[2] = result;
  a2[2].n128_u64[1] = 0;
  return result;
}

_QWORD *buff_destroy(_QWORD *result)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD);

  if (result)
  {
    if (*result)
    {
      v1 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result[5];
      if (v1)
      {
        if (result[6])
          buff_destroy_cold_1();
        return (_QWORD *)v1(result[2], result[3], result[4]);
      }
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return _os_log_send_and_compose_impl();
}

void _buff_destructor_munmap_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void buff_init_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7_0();
  __break(1u);
}

void buff_init_signed_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7_0();
  __break(1u);
}

void buff_destroy_cold_1()
{
  _os_crash();
  __break(1u);
}

_QWORD *ctx_new(void *a1, size_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2 <= 0x17)
    ctx_new_cold_1(&v7, v8);
  if (_dispatch_is_multithreaded())
  {
    v4 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
    if (!v4)
    {
      do
      {
        __os_temporary_resource_shortage();
        v5 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      }
      while (!v5);
      v4 = v5;
    }
  }
  else
  {
    v4 = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (!v4)
      ctx_new_cold_2(&v7, v8);
  }
  if (a1)
    *v4 = os_retain(a1);
  return v4;
}

void ctx_destroy(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      os_release(v2);
    free(a1);
  }
}

void ctx_new_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  _os_crash_msg();
  __break(1u);
}

void ctx_new_cold_2(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_6_0();
  _os_crash_msg();
  __break(1u);
}

uint64_t _xpc_dictionary_try_get_uint64(void *a1, const char *a2, uint64_t *a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  uint64_t v7;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BE5998]() != MEMORY[0x24BDACFF8])
    return 79;
  v7 = xpc_uint64_get_value(v5);
  result = 0;
  *a3 = v7;
  return result;
}

uint64_t _xpc_dictionary_try_get_string(void *a1, const char *a2, const char **a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  const char *string_ptr;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BE5998]() != MEMORY[0x24BDACFF0])
    return 79;
  string_ptr = xpc_string_get_string_ptr(v5);
  result = 0;
  *a3 = string_ptr;
  return result;
}

uint64_t _xpc_dictionary_try_get_BOOL(void *a1, const char *a2, BOOL *a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  BOOL v7;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BE5998]() != MEMORY[0x24BDACF80])
    return 79;
  v7 = xpc_BOOL_get_value(v5);
  result = 0;
  *a3 = v7;
  return result;
}

void cryptex_core_set_asset_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  _os_crash_msg();
  __break(1u);
}

void cryptex_core_set_assets_from_directory_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  __error();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void cryptex_core_generate_identifier_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void cryptex_core_generate_version_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void cryptex_core_copy_nonce_domain_desc_cold_1(const char *a1)
{
  int *v1;

  OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  v1 = __error();
  OUTLINED_FUNCTION_8(v1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void session_core_generate_username_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void cryptex_session_core_create_from_xpc_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_session_core_create_from_xpc_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_session_core_create_from_xpc_cold_3()
{
  _os_crash();
  __break(1u);
}

void cryptex_session_core_create_from_xpc_cold_4()
{
  _os_crash();
  __break(1u);
}

void cryptex_session_core_create_from_xpc_cold_5()
{
  _os_crash();
  __break(1u);
}

void _cryptex_asset_generic_stamp_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_asset_generic_stamp_cold_2(_QWORD *a1, _OWORD *a2, unsigned int a3)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2();
  _AMAuthInstallErrorString(a3, 0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void cryptex_asset_new_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void cryptex_asset_create_generic_digest_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  _os_crash_msg();
  __break(1u);
}

void cryptex_asset_create_generic_digest_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_asset_create_generic_digest_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2_0();
  __error();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cftag_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_base_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_core_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_core_cx1_properties_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_host_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_magister_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_signature_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_scrivener_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _session_core_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void cryptex_core_unparse_hdiid_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_tss_set_c411_from_file_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_version_new_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void cryptex_version_new_cold_2(const char *a1, _QWORD *a2, _OWORD *a3)
{
  int *v5;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void cryptex_system_cryptex_copy_launchjob_tag_for_name_cold_1(const char *a1, _QWORD *a2, _OWORD *a3)
{
  int *v5;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_system_cryptex_copy_graft_abspath_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_magister_init_cold_1()
{
  _os_crash();
  __break(1u);
}

void _cryptex_magister_authenticate_toutoc_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  __error();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_magister_firmware_execute_toutoc_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  __error();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_magister_firmware_execute_toutoc_cold_2()
{
  _os_crash();
  __break(1u);
}

void _cryptex_magister_record_property_continue2_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_signature_seal_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_signature_create_cold_1()
{
  _os_crash();
  __break(1u);
}

void _cryptex_signature_compute_hash_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_scrivener_create_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_1();
  *v0 = 0;
  v1[3] = 0u;
  v1[4] = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  *v1 = 0uLL;
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_11();
  _os_log_send_and_compose_impl();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void cryptex_scrivener_set_url_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  const char *v2;
  int *v3;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7(v2);
  *v0 = 0;
  *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  v3 = __error();
  OUTLINED_FUNCTION_8(v3);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_scrivener_init_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_scrivener_init_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_scrivener_sign_continue_cold_2()
{
  _QWORD *v0;
  _OWORD *v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_scrivener_sign_continue_cold_3()
{
  _QWORD *v0;
  _OWORD *v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _cryptex_scrivener_read_continue_cold_1()
{
  _os_crash();
  __break(1u);
}

void _cryptex_scrivener_init_tss_common_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_scrivener_init_tss_common_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_scrivener_init_tss_common_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
}

void _cryptex_scrivener_init_tss_common_cold_4()
{
  _QWORD *v0;
  _OWORD *v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_5(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _CFNumberGetUInt32_cold_1()
{
  _os_crash();
  __break(1u);
}

void _CFNumberGetUInt32_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _CFDictionaryCreateMutableForCFTypes_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10();
  __break(1u);
  AMAuthInstallApCreateImagePropertiesWithDeviceMapZipped();
}

uint64_t AMAuthInstallApCreateImagePropertiesWithDeviceMapZipped()
{
  return MEMORY[0x24BEDA680]();
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x24BEDA688]();
}

uint64_t AMAuthInstallApImg4CreateServerRequestDictionary()
{
  return MEMORY[0x24BEDA690]();
}

uint64_t AMAuthInstallApImg4GetEntryNameForType()
{
  return MEMORY[0x24BEDA6A0]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x24BEDA6B8]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x24BEDA6C8]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x24BEDA6D0]();
}

uint64_t AMAuthInstallSetSOCKSProxyInformation()
{
  return MEMORY[0x24BEDA6E8]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x24BEDA6F0]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x24BEDA6F8]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x24BEDA700]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
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

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x24BDAC868]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x24BDAC9B0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x24BDACBD0]();
}

uint64_t aks_measure_and_seal_cryptex_manifest()
{
  return MEMORY[0x24BE07910]();
}

uint64_t aks_seal_cryptex_manifest_lock()
{
  return MEMORY[0x24BE07918]();
}

uint64_t aks_sealed_hashes_set()
{
  return MEMORY[0x24BE07920]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

uint64_t claimfd_np()
{
  return MEMORY[0x24BDAD9A0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t close_drop_optional_np()
{
  return MEMORY[0x24BDAD9E8]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

uint64_t dup_np()
{
  return MEMORY[0x24BDAE0C8]();
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE388](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE4F8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

uint64_t image4_environment_destroy()
{
  return MEMORY[0x24BEDC3D0]();
}

uint64_t image4_environment_new()
{
  return MEMORY[0x24BEDC3D8]();
}

uint64_t image4_trust_evaluate()
{
  return MEMORY[0x24BEDC3E8]();
}

uint64_t image4_trust_new()
{
  return MEMORY[0x24BEDC3F0]();
}

uint64_t image4_trust_record_property_BOOL()
{
  return MEMORY[0x24BEDC3F8]();
}

uint64_t image4_trust_record_property_data()
{
  return MEMORY[0x24BEDC400]();
}

uint64_t image4_trust_record_property_integer()
{
  return MEMORY[0x24BEDC408]();
}

uint64_t img4_chip_custom()
{
  return MEMORY[0x24BEDC418]();
}

uint64_t img4_chip_init_from_buff()
{
  return MEMORY[0x24BEDC420]();
}

uint64_t img4_chip_instantiate()
{
  return MEMORY[0x24BEDC428]();
}

uint64_t img4_chip_select_personalized_ap()
{
  return MEMORY[0x24BEDC430]();
}

uint64_t img4_firmware_attach_manifest()
{
  return MEMORY[0x24BEDC438]();
}

uint64_t img4_firmware_destroy()
{
  return MEMORY[0x24BEDC440]();
}

uint64_t img4_firmware_execute()
{
  return MEMORY[0x24BEDC448]();
}

uint64_t img4_firmware_init_from_buff()
{
  return MEMORY[0x24BEDC450]();
}

uint64_t img4_firmware_init_sentinel()
{
  return MEMORY[0x24BEDC458]();
}

uint64_t img4_firmware_new()
{
  return MEMORY[0x24BEDC460]();
}

uint64_t img4_firmware_new_from_fd_4MSM()
{
  return MEMORY[0x24BEDC468]();
}

uint64_t img4_firmware_select_chip()
{
  return MEMORY[0x24BEDC470]();
}

uint64_t img4_image_get_bytes()
{
  return MEMORY[0x24BEDC478]();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return MEMORY[0x24BEDC480]();
}

uint64_t img4_nonce_domain_get_from_handle()
{
  return MEMORY[0x24BEDC488]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x24BDAF240](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x24BDAF3F8](object);
}

uint64_t os_simple_hash()
{
  return MEMORY[0x24BDAF418]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

uint64_t realpath_np()
{
  return MEMORY[0x24BDAFAC8]();
}

uint64_t secure_config_database_create_slot()
{
  return MEMORY[0x24BDE83D0]();
}

uint64_t secure_config_database_create_slot_with_saltdata()
{
  return MEMORY[0x24BDE83D8]();
}

uint64_t secure_config_entry_create_with_buffer()
{
  return MEMORY[0x24BDE83E0]();
}

uint64_t secure_config_entry_set_metadata()
{
  return MEMORY[0x24BDE83E8]();
}

uint64_t secure_config_get_default_database()
{
  return MEMORY[0x24BDE83F0]();
}

uint64_t secure_config_slot_append_entry()
{
  return MEMORY[0x24BDE83F8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
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

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x24BDB0320](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0340](uu, out);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x24BDB0850]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x24BDB0970]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

