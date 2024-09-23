#error "100001B40: switch analysis failed: switch information is incomplete or incorrect (funcsize=62)"

uint64_t sub_100001B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  const char *v16;
  const char **v17;
  unsigned __int8 *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _OWORD v22[3];
  unint64_t v23;
  _OWORD v24[7];
  __int128 v25;
  _OWORD v26[2];
  unint64_t v27;

  v27 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[0] = v5;
  v26[1] = v5;
  v25 = v5;
  v24[5] = v5;
  v24[6] = v5;
  v24[3] = v5;
  v24[4] = v5;
  v24[1] = v5;
  v24[2] = v5;
  v24[0] = v5;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  v22[1] = v5;
  v22[2] = v5;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  result = _os_trace_get_image_info(a2, a3, &v20, &v25, 0);
  if (!result)
    return result;
  v7 = *(unsigned __int8 *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 56))
  {
    v19 = *(_QWORD **)(a1 + 32);
    if (v19)
    {
      if (*v19 != v20 || v19[1] != v21)
        return 0;
    }
  }
  if ((_BYTE)v25 && !*(_QWORD *)(a1 + 40))
    return 1;
  v8 = 0;
  v9 = 0;
  v22[0] = xmmword_100007160;
  v10 = (unsigned int *)v26;
  v11 = 1;
  while (1)
  {
    v12 = v10[1];
    if ((_DWORD)v12)
      break;
LABEL_13:
    v10 += 2;
    v8 += 16;
    if (v8 == 80)
      goto LABEL_14;
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    if (*(_QWORD *)(v13 + v8 + 8) != v12)
      return 72;
    v24[v11] = *(_OWORD *)(v13 + v8);
  }
  else
  {
    v14 = &v24[v11];
    *v14 = a2 + *v10;
    v14[1] = v12;
  }
  if (v8 != 64)
  {
    v15 = (char *)v22 + 8 * v9++;
    HIDWORD(v22[0]) = v9;
    *((_QWORD *)v15 + 2) = *(_QWORD *)v10;
    ++v11;
    goto LABEL_13;
  }
LABEL_14:
  *(_QWORD *)&v24[0] = v22;
  *((_QWORD *)&v24[0] + 1) = 8 * v9 + 16;
  v16 = *(const char **)(a1 + 48);
  v17 = (const char **)&v24[v11];
  *v17 = v16;
  v17[1] = (const char *)(strlen(v16) + 1);
  if (v7)
    v18 = *(unsigned __int8 **)(a1 + 32);
  else
    v18 = (unsigned __int8 *)&v20;
  LODWORD(result) = sub_100001D64(v18, 1u, (uint64_t)v24, (v11 + 1));
  if ((_DWORD)result)
    return result;
  else
    return 89;
}

uint64_t sub_100001D64(unsigned __int8 *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[5];
  int v11;

  v11 = -1431655766;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[3] = v6;
  v10[4] = v6;
  v10[1] = v6;
  v10[2] = v6;
  v10[0] = v6;
  sub_100002740(a1, a2, (uint64_t)v10);
  v8 = v7;
  if (!(_DWORD)v7)
  {
    if (_os_trace_writev(DWORD1(v10[0]), a3, a4) == -1)
      v8 = *__error();
    else
      v8 = 0;
  }
  return sub_100001E10((uint64_t)v10, v8);
}

uint64_t sub_100001E10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  int v5;
  int v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;

  v2 = a2;
  if (!(_DWORD)a2)
  {
    if (fchown(*(_DWORD *)(a1 + 4), 0x110u, 0x110u) == -1)
    {
      v8 = __error();
      _os_assumes_log(*v8);
    }
    if (fsync(*(_DWORD *)(a1 + 4)) == -1)
    {
      v9 = __error();
      _os_assumes_log(*v9);
    }
    v2 = renameat(*(_DWORD *)a1, (const char *)(a1 + 41), *(_DWORD *)a1, (const char *)(a1 + 8));
    if ((_DWORD)v2 == -1)
    {
      v10 = __error();
      _os_assumes_log(*v10);
      v2 = *__error();
    }
  }
  if ((*(_DWORD *)(a1 + 4) & 0x80000000) == 0)
  {
    if ((_DWORD)v2 && unlinkat(*(_DWORD *)a1, (const char *)(a1 + 41), 0) == -1)
    {
      v7 = __error();
      _os_assumes_log(*v7);
    }
    if (close(*(_DWORD *)(a1 + 4)) == -1)
    {
      v5 = *__error();
      result = *__error();
      if (v5 == 9)
      {
        qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10000C148 = result;
        __break(1u);
        goto LABEL_21;
      }
      _os_assumes_log(result);
    }
  }
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || close(*(_DWORD *)a1) != -1)
    return v2;
  v6 = *__error();
  result = *__error();
  if (v6 != 9)
  {
    _os_assumes_log(result);
    return v2;
  }
LABEL_21:
  qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10000C148 = result;
  __break(1u);
  return result;
}

void sub_100001FA8(_xpc_connection_s *a1, xpc_object_t xdict)
{
  __int128 v4;
  const char *string;
  const char *v6;
  const unsigned __int8 *uuid;
  unsigned __int8 *v8;
  __int128 v9;
  xpc_object_t array;
  void *v11;
  size_t v12;
  _QWORD *v13;
  xpc_object_t value;
  const void *data;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  DIR *v19;
  DIR *v20;
  void *v21;
  int v22;
  dirent *v23;
  uint64_t v24;
  int *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  unint64_t v33;
  uint64_t v34;
  size_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  int v40;
  int v41;
  BOOL v42;
  _OWORD *v43;
  void *v44;
  void *v45;
  __int128 v46;
  int v47;
  int v48;
  int *v49;
  char *v50;
  int *v51;
  _xpc_connection_s *v52;
  uint64_t v53;
  size_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  _OWORD v58[5];
  uuid_string_t out;
  size_t __b[128];
  char __str[1024];
  uuid_string_t v62;
  size_t v63;

  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&out[16] = v4;
  *(_OWORD *)out = v4;
  string = xpc_dictionary_get_string(xdict, "path");
  if (!string || (v6 = string, (uuid = xpc_dictionary_get_uuid(xdict, "uuid")) == 0))
  {
    v22 = 22;
    goto LABEL_50;
  }
  v8 = (unsigned __int8 *)uuid;
  v52 = a1;
  uuid_unparse(uuid, out);
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v58[3] = v9;
  v58[4] = v9;
  v58[1] = v9;
  v58[2] = v9;
  v58[0] = v9;
  array = xpc_dictionary_get_array(xdict, "sections");
  v11 = array;
  if (array)
  {
    if (xpc_array_get_count(array) == 5)
    {
      v12 = 0;
      v13 = (_QWORD *)v58 + 1;
      while (1)
      {
        value = xpc_array_get_value(v11, v12);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_data)
          break;
        memset(__str, 170, 16);
        data = xpc_array_get_data(v11, v12, (size_t *)&__str[8]);
        v16 = *(_QWORD *)&__str[8];
        *(v13 - 1) = data;
        *v13 = v16;
        ++v12;
        v13 += 2;
        if (v12 == 5)
          goto LABEL_8;
      }
    }
    goto LABEL_48;
  }
LABEL_8:
  if (!xpc_dictionary_get_BOOL(xdict, "ftab"))
  {
    v42 = xpc_dictionary_get_BOOL(xdict, "fake_uuid");
    if (v11)
      v43 = v58;
    else
      v43 = 0;
    __b[0] = 0xAAAAAAAAAAAAAAAALL;
    v44 = (void *)_os_trace_mmap_at(4294967294, v6, 0, __b);
    if (v44)
    {
      v45 = v44;
      if (__b[0] >> 31)
      {
        munmap(v44, __b[0]);
        v22 = 34;
      }
      else
      {
        *(_QWORD *)__str = _NSConcreteStackBlock;
        *(_QWORD *)&__str[8] = 0x40000000;
        *(_QWORD *)&__str[16] = sub_100001B6C;
        *(_QWORD *)&__str[24] = &unk_100008678;
        __str[56] = v42;
        *(_QWORD *)&__str[32] = v8;
        *(_QWORD *)&__str[40] = v43;
        *(_QWORD *)&__str[48] = v6;
        v47 = _os_trace_macho_for_each_slice(v44);
        if (munmap(v45, __b[0]) == -1)
        {
          v51 = __error();
          _os_assumes_log(*v51);
        }
        if (v47)
          v48 = v47;
        else
          v48 = 2;
        if (v47 == 89)
          v22 = 0;
        else
          v22 = v48;
      }
    }
    else
    {
      v22 = *__error();
    }
    goto LABEL_49;
  }
  v17 = xpc_dictionary_get_string(xdict, "role");
  if (!v17)
  {
LABEL_48:
    v22 = 22;
LABEL_49:
    a1 = v52;
    goto LABEL_50;
  }
  v18 = (uint64_t)v17;
  v54 = 0;
  v55 = 0;
  v53 = 0;
  memset(__b, 170, sizeof(__b));
  v19 = opendir("/private/var/tmp/FTABHarvest");
  if (!v19)
  {
    memset(__str, 170, sizeof(__str));
    v49 = __error();
    v50 = strerror(*v49);
    snprintf(__str, 0x400uLL, "Error opening FTAB harvesting folder %s", v50);
    sub_100004490((uint64_t)__str);
    v22 = 9;
    goto LABEL_69;
  }
  v20 = v19;
  v21 = 0;
  v22 = 0;
  while (1)
  {
    v23 = readdir(v20);
    if (!v23)
      break;
    v22 = 2;
    if ((v23->d_type | 2) == 0xA)
    {
      snprintf((char *)__b, 0x400uLL, "%s/%s", "/private/var/tmp/FTABHarvest", v23->d_name);
      v24 = _os_trace_mmap_at(4294967294, __b, 0, &v54);
      v21 = (void *)v24;
      if (v24)
      {
        if (v54 >> 31)
        {
          memset(__str, 170, sizeof(__str));
          snprintf(__str, 0x400uLL, "Invalid FTAB size 0x%zx", v54);
          sub_100004490((uint64_t)__str);
          munmap(v21, v54);
          v22 = 2;
        }
        else
        {
          v63 = v54;
          v57 = -1431655766;
          v56 = v24;
          if (v54 < 0x30)
            goto LABEL_22;
          if (!*(_DWORD *)(v24 + 4) || *(_QWORD *)(v24 + 32) != 0x62617466736F6B72)
            goto LABEL_19;
          v27 = v24 + 48;
          v28 = *(unsigned int *)(v24 + 40);
          if (16 * v28 + 48 > v54)
          {
LABEL_22:
            v22 = 22;
            goto LABEL_23;
          }
          if (!(_DWORD)v28)
          {
            v22 = 2;
            goto LABEL_23;
          }
          v30 = 0;
          while (2)
          {
            v31 = v27 + 16 * v30;
            v32 = *(unsigned int *)(v31 + 4);
            if (v54 >= v32 && (v33 = *(unsigned int *)(v31 + 8), v54 - v32 >= v33))
            {
              v34 = 0;
              v35 = v24 + v32;
              while (1)
              {
                v36 = dword_1000071D4[v34];
                if (v36 + 64 > v33)
                  goto LABEL_38;
                v37 = v35 + v36;
                if (*(_DWORD *)v37 == 1684632949)
                  break;
                if (++v34 == 8)
                  goto LABEL_38;
              }
              *(_OWORD *)__str = *(_OWORD *)(v37 + 16);
              if (*(_QWORD *)__str == *(_QWORD *)v8 && *(_QWORD *)&__str[8] == *((_QWORD *)v8 + 1))
              {
                v57 = *(_DWORD *)(v27 + 16 * v30);
                v39 = sub_1000043A0(v24, v54, "_osl", &v56, &v63);
                if (v39)
                {
                  v40 = v39;
                  memset(__str, 170, sizeof(__str));
                  snprintf(__str, 0x400uLL, "Error finding OS LOG file in FTAB 0x%x");
LABEL_45:
                  sub_100004490((uint64_t)__str);
                  v22 = v40;
                  goto LABEL_24;
                }
                v41 = sub_1000043A0(v56, v63, &v57, &v55, &v53);
                if (v41)
                {
                  v40 = v41;
                  memset(__str, 170, sizeof(__str));
                  snprintf(__str, 0x400uLL, "Error finding tag %.4s in OS LOG FTAB 0x%x");
                  goto LABEL_45;
                }
                closedir(v20);
                goto LABEL_72;
              }
LABEL_38:
              ++v30;
              v22 = 2;
              if (v30 != v28)
                continue;
            }
            else
            {
LABEL_19:
              v22 = 9;
            }
            break;
          }
LABEL_23:
          *(_QWORD *)&v62[29] = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)v62 = v29;
          *(_OWORD *)&v62[16] = v29;
          uuid_unparse(v8, v62);
          memset(__str, 170, sizeof(__str));
          snprintf(__str, 0x400uLL, "Error finding UUID %s in ftab 0x%x", v62, v22);
          sub_100004490((uint64_t)__str);
LABEL_24:
          munmap(v21, v54);
        }
      }
      else
      {
        memset(__str, 170, sizeof(__str));
        v25 = __error();
        v26 = strerror(*v25);
        snprintf(__str, 0x400uLL, "Error mapping FTAB: %s err: %s", (const char *)__b, v26);
        sub_100004490((uint64_t)__str);
        v22 = 2;
      }
    }
  }
  closedir(v20);
  if (v22)
  {
    *(_QWORD *)&v62[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v46 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v46 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v62 = v46;
    *(_OWORD *)&v62[16] = v46;
    uuid_unparse(v8, v62);
    memset(__str, 170, sizeof(__str));
    snprintf(__str, 0x400uLL, "Error finding OS LOG section for uuid: %s", v62);
    sub_100004490((uint64_t)__str);
    goto LABEL_69;
  }
LABEL_72:
  *(_OWORD *)v62 = xmmword_100007150;
  LODWORD(v63) = 1;
  HIDWORD(v63) = v53;
  *(_QWORD *)__str = v62;
  *(_QWORD *)&__str[8] = 16;
  *(_QWORD *)&__str[16] = &v63;
  *(_QWORD *)&__str[24] = 8;
  *(_QWORD *)&__str[32] = v55;
  *(_QWORD *)&__str[40] = v53;
  *(_QWORD *)&__str[48] = v6;
  *(_QWORD *)&__str[56] = strlen(v6) + 1;
  v22 = sub_100001D64(v8, 1u, (uint64_t)__str, 4);
  munmap(v21, v54);
  sub_10000623C(v18);
  if (v22)
  {
LABEL_69:
    memset(__str, 170, sizeof(__str));
    snprintf(__str, 0x400uLL, "Harvesting from ftab failed(uuid: %s, err: 0x%x)");
    goto LABEL_70;
  }
  memset(__str, 170, sizeof(__str));
  snprintf(__str, 0x400uLL, "Harvesting from ftab succeded: %s");
LABEL_70:
  sub_100004490((uint64_t)__str);
LABEL_50:
  sub_100002D44(a1, xdict, v22);
}

void sub_100002740(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  unsigned __int8 *v14;
  const void *boot_uuid;
  char *v16;
  int *v17;
  int *v18;
  int v19;
  int *v20;
  int *v21;
  int *v22;
  int v23;
  __int128 v24;
  uint64_t v25;
  char __str[1024];
  char __b[1024];

  memset(__b, 170, sizeof(__b));
  memset(__str, 170, sizeof(__str));
  sub_100002B9C(a1, a2 | 0x10, __b);
  LODWORD(v6) = mkpath_np(__b, 0x1EDu);
  if ((_DWORD)v6 && (_DWORD)v6 != 17)
  {
    v6 = (int)v6;
LABEL_36:
    _os_assumes_log(v6);
LABEL_37:
    *(_QWORD *)a3 = -1;
    return;
  }
  if (chown(__b, 0x110u, 0x110u) == -1)
    goto LABEL_33;
  while (1)
  {
    v7 = open(__b, 17826052);
    if ((_DWORD)v7 == -1)
    {
      v21 = __error();
      _os_assumes_log(*v21);
      __error();
      goto LABEL_37;
    }
    v8 = v7;
    if (qword_10000C1B8 != -1)
      dispatch_once(&qword_10000C1B8, &stru_1000089B8);
    if (byte_10000C1C0)
    {
      v25 = 0;
      v24 = xmmword_1000071F8;
      v23 = 4;
      v7 = fsetattrlist(v8, &v24, &v23, 4uLL, 0);
      if ((_DWORD)v7 == -1)
      {
LABEL_26:
        v17 = __error();
        _os_assumes_log(*v17);
        __error();
        goto LABEL_30;
      }
    }
    if (a2 - 1 < 2)
    {
      v9 = 1;
      v10 = (_BYTE *)(a3 + 8);
      do
      {
        *v10 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
        v11 = v10 + 2;
        v10[1] = a0123456789abcd[a1[v9++] & 0xF];
        v10 += 2;
      }
      while (v9 != 16);
      goto LABEL_16;
    }
    if (a2 != 3)
      break;
    v12 = 0;
    v13 = (_BYTE *)(a3 + 8);
    do
    {
      *v13 = a0123456789abcd[(unint64_t)a1[v12] >> 4];
      v11 = v13 + 2;
      v13[1] = a0123456789abcd[a1[v12++] & 0xF];
      v13 += 2;
    }
    while (v12 != 16);
LABEL_16:
    *v11 = 0;
    snprintf(__str, 0x400uLL, "%s/%s", __b, (const char *)(a3 + 8));
    __strlcat_chk(__str, ".XXXXXXXX", 1024, 1024);
    if (qword_10000C1B8 != -1)
      dispatch_once(&qword_10000C1B8, &stru_1000089B8);
    if (byte_10000C1C0)
      v14 = (unsigned __int8 *)mkstemp_dprotected_np(__str, 4, 0);
    else
      v14 = (unsigned __int8 *)mkostemp(__str, 0x1000000);
    a1 = v14;
    if ((_DWORD)v14 == -1)
      goto LABEL_26;
    if (a2 != 2
      || (boot_uuid = (const void *)_os_trace_get_boot_uuid(),
          fsetxattr((int)a1, "com.apple.uuiddb.boot-uuid", boot_uuid, 0x25uLL, 0, 0) != -1))
    {
      if (fchmod((int)a1, 0x1A4u) != -1)
      {
        *(_DWORD *)a3 = v8;
        *(_DWORD *)(a3 + 4) = (_DWORD)a1;
        v16 = strrchr(__str, 47);
        strcpy((char *)(a3 + 41), v16 + 1);
        return;
      }
    }
    v18 = __error();
    _os_assumes_log(*v18);
    __error();
    if (unlink(__str) == -1)
    {
      v22 = __error();
      _os_assumes_log(*v22);
    }
    if (close((int)a1) == -1)
    {
      a2 = *__error();
      v7 = *__error();
      if (a2 == 9)
        goto LABEL_41;
      _os_assumes_log(v7);
    }
LABEL_30:
    if (close(v8) != -1)
      goto LABEL_37;
    v19 = *__error();
    v6 = *__error();
    if (v19 != 9)
      goto LABEL_36;
    qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10000C148 = v6;
    __break(1u);
LABEL_33:
    v20 = __error();
    _os_assumes_log(*v20);
  }
  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
  qword_10000C148 = a2;
  __break(1u);
LABEL_41:
  qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10000C148 = v7;
  __break(1u);
}

uint64_t sub_100002B9C(unsigned __int8 *a1, unsigned int a2, char *__str)
{
  uint64_t result;
  char *v7;
  size_t v8;
  uint64_t v9;
  char *v10;

  if (qword_10000C1B0 != -1)
    dispatch_once(&qword_10000C1B0, &stru_100008978);
  result = snprintf(__str, 0x400uLL, "%s/", (const char *)qword_10000C1A8);
  v7 = &__str[(int)result];
  v8 = 1024 - (int)result;
  if (a2 - 17 < 2)
    return snprintf(v7, v8, "%02X", *a1);
  if (a2 != 3)
  {
    if (a2 == 19)
      return snprintf(v7, v8, "dsc");
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_10000C148 = a2;
    __break(1u);
    goto LABEL_13;
  }
  result = snprintf(v7, v8, "dsc");
  if ((int)result + 33 >= v8)
  {
LABEL_13:
    qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_10000C148 = v8;
    __break(1u);
    return result;
  }
  v9 = 0;
  v7[(int)result] = 47;
  v10 = &v7[(int)result + 1];
  do
  {
    *v10 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
    v10[1] = a0123456789abcd[a1[v9] & 0xF];
    v10 += 2;
    ++v9;
  }
  while (v9 != 16);
  *v10 = 0;
  return result;
}

void sub_100002D44(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply;
  void *v6;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v6 = reply;
    xpc_dictionary_set_int64(reply, "status", a3);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }
}

void sub_100002DAC()
{
  int v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSErrorDomain v7;
  NSErrorDomain v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v0 = dword_10000C090;
  if (dword_10000C090 != -1)
    goto LABEL_5;
  if (qword_10000C1B0 != -1)
    dispatch_once(&qword_10000C1B0, &stru_100008978);
  v0 = open((const char *)qword_10000C198, 0x100000);
  dword_10000C090 = v0;
  if ((v0 & 0x80000000) == 0)
  {
LABEL_5:
    v1 = openat(v0, "roles.plist", 256);
    if ((_DWORD)v1 == -1)
    {
      if (*__error() != 2)
        _os_assumes_log(0);
      goto LABEL_15;
    }
    v2 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", v1);
    v14 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readDataToEndOfFileAndReturnError:", &v14));
    v4 = v14;
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v2, "closeFile");

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 1, 0, 0));
      if (v6)
      {
        v13 = v6;
        if ((objc_msgSend(v6, "isNSArray") & 1) != 0)
          goto LABEL_17;
      }
      goto LABEL_16;
    }
    v7 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v8 = v7;
    if (v7 == NSCocoaErrorDomain)
    {
      v9 = objc_msgSend(v5, "code");

      if (v9 == (id)260)
      {
LABEL_14:
        objc_msgSend(v2, "closeFile");

LABEL_15:
        v6 = 0;
LABEL_16:
        v13 = objc_alloc_init((Class)NSArray);

LABEL_17:
        v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v13));
        v11 = (void *)qword_10000C158;
        qword_10000C158 = v10;

        return;
      }
    }
    else
    {

    }
    _os_assumes_log(0);
    goto LABEL_14;
  }
  v12 = *__error();
  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
  qword_10000C148 = v12;
  __break(1u);
}

void start()
{
  char v0[1024];

  os_trace_set_mode(256);
  sub_100004968();
  memset(&v0[20], 170, 0x3ECuLL);
  strcpy(v0, "Started logd_helper");
  sub_100004490((uint64_t)v0);
  sub_100003038();
  dispatch_main();
}

void sub_100003038()
{
  _xpc_connection_s *mach_service;

  qword_10000C160 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.logd_helper", 0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.logd_helper", (dispatch_queue_t)qword_10000C160, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100008580);
  xpc_connection_activate(mach_service);
  qword_10000C168 = (uint64_t)mach_service;
}

void sub_1000030A0(id a1, void *a2)
{
  xpc_type_t type;

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100003100((_xpc_connection_s *)a2);
  }
  else
  {
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_10000C148 = (uint64_t)type;
    __break(1u);
  }
}

void sub_100003100(_xpc_connection_s *a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000;
  v2[2] = sub_100001A60;
  v2[3] = &unk_1000085A0;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)qword_10000C160);
  xpc_connection_activate(a1);
}

void sub_1000031A0(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned __int8 *uuid;
  unsigned __int8 *v5;
  int v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    v5 = uuid;
    if (sub_1000065FC(uuid))
    {
      v6 = 0;
    }
    else
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2000000000;
      v11 = 2;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 0x40000000;
      v7[2] = sub_100005204;
      v7[3] = &unk_100008788;
      v7[4] = &v8;
      v7[5] = v5;
      dyld_for_each_installed_shared_cache(v7);
      v6 = *((_DWORD *)v9 + 6);
      _Block_object_dispose(&v8, 8);
    }
  }
  else
  {
    v6 = 22;
  }
  sub_100002D44(a1, xdict, v6);
}

void sub_1000032A0(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned __int8 *uuid;
  int v5;

  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
    v5 = sub_1000049B8(uuid);
  else
    v5 = 22;
  sub_100002D44(a1, xdict, v5);
}

void sub_1000032EC(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned __int8 *uuid;
  unsigned __int8 *v5;
  int v6;
  CFArrayRef v7;
  CFArrayRef v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  CFTypeID v11;
  unsigned int Count;
  vm_size_t v13;
  kern_return_t v14;
  vm_address_t v15;
  vm_address_t v16;
  char *v17;
  size_t v18;
  size_t v19;
  unsigned int v20;
  vm_address_t v21;
  CFStringRef *v22;
  unsigned int *v23;
  size_t v24;
  _DWORD *v25;
  size_t v26;
  int v27;
  unint64_t v28;
  int v29;
  BOOL v30;
  __int128 v31;
  int v32;
  unsigned int *v33;
  _QWORD *v34;
  unsigned int v35;
  CFStringRef *v36;
  uint64_t v37;
  size_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  const __CFArray *v42;
  unsigned int v43;
  uint64_t v44;
  vm_size_t v45;
  const __CFDictionary *v46;
  int v47;
  vm_address_t v48;
  uint64_t v49;
  char *__base;
  _QWORD context[11];
  unsigned int v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  vm_address_t address;
  _QWORD v62[4];
  _OWORD v63[5];
  int v64;
  char __b[1024];

  if (qword_10000C1D8 != -1)
    dispatch_once(&qword_10000C1D8, &stru_100008A38);
  if (!byte_10000C108 || (uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid")) == 0)
  {
    v6 = 22;
    goto LABEL_49;
  }
  v5 = uuid;
  if (sub_1000065FC(uuid))
  {
    v6 = 0;
LABEL_49:
    sub_100002D44(a1, xdict, v6);
    return;
  }
  address = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  v57 = 0;
  v58 = &v57;
  v59 = 0x2000000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2000000000;
  v56 = 0;
  v7 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10000C0A8, 9, &kCFTypeArrayCallBacks);
  if (!v7)
  {
    v6 = 88;
LABEL_48:
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    goto LABEL_49;
  }
  v8 = v7;
  v9 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0, v7);
  if (!v9)
  {
    v6 = 12;
LABEL_47:
    CFRelease(v8);
    goto LABEL_48;
  }
  v10 = v9;
  v11 = CFGetTypeID(v9);
  if (v11 != CFDictionaryGetTypeID())
    goto LABEL_45;
  Count = CFDictionaryGetCount(v10);
  v13 = (vm_page_size + 232 * Count + 15) & -(uint64_t)vm_page_size;
  v14 = vm_allocate(mach_task_self_, &address, v13, 1);
  if (v14)
  {
    _os_assumes_log(v14);
LABEL_45:
    v6 = 88;
    goto LABEL_46;
  }
  v15 = address;
  v16 = address;
  *(_QWORD *)address = 0x264736368;
  v17 = (char *)(v16 + 16);
  v43 = 5 * Count;
  context[0] = _NSConcreteStackBlock;
  context[1] = 0x40000000;
  context[2] = sub_100004D28;
  context[3] = &unk_1000086A0;
  v44 = Count;
  v52 = Count;
  v48 = v15;
  v49 = (uint64_t)&v17[120 * Count + 32 * Count];
  context[6] = v15;
  context[7] = v17;
  context[4] = &v53;
  context[5] = &v57;
  context[8] = v49 + 40 * Count;
  context[9] = v49;
  __base = &v17[120 * Count];
  context[10] = __base;
  CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)sub_1000051A4, context);
  if (*((_BYTE *)v54 + 24))
  {
    _os_assumes_log(1);
    v6 = 88;
    goto LABEL_31;
  }
  v45 = v13;
  v46 = v10;
  v18 = *(unsigned int *)(address + 8);
  v19 = *(unsigned int *)(address + 12);
  qsort_b(v17, v18, 0x18uLL, &stru_1000086E0);
  qsort_b(&v17[120 * Count + 40 * Count + 32 * Count], v18, 0x10uLL, &stru_100008720);
  v47 = 24 * v18 + 16 + 32 * v19;
  v20 = *((_DWORD *)v58 + 6) + v47;
  if ((_DWORD)v19)
  {
    v21 = v48 + 24 * v43;
    v22 = (CFStringRef *)(v21 + 32 * Count + 48);
    v23 = (unsigned int *)(v21 + 44);
    v24 = v19;
    while (1)
    {
      *v23 = v20;
      if (!CFStringGetCString(*v22, __b, 1024, 0x8000100u))
        break;
      v20 += strnlen(__b, 0x400uLL) + 1;
      v22 += 5;
      v23 += 8;
      if (!--v24)
        goto LABEL_17;
    }
    v6 = 2;
    goto LABEL_30;
  }
LABEL_17:
  v42 = v8;
  qsort_b(__base, v19, 0x20uLL, &stru_100008760);
  if ((_DWORD)v18)
  {
    v25 = (_DWORD *)(v48 + 32);
    v26 = v18;
    v27 = 24 * v18 + 16 + 32 * v19;
    while (1)
    {
      v28 = *(_QWORD *)(v49 + 40 * *v25 + 16);
      *(v25 - 2) = v27;
      *v25 = sub_1000066BC((uint64_t)__base, v19, v28);
      v29 = *(v25 - 1);
      v30 = __CFADD__(v27, v29);
      v27 += v29;
      if (v30)
        break;
      v25 += 6;
      if (!--v26)
        goto LABEL_26;
    }
    v6 = 88;
    v8 = v42;
    goto LABEL_30;
  }
  v27 = 32 * v19 + 16;
LABEL_26:
  if (*((_DWORD *)v58 + 6) + v47 != v27)
  {
    v41 = _os_assert_log(0);
    _os_crash(v41);
    __break(1u);
  }
  v64 = -1431655766;
  *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v63[3] = v31;
  v63[4] = v31;
  v63[1] = v31;
  v63[2] = v31;
  v63[0] = v31;
  sub_100002740(v5, 3u, (uint64_t)v63);
  v8 = v42;
  if (v32)
  {
    v6 = 0;
LABEL_30:
    v13 = v45;
    v10 = v46;
LABEL_31:
    vm_deallocate(mach_task_self_, address, v13);
LABEL_46:
    CFRelease(v10);
    goto LABEL_47;
  }
  v62[0] = address;
  v62[1] = 24 * v18 + 16;
  v62[2] = __base;
  v62[3] = 32 * v19;
  if (_os_trace_writev(DWORD1(v63[0]), v62, 2) == -1)
    goto LABEL_52;
  if ((_DWORD)v18)
  {
    v33 = (unsigned int *)(v48 + 28);
    v34 = (_QWORD *)(24 * v43 + 72 * v44 + v48 + 24);
    while (1)
    {
      v35 = *v33;
      v33 += 6;
      if (_os_trace_write(DWORD1(v63[0]), *v34, v35) == -1)
        break;
      v34 += 2;
      if (!--v18)
        goto LABEL_37;
    }
LABEL_52:
    v40 = __error();
    _os_assumes_log(*v40);
    v39 = *__error();
LABEL_53:
    v13 = v45;
    v10 = v46;
    goto LABEL_54;
  }
LABEL_37:
  if ((_DWORD)v19)
  {
    v36 = (CFStringRef *)(32 * v44 + 24 * v43 + v48 + 48);
    while (CFStringGetCString(*v36, __b, 1024, 0x8000100u))
    {
      v37 = DWORD1(v63[0]);
      v38 = strnlen(__b, 0x400uLL);
      if (_os_trace_write(v37, __b, v38 + 1) == -1)
        goto LABEL_52;
      v36 += 5;
      if (!--v19)
        goto LABEL_42;
    }
    v39 = 2;
    goto LABEL_53;
  }
LABEL_42:
  v13 = v45;
  v10 = v46;
  if (lseek(SDWORD1(v63[0]), 0, 1) == v20)
  {
    v39 = 0;
LABEL_54:
    v6 = sub_100001E10((uint64_t)v63, v39);
    goto LABEL_31;
  }
  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Unexpected resulting size";
  qword_10000C148 = v20;
  __break(1u);
}

void sub_100003900(_xpc_connection_s *a1, xpc_object_t xdict)
{
  __int128 v4;
  const unsigned __int8 *uuid;
  unsigned __int8 *v6;
  BOOL v7;
  const char *string;
  int v9;
  int v10;
  int v11;
  kern_return_t v12;
  kern_return_t v13;
  kern_return_t v14;
  kern_return_t v15;
  kern_return_t v16;
  kern_return_t v17;
  kern_return_t v18;
  kern_return_t v19;
  kern_return_t v20;
  mach_port_t connection;
  mach_vm_size_t size;
  mach_vm_address_t address;
  __int128 v24;
  int v25;
  int v26;
  uuid_string_t out;
  _QWORD v28[6];
  _OWORD __b[64];

  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v4;
  *(_OWORD *)&out[16] = v4;
  uuid = xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    v6 = (unsigned __int8 *)uuid;
    uuid_unparse(uuid, out);
    if (xpc_dictionary_get_string(xdict, "path"))
    {
      v7 = xpc_dictionary_get_BOOL(xdict, "coproc_free_only");
      string = xpc_dictionary_get_string(xdict, "role");
      size = 0xAAAAAAAAAAAAAAAALL;
      address = 0;
      connection = -1431655766;
      v9 = sub_100005F20(&connection, string, v6);
      if (v9)
      {
        v10 = v9;
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't connect to RTBuddyClient(returned: 0x%x, role: %s)", v10, string);
        sub_100004490((uint64_t)__b);
        v11 = 22;
        goto LABEL_15;
      }
      if (v7)
      {
        v11 = 0;
      }
      else
      {
        *(_QWORD *)&__b[0] = 0xAAAAAAAA00000000;
        *((_QWORD *)&__b[0] + 1) = &size;
        v14 = IOConnectCallMethod(connection, 0, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
        if (v14)
        {
          v15 = v14;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't get OSLog segment size(returned: 0x%x, role: %s)", v15, string);
          sub_100004490((uint64_t)__b);
          v11 = 22;
          goto LABEL_14;
        }
        v16 = mach_vm_allocate(mach_task_self_, &address, size, 1);
        if (v16)
        {
          v17 = v16;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't allocate memory for OSLog segment(returned: 0x%x, vm_size: 0x%llx, role: %s)", v17, size, string);
          sub_100004490((uint64_t)__b);
          v11 = 12;
          goto LABEL_14;
        }
        *(_QWORD *)&__b[0] = 0xAAAAAAAA00000001;
        *((_QWORD *)&__b[0] + 1) = address;
        v18 = IOConnectCallMethod(connection, 0, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
        if (v18)
        {
          v19 = v18;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't copy OSLogSegment to allocated memory(returned: 0x%x, addr: 0x%llx, role: %s)", v19, address, string);
          sub_100004490((uint64_t)__b);
          v11 = 22;
        }
        else
        {
          v24 = xmmword_100007150;
          v25 = 1;
          v26 = size;
          v28[0] = &v24;
          v28[1] = 24;
          v28[2] = address;
          v28[3] = size;
          v28[4] = string;
          v28[5] = strlen(string) + 1;
          v11 = sub_100001D64(v6, 1u, (uint64_t)v28, 3);
        }
        v20 = mach_vm_deallocate(mach_task_self_, address, size);
        if (v20)
        {
          qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: mach_vm_deallocate failed";
          qword_10000C148 = v20;
          __break(1u);
        }
      }
      __b[0] = xmmword_100007170;
      v12 = IOConnectCallMethod(connection, 0, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
      if (v12)
      {
        v13 = v12;
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "OSLog segment memory free failed(returned: 0x%x, role: %s)", v13, string);
        sub_100004490((uint64_t)__b);
      }
LABEL_14:
      IOServiceClose(connection);
      sub_10000623C((uint64_t)string);
      if (!v11)
      {
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "Harvesting from memory succeded: %s");
        goto LABEL_16;
      }
LABEL_15:
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Harvesting from memory failed(uuid: %s, err: 0x%x)");
LABEL_16:
      sub_100004490((uint64_t)__b);
      goto LABEL_17;
    }
  }
  v11 = 22;
LABEL_17:
  sub_100002D44(a1, xdict, v11);
}

void sub_100003D30(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned __int8 uint64;
  const char *v5;
  mode_t v6;
  int v7;
  BOOL v8;
  int *v9;
  int v10;
  int v11;
  FTS *v12;
  FTS *v13;
  FTSENT *v14;
  FTSENT *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int *v20;
  int *v21;
  int *v22;
  char __str[1024];
  char *v24[2];
  char __b[1024];

  uint64 = xpc_dictionary_get_uint64(xdict, "directory");
  switch(uint64)
  {
    case 0u:
      if (qword_10000C1B0 != -1)
        dispatch_once(&qword_10000C1B0, &stru_100008978);
      v5 = (const char *)qword_10000C198;
      if (qword_10000C198)
        goto LABEL_13;
      goto LABEL_21;
    case 1u:
      if (qword_10000C1B0 != -1)
        dispatch_once(&qword_10000C1B0, &stru_100008978);
      v5 = (const char *)qword_10000C1A0;
      if (!qword_10000C1A0)
        goto LABEL_21;
      goto LABEL_13;
    case 2u:
      if (qword_10000C1B0 != -1)
        dispatch_once(&qword_10000C1B0, &stru_100008978);
      v5 = (const char *)qword_10000C1A8;
      if (qword_10000C1A8)
        goto LABEL_13;
      goto LABEL_21;
    case 3u:
      v5 = (const char *)_os_trace_prefsdir_path();
      if (!v5)
        goto LABEL_21;
LABEL_13:
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Migrating: \"%s\"", v5);
      sub_100004490((uint64_t)__b);
      v6 = word_100007210[6 * uint64 + 4];
      v7 = mkpathat_np(-2, v5, v6);
      if (v7)
        v8 = v7 == 17;
      else
        v8 = 1;
      if (v8)
      {
        if (fchmodat(-2, v5, v6, 32))
        {
          memset(__b, 170, sizeof(__b));
          v9 = __error();
          snprintf(__b, 0x400uLL, "Failed to chmod \"%s\", error %d", v5, *v9);
          sub_100004490((uint64_t)__b);
          v10 = 1;
        }
        else
        {
          v10 = 0;
        }
        v24[0] = (char *)v5;
        v24[1] = 0;
        v12 = fts_open(v24, 2132, 0);
        if (v12)
        {
          v13 = v12;
          v14 = fts_read(v12);
          if (v14)
          {
            v15 = v14;
            do
            {
              switch(v15->fts_info)
              {
                case 2u:
                  v15->fts_errno = 62;
                  goto LABEL_31;
                case 4u:
                case 7u:
                case 0xAu:
LABEL_31:
                  memset(__b, 170, sizeof(__b));
                  snprintf(__b, 0x400uLL, "\"%s\", error %d");
                  goto LABEL_32;
                case 6u:
                case 8u:
                  goto LABEL_28;
                case 0xCu:
                case 0xDu:
                  memset(__b, 170, sizeof(__b));
                  snprintf(__b, 0x400uLL, "Warning: \"%s\" is a symlink", v15->fts_path);
                  sub_100004490((uint64_t)__b);
LABEL_28:
                  if (fchownat(-2, v15->fts_path, 0x110u, 0x110u, 32))
                  {
                    memset(__b, 170, sizeof(__b));
                    __error();
                    snprintf(__b, 0x400uLL, "Failed to chown \"%s\", error %d");
LABEL_32:
                    sub_100004490((uint64_t)__b);
                    ++v10;
                  }
                  break;
                default:
                  break;
              }
              v15 = fts_read(v13);
            }
            while (v15);
          }
          fts_close(v13);
          if (!v10)
          {
            memset(__b, 170, sizeof(__b));
            snprintf(__b, 0x400uLL, "%s/%s", v5, ".migrated");
            v16 = openat(-2, __b, 1538, 420);
            if (v16 < 0)
            {
              memset(__str, 170, sizeof(__str));
              v21 = __error();
              snprintf(__str, 0x400uLL, "Failed to create marker file \"%s\", error %d", __b, *v21);
              sub_100004490((uint64_t)__str);
            }
            else
            {
              v17 = v16;
              if (fchown(v16, 0x110u, 0x110u) == -1)
              {
                v22 = __error();
                _os_assumes_log(*v22);
              }
              if (close(v17) == -1)
              {
                v18 = *__error();
                v19 = *__error();
                if (v18 == 9)
                {
                  qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
                  qword_10000C148 = v19;
                  __break(1u);
                  JUMPOUT(0x100004234);
                }
                _os_assumes_log(v19);
                v20 = __error();
                _os_assumes_log(*v20);
              }
            }
          }
          v11 = 0;
        }
        else
        {
          v11 = *__error();
          memset(__b, 170, sizeof(__b));
          snprintf(__b, 0x400uLL, "Failed to open \"%s\", error %d", v5, v11);
          sub_100004490((uint64_t)__b);
        }
      }
      else
      {
        v11 = v7;
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "Failed to create \"%s\", error %d", v5, v11);
        sub_100004490((uint64_t)__b);
      }
      break;
    default:
LABEL_21:
      v11 = 22;
      break;
  }
  sub_100002D44(a1, xdict, v11);
}

void sub_100004274(_xpc_connection_s *a1, void *a2)
{
  sub_100002D44(a1, a2, 22);
}

void sub_10000427C(_xpc_connection_s *a1, void *a2)
{
  sub_100002D44(a1, a2, 22);
}

void sub_100004284()
{
  Block_layout *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v0 = &stru_100008938;
  v1 = (void *)qword_10000C158;
  if (!qword_10000C158)
  {
    sub_100002DAC();
    v1 = (void *)qword_10000C158;
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6)), "UTF8String");
        sub_10000647C(v7, (const char *)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v4);
  }

}

uint64_t sub_1000043A0(uint64_t a1, unint64_t a2, _DWORD *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _DWORD *i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  *a4 = 0;
  *a5 = 0;
  v5 = 22;
  if (a2 >= 0x30 && a1 && a3)
  {
    if (*(_DWORD *)(a1 + 4) && *(_QWORD *)(a1 + 32) == 0x62617466736F6B72)
    {
      v7 = *(unsigned int *)(a1 + 40);
      if (16 * v7 + 48 <= a2)
      {
        if (!(_DWORD)v7)
          return 2;
        v8 = 0;
        for (i = (_DWORD *)(a1 + 48); *i != *a3; i += 4)
        {
          ++v8;
          v5 = 2;
          if (v7 == v8)
            return v5;
        }
        v10 = a1 + 48 + 16 * v8;
        v11 = *(unsigned int *)(v10 + 4);
        if (a2 >= v11)
        {
          v12 = *(unsigned int *)(v10 + 8);
          if (a2 - v11 >= v12)
          {
            v5 = 0;
            *a4 = a1 + v11;
            *a5 = v12;
            return v5;
          }
        }
      }
      return 22;
    }
    else
    {
      return 9;
    }
  }
  return v5;
}

uint64_t sub_100004478(uint64_t a1)
{
  sub_100004490(a1);
  return 1;
}

void sub_100004490(uint64_t a1)
{
  _QWORD v2[5];

  if (qword_10000C170 != -1)
    dispatch_once_f(&qword_10000C170, 0, (dispatch_function_t)sub_10000455C);
  if (!dispatch_get_specific(off_10000C098))
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 0x40000000;
    v2[2] = sub_1000046D0;
    v2[3] = &unk_100008618;
    v2[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_10000C178, v2);
  }
}

int *sub_10000455C()
{
  int *result;
  uint64_t v1;
  uint64_t v2;

  asprintf((char **)&qword_10000C180, "com.apple.%s.log", "logd_helper");
  if (!qword_10000C180)
  {
    v1 = *__error();
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_10000C148 = v1;
    __break(1u);
LABEL_10:
    result = __error();
    v2 = *result;
    qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_10000C148 = v2;
    __break(1u);
    return result;
  }
  qword_10000C178 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_10000C180, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)qword_10000C178, off_10000C098, (void *)qword_10000C178, 0);
  if (qword_10000C1B0 != -1)
    dispatch_once(&qword_10000C1B0, &stru_100008978);
  asprintf((char **)&qword_10000C188, "%s/%s.0.log", (const char *)qword_10000C198, "logd_helper");
  if (qword_10000C1B0 != -1)
    dispatch_once(&qword_10000C1B0, &stru_100008978);
  result = (int *)asprintf((char **)&qword_10000C190, "%s/%s.1.log", (const char *)qword_10000C198, "logd_helper");
  if (!qword_10000C188 || !qword_10000C190)
    goto LABEL_10;
  return result;
}

uint64_t sub_1000046D0(uint64_t a1)
{
  const char *v1;
  __int128 v2;
  const char *v3;
  pid_t v4;
  uint64_t result;
  unsigned int v6;
  time_t v7;
  tm v8;
  char v9[8];
  _QWORD v10[3];
  char __b[1024];

  v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C178);
  memset(__b, 170, sizeof(__b));
  memset(v10, 170, 18);
  v8.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v9 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v8.tm_mon = v2;
  *(_OWORD *)&v8.tm_isdst = v2;
  *(_OWORD *)&v8.tm_sec = v2;
  v7 = time(0);
  localtime_r(&v7, &v8);
  strftime(v9, 0x1AuLL, "%F %T%z", &v8);
  v3 = getprogname();
  v4 = getpid();
  result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v9, v3, v4, v1);
  if ((int)result >= 1)
  {
    v6 = result;
    if (result >= 0x400)
    {
      __b[1022] = 10;
      v6 = 1023;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C178);
    sub_10000480C();
    result = dword_10000C0A0;
    if ((dword_10000C0A0 & 0x80000000) == 0)
    {
      _os_trace_write(dword_10000C0A0, __b, v6);
      return sub_100004854();
    }
  }
  return result;
}

void sub_10000480C()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C178);
  if (dword_10000C0A0 < 0)
  {
    sub_100004918();
    if ((dword_10000C0A0 & 0x80000000) == 0)
      sub_100004854();
  }
}

uint64_t sub_100004854()
{
  off_t v0;
  uint64_t result;
  std::error_code *v2;
  int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C178);
  v0 = lseek(dword_10000C0A0, 0, 2);
  result = fsync(dword_10000C0A0);
  if (v0 >= 0x100000)
  {
    if (close(dword_10000C0A0) != -1)
    {
LABEL_3:
      rename((const std::__fs::filesystem::path *)qword_10000C188, (const std::__fs::filesystem::path *)qword_10000C190, v2);
      return sub_100004918();
    }
    v3 = *__error();
    result = *__error();
    if (v3 != 9)
    {
      _os_assumes_log(result);
      goto LABEL_3;
    }
    qword_10000C118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10000C148 = result;
    __break(1u);
  }
  return result;
}

uint64_t sub_100004918()
{
  uint64_t result;

  result = open((const char *)qword_10000C188, 778, 420);
  dword_10000C0A0 = result;
  if ((result & 0x80000000) == 0)
    return fchown(result, 0x110u, 0x110u);
  return result;
}

void sub_100004968()
{
  if (qword_10000C170 != -1)
    dispatch_once_f(&qword_10000C170, 0, (dispatch_function_t)sub_10000455C);
  dispatch_sync((dispatch_queue_t)qword_10000C178, &stru_100008658);
}

uint64_t sub_1000049B8(unsigned __int8 *a1)
{
  char **v1;
  __int128 v3;
  CFArrayRef v4;
  CFArrayRef v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const void *Value;
  const void *v9;
  CFTypeID v10;
  const UInt8 *BytePtr;
  unint64_t Length;
  const __CFString *v13;
  const __CFString *v14;
  CFTypeID v15;
  const char *v16;
  uint64_t v17;
  const __CFData *v18;
  const __CFData *v19;
  CFTypeID v20;
  uint64_t v22;
  __int128 v23;
  _QWORD v24[2];
  const UInt8 *v25;
  unint64_t v26;
  const char *v27;
  size_t v28;
  utsname out;
  void *values[128];

  *(_QWORD *)&out.sysname[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out.sysname = v3;
  *(_OWORD *)&out.sysname[16] = v3;
  uuid_unparse(a1, out.sysname);
  values[0] = (void *)CFStringCreateWithCString(kCFAllocatorDefault, out.sysname, 0x8000100u);
  if (values[0])
  {
    v4 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 1, &kCFTypeArrayCallBacks);
    if (v4)
    {
      v5 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10000C0F0, 3, &kCFTypeArrayCallBacks);
      if (v5 && (v6 = (const __CFDictionary *)OSKextCopyLoadedKextInfoByUUID(v4, v5)) != 0)
      {
        v7 = v6;
        Value = CFDictionaryGetValue(v6, values[0]);
        v9 = Value;
        if (Value)
          CFRetain(Value);
        CFRelease(v7);
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
      v5 = 0;
    }
    if (values[0])
      CFRelease(values[0]);
    if (v4)
      CFRelease(v4);
    if (v5)
      CFRelease(v5);
    memset(values, 170, sizeof(values));
    if (v9)
    {
      v10 = CFGetTypeID(v9);
      if (v10 == CFDictionaryGetTypeID())
      {
        v1 = &selRef_UTF8String;
        if (qword_10000C1D8 == -1)
          goto LABEL_19;
      }
      else
      {
        v22 = _os_assert_log(0);
        _os_crash(v22);
        __break(1u);
      }
      dispatch_once(&qword_10000C1D8, &stru_100008A38);
LABEL_19:
      if (byte_10000C108)
      {
        BytePtr = 0;
        Length = 0;
      }
      else
      {
        v18 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("OSBundleLogStrings"));
        if (!v18)
          goto LABEL_29;
        v19 = v18;
        v20 = CFGetTypeID(v18);
        if (v20 != CFDataGetTypeID())
          goto LABEL_29;
        BytePtr = CFDataGetBytePtr(v19);
        Length = CFDataGetLength(v19);
      }
      v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("OSBundleExecutablePath"));
      if (v13)
      {
        v14 = v13;
        v15 = CFGetTypeID(v13);
        if (v15 != CFStringGetTypeID()
          || (v16 = (const char *)values, !CFStringGetCString(v14, (char *)values, 1024, 0x8000100u)))
        {
LABEL_29:
          v17 = 22;
          goto LABEL_41;
        }
      }
      else
      {
        memset(&out, 170, sizeof(out));
        if (uname(&out) || !strcasestr(out.version, "development"))
          v16 = "/kernel";
        else
          v16 = "/kernel.development";
      }
      v23 = xmmword_100007160;
      v24[0] = &v23;
      v24[1] = 16;
      v25 = 0;
      v26 = 0;
      v27 = v16;
      v28 = 0xAAAAAAAAAAAAAAAALL;
      v28 = strlen(v16) + 1;
      if (v1[59] != (char *)-1)
        dispatch_once(&qword_10000C1D8, &stru_100008A38);
      if (!byte_10000C108)
      {
        v17 = 22;
        if (!BytePtr || Length < 8)
          goto LABEL_41;
        v25 = BytePtr + 8;
        v26 = Length - 8;
        HIDWORD(v23) = *((_DWORD *)BytePtr + 1);
      }
      v17 = sub_100001D64(a1, 2u, (uint64_t)v24, 3);
LABEL_41:
      CFRelease(v9);
      return v17;
    }
  }
  return 2;
}

unint64_t sub_100004D28(unint64_t result, CFTypeRef cf, const void *a3)
{
  unint64_t v3;
  CFTypeID v5;
  CFTypeID v6;
  const __CFString *Value;
  const __CFString *v8;
  CFTypeID v9;
  const void *v10;
  CFTypeID TypeID;
  const __CFData *v12;
  const __CFData *v13;
  CFTypeID v14;
  const UInt8 *BytePtr;
  const void *v16;
  CFTypeID v17;
  const void *v18;
  CFTypeID v19;
  const void *v20;
  CFTypeID v21;
  const void *v22;
  CFTypeID v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  const unsigned __int8 *v39;
  _BYTE v40[1304];

  if (cf)
  {
    v3 = result;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
    {
      v5 = CFGetTypeID(cf);
      result = CFStringGetTypeID();
      if (a3)
      {
        if (v5 == result)
        {
          v6 = CFGetTypeID(a3);
          result = CFDictionaryGetTypeID();
          if (v6 == result)
          {
            Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleExecutablePath"));
            if (Value)
            {
              v8 = Value;
              v9 = CFGetTypeID(Value);
              result = CFStringGetTypeID();
              if (v9 != result)
                return result;
            }
            else
            {
              memset(&v40[24], 170, 0x500uLL);
              if (uname((utsname *)&v40[24]) || !strcasestr(&v40[792], "development"))
                v8 = CFSTR("/kernel");
              else
                v8 = CFSTR("/kernel.development");
            }
            result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleTextUUID"));
            if (result)
            {
              v10 = (const void *)result;
              TypeID = CFDataGetTypeID();
              result = CFGetTypeID(v10);
              if (TypeID == result)
              {
                result = CFDataGetLength((CFDataRef)v10);
                if (result == 16)
                {
                  v12 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleLogStrings"));
                  v13 = v12;
                  if (v12)
                  {
                    v14 = CFGetTypeID(v12);
                    if (v14 == CFDataGetTypeID())
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      result = CFDataGetLength(v13);
                      if (result < 8)
                        return result;
                      goto LABEL_22;
                    }
                    v13 = 0;
                  }
                  BytePtr = 0;
LABEL_22:
                  memset(v40, 170, 32);
                  result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleCacheLoadAddress"));
                  if (result)
                  {
                    v16 = (const void *)result;
                    v17 = CFNumberGetTypeID();
                    result = CFGetTypeID(v16);
                    if (v17 == result)
                    {
                      result = CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt64Type, &v40[24]);
                      if ((_DWORD)result)
                      {
                        result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleLoadAddress"));
                        if (result)
                        {
                          v18 = (const void *)result;
                          v19 = CFNumberGetTypeID();
                          result = CFGetTypeID(v18);
                          if (v19 == result)
                          {
                            result = CFNumberGetValue((CFNumberRef)v18, kCFNumberSInt64Type, &v40[16]);
                            if ((_DWORD)result)
                            {
                              result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleExecLoadAddress"));
                              if (result)
                              {
                                v20 = (const void *)result;
                                v21 = CFNumberGetTypeID();
                                result = CFGetTypeID(v20);
                                if (v21 == result)
                                {
                                  result = CFNumberGetValue((CFNumberRef)v20, kCFNumberSInt64Type, &v40[8]);
                                  if ((_DWORD)result)
                                  {
                                    result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleExecLoadSize"));
                                    if (result)
                                    {
                                      v22 = (const void *)result;
                                      v23 = CFNumberGetTypeID();
                                      result = CFGetTypeID(v22);
                                      if (v23 == result)
                                      {
                                        result = CFNumberGetValue((CFNumberRef)v22, kCFNumberSInt64Type, v40);
                                        if ((_DWORD)result)
                                        {
                                          if (*(_QWORD *)&v40[16] && *(_QWORD *)&v40[8])
                                          {
                                            result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("OSBundleKextsInKernelText"));
                                            if (result)
                                              *(_QWORD *)v40 = 0;
                                            v24 = *(_QWORD *)(v3 + 48);
                                            v25 = *(unsigned int *)(v24 + 12);
                                            if (v25 >= *(_DWORD *)(v3 + 88))
                                            {
LABEL_48:
                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = 1;
                                            }
                                            else
                                            {
                                              v26 = *(_DWORD *)(v24 + 8);
                                              if (BytePtr)
                                              {
                                                v27 = *((unsigned int *)BytePtr + 1);
                                                if ((_DWORD)v27)
                                                {
                                                  v28 = 0;
                                                  v29 = (uint64_t)&BytePtr[8 * v27 + 8];
                                                  v30 = (unsigned int *)(BytePtr + 12);
                                                  do
                                                  {
                                                    v31 = *v30;
                                                    if (*v30)
                                                    {
                                                      v32 = *(_QWORD *)(v3 + 56) + 24 * v26;
                                                      *(_DWORD *)(v32 + 16) = v25;
                                                      *(_QWORD *)v32 = *(_QWORD *)&v40[16]
                                                                     + *(v30 - 1)
                                                                     - *(_QWORD *)&v40[24];
                                                      *(_DWORD *)(v32 + 12) = v31;
                                                      v33 = *(_QWORD *)(*(_QWORD *)(v3 + 40) + 8);
                                                      v34 = *(_DWORD *)(v33 + 24);
                                                      *(_DWORD *)(v33 + 24) = v34 + v31;
                                                      if (__CFADD__(v34, v31))
                                                        goto LABEL_48;
                                                      *(_QWORD *)(*(_QWORD *)(v3 + 64) + 16 * v26 + 8) = v29;
                                                      *(_QWORD *)(*(_QWORD *)(v3 + 64) + 16 * v26) = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 24 * v26);
                                                      v29 += *v30;
                                                      ++v26;
                                                      v27 = *((unsigned int *)BytePtr + 1);
                                                    }
                                                    ++v28;
                                                    v30 += 2;
                                                  }
                                                  while (v28 < v27);
                                                  v24 = *(_QWORD *)(v3 + 48);
                                                }
                                              }
                                              *(_DWORD *)(v24 + 8) = v26;
                                              *(_QWORD *)(*(_QWORD *)(v3 + 72) + 40 * v25 + 24) = v13;
                                              *(_QWORD *)(*(_QWORD *)(v3 + 72) + 40 * v25 + 32) = v8;
                                              v35 = *(_QWORD *)(v3 + 72) + 40 * v25;
                                              *(_QWORD *)(v35 + 8) = *(_QWORD *)&v40[16] - *(_QWORD *)&v40[24];
                                              v36 = *(_QWORD *)&v40[8] - *(_QWORD *)&v40[24];
                                              *(_QWORD *)(v35 + 16) = *(_QWORD *)&v40[8] - *(_QWORD *)&v40[24];
                                              v37 = *(_QWORD *)(v3 + 80) + 32 * v25;
                                              *(_QWORD *)v37 = v36;
                                              *(_DWORD *)(v37 + 8) = *(_DWORD *)v40;
                                              v38 = (unsigned __int8 *)(v37 + 12);
                                              v39 = CFDataGetBytePtr((CFDataRef)v10);
                                              uuid_copy(v38, v39);
                                              ++*(_DWORD *)(*(_QWORD *)(v3 + 48) + 12);
                                              return sub_1000049B8((unsigned __int8 *)(*(_QWORD *)(v3 + 80)
                                                                                     + 32 * v25
                                                                                     + 12));
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
    }
  }
  return result;
}

uint64_t sub_1000051A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

int sub_1000051BC(id a1, const void *a2, const void *a3)
{
  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return -1;
  else
    return *(_QWORD *)a2 != *(_QWORD *)a3;
}

int sub_1000051D4(id a1, const void *a2, const void *a3)
{
  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return -1;
  else
    return *(_QWORD *)a2 != *(_QWORD *)a3;
}

int sub_1000051EC(id a1, const void *a2, const void *a3)
{
  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return -1;
  else
    return *(_QWORD *)a2 != *(_QWORD *)a3;
}

void sub_100005204(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  __int128 v5;
  vm_size_t v6;
  kern_return_t v7;
  vm_address_t v8;
  vm_address_t v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t base_address;
  size_t v14;
  size_t v15;
  int v16;
  unsigned int v17;
  unsigned int *v18;
  int *v19;
  size_t v20;
  int v21;
  _DWORD *v22;
  int v23;
  unint64_t v24;
  int v25;
  BOOL v26;
  __int128 v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  void **v31;
  void **v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  void *v36;
  int v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  vm_size_t v41;
  uint64_t v42;
  _QWORD v43[11];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;
  vm_address_t address;
  _QWORD __b[128];
  uuid_string_t out;
  unsigned __int8 uu[16];
  vm_address_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  int v69;
  _QWORD v70[2];

  memset(uu, 170, sizeof(uu));
  dyld_shared_cache_copy_uuid(a2, uu);
  v4 = *(_QWORD **)(a1 + 40);
  if (*v4 == *(_QWORD *)uu && v4[1] == *(_QWORD *)&uu[8])
  {
    *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&out[16] = v5;
    *(_OWORD *)out = v5;
    uuid_unparse(uu, out);
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Harvesting: %s", out);
    sub_100004490((uint64_t)__b);
    address = 0xAAAAAAAAAAAAAAAALL;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2000000000;
    v55 = 0;
    v6 = (vm_page_size + 1760015) & -(uint64_t)vm_page_size;
    v7 = vm_allocate(mach_task_self_, &address, v6, 1);
    if (v7)
    {
      _os_assumes_log(v7);
      v37 = 12;
LABEL_34:
      _Block_object_dispose(&v52, 8);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v37;
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Harvest Complete for %s: %d", out, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      sub_100004490((uint64_t)__b);
      return;
    }
    v8 = address;
    v9 = address;
    *(_QWORD *)address = 0x264736368;
    v10 = (void *)(v9 + 16);
    v11 = (void **)(v8 + 1520016);
    v48 = 0;
    v49 = &v48;
    v50 = 0x2000000000;
    v51 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2000000000;
    v47 = 0;
    v12 = v8 + 1200016;
    base_address = dyld_shared_cache_get_base_address(a2);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 0x40000000;
    v43[2] = sub_1000057D8;
    v43[3] = &unk_100008800;
    v43[6] = address;
    v43[7] = base_address;
    v43[4] = &v44;
    v43[5] = &v48;
    v43[8] = v10;
    v43[9] = v8 + 1520016;
    v43[10] = v8 + 1200016;
    dyld_shared_cache_for_each_image(a2, v43);
    v14 = *(unsigned int *)(address + 12);
    if (*((_DWORD *)v53 + 6) || *((_BYTE *)v45 + 24))
    {
      _os_assumes_log(1);
      v35 = 88;
      goto LABEL_30;
    }
    v42 = a1;
    v15 = *(unsigned int *)(address + 8);
    v40 = 24 * v15 + 16;
    v16 = v40 + 32 * v14;
    qsort_b(v10, v15, 0x18uLL, &stru_100008840);
    v17 = *((_DWORD *)v49 + 6) + v16;
    if ((_DWORD)v14)
    {
      v18 = (unsigned int *)(v8 + 1200044);
      v19 = (int *)(v8 + 1520024);
      v20 = v14;
      do
      {
        *v18 = v17;
        v18 += 8;
        v21 = *v19;
        v19 += 6;
        v17 += v21 + 1;
        --v20;
      }
      while (v20);
    }
    v41 = v6;
    qsort_b((void *)(v8 + 1200016), v14, 0x20uLL, &stru_100008880);
    if ((_DWORD)v15)
    {
      v22 = (_DWORD *)(v8 + 32);
      v23 = v40 + 32 * v14;
      while (1)
      {
        v24 = (unint64_t)v11[3 * *v22 + 2];
        *(v22 - 2) += v16;
        *v22 = sub_1000066BC(v12, v14, v24);
        v25 = *(v22 - 1);
        v26 = __CFADD__(v23, v25);
        v23 += v25;
        if (v26)
          break;
        v22 += 6;
        if (!--v15)
          goto LABEL_15;
      }
      v35 = 88;
      v6 = v41;
      a1 = v42;
      goto LABEL_30;
    }
    v23 = v40 + 32 * v14;
LABEL_15:
    if (*((_DWORD *)v49 + 6) + v16 != v23)
    {
      v39 = _os_assert_log(0);
      _os_crash(v39);
      __break(1u);
    }
    v70[0] = 0xAAAAAAAAAAAAAAAALL;
    v70[1] = 0xAAAAAAAAAAAAAAAALL;
    dyld_shared_cache_copy_uuid(a2, v70);
    v69 = -1431655766;
    *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v67 = v27;
    v68 = v27;
    v65 = v27;
    v66 = v27;
    v64 = v27;
    sub_100002740((unsigned __int8 *)v70, 3u, (uint64_t)&v64);
    v6 = v41;
    a1 = v42;
    if (v28)
      goto LABEL_31;
    v60 = address;
    v61 = v40;
    v62 = v12;
    v63 = 32 * v14;
    if (_os_trace_writev(DWORD1(v64), &v60, 2) != -1)
    {
      __b[1] = 0x40000000;
      *(_OWORD *)&__b[9] = v66;
      *(_OWORD *)&__b[11] = v67;
      *(_OWORD *)&__b[13] = v68;
      *(_OWORD *)&__b[5] = v64;
      __b[0] = _NSConcreteStackBlock;
      __b[2] = sub_100005AC4;
      __b[3] = &unk_1000088F8;
      __b[4] = &v52;
      LODWORD(__b[15]) = v69;
      *(_OWORD *)&__b[7] = v65;
      dyld_shared_cache_for_each_image(a2, __b);
      v29 = *((unsigned int *)v53 + 6);
      if ((_DWORD)v29)
      {
LABEL_28:
        v35 = sub_100001E10((uint64_t)&v64, v29);
LABEL_30:
        *((_DWORD *)v53 + 6) = v35;
LABEL_31:
        if ((_DWORD)v14)
        {
          do
          {
            v36 = *v11;
            v11 += 3;
            free(v36);
            --v14;
          }
          while (v14);
        }
        vm_deallocate(mach_task_self_, address, v6);
        v37 = *((_DWORD *)v53 + 6);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        goto LABEL_34;
      }
      if (!(_DWORD)v14)
      {
LABEL_26:
        if (lseek(SDWORD1(v64), 0, 1) != v17)
        {
          qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: Unexpected resulting size";
          qword_10000C148 = v17;
          __break(1u);
          return;
        }
        v29 = *((unsigned int *)v53 + 6);
        goto LABEL_28;
      }
      v30 = 1;
      while (1)
      {
        v31 = &v11[3 * v30 - 3];
        v60 = (vm_address_t)*v31;
        v61 = (*((_DWORD *)v31 + 2) + 1);
        if (v30 >= v14)
        {
          v33 = 1;
        }
        else
        {
          v32 = &v11[3 * v30];
          v62 = (uint64_t)*v32;
          v63 = (*((_DWORD *)v32 + 2) + 1);
          v33 = 2;
        }
        if (_os_trace_writev(DWORD1(v64), &v60, v33) == -1)
          break;
        v34 = v30 + 1;
        v30 += 2;
        if (v34 >= v14)
          goto LABEL_26;
      }
    }
    v38 = __error();
    _os_assumes_log(*v38);
    v29 = *__error();
    *((_DWORD *)v53 + 6) = v29;
    goto LABEL_28;
  }
}

void sub_1000057D8(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *installname;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[9];
  int v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uuid_t uu;
  char v30[1032];

  v2 = a1[4];
  if (!*(_BYTE *)(*(_QWORD *)(v2 + 8) + 24))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2000000000;
    v28 = -1431655766;
    v4 = a1[6];
    v28 = *(_DWORD *)(v4 + 8);
    v5 = *(unsigned int *)(v4 + 12);
    if (v5 >> 4 < 0x271)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2000000000;
      v24 = 0;
      v17 = 0;
      v18 = &v17;
      v19 = 0x2000000000;
      v20 = 0;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 0x40000000;
      v16[2] = sub_100005D68;
      v16[3] = &unk_1000087B0;
      v7 = a1[7];
      v16[4] = v2;
      v16[5] = &v21;
      v16[6] = &v17;
      v16[7] = v7;
      dyld_image_for_each_segment_info(a2, v16);
      v14[0] = _NSConcreteStackBlock;
      v14[2] = sub_100005DEC;
      v14[3] = &unk_1000087D8;
      v8 = a1[5];
      v14[4] = a1[4];
      v14[5] = &v25;
      v9 = a1[8];
      v14[7] = a1[7];
      v14[8] = v9;
      v14[1] = 0x40000000;
      v15 = v5;
      v14[6] = v8;
      dyld_image_for_each_section_info(a2, v14);
      *(_DWORD *)(a1[6] + 8) = *((_DWORD *)v26 + 6);
      installname = (const char *)dyld_image_get_installname(a2);
      if (!installname)
      {
        memset(&v30[28], 170, 0x3E4uLL);
        strcpy(v30, "Warning: missing image path");
        sub_100004490((uint64_t)v30);
        installname = "<missing image path>";
      }
      memset(uu, 170, sizeof(uu));
      if ((dyld_image_copy_uuid(a2, uu) & 1) == 0)
      {
        memset(&v30[28], 170, 0x3E4uLL);
        strcpy(v30, "Warning: missing image uuid");
        sub_100004490((uint64_t)v30);
        uuid_clear(uu);
      }
      *(_QWORD *)(a1[9] + 24 * v5) = _os_trace_strdup(installname);
      v11 = strlen(installname);
      v12 = a1[9] + 24 * v5;
      *(_DWORD *)(v12 + 8) = v11;
      *(_QWORD *)(v12 + 16) = v22[3];
      v13 = a1[10] + 32 * v5;
      *(_QWORD *)v13 = v22[3];
      *(_DWORD *)(v13 + 8) = v18[3];
      *(_OWORD *)(v13 + 12) = *(_OWORD *)uu;
      ++*(_DWORD *)(a1[6] + 12);
      _Block_object_dispose(&v17, 8);
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      memset(&v30[37], 170, 0x3DBuLL);
      strcpy(v30, "Exceeded LOGD_HELPER_MAX_IMAGE_COUNT");
      sub_100004490((uint64_t)v30);
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    }
    _Block_object_dispose(&v25, 8);
  }
}

uint64_t sub_100005AC4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  _QWORD v5[6];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  int v11;

  v2 = *(_QWORD *)(result + 32);
  if (!*(_DWORD *)(*(_QWORD *)(v2 + 8) + 24))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v5[2] = sub_100005B80;
    v5[3] = &unk_1000088D0;
    v3 = *(_OWORD *)(result + 88);
    v8 = *(_OWORD *)(result + 72);
    v9 = v3;
    v10 = *(_OWORD *)(result + 104);
    v11 = *(_DWORD *)(result + 120);
    v4 = *(_OWORD *)(result + 56);
    v6 = *(_OWORD *)(result + 40);
    v7 = v4;
    v5[4] = v2;
    v5[5] = a2;
    return dyld_image_for_each_section_info(a2, v5);
  }
  return result;
}

uint64_t sub_100005B80(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t result;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int v16;

  result = sub_100005C58(a2, a3);
  if ((_DWORD)result)
  {
    v10[1] = 0x40000000;
    v7 = *(_OWORD *)(a1 + 96);
    v13 = *(_OWORD *)(a1 + 80);
    v14 = v7;
    v15 = *(_OWORD *)(a1 + 112);
    v8 = *(_OWORD *)(a1 + 64);
    v11 = *(_OWORD *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[2] = sub_100005CE4;
    v10[3] = &unk_1000088A8;
    v16 = *(_DWORD *)(a1 + 128);
    v12 = v8;
    v9 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    return dyld_image_content_for_section(v9, a2, a3, v10);
  }
  return result;
}

BOOL sub_100005C58(const char *a1, const char *a2)
{
  _BOOL8 result;
  uint64_t v5;
  int v6;
  BOOL v7;

  if (strcmp(a1, "__TEXT") && strcmp(a1, "__CTF"))
    return 0;
  v5 = 0;
  do
  {
    v6 = strcmp(a2, &_os_trace_sect_names[v5]);
    result = v6 == 0;
    if (!v6)
      break;
    v7 = v5 == 64;
    v5 += 16;
  }
  while (!v7);
  return result;
}

int *sub_100005CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *result;
  int *v6;

  result = (int *)_os_trace_write(*(unsigned int *)(a1 + 44), a2, a4);
  if (result == (int *)-1)
  {
    v6 = __error();
    _os_assumes_log(*v6);
    result = __error();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *result;
  }
  return result;
}

int sub_100005D38(id a1, const void *a2, const void *a3)
{
  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return -1;
  else
    return *(_QWORD *)a2 != *(_QWORD *)a3;
}

int sub_100005D50(id a1, const void *a2, const void *a3)
{
  if (*(_QWORD *)a2 < *(_QWORD *)a3)
    return -1;
  else
    return *(_QWORD *)a2 != *(_QWORD *)a3;
}

uint64_t sub_100005D68(_QWORD *a1, char *__s1, unint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  result = strcmp(__s1, "__TEXT");
  if (!(_DWORD)result)
  {
    v8 = a1[7];
    v9 = a3 >= v8;
    v10 = a3 - v8;
    if (v9)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v10;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
    }
    else
    {
      result = _os_assumes_log(0);
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t sub_100005DEC(uint64_t a1, const char *a2, const char *a3, unint64_t a4, uint64_t a5)
{
  uint64_t result;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  result = sub_100005C58(a2, a3);
  if ((_DWORD)result)
  {
    v9 = *(_QWORD *)(a1 + 56);
    v10 = a4 >= v9;
    v11 = a4 - v9;
    if (v10)
    {
      v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v12 >> 4 >= 0xC35)
      {
        v17 = _os_assert_log(0);
        result = _os_crash(v17);
        __break(1u);
      }
      else
      {
        v13 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)(v13 + 24 * v12 + 16) = *(_DWORD *)(a1 + 72);
        *(_QWORD *)(v13 + 24 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = v11;
        *(_DWORD *)(v13 + 24 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 8) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)(v13 + 24 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 12) = a5;
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(unsigned int *)(v14 + 24);
        v10 = __CFADD__(v15, a5);
        v16 = v15 + a5;
        *(_DWORD *)(v14 + 24) = v16;
        if (v10 || HIDWORD(v16))
        {
          result = _os_assumes_log(1);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        }
        else
        {
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        }
      }
    }
    else
    {
      result = _os_assumes_log(0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t sub_100005F20(io_connect_t *a1, const char *a2, const unsigned __int8 *a3)
{
  __CFDictionary *Mutable;
  CFStringRef v7;
  __CFDictionary *v8;
  uint64_t MatchingServices;
  uint64_t v10;
  io_service_t v11;
  io_object_t v12;
  __int128 v13;
  mach_port_t v14;
  kern_return_t v15;
  kern_return_t v16;
  io_iterator_t existing;
  uuid_string_t out;
  _QWORD __b[128];

  existing = -1431655766;
  memset(__b, 170, sizeof(__b));
  snprintf((char *)__b, 0x400uLL, "IOP connect to coproc %s\n", a2);
  sub_100004490((uint64_t)__b);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v7 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  CFDictionaryAddValue(Mutable, CFSTR("role"), v7);
  v8 = IOServiceMatching("RTBuddy");
  CFDictionaryAddValue(v8, CFSTR("IOPropertyMatch"), Mutable);
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v8, &existing);
  if ((_DWORD)MatchingServices)
  {
    v10 = MatchingServices;
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "IOServiceGetMatchingServices returned 0x%08X\n", v10);
    sub_100004490((uint64_t)__b);
  }
  else
  {
    v11 = IOIteratorNext(existing);
    if (v11)
    {
      v12 = v11;
      v10 = IOServiceOpen(v11, mach_task_self_, 0, a1);
      if ((_DWORD)v10)
      {
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "IOServiceOpen returned 0x%08X\n", v10);
        sub_100004490((uint64_t)__b);
      }
      if (a3)
      {
        *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)out = v13;
        *(_OWORD *)&out[16] = v13;
        uuid_unparse(a3, out);
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "IOP connect to subrole uuid %s \n", out);
        sub_100004490((uint64_t)__b);
        v14 = *a1;
        __b[0] = 0xAAAAAAAAAAAAAAAALL;
        __b[1] = 0xAAAAAAAAAAAAAAAALL;
        uuid_copy((unsigned __int8 *)__b, a3);
        v15 = IOConnectCallMethod(v14, 2u, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
        if (v15)
        {
          v16 = v15;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "attach to firmware role using uuid returned 0x%08X\n", v16);
          sub_100004490((uint64_t)__b);
        }
      }
      IOObjectRelease(v12);
    }
    else
    {
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Coprocessor \"%s\" not found.\n", a2);
      sub_100004490((uint64_t)__b);
      v10 = 4;
    }
    IOObjectRelease(existing);
  }
  CFRelease(Mutable);
  CFRelease(CFSTR("IOPropertyMatch"));
  CFRelease(CFSTR("role"));
  CFRelease(v7);
  return v10;
}

void sub_10000623C(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int *v7;
  int *v8;
  uint64_t v9;
  id v10;
  char __str[8];
  _QWORD v12[3];

  if (!qword_10000C158)
    sub_100002DAC();
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  if ((objc_msgSend((id)qword_10000C158, "containsObject:") & 1) != 0)
    goto LABEL_13;
  objc_msgSend((id)qword_10000C158, "addObject:", v10);
  if (dword_10000C090 != -1)
    goto LABEL_8;
  if (qword_10000C1B0 != -1)
    dispatch_once(&qword_10000C1B0, &stru_100008978);
  dword_10000C090 = open((const char *)qword_10000C198, 0x100000);
  if ((dword_10000C090 & 0x80000000) == 0)
  {
LABEL_8:
    memset(v12, 170, 22);
    *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C158, "allObjects"));
    snprintf(__str, 0x1EuLL, "%s.tmp", "roles.plist");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v2, 200, 0, 0));

    v4 = openat(dword_10000C090, __str, 1794, 420);
    if ((_DWORD)v4 == -1)
    {
      v7 = __error();
      _os_assumes_log(*v7);
    }
    else
    {
      v5 = v4;
      fchown(v4, 0x110u, 0x110u);
      v6 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", v5);
      objc_msgSend(v6, "writeData:error:", v3, 0);
      objc_msgSend(v6, "synchronizeAndReturnError:", 0);
      objc_msgSend(v6, "closeAndReturnError:", 0);
      if (renameat(dword_10000C090, __str, dword_10000C090, "roles.plist") == -1)
      {
        v8 = __error();
        _os_assumes_log(*v8);
      }

    }
LABEL_13:

    return;
  }
  v9 = *__error();
  qword_10000C118 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
  qword_10000C148 = v9;
  __break(1u);
}

void sub_10000647C(id a1, const char *a2)
{
  mach_port_t connection;
  __int128 inputStruct;

  connection = -1431655766;
  if (!sub_100005F20(&connection, a2, 0))
  {
    inputStruct = xmmword_100007180;
    IOConnectCallMethod(connection, 0, 0, 0, &inputStruct, 0x10uLL, 0, 0, 0, 0);
    IOServiceClose(connection);
  }
}

void sub_100006518(id a1)
{
  qword_10000C198 = (uint64_t)"/private/var/db/diagnostics";
  qword_10000C1A0 = (uint64_t)"/private/var/db/diagnostics/timesync";
  qword_10000C1A8 = (uint64_t)"/private/var/db/uuidtext";
}

void sub_10000654C(id a1)
{
  byte_10000C1C0 = MKBDeviceFormattedForContentProtection(a1) == 1;
}

void sub_100006570(id a1)
{
  uint64_t v1;
  int v2;

  v1 = getpid();
  v2 = SANDBOX_CHECK_NO_REPORT;
  if (qword_10000C1B0 != -1)
    dispatch_once(&qword_10000C1B0, &stru_100008978);
  byte_10000C1D0 = sandbox_check(v1, "file-read-data", v2 | 1u) == 0;
}

BOOL sub_1000065FC(unsigned __int8 *a1)
{
  char __b[1024];

  if (qword_10000C1C8 != -1)
    dispatch_once(&qword_10000C1C8, &stru_1000089F8);
  if (!byte_10000C1D0)
    return 0;
  memset(__b, 170, sizeof(__b));
  sub_100002B9C(a1, 3u, __b);
  return access(__b, 0) == 0;
}

uint64_t sub_1000066BC(uint64_t a1, unsigned int a2, unint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  if (!a2)
    return 0xFFFFFFFFLL;
  v3 = 0;
  do
  {
    v4 = (a2 + v3) >> 1;
    v5 = *(_QWORD *)(a1 + 32 * v4);
    v6 = a3 >= v5;
    v7 = a3 - v5;
    if (v6)
    {
      if (v7 < *(unsigned int *)(a1 + 32 * v4 + 8))
        return v4;
      v3 = v4 + 1;
    }
    else
    {
      a2 = (a2 + v3) >> 1;
    }
  }
  while (v3 < a2);
  v4 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v4)
    return 0xFFFFFFFFLL;
  return v4;
}

void sub_100006714(id a1)
{
  size_t v1;
  char __b[1024];

  memset(__b, 170, sizeof(__b));
  v1 = 1024;
  byte_10000C108 = sysctlbyname("kern.filesetuuid", __b, &v1, 0, 0) != 0;
  if (!sysctlbyname("kern.bootargs", __b, &v1, 0, 0))
  {
    if (strstr(__b, "libtrace_kic=0"))
      byte_10000C108 = 0;
    if (strstr(__b, "libtrace_kic=1"))
      byte_10000C108 = 1;
  }
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_closeAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeAndReturnError:");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_initWithFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:");
}

id objc_msgSend_isNSArray__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSArray__");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_readDataToEndOfFileAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataToEndOfFileAndReturnError:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_synchronizeAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeAndReturnError:");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}

