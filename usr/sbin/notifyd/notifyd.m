void sub_100002D88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  uint64_t v9;
  int v10;
  int v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0)
    goto LABEL_18;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 0x2C)
    goto LABEL_18;
  if (v4 > 0x22C)
    goto LABEL_18;
  v5 = *(_DWORD *)(a1 + 36);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_18;
  if (__CFADD__(a1, v4))
  {
    __break(0x5513u);
    return;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  if (memchr((void *)(a1 + 40), 0, v8))
  {
    v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + a1;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      v11 = *(_DWORD *)(a1 + v6 + 40);
      v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      sub_100002EA0((const char *)(a1 + 40), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

int64x2_t sub_100002EA0(const char *a1, int a2, __int128 *a3)
{
  __int128 v6;
  int64x2_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  int v11;
  uint64_t v12;

  v6 = a3[1];
  v9 = *a3;
  v10 = v6;
  if (!sandbox_check_by_audit_token(&v9, "darwin-notification-post", 9))
  {
    v8 = a3[1];
    v9 = *a3;
    v10 = v8;
    v12 = 0;
    sub_100003A68(a1, &v12, &v11, a2, &v9);
    result = vaddq_s64((int64x2_t)xmmword_100014090, (int64x2_t)xmmword_10000E370);
    xmmword_100014090 = (__int128)result;
  }
  return result;
}

FILE *sub_100002F38(FILE *result, uint64_t a2)
{
  int v3;
  uint64_t size;
  __int128 v5;
  uid_t v6;
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
  uint64_t v17;
  uint64_t v18;
  audit_token_t atoken;
  audit_token_t v20;

  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(&result->_bf._size + 1) || result->_lbfsize <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  size = result->_bf._size;
  v5 = *(_OWORD *)&result->_seek;
  *(_OWORD *)v20.val = *(_OWORD *)&result->_close;
  *(_OWORD *)&v20.val[4] = v5;
  *(_OWORD *)atoken.val = *(_OWORD *)v20.val;
  *(_OWORD *)&atoken.val[4] = v5;
  v6 = audit_token_to_euid(&atoken);
  *(_QWORD *)&xmmword_1000140F8 = xmmword_1000140F8 + 1;
  sub_10000554C((FILE *)7, "__notify_server_suspend_pid %d\n", v7, v8, v9, v10, v11, v12, size);
  if (v6)
  {
    atoken = v20;
    audit_token_to_pid(&atoken);
    result = sub_10000554C((FILE *)4, "__notify_server_suspend_pid %d permission denied for caller %d \n", v13, v14, v15, v16, v17, v18, size);
  }
  else
  {
    result = (FILE *)os_set_32_ptr_find(&unk_100014210, size);
    if (result)
    {
      if ((FILE *)qword_100014228 != result)
        *(_DWORD *)((char *)&result->_file - qword_100014228 + 2) |= 1u;
    }
  }
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

void sub_100003088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_msg_header_t *msg;

  if (a2 == 2 && (dispatch_mach_mig_demux(a1, &off_1000107F8, 1, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
    mach_msg_destroy(msg);
  }
}

uint64_t sub_1000030DC(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  __int128 v5;
  _OWORD v6[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = *(_DWORD *)(result + 24);
    result += 24;
    if (!v3 && *(_DWORD *)(result + 4) > 0x1Fu)
    {
      v5 = *(_OWORD *)(result + 36);
      v6[0] = *(_OWORD *)(result + 20);
      v6[1] = v5;
      result = sub_10000318C((_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44), v6);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000318C(_DWORD *a1, _DWORD *a2, _DWORD *a3, _OWORD *a4)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  audit_token_t atoken;
  pid_t pidp;

  pidp = -1;
  ++*((_QWORD *)&xmmword_100014178 + 1);
  v7 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v7;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  sub_10000554C((FILE *)7, "__notify_server_checkin %d\n", v8, v9, v10, v11, v12, v13, pidp);
  *a1 = 3;
  result = getpid();
  *a2 = result;
  *a3 = 0;
  return result;
}

char *sub_100003234(char *result, uint64_t a2)
{
  int v3;
  int v4;
  __int128 v5;
  __int128 v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t v25;
  mach_port_name_t v26;
  char *v27;
  mach_port_name_t v28;
  audit_token_t atoken;
  mach_port_name_t name;
  __int128 v31;
  __int128 v32;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *((_DWORD *)result + 1) != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = *((_DWORD *)result + 6);
  result += 24;
  if (v3 || *((_DWORD *)result + 1) <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_QWORD *)(a2 + 32) = 0x10000000000000;
  v6 = *(_OWORD *)(result + 36);
  v31 = *(_OWORD *)(result + 20);
  v5 = v31;
  v32 = v6;
  name = 0;
  *(_DWORD *)(a2 + 48) = 0;
  *(_DWORD *)(a2 + 28) = 0;
  *(_OWORD *)atoken.val = v5;
  *(_OWORD *)&atoken.val[4] = v6;
  v7 = audit_token_to_pid(&atoken);
  sub_10000554C((FILE *)7, "__notify_generate_common_port %d\n", v8, v9, v10, v11, v12, v13, v7);
  v14 = os_set_32_ptr_find(&unk_100014210, v7);
  if (!v14 || (v22 = (uint64_t *)(v14 - qword_100014228), v14 == qword_100014228))
    v22 = sub_100004E88(0, v7);
  v23 = (unsigned int *)v22[3];
  if (v23)
  {
    v24 = *(_QWORD *)v23;
    if (*(_QWORD *)v23)
    {
      do
      {
        v25 = *(_QWORD *)(v24 + 16);
        sub_100003DF8(v24);
        v24 = v25;
      }
      while (v25);
      v23 = (unsigned int *)v22[3];
    }
    sub_1000065AC(v23, v15, v16, v17, v18, v19, v20, v21);
    v22[3] = 0;
  }
  *(_QWORD *)&atoken.val[4] = 0;
  *(_OWORD *)atoken.val = xmmword_10000E3F0;
  if (mach_port_construct(mach_task_self_, (mach_port_options_ptr_t)&atoken, 0, &name))
    __assert_rtn("__notify_generate_common_port", "notify_proc.c", 1701, "kstatus == KERN_SUCCESS");
  if (mach_port_insert_right(mach_task_self_, name, name, 0x14u))
    __assert_rtn("__notify_generate_common_port", "notify_proc.c", 1705, "kstatus == KERN_SUCCESS");
  v26 = name;
  result = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  if (result)
  {
    v27 = result;
    ++dword_100014278;
    *(_QWORD *)result = 0;
    *((_DWORD *)result + 2) = v26;
    *((_DWORD *)result + 3) = 2;
    os_set_32_ptr_insert();
    result = (char *)sub_100003720(v26);
    v22[3] = (uint64_t)v27;
    v28 = name;
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    *(_DWORD *)(a2 + 28) = v28;
  }
  else
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
    __break(1u);
  }
  return result;
}

void sub_1000034C4(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uid_t v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  audit_token_t atoken;
  audit_token_t v23;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  v4 = *(unsigned int *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v23.val = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v23.val[4] = v5;
  *(_OWORD *)atoken.val = *(_OWORD *)v23.val;
  *(_OWORD *)&atoken.val[4] = v5;
  v6 = audit_token_to_euid(&atoken);
  ++*((_QWORD *)&xmmword_1000140F8 + 1);
  sub_10000554C((FILE *)7, "__notify_server_resume_pid %d\n", v7, v8, v9, v10, v11, v12, v4);
  if (v6)
  {
    atoken = v23;
    audit_token_to_pid(&atoken);
    sub_10000554C((FILE *)4, "__notify_server_resume_pid %d permission denied for caller %d \n", v13, v14, v15, v16, v17, v18, v4);
  }
  else
  {
    v19 = os_set_32_ptr_find(&unk_100014210, v4);
    if (v19)
    {
      v20 = v19 - qword_100014228;
      if (v19 != qword_100014228)
      {
        *(_DWORD *)(v20 + 20) &= ~1u;
        for (i = *(_QWORD *)v20; i; i = *(_QWORD *)(i + 16))
          sub_1000036EC(i, v20, 0);
      }
    }
  }
  *(_DWORD *)(a2 + 32) = 0;
}

void sub_100003630(_DWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;

  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    v3 = a1[8];
    sub_100003720(a1[8]);
    v4 = os_set_32_ptr_find(&unk_1000141F0, v3);
    if (v4)
      v5 = v4 - qword_100014208;
    else
      v5 = 0;
    *(_DWORD *)(v5 + 12) &= ~1u;
    for (i = *(_QWORD *)v5; i; i = *(_QWORD *)(i + 32))
    {
      sub_1000036EC(i, 0, v5);
      if ((*(_BYTE *)(v5 + 12) & 1) != 0)
        break;
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void sub_1000036EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  char v4;

  if (!*(_BYTE *)(a1 + 78) || (v3 = *(_BYTE *)(a1 + 78) - 1, (*(_BYTE *)(a1 + 78) = v3) == 0))
  {
    v4 = *(_BYTE *)(a1 + 79);
    *(_BYTE *)(a1 + 79) = v4 & 0x5F;
    if ((v4 & 0x40) != 0)
      sub_100005AB4(a1, a2, a3);
  }
}

uint64_t sub_100003720(mach_port_name_t name)
{
  uint64_t result;
  mach_port_t previous;

  previous = 0;
  result = mach_port_request_notification(mach_task_self_, name, 66, 0, dword_100014288, 0x15u, &previous);
  if ((_DWORD)result)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to arm send-possible";
    qword_100014040 = (int)result;
    __break(1u);
    goto LABEL_5;
  }
  if (previous)
  {
LABEL_5:
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: send-possible already armed??";
    qword_100014040 = 0;
    __break(1u);
  }
  return result;
}

const char *sub_1000037C4(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  const char *v9;
  int v10;
  int v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_18;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C)
    goto LABEL_18;
  if (v4 > 0x22C)
    goto LABEL_18;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_18;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  result = (const char *)memchr((void *)(result + 40), 0, v8);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = *(_DWORD *)&v3[v6 + 40];
      v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      result = (const char *)sub_100003A68(v3 + 40, (_QWORD *)(a2 + 36), (_DWORD *)(a2 + 44), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_1000038FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  uint64_t v9;
  int v10;
  int v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0)
    goto LABEL_18;
  v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 0x2C)
    goto LABEL_18;
  if (v4 > 0x22C)
    goto LABEL_18;
  v5 = *(_DWORD *)(a1 + 36);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_18;
  if (__CFADD__(a1, v4))
  {
    __break(0x5513u);
    return;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  if (memchr((void *)(a1 + 40), 0, v8))
  {
    v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + a1;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      v11 = *(_DWORD *)(a1 + v6 + 40);
      v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      sub_100003A14((const char *)(a1 + 40), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

int64x2_t sub_100003A14(const char *a1, int a2, __int128 *a3)
{
  __int128 v3;
  int64x2_t result;
  __int128 v5[2];
  int v6;
  uint64_t v7;

  v7 = 0;
  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  sub_100003A68(a1, &v7, &v6, a2, v5);
  result = vaddq_s64((int64x2_t)xmmword_100014090, (int64x2_t)xmmword_10000E370);
  xmmword_100014090 = (__int128)result;
  return result;
}

FILE *sub_100003A68(const char *a1, _QWORD *a2, _DWORD *a3, int a4, __int128 *a5)
{
  __int128 v10;
  int v11;
  __int128 v12;
  FILE *result;
  int v14;
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
  int v25;
  int v26;
  __int128 v27;
  __int128 v28;

  v25 = -1;
  v26 = -1;
  v24 = -1;
  *a2 = 0;
  v10 = a5[1];
  v27 = *a5;
  v28 = v10;
  sub_100005648(&v27, 0xFFFFFFFF, (uid_t *)&v26, (gid_t *)&v25, &v24, 0);
  v11 = v26;
  if (a4 && v26)
  {
    v12 = a5[1];
    v27 = *a5;
    v28 = v12;
    if (sub_100005EA4(&v27, (uint64_t)"com.apple.notify.root_access"))
    {
      v11 = 0;
      v26 = 0;
    }
    else
    {
      v11 = v26;
    }
  }
  result = (FILE *)sub_100005880(a1, v11, v25, 2);
  *a3 = (_DWORD)result;
  if (!(_DWORD)result)
  {
    *(_QWORD *)&xmmword_100014078 = xmmword_100014078 + 1;
    ++*((_QWORD *)&xmmword_100014090 + 1);
    v14 = sub_100003C20((uint64_t)a1, v26, v25);
    *a3 = v14;
    if (v14 == 10)
      __assert_rtn("__notify_server_post_2", "notify_proc.c", 576, "*status != NOTIFY_STATUS_NULL_INPUT");
    v15 = os_set_str_ptr_find(&unk_100014190, a1);
    if (v15 && qword_1000141A8 != v15)
    {
      v22 = v15 - qword_1000141A8;
      ++*(_DWORD *)(v22 + 64);
      v23 = *(_QWORD *)(v22 + 16);
      *a2 = v23;
      if (v23 != -1)
        return sub_10000554C((FILE *)7, "__notify_server_post %s %d [%llu]\n", v16, v17, v18, v19, v20, v21, (char)a1);
    }
    else
    {
      *a3 = 60;
      *a2 = -1;
      ++*((_QWORD *)&xmmword_100014078 + 1);
    }
    return sub_10000554C((FILE *)7, "__notify_server_post %s %d\n", v16, v17, v18, v19, v20, v21, (char)a1);
  }
  return result;
}

uint64_t sub_100003C20(uint64_t a1, int a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 10;
  result = os_set_str_ptr_find(&unk_100014190, a1);
  if (result)
  {
    if (qword_1000141A8 == result)
      return 0;
    v7 = *(unsigned int *)(result - qword_1000141A8 + 52);
    if ((_DWORD)v7 != -1)
    {
      if (__CFADD__(qword_1000142E0, 4 * v7))
      {
        __break(0x5513u);
        return result;
      }
      ++*(_DWORD *)(qword_1000142E0 + 4 * v7);
    }
    v8 = os_set_str_ptr_find(&unk_100014190, a1);
    if (v8 && qword_1000141A8 != v8)
      return sub_100005A54(v8 - qword_1000141A8, a2, a3);
    else
      return 1;
  }
  return result;
}

void sub_100003CF4(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  unsigned int v14;
  uid_t v15;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  v4 = *(unsigned int *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 72);
  v13[0] = *(_OWORD *)(a1 + 56);
  v13[1] = v5;
  v14 = -1;
  v15 = -1;
  sub_100005648(v13, 0xFFFFFFFF, &v15, 0, &v14, 0);
  ++*((_QWORD *)&xmmword_1000140D8 + 1);
  sub_10000554C((FILE *)7, "__notify_server_cancel %d %d\n", v6, v7, v8, v9, v10, v11, v14);
  v12 = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v14 << 32));
  if (v12)
  {
    if (qword_1000141E8 != v12)
      sub_100003DF8(v12 - qword_1000141E8);
  }
  *(_DWORD *)(a2 + 32) = 0;
}

void sub_100003DF8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  ++qword_100014170;
  if (*(_WORD *)(a1 + 76))
  {
    v2 = *(unsigned __int16 *)(a1 + 76) - 1;
    if (__CFADD__(qword_100014290, 8 * v2))
      goto LABEL_25;
    v3 = *(_QWORD **)(qword_100014290 + 8 * v2);
    *(_QWORD *)(qword_100014290 + 8 * v2) = 0;
    if ((*(_DWORD *)v3 - 1) <= 1)
    {
      v4 = v3[1];
      dispatch_assert_queue_V2((dispatch_queue_t)qword_100014298);
      if (v4)
      {
        v5 = *(NSObject **)(v4 + 72);
        if (v5)
          dispatch_source_cancel(v5);
        sub_10000AED0(v4);
      }
    }
    free(v3);
    *(_WORD *)(a1 + 76) = 0;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (!v6)
    __assert_rtn("port_proc_cancel_client", "notify_proc.c", 330, "n != NULL");
  v7 = *(_BYTE *)(a1 + 79) & 0xF;
  if (v7 == 7 || v7 == 3)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      *(_QWORD *)(v9 + 40) = *(_QWORD *)(a1 + 40);
    **(_QWORD **)(a1 + 40) = v9;
    goto LABEL_21;
  }
  if (v7 == 1)
  {
    v10 = *(unsigned int *)(v6 + 52);
    if (!__CFADD__(qword_1000142E8, 4 * v10))
    {
      --*(_DWORD *)(qword_1000142E8 + 4 * v10);
      goto LABEL_21;
    }
LABEL_25:
    __break(0x5513u);
    return;
  }
LABEL_21:
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
    *(_QWORD *)(v11 + 24) = *(_QWORD *)(a1 + 24);
  **(_QWORD **)(a1 + 24) = v11;
  sub_100003F34((unsigned int *)a1);
}

void sub_100003F34(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v2 = *((_QWORD *)a1 + 6);
  v3 = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
    *(_QWORD *)(v3 + 8) = *((_QWORD *)a1 + 1);
  **((_QWORD **)a1 + 1) = v3;
  sub_100003FE4((uint64_t)&unk_1000141D0, *((_QWORD *)a1 + 8), (uint64_t)(a1 + 16));
  v4 = *((_BYTE *)a1 + 79) & 0xF;
  if (v4 == 3)
  {
    mach_port_deallocate(mach_task_self_, a1[14]);
  }
  else if (v4 == 4)
  {
    v5 = a1[14];
    if ((v5 & 0x80000000) == 0)
      close_NOCANCEL(v5);
  }
  free(a1);
  ++dword_100014274;
  sub_10000402C(v2);
}

uint64_t sub_100003FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = os_set_64_ptr_delete();
  if (result != a3)
    __assert_rtn("_nc_table_delete_64", "table.c", 80, "os_set_delete(&t->set, key) == expected");
  return result;
}

void sub_10000402C(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 56);
    if (!v2 || (v3 = v2 - 1, (*(_DWORD *)(a1 + 56) = v3) == 0))
    {
      v4 = dword_10001425C;
      if (dword_10001425C)
      {
        v5 = 0;
        v6 = (void *)qword_100014248;
        v7 = 8;
        while (1)
        {
          if (~qword_100014248 < (unint64_t)(8 * v5))
            goto LABEL_24;
          if (*(_QWORD *)(qword_100014248 + 8 * v5) == a1)
            break;
          ++v5;
          v7 += 8;
          if (v5 == dword_10001425C)
            goto LABEL_20;
        }
        if ((int)v5 + 1 < dword_10001425C)
        {
          v8 = 8 * dword_10001425C;
          while (v7 <= ~qword_100014248 && ~qword_100014248 >= 8 * (unint64_t)v5)
          {
            *(_QWORD *)(qword_100014248 + 8 * v5) = *(_QWORD *)(qword_100014248 + v7);
            v7 += 8;
            LODWORD(v5) = v5 + 1;
            if (v8 == v7)
            {
              v6 = (void *)qword_100014248;
              goto LABEL_16;
            }
          }
LABEL_24:
          __break(0x5513u);
          return;
        }
LABEL_16:
        v9 = v4 - 1;
        dword_10001425C = v9;
        if (v9)
        {
          v10 = reallocf(v6, 8 * v9);
        }
        else
        {
          free(v6);
          v10 = 0;
        }
        qword_100014248 = (uint64_t)v10;
      }
LABEL_20:
      if (os_set_str_ptr_delete(&unk_100014190, *(_QWORD *)(a1 + 8)) != a1 + 8)
        __assert_rtn("_nc_table_delete", "table.c", 72, "os_set_delete(&t->set, key) == expected");
      *(_QWORD *)(a1 + 8) = 0;
      sub_100003FE4((uint64_t)&unk_1000141B0, *(_QWORD *)(a1 + 16), a1 + 16);
      free((void *)a1);
      ++dword_10001426C;
    }
  }
}

FILE *sub_100004184(FILE *result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int cookie;
  __sbuf ub;
  _OWORD v8[2];

  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 52)
  {
    v3 = -304;
  }
  else
  {
    if (!HIDWORD(result->_cookie) && LODWORD(result->_close) > 0x1F)
    {
      v5 = *(_QWORD *)&result->_bf._size;
      v4 = *(_QWORD *)&result->_lbfsize;
      cookie = (int)result->_cookie;
      ub = result->_ub;
      v8[0] = *(_OWORD *)&result->_seek;
      v8[1] = ub;
      result = sub_100004220(v5, v4, cookie, v8, 0);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

FILE *sub_100004220(uint64_t a1, uint64_t a2, int a3, _OWORD *a4, int a5)
{
  __int128 v10;
  __int128 v11;
  FILE *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  pid_t pidp;
  gid_t egidp;
  uid_t euidp;
  audit_token_t atoken;

  egidp = -1;
  euidp = -1;
  pidp = -1;
  ++qword_100014130;
  ++*((_QWORD *)&xmmword_100014138 + 1);
  v10 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v10;
  audit_token_to_au32(&atoken, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
  if (a3)
  {
    if (euidp)
    {
      v11 = a4[1];
      *(_OWORD *)atoken.val = *a4;
      *(_OWORD *)&atoken.val[4] = v11;
      if (sub_100005EA4(&atoken, (uint64_t)"com.apple.notify.root_access"))
        euidp = 0;
    }
  }
  if (!a5
    || (result = (FILE *)os_set_64_ptr_find(&unk_1000141B0, a1)) != 0
    && (FILE *)qword_1000141C8 != result
    && (v19 = a4[1],
        *(_OWORD *)atoken.val = *a4,
        *(_OWORD *)&atoken.val[4] = v19,
        result = (FILE *)sandbox_check_by_audit_token(&atoken, "darwin-notification-post", 9),
        !(_DWORD)result))
  {
    result = (FILE *)sub_1000043BC(a1, a2, euidp, egidp);
    if ((_DWORD)result != 7 && (_DWORD)result != 1)
    {
      if ((_DWORD)result)
        __assert_rtn("_internal_notify_server_set_state_2", "notify_proc.c", 1322, "status == NOTIFY_STATUS_OK || status == NOTIFY_STATUS_NOT_AUTHORIZED || status == NOTIFY_STATUS_INVALID_NAME");
      return sub_10000554C((FILE *)7, "__notify_server_set_state_2 %d %llu %llu [uid %d%s gid %d]\n", v13, v14, v15, v16, v17, v18, pidp);
    }
  }
  return result;
}

uint64_t sub_1000043BC(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v7 = os_set_64_ptr_find(&unk_1000141B0, a1);
  if (!v7)
    return 1;
  v8 = v7 - qword_1000141C8;
  if (v7 == qword_1000141C8)
    return 1;
  if (sub_100005880(*(const char **)(v8 + 8), a3, a4, 2))
    return 7;
  *(_QWORD *)(v8 + 24) = a2;
  v10 = mach_absolute_time();
  result = 0;
  *(_QWORD *)(v8 + 32) = v10;
  return result;
}

FILE *sub_100004448(FILE *result, uint64_t a2)
{
  int v3;
  uint64_t size;
  __int128 v5;
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
  _OWORD v17[2];
  unsigned int v18;
  gid_t v19;
  uid_t v20;

  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (!*(&result->_bf._size + 1) && result->_lbfsize > 0x1Fu)
  {
    size = result->_bf._size;
    v5 = *(_OWORD *)&result->_seek;
    v17[0] = *(_OWORD *)&result->_close;
    v17[1] = v5;
    v19 = -1;
    v20 = -1;
    *(_QWORD *)(a2 + 36) = 0;
    v18 = -1;
    *(_QWORD *)(a2 + 44) = 0;
    sub_100005648(v17, 0xFFFFFFFF, &v20, &v19, &v18, 0);
    *(_QWORD *)&xmmword_100014110 = xmmword_100014110 + 1;
    ++qword_100014128;
    v6 = os_set_64_ptr_find(&unk_1000141D0, size | ((unint64_t)v18 << 32));
    if (v6 && qword_1000141E8 != v6)
    {
      v13 = v6 - qword_1000141E8;
      v14 = *(_QWORD *)(*(_QWORD *)(v6 - qword_1000141E8 + 48) + 16);
      *(_QWORD *)(a2 + 36) = 0;
      v15 = os_set_64_ptr_find(&unk_1000141B0, v14);
      if (!v15 || qword_1000141C8 == v15)
      {
        *(_DWORD *)(a2 + 52) = 1;
        __assert_rtn("__notify_server_get_state_3", "notify_proc.c", 1196, "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
      }
      *(_QWORD *)(a2 + 36) = *(_QWORD *)(v15 - qword_1000141C8 + 24);
      *(_DWORD *)(a2 + 52) = 0;
      v16 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16);
      *(_QWORD *)(a2 + 44) = v16;
      if (v16 != -1)
      {
        result = sub_10000554C((FILE *)7, "__notify_server_get_state_3 %d %d [%llu]\n", v7, v8, v9, v10, v11, v12, v18);
        goto LABEL_13;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 52) = 50;
      *(_QWORD *)(a2 + 44) = -1;
    }
    result = sub_10000554C((FILE *)7, "__notify_server_get_state_3 %d %d\n", v7, v8, v9, v10, v11, v12, v18);
LABEL_13:
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 56;
    return result;
  }
  v3 = -309;
LABEL_7:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100004628(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _OWORD v13[2];
  gid_t v14;
  uid_t v15;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  v4 = *(_QWORD *)(result + 32);
  v5 = *(_OWORD *)(result + 76);
  v13[0] = *(_OWORD *)(result + 60);
  v13[1] = v5;
  v14 = -1;
  v15 = -1;
  *(_QWORD *)(a2 + 36) = 0;
  sub_100005648(v13, 0xFFFFFFFF, &v15, &v14, 0, 0);
  sub_10000554C((FILE *)7, "__notify_server_get_state_2 %llu\n", v6, v7, v8, v9, v10, v11, v4);
  *(_QWORD *)(a2 + 36) = 0;
  result = os_set_64_ptr_find(&unk_1000141B0, v4);
  if (result && qword_1000141C8 != result)
  {
    v12 = 0;
    *(_QWORD *)(a2 + 36) = *(_QWORD *)(result - qword_1000141C8 + 24);
  }
  else
  {
    v12 = 1;
  }
  *(_DWORD *)(a2 + 44) = v12;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 48;
  return result;
}

char *sub_100004748(char *result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_18;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C)
    goto LABEL_18;
  if (v4 > 0x22C)
    goto LABEL_18;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_18;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = *(_DWORD *)&v3[v6 + 40];
      v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      result = (char *)sub_100004860(v3 + 40, v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100004860(char *a1, unsigned int a2, __int128 *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v18;
  __int128 v19;
  unsigned int v20;
  int v21;
  int v22;
  unint64_t v23;
  uint64_t v24;

  v23 = 0;
  v21 = -1;
  v22 = -1;
  v20 = -1;
  xmmword_1000140A0 = (__int128)vaddq_s64((int64x2_t)xmmword_1000140A0, vdupq_n_s64(1uLL));
  v6 = a3[1];
  v18 = *a3;
  v19 = v6;
  sub_100005648(&v18, a2, (uid_t *)&v22, (gid_t *)&v21, &v20, &v23);
  sub_10000554C((FILE *)7, "__notify_server_register_plain %s %d %d\n", v7, v8, v9, v10, v11, v12, (char)a1);
  v13 = sub_100004E00(a1, v20, a2, -1, v22, v21, &v24);
  if (!(_DWORD)v13)
  {
    v14 = os_set_64_ptr_find(&unk_1000141D0, v23);
    if (v14)
      v15 = (uint64_t *)(v14 - qword_1000141E8);
    else
      v15 = 0;
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      v16 = a3[1];
      v18 = *a3;
      v19 = v16;
      sub_10000C77C(a1, (uint64_t)v15, &v18);
    }
    sub_100004D74(v15, v20);
  }
  return v13;
}

char *sub_100004984(char *result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_18;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C)
    goto LABEL_18;
  if (v4 > 0x22C)
    goto LABEL_18;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_18;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = *(_DWORD *)&v3[v6 + 40];
      v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      result = (char *)sub_100004AC4(v3 + 40, v11, (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_QWORD *)(a2 + 44), (_DWORD *)(a2 + 52), v13);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 56;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t *sub_100004AC4(char *a1, unsigned int a2, _DWORD *a3, _DWORD *a4, _QWORD *a5, _DWORD *a6, __int128 *a7)
{
  __int128 v14;
  uint64_t *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  __int128 v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  __int128 v29;
  unsigned int v30;
  int v31;
  int v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;

  v33 = 0;
  v31 = -1;
  v32 = -1;
  v30 = -1;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  v14 = a7[1];
  v34 = *a7;
  v35 = v14;
  sub_100005648(&v34, a2, (uid_t *)&v32, (gid_t *)&v31, &v30, &v33);
  *(_QWORD *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  ++qword_1000140B0;
  if (!dword_1000142D8)
  {
    *a3 = -1;
    *a4 = -1;
    v25 = a7[1];
    v34 = *a7;
    v35 = v25;
    return (uint64_t *)sub_100004860(a1, a2, &v34);
  }
  result = (uint64_t *)os_set_str_ptr_find(&unk_100014190, a1);
  if (!result
    || (uint64_t *)qword_1000141A8 == result
    || (v22 = *(unsigned int *)((char *)result - qword_1000141A8 + 52), (_DWORD)v22 == -1))
  {
    if (dword_1000142D8 >= 2)
    {
      LODWORD(v22) = dword_1000142DC;
      v24 = 1;
      do
      {
        v22 = (int)v22 + 1 < dword_1000142D8 ? (v22 + 1) : 1;
        v23 = 4 * v22;
        if (v23 > ~qword_1000142E8)
          goto LABEL_33;
        if (!*(_DWORD *)(qword_1000142E8 + 4 * v22))
        {
          if ((_DWORD)v22 == -1)
            break;
          dword_1000142DC = v22;
          goto LABEL_22;
        }
      }
      while (dword_1000142D8 != ++v24);
    }
    if (dword_1000142DC + 1 < dword_1000142D8)
      v26 = dword_1000142DC + 1;
    else
      v26 = 1;
    dword_1000142DC = v26;
    result = (uint64_t *)sub_10000554C((FILE *)7, "reused shared memory slot %u\n", v16, v17, v18, v19, v20, v21, v26);
    v22 = dword_1000142DC;
    v23 = 4 * dword_1000142DC;
LABEL_22:
    if (__CFADD__(qword_1000142E0, v23))
    {
LABEL_33:
      __break(0x5513u);
      return result;
    }
    *(_DWORD *)(qword_1000142E0 + 4 * v22) = 1;
  }
  else
  {
    v23 = 4 * v22;
  }
  if (__CFADD__(qword_1000142E8, v23))
    goto LABEL_33;
  ++*(_DWORD *)(qword_1000142E8 + 4 * v22);
  sub_10000554C((FILE *)7, "__notify_server_register_check %s %d %d\n", v16, v17, v18, v19, v20, v21, (char)a1);
  *a3 = 4 * dword_1000142D8;
  *a4 = v22;
  result = (uint64_t *)sub_100004E00(a1, v30, a2, v22, v32, v31, a5);
  *a6 = (_DWORD)result;
  if (!(_DWORD)result)
  {
    v27 = os_set_64_ptr_find(&unk_1000141D0, v33);
    if (v27)
      v28 = (uint64_t *)(v27 - qword_1000141E8);
    else
      v28 = 0;
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      v29 = a7[1];
      v34 = *a7;
      v35 = v29;
      sub_10000C77C(a1, (uint64_t)v28, &v34);
    }
    return sub_100004D74(v28, v30);
  }
  return result;
}

uint64_t *sub_100004D74(uint64_t *result, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  if ((int)a2 < 1)
    return result;
  v2 = a2;
  v3 = (uint64_t)result;
  result = (uint64_t *)os_set_32_ptr_find(&unk_100014210, a2);
  if (!result)
    return sub_100004E88(v3, v2);
  if (!v3 || result == (uint64_t *)qword_100014228)
  {
    if ((uint64_t *)qword_100014228 != result)
      return result;
    return sub_100004E88(v3, v2);
  }
  v4 = (uint64_t *)((char *)result - qword_100014228);
  v5 = *(uint64_t *)((char *)result - qword_100014228);
  *(_QWORD *)(v3 + 16) = v5;
  if (v5)
    *(_QWORD *)(v5 + 24) = v3 + 16;
  *v4 = v3;
  *(_QWORD *)(v3 + 24) = v4;
  return result;
}

uint64_t sub_100004E00(const char *a1, uint64_t a2, unsigned int a3, int a4, int a5, int a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  if (!a1)
    return 1;
  v14 = 0;
  result = sub_10000572C(a1, a2, a3, a5, a6, &v14);
  if (!(_DWORD)result)
  {
    v10 = v14;
    v11 = *(_BYTE *)(v14 + 79) & 0xF0;
    v12 = *(_QWORD *)(v14 + 48);
    if (a4 == -1)
    {
      v13 = v11 | 2;
    }
    else
    {
      v13 = v11 | 1;
      *(_DWORD *)(v12 + 52) = a4;
    }
    result = 0;
    *(_BYTE *)(v10 + 79) = v13;
    *a7 = *(_QWORD *)(v12 + 16);
  }
  return result;
}

uint64_t *sub_100004E88(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t *result;
  uint64_t *v6;
  uint64_t v7;

  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a2, 0x80000000uLL, (dispatch_queue_t)qword_100014298);
  dispatch_source_set_event_handler_f(v4, (dispatch_function_t)sub_1000064E8);
  result = (uint64_t *)malloc_type_malloc(0x20uLL, 0x10200407DCD39BEuLL);
  if (result)
  {
    v6 = result;
    ++dword_100014278;
    *result = 0;
    result[1] = (uint64_t)v4;
    *((_DWORD *)result + 5) = 0;
    *((_DWORD *)result + 4) = a2;
    result[3] = 0;
    os_set_32_ptr_insert();
    if (a1)
    {
      v7 = *v6;
      *(_QWORD *)(a1 + 16) = *v6;
      if (v7)
        *(_QWORD *)(v7 + 24) = a1 + 16;
      *v6 = a1;
      *(_QWORD *)(a1 + 24) = v6;
    }
    dispatch_set_context(v4, v6);
    dispatch_source_set_cancel_handler_f(v4, (dispatch_function_t)sub_100006520);
    dispatch_activate(v4);
    return v6;
  }
  else
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
    __break(1u);
  }
  return result;
}

char *sub_100004F90(char *result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_18;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C)
    goto LABEL_18;
  if (v4 > 0x22C)
    goto LABEL_18;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_18;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = *(_DWORD *)&v3[v6 + 40];
      v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      result = (char *)sub_100005380(v3 + 40, v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_1000050A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_msg_header_t *msg;

  if (a2 == 2 && (dispatch_mach_mig_demux(a1, &off_100014000, 1, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
    mach_msg_destroy(msg);
  }
}

uint64_t sub_1000050FC(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  __int128 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 44) && *(_DWORD *)(result + 48) > 0x1Fu)
    {
      v4 = *(_QWORD *)(result + 32);
      v5 = *(_DWORD *)(result + 40);
      v6 = *(_OWORD *)(result + 80);
      v24 = *(_OWORD *)(result + 64);
      v25 = v6;
      v20 = -1;
      v21 = -1;
      v19 = -1;
      result = os_set_64_ptr_find(&unk_1000141B0, v4);
      if (result)
      {
        v7 = result - qword_1000141C8;
        if (result != qword_1000141C8)
        {
          ++*(_DWORD *)(v7 + 64);
          v22 = v24;
          v23 = v25;
          sub_100005648(&v22, 0xFFFFFFFF, (uid_t *)&v21, (gid_t *)&v20, &v19, 0);
          v8 = v21;
          if (v5 && v21)
          {
            v22 = v24;
            v23 = v25;
            if (sub_100005EA4(&v22, (uint64_t)"com.apple.notify.root_access"))
            {
              v8 = 0;
              v21 = 0;
            }
            else
            {
              v8 = v21;
            }
          }
          result = sub_100005880(*(const char **)(v7 + 8), v8, v20, 2);
          if ((_DWORD)result)
          {
            if ((_DWORD)result == 10)
              __assert_rtn("__notify_server_post_3", "notify_proc.c", 525, "status != NOTIFY_STATUS_NULL_INPUT");
          }
          else
          {
            *(_QWORD *)&xmmword_100014078 = xmmword_100014078 + 1;
            ++qword_100014088;
            sub_10000554C((FILE *)7, "__notify_server_post %s %d by nameid: %llu \n", v9, v10, v11, v12, v13, v14, *(_QWORD *)(v7 + 8));
            v16 = v20;
            v15 = v21;
            result = os_set_64_ptr_find(&unk_1000141B0, v4);
            if (result && qword_1000141C8 != result)
            {
              v17 = *(unsigned int *)(result - qword_1000141C8 + 52);
              if ((_DWORD)v17 != -1)
              {
                if (__CFADD__(qword_1000142E0, 4 * v17))
                {
                  __break(0x5513u);
                  return result;
                }
                ++*(_DWORD *)(qword_1000142E0 + 4 * v17);
              }
              v18 = os_set_64_ptr_find(&unk_1000141B0, v4);
              if (!v18
                || qword_1000141C8 == v18
                || (result = sub_100005A54(v18 - qword_1000141C8, v15, v16), (_DWORD)result))
              {
                __assert_rtn("__notify_server_post_3", "notify_proc.c", 536, "status == NOTIFY_STATUS_OK");
              }
            }
          }
        }
      }
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100005380(char *a1, unsigned int a2, __int128 *a3)
{
  __int128 v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t result;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  unsigned int v30;
  int v31;
  int v32;
  unint64_t v33;

  v33 = 0;
  v31 = -1;
  v32 = -1;
  v30 = -1;
  v6 = a3[1];
  v28 = *a3;
  v29 = v6;
  sub_100005648(&v28, a2, (uid_t *)&v32, (gid_t *)&v31, &v30, &v33);
  *(_QWORD *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  *(_QWORD *)&xmmword_1000140D8 = xmmword_1000140D8 + 1;
  sub_10000554C((FILE *)7, "_notify_internal_register_common_port %s %d %d\n", v7, v8, v9, v10, v11, v12, (char)a1);
  v13 = os_set_32_ptr_find(&unk_100014210, v30);
  if (v13 && (v20 = (uint64_t *)(v13 - qword_100014228), v13 != qword_100014228) && v20[3])
  {
    if (a1)
    {
      *(_QWORD *)&v28 = 0;
      result = sub_10000572C(a1, v30, a2, v32, v31, &v28);
      if (!(_DWORD)result)
      {
        *(_BYTE *)(v28 + 79) = *(_BYTE *)(v28 + 79) & 0xF0 | 7;
        v22 = os_set_64_ptr_find(&unk_1000141D0, v33);
        if (v22)
          v23 = (_QWORD *)(v22 - qword_1000141E8);
        else
          v23 = 0;
        if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
        {
          v24 = a3[1];
          v28 = *a3;
          v29 = v24;
          sub_10000C77C(a1, (uint64_t)v23, &v28);
        }
        if (v23)
        {
          v25 = *v20;
          v23[2] = *v20;
          if (v25)
            *(_QWORD *)(v25 + 24) = v23 + 2;
          *v20 = (uint64_t)v23;
          v23[3] = v20;
        }
        v26 = (uint64_t *)v20[3];
        v27 = *v26;
        v23[4] = *v26;
        if (v27)
          *(_QWORD *)(v27 + 40) = v23 + 4;
        result = 0;
        *v26 = (uint64_t)v23;
        v23[5] = v26;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    sub_10000554C((FILE *)7, "_notify_internal_register_common_port FAILED %s %d %d\n", v14, v15, v16, v17, v18, v19, (char)a1);
    return 59;
  }
  return result;
}

FILE *sub_10000554C(FILE *result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  FILE *v10;
  tm *v11;
  time_t v12;
  char v13[16];
  __int128 v14;

  if (dword_1000142F8 >= (int)result)
  {
    result = (FILE *)qword_100014308;
    if (qword_100014308)
    {
      result = fopen((const char *)qword_100014308, "a");
      if (result)
      {
        v10 = result;
        v12 = time(0);
        *(_OWORD *)v13 = 0u;
        v14 = 0u;
        v11 = localtime(&v12);
        strftime(v13, 0x20uLL, "%b %e %T", v11);
        fprintf(v10, "%s: ", v13);
        vfprintf(v10, a2, &a9);
        fflush(v10);
        return (FILE *)fclose(v10);
      }
    }
  }
  return result;
}

void sub_100005648(_OWORD *a1, unsigned int a2, uid_t *a3, gid_t *a4, _DWORD *a5, unint64_t *a6)
{
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  audit_token_t atoken;

  if (a3)
  {
    v11 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v11;
    *a3 = audit_token_to_euid(&atoken);
  }
  if (a4)
  {
    v12 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v12;
    *a4 = audit_token_to_egid(&atoken);
  }
  v13 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v13;
  v14 = audit_token_to_pid(&atoken);
  if (a5)
    *a5 = v14;
  v15 = a2 | (unint64_t)(v14 << 32);
  if (a6)
    *a6 = v15;
  v16 = os_set_64_ptr_find(&unk_1000141D0, v15);
  if (v16)
  {
    if (qword_1000141E8 != v16)
    {
      v23 = v16 - qword_1000141E8;
      sub_10000554C((FILE *)7, "duplicate token %d sent from PID %d\n", v17, v18, v19, v20, v21, v22, a2);
      sub_100003DF8(v23);
    }
  }
}

uint64_t sub_10000572C(const char *a1, uint64_t a2, unsigned int a3, int a4, int a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  if (!a6)
    return 0;
  if (sub_100005880(a1, a4, a5, 1))
    return 7;
  *a6 = 0;
  v11 = os_set_str_ptr_find(&unk_100014190, a1);
  if (!v11 || (v12 = (_QWORD *)(v11 - qword_1000141A8), v11 == qword_1000141A8))
  {
    v12 = sub_100005F58(a1);
    if (!v12)
      return 47;
  }
  v13 = a3 | (unint64_t)(a2 << 32);
  ++*((_DWORD *)v12 + 14);
  v14 = os_set_64_ptr_find(&unk_1000141D0, v13);
  if ((!v14 || qword_1000141E8 == v14) && (v15 = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040BED8B209uLL)) != 0)
  {
    v16 = v15;
    ++dword_100014270;
    v15[8] = v13;
    v15[6] = v12;
    v17 = *v12;
    *v15 = *v12;
    if (v17)
      *(_QWORD *)(v17 + 8) = v15;
    *v12 = v15;
    v15[1] = v12;
    os_set_64_ptr_insert(&unk_1000141D0, v15 + 8);
    result = 0;
    *a6 = v16;
  }
  else
  {
    sub_10000402C((uint64_t)v12);
    return 48;
  }
  return result;
}

uint64_t sub_100005880(const char *a1, int a2, int a3, int a4)
{
  size_t v8;
  uint64_t v9;
  size_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  size_t v16;
  size_t v18;
  int v19;
  int v21;
  BOOL v22;
  int v24;
  char __str[64];

  if (!a1)
    return 10;
  if (!a2)
    return 0;
  if (strncmp(a1, "user.uid.", 9uLL))
  {
    v8 = strlen(a1);
    v9 = qword_100014248;
    if (!qword_100014248)
    {
      dword_10001425C = 0;
      return 0;
    }
    v24 = a4;
    if (!dword_10001425C)
      return 0;
    v10 = v8;
    v11 = 0;
    v12 = ~qword_100014248;
    v13 = 8 * dword_10001425C;
    while (1)
    {
      if (v11 > v12)
        goto LABEL_38;
      v14 = *(_QWORD *)(v9 + v11);
      if (!v14)
        return 0;
      v15 = *(const char **)(v14 + 8);
      if (v15)
      {
        v16 = strlen(*(const char **)(v14 + 8));
        if (v16 <= v10 && !strncmp(v15, a1, v16))
          break;
      }
      v11 += 8;
      if (v13 == v11)
        return 0;
    }
    if (*(_DWORD *)(v14 + 40) == a2 && (*(_DWORD *)(v14 + 48) & v24) != 0)
      return 0;
    v21 = *(_DWORD *)(v14 + 48);
    v22 = *(_DWORD *)(v14 + 44) != a3 || (v21 & (16 * v24)) == 0;
    if (!v22 || (v21 & (v24 << 8)) != 0)
      return 0;
    return 7;
  }
  snprintf(__str, 0x3FuLL, "%s%d", "user.uid.", a2);
  v18 = strlen(__str);
  if (strncmp(a1, __str, v18))
    return 7;
  if (__CFADD__(a1, v18))
LABEL_38:
    __break(0x5513u);
  v19 = a1[v18];
  if (v19 == 46 || v19 == 0)
    return 0;
  else
    return 7;
}

uint64_t sub_100005A54(uint64_t a1, int a2, int a3)
{
  uint64_t v3;

  v3 = a1;
  if (sub_100005880(*(const char **)(a1 + 8), a2, a3, 2))
    return 7;
  ++*(_DWORD *)(v3 + 60);
  while (1)
  {
    v3 = *(_QWORD *)v3;
    if (!v3)
      break;
    sub_100005AB4(v3, 0, 0);
  }
  return 0;
}

void sub_100005AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  pid_t v10;
  xpc_object_t v11;
  uint64_t v12;
  int v13;
  uint64_t has_internal_diagnostics;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[8];

  v4 = *(_BYTE *)(a1 + 79);
  if ((v4 & 0x20) != 0)
  {
    v7 = v4 | 0x40;
    goto LABEL_31;
  }
  if (a2)
    goto LABEL_3;
  v8 = os_set_32_ptr_find(&unk_100014210, *(unsigned int *)(a1 + 68));
  if (v8 && qword_100014228 != v8)
  {
    a2 = v8 - qword_100014228;
    v4 = *(_BYTE *)(a1 + 79);
LABEL_3:
    if ((*(_BYTE *)(a2 + 20) & 1) != 0)
    {
      ++*(_BYTE *)(a1 + 78);
      v7 = v4 | 0x60;
      goto LABEL_31;
    }
    v6 = 0;
    goto LABEL_9;
  }
  a2 = 0;
  v4 = *(_BYTE *)(a1 + 79);
  v6 = 1;
LABEL_9:
  switch(v4 & 0xF)
  {
    case 3:
      v9 = *(unsigned int *)(a1 + 56);
      goto LABEL_36;
    case 4:
      if ((*(_DWORD *)(a1 + 56) & 0x80000000) != 0)
        goto LABEL_30;
      LODWORD(v23[0]) = bswap32(*(_DWORD *)(a1 + 64));
      if (write_NOCANCEL() != 4)
      {
        close_NOCANCEL(*(unsigned int *)(a1 + 56));
        *(_DWORD *)(a1 + 56) = -1;
        return;
      }
LABEL_29:
      v4 = *(_BYTE *)(a1 + 79);
LABEL_30:
      v7 = v4 & 0x3F;
      break;
    case 5:
      v10 = *(_DWORD *)(a1 + 68);
      if (!v10)
        v10 = getpid();
      if (!kill(v10, *(_DWORD *)(a1 + 56)))
        goto LABEL_29;
      return;
    case 6:
      v11 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v11, "Notification", *(const char **)(*(_QWORD *)(a1 + 48) + 8));
      v12 = os_set_64_ptr_find(&unk_1000141B0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
      if (v12 && qword_1000141C8 != v12)
        xpc_dictionary_set_uint64(v11, "_State", *(_QWORD *)(v12 - qword_1000141C8 + 24));
      v13 = xpc_event_publisher_fire_noboost(qword_100014250, *(_QWORD *)(a1 + 56), v11);
      xpc_release(v11);
      if (!v13)
        goto LABEL_29;
      if (v13 == 55 && !*(_BYTE *)(a1 + 80))
      {
        *(_BYTE *)(a1 + 80) = 1;
        memset(v23, 0, sizeof(v23));
        if (xpc_get_service_identifier_for_token(*(_QWORD *)(a1 + 56), v23))
        {
          has_internal_diagnostics = os_variant_has_internal_diagnostics("libnotify.simulate_crash");
          if ((_DWORD)has_internal_diagnostics)
            sub_10000ACE4(has_internal_diagnostics, v15, v16, v17, v18, v19, v20, v21, (char)v23);
        }
      }
      return;
    case 7:
      if ((v6 & 1) == 0)
      {
        v22 = *(_QWORD *)(a2 + 24);
        if (v22)
        {
          v9 = *(unsigned int *)(v22 + 8);
LABEL_36:
          sub_100005D48(a1, a3, v9);
        }
      }
      return;
    default:
      goto LABEL_30;
  }
LABEL_31:
  *(_BYTE *)(a1 + 79) = v7;
}

uint64_t sub_100005D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  mach_msg_option_t v10;
  mach_msg_header_t msg;

  v3 = a3;
  v4 = a2;
  if (a2)
    goto LABEL_2;
  v7 = os_set_32_ptr_find(&unk_1000141F0, a3);
  if (!v7)
  {
    v4 = 0;
LABEL_9:
    v6 = 1;
    goto LABEL_10;
  }
  v4 = v7 - qword_100014208;
  if (v7 == qword_100014208)
    goto LABEL_9;
LABEL_2:
  if ((*(_BYTE *)(v4 + 12) & 1) != 0)
  {
    result = 0;
    ++*(_BYTE *)(a1 + 78);
    v9 = *(_BYTE *)(a1 + 79) | 0x60;
LABEL_18:
    *(_BYTE *)(a1 + 79) = v9;
    return result;
  }
  v6 = 0;
LABEL_10:
  if ((dword_100014258 & 2) != 0)
    v10 = 145;
  else
    v10 = 17;
  *(_QWORD *)&msg.msgh_voucher_port = 0;
  *(_QWORD *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_remote_port = v3;
  msg.msgh_local_port = 0;
  msg.msgh_id = *(_DWORD *)(a1 + 64);
  result = mach_msg(&msg, v10, 0x18u, 0, 0, 0, 0);
  if (!(_DWORD)result)
  {
    v9 = *(_BYTE *)(a1 + 79) & 0x3F;
    goto LABEL_18;
  }
  if ((_DWORD)result != 268435460)
    return 46;
  mach_msg_destroy(&msg);
  if ((dword_100014258 & 2) == 0)
    return 45;
  ++*(_BYTE *)(a1 + 78);
  *(_BYTE *)(a1 + 79) |= 0xE0u;
  result = 0;
  if ((v6 & 1) == 0)
    *(_DWORD *)(v4 + 12) |= 1u;
  return result;
}

BOOL sub_100005EA4(_OWORD *a1, uint64_t a2)
{
  __int128 v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BOOL8 value;
  audit_token_t atoken;

  v4 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v4;
  v5 = audit_token_to_pid(&atoken);
  sub_10000554C((FILE *)5, "-> has_root_entitlement (PID %d)\n", v6, v7, v8, v9, v10, v11, v5);
  v12 = (void *)xpc_copy_entitlement_for_token(a2, a1);
  if (v12)
  {
    v19 = v12;
    value = xpc_BOOL_get_value(v12);
    xpc_release(v19);
  }
  else
  {
    value = 0;
  }
  sub_10000554C((FILE *)5, "<- has_root_entitlement (PID %d) = %s\n", v13, v14, v15, v16, v17, v18, v5);
  return value;
}

_QWORD *sub_100005F58(const char *a1)
{
  size_t v2;
  unint64_t v3;
  _QWORD *result;
  _QWORD *v5;
  uint64_t v6;

  v2 = strlen(a1);
  v3 = v2 + 73;
  result = malloc_type_calloc(1uLL, v2 + 73, 0x1817CFD2uLL);
  v5 = result;
  if (!result)
    return v5;
  ++dword_100014268;
  if ((unint64_t)result < 0xFFFFFFFFFFFFFFB8)
  {
    if (v3 >= 0x10)
    {
      result[1] = result + 9;
      result = memcpy(result + 9, a1, v2 + 1);
      v6 = qword_100014188++;
      if (v3 >= 0x18)
      {
        v5[2] = v6;
        if (v3 >= 0x34)
        {
          *((_DWORD *)v5 + 12) = 819;
          if (v3 >= 0x38)
          {
            *((_DWORD *)v5 + 13) = -1;
            if (v3 >= 0x40)
            {
              *((_DWORD *)v5 + 15) = 1;
              *v5 = 0;
              os_set_str_ptr_insert(&unk_100014190, v5 + 1);
              os_set_64_ptr_insert(&unk_1000141B0, v5 + 2);
              return v5;
            }
          }
        }
      }
    }
    __break(1u);
  }
  __break(0x5513u);
  return result;
}

FILE *sub_100006058(unsigned int a1, uint64_t a2, _QWORD *a3, int *a4, int a5, __int128 *a6, int a7)
{
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  __int128 v30;
  unsigned int v31;
  int v32;
  int v33;
  __int128 v34;
  __int128 v35;

  v32 = -1;
  v33 = -1;
  v31 = -1;
  *a3 = 0;
  v14 = a6[1];
  v34 = *a6;
  v35 = v14;
  sub_100005648(&v34, 0xFFFFFFFF, (uid_t *)&v33, (gid_t *)&v32, &v31, 0);
  if (a5)
  {
    if (v33)
    {
      v15 = a6[1];
      v34 = *a6;
      v35 = v15;
      if (sub_100005EA4(&v34, (uint64_t)"com.apple.notify.root_access"))
        v33 = 0;
    }
  }
  ++qword_100014130;
  ++qword_100014148;
  v16 = os_set_64_ptr_find(&unk_1000141D0, a1 | ((unint64_t)v31 << 32));
  if (!v16 || (v23 = v16 - qword_1000141E8, v16 == qword_1000141E8))
  {
    v24 = 50;
LABEL_8:
    *a4 = v24;
    *a3 = -1;
    return sub_10000554C((FILE *)7, "__notify_server_set_state_3 %d %d %llu [uid %d%s gid %d]\n", v17, v18, v19, v20, v21, v22, v31);
  }
  if (a7)
  {
    v30 = a6[1];
    v34 = *a6;
    v35 = v30;
    if (sandbox_check_by_audit_token(&v34, "darwin-notification-post", 9))
    {
      v24 = 7;
      goto LABEL_8;
    }
  }
  v26 = *(_QWORD *)(v23 + 48);
  if (!v26)
    __assert_rtn("_internal_notify_server_set_state_3", "notify_proc.c", 1248, "c->name_info != NULL");
  v27 = sub_1000043BC(*(_QWORD *)(v26 + 16), a2, v33, v32);
  *a4 = v27;
  if (v27)
    v28 = v27 == 7;
  else
    v28 = 1;
  if (!v28)
    __assert_rtn("_internal_notify_server_set_state_3", "notify_proc.c", 1250, "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
  v29 = *(_QWORD *)(*(_QWORD *)(v23 + 48) + 16);
  *a3 = v29;
  if (v29 != -1)
    return sub_10000554C((FILE *)7, "__notify_server_set_state_3 %d %d %llu [%llu] [uid %d%s gid %d]\n", v17, v18, v19, v20, v21, v22, v31);
  return sub_10000554C((FILE *)7, "__notify_server_set_state_3 %d %d %llu [uid %d%s gid %d]\n", v17, v18, v19, v20, v21, v22, v31);
}

FILE *sub_100006274(FILE *result, uint64_t a2)
{
  int v3;
  unsigned int size;
  uint64_t v5;
  int v6;
  __int128 v7;
  __int128 v8[2];

  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 48)
  {
    v3 = -304;
  }
  else
  {
    if (!LODWORD(result->_cookie) && HIDWORD(result->_cookie) > 0x1F)
    {
      size = result->_bf._size;
      v5 = *(_QWORD *)(&result->_bf._size + 1);
      v6 = *(&result->_lbfsize + 1);
      v7 = *(_OWORD *)((char *)&result->_write + 4);
      v8[0] = *(_OWORD *)((char *)&result->_read + 4);
      v8[1] = v7;
      result = sub_100006058(size, v5, (_QWORD *)(a2 + 36), (int *)(a2 + 44), v6, v8, 0);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100006334(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  __int128 v5;
  _OWORD v6[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v4 = -304;
  }
  else
  {
    v3 = *(_DWORD *)(result + 24);
    result += 24;
    if (!v3 && *(_DWORD *)(result + 4) > 0x1Fu)
    {
      v5 = *(_OWORD *)(result + 36);
      v6[0] = *(_OWORD *)(result + 20);
      v6[1] = v5;
      result = sub_10000318C((_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44), v6);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000063E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = os_set_32_ptr_delete();
  if (result != a3)
    __assert_rtn("_nc_table_delete_n", "table.c", 76, "os_set_delete(&t->set, key) == expected");
  return result;
}

uint64_t sub_10000642C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

uint64_t sub_100006444(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

void sub_10000645C(unsigned int *a1)
{
  mach_port_name_t *v2;

  if (*(_QWORD *)a1)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
    __break(1u);
  }
  else
  {
    v2 = a1 + 2;
    sub_1000063E4((uint64_t)&unk_1000141F0, a1[2], (uint64_t)(a1 + 2));
    mach_port_deallocate(mach_task_self_, *v2);
    ++dword_10001427C;
    free(a1);
  }
}

void sub_1000064E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)a1;
  if (v2)
  {
    do
    {
      v3 = *(_QWORD *)(v2 + 16);
      sub_100003DF8(v2);
      v2 = v3;
    }
    while (v3);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
}

void sub_100006520(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;

  if (*a1)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
    __break(1u);
  }
  else
  {
    v2 = a1 + 2;
    sub_1000063E4((uint64_t)&unk_100014210, *((unsigned int *)a1 + 4), (uint64_t)(a1 + 2));
    ++dword_10001427C;
    v10 = (unsigned int *)v2[1];
    if (v10)
      sub_1000065AC(v10, v3, v4, v5, v6, v7, v8, v9);
    dispatch_release((dispatch_object_t)a1[1]);
    free(a1);
  }
}

void sub_1000065AC(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;

  v9 = a1[3];
  if ((v9 & 4) != 0)
  {
    if (*(_QWORD *)a1)
    {
      qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
      __break(1u);
    }
    else
    {
      sub_10000554C((FILE *)7, "do_mach_notify_dead_name freed port %x\n", a3, a4, a5, a6, a7, a8, (char)a1);
      sub_10000645C(a1);
    }
  }
  else
  {
    a1[3] = v9 | 4;
  }
}

uint64_t sub_100006630(char *a1, unsigned int a2, int a3, __int128 *a4)
{
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned int v23;
  int v24;
  int v25;
  unint64_t v26;

  v26 = 0;
  v24 = -1;
  v25 = -1;
  v23 = -1;
  v8 = a4[1];
  v21 = *a4;
  v22 = v8;
  sub_100005648(&v21, a2, (uid_t *)&v25, (gid_t *)&v24, &v23, &v26);
  *(_QWORD *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  *(_QWORD *)&xmmword_1000140B8 = xmmword_1000140B8 + 1;
  sub_10000554C((FILE *)7, "__notify_server_register_signal %s %d %d %d\n", v9, v10, v11, v12, v13, v14, (char)a1);
  if (!a1)
    return 1;
  v15 = v23;
  *(_QWORD *)&v21 = 0;
  result = sub_10000572C(a1, v23, a2, v25, v24, &v21);
  if (!(_DWORD)result)
  {
    v17 = v21;
    *(_BYTE *)(v21 + 79) = *(_BYTE *)(v21 + 79) & 0xF0 | 5;
    *(_DWORD *)(v17 + 68) = v15;
    *(_DWORD *)(v17 + 56) = a3;
    v18 = os_set_64_ptr_find(&unk_1000141D0, v26);
    if (v18)
      v19 = (uint64_t *)(v18 - qword_1000141E8);
    else
      v19 = 0;
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      v20 = a4[1];
      v21 = *a4;
      v22 = v20;
      sub_10000C77C(a1, (uint64_t)v19, &v21);
    }
    sub_100004D74(v19, v23);
    return 0;
  }
  return result;
}

uint64_t sub_100006790(char *a1, unsigned int a2, uint64_t a3, __int128 *a4)
{
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned int v23;
  int v24;
  int v25;
  unint64_t v26;

  v26 = 0;
  v24 = -1;
  v25 = -1;
  v23 = -1;
  v8 = a4[1];
  v21 = *a4;
  v22 = v8;
  sub_100005648(&v21, a2, (uid_t *)&v25, (gid_t *)&v24, &v23, &v26);
  *(_QWORD *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  ++*((_QWORD *)&xmmword_1000140B8 + 1);
  sub_10000554C((FILE *)7, "__notify_server_register_file_descriptor %s %d %d\n", v9, v10, v11, v12, v13, v14, (char)a1);
  v15 = fileport_makefd(a3);
  result = mach_port_deallocate(mach_task_self_, a3);
  if ((v15 & 0x80000000) == 0)
  {
    result = fcntl_NOCANCEL(v15, 3);
    if ((result & 0x80000000) == 0)
    {
      result = fcntl_NOCANCEL(v15, 4);
      if ((result & 0x80000000) == 0)
      {
        if (a1)
        {
          *(_QWORD *)&v21 = 0;
          result = sub_10000572C(a1, v23, a2, v25, v24, &v21);
          if (!(_DWORD)result)
          {
            v17 = v21;
            *(_BYTE *)(v21 + 79) = *(_BYTE *)(v21 + 79) & 0xF0 | 4;
            *(_DWORD *)(v17 + 56) = v15;
            v18 = os_set_64_ptr_find(&unk_1000141D0, v26);
            if (v18)
              v19 = (uint64_t *)(v18 - qword_1000141E8);
            else
              v19 = 0;
            if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
            {
              v20 = a4[1];
              v21 = *a4;
              v22 = v20;
              sub_10000C77C(a1, (uint64_t)v19, &v21);
            }
            return (uint64_t)sub_100004D74(v19, v23);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100006928(char *a1, unsigned int a2, uint64_t a3, __int128 *a4)
{
  uint64_t v8;
  BOOL v9;
  __int128 v10;
  __int128 v12[2];

  v8 = os_set_32_ptr_find(&unk_1000141F0, a3);
  if (v8)
    v9 = qword_100014208 == v8;
  else
    v9 = 1;
  if (v9)
    return mach_port_deallocate(mach_task_self_, a3);
  v10 = a4[1];
  v12[0] = *a4;
  v12[1] = v10;
  return sub_1000069D0(a1, a2, a3, v12);
}

uint64_t sub_1000069D0(char *a1, unsigned int a2, uint64_t a3, __int128 *a4)
{
  uint64_t result;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t **v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  unsigned int v27;
  int v28;
  int v29;
  unint64_t v30;

  v30 = 0;
  v28 = -1;
  v29 = -1;
  v27 = -1;
  if ((a3 + 1) < 2)
    return 59;
  v9 = a4[1];
  v25 = *a4;
  v26 = v9;
  sub_100005648(&v25, a2, (uid_t *)&v29, (gid_t *)&v28, &v27, &v30);
  *(_QWORD *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  ++qword_1000140C8;
  sub_10000554C((FILE *)7, "__notify_server_register_mach_port %s %d %d\n", v10, v11, v12, v13, v14, v15, (char)a1);
  if (a1 && (*(_QWORD *)&v25 = 0, !sub_10000572C(a1, v27, a2, v29, v28, &v25)))
  {
    v16 = v25;
    *(_BYTE *)(v25 + 79) = *(_BYTE *)(v25 + 79) & 0xF0 | 3;
    *(_DWORD *)(v16 + 56) = a3;
    v17 = os_set_64_ptr_find(&unk_1000141D0, v30);
    if (v17)
      v18 = (uint64_t *)(v17 - qword_1000141E8);
    else
      v18 = 0;
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      v19 = a4[1];
      v25 = *a4;
      v26 = v19;
      sub_10000C77C(a1, (uint64_t)v18, &v25);
    }
    sub_100004D74(v18, v27);
    v20 = os_set_32_ptr_find(&unk_1000141F0, a3);
    if (v20 && (v21 = (uint64_t **)(v20 - qword_100014208), v20 != qword_100014208))
    {
      v24 = (uint64_t)*v21;
      v18[4] = (uint64_t)*v21;
      if (v24)
        *(_QWORD *)(v24 + 40) = v18 + 4;
      result = 0;
      *v21 = v18;
      v18[5] = (uint64_t)v21;
    }
    else
    {
      result = (uint64_t)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
      if (result)
      {
        v22 = (uint64_t *)result;
        ++dword_100014278;
        *(_QWORD *)result = 0;
        *(_DWORD *)(result + 8) = a3;
        os_set_32_ptr_insert(&unk_1000141F0, result + 8);
        v23 = *v22;
        v18[4] = *v22;
        if (v23)
          *(_QWORD *)(v23 + 40) = v18 + 4;
        *v22 = (uint64_t)v18;
        v18[5] = (uint64_t)v22;
        if (mach_port_insert_right(mach_task_self_, a3, a3, 0x13u))
          sub_100003DF8((uint64_t)v18);
        else
          sub_100003720(a3);
        return 0;
      }
      else
      {
        qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
        __break(1u);
      }
    }
  }
  else
  {
    mach_port_deallocate(mach_task_self_, a3);
    return 7;
  }
  return result;
}

unint64_t sub_100006C44(unint64_t result, char *a2, int a3, int a4, __int128 *a5)
{
  unsigned int v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned int v23;
  gid_t v24;
  uid_t v25;

  v8 = result;
  v24 = -1;
  v25 = -1;
  v23 = -1;
  if (a2 || !a3)
  {
    if (!a2)
      goto LABEL_8;
    if (a3)
    {
      v9 = (a3 - 1);
      if (__CFADD__(a2, v9))
      {
        __break(0x5513u);
        return result;
      }
      if (!a2[v9])
      {
LABEL_8:
        v10 = a5[1];
        v21 = *a5;
        v22 = v10;
        sub_100005648(&v21, 0xFFFFFFFF, &v25, &v24, &v23, 0);
        ++*((_QWORD *)&xmmword_100014158 + 1);
        sub_10000554C((FILE *)7, "__notify_server_monitor_file %d %d %s 0x%08x\n", v11, v12, v13, v14, v15, v16, v23);
        result = os_set_64_ptr_find(&unk_1000141D0, v8 | ((unint64_t)v23 << 32));
        if (result)
        {
          v17 = result - qword_1000141E8;
          if (result != qword_1000141E8)
          {
            v18 = *(_QWORD *)(v17 + 48);
            if (!v18)
              __assert_rtn("__notify_server_monitor_file_2", "notify_proc.c", 1373, "n != NULL");
            v19 = *(_QWORD *)(v18 + 8);
            v20 = a5[1];
            v21 = *a5;
            v22 = v20;
            return sub_10000C424(v19, v17, a2, &v21, a4);
          }
        }
      }
    }
  }
  return result;
}

uint64_t *sub_100006D74(uint64_t *result, unint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, unint64_t a8, char *a9, int a10, int a11, int *a12, _QWORD *a13, int *a14, _OWORD *a15)
{
  int v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _OWORD *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  BOOL v36;
  _BOOL4 v37;
  _BOOL4 v38;
  __int128 v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  int v47;
  audit_token_t atoken;
  int v51;
  pid_t pidp[3];

  pidp[0] = -1;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  if (!a9 && a10)
    goto LABEL_3;
  if (!a9)
    goto LABEL_10;
  if (!a10)
    goto LABEL_3;
  v19 = (a10 - 1);
  if (__CFADD__(a9, v19))
  {
LABEL_44:
    __break(0x5513u);
    return result;
  }
  if (a9[v19])
  {
LABEL_3:
    v18 = 6;
  }
  else
  {
LABEL_10:
    v20 = (char *)result;
    *(_QWORD *)&xmmword_100014178 = xmmword_100014178 + 1;
    v21 = a15[1];
    *(_OWORD *)atoken.val = *a15;
    *(_OWORD *)&atoken.val[4] = v21;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
    v46 = a7;
    v47 = a5;
    v23 = a2;
    sub_10000554C((FILE *)7, "__notify_server_regenerate %s %d %d %d %u %d %d %llu %s %d\n", v24, v25, v26, v27, v28, v29, (char)v20);
    v30 = a2 | ((unint64_t)pidp[0] << 32);
    result = (uint64_t *)os_set_64_ptr_find(&unk_1000141D0, v30);
    if (!result || (uint64_t *)qword_1000141E8 == result)
    {
      switch(a3)
      {
        case 1:
          if (dword_1000142D8 <= a6)
            goto LABEL_3;
          v31 = a15;
          v32 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v32;
          result = sub_100004AC4(v20, a2, &v51, a12, a13, a14, (__int128 *)&atoken);
          if (*a14)
            goto LABEL_36;
          v33 = *a12;
          if ((_DWORD)v33 == -1)
            goto LABEL_36;
          v34 = qword_1000142F0;
          if (!qword_1000142F0)
            goto LABEL_36;
          v35 = __CFADD__(qword_1000142E0, 4 * v33);
          v36 = qword_1000142E0 + 4 * v33 >= (unint64_t)qword_1000142E0;
          if ((int)v33 < 0)
            v36 = v35;
          if (!v36)
            goto LABEL_44;
          v37 = __CFADD__(qword_1000142F0, 4 * a6);
          v38 = qword_1000142F0 + 4 * a6 >= (unint64_t)qword_1000142F0;
          if (a6 < 0)
            v38 = v37;
          if (!v38)
            goto LABEL_44;
          *(_DWORD *)(qword_1000142E0 + 4 * v33) = *(_DWORD *)(qword_1000142E0 + 4 * v33)
                                                 + *(_DWORD *)(qword_1000142F0 + 4 * a6)
                                                 - 1;
          *(_DWORD *)(v34 + 4 * a6) = 0;
          v23 = a2;
LABEL_36:
          if (a9)
          {
            v43 = v31[1];
            *(_OWORD *)atoken.val = *v31;
            *(_OWORD *)&atoken.val[4] = v43;
            sub_100006C44(v23, a9, a10, a11, (__int128 *)&atoken);
          }
          result = (uint64_t *)os_set_64_ptr_find(&unk_1000141D0, v30);
          if (result)
          {
            v44 = qword_1000141E8;
            if ((uint64_t *)qword_1000141E8 != result)
            {
              *a14 = 0;
              v45 = *(_QWORD **)((char *)result - v44 + 48);
              *a13 = v45[2];
              if (v45[4] < a8)
                v45[3] = v46;
              return result;
            }
          }
          if (*a14)
            return result;
          v18 = 50;
          break;
        case 2:
          v31 = a15;
          v39 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v39;
          v40 = sub_100004860(v20, a2, (__int128 *)&atoken);
          goto LABEL_35;
        case 5:
          v31 = a15;
          v41 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v41;
          v40 = sub_100006630(v20, a2, v47, (__int128 *)&atoken);
          goto LABEL_35;
        case 7:
          v31 = a15;
          v42 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v42;
          v40 = sub_100005380(v20, a2, (__int128 *)&atoken);
LABEL_35:
          *a14 = v40;
          goto LABEL_36;
        default:
          v18 = 52;
          break;
      }
    }
    else
    {
      v18 = 51;
    }
  }
  *a14 = v18;
  return result;
}

uint64_t sub_1000070C8(uint64_t a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t result;
  audit_token_t atoken;

  v4 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v4;
  if (audit_token_to_euid(&atoken))
    return mach_port_deallocate(mach_task_self_, a1);
  v5 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v5;
  if (sandbox_check_by_audit_token(&atoken, "forbidden-remote-device-admin", 0))
    return mach_port_deallocate(mach_task_self_, a1);
  v6 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v6;
  if (!sub_100005EA4(&atoken, (uint64_t)"com.apple.private.libnotify.statecapture"))
    return mach_port_deallocate(mach_task_self_, a1);
  v7 = fileport_makefd(a1);
  result = mach_port_deallocate(mach_task_self_, a1);
  if ((v7 & 0x80000000) == 0)
  {
    if ((fcntl_NOCANCEL(v7, 3) & 0x80000000) == 0 && (fcntl_NOCANCEL(v7, 4) & 0x80000000) == 0)
      sub_1000073DC(0, v7);
    return close_NOCANCEL(v7);
  }
  return result;
}

uint64_t sub_1000071BC(char *a1, unsigned int a2, _DWORD *a3, mach_port_name_t *a4, __int128 *a5)
{
  __int128 v10;
  uint64_t result;
  __int128 v12[2];
  mach_port_options_t options;
  mach_port_name_t name;

  *a3 = 0;
  name = 0;
  *a4 = 0;
  *(_OWORD *)&options.flags = xmmword_10000E3F0;
  options.reserved[1] = 0;
  if (mach_port_construct(mach_task_self_, &options, 0, &name))
    __assert_rtn("__notify_server_register_mach_port_3", "notify_proc.c", 1794, "kstatus == KERN_SUCCESS");
  if (mach_port_insert_right(mach_task_self_, name, name, 0x14u))
    __assert_rtn("__notify_server_register_mach_port_3", "notify_proc.c", 1798, "kstatus == KERN_SUCCESS");
  v10 = a5[1];
  v12[0] = *a5;
  v12[1] = v10;
  result = sub_1000069D0(a1, a2, name, v12);
  *a3 = result;
  if ((_DWORD)result)
    return mach_port_destruct(mach_task_self_, name, -1, 0);
  *a4 = name;
  return result;
}

uint64_t *sub_1000072DC(uint64_t *a1, unint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, unint64_t a8, char *a9, int a10, int a11, int *a12, _QWORD *a13, int *a14, __int128 *a15)
{
  __int128 v18;
  __int128 v19;
  __int128 v21;
  __int128 v27;
  __int128 v28;

  v18 = a15[1];
  v27 = *a15;
  v28 = v18;
  if (sandbox_check_by_audit_token(&v27, "darwin-notification-post", 9))
  {
    v19 = a15[1];
    v27 = *a15;
    v28 = v19;
    return sub_100006D74(a1, a2, a3, a4, a5, a6, 0, 0, a9, a10, a11, a12, a13, a14, &v27);
  }
  else
  {
    v21 = a15[1];
    v27 = *a15;
    v28 = v21;
    return sub_100006D74(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, &v27);
  }
}

FILE *sub_1000073DC(int a1, int a2)
{
  FILE *result;
  pid_t v4;
  FILE *v5;
  FILE *v6;
  FILE *v7;
  int v8;
  tm *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  char v41[8];
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void *v44;
  _QWORD *v45;
  void *v46;

  if (a2 < 0)
  {
    result = (FILE *)qword_100014048;
    if (!qword_100014048)
    {
      v4 = getpid();
      asprintf((char **)&qword_100014048, "/var/run/notifyd_%u.status", v4);
      result = (FILE *)qword_100014048;
      if (!qword_100014048)
        return result;
    }
    unlink((const char *)result);
    result = fopen((const char *)qword_100014048, "w");
  }
  else
  {
    result = fdopen(a2, "w");
  }
  v5 = result;
  if (!result)
    return result;
  if (os_variant_has_internal_diagnostics("com.apple.notifyd"))
  {
    v6 = fopen("/var/run/notifyd_jetsam.log", "r");
    if (v6)
    {
      v7 = v6;
      while (1)
      {
        v8 = fgetc(v7);
        if (v8 == -1)
          break;
        fputc(v8, v5);
      }
      fclose(v7);
    }
  }
  if (a1 != 1)
  {
    if (!a1)
      sub_100008114(v5);
    return (FILE *)fclose(v5);
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2000000000;
  v40 = 0;
  if (fprintf(v5, "--- GLOBALS ---\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "%u slots (current id %u)\n", dword_1000142D8, dword_1000142DC) < 0)
    goto LABEL_133;
  if (fprintf(v5, "%u log_cutoff (default %u)\n", dword_1000142F8, dword_1000142FC) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "--- STATISTICS ---\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "post         %llu\n", (_QWORD)xmmword_100014078) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    id       %llu\n", qword_100014088) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    name     %llu\n", (_QWORD)xmmword_100014090) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    fetch    %llu\n", *((_QWORD *)&xmmword_100014090 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    no_op    %llu\n", *((_QWORD *)&xmmword_100014078 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "register     %llu\n", (_QWORD)xmmword_1000140A0) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    plain    %llu\n", *((_QWORD *)&xmmword_1000140A0 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    check    %llu\n", qword_1000140B0) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    signal   %llu\n", (_QWORD)xmmword_1000140B8) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    file     %llu\n", *((_QWORD *)&xmmword_1000140B8 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    port     %llu\n", qword_1000140C8) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    event    %llu\n", qword_1000140D0) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    common   %llu\n", (_QWORD)xmmword_1000140D8) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "check        %llu\n", qword_100014108) < 0)
    goto LABEL_133;
  if (fprintf(v5, "cancel       %llu\n", *((_QWORD *)&xmmword_1000140D8 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "cleanup      %llu\n", qword_100014170) < 0)
    goto LABEL_133;
  if (fprintf(v5, "regenerate   %llu\n", (_QWORD)xmmword_100014178) < 0)
    goto LABEL_133;
  if (fprintf(v5, "checkin      %llu\n", *((_QWORD *)&xmmword_100014178 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "suspend      %llu\n", qword_1000140E8) < 0)
    goto LABEL_133;
  if (fprintf(v5, "resume       %llu\n", qword_1000140F0) < 0)
    goto LABEL_133;
  if (fprintf(v5, "suspend_pid  %llu\n", (_QWORD)xmmword_1000140F8) < 0)
    goto LABEL_133;
  if (fprintf(v5, "resume_pid   %llu\n", *((_QWORD *)&xmmword_1000140F8 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "get_state    %llu\n", (_QWORD)xmmword_100014110) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    id       %llu\n", unk_100014120) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    client   %llu\n", *((_QWORD *)&xmmword_100014110 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    fetch    %llu\n", qword_100014128) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "set_state    %llu\n", qword_100014130) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    id       %llu\n", *((_QWORD *)&xmmword_100014138 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    client   %llu\n", (_QWORD)xmmword_100014138) < 0)
    goto LABEL_133;
  if (fprintf(v5, "    fetch    %llu\n", qword_100014148) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "set_owner    %llu\n", qword_100014150) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "set_access   %llu\n", (_QWORD)xmmword_100014158) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "monitor      %llu\n", *((_QWORD *)&xmmword_100014158 + 1)) < 0)
    goto LABEL_133;
  if (fprintf(v5, "svc_path     %llu\n", qword_100014168) < 0)
    goto LABEL_133;
  v9 = localtime(&qword_1000142D0);
  strftime(v41, 0x80uLL, "%a, %d %b %Y %T %z", v9);
  if (fprintf(v5, "last reset time was %s\n", v41) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "name         alloc %9u   free %9u   extant %9u\n", dword_100014268, dword_10001426C, dword_100014268 - dword_10001426C) < 0)goto LABEL_133;
  if (fprintf(v5, "subscription alloc %9u   free %9u   extant %9u\n", dword_100014270, dword_100014274, dword_100014270 - dword_100014274) < 0)goto LABEL_133;
  if (fprintf(v5, "portproc     alloc %9u   free %9u   extant %9u\n", dword_100014278, dword_10001427C, dword_100014278 - dword_10001427C) < 0)goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  v10 = os_set_32_ptr_count(&unk_1000141F0);
  if (fprintf(v5, "port count   %u\n", v10) < 0)
    goto LABEL_133;
  v11 = os_set_32_ptr_count(&unk_100014210);
  if (fprintf(v5, "proc count   %u\n", v11) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "--- NAME TABLE ---\n") < 0)
    goto LABEL_133;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 0x40000000;
  v36[2] = sub_100008AF4;
  v36[3] = &unk_100010758;
  v36[4] = &v37;
  v36[5] = v5;
  *(_QWORD *)v41 = _NSConcreteStackBlock;
  v42 = 0x40000000;
  v43 = sub_10000642C;
  v44 = &unk_100010528;
  v45 = v36;
  v46 = &unk_100014190;
  os_set_str_ptr_foreach(&unk_100014190, v41);
  v12 = os_set_str_ptr_count(&unk_100014190);
  if (fprintf(v5, "--- NAME COUNT %u ---\n", v12) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "--- SUBSCRIPTION TABLE ---\n") < 0)
    goto LABEL_133;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 0x40000000;
  v35[2] = sub_100008ECC;
  v35[3] = &unk_100010778;
  v35[4] = v5;
  *(_QWORD *)v41 = _NSConcreteStackBlock;
  v42 = 0x40000000;
  v43 = sub_100006444;
  v44 = &unk_100010550;
  v45 = v35;
  v46 = &unk_1000141D0;
  os_set_64_ptr_foreach(&unk_1000141D0, v41);
  v13 = os_set_64_ptr_count(&unk_1000141D0);
  if (fprintf(v5, "--- SUBSCRIPTION COUNT %u ---\n", v13) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  result = (FILE *)fprintf(v5, "--- CONTROLLED NAME ---\n");
  if ((result & 0x80000000) != 0)
    goto LABEL_133;
  v14 = dword_10001425C;
  if (dword_10001425C)
  {
    v15 = 0;
    v16 = 0;
    do
    {
      if (__CFADD__(qword_100014248, v15))
      {
        __break(0x5513u);
LABEL_137:
        __break(0x5500u);
        return result;
      }
      result = (FILE *)fprintf(v5, "%s %u %u %03x\n", *(const char **)(*(_QWORD *)(qword_100014248 + v15) + 8), *(_DWORD *)(*(_QWORD *)(qword_100014248 + v15) + 40), *(_DWORD *)(*(_QWORD *)(qword_100014248 + v15) + 44), *(_DWORD *)(*(_QWORD *)(qword_100014248 + v15) + 48));
      if ((result & 0x80000000) != 0)
        goto LABEL_133;
      ++v16;
      v14 = dword_10001425C;
      v15 += 8;
    }
    while (v16 < dword_10001425C);
  }
  if (fprintf(v5, "--- CONTROLLED NAME COUNT %u ---\n", v14) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "--- PUBLIC SERVICE ---\n") < 0)
    goto LABEL_133;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 0x40000000;
  v34[2] = sub_100008F04;
  v34[3] = &unk_100010798;
  v34[4] = v5;
  *(_QWORD *)v41 = _NSConcreteStackBlock;
  v42 = 0x40000000;
  v43 = sub_100006444;
  v44 = &unk_100010550;
  v45 = v34;
  v46 = &unk_1000141D0;
  os_set_64_ptr_foreach(&unk_1000141D0, v41);
  v17 = os_set_str_ptr_count(&unk_100014190);
  if (fprintf(v5, "--- PUBLIC SERVICE COUNT %u ---\n", v17) < 0)
    goto LABEL_133;
  if (fprintf(v5, "\n") < 0)
    goto LABEL_133;
  if (fprintf(v5, "--- PRIVATE SERVICE ---\n") < 0)
    goto LABEL_133;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 0x40000000;
  v33[2] = sub_100008FD4;
  v33[3] = &unk_1000107B8;
  v33[4] = v5;
  *(_QWORD *)v41 = _NSConcreteStackBlock;
  v42 = 0x40000000;
  v43 = sub_100006444;
  v44 = &unk_100010550;
  v45 = v33;
  v46 = &unk_1000141D0;
  os_set_64_ptr_foreach(&unk_1000141D0, v41);
  v18 = os_set_64_ptr_count(&unk_1000141D0);
  if (fprintf(v5, "--- PRIVATE SERVICE COUNT %u ---\n", v18) < 0
    || fprintf(v5, "\n") < 0
    || fprintf(v5, "--- PROCESSES ---\n") < 0)
  {
    goto LABEL_133;
  }
  if ((v38[3] & 0x80000000) != 0)
  {
LABEL_132:
    fwrite("-- END --\n", 0xAuLL, 1uLL, v5);
    goto LABEL_133;
  }
  v19 = 0;
  while (1)
  {
    result = (FILE *)os_set_32_ptr_find(&unk_100014210, v19);
    if (result)
    {
      v32 = (uint64_t *)((char *)result - qword_100014228);
      if (result != (FILE *)qword_100014228)
        break;
    }
LABEL_130:
    v28 = __OFADD__((_DWORD)v19, 1);
    v19 = (v19 + 1);
    if (v28)
      goto LABEL_137;
    if ((int)v19 > *((_DWORD *)v38 + 6))
      goto LABEL_132;
  }
  v20 = *v32;
  if (*v32)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    do
    {
      switch(*(_BYTE *)(v20 + 79) & 0xF)
      {
        case 1:
          v28 = __OFADD__(v27++, 1);
          if (v28)
            goto LABEL_137;
          break;
        case 2:
          v28 = __OFADD__(v26++, 1);
          if (v28)
            goto LABEL_137;
          break;
        case 3:
          v28 = __OFADD__(v24++, 1);
          if (v28)
            goto LABEL_137;
          break;
        case 4:
          v28 = __OFADD__(v25++, 1);
          if (v28)
            goto LABEL_137;
          break;
        case 5:
          v28 = __OFADD__(v23++, 1);
          if (v28)
            goto LABEL_137;
          break;
        case 6:
          v28 = __OFADD__(v22++, 1);
          if (v28)
            goto LABEL_137;
          break;
        case 7:
          v28 = __OFADD__(v21++, 1);
          if (v28)
            goto LABEL_137;
          break;
        default:
          break;
      }
      v20 = *(_QWORD *)(v20 + 16);
    }
    while (v20);
  }
  else
  {
    v27 = 0;
    v26 = 0;
    v25 = 0;
    v24 = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
  }
  if (fprintf(v5, "pid: %u   ", v19) < 0
    || fprintf(v5, "memory %u   plain %u   port %u   file %u   signal %u   event %u   common %u\n", v27, v26, v24, v25, v23, v22, v21) < 0)
  {
    goto LABEL_133;
  }
  v29 = *v32;
  if (!*v32)
  {
LABEL_129:
    result = (FILE *)fprintf(v5, "\n");
    if ((result & 0x80000000) != 0)
      goto LABEL_133;
    goto LABEL_130;
  }
  while (1)
  {
    v30 = *(_BYTE *)(v29 + 79) & 0xF;
    v31 = "unknown";
    if (v30 <= 7)
      v31 = (&off_100010840)[v30];
    if (fprintf(v5, "  %s: %s\n", v31, *(const char **)(*(_QWORD *)(v29 + 48) + 8)) < 0)
      break;
    v29 = *(_QWORD *)(v29 + 16);
    if (!v29)
      goto LABEL_129;
  }
LABEL_133:
  _Block_object_dispose(&v37, 8);
  return (FILE *)fclose(v5);
}

size_t sub_100008114(FILE *a1)
{
  size_t result;
  tm *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  char v15[8];
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  _QWORD *v19;
  void *v20;

  result = fprintf(a1, "--- GLOBALS ---\n");
  if ((result & 0x80000000) == 0)
  {
    result = fprintf(a1, "%u slots (current id %u)\n", dword_1000142D8, dword_1000142DC);
    if ((result & 0x80000000) == 0)
    {
      result = fprintf(a1, "%u log_cutoff (default %u)\n", dword_1000142F8, dword_1000142FC);
      if ((result & 0x80000000) == 0)
      {
        result = fprintf(a1, "\n");
        if ((result & 0x80000000) == 0)
        {
          result = fprintf(a1, "--- STATISTICS ---\n");
          if ((result & 0x80000000) == 0)
          {
            result = fprintf(a1, "post         %llu\n", (_QWORD)xmmword_100014078);
            if ((result & 0x80000000) == 0)
            {
              result = fprintf(a1, "    id       %llu\n", qword_100014088);
              if ((result & 0x80000000) == 0)
              {
                result = fprintf(a1, "    name     %llu\n", (_QWORD)xmmword_100014090);
                if ((result & 0x80000000) == 0)
                {
                  result = fprintf(a1, "    fetch    %llu\n", *((_QWORD *)&xmmword_100014090 + 1));
                  if ((result & 0x80000000) == 0)
                  {
                    result = fprintf(a1, "    no_op    %llu\n", *((_QWORD *)&xmmword_100014078 + 1));
                    if ((result & 0x80000000) == 0)
                    {
                      result = fprintf(a1, "\n");
                      if ((result & 0x80000000) == 0)
                      {
                        result = fprintf(a1, "register     %llu\n", (_QWORD)xmmword_1000140A0);
                        if ((result & 0x80000000) == 0)
                        {
                          result = fprintf(a1, "    plain    %llu\n", *((_QWORD *)&xmmword_1000140A0 + 1));
                          if ((result & 0x80000000) == 0)
                          {
                            result = fprintf(a1, "    check    %llu\n", qword_1000140B0);
                            if ((result & 0x80000000) == 0)
                            {
                              result = fprintf(a1, "    signal   %llu\n", (_QWORD)xmmword_1000140B8);
                              if ((result & 0x80000000) == 0)
                              {
                                result = fprintf(a1, "    file     %llu\n", *((_QWORD *)&xmmword_1000140B8 + 1));
                                if ((result & 0x80000000) == 0)
                                {
                                  result = fprintf(a1, "    port     %llu\n", qword_1000140C8);
                                  if ((result & 0x80000000) == 0)
                                  {
                                    result = fprintf(a1, "    event    %llu\n", qword_1000140D0);
                                    if ((result & 0x80000000) == 0)
                                    {
                                      result = fprintf(a1, "    common   %llu\n", (_QWORD)xmmword_1000140D8);
                                      if ((result & 0x80000000) == 0)
                                      {
                                        result = fprintf(a1, "\n");
                                        if ((result & 0x80000000) == 0)
                                        {
                                          result = fprintf(a1, "check        %llu\n", qword_100014108);
                                          if ((result & 0x80000000) == 0)
                                          {
                                            result = fprintf(a1, "cancel       %llu\n", *((_QWORD *)&xmmword_1000140D8 + 1));
                                            if ((result & 0x80000000) == 0)
                                            {
                                              result = fprintf(a1, "cleanup      %llu\n", qword_100014170);
                                              if ((result & 0x80000000) == 0)
                                              {
                                                result = fprintf(a1, "regenerate   %llu\n", (_QWORD)xmmword_100014178);
                                                if ((result & 0x80000000) == 0)
                                                {
                                                  result = fprintf(a1, "checkin      %llu\n", *((_QWORD *)&xmmword_100014178 + 1));
                                                  if ((result & 0x80000000) == 0)
                                                  {
                                                    result = fprintf(a1, "\n");
                                                    if ((result & 0x80000000) == 0)
                                                    {
                                                      result = fprintf(a1, "suspend      %llu\n", qword_1000140E8);
                                                      if ((result & 0x80000000) == 0)
                                                      {
                                                        result = fprintf(a1, "resume       %llu\n", qword_1000140F0);
                                                        if ((result & 0x80000000) == 0)
                                                        {
                                                          result = fprintf(a1, "suspend_pid  %llu\n", (_QWORD)xmmword_1000140F8);
                                                          if ((result & 0x80000000) == 0)
                                                          {
                                                            result = fprintf(a1, "resume_pid   %llu\n", *((_QWORD *)&xmmword_1000140F8 + 1));
                                                            if ((result & 0x80000000) == 0)
                                                            {
                                                              result = fprintf(a1, "\n");
                                                              if ((result & 0x80000000) == 0)
                                                              {
                                                                result = fprintf(a1, "get_state    %llu\n", (_QWORD)xmmword_100014110);
                                                                if ((result & 0x80000000) == 0)
                                                                {
                                                                  result = fprintf(a1, "    id       %llu\n", unk_100014120);
                                                                  if ((result & 0x80000000) == 0)
                                                                  {
                                                                    result = fprintf(a1, "    client   %llu\n", *((_QWORD *)&xmmword_100014110 + 1));
                                                                    if ((result & 0x80000000) == 0)
                                                                    {
                                                                      result = fprintf(a1, "    fetch    %llu\n", qword_100014128);
                                                                      if ((result & 0x80000000) == 0)
                                                                      {
                                                                        result = fprintf(a1, "\n");
                                                                        if ((result & 0x80000000) == 0)
                                                                        {
                                                                          result = fprintf(a1, "set_state    %llu\n", qword_100014130);
                                                                          if ((result & 0x80000000) == 0)
                                                                          {
                                                                            result = fprintf(a1, "    id       %llu\n", *((_QWORD *)&xmmword_100014138 + 1));
                                                                            if ((result & 0x80000000) == 0)
                                                                            {
                                                                              result = fprintf(a1, "    client   %llu\n", (_QWORD)xmmword_100014138);
                                                                              if ((result & 0x80000000) == 0)
                                                                              {
                                                                                result = fprintf(a1, "    fetch    %llu\n", qword_100014148);
                                                                                if ((result & 0x80000000) == 0)
                                                                                {
                                                                                  result = fprintf(a1, "\n");
                                                                                  if ((result & 0x80000000) == 0)
                                                                                  {
                                                                                    result = fprintf(a1, "set_owner    %llu\n", qword_100014150);
                                                                                    if ((result & 0x80000000) == 0)
                                                                                    {
                                                                                      result = fprintf(a1, "\n");
                                                                                      if ((result & 0x80000000) == 0)
                                                                                      {
                                                                                        result = fprintf(a1, "set_access   %llu\n", (_QWORD)xmmword_100014158);
                                                                                        if ((result & 0x80000000) == 0)
                                                                                        {
                                                                                          result = fprintf(a1, "\n");
                                                                                          if ((result & 0x80000000) == 0)
                                                                                          {
                                                                                            result = fprintf(a1, "monitor      %llu\n", *((_QWORD *)&xmmword_100014158 + 1));
                                                                                            if ((result & 0x80000000) == 0)
                                                                                            {
                                                                                              result = fprintf(a1, "svc_path     %llu\n", qword_100014168);
                                                                                              if ((result & 0x80000000) == 0)
                                                                                              {
                                                                                                v3 = localtime(&qword_1000142D0);
                                                                                                strftime(v15, 0x80uLL, "%a, %d %b %Y %T %z", v3);
                                                                                                result = fprintf(a1, "last reset time was %s\n", v15);
                                                                                                if ((result & 0x80000000) == 0)
                                                                                                {
                                                                                                  result = fprintf(a1, "\n");
                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                  {
                                                                                                    result = fprintf(a1, "name         alloc %9u   free %9u   extant %9u\n", dword_100014268, dword_10001426C, dword_100014268 - dword_10001426C);
                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                    {
                                                                                                      result = fprintf(a1, "subscription alloc %9u   free %9u   extant %9u\n", dword_100014270, dword_100014274, dword_100014270 - dword_100014274);
                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                      {
                                                                                                        result = fprintf(a1, "portproc     alloc %9u   free %9u   extant %9u\n", dword_100014278, dword_10001427C, dword_100014278 - dword_10001427C);
                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                        {
                                                                                                          result = fprintf(a1, "\n");
                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                          {
                                                                                                            v4 = os_set_32_ptr_count(&unk_1000141F0);
                                                                                                            result = fprintf(a1, "port count   %u\n", v4);
                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                            {
                                                                                                              v5 = os_set_32_ptr_count(&unk_100014210);
                                                                                                              result = fprintf(a1, "proc count   %u\n", v5);
                                                                                                              if ((result & 0x80000000) == 0)
                                                                                                              {
                                                                                                                result = fprintf(a1, "\n");
                                                                                                                if ((result & 0x80000000) == 0)
                                                                                                                {
                                                                                                                  result = fprintf(a1, "--- NAME TABLE ---\n");
                                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                                  {
                                                                                                                    result = fprintf(a1, "Name Info: id, uid, gid, access, refcount, postcount, last hour postcount, slot, val, state\n");
                                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                                    {
                                                                                                                      result = fprintf(a1, "Client Info: client_id, pid,token, lastval, suspend_count, pending, 0, type, type-info\n\n\n");
                                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                                      {
                                                                                                                        v14[0] = _NSConcreteStackBlock;
                                                                                                                        v14[1] = 0x40000000;
                                                                                                                        v14[2] = sub_10000922C;
                                                                                                                        v14[3] = &unk_1000106F0;
                                                                                                                        v14[4] = a1;
                                                                                                                        *(_QWORD *)v15 = _NSConcreteStackBlock;
                                                                                                                        v16 = 0x40000000;
                                                                                                                        v17 = sub_10000642C;
                                                                                                                        v18 = &unk_100010528;
                                                                                                                        v19 = v14;
                                                                                                                        v20 = &unk_100014190;
                                                                                                                        os_set_str_ptr_foreach(&unk_100014190, v15);
                                                                                                                        v6 = os_set_str_ptr_count(&unk_100014190);
                                                                                                                        result = fprintf(a1, "--- NAME COUNT %u ---\n", v6);
                                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                                        {
                                                                                                                          result = fprintf(a1, "\n");
                                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                                          {
                                                                                                                            result = fprintf(a1, "--- CONTROLLED NAME ---\n");
                                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                                            {
                                                                                                                              v7 = dword_10001425C;
                                                                                                                              if (dword_10001425C)
                                                                                                                              {
                                                                                                                                v8 = 0;
                                                                                                                                v9 = 0;
                                                                                                                                while (!__CFADD__(qword_100014248, v8))
                                                                                                                                {
                                                                                                                                  result = fprintf(a1, "%s %u %u %03x\n", *(const char **)(*(_QWORD *)(qword_100014248 + v8) + 8), *(_DWORD *)(*(_QWORD *)(qword_100014248 + v8) + 40), *(_DWORD *)(*(_QWORD *)(qword_100014248 + v8) + 44), *(_DWORD *)(*(_QWORD *)(qword_100014248 + v8) + 48));
                                                                                                                                  if ((result & 0x80000000) != 0)
                                                                                                                                    return result;
                                                                                                                                  ++v9;
                                                                                                                                  v7 = dword_10001425C;
                                                                                                                                  v8 += 8;
                                                                                                                                  if (v9 >= dword_10001425C)
                                                                                                                                    goto LABEL_68;
                                                                                                                                }
                                                                                                                                __break(0x5513u);
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
LABEL_68:
                                                                                                                                result = fprintf(a1, "--- CONTROLLED NAME COUNT %u ---\n", v7);
                                                                                                                                if ((result & 0x80000000) == 0)
                                                                                                                                {
                                                                                                                                  result = fprintf(a1, "\n");
                                                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                                                  {
                                                                                                                                    result = fprintf(a1, "--- PUBLIC SERVICE ---\n");
                                                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                                                    {
                                                                                                                                      v13[0] = _NSConcreteStackBlock;
                                                                                                                                      v13[1] = 0x40000000;
                                                                                                                                      v13[2] = sub_100009474;
                                                                                                                                      v13[3] = &unk_100010710;
                                                                                                                                      v13[4] = a1;
                                                                                                                                      *(_QWORD *)v15 = _NSConcreteStackBlock;
                                                                                                                                      v16 = 0x40000000;
                                                                                                                                      v17 = sub_100006444;
                                                                                                                                      v18 = &unk_100010550;
                                                                                                                                      v19 = v13;
                                                                                                                                      v20 = &unk_1000141D0;
                                                                                                                                      ((void (*)(void))os_set_64_ptr_foreach)();
                                                                                                                                      v10 = os_set_str_ptr_count(&unk_100014190);
                                                                                                                                      result = fprintf(a1, "--- PUBLIC SERVICE COUNT %u ---\n", v10);
                                                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                                                      {
                                                                                                                                        result = fprintf(a1, "\n");
                                                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                                                        {
                                                                                                                                          result = fprintf(a1, "--- PRIVATE SERVICE ---\n");
                                                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                                                          {
                                                                                                                                            v12[0] = _NSConcreteStackBlock;
                                                                                                                                            v12[1] = 0x40000000;
                                                                                                                                            v12[2] = sub_100009544;
                                                                                                                                            v12[3] = &unk_100010730;
                                                                                                                                            v12[4] = a1;
                                                                                                                                            *(_QWORD *)v15 = _NSConcreteStackBlock;
                                                                                                                                            v16 = 0x40000000;
                                                                                                                                            v17 = sub_100006444;
                                                                                                                                            v18 = &unk_100010550;
                                                                                                                                            v19 = v12;
                                                                                                                                            v20 = &unk_1000141D0;
                                                                                                                                            os_set_64_ptr_foreach(&unk_1000141D0, v15);
                                                                                                                                            v11 = os_set_64_ptr_count(&unk_1000141D0);
                                                                                                                                            result = fprintf(a1, "--- PRIVATE SERVICE COUNT %u ---\n", v11);
                                                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                                                            {
                                                                                                                                              result = fprintf(a1, "\n");
                                                                                                                                              if ((result & 0x80000000) == 0)
                                                                                                                                                return fwrite("-- END --\n", 0xAuLL, 1uLL, a1);
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
        }
      }
    }
  }
  return result;
}

uint64_t sub_100008AF4(uint64_t a1, uint64_t a2)
{
  FILE *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  BOOL v19;
  BOOL v20;
  _QWORD *i;
  __int128 v22;
  __int128 v23;

  v4 = *(FILE **)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (fprintf(v4, "name: %s\n", *(const char **)(a2 + 8)) < 0
    || fprintf(v4, "id: %llu\n", *(_QWORD *)(a2 + 16)) < 0
    || fprintf(v4, "uid: %u\n", *(_DWORD *)(a2 + 40)) < 0
    || fprintf(v4, "gid: %u\n", *(_DWORD *)(a2 + 44)) < 0
    || fprintf(v4, "access: %03x\n", *(_DWORD *)(a2 + 48)) < 0
    || fprintf(v4, "refcount: %u\n", *(_DWORD *)(a2 + 56)) < 0
    || fprintf(v4, "postcount: %u\n", *(_DWORD *)(a2 + 64)) < 0
    || fprintf(v4, "last hour postcount: %u\n", *(_DWORD *)(a2 + 68)) < 0)
  {
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }
  if (*(_DWORD *)(a2 + 52) == -1)
  {
    v8 = fprintf(v4, "slot: -unassigned-");
    goto LABEL_16;
  }
  result = fprintf(v4, "slot: %u", *(_DWORD *)(a2 + 52));
  if ((result & 0x80000000) != 0)
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  v7 = *(unsigned int *)(a2 + 52);
  if (__CFADD__(qword_1000142E8, 4 * v7))
    goto LABEL_56;
  if (*(_DWORD *)(qword_1000142E8 + 4 * v7) != -1)
  {
    if (__CFADD__(qword_1000142E0, 4 * v7))
      goto LABEL_56;
    v8 = fprintf(v4, " = %u (%u)");
LABEL_16:
    if ((v8 & 0x80000000) == 0)
      goto LABEL_17;
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }
LABEL_17:
  if (fprintf(v4, "\n") < 0)
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  if (fprintf(v4, "val: %u\n", *(_DWORD *)(a2 + 60)) < 0)
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  result = fprintf(v4, "state: %llu\n", *(_QWORD *)(a2 + 24));
  if ((result & 0x80000000) != 0)
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  v22 = 0u;
  v23 = 0u;
  v9 = *(_QWORD **)a2;
  if (*(_QWORD *)a2)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = *((_DWORD *)v9 + 17);
      if (v18 != -1 && v18 > *(_DWORD *)(v5 + 24))
        *(_DWORD *)(v5 + 24) = v18;
      switch(*((_BYTE *)v9 + 79) & 0xF)
      {
        case 1:
          DWORD1(v22) = ++v10;
          break;
        case 2:
          DWORD2(v22) = ++v11;
          break;
        case 3:
          HIDWORD(v22) = ++v12;
          break;
        case 4:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFEFLL)
            goto LABEL_56;
          LODWORD(v23) = ++v13;
          break;
        case 5:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFEBLL)
            goto LABEL_56;
          DWORD1(v23) = ++v14;
          break;
        case 6:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFE7)
            goto LABEL_56;
          DWORD2(v23) = ++v15;
          break;
        case 7:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFE3)
            goto LABEL_56;
          HIDWORD(v23) = ++v16;
          break;
        default:
          LODWORD(v22) = ++v17;
          break;
      }
      v9 = (_QWORD *)*v9;
    }
    while (v9);
  }
  else
  {
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v17 = 0;
  }
  v19 = (__int128 *)((char *)&v23 + 5) != 0 && (unint64_t)&v22 >= 0xFFFFFFFFFFFFFFEBLL;
  if ((unint64_t)&v22 <= 0xFFFFFFFFFFFFFFEFLL && !v19)
  {
    v20 = (__int128 *)((char *)&v23 + 13) != 0 && (unint64_t)&v22 >= 0xFFFFFFFFFFFFFFE3;
    if ((unint64_t)&v22 <= 0xFFFFFFFFFFFFFFE7 && !v20)
    {
      if ((fprintf(v4, "types: none %u   memory %u   plain %u   port %u   file %u   signal %u   event %u   common %u\n", v17, v10, v11, v12, v13, v14, v15, v16) & 0x80000000) == 0)
      {
        for (i = *(_QWORD **)a2; i; i = (_QWORD *)*i)
        {
          if (fprintf(v4, "\n") < 0)
            break;
          sub_100009098(v4, (uint64_t)i);
        }
      }
      return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
    }
  }
LABEL_56:
  __break(0x5513u);
  return result;
}

BOOL sub_100008ECC(uint64_t a1, uint64_t a2)
{
  return fprintf(*(FILE **)(a1 + 32), "%d\n", *(_DWORD *)(a2 + 68)) >= 0;
}

uint64_t sub_100008F04(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  int v5;
  int v6;

  if (!*(_WORD *)(a2 + 76))
    return 1;
  v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    v3 = *(int **)(qword_100014290 + 8 * v2);
    if (v3)
    {
      v4 = result;
      v5 = *v3;
      if (!*v3)
      {
        if (fprintf(*(FILE **)(result + 32), "Null service: %s\n", *(const char **)(*(_QWORD *)(a2 + 48) + 8)) < 0)
          return 0;
        v5 = *v3;
      }
      if (v5 == 1)
        v6 = fprintf(*(FILE **)(v4 + 32), "Path Service: %s <- %s\n");
      else
        v6 = fprintf(*(FILE **)(v4 + 32), "Unknown service: %s (%u)\n");
      return (v6 & 0x80000000) == 0;
    }
    return 1;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100008FD4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  const char ***v5;
  uint64_t v6;
  int v7;

  if (!*(_WORD *)(a2 + 76))
    return 1;
  v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    v4 = result;
    v5 = *(const char ****)(qword_100014290 + 8 * v2);
    v6 = *(_QWORD *)(a2 + 48);
    v7 = *(_DWORD *)v5;
    if (!*(_DWORD *)v5)
    {
      if (fprintf(*(FILE **)(result + 32), "PID %u Null service: %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8)) < 0)
        return 0;
      v7 = *(_DWORD *)v5;
    }
    return v7 != 2
        || (fprintf(*(FILE **)(v4 + 32), "PID %u Path Service: %s <- %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8), *v5[1]) & 0x80000000) == 0;
  }
  __break(0x5513u);
  return result;
}

size_t sub_100009098(FILE *a1, uint64_t a2)
{
  size_t result;
  uint64_t v5;
  const char *v6;

  result = fprintf(a1, "client_id: %llu\n", *(_QWORD *)(a2 + 64));
  if ((result & 0x80000000) == 0)
  {
    result = fprintf(a1, "pid: %d\n", *(_DWORD *)(a2 + 68));
    if ((result & 0x80000000) == 0)
    {
      result = fprintf(a1, "token: %d\n", *(_DWORD *)(a2 + 64));
      if ((result & 0x80000000) == 0)
      {
        result = fprintf(a1, "lastval: %u\n", *(_DWORD *)(a2 + 72));
        if ((result & 0x80000000) == 0)
        {
          result = fprintf(a1, "suspend_count: %u\n", *(unsigned __int8 *)(a2 + 78));
          if ((result & 0x80000000) == 0)
          {
            v5 = *(_BYTE *)(a2 + 79) & 0xF;
            if (v5 > 7)
              v6 = "unknown";
            else
              v6 = (&off_100010840)[v5];
            result = fprintf(a1, "type: %s\n", v6);
            if ((result & 0x80000000) == 0)
            {
              switch(*(_BYTE *)(a2 + 79) & 0xF)
              {
                case 3:
                  result = fprintf(a1, "mach port: 0x%08x\n");
                  break;
                case 4:
                  result = fprintf(a1, "fd: %d\n");
                  break;
                case 5:
                  result = fprintf(a1, "signal: %d\n");
                  break;
                case 6:
                  result = fprintf(a1, "xpc event: %llu\n");
                  break;
                case 7:
                  result = fwrite("common port\n", 0xCuLL, 1uLL, a1);
                  break;
                default:
                  return result;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_10000922C(uint64_t a1, uint64_t **a2)
{
  FILE *v4;
  int v5;
  uint64_t *i;
  const char *v7;
  size_t v8;

  if (a2)
  {
    v4 = *(FILE **)(a1 + 32);
    if ((fprintf(v4, "name:%s\n", (const char *)a2[1]) & 0x80000000) == 0
      && (fprintf(v4, "info:%llu,%u,%u,%03x,%u,%u,%u,", a2[2], *((_DWORD *)a2 + 10), *((_DWORD *)a2 + 11), *((_DWORD *)a2 + 12), *((_DWORD *)a2 + 14), *((_DWORD *)a2 + 16), *((_DWORD *)a2 + 17)) & 0x80000000) == 0)
    {
      v5 = *((_DWORD *)a2 + 13) == -1 ? fprintf(v4, "-1,") : fprintf(v4, "%u,");
      if ((v5 & 0x80000000) == 0
        && (fprintf(v4, "%u,%llu\n", *((_DWORD *)a2 + 15), a2[3]) & 0x80000000) == 0
        && (fprintf(v4, "clients:\n") & 0x80000000) == 0)
      {
        for (i = *a2; i; i = (uint64_t *)*i)
        {
          if ((fprintf(v4, "%llu,%d,%d,%u,%u,%u,", i[8], HIDWORD(i[8]), i[8], *((_DWORD *)i + 18), *((unsigned __int8 *)i + 78), 0) & 0x80000000) == 0)
          {
            switch(*((_BYTE *)i + 79) & 0xF)
            {
              case 1:
                v7 = "check,0\n";
                goto LABEL_15;
              case 3:
                fprintf(v4, "port,0x%08x\n");
                continue;
              case 4:
                fprintf(v4, "fd,%d\n");
                continue;
              case 5:
                fprintf(v4, "signal,%d\n");
                continue;
              case 6:
                fprintf(v4, "event,%llu\n");
                continue;
              case 7:
                v7 = "common-port\n";
                v8 = 12;
                goto LABEL_22;
              default:
                v7 = "other,0\n";
LABEL_15:
                v8 = 8;
LABEL_22:
                fwrite(v7, v8, 1uLL, v4);
                break;
            }
          }
        }
        fputc(10, v4);
      }
    }
  }
  return fprintf(*(FILE **)(a1 + 32), "\n") >= 0;
}

uint64_t sub_100009474(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  int v5;
  int v6;

  if (!*(_WORD *)(a2 + 76))
    return 1;
  v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    v3 = *(int **)(qword_100014290 + 8 * v2);
    if (v3)
    {
      v4 = result;
      v5 = *v3;
      if (!*v3)
      {
        if (fprintf(*(FILE **)(result + 32), "Null service: %s\n", *(const char **)(*(_QWORD *)(a2 + 48) + 8)) < 0)
          return 0;
        v5 = *v3;
      }
      if (v5 == 1)
        v6 = fprintf(*(FILE **)(v4 + 32), "Path Service: %s <- %s\n");
      else
        v6 = fprintf(*(FILE **)(v4 + 32), "Unknown service: %s (%u)\n");
      return (v6 & 0x80000000) == 0;
    }
    return 1;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100009544(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  const char ***v5;
  uint64_t v6;
  int v7;

  if (!*(_WORD *)(a2 + 76))
    return 1;
  v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    v4 = result;
    v5 = *(const char ****)(qword_100014290 + 8 * v2);
    v6 = *(_QWORD *)(a2 + 48);
    v7 = *(_DWORD *)v5;
    if (!*(_DWORD *)v5)
    {
      if (fprintf(*(FILE **)(result + 32), "PID %u Null service: %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8)) < 0)
        return 0;
      v7 = *(_DWORD *)v5;
    }
    return v7 != 2
        || (fprintf(*(FILE **)(v4 + 32), "PID %u Path Service: %s <- %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8), *v5[1]) & 0x80000000) == 0;
  }
  __break(0x5513u);
  return result;
}

void sub_100009608()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests port-deleted";
  __break(1u);
}

void sub_100009628()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests port-destroyed";
  __break(1u);
}

void sub_100009648()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests no-senders";
  __break(1u);
}

void sub_100009668()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: someone destroyed our send-possible notification";
  __break(1u);
}

size_t start(int a1, unint64_t a2)
{
  unint64_t v4;
  int v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  char *v15;
  BOOL v16;
  BOOL v17;
  _BOOL4 v18;
  _BOOL4 v19;
  BOOL v20;
  BOOL v21;
  _BOOL4 v22;
  _BOOL4 v23;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  const char *v30;
  const char *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  kern_return_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  kern_return_t v52;
  FILE *v53;
  pid_t v54;
  size_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  unsigned int v59;
  FILE *v60;
  FILE *v61;
  size_t result;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unsigned __int8 *v70;
  unsigned int v71;
  BOOL v72;
  uint64_t v73;
  int v75;
  int v76;
  unint64_t v77;
  char *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unsigned int v82;
  unint64_t v83;
  int v84;
  _BOOL4 v85;
  _BOOL4 v86;
  _QWORD *v87;
  int v88;
  const char *v89;
  unsigned int v90;
  const char *v91;
  unsigned int v92;
  uint64_t v93;
  int v94;
  const char *v95;
  uint64_t v96;
  _DWORD *v97;
  uint64_t v98;
  _QWORD *v99;
  kern_return_t v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  dispatch_time_t v105;
  NSObject *v106;
  int v107;
  const char *v108;
  FILE *v109;
  const char *v110;
  rlimit v111;
  _QWORD block[5];
  uint64_t v113;
  mach_port_options_t port_info[42];
  stat v115;

  notify_set_options(0x8000000);
  os_trace_set_mode(256);
  v111 = (rlimit)xmmword_10000E380;
  setrlimit(8, &v111);
  signal(13, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(30, (void (__cdecl *)(int))1);
  signal(31, (void (__cdecl *)(int))1);
  signal(28, (void (__cdecl *)(int))1);
  xmmword_100014078 = 0u;
  *(_OWORD *)&qword_100014088 = 0u;
  *(__int128 *)((char *)&xmmword_100014090 + 8) = 0u;
  *(__int128 *)((char *)&xmmword_1000140A0 + 8) = 0u;
  xmmword_1000140B8 = 0u;
  *(_OWORD *)&qword_1000140C8 = 0u;
  xmmword_1000140D8 = 0u;
  *(_OWORD *)&qword_1000140E8 = 0u;
  xmmword_1000140F8 = 0u;
  *(_OWORD *)&qword_100014108 = 0u;
  *(__int128 *)((char *)&xmmword_100014110 + 8) = 0u;
  *(_OWORD *)&qword_100014128 = 0u;
  xmmword_100014138 = 0u;
  *(_OWORD *)&qword_100014148 = 0u;
  xmmword_100014158 = 0u;
  *(_OWORD *)&qword_100014168 = 0u;
  xmmword_100014178 = 0u;
  v4 = (unint64_t)&unk_100014190;
  v107 = getpagesize() >> 2;
  dword_1000142D8 = v107;
  dword_100014258 = 2;
  qword_100014260 = 0xFFFFFFFF00000000;
  os_set_str_ptr_init(&unk_100014190, 0, 1);
  qword_1000141A8 = 8;
  os_set_64_ptr_init(&unk_1000141B0, 0, 1);
  qword_1000141C8 = 16;
  os_set_64_ptr_init(&unk_1000141D0, 0, 1);
  qword_1000141E8 = 64;
  os_set_32_ptr_init(&unk_1000141F0, 0, 1);
  qword_100014208 = 8;
  os_set_32_ptr_init(&unk_100014210, 0, 1);
  qword_100014228 = 16;
  os_map_64_init(&unk_100014230, 0, 1);
  dword_100014300 = 1;
  v5 = 3;
  dword_1000142F8 = 3;
  v6 = strdup("/var/log/notifyd.log");
  qword_100014308 = (uint64_t)v6;
  dword_1000142DC = -1;
  if (a1 >= 2)
  {
    v13 = v6;
    v14 = 1;
    v108 = "apple.shm.notification_center";
    v110 = "com.apple.system.notification_center";
    v15 = "-d";
    while (1)
    {
      v16 = __CFADD__(a2, 8 * v14);
      v17 = a2 + 8 * v14 >= a2;
      if (v14 < 0)
        v17 = v16;
      if (!v17)
      {
LABEL_175:
        __break(0x5513u);
LABEL_176:
        __break(0x5500u);
LABEL_177:
        sub_10000554C((FILE *)3, "config file %s not owned by root: ignored\n", v7, v8, v9, v10, v11, v12, a2);
LABEL_179:
        *(_OWORD *)&port_info[0].flags = xmmword_10000E408;
        port_info[0].reserved[1] = 0;
        v100 = mach_port_construct(*(_DWORD *)v15, port_info, (mach_port_context_t)&qword_100014188, (mach_port_name_t *)&dword_100014288);
        if (v100)
        {
          qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate Mach notification port";
          qword_100014040 = v100;
LABEL_188:
          __break(1u);
        }
        else
        {
          qword_100014280 = dispatch_mach_create_f("com.apple.notifyd.mach-notifs", qword_100014298, 0, sub_100003088);
          dispatch_set_qos_class_fallback();
          qword_1000142A0 = dispatch_mach_create_f("com.apple.notifyd.channel", qword_100014298, 0, sub_1000050A8);
          dispatch_set_qos_class_fallback();
          v101 = xpc_event_publisher_create("com.apple.notifyd.matching", qword_100014298);
          qword_100014250 = v101;
          xpc_event_publisher_set_handler();
          xpc_event_publisher_set_error_handler(v101, &stru_1000105D0);
          xpc_event_publisher_set_throttling(v101, 64);
          xpc_event_publisher_activate(v101);
          v102 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)qword_100014298);
          qword_1000142A8 = (uint64_t)v102;
          if (v102)
          {
            dispatch_set_context(v102, 0);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v4 + 0x10), (dispatch_function_t)sub_10000A894);
            dispatch_activate(*(dispatch_object_t *)(v4 + 0x10));
            v103 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, *(dispatch_queue_t *)v4);
            *(_QWORD *)(v4 + 0x18) = v103;
            if (v103)
            {
              dispatch_set_context(v103, (void *)1);
              dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v4 + 0x18), (dispatch_function_t)sub_10000A894);
              dispatch_activate(*(dispatch_object_t *)(v4 + 0x18));
              v104 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1CuLL, 0, *(dispatch_queue_t *)v4);
              *(_QWORD *)(v4 + 0x20) = v104;
              if (v104)
              {
                dispatch_source_set_event_handler(v104, &stru_100010610);
                dispatch_activate(*(dispatch_object_t *)(v4 + 0x20));
                *(_QWORD *)(v4 + 0x28) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)v4);
                v105 = dispatch_walltime(0, 0);
                dispatch_source_set_timer(*(dispatch_source_t *)(v4 + 0x28), v105, 0x34630B8A000uLL, 0);
                dispatch_source_set_event_handler(*(dispatch_source_t *)(v4 + 0x28), &stru_100010650);
                dispatch_activate(*(dispatch_object_t *)(v4 + 0x28));
                if (os_variant_has_internal_diagnostics("com.apple.notifyd"))
                {
                  v106 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 0x10uLL, *(dispatch_queue_t *)v4);
                  *(_QWORD *)(v4 + 0x30) = v106;
                  if (!v106)
                    __assert_rtn("main", "notifyd.c", 1479, "global.memory_pressure_src != NULL");
                  dispatch_source_set_event_handler(v106, &stru_100010690);
                  dispatch_activate((dispatch_object_t)qword_1000142C8);
                }
                dispatch_async((dispatch_queue_t)qword_100014298, &stru_1000106D0);
                dispatch_main();
              }
              __assert_rtn("main", "notifyd.c", 1458, "global.sig_winch_src != NULL");
            }
            __assert_rtn("main", "notifyd.c", 1450, "global.sig_usr2_src != NULL");
          }
        }
        __assert_rtn("main", "notifyd.c", 1442, "global.sig_usr1_src != NULL");
      }
      v4 = *(_QWORD *)(a2 + 8 * v14);
      if (!strcmp((const char *)v4, "-d"))
      {
        dword_1000142F8 = 7;
      }
      else
      {
        if (!strcmp((const char *)v4, "-log_cutoff"))
        {
          v4 = v14 + 1;
          v20 = __CFADD__(a2, 8 * v4);
          v21 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1)
            v21 = v20;
          if (!v21)
            goto LABEL_175;
          dword_1000142F8 = atoi(*(const char **)(a2 + 8 * v4));
          goto LABEL_37;
        }
        if (!strcmp((const char *)v4, "-log_file"))
        {
          free(v13);
          v4 = v14 + 1;
          v22 = __CFADD__(a2, 8 * v4);
          v23 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1)
            v23 = v22;
          if (!v23)
            goto LABEL_175;
          v13 = strdup(*(const char **)(a2 + 8 * v4));
          qword_100014308 = (uint64_t)v13;
          goto LABEL_37;
        }
        if (!strcmp((const char *)v4, "-service"))
        {
          v24 = v14 + 1;
          v25 = __CFADD__(a2, 8 * v24);
          v26 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1)
            v26 = v25;
          if (!v26)
            goto LABEL_175;
          v110 = *(const char **)(a2 + 8 * v24);
          goto LABEL_52;
        }
        if (!strcmp((const char *)v4, "-shm"))
        {
          v24 = v14 + 1;
          v27 = __CFADD__(a2, 8 * v24);
          v28 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1)
            v28 = v27;
          if (!v28)
            goto LABEL_175;
          v108 = *(const char **)(a2 + 8 * v24);
LABEL_52:
          v14 = v24;
          goto LABEL_53;
        }
        if (!strcmp((const char *)v4, "-shm_pages"))
        {
          v4 = v14 + 1;
          v18 = __CFADD__(a2, 8 * v4);
          v19 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1)
            v19 = v18;
          if (!v19)
            goto LABEL_175;
          dword_1000142D8 = atoi(*(const char **)(a2 + 8 * v4)) * v107;
LABEL_37:
          v14 = v4;
        }
      }
LABEL_53:
      if (__OFADD__(v14++, 1))
        goto LABEL_176;
      if (v14 >= a1)
      {
        v5 = dword_1000142F8;
        v31 = v108;
        v30 = v110;
        goto LABEL_57;
      }
    }
  }
  v30 = "com.apple.system.notification_center";
  v31 = "apple.shm.notification_center";
LABEL_57:
  dword_1000142FC = v5;
  v32 = getpid();
  sub_10000554C((FILE *)7, "--------------------\nnotifyd start PID %u\n", v33, v34, v35, v36, v37, v38, v32);
  v39 = bootstrap_check_in(bootstrap_port, v30, (mach_port_t *)&dword_10001428C);
  if (v39)
  {
    v52 = v39;
    v53 = __stderrp;
    v54 = getpid();
    fprintf(v53, "%d bootstrap_check_in failed (%d)\n", v54, v52);
    exit(1);
  }
  port_info[0].flags = 32;
  v15 = (char *)&mach_task_self_;
  mach_port_set_attributes(mach_task_self_, dword_10001428C, 1, (mach_port_info_t)port_info, 4u);
  v40 = dword_1000142D8;
  if (dword_1000142D8)
  {
    v41 = shm_open(v31, 2, 420);
    v42 = v41;
    v43 = v41;
    if ((_DWORD)v41 == -1)
    {
      v43 = shm_open(v31, 514, 420);
      if ((_DWORD)v43 == -1)
      {
        v44 = __error();
        v45 = strerror(*v44);
        snprintf((char *)port_info, 0x400uLL, "shm_open %s failed: %s\n", v31, v45);
        qword_100014010 = (uint64_t)port_info;
        sub_10000554C((FILE *)5, "%s", v46, v47, v48, v49, v50, v51, (char)port_info);
        goto LABEL_67;
      }
    }
    v55 = (4 * v40);
    ftruncate(v43, v55);
    qword_1000142E0 = (uint64_t)mmap(0, v55, 3, 1, v43, 0);
    close_NOCANCEL(v43);
    if (v42 != -1)
    {
      v56 = malloc_type_malloc(v55, 0x598B75AuLL);
      qword_1000142F0 = (uint64_t)v56;
      if (v56)
        memcpy(v56, (const void *)qword_1000142E0, v55);
    }
    bzero((void *)qword_1000142E0, v55);
    v57 = malloc_type_malloc(v55, 0xF354AE1CuLL);
    qword_1000142E8 = (uint64_t)v57;
    if (!v57)
LABEL_67:
      __assert_rtn("main", "notifyd.c", 1380, "status == 0");
    bzero(v57, v55);
    *(_DWORD *)qword_1000142E0 = getpid();
    *(_DWORD *)qword_1000142E8 = 1;
    dword_1000142DC = 0;
  }
  v4 = (unint64_t)&qword_100014298;
  qword_100014298 = (uint64_t)dispatch_workloop_create_inactive("com.apple.notifyd.main");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_100014298);
  memset(&v115, 0, sizeof(v115));
  v113 = 0;
  v58 = ((uint64_t)getpid() << 32) | 3;
  v59 = dword_100014300++;
  sub_100004E00("com.apple.system.notify.ipc_version", 0xFFFFFFFFLL, v59, -1, 0, 0, &v113);
  sub_1000043BC(v113, v58, 0, 0);
  a2 = (unint64_t)"/etc/notify.conf";
  if (stat("/etc/notify.conf", &v115))
    goto LABEL_179;
  if (v115.st_uid)
    goto LABEL_177;
  if ((v115.st_mode & 2) != 0)
  {
    sub_10000554C((FILE *)3, "config file %s is world-writable: ignored\n", v7, v8, v9, v10, v11, v12, (char)"/etc/notify.conf");
    goto LABEL_179;
  }
  v60 = fopen("/etc/notify.conf", "r");
  if (!v60)
    goto LABEL_179;
  v61 = v60;
  v109 = v60;
  while (1)
  {
    do
    {
      if (!fgets((char *)port_info, 1024, v61))
      {
LABEL_193:
        fclose(v61);
        v4 = (unint64_t)&qword_100014298;
        v15 = (char *)&mach_task_self_;
        goto LABEL_179;
      }
    }
    while (!LOBYTE(port_info[0].flags) || LOBYTE(port_info[0].flags) == 35);
    result = strlen((const char *)port_info);
    v63 = result - 1;
    if (result - 1 > 0x3FF)
      break;
    if (v63 > ~(unint64_t)port_info)
      goto LABEL_175;
    v64 = 0;
    v4 = 0;
    v65 = 0;
    v66 = (unint64_t)port_info;
    *((_BYTE *)&port_info[0].flags + v63) = 0;
    while (1)
    {
      if (v4 > 0x3FF)
        goto LABEL_188;
      if (!*(_BYTE *)v66)
        break;
      v67 = 0;
      a2 = ~v66;
      v68 = v65;
      v69 = v4;
      v70 = (unsigned __int8 *)v66;
      while (1)
      {
        if (v68 > 0x3FF || v69 > 0x3FF)
          goto LABEL_188;
        v71 = *v70;
        v72 = v71 > 0x20;
        v73 = (1 << v71) & 0x100000201;
        if (!v72 && v73 != 0)
          break;
        v75 = v67 + 1;
        if (__OFADD__((_DWORD)v67, 1))
          goto LABEL_176;
        v67 = v75;
        v68 = v65 + v75;
        v69 = v4 + v75;
        v70 = (unsigned __int8 *)(v66 + v75);
        if (a2 < v75)
          goto LABEL_175;
      }
      v76 = v67 + 1;
      if (__OFADD__((_DWORD)v67, 1))
        goto LABEL_176;
      v77 = v76;
      v78 = (char *)malloc_type_malloc(v76, 0x4ED5A34BuLL);
      v15 = v78;
      v79 = ~(unint64_t)v78;
      if ((int)v67 < 1)
      {
        v82 = 0;
      }
      else
      {
        v80 = 0;
        v81 = 1024 - v65;
        if (v65 > 0x400)
          v81 = 0;
        do
        {
          if (v80 > a2)
            goto LABEL_175;
          if (v81 == v80 || 1024 - v4 == v80)
            goto LABEL_188;
          if (v80 > v79)
            goto LABEL_175;
          if (v77 == v80)
            goto LABEL_188;
          v78[v80] = *(_BYTE *)(v66 + v80);
          ++v80;
        }
        while (v67 != v80);
        v82 = v67;
      }
      if (v67 > v79)
        goto LABEL_175;
      if ((v67 & 0x8000000000000000) != 0 || v67 >= v77)
        goto LABEL_188;
      v78[v67] = 0;
      v64 = (unint64_t)sub_10000A578(v78, v64);
      free(v15);
      if (a2 < v82)
        goto LABEL_175;
      a2 = v65 + v82;
      if (a2 > 0x3FF)
        goto LABEL_188;
      v83 = v4 + v82;
      if (v83 > 0x3FF)
        goto LABEL_188;
      v15 = (char *)(v66 + v82);
      if (!*v15)
        break;
      v84 = v82 + 1;
      if (__OFADD__(v82, 1))
        goto LABEL_176;
      v85 = __CFADD__(v66, v84);
      v86 = v66 + v84 >= v66;
      if (v84 < 0)
        v86 = v85;
      if (!v86)
        goto LABEL_175;
      if (v65 + v84 > 0x3FF || v4 + v84 > 0x3FF)
        goto LABEL_188;
      if (!*(_BYTE *)(v66 + v84))
        v64 = (unint64_t)sub_10000A578("", v64);
      if (v15 == (char *)-1)
        goto LABEL_175;
      v65 = a2 + 1;
      v4 = v83 + 1;
      v66 = (unint64_t)(v15 + 1);
      if (a2 > 0x3FE)
        goto LABEL_188;
    }
    v61 = v109;
    if (v64)
    {
      LODWORD(a2) = 0;
      v87 = (_QWORD *)v64;
      while (*v87)
      {
        v88 = a2 + 1;
        if (__OFADD__((_DWORD)a2, 1))
          goto LABEL_176;
        v87 = (_QWORD *)(v64 + 8 * v88);
        LODWORD(a2) = a2 + 1;
        if (8 * v88 > ~v64)
          goto LABEL_175;
      }
      if (!(_DWORD)a2)
        goto LABEL_174;
      v15 = *(char **)v64;
      if (!strcasecmp(*(const char **)v64, "monitor"))
      {
        if (a2 <= 2)
          goto LABEL_174;
        if (v64 > 0xFFFFFFFFFFFFFFF7)
          goto LABEL_175;
        v89 = *(const char **)(v64 + 8);
        a2 = (unint64_t)&qword_100014298;
        v90 = dword_100014300++;
        sub_100004E00(v89, 0xFFFFFFFFLL, v90, -1, 0, 0, &v113);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_10000A704;
        block[3] = &unk_1000107D8;
        block[4] = v64;
        dispatch_async((dispatch_queue_t)qword_100014298, block);
      }
      else
      {
        if (!strcasecmp(v15, "set"))
        {
          if ((_DWORD)a2 != 1 && a2 < 4)
          {
            if (v64 > 0xFFFFFFFFFFFFFFF7)
              goto LABEL_175;
            v91 = *(const char **)(v64 + 8);
            v92 = dword_100014300++;
            sub_100004E00(v91, 0xFFFFFFFFLL, v92, -1, 0, 0, &v113);
            if ((_DWORD)a2 == 3)
            {
              if (v64 > 0xFFFFFFFFFFFFFFEFLL)
                goto LABEL_175;
              v93 = atoll(*(const char **)(v64 + 16));
              sub_1000043BC(v113, v93, 0, 0);
            }
          }
          goto LABEL_174;
        }
        if (!strcasecmp(v15, "reserve"))
        {
          if ((_DWORD)a2 == 1)
            goto LABEL_174;
          if (a2 < 3)
          {
            v15 = 0;
            v94 = 0;
          }
          else
          {
            if (v64 > 0xFFFFFFFFFFFFFFEFLL)
              goto LABEL_175;
            v94 = atoi(*(const char **)(v64 + 16));
            if (a2 < 4)
            {
              v15 = 0;
            }
            else
            {
              if (v64 > 0xFFFFFFFFFFFFFFE7)
                goto LABEL_175;
              v15 = (char *)atoi(*(const char **)(v64 + 24));
              if (a2 >= 5)
              {
                if (v64 > 0xFFFFFFFFFFFFFFDFLL)
                  goto LABEL_175;
                LODWORD(a2) = sub_10000A7F8(*(const char **)(v64 + 32));
                goto LABEL_158;
              }
            }
          }
          LODWORD(a2) = 819;
LABEL_158:
          if (!(v94 | v15))
            goto LABEL_166;
          if (v64 > 0xFFFFFFFFFFFFFFF7)
            goto LABEL_175;
          v95 = *(const char **)(v64 + 8);
          if (!v95)
            goto LABEL_166;
          v96 = os_set_str_ptr_find(&unk_100014190, *(_QWORD *)(v64 + 8));
          if (v96)
          {
            v97 = (_DWORD *)(v96 - qword_1000141A8);
            if (v97)
              goto LABEL_165;
          }
          v97 = sub_100005F58(v95);
          if (v97)
          {
            ++v97[14];
LABEL_165:
            v97[10] = v94;
            v97[11] = (_DWORD)v15;
            sub_10000AD5C((uint64_t)v97);
          }
LABEL_166:
          if ((_DWORD)a2 != 819)
          {
            if (v64 > 0xFFFFFFFFFFFFFFF7)
              goto LABEL_175;
            v15 = *(char **)(v64 + 8);
            if (v15)
            {
              v98 = os_set_str_ptr_find(&unk_100014190, *(_QWORD *)(v64 + 8));
              if (!v98 || (v99 = (_QWORD *)(v98 - qword_1000141A8)) == 0)
              {
                v99 = sub_100005F58(v15);
                if (!v99)
                  goto LABEL_174;
                ++*((_DWORD *)v99 + 14);
              }
              *((_DWORD *)v99 + 12) = a2;
              sub_10000AD5C((uint64_t)v99);
            }
          }
LABEL_174:
          sub_10000A688(v64);
        }
        else
        {
          v15 = (char *)strcasecmp(v15, "quit");
          sub_10000A688(v64);
          if (!(_DWORD)v15)
            goto LABEL_193;
        }
      }
    }
  }
  __break(0x5512u);
  return result;
}

char *sub_10000A578(const char *a1, unint64_t ptr)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  size_t v8;
  char *result;
  _QWORD *v10;

  v5 = ptr;
  if (!a1)
    return (char *)v5;
  if (ptr)
  {
    v4 = 0;
    v3 = 0;
    LODWORD(v7) = 0;
    do
    {
      v2 = (v7 + 1);
      if (!*(_QWORD *)(ptr + 8 * v3))
        goto LABEL_7;
      v4 = 8 * (v7 + 1);
      v3 = (v7 + 1);
      LODWORD(v7) = v7 + 1;
    }
    while (v4 <= ~ptr);
    goto LABEL_6;
  }
  v5 = (unint64_t)malloc_type_malloc(0x10uLL, 0x10040436913F5uLL);
  *(_QWORD *)v5 = strdup(a1);
  if (v5 < 0xFFFFFFFFFFFFFFF8)
  {
    v10 = (_QWORD *)(v5 + 8);
LABEL_14:
    *v10 = 0;
    return (char *)v5;
  }
  while (1)
  {
    do
    {
LABEL_6:
      __break(0x5513u);
LABEL_7:
      v8 = 8 * (v7 + 2);
      v5 = (unint64_t)malloc_type_realloc((void *)v5, v8, 0x10040436913F5uLL);
      result = strdup(a1);
    }
    while (v4 > ~v5);
    if (v8 <= 8 * v3)
      break;
    *(_QWORD *)(v5 + 8 * v3) = result;
    v7 = 8 * v2;
    if (v7 <= ~v5)
    {
      if (v8 >= v7)
      {
        v10 = (_QWORD *)(v5 + 8 * v2);
        goto LABEL_14;
      }
      break;
    }
  }
  __break(1u);
  return result;
}

void sub_10000A688(unint64_t a1)
{
  int v2;
  unint64_t v3;
  void **v4;
  int v5;

  if (a1)
  {
    v2 = 0;
    v3 = ~a1;
    v4 = (void **)a1;
    while (1)
    {
      if (!*v4)
        goto LABEL_7;
      free(*v4);
      *v4 = 0;
      v5 = v2 + 1;
      if (__OFADD__(v2, 1))
        break;
      v4 = (void **)(a1 + 8 * v5);
      ++v2;
      if (8 * v5 > v3)
      {
        __break(0x5513u);
LABEL_7:
        free((void *)a1);
        return;
      }
    }
    __break(0x5500u);
  }
}

void sub_10000A704(uint64_t a1)
{
  unint64_t v1;
  const char *v4;
  char *v5;
  uint64_t v6;
  BOOL v7;
  size_t v8;
  size_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  size_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1 > 0xFFFFFFFFFFFFFFF7 || v1 >= 0xFFFFFFFFFFFFFFF0)
  {
    __break(0x5513u);
  }
  else
  {
    v4 = *(const char **)(v1 + 8);
    v5 = *(char **)(v1 + 16);
    ++qword_100014168;
    if (v5)
    {
      v6 = os_set_str_ptr_find(&unk_100014190, v4);
      if (v6)
        v7 = qword_1000141A8 == v6;
      else
        v7 = 1;
      if (!v7)
      {
        v11 = 0u;
        v12 = 0u;
        v8 = sub_10000B358(v5, &v11, 1, 1023);
        if (v8)
        {
          v9 = v8;
          *(_QWORD *)(v8 + 80) = strdup(v4);
          v10 = *(NSObject **)(v9 + 72);
          *(_QWORD *)&v11 = _NSConcreteStackBlock;
          *((_QWORD *)&v11 + 1) = 0x40000000;
          *(_QWORD *)&v12 = sub_10000C410;
          *((_QWORD *)&v12 + 1) = &unk_100010940;
          v13 = v9;
          v14 = 0;
          dispatch_source_set_event_handler(v10, &v11);
          dispatch_activate(*(dispatch_object_t *)(v9 + 72));
        }
      }
    }
    sub_10000A688(*(_QWORD *)(a1 + 32));
  }
}

const char *sub_10000A7F8(const char *result)
{
  const char *v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;

  if (result)
  {
    v1 = result;
    result = (const char *)strlen(result);
    if (result == (const char *)6)
    {
      if ((unint64_t)v1 > 0xFFFFFFFFFFFFFFFALL)
      {
        __break(0x5513u);
      }
      else
      {
        if (v1[1] == 119)
          v2 = (*v1 == 114) | 2;
        else
          v2 = *(unsigned __int8 *)v1 == 114;
        if (v1[2] == 114)
          v3 = v2 | 0x10;
        else
          v3 = v2;
        if (v1[3] == 119)
          v4 = v3 | 0x20;
        else
          v4 = v3;
        if (v1[4] == 114)
          v5 = v4 | 0x100;
        else
          v5 = v4;
        if (v1[5] == 119)
          return (const char *)(v5 | 0x200);
        else
          return (const char *)v5;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

FILE *sub_10000A894(int a1)
{
  return sub_1000073DC(a1, -1);
}

void sub_10000A89C(id a1)
{
  _QWORD v1[6];

  v1[0] = _NSConcreteStackBlock;
  v1[1] = 0x40000000;
  v1[2] = sub_10000642C;
  v1[3] = &unk_100010528;
  v1[4] = &stru_100010820;
  v1[5] = &unk_100014190;
  os_set_str_ptr_foreach(&unk_100014190, v1);
  qword_1000142D0 = time(0);
}

BOOL sub_10000A914(id a1, void *a2)
{
  int v2;

  v2 = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = 0;
  *((_DWORD *)a2 + 17) = v2;
  return 1;
}

void sub_10000A924(id a1)
{
  FILE *v1;
  FILE *v2;

  unlink("/var/run/notifyd_jetsam.log");
  v1 = fopen("/var/run/notifyd_jetsam.log", "w");
  if (v1)
  {
    v2 = v1;
    if ((fprintf(v1, "-- JETSAM LOG BEGIN ---\n") & 0x80000000) == 0)
    {
      sub_100008114(v2);
      if ((fprintf(v2, "-- JETSAM LOG END ---\n") & 0x80000000) == 0)
        fclose(v2);
    }
  }
}

void sub_10000A9A0(id a1)
{
  _QWORD v1[6];

  v1[0] = _NSConcreteStackBlock;
  v1[1] = 0x40000000;
  v1[2] = sub_10000642C;
  v1[3] = &unk_100010528;
  v1[4] = &stru_100010820;
  v1[5] = &unk_100014190;
  os_set_str_ptr_foreach(&unk_100014190, v1);
  qword_1000142D0 = time(0);
}

void sub_10000AA18(id a1)
{
  int v1;

  if (dword_1000142F8 == 7)
    v1 = dword_1000142FC;
  else
    v1 = 7;
  dword_1000142F8 = v1;
}

void sub_10000AA38(id a1, int a2)
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Event publisher error";
  qword_100014040 = a2;
  __break(1u);
}

void sub_10000AA60(id a1, unsigned int a2, unint64_t a3, void *a4)
{
  const char *string;
  unsigned int v7;
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
  uint64_t v19;
  int v20;
  unsigned int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a2 == 2)
  {
    dispatch_mach_connect(qword_100014280, dword_100014288, 0, 0);
    dispatch_mach_connect(qword_1000142A0, dword_10001428C, 0, 0);
    return;
  }
  if (a2 != 1)
  {
    if (a2)
      return;
    if (xpc_get_type(a4) != (xpc_type_t)&_xpc_type_dictionary)
      __assert_rtn("notifyd_matching_register", "notify_proc.c", 1609, "xpc_get_type(descriptor) == XPC_TYPE_DICTIONARY");
    string = xpc_dictionary_get_string(a4, "Notification");
    v7 = dword_100014300++;
    *(_QWORD *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
    ++qword_1000140D0;
    sub_10000554C((FILE *)7, "notifyd_matching_register %s %d %llu\n", v8, v9, v10, v11, v12, v13, (char)string);
    v25 = 0;
    if (!string)
    {
      LOBYTE(v20) = 1;
      goto LABEL_14;
    }
    if (!qword_100014250)
      __assert_rtn("_notify_lib_register_xpc_event", "libnotify.c", 1109, "ns->event_publisher != NULL");
    v20 = sub_10000572C(string, 0xFFFFFFFFLL, v7, 0, -101, &v25);
    if (v20)
    {
      if (v20 == 7)
        return;
LABEL_14:
      sub_10000554C((FILE *)4, "_notify_lib_register_xpc_event failed with status %u\n", v14, v15, v16, v17, v18, v19, v20);
      return;
    }
    v22 = v25;
    *(_BYTE *)(v25 + 79) = *(_BYTE *)(v25 + 79) & 0xF0 | 6;
    *(_QWORD *)(v22 + 56) = a3;
    v23 = os_set_64_ptr_find(&unk_1000141D0, *(_QWORD *)&v7 | 0xFFFFFFFF00000000);
    if (!v23 || (v24 = v23 - qword_1000141E8, v23 == qword_1000141E8))
    {
      qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Can't find client after registering an event";
      __break(1u);
    }
    else if (!os_map_64_find(&unk_100014230, a3))
    {
      os_map_64_insert(&unk_100014230, a3, v24);
      ++dword_100014278;
      return;
    }
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Event token is already registered";
    qword_100014040 = a3;
    __break(1u);
    return;
  }
  v21 = (unsigned int *)os_map_64_delete(&unk_100014230, a3, a3, a4);
  if (v21)
  {
    ++dword_10001427C;
    sub_100003F34(v21);
  }
}

void sub_10000ACE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;
  char *v10;

  v10 = 0;
  if (getpid() != 1)
  {
    v9 = vasprintf(&v10, "BUG IN CLIENT OF NOTIFYD: %s has not dequeued the last %d messages", &a9);
    if (v10)
    {
      if (__OFADD__(v9, 1))
      {
        __break(0x5500u);
      }
      else
      {
        os_fault_with_payload(18, 2, v10, (v9 + 1), v10, 0);
        free(v10);
      }
    }
  }
}

uint64_t sub_10000AD5C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  size_t v11;
  unsigned int v12;
  uint64_t v13;

  result = qword_100014248;
  if (qword_100014248)
  {
    if (dword_10001425C)
    {
      v3 = 0;
      while (v3 <= ~qword_100014248)
      {
        if (*(_QWORD *)(qword_100014248 + v3) == a1)
          return result;
        v3 += 8;
        if (8 * dword_10001425C == v3)
        {
          v4 = 8 * (dword_10001425C + 1);
          goto LABEL_10;
        }
      }
      goto LABEL_27;
    }
  }
  else
  {
    dword_10001425C = 0;
  }
  v4 = 8;
LABEL_10:
  result = (uint64_t)reallocf((void *)qword_100014248, v4);
  v5 = result;
  qword_100014248 = result;
  v6 = dword_10001425C;
  if (dword_10001425C)
  {
    v7 = 0;
    v8 = 0;
    v9 = ~result;
    v10 = *(const char **)(a1 + 8);
    v11 = v4 >> 3;
    while (v7 <= v9)
    {
      if (v11 == v8)
        goto LABEL_28;
      result = strcmp(v10, *(const char **)(*(_QWORD *)(v5 + 8 * v8) + 8));
      if ((int)result > 0)
      {
        if (v6 <= v8)
          goto LABEL_24;
        v12 = v6;
        while (1)
        {
          v13 = v12 - 1;
          if (~qword_100014248 < 8 * (unint64_t)v13
            || ~qword_100014248 < 8 * (unint64_t)v12)
          {
            goto LABEL_27;
          }
          *(_QWORD *)(qword_100014248 + 8 * v12--) = *(_QWORD *)(qword_100014248 + 8 * v13);
          if (v13 <= v8)
          {
            v5 = qword_100014248;
            goto LABEL_24;
          }
        }
      }
      ++v8;
      v7 += 8;
      if (v6 == v8)
      {
        LODWORD(v8) = v6;
        goto LABEL_24;
      }
    }
  }
  else
  {
    LODWORD(v8) = 0;
LABEL_24:
    if (!__CFADD__(v5, 8 * v8))
    {
      *(_QWORD *)(v5 + 8 * v8) = a1;
      dword_10001425C = v6 + 1;
      return result;
    }
  }
LABEL_27:
  __break(0x5513u);
LABEL_28:
  __break(1u);
  return result;
}

void sub_10000AED0(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!a1)
    return;
  v2 = *(_DWORD *)(a1 + 104);
  if (v2)
  {
    v3 = v2 - 1;
    *(_DWORD *)(a1 + 104) = v3;
    if (v3)
      return;
  }
  sub_10000AF9C(a1);
  sub_10000B018();
  free(*(void **)a1);
  v4 = *(void **)(a1 + 56);
  if (!v4)
  {
LABEL_13:
    free(*(void **)(a1 + 80));
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    free((void *)a1);
    return;
  }
  v5 = *(unsigned int *)(a1 + 48);
  *(_DWORD *)(a1 + 48) = 0;
  if (!(_DWORD)v5)
  {
LABEL_12:
    free(v4);
    goto LABEL_13;
  }
  v6 = 0;
  v7 = 8 * v5;
  while (1)
  {
    v8 = *(_QWORD *)(a1 + 56);
    if (__CFADD__(v8, v6))
      break;
    free(*(void **)(v8 + v6));
    v9 = *(_QWORD *)(a1 + 56);
    if (__CFADD__(v9, v6))
      break;
    *(_QWORD *)(v9 + v6) = 0;
    v6 += 8;
    if (v7 == v6)
    {
      v4 = *(void **)(a1 + 56);
      goto LABEL_12;
    }
  }
  __break(0x5513u);
}

uint64_t sub_10000AF9C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = dword_100014058;
  if (dword_100014058)
  {
    v2 = 0;
    v3 = qword_100014060;
    while (!__CFADD__(v3, 8 * v2))
    {
      v4 = *(_QWORD *)(v3 + 8 * v2);
      if (v4)
      {
        v5 = *(unsigned int *)(v4 + 56);
        if ((_DWORD)v5)
        {
          v6 = 0;
          v7 = *(_QWORD *)(v4 + 64);
          while (~v7 >= (unint64_t)(8 * v6))
          {
            if (*(_QWORD *)(v7 + 8 * v6) == result)
            {
              *(_QWORD *)(v7 + 8 * v6) = 0;
              v3 = qword_100014060;
              goto LABEL_12;
            }
            if (++v6 == v5)
              goto LABEL_12;
          }
          break;
        }
      }
LABEL_12:
      if (++v2 == v1)
        return result;
    }
    __break(0x5513u);
  }
  return result;
}

void sub_10000B018()
{
  unsigned int v0;
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  size_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD block[5];

  v0 = dword_100014058;
  if (dword_100014058)
  {
    v1 = 0;
    v2 = qword_100014060;
    do
    {
      if (__CFADD__(v2, 8 * v1))
        goto LABEL_54;
      v3 = v1;
      v4 = *(_QWORD *)(v2 + 8 * v1);
      if (v4)
      {
        v5 = *(unsigned int *)(v4 + 56);
        if ((_DWORD)v5)
        {
          v6 = 0;
          LODWORD(v7) = 0;
          v8 = *(_QWORD *)(v4 + 64);
          do
          {
            if (v6 > ~v8)
              goto LABEL_54;
            if (*(_QWORD *)(v8 + v6))
              v7 = (v7 + 1);
            else
              v7 = v7;
            v6 += 8;
          }
          while (8 * v5 != v6);
          if ((_DWORD)v7 != (_DWORD)v5)
          {
            if ((_DWORD)v7)
            {
              v9 = (unint64_t)malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
              if (!v9)
                __assert_rtn("_vnode_sweep", "pathwatch.c", 515, "new_path_node != NULL");
              v10 = v9;
              v11 = *(unsigned int *)(v4 + 56);
              if ((_DWORD)v11)
              {
                v12 = 0;
                v13 = 0;
                v14 = 8 * v11;
                while (1)
                {
                  v15 = *(_QWORD *)(v4 + 64);
                  if (__CFADD__(v15, v12))
                    goto LABEL_54;
                  v16 = *(_QWORD *)(v15 + v12);
                  if (v16)
                  {
                    if (~v9 < 8 * (unint64_t)v13)
                      goto LABEL_54;
                    if (v7 <= v13)
                    {
LABEL_56:
                      __break(1u);
                      return;
                    }
                    v17 = v13++;
                    *(_QWORD *)(v9 + 8 * v17) = v16;
                  }
                  v12 += 8;
                  if (v14 == v12)
                    goto LABEL_26;
                }
              }
              v13 = 0;
            }
            else
            {
              v13 = 0;
              v10 = 0;
            }
LABEL_26:
            free(*(void **)(v4 + 64));
            *(_QWORD *)(v4 + 64) = v10;
            *(_DWORD *)(v4 + 56) = v13;
            v0 = dword_100014058;
            v2 = qword_100014060;
          }
        }
      }
      v1 = v3 + 1;
    }
    while (v3 + 1 < v0);
    if (v0)
    {
      v18 = 0;
      v19 = 0;
      do
      {
        if (v18 > ~v2)
          goto LABEL_54;
        v20 = *(_QWORD *)(v2 + v18);
        if (v20)
        {
          if (*(_DWORD *)(v20 + 56))
            ++v19;
        }
        v18 += 8;
      }
      while (8 * v0 != v18);
      if (v19 != v0)
      {
        if (v19)
        {
          v21 = (uint64_t)malloc_type_calloc(v19, 8uLL, 0x2004093837F09uLL);
          if (!v21)
            goto LABEL_55;
          v22 = v21;
          v23 = dword_100014058;
          if (dword_100014058)
          {
            v24 = 0;
            v25 = 0;
            v26 = 0;
            v27 = ~v21;
            while (!__CFADD__(qword_100014060, v24))
            {
              v28 = *(_QWORD *)(qword_100014060 + 8 * v25);
              if (v28)
              {
                if (*(_DWORD *)(v28 + 56))
                {
                  if (v27 < 8 * (unint64_t)v26)
                    break;
                  if (v19 <= v26)
                    goto LABEL_56;
                  v29 = v26++;
                  *(_QWORD *)(v22 + 8 * v29) = v28;
                }
                else
                {
                  dispatch_source_cancel(*(dispatch_source_t *)(v28 + 48));
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 0x40000000;
                  block[2] = sub_10000B314;
                  block[3] = &unk_1000108C0;
                  block[4] = v28;
                  dispatch_async((dispatch_queue_t)qword_100014298, block);
                  v23 = dword_100014058;
                }
              }
              ++v25;
              v24 += 8;
              if (v25 >= v23)
                goto LABEL_51;
            }
LABEL_54:
            __break(0x5513u);
LABEL_55:
            __assert_rtn("_vnode_sweep", "pathwatch.c", 548, "new_source != NULL");
          }
          v26 = 0;
        }
        else
        {
          v26 = 0;
          v22 = 0;
        }
LABEL_51:
        free((void *)qword_100014060);
        qword_100014060 = v22;
        dword_100014058 = v26;
      }
    }
  }
}

void sub_10000B314(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
  free(**(void ***)(a1 + 32));
  free(*(void **)(*(_QWORD *)(a1 + 32) + 64));
  free(*(void **)(a1 + 32));
}

size_t sub_10000B358(char *a1, _OWORD *a2, int a3, __int16 a4)
{
  NSObject *v8;
  size_t result;
  uint64_t v10;
  int i;
  int v12;
  char *v13;
  int v14;
  size_t v15;
  uint64_t v16;
  int v17;
  char *v18;
  int64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;

  v8 = qword_100014298;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100014298);
  if (qword_100014050 != -1)
    dispatch_once(&qword_100014050, &stru_1000108A0);
  if (*a1 == 47)
  {
    result = (size_t)malloc_type_calloc(1uLL, 0x70uLL, 0x10B0040DF2FFA84uLL);
    if (!result)
      __assert_rtn("_path_node_init", "pathwatch.c", 723, "pnode != NULL");
    v10 = result;
    *(_QWORD *)(result + 8) = 1;
    for (i = *a1; i == 47; i = v12)
    {
      if (a1 == (char *)-1)
        goto LABEL_44;
      v12 = *++a1;
    }
    while (1)
    {
LABEL_28:
      v18 = strchr(a1, 47);
      if (!v18)
        v18 = &a1[strlen(a1)];
      v19 = v18 - a1;
      if (v18 == a1)
        break;
      *(_QWORD *)(v10 + 8) += v19 + 1;
      if (v18)
      {
        result = (size_t)malloc_type_malloc(v19 + 1, 0x1FCFB76DuLL);
        if (!result)
          __assert_rtn("_path_node_init", "pathwatch.c", 747, "name != NULL");
        v13 = (char *)result;
        if (a1)
          result = (size_t)strncpy((char *)result, a1, v18 - a1);
        if (__CFADD__(v13, v19))
          goto LABEL_44;
        if (v19 < 0)
          goto LABEL_45;
        v13[v19] = 0;
      }
      else
      {
        v13 = strdup(a1);
      }
      v14 = *(_DWORD *)(v10 + 48);
      if (v14)
      {
        v15 = 8 * (v14 + 1);
        result = (size_t)reallocf(*(void **)(v10 + 56), v15);
      }
      else
      {
        result = (size_t)malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL);
        v15 = 8;
      }
      *(_QWORD *)(v10 + 56) = result;
      if (!result)
        __assert_rtn("_path_node_init", "pathwatch.c", 763, "pnode->pname != NULL");
      v16 = *(unsigned int *)(v10 + 48);
      if (__CFADD__(result, 8 * v16))
        goto LABEL_44;
      if (v15 <= 8 * v16)
        goto LABEL_45;
      a1 = 0;
      *(_QWORD *)(result + 8 * v16) = v13;
      *(_DWORD *)(v10 + 48) = v16 + 1;
      if (v18)
      {
        a1 = v18;
        if (*v18 == 47)
        {
          a1 = v18;
          while (a1 != (char *)-1)
          {
            v17 = *++a1;
            if (v17 != 47)
              goto LABEL_28;
          }
          goto LABEL_44;
        }
      }
    }
    v20 = malloc_type_calloc(1uLL, *(_QWORD *)(v10 + 8), 0x79E9B60EuLL);
    *(_QWORD *)v10 = v20;
    if (!v20)
      __assert_rtn("_path_node_init", "pathwatch.c", 776, "pnode->path != NULL");
    if (!*(_DWORD *)(v10 + 48))
    {
LABEL_36:
      *(_DWORD *)(v10 + 104) = 1;
      v24 = a2[1];
      *(_OWORD *)(v10 + 16) = *a2;
      *(_OWORD *)(v10 + 32) = v24;
      sub_10000B69C(v10, 0, 0);
      *(_QWORD *)(v10 + 72) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v8);
      *(_DWORD *)(v10 + 68) = a4 & 0x3FF;
      if (a3)
        *(_DWORD *)(v10 + 68) = a4 & 0x3FF | 0x20000000;
      return v10;
    }
    v21 = 0;
    v22 = 0;
    while (1)
    {
      result = strlcat(*(char **)v10, "/", *(_QWORD *)(v10 + 8));
      v23 = *(_QWORD *)(v10 + 56);
      if (__CFADD__(v23, v21))
        break;
      strlcat(*(char **)v10, *(const char **)(v23 + 8 * v22++), *(_QWORD *)(v10 + 8));
      v21 += 8;
      if (v22 >= *(unsigned int *)(v10 + 48))
        goto LABEL_36;
    }
LABEL_44:
    __break(0x5513u);
LABEL_45:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

void sub_10000B69C(uint64_t a1, int a2, const char **a3)
{
  NSObject *v6;
  const char *v7;
  int v8;
  int v9;
  __int128 v10;
  __int128 v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uintptr_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  size_t v24;
  stat *v25;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  size_t v29;
  uint64_t v30;
  const char *v31;
  size_t v32;
  size_t v33;
  size_t v34;
  char *v35;
  uid_t v36;
  gid_t v37;
  char *v38;
  int v39;
  uid_t v40;
  uid_t v41;
  _QWORD block[5];
  stat v43;
  audit_token_t atoken;
  audit_token_t v45;
  stat v46;
  char __str[1025];

  if (!a1)
    return;
  memset(&v43, 0, sizeof(v43));
  v6 = *(NSObject **)(a1 + 72);
  if (v6)
  {
    if (dispatch_source_testcancel(v6))
      return;
  }
  v7 = *(const char **)a1;
  v9 = *(_DWORD *)(a1 + 64);
  v8 = *(_DWORD *)(a1 + 68);
  v10 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)v45.val = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v45.val[4] = v10;
  if (v7)
  {
    memset(&v46, 0, sizeof(v46));
    *(_DWORD *)(a1 + 64) = 0;
    if (*v7 == 47)
    {
      if (v7 == (const char *)-1)
LABEL_75:
        __break(0x5513u);
      if (v7[1])
      {
        if ((v8 & 0x20000000) == 0)
        {
          v11 = *(_OWORD *)(a1 + 32);
          *(_OWORD *)atoken.val = *(_OWORD *)(a1 + 16);
          *(_OWORD *)&atoken.val[4] = v11;
          if (sandbox_check_by_audit_token(&atoken, "file-read-metadata", SANDBOX_CHECK_NO_REPORT | 1u))
          {
LABEL_10:
            a2 |= 0x40u;
            goto LABEL_18;
          }
        }
        memset(&v46, 0, sizeof(v46));
        if (lstat(v7, &v46))
          goto LABEL_18;
        v12 = v46.st_mode & 0xF000;
        switch(v12)
        {
          case 16384:
            v14 = 0;
            v13 = 0;
            v15 = 3;
            goto LABEL_57;
          case 40960:
            v14 = 0;
            v15 = 2;
            v13 = 1;
            goto LABEL_57;
          case 32768:
            v13 = 0;
            v14 = 1;
            v15 = 1;
LABEL_57:
            *(_DWORD *)(a1 + 64) = v15;
            if ((v8 & 0x20000000) != 0)
              goto LABEL_18;
            atoken = v45;
            if (!audit_token_to_euid(&atoken))
              goto LABEL_18;
            bzero(__str, 0x401uLL);
            if (!realpath_DARWIN_EXTSN(v7, __str)
              || qword_100014068 && !strncasecmp(__str, (const char *)qword_100014068, qword_100014070))
            {
              goto LABEL_18;
            }
            if (v14)
            {
              atoken = v45;
              v36 = audit_token_to_euid(&atoken);
              atoken = v45;
              v37 = audit_token_to_egid(&atoken);
              v38 = (char *)v7;
              v39 = 0;
            }
            else
            {
              if (!v13)
              {
                snprintf(__str, 0x400uLL, "%s/.", v7);
                atoken = v45;
                v41 = audit_token_to_euid(&atoken);
                atoken = v45;
                v37 = audit_token_to_egid(&atoken);
                v38 = __str;
                v39 = 0;
                v40 = v41;
                goto LABEL_72;
              }
              atoken = v45;
              v36 = audit_token_to_euid(&atoken);
              atoken = v45;
              v37 = audit_token_to_egid(&atoken);
              v38 = (char *)v7;
              v39 = 1;
            }
            v40 = v36;
LABEL_72:
            if (sub_10000BC58(v38, v39, v40, v37) != 2)
              goto LABEL_18;
            *(_DWORD *)(a1 + 64) = 0;
            goto LABEL_10;
        }
        v16 = 4;
      }
      else
      {
        v16 = 3;
      }
      *(_DWORD *)(a1 + 64) = v16;
    }
  }
LABEL_18:
  if (a3)
  {
    if ((a2 & 0x61) != 0)
    {
      *(_DWORD *)(a1 + 64) = 0;
      v17 = a2 & 0x60 | 1;
    }
    else
    {
      v17 = 0;
    }
    if (*a3 && *(_QWORD *)a1 && !strcmp(*a3, *(const char **)a1))
      v17 |= a2;
    v18 = *(_DWORD *)(a1 + 68);
    v19 = v17 | (*(_DWORD *)(a1 + 64) == 0);
    v20 = v17 | 0x80;
    if (!*(_DWORD *)(a1 + 64))
      v20 = 0;
    if (!v9)
      v19 = v20;
    v21 = v18 & v19 & 0x3FFLL;
    if (v21)
    {
      v22 = *(NSObject **)(a1 + 72);
      if ((v18 & 0x10000000) == 0)
      {
        *(_DWORD *)(a1 + 68) = v18 | 0x10000000;
        if (v22)
          dispatch_suspend(v22);
        v23 = dispatch_time(0, 100000000);
        ++*(_DWORD *)(a1 + 104);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_10000BDAC;
        block[3] = &unk_1000108E0;
        block[4] = a1;
        dispatch_after(v23, (dispatch_queue_t)qword_100014298, block);
        v22 = *(NSObject **)(a1 + 72);
      }
      if (v22)
        dispatch_source_merge_data(v22, v21);
    }
  }
  v24 = *(_QWORD *)(a1 + 8);
  if (v24 <= 0x400)
  {
    v25 = (stat *)malloc_type_malloc(v24, 0xB174E72CuLL);
    if (!v25)
      __assert_rtn("_path_node_update", "pathwatch.c", 874, "buf != NULL");
  }
  else
  {
    v25 = &v46;
  }
  sub_10000AF9C(a1);
  sub_10000BDE4(0, 0, a1);
  bzero(v25, *(_QWORD *)(a1 + 8));
  if (*(_DWORD *)(a1 + 48))
  {
    v26 = 0;
    v27 = 0;
    while (1)
    {
      v28 = strlen((const char *)v25);
      v29 = *(_QWORD *)(a1 + 8);
      if (v28 + 1 > v29)
        __assert_rtn("_path_node_update", "pathwatch.c", 885, "(strlen(buf) + 1) <= pnode->plen");
      strlcat((char *)v25, "/", v29);
      v30 = *(_QWORD *)(a1 + 56);
      if (__CFADD__(v30, v26))
        goto LABEL_75;
      v31 = *(const char **)(v30 + 8 * v27);
      if (!v31)
        __assert_rtn("_path_node_update", "pathwatch.c", 888, "pnode->pname[i] != NULL");
      v32 = strlen((const char *)v25);
      v33 = strlen(v31);
      v34 = *(_QWORD *)(a1 + 8);
      if (v33 + v32 > v34)
        __assert_rtn("_path_node_update", "pathwatch.c", 889, "(strlen(buf) + strlen(pnode->pname[i])) <= pnode->plen");
      strlcat((char *)v25, v31, v34);
      memset(&v43, 0, sizeof(v43));
      if (lstat((const char *)v25, &v43) < 0)
        goto LABEL_52;
      v35 = (char *)v25;
      if ((v43.st_mode & 0xF000) != 0xA000)
        goto LABEL_50;
      sub_10000BDE4((const char *)v25, 1, a1);
      if (realpath_DARWIN_EXTSN((const char *)v25, __str))
        break;
LABEL_51:
      ++v27;
      v26 += 8;
      if (v27 >= *(unsigned int *)(a1 + 48))
        goto LABEL_52;
    }
    v35 = __str;
LABEL_50:
    sub_10000BDE4(v35, 0, a1);
    goto LABEL_51;
  }
LABEL_52:
  sub_10000B018();
  if (v25 != &v46)
    free(v25);
}

uint64_t sub_10000BC58(const char *a1, int a2, uid_t a3, gid_t a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  passwd *v11;
  int v12;
  int v13;
  int v14;
  stat v16;
  gid_t v17[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  memset(&v16, 0, sizeof(v16));
  v8 = gL1CacheEnabled;
  gL1CacheEnabled = 0;
  *(_OWORD *)v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = getgroups(16, v17);
  if ((v9 & 0x80000000) != 0)
    return 1;
  v10 = v9;
  v11 = getpwuid(a3);
  if (!v11)
  {
    gL1CacheEnabled = v8;
    return 1;
  }
  v12 = initgroups(v11->pw_name, a4);
  gL1CacheEnabled = v8;
  if (v12 < 0)
    return 1;
  pthread_setugid_np(a3, a4);
  v13 = a2 ? lstat(a1, &v16) : stat(a1, &v16);
  v14 = v13;
  pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if (syscall(243, v10, v17, 0) < 0)
    return 1;
  if (!v14)
    return 0;
  if (*__error() == 13)
    return 2;
  return 1;
}

void sub_10000BDAC(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 68) &= ~0x10000000u;
  dispatch_resume(*(dispatch_object_t *)(v2 + 72));
  sub_10000AED0(*(_QWORD *)(a1 + 32));
}

void sub_10000BDE4(const char *a1, int a2, uint64_t a3)
{
  const char *v5;
  const char *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_source_t v15;
  NSObject *v16;
  _DWORD *v17;
  uint64_t v18;
  char *v19;
  size_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  int v24;
  _QWORD handler[5];
  stat v26;

  memset(&v26, 0, sizeof(v26));
  if (a1)
    v5 = a1;
  else
    v5 = "/";
  if (*v5)
    v6 = v5;
  else
    v6 = "/";
  if (dword_100014058)
  {
    v7 = 0;
    v8 = qword_100014060;
    v9 = ~qword_100014060;
    v10 = 8 * dword_100014058;
    while (v7 <= v9)
    {
      v11 = *(_QWORD *)(v8 + v7);
      if (v11 && *(_DWORD *)(v11 + 8) == a2 && !strcmp(v6, *(const char **)v11))
      {
        sub_10000C130(v11, a3);
        return;
      }
      v7 += 8;
      if (v10 == v7)
        goto LABEL_14;
    }
LABEL_36:
    __break(0x5513u);
    goto LABEL_37;
  }
LABEL_14:
  if (a2 == 1)
    v12 = 2129920;
  else
    v12 = 0x8000;
  v13 = open_NOCANCEL(v6, v12);
  if ((v13 & 0x80000000) == 0)
  {
    v14 = v13;
    v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v13, 0x7FuLL, (dispatch_queue_t)qword_100014298);
    if (!v15)
    {
      close_NOCANCEL(v14);
      return;
    }
    v16 = v15;
    v17 = malloc_type_calloc(1uLL, 0x48uLL, 0x10B004012F3CC1DuLL);
    if (!v17)
      __assert_rtn("_vnode_create", "pathwatch.c", 430, "vnode != NULL");
    v18 = (uint64_t)v17;
    v17[2] = a2;
    v19 = strdup(v6);
    *(_QWORD *)v18 = v19;
    if (!v19)
      __assert_rtn("_vnode_create", "pathwatch.c", 434, "vnode->path != NULL");
    *(_DWORD *)(v18 + 12) = v14;
    *(_QWORD *)(v18 + 48) = v16;
    memset(&v26, 0, sizeof(v26));
    if (!fstat(v14, &v26))
    {
      *(timespec *)(v18 + 16) = v26.st_mtimespec;
      *(timespec *)(v18 + 32) = v26.st_ctimespec;
    }
    sub_10000C130(v18, a3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_10000C244;
    handler[3] = &unk_100010900;
    handler[4] = v18;
    dispatch_source_set_event_handler(v16, handler);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 0x40000000;
    v23[2] = sub_10000C378;
    v23[3] = &unk_100010920;
    v24 = v14;
    dispatch_source_set_cancel_handler(v16, v23);
    if (dword_100014058)
    {
      v20 = 8 * (dword_100014058 + 1);
      v21 = reallocf((void *)qword_100014060, v20);
    }
    else
    {
      v20 = 8;
      v21 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    }
    qword_100014060 = (uint64_t)v21;
    if (!v21)
      __assert_rtn("_vnode_create", "pathwatch.c", 460, "_global.vnode != NULL");
    v22 = dword_100014058++;
    if (__CFADD__(v21, 8 * v22))
      goto LABEL_36;
    if (v20 <= 8 * v22)
    {
LABEL_37:
      __break(1u);
      return;
    }
    v21[v22] = v18;
    dispatch_resume(v16);
  }
}

unint64_t sub_10000C130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  unint64_t v7;
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v4)
  {
    v5 = 0;
    result = *(_QWORD *)(a1 + 64);
    v7 = ~result;
    while (v5 <= v7)
    {
      if (*(_QWORD *)(result + v5) == a2)
        return result;
      v5 += 8;
      if (8 * v4 == v5)
      {
        v8 = 0;
        while (v7 >= 8 * v8)
        {
          if (!*(_QWORD *)(result + 8 * v8))
          {
            v11 = (_QWORD *)(result + 8 * v8);
            goto LABEL_17;
          }
          if (++v8 == v4)
          {
            v9 = 8 * (v4 + 1);
            result = (unint64_t)reallocf((void *)result, v9);
            goto LABEL_12;
          }
        }
        goto LABEL_20;
      }
    }
    goto LABEL_20;
  }
  v9 = 8;
  result = (unint64_t)malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
LABEL_12:
  *(_QWORD *)(a1 + 64) = result;
  if (!result)
    __assert_rtn("_vnode_add_pnode", "pathwatch.c", 319, "vnode->path_node != NULL");
  v10 = *(unsigned int *)(a1 + 56);
  *(_DWORD *)(a1 + 56) = v10 + 1;
  if (__CFADD__(result, 8 * v10))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (v9 <= 8 * v10)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  v11 = (_QWORD *)(result + 8 * v10);
LABEL_17:
  *v11 = a2;
  return result;
}

uint64_t sub_10000C244(uint64_t result)
{
  uint64_t v1;
  uintptr_t data;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  stat v6;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    memset(&v6, 0, sizeof(v6));
    data = *(_QWORD *)(v1 + 48);
    if (data)
    {
      result = dispatch_source_testcancel(*(dispatch_source_t *)(v1 + 48));
      if (result)
        return result;
      data = dispatch_source_get_data((dispatch_source_t)data);
    }
    result = fstat(*(_DWORD *)(v1 + 12), &v6);
    if (!(_DWORD)result)
    {
      if (*(_OWORD *)(v1 + 16) != *(_OWORD *)&v6.st_mtimespec)
      {
        data = data | 0x100;
        *(timespec *)(v1 + 16) = v6.st_mtimespec;
      }
      if (*(_OWORD *)(v1 + 32) != *(_OWORD *)&v6.st_ctimespec)
      {
        data = data | 0x200;
        *(timespec *)(v1 + 32) = v6.st_ctimespec;
      }
    }
    if ((data & 1) != 0)
      *(_DWORD *)(v1 + 8) = 2;
    if (*(_DWORD *)(v1 + 56))
    {
      v3 = 0;
      v4 = 0;
      while (1)
      {
        v5 = *(_QWORD *)(v1 + 64);
        if (__CFADD__(v5, v3))
          break;
        result = sub_10000B69C(*(_QWORD *)(v5 + 8 * v4++), data, v1);
        v3 += 8;
        if (v4 >= *(unsigned int *)(v1 + 56))
          return result;
      }
      __break(0x5513u);
    }
  }
  return result;
}

uint64_t sub_10000C378(uint64_t a1)
{
  return close_NOCANCEL(*(unsigned int *)(a1 + 32));
}

void sub_10000C380(id a1)
{
  char __s[1024];

  qword_100014068 = 0;
  qword_100014070 = 0;
  if (realpath_DARWIN_EXTSN("/var/db/timezone/zoneinfo", __s))
  {
    qword_100014070 = strlen(__s);
    qword_100014068 = (uint64_t)strdup(__s);
    if (!qword_100014068)
      qword_100014070 = 0;
  }
}

uint64_t sub_10000C410(uint64_t a1)
{
  return sub_100003C20(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
}

unint64_t sub_10000C424(uint64_t a1, uint64_t a2, char *a3, _OWORD *a4, int a5)
{
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  __int128 v14;
  size_t v15;
  size_t v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  size_t v21;
  __int16 v22;
  uint64_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  NSObject *v26;
  _QWORD handler[5];
  _OWORD v28[2];

  ++qword_100014168;
  if (!a3)
    return 6;
  result = os_set_str_ptr_find(&unk_100014190, a1);
  v10 = 1;
  if (!result || qword_1000141A8 == result)
    return v10;
  if (!a2)
    return 10;
  if (*(_WORD *)(a2 + 76))
  {
    v11 = *(unsigned __int16 *)(a2 + 76) - 1;
    if (!__CFADD__(qword_100014290, 8 * v11))
    {
      v12 = *(_QWORD *)(qword_100014290 + 8 * v11);
      v10 = 6;
      if (*(_DWORD *)v12 == 2)
      {
        if (!strcmp(a3, **(const char ***)(v12 + 8)))
          return 0;
        else
          return 6;
      }
      return v10;
    }
    goto LABEL_40;
  }
  if (a5)
    v13 = a5;
  else
    v13 = 1023;
  v14 = a4[1];
  v28[0] = *a4;
  v28[1] = v14;
  v15 = sub_10000B358(a3, v28, 0, v13);
  if (!v15)
    return 53;
  v16 = v15;
  *(_QWORD *)(v15 + 96) = *(_QWORD *)(a2 + 64);
  v17 = malloc_type_calloc(1uLL, 0x10uLL, 0x10800407411B482uLL);
  if (!v17)
    __assert_rtn("service_open_path_private", "service.c", 195, "info != NULL");
  v18 = v17;
  *(_DWORD *)v17 = 2;
  v17[1] = v16;
  if (word_100014304)
  {
    if ((unsigned __int16)word_100014304 == 0xFFFF)
      __assert_rtn("service_info_add", "service.c", 104, "global.service_info_count != UINT16_MAX");
    v19 = 0;
    v20 = 0;
    result = qword_100014290;
    while (v19 <= ~qword_100014290)
    {
      if (!*(_QWORD *)(qword_100014290 + 8 * v20))
      {
        *(_QWORD *)(qword_100014290 + 8 * v20) = v18;
        v22 = v20 + 1;
        goto LABEL_36;
      }
      ++v20;
      v19 += 8;
      if ((unsigned __int16)word_100014304 == v20)
      {
        v21 = 8 * (unsigned __int16)++word_100014304;
        result = (unint64_t)malloc_type_realloc((void *)qword_100014290, v21, 0x80040B8603338uLL);
        goto LABEL_27;
      }
    }
    goto LABEL_40;
  }
  word_100014304 = 1;
  v21 = 8;
  result = (unint64_t)malloc_type_malloc(8uLL, 0x80040B8603338uLL);
LABEL_27:
  qword_100014290 = result;
  v22 = word_100014304;
  v23 = (unsigned __int16)word_100014304 - 1;
  v24 = __CFADD__(result, 8 * v23);
  v25 = result + 8 * v23 >= result;
  if (!word_100014304)
    v25 = v24;
  if (!v25)
  {
LABEL_40:
    __break(0x5513u);
    goto LABEL_41;
  }
  if (v21 > 8 * v23)
  {
    *(_QWORD *)(result + 8 * v23) = v18;
LABEL_36:
    *(_WORD *)(a2 + 76) = v22;
    v26 = *(NSObject **)(v16 + 72);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_10000C6F0;
    handler[3] = &unk_100010960;
    handler[4] = v16;
    dispatch_source_set_event_handler(v26, handler);
    dispatch_activate(*(dispatch_object_t *)(v16 + 72));
    return 0;
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_10000C6F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = os_set_64_ptr_find(&unk_1000141D0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  if (v1)
  {
    v2 = v1 - qword_1000141E8;
    if (v2)
    {
      if ((*(_BYTE *)(v2 + 79) & 0xF) == 1)
      {
        v3 = *(_QWORD *)(v2 + 48);
        if (v3)
        {
          v4 = *(unsigned int *)(v3 + 52);
          if ((_DWORD)v4 != -1)
          {
            if (__CFADD__(qword_1000142E0, 4 * v4))
            {
              __break(0x5513u);
              return;
            }
            ++*(_DWORD *)(qword_1000142E0 + 4 * v4);
          }
        }
      }
      sub_100005AB4(v2, 0, 0);
    }
  }
}

unint64_t sub_10000C77C(char *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t result;
  char *v7;
  char *v8;
  char *v9;
  int v10;
  __int128 v11;
  _OWORD v12[2];

  result = strncmp(a1, "com.apple.system.notify.service.", 0x20uLL);
  if (!(_DWORD)result)
  {
    if ((unint64_t)a1 < 0xFFFFFFFFFFFFFFE0)
    {
      result = strncmp(a1 + 32, "path:", 5uLL);
      if ((_DWORD)result)
        return result;
      result = (unint64_t)strchr(a1, 58);
      if (result)
      {
        if (result == -1)
          goto LABEL_14;
        v7 = (char *)(result + 1);
      }
      else
      {
        v7 = 0;
      }
      v8 = strchr(v7, 58);
      if (!v8)
      {
        v10 = 0;
        goto LABEL_12;
      }
      v9 = v8;
      result = strtol(v7, 0, 0);
      if (v9 != (char *)-1)
      {
        v10 = result;
        v7 = v9 + 1;
LABEL_12:
        v11 = a3[1];
        v12[0] = *a3;
        v12[1] = v11;
        return sub_10000C424((uint64_t)a1, a2, v7, v12, v10);
      }
    }
LABEL_14:
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_10000C86C(uint64_t result)
{
  int v1;
  BOOL v2;
  unsigned int v3;

  v1 = *(_DWORD *)(result + 20);
  v2 = __OFSUB__(v1, 64);
  v3 = v1 - 64;
  if (v2)
  {
    __break(0x5515u);
  }
  else
  {
    if (v3 > 8)
      return 0;
    if (40 * (unint64_t)v3 <= ~(unint64_t)&unk_1000109A0)
      return (uint64_t)*(&off_100010980 + 5 * v3 + 5);
  }
  __break(0x5513u);
  return result;
}

_DWORD *sub_10000C8C8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36)
    sub_100009608();
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000C908(uint64_t result, uint64_t a2)
{
  int v2;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 0x100000)
      sub_100009628();
    v2 = -300;
  }
  else
  {
    v2 = -304;
  }
  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000C96C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36)
    sub_100009648();
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000C9AC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 24)
    sub_100009668();
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000C9EC(_DWORD *result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  v3 = result[8];
  v4 = os_set_32_ptr_find(&unk_1000141F0, v3);
  if (v4)
    v11 = (unsigned int *)(v4 - qword_100014208);
  else
    v11 = 0;
  v12 = *(_QWORD *)v11;
  if (*(_QWORD *)v11)
  {
    do
    {
      v13 = *(_QWORD *)(v12 + 32);
      sub_100003DF8(v12);
      v12 = v13;
    }
    while (v13);
  }
  v14 = v11[3];
  if ((v14 & 2) == 0)
    goto LABEL_13;
  if ((v14 & 4) != 0)
  {
    sub_10000554C((FILE *)7, "do_mach_notify_dead_name freed port %x\n", v5, v6, v7, v8, v9, v10, v3);
LABEL_13:
    sub_10000645C(v11);
    goto LABEL_14;
  }
  v11[3] = v14 | 4;
LABEL_14:
  result = (_DWORD *)mach_port_deallocate(mach_task_self_, v3);
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_10000CAD4(uint64_t result)
{
  int v1;
  BOOL v2;
  unsigned int v3;

  v1 = *(_DWORD *)(result + 20);
  v2 = __OFSUB__(v1, 1000);
  v3 = v1 - 1000;
  if (v2)
  {
    __break(0x5515u);
  }
  else
  {
    if (v3 > 0x20)
      return 0;
    if (40 * (unint64_t)v3 <= ~(unint64_t)&unk_100010B28)
      return (uint64_t)*(&off_100010B08 + 5 * v3 + 5);
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10000CB30(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  audit_token_t atoken;
  pid_t pidp;
  __int128 v18;
  __int128 v19;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  v4 = *(unsigned int *)(result + 32);
  v6 = *(_OWORD *)(result + 72);
  v18 = *(_OWORD *)(result + 56);
  v5 = v18;
  v19 = v6;
  pidp = -1;
  *(_DWORD *)(a2 + 36) = 0;
  ++qword_100014108;
  *(_OWORD *)atoken.val = v5;
  *(_OWORD *)&atoken.val[4] = v6;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  sub_10000554C((FILE *)7, "__notify_server_check %d %d\n", v7, v8, v9, v10, v11, v12, pidp);
  result = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)pidp << 32));
  if (result && qword_1000141E8 != result)
  {
    v14 = *(_DWORD *)(*(_QWORD *)(result - qword_1000141E8 + 48) + 60);
    if (v14 == *(_DWORD *)(result - qword_1000141E8 + 72))
    {
      v15 = 0;
    }
    else
    {
      *(_DWORD *)(result - qword_1000141E8 + 72) = v14;
      v15 = 1;
    }
    v13 = 0;
    *(_DWORD *)(a2 + 36) = v15;
  }
  else
  {
    v13 = 2;
  }
  *(_DWORD *)(a2 + 40) = v13;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 44;
  return result;
}

uint64_t sub_10000CCC0(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _OWORD v14[2];
  unsigned int v15;
  gid_t v16;
  uid_t v17;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  v4 = *(unsigned int *)(result + 32);
  v5 = *(_OWORD *)(result + 72);
  v14[0] = *(_OWORD *)(result + 56);
  v14[1] = v5;
  v16 = -1;
  v17 = -1;
  v15 = -1;
  *(_QWORD *)(a2 + 36) = 0;
  sub_100005648(v14, 0xFFFFFFFF, &v17, &v16, &v15, 0);
  xmmword_100014110 = (__int128)vaddq_s64((int64x2_t)xmmword_100014110, vdupq_n_s64(1uLL));
  sub_10000554C((FILE *)7, "__notify_server_get_state %d %d\n", v6, v7, v8, v9, v10, v11, v15);
  result = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v15 << 32));
  if (result && qword_1000141E8 != result)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(result - qword_1000141E8 + 48) + 16);
    *(_QWORD *)(a2 + 36) = 0;
    result = os_set_64_ptr_find(&unk_1000141B0, v13);
    if (!result || qword_1000141C8 == result)
    {
      *(_DWORD *)(a2 + 44) = 1;
      __assert_rtn("__notify_server_get_state", "notify_proc.c", 1135, "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
    }
    v12 = 0;
    *(_QWORD *)(a2 + 36) = *(_QWORD *)(result - qword_1000141C8 + 24);
  }
  else
  {
    v12 = 50;
  }
  *(_DWORD *)(a2 + 44) = v12;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 48;
  return result;
}

uint64_t sub_10000CE5C(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  _OWORD v16[2];
  unsigned int v17;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  v4 = *(unsigned int *)(result + 32);
  v5 = *(_OWORD *)(result + 72);
  v16[0] = *(_OWORD *)(result + 56);
  v16[1] = v5;
  v17 = -1;
  sub_100005648(v16, 0xFFFFFFFF, 0, 0, &v17, 0);
  ++qword_1000140E8;
  sub_10000554C((FILE *)7, "__notify_server_suspend %d %d\n", v6, v7, v8, v9, v10, v11, v17);
  result = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v17 << 32));
  if (result && (v12 = qword_1000141E8, qword_1000141E8 != result))
  {
    v14 = result - qword_1000141E8;
    *(_BYTE *)(result - qword_1000141E8 + 79) |= 0x20u;
    v15 = *(unsigned __int8 *)(result - v12 + 78);
    v13 = 0;
    if (v15 != 255)
      *(_BYTE *)(v14 + 78) = v15 + 1;
  }
  else
  {
    v13 = 50;
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = v13;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

void sub_10000CFA8(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _OWORD v14[2];
  unsigned int v15;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  v4 = *(unsigned int *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 72);
  v14[0] = *(_OWORD *)(a1 + 56);
  v14[1] = v5;
  v15 = -1;
  sub_100005648(v14, 0xFFFFFFFF, 0, 0, &v15, 0);
  ++qword_1000140F0;
  sub_10000554C((FILE *)7, "__notify_server_resume %d %d\n", v6, v7, v8, v9, v10, v11, v15);
  v12 = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v15 << 32));
  if (v12 && qword_1000141E8 != v12)
  {
    sub_1000036EC(v12 - qword_1000141E8, 0, 0);
    v13 = 0;
  }
  else
  {
    v13 = 50;
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = v13;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
}

char *sub_10000D0D8(char *result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  int v12;
  __int128 v13;
  __int128 v14[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_18;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x30)
    goto LABEL_18;
  if (v4 > 0x230)
    goto LABEL_18;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || (_DWORD)v4 != v6 + 48)
    goto LABEL_18;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = *(_DWORD *)&v3[v6 + 40];
      v12 = *(_DWORD *)&v3[v6 + 44];
      v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = (char *)sub_100006630(v3 + 40, v11, v12, v14);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000D1F4(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    v4 = result;
    v3 = -304;
    if (*(_DWORD *)(result + 24) != 1)
      goto LABEL_3;
    v5 = *(unsigned int *)(result + 4);
    if (v5 < 0x3C || v5 > 0x23C)
      goto LABEL_3;
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      v3 = -300;
      goto LABEL_3;
    }
    v6 = *(_DWORD *)(result + 52);
    if (v6 <= 0x200)
    {
      v3 = -304;
      if ((int)v5 - 60 < v6)
        goto LABEL_3;
      v7 = (v6 + 3) & 0xFFFFFFFC;
      if ((_DWORD)v5 != v7 + 60)
        goto LABEL_3;
      if (__CFADD__(result, v5))
      {
        __break(0x5513u);
        return result;
      }
      if (v5 >= 0x238)
        v8 = 512;
      else
        v8 = v5 - 56;
      result = (uint64_t)memchr((void *)(result + 56), 0, v8);
      if (result)
      {
        v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
        if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
        {
          v10 = *(_DWORD *)(v4 + v7 + 56);
          v11 = *(unsigned int *)(v4 + 28);
          v12 = *(_OWORD *)(v9 + 36);
          v13[0] = *(_OWORD *)(v9 + 20);
          v13[1] = v12;
          result = sub_100006790((char *)(v4 + 56), v10, v11, v13);
          *(_DWORD *)(a2 + 32) = 0;
          return result;
        }
        v3 = -309;
        goto LABEL_3;
      }
    }
  }
  v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000D340(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    v4 = result;
    v3 = -304;
    if (*(_DWORD *)(result + 24) != 1)
      goto LABEL_3;
    v5 = *(unsigned int *)(result + 4);
    if (v5 < 0x3C || v5 > 0x23C)
      goto LABEL_3;
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      v3 = -300;
      goto LABEL_3;
    }
    v6 = *(_DWORD *)(result + 52);
    if (v6 <= 0x200)
    {
      v3 = -304;
      if ((int)v5 - 60 < v6)
        goto LABEL_3;
      v7 = (v6 + 3) & 0xFFFFFFFC;
      if ((_DWORD)v5 != v7 + 60)
        goto LABEL_3;
      if (__CFADD__(result, v5))
      {
        __break(0x5513u);
        return result;
      }
      if (v5 >= 0x238)
        v8 = 512;
      else
        v8 = v5 - 56;
      result = (uint64_t)memchr((void *)(result + 56), 0, v8);
      if (result)
      {
        v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
        if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
        {
          v10 = *(_DWORD *)(v4 + v7 + 56);
          v11 = *(unsigned int *)(v4 + 28);
          v12 = *(_OWORD *)(v9 + 36);
          v13[0] = *(_OWORD *)(v9 + 20);
          v13[1] = v12;
          result = sub_100006928((char *)(v4 + 56), v10, v11, v13);
          *(_DWORD *)(a2 + 32) = 0;
          return result;
        }
        v3 = -309;
        goto LABEL_3;
      }
    }
  }
  v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000D48C(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  char *v6;
  unint64_t v7;
  int v8;
  __int128 v9;
  __int128 v10[2];

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 64)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 56)))
    {
      if (!*(_DWORD *)(a1 + 64) && *(_DWORD *)(a1 + 68) > 0x1Fu)
      {
        v6 = *(char **)(a1 + 28);
        v7 = *(unsigned int *)(a1 + 52);
        v8 = *(_DWORD *)(a1 + 60);
        v9 = *(_OWORD *)(a1 + 100);
        v10[0] = *(_OWORD *)(a1 + 84);
        v10[1] = v9;
        sub_100006C44(v7, v6, v4, v8, v10);
        *(_DWORD *)(a2 + 32) = 0;
        mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(_QWORD *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      v5 = -309;
    }
    else
    {
      v5 = -300;
    }
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_10000D56C(uint64_t a1, uint64_t a2)
{
  int v3;
  NDR_record_t v4;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  size_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  int v21;
  __int128 v22;
  _OWORD v23[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2)
    goto LABEL_3;
  v6 = *(unsigned int *)(a1 + 4);
  if (v6 < 0x70 || v6 > 0x270)
    goto LABEL_3;
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112 || *(_BYTE *)(a1 + 51) != 1)
    goto LABEL_23;
  v7 = *(_DWORD *)(a1 + 68);
  if (v7 > 0x200)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v6 - 112 < v7)
    goto LABEL_3;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v6 != v8 + 112)
    goto LABEL_3;
  v9 = a1 + v8;
  v10 = *(_DWORD *)(a1 + 52);
  if (v10 != *(_DWORD *)(v9 + 104))
  {
LABEL_23:
    v3 = -300;
    goto LABEL_3;
  }
  if (__CFADD__(a1, v6))
  {
    __break(0x5513u);
    return;
  }
  if (v6 >= 0x248)
    v11 = 512;
  else
    v11 = v6 - 72;
  if (!memchr((void *)(a1 + 72), 0, v11))
    goto LABEL_2;
  v12 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v12 && *(_DWORD *)(v12 + 4) > 0x1Fu)
  {
    v13 = *(unsigned int *)(v9 + 72);
    v14 = *(_DWORD *)(v9 + 76);
    v15 = *(_DWORD *)(a1 + 28);
    v16 = *(_DWORD *)(v9 + 80);
    v17 = *(_DWORD *)(v9 + 84);
    v18 = *(_QWORD *)(v9 + 88);
    v19 = *(char **)(a1 + 40);
    v20 = *(_QWORD *)(v9 + 96);
    v21 = *(_DWORD *)(v9 + 108);
    v22 = *(_OWORD *)(v12 + 36);
    v23[0] = *(_OWORD *)(v12 + 20);
    v23[1] = v22;
    sub_100006D74((uint64_t *)(a1 + 72), v13, v14, v15, v16, v17, v18, v20, v19, v10, v21, (int *)(a2 + 36), (_QWORD *)(a2 + 40), (int *)(a2 + 48), v23);
    *(_DWORD *)(a2 + 32) = 0;
    mig_deallocate(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52));
    *(_QWORD *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    v4 = NDR_record;
    if (!*(_DWORD *)(a2 + 32))
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 52;
      return;
    }
    goto LABEL_4;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  v4 = NDR_record;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
}

uint64_t sub_10000D740(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      v3 = result + 40;
      if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) < 0x20u)
      {
        v4 = -309;
      }
      else
      {
        v5 = *(unsigned int *)(result + 28);
        v6 = *(_OWORD *)(v3 + 36);
        v7[0] = *(_OWORD *)(v3 + 20);
        v7[1] = v6;
        result = sub_1000070C8(v5, v7);
        v4 = 0;
      }
    }
    else
    {
      v4 = -300;
    }
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

char *sub_10000D7F4(char *result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  size_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_18;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C)
    goto LABEL_18;
  if (v4 > 0x22C)
    goto LABEL_18;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200)
    goto LABEL_18;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_18;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  v8 = v4 >= 0x228 ? 512 : v4 - 40;
  result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      *(_QWORD *)(a2 + 32) = 0x10000000000000;
      v11 = *(_DWORD *)&v3[v6 + 40];
      v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      result = (char *)sub_1000071BC(v3 + 40, v11, (_DWORD *)(a2 + 48), (mach_port_name_t *)(a2 + 28), v13);
      *(NDR_record_t *)(a2 + 40) = NDR_record;
      *(_DWORD *)a2 |= 0x80000000;
      *(_DWORD *)(a2 + 4) = 52;
      *(_DWORD *)(a2 + 24) = 1;
      return result;
    }
    v10 = -309;
  }
  else
  {
LABEL_18:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000D944(uint64_t a1, uint64_t a2)
{
  int v3;
  NDR_record_t v4;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  size_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  int v21;
  __int128 v22;
  __int128 v23[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2)
    goto LABEL_3;
  v6 = *(unsigned int *)(a1 + 4);
  if (v6 < 0x70 || v6 > 0x270)
    goto LABEL_3;
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112 || *(_BYTE *)(a1 + 51) != 1)
    goto LABEL_23;
  v7 = *(_DWORD *)(a1 + 68);
  if (v7 > 0x200)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v6 - 112 < v7)
    goto LABEL_3;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v6 != v8 + 112)
    goto LABEL_3;
  v9 = a1 + v8;
  v10 = *(_DWORD *)(a1 + 52);
  if (v10 != *(_DWORD *)(v9 + 104))
  {
LABEL_23:
    v3 = -300;
    goto LABEL_3;
  }
  if (__CFADD__(a1, v6))
  {
    __break(0x5513u);
    return;
  }
  if (v6 >= 0x248)
    v11 = 512;
  else
    v11 = v6 - 72;
  if (!memchr((void *)(a1 + 72), 0, v11))
    goto LABEL_2;
  v12 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v12 && *(_DWORD *)(v12 + 4) > 0x1Fu)
  {
    v13 = *(unsigned int *)(v9 + 72);
    v14 = *(_DWORD *)(v9 + 76);
    v15 = *(_DWORD *)(a1 + 28);
    v16 = *(_DWORD *)(v9 + 80);
    v17 = *(_DWORD *)(v9 + 84);
    v18 = *(_QWORD *)(v9 + 88);
    v19 = *(char **)(a1 + 40);
    v20 = *(_QWORD *)(v9 + 96);
    v21 = *(_DWORD *)(v9 + 108);
    v22 = *(_OWORD *)(v12 + 36);
    v23[0] = *(_OWORD *)(v12 + 20);
    v23[1] = v22;
    sub_1000072DC((uint64_t *)(a1 + 72), v13, v14, v15, v16, v17, v18, v20, v19, v10, v21, (int *)(a2 + 36), (_QWORD *)(a2 + 40), (int *)(a2 + 48), v23);
    *(_DWORD *)(a2 + 32) = 0;
    mig_deallocate(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52));
    *(_QWORD *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    v4 = NDR_record;
    if (!*(_DWORD *)(a2 + 32))
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 52;
      return;
    }
    goto LABEL_4;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  v4 = NDR_record;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
}

FILE *sub_10000DB18(FILE *result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int cookie;
  __sbuf ub;
  _OWORD v8[2];

  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 52)
  {
    v3 = -304;
  }
  else
  {
    if (!HIDWORD(result->_cookie) && LODWORD(result->_close) > 0x1F)
    {
      v5 = *(_QWORD *)&result->_bf._size;
      v4 = *(_QWORD *)&result->_lbfsize;
      cookie = (int)result->_cookie;
      ub = result->_ub;
      v8[0] = *(_OWORD *)&result->_seek;
      v8[1] = ub;
      result = sub_100004220(v5, v4, cookie, v8, 1);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

FILE *sub_10000DBB4(FILE *result, uint64_t a2)
{
  int v3;
  unsigned int size;
  uint64_t v5;
  int v6;
  __int128 v7;
  __int128 v8[2];

  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 48)
  {
    v3 = -304;
  }
  else
  {
    if (!LODWORD(result->_cookie) && HIDWORD(result->_cookie) > 0x1F)
    {
      size = result->_bf._size;
      v5 = *(_QWORD *)(&result->_bf._size + 1);
      v6 = *(&result->_lbfsize + 1);
      v7 = *(_OWORD *)((char *)&result->_write + 4);
      v8[0] = *(_OWORD *)((char *)&result->_read + 4);
      v8[1] = v7;
      result = sub_100006058(size, v5, (_QWORD *)(a2 + 36), (int *)(a2 + 44), v6, v8, 1);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}
