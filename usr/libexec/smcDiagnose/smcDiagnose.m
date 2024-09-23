uint64_t sub_1000033A8(const char *a1)
{
  size_t v2;
  size_t v3;
  uint64_t result;
  int v5;
  int v6;

  v2 = strlen(a1);
  v3 = 0;
  LODWORD(result) = 0;
  v5 = 24;
  do
  {
    if (v2 <= v3)
      v6 = 32;
    else
      v6 = a1[v3];
    result = (v6 << v5) | result;
    ++v3;
    v5 -= 8;
  }
  while (v3 != 4);
  return result;
}

uint64_t sub_100003404(uint64_t result, _DWORD *a2)
{
  *a2 = bswap32(result);
  return result;
}

uint64_t sub_100003410(int a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v5[5];
  uint64_t v6;
  uint64_t v7;

  if (a1 - 97 >= 0x17)
  {
    if (a1 - 48 >= 0xA)
    {
      v6 = v1;
      v7 = v2;
      v5[0] = HIBYTE(a1);
      v5[1] = BYTE2(a1);
      v5[2] = BYTE1(a1);
      v5[3] = a1;
      v5[4] = 0;
      fprintf(__stderrp, "ERROR: Invalid type (%s) passed to ui8SMCGetNumFracBitsFromType.\n", v5);
      exit(-1);
    }
    v3 = -48;
  }
  else
  {
    v3 = -87;
  }
  return (v3 + a1);
}

uint64_t sub_100003498(int a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v5[5];
  uint64_t v6;
  uint64_t v7;

  if (BYTE1(a1) - 97 >= 0x17)
  {
    if (BYTE1(a1) - 48 >= 0xA)
    {
      v6 = v1;
      v7 = v2;
      v5[0] = HIBYTE(a1);
      v5[1] = BYTE2(a1);
      v5[2] = BYTE1(a1);
      v5[3] = a1;
      v5[4] = 0;
      fprintf(__stderrp, "ERROR: Invalid type (%s) passed to ui8SMCGetNumIntBitsFromType.\n", v5);
      exit(-1);
    }
    v3 = -48;
  }
  else
  {
    v3 = -87;
  }
  return (v3 + BYTE1(a1));
}

uint64_t sub_100003520(const char *a1, uint64_t a2)
{
  mach_port_t v4;
  mach_port_t v5;
  int v6;
  unsigned __int8 v7;
  FILE *v8;
  const char *v9;
  FILE *v10;
  const char *v11;
  size_t v12;
  _OWORD outputStruct[10];
  uint64_t v15;
  int v16;
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
  int v27;

  v4 = sub_100006C34(0, 0);
  if (!v4)
  {
    v10 = __stderrp;
    v11 = "ERROR: Failed to open SMC data port.\n";
    v12 = 37;
LABEL_10:
    fwrite(v11, v12, 1uLL, v10);
    return -1;
  }
  v5 = v4;
  v15 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0;
  v16 = sub_1000033A8(a1);
  BYTE6(v19) = 9;
  v6 = sub_100006AC4(2, v5, &v16, outputStruct, 0);
  if (!v6)
  {
    if (BYTE8(outputStruct[2]))
    {
      fprintf(__stderrp, "ERROR: GetKeyInfo for key %s failed with SMC error code 0x%x.\n", a1, BYTE8(outputStruct[2]));
    }
    else
    {
      *(_QWORD *)a2 = *(_QWORD *)((char *)&outputStruct[1] + 12);
      *(_DWORD *)(a2 + 8) = DWORD1(outputStruct[2]);
    }
    if (!sub_100006D88(v5))
      return BYTE8(outputStruct[2]);
    v10 = __stderrp;
    v11 = "ERROR: Failed to properly close SMC data port.\n";
    v12 = 47;
    goto LABEL_10;
  }
  v7 = v6;
  v8 = __stderrp;
  v9 = sub_100006B58(v6);
  fprintf(v8, "ERROR: GetKeyInfo for key %s failed with OS error %s.\n", a1, v9);
  sub_100006D88(v5);
  return v7;
}

uint64_t sub_1000036D8(unsigned int a1, _DWORD *a2, mach_port_t connection)
{
  int v6;
  unsigned __int8 v7;
  FILE *v8;
  const char *v9;
  _OWORD outputStruct[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(outputStruct, 0, sizeof(outputStruct));
  memset(v21, 0, sizeof(v21));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0;
  HIDWORD(v22) = a1;
  BYTE10(v22) = 8;
  v6 = sub_100006AC4(2, connection, v21, outputStruct, 0);
  if (v6)
  {
    v7 = v6;
    v8 = __stderrp;
    v9 = sub_100006B58(v6);
    fprintf(v8, "ERROR: GetKeyFromIndex for index 0x%lx failed with OS error %s.\n", a1, v9);
    sub_100006D88(connection);
  }
  else
  {
    if (BYTE8(v12))
      fprintf(__stderrp, "ERROR: GetKeyFromIndex for index 0x%lx failed with SMC error code 0x%x.\n", a1, BYTE8(v12));
    else
      *a2 = outputStruct[0];
    if (sub_100006D88(connection))
    {
      fwrite("ERROR: Failed to properly close SMC data port.\n", 0x2FuLL, 1uLL, __stderrp);
      return -1;
    }
    else
    {
      return BYTE8(v12);
    }
  }
  return v7;
}

uint64_t sub_100003844(const char *a1, unsigned int a2, void *a3)
{
  mach_port_t v6;
  mach_port_t v7;
  int v8;
  unsigned __int8 v9;
  FILE *v10;
  const char *v11;
  FILE *v12;
  const char *v13;
  size_t v14;
  _OWORD outputStruct[2];
  __int128 v17;
  _OWORD v18[7];
  uint64_t v19;
  int v20;
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
  int v31;

  v6 = sub_100006C34(0, 0);
  if (!v6)
  {
    v12 = __stderrp;
    v13 = "ERROR: Failed to open SMC data port.\n";
    v14 = 37;
LABEL_10:
    fwrite(v13, v14, 1uLL, v12);
    return -1;
  }
  v7 = v6;
  v19 = 0;
  v17 = 0u;
  memset(v18, 0, sizeof(v18));
  memset(outputStruct, 0, sizeof(outputStruct));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0;
  v20 = sub_1000033A8(a1);
  DWORD2(v22) = a2;
  BYTE6(v23) = 5;
  v8 = sub_100006AC4(2, v7, &v20, outputStruct, 0);
  if (!v8)
  {
    if (BYTE8(v17))
      fprintf(__stderrp, "ERROR: ReadKey for key %s failed with SMC error code 0x%x.\n", a1, BYTE8(v17));
    else
      memcpy(a3, v18, a2);
    if (!sub_100006D88(v7))
      return BYTE8(v17);
    v12 = __stderrp;
    v13 = "ERROR: Failed to properly close SMC data port.\n";
    v14 = 47;
    goto LABEL_10;
  }
  v9 = v8;
  v10 = __stderrp;
  v11 = sub_100006B58(v8);
  fprintf(v10, "ERROR: ReadKey for key %s failed with OS error %s.\n", a1, v11);
  sub_100006D88(v7);
  return v9;
}

uint64_t sub_100003A08(const char *a1, int a2)
{
  unint64_t v5;
  uint64_t v6;
  int v7;
  _BYTE v8[32];

  v7 = 0;
  v6 = 0;
  if (sub_100003520(a1, (uint64_t)&v6))
  {
    puts("Not present.");
    exit(-1);
  }
  if (sub_100003844(a1, v6, v8))
    return puts("no data");
  if (a2)
    printf("%s: ", a1);
  if ((_DWORD)v6)
  {
    v5 = 0;
    do
      printf("0x%02x ", v8[v5++]);
    while (v5 < v6);
  }
  return putchar(10);
}

uint64_t sub_100003B04(const char *a1)
{
  int v1;
  int v2;
  int i;
  uint64_t j;
  uint64_t v6;
  int v7;
  _BYTE v8[32];

  v7 = 0;
  v6 = 0;
  printf("\n\n%s Event Buffer:\n", a1);
  v1 = sub_100003520("EVCT", (uint64_t)&v6);
  if (v1)
    goto LABEL_18;
  if (sub_100003844("EVCT", v6, v8))
    puts("no data");
  else
    printf("EVCT: 0x%02x %02x\n", v8[0], v8[1]);
  v1 = sub_100003520("EVRD", (uint64_t)&v6);
  if (v1)
  {
LABEL_18:
    printf("FAIL (0x%x).\n", v1);
    exit(-1);
  }
  v2 = 0;
  for (i = 0; i != 4; ++i)
  {
    if (sub_100003844("EVRD", v6, v8))
    {
      puts("no data");
    }
    else
    {
      for (j = 0; j != 32; ++j)
      {
        if ((j & 7) == 0)
        {
          if (j)
            putchar(10);
          printf("Event %d: ", v2++);
        }
        printf("0x%02x ", v8[j]);
      }
      putchar(10);
    }
  }
  sub_100003A08("EVHF", 1);
  return fflush(__stdoutp);
}

uint64_t start()
{
  double v0;
  unsigned int v1;
  unsigned int v2;
  int v3;
  int v4;
  const char *v5;
  const char *v6;
  double v7;
  char v9[5];

  printf("## smcDiagnose %0.2f %d\n", 5.0, 200);
  if (sub_1000045A4())
    exit(-1);
  sub_1000045F0();
  sub_100004154(1);
  dword_10000C62C = 0;
  sub_10000462C("#KEY", 1, 0xFFFFFFFF, -1, 0);
  v0 = sub_1000045FC();
  v1 = v0;
  if (dword_10000C628)
    printf("## %ld keys\n", v0);
  if (v1 >= 0xFA1)
  {
    v1 = 4000;
    printf("## Keys capped at first %ld keys\n", 4000);
  }
  sub_1000041AC(0);
  sub_100004314(0);
  if (v1)
  {
    v2 = 0;
    v3 = 0;
    v4 = dword_10000C62C;
    do
    {
      v5 = (const char *)sub_10000462C(v9, 0, v2, 0, v4);
      v4 = dword_10000C62C;
      if (!dword_10000C62C)
      {
        v6 = v5;
        if (v5 && strlen(v5) > 1)
        {
          if (dword_10000C628)
          {
            puts(v6);
            v4 = dword_10000C62C;
          }
          else
          {
            v4 = 0;
          }
        }
        else
        {
          v4 = 0;
          ++v3;
        }
      }
      ++v2;
    }
    while (v1 != v2);
  }
  else
  {
    v3 = 0;
  }
  sub_100004370(0);
  v7 = sub_1000043D0();
  if (v7 < 1.024)
    usleep((int)((1.024 - v7) * 1000000.0));
  if (dword_10000C628)
    printf("Keys not read %d\n", v3);
  sub_100003E84();
  fflush(__stdoutp);
  return 0;
}

id sub_100003E84()
{
  unint64_t v0;
  void *v1;
  void *v2;
  unint64_t v3;
  void *v4;
  id result;
  unint64_t i;
  void *v7;
  void *v8;

  if (objc_msgSend((id)qword_10000C648, "count"))
  {
    v0 = 0;
    do
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C648, "objectAtIndex:", v0));
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "keyString"));
      if (objc_msgSend(v2, "isEqualToString:", CFSTR("TIME_START")))
        sub_100003FE4(v1);
      if (objc_msgSend(v2, "isEqualToString:", CFSTR("TIME_DIFF")))
        sub_100003FE4(v1);

      ++v0;
    }
    while (v0 < (unint64_t)objc_msgSend((id)qword_10000C648, "count"));
  }
  if (objc_msgSend((id)qword_10000C650, "count"))
  {
    v3 = 0;
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C650, "objectAtIndex:", v3));
      sub_10000408C(v4);

      ++v3;
    }
    while (v3 < (unint64_t)objc_msgSend((id)qword_10000C650, "count"));
  }
  result = objc_msgSend((id)qword_10000C648, "count");
  if (result)
  {
    for (i = 0; i < (unint64_t)result; ++i)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C648, "objectAtIndex:", i));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyString"));
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("TIME_END")))
        sub_100003FE4(v7);

      result = objc_msgSend((id)qword_10000C648, "count");
    }
  }
  return result;
}

void sub_100003FE4(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  id v4;

  v4 = a1;
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyString")));
  printf("%s ", (const char *)objc_msgSend(v1, "cStringUsingEncoding:", 1));

  if ((uint64_t)objc_msgSend(v4, "numValues") >= 1)
  {
    v2 = 0;
    do
    {
      objc_msgSend(v4, "valueDouble:", v2);
      printf(",%f", v3);
      ++v2;
    }
    while (v2 < (uint64_t)objc_msgSend(v4, "numValues"));
  }
  putchar(10);

}

void sub_10000408C(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  id v4;

  v4 = a1;
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyString")));
  printf("%s ", (const char *)objc_msgSend(v1, "cStringUsingEncoding:", 1));

  if ((uint64_t)objc_msgSend(v4, "numValues") >= 1)
  {
    v2 = 0;
    do
    {
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueStr:", v2)));
      printf(",%s", (const char *)objc_msgSend(v3, "cStringUsingEncoding:", 1));

      ++v2;
    }
    while (v2 < (uint64_t)objc_msgSend(v4, "numValues"));
  }
  putchar(10);

}

void sub_100004154(int a1)
{
  NSMutableArray *v2;
  void *v3;
  NSMutableArray *v4;
  void *v5;

  v2 = objc_opt_new(NSMutableArray);
  v3 = (void *)qword_10000C648;
  qword_10000C648 = (uint64_t)v2;

  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)qword_10000C650;
  qword_10000C650 = (uint64_t)v4;

  dword_10000C658 = a1;
}

void sub_1000041AC(int a1)
{
  double v2;
  double v3;
  id v4;

  v4 = objc_alloc_init((Class)NSDate);
  objc_msgSend(v4, "timeIntervalSince1970");
  qword_10000C660 = *(_QWORD *)&v2;
  v3 = v2 - *(double *)&qword_10000C638;
  if (*(double *)&qword_10000C640 <= 0.0)
    v3 = 0.0;
  sub_100004220(CFSTR("TIME_DIFF"), a1, v3);

}

void sub_100004220(void *a1, int a2, double a3)
{
  uint64_t v5;
  keyDataObject *v6;
  void *v7;
  id v8;

  v8 = a1;
  if (objc_msgSend((id)qword_10000C648, "count"))
  {
    v5 = 0;
    while (1)
    {
      v6 = (keyDataObject *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C648, "objectAtIndex:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[keyDataObject keyString](v6, "keyString"));
      if (objc_msgSend(v7, "isEqualToString:", v8))
        break;

      if (++v5 >= (unint64_t)objc_msgSend((id)qword_10000C648, "count"))
        goto LABEL_5;
    }
    -[keyDataObject addToTimeArray:idx:](v6, "addToTimeArray:idx:", a2, a3);

  }
  else
  {
LABEL_5:
    v6 = -[keyDataObject initWithT:]([keyDataObject alloc], "initWithT:", v8);
    -[keyDataObject addToTimeArray:idx:](v6, "addToTimeArray:idx:", a2, a3);
    objc_msgSend((id)qword_10000C648, "addObject:", v6);
  }

}

void sub_100004314(int a1)
{
  double v2;
  uint64_t v3;
  id v4;

  v4 = objc_alloc_init((Class)NSDate);
  objc_msgSend(v4, "timeIntervalSince1970");
  sub_100004220(CFSTR("TIME_START"), a1, v2);
  objc_msgSend(v4, "timeIntervalSince1970");
  qword_10000C638 = v3;

}

void sub_100004370(int a1)
{
  double v2;
  id v3;

  v3 = objc_alloc_init((Class)NSDate);
  objc_msgSend(v3, "timeIntervalSince1970");
  qword_10000C640 = *(_QWORD *)&v2;
  sub_100004220(CFSTR("TIME_END"), a1, v2 - *(double *)&qword_10000C638);

}

double sub_1000043D0()
{
  double result;

  result = *(double *)&qword_10000C640 - *(double *)&qword_10000C638;
  *(double *)&qword_10000C668 = *(double *)&qword_10000C640 - *(double *)&qword_10000C638;
  return result;
}

void sub_1000043F0(void *a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  keyDataObject *v7;
  void *v8;
  id v9;

  v9 = a1;
  v5 = a2;
  if (objc_msgSend((id)qword_10000C650, "count"))
  {
    v6 = 0;
    while (1)
    {
      v7 = (keyDataObject *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C650, "objectAtIndex:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[keyDataObject keyString](v7, "keyString"));
      if (objc_msgSend(v8, "isEqualToString:", v9))
        break;

      if (++v6 >= (unint64_t)objc_msgSend((id)qword_10000C650, "count"))
        goto LABEL_5;
    }
    -[keyDataObject addToValueArray:idx:](v7, "addToValueArray:idx:", v5, a3);

  }
  else
  {
LABEL_5:
    v7 = -[keyDataObject initWith:]([keyDataObject alloc], "initWith:", v9);
    -[keyDataObject addToValueArray:idx:](v7, "addToValueArray:idx:", v5, a3);
    objc_msgSend((id)qword_10000C650, "addObject:", v7);
  }

}

uint64_t sub_1000044E8()
{
  int v0;

  if (dword_10000C628)
    puts("Trying to open io connection to SMC Kext");
  dword_10000C630 = sub_100006C34(0, 0);
  if (dword_10000C630)
  {
LABEL_7:
    if (dword_10000C628)
      puts("Opened access to AppleSMC kext.");
    return 1;
  }
  else
  {
    v0 = 10;
    while (--v0)
    {
      usleep(0x186A0u);
      dword_10000C630 = sub_100006C34(0, 0);
      if (dword_10000C630)
        goto LABEL_7;
    }
    printf("ERROR: Could not open connection. Tried %d times.\n", 9);
    return 0;
  }
}

uint64_t sub_1000045A4()
{
  sub_1000044E8();
  if (dword_10000C630)
    return 0;
  fwrite("ERROR: Failed to open SMC data port.\n", 0x25uLL, 1uLL, __stderrp);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000045F0()
{
  return dword_10000C630;
}

double sub_1000045FC()
{
  return *(double *)&qword_10000C670;
}

uint64_t sub_100004608(uint64_t result, _BYTE *a2)
{
  *a2 = BYTE3(result);
  a2[1] = BYTE2(result);
  a2[2] = BYTE1(result);
  a2[3] = result;
  a2[4] = 0;
  return result;
}

id sub_10000462C(char *a1, int a2, unsigned int a3, int a4, int a5)
{
  void *v7;
  NSMutableString *v8;
  void *v9;
  id v10;

  if ((a3 & 0x80000000) != 0)
  {
LABEL_6:
    if (a1)
      goto LABEL_7;
    return 0;
  }
  if (!a5)
  {
    a1 = sub_100004754(a3);
    goto LABEL_6;
  }
  if (a3 >= 0x1F)
    return 0;
  a1 = &aAupo[9 * a3];
LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), a1));
  v8 = sub_1000048B0(v7, a2, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "length"))
  {
    if (dword_10000C628)
      printf("response String = _%s_\n", (const char *)objc_msgSend(objc_retainAutorelease(v9), "cStringUsingEncoding:", 1));
    v10 = objc_msgSend(objc_retainAutorelease(v9), "cStringUsingEncoding:", 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

char *sub_100004734(int a1)
{
  if (a1 >= 31)
    return 0;
  else
    return &aAupo[9 * a1];
}

char *sub_100004754(int a1)
{
  char *v2;
  _OWORD outputStruct[2];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  memset(v14, 0, sizeof(v14));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0;
  HIDWORD(v15) = a1;
  BYTE10(v15) = 8;
  if (sub_100006AC4(2, dword_10000C630, v14, outputStruct, 1))
  {
    if (dword_10000C628)
      printf("IO ERROR using keyfromindex: %d\n");
    return 0;
  }
  if (BYTE8(v5))
  {
    if (dword_10000C628)
      printf("SMC ERROR using keyfromindex: %d idx %d\n");
    return 0;
  }
  LODWORD(v14[0]) = outputStruct[0];
  v2 = &byte_10000C678;
  byte_10000C678 = BYTE3(outputStruct[0]);
  byte_10000C679 = BYTE2(outputStruct[0]);
  byte_10000C67A = BYTE1(outputStruct[0]);
  byte_10000C67B = outputStruct[0];
  byte_10000C67C = 0;
  if (dword_10000C628)
    printf("Key To Read %d =%s\n", a1, &byte_10000C678);
  return v2;
}

NSMutableString *sub_1000048B0(void *a1, int a2, int a3)
{
  id v5;
  NSMutableString *v6;
  id v7;
  const char *v8;
  uint64_t i;
  id v10;
  int v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  _QWORD v18[2];
  int v19;
  _OWORD v20[3];
  _OWORD v21[7];
  uint64_t v22;
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
  uint64_t v33;

  v5 = a1;
  v33 = 0;
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
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  v6 = objc_opt_new(NSMutableString);
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 1);
  for (i = 0; i != 756; i += 9)
  {
    if (!strcmp(&aEvrd_0[i], v8))
      goto LABEL_30;
  }
  v10 = objc_retainAutorelease(v7);
  sub_100004BC4((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 1), &v23, (char *)v20, v18);
  v11 = v18[0];
  v12 = v18[1];
  v13 = v19;
  -[NSMutableString setString:](v6, "setString:", &stru_100008220);
  if (v11 == 1)
  {
    if (a2 && !a3)
      -[NSMutableString appendFormat:](v6, "appendFormat:", CFSTR("%s ="), objc_msgSend(objc_retainAutorelease(v10), "cStringUsingEncoding:", 1));
    if (HIDWORD(v24) <= 8 && (v13 - 87) >= 2)
    {
      -[NSMutableString appendFormat:](v6, "appendFormat:", CFSTR(" %f"), v12);
      qword_10000C670 = v12;
LABEL_28:
      if (a3 != -1)
        sub_1000043F0(v10, v6, a3);
      goto LABEL_30;
    }
    -[NSMutableString appendFormat:](v6, "appendFormat:", CFSTR(" "));
    if (v13 == 5 || v13 == 87 || v13 == 88 && !sub_100004EB8(v10))
      -[NSMutableString appendFormat:](v6, "appendFormat:", CFSTR("0x"));
    if (!HIDWORD(v24))
      goto LABEL_28;
    v14 = 0;
    while (v13 != 5)
    {
      if (v13 == 88)
      {
        v16 = sub_100004EB8(v10);
        v15 = *((unsigned __int8 *)v21 + v14);
        if (v16)
        {
          -[NSMutableString appendFormat:](v6, "appendFormat:", CFSTR("%c "), *((unsigned __int8 *)v21 + v14));
          goto LABEL_25;
        }
        goto LABEL_22;
      }
      if (v13 == 87)
        break;
LABEL_25:
      if ((++v14 & 7) == 0)
        -[NSMutableString appendFormat:](v6, "appendFormat:", CFSTR(" "));
      if (v14 >= HIDWORD(v24))
        goto LABEL_28;
    }
    v15 = *((unsigned __int8 *)v21 + v14);
LABEL_22:
    -[NSMutableString appendFormat:](v6, "appendFormat:", CFSTR("%02x "), v15);
    goto LABEL_25;
  }
LABEL_30:

  return v6;
}

uint64_t sub_100004B6C(char *__s2)
{
  uint64_t v2;

  v2 = 0;
  while (strcmp(&aEvrd_0[v2], __s2))
  {
    v2 += 9;
    if (v2 == 756)
      return 0;
  }
  return 1;
}

void sub_100004BC4(const char *a1@<X0>, _QWORD *a2@<X1>, char *a3@<X2>, _QWORD *a4@<X8>)
{
  int v8;
  int v9;
  unsigned int v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  double v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;
  _BYTE v20[5];
  __int128 outputStruct;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  int v43;

  a2[20] = 0;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_QWORD *)a3 + 20) = 0;
  *((_OWORD *)a3 + 3) = 0u;
  *((_OWORD *)a3 + 4) = 0u;
  *((_OWORD *)a3 + 5) = 0u;
  *((_OWORD *)a3 + 6) = 0u;
  *((_OWORD *)a3 + 7) = 0u;
  *((_OWORD *)a3 + 8) = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  *((_OWORD *)a3 + 2) = 0u;
  *(_OWORD *)a3 = 0u;
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  outputStruct = 0u;
  v22 = 0u;
  v43 = 0;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  *((_QWORD *)a3 + 20) = 0;
  *((_OWORD *)a3 + 8) = 0u;
  *((_OWORD *)a3 + 9) = 0u;
  *((_OWORD *)a3 + 9) = 0u;
  *((_OWORD *)a3 + 6) = 0u;
  *((_OWORD *)a3 + 7) = 0u;
  *((_OWORD *)a3 + 4) = 0u;
  *((_OWORD *)a3 + 5) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  v32 = sub_1000033A8(a1);
  BYTE6(v35) = 9;
  v8 = sub_100006AC4(2, dword_10000C630, &v32, &outputStruct, 1);
  if (v8 || (SBYTE4(v23) & 0x80000000) == 0)
  {
    v11 = -1.0;
    if (v8)
      printf("KeyInfo Err for key %s failed %d\n");
    goto LABEL_12;
  }
  v9 = 0;
  v10 = BYTE4(v23);
  v11 = -1.0;
  if ((BYTE4(v23) & 0x20) == 0 && HIDWORD(v22) <= 0x78)
  {
    *(_DWORD *)a2 = sub_1000033A8(a1);
    v13 = HIDWORD(v22);
    v12 = v23;
    *((_DWORD *)a2 + 7) = HIDWORD(v22);
    v20[0] = BYTE3(v12);
    v20[1] = BYTE2(v12);
    v20[2] = BYTE1(v12);
    v20[3] = v12;
    v20[4] = 0;
    v14 = sub_100005004(v12);
    v15 = v14;
    *((_DWORD *)a4 + 4) = v14;
    if (dword_10000C628)
    {
      NSLog(CFSTR("Key Format = %s  %x %d  - forceValueFormat %d "), v20, v12, v12, v14);
      if (dword_10000C628)
        NSLog(CFSTR("forceValueSize = %d"), v13);
    }
    *((_BYTE *)a2 + 42) = 5;
    if (sub_100006AC4(2, dword_10000C630, a2, a3, 1))
    {
      printf("ReadKey Err for key %s failed %d\n");
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
    if (dword_10000C628)
    {
      NSLog(CFSTR("RESULT BYTES "));
      if ((int)v13 >= 1)
      {
        v17 = (unsigned __int8 *)(a3 + 48);
        v18 = v13;
        do
        {
          v19 = *v17++;
          printf("%x ", v19);
          --v18;
        }
        while (v18);
      }
    }
    dword_10000C218 = (v10 >> 2) & 1;
    if ((int)v13 > 8 || v15 == 87)
    {
      *((_DWORD *)a4 + 4) = v15;
      v11 = 0.0;
    }
    else
    {
      v11 = sub_1000058F8(v15, (uint64_t)a2, (uint64_t)a3, v16);
    }
    if (dword_10000C628)
      NSLog(CFSTR("curSensorValue = %f"), *(_QWORD *)&v11);
    v9 = 1;
  }
LABEL_13:
  *((double *)a4 + 1) = v11;
  *(_DWORD *)a4 = v9;
}

BOOL sub_100004EB8(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = !objc_msgSend(v1, "compare:", CFSTR("MSFL"))
    || !objc_msgSend(v1, "compare:", CFSTR("MSFA"))
    || !objc_msgSend(v1, "compare:", CFSTR("RBr"))
    || objc_msgSend(v1, "compare:", CFSTR("RMde")) == 0;

  return v2;
}

BOOL sub_100004F38(const char *a1)
{
  _OWORD v2[10];
  uint64_t v3;
  int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int v15;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0;
  v4 = sub_1000033A8(a1);
  BYTE6(v7) = 9;
  return sub_100006AC4(2, dword_10000C630, &v4, v2, 1) == 0;
}

uint64_t sub_100005004(int a1)
{
  uint64_t v1;
  int v2;

  v1 = 5;
  if (a1 <= 1936734262)
  {
    if (a1 > 1936274225)
    {
      if (a1 <= 1936733026)
      {
        if (a1 <= 1936732277)
        {
          if (a1 > 1936275487)
          {
            if (a1 == 1936275488)
              return 6;
            if (a1 == 1936732262)
              return 37;
          }
          else
          {
            if (a1 == 1936274226)
              return 100;
            if (a1 == 1936274996)
              return 101;
          }
        }
        else if (a1 <= 1936732532)
        {
          if (a1 == 1936732278)
            return 53;
          if (a1 == 1936732517)
            return 38;
        }
        else
        {
          switch(a1)
          {
            case 1936732533:
              return 54;
            case 1936732772:
              return 39;
            case 1936732788:
              return 55;
          }
        }
      }
      else if (a1 > 1936733552)
      {
        if (a1 <= 1936733807)
        {
          if (a1 == 1936733553)
            return 58;
          if (a1 == 1936733753)
            return 43;
        }
        else
        {
          switch(a1)
          {
            case 1936733808:
              return 59;
            case 1936734008:
              return 9;
            case 1936734063:
              return 60;
          }
        }
      }
      else if (a1 <= 1936733281)
      {
        if (a1 == 1936733027)
          return 40;
        if (a1 == 1936733043)
          return 56;
      }
      else
      {
        switch(a1)
        {
          case 1936733282:
            return 41;
          case 1936733298:
            return 57;
          case 1936733537:
            return 42;
        }
      }
      return 87;
    }
    if (a1 > 1718629729)
    {
      if (a1 > 1718641459)
      {
        if (a1 <= 1751480414)
        {
          if (a1 == 1718641460)
            return 90;
          if (a1 == 1718641970)
            return 19;
        }
        else if (a1 != 1751480415)
        {
          if (a1 == 1768908404)
            return 103;
          if (a1 == 1936273718)
            return 29;
        }
      }
      else if (a1 <= 1718630200)
      {
        if (a1 == 1718629730)
          return 16;
        if (a1 == 1718629985)
          return 12;
      }
      else
      {
        switch(a1)
        {
          case 1718630201:
            return 17;
          case 1718630456:
            return 7;
          case 1718640950:
            return 33;
        }
      }
      return 87;
    }
    if (a1 > 1718383647)
    {
      if (a1 <= 1718628964)
      {
        if (a1 == 1718383648)
          return 91;
        if (a1 == 1718628710)
          return 13;
      }
      else
      {
        switch(a1)
        {
          case 1718628965:
            return 14;
          case 1718629220:
            return 15;
          case 1718629475:
            return 18;
        }
      }
      return 87;
    }
    if (a1 > 1667785073)
    {
      if (a1 != 1667785074)
      {
        if (a1 == 1718378855)
          return v1;
        return 87;
      }
      return 88;
    }
    if (a1 == 1651076703)
      return 89;
    v2 = 1667774506;
LABEL_78:
    if (a1 != v2)
      return 87;
    return 88;
  }
  if (a1 <= 1936747106)
  {
    if (a1 <= 1936745321)
    {
      if (a1 <= 1936744756)
      {
        if (a1 > 1936734517)
        {
          if (a1 == 1936734518)
            return 46;
          if (a1 == 1936734573)
            return 62;
        }
        else
        {
          if (a1 == 1936734263)
            return 45;
          if (a1 == 1936734318)
            return 61;
        }
      }
      else if (a1 <= 1936745011)
      {
        if (a1 == 1936744757)
          return 47;
        if (a1 == 1936744812)
          return 63;
      }
      else
      {
        switch(a1)
        {
          case 1936745012:
            return 48;
          case 1936745067:
            return 64;
          case 1936745267:
            return 49;
        }
      }
    }
    else if (a1 > 1936746031)
    {
      if (a1 <= 1936746341)
      {
        if (a1 == 1936746032)
          return 52;
        if (a1 == 1936746087)
          return 68;
      }
      else
      {
        switch(a1)
        {
          case 1936746342:
            return 69;
          case 1936746597:
            return 70;
          case 1936746852:
            return 71;
        }
      }
    }
    else if (a1 <= 1936745576)
    {
      if (a1 == 1936745322)
        return 65;
      if (a1 == 1936745522)
        return 50;
    }
    else
    {
      switch(a1)
      {
        case 1936745577:
          return 66;
        case 1936745777:
          return 51;
        case 1936745832:
          return 67;
      }
    }
    return 87;
  }
  if (a1 <= 1936749362)
  {
    if (a1 <= 1936748087)
    {
      if (a1 > 1936747616)
      {
        if (a1 == 1936747617)
          return 74;
        if (a1 == 1936747833)
          return 75;
      }
      else
      {
        if (a1 == 1936747107)
          return 72;
        if (a1 == 1936747362)
          return 73;
      }
    }
    else if (a1 <= 1936748597)
    {
      if (a1 == 1936748088)
        return 76;
      if (a1 == 1936748343)
        return 78;
    }
    else
    {
      switch(a1)
      {
        case 1936748598:
          return 79;
        case 1936748853:
          return 80;
        case 1936749108:
          return 81;
      }
    }
    return 87;
  }
  if (a1 <= 1969828657)
  {
    if (a1 <= 1936749872)
    {
      if (a1 == 1936749363)
        return 82;
      if (a1 == 1936749618)
        return 83;
    }
    else
    {
      switch(a1)
      {
        case 1936749873:
          return 84;
        case 1936750128:
          return 85;
        case 1969828150:
          return 3;
      }
    }
    return 87;
  }
  if (a1 <= 1969829887)
  {
    if (a1 == 1969828658)
      return 31;
    if (a1 == 1969829428)
      return 102;
    return 87;
  }
  if (a1 != 1969829888 && a1 != 1969829920)
  {
    v2 = 2071094646;
    goto LABEL_78;
  }
  return v1;
}

double sub_1000058F8(int a1, uint64_t a2, uint64_t a3, double a4)
{
  size_t v4;
  double v5;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned __int16 v15;
  double v16;
  unsigned int v17;
  __int16 v18;
  float v19;
  unsigned int v20;
  unsigned __int16 v21;
  unsigned int v22;
  unsigned __int16 v23;
  unsigned int v24;
  unsigned __int16 v25;
  unsigned int v26;
  unsigned __int16 v27;
  unsigned int v28;
  unsigned __int16 v29;
  unsigned int v30;
  unsigned __int16 v31;
  unsigned int v32;
  unsigned __int16 v33;
  unsigned int v34;
  unsigned __int16 v35;
  unsigned int v36;
  unsigned __int16 v37;
  double v38;
  double v39;
  unsigned int v40;
  unsigned __int16 v41;
  unsigned int v42;
  unsigned __int16 v43;
  unsigned int v44;
  unsigned __int16 v45;
  float v46;
  unsigned int v47;
  unsigned __int16 v48;
  int v49;
  unsigned int v50;
  unsigned __int16 v51;
  float v52;
  unsigned int v53;
  unsigned __int16 v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  int v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  int v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  int v74;
  unsigned int v75;
  int v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  int v80;
  unsigned int v81;
  int v82;
  unsigned int v83;
  int v84;
  uint64_t v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  int v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  int v95;
  unsigned int v96;
  int v97;
  unsigned int v98;
  int v99;
  unsigned int v100;
  int v101;
  unsigned int v102;
  int v103;
  unsigned int v104;
  int v105;
  double v106;
  unsigned int v107;
  int v108;
  unsigned int v109;
  int v110;
  unsigned int v111;
  int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  double v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unint64_t v134;
  unsigned int v136;
  unsigned __int16 v137;
  unint64_t v138;

  v4 = *(unsigned int *)(a2 + 28);
  v5 = -1.0;
  if (v4 <= 8)
  {
    qword_10000C688 = 0;
    if ((_DWORD)v4)
      memcpy(&qword_10000C688, (const void *)(a3 + 48), v4);
    switch(a1)
    {
      case 2:
        return 0.0;
      case 3:
      case 23:
LABEL_5:
        v7 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v8) = qword_10000C688;
        else
          LOWORD(v8) = v7;
        return (double)(unsigned __int16)v8;
      case 5:
LABEL_288:
        LOBYTE(a4) = qword_10000C688;
        return (double)*(unint64_t *)&a4;
      case 6:
        return (double)(char)qword_10000C688;
      case 7:
        v14 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v15 = qword_10000C688;
        else
          v15 = v14;
        v16 = (double)v15;
        goto LABEL_256;
      case 9:
      case 44:
        v9 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v10) = qword_10000C688;
        else
          LOWORD(v10) = v9;
        v10 = (__int16)v10;
        goto LABEL_255;
      case 11:
        v17 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v18 = qword_10000C688;
        else
          v18 = v17;
        v19 = (float)v18;
        goto LABEL_85;
      case 12:
        v20 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v21 = qword_10000C688;
        else
          v21 = v20;
        v16 = (double)v21;
        goto LABEL_246;
      case 13:
        v22 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v23 = qword_10000C688;
        else
          v23 = v22;
        v16 = (double)v23;
        goto LABEL_221;
      case 14:
        v24 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v25 = qword_10000C688;
        else
          v25 = v24;
        v16 = (double)v25;
        goto LABEL_226;
      case 15:
        v26 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v27 = qword_10000C688;
        else
          v27 = v26;
        v16 = (double)v27;
        goto LABEL_231;
      case 16:
        v28 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v29 = qword_10000C688;
        else
          v29 = v28;
        v16 = (double)v29;
        goto LABEL_241;
      case 17:
        v30 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v31 = qword_10000C688;
        else
          v31 = v30;
        v16 = (double)v31;
        goto LABEL_251;
      case 18:
        v32 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v33 = qword_10000C688;
        else
          v33 = v32;
        v16 = (double)v33;
        goto LABEL_236;
      case 19:
        v34 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v35 = qword_10000C688;
        else
          v35 = v34;
        v16 = (double)v35;
        goto LABEL_282;
      case 20:
        v36 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v37 = qword_10000C688;
        else
          v37 = v36;
        v38 = (double)v37;
        v39 = 0.25;
        goto LABEL_76;
      case 21:
        v40 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v41 = qword_10000C688;
        else
          v41 = v40;
        v19 = (double)v41 * 0.25;
        goto LABEL_85;
      case 22:
        LOWORD(a4) = qword_10000C688;
        v16 = (double)*(unint64_t *)&a4;
        goto LABEL_226;
      case 24:
        v42 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v43 = qword_10000C688;
        else
          v43 = v42;
        v38 = (double)v43;
        v39 = 0.00390625;
LABEL_76:
        v19 = v38 * v39;
        goto LABEL_90;
      case 25:
        v44 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v45 = qword_10000C688;
        else
          v45 = v44;
        v19 = (float)v45;
        v46 = 10000.0;
        goto LABEL_92;
      case 26:
        v47 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v48 = qword_10000C688;
        else
          v48 = v47;
        v19 = (float)v48;
LABEL_85:
        v49 = 1148846080;
        goto LABEL_91;
      case 27:
        v50 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v51 = qword_10000C688;
        else
          v51 = v50;
        v19 = (float)v51;
LABEL_90:
        v49 = 1120403456;
LABEL_91:
        v46 = *(float *)&v49;
LABEL_92:
        v52 = v19 / v46;
        goto LABEL_312;
      case 29:
      case 52:
        v11 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v12) = qword_10000C688;
        else
          LOWORD(v12) = v11;
        return (double)(__int16)v12;
      case 31:
LABEL_289:
        v133 = bswap32(qword_10000C688);
        if (dword_10000C218)
          return (double)qword_10000C688;
        else
          return (double)v133;
      case 33:
        v53 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v54 = qword_10000C688;
        else
          v54 = v53;
        v16 = (double)v54;
        goto LABEL_265;
      case 37:
        v55 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v56) = qword_10000C688;
        else
          LOWORD(v56) = v55;
        v56 = (__int16)v56;
        goto LABEL_220;
      case 38:
        v57 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v58) = qword_10000C688;
        else
          LOWORD(v58) = v57;
        v58 = (__int16)v58;
        goto LABEL_225;
      case 39:
        v59 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v60) = qword_10000C688;
        else
          LOWORD(v60) = v59;
        v60 = (__int16)v60;
        goto LABEL_230;
      case 40:
        v61 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v62) = qword_10000C688;
        else
          LOWORD(v62) = v61;
        v62 = (__int16)v62;
        goto LABEL_235;
      case 41:
        v63 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v64) = qword_10000C688;
        else
          LOWORD(v64) = v63;
        v64 = (__int16)v64;
        goto LABEL_240;
      case 42:
        v65 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v66) = qword_10000C688;
        else
          LOWORD(v66) = v65;
        v66 = (__int16)v66;
        goto LABEL_245;
      case 43:
        v67 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v68) = qword_10000C688;
        else
          LOWORD(v68) = v67;
        v68 = (__int16)v68;
        goto LABEL_250;
      case 45:
        v69 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v70) = qword_10000C688;
        else
          LOWORD(v70) = v69;
        v70 = (__int16)v70;
        goto LABEL_260;
      case 46:
        v71 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v72) = qword_10000C688;
        else
          LOWORD(v72) = v71;
        v72 = (__int16)v72;
        goto LABEL_264;
      case 47:
        v73 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v74) = qword_10000C688;
        else
          LOWORD(v74) = v73;
        v74 = (__int16)v74;
        goto LABEL_269;
      case 48:
        v75 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v76) = qword_10000C688;
        else
          LOWORD(v76) = v75;
        v76 = (__int16)v76;
        goto LABEL_273;
      case 49:
        v77 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v78) = qword_10000C688;
        else
          LOWORD(v78) = v77;
        v78 = (__int16)v78;
        goto LABEL_277;
      case 50:
        v79 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v80) = qword_10000C688;
        else
          LOWORD(v80) = v79;
        v80 = (__int16)v80;
        goto LABEL_281;
      case 51:
        v81 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          LOWORD(v82) = qword_10000C688;
        else
          LOWORD(v82) = v81;
        v82 = (__int16)v82;
        goto LABEL_286;
      case 53:
        v83 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v84 = qword_10000C688;
        else
          v84 = v83;
        v16 = (double)v84;
        v85 = 0x3E00000000000000;
        goto LABEL_309;
      case 54:
        v86 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v87 = qword_10000C688;
        else
          v87 = v86;
        v16 = (double)v87;
        v85 = 0x3E10000000000000;
        goto LABEL_309;
      case 55:
        v88 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v89 = qword_10000C688;
        else
          v89 = v88;
        v16 = (double)v89;
        v85 = 0x3E20000000000000;
        goto LABEL_309;
      case 56:
        v90 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v91 = qword_10000C688;
        else
          v91 = v90;
        v16 = (double)v91;
        v85 = 0x3E30000000000000;
        goto LABEL_309;
      case 57:
        v92 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v93 = qword_10000C688;
        else
          v93 = v92;
        v16 = (double)v93;
        v85 = 0x3E40000000000000;
        goto LABEL_309;
      case 58:
        v94 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v95 = qword_10000C688;
        else
          v95 = v94;
        v16 = (double)v95;
        v85 = 0x3E50000000000000;
        goto LABEL_309;
      case 59:
        v96 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v97 = qword_10000C688;
        else
          v97 = v96;
        v16 = (double)v97;
        v85 = 0x3E60000000000000;
        goto LABEL_309;
      case 60:
        v98 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v99 = qword_10000C688;
        else
          v99 = v98;
        v16 = (double)v99;
        v85 = 0x3E70000000000000;
        goto LABEL_309;
      case 61:
        v100 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v101 = qword_10000C688;
        else
          v101 = v100;
        v16 = (double)v101;
        v85 = 0x3E80000000000000;
        goto LABEL_309;
      case 62:
        v102 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v103 = qword_10000C688;
        else
          v103 = v102;
        v16 = (double)v103;
        v85 = 0x3E90000000000000;
        goto LABEL_309;
      case 63:
        v104 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v105 = qword_10000C688;
        else
          v105 = v104;
        v106 = (double)v105 / 2097408.0;
        goto LABEL_311;
      case 64:
        v107 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v108 = qword_10000C688;
        else
          v108 = v107;
        v16 = (double)v108;
        v85 = 0x3EB0000000000000;
        goto LABEL_309;
      case 65:
        v109 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v110 = qword_10000C688;
        else
          v110 = v109;
        v16 = (double)v110;
        v85 = 0x3EC0000000000000;
        goto LABEL_309;
      case 66:
        v111 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v112 = qword_10000C688;
        else
          v112 = v111;
        v16 = (double)v112;
        v85 = 0x3ED0000000000000;
        goto LABEL_309;
      case 67:
        v113 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v114 = qword_10000C688;
        else
          v114 = v113;
        v16 = (double)v114;
        v85 = 0x3EE0000000000000;
        goto LABEL_309;
      case 68:
        v115 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v116 = qword_10000C688;
        else
          v116 = v115;
        v16 = (double)v116;
        goto LABEL_308;
      case 69:
        v117 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v56 = qword_10000C688;
        else
          v56 = v117;
LABEL_220:
        v16 = (double)v56;
LABEL_221:
        v85 = 0x3F00000000000000;
        goto LABEL_309;
      case 70:
        v118 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v58 = qword_10000C688;
        else
          v58 = v118;
LABEL_225:
        v16 = (double)v58;
LABEL_226:
        v85 = 0x3F10000000000000;
        goto LABEL_309;
      case 71:
        v119 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v60 = qword_10000C688;
        else
          v60 = v119;
LABEL_230:
        v16 = (double)v60;
LABEL_231:
        v85 = 0x3F20000000000000;
        goto LABEL_309;
      case 72:
        v120 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v62 = qword_10000C688;
        else
          v62 = v120;
LABEL_235:
        v16 = (double)v62;
LABEL_236:
        v85 = 0x3F30000000000000;
        goto LABEL_309;
      case 73:
        v121 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v64 = qword_10000C688;
        else
          v64 = v121;
LABEL_240:
        v16 = (double)v64;
LABEL_241:
        v85 = 0x3F40000000000000;
        goto LABEL_309;
      case 74:
        v122 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v66 = qword_10000C688;
        else
          v66 = v122;
LABEL_245:
        v16 = (double)v66;
LABEL_246:
        v85 = 0x3F50000000000000;
        goto LABEL_309;
      case 75:
        v123 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v68 = qword_10000C688;
        else
          v68 = v123;
LABEL_250:
        v16 = (double)v68;
LABEL_251:
        v85 = 0x3F60000000000000;
        goto LABEL_309;
      case 76:
        v124 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v10 = qword_10000C688;
        else
          v10 = v124;
LABEL_255:
        v16 = (double)v10;
LABEL_256:
        v85 = 0x3F70000000000000;
        goto LABEL_309;
      case 78:
        v125 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v70 = qword_10000C688;
        else
          v70 = v125;
LABEL_260:
        v16 = (double)v70;
        v85 = 0x3F80000000000000;
        goto LABEL_309;
      case 79:
        v126 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v72 = qword_10000C688;
        else
          v72 = v126;
LABEL_264:
        v16 = (double)v72;
LABEL_265:
        v85 = 0x3F90000000000000;
        goto LABEL_309;
      case 80:
        v127 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v74 = qword_10000C688;
        else
          v74 = v127;
LABEL_269:
        v16 = (double)v74;
        v85 = 0x3FA0000000000000;
        goto LABEL_309;
      case 81:
        v128 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v76 = qword_10000C688;
        else
          v76 = v128;
LABEL_273:
        v16 = (double)v76;
        goto LABEL_301;
      case 82:
        v129 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v78 = qword_10000C688;
        else
          v78 = v129;
LABEL_277:
        v16 = (double)v78;
        v130 = 0.125;
        goto LABEL_310;
      case 83:
        v131 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v80 = qword_10000C688;
        else
          v80 = v131;
LABEL_281:
        v16 = (double)v80;
LABEL_282:
        v130 = 0.25;
        goto LABEL_310;
      case 84:
        v132 = bswap32(qword_10000C688);
        if (dword_10000C218)
          v82 = qword_10000C688;
        else
          v82 = v132;
LABEL_286:
        v16 = (double)v82;
        v130 = 0.5;
        goto LABEL_310;
      case 85:
      case 100:
        v13 = bswap32(qword_10000C688);
        if (dword_10000C218)
          return (double)(int)qword_10000C688;
        else
          return (double)(int)v13;
      case 87:
        switch((int)v4)
        {
          case 1:
            goto LABEL_288;
          case 2:
            goto LABEL_5;
          case 4:
            goto LABEL_289;
          case 8:
            goto LABEL_293;
          default:
            return v5;
        }
        return v5;
      case 90:
        v136 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218)
          v137 = qword_10000C688;
        else
          v137 = v136;
        v16 = (double)v137;
LABEL_301:
        v85 = 0x3FB0000000000000;
        goto LABEL_309;
      case 91:
        v52 = *(float *)&qword_10000C688;
        goto LABEL_312;
      case 101:
        v138 = bswap64(qword_10000C688);
        if (dword_10000C218)
          return (double)qword_10000C688;
        else
          return (double)(uint64_t)v138;
      case 102:
LABEL_293:
        v134 = bswap64(qword_10000C688);
        if (dword_10000C218)
          return (double)(unint64_t)qword_10000C688;
        else
          return (double)v134;
      case 103:
        v16 = (double)qword_10000C688;
LABEL_308:
        v85 = 0x3EF0000000000000;
LABEL_309:
        v130 = *(double *)&v85;
LABEL_310:
        v106 = v16 * v130;
LABEL_311:
        v52 = v106;
LABEL_312:
        v5 = v52;
        break;
      default:
        return v5;
    }
  }
  return v5;
}

uint64_t sub_100006438(uint64_t a1, const char *a2, unsigned int a3, unsigned __int8 *a4)
{
  int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  unsigned __int8 v15;
  _OWORD outputStruct[10];
  uint64_t v18;
  int v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  int v23;

  v20 = 0u;
  v21 = 0u;
  memset(v22, 0, sizeof(v22));
  v23 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  v18 = 0;
  v19 = sub_1000033A8(a2);
  if (dword_10000C628)
    printf("writing key %s to value %x %x\n", a2, *a4, a4[1]);
  DWORD2(v21) = a3;
  v22[6] = 6;
  if (a3)
    memcpy(&v22[12], a4, a3);
  v7 = dword_10000C628;
  if (dword_10000C628)
  {
    NSLog(CFSTR("Inside Function"));
    v7 = dword_10000C628;
  }
  if (a3)
  {
    v8 = a3;
    v9 = &v22[12];
    v10 = v7;
    do
    {
      if (v10)
      {
        printf("%x ", *v9);
        v7 = dword_10000C628;
        v10 = dword_10000C628;
      }
      ++v9;
      --v8;
    }
    while (v8);
  }
  if (v7)
  {
    putchar(10);
    v7 = dword_10000C628;
  }
  if (a3)
  {
    v11 = a3;
    v12 = &v22[12];
    v13 = v7;
    do
    {
      if (v13)
      {
        printf("%c ", *v12);
        v7 = dword_10000C628;
        v13 = dword_10000C628;
      }
      ++v12;
      --v11;
    }
    while (v11);
  }
  if (v7)
    putchar(10);
  v14 = sub_100006AC4(2, dword_10000C630, &v19, outputStruct, 1);
  v15 = v14;
  if (dword_10000C628)
    printf("writing key result = %d\n", v14);
  return v15;
}

uint64_t sub_100006640(mach_port_t a1, const char *a2, int a3, unsigned __int8 *a4)
{
  uint64_t v5;
  uint64_t v8;
  char v9;
  int v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  _OWORD outputStruct[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  int v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  int v29;

  LODWORD(v5) = a3;
  v26 = 0u;
  v27 = 0u;
  memset(v28, 0, sizeof(v28));
  v29 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0;
  v25 = sub_1000033A8(a2);
  if (dword_10000C628)
    printf("writing key %s to sz %d value %x %x\n", a2, v5, *a4, a4[1]);
  DWORD2(v27) = v5;
  v28[6] = 6;
  if (!(_DWORD)v5)
  {
    if (!dword_10000C628)
      goto LABEL_12;
    goto LABEL_11;
  }
  v5 = v5;
  v8 = v5;
  do
  {
    v9 = *a4++;
    v28[v8-- + 11] = v9;
  }
  while (v8);
  v10 = dword_10000C628;
  v11 = &v28[12];
  v12 = dword_10000C628;
  do
  {
    if (v12)
    {
      printf("%x ", *v11);
      v10 = dword_10000C628;
      v12 = dword_10000C628;
    }
    ++v11;
    --v5;
  }
  while (v5);
  if (v10)
LABEL_11:
    putchar(10);
LABEL_12:
  v13 = sub_100006AC4(2, a1, &v25, outputStruct, 1);
  if (dword_10000C628 && (v13 || BYTE8(v16)))
    printf("writing key result = %d  smcpOutput.result %d\n", v13, BYTE8(v16));
  return BYTE8(v16);
}

uint64_t sub_1000067F8()
{
  return 31;
}

uint64_t sub_100006AC4(int a1, mach_port_t connection, const void *a3, void *outputStruct, int a5)
{
  uint64_t v6;
  const char *v7;
  size_t outputStructCnt;

  if (a1 == 2)
  {
    outputStructCnt = 168;
    v6 = IOConnectCallStructMethod(connection, 2u, a3, 0xA8uLL, outputStruct, &outputStructCnt);
    if (a5)
      return v6;
  }
  else
  {
    printf("ASMCF::callFunction ERROR: unrecognized index(%d)\n", a1);
    v6 = 3758097084;
    if (a5)
      return v6;
  }
  if ((_DWORD)v6)
  {
    v7 = sub_100006B58(v6);
    printf("ASMCF::callFunction ERROR: IOConnectMethod returned %s\n", v7);
  }
  return v6;
}

const char *sub_100006B58(int a1)
{
  const char *result;

  switch(a1)
  {
    case -536870212:
      result = "kIOReturnError";
      break;
    case -536870211:
    case -536870210:
    case -536870209:
    case -536870208:
    case -536870205:
    case -536870204:
    case -536870202:
    case -536870200:
      goto LABEL_6;
    case -536870207:
      result = "kIOReturnNotPrivileged";
      break;
    case -536870206:
      result = "kIOReturnBadArgument";
      break;
    case -536870203:
      result = "kIOReturnExclusiveAccess";
      break;
    case -536870201:
      result = "kIOReturnUnsupported";
      break;
    case -536870199:
      result = "kIOReturnInternalError";
      break;
    case -536870198:
      result = "kIOReturnIOError";
      break;
    default:
      if (a1 == -536870174)
      {
        result = "kIOReturnNotPermitted";
      }
      else if (a1)
      {
LABEL_6:
        printf("smc unknown error (0x%02x)\n", a1);
        result = "unknown error";
      }
      else
      {
        result = "kIOReturnSuccess";
      }
      break;
  }
  return result;
}

uint64_t sub_100006C34(uint32_t a1, int a2)
{
  kern_return_t v4;
  mach_port_t v5;
  const __CFDictionary *v6;
  kern_return_t MatchingServices;
  io_service_t v9;
  kern_return_t v10;
  const char *v11;
  kern_return_t v12;
  io_connect_t connect;
  mach_port_t mainPort[2];

  *(_QWORD *)mainPort = 0;
  connect = 0;
  v4 = IOMasterPort(0, &mainPort[1]);
  if (v4)
  {
    sub_100006B58(v4);
    printf("ASMCF::openAppleSMC ERROR - IOMasterPort returned %s\n");
    return 0;
  }
  v5 = mainPort[1];
  v6 = IOServiceMatching("AppleSMC");
  MatchingServices = IOServiceGetMatchingServices(v5, v6, mainPort);
  if (MatchingServices)
  {
    sub_100006B58(MatchingServices);
    printf("ASMCF::openAppleSMC ERROR - IOServiceGetMatchingServices returned %s\n");
    return 0;
  }
  v9 = IOIteratorNext(mainPort[0]);
  IOObjectRelease(mainPort[0]);
  if (!v9)
  {
    if (!a2)
      return 0;
    v11 = "ASMCF::callFunction ERROR - could not find AppleSMC";
LABEL_16:
    puts(v11);
    return 0;
  }
  v10 = IOServiceOpen(v9, mach_task_self_, a1, &connect);
  IOObjectRelease(v9);
  if (v10)
  {
    sub_100006B58(v10);
    printf("ASMCF::callFunction ERROR - IOServiceOpen returned %s\n");
    return 0;
  }
  if (!connect)
  {
    v11 = "ASMCF::callFunction ERROR - resultPort == NULL";
    goto LABEL_16;
  }
  v12 = IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0);
  if (!v12)
    return connect;
  sub_100006B58(v12);
  printf("ASMCF::callFunction ERROR - OpenUserClient returned %s\n");
  return 0;
}

uint64_t sub_100006D88(mach_port_t a1)
{
  kern_return_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;

  v2 = IOConnectCallScalarMethod(a1, 1u, 0, 0, 0, 0);
  if (v2)
  {
    v3 = sub_100006B58(v2);
    printf("ASMCF::callFunction ERROR: CloseUserClient returned %s\n", v3);
  }
  v4 = IOServiceClose(a1);
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = sub_100006B58(v4);
    printf("ASMCF::callFunction ERROR: IOServiceClose returned %s\n", v6);
  }
  return v5;
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addToTimeArray_idx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToTimeArray:idx:");
}

id objc_msgSend_addToValueArray_idx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToValueArray:idx:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_initWith_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWith:");
}

id objc_msgSend_initWithT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithT:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keyString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyString");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_numValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numValues");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_valueDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueDouble:");
}

id objc_msgSend_valueStr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueStr:");
}
