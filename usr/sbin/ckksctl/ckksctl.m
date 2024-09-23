double sub_100003ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = sub_100003BF4(a2);
  v5 = malloc_type_malloc(104 * v4 + 208, 0x109004046C4FC64uLL);
  *(_QWORD *)(a1 + 16) = v5;
  *v5 = unk_10000C2C0;
  v5[1] = *(_OWORD *)algn_10000C2D0;
  *((_QWORD *)v5 + 12) = 0;
  v5[4] = unk_10000C300;
  v5[5] = unk_10000C310;
  v5[2] = xmmword_10000C2E0;
  v5[3] = unk_10000C2F0;
  if (v4)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = *(_QWORD *)(a2 + 16);
      if (!*(_BYTE *)(v8 + v6 + 80))
        goto LABEL_6;
      if (SecIsInternalRelease())
        break;
LABEL_7:
      v6 += 104;
      if (!--v4)
        goto LABEL_10;
    }
    v8 = *(_QWORD *)(a2 + 16);
LABEL_6:
    v9 = *(_QWORD *)(a1 + 16) + 104 * v7++;
    v10 = (__int128 *)(v8 + v6);
    v11 = *v10;
    v12 = v10[2];
    *(_OWORD *)(v9 + 16) = v10[1];
    *(_OWORD *)(v9 + 32) = v12;
    *(_OWORD *)v9 = v11;
    v13 = v10[3];
    v14 = v10[4];
    v15 = v10[5];
    *(_QWORD *)(v9 + 96) = *((_QWORD *)v10 + 12);
    *(_OWORD *)(v9 + 64) = v14;
    *(_OWORD *)(v9 + 80) = v15;
    *(_OWORD *)(v9 + 48) = v13;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_10:
  v16 = *(_QWORD *)(a1 + 16) + 104 * v7;
  *(_QWORD *)(v16 + 96) = 0;
  result = 0.0;
  *(_OWORD *)(v16 + 64) = 0u;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 32) = 0u;
  *(_OWORD *)(v16 + 48) = 0u;
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  return result;
}

uint64_t sub_100003BF4(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  _OWORD v4[6];
  uint64_t v5;

  if (!a1)
    return 0;
  v1 = *(char **)(a1 + 16);
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v2 = 0;
  if (v1)
  {
    do
    {
      if (!memcmp(v1, v4, 0x68uLL))
        break;
      ++v2;
      v1 += 104;
    }
    while (v2 != 1024);
  }
  return v2;
}

uint64_t sub_100003C68(uint64_t result)
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  _QWORD v36[3];
  char v37[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char __str[8];
  _QWORD v46[3];

  if (!result)
    return result;
  memset(v36, 170, sizeof(v36));
  sub_100003ACC((uint64_t)v36, result);
  v1 = sub_100003BF4((uint64_t)v36);
  v2 = (const char *)v36[0];
  if (!v36[0])
    v2 = "command";
  printf("usage: %s", v2);
  if (v1)
  {
    v3 = 0;
    v4 = v1;
    while (!*(_BYTE *)(v36[2] + v3))
    {
LABEL_17:
      v3 += 104;
      if (!--v4)
      {
        v7 = 0;
        v8 = v1;
        while (2)
        {
          if (!*(_QWORD *)(v36[2] + v7 + 8) || *(_BYTE *)(v36[2] + v7))
            goto LABEL_31;
          printf(" [--%s", *(const char **)(v36[2] + v7 + 8));
          if (v36[2])
          {
            v9 = *(_QWORD *)(v36[2] + v7 + 48);
            if (*(_QWORD *)(v36[2] + v7 + 56))
            {
              if (!v9)
                goto LABEL_30;
LABEL_27:
              v10 = *(const char **)(v36[2] + v7 + 40);
              if (!v10)
                v10 = "arg";
              printf(" %s", v10);
            }
            else if (v9 || *(_QWORD *)(v36[2] + v7 + 88))
            {
              goto LABEL_27;
            }
          }
LABEL_30:
          putchar(93);
LABEL_31:
          v7 += 104;
          if (!--v8)
          {
            v11 = 16;
            v12 = v1;
            do
            {
              if (*(_QWORD *)(v36[2] + v11))
                printf(" [%s]", *(const char **)(v36[2] + v11));
              v11 += 104;
              --v12;
            }
            while (v12);
            v13 = 0;
            v14 = v1;
            do
            {
              if (*(_QWORD *)(v36[2] + v13 + 24))
              {
                if (*(_BYTE *)(v36[2] + v13 + 32))
                  printf(" [<%s>]");
                else
                  printf(" <%s>");
              }
              v13 += 104;
              --v14;
            }
            while (v14);
            goto LABEL_42;
          }
          continue;
        }
      }
    }
    printf(" [-%c", *(char *)(v36[2] + v3));
    if (v36[2])
    {
      v5 = *(_QWORD *)(v36[2] + v3 + 48);
      if (*(_QWORD *)(v36[2] + v3 + 56))
      {
        if (!v5)
          goto LABEL_16;
      }
      else if (!v5 && !*(_QWORD *)(v36[2] + v3 + 88))
      {
        goto LABEL_16;
      }
      v6 = *(const char **)(v36[2] + v3 + 40);
      if (!v6)
        v6 = "arg";
      printf(" %s", v6);
    }
LABEL_16:
    putchar(93);
    goto LABEL_17;
  }
LABEL_42:
  putchar(10);
  if (v36[1])
    printf("\n%s\n", (const char *)v36[1]);
  puts("\npositional arguments:");
  if (!v1)
  {
    puts("\noptional arguments:");
    puts("\noptional commands:");
    return putchar(10);
  }
  v15 = 0;
  v16 = v1;
  do
  {
    if (*(_QWORD *)(v36[2] + v15 + 24))
      printf("  %-31s %s\n", *(const char **)(v36[2] + v15 + 24), *(const char **)(v36[2] + v15 + 72));
    v15 += 104;
    --v16;
  }
  while (v16);
  puts("\noptional arguments:");
  v17 = 88;
  v18 = v1;
  do
  {
    if (!*(_BYTE *)(v36[2] + v17 - 88))
      goto LABEL_80;
    if (*(_QWORD *)(v36[2] + v17 - 80))
    {
      printf("  -%c", *(char *)(v36[2] + v17 - 88));
      v19 = v36[2];
      v20 = *(_QWORD *)(v36[2] + v17 - 40);
      if (*(_QWORD *)(v36[2] + v17 - 32))
      {
        if (!v20)
          goto LABEL_63;
      }
      else if (!v20 && !*(_QWORD *)(v36[2] + v17))
      {
        goto LABEL_63;
      }
      v22 = *(const char **)(v36[2] + v17 - 48);
      if (!v22)
        v22 = "arg";
      printf(" %s", v22);
      v19 = v36[2];
LABEL_63:
      v23 = v19 + v17;
      if (*(_QWORD *)(v19 + v17 - 80))
      {
        v25 = v23 - 40;
        v24 = *(_QWORD *)(v23 - 40);
        if (*(_QWORD *)(v25 + 8))
        {
          if (v24)
            goto LABEL_72;
        }
        else if (v24 || *(_QWORD *)(v19 + v17))
        {
LABEL_72:
          strlen(*(const char **)(v19 + v17 - 80));
          if (*(_QWORD *)(v19 + v17 - 48))
            v27 = *(const char **)(v19 + v17 - 48);
          else
            v27 = "arg";
          strlen(v27);
          printf(", --%s %-*s");
          goto LABEL_79;
        }
        if (*(_QWORD *)(v19 + v17 - 48))
          v26 = *(const char **)(v19 + v17 - 48);
        else
          v26 = "arg";
        strlen(v26);
        printf(", --%-*s");
      }
      goto LABEL_79;
    }
    v21 = *(_QWORD *)(v36[2] + v17 - 40);
    if (*(_QWORD *)(v36[2] + v17 - 32))
    {
      if (v21)
        goto LABEL_78;
    }
    else if (v21 || *(_QWORD *)(v36[2] + v17))
    {
LABEL_78:
      printf("  -%c %-*s");
      goto LABEL_79;
    }
    printf("  -%-30c");
LABEL_79:
    puts(*(const char **)(v36[2] + v17 - 16));
LABEL_80:
    v17 += 104;
    --v18;
  }
  while (v18);
  v28 = v1;
  while (2)
  {
    if (*(_QWORD *)(v36[2] + v18 + 8) && !*(_BYTE *)(v36[2] + v18))
    {
      v29 = *(_QWORD *)(v36[2] + v18 + 48);
      if (*(_QWORD *)(v36[2] + v18 + 56))
      {
        if (!v29)
          goto LABEL_86;
LABEL_89:
        memset(v46, 170, 22);
        *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v44 = v30;
        v42 = v30;
        v43 = v30;
        v40 = v30;
        v41 = v30;
        v38 = v30;
        v39 = v30;
        *(_OWORD *)v37 = v30;
        v31 = *(_QWORD *)(v36[2] + v18 + 88);
        v32 = *(const char **)(v36[2] + v18 + 40);
        if (!v32)
          v32 = "arg";
        if (v31)
          v33 = "%s %s...";
        else
          v33 = "%s %s";
        if (v31)
          v34 = "%s [repeatable]";
        else
          v34 = "%s";
        snprintf(__str, 0x1EuLL, v33, *(_QWORD *)(v36[2] + v18 + 8), v32);
        snprintf(v37, 0x80uLL, v34, *(_QWORD *)(v36[2] + v18 + 72));
        printf("  --%-28s %s\n", __str, v37);
      }
      else
      {
        if (v29 || *(_QWORD *)(v36[2] + v18 + 88))
          goto LABEL_89;
LABEL_86:
        printf("  --%-28s %s\n", *(const char **)(v36[2] + v18 + 8), *(const char **)(v36[2] + v18 + 72));
      }
    }
    v18 += 104;
    if (--v28)
      continue;
    break;
  }
  puts("\noptional commands:");
  v35 = 0;
  do
  {
    if (*(_QWORD *)(v36[2] + v35 + 16))
      printf("  %-30s %s\n", *(const char **)(v36[2] + v35 + 16), *(const char **)(v36[2] + v35 + 72));
    v35 += 104;
    --v1;
  }
  while (v1);
  return putchar(10);
}

char **sub_100004230(uint64_t a1, const char *a2)
{
  _DWORD *v4;
  char **result;
  void **v6;
  uint64_t v7;

  v4 = *(_DWORD **)(a1 + 56);
  if (v4)
    *v4 = *(_DWORD *)(a1 + 64);
  result = *(char ***)(a1 + 48);
  if (result)
    result = (char **)asprintf(result, "%.1048576s", a2);
  v6 = *(void ***)(a1 + 88);
  if (v6)
  {
    v7 = **(_QWORD **)(a1 + 96);
    **(_QWORD **)(a1 + 88) = malloc_type_realloc(*v6, 8 * (v7 + 1), 0x10040436913F5uLL);
    result = (char **)asprintf((char **)(**(_QWORD **)(a1 + 88) + 8 * v7), "%.1048576s", a2);
    **(_QWORD **)(a1 + 96) = v7 + 1;
  }
  return result;
}

void sub_100004618(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000047F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000049C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100004DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000050F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1000057BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_100005D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100005EA8(uint64_t a1, int a2, void *a3)
{
  id v4;
  __CFString *v5;

  if (a3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description")));
    printf("Error causing havoc: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
  else
  {
    if (a2)
      v5 = CFSTR("ON");
    else
      v5 = CFSTR("OFF");
    printf("Success. Havoc is now %s\n", (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100005F40(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    printf("Error deleting zone: %s\n", (const char *)objc_msgSend(v3, "UTF8String"));

  }
  else
  {
    puts("Success.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100005FB4(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    printf("Error modifying tlk shares: %s\n", (const char *)objc_msgSend(v3, "UTF8String"));

  }
  else
  {
    puts("Success.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006028(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v17 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description")));
    printf("Error fetching view: %s\n", (const char *)objc_msgSend(v13, "UTF8String"));

  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("tlk"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("pastTLKs"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("tlkShares"));
      sub_1000061CC(v14);
      putchar(10);
    }
    else
    {
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description")));
      printf("TLK: %s\n", (const char *)objc_msgSend(v15, "UTF8String"));

      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
      printf("Old TLKs: %s\n", (const char *)objc_msgSend(v16, "UTF8String"));

      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
      printf("TLKShares: %s\n", (const char *)objc_msgSend(v14, "UTF8String"));
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000061CC(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1 = sub_1000062A0(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v2, 3, &v6));
  v4 = v6;

  if (v3)
  {
    v5 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4));
    printf("%s", (const char *)objc_msgSend(v5, "UTF8String"));
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    NSLog(CFSTR("error: %@"), v5);
  }

}

id sub_1000062A0(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (a1)
  {
    v1 = objc_msgSend(a1, "mutableCopy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "allKeys", 0));
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", v7));
          v9 = sub_1000067A8(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          objc_msgSend(v1, "setObject:forKeyedSubscript:", v10, v7);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void sub_1000063E4(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "localizedCaseInsensitiveCompare:"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11, (_QWORD)v13));
        sub_100006534(v11, v12, a2);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void sub_100006534(void *a1, void *a2, int a3)
{
  id v5;
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
  id v36;
  _QWORD v37[4];
  int v38;

  v36 = a1;
  v5 = a2;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if (a3 == 1)
    {
      sub_1000066D4(CFSTR("\n%*s%@ -"), v7, v8, v9, v10, v11, v12, v13, 4);
      sub_1000066D4(CFSTR("%*s------------------------"), v29, v30, v31, v32, v33, v34, v35, 4);
    }
    else if (a3)
    {
      sub_1000066D4(CFSTR("%*s%@ -"), v7, v8, v9, v10, v11, v12, v13, (4 * a3));
    }
    else
    {
      sub_1000066D4(CFSTR("\n%*s%@ -"), v7, v8, v9, v10, v11, v12, v13, 0);
      sub_1000066D4(CFSTR("%*s========================"), v14, v15, v16, v17, v18, v19, v20, 0);
    }
    sub_1000063E4(v5, (a3 + 1));
  }
  else
  {
    v21 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v21) & 1) != 0)
    {
      sub_1000066D4(CFSTR("%*s%@ -"), v22, v23, v24, v25, v26, v27, v28, (4 * a3));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100006740;
      v37[3] = &unk_10000C440;
      v38 = a3 + 1;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v37);
    }
    else
    {
      sub_1000066D4(CFSTR("%*s%@: %@"), v22, v23, v24, v25, v26, v27, v28, (4 * a3));
    }
  }

}

void sub_1000066D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  id v11;

  v9 = a1;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &a9);

  v11 = objc_retainAutorelease(v10);
  puts((const char *)objc_msgSend(v11, "UTF8String"));

}

void sub_100006740(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  sub_100006534(v6, v5, *(unsigned int *)(a1 + 32));

}

id sub_1000067A8(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[2];

  v1 = a1;
  if (!v1)
  {
    v7 = 0;
    goto LABEL_17;
  }
  v2 = objc_opt_class(NSError);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) == 0)
  {
    if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v1))
    {
LABEL_6:
      v11 = v1;
LABEL_7:
      v7 = v11;
      goto LABEL_17;
    }
    if ((objc_opt_respondsToSelector(v1, "jsonDictionary") & 1) != 0)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "jsonDictionary"));
      if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v12))
        v13 = v12;
      else
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
      v7 = v13;
    }
    else
    {
      v14 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v1, v14) & 1) != 0)
        goto LABEL_6;
      v15 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v1, v15) & 1) != 0)
      {
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "base64EncodedStringWithOptions:", 0));
        goto LABEL_7;
      }
      v17 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v1, v17) & 1) != 0)
      {
        v18 = sub_1000062A0(v1);
        v11 = (id)objc_claimAutoreleasedReturnValue(v18);
        goto LABEL_7;
      }
      v19 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v1, v19) & 1) == 0)
      {
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
        goto LABEL_7;
      }
      v20 = v1;
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v20, "count")));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = v20;
      v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v23)
              objc_enumerationMutation(v12);
            v25 = sub_1000067A8(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i));
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            objc_msgSend(v7, "addObject:", v26, (_QWORD)v27);

          }
          v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v22);
      }

    }
    goto LABEL_17;
  }
  v32[0] = CFSTR("code");
  v3 = v1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "code")));
  v32[1] = CFSTR("domain");
  v33[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v33[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v9 = sub_1000062A0(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("userInfo"));

LABEL_17:
  return v7;
}

intptr_t sub_100006AF0(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
    printf("Error proposing TLK: %s\n", (const char *)objc_msgSend(v3, "UTF8String"));

  }
  else
  {
    puts("Success.");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006B64(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    printf("Error sending metric: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

    if (objc_msgSend(v6, "code"))
      v5 = (uint64_t)objc_msgSend(v6, "code");
    else
      v5 = -1;
  }
  else
  {
    puts("Complete.");
    v5 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100006C04(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    printf("Error pushing: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

    if (objc_msgSend(v6, "code"))
      v5 = (uint64_t)objc_msgSend(v6, "code");
    else
      v5 = -1;
  }
  else
  {
    puts("Complete.");
    v5 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100006CA4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    printf("Error fetching: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

    if (objc_msgSend(v6, "code"))
      v5 = (uint64_t)objc_msgSend(v6, "code");
    else
      v5 = -1;
  }
  else
  {
    puts("Complete.");
    v5 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100006D44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void (**v11)(NSString *, ...);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  uint64_t v98;
  void *i;
  id v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  int v105;
  id v106;
  void *v107;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  id v115;
  const char *v116;
  id v117;
  const char *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  id v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  unsigned int v187;
  void *v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  uint64_t v203;
  void *j;
  id v205;
  void *v206;
  id v207;
  id v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  id obj;
  id v216;
  id v217;
  id v218;
  id v219;
  void *v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  uint64_t v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  _BYTE v266[128];
  _BYTE v267[128];
  _BYTE v268[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
    printf("ERROR FETCHING STATUS: %s\n", (const char *)objc_msgSend(v8, "UTF8String"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  v10 = objc_msgSend(v9, "mutableCopy");

  v11 = &NSLog_ptr;
  v210 = v10;
  v211 = v5;
  v209 = v7;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reachability")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("reachability"));
    v13 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v252 = v14;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ckdeviceID")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("ckdeviceID"));
    v16 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      v17 = v15;
    else
      v17 = 0;
    v250 = v17;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ckdeviceIDError")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("ckdeviceIDError"));
    v19 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      v20 = v18;
    else
      v20 = 0;
    v248 = v20;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lockstatetracker")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("lockstatetracker"));
    v22 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      v23 = v21;
    else
      v23 = 0;
    v246 = v23;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cloudkitRetryAfter")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("cloudkitRetryAfter"));
    v25 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      v26 = v24;
    else
      v26 = 0;
    v244 = v26;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastCKKSPush")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("lastCKKSPush"));
    v28 = objc_opt_class(NSDate);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
      v29 = v27;
    else
      v29 = 0;
    v242 = v29;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("policy")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("policy"));
    v31 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
      v32 = v30;
    else
      v32 = 0;
    v240 = v32;

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("viewsFromPolicy")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("viewsFromPolicy"));
    v34 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
      v35 = v33;
    else
      v35 = 0;
    v36 = v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("activeAccount")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("activeAccount"));
    v38 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
      v39 = v37;
    else
      v39 = 0;
    v227 = v39;

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ckaccountstatus")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("ckaccountstatus"));
    v41 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
      v42 = v40;
    else
      v42 = 0;
    v43 = v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accounttracker")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("accounttracker"));
    v45 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
      v46 = v44;
    else
      v46 = 0;
    v47 = v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("fetcher")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("fetcher"));
    v49 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0)
      v50 = v48;
    else
      v50 = 0;
    v238 = v50;

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ckksstate")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("ckksstate"));
    v52 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0)
      v53 = v51;
    else
      v53 = 0;
    v54 = v53;

    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastIncomingQueueOperation")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("lastIncomingQueueOperation"));
    v56 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0)
      v57 = v55;
    else
      v57 = 0;
    v236 = v57;

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastNewTLKOperation")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("lastNewTLKOperation"));
    v59 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0)
      v60 = v58;
    else
      v60 = 0;
    v234 = v60;

    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastOutgoingQueueOperation")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("lastOutgoingQueueOperation"));
    v62 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0)
      v63 = v61;
    else
      v63 = 0;
    v232 = v63;

    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastProcessReceivedKeysOperation")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("lastProcessReceivedKeysOperation"));
    v65 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v64, v65) & 1) != 0)
      v66 = v64;
    else
      v66 = 0;
    v230 = v66;

    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastReencryptOutgoingItemsOperation")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("lastReencryptOutgoingItemsOperation"));
    v68 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0)
      v69 = v67;
    else
      v69 = 0;
    v70 = v69;

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("launchSequence")));
    objc_msgSend(v210, "setObject:forKeyedSubscript:", 0, CFSTR("launchSequence"));
    v72 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v71, v72) & 1) != 0)
      v73 = v71;
    else
      v73 = 0;
    v74 = v73;

    if (!*(_BYTE *)(a1 + 40))
    {
      puts("================================================================================\n");
      puts("Global state:\n");
    }
    v75 = objc_retainAutorelease(v54);
    printf("CKKS state machine:   %s\n", (const char *)objc_msgSend(v75, "UTF8String"));
    v76 = objc_retainAutorelease(v227);
    printf("Active account:       %s\n", (const char *)objc_msgSend(v76, "UTF8String"));
    v77 = objc_retainAutorelease(v43);
    printf("CloudKit account:     %s\n", (const char *)objc_msgSend(v77, "UTF8String"));
    v78 = objc_retainAutorelease(v47);
    printf("Account tracker:      %s\n", (const char *)objc_msgSend(v78, "UTF8String"));
    v79 = v240;
    v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "description")));
    printf("Syncing Policy:       %s\n", (const char *)objc_msgSend(v80, "UTF8String"));

    v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "description")));
    printf("Views from policy:    %s\n", (const char *)objc_msgSend(v81, "UTF8String"));

    if (!*(_BYTE *)(a1 + 40))
    {
      v228 = v76;
      v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v252, "description")));
      printf("Reachability:         %s\n", (const char *)objc_msgSend(v82, "UTF8String"));

      v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v244, "description")));
      printf("Retry:                %s\n", (const char *)objc_msgSend(v83, "UTF8String"));

      v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v250, "description")));
      printf("CK DeviceID:          %s\n", (const char *)objc_msgSend(v84, "UTF8String"));

      v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "description")));
      printf("CK DeviceID Error:    %s\n", (const char *)objc_msgSend(v85, "UTF8String"));

      v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v246, "description")));
      printf("Lock state:           %s\n", (const char *)objc_msgSend(v86, "UTF8String"));

      v87 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "description")));
      printf("Last CKKS push:       %s\n", (const char *)objc_msgSend(v87, "UTF8String"));

      putchar(10);
      v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "description")));
      printf("zone change fetcher:                 %s\n", (const char *)objc_msgSend(v88, "UTF8String"));

      if (v236)
        v89 = (const char *)objc_msgSend(objc_retainAutorelease(v236), "UTF8String");
      else
        v89 = "never";
      printf("lastIncomingQueueOperation:          %s\n", v89);
      if (v234)
        v90 = (const char *)objc_msgSend(objc_retainAutorelease(v234), "UTF8String");
      else
        v90 = "never";
      printf("lastNewTLKOperation:                 %s\n", v90);
      if (v232)
        v91 = (const char *)objc_msgSend(objc_retainAutorelease(v232), "UTF8String");
      else
        v91 = "never";
      printf("lastOutgoingQueueOperation:          %s\n", v91);
      if (v230)
        v92 = (const char *)objc_msgSend(objc_retainAutorelease(v230), "UTF8String");
      else
        v92 = "never";
      printf("lastProcessReceivedKeysOperation:    %s\n", v92);
      v212 = a1;
      v223 = v75;
      v225 = v70;
      if (v70)
        v93 = (const char *)objc_msgSend(objc_retainAutorelease(v70), "UTF8String");
      else
        v93 = "never";
      printf("lastReencryptOutgoingItemsOperation: %s\n", v93);
      puts("Launch sequence:");
      v262 = 0u;
      v263 = 0u;
      v264 = 0u;
      v265 = 0u;
      v94 = v74;
      v95 = v74;
      v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v262, v268, 16);
      if (v96)
      {
        v97 = v96;
        v98 = *(_QWORD *)v263;
        do
        {
          for (i = 0; i != v97; i = (char *)i + 1)
          {
            if (*(_QWORD *)v263 != v98)
              objc_enumerationMutation(v95);
            v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v262 + 1) + 8 * (_QWORD)i), "description")));
            printf("\t%s\n", (const char *)objc_msgSend(v100, "UTF8String"));

          }
          v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v262, v268, 16);
        }
        while (v97);
      }

      a1 = v212;
      v79 = v240;
      v74 = v94;
      v75 = v223;
      v70 = v225;
      v76 = v228;
    }
    putchar(10);

    v5 = v211;
    v11 = &NSLog_ptr;
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
    v101 = &__NSArray0__struct;
  else
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 1, (char *)objc_msgSend(v5, "count") - 1));
  if (!objc_msgSend(v101, "count"))
    puts("No CKKS views are active.");
  v260 = 0u;
  v261 = 0u;
  v258 = 0u;
  v259 = 0u;
  obj = v101;
  v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v258, v267, 16);
  if (v102)
  {
    v103 = v102;
    v243 = *(_QWORD *)v259;
    v213 = a1;
    do
    {
      v104 = 0;
      v214 = v103;
      do
      {
        if (*(_QWORD *)v259 != v243)
          objc_enumerationMutation(obj);
        v105 = *(unsigned __int8 *)(a1 + 40);
        v106 = objc_msgSend(*(id *)(*((_QWORD *)&v258 + 1) + 8 * (_QWORD)v104), "mutableCopy");
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("view")));
        objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("view"));
        v108 = objc_opt_class(v11[13]);
        if ((objc_opt_isKindOfClass(v107, v108) & 1) != 0)
          v109 = v107;
        else
          v109 = 0;
        v110 = v109;

        if (v105)
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("keystate")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("keystate"));
          v112 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v111, v112) & 1) != 0)
            v113 = v111;
          else
            v113 = 0;
          v114 = v113;

          v115 = objc_retainAutorelease(v110);
          v116 = (const char *)objc_msgSend(v115, "UTF8String");

          v117 = objc_retainAutorelease(v114);
          v118 = (const char *)objc_msgSend(v117, "UTF8String");

          printf("%-25s: %s\n", v116, v118);
        }
        else
        {
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("ckksManaged")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("ckksManaged"));
          v120 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v119, v120) & 1) != 0)
            v121 = v119;
          else
            v121 = 0;
          v219 = v121;

          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("zoneCreated")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("zoneCreated"));
          v123 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v122, v123) & 1) != 0)
            v124 = v122;
          else
            v124 = 0;
          v253 = v124;

          v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("zoneSubscribed")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("zoneSubscribed"));
          v126 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v125, v126) & 1) != 0)
            v127 = v125;
          else
            v127 = 0;
          v251 = v127;

          v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("zoneInitializeScheduler")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("zoneInitializeScheduler"));
          v129 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v128, v129) & 1) != 0)
            v130 = v128;
          else
            v130 = 0;
          v247 = v130;

          v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("keystate")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("keystate"));
          v132 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v131, v132) & 1) != 0)
            v133 = v131;
          else
            v133 = 0;
          v216 = v133;

          v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("statusError")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("statusError"));
          v135 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v134, v135) & 1) != 0)
            v136 = v134;
          else
            v136 = 0;
          v137 = v136;

          v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("itemsyncing")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("itemsyncing"));
          v139 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v138, v139) & 1) != 0)
            v140 = v138;
          else
            v140 = 0;
          v241 = v140;

          v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("currentTLK")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("currentTLK"));
          v142 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v141, v142) & 1) != 0)
            v143 = v141;
          else
            v143 = 0;
          v239 = v143;

          v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("currentClassA")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("currentClassA"));
          v145 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v144, v145) & 1) != 0)
            v146 = v144;
          else
            v146 = 0;
          v237 = v146;

          v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("currentClassC")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("currentClassC"));
          v148 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v147, v148) & 1) != 0)
            v149 = v147;
          else
            v149 = 0;
          v235 = v149;

          v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("currentTLKPtr")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("currentTLKPtr"));
          v151 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v150, v151) & 1) != 0)
            v152 = v150;
          else
            v152 = 0;
          v245 = v152;

          v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("currentClassAPtr")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("currentClassAPtr"));
          v154 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v153, v154) & 1) != 0)
            v155 = v153;
          else
            v155 = 0;
          v222 = v155;

          v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("currentClassCPtr")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("currentClassCPtr"));
          v157 = objc_opt_class(v11[13]);
          if ((objc_opt_isKindOfClass(v156, v157) & 1) != 0)
            v158 = v156;
          else
            v158 = 0;
          v221 = v158;

          v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("launchSequence")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("launchSequence"));
          v160 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v159, v160) & 1) != 0)
            v161 = v159;
          else
            v161 = 0;
          v218 = v161;

          v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("oqe")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("oqe"));
          v163 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v162, v163) & 1) != 0)
            v164 = v162;
          else
            v164 = 0;
          v233 = v164;

          v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("iqe")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("iqe"));
          v166 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v165, v166) & 1) != 0)
            v167 = v165;
          else
            v167 = 0;
          v231 = v167;

          v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("keys")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("keys"));
          v169 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v168, v169) & 1) != 0)
            v170 = v168;
          else
            v170 = 0;
          v229 = v170;

          v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("ckmirror")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("ckmirror"));
          v172 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v171, v172) & 1) != 0)
            v173 = v171;
          else
            v173 = 0;
          v226 = v173;

          v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("devicestates")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("devicestates"));
          v175 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v174, v175) & 1) != 0)
            v176 = v174;
          else
            v176 = 0;
          v224 = v176;

          v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("tlkshares")));
          objc_msgSend(v106, "setObject:forKeyedSubscript:", 0, CFSTR("tlkshares"));
          v178 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v177, v178) & 1) != 0)
            v179 = v177;
          else
            v179 = 0;
          v249 = v179;

          puts("================================================================================\n");
          v180 = v110;
          v181 = v137;
          v217 = objc_retainAutorelease(v180);
          printf("View: %s\n\n", (const char *)objc_msgSend(v217, "UTF8String"));
          if (v137)
            printf("ERROR FETCHING STATUS: %s\n\n", (const char *)objc_msgSend(objc_retainAutorelease(v137), "UTF8String"));
          if (!objc_msgSend(v253, "isEqualToString:", CFSTR("yes"))
            || (objc_msgSend(v251, "isEqualToString:", CFSTR("yes")) & 1) == 0)
          {
            v182 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "description")));
            printf("CK Zone Created:            %s\n", (const char *)objc_msgSend(v182, "UTF8String"));

            v183 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "description")));
            printf("CK Zone Subscribed:         %s\n", (const char *)objc_msgSend(v183, "UTF8String"));

            v184 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v247, "description")));
            printf("CK Zone initialize retry:   %s\n", (const char *)objc_msgSend(v184, "UTF8String"));

            putchar(10);
          }
          v185 = objc_retainAutorelease(v216);
          printf("Key state:            %s\n", (const char *)objc_msgSend(v185, "UTF8String"));
          v186 = objc_retainAutorelease(v219);
          printf("CKKS managed view:    %s\n", (const char *)objc_msgSend(v186, "UTF8String"));
          v187 = objc_msgSend(v186, "isEqualToString:", CFSTR("yes"));
          v220 = v181;
          if (v187)
          {
            v188 = v218;
            if (v239)
            {
              printf("Current TLK:          %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v239), "UTF8String"));
            }
            else
            {
              v190 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[13], "stringWithFormat:", CFSTR("missing; pointer is %@"),
                                                    v245)));
              printf("Current TLK:          %s\n", (const char *)objc_msgSend(v190, "UTF8String"));

            }
            if (v237)
            {
              printf("Current ClassA:       %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v237), "UTF8String"));
            }
            else
            {
              v191 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[13], "stringWithFormat:", CFSTR("missing; pointer is %@"),
                                                    v222)));
              printf("Current ClassA:       %s\n", (const char *)objc_msgSend(v191, "UTF8String"));

            }
            if (v235)
            {
              printf("Current ClassC:       %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v235), "UTF8String"));
            }
            else
            {
              v192 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[13], "stringWithFormat:", CFSTR("missing; pointer is %@"),
                                                    v221)));
              printf("Current ClassC:       %s\n", (const char *)objc_msgSend(v192, "UTF8String"));

            }
          }
          else
          {
            v189 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v245, "description")));
            printf("Current TLK:          %s\n", (const char *)objc_msgSend(v189, "UTF8String"));

            v188 = v218;
          }
          v193 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "description")));
          printf("TLK shares:           %s\n", (const char *)objc_msgSend(v193, "UTF8String"));

          if (v187)
          {
            v194 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "description")));
            printf("Item syncing:          %s\n", (const char *)objc_msgSend(v194, "UTF8String"));

            v195 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "description")));
            printf("Outgoing Queue counts: %s\n", (const char *)objc_msgSend(v195, "UTF8String"));

            v196 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v231, "description")));
            printf("Incoming Queue counts: %s\n", (const char *)objc_msgSend(v196, "UTF8String"));

            v197 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v229, "description")));
            printf("Key counts: %s\n", (const char *)objc_msgSend(v197, "UTF8String"));

            v198 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "description")));
            printf("Item counts (by key):  %s\n", (const char *)objc_msgSend(v198, "UTF8String"));

            v199 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v224, "description")));
            printf("Peer states:           %s\n", (const char *)objc_msgSend(v199, "UTF8String"));

          }
          puts("Launch sequence:");
          v254 = 0u;
          v255 = 0u;
          v256 = 0u;
          v257 = 0u;
          v200 = v188;
          v201 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v254, v266, 16);
          if (v201)
          {
            v202 = v201;
            v203 = *(_QWORD *)v255;
            do
            {
              for (j = 0; j != v202; j = (char *)j + 1)
              {
                if (*(_QWORD *)v255 != v203)
                  objc_enumerationMutation(v200);
                v205 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v254 + 1) + 8 * (_QWORD)j), "description")));
                printf("\t%s\n", (const char *)objc_msgSend(v205, "UTF8String"));

              }
              v202 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v254, v266, 16);
            }
            while (v202);
          }

          v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "allKeys"));
          v207 = objc_msgSend(v206, "count");

          if (v207)
          {
            v208 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "description")));
            printf("\nExtra information: %s\n", (const char *)objc_msgSend(v208, "UTF8String"));

          }
          putchar(10);

          a1 = v213;
          v103 = v214;
          v11 = &NSLog_ptr;
        }

        v104 = (char *)v104 + 1;
      }
      while (v104 != v103);
      v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v258, v267, 16);
    }
    while (v103);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008740(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("error"));

  }
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
    puts("No CKKS views are active.");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = *(void **)(a1 + 32);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("view"), (_QWORD)v17));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000088D4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
  {
    sub_1000066D4(CFSTR("resync errored: %@\n"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    v11 = objc_msgSend(v12, "code");
  }
  else
  {
    puts("resync success.");
    v11 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100008948(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
  {
    sub_1000066D4(CFSTR("Reset error: %@\n"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    v11 = objc_msgSend(v12, "code");
  }
  else
  {
    puts("CloudKit Reset complete.");
    v11 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000089BC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
  {
    sub_1000066D4(CFSTR("reset error: %@\n"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    v11 = objc_msgSend(v12, "code");
  }
  else
  {
    puts("reset complete.");
    v11 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100008A30(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("error"));

  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008AE4;
  v7[3] = &unk_10000C330;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_100008AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t start(int a1, char *const *a2)
{
  unint64_t v2;
  option *v3;
  size_t v4;
  char *v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  const char *v11;
  int *v12;
  uint64_t v13;
  int v14;
  option *v15;
  option *v16;
  size_t v17;
  _QWORD *v18;
  unint64_t v19;
  size_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  const char **p_name;
  unint64_t v25;
  char *v26;
  const char *v27;
  size_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  const char **v44;
  _QWORD *v45;
  _QWORD *v46;
  char *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  void *v52;
  id v53;
  CKKSControlCLI *v54;
  void *v55;
  void (**v56)(NSString *, ...);
  uint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  id v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  char **v68;
  char **v69;
  int64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  char v74;
  void *v76;
  char **v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  int v87;
  void *v88[4];

  memset(v88, 170, 24);
  sub_100003ACC((uint64_t)v88, (uint64_t)off_100010BE8);
  v2 = sub_100003BF4((uint64_t)v88);
  v3 = (option *)malloc_type_calloc(v2 + 1, 0x20uLL, 0x10500402E37B38AuLL);
  v4 = 2 * v2 + 2;
  v5 = (char *)malloc_type_malloc(v4, 0x83F72549uLL);
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = (char *)v88[2];
  v10 = (char *)v88[2] + 48;
  do
  {
    if (v7 >= v2)
      goto LABEL_13;
    v11 = (const char *)*((_QWORD *)v10 - 5);
    if (v11)
    {
      v3[v7].name = v11;
      v13 = *(_QWORD *)v10;
      v12 = (int *)*((_QWORD *)v10 + 1);
      if (v12)
      {
        v14 = 2 * (v13 != 0);
      }
      else if (v13)
      {
        v14 = 1;
      }
      else
      {
        v14 = *((_QWORD *)v10 + 5) != 0;
      }
      v15 = &v3[v7];
      v15->has_arg = v14;
      v15->flag = v12;
      v15->val = *((_DWORD *)v10 + 4);
      ++v7;
    }
    ++v8;
    v10 += 104;
  }
  while (v8 <= v2);
  if (v7 < v2)
  {
    v16 = &v3[v7];
    v16->name = 0;
    v16->has_arg = 0;
    v16->flag = 0;
    v16->val = 0;
LABEL_14:
    v17 = 0;
    v18 = v9 + 48;
    v19 = v2;
    while (1)
    {
      if (*((_BYTE *)v18 - 48))
      {
        if (v17 >= v4)
          goto LABEL_25;
        v5[v17] = *((_BYTE *)v18 - 48);
        v20 = v17 + 1;
        if (!v18[1] && (*v18 || v18[5]))
        {
          if (v20 >= v4)
          {
LABEL_25:
            v74 = 0;
            goto LABEL_28;
          }
          v5[v20] = 58;
          v17 += 2;
        }
        else
        {
          ++v17;
        }
      }
      v18 += 13;
      if (!--v19)
      {
        v74 = 0;
        goto LABEL_27;
      }
    }
  }
LABEL_13:
  if (v2)
    goto LABEL_14;
  v17 = 0;
  v74 = 1;
LABEL_27:
  v5[v17] = 0;
LABEL_28:
  v87 = 0;
  do
  {
    while (1)
    {
      v21 = getopt_long(a1, a2, v6, v3, &v87);
      if (v21)
        break;
      if (!v87)
      {
LABEL_130:
        sub_100003C68((uint64_t)v88);
        exit(1);
      }
      if ((v74 & 1) == 0)
      {
        v23 = 0;
        p_name = &v3[v87].name;
        v25 = v2;
        do
        {
          v26 = (char *)v88[2] + v23;
          v27 = *(const char **)((char *)v88[2] + v23 + 8);
          if (v27)
          {
            if (*p_name)
            {
              v28 = strlen(*(const char **)((char *)v88[2] + v23 + 8));
              if (!strncmp(*p_name, v27, v28))
              {
                v29 = *((_OWORD *)v26 + 5);
                v84 = *((_OWORD *)v26 + 4);
                v85 = v29;
                v86 = *((_QWORD *)v26 + 12);
                v30 = *((_OWORD *)v26 + 1);
                v80 = *(_OWORD *)v26;
                v81 = v30;
                v31 = *((_OWORD *)v26 + 3);
                v82 = *((_OWORD *)v26 + 2);
                v83 = v31;
                sub_100004230((uint64_t)&v80, optarg);
              }
            }
          }
          v23 += 104;
          --v25;
        }
        while (v25);
      }
    }
    if (v21 == -1)
    {
      v39 = optind;
      if (optind >= a1)
      {
LABEL_71:
        free(v88[2]);
        free(v3);
        free(v6);
      }
      else
      {
        v40 = 0;
        do
        {
          v41 = v40;
          if ((v74 & 1) == 0)
          {
            v42 = 0;
            v43 = (char *)v88[2];
            v44 = (const char **)((char *)v88[2] + 16);
            while (!*v44 || strcmp(a2[v39], *v44))
            {
              ++v42;
              v44 += 13;
              if (v2 == v42)
                goto LABEL_60;
            }
            v47 = &v43[104 * v42];
            v48 = *((_OWORD *)v47 + 5);
            v84 = *((_OWORD *)v47 + 4);
            v85 = v48;
            v86 = *((_QWORD *)v47 + 12);
            v49 = *((_OWORD *)v47 + 1);
            v80 = *(_OWORD *)v47;
            v81 = v49;
            v50 = *((_OWORD *)v47 + 3);
            v82 = *((_OWORD *)v47 + 2);
            v83 = v50;
            sub_100004230((uint64_t)&v80, 0);
            goto LABEL_71;
          }
LABEL_60:
          v36 = v88[2];
          if (v41 >= v2)
            goto LABEL_50;
          v45 = (char *)v88[2] + 104 * v41 + 24;
          v40 = v41;
          while (!*v45)
          {
            ++v40;
            v45 += 13;
            if (v2 == v40)
              goto LABEL_49;
          }
          v46 = (_QWORD *)*((_QWORD *)v88[2] + 13 * v40 + 6);
          if (v46)
          {
            *v46 = a2[v39];
            ++v40;
          }
          ++v39;
        }
        while ((_DWORD)v39 != a1);
        free(v88[2]);
        free(v3);
        free(v6);
        if (v41 >= v2)
          goto LABEL_51;
      }
      v51 = objc_autoreleasePoolPush();
      v79 = 0;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl CKKSControlObject:error:](CKKSControl, "CKKSControlObject:error:", 0, &v79));
      v53 = v79;
      if (v53 || !v52)
      {
        v73 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "description"))), "UTF8String");
        errx(1, "no CKKSControl failed: %s", v73);
      }
      v54 = -[CKKSControlCLI initWithCKKSControl:]([CKKSControlCLI alloc], "initWithCKKSControl:", v52);
      if (qword_100010C10)
        v78 = (char **)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", qword_100010C10, 4));
      else
        v78 = 0;
      if (qword_100010C38)
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", qword_100010C38, 4));
      else
        v55 = 0;
      if (qword_100010C40)
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", qword_100010C40, 4));
      else
        v76 = 0;
      v56 = &NSLog_ptr;
      if (qword_100010C20)
      {
        v57 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        if (qword_100010C20)
        {
          v58 = 0;
          do
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *(_QWORD *)(qword_100010C18 + 8 * v58), 4));
            objc_msgSend((id)v57, "addObject:", v59);

            ++v58;
          }
          while (v58 < qword_100010C20);
          v56 = &NSLog_ptr;
        }
      }
      else
      {
        v57 = 0;
      }
      if (qword_100010C30)
      {
        v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56[10], "array"));
        if (qword_100010C30)
        {
          v61 = 0;
          do
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *(_QWORD *)(qword_100010C28 + 8 * v61), 4));
            objc_msgSend((id)v60, "addObject:", v62);

            ++v61;
          }
          while (v61 < qword_100010C30);
        }
      }
      else
      {
        v60 = 0;
      }
      if (dword_100010C48)
      {
        v63 = objc_alloc_init((Class)NSMutableDictionary);
        if (dword_100010C00)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI fetchPerformanceCounters](v54, "fetchPerformanceCounters"));
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v64, CFSTR("performance"));

        }
        v65 = dword_100010C04;
        if (dword_100010C04)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI fetchStatus:](v54, "fetchStatus:", v78));
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v66, CFSTR("status"));

          v65 = dword_100010C04 != 0;
        }
        if ((v65 & 1) == 0 && !dword_100010C00 || (sub_1000061CC(v63), putchar(10), !dword_100010C04))
          -[CKKSControlCLI printHumanReadableStatus:shortenOutput:](v54, "printHumanReadableStatus:shortenOutput:", v78, dword_100010C08 != 0);
        goto LABEL_106;
      }
      if (dword_100010C00)
      {
        v63 = objc_alloc_init((Class)NSMutableDictionary);
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSControlCLI fetchPerformanceCounters](v54, "fetchPerformanceCounters"));
        objc_msgSend(v63, "setObject:forKeyedSubscript:", v67, CFSTR("performance"));

        sub_1000063E4(v63, 0);
LABEL_106:

        v37 = 0;
LABEL_107:

        objc_autoreleasePoolPop(v51);
        return v37;
      }
      if (dword_100010C4C)
      {
        v68 = v78;
        v37 = -[CKKSControlCLI fetch:](v54, "fetch:", v78);
LABEL_110:

        goto LABEL_107;
      }
      if (dword_100010C50)
      {
        v69 = v78;
        v70 = -[CKKSControlCLI push:](v54, "push:", v78);
LABEL_119:
        v37 = v70;

        goto LABEL_107;
      }
      if (dword_100010C58)
      {
        v69 = v78;
        v70 = -[CKKSControlCLI resetLocal:](v54, "resetLocal:", v78);
        goto LABEL_119;
      }
      if (dword_100010C5C)
      {
        v69 = v78;
        v70 = -[CKKSControlCLI resetCloudKit:](v54, "resetCloudKit:", v78);
        goto LABEL_119;
      }
      if (dword_100010C54)
      {
        v69 = v78;
        v70 = -[CKKSControlCLI resync:](v54, "resync:", v78);
        goto LABEL_119;
      }
      if (dword_100010C60)
      {
        v37 = -[CKKSControlCLI ckmetric](v54, "ckmetric");

        goto LABEL_107;
      }
      if (dword_100010C64)
      {
        if (v78)
        {
          if (v55)
          {
            v68 = v78;
            v71 = -[CKKSControlCLI proposeSETLK:tlkJson:oldTlkJson:tlkShareJsonStrings:](v54, "proposeSETLK:tlkJson:oldTlkJson:tlkShareJsonStrings:", v78, v55, v76, v57);
LABEL_129:
            v37 = v71;
            goto LABEL_110;
          }
          v72 = "newTLK is a required argument.\n";
          goto LABEL_132;
        }
      }
      else if (dword_100010C68)
      {
        if (v78)
        {
          v68 = v78;
          v71 = -[CKKSControlCLI fetchSEView:json:](v54, "fetchSEView:json:", v78, dword_100010C04 != 0);
          goto LABEL_129;
        }
      }
      else if (dword_100010C6C)
      {
        if (v78)
        {
          if (v57 | v60)
          {
            v68 = v78;
            v71 = -[CKKSControlCLI modifySEZone:tlkShareJsonStrings:deletetlkShareJsonStrings:](v54, "modifySEZone:tlkShareJsonStrings:deletetlkShareJsonStrings:", v78, v57, v60);
            goto LABEL_129;
          }
          v72 = "At least one of --tlkShare or --deleteTLKShare is required.";
LABEL_132:
          puts(v72);
          sub_100003C68((uint64_t)off_100010BE8);

LABEL_141:
          v37 = 1;
          goto LABEL_107;
        }
      }
      else
      {
        if (!dword_100010C70)
        {
          if (dword_100010C74)
          {
            v37 = -[CKKSControlCLI toggleHavoc](v54, "toggleHavoc");

          }
          else
          {
            sub_100003C68((uint64_t)off_100010BE8);

            v37 = 0xFFFFFFFFLL;
          }
          goto LABEL_107;
        }
        if (v78)
        {
          v68 = v78;
          v71 = -[CKKSControlCLI deleteSEZone:](v54, "deleteSEZone:", v78);
          goto LABEL_129;
        }
      }
      puts("View is a required argument.\n");
      sub_100003C68((uint64_t)off_100010BE8);
      goto LABEL_141;
    }
    if (v21 == 104)
      goto LABEL_130;
    if ((v74 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      v32 = (char *)v88[2];
      while (v21 != *v32)
      {
        ++v22;
        v32 += 104;
        if (v2 == v22)
          goto LABEL_49;
      }
      v33 = *((_OWORD *)v32 + 5);
      v84 = *((_OWORD *)v32 + 4);
      v85 = v33;
      v86 = *((_QWORD *)v32 + 12);
      v34 = *((_OWORD *)v32 + 1);
      v80 = *(_OWORD *)v32;
      v81 = v34;
      v35 = *((_OWORD *)v32 + 3);
      v82 = *((_OWORD *)v32 + 2);
      v83 = v35;
      sub_100004230((uint64_t)&v80, optarg);
    }
  }
  while (v22 != v2);
LABEL_49:
  v36 = v88[2];
LABEL_50:
  free(v36);
  free(v3);
  free(v6);
LABEL_51:
  putchar(10);
  sub_100003C68((uint64_t)off_100010BE8);
  return 0xFFFFFFFFLL;
}

id objc_msgSend_CKKSControlObject_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKKSControlObject:error:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_ckmetric(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckmetric");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "control");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_deleteSEView_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteSEView:reply:");
}

id objc_msgSend_deleteSEZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteSEZone:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_fetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetch:");
}

id objc_msgSend_fetchPerformanceCounters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchPerformanceCounters");
}

id objc_msgSend_fetchSEView_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchSEView:json:");
}

id objc_msgSend_fetchSEViewKeyHierarchy_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchSEViewKeyHierarchy:reply:");
}

id objc_msgSend_fetchStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchStatus:");
}

id objc_msgSend_initWithCKKSControl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCKKSControl:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_jsonDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jsonDictionary");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_modifySEZone_tlkShareJsonStrings_deletetlkShareJsonStrings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifySEZone:tlkShareJsonStrings:deletetlkShareJsonStrings:");
}

id objc_msgSend_modifyTLKSharesForSEView_adding_deleting_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyTLKSharesForSEView:adding:deleting:reply:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parseFromJSONDict_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseFromJSONDict:error:");
}

id objc_msgSend_parseJSON_name_json_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseJSON:name:json:");
}

id objc_msgSend_printHumanReadableStatus_shortenOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printHumanReadableStatus:shortenOutput:");
}

id objc_msgSend_proposeSETLK_tlkJson_oldTlkJson_tlkShareJsonStrings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposeSETLK:tlkJson:oldTlkJson:tlkShareJsonStrings:");
}

id objc_msgSend_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposeTLKForSEView:proposedTLK:wrappedOldTLK:tlkShares:reply:");
}

id objc_msgSend_push_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "push:");
}

id objc_msgSend_resetCloudKit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetCloudKit:");
}

id objc_msgSend_resetLocal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetLocal:");
}

id objc_msgSend_resync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resync:");
}

id objc_msgSend_rpcCKMetric_attributes_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcCKMetric:attributes:reply:");
}

id objc_msgSend_rpcFetchAndProcessChanges_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcFetchAndProcessChanges:reply:");
}

id objc_msgSend_rpcPerformanceCounters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcPerformanceCounters:");
}

id objc_msgSend_rpcPushOutgoingChanges_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcPushOutgoingChanges:reply:");
}

id objc_msgSend_rpcResetCloudKit_reason_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcResetCloudKit:reason:reply:");
}

id objc_msgSend_rpcResetLocal_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcResetLocal:reply:");
}

id objc_msgSend_rpcResync_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcResync:reply:");
}

id objc_msgSend_rpcStatus_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcStatus:reply:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_toggleHavoc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleHavoc");
}

id objc_msgSend_toggleHavoc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleHavoc:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}
