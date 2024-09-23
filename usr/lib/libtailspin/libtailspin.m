_QWORD *get_tailspin_ondisk_config()
{
  void *v0;
  _DWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BYTE __src[8192];
  uint64_t v54;

  MEMORY[0x1E0C80A78]();
  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/db/tailspin_config.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = tailspin_config_create_with_default_config();
    if (v1)
    {
      v2 = v1;
      objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("EnforcedByProfile"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("EnforcedByTasking"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("EnforcedByManualConfiguration"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v3)
      {
        if (v4)
          sub_1C1CC6F30();
        if (v5)
          sub_1C1CC6F30();
        if ((objc_msgSend(v3, "BOOLValue") & 1) == 0)
          sub_1C1CC6F30();
        v7 = 3;
      }
      else if (v4)
      {
        if (v5)
          sub_1C1CC6F30();
        if ((objc_msgSend(v4, "BOOLValue") & 1) == 0)
          sub_1C1CC6F30();
        v7 = 1;
      }
      else
      {
        if (!v5)
        {
          tailspin_config_free(v2);
          v2 = 0;
LABEL_73:

          goto LABEL_74;
        }
        if ((objc_msgSend(v5, "BOOLValue") & 1) == 0)
          sub_1C1CC6F30();
        v7 = 2;
      }
      *((_DWORD *)v2 + 2) = v7;
      objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("Enabled"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          *((_BYTE *)v2 + 8360) = objc_msgSend(v17, "BOOLValue");
          *v2 |= 0x80uLL;
          objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("EnabledModifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
            __strlcpy_chk();
          }

        }
      }
      v52 = v17;
      objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("KDebug"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("BufferSizeMegabytes"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v2[1030] = objc_msgSend(v22, "unsignedLongLongValue");
            *v2 |= 2uLL;
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("BufferSizeModifier"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
            {
              objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
              __strlcpy_chk();
            }

          }
        }
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("FilterDescriptor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = objc_retainAutorelease(v25);
            if (objc_msgSend(v26, "UTF8String"))
            {
              objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
              if (!trace_parse_filter())
              {
                memcpy((char *)v2 + 12, __src, 0x2000uLL);
                *v2 |= 1uLL;
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("FilterDescriptorModifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v27;
                if (v27)
                {
                  objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
                  __strlcpy_chk();
                }

              }
            }
          }
        }

      }
      objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("Sampling"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("OnCoreSamplingPeriodNanoseconds"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v2[1040] = objc_msgSend(v31, "unsignedLongLongValue");
            *v2 |= 0x10uLL;
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("OnCoreSamplingPeriodModifier"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (v32)
            {
              objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
              __strlcpy_chk();
            }

          }
        }
        v51 = v6;
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("FullSystemSamplingPeriodNanoseconds"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v2[1035] = objc_msgSend(v34, "unsignedLongLongValue");
            *v2 |= 8uLL;
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("FullSystemSamplingPeriodModifier"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35;
            if (v35)
            {
              objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
              __strlcpy_chk();
            }

          }
        }
        v50 = v31;
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("IsCswitchSamplingEnabled"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *((_DWORD *)v2 + 2099) = *((_DWORD *)v2 + 2099) & 0xFFFFFFFE | objc_msgSend(v37, "BOOLValue");
            *v2 |= 0x20uLL;
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("CswitchSamplingEnabledModifier"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            if (v38)
            {
              objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
              __strlcpy_chk();
            }

          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("IsSyscallSamplingEnabled"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v40, "BOOLValue"))
              v41 = 2;
            else
              v41 = 0;
            *((_DWORD *)v2 + 2099) = *((_DWORD *)v2 + 2099) & 0xFFFFFFFD | v41;
            *v2 |= 0x20uLL;
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("CswitchSamplingEnabledModifier"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v42)
            {
              objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
              __strlcpy_chk();
            }

          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("IsVMFaultSamplingEnabled"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v49 = v3;
            if (objc_msgSend(v44, "BOOLValue"))
              v45 = 4;
            else
              v45 = 0;
            *((_DWORD *)v2 + 2099) = *((_DWORD *)v2 + 2099) & 0xFFFFFFFB | v45;
            *v2 |= 0x20uLL;
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("CswitchSamplingEnabledModifier"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v46;
            if (v46)
            {
              objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
              __strlcpy_chk();
            }

            v3 = v49;
          }
        }

        v6 = v51;
      }
      if (!*v2)
        sub_1C1CC6F30();

      goto LABEL_73;
    }
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1C1CC6F00(v9, v10, v11, v12, v13, v14, v15, v16);

    v2 = 0;
    *__error() = v8;
  }
  else
  {
    v2 = 0;
  }
LABEL_74:

  return v2;
}

_DWORD *tailspin_config_create_with_default_config()
{
  _DWORD *v0;
  _DWORD *v1;
  void *v2;

  v0 = malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v0)
    sub_1C1CC6F30();
  v1 = v0;
  *(_QWORD *)v0 = 0;
  v0[2] = 0;
  *((_BYTE *)v0 + 8360) = tailspin_enabled_get_default();
  *((_QWORD *)v1 + 1030) = tailspin_buffer_size_get_default();
  v2 = tailspin_kdbg_filter_get_default();
  memcpy(v1 + 3, v2, 0x2000uLL);
  *((_QWORD *)v1 + 1035) = tailspin_full_sampling_period_get_default();
  *((_QWORD *)v1 + 1040) = tailspin_oncore_sampling_period_get_default();
  v1[2099] = tailspin_sampling_options_get_default();
  return v1;
}

void sub_1C1CACA64()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(const __CFString *, _QWORD);
  uint64_t (*v4)(const __CFString *, _QWORD);
  void *v5;
  void *v6;
  char *v7;

  v0 = (void *)MEMORY[0x1C3BB47E4]();
  v1 = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (v1)
  {
    v2 = v1;
    v3 = (uint64_t (*)(const __CFString *, _QWORD))dlsym(v1, "MGCopyAnswer");
    if (!v3)
    {
LABEL_15:
      dlclose(v2);
      goto LABEL_16;
    }
    v4 = v3;
    v5 = (void *)v3(CFSTR("ProductType"), 0);
    v6 = v5;
    if (v5
      && ((objc_msgSend(v5, "containsString:", CFSTR("iPhone")) & 1) != 0
       || (objc_msgSend(v6, "containsString:", CFSTR("iPad")) & 1) != 0
       || (objc_msgSend(v6, "containsString:", CFSTR("iPod")) & 1) != 0
       || (objc_msgSend(v6, "containsString:", CFSTR("Watch")) & 1) != 0
       || (objc_msgSend(v6, "containsString:", CFSTR("AppleTV")) & 1) != 0))
    {
      v7 = &byte_1ED0C4719;
    }
    else
    {
      if ((byte_1ED0C4719 & 1) != 0 || !v4(CFSTR("IsComputeNode"), 0))
        goto LABEL_14;
      byte_1ED0C4719 = 1;
      v7 = &byte_1EF718C90;
    }
    *v7 = 1;
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
  objc_autoreleasePoolPop(v0);
}

uint64_t tailspin_enabled_get_default()
{
  if (qword_1ED0C4748 != -1)
    dispatch_once(&qword_1ED0C4748, &unk_1E7B8EAF0);
  return byte_1ED0C4750;
}

id tailspin_compress_file()
{
  void *v0;
  int v1;
  int v2;
  id v3;
  id v4;
  const char *v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  id v12;
  int v13;
  NSObject *v14;
  uint64_t v16;
  id v17;
  int v18;
  NSObject *v19;
  id v20;
  id v21;
  int v22;
  ssize_t v23;
  ssize_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  int v31;
  NSObject *v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  NSObject *v37;
  int v38;
  NSObject *v39;
  id v40;
  uint8_t buf[15];
  unsigned __int8 v42;
  stat v43;
  _BYTE v44[10240];
  uint64_t v45;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v2 = v1;
  v45 = *MEMORY[0x1E0C80C00];
  v3 = v0;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".tgz"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = open(v5, 2562, 432);
  if (v6 < 0)
  {
    v10 = *__error();
    sub_1C1CB1954();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1C1CC68EC();

    *__error() = v10;
LABEL_20:
    if (v6 != -1)
      close(v6);
LABEL_22:
    if (unlink(v5) && *__error() != 2)
    {
      v13 = *__error();
      sub_1C1CB1954();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1C1CC6880();

      v12 = 0;
      *__error() = v13;
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_28;
  }
  v7 = archive_write_new();
  if (archive_write_add_filter_gzip())
  {
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1C1CC6E60();
LABEL_17:

    *__error() = v8;
LABEL_18:
    if (v7)
    {
      archive_write_close();
      archive_write_free();
    }
    goto LABEL_20;
  }
  if (archive_write_set_options())
  {
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1C1CC6DF0();
    goto LABEL_17;
  }
  if (archive_write_set_format_pax())
  {
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1C1CC6D80();
    goto LABEL_17;
  }
  if (archive_write_open_fd())
  {
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1C1CC6D10();
    goto LABEL_17;
  }
  v16 = archive_entry_new();
  memset(&v43, 0, sizeof(v43));
  v17 = objc_retainAutorelease(v3);
  if (stat((const char *)objc_msgSend(v17, "UTF8String"), &v43))
  {
    v18 = *__error();
    sub_1C1CB1954();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1C1CC6CA4();
LABEL_35:

    *__error() = v18;
LABEL_36:
    if (v16)
      archive_entry_free();
    goto LABEL_18;
  }
  archive_entry_copy_stat();
  objc_msgSend(v17, "lastPathComponent");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "UTF8String");
  archive_entry_set_pathname();

  archive_entry_set_filetype();
  archive_entry_set_perm();
  if (archive_write_header())
  {
    v18 = *__error();
    sub_1C1CB1954();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1C1CC6C34();
    goto LABEL_35;
  }
  v21 = objc_retainAutorelease(v17);
  v22 = open((const char *)objc_msgSend(v21, "UTF8String"), 0);
  if (v22 < 0)
  {
    v27 = *__error();
    sub_1C1CB1954();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1C1CC6958();
    goto LABEL_46;
  }
  v40 = v21;
  while (1)
  {
    v23 = read(v22, v44, 0x2800uLL);
    v24 = v23;
    if (v23 < 1)
      break;
    v25 = archive_write_data();
    if (v25 != v24)
    {
      v26 = v25;
      v27 = *__error();
      sub_1C1CB1954();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1C1CC69C4(v7, v26, v28);
      goto LABEL_46;
    }
  }
  if (v23 < 0 && *__error() != 4)
  {
    v27 = *__error();
    sub_1C1CB1954();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1C1CC6BC8();
LABEL_46:

    *__error() = v27;
    if (v22 != -1)
      close(v22);
    goto LABEL_36;
  }
  archive_entry_free();
  close(v22);
  if (archive_write_close())
  {
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1C1CC6B58();
    goto LABEL_17;
  }
  v29 = archive_write_free();
  if (v29)
  {
    v30 = v29;
    v31 = *__error();
    sub_1C1CB1954();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1C1CC6AE4(v30, v32);

    *__error() = v31;
    goto LABEL_20;
  }
  close(v6);
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "fileExistsAtPath:isDirectory:", v4, &v42);
  v35 = v42;

  if (!v34 || v35)
    goto LABEL_22;
  v36 = *__error();
  sub_1C1CB1954();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1CAA000, v37, OS_LOG_TYPE_INFO, "Successfully compressed file", buf, 2u);
  }

  *__error() = v36;
  if (v2 && unlink((const char *)objc_msgSend(objc_retainAutorelease(v40), "UTF8String")))
  {
    v38 = *__error();
    sub_1C1CB1954();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1C1CC6A78();

    *__error() = v38;
  }
  v12 = v4;
LABEL_28:

  return v12;
}

void sub_1C1CAD280(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1C1CAD294(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

uint64_t sub_1C1CAD2B8()
{
  return archive_error_string();
}

int *sub_1C1CAD2E0()
{
  return __error();
}

uint64_t sub_1C1CAD2E8()
{
  return archive_errno();
}

uint64_t tailspin_parse_stackshot_chunk(uint64_t *a1, unint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = 22;
  if (a1 && a2 >= 0x10)
  {
    *a3 = 0;
    *a4 = 0;
    v6 = (char *)a1 + a2;
    v9 = *a1;
    v7 = a1 + 2;
    v8 = v9;
    if ((char *)v7 + v9 <= v6)
    {
      result = 0;
      *a3 = v7;
      *a4 = v8;
    }
  }
  return result;
}

size_t set_config_field_modifier(size_t result, const char *a2)
{
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  if (a2)
    return strlcpy((char *)result, a2, 0x20uLL);
  return result;
}

uint64_t get_responsible_pid_and_name(uint64_t a1, char *a2, uint32_t a3)
{
  if (!proc_name(a1, a2, a3))
    strlcpy(a2, "<unknown>", a3);
  return a1;
}

char *get_tailspin_tasking_config()
{
  char *v0;
  char *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v24[8192];
  uint64_t v25;

  MEMORY[0x1E0C80A78]();
  v25 = *MEMORY[0x1E0C80C00];
  v0 = (char *)tailspin_config_create_with_default_config();
  if (v0)
  {
    v1 = v0;
    OSAGetDATaskingValue();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v1[8360] = objc_msgSend(v2, "BOOLValue");
        *(_QWORD *)v1 |= 0x80uLL;
      }
    }
    OSAGetDATaskingValue();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *((_QWORD *)v1 + 1030) = objc_msgSend(v3, "unsignedLongLongValue");
        *(_QWORD *)v1 |= 2uLL;
      }
    }
    OSAGetDATaskingValue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = objc_retainAutorelease(v4);
        if (objc_msgSend(v5, "UTF8String"))
        {
          objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
          if (!trace_parse_filter())
          {
            memcpy(v1 + 12, v24, 0x2000uLL);
            *(_QWORD *)v1 |= 1uLL;
          }
        }
      }
    }
    OSAGetDATaskingValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *((_QWORD *)v1 + 1040) = objc_msgSend(v6, "unsignedLongLongValue");
        *(_QWORD *)v1 |= 0x10uLL;
      }
    }
    OSAGetDATaskingValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *((_QWORD *)v1 + 1035) = objc_msgSend(v7, "unsignedLongLongValue");
        *(_QWORD *)v1 |= 8uLL;
      }
    }
    OSAGetDATaskingValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    OSAGetDATaskingValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    OSAGetDATaskingValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *((_DWORD *)v1 + 2099) = *((_DWORD *)v1 + 2099) & 0xFFFFFFFE | objc_msgSend(v8, "BOOLValue");
        *(_QWORD *)v1 |= 0x20uLL;
      }
    }
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v9, "BOOLValue"))
          v11 = 2;
        else
          v11 = 0;
        *((_DWORD *)v1 + 2099) = *((_DWORD *)v1 + 2099) & 0xFFFFFFFD | v11;
        *(_QWORD *)v1 |= 0x20uLL;
      }
    }
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (objc_msgSend(v10, "BOOLValue"))
        v12 = 4;
      else
        v12 = 0;
      *((_DWORD *)v1 + 2099) = *((_DWORD *)v1 + 2099) & 0xFFFFFFFB | v12;
      *(_QWORD *)v1 |= 0x20uLL;
      *((_DWORD *)v1 + 2) = 1;
    }
    else
    {
      v13 = *(_QWORD *)v1;
      *((_DWORD *)v1 + 2) = 1;
      if (!v13)
      {
        tailspin_config_free(v1);
        v1 = 0;
      }
    }

  }
  else
  {
    v14 = *__error();
    sub_1C1CB1954();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1C1CC6ED0(v15, v16, v17, v18, v19, v20, v21, v22);

    v1 = 0;
    *__error() = v14;
  }
  return v1;
}

char *get_tailspin_profile_config()
{
  void *v0;
  void *v1;
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE __src[8192];
  uint64_t v30;

  MEMORY[0x1E0C80A78]();
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/Library/Managed Preferences/mobile/com.apple.tailspin.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0 && objc_msgSend(v0, "count"))
  {
    v2 = (char *)tailspin_config_create_with_default_config();
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Enabled"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3[8360] = objc_msgSend(v4, "BOOLValue");
          *(_QWORD *)v3 |= 0x80uLL;
        }
      }
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("KDebug"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BufferSizeMegabytes"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *((_QWORD *)v3 + 1030) = objc_msgSend(v7, "unsignedLongLongValue");
            *(_QWORD *)v3 |= 2uLL;
          }
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FilterDescriptor"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = objc_retainAutorelease(v8);
            if (objc_msgSend(v9, "UTF8String"))
            {
              objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
              if (!trace_parse_filter())
              {
                memcpy(v3 + 12, __src, 0x2000uLL);
                *(_QWORD *)v3 |= 1uLL;
              }
            }
          }
        }

      }
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Sampling"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("OnCoreSamplingPeriodNanoseconds"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *((_QWORD *)v3 + 1040) = objc_msgSend(v12, "unsignedLongLongValue");
            *(_QWORD *)v3 |= 0x10uLL;
          }
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FullSystemSamplingPeriodNanoseconds"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *((_QWORD *)v3 + 1035) = objc_msgSend(v13, "unsignedLongLongValue");
            *(_QWORD *)v3 |= 8uLL;
          }
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsCswitchSamplingEnabled"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *((_DWORD *)v3 + 2099) = *((_DWORD *)v3 + 2099) & 0xFFFFFFFE | objc_msgSend(v14, "BOOLValue");
            *(_QWORD *)v3 |= 0x20uLL;
          }
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsSyscallSamplingEnabled"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v15, "BOOLValue"))
              v16 = 2;
            else
              v16 = 0;
            *((_DWORD *)v3 + 2099) = *((_DWORD *)v3 + 2099) & 0xFFFFFFFD | v16;
            *(_QWORD *)v3 |= 0x20uLL;
          }
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsVMFaultSamplingEnabled"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v17, "BOOLValue"))
              v18 = 4;
            else
              v18 = 0;
            *((_DWORD *)v3 + 2099) = *((_DWORD *)v3 + 2099) & 0xFFFFFFFB | v18;
            *(_QWORD *)v3 |= 0x20uLL;
          }
        }

      }
      *((_DWORD *)v3 + 2) = 3;
      if (!*(_QWORD *)v3)
      {
        tailspin_config_free(v3);
        v3 = 0;
      }

    }
    else
    {
      v20 = *__error();
      sub_1C1CB1954();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1C1CC6F00(v21, v22, v23, v24, v25, v26, v27, v28);

      v3 = 0;
      *__error() = v20;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id tailspin_make_ondisk_config(uint64_t *a1, char a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    sub_1C1CC6F30();
  v5 = v4;
  if ((a2 & 1) != 0 || (*(_BYTE *)a1 & 0x80) != 0)
  {
    if (*((_BYTE *)a1 + 8360))
      v6 = MEMORY[0x1E0C9AAB0];
    else
      v6 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Enabled"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a1 + 8361);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("EnabledModifier"));

  }
  v8 = *((_DWORD *)a1 + 2) - 1;
  if (v8 <= 2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], off_1E7B8EE88[v8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    sub_1C1CC6F30();
  v10 = (void *)v9;
  if ((a2 & 1) == 0)
  {
    v11 = *a1;
    if ((*a1 & 2) == 0)
    {
LABEL_15:
      if ((v11 & 1) == 0)
        goto LABEL_18;
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a1[1030]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("BufferSizeMegabytes"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1 + 1031);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("BufferSizeModifier"));

  if ((a2 & 1) == 0)
  {
    v11 = *a1;
    goto LABEL_15;
  }
LABEL_16:
  v14 = MEMORY[0x1C3BB4B38]((char *)a1 + 12);
  if (!v14)
    sub_1C1CC6F30();
  v15 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("FilterDescriptor"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a1 + 8204);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("FilterDescriptorModifier"));

  free(v15);
LABEL_18:
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("KDebug"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    sub_1C1CC6F30();
  v19 = (void *)v18;
  if ((a2 & 1) != 0 || (v20 = *a1, (*a1 & 0x10) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[1040]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("OnCoreSamplingPeriodNanoseconds"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1 + 1041);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("OnCoreSamplingPeriodModifier"));

    if ((a2 & 1) != 0)
      goto LABEL_26;
    v20 = *a1;
  }
  if ((v20 & 8) == 0)
    goto LABEL_28;
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[1035]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("FullSystemSamplingPeriodNanoseconds"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1 + 1036);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("FullSystemSamplingPeriodModifier"));

  if ((a2 & 1) == 0)
  {
    v20 = *a1;
LABEL_28:
    if ((v20 & 0x20) == 0)
      goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((_DWORD *)a1 + 2099) & 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("IsCswitchSamplingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((_DWORD *)a1 + 2099) >> 1) & 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("IsSyscallSamplingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((_DWORD *)a1 + 2099) >> 2) & 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("IsVMFaultSamplingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1 + 1050);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, CFSTR("CswitchSamplingEnabledModifier"));

LABEL_30:
  if (objc_msgSend(v19, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("Sampling"));
  if (objc_msgSend(v5, "count"))
    v29 = v5;
  else
    v29 = 0;
  v30 = v29;

  return v30;
}

uint64_t sub_1C1CADFFC()
{
  return _os_assert_log();
}

void sub_1C1CAE004(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1C1CAE01C()
{
  CFMutableDictionaryRef v0;
  const void *v1;
  const void *Subscription;
  int v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  CFTypeRef cf;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_1C1CAE318;
  v14[4] = sub_1C1CAE328;
  v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_1C1CAE318;
  v12[4] = sub_1C1CAE328;
  v13 = 0;
  cf = 0;
  v0 = IOServiceMatching("AGXAccelerator");
  v1 = (const void *)IOReportCopyChannelsForDrivers();
  CFRelease(v0);
  if (v1)
  {
    if (IOReportGetChannelCount())
    {
      Subscription = (const void *)IOReportCreateSubscription();
      v8 = *__error();
      sub_1C1CB1954();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1C1CC7048((uint64_t *)&cf, v9, v10);

      *__error() = v8;
    }
    else
    {
      v6 = *__error();
      sub_1C1CB1954();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_1C1CC6FB0();

      Subscription = 0;
      *__error() = v6;
    }
    if (cf)
      CFRelease(cf);
    if (Subscription)
      CFRelease(Subscription);
    CFRelease(v1);
  }
  else
  {
    v3 = *__error();
    sub_1C1CB1954();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1C1CC6F44((uint64_t *)&cf, v4, v5);

    *__error() = v3;
  }
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(v14, 8);
}

void sub_1C1CAE2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CAE318(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1C1CAE328(uint64_t a1)
{

}

uint64_t sub_1C1CAE330(uint64_t a1)
{
  const __CFString *Group;
  const void *ChannelName;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  Group = (const __CFString *)IOReportChannelGetGroup();
  if (IOReportChannelGetFormat() == 1
    && CFStringCompare(Group, CFSTR("Internal Statistics"), 0) == kCFCompareEqualTo)
  {
    ChannelName = (const void *)IOReportChannelGetChannelName();
    if (CFEqual(ChannelName, CFSTR("GPU Restart Count")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IOReportSimpleGetIntegerValue());
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
LABEL_7:
      v6 = *(_QWORD *)(v5 + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v4;

      goto LABEL_8;
    }
    if (CFEqual(ChannelName, CFSTR("Last GPU Restart")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", IOReportSimpleGetIntegerValue());
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      goto LABEL_7;
    }
  }
LABEL_8:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    return 273;
  }
  else
  {
    return 0;
  }
}

uint64_t tailspin_write_metadata_chunk(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  mach_port_t v21;
  const __CFDictionary *v22;
  io_service_t MatchingService;
  io_object_t v24;
  void *CFProperty;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint32_t state;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  CFPropertyListRef v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  NSObject *v63;
  int v64;
  NSObject *v65;
  uint64_t v66;
  int v67;
  NSObject *v68;
  void *v69;
  void *v70;
  int v71;
  NSObject *v72;
  uint64_t v73;
  int v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  NSObject *v84;
  _BOOL4 v85;
  id v86;
  const __CFString *v87;
  int v88;
  NSObject *v89;
  const __CFBoolean *v90;
  const __CFBoolean *v91;
  int Value;
  _BOOL8 v93;
  void *v94;
  id v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  int v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t j;
  void *v117;
  id v118;
  void *v119;
  int v120;
  NSObject *v121;
  int v122;
  int v123;
  NSObject *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  id v137;
  int v138;
  NSObject *v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  uint64_t v144;
  int v145;
  NSObject *v146;
  int v147;
  NSObject *v148;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  void *v158;
  void *context;
  const __CFString *v160;
  CFDictionaryRef AdvisoryDetailed;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  id v167[3];
  size_t v168;
  unsigned int v169;
  size_t v170;
  unsigned int v171;
  size_t v172;
  unsigned int v173;
  size_t v174;
  uint8_t v175;
  _BYTE v176[7];
  uint64_t v177;
  int out_token[4];
  __int128 v179;
  __int128 v180;
  __int128 v181;
  id v182;
  statfs state64;
  _BYTE v184[1024];
  uint8_t buf[12];
  __int16 v186;
  void *v187;
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = MEMORY[0x1C3BB47E4]();
  v174 = 0;
  if (!a1)
    sub_1C1CC6F30();
  context = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x1E0CB3000uLL;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("TailspinDumpReason"));

  }
  v12 = 0x1E0CB3000uLL;
  if ((a4 & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("TailspinTargetPID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sysconf(57));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("ncpus"));

  v15 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0C9AB90]), CFSTR("osversion"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E0C9AB98]), CFSTR("osproductname"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E0C9ABB0]), CFSTR("osproductversion"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E0C9ABA8]), CFSTR("osproductversionextra"));
    CFRelease(v16);
  }
  bzero(v184, 0x400uLL);
  v174 = 1024;
  sysctlbyname("hw.model", v184, &v174, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v184);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("hw.model"));

  v173 = 0;
  v172 = 4;
  if (!sysctlbyname("vm.pagesize", &v173, &v172, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v173);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("vm.pagesize"));

  }
  v171 = 0;
  v170 = 4;
  if (!sysctlbyname("hw.pagesize", &v171, &v170, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v171);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("hw.pagesize"));

  }
  v169 = 0;
  v168 = 4;
  if (!sysctlbyname("hw.memsize", &v169, &v168, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v169);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("hw.memsize"));

  }
  v21 = *MEMORY[0x1E0CBBAA8];
  v22 = IOServiceMatching("AGXAccelerator");
  MatchingService = IOServiceGetMatchingService(v21, v22);
  if (MatchingService)
  {
    v24 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("AGXTraceCodeVersion"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    IOObjectRelease(v24);
    if (CFProperty)
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFProperty, CFSTR("AGXVersion"));

    }
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsKPerfPETMode"));
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v163 = v9;
  AdvisoryDetailed = IOCopySystemLoadAdvisoryDetailed();
  v162 = v26;
  if (AdvisoryDetailed)
  {
    -[__CFDictionary objectForKeyedSubscript:](AdvisoryDetailed, "objectForKeyedSubscript:", CFSTR("UserLevel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](AdvisoryDetailed, "objectForKeyedSubscript:", CFSTR("BatteryLevel"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](AdvisoryDetailed, "objectForKeyedSubscript:", CFSTR("CombinedLevel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v162, "setObject:forKeyedSubscript:", v30, CFSTR("User"));

        v9 = v163;
      }
    }
    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (void *)objc_msgSend(v28, "copy");
        objc_msgSend(v162, "setObject:forKeyedSubscript:", v31, CFSTR("Battery"));

        v9 = v163;
      }
    }
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(v162, "setObject:forKeyedSubscript:", v32, CFSTR("Combined"));

        v9 = v163;
      }
    }

    v26 = v162;
  }
  out_token[0] = 0;
  if (!notify_register_check((const char *)*MEMORY[0x1E0C83A00], out_token))
  {
    *(_QWORD *)&state64.f_bsize = 0;
    state = notify_get_state(out_token[0], (uint64_t *)&state64.f_bsize);
    v34 = *(_QWORD *)&state64.f_bsize;
    notify_cancel(out_token[0]);
    if (!state)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("ThermalPressure"));

    }
  }
  if (objc_msgSend(v26, "count"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("SystemAdvisoryLevels"));
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("TailspinConfiguration"));
  NSHomeDirectoryForUser(CFSTR("mobile"));
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v36, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      memset(&state64, 0, 512);
      v39 = objc_retainAutorelease(v38);
      if (!statfs((const char *)objc_msgSend(v39, "fileSystemRepresentation"), &state64))
      {
        v40 = state64.f_blocks * state64.f_bsize;
        v41 = state64.f_bavail * state64.f_bsize;
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("VolumeTotal"));

        v44 = v41;
        v9 = v163;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, CFSTR("VolumeAvailable"));

        memset(buf, 0, sizeof(buf));
        out_token[3] = 0;
        *(_QWORD *)&v179 = 0;
        *(_QWORD *)out_token = 5;
        out_token[2] = 32;
        v46 = objc_retainAutorelease(v39);
        if (!getattrlist((const char *)objc_msgSend(v46, "fileSystemRepresentation"), out_token, buf, 0xCuLL, 1u))
        {
          v182 = 0;
          if (!fsctl((const char *)objc_msgSend(objc_retainAutorelease(v46), "fileSystemRepresentation"), 0x4004681BuLL, &v182, 0))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&buf[4] * (_QWORD)v182);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v47, CFSTR("VolumeLowSpaceThreshold"));

          }
        }
        objc_msgSend(v163, "setObject:forKeyedSubscript:", v42, CFSTR("HomeVolumeSpace"));

      }
    }
  }
  v165 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v160 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v48 = CFPreferencesCopyValue(CFSTR("KeyboardsCurrentAndNext"), CFSTR("com.apple.keyboard.preferences"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v158 = (void *)v48;
  if (v48 && (v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v156 = v7;
    v180 = 0u;
    v181 = 0u;
    *(_OWORD *)out_token = 0u;
    v179 = 0u;
    v50 = v49;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", out_token, &state64, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v179;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v179 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*(_QWORD *)&out_token[2] + 8 * i);
          if (v55 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v56 = v10;
            objc_msgSend(v55, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@sw="), CFSTR(" "));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@hw="), CFSTR(" "));
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v58, "stringByReplacingOccurrencesOfString:withString:", CFSTR(";hw="), &stru_1E7B90448);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v59, "stringByReplacingOccurrencesOfString:withString:", CFSTR(";sw="), &stru_1E7B90448);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v60, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Automatic"), &stru_1E7B90448);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            v62 = *__error();
            sub_1C1CB1954();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v55;
              v186 = 2112;
              v187 = v61;
              _os_log_debug_impl(&dword_1C1CAA000, v63, OS_LOG_TYPE_DEBUG, "keyboard %@ -> %@", buf, 0x16u);
            }

            *__error() = v62;
            if ((objc_msgSend(v165, "containsObject:", v61) & 1) == 0)
              objc_msgSend(v165, "addObject:", v61);

            v10 = v56;
          }
          else
          {
            v64 = *__error();
            sub_1C1CB1954();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              sub_1C1CC758C(&v175, v176, v65);

            *__error() = v64;
          }
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", out_token, &state64, 16);
      }
      while (v52);
    }

    v66 = objc_msgSend(v165, "copy");
    v7 = v156;
    v9 = v163;
    v12 = 0x1E0CB3000;
  }
  else
  {
    v67 = *__error();
    sub_1C1CB1954();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_1C1CC7560();

    v66 = 0;
    *__error() = v67;
  }

  if (v66)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v66, CFSTR("KeyboardLanguages"));
  v166 = (void *)v66;
  sub_1C1CB0D10();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (!v69 || !objc_msgSend(v69, "count"))
  {
    v74 = *__error();
    sub_1C1CB1954();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      sub_1C1CC74D4();

    *__error() = v74;
    goto LABEL_80;
  }
  v71 = *__error();
  sub_1C1CB1954();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    sub_1C1CC7500();

  *__error() = v71;
  if ((unint64_t)objc_msgSend(v70, "count") < 2)
  {
    v76 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v70, "firstObject");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "arrayWithObject:", v77);
    v73 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v70, "subarrayWithRange:", 0, 2);
    v73 = objc_claimAutoreleasedReturnValue();
  }

  if (v73)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v73, CFSTR("PreferredLanguages"));
    v70 = (void *)v73;
LABEL_80:

  }
  sub_1C1CB0D10();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v78, "firstObject");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "localeWithLocaleIdentifier:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = *__error();
  sub_1C1CB1954();
  v84 = objc_claimAutoreleasedReturnValue();
  v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG);
  if (v82)
  {
    if (v85)
      sub_1C1CC7474();

    *__error() = v83;
    v86 = v82;

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v86, CFSTR("CountryCode"));
  }
  else
  {
    if (v85)
      sub_1C1CC7448();

    *__error() = v83;
  }
  v177 = 0;
  *(_QWORD *)out_token = 0;
  *(_QWORD *)buf = 0;
  v182 = 0;
  *(_QWORD *)&state64.f_bsize = 8;
  v87 = v160;
  if (sysctlbyname("kern.num_vnodes", out_token, (size_t *)&state64.f_bsize, 0, 0))
  {
    v88 = *__error();
    sub_1C1CB1954();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_1C1CC73D8();
LABEL_100:

    *__error() = v88;
    goto LABEL_101;
  }
  *(_QWORD *)&state64.f_bsize = 8;
  if (sysctlbyname("kern.free_vnodes", buf, (size_t *)&state64.f_bsize, 0, 0))
  {
    v88 = *__error();
    sub_1C1CB1954();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_1C1CC7368();
    goto LABEL_100;
  }
  *(_QWORD *)&state64.f_bsize = 8;
  if (sysctlbyname("kern.maxvnodes", &v182, (size_t *)&state64.f_bsize, 0, 0))
  {
    v88 = *__error();
    sub_1C1CB1954();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_1C1CC72F8();
    goto LABEL_100;
  }
  *(_QWORD *)&state64.f_bsize = 8;
  if (sysctlbyname("vfs.vnstats.vn_dealloc_level", &v177, (size_t *)&state64.f_bsize, 0, 0))
  {
    v88 = *__error();
    sub_1C1CB1954();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_1C1CC7288();
    goto LABEL_100;
  }
  v150 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(*(id *)(v12 + 2024), "numberWithUnsignedLongLong:", *(_QWORD *)out_token);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v12 + 2024), "numberWithUnsignedLongLong:", *(_QWORD *)buf);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v12 + 2024), "numberWithUnsignedLongLong:", v182);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v177);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0x1E0CB3000;
  v155 = (void *)objc_msgSend(v150, "initWithObjectsAndKeys:", v151, CFSTR("NumVnodesAllocated"), v152, CFSTR("NumVnodesFree"), v153, CFSTR("NumVnodesMax"), v154, CFSTR("VnodeDeallocLevel"), 0);

  v9 = v163;
  v87 = v160;

  if (v155)
  {
    objc_msgSend(v163, "setObject:forKeyedSubscript:", v155, CFSTR("VnodeInfo"));

  }
LABEL_101:
  v90 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("HardwareKeyboardLastSeen"), CFSTR("com.apple.keyboard.preferences"), CFSTR("mobile"), v87);
  v93 = 0;
  if (v90)
  {
    v91 = v90;
    Value = CFBooleanGetValue(v90);
    CFRelease(v91);
    if (Value)
      v93 = 1;
  }
  objc_msgSend(*(id *)(v12 + 2024), "numberWithBool:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v94, CFSTR("HardwareKeyboard"));

  v164 = v82;
  if (qword_1EF718C70 != -1)
    dispatch_once(&qword_1EF718C70, &unk_1E7B8EFE0);
  v95 = (id)qword_1EF718C78;
  if (v95)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v95, CFSTR("NonDefaultFeatureFlags"));
  v96 = is_apple_internal_setting();
  objc_msgSend(*(id *)(v12 + 2024), "numberWithBool:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v97, CFSTR("IsAppleInternal"));

  if ((_DWORD)v96)
  {
    objc_msgSend(MEMORY[0x1E0D64EE0], "automatedDeviceGroup");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v98, "length"))
    {
      v99 = objc_retainAutorelease(v98);
      v100 = 0;
    }
    else
    {
      v101 = (void *)CFPreferencesCopyValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"), CFSTR("mobile"), v87);
      objc_msgSend(v101, "lowercaseString");
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v102, "containsString:", CFSTR("carry")) & 1) != 0)
        v100 = 1;
      else
        v100 = objc_msgSend(v102, "containsString:", CFSTR("walkabout"));

      v99 = 0;
    }

    v103 = v99;
    objc_msgSend(*(id *)(v12 + 2024), "numberWithBool:", v100);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v104, CFSTR("IsInternalCarryDevice"));

    if (v103)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v103, CFSTR("AutomatedDeviceGroup"));

  }
  if (objc_opt_class())
  {
    v105 = objc_alloc_init(MEMORY[0x1E0D1C1F8]);
    *(_QWORD *)buf = 0;
    v106 = objc_msgSend(v105, "openAndReturnError:", buf);
    v107 = *(id *)buf;
    v108 = v107;
    if (v106)
    {
      v182 = v107;
      objc_msgSend(v105, "allInstalledRootsAndReturnError:", &v182);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v182;

      v111 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      if (v109)
      {
        v157 = v7;
        v180 = 0u;
        v181 = 0u;
        *(_OWORD *)out_token = 0u;
        v179 = 0u;
        v112 = v109;
        v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", out_token, &state64, 16);
        if (v113)
        {
          v114 = v113;
          v115 = *(_QWORD *)v179;
          do
          {
            for (j = 0; j != v114; ++j)
            {
              if (*(_QWORD *)v179 != v115)
                objc_enumerationMutation(v112);
              objc_msgSend(*(id *)(*(_QWORD *)&out_token[2] + 8 * j), "name");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "addObject:", v117);

            }
            v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", out_token, &state64, 16);
          }
          while (v114);
        }

        v7 = v157;
      }
      v118 = (id)objc_msgSend(v105, "closeAndReturnError:", 0);
      objc_msgSend(v111, "array");
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      v108 = v110;
    }
    else
    {
      v120 = *__error();
      sub_1C1CB1954();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        sub_1C1CC7224();

      v119 = 0;
      *__error() = v120;
    }

    v9 = v163;
  }
  else
  {
    v119 = 0;
  }
  if (objc_msgSend(v119, "count"))
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v119, CFSTR("InstalledRootNames"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsRootInstalled"));
  }
  else
  {
    *(_QWORD *)out_token = 0;
    *(_QWORD *)buf = 8;
    v122 = sysctlbyname("kern.roots_installed", out_token, (size_t *)buf, 0, 0);
    v123 = *__error();
    sub_1C1CB1954();
    v124 = objc_claimAutoreleasedReturnValue();
    v125 = v124;
    if (v122)
    {
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        sub_1C1CC71B4();

      *__error() = v123;
    }
    else
    {
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        state64.f_bsize = 134217984;
        *(_QWORD *)&state64.f_iosize = *(_QWORD *)out_token;
        _os_log_impl(&dword_1C1CAA000, v125, OS_LOG_TYPE_DEFAULT, "Installed root info kern.roots_installed: %llu", (uint8_t *)&state64, 0xCu);
      }

      *__error() = v123;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_QWORD *)out_token != 0);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v126, CFSTR("IsRootInstalled"));

    }
  }
  v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.powerd.lowpowermode.state"));
  objc_msgSend(v128, "objectForKey:", CFSTR("state"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  if (v129)
    v130 = objc_msgSend(v128, "BOOLForKey:", CFSTR("state"));
  else
    v130 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setObject:forKeyedSubscript:", v131, CFSTR("LowPowerMode"));

  objc_msgSend(v128, "objectForKey:", CFSTR("stateChangeDate"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v133 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v132, "timeIntervalSinceReferenceDate");
      objc_msgSend(v133, "numberWithDouble:");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "setObject:forKeyedSubscript:", v134, CFSTR("PowerModeTransitionTimestamp"));

      v9 = v163;
    }
  }

  if (v127)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v127, CFSTR("MostRecentLowPowerModeTransition"));
  if (qword_1EF718C68 != -1)
    dispatch_once(&qword_1EF718C68, &unk_1E7B8EA30);
  if (qword_1EF718C60)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v135, CFSTR("OSCryptexFileExtents"));

  }
  v167[1] = 0;
  v167[2] = 0;
  sub_1C1CAE01C();
  v136 = 0;
  v137 = 0;
  if (v136)
    objc_msgSend(v163, "setObject:forKeyedSubscript:", v136, CFSTR("GPURestartCount"));
  if (v137)
    objc_msgSend(v163, "setObject:forKeyedSubscript:", v137, CFSTR("GPURestartLastMachAbs"));
  *(_QWORD *)&state64.f_bsize = 0;
  if (kpersona_find_by_type() == -1)
  {
    v138 = *__error();
    sub_1C1CB1954();
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      sub_1C1CC7188();

    *__error() = v138;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_QWORD *)&state64.f_bsize != 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setObject:forKeyedSubscript:", v140, CFSTR("HasEnterprisePersona"));

  v167[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v163, 200, 0, v167);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v167[0];
  if (v141)
  {
    v143 = objc_retainAutorelease(v141);
    objc_msgSend(v143, "bytes");
    objc_msgSend(v143, "length");
    v144 = 0;
    if (!ktrace_file_append_chunk())
    {
      v145 = *__error();
      sub_1C1CB1954();
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
        sub_1C1CC7114(v146);

      *__error() = v145;
      v144 = *__error();
    }
  }
  else
  {
    v147 = *__error();
    sub_1C1CB1954();
    v148 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
      sub_1C1CC70B4();

    *__error() = v147;
    v144 = 22;
  }

  objc_autoreleasePoolPop(context);
  return v144;
}

void sub_1C1CAFCB4()
{
  void *v0;
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  off_t st_size;
  uint64_t v15;
  int v16;
  NSObject *v17;
  id v18;
  int v19;
  off_t v20;
  uint64_t v21;
  stat v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D46970], "sharedDataAccessor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v1 = (void *)objc_msgSend(v0, "copyPathForPersonalizedData:error:", 11, &v18);
  v2 = v18;

  if (!v1)
  {
    v10 = *__error();
    sub_1C1CB1954();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22.st_dev = 138412290;
      *(_QWORD *)&v22.st_mode = v2;
      _os_log_impl(&dword_1C1CAA000, v11, OS_LOG_TYPE_DEFAULT, "Unable to get path for MSUDA_CRYPTEX1_OS_CRYPTEX with error: (%@)", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_30;
  }
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
  if (v3)
  {
    v4 = (uint64_t)v3;
    if (*v3)
    {
      v5 = open(v3, 0, 0);
      if (v5 < 0)
      {
        v12 = *__error();
        sub_1C1CB1954();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1C1CC764C();

        v9 = 0;
        *__error() = v12;
      }
      else
      {
        v6 = v5;
        memset(&v22, 0, sizeof(v22));
        if (fstat(v5, &v22))
        {
          v7 = *__error();
          sub_1C1CB1954();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            sub_1C1CC7810();
        }
        else
        {
          st_size = v22.st_size;
          if (v22.st_size)
          {
            v15 = 0;
            v9 = 0;
            v19 = 0;
            while (1)
            {
              v20 = st_size;
              v21 = v15;
              if (fcntl(v6, 65, &v19))
                break;
              if (!v20)
              {
                v16 = *__error();
                sub_1C1CB1954();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                  sub_1C1CC7720();
                goto LABEL_26;
              }
              v15 += v20;
              ++v9;
              st_size -= v20;
              if (!st_size)
                goto LABEL_27;
            }
            v16 = *__error();
            sub_1C1CB1954();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              sub_1C1CC778C();
LABEL_26:

            *__error() = v16;
LABEL_27:
            close(v6);
            goto LABEL_28;
          }
          v7 = *__error();
          sub_1C1CB1954();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            sub_1C1CC76BC();
        }

        *__error() = v7;
        close(v6);
        v9 = 0;
      }
LABEL_28:
      qword_1EF718C60 = v9;
      v10 = *__error();
      sub_1C1CB1954();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        sub_1C1CC75C8(v4, v11);
LABEL_30:

      *__error() = v10;
    }
  }

}

uint64_t tailspin_write_symbolless_binary_info_chunk(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  id v14;

  v2 = a2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      sub_1C1CC6F30();
    v4 = v3;
    add_binary_info_to_binary_dictionary(v3, v2);
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (v5)
    {
      v7 = objc_retainAutorelease(v5);
      objc_msgSend(v7, "bytes");
      objc_msgSend(v7, "length");
      v8 = 0;
      if (!ktrace_file_append_chunk())
      {
        v9 = *__error();
        sub_1C1CB1954();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_1C1CC78E0(v10);

        *__error() = v9;
        v8 = *__error();
      }
    }
    else
    {
      v11 = *__error();
      sub_1C1CB1954();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1C1CC7880();

      *__error() = v11;
      v8 = 22;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t tailspin_write_os_signpost_support_chunks(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, int a7)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t appended;
  int v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;

  v10 = a3;
  v11 = a4;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0D44698], "localStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v21 = *__error();
    sub_1C1CB1954();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1C1CC7954();
    appended = 22;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if ((v14 & 1) == 0)
  {
    v21 = *__error();
    sub_1C1CB1954();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1C1CC7980();
    appended = 2;
LABEL_16:

    *__error() = v21;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D44698], "storeWithArchiveURL:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v16;
LABEL_6:
  if (a7)
  {
    SignpostSupportAllowlistedStringSetForCurrentDevice();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1C1CB0394;
    v24[3] = &unk_1E7B8EEF0;
    v25 = v17;
    v18 = v17;
    v19 = (void *)MEMORY[0x1C3BB4910](v24);

  }
  else
  {
    v19 = 0;
  }
  appended = ktrace_file_append_log_content_from_store();

LABEL_17:
  return appended;
}

id sub_1C1CB0394(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;

  v3 = a2;
  objc_msgSend(v3, "decomposedMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "placeholderCount"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "argumentAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "category") == 3
        || objc_msgSend(v7, "category") == 2
        && (objc_msgSend(v7, "objectRepresentation"), (v8 = objc_claimAutoreleasedReturnValue()) != 0)
        && (v9 = (void *)v8,
            v10 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8),
            v9,
            (v10 & 1) == 0))
      {
        if (v5)
        {
          objc_msgSend(v5, "addIndex:", v6);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v6);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "placeholderCount"));
  }

  return v5;
}

void tailspin_symbolicate_file_async(uint64_t a1, char a2, char a3, void *a4, void *a5)
{
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const dispatch_source_type_s *v22;
  NSObject *v23;
  void *v24;
  id v25;
  int v26;
  int v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  char v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  _QWORD v49[26];
  _QWORD v50[10];
  _QWORD v51[5];
  _QWORD block[4];
  NSObject *v53;
  uint64_t v54;
  int v55;

  v9 = a4;
  v10 = a5;
  v11 = sub_1C1CBC57C();
  v12 = ktrace_session_create();
  ktrace_set_execnames_enabled();
  ktrace_session_set_event_names_enabled();
  v13 = ktrace_set_ktrace_file();
  if (v13)
  {
    v14 = v13;
    v15 = *__error();
    sub_1C1CB1954();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1C1CC7A14(v14, v16, v17);

    *__error() = v15;
    ktrace_session_destroy();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1C1CB0928;
    block[3] = &unk_1E7B8EF18;
    v54 = v11;
    v53 = v10;
    v55 = v14;
    dispatch_async(v9, block);
    v18 = v53;
  }
  else
  {
    v19 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v31 = a2;
    v51[2] = sub_1C1CB0958;
    v51[3] = &unk_1E7B8EF38;
    v51[4] = v11;
    v20 = MEMORY[0x1C3BB4910](v51);
    ktrace_chunks();
    ktrace_chunks();
    v34 = (void *)v20;
    ktrace_chunks();
    v50[5] = v19;
    v50[6] = 3221225472;
    v50[7] = sub_1C1CB0A20;
    v50[8] = &unk_1E7B8EF38;
    v50[9] = v11;
    ktrace_chunks();
    v50[0] = v19;
    v50[1] = 3221225472;
    v50[2] = sub_1C1CB0AC8;
    v50[3] = &unk_1E7B8EF38;
    v50[4] = v11;
    v21 = MEMORY[0x1C3BB4910](v50);
    ktrace_chunks();
    v33 = (void *)v21;
    ktrace_chunks();
    v49[21] = v19;
    v49[22] = 3221225472;
    v49[23] = sub_1C1CB0B54;
    v49[24] = &unk_1E7B8EF38;
    v49[25] = v11;
    ktrace_chunks();
    v49[16] = v19;
    v49[17] = 3221225472;
    v49[18] = sub_1C1CB0B94;
    v49[19] = &unk_1E7B8EF38;
    v49[20] = v11;
    ktrace_chunks();
    v49[11] = v19;
    v49[12] = 3221225472;
    v49[13] = sub_1C1CB0BD4;
    v49[14] = &unk_1E7B8EF58;
    v49[15] = v11;
    ktrace_kperf();
    v49[5] = v19;
    v49[6] = 3221225472;
    v49[7] = sub_1C1CB0BEC;
    v49[8] = &unk_1E7B8EF78;
    v49[9] = v11;
    v49[10] = v12;
    ktrace_set_thread_exit_handler();
    ktrace_set_signal_handler();
    v22 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DC0];
    v18 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, 0);
    v23 = dispatch_source_create(v22, 2uLL, 0, 0);
    v49[0] = v19;
    v49[1] = 3221225472;
    v49[2] = sub_1C1CB0C2C;
    v49[3] = &unk_1E7B8EF98;
    v49[4] = v11;
    v24 = (void *)MEMORY[0x1C3BB4910](v49);
    dispatch_source_set_event_handler(v18, v24);
    signal(15, (void (__cdecl *)(int))1);
    dispatch_activate(v18);
    dispatch_source_set_event_handler(v23, v24);
    signal(2, (void (__cdecl *)(int))1);
    dispatch_activate(v23);
    v39 = v19;
    v40 = 3221225472;
    v41 = sub_1C1CB0C90;
    v42 = &unk_1E7B8EFC0;
    v47 = v31;
    v48 = a3;
    v44 = v11;
    v45 = a1;
    v46 = v12;
    v25 = v10;
    v43 = v25;
    ktrace_set_completion_handler();
    v26 = ktrace_start();
    if (v26)
    {
      v27 = v26;
      v32 = v10;
      ktrace_session_destroy();
      v28 = *__error();
      sub_1C1CB1954();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1C1CC79AC(v27, v29, v30);

      *__error() = v28;
      v35[0] = v19;
      v35[1] = 3221225472;
      v35[2] = sub_1C1CB0CE0;
      v35[3] = &unk_1E7B8EF18;
      v37 = v11;
      v36 = v25;
      v38 = v27;
      dispatch_async(v9, v35);

      v10 = v32;
    }

  }
}

void sub_1C1CB0928(uint64_t a1)
{
  sub_1C1CBC68C(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1C1CB0940()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 32) + 16))();
}

uint64_t sub_1C1CB0958(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t *v8;

  if (ktrace_chunk_size() == -1)
    sub_1C1CC6F30();
  v2 = ktrace_chunk_size();
  result = ktrace_chunk_map_data();
  if (result)
  {
    v4 = (uint64_t *)result;
    v7 = 0;
    v8 = 0;
    if (ktrace_chunk_tag() == 36864)
    {
      tailspin_parse_stackshot_chunk(v4, v2, &v8, &v7);
      v6 = v7;
      v5 = (uint64_t)v8;
      if (!v8)
        return ktrace_chunk_unmap_data();
    }
    else
    {
      v7 = v2;
      v8 = v4;
      v6 = v2;
      v5 = (uint64_t)v4;
    }
    if (v6)
      sub_1C1CBC720(*(_QWORD *)(a1 + 32), v5, v6);
    return ktrace_chunk_unmap_data();
  }
  return result;
}

uint64_t sub_1C1CB0A20(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  _OWORD *v4;
  uint64_t v5;
  int v6;

  if (ktrace_chunk_size() == -1)
    sub_1C1CC6F30();
  v2 = ktrace_chunk_size();
  result = ktrace_chunk_map_data();
  if (result)
  {
    v4 = (_OWORD *)result;
    v5 = *(_QWORD *)(a1 + 32);
    if (ktrace_chunk_is_64_bit())
      v6 = 64;
    else
      v6 = 32;
    sub_1C1CBDB30(v5, v4, v2, v6);
    return ktrace_chunk_unmap_data();
  }
  return result;
}

uint64_t sub_1C1CB0AC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (ktrace_chunk_size() == -1)
    sub_1C1CC6F30();
  v2 = ktrace_chunk_size();
  result = ktrace_chunk_map_data();
  if (result)
  {
    sub_1C1CBD610(*(_QWORD *)(a1 + 32), result, v2);
    return ktrace_chunk_unmap_data();
  }
  return result;
}

void sub_1C1CB0B54(uint64_t a1)
{
  id v2;

  v2 = (id)ktrace_chunk_copy_plist();
  sub_1C1CBE210(*(_QWORD *)(a1 + 32), v2);

}

void sub_1C1CB0B94(uint64_t a1)
{
  id v2;

  v2 = (id)ktrace_chunk_copy_plist();
  sub_1C1CBE5AC(*(_QWORD *)(a1 + 32), v2);

}

_QWORD *sub_1C1CB0BD4(_QWORD *result, uint64_t *a2)
{
  if ((*(_BYTE *)a2 & 0xC0) != 0)
    return sub_1C1CBDEDC(result[4], a2);
  return result;
}

double sub_1C1CB0BEC(uint64_t a1, unint64_t a2, char *a3)
{
  uint64_t v5;
  int pid_for_thread;

  v5 = *(_QWORD *)(a1 + 32);
  pid_for_thread = ktrace_get_pid_for_thread();
  return sub_1C1CBE0C0(v5, a2, a3, pid_for_thread);
}

uint64_t sub_1C1CB0C2C(uint64_t a1)
{
  int v2;
  NSObject *v3;

  v2 = *__error();
  sub_1C1CB1954();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1C1CC7A7C();

  *__error() = v2;
  return sub_1C1CBC700(*(_QWORD *)(a1 + 32));
}

void sub_1C1CB0C90(uint64_t a1)
{
  sub_1C1CBE8B0(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 48));
  sub_1C1CBC68C(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1C1CB0CC0()
{
  uint64_t v0;

  ktrace_session_destroy();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 32) + 16))();
}

void sub_1C1CB0CE0(uint64_t a1)
{
  sub_1C1CBC68C(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1C1CB0CF8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 32) + 16))();
}

id sub_1C1CB0D10()
{
  void *v0;
  id v1;
  uint64_t v2;
  char v3;
  void *v4;
  char isKindOfClass;
  char v6;
  int v7;
  NSObject *v8;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (!v0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:

    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = v0;
  if (objc_msgSend(v1, "count"))
  {
    v2 = 0;
    v3 = 1;
    while (1)
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      v6 = (v2 + 1 >= (unint64_t)objc_msgSend(v1, "count")) | ~v3;
      v2 = 1;
      v3 = 0;
      if ((v6 & 1) != 0)
        goto LABEL_7;
    }
    v7 = *__error();
    sub_1C1CB1954();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1C1CC7AA8();

    *__error() = v7;
    goto LABEL_11;
  }
LABEL_7:

  return v1;
}

void sub_1C1CB0E64()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *context;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class())
  {
    v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v1 = (void *)qword_1EF718C78;
    qword_1EF718C78 = (uint64_t)v0;

    objc_msgSend(MEMORY[0x1E0D20F30], "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v2, "domains");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v36;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(obj);
          v28 = v3;
          v4 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v3);
          context = (void *)MEMORY[0x1C3BB47E4]();
          objc_msgSend(v2, "featuresForDomain:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v29 = v5;
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v7; ++i)
              {
                if (*(_QWORD *)v32 != v8)
                  objc_enumerationMutation(v29);
                v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
                objc_msgSend(v2, "stateForFeature:domain:level:", v10, v4, 4);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (v11)
                {
                  objc_msgSend(v2, "defaultStateForFeature:domain:", v10, v4);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = v12;
                  if (!v12 || (v14 = objc_msgSend(v12, "value"), v14 != objc_msgSend(v11, "value")))
                  {
                    v15 = objc_msgSend(v11, "value");
                    v16 = MEMORY[0x1E0C9AAA0];
                    if (v15 == 1)
                      v16 = MEMORY[0x1E0C9AAB0];
                    v30 = v16;
                    v17 = v7;
                    v18 = v8;
                    v19 = v2;
                    v20 = qword_1EF718C78;
                    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v4, v10);
                    v22 = (void *)v20;
                    v2 = v19;
                    v8 = v18;
                    v7 = v17;
                    objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, v21);

                  }
                }

              }
              v7 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v7);
          }

          objc_autoreleasePoolPop(context);
          v3 = v28 + 1;
        }
        while (v28 + 1 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v26);
    }

    if (!objc_msgSend((id)qword_1EF718C78, "count"))
    {
      v23 = (void *)qword_1EF718C78;
      qword_1EF718C78 = 0;

    }
    objc_msgSend(v2, "invalidateCache");

  }
}

void sub_1C1CB1150(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_1C1CB115C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1C1CB1168(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1C1CB117C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1C1CB11A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

int *sub_1C1CB11C4()
{
  return __error();
}

void sub_1C1CB11CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

char *sub_1C1CB120C(int *a1)
{
  return strerror(*a1);
}

uint64_t is_apple_internal_setting()
{
  if (qword_1ED0C4728 != -1)
    dispatch_once(&qword_1ED0C4728, &unk_1E7B8EA50);
  return byte_1ED0C4720;
}

uint64_t sub_1C1CB1254()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  byte_1ED0C4720 = result;
  return result;
}

uint64_t tailspin_buffer_size_get_default()
{
  if (qword_1ED0C4710 != -1)
    dispatch_once(&qword_1ED0C4710, &unk_1E7B8F040);
  if (byte_1ED0C4719 != 1)
    return 0;
  if (qword_1ED0C4738 != -1)
    dispatch_once(&qword_1ED0C4738, &unk_1E7B8F000);
  return qword_1ED0C4740;
}

void sub_1C1CB12F8()
{
  unint64_t v0;

  if (qword_1ED0C4710 != -1)
    dispatch_once(&qword_1ED0C4710, &unk_1E7B8F040);
  if (qword_1ED0C4730 != -1)
    dispatch_once(&qword_1ED0C4730, &unk_1E7B8F060);
  v0 = vcvtms_u32_f32(*(float *)&dword_1ED0C4700 * 25.0);
  if (*(float *)&dword_1ED0C4700 == 1.0)
    v0 = 25;
  qword_1ED0C4740 = v0;
}

void *tailspin_kdbg_filter_get_default()
{
  if (qword_1ED0C4710 != -1)
    dispatch_once(&qword_1ED0C4710, &unk_1E7B8F040);
  if (byte_1ED0C4719 == 1 && qword_1ED0C6880 != -1)
    dispatch_once(&qword_1ED0C6880, &unk_1E7B8EB10);
  return &unk_1ED0C4774;
}

void sub_1C1CB13FC()
{
  if (trace_parse_filter())
    sub_1C1CC6F30();
  if (qword_1ED0C4710 != -1)
    dispatch_once(&qword_1ED0C4710, &unk_1E7B8F040);
  byte_1ED0C4CDC &= ~0x40u;
  byte_1ED0C4DAE &= ~2u;
}

uint64_t sub_1C1CB1470()
{
  if (qword_1ED0C4710 != -1)
    dispatch_once(&qword_1ED0C4710, &unk_1E7B8F040);
  if (byte_1ED0C4719 == 1 && qword_1ED0C6898 != -1)
    dispatch_once(&qword_1ED0C6898, &unk_1E7B8EB30);
  if (byte_1ED0C4708)
    return 50000000;
  else
    return 0;
}

unint64_t sub_1C1CB14F8()
{
  unint64_t result;

  byte_1ED0C4708 = 1;
  result = tailspin_full_sampling_period_get_default();
  if (result)
  {
    if (byte_1ED0C4708 == 1)
      byte_1ED0C4708 = 0;
  }
  return result;
}

unint64_t tailspin_full_sampling_period_get_default()
{
  unint64_t v0;

  v0 = sub_1C1CB179C();
  if (v0)
  {
    if (qword_1ED0C6888 != -1)
      dispatch_once(&qword_1ED0C6888, &unk_1E7B8EB50);
    if (v0 < qword_1ED0C6890)
      sub_1C1CC6F30();
  }
  return v0;
}

uint64_t tailspin_min_oncore_sampling_period_allowed()
{
  if (qword_1EF718C88 != -1)
    dispatch_once(&qword_1EF718C88, &unk_1E7B8F020);
  return qword_1EF718C80;
}

uint64_t sub_1C1CB15D8()
{
  uint64_t result;
  int v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;

  v10 = 8;
  result = sysctlbyname("kperf.limits.timer_min_bg_period_ns", &qword_1EF718C80, &v10, 0, 0);
  if ((_DWORD)result)
  {
    v1 = *__error();
    sub_1C1CB1954();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1C1CC7AD4(v2, v3, v4, v5, v6, v7, v8, v9);

    *__error() = v1;
    result = sub_1C1CB1470();
    qword_1EF718C80 = result;
  }
  return result;
}

unint64_t tailspin_oncore_sampling_period_get_default()
{
  unint64_t v0;

  v0 = sub_1C1CB1470();
  if (v0)
  {
    if (qword_1EF718C88 != -1)
      dispatch_once(&qword_1EF718C88, &unk_1E7B8F020);
    if (v0 < qword_1EF718C80)
      sub_1C1CC6F30();
  }
  return v0;
}

uint64_t tailspin_min_full_sampling_period_allowed()
{
  if (qword_1ED0C6888 != -1)
    dispatch_once(&qword_1ED0C6888, &unk_1E7B8EB50);
  return qword_1ED0C6890;
}

uint64_t sub_1C1CB170C()
{
  uint64_t result;
  int v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;

  v10 = 8;
  result = sysctlbyname("kperf.limits.timer_min_bg_pet_period_ns", &qword_1ED0C6890, &v10, 0, 0);
  if ((_DWORD)result)
  {
    v1 = *__error();
    sub_1C1CB1954();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1C1CC7B08(v2, v3, v4, v5, v6, v7, v8, v9);

    *__error() = v1;
    result = sub_1C1CB179C();
    qword_1ED0C6890 = result;
  }
  return result;
}

uint64_t sub_1C1CB179C()
{
  if (qword_1ED0C4710 != -1)
    dispatch_once(&qword_1ED0C4710, &unk_1E7B8F040);
  if (byte_1ED0C4719 != 1)
    return 0;
  if (qword_1ED0C4758 != -1)
    dispatch_once(&qword_1ED0C4758, &unk_1E7B8F080);
  if (byte_1ED0C4760)
    return 10000000;
  else
    return 0;
}

uint64_t tailspin_sampling_options_get_default()
{
  return 0;
}

void sub_1C1CB1834()
{
  char v0;

  if (qword_1ED0C4710 != -1)
    dispatch_once(&qword_1ED0C4710, &unk_1E7B8F040);
  if (byte_1ED0C4719 == 1 && (os_variant_is_darwinos() & 1) == 0)
  {
    if (qword_1ED0C4728 != -1)
      dispatch_once(&qword_1ED0C4728, &unk_1E7B8EA50);
    v0 = byte_1ED0C4720;
    if (byte_1ED0C4720)
      v0 = (byte_1EF718C90 & 1) == 0;
  }
  else
  {
    v0 = 0;
  }
  byte_1ED0C4750 = v0;
}

uint64_t sub_1C1CB18E0()
{
  uint64_t result;
  BOOL v1;
  size_t v2;
  uint64_t v3;

  v2 = 8;
  v3 = 0;
  result = sysctlbyname("hw.memsize", &v3, &v2, 0, 0);
  if ((_DWORD)result)
    v1 = 1;
  else
    v1 = v3 < 1;
  if (!v1 && (int)((unint64_t)v3 >> 20) >= 1901)
    dword_1ED0C4700 = 0x40000000;
  return result;
}

void sub_1C1CB1944()
{
  byte_1ED0C4760 = 1;
}

id sub_1C1CB1954()
{
  if (qword_1EF718CA0 != -1)
    dispatch_once(&qword_1EF718CA0, &unk_1E7B8EA70);
  return (id)qword_1EF718C98;
}

void sub_1C1CB1994()
{
  os_log_t v0;
  void *v1;
  id v2;

  v0 = os_log_create("com.apple.tailspin", "library");
  v1 = (void *)qword_1EF718C98;
  qword_1EF718C98 = (uint64_t)v0;

  v2 = (id)qword_1EF718C98;
  if (!v2)
    sub_1C1CC7B3C();

}

uint64_t sub_1C1CB19E0(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  result = snprintf(byte_1EF718CA8, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE)
    result = vsnprintf(&byte_1EF718CA8[result], 1024 - result, a2, &a9);
  qword_1EF718C00 = (uint64_t)byte_1EF718CA8;
  return result;
}

void tailspin_save_trace_with_standard_chunks(uint64_t a1, const char *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  int v20;
  NSObject *v21;
  FILE *v22;
  int v23;
  NSObject *v24;
  int *v25;
  char *v26;
  dispatch_queue_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  int *v33;
  int v34;
  NSObject *v35;
  int *v36;
  size_t v37;
  size_t v38;
  char v39;
  int v40;
  NSObject *v41;
  BOOL v42;
  int v43;
  NSObject *v44;
  void *v45;
  NSObject *target;
  _QWORD block[4];
  id v48;
  int v49;
  size_t __sizep;
  char *__bufp;
  _QWORD v52[4];
  id v53;
  id v54;
  char *v55;
  int v56;
  int v57;
  uint8_t buf[4];
  char *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  target = a6;
  v17 = a7;
  v18 = a8;
  v45 = v16;
  v19 = sub_1C1CB2020(a1, (uint64_t)a2, a3, v15, v16, v17);
  if (v19)
  {
    __sizep = 0;
    __bufp = 0;
    v20 = *__error();
    sub_1C1CB1954();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1C1CC7C6C();

    *__error() = v20;
    if (ktrace_config_create_current())
    {
      v22 = open_memstream(&__bufp, &__sizep);
      if (v22)
      {
        if (ktrace_config_print_description())
        {
          v23 = *__error();
          sub_1C1CB1954();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = __error();
            sub_1C1CC7C2C(v25, (uint64_t)buf, v24);
          }

          *__error() = v23;
          fclose(v22);
        }
        else
        {
          fclose(v22);
          v37 = __sizep;
          if (__sizep)
          {
            v38 = 1000;
            do
            {
              if (v38 >= v37)
              {
                v39 = 0;
              }
              else
              {
                v39 = __bufp[v38];
                __bufp[v38] = 0;
              }
              if (v38 == 1000)
              {
                v40 = *__error();
                sub_1C1CB1954();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446210;
                  v59 = __bufp;
                  _os_log_error_impl(&dword_1C1CAA000, v41, OS_LOG_TYPE_ERROR, "Current system config = \n%{public}s", buf, 0xCu);
                }
              }
              else
              {
                v40 = *__error();
                sub_1C1CB1954();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446210;
                  v59 = &__bufp[v38 - 1000];
                  _os_log_error_impl(&dword_1C1CAA000, v41, OS_LOG_TYPE_ERROR, "Current system config = (continued)\n%{public}s", buf, 0xCu);
                }
              }

              *__error() = v40;
              v37 = __sizep;
              if (v38 < __sizep)
              {
                __bufp[v38] = v39;
                v37 = __sizep;
              }
              v42 = v38 >= v37;
              v38 += 1000;
            }
            while (!v42);
          }
          else
          {
            v43 = *__error();
            sub_1C1CB1954();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              sub_1C1CC7C00();

            *__error() = v43;
          }
        }
        if (__bufp)
          free(__bufp);
      }
      else
      {
        v34 = *__error();
        sub_1C1CB1954();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = __error();
          sub_1C1CC7BC0(v36, (uint64_t)buf, v35);
        }

        *__error() = v34;
      }
      ktrace_config_destroy();
    }
    else
    {
      v31 = *__error();
      sub_1C1CB1954();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = __error();
        sub_1C1CC7B80(v33, (uint64_t)buf, v32);
      }

      *__error() = v31;
    }
    if ((_DWORD)a1 != -1)
      close(a1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1C1CB39E4;
    block[3] = &unk_1E7B8F0D0;
    v48 = v18;
    v49 = v19;
    dispatch_async(target, block);

  }
  else
  {
    v26 = strdup(a2);
    v27 = dispatch_queue_create_with_target_V2("com.apple.tailspind.post-processing-queue", 0, target);
    v28 = *__error();
    sub_1C1CB1954();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      sub_1C1CC7B54();

    *__error() = v28;
    v30 = dup(a1);
    objc_msgSend(v17, "startRecordingTimeForAugmentPhase:pid:originalFd:dupFd:", v26, a3, a1, v30);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_1C1CB37F8;
    v52[3] = &unk_1E7B8F0A8;
    v55 = v26;
    v56 = a1;
    v57 = a3;
    v53 = v17;
    v54 = v18;
    tailspin_augment_output_with_request_id(v30, v15, v27, v53, v52);

  }
}

void sub_1C1CB1F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_1C1CB2020(int a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  int v36;
  void *v37;
  NSObject *v38;
  off_t st_size;
  int v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  int started;
  int v45;
  NSObject *v46;
  int v47;
  int v48;
  NSObject *v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  NSObject *v56;
  int v57;
  NSObject *v58;
  int v59;
  NSObject *v60;
  off_t v61;
  int v62;
  NSObject *v63;
  int v64;
  int v65;
  NSObject *v66;
  int v67;
  NSObject *v68;
  int v69;
  NSObject *v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  int v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  char v84;
  int v85;
  NSObject *v86;
  void *v87;
  BOOL v88;
  void *v89;
  BOOL v90;
  int v91;
  NSObject *v92;
  int *v93;
  char *v94;
  int v95;
  uint64_t v96;
  unint64_t v97;
  __darwin_ino64_t v98;
  int v99;
  NSObject *v100;
  NSObject *v101;
  os_signpost_id_t v102;
  uint64_t v103;
  int *v104;
  NSObject *v105;
  int v107;
  NSObject *v108;
  NSObject *v109;
  os_signpost_id_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  NSObject *v114;
  void *v115;
  uint64_t v116;
  dispatch_semaphore_t v117;
  dispatch_semaphore_t dsema;
  int v119;
  int v120;
  uint64_t v121;
  void *v122;
  unsigned int v123;
  uint64_t v124;
  id v126;
  id v127;
  id v128;
  id v129[5];
  dispatch_semaphore_t v130;
  _BYTE *v131;
  uint64_t v132;
  unsigned int v133;
  void *v134;
  uint64_t v135;
  void (*v136)(uint64_t, uint64_t, unint64_t);
  void *v137;
  _BYTE *v138;
  unint64_t *v139;
  __uint64_t *v140;
  unsigned int v141;
  char v142;
  __uint64_t v143;
  __uint64_t *v144;
  uint64_t v145;
  int v146;
  unint64_t v147;
  _QWORD v148[4];
  id v149;
  void *v150;
  uint64_t v151;
  intptr_t (*v152)(uint64_t);
  void *v153;
  NSObject *v154;
  void *v155;
  uint64_t v156;
  uint64_t (*v157)(uint64_t);
  void *v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t v163;
  _QWORD v164[4];
  id v165;
  _QWORD *v166;
  uint64_t *v167;
  uint64_t *v168;
  uint64_t *v169;
  uint64_t v170;
  unsigned int v171;
  int v172;
  char v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t *v179;
  uint64_t v180;
  int v181;
  _QWORD v182[3];
  int v183;
  uint64_t v184;
  uint64_t v185;
  BOOL (*v186)(uint64_t, unint64_t, unsigned int);
  void *v187;
  uint64_t v188;
  char v189;
  mach_timebase_info info;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  uint64_t v194;
  uint8_t v195[16];
  char v196[16];
  uint8_t v197[4];
  _BYTE v198[10];
  _BYTE v199[10];
  __int16 v200;
  int v201;
  __int16 v202;
  off_t v203;
  _BYTE v204[24];
  uint64_t (*v205)(uint64_t, uint64_t);
  void (*v206)(uint64_t);
  id v207;
  stat buf;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v128 = a4;
  v126 = a5;
  v191 = 0;
  v192 = &v191;
  v193 = 0x2020000000;
  v194 = 0;
  v127 = a6;
  mach_timebase_info(&info);
  objc_msgSend(v127, "startRecordingTimeForSaveStandardChunksPhase:pid:", a2, a3);
  v124 = a2;
  v120 = a3;
  if (v128)
  {
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_min_timestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v121 = objc_msgSend(v10, "unsignedLongLongValue");
    else
      v121 = 0;
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_max_timestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v13 = objc_msgSend(v11, "unsignedLongLongValue");
    else
      v13 = 0;
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_reason_string"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v15 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    else
      v15 = 0;
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_scrub_output"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v16;
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        LODWORD(v16) = objc_msgSend(v16, "BOOLValue");
      else
        LODWORD(v16) = 0;
    }
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_target_pid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v123 = objc_msgSend(v19, "intValue");
    else
      v123 = -1;
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_fullfsync_after_events"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v21;
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v18 = objc_msgSend(v21, "BOOLValue");
    else
      v18 = 0;
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_ktrace_compression_level"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v23;
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v23, "intValue");
    }
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_resample_truncated_stacks"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v119 = objc_msgSend(v25, "BOOLValue");
    else
      v119 = 1;

  }
  else
  {
    v18 = 0;
    LODWORD(v16) = 0;
    v15 = 0;
    v13 = 0;
    v121 = 0;
    v119 = 1;
    v123 = -1;
  }
  v26 = mach_absolute_time();
  if (v13 > v26)
  {
    v27 = (v13 - v26) * info.numer / info.denom;
    if (v27 > 0x12A05F200)
    {
      v28 = *__error();
      sub_1C1CB1954();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1C1CC7F40(v27, v29, v30);

      *__error() = v28;
      v27 = 5000000000;
    }
    v31 = *__error();
    sub_1C1CB1954();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      buf.st_dev = 134217984;
      *(double *)&buf.st_mode = (double)v27 / 1000000000.0;
      _os_log_impl(&dword_1C1CAA000, v32, OS_LOG_TYPE_INFO, "Tailspin requested with max time %.1fs in the future, sleeping until then...", (uint8_t *)&buf, 0xCu);
    }

    *__error() = v31;
    usleep(v27 / 0x3E8);
  }
  ktrace_session_create();
  ktrace_set_execnames_enabled();
  ktrace_session_set_event_names_enabled();
  ktrace_add_stackshot_flags();
  if (!ktrace_set_use_existing())
  {
    if (v15)
      ktrace_set_reason();
    v209 = v124;
    v210 = 0;
    ktrace_set_command_argv();
    ktrace_set_trigger_kind();
    if (v121)
      v36 = 1;
    else
      v36 = (int)v16;
    v37 = (void *)MEMORY[0x1E0C809B0];
    if (v36 == 1)
    {
      v184 = MEMORY[0x1E0C809B0];
      v185 = 3221225472;
      v186 = sub_1C1CB39F8;
      v187 = &unk_1E7B8F0F0;
      v188 = v121;
      v189 = (char)v16;
      ktrace_set_writing_filter();
    }
    v182[0] = 0;
    v182[1] = v182;
    v182[2] = 0x2020000000;
    v183 = 0;
    v178 = 0;
    v179 = &v178;
    v180 = 0x2020000000;
    v181 = 0;
    v174 = 0;
    v175 = &v174;
    v176 = 0x2020000000;
    v177 = 0;
    v164[0] = v37;
    v164[1] = 3221225472;
    v164[2] = sub_1C1CB3A28;
    v164[3] = &unk_1E7B8F118;
    v170 = v15;
    v165 = v126;
    v166 = v182;
    v173 = v18;
    v171 = v123;
    v172 = a1;
    v167 = &v178;
    v168 = &v174;
    v169 = &v191;
    v122 = (void *)MEMORY[0x1C3BB4910](v164);
    v160 = 0;
    v161 = &v160;
    v162 = 0x2020000000;
    v163 = 0;
    v155 = v37;
    v156 = 3221225472;
    v157 = sub_1C1CB3B44;
    v158 = &unk_1E7B8F140;
    v159 = &v160;
    ktrace_set_post_processing_handler();
    v150 = v37;
    v151 = 3221225472;
    v152 = sub_1C1CB3B70;
    v153 = &unk_1E7B8F168;
    v38 = dispatch_semaphore_create(0);
    v154 = v38;
    ktrace_set_completion_handler();
    if (fstat(a1, &buf))
      st_size = -1;
    else
      st_size = buf.st_size;
    v40 = dup(a1);
    v41 = mach_absolute_time();
    v42 = *__error();
    sub_1C1CB1954();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v204 = 136447234;
      *(_QWORD *)&v204[4] = v124;
      *(_WORD *)&v204[12] = 1024;
      *(_DWORD *)&v204[14] = v120;
      *(_WORD *)&v204[18] = 1024;
      *(_DWORD *)&v204[20] = a1;
      LOWORD(v205) = 1024;
      *(_DWORD *)((char *)&v205 + 2) = v40;
      HIWORD(v205) = 2048;
      v206 = (void (*)(uint64_t))st_size;
      _os_log_impl(&dword_1C1CAA000, v43, OS_LOG_TYPE_DEFAULT, "Started write fd: %{public}s [%d], original fd: %d, duped fd: %d, size: %{bytes}lld", v204, 0x28u);
    }

    *__error() = v42;
    started = ktrace_start_writing_fd();
    if (started)
    {
      v45 = *__error();
      sub_1C1CB1954();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v204 = 67110146;
        *(_DWORD *)&v204[4] = a1;
        *(_WORD *)&v204[8] = 1024;
        *(_DWORD *)&v204[10] = v40;
        *(_WORD *)&v204[14] = 2082;
        *(_QWORD *)&v204[16] = v124;
        LOWORD(v205) = 1024;
        *(_DWORD *)((char *)&v205 + 2) = v120;
        HIWORD(v205) = 1024;
        LODWORD(v206) = started;
        _os_log_error_impl(&dword_1C1CAA000, v46, OS_LOG_TYPE_ERROR, "ktrace_start_writing_fd() failed for original fd %d (dup %d) for client %{public}s [%d]: with errno %{errno}d", v204, 0x24u);
      }

      *__error() = v45;
      ktrace_session_destroy();
      v47 = 15;
LABEL_63:
      *((_DWORD *)v179 + 6) = v47;
      goto LABEL_129;
    }
    dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
    ktrace_session_destroy();
    v48 = *__error();
    sub_1C1CB1954();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v204 = 136446978;
      *(_QWORD *)&v204[4] = v124;
      *(_WORD *)&v204[12] = 1024;
      *(_DWORD *)&v204[14] = v120;
      *(_WORD *)&v204[18] = 1024;
      *(_DWORD *)&v204[20] = a1;
      LOWORD(v205) = 1024;
      *(_DWORD *)((char *)&v205 + 2) = v40;
      _os_log_impl(&dword_1C1CAA000, v49, OS_LOG_TYPE_DEFAULT, "Ended writing fd: %{public}s [%d], original fd: %d, duped fd: %d", v204, 0x1Eu);
    }

    *__error() = v48;
    v50 = v119;
    if ((v123 & 0x80000000) == 0)
      v50 = 1;
    if (v50 != 1)
    {
LABEL_129:

      objc_msgSend(MEMORY[0x1E0D8BE78], "clearSymbolCaches");
      v95 = *((_DWORD *)v179 + 6);
      objc_msgSend(v127, "stopRecordingTimeForSaveStandardChunksPhase:", v95 == 0);
      objc_msgSend(v127, "recordTimeForSaveStandardChunksWithoutPostProcessing:", v161[3]);
      *(_QWORD *)v204 = 0;
      v147 = 0;
      if (mach_get_times() || !*(_QWORD *)v204 || v147 < *(_QWORD *)v204)
      {
        _os_assert_log();
        v116 = _os_crash();
        sub_1C1CC7C98(v116);
      }
      v96 = v175[3];
      if (v96 && v41 > v96)
      {
        v143 = 0;
        pthread_threadid_np(0, &v143);
        v97 = v147 - *(_QWORD *)v204 + v175[3];
        v98 = v147 - *(_QWORD *)v204 + v41;
        if (!v95)
        {
          v107 = *__error();
          sub_1C1CB1954();
          v108 = objc_claimAutoreleasedReturnValue();
          v109 = v108;
          v110 = v143;
          if (v143 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v108))
          {
            v111 = v192[3];
            buf.st_dev = 134349568;
            *(_QWORD *)&buf.st_mode = v97;
            WORD2(buf.st_ino) = 2050;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v98;
            HIWORD(buf.st_gid) = 2050;
            *(_QWORD *)&buf.st_rdev = v111;
            _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v109, OS_SIGNPOST_EVENT, v110, "TailspinSaved", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu numEvents=%{public,name=numEvents}llu enableTelemetry=YES ", (uint8_t *)&buf, 0x20u);
          }

          *__error() = v107;
          objc_msgSend(v127, "recordTailspinDurationWithStartMCT:endMCT:", v97, v98);
          goto LABEL_143;
        }
        v99 = *__error();
        sub_1C1CB1954();
        v100 = objc_claimAutoreleasedReturnValue();
        v101 = v100;
        v102 = v143;
        if (v143 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
        {
          v103 = v192[3];
          buf.st_dev = 134349568;
          *(_QWORD *)&buf.st_mode = v97;
          WORD2(buf.st_ino) = 2050;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v98;
          HIWORD(buf.st_gid) = 2050;
          *(_QWORD *)&buf.st_rdev = v103;
          _os_signpost_emit_with_name_impl(&dword_1C1CAA000, v101, OS_SIGNPOST_EVENT, v102, "TailspinFailed", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu numEvents=%{public,name=numEvents}llu enableTelemetry=YES ", (uint8_t *)&buf, 0x20u);
        }

        v104 = __error();
      }
      else
      {
        v99 = *__error();
        sub_1C1CB1954();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          v112 = v175[3];
          buf.st_dev = 134218752;
          *(_QWORD *)&buf.st_mode = v112;
          WORD2(buf.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v41;
          HIWORD(buf.st_gid) = 2048;
          *(_QWORD *)&buf.st_rdev = *(_QWORD *)v204;
          LOWORD(buf.st_atimespec.tv_sec) = 2048;
          *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = v147;
          _os_log_error_impl(&dword_1C1CAA000, v105, OS_LOG_TYPE_ERROR, "Bad timestamps from tailspin file: %llu %llu %llu %llu", (uint8_t *)&buf, 0x2Au);
        }

        v104 = __error();
      }
      *v104 = v99;
LABEL_143:
      v35 = *((unsigned int *)v179 + 6);
LABEL_144:
      _Block_object_dispose(&v160, 8);

      _Block_object_dispose(&v174, 8);
      _Block_object_dispose(&v178, 8);
      _Block_object_dispose(v182, 8);
      goto LABEL_145;
    }
    v51 = dup(a1);
    v52 = ktrace_file_open_fd();
    if (!v52)
    {
      v57 = *__error();
      sub_1C1CB1954();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v204 = 67110146;
        *(_DWORD *)&v204[4] = a1;
        *(_WORD *)&v204[8] = 1024;
        *(_DWORD *)&v204[10] = v51;
        *(_WORD *)&v204[14] = 2082;
        *(_QWORD *)&v204[16] = v124;
        LOWORD(v205) = 1024;
        *(_DWORD *)((char *)&v205 + 2) = v120;
        HIWORD(v205) = 1024;
        LODWORD(v206) = 0;
        _os_log_fault_impl(&dword_1C1CAA000, v58, OS_LOG_TYPE_FAULT, "Unable to get ktfile for original fd %d (duped fd %d) from client %{public}s [%d].: %{errno}d", v204, 0x24u);
      }

      *__error() = v57;
      v47 = 26;
      goto LABEL_63;
    }
    *(_QWORD *)v204 = 0;
    *(_QWORD *)&v204[8] = v204;
    *(_QWORD *)&v204[16] = 0x3032000000;
    v205 = sub_1C1CB3B78;
    v206 = sub_1C1CB3B88;
    v207 = 0;
    v147 = 0;
    v148[0] = &v147;
    v148[1] = 0x3032000000;
    v148[2] = sub_1C1CB3B78;
    v148[3] = sub_1C1CB3B88;
    v149 = 0;
    v143 = 0;
    v144 = &v143;
    v145 = 0x2020000000;
    v146 = 0;
    v53 = ktrace_session_create();
    ktrace_set_execnames_enabled();
    ktrace_session_set_event_names_enabled();
    v54 = ktrace_set_ktrace_file();
    if (v54)
    {
      v55 = *__error();
      sub_1C1CB1954();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v197 = 67110146;
        *(_DWORD *)v198 = a1;
        *(_WORD *)&v198[4] = 1024;
        *(_DWORD *)&v198[6] = v51;
        *(_WORD *)v199 = 2082;
        *(_QWORD *)&v199[2] = v124;
        v200 = 1024;
        v201 = v120;
        v202 = 1024;
        LODWORD(v203) = v54;
        _os_log_fault_impl(&dword_1C1CAA000, v56, OS_LOG_TYPE_FAULT, "Unable to create read session for original fd %d (duped fd %d) from client %{public}s [%d].: %{errno}d", v197, 0x24u);
      }

      *__error() = v55;
      *((_DWORD *)v179 + 6) = 26;
    }
    else
    {
      v117 = dispatch_semaphore_create(0);
      ktrace_events_single();
      v134 = v37;
      v135 = 3221225472;
      v136 = sub_1C1CB3B94;
      v137 = &unk_1E7B8F200;
      v141 = v123;
      v142 = v119;
      v138 = v204;
      v139 = &v147;
      v140 = &v143;
      ktrace_stackshot();
      v129[1] = v37;
      v129[2] = (id)3221225472;
      v129[3] = sub_1C1CB4784;
      v129[4] = &unk_1E7B8F228;
      v133 = v123;
      v131 = v204;
      v132 = v53;
      dsema = v117;
      v130 = dsema;
      ktrace_set_completion_handler();
      if (v119)
      {
        if ((v123 & 0x80000000) != 0)
        {
          v59 = *__error();
          sub_1C1CB1954();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            sub_1C1CC7E88();
        }
        else
        {
          v59 = *__error();
          sub_1C1CB1954();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            sub_1C1CC7E5C();
        }
      }
      else
      {
        v59 = *__error();
        sub_1C1CB1954();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          sub_1C1CC7EB4();
      }

      *__error() = v59;
      mach_absolute_time();
      if (fstat(a1, &buf))
        v61 = -1;
      else
        v61 = buf.st_size;
      v62 = *__error();
      sub_1C1CB1954();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v197 = 136447234;
        *(_QWORD *)v198 = v124;
        *(_WORD *)&v198[8] = 1024;
        *(_DWORD *)v199 = v120;
        *(_WORD *)&v199[4] = 1024;
        *(_DWORD *)&v199[6] = a1;
        v200 = 1024;
        v201 = v51;
        v202 = 2048;
        v203 = v61;
        _os_log_impl(&dword_1C1CAA000, v63, OS_LOG_TYPE_DEFAULT, "Started read session: %{public}s [%d], original fd: %d, duped fd: %d, size: %{bytes}lld", v197, 0x28u);
      }

      *__error() = v62;
      v64 = ktrace_start();
      if (v64)
      {
        v65 = *__error();
        sub_1C1CB1954();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v197 = 67110146;
          *(_DWORD *)v198 = a1;
          *(_WORD *)&v198[4] = 1024;
          *(_DWORD *)&v198[6] = v51;
          *(_WORD *)v199 = 2082;
          *(_QWORD *)&v199[2] = v124;
          v200 = 1024;
          v201 = v120;
          v202 = 1024;
          LODWORD(v203) = v64;
          _os_log_fault_impl(&dword_1C1CAA000, v66, OS_LOG_TYPE_FAULT, "Unable to start read session for original fd %d (duped fd %d) from client %{public}s [%d].: %{errno}d", v197, 0x24u);
        }

        *__error() = v65;
        *((_DWORD *)v179 + 6) = 26;
      }
      else
      {
        dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
        v67 = *__error();
        sub_1C1CB1954();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v197 = 136446978;
          *(_QWORD *)v198 = v124;
          *(_WORD *)&v198[8] = 1024;
          *(_DWORD *)v199 = v120;
          *(_WORD *)&v199[4] = 1024;
          *(_DWORD *)&v199[6] = a1;
          v200 = 1024;
          v201 = v51;
          _os_log_impl(&dword_1C1CAA000, v68, OS_LOG_TYPE_DEFAULT, "Ended read session: %{public}s [%d], original fd: %d, duped fd: %d", v197, 0x1Eu);
        }

        *__error() = v67;
        if (v119)
        {
          v69 = *__error();
          sub_1C1CB1954();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            mach_absolute_time();
            SASecondsFromMachTimeUsingLiveTimebase();
            v71 = *((_DWORD *)v144 + 6);
            *(_DWORD *)v197 = 134218240;
            *(_QWORD *)v198 = v72;
            *(_WORD *)&v198[8] = 1024;
            *(_DWORD *)v199 = v71;
            _os_log_impl(&dword_1C1CAA000, v70, OS_LOG_TYPE_INFO, "Done parsing in %.2fs. Resampled %d truncated stacks", v197, 0x12u);
          }
        }
        else
        {
          v69 = *__error();
          sub_1C1CB1954();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            mach_absolute_time();
            SASecondsFromMachTimeUsingLiveTimebase();
            sub_1C1CC7E24((uint64_t)v196, v70, v73, v74);
          }
        }

        *__error() = v69;
      }

    }
    ktrace_session_destroy();
    if ((v123 & 0x80000000) == 0)
    {
      v75 = *(void **)(*(_QWORD *)&v204[8] + 40);
      if (v75)
      {
        objc_msgSend(v75, "gatherInfoWithDataGatheringOptions:pid:", 5, v123);
        objc_msgSend(*(id *)(*(_QWORD *)&v204[8] + 40), "path");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v76 == 0;

        if (v77)
        {
          sub_1C1CB4FC4(v123);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v87 == 0;

          if (!v88)
          {
            objc_msgSend(*(id *)(*(_QWORD *)&v204[8] + 40), "path");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v89 == 0;

            if (v90)
            {
              v113 = *__error();
              sub_1C1CB1954();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(*(id *)(*(_QWORD *)&v204[8] + 40), "uuid");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1C1CC7DC8(v115, (uint64_t)v197, v123, v114);
              }

              *__error() = v113;
            }
            else
            {
              objc_msgSend(*(id *)(*(_QWORD *)&v204[8] + 40), "gatherInfoWithDataGatheringOptions:pid:", 5, v123);
            }
          }
        }
        tailspin_write_symbolless_binary_info_chunk(v52, *(void **)(*(_QWORD *)&v204[8] + 40));
      }
      else
      {
        v78 = *__error();
        sub_1C1CB1954();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          sub_1C1CC7D68();

        *__error() = v78;
      }
    }
    v80 = *(_QWORD *)(v148[0] + 40);
    if (!v80)
      goto LABEL_117;
    v129[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v80, 1, v129);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v129[0];
    if (v81)
    {
      v83 = objc_retainAutorelease(v81);
      objc_msgSend(v83, "bytes");
      objc_msgSend(v83, "length");
      if (ktrace_file_append_chunk())
      {

LABEL_117:
        ktrace_file_close();
        v35 = 17;
        v84 = 1;
        goto LABEL_128;
      }
      v91 = *__error();
      sub_1C1CB1954();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v93 = __error();
        v94 = strerror(*v93);
        sub_1C1CC7D24((uint64_t)v94, v195, v92);
      }

      *__error() = v91;
      v35 = 17;
    }
    else
    {
      v85 = *__error();
      sub_1C1CB1954();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        sub_1C1CC7C9C((uint64_t)v82, (uint64_t)v148, v86);

      *__error() = v85;
      v35 = 18;
    }

    v84 = 0;
LABEL_128:
    _Block_object_dispose(&v143, 8);
    _Block_object_dispose(&v147, 8);

    _Block_object_dispose(v204, 8);
    if ((v84 & 1) == 0)
    {

      goto LABEL_144;
    }
    goto LABEL_129;
  }
  v33 = *__error();
  sub_1C1CB1954();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    sub_1C1CC7EE0();

  *__error() = v33;
  ktrace_session_destroy();
  v35 = 14;
LABEL_145:
  _Block_object_dispose(&v191, 8);

  return v35;
}

void sub_1C1CB35B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a64;
  char a72;
  void *v72;
  void *v73;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);

  _Block_object_dispose(&STACK[0x300], 8);
  _Block_object_dispose(&a56, 8);

  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x290], 8);

  _Unwind_Resume(a1);
}

uint64_t sub_1C1CB37F8(uint64_t a1, int a2)
{
  int v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  int *v8;
  off_t st_size;
  int v10;
  NSObject *v11;
  NSObject *v12;
  __darwin_ino64_t v13;
  dev_t v14;
  uint64_t v16;
  stat v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 56);
  if (v4 == -1)
  {
    st_size = 0;
  }
  else
  {
    if (fstat(v4, &v17))
    {
      v5 = *__error();
      sub_1C1CB1954();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 48);
        v8 = __error();
        sub_1C1CC8060(v7, v8, (uint64_t)&v16, v6);
      }

      st_size = 0;
      *__error() = v5;
    }
    else
    {
      st_size = v17.st_size;
    }
    close(*(_DWORD *)(a1 + 56));
  }
  v10 = *__error();
  sub_1C1CB1954();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(_DWORD *)(a1 + 60);
      v17.st_dev = 134218498;
      *(_QWORD *)&v17.st_mode = st_size;
      WORD2(v17.st_ino) = 2082;
      *(__darwin_ino64_t *)((char *)&v17.st_ino + 6) = v13;
      HIWORD(v17.st_gid) = 1024;
      v17.st_rdev = v14;
      _os_log_impl(&dword_1C1CAA000, v12, OS_LOG_TYPE_DEFAULT, "Saved %{bytes}lld tailspin on behalf of %{public}s [%d]", (uint8_t *)&v17, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_1C1CC7FC8(a1, st_size, v12);
  }

  *__error() = v10;
  objc_msgSend(*(id *)(a1 + 32), "stopRecordingTimeForAugmentPhase:finalSizeBytes:", a2 == 1, st_size);
  free(*(void **)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1C1CB39CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1C1CB39E4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

BOOL sub_1C1CB39F8(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (*(_QWORD *)(a1 + 32) > a2)
    return 0;
  return a3 >> 2 != 12599332 || *(_BYTE *)(a1 + 40) == 0;
}

uint64_t sub_1C1CB3A28(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t result;

  v3 = tailspin_write_metadata_chunk(a2, *(_QWORD *)(a1 + 72), *(void **)(a1 + 32), *(unsigned int *)(a1 + 80));
  if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 16;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    fcntl(*(_DWORD *)(a1 + 84), 51);
    v4 = *__error();
    sub_1C1CB1954();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1C1CC8110();

    *__error() = v4;
  }
  if (ktrace_file_earliest_timestamp())
  {
    v6 = *__error();
    sub_1C1CB1954();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1C1CC80B0();

    *__error() = v6;
  }
  result = ktrace_file_ktrace_event_count();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t sub_1C1CB3B44(uint64_t a1)
{
  uint64_t result;

  result = mach_continuous_time();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

intptr_t sub_1C1CB3B70(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1C1CB3B78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1C1CB3B88(uint64_t a1)
{

}

void sub_1C1CB3B94(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  _BYTE *v34;
  void *v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _DWORD *v42;
  _DWORD *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  NSObject *v49;
  int v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  unsigned int v58;
  _BYTE pid[12];
  uint64_t v60;
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a2 + 16;
  if (a2 + 16 > a3 || (v6 = a2, v4 + (unint64_t)*(unsigned int *)(a2 + 4) > a3))
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_4;
  }
  v13 = 0;
  v60 = 0;
  v61 = 0;
  v14 = 0;
  *(_DWORD *)&pid[8] = 0;
  *(_QWORD *)pid = *(unsigned int *)(a1 + 56);
  v15 = 0xFFFFFFFFLL;
  do
  {
    v16 = *(unsigned int *)(v6 + 4);
    if (v4 + v16 > a3)
      break;
    v17 = *(_DWORD *)v6;
    if (*(_DWORD *)v6 == -242132755)
      break;
    if ((v17 & 0xFFFFFFF0) == 0x20)
      v18 = 17;
    else
      v18 = *(_DWORD *)v6;
    if (v18 <= 19)
    {
      if (v18 != 17)
      {
        if (v18 != 19)
          goto LABEL_96;
        if (v16 < 4 || v17 != 19)
        {
          _os_assert_log();
          v53 = _os_crash();
          sub_1C1CC7C98(v53);
        }
        if (*(_DWORD *)(v6 + 16) != 2307)
          goto LABEL_96;
        v60 = *(_QWORD *)(v6 + 8);
        goto LABEL_95;
      }
      if (v17 != 17 && (v17 & 0xFFFFFFF0) != 0x20)
        goto LABEL_124;
      v30 = *(_QWORD *)(v6 + 8);
      if ((_DWORD)v30)
      {
        if (v17 == 17)
        {
          if (SHIDWORD(v30) <= 2310)
          {
            switch(HIDWORD(v30))
            {
              case 0x30:
                v31 = 20;
                break;
              case 0x31:
                v31 = 24;
                break;
              case 0x81A:
LABEL_64:
                v31 = 8;
                break;
              default:
                goto LABEL_124;
            }
          }
          else
          {
            switch(HIDWORD(v30))
            {
              case 0x907:
                v31 = 4;
                break;
              case 0x908:
              case 0x909:
                goto LABEL_124;
              case 0x90A:
              case 0x90C:
                goto LABEL_64;
              case 0x90B:
              case 0x90D:
                v31 = 16;
                break;
              default:
                if (HIDWORD(v30) != 2369)
                  goto LABEL_124;
                v31 = 48;
                break;
            }
          }
          if (v16 / v31 < v30 || v16 % v30 >= 0x10)
          {
LABEL_124:
            _os_assert_log();
            v57 = _os_crash();
            sub_1C1CC7C98(v57);
          }
          goto LABEL_80;
        }
        v32 = *(_DWORD *)v6 & 0xF;
        v21 = v16 >= v32;
        v33 = v16 - v32;
        if (!v21 || v33 < v30)
          goto LABEL_124;
        LODWORD(v16) = v33 % v30;
      }
      if ((_DWORD)v16)
        goto LABEL_124;
LABEL_80:
      if ((v14 & 1) != 0)
      {
        if (((v15 & 0x80000000) != 0 || (_DWORD)v15 == *(_DWORD *)pid) && (_DWORD)v30)
        {
          v38 = v6 + 16;
          if (HIDWORD(v30) == 48)
          {
            v58 = v15;
            v39 = 0;
            v41 = *(_QWORD *)(v6 + 8);
            while (*(_DWORD *)v38 && !uuid_is_null((const unsigned __int8 *)(v38 + 4)))
            {
              if (!v39 || *v39 > *(_DWORD *)v38)
                v39 = (_DWORD *)v38;
              v38 += 20;
              if (!--v41)
                goto LABEL_109;
            }
            v39 = 0;
LABEL_109:
            v42 = v39 + 1;
            goto LABEL_110;
          }
          if (HIDWORD(v30) == 49)
          {
            v58 = v15;
            v39 = 0;
            v40 = *(_QWORD *)(v6 + 8);
            while (*(_QWORD *)v38 && !uuid_is_null((const unsigned __int8 *)(v38 + 8)))
            {
              if (!v39 || *(_QWORD *)v39 > *(_QWORD *)v38)
                v39 = (_DWORD *)v38;
              v38 += 24;
              if (!--v40)
                goto LABEL_107;
            }
            v39 = 0;
LABEL_107:
            v42 = v39 + 2;
LABEL_110:
            v43 = *(_DWORD **)&pid[4];
            if (v39)
              v43 = v42;
            *(_QWORD *)&pid[4] = v43;
            v14 = 1;
            v15 = v58;
            goto LABEL_96;
          }
        }
        goto LABEL_95;
      }
LABEL_94:
      v14 = 0;
      goto LABEL_96;
    }
    switch(v18)
    {
      case 20:
        if ((v14 & 1) == 0)
          goto LABEL_94;
        if (*(_QWORD *)(v6 + 8) != v60)
          goto LABEL_95;
        if ((v15 & 0x80000000) != 0)
        {
          *(_QWORD *)&pid[4] = 0;
          v14 = 0;
        }
        else
        {
          v14 = 0;
          if ((_DWORD)v15 == *(_DWORD *)pid && *(_QWORD *)&pid[4])
          {
            v34 = malloc_type_calloc(1uLL, 0x400uLL, 0xAB932F23uLL);
            proc_pidpath(*(int *)pid, v34, 0x400u);
            if (*v34 == 47)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v35 = 0;
            }
            free(v34);
            v44 = (void *)MEMORY[0x1E0D8BE78];
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *(_QWORD *)&pid[4]);
            objc_msgSend(v44, "binaryWithUUID:absolutePath:", v45, v35);
            v46 = objc_claimAutoreleasedReturnValue();

            *(_QWORD *)&pid[4] = 0;
            v14 = 0;
            v15 = 0xFFFFFFFFLL;
            v13 = (void *)v46;
            break;
          }
          *(_QWORD *)&pid[4] = 0;
        }
        v15 = 0xFFFFFFFFLL;
        break;
      case 2309:
        if ((v14 & 1) != 0)
        {
          v28 = *(_DWORD *)(v6 + 8) & 0xF;
          v21 = v16 >= v28;
          v29 = v16 - v28;
          if (!v21)
            v29 = 0;
          if (v29 >= 0x78)
            v15 = *(unsigned int *)(v6 + 100);
          goto LABEL_95;
        }
        goto LABEL_94;
      case 2310:
        if ((v14 & 1) != 0)
        {
          v19 = *(_QWORD *)(v6 + 8);
          if ((_DWORD)v16 != 112 || (v19 & 0x8F) != 0)
          {
            v20 = v19 & 0xF;
            v21 = v16 >= v20;
            v22 = v16 - v20;
            if (!v21)
              v22 = 0;
            if (v22 >= 0x78)
            {
              if ((v15 & 0x80000000) != 0)
              {
                v36 = *__error();
                sub_1C1CB1954();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  v47 = *(_QWORD *)(v6 + 16);
                  *(_DWORD *)buf = 134217984;
                  v67 = v47;
                  _os_log_error_impl(&dword_1C1CAA000, v37, OS_LOG_TYPE_ERROR, "No task shapshot before thread snapshot for thread %#llx", buf, 0xCu);
                }

                *__error() = v36;
              }
              else if ((*(_BYTE *)(v6 + 80) & 0x80) != 0)
              {
                if (!v61)
                  v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "objectForKeyedSubscript:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v24)
                {
                  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "setObject:forKeyedSubscript:", v25, v26);

                  v24 = v25;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v6 + 16));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObject:", v27);

              }
            }
          }
LABEL_95:
          v14 = 1;
          break;
        }
        goto LABEL_94;
    }
LABEL_96:
    v6 = v4 + *(unsigned int *)(v6 + 4);
    v4 = v6 + 16;
  }
  while (v6 + 16 <= a3);
  v8 = objc_retainAutorelease(v61);
  v7 = objc_retainAutorelease(v13);

LABEL_4:
  v9 = v7;
  v10 = v8;
  if ((*(_DWORD *)(a1 + 56) & 0x80000000) == 0)
  {
    if (v9)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7);
      v11 = *__error();
      sub_1C1CB1954();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "debugDescription");
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v55 = objc_msgSend(v54, "UTF8String");
        v56 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315394;
        v67 = v55;
        v68 = 1024;
        v69 = v56;
        _os_log_debug_impl(&dword_1C1CAA000, v12, OS_LOG_TYPE_DEBUG, "Got main binary %s for pid %d from stackshot", buf, 0x12u);

      }
      *__error() = v11;
    }
    else
    {
      v48 = *__error();
      sub_1C1CB1954();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = v50;
        _os_log_impl(&dword_1C1CAA000, v49, OS_LOG_TYPE_DEFAULT, "No main binary for pid %d in stackshot", buf, 8u);
      }

      *__error() = v48;
    }
  }
  if (*(_BYTE *)(a1 + 60) && v10)
  {
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = sub_1C1CB4498;
    v62[3] = &unk_1E7B8F1D8;
    v64 = *(_QWORD *)(a1 + 40);
    v51 = v10;
    v52 = *(_QWORD *)(a1 + 48);
    v63 = v51;
    v65 = v52;
    objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v62);

  }
}

void sub_1C1CB4358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1C1CB4498(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "intValue");
  if (v7 != getpid())
  {
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    SAResampleThreads();

  }
}

void sub_1C1CB4574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1C1CB45A8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:");
  }
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  if (a4)
  {
    v14 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a3 + 8 * v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v15, v14);

      ++v14;
    }
    while (v12 != v14);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v16);

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void sub_1C1CB4744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

intptr_t sub_1C1CB4784(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_DWORD *)(a1 + 56);
  if ((v2 & 0x80000000) == 0 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    main_binary_for_pid_in_ktrace(*(_QWORD *)(a1 + 48), v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id main_binary_for_pid_in_ktrace(uint64_t a1, int a2)
{
  id v2;
  void *v3;
  id v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  char *v32;
  int *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  unsigned __int16 *v38;
  unsigned int v39;
  int v40;
  NSObject *v41;
  unsigned __int16 *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unsigned __int16 *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  NSObject *v59;
  int *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  NSObject *v66;
  int *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  unsigned int *v78;
  uint64_t v79;
  unint64_t v80;
  __int128 v81;
  uint64_t v82;
  char v83;
  _BYTE uu2[18];
  __int16 v85;
  void *v86;
  uint8_t v87[4];
  uint64_t v88;
  uuid_t uu;
  uuid_t dst;
  uint64_t v91;

  v2 = 0;
  v91 = *MEMORY[0x1E0C80C00];
  if (a1 && (a2 & 0x80000000) == 0)
  {
    v3 = (void *)ktrace_dumpbuffer_address_space_pid();
    v76 = v3;
    if (v3)
    {
      v4 = objc_retainAutorelease(v3);
      v79 = objc_msgSend(v4, "bytes");
      v80 = objc_msgSend(v4, "length");
      v81 = xmmword_1C1CC9B70;
      v82 = 0;
      v83 = 1;
      if (v80 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      if ((sub_1C1CB547C(&v79, "SYMB", 0) & 1) != 0)
      {
        v5 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
        v6 = *v5;
        memset(dst, 0, sizeof(dst));
        memset(uu, 0, sizeof(uu));
        v7 = *(unsigned __int16 *)((char *)v5 + v6 - *(int *)((char *)v5 + v6) + 4);
        v8 = (unsigned int *)((char *)v5 + v6 + v7);
        v9 = *v8;
        v11 = (unsigned int *)((char *)v8 + v9 + 4);
        v10 = *(unsigned int *)((char *)v8 + v9);
        if ((_DWORD)v10)
        {
          v74 = 0;
          v12 = (uint64_t)v5 + v6 + v9 + v7 + 12;
          v13 = -1;
          v77 = 0;
          v78 = &v11[v10];
          while (1)
          {
            v14 = *v11;
            v15 = (int *)((char *)v11 + v14);
            v16 = sub_1C1CB530C((int *)((char *)v11 + v14));
            if (v16)
            {
              v17 = &v16[-*(int *)v16];
              if (*(unsigned __int16 *)v17 >= 0xBu && (v18 = *((unsigned __int16 *)v17 + 5)) != 0)
              {
                uuid_parse(&v16[v18 + 4 + *(unsigned int *)&v16[v18]], uu);
              }
              else
              {
                v19 = *__error();
                sub_1C1CB1954();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)uu2 = 67109120;
                  *(_DWORD *)&uu2[4] = a2;
                  _os_log_error_impl(&dword_1C1CAA000, v20, OS_LOG_TYPE_ERROR, "No main uuid for target pid [%d] in ktrace flatbuffer", uu2, 8u);
                }

                *__error() = v19;
              }
            }
            v21 = (unsigned __int16 *)((char *)v15 - *v15);
            if (*v21 >= 9u)
            {
              v22 = v21[4];
              if (v22)
              {
                v23 = *(unsigned int *)((char *)v15 + v22);
                v24 = (unsigned int *)((char *)v15 + v22 + v23);
                v27 = *v24;
                v26 = v24 + 1;
                v25 = v27;
                if (v27)
                  break;
              }
            }
LABEL_62:
            ++v11;
            v12 += 4;
            if (v11 == v78)
              goto LABEL_72;
          }
          v28 = &v26[v25];
          v29 = v12 + v22 + v14 + v23;
          while (1)
          {
            v30 = *v26;
            v31 = (int *)((char *)v26 + v30);
            v32 = sub_1C1CB530C((int *)((char *)v26 + v30));
            v33 = (int *)v32;
            if (!v32)
            {
              v40 = *__error();
              sub_1C1CB1954();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                sub_1C1CC81FC(v87, v31, &v88, v41);

              *__error() = v40;
              goto LABEL_36;
            }
            v34 = &v32[-*(int *)v32];
            if (*(unsigned __int16 *)v34 >= 5u && *((_WORD *)v34 + 2))
            {
              v35 = 0;
              *(_QWORD *)uu2 = 0;
              *(_QWORD *)&uu2[8] = 0;
              v36 = &v32[-*(int *)v32];
              if (*(unsigned __int16 *)v36 >= 5u)
              {
                v35 = *((unsigned __int16 *)v36 + 2);
                if (*((_WORD *)v36 + 2))
                  v35 += (uint64_t)&v32[*(unsigned int *)&v32[v35]];
              }
              uuid_parse((const char *)(v35 + 4), uu2);
              if (!uuid_is_null(uu2))
                break;
            }
LABEL_36:
            ++v26;
            v29 += 4;
            if (v26 == v28)
              goto LABEL_62;
          }
          if (!uuid_is_null(uu))
          {
            if (!uuid_compare(uu, uu2))
            {
              v42 = (unsigned __int16 *)((char *)v33 - *v33);
              if (*v42 >= 7u)
              {
                v43 = v42[3];
                if (v43)
                {
                  v44 = (char *)v33 + v43 + *(unsigned int *)((char *)v33 + v43);
                  if (v44[4] == 47)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v44 + 4);
                    v57 = objc_claimAutoreleasedReturnValue();

                    v74 = (void *)v57;
                    goto LABEL_62;
                  }
                }
              }
            }
            v45 = (uint64_t)v77;
            goto LABEL_58;
          }
          v37 = v13;
          v38 = (unsigned __int16 *)((char *)v31 - *v31);
          v39 = *v38;
          if (v39 < 0xD)
          {
            if (v39 < 9)
              goto LABEL_57;
          }
          else if (v38[6])
          {
            if (*((_BYTE *)v31 + v38[6]))
            {
              if (v38[5])
              {
                v13 = *(_QWORD *)((char *)v31 + v38[5]);
                if (v13 != -1)
                {
LABEL_52:
                  if (v13 < v37)
                  {
                    uuid_copy(dst, uu2);
                    v55 = (unsigned __int16 *)((char *)v33 - *v33);
                    if (*v55 >= 7u
                      && (v56 = v55[3]) != 0
                      && *((_BYTE *)v33 + v56 + *(unsigned int *)((char *)v33 + v56) + 4) == 47)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v33 + v56 + *(unsigned int *)((char *)v33 + v56) + 4);
                      v45 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v45 = 0;
                    }

                    goto LABEL_58;
                  }
LABEL_57:
                  v45 = (uint64_t)v77;
                  v13 = v37;
LABEL_58:
                  v77 = (void *)v45;
                  goto LABEL_36;
                }
              }
            }
          }
          v46 = v38[4];
          if (!v38[4])
            goto LABEL_57;
          v47 = *(unsigned int *)((char *)v31 + v46);
          v48 = *(unsigned int *)((char *)v31 + v46 + v47);
          if (!(_DWORD)v48)
            goto LABEL_57;
          v49 = 0;
          v50 = 4 * v48;
          v51 = v29 + v30 + v47 + v46;
          v13 = -1;
          do
          {
            v52 = *(unsigned int *)(v51 + v49);
            v53 = v52 - *(int *)(v51 + v49 + v52);
            if (*(unsigned __int16 *)(v51 + v49 + v53) >= 7u)
            {
              if (*(_WORD *)(v51 + v49 + v53 + 6))
              {
                v54 = *(_QWORD *)(v51 + v52 + *(unsigned __int16 *)(v51 + v49 + v53 + 6) + v49);
                if (v54 < v13)
                  v13 = v54;
              }
            }
            v49 += 4;
          }
          while (v50 != v49);
          goto LABEL_52;
        }
        v77 = 0;
        v74 = 0;
        v13 = -1;
LABEL_72:
        if (uuid_is_null(uu))
        {
          if (v13 == -1)
          {
            v65 = *__error();
            sub_1C1CB1954();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              sub_1C1CC819C();

            v67 = __error();
            v64 = 0;
          }
          else
          {
            v62 = (void *)MEMORY[0x1E0D8BE78];
            v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", dst);
            objc_msgSend(v62, "binaryWithUUID:absolutePath:", v63, v77);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = *__error();
            sub_1C1CB1954();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v64, "uuid");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "UUIDString");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)uu2 = 67109634;
              *(_DWORD *)&uu2[4] = a2;
              *(_WORD *)&uu2[8] = 2048;
              *(_QWORD *)&uu2[10] = v13;
              v85 = 2114;
              v86 = v73;
              _os_log_debug_impl(&dword_1C1CAA000, v66, OS_LOG_TYPE_DEBUG, "No MainBinaryUuid in ktrace flatbuffer for target pid [%d], assuming lowest binary %#llx %{public}@", uu2, 0x1Cu);

            }
            v67 = __error();
          }
          *v67 = v65;
        }
        else
        {
          v68 = (void *)MEMORY[0x1E0D8BE78];
          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
          objc_msgSend(v68, "binaryWithUUID:absolutePath:", v69, v74);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v2 = v64;

        goto LABEL_83;
      }
      v58 = *__error();
      sub_1C1CB1954();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        sub_1C1CC8264();

      v60 = __error();
    }
    else
    {
      v58 = *__error();
      sub_1C1CB1954();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        sub_1C1CC813C();

      v60 = __error();
    }
    v2 = 0;
    *v60 = v58;
LABEL_83:

  }
  return v2;
}

void sub_1C1CB4F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

id sub_1C1CB4FC4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  _QWORD v17[4];
  dispatch_source_t v18;
  int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1EF7190B8 != -1)
    dispatch_once(&qword_1EF7190B8, &unk_1E7B8F248);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EF7190B0);
  v2 = (void *)qword_1EF7190A8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *__error();
    sub_1C1CB1954();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = a1;
      _os_log_impl(&dword_1C1CAA000, v6, OS_LOG_TYPE_INFO, "Using cached load infos for [%d]", buf, 8u);
    }

    *__error() = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8BE80], "binaryLoadInfoForLiveProcessWithPid:dataGatheringOptions:", a1, 1030);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = *__error();
      sub_1C1CB1954();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v21 = objc_msgSend(v4, "count");
        v22 = 1024;
        v23 = a1;
        _os_log_impl(&dword_1C1CAA000, v9, OS_LOG_TYPE_DEFAULT, "Fetched %lu load infos for [%d] from live process", buf, 0x12u);
      }

      *__error() = v8;
      if ((_DWORD)a1)
      {
        v10 = (void *)qword_1EF7190A8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v11);

        dispatch_get_global_queue(9, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = dispatch_source_create(MEMORY[0x1E0C80DB0], a1, 0xA0000000uLL, v12);

        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = sub_1C1CB7EA0;
        v17[3] = &unk_1E7B8F270;
        v18 = v13;
        v19 = a1;
        v14 = v13;
        dispatch_source_set_event_handler(v14, v17);
        dispatch_activate(v14);

      }
    }
    else
    {
      v15 = *__error();
      sub_1C1CB1954();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1C1CC82C4();

      v4 = 0;
      *__error() = v15;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EF7190B0);
  return v4;
}

void sub_1C1CB52A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

char *sub_1C1CB530C(int *a1)
{
  unsigned __int16 *v1;
  unsigned int v2;
  BOOL v3;
  uint64_t v4;

  v1 = (unsigned __int16 *)((char *)a1 - *a1);
  v2 = *v1;
  if (v2 >= 5 && v1[2] && (v2 >= 7 ? (v3 = *((_BYTE *)a1 + v1[2]) == 1) : (v3 = 0), v3 && (v4 = v1[3]) != 0))
    return (char *)a1 + v4 + *(unsigned int *)((char *)a1 + v4);
  else
    return 0;
}

void sub_1C1CB5358(void **a1, _DWORD *a2)
{
  void *v4;
  size_t v5;
  int v6;
  NSObject *v7;
  size_t v8;
  int v9[2];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    sub_1C1CC6F30();
  if (!a2)
    sub_1C1CC6F30();
  v8 = 1152000;
  v4 = malloc_type_malloc(0x119400uLL, 0x7853A607uLL);
  *a1 = v4;
  if (!v4)
    sub_1C1CC6F30();
  *(_QWORD *)v9 = 0x1800000001;
  v10 = 21;
  if (sysctl(v9, 3u, v4, &v8, 0, 0) < 0)
  {
    v6 = *__error();
    sub_1C1CB1954();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1C1CC8324();

    *__error() = v6;
    free(*a1);
    LODWORD(v5) = 0;
    *a1 = 0;
  }
  else
  {
    v5 = v8 >> 5;
  }
  *a2 = v5;
}

uint64_t sub_1C1CB547C(_QWORD *a1, const char *a2, unint64_t a3)
{
  unsigned int v5;

  if ((!a2 || a1[1] >= 8uLL && !strncmp((const char *)(*a1 + a3 + 4), a2, 4uLL))
    && (v5 = sub_1C1CB54F4((uint64_t)a1, a3)) != 0)
  {
    return sub_1C1CB5544((int *)(*a1 + a3 + v5), (uint64_t)a1);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1C1CB54F4(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;

  if ((a2 & 3) != 0 && *(_BYTE *)(a1 + 40))
    return 0;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 5 || v2 - 4 < a2)
    return 0;
  v4 = *(unsigned int *)(*(_QWORD *)a1 + a2);
  if ((int)v4 < 1)
    return 0;
  if (v2 - 1 >= v4 + a2)
    return v4;
  return 0;
}

uint64_t sub_1C1CB5544(int *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unsigned __int16 *v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  _DWORD *v18;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if ((_DWORD)result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 4u);
    if ((_DWORD)result)
    {
      v5 = *a1;
      v6 = -v5;
      v7 = (unsigned __int16 *)((char *)a1 - v5);
      if (*v7 >= 5u)
      {
        v8 = v7[2];
        if (v8)
        {
          result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v8 + *(unsigned int *)((char *)a1 + v8)), 4uLL, 0);
          if (!(_DWORD)result)
            return result;
          v6 = -(uint64_t)*a1;
        }
      }
      v9 = (unsigned __int16 *)((char *)a1 + v6);
      if (*v9 >= 5u && (v10 = v9[2]) != 0)
        v11 = (int *)((char *)a1 + v10 + *(unsigned int *)((char *)a1 + v10));
      else
        v11 = 0;
      result = sub_1C1CB5700(a2, v11);
      if ((_DWORD)result)
      {
        result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
        if ((_DWORD)result)
        {
          v12 = *a1;
          v13 = -v12;
          v14 = (unsigned __int16 *)((char *)a1 - v12);
          if (*v14 >= 7u)
          {
            v15 = v14[3];
            if (v15)
            {
              result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v15 + *(unsigned int *)((char *)a1 + v15)), 4uLL, 0);
              if (!(_DWORD)result)
                return result;
              v13 = -(uint64_t)*a1;
            }
          }
          v16 = (unsigned __int16 *)((char *)a1 + v13);
          if (*v16 >= 7u && (v17 = v16[3]) != 0)
            v18 = (int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17));
          else
            v18 = 0;
          result = sub_1C1CB5774(a2, v18);
          if ((_DWORD)result)
          {
            --*(_DWORD *)(a2 + 16);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C1CB56AC(int *a1, _QWORD *a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;

  v3 = (unsigned __int16 *)((char *)a1 - *a1);
  return *v3 <= a3
      || (v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || sub_1C1CB54F4((uint64_t)a2, (unint64_t)a1 + v4 - *a2) != 0;
}

uint64_t sub_1C1CB5700(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB5910((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C1CB5774(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  _BOOL8 result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB7DA0((int *)((char *)v5 + *v5), a1);
    if (!result)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C1CB57E8(uint64_t *a1, int *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;

  v2 = *a1;
  v3 = (unint64_t)a2 - *a1;
  if ((v3 & 3) != 0 && *((_BYTE *)a1 + 40))
    return 0;
  v4 = a1[1];
  v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5)
    return 0;
  v6 = *a2;
  v7 = *((_DWORD *)a1 + 5);
  v8 = *((_DWORD *)a1 + 4) + 1;
  *((_DWORD *)a1 + 4) = v8;
  v9 = *((_DWORD *)a1 + 6) + 1;
  *((_DWORD *)a1 + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)a1 + 7))
    return 0;
  v10 = v3 - v6;
  if ((v10 & 1) != 0)
  {
    v11 = 0;
    if (*((_BYTE *)a1 + 40) || v4 - 2 < v10)
      return v11;
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((_BYTE *)a1 + 40))
    return 0;
  v5 = v4 >= v12;
  v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL sub_1C1CB58A0(uint64_t a1, unsigned int *a2, unint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  v4 = (unint64_t)a2 - *(_QWORD *)a1;
  if ((v4 & 3) != 0 && *(_BYTE *)(a1 + 40))
    return 0;
  v5 = *(_QWORD *)(a1 + 8);
  if (v5 < 5 || v5 - 4 < v4)
    return 0;
  v7 = *a2;
  if (0x7FFFFFFF / a3 <= v7)
    return 0;
  v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    v5 = *(_QWORD *)(a1 + 8);
  }
  v9 = v5 > v8;
  v10 = v5 - v8;
  return v9 && v10 >= v4;
}

uint64_t sub_1C1CB5910(int *a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int16 *v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int16 *v8;
  unsigned int v9;
  int *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 *v23;
  uint64_t v24;
  unsigned __int16 *v25;
  uint64_t v26;
  _DWORD *v27;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (!(_DWORD)result)
    return result;
  v5 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v5 >= 5u)
  {
    v6 = v5[2];
    if (v6)
    {
      result = 0;
      v7 = *(_QWORD *)(a2 + 8);
      if (v7 < 2 || v7 - 1 < (unint64_t)a1 + v6 - *(_QWORD *)a2)
        return result;
    }
  }
  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
  if (!(_DWORD)result)
    return result;
  v8 = (unsigned __int16 *)((char *)a1 - *a1);
  v9 = *v8;
  if (v9 >= 7)
  {
    if (v8[3])
    {
      v10 = (int *)((char *)a1 + v8[3] + *(unsigned int *)((char *)a1 + v8[3]));
      goto LABEL_12;
    }
LABEL_11:
    v10 = 0;
LABEL_12:
    v11 = v8[2];
    if (v11)
    {
      v12 = *((unsigned __int8 *)a1 + v11);
      if (v12 == 3)
      {
        if (v10)
        {
          result = sub_1C1CB65EC(v10, a2);
          if (!(_DWORD)result)
            return result;
        }
      }
      else if (v12 == 2)
      {
        if (v10 && !sub_1C1CB6174(v10, a2))
          return 0;
      }
      else
      {
        v13 = v12 != 1 || v10 == 0;
        if (!v13 && !sub_1C1CB5C54(v10, a2))
          return 0;
      }
    }
    goto LABEL_26;
  }
  if (v9 >= 5)
    goto LABEL_11;
LABEL_26:
  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 8u);
  if (!(_DWORD)result)
    return result;
  v14 = *a1;
  v15 = -v14;
  v16 = (unsigned __int16 *)((char *)a1 - v14);
  if (*v16 >= 9u)
  {
    v17 = v16[4];
    if (v17)
    {
      result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), 4uLL, 0);
      if (!(_DWORD)result)
        return result;
      v15 = -(uint64_t)*a1;
    }
  }
  v18 = (unsigned __int16 *)((char *)a1 + v15);
  if (*v18 >= 9u && (v19 = v18[4]) != 0)
    v20 = (int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19));
  else
    v20 = 0;
  result = sub_1C1CB5B6C(a2, v20);
  if ((_DWORD)result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xAu);
    if ((_DWORD)result)
    {
      v21 = *a1;
      v22 = -v21;
      v23 = (unsigned __int16 *)((char *)a1 - v21);
      if (*v23 >= 0xBu)
      {
        v24 = v23[5];
        if (v24)
        {
          result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v24 + *(unsigned int *)((char *)a1 + v24)), 4uLL, 0);
          if (!(_DWORD)result)
            return result;
          v22 = -(uint64_t)*a1;
        }
      }
      v25 = (unsigned __int16 *)((char *)a1 + v22);
      if (*v25 >= 0xBu && (v26 = v25[5]) != 0)
        v27 = (int *)((char *)a1 + v26 + *(unsigned int *)((char *)a1 + v26));
      else
        v27 = 0;
      result = sub_1C1CB5BE0(a2, v27);
      if ((_DWORD)result)
      {
        --*(_DWORD *)(a2 + 16);
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_1C1CB5B6C(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB68C4((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C1CB5BE0(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  _BOOL8 result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB7C60((int *)((char *)v5 + *v5), a1);
    if (!result)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C1CB5C54(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int16 *v13;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned __int16 *v20;
  uint64_t v21;
  _DWORD *v22;
  unsigned __int16 *v23;
  uint64_t v24;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      else
        v7 = 0;
      result = sub_1C1CB5E8C((_QWORD *)a2, v7);
      if (result)
      {
        v8 = (unsigned __int16 *)((char *)a1 - *a1);
        v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (result = 0, v10 = *(_QWORD *)(a2 + 8), v10 >= 9)
           && v10 - 8 >= (unint64_t)a1 + v8[3] - *(_QWORD *)a2)
          && (v9 < 9
           || (v11 = v8[4]) == 0
           || (result = 0, v12 = *(_QWORD *)(a2 + 8), v12 >= 9)
           && v12 - 8 >= (unint64_t)a1 + v11 - *(_QWORD *)a2))
        {
          result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xAu);
          if (result)
          {
            v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 >= 0xBu && (v14 = v13[5]) != 0)
              v15 = (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14));
            else
              v15 = 0;
            result = sub_1C1CB5E8C((_QWORD *)a2, v15);
            if (result)
            {
              result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xCu);
              if (result)
              {
                v16 = *a1;
                v17 = -v16;
                v18 = (unsigned __int16 *)((char *)a1 - v16);
                if (*v18 >= 0xDu)
                {
                  v19 = v18[6];
                  if (v19)
                  {
                    result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19)), 4uLL, 0);
                    if (!result)
                      return result;
                    v17 = -(uint64_t)*a1;
                  }
                }
                v20 = (unsigned __int16 *)((char *)a1 + v17);
                if (*v20 >= 0xDu && (v21 = v20[6]) != 0)
                  v22 = (int *)((char *)a1 + v21 + *(unsigned int *)((char *)a1 + v21));
                else
                  v22 = 0;
                result = sub_1C1CB5F00(a2, v22);
                if (result)
                {
                  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xEu);
                  if (result)
                  {
                    v23 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v23 < 0xFu
                      || (v24 = v23[7]) == 0
                      || (result = sub_1C1CB60B8((int *)((char *)a1 + v24 + *(unsigned int *)((char *)a1 + v24)), a2)))
                    {
                      --*(_DWORD *)(a2 + 16);
                      return 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C1CB5E8C(_QWORD *a1, unsigned int *a2)
{
  _BOOL8 result;
  unint64_t v4;
  unint64_t v6;

  if (!a2)
    return 1;
  v6 = 0;
  result = sub_1C1CB58A0((uint64_t)a1, a2, 1uLL, &v6);
  if (result)
  {
    v4 = a1[1];
    return v4 >= 2 && v4 - 1 >= v6 && *(_BYTE *)(*a1 + v6) == 0;
  }
  return result;
}

BOOL sub_1C1CB5F00(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  _BOOL8 result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB5F74((int *)((char *)v5 + *v5), a1);
    if (!result)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C1CB5F74(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned __int16 *v11;
  uint64_t v12;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    v5 = (unsigned __int16 *)((char *)a1 - *a1);
    v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, v7 = *(_QWORD *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(_QWORD *)a2)
      && (v6 < 7
       || (!v5[3]
        || (result = 0, v8 = *(_QWORD *)(a2 + 8), v8 >= 9) && v8 - 8 >= (unint64_t)a1 + v5[3] - *(_QWORD *)a2)
       && (v6 < 9
        || (v9 = v5[4]) == 0
        || (result = 0, v10 = *(_QWORD *)(a2 + 8), v10 >= 9) && v10 - 8 >= (unint64_t)a1 + v9 - *(_QWORD *)a2)))
    {
      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xAu);
      if (result)
      {
        v11 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v11 < 0xBu
          || (v12 = v11[5]) == 0
          || (result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v12 + *(unsigned int *)((char *)a1 + v12)), 1uLL, 0)))
        {
          --*(_DWORD *)(a2 + 16);
          return 1;
        }
      }
    }
  }
  return result;
}

BOOL sub_1C1CB60B8(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    v5 = (unsigned __int16 *)((char *)a1 - *a1);
    v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, v7 = *(_QWORD *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(_QWORD *)a2)
      && (v6 < 7
       || (v8 = v5[3]) == 0
       || (result = 0, v9 = *(_QWORD *)(a2 + 8), v9 >= 9) && v9 - 8 >= (unint64_t)a1 + v8 - *(_QWORD *)a2))
    {
      --*(_DWORD *)(a2 + 16);
      return 1;
    }
  }
  return result;
}

BOOL sub_1C1CB6174(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned __int16 *v27;
  uint64_t v28;
  unsigned int *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  unsigned int *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  unsigned int *v35;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      else
        v7 = 0;
      result = sub_1C1CB5E8C((_QWORD *)a2, v7);
      if (result)
      {
        result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
        if (result)
        {
          v8 = (unsigned __int16 *)((char *)a1 - *a1);
          if (*v8 >= 7u && (v9 = v8[3]) != 0)
            v10 = (unsigned int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9));
          else
            v10 = 0;
          result = sub_1C1CB5E8C((_QWORD *)a2, v10);
          if (result)
          {
            v11 = (unsigned __int16 *)((char *)a1 - *a1);
            v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (result = 0, v13 = *(_QWORD *)(a2 + 8), v13 >= 9)
               && v13 - 8 >= (unint64_t)a1 + v11[4] - *(_QWORD *)a2)
              && (v12 < 0xB
               || (v14 = v11[5]) == 0
               || (result = 0, v15 = *(_QWORD *)(a2 + 8), v15 >= 9)
               && v15 - 8 >= (unint64_t)a1 + v14 - *(_QWORD *)a2))
            {
              result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xCu);
              if (result)
              {
                v16 = (unsigned __int16 *)((char *)a1 - *a1);
                if (*v16 < 0xDu
                  || (v17 = v16[6]) == 0
                  || (result = sub_1C1CB64F8((int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), a2)))
                {
                  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xEu);
                  if (result)
                  {
                    v18 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v18 >= 0xFu && (v19 = v18[7]) != 0)
                      v20 = (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19));
                    else
                      v20 = 0;
                    result = sub_1C1CB5E8C((_QWORD *)a2, v20);
                    if (result)
                    {
                      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x10u);
                      if (result)
                      {
                        v21 = (unsigned __int16 *)((char *)a1 - *a1);
                        if (*v21 >= 0x11u && (v22 = v21[8]) != 0)
                          v23 = (unsigned int *)((char *)a1 + v22 + *(unsigned int *)((char *)a1 + v22));
                        else
                          v23 = 0;
                        result = sub_1C1CB5E8C((_QWORD *)a2, v23);
                        if (result)
                        {
                          result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x12u);
                          if (result)
                          {
                            v24 = (unsigned __int16 *)((char *)a1 - *a1);
                            if (*v24 >= 0x13u && (v25 = v24[9]) != 0)
                              v26 = (unsigned int *)((char *)a1 + v25 + *(unsigned int *)((char *)a1 + v25));
                            else
                              v26 = 0;
                            result = sub_1C1CB5E8C((_QWORD *)a2, v26);
                            if (result)
                            {
                              result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x14u);
                              if (result)
                              {
                                v27 = (unsigned __int16 *)((char *)a1 - *a1);
                                if (*v27 >= 0x15u && (v28 = v27[10]) != 0)
                                  v29 = (unsigned int *)((char *)a1 + v28 + *(unsigned int *)((char *)a1 + v28));
                                else
                                  v29 = 0;
                                result = sub_1C1CB5E8C((_QWORD *)a2, v29);
                                if (result)
                                {
                                  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x16u);
                                  if (result)
                                  {
                                    v30 = (unsigned __int16 *)((char *)a1 - *a1);
                                    if (*v30 >= 0x17u && (v31 = v30[11]) != 0)
                                      v32 = (unsigned int *)((char *)a1 + v31 + *(unsigned int *)((char *)a1 + v31));
                                    else
                                      v32 = 0;
                                    result = sub_1C1CB5E8C((_QWORD *)a2, v32);
                                    if (result)
                                    {
                                      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x18u);
                                      if (result)
                                      {
                                        v33 = (unsigned __int16 *)((char *)a1 - *a1);
                                        if (*v33 >= 0x19u && (v34 = v33[12]) != 0)
                                          v35 = (unsigned int *)((char *)a1 + v34 + *(unsigned int *)((char *)a1 + v34));
                                        else
                                          v35 = 0;
                                        result = sub_1C1CB5E8C((_QWORD *)a2, v35);
                                        if (result)
                                        {
                                          --*(_DWORD *)(a2 + 16);
                                          return 1;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C1CB64F8(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    v5 = (unsigned __int16 *)((char *)a1 - *a1);
    v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, v7 = *(_QWORD *)(a2 + 8), v7 >= 5) && v7 - 4 >= (unint64_t)a1 + v5[2] - *(_QWORD *)a2)
      && (v6 < 7
       || (!v5[3]
        || (result = 0, v8 = *(_QWORD *)(a2 + 8), v8 >= 5) && v8 - 4 >= (unint64_t)a1 + v5[3] - *(_QWORD *)a2)
       && (v6 < 9
        || (v9 = v5[4]) == 0
        || (result = 0, v10 = *(_QWORD *)(a2 + 8), v10 >= 5) && v10 - 4 >= (unint64_t)a1 + v9 - *(_QWORD *)a2)))
    {
      --*(_DWORD *)(a2 + 16);
      return 1;
    }
  }
  return result;
}

BOOL sub_1C1CB65EC(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned __int16 *v27;
  uint64_t v28;
  unint64_t v29;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      else
        v7 = 0;
      result = sub_1C1CB5E8C((_QWORD *)a2, v7);
      if (result)
      {
        result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
        if (result)
        {
          v8 = (unsigned __int16 *)((char *)a1 - *a1);
          if (*v8 >= 7u && (v9 = v8[3]) != 0)
            v10 = (unsigned int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9));
          else
            v10 = 0;
          result = sub_1C1CB5E8C((_QWORD *)a2, v10);
          if (result)
          {
            v11 = (unsigned __int16 *)((char *)a1 - *a1);
            v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (result = 0, v13 = *(_QWORD *)(a2 + 8), v13 >= 9)
               && v13 - 8 >= (unint64_t)a1 + v11[4] - *(_QWORD *)a2)
              && (v12 < 0xB
               || (v14 = v11[5]) == 0
               || (result = 0, v15 = *(_QWORD *)(a2 + 8), v15 >= 9)
               && v15 - 8 >= (unint64_t)a1 + v14 - *(_QWORD *)a2))
            {
              result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xCu);
              if (result)
              {
                v16 = (unsigned __int16 *)((char *)a1 - *a1);
                if (*v16 < 0xDu
                  || (v17 = v16[6]) == 0
                  || (result = sub_1C1CB64F8((int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), a2)))
                {
                  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xEu);
                  if (result)
                  {
                    v18 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v18 >= 0xFu && (v19 = v18[7]) != 0)
                      v20 = (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19));
                    else
                      v20 = 0;
                    result = sub_1C1CB5E8C((_QWORD *)a2, v20);
                    if (result)
                    {
                      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x10u);
                      if (result)
                      {
                        v21 = (unsigned __int16 *)((char *)a1 - *a1);
                        if (*v21 >= 0x11u && (v22 = v21[8]) != 0)
                          v23 = (unsigned int *)((char *)a1 + v22 + *(unsigned int *)((char *)a1 + v22));
                        else
                          v23 = 0;
                        result = sub_1C1CB5E8C((_QWORD *)a2, v23);
                        if (result)
                        {
                          result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x12u);
                          if (result)
                          {
                            v24 = (unsigned __int16 *)((char *)a1 - *a1);
                            if (*v24 >= 0x13u && (v25 = v24[9]) != 0)
                              v26 = (unsigned int *)((char *)a1 + v25 + *(unsigned int *)((char *)a1 + v25));
                            else
                              v26 = 0;
                            result = sub_1C1CB5E8C((_QWORD *)a2, v26);
                            if (result)
                            {
                              v27 = (unsigned __int16 *)((char *)a1 - *a1);
                              if (*v27 < 0x15u
                                || (v28 = v27[10]) == 0
                                || (result = 0, v29 = *(_QWORD *)(a2 + 8), v29 >= 9)
                                && v29 - 8 >= (unint64_t)a1 + v28 - *(_QWORD *)a2)
                              {
                                --*(_DWORD *)(a2 + 16);
                                return 1;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C1CB68C4(int *a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int16 *v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int16 *v8;
  unsigned int v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  _DWORD *v18;
  unsigned __int16 *v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (!(_DWORD)result)
    return result;
  v5 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v5 >= 5u)
  {
    v6 = v5[2];
    if (v6)
    {
      result = 0;
      v7 = *(_QWORD *)(a2 + 8);
      if (v7 < 2 || v7 - 1 < (unint64_t)a1 + v6 - *(_QWORD *)a2)
        return result;
    }
  }
  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
  if (!(_DWORD)result)
    return result;
  v8 = (unsigned __int16 *)((char *)a1 - *a1);
  v9 = *v8;
  if (v9 >= 7)
  {
    if (v8[3])
    {
      v10 = (int *)((char *)a1 + v8[3] + *(unsigned int *)((char *)a1 + v8[3]));
LABEL_12:
      v11 = v8[2];
      if (v11)
      {
        if (v10)
        {
          if (*((_BYTE *)a1 + v11) == 1)
          {
            result = sub_1C1CB6174(v10, a2);
            if (!(_DWORD)result)
              return result;
          }
        }
      }
      goto LABEL_16;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  if (v9 >= 5)
    goto LABEL_11;
LABEL_16:
  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 8u);
  if (!(_DWORD)result)
    return result;
  v12 = *a1;
  v13 = -v12;
  v14 = (unsigned __int16 *)((char *)a1 - v12);
  if (*v14 >= 9u)
  {
    v15 = v14[4];
    if (v15)
    {
      result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v15 + *(unsigned int *)((char *)a1 + v15)), 4uLL, 0);
      if (!(_DWORD)result)
        return result;
      v13 = -(uint64_t)*a1;
    }
  }
  v16 = (unsigned __int16 *)((char *)a1 + v13);
  if (*v16 >= 9u && (v17 = v16[4]) != 0)
    v18 = (int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17));
  else
    v18 = 0;
  result = sub_1C1CB6B38(a2, v18);
  if ((_DWORD)result)
  {
    v19 = (unsigned __int16 *)((char *)a1 - *a1);
    v20 = *v19;
    if (v20 < 0xB)
      goto LABEL_42;
    if (!v19[5]
      || (result = 0, v21 = *(_QWORD *)(a2 + 8), v21 >= 9) && v21 - 8 >= (unint64_t)a1 + v19[5] - *(_QWORD *)a2)
    {
      if (v20 < 0xD
        || (!v19[6]
         || (result = 0, v22 = *(_QWORD *)(a2 + 8), v22 >= 2)
         && v22 - 1 >= (unint64_t)a1 + v19[6] - *(_QWORD *)a2)
        && (v20 < 0xF
         || (!v19[7]
          || (result = 0, v23 = *(_QWORD *)(a2 + 8), v23 >= 2)
          && v23 - 1 >= (unint64_t)a1 + v19[7] - *(_QWORD *)a2)
         && (v20 < 0x11
          || (v24 = v19[8]) == 0
          || (result = 0, v25 = *(_QWORD *)(a2 + 8), v25 >= 5)
          && v25 - 4 >= (unint64_t)a1 + v24 - *(_QWORD *)a2)))
      {
LABEL_42:
        --*(_DWORD *)(a2 + 16);
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_1C1CB6B38(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB6BAC((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C1CB6BAC(int *a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  unsigned __int16 *v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  uint64_t v23;
  unsigned __int16 *v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int16 *v33;
  uint64_t v34;
  unsigned __int16 *v35;
  uint64_t v36;
  _DWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int16 *v40;
  uint64_t v41;
  unsigned __int16 *v42;
  uint64_t v43;
  _DWORD *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int16 *v47;
  uint64_t v48;
  unsigned __int16 *v49;
  uint64_t v50;
  _DWORD *v51;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if ((_DWORD)result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 4u);
    if ((_DWORD)result)
    {
      v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      else
        v7 = 0;
      result = sub_1C1CB5E8C((_QWORD *)a2, v7);
      if ((_DWORD)result)
      {
        v8 = (unsigned __int16 *)((char *)a1 - *a1);
        v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (result = 0, v10 = *(_QWORD *)(a2 + 8), v10 >= 9)
           && v10 - 8 >= (unint64_t)a1 + v8[3] - *(_QWORD *)a2)
          && (v9 < 9
           || (v11 = v8[4]) == 0
           || (result = 0, v12 = *(_QWORD *)(a2 + 8), v12 >= 9)
           && v12 - 8 >= (unint64_t)a1 + v11 - *(_QWORD *)a2))
        {
          result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xAu);
          if ((_DWORD)result)
          {
            v13 = *a1;
            v14 = -v13;
            v15 = (unsigned __int16 *)((char *)a1 - v13);
            if (*v15 >= 0xBu)
            {
              v16 = v15[5];
              if (v16)
              {
                result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v16 + *(unsigned int *)((char *)a1 + v16)), 4uLL, 0);
                if (!(_DWORD)result)
                  return result;
                v14 = -(uint64_t)*a1;
              }
            }
            v17 = (unsigned __int16 *)((char *)a1 + v14);
            if (*v17 >= 0xBu && (v18 = v17[5]) != 0)
              v19 = (int *)((char *)a1 + v18 + *(unsigned int *)((char *)a1 + v18));
            else
              v19 = 0;
            result = sub_1C1CB704C(a2, v19);
            if ((_DWORD)result)
            {
              result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xCu);
              if ((_DWORD)result)
              {
                v20 = *a1;
                v21 = -v20;
                v22 = (unsigned __int16 *)((char *)a1 - v20);
                if (*v22 >= 0xDu)
                {
                  v23 = v22[6];
                  if (v23)
                  {
                    result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v23 + *(unsigned int *)((char *)a1 + v23)), 1uLL, 0);
                    if (!(_DWORD)result)
                      return result;
                    v21 = -(uint64_t)*a1;
                  }
                }
                v24 = (unsigned __int16 *)((char *)a1 + v21);
                v25 = *v24;
                if (v25 < 0xF)
                  goto LABEL_80;
                if (!v24[7]
                  || (result = 0, v26 = *(_QWORD *)(a2 + 8), v26 >= 9)
                  && v26 - 8 >= (unint64_t)a1 + v24[7] - *(_QWORD *)a2)
                {
                  if (v25 < 0x11
                    || (!v24[8]
                     || (result = 0, v27 = *(_QWORD *)(a2 + 8), v27 >= 2)
                     && v27 - 1 >= (unint64_t)a1 + v24[8] - *(_QWORD *)a2)
                    && (v25 < 0x13
                     || (!v24[9]
                      || (result = 0, v28 = *(_QWORD *)(a2 + 8), v28 >= 2)
                      && v28 - 1 >= (unint64_t)a1 + v24[9] - *(_QWORD *)a2)
                     && (v25 < 0x15
                      || (v29 = v24[10]) == 0
                      || (result = 0, v30 = *(_QWORD *)(a2 + 8), v30 >= 2)
                      && v30 - 1 >= (unint64_t)a1 + v29 - *(_QWORD *)a2)))
                  {
LABEL_80:
                    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x16u);
                    if ((_DWORD)result)
                    {
                      v31 = *a1;
                      v32 = -v31;
                      v33 = (unsigned __int16 *)((char *)a1 - v31);
                      if (*v33 >= 0x17u)
                      {
                        v34 = v33[11];
                        if (v34)
                        {
                          result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v34 + *(unsigned int *)((char *)a1 + v34)), 4uLL, 0);
                          if (!(_DWORD)result)
                            return result;
                          v32 = -(uint64_t)*a1;
                        }
                      }
                      v35 = (unsigned __int16 *)((char *)a1 + v32);
                      if (*v35 >= 0x17u && (v36 = v35[11]) != 0)
                        v37 = (int *)((char *)a1 + v36 + *(unsigned int *)((char *)a1 + v36));
                      else
                        v37 = 0;
                      result = sub_1C1CB70C0(a2, v37);
                      if ((_DWORD)result)
                      {
                        result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x18u);
                        if ((_DWORD)result)
                        {
                          v38 = *a1;
                          v39 = -v38;
                          v40 = (unsigned __int16 *)((char *)a1 - v38);
                          if (*v40 >= 0x19u)
                          {
                            v41 = v40[12];
                            if (v41)
                            {
                              result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v41 + *(unsigned int *)((char *)a1 + v41)), 4uLL, 0);
                              if (!(_DWORD)result)
                                return result;
                              v39 = -(uint64_t)*a1;
                            }
                          }
                          v42 = (unsigned __int16 *)((char *)a1 + v39);
                          if (*v42 >= 0x19u && (v43 = v42[12]) != 0)
                            v44 = (int *)((char *)a1 + v43 + *(unsigned int *)((char *)a1 + v43));
                          else
                            v44 = 0;
                          result = sub_1C1CB7134(a2, v44);
                          if ((_DWORD)result)
                          {
                            result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x1Au);
                            if ((_DWORD)result)
                            {
                              v45 = *a1;
                              v46 = -v45;
                              v47 = (unsigned __int16 *)((char *)a1 - v45);
                              if (*v47 >= 0x1Bu)
                              {
                                v48 = v47[13];
                                if (v48)
                                {
                                  result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v48 + *(unsigned int *)((char *)a1 + v48)), 4uLL, 0);
                                  if (!(_DWORD)result)
                                    return result;
                                  v46 = -(uint64_t)*a1;
                                }
                              }
                              v49 = (unsigned __int16 *)((char *)a1 + v46);
                              if (*v49 >= 0x1Bu && (v50 = v49[13]) != 0)
                                v51 = (int *)((char *)a1 + v50 + *(unsigned int *)((char *)a1 + v50));
                              else
                                v51 = 0;
                              result = sub_1C1CB7134(a2, v51);
                              if ((_DWORD)result)
                              {
                                --*(_DWORD *)(a2 + 16);
                                return 1;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C1CB704C(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB71A8((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C1CB70C0(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  _BOOL8 result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB79D8((int *)((char *)v5 + *v5), a1);
    if (!result)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C1CB7134(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB7B34((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C1CB71A8(int *a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned __int16 *v13;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned __int16 *v20;
  uint64_t v21;
  _DWORD *v22;
  unsigned __int16 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int16 *v27;
  uint64_t v28;
  unsigned __int16 *v29;
  uint64_t v30;
  _DWORD *v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unint64_t v34;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if ((_DWORD)result)
  {
    v5 = (unsigned __int16 *)((char *)a1 - *a1);
    v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, v7 = *(_QWORD *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(_QWORD *)a2)
      && (v6 < 7
       || (v8 = v5[3]) == 0
       || (result = 0, v9 = *(_QWORD *)(a2 + 8), v9 >= 9) && v9 - 8 >= (unint64_t)a1 + v8 - *(_QWORD *)a2))
    {
      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 8u);
      if ((_DWORD)result)
      {
        v10 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v10 >= 9u && (v11 = v10[4]) != 0)
          v12 = (unsigned int *)((char *)a1 + v11 + *(unsigned int *)((char *)a1 + v11));
        else
          v12 = 0;
        result = sub_1C1CB5E8C((_QWORD *)a2, v12);
        if ((_DWORD)result)
        {
          result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xAu);
          if ((_DWORD)result)
          {
            v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 >= 0xBu && (v14 = v13[5]) != 0)
              v15 = (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14));
            else
              v15 = 0;
            result = sub_1C1CB5E8C((_QWORD *)a2, v15);
            if ((_DWORD)result)
            {
              result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xCu);
              if ((_DWORD)result)
              {
                v16 = *a1;
                v17 = -v16;
                v18 = (unsigned __int16 *)((char *)a1 - v16);
                if (*v18 >= 0xDu)
                {
                  v19 = v18[6];
                  if (v19)
                  {
                    result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v19 + *(unsigned int *)((char *)a1 + v19)), 4uLL, 0);
                    if (!(_DWORD)result)
                      return result;
                    v17 = -(uint64_t)*a1;
                  }
                }
                v20 = (unsigned __int16 *)((char *)a1 + v17);
                if (*v20 >= 0xDu && (v21 = v20[6]) != 0)
                  v22 = (int *)((char *)a1 + v21 + *(unsigned int *)((char *)a1 + v21));
                else
                  v22 = 0;
                result = sub_1C1CB74C0(a2, v22);
                if ((_DWORD)result)
                {
                  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xEu);
                  if ((_DWORD)result)
                  {
                    v23 = (unsigned __int16 *)((char *)a1 - *a1);
                    if (*v23 < 0xFu
                      || (v24 = v23[7]) == 0
                      || (result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v24 + *(unsigned int *)((char *)a1 + v24)), 1uLL, 0), (_DWORD)result))
                    {
                      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0x10u);
                      if ((_DWORD)result)
                      {
                        v25 = *a1;
                        v26 = -v25;
                        v27 = (unsigned __int16 *)((char *)a1 - v25);
                        if (*v27 >= 0x11u)
                        {
                          v28 = v27[8];
                          if (v28)
                          {
                            result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v28 + *(unsigned int *)((char *)a1 + v28)), 4uLL, 0);
                            if (!(_DWORD)result)
                              return result;
                            v26 = -(uint64_t)*a1;
                          }
                        }
                        v29 = (unsigned __int16 *)((char *)a1 + v26);
                        if (*v29 >= 0x11u && (v30 = v29[8]) != 0)
                          v31 = (int *)((char *)a1 + v30 + *(unsigned int *)((char *)a1 + v30));
                        else
                          v31 = 0;
                        result = sub_1C1CB7534(a2, v31);
                        if ((_DWORD)result)
                        {
                          v32 = (unsigned __int16 *)((char *)a1 - *a1);
                          if (*v32 < 0x13u
                            || (v33 = v32[9]) == 0
                            || (result = 0, v34 = *(_QWORD *)(a2 + 8), v34 >= 9)
                            && v34 - 8 >= (unint64_t)a1 + v33 - *(_QWORD *)a2)
                          {
                            --*(_DWORD *)(a2 + 16);
                            return 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C1CB74C0(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  _BOOL8 result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB75A8((int *)((char *)v5 + *v5), a1);
    if (!result)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t sub_1C1CB7534(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  uint64_t result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = sub_1C1CB775C((int *)((char *)v5 + *v5), a1);
    if ((result & 1) == 0)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

BOOL sub_1C1CB75A8(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      else
        v7 = 0;
      result = sub_1C1CB5E8C((_QWORD *)a2, v7);
      if (result)
      {
        v8 = (unsigned __int16 *)((char *)a1 - *a1);
        v9 = *v8;
        if (v9 < 7)
          goto LABEL_28;
        if (!v8[3]
          || (result = 0, v10 = *(_QWORD *)(a2 + 8), v10 >= 5)
          && v10 - 4 >= (unint64_t)a1 + v8[3] - *(_QWORD *)a2)
        {
          if (v9 < 9)
            goto LABEL_28;
          if (!v8[4]
            || (result = 0, v11 = *(_QWORD *)(a2 + 8), v11 >= 5)
            && v11 - 4 >= (unint64_t)a1 + v8[4] - *(_QWORD *)a2)
          {
            if (v9 < 0xB
              || (!v8[5]
               || (result = 0, v12 = *(_QWORD *)(a2 + 8), v12 >= 5)
               && v12 - 4 >= (unint64_t)a1 + v8[5] - *(_QWORD *)a2)
              && (v9 < 0xD
               || (!v8[6]
                || (result = 0, v13 = *(_QWORD *)(a2 + 8), v13 >= 9)
                && v13 - 8 >= (unint64_t)a1 + v8[6] - *(_QWORD *)a2)
               && (v9 < 0xF
                || (v14 = v8[7]) == 0
                || (result = 0, v15 = *(_QWORD *)(a2 + 8), v15 >= 5)
                && v15 - 4 >= (unint64_t)a1 + v14 - *(_QWORD *)a2)))
            {
LABEL_28:
              --*(_DWORD *)(a2 + 16);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C1CB775C(int *a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned __int16 *v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 *v20;
  uint64_t v21;
  unsigned __int16 *v22;
  uint64_t v23;
  char *v24;
  unsigned __int16 *v25;
  uint64_t v26;
  unint64_t v27;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if ((_DWORD)result)
  {
    v5 = (unsigned __int16 *)((char *)a1 - *a1);
    v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, v7 = *(_QWORD *)(a2 + 8), v7 >= 9) && v7 - 8 >= (unint64_t)a1 + v5[2] - *(_QWORD *)a2)
      && (v6 < 7
       || (v8 = v5[3]) == 0
       || (result = 0, v9 = *(_QWORD *)(a2 + 8), v9 >= 9) && v9 - 8 >= (unint64_t)a1 + v8 - *(_QWORD *)a2))
    {
      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 8u);
      if ((_DWORD)result)
      {
        v10 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v10 >= 9u && (v11 = v10[4]) != 0)
          v12 = (unsigned int *)((char *)a1 + v11 + *(unsigned int *)((char *)a1 + v11));
        else
          v12 = 0;
        result = sub_1C1CB5E8C((_QWORD *)a2, v12);
        if ((_DWORD)result)
        {
          result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xAu);
          if ((_DWORD)result)
          {
            v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 >= 0xBu && (v14 = v13[5]) != 0)
              v15 = (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14));
            else
              v15 = 0;
            result = sub_1C1CB5E8C((_QWORD *)a2, v15);
            if ((_DWORD)result)
            {
              result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xCu);
              if ((_DWORD)result)
              {
                v16 = (unsigned __int16 *)((char *)a1 - *a1);
                if (*v16 < 0xDu
                  || (v17 = v16[6]) == 0
                  || (result = sub_1C1CB75A8((int *)((char *)a1 + v17 + *(unsigned int *)((char *)a1 + v17)), a2),
                      (_DWORD)result))
                {
                  result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xEu);
                  if ((_DWORD)result)
                  {
                    v18 = *a1;
                    v19 = -v18;
                    v20 = (unsigned __int16 *)((char *)a1 - v18);
                    if (*v20 >= 0xFu)
                    {
                      v21 = v20[7];
                      if (v21)
                      {
                        result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v21 + *(unsigned int *)((char *)a1 + v21)), 4uLL, 0);
                        if (!(_DWORD)result)
                          return result;
                        v19 = -(uint64_t)*a1;
                      }
                    }
                    v22 = (unsigned __int16 *)((char *)a1 + v19);
                    if (*v22 >= 0xFu && (v23 = v22[7]) != 0)
                      v24 = (char *)a1 + v23 + *(unsigned int *)((char *)a1 + v23);
                    else
                      v24 = 0;
                    result = sub_1C1CB7534(a2, v24);
                    if ((_DWORD)result)
                    {
                      v25 = (unsigned __int16 *)((char *)a1 - *a1);
                      if (*v25 < 0x11u
                        || (v26 = v25[8]) == 0
                        || (result = 0, v27 = *(_QWORD *)(a2 + 8), v27 >= 9)
                        && v27 - 8 >= (unint64_t)a1 + v26 - *(_QWORD *)a2)
                      {
                        --*(_DWORD *)(a2 + 16);
                        return 1;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C1CB79D8(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int16 *v13;
  uint64_t v14;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    result = sub_1C1CB56AC(a1, (_QWORD *)a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      else
        v7 = 0;
      result = sub_1C1CB5E8C((_QWORD *)a2, v7);
      if (result)
      {
        v8 = (unsigned __int16 *)((char *)a1 - *a1);
        v9 = *v8;
        if (v9 < 7
          || (!v8[3]
           || (result = 0, v10 = *(_QWORD *)(a2 + 8), v10 >= 9)
           && v10 - 8 >= (unint64_t)a1 + v8[3] - *(_QWORD *)a2)
          && (v9 < 9
           || (v11 = v8[4]) == 0
           || (result = 0, v12 = *(_QWORD *)(a2 + 8), v12 >= 9)
           && v12 - 8 >= (unint64_t)a1 + v11 - *(_QWORD *)a2))
        {
          result = sub_1C1CB56AC(a1, (_QWORD *)a2, 0xAu);
          if (result)
          {
            v13 = (unsigned __int16 *)((char *)a1 - *a1);
            if (*v13 < 0xBu
              || (v14 = v13[5]) == 0
              || (result = sub_1C1CB58A0(a2, (unsigned int *)((char *)a1 + v14 + *(unsigned int *)((char *)a1 + v14)), 1uLL, 0)))
            {
              --*(_DWORD *)(a2 + 16);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C1CB7B34(int *a1, uint64_t a2)
{
  uint64_t result;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned __int16 *v8;
  uint64_t v9;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if ((_DWORD)result)
  {
    result = sub_1C1CB7C0C(a1, (_QWORD *)a2, 4u);
    if ((_DWORD)result)
    {
      v5 = (unsigned __int16 *)((char *)a1 - *a1);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (unsigned int *)((char *)a1 + v6 + *(unsigned int *)((char *)a1 + v6));
      else
        v7 = 0;
      result = sub_1C1CB5E8C((_QWORD *)a2, v7);
      if ((_DWORD)result)
      {
        result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
        if ((_DWORD)result)
        {
          v8 = (unsigned __int16 *)((char *)a1 - *a1);
          if (*v8 < 7u
            || (v9 = v8[3]) == 0
            || (result = sub_1C1CB71A8((int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9)), a2), (_DWORD)result))
          {
            --*(_DWORD *)(a2 + 16);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1C1CB7C0C(int *a1, _QWORD *a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;

  v3 = (unsigned __int16 *)((char *)a1 - *a1);
  return *v3 > a3
      && (v4 = *(unsigned __int16 *)((char *)v3 + a3)) != 0
      && sub_1C1CB54F4((uint64_t)a2, (unint64_t)a1 + v4 - *a2) != 0;
}

BOOL sub_1C1CB7C60(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 *v10;
  unsigned int v11;
  int *v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  unint64_t v16;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    v5 = (unsigned __int16 *)((char *)a1 - *a1);
    if (*v5 < 5u
      || (v6 = v5[2]) == 0
      || (result = 0, v7 = *(_QWORD *)(a2 + 8), v7 >= 2) && v7 - 1 >= (unint64_t)a1 + v6 - *(_QWORD *)a2)
    {
      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
      if (result)
      {
        v8 = *a1;
        v9 = -v8;
        v10 = (unsigned __int16 *)((char *)a1 - v8);
        v11 = *v10;
        if (v11 < 7)
        {
          if (v11 < 5)
          {
LABEL_17:
            v14 = (unsigned __int16 *)((char *)a1 + v9);
            if (*v14 < 9u
              || (v15 = v14[4]) == 0
              || (result = 0, v16 = *(_QWORD *)(a2 + 8), v16 >= 9)
              && v16 - 8 >= (unint64_t)a1 + v15 - *(_QWORD *)a2)
            {
              --*(_DWORD *)(a2 + 16);
              return 1;
            }
            return result;
          }
        }
        else if (v10[3])
        {
          v12 = (int *)((char *)a1 + v10[3] + *(unsigned int *)((char *)a1 + v10[3]));
LABEL_12:
          v13 = v10[2];
          if (v13 && v12 && *((_BYTE *)a1 + v13) == 1)
          {
            result = sub_1C1CB65EC(v12, a2);
            if (!result)
              return result;
            v9 = -(uint64_t)*a1;
          }
          goto LABEL_17;
        }
        v12 = 0;
        goto LABEL_12;
      }
    }
  }
  return result;
}

BOOL sub_1C1CB7DA0(int *a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned int *v10;

  result = sub_1C1CB57E8((uint64_t *)a2, a1);
  if (result)
  {
    v5 = (unsigned __int16 *)((char *)a1 - *a1);
    if (*v5 < 5u
      || (v6 = v5[2]) == 0
      || (result = 0, v7 = *(_QWORD *)(a2 + 8), v7 >= 5) && v7 - 4 >= (unint64_t)a1 + v6 - *(_QWORD *)a2)
    {
      result = sub_1C1CB56AC(a1, (_QWORD *)a2, 6u);
      if (result)
      {
        v8 = (unsigned __int16 *)((char *)a1 - *a1);
        if (*v8 >= 7u && (v9 = v8[3]) != 0)
          v10 = (unsigned int *)((char *)a1 + v9 + *(unsigned int *)((char *)a1 + v9));
        else
          v10 = 0;
        result = sub_1C1CB5E8C((_QWORD *)a2, v10);
        if (result)
        {
          --*(_DWORD *)(a2 + 16);
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_1C1CB7E74()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF7190A8;
  qword_1EF7190A8 = v0;

}

void sub_1C1CB7EA0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EF7190B0);
  v2 = (void *)qword_1EF7190A8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *__error();
  sub_1C1CB1954();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
      sub_1C1CC83C4();

    *__error() = v5;
    v8 = (void *)qword_1EF7190A8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

  }
  else
  {
    if (v7)
      sub_1C1CC8350();

    *__error() = v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EF7190B0);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void sub_1C1CB7FD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C1CB7FF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1C1CB8030(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1C1CB8044(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_1C1CB8050(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id tailspin_config_copy_description(uint64_t *a1, int a2)
{
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  const __CFString *v17;
  const char *v18;
  int v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  float v29;
  BOOL v30;
  const __CFString *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const __CFString *v35;
  float v36;
  const __CFString *v37;
  const char *v38;
  const __CFString *v39;
  id v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  const __CFString *v45;
  void *v46;
  const char *v48;
  const char *v49;
  int v50;
  const char *v51;
  const __CFString *v52;
  uint64_t v53;
  size_t v54;
  size_t __n;
  unsigned int v56;
  char __s1[16];
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a1 + 8204;
  v5 = (void *)MEMORY[0x1C3BB47E4]();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 4000);
  v7 = v6;
  v8 = *((_DWORD *)a1 + 2);
  if (v8 == 3)
  {
    v9 = CFSTR("tailspin configuration is enforced by profile\n\n");
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    v9 = CFSTR("tailspin configuration is enforced by tasking\n\n");
LABEL_5:
    objc_msgSend(v6, "appendString:", v9);
    v10 = *((unsigned __int8 *)v4 + 156);
    v11 = CFSTR("enabled");
    if (!v4[156])
      v11 = CFSTR("disabled");
    objc_msgSend(v7, "appendFormat:", CFSTR("tailspin has been %@"), v11);
    v12 = CFSTR("\n");
LABEL_8:
    objc_msgSend(v7, "appendString:", v12);
    if (v10)
      goto LABEL_9;
    goto LABEL_101;
  }
  v10 = *((unsigned __int8 *)v4 + 156);
  v16 = *a1;
  v17 = CFSTR("enabled");
  if (!v4[156])
    v17 = CFSTR("disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR("tailspin has been %@"), v17);
  if ((v16 & 0x80) == 0)
  {
    v12 = CFSTR(" (default behavior)\n");
    goto LABEL_8;
  }
  v18 = v4 + 157;
  if (!v4[157])
    v18 = "Unknown Process";
  objc_msgSend(v7, "appendFormat:", CFSTR(" (overridden by %s)\n"), v18);
  if (v10)
  {
LABEL_9:
    objc_msgSend(v7, "appendString:", CFSTR("tailspin has been enabled with the following configurations:\n"));
    v13 = v7;
    if (a2)
    {
      v56 = -1;
      *(_OWORD *)__s1 = 0u;
      v58 = 0u;
      __n = 32;
      v54 = 4;
      if (sysctlbyname("ktrace.state", &v56, &v54, 0, 0))
      {
        v14 = *__error();
        sub_1C1CB1954();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1C1CC84CC(v15);

        *__error() = v14;
        objc_msgSend(v13, "appendFormat:", CFSTR("Unable to get current ktrace state: %d\n"), *__error(), v53);
      }
      else if (sysctlbyname("ktrace.configured_by", __s1, &__n, 0, 0))
      {
        v19 = *__error();
        sub_1C1CB1954();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_1C1CC8438((int *)&v56, v20);

        *__error() = v19;
        objc_msgSend(v13, "appendFormat:", CFSTR("Unable to get current ktrace configured_by for state %d: %d\n"), v56, *__error());
      }
      else
      {
        objc_msgSend(v13, "appendString:", CFSTR("\tkdebug status is: "));
        switch(v56)
        {
          case 0xFFFFFFFF:
            v52 = CFSTR("unknown\n");
            goto LABEL_118;
          case 0u:
            objc_msgSend(v13, "appendString:", CFSTR("uninitialized\n"));
            goto LABEL_33;
          case 1u:
            if (__n)
            {
              objc_msgSend(v13, "appendFormat:", CFSTR("preempted [%s]\n"), __s1, v53);
            }
            else
            {
              v52 = CFSTR("preempted\n");
LABEL_118:
              objc_msgSend(v13, "appendString:", v52);
            }
            break;
          case 2u:
            objc_msgSend(v13, "appendString:", CFSTR("background\n"));
            if (__n && strncmp(__s1, "tailspind", __n))
              objc_msgSend(v13, "appendFormat:", CFSTR("\tWARNING: there is another background tracing client: '%s'\n"), __s1, v53);
            break;
          default:
            break;
        }
      }
    }
    v21 = *((_DWORD *)a1 + 2);
    objc_msgSend(v13, "appendFormat:", CFSTR("\t    buffer size = %zu MB"), a1[1030]);
    if ((v21 | 2) == 3)
    {
      v22 = CFSTR("\n");
    }
    else
    {
      if ((*(_BYTE *)a1 & 2) != 0)
      {
        v33 = v4 + 44;
        if (!v4[44])
          v33 = "Unknown Process";
        objc_msgSend(v13, "appendFormat:", CFSTR(" (overridden by %s)\n"), v33);
LABEL_29:
        v23 = (void *)MEMORY[0x1C3BB4B38]((char *)a1 + 12);
        objc_msgSend(v13, "appendFormat:", CFSTR("\t    filter descriptor: %s"), v23);
        if ((v21 | 2) == 3)
        {
          v24 = CFSTR("\n");
        }
        else
        {
          if ((*(_BYTE *)a1 & 1) != 0)
          {
            if (*v4)
              v34 = v4;
            else
              v34 = "Unknown Process";
            objc_msgSend(v13, "appendFormat:", CFSTR(" (overridden by %s)\n"), v34);
            goto LABEL_32;
          }
          v24 = CFSTR(" (default behavior)\n");
        }
        objc_msgSend(v13, "appendString:", v24);
LABEL_32:
        free(v23);
LABEL_33:

        objc_msgSend(v13, "appendString:", CFSTR("\n"));
        v25 = v13;
        v26 = *((_DWORD *)a1 + 2);
        objc_msgSend(v25, "appendString:", CFSTR("\tsampling:\n"));
        v27 = a1[1040];
        v28 = a1[1035];
        if (v27)
        {
          if (v27 >= 0x3B9ACA00)
          {
            v29 = (float)v27 / 1000000000.0;
            v31 = CFSTR("s");
          }
          else if (v27 >= 0xF4240)
          {
            v29 = (float)v27 / 1000000.0;
            v31 = CFSTR("ms");
          }
          else
          {
            v29 = (float)v27;
            v30 = v27 >= 0x3E8;
            if (v27 >= 0x3E8)
              v29 = (float)v27 / 1000.0;
            v31 = CFSTR("µs");
            if (!v30)
              v31 = CFSTR("ns");
          }
          objc_msgSend(v25, "appendFormat:", CFSTR("\t    on-core sampling period        = %.2f %@"), v29, v31);
        }
        else
        {
          v32 = " (full-system includes on-core)";
          if (!v28)
            v32 = "";
          objc_msgSend(v25, "appendFormat:", CFSTR("\t    on-core sampling period        = disabled%s"), v32, v53);
        }
        if ((v26 | 2) == 3)
        {
          v35 = CFSTR("\n");
        }
        else
        {
          if ((*(_BYTE *)a1 & 0x10) != 0)
          {
            v38 = v4 + 124;
            if (!v4[124])
              v38 = "Unknown Process";
            objc_msgSend(v25, "appendFormat:", CFSTR(" (overridden by %s)\n"), v38);
            if (v28)
              goto LABEL_63;
            goto LABEL_74;
          }
          v35 = CFSTR(" (default behavior)\n");
        }
        objc_msgSend(v25, "appendString:", v35);
        if (v28)
        {
LABEL_63:
          if (v28 >= 0x3B9ACA00)
          {
            v36 = (float)v28 / 1000000000.0;
            v37 = CFSTR("s");
          }
          else if (v28 >= 0xF4240)
          {
            v36 = (float)v28 / 1000000.0;
            v37 = CFSTR("ms");
          }
          else
          {
            v36 = (float)v28;
            if (v28 >= 0x3E8)
              v36 = (float)v28 / 1000.0;
            v37 = CFSTR("µs");
            if (v28 < 0x3E8)
              v37 = CFSTR("ns");
          }
          objc_msgSend(v25, "appendFormat:", CFSTR("\t    full-system sampling period    = %.2f %@"), v36, v37);
LABEL_77:
          if ((v26 | 2) == 3)
          {
            v39 = CFSTR("\n");
          }
          else
          {
            if ((*(_BYTE *)a1 & 8) != 0)
            {
              v48 = v4 + 84;
              if (!v4[84])
                v48 = "Unknown Process";
              objc_msgSend(v25, "appendFormat:", CFSTR(" (overridden by %s)\n"), v48);
LABEL_82:

              v40 = v25;
              v41 = *((_DWORD *)a1 + 2);
              objc_msgSend(v40, "appendString:", CFSTR("\t    sampling options               = "));
              objc_msgSend(MEMORY[0x1E0CB37A0], "string");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v42;
              v44 = *((_DWORD *)a1 + 2099);
              if ((v44 & 1) != 0)
              {
                objc_msgSend(v42, "appendString:", CFSTR("cswitch-sampling"));
                v44 = *((_DWORD *)a1 + 2099);
                if ((v44 & 2) == 0)
                {
LABEL_84:
                  if ((v44 & 4) == 0)
                    goto LABEL_93;
                  goto LABEL_90;
                }
              }
              else if ((v44 & 2) == 0)
              {
                goto LABEL_84;
              }
              if (objc_msgSend(v43, "length"))
                objc_msgSend(v43, "appendString:", CFSTR(","));
              objc_msgSend(v43, "appendString:", CFSTR("syscall-sampling"));
              if ((*((_DWORD *)a1 + 2099) & 4) == 0)
              {
LABEL_93:
                if (!objc_msgSend(v43, "length"))
                  objc_msgSend(v43, "appendString:", CFSTR("none"));
                objc_msgSend(v40, "appendString:", v43);
                if ((v41 | 2) == 3)
                {
                  v45 = CFSTR("\n");
                }
                else
                {
                  if ((*((_BYTE *)a1 + 8396) & 0x20) != 0)
                  {
                    v50 = *((unsigned __int8 *)v4 + 196);
                    v49 = v4 + 196;
                    if (v50)
                      v51 = v49;
                    else
                      v51 = "Unknown Process";
                    objc_msgSend(v40, "appendFormat:", CFSTR(" (overridden by %s)\n"), v51);
                    goto LABEL_100;
                  }
                  v45 = CFSTR(" (default behavior)\n");
                }
                objc_msgSend(v40, "appendString:", v45);
LABEL_100:

                goto LABEL_101;
              }
LABEL_90:
              if (objc_msgSend(v43, "length"))
                objc_msgSend(v43, "appendString:", CFSTR(","));
              objc_msgSend(v43, "appendString:", CFSTR("vmfault-sampling"));
              goto LABEL_93;
            }
            v39 = CFSTR(" (default behavior)\n");
          }
          objc_msgSend(v25, "appendString:", v39);
          goto LABEL_82;
        }
LABEL_74:
        objc_msgSend(v25, "appendString:", CFSTR("\t    full-system sampling period    = disabled"));
        goto LABEL_77;
      }
      v22 = CFSTR(" (default behavior)\n");
    }
    objc_msgSend(v13, "appendString:", v22);
    goto LABEL_29;
  }
LABEL_101:
  v46 = (void *)objc_msgSend(v7, "copy");

  objc_autoreleasePoolPop(v5);
  return v46;
}

uint64_t tailspin_enabled_get(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8360);
}

BOOL tailspin_enabled_is_default(_BYTE *a1)
{
  return (*a1 & 0x80) == 0;
}

void *tailspin_config_create_with_current_state()
{
  _xpc_connection_s *v0;
  xpc_object_t v1;
  xpc_object_t v2;
  void *v3;
  const void *data;
  const void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  size_t length;

  sub_1C1CB8AA4();
  v0 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v1, "tailspin_request_type", 1uLL);
  v2 = xpc_connection_send_message_with_reply_sync(v0, v1);

  if (MEMORY[0x1C3BB4C4C](v2) != MEMORY[0x1E0C812F8])
  {
    if (MEMORY[0x1C3BB4C4C](v2) == MEMORY[0x1E0C81310])
    {
      v7 = *__error();
      sub_1C1CB1954();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1C1CC85A4(v2, v8);

      *__error() = v7;
      v3 = 0;
      *__error() = 61;
    }
    else
    {
      v3 = 0;
    }
    goto LABEL_16;
  }
  if (!xpc_dictionary_get_BOOL(v2, "tailspin_succeeded"))
  {
    v9 = *__error();
    sub_1C1CB1954();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1C1CC8578();
    goto LABEL_15;
  }
  length = 0;
  data = xpc_dictionary_get_data(v2, "tailspin_config", &length);
  if (length != 8472)
  {
    v9 = *__error();
    sub_1C1CB1954();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1C1CC854C();
LABEL_15:

    v3 = 0;
    *__error() = v9;
    goto LABEL_16;
  }
  v5 = data;
  v6 = malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v6)
    sub_1C1CC6F30();
  v3 = v6;
  memcpy(v6, v5, 0x2118uLL);
LABEL_16:

  return v3;
}

id sub_1C1CB8AA4()
{
  if (qword_1ED0C68A0 != -1)
    dispatch_once(&qword_1ED0C68A0, &unk_1E7B8EAB0);
  return (id)qword_1ED0C68A8;
}

void *tailspin_config_create_with_config(const void *a1)
{
  void *v2;

  v2 = malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v2)
    sub_1C1CC6F30();
  return memcpy(v2, a1, 0x2118uLL);
}

char *tailspin_config_create_new()
{
  char *v0;
  char *v1;

  v0 = (char *)malloc_type_calloc(1uLL, 0x2118uLL, 0x10000409BDBFF31uLL);
  if (!v0)
    sub_1C1CC6F30();
  v1 = v0;
  *(_QWORD *)v0 = 187;
  sub_1C1CB8BC0(v0 + 8361);
  sub_1C1CB8BC0(v1 + 8248);
  sub_1C1CB8BC0(v1 + 8204);
  sub_1C1CB8BC0(v1 + 8288);
  sub_1C1CB8BC0(v1 + 8328);
  sub_1C1CB8BC0(v1 + 8400);
  return v1;
}

size_t sub_1C1CB8BC0(char *__dst)
{
  if (qword_1EF718C58 != -1)
    dispatch_once(&qword_1EF718C58, &unk_1E7B8F4A0);
  *(_OWORD *)__dst = 0u;
  *((_OWORD *)__dst + 1) = 0u;
  return strlcpy(__dst, byte_1EF718C38, 0x20uLL);
}

size_t tailspin_buffer_size_set(uint64_t a1, uint64_t a2)
{
  if (!a2)
    sub_1C1CC6F30();
  *(_QWORD *)(a1 + 8240) = a2;
  *(_QWORD *)a1 |= 2uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8248));
}

uint64_t tailspin_buffer_size_get(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8240);
}

BOOL tailspin_buffer_size_is_default(_BYTE *a1)
{
  return (*a1 & 2) == 0;
}

double tailspin_buffer_size_reset(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 8240) = tailspin_buffer_size_get_default();
  *(_QWORD *)a1 &= ~2uLL;
  result = 0.0;
  *(_OWORD *)(a1 + 8248) = 0u;
  *(_OWORD *)(a1 + 8264) = 0u;
  return result;
}

size_t tailspin_kdbg_filter_class_set(uint64_t a1, int a2, char a3)
{
  unsigned int v3;
  uint64_t v4;
  int v5;

  v3 = a2 << 8;
  v4 = a1 + 12;
  v5 = 0;
  if ((a3 & 1) != 0)
  {
    do
    {
      *(_BYTE *)(v4 + ((unint64_t)(v5 & 0xF8 | v3) >> 3)) |= 1 << (v5 & 7);
      ++v5;
    }
    while (v5 != 256);
  }
  else
  {
    do
    {
      *(_BYTE *)(v4 + ((unint64_t)(v5 & 0xF8 | v3) >> 3)) &= ~(1 << (v5 & 7));
      ++v5;
    }
    while (v5 != 256);
  }
  *(_QWORD *)a1 |= 1uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8204));
}

BOOL tailspin_kdbg_filter_class_get(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  unsigned int v4;

  if ((*(_BYTE *)(a1 + 12 + 32 * a2) & 1) == 0)
    return 0;
  v3 = 0;
  do
  {
    v4 = v3;
    if (v3 == 255)
      break;
    ++v3;
  }
  while (((*(unsigned __int8 *)(a1 + 12 + ((unint64_t)((v4 + 1) & 0xF8 | (a2 << 8)) >> 3)) >> ((v4 + 1) & 7)) & 1) != 0);
  return v4 > 0xFE;
}

BOOL tailspin_kdbg_filter_class_get_partial(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;

  if ((*(_BYTE *)(a1 + 12 + 32 * a2) & 1) != 0)
    return 1;
  v2 = 0;
  do
  {
    v3 = v2;
    if (v2 == 255)
      break;
    ++v2;
  }
  while (((*(unsigned __int8 *)(a1 + 12 + ((unint64_t)((v3 + 1) & 0xF8 | (a2 << 8)) >> 3)) >> ((v3 + 1) & 7)) & 1) == 0);
  return v3 < 0xFF;
}

size_t tailspin_kdbg_filter_subclass_set(uint64_t a1, int a2, int a3, int a4)
{
  int v4;
  uint64_t v5;
  char v6;

  v4 = 1 << (a3 & 7);
  v5 = a1 + ((unint64_t)(a3 | (a2 << 8)) >> 3);
  if (a4)
    v6 = *(_BYTE *)(v5 + 12) | v4;
  else
    v6 = *(_BYTE *)(v5 + 12) & ~(_BYTE)v4;
  *(_BYTE *)(v5 + 12) = v6;
  *(_QWORD *)a1 |= 1uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8204));
}

uint64_t tailspin_kdbg_filter_subclass_get(uint64_t a1, int a2, int a3)
{
  return (*(unsigned __int8 *)(a1 + ((unint64_t)(a3 | (a2 << 8)) >> 3) + 12) >> (a3 & 7)) & 1;
}

size_t tailspin_kdbg_filter_clear(uint64_t a1)
{
  bzero((void *)(a1 + 12), 0x2000uLL);
  *(_QWORD *)a1 |= 1uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8204));
}

void tailspin_kdbg_filter_copy_description()
{
  JUMPOUT(0x1C3BB4B38);
}

BOOL tailspin_kdbg_filter_is_default(_BYTE *a1)
{
  return (*a1 & 1) == 0;
}

double tailspin_kdbg_filter_reset(uint64_t a1)
{
  void *v2;
  void *v3;
  double result;

  v2 = (void *)(a1 + 12);
  v3 = tailspin_kdbg_filter_get_default();
  memcpy(v2, v3, 0x2000uLL);
  *(_QWORD *)a1 &= ~1uLL;
  result = 0.0;
  *(_OWORD *)(a1 + 8204) = 0u;
  *(_OWORD *)(a1 + 8220) = 0u;
  return result;
}

size_t tailspin_sampling_option_set(uint64_t a1, int a2, int a3)
{
  int v3;

  if (a3)
    v3 = *(_DWORD *)(a1 + 8396) | a2;
  else
    v3 = *(_DWORD *)(a1 + 8396) & ~a2;
  *(_DWORD *)(a1 + 8396) = v3;
  *(_QWORD *)a1 |= 0x20uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8400));
}

BOOL tailspin_sampling_option_get(uint64_t a1, int a2)
{
  return (a2 & ~*(_DWORD *)(a1 + 8396)) == 0;
}

BOOL tailspin_sampling_options_is_default(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 8396) & 0x20) == 0;
}

size_t tailspin_sampling_options_clear(uint64_t a1)
{
  *(_DWORD *)(a1 + 8396) = 0;
  *(_QWORD *)a1 |= 0x20uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8400));
}

double tailspin_sampling_options_reset(uint64_t a1)
{
  double result;

  *(_DWORD *)(a1 + 8396) = tailspin_sampling_options_get_default();
  *(_QWORD *)a1 &= ~0x20uLL;
  result = 0.0;
  *(_OWORD *)(a1 + 8400) = 0u;
  *(_OWORD *)(a1 + 8416) = 0u;
  return result;
}

size_t tailspin_oncore_sampling_period_set(uint64_t a1, unint64_t a2)
{
  if (a2 && tailspin_min_oncore_sampling_period_allowed() > a2)
    sub_1C1CC6F30();
  *(_QWORD *)(a1 + 8320) = a2;
  *(_QWORD *)a1 |= 0x10uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8328));
}

uint64_t tailspin_oncore_sampling_period_get(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8320);
}

BOOL tailspin_oncore_sampling_period_is_default(_BYTE *a1)
{
  return (*a1 & 0x10) == 0;
}

double tailspin_oncore_sampling_period_reset(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 8320) = tailspin_oncore_sampling_period_get_default();
  *(_QWORD *)a1 &= ~0x10uLL;
  result = 0.0;
  *(_OWORD *)(a1 + 8328) = 0u;
  *(_OWORD *)(a1 + 8344) = 0u;
  return result;
}

size_t tailspin_full_sampling_period_set(uint64_t a1, unint64_t a2)
{
  if (a2 && tailspin_min_full_sampling_period_allowed() > a2)
    sub_1C1CC6F30();
  *(_QWORD *)(a1 + 8280) = a2;
  *(_QWORD *)a1 |= 8uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8288));
}

uint64_t tailspin_full_sampling_period_get(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8280);
}

BOOL tailspin_full_sampling_period_is_default(_BYTE *a1)
{
  return (*a1 & 8) == 0;
}

double tailspin_full_sampling_period_reset(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 8280) = tailspin_full_sampling_period_get_default();
  *(_QWORD *)a1 &= ~8uLL;
  result = 0.0;
  *(_OWORD *)(a1 + 8288) = 0u;
  *(_OWORD *)(a1 + 8304) = 0u;
  return result;
}

size_t tailspin_enabled_set(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 8360) = a2;
  *(_QWORD *)a1 |= 0x80uLL;
  return sub_1C1CB8BC0((char *)(a1 + 8361));
}

double tailspin_enabled_reset(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 8360) = tailspin_enabled_get_default();
  *(_QWORD *)a1 &= ~0x80uLL;
  result = 0.0;
  *(_OWORD *)(a1 + 8361) = 0u;
  *(_OWORD *)(a1 + 8377) = 0u;
  return result;
}

void tailspin_config_apply(_DWORD *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  a1[2] = 2 * (*(_QWORD *)a1 != 0);
  v6 = a2;
  sub_1C1CB8AA4();
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "tailspin_request_type", 0);
  xpc_dictionary_set_data(v8, "tailspin_config", a1, 0x2118uLL);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1C1CB92D4;
  v10[3] = &unk_1E7B8F298;
  v11 = v5;
  v9 = v5;
  sub_1C1CB9244(v7, v8, v6, v10);

}

void sub_1C1CB9244(_xpc_connection_s *a1, void *a2, NSObject *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD handler[4];
  id v10;

  v7 = a4;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1C1CBAC8C;
  handler[3] = &unk_1E7B8F4C8;
  v10 = v7;
  v8 = v7;
  xpc_connection_send_message_with_reply(a1, a2, a3, handler);

}

uint64_t sub_1C1CB92D4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

BOOL tailspin_config_apply_sync(_DWORD *a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  xpc_object_t v4;
  _BOOL8 v5;

  a1[2] = 2 * (*(_QWORD *)a1 != 0);
  sub_1C1CB8AA4();
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "tailspin_request_type", 0);
  xpc_dictionary_set_data(v3, "tailspin_config", a1, 0x2118uLL);
  v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
  v5 = MEMORY[0x1C3BB4C4C]() == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v4, "tailspin_succeeded");

  return v5;
}

uint64_t tailspin_currently_running()
{
  int owner_kind;
  int state;
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;

  if (!ktrace_config_create_current())
  {
    v2 = *__error();
    sub_1C1CB1954();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1C1CC8624(v3);
    goto LABEL_13;
  }
  owner_kind = ktrace_config_get_owner_kind();
  state = ktrace_config_kdebug_get_state();
  ktrace_config_destroy();
  if (owner_kind != 2)
  {
    v2 = *__error();
    sub_1C1CB1954();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_1C1CC86FC();
    goto LABEL_13;
  }
  v2 = *__error();
  sub_1C1CB1954();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (state != 3)
  {
    if (v4)
      sub_1C1CC86D0();
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  if (v4)
    sub_1C1CC86A4();
  v5 = 1;
LABEL_14:

  *__error() = v2;
  return v5;
}

uint64_t tailspin_dump_output(int a1, void *a2, void *a3)
{
  return tailspin_dump_output_with_options(a1, 0, a2, a3);
}

uint64_t tailspin_dump_output_with_options(int a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  _xpc_connection_s *v10;
  void *v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = a2;
  sub_1C1CB8AA4();
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  sub_1C1CB9634(a1, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    sub_1C1CB9244(v10, v11, v7, v8);

    v12 = 0;
  }
  else
  {
    v12 = 22;
  }

  return v12;
}

BOOL tailspin_dump_output_sync(int a1)
{
  return tailspin_dump_output_with_options_sync(a1, 0);
}

BOOL tailspin_dump_output_with_options_sync(int a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  void *v5;
  xpc_object_t v6;
  _BOOL8 v7;

  v3 = a2;
  sub_1C1CB8AA4();
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  sub_1C1CB9634(a1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
  xpc_dictionary_get_BOOL(v6, "tailspin_succeeded");
  v7 = MEMORY[0x1C3BB4C4C](v6) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v6, "tailspin_succeeded");

  return v7;
}

id sub_1C1CB9634(int a1, void *a2)
{
  id v3;
  xpc_object_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  id v12;

  v3 = a2;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "tailspin_request_type", 2uLL);
  xpc_dictionary_set_fd(v4, "tailspin_dump_fd", a1);
  if (!v3)
    goto LABEL_4;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    v7 = objc_retainAutorelease(v5);
    xpc_dictionary_set_data(v4, "tailspin_dump_options", (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

LABEL_4:
    v8 = v4;
    goto LABEL_8;
  }
  v9 = *__error();
  sub_1C1CB1954();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1C1CC8728(v6, v10);

  *__error() = v9;
  v8 = 0;
LABEL_8:

  return v8;
}

void tailspin_augment_output_with_request_id(int a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  BOOL v25;
  id *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  char v34;
  id v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  int *v41;
  int v42;
  NSObject *v43;
  int v44;
  NSObject *v45;
  int *v46;
  id v47;
  id v48;
  char v49;
  id v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  int v59;
  NSObject *v60;
  int *v61;
  int v62;
  int v63;
  int v64;
  NSObject *v65;
  uint64_t v66;
  int v67;
  double v68;
  int v69;
  NSObject *v70;
  int v71;
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  int v78;
  NSObject *v79;
  double v80;
  uint64_t v81;
  void *v82;
  void *context;
  char v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  uint64_t v88;
  id v89;
  id v90;
  dispatch_queue_t queue;
  _QWORD v92[4];
  id v93;
  NSObject *v94;
  id v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  BOOL v99;
  char v100;
  char v101;
  _QWORD v102[4];
  id v103;
  id v104;
  id v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  char v111;
  char v112;
  id v113;
  _QWORD block[4];
  id v115;
  _QWORD v116[4];
  id v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  _QWORD v123[2];
  int v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(uint64_t, void *);
  void *v128;
  id v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(uint64_t, void *);
  void *v134;
  id v135;
  char v136[16];
  char v137[16];
  id v138[2];
  _BYTE buf[24];
  void *v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  queue = a3;
  v89 = a4;
  v90 = a5;
  v122 = 0;
  v123[0] = &v122;
  v123[1] = 0x2020000000;
  v124 = 0;
  v118 = 0;
  v119 = &v118;
  v120 = 0x2020000000;
  v121 = 1;
  if (a1 == -1)
  {
    _os_assert_log();
    v81 = _os_crash();
    sub_1C1CC7C98(v81);
  }
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_min_timestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v86 = objc_msgSend(v10, "unsignedLongLongValue");
    else
      v86 = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_no_symbolicate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v12 = objc_msgSend(v11, "BOOLValue") ^ 1;
    else
      v12 = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_symbolicate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = objc_msgSend(v13, "BOOLValue");
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_use_dsymforuuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      LOBYTE(v88) = objc_msgSend(v14, "BOOLValue");
    else
      LOBYTE(v88) = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_collect_os_logs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      HIDWORD(v88) = objc_msgSend(v15, "BOOLValue");
    else
      HIDWORD(v88) = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_collect_os_signposts"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v17 = objc_msgSend(v16, "BOOLValue");
    else
      v17 = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_os_log_archive"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v85 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    else
      v85 = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_scrub_output"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v84 = objc_msgSend(v19, "BOOLValue");
    else
      v84 = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_collect_ariadne_plists"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v21 = objc_msgSend(v20, "BOOLValue");
    else
      v21 = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tailspin_dump_option_collect_trials"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v23 = objc_msgSend(v22, "BOOLValue");
    else
      v23 = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cache_symbols"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v87 = objc_msgSend(v24, "BOOLValue");
    else
      v87 = 0;

    v25 = v12 != 0;
    if ((v17 & 1) != 0)
      goto LABEL_54;
  }
  else
  {
    v87 = 0;
    v85 = 0;
    v86 = 0;
    v23 = 0;
    v21 = 0;
    v84 = 0;
    v17 = 0;
    v88 = 0;
    v25 = 0;
  }
  if ((v88 & 0x100000000) == 0 && !v25 && (v21 & 1) == 0 && (v23 & 1) == 0)
  {
    close(a1);
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = sub_1C1CBA714;
    v116[3] = &unk_1E7B8F358;
    v26 = &v117;
    v117 = v90;
    v27 = v116;
    goto LABEL_70;
  }
LABEL_54:
  v28 = ktrace_file_open_fd();
  v29 = v28;
  if (v28)
  {
    if (v21 && !MEMORY[0x1C3BB45F8](v28))
    {
      v44 = *__error();
      sub_1C1CB1954();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = __error();
        sub_1C1CC8A68(v46, (uint64_t)v136, v45);
      }

      *__error() = v44;
      *((_DWORD *)v119 + 6) = 20;
      if (!v23)
        goto LABEL_96;
    }
    else if (!v23)
    {
      goto LABEL_96;
    }
    context = (void *)MEMORY[0x1C3BB47E4]();
    if (!qword_1EF7190D0)
    {
      *(_OWORD *)buf = xmmword_1E7B8F580;
      *(_QWORD *)&buf[16] = 0;
      qword_1EF7190D0 = _sl_dlopen();
    }
    if (!qword_1EF7190D0)
      goto LABEL_71;
    v142 = 0;
    v143 = &v142;
    v144 = 0x2050000000;
    v30 = (void *)qword_1EF7190D8;
    v145 = qword_1EF7190D8;
    if (!qword_1EF7190D8)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1C1CBB12C;
      v140 = &unk_1E7B8F5A0;
      v141 = &v142;
      sub_1C1CBB12C((uint64_t)buf);
      v30 = (void *)v143[3];
    }
    v31 = objc_retainAutorelease(v30);
    _Block_object_dispose(&v142, 8);
    if (objc_opt_class())
    {
      objc_msgSend(v31, "defaultProvider");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v138[0] = 0;
      v131 = MEMORY[0x1E0C809B0];
      v132 = 3221225472;
      v133 = sub_1C1CBAD10;
      v134 = &unk_1E7B8F510;
      v33 = v32;
      v135 = v33;
      v34 = objc_msgSend(v82, "enumerateActiveExperimentsForEnvironment:error:block:", 0, v138, &v131);
      v35 = v138[0];
      v36 = *__error();
      sub_1C1CB1954();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if ((v34 & 1) != 0)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          sub_1C1CC89CC((uint64_t)&v142, objc_msgSend(v33, "count"), v38);
      }
      else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        sub_1C1CC8A04();
      }

      *__error() = v36;
      v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

      v130 = 0;
      v125 = MEMORY[0x1E0C809B0];
      v126 = 3221225472;
      v127 = sub_1C1CBAF70;
      v128 = &unk_1E7B8F560;
      v48 = v47;
      v129 = v48;
      v49 = objc_msgSend(v82, "enumerateActiveRolloutsWithError:block:", &v130, &v125);
      v50 = v130;
      v51 = *__error();
      sub_1C1CB1954();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if ((v49 & 1) != 0)
      {
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          sub_1C1CC8930((uint64_t)v137, objc_msgSend(v48, "count"), v53);
      }
      else if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        sub_1C1CC8968();
      }

      *__error() = v51;
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v33, CFSTR("experiments"));
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v48, CFSTR("rollouts"));
      v55 = (void *)objc_msgSend(v54, "copy");

      objc_autoreleasePoolPop(context);
      if (v55)
      {
        v113 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v55, 200, 0, &v113);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v113;
        if (v56)
        {
          v58 = objc_retainAutorelease(v56);
          objc_msgSend(v58, "bytes");
          objc_msgSend(v58, "length");
          if (ktrace_file_append_chunk())
          {
LABEL_95:

            goto LABEL_96;
          }
          v59 = *__error();
          sub_1C1CB1954();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = __error();
            sub_1C1CC88F0(v61, (uint64_t)v138, v60);
          }
        }
        else
        {
          v59 = *__error();
          sub_1C1CB1954();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            sub_1C1CC888C();
        }

        *__error() = v59;
        *((_DWORD *)v119 + 6) = 24;
        goto LABEL_95;
      }
    }
    else
    {
LABEL_71:
      objc_autoreleasePoolPop(context);
    }
    v42 = *__error();
    sub_1C1CB1954();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      sub_1C1CC8860();

    *__error() = v42;
    *((_DWORD *)v119 + 6) = 24;
LABEL_96:
    if ((v17 | HIDWORD(v88)) != 1)
    {
LABEL_102:
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = sub_1C1CBA858;
      v92[3] = &unk_1E7B8F3D0;
      v99 = v25;
      v93 = v89;
      v98 = v29;
      v100 = v88;
      v101 = v87;
      v94 = queue;
      v96 = &v122;
      v97 = &v118;
      v95 = v90;
      dispatch_async(v94, v92);

      v26 = &v93;
      goto LABEL_103;
    }
    v131 = 0;
    v132 = 0;
    v125 = 0;
    v126 = 0;
    v62 = ktrace_file_earliest_walltime();
    *(_DWORD *)(v123[0] + 24) = v62;
    if (v62 || (v63 = ktrace_file_latest_walltime(), (*(_DWORD *)(v123[0] + 24) = v63) != 0))
    {
      *((_DWORD *)v119 + 6) = 23;
      v64 = *__error();
      sub_1C1CB1954();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        sub_1C1CC87F0((uint64_t)v123, v65, v66);

      *__error() = v64;
      goto LABEL_102;
    }
    if (v86)
    {
      v130 = 0;
      v67 = ktrace_file_earliest_timestamp();
      *(_DWORD *)(v123[0] + 24) = v67;
      v68 = 0.0;
      if (!v67 && (unint64_t)v130 > v86)
      {
        v68 = sub_1C1CBA734((uint64_t)v130 - v86);
        if (v68 > 60.0)
        {
          v69 = *__error();
          sub_1C1CB1954();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v68;
            _os_log_impl(&dword_1C1CAA000, v70, OS_LOG_TYPE_INFO, "Min timestamp %.0fs before start of ktrace data, capping signpost/logs to 60s before", buf, 0xCu);
          }

          *__error() = v69;
          v68 = 60.0;
        }
        v71 = *__error();
        sub_1C1CB1954();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v68;
          _os_log_impl(&dword_1C1CAA000, v72, OS_LOG_TYPE_INFO, "Min timestamp %.0fs before start of ktrace data, including signpost/logs from then", buf, 0xCu);
        }

        *__error() = v71;
      }
    }
    else
    {
      v68 = 0.0;
    }
    v73 = objc_alloc(MEMORY[0x1E0C99D68]);
    v74 = (void *)objc_msgSend(v73, "initWithTimeIntervalSince1970:", (double)v131 - v68);
    v75 = objc_alloc(MEMORY[0x1E0C99D68]);
    v76 = objc_msgSend(v75, "initWithTimeIntervalSince1970:", (double)(v125 + 1));
    v77 = (void *)v76;
    if (v74 && v76 && objc_msgSend(v74, "compare:", v76) == -1)
    {
      objc_msgSend(v77, "timeIntervalSinceDate:", v74);
      if (v80 <= 3600.0)
      {
        v102[0] = MEMORY[0x1E0C809B0];
        v102[1] = 3221225472;
        v102[2] = sub_1C1CBA7C8;
        v102[3] = &unk_1E7B8F380;
        v110 = v17;
        v111 = BYTE4(v88);
        v112 = v84;
        v103 = v89;
        v106 = &v122;
        v108 = v29;
        v109 = v85;
        v104 = v74;
        v105 = v77;
        v107 = &v118;
        dispatch_async(queue, v102);

        goto LABEL_121;
      }
      v78 = *__error();
      sub_1C1CB1954();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v77;
        *(_WORD *)&buf[22] = 2114;
        v140 = v9;
        _os_log_fault_impl(&dword_1C1CAA000, v79, OS_LOG_TYPE_FAULT, "start (%{public}@) + 1h < end (%{public}@). Saved with %{public}@ options", buf, 0x20u);
      }
    }
    else
    {
      v78 = *__error();
      sub_1C1CB1954();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v77;
        *(_WORD *)&buf[22] = 2114;
        v140 = v9;
        _os_log_fault_impl(&dword_1C1CAA000, v79, OS_LOG_TYPE_FAULT, "start (%{public}@) >= end (%{public}@). Saved with %{public}@ options", buf, 0x20u);
      }
    }

    *__error() = v78;
LABEL_121:

    goto LABEL_102;
  }
  v39 = *__error();
  sub_1C1CB1954();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    v41 = __error();
    sub_1C1CC87B0(v41, (uint64_t)buf, v40);
  }

  *__error() = v39;
  close(a1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1C1CBA724;
  block[3] = &unk_1E7B8F358;
  v26 = &v115;
  v115 = v90;
  v27 = block;
LABEL_70:
  dispatch_async(queue, v27);
LABEL_103:

  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v122, 8);

}

void sub_1C1CBA650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CBA714(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1C1CBA724(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

double sub_1C1CBA734(uint64_t a1)
{
  BOOL v2;

  if (qword_1EF7190C0 != -1)
    dispatch_once(&qword_1EF7190C0, &unk_1E7B8F4E8);
  if ((_DWORD)qword_1EF7190C8)
    v2 = HIDWORD(qword_1EF7190C8) == 0;
  else
    v2 = 1;
  if (v2)
  {
    a1 = 0;
  }
  else if ((_DWORD)qword_1EF7190C8 != HIDWORD(qword_1EF7190C8))
  {
    a1 = __udivti3();
  }
  return (double)(unint64_t)a1 / 1000000000.0;
}

uint64_t sub_1C1CBA7C8(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "startRecordingTimeForAugmentLoggingPhase:collectOSLog:scrubData:", *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(a1 + 89), *(unsigned __int8 *)(a1 + 90));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = tailspin_write_os_signpost_support_chunks(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(a1 + 89), *(unsigned __int8 *)(a1 + 90));
  result = objc_msgSend(*(id *)(a1 + 32), "stopRecordingTimeForAugmentLoggingPhase:", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 22;
  return result;
}

void sub_1C1CBA858(uint64_t a1)
{
  uint64_t v2;
  char v3;
  char v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "startRecordingTimeForAugmentSymbolicatePhase");
    v2 = *(_QWORD *)(a1 + 72);
    v3 = *(_BYTE *)(a1 + 81);
    v4 = *(_BYTE *)(a1 + 82);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1C1CBA954;
    v6[3] = &unk_1E7B8F3A8;
    v9 = *(_OWORD *)(a1 + 56);
    v10 = v2;
    v5 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    tailspin_symbolicate_file_async(v2, v3, v4, v5, v6);

  }
  else
  {
    ktrace_file_close();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t sub_1C1CBA954(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (a2 <= 0x25 && ((1 << a2) & 0x2000000011) != 0)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_DWORD *)(v3 + 24))
  {
    *(_DWORD *)(v3 + 24) = a2;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v4 = 21;
    else
      v4 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  }
  ktrace_file_close();
  objc_msgSend(*(id *)(a1 + 32), "stopRecordingTimeForAugmentSymbolicatePhase");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void tailspin_augment_output(int a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1C1CBAA8C;
  v9[3] = &unk_1E7B8F3F8;
  v10 = v7;
  v8 = v7;
  tailspin_augment_output_with_request_id(a1, a2, a3, 0, v9);

}

uint64_t sub_1C1CBAA8C(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);
}

void tailspin_poke()
{
  xpc_object_t v0;
  _xpc_connection_s *connection;

  sub_1C1CB8AA4();
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "tailspin_request_type", 0xDEADCAFFuLL);
  xpc_connection_send_message(connection, v0);

}

void tailspin_resolve_configs()
{
  xpc_object_t v0;
  _xpc_connection_s *connection;

  sub_1C1CB8AA4();
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "tailspin_request_type", 0xDEADCB00uLL);
  xpc_connection_send_message(connection, v0);

}

void sub_1C1CBAB70()
{
  xpc_connection_t mach_service;
  void *v1;
  int v2;
  NSObject *v3;

  mach_service = xpc_connection_create_mach_service("com.apple.tailspind", 0, 2uLL);
  v1 = (void *)qword_1ED0C68A8;
  qword_1ED0C68A8 = (uint64_t)mach_service;

  if (qword_1ED0C68A8)
  {
    xpc_connection_set_event_handler((xpc_connection_t)qword_1ED0C68A8, &unk_1E7B8F480);
    xpc_connection_resume((xpc_connection_t)qword_1ED0C68A8);
  }
  else
  {
    v2 = *__error();
    sub_1C1CB1954();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1C1CC8AA8();

    *__error() = v2;
  }
}

uint64_t sub_1C1CBAC0C()
{
  uint64_t v0;
  int responsible_pid_and_name;
  char v3[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = getpid();
  responsible_pid_and_name = get_responsible_pid_and_name(v0, v3, 0x20u);
  return snprintf(byte_1EF718C38, 0x20uLL, "%s [%d]", v3, responsible_pid_and_name);
}

void sub_1C1CBAC8C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x1C3BB4C4C]();
  v4 = *(_QWORD *)(a1 + 32);
  if (v3 == MEMORY[0x1E0C812F8])
  {
    if (v4)
    {
      v5 = xpc_dictionary_get_BOOL(xdict, "tailspin_succeeded");
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    v5 = 0;
LABEL_6:
    (*(void (**)(uint64_t, _BOOL8))(v4 + 16))(v4, v5);
  }

}

uint64_t sub_1C1CBAD04()
{
  return mach_timebase_info((mach_timebase_info_t)&qword_1EF7190C8);
}

void sub_1C1CBAD10(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("experiment_id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "deploymentId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deployment_id"));

  objc_msgSend(v2, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("treatment_id"));

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v2, "namespaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "compatibilityVersion"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v18 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("namespace_ids"));

  v19 = *(void **)(a1 + 32);
  v20 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v19, "addObject:", v20);

}

void sub_1C1CBAF70(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v16 = objc_alloc_init(v3);
  objc_msgSend(v4, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, CFSTR("rollout_id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "deploymentId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, CFSTR("deployment_id"));

  objc_msgSend(v4, "rampId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, CFSTR("ramp_id"));

  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "factorPackIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1C1CBB120;
  v17[3] = &unk_1E7B8F538;
  v18 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);

  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("factor_pack_ids"));

  v14 = *(void **)(a1 + 32);
  v15 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v14, "addObject:", v15);

}

uint64_t sub_1C1CBB120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

Class sub_1C1CBB12C(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!qword_1EF7190D0)
  {
    v4 = xmmword_1E7B8F580;
    v5 = 0;
    qword_1EF7190D0 = _sl_dlopen();
  }
  if (!qword_1EF7190D0)
    sub_1C1CC8AD4(&v3);
  result = objc_getClass("TRIAllocationStatus");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_1C1CC8B50();
  qword_1EF7190D8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C1CBB208(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

double sub_1C1CBB218(unint64_t a1)
{
  if (qword_1EF7190E8 != -1)
    dispatch_once(&qword_1EF7190E8, &unk_1E7B8EAD0);
  return *(double *)&qword_1EF7190E0 * (double)a1 * 0.000000001;
}

double sub_1C1CBB278()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1;
  qword_1EF7190E0 = *(_QWORD *)&result;
  return result;
}

void add_binary_info_to_binary_dictionary(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a1;
  v3 = a2;
  if (v21 && v3)
  {
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleShortVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "binaryVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "segmentWithName:", CFSTR("__TEXT_EXEC"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "length");
    }
    else
    {
      objc_msgSend(v3, "segmentWithName:", CFSTR("__TEXT"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
        v12 = v3;
      v11 = objc_msgSend(v12, "length");

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      sub_1C1CC7B3C();
    v15 = (void *)v14;
    objc_msgSend(v4, "UUIDString");
    v18 = v4;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("UUID_String"));

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("Size"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10 != 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("TEXT_EXEC"));

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("Name"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("Path"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v5, CFSTR("BundleID"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v6, CFSTR("BundleVersion"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v7, CFSTR("BundleShortVersion"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v8, CFSTR("BinaryVersion"));

  }
}

id tailspin_symbolicator_copy_symbol_data_using_uuid_pid_path(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, void *a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v14 = a1;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3);
  if (a5)
  {
    v16 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:", v17);
    a5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a8);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a8; --a8)
  {
    v19 = *a7++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v20);

  }
  v27[0] = *MEMORY[0x1E0DB23B0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v27[1] = *MEMORY[0x1E0DB23C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = *MEMORY[0x1E0DB23B8];
  v28[1] = v22;
  v28[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "symbolicateUUID:pid:path:offsets:options:", v15, a4, a5, i, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t sub_1C1CBC57C()
{
  uint64_t v0;

  v0 = operator new();
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_DWORD *)(v0 + 72) = 1065353216;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_DWORD *)(v0 + 112) = 1065353216;
  *(_OWORD *)(v0 + 120) = 0u;
  *(_OWORD *)(v0 + 136) = 0u;
  *(_DWORD *)(v0 + 152) = 1065353216;
  *(_OWORD *)(v0 + 160) = 0u;
  *(_OWORD *)(v0 + 176) = 0u;
  *(_DWORD *)(v0 + 192) = 1065353216;
  *(_OWORD *)(v0 + 200) = 0u;
  *(_DWORD *)(v0 + 232) = 1065353216;
  *(_OWORD *)(v0 + 216) = 0u;
  uuid_clear((unsigned __int8 *)(v0 + 240));
  *(_QWORD *)(v0 + 256) = 0;
  *(_BYTE *)(v0 + 264) = 0;
  return v0;
}

void sub_1C1CBC63C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  sub_1C1CBFBC4(v6);
  sub_1C1CBFC0C(v5);
  sub_1C1CBFCB0(v4);
  sub_1C1CBFD34(v3);
  sub_1C1CBFDFC(v2);
  v8 = sub_1C1CBFBC4(v1);
  MEMORY[0x1C3BB4214](v8, 0x10A0C4049D157F1);
  _Unwind_Resume(a1);
}

void sub_1C1CBC68C(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 256))
    {
      MEMORY[0x1C3BB4520]();
      *(_QWORD *)(a1 + 256) = 0;
    }
    sub_1C1CBFBC4(a1 + 200);
    sub_1C1CBFC0C(a1 + 160);
    sub_1C1CBFCB0(a1 + 120);
    sub_1C1CBFD34(a1 + 80);
    sub_1C1CBFDFC(a1 + 40);
    sub_1C1CBFBC4(a1);
    JUMPOUT(0x1C3BB4214);
  }
  sub_1C1CC6F30();
}

uint64_t sub_1C1CBC700(uint64_t result)
{
  if (!result)
    sub_1C1CC6F30();
  *(_BYTE *)(result + 264) = 1;
  return result;
}

void sub_1C1CBC720(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  int v6;
  NSObject *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  int v32;
  _QWORD *v33;
  uint64_t v34;
  unsigned int v35;
  __int128 v36;
  const unsigned __int8 *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  int v61;
  uint64_t *v62;
  char *v63;
  size_t v64;
  BOOL v65;
  const unsigned __int8 *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  __int128 v71;
  const unsigned __int8 *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint8_t *v87;
  uuid_t dst;
  uint8_t buf[16];
  _QWORD v90[5];
  int v91;
  uint64_t v92;
  int v93;
  BOOL v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  if (!a1)
    sub_1C1CC6F30();
  v3 = a2;
  if (!a2)
    sub_1C1CC6F30();
  if (a3 <= 0xF)
    sub_1C1CC6F30();
  if (*(_BYTE *)(a1 + 264))
  {
    v6 = *__error();
    sub_1C1CB1954();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1CAA000, v7, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_kcdata_stackshot] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v6;
    return;
  }
  *(_DWORD *)buf = 0;
  v84 = (_QWORD *)(a1 + 80);
  v8 = sub_1C1CC2F98((_QWORD *)(a1 + 80), (int *)buf);
  if (v8)
  {
    v83 = (uint64_t)(v8 + 3);
  }
  else
  {
    *(_DWORD *)dst = 0;
    *(_QWORD *)buf = dst;
    v9 = sub_1C1CC304C((uint64_t)v84, (int *)dst, (uint64_t)&unk_1C1CC9C01, (_DWORD **)buf);
    *((_DWORD *)v9 + 12) = 0;
    v83 = (uint64_t)(v9 + 3);
    MEMORY[0x1C3BB41E4](v9 + 3, "kernel_task");
  }
  v10 = v3 + a3;
  v11 = v3 + 16;
  if (v3 + 16 <= v3 + a3)
  {
    v12 = 0;
    v85 = 0;
    v86 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v82 = (_QWORD *)(a1 + 120);
    do
    {
      v17 = *(unsigned int *)(v3 + 4);
      v18 = v11 + v17;
      if (v11 + v17 > v10)
        return;
      v19 = *(_DWORD *)v3;
      if (*(_DWORD *)v3 == -242132755)
        return;
      if ((v19 & 0xFFFFFFF0) == 0x20)
        v20 = 17;
      else
        v20 = *(_DWORD *)v3;
      if ((v20 - 1) >= 6)
        v21 = v3 + 16;
      else
        v21 = v3 + 48;
      if (v12)
      {
        v12 = v20 != 20 || v86 != *(_QWORD *)(v3 + 8);
        goto LABEL_170;
      }
      v12 = 0;
      if (v20 > 19)
      {
        if (v20 == 20)
        {
          v25 = *(_QWORD *)(v3 + 8);
          v26 = v13 & (v25 == v14);
          v27 = v85;
          v28 = v16 & (v25 == v85);
          if (v28)
            v29 = 0;
          else
            v29 = v85;
          v30 = v16 ^ v28;
          if ((v26 & 1) == 0)
            v27 = v29;
          v85 = v27;
          if ((v26 & 1) != 0)
            v24 = v16;
          else
            v24 = v30;
          if ((v26 & 1) != 0)
          {
            v15 = 0;
            v14 = 0;
            v13 = 0;
          }
          v12 = 0;
          goto LABEL_171;
        }
        if (v20 == 2310)
        {
          if (((v21 != 0) & v13) == 1 && v15 != 0)
          {
            sub_1C1CC37EC(v15 + 72, (unint64_t *)v21, (_QWORD *)v21);
            v32 = *(_DWORD *)(v15 + 24);
            *(_QWORD *)buf = v21;
            v33 = sub_1C1CC3A04(a1, (unint64_t *)v21, (uint64_t)&unk_1C1CC9C01, (_QWORD **)buf);
            v12 = 0;
            *((_DWORD *)v33 + 6) = v32;
            goto LABEL_56;
          }
LABEL_169:
          v12 = 0;
          goto LABEL_170;
        }
        if (v20 != 2312)
        {
LABEL_170:
          v24 = v16;
          goto LABEL_171;
        }
        if ((v13 & 1) != 0)
        {
          v12 = 0;
LABEL_56:
          v13 = 1;
          goto LABEL_170;
        }
        if (!uuid_is_null((const unsigned __int8 *)(v21 + 8)))
        {
          uuid_copy(dst, (const unsigned __int8 *)(v21 + 8));
          v36 = *(_OWORD *)dst;
          *(_OWORD *)(a1 + 240) = *(_OWORD *)dst;
          *(_OWORD *)buf = v36;
          v37 = sub_1C1CC2CE0(v82, buf);
          if (!v37)
          {
            *(_OWORD *)buf = *(_OWORD *)dst;
            v87 = buf;
            v37 = sub_1C1CC33F4((uint64_t)v82, buf, (uint64_t)&unk_1C1CC9C01, (_OWORD **)&v87);
          }
          v13 = 0;
          v12 = 0;
          *(_OWORD *)(v37 + 56) = *(_OWORD *)dst;
          *((_QWORD *)v37 + 9) = *(_QWORD *)v21;
          goto LABEL_170;
        }
LABEL_145:
        v13 = 0;
        goto LABEL_169;
      }
      if (v20 == 17)
      {
        if (v19 != 17 && (v19 & 0xFFFFFFF0) != 0x20)
          return;
        v34 = *(_QWORD *)(v3 + 8);
        if ((_DWORD)v34)
        {
          if (v19 == 17)
          {
            if (SHIDWORD(v34) <= 2310)
            {
              switch(HIDWORD(v34))
              {
                case 0x30:
                  v35 = 20;
                  break;
                case 0x31:
                  v35 = 24;
                  break;
                case 0x81A:
LABEL_151:
                  v35 = 8;
                  break;
                default:
                  return;
              }
            }
            else
            {
              switch(HIDWORD(v34))
              {
                case 0x907:
                  v35 = 4;
                  break;
                case 0x908:
                case 0x909:
                  return;
                case 0x90A:
                case 0x90C:
                  goto LABEL_151;
                case 0x90B:
                case 0x90D:
                  v35 = 16;
                  break;
                default:
                  if (HIDWORD(v34) != 2369)
                    return;
                  v35 = 48;
                  break;
              }
            }
            if (v17 / v35 < v34 || v17 % v34 >= 0x10)
              return;
          }
          else
          {
            v40 = v17 - (*(_DWORD *)v3 & 0xF);
            if (v17 < (*(_DWORD *)v3 & 0xFu) || v40 < v34 || v40 % v34)
              return;
          }
        }
        else if ((_DWORD)v17)
        {
          return;
        }
        switch(HIDWORD(v34))
        {
          case 0x913:
            if ((v16 & (v15 != 0)) != 1)
              goto LABEL_169;
            sub_1C1CBD438((_QWORD *)v21, v34, v83);
            break;
          case 0x914:
            if ((v16 & (v15 != 0)) != 1)
              goto LABEL_169;
            sub_1C1CBD51C((unint64_t *)v21, v34, 1, v83);
            break;
          case 0x915:
            if ((v16 & (v15 != 0)) != 1)
              goto LABEL_169;
            sub_1C1CBD438((_QWORD *)v21, v34, v15);
            break;
          case 0x916:
            if ((v16 & (v15 != 0)) != 1)
              goto LABEL_169;
            sub_1C1CBD51C((unint64_t *)v21, v34, 1, v15);
            break;
          default:
            goto LABEL_169;
        }
        v12 = 0;
        v24 = 1;
      }
      else
      {
        if (v20 != 19)
          goto LABEL_170;
        if (v19 != 19 || v17 < 4)
          return;
        v22 = *(_DWORD *)(v3 + 16);
        v23 = *(_QWORD *)(v3 + 8);
        if (v22 == 2308)
        {
          if ((v13 & 1) != 0)
          {
            if ((v16 & 1) != 0)
              v38 = v85;
            else
              v38 = *(_QWORD *)(v3 + 8);
            v39 = v86;
            if ((v16 & 1) != 0)
              v39 = *(_QWORD *)(v3 + 8);
            v85 = v38;
            v86 = v39;
            v24 = 1;
            v13 = 1;
            v12 = v16;
            goto LABEL_171;
          }
          v13 = 0;
LABEL_147:
          v12 = 1;
          v24 = v16;
          v86 = *(_QWORD *)(v3 + 8);
          goto LABEL_171;
        }
        if (v22 != 2307)
          goto LABEL_147;
        if ((v13 & 1) == 0)
        {
          v41 = v18 + 16;
          if (v18 + 16 > v10)
          {
LABEL_144:
            v15 = 0;
            v14 = 0;
            goto LABEL_145;
          }
          v42 = 0;
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v48 = 0;
          v49 = 0;
          while (2)
          {
            v50 = *(unsigned int *)(v18 + 4);
            v51 = v41 + v50;
            if (v41 + v50 > v10)
              goto LABEL_144;
            v52 = *(_DWORD *)v18;
            if (*(_DWORD *)v18 == -242132755)
              goto LABEL_144;
            if ((v52 & 0xFFFFFFF0) == 0x20)
              v53 = 17;
            else
              v53 = *(_DWORD *)v18;
            if ((v53 - 1) >= 6)
              v54 = v18 + 16;
            else
              v54 = v18 + 48;
            if (v48)
            {
              if (v53 == 20)
              {
                v48 = *(_QWORD *)(v18 + 8) != v49;
                goto LABEL_143;
              }
LABEL_100:
              v48 = 1;
            }
            else
            {
              v48 = 0;
              if (v53 <= 2308)
              {
                if (v53 == 17)
                {
                  if (v52 != 17 && (v52 & 0xFFFFFFF0) != 0x20)
                    goto LABEL_144;
                  v55 = *(_QWORD *)(v18 + 8);
                  if ((_DWORD)v55)
                  {
                    if (v52 == 17)
                    {
                      v13 = 0;
                      v15 = 0;
                      if (SHIDWORD(v55) <= 2310)
                      {
                        switch(HIDWORD(v55))
                        {
                          case 0x30:
                            v56 = 20;
                            break;
                          case 0x31:
                            v56 = 24;
                            break;
                          case 0x81A:
LABEL_125:
                            v56 = 8;
                            break;
                          default:
                            goto LABEL_195;
                        }
                      }
                      else
                      {
                        v24 = v16;
                        v14 = 0;
                        v12 = 0;
                        switch(HIDWORD(v55))
                        {
                          case 0x907:
                            v56 = 4;
                            break;
                          case 0x908:
                          case 0x909:
                            goto LABEL_171;
                          case 0x90A:
                          case 0x90C:
                            goto LABEL_125;
                          case 0x90B:
                          case 0x90D:
                            v56 = 16;
                            break;
                          default:
                            if (HIDWORD(v55) != 2369)
                              goto LABEL_195;
                            v56 = 48;
                            break;
                        }
                      }
                      if (v50 / v56 < v55 || v50 % v55 >= 0x10)
                        goto LABEL_144;
                    }
                    else
                    {
                      v57 = v50 - (*(_DWORD *)v18 & 0xF);
                      if (v50 < (*(_DWORD *)v18 & 0xFu)
                        || v57 < v55
                        || v57 % v55)
                      {
                        goto LABEL_144;
                      }
                    }
                  }
                  else if ((_DWORD)v50)
                  {
                    goto LABEL_144;
                  }
                  if (HIDWORD(v55) == 48)
                    v58 = v54;
                  else
                    v58 = v45;
                  if (HIDWORD(v55) == 48)
                    v59 = v55;
                  else
                    v59 = v46;
                  if (HIDWORD(v55) == 49)
                  {
                    v43 = v54;
                    v44 = v55;
                  }
                  else
                  {
                    v45 = v58;
                    v46 = v59;
                  }
                  v48 = 0;
                  goto LABEL_143;
                }
                if (v53 != 19)
                {
                  if (v53 == 20)
                  {
                    v73 = v47;
                    v13 = 0;
                    v15 = 0;
                    if (*(_QWORD *)(v18 + 8) != v23 || (v77 = v46, v75 = v45, LODWORD(v81) = v44, v79 = v43, !v42))
                    {
LABEL_195:
                      v24 = v16;
                      v14 = 0;
                      v12 = 0;
                      goto LABEL_171;
                    }
                    v60 = v42;
                    v61 = *(_DWORD *)(v42 + 84);
                    *(_DWORD *)buf = v61;
                    v62 = sub_1C1CC2F98(v84, (int *)buf);
                    if (!v62)
                    {
                      *(_DWORD *)dst = v61;
                      *(_QWORD *)buf = dst;
                      v62 = sub_1C1CC304C((uint64_t)v84, (int *)dst, (uint64_t)&unk_1C1CC9C01, (_DWORD **)buf);
                    }
                    *((_DWORD *)v62 + 12) = v61;
                    v63 = (char *)(v60 + 88);
                    v64 = strnlen(v63, 0x20uLL);
                    sub_1C1CC2E68(buf, v63, v64);
                    v15 = (uint64_t)(v62 + 3);
                    if (*((char *)v62 + 47) < 0)
                      operator delete(*(void **)v15);
                    *(_OWORD *)v15 = *(_OWORD *)buf;
                    v62[5] = v90[0];
                    v65 = (_DWORD)v81 == 1 && v61 == 0;
                    if (v65 || !(_DWORD)v81)
                    {
                      if (v77)
                        sub_1C1CBD214(a1, v77, v75, (uint64_t)(v62 + 3));
                    }
                    else
                    {
                      if (!v79)
                        sub_1C1CC6F30();
                      v74 = v62 + 9;
                      v76 = (uint64_t)(v62 + 11);
                      v66 = (const unsigned __int8 *)(v79 + 8);
                      v80 = v62;
                      v81 = v81;
                      do
                      {
                        uuid_clear(buf);
                        memset(v90, 0, sizeof(v90));
                        v91 = 1065353216;
                        v92 = 0;
                        v93 = -1;
                        v94 = 0;
                        v95 = 0u;
                        v96 = 0u;
                        v67 = *((_QWORD *)v66 - 1);
                        uuid_copy(dst, v66);
                        if (v67)
                        {
                          v93 = *((_DWORD *)v80 + 12);
                          *(_OWORD *)buf = *(_OWORD *)dst;
                          v90[0] = v67;
                          v94 = sub_1C1CC2CE0((_QWORD *)(a1 + 200), buf) != 0;
                          v68 = v80[10];
                          if (v68 >= v80[11])
                          {
                            v70 = sub_1C1CC3CD8(v74, (__int128 *)buf);
                            v69 = v80;
                          }
                          else
                          {
                            v69 = v80;
                            v78 = v80[10];
                            sub_1C1CC3DFC(v76, v68, (__int128 *)buf);
                            v70 = v78 + 112;
                            v80[10] = v78 + 112;
                          }
                          v69[10] = v70;
                        }
                        if (SHIBYTE(v96) < 0)
                          operator delete(*((void **)&v95 + 1));
                        sub_1C1CBFBC4((uint64_t)&v90[1]);
                        v66 += 24;
                        v62 = v80;
                        --v81;
                      }
                      while (v81);
                    }
                    v12 = v73;
                    if (v73)
                    {
                      uuid_copy(dst, (const unsigned __int8 *)(v73 + 8));
                      v71 = *(_OWORD *)dst;
                      *(_OWORD *)((char *)v62 + 52) = *(_OWORD *)dst;
                      *(_OWORD *)buf = v71;
                      if (!sub_1C1CC2CE0(v82, buf))
                      {
                        v72 = sub_1C1CBD3CC((uint64_t)v82, *(uint64_t *)dst, *(uint64_t *)&dst[8]);
                        *(_OWORD *)(v72 + 24) = *(_OWORD *)dst;
                        *((_QWORD *)v72 + 5) = *(_QWORD *)v73;
                      }
                      v12 = 0;
                    }
                    v13 = 1;
                    v24 = v16;
                    v14 = v23;
                    goto LABEL_171;
                  }
                  goto LABEL_143;
                }
                if (v50 < 4 || v52 != 19)
                  goto LABEL_144;
                v49 = *(_QWORD *)(v18 + 8);
                goto LABEL_100;
              }
              switch(v53)
              {
                case 2309:
                  v48 = 0;
                  v42 = v54;
                  break;
                case 2312:
                  v48 = 0;
                  v47 = v54;
                  break;
                case 2368:
                  sub_1C1CC8BF0();
              }
            }
LABEL_143:
            v41 = v51 + 16;
            v18 = v51;
            if (v51 + 16 > v10)
              goto LABEL_144;
            continue;
          }
        }
        v13 = 1;
        v24 = v16;
        v86 = *(_QWORD *)(v3 + 8);
        v12 = 1;
      }
LABEL_171:
      v3 = v11 + *(unsigned int *)(v3 + 4);
      v11 = v3 + 16;
      v16 = v24;
    }
    while (v3 + 16 <= v10);
  }
}

void sub_1C1CBD1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  *(_QWORD *)(v31 + 80) = a13;
  sub_1C1CBDAF8((uint64_t)&a31);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CBD214(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  const unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uuid_t dst;
  uuid_t uu;
  _QWORD v15[5];
  int v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a4)
    sub_1C1CC6F30();
  if (!result)
    sub_1C1CC6F30();
  if (!a3)
    sub_1C1CC6F30();
  if (a2)
  {
    v5 = (_QWORD *)(result + 200);
    v11 = (uint64_t *)(a4 + 48);
    v12 = a4 + 64;
    v6 = (const unsigned __int8 *)(a3 + 4);
    v7 = a2;
    do
    {
      uuid_clear(uu);
      memset(v15, 0, sizeof(v15));
      v16 = 1065353216;
      v17 = 0;
      v18 = -1;
      v19 = 0;
      v20 = 0u;
      v21 = 0u;
      v8 = *((unsigned int *)v6 - 1);
      uuid_copy(dst, v6);
      if ((_DWORD)v8)
      {
        v18 = *(_DWORD *)(a4 + 24);
        *(_OWORD *)uu = *(_OWORD *)dst;
        v15[0] = v8;
        v19 = sub_1C1CC2CE0(v5, uu) != 0;
        v9 = *(_QWORD *)(a4 + 56);
        if (v9 >= *(_QWORD *)(a4 + 64))
        {
          v10 = sub_1C1CC3CD8(v11, (__int128 *)uu);
        }
        else
        {
          sub_1C1CC3DFC(v12, *(_QWORD *)(a4 + 56), (__int128 *)uu);
          v10 = v9 + 112;
          *(_QWORD *)(a4 + 56) = v9 + 112;
        }
        *(_QWORD *)(a4 + 56) = v10;
      }
      if (SHIBYTE(v21) < 0)
        operator delete(*((void **)&v20 + 1));
      v6 += 20;
      result = sub_1C1CBFBC4((uint64_t)&v15[1]);
      --v7;
    }
    while (v7);
  }
  return result;
}

void sub_1C1CBD3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  uint64_t v6;
  va_list va;

  va_start(va, a5);
  *(_QWORD *)(v5 + 56) = v6;
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

const unsigned __int8 *sub_1C1CBD3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a2;
  v5[1] = a3;
  v4 = v5;
  return sub_1C1CC33F4(a1, (const unsigned __int8 *)v5, (uint64_t)&unk_1C1CC9C01, &v4) + 32;
}

_QWORD *sub_1C1CBD438(_QWORD *result, unsigned int a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t *v12;

  v5 = result;
  v11 = *(unsigned int *)result;
  if (v11 > 0x1000)
  {
    v12 = &v11;
    result = sub_1C1CBFF98(a3 + 112, &v11, (uint64_t)&unk_1C1CC9C01, &v12);
    ++result[3];
  }
  if (a2 >= 2)
  {
    v6 = a3 + 112;
    v7 = a2;
    v8 = (int *)v5 + 1;
    v9 = v7 - 1;
    do
    {
      v10 = *v8++;
      v11 = (v10 - 1);
      if (v11 > 0x1000)
      {
        v12 = &v11;
        result = sub_1C1CBFF98(v6, &v11, (uint64_t)&unk_1C1CC9C01, &v12);
        ++result[3];
      }
      --v9;
    }
    while (v9);
  }
  return result;
}

unint64_t *sub_1C1CBD51C(unint64_t *result, unsigned int a2, int a3, uint64_t a4)
{
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t *v15;

  v6 = result;
  v7 = *result;
  v14 = *result;
  if (a3)
    v8 = 0x100000000;
  else
    v8 = 4096;
  if (v8 < v7)
  {
    v15 = &v14;
    result = sub_1C1CBFF98(a4 + 112, &v14, (uint64_t)&unk_1C1CC9C01, &v15);
    ++result[3];
  }
  if (a2 >= 2)
  {
    v9 = a4 + 112;
    v10 = a2;
    v11 = (uint64_t *)(v6 + 1);
    v12 = v10 - 1;
    do
    {
      v13 = *v11++;
      v14 = v13 - 1;
      if (v8 < v13 - 1)
      {
        v15 = &v14;
        result = sub_1C1CBFF98(v9, &v14, (uint64_t)&unk_1C1CC9C01, &v15);
        ++result[3];
      }
      --v12;
    }
    while (v12);
  }
  return result;
}

void sub_1C1CBD610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  __int128 v9;
  _QWORD *v10;
  const unsigned __int8 *v11;
  uint64_t v12;
  char *v13;
  uuid_t dst;
  uuid_string_t out;
  unsigned __int8 uu[8];
  uint64_t v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  __n128 (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  const char *v23;
  _QWORD v24[3];
  unsigned __int8 v25[16];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    sub_1C1CC6F30();
  if (a2 && a3)
  {
    if (*(_BYTE *)(a1 + 264))
    {
      v4 = *__error();
      sub_1C1CB1954();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1CAA000, v5, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_dscsym_data] Shortcircuit due to signal received", buf, 2u);
      }

      *__error() = v4;
    }
    else
    {
      *(_QWORD *)buf = 0;
      v19 = buf;
      v20 = 0x7012000000;
      v21 = sub_1C1CBD8E8;
      v22 = sub_1C1CBD924;
      v23 = "";
      memset(v24, 0, sizeof(v24));
      uuid_clear(v25);
      v26 = 0;
      v27 = 0;
      v28 = 0;
      *(_QWORD *)uu = 0;
      v17 = 0;
      v6 = dscsym_iterate_buffer();
      if (v6)
      {
        memset(out, 0, sizeof(out));
        uuid_unparse(uu, out);
        v7 = *__error();
        sub_1C1CB1954();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_1C1CC8C08((uint64_t)out, v6, v8);

        *__error() = v7;
      }
      else
      {
        uuid_copy(dst, uu);
        v9 = *(_OWORD *)dst;
        *(_OWORD *)(v19 + 72) = *(_OWORD *)dst;
        v10 = (_QWORD *)(a1 + 120);
        *(_OWORD *)out = v9;
        v11 = sub_1C1CC2CE0(v10, (const unsigned __int8 *)out);
        if (!v11)
        {
          *(_OWORD *)out = *(_OWORD *)dst;
          v13 = out;
          v11 = sub_1C1CC33F4((uint64_t)v10, (const unsigned __int8 *)out, (uint64_t)&unk_1C1CC9C01, (_OWORD **)&v13);
        }
        v12 = (uint64_t)(v11 + 32);
        if ((uint8_t *)v12 != v19 + 48)
          sub_1C1CC423C(v12, *((__int128 **)v19 + 6), *((__int128 **)v19 + 7), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)v19 + 7) - *((_QWORD *)v19 + 6)) >> 4));
      }
      _Block_object_dispose(buf, 8);
      *(_QWORD *)out = v24;
      sub_1C1CC3C24((void ***)out);
    }
  }
}

void sub_1C1CBD898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void **a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  sub_1C1CC3C24(&a25);
  _Unwind_Resume(a1);
}

__n128 sub_1C1CBD8E8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  result = *(__n128 *)(a2 + 72);
  v3 = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v3;
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void sub_1C1CBD924(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  sub_1C1CC3C24(&v1);
}

uint64_t sub_1C1CBD94C(uint64_t a1, const unsigned __int8 *a2, char *a3, char *__s1, uint64_t a5, void *a6)
{
  size_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  __int128 __dst;
  void *v17;
  uuid_t dst;
  uuid_t uu;
  _OWORD v20[2];
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  char v25;
  void *__p[6];

  __p[5] = *(void **)MEMORY[0x1E0C80C00];
  if (!strcmp(__s1, "__TEXT"))
  {
    uuid_clear(uu);
    v21 = 0;
    memset(v20, 0, sizeof(v20));
    v22 = 1065353216;
    v23 = 0;
    v24 = -1;
    v25 = 0;
    memset(__p, 0, 32);
    uuid_copy(dst, a2);
    *(_OWORD *)uu = *(_OWORD *)dst;
    *(_QWORD *)&v20[0] = a5;
    v25 = 0;
    if (a3)
    {
      v11 = strlen(a3);
      sub_1C1CC2E68(&__dst, a3, v11);
      if (SHIBYTE(__p[3]) < 0)
        operator delete(__p[1]);
      *(_OWORD *)&__p[1] = __dst;
      __p[3] = v17;
    }
    if (a6)
      __p[0] = a6;
    v12 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 8);
    v13 = v12[7];
    if (v13 >= v12[8])
    {
      v14 = sub_1C1CC3CD8(v12 + 6, (__int128 *)uu);
    }
    else
    {
      sub_1C1CC3DFC((uint64_t)(v12 + 8), v12[7], (__int128 *)uu);
      v14 = v13 + 112;
      v12[7] = v13 + 112;
    }
    v12[7] = v14;
    if (SHIBYTE(__p[3]) < 0)
      operator delete(__p[1]);
    sub_1C1CBFBC4((uint64_t)v20 + 8);
  }
  return 0;
}

void sub_1C1CBDACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v8;
  va_list va;

  va_start(va, a7);
  *(_QWORD *)(v8 + 56) = v7;
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CBDAF8(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  sub_1C1CBFBC4(a1 + 24);
  return a1;
}

void sub_1C1CBDB30(uint64_t a1, _OWORD *a2, unint64_t a3, int a4)
{
  _OWORD *v4;
  int v6;
  NSObject *v7;
  unint64_t v8;
  int v9;
  _QWORD *v10;
  uint64_t *v11;
  size_t v12;
  void **v13;
  unint64_t v14;
  __int128 v15;
  int v16;
  _QWORD *v17;
  uint64_t *v18;
  size_t v19;
  void **v20;
  __int128 v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _BYTE buf[32];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    sub_1C1CC6F30();
  v4 = a2;
  if (!a2)
    sub_1C1CC6F30();
  if (!a3)
    sub_1C1CC6F30();
  if (*(_BYTE *)(a1 + 264))
  {
    v6 = *__error();
    sub_1C1CB1954();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1CAA000, v7, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_threadmap_data] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v6;
  }
  else if (a4 == 64)
  {
    if (a3 >= 0x20)
    {
      v14 = a3 >> 5;
      do
      {
        v15 = v4[1];
        *(_OWORD *)buf = *v4;
        *(_OWORD *)&buf[16] = v15;
        v23 = *(_QWORD *)buf;
        v16 = *(_DWORD *)&buf[8];
        if ((*(_DWORD *)&buf[8] & 0x80000000) == 0)
        {
          *(_QWORD *)&v21 = &v23;
          *((_DWORD *)sub_1C1CC3A04(a1, &v23, (uint64_t)&unk_1C1CC9C01, (_QWORD **)&v21) + 6) = v16;
          *(_QWORD *)&v21 = v23;
          if (!sub_1C1CBFEE4((_QWORD *)(a1 + 40), (unint64_t *)&v21))
          {
            v24 = v23;
            *(_QWORD *)&v21 = &v24;
            v17 = sub_1C1CC4708(a1 + 40, &v24, (uint64_t)&unk_1C1CC9C01, (_QWORD **)&v21);
            v17[3] = v23;
            *((_DWORD *)v17 + 8) = *(_DWORD *)&buf[8];
          }
          LODWORD(v21) = v16;
          if (!sub_1C1CC2F98((_QWORD *)(a1 + 80), (int *)&v21))
          {
            LODWORD(v24) = v16;
            *(_QWORD *)&v21 = &v24;
            v18 = sub_1C1CC304C(a1 + 80, (int *)&v24, (uint64_t)&unk_1C1CC9C01, (_DWORD **)&v21);
            *((_DWORD *)v18 + 12) = v16;
            v19 = strnlen(&buf[12], 0x14uLL);
            sub_1C1CC2E68(&v21, &buf[12], v19);
            v20 = (void **)(v18 + 3);
            if (*((char *)v18 + 47) < 0)
              operator delete(*v20);
            *(_OWORD *)v20 = v21;
            v18[5] = v22;
          }
        }
        v4 += 2;
        --v14;
      }
      while (v14);
    }
  }
  else
  {
    if (a4 != 32)
      sub_1C1CC8C84();
    if (a3 >= 0x1C)
    {
      v8 = a3 / 0x1C;
      do
      {
        *(_OWORD *)buf = *v4;
        *(_OWORD *)&buf[12] = *(_OWORD *)((char *)v4 + 12);
        v9 = *(_DWORD *)&buf[4];
        v23 = *(unsigned int *)buf;
        if ((*(_DWORD *)&buf[4] & 0x80000000) == 0)
        {
          *(_QWORD *)&v21 = &v23;
          *((_DWORD *)sub_1C1CC3A04(a1, &v23, (uint64_t)&unk_1C1CC9C01, (_QWORD **)&v21) + 6) = v9;
          *(_QWORD *)&v21 = v23;
          if (!sub_1C1CBFEE4((_QWORD *)(a1 + 40), (unint64_t *)&v21))
          {
            v24 = v23;
            *(_QWORD *)&v21 = &v24;
            v10 = sub_1C1CC4708(a1 + 40, &v24, (uint64_t)&unk_1C1CC9C01, (_QWORD **)&v21);
            v10[3] = v23;
            *((_DWORD *)v10 + 8) = *(_DWORD *)&buf[4];
          }
          LODWORD(v21) = v9;
          if (!sub_1C1CC2F98((_QWORD *)(a1 + 80), (int *)&v21))
          {
            LODWORD(v24) = v9;
            *(_QWORD *)&v21 = &v24;
            v11 = sub_1C1CC304C(a1 + 80, (int *)&v24, (uint64_t)&unk_1C1CC9C01, (_DWORD **)&v21);
            *((_DWORD *)v11 + 12) = v9;
            v12 = strnlen(&buf[8], 0x14uLL);
            sub_1C1CC2E68(&v21, &buf[8], v12);
            v13 = (void **)(v11 + 3);
            if (*((char *)v11 + 47) < 0)
              operator delete(*v13);
            *(_OWORD *)v13 = v21;
            v11[5] = v22;
          }
        }
        v4 = (_OWORD *)((char *)v4 + 28);
        --v8;
      }
      while (v8);
    }
  }
}

_QWORD *sub_1C1CBDEDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unint64_t *v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t *v22;

  v4 = a1 + 80;
  LODWORD(v22) = 0;
  result = sub_1C1CC2F98((_QWORD *)(a1 + 80), (int *)&v22);
  if (result)
  {
    v6 = (uint64_t)(result + 3);
  }
  else
  {
    LODWORD(v21) = 0;
    v22 = (unint64_t *)&v21;
    v7 = sub_1C1CC304C(v4, (int *)&v21, (uint64_t)&unk_1C1CC9C01, (_DWORD **)&v22);
    v6 = (uint64_t)(v7 + 3);
    *((_DWORD *)v7 + 12) = 0;
    result = (_QWORD *)MEMORY[0x1C3BB41E4](v7 + 3, "kernel_task");
  }
  v8 = *a2;
  if ((*a2 & 0x40) != 0)
  {
    v9 = *((_DWORD *)a2 + 541);
    if (v9)
    {
      result = sub_1C1CBD51C((unint64_t *)a2 + 271, v9, (*((_DWORD *)a2 + 540) >> 2) & 1, v6);
      v8 = *a2;
    }
  }
  if ((v8 & 0x80) != 0 && *((_DWORD *)a2 + 27))
  {
    if ((v8 & 4) == 0)
      sub_1C1CC6F30();
    v10 = *((_DWORD *)a2 + 26);
    v11 = (unint64_t *)a2[2];
    v12 = (_QWORD *)(a1 + 40);
    v22 = v11;
    result = sub_1C1CBFEE4(v12, (unint64_t *)&v22);
    if (!result)
    {
      v21 = v11;
      v22 = (unint64_t *)&v21;
      result = sub_1C1CC4708((uint64_t)v12, (unint64_t *)&v21, (uint64_t)&unk_1C1CC9C01, &v22);
      result[3] = v11;
    }
    v13 = (char *)(result + 3);
    v14 = *((unsigned int *)a2 + 27);
    v15 = a2[14];
    v21 = (unint64_t *)v15;
    if ((v10 & 4) != 0)
      v16 = 0x100000000;
    else
      v16 = 4096;
    if (v16 < v15)
    {
      v22 = (unint64_t *)&v21;
      result = sub_1C1CBFF98((uint64_t)(result + 5), (unint64_t *)&v21, (uint64_t)&unk_1C1CC9C01, &v22);
      ++result[3];
    }
    if (v14 >= 2)
    {
      v17 = (uint64_t)(v13 + 16);
      v18 = v14 - 1;
      v19 = a2 + 15;
      do
      {
        v20 = *v19++;
        v21 = (unint64_t *)(v20 - 1);
        if (v16 < v20 - 1)
        {
          v22 = (unint64_t *)&v21;
          result = sub_1C1CBFF98(v17, (unint64_t *)&v21, (uint64_t)&unk_1C1CC9C01, &v22);
          ++result[3];
        }
        --v18;
      }
      while (v18);
    }
  }
  return result;
}

double sub_1C1CBE0C0(uint64_t a1, unint64_t a2, char *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  double result;
  void **v11;
  size_t v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v15 = a2;
  if (a4 != -1)
  {
    *(_QWORD *)&v13 = &v15;
    *((_DWORD *)sub_1C1CC3A04(a1, &v15, (uint64_t)&unk_1C1CC9C01, (_QWORD **)&v13) + 6) = a4;
    *(_QWORD *)&v13 = v15;
    v7 = sub_1C1CBFEE4((_QWORD *)(a1 + 40), (unint64_t *)&v13);
    if (!v7)
    {
      v16 = v15;
      *(_QWORD *)&v13 = &v16;
      v7 = sub_1C1CC4708(a1 + 40, &v16, (uint64_t)&unk_1C1CC9C01, (_QWORD **)&v13);
    }
    v7[3] = v15;
    *((_DWORD *)v7 + 8) = a4;
    v8 = a1 + 80;
    LODWORD(v13) = a4;
    v9 = sub_1C1CC2F98((_QWORD *)(a1 + 80), (int *)&v13);
    if (!v9)
    {
      LODWORD(v16) = a4;
      *(_QWORD *)&v13 = &v16;
      v9 = sub_1C1CC304C(v8, (int *)&v16, (uint64_t)&unk_1C1CC9C01, (_DWORD **)&v13);
    }
    *((_DWORD *)v9 + 12) = a4;
    if (a3)
    {
      v11 = (void **)(v9 + 3);
      v12 = strnlen(a3, 0x20uLL);
      sub_1C1CC2E68(&v13, a3, v12);
      if (*((char *)v9 + 47) < 0)
        operator delete(*v11);
      result = *(double *)&v13;
      *(_OWORD *)v11 = v13;
      v9[5] = v14;
    }
  }
  return result;
}

void sub_1C1CBE210(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _QWORD v28[5];
  int v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 264))
  {
    v5 = *__error();
    sub_1C1CB1954();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1CAA000, v6, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_process_info] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v5;
  }
  else
  {
    v19 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v7, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LoadInfos"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      *(_DWORD *)buf = v21;
      v18 = v8;
      v9 = sub_1C1CC2F98((_QWORD *)(a1 + 80), (int *)buf);
      if (!v9)
      {
        LODWORD(v26) = v21;
        *(_QWORD *)buf = &v26;
        v9 = sub_1C1CC304C(a1 + 80, (int *)&v26, (uint64_t)&unk_1C1CC9C01, (_DWORD **)buf);
      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      if (v11)
      {
        v12 = (_QWORD *)(a1 + 200);
        v20 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v23 != v20)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKey:", v14, v18);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            uuid_clear(buf);
            memset(v28, 0, sizeof(v28));
            v29 = 1065353216;
            v30 = 0;
            v31 = -1;
            v32 = 0;
            v33 = 0u;
            v34 = 0u;
            sub_1C1CBFE70((uint64_t)&v26, v14);
            *(_OWORD *)buf = v26;
            v28[0] = objc_msgSend(v15, "unsignedLongLongValue");
            v31 = v21;
            v32 = sub_1C1CC2CE0(v12, buf) != 0;
            v16 = v9[10];
            if (v16 >= v9[11])
            {
              v17 = sub_1C1CC3CD8(v9 + 9, (__int128 *)buf);
            }
            else
            {
              sub_1C1CC3DFC((uint64_t)(v9 + 11), v9[10], (__int128 *)buf);
              v17 = v16 + 112;
              v9[10] = v16 + 112;
            }
            v9[10] = v17;
            if (SHIBYTE(v34) < 0)
              operator delete(*((void **)&v33 + 1));
            sub_1C1CBFBC4((uint64_t)&v28[1]);

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
        }
        while (v11);
      }

      v8 = v18;
    }

    v4 = v19;
  }

}

void sub_1C1CBE51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1C1CBE5AC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  _QWORD *i;
  __int128 *v12;
  __int128 *v13;
  _QWORD *j;
  __int128 *v15;
  __int128 *v16;
  uint64_t v17;
  __int128 v18;
  uint8_t buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 264))
  {
    v5 = *__error();
    sub_1C1CB1954();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1CAA000, v6, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_parse_process_info] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v5;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TEXT_EXEC"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID_String"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
      {
        _os_assert_log();
        v17 = _os_crash();
        sub_1C1CC7C98(v17);
      }

      sub_1C1CBFE70((uint64_t)buf, v10);
      if (!sub_1C1CC2CE0((_QWORD *)(a1 + 200), buf))
      {
        sub_1C1CC49C8(a1 + 200, buf, buf);
        for (i = *(_QWORD **)(a1 + 96); i; i = (_QWORD *)*i)
        {
          v12 = (__int128 *)i[9];
          v13 = (__int128 *)i[10];
          while (v12 != v13)
          {
            v18 = *v12;
            if (!uuid_compare((const unsigned __int8 *)&v18, buf))
            {
              *((_BYTE *)v12 + 76) = 1;
              break;
            }
            v12 += 7;
          }
        }
        for (j = *(_QWORD **)(a1 + 136); j; j = (_QWORD *)*j)
        {
          v15 = (__int128 *)j[4];
          v16 = (__int128 *)j[5];
          while (v15 != v16)
          {
            v18 = *v15;
            if (!uuid_compare((const unsigned __int8 *)&v18, buf))
            {
              *((_BYTE *)v15 + 76) = 1;
              break;
            }
            v15 += 7;
          }
        }
      }

    }
  }

}

void sub_1C1CBE7A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *sub_1C1CBE7EC(_QWORD *result, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  if (!result)
    sub_1C1CC6F30();
  if (!a3)
    sub_1C1CC6F30();
  if (!a4)
    sub_1C1CC6F30();
  *a3 = 0;
  *a4 = 0;
  v7 = *(_QWORD *)(a2 + 48);
  if (v7)
  {
    result = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    if (!result)
      sub_1C1CC6F30();
    v8 = *(_QWORD **)(a2 + 40);
    if (v8)
    {
      v9 = 0;
      do
      {
        result[v9++] = v8[2];
        v8 = (_QWORD *)*v8;
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    if (v9 != v7)
      sub_1C1CC6F30();
    *a4 = result;
    *a3 = v7;
  }
  return result;
}

BOOL sub_1C1CBE89C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 64) > *(_QWORD *)(a2 + 64);
}

uint64_t sub_1C1CBE8B0(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  int v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *i;
  _QWORD *v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *j;
  __int128 *v16;
  __int128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  const unsigned __int8 *v22;
  uint64_t v23;
  unint64_t v24;
  __int128 *v25;
  __int128 *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  char v40;
  _QWORD *k;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  BOOL v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;
  unint64_t v56;
  unint64_t v57;
  unsigned __int8 *v58;
  unint64_t v59;
  unsigned __int8 *v60;
  int v61;
  int v62;
  NSObject *v63;
  _BOOL4 v64;
  int v65;
  NSObject *v66;
  int *v67;
  const unsigned __int8 *v68;
  unsigned __int8 *v69;
  unint64_t v70;
  unint64_t v71;
  unsigned __int8 *v72;
  unint64_t v73;
  unsigned __int8 *v74;
  NSObject *v75;
  _BOOL4 v76;
  uint64_t *v77;
  _QWORD *v78;
  _QWORD *m;
  __int128 *v80;
  const unsigned __int8 *v81;
  const unsigned __int8 *v82;
  const unsigned __int8 *v83;
  __int128 v84;
  __int128 v85;
  const unsigned __int8 *n;
  const unsigned __int8 *v87;
  __int128 *ii;
  const unsigned __int8 *v89;
  const unsigned __int8 *v90;
  _QWORD *v91;
  uint64_t v92;
  int v93;
  const unsigned __int8 *v94;
  const unsigned __int8 *v95;
  __int128 v96;
  __int128 v97;
  __int128 *v98;
  __int128 *v99;
  unint64_t v100;
  uint64_t v101;
  id v102;
  __int128 *v103;
  char v104;
  __int128 *v105;
  char *v106;
  __int128 *v107;
  unsigned int v108;
  int v109;
  int v110;
  NSObject *v111;
  int v112;
  NSObject *v113;
  id v114;
  void *v115;
  uint64_t v116;
  int v117;
  NSObject *v118;
  int v119;
  NSObject *v120;
  int *v121;
  int v122;
  uint64_t jj;
  __int128 *v124;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unsigned int *v129;
  uint64_t v131;
  _QWORD *v132;
  const unsigned __int8 *uu2;
  uint64_t v134;
  __int128 *v135;
  __int128 *v136;
  unint64_t v137;
  unsigned int v138;
  void *v139;
  _BYTE buf[24];
  _BYTE v141[32];
  int v142;
  uint64_t v143;
  int v144;
  char v145;
  __int128 v146;
  __int128 v147;
  unsigned __int8 uu[16];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  if (!a1)
    sub_1C1CC6F30();
  if (!a4)
    sub_1C1CC6F30();
  v138 = 0;
  v135 = 0;
  v136 = 0;
  v137 = 0;
  if (*(_BYTE *)(a1 + 264))
  {
    v5 = *__error();
    sub_1C1CB1954();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1CAA000, v6, OS_LOG_TYPE_INFO, "[tailspin_symbol_factory_write_to_file] Shortcircuit due to signal received", buf, 2u);
    }

    *__error() = v5;
    v7 = 4;
    goto LABEL_178;
  }
  for (i = *(_QWORD **)(a1 + 56); i; i = (_QWORD *)*i)
  {
    if (i[8])
    {
      *(_QWORD *)buf = i[2];
      v9 = sub_1C1CBFEE4((_QWORD *)a1, (unint64_t *)buf);
      if (v9)
      {
        *(_DWORD *)buf = *((_DWORD *)v9 + 6);
        v10 = sub_1C1CC2F98((_QWORD *)(a1 + 80), (int *)buf);
        if (!v10)
        {
          _os_assert_log();
          v127 = _os_crash();
          sub_1C1CC7C98(v127);
        }
        v11 = (_QWORD *)i[7];
        if (v11)
        {
          v12 = (uint64_t)(v10 + 17);
          do
          {
            v13 = v11[3];
            *(_QWORD *)uu = v11[2];
            *(_QWORD *)buf = uu;
            v14 = sub_1C1CBFF98(v12, (unint64_t *)uu, (uint64_t)&unk_1C1CC9C01, (_QWORD **)buf);
            v14[3] += v13;
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
      }
      sub_1C1CC0410(i + 5);
    }
  }
  sub_1C1CC0474(a1 + 40);
  for (j = *(_QWORD **)(a1 + 136); j; j = (_QWORD *)*j)
  {
    v16 = (__int128 *)j[4];
    v17 = (__int128 *)j[5];
    if (v16 != v17)
    {
      v18 = j[9];
      v19 = j[4];
      do
      {
        *(_QWORD *)(v19 + 16) += v18;
        v19 += 112;
      }
      while ((__int128 *)v19 != v17);
      sub_1C1CC04C8(v16, v17, (uint64_t)buf, 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v17 - v16)), 1);
      v20 = j[5];
      j[10] = *(_QWORD *)(j[4] + 16);
      j[11] = *(_QWORD *)(v20 - 32) + *(_QWORD *)(v20 - 96);
    }
  }
  v132 = (_QWORD *)(a1 + 120);
  v21 = *(uint64_t **)(a1 + 96);
  v131 = a1;
  if (!v21)
  {
    v29 = 0;
LABEL_50:
    v40 = 1;
    goto LABEL_51;
  }
  do
  {
    *(_OWORD *)uu = *(_OWORD *)((char *)v21 + 52);
    if (uuid_is_null(uu))
    {
      *(_OWORD *)uu = *(_OWORD *)(a1 + 240);
      *(_OWORD *)((char *)v21 + 52) = *(_OWORD *)uu;
    }
    if (!uuid_is_null(uu))
    {
      *(_OWORD *)buf = *(_OWORD *)uu;
      v22 = sub_1C1CC2CE0(v132, buf);
      if (!v22)
      {
        _os_assert_log();
        v128 = _os_crash();
        sub_1C1CC7C98(v128);
      }
      uuid_clear(buf);
      memset(v141, 0, sizeof(v141));
      v142 = 1065353216;
      v143 = 0;
      v144 = -1;
      v145 = 0;
      v146 = 0u;
      v147 = 0u;
      *(_OWORD *)buf = *(_OWORD *)uu;
      v23 = *((_QWORD *)v22 + 11);
      *(_QWORD *)&buf[16] = *((_QWORD *)v22 + 10);
      *(_QWORD *)&v146 = v23 - *(_QWORD *)&buf[16];
      MEMORY[0x1C3BB41E4]((char *)&v146 + 8, "shared_cache");
      v24 = v21[10];
      if (v24 >= v21[11])
      {
        v25 = (__int128 *)sub_1C1CC3CD8(v21 + 9, (__int128 *)buf);
      }
      else
      {
        sub_1C1CC3DFC((uint64_t)(v21 + 11), v21[10], (__int128 *)buf);
        v25 = (__int128 *)(v24 + 112);
        v21[10] = v24 + 112;
      }
      v26 = (__int128 *)v21[9];
      v27 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v25 - v26));
      v21[10] = (uint64_t)v25;
      if (v25 == v26)
        v28 = 0;
      else
        v28 = v27;
      sub_1C1CC04C8(v26, v25, (uint64_t)&v134, v28, 1);
      if (SHIBYTE(v147) < 0)
        operator delete(*((void **)&v146 + 1));
      sub_1C1CBFBC4((uint64_t)v141);
    }
    v21 = (uint64_t *)*v21;
  }
  while (v21);
  v29 = *(uint64_t **)(a1 + 96);
  if (!v29)
    goto LABEL_50;
  v30 = *(_QWORD **)(a1 + 96);
  do
  {
    v32 = v30[9];
    v31 = v30[10];
    if (v31 != v32)
    {
      v33 = 0x6DB6DB6DB6DB6DB7 * ((v31 - v32) >> 4);
      if (v33 >= 2)
      {
        v34 = *(_QWORD *)(v32 + 16);
        v35 = (_QWORD *)(v32 + 80);
        v36 = 2;
        v37 = 1;
        do
        {
          v38 = *(_QWORD *)(v32 + 112 * v37 + 16);
          if (!*v35)
            *v35 = v38 - v34;
          v37 = v36;
          v39 = v33 > v36++;
          v35 += 14;
          v34 = v38;
        }
        while (v39);
      }
      if (!*(_QWORD *)(v31 - 32))
        *(_QWORD *)(v31 - 32) = 0x10000000;
    }
    v30 = (_QWORD *)*v30;
  }
  while (v30);
  v40 = 0;
LABEL_51:
  for (k = *(_QWORD **)(a1 + 136); k; k = (_QWORD *)*k)
  {
    v43 = k[4];
    v42 = k[5];
    if (v42 != v43 && !*(_QWORD *)(v43 + 80))
    {
      v44 = 0x6DB6DB6DB6DB6DB7 * ((v42 - v43) >> 4);
      if (v44 >= 2)
      {
        v45 = *(_QWORD *)(v43 + 16);
        v46 = (_QWORD *)(v43 + 80);
        v47 = 2;
        v48 = 1;
        do
        {
          v49 = *(_QWORD *)(v43 + 112 * v48 + 16);
          *v46 = v49 - v45;
          v46 += 14;
          v48 = v47;
          v39 = v44 > v47++;
          v45 = v49;
        }
        while (v39);
      }
      *(_QWORD *)(v42 - 32) = 0x4000000;
    }
  }
  if ((v40 & 1) == 0)
  {
    while (1)
    {
      v50 = (_QWORD *)v29[19];
      if (v50)
        break;
LABEL_102:
      sub_1C1CC0410(v29 + 17);
      v29 = (uint64_t *)*v29;
      if (!v29)
        goto LABEL_103;
    }
    uu2 = (const unsigned __int8 *)v29 + 52;
    while (1)
    {
      v52 = v50[2];
      v51 = v50[3];
      if (v52)
        v53 = v51 == 0;
      else
        v53 = 1;
      if (v53)
        goto LABEL_94;
      v55 = (unsigned __int8 *)v29[9];
      v54 = (unsigned __int8 *)v29[10];
      if (v54 != v55)
      {
        v56 = 0x6DB6DB6DB6DB6DB7 * ((v54 - v55) >> 4);
        do
        {
          v57 = v56 >> 1;
          v58 = &v55[112 * (v56 >> 1)];
          v59 = *((_QWORD *)v58 + 10) + *((_QWORD *)v58 + 2);
          v60 = v58 + 112;
          v56 += ~(v56 >> 1);
          if (v59 < v52)
            v55 = v60;
          else
            v56 = v57;
        }
        while (v56);
      }
      if (v55 == v54)
      {
        v65 = *__error();
        sub_1C1CB1954();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          v77 = v29 + 3;
          if (*((char *)v29 + 47) < 0)
            v77 = (uint64_t *)v29[3];
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v52;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v77;
          _os_log_debug_impl(&dword_1C1CAA000, v66, OS_LOG_TYPE_DEBUG, "Address %#llx is out of range of all binaries in proc %s", buf, 0x16u);
        }

        v67 = __error();
      }
      else
      {
        v61 = uuid_compare(v55, uu2);
        v62 = *__error();
        sub_1C1CB1954();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG);
        if (v61)
        {
          if (v64)
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v52;
            _os_log_debug_impl(&dword_1C1CAA000, v63, OS_LOG_TYPE_DEBUG, "Address %#llx is in non-shared-cache binary", buf, 0xCu);
          }

          *__error() = v62;
LABEL_93:
          sub_1C1CC2108(v55, v52, v51);
          goto LABEL_94;
        }
        if (v64)
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v52;
          _os_log_debug_impl(&dword_1C1CAA000, v63, OS_LOG_TYPE_DEBUG, "Address %#llx is in shared cache", buf, 0xCu);
        }

        *__error() = v62;
        *(_OWORD *)buf = *(_OWORD *)uu2;
        v68 = sub_1C1CC2CE0(v132, buf);
        if (!v68)
        {
          _os_assert_log();
          v126 = _os_crash();
          sub_1C1CC7C98(v126);
        }
        v55 = (unsigned __int8 *)*((_QWORD *)v68 + 4);
        v69 = (unsigned __int8 *)*((_QWORD *)v68 + 5);
        if (v69 != v55)
        {
          v70 = 0x6DB6DB6DB6DB6DB7 * ((v69 - v55) >> 4);
          do
          {
            v71 = v70 >> 1;
            v72 = &v55[112 * (v70 >> 1)];
            v73 = *((_QWORD *)v72 + 10) + *((_QWORD *)v72 + 2);
            v74 = v72 + 112;
            v70 += ~(v70 >> 1);
            if (v73 < v52)
              v55 = v74;
            else
              v70 = v71;
          }
          while (v70);
        }
        v65 = *__error();
        sub_1C1CB1954();
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG);
        if (v55 != v69)
        {
          if (v76)
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v52;
            _os_log_debug_impl(&dword_1C1CAA000, v75, OS_LOG_TYPE_DEBUG, "Found a shared cache binary for %#llx", buf, 0xCu);
          }

          *__error() = v65;
          goto LABEL_93;
        }
        if (v76)
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v52;
          _os_log_debug_impl(&dword_1C1CAA000, v75, OS_LOG_TYPE_DEBUG, "Couldn't find a shared cache binary that %#llx falls into", buf, 0xCu);
        }

        v67 = __error();
      }
      *v67 = v65;
LABEL_94:
      v50 = (_QWORD *)*v50;
      if (!v50)
        goto LABEL_102;
    }
  }
LABEL_103:
  v78 = (_QWORD *)(v131 + 160);
  sub_1C1CC2270(v131 + 160);
  for (m = *(_QWORD **)(v131 + 136); m; m = (_QWORD *)*m)
  {
    v81 = (const unsigned __int8 *)m[4];
    v80 = (__int128 *)m[5];
    while (v81 != (const unsigned __int8 *)v80)
    {
      *(_QWORD *)buf = v81;
      v82 = sub_1C1CC22C4((uint64_t)v78, v81, (uint64_t)&unk_1C1CC9C01, (_OWORD **)buf);
      v83 = v82;
      v84 = *(_OWORD *)v81;
      *((_QWORD *)v82 + 6) = *((_QWORD *)v81 + 2);
      *((_OWORD *)v82 + 2) = v84;
      if (v82 + 32 != v81)
      {
        *((_DWORD *)v82 + 22) = *((_DWORD *)v81 + 14);
        sub_1C1CC2688((_QWORD *)v82 + 7, *((_QWORD **)v81 + 5), 0);
      }
      v85 = *((_OWORD *)v81 + 4);
      *((_QWORD *)v83 + 14) = *((_QWORD *)v81 + 10);
      *((_OWORD *)v83 + 6) = v85;
      std::string::operator=((std::string *)v83 + 5, (const std::string *)(v81 + 88));
      v81 += 112;
    }
  }
  sub_1C1CC2C8C((uint64_t)v132);
  for (n = *(const unsigned __int8 **)(v131 + 96); n; n = *(const unsigned __int8 **)n)
  {
    v87 = (const unsigned __int8 *)*((_QWORD *)n + 9);
    for (ii = (__int128 *)*((_QWORD *)n + 10); v87 != (const unsigned __int8 *)ii; v87 += 112)
    {
      *(_OWORD *)uu = *(_OWORD *)v87;
      if (uuid_compare(uu, n + 52))
      {
        *(_OWORD *)buf = *(_OWORD *)uu;
        v89 = sub_1C1CC2CE0(v78, buf);
        if (v89)
          v90 = v89 + 32;
        else
          v90 = 0;
        if (v89)
        {
          v91 = (_QWORD *)*((_QWORD *)v87 + 5);
          if (v91)
          {
            v92 = (uint64_t)(v89 + 56);
            do
            {
              *(_QWORD *)buf = v91[2];
              sub_1C1CC37EC(v92, (unint64_t *)buf, buf);
              v91 = (_QWORD *)*v91;
            }
            while (v91);
          }
          *((_QWORD *)v90 + 8) += *((_QWORD *)v87 + 8);
          if (*((_DWORD *)v90 + 18) == 1)
          {
            v93 = *((_DWORD *)v87 + 18);
            if (v93 != 1)
              *((_DWORD *)v90 + 18) = v93;
          }
        }
        else
        {
          *(_QWORD *)buf = uu;
          v94 = sub_1C1CC22C4((uint64_t)v78, uu, (uint64_t)&unk_1C1CC9C01, (_OWORD **)buf);
          v95 = v94;
          v96 = *(_OWORD *)v87;
          *((_QWORD *)v94 + 6) = *((_QWORD *)v87 + 2);
          *((_OWORD *)v94 + 2) = v96;
          if (v94 + 32 != v87)
          {
            *((_DWORD *)v94 + 22) = *((_DWORD *)v87 + 14);
            sub_1C1CC2688((_QWORD *)v94 + 7, *((_QWORD **)v87 + 5), 0);
          }
          v97 = *((_OWORD *)v87 + 4);
          *((_QWORD *)v95 + 14) = *((_QWORD *)v87 + 10);
          *((_OWORD *)v95 + 6) = v97;
          std::string::operator=((std::string *)v95 + 5, (const std::string *)(v87 + 88));
        }
        sub_1C1CC0410((_QWORD *)v87 + 3);
        *((_QWORD *)v87 + 8) = 0;
      }
    }
  }
  sub_1C1CC2E14(v131 + 80);
  v98 = *(__int128 **)(v131 + 176);
  if (v98)
  {
    v99 = v136;
    do
    {
      if ((unint64_t)v99 >= v137)
      {
        v99 = (__int128 *)sub_1C1CC3CD8((uint64_t *)&v135, v98 + 2);
      }
      else
      {
        sub_1C1CC3DFC((uint64_t)&v137, (uint64_t)v99, v98 + 2);
        v99 += 7;
      }
      v136 = v99;
      v98 = *(__int128 **)v98;
    }
    while (v98);
  }
  else
  {
    v99 = v136;
  }
  v100 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v99 - v135));
  *(_QWORD *)buf = sub_1C1CBE89C;
  if (v99 == v135)
    v101 = 0;
  else
    v101 = v100;
  sub_1C1CC4C50(v135, v99, (uint64_t (**)(__int128 *, __int128 *))buf, v101, 1);
  v102 = objc_alloc_init(MEMORY[0x1E0DB23A8]);
  v103 = v136;
  if (v135 != v136)
  {
    v104 = 0;
    v105 = v135 + 6;
    while (1)
    {
      *(_OWORD *)uu = *(v105 - 6);
      if (*((char *)v105 + 15) < 0)
        v106 = *(_QWORD *)v105 ? (char *)*((_QWORD *)v105 - 1) : 0;
      else
        v106 = *((_BYTE *)v105 + 15) ? (char *)v105 - 8 : 0;
      v107 = v105 - 6;
      v108 = *((_DWORD *)v105 - 6);
      v109 = *((unsigned __int8 *)v105 - 20);
      v139 = 0;
      v134 = 0;
      if (*(_BYTE *)(v131 + 264))
        break;
      sub_1C1CBE7EC((_QWORD *)v131, (uint64_t)(v105 - 6), &v134, &v139);
      v110 = *__error();
      sub_1C1CB1954();
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
      {
        v116 = *((_QWORD *)v105 - 4);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v106;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v116;
        _os_log_debug_impl(&dword_1C1CAA000, v111, OS_LOG_TYPE_DEBUG, "Frequency of offsets in binary %s: %llu", buf, 0x16u);
      }

      *__error() = v110;
      v112 = *__error();
      sub_1C1CB1954();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v106;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v134;
        _os_log_debug_impl(&dword_1C1CAA000, v113, OS_LOG_TYPE_DEBUG, "Number of offsets in binary %s: %lu", buf, 0x16u);
      }

      v114 = 0;
      *__error() = v112;
      if (v134 && *((_QWORD *)v105 - 4))
      {
        v129 = &v138;
        tailspin_symbolicator_copy_symbol_data_using_uuid_pid_path(v102, a2, (uint64_t)uu, v108, v106, v109 != 0, (uint64_t *)v139, v134);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        free(v139);
        if (v115)
        {
          v114 = objc_retainAutorelease(v115);
          objc_msgSend(v114, "bytes", &v138);
          objc_msgSend(v114, "length");
          if (!ktrace_file_append_chunk())
          {
            v119 = *__error();
            sub_1C1CB1954();
            v120 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
            {
              v121 = __error();
              sub_1C1CC8C9C((uint64_t)v106, v121, (uint64_t)buf, v120);
            }

            *__error() = v119;
            v122 = *__error();
            if (!v122)
              v122 = -1;
            v138 = v122;

            goto LABEL_175;
          }
          v104 = 1;
        }
        else
        {
          if (v138)
            goto LABEL_175;
          v114 = 0;
        }
      }

      v105 += 7;
      if (v107 + 7 == v103)
        goto LABEL_175;
    }
    if ((v104 & 1) != 0)
    {
      v117 = *__error();
      sub_1C1CB1954();
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1CAA000, v118, OS_LOG_TYPE_INFO, "Signal received, skipping further symbolication", buf, 2u);
      }
    }
    else
    {
      v117 = *__error();
      sub_1C1CB1954();
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1CAA000, v118, OS_LOG_TYPE_INFO, "Signal received, skipping symbolication", buf, 2u);
      }
    }

    *__error() = v117;
  }
LABEL_175:
  objc_msgSend(v102, "invalidateConnection", v129);
  v124 = v135;
  for (jj = (uint64_t)v136; (__int128 *)jj != v124; sub_1C1CC3CA8((uint64_t)&v137, jj))
    jj -= 112;
  v136 = v124;
  v7 = v138;

LABEL_178:
  *(_QWORD *)uu = &v135;
  sub_1C1CC3C24((void ***)uu);
  return v7;
}

void sub_1C1CBF738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void **a28)
{
  void *v28;
  void *v29;
  void *v30;

  a28 = (void **)&a24;
  sub_1C1CC3C24(&a28);
  _Unwind_Resume(a1);
}

void sub_1C1CBF820(uint64_t a1)
{
  uint64_t *i;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const unsigned __int8 *j;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  const char *v16;
  void **v17;
  uint64_t *k;
  uint64_t v19;
  void **v20;
  const char *v21;
  void *__p[2];
  char v23;
  unsigned __int8 uu[19];
  uuid_string_t out;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    sub_1C1CC6F30();
  puts("\nProcesses List");
  for (i = *(uint64_t **)(a1 + 96); i; i = (uint64_t *)*i)
  {
    uuid_unparse((const unsigned __int8 *)i + 52, out);
    v3 = (const char *)(i + 3);
    if (*((char *)i + 47) < 0)
      v3 = *(const char **)v3;
    printf("\t%s (%d) | Libs: %ld Addresses: %ld, shared_cache_uuid: %s\n", v3, *((_DWORD *)i + 12), 0x6DB6DB6DB6DB6DB7 * ((i[10] - i[9]) >> 4), i[20], out);
    puts("\t\tLibraries:");
    v4 = i[9];
    v5 = i[10];
    if (v4 != v5)
    {
      v6 = v4 + 88;
      do
      {
        v7 = v6 - 88;
        uuid_unparse((const unsigned __int8 *)(v6 - 88), out);
        if (*(char *)(v6 + 23) < 0)
        {
          v8 = *(const char **)(v6 + 8);
          if (v8)
            v8 = *(const char **)v6;
        }
        else if (*(_BYTE *)(v6 + 23))
        {
          v8 = (const char *)v6;
        }
        else
        {
          v8 = 0;
        }
        printf("\t\t\t%s - %llx - %s\n", out, *(_QWORD *)(v6 - 72), v8);
        v6 += 112;
      }
      while (v7 + 112 != v5);
    }
  }
  puts("\nShared Caches");
  for (j = *(const unsigned __int8 **)(a1 + 136); j; j = *(const unsigned __int8 **)j)
  {
    uuid_unparse(j + 16, out);
    sub_1C1CC67D0(__p, out);
    if (v23 >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    printf("\tSharedCache: %s | Libraries: %ld\n", (const char *)v10, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)j + 5) - *((_QWORD *)j + 4)) >> 4));
    if (v23 < 0)
      operator delete(__p[0]);
    v11 = *((_QWORD *)j + 4);
    v12 = *((_QWORD *)j + 5);
    if (v11 != v12)
    {
      v13 = v11 + 88;
      do
      {
        v14 = v13 - 88;
        uuid_unparse((const unsigned __int8 *)(v13 - 88), out);
        sub_1C1CC67D0(__p, out);
        if (v23 >= 0)
          v15 = __p;
        else
          v15 = (void **)__p[0];
        v16 = (const char *)v13;
        if (*(char *)(v13 + 23) < 0)
          v16 = *(const char **)v13;
        printf("\t\t%s - %llx - %s\n", (const char *)v15, *(_QWORD *)(v13 - 72), v16);
        if (v23 < 0)
          operator delete(__p[0]);
        v13 += 112;
      }
      while (v14 + 112 != v12);
    }
  }
  puts("\nDefault Shared Cache");
  *(_OWORD *)uu = *(_OWORD *)(a1 + 240);
  uuid_unparse(uu, out);
  sub_1C1CC67D0(__p, out);
  if (v23 >= 0)
    v17 = __p;
  else
    v17 = (void **)__p[0];
  printf("\t%s\n", (const char *)v17);
  if (v23 < 0)
    operator delete(__p[0]);
  puts("\nSymbol Owners");
  for (k = *(uint64_t **)(a1 + 176); k; k = (uint64_t *)*k)
  {
    *(_OWORD *)uu = *((_OWORD *)k + 1);
    uuid_unparse(uu, out);
    v19 = k[10];
    if (v19)
    {
      putchar(9);
      sub_1C1CC67D0(__p, out);
      if (v23 >= 0)
        v20 = __p;
      else
        v20 = (void **)__p[0];
      v21 = (const char *)(k + 15);
      if (*((char *)k + 143) < 0)
        v21 = *(const char **)v21;
      printf(" %s | Size: %#-15llx - Offsets: %#-5lx | %s \n", (const char *)v20, k[14], v19, v21);
      if (v23 < 0)
        operator delete(__p[0]);
    }
  }
}

void sub_1C1CBFBB4(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_1C1CBFBC4(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

uint64_t sub_1C1CBFC0C(uint64_t a1)
{
  void *v2;

  sub_1C1CBFC44(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_1C1CBFC44(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_1C1CBFC80((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_1C1CBFC80(uint64_t a1)
{
  if (*(char *)(a1 + 127) < 0)
    operator delete(*(void **)(a1 + 104));
  return sub_1C1CBFBC4(a1 + 40);
}

uint64_t sub_1C1CBFCB0(uint64_t a1)
{
  void *v2;

  sub_1C1CBFCE8(a1, *(char **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_1C1CBFCE8(uint64_t a1, char *a2)
{
  char *v2;
  char *v3;
  void **v4;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = *(char **)v2;
      v4 = (void **)(v2 + 32);
      sub_1C1CC3C24(&v4);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_1C1CBFD34(uint64_t a1)
{
  void *v2;

  sub_1C1CBFD6C(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_1C1CBFD6C(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_1C1CBFDA8((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void sub_1C1CBFDA8(uint64_t a1)
{
  void **v2;

  sub_1C1CBFBC4(a1 + 120);
  sub_1C1CBFBC4(a1 + 80);
  v2 = (void **)(a1 + 56);
  sub_1C1CC3C24(&v2);
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
}

uint64_t sub_1C1CBFDFC(uint64_t a1)
{
  void *v2;

  sub_1C1CBFE34(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_1C1CBFE34(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_1C1CBFBC4((uint64_t)(v2 + 5));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_1C1CBFE70(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
  objc_msgSend(v4, "getUUIDBytes:", a1);

  return a1;
}

void sub_1C1CBFEC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *sub_1C1CBFEE4(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *sub_1C1CBFF98(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    sub_1C1CC01DC(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *i = *v20;
LABEL_38:
    *v20 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    v21 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1C1CC01A0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CC01B4()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1C1CC01DC(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_1C1CC02B8(a1, prime);
  }
}

void sub_1C1CC02B8(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      sub_1C1CC01B4();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

_QWORD *sub_1C1CC0410(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void sub_1C1CC0474(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1C1CBFE34(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

__int128 *sub_1C1CC04C8(__int128 *result, __int128 *a2, uint64_t a3, uint64_t a4, char a5)
{
  __int128 *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  __int128 *v17;
  char v18;
  int v19;
  __int128 *v20;
  __int128 *v21;
  __int128 *v22;

  v7 = a2;
  v8 = result;
  v21 = a2;
  v22 = result;
  while (2)
  {
    v9 = 1 - a4;
LABEL_3:
    v10 = (char *)v7 - (char *)v8;
    v11 = 0x6DB6DB6DB6DB6DB7 * (v7 - v8);
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v21 = v7 - 7;
        if (*((_QWORD *)v7 - 12) < *((_QWORD *)v8 + 2))
          return (__int128 *)sub_1C1CC07B0(&v22, &v21);
        return result;
      case 3uLL:
        v21 = v7 - 7;
        return (__int128 *)sub_1C1CC0D00((uint64_t)v8, (uint64_t)(v8 + 7), (uint64_t)(v7 - 7));
      case 4uLL:
        v21 = v7 - 7;
        return (__int128 *)sub_1C1CC1670((uint64_t)v8, (uint64_t)(v8 + 7), (uint64_t)(v8 + 14), (uint64_t)(v7 - 7));
      case 5uLL:
        v21 = v7 - 7;
        return (__int128 *)sub_1C1CC1714((uint64_t)v8, (uint64_t)(v8 + 7), (uint64_t)(v8 + 14), (uint64_t)(v8 + 21), (uint64_t)(v7 - 7));
      default:
        if (v10 <= 2687)
        {
          if ((a5 & 1) != 0)
            return (__int128 *)sub_1C1CC0934((uint64_t)v8, (uint64_t)v7);
          else
            return (__int128 *)sub_1C1CC0B34((uint64_t)v8, (uint64_t)v7);
        }
        if (v9 == 1)
        {
          if (v8 != v7)
            return sub_1C1CC17E8(v8, v7, v7, a3);
          return result;
        }
        v12 = v11 >> 1;
        v13 = (uint64_t)(v7 - 7);
        if ((unint64_t)v10 < 0x3801)
        {
          sub_1C1CC0D00((uint64_t)&v8[7 * (v11 >> 1)], (uint64_t)v8, v13);
        }
        else
        {
          sub_1C1CC0D00((uint64_t)v8, (uint64_t)&v8[7 * (v11 >> 1)], v13);
          v14 = 7 * v12;
          v15 = 112 * v12 - 112;
          v16 = v21;
          sub_1C1CC0D00((uint64_t)(v22 + 7), (uint64_t)v22 + v15, (uint64_t)(v21 - 14));
          sub_1C1CC0D00((uint64_t)(v22 + 14), (uint64_t)&v22[v14 + 7], (uint64_t)(v16 - 21));
          sub_1C1CC0D00((uint64_t)v22 + v15, (uint64_t)&v22[v14], (uint64_t)&v22[v14 + 7]);
          v20 = &v22[v14];
          sub_1C1CC07B0(&v22, &v20);
        }
        if ((a5 & 1) == 0)
        {
          v7 = v21;
          if (*((_QWORD *)v22 - 12) < *((_QWORD *)v22 + 2))
            goto LABEL_12;
          result = sub_1C1CC0DC0((uint64_t)v22, v21);
          v8 = result;
LABEL_21:
          a5 = 0;
          v22 = v8;
          a4 = -v9;
          continue;
        }
        v7 = v21;
LABEL_12:
        v17 = sub_1C1CC101C((uint64_t)v22, v7);
        if ((v18 & 1) == 0)
        {
LABEL_19:
          result = (__int128 *)sub_1C1CC04C8(v22, v17, a3, -v9, a5 & 1);
          v8 = v17 + 7;
          goto LABEL_21;
        }
        v19 = sub_1C1CC1284((uint64_t)v22, v17);
        v8 = v17 + 7;
        result = (__int128 *)sub_1C1CC1284((uint64_t)(v17 + 7), v7);
        if (!(_DWORD)result)
        {
          if (v19)
          {
            v22 = v17 + 7;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        if ((v19 & 1) == 0)
        {
          v21 = v17;
          v8 = v22;
          v7 = v17;
LABEL_18:
          ++v9;
          goto LABEL_3;
        }
        return result;
    }
  }
}

uint64_t sub_1C1CC07B0(__int128 **a1, __int128 **a2)
{
  __int128 *v2;
  __int128 *v3;
  __int128 v4;
  void **v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  void **v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16[5];
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = *a2;
  v15 = *((_QWORD *)*a1 + 2);
  v14 = **a1;
  sub_1C1CC1560((uint64_t)v16, (uint64_t *)*a1 + 3);
  v4 = v2[4];
  v18 = *((_QWORD *)v2 + 10);
  v17 = v4;
  v5 = (void **)v2 + 11;
  v6 = *((_QWORD *)v2 + 13);
  v19 = *(__int128 *)((char *)v2 + 88);
  v20 = v6;
  *((_QWORD *)v2 + 12) = 0;
  *((_QWORD *)v2 + 13) = 0;
  *((_QWORD *)v2 + 11) = 0;
  v7 = *v3;
  *((_QWORD *)v2 + 2) = *((_QWORD *)v3 + 2);
  *v2 = v7;
  sub_1C1CC15D0((uint64_t)v2 + 24, (uint64_t *)v3 + 3);
  v8 = v3[4];
  *((_QWORD *)v2 + 10) = *((_QWORD *)v3 + 10);
  v2[4] = v8;
  if (*((char *)v2 + 111) < 0)
    operator delete(*v5);
  v9 = (void **)v3 + 11;
  v10 = *(__int128 *)((char *)v3 + 88);
  *((_QWORD *)v2 + 13) = *((_QWORD *)v3 + 13);
  *(_OWORD *)v5 = v10;
  *((_BYTE *)v3 + 111) = 0;
  *((_BYTE *)v3 + 88) = 0;
  *v3 = v14;
  *((_QWORD *)v3 + 2) = v15;
  sub_1C1CC15D0((uint64_t)v3 + 24, v16);
  v11 = v17;
  *((_QWORD *)v3 + 10) = v18;
  v3[4] = v11;
  if (*((char *)v3 + 111) < 0)
    operator delete(*v9);
  v12 = v19;
  *((_QWORD *)v3 + 13) = v20;
  *(_OWORD *)v9 = v12;
  HIBYTE(v20) = 0;
  LOBYTE(v19) = 0;
  return sub_1C1CBFBC4((uint64_t)v16);
}

uint64_t sub_1C1CC0934(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17[5];
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result != a2)
  {
    v3 = result;
    v4 = result + 112;
    if (result + 112 != a2)
    {
      v5 = 0;
      v6 = result;
      do
      {
        v7 = v4;
        if (*(_QWORD *)(v6 + 128) < *(_QWORD *)(v6 + 16))
        {
          v15 = *(_OWORD *)v4;
          v16 = *(_QWORD *)(v4 + 16);
          sub_1C1CC1560((uint64_t)v17, (uint64_t *)(v6 + 136));
          v18 = *(_OWORD *)(v6 + 176);
          v19 = *(_QWORD *)(v6 + 192);
          v20 = *(_OWORD *)(v6 + 200);
          v21 = *(_QWORD *)(v6 + 216);
          *(_QWORD *)(v6 + 200) = 0;
          *(_QWORD *)(v6 + 208) = 0;
          v8 = v5;
          *(_QWORD *)(v6 + 216) = 0;
          while (1)
          {
            v9 = v8;
            v10 = v3 + v8;
            *(_OWORD *)(v10 + 112) = *(_OWORD *)(v3 + v8);
            *(_QWORD *)(v10 + 128) = *(_QWORD *)(v3 + v8 + 16);
            sub_1C1CC15D0(v3 + v8 + 136, (uint64_t *)(v3 + v8 + 24));
            *(_OWORD *)(v10 + 176) = *(_OWORD *)(v10 + 64);
            *(_QWORD *)(v10 + 192) = *(_QWORD *)(v10 + 80);
            v11 = (void **)(v10 + 200);
            if (*(char *)(v10 + 223) < 0)
              operator delete(*v11);
            *(_OWORD *)v11 = *(_OWORD *)(v10 + 88);
            *(_QWORD *)(v10 + 216) = *(_QWORD *)(v10 + 104);
            *(_BYTE *)(v10 + 111) = 0;
            *(_BYTE *)(v10 + 88) = 0;
            if (!v9)
              break;
            v8 = v9 - 112;
            if (v16 >= *(_QWORD *)(v3 + v9 - 96))
            {
              v12 = v3 + v9;
              goto LABEL_12;
            }
          }
          v12 = v3;
LABEL_12:
          *(_OWORD *)v12 = v15;
          *(_QWORD *)(v12 + 16) = v16;
          v13 = v3 + v9;
          sub_1C1CC15D0(v13 + 24, v17);
          *(_QWORD *)(v13 + 80) = v19;
          *(_OWORD *)(v13 + 64) = v18;
          v14 = v13 + 88;
          if (*(char *)(v12 + 111) < 0)
            operator delete(*(void **)v14);
          *(_OWORD *)v14 = v20;
          *(_QWORD *)(v14 + 16) = v21;
          HIBYTE(v21) = 0;
          LOBYTE(v20) = 0;
          result = sub_1C1CBFBC4((uint64_t)v17);
        }
        v4 = v7 + 112;
        v5 += 112;
        v6 = v7;
      }
      while (v7 + 112 != a2);
    }
  }
  return result;
}

uint64_t sub_1C1CC0B34(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void **v8;
  void **v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12[5];
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result != a2)
  {
    v3 = result;
    v4 = result + 112;
    if (result + 112 != a2)
    {
      v5 = (char *)(result + 223);
      do
      {
        v6 = v4;
        if (*(_QWORD *)(v3 + 128) < *(_QWORD *)(v3 + 16))
        {
          v10 = *(_OWORD *)v4;
          v11 = *(_QWORD *)(v4 + 16);
          sub_1C1CC1560((uint64_t)v12, (uint64_t *)(v3 + 136));
          v13 = *(_OWORD *)(v3 + 176);
          v14 = *(_QWORD *)(v3 + 192);
          v15 = *(_OWORD *)(v3 + 200);
          v16 = *(_QWORD *)(v3 + 216);
          *(_QWORD *)(v3 + 200) = 0;
          *(_QWORD *)(v3 + 208) = 0;
          v7 = v5;
          *(_QWORD *)(v3 + 216) = 0;
          do
          {
            *(_OWORD *)(v7 - 111) = *(_OWORD *)(v7 - 223);
            *(_QWORD *)(v7 - 95) = *(_QWORD *)(v7 - 207);
            sub_1C1CC15D0((uint64_t)(v7 - 87), (uint64_t *)(v7 - 199));
            *(_OWORD *)(v7 - 47) = *(_OWORD *)(v7 - 159);
            *(_QWORD *)(v7 - 31) = *(_QWORD *)(v7 - 143);
            v8 = (void **)(v7 - 23);
            if (*v7 < 0)
              operator delete(*v8);
            *(_QWORD *)(v7 - 7) = *(_QWORD *)(v7 - 119);
            *(v7 - 112) = 0;
            v7 -= 112;
            *(_OWORD *)v8 = *(_OWORD *)(v7 - 23);
            *(v7 - 23) = 0;
          }
          while (v11 < *(_QWORD *)(v7 - 207));
          *(_OWORD *)(v7 - 111) = v10;
          *(_QWORD *)(v7 - 95) = v11;
          sub_1C1CC15D0((uint64_t)(v7 - 87), v12);
          *(_OWORD *)(v7 - 47) = v13;
          *(_QWORD *)(v7 - 31) = v14;
          v9 = (void **)(v7 - 23);
          if (*v7 < 0)
            operator delete(*v9);
          *(_OWORD *)v9 = v15;
          *(_QWORD *)(v7 - 7) = v16;
          HIBYTE(v16) = 0;
          LOBYTE(v15) = 0;
          result = sub_1C1CBFBC4((uint64_t)v12);
        }
        v4 = v6 + 112;
        v5 += 112;
        v3 = v6;
      }
      while (v6 + 112 != a2);
    }
  }
  return result;
}

uint64_t sub_1C1CC0D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 **v5;
  __int128 **v6;
  __int128 *v8;
  __int128 *v9;
  __int128 *v10;

  v10 = (__int128 *)a1;
  v8 = (__int128 *)a3;
  v9 = (__int128 *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a3 + 16);
  if (v3 < *(_QWORD *)(a1 + 16))
  {
    if (v4 < v3)
    {
      sub_1C1CC07B0(&v10, &v8);
      return 1;
    }
    sub_1C1CC07B0(&v10, &v9);
    if (*((_QWORD *)v8 + 2) >= *((_QWORD *)v9 + 2))
      return 1;
    v5 = &v9;
    v6 = &v8;
LABEL_9:
    sub_1C1CC07B0(v5, v6);
    return 2;
  }
  if (v4 < v3)
  {
    sub_1C1CC07B0(&v9, &v8);
    if (*((_QWORD *)v9 + 2) >= *((_QWORD *)v10 + 2))
      return 1;
    v5 = &v10;
    v6 = &v9;
    goto LABEL_9;
  }
  return 0;
}

__int128 *sub_1C1CC0DC0(uint64_t a1, __int128 *a2)
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 *v12;
  unint64_t v13;
  __int128 *v14;
  void **v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void **v21;
  __int128 v22;
  __int128 *v23;
  __int128 *v25;
  __int128 *v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29[5];
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v2 = a2;
  v34 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v27 = *(_OWORD *)a1;
  v28 = *(_QWORD *)(a1 + 16);
  v4 = a1 + 24;
  sub_1C1CC1560((uint64_t)v29, (uint64_t *)(a1 + 24));
  v30 = *(_OWORD *)(a1 + 64);
  v31 = *(_QWORD *)(a1 + 80);
  v32 = *(_OWORD *)(a1 + 88);
  v33 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  if (v28 >= *((_QWORD *)v2 - 12))
  {
    v8 = a1 + 112;
    do
    {
      v6 = (__int128 *)v8;
      if (v8 >= (unint64_t)v2)
        break;
      v9 = *(_QWORD *)(v8 + 16);
      v8 += 112;
    }
    while (v28 >= v9);
  }
  else
  {
    v5 = a1;
    do
    {
      v6 = (__int128 *)(v5 + 112);
      v7 = *(_QWORD *)(v5 + 128);
      v5 += 112;
    }
    while (v28 >= v7);
  }
  v26 = v6;
  if (v6 < v2)
  {
    do
    {
      v10 = *((_QWORD *)v2 - 12);
      v2 -= 7;
    }
    while (v28 < v10);
    v25 = v2;
  }
  if (v6 < v2)
  {
    do
    {
      sub_1C1CC07B0(&v26, &v25);
      v6 = v26;
      do
      {
        v11 = *((_QWORD *)v6 + 16);
        v6 += 7;
      }
      while (v28 >= v11);
      v26 = v6;
      v12 = v25;
      do
      {
        v13 = *((_QWORD *)v12 - 12);
        v12 -= 7;
      }
      while (v28 < v13);
      v25 = v12;
    }
    while (v6 < v12);
  }
  v14 = v6 - 7;
  if (v6 - 7 != (__int128 *)a1)
  {
    v15 = (void **)(a1 + 88);
    v16 = *v14;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v6 - 12);
    *(_OWORD *)a1 = v16;
    sub_1C1CC15D0(v4, (uint64_t *)v6 - 11);
    v17 = *(v6 - 3);
    *(_QWORD *)(a1 + 80) = *((_QWORD *)v6 - 4);
    *(_OWORD *)(a1 + 64) = v17;
    if (*(char *)(a1 + 111) < 0)
      operator delete(*v15);
    v18 = *(__int128 *)((char *)v6 - 24);
    *(_QWORD *)(a1 + 104) = *((_QWORD *)v6 - 1);
    *(_OWORD *)v15 = v18;
    *((_BYTE *)v6 - 1) = 0;
    *((_BYTE *)v6 - 24) = 0;
  }
  v19 = v27;
  *((_QWORD *)v6 - 12) = v28;
  *v14 = v19;
  sub_1C1CC15D0((uint64_t)v6 - 88, v29);
  v20 = v30;
  *((_QWORD *)v6 - 4) = v31;
  *(v6 - 3) = v20;
  v21 = (void **)v6 - 3;
  if (*((char *)v6 - 1) < 0)
    operator delete(*v21);
  v22 = v32;
  *((_QWORD *)v6 - 1) = v33;
  *(_OWORD *)v21 = v22;
  HIBYTE(v33) = 0;
  LOBYTE(v32) = 0;
  v23 = v26;
  sub_1C1CBFBC4((uint64_t)v29);
  return v23;
}

__int128 *sub_1C1CC101C(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  void **v6;
  unint64_t v7;
  __int128 *v8;
  __int128 *v9;
  unint64_t v10;
  unint64_t v11;
  __int128 *v12;
  unint64_t v13;
  __int128 *v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void **v22;
  __int128 v23;
  __int128 *v25;
  __int128 *v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29[5];
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = *(_OWORD *)a1;
  v28 = *(_QWORD *)(a1 + 16);
  v4 = a1 + 24;
  sub_1C1CC1560((uint64_t)v29, (uint64_t *)(a1 + 24));
  v5 = 0;
  v30 = *(_OWORD *)(a1 + 64);
  v31 = *(_QWORD *)(a1 + 80);
  v6 = (void **)(a1 + 88);
  v32 = *(_OWORD *)(a1 + 88);
  v33 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  do
  {
    v7 = *(_QWORD *)(a1 + v5 + 128);
    v5 += 112;
  }
  while (v7 < v28);
  v8 = (__int128 *)(a1 + v5);
  v26 = (__int128 *)(a1 + v5);
  if (v5 == 112)
  {
    while (v8 < a2)
    {
      v9 = a2 - 7;
      v11 = *((_QWORD *)a2 - 12);
      a2 -= 7;
      if (v11 < v28)
        goto LABEL_9;
    }
    v9 = a2;
  }
  else
  {
    do
    {
      v9 = a2 - 7;
      v10 = *((_QWORD *)a2 - 12);
      a2 -= 7;
    }
    while (v10 >= v28);
  }
LABEL_9:
  v25 = v9;
  v12 = v8;
  if (v8 < v9)
  {
    do
    {
      sub_1C1CC07B0(&v26, &v25);
      v12 = v26;
      do
      {
        v13 = *((_QWORD *)v12 + 16);
        v12 += 7;
      }
      while (v13 < v28);
      v26 = v12;
      v14 = v25;
      do
      {
        v15 = *((_QWORD *)v14 - 12);
        v14 -= 7;
      }
      while (v15 >= v28);
      v25 = v14;
    }
    while (v12 < v14);
  }
  v16 = v12 - 7;
  if (v12 - 7 != (__int128 *)a1)
  {
    v17 = *v16;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v12 - 12);
    *(_OWORD *)a1 = v17;
    sub_1C1CC15D0(v4, (uint64_t *)v12 - 11);
    v18 = *(v12 - 3);
    *(_QWORD *)(a1 + 80) = *((_QWORD *)v12 - 4);
    *(_OWORD *)(a1 + 64) = v18;
    if (*(char *)(a1 + 111) < 0)
      operator delete(*v6);
    v19 = *(__int128 *)((char *)v12 - 24);
    *(_QWORD *)(a1 + 104) = *((_QWORD *)v12 - 1);
    *(_OWORD *)v6 = v19;
    *((_BYTE *)v12 - 1) = 0;
    *((_BYTE *)v12 - 24) = 0;
  }
  v20 = v27;
  *((_QWORD *)v12 - 12) = v28;
  *v16 = v20;
  sub_1C1CC15D0((uint64_t)v12 - 88, v29);
  v21 = v30;
  *((_QWORD *)v12 - 4) = v31;
  *(v12 - 3) = v21;
  v22 = (void **)v12 - 3;
  if (*((char *)v12 - 1) < 0)
    operator delete(*v22);
  v23 = v32;
  *((_QWORD *)v12 - 1) = v33;
  *(_OWORD *)v22 = v23;
  HIBYTE(v33) = 0;
  LOBYTE(v32) = 0;
  sub_1C1CBFBC4((uint64_t)v29);
  return v12 - 7;
}

uint64_t sub_1C1CC1284(uint64_t a1, __int128 *a2)
{
  __int128 *v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int v12;
  uint64_t v13;
  __int128 v14;
  __int128 *v16;
  __int128 *v17;
  __int128 v18;
  unint64_t v19;
  uint64_t v20[5];
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v2 = a2;
  v25 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v17 = (__int128 *)a1;
  v4 = 1;
  switch(0x6DB6DB6DB6DB6DB7 * (((uint64_t)a2 - a1) >> 4))
  {
    case 0:
    case 1:
      return v4;
    case 2:
      v16 = a2 - 7;
      if (*((_QWORD *)a2 - 12) < *(_QWORD *)(a1 + 16))
        sub_1C1CC07B0(&v17, &v16);
      return v4;
    case 3:
      sub_1C1CC0D00(a1, a1 + 112, (uint64_t)(a2 - 7));
      return v4;
    case 4:
      sub_1C1CC1670(a1, a1 + 112, a1 + 224, (uint64_t)(a2 - 7));
      return v4;
    case 5:
      sub_1C1CC1714(a1, a1 + 112, a1 + 224, a1 + 336, (uint64_t)(a2 - 7));
      return v4;
    default:
      v5 = a1 + 224;
      sub_1C1CC0D00(a1, a1 + 112, a1 + 224);
      v6 = a1 + 336;
      if ((__int128 *)(a1 + 336) == v2)
        return 1;
      v7 = 0;
      break;
  }
  while (*(_QWORD *)(v6 + 16) >= *(_QWORD *)(v5 + 16))
  {
LABEL_16:
    v5 = v6;
    v6 += 112;
    if ((__int128 *)v6 == v2)
      return 1;
  }
  v18 = *(_OWORD *)v6;
  v19 = *(_QWORD *)(v6 + 16);
  sub_1C1CC1560((uint64_t)v20, (uint64_t *)(v6 + 24));
  v21 = *(_OWORD *)(v6 + 64);
  v22 = *(_QWORD *)(v6 + 80);
  v23 = *(_OWORD *)(v6 + 88);
  v24 = *(_QWORD *)(v6 + 104);
  *(_QWORD *)(v6 + 88) = 0;
  *(_QWORD *)(v6 + 96) = 0;
  *(_QWORD *)(v6 + 104) = 0;
  do
  {
    v8 = v5;
    *(_OWORD *)(v5 + 112) = *(_OWORD *)v5;
    *(_QWORD *)(v5 + 128) = *(_QWORD *)(v5 + 16);
    sub_1C1CC15D0(v5 + 136, (uint64_t *)(v5 + 24));
    *(_OWORD *)(v5 + 176) = *(_OWORD *)(v5 + 64);
    *(_QWORD *)(v5 + 192) = *(_QWORD *)(v5 + 80);
    v9 = v5 + 200;
    if (*(char *)(v8 + 223) < 0)
      operator delete(*(void **)v9);
    *(_OWORD *)v9 = *(_OWORD *)(v8 + 88);
    *(_QWORD *)(v9 + 16) = *(_QWORD *)(v8 + 104);
    *(_BYTE *)(v8 + 111) = 0;
    *(_BYTE *)(v8 + 88) = 0;
    if ((__int128 *)v8 == v17)
      break;
    v5 = v8 - 112;
  }
  while (v19 < *(_QWORD *)(v8 - 96));
  v10 = v18;
  *(_QWORD *)(v8 + 16) = v19;
  *(_OWORD *)v8 = v10;
  sub_1C1CC15D0(v8 + 24, v20);
  v11 = v21;
  *(_QWORD *)(v8 + 80) = v22;
  *(_OWORD *)(v8 + 64) = v11;
  v12 = *(char *)(v8 + 111);
  v13 = v8 + 88;
  if (v12 < 0)
    operator delete(*(void **)v13);
  v14 = v23;
  *(_QWORD *)(v13 + 16) = v24;
  *(_OWORD *)v13 = v14;
  HIBYTE(v24) = 0;
  LOBYTE(v23) = 0;
  if (++v7 != 8)
  {
    sub_1C1CBFBC4((uint64_t)v20);
    v2 = v16;
    goto LABEL_16;
  }
  v4 = v6 + 112 == (_QWORD)v16;
  sub_1C1CBFBC4((uint64_t)v20);
  return v4;
}

uint64_t sub_1C1CC1560(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = *a2;
  *a2 = 0;
  *(_QWORD *)result = v2;
  *(_QWORD *)(result + 8) = a2[1];
  a2[1] = 0;
  v5 = a2[2];
  v3 = a2 + 2;
  v4 = v5;
  *(_QWORD *)(result + 16) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 16;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

void sub_1C1CC15D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  sub_1C1CC0410((_QWORD *)a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

uint64_t sub_1C1CC1670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  __int128 *v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;

  v11 = (__int128 *)a2;
  v12 = (__int128 *)a1;
  v9 = (__int128 *)a4;
  v10 = (__int128 *)a3;
  result = sub_1C1CC0D00(a1, a2, a3);
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    result = sub_1C1CC07B0(&v10, &v9);
    if (*((_QWORD *)v10 + 2) < *(_QWORD *)(a2 + 16))
    {
      result = sub_1C1CC07B0(&v11, &v10);
      if (*((_QWORD *)v11 + 2) < *(_QWORD *)(a1 + 16))
        return sub_1C1CC07B0(&v12, &v11);
    }
  }
  return result;
}

uint64_t sub_1C1CC1714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;
  __int128 *v15;

  v14 = (__int128 *)a2;
  v15 = (__int128 *)a1;
  v12 = (__int128 *)a4;
  v13 = (__int128 *)a3;
  v11 = (__int128 *)a5;
  result = sub_1C1CC1670(a1, a2, a3, a4);
  if (*(_QWORD *)(a5 + 16) < *(_QWORD *)(a4 + 16))
  {
    result = sub_1C1CC07B0(&v12, &v11);
    if (*((_QWORD *)v12 + 2) < *(_QWORD *)(a3 + 16))
    {
      result = sub_1C1CC07B0(&v13, &v12);
      if (*((_QWORD *)v13 + 2) < *(_QWORD *)(a2 + 16))
      {
        result = sub_1C1CC07B0(&v14, &v13);
        if (*((_QWORD *)v14 + 2) < *(_QWORD *)(a1 + 16))
          return sub_1C1CC07B0(&v15, &v14);
      }
    }
  }
  return result;
}

__int128 *sub_1C1CC17E8(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 *v12;
  __int128 *v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  __int128 *v18;
  __int128 *v19;

  v19 = a1;
  if (a1 != a2)
  {
    v6 = a2;
    v7 = a1;
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) / 112;
    if ((char *)a2 - (char *)a1 >= 113)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[7 * v10];
      do
      {
        sub_1C1CC1950((uint64_t)v7, a4, v9, v12);
        v12 -= 7;
        --v11;
      }
      while (v11);
    }
    v18 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      v13 = v6;
      do
      {
        if (*((_QWORD *)v13 + 2) < *((_QWORD *)v19 + 2))
        {
          sub_1C1CC07B0(&v18, &v19);
          sub_1C1CC1950((uint64_t)v19, a4, v9, v19);
          v13 = v18;
        }
        v13 += 7;
        v18 = v13;
      }
      while (v13 != a3);
      v7 = v19;
      v8 = (char *)v6 - (char *)v19;
    }
    if (v8 >= 113)
    {
      v14 = (((unint64_t)v8 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
      do
      {
        sub_1C1CC1BC4((uint64_t)v7, (uint64_t)v6, a4, v14);
        v6 -= 7;
        v15 = v14 >= 2;
        v16 = v14-- == 2;
      }
      while (!v16 && v15);
      return v18;
    }
  }
  return a3;
}

uint64_t sub_1C1CC1950(uint64_t result, uint64_t a2, uint64_t a3, __int128 *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  void **v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void **v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  uint64_t v27[5];
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = (uint64_t)a4;
    v6 = result;
    v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= 0x6DB6DB6DB6DB6DB7 * (((uint64_t)a4 - result) >> 4))
    {
      v9 = (0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4)) | 1;
      v10 = result + 112 * v9;
      if ((uint64_t)(0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4) + 2) < a3)
      {
        v11 = *(_QWORD *)(result + 112 * v9 + 16);
        v12 = *(_QWORD *)(v10 + 128);
        v10 += 112 * (v11 < v12);
        if (v11 < v12)
          v9 = 0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4) + 2;
      }
      if (*(_QWORD *)(v10 + 16) >= *((_QWORD *)a4 + 2))
      {
        v25 = *a4;
        v26 = *((_QWORD *)a4 + 2);
        sub_1C1CC1560((uint64_t)v27, (uint64_t *)a4 + 3);
        v28 = *(_OWORD *)(v5 + 64);
        v29 = *(_QWORD *)(v5 + 80);
        v30 = *(_OWORD *)(v5 + 88);
        v31 = *(_QWORD *)(v5 + 104);
        *(_QWORD *)(v5 + 88) = 0;
        *(_QWORD *)(v5 + 96) = 0;
        *(_QWORD *)(v5 + 104) = 0;
        do
        {
          v13 = v10;
          v14 = *(_OWORD *)v10;
          *(_QWORD *)(v5 + 16) = *(_QWORD *)(v10 + 16);
          *(_OWORD *)v5 = v14;
          v15 = v10 + 24;
          sub_1C1CC15D0(v5 + 24, (uint64_t *)(v10 + 24));
          v16 = *(_OWORD *)(v10 + 64);
          *(_QWORD *)(v5 + 80) = *(_QWORD *)(v10 + 80);
          *(_OWORD *)(v5 + 64) = v16;
          v17 = (void **)(v5 + 88);
          if (*(char *)(v5 + 111) < 0)
            operator delete(*v17);
          v18 = *(_OWORD *)(v13 + 88);
          *(_QWORD *)(v5 + 104) = *(_QWORD *)(v13 + 104);
          *(_OWORD *)v17 = v18;
          *(_BYTE *)(v13 + 111) = 0;
          *(_BYTE *)(v13 + 88) = 0;
          if (v7 < v9)
            break;
          v19 = (2 * v9) | 1;
          v10 = v6 + 112 * v19;
          if (2 * v9 + 2 < a3)
          {
            v20 = *(_QWORD *)(v6 + 112 * v19 + 16);
            v21 = *(_QWORD *)(v10 + 128);
            v10 += 112 * (v20 < v21);
            if (v20 < v21)
              v19 = 2 * v9 + 2;
          }
          v5 = v13;
          v9 = v19;
        }
        while (*(_QWORD *)(v10 + 16) >= v26);
        v22 = (void **)(v13 + 88);
        *(_QWORD *)(v13 + 16) = v26;
        *(_OWORD *)v13 = v25;
        sub_1C1CC15D0(v15, v27);
        v23 = v28;
        *(_QWORD *)(v13 + 80) = v29;
        *(_OWORD *)(v13 + 64) = v23;
        if (*(char *)(v13 + 111) < 0)
          operator delete(*v22);
        v24 = v30;
        *(_QWORD *)(v13 + 104) = v31;
        *(_OWORD *)v22 = v24;
        HIBYTE(v31) = 0;
        LOBYTE(v30) = 0;
        return sub_1C1CBFBC4((uint64_t)v27);
      }
    }
  }
  return result;
}

uint64_t sub_1C1CC1BC4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  void **v13;
  void **v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  void **v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22[5];
  __int128 v23;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a4 >= 2)
  {
    v7 = result;
    v20 = *(_OWORD *)result;
    v21 = *(_QWORD *)(result + 16);
    sub_1C1CC1560((uint64_t)v22, (uint64_t *)(result + 24));
    v23 = *(_OWORD *)(v7 + 64);
    v24 = *(_QWORD *)(v7 + 80);
    *(_OWORD *)__p = *(_OWORD *)(v7 + 88);
    v26 = *(_QWORD *)(v7 + 104);
    *(_QWORD *)(v7 + 88) = 0;
    *(_QWORD *)(v7 + 96) = 0;
    *(_QWORD *)(v7 + 104) = 0;
    v8 = sub_1C1CC1E30((__int128 *)v7, a3, a4);
    v9 = (__int128 *)(a2 - 112);
    v10 = (uint64_t)v8 + 24;
    if (v8 == (__int128 *)(a2 - 112))
    {
      *((_QWORD *)v8 + 2) = v21;
      *v8 = v20;
      sub_1C1CC15D0(v10, v22);
      v17 = v23;
      *((_QWORD *)v8 + 10) = v24;
      v8[4] = v17;
      v18 = (void **)v8 + 11;
      if (*((char *)v8 + 111) < 0)
        operator delete(*v18);
      v19 = *(_OWORD *)__p;
      *((_QWORD *)v8 + 13) = v26;
      *(_OWORD *)v18 = v19;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
    }
    else
    {
      v11 = *v9;
      *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 - 96);
      *v8 = v11;
      sub_1C1CC15D0(v10, (uint64_t *)(a2 - 88));
      v12 = *(_OWORD *)(a2 - 48);
      *((_QWORD *)v8 + 10) = *(_QWORD *)(a2 - 32);
      v8[4] = v12;
      v13 = (void **)v8 + 11;
      if (*((char *)v8 + 111) < 0)
        operator delete(*v13);
      v14 = (void **)(a2 - 24);
      v15 = *(_OWORD *)(a2 - 24);
      *((_QWORD *)v8 + 13) = *(_QWORD *)(a2 - 8);
      *(_OWORD *)v13 = v15;
      *(_BYTE *)(a2 - 1) = 0;
      *(_BYTE *)(a2 - 24) = 0;
      v16 = (uint64_t)(v8 + 7);
      *v9 = v20;
      *(_QWORD *)(a2 - 96) = v21;
      sub_1C1CC15D0(a2 - 88, v22);
      *(_OWORD *)(a2 - 48) = v23;
      *(_QWORD *)(a2 - 32) = v24;
      if (*(char *)(a2 - 1) < 0)
        operator delete(*v14);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      *(_QWORD *)(a2 - 8) = v26;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
      sub_1C1CC1F28(v7, v16, a3, 0x6DB6DB6DB6DB6DB7 * ((v16 - v7) >> 4));
      if (SHIBYTE(v26) < 0)
        operator delete(__p[0]);
    }
    return sub_1C1CBFBC4((uint64_t)v22);
  }
  return result;
}

void sub_1C1CC1E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

__int128 *sub_1C1CC1E30(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  void **v16;
  __int128 v17;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = v5 + 1;
    v9 = &a1[7 * v5 + 7];
    v10 = 2 * v5;
    v5 = (2 * v5) | 1;
    v11 = v10 + 2;
    if (v10 + 2 < a3)
    {
      v12 = *(_QWORD *)&a1[7 * v8 + 1];
      v13 = *((_QWORD *)v9 + 16);
      v9 += 7 * (v12 < v13);
      if (v12 < v13)
        v5 = v11;
    }
    v14 = *v9;
    *((_QWORD *)a1 + 2) = *((_QWORD *)v9 + 2);
    *a1 = v14;
    sub_1C1CC15D0((uint64_t)a1 + 24, (uint64_t *)v9 + 3);
    v15 = v9[4];
    *((_QWORD *)a1 + 10) = *((_QWORD *)v9 + 10);
    a1[4] = v15;
    v16 = (void **)a1 + 11;
    if (*((char *)a1 + 111) < 0)
      operator delete(*v16);
    v17 = *(__int128 *)((char *)v9 + 88);
    *((_QWORD *)a1 + 13) = *((_QWORD *)v9 + 13);
    *(_OWORD *)v16 = v17;
    *((_BYTE *)v9 + 111) = 0;
    *((_BYTE *)v9 + 88) = 0;
    a1 = v9;
  }
  while (v5 <= v7);
  return v9;
}

uint64_t sub_1C1CC1F28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  void **v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18[5];
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v6 = result;
    v7 = v4 >> 1;
    if (*(_QWORD *)(result + 112 * (v4 >> 1) + 16) < *(_QWORD *)(a2 - 96))
    {
      v8 = a2 - 112;
      v16 = *(_OWORD *)(a2 - 112);
      v17 = *(_QWORD *)(a2 - 96);
      sub_1C1CC1560((uint64_t)v18, (uint64_t *)(a2 - 88));
      v19 = *(_OWORD *)(a2 - 48);
      v20 = *(_QWORD *)(a2 - 32);
      v21 = *(_OWORD *)(a2 - 24);
      v22 = *(_QWORD *)(a2 - 8);
      *(_QWORD *)(a2 - 24) = 0;
      *(_QWORD *)(a2 - 16) = 0;
      *(_QWORD *)(a2 - 8) = 0;
      do
      {
        v9 = v8;
        v8 = v6 + 112 * v7;
        v10 = *(_OWORD *)v8;
        *(_QWORD *)(v9 + 16) = *(_QWORD *)(v8 + 16);
        *(_OWORD *)v9 = v10;
        sub_1C1CC15D0(v9 + 24, (uint64_t *)(v8 + 24));
        v11 = *(_OWORD *)(v8 + 64);
        *(_QWORD *)(v9 + 80) = *(_QWORD *)(v8 + 80);
        *(_OWORD *)(v9 + 64) = v11;
        v12 = (void **)(v9 + 88);
        if (*(char *)(v9 + 111) < 0)
          operator delete(*v12);
        v13 = v6 + 112 * v7;
        v14 = *(_OWORD *)(v13 + 88);
        *(_QWORD *)(v9 + 104) = *(_QWORD *)(v13 + 104);
        *(_OWORD *)v12 = v14;
        *(_BYTE *)(v8 + 111) = 0;
        *(_BYTE *)(v13 + 88) = 0;
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
      }
      while (*(_QWORD *)(v6 + 112 * v7 + 16) < v17);
      v15 = v13 + 88;
      *(_OWORD *)v8 = v16;
      *(_QWORD *)(v8 + 16) = v17;
      sub_1C1CC15D0(v8 + 24, v18);
      *(_OWORD *)(v8 + 64) = v19;
      *(_QWORD *)(v8 + 80) = v20;
      if (*(char *)(v8 + 111) < 0)
        operator delete(*(void **)v15);
      *(_OWORD *)v15 = v21;
      *(_QWORD *)(v15 + 16) = v22;
      HIBYTE(v22) = 0;
      LOBYTE(v21) = 0;
      return sub_1C1CBFBC4((uint64_t)v18);
    }
  }
  return result;
}

int *sub_1C1CC2108(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  int v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  int *result;
  _BYTE v15[12];
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  _QWORD *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1[2];
  v6 = a1[10] + v5;
  if (a2 >= v5 && v6 > a2)
  {
    *(_QWORD *)v15 = a2 - v5;
    sub_1C1CC37EC((uint64_t)(a1 + 3), (unint64_t *)v15, v15);
    a1[8] += a3;
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1C1CC8CEC((uint64_t)a1, a2, v9);
  }
  else
  {
    v8 = *__error();
    sub_1C1CB1954();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = (_QWORD *)a1[11];
      v11 = a1 + 11;
      v10 = v12;
      if (*((char *)v11 + 23) >= 0)
        v10 = v11;
      *(_DWORD *)v15 = 134218754;
      *(_QWORD *)&v15[4] = a2;
      v16 = 2048;
      v17 = v5;
      v18 = 2048;
      v19 = v6;
      v20 = 2080;
      v21 = v10;
      _os_log_debug_impl(&dword_1C1CAA000, v9, OS_LOG_TYPE_DEBUG, "Address %#llx doesn't fall into binary range [%#llx, %#llx) in %s", v15, 0x2Au);
    }
  }

  result = __error();
  *result = v8;
  return result;
}

void sub_1C1CC2270(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1C1CBFC44(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *sub_1C1CC22C4(uint64_t a1, const unsigned __int8 *a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  const unsigned __int8 **v12;
  const unsigned __int8 *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  unsigned __int8 dst[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  uuid_copy(dst, a2);
  v8 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v4 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
      if (v8 >= v9)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v12 = *(const unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = *(const unsigned __int8 **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v14 == v8)
        {
          if (!uuid_compare(i + 16, a2))
            return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  sub_1C1CC2588(a1, v8, a4, (uint64_t)dst);
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if ((((float)(v16 * (float)v9) >= v15) & ~(v9 == 0)) == 0)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_1C1CC01DC(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    **(_QWORD **)dst = *v21;
    *v21 = *(_QWORD *)dst;
  }
  else
  {
    **(_QWORD **)dst = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)dst;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (**(_QWORD **)dst)
    {
      v22 = *(_QWORD *)(**(_QWORD **)dst + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v22 >= v9)
          v22 %= v9;
      }
      else
      {
        v22 &= v9 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = *(_QWORD *)dst;
    }
  }
  i = *(const unsigned __int8 **)dst;
  *(_QWORD *)dst = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_1C1CC2644((uint64_t)dst, 0);
  return i;
}

void sub_1C1CC2568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_1C1CC2644((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

double sub_1C1CC2588@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  void *v8;
  double result;

  v7 = a1 + 16;
  v8 = operator new(0x90uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  *((_OWORD *)v8 + 1) = **a3;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 6) = 0u;
  *((_OWORD *)v8 + 7) = 0u;
  *((_OWORD *)v8 + 8) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  uuid_clear((unsigned __int8 *)v8 + 32);
  *((_QWORD *)v8 + 10) = 0;
  result = 0.0;
  *((_OWORD *)v8 + 3) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_DWORD *)v8 + 22) = 1065353216;
  *((_QWORD *)v8 + 12) = 0;
  *((_DWORD *)v8 + 26) = -1;
  *((_BYTE *)v8 + 108) = 0;
  *((_OWORD *)v8 + 7) = 0u;
  *((_OWORD *)v8 + 8) = 0u;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1C1CC262C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1C1CC2644(v1, 0);
  _Unwind_Resume(a1);
}

void sub_1C1CC2644(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_1C1CBFC80((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void sub_1C1CC2688(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = a1[1];
  if (!v6)
    goto LABEL_9;
  for (i = 0; i != v6; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v8 = (_QWORD *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v9 = a2[2];
      v8[2] = v9;
      v10 = (_QWORD *)*v8;
      v8[1] = v9;
      v11 = sub_1C1CC2790((uint64_t)a1, v9, v8 + 2);
      sub_1C1CC28E4(a1, v8, v11);
      a2 = (_QWORD *)*a2;
      v8 = v10;
      if (!v10)
        goto LABEL_9;
    }
    do
    {
      v12 = (_QWORD *)*v8;
      operator delete(v8);
      v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_1C1CC2C18(a1, a2 + 2);
      a2 = (_QWORD *)*a2;
    }
  }
}

void sub_1C1CC275C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_1C1CC277C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *sub_1C1CC2790(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  _QWORD *v16;
  int v17;
  _QWORD *result;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  int v22;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    sub_1C1CC29CC(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = (_QWORD *)*v16;
    if (!v16)
      break;
    v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      v20 = v16[1];
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && v16[2] == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *sub_1C1CC28E4(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_1C1CC29CC(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_1C1CC2AA8(a1, prime);
  }
}

void sub_1C1CC2AA8(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      sub_1C1CC01B4();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      for (i = (_QWORD *)*v7; *v7; i = (_QWORD *)*v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (_QWORD *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = i;
            v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

_QWORD *sub_1C1CC2C18(_QWORD *a1, unint64_t *a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;

  v4 = operator new(0x18uLL);
  v5 = *a2;
  v4[2] = *a2;
  *v4 = 0;
  v4[1] = v5;
  v6 = sub_1C1CC2790((uint64_t)a1, v5, v4 + 2);
  sub_1C1CC28E4(a1, v4, v6);
  return v4;
}

void sub_1C1CC2C78(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CC2C8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1C1CBFCE8(a1, *(char **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *sub_1C1CC2CE0(_QWORD *a1, const unsigned __int8 *a2)
{
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  uint64_t v8;
  const unsigned __int8 **v9;
  const unsigned __int8 *i;
  unint64_t v11;
  uuid_t dst;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  uuid_copy(dst, a2);
  v4 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v4)
    return 0;
  v5 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
  v6 = (uint8x8_t)vcnt_s8(v4);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = v6.u32[0];
  if (v6.u32[0] > 1uLL)
  {
    v8 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
    if (v5 >= *(_QWORD *)&v4)
      v8 = v5 % *(_QWORD *)&v4;
  }
  else
  {
    v8 = (*(_QWORD *)&v4 - 1) & v5;
  }
  v9 = *(const unsigned __int8 ***)(*a1 + 8 * v8);
  if (!v9)
    return 0;
  for (i = *v9; i; i = *(const unsigned __int8 **)i)
  {
    v11 = *((_QWORD *)i + 1);
    if (v11 == v5)
    {
      if (!uuid_compare(i + 16, a2))
        return i;
    }
    else
    {
      if (v7 > 1)
      {
        if (v11 >= *(_QWORD *)&v4)
          v11 %= *(_QWORD *)&v4;
      }
      else
      {
        v11 &= *(_QWORD *)&v4 - 1;
      }
      if (v11 != v8)
        return 0;
    }
  }
  return i;
}

void sub_1C1CC2E14(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1C1CBFD6C(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

_QWORD *sub_1C1CC2E68(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_1C1CC2F10();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void sub_1C1CC2F10()
{
  sub_1C1CC2F24("basic_string");
}

void sub_1C1CC2F24(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1C1CC2F74(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E7B8E290, MEMORY[0x1E0DE42D0]);
}

void sub_1C1CC2F60(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1C1CC2F74(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

uint64_t *sub_1C1CC2F98(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

uint64_t *sub_1C1CC304C(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t **v9;
  uint64_t *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD v21[3];

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 <= v6)
        v4 = v6 % v7;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4)
            break;
        }
      }
    }
  }
  sub_1C1CC3290(a1, *a2, a4, (uint64_t)v21);
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    sub_1C1CC01DC(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v4 = v6 % v7;
      else
        v4 = v6;
    }
    else
    {
      v4 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v18)
  {
    *(_QWORD *)v21[0] = *v18;
    *v18 = v21[0];
  }
  else
  {
    *(_QWORD *)v21[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v21[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v21[0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)v21[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7)
          v19 %= v7;
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v21[0];
    }
  }
  i = (uint64_t *)v21[0];
  v21[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_1C1CC33B0((uint64_t)v21, 0);
  return i;
}

void sub_1C1CC3278(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1C1CC33B0((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC3290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t result;

  v7 = a1 + 16;
  v8 = operator new(0xB0uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  result = sub_1C1CC32FC((uint64_t)(v8 + 2), *a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1C1CC32E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1C1CC33B0(v1, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC32FC(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 32) = -1;
  *(_QWORD *)(a1 + 152) = 0;
  uuid_clear((unsigned __int8 *)(a1 + 36));
  *(_QWORD *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 152) = 1065353216;
  return a1;
}

void sub_1C1CC3394(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void sub_1C1CC33B0(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_1C1CBFDA8((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

const unsigned __int8 *sub_1C1CC33F4(uint64_t a1, const unsigned __int8 *a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  const unsigned __int8 **v12;
  const unsigned __int8 *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  unsigned __int8 dst[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  uuid_copy(dst, a2);
  v8 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v4 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
      if (v8 >= v9)
        v4 = v8 % v9;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
    v12 = *(const unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = *(const unsigned __int8 **)i)
      {
        v14 = *((_QWORD *)i + 1);
        if (v14 == v8)
        {
          if (!uuid_compare(i + 16, a2))
            return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  sub_1C1CC36B4(a1, v8, a4, (uint64_t)dst);
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if ((((float)(v16 * (float)v9) >= v15) & ~(v9 == 0)) == 0)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_1C1CC01DC(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v4 = v8 % v9;
      else
        v4 = v8;
    }
    else
    {
      v4 = (v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    **(_QWORD **)dst = *v21;
    *v21 = *(_QWORD *)dst;
  }
  else
  {
    **(_QWORD **)dst = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)dst;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (**(_QWORD **)dst)
    {
      v22 = *(_QWORD *)(**(_QWORD **)dst + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v22 >= v9)
          v22 %= v9;
      }
      else
      {
        v22 &= v9 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = *(_QWORD *)dst;
    }
  }
  i = *(const unsigned __int8 **)dst;
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1C1CC3688(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **__p, uint64_t a12)
{
  if (__p)
    sub_1C1CC37A4((uint64_t)&a12, __p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C1CC36B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t result;

  v7 = a1 + 16;
  v8 = operator new(0x60uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  result = sub_1C1CC3738((uint64_t)(v8 + 2), *a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1C1CC371C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  sub_1C1CC37A4(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC3738(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  uuid_clear((unsigned __int8 *)(a1 + 40));
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  return a1;
}

void sub_1C1CC378C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1C1CC3C24((void ***)va);
  _Unwind_Resume(a1);
}

void sub_1C1CC37A4(uint64_t a1, void **__p)
{
  void **v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = __p + 4;
    sub_1C1CC3C24(&v3);
  }
  if (__p)
    operator delete(__p);
}

_QWORD *sub_1C1CC37EC(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    sub_1C1CC01DC(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1C1CC39F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1C1CC3A04(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  v11[2] = **a4;
  *((_DWORD *)v11 + 6) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    sub_1C1CC01DC(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_1C1CC3C10(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CC3C24(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 112;
        sub_1C1CC3CA8((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_1C1CC3CA8(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 111) < 0)
    operator delete(*(void **)(a2 + 88));
  return sub_1C1CBFBC4(a2 + 24);
}

uint64_t sub_1C1CC3CD8(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  void *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t *v14;

  v3 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x249249249249249)
    sub_1C1CC4008();
  if (0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 4) > v4)
    v4 = 0xDB6DB6DB6DB6DB6ELL * ((a1[2] - *a1) >> 4);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((a1[2] - *a1) >> 4)) >= 0x124924924924924)
    v6 = 0x249249249249249;
  else
    v6 = v4;
  v14 = a1 + 2;
  if (v6)
    v7 = (char *)sub_1C1CC401C((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  v10 = v7;
  v11 = &v7[112 * v3];
  v13 = &v7[112 * v6];
  sub_1C1CC3DFC((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  v12 = v11 + 112;
  sub_1C1CC3F94(a1, &v10);
  v8 = a1[1];
  sub_1C1CC41C8(&v10);
  return v8;
}

void sub_1C1CC3DE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1C1CC41C8((void **)va);
  _Unwind_Resume(a1);
}

_BYTE *sub_1C1CC3DFC(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v5;
  __int128 v6;
  _BYTE *result;
  __int128 v8;

  v5 = *a3;
  *(_QWORD *)(a2 + 16) = *((_QWORD *)a3 + 2);
  *(_OWORD *)a2 = v5;
  sub_1C1CC3E94(a2 + 24, (uint64_t)a3 + 24);
  v6 = a3[4];
  *(_QWORD *)(a2 + 80) = *((_QWORD *)a3 + 10);
  *(_OWORD *)(a2 + 64) = v6;
  result = (_BYTE *)(a2 + 88);
  if (*((char *)a3 + 111) < 0)
    return sub_1C1CC3F08(result, *((void **)a3 + 11), *((_QWORD *)a3 + 12));
  v8 = *(__int128 *)((char *)a3 + 88);
  *(_QWORD *)(a2 + 104) = *((_QWORD *)a3 + 13);
  *(_OWORD *)result = v8;
  return result;
}

void sub_1C1CC3E80(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1C1CBFBC4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC3E94(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_1C1CC01DC(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    sub_1C1CC37EC(a1, i + 2, i + 2);
  return a1;
}

void sub_1C1CC3EF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1C1CBFBC4(v1);
  _Unwind_Resume(a1);
}

void *sub_1C1CC3F08(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_1C1CC2F10();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_1C1CC3F94(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1C1CC4064((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void sub_1C1CC4008()
{
  sub_1C1CC2F24("vector");
}

void *sub_1C1CC401C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL)
    sub_1C1CC01B4();
  return operator new(112 * a2);
}

uint64_t sub_1C1CC4064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[3];
  char v16;
  __int128 v17;
  __int128 v18;

  v7 = a7;
  *(_QWORD *)&v18 = a6;
  *((_QWORD *)&v18 + 1) = a7;
  v17 = v18;
  v15[0] = a1;
  v15[1] = &v17;
  v15[2] = &v18;
  v16 = 0;
  if (a3 == a5)
  {
    v13 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v10 = *(_OWORD *)(v9 - 112);
      *(_QWORD *)(v7 - 96) = *(_QWORD *)(v9 - 96);
      *(_OWORD *)(v7 - 112) = v10;
      sub_1C1CC1560(v7 - 88, (uint64_t *)(v9 - 88));
      v11 = *(_OWORD *)(v9 - 48);
      *(_QWORD *)(v7 - 32) = *(_QWORD *)(v9 - 32);
      *(_OWORD *)(v7 - 48) = v11;
      v12 = *(_OWORD *)(v9 - 24);
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(v9 - 8);
      *(_OWORD *)(v7 - 24) = v12;
      *(_QWORD *)(v9 - 24) = 0;
      *(_QWORD *)(v9 - 16) = 0;
      *(_QWORD *)(v9 - 8) = 0;
      v7 = *((_QWORD *)&v18 + 1) - 112;
      *((_QWORD *)&v18 + 1) -= 112;
      v9 -= 112;
    }
    while (v9 != a5);
    v13 = v18;
  }
  v16 = 1;
  sub_1C1CC4144((uint64_t)v15);
  return v13;
}

uint64_t sub_1C1CC4144(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1C1CC4178((uint64_t *)a1);
  return a1;
}

uint64_t *sub_1C1CC4178(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result[2] + 8);
  v2 = *(_QWORD *)(result[1] + 8);
  if (v1 != v2)
  {
    v3 = *result;
    do
    {
      result = (uint64_t *)sub_1C1CC3CA8(v3, v1);
      v1 += 112;
    }
    while (v1 != v2);
  }
  return result;
}

void **sub_1C1CC41C8(void **a1)
{
  sub_1C1CC41F8((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

uint64_t sub_1C1CC41F8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 8);
  v1 = *(_QWORD *)(result + 16);
  if (v1 != v2)
  {
    v3 = result;
    do
    {
      v4 = *(_QWORD *)(v3 + 32);
      *(_QWORD *)(v3 + 16) = v1 - 112;
      result = sub_1C1CC3CA8(v4, v1 - 112);
      v1 = *(_QWORD *)(v3 + 16);
    }
    while (v1 != v2);
  }
  return result;
}

uint64_t sub_1C1CC423C(uint64_t a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  __int128 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;

  v8 = a1 + 16;
  v9 = *(void **)a1;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4) < a4)
  {
    sub_1C1CC43DC((void **)a1);
    if (a4 > 0x249249249249249)
      sub_1C1CC4008();
    v10 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4);
    if (v10 <= a4)
      v10 = a4;
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4)) >= 0x124924924924924)
      v11 = 0x249249249249249;
    else
      v11 = v10;
    sub_1C1CC4448((_QWORD *)a1, v11);
    result = sub_1C1CC449C(v8, a2, a3, *(_QWORD *)(a1 + 8));
    goto LABEL_11;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 4) < a4)
  {
    v13 = &a2[(uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 4];
    sub_1C1CC4660((uint64_t)&v17, (uint64_t)a2, (uint64_t)v13, (uint64_t)v9);
    result = sub_1C1CC449C(v8, v13, a3, *(_QWORD *)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = result;
    return result;
  }
  result = sub_1C1CC4660((uint64_t)&v18, (uint64_t)a2, (uint64_t)a3, (uint64_t)v9);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 112;
      result = sub_1C1CC3CA8(v8, v16);
    }
    while (v16 != v15);
  }
  *(_QWORD *)(a1 + 8) = v15;
  return result;
}

void sub_1C1CC43CC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1C1CC43D4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1C1CC43DC(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 112;
        sub_1C1CC3CA8((uint64_t)(a1 + 2), v3);
      }
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_1C1CC4448(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x24924924924924ALL)
    sub_1C1CC4008();
  result = (char *)sub_1C1CC401C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[112 * v4];
  return result;
}

uint64_t sub_1C1CC449C(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  __int128 *v6;
  _QWORD v9[3];
  char v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v11 = a4;
  v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      sub_1C1CC4544(a1, v4, v6);
      v6 += 7;
      v4 = v12 + 112;
      v12 += 112;
    }
    while (v6 != a3);
  }
  v10 = 1;
  sub_1C1CC45DC((uint64_t)v9);
  return v4;
}

void sub_1C1CC4530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1C1CC45DC((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_BYTE *sub_1C1CC4544(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v5;
  __int128 v6;
  _BYTE *result;
  __int128 v8;

  v5 = *a3;
  *(_QWORD *)(a2 + 16) = *((_QWORD *)a3 + 2);
  *(_OWORD *)a2 = v5;
  sub_1C1CC3E94(a2 + 24, (uint64_t)a3 + 24);
  v6 = a3[4];
  *(_QWORD *)(a2 + 80) = *((_QWORD *)a3 + 10);
  *(_OWORD *)(a2 + 64) = v6;
  result = (_BYTE *)(a2 + 88);
  if (*((char *)a3 + 111) < 0)
    return sub_1C1CC3F08(result, *((void **)a3 + 11), *((_QWORD *)a3 + 12));
  v8 = *(__int128 *)((char *)a3 + 88);
  *(_QWORD *)(a2 + 104) = *((_QWORD *)a3 + 13);
  *(_OWORD *)result = v8;
  return result;
}

void sub_1C1CC45C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1C1CBFBC4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC45DC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1C1CC4610((uint64_t *)a1);
  return a1;
}

uint64_t *sub_1C1CC4610(uint64_t *result)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)result[1];
  v1 = (uint64_t *)result[2];
  v3 = *v1;
  v4 = *v2;
  if (*v1 != *v2)
  {
    v5 = *result;
    do
    {
      v3 -= 112;
      result = (uint64_t *)sub_1C1CC3CA8(v5, v3);
    }
    while (v3 != v4);
  }
  return result;
}

uint64_t sub_1C1CC4660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  if (a2 == a3)
    return a2;
  v5 = a3;
  v6 = a2 + 56;
  do
  {
    v7 = v6 - 56;
    v8 = *(_OWORD *)(v6 - 56);
    *(_QWORD *)(a4 + 16) = *(_QWORD *)(v6 - 40);
    *(_OWORD *)a4 = v8;
    if (a4 != v6 - 56)
    {
      *(_DWORD *)(a4 + 56) = *(_DWORD *)v6;
      sub_1C1CC2688((_QWORD *)(a4 + 24), *(_QWORD **)(v6 - 16), 0);
    }
    v9 = *(_OWORD *)(v6 + 8);
    *(_QWORD *)(a4 + 80) = *(_QWORD *)(v6 + 24);
    *(_OWORD *)(a4 + 64) = v9;
    std::string::operator=((std::string *)(a4 + 88), (const std::string *)(v6 + 32));
    a4 += 112;
    v6 += 112;
  }
  while (v7 + 112 != v5);
  return v5;
}

_QWORD *sub_1C1CC4708(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = a1 + 16;
  v14 = (char *)operator new(0x50uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v7;
  *((_QWORD *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_QWORD *)v14 + 9) = 0;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *((_DWORD *)v14 + 8) = -1;
  *((_DWORD *)v14 + 18) = 1065353216;
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_1C1CC01DC(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  v11 = (_QWORD *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_1C1CC4984((uint64_t)v24, 0);
  return v11;
}

void sub_1C1CC496C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1C1CC4984((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_1C1CC4984(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_1C1CBFBC4((uint64_t)v2 + 40);
    operator delete(v2);
  }
}

void *sub_1C1CC49C8(uint64_t a1, const unsigned __int8 *a2, _OWORD *a3)
{
  uint64_t v3;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  void **v11;
  void *i;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uuid_t dst;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  uuid_copy(dst, a2);
  v7 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      v3 = (*(_QWORD *)dst + 8) ^ *(_QWORD *)dst;
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = *(void **)i)
      {
        v13 = *((_QWORD *)i + 1);
        if (v13 == v7)
        {
          if (!uuid_compare((const unsigned __int8 *)i + 16, a2))
            return i;
        }
        else
        {
          if (v10 > 1)
          {
            if (v13 >= v8)
              v13 %= v8;
          }
          else
          {
            v13 &= v8 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v7;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  *((_OWORD *)i + 1) = *a3;
  v15 = *(float *)(a1 + 32);
  if ((((float)(v15 * (float)v8) >= v14) & ~(v8 == 0)) == 0)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    sub_1C1CC01DC(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *(_QWORD *)i = *v21;
LABEL_37:
    *v21 = i;
    goto LABEL_38;
  }
  *(_QWORD *)i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v20 + 8 * v3) = a1 + 16;
  if (*(_QWORD *)i)
  {
    v22 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_37;
  }
LABEL_38:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1C1CC4C34(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

__int128 *sub_1C1CC4C50(__int128 *result, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4, char a5)
{
  __int128 *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  char v17;
  __int128 *v18;
  char v19;
  int v20;
  uint64_t (*v21)(__int128 *, __int128 *);
  __int128 *v22;
  __int128 *v23;
  __int128 *v24;

  v7 = a2;
  v8 = result;
  v23 = a2;
  v24 = result;
  while (2)
  {
    v9 = 1 - a4;
LABEL_3:
    v10 = (char *)v7 - (char *)v8;
    v11 = 0x6DB6DB6DB6DB6DB7 * (v7 - v8);
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v21 = *a3;
        v23 = v7 - 7;
        result = (__int128 *)((uint64_t (*)(void))v21)();
        if ((_DWORD)result)
          return (__int128 *)sub_1C1CC07B0(&v24, &v23);
        return result;
      case 3uLL:
        v23 = v7 - 7;
        return (__int128 *)sub_1C1CC5370(v8, v8 + 7, v7 - 7, a3);
      case 4uLL:
        v23 = v7 - 7;
        return (__int128 *)sub_1C1CC5CC0(v8, v8 + 7, v8 + 14, v7 - 7, a3);
      case 5uLL:
        v23 = v7 - 7;
        return (__int128 *)sub_1C1CC5D74(v8, v8 + 7, v8 + 14, v8 + 21, v7 - 7, a3);
      default:
        if (v10 <= 2687)
        {
          if ((a5 & 1) != 0)
            return (__int128 *)sub_1C1CC4F40((uint64_t)v8, (uint64_t)v7, (uint64_t (**)(uint64_t, uint64_t))a3);
          else
            return (__int128 *)sub_1C1CC5170((uint64_t)v8, (uint64_t)v7, (uint64_t (**)(uint64_t, uint64_t))a3);
        }
        if (v9 == 1)
        {
          if (v8 != v7)
            return sub_1C1CC5E50(v8, v7, v7, (unsigned int (**)(uint64_t, uint64_t))a3);
          return result;
        }
        v12 = v11 >> 1;
        v13 = v7 - 7;
        if ((unint64_t)v10 < 0x3801)
        {
          sub_1C1CC5370(&v8[7 * (v11 >> 1)], v8, v13, a3);
          if ((a5 & 1) != 0)
          {
LABEL_11:
            v7 = v23;
            goto LABEL_12;
          }
        }
        else
        {
          sub_1C1CC5370(v8, &v8[7 * (v11 >> 1)], v13, a3);
          v14 = 7 * v12;
          v15 = 112 * v12 - 112;
          v16 = v23;
          sub_1C1CC5370(v24 + 7, (__int128 *)((char *)v24 + v15), v23 - 14, a3);
          sub_1C1CC5370(v24 + 14, &v24[v14 + 7], v16 - 21, a3);
          sub_1C1CC5370((__int128 *)((char *)v24 + v15), &v24[v14], &v24[v14 + 7], a3);
          v22 = &v24[v14];
          sub_1C1CC07B0(&v24, &v22);
          if ((a5 & 1) != 0)
            goto LABEL_11;
        }
        v17 = ((uint64_t (*)(__int128 *))*a3)(v24 - 7);
        v7 = v23;
        if ((v17 & 1) == 0)
        {
          result = sub_1C1CC5448((uint64_t)v24, v23, (unsigned int (**)(__int128 *))a3);
          v8 = result;
          goto LABEL_20;
        }
LABEL_12:
        v18 = sub_1C1CC5700((uint64_t)v24, v7, (uint64_t (**)(void))a3);
        if ((v19 & 1) == 0)
          goto LABEL_19;
        v20 = sub_1C1CC59BC(v24, v18, a3);
        v8 = v18 + 7;
        result = (__int128 *)sub_1C1CC59BC(v18 + 7, v7, a3);
        if (!(_DWORD)result)
        {
          if (v20)
          {
            v24 = v18 + 7;
            goto LABEL_18;
          }
LABEL_19:
          result = (__int128 *)sub_1C1CC4C50(v24, v18, a3, -v9, a5 & 1);
          v8 = v18 + 7;
LABEL_20:
          a5 = 0;
          v24 = v8;
          a4 = -v9;
          continue;
        }
        if ((v20 & 1) == 0)
        {
          v23 = v18;
          v8 = v24;
          v7 = v18;
LABEL_18:
          ++v9;
          goto LABEL_3;
        }
        return result;
    }
  }
}

uint64_t sub_1C1CC4F40(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  __int128 v19;
  uint64_t v20;
  uint64_t v21[5];
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result != a2)
  {
    v3 = a2;
    v4 = result;
    v5 = result + 112;
    if (result + 112 != a2)
    {
      v7 = 0;
      v8 = result;
      do
      {
        v9 = v5;
        result = (*a3)(v5, v8);
        if ((_DWORD)result)
        {
          v19 = *(_OWORD *)v9;
          v20 = *(_QWORD *)(v9 + 16);
          sub_1C1CC1560((uint64_t)v21, (uint64_t *)(v8 + 136));
          v22 = *(_OWORD *)(v8 + 176);
          v23 = *(_QWORD *)(v8 + 192);
          v24 = *(_OWORD *)(v8 + 200);
          v25 = *(_QWORD *)(v8 + 216);
          *(_QWORD *)(v8 + 200) = 0;
          *(_QWORD *)(v8 + 208) = 0;
          v10 = v7;
          *(_QWORD *)(v8 + 216) = 0;
          while (1)
          {
            v11 = v10;
            v12 = v4 + v10;
            *(_OWORD *)(v12 + 112) = *(_OWORD *)(v4 + v10);
            *(_QWORD *)(v12 + 128) = *(_QWORD *)(v4 + v10 + 16);
            sub_1C1CC15D0(v4 + v10 + 136, (uint64_t *)(v4 + v10 + 24));
            *(_OWORD *)(v12 + 176) = *(_OWORD *)(v12 + 64);
            *(_QWORD *)(v12 + 192) = *(_QWORD *)(v12 + 80);
            v13 = (void **)(v12 + 200);
            if (*(char *)(v12 + 223) < 0)
              operator delete(*v13);
            *(_OWORD *)v13 = *(_OWORD *)(v12 + 88);
            *(_QWORD *)(v12 + 216) = *(_QWORD *)(v12 + 104);
            *(_BYTE *)(v12 + 111) = 0;
            *(_BYTE *)(v12 + 88) = 0;
            if (!v11)
              break;
            v14 = (*a3)((uint64_t)&v19, v4 + v11 - 112);
            v10 = v11 - 112;
            if ((v14 & 1) == 0)
            {
              v15 = v4 + v11;
              goto LABEL_12;
            }
          }
          v15 = v4;
LABEL_12:
          *(_OWORD *)v15 = v19;
          *(_QWORD *)(v15 + 16) = v20;
          v16 = v4 + v11;
          sub_1C1CC15D0(v4 + v11 + 24, v21);
          *(_QWORD *)(v16 + 80) = v23;
          *(_OWORD *)(v16 + 64) = v22;
          v17 = (void **)(v4 + v11 + 88);
          if (*(char *)(v15 + 111) < 0)
            operator delete(*v17);
          *(_OWORD *)v17 = v24;
          *(_QWORD *)(v4 + v11 + 104) = v25;
          HIBYTE(v25) = 0;
          LOBYTE(v24) = 0;
          result = sub_1C1CBFBC4((uint64_t)v21);
          v3 = a2;
        }
        v5 = v9 + 112;
        v7 += 112;
        v8 = v9;
      }
      while (v9 + 112 != v3);
    }
  }
  return result;
}

void sub_1C1CC5154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C1CC5170(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  char *v7;
  uint64_t v8;
  char *v9;
  void **v10;
  char v11;
  void **v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15[5];
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result != a2)
  {
    v4 = result;
    v5 = result + 112;
    if (result + 112 != a2)
    {
      v7 = (char *)(result + 223);
      do
      {
        v8 = v5;
        result = (*a3)(v5, v4);
        if ((_DWORD)result)
        {
          v13 = *(_OWORD *)v8;
          v14 = *(_QWORD *)(v8 + 16);
          sub_1C1CC1560((uint64_t)v15, (uint64_t *)(v4 + 136));
          v16 = *(_OWORD *)(v4 + 176);
          v17 = *(_QWORD *)(v4 + 192);
          v18 = *(_OWORD *)(v4 + 200);
          v19 = *(_QWORD *)(v4 + 216);
          *(_QWORD *)(v4 + 200) = 0;
          *(_QWORD *)(v4 + 208) = 0;
          v9 = v7;
          *(_QWORD *)(v4 + 216) = 0;
          do
          {
            *(_OWORD *)(v9 - 111) = *(_OWORD *)(v9 - 223);
            *(_QWORD *)(v9 - 95) = *(_QWORD *)(v9 - 207);
            sub_1C1CC15D0((uint64_t)(v9 - 87), (uint64_t *)(v9 - 199));
            *(_OWORD *)(v9 - 47) = *(_OWORD *)(v9 - 159);
            *(_QWORD *)(v9 - 31) = *(_QWORD *)(v9 - 143);
            v10 = (void **)(v9 - 23);
            if (*v9 < 0)
              operator delete(*v10);
            *(_OWORD *)v10 = *(_OWORD *)(v9 - 135);
            *(_QWORD *)(v9 - 7) = *(_QWORD *)(v9 - 119);
            *(v9 - 112) = 0;
            *(v9 - 135) = 0;
            v11 = (*a3)((uint64_t)&v13, (uint64_t)(v9 - 335));
            v9 -= 112;
          }
          while ((v11 & 1) != 0);
          *(_OWORD *)(v9 - 111) = v13;
          *(_QWORD *)(v9 - 95) = v14;
          sub_1C1CC15D0((uint64_t)(v9 - 87), v15);
          *(_OWORD *)(v9 - 47) = v16;
          *(_QWORD *)(v9 - 31) = v17;
          v12 = (void **)(v9 - 23);
          if (*v9 < 0)
            operator delete(*v12);
          *(_OWORD *)v12 = v18;
          *(_QWORD *)(v9 - 7) = v19;
          HIBYTE(v19) = 0;
          LOBYTE(v18) = 0;
          result = sub_1C1CBFBC4((uint64_t)v15);
        }
        v5 = v8 + 112;
        v7 += 112;
        v4 = v8;
      }
      while (v8 + 112 != a2);
    }
  }
  return result;
}

void sub_1C1CC5354(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C1CC5370(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t (**a4)(__int128 *, __int128 *))
{
  char v7;
  uint64_t result;
  __int128 **v9;
  __int128 **v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;

  v12 = a2;
  v13 = a1;
  v11 = a3;
  v7 = (*a4)(a2, a1);
  result = (*a4)(a3, a2);
  if ((v7 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    sub_1C1CC07B0(&v12, &v11);
    if (!(*a4)(v12, v13))
      return 1;
    v9 = &v13;
    v10 = &v12;
    goto LABEL_9;
  }
  if (!(_DWORD)result)
  {
    sub_1C1CC07B0(&v13, &v12);
    if (!(*a4)(v11, v12))
      return 1;
    v9 = &v12;
    v10 = &v11;
LABEL_9:
    sub_1C1CC07B0(v9, v10);
    return 2;
  }
  sub_1C1CC07B0(&v13, &v11);
  return 1;
}

__int128 *sub_1C1CC5448(uint64_t a1, __int128 *a2, unsigned int (**a3)(__int128 *))
{
  uint64_t v6;
  __int128 *v7;
  __int128 *v8;
  int v9;
  __int128 *v10;
  __int128 *v11;
  void **v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void **v18;
  __int128 v19;
  __int128 *v20;
  __int128 *v22;
  __int128 *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26[5];
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v23 = (__int128 *)a1;
  v24 = *(_OWORD *)a1;
  v25 = *(_QWORD *)(a1 + 16);
  v6 = a1 + 24;
  sub_1C1CC1560((uint64_t)v26, (uint64_t *)(a1 + 24));
  v27 = *(_OWORD *)(a1 + 64);
  v28 = *(_QWORD *)(a1 + 80);
  v29 = *(_OWORD *)(a1 + 88);
  v30 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  if ((((uint64_t (*)(__int128 *, __int128 *))*a3)(&v24, a2 - 7) & 1) != 0)
  {
    v7 = (__int128 *)a1;
    do
    {
      v7 += 7;
      v23 = v7;
    }
    while ((((uint64_t (*)(__int128 *, __int128 *))*a3)(&v24, v7) & 1) == 0);
  }
  else
  {
    v8 = (__int128 *)(a1 + 112);
    do
    {
      v7 = v8;
      v23 = v8;
      if (v8 >= v22)
        break;
      v9 = ((uint64_t (*)(__int128 *, __int128 *))*a3)(&v24, v8);
      v8 = v7 + 7;
    }
    while (!v9);
  }
  v10 = v22;
  if (v7 < v22)
  {
    do
    {
      v10 -= 7;
      v22 = v10;
    }
    while ((((uint64_t (*)(__int128 *, __int128 *))*a3)(&v24, v10) & 1) != 0);
    v7 = v23;
  }
  if (v7 < v10)
  {
    do
    {
      sub_1C1CC07B0(&v23, &v22);
      do
        v23 += 7;
      while (!(*a3)(&v24));
      do
        v22 -= 7;
      while ((((uint64_t (*)(__int128 *))*a3)(&v24) & 1) != 0);
      v7 = v23;
    }
    while (v23 < v22);
  }
  v11 = v7 - 7;
  if (v7 - 7 != (__int128 *)a1)
  {
    v12 = (void **)(a1 + 88);
    v13 = *v11;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v7 - 12);
    *(_OWORD *)a1 = v13;
    sub_1C1CC15D0(v6, (uint64_t *)v7 - 11);
    v14 = *(v7 - 3);
    *(_QWORD *)(a1 + 80) = *((_QWORD *)v7 - 4);
    *(_OWORD *)(a1 + 64) = v14;
    if (*(char *)(a1 + 111) < 0)
      operator delete(*v12);
    v15 = *(__int128 *)((char *)v7 - 24);
    *(_QWORD *)(a1 + 104) = *((_QWORD *)v7 - 1);
    *(_OWORD *)v12 = v15;
    *((_BYTE *)v7 - 1) = 0;
    *((_BYTE *)v7 - 24) = 0;
  }
  v16 = v24;
  *((_QWORD *)v7 - 12) = v25;
  *v11 = v16;
  sub_1C1CC15D0((uint64_t)v7 - 88, v26);
  v17 = v27;
  *((_QWORD *)v7 - 4) = v28;
  *(v7 - 3) = v17;
  v18 = (void **)v7 - 3;
  if (*((char *)v7 - 1) < 0)
    operator delete(*v18);
  v19 = v29;
  *((_QWORD *)v7 - 1) = v30;
  *(_OWORD *)v18 = v19;
  HIBYTE(v30) = 0;
  LOBYTE(v29) = 0;
  v20 = v23;
  sub_1C1CBFBC4((uint64_t)v26);
  return v20;
}

void sub_1C1CC56D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

__int128 *sub_1C1CC5700(uint64_t a1, __int128 *a2, uint64_t (**a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  __int128 *v8;
  __int128 *v9;
  int v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t (*v13)(void);
  __int128 *v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void **v21;
  __int128 v22;
  __int128 *v24;
  __int128 *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28[5];
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  v26 = *(_OWORD *)a1;
  v27 = *(_QWORD *)(a1 + 16);
  v5 = a1 + 24;
  sub_1C1CC1560((uint64_t)v28, (uint64_t *)(a1 + 24));
  v6 = 0;
  v29 = *(_OWORD *)(a1 + 64);
  v30 = *(_QWORD *)(a1 + 80);
  v32 = *(_QWORD *)(a1 + 104);
  v7 = (void **)(a1 + 88);
  v31 = *(_OWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  do
  {
    v25 = (__int128 *)(a1 + v6 + 112);
    v6 += 112;
  }
  while (((*a3)() & 1) != 0);
  v8 = v24;
  if (v6 == 112)
  {
    v12 = (__int128 *)(a1 + 112);
    do
    {
      if (v12 >= v8)
        break;
      v13 = *a3;
      v8 -= 7;
      v24 = v8;
    }
    while ((((uint64_t (*)(__int128 *, __int128 *))v13)(v8, &v26) & 1) == 0);
    v11 = a1 + 64;
  }
  else
  {
    v9 = v24 - 7;
    do
    {
      v24 = v9;
      v10 = ((uint64_t (*)(__int128 *, __int128 *))*a3)(v9, &v26);
      v9 -= 7;
    }
    while (!v10);
    v11 = a1 + 64;
    v12 = v25;
  }
  v14 = v12;
  if (v12 < v24)
  {
    do
    {
      sub_1C1CC07B0(&v25, &v24);
      do
        v25 += 7;
      while (((*a3)() & 1) != 0);
      do
        v24 -= 7;
      while (!(*a3)());
      v14 = v25;
    }
    while (v25 < v24);
  }
  v15 = v14 - 7;
  if (v14 - 7 != (__int128 *)a1)
  {
    v16 = *v15;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v14 - 12);
    *(_OWORD *)a1 = v16;
    sub_1C1CC15D0(v5, (uint64_t *)v14 - 11);
    v17 = *(v14 - 3);
    *(_QWORD *)(v11 + 16) = *((_QWORD *)v14 - 4);
    *(_OWORD *)v11 = v17;
    if (*(char *)(a1 + 111) < 0)
      operator delete(*v7);
    v18 = *(__int128 *)((char *)v14 - 24);
    *(_QWORD *)(a1 + 104) = *((_QWORD *)v14 - 1);
    *(_OWORD *)v7 = v18;
    *((_BYTE *)v14 - 1) = 0;
    *((_BYTE *)v14 - 24) = 0;
  }
  v19 = v26;
  *((_QWORD *)v14 - 12) = v27;
  *v15 = v19;
  sub_1C1CC15D0((uint64_t)v14 - 88, v28);
  v20 = v29;
  *((_QWORD *)v14 - 4) = v30;
  *(v14 - 3) = v20;
  v21 = (void **)v14 - 3;
  if (*((char *)v14 - 1) < 0)
    operator delete(*v21);
  v22 = v31;
  *((_QWORD *)v14 - 1) = v32;
  *(_OWORD *)v21 = v22;
  HIBYTE(v32) = 0;
  LOBYTE(v31) = 0;
  sub_1C1CBFBC4((uint64_t)v28);
  return v14 - 7;
}

void sub_1C1CC5998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC59BC(__int128 *a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  _BOOL8 v6;
  uint64_t (*v7)(__int128 *, __int128 *);
  __int128 *v8;
  __int128 *v9;
  int v10;
  __int128 *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  void **v15;
  __int128 v16;
  __int128 *v18;
  __int128 *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22[5];
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v19 = a1;
  v6 = 1;
  switch(0x6DB6DB6DB6DB6DB7 * (a2 - a1))
  {
    case 0:
    case 1:
      return v6;
    case 2:
      v7 = *a3;
      v18 = a2 - 7;
      if (((unsigned int (*)(__int128 *))v7)(a2 - 7))
        sub_1C1CC07B0(&v19, &v18);
      return v6;
    case 3:
      sub_1C1CC5370(a1, a1 + 7, a2 - 7, a3);
      return v6;
    case 4:
      sub_1C1CC5CC0(a1, a1 + 7, a1 + 14, a2 - 7, a3);
      return v6;
    case 5:
      sub_1C1CC5D74(a1, a1 + 7, a1 + 14, a1 + 21, a2 - 7, a3);
      return v6;
    default:
      v8 = a1 + 14;
      sub_1C1CC5370(a1, a1 + 7, a1 + 14, a3);
      v9 = a1 + 21;
      if (a1 + 21 == a2)
        return 1;
      v10 = 0;
      break;
  }
  while (!(*a3)(v9, v8))
  {
LABEL_16:
    v8 = v9;
    v9 += 7;
    if (v9 == v18)
      return 1;
  }
  v20 = *v9;
  v21 = *((_QWORD *)v9 + 2);
  sub_1C1CC1560((uint64_t)v22, (uint64_t *)v9 + 3);
  v23 = v9[4];
  v24 = *((_QWORD *)v9 + 10);
  v25 = *(__int128 *)((char *)v9 + 88);
  v26 = *((_QWORD *)v9 + 13);
  *((_QWORD *)v9 + 11) = 0;
  *((_QWORD *)v9 + 12) = 0;
  *((_QWORD *)v9 + 13) = 0;
  do
  {
    v11 = v8;
    v8[7] = *v8;
    *((_QWORD *)v8 + 16) = *((_QWORD *)v8 + 2);
    sub_1C1CC15D0((uint64_t)v8 + 136, (uint64_t *)v8 + 3);
    v8[11] = v8[4];
    *((_QWORD *)v8 + 24) = *((_QWORD *)v8 + 10);
    v12 = (char *)v8 + 200;
    if (*((char *)v11 + 223) < 0)
      operator delete(*(void **)v12);
    *(_OWORD *)v12 = *(__int128 *)((char *)v11 + 88);
    *((_QWORD *)v12 + 2) = *((_QWORD *)v11 + 13);
    *((_BYTE *)v11 + 111) = 0;
    *((_BYTE *)v11 + 88) = 0;
    if (v11 == v19)
      break;
    v8 = v11 - 7;
  }
  while (((*a3)(&v20, v11 - 7) & 1) != 0);
  v13 = v20;
  *((_QWORD *)v11 + 2) = v21;
  *v11 = v13;
  sub_1C1CC15D0((uint64_t)v11 + 24, v22);
  v14 = v23;
  *((_QWORD *)v11 + 10) = v24;
  v11[4] = v14;
  v15 = (void **)v11 + 11;
  if (*((char *)v11 + 111) < 0)
    operator delete(*v15);
  v16 = v25;
  *((_QWORD *)v11 + 13) = v26;
  *(_OWORD *)v15 = v16;
  HIBYTE(v26) = 0;
  LOBYTE(v25) = 0;
  if (++v10 != 8)
  {
    sub_1C1CBFBC4((uint64_t)v22);
    goto LABEL_16;
  }
  v6 = v9 + 7 == v18;
  sub_1C1CBFBC4((uint64_t)v22);
  return v6;
}

void sub_1C1CC5CA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C1CC5CC0(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4, uint64_t (**a5)(__int128 *, __int128 *))
{
  uint64_t result;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;

  v13 = a2;
  v14 = a1;
  v11 = a4;
  v12 = a3;
  sub_1C1CC5370(a1, a2, a3, a5);
  result = (*a5)(a4, a3);
  if ((_DWORD)result)
  {
    sub_1C1CC07B0(&v12, &v11);
    result = (*a5)(v12, a2);
    if ((_DWORD)result)
    {
      sub_1C1CC07B0(&v13, &v12);
      result = (*a5)(v13, a1);
      if ((_DWORD)result)
        return sub_1C1CC07B0(&v14, &v13);
    }
  }
  return result;
}

uint64_t sub_1C1CC5D74(__int128 *a1, __int128 *a2, __int128 *a3, __int128 *a4, __int128 *a5, uint64_t (**a6)(__int128 *, __int128 *))
{
  uint64_t result;
  __int128 *v13;
  __int128 *v14;
  __int128 *v15;
  __int128 *v16;
  __int128 *v17;

  v16 = a2;
  v17 = a1;
  v14 = a4;
  v15 = a3;
  v13 = a5;
  sub_1C1CC5CC0(a1, a2, a3, a4, a6);
  result = (*a6)(a5, a4);
  if ((_DWORD)result)
  {
    sub_1C1CC07B0(&v14, &v13);
    result = (*a6)(v14, a3);
    if ((_DWORD)result)
    {
      sub_1C1CC07B0(&v15, &v14);
      result = (*a6)(v15, a2);
      if ((_DWORD)result)
      {
        sub_1C1CC07B0(&v16, &v15);
        result = (*a6)(v16, a1);
        if ((_DWORD)result)
          return sub_1C1CC07B0(&v17, &v16);
      }
    }
  }
  return result;
}

__int128 *sub_1C1CC5E50(__int128 *a1, __int128 *a2, __int128 *a3, unsigned int (**a4)(uint64_t, uint64_t))
{
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 *v12;
  __int128 *v13;
  unint64_t v14;
  __int128 *v17;
  __int128 *v18;

  v18 = a1;
  if (a1 != a2)
  {
    v6 = a2;
    v7 = a1;
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) / 112;
    if ((char *)a2 - (char *)a1 >= 113)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[7 * v10];
      do
      {
        sub_1C1CC5FB4((uint64_t)v7, a4, v9, v12);
        v12 -= 7;
        --v11;
      }
      while (v11);
    }
    v17 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      v13 = v6;
      do
      {
        if ((*a4)((uint64_t)v13, (uint64_t)v18))
        {
          sub_1C1CC07B0(&v17, &v18);
          sub_1C1CC5FB4((uint64_t)v18, a4, v9, v18);
        }
        v13 = v17 + 7;
        v17 = v13;
      }
      while (v13 != a3);
      v7 = v18;
      v8 = (char *)v6 - (char *)v18;
    }
    if (v8 >= 113)
    {
      v14 = (((unint64_t)v8 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
      do
      {
        sub_1C1CC6258((uint64_t)v7, (uint64_t)v6, a4, v14);
        v6 -= 7;
      }
      while (v14-- > 2);
      return v17;
    }
  }
  return a3;
}

uint64_t sub_1C1CC5FB4(uint64_t result, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3, __int128 *a4)
{
  unint64_t v4;
  __int128 *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  void **v17;
  __int128 v18;
  uint64_t v19;
  void **v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26[5];
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v6 = result;
    v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= 0x6DB6DB6DB6DB6DB7 * (((uint64_t)a4 - result) >> 4))
    {
      v10 = (0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4)) | 1;
      v11 = result + 112 * v10;
      v12 = 0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - result) >> 4) + 2;
      if (v12 < a3 && (*a2)(result + 112 * v10, v11 + 112))
      {
        v11 += 112;
        v10 = v12;
      }
      result = ((uint64_t (*)(uint64_t, __int128 *))*a2)(v11, v5);
      if ((result & 1) == 0)
      {
        v24 = *v5;
        v25 = *((_QWORD *)v5 + 2);
        sub_1C1CC1560((uint64_t)v26, (uint64_t *)v5 + 3);
        v27 = v5[4];
        v28 = *((_QWORD *)v5 + 10);
        v29 = *(__int128 *)((char *)v5 + 88);
        v30 = *((_QWORD *)v5 + 13);
        *((_QWORD *)v5 + 11) = 0;
        *((_QWORD *)v5 + 12) = 0;
        *((_QWORD *)v5 + 13) = 0;
        do
        {
          v13 = v11;
          v14 = *(_OWORD *)v11;
          *((_QWORD *)v5 + 2) = *(_QWORD *)(v11 + 16);
          *v5 = v14;
          v15 = v11 + 24;
          sub_1C1CC15D0((uint64_t)v5 + 24, (uint64_t *)(v11 + 24));
          v16 = *(_OWORD *)(v11 + 64);
          *((_QWORD *)v5 + 10) = *(_QWORD *)(v11 + 80);
          v5[4] = v16;
          v17 = (void **)v5 + 11;
          if (*((char *)v5 + 111) < 0)
            operator delete(*v17);
          v18 = *(_OWORD *)(v11 + 88);
          *((_QWORD *)v5 + 13) = *(_QWORD *)(v11 + 104);
          *(_OWORD *)v17 = v18;
          *(_BYTE *)(v11 + 111) = 0;
          *(_BYTE *)(v11 + 88) = 0;
          if (v7 < v10)
            break;
          v19 = (2 * v10) | 1;
          v11 = v6 + 112 * v19;
          v10 = 2 * v10 + 2;
          if (v10 >= a3)
          {
            v10 = v19;
          }
          else if ((*a2)(v6 + 112 * v19, v11 + 112))
          {
            v11 += 112;
          }
          else
          {
            v10 = v19;
          }
          v5 = (__int128 *)v13;
        }
        while (!(*a2)(v11, (uint64_t)&v24));
        v20 = (void **)(v13 + 88);
        v21 = v24;
        *(_QWORD *)(v13 + 16) = v25;
        *(_OWORD *)v13 = v21;
        sub_1C1CC15D0(v15, v26);
        v22 = v27;
        *(_QWORD *)(v13 + 80) = v28;
        *(_OWORD *)(v13 + 64) = v22;
        if (*(char *)(v13 + 111) < 0)
          operator delete(*v20);
        v23 = v29;
        *(_QWORD *)(v13 + 104) = v30;
        *(_OWORD *)v20 = v23;
        HIBYTE(v30) = 0;
        LOBYTE(v29) = 0;
        return sub_1C1CBFBC4((uint64_t)v26);
      }
    }
  }
  return result;
}

void sub_1C1CC6244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC6258(uint64_t result, uint64_t a2, unsigned int (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  void **v13;
  void **v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  void **v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22[5];
  __int128 v23;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a4 >= 2)
  {
    v7 = result;
    v20 = *(_OWORD *)result;
    v21 = *(_QWORD *)(result + 16);
    sub_1C1CC1560((uint64_t)v22, (uint64_t *)(result + 24));
    v23 = *(_OWORD *)(v7 + 64);
    v24 = *(_QWORD *)(v7 + 80);
    *(_OWORD *)__p = *(_OWORD *)(v7 + 88);
    v26 = *(_QWORD *)(v7 + 104);
    *(_QWORD *)(v7 + 88) = 0;
    *(_QWORD *)(v7 + 96) = 0;
    *(_QWORD *)(v7 + 104) = 0;
    v8 = sub_1C1CC64C4(v7, a3, a4);
    v9 = (__int128 *)(a2 - 112);
    v10 = v8 + 24;
    if (v8 == a2 - 112)
    {
      *(_QWORD *)(v8 + 16) = v21;
      *(_OWORD *)v8 = v20;
      sub_1C1CC15D0(v10, v22);
      v17 = v23;
      *(_QWORD *)(v8 + 80) = v24;
      *(_OWORD *)(v8 + 64) = v17;
      v18 = (void **)(v8 + 88);
      if (*(char *)(v8 + 111) < 0)
        operator delete(*v18);
      v19 = *(_OWORD *)__p;
      *(_QWORD *)(v8 + 104) = v26;
      *(_OWORD *)v18 = v19;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
    }
    else
    {
      v11 = *v9;
      *(_QWORD *)(v8 + 16) = *(_QWORD *)(a2 - 96);
      *(_OWORD *)v8 = v11;
      sub_1C1CC15D0(v10, (uint64_t *)(a2 - 88));
      v12 = *(_OWORD *)(a2 - 48);
      *(_QWORD *)(v8 + 80) = *(_QWORD *)(a2 - 32);
      *(_OWORD *)(v8 + 64) = v12;
      v13 = (void **)(v8 + 88);
      if (*(char *)(v8 + 111) < 0)
        operator delete(*v13);
      v14 = (void **)(a2 - 24);
      v15 = *(_OWORD *)(a2 - 24);
      *(_QWORD *)(v8 + 104) = *(_QWORD *)(a2 - 8);
      *(_OWORD *)v13 = v15;
      *(_BYTE *)(a2 - 1) = 0;
      *(_BYTE *)(a2 - 24) = 0;
      v16 = v8 + 112;
      *v9 = v20;
      *(_QWORD *)(a2 - 96) = v21;
      sub_1C1CC15D0(a2 - 88, v22);
      *(_OWORD *)(a2 - 48) = v23;
      *(_QWORD *)(a2 - 32) = v24;
      if (*(char *)(a2 - 1) < 0)
        operator delete(*v14);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      *(_QWORD *)(a2 - 8) = v26;
      HIBYTE(v26) = 0;
      LOBYTE(__p[0]) = 0;
      sub_1C1CC65CC(v7, v16, (uint64_t (**)(uint64_t, uint64_t))a3, 0x6DB6DB6DB6DB6DB7 * ((v16 - v7) >> 4));
      if (SHIBYTE(v26) < 0)
        operator delete(__p[0]);
    }
    return sub_1C1CBFBC4((uint64_t)v22);
  }
  return result;
}

void sub_1C1CC64B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1C1CC64C4(uint64_t a1, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  void **v14;
  __int128 v15;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = a1 + 112 * v6 + 112;
    v10 = 2 * v6;
    v6 = (2 * v6) | 1;
    v11 = v10 + 2;
    if (v10 + 2 < a3 && (*a2)(v9, v9 + 112))
    {
      v9 += 112;
      v6 = v11;
    }
    v12 = *(_OWORD *)v9;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v9 + 16);
    *(_OWORD *)a1 = v12;
    sub_1C1CC15D0(a1 + 24, (uint64_t *)(v9 + 24));
    v13 = *(_OWORD *)(v9 + 64);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(v9 + 80);
    *(_OWORD *)(a1 + 64) = v13;
    v14 = (void **)(a1 + 88);
    if (*(char *)(a1 + 111) < 0)
      operator delete(*v14);
    v15 = *(_OWORD *)(v9 + 88);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(v9 + 104);
    *(_OWORD *)v14 = v15;
    *(_BYTE *)(v9 + 111) = 0;
    *(_BYTE *)(v9 + 88) = 0;
    a1 = v9;
  }
  while (v6 <= v8);
  return v9;
}

uint64_t sub_1C1CC65CC(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  void **v15;
  __int128 v16;
  void **v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20[5];
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v7 = result;
    v8 = v4 >> 1;
    v9 = result + 112 * (v4 >> 1);
    v10 = (__int128 *)(a2 - 112);
    result = (*a3)(v9, a2 - 112);
    if ((_DWORD)result)
    {
      v18 = *v10;
      v19 = *((_QWORD *)v10 + 2);
      sub_1C1CC1560((uint64_t)v20, (uint64_t *)(a2 - 88));
      v21 = *(_OWORD *)(a2 - 48);
      v22 = *(_QWORD *)(a2 - 32);
      v23 = *(_OWORD *)(a2 - 24);
      v24 = *(_QWORD *)(a2 - 8);
      *(_QWORD *)(a2 - 24) = 0;
      *(_QWORD *)(a2 - 16) = 0;
      *(_QWORD *)(a2 - 8) = 0;
      do
      {
        v11 = v9;
        v12 = *(_OWORD *)v9;
        *((_QWORD *)v10 + 2) = *(_QWORD *)(v9 + 16);
        *v10 = v12;
        v13 = v9 + 24;
        sub_1C1CC15D0((uint64_t)v10 + 24, (uint64_t *)(v9 + 24));
        v14 = *(_OWORD *)(v9 + 64);
        *((_QWORD *)v10 + 10) = *(_QWORD *)(v9 + 80);
        v10[4] = v14;
        v15 = (void **)v10 + 11;
        if (*((char *)v10 + 111) < 0)
          operator delete(*v15);
        v16 = *(_OWORD *)(v11 + 88);
        *((_QWORD *)v10 + 13) = *(_QWORD *)(v11 + 104);
        *(_OWORD *)v15 = v16;
        *(_BYTE *)(v11 + 111) = 0;
        *(_BYTE *)(v11 + 88) = 0;
        if (!v8)
          break;
        v8 = (v8 - 1) >> 1;
        v9 = v7 + 112 * v8;
        v10 = (__int128 *)v11;
      }
      while (((*a3)(v9, (uint64_t)&v18) & 1) != 0);
      v17 = (void **)(v11 + 88);
      *(_OWORD *)v11 = v18;
      *(_QWORD *)(v11 + 16) = v19;
      sub_1C1CC15D0(v13, v20);
      *(_OWORD *)(v11 + 64) = v21;
      *(_QWORD *)(v11 + 80) = v22;
      if (*(char *)(v11 + 111) < 0)
        operator delete(*v17);
      *(_OWORD *)v17 = v23;
      *(_QWORD *)(v11 + 104) = v24;
      HIBYTE(v24) = 0;
      LOBYTE(v23) = 0;
      return sub_1C1CBFBC4((uint64_t)v20);
    }
  }
  return result;
}

void sub_1C1CC67BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_1C1CBDAF8((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *sub_1C1CC67D0(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1C1CC2F10();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1C1CC6880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Failed to remove compressed file: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAD2C4();
}

void sub_1C1CC68EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Error getting file descriptor: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAD2C4();
}

void sub_1C1CC6958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Error getting fd: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAD2C4();
}

void sub_1C1CC69C4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  archive_errno();
  v6 = 134218498;
  v7 = a2;
  v8 = 1024;
  v9 = v3;
  v10 = 2082;
  v11 = sub_1C1CAD2B8();
  _os_log_error_impl(&dword_1C1CAA000, a3, OS_LOG_TYPE_ERROR, "Error writing data to: %zd byte written with err_num: %{errno}d, err_string: %{public}s", (uint8_t *)&v6, 0x1Cu);
}

void sub_1C1CC6A78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Failed to remove original file after compression: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAD2C4();
}

void sub_1C1CC6AE4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C1CAA000, a2, OS_LOG_TYPE_ERROR, "Error creating compressed file (archive_write_free): %i", (uint8_t *)v2, 8u);
}

void sub_1C1CC6B58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2D0();
  sub_1C1CAD2E8();
  sub_1C1CAD2B8();
  sub_1C1CAD25C();
  sub_1C1CAD294(&dword_1C1CAA000, v0, v1, "Error creating compressed file (archive_write_close): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
  sub_1C1CAD2A8();
}

void sub_1C1CC6BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Error reading data: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAD2C4();
}

void sub_1C1CC6C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2D0();
  sub_1C1CAD2E8();
  sub_1C1CAD2B8();
  sub_1C1CAD25C();
  sub_1C1CAD294(&dword_1C1CAA000, v0, v1, "Error creating compressed file (archive_write_header): %i, err_num: %{errorno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
  sub_1C1CAD2A8();
}

void sub_1C1CC6CA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Error stating original file: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAD2C4();
}

void sub_1C1CC6D10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2D0();
  sub_1C1CAD2E8();
  sub_1C1CAD2B8();
  sub_1C1CAD25C();
  sub_1C1CAD294(&dword_1C1CAA000, v0, v1, "Error creating compressed file (archive_write_open_fd): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
  sub_1C1CAD2A8();
}

void sub_1C1CC6D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2D0();
  sub_1C1CAD2E8();
  sub_1C1CAD2B8();
  sub_1C1CAD25C();
  sub_1C1CAD294(&dword_1C1CAA000, v0, v1, "Error creating compressed file (archive_write_set_format_pax): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
  sub_1C1CAD2A8();
}

void sub_1C1CC6DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2D0();
  sub_1C1CAD2E8();
  sub_1C1CAD2B8();
  sub_1C1CAD25C();
  sub_1C1CAD294(&dword_1C1CAA000, v0, v1, "Error creating compressed file (archive_write_set_options): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
  sub_1C1CAD2A8();
}

void sub_1C1CC6E60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2D0();
  sub_1C1CAD2E8();
  sub_1C1CAD2B8();
  sub_1C1CAD25C();
  sub_1C1CAD294(&dword_1C1CAA000, v0, v1, "Error creating compressed file (archive_write_set_compression_gzip): %i, err_num: %{errno}d, err_string: %{public}s", v2, v3, v4, v5, v6);
  sub_1C1CAD2A8();
}

void sub_1C1CC6ED0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C1CAE004(&dword_1C1CAA000, a1, a3, "Unable to allocate a config with default settings", a5, a6, a7, a8, 0);
  sub_1C1CAE014();
}

void sub_1C1CC6F00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C1CAE004(&dword_1C1CAA000, a1, a3, "Could not create default config", a5, a6, a7, a8, 0);
  sub_1C1CAE014();
}

void sub_1C1CC6F30()
{
  sub_1C1CADFFC();
  _os_crash();
  __break(1u);
}

void sub_1C1CC6F44(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_1C1CB115C(&dword_1C1CAA000, a2, a3, "Failed to get IOReport channels: %@", (uint8_t *)&v4);
  sub_1C1CB1148();
}

void sub_1C1CC6FB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "No IOReport channels found", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC6FDC(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_1C1CB115C(&dword_1C1CAA000, a2, a3, "Failed to create IOReport samples: %@", (uint8_t *)&v4);
  sub_1C1CB1148();
}

void sub_1C1CC7048(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_1C1CB115C(&dword_1C1CAA000, a2, a3, "Failed to subscribe to IOReport channels: %@", (uint8_t *)&v4);
  sub_1C1CB1148();
}

void sub_1C1CC70B4()
{
  uint64_t v0;
  os_log_t v1;

  sub_1C1CB11DC();
  sub_1C1CB1168(&dword_1C1CAA000, v0, v1, "Unable to serialize tailspin metadata dictionary to plist (%@) - %@");
  sub_1C1CB1148();
}

void sub_1C1CC7114(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_1C1CB11C4();
  sub_1C1CB120C(v2);
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, a1, v3, "ktrace_file_append_chunk(TAILSPIN_METADATA_CHUNK) failed with error %s", v4);
  sub_1C1CB1190();
}

void sub_1C1CC7188()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Persona: failed gathering managed persona", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC71B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Failed to get installed root info kern.roots_installed: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CB1148();
}

void sub_1C1CC7224()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, v0, v1, "Error opening/closing darwin session: %@", v2);
  sub_1C1CB1148();
}

void sub_1C1CC7288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Unable to get vfs.vnstats.vn_dealloc_level: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CB1148();
}

void sub_1C1CC72F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Unable to get kern.maxvnodes: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CB1148();
}

void sub_1C1CC7368()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Unable to get kern.free_vnodes: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CB1148();
}

void sub_1C1CC73D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CAD2E0();
  sub_1C1CAD2F0();
  sub_1C1CAD280(&dword_1C1CAA000, v0, v1, "Unable to get kern.num_vnodes: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CB1148();
}

void sub_1C1CC7448()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "Country code not found!", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7474()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB11B8();
  sub_1C1CB11CC(&dword_1C1CAA000, v0, v1, "Country code found: %@", v2, v3, v4, v5, v6);
  sub_1C1CB1148();
}

void sub_1C1CC74D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Preferred languages are not found!", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7500()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB11B8();
  sub_1C1CB11CC(&dword_1C1CAA000, v0, v1, "Preferred languages found: %@", v2, v3, v4, v5, v6);
  sub_1C1CB1148();
}

void sub_1C1CC7560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Keyboards are not of Class type NSArray!", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC758C(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C1CAA000, log, OS_LOG_TYPE_ERROR, "Keyboards are not of Class type NSString!", buf, 2u);
}

void sub_1C1CC75C8(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109378;
  v2[1] = qword_1EF718C60;
  v3 = 2080;
  v4 = a1;
  _os_log_debug_impl(&dword_1C1CAA000, a2, OS_LOG_TYPE_DEBUG, "Shared cache fragmentation OS Cryptex File Extents count is %d for file: (\"%s\")", (uint8_t *)v2, 0x12u);
  sub_1C1CB1148();
}

void sub_1C1CC764C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB11C4();
  sub_1C1CB11F4();
  sub_1C1CB117C(&dword_1C1CAA000, v0, v1, "FileExtent: error opening \"%s\": %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CB1190();
}

void sub_1C1CC76BC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, v0, v1, "FileExtent: no extents for \"%s\" (empty file)\n", v2);
  sub_1C1CB1148();
}

void sub_1C1CC7720()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1C1CB11B8();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_1C1CB1168(&dword_1C1CAA000, v0, v1, "FileExtent: 0 contigbytes fcntl() at offset %lld out of %lld", v2, v3);
  sub_1C1CB1148();
}

void sub_1C1CC778C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1C1CB11C4();
  v0 = __error();
  sub_1C1CB120C(v0);
  sub_1C1CB117C(&dword_1C1CAA000, v1, v2, "FileExtent: error in fcntl() call errno: %d : %s", v3, v4, v5, v6, 2u);
  sub_1C1CB1190();
}

void sub_1C1CC7810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB11C4();
  sub_1C1CB11F4();
  sub_1C1CB117C(&dword_1C1CAA000, v0, v1, "FileExtent: failed to get file size for \"%s\": %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CB1190();
}

void sub_1C1CC7880()
{
  uint64_t v0;
  os_log_t v1;

  sub_1C1CB11DC();
  sub_1C1CB1168(&dword_1C1CAA000, v0, v1, "Unable to serialize dictionary to plist (%@) - %@");
  sub_1C1CB1148();
}

void sub_1C1CC78E0(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_1C1CB11C4();
  sub_1C1CB120C(v2);
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, a1, v3, "ktrace_file_append_chunk(TAILSPIN_SYMBOLS_CHUNK_TAG) failed with error %s", v4);
  sub_1C1CB1190();
}

void sub_1C1CC7954()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Logarchive path is invalid", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7980()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Logarchive does not exist at specified path", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC79AC(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  sub_1C1CB1150(&dword_1C1CAA000, a2, a3, "Unable to start a symbolication session. ktrace_start() returned %d", (uint8_t *)v3);
  sub_1C1CAE014();
}

void sub_1C1CC7A14(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  sub_1C1CB1150(&dword_1C1CAA000, a2, a3, "Unable to set ktrace file to symbolication session. ktrace_set_ktrace_file() returned %d", (uint8_t *)v3);
  sub_1C1CAE014();
}

void sub_1C1CC7A7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "tailspin has been interrupted during symbolication - wrapping up...", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Found the preferred languages array but contents are not NSString", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7AD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C1CAE004(&dword_1C1CAA000, a1, a3, "Unable to get the min bg timer period from sysctl - setting to default value", a5, a6, a7, a8, 0);
}

void sub_1C1CC7B08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C1CAE004(&dword_1C1CAA000, a1, a3, "Unable to get the min bg PET timer period from sysctl - setting to default values", a5, a6, a7, a8, 0);
}

void sub_1C1CC7B3C()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_1C1CC7B54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "Successfully saved the file, now augmenting it", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7B80(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C1CB1150(&dword_1C1CAA000, a3, (uint64_t)a3, "Unable to get current system config: %{errno}d", (uint8_t *)a2);
}

void sub_1C1CC7BC0(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C1CB1150(&dword_1C1CAA000, a3, (uint64_t)a3, "Unable to open memstream to print current system config: %{errnod}d", (uint8_t *)a2);
}

void sub_1C1CC7C00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Current system config description is empty", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7C2C(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C1CB1150(&dword_1C1CAA000, a3, (uint64_t)a3, "Unable to print current system config: %{errnod}d", (uint8_t *)a2);
}

void sub_1C1CC7C6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Save was not successful, dumping out current ktrace/kperf configuration:", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7C9C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1C1CAA000, log, OS_LOG_TYPE_ERROR, "Unable to serialize resampled stacks dictionary (%@) - %@", (uint8_t *)&v4, 0x16u);
  sub_1C1CB1148();
}

void sub_1C1CC7D24(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C1CAA000, log, OS_LOG_TYPE_ERROR, "ktrace_file_append_chunk(TAILSPIN_RESAMPLED_STACKS_CHUNK_TAG) failed with error %s", buf, 0xCu);
}

void sub_1C1CC7D68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB8004();
  sub_1C1CB7FF4(&dword_1C1CAA000, v0, v1, "Unable to determine main binary of target process [%d]", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7DC8(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  sub_1C1CB8044(&dword_1C1CAA000, a4, a3, "Main binary %{public}@ not found in target process [%d]", (uint8_t *)a2);

}

void sub_1C1CC7E24(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  *(_DWORD *)a1 = 134217984;
  *(double *)(a1 + 4) = a4;
  sub_1C1CB8050(&dword_1C1CAA000, a2, a3, "Done parsing in %.2fs", (uint8_t *)a1);
}

void sub_1C1CC7E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "Parsing file for main binary and truncated stacks", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7E88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "Parsing file for truncated stacks", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7EB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "Parsing file for main binary", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7EE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB8004();
  sub_1C1CB7FF4(&dword_1C1CAA000, v0, v1, "Unable to use existing ktrace buffer: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC7F40(unint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  double v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = (double)a1 / 1000000000.0;
  v5 = 1024;
  v6 = 5;
  sub_1C1CB8044(&dword_1C1CAA000, a2, a3, "Tailspin requested with max time %.1fs in the future, restricting to %ds into the future", (uint8_t *)&v3);
  sub_1C1CB1148();
}

void sub_1C1CC7FC8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_DWORD *)(a1 + 60);
  v5 = 134218498;
  v6 = a2;
  v7 = 2082;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  _os_log_error_impl(&dword_1C1CAA000, log, OS_LOG_TYPE_ERROR, "Saved %{bytes}lld tailspin on behalf of %{public}s [%d] (augment failed)", (uint8_t *)&v5, 0x1Cu);
}

void sub_1C1CC8060(uint64_t a1, int *a2, uint64_t a3, NSObject *a4)
{
  int v4;

  v4 = *a2;
  *(_DWORD *)a3 = 136446466;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
  sub_1C1CB8044(&dword_1C1CAA000, a4, a3, "Unable to fstat %{public}s's saved tailspin file: %{errno}d", (uint8_t *)a3);
}

void sub_1C1CC80B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB8004();
  sub_1C1CB7FF4(&dword_1C1CAA000, v0, v1, "Unable to get earliest ktrace timestamp: %{errno}d", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC8110()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "Did initial fsync", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC813C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB8004();
  sub_1C1CB7FF4(&dword_1C1CAA000, v0, v1, "No ktrace flatbuffer for target pid [%d]", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC819C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB8004();
  sub_1C1CB7FF4(&dword_1C1CAA000, v0, v1, "No load info in ktrace flatbuffer for target pid [%d]", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC81FC(uint8_t *a1, int *a2, uint64_t *a3, NSObject *a4)
{
  unsigned __int16 *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v4 > 0xAu && (v5 = v4[5]) != 0)
    v6 = *(_QWORD *)((char *)a2 + v5);
  else
    v6 = -1;
  *(_DWORD *)a1 = 134217984;
  *a3 = v6;
  sub_1C1CB8050(&dword_1C1CAA000, a4, (uint64_t)a3, "No macho for symbol owner at %#llx", a1);
}

void sub_1C1CC8264()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB8004();
  sub_1C1CB7FF4(&dword_1C1CAA000, v0, v1, "ktrace flatbuffer for target pid [%d] failed verification", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC82C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB8004();
  sub_1C1CB7FF4(&dword_1C1CAA000, v0, v1, "Failed to fetch load infos for [%d] from live process", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC8324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "KDREADCURTHRMAP sysctl failed", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC8350()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  sub_1C1CB8010();
  sub_1C1CB8030(&dword_1C1CAA000, v0, v1, "[%d] %s, but no cache to throw out", v2, v3);
  sub_1C1CB1148();
}

void sub_1C1CC83C4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  sub_1C1CB8010();
  sub_1C1CB8030(&dword_1C1CAA000, v0, v1, "[%d] %s, throwing out cache", v2, v3);
  sub_1C1CB1148();
}

void sub_1C1CC8438(int *a1, NSObject *a2)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1C1CAA000, a2, OS_LOG_TYPE_ERROR, "Unable to get current ktrace configured_by for state %d: %{errno}d", (uint8_t *)v5, 0xEu);
  sub_1C1CB1190();
}

void sub_1C1CC84CC(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1C1CB1150(&dword_1C1CAA000, a1, v3, "Unable to get current ktrace state: %{errno}d", (uint8_t *)v4);
  sub_1C1CB1148();
}

void sub_1C1CC854C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Server-client version mismatch: config sizes are different", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC8578()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Unable to get config from server", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC85A4(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, a2, v3, "Unable to communicate with tailspin server: %s", v4);
  sub_1C1CB1190();
}

void sub_1C1CC8624(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1C1CB1150(&dword_1C1CAA000, a1, v3, "tailspin check: unable to check kdebug config %{errno}d", (uint8_t *)v4);
  sub_1C1CB1148();
}

void sub_1C1CC86A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "tailspin check: tailspin is running", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC86D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "tailspin check: trace is not enabled", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC86FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CB11A8(&dword_1C1CAA000, v0, v1, "tailspin check: trace is not background mode", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC8728(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, a2, v4, "Unable to create plist out of options - %s", v5);

  sub_1C1CB1190();
}

void sub_1C1CC87B0(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C1CB1150(&dword_1C1CAA000, a3, (uint64_t)a3, "Unable to open saved ktrace file for augmenting: %{errno}d", (uint8_t *)a2);
}

void sub_1C1CC87F0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(*(_QWORD *)a1 + 24);
  v4[0] = 67109120;
  v4[1] = v3;
  sub_1C1CB1150(&dword_1C1CAA000, a2, a3, "Unable to get earliest/latest wall time: %{errno}d", (uint8_t *)v4);
  sub_1C1CAE014();
}

void sub_1C1CC8860()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Unable to gather trial info", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC888C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, v0, v1, "Unable to serialize trial dict: %@", v2);
  sub_1C1CB1148();
}

void sub_1C1CC88F0(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C1CB1150(&dword_1C1CAA000, a3, (uint64_t)a3, "Unable to append trial dict: %{errno}d", (uint8_t *)a2);
}

void sub_1C1CC8930(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_1C1CBB208(&dword_1C1CAA000, a2, a3, "Found %lu active trial rollouts", (uint8_t *)a1);
}

void sub_1C1CC8968()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, v0, v1, "Unable to determine active trial rollouts: %@", v2);
  sub_1C1CB1148();
}

void sub_1C1CC89CC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_1C1CBB208(&dword_1C1CAA000, a2, a3, "Found %lu active trial experiments", (uint8_t *)a1);
}

void sub_1C1CC8A04()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1C1CB11B8();
  sub_1C1CB115C(&dword_1C1CAA000, v0, v1, "Unable to determine active trial experiments: %@", v2);
  sub_1C1CB1148();
}

void sub_1C1CC8A68(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_1C1CB1150(&dword_1C1CAA000, a3, (uint64_t)a3, "Unable to append Ariadne plists: %{errno}d", (uint8_t *)a2);
}

void sub_1C1CC8AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1C1CB119C();
  sub_1C1CAE004(&dword_1C1CAA000, v0, v1, "Unable to allocate tailspin connection", v2, v3, v4, v5, v6);
  sub_1C1CAE014();
}

void sub_1C1CC8AD4(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TrialLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("libtailspin_client.m"), 37, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1C1CC8B50()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTRIAllocationStatusClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("libtailspin_client.m"), 38, CFSTR("Unable to find class %s"), "TRIAllocationStatus");

  __break(1u);
}

void sub_1C1CC8BC8()
{
  __assert_rtn("-[TSPSaveMeasurements _stopRecordingTimeForPhase:]", "TSPSaveMeasurements.m", 211, "startTime != nil");
}

void sub_1C1CC8BF0()
{
  _os_crash();
  __break(1u);
}

void sub_1C1CC8C08(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  sub_1C1CB8044(&dword_1C1CAA000, a3, (uint64_t)a3, "Failed to parse dscsym data for shared cache %s: %d", (uint8_t *)&v3);
}

void sub_1C1CC8C84()
{
  _os_crash();
  __break(1u);
}

void sub_1C1CC8C9C(uint64_t a1, int *a2, uint64_t a3, NSObject *a4)
{
  int v4;

  v4 = *a2;
  *(_DWORD *)a3 = 136315394;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
  sub_1C1CB8044(&dword_1C1CAA000, a4, a3, "Unable to save symbols for binary %s: %{errno}d", (uint8_t *)a3);
}

void sub_1C1CC8CEC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 88);
  v3 = a1 + 88;
  v4 = v5;
  if (*(char *)(v3 + 23) >= 0)
    v4 = v3;
  v6 = 134218242;
  v7 = a2;
  v8 = 2080;
  v9 = v4;
  _os_log_debug_impl(&dword_1C1CAA000, log, OS_LOG_TYPE_DEBUG, "Address %#llx is in binary %s", (uint8_t *)&v6, 0x16u);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFDictionaryRef IOCopySystemLoadAdvisoryDetailed(void)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBAE00]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1E0DE0290]();
}

uint64_t IOReportChannelGetFormat()
{
  return MEMORY[0x1E0DE0298]();
}

uint64_t IOReportChannelGetGroup()
{
  return MEMORY[0x1E0DE02A0]();
}

uint64_t IOReportCopyChannelsForDrivers()
{
  return MEMORY[0x1E0DE02C8]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1E0DE02F8]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x1E0DE0310]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x1E0DE0318]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1E0DE0338]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1E0DE0360]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x1E0D1BCF8]();
}

uint64_t SAResampleThreads()
{
  return MEMORY[0x1E0D8BE88]();
}

uint64_t SASecondsFromMachTimeUsingLiveTimebase()
{
  return MEMORY[0x1E0D8BE90]();
}

uint64_t SignpostSupportAllowlistedStringSetForCurrentDevice()
{
  return MEMORY[0x1E0D97688]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E7B8E2A8(__p);
}

uint64_t operator delete()
{
  return off_1E7B8E2B0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7B8E2B8(__sz);
}

uint64_t operator new()
{
  return off_1E7B8E2C0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1E0C80C80]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
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

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x1E0DE3DB8]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1E0DE3DC8]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1E0DE3DD0]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x1E0DE3E08]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1E0DE3E20]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1E0DE3E58]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1E0DE3FB0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1E0DE3FC0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x1E0DE4020]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x1E0DE4050]();
}

uint64_t archive_write_set_options()
{
  return MEMORY[0x1E0DE4070]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dscsym_iterate_buffer()
{
  return MEMORY[0x1E0DE57D0]();
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kpdecode_cursor_free()
{
  return MEMORY[0x1E0DDC440]();
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1E0C83A50]();
}

uint64_t ktrace_add_stackshot_flags()
{
  return MEMORY[0x1E0DDC468]();
}

uint64_t ktrace_chunk_copy_plist()
{
  return MEMORY[0x1E0DDC478]();
}

uint64_t ktrace_chunk_is_64_bit()
{
  return MEMORY[0x1E0DDC480]();
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x1E0DDC490]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x1E0DDC498]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x1E0DDC4A8]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x1E0DDC4B8]();
}

uint64_t ktrace_chunks()
{
  return MEMORY[0x1E0DDC4C8]();
}

uint64_t ktrace_config_create_current()
{
  return MEMORY[0x1E0DDC4E0]();
}

uint64_t ktrace_config_destroy()
{
  return MEMORY[0x1E0DDC4F0]();
}

uint64_t ktrace_config_get_owner_kind()
{
  return MEMORY[0x1E0DDC4F8]();
}

uint64_t ktrace_config_kdebug_get_state()
{
  return MEMORY[0x1E0DDC508]();
}

uint64_t ktrace_config_print_description()
{
  return MEMORY[0x1E0DDC540]();
}

uint64_t ktrace_dumpbuffer_address_space_pid()
{
  return MEMORY[0x1E0DDC560]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x1E0DDC580]();
}

uint64_t ktrace_file_append_chunk()
{
  return MEMORY[0x1E0DDC590]();
}

uint64_t ktrace_file_append_live_ariadne_signpost_specs()
{
  return MEMORY[0x1E0DDC598]();
}

uint64_t ktrace_file_append_log_content_from_store()
{
  return MEMORY[0x1E0DDC5A0]();
}

uint64_t ktrace_file_close()
{
  return MEMORY[0x1E0DDC5A8]();
}

uint64_t ktrace_file_earliest_timestamp()
{
  return MEMORY[0x1E0DDC5B0]();
}

uint64_t ktrace_file_earliest_walltime()
{
  return MEMORY[0x1E0DDC5B8]();
}

uint64_t ktrace_file_ktrace_event_count()
{
  return MEMORY[0x1E0DDC5C0]();
}

uint64_t ktrace_file_latest_walltime()
{
  return MEMORY[0x1E0DDC5C8]();
}

uint64_t ktrace_file_open_fd()
{
  return MEMORY[0x1E0DDC5D0]();
}

uint64_t ktrace_get_pid_for_thread()
{
  return MEMORY[0x1E0DDC620]();
}

uint64_t ktrace_kperf()
{
  return MEMORY[0x1E0DDC638]();
}

uint64_t ktrace_session_create()
{
  return MEMORY[0x1E0DDC6B8]();
}

uint64_t ktrace_session_destroy()
{
  return MEMORY[0x1E0DDC6C0]();
}

uint64_t ktrace_session_set_event_names_enabled()
{
  return MEMORY[0x1E0DDC6D8]();
}

uint64_t ktrace_set_command_argv()
{
  return MEMORY[0x1E0DDC6E8]();
}

uint64_t ktrace_set_completion_handler()
{
  return MEMORY[0x1E0DDC6F8]();
}

uint64_t ktrace_set_execnames_enabled()
{
  return MEMORY[0x1E0DDC708]();
}

uint64_t ktrace_set_ktrace_file()
{
  return MEMORY[0x1E0DDC718]();
}

uint64_t ktrace_set_post_processing_handler()
{
  return MEMORY[0x1E0DDC720]();
}

uint64_t ktrace_set_reason()
{
  return MEMORY[0x1E0DDC728]();
}

uint64_t ktrace_set_signal_handler()
{
  return MEMORY[0x1E0DDC730]();
}

uint64_t ktrace_set_thread_exit_handler()
{
  return MEMORY[0x1E0DDC738]();
}

uint64_t ktrace_set_trigger_kind()
{
  return MEMORY[0x1E0DDC740]();
}

uint64_t ktrace_set_use_existing()
{
  return MEMORY[0x1E0DDC748]();
}

uint64_t ktrace_set_writing_filter()
{
  return MEMORY[0x1E0DDC750]();
}

uint64_t ktrace_stackshot()
{
  return MEMORY[0x1E0DDC758]();
}

uint64_t ktrace_start()
{
  return MEMORY[0x1E0DDC760]();
}

uint64_t ktrace_start_writing_fd()
{
  return MEMORY[0x1E0DDC770]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x1E0C84498](__bufp, __sizep);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
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

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t trace_parse_filter()
{
  return MEMORY[0x1E0DDC778]();
}

uint64_t trace_print_filter()
{
  return MEMORY[0x1E0DDC780]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

