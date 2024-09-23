BOOL ETLSAHGetRecordEx(uint64_t a1, void (**a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, size_t __size)
{
  unsigned int v7;
  unsigned int v13;
  int v14;
  unsigned int v15;
  capabilities::coredump *v16;
  capabilities::coredump *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unint64_t v21;
  unsigned int (*v22)(uint64_t, capabilities::coredump *, uint64_t, CFNumberRef *, uint64_t, uint64_t, _QWORD);
  int v23;
  _BOOL8 v24;
  unsigned int (*v25)(uint64_t, capabilities::coredump *, unint64_t, CFNumberRef *, uint64_t, uint64_t, _QWORD);
  unsigned int (*v26)(uint64_t, _QWORD, CFNumberRef *);
  unsigned int v28;
  uint64_t v29;
  int v30;
  CFNumberRef number;
  unsigned int valuePtr;
  uint64_t v34;
  int v35;
  int v36;
  unint64_t v37;

  v7 = __size;
  v14 = *(_DWORD *)(a3 + 4);
  v13 = *(_DWORD *)(a3 + 8);
  if (v13 <= 0x40000000)
    v15 = *(_DWORD *)(a3 + 8);
  else
    v15 = 0;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v34 = *(_QWORD *)(a4 + 8);
  v35 = v14;
  v36 = v14 + v15;
  v16 = (capabilities::coredump *)malloc(__size);
  if (!v16)
    return 0;
  v17 = v16;
  v29 = a5;
  valuePtr = 0;
  v30 = capabilities::coredump::coredumpInterface(v16);
  if (v30 == 8)
  {
    v18 = *(_DWORD *)(a4 + 16) * (v15 / v7);
  }
  else
  {
    number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    v26 = *(unsigned int (**)(uint64_t, _QWORD, CFNumberRef *))(a1 + 72);
    if (!v26
      || !v26(a1, *MEMORY[0x24BED9EF8], &number)
      || !CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr)
      || !valuePtr)
    {
      free(v17);
      return 0;
    }
    v18 = (v15 % v7 / valuePtr + v15 / v7) * *(_DWORD *)(a4 + 16);
  }
  if (v18 < 0x64)
    v19 = 1;
  else
    v19 = v18 / 0x64;
  if (v15)
  {
    if (v7 >= 0x10)
    {
      v28 = v19;
      v20 = 1;
      while (1)
      {
        if (v13 >= v7)
          v21 = v7;
        else
          v21 = v13;
        if (v30 != 8)
          v21 = (__PAIR64__(v21, v21 % valuePtr) - 1) >> 32;
        *(_QWORD *)v17 = 0x100000000ALL;
        *((_DWORD *)v17 + 2) = v14;
        *((_DWORD *)v17 + 3) = v21;
        v22 = *(unsigned int (**)(uint64_t, capabilities::coredump *, uint64_t, CFNumberRef *, uint64_t, uint64_t, _QWORD))a1;
        if (!*(_QWORD *)a1)
          break;
        LODWORD(number) = -1431655766;
        if (!v22(a1, v17, 16, &number, 1, a6, 0))
          break;
        v23 = *((_DWORD *)v17 + 1);
        v24 = (_DWORD)number == v23;
        if ((_DWORD)number != v23)
          goto LABEL_39;
        LODWORD(number) = 0;
        v25 = *(unsigned int (**)(uint64_t, capabilities::coredump *, unint64_t, CFNumberRef *, uint64_t, uint64_t, _QWORD))(a1 + 8);
        if (!v25 || !v25(a1, v17, v21, &number, 1, a6, 0) || (_DWORD)v21 != (_DWORD)number)
        {
          _ETLDebugPrint();
          break;
        }
        if (*a2)
        {
          (*a2)();
          LODWORD(v21) = (_DWORD)number;
        }
        v14 += v21;
        if (!--v20)
        {
          LODWORD(v37) = v14;
          (*(void (**)(uint64_t, uint64_t *, uint64_t))(v29 + 16))(v29, &v34, a3);
          v20 = v28;
        }
        v13 -= v21;
        if (!v13)
          goto LABEL_39;
      }
    }
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
LABEL_39:
  free(v17);
  return v24;
}

uint64_t ETLSAHCommandReceive(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4)
{
  uint64_t result;
  unint64_t v7;
  unsigned int Size;
  unsigned int Remaining;
  _DWORD *v10;
  unint64_t v11;

  if (a4 < 8)
    return 0;
  v7 = a4 - 8;
  while (1)
  {
    Size = TelephonyUtilRingBufferGetSize();
    Remaining = TelephonyUtilRingBufferGetLinearReadRemaining();
    if (Size >= 8)
      break;
LABEL_4:
    if ((int)TelephonyUtilRingBufferInsertTransport() <= 0)
      return 0;
  }
  if (Remaining <= 7)
  {
    result = TelephonyUtilRingBufferLinearize();
    if (!(_DWORD)result)
      return result;
  }
  v10 = (_DWORD *)(*(_QWORD *)a2 + *(unsigned int *)(a2 + 16));
  v11 = v10[1];
  *a3 = *v10;
  a3[1] = v11;
  if (v11 >= 8 && v7 >= v11)
  {
    if (v11 <= Size)
    {
      memcpy(a3 + 2, v10 + 2, (v11 - 8));
      TelephonyUtilRingBufferSkip();
      return 1;
    }
    goto LABEL_4;
  }
  _ETLDebugPrint();
  _ETLDebugPrintBinary();
  return 0;
}

uint64_t ETLSAHCommandSend(uint64_t (**a1)(void), uint64_t a2)
{
  uint64_t (*v2)(void);
  uint64_t result;
  int v5;

  v2 = *a1;
  if (!*a1)
    return 0;
  v5 = -1431655766;
  result = v2();
  if ((_DWORD)result)
    return v5 == *(_DWORD *)(a2 + 4);
  return result;
}

uint64_t ETLSAHGetDebugRecordCount(_QWORD *a1, uint64_t a2, _DWORD *a3, unsigned int a4, unsigned int *a5, uint64_t a6)
{
  unsigned int v11;
  uint64_t (*v12)(_QWORD *, _DWORD *, uint64_t, int *, uint64_t, uint64_t, _QWORD);
  uint64_t v13;
  int v15;

  if (!ETLSAHCommandReceive((uint64_t)a1, a2, a3, a4))
    goto LABEL_10;
  if (*a3 != 9)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    goto LABEL_12;
  }
  if ((a3[1] & 0xFFFFFFF8) == 8)
  {
LABEL_12:
    v13 = 0;
LABEL_13:
    *a5 = 0;
    _ETLDebugPrint();
    return v13;
  }
  v11 = a3[3];
  if (!v11)
  {
    v13 = 1;
    goto LABEL_13;
  }
  if (a4 < 0x10
    || (*(_QWORD *)a3 = 0x100000000ALL,
        (v12 = (uint64_t (*)(_QWORD *, _DWORD *, uint64_t, int *, uint64_t, uint64_t, _QWORD))*a1) == 0)
    || (v15 = -1431655766, (v12(a1, a3, 16, &v15, 1, a6, 0) & 1) == 0)
    || v15 != a3[1])
  {
LABEL_10:
    _ETLDebugPrint();
    return 0;
  }
  *a5 = v11 / 0x34;
  return 1;
}

uint64_t ETLSAHGetDebugTable(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;

  TelephonyUtilRingBufferReset();
  if ((int)TelephonyUtilRingBufferInsertTransport() >= 1
    && (v7 = *a2) != 0
    && (v8 = *((unsigned int *)a2 + 4), 52 * a4 == TelephonyUtilRingBufferGetLinearReadRemaining()))
  {
    if (a4)
    {
      v9 = a4;
      v10 = (__int128 *)(v7 + v8);
      do
      {
        v11 = *v10;
        v12 = v10[1];
        v13 = v10[2];
        v14 = *((_DWORD *)v10 + 12);
        v10 = (__int128 *)((char *)v10 + 52);
        *(_DWORD *)(a3 + 48) = v14;
        *(_OWORD *)(a3 + 16) = v12;
        *(_OWORD *)(a3 + 32) = v13;
        *(_OWORD *)a3 = v11;
        a3 += 52;
        --v9;
      }
      while (v9);
    }
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

BOOL ETLSAHCommandCreateReset(_QWORD *a1, unsigned int a2)
{
  if (a2 >= 8)
    *a1 = 0x800000007;
  return a2 > 7;
}

char *ETLSAHReturnAsString(int a1)
{
  return (&ETLSAHReturnAsString::ETLSAHReturnStrings)[a1];
}

const char *ETLSAHModeAsString(int a1)
{
  const char *result;

  result = "ETLSAHModePending";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "ETLSAHModeComplete";
      break;
    case 2:
      result = "ETLSAHModeMemoryDebug";
      break;
    case 3:
      result = "ETLSAHModeCommand";
      break;
    default:
      if (a1 == 256)
        result = "ETLSAHModeMaverick";
      else
        result = "Unknown";
      break;
  }
  return result;
}

const char *ETLSAHExecutionCommandIDAsString(unsigned int a1)
{
  if (a1 > 9)
    return "Unknown";
  else
    return (&off_24E3584E8)[a1];
}

uint64_t ETLSAHSendReadData(uint64_t (**a1)(void), uint64_t a2, int a3)
{
  uint64_t result;

  if (!*a1)
    return 0;
  LODWORD(result) = (*a1)();
  if (a3 == -1431655766)
    return result;
  else
    return 0;
}

uint64_t ETLSAHCommandExecute(_DWORD *a1, unsigned int a2, _QWORD *a3, uint64_t a4, int a5, uint64_t a6, unint64_t a7, unint64_t *a8, unsigned int a9)
{
  uint64_t (*v12)(_QWORD *, _DWORD *, uint64_t, int *, uint64_t, _QWORD, _QWORD);
  int v19;
  unint64_t v20;
  uint64_t (*v21)(_QWORD *, _DWORD *, uint64_t, int *, uint64_t, _QWORD, _QWORD);
  unsigned int (*v22)(_QWORD *, uint64_t, _QWORD, int *, uint64_t, _QWORD, _QWORD);
  int v23;
  int v24;
  int v25;

  *a8 = 0;
  if (a2 < 0xC || !a1)
  {
    _ETLDebugPrint();
LABEL_10:
    _ETLDebugPrint();
    return 2;
  }
  *(_QWORD *)a1 = 0xC0000000DLL;
  a1[2] = a5;
  v12 = (uint64_t (*)(_QWORD *, _DWORD *, uint64_t, int *, uint64_t, _QWORD, _QWORD))*a3;
  if (!*a3)
    goto LABEL_25;
  v24 = -1431655766;
  if ((v12(a3, a1, 12, &v24, 1, a9, 0) & 1) == 0
    || v24 != a1[1]
    || (ETLSAHCommandReceive((uint64_t)a3, a4, a1, a2) & 1) == 0)
  {
    goto LABEL_25;
  }
  if ((a1[1] & 0xFFFFFFF8) == 8)
    goto LABEL_16;
  if (*a1 != 14)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
LABEL_16:
    _ETLDebugPrint();
    goto LABEL_10;
  }
  v19 = a1[2];
  v20 = a1[3];
  *a8 = v20;
  if (v19 != a5)
  {
    _ETLDebugPrint();
    return 5;
  }
  if (v20 > a7)
  {
    _ETLDebugPrint();
    return 3;
  }
  *(_QWORD *)a1 = 0xC0000000FLL;
  a1[2] = a5;
  v21 = (uint64_t (*)(_QWORD *, _DWORD *, uint64_t, int *, uint64_t, _QWORD, _QWORD))*a3;
  if (*a3)
  {
    v25 = -1431655766;
    if ((v21(a3, a1, 12, &v25, 1, a9, 0) & 1) != 0 && v25 == a1[1])
    {
      v23 = 0;
      v22 = (unsigned int (*)(_QWORD *, uint64_t, _QWORD, int *, uint64_t, _QWORD, _QWORD))a3[1];
      if (v22)
      {
        if (v22(a3, a6, *(unsigned int *)a8, &v23, 1, a9, 0) && *a8 == v23)
          return 0;
      }
    }
  }
LABEL_25:
  _ETLDebugPrint();
  return 4;
}

uint64_t ETLSAHCommandExecuteCreate(uint64_t a1, int a2, unint64_t a3)
{
  if (a3 > 0xB && a1)
  {
    *(_QWORD *)a1 = 0xC0000000DLL;
    *(_DWORD *)(a1 + 8) = a2;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandExecuteParseResponse(_DWORD *a1, _DWORD *a2, _QWORD *a3)
{
  uint64_t v4;

  if (a1 && a2 && a3 && (a1[1] & 0xFFFFFFF8) != 8)
  {
    if (*a1 == 14)
    {
      v4 = a1[3];
      *a2 = a1[2];
      *a3 = v4;
      return 1;
    }
    else
    {
      _ETLDebugPrint();
      _ETLDebugPrintBinary();
      _ETLDebugPrint();
      return 0;
    }
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandExecuteDataCreate(uint64_t a1, int a2, unint64_t a3)
{
  if (a3 > 0xB && a1)
  {
    *(_QWORD *)a1 = 0xC0000000FLL;
    *(_DWORD *)(a1 + 8) = a2;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandParseHello(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _QWORD *a6, _DWORD *a7)
{
  int v7;

  v7 = a1[1];
  if (*a1 != 1)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
  if ((v7 - 24) > 0xFFFFFFEF)
    return 0;
  *a2 = a1[2];
  *a3 = a1[3];
  *a4 = a1[4];
  *a5 = a1[5];
  if (a6)
    *a6 = a1 + 6;
  if (a7)
    *a7 = v7 - 24;
  return 1;
}

BOOL ETLSAHCommandCreateHelloResponse(uint64_t a1, unsigned int a2, int a3, int a4, int a5, int a6)
{
  if (a2 >= 0x30)
  {
    *(_QWORD *)a1 = 0x3000000002;
    *(_DWORD *)(a1 + 8) = a3;
    *(_DWORD *)(a1 + 12) = a4;
    *(_DWORD *)(a1 + 16) = a5;
    *(_DWORD *)(a1 + 20) = a6;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a2 > 0x2F;
}

uint64_t ETLSAHCommandCreateHelloResponseExt(uint64_t a1, unsigned int a2, int a3, int a4, int a5, int a6, void *__src, size_t __n)
{
  _QWORD *v8;

  if (a2 < 0x30)
    return 0;
  *(_QWORD *)a1 = 0x3000000002;
  *(_DWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 12) = a4;
  *(_DWORD *)(a1 + 16) = a5;
  *(_DWORD *)(a1 + 20) = a6;
  v8 = (_QWORD *)(a1 + 24);
  if (__src)
  {
    if (__n > 0x18)
    {
      return 0;
    }
    else
    {
      memcpy(v8, __src, __n);
      return 1;
    }
  }
  else
  {
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    return 1;
  }
}

uint64_t ETLSAHCommandParseMemoryDebug(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (*a1 == 9)
  {
    if ((a1[1] & 0xFFFFFFF8) == 8)
    {
      return 0;
    }
    else
    {
      *a2 = a1[2];
      *a3 = a1[3];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
}

BOOL ETLSAHCommandCreateMemoryRead(uint64_t a1, unsigned int a2, int a3, int a4)
{
  if (a2 >= 0x10)
  {
    *(_QWORD *)a1 = 0x100000000ALL;
    *(_DWORD *)(a1 + 8) = a3;
    *(_DWORD *)(a1 + 12) = a4;
  }
  return a2 > 0xF;
}

uint64_t ETLSAHCommandParseReadData(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  if (*a1 == 3)
  {
    if ((a1[1] - 20) <= 0xFFFFFFF3)
    {
      *a2 = a1[2];
      *a3 = a1[3];
      *a4 = a1[4];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return 0;
}

uint64_t ETLSAHCommandParseEndOfImageTransfer(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (*a1 == 4)
  {
    if ((a1[1] & 0xFFFFFFF8) == 8)
    {
      return 0;
    }
    else
    {
      *a2 = a1[2];
      *a3 = a1[3];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
}

BOOL ETLSAHCommandCreateDone(_QWORD *a1, unsigned int a2)
{
  if (a2 >= 8)
    *a1 = 0x800000005;
  return a2 > 7;
}

uint64_t ETLSAHCommandParseDoneResponse(_DWORD *a1, _DWORD *a2)
{
  if (*a1 == 6)
  {
    if ((a1[1] & 0xFFFFFFFC) == 8)
    {
      return 0;
    }
    else
    {
      *a2 = a1[2];
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
}

BOOL ETLSAHCommandParseResetResponse(int *a1)
{
  int v1;

  v1 = *a1;
  if (*a1 != 8)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return v1 == 8;
}

BOOL ETLSAHCommandParseCommandReady(int *a1)
{
  int v1;

  v1 = *a1;
  if (*a1 != 11)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return v1 == 11;
}

uint64_t ETLSAHCommandCreateSwitchMode(uint64_t a1, int a2, unint64_t a3)
{
  if (a3 > 0xB && a1)
  {
    *(_QWORD *)a1 = 0xC0000000CLL;
    *(_DWORD *)(a1 + 8) = a2;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandParseMaverickEraseQuery(_DWORD *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;

  result = 0;
  if (a2 && a3)
  {
    if (*a1 == 160)
    {
      *a3 = a1[1] - 8;
      *a2 = a1 + 2;
      return 1;
    }
    else
    {
      _ETLDebugPrint();
      _ETLDebugPrintBinary();
      return 0;
    }
  }
  return result;
}

BOOL ETLSAHCommandCreateMaverickEraseResponse(_DWORD *a1, unsigned int a2, int a3, char a4)
{
  unsigned int v4;

  if ((a4 & 1) != 0)
    v4 = 16;
  else
    v4 = 12;
  if (v4 <= a2)
  {
    *a1 = 161;
    a1[1] = v4;
    a1[2] = a3;
    if ((a4 & 1) != 0)
      a1[3] = 1213417795;
  }
  return v4 <= a2;
}

uint64_t ETLSAHCommandParseMaverickSendHashesQuery(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  _OWORD *v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
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

  if (*(_DWORD *)a1 != 165)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
  v4 = *(_DWORD *)(a1 + 4) - 8;
  v5 = (_OWORD *)(a1 + 8);
  v6 = ETLDLOADGetProtocolVersion();
  if (v6)
  {
    if (v6 == 1)
    {
      _ETLDebugPrint();
      if (v4 >= 0x140)
      {
        v23 = *(_OWORD *)(a1 + 24);
        *(_OWORD *)a2 = *v5;
        *(_OWORD *)(a2 + 16) = v23;
        v24 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 40);
        *(_OWORD *)(a2 + 48) = v24;
        v25 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 72);
        *(_OWORD *)(a2 + 80) = v25;
        v26 = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 104);
        *(_OWORD *)(a2 + 112) = v26;
        v27 = *(_OWORD *)(a1 + 152);
        *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 136);
        *(_OWORD *)(a2 + 144) = v27;
        v28 = *(_OWORD *)(a1 + 184);
        *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 168);
        *(_OWORD *)(a2 + 176) = v28;
        v29 = *(_OWORD *)(a1 + 216);
        *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 200);
        *(_OWORD *)(a2 + 208) = v29;
        v30 = *(_OWORD *)(a1 + 248);
        *(_OWORD *)(a2 + 224) = *(_OWORD *)(a1 + 232);
        *(_OWORD *)(a2 + 240) = v30;
        v31 = *(_OWORD *)(a1 + 280);
        *(_OWORD *)(a2 + 256) = *(_OWORD *)(a1 + 264);
        *(_OWORD *)(a2 + 272) = v31;
        v32 = *(_OWORD *)(a1 + 312);
        *(_OWORD *)(a2 + 288) = *(_OWORD *)(a1 + 296);
        *(_OWORD *)(a2 + 304) = v32;
        return 1;
      }
    }
    else if (v6 == 2)
    {
      _ETLDebugPrint();
      if (v4 >= 0xC0)
      {
        v7 = *v5;
        v8 = *(_OWORD *)(a1 + 40);
        *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 24);
        *(_OWORD *)(a2 + 32) = v8;
        *(_OWORD *)a2 = v7;
        v9 = *(_OWORD *)(a1 + 56);
        v10 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 72);
        *(_OWORD *)(a2 + 80) = v10;
        *(_OWORD *)(a2 + 48) = v9;
        v11 = *(_OWORD *)(a1 + 104);
        v12 = *(_OWORD *)(a1 + 136);
        *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(a2 + 128) = v12;
        *(_OWORD *)(a2 + 96) = v11;
        v13 = *(_OWORD *)(a1 + 152);
        v14 = *(_OWORD *)(a1 + 184);
        *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 168);
        *(_OWORD *)(a2 + 176) = v14;
        *(_OWORD *)(a2 + 144) = v13;
        return 1;
      }
    }
    else if (v4 >= 0x3C)
    {
      v33 = *v5;
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 24);
      *(_OWORD *)a2 = v33;
      v34 = *(_OWORD *)(a1 + 28);
      *(_DWORD *)(a2 + 36) = *(_DWORD *)(a1 + 44);
      *(_OWORD *)(a2 + 20) = v34;
      v35 = *(_OWORD *)(a1 + 48);
      *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 64);
      *(_OWORD *)(a2 + 40) = v35;
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    if (v4 >= 0x8C)
    {
      v16 = *v5;
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 24);
      *(_OWORD *)a2 = v16;
      v17 = *(_OWORD *)(a1 + 28);
      *(_DWORD *)(a2 + 36) = *(_DWORD *)(a1 + 44);
      *(_OWORD *)(a2 + 20) = v17;
      v18 = *(_OWORD *)(a1 + 48);
      *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 64);
      *(_OWORD *)(a2 + 40) = v18;
      v19 = *(_OWORD *)(a1 + 68);
      *(_DWORD *)(a2 + 76) = *(_DWORD *)(a1 + 84);
      *(_OWORD *)(a2 + 60) = v19;
      v20 = *(_OWORD *)(a1 + 88);
      *(_DWORD *)(a2 + 96) = *(_DWORD *)(a1 + 104);
      *(_OWORD *)(a2 + 80) = v20;
      v21 = *(_OWORD *)(a1 + 108);
      *(_DWORD *)(a2 + 116) = *(_DWORD *)(a1 + 124);
      *(_OWORD *)(a2 + 100) = v21;
      v22 = *(_OWORD *)(a1 + 128);
      *(_DWORD *)(a2 + 136) = *(_DWORD *)(a1 + 144);
      *(_OWORD *)(a2 + 120) = v22;
      return 1;
    }
  }
  return 0;
}

uint64_t ETLSAHCommandParseMaverickConfigQuery(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (*(_DWORD *)a1 == 169)
  {
    if ((*(_DWORD *)(a1 + 4) - 280) <= 0xFFFFFEEF)
    {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 12);
      *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 20);
      v2 = *(_OWORD *)(a1 + 24);
      v3 = *(_OWORD *)(a1 + 40);
      v4 = *(_OWORD *)(a1 + 72);
      *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 56);
      *(_OWORD *)(a2 + 64) = v4;
      *(_OWORD *)(a2 + 16) = v2;
      *(_OWORD *)(a2 + 32) = v3;
      v5 = *(_OWORD *)(a1 + 88);
      v6 = *(_OWORD *)(a1 + 104);
      v7 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)(a2 + 112) = *(_OWORD *)(a1 + 120);
      *(_OWORD *)(a2 + 128) = v7;
      *(_OWORD *)(a2 + 80) = v5;
      *(_OWORD *)(a2 + 96) = v6;
      v8 = *(_OWORD *)(a1 + 152);
      v9 = *(_OWORD *)(a1 + 168);
      v10 = *(_OWORD *)(a1 + 200);
      *(_OWORD *)(a2 + 176) = *(_OWORD *)(a1 + 184);
      *(_OWORD *)(a2 + 192) = v10;
      *(_OWORD *)(a2 + 144) = v8;
      *(_OWORD *)(a2 + 160) = v9;
      v11 = *(_OWORD *)(a1 + 216);
      v12 = *(_OWORD *)(a1 + 232);
      v13 = *(_OWORD *)(a1 + 264);
      *(_OWORD *)(a2 + 240) = *(_OWORD *)(a1 + 248);
      *(_OWORD *)(a2 + 256) = v13;
      *(_OWORD *)(a2 + 208) = v11;
      *(_OWORD *)(a2 + 224) = v12;
      *(_BYTE *)(a2 + 271) = 0;
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return 0;
}

uint64_t ETLSAHCommandCreateMaverickConfigResponse(uint64_t a1, int a2, int a3, uint64_t a4, unsigned int a5)
{
  if (a5 > 0x17 && a1)
  {
    *(_QWORD *)a1 = 0x18000000AALL;
    *(_DWORD *)(a1 + 8) = a2;
    *(_DWORD *)(a1 + 12) = a3;
    *(_QWORD *)(a1 + 16) = a4;
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

BOOL ETLSAHCommandCreateMaverickHashResponse(uint64_t a1, unsigned int a2, int a3)
{
  if (a2 >= 0xC)
  {
    *(_QWORD *)a1 = 0xC000000A6;
    *(_DWORD *)(a1 + 8) = a3;
  }
  return a2 > 0xB;
}

uint64_t ETLSAHCommandParseChipID(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (a1 && a3 && a2 > 7)
  {
    *a3 = *(_DWORD *)(a1 + 4);
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLSAHCommandParseMaverickRootManifestQuery(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v10;
  __int128 v11;

  if (*(_DWORD *)a1 != 162)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
    return 0;
  }
  v4 = *(_DWORD *)(a1 + 4) - 8;
  v5 = ETLDLOADGetProtocolVersion();
  if (v5 >= 2)
  {
    if (v5 == 2)
    {
      _ETLDebugPrint();
      if (v4 >= 0x50)
      {
        *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
        v10 = *(_OWORD *)(a1 + 12);
        *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 28);
        *(_OWORD *)(a2 + 4) = v10;
        *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 36);
        v7 = *(_OWORD *)(a1 + 40);
        v8 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 72);
        goto LABEL_9;
      }
    }
    else if (v4 >= 0x20)
    {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
      v11 = *(_OWORD *)(a1 + 12);
      *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 28);
      *(_OWORD *)(a2 + 4) = v11;
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 36);
      return 1;
    }
  }
  else
  {
    _ETLDebugPrint();
    if (v4 >= 0x40)
    {
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 8);
      v6 = *(_OWORD *)(a1 + 12);
      *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 28);
      *(_OWORD *)(a2 + 4) = v6;
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 36);
      v7 = *(_OWORD *)(a1 + 40);
      v8 = *(_OWORD *)(a1 + 56);
LABEL_9:
      *(_OWORD *)(a2 + 32) = v7;
      *(_OWORD *)(a2 + 48) = v8;
      return 1;
    }
  }
  return 0;
}

BOOL ETLSAHCommandCreateMaverickRootManifestResponse(_DWORD *a1, unsigned int a2, void *__src, size_t __n)
{
  unsigned int v5;

  v5 = __n + 8;
  if ((int)__n + 8 <= a2)
  {
    *a1 = 163;
    a1[1] = v5;
    memcpy(a1 + 2, __src, __n);
  }
  return v5 <= a2;
}

BOOL ETLSAHCommandMaverickParseEnd(int *a1)
{
  int v1;

  v1 = *a1;
  if (*a1 != 164)
  {
    _ETLDebugPrint();
    _ETLDebugPrintBinary();
  }
  return v1 == 164;
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

uint64_t ETLDLOADGetProtocolVersion()
{
  return MEMORY[0x24BED3D88]();
}

uint64_t TelephonyUtilRingBufferGetLinearReadRemaining()
{
  return MEMORY[0x24BED9748]();
}

uint64_t TelephonyUtilRingBufferGetSize()
{
  return MEMORY[0x24BED9750]();
}

uint64_t TelephonyUtilRingBufferInsertTransport()
{
  return MEMORY[0x24BED9760]();
}

uint64_t TelephonyUtilRingBufferLinearize()
{
  return MEMORY[0x24BED9768]();
}

uint64_t TelephonyUtilRingBufferReset()
{
  return MEMORY[0x24BED9770]();
}

uint64_t TelephonyUtilRingBufferSkip()
{
  return MEMORY[0x24BED9778]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x24BED3FB8]();
}

uint64_t _ETLDebugPrintBinary()
{
  return MEMORY[0x24BED3FC0]();
}

uint64_t capabilities::coredump::coredumpInterface(capabilities::coredump *this)
{
  return MEMORY[0x24BED9610](this);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

