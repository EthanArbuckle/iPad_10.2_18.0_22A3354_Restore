void sub_100000FC8(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  _QWORD v5[6];

  do
    v4 = __ldxr((unsigned int *)&xmmword_10001E388 + 2);
  while (__stxr(v4 + 1, (unsigned int *)&xmmword_10001E388 + 2));
  asl_msg_retain(a1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100001054;
  v5[3] = &unk_1000187C0;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_async((dispatch_queue_t)qword_10001C040, v5);
}

uint64_t sub_100001054(uint64_t a1)
{
  time_t v2;
  uint64_t v3;
  uint64_t val_for_key;
  uint64_t v5;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  unsigned int v12;

  v2 = time(0);
  v3 = qword_10001E418;
  byte_10001C048 = 0;
  val_for_key = asl_msg_get_val_for_key(*(_QWORD *)(a1 + 32), "ASLModule");
  if (val_for_key)
  {
    if (v3)
    {
      v5 = *(_QWORD *)(v3 + 24);
      if (v5)
      {
        v6 = (const char *)val_for_key;
        do
        {
          if (!strcmp(v6, *(const char **)v5))
            sub_100001210(v5, *(_QWORD *)(a1 + 32));
          v5 = *(_QWORD *)(v5 + 24);
        }
        while (v5);
      }
    }
  }
  else
  {
    if (!dword_10001C04C || asl_check_option(*(_QWORD *)(a1 + 32), "store") == 1)
      sub_1000011DC(*(_QWORD *)(a1 + 32));
    if (sub_100001210(v3, *(_QWORD *)(a1 + 32)))
      v7 = 1;
    else
      v7 = v3 == 0;
    if (!v7)
    {
      while (1)
      {
        v3 = *(_QWORD *)(v3 + 24);
        if (!v3)
          break;
        sub_100001210(v3, *(_QWORD *)(a1 + 32));
      }
    }
  }
  v8 = asl_msg_get_val_for_key(*(_QWORD *)(a1 + 32), "ASLFinalNotification");
  if (v8)
    asl_msg_set_key_val(*(_QWORD *)(a1 + 32), "ASLFreeNotify", v8);
  if (dword_10001E404)
  {
    sub_100004590(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v9 = -*(_QWORD *)(a1 + 40);
    do
      v10 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v10 + v9, (unint64_t *)&xmmword_10001E388));
  }
  result = asl_msg_release(*(_QWORD *)(a1 + 32));
  do
    v12 = __ldxr((unsigned int *)&xmmword_10001E388 + 2);
  while (__stxr(v12 - 1, (unsigned int *)&xmmword_10001E388 + 2));
  if (v2 - qword_10001C050 >= 300)
  {
    result = sub_1000015FC(300);
    qword_10001C050 = v2;
  }
  return result;
}

void sub_1000011DC(uint64_t a1)
{
  if ((!qword_10001E418 || (*(_BYTE *)(qword_10001E418 + 8) & 1) != 0) && (byte_10001C048 & 1) == 0)
  {
    byte_10001C048 = 1;
    sub_100007F50(a1);
  }
}

uint64_t sub_100001210(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _DWORD *v14;
  const char *v15;
  char *v16;
  int v17;
  char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void **block;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  result = 1;
  if (a1 && a2)
  {
    v5 = *(_QWORD *)(a1 + 16);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 16);
      do
      {
        if ((*(_DWORD *)(v6 + 8) - 12) <= 2)
        {
          v7 = *(_QWORD *)(v6 + 24);
          if (v7)
            *(_DWORD *)(v7 + 72) &= ~0x80000000;
        }
        v6 = *(_QWORD *)(v6 + 40);
      }
      while (v6);
      do
      {
        v8 = *(_QWORD *)v5;
        if (*(_QWORD *)v5)
        {
          v9 = *(_DWORD *)(v5 + 8);
          if ((v9 - 17) >= 3)
          {
            if (v9 == 5)
            {
              if (((uint64_t (*)(void))asl_msg_cmp)() != 1)
                return 0;
              v8 = *(_QWORD *)v5;
            }
            if (asl_msg_cmp(v8, a2) == 1)
            {
              v10 = *(_DWORD *)(v5 + 8);
              result = 1;
              switch(v10)
              {
                case 1:
                  sub_10000262C(a1, *(char **)(v5 + 16), 1);
                  break;
                case 3:
                  return result;
                case 4:
                  return 0;
                case 6:
                  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
                  {
                    v15 = *(const char **)(v5 + 16);
                    if (v15)
                      notify_post(v15);
                  }
                  break;
                case 8:
                  if (*(_QWORD *)a1 && !strcmp(*(const char **)a1, "com.apple.asl"))
                  {
                    v16 = *(char **)(v5 + 16);
                    v17 = atoi(v16);
                    v18 = strchr(v16, 32);
                    if (v18 || (v18 = strchr(v16, 9)) != 0)
                    {
                      *v18++ = 0;
                      v19 = atoi(v18);
                    }
                    else
                    {
                      v19 = -1;
                    }
                    if (v17 != -1)
                      asl_msg_set_key_val(a2, "ReadUID", *(_QWORD *)(v5 + 16));
                    if (v18)
                    {
                      if (v19 != -1)
                        asl_msg_set_key_val(a2, "ReadGID", v18);
                      *(v18 - 1) = 32;
                    }
                  }
                  break;
                case 11:
                  sub_1000011DC(a2);
                  break;
                case 12:
                case 13:
                  v11 = *(_QWORD *)(v5 + 24);
                  if (!v11)
                    break;
                  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
                    break;
                  v12 = *(_DWORD *)(v11 + 72);
                  if (v12 < 0)
                    break;
                  *(_DWORD *)(v11 + 72) = v12 | 0x80000000;
                  if (v10 == 12)
                  {
                    v25 = *(_QWORD *)(v11 + 192);
                    if (!v25)
                      goto LABEL_57;
                    v14 = (_DWORD *)(v25 + 28);
                    goto LABEL_56;
                  }
                  if (v10 == 13)
                  {
                    v13 = *(_QWORD *)(v11 + 192);
                    if (v13)
                    {
                      v14 = (_DWORD *)(v13 + 36);
LABEL_56:
                      ++*v14;
                    }
                  }
LABEL_57:
                  if ((v12 & 0x400) != 0)
                  {
                    sub_100002778();
                    asl_msg_retain(a2);
                    v26 = qword_10001C060;
                    block = _NSConcreteStackBlock;
                    v29 = 0x40000000;
                    v30 = sub_1000027D0;
                    v27 = &unk_100018970;
LABEL_61:
                    v31 = v27;
                    v32 = a1;
                    v33 = v5;
                    v34 = a2;
                    dispatch_async(v26, &block);
                  }
                  else
                  {
                    sub_100002864((const char **)a1, v5, a2);
                  }
                  break;
                case 14:
                  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
                    break;
                  v20 = *(_QWORD *)(v5 + 24);
                  if (!v20)
                    break;
                  v21 = *(_QWORD *)(v20 + 192);
                  if (!v21)
                    break;
                  v22 = *(_DWORD *)(v20 + 72);
                  if (v22 < 0)
                    break;
                  *(_DWORD *)(v20 + 72) = v22 | 0x80000000;
                  ++*(_DWORD *)(v21 + 24);
                  if ((v22 & 0x400) == 0)
                  {
                    sub_100003E6C((const char **)a1, v5, a2);
                    break;
                  }
                  sub_100002778();
                  asl_msg_retain(a2);
                  v26 = qword_10001C060;
                  block = _NSConcreteStackBlock;
                  v29 = 0x40000000;
                  v30 = sub_100003DD8;
                  v27 = &unk_100018AD8;
                  goto LABEL_61;
                case 16:
                  asl_msg_get_val_for_key(a2, "ASLModule");
                  v23 = *(const char **)(v5 + 16);
                  if (!v23)
                    break;
                  if (!strcmp(*(const char **)(v5 + 16), "enable"))
                  {
                    v24 = *(_DWORD *)(a1 + 8) | 1;
LABEL_53:
                    *(_DWORD *)(a1 + 8) = v24;
                    break;
                  }
                  if (!strcmp(v23, "disable"))
                  {
                    v24 = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE;
                    goto LABEL_53;
                  }
                  if (!strcmp(v23, "checkpoint") || !strcmp(v23, "rotate"))
                    sub_100002460(a1, 0, 1);
                  break;
                default:
                  break;
              }
            }
          }
        }
        v5 = *(_QWORD *)(v5 + 40);
      }
      while (v5);
    }
    return 0;
  }
  return result;
}

void sub_1000015FC(time_t a1)
{
  time_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  time_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = time(0);
  v9 = qword_10001E418;
  if (qword_10001E418)
  {
    v10 = v2;
    while (1)
    {
      v11 = *(_QWORD *)(v9 + 16);
      if (v11)
        break;
LABEL_30:
      v9 = *(_QWORD *)(v9 + 24);
      if (!v9)
        return;
    }
    while (1)
    {
      if (!a1)
      {
        v16 = *(_QWORD *)(v11 + 24);
        if (v16)
        {
          if ((*(_BYTE *)(v16 + 73) & 4) != 0)
          {
            sub_100003614(v11, 3, v3, v4, v5, v6, v7, v8);
            if (*(_DWORD *)(v11 + 8) != 13)
              sub_100003A40(v11, 1);
          }
        }
        goto LABEL_29;
      }
      v12 = *(_DWORD *)(v11 + 8);
      switch(v12)
      {
        case 12:
          v19 = *(_QWORD *)(v11 + 24);
          if (!v19)
            goto LABEL_29;
          v20 = *(_QWORD *)(v19 + 192);
          if (!v20 || !*(_QWORD *)(v20 + 8) || *(_DWORD *)(v20 + 28))
            goto LABEL_29;
          v15 = *(_QWORD *)(v20 + 16);
          break;
        case 14:
          v17 = *(_QWORD *)(v11 + 24);
          if (!v17)
            goto LABEL_29;
          v18 = *(_QWORD *)(v17 + 192);
          if (!v18 || (*(_DWORD *)v18 & 0x80000000) != 0 || *(_DWORD *)(v18 + 24))
            goto LABEL_29;
          v15 = *(_QWORD *)(v18 + 8);
          break;
        case 13:
          v13 = *(_QWORD *)(v11 + 24);
          if (!v13)
            goto LABEL_29;
          v14 = *(_QWORD *)(v13 + 192);
          if (!v14 || !*(_QWORD *)(v14 + 8) || *(_DWORD *)(v14 + 36))
            goto LABEL_29;
          v15 = *(_QWORD *)(v14 + 24);
          break;
        default:
          goto LABEL_29;
      }
      if (v10 - v15 >= a1)
        sub_100003614(v11, 3, v3, v4, v5, v6, v7, v8);
LABEL_29:
      v11 = *(_QWORD *)(v11 + 40);
      if (!v11)
        goto LABEL_30;
    }
  }
}

uint64_t sub_100001738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  uint64_t i;
  uint64_t v11;
  const char *v12;
  FILE *v13;
  FILE *v14;
  uint64_t j;
  const char *v16;
  const char *v17;

  if (qword_10001C058 != -1)
    dispatch_once(&qword_10001C058, &stru_100018800);
  if (qword_10001E418 || (qword_10001E418 = (uint64_t)asl_out_module_init()) != 0)
  {
    sub_1000061A0("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"asl_action");
    dword_10001C04C = 0;
    v8 = qword_10001E418;
    if (qword_10001E418)
    {
      v9 = 0;
      do
      {
        for (i = *(_QWORD *)(v8 + 16); i; i = *(_QWORD *)(i + 40))
        {
          sub_100001ED8((const char **)v8, i);
          v11 = *(_QWORD *)(i + 24);
          if (v11)
            v9 |= *(_DWORD *)(v11 + 72) & 0x404;
        }
        v8 = *(_QWORD *)(v8 + 24);
      }
      while (v8);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    if (DWORD2(xmmword_10001E428))
    {
      v12 = qword_10001E438 ? (const char *)qword_10001E438 : "/var/log/syslogd.log";
      v13 = fopen(v12, "a");
      if (v13)
      {
        v14 = v13;
        for (j = qword_10001E418; j; j = *(_QWORD *)(j + 24))
        {
          v16 = *(const char **)j;
          if (!*(_QWORD *)j)
            v16 = "<unknown>";
          if ((*(_DWORD *)(j + 8) & 2) != 0)
            v17 = " (local)";
          else
            v17 = (const char *)&unk_100015297;
          fprintf(v14, "module: %s%s\n", v16, v17);
          asl_out_module_print(v14, j);
          fputc(10, v14);
        }
        fclose(v14);
      }
    }
    qword_10001C050 = time(0);
    if ((v9 & 4) != 0)
    {
      sub_1000022D0(0);
      if (!qword_10001C070)
        sub_1000044B4();
    }
  }
  return 0;
}

void sub_1000018FC(id a1)
{
  qword_10001C040 = (uint64_t)dispatch_queue_create("ASL Action Queue", 0);
  qword_10001C060 = (uint64_t)dispatch_queue_create("iOS CrashLog Queue", 0);
  notify_register_dispatch("com.apple.crash_mover", &dword_10001C000, (dispatch_queue_t)qword_10001C040, &stru_100018840);
}

void sub_100001960(id a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t state64;

  state64 = 0;
  v2 = qword_10001C068;
  if (!notify_get_state(dword_10001C000, &state64) && state64 != (v2 != 0))
  {
    qword_10001C068 = 0;
    if (state64 == 1 && (qword_10001C068 = time(0)) != 0)
    {
      sub_1000061A0("CrashMover active: suspending crashlog queue and closing files\n", v3, v4, v5, v6, v7, v8, v9, v10);
      dispatch_suspend((dispatch_object_t)qword_10001C060);
      sub_1000015FC(0);
    }
    else
    {
      sub_1000061A0("CrashMover finished\n", v3, v4, v5, v6, v7, v8, v9, v10);
      dispatch_resume((dispatch_object_t)qword_10001C060);
    }
  }
}

uint64_t sub_100001A0C()
{
  dispatch_async((dispatch_queue_t)qword_10001C040, &stru_100018880);
  return 0;
}

time_t sub_100001A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  time_t result;

  if (qword_10001C068)
  {
    dispatch_resume((dispatch_object_t)qword_10001C060);
    qword_10001C068 = 0;
  }
  dispatch_sync((dispatch_queue_t)qword_10001C060, &stru_100018B38);
  v6 = qword_10001E418;
  if (qword_10001E418)
  {
    v7 = qword_10001E418;
    do
    {
      for (i = *(_QWORD *)(v7 + 16); i; i = *(_QWORD *)(i + 40))
      {
        switch(*(_DWORD *)(i + 8))
        {
          case 0xC:
          case 0xD:
            sub_100003614(i, 4, v0, v1, v2, v3, v4, v5);
            v9 = *(_QWORD *)(i + 24);
            if (v9)
            {
              v10 = *(void **)(v9 + 192);
              if (!v10)
                goto LABEL_17;
              free(v10);
              goto LABEL_16;
            }
            break;
          case 0xE:
            sub_100003614(i, 4, v0, v1, v2, v3, v4, v5);
            v11 = *(_QWORD *)(i + 24);
            if (v11)
            {
              v12 = *(_QWORD *)(v11 + 192);
              if (v12)
              {
                if (*(_DWORD *)(v12 + 16))
                  sub_100004130(i);
                sub_100003D8C(v12);
LABEL_16:
                v9 = *(_QWORD *)(i + 24);
LABEL_17:
                *(_QWORD *)(v9 + 192) = 0;
              }
            }
            break;
          case 0x11:
          case 0x12:
          case 0x13:
            sub_1000042B4(*(int **)(i + 32));
            break;
          default:
            continue;
        }
      }
      v7 = *(_QWORD *)(v7 + 24);
    }
    while (v7);
  }
  asl_out_module_free(v6);
  qword_10001E418 = 0;
  result = time(0);
  qword_10001C050 = result;
  return result;
}

uint64_t sub_100001B68()
{
  dispatch_async((dispatch_queue_t)qword_10001C040, &stru_1000188C0);
  return 0;
}

void sub_100001B90(id a1)
{
  time_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_100001A38();
  sub_100001738(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_100001BA4(char *__s2)
{
  uint64_t v1;

  v1 = qword_10001E418;
  if (qword_10001E418 && __s2)
  {
    do
    {
      if (*(_QWORD *)v1 && !strcmp(*(const char **)v1, __s2))
        break;
      v1 = *(_QWORD *)(v1 + 24);
    }
    while (v1);
  }
  return v1;
}

uint64_t sub_100001BF4(char *a1)
{
  uint64_t v1;
  char *v2;
  int v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  unsigned int v14;
  const char *v15;
  char *v17;
  char *v18;
  _QWORD v19[5];
  unsigned int v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2000000000;
  v25 = 0;
  if (a1)
  {
    v1 = *a1;
    if (*a1)
    {
      if ((_DWORD)v1 == 64)
        v2 = a1 + 1;
      else
        v2 = a1;
      while (1)
      {
        v3 = *v2;
        if (v3 != 32 && v3 != 9)
          break;
        ++v2;
      }
      v5 = explode(v2, " \t");
      v13 = (void **)v5;
      v23[3] = (uint64_t)v5;
      if (!v5)
        goto LABEL_16;
      v14 = -1;
      do
        ++v14;
      while (*(_QWORD *)&v5[8 * v14]);
      if (v14 < 2)
      {
LABEL_16:
        v1 = 0xFFFFFFFFLL;
LABEL_25:
        free_string_list(v13);
        goto LABEL_26;
      }
      if (qword_10001E418)
      {
        if (strcasecmp(*((const char **)v5 + 1), "define") || !strcmp((const char *)*v13, "*"))
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 0x40000000;
          v19[2] = sub_100002314;
          v19[3] = &unk_100018910;
          v19[4] = &v22;
          v20 = v14;
          dispatch_sync((dispatch_queue_t)qword_10001C040, v19);
LABEL_21:
          v1 = 0;
LABEL_24:
          v13 = (void **)v23[3];
          goto LABEL_25;
        }
        v17 = strdup(v2);
        if (v17)
        {
          v18 = v17;
          block[0] = _NSConcreteStackBlock;
          block[1] = 0x40000000;
          block[2] = sub_100001DCC;
          block[3] = &unk_1000188E8;
          block[4] = &v22;
          block[5] = v17;
          dispatch_sync((dispatch_queue_t)qword_10001C040, block);
          free(v18);
          goto LABEL_21;
        }
        v15 = "asl_action_control_set_param: memory allocation failed\n";
      }
      else
      {
        v15 = "asl_action_control_set_param: no modules loaded\n";
      }
      sub_1000061A0(v15, v6, v7, v8, v9, v10, v11, v12, v19[0]);
      v1 = 0xFFFFFFFFLL;
      goto LABEL_24;
    }
  }
  else
  {
    v1 = 0xFFFFFFFFLL;
  }
LABEL_26:
  _Block_object_dispose(&v22, 8);
  return v1;
}

void sub_100001DCC(uint64_t a1)
{
  char *i;
  int v2;
  char v4;
  char v5;
  char *v6;
  const char **v7;
  const char **v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  for (i = *(char **)(a1 + 40); ; ++i)
  {
    v2 = *i;
    if (v2 == 32 || v2 == 9)
      break;
  }
  while (v2 == 9 || v2 == 32)
  {
    v4 = *++i;
    LOBYTE(v2) = v4;
  }
  while (v2 != 9 && v2 != 32)
  {
    v5 = *++i;
    LOBYTE(v2) = v5;
  }
  v6 = **(char ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v7 = (const char **)sub_100001BA4(v6);
  if (!v7)
  {
    v8 = (const char **)asl_out_module_new(v6);
    v7 = v8;
    v9 = qword_10001E418;
    do
    {
      v10 = v9;
      v9 = *(_QWORD *)(v9 + 24);
    }
    while (v9);
    *(_QWORD *)(v10 + 24) = v8;
  }
  v11 = asl_out_module_parse_line((uint64_t)v7, i);
  if (v11)
  {
    v12 = v11;
    sub_100001ED8(v7, (uint64_t)v11);
    v13 = v12[3];
    if (v13)
    {
      if ((*(_BYTE *)(v13 + 72) & 4) != 0)
      {
        sub_1000022D0(0);
        if (!qword_10001C070)
          sub_1000044B4();
      }
    }
  }
}

void sub_100001ED8(const char **a1, uint64_t a2)
{
  const char **v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  const char *v15;
  size_t v16;
  unsigned int v17;
  _DWORD *v18;
  const char *v19;
  _DWORD *v20;
  int v21;
  char *v22;
  char *notification_key;
  NSObject *v24;
  Block_layout *v25;
  char *v26;
  int out_token;
  char *name;

  if (a1)
  {
    v4 = (const char **)qword_10001E418;
    if ((const char **)qword_10001E418 != a1)
    {
      v5 = *(_QWORD *)(a2 + 24);
      if (v5)
      {
        if (*(_QWORD *)(v5 + 8) && qword_10001E418 != 0)
        {
          while (1)
          {
            v7 = v4[2];
            if (v7)
              break;
LABEL_14:
            v4 = (const char **)v4[3];
            if (v4)
              v11 = v4 == a1;
            else
              v11 = 1;
            if (v11)
              goto LABEL_23;
          }
          while (1)
          {
            if (*((_DWORD *)v7 + 2) == 2)
            {
              v8 = *((_QWORD *)v7 + 3);
              if (v8)
              {
                v9 = *(const char **)(v8 + 8);
                if (v9)
                {
                  v10 = *(_QWORD *)(a2 + 24);
                  if (!strcmp(*(const char **)(v10 + 8), v9))
                    break;
                }
              }
            }
            v7 = (const char *)*((_QWORD *)v7 + 5);
            if (!v7)
              goto LABEL_14;
          }
          asl_out_dst_data_release(v10);
          *(_QWORD *)(a2 + 24) = 0;
          if (*(_DWORD *)(a2 + 8) == 2)
          {
            name = 0;
            asprintf(&name, "[Sender syslogd] [Level 5] [PID %u] [Message Configuration Notice:\nASL Module \"%s\" sharing output destination \"%s\" with ASL Module \"%s\".\nOutput parameters from ASL Module \"%s\" override any specified in ASL Module \"%s\".] [UID 0] [GID 0] [Facility syslog]", dword_10001E37C, *a1, *(const char **)(*((_QWORD *)v7 + 3) + 8), *v4, *v4, *a1);
            sub_100006E30(name);
            free(name);
          }
          else
          {
            *(_QWORD *)(a2 + 24) = asl_out_dst_data_retain(*((_QWORD *)v7 + 3));
          }
        }
      }
    }
LABEL_23:
    switch(*(_DWORD *)(a2 + 8))
    {
      case 1:
        if (!*(_QWORD *)a2)
          sub_10000262C((uint64_t)a1, *(char **)(a2 + 16), 1);
        break;
      case 5:
        if ((const char **)qword_10001E418 != a1)
        {
          v12 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
          if (v12)
          {
            v13 = v12;
            name = 0;
            asprintf(&name, "[Sender syslogd] [Level 5] [PID %u] [Message Configuration Notice:\nASL Module \"%s\" claims selected messages.\nThose messages may not appear in standard system log files or in the ASL database.] [UID 0] [GID 0] [Facility syslog]", dword_10001E37C, *a1);
            sub_100006E30(name);
            free(name);
            *(_QWORD *)v13 = asl_msg_copy(*(_QWORD *)a2);
            v13[2] = 4;
            v14 = qword_10001E418;
            *((_QWORD *)v13 + 5) = *(_QWORD *)(qword_10001E418 + 16);
            *(_QWORD *)(v14 + 16) = v13;
          }
          v15 = *(const char **)(a2 + 16);
          if (!v15 || strcmp(v15, "only"))
            *(_DWORD *)(a2 + 8) = 0;
        }
        break;
      case 0xB:
        ++dword_10001C04C;
        break;
      case 0xC:
        if (!*(_QWORD *)(*(_QWORD *)(a2 + 24) + 192))
        {
          v16 = 40;
          v17 = 1098898501;
          goto LABEL_37;
        }
        break;
      case 0xD:
        if (!*(_QWORD *)(*(_QWORD *)(a2 + 24) + 192))
        {
          v16 = 72;
          v17 = -1672229542;
LABEL_37:
          *(_QWORD *)(*(_QWORD *)(a2 + 24) + 192) = malloc_type_calloc(1uLL, v16, v17 | 0x102004000000000);
        }
        break;
      case 0xE:
        v18 = *(_DWORD **)(*(_QWORD *)(a2 + 24) + 192);
        if (v18
          || (v18 = malloc_type_calloc(1uLL, 0x38uLL, 0x10300401EE6F584uLL),
              (*(_QWORD *)(*(_QWORD *)(a2 + 24) + 192) = v18) != 0))
        {
          *v18 = -1;
        }
        break;
      case 0x11:
        name = 0;
        v19 = sub_100004420((uint64_t)a1, a2);
        if (v19)
        {
          asprintf(&name, "%s%s", "com.apple.system.notify.service.path:0x87:", v19);
          if (name)
          {
            out_token = 0;
            notify_register_dispatch(name, &out_token, (dispatch_queue_t)qword_10001C040, &stru_100018BF8);
            free(name);
            v20 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
            v21 = out_token;
            if (v20)
              goto LABEL_50;
            goto LABEL_44;
          }
        }
        break;
      case 0x12:
        v22 = sub_1000042E0((uint64_t)a1, (_QWORD *)a2);
        notification_key = (char *)configuration_profile_create_notification_key();
        free(v22);
        if (notification_key)
        {
          LODWORD(name) = 0;
          v24 = qword_10001C040;
          v25 = &stru_100018B78;
          goto LABEL_49;
        }
        break;
      case 0x13:
        v26 = sub_1000042E0((uint64_t)a1, (_QWORD *)a2);
        notification_key = (char *)configuration_profile_create_notification_key();
        free(v26);
        if (notification_key)
        {
          LODWORD(name) = 0;
          v24 = qword_10001C040;
          v25 = &stru_100018BB8;
LABEL_49:
          notify_register_dispatch(notification_key, (int *)&name, v24, v25);
          free(notification_key);
          v20 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
          v21 = (int)name;
          if (v20)
          {
LABEL_50:
            *v20 = v21;
            *(_QWORD *)(a2 + 32) = v20;
          }
          else
          {
LABEL_44:
            notify_cancel(v21);
          }
        }
        break;
      default:
        return;
    }
  }
}

uint64_t sub_1000022D0(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = qword_10001E418;
  if (qword_10001E418)
  {
    v2 = a1;
    do
    {
      a1 = sub_100002460(v1, 0, v2);
      v1 = *(_QWORD *)(v1 + 24);
    }
    while (v1);
  }
  return asl_trigger_aslmanager(a1);
}

uint64_t sub_100002314(uint64_t a1)
{
  char *v2;
  uint64_t result;
  int v4;
  uint64_t i;
  uint64_t v6;
  const char *v7;
  char *v8;
  uint64_t v9;
  unsigned int v10;

  v2 = **(char ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = strcmp(v2, "*");
  v4 = result;
  if ((_DWORD)result)
  {
    result = sub_100001BA4(v2);
    i = result;
    if (result)
      goto LABEL_5;
  }
  else
  {
    for (i = qword_10001E418; i; i = *(_QWORD *)(i + 24))
    {
LABEL_5:
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v7 = *(const char **)(v6 + 8);
      result = strcasecmp(v7, "enable");
      if ((_DWORD)result)
      {
        result = strcasecmp(v7, "checkpoint");
        if (!(_DWORD)result)
        {
          if (*(_DWORD *)(a1 + 40) < 3u)
          {
            v9 = i;
            v8 = 0;
          }
          else
          {
            v8 = *(char **)(v6 + 16);
            v9 = i;
          }
          result = sub_100002460(v9, v8, 1);
        }
        if (v4)
          return result;
      }
      else if (v4 || (result = strcmp(*(const char **)i, "com.apple.asl"), (_DWORD)result))
      {
        if (*(_DWORD *)(a1 + 40) < 3u || (result = atoi(*(const char **)(v6 + 16)), (_DWORD)result))
          v10 = *(_DWORD *)(i + 8) | 1;
        else
          v10 = *(_DWORD *)(i + 8) & 0xFFFFFFFE;
        *(_DWORD *)(i + 8) = v10;
        if (v4)
          return result;
      }
    }
  }
  return result;
}

uint64_t sub_100002460(uint64_t a1, char *__s2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 0;
  v6 = 0;
  do
  {
    if ((*(_DWORD *)(v3 + 8) | 2) == 0xE)
    {
      v7 = *(_QWORD *)(v3 + 24);
      if ((*(_BYTE *)(v7 + 72) & 4) != 0
        && (!__s2
         || (v8 = *(char **)(v7 + 8)) != 0
         && (!strcmp(*(const char **)(v7 + 8), __s2) || (v9 = strrchr(v8, 47)) != 0 && !strcmp(v9 + 1, __s2)))
        && (int)sub_100003A40(v3, a3) >= 1)
      {
        sub_100003614(v3, 0);
        v6 = 1;
      }
    }
    v3 = *(_QWORD *)(v3 + 40);
  }
  while (v3);
  return v6;
}

void sub_10000252C(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD block[6];
  char v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000258C;
  block[3] = &unk_100018930;
  v4 = a3;
  block[4] = a1;
  block[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_10001C040, block);
}

uint64_t sub_10000258C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  const char *v4;

  v1 = qword_10001E418;
  if (qword_10001E418)
  {
    v2 = result;
    do
    {
      if (*(_BYTE *)(v2 + 48)
        || (result = asl_msg_lookup(*(_QWORD *)(v2 + 32), *(_QWORD *)v1, 0, 0), !(_DWORD)result))
      {
        if ((*(_DWORD *)(v1 + 8) & 1) != 0)
          v3 = "enabled";
        else
          v3 = "disabled";
        if (*(_QWORD *)v1)
          v4 = *(const char **)v1;
        else
          v4 = "asl.conf";
        result = asl_msg_set_key_val(*(_QWORD *)(v2 + 40), v4, v3);
      }
      v1 = *(_QWORD *)(v1 + 24);
    }
    while (v1);
  }
  return result;
}

void sub_10000262C(uint64_t a1, char *a2, int a3)
{
  const char **v6;
  const char **v7;
  unsigned int v8;
  const char *v9;
  int v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v6 = (const char **)explode(a2, " \t");
  if (v6)
  {
    v7 = v6;
    v8 = -1;
    do
      ++v8;
    while (v6[v8]);
    if (v8)
    {
      v9 = *v6;
      if (!strcasecmp(*v6, "enable"))
      {
        if (v8 >= 2)
          v10 = atoi(v7[1]);
        else
          v10 = 1;
        v12 = v10 == 0;
        if (a3)
          v12 = v10 != 0;
      }
      else
      {
        if (strcasecmp(v9, "disable"))
        {
          free_string_list((void **)v7);
          if (!strcmp(*(const char **)a1, "com.apple.asl"))
            sub_1000059C4(a2, a3);
          return;
        }
        if (v8 >= 2)
          v11 = atoi(v7[1]);
        else
          v11 = 1;
        v13 = v11 == 0;
        if (a3)
          v13 = v11;
        v12 = !v13;
      }
      *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE | v12;
    }
    free_string_list((void **)v7);
  }
}

void sub_100002778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (qword_10001C068)
  {
    if (time(0) - qword_10001C068 >= 61)
    {
      sub_1000061A0("CrashMover timeout: resuming crashlog queue\n", v0, v1, v2, v3, v4, v5, v6, v7);
      dispatch_resume((dispatch_object_t)qword_10001C060);
      qword_10001C068 = 0;
    }
  }
}

void sub_1000027D0(uint64_t a1)
{
  _QWORD block[4];
  __int128 v2;
  uint64_t v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100002838;
  block[3] = &unk_100018950;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  dispatch_async((dispatch_queue_t)qword_10001C040, block);
}

uint64_t sub_100002838(uint64_t a1)
{
  sub_100002864(*(const char ***)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return asl_msg_release(*(_QWORD *)(a1 + 48));
}

void sub_100002864(const char **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
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
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t set_position;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t __ptr;

  if (*(_DWORD *)(a2 + 8) != 13)
  {
    v19 = *(_QWORD *)(a2 + 24);
    if (!v19)
      return;
    v20 = *(_QWORD *)(v19 + 192);
    if (!v20)
      return;
    v21 = *(_DWORD *)(v20 + 28);
    if (v21)
      *(_DWORD *)(v20 + 28) = v21 - 1;
    __ptr = 0;
    if (*(_QWORD *)(v20 + 8))
    {
      ++*(_QWORD *)v20;
      goto LABEL_19;
    }
    if (sub_100002D34(a2, 0))
    {
      v23 = 8;
      goto LABEL_35;
    }
    set_position = asl_file_read_set_position(*(_QWORD *)(v20 + 8), 3);
    if ((_DWORD)set_position)
    {
      v23 = set_position;
      asl_core_error(set_position);
      sub_1000061A0("_act_store_file_setup: asl_file_read_set_position failed %d %s\n", v30, v31, v32, v33, v34, v35, v36, v23);
    }
    else
    {
      v47 = *(_QWORD *)(v20 + 8);
      *(_QWORD *)v20 = *(_QWORD *)(v47 + 80) + 1;
      if (!fseek(*(FILE **)(v47 + 104), 0, 2))
      {
LABEL_19:
        *(_QWORD *)(v20 + 16) = time(0);
        *(_DWORD *)(*(_QWORD *)(a2 + 24) + 76) = 0;
        v22 = *(_QWORD *)(v20 + 8);
        __ptr = *(_QWORD *)v20;
        v23 = asl_file_save(v22, a3, &__ptr);
        if (!(_DWORD)v23)
        {
          *(_QWORD *)(*(_QWORD *)(a2 + 24) + 184) = *(_QWORD *)(*(_QWORD *)(v20 + 8) + 96);
          v24 = sub_100003A40(a2, 0);
          if ((_DWORD)v24 == 1)
            asl_trigger_aslmanager(v24);
          return;
        }
LABEL_35:
        v25 = "_act_store_file";
        v26 = a1;
        v27 = a2;
        v28 = v23;
        goto LABEL_36;
      }
      v48 = *__error();
      v49 = __error();
      strerror(*v49);
      sub_1000061A0("_act_store_file_setup: fseek failed %d %s\n", v50, v51, v52, v53, v54, v55, v56, v48);
      v23 = 8;
    }
    sub_100003614(a2, 2);
    goto LABEL_35;
  }
  v6 = *(_QWORD *)(a2 + 24);
  if (v6)
  {
    v7 = *(_QWORD *)(v6 + 192);
    if (v7)
    {
      v8 = *(_DWORD *)(v7 + 36);
      if (v8)
        *(_DWORD *)(v7 + 36) = v8 - 1;
      if (asl_msg_get_val_for_key(a3, "Time"))
      {
        v85 = 0;
        v9 = *(_QWORD *)(a2 + 24);
        if (v9 && (v10 = *(_QWORD *)(v9 + 192)) != 0 && *(_QWORD *)(v9 + 8))
        {
          if (sub_100002D34(a2, *(_QWORD *)(v10 + 16)))
          {
            sub_1000061A0("_act_store_dir_setup: _act_dst_open %s failed\n", v11, v12, v13, v14, v15, v16, v17, *(_QWORD *)(*(_QWORD *)(a2 + 24) + 8));
          }
          else
          {
            __ptr = 0;
            rewind(*(FILE **)v10);
            if (fread(&__ptr, 8uLL, 1uLL, *(FILE **)v10) != 1)
            {
              v57 = *__error();
              v58 = __error();
              strerror(*v58);
              sub_1000061A0("_act_store_dir_setup: storedata read failed %d %s\n", v59, v60, v61, v62, v63, v64, v65, v57);
              sub_100003614(a2, 2);
              v18 = 7;
              goto LABEL_23;
            }
            v37 = asl_core_ntohq(__ptr) + 1;
            *(_QWORD *)(v10 + 16) = v37;
            __ptr = asl_core_htonq(v37);
            rewind(*(FILE **)v10);
            if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)v10) == 1)
            {
              fflush(*(FILE **)v10);
              if (fseek(*(FILE **)(*(_QWORD *)(v10 + 8) + 104), 0, 2))
              {
                v38 = *__error();
                v39 = __error();
                strerror(*v39);
                sub_1000061A0("_act_store_dir_setup: aslfile fseek failed %d %s\n", v40, v41, v42, v43, v44, v45, v46, v38);
                sub_100003614(a2, 2);
                v18 = 9999;
              }
              else
              {
                *(_QWORD *)(v7 + 24) = time(0);
                *(_DWORD *)(*(_QWORD *)(a2 + 24) + 76) = 0;
                v75 = *(_QWORD *)(v7 + 8);
                v85 = *(_QWORD *)(v7 + 16);
                v76 = asl_file_save(v75, a3, &v85);
                if (!(_DWORD)v76)
                {
                  *(_QWORD *)(*(_QWORD *)(a2 + 24) + 184) = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 96);
                  return;
                }
                v18 = v76;
                v77 = asl_core_error(v76);
                sub_1000061A0("_act_store_dir asl_file_save FAILED %s\n", v78, v79, v80, v81, v82, v83, v84, v77);
              }
              goto LABEL_23;
            }
            v66 = *__error();
            v67 = __error();
            strerror(*v67);
            sub_1000061A0("_act_store_dir_setup: storedata write failed %d %s\n", v68, v69, v70, v71, v72, v73, v74, v66);
            sub_100003614(a2, 2);
          }
          v18 = 8;
        }
        else
        {
          v18 = 2;
        }
LABEL_23:
        v25 = "_act_store_dir";
        v26 = a1;
        v27 = a2;
        v28 = v18;
LABEL_36:
        sub_100002C14((char)v25, v26, v27, v28);
      }
    }
  }
}

void sub_100002C14(char a1, const char **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  const char *v19;
  int v20;
  const char *v21;
  int v22;
  void *v23;
  char *v24;

  v4 = *(_QWORD *)(a3 + 24);
  if ((*(_BYTE *)(v4 + 73) & 8) == 0)
  {
    ++*(_DWORD *)(v4 + 76);
    asl_core_error(a4);
    sub_1000061A0("%s: %s save to %s failed: %s\n", v9, v10, v11, v12, v13, v14, v15, a1);
    v16 = *(_QWORD *)(a3 + 24);
    v17 = *(_DWORD *)(v16 + 76);
    if (v17 >= 6)
    {
      v24 = 0;
      v18 = *a2;
      v19 = *(const char **)(v16 + 8);
      v20 = dword_10001E37C;
      v21 = (const char *)asl_core_error(a4);
      asprintf(&v24, "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message Disabling module %s writes to %s following %u failures (%s)]", v20, v18, v19, v17, v21);
      sub_100006E30(v24);
      free(v24);
      v22 = *(_DWORD *)(a3 + 8);
      switch(v22)
      {
        case 12:
          goto LABEL_6;
        case 14:
          sub_100003D8C(*(_QWORD *)(*(_QWORD *)(a3 + 24) + 192));
          break;
        case 13:
LABEL_6:
          v23 = *(void **)(*(_QWORD *)(a3 + 24) + 192);
          if (v23)
            free(v23);
          break;
      }
      *(_QWORD *)(*(_QWORD *)(a3 + 24) + 192) = 0;
      *(_DWORD *)(a3 + 8) = 0;
    }
  }
}

uint64_t sub_100002D34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v4;
  int v5;
  int v7;
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
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int open;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int *v50;
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
  mode_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  int v108;
  __darwin_time_t v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
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
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  FILE *v134;
  int *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  FILE *v143;
  int v144;
  FILE *v145;
  NSObject *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  NSObject *v154;
  int *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  int *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  int v179;
  int *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char v188;
  char v189;
  char v190;
  void **v191;
  uint64_t v192;
  void *v193;
  void *v194;
  uint64_t v195;
  int v196;
  time_t __ptr;
  stat v198;
  char __str[8];
  uint64_t v200;
  uint64_t (*v201)(uint64_t);
  void *v202;
  uint64_t v203;
  tm handler[18];

  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = *(unsigned int **)(v3 + 192);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = *(_DWORD *)(a1 + 8);
  if (v5 == 12)
  {
    if (*((_QWORD *)v4 + 1))
      return 0;
    v31 = asl_out_mkpath(qword_10001E418, a1);
    v32 = *(_QWORD *)(a1 + 24);
    if (v31)
    {
      sub_1000061A0("_asl_file_open: asl_out_mkpath %s failed\n", v24, v25, v26, v27, v28, v29, v30, *(_QWORD *)(v32 + 8));
      return 0xFFFFFFFFLL;
    }
    open = asl_out_dst_file_create_open(v32, 0);
    if (open < 0)
    {
      v79 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
      __error();
      v80 = __error();
      strerror(*v80);
      sub_1000061A0("_asl_file_open: _act_file_create_open %s failed %d %s\n", v81, v82, v83, v84, v85, v86, v87, v79);
      return 0xFFFFFFFFLL;
    }
    close(open);
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
    if (v40)
    {
      if (asl_file_open_write(v40, 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v4 + 2))
      {
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
        __error();
        v42 = __error();
        strerror(*v42);
        sub_1000061A0("_asl_file_open: asl_file_open_write %s failed %d %s\n", v43, v44, v45, v46, v47, v48, v49, v41);
        return 0xFFFFFFFFLL;
      }
      v97 = fileno(*(FILE **)(*((_QWORD *)v4 + 1) + 104));
      v98 = *((_QWORD *)v4 + 1);
      v99 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v97, 1uLL, (dispatch_queue_t)qword_10001C040);
      *((_QWORD *)v4 + 4) = v99;
      if (v99)
      {
        *(_QWORD *)&v198.st_dev = _NSConcreteStackBlock;
        v198.st_ino = 0x40000000;
        *(_QWORD *)&v198.st_uid = sub_100003CC8;
        *(_QWORD *)&v198.st_rdev = &unk_100018A10;
        v198.st_atimespec.tv_sec = a1;
        dispatch_source_set_event_handler(v99, &v198);
        v107 = *((_QWORD *)v4 + 4);
        *(_QWORD *)&handler[0].tm_sec = _NSConcreteStackBlock;
        *(_QWORD *)&handler[0].tm_hour = 0x40000000;
        *(_QWORD *)&handler[0].tm_mon = sub_100003CD4;
        *(_QWORD *)&handler[0].tm_wday = &unk_100018A30;
        LODWORD(handler[0].tm_gmtoff) = v97;
        *(_QWORD *)&handler[0].tm_isdst = v98;
        dispatch_source_set_cancel_handler(v107, handler);
        dispatch_resume(*((dispatch_object_t *)v4 + 4));
      }
      sub_1000061A0("_asl_file_open ASL file %s fd %d\n", v100, v101, v102, v103, v104, v105, v106, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16));
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  if (v5 != 14)
  {
    if (v5 == 13)
    {
      v7 = sub_100003960(a1);
      v15 = *(_QWORD *)(a1 + 24);
      if (v7)
      {
        sub_1000061A0("_asl_dir_today_open: No directory at path %s\n", v8, v9, v10, v11, v12, v13, v14, *(_QWORD *)(v15 + 8));
LABEL_8:
        sub_1000061A0("_act_dst_open:_asl_dir_today_open %s FAILED!\n", v16, v17, v18, v19, v20, v21, v22, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8));
        return 0xFFFFFFFFLL;
      }
      v36 = *(_QWORD *)(v15 + 192);
      memset(handler, 0, 56);
      __ptr = time(0);
      if (!localtime_r(&__ptr, handler))
      {
        v50 = __error();
        v188 = strerror(*v50);
        sub_1000061A0("_asl_dir_today_open: localtime_r error %s\n", v51, v52, v53, v54, v55, v56, v57, v188);
        goto LABEL_8;
      }
      v37 = sub_100003A40(a1, 0);
      if ((_DWORD)v37 == 1)
        asl_trigger_aslmanager(v37);
      if (*(_QWORD *)(v36 + 8))
      {
        if (__PAIR64__(*(_DWORD *)(v36 + 40), *(_DWORD *)(v36 + 44)) == *(_QWORD *)&handler[0].tm_mon
          && *(_DWORD *)(v36 + 48) == handler[0].tm_mday)
        {
          goto LABEL_51;
        }
        sub_100003888(a1);
      }
      v38 = *(_QWORD *)(a1 + 24);
      if ((*(_BYTE *)(v38 + 73) & 1) != 0)
      {
        asl_make_timestamp(__ptr, *(_DWORD *)(v38 + 64), __str, 0x20uLL);
        asprintf((char **)(*(_QWORD *)(a1 + 24) + 16), "%s/%s.asl");
      }
      else
      {
        asprintf((char **)(v38 + 16), "%s/%d.%02d.%02d.asl");
      }
      v58 = *(_QWORD *)(a1 + 24);
      if (!*(_QWORD *)(v58 + 16))
      {
        v71 = __error();
        v189 = strerror(*v71);
        sub_1000061A0("_asl_dir_today_open: asprintf error %s\n", v72, v73, v74, v75, v76, v77, v78, v189);
        goto LABEL_8;
      }
      v59 = **(unsigned int **)(v58 + 120);
      v60 = **(unsigned int **)(v58 + 136);
      v61 = umask(0);
      v62 = asl_file_open_write(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16), *(_WORD *)(*(_QWORD *)(a1 + 24) + 116) & 0x1B6, v59, v60, v36 + 8);
      umask(v61);
      if ((_DWORD)v62)
      {
        v63 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
        asl_core_error(v62);
        sub_1000061A0("_asl_dir_today_open: asl_file_open_write %s error %s\n", v64, v65, v66, v67, v68, v69, v70, v63);
LABEL_44:
        free(*(void **)(*(_QWORD *)(a1 + 24) + 16));
        *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = 0;
        goto LABEL_8;
      }
      if (fseek(*(FILE **)(*(_QWORD *)(v36 + 8) + 104), 0, 2))
      {
        v88 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
        v89 = __error();
        strerror(*v89);
        sub_1000061A0("_asl_dir_today_open: fseek %s error %s\n", v90, v91, v92, v93, v94, v95, v96, v88);
        goto LABEL_44;
      }
      *(int32x2_t *)(v36 + 40) = vrev64_s32(*(int32x2_t *)&handler[0].tm_mon);
      *(_DWORD *)(v36 + 48) = handler[0].tm_mday;
      v108 = fileno(*(FILE **)(*(_QWORD *)(v36 + 8) + 104));
      v109 = *(_QWORD *)(v36 + 8);
      v110 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v108, 1uLL, (dispatch_queue_t)qword_10001C040);
      *(_QWORD *)(v36 + 64) = v110;
      if (v110)
      {
        v191 = _NSConcreteStackBlock;
        v192 = 0x40000000;
        v193 = sub_100003C38;
        v194 = &unk_100018990;
        v195 = a1;
        dispatch_source_set_event_handler(v110, &v191);
        v118 = *(NSObject **)(v36 + 64);
        *(_QWORD *)&v198.st_dev = _NSConcreteStackBlock;
        v198.st_ino = 0x40000000;
        *(_QWORD *)&v198.st_uid = sub_100003C44;
        *(_QWORD *)&v198.st_rdev = &unk_1000189B0;
        LODWORD(v198.st_atimespec.tv_nsec) = v108;
        v198.st_atimespec.tv_sec = v109;
        dispatch_source_set_cancel_handler(v118, &v198);
        dispatch_resume(*(dispatch_object_t *)(v36 + 64));
      }
      sub_1000061A0("_asl_dir_today_open ASL file %s fd %d\n", v111, v112, v113, v114, v115, v116, v117, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16));
LABEL_51:
      v119 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 192);
      if (!*(_QWORD *)v119)
      {
        if (sub_100003960(a1))
        {
          sub_1000061A0("_asl_dir_storedata_open: No directory at path %s\n", v120, v121, v122, v123, v124, v125, v126, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8));
LABEL_54:
          sub_1000061A0("_act_dst_open:_asl_dir_storedata_open %s FAILED!  Closing today file\n", v127, v128, v129, v130, v131, v132, v133, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8));
          sub_100003888(a1);
          return 0xFFFFFFFFLL;
        }
        snprintf((char *)handler, 0x400uLL, "%s/%s", *(const char **)(*(_QWORD *)(a1 + 24) + 8), "StoreData");
        memset(&v198, 0, sizeof(v198));
        if (stat((const char *)handler, &v198))
        {
          if (*__error() != 2)
          {
            v155 = __error();
            v190 = strerror(*v155);
            sub_1000061A0("_asl_dir_storedata_open: stat error %s\n", v156, v157, v158, v159, v160, v161, v162, v190);
            goto LABEL_54;
          }
          v134 = fopen((const char *)handler, "w+");
          *(_QWORD *)v119 = v134;
          if (!v134)
          {
            v171 = __error();
            strerror(*v171);
            sub_1000061A0("_asl_dir_storedata_open: fopen new %s: %s\n", v172, v173, v174, v175, v176, v177, v178, (char)handler);
            goto LABEL_54;
          }
          __ptr = asl_core_htonq(a2);
          if (fwrite(&__ptr, 8uLL, 1uLL, *(FILE **)v119) != 1)
          {
            v179 = *__error();
            v180 = __error();
            strerror(*v180);
            sub_1000061A0("_asl_dir_storedata_open: storedata write failed %d %s\n", v181, v182, v183, v184, v185, v186, v187, v179);
            goto LABEL_54;
          }
          if (chown((const char *)handler, **(_DWORD **)(*(_QWORD *)(a1 + 24) + 120), **(_DWORD **)(*(_QWORD *)(a1 + 24) + 136)))
          {
            v135 = __error();
            strerror(*v135);
            sub_1000061A0("_asl_dir_storedata_open: chown %d %d new %s: %s\n", v136, v137, v138, v139, v140, v141, v142, (char)handler);
            goto LABEL_54;
          }
          v143 = *(FILE **)v119;
        }
        else
        {
          v143 = fopen((const char *)handler, "r+");
          *(_QWORD *)v119 = v143;
          if (!v143)
          {
            v163 = __error();
            strerror(*v163);
            sub_1000061A0("_asl_dir_storedata_open: fopen existing %s: %s\n", v164, v165, v166, v167, v168, v169, v170, (char)handler);
            goto LABEL_54;
          }
        }
        v144 = fileno(v143);
        v145 = *(FILE **)v119;
        v146 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v144, 1uLL, (dispatch_queue_t)qword_10001C040);
        *(_QWORD *)(v119 + 56) = v146;
        if (v146)
        {
          *(_QWORD *)__str = _NSConcreteStackBlock;
          v200 = 0x40000000;
          v201 = sub_100003C80;
          v202 = &unk_1000189D0;
          v203 = a1;
          dispatch_source_set_event_handler(v146, __str);
          v154 = *(NSObject **)(v119 + 56);
          v191 = _NSConcreteStackBlock;
          v192 = 0x40000000;
          v193 = sub_100003C8C;
          v194 = &unk_1000189F0;
          v196 = v144;
          v195 = (uint64_t)v145;
          dispatch_source_set_cancel_handler(v154, &v191);
          dispatch_resume(*(dispatch_object_t *)(v119 + 56));
        }
        sub_1000061A0("_asl_dir_storedata_open ASL storedata %s fd %d\n", v147, v148, v149, v150, v151, v152, v153, (char)handler);
      }
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  if ((*v4 & 0x80000000) == 0)
    return 0;
  v33 = asl_out_dst_file_create_open(v3, 0);
  *v4 = v33;
  if ((v33 & 0x80000000) != 0)
  {
    if (asl_out_mkpath(qword_10001E418, a1))
      return 0xFFFFFFFFLL;
    v33 = asl_out_dst_file_create_open(*(_QWORD *)(a1 + 24), 0);
    *v4 = v33;
    if ((v33 & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
  }
  result = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v33, 1uLL, (dispatch_queue_t)qword_10001C040);
  *((_QWORD *)v4 + 6) = result;
  if (result)
  {
    v34 = *v4;
    *(_QWORD *)&handler[0].tm_sec = _NSConcreteStackBlock;
    *(_QWORD *)&handler[0].tm_hour = 0x40000000;
    *(_QWORD *)&handler[0].tm_mon = sub_100003D10;
    *(_QWORD *)&handler[0].tm_wday = &unk_100018A50;
    LODWORD(handler[0].tm_gmtoff) = v34;
    *(_QWORD *)&handler[0].tm_isdst = a1;
    dispatch_source_set_event_handler((dispatch_source_t)result, handler);
    v35 = *((_QWORD *)v4 + 6);
    *(_QWORD *)&v198.st_dev = _NSConcreteStackBlock;
    v198.st_ino = 0x40000000;
    *(_QWORD *)&v198.st_uid = sub_100003D50;
    *(_QWORD *)&v198.st_rdev = &unk_100018A70;
    LODWORD(v198.st_atimespec.tv_sec) = v34;
    dispatch_source_set_cancel_handler(v35, &v198);
    dispatch_resume(*((dispatch_object_t *)v4 + 6));
    return 0;
  }
  return result;
}

void sub_100003614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  int v11;
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
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  if (a1)
  {
    v9 = *(_QWORD *)(a1 + 24);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 192))
      {
        v10 = a2;
        v11 = *(_DWORD *)(a1 + 8);
        switch(v11)
        {
          case 12:
            sub_1000061A0("_act_dst_close: %s ASL FILE %s\n", a2, a3, a4, a5, a6, a7, a8, (char)off_100018A90[a2]);
            v20 = *(_QWORD *)(a1 + 24);
            if (v20)
            {
              v21 = *(_QWORD *)(v20 + 192);
              if (*(_QWORD *)(v21 + 8))
              {
                v22 = *(_DWORD *)(v21 + 28);
                if (v22)
                {
                  v51 = 0;
                  asprintf(&v51, "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message ASL File %s was closed with %d pending messages]", dword_10001E37C, *(const char **)(v20 + 16), v22);
                  sub_100006E30((uint64_t)v51);
                  free(v51);
                }
                v23 = *(NSObject **)(v21 + 32);
                if (v23)
                {
                  dispatch_source_cancel(v23);
                  dispatch_release(*(dispatch_object_t *)(v21 + 32));
                  *(_QWORD *)(v21 + 32) = 0;
                }
                else
                {
                  v43 = fileno(*(FILE **)(*(_QWORD *)(v21 + 8) + 104));
                  sub_1000061A0("close ASL fd %d\n", v44, v45, v46, v47, v48, v49, v50, v43);
                  asl_file_close(*(_QWORD *)(v21 + 8));
                }
                *(_QWORD *)(v21 + 8) = 0;
              }
            }
            break;
          case 14:
            sub_1000061A0("_act_dst_close: %s FILE %s\n", a2, a3, a4, a5, a6, a7, a8, (char)off_100018A90[a2]);
            v31 = *(_QWORD *)(a1 + 24);
            v32 = *(_QWORD *)(v31 + 192);
            if ((*(_DWORD *)v32 & 0x80000000) == 0)
            {
              v33 = *(_DWORD *)(v32 + 24);
              if (v33)
              {
                v51 = 0;
                asprintf(&v51, "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message File %s was closed with %d pending messages]", dword_10001E37C, *(const char **)(v31 + 16), v33);
                sub_100006E30((uint64_t)v51);
                free(v51);
              }
              v34 = *(NSObject **)(v32 + 48);
              if (v34)
              {
                dispatch_source_cancel(v34);
                dispatch_release(*(dispatch_object_t *)(v32 + 48));
                *(_QWORD *)(v32 + 48) = 0;
              }
              else
              {
                sub_1000061A0("close fd %d\n", v24, v25, v26, v27, v28, v29, v30, *(_DWORD *)v32);
                close(*(_DWORD *)v32);
              }
              *(_DWORD *)v32 = -1;
            }
            break;
          case 13:
            sub_1000061A0("_act_dst_close: %s ASL DIR %s\n", a2, a3, a4, a5, a6, a7, a8, (char)off_100018A90[a2]);
            if (v10)
            {
              v12 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 192);
              if (*(_QWORD *)v12)
              {
                if (*(_QWORD *)(v12 + 56))
                {
                  dispatch_source_cancel(*(dispatch_source_t *)(v12 + 56));
                  dispatch_release(*(dispatch_object_t *)(v12 + 56));
                }
                else
                {
                  v35 = fileno(*(FILE **)v12);
                  sub_1000061A0("close ASL storedata fd %d\n", v36, v37, v38, v39, v40, v41, v42, v35);
                  fclose(*(FILE **)v12);
                }
                sub_1000061A0("_asl_dir_storedata_close %p\n", v13, v14, v15, v16, v17, v18, v19, *(_QWORD *)v12);
                *(_QWORD *)v12 = 0;
              }
            }
            sub_100003888(a1);
            break;
        }
      }
    }
  }
}

void sub_100003888(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  NSObject *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;

  v1 = *(_QWORD *)(a1 + 24);
  v2 = *(_QWORD *)(v1 + 192);
  if (*(_QWORD *)(v2 + 8))
  {
    v4 = *(_DWORD *)(v2 + 36);
    if (v4)
    {
      v14 = 0;
      asprintf(&v14, "[Sender syslogd] [Level 4] [PID %u] [Facility syslog] [Message ASL Store %s was closed with %d pending messages]", dword_10001E37C, *(const char **)(v1 + 16), v4);
      sub_100006E30((uint64_t)v14);
      free(v14);
    }
    v5 = *(NSObject **)(v2 + 64);
    if (v5)
    {
      dispatch_source_cancel(v5);
      dispatch_release(*(dispatch_object_t *)(v2 + 64));
      *(_QWORD *)(v2 + 64) = 0;
    }
    else
    {
      v6 = fileno(*(FILE **)(*(_QWORD *)(v2 + 8) + 104));
      sub_1000061A0("close ASL fd %d\n", v7, v8, v9, v10, v11, v12, v13, v6);
      asl_file_close(*(_QWORD *)(v2 + 8));
    }
    *(_QWORD *)(v2 + 40) = 0;
    *(_DWORD *)(v2 + 48) = 0;
    free(*(void **)(*(_QWORD *)(a1 + 24) + 16));
    *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = 0;
    *(_QWORD *)(v2 + 8) = 0;
  }
}

uint64_t sub_100003960(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  stat v26;

  memset(&v26, 0, sizeof(v26));
  if (stat(*(const char **)(*(_QWORD *)(a1 + 24) + 8), &v26))
  {
    if (*__error() == 2)
    {
      result = asl_out_mkpath(qword_10001E418, a1);
      if (!(_DWORD)result)
        return result;
      sub_1000061A0("_asl_dir_create: asl_out_mkpath failed: %s\n", v10, v11, v12, v13, v14, v15, v16, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8));
    }
    else
    {
      v17 = __error();
      v25 = strerror(*v17);
      sub_1000061A0("_asl_dir_create: stat error %s\n", v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    if ((v26.st_mode & 0xF000) == 0x4000)
      return 0;
    sub_1000061A0("_asl_dir_create: expected a directory at path %s\n", v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8));
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003A40(uint64_t a1, int a2)
{
  uint64_t result;
  const char *v5;
  int v6;
  unint64_t st_size;
  __darwin_time_t tv_sec;
  time_t v9;
  uint64_t v10;
  std::error_code *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::__fs::filesystem::path __s2[42];
  stat v21;
  char v22[1024];

  result = *(_QWORD *)(a1 + 24);
  if (!result)
    return result;
  v5 = *(const char **)(result + 16);
  if (v5)
  {
    if (!a2)
      goto LABEL_9;
  }
  else
  {
    if (!*(_QWORD *)(result + 8))
      return 0;
    v5 = v22;
    asl_dst_make_current_name(result, 0, v22, 0x400uLL);
    result = *(_QWORD *)(a1 + 24);
    if (!a2)
      goto LABEL_9;
  }
  if ((*(_BYTE *)(result + 73) & 0x80) == 0)
  {
    v6 = 0;
    goto LABEL_11;
  }
LABEL_9:
  if (!*(_QWORD *)(result + 152))
    return 0;
  v6 = 1;
LABEL_11:
  st_size = *(_QWORD *)(result + 184);
  if (st_size && *(_QWORD *)(result + 176))
  {
    if (!v6)
      goto LABEL_22;
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    if (stat(v5, &v21) < 0)
    {
      if (*__error() == 2)
        return 0;
      else
        return 0xFFFFFFFFLL;
    }
    result = *(_QWORD *)(a1 + 24);
    if (!*(_QWORD *)(result + 176))
    {
      tv_sec = v21.st_birthtimespec.tv_sec;
      *(_QWORD *)(result + 176) = v21.st_birthtimespec.tv_sec;
      if (!tv_sec)
        *(_QWORD *)(result + 176) = v21.st_mtimespec.tv_sec;
    }
    st_size = v21.st_size;
    *(_QWORD *)(result + 184) = v21.st_size;
    if (!v6)
      goto LABEL_22;
  }
  if (st_size < *(_QWORD *)(result + 152))
    return 0;
LABEL_22:
  if ((*(_BYTE *)(result + 73) & 1) != 0)
  {
    sub_100003614(a1, 0);
  }
  else
  {
    snprintf((char *)&v21, 0x400uLL, "%s", v5);
    v9 = time(0);
    v10 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(v10 + 176) = v9;
    asl_dst_make_current_name(v10, 256, (char *)__s2, 0x400uLL);
    sub_100003614(a1, 0);
    if (strcmp((const char *)&v21, (const char *)__s2))
    {
      rename((const std::__fs::filesystem::path *)&v21, __s2, v11);
      sub_1000061A0("CHECKPOINT RENAME %s %s\n", v12, v13, v14, v15, v16, v17, v18, (char)&v21);
    }
  }
  v19 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(v19 + 176) = 0;
  *(_QWORD *)(v19 + 184) = 0;
  return 1;
}

uint64_t sub_100003C38(uint64_t a1)
{
  return sub_100003614(*(_QWORD *)(a1 + 32), 1);
}

uint64_t sub_100003C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061A0("cancel/close ASL file fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));
  return asl_file_close(*(_QWORD *)(a1 + 32));
}

uint64_t sub_100003C80(uint64_t a1)
{
  return sub_100003614(*(_QWORD *)(a1 + 32), 1);
}

uint64_t sub_100003C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061A0("cancel/close ASL storedata fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));
  return fclose(*(FILE **)(a1 + 32));
}

uint64_t sub_100003CC8(uint64_t a1)
{
  return sub_100003614(*(_QWORD *)(a1 + 32), 1);
}

uint64_t sub_100003CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061A0("cancel/close ASL file fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));
  return asl_file_close(*(_QWORD *)(a1 + 32));
}

uint64_t sub_100003D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061A0("dispatch_source DISPATCH_VNODE_DELETE fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 40));
  return sub_100003614(*(_QWORD *)(a1 + 32), 1);
}

uint64_t sub_100003D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061A0("cancel/close file fd %d\n", a2, a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 32));
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100003D8C(uint64_t a1)
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 40);
    if (v2)
    {
      if (!*(_DWORD *)(a1 + 16))
      {
        dispatch_resume(v2);
        v2 = *(NSObject **)(a1 + 40);
      }
      dispatch_release(v2);
    }
    free(*(void **)(a1 + 32));
    free((void *)a1);
  }
}

void sub_100003DD8(uint64_t a1)
{
  _QWORD block[4];
  __int128 v2;
  uint64_t v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100003E40;
  block[3] = &unk_100018AB8;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  dispatch_async((dispatch_queue_t)qword_10001C040, block);
}

uint64_t sub_100003E40(uint64_t a1)
{
  sub_100003E6C(*(const char ***)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return asl_msg_release(*(_QWORD *)(a1 + 48));
}

void sub_100003E6C(const char **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v8;
  time_t v9;
  char *v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  dispatch_time_t v15;
  ssize_t v16;
  uint64_t v17;
  _QWORD handler[5];
  uint64_t v19;
  unsigned int v20;

  if (a2)
  {
    v4 = *(_QWORD *)(a2 + 24);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 192);
      if (v5)
      {
        v8 = *(_DWORD *)(v5 + 24);
        if (v8)
          *(_DWORD *)(v5 + 24) = v8 - 1;
        v20 = 0;
        if ((*(_BYTE *)(v4 + 73) & 0x40) == 0
          || (v19 = 0, !asl_msg_lookup(a3, "Message", &v19, 0)) && v19)
        {
          v9 = time(0);
          v10 = (char *)asl_format_message(a3, *(_QWORD *)(*(_QWORD *)(a2 + 24) + 24), *(_QWORD *)(*(_QWORD *)(a2 + 24) + 56), 1, &v20);
          if ((*(_BYTE *)(*(_QWORD *)(a2 + 24) + 72) & 8) == 0)
          {
LABEL_8:
            v11 = 0;
            goto LABEL_9;
          }
          if (!*(_QWORD *)(v5 + 40))
          {
            v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10001C040);
            *(_QWORD *)(v5 + 40) = v12;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 0x40000000;
            handler[2] = sub_100004128;
            handler[3] = &unk_100018AF8;
            handler[4] = a2;
            dispatch_source_set_event_handler(v12, handler);
          }
          v11 = 0;
          if ((_QWORD)xmmword_10001E460 && v10)
          {
            if (!*(_QWORD *)(v5 + 32))
              goto LABEL_8;
            v11 = asl_core_string_hash(v10 + 16, v20 - 16);
            if (*(_DWORD *)(v5 + 20) == v11
              && !strcmp(*(const char **)(v5 + 32), v10 + 16)
              && v9 - *(_QWORD *)(v5 + 8) < (unint64_t)xmmword_10001E460)
            {
              v13 = *(_DWORD *)(v5 + 16);
              if (!v13)
              {
                v14 = *(NSObject **)(v5 + 40);
                v15 = dispatch_time(0, 1000000000 * xmmword_10001E460);
                dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
                dispatch_resume(*(dispatch_object_t *)(v5 + 40));
                v13 = *(_DWORD *)(v5 + 16);
              }
              *(_DWORD *)(v5 + 16) = v13 + 1;
              goto LABEL_11;
            }
          }
LABEL_9:
          if (sub_100002D34(a2, 0))
          {
            sub_100002C14((char)"_act_file", a1, a2, 9999);
LABEL_11:
            free(v10);
            return;
          }
          *(_DWORD *)(*(_QWORD *)(a2 + 24) + 76) = 0;
          if (*(_DWORD *)(v5 + 16))
          {
            sub_100004130(a2);
            if (v10)
              goto LABEL_27;
          }
          else
          {
            free(*(void **)(v5 + 32));
            *(_QWORD *)(v5 + 32) = 0;
            if (v10)
            {
LABEL_27:
              *(_QWORD *)(v5 + 32) = strdup(v10 + 16);
              *(_DWORD *)(v5 + 16) = 0;
              *(_DWORD *)(v5 + 20) = v11;
              *(_QWORD *)(v5 + 8) = v9;
              if (v20 >= 2)
              {
                v16 = write(*(_DWORD *)v5, v10, v20 - 1);
                if (v16)
                  *(_QWORD *)(*(_QWORD *)(a2 + 24) + 184) += v16;
                v17 = sub_100003A40(a2, 0);
                if ((_DWORD)v17 == 1)
                  asl_trigger_aslmanager(v17);
              }
              goto LABEL_11;
            }
          }
          *(_DWORD *)(v5 + 16) = 0;
          *(_DWORD *)(v5 + 20) = v11;
          *(_QWORD *)(v5 + 8) = v9;
          goto LABEL_11;
        }
      }
    }
  }
}

void sub_100004128(uint64_t a1)
{
  sub_100004130(*(_QWORD *)(a1 + 32));
}

void sub_100004130(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const char *v5;
  char *v6;
  int open;
  int v8;
  int v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  time_t v18;
  char *v19;
  char v20[16];
  __int128 v21;

  v18 = time(0);
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 24);
    if (v2)
    {
      v3 = *(_QWORD *)(v2 + 192);
      if (v3)
      {
        free(*(void **)(v3 + 32));
        *(_QWORD *)(v3 + 32) = 0;
        if (*(_DWORD *)(v3 + 16))
        {
          dispatch_suspend(*(dispatch_object_t *)(v3 + 40));
          *(_OWORD *)v20 = 0u;
          v21 = 0u;
          ctime_r(&v18, v20);
          BYTE3(v21) = 0;
          v19 = 0;
          v4 = *(_DWORD *)(v3 + 16);
          v5 = "s";
          if (v4 == 1)
            v5 = (const char *)&unk_100015297;
          asprintf(&v19, "%s --- last message repeated %u time%s ---\n", &v20[4], v4, v5);
          *(_DWORD *)(v3 + 16) = 0;
          v6 = v19;
          *(_QWORD *)(v3 + 8) = v18;
          if (v6)
          {
            open = *(_DWORD *)v3;
            if ((*(_DWORD *)v3 & 0x80000000) != 0)
            {
              open = asl_out_dst_file_create_open(*(_QWORD *)(a1 + 24), 0);
              *(_DWORD *)v3 = open;
              v6 = v19;
            }
            v8 = strlen(v6);
            v9 = write(open, v6, v8);
            free(v19);
            if (v9 < 0 || v9 < v8)
            {
              v10 = __error();
              strerror(*v10);
              sub_1000061A0("%s: error writing repeat message (%s): %s\n", v11, v12, v13, v14, v15, v16, v17, (char)"asl_action");
            }
          }
        }
      }
    }
  }
}

void sub_1000042B4(int *a1)
{
  if (a1)
    notify_cancel(*a1);
  free(a1);
}

char *sub_1000042E0(uint64_t a1, _QWORD *a2)
{
  char *result;
  xpc_object_t v5;
  _BOOL4 v6;
  char *__s1;

  __s1 = 0;
  asl_msg_fetch(*a2, 0, &__s1, 0, 0);
  result = __s1;
  if (__s1)
  {
    v5 = configuration_profile_to_asl_msg();
    v6 = asl_msg_cmp(*a2, v5) == 1;
    sub_10000262C(a1, (char *)a2[2], v6);
    asl_msg_release(v5);
    return strdup(__s1);
  }
  else
  {
    *((_DWORD *)a2 + 2) = 0;
  }
  return result;
}

void sub_100004374(id a1, int a2)
{
  sub_10000437C(a2);
}

void sub_10000437C(int a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  _DWORD *v5;
  _DWORD *v6;
  char *v7;

  v2 = qword_10001E418;
  if (!qword_10001E418)
  {
LABEL_13:
    asl_out_module_free(0);
    return;
  }
  while (1)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (v3)
      break;
LABEL_12:
    v2 = *(_QWORD *)(v2 + 24);
    if (!v2)
      goto LABEL_13;
  }
  while (1)
  {
    v4 = *(_DWORD *)(v3 + 8);
    if (v4 == 19 || v4 == 18)
      break;
    if (v4 == 17)
    {
      v5 = *(_DWORD **)(v3 + 32);
      if (v5)
      {
        if (*v5 == a1)
        {
          sub_100004420(v2, v3);
          return;
        }
      }
    }
LABEL_11:
    v3 = *(_QWORD *)(v3 + 40);
    if (!v3)
      goto LABEL_12;
  }
  v6 = *(_DWORD **)(v3 + 32);
  if (!v6 || *v6 != a1)
    goto LABEL_11;
  v7 = sub_1000042E0(v2, (_QWORD *)v3);
  free(v7);
}

void sub_100004418(id a1, int a2)
{
  sub_10000437C(a2);
}

const char *sub_100004420(uint64_t a1, uint64_t a2)
{
  const char *result;
  _BOOL4 v5;
  stat v6;
  const char *v7;

  v7 = 0;
  asl_msg_fetch(*(_QWORD *)a2, 0, &v7, 0, 0);
  result = v7;
  if (v7)
  {
    memset(&v6, 0, sizeof(v6));
    v5 = stat(v7, &v6) == 0;
    sub_10000262C(a1, *(char **)(a2 + 16), v5);
    return v7;
  }
  else
  {
    *(_DWORD *)(a2 + 8) = 0;
  }
  return result;
}

void sub_1000044AC(id a1, int a2)
{
  sub_10000437C(a2);
}

void sub_1000044B4()
{
  NSObject *v0;
  dispatch_time_t v1;
  time_t v2;
  tm v3;
  timespec when;

  v2 = time(0);
  if (!qword_10001C070)
  {
    memset(&v3, 0, sizeof(v3));
    localtime_r(&v2, &v3);
    *(_QWORD *)&v3.tm_sec = 0;
    v3.tm_hour = 0;
    ++v3.tm_mday;
    v2 = mktime(&v3);
    when.tv_sec = v2;
    when.tv_nsec = 0;
    v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10001C040);
    qword_10001C070 = (uint64_t)v0;
    v1 = dispatch_walltime(&when, 0);
    dispatch_source_set_timer(v0, v1, 0x4E94914F0000uLL, 0);
    dispatch_source_set_event_handler((dispatch_source_t)qword_10001C070, &stru_100018C38);
    dispatch_resume((dispatch_object_t)qword_10001C070);
  }
}

void sub_100004588(id a1)
{
  sub_1000022D0(1);
}

void sub_100004590(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  _QWORD v5[6];

  if (a1)
  {
    do
      v4 = __ldxr((unsigned int *)&xmmword_10001E388 + 3);
    while (__stxr(v4 + 1, (unsigned int *)&xmmword_10001E388 + 3));
    asl_msg_retain(a1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v5[2] = sub_100004620;
    v5[3] = &unk_100018C58;
    v5[4] = a1;
    v5[5] = a2;
    dispatch_async((dispatch_queue_t)qword_10001C078, v5);
  }
}

uint64_t sub_100004620(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  const char *val_for_key;
  const char *v10;
  size_t v11;
  const char *v12;
  int v13;
  size_t v14;
  unsigned int v15;
  _BOOL4 v16;
  const char *v17;
  int v18;
  int v19;
  int v20;
  BOOL v21;
  unsigned int v22;
  const sockaddr *v23;
  size_t v24;
  const char *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  int v35;
  char *v36;
  char *v37;
  char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  size_t v47;
  size_t v48;
  char v49;
  const char *v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  BOOL v54;
  char v55;
  NSObject *v56;
  NSObject *v57;
  dispatch_time_t v58;
  uint64_t v59;
  int *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  unsigned int v69;
  int *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  int v80;
  int *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  addrinfo *v97;
  int v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  int *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t result;
  uint64_t v118;
  unint64_t v119;
  unsigned int v120;
  char *v121;
  time_t v122;
  char *__s;
  int v124;
  char *v125;
  addrinfo *v126;
  addrinfo handler;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v122 = time(0);
    v3 = (unsigned int *)qword_10001C088;
    if (!qword_10001C088)
    {
      v4 = 0;
      __s = 0;
      goto LABEL_118;
    }
    __s = 0;
    v4 = 0;
    while (1)
    {
      v5 = *v3;
      if (!(_DWORD)v5)
        goto LABEL_90;
      v6 = 0;
      v7 = 0;
      do
      {
        while (1)
        {
          v8 = *(_DWORD *)(*((_QWORD *)v3 + 6) + 4 * v6);
          if (v8 == -1)
            goto LABEL_20;
          if (v7 != 1 || v8 < 0)
            break;
          ++v6;
          v7 = 1;
          if (v6 >= v5)
            goto LABEL_27;
        }
        if (!v7 && v8 == -2)
        {
LABEL_19:
          v7 = 0;
          goto LABEL_20;
        }
        val_for_key = (const char *)asl_msg_get_val_for_key(v2, "Facility");
        v10 = *(const char **)(*((_QWORD *)v3 + 4) + 8 * v6);
        if (!strcmp(v10, "*")
          || (v11 = *(unsigned int *)(*((_QWORD *)v3 + 5) + 4 * v6), (_DWORD)v11) && !strncasecmp(v10, val_for_key, v11)
          || val_for_key && !strcasecmp(v10, val_for_key))
        {
          if (*(_DWORD *)(*((_QWORD *)v3 + 6) + 4 * v6) == -2)
            goto LABEL_19;
          v12 = (const char *)asl_msg_get_val_for_key(v2, "Level");
          if (v12)
          {
            v13 = atoi(v12);
            if ((v13 & 0x80000000) == 0 && v13 <= *(_DWORD *)(*((_QWORD *)v3 + 6) + 4 * v6))
              v7 = 1;
          }
        }
LABEL_20:
        ++v6;
        v5 = *v3;
      }
      while (v6 < v5);
      if (!v7)
        goto LABEL_90;
LABEL_27:
      v125 = 0;
      v124 = 0;
      if (v3[4] == -1)
      {
        v126 = 0;
        v17 = (const char *)*((_QWORD *)v3 + 1);
        v18 = *(unsigned __int8 *)v17;
        if (v18 == 33)
        {
          *((_QWORD *)v3 + 2) = 0x5FFFFFFFFLL;
          goto LABEL_28;
        }
        if (v18 != 64)
        {
          if (v18 != 47)
          {
            if (!strcmp(*((const char **)v3 + 1), "*"))
              *((_QWORD *)v3 + 2) = 0x4FFFFFFFFLL;
            else
              sub_1000061A0("%s: unsupported / unknown output name: %s\n", v40, v41, v42, v43, v44, v45, v46, (char)"bsd_out");
            goto LABEL_28;
          }
          v19 = open(v17, 131593, 420);
          v3[4] = v19;
          if (v19 < 0)
          {
            v70 = __error();
            strerror(*v70);
            sub_1000061A0("%s: open failed for file: %s (%s)\n", v71, v72, v73, v74, v75, v76, v77, (char)"bsd_out");
            goto LABEL_28;
          }
          v3[5] = 1;
          if (!strcmp(*((const char **)v3 + 1), "/dev/console"))
            v20 = 2;
          else
            v20 = 1;
LABEL_44:
          v3[5] = v20;
          goto LABEL_28;
        }
        v36 = strdup(v17 + 1);
        if (!v36)
          goto LABEL_28;
        v37 = v36;
        v38 = strrchr(v36, 58);
        if (v38)
        {
          *v38 = 0;
          v39 = v38 + 1;
        }
        else
        {
          v39 = "syslog";
        }
        memset(&handler, 0, sizeof(handler));
        handler.ai_socktype = 2;
        v89 = getaddrinfo(v37, v39, &handler, &v126);
        free(v37);
        if (v89)
        {
          gai_strerror(v89);
          sub_1000061A0("%s: getaddrinfo failed for node %s service %s: (%s)\n", v90, v91, v92, v93, v94, v95, v96, (char)"bsd_out");
          goto LABEL_28;
        }
        v97 = v126;
        if (v126)
        {
          while (1)
          {
            v98 = socket(v97->ai_family, v97->ai_socktype, v97->ai_protocol);
            v3[4] = v98;
            if ((v98 & 0x80000000) == 0)
              break;
            v97 = v97->ai_next;
            if (!v97)
              goto LABEL_110;
          }
          v99 = malloc_type_malloc(v97->ai_addrlen, 0x6EAFFA10uLL);
          *((_QWORD *)v3 + 3) = v99;
          if (!v99)
            goto LABEL_28;
          memcpy(v99, v97->ai_addr, v97->ai_addrlen);
        }
LABEL_110:
        freeaddrinfo(v126);
        v107 = v3[4];
        if (v107 < 0)
        {
          sub_1000061A0("%s: connection failed for %s\n", v100, v101, v102, v103, v104, v105, v106, (char)"bsd_out");
        }
        else
        {
          if ((fcntl(v107, 4, 4) & 0x80000000) == 0)
          {
            v20 = 3;
            goto LABEL_44;
          }
          close(v3[4]);
          v3[4] = -1;
          v108 = __error();
          strerror(*v108);
          sub_1000061A0("%s: couldn't set O_NONBLOCK for fd %d: %s\n", v109, v110, v111, v112, v113, v114, v115, (char)"bsd_out");
        }
        free(*((void **)v3 + 3));
        *((_QWORD *)v3 + 3) = 0;
      }
LABEL_28:
      if (v3[5] == 5)
      {
        notify_post((const char *)(*((_QWORD *)v3 + 1) + 1));
        goto LABEL_90;
      }
      if (v4 || (v4 = (char *)asl_format_message(v2, "bsd", "lcl", 1, &v124)) != 0)
      {
        if ((_QWORD)xmmword_10001E460 && *((_QWORD *)v3 + 10))
        {
          v14 = strlen(v4 + 16);
          v15 = asl_core_string_hash(v4 + 16, v14);
          if (v3[14] != v15 || strcmp(*((const char **)v3 + 10), v4 + 16))
          {
            v16 = 0;
            goto LABEL_46;
          }
          v78 = v122 - *((_QWORD *)v3 + 8);
          v16 = v78 < (unint64_t)xmmword_10001E460;
          v21 = v78 >= (unint64_t)xmmword_10001E460;
        }
        else
        {
          v16 = 0;
          v15 = 0;
LABEL_46:
          v21 = 1;
        }
        v22 = v3[5];
        if (__s)
        {
LABEL_48:
          if (v22 == 3)
          {
            v23 = (const sockaddr *)*((_QWORD *)v3 + 3);
            if (v23)
            {
              v24 = strlen(__s);
              if ((sendto(v3[4], __s, v24, 0, v23, v23->sa_len) & 0x80000000) != 0)
              {
                v25 = "%s: error sending message (%s): %s\n";
                goto LABEL_52;
              }
            }
            goto LABEL_87;
          }
LABEL_63:
          v47 = strlen(v4);
          if (v22 - 1 > 1)
            goto LABEL_87;
          v48 = v47;
          v49 = !v21;
          if (v22 != 1)
            v49 = 1;
          if ((v49 & 1) == 0 && v3[15])
            sub_100005680((uint64_t)v3);
          v50 = (const char *)asl_msg_get_val_for_key(v2, "Facility");
          if (!v50)
          {
            v52 = v3[5];
            goto LABEL_74;
          }
          v51 = strcmp(v50, "kern");
          v52 = v3[5];
          if (v51 || (v53 = v48, v52 != 2))
          {
LABEL_74:
            v54 = v52 == 1;
            v55 = !v16;
            if (!v54)
              v55 = 1;
            if ((v55 & 1) != 0)
            {
              v53 = write(v3[4], v4, v48);
            }
            else
            {
              if (!*((_QWORD *)v3 + 9))
              {
                v56 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10001C078);
                *((_QWORD *)v3 + 9) = v56;
                *(_QWORD *)&handler.ai_flags = _NSConcreteStackBlock;
                *(_QWORD *)&handler.ai_socktype = 0x40000000;
                *(_QWORD *)&handler.ai_addrlen = sub_100005844;
                handler.ai_canonname = (char *)&unk_100018D78;
                handler.ai_addr = (sockaddr *)v3;
                dispatch_source_set_event_handler(v56, &handler);
              }
              v53 = v48;
              if (!v3[15])
              {
                v57 = *((_QWORD *)v3 + 9);
                v58 = dispatch_time(0, 1000000000 * xmmword_10001E460);
                dispatch_source_set_timer(v57, v58, 0xFFFFFFFFFFFFFFFFLL, 0);
                dispatch_resume(*((dispatch_object_t *)v3 + 9));
                v53 = v48;
              }
            }
          }
          if ((v53 & 0x80000000) == 0 && v53 >= v48)
            goto LABEL_87;
          v59 = *((_QWORD *)v3 + 1);
          v60 = __error();
          v121 = strerror(*v60);
          sub_1000061A0("%s: error writing message (%s): %s\n", v61, v62, v63, v64, v65, v66, v67, (char)"bsd_out");
          close(v3[4]);
          v68 = open(*((const char **)v3 + 1), 131593, 420, v59, v121);
          v3[4] = v68;
          if (v68 < 0)
          {
            v81 = __error();
            strerror(*v81);
            sub_1000061A0("%s: re-open failed for file: %s (%s)\n", v82, v83, v84, v85, v86, v87, v88, (char)"bsd_out");
          }
          else
          {
            v69 = write(v68, v4, v48);
            if ((v69 & 0x80000000) != 0)
            {
              v25 = "%s: error re-writing message (%s): %s\n";
            }
            else
            {
              v25 = "%s: error re-writing message (%s): %s\n";
              if (v69 >= v48)
                goto LABEL_87;
            }
LABEL_52:
            v26 = __error();
            strerror(*v26);
            sub_1000061A0(v25, v27, v28, v29, v30, v31, v32, v33, (char)"bsd_out");
LABEL_87:
            if (v16)
            {
              ++v3[15];
            }
            else
            {
              free(*((void **)v3 + 10));
              *((_QWORD *)v3 + 10) = 0;
              *((_QWORD *)v3 + 10) = strdup(v4 + 16);
              v3[14] = v15;
              v3[15] = 0;
              *((_QWORD *)v3 + 8) = v122;
            }
          }
        }
        else
        {
          if (v22 != 3)
          {
            __s = 0;
            goto LABEL_63;
          }
          v34 = (const char *)asl_msg_get_val_for_key(v2, "Level");
          if (v34)
            v35 = atoi(v34);
          else
            v35 = 7;
          v79 = asl_msg_get_val_for_key(v2, "Facility");
          v80 = asl_syslog_faciliy_name_to_num(v79);
          v125 = 0;
          asprintf(&v125, "<%d>%s", v80 & ~(v80 >> 31) | v35, v4);
          __s = v125;
          if (v125)
          {
            v22 = v3[5];
            goto LABEL_48;
          }
          __s = 0;
        }
      }
LABEL_90:
      v3 = (unsigned int *)*((_QWORD *)v3 + 11);
      if (!v3)
      {
LABEL_118:
        free(v4);
        free(__s);
        v116 = *(_QWORD *)(a1 + 32);
        goto LABEL_119;
      }
    }
  }
  v116 = 0;
LABEL_119:
  result = asl_msg_release(v116);
  v118 = -*(_QWORD *)(a1 + 40);
  do
    v119 = __ldxr((unint64_t *)&xmmword_10001E388);
  while (__stxr(v119 + v118, (unint64_t *)&xmmword_10001E388));
  do
    v120 = __ldxr((unsigned int *)&xmmword_10001E388 + 3);
  while (__stxr(v120 - 1, (unsigned int *)&xmmword_10001E388 + 3));
  return result;
}

uint64_t sub_100004EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FILE *v8;
  FILE *v9;
  char *line_from_file;
  char *v11;
  char *i;
  int v13;
  unsigned int *v14;
  unsigned int *v15;
  int v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  void **v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void **v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  const char **v28;
  uint64_t j;
  const char *v30;
  int v31;
  void *v32;
  const char *v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  _QWORD *v46;
  uint64_t v48;
  FILE *v49;
  char *v50;
  int v51;

  sub_1000061A0("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"bsd_out");
  qword_10001C088 = 0;
  qword_10001C090 = (uint64_t)&qword_10001C088;
  v8 = fopen("/etc/syslog.conf", "r");
  if (v8)
  {
    v9 = v8;
    line_from_file = get_line_from_file(v8);
    if (line_from_file)
    {
      v11 = line_from_file;
      v49 = v9;
      do
      {
        for (i = v11; ; ++i)
        {
          v13 = *i;
          if (v13 != 9 && v13 != 32)
            break;
        }
        if (v13 != 35)
        {
          v50 = explode(i, "; \t");
          if (v50)
          {
            v14 = (unsigned int *)malloc_type_calloc(1uLL, 0x68uLL, 0x10B004011DEFA78uLL);
            if (v14)
            {
              v15 = v14;
              v16 = -1;
              v14[4] = -1;
              v17 = *(_BYTE **)v50;
              if (*(_QWORD *)v50)
              {
                v18 = 0;
                do
                {
                  if (*v17)
                    v16 = v18;
                  v17 = *(_BYTE **)&v50[8 * v18++ + 8];
                }
                while (v17);
              }
              v19 = strdup(*(const char **)&v50[8 * v16]);
              *((_QWORD *)v15 + 1) = v19;
              if (v19)
              {
                v20 = (void **)v50;
                if (v16 >= 1)
                {
                  v21 = 0;
                  v48 = v16;
                  do
                  {
                    v22 = (char *)v20[v21];
                    if (*v22)
                    {
                      v23 = explode(v22, ",.");
                      v24 = (void **)v23;
                      v25 = *(_BYTE **)v23;
                      if (*(_QWORD *)v23)
                      {
                        v26 = 0;
                        LODWORD(v27) = -1;
                        do
                        {
                          if (*v25)
                            v27 = v26;
                          else
                            v27 = v27;
                          v25 = *(_BYTE **)&v23[8 * v26++ + 8];
                        }
                        while (v25);
                        if ((int)v27 >= 1)
                        {
                          v28 = (const char **)v23;
                          for (j = v27; j; --j)
                          {
                            if (!**v28)
                              goto LABEL_71;
                            v30 = (const char *)v24[v27];
                            if (!v30)
                              goto LABEL_71;
                            if (!strcasecmp((const char *)v24[v27], "emerg") || !strcasecmp(v30, "panic"))
                            {
                              v51 = 0;
                            }
                            else
                            {
                              if (!strcasecmp(v30, "alert"))
                              {
                                v31 = 1;
                              }
                              else if (!strcasecmp(v30, "crit"))
                              {
                                v31 = 2;
                              }
                              else if (!strcasecmp(v30, "err") || !strcasecmp(v30, "error"))
                              {
                                v31 = 3;
                              }
                              else if (!strcasecmp(v30, "warn") || !strcasecmp(v30, "warning"))
                              {
                                v31 = 4;
                              }
                              else if (!strcasecmp(v30, "notice"))
                              {
                                v31 = 5;
                              }
                              else if (!strcasecmp(v30, "info"))
                              {
                                v31 = 6;
                              }
                              else if (!strcasecmp(v30, "debug") || !strcmp(v30, "*"))
                              {
                                v31 = 7;
                              }
                              else
                              {
                                if (strcasecmp(v30, "none"))
                                  goto LABEL_71;
                                v31 = -2;
                              }
                              v51 = v31;
                            }
                            if (*v15)
                            {
                              *((_QWORD *)v15 + 4) = reallocf(*((void **)v15 + 4), 8 * (*v15 + 1));
                              *((_QWORD *)v15 + 5) = reallocf(*((void **)v15 + 5), 4 * (*v15 + 1));
                              v32 = reallocf(*((void **)v15 + 6), 4 * (*v15 + 1));
                            }
                            else
                            {
                              *((_QWORD *)v15 + 4) = malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL);
                              *((_QWORD *)v15 + 5) = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
                              v32 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
                            }
                            *((_QWORD *)v15 + 6) = v32;
                            if (!*((_QWORD *)v15 + 4) || !*((_QWORD *)v15 + 5) || !v32)
                              goto LABEL_79;
                            v33 = *v28;
                            if (*v28 && (v34 = strlen(*v28), (v35 = v34) != 0))
                            {
                              v36 = *(unsigned __int8 *)v33;
                              if (v36 == 39 || v36 == 34)
                              {
                                if ((++v33)[v34 - 2] == v36)
                                  v37 = -2;
                                else
                                  v37 = -1;
                                v35 = v37 + v34;
                              }
                              v38 = malloc_type_calloc(1uLL, v35 + 1, 0xC1ED50EAuLL);
                              v39 = v38;
                              if (v38)
                                memcpy(v38, v33, v35);
                            }
                            else
                            {
                              v39 = 0;
                            }
                            v40 = *v15;
                            *(_QWORD *)(*((_QWORD *)v15 + 4) + 8 * v40) = v39;
                            v41 = *((_QWORD *)v15 + 4);
                            if (!*(_QWORD *)(v41 + 8 * v40))
                              goto LABEL_79;
                            v42 = *((_QWORD *)v15 + 5);
                            *(_DWORD *)(v42 + 4 * v40) = 0;
                            v43 = *v15;
                            v44 = *(char **)(v41 + 8 * v43);
                            v45 = strchr(v44, 42);
                            if (v45)
                            {
                              *(_DWORD *)(v42 + 4 * v43) = (_DWORD)v45 - (_DWORD)v44;
                              v43 = *v15;
                            }
                            *(_DWORD *)(*((_QWORD *)v15 + 6) + 4 * v43) = v51;
                            ++*v15;
LABEL_71:
                            ++v28;
                          }
                        }
                      }
                      free_string_list(v24);
                      v20 = (void **)v50;
                    }
                    ++v21;
                  }
                  while (v21 != v48);
                }
                free_string_list(v20);
                *((_QWORD *)v15 + 11) = 0;
                v46 = (_QWORD *)qword_10001C090;
                *((_QWORD *)v15 + 12) = qword_10001C090;
                *v46 = v15;
                qword_10001C090 = (uint64_t)(v15 + 22);
              }
            }
          }
        }
LABEL_79:
        free(v11);
        v9 = v49;
        v11 = get_line_from_file(v49);
      }
      while (v11);
    }
    fclose(v9);
  }
  if (qword_10001C080 != -1)
    dispatch_once(&qword_10001C080, &stru_100018C98);
  return 0;
}

void sub_1000053E4(id a1)
{
  NSObject *v1;
  dispatch_time_t v2;

  qword_10001C078 = (uint64_t)dispatch_queue_create("BSD Out Queue", 0);
  qword_10001C098 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10001C078);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10001C098, &stru_100018CD8);
  v1 = qword_10001C098;
  v2 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v1, v2, 0x45D964B800uLL, 0);
  dispatch_resume((dispatch_object_t)qword_10001C098);
}

void sub_100005478(id a1)
{
  time_t v1;
  uint64_t v2;
  time_t v3;
  void *v4;
  int v5;
  int v6;

  v1 = time(0);
  v2 = qword_10001C088;
  if (qword_10001C088)
  {
    v3 = v1;
    do
    {
      if (*(_DWORD *)(v2 + 20) == 1 && !*(_DWORD *)(v2 + 60) && (unint64_t)(v3 - *(_QWORD *)(v2 + 64)) >= 0x12D)
      {
        v4 = *(void **)(v2 + 24);
        if (!v4
          || (free(v4), *(_QWORD *)(v2 + 24) = 0, v5 = *(_DWORD *)(v2 + 20), (v5 - 1) < 2)
          || v5 == 3)
        {
          v6 = *(_DWORD *)(v2 + 16);
          if ((v6 & 0x80000000) == 0)
            close(v6);
          *(_DWORD *)(v2 + 16) = -1;
        }
      }
      v2 = *(_QWORD *)(v2 + 88);
    }
    while (v2);
  }
}

uint64_t sub_10000551C()
{
  dispatch_async((dispatch_queue_t)qword_10001C078, &stru_100018D18);
  return 0;
}

void sub_100005548()
{
  unsigned int *v0;
  unsigned int *v1;
  NSObject *v2;
  int v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v0 = (unsigned int *)qword_10001C088;
  if (qword_10001C088)
  {
    do
    {
      v1 = (unsigned int *)*((_QWORD *)v0 + 11);
      v2 = *((_QWORD *)v0 + 9);
      if (v2)
      {
        if (v0[15])
        {
          sub_100005680((uint64_t)v0);
          v2 = *((_QWORD *)v0 + 9);
        }
        dispatch_source_cancel(v2);
        dispatch_resume(*((dispatch_object_t *)v0 + 9));
        dispatch_release(*((dispatch_object_t *)v0 + 9));
      }
      free(*((void **)v0 + 1));
      free(*((void **)v0 + 3));
      free(*((void **)v0 + 10));
      free(*((void **)v0 + 5));
      free(*((void **)v0 + 6));
      v3 = v0[4];
      if ((v3 & 0x80000000) == 0)
        close(v3);
      v4 = (void *)*((_QWORD *)v0 + 4);
      if (v4)
      {
        if (*v0)
        {
          v5 = 0;
          do
            free(*(void **)(*((_QWORD *)v0 + 4) + 8 * v5++));
          while (v5 < *v0);
          v4 = (void *)*((_QWORD *)v0 + 4);
        }
        free(v4);
      }
      v6 = *((_QWORD *)v0 + 11);
      v7 = (_QWORD *)*((_QWORD *)v0 + 12);
      if (v6)
      {
        *(_QWORD *)(v6 + 96) = v7;
        v7 = (_QWORD *)*((_QWORD *)v0 + 12);
      }
      else
      {
        qword_10001C090 = *((_QWORD *)v0 + 12);
      }
      *v7 = v6;
      free(v0);
      v0 = v1;
    }
    while (v1);
  }
}

uint64_t sub_100005644()
{
  dispatch_async((dispatch_queue_t)qword_10001C078, &stru_100018D58);
  return 0;
}

void sub_10000566C(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_100005548();
  sub_100004EA8(v1, v2, v3, v4, v5, v6, v7, v8);
}

void sub_100005680(uint64_t a1)
{
  int v2;
  const char *v3;
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  const char *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  time_t v27;
  char *__s;
  char v29[16];
  __int128 v30;

  if (a1 && *(_DWORD *)(a1 + 20) == 1 && *(_DWORD *)(a1 + 60))
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 72));
    v27 = time(0);
    *(_OWORD *)v29 = 0u;
    v30 = 0u;
    ctime_r(&v27, v29);
    BYTE3(v30) = 0;
    __s = 0;
    v2 = *(_DWORD *)(a1 + 60);
    v3 = "s";
    if (v2 == 1)
      v3 = (const char *)&unk_100015297;
    asprintf(&__s, "%s: --- last message repeated %u time%s ---\n", &v29[4], v2, v3);
    *(_DWORD *)(a1 + 60) = 0;
    if (__s)
    {
      v4 = strlen(__s);
      v5 = write(*(_DWORD *)(a1 + 16), __s, v4);
      if ((v5 & 0x80000000) == 0 && v5 >= v4)
        goto LABEL_15;
      v6 = *(_QWORD *)(a1 + 8);
      v7 = __error();
      v26 = strerror(*v7);
      sub_1000061A0("%s: error writing repeat message (%s): %s\n", v8, v9, v10, v11, v12, v13, v14, (char)"bsd_out");
      close(*(_DWORD *)(a1 + 16));
      v15 = open(*(const char **)(a1 + 8), 131593, 420, v6, v26);
      *(_DWORD *)(a1 + 16) = v15;
      if (v15 < 0)
      {
        v17 = "%s: re-open failed for file: %s (%s)\n";
      }
      else
      {
        v16 = write(v15, __s, v4);
        v17 = "%s: error re-writing message (%s): %s\n";
        if ((v16 & 0x80000000) == 0 && v16 >= v4)
          goto LABEL_15;
      }
      v18 = __error();
      strerror(*v18);
      sub_1000061A0(v17, v19, v20, v21, v22, v23, v24, v25, (char)"bsd_out");
LABEL_15:
      free(__s);
    }
  }
}

void sub_100005844(uint64_t a1)
{
  sub_100005680(*(_QWORD *)(a1 + 32));
}

uint64_t sub_10000584C()
{
  _os_nospin_lock_lock(&unk_10001C0A0);
  ++dword_10001E34C;
  return _os_nospin_lock_unlock(&unk_10001C0A0);
}

uint64_t sub_10000588C()
{
  _os_nospin_lock_lock(&unk_10001C0A0);
  if (dword_10001E34C >= 1)
    --dword_10001E34C;
  return _os_nospin_lock_unlock(&unk_10001C0A0);
}

uint64_t sub_1000058C8()
{
  uint64_t result;
  uint64_t i;
  char *v2;

  _os_nospin_lock_lock(&unk_10001E348);
  dword_10001E37C = getpid();
  DWORD2(xmmword_10001E428) = 0;
  free((void *)qword_10001E438);
  qword_10001E438 = 0;
  LODWORD(xmmword_10001E408) = 1;
  xmmword_10001E448 = xmmword_100014720;
  qword_10001E458 = 0x1388000001F4;
  xmmword_10001E460 = xmmword_100014730;
  qword_10001E480 = 3072000;
  xmmword_10001E470 = xmmword_100014740;
  qword_10001E418 = (uint64_t)asl_out_module_init();
  result = _os_nospin_lock_unlock(&unk_10001E348);
  if (qword_10001E418)
  {
    for (i = *(_QWORD *)(qword_10001E418 + 16); i; i = *(_QWORD *)(i + 40))
    {
      if (*(_DWORD *)(i + 8) == 1 && !*(_QWORD *)i)
      {
        v2 = *(char **)(i + 16);
        result = strncmp(v2, "debug", 5uLL);
        if (!(_DWORD)result)
          result = sub_1000059C4(v2, 1);
      }
    }
  }
  return result;
}

uint64_t sub_1000059C4(char *a1, int a2)
{
  uint64_t v2;
  int v4;
  const char **v6;
  const char **v7;
  unsigned int v8;
  const char *v9;
  int v10;
  const char *v11;
  const char *v12;
  int v13;
  const char *v14;
  int v15;
  const char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v27;
  int v28;
  int v29;
  int v30;
  const char *v31;
  int v32;
  int v33;
  const char *v34;
  const char *v35;
  const char *v36;
  int v37;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = *a1;
  if (*a1)
  {
    if ((_DWORD)v2 == 61)
      ++a1;
    while (1)
    {
      v4 = *a1;
      if (v4 != 32 && v4 != 9)
        break;
      ++a1;
    }
    v6 = (const char **)explode(a1, " \t");
    if (v6)
    {
      v7 = v6;
      v8 = -1;
      do
        ++v8;
      while (v6[v8]);
      if (!v8)
        goto LABEL_17;
      v9 = *v6;
      if (!strcasecmp(*v6, "debug"))
      {
        if (v8 == 1)
        {
          v10 = a2;
          v11 = 0;
        }
        else
        {
          v16 = v7[1];
          v10 = strcmp(v16, "0");
          if (v10)
          {
            if (!strcmp(v16, "1"))
            {
              v11 = v7[2];
              v10 = 1;
            }
            else
            {
              v10 = a2;
              v11 = v16;
            }
          }
          else
          {
            v11 = v7[2];
          }
        }
        sub_10000C590(v10, v11);
        goto LABEL_80;
      }
      if (v8 == 1)
      {
LABEL_17:
        v2 = 0xFFFFFFFFLL;
LABEL_81:
        free_string_list((void **)v7);
        return v2;
      }
      if (!strcasecmp(v9, "hostname"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
        {
          v17 = strdup(v7[1]);
        }
        else
        {
          free((void *)qword_10001E440);
          v17 = 0;
        }
        qword_10001E440 = (uint64_t)v17;
      }
      else if (!strcasecmp(v9, "mark_time"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
          v18 = atoll(v7[1]);
        else
          v18 = 0;
        *((_QWORD *)&xmmword_10001E460 + 1) = v18;
      }
      else if (!strcasecmp(v9, "dup_delay"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
          v19 = atoll(v7[1]);
        else
          v19 = 30;
        *(_QWORD *)&xmmword_10001E460 = v19;
      }
      else if (!strcasecmp(v9, "remote_delay"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
          v20 = atol(v7[1]);
        else
          v20 = 5000;
        HIDWORD(qword_10001E458) = v20;
      }
      else if (!strcasecmp(v9, "utmp_ttl"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
          v21 = atoll(v7[1]);
        else
          v21 = 31622400;
        *(_QWORD *)&xmmword_10001E470 = v21;
      }
      else if (!strcasecmp(v9, "mps_limit"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
          v22 = atol(v7[1]);
        else
          v22 = 500;
        LODWORD(qword_10001E458) = v22;
      }
      else if (!strcasecmp(v9, "memory_max"))
      {
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
          v23 = atoll(v7[1]);
        else
          v23 = 3072000;
        qword_10001E480 = v23;
      }
      else
      {
        if (strcasecmp(v9, "stats_interval"))
        {
          if (!strcasecmp(v9, "max_file_size"))
          {
            pthread_mutex_lock((pthread_mutex_t *)qword_10001E398);
            if ((xmmword_10001E448 & 1) != 0)
            {
              asl_store_close(xmmword_10001E3E8);
              *(_QWORD *)&xmmword_10001E3E8 = 0;
              if (a2)
                v25 = atoi(v7[1]);
              else
                v25 = 25600000;
              DWORD1(xmmword_10001E448) = v25;
            }
            pthread_mutex_unlock((pthread_mutex_t *)qword_10001E398);
            goto LABEL_80;
          }
          if (!strcasecmp(v9, "db") || !strcasecmp(v9, "database") || !strcasecmp(v9, "datastore"))
          {
            if (!a2)
            {
              v27 = 2;
              v28 = 25600000;
              v29 = 256;
              v30 = 1024000;
LABEL_121:
              sub_10000C5F4(v27, v28, v29, v30);
              goto LABEL_80;
            }
            v12 = v7[1];
            if (*(unsigned __int8 *)v12 - 48 <= 9)
            {
              v13 = atoi(v7[1]);
              if (v8 < 3)
              {
                v32 = 0;
                v33 = 0;
                goto LABEL_113;
              }
              v14 = v7[2];
              if (!strcmp(v14, "-"))
                v15 = 0;
              else
                v15 = atoi(v14);
              if (v8 < 4)
              {
                v33 = 0;
                v32 = 0;
              }
              else
              {
                v35 = v7[3];
                if (!strcmp(v35, "-"))
                  v37 = 0;
                else
                  v37 = atoi(v35);
                if (v8 < 5)
                {
                  v32 = 0;
                }
                else
                {
                  v36 = v7[4];
                  v32 = strcmp(v36, "-");
                  if (v32)
                    v32 = atoi(v36);
                }
                v33 = v37;
              }
LABEL_112:
              v28 = v15;
              if (v15)
              {
LABEL_114:
                if (v33)
                  v29 = v33;
                else
                  v29 = DWORD2(xmmword_10001E448);
                if (v32)
                  v30 = v32;
                else
                  v30 = HIDWORD(xmmword_10001E448);
                v27 = v13;
                goto LABEL_121;
              }
LABEL_113:
              v28 = DWORD1(xmmword_10001E448);
              goto LABEL_114;
            }
            if (!strcasecmp(v7[1], "file"))
            {
              if (v8 < 3)
              {
                v32 = 0;
              }
              else
              {
                v34 = v7[2];
                v32 = strcmp(v34, "-");
                if (v32)
                {
                  v15 = atoi(v34);
                  v33 = 0;
                  v32 = 0;
                  v13 = 1;
                  goto LABEL_112;
                }
              }
              v33 = 0;
              v13 = 1;
              goto LABEL_113;
            }
            if (strncasecmp(v12, "mem", 3uLL))
              goto LABEL_17;
            if (v8 < 3)
            {
              v32 = 0;
            }
            else
            {
              v31 = v7[2];
              v32 = strcmp(v31, "-");
              if (v32)
              {
                v33 = atoi(v31);
                v32 = 0;
LABEL_105:
                v13 = 2;
                goto LABEL_113;
              }
            }
            v33 = 0;
            goto LABEL_105;
          }
LABEL_80:
          v2 = 0;
          goto LABEL_81;
        }
        _os_nospin_lock_lock(&unk_10001E348);
        if (a2)
          v24 = atoll(v7[1]);
        else
          v24 = 600;
        *((_QWORD *)&xmmword_10001E470 + 1) = v24;
      }
      _os_nospin_lock_unlock(&unk_10001E348);
      goto LABEL_80;
    }
    return 0xFFFFFFFFLL;
  }
  return v2;
}

void sub_100005F88(uint64_t a1, int a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
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
  unint64_t v25;
  unsigned int v26;
  char v27;
  _QWORD block[7];
  int v29;
  BOOL v30;
  char __str[256];

  if (a1)
  {
    v3 = a1;
    v4 = asl_check_option(a1, "control");
    v12 = v4 != 0;
    if (!v4 && byte_10001C0A4 == 1)
    {
      if (qword_10001E480 >= 0)
        v13 = qword_10001E480;
      else
        v13 = qword_10001E480 + 1;
      if ((uint64_t)xmmword_10001E388 >= v13 >> 1)
      {
        sub_1000061A0("Work queue draining: dropped message.\n", v5, v6, v7, v8, v9, v10, v11, v27);
        asl_msg_release(v3);
        return;
      }
      sub_1000061A0("Work queue re-enabled at 1/2 max.  size %lld  max %lld\n", v5, v6, v7, v8, v9, v10, v11, xmmword_10001E388);
      byte_10001C0A4 = 0;
    }
    v14 = os_transaction_create("com.apple.syslogd.message");
    v15 = 0;
    v16 = v3;
    do
    {
      v17 = *(_QWORD *)(v16 + 16);
      v16 = *(_QWORD *)(v16 + 24);
      v15 += v17;
    }
    while (v16);
    if ((uint64_t)xmmword_10001E388 + v15 >= qword_10001E480)
    {
      byte_10001C0A4 = 1;
      asl_msg_release(v3);
      sub_1000061A0("Work queue disabled.  msize %lld  size %lld  max %lld\n", v18, v19, v20, v21, v22, v23, v24, v15);
      snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 2] [PID %u] [Message Internal memory size limit %lld exceeded - dropping messages] [UID 0] [UID 0] [Facility syslog]", dword_10001E37C, qword_10001E480);
      v3 = asl_msg_from_string(__str);
    }
    do
      v25 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v25 + v15, (unint64_t *)&xmmword_10001E388));
    do
      v26 = __ldxr((unsigned int *)&dword_10001E380);
    while (__stxr(v26 + 1, (unsigned int *)&dword_10001E380));
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100006280;
    block[3] = &unk_100018DD8;
    v29 = a2;
    v30 = v12;
    block[4] = v3;
    block[5] = v15;
    block[6] = v14;
    dispatch_async((dispatch_queue_t)qword_10001E3D0, block);
  }
}

uint64_t sub_1000061A0(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v10;
  FILE *v11;
  FILE *v12;

  if (DWORD2(xmmword_10001E428))
  {
    v10 = qword_10001E438 ? (const char *)qword_10001E438 : "/var/log/syslogd.log";
    v11 = fopen(v10, "a");
    if (v11)
    {
      v12 = v11;
      fprintf(v11, "W %d %llu", dword_10001E380, (_QWORD)xmmword_10001E388);
      if (*((_QWORD *)&xmmword_10001E3E8 + 1))
        fprintf(v12, "   M %u %u %lu", *(_DWORD *)(*((_QWORD *)&xmmword_10001E3E8 + 1) + 28), *(_DWORD *)(*((_QWORD *)&xmmword_10001E3E8 + 1) + 24), *(_QWORD *)(*((_QWORD *)&xmmword_10001E3E8 + 1) + 48));
      fwrite(" ; ", 3uLL, 1uLL, v12);
      vfprintf(v12, a1, &a9);
      fclose(v12);
    }
  }
  return 0;
}

void sub_100006280(uint64_t a1)
{
  uint64_t v2;
  int v3;
  time_t v4;
  const char *val_for_key;
  int v6;
  const char *v7;
  int v8;
  const char *v9;
  unsigned __int8 *v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  time_t v19;
  uint64_t *v20;
  const char *v21;
  const char *v22;
  int v23;
  const char *v24;
  const char *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  unint64_t v29;
  uint32_t v30;
  const char *v31;
  char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t i;
  void **v46;
  void **v47;
  char *v48;
  _QWORD *v49;
  _QWORD *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int v66;
  const char *v67;
  char *v68;
  unsigned int v69;
  char *__s1;
  uint64_t v71;
  char *v72;
  uuid_t uu;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  char out[48];
  char __str[64];
  char v79[64];
  char *v80[8];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_64;
  v3 = *(_DWORD *)(a1 + 56);
  v4 = time(0);
  val_for_key = (const char *)asl_msg_get_val_for_key(v2, "PID");
  if (val_for_key)
  {
    v6 = atoi(val_for_key);
    if (v6 == 1)
    {
      v7 = (const char *)asl_msg_get_val_for_key(v2, "RefPID");
      if (v7)
        v8 = atoi(v7);
      else
        v8 = 1;
      v9 = (const char *)asl_msg_get_val_for_key(v2, "RefProc");
    }
    else
    {
      v8 = v6;
      v9 = 0;
    }
  }
  else
  {
    asl_msg_set_key_val(v2, "PID", "0");
    v9 = 0;
    v8 = 0;
  }
  memset(out, 0, 37);
  *(_OWORD *)uu = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0;
  v10 = (unsigned __int8 *)asl_msg_get_val_for_key(v2, "Level");
  if (v3 == 4)
    v11 = 5;
  else
    v11 = 7;
  if (v10)
  {
    if (!v10[1])
    {
      v12 = *v10;
      v13 = v12 & 0xF8;
      v14 = v12 - 48;
      if (v13 == 48)
        v11 = v14;
    }
  }
  snprintf(__str, 0x40uLL, "%d", v11);
  asl_msg_set_key_val(v2, "Level", __str);
  if (!v8 && (_DWORD)qword_10001E458 && !HIDWORD(xmmword_10001E368))
  {
    if (qword_10001C0A8 == v4)
    {
      v15 = dword_10001C0B4;
    }
    else
    {
      dword_10001C0B0 = qword_10001E458;
      v15 = 7;
      dword_10001C0B4 = 7;
      qword_10001C0A8 = v4;
    }
    if (v15 > v11)
      dword_10001C0B4 = v11;
    v16 = dword_10001C0B0;
    if (dword_10001C0B0 >= 1)
    {
      --dword_10001C0B0;
      if (v16 != 1)
        goto LABEL_34;
      goto LABEL_32;
    }
    if ((dword_10001C0B0 & 0x80000000) == 0)
    {
LABEL_32:
      dword_10001C0B0 = -1;
      v80[0] = 0;
      asprintf(v80, "*** kernel exceeded %d log message per second limit  -  remaining messages this second discarded ***", qword_10001E458);
      if (v80[0])
      {
        asl_msg_set_key_val(v2, "Message", v80[0]);
        free(v80[0]);
        v79[0] = dword_10001C0B4 + 48;
        v79[1] = 0;
        asl_msg_set_key_val(v2, "Level", v79);
      }
      goto LABEL_34;
    }
LABEL_64:
    v28 = -*(_QWORD *)(a1 + 40);
    do
      v29 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v29 + v28, (unint64_t *)&xmmword_10001E388));
    goto LABEL_150;
  }
  if (v8)
  {
    uuid_clear(uu);
    if (proc_pidinfo(v8, 17, 1uLL, uu, 56) == 56)
    {
      uuid_unparse(uu, out);
      asl_msg_set_key_val(v2, "SenderMachUUID", out);
    }
  }
LABEL_34:
  v17 = asl_msg_get_val_for_key(v2, "Time");
  if (v17)
    v17 = asl_core_parse_time(v17, 0);
  if (v17 > v4 || v17 == 0)
    v19 = v4;
  else
    v19 = v17;
  snprintf(__str, 0x3FuLL, "%llu", v19);
  asl_msg_set_key_val(v2, "Time", __str);
  if (!asl_msg_get_val_for_key(v2, "Host"))
  {
    v20 = (uint64_t *)qword_10001E440;
    if (!qword_10001E440)
    {
      if (qword_10001C0B8 != -1)
        dispatch_once(&qword_10001C0B8, &stru_100018E18);
      LODWORD(v80[0]) = 1;
      if (dword_10001C028 < 0 || (v30 = notify_check(dword_10001C028, (int *)v80), v30 | LODWORD(v80[0])))
      {
        v20 = &qword_10001C0C0;
        if (gethostname((char *)&qword_10001C0C0, 0x100uLL) < 0)
        {
          strcpy((char *)&qword_10001C0C0, "localhost");
        }
        else
        {
          v32 = strchr((char *)&qword_10001C0C0, 46);
          if (v32)
            *v32 = 0;
        }
      }
      else
      {
        v20 = &qword_10001C0C0;
      }
    }
    asl_msg_set_key_val(v2, "Host", v20);
  }
  v71 = v4;
  v21 = (const char *)asl_msg_get_val_for_key(v2, "UID");
  if (!v21)
  {
LABEL_48:
    asl_msg_set_key_val(v2, "UID", "-2");
    v23 = -2;
    goto LABEL_49;
  }
  v22 = v21;
  v23 = atoi(v21);
  if (!v23)
  {
    if (!strcmp(v22, "0"))
    {
      v23 = 0;
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  v24 = (const char *)asl_msg_get_val_for_key(v2, "GID");
  if (!v24)
    goto LABEL_52;
  v25 = v24;
  v26 = atoi(v24);
  if (v26)
    goto LABEL_53;
  if (!strcmp(v25, "0"))
  {
    v26 = 0;
  }
  else
  {
LABEL_52:
    asl_msg_set_key_val(v2, "GID", "-2");
    v26 = -2;
  }
LABEL_53:
  if ((v3 - 5) >= 2)
  {
    if (v3 == 4 || v3 == 1)
    {
      v27 = "0";
      asl_msg_set_key_val(v2, "UID", "0");
      v23 = 0;
LABEL_57:
      asl_msg_set_key_val(v2, "GID", v27);
      goto LABEL_58;
    }
    if (!v23)
    {
      asl_msg_set_key_val(v2, "UID", "-2");
      v23 = -2;
    }
    v27 = "-2";
    if (v26 == 80 || !v26)
      goto LABEL_57;
  }
LABEL_58:
  if (!v9)
  {
    v9 = (const char *)asl_msg_get_val_for_key(v2, "Sender");
    if (!v9)
    {
      if (v3 == 4)
      {
        v31 = "kernel";
      }
      else
      {
        if (v3 != 1)
        {
LABEL_80:
          v9 = 0;
          v31 = "Unknown";
LABEL_88:
          asl_msg_set_key_val(v2, "Sender", v31);
          goto LABEL_89;
        }
        v31 = "syslogd";
      }
      v9 = v31;
      goto LABEL_88;
    }
  }
  if (v3 != 4 && v23 && !strcmp(v9, "kernel"))
    goto LABEL_80;
LABEL_89:
  v33 = asl_msg_get_val_for_key(v2, "Facility");
  if (!v33)
  {
    if (v3 == 4)
      v34 = "kern";
    else
      v34 = "user";
LABEL_102:
    v39 = v2;
    v38 = v34;
    goto LABEL_103;
  }
  v34 = (const char *)v33;
  if (*(_BYTE *)v33 == 35)
  {
    v35 = (const char *)(v33 + 1);
    if (*(unsigned __int8 *)(v33 + 1) - 48 > 9)
    {
      v36 = 8;
    }
    else
    {
      v36 = (8 * atoi(v35));
      if (!(_DWORD)v36)
        v36 = 8 * (strcmp(v35, "0") != 0);
    }
    v34 = (const char *)asl_syslog_faciliy_num_to_name(v36);
    goto LABEL_102;
  }
  v37 = strncmp((const char *)v33, "com.apple.system", 0x10uLL);
  if (v23 && !v37)
  {
    v38 = "user";
    v39 = v2;
LABEL_103:
    asl_msg_set_key_val(v39, "Facility", v38);
  }
  if (v3 == 4)
  {
    asl_msg_set_key_val(v2, "ReadUID", "0");
LABEL_107:
    asl_msg_set_key_val(v2, "ReadGID", "80");
    goto LABEL_108;
  }
  v40 = asl_msg_get_val_for_key(v2, "ReadUID");
  if (!(v40 | asl_msg_get_val_for_key(v2, "ReadGID")))
    goto LABEL_107;
LABEL_108:
  if (!strcmp(v34, "com.apple.system.utmpx") || !strcmp(v34, "com.apple.system.lastlog"))
  {
    snprintf(__str, 0x40uLL, "%llu", (_QWORD)xmmword_10001E470 + v19);
    asl_msg_set_key_val(v2, "ASLExpireTime", __str);
  }
  if (v3 == 4 && v11 <= 3)
  {
    sub_10000835C(v2);
    goto LABEL_116;
  }
  if (v3 != 1)
  {
    v11 = -1;
LABEL_116:
    __s1 = (char *)v9;
    if (*((_QWORD *)&xmmword_10001E470 + 1))
    {
      v41 = (unsigned int *)xmmword_10001E428;
      if (v71 - qword_10001E420 >= *((uint64_t *)&xmmword_10001E470 + 1) && (_QWORD)xmmword_10001E428)
      {
        v42 = asl_msg_new(0);
        v43 = v42;
        if (v42)
        {
          v69 = v11;
          asl_msg_set_key_val(v42, "Message", "ASL Sender Statistics");
          asl_msg_set_key_val(v43, "Sender", "syslogd");
          asl_msg_set_key_val(v43, "Facility", "com.apple.asl.statistics");
          snprintf((char *)v80, 0x40uLL, "%d", dword_10001E37C);
          asl_msg_set_key_val(v43, "PID", v80);
          snprintf((char *)v80, 0x40uLL, "%d", 5);
          asl_msg_set_key_val(v43, "Level", v80);
          snprintf((char *)v80, 0x40uLL, "%u", *v41);
          asl_msg_set_key_val(v43, "MsgCount", v80);
          snprintf((char *)v80, 0x40uLL, "%u", v41[1]);
          asl_msg_set_key_val(v43, "ShimCount", v80);
          v44 = v41[2];
          if ((_DWORD)v44)
          {
            for (i = 0; i < v44; ++i)
            {
              v46 = *(void ***)(*((_QWORD *)v41 + 2) + 8 * i);
              if (v46)
              {
                do
                {
                  v72 = 0;
                  v47 = (void **)v46[3];
                  snprintf(v79, 0x40uLL, "%llu %llu", v46[1], v46[2]);
                  asprintf(&v72, "*%s", (const char *)*v46);
                  if (v72)
                  {
                    asl_msg_set_key_val(v43, v72, v79);
                    v48 = v72;
                  }
                  else
                  {
                    v48 = 0;
                  }
                  free(v48);
                  free(*v46);
                  free(v46);
                  v46 = v47;
                }
                while (v47);
                v44 = v41[2];
              }
            }
          }
          free(*((void **)v41 + 2));
          free(v41);
          v11 = v69;
        }
        sub_100005F88(v43, 1);
        qword_10001E420 = v71;
        *(_QWORD *)&xmmword_10001E428 = 0;
        goto LABEL_133;
      }
    }
    else
    {
      v41 = (unsigned int *)xmmword_10001E428;
    }
    if (v41)
    {
LABEL_138:
      v52 = 0;
      v53 = v2;
      do
      {
        v54 = *(_QWORD *)(v53 + 16);
        v53 = *(_QWORD *)(v53 + 24);
        v52 += v54;
      }
      while (v53);
      v55 = asl_msg_get_val_for_key(v2, "ASLSHIM");
      v56 = xmmword_10001E428;
      ++*(_DWORD *)xmmword_10001E428;
      if (v55)
        ++*(_DWORD *)(v56 + 4);
      sub_1000075FC(v56, "*", v52);
      sub_1000075FC(xmmword_10001E428, __s1, v52);
      if (*(_DWORD *)(a1 + 56) == 4 && (v11 & 0x80000000) == 0)
      {
        v57 = off_100018D98[v11];
        if ((dword_10001C008[v11] & 0x80000000) != 0)
        {
          v58 = notify_register_plain(off_100018D98[v11]);
          if (v58)
            sub_1000061A0("notify_register_plain(%s) failed status %u\n", v59, v60, v61, v62, v63, v64, v65, v58);
        }
        notify_post(v57);
      }
      goto LABEL_148;
    }
LABEL_133:
    v49 = malloc_type_malloc(0x18uLL, 0x1080040216EE090uLL);
    v50 = v49;
    if (v49)
    {
      *((_DWORD *)v49 + 2) = 256;
      v51 = malloc_type_calloc(0x100uLL, 8uLL, 0x2004093837F09uLL);
      v50[2] = v51;
      if (v51)
      {
        *v50 = 0;
      }
      else
      {
        free(v50);
        v50 = 0;
      }
    }
    *(_QWORD *)&xmmword_10001E428 = v50;
    goto LABEL_138;
  }
LABEL_148:
  if (!v23)
  {
    if (*(_BYTE *)(a1 + 60))
    {
      v67 = (const char *)asl_msg_get_val_for_key(*(_QWORD *)(a1 + 32), "Message");
      if (v67)
      {
        v68 = (char *)v67;
        if (!strncmp(v67, "= reset", 7uLL))
        {
          sub_1000058C8();
          sub_100001B68();
        }
        else
        {
          if (!strncmp(v68, "= crash", 7uLL))
            abort();
          if (!strncmp(v68, "@ ", 2uLL))
          {
            sub_100001BF4(v68);
          }
          else if (!strncmp(v68, "= ", 2uLL))
          {
            sub_1000059C4(v68, 1);
          }
        }
      }
    }
  }
  sub_100000FC8(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_150:
  asl_msg_release(*(_QWORD *)(a1 + 32));
  do
    v66 = __ldxr((unsigned int *)&dword_10001E380);
  while (__stxr(v66 - 1, (unsigned int *)&dword_10001E380));
  os_release(*(void **)(a1 + 48));
}

uint64_t sub_100006E30(uint64_t a1)
{
  uint64_t v1;

  if (!a1)
    return 1;
  v1 = asl_msg_from_string(a1);
  if (!v1)
    return 1;
  sub_100005F88(v1, 1);
  return 0;
}

void sub_100006E68()
{
  char *v0;

  v0 = 0;
  asprintf(&v0, "[Sender syslogd] [Level 6] [PID %u] [Message -- MARK --] [UID 0] [UID 0] [Facility syslog]", dword_10001E37C);
  sub_100006E30((uint64_t)v0);
  free(v0);
}

char *sub_100006EB4(uint64_t a1, int a2, const char *a3, int a4)
{
  char *v4;
  uint64_t v9;
  int v10;
  int v11;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  int v26;
  _BYTE *v27;
  _BYTE *v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  _BYTE *v33;
  _BYTE *v34;
  _BYTE *v35;
  const void *v36;
  _BYTE *v37;
  _BYTE *v38;
  int v39;
  int v40;
  _BYTE *v41;
  const void *v42;
  size_t v43;
  _BYTE *v44;
  _BYTE *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  time_t v49;
  tm v50;
  char *v51;
  int v52;
  char __str[8];

  v4 = 0;
  if (!a1 || a2 < 1)
    return v4;
  v9 = 0;
  if (a4 == 4)
    v10 = 5;
  else
    v10 = 7;
  v51 = 0;
  while (1)
  {
    v11 = *(unsigned __int8 *)(a1 + v9);
    if (v11 != 32 && v11 != 9)
      break;
    if (a2 == (_DWORD)++v9)
      return 0;
  }
  v52 = 0;
  memset(&v50, 0, sizeof(v50));
  v49 = 0;
  v14 = (char *)(a1 + v9);
  if (v11 == 60)
  {
    if (sscanf(v14 + 1, "%d", &v52) == 1 && (v10 = v52 & 7, v52 >= 8))
      v15 = asl_syslog_faciliy_num_to_name(v52 & 0x3F8);
    else
      v15 = 0;
    if ((int)v9 + 1 >= a2)
    {
      LODWORD(v9) = v9 + 1;
      ++v14;
    }
    else if (v14[1] == 62)
    {
LABEL_26:
      v14 += 2;
      LODWORD(v9) = v9 + 2;
    }
    else
    {
      while (1)
      {
        v16 = a1 + v9;
        if (a2 - 2 == (_DWORD)v9)
          break;
        ++v9;
        if (*(_BYTE *)(v16 + 2) == 62)
        {
          v14 = (char *)(a1 + v9);
          goto LABEL_26;
        }
      }
      v14 = (char *)(v16 + 2);
      LODWORD(v9) = a2;
    }
  }
  else
  {
    v15 = 0;
  }
  snprintf(__str, 8uLL, "%d", v10);
  if (a2 - (int)v9 >= 16 && v14[9] == 58 && v14[12] == 58 && v14[15] == 32)
  {
    v17 = (char *)malloc_type_malloc(0x10uLL, 0xCDF66348uLL);
    v4 = v17;
    if (!v17)
      return v4;
    v18 = *(_QWORD *)v14;
    *(_QWORD *)(v17 + 7) = *(_QWORD *)(v14 + 7);
    *(_QWORD *)v17 = v18;
    v17[15] = 0;
    v49 = asl_core_parse_time(v17, 0);
    if (v49 == -1)
    {
      v51 = v4;
    }
    else
    {
      free(v4);
      gmtime_r(&v49, &v50);
      asprintf(&v51, "%d.%02d.%02d %02d:%02d:%02d UTC", v50.tm_year + 1900, v50.tm_mon + 1, v50.tm_mday, v50.tm_hour, v50.tm_min, v50.tm_sec);
    }
    v14 += 16;
    LODWORD(v9) = v9 + 16;
  }
  if (a4 == 4)
  {
    v19 = asl_msg_new(0);
    v4 = (char *)v19;
    if (v19)
    {
      asl_msg_set_key_val(v19, "Message", v14);
      asl_msg_set_key_val(v4, "Level", __str);
      v20 = "PID";
      v21 = "0";
      v22 = v4;
LABEL_41:
      asl_msg_set_key_val(v22, v20, v21);
      return v4;
    }
    return v4;
  }
  if (a4 == 3 && (v23 = strchr(v14, 32)) != 0)
  {
    v24 = v23;
    v25 = (_DWORD)v23 - (_DWORD)v14;
    v26 = (_DWORD)v23 - (_DWORD)v14 + 1;
    v27 = malloc_type_malloc(v26, 0x72F0938DuLL);
    if (!v27)
      return 0;
    v28 = v27;
    memcpy(v27, v14, v25);
    v28[v25] = 0;
    v14 = v24 + 1;
    LODWORD(v9) = v26 + v9;
  }
  else
  {
    v28 = 0;
  }
  v29 = strchr(v14, 58);
  v30 = strchr(v14, 91);
  if (v29)
  {
    v31 = v30;
    if (v30 && v30 < v29 && *(v29 - 1) == 93)
    {
      v32 = ((_DWORD)v30 - (_DWORD)v14);
      v33 = malloc_type_malloc(((uint64_t)&_mh_execute_header + (v32 << 32)) >> 32, 0x8BE0C0ABuLL);
      if (!v33)
        return 0;
      v34 = v33;
      v48 = v15;
      v35 = v28;
      memcpy(v33, v14, (int)v32);
      v34[(int)v32] = 0;
      v36 = v31 + 1;
      v37 = malloc_type_malloc((int)v29 - ((int)v31 + 1), 0x30D079B3uLL);
      if (!v37)
        return 0;
      v38 = v37;
      v39 = ~(_DWORD)v36 + (_DWORD)v29;
      memcpy(v37, v36, v39);
      v38[v39] = 0;
      v40 = (_DWORD)v29 - (_DWORD)v14;
    }
    else
    {
      v40 = (_DWORD)v29 - (_DWORD)v14;
      v41 = malloc_type_malloc(((uint64_t)&_mh_execute_header + ((v29 - v14) << 32)) >> 32, 0xDFCD5118uLL);
      if (!v41)
        return 0;
      v34 = v41;
      v48 = v15;
      v35 = v28;
      memcpy(v41, v14, v40);
      v38 = 0;
      v34[v40] = 0;
    }
    v14 = v29 + 1;
    LODWORD(v9) = v9 + v40 + 1;
    v28 = v35;
    v15 = v48;
  }
  else
  {
    v34 = 0;
    v38 = 0;
  }
  if (*v14 == 32)
    v42 = v14 + 1;
  else
    v42 = v14;
  v43 = a2 - (_DWORD)v9 - (*v14 == 32);
  if ((int)v43 >= 1)
  {
    v44 = malloc_type_malloc((v43 + 1), 0xC91C1B06uLL);
    if (v44)
    {
      v45 = v44;
      memcpy(v44, v42, v43);
      v45[v43] = 0;
      goto LABEL_65;
    }
    return 0;
  }
  v45 = 0;
LABEL_65:
  if (!v15)
    v15 = asl_syslog_faciliy_num_to_name(8);
  v46 = asl_msg_new(0);
  v4 = (char *)v46;
  if (v46)
  {
    if (v51)
    {
      asl_msg_set_key_val(v46, "Time", v51);
      free(v51);
    }
    if (v15)
      v47 = (const char *)v15;
    else
      v47 = "user";
    asl_msg_set_key_val(v4, "Facility", v47);
    if (v34)
    {
      asl_msg_set_key_val(v4, "Sender", v34);
      free(v34);
    }
    if (v38)
    {
      asl_msg_set_key_val(v4, "PID", v38);
      free(v38);
    }
    else
    {
      asl_msg_set_key_val(v4, "PID", "-1");
    }
    if (v45)
    {
      asl_msg_set_key_val(v4, "Message", v45);
      free(v45);
    }
    asl_msg_set_key_val(v4, "Level", __str);
    asl_msg_set_key_val(v4, "UID", "-2");
    asl_msg_set_key_val(v4, "GID", "-2");
    if (v28)
    {
      asl_msg_set_key_val(v4, "Host", v28);
      free(v28);
      return v4;
    }
    if (!a3)
      return v4;
    v20 = "Host";
    v22 = v4;
    v21 = a3;
    goto LABEL_41;
  }
  return v4;
}

char *sub_1000074B8(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v10;
  uint64_t v11;
  const char *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  int v17;

  v8 = a4;
  v10 = a2;
  v11 = a1;
  v12 = "NULL";
  if (a1)
    LOBYTE(v12) = a1;
  sub_1000061A0("asl_input_parse: %s\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)v12);
  if (v11)
  {
    if (!v10)
      v10 = strlen((const char *)v11);
    v17 = 0;
    v13 = *(_BYTE *)v11 == 60 || v10 < 12;
    if (!v13 && sscanf((const char *)v11, "%d ", &v17) == 1 && *(_BYTE *)(v11 + 10) == 32 && *(_BYTE *)(v11 + 11) == 91)
    {
      v14 = 11;
      if (*(_BYTE *)v11 == 91)
        v14 = 0;
      v15 = asl_msg_from_string(v11 + v14);
      v11 = v15;
      if (v15 && a3)
        asl_msg_set_key_val(v15, "Host", a3);
    }
    else
    {
      return sub_100006EB4(v11, v10, a3, v8);
    }
  }
  return (char *)v11;
}

void sub_1000075C8(id a1)
{
  strcpy((char *)&qword_10001C0C0, "localhost");
  notify_register_check("com.apple.system.hostname", &dword_10001C028);
}

void sub_1000075FC(uint64_t a1, char *__s1, uint64_t a3)
{
  char v6;
  unsigned __int8 v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 && __s1)
  {
    v6 = *__s1;
    if (*__s1)
    {
      v7 = 0;
      v8 = __s1 + 1;
      do
      {
        v7 ^= v6 ^ (2 * v7);
        v9 = *v8++;
        v6 = v9;
      }
      while (v9);
      v10 = v7;
    }
    else
    {
      v10 = 0;
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v10);
    if (v11)
    {
      while (!*(_QWORD *)v11 || strcmp(__s1, *(const char **)v11))
      {
        v11 = *(_QWORD *)(v11 + 24);
        if (!v11)
          goto LABEL_12;
      }
      v15 = *(_QWORD *)(v11 + 16) + a3;
      ++*(_QWORD *)(v11 + 8);
      *(_QWORD *)(v11 + 16) = v15;
    }
    else
    {
LABEL_12:
      v12 = malloc_type_malloc(0x20uLL, 0x1030040A9292222uLL);
      v13 = strdup(__s1);
      *v12 = v13;
      if (v13)
      {
        v12[1] = 1;
        v12[2] = a3;
        v14 = *(_QWORD *)(a1 + 16);
        v12[3] = *(_QWORD *)(v14 + 8 * v10);
        *(_QWORD *)(v14 + 8 * v10) = v12;
      }
      else
      {
        free(v12);
      }
    }
  }
}

void sub_1000076FC(int a1)
{
  _QWORD block[4];
  int v3;

  if (qword_10001C1C8 != -1)
    dispatch_once(&qword_10001C1C8, &stru_100018E58);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000077B0;
  block[3] = &unk_100018E78;
  v3 = a1;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
}

void sub_100007788(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

uint64_t sub_1000077B0(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;

  if (DWORD2(xmmword_10001E368))
  {
    v2 = (void *)xmmword_10001E368;
  }
  else
  {
    v2 = 0;
    *(_QWORD *)&xmmword_10001E368 = 0;
  }
  result = (uint64_t)reallocf(v2, 4 * (DWORD2(xmmword_10001E368) + 1));
  *(_QWORD *)&xmmword_10001E368 = result;
  if (result)
  {
    v11 = DWORD2(xmmword_10001E368) + 1;
    *(_DWORD *)(result + 4 * SDWORD2(xmmword_10001E368)) = *(_DWORD *)(a1 + 32);
  }
  else
  {
    result = sub_1000061A0("add_lockdown_session: realloc failed\n", v4, v5, v6, v7, v8, v9, v10, v12);
    v11 = 0;
  }
  DWORD2(xmmword_10001E368) = v11;
  HIDWORD(xmmword_10001E368) = v11 + dword_10001C1D8;
  return result;
}

void sub_100007834(int a1)
{
  _QWORD block[4];
  int v3;

  if (qword_10001C1C8 != -1)
    dispatch_once(&qword_10001C1C8, &stru_100018EB8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000078E8;
  block[3] = &unk_100018ED8;
  v3 = a1;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
}

void sub_1000078C0(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

void sub_1000078E8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v1 = DWORD2(xmmword_10001E368);
  if (SDWORD2(xmmword_10001E368) < 1)
    goto LABEL_11;
  v2 = 0;
  v3 = 0;
  v4 = xmmword_10001E368;
  do
  {
    v5 = *(_DWORD *)(v4 + 4 * v2);
    if (v5 != *(_DWORD *)(a1 + 32))
    {
      if (v2 != v3)
      {
        *(_DWORD *)(v4 + 4 * v3) = v5;
        v1 = DWORD2(xmmword_10001E368);
      }
      ++v3;
    }
    ++v2;
  }
  while (v2 < v1);
  if (v3)
  {
    *(_QWORD *)&xmmword_10001E368 = reallocf((void *)xmmword_10001E368, 4 * v3);
    if (!(_QWORD)xmmword_10001E368)
    {
      sub_1000061A0("remove_lockdown_session: realloc failed\n", v6, v7, v8, v9, v10, v11, v12, v13);
      v3 = 0;
    }
  }
  else
  {
LABEL_11:
    free((void *)xmmword_10001E368);
    v3 = 0;
    *(_QWORD *)&xmmword_10001E368 = 0;
  }
  DWORD2(xmmword_10001E368) = v3;
  HIDWORD(xmmword_10001E368) = v3 + dword_10001C1D8;
}

void sub_10000799C(uint64_t a1)
{
  _QWORD block[5];

  if (qword_10001C1C8 != -1)
    dispatch_once(&qword_10001C1C8, &stru_100018F18);
  asl_msg_retain(a1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100007A58;
  block[3] = &unk_100018F38;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
}

void sub_100007A30(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

uint64_t sub_100007A58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __darwin_time_t tv_sec;
  __darwin_suseconds_t tv_usec;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  int v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _DWORD *v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int *v32;
  unint64_t v33;
  int v34;
  int *v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  int v39;
  ssize_t v40;
  char v41;
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
  unint64_t v56;
  uint64_t v57;
  unsigned int v58;
  _DWORD *v59;
  _WORD *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  char v66;
  char v67;
  uint64_t v68;
  char *v69;
  timeval v70;
  size_t __nbyte;

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 32);
  __nbyte = 0;
  if (SDWORD2(xmmword_10001E368) < 1)
    goto LABEL_31;
  if (HIDWORD(qword_10001E458))
  {
    v70.tv_sec = 0;
    *(_QWORD *)&v70.tv_usec = 0;
    if (!gettimeofday(&v70, 0))
    {
      if ((_QWORD)xmmword_10001C1F8)
      {
        tv_sec = v70.tv_sec;
        if (v70.tv_sec <= (uint64_t)xmmword_10001C1F8)
        {
          tv_usec = v70.tv_usec;
        }
        else
        {
          tv_sec = --v70.tv_sec;
          tv_usec = v70.tv_usec + 1000000;
          v70.tv_usec += 1000000;
        }
        v5 = 1000000 * (tv_sec - xmmword_10001C1F8) - SDWORD2(xmmword_10001C1F8) + tv_usec;
        if (v5 < HIDWORD(qword_10001E458))
          usleep(v5);
      }
      else
      {
        tv_usec = v70.tv_usec;
      }
      if (tv_usec > 999999)
      {
        ++v70.tv_sec;
        v70.tv_usec = tv_usec - 1000000;
      }
      xmmword_10001C1F8 = (__int128)v70;
    }
  }
  v6 = (void *)asl_format_message(v2, "std", "lcl", 1, &__nbyte);
  v7 = v6;
  if (!DWORD2(xmmword_10001E368))
  {
    free(v6);
LABEL_31:
    v31 = dword_10001C1D8;
    goto LABEL_34;
  }
  v8 = 0;
  v9 = 0;
  do
  {
    if (write(*(_DWORD *)(xmmword_10001E368 + 4 * v8), v7, __nbyte) < 0)
    {
      v10 = *(_DWORD *)(xmmword_10001E368 + 4 * v8);
      __error();
      v11 = __error();
      strerror(*v11);
      sub_1000061A0("send_to_direct_watchers: lockdown %d write error: %d %s\n", v12, v13, v14, v15, v16, v17, v18, v10);
      close(*(_DWORD *)(xmmword_10001E368 + 4 * v8));
      *(_DWORD *)(xmmword_10001E368 + 4 * v8) = -1;
      v9 = 1;
    }
    ++v8;
  }
  while (v8 < DWORD2(xmmword_10001E368));
  free(v7);
  if (!v9)
    goto LABEL_31;
  v19 = DWORD2(xmmword_10001E368);
  v20 = (_DWORD *)xmmword_10001E368;
  if (SDWORD2(xmmword_10001E368) < 1)
    goto LABEL_32;
  v21 = 0;
  v22 = 0;
  do
  {
    v23 = v20[v21];
    if ((v23 & 0x80000000) == 0)
    {
      if (v21 != v22)
      {
        v20[v22] = v23;
        v19 = DWORD2(xmmword_10001E368);
      }
      ++v22;
    }
    ++v21;
  }
  while (v21 < v19);
  if (v22)
  {
    *(_QWORD *)&xmmword_10001E368 = reallocf(v20, 4 * v22);
    if (!(_QWORD)xmmword_10001E368)
    {
      sub_1000061A0("sweep_lockdown_session_fds: realloc failed\n", v24, v25, v26, v27, v28, v29, v30, v66);
      v22 = 0;
    }
  }
  else
  {
LABEL_32:
    free(v20);
    v22 = 0;
    *(_QWORD *)&xmmword_10001E368 = 0;
  }
  v31 = dword_10001C1D8;
  DWORD2(xmmword_10001E368) = v22;
  HIDWORD(xmmword_10001E368) = dword_10001C1D8 + v22;
LABEL_34:
  if (!v31)
  {
    qword_10001C208 = 0;
    return asl_msg_release(*(_QWORD *)(v1 + 32));
  }
  if (!qword_10001C208)
  {
    dword_10001C1D8 = 0;
    return asl_msg_release(*(_QWORD *)(v1 + 32));
  }
  v69 = (char *)asl_msg_to_string(v2, &__nbyte);
  if (v69)
  {
    HIDWORD(__nbyte) = bswap32(__nbyte);
    v32 = &dword_10001C000;
    if (!dword_10001C1D8)
    {
      free(v69);
      return asl_msg_release(*(_QWORD *)(v1 + 32));
    }
    v68 = v1;
    v33 = 0;
    v34 = 0;
    do
    {
      if ((unint64_t)send(*(_DWORD *)(qword_10001C208 + 4 * v33), (char *)&__nbyte + 4, 4uLL, 0) >= 4)
      {
        if ((_DWORD)__nbyte)
        {
          v35 = v32;
          v36 = 0;
          v37 = 0;
          while (2)
          {
            if (v36 <= 0x65)
              v38 = 101;
            else
              v38 = v36;
            v39 = v38 + 1;
            while (1)
            {
              *__error() = 0;
              v40 = send(*(_DWORD *)(qword_10001C208 + 4 * v33), &v69[v37], __nbyte - v37, 0);
              v41 = v40;
              if (v40 > 0)
                break;
              __error();
              sub_1000061A0("send_to_direct_watchers: send returned %d (errno %d)\n", v42, v43, v44, v45, v46, v47, v48, v41);
              if (*__error() != 35)
              {
                close(*(_DWORD *)(qword_10001C208 + 4 * v33));
                *(_DWORD *)(qword_10001C208 + 4 * v33) = -1;
                v34 = 1;
                v32 = v35;
                goto LABEL_57;
              }
              if (v39 == ++v36)
              {
                sub_1000061A0("send_to_direct_watchers: exceeded EAGAIN limit - closing connection\n", v49, v50, v51, v52, v53, v54, v55, v67);
                goto LABEL_56;
              }
              *__error() = 0;
              if (v37 >= __nbyte)
                goto LABEL_56;
            }
            v37 += v40;
            if (v37 < __nbyte)
              continue;
            break;
          }
LABEL_56:
          v32 = v35;
        }
      }
      else
      {
        close(*(_DWORD *)(qword_10001C208 + 4 * v33));
        *(_DWORD *)(qword_10001C208 + 4 * v33) = -1;
        v34 = 1;
      }
LABEL_57:
      ++v33;
      v56 = v32[118];
    }
    while (v33 < v56);
    free(v69);
    v1 = v68;
    if (v34)
    {
      if ((_DWORD)v56)
      {
        v57 = 0;
        v58 = 0;
        v59 = (_DWORD *)qword_10001C208;
        v60 = (_WORD *)qword_10001C210;
        do
        {
          v61 = v59[v57];
          if ((v61 & 0x80000000) == 0)
          {
            if (v57 != v58)
            {
              v59[v58] = v61;
              v60[v58] = v60[v57];
            }
            ++v58;
          }
          ++v57;
        }
        while (v56 != v57);
        v32[118] = v58;
        if (v58)
        {
          v62 = reallocf(v59, 4 * v58);
          qword_10001C208 = (uint64_t)v62;
          v63 = reallocf(v60, 2 * v58);
          v64 = v63;
          qword_10001C210 = (uint64_t)v63;
          if (!v62 || !v63)
          {
            free(v62);
            qword_10001C208 = 0;
            free(v64);
            qword_10001C210 = 0;
            v32[118] = 0;
          }
          return asl_msg_release(*(_QWORD *)(v1 + 32));
        }
      }
      else
      {
        v32[118] = 0;
        v59 = (_DWORD *)qword_10001C208;
        v60 = (_WORD *)qword_10001C210;
      }
      free(v59);
      qword_10001C208 = 0;
      free(v60);
      qword_10001C210 = 0;
    }
  }
  return asl_msg_release(*(_QWORD *)(v1 + 32));
}

void sub_100007F50(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  dispatch_time_t v46;
  uint64_t v47;

  if (qword_10001C1E8 != -1)
    dispatch_once(&qword_10001C1E8, &stru_100018F78);
  sub_10000799C(a1);
  v2 = xmmword_10001E448;
  LODWORD(v3) = v2 | (asl_check_option(a1, "asl_db_file") != 0);
  v4 = v3 | 2;
  if (asl_check_option(a1, "asl_db_memory"))
    v3 = v4;
  else
    v3 = v3;
  sub_1000081E4(v3);
  if ((v3 & 1) != 0)
  {
    if (asl_store_save(xmmword_10001E3E8, a1))
    {
      v5 = asl_core_error();
      sub_1000061A0("asl_store_save: %s\n", v6, v7, v8, v9, v10, v11, v12, v5);
      asl_store_release(xmmword_10001E3E8);
      *(_QWORD *)&xmmword_10001E3E8 = 0;
      sub_1000081E4(v3);
      if (asl_store_save(xmmword_10001E3E8, a1))
      {
        v13 = asl_core_error();
        sub_1000061A0("(retry) asl_store_save: %s\n", v14, v15, v16, v17, v18, v19, v20, v13);
        asl_store_release(xmmword_10001E3E8);
        *(_QWORD *)&xmmword_10001E3E8 = 0;
        LODWORD(xmmword_10001E448) = xmmword_10001E448 | 2;
        if (!*((_QWORD *)&xmmword_10001E3E8 + 1)
          && asl_memory_open(DWORD2(xmmword_10001E448), HIDWORD(xmmword_10001E448), (_QWORD *)&xmmword_10001E3E8 + 1))
        {
          v21 = asl_core_error();
          sub_1000061A0("asl_memory_open: %s\n", v22, v23, v24, v25, v26, v27, v28, v21);
        }
        v3 = v4;
      }
    }
  }
  v47 = 0;
  if ((v3 & 2) != 0)
  {
    v47 = 0;
    if (asl_memory_save(*((uint64_t *)&xmmword_10001E3E8 + 1), a1, (uint64_t)&v47))
    {
      v29 = asl_core_error();
      sub_1000061A0("asl_memory_save: %s\n", v30, v31, v32, v33, v34, v35, v36, v29);
      asl_memory_close(*((dispatch_object_t **)&xmmword_10001E3E8 + 1));
      *((_QWORD *)&xmmword_10001E3E8 + 1) = 0;
      sub_1000081E4(v3);
      v47 = 0;
      if (asl_memory_save(*((uint64_t *)&xmmword_10001E3E8 + 1), a1, (uint64_t)&v47))
      {
        v37 = asl_core_error();
        sub_1000061A0("(retry) asl_memory_save: %s\n", v38, v39, v40, v41, v42, v43, v44, v37);
        asl_memory_close(*((dispatch_object_t **)&xmmword_10001E3E8 + 1));
        *((_QWORD *)&xmmword_10001E3E8 + 1) = 0;
      }
    }
  }
  if ((byte_10001C1DC & 1) == 0)
  {
    byte_10001C1DC = 1;
    v45 = qword_10001C1E0;
    v46 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v45, v46, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)qword_10001C1E0);
  }
}

void sub_10000816C(id a1)
{
  qword_10001C1E0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10001C1E0, &stru_100018FB8);
  byte_10001C1DC = 0;
}

void sub_1000081B4(id a1)
{
  notify_post("com.apple.system.logger.message");
  dispatch_suspend((dispatch_object_t)qword_10001C1E0);
  byte_10001C1DC = 0;
}

uint64_t sub_1000081E4(uint64_t result)
{
  char v1;
  const char *v2;
  int v3;
  const char *v4;
  char v5;
  char v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
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
  int *v31;
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
  char v46;
  char v47;
  stat v48;

  v1 = result;
  memset(&v48, 0, sizeof(v48));
  if ((result & 1) == 0 || (_QWORD)xmmword_10001E3E8)
  {
LABEL_10:
    if ((v1 & 2) == 0)
      return result;
    goto LABEL_11;
  }
  v2 = (const char *)asl_filesystem_path(0);
  if (stat(v2, &v48))
  {
    v3 = *__error();
    v4 = (const char *)asl_filesystem_path(0);
    v5 = (char)v4;
    if (v3 != 2)
    {
      v31 = __error();
      strerror(*v31);
      return sub_1000061A0("error: can't stat data store %s: %s\n", v32, v33, v34, v35, v36, v37, v38, v5);
    }
    if (mkdir(v4, 0x1EDu))
    {
      v6 = asl_filesystem_path(0);
      v7 = __error();
      strerror(*v7);
      return sub_1000061A0("error: can't create data store %s: %s\n", v8, v9, v10, v11, v12, v13, v14, v6);
    }
  }
  else if ((v48.st_mode & 0xF000) != 0x4000)
  {
    v47 = asl_filesystem_path(0);
    return sub_1000061A0("error: %s is not a directory", v39, v40, v41, v42, v43, v44, v45, v47);
  }
  v15 = asl_store_open_write(0, &xmmword_10001E3E8);
  if ((_DWORD)v15)
  {
    v16 = asl_core_error();
    result = sub_1000061A0("asl_store_open_write: %s\n", v17, v18, v19, v20, v21, v22, v23, v16);
    goto LABEL_10;
  }
  if (DWORD1(xmmword_10001E448))
    v15 = asl_store_max_file_size(xmmword_10001E3E8);
  result = asl_trigger_aslmanager(v15);
  if ((v1 & 2) != 0)
  {
LABEL_11:
    if (!*((_QWORD *)&xmmword_10001E3E8 + 1))
    {
      result = asl_memory_open(DWORD2(xmmword_10001E448), HIDWORD(xmmword_10001E448), (_QWORD *)&xmmword_10001E3E8 + 1);
      if ((_DWORD)result)
      {
        v46 = asl_core_error();
        return sub_1000061A0("asl_memory_open: %s\n", v24, v25, v26, v27, v28, v29, v30, v46);
      }
    }
  }
  return result;
}

uint64_t sub_10000835C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = 0;
  if ((xmmword_10001E448 & 2) == 0 && !*((_QWORD *)&xmmword_10001E3E8 + 1))
  {
    v1 = result;
    v2 = asl_memory_open(DWORD2(xmmword_10001E448), HIDWORD(xmmword_10001E448), (_QWORD *)&xmmword_10001E3E8 + 1);
    if ((_DWORD)v2)
    {
      v3 = asl_core_error(v2);
      return sub_1000061A0("asl_memory_open: %s\n", v4, v5, v6, v7, v8, v9, v10, v3);
    }
    else
    {
      return asl_memory_save(*((uint64_t *)&xmmword_10001E3E8 + 1), v1, (uint64_t)&v11);
    }
  }
  return result;
}

uint64_t sub_1000083D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8, int a9, int a10)
{
  char *v18;
  uuid_t uu;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char out[40];

  if (a4 == -1)
    return 2 * (xmmword_10001E448 & 1);
  memset(out, 0, 37);
  *(_OWORD *)uu = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0;
  if (a10)
  {
    uuid_clear(uu);
    if (proc_pidinfo(a10, 17, 1uLL, uu, 56) == 56)
    {
      v18 = out;
      uuid_unparse(uu, out);
    }
    else
    {
      v18 = "NO ACCESS";
    }
  }
  else
  {
    v18 = 0;
  }
  if (xmmword_10001E448 & 2 | dword_10001E350)
    return asl_memory_match_restricted_uuid(*((uint64_t *)&xmmword_10001E3E8 + 1), a1, a2, a7, a3, a4, a5, a6, a8, a9, (uint64_t)v18);
  else
    return 9999;
}

void sub_100008540()
{
  unint64_t v0;
  int *v1;
  int v2;
  mach_msg_header_t *v3;
  mach_msg_header_t *v4;
  mach_msg_return_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_msg_id_t msgh_id;
  mach_msg_return_t v14;
  _QWORD v15[5];
  _QWORD block[6];
  char __str[264];

  v0 = 0;
  v1 = &dword_100018FE0;
  do
  {
    if (!strcmp(*((const char **)v1 - 1), "_asl_server_message"))
      v2 = *v1;
    else
      v2 = 0;
    if (v0 > 4)
      break;
    ++v0;
    v1 += 4;
  }
  while (!v2);
  qword_10001C1F0 = (uint64_t)dispatch_queue_create("ASL Server Queue", 0);
  while (1)
  {
    do
      v3 = (mach_msg_header_t *)malloc_type_calloc(1uLL, 0x94uLL, 0x1FFE4BA6uLL);
    while (!v3);
    v4 = v3;
    v3->msgh_local_port = dword_10001E358;
    v3->msgh_size = 148;
    v5 = mach_msg(v3, 50333698, 0, 0x94u, dword_10001E354, 0, 0);
    if (v5)
      break;
    msgh_id = v4->msgh_id;
    if (v4->msgh_local_port == dword_10001E35C && msgh_id == 72)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_1000086FC;
      block[3] = &unk_100019038;
      block[4] = v4;
      block[5] = v4;
      dispatch_async((dispatch_queue_t)qword_10001C1F0, block);
    }
    else if (msgh_id == v2)
    {
      sub_100008800(v4);
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 0x40000000;
      v15[2] = sub_1000089D8;
      v15[3] = &unk_100019058;
      v15[4] = v4;
      dispatch_async((dispatch_queue_t)qword_10001C1F0, v15);
    }
  }
  v14 = v5;
  sub_1000061A0("FATAL ERROR: mach_msg() receive failed with status 0x%08x\n", v6, v7, v8, v9, v10, v11, v12, v5);
  snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 1] [PID %u] [Facility syslog] [Message FATAL ERROR: mach_msg() receive failed with status 0x%08x]", dword_10001E37C, v14);
  sub_100006E30((uint64_t)__str);
  sleep(1u);
  abort();
}

void sub_1000086FC(uint64_t a1)
{
  mach_port_name_t v2;
  int v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = dword_10001C218;
  if (dword_10001C218)
  {
    v4 = 0;
    v5 = (_DWORD *)qword_10001C220;
    while (*(_DWORD *)(qword_10001C220 + 4 * v4) != v2)
    {
      if (dword_10001C218 == ++v4)
        goto LABEL_12;
    }
    if (dword_10001C218 == 1)
    {
      free((void *)qword_10001C220);
      qword_10001C220 = 0;
      dword_10001C218 = 0;
    }
    else
    {
      if ((int)v4 + 1 < dword_10001C218)
      {
        do
        {
          v5[v4] = v5[v4 + 1];
          ++v4;
        }
        while (v3 - 1 != (_DWORD)v4);
      }
      dword_10001C218 = v3 - 1;
      qword_10001C220 = (uint64_t)reallocf(v5, 4 * (v3 - 1));
    }
    sub_1000061A0("cancel_session: %u\n", v6, v7, v8, v9, v10, v11, v12, v2);
    mach_port_deallocate(mach_task_self_, v2);
    sub_10000588C();
    v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
  }
LABEL_12:
  mach_port_deallocate(mach_task_self_, v2);
  free(*(void **)(a1 + 40));
}

void sub_100008800(mach_msg_header_t *a1)
{
  mach_msg_header_t *v2;
  voucher_mach_msg_state_s *v3;
  mach_port_t msgh_remote_port;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char __str[256];

  v2 = (mach_msg_header_t *)malloc_type_calloc(1uLL, 0x8CuLL, 0x85FC6FC1uLL);
  v3 = voucher_mach_msg_adopt(a1);
  asl_ipc_server(a1, (uint64_t)v2);
  if ((v2->msgh_bits & 0x80000000) == 0)
  {
    msgh_remote_port = v2[1].msgh_remote_port;
    if (msgh_remote_port)
    {
      if (msgh_remote_port == -305)
      {
        v2->msgh_remote_port = 0;
      }
      else if ((a1->msgh_bits & 0x80000000) != 0)
      {
        a1->msgh_remote_port = 0;
        mach_msg_destroy(a1);
      }
    }
  }
  if (!v2->msgh_remote_port)
  {
    if ((v2->msgh_bits & 0x80000000) == 0)
      goto LABEL_18;
LABEL_17:
    mach_msg_destroy(v2);
    goto LABEL_18;
  }
  v5 = mach_msg(v2, 17, v2->msgh_size, 0, 0, 0xAu, 0);
  if ((v5 - 268435459) <= 1)
    goto LABEL_17;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 268435469)
    {
      sub_1000061A0("ERROR: mach_msg() send failed with MACH_SEND_NO_BUFFER 0x%08x\n", v5, v6, v7, v8, v9, v10, v11, 13);
      snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message mach_msg() send failed with status 0x%08x (MACH_SEND_NO_BUFFER)]");
    }
    else
    {
      if ((_DWORD)v5 != 268435472)
        sub_100013BB0(__str, v5, v6, v7, v8, v9, v10, v11);
      sub_1000061A0("ERROR: mach_msg() send failed with MACH_SEND_INVALID_HEADER 0x%08x\n", v5, v6, v7, v8, v9, v10, v11, 16);
      snprintf(__str, 0x100uLL, "[Sender syslogd] [Level 3] [PID %u] [Facility syslog] [Message mach_msg() send failed with status 0x%08x (MACH_SEND_INVALID_HEADER)]");
    }
    sub_100006E30((uint64_t)__str);
    goto LABEL_17;
  }
LABEL_18:
  voucher_mach_msg_revert(v3);
  free(a1);
  free(v2);
}

void sub_1000089D8(uint64_t a1)
{
  sub_100008800(*(mach_msg_header_t **)(a1 + 32));
}

uint64_t sub_1000089E0(int a1, vm_address_t address, vm_size_t size, uint64_t a4, int a5, char a6, _QWORD *a7, _DWORD *a8, _QWORD *a9, int *a10, _OWORD *a11)
{
  int v11;

  if ((a6 & 1) != 0)
    v11 = -1;
  else
    v11 = 1;
  sub_100008A30(address, size, a4, a5, 0, v11, a7, a8, a9, a10, a11);
  return 0;
}

void sub_100008A30(vm_address_t address, vm_size_t size, uint64_t a3, int a4, int a5, int a6, _QWORD *a7, _DWORD *a8, _QWORD *a9, int *a10, _OWORD *a11)
{
  unsigned int v15;
  int v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uid_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  pid_t v27;
  void *v28;
  void *v29;
  uid_t v30;
  xpc_object_t value;
  void *v32;
  xpc_object_t v33;
  void *v34;
  int v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  audit_token_t *p_atoken;
  unint64_t v40;
  const char *v41;
  int v42;
  uid_t v43;
  _QWORD *v44;
  _DWORD *v45;
  pid_t pidp;
  gid_t egidp;
  uid_t euidp;
  _DWORD sizea[3];
  uint64_t v50;
  char *v51;
  audit_token_t atoken;
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

  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  if (address)
  {
    v15 = size;
    if (*(_BYTE *)(address + (size - 1)))
    {
      vm_deallocate(mach_task_self_, address, size);
      v17 = 1;
LABEL_4:
      *a10 = v17;
      return;
    }
    v44 = a7;
    v45 = a8;
    v18 = asl_msg_list_from_string(address, size);
    vm_deallocate(mach_task_self_, address, v15);
  }
  else
  {
    v44 = a7;
    v45 = a8;
    v18 = asl_msg_list_from_string(0, size);
  }
  v50 = 0;
  euidp = -1;
  memset(sizea, 0, sizeof(sizea));
  pidp = -1;
  egidp = -1;
  v19 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v19;
  audit_token_to_au32(&atoken, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
  if (v18 && *(_DWORD *)(v18 + 8) == 1 && asl_check_option(**(_QWORD **)(v18 + 16), "control"))
  {
    v20 = **(_QWORD **)(v18 + 16);
    v21 = euidp;
    v50 = 0;
    v22 = asl_msg_list_new();
    if (v22)
    {
      v23 = v22;
      v24 = asl_msg_new(0);
      if (v24)
      {
        v25 = v24;
        v43 = v21;
        v51 = 0;
        asl_msg_list_append(v23, v24);
        v26 = asl_msg_count(v20);
        if (v26 != 1 && asl_msg_lookup(v20, "debug", 0, 0))
          goto LABEL_120;
        if (DWORD2(xmmword_10001E428))
          snprintf((char *)&atoken, 0x100uLL, "1 %s", (const char *)qword_10001E438);
        else
          LOWORD(atoken.val[0]) = 48;
        asl_msg_set_key_val(v25, "debug", &atoken);
        if (v26 != 1)
        {
LABEL_120:
          if (asl_msg_lookup(v20, "dbtype", 0, 0))
            goto LABEL_119;
        }
        v37 = ((xmmword_10001E448 >> 1) & 1) + (xmmword_10001E448 & 1);
        if (v37)
        {
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          memset(&atoken, 0, sizeof(atoken));
          if ((xmmword_10001E448 & 1) != 0)
          {
            __strncat_chk(&atoken, "file", 4, 256);
            if (v37 >= 2)
              __strncat_chk(&atoken, " ", 1, 256);
            v38 = 2;
          }
          else
          {
            v38 = 1;
          }
          if ((xmmword_10001E448 & 2) != 0)
          {
            p_atoken = &atoken;
            __strncat_chk(&atoken, "memory", 6, 256);
            if (v38 < v37)
            {
              p_atoken = &atoken;
              __strncat_chk(&atoken, " ", 1, 256);
            }
          }
          else
          {
            p_atoken = &atoken;
          }
        }
        else
        {
          p_atoken = (audit_token_t *)"unknown";
        }
        asl_msg_set_key_val(v25, "dbtype", p_atoken);
        if (v26 == 1)
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", DWORD1(xmmword_10001E448));
          asl_msg_set_key_val(v25, "db_file_max", &atoken);
        }
        else
        {
LABEL_119:
          if (!asl_msg_lookup(v20, "db_file_max", 0, 0))
          {
            snprintf((char *)&atoken, 0x100uLL, "%u", DWORD1(xmmword_10001E448));
            asl_msg_set_key_val(v25, "db_file_max", &atoken);
          }
          if (asl_msg_lookup(v20, "db_memory_max", 0, 0))
            goto LABEL_63;
        }
        snprintf((char *)&atoken, 0x100uLL, "%u", DWORD2(xmmword_10001E448));
        asl_msg_set_key_val(v25, "db_memory_max", &atoken);
        if (v26 == 1)
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(xmmword_10001E448));
          asl_msg_set_key_val(v25, "db_memory_str_max", &atoken);
LABEL_66:
          snprintf((char *)&atoken, 0x100uLL, "%u", qword_10001E458);
          asl_msg_set_key_val(v25, "mps_limit", &atoken);
          if (v26 == 1)
          {
            snprintf((char *)&atoken, 0x100uLL, "%llu", (_QWORD)xmmword_10001E460);
            asl_msg_set_key_val(v25, "bsd_max_dup_time", &atoken);
LABEL_71:
            snprintf((char *)&atoken, 0x100uLL, "%llu", *((_QWORD *)&xmmword_10001E460 + 1));
            asl_msg_set_key_val(v25, "mark_time", &atoken);
            if (v26 == 1)
            {
              snprintf((char *)&atoken, 0x100uLL, "%llu", (_QWORD)xmmword_10001E470);
              asl_msg_set_key_val(v25, "utmp_ttl", &atoken);
LABEL_76:
              snprintf((char *)&atoken, 0x100uLL, "%lld", (_QWORD)xmmword_10001E388);
              asl_msg_set_key_val(v25, "memory_size", &atoken);
              if (v26 == 1)
              {
                snprintf((char *)&atoken, 0x100uLL, "%lld", qword_10001E480);
                asl_msg_set_key_val(v25, "memory_max", &atoken);
LABEL_81:
                snprintf((char *)&atoken, 0x100uLL, "%lld", *((_QWORD *)&xmmword_10001E470 + 1));
                asl_msg_set_key_val(v25, "stats_interval", &atoken);
                if (v26 == 1)
                {
                  snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E380);
                  asl_msg_set_key_val(v25, "work_queue_count", &atoken);
LABEL_86:
                  snprintf((char *)&atoken, 0x100uLL, "%d", DWORD2(xmmword_10001E388));
                  asl_msg_set_key_val(v25, "asl_queue_count", &atoken);
                  if (v26 == 1)
                  {
                    snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_10001E388));
                    asl_msg_set_key_val(v25, "bsd_queue_count", &atoken);
LABEL_91:
                    snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E34C);
                    asl_msg_set_key_val(v25, "client_count", &atoken);
                    if (v26 == 1)
                    {
                      snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E350);
                      asl_msg_set_key_val(v25, "disaster_occurred", &atoken);
LABEL_96:
                      snprintf((char *)&atoken, 0x100uLL, "%d", DWORD2(xmmword_10001E368));
                      asl_msg_set_key_val(v25, "lockdown_session_count", &atoken);
                      if (v26 == 1)
                      {
                        snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(qword_10001E458));
                        asl_msg_set_key_val(v25, "remote_delay_time", &atoken);
LABEL_101:
                        snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_10001E368));
                        asl_msg_set_key_val(v25, "watchers_active", &atoken);
LABEL_102:
                        if (dword_10001E400)
                        {
                          v40 = 0;
                          do
                          {
                            if (v26 == 1
                              || !asl_msg_lookup(v20, **(_QWORD **)(*((_QWORD *)&xmmword_10001E408 + 1) + 8 * v40), 0, 0))
                            {
                              if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)&xmmword_10001E408 + 1) + 8 * v40) + 8))
                                v41 = "enabled";
                              else
                                v41 = "disabled";
                              snprintf((char *)&atoken, 0x100uLL, "%s", v41);
                              asl_msg_set_key_val(v25, **(_QWORD **)(*((_QWORD *)&xmmword_10001E408 + 1) + 8 * v40), &atoken);
                            }
                            ++v40;
                          }
                          while (v40 < dword_10001E400);
                        }
                        sub_10000252C(v20, v25, v26 == 1);
                        if (!asl_msg_lookup(v20, "action", &v51, 0))
                        {
                          if (v43)
                            v42 = -1;
                          else
                            v42 = sub_100001BF4(v51);
                          snprintf((char *)&atoken, 0x100uLL, "%d", v42);
                          asl_msg_set_key_val(v25, "action", &atoken);
                        }
                        asl_msg_release(v25);
                        v35 = 0;
                        v50 = v23;
                        goto LABEL_31;
                      }
LABEL_98:
                      if (!asl_msg_lookup(v20, "remote_delay_time", 0, 0))
                      {
                        snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(qword_10001E458));
                        asl_msg_set_key_val(v25, "remote_delay_time", &atoken);
                      }
                      if (asl_msg_lookup(v20, "watchers_active", 0, 0))
                        goto LABEL_102;
                      goto LABEL_101;
                    }
LABEL_93:
                    if (!asl_msg_lookup(v20, "disaster_occurred", 0, 0))
                    {
                      snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E350);
                      asl_msg_set_key_val(v25, "disaster_occurred", &atoken);
                    }
                    if (asl_msg_lookup(v20, "lockdown_session_count", 0, 0))
                      goto LABEL_98;
                    goto LABEL_96;
                  }
LABEL_88:
                  if (!asl_msg_lookup(v20, "bsd_queue_count", 0, 0))
                  {
                    snprintf((char *)&atoken, 0x100uLL, "%d", HIDWORD(xmmword_10001E388));
                    asl_msg_set_key_val(v25, "bsd_queue_count", &atoken);
                  }
                  if (asl_msg_lookup(v20, "client_count", 0, 0))
                    goto LABEL_93;
                  goto LABEL_91;
                }
LABEL_83:
                if (!asl_msg_lookup(v20, "work_queue_count", 0, 0))
                {
                  snprintf((char *)&atoken, 0x100uLL, "%d", dword_10001E380);
                  asl_msg_set_key_val(v25, "work_queue_count", &atoken);
                }
                if (asl_msg_lookup(v20, "asl_queue_count", 0, 0))
                  goto LABEL_88;
                goto LABEL_86;
              }
LABEL_78:
              if (!asl_msg_lookup(v20, "memory_max", 0, 0))
              {
                snprintf((char *)&atoken, 0x100uLL, "%lld", qword_10001E480);
                asl_msg_set_key_val(v25, "memory_max", &atoken);
              }
              if (asl_msg_lookup(v20, "stats_interval", 0, 0))
                goto LABEL_83;
              goto LABEL_81;
            }
LABEL_73:
            if (!asl_msg_lookup(v20, "utmp_ttl", 0, 0))
            {
              snprintf((char *)&atoken, 0x100uLL, "%llu", (_QWORD)xmmword_10001E470);
              asl_msg_set_key_val(v25, "utmp_ttl", &atoken);
            }
            if (asl_msg_lookup(v20, "memory_size", 0, 0))
              goto LABEL_78;
            goto LABEL_76;
          }
LABEL_68:
          if (!asl_msg_lookup(v20, "bsd_max_dup_time", 0, 0))
          {
            snprintf((char *)&atoken, 0x100uLL, "%llu", (_QWORD)xmmword_10001E460);
            asl_msg_set_key_val(v25, "bsd_max_dup_time", &atoken);
          }
          if (asl_msg_lookup(v20, "mark_time", 0, 0))
            goto LABEL_73;
          goto LABEL_71;
        }
LABEL_63:
        if (!asl_msg_lookup(v20, "db_memory_str_max", 0, 0))
        {
          snprintf((char *)&atoken, 0x100uLL, "%u", HIDWORD(xmmword_10001E448));
          asl_msg_set_key_val(v25, "db_memory_str_max", &atoken);
        }
        if (asl_msg_lookup(v20, "mps_limit", 0, 0))
          goto LABEL_68;
        goto LABEL_66;
      }
      asl_msg_list_release(v23);
    }
    v35 = 9;
    goto LABEL_31;
  }
  v27 = pidp;
  if (pidp <= 0)
  {
    v30 = euidp;
  }
  else
  {
    v28 = (void *)xpc_copy_entitlement_for_token(0, a11);
    if (v28)
    {
      v29 = v28;
      if (xpc_dictionary_get_BOOL(v28, "com.apple.asl.access_as_root"))
      {
        euidp = 0;
      }
      else
      {
        value = xpc_dictionary_get_value(v29, "com.apple.asl.access_as_uid");
        if (value)
        {
          v32 = value;
          if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_int64)
            euidp = xpc_int64_get_value(v32);
        }
        v33 = xpc_dictionary_get_value(v29, "com.apple.asl.access_as_gid");
        if (v33)
        {
          v34 = v33;
          if (xpc_get_type(v33) == (xpc_type_t)&_xpc_type_int64)
            egidp = xpc_int64_get_value(v34);
        }
      }
      xpc_release(v29);
    }
    v30 = euidp;
    if (!euidp)
      v27 = 0;
  }
  v35 = sub_1000083D8(v18, (uint64_t)&v50, a3, a4, a5, a6, (uint64_t)a9, v30, egidp, v27);
LABEL_31:
  *a10 = v35;
  asl_msg_list_release(v18);
  if (*a10 == 2)
  {
    if (v50)
      asl_msg_list_release(v50);
  }
  else
  {
    sizea[0] = 0;
    v36 = (void *)asl_msg_list_to_string(v50, sizea);
    asl_msg_list_release(v50);
    if (v36 && sizea[0])
    {
      if (vm_allocate(mach_task_self_, (vm_address_t *)&sizea[1], sizea[0], 1358954497))
      {
        free(v36);
        v17 = 9999;
        goto LABEL_4;
      }
      memmove(*(void **)&sizea[1], v36, sizea[0]);
      free(v36);
      *v44 = *(_QWORD *)&sizea[1];
      *v45 = sizea[0];
    }
  }
}

uint64_t sub_1000097B8(int a1, vm_address_t address, vm_size_t size, uint64_t a4, int a5, int a6, int a7, _QWORD *a8, _DWORD *a9, __int128 a10, _OWORD *a11)
{
  sub_100008A30(address, size, a4, a5, a6, a7, a8, a9, (_QWORD *)a10, *((int **)&a10 + 1), a11);
  return 0;
}

uint64_t sub_10000980C(int a1, vm_address_t address, uint64_t size, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  vm_size_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  unsigned int v22;
  unint64_t v23;
  _QWORD block[5];
  int v26;
  uid_t v27;
  gid_t v28;
  pid_t v29;
  pid_t pidp;
  gid_t egidp;
  uid_t euidp;
  audit_token_t __str[8];

  if (address)
  {
    v8 = size;
    v10 = size;
    if (*(_BYTE *)(address + (size - 1)))
    {
LABEL_10:
      vm_deallocate(mach_task_self_, address, v10);
      return 0;
    }
    sub_1000061A0("__asl_server_message: %s\n", address, size, (uint64_t)a4, a5, a6, a7, a8, address);
    if ((uint64_t)(xmmword_10001E388 + v10) > qword_10001E480)
    {
      sub_1000061A0("Server queue dropped message.  message size %u  queue size %lld  max %lld\n", v12, v13, v14, v15, v16, v17, v18, v8);
      snprintf((char *)__str, 0x100uLL, "[Sender syslogd] [Level 2] [PID %u] [Message Received message size %u overflows work queue (size %lld limit %lld) - dropping message] [UID 0] [UID 0] [Facility syslog]", dword_10001E37C, v8, (_QWORD)xmmword_10001E388, qword_10001E480);
      sub_100006E30((uint64_t)__str);
      goto LABEL_10;
    }
    v19 = malloc_type_malloc(v10, 0x7CE31C45uLL);
    if (!v19)
      goto LABEL_10;
    v20 = v19;
    memcpy(v19, (const void *)address, v10);
    vm_deallocate(mach_task_self_, address, v10);
    egidp = -1;
    euidp = -1;
    pidp = -1;
    v21 = a4[1];
    *(_OWORD *)__str[0].val = *a4;
    *(_OWORD *)&__str[0].val[4] = v21;
    audit_token_to_au32(__str, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
    do
      v22 = __ldxr((unsigned int *)&dword_10001E380);
    while (__stxr(v22 + 1, (unsigned int *)&dword_10001E380));
    do
      v23 = __ldxr((unint64_t *)&xmmword_10001E388);
    while (__stxr(v23 + v10, (unint64_t *)&xmmword_10001E388));
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100009A14;
    block[3] = &unk_100019078;
    block[4] = v20;
    v26 = v8;
    v27 = euidp;
    v28 = egidp;
    v29 = pidp;
    dispatch_async((dispatch_queue_t)qword_10001C1F0, block);
  }
  return 0;
}

void sub_100009A14(uint64_t a1)
{
  void *v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  mach_port_name_t tn;
  char __str[64];

  v1 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 40);
  v2 = *(_DWORD *)(a1 + 44);
  v5 = *(_DWORD *)(a1 + 48);
  v4 = *(_DWORD *)(a1 + 52);
  v6 = asl_msg_from_string(v1);
  free(v1);
  do
    v7 = __ldxr((unint64_t *)&xmmword_10001E388);
  while (__stxr(v7 - v3, (unint64_t *)&xmmword_10001E388));
  do
    v8 = __ldxr((unsigned int *)&dword_10001E380);
  while (__stxr(v8 - 1, (unsigned int *)&dword_10001E380));
  if (v6)
  {
    tn = 0;
    if (!task_name_for_pid(mach_task_self_, v4, &tn))
      sub_100009E54(tn);
    snprintf(__str, 0x40uLL, "%d", v2);
    asl_msg_set_key_val(v6, "UID", __str);
    snprintf(__str, 0x40uLL, "%d", v5);
    asl_msg_set_key_val(v6, "GID", __str);
    snprintf(__str, 0x40uLL, "%d", v4);
    asl_msg_set_key_val(v6, "PID", __str);
    sub_100005F88(v6, 5);
  }
}

uint64_t sub_100009B80(int a1, vm_address_t address, uint64_t size, _DWORD *a4, vm_address_t *a5, _DWORD *a6, int *a7, _OWORD *a8)
{
  unsigned int v9;
  int v11;
  uint64_t v17;
  __int128 v18;
  int v19;
  char *v20;
  vm_size_t v21;
  int v22;
  vm_address_t addressa;
  char *__s;
  mach_port_name_t tn;
  pid_t pidp;
  gid_t egidp;
  uid_t euidp;
  audit_token_t atoken;

  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  if (!address)
    goto LABEL_4;
  v9 = size;
  if (*(_BYTE *)(address + (size - 1)))
  {
    vm_deallocate(mach_task_self_, address, size);
LABEL_4:
    v11 = 1;
LABEL_5:
    *a7 = v11;
    return 0;
  }
  sub_1000061A0("__asl_server_create_aux_link: %s\n", address, size, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, address);
  if ((xmmword_10001E448 & 1) == 0)
  {
    vm_deallocate(mach_task_self_, address, v9);
    v11 = 2;
    goto LABEL_5;
  }
  v17 = asl_msg_from_string(address);
  vm_deallocate(mach_task_self_, address, v9);
  if (v17)
  {
    addressa = 0;
    __s = 0;
    v22 = 0;
    egidp = -1;
    euidp = -1;
    pidp = -1;
    v18 = a8[1];
    *(_OWORD *)atoken.val = *a8;
    *(_OWORD *)&atoken.val[4] = v18;
    audit_token_to_au32(&atoken, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
    tn = 0;
    if (!task_name_for_pid(mach_task_self_, pidp, &tn))
      sub_100009E54(tn);
    snprintf((char *)&atoken, 0x40uLL, "%d", euidp);
    asl_msg_set_key_val(v17, "UID", &atoken);
    snprintf((char *)&atoken, 0x40uLL, "%d", egidp);
    asl_msg_set_key_val(v17, "GID", &atoken);
    snprintf((char *)&atoken, 0x40uLL, "%d", pidp);
    asl_msg_set_key_val(v17, "PID", &atoken);
    *a7 = asl_store_open_aux(xmmword_10001E3E8, v17, &v22, &__s);
    asl_msg_release(v17);
    if (!*a7)
    {
      if (__s)
      {
        v19 = fileport_makeport(v22, a4);
        close(v22);
        v20 = __s;
        if ((v19 & 0x80000000) == 0)
        {
          v21 = strlen(__s) + 1;
          *a6 = v21;
          if (!vm_allocate(mach_task_self_, &addressa, v21, 1358954497))
          {
            memmove((void *)addressa, __s, *a6);
            free(__s);
            *a5 = addressa;
            return 0;
          }
          v20 = __s;
        }
        free(v20);
      }
      else if ((v22 & 0x80000000) == 0)
      {
        close(v22);
      }
      v11 = 9999;
      goto LABEL_5;
    }
  }
  return 0;
}

uint64_t sub_100009E54(uint64_t name)
{
  mach_port_name_t v1;
  int *v2;
  uint64_t v3;
  int v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_port_t previous;

  if ((_DWORD)name)
  {
    v1 = name;
    if (!dword_10001E35C)
      return mach_port_deallocate(mach_task_self_, v1);
    if (dword_10001C218)
    {
      v2 = (int *)qword_10001C220;
      v3 = dword_10001C218;
      while (1)
      {
        v4 = *v2++;
        if (v4 == (_DWORD)name)
          return mach_port_deallocate(mach_task_self_, v1);
        if (!--v3)
        {
          v5 = reallocf((void *)qword_10001C220, 4 * (dword_10001C218 + 1));
          goto LABEL_9;
        }
      }
    }
    v5 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
LABEL_9:
    qword_10001C220 = (uint64_t)v5;
    if (!v5)
      return mach_port_deallocate(mach_task_self_, v1);
    v13 = dword_10001C218;
    v5[dword_10001C218] = v1;
    dword_10001C218 = v13 + 1;
    sub_1000061A0("register_session: %u   PID %d\n", v6, v7, v8, v9, v10, v11, v12, v1);
    previous = 0;
    mach_port_request_notification(mach_task_self_, v1, 72, 0, dword_10001E35C, 0x15u, &previous);
    mach_port_deallocate(mach_task_self_, previous);
    return sub_10000584C();
  }
  return name;
}

uint64_t sub_100009F88(uint64_t a1, __int16 a2, _OWORD *a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[4];
  __int16 v14;
  audit_token_t atoken;
  pid_t pidp;

  pidp = -1;
  v4 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  sub_1000061A0("__asl_server_register_direct_watch: pid %u port %hu\n", v5, v6, v7, v8, v9, v10, v11, pidp);
  if (qword_10001C1C8 != -1)
    dispatch_once(&qword_10001C1C8, &stru_1000190B8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000A094;
  block[3] = &unk_1000190D8;
  v14 = a2;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
  return 0;
}

void sub_10000A06C(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

void sub_10000A094(uint64_t a1)
{
  __int16 v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  _DWORD *v7;
  _WORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  sockaddr v13;

  v1 = *(_WORD *)(a1 + 32);
  if (v1)
  {
    v2 = socket(2, 1, 0);
    if ((v2 & 0x80000000) == 0)
    {
      v3 = v2;
      v13.sa_len = 0;
      *(_QWORD *)&v13.sa_data[6] = 0;
      v13.sa_family = 2;
      *(_WORD *)v13.sa_data = v1;
      *(_DWORD *)&v13.sa_data[2] = 16777343;
      if (!connect(v2, &v13, 0x10u))
      {
        v12 = 1;
        setsockopt(v3, 0xFFFF, 4130, &v12, 4u);
        v12 = 1;
        setsockopt(v3, 6, 1, &v12, 4u);
        v4 = fcntl(v3, 3, 0);
        LODWORD(v5) = v4 | 4;
        if (v4 == -1)
          v5 = 4;
        else
          v5 = v5;
        fcntl(v3, 4, v5);
        if (dword_10001C1D8)
        {
          v6 = dword_10001C1D8 + 1;
          v7 = reallocf((void *)qword_10001C208, 4 * (dword_10001C1D8 + 1));
          qword_10001C208 = (uint64_t)v7;
          v8 = reallocf((void *)qword_10001C210, 2 * v6);
        }
        else
        {
          qword_10001C208 = (uint64_t)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
          v8 = malloc_type_calloc(1uLL, 2uLL, 0x1000040BDFB0063uLL);
          v7 = (_DWORD *)qword_10001C208;
        }
        qword_10001C210 = (uint64_t)v8;
        if (v7 && v8)
        {
          v9 = dword_10001C1D8;
          v7[dword_10001C1D8] = v3;
          v8[v9] = v1;
          v10 = v9 + 1;
          v11 = DWORD2(xmmword_10001E368) + v10;
        }
        else
        {
          close(v3);
          free((void *)qword_10001C208);
          qword_10001C208 = 0;
          free((void *)qword_10001C210);
          v10 = 0;
          qword_10001C210 = 0;
          v11 = SDWORD2(xmmword_10001E368) > 0;
        }
        dword_10001C1D8 = v10;
        HIDWORD(xmmword_10001E368) = v11;
      }
    }
  }
}

uint64_t sub_10000A294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  _QWORD block[4];
  __int16 v11;

  v8 = a2;
  sub_1000061A0("__asl_server_cancel_direct_watch: %hu\n", a2, a3, a4, a5, a6, a7, a8, bswap32(a2) >> 16);
  if (qword_10001C1C8 != -1)
    dispatch_once(&qword_10001C1C8, &stru_100019118);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000A364;
  block[3] = &unk_100019138;
  v11 = v8;
  dispatch_async((dispatch_queue_t)qword_10001C1D0, block);
  return 0;
}

void sub_10000A33C(id a1)
{
  qword_10001C1D0 = (uint64_t)dispatch_queue_create("Direct Watch Queue", 0);
}

void sub_10000A364(uint64_t a1)
{
  int v1;
  uint64_t v2;
  void *v3;
  _DWORD *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v1 = dword_10001C1D8;
  if (dword_10001C1D8)
  {
    v2 = 0;
    v3 = (void *)qword_10001C210;
    while (*(unsigned __int16 *)(qword_10001C210 + 2 * v2) != *(unsigned __int16 *)(a1 + 32))
    {
      if (dword_10001C1D8 == ++v2)
        return;
    }
    if (dword_10001C1D8 == 1)
    {
      free((void *)qword_10001C208);
      qword_10001C208 = 0;
LABEL_13:
      free(v3);
      qword_10001C210 = 0;
      dword_10001C1D8 = 0;
      HIDWORD(xmmword_10001E368) = SDWORD2(xmmword_10001E368) > 0;
      return;
    }
    v4 = (_DWORD *)qword_10001C208;
    if ((int)v2 + 1 < dword_10001C1D8)
    {
      do
      {
        v4[v2] = v4[v2 + 1];
        *((_WORD *)v3 + v2) = *((_WORD *)v3 + v2 + 1);
        ++v2;
      }
      while (v1 - 1 != (_DWORD)v2);
    }
    v5 = v1 - 1;
    dword_10001C1D8 = v1 - 1;
    HIDWORD(xmmword_10001E368) = DWORD2(xmmword_10001E368) + v1 - 1;
    v6 = reallocf(v4, 4 * (v1 - 1));
    qword_10001C208 = (uint64_t)v6;
    v7 = reallocf(v3, 2 * v5);
    v3 = v7;
    qword_10001C210 = (uint64_t)v7;
    if (!v6 || !v7)
    {
      free(v6);
      qword_10001C208 = 0;
      goto LABEL_13;
    }
  }
}

void sub_10000A498(int a1)
{
  ssize_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char *v9;
  unsigned int v10;
  char *v11;
  char *v12;

  v1 = read(a1, (char *)&unk_10001C228 + dword_10001D228, 4096 - dword_10001D228);
  if (v1 >= 1)
  {
    v6 = v1;
    v7 = 0;
    v8 = dword_10001D228;
    v9 = (char *)&unk_10001C228 + dword_10001D228;
    v10 = dword_10001D228 + &unk_10001C228;
    v11 = (char *)&unk_10001C228;
    do
    {
      if (v9[v7] == 10)
      {
        v9[v7] = 0;
        v12 = sub_1000074B8((uint64_t)v11, v10 + v7 - v11, 0, 4, v2, v3, v4, v5);
        sub_100005F88((uint64_t)v12, 4);
        v11 = &v9[v7 + 1];
      }
      ++v7;
    }
    while (v6 > v7);
    if (v11 != (char *)&unk_10001C228)
    {
      __memmove_chk(&unk_10001C228, v11, 4095 - dword_10001D228, 4096);
      dword_10001D228 = v8 + &unk_10001C228 - (_DWORD)v11 + v7;
    }
  }
}

uint64_t sub_10000A594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_10001D230 != -1)
    dispatch_once(&qword_10001D230, &stru_100019178);
  sub_1000061A0("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"klog_in");
  if (dword_10001C02C < 0)
  {
    v10 = open("/dev/klog", 0, 0);
    dword_10001C02C = v10;
    if (v10 < 0)
    {
      v11 = __error();
      strerror(*v11);
      sub_1000061A0("%s: couldn't open %s: %s\n", v12, v13, v14, v15, v16, v17, v18, (char)"klog_in");
      return 0xFFFFFFFFLL;
    }
    if (fcntl(v10, 4, 4) < 0)
    {
      close(dword_10001C02C);
      v8 = 0xFFFFFFFFLL;
      dword_10001C02C = -1;
      v19 = __error();
      strerror(*v19);
      sub_1000061A0("%s: couldn't set O_NONBLOCK for fd %d (%s): %s\n", v20, v21, v22, v23, v24, v25, v26, (char)"klog_in");
      return v8;
    }
    qword_10001D240 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, dword_10001C02C, 0, (dispatch_queue_t)qword_10001D238);
    dispatch_source_set_event_handler((dispatch_source_t)qword_10001D240, &stru_1000191B8);
    dispatch_resume((dispatch_object_t)qword_10001D240);
  }
  return 0;
}

void sub_10000A6DC(id a1)
{
  qword_10001D238 = (uint64_t)dispatch_queue_create("klog_in", 0);
}

void sub_10000A704(id a1)
{
  sub_10000A498(dword_10001C02C);
}

uint64_t sub_10000A710()
{
  uint64_t result;

  if (dword_10001C02C < 0)
    return 1;
  dispatch_source_cancel((dispatch_source_t)qword_10001D240);
  dispatch_release((dispatch_object_t)qword_10001D240);
  qword_10001D240 = 0;
  close(dword_10001C02C);
  result = 0;
  dword_10001C02C = -1;
  return result;
}

uint64_t sub_10000A768()
{
  return 0;
}

uint64_t sub_10000A770(int a1)
{
  uint64_t v2;

  v2 = 0;
  if (a1 == 2)
  {
    asl_memory_statistics(*((uint64_t **)&xmmword_10001E3E8 + 1), &v2);
  }
  else if (a1 == 1)
  {
    asl_store_statistics(xmmword_10001E3E8, &v2);
  }
  return v2;
}

void sub_10000A7CC(int *a1)
{
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  ssize_t v51;
  int v52;
  char *j;
  int v59;
  size_t v60;
  size_t v61;
  size_t v62;
  size_t v63;
  size_t v64;
  size_t v65;
  size_t v66;
  size_t v67;
  size_t v68;
  size_t v69;
  size_t v70;
  size_t v71;
  size_t v72;
  size_t v73;
  size_t v74;
  size_t v75;
  size_t v76;
  size_t v77;
  size_t v78;
  size_t v79;
  size_t v80;
  ssize_t v81;
  uint64_t v82;
  void *v83;
  char *i;
  int v85;
  int v89;
  _BYTE *m;
  unsigned int v91;
  const char *v92;
  size_t v93;
  int v94;
  int v95;
  char *k;
  int v97;
  const char *v98;
  size_t v99;
  const char *v100;
  size_t v101;
  int v102;
  int v103;
  size_t v104;
  size_t v105;
  int v106;
  size_t v107;
  int v108;
  _BOOL4 v109;
  int v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  size_t v114;
  void *v115;
  size_t v116;
  size_t v117;
  int v118;
  void *v119;
  int *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  size_t v128;
  uint32_t v129;
  size_t v130;
  ssize_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  size_t v139;
  size_t v140;
  size_t v141;
  size_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  int *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  void *v168;
  unint64_t v169;
  unint64_t v170;
  int v171;
  int v172;
  unint64_t v173;
  fd_set v174;
  fd_set v175;
  char *v176;
  char __s[1024];
  void *v178;
  unsigned int v179;
  uint64_t v180;
  uint64_t v181;
  void **v182;
  uint64_t v183;
  int out_token[2];
  int v185[5];

  if (!a1)
    goto LABEL_269;
  *(_QWORD *)out_token = 0;
  v1 = a1[1];
  v2 = *a1;
  free(a1);
  sub_1000061A0("%s %d: starting interactive session for %ssocket %d\n", v3, v4, v5, v6, v7, v8, v9, (char)"remote");
  out_token[0] = -1;
  out_token[1] = -1;
  if ((xmmword_10001E448 & 2) != 0)
    v10 = 2;
  else
    v10 = xmmword_10001E448 & 1;
  v167 = v10;
  v173 = 0;
  v181 = 0;
  v182 = 0;
  v180 = 0;
  if ((v1 & 1) != 0)
    sleep(1u);
  v185[0] = 0;
  v183 = 0;
  v179 = 0;
  v178 = 0;
  v176 = 0;
  memset(&v175, 0, sizeof(v175));
  memset(&v174, 0, sizeof(v174));
  strcpy(__s, "\n========================\nASL is here to serve you\n");
  v11 = strlen(__s);
  if (write(v2, __s, v11) < 0)
  {
    close(v2);
    goto LABEL_268;
  }
  if ((v1 & 1) != 0)
  {
    strcpy(__s, "> ");
    v12 = strlen(__s);
    if (write(v2, __s, v12) < 0)
    {
      sub_1000061A0("%s %d: terminating session for %ssocket %d\n", v13, v14, v15, v16, v17, v18, v19, (char)"remote");
      v20 = 0;
      if ((v2 & 0x80000000) == 0)
      {
        v168 = 0;
        LODWORD(v21) = 0;
        goto LABEL_258;
      }
      goto LABEL_264;
    }
  }
  v22 = 0;
  v169 = 0;
  v23 = 0;
  v171 = 1 << v2;
  v170 = v2 >> 5;
  v168 = 0;
  v24 = 1;
  while (1)
  {
    do
    {
      do
      {
LABEL_14:
        v172 = v23;
        v21 = v22;
        if ((v1 & 1) == 0)
        {
          if (v24)
          {
            strcpy(__s, "> ");
            v25 = strlen(__s);
            if (write(v2, __s, v25) < 0)
              goto LABEL_256;
          }
        }
        bzero(__s, 0x400uLL);
        memset(&v175, 0, sizeof(v175));
        if (__darwin_check_fd_set_overflow(v2, &v175, 0))
          v175.fds_bits[v170] |= v171;
        memset(&v174, 0, sizeof(v174));
        if (__darwin_check_fd_set_overflow(v2, &v174, 0))
          v174.fds_bits[v170] |= v171;
        v33 = out_token[1];
        v34 = v2;
        if (out_token[1] != -1)
        {
          if (__darwin_check_fd_set_overflow(out_token[1], &v175, 0))
            *(__int32_t *)((char *)v175.fds_bits + ((v33 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v33;
          v34 = out_token[1];
          if (out_token[1] <= (int)v2)
            v34 = v2;
        }
        v35 = select(v34 + 1, &v175, 0, &v174, 0);
        v24 = 1;
        v22 = v21;
        v23 = v172;
      }
      while (!v35);
      if (v35 < 0)
      {
        __error();
        v151 = __error();
        strerror(*v151);
        sub_1000061A0("%s %d: select %d %s\n", v152, v153, v154, v155, v156, v157, v158, (char)"remote");
        goto LABEL_256;
      }
      if (__darwin_check_fd_set_overflow(v2, &v174, 0) && (v174.fds_bits[v170] & v171) != 0)
      {
        sub_1000061A0("%s %d: error on socket %d\n", v36, v37, v38, v39, v40, v41, v42, (char)"remote");
        goto LABEL_256;
      }
      v43 = out_token[1];
      if (out_token[1] != -1
        && __darwin_check_fd_set_overflow(out_token[1], &v175, 0)
        && ((*(unsigned int *)((char *)v175.fds_bits + ((v43 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v43) & 1) != 0)
      {
        read(out_token[1], v185, 4uLL);
      }
      if (__darwin_check_fd_set_overflow(v2, &v174, 0) && (v174.fds_bits[v170] & v171) != 0)
      {
        sub_1000061A0("%s %d: socket %d reported error\n", v44, v45, v46, v47, v48, v49, v50, (char)"remote");
        goto LABEL_256;
      }
      if (!__darwin_check_fd_set_overflow(v2, &v175, 0) || (v175.fds_bits[v170] & v171) == 0)
        goto LABEL_203;
      v51 = read(v2, __s, 0x3FFuLL);
      if (v51 < 1)
      {
        __error();
        v159 = __error();
        strerror(*v159);
        sub_1000061A0("%s %d: read error on socket %d: %d %s\n", v160, v161, v162, v163, v164, v165, v166, (char)"remote");
        goto LABEL_256;
      }
      if (v51 != 1)
      {
        do
        {
          v52 = __s[v51 - 1];
          if (v52 != 13 && v52 != 10)
            break;
          __s[v51 - 1] = 0;
        }
        while ((unint64_t)v51-- > 2);
      }
      if (*(unsigned __int16 *)__s == 113
        || !(*(_DWORD *)__s ^ 0x74697571 | __s[4])
        || !(*(_DWORD *)__s ^ 0x74697865 | __s[4]))
      {
        strcpy(__s, "Goodbye\n");
        v142 = strlen(__s);
        write(v2, __s, v142);
        close(v2);
        sub_1000061A0("%s %d: terminating session for %ssocket %d\n", v143, v144, v145, v146, v147, v148, v149, (char)"remote");
        goto LABEL_261;
      }
      if (*(unsigned __int16 *)__s == 63 || !(*(_DWORD *)__s ^ 0x706C6568 | __s[4]))
      {
        strcpy(__s, "Commands\n");
        v60 = strlen(__s);
        if (write(v2, __s, v60) < 0)
          goto LABEL_256;
        strcpy(__s, "    quit                 exit session\n");
        v61 = strlen(__s);
        if (write(v2, __s, v61) < 0)
          goto LABEL_256;
        strcpy(__s, "    select [val]         get [set] current database\n");
        v62 = strlen(__s);
        if (write(v2, __s, v62) < 0)
          goto LABEL_256;
        strcpy(__s, "                         val must be \"file\" or \"mem\"\n");
        v63 = strlen(__s);
        if (write(v2, __s, v63) < 0)
          goto LABEL_256;
        strcpy(__s, "    file [on/off]        enable / disable file store\n");
        v64 = strlen(__s);
        if (write(v2, __s, v64) < 0)
          goto LABEL_256;
        strcpy(__s, "    memory [on/off]      enable / disable memory store\n");
        v65 = strlen(__s);
        if (write(v2, __s, v65) < 0)
          goto LABEL_256;
        strcpy(__s, "    stats                database statistics\n");
        v66 = strlen(__s);
        if (write(v2, __s, v66) < 0)
          goto LABEL_256;
        strcpy(__s, "    flush                flush database\n");
        v67 = strlen(__s);
        if (write(v2, __s, v67) < 0)
          goto LABEL_256;
        strcpy(__s, "    dbsize [val]         get [set] database size (# of records)\n");
        v68 = strlen(__s);
        if (write(v2, __s, v68) < 0)
          goto LABEL_256;
        strcpy(__s, "    watch                print new messages as they arrive\n");
        v69 = strlen(__s);
        if (write(v2, __s, v69) < 0)
          goto LABEL_256;
        strcpy(__s, "    stop                 stop watching for new messages\n");
        v70 = strlen(__s);
        if (write(v2, __s, v70) < 0)
          goto LABEL_256;
        strcpy(__s, "    raw                  use raw format for printing messages\n");
        v71 = strlen(__s);
        if (write(v2, __s, v71) < 0)
          goto LABEL_256;
        strcpy(__s, "    std                  use standard format for printing messages\n");
        v72 = strlen(__s);
        if (write(v2, __s, v72) < 0)
          goto LABEL_256;
        strcpy(__s, "    *                    show all log messages\n");
        v73 = strlen(__s);
        if (write(v2, __s, v73) < 0)
          goto LABEL_256;
        strcpy(__s, "    * key val            equality search for messages (single key/value pair)\n");
        v74 = strlen(__s);
        if (write(v2, __s, v74) < 0)
          goto LABEL_256;
        strcpy(__s, "    * op key val         search for matching messages (single key/value pair)\n");
        v75 = strlen(__s);
        if (write(v2, __s, v75) < 0)
          goto LABEL_256;
        strcpy(__s, "    * [op key val] ...   search for matching messages (multiple key/value pairs)\n");
        v76 = strlen(__s);
        if (write(v2, __s, v76) < 0)
          goto LABEL_256;
        strcpy(__s, "                         operators:  =  <  >  ! (not equal)  T (key exists)  R (regex)\n");
        v77 = strlen(__s);
        if (write(v2, __s, v77) < 0)
          goto LABEL_256;
        strcpy(__s, "                         modifiers (must follow operator):\n");
        v78 = strlen(__s);
        if (write(v2, __s, v78) < 0)
          goto LABEL_256;
        strcpy(__s, "                                 C=casefold  N=numeric  S=substring  A=prefix  Z=suffix\n");
        v79 = strlen(__s);
        if (write(v2, __s, v79) < 0)
          goto LABEL_256;
        strcpy(__s, "\n");
        goto LABEL_89;
      }
      if (*(_DWORD *)__s == 1952543859 && *(unsigned __int16 *)&__s[4] == 115)
      {
        v82 = sub_10000A770(v167);
        v83 = (void *)asl_format_message(v82, "raw", "sec", 0, &v179);
        write(v2, v83, v179);
        free(v83);
        asl_msg_release(v82);
        v24 = 1;
        v22 = v21;
        v23 = v172;
        goto LABEL_14;
      }
      if (*(_DWORD *)__s == 1937075302 && *(unsigned __int16 *)&__s[4] == 104)
        goto LABEL_203;
      if (*(_DWORD *)__s == 1701602675 && *(unsigned __int16 *)&__s[4] == 29795)
      {
        for (i = &__s[6]; ; ++i)
        {
          v85 = *i;
          if (v85 != 9 && v85 != 32)
            break;
        }
        if (!*i)
        {
          if (v167 == 1)
          {
            strcpy(__s, "file store\n");
          }
          else if (v167)
          {
            strcpy(__s, "memory store\n");
          }
          else
          {
            strcpy(__s, "no store\n");
          }
          goto LABEL_89;
        }
        if (strncmp(i, "file", 4uLL))
        {
          if (strncmp(i, "mem", 3uLL))
          {
            strcpy(__s, "unknown database type\n");
            goto LABEL_161;
          }
          if ((xmmword_10001E448 & 2) == 0)
          {
            strcpy(__s, "memory database is not enabled\n");
            goto LABEL_89;
          }
          v167 = 2;
LABEL_181:
          strcpy(__s, "OK\n");
          goto LABEL_89;
        }
        if ((xmmword_10001E448 & 1) != 0)
        {
          v167 = 1;
          goto LABEL_181;
        }
        strcpy(__s, "file database is not enabled\n");
LABEL_161:
        v104 = strlen(__s);
        v81 = write(v2, __s, v104);
        v24 = 1;
        v22 = v21;
LABEL_92:
        v23 = v172;
        if (v81 < 0)
          goto LABEL_256;
        goto LABEL_14;
      }
      if (*(_DWORD *)__s == 1701603686)
      {
        for (j = &__s[4]; ; ++j)
        {
          v59 = *j;
          if (v59 != 9 && v59 != 32)
            break;
        }
        if (!*j)
        {
          v92 = (const char *)&unk_100015297;
          if ((xmmword_10001E448 & 1) == 0)
            v92 = "not ";
          snprintf(__s, 0x400uLL, "file database is %senabled\n", v92);
          v93 = strlen(__s);
          if (write(v2, __s, v93) < 0)
            goto LABEL_256;
          v94 = v167;
          if ((xmmword_10001E448 & 1) != 0)
            v94 = 1;
LABEL_149:
          v167 = v94;
          v24 = 1;
          v22 = v21;
          v23 = v172;
          goto LABEL_14;
        }
        if (!strcmp(j, "on"))
        {
          v95 = xmmword_10001E448 | 1;
        }
        else
        {
          if (strcmp(j, "off"))
            goto LABEL_181;
          v95 = xmmword_10001E448 & 0xFFFFFFFE;
        }
        goto LABEL_180;
      }
      if (*(_DWORD *)__s == 1869440365 && *(unsigned __int16 *)&__s[4] == 31090)
      {
        for (k = &__s[6]; ; ++k)
        {
          v97 = *k;
          if (v97 != 9 && v97 != 32)
            break;
        }
        if (!*k)
        {
          v98 = (const char *)&unk_100015297;
          if ((xmmword_10001E448 & 2) == 0)
            v98 = "not ";
          snprintf(__s, 0x400uLL, "memory database is %senabled\n", v98);
          v99 = strlen(__s);
          if (write(v2, __s, v99) < 0)
            goto LABEL_256;
          v94 = v167;
          if ((xmmword_10001E448 & 2) != 0)
            v94 = 2;
          goto LABEL_149;
        }
        if (!strcmp(k, "on"))
        {
          v95 = xmmword_10001E448 | 2;
        }
        else
        {
          if (strcmp(k, "off"))
            goto LABEL_181;
          v95 = xmmword_10001E448 & 0xFFFFFFFD;
        }
LABEL_180:
        LODWORD(xmmword_10001E448) = v95;
        goto LABEL_181;
      }
      if (*(_DWORD *)__s == 1769169508 && *(unsigned __int16 *)&__s[4] == 25978)
      {
        v100 = &__s[6];
        if (!v167)
        {
          strcpy(__s, "no store\n");
          v101 = strlen(__s);
          v81 = write(v2, __s, v101);
          v167 = 0;
LABEL_90:
          v24 = 1;
LABEL_91:
          v22 = v21;
          goto LABEL_92;
        }
        while (1)
        {
          v102 = *(unsigned __int8 *)v100;
          if (v102 != 9 && v102 != 32)
            break;
          ++v100;
        }
        if (*v100)
        {
          v106 = atoi(v100);
          v185[0] = v106;
          if (v167 == 2)
          {
            DWORD2(xmmword_10001E448) = v106;
          }
          else if (v167 == 1)
          {
            DWORD1(xmmword_10001E448) = v106;
          }
          goto LABEL_181;
        }
        if (v167 == 2)
        {
          v103 = DWORD2(xmmword_10001E448);
        }
        else if (v167 == 1)
        {
          v103 = DWORD1(xmmword_10001E448);
        }
        else
        {
          v103 = 0;
        }
        snprintf(__s, 0x400uLL, "DB size %u\n", v103);
LABEL_89:
        v80 = strlen(__s);
        v81 = write(v2, __s, v80);
        goto LABEL_90;
      }
      if (!(*(_DWORD *)__s ^ 0x706F7473 | __s[4]))
      {
        if ((_DWORD)v21)
        {
          notify_cancel(out_token[0]);
          out_token[0] = -1;
          out_token[1] = -1;
          v173 = 0;
          if (v168)
            free(v168);
          strcpy(__s, "OK\n");
          v105 = strlen(__s);
          v81 = write(v2, __s, v105);
          v22 = 0;
          v168 = 0;
          v169 = 0;
          LODWORD(v21) = 0;
        }
        else
        {
          strcpy(__s, "not watching!\n");
          v107 = strlen(__s);
          v81 = write(v2, __s, v107);
          v22 = 0;
        }
        v24 = 1;
        goto LABEL_92;
      }
      if (*(_DWORD *)__s == 6583411)
      {
        v23 = 0;
        v24 = 1;
        v22 = v21;
        goto LABEL_14;
      }
      v24 = 1;
      v22 = v21;
      v23 = 1;
    }
    while (*(_DWORD *)__s == 7823730);
    if (*(_DWORD *)__s == 1668571511 && *(unsigned __int16 *)&__s[4] == 104)
      break;
    v89 = __s[0];
    if (__s[0] - 33 > 0x33 || ((1 << (__s[0] - 33)) & 0x8000038000201) == 0)
    {
      strcpy(__s, "unrecognized command\n");
      v139 = strlen(__s);
      if (write(v2, __s, v139) < 0)
        goto LABEL_256;
      strcpy(__s, "enter \"help\" for help\n");
      goto LABEL_250;
    }
    v180 = 0;
    v181 = 0;
    v182 = 0;
    if (v168)
    {
      free(v168);
      v89 = __s[0];
    }
    for (m = (_BYTE *)((unint64_t)__s | (v89 == 42)); ; ++m)
    {
      v91 = *m;
      if (v91 > 0x51)
      {
        if (v91 == 82 || v91 == 84)
        {
LABEL_201:
          v176 = 0;
          asprintf(&v176, "Q [%s]");
        }
        else if (v91 == 91)
        {
          v176 = 0;
          asprintf(&v176, "Q %s");
        }
        else
        {
LABEL_251:
          v176 = 0;
          asprintf(&v176, "Q [= %s]");
        }
        v168 = (void *)asl_msg_from_string(v176);
        free(v176);
LABEL_203:
        v108 = 0;
        v110 = 1;
        goto LABEL_204;
      }
      if (v91 > 0x3E)
        goto LABEL_251;
      if (((1 << v91) & 0x100000200) == 0)
        break;
    }
    if (((1 << v91) & 0x7000000200000000) != 0)
      goto LABEL_201;
    if (*m)
      goto LABEL_251;
    v108 = 0;
    v168 = 0;
    v109 = v21 == 2;
    v24 = 1;
    if ((v1 & 1) != 0)
    {
      v22 = 2;
      v23 = v172;
      if ((_DWORD)v21 == 2)
        continue;
    }
LABEL_209:
    if ((_DWORD)v21)
      v111 = v169;
    else
      v111 = 0;
    v183 = 0;
    v173 = 0;
    sub_1000083D8((uint64_t)&v180, (uint64_t)&v183, v111, 0, 0, 0, (uint64_t)&v173, 0, 0, 0);
    if (v173 >= v111)
      v112 = v173 + 1;
    else
      v112 = v111;
    if (!v109)
      v112 = v111;
    v169 = v112;
    v113 = v183;
    if (v183)
    {
      if (v172)
      {
        if (v109 && (strcpy(__s, "\n"), v114 = strlen(__s), write(v2, __s, v114) < 0))
        {
          LODWORD(v21) = 2;
        }
        else
        {
          v179 = 0;
          v115 = (void *)asl_msg_list_to_string();
          write(v2, v115, v179);
          free(v115);
          strcpy(__s, "\n");
          v116 = strlen(__s);
          if ((write(v2, __s, v116) & 0x8000000000000000) == 0)
          {
            v113 = v183;
            goto LABEL_238;
          }
        }
LABEL_256:
        sub_1000061A0("%s %d: terminating session for %ssocket %d\n", v26, v27, v28, v29, v30, v31, v32, (char)"remote");
        if ((v2 & 0x80000000) == 0)
        {
          if ((v1 & 1) != 0)
LABEL_258:
            sub_100007834(v2);
LABEL_259:
          close(v2);
        }
LABEL_261:
        if ((_DWORD)v21 == 1)
          dispatch_resume((dispatch_object_t)qword_10001E3D0);
        v20 = v168;
LABEL_264:
        if ((out_token[0] & 0x80000000) == 0)
        {
          v150 = v20;
          notify_cancel(out_token[0]);
          v20 = v150;
        }
        if (v20)
          asl_msg_release(v20);
LABEL_268:
        a1 = 0;
LABEL_269:
        pthread_exit(a1);
      }
      v21 = v21;
      if ((v21 - 1) <= 1)
      {
        strcpy(__s, "\n");
        v117 = strlen(__s);
        if (write(v2, __s, v117) < 0)
          goto LABEL_256;
        v113 = v183;
      }
      strcpy(__s, "\n");
      v185[0] = 0;
      if (*(_DWORD *)(v113 + 8))
      {
        v118 = 0;
        while (1)
        {
          v119 = (void *)asl_format_message(*(_QWORD *)(*(_QWORD *)(v113 + 16) + 8 * v118), "std", "lcl", 1, &v179);
          do
          {
            *__error() = 0;
            if ((write(v2, v119, v179) & 0x80000000) != 0)
            {
              __error();
              v120 = __error();
              strerror(*v120);
              sub_1000061A0("%s %d: %d/%d write data failed: %d %s\n", v121, v122, v123, v124, v125, v126, v127, (char)"remote");
              if (*__error() != 35)
              {
                free(v119);
                asl_msg_list_release(v183);
                v183 = 0;
                goto LABEL_256;
              }
              usleep(0x2710u);
            }
          }
          while (*__error() == 35);
          free(v119);
          if (HIDWORD(qword_10001E458))
            usleep(HIDWORD(qword_10001E458));
          v118 = v185[0] + 1;
          v185[0] = v118;
          v113 = v183;
          if (v118 >= *(_DWORD *)(v183 + 8))
          {
LABEL_238:
            v21 = v21;
            break;
          }
        }
      }
LABEL_239:
      asl_msg_list_release(v113);
      v22 = v21;
      v23 = v172;
      if ((_DWORD)v21 == 1)
      {
        sub_1000076FC(v2);
        dispatch_resume((dispatch_object_t)qword_10001E3D0);
        v22 = 2;
        v23 = v172;
      }
    }
    else
    {
      if ((_DWORD)v21)
      {
        v113 = 0;
        v24 = v108;
        goto LABEL_239;
      }
      strcpy(__s, "-nil-\n");
      v128 = strlen(__s);
      if (write(v2, __s, v128) < 0)
      {
        LODWORD(v21) = 0;
        goto LABEL_256;
      }
      asl_msg_list_release(v183);
      v22 = 0;
      v24 = 1;
      v23 = v172;
    }
  }
  if ((v1 & 1) == 0 && (_DWORD)v21)
  {
    strcpy(__s, "already watching!\n");
LABEL_250:
    v140 = strlen(__s);
    v81 = write(v2, __s, v140);
    goto LABEL_91;
  }
  if ((v1 & 1) != 0)
  {
    dispatch_suspend((dispatch_object_t)qword_10001E3D0);
    v21 = 1;
  }
  else
  {
    v129 = notify_register_file_descriptor("com.apple.system.logger.message", &out_token[1], 0, out_token);
    if (v129)
    {
      snprintf(__s, 0x400uLL, "notify_register_file_descriptor failed: %d\n", v129);
      v130 = strlen(__s);
      v131 = write(v2, __s, v130);
      v22 = v21;
      v23 = v172;
      if (v131 < 0)
      {
        sub_1000061A0("%s %d: terminating session for %ssocket %d\n", v132, v133, v134, v135, v136, v137, v138, (char)"remote");
        if ((v2 & 0x80000000) == 0)
          goto LABEL_259;
        goto LABEL_261;
      }
      goto LABEL_14;
    }
    v21 = 2;
  }
  strcpy(__s, "OK\n");
  v141 = strlen(__s);
  if (write(v2, __s, v141) < 0)
    goto LABEL_256;
  v108 = 2;
  v110 = 2;
LABEL_204:
  v109 = v21 == 2;
  if ((v1 & 1) == 0 || (v24 = 1, v22 = 2, v23 = v172, (_DWORD)v21 != 2))
  {
    if (v168)
    {
      LODWORD(v181) = 1;
      v178 = v168;
      v24 = v110;
      v182 = &v178;
    }
    else
    {
      v168 = 0;
      v24 = v110;
    }
    goto LABEL_209;
  }
  goto LABEL_14;
}

uint64_t sub_10000BEFC(int a1, int a2)
{
  socklen_t v3;
  int v4;
  int v5;
  _DWORD *v6;
  void *v7;
  int *v8;
  uint64_t v9;
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
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  pthread_t v33;
  int v34;
  unsigned int v35;
  socklen_t v36;
  sockaddr v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  pthread_attr_t v45;

  memset(&v45, 0, sizeof(v45));
  v33 = 0;
  if (a2 == 1)
    v3 = 128;
  else
    v3 = 106;
  v36 = v3;
  v37 = (sockaddr)0;
  v38 = 0uLL;
  v39 = 0uLL;
  v40 = 0uLL;
  v41 = 0uLL;
  v42 = 0uLL;
  v43 = 0uLL;
  v44 = 0uLL;
  v4 = accept(a1, &v37, &v36);
  if (v4 == -1)
  {
    v8 = __error();
    strerror(*v8);
    sub_1000061A0("%s: accept: %s\n", v9, v10, v11, v12, v13, v14, v15, (char)"remote");
    return 0;
  }
  v5 = v4;
  v35 = fcntl(v4, 3, 0) & 0xFFFFFFFB;
  if (fcntl(v5, 4, v35) < 0)
  {
    v16 = __error();
    strerror(*v16);
    sub_1000061A0("%s: fcntl: %s\n", v17, v18, v19, v20, v21, v22, v23, (char)"remote");
LABEL_15:
    close(v5);
    return 0;
  }
  v34 = 1;
  setsockopt(v5, 0xFFFF, 4130, &v34, 4u);
  if (a2 == 1)
  {
    v35 = 1;
    setsockopt(v5, 6, 1, &v35, 4u);
  }
  v6 = malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
  if (!v6)
  {
    v24 = __error();
    strerror(*v24);
    sub_1000061A0("%s: malloc: %s\n", v25, v26, v27, v28, v29, v30, v31, (char)"remote");
    goto LABEL_15;
  }
  v7 = v6;
  *v6 = v5;
  if (!a2)
    v6[1] |= 1u;
  pthread_attr_init(&v45);
  pthread_attr_setdetachstate(&v45, 2);
  pthread_create(&v33, &v45, (void *(__cdecl *)(void *))sub_10000A7CC, v7);
  pthread_attr_destroy(&v45);
  return 0;
}

uint64_t sub_10000C100()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
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
  uint64_t v40;
  uint64_t v41;
  _QWORD handler[4];
  int v44;
  int v45;
  sockaddr v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[26];

  v0 = socket(1, 1, 0);
  if ((v0 & 0x80000000) != 0)
  {
    v2 = __error();
    strerror(*v2);
    sub_1000061A0("%s: socket: %s\n", v3, v4, v5, v6, v7, v8, v9, (char)"remote");
    return 0xFFFFFFFFLL;
  }
  v1 = v0;
  v45 = 1;
  if (setsockopt(v0, 0xFFFF, 512, &v45, 4u) < 0)
  {
    v10 = __error();
    strerror(*v10);
    sub_1000061A0("%s: setsockopt: %s\n", v11, v12, v13, v14, v15, v16, v17, (char)"remote");
LABEL_12:
    close(v1);
    return 0xFFFFFFFFLL;
  }
  mkdir("/var/run/lockdown", 0x1FFu);
  v46 = (sockaddr)0;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  memset(v51, 0, sizeof(v51));
  v46.sa_family = 1;
  __strlcpy_chk(v46.sa_data, "/var/run/lockdown/syslog.sock", 104, 104);
  unlink(v46.sa_data);
  if (bind(v1, &v46, 0x69u) < 0)
  {
    v18 = __error();
    strerror(*v18);
    sub_1000061A0("%s: bind: %s\n", v19, v20, v21, v22, v23, v24, v25, (char)"remote");
    goto LABEL_12;
  }
  if (fcntl(v1, 4, 4) < 0)
  {
    v26 = __error();
    strerror(*v26);
    sub_1000061A0("%s: fcntl: %s\n", v27, v28, v29, v30, v31, v32, v33, (char)"remote");
    goto LABEL_12;
  }
  if (listen(v1, 5) < 0)
  {
    v34 = __error();
    strerror(*v34);
    sub_1000061A0("%s: listen: %s\n", v35, v36, v37, v38, v39, v40, v41, (char)"remote");
    goto LABEL_12;
  }
  chmod("/var/run/lockdown/syslog.sock", 0x1B6u);
  qword_10001D250 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v1, 0, (dispatch_queue_t)qword_10001D248);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10000C354;
  handler[3] = &unk_1000191D8;
  v44 = v1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10001D250, handler);
  dispatch_resume((dispatch_object_t)qword_10001D250);
  return v1;
}

uint64_t sub_10000C354(uint64_t a1)
{
  return sub_10000BEFC(*(_DWORD *)(a1 + 32), 0);
}

uint64_t sub_10000C360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10001D258 != -1)
    dispatch_once(&qword_10001D258, &stru_100019218);
  sub_1000061A0("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"remote");
  dword_10001C030 = sub_10000C100();
  return 0;
}

void sub_10000C3C8(id a1)
{
  qword_10001D248 = (uint64_t)dispatch_queue_create("remote", 0);
}

uint64_t sub_10000C3F0()
{
  if ((dword_10001C030 & 0x80000000) == 0)
    close(dword_10001C030);
  dword_10001C030 = -1;
  return 0;
}

uint64_t sub_10000C424()
{
  return 0;
}

uint64_t sub_10000C42C()
{
  _launch_data *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _launch_data *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _launch_data *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  kern_return_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  kern_return_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  kern_return_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v0 = launch_data_new_string("CheckIn");
  qword_10001E360 = (uint64_t)launch_msg(v0);
  launch_data_free(v0);
  if (!qword_10001E360)
  {
    sub_1000061A0("%d launchd checkin failed\n", v1, v2, v3, v4, v5, v6, v7, dword_10001E37C);
    goto LABEL_16;
  }
  v8 = launch_data_dict_lookup((const launch_data_t)qword_10001E360, "MachServices");
  if (!v8)
  {
    sub_1000061A0("%d launchd lookup of LAUNCH_JOBKEY_MACHSERVICES failed\n", v9, v10, v11, v12, v13, v14, v15, dword_10001E37C);
    goto LABEL_16;
  }
  v16 = launch_data_dict_lookup(v8, "com.apple.system.logger");
  if (!v16)
  {
    sub_1000061A0("%d launchd lookup of SERVICE_NAME failed\n", v17, v18, v19, v20, v21, v22, v23, dword_10001E37C);
    goto LABEL_16;
  }
  dword_10001E358 = launch_data_get_machport(v16);
  v24 = mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_10001E35C);
  if (v24)
  {
    sub_1000061A0("mach_port_allocate dead_session_port failed: %d", v25, v26, v27, v28, v29, v30, v31, v24);
    goto LABEL_16;
  }
  v32 = mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10001E354);
  if (v32)
  {
    sub_1000061A0("mach_port_allocate listen_set failed: %d", v33, v34, v35, v36, v37, v38, v39, v32);
    goto LABEL_16;
  }
  v40 = mach_port_move_member(mach_task_self_, dword_10001E358, dword_10001E354);
  if (v40)
  {
    sub_1000061A0("mach_port_move_member server_port failed: %d", v41, v42, v43, v44, v45, v46, v47, v40);
    goto LABEL_16;
  }
  result = mach_port_move_member(mach_task_self_, dword_10001E35C, dword_10001E354);
  if ((_DWORD)result)
  {
    sub_1000061A0("mach_port_move_member dead_session_port failed (%u)", v49, v50, v51, v52, v53, v54, v55, result);
LABEL_16:
    exit(1);
  }
  return result;
}

uint64_t sub_10000C590(int a1, const char *a2)
{
  _os_nospin_lock_lock(&unk_10001E348);
  DWORD2(xmmword_10001E428) = a1;
  free((void *)qword_10001E438);
  qword_10001E438 = 0;
  if (a2)
    qword_10001E438 = (uint64_t)strdup(a2);
  return _os_nospin_lock_unlock(&unk_10001E348);
}

uint64_t sub_10000C5F4(int a1, int a2, int a3, int a4)
{
  char v8;

  pthread_mutex_lock((pthread_mutex_t *)qword_10001E398);
  v8 = xmmword_10001E448;
  if ((xmmword_10001E448 & 1) != 0)
  {
    asl_store_close(xmmword_10001E3E8);
    *(_QWORD *)&xmmword_10001E3E8 = 0;
    v8 = xmmword_10001E448;
  }
  if ((v8 & 2) != 0)
  {
    asl_memory_close(*((dispatch_object_t **)&xmmword_10001E3E8 + 1));
    *((_QWORD *)&xmmword_10001E3E8 + 1) = 0;
  }
  LODWORD(xmmword_10001E448) = a1;
  DWORD1(xmmword_10001E448) = a2;
  DWORD2(xmmword_10001E448) = a3;
  HIDWORD(xmmword_10001E448) = a4;
  return pthread_mutex_unlock((pthread_mutex_t *)qword_10001E398);
}

void sub_10000C67C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  const char *v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  utmpx v8;
  char __str[256];
  int v10[2];

  *(_QWORD *)v10 = 0x1500000001;
  if (!(_DWORD)a1)
  {
    v6 = asl_msg_new(a1);
    if (!v6)
      return;
    v2 = v6;
    asl_msg_set_key_val(v6, "Sender", "syslogd");
    asl_msg_set_key_val(v2, "Facility", "daemon");
    asl_msg_set_key_val(v2, "Level", "Notice");
    asl_msg_set_key_val(v2, "UID", "0");
    asl_msg_set_key_val(v2, "GID", "0");
    snprintf(__str, 0x100uLL, "%u", dword_10001E37C);
    asl_msg_set_key_val(v2, "PID", __str);
    v4 = "Message";
    v5 = "--- syslogd restarted ---";
    goto LABEL_10;
  }
  bzero(&v8, 0x280uLL);
  v8.ut_type = 2;
  v8.ut_pid = 1;
  v7 = 16;
  if (sysctl(v10, 2u, &v8.ut_tv, &v7, 0, 0) < 0)
    gettimeofday(&v8.ut_tv, 0);
  pututxline(&v8);
  v1 = asl_msg_new(0);
  if (v1)
  {
    v2 = v1;
    asl_msg_set_key_val(v1, "Sender", "bootlog");
    asl_msg_set_key_val(v2, "Facility", "com.apple.system.utmpx");
    asl_msg_set_key_val(v2, "Level", "Notice");
    asl_msg_set_key_val(v2, "UID", "0");
    asl_msg_set_key_val(v2, "GID", "0");
    asl_msg_set_key_val(v2, "PID", "0");
    snprintf(__str, 0x100uLL, "BOOT_TIME %lu %u", v8.ut_tv.tv_sec, v8.ut_tv.tv_usec);
    asl_msg_set_key_val(v2, "Message", __str);
    asl_msg_set_key_val(v2, "ut_id", "0x00 0x00 0x00 0x00");
    asl_msg_set_key_val(v2, "ut_pid", "1");
    asl_msg_set_key_val(v2, "ut_type", "2");
    snprintf(__str, 0x100uLL, "%lu", v8.ut_tv.tv_sec);
    asl_msg_set_key_val(v2, "Time", __str);
    asl_msg_set_key_val(v2, "ut_tv.tv_sec", __str);
    snprintf(__str, 0x100uLL, "%u", v8.ut_tv.tv_usec);
    asl_msg_set_key_val(v2, "ut_tv.tv_usec", __str);
    v3 = "000";
    if (!v8.ut_tv.tv_usec)
      v3 = (const char *)&unk_100015297;
    snprintf(__str, 0x100uLL, "%u%s", v8.ut_tv.tv_usec, v3);
    v4 = "TimeNanoSec";
    v5 = __str;
LABEL_10:
    asl_msg_set_key_val(v2, v4, v5);
    sub_100005F88(v2, 1);
  }
}

void start(int a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  FILE *v25;
  FILE *v26;
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
  _DWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  _DWORD *v50;
  _DWORD *v51;
  _DWORD *v52;
  int v53;
  _DWORD *v54;
  _DWORD *v55;
  int v56;
  _DWORD *v57;
  _DWORD *v58;
  int v59;
  _DWORD *v60;
  _DWORD *v61;
  int v62;
  _QWORD *v63;
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
  NSObject *v78;
  dispatch_time_t v79;
  NSObject *global_queue;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  char v93;
  int v94;
  time_t v95;
  char *name;
  char v97[16];
  __int128 v98;
  int token[2];
  int out_token[2];
  stat v101;

  *(_QWORD *)token = 0;
  *(_QWORD *)out_token = 0;
  v95 = 0;
  name = 0;
  setiopolicy_np(0, 0, 2);
  unk_10001E348 = 0u;
  *(_OWORD *)&dword_10001E358 = 0u;
  xmmword_10001E368 = 0u;
  unk_10001E378 = 0u;
  xmmword_10001E388 = 0u;
  *(_OWORD *)&qword_10001E398 = 0u;
  xmmword_10001E3A8 = 0u;
  unk_10001E3B8 = 0u;
  unk_10001E3C8 = 0u;
  *(_OWORD *)&qword_10001E3D8 = 0u;
  xmmword_10001E3E8 = 0u;
  unk_10001E3F8 = 0u;
  xmmword_10001E408 = 0u;
  *(_OWORD *)&qword_10001E418 = 0u;
  xmmword_10001E428 = 0u;
  *(_OWORD *)&qword_10001E438 = 0u;
  xmmword_10001E448 = 0u;
  *(_OWORD *)&qword_10001E458 = 0u;
  *(__int128 *)((char *)&xmmword_10001E460 + 8) = 0u;
  *(__int128 *)((char *)&xmmword_10001E470 + 8) = 0u;
  qword_10001E398 = (uint64_t)malloc_type_calloc(1uLL, 0x40uLL, 0x1000040FA0F61DDuLL);
  pthread_mutex_init((pthread_mutex_t *)qword_10001E398, 0);
  qword_10001E3D0 = (uint64_t)dispatch_queue_create("Work Queue", 0);
  dispatch_suspend((dispatch_object_t)qword_10001E3D0);
  sub_1000058C8();
  dword_10001D260 = 1;
  dword_10001C034 = 0;
  _malloc_no_asl_log = 1;
  if (a1 < 2)
  {
    v94 = xmmword_10001E448;
LABEL_65:
    if (!v94)
      *(_QWORD *)&xmmword_10001E448 = 0x186A00000000001;
    signal(1, (void (__cdecl *)(int))1);
    *(_OWORD *)v97 = 0u;
    v98 = 0u;
    v95 = time(0);
    ctime_r(&v95, v97);
    BYTE3(v98) = 0;
    sub_1000061A0("\n%s syslogd PID %d starting\n", v16, v17, v18, v19, v20, v21, v22, (char)v97);
    memset(&v101, 0, sizeof(v101));
    if (stat("/var/run/syslog.pid", &v101))
      v23 = 0;
    else
      v23 = (v101.st_mode & 0xF000) == 0x8000;
    v24 = !v23;
    v25 = fopen("/var/run/syslog.pid", "w");
    if (v25)
    {
      v26 = v25;
      fprintf(v25, "%d\n", dword_10001E37C);
      fclose(v26);
    }
    sub_10000C67C(v24);
    notify_register_plain("com.apple.system.syslog.master");
    notify_set_state(token[0], 0);
    sub_1000061A0("reading launch plist\n", v27, v28, v29, v30, v31, v32, v33, v88);
    sub_10000C42C();
    sub_1000061A0("initializing modules\n", v34, v35, v36, v37, v38, v39, v40, v89);
    v41 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
    if (v41)
    {
      v50 = v41;
      *(_QWORD *)v41 = "asl_action";
      v41[2] = 1;
      *((_QWORD *)v41 + 2) = sub_100001738;
      *((_QWORD *)v41 + 3) = sub_100001B68;
      *((_QWORD *)v41 + 4) = sub_100001A0C;
      sub_100001738((uint64_t)v41, v42, v43, v44, v45, v46, v47, v48);
      v51 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
      if (v51)
      {
        v52 = v51;
        *(_QWORD *)v51 = "bsd_out";
        v53 = dword_10001C034;
        v51[2] = dword_10001C034;
        *((_QWORD *)v51 + 2) = sub_100004EA8;
        *((_QWORD *)v51 + 3) = sub_100005644;
        *((_QWORD *)v51 + 4) = sub_10000551C;
        if (v53)
        {
          sub_100004EA8((uint64_t)v51, v42, v43, v44, v45, v46, v47, v48);
          dword_10001E404 = 1;
        }
        v54 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
        if (v54)
        {
          v55 = v54;
          *(_QWORD *)v54 = "klog_in";
          v56 = dword_10001C038;
          v54[2] = dword_10001C038;
          *((_QWORD *)v54 + 2) = sub_10000A594;
          *((_QWORD *)v54 + 3) = sub_10000A768;
          *((_QWORD *)v54 + 4) = sub_10000A710;
          if (v56)
            sub_10000A594((uint64_t)v54, v42, v43, v44, v45, v46, v47, v48);
          v57 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
          if (v57)
          {
            v58 = v57;
            *(_QWORD *)v57 = "udp_in";
            v59 = dword_10001C03C;
            v57[2] = dword_10001C03C;
            *((_QWORD *)v57 + 2) = sub_10000D6D8;
            *((_QWORD *)v57 + 3) = sub_10000D9EC;
            *((_QWORD *)v57 + 4) = sub_10000D974;
            if (v59)
              sub_10000D6D8((uint64_t)v57, v42, v43, v44, v45, v46, v47, v48);
            v60 = malloc_type_calloc(1uLL, 0x28uLL, 0x10D00407F658587uLL);
            if (v60)
            {
              v61 = v60;
              *(_QWORD *)v60 = "remote";
              v62 = dword_10001D260;
              v60[2] = dword_10001D260;
              *((_QWORD *)v60 + 2) = sub_10000C360;
              *((_QWORD *)v60 + 3) = sub_10000C424;
              *((_QWORD *)v60 + 4) = sub_10000C3F0;
              if (v62)
                sub_10000C360((uint64_t)v60, v42, v43, v44, v45, v46, v47, v48);
              dword_10001E400 = 5;
              v63 = malloc_type_calloc(5uLL, 8uLL, 0x2004093837F09uLL);
              *((_QWORD *)&xmmword_10001E408 + 1) = v63;
              if (v63)
              {
                *v63 = v50;
                *(_QWORD *)(*((_QWORD *)&xmmword_10001E408 + 1) + 8) = v52;
                *(_QWORD *)(*((_QWORD *)&xmmword_10001E408 + 1) + 16) = v55;
                *(_QWORD *)(*((_QWORD *)&xmmword_10001E408 + 1) + 24) = v58;
                *(_QWORD *)(*((_QWORD *)&xmmword_10001E408 + 1) + 32) = v61;
                sub_1000061A0("setting up network change notification handler\n", v42, v43, v44, v45, v46, v47, v48, v90);
                notify_register_dispatch("com.apple.system.config.network_change", &out_token[1], (dispatch_queue_t)qword_10001E3D0, &stru_100019258);
                sub_1000061A0("setting up quota notification handler\n", v64, v65, v66, v67, v68, v69, v70, v91);
                name = 0;
                asprintf(&name, "%s%s", "com.apple.system.notify.service.path:0x87:", "/etc/asl/.noquota");
                if (name)
                {
                  notify_register_dispatch(name, out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100019298);
                  free(name);
                }
                qword_10001E3E0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
                dispatch_source_set_event_handler((dispatch_source_t)qword_10001E3E0, &stru_1000192D8);
                dispatch_resume((dispatch_object_t)qword_10001E3E0);
                notify_register_plain("com.apple.system.logger.message");
                if (*((_QWORD *)&xmmword_10001E460 + 1))
                {
                  qword_10001E3D8 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
                  dispatch_source_set_event_handler((dispatch_source_t)qword_10001E3D8, &stru_100019358);
                  v78 = qword_10001E3D8;
                  v79 = dispatch_time(0, 1000000000 * *((_QWORD *)&xmmword_10001E460 + 1));
                  dispatch_source_set_timer(v78, v79, 1000000000 * *((_QWORD *)&xmmword_10001E460 + 1), 0);
                  dispatch_resume((dispatch_object_t)qword_10001E3D8);
                }
                sub_1000061A0("starting mach service\n", v71, v72, v73, v74, v75, v76, v77, v92);
                global_queue = dispatch_get_global_queue(0, 0);
                dispatch_async(global_queue, &stru_100019398);
                sub_1000061A0("starting work queue\n", v81, v82, v83, v84, v85, v86, v87, v93);
                dispatch_resume((dispatch_object_t)qword_10001E3D0);
                dispatch_main();
              }
              v49 = "alloc failed (init_modules)\n";
            }
            else
            {
              v49 = "alloc failed (init_modules remote)\n";
            }
          }
          else
          {
            v49 = "alloc failed (init_modules udp_in)\n";
          }
        }
        else
        {
          v49 = "alloc failed (init_modules klog_in)\n";
        }
      }
      else
      {
        v49 = "alloc failed (init_modules bsd_out)\n";
      }
    }
    else
    {
      v49 = "alloc failed (init_modules asl_action)\n";
    }
    sub_1000061A0(v49, v42, v43, v44, v45, v46, v47, v48, v90);
    exit(1);
  }
  v4 = 1;
  do
  {
    v5 = v4 + 1;
    if (!strcmp(*(const char **)(a2 + 8 * v4), "-config") && (int)v5 < a1)
    {
      v7 = *(const char **)(a2 + 8 * v5);
      if (*v7 != 45)
      {
        if (!strcmp(*(const char **)(a2 + 8 * v5), "mac"))
        {
          *(_QWORD *)&xmmword_10001E448 = 0x186A00000000001;
        }
        else if (!strcmp(v7, "appletv"))
        {
          *(_QWORD *)&xmmword_10001E448 = 0x9C400000000001;
        }
        else if (!strcmp(v7, "iphone"))
        {
          LODWORD(xmmword_10001E448) = 2;
          dword_10001D260 = 1;
        }
        ++v4;
      }
    }
    ++v4;
  }
  while (v4 < a1);
  v94 = xmmword_10001E448;
  v8 = 1;
  while (1)
  {
    v9 = *(const char **)(a2 + 8 * v8);
    if (!strcmp(v9, "-d"))
    {
      DWORD2(xmmword_10001E428) = 1;
      v10 = v8 + 1;
      if (v8 + 1 >= a1 || (v11 = *(const char **)(a2 + 8 * v10), *v11 == 45))
      {
LABEL_63:
        LODWORD(v10) = v8;
        goto LABEL_64;
      }
      qword_10001E438 = (uint64_t)strdup(v11);
    }
    else if (!strcmp(v9, "-db"))
    {
      v12 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      v13 = *(const char **)(a2 + 8 * v12);
      if (*v13 == 45)
        goto LABEL_63;
      if (!strcmp(*(const char **)(a2 + 8 * v12), "file"))
      {
        LODWORD(xmmword_10001E448) = v94 | 1;
        v10 = v8 + 2;
        v94 |= 1u;
        if (v8 + 2 < a1)
        {
          v15 = *(const char **)(a2 + 8 * v10);
          if (*v15 != 45)
          {
            DWORD1(xmmword_10001E448) = atol(v15);
            goto LABEL_64;
          }
        }
LABEL_55:
        LODWORD(v10) = v8 + 1;
        goto LABEL_64;
      }
      if (strcmp(v13, "memory"))
        goto LABEL_55;
      LODWORD(xmmword_10001E448) = v94 | 2;
      v10 = v8 + 2;
      v94 |= 2u;
      if (v8 + 2 >= a1)
        goto LABEL_55;
      v14 = *(const char **)(a2 + 8 * v10);
      if (*v14 == 45)
        goto LABEL_55;
      DWORD2(xmmword_10001E448) = atol(v14);
    }
    else if (!strcmp(v9, "-m"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      *((_QWORD *)&xmmword_10001E460 + 1) = 60 * atoll(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-utmp_ttl"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      *(_QWORD *)&xmmword_10001E470 = atol(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-mps_limit"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      LODWORD(qword_10001E458) = atol(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-dup_delay"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      *(_QWORD *)&xmmword_10001E460 = atoll(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-klog_in"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      dword_10001C038 = atoi(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-udp_in"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      dword_10001C03C = atoi(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-launchd_in"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      LODWORD(xmmword_10001E408) = atoi(*(const char **)(a2 + 8 * v10));
    }
    else if (!strcmp(v9, "-bsd_out"))
    {
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      dword_10001C034 = atoi(*(const char **)(a2 + 8 * v10));
    }
    else
    {
      if (strcmp(v9, "-remote"))
        goto LABEL_63;
      v10 = v8 + 1;
      if (v8 + 1 >= a1)
        goto LABEL_63;
      dword_10001D260 = atoi(*(const char **)(a2 + 8 * v10));
    }
LABEL_64:
    v8 = v10 + 1;
    if ((int)v10 + 1 >= a1)
      goto LABEL_65;
  }
}

void sub_10000D440(id a1, int a2)
{
  if (dword_10001C03C)
    sub_10000D9EC();
  if (dword_10001C034)
    sub_100005644();
}

void sub_10000D474(id a1, int a2)
{
  char *v2;
  stat v3;

  memset(&v3, 0, sizeof(v3));
  v2 = 0;
  if (stat("/etc/asl/.noquota", &v3))
    asprintf(&v2, "[Sender syslogd] [Level 2] [PID %u] [Facility syslog] [Message *** MESSAGE QUOTAS ENABLED ***]");
  else
    asprintf(&v2, "[Sender syslogd] [Level 2] [PID %u] [Facility syslog] [Message *** MESSAGE QUOTAS DISABLED FOR ALL PROCESSES ***]");
  sub_100006E30((uint64_t)v2);
  free(v2);
}

void sub_10000D4FC(id a1)
{
  dispatch_async((dispatch_queue_t)qword_10001E3D0, &stru_100019318);
}

void sub_10000D510(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v8 = sub_1000061A0("SIGHUP reset\n", v1, v2, v3, v4, v5, v6, v7, v13);
  v9 = dword_10001E400;
  if (dword_10001E400 >= 1)
  {
    v10 = 0;
    v11 = *((_QWORD *)&xmmword_10001E408 + 1);
    do
    {
      v12 = *(_QWORD *)(v11 + 8 * v10);
      if (*(_DWORD *)(v12 + 8))
      {
        v8 = (*(uint64_t (**)(uint64_t))(v12 + 24))(v8);
        v11 = *((_QWORD *)&xmmword_10001E408 + 1);
        v9 = dword_10001E400;
      }
      ++v10;
    }
    while (v10 < v9);
  }
}

void sub_10000D588(int a1)
{
  ssize_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  socklen_t v19;
  char v20[64];
  sockaddr v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v19 = 128;
  v21 = (sockaddr)0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v1 = recvfrom(a1, byte_10001D268, 0x1000uLL, 0, &v21, &v19);
  if (v1 < 1)
    return;
  v2 = v1;
  v20[0] = 0;
  if (v21.sa_family == 30)
  {
    v3 = &v21.sa_data[6];
    v4 = 30;
  }
  else
  {
    if (v21.sa_family != 2)
    {
      v5 = 0;
      goto LABEL_8;
    }
    v3 = &v21.sa_data[2];
    v4 = 2;
  }
  inet_ntop(v4, v3, v20, 0x40u);
  v5 = v20;
  sub_1000061A0("%s: fd %d recvfrom %s len %d\n", v6, v7, v8, v9, v10, v11, v12, (char)"udp_in");
LABEL_8:
  byte_10001D268[v2] = 0;
  v13 = strrchr(byte_10001D268, 10);
  if (v13)
    *v13 = 0;
  v18 = sub_1000074B8((uint64_t)byte_10001D268, v2, v5, 3, v14, v15, v16, v17);
  sub_100005F88((uint64_t)v18, 3);
}

uint64_t sub_10000D6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _launch_data *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _launch_data *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _launch_data *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  size_t v40;
  _launch_data *index;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t fd;
  int *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  char *v68;
  _QWORD handler[4];
  int v70;
  int v71;

  if (qword_10001E270 != -1)
    dispatch_once(&qword_10001E270, &stru_1000193D8);
  sub_1000061A0("%s: init\n", a2, a3, a4, a5, a6, a7, a8, (char)"udp_in");
  if (dword_10001E280 > 0)
    return 0;
  if (qword_10001E360)
  {
    v16 = launch_data_dict_lookup((const launch_data_t)qword_10001E360, "Sockets");
    if (v16)
    {
      v24 = launch_data_dict_lookup(v16, "NetworkListener");
      if (v24)
      {
        v32 = v24;
        dword_10001E280 = launch_data_array_get_count(v24);
        if (dword_10001E280 < 1)
        {
          sub_1000061A0("%s: launchd fd array is empty\n", v33, v34, v35, v36, v37, v38, v39, (char)"udp_in");
        }
        else
        {
          v40 = 0;
          v71 = 0;
          while (1)
          {
            dword_10001E284[v40] = -1;
            index = launch_data_array_get_index(v32, v40);
            if (!index)
              break;
            fd = launch_data_get_fd(index);
            v71 = 0x20000;
            if (setsockopt(fd, 0xFFFF, 4098, &v71, 4u) < 0)
            {
              v50 = __error();
              v67 = fd;
              v68 = strerror(*v50);
              sub_1000061A0("%s: couldn't set receive buffer size for file descriptor %d: %s\n", v51, v52, v53, v54, v55, v56, v57, (char)"udp_in");
            }
            if (fcntl(fd, 4, 4, v67, v68) < 0)
            {
              v58 = __error();
              v67 = fd;
              v68 = strerror(*v58);
              sub_1000061A0("%s: couldn't set O_NONBLOCK for file descriptor %d: %s\n", v59, v60, v61, v62, v63, v64, v65, (char)"udp_in");
            }
            dword_10001E284[v40] = fd;
            v66 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, (int)fd, 0, (dispatch_queue_t)qword_10001E278);
            qword_10001E2C8[v40] = v66;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 0x40000000;
            handler[2] = sub_10000D96C;
            handler[3] = &unk_1000193F8;
            v70 = fd;
            dispatch_source_set_event_handler(v66, handler);
            dispatch_resume(qword_10001E2C8[v40]);
            result = 0;
            if ((uint64_t)++v40 >= dword_10001E280)
              return result;
          }
          sub_1000061A0("%s: launchd file discriptor array element 0 is NULL\n", v42, v43, v44, v45, v46, v47, v48, (char)"udp_in");
        }
      }
      else
      {
        sub_1000061A0("%s: launchd lookup of UDP_SOCKET_NAME failed\n", v25, v26, v27, v28, v29, v30, v31, (char)"udp_in");
      }
    }
    else
    {
      sub_1000061A0("%s: launchd lookup of LAUNCH_JOBKEY_SOCKETS failed\n", v17, v18, v19, v20, v21, v22, v23, (char)"udp_in");
    }
  }
  else
  {
    sub_1000061A0("%s: launchd dict is NULL\n", v8, v9, v10, v11, v12, v13, v14, (char)"udp_in");
  }
  return 0xFFFFFFFFLL;
}

void sub_10000D944(id a1)
{
  qword_10001E278 = (uint64_t)dispatch_queue_create("udp_in", 0);
}

void sub_10000D96C(uint64_t a1)
{
  sub_10000D588(*(_DWORD *)(a1 + 32));
}

uint64_t sub_10000D974()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t result;

  v0 = dword_10001E280;
  if (!dword_10001E280)
    return 0xFFFFFFFFLL;
  if (dword_10001E280 >= 1)
  {
    v1 = 0;
    do
    {
      v2 = dword_10001E284[v1];
      if (v2 != -1)
      {
        close(v2);
        dword_10001E284[v1] = -1;
        v0 = dword_10001E280;
      }
      ++v1;
    }
    while (v1 < v0);
  }
  result = 0;
  dword_10001E280 = 0;
  return result;
}

uint64_t sub_10000D9EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_10000D974();
  if ((_DWORD)v0)
    return 0xFFFFFFFFLL;
  else
    return sub_10000D6D8(v0, v1, v2, v3, v4, v5, v6, v7);
}

uint64_t asl_memory_statistics(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  _QWORD **v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t result;
  char __str[256];

  if (!a1)
    return 2;
  if (!a2)
    return 1;
  v4 = asl_msg_new(0);
  if (!v4)
    return 9;
  v5 = v4;
  v6 = *((unsigned int *)a1 + 6);
  v7 = ((unint64_t)(*((_DWORD *)a1 + 7) + 1) << 7) | 0x40;
  if ((_DWORD)v6)
  {
    v8 = *a1;
    do
    {
      v9 = *(const char **)(*(_QWORD *)v8 + 8);
      if (v9)
        v7 += strlen(v9) + 17;
      else
        v7 += 16;
      v8 += 8;
      --v6;
    }
    while (v6);
  }
  snprintf(__str, 0x100uLL, "%llu", v7);
  asl_msg_set_key_val(v5, "Size", __str);
  if (*((_DWORD *)a1 + 7))
  {
    v10 = 0;
    v11 = (_QWORD **)a1[1];
    v12 = *((unsigned int *)a1 + 7);
    do
    {
      v13 = *v11++;
      if (*v13)
        ++v10;
      --v12;
    }
    while (v12);
  }
  else
  {
    v10 = 0;
  }
  snprintf(__str, 0x100uLL, "%u", *((_DWORD *)a1 + 7));
  asl_msg_set_key_val(v5, "MaxRecords", __str);
  snprintf(__str, 0x100uLL, "%u", v10);
  asl_msg_set_key_val(v5, "RecordCount", __str);
  snprintf(__str, 0x100uLL, "%u", *((_DWORD *)a1 + 6));
  asl_msg_set_key_val(v5, "StringCount", __str);
  snprintf(__str, 0x100uLL, "%lu", a1[6]);
  asl_msg_set_key_val(v5, "StringMemory", __str);
  snprintf(__str, 0x100uLL, "%lu", a1[5]);
  asl_msg_set_key_val(v5, "MaxStringMemory", __str);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t asl_memory_close(dispatch_object_t *a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    v2 = a1[7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_10000DCB4;
    block[3] = &unk_100019418;
    block[4] = a1;
    dispatch_sync(v2, block);
    dispatch_release(a1[7]);
    free(a1);
  }
  return 0;
}

void sub_10000DCB4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    if (*(_DWORD *)(v2 + 28))
    {
      v4 = 0;
      do
      {
        free(*(void **)(*(_QWORD *)(v2 + 8) + 8 * v4));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8 * v4++) = 0;
        v2 = *(_QWORD *)(a1 + 32);
      }
      while (v4 < *(unsigned int *)(v2 + 28));
      v3 = *(void **)(v2 + 8);
    }
    free(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  free(*(void **)(v2 + 16));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD **)v5;
  if (*(_QWORD *)v5)
  {
    if (*(_DWORD *)(v5 + 24))
    {
      v7 = 0;
      do
      {
        v8 = *(_QWORD **)v5;
        v9 = v8[v7];
        if (v9)
        {
          free(*(void **)(v9 + 8));
          free(*(void **)(**(_QWORD **)(a1 + 32) + 8 * v7));
          v8 = **(_QWORD ***)(a1 + 32);
        }
        v8[v7++] = 0;
        v5 = *(_QWORD *)(a1 + 32);
      }
      while (v7 < *(unsigned int *)(v5 + 24));
      v6 = *(_QWORD **)v5;
    }
    free(v6);
    **(_QWORD **)(a1 + 32) = 0;
  }
}

uint64_t asl_memory_open(unsigned int a1, uint64_t a2, _QWORD *a3)
{
  size_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t result;

  if (!a3)
    return 1;
  if (a1)
    v4 = a1;
  else
    v4 = 2000;
  if (a2)
    v5 = a2;
  else
    v5 = 4096000;
  v6 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040714EAED2uLL);
  if (v6)
  {
    v7 = v6;
    v8 = dispatch_queue_create("ASL Memory Queue", 0);
    *((_QWORD *)v7 + 7) = v8;
    if (v8)
    {
      *((_QWORD *)v7 + 5) = v5;
      *((_DWORD *)v7 + 7) = v4;
      v9 = malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
      *((_QWORD *)v7 + 1) = v9;
      if (v9)
      {
        v10 = 0;
        while (1)
        {
          *(_QWORD *)(*((_QWORD *)v7 + 1) + 8 * v10) = malloc_type_calloc(1uLL, 0x80uLL, 0x10A00402869003AuLL);
          if (!*(_QWORD *)(*((_QWORD *)v7 + 1) + 8 * v10))
            break;
          if (v4 == ++v10)
          {
            v11 = malloc_type_calloc(1uLL, 0x80uLL, 0x10A00402869003AuLL);
            *((_QWORD *)v7 + 2) = v11;
            if (v11)
            {
              result = 0;
              *a3 = v7;
              return result;
            }
            break;
          }
        }
        asl_memory_close((dispatch_object_t *)v7);
        return 9;
      }
      dispatch_release(*((dispatch_object_t *)v7 + 7));
    }
    free(v7);
  }
  return 9;
}

uint64_t asl_memory_save(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (a1 && *(_QWORD *)(a1 + 16))
  {
    v3 = *(NSObject **)(a1 + 56);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_10000DF94;
    v6[3] = &unk_100019440;
    v6[4] = &v7;
    v6[5] = a1;
    v6[6] = a2;
    v6[7] = a3;
    dispatch_sync(v3, v6);
    v4 = *((unsigned int *)v8 + 6);
  }
  else
  {
    v4 = 2;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_10000DF94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  int v30;
  unint64_t v31;
  _OWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t i;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *__s;
  char *__s1;

  v2 = *(_QWORD *)(a1 + 40);
  if (!v2 || (v3 = *(_QWORD *)(v2 + 16)) == 0)
  {
    v16 = 2;
    goto LABEL_71;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (!v4)
  {
    v16 = 5;
    goto LABEL_71;
  }
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_WORD *)(v3 + 120) = 0;
  *(_BYTE *)(v3 + 122) = 7;
  *(_QWORD *)(v3 + 104) = -1;
  *(_QWORD *)(v3 + 8) = -1;
  *(_OWORD *)(v3 + 88) = xmmword_100014770;
  __s = 0;
  __s1 = 0;
  v5 = asl_msg_fetch(v4, 0, &__s1, &__s, 0);
  if ((_DWORD)v5 == -1)
  {
LABEL_69:
    v16 = 0;
    goto LABEL_71;
  }
  v6 = v5;
  while (1)
  {
    v7 = __s1;
    if (!__s1)
      goto LABEL_68;
    if (!strcmp(__s1, "Time"))
    {
      if (__s)
        *(_QWORD *)(v3 + 8) = asl_core_parse_time(__s, 0);
      goto LABEL_68;
    }
    if (!strcmp(v7, "TimeNanoSec"))
    {
      if (__s)
        *(_DWORD *)(v3 + 88) = atoi(__s);
      goto LABEL_68;
    }
    if (!strcmp(v7, "Host"))
    {
      if (__s)
        *(_QWORD *)(v3 + 24) = sub_10000F9DC(v2, __s, 1);
      goto LABEL_68;
    }
    if (!strcmp(v7, "Sender"))
    {
      if (__s)
        *(_QWORD *)(v3 + 32) = sub_10000F9DC(v2, __s, 1);
      goto LABEL_68;
    }
    if (!strcmp(v7, "PID"))
    {
      if (__s)
        *(_DWORD *)(v3 + 92) = atoi(__s);
      goto LABEL_68;
    }
    if (!strcmp(v7, "RefPID"))
    {
      if (__s)
        *(_DWORD *)(v3 + 112) = atoi(__s);
      goto LABEL_68;
    }
    if (!strcmp(v7, "UID"))
    {
      if (__s)
        *(_DWORD *)(v3 + 96) = atoi(__s);
      goto LABEL_68;
    }
    if (!strcmp(v7, "GID"))
    {
      if (__s)
        *(_DWORD *)(v3 + 100) = atoi(__s);
      goto LABEL_68;
    }
    if (!strcmp(v7, "Level"))
    {
      if (__s)
        *(_BYTE *)(v3 + 122) = atoi(__s);
      goto LABEL_68;
    }
    if (!strcmp(v7, "Message"))
    {
      if (__s)
        *(_QWORD *)(v3 + 56) = sub_10000F9DC(v2, __s, 1);
      goto LABEL_68;
    }
    if (!strcmp(v7, "SenderMachUUID"))
    {
      if (__s)
        *(_QWORD *)(v3 + 40) = sub_10000F9DC(v2, __s, 1);
      goto LABEL_68;
    }
    if (!strcmp(v7, "Facility"))
    {
      if (__s)
        *(_QWORD *)(v3 + 48) = sub_10000F9DC(v2, __s, 1);
      goto LABEL_68;
    }
    if (!strcmp(v7, "RefProc"))
    {
      if (__s)
        *(_QWORD *)(v3 + 64) = sub_10000F9DC(v2, __s, 1);
      goto LABEL_68;
    }
    if (!strcmp(v7, "Session"))
    {
      if (__s)
        *(_QWORD *)(v3 + 72) = sub_10000F9DC(v2, __s, 1);
      goto LABEL_68;
    }
    if (!strcmp(v7, "ReadUID"))
    {
      v10 = *(_WORD *)(v3 + 120);
      if ((v10 & 1) != 0 || !__s)
        goto LABEL_68;
      *(_DWORD *)(v3 + 104) = atoi(__s);
      v11 = v10 | 1;
LABEL_62:
      *(_WORD *)(v3 + 120) = v11;
      goto LABEL_68;
    }
    if (!strcmp(v7, "ReadGID"))
    {
      v12 = *(_WORD *)(v3 + 120);
      if ((v12 & 2) != 0 || !__s)
        goto LABEL_68;
      *(_DWORD *)(v3 + 108) = atoi(__s);
      v11 = v12 | 2;
      goto LABEL_62;
    }
    if (!strcmp(v7, "OSActivityID"))
    {
      if (__s)
        *(_QWORD *)(v3 + 16) = atoll(__s);
      goto LABEL_68;
    }
    if (strcmp(v7, "ASLMessageID"))
    {
      v8 = sub_10000F9DC(v2, v7, 1);
      if (v8)
        break;
    }
LABEL_68:
    v6 = asl_msg_fetch(v4, v6, &__s1, &__s, 0);
    if ((_DWORD)v6 == -1)
      goto LABEL_69;
  }
  v9 = v8;
  if (__s)
    v38 = sub_10000F9DC(v2, __s, 1);
  else
    v38 = 0;
  v13 = reallocf(*(void **)(v3 + 80), 8 * (*(_DWORD *)(v3 + 116) + 2));
  *(_QWORD *)(v3 + 80) = v13;
  if (v13)
  {
    v14 = *(unsigned int *)(v3 + 116);
    v13[v14] = v9;
    v15 = *(_QWORD *)(v3 + 80);
    *(_DWORD *)(v3 + 116) = v14 + 2;
    *(_QWORD *)(v15 + 8 * (v14 + 1)) = v38;
    goto LABEL_68;
  }
  sub_10000E5C4(v2, v3);
  v16 = 9;
LABEL_71:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v16;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_DWORD *)(v17 + 32);
    v19 = **(_QWORD **)(a1 + 56);
    if (v19)
    {
      **(_QWORD **)(v17 + 16) = v19;
      v20 = v18;
    }
    else
    {
      v21 = asl_core_new_msg_id(0);
      v17 = *(_QWORD *)(a1 + 40);
      **(_QWORD **)(v17 + 16) = v21;
      **(_QWORD **)(a1 + 56) = v21;
      v20 = *(_DWORD *)(v17 + 32);
    }
    v22 = *(_QWORD *)(*(_QWORD *)(v17 + 8) + 8 * v20);
    sub_10000E5C4(v17, v22);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 8 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 32)) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = v22;
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_DWORD *)(v23 + 32);
    if ((v24 + 1) < *(_DWORD *)(v23 + 28))
      v25 = v24 + 1;
    else
      v25 = 0;
    *(_DWORD *)(v23 + 32) = v25;
    while (1)
    {
      v26 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v26 + 48) <= *(_QWORD *)(v26 + 40))
        break;
      sub_10000E5C4(v26, *(_QWORD *)(*(_QWORD *)(v26 + 8) + 8 * *(unsigned int *)(v26 + 32)));
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *(_DWORD *)(v27 + 28);
      v29 = *(_DWORD *)(v27 + 32);
      if (v29 + 1 < v28)
        v30 = v29 + 1;
      else
        v30 = 0;
      *(_DWORD *)(v27 + 32) = v30;
      if (v30 == v18)
      {
        if (v28)
        {
          v31 = 0;
          do
          {
            v32 = *(_OWORD **)(*(_QWORD *)(v27 + 8) + 8 * v31);
            v32[6] = 0uLL;
            v32[7] = 0uLL;
            v32[4] = 0uLL;
            v32[5] = 0uLL;
            v32[2] = 0uLL;
            v32[3] = 0uLL;
            *v32 = 0uLL;
            v32[1] = 0uLL;
            ++v31;
          }
          while (v31 < *(unsigned int *)(v27 + 28));
        }
        v33 = *(_QWORD **)v27;
        if (*(_QWORD *)v27)
        {
          v34 = *(unsigned int *)(v27 + 24);
          if ((_DWORD)v34)
          {
            for (i = 0; i < v34; ++i)
            {
              v36 = *(_QWORD **)v27;
              v37 = *(_QWORD *)(*(_QWORD *)v27 + 8 * i);
              if (v37)
              {
                free(*(void **)(v37 + 8));
                free(*(void **)(*(_QWORD *)v27 + 8 * i));
                v36 = *(_QWORD **)v27;
                v34 = *(unsigned int *)(v27 + 24);
              }
              v36[i] = 0;
            }
            v33 = *(_QWORD **)v27;
          }
          free(v33);
          *(_QWORD *)v27 = 0;
        }
        *(_DWORD *)(v27 + 24) = 0;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 9999;
        return;
      }
    }
  }
}

double sub_10000E5C4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  double result;

  if (a1 && a2)
  {
    sub_10000FC58(a1, *(_QWORD *)(a2 + 24));
    sub_10000FC58(a1, *(_QWORD *)(a2 + 32));
    sub_10000FC58(a1, *(_QWORD *)(a2 + 40));
    sub_10000FC58(a1, *(_QWORD *)(a2 + 48));
    sub_10000FC58(a1, *(_QWORD *)(a2 + 56));
    sub_10000FC58(a1, *(_QWORD *)(a2 + 64));
    sub_10000FC58(a1, *(_QWORD *)(a2 + 72));
    if (*(_DWORD *)(a2 + 116))
    {
      v4 = 0;
      do
        sub_10000FC58(a1, *(_QWORD *)(*(_QWORD *)(a2 + 80) + 8 * v4++));
      while (v4 < *(unsigned int *)(a2 + 116));
    }
    v5 = *(void **)(a2 + 80);
    if (v5)
      free(v5);
    result = 0.0;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10000E690(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char __str[64];

  if (!a1)
    return 2;
  result = 1;
  if (a2 && a3)
  {
    *a3 = 0;
    v6 = asl_msg_new(0);
    if (v6)
    {
      v7 = v6;
      snprintf(__str, 0x40uLL, "%llu", *(_QWORD *)a2);
      asl_msg_set_key_val(v7, "ASLMessageID", __str);
      snprintf(__str, 0x40uLL, "%u", *(unsigned __int8 *)(a2 + 122));
      asl_msg_set_key_val(v7, "Level", __str);
      if (*(_QWORD *)(a2 + 8) != -1)
      {
        snprintf(__str, 0x40uLL, "%llu", *(_QWORD *)(a2 + 8));
        asl_msg_set_key_val(v7, "Time", __str);
      }
      if (*(_DWORD *)(a2 + 88) != -1)
      {
        snprintf(__str, 0x40uLL, "%u", *(_DWORD *)(a2 + 88));
        asl_msg_set_key_val(v7, "TimeNanoSec", __str);
      }
      v8 = *(_QWORD *)(a2 + 24);
      if (v8)
        asl_msg_set_key_val(v7, "Host", *(_QWORD *)(v8 + 8));
      v9 = *(_QWORD *)(a2 + 32);
      if (v9)
        asl_msg_set_key_val(v7, "Sender", *(_QWORD *)(v9 + 8));
      v10 = *(_QWORD *)(a2 + 40);
      if (v10)
        asl_msg_set_key_val(v7, "SenderMachUUID", *(_QWORD *)(v10 + 8));
      v11 = *(_QWORD *)(a2 + 48);
      if (v11)
        asl_msg_set_key_val(v7, "Facility", *(_QWORD *)(v11 + 8));
      v12 = *(_QWORD *)(a2 + 64);
      if (v12)
        asl_msg_set_key_val(v7, "RefProc", *(_QWORD *)(v12 + 8));
      v13 = *(_QWORD *)(a2 + 72);
      if (v13)
        asl_msg_set_key_val(v7, "Session", *(_QWORD *)(v13 + 8));
      if (*(_DWORD *)(a2 + 92) != -1)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 92));
        asl_msg_set_key_val(v7, "PID", __str);
      }
      if (*(_DWORD *)(a2 + 112))
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 112));
        asl_msg_set_key_val(v7, "RefPID", __str);
      }
      if (*(_DWORD *)(a2 + 96) != -2)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 96));
        asl_msg_set_key_val(v7, "UID", __str);
      }
      if (*(_DWORD *)(a2 + 100) != -2)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 100));
        asl_msg_set_key_val(v7, "GID", __str);
      }
      v14 = *(_QWORD *)(a2 + 56);
      if (v14)
        asl_msg_set_key_val(v7, "Message", *(_QWORD *)(v14 + 8));
      v15 = *(_WORD *)(a2 + 120);
      if ((v15 & 1) != 0)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 104));
        asl_msg_set_key_val(v7, "ReadUID", __str);
        v15 = *(_WORD *)(a2 + 120);
      }
      if ((v15 & 2) != 0)
      {
        snprintf(__str, 0x40uLL, "%d", *(_DWORD *)(a2 + 108));
        asl_msg_set_key_val(v7, "ReadGID", __str);
      }
      if (*(_QWORD *)(a2 + 16))
      {
        snprintf(__str, 0x40uLL, "%llu", *(_QWORD *)(a2 + 16));
        asl_msg_set_key_val(v7, "OSActivityID", __str);
      }
      v16 = *(_DWORD *)(a2 + 116);
      if (v16)
      {
        v17 = 0;
        while (1)
        {
          v18 = *(_QWORD *)(a2 + 80);
          v19 = *(_QWORD *)(v18 + 8 * v17);
          v20 = v19 ? *(_QWORD *)(v19 + 8) : 0;
          v21 = *(_QWORD *)(v18 + 8 * (v17 + 1));
          if (!v21)
            break;
          v22 = *(_QWORD *)(v21 + 8);
          if (v20)
            goto LABEL_44;
LABEL_45:
          v17 += 2;
          if (v17 >= v16)
            goto LABEL_50;
        }
        v22 = 0;
        if (!v20)
          goto LABEL_45;
LABEL_44:
        asl_msg_set_key_val(v7, v20, v22);
        v16 = *(_DWORD *)(a2 + 116);
        goto LABEL_45;
      }
LABEL_50:
      result = 0;
      *a3 = v7;
    }
    else
    {
      return 9;
    }
  }
  return result;
}

uint64_t asl_memory_match_restricted_uuid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, int a9, int a10, uint64_t a11)
{
  NSObject *v11;
  uint64_t v12;
  _QWORD v14[11];
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2000000000;
  v23 = 0;
  if (a1)
  {
    if (a3)
    {
      v11 = *(NSObject **)(a1 + 56);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000;
      v14[2] = sub_10000EB68;
      v14[3] = &unk_100019468;
      v14[4] = &v20;
      v14[5] = a1;
      v14[6] = a2;
      v14[7] = a3;
      v14[8] = a4;
      v14[9] = a5;
      v15 = a6;
      v16 = a7;
      v17 = a8;
      v18 = a9;
      v19 = a10;
      v14[10] = a11;
      dispatch_sync(v11, v14);
      v12 = *((unsigned int *)v21 + 6);
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 2;
  }
  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t sub_10000EB68(uint64_t a1)
{
  uint64_t result;

  result = sub_10000EBC0(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(uint64_t **)(a1 + 56), *(_QWORD **)(a1 + 64), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 88), *(_DWORD *)(a1 + 92), *(_DWORD *)(a1 + 96), *(_DWORD *)(a1 + 100), *(_DWORD *)(a1 + 104), *(const char **)(a1 + 80));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_10000EBC0(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4, unint64_t a5, int a6, unsigned int a7, int a8, unsigned int a9, unsigned int a10, const char *a11)
{
  uint64_t v15;
  size_t v17;
  size_t v18;
  void *v19;
  void *v20;
  _DWORD *v21;
  _DWORD *v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t index;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  _QWORD *v40;
  const char *v41;
  int v42;
  char *v43;
  int v44;
  const char *v45;
  int v46;
  const char *v47;
  int v48;
  const char *v49;
  int v50;
  const char *v51;
  int v52;
  const char *v53;
  int v54;
  const char *v55;
  int v56;
  const char *v57;
  int v58;
  const char *v59;
  int v60;
  char *v61;
  int v62;
  uint64_t v63;
  char *v64;
  int v65;
  uint64_t v66;
  char *v67;
  int v68;
  char *v69;
  int v70;
  uint64_t v71;
  char *v72;
  int v73;
  uint64_t v74;
  char *v75;
  int v76;
  uint64_t v77;
  char *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  unsigned int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  unint64_t v89;
  uint64_t v91;
  unsigned int v92;
  void *v93;
  BOOL v94;
  unsigned int v95;
  unint64_t v96;
  uint64_t v97;
  void **v98;
  void *v99;
  uint64_t v100;
  int v101;
  unsigned int v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  __int16 v108;
  size_t v109;
  int v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int v119;
  _BOOL4 v120;
  unsigned int v121;
  uint64_t v122;
  uint64_t v123;
  BOOL v124;
  uint64_t v125;
  unsigned int v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  uint64_t v131;
  __darwin_suseconds_t v133;
  int v134;
  int v135;
  uint64_t *v136;
  uint64_t *v137;
  int v138;
  unsigned int v139;
  unsigned int v140;
  __darwin_time_t v141;
  int v144;
  char *__s2;
  int v146;
  int v147;
  uint64_t v148;
  timeval v149;
  timeval v150;
  uint64_t v151;
  char *v152;
  __int16 v153;
  char *v154;

  v15 = a2;
  *(_QWORD *)&v150.tv_usec = 0;
  v151 = 0;
  *(_QWORD *)&v149.tv_usec = 0;
  v150.tv_sec = 0;
  v149.tv_sec = 0;
  v17 = asl_msg_list_count(a2);
  v18 = v17;
  if (v17)
  {
    v19 = malloc_type_calloc(v17, 8uLL, 0x2004093837F09uLL);
    if (!v19)
      return 9;
    v20 = v19;
    v21 = malloc_type_calloc(v18, 4uLL, 0x100004052888210uLL);
    if (!v21)
    {
      free(v20);
      return 9;
    }
    v22 = v21;
    v138 = a6;
    v140 = a7;
    v134 = a8;
    v136 = a3;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v148 = v15;
    while (1)
    {
      index = asl_msg_list_get_index(v15, v23);
      if (!a1)
      {
LABEL_104:
        v83 = 0x20000000;
        goto LABEL_105;
      }
      v27 = index;
      v22[v23] = 0x80000000;
      if (!index || !asl_msg_count(index))
        goto LABEL_103;
      v153 = 0;
      v154 = 0;
      v152 = 0;
      v22[v23] = 0;
      v28 = asl_msg_fetch(v27, 0, 0, 0, &v153);
      if ((_DWORD)v28 != -1)
      {
        v29 = v28;
        while (v153 == 1)
        {
          v29 = asl_msg_fetch(v27, v29, 0, 0, &v153);
          if ((_DWORD)v29 == -1)
            goto LABEL_12;
        }
LABEL_103:
        v31 = 0;
        goto LABEL_106;
      }
LABEL_12:
      v30 = malloc_type_calloc(1uLL, 0x80uLL, 0x10A00402869003AuLL);
      if (!v30)
        goto LABEL_104;
      v31 = (uint64_t)v30;
      v146 = v24;
      v32 = asl_msg_fetch(v27, 0, &v154, &v152, &v153);
      if ((_DWORD)v32 == -1)
      {
LABEL_102:
        v15 = v148;
        v24 = v146;
        goto LABEL_106;
      }
      v33 = v32;
      while (1)
      {
        v34 = v154;
        if (!v154)
          goto LABEL_101;
        if (!strcmp(v154, "ASLMessageID"))
        {
          v41 = v152;
          if (v152)
          {
            v42 = v22[v23];
            if ((v42 & 1) != 0)
              goto LABEL_111;
            v22[v23] = v42 | 1;
            *(_QWORD *)v31 = atoll(v41);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "Time"))
        {
          v43 = v152;
          if (v152)
          {
            v44 = v22[v23];
            if ((v44 & 2) != 0)
              goto LABEL_111;
            v22[v23] = v44 | 2;
            *(_QWORD *)(v31 + 8) = asl_core_parse_time(v43, 0);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "TimeNanoSec"))
        {
          v45 = v152;
          if (v152)
          {
            v46 = v22[v23];
            if ((v46 & 4) != 0)
              goto LABEL_111;
            v22[v23] = v46 | 4;
            *(_DWORD *)(v31 + 88) = atoll(v45);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "Level"))
        {
          v47 = v152;
          if (v152)
          {
            v48 = v22[v23];
            if ((v48 & 8) != 0)
              goto LABEL_111;
            v22[v23] = v48 | 8;
            *(_BYTE *)(v31 + 122) = atoi(v47);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "PID"))
        {
          v49 = v152;
          if (v152)
          {
            v50 = v22[v23];
            if ((v50 & 0x10) != 0)
              goto LABEL_111;
            v22[v23] = v50 | 0x10;
            *(_DWORD *)(v31 + 92) = atoi(v49);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "UID"))
        {
          v51 = v152;
          if (v152)
          {
            v52 = v22[v23];
            if ((v52 & 0x20) != 0)
              goto LABEL_111;
            v22[v23] = v52 | 0x20;
            *(_DWORD *)(v31 + 96) = atoi(v51);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "GID"))
        {
          v53 = v152;
          if (v152)
          {
            v54 = v22[v23];
            if ((v54 & 0x40) != 0)
              goto LABEL_111;
            v22[v23] = v54 | 0x40;
            *(_DWORD *)(v31 + 100) = atoi(v53);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "ReadUID"))
        {
          v55 = v152;
          if (v152)
          {
            v56 = v22[v23];
            if ((v56 & 0x80) != 0)
              goto LABEL_111;
            v22[v23] = v56 | 0x80;
            *(_DWORD *)(v31 + 104) = atoi(v55);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "ReadGID"))
        {
          v57 = v152;
          if (v152)
          {
            v58 = v22[v23];
            if ((v58 & 0x100) != 0)
              goto LABEL_111;
            v22[v23] = v58 | 0x100;
            *(_DWORD *)(v31 + 108) = atoi(v57);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "RefPID"))
        {
          v59 = v152;
          if (v152)
          {
            v60 = v22[v23];
            if ((v60 & 0x200) != 0)
              goto LABEL_111;
            v22[v23] = v60 | 0x200;
            *(_DWORD *)(v31 + 112) = atoi(v59);
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "Host"))
        {
          v61 = v152;
          if (v152)
          {
            v62 = v22[v23];
            if ((v62 & 0x400) != 0)
              goto LABEL_111;
            v22[v23] = v62 | 0x400;
            v63 = sub_10000F9DC(a1, v61, 0);
            *(_QWORD *)(v31 + 24) = v63;
            if (!v63)
              goto LABEL_113;
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "Sender"))
        {
          v64 = v152;
          if (v152)
          {
            v65 = v22[v23];
            if ((v65 & 0x800) != 0)
              goto LABEL_111;
            v22[v23] = v65 | 0x800;
            v66 = sub_10000F9DC(a1, v64, 0);
            *(_QWORD *)(v31 + 32) = v66;
            if (!v66)
              goto LABEL_113;
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "SenderMachUUID"))
        {
          v67 = v152;
          if (v152)
          {
            v68 = v22[v23];
            if ((v68 & 0x1000) != 0)
              goto LABEL_111;
            v22[v23] = v68 | 0x1000;
            *(_QWORD *)(v31 + 32) = sub_10000F9DC(a1, v67, 0);
            if (!*(_QWORD *)(v31 + 40))
              goto LABEL_113;
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "Facility"))
        {
          v69 = v152;
          if (v152)
          {
            v70 = v22[v23];
            if ((v70 & 0x2000) != 0)
              goto LABEL_111;
            v22[v23] = v70 | 0x2000;
            v71 = sub_10000F9DC(a1, v69, 0);
            *(_QWORD *)(v31 + 48) = v71;
            if (!v71)
              goto LABEL_113;
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "Message"))
        {
          v72 = v152;
          if (v152)
          {
            v73 = v22[v23];
            if ((v73 & 0x4000) != 0)
              goto LABEL_111;
            v22[v23] = v73 | 0x4000;
            v74 = sub_10000F9DC(a1, v72, 0);
            *(_QWORD *)(v31 + 56) = v74;
            if (!v74)
              goto LABEL_113;
          }
          goto LABEL_101;
        }
        if (!strcmp(v34, "RefProc"))
        {
          v75 = v152;
          if (v152)
          {
            v76 = v22[v23];
            if ((v76 & 0x8000) != 0)
              goto LABEL_111;
            v22[v23] = v76 | 0x8000;
            v77 = sub_10000F9DC(a1, v75, 0);
            *(_QWORD *)(v31 + 64) = v77;
            if (!v77)
              goto LABEL_113;
          }
          goto LABEL_101;
        }
        if (strcmp(v34, "Session"))
          break;
        v78 = v152;
        if (v152)
        {
          v79 = v22[v23];
          if ((v79 & 0x10000) != 0)
            goto LABEL_111;
          v22[v23] = v79 | 0x10000;
          v80 = sub_10000F9DC(a1, v78, 0);
          *(_QWORD *)(v31 + 72) = v80;
          if (!v80)
          {
LABEL_113:
            sub_10000E5C4(a1, v31);
            free((void *)v31);
            v83 = 0x40000000;
            goto LABEL_112;
          }
        }
LABEL_101:
        v33 = asl_msg_fetch(v27, v33, &v154, &v152, &v153);
        if ((_DWORD)v33 == -1)
          goto LABEL_102;
      }
      v35 = sub_10000F9DC(a1, v34, 0);
      if (!v35)
        goto LABEL_113;
      v36 = v35;
      v37 = *(_DWORD *)(v31 + 116);
      if (v37)
      {
        v38 = 0;
        while (*(_QWORD *)(*(_QWORD *)(v31 + 80) + 8 * v38) != v35)
        {
          v38 += 2;
          if (v38 >= v37)
            goto LABEL_38;
        }
LABEL_111:
        sub_10000E5C4(a1, v31);
        free((void *)v31);
        v83 = 0;
        goto LABEL_112;
      }
LABEL_38:
      __s2 = (char *)sub_10000F9DC(a1, v152, 0);
      v39 = *(_DWORD *)(v31 + 116);
      if (v39)
        v40 = reallocf(*(void **)(v31 + 80), 8 * (v39 + 2));
      else
        v40 = malloc_type_calloc(2uLL, 8uLL, 0x2004093837F09uLL);
      *(_QWORD *)(v31 + 80) = v40;
      if (v40)
      {
        v81 = *(unsigned int *)(v31 + 116);
        v40[v81] = v36;
        v82 = *(_QWORD *)(v31 + 80);
        *(_DWORD *)(v31 + 116) = v81 + 2;
        *(_QWORD *)(v82 + 8 * (v81 + 1)) = __s2;
        goto LABEL_101;
      }
      sub_10000E5C4(a1, v31);
      free((void *)v31);
      v83 = 0x20000000;
LABEL_112:
      v15 = v148;
      v24 = v146;
LABEL_105:
      v31 = 0;
      v22[v23] = v83;
LABEL_106:
      *((_QWORD *)v20 + v23) = v31;
      v84 = v22[v23];
      if (v84 != 0x80000000)
      {
        if (v84 == 0x20000000)
        {
          if (v25)
          {
            v97 = v25;
            v98 = (void **)v20;
            do
            {
              v99 = *v98++;
              sub_10000E5C4(a1, (uint64_t)v99);
              free(v99);
              --v97;
            }
            while (v97);
          }
          free(v20);
          free(v22);
          return 9999;
        }
        v24 = 1;
      }
      v23 = ++v25;
      if (v18 <= v25)
      {
        v147 = v24;
        a3 = v136;
        a8 = v134;
        goto LABEL_116;
      }
    }
  }
  v138 = a6;
  v140 = a7;
  v148 = v15;
  v147 = 0;
  v22 = 0;
  v20 = 0;
LABEL_116:
  v85 = *(_DWORD *)(a1 + 28);
  if (!v85)
  {
LABEL_127:
    if (v20)
    {
      if (v18)
      {
        v91 = 0;
        v92 = 1;
        do
        {
          v93 = (void *)*((_QWORD *)v20 + v91);
          sub_10000E5C4(a1, (uint64_t)v93);
          free(v93);
          v91 = v92;
          v94 = v18 > v92++;
        }
        while (v94);
      }
      free(v20);
      free(v22);
    }
    return 0;
  }
  v86 = 0;
  v87 = v85 - 1;
  while (1)
  {
    if (a8 < 0)
    {
      v88 = (v87 + *(_DWORD *)(a1 + 32)) % v85;
      if (**(_QWORD **)(*(_QWORD *)(a1 + 8) + 8 * v88) - 1 < a5)
        break;
      goto LABEL_126;
    }
    v88 = (v86 + *(_DWORD *)(a1 + 32)) % v85;
    v89 = **(_QWORD **)(*(_QWORD *)(a1 + 8) + 8 * v88);
    if (v89 && v89 >= a5)
      break;
LABEL_126:
    ++v86;
    if (--v87 == -1)
      goto LABEL_127;
  }
  v149.tv_sec = 0;
  *(_QWORD *)&v149.tv_usec = 0;
  if (v140)
  {
    if (gettimeofday(&v149, 0))
    {
      v95 = 0;
      v96 = 0;
      v149.tv_sec = 0;
      *(_QWORD *)&v149.tv_usec = 0;
    }
    else
    {
      v96 = v149.tv_sec + v140 / 0xF4240uLL;
      v95 = v149.tv_usec + v140 % 0xF4240;
      if (v95 > 0xF4240)
      {
        v95 -= 1000000;
        v149.tv_usec = v95;
        v149.tv_sec = ++v96;
      }
    }
  }
  else
  {
    v95 = 0;
    v96 = 0;
  }
  if (!*(_DWORD *)(a1 + 28))
  {
    v144 = 0;
    goto LABEL_233;
  }
  v133 = v95;
  v135 = a8;
  v141 = v96;
  v144 = 0;
  v101 = 0;
  v139 = v138 - 1;
  v102 = v88;
  v137 = a3;
LABEL_145:
  v103 = v102;
  v104 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v102);
  if (!*(_QWORD *)v104)
    goto LABEL_221;
  v105 = asl_core_check_access(*(unsigned int *)(v104 + 104), *(unsigned int *)(v104 + 108), a9, a10, *(unsigned __int16 *)(v104 + 120));
  if (!a11 || v105)
  {
    if (v105)
      goto LABEL_221;
    v106 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v103);
  }
  else
  {
    v106 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v103);
    v107 = *(_QWORD *)(v106 + 40);
    if (!v107 || strcmp(*(const char **)(v107 + 8), a11))
      goto LABEL_221;
  }
  v108 = *(_WORD *)(v106 + 120) & 0x7FFF;
  *(_WORD *)(v106 + 120) = v108;
  *a4 = *(_QWORD *)v106;
  if (v147)
  {
    if (!v18)
      goto LABEL_216;
    v109 = 0;
    v110 = 0;
    while (1)
    {
      v111 = v22[v109];
      if (v111)
      {
        if (v111 != 0x40000000)
        {
          if (v111 == 0x80000000)
            goto LABEL_214;
          v112 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v103);
          if (v112)
          {
            v113 = *((_QWORD *)v20 + v109);
            if (!v113)
              goto LABEL_214;
            if (((v111 & 1) == 0 || *(_QWORD *)v113 == *(_QWORD *)v112)
              && ((v111 & 2) == 0 || *(_QWORD *)(v113 + 8) == *(_QWORD *)(v112 + 8))
              && ((v111 & 4) == 0 || *(_DWORD *)(v113 + 88) == *(_DWORD *)(v112 + 88))
              && ((v111 & 8) == 0 || *(unsigned __int8 *)(v113 + 122) == *(unsigned __int8 *)(v112 + 122))
              && ((v111 & 0x10) == 0 || *(_DWORD *)(v113 + 92) == *(_DWORD *)(v112 + 92))
              && ((v111 & 0x20) == 0 || *(_DWORD *)(v113 + 96) == *(_DWORD *)(v112 + 96))
              && ((v111 & 0x40) == 0 || *(_DWORD *)(v113 + 100) == *(_DWORD *)(v112 + 100))
              && ((v111 & 0x80) == 0 || *(_DWORD *)(v113 + 104) == *(_DWORD *)(v112 + 104))
              && ((v111 & 0x100) == 0 || *(_DWORD *)(v113 + 108) == *(_DWORD *)(v112 + 108))
              && ((v111 & 0x200) == 0 || *(_DWORD *)(v113 + 112) == *(_DWORD *)(v112 + 112))
              && ((v111 & 0x400) == 0 || *(_QWORD *)(v113 + 24) == *(_QWORD *)(v112 + 24))
              && ((v111 & 0x800) == 0 || *(_QWORD *)(v113 + 32) == *(_QWORD *)(v112 + 32))
              && ((v111 & 0x1000) == 0 || *(_QWORD *)(v113 + 40) == *(_QWORD *)(v112 + 40))
              && ((v111 & 0x2000) == 0 || *(_QWORD *)(v113 + 48) == *(_QWORD *)(v112 + 48))
              && ((v111 & 0x4000) == 0 || *(_QWORD *)(v113 + 56) == *(_QWORD *)(v112 + 56))
              && ((v111 & 0x8000) == 0 || *(_QWORD *)(v113 + 64) == *(_QWORD *)(v112 + 64))
              && ((v111 & 0x10000) == 0 || *(_QWORD *)(v113 + 72) == *(_QWORD *)(v112 + 72)))
            {
              v114 = *(_DWORD *)(v113 + 116);
              if (!v114)
                goto LABEL_214;
              v115 = *(_DWORD *)(v112 + 116);
              if (v115)
              {
                v116 = 0;
                v117 = *(_QWORD *)(v113 + 80);
                v118 = *(_QWORD *)(v112 + 80);
                while (1)
                {
                  v119 = 1;
                  while (*(_QWORD *)(v117 + 8 * v116) != *(_QWORD *)(v118 + 8 * (v119 - 1)))
                  {
                    v120 = 0;
                    v121 = v119 + 1;
                    v119 += 2;
                    if (v121 >= v115)
                      goto LABEL_207;
                  }
                  if (*(_QWORD *)(v117 + 8 * (v116 | 1)) != *(_QWORD *)(v118 + 8 * v119))
                    break;
                  v116 += 2;
                  if (v116 >= v114)
                    goto LABEL_214;
                }
              }
            }
          }
        }
      }
      else
      {
        v122 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v103);
        v123 = asl_msg_list_get_index(v148, v109);
        v154 = 0;
        if (!sub_10000E690(a1, v122, (uint64_t *)&v154))
        {
          v120 = asl_msg_cmp(v123, v154) != 0;
          asl_msg_release(v154);
          goto LABEL_207;
        }
      }
      v120 = 0;
LABEL_207:
      v109 = (v110 + 1);
      v124 = v18 > v109 && !v120;
      ++v110;
      if (!v124)
      {
        if (v120)
        {
LABEL_214:
          v106 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v103);
          v108 = *(_WORD *)(v106 + 120);
          a3 = v137;
          a8 = v135;
          break;
        }
        a3 = v137;
        a8 = v135;
LABEL_216:
        if (v141 && !gettimeofday(&v150, 0) && (v150.tv_sec > v141 || v150.tv_sec == v141 && v150.tv_usec > v133))
          goto LABEL_233;
LABEL_221:
        if (a8 < 0)
        {
          if ((_DWORD)v103)
            v102 = v103 - 1;
          else
            v102 = *(_DWORD *)(a1 + 28) - 1;
        }
        else if ((v103 + 1) < *(_DWORD *)(a1 + 28))
        {
          v102 = v103 + 1;
        }
        else
        {
          v102 = 0;
        }
        if (v102 == *(_DWORD *)(a1 + 32))
          goto LABEL_233;
        if (++v101 >= *(_DWORD *)(a1 + 28))
          goto LABEL_233;
        goto LABEL_145;
      }
    }
  }
  *(_WORD *)(v106 + 120) = v108 | 0x8000;
  if (v139 >= ++v144)
    goto LABEL_216;
LABEL_233:
  if (v20)
  {
    if (v18)
    {
      v125 = 0;
      v126 = 1;
      do
      {
        v127 = (void *)*((_QWORD *)v20 + v125);
        sub_10000E5C4(a1, (uint64_t)v127);
        free(v127);
        v125 = v126;
        v94 = v18 > v126++;
      }
      while (v94);
    }
    free(v20);
    free(v22);
  }
  *a3 = 0;
  if (!v144)
    return 0;
  v128 = asl_msg_list_new();
  *a3 = v128;
  if (v128)
  {
    while (1)
    {
      v129 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v88);
      v130 = *(__int16 *)(v129 + 120);
      if (v130 < 0)
      {
        *(_WORD *)(v129 + 120) = v130 & 0x7FFF;
        v100 = sub_10000E690(a1, v129, &v151);
        v131 = *a3;
        if ((_DWORD)v100)
        {
          asl_msg_list_release(v131);
          *a3 = 0;
          return v100;
        }
        asl_msg_list_append(v131, v151);
        asl_msg_release(v151);
        if (v144 == 1)
          return 0;
      }
      if (a8 < 0)
      {
        if (v88)
          --v88;
        else
          v88 = *(_DWORD *)(a1 + 28) - 1;
      }
      else if (v88 + 1 < *(_DWORD *)(a1 + 28))
      {
        ++v88;
      }
      else
      {
        v88 = 0;
      }
      if (v88 == *(_DWORD *)(a1 + 32))
        return 0;
    }
  }
  return 9;
}

uint64_t sub_10000F9DC(uint64_t a1, char *__s, int a3)
{
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;
  _DWORD *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;

  if (!__s)
    return 0;
  v6 = strlen(__s);
  v7 = asl_core_string_hash(__s, v6);
  v8 = sub_10000FB88(a1, v7);
  if (v8 < *(_DWORD *)(a1 + 24))
  {
    v9 = *(_QWORD **)a1;
    while (1)
    {
      v10 = v9[v8];
      if (*(_DWORD *)v10 != v7)
        break;
      if (!strcmp(__s, *(const char **)(v10 + 8)))
      {
        ++*(_DWORD *)(v10 + 4);
        return v10;
      }
      ++v8;
    }
  }
  if (!a3)
    return 0;
  v11 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040466105CCuLL);
  if (!v11)
    return 0;
  v12 = v11;
  *v11 = v7;
  v11[1] = 1;
  v13 = malloc_type_malloc((v6 + 1), 0xC797D749uLL);
  v12[1] = v13;
  if (!v13)
  {
LABEL_18:
    free(v12);
    return 0;
  }
  memcpy(v13, __s, v6);
  *(_BYTE *)(v12[1] + v6) = 0;
  v14 = reallocf(*(void **)a1, 8 * (*(_DWORD *)(a1 + 24) + 1));
  *(_QWORD *)a1 = v14;
  if (!v14)
  {
    *(_DWORD *)(a1 + 24) = 0;
    goto LABEL_18;
  }
  v15 = *(unsigned int *)(a1 + 24);
  if (v15 > v8)
  {
    v16 = 8 * v15;
    v17 = 8 * (v15 - 1);
    v18 = *(_DWORD *)(a1 + 24);
    do
    {
      *(_QWORD *)(*(_QWORD *)a1 + v16) = *(_QWORD *)(*(_QWORD *)a1 + v17);
      v16 -= 8;
      v17 -= 8;
      --v18;
    }
    while (v8 < v18);
    v14 = *(_QWORD **)a1;
  }
  v19 = v6 + *(_QWORD *)(a1 + 48) + 17;
  v14[v8] = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_DWORD *)(a1 + 24) = v15 + 1;
  return *(_QWORD *)(*(_QWORD *)a1 + 8 * v8);
}

uint64_t sub_10000FB88(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;
  _DWORD **v5;
  unsigned int v6;
  unsigned int v7;
  _DWORD **v8;
  uint64_t i;
  int v10;

  v2 = *(_DWORD *)(a1 + 24);
  if (!v2)
    return *(unsigned int *)(a1 + 24);
  v3 = v2 - 1;
  if (v2 == 1)
    return ***(_DWORD ***)a1 <= a2;
  v5 = *(_DWORD ***)a1;
  if (v3 < 2)
  {
    result = 0;
    v3 = 1;
LABEL_14:
    if (*v5[result] < a2)
    {
      if (*v5[v3] >= a2)
        return v3;
      else
        return v2;
    }
  }
  else
  {
    LODWORD(result) = 0;
    v6 = v3 >> 1;
    while (1)
    {
      v7 = *v5[v6];
      if (v7 == a2)
        break;
      if (v7 <= a2)
      {
        result = v6;
      }
      else
      {
        v3 = v6;
        result = result;
      }
      v6 = result + ((v3 - result) >> 1);
      if (v3 - result <= 1)
        goto LABEL_14;
    }
    LODWORD(result) = v6 + 1;
    v8 = v5 - 1;
    for (i = v6; i * 8; --i)
    {
      v10 = *v8[i];
      result = (result - 1);
      if (v10 != a2)
        return result;
    }
    return 0;
  }
  return result;
}

void sub_10000FC58(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;

  if (a2)
  {
    v4 = *(_DWORD *)(a2 + 4);
    if (!v4 || (v5 = v4 - 1, (*(_DWORD *)(a2 + 4) = v5) == 0))
    {
      v6 = *(_DWORD *)a2;
      v7 = sub_10000FB88(a1, *(_DWORD *)a2);
      if (**(_DWORD **)(*(_QWORD *)a1 + 8 * v7) == v6)
      {
        v8 = v7 + 1;
        while (1)
        {
          v9 = *(_DWORD **)(*(_QWORD *)a1 + 8 * v7);
          if (v9 == (_DWORD *)a2)
            break;
          if (*v9 == v6)
          {
            ++v7;
            ++v8;
            if (v7 < *(_DWORD *)(a1 + 24))
              continue;
          }
          return;
        }
        v10 = *(unsigned int *)(a1 + 24);
        if (v8 < v10)
        {
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = *(_QWORD *)(*(_QWORD *)a1 + 8 * v8++);
          while (v8 < v10);
        }
        v11 = *(void **)(a2 + 8);
        if (v11)
          v12 = *(_QWORD *)(a1 + 48) - strlen(*(const char **)(a2 + 8)) - 17;
        else
          v12 = *(_QWORD *)(a1 + 48) - 16;
        *(_QWORD *)(a1 + 48) = v12;
        free(v11);
        free((void *)a2);
        v13 = *(void **)a1;
        v14 = *(_DWORD *)(a1 + 24) - 1;
        *(_DWORD *)(a1 + 24) = v14;
        if (v14)
        {
          v15 = reallocf(v13, 8 * v14);
          *(_QWORD *)a1 = v15;
          if (!v15)
            *(_DWORD *)(a1 + 24) = 0;
        }
        else
        {
          free(v13);
          *(_QWORD *)a1 = 0;
        }
      }
    }
  }
}

xpc_object_t xpc_object_to_asl_msg(xpc_object_t object)
{
  xpc_object_t v1;
  _QWORD applier[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = object;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  if (object)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v5[3] = asl_msg_new(0);
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000;
      applier[2] = sub_10000FE50;
      applier[3] = &unk_100019490;
      applier[4] = &v4;
      xpc_dictionary_apply(v1, applier);
      v1 = (xpc_object_t)v5[3];
    }
    else
    {
      v1 = 0;
    }
  }
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_10000FE50(uint64_t a1, uint64_t a2, xpc_object_t object)
{
  xpc_type_t type;
  uint64_t v7;
  const char *string_ptr;
  uint64_t v9;
  _BOOL4 value;
  size_t length;
  const void *bytes_ptr;
  void *v14;
  uint64_t v15;
  const unsigned __int8 *bytes;
  char __str[16];
  _BYTE v18[21];

  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_null)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_BOOL)
    {
      value = xpc_BOOL_get_value(object);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if (value)
        string_ptr = "1";
      else
        string_ptr = "0";
      goto LABEL_25;
    }
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_int64)
    {
      xpc_int64_get_value(object);
    }
    else
    {
      if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_uint64)
      {
        xpc_uint64_get_value(object);
        snprintf(__str, 0x40uLL, "%llu");
        goto LABEL_24;
      }
      if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_double)
      {
        xpc_double_get_value(object);
        snprintf(__str, 0x40uLL, "%f");
        goto LABEL_24;
      }
      if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_date)
      {
        if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_data)
        {
          length = xpc_data_get_length(object);
          bytes_ptr = xpc_data_get_bytes_ptr(object);
          v14 = (void *)asl_core_encode_buffer(bytes_ptr, length);
          asl_msg_set_key_val_op(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, v14, 0);
          free(v14);
          return 1;
        }
        if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_string)
        {
          v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          string_ptr = xpc_string_get_string_ptr(object);
          v7 = v15;
          goto LABEL_25;
        }
        if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_uuid)
        {
          if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_fd)
          {
            v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
            string_ptr = "{XPC_TYPE_FD}";
          }
          else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_shmem)
          {
            v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
            string_ptr = "{XPC_TYPE_SHMEM}";
          }
          else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_array)
          {
            v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
            string_ptr = "{XPC_TYPE_ARRAY}";
          }
          else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
          {
            v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
            string_ptr = "{XPC_TYPE_DICTIONARY}";
          }
          else
          {
            type = xpc_get_type(object);
            v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
            if (type == (xpc_type_t)&_xpc_type_error)
              string_ptr = "{XPC_TYPE_ERROR}";
            else
              string_ptr = "{XPC_TYPE_???}";
          }
          goto LABEL_25;
        }
        *(_OWORD *)__str = 0u;
        memset(v18, 0, sizeof(v18));
        bytes = xpc_uuid_get_bytes(object);
        uuid_unparse(bytes, __str);
LABEL_24:
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        string_ptr = __str;
LABEL_25:
        v9 = a2;
        goto LABEL_26;
      }
      xpc_date_get_value(object);
    }
    snprintf(__str, 0x40uLL, "%lld");
    goto LABEL_24;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v9 = a2;
  string_ptr = 0;
LABEL_26:
  asl_msg_set_key_val_op(v7, v9, string_ptr, 0);
  return 1;
}

xpc_object_t configuration_profile_to_asl_msg()
{
  void *v0;
  xpc_object_t v1;

  v0 = (void *)configuration_profile_copy_property_list();
  v1 = xpc_object_to_asl_msg(v0);
  if (v0)
    xpc_release(v0);
  return v1;
}

char *explode(char *a1, char *__s)
{
  char *v2;
  int v3;
  unsigned __int8 v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char v16;
  char *v17;

  if (!a1)
    return 0;
  v2 = a1;
  LOBYTE(v3) = *a1;
  if (!*a1)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = 0;
    while (1)
    {
      if (v5)
      {
        if (v3 == v5)
          v5 = 0;
        goto LABEL_16;
      }
      if (strchr(__s, (char)v3))
        break;
      if (v3 == 34)
        v8 = 34;
      else
        v8 = 0;
      if (v3 == 39)
        v5 = 39;
      else
        v5 = v8;
LABEL_16:
      v9 = v7 + 1;
      v3 = v2[++v7];
      if (!v3)
      {
        v10 = v9;
        v7 = v9;
        goto LABEL_19;
      }
    }
    v5 = 0;
    v10 = v7;
LABEL_19:
    v11 = (const char *)malloc_type_malloc(v10 + 1, 0x9095E2FEuLL);
    if (!v11)
      return 0;
    v12 = (char *)v11;
    if (v10)
    {
      v13 = v10;
      v14 = v2;
      v15 = (char *)v11;
      do
      {
        v16 = *v14++;
        *v15++ = v16;
        --v13;
      }
      while (v13);
    }
    v11[v7] = 0;
    v6 = (char *)sub_100010368(v11, v6);
    free(v12);
    v17 = &v2[v10];
    if (!v2[v10])
      break;
    v3 = v2[v10 + 1];
    if (!v2[v10 + 1])
    {
      v6 = (char *)sub_100010368((const char *)&unk_100015297, v6);
      v3 = v17[1];
    }
    v2 = v17 + 1;
  }
  while (v3);
  return v6;
}

_QWORD *sub_100010368(const char *a1, char *__ptr)
{
  _QWORD *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  char *v7;
  char *v8;

  v2 = __ptr;
  if (a1)
  {
    if (!__ptr)
    {
      v2 = malloc_type_malloc(0x10uLL, 0x10040436913F5uLL);
      if (!v2)
        return v2;
      v8 = strdup(a1);
      *v2 = v8;
      if (v8)
      {
        v2[1] = 0;
        return v2;
      }
      goto LABEL_11;
    }
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)&__ptr[v4 * 8];
      ++v5;
      ++v4;
    }
    while (v6);
    v2 = reallocf(__ptr, (v4 * 8 + 8) & 0x7FFFFFFF8);
    if (v2)
    {
      v7 = strdup(a1);
      v2[v4 - 1] = v7;
      if (v7)
      {
        v2[v5] = 0;
        return v2;
      }
LABEL_11:
      free(v2);
      return 0;
    }
  }
  return v2;
}

void free_string_list(void **a1)
{
  void *v2;
  void **v3;
  void *v4;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      v3 = a1 + 1;
      do
      {
        free(v2);
        v4 = *v3++;
        v2 = v4;
      }
      while (v4);
    }
    free(a1);
  }
}

_BYTE *get_line_from_file(FILE *a1)
{
  char *v1;
  char *v2;
  _BYTE *v3;
  _BYTE *v4;
  size_t v5;
  size_t __n;

  __n = 0;
  v1 = fgetln(a1, &__n);
  if (!v1 || !__n)
    return 0;
  v2 = v1;
  v3 = malloc_type_malloc(__n + 1, 0x729EE271uLL);
  v4 = v3;
  if (v3)
  {
    memcpy(v3, v2, __n);
    v5 = __n;
    if (v4[__n - 1] == 10)
      v5 = __n - 1;
    v4[v5] = 0;
  }
  return v4;
}

_BYTE *next_word_from_string(unsigned __int8 **a1)
{
  unsigned __int8 *v1;
  int v2;
  _BOOL4 v3;
  unsigned __int8 *v4;
  _BOOL4 v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  int64_t v10;
  int i;
  int v12;
  _BYTE *v13;
  _BYTE *v14;

  if (!a1)
    return 0;
  v1 = *a1;
  if (!*a1)
    return 0;
  v2 = *v1;
  v3 = v2 == 39;
  v4 = v2 == 39 ? v1 + 1 : *a1;
  v5 = *v4 == 34;
  v6 = *v4 == 34 ? v4 + 1 : v4;
  v7 = *v4 == 34 ? v3 + 1 : v2 == 39;
  v8 = -(int)v1 - v7;
  v9 = v6;
  while (1)
  {
    v10 = ((unint64_t)~(_DWORD)v6 << 32) + ((_QWORD)v9 << 32);
    for (i = v8 + (_DWORD)v9++; ; i += 2)
    {
      v12 = *(v9 - 1);
      if (v12 != 92)
        break;
      if (!*v9)
        goto LABEL_30;
      v9 += 2;
      v10 += 0x200000000;
    }
    if (!*(v9 - 1))
      break;
    if (v12 == 39)
    {
      v3 = !v3;
    }
    else
    {
      if (v12 == 34)
        v5 = !v5;
      if (v12 == 32)
      {
        if (!v3 && !v5)
          goto LABEL_30;
      }
      else if (v12 == 9 && !v3 && !v5)
      {
        goto LABEL_30;
      }
    }
  }
  --v9;
LABEL_30:
  *a1 = v9;
  if (v2 == 34 || v2 == 39)
    i -= v2 == v6[v10 >> 32];
  if (!i)
    return 0;
  v13 = malloc_type_malloc(i + 1, 0xCE9497B6uLL);
  v14 = v13;
  if (v13)
  {
    memcpy(v13, v6, i);
    v14[i] = 0;
  }
  return v14;
}

uint64_t asl_out_dest_for_path(uint64_t a1, char *__s2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;

  v2 = 0;
  if (a1 && __s2)
  {
    v4 = a1;
    while (1)
    {
      v5 = *(_QWORD *)(v4 + 16);
      if (v5)
        break;
LABEL_10:
      v4 = *(_QWORD *)(v4 + 24);
      if (!v4)
        return 0;
    }
    while (1)
    {
      if (*(_DWORD *)(v5 + 8) == 2)
      {
        v2 = *(_QWORD *)(v5 + 24);
        if (v2)
        {
          v6 = *(const char **)(v2 + 8);
          if (v6)
          {
            if (!strcmp(v6, __s2))
              break;
          }
        }
      }
      v5 = *(_QWORD *)(v5 + 40);
      if (!v5)
        goto LABEL_10;
    }
  }
  return v2;
}

uint64_t asl_out_mkpath(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const char *v4;
  char *v6;
  int v7;
  uint64_t result;
  void **v9;
  uint64_t v10;
  void **v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  mode_t v15;
  mode_t v16;
  uid_t v17;
  int v18;
  mode_t v19;
  gid_t v20;
  stat v22;
  stat v23;
  char __str[1024];
  char v25[1024];

  if (!a2)
    return 0xFFFFFFFFLL;
  v3 = *(_QWORD *)(a2 + 24);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = *(const char **)(v3 + 8);
  if (!v4)
    return 0xFFFFFFFFLL;
  snprintf(__str, 0x400uLL, "%s", v4);
  if (*(_DWORD *)(a2 + 8) != 13)
  {
    v6 = strrchr(__str, 47);
    if (!v6)
      return 0xFFFFFFFFLL;
    *v6 = 0;
  }
  memset(&v22, 0, sizeof(v22));
  if (stat(__str, &v22))
  {
    if (*__error() != 2)
      return 0xFFFFFFFFLL;
    v7 = *(_DWORD *)(*(_QWORD *)(a2 + 24) + 72);
    result = (uint64_t)explode(__str, "/");
    if (result)
    {
      v9 = (void **)result;
      v10 = asl_string_new(0);
      if (v9[__str[0] == 47])
      {
        v11 = &v9[(__str[0] == 47) + 1];
        while (1)
        {
          memset(&v23, 0, sizeof(v23));
          asl_string_append_char_no_encoding(v10, 47);
          asl_string_append_no_encoding(v10, *(v11 - 1));
          v12 = (char *)asl_string_bytes(v10);
          memset(&v23, 0, sizeof(v23));
          if (lstat(v12, &v23))
            break;
          v18 = v23.st_mode & 0xF000;
          if (v18 == 40960)
          {
            if (!realpath_DARWIN_EXTSN(v12, v25))
              goto LABEL_39;
            memset(&v23, 0, sizeof(v23));
            if (stat(v25, &v23))
              break;
            v18 = v23.st_mode & 0xF000;
          }
          if (v18 != 0x4000)
            goto LABEL_39;
LABEL_34:
          if (!*v11++)
            goto LABEL_35;
        }
        if (*__error() != 2 || (v13 = asl_out_dest_for_path(a1, v12), v14 = v13, (v7 & 0x20) != 0) && !v13)
        {
LABEL_39:
          asl_string_release(v10);
          free_string_list(v9);
          return 0xFFFFFFFFLL;
        }
        if (v13)
        {
          if (*(_WORD *)(v13 + 116) == 4096)
            v15 = 493;
          else
            v15 = *(_WORD *)(v13 + 116);
          v16 = umask(0);
          mkdir(v12, v15);
          umask(v16);
          if (*(_DWORD *)(v14 + 128))
            v17 = **(_DWORD **)(v14 + 120);
          else
            v17 = 0;
          if (*(_DWORD *)(v14 + 144))
          {
            v20 = **(_DWORD **)(v14 + 136);
LABEL_33:
            chown(v12, v17, v20);
            goto LABEL_34;
          }
        }
        else
        {
          v19 = umask(0);
          mkdir(v12, 0x1EDu);
          umask(v19);
          v17 = 0;
        }
        v20 = 80;
        goto LABEL_33;
      }
LABEL_35:
      asl_string_release(v10);
      free_string_list(v9);
      return 0;
    }
  }
  else if ((v22.st_mode & 0xF000) == 0x4000)
  {
    return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
  return result;
}

time_t asl_make_timestamp(time_t result, char a2, char *__str, size_t __size)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned __int16 v12;
  uint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t tm_mday;
  uint64_t tm_hour;
  const char *v19;
  const char *v20;
  unint64_t v21;
  unsigned int v22;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t tm_min;
  uint64_t v29;
  uint64_t tm_sec;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  tm v37;
  time_t v38;

  v38 = result;
  if (__str)
  {
    if ((a2 & 4) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d-%02d-%02dT%02d:%02d:%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 8) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d%02d%02dT%02d%02d%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 0x10) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v6) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        v6 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        v7 = 45;
      }
      else
      {
        v7 = 43;
      }
      v10 = v6 / 0xE10uLL;
      v11 = v6 % 0xE10;
      v12 = v6 % 0xE10;
      v13 = v12 / 0x3Cu;
      v14 = v12 % 0x3Cu;
      v15 = (v37.tm_year + 1900);
      v16 = (v37.tm_mon + 1);
      tm_hour = v37.tm_hour;
      tm_mday = v37.tm_mday;
      if (v12 % 0x3Cu)
      {
        v32 = v7;
        v34 = v10;
        tm_min = v37.tm_min;
        tm_sec = v37.tm_sec;
        v26 = v37.tm_mday;
        v27 = v37.tm_hour;
        v24 = (v37.tm_year + 1900);
        v25 = (v37.tm_mon + 1);
        v19 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u:%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v11 >= 0x3C)
      {
        v35 = v10;
        v36 = v12 / 0x3Cu;
        v31 = v37.tm_sec;
        v33 = v7;
        v29 = v37.tm_min;
        v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u";
      }
      else
      {
        v33 = v7;
        v35 = v10;
        v29 = v37.tm_min;
        v31 = v37.tm_sec;
        v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u";
      }
    }
    else
    {
      if ((a2 & 0x20) == 0)
        return snprintf(__str, __size, "%c%llu");
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v8) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        v8 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        v9 = 45;
      }
      else
      {
        v9 = 43;
      }
      v21 = v8 / 0xE10uLL;
      v22 = v8 % 0xE10;
      v23 = v8 % 0xE10;
      v13 = v23 / 0x3Cu;
      v14 = v23 % 0x3Cu;
      v15 = (v37.tm_year + 1900);
      v16 = (v37.tm_mon + 1);
      tm_hour = v37.tm_hour;
      tm_mday = v37.tm_mday;
      if (v23 % 0x3Cu)
      {
        v32 = v9;
        v34 = v21;
        tm_min = v37.tm_min;
        tm_sec = v37.tm_sec;
        v26 = v37.tm_mday;
        v27 = v37.tm_hour;
        v24 = (v37.tm_year + 1900);
        v25 = (v37.tm_mon + 1);
        v19 = "%d%02d%02dT%02d%02d%02d%c%02u%02u%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v22 >= 0x3C)
      {
        v35 = v21;
        v36 = v23 / 0x3Cu;
        v31 = v37.tm_sec;
        v33 = v9;
        v29 = v37.tm_min;
        v20 = "%d%02d%02dT%02d%02d%02d%c%02u%02u";
      }
      else
      {
        v33 = v9;
        v35 = v21;
        v29 = v37.tm_min;
        v31 = v37.tm_sec;
        v20 = "%d%02d%02dT%02d%02d%02d%c%02u";
      }
    }
    return snprintf(__str, __size, v20, v15, v16, tm_mday, tm_hour, v29, v31, v33, v35, v36);
  }
  return result;
}

uint64_t asl_dst_make_current_name(uint64_t result, int a2, char *a3, size_t a4)
{
  uint64_t v6;
  int v7;
  time_t v8;
  char __str[32];

  if (result && a3)
  {
    v6 = result;
    v7 = *(_DWORD *)(result + 72) | a2;
    v8 = *(_QWORD *)(result + 176);
    if (!v8)
    {
      v8 = time(0);
      *(_QWORD *)(v6 + 176) = v8;
    }
    asl_make_timestamp(v8, *(_DWORD *)(v6 + 64), __str, 0x20uLL);
    if ((v7 & 0x2000) != 0)
      return snprintf(a3, a4, "%s.%s");
    if ((v7 & 0x100) == 0)
      return snprintf(a3, a4, "%s");
    if (*(_QWORD *)v6 && (*(_BYTE *)(v6 + 67) & 0x40) != 0)
      return snprintf(a3, a4, "%s/%s.%s.%s");
    else
      return snprintf(a3, a4, "%s.%s");
  }
  return result;
}

uint64_t asl_check_option(uint64_t a1, char *__s)
{
  uint64_t v2;
  size_t v5;
  const char *val_for_key;
  const char *v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v2 = 0;
  if (a1 && __s)
  {
    v5 = strlen(__s);
    if (!v5)
      return 0;
    val_for_key = (const char *)asl_msg_get_val_for_key(a1, "ASLOption");
    if (!val_for_key)
      return 0;
    v7 = val_for_key;
    v2 = *(unsigned __int8 *)val_for_key;
    if (*val_for_key)
    {
      while (1)
      {
LABEL_6:
        if ((int)v2 <= 31)
        {
          if ((_DWORD)v2 != 9)
          {
            if (!(_DWORD)v2)
              return v2;
LABEL_13:
            if (strncasecmp(v7, __s, v5)
              || ((v7 += v5, v2 = *(unsigned __int8 *)v7, v2 <= 0x2C)
                ? (v9 = ((1 << v2) & 0x100100000201) == 0)
                : (v9 = 1),
                  v9))
            {
              while (1)
              {
                if ((int)v2 > 31)
                {
                  if ((_DWORD)v2 == 32 || (_DWORD)v2 == 44)
                    goto LABEL_6;
                }
                else
                {
                  if (!(_DWORD)v2)
                    return v2;
                  if ((_DWORD)v2 == 9)
                    goto LABEL_6;
                }
                v10 = *(unsigned __int8 *)++v7;
                v2 = v10;
              }
            }
            return 1;
          }
        }
        else if ((_DWORD)v2 != 44 && (_DWORD)v2 != 32)
        {
          goto LABEL_13;
        }
        v8 = *(unsigned __int8 *)++v7;
        v2 = v8;
      }
    }
  }
  return v2;
}

void asl_out_dst_data_release(uint64_t a1)
{
  int v2;
  int v3;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 168);
    if (!v2 || (v3 = v2 - 1, (*(_DWORD *)(a1 + 168) = v3) == 0))
    {
      free(*(void **)a1);
      free(*(void **)(a1 + 8));
      free(*(void **)(a1 + 16));
      free(*(void **)(a1 + 40));
      free(*(void **)(a1 + 48));
      free(*(void **)(a1 + 32));
      free(*(void **)(a1 + 24));
      free(*(void **)(a1 + 120));
      free(*(void **)(a1 + 136));
      free((void *)a1);
    }
  }
}

uint64_t asl_out_dst_data_retain(uint64_t result)
{
  if (result)
    ++*(_DWORD *)(result + 168);
  return result;
}

uint64_t asl_out_dst_set_access(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uid_t v4;
  gid_t v5;

  result = 0xFFFFFFFFLL;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    v4 = *(_DWORD *)(a2 + 128);
    if (v4)
      v4 = **(_DWORD **)(a2 + 120);
    if (*(_DWORD *)(a2 + 144))
      v5 = **(_DWORD **)(a2 + 136);
    else
      v5 = 80;
    fchown(a1, v4, v5);
    return a1;
  }
  return result;
}

uint64_t asl_out_dst_file_create_open(uint64_t a1, char **a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __darwin_time_t tv_sec;
  stat v10;
  char __s1[1024];

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!*(_QWORD *)(a1 + 8))
    return 0xFFFFFFFFLL;
  asl_dst_make_current_name(a1, 0, __s1, 0x400uLL);
  free(*(void **)(a1 + 16));
  v4 = strdup(__s1);
  *(_QWORD *)(a1 + 16) = v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  if (a2)
    *a2 = strdup(__s1);
  memset(&v10, 0, sizeof(v10));
  if (!stat(__s1, &v10))
  {
    if ((v10.st_mode & 0xF000) == 0x8000)
    {
      v7 = open(__s1, 2058, 0);
      if (!*(_QWORD *)(a1 + 176))
      {
        tv_sec = v10.st_birthtimespec.tv_sec;
        *(_QWORD *)(a1 + 176) = v10.st_birthtimespec.tv_sec;
        if (!tv_sec)
          *(_QWORD *)(a1 + 176) = v10.st_mtimespec.tv_sec;
      }
      *(_QWORD *)(a1 + 184) = v10.st_size;
      if ((~*(_DWORD *)(a1 + 72) & 0x300) == 0)
        goto LABEL_18;
      return v7;
    }
    return 0xFFFFFFFFLL;
  }
  if (*__error() != 2)
    return 0xFFFFFFFFLL;
  v5 = open(__s1, 2562, *(_WORD *)(a1 + 116) & 0x1B6);
  if ((v5 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v6 = v5;
  *(_QWORD *)(a1 + 176) = time(0);
  v7 = asl_out_dst_set_access(v6, a1);
  if ((v7 & 0x80000000) != 0)
    unlink(__s1);
  if ((~*(_DWORD *)(a1 + 72) & 0x300) == 0)
  {
    unlink(*(const char **)(a1 + 8));
LABEL_18:
    symlink(__s1, *(const char **)(a1 + 8));
  }
  return v7;
}

void asl_out_module_free(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = *(_QWORD *)(v1 + 24);
      free(*(void **)v1);
      v3 = *(_QWORD **)(v1 + 16);
      if (v3)
      {
        do
        {
          v4 = (_QWORD *)v3[5];
          v5 = v3[3];
          if (v5)
            asl_out_dst_data_release(v5);
          if (*v3)
            asl_msg_release(*v3);
          free((void *)v3[2]);
          free(v3);
          v3 = v4;
        }
        while (v4);
      }
      free((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
}

_DWORD *asl_out_module_new(const char *a1)
{
  _DWORD *v2;
  _DWORD *result;
  char *v4;

  v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x10300408DF105C4uLL);
  result = 0;
  if (a1 && v2)
  {
    v4 = strdup(a1);
    *(_QWORD *)v2 = v4;
    if (v4)
    {
      v2[2] = 1;
      return v2;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return result;
}

void *asl_out_module_parse_line(uint64_t a1, char *a2)
{
  unsigned int v4;
  void *v5;
  void *v6;
  char *j;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  char v12;
  int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  const char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *i;
  int v24;
  _BYTE *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  unsigned __int8 *v30;
  uint64_t v31;
  unsigned int *v32;
  int v33;
  __int16 v34;
  unsigned int *v35;
  unsigned int *v36;
  int v37;
  const char *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;

  while (1)
  {
    v4 = *a2;
    if (v4 > 0x1F)
      break;
    if (v4 != 9)
      return 0;
LABEL_6:
    ++a2;
  }
  if (*a2 <= 0x29u)
  {
    if (v4 != 32)
      return 0;
    goto LABEL_6;
  }
  if (*a2 > 0x3Du)
  {
    if (v4 != 62)
    {
      if (v4 != 63 && v4 != 81)
        return 0;
LABEL_20:
      if (!a1)
        return 0;
      v6 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
      if (!v6)
        return v6;
      v9 = (char *)sub_100012E1C((uint64_t)a2);
      if (!v9)
        return 0;
      v10 = v9;
      v11 = strchr(v9, 32);
      if (v11 || (v11 = strchr(v10, 9)) != 0)
      {
        v12 = 0;
        *v11 = 0;
      }
      else
      {
        v12 = 1;
      }
      if (!strcasecmp(v10, "ignore"))
      {
        v13 = 3;
      }
      else if (!strcasecmp(v10, "skip"))
      {
        v13 = 4;
      }
      else if (!strcasecmp(v10, "claim"))
      {
        v13 = 5;
      }
      else if (!strcasecmp(v10, "notify"))
      {
        v13 = 6;
      }
      else if (!strcasecmp(v10, "file"))
      {
        v13 = 14;
      }
      else if (!strcasecmp(v10, "asl_file"))
      {
        v13 = 12;
      }
      else if (!strcasecmp(v10, "directory")
             || !strcasecmp(v10, "dir")
             || !strcasecmp(v10, "asl_directory")
             || !strcasecmp(v10, "asl_dir")
             || !strcasecmp(v10, "store_dir")
             || !strcasecmp(v10, "store_directory"))
      {
        v13 = 13;
      }
      else if (!strcasecmp(v10, "control"))
      {
        v13 = 16;
      }
      else if (!strcasecmp(v10, "save") || !strcasecmp(v10, "store"))
      {
        v13 = 11;
      }
      else if (!strcasecmp(v10, "access"))
      {
        v13 = 8;
      }
      else if (!strcasecmp(v10, "set"))
      {
        v13 = 9;
      }
      else if (!strcasecmp(v10, "unset"))
      {
        v13 = 10;
      }
      else
      {
        if (strcmp(*(const char **)a1, "com.apple.asl"))
          goto LABEL_81;
        if (strcasecmp(v10, "broadcast"))
        {
          if (!strcasecmp(v10, "forward"))
          {
            v13 = 15;
            goto LABEL_80;
          }
LABEL_81:
          if (*((_DWORD *)v6 + 2))
          {
            if ((v12 & 1) != 0)
              goto LABEL_91;
            for (i = v11 + 1; ; ++i)
            {
              v24 = *(i - 1);
              if (v24 != 32 && v24 != 9)
                break;
            }
            v26 = sub_100012E94(i);
            *((_QWORD *)v6 + 2) = v26;
            if (v26)
            {
LABEL_91:
              *(v10 - 1) = 0;
              if (*a2 == 42)
              {
                v27 = asl_msg_new(1);
              }
              else
              {
                *a2 = 81;
                v27 = asl_msg_from_string(a2);
              }
              *(_QWORD *)v6 = v27;
              if (v27)
              {
                if (*((_DWORD *)v6 + 2) != 11)
                  goto LABEL_108;
                v28 = (unsigned __int8 *)*((_QWORD *)v6 + 2);
                if (v28)
                {
                  if (strncmp(*((const char **)v6 + 2), "/var/log/asl", 0xCuLL))
                  {
                    *((_DWORD *)v6 + 2) = 12;
                    goto LABEL_108;
                  }
                  v31 = a1;
                  v30 = v28;
                }
                else
                {
                  v30 = "/var/log/asl";
                  v31 = a1;
                }
                v32 = sub_100011930(v31, v30, 493);
                if (v32)
                  ++v32[42];
                *((_QWORD *)v6 + 3) = v32;
LABEL_108:
                v33 = *((_DWORD *)v6 + 2);
                if ((v33 - 12) > 2)
                  goto LABEL_133;
                if (v33 == 13)
                  v34 = 493;
                else
                  v34 = 420;
                v35 = sub_100011930(a1, *((unsigned __int8 **)v6 + 2), v34);
                if (!v35)
                {
                  *((_QWORD *)v6 + 3) = 0;
                  *((_DWORD *)v6 + 2) = 0;
                  return v6;
                }
                v36 = v35;
                ++v35[42];
                *((_QWORD *)v6 + 3) = v35;
                if (*((_WORD *)v35 + 58) == 4096)
                  *((_WORD *)v35 + 58) = v34;
                v37 = *((_DWORD *)v6 + 2);
                if (v37 == 12)
                {
LABEL_121:
                  v39 = v36[18] | 0x1000;
                }
                else
                {
                  if (v37 == 13)
                  {
                    v40 = v35[18];
                    v41 = v40 & 0xFFFFDFF7 | 0x2000;
                    if (!v35[16] && (v40 & 0x100) != 0)
                      v35[16] |= 0x20u;
                  }
                  else
                  {
                    if (v37 == 14)
                    {
                      v38 = (const char *)*((_QWORD *)v35 + 3);
                      if (v38 && !strcasecmp(v38, "asl"))
                      {
                        *((_DWORD *)v6 + 2) = 12;
                        goto LABEL_121;
                      }
LABEL_129:
                      if (!v36[32])
                      {
                        sub_100012F38(v36, "0");
                        v36 = (unsigned int *)*((_QWORD *)v6 + 3);
                      }
                      if (!v36[36])
                        sub_100012FE0(v36, "80");
LABEL_133:
                      v42 = *(_QWORD *)(a1 + 16);
                      if (v42)
                      {
                        do
                        {
                          v22 = v42;
                          v42 = *(_QWORD *)(v42 + 40);
                        }
                        while (v42);
                        goto LABEL_135;
                      }
LABEL_136:
                      *(_QWORD *)(a1 + 16) = v6;
                      return v6;
                    }
                    v41 = v35[18];
                  }
                  v39 = v41 & 0xFFFFFFFB;
                }
                v36[18] = v39;
                goto LABEL_129;
              }
LABEL_99:
              free(*((void **)v6 + 2));
            }
          }
LABEL_100:
          free(v6);
          return 0;
        }
        v13 = 7;
      }
LABEL_80:
      *((_DWORD *)v6 + 2) = v13;
      goto LABEL_81;
    }
    sub_100011930(a1, (unsigned __int8 *)a2 + 1, 4096);
    return 0;
  }
  if (v4 == 42)
    goto LABEL_20;
  if (v4 != 61 || !a1)
    return 0;
  v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  v6 = v5;
  if (!v5)
    return v6;
  for (j = a2 + 1; ; ++j)
  {
    v8 = *j;
    if (v8 != 39 && v8 != 32)
      break;
  }
  *((_DWORD *)v5 + 2) = 1;
  if (*j != 91)
  {
    v17 = strchr(a2, 91);
    if (!v17)
    {
      *((_QWORD *)v6 + 2) = sub_100012E94(j);
      goto LABEL_76;
    }
    v18 = v17;
    if (!strncmp(v17, "[File ", 6uLL) || !strncmp(v18, "[File\t", 6uLL))
    {
      v19 = 17;
    }
    else if (!strncmp(v18, "[Plist ", 7uLL) || !strncmp(v18, "[Plist\t", 7uLL))
    {
      v19 = 18;
    }
    else
    {
      if (strncmp(v18, "[Profile ", 9uLL) && strncmp(v18, "[Profile\t", 9uLL))
        goto LABEL_74;
      v19 = 19;
    }
    *((_DWORD *)v6 + 2) = v19;
LABEL_74:
    *((_BYTE *)v18 - 1) = 0;
    *((_QWORD *)v6 + 2) = sub_100012E94(j);
    *((_WORD *)v18 - 1) = 8273;
    a2 = (char *)(v18 - 2);
    goto LABEL_75;
  }
  v14 = (char *)sub_100012E1C((uint64_t)a2);
  if (!v14)
    goto LABEL_100;
  v15 = v14;
  *((_QWORD *)v6 + 2) = sub_100012E94(v14);
  if (*(v15 - 1) == 93)
    v16 = 0;
  else
    v16 = -1;
  v15[v16] = 0;
  *a2 = 81;
LABEL_75:
  v20 = asl_msg_from_string(a2);
  *(_QWORD *)v6 = v20;
  if (!v20)
    goto LABEL_99;
LABEL_76:
  v21 = *(_QWORD *)(a1 + 16);
  if (!v21)
    goto LABEL_136;
  do
  {
    v22 = v21;
    v21 = *(_QWORD *)(v21 + 40);
  }
  while (v21);
LABEL_135:
  *(_QWORD *)(v22 + 40) = v6;
  return v6;
}

unsigned int *sub_100011930(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  unsigned int *v3;
  int v6;
  char *v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  int v14;
  char *v15;
  int v16;
  unsigned int v17;
  const char **v18;
  uint64_t v19;
  const char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t i;
  const char *v28;
  char *v29;
  int v30;
  void *v31;
  unsigned int *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  const char *v37;
  char *v38;
  char *v39;
  _BYTE *v41;
  _BYTE *v42;
  unsigned int v43;
  const char *v44;
  char *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  const char *v49;
  unsigned int v50;
  uint64_t j;
  unsigned int v52;
  char *v53;
  unsigned int v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  char *__s;
  unsigned __int8 *v59;

  v3 = 0;
  if (!a1 || !a2)
    return v3;
  while (1)
  {
    v6 = *a2;
    if (v6 != 32 && v6 != 9)
      break;
    ++a2;
  }
  __s = 0;
  v59 = a2;
  v8 = next_word_from_string(&v59);
  __s = v8;
  if (!v8)
    return 0;
  v57 = a1;
  v9 = (void **)explode(v8, "/");
  v10 = asl_string_new(0);
  v11 = v10;
  v12 = 0;
  v13 = 5;
  v56 = a3;
  if (v9 && v10)
  {
    v14 = 5;
    while (1)
    {
      v15 = (char *)*v9;
      if (*v9)
        break;
      v12 = 0;
      v16 = 0;
LABEL_33:
      free_string_list(v9);
      if (v16 != 1 || v12)
      {
        v9 = 0;
        v13 = v14;
        goto LABEL_40;
      }
      free(__s);
      __s = (char *)asl_string_release_return_bytes(v11);
      v11 = asl_string_new(0);
      v24 = explode(__s, "/");
      v9 = (void **)v24;
      v13 = v14 - 1;
      if (v14 >= 2)
      {
        if (v24)
        {
          --v14;
          if (v11)
            continue;
        }
      }
      goto LABEL_40;
    }
    v16 = 0;
    v12 = 0;
    v17 = 1;
    v18 = (const char **)v9;
    while (strncmp(v15, "$ENV(", 5uLL))
    {
      if (v17 == 1)
      {
        if (!*(_BYTE *)*v9)
          goto LABEL_25;
        v19 = v11;
        v20 = v15;
      }
      else
      {
        asl_string_append_char_no_encoding(v11, 47);
        v20 = *v18;
        v19 = v11;
      }
      asl_string_append_no_encoding(v19, v20);
      if (!v12)
      {
LABEL_29:
        v12 = strcmp(*v18, "..") == 0;
        goto LABEL_30;
      }
LABEL_26:
      v12 = 1;
LABEL_30:
      v18 = (const char **)&v9[v17];
      v15 = (char *)*v18;
      ++v17;
      if (!*v18)
        goto LABEL_33;
    }
    v21 = strchr(v15, 41);
    if (v21)
    {
      *v21 = 0;
      v15 = (char *)*v18;
    }
    v22 = getenv(v15 + 5);
    if (v22)
    {
      v23 = v22;
      if (*v22 != 47)
        asl_string_append_char_no_encoding(v11, 47);
      asl_string_append_no_encoding(v11, v23);
      v16 = 1;
    }
LABEL_25:
    if (!v12)
      goto LABEL_29;
    goto LABEL_26;
  }
LABEL_40:
  free(__s);
  free_string_list(v9);
  if (v12 || !v13)
  {
    asl_string_release(v11);
    return 0;
  }
  v25 = asl_string_release_return_bytes(v11);
  __s = (char *)v25;
  v26 = v57;
  for (i = *(_QWORD *)(v57 + 16); i; i = *(_QWORD *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      v3 = *(unsigned int **)(i + 24);
      if (v3)
      {
        v28 = (const char *)*((_QWORD *)v3 + 1);
        if (v25 && v28)
        {
          if (*(_BYTE *)v25 != 47)
          {
            v29 = strrchr(*((char **)v3 + 1), 47);
            if (v29)
              v28 = v29 + 1;
          }
          if (!strcmp((const char *)v25, v28))
          {
LABEL_178:
            free((void *)v25);
            return v3;
          }
        }
        else if (!(v25 | (unint64_t)v28))
        {
          goto LABEL_178;
        }
      }
    }
  }
  if (*(_BYTE *)v25 == 47)
  {
    v30 = 8;
    if (strncmp((const char *)v25, "/var/log/", 9uLL))
    {
      if (!strncmp((const char *)v25, "/Library/Logs/", 0xEuLL))
        v30 = 8;
      else
        v30 = 40;
    }
  }
  else
  {
    if (!strcmp(*(const char **)v57, "com.apple.asl"))
      asprintf(&__s, "%s/%s");
    else
      asprintf(&__s, "%s/module/%s/%s");
    free((void *)v25);
    v30 = 8;
  }
  v31 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  v32 = (unsigned int *)malloc_type_calloc(1uLL, 0xC8uLL, 0x10D00407E9428A6uLL);
  v3 = v32;
  if (!v31 || !v32)
  {
    free(__s);
    free(v31);
    free(v3);
    return 0;
  }
  v32[42] = 1;
  v33 = __s;
  *((_QWORD *)v32 + 1) = __s;
  v34 = strrchr(v33, 47);
  if (v34)
  {
    v35 = v34;
    *v34 = 0;
    *(_QWORD *)v3 = strdup(*((const char **)v3 + 1));
    *v35 = 47;
    v33 = __s;
  }
  *((_WORD *)v3 + 58) = v56;
  v3[28] = 604800;
  v3[18] = v30;
  v36 = strrchr(v33, 47);
  if (v36)
    v37 = v36 + 1;
  else
    v37 = v33;
  v38 = strrchr(v33, 46);
  if (v38)
  {
    v39 = v38;
    *v38 = 0;
    *((_QWORD *)v3 + 6) = strdup(v38 + 1);
    *((_QWORD *)v3 + 5) = strdup(v37);
    *v39 = 46;
  }
  else
  {
    *((_QWORD *)v3 + 5) = strdup(v37);
  }
  v41 = next_word_from_string(&v59);
  if (v41)
  {
    v42 = v41;
    do
    {
      if (!strncasecmp(v42, "mode=", 5uLL))
      {
        *((_WORD *)v3 + 58) = strtol(v42 + 5, 0, 0);
      }
      else if (!strncasecmp(v42, "uid=", 4uLL))
      {
        sub_100012F38(v3, v42 + 4);
      }
      else if (!strncasecmp(v42, "gid=", 4uLL))
      {
        sub_100012FE0(v3, v42 + 4);
      }
      else
      {
        if (!strncasecmp(v42, "fmt=", 4uLL))
        {
          v44 = v42 + 4;
LABEL_109:
          *((_QWORD *)v3 + 3) = sub_100013088(v44);
          goto LABEL_124;
        }
        if (!strncasecmp(v42, "format=", 7uLL))
        {
          v44 = v42 + 7;
          goto LABEL_109;
        }
        if (!strncasecmp(v42, "dest=", 5uLL))
        {
          v45 = v42 + 5;
LABEL_112:
          *((_QWORD *)v3 + 4) = sub_100012E94(v45);
          goto LABEL_124;
        }
        if (!strncasecmp(v42, "dst=", 4uLL))
        {
          v45 = v42 + 4;
          goto LABEL_112;
        }
        if (!strncasecmp(v42, "coalesce=", 9uLL))
        {
          if (!strncasecmp(v42 + 9, "0", 1uLL) || !strncasecmp(v42 + 9, "off", 3uLL))
          {
            v3[18] &= ~8u;
            v26 = v57;
          }
          else
          {
            v26 = v57;
            if (!strncasecmp(v42 + 9, "false", 5uLL))
            {
              v43 = v3[18] & 0xFFFFFFF7;
              goto LABEL_123;
            }
          }
        }
        else
        {
          if (!strncasecmp(v42, "compress", 8uLL))
          {
            v43 = v3[18] | 0x10;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "extern", 6uLL))
          {
            v43 = v3[18] | 0x40;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "truncate", 8uLL))
          {
            v43 = v3[18] | 0x80;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "dir", 3uLL))
          {
            v43 = v3[18] | 0x2000;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "soft", 4uLL))
          {
            v43 = v3[18] | 0x800;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "file_max=", 9uLL))
          {
            *((_QWORD *)v3 + 19) = asl_core_str_to_size(v42 + 9);
            goto LABEL_124;
          }
          if (!strncasecmp(v42, "all_max=", 8uLL))
          {
            *((_QWORD *)v3 + 20) = asl_core_str_to_size(v42 + 8);
            goto LABEL_124;
          }
          if (!strncasecmp(v42, "style=", 6uLL) || !strncasecmp(v42, "rotate=", 7uLL))
          {
            v46 = 6;
            if (*v42 == 114)
              v46 = 7;
            if (sub_100013160((uint64_t)v3, &v42[v46]))
              goto LABEL_124;
LABEL_136:
            v43 = v3[18] | 4;
LABEL_123:
            v3[18] = v43;
            goto LABEL_124;
          }
          if (!strncasecmp(v42, "rotate", 6uLL))
          {
            if (*((_QWORD *)v3 + 6))
              v47 = 536870913;
            else
              v47 = 268435457;
            v3[16] = v47;
            goto LABEL_136;
          }
          if (!strncasecmp(v42, "crashlog", 8uLL))
          {
            v43 = v3[18] & 0xFFFFFAF3 | 0x504;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "basestamp", 9uLL))
          {
            v43 = v3[18] | 0x100;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "link", 4uLL) || !strncasecmp(v42, "symlink", 7uLL))
          {
            v43 = v3[18] | 0x200;
            goto LABEL_123;
          }
          if (!strncasecmp(v42, "ttl", 3uLL))
          {
            v48 = (char)v42[3];
            if (v48 == 61)
            {
              v3[28] = asl_core_str_to_time(v42 + 4, 86400);
              v26 = v57;
            }
            else
            {
              v26 = v57;
              if ((v48 & 0xFFFFFFF8) == 0x30 && v42[4] == 61)
                v3[(v48 - 48) + 20] = asl_core_str_to_time(v42 + 5, 86400);
            }
            goto LABEL_124;
          }
          v26 = v57;
          if (!strncasecmp(v42, "size_only", 9uLL))
          {
            v43 = v3[18] | 0x8000;
            goto LABEL_123;
          }
        }
      }
LABEL_124:
      free(v42);
      v42 = next_word_from_string(&v59);
    }
    while (v42);
  }
  v49 = (const char *)*((_QWORD *)v3 + 1);
  if (!strncasecmp(v49, "/Library/Logs/CrashReporter", 0x1BuLL)
    || !strncasecmp(v49, "/var/mobile/Library/Logs/CrashReporter", 0x26uLL)
    || !strncasecmp(v49, "/private/var/mobile/Library/Logs/CrashReporter", 0x2EuLL))
  {
    v3[18] = v3[18] & 0xFFFFFAF3 | 0x504;
  }
  v50 = v3[28];
  for (j = 20; j != 28; ++j)
  {
    v52 = v3[j];
    if (v52 > v50)
    {
      v3[28] = v52;
      v50 = v52;
    }
  }
  v53 = (char *)*((_QWORD *)v3 + 3);
  if (!v53)
  {
    v53 = strdup("std");
    *((_QWORD *)v3 + 3) = v53;
  }
  if (strcmp(v53, "std") && strcmp(v53, "bsd"))
    v3[18] &= ~8u;
  if (!strcmp(v53, "std") || !strcmp(v53, "bsd") || !strcmp(v53, "msg"))
  {
    v54 = v3[18] | 0x4000;
    v3[18] = v54;
  }
  else
  {
    v54 = v3[18];
  }
  if ((~v54 & 0x102) == 0)
  {
    v54 = v54 & 0xFFFFFFFC | 1;
    v3[18] = v54;
  }
  if (!strcmp(v53, "raw"))
    *((_QWORD *)v3 + 7) = "sec";
  if (!strcmp(v49, "/var/log/asl"))
  {
    v54 = 0x2000;
    v3[18] = 0x2000;
  }
  v55 = *((_QWORD *)v3 + 19);
  if (!v55)
  {
    v55 = *((_QWORD *)v3 + 20);
    *((_QWORD *)v3 + 19) = v55;
  }
  if ((v54 & 0x8000) != 0 && (!v55 || !*((_QWORD *)v3 + 20)))
  {
    v54 &= ~0x8000u;
    v3[18] = v54;
  }
  if ((~v54 & 0x8400) == 0)
    v3[18] = v54 & 0xFFFF7FFF;
  *((_DWORD *)v31 + 2) = 2;
  *((_QWORD *)v31 + 3) = v3;
  *((_QWORD *)v31 + 5) = *(_QWORD *)(v26 + 16);
  *(_QWORD *)(v26 + 16) = v31;
  return v3;
}

_DWORD *asl_out_module_init_from_file(const char *a1, FILE *a2)
{
  _DWORD *v3;
  char *line_from_file;
  char *v5;

  if (!a2)
    return 0;
  v3 = asl_out_module_new(a1);
  if (v3)
  {
    line_from_file = get_line_from_file(a2);
    if (line_from_file)
    {
      v5 = line_from_file;
      do
      {
        asl_out_module_parse_line((uint64_t)v3, v5);
        free(v5);
        v5 = get_line_from_file(a2);
      }
      while (v5);
    }
  }
  return v3;
}

_DWORD *asl_out_module_init()
{
  uint64_t v0;
  FILE *v2;
  FILE *v3;
  _DWORD *v4;
  int v5[2];

  *(_QWORD *)v5 = 0;
  sub_10001258C((DIR *)v5, "/usr/local/etc/asl", 2);
  sub_10001258C((DIR *)v5, "/etc/asl", 0);
  v0 = *(_QWORD *)v5;
  if (!sub_100012720(*(uint64_t *)v5, "com.apple.asl"))
  {
    v2 = fopen("/etc/asl.conf", "r");
    if (v2)
    {
      v3 = v2;
      v4 = asl_out_module_init_from_file("com.apple.asl", v2);
      fclose(v3);
      v0 = *(_QWORD *)v5;
      if (v4)
      {
        *((_QWORD *)v4 + 3) = *(_QWORD *)v5;
        return v4;
      }
    }
    else
    {
      return *(_DWORD **)v5;
    }
  }
  return (_DWORD *)v0;
}

DIR *sub_10001258C(DIR *result, char *a2, int a3)
{
  uint64_t *p_dd_fd;
  uint64_t v6;
  _DWORD *v7;
  DIR *v8;
  const char *v9;
  dirent *v10;
  char *d_name;
  const char *v12;
  FILE *v13;
  FILE *v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;
  char __str[1024];

  if (result && a2)
  {
    p_dd_fd = (uint64_t *)&result->__dd_fd;
    v6 = *(_QWORD *)&result->__dd_fd;
    if (*(_QWORD *)&result->__dd_fd)
    {
      do
      {
        v7 = (_DWORD *)v6;
        v6 = *(_QWORD *)(v6 + 24);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    result = opendir(a2);
    if (result)
    {
      v8 = result;
      v9 = "%s/%s";
      while (1)
      {
        v10 = readdir(v8);
        if (!v10)
          break;
        d_name = v10->d_name;
        if (v10->d_name[0] != 46 && !sub_100012720(*p_dd_fd, d_name))
        {
          v12 = v9;
          snprintf(__str, 0x400uLL, v9, a2, d_name);
          v13 = fopen(__str, "r");
          if (v13 && (v14 = v13, v15 = asl_out_module_init_from_file(d_name, v13), fclose(v14), v15))
          {
            v15[2] |= a3;
            v16 = strcmp(d_name, "com.apple.asl");
            v17 = *p_dd_fd;
            if (v16)
            {
              if (v17)
                *((_QWORD *)v7 + 3) = v15;
              else
                *p_dd_fd = (uint64_t)v15;
            }
            else
            {
              *((_QWORD *)v15 + 3) = v17;
              *p_dd_fd = (uint64_t)v15;
              if (v7)
                v15 = v7;
            }
          }
          else
          {
            v15 = v7;
          }
          v7 = v15;
          v9 = v12;
        }
      }
      return (DIR *)closedir(v8);
    }
  }
  return result;
}

uint64_t sub_100012720(uint64_t a1, char *__s2)
{
  uint64_t result;

  result = 0;
  if (a1 && __s2)
  {
    while (!*(_QWORD *)a1 || strcmp(*(const char **)a1, __s2))
    {
      a1 = *(_QWORD *)(a1 + 24);
      if (!a1)
        return 0;
    }
    return a1;
  }
  return result;
}

void asl_out_module_print(FILE *a1, uint64_t a2)
{
  uint64_t v2;
  char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  char v19[150];

  v2 = *(_QWORD *)(a2 + 16);
  if (v2)
  {
    while (1)
    {
      v18 = 0;
      v4 = (char *)asl_msg_to_string(*(_QWORD *)v2, &v18);
      fprintf(a1, "  %s", off_1000194B0[*(unsigned int *)(v2 + 8)]);
      if (*(_QWORD *)v2)
        fprintf(a1, " %s", v4);
      if (*(_QWORD *)(v2 + 16))
        fprintf(a1, " %s", *(const char **)(v2 + 16));
      if (*(_DWORD *)(v2 + 8) != 2)
        goto LABEL_68;
      v5 = *(_QWORD *)(v2 + 24);
      if (v5)
        break;
      fwrite("  data: NULL", 0xCuLL, 1uLL, a1);
LABEL_68:
      fputc(10, a1);
      v2 = *(_QWORD *)(v2 + 40);
      free(v4);
      if (!v2)
        return;
    }
    fprintf(a1, "%s\n", *(const char **)(v5 + 8));
    fprintf(a1, "    rules: %u\n", *(_DWORD *)(v5 + 168) - 1);
    v6 = *(const char **)(v5 + 32);
    if (!v6)
      v6 = "(none)";
    fprintf(a1, "    dest: %s\n", v6);
    v7 = *(const char **)(v5 + 24);
    if (!v7)
      v7 = "std";
    fprintf(a1, "    format: %s\n", v7);
    v8 = *(const char **)(v5 + 56);
    if (!v8)
      v8 = "lcl";
    fprintf(a1, "    time_format: %s\n", v8);
    fprintf(a1, "    flags: 0x%08x", *(_DWORD *)(v5 + 72));
    if (!*(_DWORD *)(v5 + 72))
    {
LABEL_34:
      fputc(10, a1);
      if ((*(_BYTE *)(v5 + 72) & 4) != 0)
      {
        fwrite("        rotatation style: ", 0x1AuLL, 1uLL, a1);
        v11 = *(_DWORD *)(v5 + 64);
        if ((v11 & 0x10000000) != 0)
        {
          sub_100012DB0(v11);
          fprintf(a1, "[base=%s].%s\n");
        }
        else if ((v11 & 0x20000000) != 0)
        {
          sub_100012DB0(v11);
          fprintf(a1, "[base=%s].[ext=%s].%s\n");
        }
        else if ((v11 & 0x40000000) != 0)
        {
          sub_100012DB0(v11);
          fprintf(a1, "[base=%s].%s.[ext=%s]\n");
        }
        else
        {
          fprintf(a1, "0x%08x\n");
        }
      }
      asl_core_time_to_str(*(unsigned int *)(v5 + 112), v19, 150);
      fprintf(a1, "    ttl: %s\n", v19);
      v12 = 0;
      do
      {
        v13 = *(_DWORD *)(v5 + 80 + 4 * v12);
        if (v12 > 6)
          break;
        ++v12;
      }
      while (!v13);
      if (v13)
      {
        for (i = 0; i != 8; ++i)
        {
          v15 = *(unsigned int *)(v5 + 80 + 4 * i);
          if (!(_DWORD)v15)
            v15 = *(unsigned int *)(v5 + 112);
          asl_core_time_to_str(v15, v19, 150);
          fprintf(a1, " [%d %s]", i, v19);
        }
        fputc(10, a1);
      }
      fprintf(a1, "    mode: 0%o\n", *(unsigned __int16 *)(v5 + 116));
      fprintf(a1, "    file_max: %lu\n", *(_QWORD *)(v5 + 152));
      fprintf(a1, "    all_max: %lu\n", *(_QWORD *)(v5 + 160));
      fwrite("    uid:", 8uLL, 1uLL, a1);
      if (*(_DWORD *)(v5 + 128))
      {
        v16 = 0;
        do
          fprintf(a1, " %d", *(_DWORD *)(*(_QWORD *)(v5 + 120) + 4 * v16++));
        while (v16 < *(unsigned int *)(v5 + 128));
      }
      fputc(10, a1);
      fwrite("    gid:", 8uLL, 1uLL, a1);
      if (*(_DWORD *)(v5 + 144))
      {
        v17 = 0;
        do
          fprintf(a1, " %d", *(_DWORD *)(*(_QWORD *)(v5 + 136) + 4 * v17++));
        while (v17 < *(unsigned int *)(v5 + 144));
      }
      goto LABEL_68;
    }
    fputc(32, a1);
    v9 = *(_DWORD *)(v5 + 72);
    if ((v9 & 1) != 0)
    {
      fprintf(a1, "%cenabled", 40);
      v9 = *(_DWORD *)(v5 + 72);
      v10 = 32;
      if ((v9 & 0x800) == 0)
        goto LABEL_21;
    }
    else
    {
      v10 = 40;
      if ((v9 & 0x800) == 0)
      {
LABEL_21:
        if ((v9 & 4) != 0)
        {
          fprintf(a1, "%crotate", v10);
          v9 = *(_DWORD *)(v5 + 72);
          v10 = 32;
          if ((v9 & 8) == 0)
          {
LABEL_23:
            if ((v9 & 0x10) == 0)
              goto LABEL_24;
            goto LABEL_41;
          }
        }
        else if ((v9 & 8) == 0)
        {
          goto LABEL_23;
        }
        fprintf(a1, "%ccoalesce", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x10) == 0)
        {
LABEL_24:
          if ((v9 & 0x100) == 0)
            goto LABEL_25;
          goto LABEL_42;
        }
LABEL_41:
        fprintf(a1, "%ccompress", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x100) == 0)
        {
LABEL_25:
          if ((v9 & 0x200) == 0)
            goto LABEL_26;
          goto LABEL_43;
        }
LABEL_42:
        fprintf(a1, "%cbasestamp", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x200) == 0)
        {
LABEL_26:
          if ((v9 & 0x20) == 0)
            goto LABEL_27;
          goto LABEL_44;
        }
LABEL_43:
        fprintf(a1, "%csymlink", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x20) == 0)
        {
LABEL_27:
          if ((v9 & 0x40) == 0)
            goto LABEL_28;
          goto LABEL_45;
        }
LABEL_44:
        fprintf(a1, "%cnon-std_dir", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x40) == 0)
        {
LABEL_28:
          if ((v9 & 0x400) == 0)
            goto LABEL_29;
          goto LABEL_46;
        }
LABEL_45:
        fprintf(a1, "%cexternal", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x400) == 0)
        {
LABEL_29:
          if ((v9 & 0x1000) == 0)
            goto LABEL_30;
          goto LABEL_47;
        }
LABEL_46:
        fprintf(a1, "%ccrashlog", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x1000) == 0)
        {
LABEL_30:
          if ((v9 & 0x2000) == 0)
            goto LABEL_31;
          goto LABEL_48;
        }
LABEL_47:
        fprintf(a1, "%casl_file", v10);
        v9 = *(_DWORD *)(v5 + 72);
        v10 = 32;
        if ((v9 & 0x2000) == 0)
        {
LABEL_31:
          if ((v9 & 0x8000) == 0)
          {
LABEL_33:
            fputc(41, a1);
            goto LABEL_34;
          }
LABEL_32:
          fprintf(a1, "%csize_only", v10);
          goto LABEL_33;
        }
LABEL_48:
        fprintf(a1, "%casl_directory", v10);
        v10 = 32;
        if ((*(_DWORD *)(v5 + 72) & 0x8000) == 0)
          goto LABEL_33;
        goto LABEL_32;
      }
    }
    fprintf(a1, "%csoft", v10);
    v9 = *(_DWORD *)(v5 + 72);
    v10 = 32;
    goto LABEL_21;
  }
}

const char *sub_100012DB0(char a1)
{
  const char *v1;
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;

  v1 = "<sequence>";
  v2 = "<utc>";
  v3 = "<utc-basic>";
  v4 = "<local>";
  v5 = "<local-basic>";
  if ((a1 & 0x20) == 0)
    v5 = "<unknown>";
  if ((a1 & 0x10) == 0)
    v4 = v5;
  if ((a1 & 8) == 0)
    v3 = v4;
  if ((a1 & 4) == 0)
    v2 = v3;
  if ((a1 & 2) == 0)
    v1 = v2;
  if ((a1 & 1) != 0)
    return "<seconds>";
  else
    return v1;
}

uint64_t sub_100012E1C(uint64_t result)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  uint64_t v6;

  if (result)
  {
    do
    {
      while (1)
      {
        v2 = *(unsigned __int8 *)++result;
        v1 = v2;
        if (v2 <= 31)
          break;
        if (v1 != 32)
        {
          if (v1 != 91)
            return result;
          do
          {
            v3 = *(unsigned __int8 *)(result + 1);
            if (v3 == 92)
            {
              v4 = *(unsigned __int8 *)(result + 2);
              v5 = v4 == 93;
              if (v4 == 93)
                v6 = 3;
              else
                v6 = 2;
              v3 = *(unsigned __int8 *)(result + v6);
              if (v5)
                result += 3;
              else
                result += 2;
            }
            else
            {
              ++result;
            }
          }
          while (v3 != 93);
        }
      }
    }
    while (v1 == 9);
    if (!v1)
      return 0;
  }
  return result;
}

_BYTE *sub_100012E94(char *__s)
{
  const char *i;
  int v2;
  size_t v4;
  size_t v5;
  int v6;
  _BYTE *v8;
  _BYTE *v10;

  if (!__s)
    return 0;
  for (i = __s; ; ++i)
  {
    v2 = *(unsigned __int8 *)i;
    if (v2 != 32 && v2 != 9)
      break;
  }
  v4 = strlen(i);
  if (!v4)
    return 0;
  v5 = v4;
  while (1)
  {
    v6 = i[v5 - 1];
    if (v6 != 32 && v6 != 9)
      break;
    if (!--v5)
      return 0;
  }
  v10 = malloc_type_malloc(v5 + 1, 0xC690138uLL);
  v8 = v10;
  if (v10)
  {
    memcpy(v10, i, v5);
    v8[v5] = 0;
  }
  return v8;
}

_DWORD *sub_100012F38(_DWORD *result, char *a2)
{
  _DWORD *v2;
  int pw_uid;
  passwd *v4;
  int v5;
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;

  if (result && a2)
  {
    v2 = result;
    pw_uid = atoi(a2);
    if (pw_uid == 501)
    {
      v4 = getpwnam("mobile");
      if (v4)
        pw_uid = v4->pw_uid;
      else
        pw_uid = 501;
    }
    v5 = v2[32];
    result = (_DWORD *)*((_QWORD *)v2 + 15);
    if (v5)
    {
      v6 = v2[32];
      v7 = (int *)*((_QWORD *)v2 + 15);
      while (1)
      {
        v8 = *v7++;
        if (v8 == pw_uid)
          break;
        if (!--v6)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      result = reallocf(result, 4 * (v5 + 1));
      *((_QWORD *)v2 + 15) = result;
      if (result)
      {
        v9 = v2[32];
        v2[32] = v9 + 1;
        result[v9] = pw_uid;
      }
      else
      {
        v2[32] = 0;
      }
    }
  }
  return result;
}

_DWORD *sub_100012FE0(_DWORD *result, char *a2)
{
  _DWORD *v2;
  int pw_gid;
  passwd *v4;
  int v5;
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;

  if (result && a2)
  {
    v2 = result;
    pw_gid = atoi(a2);
    if (pw_gid == 501)
    {
      v4 = getpwnam("mobile");
      if (v4)
        pw_gid = v4->pw_gid;
      else
        pw_gid = 501;
    }
    v5 = v2[36];
    result = (_DWORD *)*((_QWORD *)v2 + 17);
    if (v5)
    {
      v6 = v2[36];
      v7 = (int *)*((_QWORD *)v2 + 17);
      while (1)
      {
        v8 = *v7++;
        if (v8 == pw_gid)
          break;
        if (!--v6)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      result = reallocf(result, 4 * (v5 + 1));
      *((_QWORD *)v2 + 17) = result;
      if (result)
      {
        v9 = v2[36];
        v2[36] = v9 + 1;
        result[v9] = pw_gid;
      }
      else
      {
        v2[36] = 0;
      }
    }
  }
  return result;
}

const char *sub_100013088(const char *result)
{
  const char *v1;
  size_t v2;
  size_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  int v10;

  if (!result)
    return result;
  v1 = result;
  v2 = strlen(result);
  v3 = v2;
  if (v2 >= 2)
  {
    v4 = *(unsigned __int8 *)v1;
    if (v4 != 39 && v4 != 34 || v1[v2 - 1] != v4)
    {
LABEL_8:
      v5 = 0;
      v6 = 0;
      do
      {
        if (v1[v6] == 92)
          ++v5;
        ++v6;
      }
      while (v3 != v6);
      v7 = 0;
      goto LABEL_14;
    }
    ++v1;
    v3 = v2 - 2;
  }
  if (v3)
    goto LABEL_8;
  v5 = 0;
  v7 = 1;
LABEL_14:
  result = (const char *)malloc_type_malloc(v3 - v5 + 1, 0x6785B7ABuLL);
  if (result)
  {
    v8 = 0;
    if ((v7 & 1) == 0)
    {
      do
      {
        v10 = *(unsigned __int8 *)v1++;
        v9 = v10;
        if (v10 != 92)
          result[v8++] = v9;
        --v3;
      }
      while (v3);
    }
    result[v8] = 0;
  }
  return result;
}

uint64_t sub_100013160(uint64_t a1, const char *a2)
{
  const char *v4;
  const char *v5;
  const char *i;
  unsigned int v7;
  BOOL v8;
  uint64_t result;
  const char *v10;
  size_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  const char *v18;
  size_t v19;
  int v20;
  int v21;
  int v22;
  int v23;

  if (!a2)
    return 0xFFFFFFFFLL;
  if (*a2 == 46)
  {
    v4 = a2;
  }
  else
  {
    v10 = *(const char **)(a1 + 40);
    if (!v10)
      return 0xFFFFFFFFLL;
    v11 = strlen(*(const char **)(a1 + 40));
    if (strncmp(a2, v10, v11) || (v4 = &a2[v11], a2[v11] != 46))
    {
      v12 = sub_100013304((uint64_t)a2);
      *(_DWORD *)(a1 + 64) = v12;
      if (v12)
      {
        v13 = v12;
        result = 0;
        if (*(_QWORD *)(a1 + 48))
          v14 = 0x20000000;
        else
          v14 = 0x10000000;
        v15 = v14 | v13;
        goto LABEL_26;
      }
      return 0xFFFFFFFFLL;
    }
  }
  v5 = v4 + 1;
  for (i = v4 + 2; ; ++i)
  {
    v7 = *((unsigned __int8 *)i - 1);
    if (v7 <= 0x1F)
    {
      if (*(i - 1))
        v8 = v7 == 9;
      else
        v8 = 1;
      if (v8)
      {
LABEL_24:
        v16 = sub_100013304((uint64_t)v5);
        *(_DWORD *)(a1 + 64) = v16;
        if (!v16)
          return 0xFFFFFFFFLL;
        v17 = v16;
        result = 0;
        v15 = v17 | 0x10000000;
        goto LABEL_26;
      }
      continue;
    }
    if (v7 == 32)
      goto LABEL_24;
    if (v7 == 46)
      break;
  }
  v18 = *(const char **)(a1 + 48);
  if (!v18)
    return 0xFFFFFFFFLL;
  v19 = strlen(*(const char **)(a1 + 48));
  if (strncmp(v5, v18, v19) || v5[v19] != 46)
  {
    if (!strncmp(i, v18, v19))
    {
      v22 = sub_100013304((uint64_t)v5);
      *(_DWORD *)(a1 + 64) = v22;
      if (v22)
      {
        v23 = v22;
        result = 0;
        v15 = v23 | 0x40000000;
        goto LABEL_26;
      }
    }
    return 0xFFFFFFFFLL;
  }
  v20 = sub_100013304((uint64_t)i);
  *(_DWORD *)(a1 + 64) = v20;
  if (!v20)
    return 0xFFFFFFFFLL;
  v21 = v20;
  result = 0;
  v15 = v21 | 0x20000000;
LABEL_26:
  *(_DWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_100013304(uint64_t result)
{
  unint64_t i;
  int v2;
  BOOL v5;
  uint64_t v9;
  int v10;

  if (!result)
    return result;
  for (i = 0; ; ++i)
  {
    v2 = *(unsigned __int8 *)(result + i);
    if ((v2 - 97) >= 0x1A)
      break;
    if (i > 0xA)
      goto LABEL_9;
LABEL_8:
    *((_BYTE *)&v9 + i) = v2;
  }
  if (i <= 0xA && v2 == 45)
    goto LABEL_8;
LABEL_9:
  *((_BYTE *)&v9 + i) = 0;
  if ((_DWORD)v9 == 6514035 || v9 == 0x73646E6F636573)
    return 1;
  if (!(v9 ^ 0x756C757A | BYTE4(v9)) || (_DWORD)v9 == 6517877)
    return 4;
  if ((_DWORD)v9 == 761492597 && WORD2(v9) == 98)
    return 8;
  if (v9 == 0x697361622D637475 && (unsigned __int16)v10 == 99)
    return 8;
  v5 = (_DWORD)v9 == 1633906540 && WORD2(v9) == 108;
  if (v5 || (_DWORD)v9 == 7103340)
    return 16;
  if (v9 == 0x622D6C61636F6CLL)
    return 32;
  if ((_DWORD)v9 == 762078060 && WORD2(v9) == 98)
    return 32;
  if (v9 == 0x61622D6C61636F6CLL && v10 == 6515059)
    return 32;
  if (v9 == 0x697361622D6C636CLL && (unsigned __int16)v10 == 99)
    return 32;
  if ((unsigned __int16)v9 == 35 || (_DWORD)v9 == 7431539)
    return 2;
  return 2 * ((v9 ^ 0x65636E6575716573 | v10) == 0);
}

uint64_t (*asl_ipc_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 123) >= 0xFFFFFFF7)
    return _asl_ipc_subsystem[5 * (v1 - 114) + 5];
  else
    return 0;
}

uint64_t sub_1000135A4(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  vm_address_t *v5;
  int v6;
  vm_address_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    v3 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    v3 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_11;
  }
  v4 = (_DWORD *)(a2 + 28);
  *(_QWORD *)(a2 + 32) = 0x11000000000000;
  v5 = (vm_address_t *)(a2 + 40);
  *(_DWORD *)(a2 + 48) = 16777473;
  v6 = *(_DWORD *)(result + 12);
  v7 = *(_QWORD *)(result + 28);
  v8 = *(unsigned int *)(result + 40);
  v9 = *(_OWORD *)(result + 92);
  v10[0] = *(_OWORD *)(result + 76);
  v10[1] = v9;
  result = sub_100009B80(v6, v7, v8, v4, v5, (_DWORD *)(a2 + 64), (int *)(a2 + 68), v10);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 52) = *(_DWORD *)(a2 + 64);
    *(NDR_record_t *)(a2 + 56) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 72;
    *(_DWORD *)(a2 + 24) = 2;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000136D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  int v11;
  vm_address_t v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1 && (v9 = *(unsigned int *)(result + 40), (_DWORD)v9 == *(_DWORD *)(result + 52)))
    {
      if (!*(_DWORD *)(result + 56) && *(_DWORD *)(result + 60) > 0x1Fu)
      {
        v11 = *(_DWORD *)(result + 12);
        v12 = *(_QWORD *)(result + 28);
        v13 = *(_OWORD *)(result + 92);
        v14[0] = *(_OWORD *)(result + 76);
        v14[1] = v13;
        result = sub_10000980C(v11, v12, v9, v14, a5, a6, a7, a8);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      v10 = -309;
    }
    else
    {
      v10 = -300;
    }
  }
  else
  {
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100013798(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(_DWORD *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = sub_100009F88(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100013830(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v9 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v10 = *(unsigned int *)(result + 12);
      v11 = *(unsigned int *)(result + 32);
      v12 = *(_OWORD *)(result + 72);
      v13[0] = *(_OWORD *)(result + 56);
      v13[1] = v12;
      result = sub_10000A294(v10, v11, (uint64_t)v13, a4, a5, a6, a7, a8);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v9 = -309;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000138C8(uint64_t result, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  int v5;
  vm_address_t v6;
  vm_size_t v7;
  uint64_t v8;
  int v9;
  int v10;
  __int128 v11;
  _OWORD v12[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 72)
  {
    v3 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    v3 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 72) || *(_DWORD *)(result + 76) <= 0x1Fu)
  {
    v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  v4 = (_QWORD *)(a2 + 28);
  v5 = *(_DWORD *)(result + 12);
  v6 = *(_QWORD *)(result + 28);
  v7 = *(unsigned int *)(result + 40);
  v8 = *(_QWORD *)(result + 56);
  v9 = *(_DWORD *)(result + 64);
  v10 = *(_DWORD *)(result + 68);
  v11 = *(_OWORD *)(result + 108);
  v12[0] = *(_OWORD *)(result + 92);
  v12[1] = v11;
  result = sub_1000089E0(v5, v6, v7, v8, v9, v10, v4, (_DWORD *)(a2 + 52), (_QWORD *)(a2 + 56), (int *)(a2 + 64), v12);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000139F8(uint64_t result, uint64_t a2)
{
  int v3;
  _QWORD *v4;
  int v5;
  vm_address_t v6;
  vm_size_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 80)
  {
    v3 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    v3 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 80) || *(_DWORD *)(result + 84) <= 0x1Fu)
  {
    v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  v4 = (_QWORD *)(a2 + 28);
  v5 = *(_DWORD *)(result + 12);
  v6 = *(_QWORD *)(result + 28);
  v7 = *(unsigned int *)(result + 40);
  v8 = *(_QWORD *)(result + 56);
  v9 = *(_QWORD *)(result + 64);
  v10 = *(_DWORD *)(result + 72);
  v11 = *(_DWORD *)(result + 76);
  v12 = *(_OWORD *)(result + 116);
  v14[0] = *(_OWORD *)(result + 100);
  v14[1] = v12;
  *((_QWORD *)&v13 + 1) = a2 + 64;
  *(_QWORD *)&v13 = a2 + 56;
  result = sub_1000097B8(v5, v6, v7, v8, v9, v10, v11, v4, (_DWORD *)(a2 + 52), v13, v14);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t asl_ipc_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 123) >= 0xFFFFFFF7
    && (v5 = (void (*)(void))_asl_ipc_subsystem[5 * (v4 - 114) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100013BB0(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;

  v8 = a2;
  sub_1000061A0("FATAL ERROR: mach_msg() send failed with status 0x%08x\n", a2, a3, a4, a5, a6, a7, a8, a2);
  snprintf(a1, 0x100uLL, "[Sender syslogd] [Level 1] [PID %u] [Facility syslog] [Message FATAL ERROR: mach_msg() send failed with status 0x%08x]", dword_10001E37C, v8);
  sub_100006E30((uint64_t)a1);
  sleep(1u);
  abort();
}
