int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  uint32_t v7;
  int v8;
  va_list va;

  va_start(va, format);
  v7 = _asl_evaluate_send(client, msg, level);
  if ((v7 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v7 & 0x80000) != 0)
    {
      v8 = _asl_lib_vlog_text(client, v7, msg, format, va);
      goto LABEL_8;
    }
  }
  else if ((v7 & 0x1A0000) != 0)
  {
    v8 = _asl_lib_vlog(client, v7, msg, format, va);
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:
  if (v8)
    return -1;
  else
    return 0;
}

uint64_t asl_client_open(const char *a1, char *a2, unsigned int a3)
{
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  char ***v9;
  char *v10;
  int *v11;
  char *v12;
  int *v13;
  int *v14;
  int v15;
  int v16;
  int v17;

  v6 = malloc_type_calloc(1uLL, 0x68uLL, 0x10A0040ED89ACDEuLL);
  v7 = (uint64_t)v6;
  if (!v6)
  {
    v13 = __error();
LABEL_12:
    *v13 = 12;
    return v7;
  }
  *v6 = 0x100000005;
  v8 = asl_msg_new(0);
  *(_QWORD *)(v7 + 32) = v8;
  if (!v8)
  {
    asl_release((asl_object_t)v7);
    v13 = __error();
    v7 = 0;
    goto LABEL_12;
  }
  *(_DWORD *)(v7 + 12) = a3;
  *(_DWORD *)(v7 + 16) = getpid();
  *(_DWORD *)(v7 + 20) = getuid();
  *(_DWORD *)(v7 + 24) = getgid();
  if (a1)
  {
LABEL_7:
    asl_msg_set_key_val(*(int **)(v7 + 32), "Sender", a1);
    goto LABEL_8;
  }
  v9 = _NSGetArgv();
  a1 = **v9;
  if (a1)
  {
    v10 = strrchr(**v9, 47);
    if (v10)
      a1 = v10 + 1;
    goto LABEL_7;
  }
LABEL_8:
  if (a2)
  {
    v11 = *(int **)(v7 + 32);
    v12 = a2;
  }
  else
  {
    v14 = *(int **)(v7 + 32);
    if (*(_DWORD *)(v7 + 20))
      v15 = 8;
    else
      v15 = 24;
    v12 = asl_syslog_faciliy_num_to_name(v15);
    v11 = v14;
  }
  asl_msg_set_key_val(v11, "Facility", v12);
  if ((a3 & 0x10000000) != 0)
    v16 = 65599;
  else
    v16 = 196671;
  *(_DWORD *)(v7 + 40) = ((a3 >> 11) & 0x40000 | v16) ^ 0x40000;
  if ((*(_BYTE *)(v7 + 12) & 1) != 0)
  {
    if (fcntl(2, 1) < 0)
    {
      *(_DWORD *)(v7 + 12) &= ~1u;
    }
    else
    {
      v17 = fileno((FILE *)*MEMORY[0x1E0C874E0]);
      asl_client_add_output_file(v7, v17, "std", "lcl", 255, 1);
    }
  }
  return v7;
}

uint64_t _asl_send_message_text(__asl_object_s *a1, int *a2, asl_object_t obj, unsigned __int8 a4, __asl_object_s *a5, const char *a6, int a7)
{
  asl_object_t v12;
  unsigned int v14;
  uint64_t v15;
  __asl_object_s *v16;
  int *v17;
  int *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  char *v28;
  char *v29;
  unsigned int v30;
  uint64_t v31;
  int *v33;
  int *v34;
  timeval v35;

  v12 = a1;
  if (!a1)
  {
    if (obj)
    {
      if (asl_get_type(obj) == 5)
        v12 = obj;
      else
        v12 = 0;
    }
    else
    {
      if (_asl_open_default_once != -1)
        dispatch_once(&_asl_open_default_once, &__block_literal_global);
      v12 = (asl_object_t)off_1ECD9E1A0;
      if (!off_1ECD9E1A0)
        return 9999;
    }
  }
  if (a4 >= 7u)
    v14 = 7;
  else
    v14 = a4;
  if (!a2)
  {
    v35.tv_sec = 0;
    *(_QWORD *)&v35.tv_usec = 0;
    if (gettimeofday(&v35, 0))
    {
      v35.tv_sec = time(0);
      v35.tv_usec = 0;
    }
    v34 = 0;
    if (asl_msg_lookup(a5, "Sender", &v34, 0))
      v34 = 0;
    v33 = 0;
    v15 = asl_msg_lookup(a5, "Facility", &v33, 0);
    if ((_DWORD)v15)
    {
      v17 = 0;
      v33 = 0;
    }
    else
    {
      v17 = v33;
    }
    v18 = asl_base_msg((uint64_t)v12, v14, (uint64_t)&v35, v34, v17, a6);
    if (v18)
    {
      a2 = asl_msg_merge(v18, a5);
      v16 = (__asl_object_s *)a2;
      goto LABEL_23;
    }
    return 9999;
  }
  v15 = 0;
  v16 = 0;
LABEL_23:
  v19 = *((unsigned int *)v12 + 13);
  if ((_DWORD)v19)
  {
    v20 = 0;
    v21 = 0;
    v22 = 1 << v14;
    do
    {
      v23 = *((_QWORD *)v12 + 7);
      v24 = *(_DWORD *)(v23 + v20);
      if (a7)
      {
        if ((v24 - 1) < 2)
          goto LABEL_29;
      }
      else if ((v24 & 0x80000000) == 0)
      {
LABEL_29:
        v25 = v23 + v20;
        v26 = *(_DWORD *)(v25 + 8);
        if (v26)
          v27 = (v26 & v22) == 0;
        else
          v27 = 1;
        if (!v27)
        {
          LODWORD(v35.tv_sec) = 0;
          v28 = asl_format_message((char *)a2, *(char **)(v25 + 16), *(char **)(v25 + 24), *(_DWORD *)(v25 + 4), &v35);
          if (v28)
          {
            v29 = v28;
            v30 = write(*(_DWORD *)(*((_QWORD *)v12 + 7) + v20), v28, (LODWORD(v35.tv_sec) - 1));
            if ((v30 & 0x80000000) != 0)
            {
              v31 = *((_QWORD *)v12 + 7);
              if (*(_DWORD *)(v31 + v20) == 2)
                v15 = 0;
              else
                v15 = v30;
              *(_DWORD *)(v31 + v20) = -1;
            }
            else
            {
              v15 = 0;
            }
            free(v29);
          }
          v19 = *((unsigned int *)v12 + 13);
        }
      }
      ++v21;
      v20 += 32;
    }
    while (v21 < v19);
  }
  if (v16)
    asl_msg_release(v16);
  return v15;
}

void asl_msg_release(asl_object_t obj)
{
  if (obj)
    asl_release(obj);
}

int *asl_msg_merge(int *a1, asl_object_t obj)
{
  uint32_t type;
  uint32_t v5;
  int *v6;
  char *page;
  unsigned int v8;
  unsigned int i;
  const char *v10;
  char *v11;
  int v12;
  const char *v14;
  char *v15;
  unsigned __int16 v16;
  uint64_t v17;
  int v18;

  if (obj)
  {
    v14 = 0;
    v15 = 0;
    type = asl_get_type(obj);
    v5 = type;
    v6 = a1;
    if (!a1)
    {
      page = _asl_msg_make_page(type);
      v6 = (int *)page;
      if (page)
      {
        *(_DWORD *)page = v5;
        *((_DWORD *)page + 1) = 1;
      }
    }
    v16 = 0;
    v8 = asl_msg_fetch(obj, 0, &v15, (int **)&v14, &v16);
    if (v8 != -1)
    {
      for (i = v8; i != -1; i = asl_msg_fetch(obj, i, &v15, (int **)&v14, &v16))
      {
        if (!v5)
          v16 = 0;
        v10 = v14;
        v11 = v15;
        v12 = v16;
        if (a1)
        {
          if (!v6)
            continue;
          if (!v15)
            continue;
          v18 = -1;
          v17 = 0;
          if (_asl_msg_index(v6, v15, &v18, &v17) != -1)
            continue;
        }
        asl_msg_set_key_val_op(v6, v11, v10, v12);
      }
    }
    return v6;
  }
  return a1;
}

uint64_t asl_msg_fetch(_DWORD *a1, unsigned int a2, char **a3, int **a4, _WORD *a5)
{
  _DWORD *v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v13;
  int v14;
  __int16 v15;

  if (!a1)
    return 0xFFFFFFFFLL;
  v6 = a1;
  if (*a1 == 1)
    v7 = 10;
  else
    v7 = 0;
  if (*a1)
    v8 = v7;
  else
    v8 = 15;
  v9 = HIBYTE(a2);
  if (HIBYTE(a2) == 255)
    return 0xFFFFFFFFLL;
  v13 = a2 & 0xFFFFFF;
  if ((a2 & 0xFFFFFF) != 0)
  {
    v14 = a2 & 0xFFFFFF;
    do
    {
      v6 = (_DWORD *)*((_QWORD *)v6 + 3);
      if (!v6)
        return 0xFFFFFFFFLL;
    }
    while (--v14);
  }
  if (a3)
    *a3 = _asl_msg_slot_key((char *)v6, HIBYTE(a2));
  if (a4)
    *a4 = _asl_msg_slot_val(v6, v9);
  if (a5)
  {
    v15 = 0;
    if (a2 >> 25 <= 4 && *v6 == 1)
      v15 = *((_WORD *)v6 + v9 + 36);
    *a5 = v15;
  }
  while (++v9 < v8)
  {
LABEL_27:
    if (*((__int16 *)v6 + v9 + 16) != -1)
      return v13 | (v9 << 24);
  }
  v6 = (_DWORD *)*((_QWORD *)v6 + 3);
  if (v6)
  {
    v9 = 0;
    ++v13;
    goto LABEL_27;
  }
  return 4278190080;
}

int *asl_base_msg(uint64_t a1, unsigned int a2, uint64_t a3, int *a4, int *a5, const char *a6)
{
  const char *v7;
  const char *v8;
  int *v12;
  int *v13;
  pid_t v14;
  os_activity_id_t identifier;
  const char *v16;
  char ***v17;
  char *v18;
  char *v19;
  const char *v20;
  int *v22;
  int *v23;
  char __str[64];
  uint64_t v25;

  v7 = (const char *)a5;
  v8 = (const char *)a4;
  v25 = *MEMORY[0x1E0C874D8];
  v22 = a5;
  v23 = a4;
  v12 = (int *)asl_msg_new(0);
  v13 = v12;
  if (!v12)
    return v13;
  if (a2 <= 7)
    asl_msg_set_key_val(v12, "Level", level_to_number_string[a2]);
  if (a3)
  {
    snprintf(__str, 0x40uLL, "%llu", *(_QWORD *)a3);
    asl_msg_set_key_val(v13, "Time", __str);
    snprintf(__str, 0x40uLL, "%d", 1000 * *(_DWORD *)(a3 + 8));
    asl_msg_set_key_val(v13, "TimeNanoSec", __str);
  }
  if (a6)
    asl_msg_set_key_val(v13, "Message", a6);
  v14 = getpid();
  snprintf(__str, 0x40uLL, "%u", v14);
  asl_msg_set_key_val(v13, "PID", __str);
  identifier = os_activity_get_identifier(MEMORY[0x1E0C88E88], 0);
  if (identifier)
  {
    snprintf(__str, 0x40uLL, "0x%016llx", identifier);
    asl_msg_set_key_val(v13, "OSActivityID", __str);
  }
  if (!a1 || v8)
  {
LABEL_26:
    if (!v8)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (asl_msg_lookup(*(_DWORD **)(a1 + 32), "Sender", &v23, 0) || (v8 = (const char *)v23) == 0)
  {
    v23 = 0;
    v16 = (const char *)qword_1ECD9E148;
    if (!qword_1ECD9E148)
    {
      v17 = _NSGetArgv();
      v18 = **v17;
      if (v18)
      {
        v19 = strrchr(**v17, 47);
        pthread_mutex_lock(&stru_1ECD9E150);
        if (!qword_1ECD9E148)
        {
          if (v19)
            v20 = v19 + 1;
          else
            v20 = v18;
          qword_1ECD9E148 = (uint64_t)strdup(v20);
        }
        pthread_mutex_unlock(&stru_1ECD9E150);
      }
      if (qword_1ECD9E148)
        v16 = (const char *)qword_1ECD9E148;
      else
        v16 = "Unknown";
    }
    asl_msg_set_key_val(v13, "Sender", v16);
    v8 = (const char *)v23;
    goto LABEL_26;
  }
LABEL_27:
  asl_msg_set_key_val(v13, "Sender", v8);
  v7 = (const char *)v22;
LABEL_28:
  if (a1 && !v7)
  {
    if (asl_msg_lookup(*(_DWORD **)(a1 + 32), "Facility", &v22, 0))
      return v13;
    v7 = (const char *)v22;
  }
  if (v7)
    asl_msg_set_key_val(v13, "Facility", v7);
  return v13;
}

uint64_t asl_msg_set_key_val(int *a1, char *a2, const char *a3)
{
  return asl_msg_set_key_val_op(a1, a2, a3, 0);
}

char *asl_msg_new(int a1)
{
  char *result;

  result = _asl_msg_make_page(a1);
  if (result)
  {
    *(_DWORD *)result = a1;
    *((_DWORD *)result + 1) = 1;
  }
  return result;
}

char *asl_format_message(char *result, char *__s1, char *a3, int a4, _DWORD *a5)
{
  char *v9;
  const char *v10;
  int v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  size_t v21;
  char *v22;
  int v23;
  char *v24;
  unsigned int v25;
  char *v26;
  int v27;
  char *v28;
  char *v29;
  char *v30;
  int v31;
  char *v32;
  size_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  unsigned int v37;
  char v38;
  char *v39;
  int v40;
  int v41;
  uint64_t v42;
  char *v43;
  int v44;
  int v45;
  uint64_t v47;
  unsigned int v48;
  size_t v49;
  int v50;
  int v51;
  char *v52;
  const char *v53;
  char *v54;
  int v55;
  _BOOL4 v56;
  _BOOL4 v57;
  BOOL v58;
  int v59;
  char *v60;
  char *v61;
  const char *v62;
  char *v63;
  char *v64;
  int v65;
  unsigned int v66;
  uint64_t v67;
  int v68;
  char *v69;
  unsigned int v70;
  char **v71;
  const char *v72;
  int v73;
  int v74;
  const char *v75;
  char *__s;
  char *__s1a;
  char *v78;
  __int128 v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  const char *v85;
  char *v86;
  char __str[512];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C874D8];
  *a5 = 0;
  if (!result)
    return result;
  v9 = result;
  v83 = 0;
  v84 = 0;
  v81 = 0;
  v82 = 0;
  v80 = 0;
  v78 = 0;
  v79 = 0uLL;
  __s = 0;
  __s1a = 0;
  v75 = 0;
  if (!__s1 || !strcmp(__s1, "raw"))
  {
LABEL_171:
    v75 = 0;
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
    v30 = (char *)asl_msg_to_string_raw(a4, v9, a3);
    v26 = v30;
    goto LABEL_172;
  }
  if (!strcmp(__s1, "std"))
    goto LABEL_31;
  if (!strcmp(__s1, "bsd"))
    goto LABEL_35;
  if (!strcmp(__s1, "xml"))
  {
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
    result = (char *)asl_string_new(a4);
    if (!result)
      return result;
    v12 = result;
    asl_string_append_char_no_encoding(result, 9);
    asl_string_append_no_encoding(v12, "<dict>");
    asl_string_append_char_no_encoding(v12, 10);
    v13 = asl_msg_fetch(v9, 0, &__s1a, (int **)&__s, 0);
    if (v13 == -1)
    {
LABEL_27:
      asl_string_append_char_no_encoding(v12, 9);
      asl_string_append_no_encoding(v12, "</dict>");
      asl_string_append_char_no_encoding(v12, 10);
      *a5 = asl_string_length((uint64_t)v12);
      v22 = v12;
      return asl_string_release_return_bytes(v22);
    }
    v14 = v13;
    while (1)
    {
      if (asl_is_utf8((unsigned __int8 *)__s1a) == 1)
      {
        asl_string_append_xml_tag(v12, "key", __s1a);
        if (!strcmp(__s1a, "Time"))
        {
          v17 = _asl_time_string(a3, __s, v75);
          if (!v17)
          {
            v15 = v12;
            v16 = "0";
            goto LABEL_25;
          }
          v18 = v17;
          v19 = v12;
          v20 = "string";
        }
        else
        {
          if (asl_is_utf8((unsigned __int8 *)__s) == 1)
          {
            v15 = v12;
            v16 = __s;
LABEL_25:
            asl_string_append_xml_tag(v15, "string", v16);
            goto LABEL_26;
          }
          v21 = strlen(__s);
          v18 = asl_b64_encode((uint64_t)__s, v21);
          v19 = v12;
          v20 = "data";
        }
        asl_string_append_xml_tag(v19, v20, v18);
        free(v18);
      }
LABEL_26:
      v14 = asl_msg_fetch(v9, v14, &__s1a, (int **)&__s, 0);
      if (v14 == -1)
        goto LABEL_27;
    }
  }
  if (strcmp(__s1, "msg"))
  {
    if (!strncmp(__s1, "raw", 3uLL) && __s1[3] == 46)
    {
      if (!a3)
      {
        v11 = __s1[4];
        v10 = __s1 + 4;
        if (v11)
        {
          a3 = __str;
          snprintf(__str, 0x10uLL, "sec.%s", v10);
        }
        else
        {
          a3 = 0;
        }
      }
      goto LABEL_171;
    }
    if (!strncmp(__s1, "std", 3uLL) && __s1[3] == 46)
    {
      if (a3)
      {
LABEL_31:
        v23 = 1;
        goto LABEL_36;
      }
      v73 = __s1[4];
      v72 = __s1 + 4;
      v23 = 1;
      if (v73)
        goto LABEL_167;
      goto LABEL_169;
    }
    if (!strncmp(__s1, "bsd", 3uLL) && __s1[3] == 46)
    {
      if (!a3)
      {
        v23 = 0;
        v74 = __s1[4];
        v72 = __s1 + 4;
        if (v74)
        {
LABEL_167:
          a3 = __str;
          snprintf(__str, 0x10uLL, "lcl.%s", v72);
          goto LABEL_36;
        }
LABEL_169:
        a3 = 0;
LABEL_36:
        v75 = 0;
        asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
        v78 = 0;
        v79 = 0uLL;
        v83 = 0;
        v84 = 0;
        v81 = 0;
        v82 = 0;
        v80 = 0;
        v24 = 0;
        if (!asl_msg_lookup(v9, "Time", (int **)&v78, 0))
          v24 = _asl_time_string(a3, v78, v75);
        v25 = 7;
        if (!asl_msg_lookup(v9, "Level", (int **)&v80, 0) && v80)
          v25 = atoi(v80);
        if (!asl_msg_lookup(v9, "Host", (int **)&v84, 0) && !v84)
          v84 = "unknown";
        if (!asl_msg_lookup(v9, "Sender", (int **)&v82, 0) && !v82)
          v82 = "unknown";
        asl_msg_lookup(v9, "PID", (int **)&v83, 0);
        asl_msg_lookup(v9, "Message", (int **)&v81, 0);
        asl_msg_lookup(v9, "RefProc", (int **)&v79 + 1, 0);
        asl_msg_lookup(v9, "RefPID", (int **)&v79, 0);
        result = (char *)asl_string_new(a4);
        if (result)
        {
          v26 = result;
          if (v24)
          {
            asl_string_append((uint64_t)result, v24);
            free(v24);
          }
          else
          {
            asl_string_append_char_no_encoding(result, 48);
          }
          asl_string_append_char_no_encoding(v26, 32);
          asl_string_append((uint64_t)v26, v84);
          asl_string_append_char_no_encoding(v26, 32);
          asl_string_append((uint64_t)v26, v82);
          if (v83 && strcmp(v83, "-1"))
          {
            asl_string_append_char_no_encoding(v26, 91);
            asl_string_append((uint64_t)v26, v83);
            asl_string_append_char_no_encoding(v26, 93);
          }
          v27 = DWORD2(v79) | v79;
          if (v79 != 0)
          {
            asl_string_append_no_encoding(v26, " (");
            if (*((_QWORD *)&v79 + 1))
              asl_string_append((uint64_t)v26, *((char **)&v79 + 1));
            v27 = v79;
            if ((_QWORD)v79)
            {
              asl_string_append_char_no_encoding(v26, 91);
              asl_string_append((uint64_t)v26, (char *)v79);
              asl_string_append_char_no_encoding(v26, 93);
              v27 = (_QWORD)v79 != 0;
            }
          }
          if (*((_QWORD *)&v79 + 1) || v27)
            asl_string_append_char_no_encoding(v26, 41);
          if (v23)
          {
            asl_string_append_no_encoding(v26, " <");
            if (v25 > 7)
              v28 = "unknown";
            else
              v28 = off_1EA906C18[v25];
            asl_string_append((uint64_t)v26, v28);
            asl_string_append_char_no_encoding(v26, 62);
          }
          asl_string_append_no_encoding(v26, ": ");
          v29 = v81;
          if (!v81)
            goto LABEL_69;
          goto LABEL_68;
        }
        return result;
      }
LABEL_35:
      v23 = 0;
      goto LABEL_36;
    }
    asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
    result = (char *)asl_string_new(a4);
    if (!result)
      return result;
    v32 = result;
    v33 = strlen(__s1);
    if (v33 >= 0x201)
    {
      result = (char *)malloc_type_malloc(v33, 0xEEF22BB4uLL);
      v34 = result;
      if (!result)
        return result;
    }
    else
    {
      v34 = __str;
    }
    LODWORD(v35) = 0;
LABEL_78:
    v36 = &__s1[(int)v35];
    v37 = *v36;
    if (v37 != 36)
    {
      if (v37 == 92)
      {
        v47 = (int)v35;
        v35 = (int)v35 + 1;
        v48 = __s1[v35];
        if (v48 > 0x60)
        {
          switch(__s1[v35])
          {
            case 'a':
              v39 = v32;
              v38 = 7;
              goto LABEL_82;
            case 'b':
              v39 = v32;
              v38 = 8;
              goto LABEL_82;
            case 'e':
              v39 = v32;
              v38 = 27;
              goto LABEL_82;
            case 'f':
              v39 = v32;
              v38 = 12;
              goto LABEL_82;
            case 'n':
              v39 = v32;
              v38 = 10;
              goto LABEL_82;
            case 'r':
              v39 = v32;
              v38 = 13;
              goto LABEL_82;
            case 's':
              v39 = v32;
              v38 = 32;
              goto LABEL_82;
            case 't':
              v39 = v32;
              v38 = 9;
              goto LABEL_82;
            case 'v':
              v39 = v32;
              v38 = 11;
              goto LABEL_82;
            default:
              goto LABEL_143;
          }
        }
        switch(v48)
        {
          case '$':
            v39 = v32;
            v38 = 36;
            break;
          case '\'':
            v39 = v32;
            v38 = 39;
            break;
          case '\\':
            v39 = v32;
            v38 = 92;
            break;
          default:
LABEL_143:
            v37 = (char)v48 - 48;
            if (v37 > 9)
              goto LABEL_162;
            v65 = v47 + 2;
            v66 = __s1[v47 + 2] - 48;
            if (v66 <= 9)
            {
              v67 = v47 + 3;
              v68 = __s1[v67];
              LOBYTE(v37) = v66 + 8 * v37;
              LODWORD(v35) = (v68 - 48) <= 9 ? v67 : v65;
              if ((v68 - 48) <= 9)
                LOBYTE(v37) = v68 - 48 + 8 * v37;
            }
LABEL_81:
            v38 = v37;
            v39 = v32;
            break;
        }
LABEL_82:
        asl_string_append_char_no_encoding(v39, v38);
        goto LABEL_162;
      }
      if (*v36)
        goto LABEL_81;
      if (v34 != __str)
        free(v34);
      asl_string_append_char_no_encoding(v32, 10);
      *a5 = asl_string_length((uint64_t)v32);
      v22 = v32;
      return asl_string_release_return_bytes(v22);
    }
    v40 = 0;
    v41 = v35 + 1;
    v42 = v41;
    v43 = &__s1[v41];
    while (1)
    {
      v45 = *v43++;
      v44 = v45;
      if (v45 <= 39)
        break;
      if (v44 != 41)
      {
        if (v44 == 40)
        {
          ++v40;
          goto LABEL_98;
        }
LABEL_94:
        if (v44 == 9 && v40 == 0)
          goto LABEL_106;
        goto LABEL_98;
      }
      v40 -= v40 > 0;
      if (!v40)
      {
        ++v41;
LABEL_106:
        v49 = v41 - v42;
        memcpy(v34, v36 + 1, v49);
        v50 = 0;
        v51 = 0;
        v52 = 0;
        v53 = 0;
        v34[v49] = 0;
        while (2)
        {
          v54 = &v34[v50];
          v55 = *v54;
          if (v55 == 40)
            goto LABEL_120;
          if (v55 == 41)
          {
            *v54 = 0;
            v51 = 1;
LABEL_120:
            ++v50;
            continue;
          }
          break;
        }
        if (*v54)
        {
          v56 = v51 == 1;
          v57 = v53 == 0;
          v58 = !v56 || !v57;
          if (v56 && v57)
            v59 = 1;
          else
            v59 = v51;
          if (v58)
            v60 = (char *)v53;
          else
            v60 = &v34[v50];
          if (v52)
          {
            v51 = v59;
            v53 = v60;
          }
          else
          {
            v52 = &v34[v50];
          }
          goto LABEL_120;
        }
        if (v52)
        {
          v85 = 0;
          v86 = 0;
          asl_msg_lookup(v9, "TimeNanoSec", (int **)&v85, 0);
          if (!asl_msg_lookup(v9, v52, (int **)&v86, 0))
          {
            v61 = v86;
            if (v86)
            {
              if (!strcmp(v52, "Time"))
              {
                if (v53)
                  v62 = v53;
                else
                  v62 = a3;
                v69 = _asl_time_string(v62, v61, v85);
                if (v69)
                {
                  asl_string_append_no_encoding(v32, v69);
                  free(v69);
                }
                else
                {
                  asl_string_append_char_no_encoding(v32, 48);
                }
              }
              else
              {
                if (strcmp(v52, "Level"))
                {
                  asl_string_append((uint64_t)v32, v61);
                  goto LABEL_161;
                }
                if (v53)
                {
                  if (!strcmp(v53, "str"))
                  {
                    v70 = atoi(v61);
                    v64 = "unknown";
                    if (v70 <= 7)
                    {
                      v71 = off_1EA906C18;
                      goto LABEL_158;
                    }
                  }
                  else
                  {
                    if (strcmp(v53, "char"))
                      goto LABEL_142;
                    v70 = atoi(v61);
                    v64 = "?";
                    if (v70 <= 7)
                    {
                      v71 = off_1EA906C58;
LABEL_158:
                      v64 = v71[v70];
                    }
                  }
                  v86 = v64;
                  v63 = v32;
                }
                else
                {
LABEL_142:
                  v63 = v32;
                  v64 = v61;
                }
                asl_string_append_no_encoding(v63, v64);
              }
            }
          }
        }
LABEL_161:
        LODWORD(v35) = v41 - 1;
LABEL_162:
        LODWORD(v35) = v35 + 1;
        goto LABEL_78;
      }
LABEL_98:
      ++v41;
    }
    if (v44 == 32)
    {
      if (!v40)
        goto LABEL_106;
      goto LABEL_98;
    }
    if (!v44)
      goto LABEL_106;
    goto LABEL_94;
  }
  asl_msg_lookup(v9, "TimeNanoSec", (int **)&v75, 0);
  v81 = 0;
  v31 = asl_msg_lookup(v9, "Message", (int **)&v81, 0);
  result = 0;
  if (!v31)
  {
    result = (char *)asl_string_new(a4);
    if (result)
    {
      v26 = result;
      v29 = v81;
LABEL_68:
      asl_string_append((uint64_t)v26, v29);
LABEL_69:
      v30 = v26;
LABEL_172:
      asl_string_append_char_no_encoding(v30, 10);
      *a5 = asl_string_length((uint64_t)v26);
      v22 = v26;
      return asl_string_release_return_bytes(v22);
    }
  }
  return result;
}

uint64_t asl_msg_set_key_val_op(int *a1, char *__s1, const char *a3, int a4)
{
  uint64_t v4;
  int v8;
  int v9;
  char *v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  size_t v15;
  char *v16;
  int v17;
  int *v18;
  int v19;
  int *v20;
  char *v21;
  const char *v22;
  __int16 v23;
  uint64_t v25;
  const char *v26;
  char *v27;
  unsigned int v28;
  __int16 v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  size_t v39;
  unsigned int v40;
  char *v41;
  char *v42;
  size_t v43;
  int *v44;
  int v45;
  int v46;
  int *v47;
  int v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  char *v54;
  char *v55;
  int v56;
  int v57;
  int v58;
  unsigned int v59;
  uint64_t v60;
  int v61;
  int *v62;
  unsigned int v63;
  char v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C874D8];
  v4 = 0xFFFFFFFFLL;
  if (!a1 || !__s1)
    return v4;
  if (a4)
    v8 = ((a4 & 7) == 0) | a4;
  else
    v8 = 0;
  if (!strcmp(__s1, "Level"))
  {
    if (a3)
    {
      if ((*a3 & 0xF8) != 0x30 || a3[1])
      {
        if (!strcasecmp(a3, "Emergency"))
        {
          a3 = "0";
        }
        else if (!strcasecmp(a3, "Alert"))
        {
          a3 = "1";
        }
        else if (!strcasecmp(a3, "Critical"))
        {
          a3 = "2";
        }
        else if (!strcasecmp(a3, "Error"))
        {
          a3 = "3";
        }
        else if (!strcasecmp(a3, "Warning"))
        {
          a3 = "4";
        }
        else if (!strcasecmp(a3, "Notice"))
        {
          a3 = "5";
        }
        else if (!strcasecmp(a3, "Info"))
        {
          a3 = "6";
        }
        else
        {
          a3 = "7";
        }
      }
    }
    else
    {
      a3 = "7";
    }
  }
  v9 = strcmp(__s1, "Message");
  v10 = 0;
  if (!a3 || v9)
    goto LABEL_34;
  v11 = strlen(a3);
  v12 = 0;
  do
  {
    if (!(v11 + v12))
    {
      a3 = 0;
      goto LABEL_28;
    }
    v13 = a3[v11 - 1 + v12--];
  }
  while (v13 == 10);
  v14 = v11 + v12 + 1;
  if (v14 >= v11)
  {
LABEL_28:
    v10 = 0;
    goto LABEL_34;
  }
  v15 = v11 + v12 + 1;
  if (v14 <= 0x1FF)
  {
    __memcpy_chk();
    v10 = 0;
    a3 = &v64;
    goto LABEL_33;
  }
  v16 = (char *)malloc_type_malloc(v11 + v12 + 2, 0xA163A346uLL);
  if (!v16)
    return 0xFFFFFFFFLL;
  v10 = v16;
  memcpy(v16, a3, v15);
  a3 = v10;
LABEL_33:
  a3[v15] = 0;
LABEL_34:
  v17 = *a1;
  v63 = -1;
  v62 = 0;
  if (v17 == 1 || _asl_msg_index(a1, __s1, &v63, &v62) == -1)
  {
    v20 = a1;
    v21 = __s1;
    v22 = a3;
    v23 = v8;
LABEL_42:
    v4 = _asl_msg_new_key_val_op(v20, v21, v22, v23);
    goto LABEL_43;
  }
  v18 = v62;
  v61 = v8;
  v60 = v63;
  if (!v62)
    goto LABEL_52;
  if (*v62 == 1)
  {
    if (v63 > 9)
      goto LABEL_52;
    v19 = 10;
LABEL_48:
    v25 = *((unsigned __int16 *)v62 + v19 + v63 + 16);
    if (v25 == 0xFFFF)
    {
      v59 = 0;
      v28 = 0;
      v26 = 0;
      v27 = 0;
      LOWORD(v25) = -1;
      if (a3)
        goto LABEL_54;
      goto LABEL_78;
    }
    if ((v25 & 0xC000) != 0x4000)
    {
      v29 = *((_WORD *)v62 + v19 + v63 + 16);
      goto LABEL_53;
    }
    v59 = 0;
    v26 = 0;
    v27 = *(char **)((char *)v62 + (v25 & 0x3FFF) + 92);
    v28 = 8;
    if (!a3)
      goto LABEL_78;
LABEL_54:
    if (v26 && !strcmp(a3, v26) || v27 && !strcmp(a3, v27))
    {
      v4 = 0;
      if (v61 != -1)
      {
        if (v18)
        {
          v4 = 0;
          if (v60 <= 9 && *v18 == 1)
          {
            v4 = 0;
            *((_WORD *)v18 + v60 + 36) = v61;
          }
        }
      }
      goto LABEL_43;
    }
    v30 = v25 & 0x3FFF;
    if (v26 && (_DWORD)v30 + v59 == v18[3])
    {
      if (*v18)
      {
        if (v60 > 9 || *v18 != 1)
          goto LABEL_99;
        v31 = 10;
      }
      else
      {
        if (v60 >= 0xF)
        {
LABEL_99:
          v59 = 0;
          v18[3] = v30;
          goto LABEL_105;
        }
        v31 = 15;
      }
      *((_WORD *)v18 + (v31 + v60) + 16) = -1;
      goto LABEL_99;
    }
    if (!v27 || v28 + (_DWORD)v30 != v18[3])
      goto LABEL_105;
    if (*v18)
    {
      v32 = v60;
      if (v60 > 9 || *v18 != 1)
        goto LABEL_104;
      v33 = 10;
    }
    else
    {
      v32 = v60;
      if (v60 >= 0xF)
      {
LABEL_104:
        v18[3] = v30;
        *((_QWORD *)v18 + 2) += ~strlen(v27);
        free(v27);
        v28 = 0;
        v27 = 0;
LABEL_105:
        v38 = strlen(a3);
        v39 = (v38 + 1);
        if (v39 <= 0xDC)
          v40 = v38 + 1;
        else
          v40 = 8;
        if (v27 && v40 <= v28)
        {
          *((_QWORD *)v62 + 2) += ~strlen(v27);
          free(v27);
          goto LABEL_113;
        }
        if (!v27 && v40 <= v59)
        {
LABEL_113:
          if (v39 >= 0xDD)
          {
            v41 = strdup(a3);
            if (v41)
            {
              v42 = v41;
              v43 = strlen(v41);
              v44 = v62;
              *((_QWORD *)v62 + 2) += v43 + 1;
              if (*v44)
              {
                v45 = v61;
                if (v63 > 9 || *v44 != 1)
                  goto LABEL_141;
                v46 = 10;
              }
              else
              {
                v45 = v61;
                if (v63 >= 0xF)
                {
LABEL_141:
                  *(_QWORD *)((char *)v44 + v30 + 92) = v42;
LABEL_146:
                  if (v45 != -1 && v62)
                  {
                    v4 = 0;
                    if (v63 <= 9 && *v62 == 1)
                    {
                      v4 = 0;
                      *((_WORD *)v62 + v63 + 36) = v45;
                    }
                    goto LABEL_43;
                  }
                  goto LABEL_176;
                }
                v46 = 15;
              }
              *((_WORD *)v44 + v46 + v63 + 16) = v30 | 0x4000;
              goto LABEL_141;
            }
LABEL_137:
            v4 = 0xFFFFFFFFLL;
            goto LABEL_43;
          }
          v47 = v62;
          if (v62)
          {
            if (*v62)
            {
              if (v63 > 9 || *v62 != 1)
                goto LABEL_145;
              v48 = 10;
              goto LABEL_144;
            }
            if (v63 < 0xF)
            {
              v48 = 15;
LABEL_144:
              *((_WORD *)v62 + v48 + v63 + 16) = v30;
            }
          }
LABEL_145:
          memcpy((char *)v47 + v30 + 92, a3, v39);
          v45 = v61;
          goto LABEL_146;
        }
        v49 = v62;
        if (v27)
        {
          *((_QWORD *)v62 + 2) += ~strlen(v27);
          free(v27);
          v49 = v62;
        }
        v50 = v49[3];
        if (v40 > 220 - (int)v50)
        {
          v51 = v63;
          v52 = *v49;
          if (*v49)
          {
            v23 = v61;
            if (v63 > 9 || v52 != 1)
            {
LABEL_159:
              if (v51 <= 9 && v52 == 1)
                *((_WORD *)v49 + v51 + 36) = 0;
              goto LABEL_162;
            }
            v53 = 10;
          }
          else
          {
            v23 = v61;
            if (v63 >= 0xF)
            {
LABEL_162:
              v20 = a1;
              v21 = __s1;
              v22 = a3;
              goto LABEL_42;
            }
            v53 = 15;
          }
          *((_WORD *)v49 + v63 + 16) = -1;
          *((_WORD *)v49 + (v53 + v51) + 16) = -1;
          goto LABEL_159;
        }
        v49[3] = v50 + v40;
        if (v39 >= 0xDD)
        {
          v54 = strdup(a3);
          if (!v54)
            goto LABEL_137;
          v55 = v54;
          *((_QWORD *)v49 + 2) += strlen(v54) + 1;
          if (*v49)
          {
            v56 = v61;
            if (v63 > 9 || *v49 != 1)
              goto LABEL_170;
            v57 = 10;
          }
          else
          {
            v56 = v61;
            if (v63 >= 0xF)
            {
LABEL_170:
              *(_QWORD *)((char *)v49 + v50 + 92) = v55;
              goto LABEL_171;
            }
            v57 = 15;
          }
          *((_WORD *)v49 + v57 + v63 + 16) = v50 | 0x4000;
          goto LABEL_170;
        }
        if (*v49)
        {
          if (v63 > 9 || *v49 != 1)
            goto LABEL_166;
          v58 = 10;
        }
        else
        {
          if (v63 >= 0xF)
          {
LABEL_166:
            memcpy((char *)v49 + v50 + 92, a3, v39);
            v56 = v61;
LABEL_171:
            if (v56 != -1 && v62)
            {
              v4 = 0;
              if (v63 <= 9 && *v62 == 1)
              {
                v4 = 0;
                *((_WORD *)v62 + v63 + 36) = v56;
              }
              goto LABEL_43;
            }
LABEL_176:
            v4 = 0;
            goto LABEL_43;
          }
          v58 = 15;
        }
        *((_WORD *)v49 + v58 + v63 + 16) = v50;
        goto LABEL_166;
      }
      v33 = 15;
    }
    *((_WORD *)v18 + (v33 + v32) + 16) = -1;
    goto LABEL_104;
  }
  if (!*v62 && v63 < 0xF)
  {
    v19 = 15;
    goto LABEL_48;
  }
LABEL_52:
  LODWORD(v25) = 0;
  v29 = 0;
LABEL_53:
  v26 = (char *)v62 + v25 + 92;
  v28 = 0;
  v27 = 0;
  v59 = strlen(v26) + 1;
  LOWORD(v25) = v29;
  if (a3)
    goto LABEL_54;
LABEL_78:
  if (v27)
  {
    *((_QWORD *)v62 + 2) += ~strlen(v27);
    free(v27);
    v18 = v62;
    v34 = v63;
    v35 = v61;
    if (!v62)
      goto LABEL_176;
  }
  else
  {
    v35 = v61;
    v34 = v63;
    if (!v62)
      goto LABEL_176;
  }
  v36 = *v18;
  if (*v18)
  {
    if (v34 <= 9 && v36 == 1)
    {
      v37 = 10;
      goto LABEL_88;
    }
  }
  else if (v34 < 0xF)
  {
    v37 = 15;
LABEL_88:
    *((_WORD *)v18 + v37 + v34 + 16) = -1;
  }
  if (v35 == -1)
    goto LABEL_176;
  v4 = 0;
  if (v34 <= 9 && v36 == 1)
  {
    v4 = 0;
    *((_WORD *)v18 + v34 + 36) = v35;
  }
LABEL_43:
  if (v10)
    free(v10);
  return v4;
}

uint64_t _asl_msg_new_key_val_op(int *a1, char *__s, const char *a3, __int16 a4)
{
  int *v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  char *v15;
  unsigned int v16;
  uint64_t result;
  uint64_t v18;
  char *v19;
  unint64_t v21;
  int v22;
  uint64_t v23;
  char *page;
  uint64_t v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  int v32;
  char *v33;
  char *__src;

  v6 = a1;
  v7 = *a1;
  if (*a1 == 1)
    v8 = 10;
  else
    v8 = 0;
  if (v7)
    v9 = v8;
  else
    v9 = 15;
  v33 = 0;
  __src = 0;
  v10 = strlen(__s);
  v11 = _asl_msg_std_key(__s, v10);
  if (v11)
    v12 = 0;
  else
    v12 = v10 + 1;
  if (a3)
  {
    v13 = strlen(a3) + 1;
    v30 = v13;
  }
  else
  {
    v13 = 0;
    v30 = 0;
  }
  if (v12 < 0xDD)
  {
    v14 = 0;
  }
  else
  {
    v14 = strdup(__s);
    __src = v14;
    v12 = 8;
  }
  v32 = v11;
  if (v13 < 0xDD)
  {
    v15 = 0;
  }
  else
  {
    v15 = strdup(a3);
    v33 = v15;
    v13 = 8;
  }
  v16 = v13 + v12;
  if (v12 && v16 >= 0xDD && !v15)
  {
    v15 = strdup(a3);
    v33 = v15;
    v16 = v12 + 8;
    v13 = 8;
  }
  if (v16 >= 0xDD && !v14)
  {
    v14 = strdup(__s);
    __src = v14;
    v16 = v13 + 8;
    v12 = 8;
  }
  if (v16 > 0xDC)
  {
LABEL_27:
    if (v14)
      free(v14);
    if (v15)
      free(v15);
    return 0xFFFFFFFFLL;
  }
  v18 = v10;
  while (1)
  {
    v19 = (char *)v6;
    if (v16 <= 220 - v6[3] && (_DWORD)v9 != 0)
      break;
LABEL_43:
    v6 = (int *)*((_QWORD *)v19 + 3);
    if (!v6)
    {
      v23 = v18;
      page = _asl_msg_make_page(v7);
      if (!page)
        goto LABEL_27;
      LODWORD(v21) = 0;
      *((_QWORD *)v19 + 3) = page;
      v19 = page;
      LOWORD(v25) = v32;
      v18 = v23;
      if (!v32)
        goto LABEL_48;
      goto LABEL_51;
    }
  }
  v21 = 0;
  v22 = *(_DWORD *)v19;
  while (v22 && (v22 != 1 || v21 > 9) || *(__int16 *)&v19[2 * v21 + 32] != -1)
  {
    if (v9 == ++v21)
      goto LABEL_43;
  }
  LOWORD(v25) = v32;
  if (!v32)
  {
LABEL_48:
    v25 = *((unsigned int *)v19 + 3);
    if (v14)
    {
      v26 = v18;
      memcpy(&v19[v25 + 92], &__src, v12);
      *((_QWORD *)v19 + 2) += v26;
      LOWORD(v25) = v25 | 0x4000;
    }
    else
    {
      memcpy(&v19[v25 + 92], __s, v12);
    }
  }
LABEL_51:
  v27 = *(_DWORD *)v19;
  if (!*(_DWORD *)v19 || v21 <= 9 && v27 == 1)
    *(_WORD *)&v19[2 * v21 + 32] = v25;
  v28 = *((_DWORD *)v19 + 3) + v12;
  *((_DWORD *)v19 + 3) = v28;
  if (a3)
  {
    if (v33)
    {
      memcpy(&v19[v28 + 92], &v33, v13);
      *((_QWORD *)v19 + 2) += v30;
      LOWORD(v28) = v28 | 0x4000;
    }
    else
    {
      memcpy(&v19[v28 + 92], a3, v13);
    }
    v27 = *(_DWORD *)v19;
    if (*(_DWORD *)v19)
    {
      if (v21 > 9 || v27 != 1)
        goto LABEL_65;
      v29 = 10;
    }
    else
    {
      v29 = 15;
    }
    *(_WORD *)&v19[2 * (v29 + v21) + 32] = v28;
LABEL_65:
    *((_DWORD *)v19 + 3) += v13;
  }
  if (v21 <= 9 && v27 == 1)
    *(_WORD *)&v19[2 * (v21 + 20) + 32] = a4;
  result = 0;
  ++*((_DWORD *)v19 + 2);
  return result;
}

void syslog(int a1, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  _vsyslog(a1, a2, va);
}

void _vsyslog(__int16 a1, const char *a2, va_list a3)
{
  int v5;
  int v6;
  __asl_object_s *v7;
  __asl_object_s *v8;
  __asl_object_s *v9;
  char *v10;
  uint32_t v11;

  v5 = a1 & 7;
  v6 = a1 & 0x3F8;
  pthread_mutex_lock(&_sl_lock);
  v7 = (__asl_object_s *)_sl_asl;
  if (!_sl_asl)
  {
    _sl_asl = (uint64_t)asl_open(0, 0, 0x10000u);
    _sl_mask = 255;
    asl_set_filter((asl_object_t)_sl_asl, 255);
    v7 = (__asl_object_s *)_sl_asl;
  }
  v8 = asl_retain(v7);
  pthread_mutex_unlock(&_sl_lock);
  v9 = asl_new(0);
  if (v6)
  {
    v10 = asl_syslog_faciliy_num_to_name(v6);
    if (v10)
      asl_set(v9, "Facility", v10);
  }
  v11 = _asl_evaluate_send(v8, v9, v5);
  if ((v11 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v11 & 0x80000) != 0)
      _asl_lib_vlog_text(v8, v11, v9, a2, a3);
  }
  else if ((v11 & 0x1A0000) != 0)
  {
    _asl_lib_vlog(v8, v11, v9, a2, a3);
  }
  asl_release(v8);
  asl_release(v9);
}

void asl_release(asl_object_t obj)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  void (*v5)(asl_object_t);

  if (obj && *(_DWORD *)obj <= 6u)
  {
    if (asl_object_once != -1)
      dispatch_once(&asl_object_once, &__block_literal_global_28);
    v2 = (unsigned int *)((char *)obj + 4);
    do
    {
      v3 = __ldaxr(v2);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, v2));
    if (!v4)
    {
      v5 = *(void (**)(asl_object_t))(asl_jump[*(unsigned int *)obj] + 8);
      if (v5)
        v5(obj);
    }
  }
}

uint32_t _asl_evaluate_send(asl_object_t client, asl_object_t msg, int level)
{
  unsigned int v5;
  BOOL v6;
  uint32_t v7;
  int control;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  BOOL v15;
  unsigned int v16;
  int v17;
  char *v18;
  int v19;
  char *v20;
  BOOL v21;
  int v22;
  BOOL v23;
  BOOL v24;
  char *v25;
  char *v26;
  char *__s1;
  uint64_t state64;
  int check;

  check = 0;
  __s1 = 0;
  state64 = 0;
  if (level < 0)
    v5 = 7;
  else
    v5 = level;
  if (asl_msg_lookup(msg, "Level", (int **)&__s1, 0))
    v6 = 1;
  else
    v6 = __s1 == 0;
  if (!v6)
    v5 = atoi(__s1);
  if (v5 >= 7)
    v5 = 7;
  if (client)
  {
    if (asl_get_type(client) != 5)
      return v5 | 0x30000;
    if (*((_QWORD *)client + 8))
      return v5 | 0x100000;
  }
  else
  {
    if (_asl_open_default_once != -1)
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    client = (asl_object_t)off_1ECD9E1A0;
    if (!off_1ECD9E1A0)
      return v5 | 0x50000;
  }
  control = asl_client_get_control((uint64_t)client);
  v9 = *((_DWORD *)client + 10);
  v10 = control & 0xFFFF0000 | v5 | (*((_DWORD *)client + 10) << 13) & 0x200000;
  if ((*((_BYTE *)client + 12) & 4) == 0)
  {
    pthread_mutex_lock(&stru_1ECD9E150);
    if ((DWORD1(_asl_global) & 0x80000000) == 0)
    {
      check = 0;
      if (!notify_check(SDWORD1(_asl_global), &check))
      {
        if (check)
        {
          if ((HIDWORD(_asl_global) & 0x80000000) == 0)
          {
            state64 = 0;
            if (!notify_get_state(SHIDWORD(_asl_global), &state64))
              qword_1ECD9E118 = state64;
          }
          if ((DWORD2(_asl_global) & 0x80000000) == 0)
          {
            state64 = 0;
            if (!notify_get_state(SDWORD2(_asl_global), &state64))
              qword_1ECD9E110 = state64;
          }
        }
      }
    }
    if ((qword_1ECD9E118 & 0x10000) != 0)
    {
      v10 = v10 & 0xFFD90007 | qword_1ECD9E118 & 0x60000 | 0x200000;
      v11 = qword_1ECD9E110;
      if ((_BYTE)qword_1ECD9E118)
        v9 = qword_1ECD9E110;
    }
    else
    {
      v11 = qword_1ECD9E110;
    }
    if ((v11 & 0x10000) != 0)
    {
      v10 = v10 & 0xFFF1FFFF | v11 & 0xE0000 | 0x200000;
      if ((_BYTE)v11)
        v9 = v11;
    }
    pthread_mutex_unlock(&stru_1ECD9E150);
  }
  v12 = v10 & 0xFFFDFFFF;
  if (((v9 >> v5) & 1) != 0)
    v12 = v10;
  if (!v9)
    v12 = v10;
  if (*((_DWORD *)client + 13))
    v13 = v12 | 0x80000;
  else
    v13 = v12;
  __s1 = 0;
  v14 = asl_msg_lookup(msg, "com.apple.message.domain", (int **)&__s1, 0);
  if (__s1)
    v15 = v14 == 0;
  else
    v15 = 0;
  if (v15)
    v16 = v13 & 0xFF7BFFFF | 0x800000;
  else
    v16 = v13;
  __s1 = 0;
  v17 = asl_msg_lookup(msg, "com.apple.iokit.domain", (int **)&__s1, 0);
  v18 = __s1;
  __s1 = 0;
  v19 = asl_msg_lookup(msg, "ASLOption", (int **)&__s1, 0);
  v20 = __s1;
  __s1 = 0;
  if (asl_msg_lookup(msg, "CFLog Local Time", (int **)&__s1, 0))
    v21 = 1;
  else
    v21 = __s1 == 0;
  v22 = !v21;
  if (v19)
    v23 = 1;
  else
    v23 = v20 == 0;
  if (!v23)
    v22 = 1;
  if (v17)
    v24 = 1;
  else
    v24 = v18 == 0;
  if (!v24)
    v22 = 1;
  if (v22)
    v7 = v16 & 0xFFFBFFFF;
  else
    v7 = v16;
  __s1 = 0;
  if (!asl_msg_lookup(msg, "Facility", (int **)&__s1, 0) && (v25 = __s1) != 0
    || !asl_msg_lookup(*((_DWORD **)client + 4), "Facility", (int **)&__s1, 0) && (v25 = __s1) != 0)
  {
    if (!strcmp(v25, "com.apple.system.lastlog") || !strcmp(v25, "com.apple.system.utmpx"))
      v7 = v16 & 0xFFFBFFFF;
    v26 = asl_syslog_faciliy_num_to_name(112);
    if (!strcmp(v25, v26))
      return v16 & 0xFFFBFFFF;
  }
  return v7;
}

uint64_t asl_msg_lookup(_DWORD *a1, char *a2, int **a3, _WORD *a4)
{
  uint64_t v6;
  __int16 v7;
  int *v9;
  unsigned int v10;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v6 = 0xFFFFFFFFLL;
  v10 = -1;
  v9 = 0;
  if (_asl_msg_index(a1, a2, &v10, &v9) != -1)
  {
    if (a3)
      *a3 = _asl_msg_slot_val(v9, v10);
    if (a4)
    {
      if (v9)
      {
        v7 = 0;
        if (v10 <= 9 && *v9 == 1)
          v7 = *((_WORD *)v9 + v10 + 36);
      }
      else
      {
        v7 = 0;
      }
      v6 = 0;
      *a4 = v7;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t _asl_msg_index(_DWORD *a1, char *__s, _DWORD *a3, _QWORD *a4)
{
  _DWORD *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  BOOL v16;
  int v17;
  char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  if (!__s)
    return 0xFFFFFFFFLL;
  v7 = a1;
  if (*a1 == 1)
    v8 = 10;
  else
    v8 = 0;
  if (*a1)
    v9 = v8;
  else
    v9 = 15;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = a1;
  v10 = strlen(__s);
  v11 = _asl_msg_std_key(__s, v10);
  v12 = 0;
  while (2)
  {
    v13 = 0;
    v14 = v7 + 23;
    do
    {
      v15 = *v7;
      if (*v7 == 1)
      {
        if (v13 > 9)
          goto LABEL_22;
      }
      else
      {
        if (v15)
          v16 = 1;
        else
          v16 = v13 >= 0xF;
        if (v16)
          goto LABEL_22;
      }
      if (*((__int16 *)v7 + v13 + 16) == -1)
        goto LABEL_49;
LABEL_22:
      if (v11)
      {
        if (v15 == 1)
        {
          if (v13 > 9)
          {
LABEL_26:
            v17 = 0;
            goto LABEL_33;
          }
        }
        else if (v15 || v13 >= 0xF)
        {
          goto LABEL_26;
        }
        v17 = *((unsigned __int16 *)v7 + v13 + 16);
LABEL_33:
        if (v17 == v11)
          return (v12 + v13);
        goto LABEL_49;
      }
      if (v15 == 1)
      {
        if (v13 > 9)
          goto LABEL_46;
      }
      else if (v15 || v13 >= 0xF)
      {
        goto LABEL_46;
      }
      v18 = (char *)v7 + 2 * v13;
      if ((*((_WORD *)v18 + 16) & 0xC000) == 0x8000)
        goto LABEL_49;
      if (v15 == 1 && v13 > 9)
        goto LABEL_46;
      v19 = *((_WORD *)v18 + 16);
      if ((v19 & 0xC000) != 0x4000)
      {
        if (v15 == 1 && v13 > 9)
LABEL_46:
          v21 = 0;
        else
          v21 = *((unsigned __int16 *)v18 + 16);
        v20 = (char *)v14 + v21;
        goto LABEL_48;
      }
      if (v15 && v13 > 9)
        v19 = 0;
      v20 = *(const char **)((char *)v14 + (v19 & 0x3FFF));
LABEL_48:
      if (!strcmp(__s, v20))
        return (v12 + v13);
LABEL_49:
      ++v13;
      if (a3)
        *a3 = v13;
    }
    while (v13 < v9);
    v7 = (_DWORD *)*((_QWORD *)v7 + 3);
    if (v7)
    {
      if (a3)
        *a3 = 0;
      if (a4)
        *a4 = v7;
      v12 += v13;
      continue;
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t _asl_msg_std_key(char *__s1, unsigned int a2)
{
  unsigned __int16 v4;
  const char *v5;

  if (a2 >= 0x13 && !strncmp(__s1, "com.apple.message.", 0x12uLL))
  {
    v5 = __s1 + 18;
    if (!strcmp(v5, "domain"))
    {
      return (unsigned __int16)-32511;
    }
    else if (!strcmp(v5, "domain_scope"))
    {
      return (unsigned __int16)-32510;
    }
    else if (!strcmp(v5, "result"))
    {
      return (unsigned __int16)-32509;
    }
    else if (!strcmp(v5, "signature"))
    {
      return (unsigned __int16)-32508;
    }
    else if (!strcmp(v5, "signature2"))
    {
      return (unsigned __int16)-32507;
    }
    else if (!strcmp(v5, "signature3"))
    {
      return (unsigned __int16)-32506;
    }
    else if (!strcmp(v5, "success"))
    {
      return (unsigned __int16)-32505;
    }
    else if (!strcmp(v5, "uuid"))
    {
      return (unsigned __int16)-32504;
    }
    else if (!strcmp(v5, "value"))
    {
      return (unsigned __int16)-32503;
    }
    else if (!strcmp(v5, "value2"))
    {
      return (unsigned __int16)-32502;
    }
    else if (!strcmp(v5, "value3"))
    {
      return (unsigned __int16)-32501;
    }
    else if (!strcmp(v5, "value4"))
    {
      return (unsigned __int16)-32500;
    }
    else if (!strcmp(v5, "value5"))
    {
      return (unsigned __int16)-32499;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    switch(a2)
    {
      case 3u:
        if (!strcmp(__s1, "PID"))
        {
          v4 = -32762;
        }
        else if (!strcmp(__s1, "UID"))
        {
          v4 = -32761;
        }
        else
        {
          if (strcmp(__s1, "GID"))
            goto LABEL_7;
          v4 = -32760;
        }
        break;
      case 4u:
LABEL_7:
        if (!strcmp(__s1, "Time"))
        {
          v4 = -32767;
        }
        else
        {
          if (strcmp(__s1, "Host"))
            goto LABEL_9;
          v4 = -32765;
        }
        break;
      case 5u:
LABEL_9:
        if (strcmp(__s1, "Level"))
          goto LABEL_10;
        v4 = -32759;
        break;
      case 6u:
LABEL_10:
        if (!strcmp(__s1, "Sender"))
        {
          v4 = -32764;
        }
        else
        {
          if (strcmp(__s1, "RefPID"))
            goto LABEL_12;
          v4 = -32754;
        }
        break;
      case 7u:
LABEL_12:
        if (!strcmp(__s1, "Message"))
        {
          v4 = -32758;
        }
        else if (!strcmp(__s1, "Session"))
        {
          v4 = -32755;
        }
        else if (!strcmp(__s1, "ReadUID"))
        {
          v4 = -32757;
        }
        else if (!strcmp(__s1, "ReadGID"))
        {
          v4 = -32756;
        }
        else
        {
          if (strcmp(__s1, "RefProc"))
            goto LABEL_17;
          v4 = -32753;
        }
        break;
      case 8u:
LABEL_17:
        if (strcmp(__s1, "Facility"))
          goto LABEL_18;
        v4 = -32763;
        break;
      case 9u:
LABEL_18:
        if (strcmp(__s1, "ASLOption"))
          goto LABEL_19;
        v4 = -32750;
        break;
      case 0xBu:
LABEL_19:
        if (strcmp(__s1, "TimeNanoSec"))
          goto LABEL_20;
        v4 = -32766;
        break;
      case 0xCu:
LABEL_20:
        if (strcmp(__s1, "ASLMessageID"))
          goto LABEL_21;
        v4 = -32752;
        break;
      case 0xDu:
LABEL_21:
        if (strcmp(__s1, "ASLExpireTime"))
          goto LABEL_22;
        v4 = -32751;
        break;
      case 0xEu:
LABEL_22:
        if (strcmp(__s1, "ASLFreeNotify"))
          goto LABEL_23;
        v4 = -32749;
        break;
      default:
LABEL_23:
        v4 = 0;
        break;
    }
  }
  return v4;
}

int *_asl_msg_slot_val(int *result, unsigned int a2)
{
  int v2;
  int v3;
  unsigned int v4;

  if (!result)
    return result;
  v2 = *result;
  if (a2 >= 0xF && !v2 || a2 >= 0xA && v2 == 1)
    return 0;
  if (v2 == 1)
  {
    if (a2 <= 9)
    {
      v3 = 10;
      goto LABEL_13;
    }
LABEL_17:
    v4 = 0;
    return (int *)((char *)result + v4 + 92);
  }
  if (v2 || a2 >= 0xF)
    goto LABEL_17;
  v3 = 15;
LABEL_13:
  v4 = *((unsigned __int16 *)result + v3 + a2 + 16);
  if (v4 == 0xFFFF)
    return 0;
  if ((v4 & 0xC000) != 0x4000)
  {
    if ((v4 & 0xC000) != 0)
      return 0;
    return (int *)((char *)result + v4 + 92);
  }
  return *(int **)((char *)result + (v4 & 0x3FFF) + 92);
}

uint32_t asl_get_type(asl_object_t obj)
{
  if (obj)
    return *(_DWORD *)obj;
  else
    return -1;
}

char *asl_syslog_faciliy_num_to_name(int a1)
{
  unsigned int v1;
  unint64_t v2;

  if (a1 < 0)
    return 0;
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1;
  v1 = v2 >> 3;
  if (v1 > 0x18)
    return 0;
  else
    return off_1EA906CB8[v1];
}

uint64_t asl_client_get_control(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 40);
  else
    return 0xFFFFFFFFLL;
}

void _jump_dealloc_0(_QWORD *a1)
{
  void *v2;
  unint64_t v3;

  if (a1)
  {
    v2 = (void *)a1[2];
    if (v2)
    {
      if (*((_DWORD *)a1 + 2))
      {
        v3 = 0;
        do
          asl_msg_release(*(asl_object_t *)(a1[2] + 8 * v3++));
        while (v3 < *((unsigned int *)a1 + 2));
        v2 = (void *)a1[2];
      }
      free(v2);
    }
    free(a1);
  }
}

void _jump_dealloc_1(_DWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  FILE *v4;
  void *v5;

  if (a1)
  {
    if (a1[3] == 1)
    {
      asl_legacy1_close(*((void ***)a1 + 14));
    }
    else
    {
      v2 = (_QWORD *)*((_QWORD *)a1 + 3);
      if (v2)
      {
        do
        {
          v3 = (_QWORD *)v2[2];
          free(v2);
          *((_QWORD *)a1 + 3) = v3;
          v2 = v3;
        }
        while (v3);
      }
      free(*((void **)a1 + 4));
      v4 = (FILE *)*((_QWORD *)a1 + 13);
      if (v4)
        fclose(v4);
      v5 = (void *)*((_QWORD *)a1 + 15);
      if (v5)
        free(v5);
      *((_OWORD *)a1 + 6) = 0u;
      *((_OWORD *)a1 + 7) = 0u;
      *((_OWORD *)a1 + 4) = 0u;
      *((_OWORD *)a1 + 5) = 0u;
      *((_OWORD *)a1 + 2) = 0u;
      *((_OWORD *)a1 + 3) = 0u;
      *(_OWORD *)a1 = 0u;
      *((_OWORD *)a1 + 1) = 0u;
      free(a1);
    }
  }
}

void _jump_dealloc_2(char *a1)
{
  char *v1;
  char *v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int *v11;

  if (a1)
  {
    v1 = a1;
    while (1)
    {
      v2 = (char *)*((_QWORD *)v1 + 3);
      v3 = *(_DWORD *)v1 == 1 ? 10 : 0;
      v4 = *(_DWORD *)v1 ? v3 : 15;
      if ((_DWORD)v4)
        break;
LABEL_30:
      free(v1);
      v1 = v2;
      if (!v2)
        return;
    }
    v5 = 0;
    v6 = v1 + 92;
    while (1)
    {
      v7 = *(_DWORD *)v1;
      if (!*(_DWORD *)v1)
        break;
      if (v7 != 1)
      {
        v8 = 0;
        if (!v7)
        {
LABEL_20:
          v9 = 15;
LABEL_21:
          v10 = *(_WORD *)&v1[2 * v5 + 32 + 2 * v9];
          goto LABEL_22;
        }
LABEL_15:
        if (v7 == 1 && v5 <= 9)
        {
          v9 = 10;
          goto LABEL_21;
        }
        v10 = 0;
LABEL_22:
        if (v8 == 32787)
        {
          v11 = _asl_msg_slot_val((int *)v1, v5);
          if (v11)
            notify_post((const char *)v11);
        }
        else if ((v8 & 0xC000) == 0x4000)
        {
          free(*(void **)&v6[v8 & 0x3FFF]);
        }
        if ((v10 & 0xC000) == 0x4000)
          free(*(void **)&v6[v10 & 0x3FFF]);
        goto LABEL_29;
      }
      if (v5 <= 9)
        break;
LABEL_29:
      if (v4 == ++v5)
        goto LABEL_30;
    }
    v8 = *(unsigned __int16 *)&v1[2 * v5 + 32];
    if (!v7)
      goto LABEL_20;
    goto LABEL_15;
  }
}

void _jump_dealloc_3(_QWORD *a1)
{
  void *v2;
  FILE *v3;

  if (a1)
  {
    v2 = (void *)a1[2];
    if (v2)
      free(v2);
    a1[2] = 0;
    asl_store_file_closeall((uint64_t)a1);
    v3 = (FILE *)a1[3];
    if (v3)
      fclose(v3);
    free(a1);
  }
}

asl_object_t asl_new(uint32_t type)
{
  uint64_t v1;
  uint64_t (**v2)(uint64_t);

  if (type > 6)
    return 0;
  v1 = *(_QWORD *)&type;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_30);
  v2 = (uint64_t (**)(uint64_t))asl_jump[v1];
  if (*v2)
    return (asl_object_t)(*v2)(v1);
  else
    return 0;
}

double _jump_alloc()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  if (v0)
  {
    *(_QWORD *)&result = 0x100000002;
    *v0 = 0x100000002;
  }
  return result;
}

char *_jump_alloc_0(int a1)
{
  char *result;

  result = _asl_msg_make_page(a1);
  if (result)
  {
    *(_DWORD *)result = a1;
    *((_DWORD *)result + 1) = 1;
  }
  return result;
}

char *_asl_msg_make_page(int a1)
{
  char *v2;
  char *v3;
  int v4;

  v2 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x1020040D2F95E9BuLL);
  v3 = v2;
  if (v2)
  {
    if (a1 == 1)
      v4 = 20;
    else
      v4 = 0;
    if (!a1)
      v4 = 30;
    if (v4)
      memset(v2 + 32, 255, (2 * v4));
    *((_QWORD *)v3 + 2) = 312;
    *(_DWORD *)v3 = a1;
  }
  return v3;
}

asl_object_t asl_retain(asl_object_t obj)
{
  unsigned int *v1;
  unsigned int v2;

  if (obj)
  {
    v1 = (unsigned int *)((char *)obj + 4);
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }
  return obj;
}

uint64_t asl_string_append_internal(uint64_t a1, char *a2, int a3)
{
  uint64_t v3;
  char *v4;
  size_t v5;
  int v6;
  char *v7;
  int v8;
  unsigned __int8 v9;
  _QWORD *v10;
  char *v11;
  int v12;
  unsigned __int8 v13;
  char *v15;
  unsigned __int8 v16;
  _QWORD *v17;
  char *v18;
  size_t v19;
  unsigned int v20;
  int v21;
  _QWORD *appended;
  char v23;
  int v24;
  char *v25;
  size_t v26;
  unsigned int v27;
  _QWORD *v28;
  char *v29;
  size_t v30;
  char __str[8];
  uint64_t v33;

  v3 = a1;
  v33 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return v3;
  v4 = a2;
  if (!a2)
    return v3;
  switch(*(_DWORD *)(a1 + 8) & 0xF)
  {
    case 0:
      v5 = 0;
      goto LABEL_143;
    case 1:
      v6 = *a2;
      if (!*a2)
        return v3;
      v5 = 0;
      v7 = 0;
      while (1)
      {
        v8 = v4[1];
        if (v4[1])
          v9 = v4[2];
        else
          v9 = 0;
        if (v6 == 8)
        {
          if (v5)
          {
            asl_string_append_no_encoding_len((_QWORD *)v3, v7, v5);
            v7 = 0;
          }
          v10 = (_QWORD *)v3;
          v11 = "^H";
        }
        else
        {
          if (v6 == 13 || v6 == 10)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v7, v5);
              v7 = 0;
            }
          }
          else
          {
            if (v6 == 194 && v8 == 133)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v7, v5);
                v7 = 0;
              }
              asl_string_append_no_encoding_len((_QWORD *)v3, "\n\t", 2uLL);
              v5 = 0;
              ++v4;
              goto LABEL_20;
            }
            if (v6 != 226 || v8 != 128 || (v9 & 0xFE) != 0xA8)
            {
              if (!v7)
                v7 = v4;
              ++v5;
              goto LABEL_20;
            }
            if (v5)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v7, v5);
              v7 = 0;
            }
            v4 += 3;
          }
          v10 = (_QWORD *)v3;
          v11 = "\n\t";
        }
        asl_string_append_no_encoding_len(v10, v11, 2uLL);
        v5 = 0;
LABEL_20:
        v12 = *++v4;
        v6 = v12;
        if (!v12)
        {
          if (v5)
          {
            a1 = v3;
            a2 = v7;
            goto LABEL_143;
          }
          return v3;
        }
      }
    case 2:
      v13 = *a2;
      if (!*a2)
        return v3;
      v5 = 0;
      v15 = 0;
      do
      {
        if ((v13 & 0x80) != 0)
        {
          if (v13 == 160)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
              v15 = 0;
            }
            v17 = (_QWORD *)v3;
            v18 = "\\240";
            v19 = 4;
            goto LABEL_85;
          }
          if (v5)
          {
            asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
            v15 = 0;
          }
          asl_string_append_no_encoding_len((_QWORD *)v3, "\\M", 2uLL);
          v5 = 0;
          v16 = v13 & 0x7F;
        }
        else
        {
          v16 = v13;
        }
        if (v16 == 32)
        {
          if (a3)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
              v15 = 0;
            }
            v17 = (_QWORD *)v3;
            v18 = "\\s";
LABEL_84:
            v19 = 2;
LABEL_85:
            asl_string_append_no_encoding_len(v17, v18, v19);
LABEL_86:
            v5 = 0;
            goto LABEL_87;
          }
        }
        else
        {
          v20 = v16;
          if ((v13 & 0x80) == 0 && v16 == 92)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
              v15 = 0;
            }
            v17 = (_QWORD *)v3;
            v18 = "\\\\";
            goto LABEL_84;
          }
          if ((v13 & 0x80) == 0 && (*(_DWORD *)(v3 + 8) & 2) != 0)
          {
            v21 = *v4;
            if (v21 == 93 || v21 == 91)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
                v15 = 0;
                v21 = *v4;
              }
              v17 = (_QWORD *)v3;
              if (v21 == 91)
                v18 = "\\[";
              else
                v18 = "\\]";
              goto LABEL_84;
            }
          }
          if (v20 == 127)
          {
            if ((v13 & 0x80) != 0)
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
                v15 = 0;
              }
            }
            else
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
                v15 = 0;
              }
              asl_string_append_char_no_encoding((_QWORD *)v3, 92);
            }
            v17 = (_QWORD *)v3;
            v18 = "^?";
            goto LABEL_84;
          }
          if ((v20 - 33) > 0x5Du)
          {
            if ((v13 & 0x80) != 0 || (v20 - 7) > 6u)
            {
              if (v20 > 0x1F)
                goto LABEL_94;
              if ((v13 & 0x80) != 0)
              {
                if (v5)
                {
                  asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
                  v15 = 0;
                }
              }
              else
              {
                if (v5)
                {
                  asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
                  v15 = 0;
                }
                asl_string_append_char_no_encoding((_QWORD *)v3, 92);
              }
              appended = asl_string_append_char_no_encoding((_QWORD *)v3, 94);
              v23 = v20 + 64;
            }
            else
            {
              if (v5)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
                v15 = 0;
              }
              appended = asl_string_append_char_no_encoding((_QWORD *)v3, 92);
              v23 = aAbtnvfr[v20 - 7];
            }
LABEL_100:
            asl_string_append_char_no_encoding(appended, v23);
            goto LABEL_86;
          }
          if ((v13 & 0x80) != 0)
          {
            if (v5)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v15, v5);
              v15 = 0;
            }
            appended = asl_string_append_char_no_encoding((_QWORD *)v3, 45);
            v23 = v20;
            goto LABEL_100;
          }
        }
LABEL_94:
        if (!v15)
          v15 = v4;
        ++v5;
LABEL_87:
        v24 = *++v4;
        v13 = v24;
      }
      while (v24);
      if (v5)
      {
        a1 = v3;
        a2 = v15;
LABEL_143:
        asl_string_append_no_encoding_len((_QWORD *)a1, a2, v5);
      }
      return v3;
    case 3:
      v25 = 0;
      v26 = 0;
      while (2)
      {
        v27 = *v4;
        if (v27 <= 0x26)
        {
          if (v27 == 34)
          {
            if (v26)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v25, v26);
              v25 = 0;
            }
            v28 = (_QWORD *)v3;
            v29 = "&quot;";
            goto LABEL_130;
          }
          if (v27 == 38)
          {
            if (v26)
            {
              asl_string_append_no_encoding_len((_QWORD *)v3, v25, v26);
              v25 = 0;
            }
            v28 = (_QWORD *)v3;
            v29 = "&amp;";
            v30 = 5;
            goto LABEL_131;
          }
          if (!*v4)
          {
            if (v26)
            {
              a1 = v3;
              a2 = v25;
              v5 = v26;
              goto LABEL_143;
            }
            return v3;
          }
        }
        else
        {
          switch(v27)
          {
            case '\'':
              if (v26)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v25, v26);
                v25 = 0;
              }
              v28 = (_QWORD *)v3;
              v29 = "&apos;";
              goto LABEL_130;
            case '<':
              if (v26)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v25, v26);
                v25 = 0;
              }
              v28 = (_QWORD *)v3;
              v29 = "&lt;";
              goto LABEL_120;
            case '>':
              if (v26)
              {
                asl_string_append_no_encoding_len((_QWORD *)v3, v25, v26);
                v25 = 0;
              }
              v28 = (_QWORD *)v3;
              v29 = "&gt;";
LABEL_120:
              v30 = 4;
LABEL_131:
              asl_string_append_no_encoding_len(v28, v29, v30);
              v26 = 0;
LABEL_132:
              ++v4;
              continue;
          }
        }
        break;
      }
      if ((v27 & 0x80) != 0)
      {
        if (__maskrune(*v4, 0x200uLL))
          goto LABEL_127;
      }
      else if ((*(_DWORD *)(MEMORY[0x1E0C87458] + 4 * *v4 + 60) & 0x200) != 0)
      {
LABEL_127:
        if (v26)
        {
          asl_string_append_no_encoding_len((_QWORD *)v3, v25, v26);
          v25 = 0;
        }
        snprintf(__str, 8uLL, "&#x%02hhx;", v27);
        v29 = __str;
        v28 = (_QWORD *)v3;
LABEL_130:
        v30 = 6;
        goto LABEL_131;
      }
      if (!v25)
        v25 = v4;
      ++v26;
      goto LABEL_132;
    default:
      return v3;
  }
}

_QWORD *asl_string_append_char_no_encoding(_QWORD *a1, char a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    if (a1[3])
      v4 = 1;
    else
      v4 = 2;
    if ((_asl_string_grow((uint64_t)a1, v4) & 0x80000000) == 0)
    {
      *(_BYTE *)(a1[5] + a1[4]) = a2;
      v5 = a1[5];
      v6 = a1[4] + 1;
      a1[4] = v6;
      *(_BYTE *)(v5 + v6) = 0;
    }
  }
  return a1;
}

_QWORD *asl_string_append_no_encoding_len(_QWORD *a1, char *__s, size_t a3)
{
  size_t v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;

  if (a1 && __s)
  {
    v5 = a3;
    if (!a3)
      v5 = strlen(__s);
    if (a1[3])
      v6 = v5;
    else
      v6 = v5 + 1;
    if ((_asl_string_grow((uint64_t)a1, v6) & 0x80000000) == 0)
    {
      memcpy((void *)(a1[5] + a1[4]), __s, v5);
      v7 = a1[5];
      v8 = a1[4] + v5;
      a1[4] = v8;
      *(_BYTE *)(v7 + v8) = 0;
    }
  }
  return a1;
}

uint64_t _asl_string_grow(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  size_t *v4;
  uint64_t v5;
  size_t v6;
  uint64_t result;
  void *v8;
  unsigned int *v9;
  const void *v10;
  vm_address_t address;

  if (!a2)
    return 0;
  v4 = (size_t *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v3 + ~v5 >= a2)
      return 0;
    v6 = (v5 + a2 + *(_QWORD *)(a1 + 16)) / *(_QWORD *)(a1 + 16) * *(_QWORD *)(a1 + 16);
  }
  else
  {
    v6 = (a2 + *(_QWORD *)(a1 + 16) - 1) / *(_QWORD *)(a1 + 16) * *(_QWORD *)(a1 + 16);
  }
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) == 0)
  {
    v8 = reallocf(*(void **)(a1 + 40), v6);
    *(_QWORD *)(a1 + 40) = v8;
    if (v8)
    {
      result = 0;
      *v4 = v6;
      return result;
    }
    *v4 = 0;
    v4[1] = 0;
    return 0xFFFFFFFFLL;
  }
  address = 0;
  v9 = (unsigned int *)MEMORY[0x1E0C883F0];
  if (vm_allocate(*MEMORY[0x1E0C883F0], &address, v6, 1358954497))
    return 0xFFFFFFFFLL;
  v10 = *(const void **)(a1 + 40);
  if (v10)
  {
    memcpy((void *)address, v10, *(_QWORD *)(a1 + 24));
    MEMORY[0x1DF0EC3C8](*v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 24));
  }
  result = 0;
  *(_QWORD *)(a1 + 40) = address;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t asl_string_append(uint64_t a1, char *a2)
{
  return asl_string_append_internal(a1, a2, 0);
}

_QWORD *asl_string_append_no_encoding(_QWORD *a1, char *a2)
{
  return asl_string_append_no_encoding_len(a1, a2, 0);
}

char *asl_string_release_return_bytes(char *a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  vm_size_t v8;
  char __str[8];
  __int16 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 0;
  if ((a1[11] & 0x40) != 0)
  {
    snprintf(__str, 0xBuLL, "%10lu", *((_QWORD *)a1 + 4) - 10);
    v2 = *((_QWORD *)a1 + 5);
    *(_QWORD *)v2 = *(_QWORD *)__str;
    *(_WORD *)(v2 + 8) = v10;
  }
  v3 = (unsigned int *)(a1 + 4);
  do
  {
    v4 = __ldaxr(v3);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, v3));
  if (v5)
  {
    if ((*((_DWORD *)a1 + 2) & 0x80000000) != 0)
    {
      v8 = *((_QWORD *)a1 + 3);
      if (v8)
      {
        *(_QWORD *)__str = 0;
        v6 = 0;
        if (!vm_allocate(*MEMORY[0x1E0C883F0], (vm_address_t *)__str, v8, 1358954497))
        {
          memcpy(*(void **)__str, *((const void **)a1 + 5), *((_QWORD *)a1 + 3));
          return *(char **)__str;
        }
        return (char *)v6;
      }
    }
    else if (*((_QWORD *)a1 + 4))
    {
      return strdup(*((const char **)a1 + 5));
    }
    return 0;
  }
  v6 = *((_QWORD *)a1 + 5);
  free(a1);
  return (char *)v6;
}

_QWORD *asl_string_new(int a1)
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x30uLL, 0x1010040C41FE6D2uLL);
  if (result)
  {
    *result = 0x100000006;
    *((_DWORD *)result + 2) = a1;
    result[2] = 256;
    if (a1 < 0)
      result[2] = *MEMORY[0x1E0C88820];
    result[3] = 0;
    result[4] = 0;
    if ((a1 & 0x40000000) != 0)
      return asl_string_append_no_encoding_len(result, "         0 ", 0xBuLL);
  }
  return result;
}

uint64_t asl_string_length(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 32);
    if (v1)
      return v1 + 1;
    else
      return 0;
  }
  return result;
}

char *_asl_msg_slot_key(char *result, unsigned int a2)
{
  int v2;
  uint64_t v3;
  char **v4;

  if (result)
  {
    v2 = *(_DWORD *)result;
    if (a2 >= 0xF && !v2 || a2 >= 0xA && v2 == 1)
      return 0;
    if (v2 == 1)
    {
      if (a2 > 9)
      {
LABEL_10:
        LODWORD(v3) = 0;
LABEL_11:
        result += v3 + 92;
        return result;
      }
    }
    else if (v2 || a2 >= 0xF)
    {
      goto LABEL_10;
    }
    v3 = *(unsigned __int16 *)&result[2 * a2 + 32];
    if (v3 == 0xFFFF)
      return 0;
    switch(v3 & 0xC000)
    {
      case 0x8000:
        if ((unsigned __int16)(v3 + 0x7FFF) > 0x12u)
        {
          LOWORD(v3) = v3 + 32511;
          if ((unsigned __int16)v3 > 0xCu)
            return 0;
          v3 = (unsigned __int16)v3;
          v4 = MTStandardKey;
        }
        else
        {
          v3 = (unsigned __int16)(v3 + 0x7FFF);
          v4 = ASLStandardKey;
        }
        return v4[v3];
      case 0x4000:
        return *(char **)&result[(v3 & 0x3FFF) + 92];
      case 0:
        goto LABEL_11;
      default:
        return 0;
    }
  }
  return result;
}

uint64_t _asl_lib_vlog_text(__asl_object_s *a1, unsigned __int8 a2, __asl_object_s *a3, const char *a4, va_list a5)
{
  int *v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  __asl_object_s *v28;
  char *v29;
  char __strerrbuf[2048];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  v10 = __error();
  if (!a4)
    return 1;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = *v10;
  v29 = 0;
  while (a4[v11] == 37)
  {
    v16 = v11 + 1;
    if (!a4[v11 + 1])
      goto LABEL_9;
    if (a4[v11 + 1] == 109)
    {
      strerror_r(v15, __strerrbuf, 0x800uLL);
      v17 = strlen(__strerrbuf);
      v14 = 1;
      v11 = v16;
      v13 = v17;
    }
    else
    {
      v17 = 2;
      ++v11;
    }
LABEL_10:
    v12 += v17;
    ++v11;
  }
  if (a4[v11])
  {
LABEL_9:
    v17 = 1;
    goto LABEL_10;
  }
  if (v14)
  {
    v18 = (char *)malloc_type_malloc((v12 + 1), 0xBA4130ABuLL);
    if (v18)
    {
      v19 = v18;
      v28 = a3;
      v20 = 0;
      v21 = 0;
      while (1)
      {
        v22 = a4[v20];
        if (v22 != 37)
          break;
        v23 = (v20 + 1);
        if (!a4[v23])
          goto LABEL_25;
        if (a4[v23] != 109 || v13 == 0)
        {
          v19[v21] = 37;
          v25 = v21 + 1;
          v21 += 2;
          v19[v25] = a4[v23];
        }
        else
        {
          memcpy(&v19[v21], __strerrbuf, v13);
          v21 += v13;
        }
LABEL_26:
        v20 = v23 + 1;
      }
      if (!a4[v20])
      {
        v19[v21] = 0;
        v29 = 0;
        vasprintf(&v29, v19, a5);
        free(v19);
        a3 = v28;
        goto LABEL_30;
      }
      v19[v21++] = v22;
LABEL_25:
      LODWORD(v23) = v20;
      goto LABEL_26;
    }
    return 9;
  }
  else
  {
    v29 = 0;
    vasprintf(&v29, a4, a5);
LABEL_30:
    if (!v29)
      return 9;
    v26 = _asl_send_message_text(0, 0, a1, a2, a3, v29, 1);
    free(v29);
  }
  return v26;
}

int asl_set_filter(asl_object_t client, int f)
{
  __int16 v2;
  void *v5;
  int v6;

  v2 = f;
  if (client)
  {
    if (asl_get_type(client) == 5)
      return asl_client_set_filter((uint64_t)client, v2);
  }
  else
  {
    if (_asl_open_default_once != -1)
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    v5 = off_1ECD9E1A0;
    if (off_1ECD9E1A0)
    {
      pthread_mutex_lock(&stru_1ECD9E150);
      v6 = asl_client_set_filter((uint64_t)v5, v2);
      pthread_mutex_unlock(&stru_1ECD9E150);
      return v6;
    }
  }
  return -1;
}

uint64_t asl_client_set_filter(uint64_t a1, __int16 a2)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  result = *(unsigned __int16 *)(a1 + 40);
  *(_WORD *)(a1 + 40) = a2;
  return result;
}

void *_asl_object_init()
{
  void *result;

  asl_jump[0] = (uint64_t)asl_msg_jump_table();
  qword_1ECD9E1C0 = (uint64_t)asl_msg_jump_table();
  qword_1ECD9E1C8 = (uint64_t)asl_msg_list_jump_table();
  qword_1ECD9E1D0 = (uint64_t)asl_file_jump_table();
  qword_1ECD9E1D8 = (uint64_t)asl_store_jump_table();
  result = asl_client_jump_table();
  qword_1ECD9E1E0 = (uint64_t)result;
  return result;
}

uint64_t (**asl_msg_jump_table())()
{
  return &asl_msg_jump_table_jump;
}

void *asl_store_jump_table()
{
  return &asl_store_jump_table_jump;
}

uint64_t (**asl_msg_list_jump_table())()
{
  return &asl_msg_list_jump_table_jump;
}

void *asl_file_jump_table()
{
  return &asl_file_jump_table_jump;
}

void *asl_client_jump_table()
{
  return &asl_client_jump_table_jump;
}

char *_asl_time_string(const char *a1, char *__s, const char *a3)
{
  char *v6;
  int v7;
  unsigned __int8 v8;
  uint64_t v9;
  char *result;
  char *v11;
  int v12;
  unsigned int v13;
  int v14;
  unint64_t tm_gmtoff;
  uint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  int v20;
  char *v21;
  int v22;
  const char *v23;
  char *v24;
  tm v25;
  time_t v26;
  char v27[8];
  char __str[32];
  char v29[16];
  char v30[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  v26 = 0;
  memset(&v25, 0, sizeof(v25));
  v24 = 0;
  *(_QWORD *)v27 = 0;
  if (!a1 || strlen(a1) > 0x1F)
  {
    v6 = 0;
    strcpy(__str, "local");
LABEL_4:
    v29[0] = 0;
    goto LABEL_5;
  }
  v23 = a1;
  v6 = __str;
  snprintf(__str, 0x20uLL, "%s", v23);
  v11 = strchr(__str, 46);
  if (!v11)
    goto LABEL_4;
  *v11 = 0;
  v12 = atoi(v11 + 1);
  v29[0] = 0;
  if (v12)
  {
    v13 = v12;
    if (a3)
      v14 = atoi(a3);
    else
      v14 = 0;
    snprintf(v29, 0x10uLL, ".%09u", v14);
    if (v13 >= 9)
      v16 = 9;
    else
      v16 = v13;
    v29[v16 + 1] = 0;
    v6 = __str;
  }
LABEL_5:
  v26 = 0;
  if (__s)
    v26 = asl_core_parse_time(__s, 0);
  if (!strcasecmp(__str, "lcl") || !strcasecmp(__str, "local"))
  {
    result = ctime_r(&v26, v30);
    if (!result)
      return result;
    result[19] = 0;
    asprintf(&v24, "%s%s");
    return v24;
  }
  if (!strcasecmp(__str, "jz") || !strcasecmp(__str, "iso8601") || !strcasecmp(__str, "iso8601e"))
  {
    strncasecmp(__str, "iso8601", 7uLL);
    result = (char *)localtime_r(&v26, &v25);
    if (!result)
      return result;
    if (v25.tm_gmtoff >= 0)
      tm_gmtoff = v25.tm_gmtoff;
    else
      tm_gmtoff = -v25.tm_gmtoff;
    if (tm_gmtoff % 0xE10 > 0x3B)
      snprintf(v27, 8uLL, "%c%02lld:%02lld");
    else
      snprintf(v27, 8uLL, "%c%02lld");
    asprintf(&v24, "%d-%02d-%02d%c%02d:%02d:%02d%s%s", (v25.tm_year + 1900), (v25.tm_mon + 1), v25.tm_mday);
    return v24;
  }
  if (!strcasecmp(__str, "iso8601b"))
  {
    result = (char *)localtime_r(&v26, &v25);
    if (result)
    {
      if (v25.tm_gmtoff >= 0)
        v17 = v25.tm_gmtoff;
      else
        v17 = -v25.tm_gmtoff;
      if (v17 % 0xE10 > 0x3B)
        snprintf(v27, 8uLL, "%c%02lld:%02lld");
      else
        snprintf(v27, 8uLL, "%c%02lld");
      asprintf(&v24, "%d%02d%02dT%02d%02d%02d%s%s", (v25.tm_year + 1900), (v25.tm_mon + 1));
      return v24;
    }
    return result;
  }
  if (!strcasecmp(__str, "sec") || !strcasecmp(__str, "raw"))
  {
    asprintf(&v24, "%llu%s");
    return v24;
  }
  if (!strcasecmp(__str, "j"))
  {
    result = (char *)localtime_r(&v26, &v25);
    if (!result)
      return result;
    asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s", (v25.tm_year + 1900));
    return v24;
  }
  if (!strcasecmp(__str, "utc")
    || !strcasecmp(__str, "zulu")
    || !strcasecmp(__str, "iso8601z")
    || !strcasecmp(__str, "iso8601ez"))
  {
    strncasecmp(__str, "iso8601", 7uLL);
    result = (char *)gmtime_r(&v26, &v25);
    if (!result)
      return result;
    asprintf(&v24, "%d-%02d-%02d%c%02d:%02d:%02d%sZ", (v25.tm_year + 1900), (v25.tm_mon + 1));
    return v24;
  }
  if (!strcasecmp(__str, "iso8601bz"))
  {
    result = (char *)gmtime_r(&v26, &v25);
    if (!result)
      return result;
    asprintf(&v24, "%d%02d%02dT%02d%02d%02d%sZ", (v25.tm_year + 1900));
    return v24;
  }
  v7 = __str[0];
  if (!__str[1] && ((__str[0] & 0xDF) - 65) <= 0x19u)
  {
    v8 = __str[0] - 32;
    if (__str[0] <= 0x60u)
      v8 = __str[0];
    if (v8 == 90)
    {
      v9 = 0;
      goto LABEL_77;
    }
    if (v8 - 65 <= 8)
    {
      v9 = 3600 * v8 - 230400;
      goto LABEL_77;
    }
    if (v8 - 75 <= 2)
    {
      v9 = 3600 * v8 - 234000;
      goto LABEL_77;
    }
    if (v8 - 78 <= 0xB)
    {
      v9 = 3600 * (77 - v8);
      goto LABEL_77;
    }
    return 0;
  }
  v18 = *v6;
  if (v18 == 45 || v18 == 43)
  {
    v19 = *++v6;
    v18 = v19;
  }
  if ((v18 - 48) > 9)
    return 0;
  v20 = atoi(v6);
  v21 = strchr(v6, 58);
  if (v21)
  {
    v22 = atoi(v21 + 1);
    if (v7 == 45)
      v9 = -(3600 * v20 + 60 * v22);
    else
      v9 = 3600 * v20 + 60 * v22;
    if (v22)
    {
      snprintf(v27, 8uLL, "%c%02lld:%02lld");
      goto LABEL_77;
    }
  }
  else if (v7 == 45)
  {
    v9 = -3600 * v20;
  }
  else
  {
    v9 = 3600 * v20;
  }
  snprintf(v27, 8uLL, "%c%02lld");
LABEL_77:
  v26 += v9;
  memset(&v25, 0, sizeof(v25));
  result = (char *)gmtime_r(&v26, &v25);
  if (result)
  {
    if ((__str[0] - 65) > 0x19)
    {
      if ((__str[0] - 97) > 0x19)
        asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s%s", (v25.tm_year + 1900), (v25.tm_mon + 1));
      else
        asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s%c", (v25.tm_year + 1900), (v25.tm_mon + 1));
    }
    else
    {
      asprintf(&v24, "%d-%02d-%02d %02d:%02d:%02d%s%c", (v25.tm_year + 1900), (v25.tm_mon + 1));
    }
    return v24;
  }
  return result;
}

time_t asl_core_parse_time(char *__s, int *a2)
{
  unsigned int v4;
  int v5;
  int matched;
  time_t v8;

  v8 = 0;
  if (a2)
    *a2 = 0;
  if (!__s)
    return -1;
  v4 = strlen(__s);
  if (!v4)
    return -1;
  v5 = *__s;
  if (v5 == 45 || v5 == 43)
    goto LABEL_7;
  if ((v5 & 0xFFFFFFDF) - 65 > 0x19)
  {
    if (v4 <= 4)
    {
LABEL_7:
      matched = asl_core_str_match_absolute_or_relative_time((uint64_t)__s, &v8, a2);
      goto LABEL_8;
    }
    if (__s[4] == 46)
    {
      matched = asl_core_str_match_dotted_time((uint64_t)__s, &v8, a2);
    }
    else
    {
      if (asl_core_str_match_absolute_or_relative_time((uint64_t)__s, &v8, a2))
        return v8;
      matched = asl_core_str_match_iso_8601_time((uint64_t)__s, &v8, a2);
    }
  }
  else
  {
    matched = asl_core_str_match_c_time((uint64_t)__s, &v8, a2);
  }
LABEL_8:
  if (matched)
    return v8;
  else
    return -1;
}

uint64_t asl_core_str_match_absolute_or_relative_time(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  _BYTE *v5;
  int v6;
  uint64_t v7;
  time_t v8;
  int v9;
  _BYTE *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  _BYTE *v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  _BYTE *v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  time_t v28;
  _QWORD *v29;

  if (!result)
    return result;
  v5 = (_BYTE *)result;
  LOBYTE(v6) = *(_BYTE *)result;
  if (*(_BYTE *)result)
  {
    v7 = 0;
    while ((_DWORD)v7 != 1)
    {
      if (!memchr("+-", (char)v6, 3uLL))
        goto LABEL_13;
      v6 = v5[++v7];
      if (!v6)
      {
        if ((_DWORD)v7 != 1)
          goto LABEL_13;
        break;
      }
    }
    v8 = time(0);
    if (*v5 == 45)
      v9 = -1;
    else
      v9 = 1;
    LODWORD(v7) = 1;
  }
  else
  {
    LODWORD(v7) = 0;
LABEL_13:
    v8 = 0;
    v9 = 1;
  }
  v10 = &v5[v7];
  LOBYTE(v11) = *v10;
  if (!*v10)
    return 0;
  v12 = 0;
  do
  {
    if (!memchr("0123456789", (char)v11, 0xBuLL))
      break;
    v11 = v5[v7 + 1 + v12++];
  }
  while (v11);
  if (!(_DWORD)v12)
    return 0;
  v27 = v9;
  v28 = v8;
  v29 = a2;
  v13 = 0;
  v14 = v12;
  v15 = &v5[v7];
  v16 = v12;
  do
  {
    v17 = *v15++;
    v13 = v17 + 10 * v13 - 48;
    --v16;
  }
  while (v16);
  v18 = &v10[v12];
  v19 = *v18;
  if (v10[v14])
  {
    v20 = 0;
    LOBYTE(v21) = *v18;
    while ((_DWORD)v20 != 1)
    {
      if (memchr("SsMmHhDdWw", (char)v21, 0xBuLL))
      {
        v21 = v5[v7 + 1 + v14 + v20++];
        if (v21)
          continue;
      }
      goto LABEL_29;
    }
    LODWORD(v20) = 1;
LABEL_29:
    if (v19 <= 99)
    {
      if (v19 <= 76)
      {
        if (v19 != 68)
        {
          if (v19 != 72)
            goto LABEL_47;
          goto LABEL_37;
        }
LABEL_44:
        v22 = 86400;
        goto LABEL_46;
      }
      if (v19 != 77)
      {
        if (v19 != 87)
          goto LABEL_47;
        goto LABEL_45;
      }
LABEL_43:
      v13 *= 60;
      goto LABEL_47;
    }
    if (v19 > 108)
    {
      if (v19 == 119)
      {
LABEL_45:
        v22 = 604800;
        goto LABEL_46;
      }
      if (v19 == 109)
        goto LABEL_43;
    }
    else
    {
      if (v19 == 100)
        goto LABEL_44;
      if (v19 == 104)
      {
LABEL_37:
        v22 = 3600;
LABEL_46:
        v13 *= v22;
      }
    }
  }
  else
  {
    LODWORD(v20) = 0;
  }
LABEL_47:
  v23 = &v18[v20];
  LOBYTE(v24) = *v23;
  if (*v23)
  {
    v25 = 0;
    v26 = (unint64_t)&v5[v14 + 1 + v20 + v7];
    while ((_DWORD)v25 != 1)
    {
      if (!memchr(" \t\n", (char)v24, 4uLL))
      {
        if (!(_DWORD)v25)
          return 0;
        break;
      }
      v24 = *(unsigned __int8 *)(v26 + v25++);
      if (!v24)
        break;
    }
  }
  if (a3)
    *a3 = (_DWORD)v23 - (_DWORD)v5;
  if (v29)
    *v29 = v28 + v13 * v27;
  return 1;
}

BOOL asl_core_str_match(char *a1, char *__s, unsigned int a3, int a4, unsigned int a5, unsigned int *a6)
{
  char *v11;
  unsigned int v12;
  unsigned int v13;
  char v14;
  char *v15;
  BOOL v16;
  unsigned int v17;

  if (!a1)
    return a3 == 0;
  v11 = a1;
  v12 = 0;
  v13 = 0;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  *a6 = v13;
  v14 = *v11;
  if (*v11)
  {
    while (1)
    {
      if (a4 && v13 == a4)
        return 1;
      if (__s)
      {
        v15 = strchr(__s, v14);
        v16 = !v15 || (a5 & 1) == 0;
        if (((v15 == 0) & (a5 >> 1)) == 0 && v16)
          break;
      }
      v17 = v12;
      if (a6)
        v17 = *a6;
      ++v11;
      v13 = v17 + 1;
      if (a6)
        goto LABEL_3;
LABEL_5:
      v14 = *v11;
      v12 = v13;
      if (!*v11)
        goto LABEL_19;
    }
    if (a6)
      v12 = *a6;
  }
  else
  {
LABEL_19:
    v12 = v13;
  }
  return v12 >= a3;
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  char v3;
  uint64_t v4;
  __asl_object_s *v5;

  v3 = opts;
  v4 = asl_client_open(ident, (char *)facility, opts);
  v5 = (__asl_object_s *)v4;
  if ((v3 & 4) == 0 && v4)
    _asl_notify_open(1);
  return v5;
}

void _asl_notify_open(int a1)
{
  char *v2;
  char *v3;
  int v4;

  if (a1)
  {
    pthread_mutex_lock(&stru_1ECD9E150);
    LODWORD(_asl_global) = _asl_global + 1;
    if (DWORD2(_asl_global) != -1)
    {
LABEL_15:
      pthread_mutex_unlock(&stru_1ECD9E150);
      return;
    }
  }
  else
  {
    LODWORD(_asl_global) = _asl_global + 1;
    if (DWORD2(_asl_global) != -1)
      return;
  }
  if (DWORD1(_asl_global) == -1 && notify_register_check("com.apple.asl.remote", (int *)&_asl_global + 1))
    DWORD1(_asl_global) = -1;
  if (HIDWORD(_asl_global) == -1 && notify_register_plain())
    HIDWORD(_asl_global) = -1;
  v2 = asl_remote_notify_name();
  if (v2)
  {
    v3 = v2;
    v4 = notify_register_plain();
    free(v3);
    if (v4)
      DWORD2(_asl_global) = -1;
  }
  if (a1)
    goto LABEL_15;
}

char *asl_remote_notify_name()
{
  char *v1;

  getpid();
  v1 = 0;
  if (geteuid())
    asprintf(&v1, "user.uid.%d.syslog.%d");
  else
    asprintf(&v1, "%s.%d");
  return v1;
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  uint64_t v3;

  if (!obj)
    return -1;
  if (*(_DWORD *)obj == 1)
    v3 = 0xFFFFLL;
  else
    v3 = 0;
  return asl_object_set_key_val_op(obj, (uint64_t)key, (uint64_t)value, v3);
}

uint64_t _jump_set_key_val_op(int *a1, char *a2, const char *a3, int a4)
{
  if (asl_msg_set_key_val_op(a1, a2, a3, a4))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

void ___asl_open_default_block_invoke()
{
  uint64_t v0;

  v0 = asl_client_open(0, 0, 4u);
  off_1ECD9E1A0 = (_UNKNOWN *)v0;
  if (v0)
    *(_DWORD *)(v0 + 12) = 0;
  _asl_notify_open(0);
}

int asl_log_message(int level, const char *format, ...)
{
  uint32_t v3;
  int v4;
  va_list va;

  va_start(va, format);
  v3 = _asl_evaluate_send(0, 0, level);
  if ((v3 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v3 & 0x80000) != 0)
    {
      v4 = _asl_lib_vlog_text(0, v3, 0, format, va);
      goto LABEL_8;
    }
  }
  else if ((v3 & 0x1A0000) != 0)
  {
    v4 = _asl_lib_vlog(0, v3, 0, format, va);
    goto LABEL_8;
  }
  v4 = 0;
LABEL_8:
  if (v4)
    return -1;
  else
    return 0;
}

uint64_t asl_object_set_key_val_op(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v8)(_DWORD *, uint64_t, uint64_t, uint64_t);

  if (!a1 || *a1 > 6u)
    return 0xFFFFFFFFLL;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_2);
  v8 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 16);
  if (v8)
    return v8(a1, a2, a3, a4);
  else
    return 0xFFFFFFFFLL;
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  uint64_t v2;

  asl_object_append((int *)obj, (uint64_t)msg, v2);
  return 0;
}

void asl_object_append(int *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  void (*v7)(int *, uint64_t, uint64_t);

  if (a1)
  {
    v6 = *a1;
    if (*a1 > 6)
      return;
  }
  else
  {
    v6 = 5;
  }
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_20);
  v7 = *(void (**)(int *, uint64_t, uint64_t))(asl_jump[v6] + 96);
  if (v7)
    v7(a1, a2, a3);
}

uint64_t asl_client_internal_send(__asl_object_s *a1, __asl_object_s *a2)
{
  uint32_t v4;
  int *val_for_key;
  int *v6;
  uint64_t result;

  v4 = _asl_evaluate_send(a1, a2, -1);
  val_for_key = asl_msg_get_val_for_key((int *)a2, "Message");
  if ((v4 & 0x40000) != 0 && val_for_key && *(_BYTE *)val_for_key && os_log_shim_enabled())
  {
    v6 = asl_msg_get_val_for_key((int *)a2, "Level");
    if (v6)
      atoi((const char *)v6);
    os_log_with_args_wrapper();
    result = 0;
    if ((v4 & 0x80000) != 0)
      return _asl_send_message_text(0, 0, a1, v4, a2, 0, 1);
  }
  else if ((v4 & 0x1A0000) != 0)
  {
    return _asl_send_message(a1, v4, a2, 0);
  }
  else
  {
    return 0;
  }
  return result;
}

int *asl_msg_get_val_for_key(int *result, char *a2)
{
  int *v2;
  unsigned int v3;

  if (result)
  {
    v3 = -1;
    v2 = 0;
    if (_asl_msg_index(result, a2, &v3, &v2) == -1)
      return 0;
    else
      return _asl_msg_slot_val(v2, v3);
  }
  return result;
}

uint64_t os_log_with_args_wrapper()
{
  return os_log_with_args();
}

uint64_t _jump_append(__asl_object_s *a1, asl_object_t obj)
{
  uint64_t result;

  result = asl_get_type(obj);
  if ((_DWORD)result == 2)
  {
    asl_msg_list_reset_iteration((uint64_t)obj, 0);
    do
    {
      result = asl_msg_list_next((uint64_t)obj);
      if (!result)
        break;
      result = asl_client_internal_send(a1, (__asl_object_s *)result);
    }
    while (!(_DWORD)result);
  }
  else if (result <= 1)
  {
    return asl_client_internal_send(a1, obj);
  }
  return result;
}

void _jump_append_0(uint64_t a1, asl_object_t obj)
{
  if (asl_get_type(obj) <= 1)
    asl_msg_list_insert(a1, 0xFFFFFFFF, obj);
}

uint64_t _jump_append_1(uint64_t a1, asl_object_t obj)
{
  uint64_t result;
  uint64_t v5;

  result = asl_get_type(obj);
  if (a1 && (*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    v5 = 0;
    if ((_DWORD)result == 2)
    {
      asl_msg_list_reset_iteration((uint64_t)obj, 0);
      do
      {
        result = asl_msg_list_next((uint64_t)obj);
        if (!result)
          break;
        result = asl_file_save(a1, (_DWORD *)result, &v5);
      }
      while (!(_DWORD)result);
    }
    else if (result <= 1)
    {
      return asl_file_save(a1, obj, &v5);
    }
  }
  return result;
}

int *_jump_append_2(int *a1, asl_object_t obj)
{
  int *result;

  result = (int *)asl_get_type(obj);
  if (result <= 1)
    return asl_msg_merge(a1, obj);
  return result;
}

uint64_t _jump_append_3(uint64_t a1, asl_object_t obj)
{
  uint64_t result;

  result = asl_get_type(obj);
  if (a1 && (*(_BYTE *)(a1 + 2640) & 1) == 0)
  {
    if ((_DWORD)result == 2)
    {
      asl_msg_list_reset_iteration((uint64_t)obj, 0);
      do
      {
        result = asl_msg_list_next((uint64_t)obj);
        if (!result)
          break;
        result = asl_store_save(a1, (_DWORD *)result);
      }
      while (!(_DWORD)result);
    }
    else if (result <= 1)
    {
      return asl_store_save(a1, obj);
    }
  }
  return result;
}

void _asl_client_free_internal(uint64_t a1)
{
  __asl_object_s *v2;
  __asl_object_s *v3;
  uint64_t v4;
  unint64_t v5;

  if (a1)
  {
    v2 = *(__asl_object_s **)(a1 + 32);
    if (v2)
      asl_msg_release(v2);
    *(_QWORD *)(a1 + 32) = 0;
    v3 = *(__asl_object_s **)(a1 + 64);
    if (v3)
      asl_file_close(v3);
    *(_QWORD *)(a1 + 64) = 0;
    if (*(_DWORD *)(a1 + 52))
    {
      v4 = 0;
      v5 = 0;
      do
      {
        free(*(void **)(*(_QWORD *)(a1 + 56) + v4 + 16));
        free(*(void **)(*(_QWORD *)(a1 + 56) + v4 + 24));
        ++v5;
        v4 += 32;
      }
      while (v5 < *(unsigned int *)(a1 + 52));
    }
    free(*(void **)(a1 + 56));
    free((void *)a1);
  }
}

void asl_client_release(asl_object_t obj)
{
  if (obj)
    asl_release(obj);
}

uint64_t asl_client_add_output_file(uint64_t a1, int a2, const char *a3, const char *a4, int a5, int a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t result;
  char *v17;
  uint64_t v18;
  char *v19;
  char **v20;
  uint64_t v21;
  uint64_t v22;

  if (!a1)
    return 9999;
  v12 = *(unsigned int *)(a1 + 52);
  if ((_DWORD)v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)(a1 + 56);
    while (*(_DWORD *)(v14 + v13) != a2)
    {
      v13 += 32;
      if (32 * v12 == v13)
      {
        v15 = *(void **)(a1 + 56);
        goto LABEL_9;
      }
    }
    free(*(void **)(v14 + v13 + 16));
    v21 = *(_QWORD *)(a1 + 56) + v13;
    *(_QWORD *)(v21 + 16) = 0;
    if (a3)
      *(_QWORD *)(v21 + 16) = strdup(a3);
    free(*(void **)(v21 + 24));
    v22 = *(_QWORD *)(a1 + 56) + v13;
    *(_QWORD *)(v22 + 24) = 0;
    if (a4)
      *(_QWORD *)(v22 + 24) = strdup(a4);
    result = 0;
    *(_DWORD *)(v22 + 4) = a6;
    *(_DWORD *)(v22 + 8) = a5;
  }
  else
  {
    v15 = 0;
    *(_QWORD *)(a1 + 56) = 0;
LABEL_9:
    v17 = (char *)reallocf(v15, 32 * (v12 + 1));
    *(_QWORD *)(a1 + 56) = v17;
    if (v17)
    {
      v18 = *(unsigned int *)(a1 + 52);
      v19 = &v17[32 * v18];
      *(_DWORD *)v19 = a2;
      *((_DWORD *)v19 + 1) = a6;
      *((_DWORD *)v19 + 2) = a5;
      *((_QWORD *)v19 + 2) = 0;
      if (a3)
        *((_QWORD *)v19 + 2) = strdup(a3);
      *((_QWORD *)v19 + 3) = 0;
      v20 = (char **)(v19 + 24);
      if (a4)
        *v20 = strdup(a4);
      result = 0;
      *(_DWORD *)(a1 + 52) = v18 + 1;
    }
    else
    {
      return 9999;
    }
  }
  return result;
}

uint64_t asl_client_open_from_file(int a1, const char *a2, char *a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = asl_client_open(a2, a3, 0);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 40) = 196863;
    if (asl_file_open_write_fd(a1, (_QWORD *)(v4 + 64)))
    {
      _asl_client_free_internal(v5);
      return 0;
    }
    else
    {
      *(_QWORD *)(v5 + 72) = 1;
    }
  }
  return v5;
}

asl_object_t asl_client_retain(asl_object_t obj)
{
  if (obj)
    asl_retain(obj);
  return obj;
}

uint64_t asl_client_send(__asl_object_s *a1, __asl_object_s *a2)
{
  return asl_client_internal_send(a1, a2);
}

uint64_t asl_client_match(uint64_t a1, char *a2, char **a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  mach_port_t service_port;
  mach_port_t v14;
  char *v15;
  uint64_t v16;
  __asl_object_s *v17;
  unsigned int *v18;
  int v20;
  vm_address_t address;
  char *v22;
  int v23;
  vm_size_t size;
  __asl_object_s *v25;
  char *v26;

  if (!asl_store_location())
  {
    v25 = 0;
    v26 = 0;
    LODWORD(v22) = 0;
    v15 = asl_msg_list_to_string(a2, &v22);
    free(v15);
    v16 = 0;
    if (asl_store_open_read(0, &v25))
      return v16;
    if (v25)
    {
      v16 = asl_store_match((uint64_t)v25, (uint64_t)a2, &v26, a4, a5, a6, a7);
      v17 = v25;
      *a3 = v26;
      asl_store_close(v17);
      return v16;
    }
    return 0;
  }
  v25 = 0;
  service_port = asl_core_get_service_port();
  if (!service_port)
    return 0;
  v14 = service_port;
  size = 0;
  v23 = 0;
  address = 0;
  v26 = 0;
  if (a2)
  {
    v26 = asl_msg_list_to_string(a2, (_DWORD *)&size + 1);
    if (!v26)
      return 0;
    goto LABEL_10;
  }
  asprintf(&v26, "0\n");
  HIDWORD(size) = 3;
  if (!v26)
    return 0;
LABEL_10:
  v18 = (unsigned int *)MEMORY[0x1E0C883F0];
  if (vm_allocate(*MEMORY[0x1E0C883F0], &address, HIDWORD(size), 1358954497))
    return 0;
  memmove((void *)address, v26, HIDWORD(size));
  free(v26);
  v22 = 0;
  v20 = _asl_server_match(v14, address, SHIDWORD(size), a4, a5, a6, a7, &v25, &size, &v22, &v23);
  v16 = 0;
  if (!v20)
  {
    *a3 = v22;
    v16 = (uint64_t)asl_msg_list_from_string((const char *)v25);
    MEMORY[0x1DF0EC3C8](*v18, v25, size);
  }
  return v16;
}

uint64_t asl_client_search(uint64_t a1, __asl_object_s *a2)
{
  mach_port_t service_port;
  mach_port_t v4;
  char *v5;
  char *v6;
  unint64_t v7;
  char v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __asl_object_s *v14;
  vm_address_t address;
  char *v17;
  int v18;
  unsigned int v19;
  int size[3];
  char *v21;

  if (asl_store_location())
  {
    *(_QWORD *)&size[1] = 0;
    v18 = 0;
    v19 = 0;
    v17 = 0;
    service_port = asl_core_get_service_port();
    if (!service_port)
      return 0;
    v4 = service_port;
    address = 0;
    size[0] = 0;
    v5 = asl_msg_to_string(a2, size);
    v21 = 0;
    if (v5)
    {
      v6 = v5;
      asprintf(&v21, "1\n%s\n", v5);
      size[0] += 3;
      free(v6);
    }
    else
    {
      asprintf(&v21, "0\n");
      size[0] = 3;
    }
    if (v21
      && (v9 = (unsigned int *)MEMORY[0x1E0C883F0],
          !vm_allocate(*MEMORY[0x1E0C883F0], &address, size[0], 1358954497)))
    {
      memmove((void *)address, v21, size[0]);
      free(v21);
      v10 = 0;
      if (!_asl_server_query_2(v4, address, size[0], 0, 0, 0, &size[1], &v19, &v17, &v18))
      {
        v10 = (uint64_t)asl_msg_list_from_string(*(const char **)&size[1]);
        MEMORY[0x1DF0EC3C8](*v9, *(_QWORD *)&size[1], v19);
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    LOWORD(address) = 0;
    v21 = 0;
    *(_QWORD *)&size[1] = 0;
    v17 = 0;
    v7 = 0;
    if (!asl_msg_lookup(a2, "ASLMessageID", (int **)&v17, &address) && v17)
    {
      v8 = address;
      if ((address & 2) != 0)
      {
        v11 = atoll(v17);
        if ((v8 & 1) != 0)
          v7 = v11;
        else
          v7 = v11 + 1;
      }
      else
      {
        v7 = 0;
      }
    }
    v10 = 0;
    if (!asl_store_open_read(0, &size[1]))
    {
      v12 = *(_QWORD *)&size[1];
      if (*(_QWORD *)&size[1])
      {
        if (a2)
        {
          asl_msg_list_new();
          v14 = (__asl_object_s *)v13;
          asl_msg_list_append(v13, a2);
          v12 = *(_QWORD *)&size[1];
        }
        else
        {
          v14 = 0;
        }
        v10 = asl_store_match(v12, (uint64_t)v14, &v21, v7, 0, 0, 1);
        asl_store_close(*(__asl_object_s **)&size[1]);
        asl_msg_list_release(v14);
      }
    }
  }
  return v10;
}

uint64_t asl_client_set_control(uint64_t a1, int a2)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  result = *(unsigned int *)(a1 + 40);
  *(_DWORD *)(a1 + 40) = a2;
  return result;
}

uint64_t asl_client_set_output_file_filter(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  _DWORD *i;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = *(unsigned int *)(a1 + 52);
  if (!(_DWORD)v3)
    return 0;
  for (i = (_DWORD *)(*(_QWORD *)(a1 + 56) + 8); *(i - 2) != a2; i += 8)
  {
    if (!--v3)
      return 0;
  }
  result = *i;
  *i = a3;
  return result;
}

uint64_t asl_client_remove_output_file(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  void *v16;
  void *v17;

  if (!a1)
    return 1;
  v3 = *(_DWORD *)(a1 + 52);
  if (!v3)
    return 0;
  v4 = 0;
  v5 = 0;
  v6 = *(_QWORD *)(a1 + 56);
  while (*(_DWORD *)(v6 + v5) != a2)
  {
    v5 += 32;
    if (v3 == (_DWORD)++v4)
      return 0;
  }
  free(*(void **)(v6 + 32 * (int)v4 + 16));
  free(*(void **)(*(_QWORD *)(a1 + 56) + 32 * (int)v4 + 24));
  v8 = v4 + 1;
  LODWORD(v9) = *(_DWORD *)(a1 + 52);
  if ((int)v4 + 1 < v9)
  {
    v10 = v5 + 32;
    v11 = 32 * (int)v4;
    do
    {
      v12 = *(_QWORD *)(a1 + 56);
      v13 = (_OWORD *)(v12 + v11);
      v14 = (_OWORD *)(v12 + v10);
      v15 = v14[1];
      *v13 = *v14;
      v13[1] = v15;
      ++v8;
      v9 = *(unsigned int *)(a1 + 52);
      v11 += 32;
      v10 += 32;
    }
    while (v8 < v9);
  }
  v16 = *(void **)(a1 + 56);
  *(_DWORD *)(a1 + 52) = v9 - 1;
  if ((_DWORD)v9 == 1)
  {
    free(v16);
    result = 0;
    *(_QWORD *)(a1 + 56) = 0;
  }
  else
  {
    v17 = reallocf(v16, 32 * (v9 - 1));
    *(_QWORD *)(a1 + 56) = v17;
    if (v17)
      return 0;
    *(_DWORD *)(a1 + 52) = 0;
    return 9999;
  }
  return result;
}

uint64_t asl_client_kvdict(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t _jump_search(int a1, asl_object_t obj)
{
  uint64_t type;

  type = asl_get_type(obj);
  if (obj && type >= 2)
    return 0;
  else
    return asl_client_search(type, obj);
}

uint64_t _jump_match(int a1, asl_object_t obj, char **a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t type;

  type = asl_get_type(obj);
  if (!obj || (_DWORD)type == 2)
    return asl_client_match(type, (char *)obj, a3, a4, a5, a6, a7);
  else
    return 0;
}

void _asl_fork_child()
{
  _asl_global = xmmword_1DE3EEA00;
  qword_1ECD9E138 = 0;
  dword_1ECD9E140 = 0;
  qword_1ECD9E120 = 0;
  qword_1ECD9E128 = 0;
  dword_1ECD9E130 = 0;
  pthread_mutex_init(&stru_1ECD9E150, 0);
  _asl_redirect_fork_child();
}

uint64_t asl_core_get_service_port()
{
  if (qword_1ECD9E138 != -1)
    dispatch_once(&qword_1ECD9E138, &__block_literal_global_27);
  return dword_1ECD9E140;
}

void *_asl_open_default()
{
  if (_asl_open_default_once != -1)
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  return off_1ECD9E1A0;
}

int asl_add_output_file(asl_object_t client, int fd, const char *mfmt, const char *tfmt, int filter, int text_encoding)
{
  int v12;
  void *v13;

  if (client)
  {
    if (asl_get_type(client) == 5)
    {
      v12 = asl_client_add_output_file((uint64_t)client, fd, mfmt, tfmt, filter, text_encoding);
      goto LABEL_8;
    }
    return -1;
  }
  if (_asl_open_default_once != -1)
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  v13 = off_1ECD9E1A0;
  if (!off_1ECD9E1A0)
    return -1;
  pthread_mutex_lock(&stru_1ECD9E150);
  v12 = asl_client_add_output_file((uint64_t)v13, fd, mfmt, tfmt, filter, text_encoding);
  pthread_mutex_unlock(&stru_1ECD9E150);
LABEL_8:
  if (v12)
    return -1;
  else
    return 0;
}

int asl_set_output_file_filter(asl_object_t client, int fd, int filter)
{
  void *v7;
  int v8;

  if (client)
  {
    if (asl_get_type(client) == 5)
      return asl_client_set_output_file_filter((uint64_t)client, fd, filter);
  }
  else
  {
    if (_asl_open_default_once != -1)
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    v7 = off_1ECD9E1A0;
    if (off_1ECD9E1A0)
    {
      pthread_mutex_lock(&stru_1ECD9E150);
      v8 = asl_client_set_output_file_filter((uint64_t)v7, fd, filter);
      pthread_mutex_unlock(&stru_1ECD9E150);
      return v8;
    }
  }
  return -1;
}

uint64_t asl_add_output(__asl_object_s *a1, int a2, const char *a3, const char *a4, int text_encoding)
{
  return asl_add_output_file(a1, a2, a3, a4, 255, text_encoding);
}

int asl_add_log_file(asl_object_t client, int descriptor)
{
  return asl_add_output_file(client, descriptor, "std", "lcl", 255, 1);
}

uint64_t asl_remove_output_file(__asl_object_s *a1, int a2)
{
  int v4;
  void *v5;

  if (a1)
  {
    if (asl_get_type(a1) == 5)
    {
      v4 = asl_client_remove_output_file((uint64_t)a1, a2);
      goto LABEL_8;
    }
    return 0xFFFFFFFFLL;
  }
  if (_asl_open_default_once != -1)
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  v5 = off_1ECD9E1A0;
  if (!off_1ECD9E1A0)
    return 0xFFFFFFFFLL;
  pthread_mutex_lock(&stru_1ECD9E150);
  v4 = asl_client_remove_output_file((uint64_t)v5, a2);
  pthread_mutex_unlock(&stru_1ECD9E150);
LABEL_8:
  if (v4)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t _asl_lib_vlog(__asl_object_s *a1, int a2, __asl_object_s *a3, const char *a4, va_list a5)
{
  int *v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  __asl_object_s *v28;
  char *v29;
  char __strerrbuf[2048];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  v10 = __error();
  if (!a4)
    return 1;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = *v10;
  v29 = 0;
  while (a4[v11] == 37)
  {
    v16 = v11 + 1;
    if (!a4[v11 + 1])
      goto LABEL_9;
    if (a4[v11 + 1] == 109)
    {
      strerror_r(v15, __strerrbuf, 0x800uLL);
      v17 = strlen(__strerrbuf);
      v14 = 1;
      v11 = v16;
      v13 = v17;
    }
    else
    {
      v17 = 2;
      ++v11;
    }
LABEL_10:
    v12 += v17;
    ++v11;
  }
  if (a4[v11])
  {
LABEL_9:
    v17 = 1;
    goto LABEL_10;
  }
  if (v14)
  {
    v18 = (char *)malloc_type_malloc((v12 + 1), 0xEC53D65AuLL);
    if (v18)
    {
      v19 = v18;
      v28 = a3;
      v20 = 0;
      v21 = 0;
      while (1)
      {
        v22 = a4[v20];
        if (v22 != 37)
          break;
        v23 = (v20 + 1);
        if (!a4[v23])
          goto LABEL_25;
        if (a4[v23] != 109 || v13 == 0)
        {
          v19[v21] = 37;
          v25 = v21 + 1;
          v21 += 2;
          v19[v25] = a4[v23];
        }
        else
        {
          memcpy(&v19[v21], __strerrbuf, v13);
          v21 += v13;
        }
LABEL_26:
        v20 = v23 + 1;
      }
      if (!a4[v20])
      {
        v19[v21] = 0;
        v29 = 0;
        vasprintf(&v29, v19, a5);
        free(v19);
        a3 = v28;
        goto LABEL_30;
      }
      v19[v21++] = v22;
LABEL_25:
      LODWORD(v23) = v20;
      goto LABEL_26;
    }
    return 9;
  }
  else
  {
    v29 = 0;
    vasprintf(&v29, a4, a5);
LABEL_30:
    if (!v29)
      return 9;
    v26 = _asl_send_message(a1, a2, a3, v29);
    free(v29);
  }
  return v26;
}

uint64_t _asl_send_message(asl_object_t obj, int a2, __asl_object_s *a3, const char *a4)
{
  int v6;
  uint32_t type;
  unsigned int v9;
  int v10;
  asl_object_t v11;
  uint64_t v12;
  int v13;
  char v14;
  int *v15;
  int *v16;
  int *v17;
  int *v18;
  uint64_t v19;
  int *v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  __darwin_time_t tv_sec;
  __darwin_time_t v26;
  int v27;
  unsigned int v28;
  int v29;
  unint64_t v30;
  unsigned int v31;
  __darwin_time_t v32;
  unint64_t v33;
  char *v34;
  int v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  __asl_object_s *v45;
  _QWORD block[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  timeval v51;
  int *v52;
  int *v53;
  char __str[256];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C874D8];
  v52 = 0;
  v53 = 0;
  v51.tv_sec = 0;
  *(_QWORD *)&v51.tv_usec = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2000000000;
  v50 = 0;
  if ((a2 & 0x1A0000) == 0)
  {
    v12 = 0;
    goto LABEL_40;
  }
  v6 = a2;
  if (obj)
  {
    type = asl_get_type(obj);
    if (v6 >= 7u)
      v9 = 7;
    else
      v9 = v6;
    if (type != 5)
    {
      v14 = 0;
      v11 = 0;
      v13 = 0;
      goto LABEL_21;
    }
    v10 = 0;
    v11 = obj;
  }
  else
  {
    if (_asl_open_default_once != -1)
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    v11 = (asl_object_t)off_1ECD9E1A0;
    if (!off_1ECD9E1A0)
      goto LABEL_37;
    if (v6 >= 7u)
      v9 = 7;
    else
      v9 = v6;
    v10 = 1;
  }
  if (*((_QWORD *)v11 + 8))
    v13 = 1;
  else
    v13 = v10;
  v14 = 1;
LABEL_21:
  if (gettimeofday(&v51, 0))
  {
    v51.tv_sec = time(0);
    v51.tv_usec = 0;
  }
  v53 = 0;
  if (asl_msg_lookup(a3, "Sender", &v53, 0))
    v53 = 0;
  v52 = 0;
  if (asl_msg_lookup(a3, "Facility", &v52, 0))
  {
    v15 = 0;
    v52 = 0;
  }
  else
  {
    v15 = v52;
  }
  v16 = asl_base_msg((uint64_t)v11, v9, (uint64_t)&v51, v53, v15, a4);
  if (!v16)
  {
LABEL_37:
    v12 = 9999;
    goto LABEL_40;
  }
  v17 = v16;
  if ((v6 & 0x200000) != 0)
    _asl_set_option(v16);
  if (v13)
    pthread_mutex_lock(&stru_1ECD9E150);
  v18 = asl_msg_merge(v17, a3);
  if ((v14 & 1) != 0)
  {
    v19 = *((_QWORD *)v11 + 8);
    if (v19)
    {
      if (v18)
      {
        v12 = asl_file_save(v19, v18, (uint64_t *)v11 + 9);
        ++*((_QWORD *)v11 + 9);
      }
      else
      {
        v12 = 9999;
      }
      goto LABEL_100;
    }
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___asl_send_message_block_invoke;
    block[3] = &unk_1EA9069F8;
    block[4] = &v47;
    if (_asl_send_message_noquota_once != -1)
      dispatch_once(&_asl_send_message_noquota_once, block);
    if (*((_DWORD *)v48 + 6))
    {
      v21 = asl_base_msg((uint64_t)v11, 2u, (uint64_t)&v51, v53, v52, "*** MESSAGE QUOTA DISABLED FOR THIS PROCESS ***");
      asl_msg_set_key_val(v21, "ASLOption", "store");
      if ((v6 & 0x200000) != 0)
      {
LABEL_71:
        if (qword_1ECD9E138 != -1)
          dispatch_once(&qword_1ECD9E138, &__block_literal_global_27);
        v12 = 0;
        if ((v6 & 0x20000) == 0 || !dword_1ECD9E140)
          goto LABEL_97;
        if ((v6 & 0x400000) != 0)
        {
          asl_msg_set_key_val(v18, "Level", "Critical");
          asl_msg_set_key_val(v18, "Message", "*** LOG MESSAGE QUOTA EXCEEDED - SOME MESSAGES FROM THIS PROCESS HAVE BEEN DISCARDED ***");
        }
        if (!v21)
        {
LABEL_82:
          v38 = (char *)asl_msg_to_string_raw(-1073741822, v18, "raw");
          v39 = asl_string_length((uint64_t)v38);
          v12 = v39;
          if (v39 > 0x1F4000)
          {
            snprintf(__str, 0x100uLL, "*** ASL MESSAGE SIZE (%u bytes) EXCEEDED MAXIMIMUM SIZE (%u bytes) ***", v39, 2048000);
            v40 = asl_base_msg((uint64_t)v11, 2u, (uint64_t)&v51, v53, v52, __str);
            asl_string_release((uint64_t)v38);
            if (v40)
            {
              if ((v6 & 0x200000) != 0)
                _asl_set_option(v40);
              v38 = (char *)asl_msg_to_string_raw(-1073741822, v40, "raw");
              v41 = asl_string_length((uint64_t)v38);
              asl_msg_release((asl_object_t)v40);
            }
            else
            {
              v41 = 0;
            }
            v12 = v41;
          }
          v42 = asl_string_allocated_size((uint64_t)v38);
          v43 = asl_string_release_return_bytes(v38);
          if ((_DWORD)v12)
          {
            if (!_asl_server_message(dword_1ECD9E140, (uint64_t)v43, v12))
            {
              v12 = 0;
              goto LABEL_97;
            }
            v44 = 0xFFFFFFFFLL;
          }
          else
          {
            v44 = 0;
            if (!v42)
            {
LABEL_97:
              if (v18 && *((_DWORD *)v11 + 13))
                _asl_send_message_text(v11, v18, obj, v6, a3, a4, 0);
LABEL_100:
              asl_msg_release((asl_object_t)v18);
              if (!v13)
                goto LABEL_40;
              goto LABEL_39;
            }
          }
          v12 = v44;
          MEMORY[0x1DF0EC3C8](*MEMORY[0x1E0C883F0], v43, v42);
          goto LABEL_97;
        }
        v45 = (__asl_object_s *)v21;
        v34 = (char *)asl_msg_to_string_raw(-1073741822, v21, "raw");
        v35 = asl_string_length((uint64_t)v34);
        v36 = asl_string_allocated_size((uint64_t)v34);
        v37 = asl_string_release_return_bytes(v34);
        if (v35)
        {
          if (!_asl_server_message(dword_1ECD9E140, (uint64_t)v37, v35))
          {
LABEL_81:
            asl_msg_release(v45);
            goto LABEL_82;
          }
        }
        else if (!v36)
        {
          goto LABEL_81;
        }
        MEMORY[0x1DF0EC3C8](*MEMORY[0x1E0C883F0], v37, v36);
        goto LABEL_81;
      }
    }
    else
    {
      v21 = 0;
      if ((v6 & 0x200000) != 0)
        goto LABEL_71;
    }
    v22 = dword_1ECD9E130;
    if (dword_1ECD9E130 == -1)
      goto LABEL_71;
    v24 = qword_1ECD9E120;
    v23 = qword_1ECD9E128;
    tv_sec = v51.tv_sec;
    v26 = v51.tv_sec - qword_1ECD9E120;
    if (v51.tv_sec <= qword_1ECD9E120)
    {
      v29 = dword_1ECD9E130;
    }
    else
    {
      v27 = 10 * v26;
      if (v26 >= 3600)
        v27 = 36000;
      v28 = v27 + dword_1ECD9E130;
      if (v28 >= 0x8CA0)
        v29 = 36000;
      else
        v29 = v28;
      while (1)
      {
        v30 = __ldaxr((unint64_t *)&qword_1ECD9E120);
        if (v30 != v24)
          break;
        if (!__stlxr(tv_sec, (unint64_t *)&qword_1ECD9E120))
          goto LABEL_60;
      }
      __clrex();
    }
LABEL_60:
    if (v29)
    {
      while (1)
      {
        v31 = __ldaxr((unsigned int *)&dword_1ECD9E130);
        if (v31 != v22)
          break;
        if (!__stlxr(v29 - 1, (unsigned int *)&dword_1ECD9E130))
          goto LABEL_71;
      }
    }
    else
    {
      v32 = v51.tv_sec;
      if ((uint64_t)(v51.tv_sec - v23) < 61)
      {
        v6 &= ~0x20000u;
        goto LABEL_71;
      }
      v6 |= 0x400000u;
      while (1)
      {
        v33 = __ldaxr(&qword_1ECD9E128);
        if (v33 != v23)
          break;
        if (!__stlxr(v32, &qword_1ECD9E128))
          goto LABEL_71;
      }
    }
    __clrex();
    goto LABEL_71;
  }
  asl_append(obj, (asl_object_t)v18);
  asl_msg_release((asl_object_t)v18);
  v12 = 0;
  if (v13)
LABEL_39:
    pthread_mutex_unlock(&stru_1ECD9E150);
LABEL_40:
  _Block_object_dispose(&v47, 8);
  return v12;
}

int asl_vlog(asl_object_t obj, asl_object_t msg, int level, const char *format, va_list ap)
{
  uint32_t v9;
  int v10;

  v9 = _asl_evaluate_send(obj, msg, level);
  if ((v9 & 0x40000) != 0 && os_log_shim_enabled())
  {
    os_log_with_args();
    if ((v9 & 0x80000) != 0)
    {
      v10 = _asl_lib_vlog_text(obj, v9, msg, format, ap);
      goto LABEL_8;
    }
  }
  else if ((v9 & 0x1A0000) != 0)
  {
    v10 = _asl_lib_vlog(obj, v9, msg, format, ap);
    goto LABEL_8;
  }
  v10 = 0;
LABEL_8:
  if (v10)
    return -1;
  else
    return 0;
}

int _asl_lib_log(asl_object_t client, uint32_t eval, asl_object_t msg, const char *format, ...)
{
  va_list va;

  va_start(va, format);
  if ((eval & 0x1A0000) != 0)
    return _asl_lib_vlog(client, eval, msg, format, va);
  else
    return 0;
}

uint64_t asl_get_filter(asl_object_t obj, _DWORD *a2, _DWORD *a3, _DWORD *a4, int *a5)
{
  asl_object_t v10;
  int v11;
  uint64_t result;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int check;

  if (obj && asl_get_type(obj) != 5)
    return 0xFFFFFFFFLL;
  if (_asl_open_default_once != -1)
    dispatch_once(&_asl_open_default_once, &__block_literal_global);
  if (obj)
    v10 = obj;
  else
    v10 = (asl_object_t)off_1ECD9E1A0;
  if (v10)
  {
    v11 = *((unsigned __int8 *)v10 + 40);
    if (!off_1ECD9E1A0)
      goto LABEL_28;
  }
  else
  {
    v11 = 0;
    if (!off_1ECD9E1A0)
      goto LABEL_28;
  }
  if ((*((_BYTE *)off_1ECD9E1A0 + 12) & 4) == 0)
  {
    check = 0;
    v16 = 0;
    pthread_mutex_lock(&stru_1ECD9E150);
    if ((DWORD1(_asl_global) & 0x80000000) == 0)
    {
      check = 0;
      if (!notify_check(SDWORD1(_asl_global), &check))
      {
        if (check)
        {
          if ((HIDWORD(_asl_global) & 0x80000000) == 0)
          {
            v16 = 0;
            if (!notify_get_state(SHIDWORD(_asl_global), &v16))
              qword_1ECD9E118 = v16;
          }
          if ((DWORD2(_asl_global) & 0x80000000) == 0)
          {
            v16 = 0;
            if (!notify_get_state(SDWORD2(_asl_global), &v16))
              qword_1ECD9E110 = v16;
          }
        }
      }
    }
    v13 = qword_1ECD9E118;
    v14 = qword_1ECD9E110;
    if ((_DWORD)qword_1ECD9E110)
      v15 = 2;
    else
      v15 = qword_1ECD9E118 != 0;
    pthread_mutex_unlock(&stru_1ECD9E150);
    if (!a2)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_28:
  v13 = 0;
  v14 = 0;
  v15 = 0;
  if (a2)
LABEL_29:
    *a2 = v11;
LABEL_30:
  if (a3)
    *a3 = v13;
  if (a4)
    *a4 = v14;
  result = 0;
  if (a5)
    *a5 = v15;
  return result;
}

uint64_t asl_set_local_control(__asl_object_s *a1, int a2)
{
  __asl_object_s *v3;

  if (a1)
  {
    v3 = a1;
    if (asl_get_type(a1) != 5)
      return 0xFFFFFFFFLL;
  }
  else
  {
    if (_asl_open_default_once != -1)
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    v3 = (__asl_object_s *)off_1ECD9E1A0;
    if (!off_1ECD9E1A0)
      return 0xFFFFFFFFLL;
  }
  return asl_client_set_control((uint64_t)v3, a2);
}

uint64_t asl_get_local_control(__asl_object_s *a1)
{
  __asl_object_s *v1;

  if (a1)
  {
    v1 = a1;
    if (asl_get_type(a1) != 5)
      return 0xFFFFFFFFLL;
  }
  else
  {
    if (_asl_open_default_once != -1)
      dispatch_once(&_asl_open_default_once, &__block_literal_global);
    v1 = (__asl_object_s *)off_1ECD9E1A0;
    if (!off_1ECD9E1A0)
      return 0xFFFFFFFFLL;
  }
  return asl_client_get_control((uint64_t)v1);
}

int asl_create_auxiliary_file(asl_object_t msg, const char *title, const char *uti, int *out_descriptor)
{
  if (!out_descriptor)
    return -1;
  if (_asl_auxiliary(msg, title, uti, 0, out_descriptor))
    return -1;
  return 0;
}

uint64_t _asl_auxiliary(__asl_object_s *a1, const char *a2, const char *a3, const char *a4, _DWORD *a5)
{
  int *v10;
  int *v11;
  const char *v12;
  int *v13;
  _QWORD *v14;
  _QWORD *v15;
  dispatch_fd_t v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  _QWORD *v29;
  _QWORD v30[8];
  _QWORD cleanup_handler[4];
  dispatch_fd_t v32;
  const char *v33;
  unsigned int v34;
  uint64_t v35;
  int v36[2];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C874D8];
  v10 = (int *)asl_msg_new(0);
  v11 = v10;
  if (a4)
    asl_msg_set_key_val(v10, "ASLAuxURL", a4);
  if (a2)
    asl_msg_set_key_val(v11, "ASLAuxTitle", a2);
  if (a3)
    v12 = a3;
  else
    v12 = "public.data";
  asl_msg_set_key_val(v11, "ASLAuxUTI", v12);
  v13 = asl_msg_merge(v11, a1);
  if (!a5)
  {
    v18 = _asl_evaluate_send(0, (asl_object_t)v13, -1);
    v19 = _asl_send_message(0, v18, (__asl_object_s *)v13, 0);
    asl_msg_release((asl_object_t)v13);
    return v19;
  }
  v35 = 0;
  v34 = 0;
  v33 = 0;
  if (asl_store_location())
  {
    v14 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040F89CB87BuLL);
    if (v14)
    {
      v15 = v14;
      if ((pipe(v36) & 0x80000000) == 0)
      {
        v16 = v36[0];
        v17 = dispatch_semaphore_create(0);
        v15[2] = v17;
        *(_DWORD *)v15 = v36[1];
        if (!_asl_aux_save_context((uint64_t)v15))
        {
          v25 = dispatch_queue_create("ASL_AUX_PIPE_Q", 0);
          v26 = MEMORY[0x1E0C87450];
          cleanup_handler[0] = MEMORY[0x1E0C87450];
          cleanup_handler[1] = 0x40000000;
          cleanup_handler[2] = ___asl_auxiliary_block_invoke;
          cleanup_handler[3] = &__block_descriptor_tmp_56;
          v32 = v16;
          v27 = dispatch_io_create(0, v16, v25, cleanup_handler);
          *a5 = v36[1];
          dispatch_io_set_low_water(v27, 0xFFFFFFFFFFFFFFFFLL);
          v30[0] = v26;
          v30[1] = 0x40000000;
          v30[2] = ___asl_auxiliary_block_invoke_2;
          v30[3] = &__block_descriptor_tmp_59;
          v30[4] = v13;
          v30[5] = v17;
          v30[6] = v27;
          v30[7] = v25;
          dispatch_io_read(v27, 0, 0xFFFFFFFFFFFFFFFFLL, v25, v30);
          return 0;
        }
        close(v36[0]);
        close(v36[1]);
        dispatch_release(v17);
      }
      free(v15);
    }
    return 9999;
  }
  if (qword_1ECD9E138 != -1)
    dispatch_once(&qword_1ECD9E138, &__block_literal_global_27);
  if (!dword_1ECD9E140)
    return 9999;
  v21 = (char *)asl_msg_to_string_raw(-1073741822, v13, "raw");
  v22 = asl_string_length((uint64_t)v21);
  v23 = asl_string_allocated_size((uint64_t)v21);
  v24 = asl_string_release_return_bytes(v21);
  if (!v22)
  {
    asl_msg_release((asl_object_t)v13);
    MEMORY[0x1DF0EC3C8](*MEMORY[0x1E0C883F0], v24, v23);
    return 9999;
  }
  HIDWORD(v35) = 0;
  v34 = 0;
  if (_asl_server_create_aux_link(dword_1ECD9E140, (uint64_t)v24, v22, (_DWORD *)&v35 + 1, &v33, &v35, &v34))
  {
    MEMORY[0x1DF0EC3C8](*MEMORY[0x1E0C883F0], v24, v23);
LABEL_22:
    asl_msg_release((asl_object_t)v13);
    return 9999;
  }
  if (v34)
  {
    asl_msg_release((asl_object_t)v13);
    return v34;
  }
  if (v33)
  {
    asl_msg_set_key_val(v13, "ASLAuxURL", v33);
    MEMORY[0x1DF0EC3C8](*MEMORY[0x1E0C883F0], v33, v35);
  }
  if (!HIDWORD(v35))
    goto LABEL_22;
  v28 = fileport_makefd();
  mach_port_deallocate(*MEMORY[0x1E0C883F0], HIDWORD(v35));
  if (v28 < 0)
  {
    asl_msg_release((asl_object_t)v13);
  }
  else
  {
    v29 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040F89CB87BuLL);
    if (v29)
    {
      *a5 = v28;
      *(_DWORD *)v29 = v28;
      v29[1] = v13;
      return _asl_aux_save_context((uint64_t)v29);
    }
  }
  return 0xFFFFFFFFLL;
}

int asl_log_auxiliary_location(asl_object_t msg, const char *title, const char *uti, const char *url)
{
  if (_asl_auxiliary(msg, title, uti, url, 0))
    return -1;
  else
    return 0;
}

int asl_close_auxiliary_file(int descriptor)
{
  uint64_t v2;
  void *v3;
  __asl_object_s *v4;
  NSObject *v5;
  int v6;
  uint32_t v7;
  uint64_t v9;

  pthread_mutex_lock(&stru_1ECD9E150);
  if (dword_1ECD9E190 < 1)
  {
LABEL_5:
    v4 = 0;
    v5 = 0;
    goto LABEL_6;
  }
  v2 = 0;
  while (1)
  {
    v3 = *(void **)(qword_1ECD9E198 + 8 * v2);
    if (*(_DWORD *)v3 == descriptor)
      break;
    if (dword_1ECD9E190 == ++v2)
      goto LABEL_5;
  }
  v4 = (__asl_object_s *)*((_QWORD *)v3 + 1);
  v5 = *((_QWORD *)v3 + 2);
  free(v3);
  v9 = (dword_1ECD9E190 - 1);
  if ((int)v2 + 1 < dword_1ECD9E190)
  {
    do
    {
      *(_QWORD *)(qword_1ECD9E198 + 8 * v2) = *(_QWORD *)(qword_1ECD9E198 + 8 * v2 + 8);
      ++v2;
    }
    while (v9 != v2);
  }
  dword_1ECD9E190 = v9;
  if ((_DWORD)v9)
  {
    qword_1ECD9E198 = (uint64_t)reallocf((void *)qword_1ECD9E198, 8 * (int)v9);
    if (qword_1ECD9E198)
    {
      v6 = 0;
      goto LABEL_7;
    }
    dword_1ECD9E190 = 0;
LABEL_6:
    v6 = -1;
    goto LABEL_7;
  }
  free((void *)qword_1ECD9E198);
  v6 = 0;
  qword_1ECD9E198 = 0;
LABEL_7:
  pthread_mutex_unlock(&stru_1ECD9E150);
  close(descriptor);
  if (v4)
  {
    v7 = _asl_evaluate_send(0, v4, -1);
    if (_asl_send_message(0, v7, v4, 0))
      v6 = -1;
    asl_msg_release(v4);
  }
  if (v5)
  {
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
  return v6;
}

asl_object_t _asl_server_control_query()
{
  unsigned int *v0;
  asl_object_t v1;
  vm_address_t v2;
  __asl_object_s *v3;
  vm_address_t address;
  uint64_t v6;
  int v7;
  unsigned int v8;
  const char *v9;

  if (qword_1ECD9E138 != -1)
    dispatch_once(&qword_1ECD9E138, &__block_literal_global_27);
  if (!dword_1ECD9E140)
    return 0;
  address = 0;
  v6 = 0;
  v9 = 0;
  v8 = 0;
  v0 = (unsigned int *)MEMORY[0x1E0C883F0];
  v1 = 0;
  if (vm_allocate(*MEMORY[0x1E0C883F0], &address, 0x1BuLL, 1358954497))
    return v1;
  v2 = address;
  *(_OWORD *)address = *(_OWORD *)"1\nQ [= ASLOption control]\n";
  strcpy((char *)(v2 + 11), "ption control]\n");
  v7 = 0;
  v1 = 0;
  if (_asl_server_query_2(dword_1ECD9E140, v2, 27, 0, 256, 0, &v9, &v8, &v6, &v7))
    return v1;
  v3 = asl_msg_list_from_string(v9);
  MEMORY[0x1DF0EC3C8](*v0, v9, v8);
  if (!v3)
    return 0;
  if (*((_DWORD *)v3 + 2))
    v1 = asl_msg_retain(**((asl_object_t **)v3 + 2));
  else
    v1 = 0;
  asl_msg_list_release(v3);
  return v1;
}

uint64_t asl_store_location()
{
  uint64_t result;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1ECD9E138 != -1)
    dispatch_once(&qword_1ECD9E138, &__block_literal_global_27);
  result = dword_1ECD9E140;
  if (dword_1ECD9E140)
  {
    v3 = 0;
    v4 = 0;
    v2 = 0;
    v1 = _asl_server_query_2(dword_1ECD9E140, 0, 0, 0, -1, 0, &v4, (_DWORD *)&v3 + 1, &v2, &v3);
    result = 0;
    if (!v1)
    {
      if (v4)
        MEMORY[0x1DF0EC3C8](*MEMORY[0x1E0C883F0], v4, HIDWORD(v3));
      return (_DWORD)v3 == 0;
    }
  }
  return result;
}

asl_object_t asl_open_path(const char *path, uint32_t opts)
{
  uint32_t v3;
  asl_object_t result;
  char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  __asl_object_s *v9;
  __asl_object_s *v10;
  __asl_object_s *v11;
  stat v12;

  memset(&v12, 0, sizeof(v12));
  v10 = 0;
  v11 = 0;
  if (opts)
    v3 = opts;
  else
    v3 = 0x80000000;
  if ((v3 & 0x80000000) != 0)
  {
    if (path)
    {
      memset(&v12, 0, sizeof(v12));
      if (stat(path, &v12) < 0)
        return 0;
      if ((__int16)v12.st_mode < 0)
      {
        v6 = asl_file_open_read(path, (uint64_t *)&v11);
        goto LABEL_25;
      }
      if ((v12.st_mode & 0x4000) == 0)
        return 0;
      v5 = (char *)path;
    }
    else
    {
      v5 = "/var/log/asl";
    }
    v6 = asl_store_open_read(v5, &v10);
LABEL_23:
    v9 = v10;
    goto LABEL_26;
  }
  result = 0;
  if (path && (v3 & 1) != 0)
  {
    memset(&v12, 0, sizeof(v12));
    if (stat(path, &v12) < 0)
    {
      if (*__error() != 2)
        return 0;
      if ((v3 & 2) != 0)
      {
LABEL_22:
        v6 = asl_store_open_write(path, &v10);
        goto LABEL_23;
      }
    }
    else if (((__int16)v12.st_mode & 0x80000000) == 0)
    {
      if ((v12.st_mode & 0x4000) != 0)
        goto LABEL_22;
      return 0;
    }
    v7 = geteuid();
    v8 = getegid();
    v6 = asl_file_open_write(path, 0x1A4u, v7, v8, (uint64_t *)&v11);
LABEL_25:
    v9 = v11;
LABEL_26:
    if (v6)
      return 0;
    else
      return v9;
  }
  return result;
}

uint64_t ___asl_global_init_block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("ASL_DISABLE");
  if (!v0 || (result = strcmp(v0, "1"), (_DWORD)result))
  {
    result = bootstrap_look_up2();
    if ((_DWORD)result)
      dword_1ECD9E140 = 0;
  }
  return result;
}

void _asl_set_option(int *a1)
{
  BOOL v2;
  char *v3;
  const char *v4;

  v4 = 0;
  if (asl_msg_lookup(a1, "ASLOption", (int **)&v4, 0))
    v2 = 1;
  else
    v2 = v4 == 0;
  if (v2)
  {
    asl_msg_set_key_val(a1, "ASLOption", "store");
  }
  else
  {
    v3 = 0;
    asprintf(&v3, "%s %s", "store", v4);
    asl_msg_set_key_val(a1, "ASLOption", v3);
    free(v3);
  }
}

int *___asl_send_message_block_invoke(uint64_t a1)
{
  int v2;
  char *v3;
  int *result;
  stat v5;

  memset(&v5, 0, sizeof(v5));
  v2 = *__error();
  if (stat("/etc/asl/.noquota", &v5))
  {
    v3 = getenv("ASL_QUOTA_DISABLED");
    if (v3 && !strcmp(v3, "1"))
    {
      dword_1ECD9E130 = -1;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    dword_1ECD9E130 = -1;
  }
  result = __error();
  *result = v2;
  return result;
}

uint64_t _asl_aux_save_context(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  pthread_mutex_lock(&stru_1ECD9E150);
  v2 = reallocf((void *)qword_1ECD9E198, 8 * dword_1ECD9E190 + 8);
  qword_1ECD9E198 = (uint64_t)v2;
  if (v2)
  {
    v3 = 0;
    v4 = dword_1ECD9E190++;
    v2[v4] = a1;
  }
  else
  {
    dword_1ECD9E190 = 0;
    v3 = 9999;
  }
  pthread_mutex_unlock(&stru_1ECD9E150);
  return v3;
}

uint64_t ___asl_auxiliary_block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void ___asl_auxiliary_block_invoke_2(uint64_t a1, int a2, dispatch_data_t data, int a4)
{
  NSObject *v7;
  char *v8;
  uint32_t v9;
  unsigned __int8 *v10;
  size_t size_ptr;

  if (!a4)
  {
    size_ptr = dispatch_data_get_size(data);
    if (size_ptr)
    {
      v10 = 0;
      v7 = dispatch_data_create_map(data, (const void **)&v10, &size_ptr);
      v8 = asl_core_encode_buffer(v10, size_ptr);
      asl_msg_set_key_val(*(int **)(a1 + 32), "ASLAuxData", v8);
      free(v8);
      v9 = _asl_evaluate_send(0, *(asl_object_t *)(a1 + 32), -1);
      _asl_send_message(0, v9, *(__asl_object_s **)(a1 + 32), 0);
      asl_msg_release(*(asl_object_t *)(a1 + 32));
      dispatch_release(v7);
    }
  }
  if (a2)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
  }
}

uint64_t asl_core_string_hash(char *__s, unsigned int a2)
{
  char *v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;

  if (!__s)
    return 0;
  v2 = __s;
  if (!a2)
  {
    if (*__s)
    {
      a2 = strlen(__s);
      goto LABEL_5;
    }
    return 0;
  }
LABEL_5:
  v3 = -1640531527;
  if (a2 < 0xC)
  {
    v4 = 0;
    v6 = -1640531527;
    v5 = a2;
  }
  else
  {
    v4 = 0;
    v5 = a2;
    v6 = -1640531527;
    do
    {
      v7 = v6 + v2[4] + (v2[5] << 8) + (v2[6] << 16) + (v2[7] << 24);
      v8 = v4 + v2[8] + (v2[9] << 8) + (v2[10] << 16) + (v2[11] << 24);
      v9 = (v3 + *v2 + (v2[1] << 8) + (v2[2] << 16) + (v2[3] << 24) - (v7 + v8)) ^ (v8 >> 13);
      v10 = (v7 - v8 - v9) ^ (v9 << 8);
      v11 = (v8 - v9 - v10) ^ (v10 >> 13);
      v12 = (v9 - v10 - v11) ^ (v11 >> 12);
      v13 = (v10 - v11 - v12) ^ (v12 << 16);
      v14 = (v11 - v12 - v13) ^ (v13 >> 5);
      v3 = (v12 - v13 - v14) ^ (v14 >> 3);
      v6 = (v13 - v14 - v3) ^ (v3 << 10);
      v4 = (v14 - v3 - v6) ^ (v6 >> 15);
      v2 += 12;
      v5 -= 12;
    }
    while (v5 > 0xB);
  }
  v16 = v4 + a2;
  switch(v5)
  {
    case 1u:
      goto LABEL_22;
    case 2u:
      goto LABEL_21;
    case 3u:
      goto LABEL_20;
    case 4u:
      goto LABEL_19;
    case 5u:
      goto LABEL_18;
    case 6u:
      goto LABEL_17;
    case 7u:
      goto LABEL_16;
    case 8u:
      goto LABEL_15;
    case 9u:
      goto LABEL_14;
    case 0xAu:
      goto LABEL_13;
    case 0xBu:
      v16 += v2[10] << 24;
LABEL_13:
      v16 += v2[9] << 16;
LABEL_14:
      v16 += v2[8] << 8;
LABEL_15:
      v6 += v2[7] << 24;
LABEL_16:
      v6 += v2[6] << 16;
LABEL_17:
      v6 += v2[5] << 8;
LABEL_18:
      v6 += v2[4];
LABEL_19:
      v3 += v2[3] << 24;
LABEL_20:
      v3 += v2[2] << 16;
LABEL_21:
      v3 += v2[1] << 8;
LABEL_22:
      v3 += *v2;
      break;
    default:
      break;
  }
  v17 = (v3 - v6 - v16) ^ (v16 >> 13);
  v18 = (v6 - v16 - v17) ^ (v17 << 8);
  v19 = (v16 - v17 - v18) ^ (v18 >> 13);
  v20 = (v17 - v18 - v19) ^ (v19 >> 12);
  v21 = (v18 - v19 - v20) ^ (v20 << 16);
  v22 = (v19 - v20 - v21) ^ (v21 >> 5);
  v23 = (v20 - v21 - v22) ^ (v22 >> 3);
  v24 = (v22 - v23 - ((v21 - v22 - v23) ^ (v23 << 10))) ^ (((v21 - v22 - v23) ^ (v23 << 10)) >> 15);
  if (v24 <= 1)
    return 1;
  else
    return v24;
}

const char *asl_core_error(unsigned int a1)
{
  if (a1 > 0xE)
    return "Operation Failed";
  else
    return off_1EA906A78[a1];
}

const char *asl_core_level_to_string(unsigned int a1)
{
  if (a1 <= 7)
    return ASL_LEVEL_TO_STRING[a1];
  else
    return "invalid";
}

uint64_t asl_core_check_access(int a1, gid_t a2, uid_t uid, int a4, char a5)
{
  uint64_t result;
  int v7;

  result = 0;
  if (!uid)
    return result;
  v7 = a5 & 3;
  if ((a5 & 3) == 0)
    return result;
  if (v7 == 2)
    return asl_core_check_group_access(a2, uid, a4);
  if (v7 != 1)
  {
    result = 0;
    if (a1 == -1 || a1 == uid)
      return result;
    return asl_core_check_group_access(a2, uid, a4);
  }
  if (a1 == uid || a1 == -1)
    return 0;
  else
    return 10;
}

uint64_t asl_core_check_group_access(gid_t a1, uid_t uid, int a3)
{
  uint64_t result;
  int ismember;
  uuid_t group;
  uuid_t uu;
  uint64_t v8;

  result = 0;
  v8 = *MEMORY[0x1E0C874D8];
  if (a1 != -1 && a1 != a3)
  {
    memset(uu, 0, sizeof(uu));
    memset(group, 0, sizeof(group));
    mbr_uid_to_uuid(uid, uu);
    mbr_gid_to_uuid(a1, group);
    ismember = 0;
    mbr_check_membership(uu, group, &ismember);
    if (ismember)
      return 0;
    else
      return 10;
  }
  return result;
}

unint64_t asl_core_htonq(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t asl_core_ntohq(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t asl_core_new_msg_id(uint64_t a1)
{
  pthread_mutex_lock(&core_lock);
  if (!a1)
    a1 = _asl_core_msg_next_id;
  _asl_core_msg_next_id = a1 + 1;
  pthread_mutex_unlock(&core_lock);
  return a1;
}

uint64_t asl_filesystem_path(int a1)
{
  if (asl_filesystem_path_once != -1)
    dispatch_once(&asl_filesystem_path_once, &__block_literal_global_0);
  if (a1 == 1)
    return asl_filesystem_path_asl_filesystem_path_archive;
  if (a1)
    return 0;
  return asl_filesystem_path_asl_filesystem_path_database;
}

uint64_t __asl_filesystem_path_block_invoke()
{
  asprintf((char **)&asl_filesystem_path_asl_filesystem_path_database, "%s/asl", "/var/log");
  return asprintf((char **)&asl_filesystem_path_asl_filesystem_path_archive, "%s/asl.archive", "/var/log");
}

_BYTE *asl_core_encode_buffer(unsigned __int8 *a1, unsigned int a2)
{
  _BYTE *result;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  char v9;
  uint64_t v10;
  char v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  char v20;
  char v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  _BYTE v29[4];
  int v30;
  _DWORD v31[1];
  unsigned int v32;
  uint64_t v33;

  result = 0;
  v33 = *MEMORY[0x1E0C874D8];
  if (!a1 || !a2)
    return result;
  bzero(v31, 0x400uLL);
  v28 = 0;
  v5 = a2;
  v6 = a2;
  v7 = a1;
  do
  {
    v8 = *v7++;
    ++v31[v8];
    --v6;
  }
  while (v6);
  v9 = 0;
  v10 = 0;
  v11 = 1;
  do
  {
    v12 = v11;
    *(_DWORD *)&v29[4 * v10] = 1;
    v13 = v32;
    v14 = 1;
    v15 = 2;
    v16 = v28;
    while (1)
    {
      v17 = v31[v15];
      if (v17 < v13)
        break;
LABEL_11:
      if (++v15 == 256)
        goto LABEL_14;
    }
    *(_DWORD *)&v29[4 * v10] = v15;
    if (v17 && (v9 & (v17 == v16)) == 0)
    {
      v14 = v15;
      v13 = v17;
      goto LABEL_11;
    }
    v14 = v15;
LABEL_14:
    v11 = 0;
    *(_DWORD *)&v29[4 * v10 - 8] = v31[v14];
    v31[v14] = -1;
    v9 = 1;
    v10 = 1;
  }
  while ((v12 & 1) != 0);
  v18 = a2 + v28 + HIDWORD(v28);
  result = malloc_type_malloc((v18 + 3), 0x861EDB8FuLL);
  if (result)
  {
    v19 = 0;
    result[v18 + 2] = 0;
    v20 = v29[0];
    *result = v29[0];
    v21 = v30;
    result[1] = v30;
    v22 = 2;
    do
    {
      v23 = a1[v19];
      if (a1[v19])
      {
        v24 = 0;
        v25 = 1;
        while (1)
        {
          v26 = v25;
          if (*(_DWORD *)&v29[4 * v24] == v23)
            break;
          v25 = 0;
          v24 = 1;
          if ((v26 & 1) == 0)
          {
            v27 = v22;
            goto LABEL_24;
          }
        }
        v27 = v22 + 1;
        result[v22] = v21;
        LOBYTE(v23) = v24 + 1;
        LODWORD(v24) = 2;
      }
      else
      {
        LODWORD(v24) = 1;
        v27 = v22;
        LOBYTE(v23) = v20;
      }
LABEL_24:
      v22 += v24;
      result[v27] = v23;
      ++v19;
    }
    while (v19 != v5);
  }
  return result;
}

uint64_t asl_core_decode_buffer(const char *a1, _QWORD *a2, int *a3)
{
  uint64_t v3;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  int v15;
  uint64_t v16;
  int v17;
  _BYTE v19[2];

  v3 = 0xFFFFFFFFLL;
  if (a2 && a3)
  {
    v7 = *(unsigned __int8 *)a1;
    v19[0] = *a1;
    v8 = *((unsigned __int8 *)a1 + 1);
    v19[1] = a1[1];
    v9 = strlen(a1);
    v10 = v9;
    if (v9 >= 3)
    {
      v11 = 0;
      LODWORD(v12) = 2;
      while (1)
      {
        if (a1[v12] == v8)
        {
          v12 = v12 + 1;
          if ((_DWORD)v12 == v9 || a1[v12] - 3 < 0xFFFFFFFE)
            break;
        }
        LODWORD(v12) = v12 + 1;
        --v11;
        if (v12 >= v9)
        {
          if (!v11)
            return 0xFFFFFFFFLL;
          v13 = -v11;
          v14 = malloc_type_malloc(-v11, 0x99E5D2B7uLL);
          if (!v14)
            return 0xFFFFFFFFLL;
          if (v10 >= 3)
          {
            v15 = 0;
            LODWORD(v16) = 2;
            do
            {
              v17 = a1[v16];
              if (v17 == v7)
              {
                LOBYTE(v17) = 0;
              }
              else if (v17 == v8)
              {
                v16 = v16 + 1;
                LOBYTE(v17) = v19[a1[v16] - 1];
              }
              v14[v15++] = v17;
              LODWORD(v16) = v16 + 1;
            }
            while (v16 < v10);
          }
          v3 = 0;
          *a3 = v13;
          *a2 = v14;
          return v3;
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return v3;
}

BOOL asl_core_str_match_char(unsigned __int8 *a1, unsigned __int8 a2, unsigned int a3, char a4, unsigned int *a5)
{
  int v5;
  unsigned int v6;

  if (a5)
    *a5 = 0;
  if (!a1)
    return a3 == 0;
  v5 = *a1;
  if ((a4 & 1) != 0 && v5 == a2)
  {
    v6 = 1;
    if (!a5)
      return v6 >= a3;
    *a5 = 1;
    if ((a4 & 2) == 0 || *a1 == a2)
      return v6 >= a3;
  }
  else
  {
    if ((a4 & 2) == 0 || v5 == a2)
    {
      if (a5)
        v6 = *a5;
      else
        v6 = 0;
      return v6 >= a3;
    }
    if (!a5)
    {
      v6 = 1;
      return v6 >= a3;
    }
  }
  v6 = 1;
  *a5 = 1;
  return v6 >= a3;
}

unint64_t asl_core_str_to_uint32(unint64_t result, unsigned int a2)
{
  char *v2;
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  v2 = (char *)result;
  LODWORD(result) = 0;
  v3 = a2;
  do
  {
    v4 = *v2++;
    result = (v4 + 10 * result - 48);
    --v3;
  }
  while (v3);
  return result;
}

const char *asl_core_str_to_size(const char *result)
{
  const char *v1;
  int v2;
  unsigned __int8 v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    result = (const char *)strlen(result);
    if (result)
    {
      v2 = v1[(_QWORD)result - 1];
      if (v2 > 90)
        LOBYTE(v2) = v2 - 32;
      v3 = v2 - 71;
      if (v3 > 6u)
        v4 = 1;
      else
        v4 = qword_1DE3EEA58[(char)v3];
      return (const char *)(atoll(v1) * v4);
    }
  }
  return result;
}

const char *asl_core_str_to_time(const char *result, int a2)
{
  uint64_t v2;
  const char *v3;
  int v4;

  if (result)
  {
    LODWORD(v2) = a2;
    v3 = result;
    result = (const char *)strlen(result);
    if (result)
    {
      v4 = v3[(_QWORD)result - 1];
      if (v4 > 90)
        LOBYTE(v4) = v4 - 32;
      if (v4 > 0x4Cu)
      {
        if (v4 == 83)
        {
          v2 = 1;
          return (const char *)(atoll(v3) * v2);
        }
        if (v4 == 77)
        {
          v2 = 60;
          return (const char *)(atoll(v3) * v2);
        }
      }
      else
      {
        if (v4 == 68)
        {
          v2 = 86400;
          return (const char *)(atoll(v3) * v2);
        }
        if (v4 == 72)
        {
          v2 = 3600;
          return (const char *)(atoll(v3) * v2);
        }
      }
      v2 = v2;
      return (const char *)(atoll(v3) * v2);
    }
  }
  return result;
}

uint64_t asl_core_time_to_str(int a1, char *a2, size_t a3)
{
  __int128 v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char v13[16];
  __int128 v14;
  char __str[16];
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  v5 = 0uLL;
  *(_OWORD *)__str = 0u;
  v16 = 0u;
  v6 = a1 / 86400;
  v7 = a1 % 86400 / 3600;
  v8 = a1 % 86400 % 3600;
  v9 = ((__int16)((34953 * (__int16)v8) >> 16) >> 5)
     + (((v8 + ((-30583 * (__int16)v8) >> 16)) & 0x8000) >> 15);
  v10 = (__int16)(v8
                - 60
                * (((__int16)((34953 * (__int16)v8) >> 16) >> 5)
                 + (((v8 + ((-30583 * (__int16)v8) >> 16)) & 0x8000) >> 15)));
  if (a1 / 86400)
  {
    v11 = "s";
    if (v6 == 1)
      v11 = (const char *)&unk_1DE3EF045;
    snprintf(__str, 0x20uLL, "%u day%s", a1 / 86400, v11);
    v5 = 0uLL;
  }
  *(_OWORD *)v13 = v5;
  v14 = v5;
  snprintf(v13, 0x20uLL, "%02u:%02u:%02lld", v7, v9, v10);
  if (v7 + v9 + v10)
  {
    if (v6)
      return snprintf(a2, a3, "%s %s");
    return snprintf(a2, a3, "%s");
  }
  if (v6)
    return snprintf(a2, a3, "%s");
  return snprintf(a2, a3, "0");
}

uint64_t asl_core_str_match_c_time(uint64_t result, time_t *a2, _DWORD *a3)
{
  uint64_t v5;
  int tm_year;
  int v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  int v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  int v16;
  _BYTE *v17;
  int v18;
  uint64_t v19;
  char *v20;
  int v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char *v29;
  int v30;
  char *v31;
  int v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  char *v40;
  int v41;
  char *v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  time_t v58;
  tm v59;

  if (result)
  {
    v5 = result;
    memset(&v59, 0, sizeof(v59));
    v58 = time(0);
    localtime_r(&v58, &v59);
    tm_year = v59.tm_year;
    memset(&v59, 0, sizeof(v59));
    v59.tm_year = tm_year;
    if (!strncasecmp((const char *)v5, "jan", 3uLL))
    {
      v7 = 0;
    }
    else if (!strncasecmp((const char *)v5, "feb", 3uLL))
    {
      v7 = 1;
    }
    else if (!strncasecmp((const char *)v5, "mar", 3uLL))
    {
      v7 = 2;
    }
    else
    {
      v7 = 3;
      if (strncasecmp((const char *)v5, "apr", 3uLL))
      {
        if (!strncasecmp((const char *)v5, "may", 3uLL))
        {
          v7 = 4;
        }
        else if (!strncasecmp((const char *)v5, "jun", 3uLL))
        {
          v7 = 5;
        }
        else if (!strncasecmp((const char *)v5, "jul", 3uLL))
        {
          v7 = 6;
        }
        else if (!strncasecmp((const char *)v5, "aug", 3uLL))
        {
          v7 = 7;
        }
        else if (!strncasecmp((const char *)v5, "sep", 3uLL))
        {
          v7 = 8;
        }
        else if (!strncasecmp((const char *)v5, "oct", 3uLL))
        {
          v7 = 9;
        }
        else if (!strncasecmp((const char *)v5, "nov", 3uLL))
        {
          v7 = 10;
        }
        else
        {
          if (strncasecmp((const char *)v5, "dec", 3uLL))
            return 0;
          v7 = 11;
        }
      }
    }
    v59.tm_mon = v7;
    LOBYTE(v8) = *(_BYTE *)(v5 + 3);
    if (!(_BYTE)v8)
      return 0;
    v9 = 0;
    do
    {
      if (!memchr("\t ", (char)v8, 3uLL))
        break;
      v8 = *(unsigned __int8 *)(v5 + 4 + v9++);
    }
    while (v8);
    if (!(_DWORD)v9)
      return 0;
    v10 = (_BYTE *)(v5 + 3 + v9);
    LOBYTE(v11) = *v10;
    if (!*v10)
      return 0;
    v12 = 0;
    v13 = (char *)(v5 + 3 + v9);
    while (1)
    {
      if ((_DWORD)v12 == 2)
      {
        LODWORD(v12) = 2;
        goto LABEL_38;
      }
      if (!memchr("0123456789", (char)v11, 0xBuLL))
        break;
      v11 = *(unsigned __int8 *)(v9 + v5 + 4 + v12++);
      if (!v11)
        goto LABEL_38;
    }
    if (!(_DWORD)v12)
      return 0;
LABEL_38:
    v14 = 0;
    v15 = v12;
    do
    {
      v16 = *v13++;
      v14 = v16 + 10 * v14 - 48;
      --v15;
    }
    while (v15);
    v59.tm_mday = v14;
    if (v14 > 31)
      return 0;
    v17 = &v10[v12];
    LOBYTE(v18) = *v17;
    if (!*v17)
      return 0;
    v19 = 0;
    do
    {
      if (!memchr("\t ", (char)v18, 3uLL))
        break;
      v18 = *(unsigned __int8 *)(v9 + (unint64_t)v12 + v5 + 4 + v19++);
    }
    while (v18);
    if (!(_DWORD)v19)
      return 0;
    v20 = &v17[v19];
    LOBYTE(v21) = *v20;
    if (!*v20)
      return 0;
    v22 = 0;
    v23 = v20;
    v57 = v19;
    v24 = v9 + (unint64_t)v19 + v12 + v5 + 4;
    while (1)
    {
      if ((_DWORD)v22 == 2)
      {
        LODWORD(v22) = 2;
        goto LABEL_54;
      }
      if (!memchr("0123456789", (char)v21, 0xBuLL))
        break;
      v21 = *(unsigned __int8 *)(v24 + v22++);
      if (!v21)
        goto LABEL_54;
    }
    if (!(_DWORD)v22)
      return 0;
LABEL_54:
    v25 = 0;
    v26 = v22;
    v27 = v22;
    do
    {
      v28 = *v23++;
      v25 = v28 + 10 * v25 - 48;
      --v27;
    }
    while (v27);
    v59.tm_hour = v25;
    if (v25 > 23)
      return 0;
    v29 = &v20[v22];
    if (*v29 != 58)
      return 0;
    v32 = v29[1];
    v31 = v29 + 1;
    LOBYTE(v30) = v32;
    if (!v32)
      return 0;
    v33 = 0;
    v34 = v31;
    v55 = v26;
    v35 = v9 + v26 + v57 + v12 + v5 + 5;
    do
    {
      if ((_DWORD)v33 == 2)
      {
        LODWORD(v33) = 2;
        v36 = v55;
        goto LABEL_66;
      }
      if (!memchr("0123456789", (char)v30, 0xBuLL))
        break;
      v30 = *(unsigned __int8 *)(v35 + v33++);
    }
    while (v30);
    v36 = v55;
    if (v33 < 2)
      return 0;
LABEL_66:
    v37 = 0;
    v38 = v33;
    do
    {
      v39 = *v34++;
      v37 = v39 + 10 * v37 - 48;
      --v38;
    }
    while (v38);
    v59.tm_min = v37;
    if (v37 > 59)
      return 0;
    v40 = &v31[v33];
    if (*v40 != 58)
      return 0;
    v43 = v40[1];
    v42 = v40 + 1;
    LOBYTE(v41) = v43;
    if (!v43)
      return 0;
    v44 = 0;
    v54 = v33;
    v56 = v42;
    v45 = v9 + (unint64_t)v33 + v36 + v57 + v12 + v5 + 6;
    do
    {
      if ((_DWORD)v44 == 2)
      {
        LODWORD(v44) = 2;
        goto LABEL_78;
      }
      if (!memchr("0123456789", (char)v41, 0xBuLL))
        break;
      v41 = *(unsigned __int8 *)(v45 + v44++);
    }
    while (v41);
    if (v44 < 2)
      return 0;
LABEL_78:
    v46 = 0;
    v47 = v44;
    v48 = v44;
    do
    {
      v49 = *v42++;
      v46 = v49 + 10 * v46 - 48;
      --v48;
    }
    while (v48);
    v59.tm_sec = v46;
    if (v46 > 59)
      return 0;
    v50 = (_DWORD)v56 + v44;
    LOBYTE(v51) = v56[v47];
    if ((_BYTE)v51)
    {
      v52 = 0;
      v53 = v9 + v47 + v54 + v36 + v57 + v12 + v5 + 6;
      while ((_DWORD)v52 != 1)
      {
        if (!memchr(" \t\n", (char)v51, 4uLL))
        {
          if (!(_DWORD)v52)
            return 0;
          break;
        }
        v51 = *(unsigned __int8 *)(v53 + v52++);
        if (!v51)
          break;
      }
    }
    v59.tm_isdst = -1;
    if (a3)
      *a3 = v50 - v5;
    if (a2)
      *a2 = mktime(&v59);
    return 1;
  }
  return result;
}

uint64_t asl_core_str_match_dotted_time(uint64_t result, time_t *a2, _DWORD *a3)
{
  char *v3;
  int v4;
  uint64_t v7;
  int v8;
  char *v9;
  uint64_t v10;
  int v11;
  char *v12;
  int v13;
  char *v14;
  int v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  int v20;
  char *v21;
  int v22;
  char *v23;
  int v24;
  uint64_t v25;
  char *v26;
  int v27;
  uint64_t v28;
  int v29;
  char *v30;
  int v31;
  uint64_t v32;
  char *v33;
  int v34;
  uint64_t v35;
  char *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  char *v41;
  int v42;
  char *v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  char *v57;
  int v58;
  uint64_t v59;
  const char *v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  tm v74;

  memset(&v74, 0, sizeof(v74));
  if (result)
  {
    v3 = (char *)result;
    LOBYTE(v4) = *(_BYTE *)result;
    if (!*(_BYTE *)result)
      return 0;
    v7 = 0;
    do
    {
      if ((_DWORD)v7 == 4)
      {
        LODWORD(v7) = 4;
        goto LABEL_10;
      }
      if (!memchr("0123456789", (char)v4, 0xBuLL))
        break;
      v4 = v3[++v7];
    }
    while (v4);
    if (v7 < 4)
      return 0;
    v8 = 0;
    v9 = v3;
    v10 = v7;
    do
    {
      v11 = *v9++;
      v8 = v11 + 10 * v8 - 48;
      --v10;
    }
    while (v10);
    v74.tm_year = v8 - 1900;
    v12 = &v3[v7];
    if (*v12 != 46)
      return 0;
    v15 = v12[1];
    v14 = v12 + 1;
    LOBYTE(v13) = v15;
    if (!v15)
      return 0;
LABEL_10:
    v16 = 0;
    v17 = v14;
    while (1)
    {
      if ((_DWORD)v16 == 2)
      {
        LODWORD(v16) = 2;
        goto LABEL_21;
      }
      if (!memchr("0123456789", (char)v13, 0xBuLL))
        break;
      v13 = v3[v7 + 2 + v16++];
      if (!v13)
        goto LABEL_21;
    }
    if (!(_DWORD)v16)
      return 0;
    v18 = 0;
    v19 = v16;
    do
    {
      v20 = *v17++;
      v18 = v20 + 10 * v18 - 48;
      --v19;
    }
    while (v19);
    if ((v18 - 13) < 0xFFFFFFF4)
      return 0;
    v74.tm_mon = v18 - 1;
    v21 = &v14[v16];
    if (*v21 != 46)
      return 0;
    v24 = v21[1];
    v23 = v21 + 1;
    LOBYTE(v22) = v24;
    if (!v24)
      return 0;
LABEL_21:
    v25 = 0;
    v26 = v23;
    while (1)
    {
      if ((_DWORD)v25 == 2)
      {
        LODWORD(v25) = 2;
        goto LABEL_33;
      }
      if (!memchr("0123456789", (char)v22, 0xBuLL))
        break;
      v22 = v3[v7 + 3 + (unint64_t)v16 + v25++];
      if (!v22)
        goto LABEL_33;
    }
    if (!(_DWORD)v25)
      return 0;
    v27 = 0;
    v28 = v25;
    do
    {
      v29 = *v26++;
      v27 = v29 + 10 * v27 - 48;
      --v28;
    }
    while (v28);
    v74.tm_mday = v27;
    if (v27 > 31)
      return 0;
    v30 = &v23[v25];
    LOBYTE(v31) = *v30;
    if (!*v30)
      return 0;
    v32 = 0;
    do
    {
      if (!memchr("\t ", (char)v31, 3uLL))
        break;
      v31 = v3[v16 + 3 + v7 + (unint64_t)v25 + v32++];
    }
    while (v31);
    if (!(_DWORD)v32)
      return 0;
    v33 = &v30[v32];
    LOBYTE(v34) = *v33;
    if (!*v33)
      return 0;
LABEL_33:
    v35 = 0;
    v69 = v32;
    v70 = v33;
    v36 = v33;
    while (1)
    {
      if ((_DWORD)v35 == 2)
      {
        LODWORD(v35) = 2;
        goto LABEL_49;
      }
      if (!memchr("0123456789", (char)v34, 0xBuLL))
        break;
      v34 = v3[v25
                              + 3
                              + (unint64_t)v16
                              + v7
                              + v69
                              + v35++];
      if (!v34)
        goto LABEL_49;
    }
    if (!(_DWORD)v35)
      return 0;
    v37 = 0;
    v38 = v35;
    v39 = v35;
    do
    {
      v40 = *v36++;
      v37 = v40 + 10 * v37 - 48;
      --v39;
    }
    while (v39);
    v74.tm_hour = v37;
    if (v37 > 23)
      return 0;
    v41 = &v70[v35];
    if (*v41 != 58)
      return 0;
    v44 = v41[1];
    v43 = v41 + 1;
    LOBYTE(v42) = v44;
    if (!v44)
      return 0;
LABEL_49:
    v45 = 0;
    v71 = v43;
    v67 = v38;
    v46 = (unint64_t)&v3[v25
                              + 4
                              + (unint64_t)v16
                              + v7
                              + v38
                              + v69];
    do
    {
      if ((_DWORD)v45 == 2)
      {
        LODWORD(v45) = 2;
        goto LABEL_61;
      }
      if (!memchr("0123456789", (char)v42, 0xBuLL))
        break;
      v42 = *(unsigned __int8 *)(v46 + v45++);
    }
    while (v42);
    if (v45 < 2)
      return 0;
    v47 = 0;
    v48 = v45;
    v68 = v45;
    do
    {
      v49 = *v43++;
      v47 = v49 + 10 * v47 - 48;
      --v48;
    }
    while (v48);
    v74.tm_min = v47;
    if (v47 > 59)
      return 0;
    v72 = &v71[v45];
    if (*v72 != 58)
      return 0;
    v50 = v72[1];
    v73 = v72 + 1;
    if (!v50)
      return 0;
LABEL_61:
    v51 = 0;
    v52 = v73;
    v53 = (unint64_t)&v3[v25
                              + 5
                              + (unint64_t)v16
                              + v7
                              + v45
                              + v67
                              + v69];
    do
    {
      if ((_DWORD)v51 == 2)
      {
        LODWORD(v51) = 2;
        goto LABEL_73;
      }
      if (!memchr("0123456789", (char)v50, 0xBuLL))
        break;
      v50 = *(unsigned __int8 *)(v53 + v51++);
    }
    while (v50);
    if (v51 < 2)
      return 0;
    v54 = 0;
    v55 = v51;
    v66 = v51;
    do
    {
      v56 = *v52++;
      v54 = v56 + 10 * v54 - 48;
      --v55;
    }
    while (v55);
    v74.tm_sec = v54;
    if (v54 > 59)
      return 0;
    v57 = &v73[v51];
    LOBYTE(v58) = *v57;
    if (!*v57)
      return 0;
LABEL_73:
    v59 = 0;
    do
    {
      if (!memchr("\t ", (char)v58, 3uLL))
        break;
      v58 = v3[v25
                              + 5
                              + (unint64_t)v16
                              + v7
                              + v66
                              + v68
                              + v67
                              + v69
                              + v59++];
    }
    while (v58);
    if ((_DWORD)v59 && (v60 = &v57[v59], !strncmp(v60, "UTC", 3uLL)))
    {
      v63 = *((unsigned __int8 *)v60 + 3);
      v62 = (_DWORD)v60 + 3;
      LOBYTE(v61) = v63;
      if (v63)
      {
        v64 = 0;
        v65 = (unint64_t)&v3[v25
                                  + 8
                                  + (unint64_t)v16
                                  + v7
                                  + v59
                                  + v66
                                  + v68
                                  + v67
                                  + v69];
        while ((_DWORD)v64 != 1)
        {
          if (!memchr(" \t\n", (char)v61, 4uLL))
          {
            if (!(_DWORD)v64)
              return 0;
            break;
          }
          v61 = *(unsigned __int8 *)(v65 + v64++);
          if (!v61)
            break;
        }
      }
      if (a3)
        *a3 = v62 - (_DWORD)v3;
      if (a2)
        *a2 = timegm(&v74);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t asl_core_str_match_iso_8601_time(uint64_t result, time_t *a2, int *a3)
{
  char *v3;
  int v4;
  uint64_t v7;
  int v8;
  char *v9;
  uint64_t v10;
  int v11;
  int v12;
  _BOOL8 v13;
  char *v14;
  int v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  int v20;
  _BOOL8 v21;
  char *v22;
  int v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  char *v35;
  uint64_t v36;
  int v37;
  int v38;
  _BOOL8 v39;
  char *v40;
  uint64_t v41;
  int v42;
  char *v43;
  uint64_t v44;
  int v45;
  char *v46;
  uint64_t v47;
  int v48;
  char *v49;
  uint64_t v50;
  int v51;
  unsigned int v52;
  BOOL v53;
  time_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t v69;
  int v70;
  int v71;
  char *v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  int v79;
  char *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  _BOOL8 v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  _BOOL8 v94;
  _BOOL8 v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t v98;
  tm v99;
  unsigned int v100[3];

  memset(&v99, 0, sizeof(v99));
  if (result)
  {
    v3 = (char *)result;
    LOBYTE(v4) = *(_BYTE *)result;
    if (!*(_BYTE *)result)
      return 0;
    v7 = 0;
    do
    {
      if ((_DWORD)v7 == 4)
      {
        LODWORD(v7) = 4;
        goto LABEL_10;
      }
      if (!memchr("0123456789", (char)v4, 0xBuLL))
        break;
      v4 = v3[++v7];
    }
    while (v4);
    if (v7 < 4)
      return 0;
LABEL_10:
    v8 = 0;
    v9 = v3;
    v10 = v7;
    do
    {
      v11 = *v9++;
      v8 = v11 + 10 * v8 - 48;
      --v10;
    }
    while (v10);
    v99.tm_year = v8 - 1900;
    v12 = v3[v7];
    v13 = v12 == 45;
    v14 = v12 == 45 ? &v3[v7 + 1] : &v3[v7];
    LOBYTE(v15) = *v14;
    if (!*v14)
      return 0;
    v16 = 0;
    v17 = v14;
    do
    {
      if ((_DWORD)v16 == 2)
      {
        LODWORD(v16) = 2;
        goto LABEL_23;
      }
      if (!memchr("0123456789", (char)v15, 0xBuLL))
        break;
      v15 = v3[v7 + 1 + v13 + v16++];
    }
    while (v15);
    if (v16 < 2)
      return 0;
LABEL_23:
    v18 = 0;
    v19 = v16;
    do
    {
      v20 = *v17++;
      v18 = v20 + 10 * v18 - 48;
      --v19;
    }
    while (v19);
    if ((v18 - 13) < 0xFFFFFFF4)
      return 0;
    v99.tm_mon = v18 - 1;
    v21 = v14[v16] == 45;
    v22 = v14[v16] == 45 ? &v14[v16 + 1] : &v14[v16];
    LOBYTE(v23) = *v22;
    if (!*v22)
      return 0;
    v24 = 0;
    v25 = v22;
    v97 = v21;
    v98 = v16;
    v26 = (unint64_t)&v3[v7 + 1 + (unint64_t)v16 + v13 + v21];
    do
    {
      if ((_DWORD)v24 == 2)
      {
        LODWORD(v24) = 2;
        v100[0] = 2;
        goto LABEL_37;
      }
      if (!memchr("0123456789", (char)v23, 0xBuLL))
        break;
      v23 = *(unsigned __int8 *)(v26 + v24++);
    }
    while (v23);
    v100[0] = v24;
    if (v24 <= 1)
      return 0;
LABEL_37:
    v27 = 0;
    v28 = v24;
    v29 = v24;
    do
    {
      v30 = *v25++;
      v27 = v30 + 10 * v27 - 48;
      --v29;
    }
    while (v29);
    v99.tm_mday = v27;
    if (v27 > 31)
      return 0;
    result = asl_core_str_match(&v22[v24], "Tt", 1u, 1, 1u, v100);
    if ((_DWORD)result)
    {
      v31 = v100[0];
      v32 = &v22[v28 + v100[0]];
      result = asl_core_str_match(v32, "0123456789", 2u, 2, 1u, v100);
      if ((_DWORD)result)
      {
        v33 = v100[0];
        if (v100[0])
        {
          v34 = 0;
          v35 = v32;
          v36 = v100[0];
          do
          {
            v37 = *v35++;
            v34 = v37 + 10 * v34 - 48;
            --v36;
          }
          while (v36);
          v99.tm_hour = v34;
          if (v34 > 23)
            return 0;
        }
        else
        {
          v33 = 0;
          v99.tm_hour = 0;
        }
        v38 = v32[v33];
        v39 = v38 == 58;
        v100[0] = v38 == 58;
        v40 = v38 == 58 ? &v32[v33 + 1] : &v32[v33];
        result = asl_core_str_match(v40, "0123456789", 2u, 2, 1u, v100);
        if ((_DWORD)result)
        {
          v41 = v100[0];
          if (v100[0])
          {
            v42 = 0;
            v43 = v40;
            v44 = v100[0];
            do
            {
              v45 = *v43++;
              v42 = v45 + 10 * v42 - 48;
              --v44;
            }
            while (v44);
            v99.tm_min = v42;
            if (v42 > 59)
              return 0;
          }
          else
          {
            v41 = 0;
            v99.tm_min = 0;
          }
          v53 = v40[v41] == 58;
          v95 = v53;
          v96 = v41;
          v100[0] = v53;
          v46 = v53 ? &v40[v41 + 1] : &v40[v41];
          result = asl_core_str_match(v46, "0123456789", 2u, 2, 1u, v100);
          if ((_DWORD)result)
          {
            v94 = v39;
            v47 = v100[0];
            if (v100[0])
            {
              v48 = 0;
              v49 = v46;
              v50 = v100[0];
              do
              {
                v51 = *v49++;
                v48 = v51 + 10 * v48 - 48;
                --v50;
              }
              while (v50);
              v99.tm_sec = v48;
              if (v48 > 59)
                return 0;
            }
            else
            {
              v47 = 0;
              v48 = 0;
              v99.tm_sec = 0;
            }
            v52 = v46[v47];
            v53 = v52 > 0x20 || ((1 << v52) & 0x100000601) == 0;
            if (!v53)
            {
              v99.tm_isdst = -1;
              if (a3)
                *a3 = (_DWORD)v46 + v47 - (_DWORD)v3;
              if (!a2)
                return 1;
              v54 = mktime(&v99);
              goto LABEL_78;
            }
            v90 = v31;
            v91 = &v46[v47];
            v55 = 0;
            v100[0] = 0;
            v88 = v47;
            v89 = v33;
            v56 = (uint64_t)&v3[v98 + 1 + v7 + v28 + v95 + v94 + v97 + v13 + v47 + v96 + v33 + v31];
            v57 = v52;
            LOBYTE(v58) = v52;
            while (1)
            {
              if ((_DWORD)v55 == 1)
              {
                LODWORD(v55) = 1;
                goto LABEL_87;
              }
              if (!memchr("Zz+-", (char)v58, 5uLL))
                break;
              v58 = *(unsigned __int8 *)(v56 + v55++);
              v100[0] = v55;
              if (!v58)
                goto LABEL_87;
            }
            if (!(_DWORD)v55)
              return 0;
LABEL_87:
            v92 = &v91[v55];
            if (v57 == 45)
            {
              v62 = 3600;
            }
            else
            {
              if (v57 == 122 || v57 == 90)
              {
                LOBYTE(v59) = *v92;
                if (*v92)
                {
                  v60 = 0;
                  v100[0] = 0;
                  v61 = (uint64_t)&v3[v13
                                   + 1
                                   + v88
                                   + v96
                                   + v89
                                   + v90
                                   + v98
                                   + v7
                                   + v28
                                   + v95
                                   + v55
                                   + v94
                                   + v97];
                  while ((_DWORD)v60 != 1)
                  {
                    if (!memchr(" \t\n", (char)v59, 4uLL))
                    {
                      if (!(_DWORD)v60)
                        return 0;
                      break;
                    }
                    v59 = *(unsigned __int8 *)(v61 + v60++);
                    v100[0] = v60;
                    if (!v59)
                      break;
                  }
                }
                if (!a3)
                  goto LABEL_109;
                v67 = (_DWORD)v92 - (_DWORD)v3;
                goto LABEL_108;
              }
              v62 = -3600;
            }
            v87 = v62;
            v100[0] = 0;
            LOBYTE(v62) = *v92;
            if (*v92)
            {
              v63 = 0;
              v85 = v55;
              v64 = v98 + v7 + v28 + v95 + v55;
              v65 = v92;
              v66 = (uint64_t)&v3[v13 + 1 + v88 + v96 + v89 + v90 + v64 + v94 + v97];
              while (1)
              {
                if ((_DWORD)v63 == 2)
                {
                  LODWORD(v63) = 2;
                  goto LABEL_112;
                }
                if (!memchr("0123456789", (char)v62, 0xBuLL))
                  break;
                v62 = *(unsigned __int8 *)(v66 + v63++);
                v100[0] = v63;
                if (!v62)
                  goto LABEL_112;
              }
              if (!(_DWORD)v63)
                return 0;
LABEL_112:
              v68 = 0;
              v69 = v63;
              v86 = v63;
              do
              {
                v70 = *v65++;
                v68 = v70 + 10 * v68 - 48;
                --v69;
              }
              while (v69);
              if (v68 <= 23)
              {
                v71 = v68;
                v72 = &v92[v86];
                v100[0] = 0;
                v84 = v92[v86] == 58;
                if (v92[v86] == 58)
                  ++v72;
                v93 = v72;
                v73 = *v72;
                if (v73)
                {
                  v74 = 0;
                  while (1)
                  {
                    if ((_DWORD)v74 == 2)
                    {
                      LODWORD(v74) = 2;
                      goto LABEL_125;
                    }
                    if (!memchr("0123456789", (char)v73, 0xBuLL))
                      break;
                    v73 = v3[v97
                                            + 1
                                            + v13
                                            + v88
                                            + v96
                                            + v89
                                            + v90
                                            + v7
                                            + v86
                                            + v85
                                            + v28
                                            + v98
                                            + v95
                                            + v94
                                            + v84
                                            + v74++];
                    v100[0] = v74;
                    if (!v73)
                      goto LABEL_125;
                  }
                  if (!(_DWORD)v74)
                    goto LABEL_129;
LABEL_125:
                  v75 = 0;
                  v76 = v74;
                  v77 = v74;
                  v78 = v93;
                  do
                  {
                    v79 = *v78++;
                    v75 = v79 + 10 * v75 - 48;
                    --v77;
                  }
                  while (v77);
                  if (v75 > 59)
                    return 0;
                }
                else
                {
LABEL_129:
                  v76 = 0;
                  v75 = 0;
                }
                v99.tm_sec = v48 + v87 * v71 + 60 * v75;
                v80 = &v93[v76];
                if (!v93[v76])
                {
LABEL_138:
                  if (!a3)
                    goto LABEL_109;
                  v67 = (_DWORD)v80 - (_DWORD)v3;
LABEL_108:
                  *a3 = v67;
LABEL_109:
                  if (!a2)
                    return 1;
                  v54 = timegm(&v99);
LABEL_78:
                  *a2 = v54;
                  return 1;
                }
                v100[0] = 0;
                LOBYTE(v81) = *v80;
                if (*v80)
                {
                  v82 = 0;
                  v83 = (uint64_t)&v3[v13
                                   + 1
                                   + v88
                                   + v96
                                   + v89
                                   + v90
                                   + v76
                                   + v7
                                   + v86
                                   + v85
                                   + v28
                                   + v98
                                   + v84
                                   + v95
                                   + v94
                                   + v97];
                  while ((_DWORD)v82 != 1)
                  {
                    if (!memchr(" \t\n", (char)v81, 4uLL))
                    {
                      if (!(_DWORD)v82)
                        return 0;
                      goto LABEL_138;
                    }
                    v81 = *(unsigned __int8 *)(v83 + v82++);
                    v100[0] = v82;
                    if (!v81)
                      goto LABEL_138;
                  }
                  goto LABEL_138;
                }
              }
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

time_t asl_parse_time(char *a1)
{
  return asl_core_parse_time(a1, 0);
}

uint64_t asl_string_retain(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  if (result)
  {
    v1 = (unsigned int *)(result + 4);
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }
  return result;
}

void asl_string_release(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  if (a1)
  {
    v2 = (unsigned int *)(a1 + 4);
    do
    {
      v3 = __ldaxr(v2);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, v2));
    if (!v4)
    {
      if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0)
        MEMORY[0x1DF0EC3C8](*MEMORY[0x1E0C883F0], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 24));
      else
        free(*(void **)(a1 + 40));
      free((void *)a1);
    }
  }
}

uint64_t asl_string_bytes(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  char __str[8];
  __int16 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 11) & 0x40) != 0)
    {
      snprintf(__str, 0xBuLL, "%10lu", *(_QWORD *)(result + 32) - 10);
      v2 = *(_QWORD *)(v1 + 40);
      *(_QWORD *)v2 = *(_QWORD *)__str;
      *(_WORD *)(v2 + 8) = v4;
    }
    return *(_QWORD *)(v1 + 40);
  }
  return result;
}

uint64_t asl_string_allocated_size(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t asl_string_append_asl_key(uint64_t a1, char *a2)
{
  return asl_string_append_internal(a1, a2, 1);
}

_QWORD *asl_string_append_op(_QWORD *result, int a2)
{
  int v2;
  int v3;
  char v4;
  int v5;
  char v6;
  char v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (!result)
    return result;
  if (!a2)
    return asl_string_append_char_no_encoding(result, 46);
  if ((a2 & 0x10) != 0)
  {
    v7[0] = 67;
    v2 = 1;
    if ((a2 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v2 = 0;
  if ((a2 & 0x100) != 0)
LABEL_7:
    v7[v2++] = 82;
LABEL_8:
  if ((a2 & 0x80) != 0)
  {
    v7[v2++] = 78;
    if ((a2 & 0x20) == 0)
    {
LABEL_10:
      if ((a2 & 0x40) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((a2 & 0x20) == 0)
  {
    goto LABEL_10;
  }
  if ((a2 & 0x40) != 0)
  {
    v7[v2++] = 83;
LABEL_16:
    v7[v2++] = 90;
    goto LABEL_17;
  }
  v7[v2++] = 65;
LABEL_17:
  v3 = a2 & 7;
  v4 = 61;
  v5 = v2;
  switch(a2 & 7)
  {
    case 1:
      goto LABEL_28;
    case 2:
      v4 = 62;
      goto LABEL_27;
    case 3:
      v5 = v2 + 1;
      v6 = 62;
      goto LABEL_24;
    case 4:
      v4 = 60;
      goto LABEL_27;
    case 5:
      v5 = v2 + 1;
      v6 = 60;
LABEL_24:
      v7[v2] = v6;
      v4 = 61;
      v3 = 2;
      goto LABEL_28;
    case 6:
      v4 = 33;
      goto LABEL_27;
    case 7:
      v4 = 84;
LABEL_27:
      v3 = 1;
      v5 = v2;
LABEL_28:
      v2 += v3;
      v7[v5] = v4;
      break;
    default:
      if (!v2)
        return asl_string_append_char_no_encoding(result, 46);
      break;
  }
  v7[v2] = 0;
  return asl_string_append_no_encoding_len(result, v7, 0);
}

_QWORD *asl_string_append_xml_tag(_QWORD *a1, char *a2, char *a3)
{
  _QWORD *appended;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  appended = asl_string_append_no_encoding_len(a1, "\t\t<", 3uLL);
  v6 = asl_string_append_no_encoding_len(appended, a2, 0);
  v7 = asl_string_append_char_no_encoding(v6, 62);
  v8 = (_QWORD *)asl_string_append_internal((uint64_t)v7, a3, 0);
  v9 = asl_string_append_no_encoding_len(v8, "</", 2uLL);
  v10 = asl_string_append_no_encoding_len(v9, a2, 0);
  return asl_string_append_no_encoding_len(v10, ">\n", 2uLL);
}

void _asl_redirect_fork_child()
{
  if (redirect_descriptors)
  {
    free((void *)redirect_descriptors);
    n_redirect_descriptors = 0;
    redirect_descriptors = 0;
  }
}

int asl_log_descriptor(asl_object_t asl, asl_object_t msg, int level, int descriptor, uint32_t fd_type)
{
  int *v10;
  int v12;
  int v13;
  int v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v10 = __error();
  if (fd_type == 1)
    return asl_log_from_descriptor((uint64_t)asl, (int *)msg, level, descriptor);
  if (fd_type != 2)
    asl_log_descriptor_cold_1();
  v12 = *v10;
  if (pipe(v14) != -1 && fcntl(v14[0], 2, 1) != -1)
  {
    if (dup2(v14[1], descriptor) != -1)
    {
      if (descriptor == 1)
        setlinebuf((FILE *)*MEMORY[0x1E0C874E8]);
      close(v14[1]);
      return asl_log_from_descriptor((uint64_t)asl, (int *)msg, level, v14[0]);
    }
    close(v14[0]);
    close(v14[1]);
  }
  v13 = *__error();
  *__error() = v12;
  return v13;
}

uint64_t asl_log_from_descriptor(uint64_t a1, int *obj, int a3, int a4)
{
  uint64_t v8;
  _QWORD v10[7];
  int v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  if (asl_log_from_descriptor_once_control != -1)
  {
    dispatch_once_f(&asl_log_from_descriptor_once_control, 0, (dispatch_function_t)asl_descriptor_init);
    if ((a4 & 0x80000000) == 0)
      goto LABEL_3;
LABEL_10:
    v8 = 9;
    goto LABEL_11;
  }
  if (a4 < 0)
    goto LABEL_10;
LABEL_3:
  if (obj && (obj = asl_msg_copy((asl_object_t)obj)) == 0)
  {
    v8 = 12;
  }
  else
  {
    v10[0] = MEMORY[0x1E0C87450];
    v10[1] = 0x40000000;
    v10[2] = __asl_log_from_descriptor_block_invoke;
    v10[3] = &unk_1EA906AF8;
    v11 = a4;
    v12 = a3;
    v10[4] = &v13;
    v10[5] = a1;
    v10[6] = obj;
    dispatch_sync((dispatch_queue_t)redirect_serial_q, v10);
    if (*((_DWORD *)v14 + 6))
    {
      asl_msg_release((asl_object_t)obj);
      v8 = *((unsigned int *)v14 + 6);
    }
    else
    {
      v8 = 0;
    }
  }
LABEL_11:
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t asl_descriptor_init()
{
  redirect_descriptors = (uint64_t)malloc_type_calloc(0x10uLL, 0x30uLL, 0x10300407440E19AuLL);
  if (!redirect_descriptors)
    asl_descriptor_init_cold_1();
  n_redirect_descriptors = 16;
  redirect_serial_q = (uint64_t)dispatch_queue_create("com.apple.asl-redirect", 0);
  if (!redirect_serial_q)
    asl_descriptor_init_cold_2();
  read_source_group = (uint64_t)dispatch_group_create();
  if (!read_source_group)
    asl_descriptor_init_cold_3();
  return atexit((void (*)(void))redirect_atexit);
}

void __asl_log_from_descriptor_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  char *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  asl_object_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;

  v2 = *(_DWORD *)(a1 + 56);
  if (v2 >= n_redirect_descriptors)
  {
    v4 = 1 << (fls(v2) + 1);
    v5 = (char *)malloc_type_realloc((void *)redirect_descriptors, 48 * v4, 0x10300407440E19AuLL);
    if (!v5)
      goto LABEL_9;
    v3 = (uint64_t)v5;
    redirect_descriptors = (uint64_t)v5;
    bzero(&v5[48 * n_redirect_descriptors], 48 * (v4 - (uint64_t)n_redirect_descriptors));
    n_redirect_descriptors = v4;
    v2 = *(_DWORD *)(a1 + 56);
  }
  else
  {
    v3 = redirect_descriptors;
  }
  if (*(_QWORD *)(v3 + 48 * v2 + 24))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 9;
    return;
  }
  v6 = malloc_type_malloc(0x200uLL, 0x84842478uLL);
  v7 = redirect_descriptors;
  v8 = *(_DWORD *)(a1 + 56);
  *(_QWORD *)(redirect_descriptors + 48 * v8 + 24) = v6;
  if (v6)
  {
    v9 = v7 + 48 * v8;
    *(_QWORD *)(v9 + 32) = v6;
    *(_DWORD *)v9 = *(_DWORD *)(a1 + 60);
    v10 = asl_client_retain(*(asl_object_t *)(a1 + 40));
    v11 = *(_DWORD *)(a1 + 56);
    v12 = redirect_descriptors + 48 * v11;
    *(_QWORD *)(v12 + 8) = v10;
    *(_QWORD *)(v12 + 16) = *(_QWORD *)(a1 + 48);
    fcntl(v11, 4, 4);
    v13 = dispatch_source_create(MEMORY[0x1E0C86F18], *(int *)(a1 + 56), 0, (dispatch_queue_t)redirect_serial_q);
    *(_QWORD *)(redirect_descriptors + 48 * *(int *)(a1 + 56) + 40) = v13;
    dispatch_set_context(v13, v13);
    dispatch_source_set_event_handler_f(v13, (dispatch_function_t)read_from_source);
    dispatch_source_set_cancel_handler_f(v13, (dispatch_function_t)cancel_source);
    dispatch_group_enter((dispatch_group_t)read_source_group);
    dispatch_resume(v13);
    return;
  }
LABEL_9:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *__error();
}

void read_from_source(NSObject *a1)
{
  int handle;

  handle = dispatch_source_get_handle(a1);
  if (_read_redirect(handle, 0) == -1)
    dispatch_source_cancel(a1);
}

void cancel_source(NSObject *a1)
{
  int handle;
  uint64_t v3;

  handle = dispatch_source_get_handle(a1);
  v3 = redirect_descriptors + 48 * handle;
  _read_redirect(handle, 1);
  close(handle);
  asl_client_release(*(asl_object_t *)(v3 + 8));
  asl_msg_release(*(asl_object_t *)(v3 + 16));
  free(*(void **)(v3 + 24));
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)v3 = 0u;
  dispatch_release(a1);
  dispatch_group_leave((dispatch_group_t)read_source_group);
}

intptr_t redirect_atexit()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;

  v0 = n_redirect_descriptors;
  if (n_redirect_descriptors <= 1)
  {
LABEL_4:
    if (v0 < 1)
      goto LABEL_9;
    goto LABEL_5;
  }
  if (*(_QWORD *)(redirect_descriptors + 72))
  {
    fflush((FILE *)*MEMORY[0x1E0C874E8]);
    v0 = n_redirect_descriptors;
    goto LABEL_4;
  }
LABEL_5:
  v1 = 0;
  v2 = redirect_descriptors;
  v3 = 40;
  do
  {
    v4 = *(NSObject **)(v2 + v3);
    if (v4)
    {
      dispatch_source_cancel(v4);
      v2 = redirect_descriptors;
      v0 = n_redirect_descriptors;
    }
    ++v1;
    v3 += 48;
  }
  while (v1 < v0);
LABEL_9:
  v5 = read_source_group;
  v6 = dispatch_time(0, 3000000000);
  return dispatch_group_wait(v5, v6);
}

uint64_t _read_redirect(int a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  const char **v5;
  void **v7;
  ssize_t v8;
  uint64_t v9;
  unsigned int v10;
  asl_object_t *v11;
  asl_object_t *v12;
  const char *v13;
  const char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  const char *v18;
  int v20;
  uint64_t v21;
  unsigned int v22;

  v3 = redirect_descriptors;
  v4 = redirect_descriptors + 48 * a1;
  v5 = (const char **)(v4 + 32);
  v7 = (void **)(v4 + 24);
  v8 = read(a1, *(void **)(v4 + 32), *(_QWORD *)(v4 + 24) - *(_QWORD *)(v4 + 32) + 511);
  v20 = a1;
  v21 = v3;
  if (v8 < 1)
  {
    v10 = 0;
  }
  else
  {
    v9 = v3 + 48 * a1;
    v10 = 0;
    v11 = (asl_object_t *)(v9 + 8);
    v12 = (asl_object_t *)(v9 + 16);
    do
    {
      v13 = &(*v5)[v8];
      *v5 = v13;
      *v13 = 0;
      v14 = (const char *)*v7;
      v15 = (char *)*v5;
      if (*v7 >= *v5)
      {
        v17 = (char *)*v7;
      }
      else
      {
        v22 = v10;
        while (1)
        {
          v16 = 0;
          v17 = (char *)v14;
          while (v14[v16])
          {
            if (v14[v16] == 10)
            {
              v14[v16] = 0;
              v15 = (char *)*v5;
              break;
            }
            ++v16;
          }
          v18 = &v14[v16];
          if (&v14[v16] >= v15 && *v7 != v14)
            break;
          asl_log(*v11, *v12, *(_DWORD *)v4, "%s", v14);
          v14 = v18 + 1;
          v15 = (char *)*v5;
          if (v18 + 1 >= *v5)
          {
            v14 = (const char *)*v7;
            v17 += v16 + 1;
            goto LABEL_16;
          }
        }
        memmove(*v7, v14, (_BYTE *)*v7 - v14 + 512);
        v14 = (const char *)*v7;
        v15 = (char *)*v7 + v16;
        *v5 = v15;
LABEL_16:
        v10 = v22;
      }
      if (v17 == v15)
      {
        *v5 = v14;
        v15 = (char *)v14;
      }
      v10 += v8;
      v8 = read(a1, v15, v14 - v15 + 511);
    }
    while (v8 > 0);
  }
  if ((a2 || !v8) && *v5 > *v7)
  {
    **v5 = 0;
    asl_log(*(asl_object_t *)(v21 + 48 * v20 + 8), *(asl_object_t *)(v21 + 48 * v20 + 16), *(_DWORD *)v4, "%s", (const char *)*v7);
  }
  if (v8)
    return v10;
  else
    return 0xFFFFFFFFLL;
}

double asl_msg_list_new()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  if (v0)
  {
    *(_QWORD *)&result = 0x100000002;
    *v0 = 0x100000002;
  }
  return result;
}

_QWORD *asl_msg_list_new_count(unsigned int a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;

  v2 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)v2 = 0x100000002;
    *((_DWORD *)v2 + 2) = a1;
    v4 = reallocf(*((void **)v2 + 2), 8 * a1);
    v3[2] = v4;
    if (!v4)
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

asl_object_t asl_msg_list_retain(asl_object_t obj)
{
  if (obj)
    asl_retain(obj);
  return obj;
}

void asl_msg_list_release(asl_object_t obj)
{
  if (obj)
    asl_release(obj);
}

char *asl_msg_list_to_string(char *result, _DWORD *a2)
{
  char *v2;
  char *v4;
  unint64_t v5;
  char __str[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (result)
  {
    v2 = result;
    if (*((_DWORD *)result + 2) && *((_QWORD *)result + 2))
    {
      result = (char *)asl_string_new(2);
      if (result)
      {
        v4 = result;
        snprintf(__str, 0x10uLL, "%u", *((_DWORD *)v2 + 2));
        asl_string_append((uint64_t)v4, __str);
        asl_string_append_char_no_encoding(v4, 10);
        if (*((_DWORD *)v2 + 2))
        {
          v5 = 0;
          do
          {
            asl_string_append_asl_msg(v4, *(_DWORD **)(*((_QWORD *)v2 + 2) + 8 * v5));
            asl_string_append_char_no_encoding(v4, 10);
            ++v5;
          }
          while (v5 < *((unsigned int *)v2 + 2));
        }
        *a2 = asl_string_length((uint64_t)v4);
        return asl_string_release_return_bytes(v4);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_QWORD *asl_msg_list_to_asl_string(uint64_t a1, int a2)
{
  _QWORD *v3;
  unint64_t v4;
  char __str[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (!a1 || !*(_DWORD *)(a1 + 8) || !*(_QWORD *)(a1 + 16))
    return 0;
  v3 = asl_string_new(a2);
  if (v3)
  {
    snprintf(__str, 0x10uLL, "%u", *(_DWORD *)(a1 + 8));
    asl_string_append((uint64_t)v3, __str);
    asl_string_append_char_no_encoding(v3, 10);
    if (*(_DWORD *)(a1 + 8))
    {
      v4 = 0;
      do
      {
        asl_string_append_asl_msg(v3, *(_DWORD **)(*(_QWORD *)(a1 + 16) + 8 * v4));
        asl_string_append_char_no_encoding(v3, 10);
        ++v4;
      }
      while (v4 < *(unsigned int *)(a1 + 8));
    }
  }
  return v3;
}

__asl_object_s *asl_msg_list_from_string(const char *a1)
{
  char *v1;
  int v2;
  int v3;
  __asl_object_s *v4;
  __asl_object_s *v5;
  char *v6;
  __asl_object_s *v7;
  __asl_object_s *v8;

  if (!a1)
    return 0;
  v1 = (char *)a1;
  v2 = atoi(a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (__asl_object_s *)malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)v4 = 0x100000002;
    while (1)
    {
      v6 = strchr(v1, 10);
      if (!v6)
        break;
      v1 = v6 + 1;
      v7 = asl_msg_from_string((uint64_t)(v6 + 1));
      if (!v7)
        break;
      v8 = v7;
      asl_msg_list_insert((uint64_t)v5, 0xFFFFFFFF, v7);
      asl_msg_release(v8);
      if (!--v3)
        return v5;
    }
    asl_release(v5);
    return 0;
  }
  return v5;
}

void asl_msg_list_append(uint64_t a1, asl_object_t obj)
{
  asl_msg_list_insert(a1, 0xFFFFFFFF, obj);
}

void asl_msg_list_insert(uint64_t a1, unsigned int a2, asl_object_t obj)
{
  unsigned int v5;
  unsigned int v6;
  uint32_t type;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  if (a1)
  {
    if (obj)
    {
      v5 = *(_DWORD *)(a1 + 8);
      if (v5 != -1)
      {
        if (v5 >= a2)
          v6 = a2;
        else
          v6 = *(_DWORD *)(a1 + 8);
        type = asl_get_type(obj);
        if (type >= 2)
        {
          v8 = asl_object_count(obj);
          if (!v8)
            return;
        }
        else
        {
          v8 = 1;
        }
        v9 = *(unsigned int *)(a1 + 8);
        if (!((v9 + (unint64_t)v8) >> 32))
        {
          v10 = reallocf(*(void **)(a1 + 16), 8 * (v9 + v8));
          *(_QWORD *)(a1 + 16) = v10;
          if (v10)
          {
            v11 = *(unsigned int *)(a1 + 8);
            if (v11 > v6)
            {
              v12 = 8 * v11;
              v13 = 8 * (v11 - 1);
              do
              {
                *(_QWORD *)(*(_QWORD *)(a1 + 16) + v12) = *(_QWORD *)(*(_QWORD *)(a1 + 16) + v13);
                v12 -= 8;
                v13 -= 8;
                LODWORD(v11) = v11 - 1;
              }
              while (v6 < v11);
            }
            asl_object_set_iteration_index(obj, 0);
            if (type >= 2)
            {
              v14 = v8;
              do
              {
                *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v6++) = asl_object_next(obj);
                --v14;
              }
              while (v14);
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v6) = asl_retain(obj);
            }
            asl_object_set_iteration_index(obj, 0);
            *(_DWORD *)(a1 + 8) += v8;
          }
          else
          {
            *(_QWORD *)(a1 + 8) = 0;
          }
        }
      }
    }
  }
}

void asl_msg_list_prepend(uint64_t a1, asl_object_t obj)
{
  asl_msg_list_insert(a1, 0, obj);
}

uint64_t asl_msg_list_count(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t asl_msg_list_get_index(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    if (*(unsigned int *)(result + 8) <= a2)
    {
      return 0;
    }
    else
    {
      v3 = *(_QWORD *)(result + 16);
      if (v3)
      {
        return *(_QWORD *)(v3 + 8 * a2);
      }
      else
      {
        result = 0;
        *(_QWORD *)(v2 + 8) = 0;
      }
    }
  }
  return result;
}

_QWORD *asl_msg_list_remove_index(_QWORD *result, unint64_t a2)
{
  unsigned int v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  if (result)
  {
    v2 = a2;
    v3 = result;
    if (*((unsigned int *)result + 2) > a2)
    {
      v4 = result[2];
      if (!v4)
        goto LABEL_8;
      asl_msg_release(*(asl_object_t *)(v4 + 8 * a2));
      v5 = *((_DWORD *)v3 + 2);
      if (v2 + 1 < v5)
      {
        v6 = 8 * (v2 + 1);
        v7 = ~v2 + v5;
        do
        {
          *(_QWORD *)(v3[2] + 8 * v2) = *(_QWORD *)(v3[2] + v6);
          v6 += 8;
          --v7;
        }
        while (v7);
      }
      v8 = v5 - 1;
      *((_DWORD *)v3 + 2) = v8;
      result = reallocf((void *)v3[2], 8 * v8);
      v3[2] = result;
      if (!result)
LABEL_8:
        v3[1] = 0;
    }
  }
  return result;
}

uint64_t asl_msg_list_next(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = *(unsigned int *)(a1 + 12);
  if (v1 >= *(_DWORD *)(a1 + 8))
    return 0;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v2 = *(_QWORD *)(v2 + 8 * v1);
    *(_DWORD *)(a1 + 12) = v1 + 1;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
  }
  return v2;
}

uint64_t asl_msg_list_prev(uint64_t a1)
{
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v1 = *(_DWORD *)(a1 + 12);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    if (v1 >= *(_DWORD *)(a1 + 8))
      v1 = *(_DWORD *)(a1 + 8);
    v3 = v1 - 1;
    *(_DWORD *)(a1 + 12) = v3;
    return *(_QWORD *)(v2 + 8 * v3);
  }
  else
  {
    v4 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  return v4;
}

uint64_t asl_msg_list_reset_iteration(uint64_t result, unint64_t a2)
{
  int v2;

  if (result)
  {
    if (*(unsigned int *)(result + 8) < a2)
      v2 = -1;
    else
      v2 = a2;
    *(_DWORD *)(result + 12) = v2;
  }
  return result;
}

uint64_t asl_msg_list_search(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 16))
  {
    v5 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    return v5;
  }
  if (!*(_DWORD *)(a1 + 8))
    return 0;
  v4 = 0;
  v5 = 0;
  do
  {
    if (!a2 || asl_msg_cmp(a2, *(_DWORD **)(*(_QWORD *)(a1 + 16) + 8 * v4)))
    {
      if (!v5)
      {
        v6 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
        v5 = (uint64_t)v6;
        if (!v6)
          return v5;
        *v6 = 0x100000002;
      }
      asl_msg_list_insert(v5, 0xFFFFFFFF, *(asl_object_t *)(*(_QWORD *)(a1 + 16) + 8 * v4));
    }
    ++v4;
  }
  while (v4 < *(unsigned int *)(a1 + 8));
  return v5;
}

uint64_t asl_msg_list_match(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4, unint64_t a5, unsigned int a6, int a7)
{
  __darwin_time_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  unint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  _QWORD *v22;
  __darwin_suseconds_t v24;
  timeval v26;
  timeval v27;

  v27.tv_sec = 0;
  *(_QWORD *)&v27.tv_usec = 0;
  if (!a1)
    return 0;
  if (*(_QWORD *)(a1 + 16))
  {
    v26.tv_sec = 0;
    *(_QWORD *)&v26.tv_usec = 0;
    if (a6 && !gettimeofday(&v26, 0))
    {
      v15 = v26.tv_usec + a6 % 0xF4240;
      v16 = v15 > 0xF4240;
      if (v15 > 0xF4240)
        v15 -= 1000000;
      v24 = v15;
      if (v16)
        v13 = v26.tv_sec + a6 / 0xF4240uLL + 1;
      else
        v13 = v26.tv_sec + a6 / 0xF4240uLL;
    }
    else
    {
      v24 = 0;
      v13 = 0;
    }
    v17 = *(unsigned int *)(a1 + 8);
    v18 = v17 - 1;
    if (a7 < 0)
    {
      if (v17 <= a4)
        LODWORD(a4) = v17 - 1;
      v19 = -1;
      v18 = 0;
      goto LABEL_18;
    }
    if (v17 > a4)
    {
      v19 = 1;
LABEL_18:
      v20 = 0;
      v14 = 0;
      while (!a2)
      {
        v21 = 1;
        if (a3)
          goto LABEL_21;
LABEL_22:
        if (v21)
        {
          if (!v14)
          {
            v22 = malloc_type_calloc(1uLL, 0x18uLL, 0x108004098BBCF0FuLL);
            v14 = (uint64_t)v22;
            if (!v22)
              return v14;
            *v22 = 0x100000002;
          }
          asl_msg_list_insert(v14, 0xFFFFFFFF, *(asl_object_t *)(*(_QWORD *)(a1 + 16) + 8 * a4));
          ++v20;
        }
        if (v20 >= a5
          || v13 && !gettimeofday(&v27, 0) && (v27.tv_sec > v13 || v27.tv_sec == v13 && v27.tv_usec > v24))
        {
          return v20;
        }
        LODWORD(a4) = a4 + v19;
        if (v18 == (_DWORD)a4)
          return v14;
      }
      v21 = asl_msg_cmp_list(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a4), a2);
      if (!a3)
        goto LABEL_22;
LABEL_21:
      *a3 = a4;
      goto LABEL_22;
    }
    if (a3)
    {
      v14 = 0;
      *a3 = v17;
      return v14;
    }
    return 0;
  }
  v14 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  return v14;
}

uint64_t _jump_count(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t _jump_next(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = *(unsigned int *)(a1 + 12);
  if (v1 >= *(_DWORD *)(a1 + 8))
    return 0;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v2 = *(_QWORD *)(v2 + 8 * v1);
    *(_DWORD *)(a1 + 12) = v1 + 1;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
  }
  return v2;
}

uint64_t _jump_prev(uint64_t a1)
{
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v1 = *(_DWORD *)(a1 + 12);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    if (v1 >= *(_DWORD *)(a1 + 8))
      v1 = *(_DWORD *)(a1 + 8);
    v3 = v1 - 1;
    *(_DWORD *)(a1 + 12) = v3;
    return *(_QWORD *)(v2 + 8 * v3);
  }
  else
  {
    v4 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  return v4;
}

uint64_t _jump_get_object_at_index(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    if (*(unsigned int *)(result + 8) <= a2)
    {
      return 0;
    }
    else
    {
      v3 = *(_QWORD *)(result + 16);
      if (v3)
      {
        return *(_QWORD *)(v3 + 8 * a2);
      }
      else
      {
        result = 0;
        *(_QWORD *)(v2 + 8) = 0;
      }
    }
  }
  return result;
}

uint64_t _jump_set_iteration_index(uint64_t result, unint64_t a2)
{
  int v2;

  if (result)
  {
    if (*(unsigned int *)(result + 8) < a2)
      v2 = -1;
    else
      v2 = a2;
    *(_DWORD *)(result + 12) = v2;
  }
  return result;
}

void _jump_prepend(uint64_t a1, asl_object_t obj)
{
  if (asl_get_type(obj) <= 1)
    asl_msg_list_insert(a1, 0, obj);
}

uint64_t _jump_search_0(uint64_t a1, asl_object_t obj)
{
  uint32_t type;

  type = asl_get_type(obj);
  if (obj && type >= 2)
    return 0;
  else
    return asl_msg_list_search(a1, obj);
}

uint64_t _jump_match_0(uint64_t a1, asl_object_t obj, unint64_t *a3, unint64_t a4, unint64_t a5, unsigned int a6, int a7)
{
  uint32_t type;

  type = asl_get_type(obj);
  if (!obj || type == 2)
    return asl_msg_list_match(a1, (uint64_t)obj, a3, a4, a5, a6, a7);
  else
    return 0;
}

asl_object_t asl_file_retain(asl_object_t obj)
{
  if (obj)
    asl_retain(obj);
  return obj;
}

void asl_file_release(asl_object_t obj)
{
  if (obj)
    asl_release(obj);
}

uint64_t asl_file_close(__asl_object_s *a1)
{
  if (a1)
    asl_release(a1);
  return 0;
}

uint64_t asl_file_open_write_fd(int a1, _QWORD *a2)
{
  uint64_t result;
  _QWORD *v5;
  _QWORD *v6;
  FILE *v7;
  time_t v8;
  int v9;
  FILE *v10;
  void *v11;
  _BYTE __ptr[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _WORD v16[13];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  result = 9999;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    v5 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040093DCD73uLL);
    if (v5)
    {
      v6 = v5;
      *v5 = 0x100000003;
      v7 = fdopen(a1, "w+");
      v6[13] = v7;
      if (v7)
      {
        v13 = 0u;
        memset(v16, 0, sizeof(v16));
        v15 = 0u;
        v14 = 0u;
        qmemcpy(__ptr, "ASL DB", sizeof(__ptr));
        *(_DWORD *)((char *)&v13 + 6) = 0x2000000;
        v8 = time(0);
        v6[11] = v8;
        *(_QWORD *)((char *)&v14 + 2) = asl_core_htonq(v8);
        *(_DWORD *)((char *)&v14 + 10) = 0x80000000;
        v9 = fwrite(__ptr, 0x50uLL, 1uLL, (FILE *)v6[13]);
        v10 = (FILE *)v6[13];
        if (v9 == 1)
        {
          fflush(v10);
          v6[12] = 80;
          v11 = malloc_type_malloc(0x11AuLL, 0xB9549B7uLL);
          result = 0;
          v6[15] = v11;
          *a2 = v6;
          return result;
        }
        fclose(v10);
      }
      free(v6);
      return 9999;
    }
    else
    {
      return 9;
    }
  }
  return result;
}

uint64_t asl_file_create(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return open(a1, 2562, a4);
}

uint64_t asl_file_open_write(const char *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  int v8;
  uint64_t set_position_last;
  _QWORD *v10;
  uint64_t v11;
  FILE *v12;
  BOOL v13;
  unint64_t v14;
  unint64_t st_size;
  int v16;
  uint64_t uint64;
  uint64_t v19;
  unsigned int v20;
  stat v21;
  int __ptr;
  __int16 v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C874D8];
  v20 = 0;
  memset(&v21, 0, sizeof(v21));
  if (!stat(a1, &v21))
  {
    if ((v21.st_mode & 0xF000) != 0x8000)
      return 2;
    if (v21.st_size)
    {
      v10 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040093DCD73uLL);
      if (!v10)
        return 9;
      v11 = (uint64_t)v10;
      *v10 = 0x100000003;
      v12 = fopen(a1, "r+");
      *(_QWORD *)(v11 + 104) = v12;
      if (v12)
      {
        if ((int)fread(&__ptr, 0x50uLL, 1uLL, v12) <= 0)
          goto LABEL_38;
        v13 = __ptr == 541872961 && v23 == 16964;
        if (v13 && v24 == 0x2000000)
        {
          *(_QWORD *)(v11 + 88) = asl_core_ntohq(v26);
          *(_QWORD *)(v11 + 40) = asl_core_ntohq(v25);
          v14 = asl_core_ntohq(v27);
          *(_QWORD *)(v11 + 48) = v14;
          st_size = v21.st_size;
          *(_QWORD *)(v11 + 96) = v21.st_size;
          if (v14 + 122 > st_size)
          {
LABEL_18:
            *(_QWORD *)(v11 + 48) = 0;
LABEL_19:
            if (*(_DWORD *)(v11 + 12) == 1)
            {
              set_position_last = 9999;
LABEL_32:
              asl_release((asl_object_t)v11);
              return set_position_last;
            }
            set_position_last = asl_file_read_set_position_last(v11, 0);
            if ((_DWORD)set_position_last)
              goto LABEL_32;
            *(_QWORD *)(v11 + 64) = *(_QWORD *)(v11 + 72);
            if (!fseeko(*(FILE **)(v11 + 104), 0, 2))
            {
              *(_QWORD *)(v11 + 96) = ftello(*(FILE **)(v11 + 104));
              set_position_last = 0;
              *(_QWORD *)(v11 + 120) = malloc_type_malloc(0x11AuLL, 0x4CB36572uLL);
              *a5 = v11;
              return set_position_last;
            }
LABEL_38:
            asl_release((asl_object_t)v11);
            return 7;
          }
          uint64 = asl_file_read_uint32(v11, v14 + 2, &v20);
          if (!(_DWORD)uint64)
          {
            v19 = *(_QWORD *)(v11 + 48);
            if (v19 + (unint64_t)v20 > *(_QWORD *)(v11 + 96))
              goto LABEL_18;
            if (!v19)
              goto LABEL_19;
            uint64 = asl_file_read_uint64(v11, v19 + 14, (unint64_t *)(v11 + 56));
            if (!(_DWORD)uint64)
              goto LABEL_19;
          }
          set_position_last = uint64;
          goto LABEL_32;
        }
        asl_release((asl_object_t)v11);
        return 2;
      }
      free((void *)v11);
    }
    else
    {
      v16 = open(a1, 2050, a2);
      if ((v16 & 0x80000000) == 0)
        return asl_file_open_write_fd(v16, a5);
    }
    return 9999;
  }
  if (*__error() != 2)
    return 9999;
  v8 = open(a1, 2562, a2);
  if (v8 < 0)
    return 9999;
  set_position_last = asl_file_open_write_fd(v8, a5);
  if ((_DWORD)set_position_last)
    unlink(a1);
  return set_position_last;
}

uint64_t asl_file_read_uint32(uint64_t a1, off_t a2, _DWORD *a3)
{
  FILE *v4;
  uint64_t result;
  unsigned int __ptr;

  v4 = *(FILE **)(a1 + 104);
  if (!v4)
    return 2;
  if ((unint64_t)(a2 + 4) > *(_QWORD *)(a1 + 96))
    return 7;
  if (fseeko(v4, a2, 0))
    return 7;
  __ptr = 0;
  if (fread(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 104)) != 1)
    return 7;
  result = 0;
  if (a3)
    *a3 = bswap32(__ptr);
  return result;
}

uint64_t asl_file_read_uint64(uint64_t a1, off_t a2, unint64_t *a3)
{
  FILE *v4;
  unint64_t v6;
  uint64_t result;
  unint64_t __ptr;

  v4 = *(FILE **)(a1 + 104);
  if (!v4)
    return 2;
  if ((unint64_t)(a2 + 8) > *(_QWORD *)(a1 + 96))
    return 7;
  if (fseeko(v4, a2, 0))
    return 7;
  __ptr = 0;
  if (fread(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 104)) != 1)
    return 7;
  if (!a3)
    return 0;
  v6 = asl_core_ntohq(__ptr);
  result = 0;
  *a3 = v6;
  return result;
}

uint64_t asl_file_read_set_position(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  off_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;

  if (!a1)
    return 2;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 9999;
  if (a2 == 3)
    return asl_file_read_set_position_last(a1, 0);
  if (!a2)
  {
    *(_QWORD *)(a1 + 80) = 0;
    v5 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 72) = v5;
    if (v5)
      return asl_file_read_uint64(a1, v5 + 14, (unint64_t *)(a1 + 80));
    else
      return 0;
  }
  v11 = 0;
  if (a2 == 1)
  {
    v6 = *(_QWORD *)(a1 + 72);
    result = 14;
    if (v6)
    {
      if (v6 != *(_QWORD *)(a1 + 40))
      {
        result = asl_file_read_uint32(a1, v6 + 2, &v11);
        if (!(_DWORD)result)
        {
          v7 = *(_QWORD *)(a1 + 72) + v11 - 2;
          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    if (a2 != 2)
      return 1;
    v8 = *(_QWORD *)(a1 + 72);
    result = 14;
    if (v8 && v8 != *(_QWORD *)(a1 + 48))
    {
      v7 = v8 + 6;
LABEL_20:
      *(_QWORD *)(a1 + 80) = 0;
      v12 = 0;
      if (asl_file_read_uint64(a1, v7, &v12))
        return 7;
      v9 = v12;
      if (v12 + 122 > *(_QWORD *)(a1 + 96))
        goto LABEL_25;
      v10 = *(_QWORD *)(a1 + 72);
      if (a2 == 1)
      {
        if (v12 < v10)
        {
          *(_QWORD *)(a1 + 72) = v12;
          if (!v9)
            return 14;
          return asl_file_read_uint64(a1, v9 + 14, (unint64_t *)(a1 + 80));
        }
      }
      else if (v12 > v10)
      {
        *(_QWORD *)(a1 + 72) = v12;
        return asl_file_read_uint64(a1, v9 + 14, (unint64_t *)(a1 + 80));
      }
LABEL_25:
      *(_QWORD *)(a1 + 72) = 0;
      return 14;
    }
  }
  return result;
}

uint64_t asl_file_compact(uint64_t a1, char *a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t set_position;
  unint64_t v9;
  uint64_t pos;
  uint64_t v12;
  __asl_object_s *v13;
  stat v14;
  __asl_object_s *v15;

  if (!a1)
    return 2;
  if (!a2)
    return 1;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 9999;
  v12 = 0;
  v13 = 0;
  memset(&v14, 0, sizeof(v14));
  if (!stat(a2, &v14) || *__error() != 2)
    return 9999;
  set_position = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)set_position)
  {
    v15 = 0;
    set_position = asl_file_open_write(a2, a3, v6, v7, (uint64_t *)&v15);
    if (!(_DWORD)set_position)
    {
      *((_DWORD *)v15 + 2) = 12;
      while (1)
      {
        v9 = *(_QWORD *)(a1 + 72);
        if (!v9)
        {
          set_position = 0;
          goto LABEL_21;
        }
        v13 = 0;
        if (*(_DWORD *)(a1 + 12) == 1)
        {
          set_position = 9999;
          goto LABEL_21;
        }
        pos = asl_file_fetch_pos(a1, v9, 1, (int **)&v13);
        if ((_DWORD)pos)
          break;
        v12 = 0;
        set_position = asl_file_save((uint64_t)v15, v13, &v12);
        asl_msg_release(v13);
        if ((_DWORD)set_position)
          goto LABEL_21;
      }
      set_position = pos;
LABEL_21:
      if (v15)
        asl_release(v15);
    }
  }
  return set_position;
}

uint64_t asl_file_fetch_next(uint64_t a1, int **a2)
{
  if (!a1)
    return 2;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 9999;
  return asl_file_fetch_pos(a1, *(_QWORD *)(a1 + 72), 1, a2);
}

uint64_t asl_file_save(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  unsigned int v6;
  unsigned int v7;
  unint64_t *v8;
  char *v9;
  uint64_t v10;
  unsigned int v11;
  char *v12;
  uint64_t v13;
  unint64_t *v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v21;
  void *v22;
  int v23;
  _OWORD *v24;
  char *v25;
  unint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  off_t v30;
  uint64_t v31;
  off_t v32;
  void *__ptr;
  char *__s;
  char *__s1;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  __int128 v40;
  int8x16_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unint64_t v46;
  _BYTE __src[1024];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C874D8];
  v37 = 0;
  if (!a1 || !*(_QWORD *)(a1 + 104))
    return 2;
  if (!a2)
    return 5;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    return 11;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0;
  v39 = -1;
  if (a3 && *a3)
    v39 = *a3;
  __s1 = 0;
  v36 = 0;
  v41 = (int8x16_t)xmmword_1DE3EEAC0;
  LODWORD(v42) = -1;
  *(_QWORD *)&v40 = 0;
  *((_QWORD *)&v40 + 1) = 0x700000000;
  v46 = *(_QWORD *)(a1 + 64);
  __s = 0;
  v6 = asl_msg_fetch(a2, 0, &__s1, (int **)&__s, 0);
  if (v6 != -1)
  {
    v7 = v6;
    __ptr = 0;
    v8 = (unint64_t *)__src;
    while (1)
    {
      v9 = __s1;
      if (!__s1)
        goto LABEL_44;
      if (!strcmp(__s1, "Time"))
      {
        if (__s)
          *(_QWORD *)&v40 = asl_core_parse_time(__s, 0);
        goto LABEL_44;
      }
      if (!strcmp(v9, "TimeNanoSec"))
      {
        if (__s)
          DWORD2(v40) = atoi(__s);
        goto LABEL_44;
      }
      if (!strcmp(v9, "Host"))
      {
        v12 = __s;
        if (!__s)
          goto LABEL_44;
        v13 = a1;
        v14 = (unint64_t *)&v43;
        goto LABEL_43;
      }
      if (!strcmp(v9, "Sender"))
      {
        v12 = __s;
        if (!__s)
          goto LABEL_44;
        v13 = a1;
        v14 = (unint64_t *)&v43 + 1;
        goto LABEL_43;
      }
      if (!strcmp(v9, "PID"))
      {
        if (__s)
          v41.i32[0] = atoi(__s);
        goto LABEL_44;
      }
      if (!strcmp(v9, "RefPID"))
      {
        if (__s)
          DWORD1(v42) = atoi(__s);
        goto LABEL_44;
      }
      if (!strcmp(v9, "UID"))
      {
        if (__s)
          v41.i32[1] = atoi(__s);
        goto LABEL_44;
      }
      if (!strcmp(v9, "GID"))
      {
        if (__s)
          v41.i32[2] = atoi(__s);
        goto LABEL_44;
      }
      if (!strcmp(v9, "Level"))
      {
        if (__s)
          WORD6(v40) = atoi(__s);
        goto LABEL_44;
      }
      if (!strcmp(v9, "Message"))
      {
        v12 = __s;
        if (!__s)
          goto LABEL_44;
        v13 = a1;
        v14 = (unint64_t *)&v44 + 1;
        goto LABEL_43;
      }
      if (!strcmp(v9, "Facility"))
      {
        v12 = __s;
        if (!__s)
          goto LABEL_44;
        v13 = a1;
        v14 = (unint64_t *)&v44;
        goto LABEL_43;
      }
      if (!strcmp(v9, "RefProc"))
        break;
      if (!strcmp(v9, "Session"))
      {
        v12 = __s;
        if (!__s)
          goto LABEL_44;
        v13 = a1;
        v14 = (unint64_t *)&v45 + 1;
LABEL_43:
        v10 = asl_file_string_encode(v13, v12, v14);
        if ((_DWORD)v10)
          goto LABEL_102;
        goto LABEL_44;
      }
      if (!strcmp(v9, "ReadUID"))
      {
        v15 = HIWORD(v40);
        if ((BYTE14(v40) & 1) != 0 || !__s)
          goto LABEL_44;
        v41.i32[3] = atoi(__s);
        v16 = v15 | 1;
LABEL_70:
        HIWORD(v40) = v16;
        goto LABEL_44;
      }
      if (!strcmp(v9, "ReadGID"))
      {
        v17 = HIWORD(v40);
        if ((BYTE14(v40) & 2) != 0 || !__s)
          goto LABEL_44;
        LODWORD(v42) = atoi(__s);
        v16 = v17 | 2;
        goto LABEL_70;
      }
      if (!strcmp(v9, "ASLMessageID"))
      {
        if ((*(_BYTE *)(a1 + 8) & 8) != 0)
        {
          v18 = atoll(__s);
          v39 = v18;
          if (a3)
            *a3 = v18;
        }
      }
      else if (strcmp(v9, "ASLOption"))
      {
        v10 = asl_file_string_encode(a1, v9, &v37);
        if ((_DWORD)v10 || (v36 = 0, __s) && (v10 = asl_file_string_encode(a1, __s, &v36), (_DWORD)v10))
        {
LABEL_102:
          v19 = v10;
          free(__ptr);
          return v19;
        }
        v11 = DWORD2(v42);
        if (DWORD2(v42) >= 0x80)
        {
          __ptr = reallocf(__ptr, 8 * (DWORD2(v42) + 2));
          if (!__ptr)
            return 9;
          v11 = DWORD2(v42);
          v8 = (unint64_t *)__ptr;
          if (DWORD2(v42) == 128)
          {
            memcpy(__ptr, __src, 0x400uLL);
            v11 = 128;
          }
        }
        v8[v11] = v37;
        DWORD2(v42) = v11 + 2;
        v8[v11 + 1] = v36;
      }
LABEL_44:
      v7 = asl_msg_fetch(a2, v7, &__s1, (int **)&__s, 0);
      if (v7 == -1)
      {
        v21 = DWORD2(v42);
        v22 = __ptr;
        goto LABEL_80;
      }
    }
    v12 = __s;
    if (!__s)
      goto LABEL_44;
    v13 = a1;
    v14 = (unint64_t *)&v45;
    goto LABEL_43;
  }
  v21 = 0;
  v22 = 0;
  v8 = (unint64_t *)__src;
LABEL_80:
  v23 = 8 * v21;
  v24 = *(_OWORD **)(a1 + 120);
  if (!v24 || 8 * v21 + 122 > 0x11A)
  {
    v25 = (char *)malloc_type_calloc(1uLL, (v23 + 122), 0x9B8C8ED8uLL);
    if (v25)
      goto LABEL_83;
    return 9;
  }
  v24[15] = 0u;
  v24[16] = 0u;
  v24[13] = 0u;
  v24[14] = 0u;
  v24[11] = 0u;
  v24[12] = 0u;
  v24[9] = 0u;
  v24[10] = 0u;
  v24[7] = 0u;
  v24[8] = 0u;
  v24[5] = 0u;
  v24[6] = 0u;
  v24[3] = 0u;
  v24[4] = 0u;
  v24[1] = 0u;
  v24[2] = 0u;
  *v24 = 0u;
  *(_OWORD *)((char *)v24 + 266) = 0u;
  v25 = *(char **)(a1 + 120);
  if (!v25)
    return 9;
LABEL_83:
  v26 = v39;
  if (v39 == -1)
  {
    v26 = *(_QWORD *)(a1 + 56) + 1;
    *(_QWORD *)(a1 + 56) = v26;
    v39 = v26;
  }
  *(_WORD *)v25 = 0;
  *(_DWORD *)(v25 + 2) = bswap32(v23 + 116);
  *(_QWORD *)(v25 + 6) = asl_core_htonq(v38);
  *(_QWORD *)(v25 + 14) = asl_core_htonq(v26);
  *(_QWORD *)(v25 + 22) = asl_core_htonq(v40);
  *(_DWORD *)(v25 + 30) = bswap32(DWORD2(v40));
  *((_WORD *)v25 + 17) = bswap32(WORD6(v40)) >> 16;
  *((_WORD *)v25 + 18) = bswap32(HIWORD(v40)) >> 16;
  *(int8x16_t *)(v25 + 38) = vrev32q_s8(v41);
  *(int8x8_t *)(v25 + 54) = vrev32_s8(*(int8x8_t *)&v42);
  *(_DWORD *)(v25 + 62) = bswap32(v21);
  *(_QWORD *)(v25 + 66) = asl_core_htonq(v43);
  *(_QWORD *)(v25 + 74) = asl_core_htonq(*((unint64_t *)&v43 + 1));
  *(_QWORD *)(v25 + 82) = asl_core_htonq(v44);
  *(_QWORD *)(v25 + 90) = asl_core_htonq(*((unint64_t *)&v44 + 1));
  *(_QWORD *)(v25 + 98) = asl_core_htonq(v45);
  *(_QWORD *)(v25 + 106) = asl_core_htonq(*((unint64_t *)&v45 + 1));
  v27 = (unint64_t *)(v25 + 114);
  v28 = DWORD2(v42);
  if (DWORD2(v42))
  {
    do
    {
      v29 = *v8++;
      *v27++ = asl_core_htonq(v29);
      --v28;
    }
    while (v28);
  }
  *v27 = asl_core_htonq(v46);
  free(v22);
  if (!fseeko(*(FILE **)(a1 + 104), 0, 2))
  {
    v30 = ftello(*(FILE **)(a1 + 104));
    *(_QWORD *)(a1 + 48) = v30;
    v36 = asl_core_htonq(v30);
    fwrite(v25, (v23 + 122), 1uLL, *(FILE **)(a1 + 104));
    fflush(*(FILE **)(a1 + 104));
    if (v25 != *(char **)(a1 + 120))
      free(v25);
    v31 = *(_QWORD *)(a1 + 64);
    v32 = v31 ? v31 + 6 : 16;
    if (!fseeko(*(FILE **)(a1 + 104), v32, 0))
    {
      v19 = 8;
      if (fwrite(&v36, 8uLL, 1uLL, *(FILE **)(a1 + 104)) != 1)
        return v19;
      if (!fseeko(*(FILE **)(a1 + 104), 37, 0))
      {
        v19 = 8;
        if (fwrite(&v36, 8uLL, 1uLL, *(FILE **)(a1 + 104)) != 1)
          return v19;
        if (!fseeko(*(FILE **)(a1 + 104), 0, 2))
        {
          fflush(*(FILE **)(a1 + 104));
          v19 = 0;
          *(_QWORD *)(a1 + 96) = ftello(*(FILE **)(a1 + 104));
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 48);
          return v19;
        }
      }
    }
  }
  return 8;
}

uint64_t asl_file_filter(uint64_t a1, char *a2, uint64_t a3, char a4, unsigned int a5, int a6, int a7, _DWORD *a8, void (*a9)(int *))
{
  uint64_t v15;
  uint64_t v16;
  uint64_t set_position;
  int v18;
  unint64_t v19;
  uint64_t pos;
  int *val_for_key;
  uint64_t v23;
  int *v24;
  stat v25;
  __asl_object_s *v26;

  v23 = 0;
  if (a8)
    *a8 = 0;
  if (!a1)
    return 2;
  if (!a2)
    return 1;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 9999;
  v24 = 0;
  memset(&v25, 0, sizeof(v25));
  if (!stat(a2, &v25) || *__error() != 2)
    return 9999;
  set_position = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)set_position)
  {
    v26 = 0;
    set_position = asl_file_open_write(a2, a5, v15, v16, (uint64_t *)&v26);
    if (!(_DWORD)set_position)
    {
      v18 = 0;
      *((_DWORD *)v26 + 2) = 12;
      while (1)
      {
        v19 = *(_QWORD *)(a1 + 72);
        if (!v19)
        {
          set_position = 0;
          goto LABEL_31;
        }
        v24 = 0;
        if (*(_DWORD *)(a1 + 12) == 1)
        {
          set_position = 9999;
          goto LABEL_31;
        }
        pos = asl_file_fetch_pos(a1, v19, 1, &v24);
        if ((_DWORD)pos)
          break;
        if ((a4 & 1) == (asl_msg_cmp_list((uint64_t)v24, a3) == 0))
        {
          if (a9)
          {
            val_for_key = asl_msg_get_val_for_key(v24, "ASLAuxURL");
            if (val_for_key)
              a9(val_for_key);
          }
          set_position = 0;
        }
        else
        {
          set_position = asl_file_save((uint64_t)v26, v24, &v23);
          if (!(_DWORD)set_position)
            ++v18;
        }
        asl_msg_release((asl_object_t)v24);
        if ((_DWORD)set_position)
          goto LABEL_31;
      }
      set_position = pos;
LABEL_31:
      if (v26)
        asl_release(v26);
      if (a8)
        *a8 = v18;
    }
  }
  return set_position;
}

uint64_t asl_file_filter_level(uint64_t a1, char *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, void (*a8)(void))
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  int *val_for_key;
  char v21;
  char __ptr;
  uint64_t v23;
  int *v24;
  stat v25;
  uint64_t v26;

  v23 = 0;
  if (a7)
    *a7 = 0;
  if (!a1)
    return 2;
  if (!a2)
    return 1;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 9999;
  v26 = 0;
  v24 = 0;
  v21 = 0;
  memset(&v25, 0, sizeof(v25));
  if (!stat(a2, &v25) || *__error() != 2)
    return 9999;
  if (fseeko(*(FILE **)(a1 + 104), 36, 0))
    return 7;
  __ptr = 0;
  fread(&__ptr, 1uLL, 1uLL, *(FILE **)(a1 + 104));
  result = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)result)
  {
    v26 = 0;
    result = asl_file_open_write(a2, a4, v15, v16, &v26);
    if (!(_DWORD)result)
    {
      v17 = 0;
      v18 = 0;
      *(_DWORD *)(v26 + 8) = 12;
      while (!v17)
      {
        v19 = *(_QWORD *)(a1 + 72);
        if (!v19)
          break;
        v24 = 0;
        if (*(_DWORD *)(a1 + 12) == 1 || asl_file_fetch_pos(a1, v19, 1, &v24))
          break;
        v17 = 0;
        if (v24)
        {
          val_for_key = asl_msg_get_val_for_key(v24, "Level");
          v17 = 0;
          if (val_for_key)
          {
            if (((a3 >> atoi((const char *)val_for_key)) & 1) != 0)
            {
              v17 = asl_file_save(v26, v24, &v23);
              if (!v17)
                ++v18;
            }
            else
            {
              if (a8 && asl_msg_get_val_for_key(v24, "ASLAuxURL"))
                a8();
              v17 = 0;
            }
            asl_msg_release((asl_object_t)v24);
          }
        }
      }
      v21 = __ptr & a3;
      if (fseeko(*(FILE **)(v26 + 104), 36, 0))
        return 7;
      fwrite(&v21, 1uLL, 1uLL, *(FILE **)(v26 + 104));
      if (v26)
        asl_release((asl_object_t)v26);
      result = 0;
      if (a7)
        *a7 = v18;
    }
  }
  return result;
}

uint64_t asl_file_string_encode(uint64_t a1, char *__s, unint64_t *a3)
{
  unsigned int v6;
  unint64_t v7;
  uint64_t result;
  size_t v9;
  int v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  _DWORD *v15;
  uint64_t v16;
  int v17;
  _OWORD *v18;
  _DWORD *v19;
  __int16 __ptr;
  unint64_t v21;
  unsigned int v22;

  if (!*(_QWORD *)(a1 + 104))
    return 2;
  v6 = strlen(__s);
  if (v6 <= 7)
  {
    v21 = v6 | 0x80u;
    __memcpy_chk();
    v7 = asl_core_ntohq(v21);
LABEL_4:
    result = 0;
    *a3 = v7;
    return result;
  }
  v9 = v6 + 1;
  if (v9 > 0x6C)
  {
    v10 = 0;
  }
  else
  {
    v10 = asl_core_string_hash(__s, v9);
    v11 = *(_QWORD *)(a1 + 24);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)(a1 + 24);
      while (1)
      {
        v14 = (unint64_t *)v13;
        if (v10 == *(_DWORD *)(v13 + 8) && !strcmp(__s, (const char *)(v13 + 24)))
          break;
        v13 = v14[2];
        v12 = v14;
        if (!v13)
          goto LABEL_14;
      }
      if (v12)
      {
        v12[2] = v14[2];
        v14[2] = v11;
        *(_QWORD *)(a1 + 24) = v14;
      }
      v7 = *v14;
      goto LABEL_4;
    }
  }
LABEL_14:
  v7 = ftello(*(FILE **)(a1 + 104));
  __ptr = 256;
  if (fwrite(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 104)) != 1)
    return 8;
  v22 = bswap32(v9);
  if (fwrite(&v22, 4uLL, 1uLL, *(FILE **)(a1 + 104)) != 1
    || fwrite(__s, v9, 1uLL, *(FILE **)(a1 + 104)) != 1)
  {
    return 8;
  }
  fflush(*(FILE **)(a1 + 104));
  if (v9 > 0x6C)
    goto LABEL_4;
  v15 = *(_DWORD **)(a1 + 32);
  if (v15)
  {
    *(_QWORD *)(a1 + 32) = 0;
LABEL_25:
    *(_QWORD *)v15 = v7;
    v15[2] = v10;
    v16 = *(_QWORD *)(a1 + 24);
    *((_QWORD *)v15 + 2) = v16;
    memcpy(v15 + 6, __s, v9);
    *(_QWORD *)(a1 + 24) = v15;
    v17 = *(_DWORD *)(a1 + 16);
    if ((*(_BYTE *)(a1 + 8) & 4) != 0 || v17 != 128)
    {
      *(_DWORD *)(a1 + 16) = v17 + 1;
    }
    else
    {
      do
      {
        v18 = (_OWORD *)v16;
        v19 = v15;
        v16 = *(_QWORD *)(v16 + 16);
        v15 = v18;
      }
      while (v16);
      *((_QWORD *)v19 + 2) = 0;
      file_string_dispose(a1, v18);
    }
    goto LABEL_4;
  }
  v15 = malloc_type_calloc(1uLL, 0x88uLL, 0x10200408BEEBE60uLL);
  if (v15)
    goto LABEL_25;
  return 9;
}

uint64_t asl_file_open_read(const char *a1, uint64_t *a2)
{
  uint64_t v4;
  FILE *v5;
  FILE *v6;
  BOOL v7;
  unsigned int v9;
  _QWORD *v10;
  uint64_t v11;
  void **v12;
  unint64_t v13;
  unint64_t st_size;
  uint64_t v15;
  uint64_t uint64;
  stat v17;
  void **v18;
  unsigned int v19;
  int __ptr;
  __int16 v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C874D8];
  v19 = 0;
  memset(&v17, 0, sizeof(v17));
  if (stat(a1, &v17))
    return 9999;
  v5 = fopen(a1, "r");
  if (v5)
  {
    v6 = v5;
    if ((int)fread(&__ptr, 0x50uLL, 1uLL, v5) <= 0 || (__ptr == 541872961 ? (v7 = v21 == 16964) : (v7 = 0), !v7))
    {
      fclose(v6);
      return 2;
    }
    v18 = 0;
    v9 = v22;
    if (v22 != 0x1000000 || (fclose(v6), v4 = asl_legacy1_open(a1, &v18), !(_DWORD)v4))
    {
      v10 = malloc_type_calloc(1uLL, 0x80uLL, 0x10B0040093DCD73uLL);
      if (!v10)
      {
        fclose(v6);
        return 9;
      }
      v11 = (uint64_t)v10;
      *v10 = 0x100000003;
      v10[13] = v6;
      *((_DWORD *)v10 + 2) = 1;
      *((_DWORD *)v10 + 3) = bswap32(v9);
      v12 = v18;
      if (v18)
      {
        v4 = 0;
        *((_DWORD *)v10 + 2) = 17;
        v10[14] = v12;
LABEL_25:
        *a2 = v11;
        return v4;
      }
      v10[5] = asl_core_ntohq(v23);
      v13 = asl_core_ntohq(v24);
      *(_QWORD *)(v11 + 48) = v13;
      st_size = v17.st_size;
      *(_QWORD *)(v11 + 96) = v17.st_size;
      if (v13 + 122 > st_size)
        goto LABEL_21;
      uint64 = asl_file_read_uint32(v11, v13 + 2, &v19);
      if ((_DWORD)uint64)
        goto LABEL_27;
      if (*(_QWORD *)(v11 + 48) + (unint64_t)v19 > *(_QWORD *)(v11 + 96))
LABEL_21:
        *(_QWORD *)(v11 + 48) = 0;
      v15 = *(_QWORD *)(v11 + 40);
      *(_QWORD *)(v11 + 72) = v15;
      if (!v15 || (uint64 = asl_file_read_uint64(v11, v15 + 14, (unint64_t *)(v11 + 80)), !(_DWORD)uint64))
      {
        v4 = 0;
        goto LABEL_25;
      }
LABEL_27:
      v4 = uint64;
      fclose(*(FILE **)(v11 + 104));
      free((void *)v11);
    }
  }
  else if (*__error() == 13)
  {
    return 10;
  }
  else
  {
    return 9999;
  }
  return v4;
}

uint64_t asl_file_read_set_position_last(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;

  if (a2 || (v3 = *(_QWORD *)(a1 + 48)) == 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 72) = v5;
    *(_QWORD *)(a1 + 80) = 0;
    *(_DWORD *)(a1 + 20) = 0;
    while (1)
    {
      v8 = 0;
      result = asl_file_read_uint64(a1, v5 + 6, &v8);
      if ((_DWORD)result)
        break;
      v5 = v8;
      v6 = *(_QWORD *)(a1 + 72);
      if (v8 + 122 > *(_QWORD *)(a1 + 96) || v8 <= v6)
      {
        v8 = 0;
        ++*(_DWORD *)(a1 + 20);
        if (v6)
          asl_file_read_uint64(a1, v6 + 14, (unint64_t *)(a1 + 80));
        return 0;
      }
      ++*(_DWORD *)(a1 + 20);
      *(_QWORD *)(a1 + 72) = v5;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 72) = v3;
    return asl_file_read_uint64(a1, v3 + 14, (unint64_t *)(a1 + 80));
  }
  return result;
}

uint64_t asl_file_fetch_pos(uint64_t a1, unint64_t a2, int a3, int **a4)
{
  uint64_t result;
  char *v8;
  char *v9;
  int *v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t *v14;
  unsigned int v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  void *v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t __ptr;
  unsigned int v25;
  unsigned int v26;
  unsigned int object;
  void *v28;
  void *v29;
  unint64_t *v30;
  void *v31;

  if (!*(_QWORD *)(a1 + 104))
    return 2;
  if (!a4)
    return 1;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    return 12;
  v28 = 0;
  v29 = 0;
  v25 = 0;
  v26 = 0;
  v31 = 0;
  result = asl_file_fetch_object(a1, 0, a2, (const void **)&v31, &v25);
  if (!(_DWORD)result && v31)
  {
    if (v25 <= 0x73 || 8 * (unint64_t)bswap32(*((_DWORD *)v31 + 14)) + 116 > v25)
    {
      free(v31);
      *(_QWORD *)(a1 + 72) = 0;
      *(_QWORD *)(a1 + 80) = 0;
      return 7;
    }
    v8 = asl_msg_new(0);
    v9 = (char *)v31;
    if (!v8)
    {
      free(v31);
      return 9;
    }
    v10 = (int *)v8;
    v11 = asl_core_ntohq(*(_QWORD *)v31);
    v30 = (unint64_t *)(v9 + 8);
    asl_file_fetch_helper_64(&v30, v10, "ASLMessageID");
    asl_file_fetch_helper_64(&v30, v10, "Time");
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "TimeNanoSec", 0, 0);
    asl_file_fetch_helper_16(&v30, v10, "Level");
    v30 = (unint64_t *)((char *)v30 + 2);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "PID", 0, 0);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "UID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "GID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "ReadUID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "ReadGID", 1, -1);
    asl_file_fetch_helper_32((unsigned int **)&v30, v10, "RefPID", 1, 0);
    v12 = *(_DWORD *)v30;
    v30 = (unint64_t *)((char *)v30 + 4);
    object = 0;
    asl_file_fetch_helper_str(a1, &v30, v10, "Host", &object);
    if (object
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Sender", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Facility", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Message", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "RefProc", &object), object)
      || (asl_file_fetch_helper_str(a1, &v30, v10, "Session", &object), object))
    {
LABEL_22:
      asl_msg_release((asl_object_t)v10);
      free(v31);
      *(_QWORD *)(a1 + 72) = 0;
      *(_QWORD *)(a1 + 80) = 0;
      return object;
    }
    v13 = bswap32(v12);
    v14 = v30;
    if (v13 >= 2)
    {
      v15 = v13 >> 1;
      while (1)
      {
        v16 = v14;
        v28 = 0;
        v29 = 0;
        v26 = 0;
        v17 = asl_core_ntohq(*v14);
        object = asl_file_fetch_object(a1, 1, v17, (const void **)&v29, &v26);
        if (object)
          goto LABEL_22;
        v18 = asl_core_ntohq(v16[1]);
        v26 = 0;
        if (v18)
        {
          object = asl_file_fetch_object(a1, 1, v18, (const void **)&v28, &v26);
          if (object)
          {
            free(v29);
            goto LABEL_22;
          }
          v19 = 0;
        }
        else
        {
          v19 = object;
        }
        v20 = v29;
        if (!v19 && v29)
        {
          asl_msg_set_key_val(v10, (char *)v29, (const char *)v28);
          v20 = v29;
        }
        free(v20);
        free(v28);
        v14 = v16 + 2;
        if (!--v15)
        {
          v14 = v16 + 2;
          break;
        }
      }
    }
    v21 = asl_core_ntohq(*v14);
    free(v31);
    if (a3 < 0)
    {
      if (!v21)
      {
        v11 = 0;
        goto LABEL_45;
      }
      v22 = (_QWORD *)(a1 + 72);
      v11 = v21;
      if (v21 < *(_QWORD *)(a1 + 72))
        goto LABEL_45;
    }
    else if (!v11 || (v22 = (_QWORD *)(a1 + 72), v11 > *(_QWORD *)(a1 + 72)))
    {
LABEL_45:
      *(_QWORD *)(a1 + 72) = v11;
      *(_QWORD *)(a1 + 80) = 0;
      v23 = (_QWORD *)(a1 + 72);
      if (v11)
      {
        if (v11 + 14 > *(_QWORD *)(a1 + 96))
        {
          result = 0;
          *v23 = 0;
          *(_QWORD *)(a1 + 80) = 0;
LABEL_52:
          *a4 = v10;
          return result;
        }
        object = fseeko(*(FILE **)(a1 + 104), v11 + 14, 0);
        if (object || (__ptr = 0, object = fread(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 104)), object != 1))
        {
          asl_msg_release((asl_object_t)v10);
          *v23 = 0;
          *(_QWORD *)(a1 + 80) = 0;
          return 7;
        }
        *(_QWORD *)(a1 + 80) = asl_core_ntohq(__ptr);
      }
      result = 0;
      goto LABEL_52;
    }
    result = 0;
    *v22 = 0;
    v22[1] = 0;
    return result;
  }
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  return result;
}

uint64_t asl_file_fetch_previous(uint64_t a1, int **a2)
{
  if (!a1)
    return 2;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 9999;
  return asl_file_fetch_pos(a1, *(_QWORD *)(a1 + 72), -1, a2);
}

uint64_t asl_file_fetch(uint64_t a1, unint64_t a2, int **a3)
{
  uint64_t result;
  unint64_t v7;

  if (!a1)
    return 2;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    return 12;
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    if (a3)
      return asl_legacy1_fetch(*(uint64_t **)(a1 + 112), a2, a3);
    return 0;
  }
  v7 = *(_QWORD *)(a1 + 80);
  if (v7)
    goto LABEL_10;
  result = asl_file_read_set_position(a1, 0);
  if (!(_DWORD)result)
  {
    v7 = *(_QWORD *)(a1 + 80);
    if (v7)
    {
LABEL_10:
      while (v7 < a2)
      {
        result = asl_file_read_set_position(a1, 2);
        if ((_DWORD)result)
          return result;
        v7 = *(_QWORD *)(a1 + 80);
        if (v7 - 1 >= a2)
          return 4;
      }
      while (v7 > a2)
      {
        result = asl_file_read_set_position(a1, 1);
        if (!(_DWORD)result)
        {
          v7 = *(_QWORD *)(a1 + 80);
          result = 4;
          if (v7 >= a2 && v7 != 0)
            continue;
        }
        return result;
      }
      if (v7 == a2)
      {
        if (a3)
          return asl_file_fetch_pos(a1, *(_QWORD *)(a1 + 72), 1, a3);
        return 0;
      }
    }
    return 4;
  }
  return result;
}

uint64_t asl_file_cursor(uint64_t result)
{
  if (result)
  {
    if ((*(_BYTE *)(result + 8) & 1) != 0 && *(_DWORD *)(result + 12) != 1)
      return *(_QWORD *)(result + 80);
    else
      return 0;
  }
  return result;
}

uint64_t asl_file_match_start(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t result;
  int v7;
  unint64_t v8;

  if (!a1)
    return 2;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 2;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    return 12;
  if (a3 < 0)
    v7 = 1;
  else
    v7 = 2;
  if ((a3 & 0x80000000) == 0)
  {
    result = asl_file_read_set_position(a1, 0);
    if ((_DWORD)result)
      return result;
    while (1)
    {
LABEL_14:
      v8 = *(_QWORD *)(a1 + 80);
      if (a3 < 0)
      {
        if (v8 <= a2)
          return 0;
      }
      else if (v8 >= a2)
      {
        return 0;
      }
      result = asl_file_read_set_position(a1, v7);
      if ((_DWORD)result)
        return result;
    }
  }
  result = asl_file_read_set_position_last(a1, 0);
  if (!(_DWORD)result)
    goto LABEL_14;
  return result;
}

uint64_t asl_file_match_next(uint64_t a1, uint64_t a2, __asl_object_s **a3, _QWORD *a4, int a5)
{
  uint64_t result;
  BOOL v9;
  unint64_t v10;
  int v11;
  __asl_object_s *v13;

  if (!a1)
    return 2;
  if (!a3)
    return 1;
  if (*(_DWORD *)(a1 + 12) == 1)
    return 2;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    return 12;
  if (!*(_QWORD *)(a1 + 72))
    return 14;
  *a3 = 0;
  if (a2)
    v9 = *(_DWORD *)(a2 + 8) == 0;
  else
    v9 = 1;
  v13 = 0;
  *a4 = *(_QWORD *)(a1 + 80);
  result = asl_file_fetch_pos(a1, *(_QWORD *)(a1 + 72), a5, (int **)&v13);
  switch((_DWORD)result)
  {
    case 0:
      if (v9)
        goto LABEL_28;
      if (*(_DWORD *)(a2 + 8))
      {
        v10 = 0;
        do
          v11 = asl_msg_cmp(*(_DWORD **)(*(_QWORD *)(a2 + 16) + 8 * v10++), v13);
        while (v10 < *(unsigned int *)(a2 + 8) && v11 == 0);
        if (v11)
        {
LABEL_28:
          result = 0;
          *a3 = v13;
          return result;
        }
      }
      *a3 = 0;
      asl_msg_release(v13);
      return 13;
    case 0xA:
      return 13;
    case 1:
      if (*(_QWORD *)(a1 + 72))
        return 1;
      else
        return 14;
  }
  return result;
}

uint64_t asl_file_match(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  int v9;
  uint64_t v13;
  _BOOL4 v15;
  int v16;
  unint64_t v18;
  __darwin_time_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int pos;
  __darwin_time_t v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t v30;
  _BOOL4 v31;
  __darwin_suseconds_t v32;
  uint64_t v33;
  timeval v34;
  timeval v35;
  asl_object_t obj;

  v35.tv_sec = 0;
  *(_QWORD *)&v35.tv_usec = 0;
  v33 = 0;
  if (!a1 || (*(_BYTE *)(a1 + 8) & 1) == 0)
    return 0;
  v9 = a5;
  if (*(_DWORD *)(a1 + 12) == 1)
  {
    asl_legacy1_match(*(_QWORD *)(a1 + 112), a2, &v33, a3, a4, a5, a7);
    return v33;
  }
  if (a2)
    v15 = *(_DWORD *)(a2 + 8) == 0;
  else
    v15 = 1;
  if (a7 < 0)
    v16 = 1;
  else
    v16 = 2;
  if ((a7 & 0x80000000) == 0)
  {
    if (!asl_file_read_set_position(a1, 0))
      goto LABEL_16;
    return 0;
  }
  if (asl_file_read_set_position_last(a1, 0))
    return 0;
  do
  {
LABEL_16:
    v18 = *(_QWORD *)(a1 + 80);
    if (a7 < 0)
    {
      if (v18 <= a4)
        break;
    }
    else if (v18 >= a4)
    {
      break;
    }
  }
  while (!asl_file_read_set_position(a1, v16));
  v34.tv_sec = 0;
  *(_QWORD *)&v34.tv_usec = 0;
  if (a6)
  {
    if (gettimeofday(&v34, 0))
    {
      v32 = 0;
      v19 = 0;
      v34.tv_sec = 0;
      *(_QWORD *)&v34.tv_usec = 0;
    }
    else
    {
      v19 = v34.tv_sec + a6 / 0xF4240uLL;
      v34.tv_sec = v19;
      v20 = v34.tv_usec + a6 % 0xF4240;
      v34.tv_usec = v20;
      if (v20 <= 0xF4240)
      {
        v32 = v20;
      }
      else
      {
        v32 = v20 - 1000000;
        v34.tv_usec = v20 - 1000000;
        v34.tv_sec = ++v19;
      }
    }
  }
  else
  {
    v32 = 0;
    v19 = 0;
  }
  v13 = 0;
  v21 = 0;
  v22 = 0;
  v23 = (v9 - 1);
  while (1)
  {
    do
    {
      obj = 0;
      pos = asl_file_fetch_pos(a1, *(_QWORD *)(a1 + 72), a7, (int **)&obj);
    }
    while (pos == 10);
    if (pos)
      return v13;
    *a3 = *(_QWORD *)(a1 + 80);
    if (v15)
      goto LABEL_52;
    if (*(_DWORD *)(a2 + 8))
    {
      v31 = v15;
      v25 = v19;
      v26 = v23;
      v27 = 0;
      do
        v28 = asl_msg_cmp(*(_DWORD **)(*(_QWORD *)(a2 + 16) + 8 * v27++), obj);
      while (v27 < *(unsigned int *)(a2 + 8) && v28 == 0);
      v23 = v26;
      v19 = v25;
      v15 = v31;
      if (v28 == 1)
      {
LABEL_52:
        if (!v21)
        {
          asl_msg_list_new();
          v13 = v30;
          v33 = v30;
          if (!v30)
            return v13;
        }
        asl_msg_list_append(v13, obj);
        if (v23 < ++v22)
          return v13;
        if (!v19 || gettimeofday(&v35, 0))
          goto LABEL_48;
        if (v35.tv_sec > v19)
          return v13;
        if (v35.tv_sec == v19)
        {
          v21 = v13;
          if (v35.tv_usec > v32)
            return v13;
        }
        else
        {
LABEL_48:
          v21 = v13;
        }
      }
    }
    asl_msg_release(obj);
  }
}

uint64_t asl_file_size(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

uint64_t asl_file_ctime(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

void asl_file_list_close(asl_object_t *a1)
{
  asl_object_t *v1;
  asl_object_t *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (asl_object_t *)v1[1];
      if (*v1)
        asl_release(*v1);
      free(v1);
      v1 = v2;
    }
    while (v2);
  }
}

_QWORD *asl_file_list_add(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  if (a2 && *(_DWORD *)(a2 + 12) != 1)
  {
    v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
    if (v4)
    {
      *v4 = a2;
      v4[1] = a1;
      return v4;
    }
    else
    {
      return 0;
    }
  }
  return (_QWORD *)a1;
}

_QWORD **asl_file_list_match_start(uint64_t *a1, unint64_t a2, int a3)
{
  uint64_t *v5;
  _QWORD **v6;

  if (!a1)
    return 0;
  v5 = a1;
  v6 = (_QWORD **)malloc_type_calloc(1uLL, 0x10uLL, 0x10200403A5D3213uLL);
  if (v6)
  {
    do
    {
      if (!asl_file_match_start(*v5, a2, a3) && *(_QWORD *)(*v5 + 80))
        *v6 = asl_file_list_insert(*v6, *v5, a3);
      v5 = (uint64_t *)v5[1];
    }
    while (v5);
    *((_DWORD *)v6 + 2) = a3;
  }
  return v6;
}

_QWORD *asl_file_list_insert(_QWORD *a1, uint64_t a2, int a3)
{
  _QWORD *result;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;

  if (!a2)
    return a1;
  result = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
  if (result)
  {
    *result = a2;
    if (a1)
    {
      v7 = *(_QWORD *)(a2 + 80);
      v8 = *(_QWORD *)(*a1 + 80);
      if (a3 < 0)
      {
        if (v7 > v8)
          goto LABEL_6;
      }
      else if (v7 < v8)
      {
LABEL_6:
        result[1] = a1;
        return result;
      }
      v9 = (_QWORD *)a1[1];
      v10 = a1;
      if (!v9)
      {
LABEL_15:
        v10[1] = result;
        return a1;
      }
      v11 = a1;
      while (1)
      {
        v10 = v9;
        v12 = *(_QWORD *)(*v9 + 80);
        if (a3 < 0)
        {
          if (v7 > v12)
          {
LABEL_16:
            result[1] = v10;
            v11[1] = result;
            return a1;
          }
        }
        else if (v7 < v12)
        {
          goto LABEL_16;
        }
        v9 = (_QWORD *)v10[1];
        v11 = v10;
        if (!v9)
          goto LABEL_15;
      }
    }
  }
  return result;
}

uint64_t asl_file_list_match_next(uint64_t result, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t v5;
  uint64_t *v6;
  unsigned int v8;
  unsigned int v9;
  int matched;
  __asl_object_s *v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  asl_object_t obj;

  if (!result)
    return result;
  if (!a3)
    return 1;
  v5 = result;
  v6 = *(uint64_t **)result;
  if (!*(_QWORD *)result)
    return 0;
  v8 = 0;
  v9 = a4 - 1;
  while (1)
  {
    obj = 0;
    matched = asl_file_match_next(*v6, a2, &obj, &v21, *(_DWORD *)(v5 + 8));
    v11 = obj;
    if (!obj)
      goto LABEL_10;
    v12 = *a3;
    if (!*a3)
      break;
LABEL_9:
    asl_msg_list_append(v12, v11);
    asl_msg_release(obj);
    ++v8;
LABEL_10:
    v6 = *(uint64_t **)v5;
    if (matched || !*(_QWORD *)(*v6 + 80))
    {
      v13 = (uint64_t *)v6[1];
      free(*(void **)v5);
      *(_QWORD *)v5 = v13;
      v6 = v13;
      if (!v13)
        return 0;
    }
    v14 = (_QWORD *)v6[1];
    if (v14)
    {
      v15 = *(_DWORD *)(v5 + 8);
      v16 = *v6;
      v17 = *(_QWORD *)(*v6 + 80);
      v18 = *(_QWORD *)(*v14 + 80);
      if ((v15 & 0x80000000) == 0)
      {
        if (v17 <= v18)
          goto LABEL_18;
LABEL_17:
        *(_QWORD *)v5 = v14;
        v6[1] = 0;
        *(_QWORD *)v5 = asl_file_list_insert(v14, v16, v15);
        free(v6);
        v6 = *(uint64_t **)v5;
        goto LABEL_18;
      }
      if (v17 <= v18)
        goto LABEL_17;
    }
LABEL_18:
    result = 0;
    if (!v6 || v9 < v8)
      return result;
  }
  asl_msg_list_new();
  *a3 = v12;
  if (v12)
  {
    v11 = obj;
    goto LABEL_9;
  }
  v19 = *(uint64_t **)v5;
  if (*(_QWORD *)v5)
  {
    do
    {
      v20 = (uint64_t *)v19[1];
      free(v19);
      v19 = v20;
    }
    while (v20);
  }
  *(_QWORD *)v5 = 0;
  return 9;
}

void asl_file_list_match_end(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a1)
  {
    v2 = (_QWORD *)*a1;
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)v2[1];
        free(v2);
        v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t asl_file_list_match(uint64_t *a1, uint64_t a2, _QWORD *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7;
  uint64_t *v14;
  uint64_t *v15;
  __darwin_time_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  __asl_object_s *v20;
  uint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  __darwin_time_t tv_sec;
  uint64_t *v29;
  uint64_t *v30;
  timeval v32;
  timeval v33;
  asl_object_t obj;

  v7 = 0;
  if (a1 && a3)
  {
    v14 = a1;
    v15 = 0;
    obj = 0;
    do
    {
      if (!asl_file_match_start(*v14, a4, a7) && *(_QWORD *)(*v14 + 80))
        v15 = asl_file_list_insert(v15, *v14, a7);
      v14 = (uint64_t *)v14[1];
    }
    while (v14);
    if (!v15)
      return 0;
    v32.tv_sec = 0;
    *(_QWORD *)&v32.tv_usec = 0;
    if (a6)
    {
      if (gettimeofday(&v32, 0))
      {
        v32.tv_sec = 0;
        *(_QWORD *)&v32.tv_usec = 0;
      }
      else
      {
        v16 = v32.tv_sec + a6 / 0xF4240uLL;
        v32.tv_sec = v16;
        v17 = v32.tv_usec + a6 % 0xF4240;
        v32.tv_usec = v17;
        if (v17 > 0xF4240)
        {
          v32.tv_usec = v17 - 1000000;
          v32.tv_sec = v16 + 1;
        }
      }
    }
    v7 = 0;
    v18 = 0;
    v33.tv_sec = 0;
    *(_QWORD *)&v33.tv_usec = 0;
    v19 = a5 - 1;
    do
    {
      if (v19 < v18)
        goto LABEL_40;
      obj = 0;
      asl_file_match_next(*v15, a2, &obj, a3, a7);
      v20 = obj;
      if (obj)
      {
        if (!v7)
        {
          asl_msg_list_new();
          v7 = v21;
          if (!v21)
          {
            do
            {
              v29 = (uint64_t *)v15[1];
              free(v15);
              v15 = v29;
            }
            while (v29);
            return v7;
          }
          v20 = obj;
        }
        asl_msg_list_append(v7, v20);
        asl_msg_release(obj);
        ++v18;
      }
      if (*(_QWORD *)(*v15 + 80) || (v22 = (uint64_t *)v15[1], free(v15), (v15 = v22) != 0))
      {
        v23 = (_QWORD *)v15[1];
        if (v23)
        {
          v24 = *v15;
          v25 = *(_QWORD *)(*v15 + 80);
          v26 = *(_QWORD *)(*v23 + 80);
          if (a7 < 0)
          {
            if (v25 > v26)
              goto LABEL_28;
LABEL_27:
            v15[1] = 0;
            v27 = asl_file_list_insert(v23, v24, a7);
            free(v15);
            v15 = v27;
            goto LABEL_28;
          }
          if (v25 > v26)
            goto LABEL_27;
        }
      }
LABEL_28:
      tv_sec = v32.tv_sec;
      if (v32.tv_sec
        && !gettimeofday(&v33, 0)
        && (v33.tv_sec > tv_sec || v33.tv_sec == tv_sec && v33.tv_usec > v32.tv_usec))
      {
        if (!v15)
          return v7;
        do
        {
LABEL_40:
          v30 = (uint64_t *)v15[1];
          free(v15);
          v15 = v30;
        }
        while (v30);
        return v7;
      }
    }
    while (v15);
  }
  return v7;
}

uint64_t _jump_count_0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 8) & 1) != 0
      && (v2 = *(_QWORD *)(result + 72),
          v3 = *(_QWORD *)(result + 80),
          !asl_file_read_set_position_last(result, 1)))
    {
      *(_QWORD *)(v1 + 72) = v2;
      *(_QWORD *)(v1 + 80) = v3;
      return *(unsigned int *)(v1 + 20);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

int *_jump_next_0(int *result)
{
  int *v1;

  v1 = 0;
  if (result)
  {
    if (result[3] == 1)
    {
      return 0;
    }
    else if (asl_file_fetch_pos((uint64_t)result, *((_QWORD *)result + 9), 1, &v1))
    {
      return 0;
    }
    else
    {
      return v1;
    }
  }
  return result;
}

int *_jump_prev_0(int *result)
{
  int *v1;

  v1 = 0;
  if (result)
  {
    if (result[3] == 1)
    {
      return 0;
    }
    else if (asl_file_fetch_pos((uint64_t)result, *((_QWORD *)result + 9), -1, &v1))
    {
      return 0;
    }
    else
    {
      return v1;
    }
  }
  return result;
}

int *_jump_get_object_at_index_0(uint64_t a1, unint64_t a2)
{
  int *v3;

  v3 = 0;
  if (asl_file_fetch(a1, a2, &v3))
    return 0;
  else
    return v3;
}

uint64_t _jump_set_iteration_index_0(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  if (result && (*(_BYTE *)(result + 8) & 1) != 0)
  {
    if (a2 == -1)
    {
      return asl_file_read_set_position_last(result, 0);
    }
    else if (a2)
    {
      return asl_file_fetch(result, a2, 0);
    }
    else
    {
      *(_QWORD *)(result + 80) = 0;
      v2 = *(_QWORD *)(result + 40);
      *(_QWORD *)(result + 72) = v2;
      if (v2)
        return asl_file_read_uint64(result, v2 + 14, (unint64_t *)(result + 80));
    }
  }
  return result;
}

uint64_t _jump_search_1(uint64_t a1, asl_object_t obj)
{
  uint32_t type;
  uint64_t v5;
  asl_object_t v6;
  uint64_t v7;
  uint64_t v9;
  __asl_object_s *v10;
  uint64_t v11;

  type = asl_get_type(obj);
  v11 = 0;
  if (!obj)
  {
    v5 = a1;
    v6 = 0;
    return asl_file_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type == 2)
  {
    v5 = a1;
    v6 = obj;
    return asl_file_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type > 1)
    return 0;
  asl_msg_list_new();
  v10 = (__asl_object_s *)v9;
  asl_msg_list_append(v9, obj);
  v7 = asl_file_match(a1, (uint64_t)v10, &v11, 0, 0, 0, 1);
  asl_msg_list_release(v10);
  return v7;
}

uint64_t _jump_match_1(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t a4, uint64_t a5, unsigned int a6, int a7)
{
  uint64_t result;
  uint64_t v9;

  v9 = 0;
  result = asl_file_match(a1, a2, &v9, a4, a5, a6, a7);
  *a3 = v9;
  return result;
}

double file_string_dispose(uint64_t a1, _OWORD *a2)
{
  double result;

  if (*(_QWORD *)(a1 + 32))
  {
    free(a2);
  }
  else
  {
    *(_QWORD *)(a1 + 32) = a2;
    *((_QWORD *)a2 + 16) = 0;
    result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t asl_file_fetch_object(uint64_t a1, int a2, unint64_t a3, const void **a4, unsigned int *a5)
{
  uint64_t v6;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _DWORD *v22;
  char *v23;
  _QWORD *v25;
  int v26;
  _DWORD *v27;
  unsigned __int16 __ptr;
  unint64_t v29;
  char __s1[8];
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C874D8];
  if (!*(_QWORD *)(a1 + 104))
    return 2;
  v6 = 1;
  if (a3 && a4 && a5)
  {
    *a4 = 0;
    *a5 = 0;
    v11 = asl_core_htonq(a3);
    v29 = v11;
    if ((v11 & 0x80) == 0)
    {
      if (a2 == 1)
      {
        v12 = *(_QWORD *)(a1 + 24);
        if (v12)
        {
          if (*(_QWORD *)v12 == a3)
          {
            v13 = 0;
LABEL_16:
            v16 = strdup((const char *)(v12 + 24));
            *a4 = v16;
            if (v16)
            {
              *a5 = *(_DWORD *)(v12 + 8);
              if (v13)
              {
                v6 = 0;
                v17 = *(_QWORD *)(a1 + 24);
                *(_QWORD *)(v13 + 16) = *(_QWORD *)(v12 + 16);
                *(_QWORD *)(v12 + 16) = v17;
                *(_QWORD *)(a1 + 24) = v12;
                return v6;
              }
              return 0;
            }
            return 9;
          }
          v15 = *(_QWORD *)(a1 + 24);
          while (1)
          {
            v12 = *(_QWORD *)(v15 + 16);
            if (!v12)
              break;
            v13 = v15;
            v15 = *(_QWORD *)(v15 + 16);
            if (*(_QWORD *)v12 == a3)
              goto LABEL_16;
          }
        }
      }
      if (a3 + 6 > *(_QWORD *)(a1 + 96))
        return 7;
      if (fseeko(*(FILE **)(a1 + 104), a3, 0))
        return 7;
      __ptr = 0;
      if (fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 104)) != 1)
        return 7;
      if (a2 == bswap32(__ptr) >> 16)
      {
        *(_DWORD *)__s1 = 0;
        if (fread(__s1, 4uLL, 1uLL, *(FILE **)(a1 + 104)) == 1)
        {
          if (*(_DWORD *)__s1)
          {
            v18 = bswap32(*(unsigned int *)__s1);
            if (a3 + 6 + v18 <= *(_QWORD *)(a1 + 96))
            {
              v19 = malloc_type_calloc(1uLL, v18, 0xB5C59029uLL);
              *a4 = v19;
              if (!v19)
                return 9;
              if (fread(v19, v18, 1uLL, *(FILE **)(a1 + 104)) == 1)
              {
                if (a2 != 1)
                {
                  v6 = 0;
                  *a5 = v18;
                  return v6;
                }
                v20 = (void *)*a4;
                v21 = (v18 - 1);
                if (!*((_BYTE *)*a4 + v21) && strlen((const char *)*a4) == v21)
                {
                  *a5 = v18;
                  if (v18 <= 0x6C)
                  {
                    v22 = *(_DWORD **)(a1 + 32);
                    if (v22)
                    {
                      *(_QWORD *)(a1 + 32) = 0;
                    }
                    else
                    {
                      v22 = malloc_type_calloc(1uLL, 0x88uLL, 0x10200408BEEBE60uLL);
                      if (!v22)
                        return 0;
                    }
                    *(_QWORD *)v22 = a3;
                    v22[2] = v18;
                    v25 = *(_QWORD **)(a1 + 24);
                    *((_QWORD *)v22 + 2) = v25;
                    memcpy(v22 + 6, *a4, v18);
                    *(_QWORD *)(a1 + 24) = v22;
                    v26 = *(_DWORD *)(a1 + 16);
                    if ((*(_BYTE *)(a1 + 8) & 4) != 0 || v26 != 128)
                    {
                      v6 = 0;
                      *(_DWORD *)(a1 + 16) = v26 + 1;
                      return v6;
                    }
                    do
                    {
                      v27 = v22;
                      v22 = v25;
                      v25 = (_QWORD *)v25[2];
                    }
                    while (v25);
                    *((_QWORD *)v27 + 2) = 0;
                    file_string_dispose(a1, v22);
                  }
                  return 0;
                }
              }
              else
              {
                v20 = (void *)*a4;
              }
              free(v20);
              *a4 = 0;
            }
          }
        }
        return 7;
      }
      return 2;
    }
    if (a2 != 1)
      return 2;
    v14 = v11 & 0xF;
    if (v14 > 7)
      return 2;
    v31 = 0;
    *(_QWORD *)__s1 = 0;
    v6 = 9;
    __memcpy_chk();
    v23 = strdup(__s1);
    *a4 = v23;
    if (v23)
    {
      v6 = 0;
      *a5 = v14;
    }
  }
  return v6;
}

unint64_t asl_file_fetch_helper_64(unint64_t **a1, int *a2, char *a3)
{
  unint64_t result;
  char __str[256];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  result = asl_core_ntohq(**a1);
  ++*a1;
  if (a2)
  {
    if (a3)
    {
      snprintf(__str, 0x100uLL, "%llu", result);
      return asl_msg_set_key_val(a2, a3, __str);
    }
  }
  return result;
}

unsigned int **asl_file_fetch_helper_32(unsigned int **result, int *a2, char *a3, int a4, int a5)
{
  unsigned int v5;
  unsigned int v8;
  char __str[256];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  v5 = *(*result)++;
  if (a2)
  {
    if (a3)
    {
      v8 = bswap32(v5);
      if (!a4 || v8 != a5)
      {
        snprintf(__str, 0x100uLL, "%u", v8);
        return (unsigned int **)asl_msg_set_key_val(a2, a3, __str);
      }
    }
  }
  return result;
}

_QWORD *asl_file_fetch_helper_16(_QWORD *result, int *a2, char *a3)
{
  unsigned int v3;
  char __str[256];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  v3 = *(unsigned __int16 *)*result;
  *result += 2;
  if (a2)
  {
    if (a3)
    {
      snprintf(__str, 0x100uLL, "%hu", __rev16(v3));
      return (_QWORD *)asl_msg_set_key_val(a2, a3, __str);
    }
  }
  return result;
}

void asl_file_fetch_helper_str(uint64_t a1, unint64_t **a2, int *a3, char *a4, _DWORD *a5)
{
  unint64_t v10;
  unsigned int v11;
  void *v12;

  v10 = asl_core_ntohq(**a2);
  ++*a2;
  v12 = 0;
  v11 = 0;
  if (v10)
    LODWORD(v10) = asl_file_fetch_object(a1, 1, v10, (const void **)&v12, &v11);
  if (a5)
    *a5 = v10;
  if (!(_DWORD)v10)
  {
    if (v12)
    {
      asl_msg_set_key_val(a3, a4, (const char *)v12);
      free(v12);
    }
  }
}

uint64_t asl_legacy1_open(const char *a1, void ***a2)
{
  off_t st_size;
  void **v5;
  void **v6;
  FILE *v7;
  uint64_t result;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  int v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  stat v18;
  _OWORD __ptr[5];
  char v20[5];
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  memset(&v18, 0, sizeof(v18));
  if (stat(a1, &v18) < 0)
    return 9999;
  st_size = v18.st_size;
  v5 = (void **)malloc_type_calloc(1uLL, 0x18uLL, 0x102004093CA8EA1uLL);
  if (!v5)
    return 9;
  v6 = v5;
  v7 = fopen(a1, "r");
  v6[2] = v7;
  if (!v7)
  {
LABEL_10:
    free(v6);
    return 2;
  }
  memset(__ptr, 0, sizeof(__ptr));
  if (fread(__ptr, 0x50uLL, 1uLL, v7) == 1)
  {
    if (LODWORD(__ptr[0]) != 541872961 || WORD2(__ptr[0]) != 16964)
    {
      fclose((FILE *)v6[2]);
      goto LABEL_10;
    }
    if (!fseek((FILE *)v6[2], 80, 0))
    {
      v10 = st_size / 80;
      v11 = malloc_type_calloc(v10, 0x18uLL, 0x1000040FE83055AuLL);
      *v6 = v11;
      if (v11)
      {
        if (v10 >= 2)
        {
          v12 = 0;
          v13 = 1;
          while (1)
          {
            if (fread(v20, 0x50uLL, 1uLL, (FILE *)v6[2]) != 1)
              goto LABEL_15;
            if (!v20[0])
              break;
            if (v20[0] == 2)
            {
              v15 = 0;
              v14 = bswap64(v21);
              goto LABEL_27;
            }
            if (v20[0] == 4)
            {
              v14 = bswap64(v21);
              v15 = bswap32(v22);
LABEL_27:
              v16 = (uint64_t)*v6 + 24 * v12;
              *(_BYTE *)v16 = v20[0];
              *(_DWORD *)(v16 + 4) = v13;
              *(_QWORD *)(v16 + 8) = v14;
              *(_DWORD *)(v16 + 16) = v15;
              ++v12;
            }
            if ((_DWORD)v10 == ++v13)
            {
              v11 = *v6;
              goto LABEL_31;
            }
          }
          v14 = 0;
          v15 = 0;
          goto LABEL_27;
        }
        v12 = 0;
LABEL_31:
        v17 = reallocf(v11, 24 * v12);
        *v6 = v17;
        if (v17)
        {
          *((_DWORD *)v6 + 2) = v12;
          qsort(v17, v12, 0x18uLL, (int (__cdecl *)(const void *, const void *))slot_comp);
        }
      }
    }
LABEL_15:
    result = 0;
    *a2 = v6;
  }
  else
  {
    fclose((FILE *)v6[2]);
    free(v6);
    return 7;
  }
  return result;
}

uint64_t asl_legacy1_close(void **a1)
{
  void *v2;
  FILE *v3;

  if (!a1)
    return 2;
  v2 = *a1;
  if (v2)
    free(v2);
  v3 = (FILE *)a1[2];
  if (v3)
    fclose(v3);
  free(a1);
  return 0;
}

uint64_t asl_legacy1_fetch(uint64_t *a1, unint64_t a2, int **a3)
{
  uint64_t result;
  unsigned int v6;

  if (!a1)
    return 2;
  result = 1;
  if (a2 != -1 && a3)
  {
    v6 = slotlist_find(a1, a2, 0);
    if (v6 == -1)
    {
      return 4;
    }
    else
    {
      result = msg_fetch((uint64_t)a1, *(_DWORD *)(*a1 + 24 * v6 + 4), a3);
      if (!(_DWORD)result)
      {
        if (*a3)
          return 0;
        else
          return 9999;
      }
    }
  }
  return result;
}

uint64_t slotlist_find(uint64_t *a1, unint64_t a2, int a3)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  result = 0xFFFFFFFFLL;
  if (a2)
  {
    v5 = *((_DWORD *)a1 + 2);
    if (v5)
    {
      v6 = (v5 - 1);
      v7 = *a1;
      if (v6 < 2)
      {
        v8 = 0;
LABEL_15:
        result = v6;
        if (*(_QWORD *)(v7 + 24 * v6 + 8) != a2)
        {
          if (*(_QWORD *)(v7 + 24 * v8 + 8) == a2)
          {
            return v8;
          }
          else if (a3 >= 0)
          {
            return 0xFFFFFFFFLL;
          }
          else
          {
            return v8;
          }
        }
      }
      else
      {
        LODWORD(v8) = 0;
        result = v6 >> 1;
        while (1)
        {
          v9 = *(_QWORD *)(v7 + 24 * result + 8);
          if (v9 == a2)
            break;
          if (v9 <= a2)
            v6 = v6;
          else
            v6 = result;
          if (v9 <= a2)
            v8 = result;
          else
            v8 = v8;
          result = v8 + ((v6 - v8) >> 1);
          if ((v6 - v8) <= 1)
            goto LABEL_15;
        }
      }
    }
  }
  return result;
}

uint64_t msg_fetch(uint64_t a1, int a2, int **a3)
{
  int *v5;
  int *v6;
  unint64_t *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t *v14;
  void *v15;
  BOOL v16;
  unsigned int v17;
  uint64_t result;
  void *v19;
  void *v20;
  unsigned int *v21;
  int sid;
  char __ptr;
  unsigned int v24;
  unsigned int v25;
  _BYTE v26[7];
  char __str[256];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C874D8];
  if (!a3)
    return 1;
  *a3 = 0;
  if ((fseek(*(FILE **)(a1 + 16), (80 * a2), 0) & 0x80000000) == 0)
  {
    sid = 0;
    v19 = 0;
    v20 = 0;
    if (fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
    {
      v5 = (int *)asl_msg_new(0);
      if (!v5)
        return 9;
      v6 = v5;
      v21 = &v25;
      asl_legacy1_fetch_helper_64((unint64_t **)&v21, v5, "ASLMessageID");
      asl_legacy1_fetch_helper_32(&v21, v6, "ReadUID", 1, -1);
      asl_legacy1_fetch_helper_32(&v21, v6, "ReadGID", 1, -1);
      asl_legacy1_fetch_helper_64((unint64_t **)&v21, v6, "Time");
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Host", &sid);
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Sender", &sid);
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Facility", &sid);
      v7 = (unint64_t *)v21;
      snprintf(__str, 0x100uLL, "%u", bswap32(*v21));
      asl_msg_set_key_val(v6, "Level", __str);
      snprintf(__str, 0x100uLL, "%u", bswap32(*((_DWORD *)v7 + 1)));
      asl_msg_set_key_val(v6, "PID", __str);
      snprintf(__str, 0x100uLL, "%u", bswap32(*((_DWORD *)v7 + 2)));
      asl_msg_set_key_val(v6, "UID", __str);
      v8 = bswap32(*((_DWORD *)v7 + 3));
      v21 = (unsigned int *)(v7 + 2);
      snprintf(__str, 0x100uLL, "%u", v8);
      asl_msg_set_key_val(v6, "GID", __str);
      asl_legacy1_fetch_helper_str(a1, (unint64_t **)&v21, v6, "Message", &sid);
      if (!v24)
      {
LABEL_28:
        result = 0;
        *a3 = v6;
        return result;
      }
      v9 = 0;
      v10 = 0;
      v11 = bswap32(v24);
      while ((fseek(*(FILE **)(a1 + 16), 80 * v11, 0) & 0x80000000) == 0
           && fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
      {
        v12 = bswap32(v25);
        if (!v9)
          v9 = v12;
        if (v10 < v9)
        {
          v13 = 0;
          v14 = (unint64_t *)v26;
          while (1)
          {
            v20 = 0;
            sid = string_fetch_sid(a1, bswap64(*(v14 - 1)), &v20);
            v19 = 0;
            if (!sid)
            {
              sid = string_fetch_sid(a1, bswap64(*v14), &v19);
              v15 = v20;
              if (sid)
                v16 = 1;
              else
                v16 = v20 == 0;
              if (v16)
                goto LABEL_20;
              asl_msg_set_key_val(v6, (char *)v20, (const char *)v19);
            }
            v15 = v20;
LABEL_20:
            if (v15)
              free(v15);
            if (v19)
              free(v19);
            v17 = v13 + 1;
            if (v13 <= 2)
            {
              v14 += 2;
              ++v13;
              if (v17 + v10 < v9)
                continue;
            }
            v10 += v17;
            break;
          }
        }
        v11 = bswap32(v24);
        if (!v24)
          goto LABEL_28;
      }
      asl_msg_release((asl_object_t)v6);
    }
  }
  return 7;
}

uint64_t asl_legacy1_match(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4, unint64_t a5, uint64_t a6, int a7)
{
  uint64_t v8;
  int v12;
  uint64_t v13;
  uint64_t search_slot;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unsigned int v22;
  asl_object_t obj;

  obj = 0;
  if (!a1)
    return 2;
  v8 = 1;
  if (a3 && a4)
  {
    *a3 = 0;
    if (a7 < 0)
      v12 = -1;
    else
      v12 = 1;
    if (a5 == -1 && a7 < 0)
      v13 = *(unsigned int *)(a1 + 8);
    else
      v13 = slotlist_find((uint64_t *)a1, a5, v12);
    search_slot = next_search_slot(a1, v13, v12);
    if ((_DWORD)search_slot == -1)
      return 0;
    v15 = search_slot;
    if (search_slot < *(_DWORD *)(a1 + 8))
    {
      if (a2)
      {
        v22 = *(_DWORD *)(a2 + 8);
        v16 = v22 == 0;
      }
      else
      {
        v22 = 0;
        v16 = 1;
      }
      asl_msg_list_new();
      *a3 = v17;
      if (!v17)
        return 9;
      if ((_DWORD)v15 != -1)
      {
        v8 = 0;
        while (1)
        {
          if (v15 >= *(_DWORD *)(a1 + 8))
            return v8;
          v18 = *(_QWORD *)a1 + 24 * v15;
          v19 = *(_DWORD *)(v18 + 4);
          *a4 = *(_QWORD *)(v18 + 8);
          v8 = msg_fetch(a1, v19, (int **)&obj);
          if (!v16)
          {
            if (!v22)
              goto LABEL_28;
            v20 = 0;
            while (asl_msg_cmp(*(_DWORD **)(*(_QWORD *)(a2 + 16) + v20), obj) != 1)
            {
              v20 += 8;
              if (8 * v22 == v20)
                goto LABEL_28;
            }
          }
          asl_msg_list_append(*a3, obj);
LABEL_28:
          asl_msg_release(obj);
          v15 = next_search_slot(a1, v15, v12);
          if ((_DWORD)v15 == -1)
            return v8;
        }
      }
      return 0;
    }
    return 9999;
  }
  return v8;
}

uint64_t slot_comp(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  _BOOL4 v8;

  if (a1)
  {
    if (!a2)
      return 1;
    v2 = *(_QWORD *)(a1 + 8);
    v3 = *(_QWORD *)(a2 + 8);
    if (v2 < v3)
      return 0xFFFFFFFFLL;
    if (v2 == v3)
    {
      v5 = *(_DWORD *)(a1 + 4);
      v6 = *(_DWORD *)(a2 + 4);
      v7 = v5 >= v6;
      v8 = v5 != v6;
      if (v7)
        return v8;
      else
        return 0xFFFFFFFFLL;
    }
    else
    {
      return 1;
    }
  }
  else if (a2)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

unint64_t **asl_legacy1_fetch_helper_64(unint64_t **result, int *a2, char *a3)
{
  unint64_t v3;
  char __str[256];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  v3 = *(*result)++;
  if (a3)
  {
    snprintf(__str, 0x100uLL, "%llu", bswap64(v3));
    return (unint64_t **)asl_msg_set_key_val(a2, a3, __str);
  }
  return result;
}

unsigned int **asl_legacy1_fetch_helper_32(unsigned int **result, int *a2, char *a3, int a4, int a5)
{
  unsigned int v5;
  unsigned int v8;
  char __str[256];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  v5 = *(*result)++;
  if (a3)
  {
    v8 = bswap32(v5);
    if (!a4 || v8 != a5)
    {
      snprintf(__str, 0x100uLL, "%u", v8);
      return (unsigned int **)asl_msg_set_key_val(a2, a3, __str);
    }
  }
  return result;
}

void asl_legacy1_fetch_helper_str(uint64_t a1, unint64_t **a2, int *a3, char *a4, _DWORD *a5)
{
  unint64_t v8;
  int sid;
  void *v10;

  v8 = *(*a2)++;
  v10 = 0;
  if (v8)
  {
    sid = string_fetch_sid(a1, bswap64(v8), &v10);
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  sid = 0;
  if (a5)
LABEL_3:
    *a5 = sid;
LABEL_4:
  if (!sid)
  {
    if (v10)
    {
      asl_msg_set_key_val(a3, a4, (const char *)v10);
      free(v10);
    }
  }
}

uint64_t string_fetch_sid(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  unsigned int v6;
  int v7;
  size_t v8;
  unsigned int v9;
  char *v10;
  char *v11;
  size_t v12;
  BOOL v13;
  unsigned int v14;
  _BOOL4 v15;
  unsigned int v16;
  char *v17;
  unsigned int v18;
  size_t v19;
  uint64_t result;
  size_t v21;
  void *v22;
  int v23;
  __int16 v24;
  char v25;
  char __ptr;
  unsigned int v27;
  _BYTE v28[3];
  unsigned int v29;
  _BYTE v30[63];

  *(_QWORD *)&v30[55] = *MEMORY[0x1E0C874D8];
  if (!a3)
    return 1;
  *a3 = 0;
  if (a2 == -1)
    return 0;
  v4 = bswap64(a2);
  v25 = HIBYTE(v4);
  v24 = HIDWORD(v4) >> 8;
  v23 = v4 >> 8;
  if ((a2 & 0x8000000000000000) != 0)
  {
    v21 = HIBYTE(a2) & 0xF;
    v22 = malloc_type_calloc(1uLL, v21, 0xDF7C2B50uLL);
    *a3 = v22;
    if (!v22)
      return 9;
    memcpy(v22, &v23, v21);
    return 0;
  }
  v6 = slotlist_find((uint64_t *)a1, a2, 0);
  if (v6 == -1)
    return 6;
  v7 = *(_DWORD *)(*(_QWORD *)a1 + 24 * v6 + 4);
  *a3 = 0;
  if (fseek(*(FILE **)(a1 + 16), (80 * v7), 0) < 0
    || fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) != 1)
  {
    return 7;
  }
  if (__ptr != 4)
    return 3;
  if (!v29)
    return 0;
  v8 = bswap32(v29);
  v9 = v27;
  v10 = (char *)malloc_type_calloc(1uLL, v8, 0xA8A1A17EuLL);
  if (!v10)
    return 9;
  v11 = v10;
  if (v8 >= 0x37)
    v12 = 55;
  else
    v12 = v8;
  memcpy(v10, v30, v12);
  v13 = v9 != 0;
  v14 = v8 - v12;
  v15 = v8 != v12;
  if ((_DWORD)v8 == (_DWORD)v12 || !v9)
  {
LABEL_23:
    if (!v13 && !v15)
    {
      result = 0;
      *a3 = v11;
      return result;
    }
  }
  else
  {
    v16 = bswap32(v9);
    v17 = &v11[v12];
    while ((fseek(*(FILE **)(a1 + 16), 80 * v16, 0) & 0x80000000) == 0
         && fread(&__ptr, 0x50uLL, 1uLL, *(FILE **)(a1 + 16)) == 1)
    {
      v18 = v27;
      if (v14 >= 0x4B)
        v19 = 75;
      else
        v19 = v14;
      memcpy(v17, v28, v19);
      v14 -= v19;
      v13 = v18 != 0;
      v15 = v14 != 0;
      if (v18)
      {
        v16 = bswap32(v18);
        v17 += v19;
        if (v14)
          continue;
      }
      goto LABEL_23;
    }
  }
  free(v11);
  return 7;
}

uint64_t next_search_slot(uint64_t a1, uint64_t a2, int a3)
{
  _BYTE *v4;
  uint64_t i;
  int v6;

  if ((a3 & 0x80000000) == 0)
  {
    while (1)
    {
      a2 = (a2 + 1);
      if (a2 >= *(_DWORD *)(a1 + 8))
        break;
      if (*(_BYTE *)(*(_QWORD *)a1 + 24 * a2) == 2)
        return a2;
    }
    return 0xFFFFFFFFLL;
  }
  if (!(_DWORD)a2 || *(_DWORD *)(a1 + 8) < a2)
    return 0xFFFFFFFFLL;
  v4 = *(_BYTE **)a1;
  for (i = 24 * a2 - 24; i; i -= 24)
  {
    v6 = v4[i];
    a2 = (a2 - 1);
    if (v6 == 2)
      return a2;
  }
  if (*v4 == 2)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

asl_object_t asl_msg_retain(asl_object_t obj)
{
  if (obj)
    asl_retain(obj);
  return obj;
}

unsigned int *asl_msg_type(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t asl_msg_count(uint64_t a1)
{
  uint64_t i;

  for (i = 0; a1; a1 = *(_QWORD *)(a1 + 24))
    i = (*(_DWORD *)(a1 + 8) + i);
  return i;
}

uint64_t _asl_msg_dump(uint64_t result, const char *a2, _DWORD *a3)
{
  _DWORD *v3;
  FILE *v5;
  unsigned int v6;
  uint64_t v7;
  char i;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;

  if (result)
  {
    v3 = a3;
    v5 = (FILE *)result;
    if (a3)
    {
      if (*a3 == 1)
        v6 = 10;
      else
        v6 = 0;
      if (*a3)
        v7 = v6;
      else
        v7 = 15;
      for (i = 1; ; i = 0)
      {
        if ((i & 1) != 0)
        {
          fprintf(v5, "asl_msg %s: %p\n", a2, v3);
          fprintf(v5, "    refcount: %u\n", v3[1]);
          fprintf(v5, "    asl_type: %u\n");
        }
        else
        {
          fprintf(v5, "  page: %p\n");
        }
        fprintf(v5, "    count: %u\n", v3[2]);
        fprintf(v5, "    data_size: %u\n", v3[3]);
        fprintf(v5, "    mem_size: %llu\n", *((_QWORD *)v3 + 2));
        result = fprintf(v5, "    next: %p\n", *((const void **)v3 + 3));
        if ((_DWORD)v7)
          break;
LABEL_33:
        v3 = (_DWORD *)*((_QWORD *)v3 + 3);
        if (!v3)
          return result;
      }
      v9 = 0;
      while (1)
      {
        fprintf(v5, "    slot[%d]: ", v9);
        if (*v3 && (*v3 != 1 || v9 > 9))
          v10 = 0;
        else
          v10 = *((unsigned __int16 *)v3 + v9 + 16);
        _asl_msg_dump_kv(v5, (uint64_t)v3, v10);
        fputc(32, v5);
        if (!*v3)
          break;
        if (*v3 == 1 && v9 <= 9)
        {
          v11 = 10;
LABEL_26:
          v12 = *((unsigned __int16 *)v3 + v9 + v11 + 16);
          goto LABEL_27;
        }
        v12 = 0;
LABEL_27:
        result = _asl_msg_dump_kv(v5, (uint64_t)v3, v12);
        if (*v3 == 1)
        {
          if (v9 > 9)
            v13 = 0;
          else
            v13 = *((unsigned __int16 *)v3 + v9 + 36);
          result = fprintf(v5, " 0x%04x\n", v13);
        }
        if (v7 == ++v9)
          goto LABEL_33;
      }
      v11 = 15;
      goto LABEL_26;
    }
    return fprintf((FILE *)result, "asl_msg %s: NULL\n", a2);
  }
  return result;
}

size_t _asl_msg_dump_kv(FILE *__stream, uint64_t a2, unsigned int a3)
{
  const char *v4;
  size_t v5;

  if (a3 == 0xFFFF)
  {
    v4 = "-free-";
    v5 = 6;
    return fwrite(v4, v5, 1uLL, __stream);
  }
  if ((a3 & 0xC000) == 0x4000)
    return fprintf(__stream, "(extern: %s)", *(const char **)(a2 + (a3 & 0x3FFF) + 92));
  if ((a3 & 0xC000) == 0x8000)
  {
    switch(a3)
    {
      case 0x8001u:
        v4 = "(dict: Time)";
        goto LABEL_15;
      case 0x8002u:
        v4 = "(dict: Nano)";
        goto LABEL_15;
      case 0x8003u:
        v4 = "(dict: Host)";
LABEL_15:
        v5 = 12;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x8004u:
        v4 = "(dict: Sender)";
        goto LABEL_30;
      case 0x8005u:
        v4 = "(dict: Facility)";
        v5 = 16;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x8006u:
      case 0x800Eu:
        v4 = "(dict: PID)";
        goto LABEL_20;
      case 0x8007u:
        v4 = "(dict: UID)";
        goto LABEL_20;
      case 0x8008u:
        v4 = "(dict: GID)";
LABEL_20:
        v5 = 11;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x8009u:
        v4 = "(dict: Level)";
        v5 = 13;
        return fwrite(v4, v5, 1uLL, __stream);
      case 0x800Au:
        v4 = "(dict: Message)";
        goto LABEL_27;
      case 0x800Bu:
        v4 = "(dict: ReadUID)";
        goto LABEL_27;
      case 0x800Cu:
        v4 = "(dict: ReadGID)";
        goto LABEL_27;
      case 0x800Du:
        v4 = "(dict: Session)";
        goto LABEL_27;
      case 0x800Fu:
        v4 = "(dict: RefProc)";
LABEL_27:
        v5 = 15;
        break;
      case 0x8010u:
        v4 = "(dict: ASLMessageID)";
        v5 = 20;
        break;
      case 0x8011u:
        v4 = "(dict: Expire)";
LABEL_30:
        v5 = 14;
        break;
      case 0x8012u:
        v4 = "(dict: ASLOption)";
LABEL_33:
        v5 = 17;
        break;
      default:
        switch(a3)
        {
          case 0x8101u:
            v4 = "(dict: com.apple.message.domain)";
            goto LABEL_47;
          case 0x8102u:
            v4 = "(dict: com.apple.message.domain_scope)";
            v5 = 38;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8103u:
            v4 = "(dict: com.apple.message.result)";
            goto LABEL_47;
          case 0x8104u:
            v4 = "(dict: com.apple.message.signature)";
            v5 = 35;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8105u:
            v4 = "(dict: com.apple.message.signature2)";
            goto LABEL_39;
          case 0x8106u:
            v4 = "(dict: com.apple.message.signature3)";
LABEL_39:
            v5 = 36;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8107u:
            v4 = "(dict: com.apple.message.success)";
            v5 = 33;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8108u:
            v4 = "(dict: com.apple.message.uuid)";
            v5 = 30;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x8109u:
            v4 = "(dict: com.apple.message.value)";
            v5 = 31;
            return fwrite(v4, v5, 1uLL, __stream);
          case 0x810Au:
            v4 = "(dict: com.apple.message.value2)";
            goto LABEL_47;
          case 0x810Bu:
            v4 = "(dict: com.apple.message.value3)";
            goto LABEL_47;
          case 0x810Cu:
            v4 = "(dict: com.apple.message.value4)";
            goto LABEL_47;
          case 0x810Du:
            v4 = "(dict: com.apple.message.value5)";
LABEL_47:
            v5 = 32;
            break;
          default:
            v4 = "(dict: -unknown-)";
            goto LABEL_33;
        }
        break;
    }
    return fwrite(v4, v5, 1uLL, __stream);
  }
  return fputs((const char *)(a2 + a3 + 92), __stream);
}

char *asl_msg_key(int *a1, int a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;

  if (!a1)
    return 0;
  v2 = 0;
  if (*a1 == 1)
    LODWORD(v3) = 10;
  else
    LODWORD(v3) = 0;
  if (*a1)
    v3 = v3;
  else
    v3 = 15;
  while (!(_DWORD)v3)
  {
LABEL_17:
    a1 = (int *)*((_QWORD *)a1 + 3);
    if (!a1)
      return 0;
  }
  v4 = 0;
  v5 = *a1;
  while (1)
  {
    if ((!v5 || v5 == 1 && v4 <= 9) && *((__int16 *)a1 + v4 + 16) == -1)
      goto LABEL_16;
    if (v2 == a2)
      return _asl_msg_slot_key((char *)a1, v4);
    ++v2;
LABEL_16:
    if (v3 == ++v4)
      goto LABEL_17;
  }
}

void asl_msg_unset(_DWORD *a1, char *a2)
{
  int *v2;
  unsigned int v3;

  if (a1 && a2)
  {
    v3 = -1;
    v2 = 0;
    if (_asl_msg_index(a1, a2, &v3, &v2) != -1)
      _asl_msg_unset_page_slot(v2, v3);
  }
}

void _asl_msg_unset_page_slot(int *a1, unsigned int a2)
{
  int v4;
  unsigned int v5;
  int v6;
  int v7;
  __int16 v8;
  char *v9;
  char *v10;
  int v11;
  int v12;

  if (a1)
  {
    v4 = *a1;
    if (*a1 == 1)
      v5 = 10;
    else
      v5 = 0;
    if (!v4)
      v5 = 15;
    if (v5 > a2)
    {
      if (v4 == 1)
      {
        if (a2 > 9)
          goto LABEL_28;
      }
      else
      {
        if (v4)
        {
          v6 = 0;
LABEL_15:
          if (v4 == 1)
          {
            if (a2 <= 9)
            {
              v7 = 10;
              goto LABEL_21;
            }
          }
          else if (!v4 && a2 < 0xF)
          {
            v7 = 15;
LABEL_21:
            v8 = *((_WORD *)a1 + v7 + a2 + 16);
LABEL_23:
            if (v6 == 0xFFFF)
              return;
            if ((v6 & 0xC000) == 0x4000)
            {
              v9 = *(char **)((char *)a1 + (v6 & 0x3FFF) + 92);
              *((_QWORD *)a1 + 2) += ~strlen(v9);
              free(v9);
            }
            if ((v8 & 0xC000) == 0x4000)
            {
              v10 = *(char **)((char *)a1 + (v8 & 0x3FFF) + 92);
              *((_QWORD *)a1 + 2) += ~strlen(v10);
              free(v10);
            }
LABEL_28:
            v11 = *a1;
            if (*a1)
            {
              if (a2 > 9 || v11 != 1)
              {
LABEL_35:
                if (a2 <= 9 && v11 == 1)
                  *((_WORD *)a1 + a2 + 36) = 0;
                goto LABEL_38;
              }
              v12 = 10;
            }
            else
            {
              if (a2 >= 0xF)
              {
LABEL_38:
                --a1[2];
                return;
              }
              v12 = 15;
            }
            *((_WORD *)a1 + a2 + 16) = -1;
            *((_WORD *)a1 + v12 + a2 + 16) = -1;
            goto LABEL_35;
          }
          v8 = 0;
          goto LABEL_23;
        }
        if (a2 >= 0xF)
          goto LABEL_28;
      }
      v6 = *((unsigned __int16 *)a1 + a2 + 16);
      goto LABEL_15;
    }
  }
}

void asl_msg_unset_index(uint64_t a1, unsigned int a2)
{
  int *v2;
  unsigned int v3;

  v3 = -1;
  v2 = 0;
  if (a1)
  {
    if (!_asl_msg_resolve_index(a1, a2, &v2, &v3))
      _asl_msg_unset_page_slot(v2, v3);
  }
}

uint64_t _asl_msg_resolve_index(uint64_t a1, unsigned int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = 0xFFFFFFFFLL;
  if (a1)
  {
    v5 = 0;
    *a4 = -1;
    *a3 = 0;
    if (*(_DWORD *)a1 == 1)
      v6 = 10;
    else
      v6 = 0;
    if (*(_DWORD *)a1)
      v7 = v6;
    else
      v7 = 15;
    do
    {
      v8 = (*(_DWORD *)(a1 + 8) + v5);
      if (v8 >= a2)
      {
        *a3 = a1;
        if ((_DWORD)v7)
        {
          v9 = 0;
          v8 = v5;
          while (1)
          {
            if (*(__int16 *)(a1 + 32 + 2 * v9) != -1)
            {
              if ((_DWORD)v8 == a2)
              {
                v4 = 0;
                *a4 = v9;
                return v4;
              }
              v8 = (v8 + 1);
            }
            if (v7 == ++v9)
              goto LABEL_17;
          }
        }
        v8 = v5;
      }
LABEL_17:
      a1 = *(_QWORD *)(a1 + 24);
      v5 = v8;
    }
    while (a1);
    return 0xFFFFFFFFLL;
  }
  return v4;
}

int *asl_msg_copy(asl_object_t obj)
{
  return asl_msg_merge(0, obj);
}

uint64_t _asl_msg_test(_DWORD *a1, _DWORD *a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t result;
  __int16 v7;
  int v8;
  int v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *__s1;
  __int16 v15;

  v13 = 0;
  __s1 = 0;
  v15 = 0;
  v4 = asl_msg_fetch(a1, 0, &__s1, (int **)&v13, &v15);
  if (v4 == -1)
    return 1;
  v5 = v4;
  while (1)
  {
    v12 = 0;
    result = asl_msg_lookup(a2, __s1, (int **)&v12, 0);
    v7 = v15;
    v8 = v15 & 7;
    if (!v8)
      goto LABEL_13;
    if (v8 == 7)
    {
      if ((_DWORD)result)
        return 0;
      goto LABEL_14;
    }
    if (!(_DWORD)result)
    {
      v9 = strcmp(__s1, "Time");
      v10 = v12;
      v11 = v13;
      if (!v9
        && (v7 & 0x160) == 0
        && v13
        && v12
        && (asl_core_parse_time(v13, 0) & 0x8000000000000000) == 0
        && (asl_core_parse_time(v10, 0) & 0x8000000000000000) == 0)
      {
        __asm { BR              X9; loc_1DE3E9DC0 }
      }
      result = _asl_msg_test_expression(v7, v11, v10);
LABEL_13:
      if (!(_DWORD)result)
        return result;
      goto LABEL_14;
    }
    if (v8 != 6)
      return 0;
LABEL_14:
    v5 = asl_msg_fetch(a1, v5, &__s1, (int **)&v13, &v15);
    if (v5 == -1)
      return 1;
  }
}

uint64_t _asl_msg_test_expression(__int16 a1, char *a2, char *__s)
{
  int v3;
  uint64_t result;
  char *v5;
  char *v6;
  __int16 v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  unsigned int v16;
  int v18;
  unsigned int v19;

  v3 = a1 & 7;
  if (v3 == 7)
    return 1;
  v5 = __s;
  v6 = a2;
  v7 = a1;
  if ((a1 & 0x20) == 0)
  {
    if ((a1 & 0x40) == 0)
    {
      v8 = 0;
      return _asl_msg_basic_test(a1, a2, __s, v8);
    }
    if (__s)
    {
      v10 = strlen(__s);
      if (!v6)
        return v7 & 1;
    }
    else
    {
      v10 = 0;
      if (!a2)
        return v7 & 1;
    }
    v13 = strlen(v6);
    v8 = v13;
    if ((_DWORD)v13)
    {
      if (v10 >= v13)
      {
        __s = &v5[v10 - v13];
        a1 = v7;
        a2 = v6;
        return _asl_msg_basic_test(a1, a2, __s, v8);
      }
      return v3 == 6;
    }
    return v7 & 1;
  }
  if ((a1 & 0x40) == 0)
  {
    if (__s)
    {
      v9 = strlen(__s);
      if (!v6)
        return v7 & 1;
    }
    else
    {
      v9 = 0;
      if (!a2)
        return v7 & 1;
    }
    v12 = strlen(v6);
    v8 = v12;
    if ((_DWORD)v12)
    {
      if (v9 >= v12)
      {
        a1 = v7;
        a2 = v6;
        __s = v5;
        return _asl_msg_basic_test(a1, a2, __s, v8);
      }
      return v3 == 6;
    }
    return v7 & 1;
  }
  if (__s)
  {
    v11 = strlen(__s);
    if (!v6)
      return v7 & 1;
  }
  else
  {
    v11 = 0;
    if (!a2)
      return v7 & 1;
  }
  v14 = strlen(v6);
  v15 = v14;
  if (!(_DWORD)v14)
    return v7 & 1;
  v16 = v11 - v14;
  if (v11 < v14)
    return v3 == 6;
  result = 0;
  if (v3 != 2 && v3 != 4)
  {
    v18 = 0;
    v19 = 0;
    do
    {
      while (_asl_msg_basic_test(v7 & 0xFF0 | 1u, v6, &v5[v19], v15))
      {
        if ((v7 & 1) != 0)
          return 1;
        ++v18;
        if (++v19 > v16)
          return v18 == 0;
      }
      ++v19;
    }
    while (v19 <= v16);
    if ((v7 & 1) == 0)
      return v18 == 0;
    return 0;
  }
  return result;
}

uint64_t asl_msg_cmp(_DWORD *a1, _DWORD *a2)
{
  uint64_t result;
  _DWORD *v4;
  int v5;
  _DWORD *v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  _DWORD *v10;
  const char *v11;
  const char *v12;
  char *v13;
  int v14;

  result = 0;
  if (a1)
  {
    v4 = a2;
    if (a2)
    {
      if (*a1 == *a2)
      {
        v5 = 0;
        v6 = a1;
        do
        {
          v5 += v6[2];
          v6 = (_DWORD *)*((_QWORD *)v6 + 3);
        }
        while (v6);
        v7 = a2;
        do
        {
          LODWORD(v6) = v7[2] + (_DWORD)v6;
          v7 = (_DWORD *)*((_QWORD *)v7 + 3);
        }
        while (v7);
        if (v5 == (_DWORD)v6)
        {
          v14 = 0;
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v8 = asl_msg_fetch(a1, 0, &v13, (int **)&v12, (_WORD *)&v14 + 1);
          if (v8 == -1)
            return 1;
          v9 = v8;
          while (!asl_msg_lookup(v4, v13, (int **)&v11, &v14)
               && !strcmp(v12, v11)
               && (*a1 != 1 || HIWORD(v14) == (unsigned __int16)v14))
          {
            v9 = asl_msg_fetch(a1, v9, &v13, (int **)&v12, (_WORD *)&v14 + 1);
            if (v9 == -1)
              return 1;
          }
        }
        return 0;
      }
      else
      {
        if (*a1 == 1)
        {
          v10 = a1;
        }
        else
        {
          v10 = a2;
          a2 = a1;
        }
        return _asl_msg_test(v10, a2);
      }
    }
  }
  return result;
}

uint64_t asl_msg_cmp_list(uint64_t result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;

  if (result)
  {
    if (a2 && *(_DWORD *)(a2 + 8))
    {
      v3 = (_DWORD *)result;
      v4 = 0;
      while (!_asl_msg_test(*(_DWORD **)(*(_QWORD *)(a2 + 16) + 8 * v4), v3))
      {
        if (++v4 >= (unint64_t)*(unsigned int *)(a2 + 8))
          return 0;
      }
    }
    return 1;
  }
  return result;
}

_QWORD *asl_msg_to_string_raw(int a1, _DWORD *a2, const char *a3)
{
  int v5;
  _DWORD *v6;
  _QWORD *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  char *v11;
  char *v12;
  const char *v14;
  char *__s;
  char *__s1;

  if (!a2)
    return 0;
  v5 = 0;
  v6 = a2;
  do
  {
    v5 += v6[2];
    v6 = (_DWORD *)*((_QWORD *)v6 + 3);
  }
  while (v6);
  if (!v5)
    return 0;
  v7 = asl_string_new(a1);
  if (v7)
  {
    __s = 0;
    __s1 = 0;
    v14 = 0;
    asl_msg_lookup(a2, "TimeNanoSec", (int **)&v14, 0);
    v8 = asl_msg_fetch(a2, 0, &__s1, (int **)&__s, 0);
    if (v8 != -1)
    {
      v9 = v8;
      v10 = 0;
      do
      {
        if (__s1)
        {
          if (v10)
            asl_string_append_char_no_encoding(v7, 32);
          asl_string_append_char_no_encoding(v7, 91);
          asl_string_append_asl_key((uint64_t)v7, __s1);
          if (!strcmp(__s1, "Time"))
          {
            asl_string_append_char_no_encoding(v7, 32);
            if (__s && (v11 = _asl_time_string(a3, __s, v14)) != 0)
            {
              v12 = v11;
              asl_string_append_no_encoding(v7, v11);
              free(v12);
            }
            else
            {
              asl_string_append_char_no_encoding(v7, 48);
            }
          }
          else if (__s)
          {
            asl_string_append_char_no_encoding(v7, 32);
            asl_string_append((uint64_t)v7, __s);
          }
          asl_string_append_char_no_encoding(v7, 93);
          ++v10;
        }
        v9 = asl_msg_fetch(a2, v9, &__s1, (int **)&__s, 0);
      }
      while (v9 != -1);
    }
  }
  return v7;
}

_QWORD *asl_string_append_asl_msg(_QWORD *a1, _DWORD *a2)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned __int16 v8;
  char *v9;
  char *v10;

  if (a2)
  {
    if (*a2 == 1)
      asl_string_append((uint64_t)a1, "Q ");
    v9 = 0;
    v10 = 0;
    v8 = 0;
    v4 = asl_msg_fetch(a2, 0, &v10, (int **)&v9, &v8);
    if (v4 != -1)
    {
      v5 = v4;
      v6 = 0;
      do
      {
        if (v6)
          asl_string_append_char_no_encoding(a1, 32);
        asl_string_append_char_no_encoding(a1, 91);
        if (*a2 == 1)
        {
          asl_string_append_op(a1, v8);
          asl_string_append_char_no_encoding(a1, 32);
        }
        asl_string_append_asl_key((uint64_t)a1, v10);
        if (v9)
        {
          asl_string_append_char_no_encoding(a1, 32);
          asl_string_append((uint64_t)a1, v9);
        }
        asl_string_append_char_no_encoding(a1, 93);
        v5 = asl_msg_fetch(a2, v5, &v10, (int **)&v9, &v8);
        --v6;
      }
      while (v5 != -1);
    }
  }
  return a1;
}

char *asl_msg_to_string(_DWORD *a1, _DWORD *a2)
{
  char *result;
  char *v5;
  _QWORD *appended;

  result = (char *)asl_string_new(2);
  if (result)
  {
    v5 = result;
    appended = asl_string_append_asl_msg(result, a1);
    *a2 = asl_string_length((uint64_t)appended);
    return asl_string_release_return_bytes(v5);
  }
  return result;
}

__asl_object_s *asl_msg_from_string(uint64_t a1)
{
  const char *next_word;
  _QWORD *v2;
  int v3;
  _QWORD *v4;
  int v5;
  char *v6;
  __asl_object_s *v7;
  __int128 v8;
  int v9;
  _QWORD *v10;
  unsigned int i;
  int v12;
  int v13;
  int v14;
  char *v15;
  int v16;
  char *v17;
  int v18;
  char *v19;
  int *v20;
  char *v21;
  const char *v22;
  _QWORD *v23;
  uint64_t v25;
  int v26;

  if (!a1)
    return 0;
  v26 = 0;
  v25 = a1;
  next_word = (const char *)_asl_msg_get_next_word(&v25, &v26, 1);
  if (!next_word)
    return 0;
  v2 = next_word;
  v3 = strcmp(next_word, "Q");
  if (v3)
  {
    if (v26 == 4)
    {
      free(v2);
      v4 = _asl_msg_get_next_word(&v25, &v26, 1);
      if (!v4)
        return 0;
      v2 = v4;
    }
    v5 = 0;
  }
  else
  {
    free(v2);
    v5 = 1;
    v2 = _asl_msg_get_next_word(&v25, &v26, 1);
  }
  v6 = (char *)malloc_type_calloc(1uLL, 0x138uLL, 0x1020040D2F95E9BuLL);
  v7 = (__asl_object_s *)v6;
  if (!v6)
    return v7;
  *(_QWORD *)&v8 = -1;
  *((_QWORD *)&v8 + 1) = -1;
  *(_OWORD *)(v6 + 76) = v8;
  *((_OWORD *)v6 + 3) = v8;
  *((_OWORD *)v6 + 4) = v8;
  *((_OWORD *)v6 + 2) = v8;
  *((_QWORD *)v6 + 2) = 312;
  *(_DWORD *)v6 = v5;
  *((_DWORD *)v6 + 1) = 1;
  if (!v2)
    return v7;
  while (2)
  {
    if (v26 != 1)
      goto LABEL_67;
    free(v2);
    if (v3)
    {
      v9 = 0;
      goto LABEL_43;
    }
    v10 = _asl_msg_get_next_word(&v25, &v26, 1);
    if (!v10 || v26 != 3)
    {
      if (v10)
        goto LABEL_66;
      goto LABEL_67;
    }
    v9 = 0;
    for (i = 0; ; ++i)
    {
      v12 = *((unsigned __int8 *)v10 + i);
      if (v12 == 67)
      {
        v9 |= 0x10u;
        goto LABEL_22;
      }
      if (!*((_BYTE *)v10 + i))
        goto LABEL_42;
      if (v12 == 46)
        break;
LABEL_22:
      v13 = v9 | 0x100;
      if (v12 != 82)
        v13 = v9;
      if (v12 == 78)
        v13 |= 0x80u;
      if (v12 == 83)
        v13 |= 0x60u;
      if (v12 == 65)
        v13 |= 0x20u;
      if (v12 == 90)
        v13 |= 0x40u;
      if (v12 == 60)
        v13 |= 4u;
      if (v12 == 62)
        v13 |= 2u;
      v14 = v13 | (v12 == 61);
      if (v12 == 33)
        v14 |= 6u;
      if (v12 == 84)
        v9 = v14 | 7;
      else
        v9 = v14;
    }
    v9 = 0;
LABEL_42:
    free(v10);
LABEL_43:
    v10 = _asl_msg_get_next_word(&v25, &v26, 1);
    v15 = (char *)v10;
    v16 = v26;
    if (v26 == 4)
      v16 = 3;
    v26 = v16;
    if (!v10 || v16 != 3)
    {
      if (v10)
        goto LABEL_66;
      goto LABEL_67;
    }
    v17 = (char *)_asl_msg_get_next_word(&v25, &v26, 0);
    if (v26 == 4)
      v18 = 3;
    else
      v18 = v26;
    v26 = v18;
    if (v17)
    {
      v19 = v17;
      if (v18 == 3)
      {
        v20 = (int *)v7;
        v21 = v15;
        v22 = v19;
LABEL_55:
        asl_msg_set_key_val_op(v20, v21, v22, v9);
        free(v15);
        free(v19);
        if (v18 == 2)
          goto LABEL_59;
        v23 = _asl_msg_get_next_word(&v25, &v26, 1);
        if (v23)
        {
          if (v26 != 2)
            goto LABEL_67;
          free(v23);
LABEL_59:
          v2 = _asl_msg_get_next_word(&v25, &v26, 1);
          if (!v2)
            return v7;
          continue;
        }
      }
      else
      {
        if (v18 == 2)
        {
          v20 = (int *)v7;
          v21 = v15;
          v22 = 0;
          goto LABEL_55;
        }
        free(v15);
        v10 = v19;
LABEL_66:
        free(v10);
LABEL_67:
        asl_release(v7);
        return 0;
      }
    }
    else
    {
      asl_msg_set_key_val_op((int *)v7, v15, 0, v9);
      free(v15);
    }
    return v7;
  }
}

_QWORD *_asl_msg_get_next_word(_QWORD *result, _DWORD *a2, int a3)
{
  _BYTE *v3;
  unsigned int v5;
  __int16 v8;
  int v9;
  _BYTE *v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  char v22;
  char v23;

  *a2 = 0;
  if (!result)
    return result;
  v3 = (_BYTE *)*result;
  if (!*result || !*v3)
    return 0;
  if (*v3 == 32)
    *result = ++v3;
  if (a3)
  {
    while (1)
    {
      v5 = *v3;
      if (v5 != 32 && v5 != 9)
        break;
      *result = ++v3;
    }
  }
  else
  {
    v5 = *v3;
  }
  if (!v5 || v5 == 10)
    return 0;
  if (v5 == 91)
  {
    *a2 = 1;
    *result = v3 + 1;
    result = malloc_type_malloc(2uLL, 0x84EE176DuLL);
    if (!result)
      return result;
    v8 = 91;
LABEL_48:
    *(_WORD *)result = v8;
    return result;
  }
  if (a3 && v5 == 32)
  {
    v9 = 0;
    *result = v3;
    v10 = v3;
    goto LABEL_45;
  }
  v11 = 0;
  v9 = 0;
  v12 = 0;
  while (v5 == 92)
  {
    v5 = v12 + 1;
    v13 = v3[v12 + 1];
    v14 = (v13 - 77);
    if (v14 > 0x29)
      goto LABEL_37;
    if (((1 << (v13 - 77)) & 0x2E20231C000) == 0)
    {
      if (v13 != 77)
      {
        if (v14 == 17)
        {
          v5 = v12 + 2;
          goto LABEL_40;
        }
LABEL_37:
        if ((v13 & 0xFC) != 0x30)
          return 0;
      }
      if (!v3[v12 + 2])
        return 0;
      v5 = v12 + 3;
LABEL_40:
      if (!v3[v5])
        return 0;
    }
LABEL_41:
    v11 = v5 + 1;
    v12 = v11;
    ++v9;
    LOBYTE(v5) = v3[v11];
    if (a3 && v3[v11] == 32)
      goto LABEL_43;
  }
  if ((_BYTE)v5 && v5 != 93)
  {
    v5 = v12;
    goto LABEL_41;
  }
LABEL_43:
  v10 = &v3[v11];
  *result = &v3[v11];
  if (v12)
  {
    v15 = 0;
LABEL_50:
    *a2 = 4;
    result = malloc_type_malloc((v9 + 1), 0x506CB7DEuLL);
    if (result)
    {
      if ((v15 & 1) == 0)
      {
        LODWORD(v16) = 0;
        v17 = 0;
        while (1)
        {
          v18 = v3[v17];
          if (v18 == 92)
          {
            *a2 = 3;
            v19 = v17 + 1;
            v20 = v3[v19];
            LOBYTE(v18) = 7;
            switch(v3[v19])
            {
              case '[':
              case '\\':
              case ']':
                LOBYTE(v18) = v3[v19];
                break;
              case '^':
                LODWORD(v19) = v17 + 2;
                v18 = v3[v17 + 2];
                if (v18 == 63)
                  LOBYTE(v18) = 127;
                else
                  LOBYTE(v18) = v18 - 64;
                break;
              case '_':
              case 'c':
              case 'd':
              case 'e':
              case 'g':
              case 'h':
              case 'i':
              case 'j':
              case 'k':
              case 'l':
              case 'm':
              case 'o':
              case 'p':
              case 'q':
              case 'u':
                goto LABEL_69;
              case 'a':
                break;
              case 'b':
                LOBYTE(v18) = 8;
                break;
              case 'f':
                LOBYTE(v18) = 12;
                break;
              case 'n':
                LOBYTE(v18) = 10;
                break;
              case 'r':
                LOBYTE(v18) = 13;
                break;
              case 's':
                LOBYTE(v18) = 32;
                break;
              case 't':
                LOBYTE(v18) = 9;
                break;
              case 'v':
                LOBYTE(v18) = 11;
                break;
              default:
                if (v20 == 77)
                {
                  v21 = v3[v17 + 2];
                  if (v21 == 45)
                  {
                    LODWORD(v19) = v17 + 3;
                    LOBYTE(v18) = v3[v17 + 3] ^ 0x80;
                  }
                  else
                  {
                    if (v21 != 94)
                      goto LABEL_84;
                    LODWORD(v19) = v17 + 3;
                    v18 = v3[v17 + 3];
                    if (v18 == 63)
                      LOBYTE(v18) = -1;
                    else
                      LOBYTE(v18) = v18 + 64;
                  }
                }
                else
                {
LABEL_69:
                  if ((v20 & 0xFC) != 0x30
                    || (v22 = v3[v17 + 2], (v22 - 56) <= 0xF7u)
                    || (LODWORD(v19) = v17 + 3, v23 = v3[v17 + 3], (v23 - 56) <= 0xF7u))
                  {
LABEL_84:
                    *a2 = 0;
                    free(result);
                    return 0;
                  }
                  LOBYTE(v18) = ((_BYTE)v20 << 6) + 8 * v22 + v23 + 80;
                }
                break;
            }
          }
          else
          {
            if ((v18 - 58) <= 0xF5u)
              *a2 = 3;
            LODWORD(v19) = v17;
          }
          *((_BYTE *)result + v16) = v18;
          v16 = (v16 + 1);
          v17 = v19 + 1;
          if ((int)v19 + 1 >= v12)
            goto LABEL_53;
        }
      }
      v16 = 0;
LABEL_53:
      *((_BYTE *)result + v16) = 0;
    }
    return result;
  }
LABEL_45:
  if (*v10 != 93)
  {
    v12 = 0;
    v15 = 1;
    goto LABEL_50;
  }
  *a2 = 2;
  *result = v10 + 1;
  result = malloc_type_malloc(2uLL, 0x140FDDB3uLL);
  if (result)
  {
    v8 = 93;
    goto LABEL_48;
  }
  return result;
}

_DWORD *_asl_log_args_to_xpc(uint64_t a1, _DWORD *a2, void *a3)
{
  _DWORD *v5;

  v5 = (_DWORD *)asl_client_kvdict(a1);
  _asl_msg_to_xpc(v5, a3);
  return _asl_msg_to_xpc(a2, a3);
}

_DWORD *_asl_msg_to_xpc(_DWORD *result, void *a2)
{
  _DWORD *v3;
  unsigned int v4;
  char *v5;
  unsigned int v6;
  int v7;
  char *v8;
  xpc_object_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  char *v13;
  char *v14;
  char *__s;
  uuid_t uu;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  if (result)
  {
    if (a2)
    {
      v3 = result;
      v14 = 0;
      __s = 0;
      v13 = 0;
      asl_msg_lookup(result, "TimeNanoSec", (int **)&v13, 0);
      result = (_DWORD *)asl_msg_fetch(v3, 0, &__s, (int **)&v14, 0);
      if ((_DWORD)result != -1)
      {
        v4 = result;
        do
        {
          v5 = __s;
          if (__s)
          {
            v6 = strlen(__s);
            v7 = _asl_msg_std_key(__s, v6);
            v8 = v14;
            if (!v14)
            {
              v9 = xpc_null_create();
              goto LABEL_21;
            }
            if (v7 != 32770)
            {
              if (v7 == 32769)
              {
                v10 = 1000000000 * asl_core_parse_time(v14, 0);
                if (v13)
                  v10 += atoll(v13);
                v9 = xpc_date_create(v10);
              }
              else if (v7)
              {
                if ((v7 & 0xFFFFFFF7) == 0x8006
                  || (unsigned __int16)(v7 + 32761) <= 1u
                  || v7 == 32777
                  || (unsigned __int16)(v7 + 32757) <= 1u)
                {
                  v11 = atoll(v14);
                  v9 = xpc_int64_create(v11);
                }
                else
                {
                  if (v7 == 32784)
                    goto LABEL_22;
LABEL_11:
                  v9 = xpc_string_create(v8);
                }
              }
              else
              {
                if (strcmp(v5, "SenderMachUUID"))
                  goto LABEL_11;
                memset(uu, 0, sizeof(uu));
                if (uuid_parse(v8, uu))
                  goto LABEL_22;
                v9 = xpc_uuid_create(uu);
              }
LABEL_21:
              v12 = v9;
              xpc_dictionary_set_value(a2, __s, v9);
              xpc_release(v12);
            }
          }
LABEL_22:
          result = (_DWORD *)asl_msg_fetch(v3, v4, &__s, (int **)&v14, 0);
          v4 = result;
        }
        while ((_DWORD)result != -1);
      }
    }
  }
  return result;
}

uint64_t _jump_get_key_val_op_at_index(uint64_t a1, unsigned int a2, char **a3, int **a4, _WORD *a5)
{
  uint64_t v8;
  __int16 v9;
  char *v11;
  unsigned int v12;

  v8 = 0xFFFFFFFFLL;
  v12 = -1;
  v11 = 0;
  if (!_asl_msg_resolve_index(a1, a2, &v11, &v12))
  {
    if (a3)
      *a3 = _asl_msg_slot_key(v11, v12);
    if (a4)
      *a4 = _asl_msg_slot_val((int *)v11, v12);
    if (a5)
    {
      if (v11)
      {
        v9 = 0;
        if (v12 <= 9 && *(_DWORD *)v11 == 1)
          v9 = *(_WORD *)&v11[2 * v12 + 72];
      }
      else
      {
        v9 = 0;
      }
      v8 = 0;
      *a5 = v9;
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t _jump_count_1(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    LODWORD(result) = 0;
    do
    {
      result = (*(_DWORD *)(v1 + 8) + result);
      v1 = *(_QWORD *)(v1 + 24);
    }
    while (v1);
  }
  return result;
}

uint64_t _jump_prepend_0(uint64_t result, asl_object_t obj)
{
  int *v3;
  uint32_t type;
  unsigned int v5;
  int v6;
  const char *v7;
  char *v8;
  unsigned __int16 v9;

  if (result)
  {
    v3 = (int *)result;
    result = asl_get_type(obj);
    if (result <= 1)
    {
      if (obj)
      {
        v9 = 0;
        v7 = 0;
        v8 = 0;
        type = asl_get_type(obj);
        result = asl_msg_fetch(obj, 0, &v8, (int **)&v7, &v9);
        if ((_DWORD)result != -1)
        {
          v5 = result;
          do
          {
            if (type)
            {
              v6 = v9;
            }
            else
            {
              v6 = 0;
              v9 = 0;
            }
            asl_msg_set_key_val_op(v3, v8, v7, v6);
            result = asl_msg_fetch(obj, v5, &v8, (int **)&v7, &v9);
            v5 = result;
          }
          while ((_DWORD)result != -1);
        }
      }
    }
  }
  return result;
}

uint64_t _jump_search_2(__asl_object_s *a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  if (!a1 || a2 && (*a2 > 1u || !asl_msg_cmp(a1, a2)))
    return 0;
  asl_msg_list_new();
  v4 = v3;
  asl_msg_list_append(v3, a1);
  return v4;
}

uint64_t _jump_match_2(__asl_object_s *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  if (!a1 || a2 && !asl_msg_cmp_list((uint64_t)a1, a2))
    return 0;
  asl_msg_list_new();
  v4 = v3;
  asl_msg_list_append(v3, a1);
  return v4;
}

uint64_t _asl_msg_basic_test(__int16 a1, char *a2, char *__s1, size_t __n)
{
  char v4;
  int v6;
  int v7;
  uint64_t result;
  int v9;
  char *v10;
  int v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  regex_t v23;

  v4 = a1;
  if (!a2 || !__s1)
    return v4 & 6;
  v6 = a1 & 7;
  if ((a1 & 0x100) != 0)
  {
    result = 0;
    if (v6 == 2 || v6 == 4)
      return result;
    memset(&v23, 0, sizeof(v23));
    if ((v4 & 0x10) != 0)
      v9 = 7;
    else
      v9 = 5;
    if (!regcomp(&v23, a2, v9))
    {
      v19 = regexec(&v23, __s1, 0, 0, 0);
      MEMORY[0x1DF0EC2D8](&v23);
      if (v6 == 6)
        return v19 != 0;
      else
        return v19 == 0;
    }
    return v4 & 6;
  }
  if ((a1 & 0x80) != 0)
  {
    v10 = a2 + 1;
    if (((*a2 - 43) & 0xFD) != 0)
      v10 = a2;
    v11 = *v10;
    if (v11)
    {
      v12 = (((*a2 - 43) & 0xFD) == 0) + 1;
      while (((char)v11 - 48) < 0xA)
      {
        v11 = a2[v12++];
        if (!v11)
        {
          v13 = __s1 + 1;
          if (((*__s1 - 43) & 0xFD) != 0)
            v13 = __s1;
          v14 = *v13;
          if (v14)
          {
            v15 = (((*__s1 - 43) & 0xFD) == 0) + 1;
            while (((char)v14 - 48) < 0xA)
            {
              v14 = __s1[v15++];
              if (!v14)
              {
                v16 = atoll(a2);
                v17 = atoll(__s1);
                switch(v6)
                {
                  case 1:
                    return v17 == v16;
                  case 2:
                    v20 = v17 <= v16;
LABEL_44:
                    result = !v20;
                    break;
                  case 3:
                    result = v17 >= v16;
                    break;
                  case 4:
                    v21 = v17 < v16;
LABEL_50:
                    result = v21;
                    break;
                  case 5:
                    result = v17 <= v16;
                    break;
                  case 6:
                    v22 = v17 == v16;
LABEL_54:
                    result = !v22;
                    break;
                  default:
                    result = 0;
                    break;
                }
                return result;
              }
            }
          }
          break;
        }
      }
    }
    return v6 == 6;
  }
  else
  {
    if ((a1 & 0x10) != 0)
    {
      if ((_DWORD)__n)
        v7 = strncasecmp(__s1, a2, __n);
      else
        v7 = strcasecmp(__s1, a2);
    }
    else if ((_DWORD)__n)
    {
      v7 = strncmp(__s1, a2, __n);
    }
    else
    {
      v7 = strcmp(__s1, a2);
    }
    switch(v6)
    {
      case 1:
        return v7 == 0;
      case 2:
        v20 = v7 <= 0;
        goto LABEL_44;
      case 3:
        result = v7 >= 0;
        break;
      case 4:
        result = v7 >> 31;
        break;
      case 5:
        v21 = v7 < 1;
        goto LABEL_50;
      case 6:
        v22 = v7 == 0;
        goto LABEL_54;
      default:
        return v6 == 6;
    }
  }
  return result;
}

uint64_t asl_store_open_write(const char *a1, _QWORD *a2)
{
  tm *started;
  tm *v5;
  uint64_t result;
  FILE *v7;
  FILE *v8;
  FILE *v9;
  _QWORD *v10;
  _QWORD *v11;
  const char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t __ptr;
  int v18;
  stat v19;
  char __str[1024];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C874D8];
  if (!a2)
    return 1;
  started = _asl_start_today();
  if (!started)
    return 9999;
  v5 = started;
  if (!a1)
    a1 = (const char *)asl_filesystem_path(0);
  v18 = 0;
  __ptr = 0;
  memset(&v19, 0, sizeof(v19));
  if (!stat(a1, &v19))
  {
    if ((v19.st_mode & 0xF000) == 0x4000)
      goto LABEL_11;
    return 2;
  }
  if (*__error() != 2)
    return 2;
  if (mkdir(a1, 0x1EDu))
    return 8;
LABEL_11:
  snprintf(__str, 0x400uLL, "%s/%s", a1, "StoreData");
  memset(&v19, 0, sizeof(v19));
  if (stat(__str, &v19))
  {
    if (*__error() == 2)
    {
      v7 = fopen(__str, "w+");
      if (v7)
      {
        v8 = v7;
        __ptr = 0;
        if (fwrite(&__ptr, 8uLL, 1uLL, v7) != 1 || (v18 = 0, fwrite(&v18, 4uLL, 1uLL, v8) != 1))
        {
          fclose(v8);
          return 8;
        }
        fflush(v8);
        goto LABEL_21;
      }
    }
    return 9999;
  }
  v9 = fopen(__str, "r+");
  if (!v9)
    return 9999;
  v8 = v9;
  if (fread(&__ptr, 8uLL, 1uLL, v9) != 1)
  {
    fclose(v8);
    return 7;
  }
  __ptr = asl_core_ntohq(__ptr);
LABEL_21:
  v10 = malloc_type_calloc(1uLL, 0xA58uLL, 0x10B004012294A83uLL);
  if (!v10)
  {
    fclose(v8);
    return 9;
  }
  v11 = v10;
  *v10 = 0x100000004;
  if (a1)
    v12 = a1;
  else
    v12 = (const char *)asl_filesystem_path(0);
  v13 = strdup(v12);
  v11[2] = v13;
  if (!v13)
  {
    fclose(v8);
    free(v11);
    return 9;
  }
  v14 = 0;
  v11[326] = v5;
  v11[327] = (char *)v5 + 86400;
  v15 = __ptr + 1;
  v11[3] = v8;
  v11[4] = v15;
  do
  {
    v16 = &v11[v14];
    *(_OWORD *)(v16 + 5) = 0uLL;
    v16[9] = 0;
    *(_OWORD *)(v16 + 7) = 0uLL;
    v16[6] = -1;
    v14 += 5;
  }
  while (v14 != 320);
  result = 0;
  *a2 = v11;
  return result;
}

uint64_t asl_store_set_flags(uint64_t result, int a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    result = *(unsigned int *)(result + 2640);
    *(_DWORD *)(v2 + 2640) = a2;
  }
  return result;
}

uint64_t asl_store_statistics(uint64_t a1, char **a2)
{
  char *v3;
  char *v4;
  uint64_t result;

  if (!a1)
    return 2;
  if (!a2)
    return 1;
  v3 = asl_msg_new(0);
  if (!v3)
    return 9;
  v4 = v3;
  result = 0;
  *a2 = v4;
  return result;
}

uint64_t asl_store_open_read(char *a1, _QWORD *a2)
{
  const char *v3;
  _QWORD *v4;
  _QWORD *v5;
  const char *v6;
  uint64_t result;
  char *v8;
  stat v9;

  if (!a2)
    return 1;
  v3 = a1;
  if (!a1)
    v3 = (const char *)asl_filesystem_path(0);
  memset(&v9, 0, sizeof(v9));
  if (stat(v3, &v9) || (v9.st_mode & 0xF000) != 0x4000)
    return 2;
  v4 = malloc_type_calloc(1uLL, 0xA58uLL, 0x10B004012294A83uLL);
  if (v4)
  {
    v5 = v4;
    *v4 = 0x100000004;
    if (v3)
      v6 = v3;
    else
      v6 = (const char *)asl_filesystem_path(0);
    v8 = strdup(v6);
    v5[2] = v8;
    if (v8)
    {
      result = 0;
      *a2 = v5;
      return result;
    }
    free(v5);
  }
  return 9;
}

uint64_t asl_store_max_file_size(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a1)
    return 2;
  result = 0;
  *(_QWORD *)(a1 + 2632) = a2;
  return result;
}

double asl_store_file_closeall(uint64_t a1)
{
  uint64_t i;
  _QWORD *v3;
  __asl_object_s *v4;
  void *v5;
  uint64_t v6;
  double result;

  if (a1)
  {
    for (i = 0; i != 2560; i += 40)
    {
      v3 = (_QWORD *)(a1 + i);
      v4 = *(__asl_object_s **)(a1 + i + 72);
      if (v4)
        asl_file_close(v4);
      v3[9] = 0;
      v5 = (void *)v3[8];
      if (v5)
        free(v5);
      v3[8] = 0;
      v6 = a1 + i;
      result = NAN;
      *(_QWORD *)(v6 + 48) = -1;
      *(_QWORD *)(v6 + 56) = 0;
      v3[5] = 0;
    }
  }
  return result;
}

asl_object_t asl_store_retain(asl_object_t obj)
{
  if (obj)
    asl_retain(obj);
  return obj;
}

void asl_store_release(asl_object_t obj)
{
  if (obj)
    asl_release(obj);
}

uint64_t asl_store_close(__asl_object_s *a1)
{
  if (a1)
    asl_release(a1);
  return 0;
}

uint64_t asl_store_sweep_file_cache(uint64_t a1)
{
  time_t v2;

  if (!a1)
    return 2;
  v2 = time(0);
  asl_store_file_cache_lru(a1, v2, 0x40u);
  return 0;
}

uint64_t asl_store_file_cache_lru(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  __asl_object_s **v9;
  uint64_t v10;
  void *v11;

  v4 = 0;
  LODWORD(v5) = 0;
  v6 = a2 - 300;
  v7 = a3;
  v8 = (uint64_t *)(a1 + 40 * a3 + 40);
  v9 = (__asl_object_s **)(a1 + 72);
  do
  {
    if (v7 == v4)
    {
      v10 = *v8;
    }
    else
    {
      v10 = (uint64_t)*(v9 - 4);
      if (v10 < v6)
      {
        asl_file_close(*v9);
        *v9 = 0;
        v11 = *(v9 - 1);
        if (v11)
          free(v11);
        v10 = 0;
        *(v9 - 3) = (__asl_object_s *)-1;
        *(v9 - 2) = 0;
        *(v9 - 1) = 0;
        *(v9 - 4) = 0;
      }
    }
    if (v10 >= *(_QWORD *)(a1 + 40 * v5 + 40))
      v5 = v5;
    else
      v5 = v4;
    ++v4;
    v9 += 5;
  }
  while (v4 != 64);
  return v5;
}

char *asl_store_file_path(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const char *v3;

  if (!a1)
    return 0;
  v2 = 0;
  while (*(_QWORD *)(a1 + v2 + 72) != a2)
  {
    v2 += 40;
    if (v2 == 2560)
      return 0;
  }
  v3 = *(const char **)(a1 + v2 + 64);
  if (v3)
    return strdup(v3);
  else
    return 0;
}

double asl_store_file_close(uint64_t a1, __asl_object_s *a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  double result;

  if (a1 && a2)
  {
    v3 = 0;
    while (1)
    {
      v4 = (_QWORD *)(a1 + v3);
      if (*(__asl_object_s **)(a1 + v3 + 72) == a2)
        break;
      v3 += 40;
      if (v3 == 2560)
        return result;
    }
    asl_file_close(a2);
    v4[9] = 0;
    v5 = (void *)v4[8];
    if (v5)
      free(v5);
    v4[8] = 0;
    v6 = a1 + v3;
    result = NAN;
    *(_QWORD *)(v6 + 48) = -1;
    *(_QWORD *)(v6 + 56) = 0;
    v4[5] = 0;
  }
  return result;
}

uint64_t asl_store_save(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  _BOOL4 v5;
  time_t v6;
  uint64_t v7;
  time_t v8;
  tm *started;
  int v10;
  int v11;
  time_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  __asl_object_s *v16;
  char *ug_path;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __asl_object_s *v22;
  _QWORD *v23;
  __asl_object_s *v24;
  uint64_t v25;
  void *v26;
  char **v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  std::__fs::filesystem::path *v32;
  unsigned int v33;
  unsigned int v34;
  std::error_code *v35;
  int v36;
  unint64_t __ptr;
  char *__s;
  time_t v40;
  time_t v41;
  tm v42;
  unsigned int v43;
  unsigned __int16 v44;
  char v45[4];
  std::__fs::filesystem::path __to;
  char __str[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 2;
  if (!a2)
    return 1;
  memset(&v42, 0, sizeof(v42));
  v4 = time(0);
  v5 = *(_QWORD *)(a1 + 2624) + 300 <= v4;
  __s = 0;
  if (asl_msg_lookup(a2, "Time", (int **)&__s, 0) || !__s)
  {
    v41 = v4;
    v6 = v4;
  }
  else
  {
    v6 = asl_core_parse_time(__s, 0);
    v41 = v6;
  }
  v8 = *(_QWORD *)(a1 + 2616);
  if (v6 >= v8 && v4 >= v8)
  {
    asl_store_file_closeall(a1);
    started = _asl_start_today();
    *(_QWORD *)(a1 + 2608) = started;
    if (!started)
    {
      started = *(tm **)(a1 + 2616);
      *(_QWORD *)(a1 + 2608) = started;
    }
    v5 = 0;
    *(_QWORD *)(a1 + 2616) = (char *)started + 86400;
  }
  if ((*(_BYTE *)(a1 + 2640) & 1) != 0)
  {
    v10 = -1;
    v11 = -1;
  }
  else
  {
    __s = 0;
    v10 = -1;
    if (!asl_msg_lookup(a2, "ReadUID", (int **)&__s, 0) && __s)
      v10 = atoi(__s);
    __s = 0;
    v11 = -1;
    if (!asl_msg_lookup(a2, "ReadGID", (int **)&__s, 0) && __s)
      v11 = atoi(__s);
  }
  v40 = 0;
  if ((*(_BYTE *)(a1 + 2640) & 2) != 0)
  {
    v13 = 0;
    v12 = 0;
  }
  else
  {
    __s = 0;
    v12 = 0;
    v13 = 0;
    if (!asl_msg_lookup(a2, "ASLExpireTime", (int **)&__s, 0) && __s)
    {
      v13 = 1;
      v40 = 1;
      v41 = asl_core_parse_time(__s, 0);
      v12 = 1;
    }
  }
  if (fseeko(*(FILE **)(a1 + 24), 0, 0))
    return 8;
  __ptr = asl_core_htonq(*(_QWORD *)(a1 + 32));
  v7 = 8;
  if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)(a1 + 24)) != 1)
    return v7;
  fflush(*(FILE **)(a1 + 24));
  __ptr = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = __ptr + 1;
  *(_QWORD *)(a1 + 2624) = v4;
  if (!localtime_r(&v41, &v42))
    return 9999;
  if (v13)
  {
    *(_QWORD *)&v42.tm_sec = 0;
    *(_QWORD *)&v42.tm_hour = 0;
    ++v42.tm_mon;
    v40 = mktime(&v42);
    if (localtime_r(&v40, &v42))
    {
      snprintf(__str, 0x80uLL, "BB.%d.%02d.%02d", v42.tm_year + 1900, v42.tm_mon + 1, v42.tm_mday);
      v12 = v40;
      goto LABEL_36;
    }
    return 9999;
  }
  snprintf(__str, 0x80uLL, "%d.%02d.%02d", v42.tm_year + 1900, v42.tm_mon + 1, v42.tm_mday);
LABEL_36:
  v14 = 0;
  for (i = 0; i != 64; ++i)
  {
    if (*(_DWORD *)(a1 + v14 + 48) == v10 && *(_DWORD *)(a1 + v14 + 52) == v11 && *(_QWORD *)(a1 + v14 + 56) == v12)
    {
      v16 = *(__asl_object_s **)(a1 + v14 + 72);
      if (v16)
      {
        *(_QWORD *)(a1 + v14 + 40) = v4;
        if (v5)
          asl_store_file_cache_lru(a1, v4, i);
        goto LABEL_53;
      }
    }
    v14 += 40;
  }
  *(_DWORD *)v45 = 0;
  v43 = 0;
  v44 = 420;
  ug_path = asl_store_make_ug_path(*(_QWORD *)(a1 + 16), (uint64_t)__str, (uint64_t)"asl", v10, v11, v45, &v43, &v44);
  if (!ug_path)
    return 9;
  v18 = ug_path;
  __to.__pn_.__r_.__value_.__r.__words[0] = 0;
  v19 = asl_file_open_write(ug_path, v44, *(unsigned int *)v45, v43, (uint64_t *)&__to);
  if ((_DWORD)v19)
  {
    v7 = v19;
    free(v18);
    return v7;
  }
  v20 = asl_store_file_cache_lru(a1, v4, 0x40u);
  v21 = a1 + 40 * v20;
  v24 = *(__asl_object_s **)(v21 + 72);
  v23 = (_QWORD *)(v21 + 72);
  v22 = v24;
  if (v24)
    asl_file_close(v22);
  v25 = a1 + 40 * v20;
  v28 = *(void **)(v25 + 64);
  v27 = (char **)(v25 + 64);
  v26 = v28;
  if (v28)
    free(v26);
  *v23 = __to.__pn_.__r_.__value_.__r.__words[0];
  *v27 = v18;
  v29 = a1 + 40 * v20;
  *(_DWORD *)(v29 + 48) = v10;
  *(_DWORD *)(v29 + 52) = v11;
  *(_QWORD *)(v29 + 56) = v12;
  *(v23 - 4) = time(0);
  v16 = (__asl_object_s *)__to.__pn_.__r_.__value_.__r.__words[0];
LABEL_53:
  v7 = asl_file_save((uint64_t)v16, a2, (uint64_t *)&__ptr);
  if (!(_DWORD)v7)
  {
    v30 = asl_file_size((uint64_t)v16);
    asl_file_ctime((uint64_t)v16);
    v31 = *(_QWORD *)(a1 + 2632);
    if (v31)
    {
      if (v30 > v31)
      {
        v32 = (std::__fs::filesystem::path *)asl_store_file_path(a1, (uint64_t)v16);
        asl_store_file_close(a1, v16);
        if (v32)
        {
          v33 = strlen((const char *)v32);
          if ((v33 & 0xFFFFFFFC) != 0 && (v34 = v33, !strcmp((const char *)v32 + v33 - 4, ".asl")))
          {
            snprintf(v45, 0x400uLL, "%s", (const char *)v32);
            v45[v34 - 4] = 0;
            snprintf((char *)&__to, 0x400uLL, "%s.%llu.asl");
          }
          else
          {
            snprintf((char *)&__to, 0x400uLL, "%s.%llu");
          }
          rename(v32, &__to, v35);
          if (v36)
            v7 = 9999;
          else
            v7 = 0;
          free(v32);
        }
        else
        {
          v7 = 0;
        }
        asl_trigger_aslmanager();
      }
    }
  }
  return v7;
}

uint64_t asl_store_open_aux(uint64_t a1, _DWORD *a2, _DWORD *a3, char **a4)
{
  uint64_t result;
  int v9;
  int v10;
  uint64_t v11;
  char *ug_path;
  char *v13;
  int v14;
  int v15;
  unsigned __int16 v16;
  unsigned int v17;
  char *__s;
  time_t v19;
  time_t v20;
  tm v21;
  stat v22;
  char __str[128];
  char v24[1024];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 2;
  result = 1;
  if (a2 && a3 && a4)
  {
    memset(&v21, 0, sizeof(v21));
    __s = 0;
    v20 = time(0);
    if ((*(_BYTE *)(a1 + 2640) & 1) != 0)
    {
      v9 = -1;
      v10 = -1;
    }
    else
    {
      __s = 0;
      v9 = -1;
      if (!asl_msg_lookup(a2, "ReadUID", (int **)&__s, 0) && __s)
        v9 = atoi(__s);
      __s = 0;
      v10 = -1;
      if (!asl_msg_lookup(a2, "ReadGID", (int **)&__s, 0) && __s)
        v10 = atoi(__s);
    }
    v19 = 0;
    if ((*(_BYTE *)(a1 + 2640) & 2) != 0
      || (__s = 0, asl_msg_lookup(a2, "ASLExpireTime", (int **)&__s, 0))
      || !__s)
    {
      if (!localtime_r(&v20, &v21))
        return 9999;
      snprintf(__str, 0x80uLL, "AUX.%d.%02d.%02d");
    }
    else
    {
      v20 = asl_core_parse_time(__s, 0);
      if (!localtime_r(&v20, &v21))
        return 9999;
      *(_QWORD *)&v21.tm_sec = 0;
      *(_QWORD *)&v21.tm_hour = 0;
      ++v21.tm_mon;
      v19 = mktime(&v21);
      if (!localtime_r(&v19, &v21))
        return 9999;
      snprintf(__str, 0x80uLL, "BB.AUX.%d.%02d.%02d");
    }
    snprintf(v24, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), __str);
    memset(&v22, 0, sizeof(v22));
    if (stat(v24, &v22))
    {
      if (*__error() == 2)
      {
        if (mkdir(v24, 0x1EDu))
          return 8;
LABEL_27:
        v11 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v11 + 1;
        snprintf(v24, 0x80uLL, "%s/%llu", __str, v11);
        v22.st_dev = 0;
        v17 = 0;
        v16 = 420;
        ug_path = asl_store_make_ug_path(*(_QWORD *)(a1 + 16), (uint64_t)v24, 0, v9, v10, &v22, &v17, &v16);
        if (!ug_path)
          return 9;
        v13 = ug_path;
        v14 = asl_file_create(ug_path, v22.st_dev, v17, v16);
        if ((v14 & 0x80000000) == 0)
        {
          v15 = v14;
          *a4 = 0;
          asprintf(a4, "file://%s", v13);
          free(v13);
          result = 0;
          *a3 = v15;
          return result;
        }
        free(v13);
        *a3 = -1;
        return 8;
      }
      return 9999;
    }
    if ((v22.st_mode & 0xF000) == 0x4000)
      goto LABEL_27;
    return 2;
  }
  return result;
}

char *asl_store_make_ug_path(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, _DWORD *a6, _DWORD *a7, _WORD *a8)
{
  char *v9;

  v9 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 420;
  if (a4 == -1)
  {
    if (a5 == -1)
    {
      if (a3)
        asprintf(&v9, "%s/%s.%s");
      else
        asprintf(&v9, "%s/%s");
    }
    else
    {
      *a7 = a5;
      *a8 = 384;
      if (a3)
        asprintf(&v9, "%s/%s.G%d.%s");
      else
        asprintf(&v9, "%s/%s.G%d");
    }
  }
  else
  {
    *a6 = a4;
    if (a5 == -1)
    {
      *a8 = 384;
      if (a3)
        asprintf(&v9, "%s/%s.U%d.%s");
      else
        asprintf(&v9, "%s/%s.U%d");
    }
    else
    {
      *a7 = a5;
      *a8 = 384;
      if (a3)
        asprintf(&v9, "%s/%s.U%d.G%u.%s");
      else
        asprintf(&v9, "%s/%s.U%d.G%d");
    }
  }
  return v9;
}

uint64_t asl_store_match(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  DIR *v14;
  DIR *v15;
  dirent *v16;
  uint64_t *i;
  const char *d_name;
  int v19;
  uint64_t v20;
  uint64_t v22;
  char __str[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 0;
  v14 = opendir(*(const char **)(a1 + 16));
  if (!v14)
    return 0;
  v15 = v14;
  v22 = 0;
  v16 = readdir(v14);
  for (i = 0; v16; v16 = readdir(v15))
  {
    v19 = v16->d_name[0];
    d_name = v16->d_name;
    if (v19 != 46)
    {
      snprintf(__str, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), d_name);
      if (!asl_file_open_read(__str, &v22))
      {
        if (v22)
          i = asl_file_list_add((uint64_t)i, v22);
      }
    }
  }
  closedir(v15);
  v20 = asl_file_list_match(i, a2, a3, a4, a5, a6, a7);
  asl_file_list_close((asl_object_t *)i);
  return v20;
}

uint64_t asl_store_match_timeout(uint64_t a1, uint64_t a2, unsigned int **a3, _QWORD *a4, unint64_t a5, int a6, int a7, unsigned int a8)
{
  uint64_t v15;
  __asl_object_s *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  __asl_object_s *v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int *v23;
  __asl_object_s *v24;
  asl_object_t v25;
  uint64_t v26;
  unsigned int v27;
  asl_object_t obj;

  obj = 0;
  if (!a3)
    return 9999;
  *a3 = 0;
  v15 = asl_store_open_read(0, &obj);
  if (!(_DWORD)v15)
  {
    if (a2)
    {
      if (*(_DWORD *)a2)
      {
        v16 = asl_new(2u);
        v17 = *(_DWORD *)a2;
        *(_DWORD *)(a2 + 4) = 0;
        if (v17)
        {
          v18 = 0;
          do
          {
            asl_append(v16, *(asl_object_t *)(*(_QWORD *)(a2 + 8) + 8 * v18));
            v19 = *(_DWORD *)a2;
            v18 = *(_DWORD *)(a2 + 4) + 1;
            *(_DWORD *)(a2 + 4) = v18;
          }
          while (v18 < v19);
        }
      }
      else
      {
        v16 = 0;
        *(_DWORD *)(a2 + 4) = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    v20 = (__asl_object_s *)asl_store_match((uint64_t)obj, (uint64_t)v16, a4, a5, a6, a8, a7);
    asl_release(obj);
    asl_release(v16);
    if (v20)
    {
      v21 = asl_count(v20);
      if (v21)
      {
        v22 = (unsigned int *)malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
        if (v22)
        {
          v23 = v22;
          *v22 = v21;
          *((_QWORD *)v22 + 1) = malloc_type_calloc(v21, 8uLL, 0x80040B8603338uLL);
          v23[1] = 0;
          if (*v23)
          {
            do
            {
              v24 = asl_next(v20);
              v25 = asl_retain(v24);
              v27 = *v23;
              v26 = v23[1];
              *(_QWORD *)(*((_QWORD *)v23 + 1) + 8 * v26) = v25;
              v23[1] = v26 + 1;
            }
            while ((int)v26 + 1 < v27);
          }
          v15 = 0;
          v23[1] = 0;
          *a3 = v23;
        }
        else
        {
          v15 = 9;
        }
      }
      else
      {
        v15 = 0;
      }
      asl_release(v20);
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

uint64_t asl_store_match_start(uint64_t a1, unint64_t a2, int a3)
{
  _QWORD *v6;
  DIR *v7;
  DIR *v8;
  dirent *v9;
  uint64_t *i;
  const char *d_name;
  int v12;
  _QWORD **matched;
  uint64_t v15;
  char __str[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 2;
  v6 = *(_QWORD **)(a1 + 2600);
  if (v6)
    asl_file_list_match_end(v6);
  *(_QWORD *)(a1 + 2600) = 0;
  v7 = opendir(*(const char **)(a1 + 16));
  if (!v7)
    return 7;
  v8 = v7;
  v15 = 0;
  v9 = readdir(v7);
  for (i = 0; v9; v9 = readdir(v8))
  {
    v12 = v9->d_name[0];
    d_name = v9->d_name;
    if (v12 != 46)
    {
      snprintf(__str, 0x400uLL, "%s/%s", *(const char **)(a1 + 16), d_name);
      if (!asl_file_open_read(__str, &v15))
      {
        if (v15)
          i = asl_file_list_add((uint64_t)i, v15);
      }
    }
  }
  closedir(v8);
  matched = asl_file_list_match_start(i, a2, a3);
  *(_QWORD *)(a1 + 2600) = matched;
  if (matched)
    return 0;
  else
    return 9999;
}

uint64_t asl_store_match_next(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t result;

  if (!a1)
    return 2;
  result = *(_QWORD *)(a1 + 2600);
  if (result)
    return asl_file_list_match_next(result, a2, a3, a4);
  return result;
}

uint64_t _jump_next_1(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __asl_object_s *v4;
  uint64_t index;
  uint64_t v7;

  v7 = 0;
  if (!a1)
    return 0;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 == -1)
    return 0;
  *(_QWORD *)(a1 + 8) = v2 + 1;
  v3 = asl_store_match(a1, 0, &v7, v2 + 1, 1, 0, 1);
  if (v3)
  {
    v4 = (__asl_object_s *)v3;
    *(_QWORD *)(a1 + 8) = v7;
    index = asl_msg_list_get_index(v3, 0);
    asl_msg_list_release(v4);
  }
  else
  {
    index = 0;
    *(_QWORD *)(a1 + 8) = -1;
  }
  return index;
}

uint64_t _jump_prev_1(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __asl_object_s *v4;
  uint64_t index;
  uint64_t v7;

  v7 = 0;
  if (!a1)
    return 0;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  *(_QWORD *)(a1 + 8) = v2 - 1;
  if (v2 == 1)
    return 0;
  v3 = asl_store_match(a1, 0, &v7, v2 - 1, 1, 0, -1);
  if (v3)
  {
    v4 = (__asl_object_s *)v3;
    *(_QWORD *)(a1 + 8) = v7;
    index = asl_msg_list_get_index(v3, 0);
    asl_msg_list_release(v4);
  }
  else
  {
    index = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  return index;
}

uint64_t _jump_set_iteration_index_1(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

uint64_t _jump_search_3(uint64_t a1, asl_object_t obj)
{
  uint32_t type;
  uint64_t v5;
  asl_object_t v6;
  uint64_t v7;
  uint64_t v9;
  __asl_object_s *v10;
  uint64_t v11;

  type = asl_get_type(obj);
  v11 = 0;
  if (!obj)
  {
    v5 = a1;
    v6 = 0;
    return asl_store_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type == 2)
  {
    v5 = a1;
    v6 = obj;
    return asl_store_match(v5, (uint64_t)v6, &v11, 0, 0, 0, 1);
  }
  if (type > 1)
    return 0;
  asl_msg_list_new();
  v10 = (__asl_object_s *)v9;
  asl_msg_list_append(v9, obj);
  v7 = asl_store_match(a1, (uint64_t)v10, &v11, 0, 0, 0, 1);
  asl_msg_list_release(v10);
  return v7;
}

uint64_t _jump_match_3(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t a4, int a5, unsigned int a6, int a7)
{
  uint64_t result;
  uint64_t v9;

  v9 = 0;
  result = asl_store_match(a1, a2, &v9, a4, a5, a6, a7);
  *a3 = v9;
  return result;
}

tm *_asl_start_today()
{
  tm *result;
  tm v1;
  time_t v2;

  memset(&v1, 0, sizeof(v1));
  v2 = time(0);
  result = localtime_r(&v2, &v1);
  if (result)
  {
    *(_QWORD *)&v1.tm_sec = 0;
    v1.tm_hour = 0;
    return (tm *)mktime(&v1);
  }
  return result;
}

uint64_t asl_is_utf8(unsigned __int8 *a1)
{
  int v2;
  uint64_t result;
  int v4;
  int v5;
  unsigned __int8 *v6;
  BOOL v7;
  unsigned int v8;
  int v9;
  BOOL v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  int v14;

  if (!a1)
    return 1;
  v2 = *a1;
  result = 1;
  if (v2)
  {
    v4 = 0;
    v5 = 0;
    v6 = a1 + 1;
    while (1)
    {
      switch(v5)
      {
        case 0:
          if ((v2 & 0x80) == 0)
          {
            v5 = 0;
            v4 = 0;
LABEL_51:
            v7 = 1;
            goto LABEL_52;
          }
          if ((v2 + 62) < 0x1Eu)
          {
            v5 = 1;
            v4 = 1;
            goto LABEL_51;
          }
          if (v2 == 224)
          {
            v5 = 1;
            v4 = 2;
            goto LABEL_51;
          }
          if ((v2 + 31) < 0xFu)
          {
            v5 = 1;
            v4 = 3;
            goto LABEL_51;
          }
          if (v2 == 240)
          {
            v5 = 1;
            v4 = 4;
            goto LABEL_51;
          }
          if ((v2 + 15) < 3u)
          {
            v5 = 1;
            v4 = 5;
            goto LABEL_51;
          }
          v7 = v2 == 244;
          if (v2 == 244)
            v4 = 6;
          else
            v4 = 0;
          v5 = 1;
LABEL_52:
          v14 = *v6++;
          LOBYTE(v2) = v14;
          if (!v14 || !v7)
            return v7;
          break;
        case 1:
          switch(v4)
          {
            case 1:
              v5 = (char)v2 > -65;
              v7 = (char)v2 < -64;
              v4 = 1;
              goto LABEL_52;
            case 2:
              v7 = (v2 & 0xE0) == 160;
              if ((v2 & 0xE0) == 0xA0)
                v5 = 2;
              else
                v5 = 1;
              v4 = 2;
              goto LABEL_52;
            case 3:
              v7 = (char)v2 < -64;
              if ((char)v2 >= -64)
                v5 = 1;
              else
                v5 = 2;
              v4 = 3;
              goto LABEL_52;
            case 4:
              v13 = (v2 + 112);
              v7 = v13 < 0x30;
              if (v13 >= 0x30)
                v5 = 1;
              else
                v5 = 2;
              v4 = 4;
              goto LABEL_52;
            case 5:
              v7 = (char)v2 < -64;
              if ((char)v2 >= -64)
                v5 = 1;
              else
                v5 = 2;
              v4 = 5;
              goto LABEL_52;
            case 6:
              v7 = (char)v2 < -112;
              if ((char)v2 >= -112)
                v5 = 1;
              else
                v5 = 2;
              v4 = 6;
              goto LABEL_52;
            default:
              return 0;
          }
        case 2:
          v8 = v4 & 0xFFFFFFFE;
          v7 = (v4 - 4) < 3 && (char)v2 < -64;
          if (v7)
            v9 = 3;
          else
            v9 = 2;
          v10 = (char)v2 < -64;
          v11 = 2 * ((char)v2 > -65);
          v12 = v8 == 2;
          if (v8 == 2)
            v5 = v11;
          else
            v5 = v9;
          if (v12)
            v7 = v10;
          goto LABEL_52;
        case 3:
          v7 = (v4 - 4) < 3 && (char)v2 < -64;
          if (v7)
            v5 = 0;
          else
            v5 = 3;
          goto LABEL_52;
        default:
          return 0;
      }
    }
  }
  return result;
}

_BYTE *asl_b64_encode(uint64_t a1, unint64_t a2)
{
  _BYTE *result;
  uint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  result = 0;
  if (a1 && a2)
  {
    result = malloc_type_malloc((4 * ((a2 + 2) / 3)) | 1, 0x1B493FFBuLL);
    if (result)
    {
      result[(2 * (((a2 + 2) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64)) & 0xFFFFFFFFFFFFFFFCLL] = 0;
      if (a2 < 3)
      {
        v9 = 0;
        v5 = 0;
        v6 = 1;
      }
      else
      {
        v5 = 0;
        v6 = 1;
        do
        {
          v7 = &result[v5 + 1];
          *(v7 - 1) = aAbcdefghijklmn[(unint64_t)*(unsigned __int8 *)(a1 + v6 - 1) >> 2];
          *v7 = aAbcdefghijklmn[((unint64_t)*(unsigned __int8 *)(a1 + v6) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (*(_BYTE *)(a1 + v6 - 1) & 3))];
          v7[1] = aAbcdefghijklmn[((unint64_t)*(unsigned __int8 *)(a1 + v6 + 1) >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (*(_BYTE *)(a1 + v6) & 0xF))];
          v5 += 4;
          v7[2] = aAbcdefghijklmn[*(_BYTE *)(a1 + v6 + 1) & 0x3F];
          v8 = v6 + 4;
          v6 += 3;
        }
        while (v8 < a2);
        v9 = v6 - 1;
      }
      if (v9 < a2)
      {
        v11 = v5 | 1;
        result[v5] = aAbcdefghijklmn[(unint64_t)*(unsigned __int8 *)(a1 + v9) >> 2];
        v12 = 16 * (*(_BYTE *)(a1 + v9) & 3);
        if (v6 >= a2)
        {
          v15 = aAbcdefghijklmn[v12];
          v16 = v5 | 2;
          result[v11] = v15;
          v14 = v5 | 3;
          result[v16] = 61;
        }
        else
        {
          result[v11] = aAbcdefghijklmn[v12 | ((unint64_t)*(unsigned __int8 *)(a1 + v6) >> 4)];
          v13 = v5 | 2;
          v14 = v5 | 3;
          result[v13] = aAbcdefghijklmn[4 * (*(_BYTE *)(a1 + v6) & 0xF)];
        }
        result[v14] = 61;
      }
    }
    else
    {
      v10 = __error();
      result = 0;
      *v10 = 12;
    }
  }
  return result;
}

uint64_t asl_syslog_faciliy_name_to_num(const char *a1)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!strcasecmp(a1, "auth"))
    return 32;
  if (!strcasecmp(a1, "authpriv"))
    return 80;
  if (!strcasecmp(a1, "cron"))
    return 72;
  if (!strcasecmp(a1, "daemon"))
    return 24;
  if (!strcasecmp(a1, "ftp"))
    return 88;
  if (!strcasecmp(a1, "install"))
    return 112;
  result = strcasecmp(a1, "kern");
  if (!(_DWORD)result)
    return result;
  if (!strcasecmp(a1, "lpr"))
    return 48;
  if (!strcasecmp(a1, "mail"))
    return 16;
  if (!strcasecmp(a1, "netinfo"))
    return 96;
  if (!strcasecmp(a1, "remoteauth"))
    return 104;
  if (!strcasecmp(a1, "news"))
    return 56;
  if (!strcasecmp(a1, "security"))
    return 32;
  if (!strcasecmp(a1, "syslog"))
    return 40;
  if (!strcasecmp(a1, "user"))
    return 8;
  if (!strcasecmp(a1, "uucp"))
    return 64;
  if (!strcasecmp(a1, "local0"))
    return 128;
  if (!strcasecmp(a1, "local1"))
    return 136;
  if (!strcasecmp(a1, "local2"))
    return 144;
  if (!strcasecmp(a1, "local3"))
    return 152;
  if (!strcasecmp(a1, "local4"))
    return 160;
  if (!strcasecmp(a1, "local5"))
    return 168;
  if (!strcasecmp(a1, "local6"))
    return 176;
  if (!strcasecmp(a1, "local7"))
    return 184;
  if (!strcasecmp(a1, "launchd"))
    return 192;
  return 0xFFFFFFFFLL;
}

uint64_t asl_trigger_aslmanager()
{
  _xpc_connection_s *mach_service;
  xpc_object_t v1;
  void *v2;
  xpc_object_t v3;

  mach_service = xpc_connection_create_mach_service("com.apple.aslmanager", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_1);
  xpc_connection_resume(mach_service);
  if (!mach_service)
    return 0xFFFFFFFFLL;
  v1 = xpc_dictionary_create(0, 0, 0);
  if (!v1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  v3 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
  if (v3)
    xpc_release(v3);
  xpc_release(v2);
  xpc_release(mach_service);
  return 0;
}

void asl_object_unset_key(_DWORD *a1, uint64_t a2)
{
  void (*v4)(_DWORD *, uint64_t);

  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1)
      dispatch_once(&asl_object_once, &__block_literal_global_2);
    v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 24);
    if (v4)
      v4(a1, a2);
  }
}

uint64_t asl_object_get_val_op_for_key(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v8)(_DWORD *, uint64_t, uint64_t, uint64_t);

  if (!a1 || *a1 > 6u)
    return 0xFFFFFFFFLL;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_4);
  v8 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 32);
  if (v8)
    return v8(a1, a2, a3, a4);
  else
    return 0xFFFFFFFFLL;
}

uint64_t asl_object_get_key_val_op_at_index(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v10)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t);

  if (!a1 || *a1 > 6u)
    return 0xFFFFFFFFLL;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_6);
  v10 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 40);
  if (v10)
    return v10(a1, a2, a3, a4, a5);
  else
    return 0xFFFFFFFFLL;
}

uint64_t asl_object_count(_DWORD *a1)
{
  uint64_t (*v2)(_DWORD *);

  if (!a1 || *a1 > 6u)
    return 0;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_8);
  v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 48);
  if (v2)
    return v2(a1);
  else
    return 0;
}

uint64_t asl_object_next(_DWORD *a1)
{
  uint64_t (*v2)(_DWORD *);

  if (!a1 || *a1 > 6u)
    return 0;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_10);
  v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 56);
  if (v2)
    return v2(a1);
  else
    return 0;
}

uint64_t asl_object_prev(_DWORD *a1)
{
  uint64_t (*v2)(_DWORD *);

  if (!a1 || *a1 > 6u)
    return 0;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_12);
  v2 = *(uint64_t (**)(_DWORD *))(asl_jump[*a1] + 64);
  if (v2)
    return v2(a1);
  else
    return 0;
}

uint64_t asl_object_get_object_at_index(_DWORD *a1, uint64_t a2)
{
  uint64_t (*v4)(_DWORD *, uint64_t);

  if (!a1 || *a1 > 6u)
    return 0;
  if (asl_object_once != -1)
    dispatch_once(&asl_object_once, &__block_literal_global_14);
  v4 = *(uint64_t (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 72);
  if (v4)
    return v4(a1, a2);
  else
    return 0;
}

void asl_object_set_iteration_index(_DWORD *a1, uint64_t a2)
{
  void (*v4)(_DWORD *, uint64_t);

  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1)
      dispatch_once(&asl_object_once, &__block_literal_global_16);
    v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 80);
    if (v4)
      v4(a1, a2);
  }
}

void asl_object_remove_object_at_index(_DWORD *a1, uint64_t a2)
{
  void (*v4)(_DWORD *, uint64_t);

  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1)
      dispatch_once(&asl_object_once, &__block_literal_global_18);
    v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 88);
    if (v4)
      v4(a1, a2);
  }
}

void asl_object_prepend(_DWORD *a1, uint64_t a2)
{
  void (*v4)(_DWORD *, uint64_t);

  if (a1 && *a1 <= 6u)
  {
    if (asl_object_once != -1)
      dispatch_once(&asl_object_once, &__block_literal_global_22);
    v4 = *(void (**)(_DWORD *, uint64_t))(asl_jump[*a1] + 104);
    if (v4)
      v4(a1, a2);
  }
}

uint64_t asl_object_search(_DWORD *a1, __asl_object_s *a2)
{
  uint64_t (*v4)(_DWORD *, __asl_object_s *);

  if (!a1)
    return asl_client_search(0, a2);
  if (*a1 <= 6u)
  {
    if (asl_object_once != -1)
      dispatch_once(&asl_object_once, &__block_literal_global_24);
    v4 = *(uint64_t (**)(_DWORD *, __asl_object_s *))(asl_jump[*a1] + 112);
    if (v4)
      return v4(a1, a2);
  }
  return 0;
}

uint64_t asl_object_match(_DWORD *a1, char *a2, char **a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v14)(_DWORD *, char *, char **, unint64_t, uint64_t, uint64_t, uint64_t);

  if (!a1)
    return asl_client_match(0, a2, a3, a4, a5, a6, a7);
  if (*a1 <= 6u)
  {
    if (asl_object_once != -1)
      dispatch_once(&asl_object_once, &__block_literal_global_26);
    v14 = *(uint64_t (**)(_DWORD *, char *, char **, unint64_t, uint64_t, uint64_t, uint64_t))(asl_jump[*a1] + 120);
    if (v14)
      return v14(a1, a2, a3, a4, a5, a6, a7);
  }
  return 0;
}

uint64_t asl_get_value_for_key(_DWORD *a1, uint64_t a2)
{
  __int16 v3;
  uint64_t v4;

  v4 = 0;
  v3 = 0;
  asl_object_get_val_op_for_key(a1, a2, (uint64_t)&v4, (uint64_t)&v3);
  return v4;
}

uint64_t asl_unset_key(_DWORD *a1, uint64_t a2)
{
  asl_object_unset_key(a1, a2);
  return 0;
}

void asl_append(asl_object_t obj, asl_object_t obj_to_add)
{
  uint64_t v2;

  asl_object_append((int *)obj, (uint64_t)obj_to_add, v2);
}

const char *__cdecl asl_key(asl_object_t msg, uint32_t n)
{
  const char *v3;

  v3 = 0;
  if (asl_object_get_key_val_op_at_index(msg, n, (uint64_t)&v3, 0, 0))
    return 0;
  else
    return v3;
}

const char *__cdecl asl_get(asl_object_t msg, const char *key)
{
  const char *v3;

  v3 = 0;
  if (asl_object_get_val_op_for_key(msg, (uint64_t)key, (uint64_t)&v3, 0))
    return 0;
  else
    return v3;
}

int asl_fetch_key_val_op(asl_object_t msg, uint32_t n, const char **key, const char **val, uint32_t *op)
{
  int result;
  unsigned __int16 v7;

  v7 = 0;
  result = asl_object_get_key_val_op_at_index(msg, n, (uint64_t)key, (uint64_t)val, (uint64_t)&v7);
  if (op)
  {
    if (!result)
      *op = v7;
  }
  return result;
}

int asl_set_query(asl_object_t msg, const char *key, const char *value, uint32_t op)
{
  return asl_object_set_key_val_op(msg, (uint64_t)key, (uint64_t)value, (unsigned __int16)op);
}

int asl_unset(asl_object_t obj, const char *key)
{
  asl_object_unset_key(obj, (uint64_t)key);
  return 0;
}

char *__cdecl asl_format(char *msg, const char *msg_fmt, const char *time_fmt, uint32_t text_encoding)
{
  int v4;

  if (msg)
  {
    if (*(_DWORD *)msg)
    {
      return 0;
    }
    else
    {
      v4 = 0;
      return asl_format_message(msg, (char *)msg_fmt, (char *)time_fmt, text_encoding, &v4);
    }
  }
  return msg;
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  _vsyslog(a1, a2, a3);
}

void openlog(const char *a1, int a2, int a3)
{
  char *v6;
  int v7;

  pthread_mutex_lock(&_sl_lock);
  if (_sl_asl)
    asl_release((asl_object_t)_sl_asl);
  _sl_asl = 0;
  free((void *)_sl_ident);
  _sl_ident = 0;
  if (a1)
    _sl_ident = (uint64_t)strdup(a1);
  _sl_fac = a3;
  v6 = asl_syslog_faciliy_num_to_name(a3);
  _sl_opts = a2;
  if ((a2 & 0x1000) != 0)
    v7 = 65540;
  else
    v7 = 0x10000;
  _sl_mask = 255;
  _sl_asl = (uint64_t)asl_open((const char *)_sl_ident, v6, v7 & 0xFFFFFFFE | (a2 >> 5) & 1);
  asl_set_filter((asl_object_t)_sl_asl, _sl_mask);
  pthread_mutex_unlock(&_sl_lock);
}

void closelog(void)
{
  pthread_mutex_lock(&_sl_lock);
  if (_sl_asl)
    asl_close((asl_object_t)_sl_asl);
  _sl_asl = 0;
  free((void *)_sl_ident);
  _sl_ident = 0;
  _sl_fac = 0;
  pthread_mutex_unlock(&_sl_lock);
}

int setlogmask(int a1)
{
  int v2;

  if (!a1)
    return _sl_mask;
  pthread_mutex_lock(&_sl_lock);
  _sl_mask = a1;
  v2 = asl_set_filter((asl_object_t)_sl_asl, a1);
  if ((_sl_opts & 0x20) != 0)
    asl_set_output_file_filter((asl_object_t)_sl_asl, 2, a1);
  pthread_mutex_unlock(&_sl_lock);
  return v2;
}

uint64_t _asl_server_create_aux_link(int a1, uint64_t a2, int a3, _DWORD *a4, _QWORD *a5, _DWORD *a6, _DWORD *a7)
{
  mach_port_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v17;
  _BYTE rcv_name[24];
  uint64_t v19;
  int v20;
  _BYTE v21[12];
  _BYTE v22[28];

  *(_QWORD *)&rcv_name[16] = 0x100000000;
  *(_QWORD *)&v21[4] = 0;
  memset(v22, 0, sizeof(v22));
  *(_OWORD *)rcv_name = 0u;
  v19 = a2;
  v20 = 16777473;
  *(_DWORD *)v21 = a3;
  *(_QWORD *)&v21[4] = *MEMORY[0x1E0C87D40];
  *(_DWORD *)v22 = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v17 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x7500000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v17);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v13 = mach_msg((mach_msg_header_t *)&v17, 3, 0x38u, 0x50u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v14 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 217)
      {
        if (v17 < 0)
        {
          v14 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 2
            && *(_DWORD *)rcv_name == 72
            && !*(_DWORD *)&rcv_name[4]
            && HIWORD(v20) << 16 == 1114112
            && v21[11] == 1)
          {
            v15 = *(_DWORD *)v22;
            if (*(_DWORD *)v22 == *(_DWORD *)&v22[12])
            {
              v14 = 0;
              *a4 = v19;
              *a5 = *(_QWORD *)v21;
              *a6 = v15;
              *a7 = *(_DWORD *)&v22[16];
              return v14;
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (*(_DWORD *)&rcv_name[4])
              v14 = 4294966996;
            else
              v14 = HIDWORD(v19);
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v17);
      return v14;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v14;
}

uint64_t _asl_server_message(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 16777473;
  v7 = a3;
  v8 = *MEMORY[0x1E0C87D40];
  v9 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1DE3EEB90;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
}

uint64_t _asl_server_register_direct_watch(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C87D40];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 119;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t _asl_server_cancel_direct_watch(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C87D40];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 120;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C88840])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t _asl_server_query_2(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, _QWORD *a7, _DWORD *a8, _QWORD *a9, _DWORD *a10)
{
  mach_port_t reply_port;
  uint64_t v14;
  uint64_t v15;
  int v16;
  mach_msg_header_t msg;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  msg.msgh_id = 0;
  v23 = 0;
  v24 = 0u;
  v25 = 0;
  *(_OWORD *)&msg.msgh_size = 0u;
  v19 = 1;
  v20 = a2;
  v21 = 16777473;
  v22 = a3;
  v23 = *MEMORY[0x1E0C87D40];
  LODWORD(v24) = a3;
  *(_QWORD *)((char *)&v24 + 4) = a4;
  HIDWORD(v24) = a5;
  LODWORD(v25) = a6;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x7900000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v14 = mach_msg(&msg, 3, 0x48u, 0x4Cu, reply_port, 0, 0);
  v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v14)
    {
      if (msg.msgh_id == 71)
      {
        v15 = 4294966988;
      }
      else if (msg.msgh_id == 221)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v15 = 4294966996;
          if (v19 == 1 && msg.msgh_size == 68 && !msg.msgh_remote_port && HIBYTE(v21) == 1)
          {
            v16 = v22;
            if (v22 == (_DWORD)v24)
            {
              v15 = 0;
              *a7 = v20;
              *a8 = v16;
              *a9 = *(_QWORD *)((char *)&v24 + 4);
              *a10 = HIDWORD(v24);
              return v15;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (msg.msgh_remote_port)
              v15 = 4294966996;
            else
              v15 = HIDWORD(v20);
          }
        }
        else
        {
          v15 = 4294966996;
        }
      }
      else
      {
        v15 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v15;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v15;
}

uint64_t _asl_server_match(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, _QWORD *a8, _DWORD *a9, _QWORD *a10, _DWORD *a11)
{
  mach_port_t reply_port;
  uint64_t v14;
  uint64_t v15;
  int v16;
  mach_msg_header_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;

  v19 = 1;
  v20 = a2;
  v21 = 16777473;
  v22 = a3;
  v23 = *MEMORY[0x1E0C87D40];
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&v18.msgh_bits = 2147489043;
  v18.msgh_remote_port = a1;
  v18.msgh_local_port = reply_port;
  *(_QWORD *)&v18.msgh_voucher_port = 0x7A00000000;
  if (MEMORY[0x1E0C88840])
  {
    voucher_mach_msg_set(&v18);
    reply_port = v18.msgh_local_port;
  }
  v14 = mach_msg(&v18, 3, 0x50u, 0x4Cu, reply_port, 0, 0);
  v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v18.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v14)
    {
      if (v18.msgh_id == 71)
      {
        v15 = 4294966988;
      }
      else if (v18.msgh_id == 222)
      {
        if ((v18.msgh_bits & 0x80000000) != 0)
        {
          v15 = 4294966996;
          if (v19 == 1 && *(_QWORD *)&v18.msgh_size == 68 && HIBYTE(v21) == 1)
          {
            v16 = v22;
            if (v22 == v24)
            {
              v15 = 0;
              *a8 = v20;
              *a9 = v16;
              *a10 = v25;
              *a11 = v26;
              return v15;
            }
          }
        }
        else if (v18.msgh_size == 36)
        {
          v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (v18.msgh_remote_port)
              v15 = 4294966996;
            else
              v15 = HIDWORD(v20);
          }
        }
        else
        {
          v15 = 4294966996;
        }
      }
      else
      {
        v15 = 4294966995;
      }
      mach_msg_destroy(&v18);
      return v15;
    }
    mig_dealloc_reply_port(v18.msgh_local_port);
  }
  return v15;
}

void asl_log_descriptor_cold_1()
{
  __assert_rtn("asl_log_descriptor", "asl_fd.c", 292, "fd_type == ASL_LOG_DESCRIPTOR_WRITE");
}

void asl_descriptor_init_cold_1()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 195, "(redirect_descriptors = calloc(16, sizeof(*redirect_descriptors))) != NULL");
}

void asl_descriptor_init_cold_2()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 199, "redirect_serial_q != NULL");
}

void asl_descriptor_init_cold_3()
{
  __assert_rtn("asl_descriptor_init", "asl_fd.c", 202, "read_source_group != NULL");
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x1E0C87468]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C87488](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C874A0](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C874A8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1E0C87628](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C87630](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1E0C87638](a1);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C89038]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C88018](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C87680](a1);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C87690](a1, a2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C86FF0](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C87008](data);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C87038]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C87040](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C87048](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C87050](group, timeout);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C87060](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C87068](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
  MEMORY[0x1E0C87070](channel, low_water);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C87108](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87128](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C87148](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C87150](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C87160](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C87168](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C87170](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C87178](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C871A0](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C871A8](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1E0C871B0](source);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C871C0](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C871D0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C871F8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C87208](when, delta);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1E0C88058](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C876C0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C88090](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C876C8](*(_QWORD *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C876E8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C876F8](a1);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x1E0C880B8]();
}

int fls(int a1)
{
  return MEMORY[0x1E0C88BB0](*(_QWORD *)&a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C87728](__filename, __mode);
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

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C87748](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C87750](a1, a2, *(_QWORD *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C87758](__stream, a2, *(_QWORD *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1E0C87770](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C87798](__ptr, __size, __nitems, __stream);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C88150]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C88170]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C877C8](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C881C0]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C877D0](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C87810](a1, a2);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C88338](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C88348](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88988](ptr, size, type_id);
}

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  return MEMORY[0x1E0C87D18](user, group, ismember);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1E0C87D20](*(_QWORD *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1E0C87D28](*(_QWORD *)&uid, uu);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C87820](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C87838](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C87840](__b, *(_QWORD *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C884B0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C884C8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C884D8](*(_QWORD *)&reply_port);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C884F0](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1E0C87860](a1);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C889E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C889E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C88A00](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C88A08](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x1E0C88A18]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C88528](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C87878](a1);
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return MEMORY[0x1E0C88EE8](activity, parent_id);
}

uint64_t os_log_shim_enabled()
{
  return MEMORY[0x1E0C88F10]();
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1E0C88F20]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C88570](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C88D68](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D70](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D80](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C878A8](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C88640](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C878C0](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C889B0](__ptr, __size);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C878E0](a1, a2, *(_QWORD *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1E0C878E8](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x1E0C878F0](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C88660](__from, __to, __ec);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1E0C87920](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C88738](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C87970](a1, a2);
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

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C879B8](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C879E0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87A18](__s, *(_QWORD *)&__c);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C87AB8](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1E0C87AC0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C887D0](a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C87B08](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B20](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C887E0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C887F0](*(_QWORD *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C88840](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C888E0](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C890E0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C890F0](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C89110](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C89120](connection, handler);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1E0C89188](interval);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C89248](xdict, key, value);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C89278](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C89290]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C892C0](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C892D8](string);
}

