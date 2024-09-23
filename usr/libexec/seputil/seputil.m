BOOL sub_100002688(uint64_t a1, BOOL *a2)
{
  int v4;
  char v5;
  _BOOL8 result;
  char *v7;
  char *v8;
  char *v9;
  char v10;

  v10 = -86;
  if (!a1)
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v7, 13);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015910();
    return 0;
  }
  if (!a2)
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v8, 14);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015998();
    return 0;
  }
  if (!Img4DecodePayloadPropertiesExists(a1, (BOOL *)&v10))
  {
    if (!v10)
    {
      *a2 = 0;
      return 1;
    }
    Img4DecodePayloadPropertyExistsByTag(a1, 0xE000000072646467, a2);
    if (v4 == 1)
    {
      v5 = 0;
      goto LABEL_10;
    }
    if (!v4)
    {
      v5 = 1;
LABEL_10:
      *a2 = v5;
      return 1;
    }
    fprintf(__stderrp, "Img4DecodePayloadPropertyExistsByTag('rddg') returned %d\n", v4);
    return 0;
  }
  v9 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v9, 17);
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100015A20();
    return 0;
  }
  return result;
}

BOOL sub_100002814(uint64_t a1, _DWORD *a2)
{
  int v4;
  int v5;
  _BOOL8 result;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  unint64_t v13;
  void *__src;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  __src = (void *)0xAAAAAAAAAAAAAAAALL;
  if (!a1)
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v7, 57);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015AA8();
    return 0;
  }
  if (!a2)
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v8, 58);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015B30();
    return 0;
  }
  Img4DecodeGetRestoreInfoData(a1, 1969448306, &__src, &v13);
  if (v4)
  {
    v9 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v9, 61);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015D50();
    return 0;
  }
  if (v13 != 588)
  {
    v10 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v10, 63);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015CC8();
    return 0;
  }
  memcpy(a2, __src, 0x24CuLL);
  a2[147] = 0;
  Img4DecodeGetRestoreInfoData(a1, 1969450862, &__src, &v13);
  if (v5)
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v11, 69);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015C40();
    return 0;
  }
  if (v13 == 1324)
  {
    memcpy(a2 + 148, __src, 0x52CuLL);
    return 1;
  }
  v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v12, 70);
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100015BB8();
    return 0;
  }
  return result;
}

BOOL sub_100002A80(uint64_t a1, unint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;

  if (!a1)
  {
    v10 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v10, 85);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015DD8();
    return 0;
  }
  if (!a3)
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v11, 86);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015E60();
    return 0;
  }
  if (!a4)
  {
    v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v12, 87);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015EE8();
    return 0;
  }
  if (a2 >= 0xFFFFFFE8)
  {
    v13 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v13, 89);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015F70();
    return 0;
  }
  *a4 = 1;
  v4 = a3[1];
  if (!v4)
  {
    v14 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v14, 93);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100015FF8();
    return 0;
  }
  v5 = v4 - a1 + 24;
  v7 = a3[2];
  v6 = a3[3];
  a4[2] = v5;
  a4[3] = v7;
  if (v6)
  {
    v8 = a3[4];
    a4[4] = v6 - a1 + 24;
    a4[5] = v8;
    a4[1] = a2 + 24;
    return 1;
  }
  v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v15, 98);
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100016080();
    return 0;
  }
  return result;
}

void sub_100002CBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

uint64_t sub_100002CE8(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v3;
  int v5;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  _OWORD v12[3];
  __int128 v13;
  uint64_t v14;

  v14 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v3;
  v13 = v3;
  v12[0] = v3;
  v12[1] = v3;
  if (!a1)
    sub_100016108();
  v5 = sub_100002DC4((uint64_t *)v12, a1, a1 + a2);
  if (v5)
  {
    printf("img4: failed to parse ART: %d\n", v5);
    return 0;
  }
  else
  {
    v11 = 0xAAAAAAAAAAAAAAAALL;
    if ((SEPARTCounterFind(8, (uint64_t)&v11, *((uint64_t *)&v13 + 1), v14) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = 9;
      do
      {
        v9 = v8;
        if (v8 == 28)
          break;
        v11 = 0xAAAAAAAAAAAAAAAALL;
        v10 = SEPARTCounterFind(v8, (uint64_t)&v11, *((uint64_t *)&v13 + 1), v14);
        v8 = v9 + 1;
      }
      while (!v10);
      v7 = (unint64_t)(v9 - 1) < 0x1B;
    }
    return v7 ^ a3 ^ 1u;
  }
}

uint64_t sub_100002DC4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v7;
  uint64_t v8;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  if (!SEPARTExtract(a2, a3, &v8, &v7))
  {
    v5 = "img4: extract returned NULL";
    goto LABEL_5;
  }
  v4 = SEPARTPayloadDecode((uint64_t)a1, a1 + 1, a1 + 2, a1 + 3, a1 + 4, a1 + 5, a1 + 6, a1 + 7, a1 + 8, v8, v7);
  if (v4 != v7)
  {
    v5 = "img4: payload decode failed";
LABEL_5:
    puts(v5);
    return 1;
  }
  return 0;
}

uint64_t sub_100002E78(unint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;
  __int128 v7;
  uint64_t i;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  printf("raw ART: ");
  if (a1 < a2)
  {
    v4 = a2 - a1;
    v5 = (unsigned __int8 *)a1;
    do
    {
      v6 = *v5++;
      printf("%c%c", a0123456789abcd[(unint64_t)v6 >> 4], a0123456789abcd[v6 & 0xF]);
      --v4;
    }
    while (v4);
  }
  v15 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13 = v7;
  v14 = v7;
  v11 = v7;
  v12 = v7;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  putchar(10);
  if (sub_100002DC4((uint64_t *)&v11, a1, a2))
  {
    puts("img4: failed to parse ART");
    return 1;
  }
  else
  {
    puts("Successfully parsed ART:");
    printf("counter: %lld\n", (_QWORD)v11);
    sub_100002FDC("manifest hash", *((uint64_t *)&v11 + 1), (unsigned __int8 *)v12);
    sub_100002FDC("sleep hash", *((uint64_t *)&v12 + 1), (unsigned __int8 *)v13);
    sub_100002FDC("restore nonce", *((uint64_t *)&v13 + 1), (unsigned __int8 *)v14);
    for (i = 255; i != -1; --i)
    {
      if (SEPARTCounterFind(i, (uint64_t)&v10, *((uint64_t *)&v14 + 1), v15))
        printf("subcounters[%lu]: %llu\n", i, v10);
    }
    return 0;
  }
}

uint64_t sub_100002FDC(const char *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v4;
  unsigned int v5;

  if (!a2)
    return printf("%s absent\n", a1);
  v4 = a2;
  printf("%s (%ld bytes): ", a1, a2);
  do
  {
    v5 = *a3++;
    printf("%c%c", a0123456789abcd[(unint64_t)v5 >> 4], a0123456789abcd[v5 & 0xF]);
    --v4;
  }
  while (v4);
  return putchar(10);
}

uint64_t sub_100003080(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  _QWORD v7[3];
  _QWORD v8[7];
  unsigned __int8 *v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  int v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  int v19;
  _OWORD v20[28];
  unint64_t v21;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19 = -1431655766;
  v15 = -1431655766;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v20[26] = v2;
  v20[27] = v2;
  v20[24] = v2;
  v20[25] = v2;
  v20[22] = v2;
  v20[23] = v2;
  v20[20] = v2;
  v20[21] = v2;
  v20[18] = v2;
  v20[19] = v2;
  v20[16] = v2;
  v20[17] = v2;
  v20[14] = v2;
  v20[15] = v2;
  v20[12] = v2;
  v20[13] = v2;
  v20[10] = v2;
  v20[11] = v2;
  v20[8] = v2;
  v20[9] = v2;
  v20[6] = v2;
  v20[7] = v2;
  v20[4] = v2;
  v20[5] = v2;
  v20[2] = v2;
  v20[3] = v2;
  v20[0] = v2;
  v20[1] = v2;
  v8[0] = sub_1000035A0;
  v8[1] = sub_1000035A0;
  v8[2] = sub_1000035A0;
  v8[3] = sub_1000035A0;
  memset(v7, 0, sizeof(v7));
  v8[5] = 0;
  v8[6] = 0;
  v8[4] = v7;
  v13 = 0;
  v14 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v9 = 0;
  v10 = 0xAAAAAAAA00000000;
  v11 = 0;
  v12 = 0xAAAAAAAA00000000;
  if (!sub_100003260((uint64_t)v20, a1, a2, (uint64_t)&v13, (uint64_t)&v9, 0, 0, (uint64_t)v8))
  {
    if (v18)
    {
      sub_100002FDC("sepi digest", v14, v13);
      sub_100002FDC("sepi nonce", v17, v16);
      if (!HIDWORD(v17))
        goto LABEL_8;
      v4 = "sepi allows mix 'n match";
    }
    else
    {
      v4 = "sepi absent";
    }
    puts(v4);
LABEL_8:
    if ((_DWORD)v12)
    {
      sub_100002FDC("rsep digest", v10, v9);
      sub_100002FDC("rsep nonce", v11, *((unsigned __int8 **)&v10 + 1));
      if (!HIDWORD(v11))
        return 0;
      v5 = "rsep allows mix 'n match";
    }
    else
    {
      v5 = "rsep absent";
    }
    puts(v5);
    return 0;
  }
  v3 = 1;
  fwrite("img4: img4 parse failed\n", 0x18uLL, 1uLL, __stderrp);
  return v3;
}

uint64_t sub_100003260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _DWORD *a7, uint64_t a8)
{
  int v14;
  int v16;
  int v17;
  __int128 v18;
  uint64_t v19;

  Img4DecodeInit(a2, a3, a1);
  if (v14)
  {
    printf("img4: Img4DecodeInit failed: %d\n", v14);
    return 1;
  }
  else
  {
    v18 = off_1000205F8;
    v19 = 0;
    Img4DecodePerformTrustEvaluatationWithCallbacks(0x73657069u, a1, (uint64_t)&v18, a8, a4);
    *(_DWORD *)(a4 + 32) = v16 == 0;
    Img4DecodePerformTrustEvaluatationWithCallbacks(0x72736570u, a1, (uint64_t)&v18, a8, a5);
    *(_DWORD *)(a5 + 32) = v17 == 0;
    if (a8 && a1 && a6)
    {
      if (a7)
      {
        *a6 = a1 + 328;
        *a7 = **(_QWORD **)(a8 + 32);
      }
    }
    return 0;
  }
}

uint64_t sub_100003364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __int128 v10;
  int v11;
  const char *v12;
  const char *v14;
  size_t v15[2];
  void *v16[2];
  size_t __n[2];
  void *__s1[2];
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  void *__s2;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  _OWORD v36[28];
  unint64_t v37;

  v35 = 0;
  v34 = 0;
  if (!qword_100024BE0)
    qword_100024BE0 = ccsha1_di();
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = -1431655766;
  v33 = -1431655766;
  v22 = -1431655766;
  v26 = -1431655766;
  v36[0] = v10;
  v36[1] = v10;
  v36[2] = v10;
  v36[3] = v10;
  v36[4] = v10;
  v36[5] = v10;
  v36[6] = v10;
  v36[7] = v10;
  v36[8] = v10;
  v36[9] = v10;
  v36[10] = v10;
  v36[11] = v10;
  v36[12] = v10;
  v36[13] = v10;
  v36[14] = v10;
  v36[15] = v10;
  v36[16] = v10;
  v36[17] = v10;
  v36[18] = v10;
  v36[19] = v10;
  v36[20] = v10;
  v36[21] = v10;
  v36[22] = v10;
  v36[23] = v10;
  v36[24] = v10;
  v36[25] = v10;
  v36[26] = v10;
  v36[27] = v10;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v27 = 0;
  v28 = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v20 = 0;
  v21 = 0;
  __s2 = 0;
  v24 = 0;
  v25 = 0;
  *(_OWORD *)v15 = 0u;
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)__n = 0u;
  *(_OWORD *)__s1 = 0u;
  v19 = 0;
  if (sub_100003260((uint64_t)v36, a1, a2, (uint64_t)&v27, (uint64_t)&v20, &v35, &v34, (uint64_t)kImg4DecodeSecureBootRsa1kSha1))
  {
    LOBYTE(v11) = 0;
    v12 = "preflight: FAIL: could not parse img4";
LABEL_5:
    puts(v12);
    return v11 & 1;
  }
  if (a3 && sub_100002DC4((uint64_t *)v15, a3, a4))
  {
    LOBYTE(v11) = 0;
    v12 = "preflight: FAIL: could not parse ART";
    goto LABEL_5;
  }
  v11 = (HIDWORD(v31) | HIDWORD(v24)) != 0;
  if (HIDWORD(v31) | HIDWORD(v24))
    puts("preflight: mix 'n match specified");
  if (__n[1] && __n[1] == v24 && !memcmp(__s1[0], __s2, __n[1]))
  {
    if ((a5 & 2) != 0)
      v14 = "preflight: restore nonce matches";
    else
      v14 = "preflight: nonce matches, but not checking restore";
    v11 |= (a5 & 2) >> 1;
    puts(v14);
  }
  if (v15[1] && v15[1] == v34 && !memcmp(v16[0], v35, v15[1]))
  {
    if ((a5 & 1) != 0)
      v12 = "preflight: manifest hash matches sepi";
    else
      v12 = "preflight: manifest hash matches, but not checking load";
    LOBYTE(v11) = a5 | v11;
    goto LABEL_5;
  }
  return v11 & 1;
}

uint64_t sub_1000035A0()
{
  return 0;
}

uint64_t sub_1000035A8(int a1, uint64_t *a2, int a3, uint64_t a4)
{
  int v6;
  unint64_t v7;
  char v8;

  v7 = 0xAAAAAAAAAAAAAAAALL;
  v6 = -1431655766;
  if (a1 == 1095585357)
  {
    v8 = -86;
    if (Img4DecodeGetPropertyBoolean((uint64_t)a2, 1095585357, (BOOL *)&v8))
    {
      puts("img4: couldn't get BOOL property - fatal");
      exit(1);
    }
    if (v8)
      *(_DWORD *)(a4 + 28) = 1;
  }
  else if (a1 == 1936617326)
  {
    if (!a3 && !Img4DecodeGetPropertyData(a2, 1936617326, &v7, &v6))
    {
      *(_QWORD *)(a4 + 16) = v7;
      *(_DWORD *)(a4 + 24) = v6;
    }
  }
  else if (a1 == 1145525076 && a3 == 1 && !Img4DecodeGetPropertyData(a2, 1145525076, &v7, &v6))
  {
    *(_QWORD *)a4 = v7;
    *(_DWORD *)(a4 + 8) = v6;
  }
  return 0;
}

uint64_t sub_1000036C0()
{
  const char *v0;

  v0 = (const char *)qword_100024C20;
  if (!qword_100024C20)
  {
    v0 = "AppleSEPUtil";
    qword_100024C20 = (uint64_t)"AppleSEPUtil";
  }
  fprintf(__stderrp, "Usage: %s ...\n", v0);
  fputc(10, __stderrp);
  fwrite("OPTIONS:\n\n", 0xAuLL, 1uLL, __stderrp);
  fwrite("\tGeneric commands\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--ping                   Send a PING operation to the SEP OS\n", 0x3FuLL, 1uLL, __stderrp);
  fwrite("\t\t--rawlog                 Dump the mailbox message RAW log without decoding\n", 0x4DuLL, 1uLL, __stderrp);
  fwrite("\t\t--securitymode           Request SEP effective production status and security mode\n", 0x55uLL, 1uLL, __stderrp);
  fwrite("\t\t--nap                    Nap the SEP NOW!\n", 0x2CuLL, 1uLL, __stderrp);
  fwrite("\t\t--sleep                  Sleep the SEP NOW!\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--pingflood              Ping SEP endlessly\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--rng-dump <count>       Dump specified count bytes worth of data from TRNG\n", 0x4EuLL, 1uLL, __stderrp);
  fwrite("\t\t--launch-macos-app <ver> Launch MacOS serving app variant for the specified 16-bit hex version\n", 0x61uLL, 1uLL, __stderrp);
  fwrite("\t\t--outfile <path>         Output file path. \"-\" for stdout\n", 0x3CuLL, 1uLL, __stderrp);
  fwrite("\t\t--infile <path>          Input file path if passing in some data\n", 0x43uLL, 1uLL, __stderrp);
  fwrite("\t\t--l4panic                Force an L4 panic\n", 0x2DuLL, 1uLL, __stderrp);
  fwrite("\t\t--sepospanic             Force a SEP/OS panic\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("\t\t--requestpanic           Force a SEP/OS client requested panic\n", 0x41uLL, 1uLL, __stderrp);
  fwrite("\t\t--report-code-coverage   Output a structured data file with coverage data\n", 0x4CuLL, 1uLL, __stderrp);
  fwrite("\t\t--help                   Display this usage\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--process-info           Display information for SEP processes\n", 0x41uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tFirmware commands\n", 0x13uLL, 1uLL, __stderrp);
  fwrite("\t\t--load <file>            Load <file> as the SEP runtime firmware\n", 0x43uLL, 1uLL, __stderrp);
  fwrite("\t\t--restore <file>         Load <file> as the SEP runtime firmware in restore mode\n", 0x53uLL, 1uLL, __stderrp);
  fwrite("\t\t--restore+art <file>     Load <file> as the SEP runtime firmware in restore mode with ART\n", 0x5CuLL, 1uLL, __stderrp);
  fwrite("\t\t--slot <slot id>         Set nonce slot to be used to boot the SEP FW that is being loaded \n", 0x5EuLL, 1uLL, __stderrp);
  fwrite("\t\t--wait <file>            Pause for kernel driver to load before failing\n", 0x4AuLL, 1uLL, __stderrp);
  fwrite("\t\t--preflight              Pre-flight load/restore firmware against ART to pre-check for boot failures\n", 0x67uLL, 1uLL, __stderrp);
  fwrite("\t\t--boot-check <file>      Check whether the installed SEPFW might be bootable WRT the current ART\n", 0x63uLL, 1uLL, __stderrp);
  fwrite("\t\t--dump-fw <file>         Dump measurements of installed SEP FW file \n", 0x47uLL, 1uLL, __stderrp);
  fwrite("\t\t--commit-hash       Commit the SEP hash of the currently loaded firmware. Requires slot to be passed with --slot where nonce slots supported.\n", 0x90uLL, 1uLL, __stderrp);
  fwrite("\t\t--commit-hash-ap    Commit the AP hash of the currently loaded firmware. Requires slot to be passed with --slot where nonce slots supported.\n", 0x8FuLL, 1uLL, __stderrp);
  fprintf(__stderrp, "\tExample: %s --wait --load /path/to/foo\n", (const char *)qword_100024C20);
  fputc(10, __stderrp);
  fwrite("\tROM commands\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t\t--rom status             Get the ROM status\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--rom tz0                Send a ROM TZ0 command\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--rom nop                Send a ROM NOP command\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--new-rom-nonce          Request new ROM nonce. Requires --outfile\n", 0x45uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tART commands\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t\t--art get                Dump current ART from Memory\n", 0x38uLL, 1uLL, __stderrp);
  fwrite("\t\t--art clear              Clear the persisted ART\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--art ctrtest            Counter self-test\n", 0x2DuLL, 1uLL, __stderrp);
  fwrite("\t\t--minblocks <value>      Optional argument to compare \"--art ctrtest\" good pages against\n", 0x5BuLL, 1uLL, __stderrp);
  fwrite("\t\t--art-set <value>        Persist the supplied ART value to storage\n", 0x45uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-nonce              Get current SEP/OS nonce\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--new-nonce              Request new SEP/OS nonce\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--kill-nonce             Request invalidate SEP/OS nonce\n", 0x3BuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tOOL Object commands\n", 0x15uLL, 1uLL, __stderrp);
  fwrite("\t\t--size <size>            Size of object in case requesting object create\n", 0x4BuLL, 1uLL, __stderrp);
  fwrite("\t\t--create <obj>           Create an object in SEP. Requires --size\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--service <srvc>         Service handle with which an object is to be shared\n", 0x4FuLL, 1uLL, __stderrp);
  fwrite("\t\t--share <obj>            Share an object. Requires --service\n", 0x3FuLL, 1uLL, __stderrp);
  fwrite("\t\t--get <obj>              Read obj and write to stdout\n", 0x38uLL, 1uLL, __stderrp);
  fwrite("\t\t--put <obj>              Read stdin and write to obj\n", 0x37uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tPairing commands\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--pair <obj>             Factory pairing commands. Requires: --outfile\n", 0x49uLL, 1uLL, __stderrp);
  fwrite("\t\t                         Valid arguments for <obj>- STCK, SIGN\n", 0x41uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tUnit test commands\n", 0x14uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-run <category>[/<test>]\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t\t                         Run a test or set of tests in a category\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-all               Run all available tests\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-list              List all available tests\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-input <file>      Set testing input data\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-output <file>     Set testing output data\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-offset <value>    Set data transfer offset within input data (default=0)\n", 0x52uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-timeout <value>   Set the default delay in milliseconds to wait for test completion (default=120000)\n", 0x6EuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\t\tExamples:\n", 0xCuLL, 1uLL, __stderrp);
  fprintf(__stderrp, "\t\t%s --test-run test/pass (run the test 'pass' in the category 'test')\n", (const char *)qword_100024C20);
  fprintf(__stderrp, "\t\t%s --test-run test (run all tests in the category 'test')\n", (const char *)qword_100024C20);
  fputc(10, __stderrp);
  fwrite("\tSystem testing commands\n", 0x19uLL, 1uLL, __stderrp);
  fwrite("\t\t--tunable-check <value>  Enable or disable tunable check mode.\n", 0x41uLL, 1uLL, __stderrp);
  fwrite("\t\t                         'value' should be 'enable' or 'disable'.\n", 0x44uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tDebugging and Diagnostic commands\n", 0x23uLL, 1uLL, __stderrp);
  fwrite("\t\t--list-var <app>                  List all debug variables in app\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-var <app>:<name>            Get value of debug variable\n", 0x40uLL, 1uLL, __stderrp);
  fwrite("\t\t--set-var <app>:<name>:<value>    Set value of debug variable. If the value is out of range of the debug variable (signed or unsigned), throws an error\n", 0x9AuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tCoverage commands\n", 0x13uLL, 1uLL, __stderrp);
  fwrite("\t\t--dump-cov <app>      Dump and reset coverage counters to object\n", 0x43uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tSMC test command\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--send-smc-events <count> Send <count> test SMC events to SEP\n", 0x40uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tDynamic Scheme3 test command\n", 0x1EuLL, 1uLL, __stderrp);
  fwrite("\t\t--alloc-dynamic-object \t Request allocation of test Dynamic Scheme3 object\n", 0x4DuLL, 1uLL, __stderrp);
  fwrite("\t\t--dealloc-dynamic-object \t Request deallocation of test Dynamic Scheme3 object\n", 0x51uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tProvisional AP slot commands (only supported where nonce slots supported)\n", 0x4BuLL, 1uLL, __stderrp);
  fwrite("\t\t--set-provisional <value> \tSet the provisional state of AP slot to 1 (provisional) or 0 (not provisional). Requires slot to be passed with --slot.\n", 0x95uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-provisional \tRequires slot to be passed with --slot\n", 0x3CuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tBare words on the commandline are sent to the SEP as a console command\n", 0x48uLL, 1uLL, __stderrp);
  return fprintf(__stderrp, "\tExample: %s help\n\n", (const char *)qword_100024C20);
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4;
  FILE *v5;
  int *v6;
  io_registry_entry_t v8;
  io_registry_entry_t v9;
  io_object_t v10;
  const __CFData *v11;
  const __CFData *v12;
  CFTypeID v13;
  const UInt8 *BytePtr;
  BOOL v15;
  const char *v16;
  int v17;
  _BOOL8 v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  uint32_t v28;
  int v29;
  char *v30;
  char *v31;
  size_t v32;
  char *v33;
  int v34;
  char *v35;
  int v36;
  char *v40;
  int v41;
  unint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  int v68;
  int v69;
  unsigned int v70;
  FILE *v71;
  const char *v72;
  uint64_t v73;
  FILE *v74;
  const char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  FILE *v89;
  const char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  char *v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  char **i;
  char v111;
  unsigned __int8 *v112;
  int v113;
  void *outputStruct;
  uint64_t v115;
  BOOL v116;
  unsigned int v117;
  unint64_t v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  unsigned int v123;
  uint64_t v124;
  FILE *v125;
  FILE *v126;
  char v127;
  unsigned int v128;
  char v129;
  uint64_t v130;
  int v131;
  BOOL v132;
  int v133;
  uint64_t v134;
  unint64_t v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  unsigned int v139;
  unsigned __int16 v140;
  char v141;
  char v142;
  char *v143;
  char *v144;
  char v145;
  char *v146;
  char v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  char v159;
  int v160;
  unint64_t v161;
  int v162;
  int v163;
  char v164;
  char *v165[3];
  uint64_t v166;
  int v167;
  int v168;
  unint64_t v169;
  int v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  int v175;
  int v176[3];
  uint32_t v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  BOOL v183;
  char v184[8];
  int v185;
  char v186;
  unsigned int v187;
  unsigned int v188;
  uuid_t uu;
  char inputStruct[8];
  uint64_t v191;
  uint64_t v192;
  int v193;
  char v194[16];
  __int128 v195;
  char __dst[16];
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _OWORD v200[2];
  char v201[1024];
  char v202[1024];
  _OWORD v203[28];
  unint64_t v204;
  _OWORD v205[28];
  unint64_t v206;
  char v207[1024];
  char *v208[128];

  bzero(v202, 0x400uLL);
  bzero(v201, 0x400uLL);
  memset(v200, 0, sizeof(v200));
  v198 = 0u;
  v199 = 0u;
  *(_OWORD *)__dst = 0u;
  v197 = 0u;
  *(_OWORD *)v194 = 0u;
  v195 = 0u;
  *(_QWORD *)v184 = 0;
  v191 = 0;
  *(_QWORD *)inputStruct = 0;
  v193 = 0;
  v192 = 0;
  memset(uu, 0, sizeof(uu));
  setlinebuf(__stdoutp);
  setlinebuf(__stderrp);
  qword_100024C20 = (uint64_t)basename(*a2);
  if (!qword_100024C20)
  {
    v5 = __stderrp;
    v6 = __error();
    strerror(*v6);
    fprintf(v5, "ERROR: failed to determine utility name: %s\n");
    return *__error();
  }
  if (geteuid())
  {
    fprintf(__stderrp, "%s: must be run as root\n", (const char *)qword_100024C20);
    return 13;
  }
  v8 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
  if (!v8)
  {
    printf("%s: No SEP present on this device\n", (const char *)qword_100024C20);
    return 0;
  }
  IOObjectRelease(v8);
  if (!strncmp((const char *)qword_100024C20, "init_data_protection", 0x20uLL))
  {
    bzero(v208, 0x400uLL);
    bzero(v207, 0x400uLL);
    v187 = 0;
    byte_100024C2D = 1;
    v9 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
    if (!v9)
    {
      fprintf(__stderrp, "%s: can't find arm-io/sep\n", (const char *)qword_100024C20);
      return 2;
    }
    v10 = v9;
    v188 = -1431655766;
    v11 = (const __CFData *)IORegistryEntrySearchCFProperty(v9, "IODeviceTree", CFSTR("sepfw-loaded"), kCFAllocatorDefault, 0);
    v12 = v11;
    if (v11)
    {
      v13 = CFGetTypeID(v11);
      if (v13 == CFDataGetTypeID())
      {
        if (CFDataGetLength(v12) == 4)
        {
          BytePtr = CFDataGetBytePtr(v12);
          v15 = *(_DWORD *)BytePtr != 0;
          v16 = "was not ";
          if (*(_DWORD *)BytePtr)
            v16 = (const char *)&unk_100019B71;
          printf("SEP firmware %spreloaded in memory\n", v16);
LABEL_204:
          if (sub_10000B77C("sepfw-load-at-boot"))
          {
            v206 = 0xAAAAAAAAAAAAAAAALL;
            *(_QWORD *)&v55 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v205[27] = v55;
            v205[26] = v55;
            v205[25] = v55;
            v205[24] = v55;
            v205[23] = v55;
            v205[22] = v55;
            v205[21] = v55;
            v205[20] = v55;
            v205[19] = v55;
            v205[18] = v55;
            v205[17] = v55;
            v205[16] = v55;
            v205[15] = v55;
            v205[14] = v55;
            v205[13] = v55;
            v205[12] = v55;
            v205[11] = v55;
            v205[10] = v55;
            v205[9] = v55;
            v205[8] = v55;
            v205[7] = v55;
            v205[6] = v55;
            v205[5] = v55;
            v205[4] = v55;
            v205[3] = v55;
            v205[2] = v55;
            v205[1] = v55;
            v205[0] = v55;
            v186 = -86;
            v56 = sub_100006CBC();
            if ((_DWORD)v56)
            {
              v4 = v56;
              fprintf(__stderrp, "%s: Failed to connect to sep\n", (const char *)qword_100024C20);
LABEL_210:
              v57 = 0;
LABEL_211:
              v58 = 0;
              goto LABEL_212;
            }
            if (sub_10000B77C("protected-data-access"))
            {
              v59 = sub_100007784(0);
              if ((_DWORD)v59)
              {
                v4 = v59;
                fprintf(__stderrp, "%s: Failed to initialize gigalocker: %d\n", (const char *)qword_100024C20, v59);
                v57 = 0;
                v58 = 0;
                goto LABEL_212;
              }
            }
            if (!v15)
            {
              v60 = sub_100006BC4((uint64_t)v208, 5);
              if ((_DWORD)v60)
              {
                v4 = v60;
                v79 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v79, 3944);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  sub_100016560();
                goto LABEL_210;
              }
              v61 = malloc_type_malloc(0x2000000uLL, 0xC9C21C0CuLL);
              if (v61)
              {
                v57 = v61;
                v62 = sub_10000ADEC(v61, 0x2000000uLL, (char *)v208, &v188);
                if ((_DWORD)v62)
                {
                  v4 = v62;
                  v81 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v81, 3951);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    sub_1000164D8();
                  goto LABEL_211;
                }
                Img4DecodeInit((uint64_t)v57, v188, (uint64_t)v205);
                if (v63)
                {
                  v82 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v82, 3954);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    sub_100016450();
                }
                else if (sub_100002688((uint64_t)v205, (BOOL *)&v186))
                {
                  if (!v186)
                  {
                    v58 = 0;
                    v70 = 255;
                    goto LABEL_276;
                  }
                  v64 = malloc_type_malloc(0x40000uLL, 0x271CD3C5uLL);
                  if (v64)
                  {
                    v58 = v64;
                    v65 = sub_100006BC4((uint64_t)v207, 8);
                    if ((_DWORD)v65)
                    {
                      v4 = v65;
                      v85 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v85, 3965);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_100016340();
                      goto LABEL_212;
                    }
                    v66 = sub_10000ADEC(v58, 0x40000uLL, v207, &v187);
                    if ((_DWORD)v66)
                    {
                      v4 = v66;
                      v86 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v86, 3969);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_1000162B8();
                      goto LABEL_212;
                    }
                    v204 = 0xAAAAAAAAAAAAAAAALL;
                    *(_QWORD *)&v67 = 0xAAAAAAAAAAAAAAAALL;
                    *((_QWORD *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v203[27] = v67;
                    v203[26] = v67;
                    v203[25] = v67;
                    v203[24] = v67;
                    v203[23] = v67;
                    v203[22] = v67;
                    v203[21] = v67;
                    v203[20] = v67;
                    v203[19] = v67;
                    v203[18] = v67;
                    v203[17] = v67;
                    v203[16] = v67;
                    v203[15] = v67;
                    v203[14] = v67;
                    v203[13] = v67;
                    v203[12] = v67;
                    v203[11] = v67;
                    v203[10] = v67;
                    v203[9] = v67;
                    v203[8] = v67;
                    v203[7] = v67;
                    v203[6] = v67;
                    v203[5] = v67;
                    v203[4] = v67;
                    v203[3] = v67;
                    v203[2] = v67;
                    v203[1] = v67;
                    v203[0] = v67;
                    Img4DecodeInit((uint64_t)v58, v187, (uint64_t)v203);
                    if (v68)
                    {
                      v87 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v87, 3974);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_100016230();
                      goto LABEL_277;
                    }
                    v185 = -1431655766;
                    Img4DecodeGetRestoreInfoInteger((uint64_t)v203, 1936615780, &v185);
                    if (v69)
                    {
                      v70 = 2;
                      printf("Didn't find snid in patches IM4R, using default slot %u\n", 2);
                    }
                    else
                    {
                      v70 = v185;
                      printf("Found slot %u in patches IM4R\n", v185);
                    }
LABEL_276:
                    printf("Loading SEP FW in %s with slot %u\n", "defaultInit", v70);
                    if (sub_10000AFC0((uint64_t)v57, v188, v58, v187, 6u, v70))
                    {
LABEL_277:
                      v4 = 0;
                      goto LABEL_212;
                    }
                    fprintf(__stderrp, "%s: auto load failed\n", (const char *)qword_100024C20);
                    v4 = 5;
LABEL_212:
                    if (!v12)
                      goto LABEL_229;
                    goto LABEL_228;
                  }
                  v84 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v84, 3961);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    sub_1000161A8();
                }
                else
                {
                  v83 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v83, 3955);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    sub_1000163C8();
                }
                v58 = 0;
                v4 = 1;
                goto LABEL_212;
              }
              v80 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
              printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v80, 3947);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                sub_100016120();
            }
          }
          else
          {
            puts("Skipping SEP firmware load");
          }
          v4 = 0;
          goto LABEL_210;
        }
        fprintf(__stderrp, "%s: Incorrect value size for sepfw-loaded property\n");
      }
      else
      {
        fprintf(__stderrp, "%s: Incorrect sepfw-loaded entry value type\n");
      }
      v58 = 0;
      v57 = 0;
      v4 = 33;
LABEL_228:
      CFRelease(v12);
LABEL_229:
      IOObjectRelease(v10);
      if (v57)
        free(v57);
      if (v58)
        free(v58);
      return v4;
    }
    v15 = 0;
    goto LABEL_204;
  }
  if (a1 < 2)
  {
    fprintf(__stderrp, "%s: ERROR: At least one option required\n");
LABEL_11:
    sub_1000036C0();
    return 22;
  }
  v17 = getopt_long(a1, a2, "a:b:c:d:f:g:hkmno:pq:r:s:t:uv:wx:CDFI:L:NO:PR:ST:W:", (const option *)&off_100024000, 0);
  if (v17 != -1)
  {
    v181 = 0;
    v179 = 0;
    v122 = 0;
    v159 = 0;
    v157 = 0;
    v158 = 0;
    v182 = 0;
    v18 = 0;
    v19 = 0;
    v166 = 0;
    v168 = 0;
    v132 = 0;
    v130 = 0;
    v131 = 0;
    v155 = 0;
    v156 = 0;
    v174 = 0;
    v153 = 0;
    v154 = 0;
    v139 = 0;
    v140 = 0;
    v129 = 0;
    v150 = 0;
    v151 = 0;
    v152 = 0;
    v141 = 0;
    v147 = 0;
    v146 = 0;
    v145 = 0;
    v143 = 0;
    v142 = 0;
    v128 = 0;
    v127 = 0;
    v119 = 0;
    v120 = 0;
    v20 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v117 = 0;
    v123 = 0;
    v180 = 0;
    v137 = 0;
    v138 = 0;
    *(_QWORD *)v176 = 0;
    v118 = 0;
    v133 = 0;
    v121 = 0;
    v134 = 0;
    v135 = 0;
    v160 = 0;
    v161 = 0;
    v162 = 0;
    v163 = 0;
    v172 = 0;
    v173 = 0;
    v136 = 0;
    v178 = 0;
    v177 = 0;
    v169 = 0;
    v170 = 0;
    v175 = 0;
    v171 = 255;
    memset(v165, 170, sizeof(v165));
    v148 = (char *)0xAAAAAAAAAAAAAAAALL;
    v149 = (char *)0xAAAAAAAAAAAAAAAALL;
    v144 = (char *)0xAAAAAAAAAAAAAAAALL;
    v167 = 255;
    v164 = -1;
    while (1)
    {
      if (v17 > 767)
      {
        if (v17 <= 1023)
        {
          switch(v17)
          {
            case 768:
              if (!optarg)
              {
                fprintf(__stderrp, "%s: missing UUID \n");
                return 22;
              }
              if (uuid_parse(optarg, uu))
              {
                fprintf(__stderrp, "%s: invalid UUID\n");
                return 22;
              }
              v122 = 1;
              break;
            case 770:
              v165[2] = optarg;
              v168 = 1;
              break;
            case 771:
              v165[1] = optarg;
              HIDWORD(v166) = 1;
              break;
            case 772:
              byte_100025430 = 1;
              break;
            case 773:
              byte_100025434 = 1;
              break;
            case 774:
              if (!optarg)
              {
                fprintf(__stderrp, "%s: Missing slot ID\n");
                goto LABEL_11;
              }
              if (*optarg)
              {
                v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                v25 = strtoul(optarg, v208, 10);
                v26 = v171;
                if (!*v208[0])
                  v26 = v25;
                v171 = v26;
              }
              break;
            case 775:
              v165[0] = optarg;
              LODWORD(v166) = 1;
              break;
            case 776:
              if (!optarg)
              {
                fprintf(__stderrp, "%s: Missing set provisional state \n");
                goto LABEL_11;
              }
              v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              v24 = strtoull(optarg, v208, 10);
              if (v208[0] != &optarg[strlen(optarg)])
              {
                v75 = "%s: Unable to parse provisional AP slot state\n";
LABEL_304:
                fprintf(__stderrp, v75, qword_100024C20);
                goto LABEL_11;
              }
              if (v24 >= 2)
              {
                v75 = "%s: Invalid value for provisional AP slot state\n";
                goto LABEL_304;
              }
              v18 = v24 == 1;
              fprintf(__stderrp, "set_provisional_ap_value %d\n", v24 == 1);
              v19 = 1;
              break;
            case 777:
              v182 = 1;
              break;
            default:
              goto LABEL_281;
          }
        }
        else
        {
          switch(v17)
          {
            case 1024:
              v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100006C58(optarg, 10, (unint64_t *)v208) || v208[0] > (char *)1)
              {
                fprintf(__stderrp, "%s: Missing or invalid BIS bits per subpixel type value\n");
                goto LABEL_11;
              }
              v119 = v208[0];
              LOBYTE(v120) = 1;
              break;
            case 1025:
              v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100006C58(optarg, 10, (unint64_t *)v208) || v208[0] > (char *)1)
                goto LABEL_270;
              v128 = v208[0];
              v127 = 1;
              break;
            case 1026:
              v143 = optarg;
              v142 = 1;
              break;
            case 1027:
              v146 = optarg;
              v145 = 1;
              break;
            case 1028:
              LODWORD(v154) = 1;
              break;
            case 1029:
              v147 = 1;
              break;
            case 1030:
              v141 = 1;
              break;
            case 1031:
              LOBYTE(v150) = 1;
              break;
            case 1032:
              BYTE4(v158) = 1;
              break;
            case 1033:
              BYTE4(v151) = 1;
              break;
            case 1034:
              v152 = optarg;
              LOBYTE(v151) = 1;
              break;
            case 1035:
              v144 = optarg;
              BYTE4(v150) = 1;
              break;
            case 1036:
              v148 = optarg;
              LOBYTE(v153) = 1;
              break;
            case 1037:
              v149 = optarg;
              BYTE4(v153) = 1;
              break;
            case 1038:
              v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100006C58(optarg, 10, (unint64_t *)v208)
                || (v139 = v208[0], v208[0] > (char *)0x29))
              {
LABEL_270:
                fprintf(__stderrp, "%s: Missing or invalid gain test set\n");
                goto LABEL_11;
              }
              v129 = 1;
              break;
            case 1039:
              v174 = optarg;
              BYTE4(v154) = 1;
              break;
            case 1040:
              LOBYTE(v155) = 1;
              break;
            case 1041:
              BYTE4(v155) = 1;
              break;
            case 1042:
              v174 = optarg;
              break;
            case 1043:
              v156 = optarg;
              break;
            case 1044:
              LOBYTE(v157) = 1;
              break;
            case 1045:
              v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100006C58(optarg, 10, (unint64_t *)v208) || v208[0] > (char *)2)
              {
                fprintf(__stderrp, "%s: bad corruption type %s\n");
                return 22;
              }
              v131 = (int)v208[0];
              LOBYTE(v130) = 1;
              break;
            case 1046:
              v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100006C58(optarg, 10, (unint64_t *)v208) || v208[0] > (char *)1)
              {
                fprintf(__stderrp, "%s: bad gain restriction %s\n");
                return 22;
              }
              v132 = v208[0] != 0;
              BYTE4(v130) = 1;
              break;
            case 1047:
              BYTE4(v157) = 1;
              break;
            default:
              if (v17 == 1792)
              {
                LOBYTE(v158) = 1;
              }
              else
              {
                if (v17 != 1793)
                {
LABEL_281:
                  fprintf(__stderrp, "%s: ERROR: Invalid option\n");
                  goto LABEL_11;
                }
                v159 = 1;
              }
              break;
          }
        }
      }
      else
      {
        switch(v17)
        {
          case 'C':
            v21 = sub_100006BC4((uint64_t)v202, 5);
            if ((_DWORD)v21)
              return v21;
            HIDWORD(v137) = 1;
            break;
          case 'D':
            v21 = sub_100006BC4((uint64_t)v202, 5);
            if ((_DWORD)v21)
              return v21;
            LODWORD(v137) = 1;
            break;
          case 'E':
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'Q':
          case 'U':
          case 'V':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'e':
          case 'i':
          case 'j':
          case 'l':
            goto LABEL_281;
          case 'F':
            LODWORD(v172) = 1;
            break;
          case 'I':
            v35 = optarg;
            if (strcmp(optarg, "-"))
            {
              v34 = open(v35, 0);
              v167 = v34;
              goto LABEL_95;
            }
            v167 = fileno(__stdinp);
            break;
          case 'L':
            v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
            if (!sub_100006C58(optarg, 16, (unint64_t *)v208))
            {
              fprintf(__stderrp, "%s: Missing or invalid version\n");
              goto LABEL_11;
            }
            v140 = (unsigned __int16)v208[0];
            if (v208[0] >= (char *)0x10000)
            {
              fprintf(__stderrp, "%s: version argument 0x%lx is not a valid uint16 value\n");
              return 22;
            }
            BYTE4(v121) = 1;
            break;
          case 'N':
            LODWORD(v173) = 1;
            break;
          case 'O':
            v29 = fileno(__stdinp);
            if (isatty(v29))
            {
              fprintf(__stderrp, "%s: not reading object data from a terminal, re-direct data from another file\n");
              return 22;
            }
            if (!optarg)
            {
LABEL_265:
              fprintf(__stderrp, "%s: Missing name \n");
              goto LABEL_11;
            }
            strncpy(__dst, optarg, 0x20uLL);
            HIDWORD(v120) = 1;
            break;
          case 'P':
            break;
          case 'R':
            if (!optarg)
              goto LABEL_266;
            strncpy(v194, optarg, 0x20uLL);
            v133 = 1;
            break;
          case 'S':
            HIDWORD(v172) = 1;
            break;
          case 'T':
            if (!optarg)
              goto LABEL_265;
            strncpy(__dst, optarg, 0x20uLL);
            LODWORD(v134) = 1;
            break;
          case 'W':
            v33 = optarg;
            if (!strcmp(optarg, "-"))
            {
              v164 = 1;
            }
            else
            {
              LOBYTE(v34) = creat(v33, 0x1A5u);
              v164 = v34;
LABEL_95:
              if ((v34 & 0x80) != 0)
              {
                v74 = __stderrp;
                goto LABEL_280;
              }
            }
            break;
          case 'a':
            v30 = optarg;
            if (!optarg)
              goto LABEL_266;
            v31 = (char *)&v198;
            v32 = 32;
            goto LABEL_106;
          case 'b':
            v198 = *(_OWORD *)"set";
            v199 = unk_100018FF2;
            v30 = optarg;
            if (!optarg)
            {
              fprintf(__stderrp, "%s: Missing value \n");
              goto LABEL_11;
            }
            v31 = &byte_100024C2E;
            v32 = 2048;
LABEL_106:
            strncpy(v31, v30, v32);
            HIDWORD(v173) = 1;
            break;
          case 'c':
            if (!optarg)
              goto LABEL_265;
            strncpy(__dst, optarg, 0x20uLL);
            HIDWORD(v134) = 1;
            break;
          case 'd':
            v36 = fileno(__stdoutp);
            if (isatty(v36))
            {
              fprintf(__stderrp, "%s: not writing data to a terminal, re-direct data to another file\n");
              return 22;
            }
            if (!optarg)
            {
LABEL_272:
              fprintf(__stderrp, "%s: Missing count \n");
              goto LABEL_11;
            }
            v169 = strtol(optarg, 0, 10);
            v170 = 1;
            break;
          case 'f':
            if (!optarg)
              goto LABEL_264;
            strncpy(v202, optarg, 0x400uLL);
            v178 = 1;
            v28 = 6;
            goto LABEL_116;
          case 'g':
            if (!optarg)
              goto LABEL_272;
            v135 = strtol(optarg, 0, 10);
            break;
          case 'h':
            sub_1000036C0();
            break;
          case 'k':
            v162 = 1;
            break;
          case 'm':
            v175 = 1;
            break;
          case 'n':
            v163 = 1;
            break;
          case 'o':
            v27 = fileno(__stdoutp);
            if (isatty(v27))
            {
              fprintf(__stderrp, "%s: not writing object data to a terminal, re-direct data to another file\n");
              return 22;
            }
            if (!optarg)
              goto LABEL_265;
            strncpy(__dst, optarg, 0x20uLL);
            LODWORD(v121) = 1;
            break;
          case 'p':
            v181 = 1;
            break;
          case 'q':
            if (!optarg)
              goto LABEL_264;
            strncpy(v201, optarg, 0x400uLL);
            break;
          case 'r':
            if (!optarg)
              goto LABEL_264;
            strncpy(v202, optarg, 0x400uLL);
            v178 = 1;
            v28 = 7;
            goto LABEL_116;
          case 's':
            if (!optarg)
            {
LABEL_266:
              fprintf(__stderrp, "%s: Missing sub-command\n");
              goto LABEL_11;
            }
            strncpy((char *)v200, optarg, 0x20uLL);
            v136 = 1;
            break;
          case 't':
            if (!optarg)
            {
LABEL_264:
              fprintf(__stderrp, "%s: Missing file path\n");
              goto LABEL_11;
            }
            strncpy(v202, optarg, 0x400uLL);
            v178 = 1;
            v28 = 8;
LABEL_116:
            v177 = v28;
            break;
          case 'u':
            v179 = 1;
            break;
          case 'v':
            v161 = strtol(optarg, 0, 10);
            break;
          case 'w':
            byte_100024C2D = 1;
            break;
          case 'x':
            v160 = string_to_handle((unint64_t)optarg);
            break;
          default:
            switch(v17)
            {
              case 257:
                v22 = optarg;
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing test name\n");
                  goto LABEL_11;
                }
                v23 = strchr(optarg, 47);
                if (v23)
                {
                  *v23 = 0;
                  v117 = string_to_handle((unint64_t)(v23 + 1));
                }
                v123 = string_to_handle((unint64_t)v22);
                v180 = 3;
                goto LABEL_192;
              case 258:
                v41 = 1;
                goto LABEL_174;
              case 259:
                v41 = 4;
                goto LABEL_174;
              case 260:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing test input file\n");
                  goto LABEL_11;
                }
                v125 = fopen(optarg, "r");
                if (v125)
                  goto LABEL_192;
                fprintf(__stderrp, "%s: Couldn't open testing input\n");
                return *__error();
              case 261:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing test output file\n");
                  goto LABEL_11;
                }
                v126 = fopen(optarg, "w");
                if (v126)
                  goto LABEL_192;
                fprintf(__stderrp, "%s: Couldn't open testing output\n");
                return *__error();
              case 262:
                v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                if (!sub_100006C58(optarg, 10, (unint64_t *)v208))
                {
                  fprintf(__stderrp, "%s: Missing or invalid test offset value\n");
                  goto LABEL_11;
                }
                LODWORD(v124) = v208[0];
                goto LABEL_192;
              case 263:
              case 265:
              case 266:
              case 268:
              case 269:
                goto LABEL_281;
              case 264:
                v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                if (!sub_100006C58(optarg, 10, (unint64_t *)v208))
                {
                  fprintf(__stderrp, "%s: Missing or invalid test timeout value\n");
                  goto LABEL_11;
                }
                HIDWORD(v124) = v208[0];
                v41 = 5;
LABEL_174:
                v180 = v41;
                goto LABEL_192;
              case 267:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing output file\n");
                  goto LABEL_11;
                }
                sub_10000D888(optarg);
                goto LABEL_192;
              case 270:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing dump coverage name \n");
                  goto LABEL_11;
                }
                strncpy(&v184[4], optarg, 4uLL);
                byte_100025438 = 1;
                goto LABEL_192;
              case 271:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing SMC event count \n");
                  goto LABEL_11;
                }
                strtoull(optarg, 0, 10);
                goto LABEL_192;
              case 272:
                if (!optarg)
                  goto LABEL_267;
                strncpy(v184, optarg, 4uLL);
                *(_QWORD *)v176 = 6;
                goto LABEL_192;
              case 273:
                if (!optarg)
                  goto LABEL_267;
                v42 = v20;
                v43 = v18;
                v44 = v19;
                v49 = strtok(optarg, ":");
                strncpy(v184, v49, 4uLL);
                v50 = strtok(0, ":");
                if (!v50)
                  goto LABEL_274;
                strncpy(inputStruct, v50, 0x1CuLL);
                v48 = 7;
                goto LABEL_191;
              case 274:
                if (!optarg)
                {
LABEL_267:
                  fprintf(__stderrp, "%s: Missing arguments \n");
                  goto LABEL_11;
                }
                v42 = v20;
                v43 = v18;
                v44 = v19;
                v45 = strtok(optarg, ":");
                strncpy(v184, v45, 4uLL);
                v46 = strtok(0, ":");
                if (!v46)
                {
LABEL_274:
                  fprintf(__stderrp, "%s: Missing debug var name \n");
                  goto LABEL_11;
                }
                strncpy(inputStruct, v46, 0x1CuLL);
                v47 = strtok(0, ":");
                if (!v47)
                {
                  fprintf(__stderrp, "%s: Missing debug var new value \n");
                  goto LABEL_11;
                }
                v118 = strtoull(v47, 0, 0);
                v48 = 8;
LABEL_191:
                *(_QWORD *)v176 = v48;
                v19 = v44;
                v18 = v43;
                v20 = v42;
                goto LABEL_192;
              case 275:
                if (!optarg)
                  goto LABEL_271;
                v20 = string_to_handle((unint64_t)optarg);
                byte_100024C28 = 1;
                goto LABEL_192;
              case 276:
                if (!optarg)
                {
LABEL_271:
                  fprintf(__stderrp, "%s: Missing object handle \n");
                  goto LABEL_11;
                }
                v20 = string_to_handle((unint64_t)optarg);
                byte_100024C2C = 1;
                goto LABEL_192;
              case 277:
                v40 = optarg;
                if (!strcmp(optarg, "enable"))
                {
                  v138 = 0x100000001;
                }
                else
                {
                  if (strcmp(v40, "disable"))
                  {
                    fprintf(__stderrp, "%s: Tunable mode must be 'enable' or 'disable'.\n");
                    return 22;
                  }
                  v138 = 0x100000000;
                }
                break;
              default:
                if (v17)
                  goto LABEL_281;
                goto LABEL_192;
            }
            break;
        }
      }
LABEL_192:
      v17 = getopt_long(a1, a2, "a:b:c:d:f:g:hkmno:pq:r:s:t:uv:wx:CDFI:L:NO:PR:ST:W:", (const option *)&off_100024000, 0);
      if (v17 == -1)
        goto LABEL_199;
    }
  }
  v175 = 0;
  v172 = 0;
  v173 = 0;
  v170 = 0;
  v169 = 0;
  v177 = 0;
  v178 = 0;
  v137 = 0;
  v138 = 0;
  v136 = 0;
  v134 = 0;
  v135 = 0;
  v163 = 0;
  v162 = 0;
  v120 = 0;
  v121 = 0;
  v161 = 0;
  v160 = 0;
  v133 = 0;
  v118 = 0;
  v119 = 0;
  *(_QWORD *)v176 = 0;
  v180 = 0;
  v123 = 0;
  v117 = 0;
  v125 = 0;
  v126 = 0;
  v124 = 0;
  v140 = 0;
  v141 = 0;
  LODWORD(v20) = 0;
  v127 = 0;
  v128 = 0;
  v142 = 0;
  v143 = 0;
  v145 = 0;
  v146 = 0;
  v153 = 0;
  v154 = 0;
  v147 = 0;
  v150 = 0;
  v151 = 0;
  v152 = 0;
  v129 = 0;
  v139 = 0;
  v174 = 0;
  v155 = 0;
  v156 = 0;
  v157 = 0;
  v158 = 0;
  v130 = 0;
  v131 = 0;
  v132 = 0;
  v168 = 0;
  LODWORD(v19) = 0;
  LOBYTE(v18) = 0;
  v182 = 0;
  v159 = 0;
  v122 = 0;
  v179 = 0;
  v181 = 0;
  v164 = -1;
  v167 = 255;
  v144 = (char *)0xAAAAAAAAAAAAAAAALL;
  v148 = (char *)0xAAAAAAAAAAAAAAAALL;
  v149 = (char *)0xAAAAAAAAAAAAAAAALL;
  v166 = 0;
  memset(v165, 170, sizeof(v165));
  v171 = 255;
LABEL_199:
  if ((byte_100025439 & 1) != 0)
  {
    v116 = v18;
    v51 = v19;
    v52 = v182;
    v53 = 0xFFFFFFFFLL;
  }
  else
  {
    v54 = sub_100006CBC();
    if ((_DWORD)v54)
    {
      v4 = v54;
      fprintf(__stderrp, "%s: Failed to connect to sep\n");
      return v4;
    }
    v116 = v18;
    v51 = v19;
    v52 = v182;
    v53 = 0;
  }
  if (v181 && IOConnectCallScalarMethod(dword_100024BE8, 0, 0, 0, 0, 0))
  {
    fprintf(__stderrp, "%s: ping failed\n");
    return 5;
  }
  if (v179 && sub_100006FAC())
  {
    fprintf(__stderrp, "%s: mailbox raw log print failed\n");
    return 5;
  }
  if (v175 && !sub_10000725C())
  {
    fprintf(__stderrp, "%s: security mode query failed\n");
    return 5;
  }
  if ((_DWORD)v173 && IOConnectCallScalarMethod(dword_100024BE8, 2u, 0, 0, 0, 0))
  {
    fprintf(__stderrp, "%s: Nap failed\n");
    return 5;
  }
  if (HIDWORD(v172) && IOConnectCallScalarMethod(dword_100024BE8, 1u, 0, 0, 0, 0))
  {
    fprintf(__stderrp, "%s: Sleep failed\n");
    return 5;
  }
  if ((_DWORD)v172)
  {
    sub_100007300();
    v71 = __stderrp;
    outputStruct = (void *)qword_100024C20;
    v72 = "%s: pingflood failed\n";
LABEL_255:
    fprintf(v71, v72, outputStruct, v115);
    return 5;
  }
  if (v170 && (sub_1000073D8(v169) & 1) == 0)
  {
    fprintf(__stderrp, "%s: rng-dump %ld failed\n");
    return 5;
  }
  if (dword_100024BF0 && !sub_1000075F0())
  {
    fprintf(__stderrp, "%s: process info failed\n");
    return 5;
  }
  if (dword_100024BF4)
  {
    v73 = sub_100007784(1);
    if ((_DWORD)v73)
    {
      v4 = v73;
      fprintf(__stderrp, "%s: Gigalocker initialization failed: %d\n");
      return v4;
    }
    v53 = 0;
  }
  if (!dword_100024BF8)
    goto LABEL_312;
  if (!dword_100024BE8)
    sub_1000165E8();
  v76 = IOConnectCallMethod(dword_100024BE8, 0x2Eu, 0, 0, 0, 0, 0, 0, 0, 0);
  v53 = 0;
  if ((_DWORD)v76)
  {
    v4 = v76;
    v91 = (int)v76;
    v92 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v91, (const char *)&unk_100019B71, v92, 1961);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000165FC();
  }
  else
  {
LABEL_312:
    v183 = 0;
    if (sub_10000BE70(&v183))
    {
      fwrite("Failed to query nonce slot support\n", 0x23uLL, 1uLL, __stderrp);
      return 5;
    }
    if (v178)
    {
      if (v183 && (_BYTE)v171 == 0xFF)
      {
        puts("Boot slot not provided to load SEPFW, setting to default");
        v171 = 2;
      }
      v77 = v201[0] ? v201 : 0;
      if (!sub_100007B34(v202, v77, v177, v171))
      {
        fprintf(__stderrp, "%s: failed to load %s in %c%c%c%c mode\n");
        return 5;
      }
    }
    if (dword_100024BFC && !sub_100008034())
    {
      fprintf(__stderrp, "%s: failed to notify SEP/OS about erase install\n");
      return 5;
    }
    if (byte_100025430 == 1)
    {
      if (v183 && (_BYTE)v171 == 0xFF)
      {
        fprintf(__stderrp, "%s: didn't provide slot ID to commit-hash");
        return 22;
      }
      if (!sub_1000080BC(v171, 0))
      {
        fprintf(__stderrp, "%s: failed to commit SEP hash\n");
        return 5;
      }
    }
    if (byte_100025434 == 1)
    {
      if (v183 && (_BYTE)v171 == 0xFF)
      {
        fprintf(__stderrp, "%s: didn't provide slot ID to commit-hash-ap");
        return 22;
      }
      if (!sub_1000080BC(v171, 1u))
      {
        fprintf(__stderrp, "%s: failed to commit AP hash\n");
        return 5;
      }
    }
    if (dword_100024C08)
    {
      if ((v167 & 0x80) != 0)
        fprintf(__stderrp, "%s: No lcrt file provided\n", (const char *)qword_100024C20);
      if ((sub_100008184((char)v167) & 1) == 0)
      {
        fprintf(__stderrp, "%s: lcrt verification failed\n");
        return 5;
      }
    }
    if ((v168 & 1) != 0 && (sub_10000829C(v165[2]) & 1) == 0)
    {
      fprintf(__stderrp, "%s: failed to get lynx chip serial number\n");
      return 5;
    }
    if ((v166 & 0x100000000) != 0 && (sub_1000083C8(v165[1]) & 1) == 0)
    {
      fprintf(__stderrp, "%s: failed to get lynx public key\n");
      return 5;
    }
    if ((v166 & 1) != 0 && (sub_1000084F4(v165[0]) & 1) == 0)
    {
      fprintf(__stderrp, "%s: failed to get lynx app hash\n");
      return 5;
    }
    if (HIDWORD(v137))
    {
      if (dword_10002543C == 2)
      {
        if (sub_1000085F8(v202))
        {
          fprintf(__stderrp, "%s: boot check failed\n");
          return 5;
        }
      }
      else
      {
        puts("bootCheck: Cannot perform boot check on non-ART platform. Assuming OK");
      }
    }
    if ((_DWORD)v137)
    {
      v78 = sub_1000087E0(v202);
      if ((_DWORD)v78)
      {
        v4 = v78;
        fprintf(__stderrp, "%s: dump firmware failed\n");
        return v4;
      }
      v53 = 0;
    }
    if (v136 && (sub_1000088B8((const char *)v200) & 1) == 0)
    {
      fprintf(__stderrp, "%s: ROM command %s failed\n");
      return 5;
    }
    if (dword_100024C00 && !sub_1000089C0(v164))
      return 5;
    if (HIDWORD(v173) && (sub_100008AE8((const char *)&v198, v135, v159 & 1) & 1) == 0)
    {
      fprintf(__stderrp, "%s: ART command %s failed\n");
      return 5;
    }
    if (dword_100024C04 && !sub_100008F0C())
    {
      fprintf(__stderrp, "%s: ART get nonce request failed\n");
      return 5;
    }
    if (v163 && (sub_100008FC8() & 1) == 0)
    {
      fprintf(__stderrp, "%s: ART new-nonce request failed\n");
      return 5;
    }
    if (v162 && IOConnectCallStructMethod(dword_100024BE8, 0x10u, 0, 0, 0, 0))
    {
      fprintf(__stderrp, "%s: ART invalidate nonce request failed\n");
      return 5;
    }
    if ((v121 & 0x100000000) != 0)
    {
      v88 = sub_1000090F8(v140);
      if ((_DWORD)v88)
      {
        v89 = __stderrp;
        outputStruct = (void *)qword_100024C20;
        v115 = v88;
        v72 = "%s: Failed to start versioned apps result=0x%x\n";
LABEL_399:
        v71 = v89;
        goto LABEL_255;
      }
    }
    if (HIDWORD(v134))
    {
      if (!v161)
      {
        fprintf(__stderrp, "%s: Invalid/No object size specified\n");
        return 5;
      }
      if (!sub_100009168((unint64_t)__dst, v161))
      {
        fprintf(__stderrp, "%s: Object create failed\n");
        return 5;
      }
    }
    if ((_DWORD)v134)
    {
      if (!v160)
      {
        fprintf(__stderrp, "%s: Invalid/No service handle\n");
        return 5;
      }
      if ((sub_100009288((unint64_t)__dst, v160) & 1) == 0)
      {
        fprintf(__stderrp, "%s: Share %s failed\n");
        return 5;
      }
    }
    if ((_DWORD)v121 && (sub_100009388((unint64_t)__dst) & 1) == 0)
    {
      fprintf(__stderrp, "%s: Get %s failed\n");
      return 5;
    }
    if (HIDWORD(v120) && (sub_100009504((unint64_t)__dst) & 1) == 0)
    {
      fprintf(__stderrp, "%s: Put %s failed\n");
      return 5;
    }
    if (v133 && (sub_1000096D4((unint64_t)v194, (char)v167, v164) & 1) == 0)
    {
      fprintf(__stderrp, "%s: pairing failed\n");
      return 5;
    }
    if (v122 && !sub_100009978(uu))
      return 22;
    if (v180)
    {
      LOBYTE(v208[0]) = -86;
      if (!sepTesting(v180, v125, v124, HIDWORD(v124), v126, v117, v123, v208))
      {
        v4 = 5;
        v90 = "%s: test command failed\n";
        goto LABEL_434;
      }
      if (v180 == 3 && !LOBYTE(v208[0]))
      {
        v4 = 1;
        v90 = "%s: test returned failure\n";
LABEL_434:
        fprintf(__stderrp, v90, qword_100024C20, v115);
        return v4;
      }
    }
    if (v176[0])
    {
      v93 = sepDebugVar(v176[0], v184, inputStruct, v118);
      if ((_DWORD)v93)
      {
        v89 = __stderrp;
        outputStruct = *(void **)v176;
        v115 = v93;
        v72 = "Debug var command %d failed, ret: 0x%x\n";
        goto LABEL_399;
      }
      v53 = 0;
    }
    if ((v138 & 0x100000000) != 0)
    {
      v94 = sub_100009A00(v138 & 1);
      if ((_DWORD)v94)
      {
        v89 = __stderrp;
        outputStruct = (void *)v94;
        v72 = "Failed to update tunable check mode. ret: 0x%x\n";
        goto LABEL_399;
      }
      v53 = 0;
    }
    if ((v120 & 1) != 0)
    {
      v208[0] = (char *)v119;
      v95 = IOConnectCallScalarMethod(dword_100024BE8, 0x30u, (const uint64_t *)v208, 1u, 0, 0);
      if ((_DWORD)v95)
      {
        v4 = v95;
        fprintf(__stderrp, "%s: Hilo accumulate test pattern failed: 0x%x\n");
        return v4;
      }
      v53 = 0;
    }
    v4 = v53;
    if ((v127 & 1) != 0)
    {
      v208[0] = (char *)v128;
      v96 = IOConnectCallScalarMethod(dword_100024BE8, 0x31u, (const uint64_t *)v208, 1u, 0, 0);
      v4 = v96;
      v97 = (v141 & 1) != 0 ? -536870174 : 0;
      if ((_DWORD)v96 != v97)
      {
        fprintf(__stderrp, "%s: Hilo gain calculation had unexpected return value: 0x%x, hilo_expect_gain_failure: %d\n");
        return v4;
      }
    }
    if ((v142 & 1) != 0)
    {
      v4 = sub_100009A78(v143);
      if ((_DWORD)v4)
      {
        fprintf(__stderrp, "%s: Hilo get LTH failed: 0x%x\n");
        return v4;
      }
    }
    if ((v145 & 1) != 0)
    {
      v98 = (v154 & 1) != 0 ? -536870174 : 0;
      v4 = sub_100009B3C(v146, v154);
      if ((_DWORD)v4 != v98)
      {
        fprintf(__stderrp, "%s: Hilo load LTH had unexpected return value: 0x%x\n");
        return v4;
      }
    }
    if ((v147 & 1) != 0)
    {
      v208[0] = (char *)0xAAAAAAAAAAAAAAAALL;
      v99 = sub_100009C50(v208);
      if ((_DWORD)v99)
      {
        v4 = v99;
        fprintf(__stderrp, "%s: Couldn't get raw LTH, return value: 0x%x");
        return v4;
      }
      v100 = v208[0];
      v101 = sub_100009D5C((uint64_t)v208[0]);
      free(v100);
      if ((v101 & 1) == 0)
        fprintf(__stderrp, "%s: Raw LTH didn't have expected value", (const char *)qword_100024C20);
      v4 = 0;
    }
    if ((v150 & 1) != 0)
    {
      v4 = IOConnectCallScalarMethod(dword_100024BE8, 0x35u, 0, 0, 0, 0);
      if ((_DWORD)v4)
      {
        fprintf(__stderrp, "%s: Hilo update timer failed: 0x%x\n");
        return v4;
      }
    }
    if ((v150 & 0x100000000) != 0)
    {
      v4 = sub_100009EA0(v144);
      if ((_DWORD)v4)
      {
        fprintf(__stderrp, "%s: Raw LTH fetch operation failed: 0x%x\n");
        return v4;
      }
    }
    if ((v151 & 1) == 0 || (v4 = sub_100009F6C(v152, BYTE4(v151) & 1), !(_DWORD)v4))
    {
      if ((v153 & 1) == 0 || (v4 = sub_10000A200(v148), !(_DWORD)v4))
      {
        if ((v153 & 0x100000000) != 0)
        {
          v4 = (v154 & 1) != 0 ? 3758097122 : 0;
          v102 = sub_10000A2B0(v149, v154);
          if ((_DWORD)v102 != (_DWORD)v4)
          {
            v103 = v102;
            fprintf(__stderrp, "%s: Hilo load LTH had unexpected return value: 0x%x\n", (const char *)qword_100024C20, v102);
            return v103;
          }
        }
        if ((v129 & 1) == 0
          || (v208[0] = (char *)v139,
              v4 = IOConnectCallScalarMethod(dword_100024BE8, 0x3Au, (const uint64_t *)v208, 1u, 0, 0),
              !(_DWORD)v4))
        {
          if ((v154 & 0x100000000) != 0)
          {
            v4 = sub_10000A37C(v174);
            if ((_DWORD)v4)
            {
              fprintf(__stderrp, "%s: Hilo test LTH transfer attestation had unexpected return value: 0x%x\n");
              return v4;
            }
          }
          if ((v155 & 1) != 0)
          {
            v4 = sub_10000A52C(v164, (char)v167);
            if ((_DWORD)v4)
            {
              fprintf(__stderrp, "%s: Hilo get LTH transfer attestation failed: 0x%x\n");
              return v4;
            }
          }
          if ((v155 & 0x100000000) != 0)
          {
            if (!v174)
            {
              fprintf(__stderrp, "%s: cannot get LTH transfer message without scrt path\n");
              return v4;
            }
            v104 = open(v174, 0);
            if (v104 < 0)
            {
              v74 = __stderrp;
              goto LABEL_280;
            }
            v105 = v104;
            if (v156)
            {
              v106 = open(v156, 0);
              if (v106 < 0)
              {
                v74 = __stderrp;
LABEL_280:
                fprintf(v74, "%s: can't open '%s'\n");
                return *__error();
              }
            }
            else
            {
              v106 = -1;
            }
            v107 = sub_10000A698(v164, v105, (char)v167, v106);
            if ((_DWORD)v107)
            {
              v4 = v107;
              fprintf(__stderrp, "%s: Hilo get LTH transfer message failed: 0x%x\n");
              return v4;
            }
          }
          if ((v157 & 1) != 0)
          {
            v108 = sub_10000A8BC((char)v167);
            if ((_DWORD)v108)
            {
              v4 = v108;
              fprintf(__stderrp, "%s: Hilo load LTH transfer message failed: 0x%x\n");
              return v4;
            }
          }
          if ((v130 & 1) != 0 && (sub_10000A94C(v164, (char)v167, v131) & 1) == 0)
          {
            v4 = 3758097084;
            fprintf(__stderrp, "%s: Hilo corrupt attestation failed\n");
            return v4;
          }
          if ((v130 & 0x100000000) != 0 && !sub_10000AA7C(v132))
          {
            v4 = 3758097084;
            fprintf(__stderrp, "%s: Hilo gain restriction set failed\n");
            return v4;
          }
          if ((v157 & 0x100000000) != 0 && hilo_advance_gain_restriction_phase())
          {
            v4 = 3758097084;
            fprintf(__stderrp, "%s: Hilo advance gain restriction phase failed\n");
            return v4;
          }
          if (dword_100024C0C)
            sub_10000B614();
          if (dword_100024C10)
            sub_10000B68C();
          if (dword_100024C14)
            sub_10000B704();
          if ((v158 & 1) != 0 && !sub_10000AAC4())
          {
            v4 = 3758097084;
            fprintf(__stderrp, "%s: Purge system token failed\n");
            return v4;
          }
          if ((v158 & 0x100000000) != 0)
            sub_10000BA08();
          if (byte_100025438 == 1 && !sub_10000AB40((unint64_t)&v184[4]))
          {
            fprintf(__stderrp, "%s: dump coverage failed\n", (const char *)qword_100024C20);
          }
          else
          {
            if (dword_100024C18 && !sub_10000BAE4())
              return 3758097084;
            if ((byte_100024C28 & 1) != 0 || byte_100024C2C)
              sub_10000ABA0(v20, byte_100024C28);
            if (((v51 | v52) & 1) != 0)
            {
              if ((_BYTE)v171 == 0xFF)
              {
                fprintf(__stderrp, "%s: Provisional AP command missing slot ID\n");
                return 5;
              }
              if (!sub_10000AC18(v171, v51 & 1, v116))
              {
                fprintf(__stderrp, "%s: Provisional AP command failed\n");
                return 5;
              }
            }
            v109 = a1 - optind;
            if (v109 >= 1)
            {
              for (i = &a2[optind]; ; ++i)
              {
                v111 = **i;
                if (v111)
                {
                  v112 = (unsigned __int8 *)(*i + 1);
                  while (sub_10000AD0C(v111))
                  {
                    v113 = *v112++;
                    v111 = v113;
                    if (!v113)
                      goto LABEL_535;
                  }
                  fprintf(__stderrp, "%s: ttyin '%c' failed\n");
                  return 5;
                }
LABEL_535:
                if (v109 < 2)
                  break;
                if (!sub_10000AD0C(32))
                {
                  fprintf(__stderrp, "%s: ttyin ' ' failed\n");
                  return 5;
                }
                --v109;
              }
              if (!sub_10000AD0C(10))
              {
                fprintf(__stderrp, "%s: ttyin '\\n' failed");
                return 5;
              }
              if (isatty(0))
                usleep(0x3D090u);
            }
          }
          return 0;
        }
      }
    }
  }
  return v4;
}

uint64_t sub_100006BC4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a1)
  {
    result = lookupPathForPersonalizedData(a2, a1, 1024);
    if (result)
    {
      fprintf(__stderrp, "%s: error %ld while retrieving path for personalized data\n", (const char *)qword_100024C20, result);
      return 5;
    }
  }
  else
  {
    fprintf(__stderrp, "%s: invalid argument passed to %s\n", (const char *)qword_100024C20, "get_firmware_path");
    return 22;
  }
  return result;
}

BOOL sub_100006C58(const char *a1, int __base, unint64_t *a3)
{
  uint64_t v3;
  char *__endptr;

  v3 = 0;
  if (a1)
  {
    if (a3)
    {
      v3 = *(unsigned __int8 *)a1;
      if (*a1)
      {
        __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
        *a3 = strtoul(a1, &__endptr, __base);
        return *__endptr == 0;
      }
    }
  }
  return v3;
}

uint64_t sub_100006CBC()
{
  uint64_t v0;
  uint64_t v1;
  CFMutableDictionaryRef v3;
  const __CFDictionary *v4;
  __CFRunLoop *v5;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v7;
  io_registry_entry_t v8;
  io_object_t v9;
  CFTypeRef v10;
  int v11;
  mach_port_t mainPort;

  mainPort = -1431655766;
  if ((byte_100025439 & 1) != 0)
  {
LABEL_2:
    v0 = 0;
    goto LABEL_5;
  }
  v1 = IOMasterPort(0, &mainPort);
  if ((_DWORD)v1)
  {
    v0 = v1;
    fprintf(__stderrp, "%s: could not get master port\n");
  }
  else
  {
    v3 = IOServiceMatching("AppleSEPManager");
    if (v3)
    {
      v4 = v3;
      if (signal(2, (void (__cdecl *)(int))sub_10000AD54) == (void (__cdecl *)(int))-1)
        fprintf(__stderrp, "%s: Could not register SIGINT handler. We may leak an IOKit iterator if interrupted\n", (const char *)qword_100024C20);
      qword_100025440 = (uint64_t)CFRunLoopGetCurrent();
      qword_100025448 = (uint64_t)IONotificationPortCreate(mainPort);
      v5 = (__CFRunLoop *)qword_100025440;
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_100025448);
      CFRunLoopAddSource(v5, RunLoopSource, kCFRunLoopDefaultMode);
      v7 = IOServiceAddMatchingNotification((IONotificationPortRef)qword_100025448, "IOServiceFirstMatch", v4, (IOServiceMatchingCallback)sub_10000AD7C, 0, (io_iterator_t *)&dword_100025450);
      if ((_DWORD)v7)
      {
        v0 = v7;
        fprintf(__stderrp, "%s: could not add async match notification\n");
      }
      else
      {
        sub_10000AD7C(0, dword_100025450);
        if ((byte_100025439 & 1) != 0
          || byte_100024C2D == 1
          && (fprintf(__stderrp, "%s: Waiting %d seconds for AppleSEPManager...\n", (const char *)qword_100024C20, 60),
              CFRunLoopRunInMode(kCFRunLoopDefaultMode, 60.0, 1u),
              (byte_100025439 & 1) != 0))
        {
          v8 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
          if (v8)
          {
            v9 = v8;
            v10 = IORegistryEntrySearchCFProperty(v8, "IODeviceTree", CFSTR("has-art"), kCFAllocatorDefault, 0);
            if (v10)
            {
              CFRelease(v10);
              v11 = 2;
            }
            else
            {
              v11 = 1;
            }
            dword_10002543C = v11;
            IOObjectRelease(v9);
            goto LABEL_2;
          }
          fprintf(__stderrp, "%s: find arm-io/sep failed\n", (const char *)qword_100024C20);
          fprintf(__stderrp, "%s: ART query failed\n", (const char *)qword_100024C20);
          v0 = 2;
        }
        else
        {
          fprintf(__stderrp, "%s: Timeout trying to connect to the SEP\n", (const char *)qword_100024C20);
          v0 = 60;
        }
      }
    }
    else
    {
      fprintf(__stderrp, "%s: could not make matching dictionary for '%s'\n", (const char *)qword_100024C20, "AppleSEPManager");
      v0 = 93;
    }
  }
LABEL_5:
  if (dword_100025450)
  {
    IOObjectRelease(dword_100025450);
    dword_100025450 = 0;
  }
  return v0;
}

uint64_t sub_100006FAC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *outputStruct;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t i;
  uint32_t outputCnt;
  size_t v13;
  uint64_t output;
  uint64_t v15;
  unint64_t v16;

  output = 0;
  outputCnt = 1;
  v0 = IOConnectCallMethod(dword_100024BE8, 0xDu, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if ((_DWORD)v0)
  {
    v1 = v0;
    fprintf(__stderrp, "%s: getLogSize returned error 0x%x\n", (const char *)qword_100024C20, v0);
  }
  else if (HIDWORD(output))
  {
    return 3758097090;
  }
  else
  {
    v13 = output;
    v1 = output & 7;
    if ((output & 7) != 0)
    {
      fprintf(__stderrp, "%s: inconsistent mailbox Log size : %d\n", (const char *)qword_100024C20, output & 7);
    }
    else
    {
      outputStruct = malloc_type_calloc(1uLL, output, 0x3DF500B0uLL);
      if (outputStruct)
      {
        v4 = outputStruct;
        v15 = 0;
        v16 = 0;
        outputCnt = 2;
        v5 = IOConnectCallMethod(dword_100024BE8, 0xEu, 0, 0, 0, 0, &v15, &outputCnt, outputStruct, &v13);
        if ((_DWORD)v5)
        {
          v1 = v5;
          fprintf(__stderrp, "%s: Get mailbox log failed : %d\n", (const char *)qword_100024C20, v5);
        }
        else
        {
          printf("Kernel message log has %llu entries\n", v15 / v16);
          v6 = v15;
          if (v15)
          {
            v7 = 0;
            v8 = 0;
            do
            {
              v9 = &v4[v7];
              v10 = *v9;
              if (*v9)
              {
                if (v8)
                {
                  printf("<skipped %d empty entries>\n", v8);
                  v10 = *v9;
                }
                printf("0x%016llx:\t0x%016llx", &v4[v7], v10);
                if (v16 >= 2)
                {
                  for (i = 1; i < v16; ++i)
                    printf("\t0x%016llx", v4[v7 + i]);
                }
                putchar(10);
                v8 = 0;
                v6 = v15;
              }
              else
              {
                ++v8;
              }
              v7 += v16;
            }
            while (v7 < v6);
            if (v8)
              printf("<skipped %d empty entries>\n", v8);
          }
          v1 = 0;
        }
        free(v4);
      }
      else
      {
        fprintf(__stderrp, "%s: Failed to allocate memory for fetching mailbox logs\n", (const char *)qword_100024C20);
        return 12;
      }
    }
  }
  return v1;
}

BOOL sub_10000725C()
{
  kern_return_t v0;
  uint32_t outputCnt;
  uint64_t output;

  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  v0 = IOConnectCallScalarMethod(dword_100024BE8, 4u, 0, 0, &output, &outputCnt);
  if (v0)
    fprintf(__stderrp, "%s: Security mode command error: %x\n", (const char *)qword_100024C20, v0);
  else
    printf("Production Status = %llu\nSecurity Mode     = %llu\n", output & 1, (output >> 1) & 1);
  return v0 == 0;
}

uint64_t sub_100007300()
{
  int v0;
  unsigned int v1;
  int v2;
  uint64_t result;
  int v4;

  v0 = -1;
  v1 = 1;
  do
  {
    v2 = random();
    usleep(v2 % 2000);
    result = IOConnectCallScalarMethod(dword_100024BE8, 0, 0, 0, 0, 0);
    v4 = result;
    if (!(v0 + 1000 * (v1 / 0x3E8)))
      result = printf("SEP ping #%d\n", v1);
    --v0;
    ++v1;
  }
  while (!v4);
  return result;
}

uint64_t sub_1000073D8(unint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  FILE *v8;
  const char *v9;
  unsigned int v10;
  size_t outputStructCnt;
  uint32_t outputCnt;
  uint64_t output;
  _BYTE __b[1024];

  v2 = fileno(__stdoutp);
  if (HIDWORD(a1))
  {
    fprintf(__stderrp, "%s: Data out size missing/out of range\n");
    return 0;
  }
  v3 = v2;
  memset(__b, 170, sizeof(__b));
  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = -1431655766;
  outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
  v4 = mach_absolute_time();
  if ((_DWORD)a1)
  {
    while (1)
    {
      if (a1 >= 0x400)
        v5 = 1024;
      else
        v5 = a1;
      output = v5;
      outputCnt = 1;
      outputStructCnt = 1024;
      if (IOConnectCallMethod(dword_100024BE8, 0x23u, &output, 1u, 0, 0, &output, &outputCnt, __b, &outputStructCnt))
      {
        fprintf(__stderrp, "%s: ERROR: %d\n");
        return 0;
      }
      v6 = output;
      if (output >= 0x401)
        break;
      if (output)
        write(v3, __b, output);
      LODWORD(a1) = a1 - v6;
      if (!(_DWORD)a1)
        goto LABEL_11;
    }
    fprintf(__stderrp, "%s: kSEP_RngDump: returned bad data size %lu");
    return 0;
  }
LABEL_11:
  v7 = mach_absolute_time() - v4;
  v8 = __stderrp;
  v9 = (const char *)qword_100024C20;
  v10 = dword_100025458;
  if (!dword_100025458)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_100025454);
    v10 = dword_100025458;
  }
  fprintf(v8, "\n%s: Time taken: %lld ns\n", v9, v7 * dword_100025454 / v10);
  return 1;
}

BOOL sub_1000075F0()
{
  __int128 v0;
  kern_return_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint32_t outputCnt;
  size_t v6;
  uint64_t output;
  uuid_string_t out;
  _BYTE __b[1024];

  memset(__b, 170, sizeof(__b));
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v0 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v0;
  *(_OWORD *)&out[16] = v0;
  v6 = 1024;
  output = 1024;
  outputCnt = 1;
  v1 = IOConnectCallMethod(dword_100024BE8, 0x41u, &output, 1u, 0, 0, &output, &outputCnt, __b, &v6);
  if (v1)
  {
    fprintf(__stderrp, "%s: ERROR: %d\n", (const char *)qword_100024C20, v1);
  }
  else if (output >= 0x20)
  {
    v2 = 0;
    v3 = __b;
    do
    {
      printf("%u %c%c%c%c\n", *(_DWORD *)v3, (*((int *)v3 + 1) >> 24), ((int)(*((_DWORD *)v3 + 1) << 8) >> 24), ((__int16)*((_DWORD *)v3 + 1) >> 8), (char)*((_DWORD *)v3 + 1));
      uuid_unparse(v3 + 8, out);
      printf("\t UUID: %s\n", out);
      printf("\tSlide: 0x%llx\n", *((_QWORD *)v3 + 3));
      ++v2;
      v3 += 32;
    }
    while (v2 < output >> 5);
  }
  return v1 == 0;
}

uint64_t sub_100007784(int a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  int *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  stat __s;
  BOOL v21;
  char inputStruct[1024];

  v21 = 0;
  bzero(inputStruct, 0x400uLL);
  memset(&__s, 0, sizeof(__s));
  v2 = sub_10000BDC0(&v21);
  if ((_DWORD)v2)
  {
    v10 = v2;
    v14 = (int)v2;
    v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v14, (const char *)&unk_100019B71, v15, 4404);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100016928();
  }
  else
  {
    if (!v21)
    {
      printf("%s: xART is not supported on platform, skipping initialization\n", (const char *)qword_100024C20);
      return 0;
    }
    if (a1)
      sub_10000BF20();
    v3 = sub_10000BF30();
    if (stat(v3, &__s) || (__s.st_mode & 0xF000) != 0x4000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000168E4();
      return 20;
    }
    else
    {
      v4 = sub_10000C284(inputStruct, 0x400uLL, (uint64_t)v3, 1);
      if ((_DWORD)v4)
      {
        v10 = v4;
        v16 = (int)v4;
        v17 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_100019B71, v17, 4425);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10001684C();
      }
      else
      {
        memset_s(&__s, 0x90uLL, 0, 0x90uLL);
        v5 = stat(inputStruct, &__s);
        v6 = (const char *)qword_100024C20;
        if (v5)
        {
          v7 = __error();
          v8 = strerror(*v7);
          printf("%s: Gigalocker file (%s) doesn't exist: %s\n", v6, inputStruct, v8);
          if ((a1 & 1) == 0)
            return *__error();
          v9 = sub_10000BF54(inputStruct, 0x600000uLL);
          if ((_DWORD)v9)
          {
            v10 = v9;
            v11 = (int)v9;
            v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v11, (const char *)&unk_100019B71, v12, 4442);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_1000167B4();
            return v10;
          }
          goto LABEL_19;
        }
        printf("%s: Gigalocker file (%s) exists\n", (const char *)qword_100024C20, inputStruct);
        if ((unint64_t)__s.st_size >> 21 > 2)
        {
LABEL_19:
          if (!dword_100024BE8)
            sub_1000165E8();
          v10 = IOConnectCallMethod(dword_100024BE8, 0x2Cu, 0, 0, inputStruct, 0x400uLL, 0, 0, 0, 0);
          if ((_DWORD)v10)
          {
            v18 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", (int)v10, (const char *)&unk_100019B71, v18, 4466);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_10001671C();
          }
          else
          {
            printf("%s: Gigalocker initialization completed\n", (const char *)qword_100024C20);
          }
          return v10;
        }
        v19 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v19, 4446);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100016694();
        return 17;
      }
    }
  }
  return v10;
}

BOOL sub_100007B34(char *a1, char *a2, uint32_t a3, unsigned int a4)
{
  void *v8;
  void *v9;
  void *v10;
  const void *v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  ssize_t v16;
  _BOOL8 v17;
  void *v18;
  uint64_t v19;
  size_t v20;
  const void *v21;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  unsigned int v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;

  v32 = 0;
  v33 = -1431655766;
  if (!a1)
  {
    v23 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v23, 3043);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000169C0();
    return 0;
  }
  if (!strcmp(a1, "-"))
  {
    if (a2)
    {
      v28 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v28, 3046);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100016BE0();
    }
    else
    {
      v13 = malloc_type_malloc(0x2040001uLL, 0x3801825EuLL);
      if (v13)
      {
        v14 = (uint64_t)v13;
        v15 = 0;
        v16 = -1;
        while (v16)
        {
          v16 = read(0, (void *)(v14 + v15), 33816577 - v15);
          if (v16 == -1)
          {
            fprintf(__stderrp, "%s: error reading from stdin");
            goto LABEL_26;
          }
          v15 += v16;
          if (v15 == 33816577)
          {
            fprintf(__stderrp, "%s: stdin data too large");
LABEL_26:
            v17 = 0;
            goto LABEL_31;
          }
        }
        v35 = 0xAAAAAAAAAAAAAAAALL;
        if (Img4DecodeParseLengthFromBuffer(v14, v15, &v35))
        {
          v29 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v29, 2956);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100016B58();
          goto LABEL_26;
        }
        v19 = v35;
        if (v15 < v35)
          sub_1000165E8();
        if (v15 == v35)
        {
          v20 = 0;
          v21 = 0;
        }
        else
        {
          v34 = 0xAAAAAAAAAAAAAAAALL;
          if (Img4DecodeParseLengthFromBuffer(v14 + v35, v15 - v35, &v34))
          {
            v30 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v30, 2966);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_100016AD0();
            goto LABEL_26;
          }
          v20 = v15 - v35;
          if (v15 - v35 != v34)
          {
            v31 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v31, 2968);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_100016A48();
            goto LABEL_26;
          }
          v21 = (const void *)(v14 + v35);
        }
        v17 = sub_10000AFC0(v14, v19, v21, v20, a3, a4);
LABEL_31:
        v18 = (void *)v14;
        goto LABEL_32;
      }
      fprintf(__stderrp, "%s: could not allocate data buffer", (const char *)qword_100024C20);
    }
    return 0;
  }
  v8 = malloc_type_malloc(0x2000000uLL, 0x29D0118FuLL);
  if (!v8)
  {
    v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v24, 3053);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100016C68();
    return 0;
  }
  v9 = v8;
  if (sub_10000ADEC(v8, 0x2000000uLL, a1, &v33))
  {
    v25 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v25, 3056);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100016E00();
LABEL_42:
    free(v9);
    return 0;
  }
  if (a2)
  {
    v10 = malloc_type_malloc(0x40000uLL, 0xBE2D02D9uLL);
    if (v10)
    {
      v11 = v10;
      if (sub_10000ADEC(v10, 0x40000uLL, a2, &v32))
      {
        v27 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v27, 3063);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100016D78();
        free(v9);
        v17 = 0;
        goto LABEL_18;
      }
      v12 = v32;
      goto LABEL_17;
    }
    v26 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v26, 3060);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100016CF0();
    goto LABEL_42;
  }
  v12 = 0;
  v11 = 0;
LABEL_17:
  v17 = sub_10000AFC0((uint64_t)v9, v33, v11, v12, a3, a4);
  free(v9);
  if (v11)
  {
LABEL_18:
    v18 = (void *)v11;
LABEL_32:
    free(v18);
  }
  return v17;
}

BOOL sub_100008034()
{
  kern_return_t v0;

  if (!dword_100024BE8)
    sub_1000165E8();
  v0 = IOConnectCallMethod(dword_100024BE8, 0xAu, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v0)
    fprintf(__stderrp, "%s: Erase install notification returned 0x%x\n", (const char *)qword_100024C20, v0);
  return v0 == 0;
}

BOOL sub_1000080BC(unsigned int a1, unsigned int a2)
{
  kern_return_t v2;
  uint64_t input[2];

  input[0] = a1;
  input[1] = a2;
  printf("%s called with slot %u, for_ap %u\n", "sepCommitHash", a1, a2);
  v2 = IOConnectCallScalarMethod(dword_100024BE8, 9u, input, 2u, 0, 0);
  if (v2)
    fprintf(__stderrp, "%s: commit hash returned 0x%x\n", (const char *)qword_100024C20, v2);
  return v2 == 0;
}

uint64_t sub_100008184(int a1)
{
  mach_port_t v2;
  size_t v3;
  void *v4;
  uint64_t v5;
  size_t v7;
  void *v8;

  v7 = 0;
  v8 = 0;
  v2 = dword_100024BE8;
  if (!dword_100024BE8)
    sub_1000165E8();
  if (a1 < 0)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    if ((sub_10000BC74(&v8, (off_t *)&v7, 0x8000uLL, a1) & 1) == 0)
    {
      fprintf(__stderrp, "%s: can't read in lcrt\n");
      goto LABEL_12;
    }
    v3 = v7;
    if (!v7)
    {
      fprintf(__stderrp, "%s: Zero sized input file\n");
      goto LABEL_12;
    }
    v2 = dword_100024BE8;
    v4 = v8;
  }
  if (!IOConnectCallMethod(v2, 0x29u, 0, 0, v4, v3, 0, 0, 0, 0))
  {
    v5 = 1;
    goto LABEL_13;
  }
  fprintf(__stderrp, "%s: lcrt verification request returned 0x%x\n");
LABEL_12:
  v5 = 0;
LABEL_13:
  if (v8)
    free(v8);
  return v5;
}

uint64_t sub_10000829C(char *a1)
{
  size_t outputStructCnt;
  _BYTE __b[32768];

  memset(__b, 170, sizeof(__b));
  outputStructCnt = 0x8000;
  if (IOConnectCallMethod(dword_100024BE8, 0x2Au, 0, 0, 0, 0, 0, 0, __b, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: lynx get chip serial number returned 0x%x\n");
  }
  else
  {
    if (!sub_10000B518(__b, outputStructCnt, a1))
      return 1;
    fprintf(__stderrp, "%s: couldn't write out Lynx Chip Serial Number\n");
  }
  return 0;
}

uint64_t sub_1000083C8(char *a1)
{
  size_t outputStructCnt;
  _BYTE __b[32768];

  memset(__b, 170, sizeof(__b));
  outputStructCnt = 0x8000;
  if (IOConnectCallMethod(dword_100024BE8, 0x2Bu, 0, 0, 0, 0, 0, 0, __b, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: lynx get public key returned 0x%x\n");
  }
  else
  {
    if (!sub_10000B518(__b, outputStructCnt, a1))
      return 1;
    fprintf(__stderrp, "%s: couldn't write out Lynx Public Key\n");
  }
  return 0;
}

uint64_t sub_1000084F4(char *a1)
{
  __int128 v2;
  int v4[2];
  _OWORD outputStruct[2];

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  outputStruct[0] = v2;
  outputStruct[1] = v2;
  *(_QWORD *)v4 = 32;
  if (IOConnectCallMethod(dword_100024BE8, 0x5Au, 0, 0, 0, 0, 0, 0, outputStruct, (size_t *)v4))
  {
    fprintf(__stderrp, "%s: lynx get app hash returned 0x%x\n");
  }
  else
  {
    if (!sub_10000B518(outputStruct, *(size_t *)v4, a1))
      return 1;
    fprintf(__stderrp, "%s: couldn't write out Lynx app hash\n");
  }
  return 0;
}

uint64_t sub_1000085F8(char *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  kern_return_t v7;
  const char *v8;
  int v9;
  unsigned int v11;
  size_t outputStructCnt;
  _BYTE __b[2048];

  v2 = malloc_type_malloc(0x2000000uLL, 0x7D2ADC60uLL);
  if (v2)
  {
    v3 = v2;
    v11 = -1431655766;
    v4 = sub_10000ADEC(v2, 0x2000000uLL, a1, &v11);
    if ((_DWORD)v4)
    {
      v5 = v4;
      fprintf(__stderrp, "%s: failed to read the firmware file\n", (const char *)qword_100024C20);
    }
    else
    {
      v6 = v11;
      if (v11)
      {
        memset(__b, 170, sizeof(__b));
        outputStructCnt = 2048;
        v7 = IOConnectCallStructMethod(dword_100024BE8, 0x12u, 0, 0, __b, &outputStructCnt);
        if (v7)
        {
          fprintf(__stderrp, "%s: Get ART command error: 0x%x\n", (const char *)qword_100024C20, v7);
          v8 = "CAN NOT";
        }
        else
        {
          v9 = sub_100003364((uint64_t)v3, v6, (uint64_t)__b, (uint64_t)&__b[outputStructCnt], 3);
          v8 = "CAN NOT";
          if (v9)
            v8 = "may";
        }
        printf("bootCheck: SEP %s boot with ART\n", v8);
        v5 = 0;
      }
      else
      {
        fprintf(__stderrp, "%s: incorrect file size reported\n", (const char *)qword_100024C20);
        v5 = 5;
      }
    }
    free(v3);
  }
  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for '%s'\n", (const char *)qword_100024C20, a1);
    return 12;
  }
  return v5;
}

uint64_t sub_1000087E0(char *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;

  v2 = malloc_type_malloc(0x2000000uLL, 0x1AFDBD5uLL);
  if (v2)
  {
    v3 = v2;
    v7 = -1431655766;
    v4 = sub_10000ADEC(v2, 0x2000000uLL, a1, &v7);
    if ((_DWORD)v4)
    {
      v5 = v4;
      fprintf(__stderrp, "%s: read firmware failed\n");
    }
    else
    {
      v5 = sub_100003080((uint64_t)v3, v7);
      if ((_DWORD)v5)
        fprintf(__stderrp, "%s: img4 dump failed\n");
    }
    free(v3);
  }
  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for '%s'\n", (const char *)qword_100024C20, a1);
    return 12;
  }
  return v5;
}

uint64_t sub_1000088B8(const char *a1)
{
  uint64_t v2;
  kern_return_t v3;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input;

  if (!strcmp(a1, "status"))
  {
    v2 = 131583;
  }
  else if (!strcmp(a1, "nop"))
  {
    v2 = 66303;
  }
  else
  {
    if (strcmp(a1, "tz0"))
    {
      puts("unknown ROM command");
      return 0;
    }
    v2 = 328703;
  }
  output = v2;
  input = v2;
  outputCnt = 1;
  v3 = IOConnectCallScalarMethod(dword_100024BE8, 3u, &input, 1u, &output, &outputCnt);
  if (v3)
  {
    fprintf(__stderrp, "%s: ROM command error: %x\n", (const char *)qword_100024C20, v3);
    return 0;
  }
  printf("SEP status 0x%llx\n", output);
  return 1;
}

uint64_t sub_1000089C0(int a1)
{
  size_t v2;
  size_t outputStructCnt;
  _QWORD outputStruct[3];

  memset(outputStruct, 170, 20);
  outputStructCnt = 20;
  if (a1 <= 0)
  {
    fprintf(__stderrp, "%s: No/Illegal outfile provided\n");
  }
  else if (IOConnectCallStructMethod(dword_100024BE8, 0x43u, 0, 0, outputStruct, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: Failed to generate ROM nonce: %x\n");
  }
  else
  {
    v2 = outputStructCnt;
    if (v2 == write(a1, outputStruct, outputStructCnt))
      return 1;
    fprintf(__stderrp, "%s: can't write to output\n");
  }
  return 0;
}

uint64_t sub_100008AE8(const char *a1, unint64_t a2, int a3)
{
  uint64_t v6;
  FILE *v8;
  const char *v9;
  const char *v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t outputCnt;
  size_t outputStructCnt;
  unint64_t v27;
  _BYTE __b[2048];

  memset(__b, 170, sizeof(__b));
  if (!strcasecmp(a1, "get"))
  {
    outputStructCnt = 2048;
    v6 = IOConnectCallStructMethod(dword_100024BE8, 0x12u, 0, 0, __b, &outputStructCnt);
    if ((_DWORD)v6)
    {
LABEL_9:
      v8 = __stderrp;
      v23 = qword_100024C20;
      v24 = v6;
      v9 = "%s: Get ART command error: 0x%x\n";
LABEL_43:
      fprintf(v8, v9, v23, v24);
      return 0;
    }
    sub_100002E78((unint64_t)__b, (unint64_t)&__b[outputStructCnt]);
    return 1;
  }
  if (!strcasecmp(a1, "set"))
  {
    v10 = &byte_100024C2E;
    if (byte_100024C2E == 48 && ((byte_100024C2F - 88) & 0xDF) == 0)
      v10 = (const char *)&unk_100024C30;
    v11 = strlen(v10);
    if (v11 >> 1 > 0x800 || (v11 & 1) != 0 || v11 == 1)
      goto LABEL_31;
    v12 = 0;
    v13 = 0;
    v14 = 2;
    do
    {
      v15 = v10[v13];
      if (v15 - 97 > 5)
      {
        if (v15 - 65 > 5)
        {
          v15 -= 48;
          if (v15 > 9)
            break;
        }
        else
        {
          LOBYTE(v15) = v15 - 55;
        }
      }
      else
      {
        LOBYTE(v15) = v15 - 87;
      }
      v16 = 16 * v15;
      __b[v12] = v16;
      v17 = v10[v14 - 1];
      if (v17 - 97 > 5)
      {
        if (v17 - 65 > 5)
        {
          v17 -= 48;
          if (v17 > 9)
            break;
        }
        else
        {
          LOBYTE(v17) = v17 - 55;
        }
      }
      else
      {
        LOBYTE(v17) = v17 - 87;
      }
      __b[v12++] = v17 | v16;
      v13 = v14;
      v18 = v11 - 1 > v14;
      v14 += 2;
    }
    while (v18);
    if ((int)v12 <= 0)
    {
LABEL_31:
      fprintf(__stderrp, "%s: Set ART command error: malformed hex string provided");
      return 0;
    }
    v19 = IOConnectCallStructMethod(dword_100024BE8, 0x13u, __b, v12, 0, 0);
    if ((_DWORD)v19)
    {
      v8 = __stderrp;
      v23 = qword_100024C20;
      v24 = v19;
      v9 = "%s: Set ART error: 0x%x\n";
      goto LABEL_43;
    }
    v22 = "ART persisted successfully";
    goto LABEL_46;
  }
  if (!strcasecmp(a1, "clear"))
  {
    v20 = IOConnectCallStructMethod(dword_100024BE8, 0x14u, 0, 0, 0, 0);
    if ((_DWORD)v20)
    {
      v8 = __stderrp;
      v23 = qword_100024C20;
      v24 = v20;
      v9 = "%s: Clear ART error: 0x%x\n";
      goto LABEL_43;
    }
    v22 = "ART cleared from storage";
LABEL_46:
    puts(v22);
    return 1;
  }
  if (strcasecmp(a1, "ctrtest"))
  {
    if (!strcasecmp(a1, "has_system_token"))
    {
      outputStructCnt = 2048;
      v6 = IOConnectCallStructMethod(dword_100024BE8, 0x12u, 0, 0, __b, &outputStructCnt);
      if (!(_DWORD)v6)
        return sub_100002CE8((uint64_t)__b, outputStructCnt, a3);
      goto LABEL_9;
    }
    return 0;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    fprintf(__stderrp, "%s: minblocks out of range\n");
    return 0;
  }
  outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
  v27 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  v21 = IOConnectCallScalarMethod(dword_100024BE8, 0x24u, 0, 0, &outputStructCnt, &outputCnt);
  if ((_DWORD)v21 || outputCnt != 2)
  {
    v8 = __stderrp;
    v23 = qword_100024C20;
    v24 = v21;
    v9 = "%s: Counter self-test error: 0x%x\n";
    goto LABEL_43;
  }
  printf("Counter self-test result: %u/%u good\n", v27, outputStructCnt);
  if (v27 < a2)
  {
    fprintf(__stderrp, "%s: Minimum good blocks criteria not met\n");
    return 0;
  }
  return 1;
}

BOOL sub_100008F0C()
{
  kern_return_t v0;
  size_t outputStructCnt;
  _QWORD outputStruct[3];

  memset(outputStruct, 170, 20);
  outputStructCnt = 20;
  if (!dword_100024BE8)
    sub_1000165E8();
  v0 = IOConnectCallStructMethod(dword_100024BE8, 0x44u, 0, 0, outputStruct, &outputStructCnt);
  if (v0)
    fprintf(__stderrp, "%s: Get nonce command error: %x\n", (const char *)qword_100024C20, v0);
  return v0 == 0;
}

uint64_t sub_100008FC8()
{
  kern_return_t v0;
  uint32_t outputCnt;
  BOOL v3;
  size_t outputStructCnt;
  uint64_t output;
  _QWORD outputStruct[3];

  memset(outputStruct, 170, 20);
  outputStructCnt = 20;
  v3 = 0;
  if (!sub_10000BE70(&v3))
  {
    if (v3)
    {
      output = 0;
      outputCnt = 1;
      v0 = IOConnectCallMethod(dword_100024BE8, 0x53u, 0, 0, 0, 0, &output, &outputCnt, outputStruct, &outputStructCnt);
      if (v0)
      {
LABEL_5:
        fprintf(__stderrp, "%s: New nonce command error: %x\n", (const char *)qword_100024C20, v0);
        return 0;
      }
    }
    else
    {
      v0 = IOConnectCallStructMethod(dword_100024BE8, 0xFu, 0, 0, outputStruct, &outputStructCnt);
      if (v0)
        goto LABEL_5;
    }
    return 1;
  }
  fwrite("Failed to query nonce slot support\n", 0x23uLL, 1uLL, __stderrp);
  return 0;
}

uint64_t sub_1000090F8(unsigned int a1)
{
  uint64_t input[2];

  input[0] = a1 >> 8;
  input[1] = a1;
  return IOConnectCallScalarMethod(dword_100024BE8, 0x11u, input, 2u, 0, 0);
}

BOOL sub_100009168(unint64_t a1, unint64_t a2)
{
  kern_return_t v3;
  _BOOL8 v4;
  int inputStruct;
  uint64_t input;

  LODWORD(input) = string_to_handle(a1);
  if (!(_DWORD)input)
  {
    fprintf(__stderrp, "%s: Invalid object name\n");
    return 0;
  }
  if (HIDWORD(a2))
  {
    fprintf(__stderrp, "%s: Object size missing/out of range/invalid\n");
    return 0;
  }
  inputStruct = a2;
  v3 = IOConnectCallMethod(dword_100024BE8, 0x1Fu, &input, 1u, &inputStruct, 4uLL, 0, 0, 0, 0);
  v4 = v3 == 0;
  if (v3)
    fprintf(__stderrp, "%s: ERROR: %d\n", (const char *)qword_100024C20, v3);
  else
    printf("Created '%c%c%c%c' of size %u\n", ((int)input >> 24), ((int)((_DWORD)input << 8) >> 24), ((__int16)input >> 8), (char)input, inputStruct);
  return v4;
}

uint64_t sub_100009288(unint64_t a1, int a2)
{
  uint64_t input;

  HIDWORD(input) = a2;
  LODWORD(input) = string_to_handle(a1);
  if ((_DWORD)input && a2)
  {
    if (!IOConnectCallMethod(dword_100024BE8, 0x20u, &input, 1u, (char *)&input + 4, 4uLL, 0, 0, 0, 0))
    {
      printf("Shared '%c%c%c%c' with '%c%c%c%c'\n", ((int)input >> 24), ((int)((_DWORD)input << 8) >> 24), ((__int16)input >> 8), (char)input, (SHIDWORD(input) >> 24), ((int)(HIDWORD(input) << 8) >> 24), (SWORD2(input) >> 8), SBYTE4(input));
      return 1;
    }
    fprintf(__stderrp, "%s: ERROR: %d\n");
  }
  else
  {
    fprintf(__stderrp, "%s: Invalid object/service name\n");
  }
  return 0;
}

uint64_t sub_100009388(unint64_t a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  size_t v5;
  size_t outputStructCnt;
  uint32_t outputCnt;
  uint64_t output[2];
  size_t __nbyte;
  _BYTE __b[1024];

  v1 = string_to_handle(a1);
  v2 = fileno(__stdoutp);
  v3 = 0;
  v4 = v1;
  while (1)
  {
    memset(__b, 170, sizeof(__b));
    output[0] = v4;
    output[1] = v3;
    __nbyte = 1024;
    outputCnt = 3;
    outputStructCnt = 1024;
    if (IOConnectCallMethod(dword_100024BE8, 0x21u, output, 3u, 0, 0, output, &outputCnt, __b, &outputStructCnt))
    {
      fprintf(__stderrp, "%s: ERROR: %d\n");
      return 0;
    }
    v5 = __nbyte;
    if (__nbyte >= 0x401)
      break;
    if (!__nbyte)
      return 1;
    write(v2, __b, __nbyte);
    if (v5 < 0x400)
      return 1;
    v3 += v5;
  }
  fprintf(__stderrp, "%s: kSEP_ObjRead: returned bad data size %lu");
  return 0;
}

uint64_t sub_100009504(unint64_t a1)
{
  int v1;
  int v2;
  ssize_t v3;
  ssize_t v4;
  unsigned int v5;
  uint32_t outputCnt;
  uint64_t output[2];
  ssize_t v9;
  _BYTE __b[1024];

  v1 = string_to_handle(a1);
  v2 = fileno(__stdinp);
  memset(__b, 170, sizeof(__b));
  v3 = read(v2, __b, 0x400uLL);
  if (v3 < 1)
  {
    v5 = 0;
LABEL_8:
    if (!ferror(__stdinp))
    {
LABEL_10:
      printf("Copied %u bytes to %c%c%c%C\n", v5, (v1 >> 24), (v1 << 8 >> 24), ((__int16)v1 >> 8), (char)v1);
      return 1;
    }
    fprintf(__stderrp, "%s: error reading data\n");
  }
  else
  {
    v4 = v3;
    v5 = 0;
    while (1)
    {
      output[0] = v1;
      output[1] = v5;
      v9 = v4;
      outputCnt = 3;
      if (IOConnectCallMethod(dword_100024BE8, 0x22u, output, 3u, __b, v4, output, &outputCnt, 0, 0))
        break;
      if (v9 != v4)
        goto LABEL_10;
      v5 += v4;
      memset(__b, 170, sizeof(__b));
      v4 = read(v2, __b, 0x400uLL);
      if (v4 < 1)
        goto LABEL_8;
    }
    fprintf(__stderrp, "%s: ERROR: %d\n");
  }
  return 0;
}

uint64_t sub_1000096D4(unint64_t a1, int a2, int a3)
{
  unsigned int v5;
  int v6;
  void *v7;
  void *outputStruct;
  mach_port_t v9;
  void *v10;
  size_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t input;
  size_t __nbyte;
  size_t v17;
  void *v18;

  v17 = 0xAAAAAAAAAAAAAAAALL;
  v18 = 0;
  __nbyte = 0xAAAAAAAAAAAAAAAALL;
  v5 = string_to_handle(a1);
  input = v5;
  if (!v5)
  {
    fprintf(__stderrp, "%s: Invalid pair method\n", (const char *)qword_100024C20);
    v12 = 0;
    outputStruct = 0;
    goto LABEL_30;
  }
  v6 = v5;
  __nbyte = 0x4000;
  v7 = malloc_type_malloc(0x4000uLL, 0x316E7523uLL);
  outputStruct = v7;
  if (!v7)
  {
    fprintf(__stderrp, "%s: Failed to allocate memory for out_buffer\n");
    goto LABEL_29;
  }
  bzero(v7, 0x4000uLL);
  if (v6 <= 1396788559)
  {
    if (v6 != 1280921176 && v6 != 1347636041)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v6 == 1396788560 || v6 == 1397311310)
  {
LABEL_15:
    if (a3 <= 0)
      goto LABEL_19;
    goto LABEL_16;
  }
  if (v6 == 1398031179)
  {
    if (a2 < 0)
    {
      fprintf(__stderrp, "%s: No/Illegal infile provided\n");
      goto LABEL_29;
    }
    if ((sub_10000BC74(&v18, (off_t *)&v17, 0x4000uLL, a2) & 1) != 0)
    {
      if (a3 > 0)
      {
        v9 = dword_100024BE8;
        v11 = v17;
        v10 = v18;
        goto LABEL_23;
      }
LABEL_19:
      fprintf(__stderrp, "%s: No/Illegal outfile provided\n");
      goto LABEL_29;
    }
LABEL_20:
    fprintf(__stderrp, "%s: can't read in infile\n");
    goto LABEL_29;
  }
LABEL_16:
  if (a2 < 0)
  {
    v11 = 0;
    v10 = 0;
    v17 = 0;
  }
  else
  {
    if (!sub_10000BC74(&v18, (off_t *)&v17, 0x4000uLL, a2))
      goto LABEL_20;
    v11 = v17;
    v10 = v18;
  }
  v9 = dword_100024BE8;
LABEL_23:
  if (!IOConnectCallMethod(v9, 0x15u, &input, 1u, v10, v11, 0, 0, outputStruct, &__nbyte))
  {
    if (a3 < 1 || (v13 = __nbyte, v13 == write(a3, outputStruct, __nbyte)))
    {
      v12 = 1;
      goto LABEL_30;
    }
    fprintf(__stderrp, "%s: can't write out_buffer (to outfile)\n");
  }
LABEL_29:
  v12 = 0;
LABEL_30:
  if (v18)
    free(v18);
  if (outputStruct)
    free(outputStruct);
  return v12;
}

BOOL sub_100009978(void *inputStruct)
{
  kern_return_t v1;

  if (!dword_100024BE8)
    sub_1000165E8();
  v1 = IOConnectCallMethod(dword_100024BE8, 0x28u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
  if (v1)
    fprintf(__stderrp, "%s: xART OS UUID setup failed: %d\n", (const char *)qword_100024C20, v1);
  return v1 == 0;
}

uint64_t sub_100009A00(unsigned int a1)
{
  uint64_t input;

  input = a1;
  return IOConnectCallMethod(dword_100024BE8, 0x5Bu, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_100009A78(char *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  size_t outputStructCnt;

  v2 = 3758097098;
  if (sub_10000B8F0())
  {
    v3 = malloc_type_malloc(qword_100025460, 0x758AB202uLL);
    if (v3)
    {
      v4 = v3;
      outputStructCnt = qword_100025460;
      v2 = IOConnectCallStructMethod(dword_100024BE8, 0x32u, 0, 0, v3, &outputStructCnt);
      if (!(_DWORD)v2)
      {
        if (sub_10000B518(v4, qword_100025460, a1))
          v2 = 3758097098;
        else
          v2 = 0;
      }
      free(v4);
    }
    else
    {
      return 3758097085;
    }
  }
  return v2;
}

uint64_t sub_100009B3C(char *a1, int a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  size_t v7;
  int v9;

  v4 = 3758097098;
  if (sub_10000B8F0())
  {
    v5 = malloc_type_malloc(qword_100025460, 0x9E7E6213uLL);
    if (v5)
    {
      v6 = v5;
      v9 = -1431655766;
      if (!sub_10000ADEC(v5, qword_100025460, a1, &v9))
      {
        v7 = qword_100025460;
        if (qword_100025460 != v9)
        {
          v4 = 3758097090;
          goto LABEL_12;
        }
        if (a2)
        {
          if ((unint64_t)qword_100025460 <= 0x1000)
          {
            fprintf(__stderrp, "%s: HILO_BYTE_TO_CORRUPT is not within LTH backup\n", (const char *)qword_100024C20);
            v4 = 3758097097;
            goto LABEL_12;
          }
          ++v6[4096];
        }
        v4 = IOConnectCallStructMethod(dword_100024BE8, 0x33u, v6, v7, 0, 0);
      }
LABEL_12:
      free(v6);
      return v4;
    }
    return 3758097085;
  }
  return v4;
}

uint64_t sub_100009C50(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  size_t outputStructCnt;

  if (!sub_10000B8F0())
    return 5;
  v2 = malloc_type_malloc(qword_100025488, 0xF5F9A6ABuLL);
  if (v2)
  {
    v3 = v2;
    outputStructCnt = qword_100025488;
    v4 = IOConnectCallStructMethod(dword_100024BE8, 0x34u, 0, 0, v2, &outputStructCnt);
    if ((_DWORD)v4)
    {
      v5 = v4;
      *a1 = v3;
LABEL_10:
      free(v3);
      return v5;
    }
    if (qword_100025488 != outputStructCnt)
    {
      fprintf(__stderrp, "%s: unexpected return call size\n", (const char *)qword_100024C20);
      v5 = 5;
      goto LABEL_10;
    }
    v5 = 0;
    *a1 = v3;
  }
  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for LTH\n", (const char *)qword_100024C20);
    return 12;
  }
  return v5;
}

uint64_t sub_100009D5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((sub_10000B8F0() & 1) != 0)
  {
    v2 = 0;
    v7 = a1;
    v8 = a1 + 4 * dword_100025478[0];
    v9 = v8 + 4 * dword_10002547C;
    while (1)
    {
      v3 = dword_100025478[v2];
      if ((_DWORD)v3)
        break;
LABEL_7:
      if (++v2 == 3)
        return 1;
    }
    v4 = 0;
    v5 = v2;
    while (dword_100018F38[3 * v4 + 3 * ((_DWORD)v2 - 5 * (v5 / 5))] == *(_DWORD *)(*(&v7 + v2) + 4 * v4))
    {
      ++v4;
      ++v5;
      if (v3 == v4)
        goto LABEL_7;
    }
    fprintf(__stderrp, "%s: Channel %d sample %u had bad LTH value (expected %u, got %u)\n");
  }
  else
  {
    fprintf(__stderrp, "%s: No display params when expected!\n");
  }
  return 0;
}

uint64_t sub_100009EA0(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v6[2];

  if (!sub_10000B8F0())
    return 3758097098;
  *(_QWORD *)v6 = 0xAAAAAAAAAAAAAAAALL;
  v2 = sub_100009C50(v6);
  if ((_DWORD)v2)
  {
    v3 = v2;
    fprintf(__stderrp, "%s: Couldn't get raw LTH, return value: 0x%x\n");
  }
  else
  {
    v4 = *(void **)v6;
    v3 = sub_10000B518(*(const void **)v6, qword_100025488, a1);
    free(v4);
    if ((_DWORD)v3)
      fprintf(__stderrp, "%s: LTH write to %s failed");
  }
  return v3;
}

uint64_t sub_100009F6C(char *a1, int a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  char *v15;
  char *v16;
  char *v17;

  if (!sub_10000B8F0())
    return 5;
  v4 = (char *)malloc_type_malloc(qword_100025488, 0x3BC1A09uLL);
  if (v4)
  {
    v5 = v4;
    v14 = -1431655766;
    if (a2)
    {
      if (!sub_10000B8F0())
      {
        v11 = 3758097098;
        fprintf(__stderrp, "%s: Couldn't populate gain test LTH: %d\n");
        goto LABEL_17;
      }
      v6 = 0;
      v15 = v5;
      v16 = &v5[4 * dword_100025478[0]];
      v17 = &v16[4 * dword_10002547C];
      do
      {
        if (dword_100025478[v6])
        {
          v7 = 0;
          v8 = (&v15)[v6];
          v9 = v6;
          do
          {
            *(_DWORD *)&v8[4 * v7] = dword_100018F38[3 * v7 + 3 * ((_DWORD)v6 - 5 * (v9 / 5))];
            ++v7;
            ++v9;
          }
          while (v7 < dword_100025478[v6]);
        }
        ++v6;
      }
      while (v6 != 3);
      v10 = sub_10000B518(v5, qword_100025488, a1);
      if ((_DWORD)v10)
      {
        v11 = v10;
        fprintf(__stderrp, "%s: Couldn't write gain test LTH to %s\n");
LABEL_17:
        free(v5);
        return v11;
      }
    }
    v12 = sub_10000ADEC(v5, qword_100025488, a1, &v14);
    if ((_DWORD)v12)
    {
      v11 = v12;
      fprintf(__stderrp, "%s: Couldn't read LTH from %s\n");
    }
    else if (qword_100025488 == v14)
    {
      v11 = IOConnectCallStructMethod(dword_100024BE8, 0x36u, v5, qword_100025488, 0, 0);
      if ((_DWORD)v11)
        fprintf(__stderrp, "%s: Couldn't load raw LTH, return value: 0x%x\n", (const char *)qword_100024C20, v11);
    }
    else
    {
      fprintf(__stderrp, "%s: Read LTH size is %u, expected %lu\n", (const char *)qword_100024C20, v14, qword_100025488);
      v11 = 22;
    }
    goto LABEL_17;
  }
  fprintf(__stderrp, "%s: Couldn't allocate memory for LTH\n", (const char *)qword_100024C20);
  return 12;
}

uint64_t sub_10000A200(char *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  size_t outputStructCnt;

  v2 = malloc_type_malloc(0x300000uLL, 0x6267D075uLL);
  if (!v2)
    return 3758097085;
  v3 = v2;
  outputStructCnt = 3145728;
  v4 = IOConnectCallStructMethod(dword_100024BE8, 0x37u, 0, 0, v2, &outputStructCnt);
  if (!(_DWORD)v4)
  {
    if (sub_10000B518(v3, 0x300000uLL, a1))
      v4 = 3758097098;
    else
      v4 = 0;
  }
  free(v3);
  return v4;
}

uint64_t sub_10000A2B0(char *a1, int a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  int v8;

  v4 = 3758097085;
  v5 = malloc_type_malloc(0x300000uLL, 0x267D3644uLL);
  if (v5)
  {
    v6 = v5;
    v8 = -1431655766;
    if (sub_10000ADEC(v5, 0x300000uLL, a1, &v8))
    {
      v4 = 3758097098;
    }
    else if (v8 == 3145728)
    {
      if (a2)
        ++v6[4096];
      v4 = IOConnectCallStructMethod(dword_100024BE8, 0x38u, v6, 0x300000uLL, 0, 0);
    }
    else
    {
      v4 = 3758097090;
    }
    free(v6);
  }
  return v4;
}

uint64_t sub_10000A37C(char *a1)
{
  void *v2;
  void *v3;
  char *v5;
  __int128 v6;
  __int128 v7;
  unsigned int __big_len;
  _OWORD __big_len_4[4];
  _OWORD __little[2];

  __little[0] = xmmword_100018FB0;
  *(_OWORD *)((char *)__little + 9) = *(__int128 *)((char *)&xmmword_100018FB0 + 9);
  v2 = malloc_type_malloc(0x8000uLL, 0x4932D153uLL);
  if (v2)
  {
    v3 = v2;
    __big_len = -1431655766;
    if (sub_10000ADEC(v2, 0x8000uLL, a1, &__big_len))
    {
      fprintf(__stderrp, "%s: readFile of %s failed (%d)");
    }
    else
    {
      v5 = (char *)memmem(v3, __big_len, __little, 0x19uLL);
      if (v5)
      {
        if (v5 + 25 - (_BYTE *)v3 < (unint64_t)(__big_len - 64))
        {
          v6 = *(_OWORD *)(v5 + 41);
          __big_len_4[0] = *(_OWORD *)(v5 + 25);
          __big_len_4[1] = v6;
          v7 = *(_OWORD *)(v5 + 73);
          __big_len_4[2] = *(_OWORD *)(v5 + 57);
          __big_len_4[3] = v7;
          free(v3);
          return IOConnectCallStructMethod(dword_100024BE8, 0x3Bu, __big_len_4, 0x40uLL, 0, 0);
        }
        fprintf(__stderrp, "%s: found sik_pub_key_prefix at bad spot in %s");
      }
      else
      {
        fprintf(__stderrp, "%s: couldn't find sik_pub_key_prefix in %s");
      }
    }
    free(v3);
  }
  else
  {
    fprintf(__stderrp, "%s: could not allocate buffer for scrt", (const char *)qword_100024C20);
  }
  fprintf(__stderrp, "%s: hilo_get_sik_pub_key failed", (const char *)qword_100024C20);
  return 3758097098;
}

uint64_t sub_10000A52C(int a1, int a2)
{
  size_t v3;
  char *v4;
  char *v5;
  uint64_t lth_transfer_attestation;
  uint64_t v7;
  size_t v9;
  void *v10;

  v9 = 0xAAAAAAAAAAAAAAAALL;
  v10 = 0;
  if ((sub_10000BC74(&v10, (off_t *)&v9, 0x8000uLL, a2) & 1) != 0)
  {
    v3 = v9 + 176;
    v4 = (char *)malloc_type_malloc(v9 + 176, 0x70F40104uLL);
    v5 = v4;
    if (v4)
    {
      lth_transfer_attestation = hilo_get_lth_transfer_attestation(v4, v10, v9);
      if ((_DWORD)lth_transfer_attestation)
      {
        v7 = lth_transfer_attestation;
        fprintf(__stderrp, "%s: hilo_get_lth_transfer_attestation failed: 0x%x\n");
      }
      else if (v3 == write(a1, v5, v3))
      {
        v7 = 0;
      }
      else
      {
        v7 = 3758097084;
        fprintf(__stderrp, "%s: can't write attestation (to outfile)\n");
      }
    }
    else
    {
      v7 = 3758097084;
      fprintf(__stderrp, "%s: malloc for attestation (%lu) failed\n");
    }
  }
  else
  {
    v7 = 3758097084;
    fprintf(__stderrp, "%s: can't read in scrt\n", (const char *)qword_100024C20);
    v5 = 0;
  }
  if (v10)
    free(v10);
  if (v5)
    free(v5);
  return v7;
}

uint64_t sub_10000A698(int a1, int a2, int a3, int a4)
{
  size_t v7;
  char *v8;
  char *v9;
  uint64_t lth_transfer_message_with_manifest;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  size_t v15;
  size_t v16;
  void *v17;
  void *v18;

  v18 = 0;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0;
  v14 = 0;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v13 = 0;
  if ((sub_10000BC74(&v18, (off_t *)&v16, 0x8000uLL, a2) & 1) != 0)
  {
    if ((sub_10000BC74(&v17, (off_t *)&v15, 0x80B0uLL, a3) & 1) == 0)
      fprintf(__stderrp, "%s: can't read in attestation\n", (const char *)qword_100024C20);
    if ((a4 & 0x80000000) == 0 && (sub_10000BC74(&v14, (off_t *)&v13, 0x4000uLL, a4) & 1) == 0)
      fprintf(__stderrp, "%s: can't read in LTH transfer manifest\n", (const char *)qword_100024C20);
    v7 = v16 + 3145856;
    v8 = (char *)malloc_type_malloc(v16 + 3145856, 0x417C10F7uLL);
    v9 = v8;
    if (v8)
    {
      lth_transfer_message_with_manifest = hilo_get_lth_transfer_message_with_manifest(v8, v18, v16, v17, v15, (uint64_t)v14, v13);
      if ((_DWORD)lth_transfer_message_with_manifest)
      {
        v11 = lth_transfer_message_with_manifest;
        fprintf(__stderrp, "%s: hilo_get_lth_transfer_message_with_manifest failed: 0x%x\n");
      }
      else if (v7 == write(a1, v9, v7))
      {
        v11 = 0;
      }
      else
      {
        v11 = 3758097084;
        fprintf(__stderrp, "%s: couldn't write out LTH transfer message\n");
      }
    }
    else
    {
      v11 = 3758097084;
      fprintf(__stderrp, "%s: malloc for message (%lu) failed\n");
    }
  }
  else
  {
    v11 = 3758097084;
    fprintf(__stderrp, "%s: can't read in scrt\n", (const char *)qword_100024C20);
    v9 = 0;
  }
  if (v18)
    free(v18);
  if (v17)
    free(v17);
  if (v9)
    free(v9);
  if (v14)
    free(v14);
  return v11;
}

uint64_t sub_10000A8BC(int a1)
{
  uint64_t lth_transfer_message;
  size_t v3;
  void *v4;

  v3 = 0xAAAAAAAAAAAAAAAALL;
  v4 = 0;
  if ((sub_10000BC74(&v4, (off_t *)&v3, 0x308080uLL, a1) & 1) != 0)
  {
    lth_transfer_message = hilo_load_lth_transfer_message(v4, v3);
  }
  else
  {
    fprintf(__stderrp, "%s: can't read in message\n", (const char *)qword_100024C20);
    lth_transfer_message = 3758097084;
  }
  if (v4)
    free(v4);
  return lth_transfer_message;
}

uint64_t sub_10000A94C(int a1, int a2, int a3)
{
  void *v5;
  size_t v6;
  uint64_t v7;
  size_t __nbyte;
  void *__buf;

  __nbyte = 0xAAAAAAAAAAAAAAAALL;
  __buf = 0;
  if ((sub_10000BC74(&__buf, (off_t *)&__nbyte, 0x80B0uLL, a2) & 1) != 0)
  {
    v5 = __buf;
    if (a3 == 2)
    {
      ++*((_BYTE *)__buf + 112);
    }
    else if (a3 == 1)
    {
      ++*((_BYTE *)__buf + 48);
    }
    else
    {
      if (a3)
      {
        fprintf(__stderrp, "%s: unknown corruption type %d\n");
        goto LABEL_13;
      }
      ++*(_BYTE *)__buf;
      v5 = __buf;
    }
    v6 = __nbyte;
    if (v6 == write(a1, v5, __nbyte))
    {
      v7 = 1;
      goto LABEL_14;
    }
    fprintf(__stderrp, "%s: couldn't write out attestation\n");
  }
  else
  {
    fprintf(__stderrp, "%s: can't read in attestation\n");
  }
LABEL_13:
  v7 = 0;
LABEL_14:
  if (__buf)
    free(__buf);
  return v7;
}

BOOL sub_10000AA7C(unsigned int a1)
{
  uint64_t input;

  input = a1;
  return IOConnectCallScalarMethod(dword_100024BE8, 0x40u, &input, 1u, 0, 0) == 0;
}

BOOL sub_10000AAC4()
{
  kern_return_t v0;

  if (!dword_100024BE8)
    sub_1000165E8();
  v0 = IOConnectCallScalarMethod(dword_100024BE8, 0x42u, 0, 0, 0, 0);
  if (v0)
    fprintf(__stderrp, "%s: purge system token failed: 0x%x", (const char *)qword_100024C20, v0);
  return v0 == 0;
}

BOOL sub_10000AB40(unint64_t a1)
{
  uint64_t input;

  if (!dword_100024BE8)
    sub_1000165E8();
  input = string_to_handle(a1);
  return IOConnectCallScalarMethod(dword_100024BE8, 0x46u, &input, 1u, 0, 0) == 0;
}

uint64_t sub_10000ABA0(unsigned int a1, unsigned int a2)
{
  uint64_t input[2];

  input[0] = a1;
  input[1] = a2;
  if (!dword_100024BE8)
    sub_1000165E8();
  return IOConnectCallScalarMethod(dword_100024BE8, 0x52u, input, 2u, 0, 0);
}

BOOL sub_10000AC18(unsigned int a1, int a2, unsigned int a3)
{
  kern_return_t v3;
  kern_return_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  if (a2)
  {
    input[0] = a1;
    input[1] = a3;
    v3 = IOConnectCallScalarMethod(dword_100024BE8, 0x5Cu, input, 2u, 0, 0);
  }
  else
  {
    output = 0;
    input[0] = a1;
    outputCnt = 1;
    v5 = IOConnectCallScalarMethod(dword_100024BE8, 0x5Du, input, 1u, &output, &outputCnt);
    if (outputCnt != 1)
      sub_1000165E8();
    v3 = v5;
    if (!v5)
      printf("Slot %u provisional: %d, used: %d\n", a1, output & 1, (output >> 1) & 1);
  }
  return v3 == 0;
}

BOOL sub_10000AD0C(int a1)
{
  uint64_t input;

  input = a1;
  return IOConnectCallScalarMethod(dword_100024BE8, 5u, &input, 1u, 0, 0) == 0;
}

void sub_10000AD54()
{
  if (dword_100025450)
  {
    IOObjectRelease(dword_100025450);
    dword_100025450 = 0;
  }
  _exit(-1);
}

void sub_10000AD7C(int a1, io_iterator_t iterator)
{
  io_service_t v2;
  io_object_t v3;

  v2 = IOIteratorNext(iterator);
  if (v2)
  {
    v3 = v2;
    if (!IOServiceOpen(v2, mach_task_self_, 0, (io_connect_t *)&dword_100024BE8))
    {
      byte_100025439 = 1;
      IOObjectRelease(v3);
      CFRunLoopStop((CFRunLoopRef)qword_100025440);
    }
  }
}

uint64_t sub_10000ADEC(void *a1, unint64_t a2, char *a3, _DWORD *a4)
{
  timespec v8;
  int v9;
  int v10;
  uint64_t result;
  FILE *v12;
  const char *v13;
  int *v14;
  char *v15;
  int *v16;
  ssize_t v17;
  int v18;
  stat v19;

  if (!a1 || !a3 || !a4)
  {
    fprintf(__stderrp, "%s: invalid argument\n", a3);
    return 22;
  }
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v19.st_blksize = v8;
  *(timespec *)v19.st_qspare = v8;
  v19.st_birthtimespec = v8;
  *(timespec *)&v19.st_size = v8;
  v19.st_mtimespec = v8;
  v19.st_ctimespec = v8;
  *(timespec *)&v19.st_uid = v8;
  v19.st_atimespec = v8;
  *(timespec *)&v19.st_dev = v8;
  v9 = open(a3, 0);
  if (v9 < 0)
  {
    v12 = __stderrp;
    v13 = (const char *)qword_100024C20;
    v14 = __error();
    v15 = strerror(*v14);
    v16 = __error();
    fprintf(v12, "%s: can't open '%s', errno: %s(%d)\n", v13, a3, v15, *v16);
    return 5;
  }
  v10 = v9;
  if (fstat(v9, &v19) < 0)
  {
    fprintf(__stderrp, "%s: can't stat '%s'\n");
    return *__error();
  }
  if (v19.st_size < 0)
  {
    fprintf(__stderrp, "%s: unexpected file size (size %lld)", v19.st_size);
    return 22;
  }
  if (v19.st_size > a2)
  {
    fprintf(__stderrp, "%s: '%s' is too large for buffer", (const char *)qword_100024C20, a3);
    return 12;
  }
  v17 = read(v10, a1, v19.st_size);
  if (v17 == v19.st_size)
  {
    v18 = v17;
    result = 0;
    *a4 = v18;
    return result;
  }
  fprintf(__stderrp, "%s: can't read '%s'\n");
  return *__error();
}

BOOL sub_10000AFC0(uint64_t a1, uint64_t a2, const void *a3, size_t a4, uint32_t a5, unsigned int a6)
{
  __int128 v6;
  size_t v11;
  void *v12;
  int v13;
  size_t v14;
  _DWORD *v15;
  _DWORD *v16;
  _DWORD *v17;
  int v18;
  kern_return_t v19;
  _BOOL8 v20;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char v32;
  _OWORD v33[28];
  unint64_t v34;
  __int128 input;
  __int128 v36;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  input = v6;
  v36 = v6;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  v33[26] = v6;
  v33[27] = v6;
  v33[24] = v6;
  v33[25] = v6;
  v33[22] = v6;
  v33[23] = v6;
  v33[20] = v6;
  v33[21] = v6;
  v33[18] = v6;
  v33[19] = v6;
  v33[16] = v6;
  v33[17] = v6;
  v33[14] = v6;
  v33[15] = v6;
  v33[12] = v6;
  v33[13] = v6;
  v33[10] = v6;
  v33[11] = v6;
  v33[8] = v6;
  v33[9] = v6;
  v33[6] = v6;
  v33[7] = v6;
  v33[4] = v6;
  v33[5] = v6;
  v33[2] = v6;
  v33[3] = v6;
  v33[0] = v6;
  v33[1] = v6;
  v32 = -86;
  if (!a1)
    sub_1000165E8();
  v11 = a2;
  v12 = (void *)a1;
  Img4DecodeInit(a1, a2, (uint64_t)v33);
  if (v13)
  {
    v22 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v22, 2844);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100017350();
    return 0;
  }
  if (!sub_100002688((uint64_t)v33, (BOOL *)&v32))
  {
    v23 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v23, 2846);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000172C8();
    return 0;
  }
  if (v32 != (a3 != 0))
  {
    v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v24, 2847);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100017240();
    return 0;
  }
  if (a3)
  {
    if (v11 >= 0x2000001)
    {
      v25 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v25, 2861);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100016E88();
    }
    else
    {
      *(_QWORD *)&input = v11 + 24;
      if (a4 > 0x40000)
      {
        v26 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v26, 2863);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100016F10();
      }
      else
      {
        *((_QWORD *)&input + 1) = a4 + 24;
        *(_QWORD *)&v36 = 1916;
        v14 = v11 + a4 + 24 + 1940;
        v15 = malloc_type_malloc(v14, 0xC416EB9DuLL);
        if (v15)
        {
          v16 = v15;
          if (sub_100002A80((uint64_t)v12, v11, v33, v15))
          {
            memcpy(v16 + 6, v12, v11);
            v17 = (_DWORD *)((char *)v16 + v11 + 24);
            if (sub_100002814((uint64_t)v33, (_DWORD *)((char *)v17 + a4 + 24)))
            {
              Img4DecodeInit((uint64_t)a3, a4, (uint64_t)v33);
              if (v18)
              {
                v30 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v30, 2883);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  sub_1000170A8();
              }
              else
              {
                if (sub_100002A80((uint64_t)a3, a4, v33, v17))
                {
                  memcpy(v17 + 6, a3, a4);
                  v11 = v14;
                  v12 = v16;
                  goto LABEL_15;
                }
                v31 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v31, 2886);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  sub_100017020();
              }
            }
            else
            {
              v29 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
              printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v29, 2881);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                sub_100017130();
            }
          }
          else
          {
            v28 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v28, 2874);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_1000171B8();
          }
          v20 = 0;
          v12 = v16;
LABEL_18:
          free(v12);
          return v20;
        }
        v27 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v27, 2870);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100016F98();
      }
    }
    return 0;
  }
  input = v11;
  *(_QWORD *)&v36 = 0;
LABEL_15:
  *((_QWORD *)&v36 + 1) = a6;
  v19 = IOConnectCallMethod(dword_100024BE8, a5, (const uint64_t *)&input, 4u, v12, v11, 0, 0, 0, 0);
  v20 = v19 == 0;
  if (v19)
    fprintf(__stderrp, "%s: load fw returned 0x%x\n", (const char *)qword_100024C20, v19);
  if (a3)
    goto LABEL_18;
  return v20;
}

uint64_t sub_10000B518(const void *a1, size_t a2, char *a3)
{
  int v5;
  int v6;
  ssize_t v7;

  if (a1 && a3)
  {
    v5 = open(a3, 1538, 288);
    if (v5 < 0)
    {
      fprintf(__stderrp, "%s: can't open '%s' for writing\n");
    }
    else
    {
      v6 = v5;
      v7 = write(v5, a1, a2);
      if ((v7 & 0x8000000000000000) == 0 && v7 == a2)
      {
        close(v6);
        return 0;
      }
      fprintf(__stderrp, "%s: can't write '%s'\n");
    }
    return *__error();
  }
  else
  {
    fprintf(__stderrp, "%s: invalid argument\n", (const char *)qword_100024C20);
    return 22;
  }
}

uint64_t sub_10000B614()
{
  uint64_t result;

  if (!dword_100024BE8)
    sub_1000165E8();
  result = IOConnectCallMethod(dword_100024BE8, 0xBu, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)result)
    return fprintf(__stderrp, "%s: L4 panic notification returned 0x%x\n", (const char *)qword_100024C20, result);
  return result;
}

uint64_t sub_10000B68C()
{
  uint64_t result;

  if (!dword_100024BE8)
    sub_1000165E8();
  result = IOConnectCallMethod(dword_100024BE8, 0xCu, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)result)
    return fprintf(__stderrp, "%s: SEP/OS panic notification returned 0x%x\n", (const char *)qword_100024C20, result);
  return result;
}

uint64_t sub_10000B704()
{
  uint64_t result;

  if (!dword_100024BE8)
    sub_1000165E8();
  result = IOConnectCallMethod(dword_100024BE8, 0x45u, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)result)
    return fprintf(__stderrp, "%s: SEP/OS panic request returned 0x%x\n", (const char *)qword_100024C20, result);
  return result;
}

uint64_t sub_10000B77C(const char *a1)
{
  io_registry_entry_t v2;
  io_registry_entry_t v3;
  const __CFString *v4;
  const __CFData *v5;
  const __CFData *v6;
  CFTypeID v7;
  _BOOL8 v8;

  v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (!v2)
  {
    fprintf(__stderrp, "%s: Warning: can't find /chosen\n", (const char *)qword_100024C20);
    return 1;
  }
  v3 = v2;
  v4 = CFStringCreateWithCString(0, a1, 0x8000100u);
  v5 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IODeviceTree", v4, kCFAllocatorDefault, 0);
  if (!v5)
  {
    v8 = 1;
    goto LABEL_12;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 != CFDataGetTypeID())
  {
    fprintf(__stderrp, "%s: Warning: Incorrect %s property value type\n");
LABEL_10:
    v8 = 1;
    goto LABEL_11;
  }
  if (CFDataGetLength(v6) != 4)
  {
    fprintf(__stderrp, "%s: Warning: Incorrect value size for %s property\n");
    goto LABEL_10;
  }
  v8 = *(_DWORD *)CFDataGetBytePtr(v6) != 0;
LABEL_11:
  CFRelease(v6);
LABEL_12:
  IOObjectRelease(v3);
  if (v4)
    CFRelease(v4);
  return v8;
}

uint64_t sub_10000B8F0()
{
  _BOOL8 v0;
  kern_return_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  size_t outputStructCnt;

  if ((byte_100025468 & 1) != 0)
    return 1;
  outputStructCnt = 10;
  v1 = IOConnectCallStructMethod(dword_100024BE8, 0x39u, 0, 0, &dword_10002546C, &outputStructCnt);
  v0 = v1 == 0;
  if (v1)
  {
    fprintf(__stderrp, "%s: HiloGetParams failed: %d\n", (const char *)qword_100024C20, v1);
  }
  else
  {
    v2 = 0;
    v3 = 0;
    v4 = (dword_10002546C + 1) >> 1;
    if (!byte_100025474)
      v4 = dword_10002546C;
    dword_10002547C = unk_100025470 * dword_10002546C;
    unk_100025480 = v4 * unk_100025470;
    dword_100025478[0] = v4 * unk_100025470;
    do
      v3 += dword_100025478[v2++];
    while (v2 != 3);
    qword_100025488 = 4 * v3;
    qword_100025460 = 4 * v3 + 32;
    byte_100025468 = 1;
  }
  return v0;
}

void sub_10000BA08()
{
  xpc_activity_register("com.apple.SepUpdateTimer", XPC_ACTIVITY_CHECK_IN, &stru_100020630);
  dispatch_main();
}

void sub_10000BA34(id a1, _xpc_activity_s *a2)
{
  kern_return_t v2;
  _BYTE v3[256];

  if (xpc_activity_get_state(a2))
  {
    v2 = IOConnectCallScalarMethod(dword_100024BE8, 0x35u, 0, 0, 0, 0);
    if (v2)
      sub_1000173D8(v3, v2);
    xpc_transaction_exit_clean();
  }
}

uint64_t sub_10000BAE4()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  size_t v3;
  unsigned __int8 *v5;
  size_t outputStructCnt;

  if (!dword_100024BE8)
    sub_1000165E8();
  outputStructCnt = 2277;
  v0 = (unsigned __int8 *)malloc_type_malloc(0x8E5uLL, 0xDCA3F742uLL);
  if (v0)
  {
    v1 = v0;
    if (IOConnectCallStructMethod(dword_100024BE8, 0x47u, 0, 0, v0, &outputStructCnt))
    {
      fprintf(__stderrp, "%s: get endpoint info returned 0x%x\n");
    }
    else
    {
      v3 = outputStructCnt / 9;
      if (outputStructCnt == 9 * (outputStructCnt / 9))
      {
        if (outputStructCnt >= 9)
        {
          v5 = v1 + 4;
          do
          {
            printf("Endpoint %d name '%c%c%c%c' ool_in_pages [%u,%u] ool_out_pages [%u,%u]\n", *v5, (char)*(v5 - 1), (char)*(v5 - 2), (char)*(v5 - 3), (char)*(v5 - 4), v5[1], v5[2], v5[3], v5[4]);
            v5 += 9;
            --v3;
          }
          while (v3);
        }
        v2 = 1;
        goto LABEL_9;
      }
      fprintf(__stderrp, "%s: unexpected result size %lu\n");
    }
    v2 = 0;
LABEL_9:
    free(v1);
    return v2;
  }
  return 0;
}

uint64_t sub_10000BC60()
{
  return _os_assert_log(0);
}

uint64_t sub_10000BC74(_QWORD *a1, off_t *a2, unint64_t a3, int a4)
{
  uint64_t result;
  timespec v9;
  off_t st_size;
  void *v11;
  void *v12;
  stat v13;

  result = 0;
  if (a1 && a2)
  {
    v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v13.st_blksize = v9;
    *(timespec *)v13.st_qspare = v9;
    v13.st_birthtimespec = v9;
    *(timespec *)&v13.st_size = v9;
    v13.st_mtimespec = v9;
    v13.st_ctimespec = v9;
    *(timespec *)&v13.st_uid = v9;
    v13.st_atimespec = v9;
    *(timespec *)&v13.st_dev = v9;
    if (fstat(a4, &v13) < 0)
    {
      fwrite("fstat failed\n", 0xDuLL, 1uLL, __stderrp);
    }
    else
    {
      st_size = v13.st_size;
      if (v13.st_size <= a3)
      {
        v11 = malloc_type_malloc(v13.st_size, 0x60B840B0uLL);
        if (v11)
        {
          v12 = v11;
          if (st_size == read(a4, v11, st_size))
          {
            *a1 = v12;
            *a2 = st_size;
            return 1;
          }
          fwrite("can't read file\n", 0x10uLL, 1uLL, __stderrp);
          free(v12);
        }
        else
        {
          fprintf(__stderrp, "malloc (%lu) failed\n");
        }
      }
      else
      {
        fprintf(__stderrp, "file too large in fd_to_buf (was %llu, max %lu)\n");
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_10000BDC0(BOOL *a1)
{
  io_registry_entry_t v2;
  io_registry_entry_t v3;
  uint64_t result;
  char *v5;

  if (a1)
  {
    v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/xART");
    v3 = v2;
    if (v2)
      IOObjectRelease(v2);
    result = 0;
    *a1 = v3 != 0;
  }
  else
  {
    v5 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v5, 126);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100017420();
    return 22;
  }
  return result;
}

uint64_t sub_10000BE70(BOOL *a1)
{
  io_registry_entry_t v2;
  io_registry_entry_t v3;
  uint64_t result;
  char *v5;

  if (a1)
  {
    v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/Sandcat");
    v3 = v2;
    if (v2)
      IOObjectRelease(v2);
    result = 0;
    *a1 = v3 != 0;
  }
  else
  {
    v5 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v5, 154);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000174A8();
    return 22;
  }
  return result;
}

void sub_10000BF20()
{
  byte_100025490 = 1;
}

const char *sub_10000BF30()
{
  if (byte_100025490)
    return "/mnt7";
  else
    return "/private/xarts";
}

uint64_t sub_10000BF54(const char *a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  int v5;
  __int128 v6;
  uint64_t v7;
  vm_size_t f_frsize;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  _QWORD v25[2];
  unint64_t v26;
  uint64_t v27;
  statvfs v28;

  v25[0] = 0x300000004;
  v25[1] = 0;
  v26 = a2;
  v27 = 0;
  if (a1)
  {
    v2 = a2;
    v4 = open(a1, 2562, 384);
    if ((v4 & 0x80000000) == 0)
    {
      v5 = v4;
      *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v28.f_ffree = v6;
      *(_OWORD *)&v28.f_flag = v6;
      *(_OWORD *)&v28.f_bsize = v6;
      *(_OWORD *)&v28.f_blocks = v6;
      v7 = statvfs(a1, &v28);
      if ((_DWORD)v7)
      {
        v12 = v7;
        v16 = (int)v7;
        v17 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_100019B71, v17, 259);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_1000178A0();
        v18 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_100019B71, v18, 290);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100017808();
      }
      else
      {
        f_frsize = vm_page_size;
        if (v28.f_frsize > vm_page_size)
          f_frsize = v28.f_frsize;
        if (v2 % f_frsize)
        {
          v2 += f_frsize - v2 % f_frsize;
          v26 = v2;
        }
        v9 = fcntl(v5, 42, v25);
        if ((_DWORD)v9)
        {
          v12 = v9;
          v19 = (int)v9;
          v20 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v19, (const char *)&unk_100019B71, v20, 297);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100017770();
        }
        else
        {
          v10 = ftruncate(v5, v2);
          if (!(_DWORD)v10)
          {
            v11 = close(v5);
            if (!v11)
              return 0;
            v23 = v11;
            v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v23, (const char *)&unk_100019B71, v24, 304);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_100017640();
            return *__error();
          }
          v12 = v10;
          v21 = (int)v10;
          v22 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v21, (const char *)&unk_100019B71, v22, 300);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_1000176D8();
        }
      }
      close(v5);
      return v12;
    }
    v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v15, 286);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000175B8();
    return *__error();
  }
  v14 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v14, 283);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100017530();
  return 22;
}

uint64_t sub_10000C284(char *a1, size_t a2, uint64_t a3, int a4)
{
  __int128 v7;
  int v8;
  FILE *v9;
  int *v10;
  char *v11;
  char *v12;
  timespec v14;
  uuid_string_t out;
  uuid_t uu;

  if (!a1)
    sub_100016108();
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v7;
  *(_OWORD *)&out[16] = v7;
  memset(uu, 0, sizeof(uu));
  v14.tv_sec = 0;
  v14.tv_nsec = 0;
  if (gethostuuid(uu, &v14) < 0)
  {
    v9 = __stderrp;
    v10 = __error();
    v11 = strerror(*v10);
    fprintf(v9, "ERR: could not get the machine's unique identifier, reason: %s\n", v11);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000179C0();
    v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019B71, v12, 323);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100017938();
    return 14;
  }
  else
  {
    uuid_unparse_upper(uu, out);
    if (a4)
      v8 = snprintf(a1, a2, "%s/%s.gl");
    else
      v8 = snprintf(a1, a2, "%s.gl");
    if (v8 < 0)
    {
      return *__error();
    }
    else if (v8 >= (int)a2)
    {
      return 28;
    }
    else
    {
      return 0;
    }
  }
}

uint64_t sub_10000C438(char *a1)
{
  uint64_t result;
  pid_t v2;
  int v3;
  char *__argv[4];

  __argv[0] = "/bin/bash";
  __argv[1] = "-c";
  __argv[2] = a1;
  __argv[3] = 0;
  v2 = -1431655766;
  v3 = -1;
  result = posix_spawnp(&v2, "/bin/bash", 0, 0, __argv, 0);
  if (!(_DWORD)result)
  {
    while (waitpid(v2, &v3, 0) == -1)
      ;
    return v3;
  }
  return result;
}

uint64_t sub_10000C4D8@<X0>(_QWORD *a1@<X8>)
{
  CFArrayRef v2;
  const __CFDictionary *v3;
  const __CFDictionary *Value;
  const __CFData *v5;
  __int128 v6;
  const unsigned __int8 *BytePtr;
  __int128 v8;
  _QWORD *v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  const std::locale::facet *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  char *v28;
  int v29;
  char *v30;
  void *v32[2];
  char v33;
  void *__p[2];
  _OWORD v35[4];
  void *v36[2];
  __int128 v37;
  __int128 v38;
  _OWORD v39[9];
  unint64_t v40;
  __int128 v41;
  _OWORD v42[4];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[9];
  unint64_t v47;
  uuid_string_t out;
  void *values;

  values = CFSTR("com.apple.driver.AppleSEPManager");
  v2 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  v3 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(v2, 0);
  Value = (const __CFDictionary *)CFDictionaryGetValue(v3, CFSTR("com.apple.driver.AppleSEPManager"));
  CFRelease(v2);
  v5 = (const __CFData *)CFDictionaryGetValue(Value, CFSTR("OSBundleUUID"));
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v6;
  *(_OWORD *)&out[16] = v6;
  BytePtr = CFDataGetBytePtr(v5);
  uuid_unparse(BytePtr, out);
  CFRelease(v3);
  v47 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46[7] = v8;
  v46[8] = v8;
  v46[5] = v8;
  v46[6] = v8;
  v46[3] = v8;
  v46[4] = v8;
  v46[1] = v8;
  v46[2] = v8;
  v45 = v8;
  v46[0] = v8;
  v43 = v8;
  v44 = v8;
  v42[2] = v8;
  v42[3] = v8;
  v42[0] = v8;
  v42[1] = v8;
  v41 = v8;
  sub_10000C958((uint64_t)&v41);
  v9 = sub_10000DC74(v42, (uint64_t)"/usr/local/bin/kpgo", 19);
  v10 = sub_10000DC74(v9, (uint64_t)" ", 1);
  v11 = strlen(out);
  v12 = sub_10000DC74(v10, (uint64_t)out, v11);
  v13 = sub_10000DC74(v12, (uint64_t)" > ", 3);
  sub_10000DC74(v13, (uint64_t)"/tmp/sep_manager_coverage.raw", 29);
  std::stringbuf::str(__p, (char *)v42 + 8);
  if ((SBYTE7(v35[0]) & 0x80u) == 0)
    v14 = (char *)__p;
  else
    v14 = (char *)__p[0];
  v15 = sub_10000C438(v14);
  if (SBYTE7(v35[0]) < 0)
    operator delete(__p[0]);
  if ((_DWORD)v15)
  {
    v16 = sub_10000DC74(&std::cout, (uint64_t)"kpgo failed.  Was code coverage enabled at build time? Return code was ", 71);
    v17 = (_QWORD *)std::ostream::operator<<(v16, v15);
    std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
    v18 = std::locale::use_facet((const std::locale *)__p, &std::ctype<char>::id);
    v19 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put(v17, v19);
    std::ostream::flush(v17);
    sub_10000DFD0(a1, (char *)&unk_100019B71);
  }
  else
  {
    v40 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v39[7] = v23;
    v39[8] = v23;
    v39[5] = v23;
    v39[6] = v23;
    v39[3] = v23;
    v39[4] = v23;
    v39[1] = v23;
    v39[2] = v23;
    v38 = v23;
    v39[0] = v23;
    *(_OWORD *)v36 = v23;
    v37 = v23;
    v35[2] = v23;
    v35[3] = v23;
    v35[0] = v23;
    v35[1] = v23;
    *(_OWORD *)__p = v23;
    sub_10000C958((uint64_t)__p);
    v24 = sub_10000DC74(v35, (uint64_t)"/usr/bin/llvm-profdata", 22);
    v25 = sub_10000DC74(v24, (uint64_t)" merge -o ", 10);
    v26 = sub_10000DC74(v25, (uint64_t)"/tmp/sep_manager_coverage.profdata", 34);
    v27 = sub_10000DC74(v26, (uint64_t)" ", 1);
    sub_10000DC74(v27, (uint64_t)"/tmp/sep_manager_coverage.raw", 29);
    std::stringbuf::str(v32, (char *)v35 + 8);
    if (v33 >= 0)
      v28 = (char *)v32;
    else
      v28 = (char *)v32[0];
    v29 = sub_10000C438(v28);
    if (v33 < 0)
      operator delete(v32[0]);
    if (v29)
      v30 = (char *)&unk_100019B71;
    else
      v30 = "/tmp/sep_manager_coverage.profdata";
    sub_10000DFD0(a1, v30);
    *(void **)((char *)__p
    *(_QWORD *)&v35[0] = v22;
    if (SHIBYTE(v37) < 0)
      operator delete(v36[1]);
    std::streambuf::~streambuf((char *)v35 + 8);
    std::ios::~ios(v39);
  }
  *(_QWORD *)&v41 = v20;
  *(_QWORD *)((char *)&v42[-1] + *(_QWORD *)(v20 - 24)) = v21;
  *(_QWORD *)&v42[0] = v22;
  if (SHIBYTE(v44) < 0)
    operator delete(*((void **)&v43 + 1));
  std::streambuf::~streambuf((char *)v42 + 8);
  return std::ios::~ios(v46);
}

void sub_10000C8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::locale a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  sub_10000CA84((uint64_t)&a16);
  sub_10000CA84((uint64_t)&a55);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C958(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1 + 16;
  v3 = a1 + 24;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  *(_QWORD *)(a1 + 8) = 0;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 24));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(v2 + *(_QWORD *)(v7 - 24)) = v8;
  *(_QWORD *)a1 = v9;
  std::streambuf::basic_streambuf(v3);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_10000CA5C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::iostream::~basic_iostream(v2, v3 + 8);
  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CA84(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1 + 24;
  *(_QWORD *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

std::string *sub_10000CB0C@<X0>(std::string *__str@<X0>, std::string *a2@<X8>)
{
  std::string::size_type size;
  std::string *v5;
  char *v6;
  int v7;
  std::string::size_type v8;
  char v10;

  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    v5 = (std::string *)__str->__r_.__value_.__r.__words[0];
    size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
    v5 = __str;
  }
  v6 = (char *)&v5[-1].__r_.__value_.__r.__words[2] + 7;
  while (size)
  {
    v7 = v6[size--];
    if (v7 == 47)
    {
      v8 = size + 1;
      return std::string::basic_string(a2, __str, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
    }
  }
  v8 = 0;
  return std::string::basic_string(a2, __str, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
}

void sub_10000CB74(uint64_t a1, const char *a2)
{
  _QWORD *v4;
  _BYTE *v5;
  _QWORD *v6;
  const std::locale::facet *v7;
  unsigned __int8 v8;
  _QWORD *v9;
  int64_t size;
  std::string *v11;
  char *v12;
  std::string *v13;
  char *v14;
  __int128 v17;
  _QWORD *v18;
  std::string *p_p;
  std::string::size_type v20;
  _QWORD *v21;
  _QWORD *v22;
  const std::locale::facet *v23;
  uint64_t v24;
  double v25;
  _QWORD *v26;
  std::string *v27;
  std::string::size_type v28;
  _QWORD *v29;
  _QWORD *v30;
  const std::locale::facet *v31;
  uint64_t v32;
  std::string *v33;
  _QWORD *v34;
  size_t v35;
  _QWORD *v36;
  const std::locale::facet *v37;
  uint64_t v38;
  _QWORD *v39;
  size_t v40;
  _QWORD *v41;
  _QWORD *v42;
  const std::locale::facet *v43;
  uint64_t v44;
  uint64_t v45;
  std::locale::__imp *v46;
  std::locale::__imp *v47;
  char v48;
  uint64_t v49;
  int v50;
  double v51;
  std::string __str;
  std::string v53;
  std::string __p;
  std::locale v55[2];
  _OWORD v56[4];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _OWORD v60[9];
  unint64_t v61;
  std::string v62;
  void (__cdecl **__b[72])(std::ifstream *__hidden);

  memset(&v62, 0, sizeof(v62));
  memset(__b, 170, sizeof(__b));
  sub_10000D3C4(__b, (uint64_t *)a1, 8);
  v4 = embeddedtest_results_create(1);
  v5 = embeddedtest_test_case_result_create(1, "AppleSEPManager Code Coverage");
  v6 = v5;
  if (__b[17])
  {
    v49 = (uint64_t)v5;
    v48 = 0;
LABEL_3:
    while (1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)__b + (unint64_t)*(__b[0] - 3)));
      v7 = std::locale::use_facet(v55, &std::ctype<char>::id);
      v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
      std::locale::~locale(v55);
      v9 = sub_10000E080(__b, (uint64_t)&v62, v8);
      if ((*((_BYTE *)v9 + *(_QWORD *)(*v9 - 24) + 32) & 5) != 0)
        break;
      size = HIBYTE(v62.__r_.__value_.__r.__words[2]);
      if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v11 = &v62;
      }
      else
      {
        size = v62.__r_.__value_.__l.__size_;
        v11 = (std::string *)v62.__r_.__value_.__r.__words[0];
      }
      if (size >= 23)
      {
        v12 = (char *)v11 + size;
        v13 = v11;
        while (1)
        {
          v14 = (char *)memchr(v13, 83, size - 22);
          if (!v14)
            break;
          if (*(_QWORD *)v14 == 0x2F73656372756F53
            && *((_QWORD *)v14 + 1) == 0x504553656C707041
            && *(_QWORD *)(v14 + 15) == 0x726567616E614D50)
          {
            if (v14 != v12 && v14 - (char *)v11 != -1)
            {
              v61 = 0xAAAAAAAAAAAAAAAALL;
              *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v60[7] = v17;
              v60[8] = v17;
              v60[5] = v17;
              v60[6] = v17;
              v60[3] = v17;
              v60[4] = v17;
              v60[1] = v17;
              v60[2] = v17;
              v59 = v17;
              v60[0] = v17;
              v57 = v17;
              v58 = v17;
              v56[2] = v17;
              v56[3] = v17;
              v56[0] = v17;
              v56[1] = v17;
              *(_OWORD *)&v55[0].__locale_ = v17;
              sub_10000D4DC((void (__cdecl ***)(std::basic_stringstream<char> *__hidden))v55, &v62, 24);
              memset(&__p, 0, sizeof(__p));
              sub_10000D5FC((uint64_t *)v55, (uint64_t)&__p);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                sub_10000DB60(&__str, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              else
                __str = __p;
              sub_10000CB0C(&__str, &v53);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              __p = v53;
              *((_BYTE *)&v53.__r_.__value_.__s + 23) = 0;
              v53.__r_.__value_.__s.__data_[0] = 0;
              if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__str.__r_.__value_.__l.__data_);
              v51 = 0.0;
              std::istream::operator>>(v55, &v51);
              v50 = 0;
              std::istream::operator>>(v55, &v50);
              if (v51 == 0.0)
              {
                v18 = sub_10000DC74(&std::cout, (uint64_t)"Skipping ", 9);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  p_p = &__p;
                else
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                else
                  v20 = __p.__r_.__value_.__l.__size_;
                v21 = sub_10000DC74(v18, (uint64_t)p_p, v20);
                v22 = sub_10000DC74(v21, (uint64_t)" becuase it doesnt have any regions to cover", 44);
                std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
                v23 = std::locale::use_facet((const std::locale *)&v53, &std::ctype<char>::id);
                v24 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
                std::locale::~locale((std::locale *)&v53);
                std::ostream::put(v22, v24);
                std::ostream::flush(v22);
              }
              else
              {
                v25 = 100.0 - (double)(100 * v50) / v51;
                if (v25 == 0.0)
                {
                  v26 = sub_10000DC74(&std::cout, (uint64_t)"Skipping ", 9);
                  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v27 = &__p;
                  else
                    v27 = (std::string *)__p.__r_.__value_.__r.__words[0];
                  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v28 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                  else
                    v28 = __p.__r_.__value_.__l.__size_;
                  v29 = sub_10000DC74(v26, (uint64_t)v27, v28);
                  v30 = sub_10000DC74(v29, (uint64_t)" because coverage was 0%", 24);
                  std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(_QWORD *)(*v30 - 24)));
                  v31 = std::locale::use_facet((const std::locale *)&v53, &std::ctype<char>::id);
                  v32 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10);
                  std::locale::~locale((std::locale *)&v53);
                  std::ostream::put(v30, v32);
                  std::ostream::flush(v30);
                }
                else
                {
                  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v33 = &__p;
                  else
                    v33 = (std::string *)__p.__r_.__value_.__r.__words[0];
                  embeddedtest_test_case_result_add_metric(v49, (const char *)v33, v25);
                  v48 = 1;
                }
              }
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              v55[0].__locale_ = v47;
              *(std::locale::__imp **)((char *)&v55[0].__locale_ + *((_QWORD *)v47 - 3)) = v46;
              *(_QWORD *)&v56[0] = v45;
              if (SHIBYTE(v58) < 0)
                operator delete(*((void **)&v57 + 1));
              std::streambuf::~streambuf((char *)v56 + 8);
              std::ios::~ios(v60);
            }
            goto LABEL_3;
          }
          v13 = (std::string *)(v14 + 1);
          size = v12 - (char *)v13;
          if (v12 - (char *)v13 < 23)
            goto LABEL_3;
        }
      }
    }
    v6 = (_QWORD *)v49;
    if (!std::filebuf::close(&__b[2]))
      std::ios_base::clear((std::ios_base *)((char *)__b + (unint64_t)*(__b[0] - 3)), *(_DWORD *)((char *)&__b[4] + (unint64_t)*(__b[0] - 3)) | 4);
    if ((v48 & 1) != 0)
      embeddedtest_test_case_result_pass(v49);
    else
      embeddedtest_test_case_result_fail(v49, "Did not see a valid file");
  }
  else
  {
    if (*(char *)(a1 + 23) < 0)
      a1 = *(_QWORD *)a1;
    embeddedtest_test_case_result_fail((uint64_t)v5, "Unable to open %s", (const char *)a1);
  }
  if (embeddedtest_test_case_result_did_pass((uint64_t)v6))
  {
    v34 = sub_10000DC74(&std::cout, (uint64_t)"Report parsing was successful.  Results will be written to ", 59);
    v35 = strlen(a2);
    v36 = sub_10000DC74(v34, (uint64_t)a2, v35);
  }
  else
  {
    v39 = sub_10000DC74(&std::cout, (uint64_t)"Report parsing failed. Check ", 29);
    v40 = strlen(a2);
    v41 = sub_10000DC74(v39, (uint64_t)a2, v40);
    v36 = sub_10000DC74(v41, (uint64_t)" for more detail", 16);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)v36 + *(_QWORD *)(*v36 - 24)));
  v37 = std::locale::use_facet(v55, &std::ctype<char>::id);
  v38 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
  std::locale::~locale(v55);
  std::ostream::put(v36, v38);
  std::ostream::flush(v36);
  embeddedtest_results_add_test_case((uint64_t)v4, (uint64_t)v6);
  embeddedtest_test_case_result_free(v6);
  if (embeddedtest_results_save_to_file((uint64_t)v4, a2))
  {
    v42 = sub_10000DC74(&std::cout, (uint64_t)"Failed to write out the JSON file", 33);
    std::ios_base::getloc((const std::ios_base *)((char *)v42 + *(_QWORD *)(*v42 - 24)));
    v43 = std::locale::use_facet(v55, &std::ctype<char>::id);
    v44 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v43->__vftable[2].~facet_0)(v43, 10);
    std::locale::~locale(v55);
    std::ostream::put(v42, v44);
    std::ostream::flush(v42);
  }
  embeddedtest_results_free(v4);
  std::filebuf::~filebuf(&__b[2]);
  std::ios::~ios(&__b[53]);
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v62.__r_.__value_.__l.__data_);
}

void sub_10000D314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,std::locale a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,std::locale a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a72;
  uint64_t a73;
  uint64_t v73;

  if (a34 < 0)
    operator delete(__p);
  sub_10000CA84((uint64_t)&a36);
  sub_10000D830(&a73);
  if (a72 < 0)
    operator delete(*(void **)(v73 + 288));
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_10000D3C4(void (__cdecl ***a1)(std::ifstream *__hidden this), uint64_t *a2, int a3))(std::ifstream *__hidden this)
{
  _QWORD *v6;
  void (__cdecl **v7)(std::ifstream *__hidden);
  void (__cdecl **v8)(std::ifstream *__hidden);
  std::ios_base *v9;
  uint64_t *v10;

  v6 = a1 + 2;
  *a1 = v7;
  *(_QWORD *)((char *)*(v7 - 3) + (_QWORD)a1) = v8;
  a1[1] = 0;
  v9 = (std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1);
  std::ios_base::init(v9, a1 + 2);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  if (*((char *)a2 + 23) >= 0)
    v10 = a2;
  else
    v10 = (uint64_t *)*a2;
  if (!std::filebuf::open(v6, v10, a3 | 8u))
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1), *(_DWORD *)((char *)*(*a1 - 3) + (_QWORD)a1 + 32) | 4);
  return a1;
}

void sub_10000D4A4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::istream::~istream(v1, v2 + 8);
  std::ios::~ios(v1 + 424);
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_10000D4DC(void (__cdecl ***a1)(std::basic_stringstream<char> *__hidden this), const std::string *a2, int a3))(std::basic_stringstream<char> *__hidden this)
{
  _QWORD *v5;
  uint64_t v6;
  void (__cdecl **v7)(std::basic_stringstream<char> *__hidden);
  void (__cdecl **v8)(std::basic_stringstream<char> *__hidden);
  std::ios_base *v9;
  void (__cdecl **v10)(std::basic_stringstream<char> *__hidden);
  uint64_t v11;
  void (__cdecl **v12)(std::basic_stringstream<char> *__hidden);

  v5 = a1 + 2;
  v6 = (uint64_t)(a1 + 3);
  *a1 = v7;
  *(_QWORD *)((char *)*(v7 - 3) + (_QWORD)a1) = v8;
  a1[1] = 0;
  v9 = (std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1);
  std::ios_base::init(v9, a1 + 3);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  a1[2] = v10;
  *(_QWORD *)((char *)*(v10 - 3) + (_QWORD)v5) = v11;
  *a1 = v12;
  sub_10000E20C(v6, a2, a3);
  return a1;
}

void sub_10000D5D4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::iostream::~basic_iostream(v2, v3 + 8);
  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_10000D5FC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const std::locale::facet *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  std::locale v19;
  char v20;

  v20 = -86;
  std::istream::sentry::sentry(&v20, a1, 0);
  if (!v20)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v4 = *(_QWORD *)(*a1 - 24);
  v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  v7 = std::locale::use_facet(&v19, &std::ctype<char>::id);
  std::locale::~locale(&v19);
  v8 = 0;
  v9 = a1 + 5;
  if (v5 >= 1)
    v10 = v6;
  else
    v10 = 0x7FFFFFFFFFFFFFF7;
  while (1)
  {
    v11 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v12 = (_BYTE *)v11[3];
    if (v12 == (_BYTE *)v11[4])
      break;
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    v14 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v15 = v14[3];
    if (v15 == v14[4])
      (*(void (**)(_QWORD *))(*v14 + 80))(v14);
    else
      v14[3] = v15 + 1;
    if (v10 == ++v8)
    {
      v16 = 0;
      v17 = *a1;
      *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
      goto LABEL_25;
    }
  }
  v13 = (*(uint64_t (**)(_QWORD *))(*v11 + 72))(v11);
  if (v13 != -1)
    goto LABEL_14;
  v16 = 2;
LABEL_23:
  v17 = *a1;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
  if (!v8)
    v16 |= 4u;
LABEL_25:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_10000D7B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  _QWORD *v9;
  uint64_t v11;

  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  v11 = *v9;
  *(_DWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v9 + *(_QWORD *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000D784);
  }
  __cxa_rethrow();
}

void sub_10000D81C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *sub_10000D830(_QWORD *a1)
{
  uint64_t v2;

  std::filebuf::~filebuf(a1 + 2);
  std::ios::~ios(a1 + 53);
  return a1;
}

void sub_10000D888(const char *a1)
{
  __int128 v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  void **v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char *locale;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  const std::locale::facet *v16;
  uint64_t v17;
  uint64_t v18;
  void *__p[2];
  char v20;
  std::locale v21;
  char v22;
  __int128 v23;
  _OWORD v24[4];
  void *v25[2];
  __int128 v26;
  __int128 v27;
  _OWORD v28[9];
  unint64_t v29;
  void *v30[3];

  memset(v30, 170, sizeof(v30));
  sub_10000C4D8(v30);
  v29 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[7] = v2;
  v28[8] = v2;
  v28[5] = v2;
  v28[6] = v2;
  v28[3] = v2;
  v28[4] = v2;
  v28[1] = v2;
  v28[2] = v2;
  v27 = v2;
  v28[0] = v2;
  *(_OWORD *)v25 = v2;
  v26 = v2;
  v24[2] = v2;
  v24[3] = v2;
  v24[0] = v2;
  v24[1] = v2;
  v23 = v2;
  sub_10000C958((uint64_t)&v23);
  v3 = sub_10000DC74(v24, (uint64_t)"/usr/bin/llvm-cov", 17);
  v4 = sub_10000DC74(v3, (uint64_t)" report ", 8);
  v5 = sub_10000DC74(v4, (uint64_t)"/System/Library/Extensions/AppleSEPManager.kext/AppleSEPManager", 63);
  v6 = sub_10000DC74(v5, (uint64_t)" -instr-profile=", 16);
  if (SHIBYTE(v30[2]) >= 0)
    v7 = v30;
  else
    v7 = (void **)v30[0];
  if (SHIBYTE(v30[2]) >= 0)
    v8 = HIBYTE(v30[2]);
  else
    v8 = (uint64_t)v30[1];
  v9 = sub_10000DC74(v6, (uint64_t)v7, v8);
  v10 = sub_10000DC74(v9, (uint64_t)" -arch arm64 > ", 15);
  sub_10000DC74(v10, (uint64_t)"/tmp/sep_manager_report.txt", 27);
  std::stringbuf::str(&v21, (char *)v24 + 8);
  if (v22 >= 0)
    locale = (char *)&v21;
  else
    locale = (char *)v21.__locale_;
  v12 = sub_10000C438(locale);
  v13 = v12;
  if (v22 < 0)
  {
    operator delete(v21.__locale_);
    if ((_DWORD)v13)
      goto LABEL_12;
  }
  else if ((_DWORD)v12)
  {
LABEL_12:
    v14 = sub_10000DC74(&std::cout, (uint64_t)"llvm-cov report failed. Return code was ", 40);
    v15 = (_QWORD *)std::ostream::operator<<(v14, v13);
    std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(_QWORD *)(*v15 - 24)));
    v16 = std::locale::use_facet(&v21, &std::ctype<char>::id);
    v17 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
    std::locale::~locale(&v21);
    std::ostream::put(v15, v17);
    std::ostream::flush(v15);
    goto LABEL_16;
  }
  sub_10000DFD0(__p, "/tmp/sep_manager_report.txt");
  sub_10000CB74((uint64_t)__p, a1);
  if (v20 < 0)
    operator delete(__p[0]);
LABEL_16:
  *(_QWORD *)((char *)&v24[-1]
  *(_QWORD *)&v24[0] = v18;
  if (SHIBYTE(v26) < 0)
    operator delete(v25[1]);
  std::streambuf::~streambuf((char *)v24 + 8);
  std::ios::~ios(v28);
  if (SHIBYTE(v30[2]) < 0)
    operator delete(v30[0]);
}

void sub_10000DAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  uint64_t v21;

  if (a14 < 0)
    operator delete(__p);
  sub_10000CA84((uint64_t)&a21);
  if (*(char *)(v21 - 33) < 0)
    operator delete(*(void **)(v21 - 56));
  _Unwind_Resume(a1);
}

void sub_10000DB50(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void *sub_10000DB60(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_10000DBEC();
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

void sub_10000DBEC()
{
  sub_10000DC00("basic_string");
}

void sub_10000DC00(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000DC50(exception, a1);
}

void sub_10000DC3C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000DC50(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

_QWORD *sub_10000DC74(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  std::ostream::sentry::sentry(v13, a1);
  if (LOBYTE(v13[0]))
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_10000DDE0(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_10000DD84(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x10000DD64);
}

void sub_10000DDCC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_10000DDE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[3];

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      sub_10000DF28(__p, v12, __c);
      v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_10000DF0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000DF28(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_10000DBEC();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

_QWORD *sub_10000DFD0(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000DBEC();
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

_QWORD *sub_10000E080(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  v11 = -86;
  std::istream::sentry::sentry(&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_10000E1B4(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000E180);
  }
  __cxa_rethrow();
}

void sub_10000E1F8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_10000E20C(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6;

  v6 = std::streambuf::basic_streambuf(a1);
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_10000E29C(a1);
  return a1;
}

void sub_10000E278(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf(v1);
  _Unwind_Resume(a1);
}

void sub_10000E29C(uint64_t a1)
{
  std::string *v2;
  char v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  v2 = (std::string *)(a1 + 64);
  v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    v4 = *(std::string **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v4 = v2;
    v5 = *(unsigned __int8 *)(a1 + 87);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    v7 = v3 < 0 ? (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    v8 = *(char *)(a1 + 87) < 0 ? *(_QWORD *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        v5 = v5 - v10 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 48) = v4;
      }
      if (v5)
        *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
    }
  }
}

unint64_t string_to_handle(unint64_t result)
{
  _BYTE *v1;
  int v2;
  int v3;
  char v4;

  if (result)
  {
    v1 = (_BYTE *)result;
    LODWORD(result) = 0;
    v2 = 4;
    do
    {
      v3 = *v1;
      if (*v1)
        ++v1;
      if (v3)
        v4 = v3;
      else
        v4 = 32;
      result = (((_DWORD)result << 8) + v4);
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sepTesting(int a1, FILE *a2, unsigned int a3, unsigned int a4, FILE *a5, unsigned int a6, unsigned int a7, _BYTE *a8)
{
  uint64_t v14;
  uint64_t test_cases;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *name;
  _BOOL8 v21;
  void *outputStruct;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  size_t v28;
  void *v29;
  kern_return_t v30;
  __int16 v31;
  uint32_t v32;
  char __s2[5];
  char v34[5];
  uint32_t outputCnt[2];
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t input[2];
  uint64_t output;

  switch(a1)
  {
    case 1:
      if ((unint64_t)a2 | (unint64_t)a5)
      {
        fwrite("Test data can only be passed in or out of a single test\n", 0x38uLL, 1uLL, __stderrp);
        return 0;
      }
      input[0] = 0;
      outputCnt[0] = 1;
      outputStruct = malloc_type_malloc(0x100000uLL, 0x55D405E9uLL);
      output = 0x100000;
      if (IOConnectCallMethod(dword_100024BE8, 0x1Bu, 0, 0, 0, 0, input, outputCnt, outputStruct, &output))
      {
        if (outputStruct)
          free(outputStruct);
        printf("IOKit returned %x for kSEP_RunAll\n");
        return 0;
      }
      if (!output)
        return 0;
      sub_10000F340((uint64_t)outputStruct, input[0], 0);
      if (outputStruct)
      {
        v24 = outputStruct;
        goto LABEL_41;
      }
      return 1;
    case 3:
      if (!a6)
      {
        if (!a8)
          sub_100016108();
        sub_10000EAB0(0);
        LOBYTE(outputCnt[0]) = HIBYTE(a7);
        BYTE1(outputCnt[0]) = BYTE2(a7);
        BYTE2(outputCnt[0]) = BYTE1(a7);
        HIBYTE(outputCnt[0]) = a7;
        LOBYTE(outputCnt[1]) = 0;
        if (sub_10000F218((const char *)outputCnt))
        {
          v23 = malloc_type_malloc(0x100000uLL, 0xF4F6A415uLL);
          input[0] = 0x100000;
          output = a7;
          if (IOConnectCallMethod(dword_100024BE8, 0x1Cu, &output, 1u, 0, 0, 0, 0, v23, input))
          {
            if (v23)
              free(v23);
            printf("IOKit returned %x for kSEP_RunCat\n");
            return 0;
          }
          if (input[0])
          {
            v21 = 1;
            sub_10000F340((uint64_t)v23, 1, a8);
            if (v23)
            {
              v24 = v23;
LABEL_41:
              free(v24);
              return 1;
            }
            return v21;
          }
        }
        else
        {
          printf("%s does not appear to be a supported test category\n", (const char *)outputCnt);
          sub_10000F290();
          printf("Categories Found: %s\n");
        }
        return 0;
      }
      if (!a8)
        sub_100016108();
      sub_10000EAB0(1);
      v34[0] = HIBYTE(a7);
      v34[1] = BYTE2(a7);
      v34[2] = BYTE1(a7);
      v34[3] = a7;
      v34[4] = 0;
      __s2[0] = HIBYTE(a6);
      __s2[1] = BYTE2(a6);
      __s2[2] = BYTE1(a6);
      __s2[3] = a6;
      __s2[4] = 0;
      v14 = sub_10000F218(v34);
      if (!v14)
      {
        sub_10000F290();
        printf("%s does not appear to be a supported test category\nCategories Found: %s\n");
        return 0;
      }
      LODWORD(input[0]) = 0;
      test_cases = embeddedtest_test_suite_get_test_cases(v14, input);
      if (!LODWORD(input[0]))
        goto LABEL_35;
      v16 = test_cases;
      v17 = 0;
      while (1)
      {
        v18 = *(_QWORD *)(v16 + 8 * v17);
        name = (const char *)embeddedtest_test_case_get_name(v18);
        if (!strcmp(name, __s2))
          break;
        if (++v17 >= (unint64_t)LODWORD(input[0]))
          goto LABEL_35;
      }
      if (!v18)
      {
LABEL_35:
        printf("%s/%s does not appear to be a supported test category\n");
        return 0;
      }
      if ((embeddedtest_test_case_get_flags(v18) & 2) != 0)
      {
        input[0] = a3;
        fseeko(a2, 0, 2);
        v25 = ftello(a2);
        fseeko(a2, 0, 0);
        if (v25 <= 0x100000)
        {
          output = 0xAAAAAAAAAAAAAAAALL;
          v26 = malloc_type_malloc(v25, 0x5828E931uLL);
          if (fread(v26, 1uLL, v25, a2) == v25)
          {
            outputCnt[0] = 1;
            IOConnectCallMethod(dword_100024BE8, 0x16u, input, 1u, v26, v25, &output, outputCnt, 0, 0);
          }
          else
          {
            fwrite("Failed to read input data file\n", 0x1FuLL, 1uLL, __stderrp);
          }
          if (v26)
            free(v26);
        }
        else
        {
          fwrite("Test data input too big\n", 0x18uLL, 1uLL, __stderrp);
        }
      }
      input[0] = a7;
      input[1] = a6;
      v38 = 0;
      v32 = 1;
      if (IOConnectCallMethod(dword_100024BE8, 0x1Du, input, 2u, 0, 0, &v38, &v32, 0, 0))
      {
        printf("IOKit returned %x for kSEP_RunHandle\n");
        return 0;
      }
      if ((embeddedtest_test_case_get_flags(v18) & 4) != 0)
      {
        output = 0xAAAAAAAAAAAAAAAALL;
        v27 = malloc_type_malloc(0x100000uLL, 0xCFE4D483uLL);
        *(_QWORD *)outputCnt = 0x100000;
        v36 = 1;
        if (!IOConnectCallMethod(dword_100024BE8, 0x17u, &v37, 0, 0, 0, &output, &v36, v27, (size_t *)outputCnt))
        {
          v28 = fwrite(v27, 1uLL, *(size_t *)outputCnt, a5);
          if (v28 != *(_QWORD *)outputCnt)
            fwrite("Failed to write output data file\n", 0x21uLL, 1uLL, __stderrp);
        }
        if (v27)
          free(v27);
      }
      v29 = malloc_type_malloc(0x100000uLL, 0x146BF633uLL);
      output = 0x100000;
      v30 = IOConnectCallMethod(dword_100024BE8, 0x1Eu, 0, 0, 0, 0, 0, 0, v29, &output);
      v21 = v30 == 0;
      if (v30)
      {
        v31 = v30;
        if (v29)
          free(v29);
        printf("IOKit returned %x for kSEP_GetResult\n", v31 & 0x3FFF);
      }
      else
      {
        sub_10000F340((uint64_t)v29, 1, a8);
        if (v29)
          free(v29);
      }
      return v21;
    case 4:
      return sub_10000EAB0(1);
    case 5:
      if (!a4)
        return 0;
      input[0] = a4;
      return IOConnectCallScalarMethod(dword_100024BE8, 0x19u, input, 1u, 0, 0) == 0;
    default:
      fprintf(__stderrp, "Unsupported testing command (cmd=%d)\n", a1);
      return 0;
  }
}

uint64_t sub_10000EAB0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;
  void *outputStruct;
  kern_return_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int size;
  const char *name;
  uint64_t test_cases;
  uint64_t v18;
  unint64_t i;
  uint64_t v20;
  int flags;
  uint64_t v22;
  const char *v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  size_t v30;
  uint32_t outputCnt;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[28];
  uint64_t output;

  v2 = &unk_100025000;
  result = 1;
  if (!qword_1000254A0)
  {
    output = 0xAAAAAAAAAAAAAAAALL;
    outputCnt = 1;
    outputStruct = malloc_type_malloc(0x100000uLL, 0xB435E88EuLL);
    v30 = 0x100000;
    v5 = IOConnectCallMethod(dword_100024BE8, 0x1Au, 0, 0, 0, 0, &output, &outputCnt, outputStruct, &v30);
    if (v5)
    {
      v6 = v5;
      if (outputStruct)
        free(outputStruct);
      printf("IOKit returned %x for kSEP_QueryTests\n", v6 & 0x3FFF);
      return 0;
    }
    if (!v30)
    {
      fwrite("kSEP_QueryTests returned test_suites_size of 0!\n", 0x30uLL, 1uLL, __stderrp);
      return 0;
    }
    v7 = output;
    qword_100025498 = output;
    if (qword_1000254A0)
      free((void *)qword_1000254A0);
    qword_1000254A0 = (uint64_t)malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
    if (!qword_1000254A0)
      sub_10000F470();
    if (qword_100025498)
    {
      v8 = 0;
      v9 = 0;
      v25 = a1;
      v24 = outputStruct;
      do
      {
        v27 = v9;
        v10 = (uint64_t)outputStruct + v9;
        v11 = outputStruct;
        v12 = a1;
        v13 = v8;
        v14 = embeddedtest_test_suite_create_from_resume_data(v10);
        v28 = v13;
        *(_QWORD *)(v2[148] + 8 * v13) = v14;
        a1 = v12;
        outputStruct = v11;
        size = embeddedtest_test_suite_get_size((uint64_t)v14);
        if ((_DWORD)a1)
        {
          v26 = size;
          name = (const char *)embeddedtest_test_suite_get_name((uint64_t)v14);
          printf("Category %s\n", name);
          v29 = 0;
          test_cases = embeddedtest_test_suite_get_test_cases((uint64_t)v14, &v29);
          if (v29)
          {
            v18 = test_cases;
            for (i = 0; i < v29; ++i)
            {
              v20 = *(_QWORD *)(v18 + 8 * i);
              flags = embeddedtest_test_case_get_flags(v20);
              v22 = 0;
              v38 = 0u;
              memset(v39, 0, sizeof(v39));
              v36 = 0u;
              v37 = 0u;
              v34 = 0u;
              v35 = 0u;
              v33 = 0u;
              v32 = 1701736270;
              do
              {
                if ((testing_flag_enum[v22] & flags) != 0)
                {
                  if (v32 ^ 0x656E6F4E | v33)
                  {
                    __strcat_chk(&v32, " | ", 128);
                    __strcat_chk(&v32, (&testing_flag_strings)[v22], 128);
                  }
                  else
                  {
                    __strcpy_chk(&v32, (&testing_flag_strings)[v22], 128);
                  }
                }
                ++v22;
              }
              while (v22 != 4);
              v23 = (const char *)embeddedtest_test_case_get_name(v20);
              printf("\t%s (Flags: %s)\n", v23, (const char *)&v32);
            }
          }
          a1 = v25;
          size = v26;
          v2 = (_QWORD *)&unk_100025000;
          outputStruct = v24;
        }
        v9 = v27 + size;
        v8 = v28 + 1;
      }
      while (v28 + 1 < (unint64_t)qword_100025498);
    }
    if (outputStruct)
      free(outputStruct);
    return 1;
  }
  return result;
}

uint64_t sepDebugVar(int a1, _BYTE *a2, void *inputStruct, int64_t a4)
{
  uint64_t v6;
  int v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  FILE *v12;
  const char *v13;
  size_t v14;
  int v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  char v21;
  int v22;
  uint64_t input[2];

  if (a2)
  {
    LODWORD(v6) = 0;
    v7 = 4;
    do
    {
      v8 = *a2;
      if (*a2)
        ++a2;
      if (v8)
        v9 = v8;
      else
        v9 = 32;
      v6 = (((_DWORD)v6 << 8) + v9);
      --v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
  }
  switch(a1)
  {
    case 8:
      v22 = -1431655766;
      v21 = -86;
      puts("Retrieving old value: ");
      v11 = sub_10000F090(v6, inputStruct, &v22, &v21);
      if ((_DWORD)v11)
      {
        v10 = v11;
        v12 = __stderrp;
        v13 = "Failed to get debug variable\n";
        v14 = 29;
LABEL_22:
        fwrite(v13, v14, 1uLL, v12);
        return v10;
      }
      v16 = v22 - 1;
      if ((v22 - 1) >= 8 || ((0x8Bu >> v16) & 1) == 0)
      {
        v10 = 3758097090;
        v12 = __stderrp;
        v13 = "Width is invalid";
        v14 = 16;
        goto LABEL_22;
      }
      v17 = v16;
      if (v21 == 1)
      {
        v18 = qword_100019078[v16];
        v19 = qword_100019038[v17];
        if (v19 <= a4 && v18 >= a4)
          goto LABEL_33;
      }
      else
      {
        v18 = qword_1000190B8[v16];
        if (v18 >= (unint64_t)a4)
        {
LABEL_33:
          input[0] = v6;
          input[1] = a4;
          v10 = IOConnectCallMethod(dword_100024BE8, 0x4Cu, input, 2u, inputStruct, 0x1CuLL, 0, 0, 0, 0);
          if (!(_DWORD)v10)
            puts("Successfully set new variable value");
          return v10;
        }
        v19 = 0;
      }
      v10 = 3758097090;
      printf("New value is out of range of debug variable [%lld, %lld]\n", v19, v18);
      return v10;
    case 7:
      return sub_10000F090(v6, inputStruct, 0, 0);
    case 6:
      input[0] = v6;
      return IOConnectCallMethod(dword_100024BE8, 0x4Au, input, 1u, 0, 0, 0, 0, 0, 0);
    default:
      v10 = 3758097090;
      fprintf(__stderrp, "Unsupported debug var command (cmd=%d)\n", a1);
      break;
  }
  return v10;
}

uint64_t sub_10000F090(uint64_t a1, void *inputStruct, _DWORD *a3, _BYTE *a4)
{
  uint64_t v6;
  int v7;
  char v8;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t v12;
  uint64_t v13;
  uint64_t input;

  v13 = 0;
  input = a1;
  output = 0;
  v12 = 0;
  outputCnt = 3;
  v6 = IOConnectCallMethod(dword_100024BE8, 0x4Bu, &input, 1u, inputStruct, 0x1CuLL, &output, &outputCnt, 0, 0);
  if (!(_DWORD)v6)
  {
    v7 = v12;
    v8 = v13;
    switch((int)v12)
    {
      case 1:
      case 2:
      case 4:
        if (v13 != 1)
          goto LABEL_9;
        printf("%d");
        break;
      case 8:
        if (v13 == 1)
          printf("%lld");
        else
LABEL_9:
          printf("0x%llx");
        break;
      default:
        fwrite("Width is invalid", 0x10uLL, 1uLL, __stderrp);
        break;
    }
    putchar(10);
    if (a3)
      *a3 = v7;
    if (a4)
      *a4 = v8;
  }
  return v6;
}

uint64_t sub_10000F218(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *name;

  if (!qword_100025498)
    return 0;
  v2 = 0;
  while (1)
  {
    v3 = *(_QWORD *)(qword_1000254A0 + 8 * v2);
    name = (const char *)embeddedtest_test_suite_get_name(v3);
    if (!strcmp(a1, name))
      break;
    if (++v2 >= (unint64_t)qword_100025498)
      return 0;
  }
  return v3;
}

char *sub_10000F290()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  size_t v3;
  const char *name;
  char *v5;

  v0 = 3 * qword_100025498;
  v1 = (char *)malloc_type_calloc((6 * qword_100025498) | 1, 1uLL, 0x100004077774924uLL);
  if (qword_100025498)
  {
    v2 = 0;
    v3 = 2 * v0;
    do
    {
      name = (const char *)embeddedtest_test_suite_get_name(*(_QWORD *)(qword_1000254A0 + 8 * v2));
      v5 = strncat(v1, name, v3);
      strncat(v5, ", ", v3);
      ++v2;
    }
    while (v2 < qword_100025498);
  }
  return v1;
}

void sub_10000F340(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t name;
  const char *v10;
  uint64_t v11;
  char *v12;

  if (a3)
    *a3 = 1;
  if (a2)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = embeddedtest_results_create_from_resume_data(a1 + v7);
      v7 += embeddedtest_results_get_size((uint64_t)v8);
      embeddedtest_results_test_case_print((uint64_t)v8);
      name = embeddedtest_results_get_name((uint64_t)v8);
      v10 = (const char *)name;
      LODWORD(v11) = 4;
      do
      {
        v11 = (v11 - 1);
        if (*(_BYTE *)(name + v11) != 32)
          break;
        *(_BYTE *)(name + v11) = 0;
      }
      while (v11 > 1);
      if (embeddedtest_results_did_pass((uint64_t)v8))
      {
        printf("[PASS] %s\n", v10);
      }
      else
      {
        printf("[FAIL] %s\n", v10);
        if (a3)
          *a3 = 0;
      }
      v12 = (char *)0xAAAAAAAAAAAAAAAALL;
      asprintf(&v12, "/tmp/%s_test_results.json", v10);
      embeddedtest_results_save_to_file((uint64_t)v8, v12);
      if (v12)
        free(v12);
      embeddedtest_results_free(v8);
      ++v6;
    }
    while (v6 != a2);
  }
}

void sub_10000F470()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "suites", "/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/libsep_testing/src/sep_testing.c", 284);
  abort();
}

uint64_t hilo_get_lth_transfer_attestation(char *outputStruct, const void *a2, size_t a3)
{
  uint64_t v3;
  mach_port_t v7;
  size_t outputStructCnt;

  v3 = 3758097090;
  if (outputStruct && a2)
  {
    if (byte_1000254AC == 1)
    {
      v7 = dword_1000254A8;
    }
    else
    {
      v7 = sep_connect();
      dword_1000254A8 = v7;
      if (!v7)
        return 3758097098;
      byte_1000254AC = 1;
    }
    outputStructCnt = 176;
    v3 = IOConnectCallStructMethod(v7, 0x3Cu, 0, 0, outputStruct, &outputStructCnt);
    if (!(_DWORD)v3)
      memcpy(outputStruct + 176, a2, a3);
  }
  return v3;
}

uint64_t hilo_get_lth_transfer_message_with_manifest(char *outputStruct, const void *a2, size_t a3, void *inputStruct, size_t inputStructCnt, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  mach_port_t v15;
  size_t v17;
  uint64_t input[2];

  v7 = 3758097090;
  if (outputStruct && a2 && inputStruct)
  {
    if (byte_1000254AC == 1)
    {
      v15 = dword_1000254A8;
    }
    else
    {
      v15 = sep_connect();
      dword_1000254A8 = v15;
      if (!v15)
        return 3758097098;
      byte_1000254AC = 1;
    }
    v17 = 3145856;
    input[0] = a6;
    input[1] = a7;
    v7 = IOConnectCallMethod(v15, 0x3Du, input, 2u, inputStruct, inputStructCnt, 0, 0, outputStruct, &v17);
    if (!(_DWORD)v7)
      memcpy(outputStruct + 3145856, a2, a3);
  }
  return v7;
}

uint64_t hilo_load_lth_transfer_message(void *inputStruct, size_t inputStructCnt)
{
  uint64_t v2;
  mach_port_t v5;

  v2 = 3758097090;
  if (inputStruct)
  {
    if (byte_1000254AC == 1)
    {
      v5 = dword_1000254A8;
      return IOConnectCallStructMethod(v5, 0x3Eu, inputStruct, inputStructCnt, 0, 0);
    }
    v5 = sep_connect();
    dword_1000254A8 = v5;
    if (v5)
    {
      byte_1000254AC = 1;
      return IOConnectCallStructMethod(v5, 0x3Eu, inputStruct, inputStructCnt, 0, 0);
    }
    return 3758097098;
  }
  return v2;
}

uint64_t hilo_advance_gain_restriction_phase()
{
  mach_port_t v0;

  if (byte_1000254AC == 1)
  {
    v0 = dword_1000254A8;
    return IOConnectCallScalarMethod(v0, 0x3Fu, 0, 0, 0, 0);
  }
  v0 = sep_connect();
  dword_1000254A8 = v0;
  if (v0)
  {
    byte_1000254AC = 1;
    return IOConnectCallScalarMethod(v0, 0x3Fu, 0, 0, 0, 0);
  }
  return 3758097098;
}

uint64_t sep_connect()
{
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_connect_t connect;
  mach_port_t mainPort;

  mainPort = -1431655766;
  connect = 0;
  if (IOMasterPort(0, &mainPort))
  {
    fprintf(__stderrp, "%s: could not get master port\n");
  }
  else
  {
    v1 = IOServiceMatching("AppleSEPManager");
    if (v1)
    {
      MatchingService = IOServiceGetMatchingService(mainPort, v1);
      if (MatchingService)
      {
        if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
          return connect;
        fprintf(__stderrp, "%s could not open SEP service, IOServiceOpen returned %d\n");
      }
      else
      {
        fprintf(__stderrp, "%s: could not find SEP service\n");
      }
    }
    else
    {
      fprintf(__stderrp, "%s: could not make matching dictionary for '%s'\n");
    }
  }
  return 0;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[3];

  memset(v8, 170, sizeof(v8));
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[2];

  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[3];

  memset(v12, 170, sizeof(v12));
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;

  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  size_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    return v4 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v6[2];

  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6))
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (DERParseInteger((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t DERImg4Decode(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010)
        {
          v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!(_DWORD)result)
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  uint64_t result;
  unsigned int v5;

  v5 = 2;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!(_DWORD)result)
      {
        result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1)
            return 0;
          else
            return 6;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(_QWORD *)(a2 + 80)
               || (v7 = 0u,
                   v8 = 0u,
                   result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          v6 = *(_QWORD *)(a2 + 96);
          v5 = a2 + 96;
          if (!v6)
            return 0;
          v7 = 0u;
          v8 = 0u;
          result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x50415950u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
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

  result = 6;
  if (a1 && a2)
  {
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
    result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 80);
          v5 = (unint64_t *)(a2 + 80);
          if (!v6)
            return 0;
          memset(v10, 0, sizeof(v10));
          result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
    else
    {
      v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(_QWORD *a1, unint64_t a2)
{
  return sub_1000106F4(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_1000106F4(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (DERImg4DecodeTagCompare(a4, a5))
        return 2;
      v9 = 0;
      result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;

  result = 6;
  if (a1)
  {
    if (a3)
    {
      v14 = 0;
      v15 = 0uLL;
      v13 = 0uLL;
      v11 = 0;
      v12 = 0;
      v9 = 0;
      v10 = 0;
      v8 = 0;
      result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010)
          return 2;
        result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result)
          return result;
        if (v14 != 22)
          return 2;
        result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result)
          return result;
        if ((v8 | 0xE000000000000000) != a2)
          return 2;
        *(_OWORD *)a3 = v15;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result)
          return result;
        *(_QWORD *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1)
          return 2;
        v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  _QWORD v9[4];
  __int128 v10;

  v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  v10 = a3;
  result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!(_DWORD)result)
  {
    result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        result = 0;
        *(_QWORD *)(a4 + 16) = a2 | 0xE000000000000000;
        *(_QWORD *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  __int128 v8;

  v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7)
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7[2];

  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7))
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  sub_100010AD4(a1, a2, a3, 0x4D414E42u);
}

void sub_100010AD4(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _OWORD v12[3];
  _OWORD v13[3];
  unint64_t v14;
  unint64_t v15[2];

  v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2)
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10)
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];
  unint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v11 = 0;
  v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  v15 = 0;
  result = 0xFFFFFFFFLL;
  v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010)
            return 2;
          result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result)
            return result;
          if (v11)
          {
            result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1))
                return 7;
              v9 = __CFADD__(v12, v8);
              v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 136))
      v4 = *(_QWORD *)(a1 + 144) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeSectionExists(_QWORD *a1, unsigned int a2, char *a3)
{
  uint64_t v3;
  char v4;

  v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56])
        goto LABEL_11;
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
    v4 = 1;
LABEL_12:
    v3 = 0;
    *a3 = v4;
  }
  return v3;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  Img4DecodeGetIntegerFromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  Img4DecodeGetDataFromSection(a1, 1u, a2, a3, a4);
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (!a1)
    return 6;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result)
        *a2 = (_QWORD)v8 != 0;
    }
  }
  return result;
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v5;
  int v6;
  int v7;
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

  if (a1)
  {
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
    v10 = 0uLL;
    v9 = 0uLL;
    v8 = 0uLL;
    if (a3)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v19 = 0uLL;
        v20 = 0uLL;
        v17 = 0uLL;
        v18 = 0uLL;
        v15 = 0uLL;
        v16 = 0uLL;
        v13 = 0uLL;
        v14 = 0uLL;
        v11 = 0uLL;
        v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((_QWORD)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7)
                  *a3 = (_QWORD)v8 != 0;
              }
            }
          }
        }
      }
    }
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  int v10;
  double result;
  int v12;
  unint64_t v13[3];
  char v14;

  *(_OWORD *)v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    v14 = 0;
    if (!Img4DecodeSectionExists((_QWORD *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12)
          return result;
      }
    }
    result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) == 1)
    {
      if (a3)
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      else
        return 6;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  result = 6;
  if (a3 && a4)
  {
    v8 = *a1;
    v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((_QWORD *)&v14 + 1) == 4)
      {
        result = 0;
        *a3 = *((_QWORD *)&v13 + 1);
        v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      result = 2;
    }
    v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(_QWORD *a1)
{
  sub_10001126C(a1, 0);
}

void sub_10001126C(_QWORD *a1, _OWORD *a2)
{
  __int128 *v4;
  int v5;
  int v6;
  __int128 v7;
  __int128 __s2;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *__s1;
  size_t __n;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20[2];
  unint64_t v21[3];

  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  v19 = 0;
  v18 = 0uLL;
  __n = 0;
  v17 = 0;
  v14 = 0;
  __s1 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __s2 = 0uLL;
  v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17))
        return;
      v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((_QWORD *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5)
              break;
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9))
              return;
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((_QWORD *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6)
                return;
              if (__n != *((_QWORD *)&__s2 + 1))
                return;
              v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6)
                return;
            }
            else if (*((_QWORD *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((_QWORD *)&v10 + 1) != 0xA000000000000001 || v6 != 1)
                return;
              v6 = 0;
            }
            if (v6)
              return;
          }
          if (v5 != 1)
            return;
          break;
        case 0xE00000006D616E78:
          if (a2)
            *a2 = v18;
          break;
        case 0xE00000004F424A50:
          v4 = (__int128 *)(a1 + 9);
          if (a1[9])
            goto LABEL_11;
          v4 = (__int128 *)(a1 + 9);
          if (a1[10])
            goto LABEL_11;
          break;
        default:
          return;
      }
    }
  }
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13[2];
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  if (!a3)
    return 6;
  result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1)
        return 0;
      if ((_DWORD)result)
        return result;
      result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result)
        return result;
      result = 2;
      if (*((_QWORD *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16))
        break;
      v10 = v15;
      LODWORD(v11) = v16;
      v12 = *((_QWORD *)&v9 + 1);
      result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result)
        return result;
    }
    return 7;
  }
  return result;
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[2];

  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      v7 = 0u;
      v8 = 0u;
      v5 = 0u;
      v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(_QWORD *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1000116E8(a1, a2, a3, a4, 0, a5);
}

void sub_1000116E8(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  _QWORD *v9;
  uint64_t (*v13)(uint64_t, uint64_t);
  const void *v14;
  int v15;
  int v16;
  unsigned int (*v17)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t);
  unint64_t v18;
  unint64_t *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[3];

  v22 = 0;
  v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      v21 = 0;
      if (a4)
      {
        if (*(_QWORD *)a3)
        {
          if (*(_QWORD *)a4)
          {
            if (*(_QWORD *)(a4 + 24))
            {
              if (*(_QWORD *)(a4 + 8))
              {
                if (*(_QWORD *)(a4 + 16))
                {
                  v9 = *(_QWORD **)(a4 + 32);
                  if (v9)
                  {
                    if (*(_QWORD *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(_QWORD **)(a4 + 32)))
                      {
                        v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(_QWORD *)(a2 + 296), *(_QWORD *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(_QWORD **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(_QWORD, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(_QWORD *)(a2 + 280), *(_QWORD *)(a2 + 288), a2 + 376,
                               **(_QWORD **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16)
                        return;
                      if ((a5 & 1) == 0)
                      {
                        v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        v18 = a1 | 0xE000000000000000;
                        v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6))
                            return;
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20)
                            return;
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(_QWORD **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184, **(_QWORD **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(_BYTE *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
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

uint64_t sub_100011990(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t v9;
  size_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  _BYTE *v15;
  __int128 i;
  unint64_t v17;
  BOOL v18;
  int v19;
  int v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];

  if (a5 != 4096 && a5 != 3072)
    return 0xFFFFFFFFLL;
  v24[0] = 0;
  v24[1] = 0;
  v9 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  v11 = (unint64_t *)((char *)&v21 - v10);
  bzero((char *)&v21 - v10, v10);
  *v11 = v9;
  v12 = *(unsigned int *)(a1 + 8);
  v23[0] = *(_QWORD *)a1;
  v23[1] = v12;
  v21 = 0u;
  v22 = 0u;
  result = DERParseSequenceToObject((uint64_t)v23, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)&v21, 0x20uLL, 0x20uLL);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  v14 = *((_QWORD *)&v21 + 1);
  v15 = (_BYTE *)v21;
  for (i = v22; v14; --v14)
  {
    if (*v15)
      break;
    if (v15 == (_BYTE *)-1)
      __break(0x5513u);
    ++v15;
  }
  if (v14 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  v17 = (v14 + 7) >> 3;
  if (v17 > *v11)
    return 0xFFFFFFFFLL;
  *v11 = v17;
  if (ccrsa_make_pub(v11, *((_QWORD *)&i + 1), i))
    return 0xFFFFFFFFLL;
  if (&_ccrsa_verify_pkcs1v15_digest)
    v18 = &CCRSA_PKCS1_FAULT_CANARY == 0;
  else
    v18 = 1;
  if (!v18)
  {
    v20 = ccrsa_verify_pkcs1v15_digest(v11, a2, a3[1], *a3, a4[1], *a4, v24);
    if (!v20 && !cc_cmp_safe(16, &CCRSA_PKCS1_FAULT_CANARY, v24))
      return 0;
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v21) = 0;
  v19 = ccrsa_verify_pkcs1v15(v11, a2, a3[1], *a3, a4[1], *a4, &v21);
  result = 0xFFFFFFFFLL;
  if (!v19 && (_BYTE)v21)
    return 0;
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t result;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a7 + 32);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD ***)(v7 + 16);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *v8;
  if (!v9)
    return 0xFFFFFFFFLL;
  if (*v9 != a6)
    return 0xFFFFFFFFLL;
  result = sub_100011990((uint64_t)v13, v9[4], v11, v12, 4096);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t result;
  unsigned int v9;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  unint64_t *v19;
  size_t v20;
  const void *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  unint64_t v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[216];
  _BYTE v32[24];
  unint64_t v33[30];
  _OWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[32];
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41[2];
  unint64_t v42[2];
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46[2];
  unint64_t v47[3];

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!sub_10001238C(v26, (uint64_t)v27, 3u)
          && !sub_100011F14((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          v24 = a6;
          v15 = 0;
          v16 = (const void **)v32;
          v17 = &v30;
          v18 = (const void **)v32;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = sub_100012178(&v34[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42))
                return 0xFFFFFFFFLL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                v43 = 0u;
                v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1)
                        goto LABEL_14;
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  v25 = v44;
                  result = DEROidCompare((uint64_t)&off_100020700, (uint64_t)&v25);
                  if (!(_DWORD)result)
                    return 0xFFFFFFFFLL;
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  if (!v38)
                    return 0;
                  v23 = v39;
                  if (!v39)
                    return 0;
                  result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      result = 0;
                      *a5 = v38;
                      *v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_100011F14(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int128 v23;

  if (!a2)
    return 0;
  v8 = 0;
  v15 = result;
  v18 = ~result;
  v17 = ~a3;
  v14 = ~a4;
  v13 = ~a5;
  v11 = ~a6;
  v10 = a2;
  while (1)
  {
    v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17)
      break;
    result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (160 * v8 > v14)
      break;
    result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v13)
      break;
    v22 = 0u;
    v23 = 0u;
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result)
      return 0xFFFFFFFFLL;
    if (*((_QWORD *)&v20 + 1))
    {
      if (*((_QWORD *)&v20 + 1) != 2 || *(_BYTE *)v20 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v20 == -1)
        break;
      if (*(_BYTE *)(v20 + 1))
        return 0xFFFFFFFFLL;
    }
    result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21)
      return 0xFFFFFFFFLL;
    if (v9 > v11)
      break;
    result = sub_100012464(a4 + 160 * v8, (_QWORD *)(a6 + 16 * v8));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (++v8 == v10)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100012178(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  v11 = 0u;
  v12 = 0u;
  v10 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = 0;
  v9 = 0;
  v5 = *(_QWORD **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(_QWORD *)a3
    || !*(_QWORD *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((_QWORD *)&v12 + 1))
  {
    result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((_QWORD *)&v12 + 1) != 2 || *(_BYTE *)v12 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(_BYTE *)(v12 + 1))
        return 0xFFFFFFFFLL;
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(_QWORD *)(a3 + 40)))
    return 0xFFFFFFFFLL;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _OWORD *, _QWORD, uint64_t))a3)(*a2, a2[1], v13, **(_QWORD **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10))
    return 0xFFFFFFFFLL;
  if (v10)
    return 0xFFFFFFFFLL;
  result = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t, _OWORD *, _QWORD, uint64_t, _QWORD))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(_QWORD **)(a3 + 32), a3, 0);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v8;
  _QWORD *v9;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    v8 = *(_QWORD **)(a5 + 32);
    if (v8 && (v9 = (_QWORD *)v8[2]) != 0 && *v8 == a4 && *v9 && *(_QWORD *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_10001238C(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v18 = 0;
  v19 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v5 = ~a2;
  v6 = 1;
  v7 = *a1;
  v8 = a1[1];
  while (1)
  {
    v18 = v7;
    v19 = v8;
    result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (__CFADD__(v16, v17))
      break;
    v10 = v16 + v17;
    v11 = v16 + v17 - v7;
    v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3)
      return 0xFFFFFFFFLL;
    if (v5 < 16 * (unint64_t)v6)
      break;
    v14 = (unint64_t *)(a2 + 16 * v6);
    *v14 = v7;
    v14[1] = v11;
    if (v10 < v7)
      break;
    v12 = v8 >= v11;
    v8 -= v11;
    if (!v12)
      goto LABEL_21;
    ++v6;
    v7 = v10;
    if (!v8)
    {
      if (v6 == a3)
        return 0;
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_100012464(uint64_t a1, _QWORD *a2)
{
  char v3;
  int v4;
  _OWORD v6[2];
  __int128 v7;
  unint64_t v8;
  unint64_t v9[2];
  uint64_t v10;
  unint64_t v11[2];
  unint64_t v12[3];

  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  v10 = 0;
  v8 = 0;
  v9[0] = 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(a1 + 152))
    return 0;
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010)
    return 0xFFFFFFFFLL;
  v3 = 1;
  while (1)
  {
    v4 = DERDecodeSeqNext(v11, &v8);
    if (v4)
      break;
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011)
        return 0xFFFFFFFFLL;
      v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t SEPART_decode(uint64_t *a1, _QWORD *a2, _QWORD *a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!a5)
    return 0;
  v16 = 0;
  v11 = ccder_decode_sequence_tl(&v16, a5, a6);
  v15 = 0;
  v12 = ccder_decode_uint64(&v15, v11, a6);
  if (v15)
    return 0;
  *a1 = v12;
  result = ccder_decode_sequence_tl(&v16, v12, a6);
  if (result)
  {
    *a2 = v16;
    *a3 = 0;
    v14 = ccder_decode_tl(4, a3);
    *a4 = v14;
    return v14 + *a3;
  }
  return result;
}

uint64_t SEPARTExtract(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  return SEPART_decode(a3, a4, &v6, &v5, a1, a2);
}

uint64_t SEPARTPayloadDecode(uint64_t a1, _QWORD *a2, uint64_t *a3, _QWORD *a4, uint64_t *a5, _QWORD *a6, uint64_t *a7, uint64_t *a8, _QWORD *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (!a10)
    return 0;
  v24 = 0;
  v19 = ccder_decode_sequence_tl(&v24, a10, a11);
  result = 0;
  if (v24 == a11)
  {
    ccder_decode_uint64(a1, v19, a11);
    sub_1000127EC(a2, a3);
    sub_1000127EC(a4, a5);
    v21 = sub_1000127EC(a6, a7);
    v23 = 0;
    v22 = ccder_decode_constructed_tl(0x2000000000000011, &v23);
    if (a9)
      *a9 = v23;
    if (a8)
      *a8 = v21;
    if (v22)
      return v23;
    else
      return 0;
  }
  return result;
}

uint64_t sub_1000127EC(_QWORD *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;

  v5 = 0;
  result = ccder_decode_tl(4, &v5);
  if (result)
  {
    if (a1)
      *a1 = v5;
    if (a2)
      *a2 = result;
    result += v5;
  }
  return result;
}

uint64_t SEPARTCounterFind(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = 0;
  v7 = ccder_decode_constructed_tl(0x2000000000000011, &v15);
  v8 = a1 | 0xC000000000000000;
  v14 = 0;
  while (1)
  {
    v16 = 0;
    v9 = ccder_decode_tag(&v14, v7, a4);
    v10 = (char *)ccder_decode_len(&v16, v9, a4);
    if (!v10 || v16 == 0)
      break;
    v12 = v10;
    if (*v10 < 0 || (ccn_read_uint(1, a2) & 0x80000000) != 0)
      break;
    v7 = (uint64_t)&v12[v16];
    if (v14 == v8)
      return 1;
  }
  return 0;
}

double *embeddedtest_test_case_statistic_metric_create(const char *a1, double a2)
{
  double *v4;
  double *v5;
  char *v6;

  if (a1)
  {
    v4 = (double *)malloc_type_calloc(1uLL, 0x38uLL, 0x1010040D5418A94uLL);
    if (!v4)
      sub_100017A48();
    v5 = v4;
    v6 = strdup(a1);
    *(_QWORD *)v5 = v6;
    if (!v6)
      sub_100017A80();
    v5[1] = a2;
    v5[2] = a2;
    v5[3] = a2;
    v5[4] = a2;
    v5[5] = 0.0;
    *((_DWORD *)v5 + 12) = 1;
  }
  else
  {
    puts("Unable to create test case statistic metric with a null name");
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_statistic_metric_free(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    free(a1);
  }
}

uint64_t embeddedtest_test_case_statistic_metric_get_name(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void *embeddedtest_test_case_statistic_metric_copy_json_representation(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;

  v9 = 0;
  embeddedtest_asprintf(&v9, "{\"Name\":\"%s\",\"Max\":%f,\"Min\":%f,\"Mean\":%f,\"StdDev\":%f,\"Count\":%d}", a3, a4, a5, a6, a7, a8, *a1);
  return v9;
}

uint64_t embeddedtest_test_case_statistic_metric_merge(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  float64x2_t v7;
  float64x2_t v8;

  v2 = *(_DWORD *)(a1 + 48);
  v3 = *(_DWORD *)(a2 + 48);
  v4 = *(double *)(a1 + 32) + *(double *)(a2 + 32);
  v5 = v4 / (double)(v3 + v2);
  v6 = sqrt((*(double *)(a2 + 40) * *(double *)(a2 + 40) * (double)v3+ (double)v2 * (*(double *)(a1 + 40) * *(double *)(a1 + 40))+ (*(double *)(a2 + 24) - v5) * (*(double *)(a2 + 24) - v5) * (double)v3+ (double)v2 * ((*(double *)(a1 + 24) - v5) * (*(double *)(a1 + 24) - v5)))/ (double)(v3 + v2));
  *(double *)(a1 + 32) = v4;
  *(double *)(a1 + 40) = v6;
  *(_DWORD *)(a1 + 48) = v3 + v2;
  *(double *)(a1 + 24) = v5;
  v7.f64[0] = *(float64_t *)(a1 + 8);
  v7.f64[1] = *(float64_t *)(a2 + 16);
  v8.f64[0] = *(float64_t *)(a2 + 8);
  v8.f64[1] = *(float64_t *)(a1 + 16);
  *(int8x16_t *)(a1 + 8) = vbslq_s8((int8x16_t)vcgeq_f64(v7, v8), *(int8x16_t *)(a1 + 8), *(int8x16_t *)(a2 + 8));
  return 0;
}

__n128 embeddedtest_test_case_statistic_metric_copy(uint64_t a1)
{
  double *v2;
  __n128 result;

  if (a1)
  {
    v2 = embeddedtest_test_case_statistic_metric_create(*(const char **)a1, 0.0);
    v2[3] = *(double *)(a1 + 24);
    *(_OWORD *)(v2 + 1) = *(_OWORD *)(a1 + 8);
    result = *(__n128 *)(a1 + 32);
    *((__n128 *)v2 + 2) = result;
    *((_DWORD *)v2 + 12) = *(_DWORD *)(a1 + 48);
  }
  return result;
}

double *embeddedtest_test_case_statistic_metric_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  double *v4;
  double *v5;

  v4 = (double *)malloc_type_calloc(1uLL, 0x38uLL, 0x1010040D5418A94uLL);
  if (!v4)
    sub_100017AB8();
  v5 = v4;
  *(_QWORD *)v4 = embeddedtest_create_string_from_buffer(a1, a2);
  v5[1] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[2] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[3] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[4] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[5] = embeddedtest_deserialize_metric_value(a1, a2);
  *((_DWORD *)v5 + 12) = embeddedtest_deserialize_count(a1, a2);
  return v5;
}

uint64_t embeddedtest_test_case_statistic_metric_get_size(const char **a1)
{
  return strlen(*a1) + 48;
}

uint64_t embeddedtest_asprintf(void **a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return embeddedtest_vasprintf(a1, a2, &a9);
}

uint64_t embeddedtest_vasprintf(void **a1, char *__format, va_list a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  char *v8;

  v5 = vsnprintf(0, 0, __format, a3);
  v6 = v5;
  if (a1)
  {
    v7 = (int)v5 + 1;
    v8 = (char *)malloc_type_calloc(v7, 8uLL, 0x10040436913F5uLL);
    *a1 = v8;
    if (!v8)
      sub_100017AF0();
    v6 = vsnprintf(v8, v7, __format, a3);
    if ((v6 & 0x80000000) != 0)
    {
      if (*a1)
        free(*a1);
      printf("vsnprintf returned an error...%d\n", v6);
    }
  }
  return v6;
}

_BYTE *embeddedtest_escape_json_string(_BYTE *a1, int a2)
{
  _BYTE *result;
  char v4;
  unsigned __int8 *v5;
  _BYTE *v6;
  int v7;

  result = malloc_type_calloc(1uLL, (2 * a2) | 1u, 0x462EE857uLL);
  if (!result)
    sub_100017B28();
  v4 = *a1;
  if (*a1)
  {
    v5 = a1 + 1;
    v6 = result;
    do
    {
      if (v4 == 10)
      {
        *(_WORD *)v6 = 28252;
        v6 += 2;
      }
      else if (v4 == 92 || v4 == 34)
      {
        *v6 = 92;
        v6[1] = v4;
        v6 += 2;
      }
      else
      {
        *v6++ = v4;
      }
      v7 = *v5++;
      v4 = v7;
    }
    while (v7);
  }
  return result;
}

char *embeddedtest_create_json_string_from_array(_QWORD *a1, unsigned int a2, const char *a3, uint64_t (*a4)(_QWORD))
{
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  size_t v12;
  char *v13;

  if (!a2)
    return (char *)malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL);
  v7 = 0;
  v8 = a2;
  do
  {
    v9 = a4(*a1);
    v10 = (char *)v9;
    if (v7)
    {
      v11 = strlen(v7);
      v12 = v11 + strlen(v10) + 2;
      v13 = (char *)malloc_type_realloc(v7, v12, 0x6C6273D2uLL);
      if (!v13)
        sub_100017B60();
      v7 = v13;
      snprintf(v13, v12, a3, v13, v10);
      if (v10)
        free(v10);
    }
    else
    {
      v7 = (char *)v9;
    }
    ++a1;
    --v8;
  }
  while (v8);
  if (v7)
    return v7;
  else
    return (char *)malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL);
}

uint64_t embeddedtest_results_save_to_file(uint64_t a1, const char *a2)
{
  char *v3;
  char *v4;
  FILE *v5;
  FILE *v6;
  int v7;
  const char *v9;
  uint64_t v10;

  if (!a1)
  {
    v9 = "Results object must be provided to save to disk";
LABEL_9:
    v10 = 1;
    return embeddedtest_error_get_error(v10, v9);
  }
  if (!a2)
  {
    v9 = "Filepath must be provided to save to disk";
    goto LABEL_9;
  }
  v3 = (char *)embeddedtest_results_copy_json_representation(a1);
  if (!v3)
    sub_100017B98();
  v4 = v3;
  v5 = fopen(a2, "w+");
  if (v5)
  {
    v6 = v5;
    v7 = fputs(v4, v5);
    fclose(v6);
    free(v4);
    if (v7 > 0)
      return 0;
    v9 = "Unable to write full json to file";
  }
  else
  {
    v9 = "Unable to open requested file";
  }
  v10 = 4;
  return embeddedtest_error_get_error(v10, v9);
}

_BYTE *embeddedtest_test_case_result_create(char a1, const char *a2)
{
  _BYTE *v4;
  _BYTE *v5;
  char *v6;

  if (a2)
  {
    v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040F257B3C2uLL);
    if (!v4)
      sub_100017BD0();
    v5 = v4;
    v6 = strdup(a2);
    *(_QWORD *)v5 = v6;
    if (!v6)
      sub_100017C08();
    v5[28] = a1;
    *((_DWORD *)v5 + 6) = -1;
    *((_QWORD *)v5 + 1) = 0;
    *((_DWORD *)v5 + 8) = 0;
    *((_QWORD *)v5 + 5) = 0;
    *((_DWORD *)v5 + 4) = time(0);
    *((_DWORD *)v5 + 5) = 0;
  }
  else
  {
    puts("Unable to create a test case result with NULL name");
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_result_free(_QWORD *a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;

  if (a1)
  {
    v2 = (void *)*a1;
    if (v2)
      free(v2);
    v3 = (void *)a1[1];
    if (v3)
      free(v3);
    if (*((_DWORD *)a1 + 8))
    {
      v4 = 0;
      do
        embeddedtest_test_case_metric_free(*(void ***)(a1[5] + 8 * v4++));
      while (v4 < *((unsigned int *)a1 + 8));
    }
    v5 = (void *)a1[5];
    if (v5)
      free(v5);
    free(a1);
  }
}

uint64_t embeddedtest_test_case_result_pass(uint64_t a1)
{
  const char *v1;

  if (!a1)
  {
    v1 = "Unable to pass NULL result";
    return embeddedtest_error_get_error(1, v1);
  }
  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2)
  {
    v1 = "Cannot pass a histogram";
    return embeddedtest_error_get_error(1, v1);
  }
  *(_DWORD *)(a1 + 24) = 0;
  return 0;
}

BOOL embeddedtest_test_case_result_is_histogram(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 28) & 0xFE) == 2;
}

uint64_t embeddedtest_test_case_result_fail(uint64_t a1, char *__format, ...)
{
  const char *v4;
  void *v6;
  _QWORD *v7;
  va_list va;

  va_start(va, __format);
  if (!a1)
  {
    v4 = "Unable to fail NULL result";
    return embeddedtest_error_get_error(1, v4);
  }
  if (!__format)
  {
    v4 = "Reason cannot be null when failing a test case";
    return embeddedtest_error_get_error(1, v4);
  }
  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2)
  {
    v4 = "Cannot fail a histogram";
    return embeddedtest_error_get_error(1, v4);
  }
  v7 = (_QWORD *)(a1 + 8);
  v6 = *(void **)(a1 + 8);
  if (v6)
    free(v6);
  embeddedtest_vasprintf((void **)(a1 + 8), __format, va);
  if (!*v7)
    sub_100017C40();
  *(_DWORD *)(a1 + 24) = 1;
  return 0;
}

uint64_t embeddedtest_test_case_result_add_metric(uint64_t a1, const char *a2, double a3)
{
  const char *v5;
  double *v7;
  unint64_t v8;
  void *v9;
  const char *name;
  unint64_t v11;
  unsigned int v12;
  _QWORD *v13;

  if (!a1)
  {
    v5 = "Unable to add metric to NULL result";
    return embeddedtest_error_get_error(1, v5);
  }
  if (!a2)
  {
    v5 = "Metric name cannot be null";
    return embeddedtest_error_get_error(1, v5);
  }
  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2)
  {
    v5 = "Metrics cannot be added to a histogram";
    return embeddedtest_error_get_error(1, v5);
  }
  v7 = embeddedtest_test_case_metric_create(a2, a3);
  if (*(_DWORD *)(a1 + 32))
  {
    v8 = 0;
    while (1)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 8 * v8);
      name = (const char *)embeddedtest_test_case_metric_get_name((uint64_t)v9);
      if (!strcmp(a2, name))
        break;
      ++v8;
      v11 = *(unsigned int *)(a1 + 32);
      if (v8 >= v11)
      {
        v12 = v11 + 1;
        goto LABEL_14;
      }
    }
    if (v9)
      free(v9);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v8) = v7;
  }
  else
  {
    v12 = 1;
LABEL_14:
    *(_DWORD *)(a1 + 32) = v12;
    if (*(_QWORD *)(a1 + 40))
      v13 = malloc_type_realloc(*(void **)(a1 + 40), 8 * v12, 0x2004093837F09uLL);
    else
      v13 = malloc_type_calloc(v12, 8uLL, 0x2004093837F09uLL);
    *(_QWORD *)(a1 + 40) = v13;
    if (!v13)
      sub_100017C78();
    v13[*(_DWORD *)(a1 + 32) - 1] = v7;
  }
  return 0;
}

BOOL embeddedtest_test_case_result_did_pass(uint64_t a1)
{
  return *(_DWORD *)(a1 + 24) == 0;
}

uint64_t embeddedtest_test_case_result_check_validity(uint64_t a1)
{
  if (!a1)
    return embeddedtest_error_get_error(1, "Unable to check validity of NULL result");
  if ((*(_BYTE *)(a1 + 28) & 0xFE) == 2)
    return sub_10001330C(a1);
  if (*(_DWORD *)(a1 + 24) == -1)
    return embeddedtest_error_get_error(2, "Result did not have pass/fail set");
  return 0;
}

uint64_t sub_10001330C(uint64_t a1)
{
  const char *v2;

  if (*(_BYTE *)(a1 + 28) == 2 && !*(_DWORD *)(a1 + 20))
  {
    v2 = "Histogram by time did not have a end time";
  }
  else
  {
    if (*(_QWORD *)(a1 + 8))
      return 0;
    v2 = "Histogram requires bucket to be set";
  }
  return embeddedtest_error_get_error(2, v2);
}

uint64_t embeddedtest_test_case_result_get_metrics(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t embeddedtest_test_case_result_get_metric_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t embeddedtest_test_case_result_get_name(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t embeddedtest_test_case_result_get_bucket(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t embeddedtest_test_case_result_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 28);
}

uint64_t embeddedtest_test_case_result_get_duration(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20) - *(_DWORD *)(a1 + 16);
  return v1 & ~(v1 >> 31);
}

uint64_t embeddedtest_test_case_statistic_create(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *name;
  char *v5;
  int v6;
  void *v7;
  int duration;
  const char *bucket;
  int v10;
  int v11;

  if (a1)
  {
    v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040765C718DuLL);
    if (!v2)
      sub_100017CB0();
    v3 = (uint64_t)v2;
    name = (const char *)embeddedtest_test_case_result_get_name(a1);
    v5 = strdup(name);
    *(_QWORD *)v3 = v5;
    if (!v5)
      sub_100017CE8();
    *(_BYTE *)(v3 + 8) = embeddedtest_test_case_result_get_class(a1);
    if (embeddedtest_test_case_result_is_histogram(a1) || !embeddedtest_test_case_result_did_pass(a1))
    {
      v7 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
      *(_QWORD *)(v3 + 24) = v7;
      if (!v7)
        sub_100017D20();
      if (*(_BYTE *)(v3 + 8) == 2)
        duration = embeddedtest_test_case_result_get_duration(a1);
      else
        duration = 1;
      bucket = (const char *)embeddedtest_test_case_result_get_bucket(a1);
      **(_QWORD **)(v3 + 24) = embeddedtest_test_case_statistic_bucket_create(bucket, duration);
      v6 = 1;
    }
    else
    {
      v6 = 0;
      *(_QWORD *)(v3 + 24) = 0;
    }
    *(_DWORD *)(v3 + 20) = v6;
    if (embeddedtest_test_case_result_is_histogram(a1))
    {
      *(_DWORD *)(v3 + 12) = 0;
      *(_QWORD *)(v3 + 40) = 0;
      *(_DWORD *)(v3 + 32) = 0;
      v10 = *(unsigned __int8 *)(v3 + 8);
      if (v10 == 3)
      {
        v11 = 1;
        goto LABEL_19;
      }
      if (v10 == 2)
      {
        v11 = embeddedtest_test_case_result_get_duration(a1);
LABEL_19:
        *(_DWORD *)(v3 + 16) = v11;
      }
    }
    else
    {
      sub_1000134EC(v3, a1);
    }
  }
  else
  {
    puts("Unable to create test case statistic with NULL initial result");
    return 0;
  }
  return v3;
}

uint64_t sub_1000134EC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  void *v6;
  uint64_t metrics;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *name;
  double value;

  *(_DWORD *)(a1 + 16) = 1;
  *(_DWORD *)(a1 + 12) = !embeddedtest_test_case_result_did_pass(a2);
  result = embeddedtest_test_case_result_get_metric_count(a2);
  *(_DWORD *)(a1 + 32) = result;
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = malloc_type_calloc(result, 8uLL, 0x2004093837F09uLL);
    *(_QWORD *)(a1 + 40) = v6;
    if (!v6)
      sub_100017D58();
    metrics = embeddedtest_test_case_result_get_metrics(a2);
    v8 = 0;
    v9 = 8 * v5;
    do
    {
      v10 = *(_QWORD *)(metrics + v8);
      name = (const char *)embeddedtest_test_case_metric_get_name(v10);
      value = embeddedtest_test_case_metric_get_value(v10);
      result = (uint64_t)embeddedtest_test_case_statistic_metric_create(name, value);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + v8) = result;
      v8 += 8;
    }
    while (v9 != v8);
  }
  return result;
}

void embeddedtest_test_case_statistic_free(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    sub_1000135FC((uint64_t)a1);
    sub_100013654((uint64_t)a1);
    free(a1);
  }
}

void sub_1000135FC(uint64_t a1)
{
  unint64_t v2;
  void *v3;

  if (*(_DWORD *)(a1 + 32))
  {
    v2 = 0;
    do
      embeddedtest_test_case_statistic_metric_free(*(void ***)(*(_QWORD *)(a1 + 40) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
  }
  v3 = *(void **)(a1 + 40);
  if (v3)
    free(v3);
}

void sub_100013654(uint64_t a1)
{
  unint64_t v2;
  void *v3;

  if (*(_DWORD *)(a1 + 20))
  {
    v2 = 0;
    do
      embeddedtest_test_case_statistic_bucket_free(*(void ***)(*(_QWORD *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 20));
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
    free(v3);
}

void *embeddedtest_test_case_statistic_copy_json_representation(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *json_string_from_array;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;

  v17 = 0;
  json_string_from_array = embeddedtest_create_json_string_from_array(*(_QWORD **)(a1 + 24), *(_DWORD *)(a1 + 20), "%s,%s", (uint64_t (*)(_QWORD))embeddedtest_test_case_statistic_bucket_copy_json_representation);
  if ((*(_BYTE *)(a1 + 8) & 0xFE) == 2)
  {
    embeddedtest_asprintf(&v17, "{\"Name\":\"%s\",\"Instances\":%d,\"Buckets\":{%s}}", v2, v3, v4, v5, v6, v7, *(_QWORD *)a1);
    v9 = json_string_from_array;
    if (!json_string_from_array)
      return v17;
    goto LABEL_7;
  }
  v9 = embeddedtest_create_json_string_from_array(*(_QWORD **)(a1 + 40), *(_DWORD *)(a1 + 32), "%s,%s", (uint64_t (*)(_QWORD))embeddedtest_test_case_statistic_metric_copy_json_representation);
  embeddedtest_asprintf(&v17, "{\"Name\":\"%s\",\"Instances\":%d,\"Failure Count\":%d,\"Failure Buckets\":{%s},\"Metrics\":[%s]}", v10, v11, v12, v13, v14, v15, *(_QWORD *)a1);
  if (json_string_from_array)
    free(json_string_from_array);
  if (v9)
LABEL_7:
    free(v9);
  return v17;
}

uint64_t embeddedtest_test_case_statistic_add_result(uint64_t a1, uint64_t a2)
{
  void **v3;
  uint64_t v4;

  v3 = (void **)embeddedtest_test_case_statistic_create(a2);
  v4 = embeddedtest_test_case_statistic_merge(a1, (uint64_t)v3);
  embeddedtest_test_case_statistic_free(v3);
  return v4;
}

uint64_t embeddedtest_test_case_statistic_merge(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10001385C(a1, a2);
  if (!(_DWORD)v4)
  {
    sub_1000138C4(a1, a2);
    sub_100013A18(a1, a2);
    if ((*(_BYTE *)(a1 + 8) & 0xFE) != 2)
      *(_DWORD *)(a1 + 12) += *(_DWORD *)(a2 + 12);
    *(_DWORD *)(a1 + 16) += *(_DWORD *)(a2 + 16);
  }
  return v4;
}

uint64_t sub_10001385C(uint64_t a1, uint64_t a2)
{
  const char *v4;

  if (!strcmp(*(const char **)a1, *(const char **)a2))
  {
    if (*(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8))
      return 0;
    v4 = "Cannot merge statistics with mismatching classes";
  }
  else
  {
    v4 = "Cannot merge statistics with mismatching names";
  }
  return embeddedtest_error_get_error(1, v4);
}

uint64_t sub_1000138C4(uint64_t a1, uint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double value;
  uint64_t v16;
  void *v17;
  size_t count;

  LODWORD(count) = 0;
  v4 = (char *)sub_100013D00(a1, a2, &count);
  v5 = v4;
  v6 = count;
  if (!(_DWORD)count)
  {
    free(v4);
    v8 = 0;
    goto LABEL_16;
  }
  v7 = (char *)malloc_type_calloc(count, 8uLL, 0x2004093837F09uLL);
  if (!v7)
    sub_100017D90();
  v8 = v7;
  v9 = 0;
  v10 = 8 * v6;
  do
  {
    v11 = *(const char **)&v5[v9];
    v12 = sub_100013E38(a1, v11);
    v13 = sub_100013E38(a2, v11);
    v14 = v13;
    if (v12)
    {
      value = (double)embeddedtest_test_case_statistic_bucket_get_value(v12);
      if (!v14)
        goto LABEL_7;
LABEL_6:
      value = value + (double)embeddedtest_test_case_statistic_bucket_get_value(v14);
      goto LABEL_7;
    }
    value = 0.0;
    if (v13)
      goto LABEL_6;
LABEL_7:
    *(_QWORD *)&v8[v9] = embeddedtest_test_case_statistic_bucket_create(v11, value);
    v9 += 8;
  }
  while (v10 != v9);
  v16 = 0;
  do
  {
    v17 = *(void **)&v5[v16];
    if (v17)
      free(v17);
    v16 += 8;
  }
  while (v10 != v16);
  free(v5);
  sub_100013654(a1);
LABEL_16:
  *(_QWORD *)(a1 + 24) = v8;
  *(_DWORD *)(a1 + 20) = v6;
  return 0;
}

uint64_t sub_100013A18(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  const char *name;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  if (*(_DWORD *)(a2 + 32))
  {
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a2 + 40) + 8 * v4);
      name = (const char *)embeddedtest_test_case_statistic_metric_get_name(v5);
      v7 = sub_100013EA0(a1, name);
      if (v7)
      {
        embeddedtest_test_case_statistic_metric_merge(v7, v5);
      }
      else
      {
        embeddedtest_test_case_statistic_metric_copy(v5);
        if (!v8)
          sub_100017DC8();
        v9 = v8;
        v10 = malloc_type_realloc(*(void **)(a1 + 40), 8 * (*(_DWORD *)(a1 + 32) + 1), 0x2004093837F09uLL);
        *(_QWORD *)(a1 + 40) = v10;
        if (!v10)
          sub_100017E00();
        v11 = *(unsigned int *)(a1 + 32);
        v10[v11] = v9;
        *(_DWORD *)(a1 + 32) = v11 + 1;
      }
      ++v4;
    }
    while (v4 < *(unsigned int *)(a2 + 32));
  }
  return 0;
}

uint64_t embeddedtest_test_case_statistic_get_name(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t embeddedtest_test_case_statistic_get_failure_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

_QWORD *embeddedtest_test_case_statistic_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  unsigned int v8;
  void *v9;
  unint64_t v10;
  unsigned int v11;
  void *v12;
  unint64_t v13;

  v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040765C718DuLL);
  if (!v4)
    sub_100017E38();
  v5 = v4;
  *v4 = embeddedtest_create_string_from_buffer(a1, a2);
  v6 = *a2;
  v7 = *(_BYTE *)(a1 + v6);
  *a2 = v6 + 1;
  *((_BYTE *)v5 + 8) = v7;
  *((_DWORD *)v5 + 4) = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 3) = embeddedtest_deserialize_count(a1, a2);
  v8 = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 5) = v8;
  v9 = malloc_type_calloc(v8, 8uLL, 0x2004093837F09uLL);
  v5[3] = v9;
  if (!v9)
    sub_100017E70();
  if (*((_DWORD *)v5 + 5))
  {
    v10 = 0;
    do
      *(_QWORD *)(v5[3] + 8 * v10++) = embeddedtest_test_case_statistic_bucket_create_from_buffer(a1, a2);
    while (v10 < *((unsigned int *)v5 + 5));
  }
  v11 = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 8) = v11;
  v12 = malloc_type_calloc(v11, 8uLL, 0x2004093837F09uLL);
  v5[5] = v12;
  if (!v12)
    sub_100017EA8();
  if (*((_DWORD *)v5 + 8))
  {
    v13 = 0;
    do
      *(_QWORD *)(v5[5] + 8 * v13++) = embeddedtest_test_case_statistic_metric_create_from_buffer(a1, a2);
    while (v13 < *((unsigned int *)v5 + 8));
  }
  return v5;
}

uint64_t embeddedtest_test_case_statistic_get_size(uint64_t a1)
{
  unint64_t v2;
  int v3;
  int v4;
  unint64_t v5;
  int v6;

  if (*(_DWORD *)(a1 + 20))
  {
    v2 = 0;
    v3 = 0;
    do
      v3 += embeddedtest_test_case_statistic_bucket_get_size(*(const char ***)(*(_QWORD *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 20));
    v4 = v3 + 21;
  }
  else
  {
    v4 = 21;
  }
  if (*(_DWORD *)(a1 + 32))
  {
    v5 = 0;
    v6 = 0;
    do
      v6 += embeddedtest_test_case_statistic_metric_get_size(*(const char ***)(*(_QWORD *)(a1 + 40) + 8 * v5++));
    while (v5 < *(unsigned int *)(a1 + 32));
  }
  else
  {
    v6 = 0;
  }
  return v4 + v6 + strlen(*(const char **)a1);
}

_QWORD *sub_100013D00(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  const char *name;
  char *v12;
  unint64_t v13;
  const char *v14;
  char *v15;
  char *v16;
  _QWORD *v17;

  v6 = *(_DWORD *)(a1 + 20);
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  v8 = malloc_type_calloc(v7, 8uLL, 0x10040436913F5uLL);
  if (!v8)
    sub_100017EE0();
  v9 = v8;
  if (*(_DWORD *)(a1 + 20))
  {
    v10 = 0;
    do
    {
      name = (const char *)embeddedtest_test_case_statistic_bucket_get_name(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * v10));
      v12 = strdup(name);
      if (!v12)
        sub_100017F88();
      v9[v10++] = v12;
    }
    while (v10 < *(unsigned int *)(a1 + 20));
  }
  else
  {
    LODWORD(v10) = 0;
  }
  if (*(_DWORD *)(a2 + 20))
  {
    v13 = 0;
    do
    {
      v14 = (const char *)embeddedtest_test_case_statistic_bucket_get_name(*(_QWORD *)(*(_QWORD *)(a2 + 24) + 8 * v13));
      if (!sub_100013E38(a1, v14))
      {
        v15 = strdup(v14);
        if (!v15)
          sub_100017F18();
        v16 = v15;
        v17 = malloc_type_realloc(v9, 8 * (v10 + 1), 0x10040436913F5uLL);
        if (!v17)
          sub_100017F50();
        v9 = v17;
        v17[v10] = v16;
        LODWORD(v10) = v10 + 1;
      }
      ++v13;
    }
    while (v13 < *(unsigned int *)(a2 + 20));
  }
  *a3 = v10;
  return v9;
}

uint64_t sub_100013E38(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *name;

  if (!*(_DWORD *)(a1 + 20))
    return 0;
  v4 = 0;
  while (1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * v4);
    name = (const char *)embeddedtest_test_case_statistic_bucket_get_name(v5);
    if (!strcmp(name, a2))
      break;
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 20))
      return 0;
  }
  return v5;
}

uint64_t sub_100013EA0(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *name;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v4 = 0;
  while (1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4);
    name = (const char *)embeddedtest_test_case_statistic_metric_get_name(v5);
    if (!strcmp(a2, name))
      break;
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 32))
      return 0;
  }
  return v5;
}

_QWORD *embeddedtest_results_create(int a1)
{
  char v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if ((a1 - 1) >= 2)
  {
    printf("Impossible results class %d\n", a1);
    return 0;
  }
  else
  {
    v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x1080040304EF5A4uLL);
    if (!v2)
      sub_100017FC0();
    v3 = v2;
    v4 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    v3[2] = v4;
    if (!v4)
      sub_100017FF8();
    *(_QWORD *)v3[2] = embeddedtest_info_pair_create("Embedded Test Version", "23");
    *((_DWORD *)v3 + 6) = 1;
    v5 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    *v3 = v5;
    if (!v5)
      sub_100018030();
    *((_DWORD *)v3 + 2) = 0;
    v6 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    v3[4] = v6;
    if (!v6)
      sub_100018068();
    *((_DWORD *)v3 + 10) = 0;
    *((_BYTE *)v3 + 44) = v1;
  }
  return v3;
}

void embeddedtest_results_free(_QWORD *a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  if (a1)
  {
    if (*((_DWORD *)a1 + 6))
    {
      v2 = 0;
      do
        embeddedtest_info_pair_free(*(void ***)(a1[2] + 8 * v2++));
      while (v2 < *((unsigned int *)a1 + 6));
    }
    v3 = (void *)a1[2];
    if (v3)
      free(v3);
    if (*((_DWORD *)a1 + 2))
    {
      v4 = 0;
      do
        embeddedtest_issue_aggregate_free(*(void ***)(*a1 + 8 * v4++));
      while (v4 < *((unsigned int *)a1 + 2));
    }
    if (*a1)
      free((void *)*a1);
    if (*((_DWORD *)a1 + 10))
    {
      v5 = 0;
      do
        embeddedtest_test_case_statistic_free(*(void ***)(a1[4] + 8 * v5++));
      while (v5 < *((unsigned int *)a1 + 10));
    }
    v6 = (void *)a1[4];
    if (v6)
      free(v6);
    free(a1);
  }
}

void *embeddedtest_results_copy_json_representation(uint64_t a1)
{
  char *json_string_from_array;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;

  json_string_from_array = embeddedtest_create_json_string_from_array(*(_QWORD **)(a1 + 16), *(_DWORD *)(a1 + 24), "%s,%s", (uint64_t (*)(_QWORD))embeddedtest_info_pair_copy_json_representation);
  v3 = embeddedtest_create_json_string_from_array(*(_QWORD **)a1, *(_DWORD *)(a1 + 8), "%s,%s", (uint64_t (*)(_QWORD))embeddedtest_issue_aggregate_copy_json_representation);
  v4 = embeddedtest_create_json_string_from_array(*(_QWORD **)(a1 + 32), *(_DWORD *)(a1 + 40), "%s,%s", (uint64_t (*)(_QWORD))embeddedtest_test_case_statistic_copy_json_representation);
  v12 = 0;
  embeddedtest_asprintf(&v12, "{\"Info\":{%s},\"Issues\":[%s],\"Test Cases\":[%s]}", v5, v6, v7, v8, v9, v10, (char)json_string_from_array);
  if (json_string_from_array)
    free(json_string_from_array);
  if (v3)
    free(v3);
  if (v4)
    free(v4);
  return v12;
}

_BYTE *embeddedtest_results_create_from_resume_data(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unsigned int v4;
  void *v5;
  unint64_t v6;
  unsigned int v7;
  void *v8;
  unint64_t v9;
  unsigned int v10;
  void *v11;
  unint64_t v12;
  int v14;

  v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x1080040304EF5A4uLL);
  if (!v2)
    sub_1000180A0();
  v3 = v2;
  v14 = 0;
  embeddedtest_deserialize_size(a1, &v14);
  v3[44] = embeddedtest_deserialize_results_class(a1, &v14);
  v4 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 6) = v4;
  v5 = malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
  *((_QWORD *)v3 + 2) = v5;
  if (!v5)
    sub_1000180D8();
  if (*((_DWORD *)v3 + 6))
  {
    v6 = 0;
    do
      *(_QWORD *)(*((_QWORD *)v3 + 2) + 8 * v6++) = embeddedtest_info_pair_create_from_buffer(a1, &v14);
    while (v6 < *((unsigned int *)v3 + 6));
  }
  v7 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 2) = v7;
  v8 = malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
  *(_QWORD *)v3 = v8;
  if (!v8)
    sub_100018110();
  if (*((_DWORD *)v3 + 2))
  {
    v9 = 0;
    do
      *(_QWORD *)(*(_QWORD *)v3 + 8 * v9++) = embeddedtest_issue_aggregate_create_from_buffer(a1, &v14);
    while (v9 < *((unsigned int *)v3 + 2));
  }
  v10 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 10) = v10;
  v11 = malloc_type_calloc(v10, 8uLL, 0x2004093837F09uLL);
  *((_QWORD *)v3 + 4) = v11;
  if (!v11)
    sub_100018148();
  if (*((_DWORD *)v3 + 10))
  {
    v12 = 0;
    do
      *(_QWORD *)(*((_QWORD *)v3 + 4) + 8 * v12++) = embeddedtest_test_case_statistic_create_from_buffer(a1, &v14);
    while (v12 < *((unsigned int *)v3 + 10));
  }
  return v3;
}

uint64_t embeddedtest_results_get_size(uint64_t a1)
{
  unint64_t v2;
  int v3;
  int v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  int v8;

  if (*(_DWORD *)(a1 + 24))
  {
    v2 = 0;
    v3 = 0;
    do
      v3 += embeddedtest_info_pair_get_size(*(const char ***)(*(_QWORD *)(a1 + 16) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 24));
    v4 = v3 + 17;
  }
  else
  {
    v4 = 17;
  }
  if (*(_DWORD *)(a1 + 8))
  {
    v5 = 0;
    v6 = 0;
    do
      v6 += embeddedtest_issue_aggregate_get_size(*(const char ***)(*(_QWORD *)a1 + 8 * v5++));
    while (v5 < *(unsigned int *)(a1 + 8));
  }
  else
  {
    v6 = 0;
  }
  if (*(_DWORD *)(a1 + 40))
  {
    v7 = 0;
    v8 = 0;
    do
      v8 += embeddedtest_test_case_statistic_get_size(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v7++));
    while (v7 < *(unsigned int *)(a1 + 40));
  }
  else
  {
    v8 = 0;
  }
  return (v4 + v6 + v8);
}

uint64_t embeddedtest_results_test_case_print(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  const char *v4;
  const char *name;
  const char *v6;

  if (!a1)
    return embeddedtest_error_get_error(1, "Cannot print tests cases for NULL result to syslog");
  if (*(_DWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v2);
      if (embeddedtest_test_case_statistic_get_failure_count(v3))
        v4 = "[Fail]";
      else
        v4 = "[Pass]";
      name = (const char *)embeddedtest_results_get_name(a1);
      v6 = (const char *)embeddedtest_test_case_statistic_get_name(v3);
      printf("%s %s/%s\n", v4, name, v6);
      ++v2;
    }
    while (v2 < *(unsigned int *)(a1 + 40));
  }
  return 0;
}

uint64_t embeddedtest_results_get_name(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *key;

  if (!a1 || !*(_DWORD *)(a1 + 24))
    return 0;
  v2 = 0;
  while (1)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v2);
    key = (const char *)embeddedtest_info_pair_get_key(v3);
    if (!strcmp("Name", key))
      break;
    if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 24))
      return 0;
  }
  return embeddedtest_info_pair_get_value(v3);
}

uint64_t embeddedtest_results_add_test_case(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const char *name;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *__s1;

  v4 = embeddedtest_test_case_result_check_validity(a2);
  name = (const char *)embeddedtest_test_case_result_get_name(a2);
  if ((_DWORD)v4)
  {
    embeddedtest_log_error(v4);
    v6 = (void **)embeddedtest_issue_create();
    __s1 = 0;
    embeddedtest_asprintf((void **)&__s1, "Had to drop an instance of %s (%d)", v7, v8, v9, v10, v11, v12, (char)name);
    embeddedtest_issue_set_reason(v6, __s1);
    if (__s1)
      free(__s1);
    v13 = time(0);
    embeddedtest_issue_set_time((uint64_t)v6, v13);
    embeddedtest_issue_set_class((uint64_t)v6, 3);
    embeddedtest_issue_set_group((uint64_t)v6, "libembeddedtest");
    embeddedtest_results_add_issue(a1, (uint64_t)v6);
    embeddedtest_issue_free(v6);
    return v4;
  }
  if (*(_BYTE *)(a1 + 44) == 1 && embeddedtest_test_case_result_is_histogram(a2))
    return embeddedtest_error_get_error(3, "Unit test results only accept pass fail test cases");
  v15 = sub_10001488C(a1, name);
  if (!v15)
  {
    v16 = embeddedtest_test_case_statistic_create(a2);
    if (!v16)
      sub_100018180();
    v17 = v16;
    v18 = malloc_type_realloc(*(void **)(a1 + 32), 8 * (*(_DWORD *)(a1 + 40) + 1), 0x2004093837F09uLL);
    *(_QWORD *)(a1 + 32) = v18;
    if (!v18)
      sub_1000181B8();
    v4 = 0;
    v19 = *(unsigned int *)(a1 + 40);
    v18[v19] = v17;
    *(_DWORD *)(a1 + 40) = v19 + 1;
    return v4;
  }
  if (*(_BYTE *)(a1 + 44) == 1)
    return embeddedtest_error_get_error(1, "Unit test results cannot accept two instances of the same test case");
  else
    return embeddedtest_test_case_statistic_add_result(v15, a2);
}

uint64_t embeddedtest_results_add_issue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  char **v16;
  char **v17;
  _QWORD *v18;
  uint64_t v19;
  char *__s1;

  v4 = embeddedtest_issue_check_validity(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void **)embeddedtest_issue_create();
    __s1 = 0;
    embeddedtest_asprintf((void **)&__s1, "Had to drop an issue (%d)", v7, v8, v9, v10, v11, v12, v5);
    embeddedtest_issue_set_reason(v6, __s1);
    if (__s1)
      free(__s1);
    v13 = time(0);
    embeddedtest_issue_set_time((uint64_t)v6, v13);
    embeddedtest_issue_set_class((uint64_t)v6, 3);
    embeddedtest_issue_set_group((uint64_t)v6, "libembeddedtest");
    embeddedtest_results_add_issue(a1, v6);
    embeddedtest_issue_free(v6);
    return v5;
  }
  v15 = sub_1000148F8(a1, a2);
  if (!v15)
  {
    v16 = embeddedtest_issue_aggregate_create(a2);
    if (!v16)
      sub_1000181F0();
    v17 = v16;
    v18 = malloc_type_realloc(*(void **)a1, 8 * (*(_DWORD *)(a1 + 8) + 1), 0x2004093837F09uLL);
    *(_QWORD *)a1 = v18;
    if (!v18)
      sub_100018228();
    v5 = 0;
    v19 = *(unsigned int *)(a1 + 8);
    v18[v19] = v17;
    *(_DWORD *)(a1 + 8) = v19 + 1;
    return v5;
  }
  return embeddedtest_issue_aggregate_merge_with_issue(v15, a2);
}

uint64_t sub_10001488C(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *name;

  if (!*(_DWORD *)(a1 + 40))
    return 0;
  v4 = 0;
  while (1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v4);
    name = (const char *)embeddedtest_test_case_statistic_get_name(v5);
    if (!strcmp(a2, name))
      break;
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 40))
      return 0;
  }
  return v5;
}

uint64_t sub_1000148F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *reason;
  const char *group;
  int v8;
  const char *v9;
  const char *v10;
  int v11;

  if (!*(_DWORD *)(a1 + 8))
    return 0;
  v4 = 0;
  while (1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)a1 + 8 * v4);
    reason = (const char *)embeddedtest_issue_get_reason(a2);
    group = (const char *)embeddedtest_issue_get_group(a2);
    v8 = embeddedtest_issue_get_class(a2);
    v9 = (const char *)embeddedtest_issue_aggregate_get_reason(v5);
    v10 = (const char *)embeddedtest_issue_aggregate_get_group(v5);
    v11 = embeddedtest_issue_aggregate_get_class(v5);
    if (!strcmp(reason, v9) && !strcmp(group, v10) && v8 == v11)
      break;
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 8))
      return 0;
  }
  return v5;
}

BOOL embeddedtest_results_did_pass(uint64_t a1)
{
  _BOOL8 result;
  unint64_t v3;
  int failure_count;

  if (*(_BYTE *)(a1 + 44) != 1 || *(_DWORD *)(a1 + 8))
    return 0;
  if (!*(_DWORD *)(a1 + 40))
    return 1;
  v3 = 0;
  do
  {
    failure_count = embeddedtest_test_case_statistic_get_failure_count(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v3));
    result = failure_count == 0;
    if (failure_count)
      break;
    ++v3;
  }
  while (v3 < *(unsigned int *)(a1 + 40));
  return result;
}

double *embeddedtest_test_case_metric_create(const char *a1, double a2)
{
  double *v4;
  double *v5;
  char *v6;

  if (a1)
  {
    v4 = (double *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040FDD9F14CuLL);
    if (!v4)
      sub_100018260();
    v5 = v4;
    v6 = strdup(a1);
    *(_QWORD *)v5 = v6;
    if (!v6)
      sub_100018298();
    v5[1] = a2;
  }
  else
  {
    printf("Unable to create a test case metric with a NULL name...%s\n", 0);
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_metric_free(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    free(a1);
  }
}

uint64_t embeddedtest_test_case_metric_get_name(uint64_t a1)
{
  return *(_QWORD *)a1;
}

double embeddedtest_test_case_metric_get_value(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

double embeddedtest_deserialize_metric_value(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  double result;

  v2 = *a2;
  result = *(double *)(a1 + v2);
  *a2 = v2 + 8;
  return result;
}

_BYTE *embeddedtest_issue_create()
{
  _BYTE *result;

  result = malloc_type_calloc(1uLL, 0x20uLL, 0x101004089121A46uLL);
  if (!result)
    sub_1000182D0();
  result[24] = 3;
  *((_QWORD *)result + 2) = 0;
  *(_QWORD *)result = 0;
  *((_DWORD *)result + 2) = 0;
  return result;
}

void embeddedtest_issue_free(void **a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    v3 = a1[2];
    if (v3)
      free(v3);
    free(a1);
  }
}

char *embeddedtest_convert_error_class_to_string(char a1)
{
  if ((a1 - 1) > 3u)
    return 0;
  else
    return (&off_100020710)[(char)(a1 - 1)];
}

uint64_t embeddedtest_issue_set_reason(void **a1, char *__s1)
{
  void *v4;
  char *v5;
  const char *v7;

  if (!a1)
  {
    v7 = "Cannot set the reason for a NULL issue";
    return embeddedtest_error_get_error(1, v7);
  }
  if (!__s1)
  {
    v7 = "Cannot set issue reason to NULL";
    return embeddedtest_error_get_error(1, v7);
  }
  v4 = *a1;
  if (v4)
    free(v4);
  v5 = strdup(__s1);
  *a1 = v5;
  if (!v5)
    sub_100018308();
  return 0;
}

uint64_t embeddedtest_issue_set_group(uint64_t a1, char *__s1)
{
  void *v4;
  char *v5;
  const char *v7;

  if (!a1)
  {
    v7 = "Cannot set the group for a NULL issue";
    return embeddedtest_error_get_error(1, v7);
  }
  if (!__s1)
  {
    v7 = "Cannot set issue group to NULL";
    return embeddedtest_error_get_error(1, v7);
  }
  v4 = *(void **)(a1 + 16);
  if (v4)
    free(v4);
  v5 = strdup(__s1);
  *(_QWORD *)(a1 + 16) = v5;
  if (!v5)
    sub_100018340();
  return 0;
}

uint64_t embeddedtest_issue_set_time(uint64_t a1, int a2)
{
  const char *v3;

  if (a1)
  {
    if (a2)
    {
      *(_DWORD *)(a1 + 8) = a2;
      return 0;
    }
    v3 = "Cannot set issue time to 0";
  }
  else
  {
    v3 = "Cannot set the time for a NULL issue";
  }
  return embeddedtest_error_get_error(1, v3);
}

uint64_t embeddedtest_issue_set_class(uint64_t a1, int a2)
{
  const char *v3;

  if (a1)
  {
    if ((a2 - 1) < 4)
    {
      *(_BYTE *)(a1 + 24) = a2;
      return 0;
    }
    v3 = "Error class requested does not match anything in enum";
  }
  else
  {
    v3 = "Cannot set the class for a NULL issue";
  }
  return embeddedtest_error_get_error(1, v3);
}

uint64_t embeddedtest_issue_get_reason(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t embeddedtest_issue_get_group(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t embeddedtest_issue_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t embeddedtest_issue_check_validity(uint64_t a1)
{
  const char *v2;
  uint64_t v3;

  if (!a1)
  {
    v2 = "Unable to check validity of NULL issue";
    v3 = 1;
    return embeddedtest_error_get_error(v3, v2);
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = "Issue must have a group";
LABEL_11:
    v3 = 2;
    return embeddedtest_error_get_error(v3, v2);
  }
  if (!*(_QWORD *)a1)
  {
    v2 = "Issue must have a reason";
    goto LABEL_11;
  }
  if (*(int *)(a1 + 8) <= 0)
    return embeddedtest_error_get_error(3, "Issue cannot have a time of less than or equal to 0");
  else
    return 0;
}

char **embeddedtest_issue_aggregate_create(uint64_t a1)
{
  char **v2;
  char **v3;
  const char *reason;
  char *v5;
  const char *group;
  char *v7;

  if (a1)
  {
    v2 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x101004089121A46uLL);
    if (!v2)
      sub_100018378();
    v3 = v2;
    reason = (const char *)embeddedtest_issue_get_reason(a1);
    v5 = strdup(reason);
    *v3 = v5;
    if (!v5)
      sub_1000183B0();
    group = (const char *)embeddedtest_issue_get_group(a1);
    v7 = strdup(group);
    v3[2] = v7;
    if (!v7)
      sub_1000183E8();
    *((_BYTE *)v3 + 24) = embeddedtest_issue_get_class(a1);
    *((_DWORD *)v3 + 2) = 1;
  }
  else
  {
    puts("embeddedtest_issue_t object is required to create an issue aggregate");
    return 0;
  }
  return v3;
}

void embeddedtest_issue_aggregate_free(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = a1[2];
    if (v2)
      free(v2);
    if (*a1)
      free(*a1);
    free(a1);
  }
}

uint64_t embeddedtest_issue_aggregate_get_reason(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t embeddedtest_issue_aggregate_get_group(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t embeddedtest_issue_aggregate_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

void *embeddedtest_issue_aggregate_copy_json_representation(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  embeddedtest_convert_error_class_to_string(*(_BYTE *)(a1 + 24));
  v9 = 0;
  embeddedtest_asprintf(&v9, "{\"Group\":\"%s\",\"Reason\":\"%s\",\"Class\":\"%s\",\"Count\":%d}", v2, v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 16));
  return v9;
}

uint64_t embeddedtest_issue_aggregate_merge_with_issue(uint64_t a1, uint64_t a2)
{
  void **v3;
  uint64_t v4;

  v3 = (void **)embeddedtest_issue_aggregate_create(a2);
  v4 = embeddedtest_issue_aggregate_merge_with_aggregate(a1, (uint64_t)v3);
  embeddedtest_issue_aggregate_free(v3);
  return v4;
}

uint64_t embeddedtest_issue_aggregate_merge_with_aggregate(uint64_t a1, uint64_t a2)
{
  const char *v4;

  if (!strcmp(*(const char **)a1, *(const char **)a2))
  {
    if (!strcmp(*(const char **)(a1 + 16), *(const char **)(a2 + 16)))
    {
      if (*(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24))
      {
        *(_DWORD *)(a1 + 8) += *(_DWORD *)(a2 + 8);
        return 0;
      }
      v4 = "Cannot merge issues with different classes";
    }
    else
    {
      v4 = "Cannot merge issues with different groups";
    }
  }
  else
  {
    v4 = "Cannot merge issues with different reasons";
  }
  return embeddedtest_error_get_error(1, v4);
}

_QWORD *embeddedtest_issue_aggregate_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;

  v4 = malloc_type_calloc(1uLL, 0x20uLL, 0x101004089121A46uLL);
  if (!v4)
    sub_100018420();
  v5 = v4;
  *v4 = embeddedtest_create_string_from_buffer(a1, a2);
  v5[2] = embeddedtest_create_string_from_buffer(a1, a2);
  *((_DWORD *)v5 + 2) = embeddedtest_deserialize_count(a1, a2);
  v6 = *a2;
  v7 = *(_BYTE *)(a1 + v6);
  *a2 = v6 + 1;
  *((_BYTE *)v5 + 24) = v7;
  return v5;
}

uint64_t embeddedtest_issue_aggregate_get_size(const char **a1)
{
  int v2;

  v2 = strlen(*a1);
  return v2 + strlen(a1[2]) + 13;
}

uint64_t embeddedtest_deserialize_size(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a2;
  result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_deserialize_count(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a2;
  result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

_BYTE *embeddedtest_create_string_from_buffer(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  size_t v3;
  _BYTE *v6;
  _BYTE *v7;

  v2 = *a2;
  v3 = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  if (v3 >= 0x2711)
    sub_100018458();
  v6 = malloc_type_calloc(1uLL, v3 + 1, 0x2909408uLL);
  if (!v6)
    sub_100018470();
  v7 = v6;
  memcpy(v6, (const void *)(a1 + *a2), v3);
  v7[v3] = 0;
  *a2 += v3;
  return v7;
}

uint64_t embeddedtest_deserialize_flags(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a2;
  result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_deserialize_results_class(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a2;
  result = *(unsigned __int8 *)(a1 + v2);
  *a2 = v2 + 1;
  return result;
}

uint64_t embeddedtest_deserialize_test_suite_class(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a2;
  result = *(unsigned __int8 *)(a1 + v2);
  *a2 = v2 + 1;
  return result;
}

uint64_t embeddedtest_deserialize_BOOL(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  char v3;

  v2 = *a2;
  v3 = *(_BYTE *)(a1 + v2);
  *a2 = v2 + 1;
  return v3 & 1;
}

uint64_t embeddedtest_deserialize_time(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a2;
  result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_test_suite_get_name(uint64_t a1)
{
  return *(_QWORD *)a1;
}

unsigned int *embeddedtest_test_suite_create_from_resume_data(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  void *v5;
  unint64_t v6;
  int v8;

  v2 = (unsigned int *)malloc_type_calloc(1uLL, 0x38uLL, 0x109004088103722uLL);
  if (!v2)
    sub_1000184A8();
  v3 = v2;
  v8 = 0;
  embeddedtest_deserialize_size(a1, &v8);
  *(_QWORD *)v3 = embeddedtest_create_string_from_buffer(a1, &v8);
  v4 = embeddedtest_deserialize_count(a1, &v8);
  v3[8] = v4;
  v5 = malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
  *((_QWORD *)v3 + 3) = v5;
  if (!v5)
    sub_1000184E0();
  if (v3[8])
  {
    v6 = 0;
    do
      *(_QWORD *)(*((_QWORD *)v3 + 3) + 8 * v6++) = embeddedtest_test_case_create_from_buffer(a1, &v8);
    while (v6 < v3[8]);
  }
  *((_BYTE *)v3 + 36) = embeddedtest_deserialize_test_suite_class(a1, &v8);
  *((_BYTE *)v3 + 37) = embeddedtest_deserialize_BOOL(a1, &v8);
  v3[10] = embeddedtest_deserialize_count(a1, &v8);
  v3[11] = embeddedtest_deserialize_time(a1, &v8);
  *((_BYTE *)v3 + 48) = 0;
  return v3;
}

uint64_t embeddedtest_test_suite_get_size(uint64_t a1)
{
  unint64_t v2;
  int v3;
  int v4;

  if (*(_DWORD *)(a1 + 32))
  {
    v2 = 0;
    v3 = 0;
    do
      v3 += embeddedtest_test_case_get_size(*(const char ***)(*(_QWORD *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
    v4 = v3 + 22;
  }
  else
  {
    v4 = 22;
  }
  return v4 + strlen(*(const char **)a1);
}

uint64_t embeddedtest_test_suite_get_test_cases(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 32);
  return *(_QWORD *)(a1 + 24);
}

_DWORD *embeddedtest_test_case_statistic_bucket_create(const char *a1, int a2)
{
  _DWORD *v4;
  _DWORD *v5;
  char *v6;

  if (a1)
  {
    v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
    if (!v4)
      sub_100018518();
    v5 = v4;
    v6 = strdup(a1);
    *(_QWORD *)v5 = v6;
    if (!v6)
      sub_100018550();
    v5[2] = a2;
  }
  else
  {
    puts("Unable to create a statistic bucket with a null name");
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_statistic_bucket_free(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    free(a1);
  }
}

uint64_t embeddedtest_test_case_statistic_bucket_get_value(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t embeddedtest_test_case_statistic_bucket_get_name(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void *embeddedtest_test_case_statistic_bucket_copy_json_representation(const char **a1)
{
  char *v1;
  int v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;

  v11 = 0;
  v1 = (char *)*a1;
  v2 = strlen(*a1);
  v3 = embeddedtest_escape_json_string(v1, v2);
  embeddedtest_asprintf(&v11, "\"%s\":%d", v4, v5, v6, v7, v8, v9, (char)v3);
  if (v3)
    free(v3);
  return v11;
}

_QWORD *embeddedtest_test_case_statistic_bucket_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  if (!v4)
    sub_100018588();
  v5 = v4;
  *v4 = embeddedtest_create_string_from_buffer(a1, a2);
  *((_DWORD *)v5 + 2) = embeddedtest_deserialize_count(a1, a2);
  return v5;
}

uint64_t embeddedtest_test_case_statistic_bucket_get_size(const char **a1)
{
  return strlen(*a1) + 8;
}

uint64_t embeddedtest_error_get_error(uint64_t a1, const char *a2)
{
  const char *v3;

  if ((unsigned __int16)(a1 - 1) > 3u)
    v3 = "Unknown";
  else
    v3 = (&off_100020730)[(__int16)(a1 - 1)];
  printf("Error seen...%s - %s\n", v3, a2);
  return a1;
}

uint64_t embeddedtest_log_error(__int16 a1)
{
  const char *v1;

  if ((unsigned __int16)(a1 - 1) > 3u)
    v1 = "Unknown";
  else
    v1 = (&off_100020730)[(__int16)(a1 - 1)];
  return printf("Error: %s\n", v1);
}

_QWORD *embeddedtest_test_case_create(const char *a1, const char *a2, uint64_t a3, uint64_t a4, int a5)
{
  _QWORD *v10;
  _QWORD *v11;

  if (a1 && a2)
  {
    v10 = malloc_type_calloc(1uLL, 0x28uLL, 0x109004054B0866CuLL);
    if (!v10)
      sub_1000185C0();
    v11 = v10;
    *v10 = strdup(a1);
    v11[1] = strdup(a2);
    v11[2] = a3;
    v11[3] = a4;
    *((_DWORD *)v11 + 8) = a5;
    *((_BYTE *)v11 + 36) = 0;
  }
  else
  {
    printf("Test cases require a name and category (name = %s, category = %s)\n", a1, a2);
    return 0;
  }
  return v11;
}

uint64_t embeddedtest_test_case_get_name(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t embeddedtest_test_case_get_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

_QWORD *embeddedtest_test_case_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  const char *string_from_buffer;
  const char *v5;
  int v6;

  string_from_buffer = embeddedtest_create_string_from_buffer(a1, a2);
  v5 = embeddedtest_create_string_from_buffer(a1, a2);
  v6 = embeddedtest_deserialize_flags(a1, a2);
  return embeddedtest_test_case_create(string_from_buffer, v5, 0, 0, v6);
}

uint64_t embeddedtest_test_case_get_size(const char **a1)
{
  int v2;

  v2 = strlen(*a1);
  return v2 + strlen(a1[1]) + 12;
}

char **embeddedtest_info_pair_create(const char *a1, const char *a2)
{
  char **v4;
  char **v5;
  char *v6;
  char *v7;

  if (a1 && a2)
  {
    v4 = (char **)malloc_type_calloc(1uLL, 0x10uLL, 0x10040B8F86A93uLL);
    if (!v4)
      sub_1000185F8();
    v5 = v4;
    v6 = strdup(a1);
    *v5 = v6;
    if (!v6)
      sub_100018630();
    v7 = strdup(a2);
    v5[1] = v7;
    if (!v7)
      sub_100018668();
  }
  else
  {
    printf("Key and value are required to create info pair.  Key was %s and value was %s\n", a1, a2);
    return 0;
  }
  return v5;
}

void embeddedtest_info_pair_free(void **a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    v3 = a1[1];
    if (v3)
      free(v3);
    free(a1);
  }
}

uint64_t embeddedtest_info_pair_get_key(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t embeddedtest_info_pair_get_value(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

void *embeddedtest_info_pair_copy_json_representation(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;

  v9 = 0;
  embeddedtest_asprintf(&v9, "\"%s\":\"%s\"", a3, a4, a5, a6, a7, a8, *a1);
  return v9;
}

char **embeddedtest_info_pair_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  char *string_from_buffer;
  char *v5;
  char **v6;

  string_from_buffer = embeddedtest_create_string_from_buffer(a1, a2);
  v5 = embeddedtest_create_string_from_buffer(a1, a2);
  v6 = embeddedtest_info_pair_create(string_from_buffer, v5);
  if (string_from_buffer)
    free(string_from_buffer);
  if (v5)
    free(v5);
  return v6;
}

uint64_t embeddedtest_info_pair_get_size(const char **a1)
{
  int v2;

  v2 = strlen(*a1);
  return v2 + strlen(a1[1]) + 8;
}

void sub_100015910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015B30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015BB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015CC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015DD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015E60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015EE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100015FF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016108()
{
  uint64_t v0;

  v0 = _os_assert_log(0);
  _os_crash(v0);
  __break(1u);
}

void sub_100016120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000161A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000162B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000163C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016450()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000164D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016560()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000165E8()
{
  uint64_t v0;

  v0 = sub_10000BC60();
  _os_crash(v0);
  __break(1u);
}

void sub_1000165FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_100016694()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_10001671C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_1000167B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_10001684C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_1000168E4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Gigalocker partition does not exist", v0, 2u);
}

void sub_100016928()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_1000169C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016A48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016B58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016BE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016C68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016CF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016D78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016E00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100016F98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100017020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000170A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100017130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000171B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100017240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000172C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100017350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000173D8(void *a1, int a2)
{
  memset(a1, 170, 0x100uLL);
  snprintf((char *)a1, 0x100uLL, "Hilo update timer failed: 0x%x", a2);
  _os_crash(a1);
  __break(1u);
}

void sub_100017420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000174A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100017530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000175B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_100017640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_1000176D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_100017770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_100017808()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_1000178A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000BC54();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_10000BC68();
}

void sub_100017938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100002CCC();
  sub_100002CA4();
  sub_100002CBC((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_100002CE0();
}

void sub_1000179C0()
{
  int *v0;
  char *v1;
  int v2;
  char *v3;

  v0 = __error();
  v1 = strerror(*v0);
  v2 = 136315138;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "could not get the machine's unique identifier, reason: %s", (uint8_t *)&v2, 0xCu);
}

void sub_100017A48()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "metric", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic_metric.c", 44);
  abort();
}

void sub_100017A80()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "metric->_name", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic_metric.c", 46);
  abort();
}

void sub_100017AB8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "metric", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic_metric.c", 140);
  abort();
}

void sub_100017AF0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "*str", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/json.c", 31);
  abort();
}

void sub_100017B28()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "escaped_str", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/json.c", 42);
  abort();
}

void sub_100017B60()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "aggregate_string", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/json.c", 80);
  abort();
}

void sub_100017B98()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "json", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/filesystem.c", 52);
  abort();
}

void sub_100017BD0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "result", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_result.c", 43);
  abort();
}

void sub_100017C08()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "result->_name", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_result.c", 45);
  abort();
}

void sub_100017C40()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "result->_bucket", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_result.c", 106);
  abort();
}

void sub_100017C78()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "result->_metrics", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_result.c", 186);
  abort();
}

void sub_100017CB0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 52);
  abort();
}

void sub_100017CE8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic->_name", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 54);
  abort();
}

void sub_100017D20()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic->_buckets", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 58);
  abort();
}

void sub_100017D58()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic->_metrics", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 255);
  abort();
}

void sub_100017D90()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "merged_buckets", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 329);
  abort();
}

void sub_100017DC8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "new_metric", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 362);
  abort();
}

void sub_100017E00()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic_1->_metrics", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 364);
  abort();
}

void sub_100017E38()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 180);
  abort();
}

void sub_100017E70()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic->_buckets", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 187);
  abort();
}

void sub_100017EA8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "statistic->_metrics", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 194);
  abort();
}

void sub_100017EE0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "bucket_names", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 380);
  abort();
}

void sub_100017F18()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "name", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 397);
  abort();
}

void sub_100017F50()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "bucket_names", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 399);
  abort();
}

void sub_100017F88()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "name", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic.c", 386);
  abort();
}

void sub_100017FC0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 39);
  abort();
}

void sub_100017FF8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_info", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 41);
  abort();
}

void sub_100018030()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_issues", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 45);
  abort();
}

void sub_100018068()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_statistics", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 48);
  abort();
}

void sub_1000180A0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 90);
  abort();
}

void sub_1000180D8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_info", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 96);
  abort();
}

void sub_100018110()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_issues", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 103);
  abort();
}

void sub_100018148()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_statistics", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 110);
  abort();
}

void sub_100018180()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "new_statistic", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 217);
  abort();
}

void sub_1000181B8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_statistics", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 219);
  abort();
}

void sub_1000181F0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "new_aggregate", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 244);
  abort();
}

void sub_100018228()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "results->_issues", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/results.c", 246);
  abort();
}

void sub_100018260()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "metric", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_metric.c", 26);
  abort();
}

void sub_100018298()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "metric->_name", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_metric.c", 28);
  abort();
}

void sub_1000182D0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "issue", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/issue.c", 23);
  abort();
}

void sub_100018308()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "issue->_reason", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/issue.c", 47);
  abort();
}

void sub_100018340()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "issue->_group", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/issue.c", 56);
  abort();
}

void sub_100018378()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "aggregate", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/issue_aggregate.c", 31);
  abort();
}

void sub_1000183B0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "aggregate->_reason", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/issue_aggregate.c", 33);
  abort();
}

void sub_1000183E8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "aggregate->_group", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/issue_aggregate.c", 35);
  abort();
}

void sub_100018420()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "aggregate", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/issue_aggregate.c", 108);
  abort();
}

void sub_100018458()
{
  puts("embeddedtest_create_string_from_buffer saw a size > 10000");
  abort();
}

void sub_100018470()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "str", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/serialization.c", 57);
  abort();
}

void sub_1000184A8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "suite", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_suite.c", 128);
  abort();
}

void sub_1000184E0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "suite->_test_cases", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_suite.c", 134);
  abort();
}

void sub_100018518()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "bucket", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic_bucket.c", 27);
  abort();
}

void sub_100018550()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "bucket->_name", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic_bucket.c", 29);
  abort();
}

void sub_100018588()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "bucket", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case_statistic_bucket.c", 71);
  abort();
}

void sub_1000185C0()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "test_case", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/test_case.c", 21);
  abort();
}

void sub_1000185F8()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "pair", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/info_pair.c", 27);
  abort();
}

void sub_100018630()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "pair->_key", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/info_pair.c", 29);
  abort();
}

void sub_100018668()
{
  printf("embeddedtest: allocation failed for %s (file: %s, line: %d)\n", "pair->_value", "/Library/Caches/com.apple.xbs/Sources/libembeddedtest/Framework/Source/info_pair.c", 31);
  abort();
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}
