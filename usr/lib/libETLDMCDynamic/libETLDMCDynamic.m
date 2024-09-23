uint64_t ETLDMCMessageGetNumRanges(unsigned int *a1, int a2)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      result = a1[4];
      break;
    case 1:
      result = a1[20];
      break;
    case 2:
      result = a1[36];
      break;
    case 3:
      result = a1[52];
      break;
    default:
      result = _ETLDebugPrint();
      __break(1u);
      break;
  }
  return result;
}

uint64_t ETLDMCMessageGetRangeAndMasks(_DWORD *a1, int a2, unsigned int a3, _DWORD *a4, _QWORD *a5)
{
  _DWORD *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t result;

  switch(a2)
  {
    case 0:
      v5 = a1 + 4;
      v6 = a1[4];
      if (v6 > a3)
        goto LABEL_9;
      goto LABEL_10;
    case 1:
      v5 = a1 + 20;
      v6 = a1[20];
      if (v6 > a3)
        goto LABEL_9;
      goto LABEL_10;
    case 2:
      v5 = a1 + 36;
      v6 = a1[36];
      if (v6 <= a3)
        goto LABEL_10;
      goto LABEL_9;
    case 3:
      v5 = a1 + 52;
      v6 = a1[52];
      if (v6 <= a3)
        goto LABEL_10;
LABEL_9:
      v7 = *((_QWORD *)v5 + 1) + 16 * a3;
      *a4 = *(_DWORD *)v7;
      *a5 = *(_QWORD *)(v7 + 8);
LABEL_10:
      result = v6 > a3;
      break;
    default:
      result = _ETLDebugPrint();
      __break(1u);
      break;
  }
  return result;
}

_OWORD *_ETLDMCAllocate()
{
  _OWORD *result;

  pthread_once(&_ETLDMCRegisterClassOnce, (void (*)(void))_ETLDMCRegisterClass);
  result = (_OWORD *)_CFRuntimeCreateInstance();
  if (result)
  {
    result[15] = 0u;
    result[16] = 0u;
    result[13] = 0u;
    result[14] = 0u;
    result[11] = 0u;
    result[12] = 0u;
    result[9] = 0u;
    result[10] = 0u;
    result[7] = 0u;
    result[8] = 0u;
    result[5] = 0u;
    result[6] = 0u;
    result[3] = 0u;
    result[4] = 0u;
    result[1] = 0u;
    result[2] = 0u;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
  return result;
}

uint64_t _ETLDMCGetView(uint64_t a1, int a2)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      result = a1 + 16;
      break;
    case 1:
      result = a1 + 80;
      break;
    case 2:
      result = a1 + 144;
      break;
    case 3:
      result = a1 + 208;
      break;
    default:
      _ETLDebugPrint();
      result = 0;
      break;
  }
  return result;
}

uint64_t _ETLDMCRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  _ETLDMCHandleTypeID = result;
  return result;
}

void _ETLDMCHandleDestroy(_QWORD *a1)
{
  ETLDMCViewFree(a1 + 2);
  ETLDMCViewFree(a1 + 10);
  ETLDMCViewFree(a1 + 18);
  ETLDMCViewFree(a1 + 26);
}

uint64_t ETLLOGParseLogRecord(_QWORD *a1, _DWORD *a2, _QWORD *a3, _WORD *a4, unsigned __int16 *a5, unsigned int a6, unsigned int *a7)
{
  unsigned int v8;

  if (a6 < 0xC)
    return 0;
  v8 = *a5;
  *a7 = v8;
  if (v8 <= a6 && v8 > 0xB)
  {
    if (a1)
      *a1 = a5 + 6;
    if (a2)
      *a2 = v8 - 12;
    if (a3)
      *a3 = *(_QWORD *)(a5 + 2);
    if (a4)
      *a4 = a5[1];
    return 1;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLLOGParseLogHeader(uint64_t a1, unsigned int *a2, _QWORD *a3, _WORD *a4, uint64_t a5, unsigned int a6, _DWORD *a7)
{
  uint64_t result;
  unsigned int v8;

  result = 0;
  *a7 = 0;
  if (a6 >= 4)
  {
    if (*(_BYTE *)a5 == 16 && (v8 = *(unsigned __int16 *)(a5 + 2), *a2 = v8, v8 <= a6) && (*a7 = 4, a6 - 4 >= 0xC))
    {
      *a4 = *(_WORD *)(a5 + 6);
      *a3 = *(_QWORD *)(a5 + 8);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ETLLOGParseLog(char *__str, size_t __size, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v5;
  unint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  *a5 = 0;
  if (a4 < 4 || *(_BYTE *)a3 != 16)
  {
    v6 = 0;
    v7 = 0;
    v5 = 0;
    goto LABEL_6;
  }
  v5 = *(unsigned __int16 *)(a3 + 2);
  if (v5 > a4)
  {
    v6 = 0;
    v7 = 0;
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v7 = 4;
  *a5 = 4;
  if (a4 - 4 < 0xC)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v8 = *(unsigned __int16 *)(a3 + 6);
  v6 = *(_QWORD *)(a3 + 8);
LABEL_7:
  *a5 = v5 + v7;
  v9 = 5 * (v6 >> 16)
     + ((unsigned __int16)(((43685 * (unsigned __int16)v6) >> 16)
                                       + ((unsigned __int16)((v6 - ((43685 * (unsigned __int16)v6) >> 16)) & 0xFFFE) >> 1)) >> 13)
     + 2;
  v10 = v9 >> 2;
  v11 = ((v9 * (unsigned __int128)0x10624DD2F1A9FCuLL) >> 64) + 315964800;
  if (__size >= snprintf(__str, __size, "[%02u:%02u:%02u:%06u: %04x] LOG 0x%02x: ", ((v11 * (unsigned __int128)0x123456789ABCE0uLL) >> 64) % 0x18, v11 / 0x3C- 60* ((unint64_t)((v11 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1), v11 % 0x3C, 1000* (v10 - 1000 * ((v10 * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)), v8, v5))TelephonyUtilBinToHex();
  return 1;
}

uint64_t ETLDMCEventGetNumRanges(unsigned int *a1, int a2)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      result = a1[10];
      break;
    case 1:
      result = a1[26];
      break;
    case 2:
      result = a1[42];
      break;
    case 3:
      result = a1[58];
      break;
    default:
      result = _ETLDebugPrint();
      __break(1u);
      break;
  }
  return result;
}

uint64_t ETLDMCEventGetRange(_DWORD *a1, int a2, unsigned int a3, _DWORD *a4)
{
  _DWORD *v4;
  unsigned int v5;
  uint64_t result;

  switch(a2)
  {
    case 0:
      v4 = a1 + 4;
      v5 = a1[10];
      if (v5 > a3)
        goto LABEL_9;
      goto LABEL_10;
    case 1:
      v4 = a1 + 20;
      v5 = a1[26];
      if (v5 > a3)
        goto LABEL_9;
      goto LABEL_10;
    case 2:
      v4 = a1 + 36;
      v5 = a1[42];
      if (v5 <= a3)
        goto LABEL_10;
      goto LABEL_9;
    case 3:
      v4 = a1 + 52;
      v5 = a1[58];
      if (v5 <= a3)
        goto LABEL_10;
LABEL_9:
      *a4 = *(_DWORD *)(*((_QWORD *)v4 + 4) + 4 * a3);
LABEL_10:
      result = v5 > a3;
      break;
    default:
      result = _ETLDebugPrint();
      __break(1u);
      break;
  }
  return result;
}

BOOL ETLDMCLogGetMask(uint64_t a1, int a2, unsigned int a3, _QWORD *a4, _DWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  switch(a2)
  {
    case 0:
      v8 = a1 + 16;
      *a5 = 0;
      if (a3 <= 0xD)
        goto LABEL_11;
      break;
    case 1:
      v8 = a1 + 80;
      *a5 = 0;
      if (a3 <= 0xD)
        goto LABEL_11;
      break;
    case 2:
      v8 = a1 + 144;
      *a5 = 0;
      if (a3 <= 0xD)
        goto LABEL_11;
      break;
    case 3:
      v8 = a1 + 208;
      *a5 = 0;
      if (a3 <= 0xD)
        goto LABEL_11;
      break;
    default:
      _ETLDebugPrint();
      v8 = 0;
      *a5 = 0;
      if (a3 <= 0xD)
      {
LABEL_11:
        v9 = *(_QWORD *)(v8 + 16);
        if (v9)
        {
          v10 = v9 + 16 * a3;
          *a5 = *(_DWORD *)v10;
          *a4 = *(_QWORD *)(v10 + 8);
        }
      }
      break;
  }
  return a3 < 0xE;
}

uint64_t ETLDMCLogGetEnabledEquipIDs(_QWORD *a1, int a2, _DWORD *a3)
{
  _QWORD *v4;
  _DWORD *v5;
  uint64_t result;

  switch(a2)
  {
    case 0:
      v4 = a1 + 2;
      v5 = (_DWORD *)a1[4];
      if (v5)
        goto LABEL_9;
      return 0;
    case 1:
      v4 = a1 + 10;
      v5 = (_DWORD *)a1[12];
      if (!v5)
        return 0;
      goto LABEL_9;
    case 2:
      v4 = a1 + 18;
      v5 = (_DWORD *)a1[20];
      if (v5)
        goto LABEL_9;
      return 0;
    case 3:
      v4 = a1 + 26;
      v5 = (_DWORD *)a1[28];
      if (!v5)
        return 0;
      goto LABEL_9;
    default:
      _ETLDebugPrint();
      v4 = 0;
      v5 = (_DWORD *)MEMORY[0x10];
      if (!MEMORY[0x10])
        return 0;
LABEL_9:
      if (*v5)
      {
        *a3 = 0;
        v5 = (_DWORD *)v4[2];
        result = 1;
        if (!v5[4])
          goto LABEL_12;
        goto LABEL_11;
      }
      result = 0;
      if (v5[4])
      {
LABEL_11:
        a3[result] = 1;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
LABEL_12:
      if (v5[8])
      {
        a3[result] = 2;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[12])
      {
        a3[result] = 3;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[16])
      {
        a3[result] = 4;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[20])
      {
        a3[result] = 5;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[24])
      {
        a3[result] = 6;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[28])
      {
        a3[result] = 7;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[32])
      {
        a3[result] = 8;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[36])
      {
        a3[result] = 9;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[40])
      {
        a3[result] = 10;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[44])
      {
        a3[result] = 11;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[48])
      {
        a3[result] = 12;
        result = (result + 1);
        v5 = (_DWORD *)v4[2];
      }
      if (v5[52])
      {
        a3[result] = 13;
        return (result + 1);
      }
      return result;
  }
}

uint64_t ETLDMCLogFilter(_QWORD *a1, char a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  int v40;
  int v41;

  if ((a2 & 1) == 0)
    goto LABEL_6;
  v5 = a1[4];
  if (!v5)
    goto LABEL_6;
  v6 = *(_DWORD *)(v5 + 16 * a3);
  if (v6 >= a5)
    v6 = a5;
  v7 = v6 + 7;
  if (v6 + 7 >= 8)
  {
    v22 = 0;
    v8 = 0;
    v23 = v7 >> 3;
    v24 = (_QWORD *)(v5 + 16 * a3 + 8);
    do
    {
      v25 = *(unsigned __int8 *)(a4 + v22);
      v26 = *(unsigned __int8 *)(*v24 + v22);
      if ((v26 & v25) != 0)
      {
        *(_BYTE *)(*v24 + v22) = v26 & ~(_BYTE)v25;
        v8 = 1;
      }
      ++v22;
    }
    while (v23 != v22);
  }
  else
  {
LABEL_6:
    v8 = 0;
  }
  if ((a2 & 2) == 0)
  {
    if ((a2 & 4) == 0)
      goto LABEL_9;
LABEL_17:
    v14 = a1[20];
    if (!v14)
      goto LABEL_21;
    v15 = *(_DWORD *)(v14 + 16 * a3);
    if (v15 >= a5)
      v15 = a5;
    v16 = v15 + 7;
    if (v15 + 7 >= 8)
    {
      v32 = 0;
      v17 = 0;
      v33 = v16 >> 3;
      v34 = (_QWORD *)(v14 + 16 * a3 + 8);
      do
      {
        v35 = *(unsigned __int8 *)(a4 + v32);
        v36 = *(unsigned __int8 *)(*v34 + v32);
        if ((v36 & v35) != 0)
        {
          *(_BYTE *)(*v34 + v32) = v36 & ~(_BYTE)v35;
          v17 = 1;
        }
        ++v32;
      }
      while (v33 != v32);
    }
    else
    {
LABEL_21:
      v17 = 0;
    }
    v8 |= v17;
    if ((a2 & 8) == 0)
      return v8 & 1;
    goto LABEL_23;
  }
  v10 = a1[12];
  if (!v10)
    goto LABEL_15;
  v11 = *(_DWORD *)(v10 + 16 * a3);
  if (v11 >= a5)
    v11 = a5;
  v12 = v11 + 7;
  if (v11 + 7 >= 8)
  {
    v27 = 0;
    v13 = 0;
    v28 = v12 >> 3;
    v29 = (_QWORD *)(v10 + 16 * a3 + 8);
    do
    {
      v30 = *(unsigned __int8 *)(a4 + v27);
      v31 = *(unsigned __int8 *)(*v29 + v27);
      if ((v31 & v30) != 0)
      {
        *(_BYTE *)(*v29 + v27) = v31 & ~(_BYTE)v30;
        v13 = 1;
      }
      ++v27;
    }
    while (v28 != v27);
  }
  else
  {
LABEL_15:
    v13 = 0;
  }
  v8 |= v13;
  if ((a2 & 4) != 0)
    goto LABEL_17;
LABEL_9:
  if ((a2 & 8) == 0)
    return v8 & 1;
LABEL_23:
  v18 = a1[28];
  if (!v18)
    return v8 & 1;
  v19 = *(_DWORD *)(v18 + 16 * a3);
  if (v19 >= a5)
    v19 = a5;
  v20 = v19 + 7;
  if (v19 + 7 >= 8)
  {
    v37 = 0;
    v21 = 0;
    v38 = v20 >> 3;
    v39 = (_QWORD *)(v18 + 16 * a3 + 8);
    do
    {
      v40 = *(unsigned __int8 *)(a4 + v37);
      v41 = *(unsigned __int8 *)(*v39 + v37);
      if ((v41 & v40) != 0)
      {
        *(_BYTE *)(*v39 + v37) = v41 & ~(_BYTE)v40;
        v21 = 1;
      }
      ++v37;
    }
    while (v38 != v37);
  }
  else
  {
    v21 = 0;
  }
  return (v8 | v21) & 1;
}

uint64_t ETLDMCLogGetDefaultFilters(_QWORD *a1)
{
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  *a1 = &dword_1F0296350;
  return 2;
}

uint64_t APPLIB_DIAG_AUDIO_PCM_14Bit_Start_Loopback(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 1;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_14Bit_Stop_Loopback(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 2;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_16Bit_Start_Loopback(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 3;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_16Bit_Stop_Loopback(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 4;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_Start_Loopback(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 5;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_Stop_Loopback(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 6;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_I2S_PASSTHROUGH_Start(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 7;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_PCM_I2S_PASSTHROUGH_Stop(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 8;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_PCM_PASSTHROUGH_Start(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 9;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_AUDIO_I2S_PCM_PASSTHROUGH_Stop(char *a1, int a2)
{
  int v3;
  __int16 v4;

  v3 = 458315;
  v4 = 10;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 6);
}

uint64_t APPLIB_DIAG_SEND_SMS(_OWORD *a1, int a2, unsigned int a3, int a4, uint64_t a5)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  char *v11;
  char v12;
  uint64_t v13;
  int v14;
  int v15;
  char *v16;
  char v17;
  uint64_t result;
  int v19;
  uint64_t v20;
  unsigned __int8 *v21;
  char v22;
  int v23;
  __int128 *v24;
  _OWORD *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE __src[2048];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)((char *)a1 + 204) = 0u;
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
  *(_DWORD *)a1 = 130123;
  *((_BYTE *)a1 + 4) = a2;
  if (a2 >= 1)
  {
    v7 = a2 + 1;
    do
    {
      *((_BYTE *)a1 + (v7-- - 2) + 5) = a3 % 0xA;
      a3 /= 0xAu;
    }
    while (v7 > 1);
  }
  *((_BYTE *)a1 + 20) = a4;
  if (a4 >= 1)
  {
    if (a4 < 8 || (unint64_t)a1 - a5 + 21 < 0x20)
    {
      v8 = 0;
      goto LABEL_8;
    }
    if (a4 >= 0x20)
    {
      v8 = a4 & 0xFFFFFFE0;
      v24 = (__int128 *)(a5 + 16);
      v25 = (_OWORD *)((char *)a1 + 37);
      v26 = v8;
      do
      {
        v27 = *v24;
        *(v25 - 1) = *(v24 - 1);
        *v25 = v27;
        v24 += 2;
        v25 += 2;
        v26 -= 32;
      }
      while (v26);
      if (v8 == a4)
        goto LABEL_10;
      if ((a4 & 0x18) == 0)
      {
LABEL_8:
        v9 = a4 - v8;
        v10 = (char *)a1 + v8 + 21;
        v11 = (char *)(a5 + v8);
        do
        {
          v12 = *v11++;
          *v10++ = v12;
          --v9;
        }
        while (v9);
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0;
    }
    v28 = v8;
    v8 = a4 & 0xFFFFFFF8;
    v29 = (uint64_t *)(a5 + v28);
    v30 = (_QWORD *)((char *)a1 + v28 + 21);
    v31 = v28 - v8;
    do
    {
      v32 = *v29++;
      *v30++ = v32;
      v31 += 8;
    }
    while (v31);
    if (v8 != a4)
      goto LABEL_8;
  }
LABEL_10:
  v13 = a4 + 21;
  v14 = 8 * v13;
  if (((8 * (_DWORD)v13) & 0xFFF8) != 0)
  {
    LOWORD(v15) = -1;
    v16 = (char *)a1;
    do
    {
      v17 = *v16++;
      v15 = crc_16_l_table[(v17 ^ v15)] ^ ((unsigned __int16)(v15 & 0xFF00) >> 8);
      v14 -= 8;
    }
    while ((_WORD)v14);
    *((_BYTE *)a1 + v13) = ~(_BYTE)v15;
    *((_BYTE *)a1 + a4 + 22) = (unsigned __int16)~(_WORD)v15 >> 8;
    if (a4 > 233)
      return 0xFFFFFFFFLL;
  }
  else
  {
    *((_BYTE *)a1 + v13) = 0;
    *((_BYTE *)a1 + a4 + 22) = 0;
    if (a4 > 233)
      return 0xFFFFFFFFLL;
  }
  bzero(__src, 0x800uLL);
  if (a4 < -22)
  {
    v19 = 0;
  }
  else
  {
    v19 = 0;
    v20 = (a4 + 23);
    v21 = (unsigned __int8 *)a1;
    do
    {
      v23 = *v21++;
      v22 = v23;
      if ((v23 - 125) <= 1)
      {
        __src[v19] = 125;
        v22 ^= 0x20u;
        ++v19;
      }
      __src[v19++] = v22;
      --v20;
    }
    while (v20);
  }
  memcpy(a1, __src, v19);
  result = (v19 + 1);
  *((_BYTE *)a1 + v19) = 126;
  return result;
}

uint64_t APPLIB_DIAG_ENABLE_MT_SMS_STORE(_BYTE *a1, unsigned __int8 a2)
{
  int v3;
  __int16 v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int __src;
  _BYTE v12[2044];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)a1 = 195659;
  v3 = a2;
  a1[4] = a2;
  v4 = crc_16_l_table[a2 ^ 0xA4] ^ 0xFF30;
  v5 = crc_16_l_table[a2 ^ 0xA4] ^ 0x30;
  a1[5] = crc_16_l_table[a2 ^ 0xA4] ^ 0x30;
  v6 = HIBYTE(v4);
  a1[6] = HIBYTE(v4);
  bzero(v12, 0x7FCuLL);
  __src = 195659;
  if ((v3 - 125) > 1)
  {
    v7 = 4;
    v12[0] = v3;
    v8 = 5;
    if ((v5 - 125) > 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  v12[0] = 125;
  v7 = 5;
  v12[1] = v3 ^ 0x20;
  v8 = 6;
  if ((v5 - 125) <= 1)
  {
LABEL_5:
    v12[v8 - 4] = 125;
    LODWORD(v8) = v7 | 2;
    LOBYTE(v5) = v5 ^ 0x20;
  }
LABEL_6:
  v12[v8 - 4] = v5;
  v9 = v8 + 1;
  if ((v6 - 125) <= 1)
  {
    v12[v9 - 4] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v9) = v8 + 2;
  }
  v12[v9 - 4] = v6;
  memcpy(a1, &__src, v9 + 1);
  a1[v9 + 1] = 126;
  return (v9 + 2);
}

uint64_t APPLIB_DIAG_RECV_MT_SMS(uint64_t a1)
{
  *(_DWORD *)a1 = 261195;
  *(_WORD *)(a1 + 4) = 10627;
  *(_BYTE *)(a1 + 6) = 126;
  return 7;
}

_OWORD *_ETLDMCCreateFromFile(const char *a1, uint64_t a2, int a3, int a4)
{
  xmlParserCtxtPtr v7;
  xmlParserCtxt *v8;
  int v9;
  int v10;
  off_t v11;
  char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  int *v17;
  _BYTE *v19;
  uint64_t v20;
  int8x8_t v21;
  xmlDocPtr Memory;
  xmlDoc *v23;
  _OWORD *Instance;
  _QWORD *v25;
  xmlNodePtr RootElement;
  xmlNodePtr v27;
  xmlNodePtr v28;
  char *v29;
  uint64_t v30;
  _xmlNode *children;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  _QWORD *v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char __str[16];
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = xmlNewParserCtxt();
  if (v7)
  {
    v8 = v7;
    v9 = open(a1, 4);
    if (v9 < 0)
    {
      v17 = __error();
      strerror(*v17);
      _ETLDebugPrint();
    }
    else
    {
      v10 = v9;
      v11 = lseek(v9, 0, 2);
      lseek(v10, 0, 0);
      if (v11 <= 0x200000)
      {
        v12 = (char *)malloc(v11);
        if (!v12)
        {
          close(v10);
          goto LABEL_16;
        }
        v13 = TelephonyUtilUnblockableReadToCompletionWithTimeout();
        close(v10);
        if (!v13)
        {
LABEL_16:
          v16 = 0;
LABEL_17:
          xmlFreeParserCtxt(v8);
          free(v12);
          return v16;
        }
        if (v11 < 1)
          goto LABEL_40;
        if (v11 <= 1)
          v14 = 1;
        else
          v14 = v11;
        if (v14 < 8)
        {
          v15 = 0;
LABEL_49:
          v29 = &v12[v15];
          v30 = v14 - v15;
          do
          {
            if (*v29 == 13)
              *v29 = 32;
            ++v29;
            --v30;
          }
          while (v30);
LABEL_40:
          Memory = xmlCtxtReadMemory(v8, v12, v11, "", 0, 1);
          if (Memory)
          {
            v23 = Memory;
            if (!v8->valid)
            {
LABEL_93:
              v16 = 0;
              goto LABEL_94;
            }
            pthread_once(&_ETLDMCRegisterClassOnce, (void (*)(void))_ETLDMCRegisterClass);
            Instance = (_OWORD *)_CFRuntimeCreateInstance();
            v16 = Instance;
            if (!Instance)
            {
              _ETLDebugPrint();
LABEL_94:
              xmlFreeDoc(v23);
              goto LABEL_17;
            }
            Instance[1] = 0u;
            v25 = Instance + 1;
            Instance[15] = 0u;
            Instance[16] = 0u;
            Instance[13] = 0u;
            Instance[14] = 0u;
            Instance[11] = 0u;
            Instance[12] = 0u;
            Instance[9] = 0u;
            Instance[10] = 0u;
            Instance[7] = 0u;
            Instance[8] = 0u;
            Instance[5] = 0u;
            Instance[6] = 0u;
            Instance[3] = 0u;
            Instance[4] = 0u;
            Instance[2] = 0u;
            _ETLDebugPrint();
            RootElement = xmlDocGetRootElement(v23);
            if (RootElement)
            {
              v27 = RootElement;
              v28 = RootElement;
              while (v28->type != XML_ELEMENT_NODE || strcmp("QXDMProfessional", (const char *)v28->name))
              {
                v28 = v28->next;
                if (!v28)
                {
                  while (v27->type != XML_ELEMENT_NODE || strcmp("QXDM", (const char *)v27->name))
                  {
                    v27 = v27->next;
                    if (!v27)
                      goto LABEL_91;
                  }
                  v28 = v27;
                  break;
                }
              }
              children = v28->children;
              if (children)
              {
                while (children->type != XML_ELEMENT_NODE || strcmp("Persistence", (const char *)children->name))
                {
                  children = children->next;
                  if (!children)
                    goto LABEL_91;
                }
                v32 = (uint64_t)children->children;
                if (!v32)
                  goto LABEL_92;
                switch(a3)
                {
                  case 3:
                    goto LABEL_68;
                  case 1:
                    goto LABEL_70;
                  case 0:
LABEL_68:
                    if ((_ETLDMCLoadViewFromFile(v16 + 1, "MessagesView", (uint64_t)children->children, 0) & 1) == 0)
                    {
LABEL_98:
                      ETLDMCViewFree(v25);
                      goto LABEL_92;
                    }
                    if ((a3 | 2) == 3)
                    {
LABEL_70:
                      v25 = v16 + 5;
                      if ((_ETLDMCLoadViewFromFile(v16 + 5, "LoggingView", v32, 0) & 1) != 0)
                        goto LABEL_71;
                      goto LABEL_98;
                    }
                    break;
                }
                if ((a3 & 0xFFFFFFFE) != 2)
                  goto LABEL_95;
LABEL_71:
                while (*(_DWORD *)(v32 + 8) != 1 || strcmp("Displays", *(const char **)(v32 + 16)))
                {
                  v32 = *(_QWORD *)(v32 + 48);
                  if (!v32)
                    goto LABEL_95;
                }
                v33 = *(_QWORD *)(v32 + 24);
                if (!v33)
                  goto LABEL_95;
                *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)__str = v34;
                v46 = v34;
                v43 = v34;
                v44 = v34;
                v41 = v34;
                v42 = v34;
                v39 = v16 + 9;
                v40 = 0;
                while (2)
                {
                  snprintf(__str, 0x20uLL, "%s%u", "Display", v40);
                  v35 = v33;
                  while (*(_DWORD *)(v35 + 8) != 1 || strcmp(__str, *(const char **)(v35 + 16)))
                  {
                    v35 = *(_QWORD *)(v35 + 48);
                    if (!v35)
                      goto LABEL_95;
                  }
                  v36 = *(_QWORD *)(v35 + 24);
                  if (v36)
                  {
                    v43 = 0u;
                    v44 = 0u;
                    v37 = v36;
                    v41 = 0u;
                    v42 = 0u;
                    while (*(_DWORD *)(v37 + 8) != 1 || strcmp("View", *(const char **)(v37 + 16)))
                    {
                      v37 = *(_QWORD *)(v37 + 48);
                      if (!v37)
                        goto LABEL_90;
                    }
                    if (_ETLDMCLoadViewFromFile(&v41, "View", v36, a4))
                    {
                      v38 = ETLDMCViewMergeInto((uint64_t)v39, (unsigned int *)&v41);
                      ETLDMCViewFree(&v41);
                      if ((v38 & 1) != 0)
                      {
LABEL_90:
                        ++v40;
                        continue;
                      }
                    }
                    else
                    {
                      ETLDMCViewFree(&v41);
                    }
                    ETLDMCViewFree(v39);
                  }
                  else
                  {
LABEL_95:
                    if (a3 != 3 || (_ETLDMCGenerateMergedView((unsigned int *)v16) & 1) != 0)
                    {
                      _ETLDebugPrint();
                      goto LABEL_94;
                    }
                    ETLDMCViewFree((_QWORD *)v16 + 26);
                  }
                  goto LABEL_92;
                }
              }
LABEL_91:
              _ETLDebugPrint();
            }
LABEL_92:
            _ETLDebugPrint();
            CFRelease(v16);
            goto LABEL_93;
          }
          goto LABEL_16;
        }
        v15 = v14 & 0x3FFFF8;
        v19 = v12 + 3;
        v20 = v14 & 0xFFFFFFF8;
        while (1)
        {
          v21 = vceq_s8(*(int8x8_t *)(v19 - 3), (int8x8_t)0xD0D0D0D0D0D0D0DLL);
          if ((v21.i8[0] & 1) != 0)
          {
            *(v19 - 3) = 32;
            if ((v21.i8[1] & 1) == 0)
              goto LABEL_24;
          }
          else if ((v21.i8[1] & 1) == 0)
          {
LABEL_24:
            if ((v21.i8[2] & 1) != 0)
              goto LABEL_25;
            goto LABEL_33;
          }
          *(v19 - 2) = 32;
          if ((v21.i8[2] & 1) != 0)
          {
LABEL_25:
            *(v19 - 1) = 32;
            if ((v21.i8[3] & 1) == 0)
              goto LABEL_26;
            goto LABEL_34;
          }
LABEL_33:
          if ((v21.i8[3] & 1) == 0)
          {
LABEL_26:
            if ((v21.i8[4] & 1) != 0)
              goto LABEL_27;
            goto LABEL_35;
          }
LABEL_34:
          *v19 = 32;
          if ((v21.i8[4] & 1) != 0)
          {
LABEL_27:
            v19[1] = 32;
            if ((v21.i8[5] & 1) == 0)
              goto LABEL_28;
            goto LABEL_36;
          }
LABEL_35:
          if ((v21.i8[5] & 1) == 0)
          {
LABEL_28:
            if ((v21.i8[6] & 1) != 0)
              goto LABEL_29;
            goto LABEL_37;
          }
LABEL_36:
          v19[2] = 32;
          if ((v21.i8[6] & 1) != 0)
          {
LABEL_29:
            v19[3] = 32;
            if ((v21.i8[7] & 1) != 0)
              goto LABEL_38;
            goto LABEL_21;
          }
LABEL_37:
          if ((v21.i8[7] & 1) != 0)
LABEL_38:
            v19[4] = 32;
LABEL_21:
          v19 += 8;
          v20 -= 8;
          if (!v20)
          {
            if (v15 == v14)
              goto LABEL_40;
            goto LABEL_49;
          }
        }
      }
      _ETLDebugPrint();
      close(v10);
    }
    v12 = 0;
    goto LABEL_16;
  }
  _ETLDebugPrint();
  return 0;
}

_OWORD *ETLDMCCreateFromFile(const char *a1, uint64_t a2)
{
  return _ETLDMCCreateFromFile(a1, a2, 3, 0);
}

void ETLDMCFree(_QWORD *a1)
{
  ETLDMCViewFree(a1 + 2);
  ETLDMCViewFree(a1 + 10);
  ETLDMCViewFree(a1 + 18);
  ETLDMCViewFree(a1 + 26);
}

const void *ETLDMCMerge(unsigned int *a1, unsigned int *a2)
{
  _OWORD *Instance;
  const void *v5;

  _ETLDebugPrint();
  pthread_once(&_ETLDMCRegisterClassOnce, (void (*)(void))_ETLDMCRegisterClass);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v5 = Instance;
  if (Instance)
  {
    Instance[1] = 0u;
    Instance[15] = 0u;
    Instance[16] = 0u;
    Instance[13] = 0u;
    Instance[14] = 0u;
    Instance[11] = 0u;
    Instance[12] = 0u;
    Instance[9] = 0u;
    Instance[10] = 0u;
    Instance[7] = 0u;
    Instance[8] = 0u;
    Instance[5] = 0u;
    Instance[6] = 0u;
    Instance[3] = 0u;
    Instance[4] = 0u;
    Instance[2] = 0u;
    if (!ETLDMCViewMerge((uint64_t)(Instance + 1), a1 + 4, a2 + 4)
      || !ETLDMCViewMerge((uint64_t)v5 + 80, a1 + 20, a2 + 20)
      || !ETLDMCViewMerge((uint64_t)v5 + 144, a1 + 36, a2 + 36)
      || (ETLDMCViewMerge((uint64_t)v5 + 208, a1 + 52, a2 + 52) & 1) == 0)
    {
      CFRelease(v5);
      return 0;
    }
    return v5;
  }
  else
  {
    _ETLDebugPrint();
    return 0;
  }
}

uint64_t ETLDMCAppend(CFTypeRef *a1, unsigned int *cf)
{
  unsigned int *v2;
  unsigned int *v4;
  uint64_t result;

  v2 = cf;
  v4 = (unsigned int *)*a1;
  if (v4)
  {
    result = (uint64_t)ETLDMCMerge(v4, cf);
    if (!result)
      return result;
    v2 = (unsigned int *)result;
    CFRelease(*a1);
  }
  else
  {
    CFRetain(cf);
  }
  *a1 = v2;
  return 1;
}

uint64_t _ETLDMCLoadViewFromFile(_OWORD *a1, char *__s1, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  __int128 v18;
  int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  __int128 v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  char *v33;
  char *v34;
  unsigned int v35;
  unsigned int v36;
  char v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  int v43;
  unsigned int v45;
  int MessagesFromMaskArray;
  char *v48[2];
  char *__endptr;
  char __str[16];
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  while (*(_DWORD *)(a3 + 8) != 1 || strcmp(__s1, *(const char **)(a3 + 16)))
  {
    a3 = *(_QWORD *)(a3 + 48);
    if (!a3)
      return 1;
  }
  v8 = *(_QWORD *)(a3 + 24);
  if (!v8)
    return 1;
  while (*(_DWORD *)(v8 + 8) != 1 || strcmp("ISVConfig", *(const char **)(v8 + 16)))
  {
    v8 = *(_QWORD *)(v8 + 48);
    if (!v8)
      return 1;
  }
  v9 = *(_QWORD *)(v8 + 24);
  if (!v9)
    return 1;
  _ETLDebugPrint();
  v10 = v9;
  while (*(_DWORD *)(v10 + 8) != 1 || strcmp("EventIDs", *(const char **)(v10 + 16)))
  {
    v10 = *(_QWORD *)(v10 + 48);
    if (!v10)
      goto LABEL_31;
  }
  v11 = *(_QWORD *)(v10 + 24);
  if (v11 && *(_DWORD *)(v11 + 8) == 3)
  {
    v48[0] = *(char **)(v11 + 80);
    v48[1] = 0;
    v12 = ETLDMCParserCountTokens(v48, 44);
    v13 = v12;
    if (v12)
    {
      v14 = (char *)malloc(2 * v12);
      if (v14)
      {
        v15 = 0;
        v16 = 0;
        v17 = -1;
        while (1)
        {
          *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)__str = v18;
          v51 = v18;
          if (!ETLDMCParserGetToken((uint64_t)v48, 0x2Cu, __str, 0x20u))
            break;
          __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
          v19 = strtoul(__str, &__endptr, 10);
          v20 = *__endptr;
          if (*__endptr)
          {
            if ((v20 & 0x80000000) != 0)
            {
              if (!__maskrune(v20, 0x4000uLL))
                break;
            }
            else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v20 + 60) & 0x4000) == 0)
            {
              break;
            }
          }
          *(_WORD *)&v14[v15] = v19;
          if (v17 != v19)
            ++v16;
          v17 = v19 + 1;
          v15 += 2;
          if (2 * v13 == v15)
            goto LABEL_30;
        }
      }
      free(v14);
      goto LABEL_78;
    }
    v16 = 0;
    v14 = 0;
LABEL_30:
    v21 = ETLDMCLoadEventRangesFromEventsArray((uint64_t)a1, (uint64_t)v14, v16, v13);
    free(v14);
    if (!v21)
      goto LABEL_78;
  }
LABEL_31:
  v22 = v9;
  while (*(_DWORD *)(v22 + 8) != 1 || strcmp("MessageLevels", *(const char **)(v22 + 16)))
  {
    v22 = *(_QWORD *)(v22 + 48);
    if (!v22)
      goto LABEL_74;
  }
  v23 = *(_QWORD *)(v22 + 24);
  if (!v23 || *(_DWORD *)(v23 + 8) != 3)
  {
LABEL_74:
    if (!_ETLDMCParseLogCodesInternal(v9, "LogCodes", (uint64_t)a1, a4)
      || !_ETLDMCParseLogCodesInternal(v9, "OTATypes", (uint64_t)a1, 0)
      || (_ETLDMCParseQTraces(v9, (uint64_t)a1) & 1) == 0)
    {
      goto LABEL_78;
    }
    return 1;
  }
  v24 = malloc(0x34000uLL);
  if (!v24)
    goto LABEL_78;
  v25 = v24;
  bzero(v24, 0x34000uLL);
  v26 = 0;
  v27 = *(_QWORD *)(v23 + 80);
  while (1)
  {
    *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v28;
    v51 = v28;
    v29 = *(unsigned __int8 *)(v27 + v26);
    v30 = v26;
    if (v29 == 44)
    {
LABEL_44:
      v32 = v30 + 1;
      v31 = v30 + 1 - v26;
      v26 = v32;
      goto LABEL_47;
    }
    v31 = 1;
    while (v29)
    {
      v29 = *(unsigned __int8 *)(v27 + v26 + v31++);
      if (v29 == 44)
      {
        v30 = v26 + v31 - 1;
        goto LABEL_44;
      }
    }
    if (v31 == 1)
      break;
    v26 = v26 + v31 - 1;
LABEL_47:
    if (!v31)
      break;
    __strlcpy_chk();
    v33 = strchr(__str, 47);
    if (!v33)
      goto LABEL_62;
    v34 = v33;
    *v33 = 0;
    v48[0] = (char *)0xAAAAAAAAAAAAAAAALL;
    v35 = strtoul(__str, v48, 10);
    v36 = *v48[0];
    if (*v48[0])
    {
      if (!((v36 & 0x80000000) != 0
           ? __maskrune(v36, 0x4000uLL)
           : *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v36 + 60) & 0x4000))
        goto LABEL_62;
    }
    if ((v48[0] = (char *)0xAAAAAAAAAAAAAAAALL, v38 = strtoul(v34 + 1, v48, 10), (v39 = *v48[0]) != 0)
      && ((v39 & 0x80000000) != 0
        ? (v40 = __maskrune(v39, 0x4000uLL))
        : (v40 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v39 + 60) & 0x4000),
          !v40)
      || v35 >> 12 > 0xC)
    {
LABEL_62:
      free(v25);
      goto LABEL_78;
    }
    *((_DWORD *)v25 + v35) |= 1 << v38;
  }
  v41 = 0;
  v42 = 0;
  v43 = 0;
  do
  {
    if ((v41 - v43) > 1 || v42 == 0)
      v45 = v42 + 1;
    else
      v45 = v42;
    if (*((_DWORD *)v25 + v41))
    {
      v43 = v41;
      v42 = v45;
    }
    ++v41;
  }
  while (v41 != 53248);
  MessagesFromMaskArray = ETLDMCViewLoadMessagesFromMaskArray((uint64_t)a1, (uint64_t)v25, v42);
  free(v25);
  if (MessagesFromMaskArray)
    goto LABEL_74;
LABEL_78:
  _ETLDebugPrint();
  return 0;
}

uint64_t _ETLDMCGenerateMergedView(unsigned int *a1)
{
  unsigned int *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v2 = a1 + 52;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  if ((ETLDMCViewMerge((uint64_t)&v11, a1 + 52, a1 + 4) & 1) == 0)
    goto LABEL_6;
  ETLDMCViewFree(v2);
  v3 = v12;
  *(_OWORD *)v2 = v11;
  *((_OWORD *)v2 + 1) = v3;
  v4 = v14;
  *((_OWORD *)v2 + 2) = v13;
  *((_OWORD *)v2 + 3) = v4;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  if ((ETLDMCViewMerge((uint64_t)&v11, v2, a1 + 20) & 1) != 0)
  {
    ETLDMCViewFree(v2);
    v5 = v12;
    *(_OWORD *)v2 = v11;
    *((_OWORD *)v2 + 1) = v5;
    v6 = v14;
    *((_OWORD *)v2 + 2) = v13;
    *((_OWORD *)v2 + 3) = v6;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = ETLDMCViewMerge((uint64_t)&v11, v2, a1 + 36);
    if ((_DWORD)v7)
    {
      ETLDMCViewFree(v2);
      v8 = v12;
      *(_OWORD *)v2 = v11;
      *((_OWORD *)v2 + 1) = v8;
      v9 = v14;
      *((_OWORD *)v2 + 2) = v13;
      *((_OWORD *)v2 + 3) = v9;
    }
    else
    {
      ETLDMCViewFree(&v11);
    }
    return v7;
  }
  else
  {
LABEL_6:
    ETLDMCViewFree(&v11);
    return 0;
  }
}

uint64_t _ETLDMCParseQTraces(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int16x8_t *v5;
  int16x8_t *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  char v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  char *__endptr;
  char __s[16];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  while (*(_DWORD *)(a1 + 8) != 1 || strcmp("QTraces", *(const char **)(a1 + 16)))
  {
    a1 = *(_QWORD *)(a1 + 48);
    if (!a1)
      goto LABEL_10;
  }
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4 || *(_DWORD *)(v4 + 8) != 3)
  {
LABEL_10:
    _ETLDebugPrint();
    return 1;
  }
  v5 = (int16x8_t *)malloc(0x20000uLL);
  if (!v5)
  {
    _ETLDebugPrint();
    return 0;
  }
  v6 = v5;
  bzero(v5, 0x20000uLL);
  v7 = *(unsigned __int8 **)(v4 + 80);
  *(_OWORD *)__s = 0u;
  v27 = 0u;
  v8 = *v7;
  if (v8 == 44)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    while (v8)
    {
      v8 = v7[++v9];
      if (v8 == 44)
      {
        v12 = ++v9;
        goto LABEL_19;
      }
    }
    if (!v9)
      goto LABEL_47;
    v12 = v9 + 1;
LABEL_19:
    if (!v12)
      goto LABEL_47;
  }
  __strlcpy_chk();
  v13 = strchr(__s, 47);
  if (!v13)
    goto LABEL_46;
  v14 = v13;
  v15 = MEMORY[0x1E0C80978];
  while (1)
  {
    *v14 = 0;
    __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
    v16 = strtoul(__s, &__endptr, 10);
    v17 = *__endptr;
    if (*__endptr)
    {
      if ((v17 & 0x80000000) != 0)
      {
        if (!__maskrune(v17, 0x4000uLL))
          goto LABEL_46;
      }
      else if ((*(_DWORD *)(v15 + 4 * v17 + 60) & 0x4000) == 0)
      {
        goto LABEL_46;
      }
    }
    __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
    v18 = strtoul(v14 + 1, &__endptr, 10);
    v19 = *__endptr;
    if (*__endptr)
    {
      if ((v19 & 0x80000000) != 0)
      {
        if (!__maskrune(v19, 0x4000uLL))
          goto LABEL_46;
      }
      else if ((*(_DWORD *)(v15 + 4 * v19 + 60) & 0x4000) == 0)
      {
        goto LABEL_46;
      }
    }
    v6->i16[v16] |= 1 << v18;
    v20 = v7[v9];
    v21 = v9;
    if (v20 != 44)
      break;
LABEL_37:
    v23 = v21 + 1;
    v24 = v21 + 1 - v9;
    v9 = v23;
    if (!v24)
      goto LABEL_44;
LABEL_41:
    __strlcpy_chk();
    v14 = strchr(__s, 47);
    if (!v14)
      goto LABEL_46;
  }
  v22 = 1;
  while (v20)
  {
    v20 = v7[v9 + v22++];
    if (v20 == 44)
    {
      v21 = v9 + v22 - 1;
      goto LABEL_37;
    }
  }
  if (v22 != 1)
  {
    v9 = v9 + v22 - 1;
    if (v22)
      goto LABEL_41;
  }
LABEL_44:
  if ((ETLDMCViewLoadQTraces(a2, v6, 0x10000u) & 1) != 0)
  {
    v10 = 1;
    goto LABEL_48;
  }
LABEL_46:
  _ETLDebugPrint();
LABEL_47:
  v10 = 0;
LABEL_48:
  free(v6);
  return v10;
}

uint64_t _ETLDMCParseLogCodesInternal(uint64_t a1, char *__s1, uint64_t a3, int a4)
{
  uint64_t v8;
  unsigned __int8 *v9;
  __int128 v10;
  int v11;
  unsigned int v12;
  char *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t result;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  _OWORD *v20;
  unint64_t v21;
  __int128 v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  char *v28;
  unsigned int v29;
  unsigned int v30;
  _OWORD *v31;
  _OWORD *v32;
  _OWORD *v33;
  unint64_t v34;
  char *__endptr;
  char __s[16];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  while (*(_DWORD *)(a1 + 8) != 1 || strcmp(__s1, *(const char **)(a1 + 16)))
  {
    a1 = *(_QWORD *)(a1 + 48);
    if (!a1)
      return 1;
  }
  v8 = *(_QWORD *)(a1 + 24);
  if (!v8 || *(_DWORD *)(v8 + 8) != 3)
    return 1;
  v9 = *(unsigned __int8 **)(v8 + 80);
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__s = v10;
  v37 = v10;
  v11 = *v9;
  if (v11 == 44)
  {
    v12 = 1;
    goto LABEL_13;
  }
  v12 = 0;
  while (v11)
  {
    v11 = v9[++v12];
    if (v11 == 44)
    {
      if (++v12)
        goto LABEL_13;
LABEL_21:
      result = 0;
      if (a4)
        goto LABEL_22;
      return result;
    }
  }
  if (!v12 || v12 == -1)
    goto LABEL_21;
LABEL_13:
  __strlcpy_chk();
  v13 = strchr(__s, 47);
  if (v13)
    *v13 = 0;
  __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
  v14 = strtoul(__s, &__endptr, 16);
  v15 = *__endptr;
  if (*__endptr)
  {
    if ((v15 & 0x80000000) != 0)
    {
      if (!__maskrune(v15, 0x4000uLL))
        return 0;
    }
    else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v15 + 60) & 0x4000) == 0)
    {
      return 0;
    }
  }
  v18 = *(_OWORD **)(a3 + 16);
  if (!v18)
  {
    v18 = malloc(0x100uLL);
    *(_QWORD *)(a3 + 16) = v18;
    if (!v18)
      return 0;
    v18[14] = 0u;
    v18[15] = 0u;
    v18[12] = 0u;
    v18[13] = 0u;
    v18[10] = 0u;
    v18[11] = 0u;
    v18[8] = 0u;
    v18[9] = 0u;
    v18[6] = 0u;
    v18[7] = 0u;
    v18[4] = 0u;
    v18[5] = 0u;
    v18[2] = 0u;
    v18[3] = 0u;
    *v18 = 0u;
    v18[1] = 0u;
  }
  if (v14 >> 13 > 6)
    return 0;
  v19 = &v18[v14 >> 12];
  v20 = (_OWORD *)*((_QWORD *)v19 + 1);
  if (v20)
    goto LABEL_40;
  v20 = malloc(0x200uLL);
  *((_QWORD *)v19 + 1) = v20;
  if (!v20)
    return 0;
  v20[30] = 0u;
  v20[31] = 0u;
  v20[28] = 0u;
  v20[29] = 0u;
  v20[26] = 0u;
  v20[27] = 0u;
  v20[24] = 0u;
  v20[25] = 0u;
  v20[22] = 0u;
  v20[23] = 0u;
  v20[20] = 0u;
  v20[21] = 0u;
  v20[18] = 0u;
  v20[19] = 0u;
  v20[16] = 0u;
  v20[17] = 0u;
  v20[14] = 0u;
  v20[15] = 0u;
  v20[12] = 0u;
  v20[13] = 0u;
  v20[10] = 0u;
  v20[11] = 0u;
  v20[8] = 0u;
  v20[9] = 0u;
  v20[6] = 0u;
  v20[7] = 0u;
  v20[4] = 0u;
  v20[5] = 0u;
  v20[2] = 0u;
  v20[3] = 0u;
  *v20 = 0u;
  v20[1] = 0u;
LABEL_40:
  v21 = v14 & 0xFFF;
  *((_BYTE *)v20 + (v21 >> 3)) |= 1 << (v14 & 7);
  if (v21 >= *(_DWORD *)v19)
    *(_DWORD *)v19 = v21 + 1;
  while (1)
  {
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__s = v22;
    v37 = v22;
    v23 = v9[v12];
    v24 = v12;
    if (v23 != 44)
      break;
LABEL_47:
    v26 = v24 + 1;
    v27 = v24 + 1 - v12;
    v12 = v26;
    if (!v27)
      goto LABEL_68;
LABEL_51:
    __strlcpy_chk();
    v28 = strchr(__s, 47);
    if (v28)
      *v28 = 0;
    __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
    v29 = strtoul(__s, &__endptr, 16);
    v30 = *__endptr;
    if (*__endptr)
    {
      if ((v30 & 0x80000000) != 0)
      {
        if (!__maskrune(v30, 0x4000uLL))
          return 0;
      }
      else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v30 + 60) & 0x4000) == 0)
      {
        return 0;
      }
    }
    v31 = *(_OWORD **)(a3 + 16);
    if (!v31)
    {
      v31 = malloc(0x100uLL);
      *(_QWORD *)(a3 + 16) = v31;
      if (!v31)
        return 0;
      v31[14] = 0u;
      v31[15] = 0u;
      v31[12] = 0u;
      v31[13] = 0u;
      v31[10] = 0u;
      v31[11] = 0u;
      v31[8] = 0u;
      v31[9] = 0u;
      v31[6] = 0u;
      v31[7] = 0u;
      v31[4] = 0u;
      v31[5] = 0u;
      v31[2] = 0u;
      v31[3] = 0u;
      *v31 = 0u;
      v31[1] = 0u;
    }
    if (v29 >> 13 > 6)
      return 0;
    v32 = &v31[v29 >> 12];
    v33 = (_OWORD *)*((_QWORD *)v32 + 1);
    if (!v33)
    {
      v33 = malloc(0x200uLL);
      *((_QWORD *)v32 + 1) = v33;
      if (!v33)
        return 0;
      v33[30] = 0u;
      v33[31] = 0u;
      v33[28] = 0u;
      v33[29] = 0u;
      v33[26] = 0u;
      v33[27] = 0u;
      v33[24] = 0u;
      v33[25] = 0u;
      v33[22] = 0u;
      v33[23] = 0u;
      v33[20] = 0u;
      v33[21] = 0u;
      v33[18] = 0u;
      v33[19] = 0u;
      v33[16] = 0u;
      v33[17] = 0u;
      v33[14] = 0u;
      v33[15] = 0u;
      v33[12] = 0u;
      v33[13] = 0u;
      v33[10] = 0u;
      v33[11] = 0u;
      v33[8] = 0u;
      v33[9] = 0u;
      v33[6] = 0u;
      v33[7] = 0u;
      v33[4] = 0u;
      v33[5] = 0u;
      v33[2] = 0u;
      v33[3] = 0u;
      *v33 = 0u;
      v33[1] = 0u;
    }
    v34 = v29 & 0xFFF;
    *((_BYTE *)v33 + (v34 >> 3)) |= 1 << (v29 & 7);
    if (v34 >= *(_DWORD *)v32)
      *(_DWORD *)v32 = v34 + 1;
  }
  v25 = 1;
  while (v23)
  {
    v23 = v9[v12 + v25++];
    if (v23 == 44)
    {
      v24 = v12 + v25 - 1;
      goto LABEL_47;
    }
  }
  if (v25 != 1)
  {
    v12 = v12 + v25 - 1;
    if (v25)
      goto LABEL_51;
  }
LABEL_68:
  result = 1;
  if (!a4)
    return result;
LABEL_22:
  v17 = *(_QWORD *)(a3 + 16);
  if (v17)
    goto LABEL_25;
  result = (uint64_t)malloc(0x100uLL);
  *(_QWORD *)(a3 + 16) = result;
  if (result)
  {
    v17 = result;
    *(_OWORD *)(result + 224) = 0u;
    *(_OWORD *)(result + 240) = 0u;
    *(_OWORD *)(result + 192) = 0u;
    *(_OWORD *)(result + 208) = 0u;
    *(_OWORD *)(result + 160) = 0u;
    *(_OWORD *)(result + 176) = 0u;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 144) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
LABEL_25:
    result = *(_QWORD *)(v17 + 24);
    if (!result)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v17 + 24) = result;
      if (result)
      {
        *(_OWORD *)(result + 480) = 0u;
        *(_OWORD *)(result + 496) = 0u;
        *(_OWORD *)(result + 448) = 0u;
        *(_OWORD *)(result + 464) = 0u;
        *(_OWORD *)(result + 416) = 0u;
        *(_OWORD *)(result + 432) = 0u;
        *(_OWORD *)(result + 384) = 0u;
        *(_OWORD *)(result + 400) = 0u;
        *(_OWORD *)(result + 352) = 0u;
        *(_OWORD *)(result + 368) = 0u;
        *(_OWORD *)(result + 320) = 0u;
        *(_OWORD *)(result + 336) = 0u;
        *(_OWORD *)(result + 288) = 0u;
        *(_OWORD *)(result + 304) = 0u;
        *(_OWORD *)(result + 256) = 0u;
        *(_OWORD *)(result + 272) = 0u;
        *(_OWORD *)(result + 224) = 0u;
        *(_OWORD *)(result + 240) = 0u;
        *(_OWORD *)(result + 192) = 0u;
        *(_OWORD *)(result + 208) = 0u;
        *(_OWORD *)(result + 160) = 0u;
        *(_OWORD *)(result + 176) = 0u;
        *(_OWORD *)(result + 128) = 0u;
        *(_OWORD *)(result + 144) = 0u;
        *(_OWORD *)(result + 96) = 0u;
        *(_OWORD *)(result + 112) = 0u;
        *(_OWORD *)(result + 64) = 0u;
        *(_OWORD *)(result + 80) = 0u;
        *(_OWORD *)(result + 32) = 0u;
        *(_OWORD *)(result + 48) = 0u;
        *(_OWORD *)result = 0u;
        *(_OWORD *)(result + 16) = 0u;
        goto LABEL_28;
      }
      return result;
    }
LABEL_28:
    *(_BYTE *)(result + 61) |= 8u;
    if (*(_DWORD *)(v17 + 16) <= 0x1EBu)
      *(_DWORD *)(v17 + 16) = 492;
    return 1;
  }
  return result;
}

uint64_t APPLIB_LOG_DISABLE(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  unsigned __int16 v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char __src;
  char v25[2047];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 0;
    v5 = a1[1];
    v6 = crc_16_l_table[v5 ^ 0x9B];
    v7 = a1[2];
    v8 = crc_16_l_table[(v7 ^ v6) ^ 0x4E];
    v9 = a1[3];
    v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(v6))];
    v11 = crc_16_l_table[v10 ^ (v8 >> 8)];
    v12 = crc_16_l_table[v11 ^ (v10 >> 8)];
    v13 = crc_16_l_table[v12 ^ (v11 >> 8)];
    v14 = crc_16_l_table[crc_16_l_table[v12 ^ (v11 >> 8)] ^ (v12 >> 8)];
    v15 = v14 ^ ~(v13 >> 8);
    *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[v12 ^ (v11 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v25, 0x7FFuLL);
      __src = 115;
      if ((v5 - 125) > 1)
      {
        v16 = 1;
      }
      else
      {
        v25[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        v16 = 2;
      }
      v25[v16 - 1] = v5;
      v17 = v16 + 1;
      if ((v7 - 125) <= 1)
      {
        v25[v17 - 1] = 125;
        LODWORD(v17) = v16 + 2;
        LOBYTE(v7) = v7 ^ 0x20;
      }
      v18 = ~(v14 ^ BYTE1(v13));
      v25[v17 - 1] = v7;
      v19 = v17 + 1;
      if ((v9 - 125) <= 1)
      {
        v25[v19 - 1] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v19) = v17 + 2;
      }
      v20 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
      v21 = &v25[v19 - 1];
      *v21 = v9;
      *(_DWORD *)(v21 + 1) = 0;
      v22 = v19 + 5;
      if ((v18 - 125) <= 1)
      {
        v25[v22 - 1] = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      v25[v22 - 1] = v18;
      v23 = v22 + 1;
      if (BYTE1(v15) - 125 <= 1)
      {
        v25[v23 - 1] = 125;
        v20 = BYTE1(v15) ^ 0x20;
        LODWORD(v23) = v22 + 2;
      }
      v25[v23 - 1] = v20;
      memcpy(a1, &__src, v23 + 1);
      result = (v23 + 2);
      a1[v23 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_FTM_LOG_ENABLE(unsigned __int8 *a1, int a2, __int16 a3, int a4, int a5)
{
  uint64_t result;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned int v25;
  unsigned __int16 v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE __src[2048];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 592715;
    *((_WORD *)a1 + 5) = a3;
    *((_DWORD *)a1 + 3) = a4;
    *((_DWORD *)a1 + 4) = a5;
    v11 = crc_16_l_table[a1[4] ^ 0x3DLL];
    v12 = crc_16_l_table[a1[5] ^ 0x2B ^ v11];
    v13 = crc_16_l_table[(a1[6] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(HIBYTE(a3) ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a4 ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(a1[13] ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a1[14] ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(a1[15] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a5 ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[17] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a1[19] ^ v25 ^ HIBYTE(v24))];
    *((_WORD *)a1 + 10) = v26 ^ ~HIBYTE(crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))]);
    if (a2 >= 44)
    {
      bzero(__src, 0x800uLL);
      v27 = *a1;
      if ((v27 - 125) > 1)
      {
        v28 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v27) = v27 ^ 0x20;
        v28 = 1;
      }
      __src[v28] = v27;
      v29 = v28 + 1;
      v30 = a1[1];
      if ((v30 - 125) <= 1)
      {
        __src[v29] = 125;
        LODWORD(v29) = v28 | 2;
        LOBYTE(v30) = v30 ^ 0x20;
      }
      __src[v29] = v30;
      v31 = v29 + 1;
      v32 = a1[2];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LOBYTE(v32) = v32 ^ 0x20;
        LODWORD(v31) = v29 + 2;
      }
      __src[v31] = v32;
      v33 = v31 + 1;
      v34 = a1[3];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LODWORD(v33) = v31 + 2;
        LOBYTE(v34) = v34 ^ 0x20;
      }
      __src[v33] = v34;
      v35 = v33 + 1;
      v36 = a1[4];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v36) = v36 ^ 0x20;
        LODWORD(v35) = v33 + 2;
      }
      __src[v35] = v36;
      v37 = v35 + 1;
      v38 = a1[5];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LODWORD(v37) = v35 + 2;
        LOBYTE(v38) = v38 ^ 0x20;
      }
      __src[v37] = v38;
      v39 = v37 + 1;
      v40 = a1[6];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LOBYTE(v40) = v40 ^ 0x20;
        LODWORD(v39) = v37 + 2;
      }
      __src[v39] = v40;
      v41 = v39 + 1;
      v42 = a1[7];
      if ((v42 - 125) <= 1)
      {
        __src[v41] = 125;
        LODWORD(v41) = v39 + 2;
        LOBYTE(v42) = v42 ^ 0x20;
      }
      __src[v41] = v42;
      v43 = v41 + 1;
      v44 = a1[8];
      if ((v44 - 125) <= 1)
      {
        __src[v43] = 125;
        LOBYTE(v44) = v44 ^ 0x20;
        LODWORD(v43) = v41 + 2;
      }
      __src[v43] = v44;
      v45 = v43 + 1;
      v46 = a1[9];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LODWORD(v45) = v43 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      __src[v45] = v46;
      v47 = v45 + 1;
      v48 = a1[10];
      if ((v48 - 125) <= 1)
      {
        __src[v47] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      __src[v47] = v48;
      v49 = v47 + 1;
      v50 = a1[11];
      if ((v50 - 125) <= 1)
      {
        __src[v49] = 125;
        LODWORD(v49) = v47 + 2;
        LOBYTE(v50) = v50 ^ 0x20;
      }
      __src[v49] = v50;
      v51 = v49 + 1;
      v52 = a1[12];
      if ((v52 - 125) <= 1)
      {
        __src[v51] = 125;
        LOBYTE(v52) = v52 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      __src[v51] = v52;
      v53 = v51 + 1;
      v54 = a1[13];
      if ((v54 - 125) <= 1)
      {
        __src[v53] = 125;
        LODWORD(v53) = v51 + 2;
        LOBYTE(v54) = v54 ^ 0x20;
      }
      __src[v53] = v54;
      v55 = v53 + 1;
      v56 = a1[14];
      if ((v56 - 125) <= 1)
      {
        __src[v55] = 125;
        LOBYTE(v56) = v56 ^ 0x20;
        LODWORD(v55) = v53 + 2;
      }
      __src[v55] = v56;
      v57 = v55 + 1;
      v58 = a1[15];
      if ((v58 - 125) <= 1)
      {
        __src[v57] = 125;
        LODWORD(v57) = v55 + 2;
        LOBYTE(v58) = v58 ^ 0x20;
      }
      __src[v57] = v58;
      v59 = v57 + 1;
      v60 = a1[16];
      if ((v60 - 125) <= 1)
      {
        __src[v59] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v59) = v57 + 2;
      }
      __src[v59] = v60;
      v61 = v59 + 1;
      v62 = a1[17];
      if ((v62 - 125) <= 1)
      {
        __src[v61] = 125;
        LODWORD(v61) = v59 + 2;
        LOBYTE(v62) = v62 ^ 0x20;
      }
      __src[v61] = v62;
      v63 = v61 + 1;
      v64 = a1[18];
      if ((v64 - 125) <= 1)
      {
        __src[v63] = 125;
        LOBYTE(v64) = v64 ^ 0x20;
        LODWORD(v63) = v61 + 2;
      }
      v65 = ~(v26 ^ BYTE1(v25));
      __src[v63] = v64;
      v66 = v63 + 1;
      v67 = a1[19];
      if ((v67 - 125) <= 1)
      {
        __src[v66] = 125;
        LOBYTE(v67) = v67 ^ 0x20;
        LODWORD(v66) = v63 + 2;
      }
      v68 = ((unsigned __int16)(v26 ^ ~(unsigned __int16)(v25 >> 8)) >> 8);
      __src[v66] = v67;
      v69 = v66 + 1;
      if ((v65 - 125) <= 1)
      {
        __src[v69] = 125;
        LOBYTE(v65) = v65 ^ 0x20;
        LODWORD(v69) = v66 + 2;
      }
      __src[v69] = v65;
      v70 = v69 + 1;
      if ((v68 - 125) <= 1)
      {
        __src[v70] = 125;
        LOBYTE(v68) = v68 ^ 0x20;
        LODWORD(v70) = v69 + 2;
      }
      __src[v70] = v68;
      memcpy(a1, __src, v70 + 1);
      result = (v70 + 2);
      a1[v70 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_FTM_LOG_DISABLE(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t result;
  char v7;
  uint64_t v8;
  unsigned __int16 v9;
  int v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int __src;
  char v34;
  _BYTE v35[2043];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x1F)
    return result;
  bzero(a1, a2);
  *(_DWORD *)a1 = 592715;
  a1[4] = 1;
  *((_WORD *)a1 + 5) = a3;
  v7 = HIBYTE(a3);
  v8 = a1[5];
  v9 = crc_16_l_table[v8 ^ 0xC4];
  v10 = a1[6];
  v11 = crc_16_l_table[(v10 ^ v9) ^ 0xFB];
  v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v9))];
  v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
  v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
  v15 = crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))];
  v16 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))] ^ (v14 >> 8)];
  v17 = v16 ^ ~(v15 >> 8);
  *((_WORD *)a1 + 6) = v16 ^ ~HIBYTE(crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))]);
  if (a2 < 28)
    return 0xFFFFFFFFLL;
  bzero(v35, 0x7FBuLL);
  __src = 592715;
  v34 = 1;
  if ((v8 - 125) <= 1)
  {
    v35[0] = 125;
    v18 = 6;
    v35[1] = v8 ^ 0x20;
    v19 = 7;
    if ((v10 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v18 = 5;
  v35[0] = v8;
  v19 = 6;
  if ((v10 - 125) <= 1)
  {
LABEL_9:
    *((_BYTE *)&__src + v19) = 125;
    LODWORD(v19) = v18 + 2;
    LOBYTE(v10) = v10 ^ 0x20;
  }
LABEL_10:
  *((_BYTE *)&__src + v19) = v10;
  v20 = v19 + 1;
  v21 = a1[7];
  if ((v21 - 125) <= 1)
  {
    *((_BYTE *)&__src + v20) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  *((_BYTE *)&__src + v20) = v21;
  v22 = v20 + 1;
  v23 = a1[8];
  if ((v23 - 125) <= 1)
  {
    *((_BYTE *)&__src + v22) = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  v24 = a3;
  *((_BYTE *)&__src + v22) = v23;
  v25 = v22 + 1;
  v26 = a1[9];
  if ((v26 - 125) <= 1)
  {
    *((_BYTE *)&__src + v25) = 125;
    LOBYTE(v26) = v26 ^ 0x20;
    LODWORD(v25) = v22 + 2;
  }
  *((_BYTE *)&__src + v25) = v26;
  v27 = v25 + 1;
  if (a3 - 125 <= 1)
  {
    *((_BYTE *)&__src + v27) = 125;
    v24 = a3 ^ 0x20;
    LODWORD(v27) = v25 + 2;
  }
  v28 = ~(v16 ^ BYTE1(v15));
  *((_BYTE *)&__src + v27) = v24;
  v29 = v27 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    *((_BYTE *)&__src + v29) = 125;
    v7 = HIBYTE(a3) ^ 0x20;
    LODWORD(v29) = v27 + 2;
  }
  v30 = (unsigned __int16)(v16 ^ ~(unsigned __int16)(v15 >> 8)) >> 8;
  *((_BYTE *)&__src + v29) = v7;
  v31 = v29 + 1;
  if ((v28 - 125) <= 1)
  {
    *((_BYTE *)&__src + v31) = 125;
    LOBYTE(v28) = v28 ^ 0x20;
    LODWORD(v31) = v29 + 2;
  }
  *((_BYTE *)&__src + v31) = v28;
  v32 = v31 + 1;
  if (BYTE1(v17) - 125 <= 1)
  {
    *((_BYTE *)&__src + v32) = 125;
    v30 = BYTE1(v17) ^ 0x20;
    LODWORD(v32) = v31 + 2;
  }
  *((_BYTE *)&__src + v32) = v30;
  memcpy(a1, &__src, v32 + 1);
  result = (v32 + 2);
  a1[v32 + 1] = 126;
  return result;
}

uint64_t APPLIB_LOG_GetIds(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  unsigned __int16 v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char __src;
  char v25[2047];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 1;
    v5 = a1[1];
    v6 = crc_16_l_table[v5 ^ 0x9B];
    v7 = a1[2];
    v8 = crc_16_l_table[(v7 ^ v6) ^ 0x4E];
    v9 = a1[3];
    v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(v6))];
    v11 = crc_16_l_table[v10 ^ (v8 >> 8) ^ 1];
    v12 = crc_16_l_table[v11 ^ (v10 >> 8)];
    v13 = crc_16_l_table[v12 ^ (v11 >> 8)];
    v14 = crc_16_l_table[crc_16_l_table[v12 ^ (v11 >> 8)] ^ (v12 >> 8)];
    v15 = v14 ^ ~(v13 >> 8);
    *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[v12 ^ (v11 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v25, 0x7FFuLL);
      __src = 115;
      if ((v5 - 125) > 1)
      {
        v16 = 1;
      }
      else
      {
        v25[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        v16 = 2;
      }
      v25[v16 - 1] = v5;
      v17 = v16 + 1;
      if ((v7 - 125) <= 1)
      {
        v25[v17 - 1] = 125;
        LODWORD(v17) = v16 + 2;
        LOBYTE(v7) = v7 ^ 0x20;
      }
      v18 = ~(v14 ^ BYTE1(v13));
      v25[v17 - 1] = v7;
      v19 = v17 + 1;
      if ((v9 - 125) <= 1)
      {
        v25[v19 - 1] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v19) = v17 + 2;
      }
      v20 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
      v21 = &v25[v19 - 1];
      *v21 = v9;
      *(_DWORD *)(v21 + 1) = 1;
      v22 = v19 + 5;
      if ((v18 - 125) <= 1)
      {
        v25[v22 - 1] = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      v25[v22 - 1] = v18;
      v23 = v22 + 1;
      if (BYTE1(v15) - 125 <= 1)
      {
        v25[v23 - 1] = 125;
        v20 = BYTE1(v15) ^ 0x20;
        LODWORD(v23) = v22 + 2;
      }
      v25[v23 - 1] = v20;
      memcpy(a1, &__src, v23 + 1);
      result = (v23 + 2);
      a1[v23 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_LOG_GetMasks(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  unsigned __int16 v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char __src;
  char v25[2047];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 4;
    v5 = a1[1];
    v6 = crc_16_l_table[v5 ^ 0x9B];
    v7 = a1[2];
    v8 = crc_16_l_table[(v7 ^ v6) ^ 0x4E];
    v9 = a1[3];
    v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(v6))];
    v11 = crc_16_l_table[v10 ^ (v8 >> 8) ^ 4];
    v12 = crc_16_l_table[v11 ^ (v10 >> 8)];
    v13 = crc_16_l_table[v12 ^ (v11 >> 8)];
    v14 = crc_16_l_table[crc_16_l_table[v12 ^ (v11 >> 8)] ^ (v12 >> 8)];
    v15 = v14 ^ ~(v13 >> 8);
    *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[v12 ^ (v11 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v25, 0x7FFuLL);
      __src = 115;
      if ((v5 - 125) > 1)
      {
        v16 = 1;
      }
      else
      {
        v25[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        v16 = 2;
      }
      v25[v16 - 1] = v5;
      v17 = v16 + 1;
      if ((v7 - 125) <= 1)
      {
        v25[v17 - 1] = 125;
        LODWORD(v17) = v16 + 2;
        LOBYTE(v7) = v7 ^ 0x20;
      }
      v18 = ~(v14 ^ BYTE1(v13));
      v25[v17 - 1] = v7;
      v19 = v17 + 1;
      if ((v9 - 125) <= 1)
      {
        v25[v19 - 1] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v19) = v17 + 2;
      }
      v20 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
      v21 = &v25[v19 - 1];
      *v21 = v9;
      *(_DWORD *)(v21 + 1) = 4;
      v22 = v19 + 5;
      if ((v18 - 125) <= 1)
      {
        v25[v22 - 1] = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      v25[v22 - 1] = v18;
      v23 = v22 + 1;
      if (BYTE1(v15) - 125 <= 1)
      {
        v25[v23 - 1] = 125;
        v20 = BYTE1(v15) ^ 0x20;
        LODWORD(v23) = v22 + 2;
      }
      v25[v23 - 1] = v20;
      memcpy(a1, &__src, v23 + 1);
      result = (v23 + 2);
      a1[v23 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_LOG_SetMasks(char *a1, int a2, unsigned int a3, unint64_t a4)
{
  uint64_t result;
  int v9;
  int v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  int v17;
  int v18;
  _BYTE __src[2048];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 3;
    *((_DWORD *)a1 + 2) = a4 >> 12;
    *((_DWORD *)a1 + 3) = a3;
    if (a3 >= 8)
    {
      v13 = a3 >> 3;
      v14 = (a4 >> 3) & 0x1FF;
      do
      {
        if (!v14)
          a1[((a4 >> 3) & 0x1FF) + 16] = 1 << (a4 & 7);
        --v14;
        --v13;
      }
      while (v13);
    }
    v9 = 1336;
    LOWORD(v10) = -1;
    v11 = a1;
    do
    {
      v12 = *v11++;
      v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *(_WORD *)(a1 + 167) = ~(_WORD)v10;
    if (a2 >= 338)
    {
      bzero(__src, 0x800uLL);
      v15 = 0;
      LODWORD(v16) = 0;
      do
      {
        while (1)
        {
          v18 = a1[v15];
          if ((v18 - 125) > 1)
            break;
          v17 = v16 + 1;
          __src[(int)v16] = 125;
          __src[(int)v16 + 1] = v18 ^ 0x20;
          v16 = (int)v16 + 1 + 1;
          if (++v15 == 169)
            goto LABEL_16;
        }
        v17 = v16;
        __src[(int)v16] = v18;
        v16 = (int)v16 + 1;
        ++v15;
      }
      while (v15 != 169);
LABEL_16:
      memcpy(a1, __src, v16);
      result = (v17 + 2);
      a1[v16] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_LOG_SetMultipleLogMasks(unsigned __int8 *a1, int a2, int a3, unsigned int a4, int a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  char *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  int v28;
  int v29;
  _BYTE __src[2048];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x10)
  {
    bzero(a1, a2);
    *a1 = 115;
    *((_DWORD *)a1 + 1) = 3;
    *((_DWORD *)a1 + 2) = a3;
    *((_DWORD *)a1 + 3) = a4;
    LODWORD(v13) = a4 >> 3;
    if ((a4 & 7) != 0)
      v13 = (v13 + 1);
    else
      v13 = v13;
    if (a5 && (_DWORD)v13)
    {
      v14 = 0;
      do
      {
        v15 = *(unsigned __int16 *)(a6 + 2 * v14);
        v16 = (v15 >> 3) & 0x1FF;
        v17 = 1 << (v15 & 7);
        v18 = v16;
        v19 = v13;
        do
        {
          if (!v18)
            a1[v16 + 16] |= v17;
          --v18;
          --v19;
        }
        while (v19);
        ++v14;
      }
      while (v14 != a5);
    }
    v20 = v13 + 16;
    v21 = 8 * (v13 + 16);
    if (8 * ((_WORD)v13 + 16))
    {
      LOWORD(v22) = -1;
      v23 = (char *)a1;
      do
      {
        v24 = *v23++;
        v22 = crc_16_l_table[(v24 ^ v22)] ^ ((unsigned __int16)(v22 & 0xFF00) >> 8);
        v21 -= 8;
      }
      while ((_WORD)v21);
      a1[v20] = ~(_BYTE)v22;
      a1[v13 + 17] = (unsigned __int16)~(_WORD)v22 >> 8;
      result = 0xFFFFFFFFLL;
      if (v13 > 0x3EE)
        return result;
    }
    else
    {
      a1[v20] = 0;
      a1[v13 + 17] = 0;
      result = 0xFFFFFFFFLL;
      if (v13 > 0x3EE)
        return result;
    }
    v25 = (v13 + 18);
    if (2 * (int)v25 <= a2)
    {
      bzero(__src, 0x800uLL);
      v26 = 0;
      LODWORD(v27) = 0;
      do
      {
        while (1)
        {
          v29 = a1[v26];
          if ((v29 - 125) > 1)
            break;
          v28 = v27 + 1;
          __src[(int)v27] = 125;
          __src[(int)v27 + 1] = v29 ^ 0x20;
          v27 = (int)v27 + 1 + 1;
          if (v25 == ++v26)
            goto LABEL_25;
        }
        v28 = v27;
        __src[(int)v27] = v29;
        v27 = (int)v27 + 1;
        ++v26;
      }
      while (v25 != v26);
LABEL_25:
      memcpy(a1, __src, v27);
      result = (v28 + 2);
      a1[v27] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_ParseRDALog(uint64_t a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if ((*(_WORD *)(a1 + 16) & 0x1C0) != 0)
    v1 = (((*(_WORD *)(a1 + 16) & 0x38) != 0) | (4 * ((*(_WORD *)(a1 + 16) & 7) != 0))) + 1;
  else
    v1 = ((*(_WORD *)(a1 + 16) & 0x38) != 0) | (4 * ((*(_WORD *)(a1 + 16) & 7) != 0));
  v2 = *(unsigned __int8 *)(a1 + 19);
  if (v1 > v2 || (*(_BYTE *)(a1 + 18) & 2) == 0)
    return 0;
  v3 = v2 / v1;
  if (v3 <= 1)
    v3 = 1;
  v4 = 0;
  v5 = 0;
  if ((*(_BYTE *)(a1 + 18) & 8) != 0)
  {
    if ((*(_BYTE *)(a1 + 18) & 4) != 0)
    {
      v11 = a1 + 20;
      do
      {
        v12 = *(char *)(v11 + 10);
        if (v12 <= 4)
        {
          v4 += dword_1DAD36BD0[v12];
          v5 += *(unsigned __int16 *)(v11 + qword_1DAD36BA8[v12]);
        }
        v11 += 98;
        --v3;
      }
      while (v3);
    }
    else
    {
      v9 = a1 + 20;
      do
      {
        v10 = *(char *)(v9 + 10);
        if (v10 <= 4)
        {
          v4 += dword_1DAD36BD0[v10];
          v5 += *(unsigned __int16 *)(v9 + qword_1DAD36BA8[v10]);
        }
        v9 += 72;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    v6 = 74;
    if ((*(_BYTE *)(a1 + 18) & 4) == 0)
      v6 = 48;
    v7 = a1 + 20;
    do
    {
      v8 = *(char *)(v7 + 10);
      if (v8 <= 4)
      {
        v4 += dword_1DAD36BD0[v8];
        v5 += *(unsigned __int16 *)(v7 + qword_1DAD36BA8[v8]);
      }
      v7 += v6;
      --v3;
    }
    while (v3);
  }
  if (v4)
    return v5 / v4;
  else
    return 0;
}

uint64_t APPLIB_DIAG_Unlock(_BYTE *a1, int a2, unsigned __int8 *a3, int a4)
{
  uint64_t result;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  int v32;
  char __src;
  char v34[2047];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 13 && a4 == 6)
  {
    bzero(a1, a2);
    *a1 = 65;
    v8 = *a3;
    a1[1] = v8;
    v9 = a3[1];
    a1[2] = v9;
    v10 = a3[2];
    a1[3] = v10;
    v11 = a3[3];
    a1[4] = v11;
    v12 = a3[4];
    a1[5] = v12;
    v13 = a3[5];
    a1[6] = v13;
    v14 = crc_16_l_table[v8 ^ 0xA];
    v15 = crc_16_l_table[(v9 ^ v14) ^ 0x5C];
    v16 = crc_16_l_table[(v10 ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(v11 ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(v12 ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(v13 ^ v18 ^ HIBYTE(v17))];
    v20 = v19 ^ ~(v18 >> 8);
    a1[7] = v20;
    v21 = BYTE1(v20);
    a1[8] = v21;
    if (a2 >= 0x12)
    {
      v32 = v21;
      bzero(v34, 0x7FFuLL);
      __src = 65;
      if ((v8 - 125) > 1)
      {
        v22 = 1;
      }
      else
      {
        v34[0] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        v22 = 2;
      }
      v34[v22 - 1] = v8;
      v23 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        v34[v23 - 1] = 125;
        LODWORD(v23) = v22 + 2;
        LOBYTE(v9) = v9 ^ 0x20;
      }
      v34[v23 - 1] = v9;
      v24 = v23 + 1;
      if ((v10 - 125) <= 1)
      {
        v34[v24 - 1] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v24) = v23 + 2;
      }
      v34[v24 - 1] = v10;
      v25 = v24 + 1;
      if ((v11 - 125) <= 1)
      {
        v34[v25 - 1] = 125;
        LODWORD(v25) = v24 + 2;
        LOBYTE(v11) = v11 ^ 0x20;
      }
      v34[v25 - 1] = v11;
      v26 = v25 + 1;
      if ((v12 - 125) <= 1)
      {
        v34[v26 - 1] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v26) = v25 + 2;
      }
      v27 = ~(v19 ^ BYTE1(v18));
      v34[v26 - 1] = v12;
      v28 = v26 + 1;
      if ((v13 - 125) <= 1)
      {
        v34[v28 - 1] = 125;
        LOBYTE(v13) = v13 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      v34[v28 - 1] = v13;
      v29 = v28 + 1;
      if ((v27 - 125) <= 1)
      {
        v34[v29 - 1] = 125;
        LODWORD(v29) = v28 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      v30 = v32;
      v34[v29 - 1] = v27;
      v31 = v29 + 1;
      if ((v32 - 125) <= 1)
      {
        v34[v31 - 1] = 125;
        v30 = v32 ^ 0x20;
        LODWORD(v31) = v29 + 2;
      }
      v34[v31 - 1] = v30;
      memcpy(a1, &__src, v31 + 1);
      result = (v31 + 2);
      a1[v31 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Lock(_WORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 11387;
    *((_BYTE *)a1 + 2) = 61;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2117938299;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_CreateICCID_EFS_File(char *a1, int a2)
{
  __int16 v3;
  __int128 v4;
  __int128 v5;
  _BYTE v6[30];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2 < 64)
    return 0xFFFFFFFFLL;
  v4 = 0u;
  v5 = 0u;
  memset(v6, 0, sizeof(v6));
  v3 = 8523;
  BYTE2(v4) = 1;
  BYTE4(v5) = 1;
  BYTE8(v5) = 1;
  BYTE14(v5) = 10;
  qmemcpy(v6, "sim.txt", 7);
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 42);
}

uint64_t APPLIB_DIAG_GetICCID(char *a1, int a2)
{
  __int16 v3;
  char v4;
  __int128 v5;
  __int128 v6;
  _BYTE v7[29];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2 < 64)
    return 0xFFFFFFFFLL;
  v5 = 0u;
  v6 = 0u;
  memset(v7, 0, sizeof(v7));
  v3 = 8576;
  v4 = 72;
  BYTE1(v5) = 1;
  BYTE5(v5) = 119;
  *(_WORD *)((char *)&v5 + 9) = 4097;
  BYTE11(v6) = 107;
  HIBYTE(v6) = 107;
  v7[7] = 1;
  v7[15] = 10;
  return APPLIB_DIAG_SendRawRequest(a1, a2, &v3, 55);
}

uint64_t APPLIB_DIAG_Read_Meid(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 1943);
}

uint64_t APPLIB_DIAG_Write_Meid(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 8)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 1943, __src, a4);
}

uint64_t APPLIB_DIAG_Read_Msl(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 85);
}

uint64_t APPLIB_DIAG_Write_Msl(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 85, __src, a4);
}

uint64_t APPLIB_DIAG_Read_Otksl(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 85);
}

uint64_t APPLIB_DIAG_Write_Otksl(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 219, __src, a4);
}

uint64_t APPLIB_DIAG_Write_AKey(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 9)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 25, __src, a4);
}

uint64_t APPLIB_DIAG_Write_AKeyCSum(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 8)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 26, __src, a4);
}

uint64_t APPLIB_DIAG_Write_BlueToothAddr(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50001, __src, a4);
}

uint64_t APPLIB_DIAG_Read_BlueToothAddr(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50001);
}

uint64_t APPLIB_DIAG_Write_WiFi_MAC_Addr(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50002, __src, a4);
}

uint64_t APPLIB_DIAG_Read_WiFi_MAC_Addr(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50002);
}

uint64_t APPLIB_DIAG_Write_WiFi_Cal_Data(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 64)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50003, __src, a4);
}

uint64_t APPLIB_DIAG_Read_WiFi_Cal_Data(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50003);
}

uint64_t APPLIB_DIAG_Write_USB2ETHERNET_MAC_Addr(char *a1, int a2, void *__src, int a4)
{
  if (a4 > 6)
    return 0xFFFFFFFFLL;
  else
    return APPLIB_DIAG_NvItemWrite(a1, a2, 50004, __src, a4);
}

uint64_t APPLIB_DIAG_Read_USB2ETHERNET_MAC_Addr(char *a1, int a2)
{
  return APPLIB_DIAG_NvItemRead(a1, a2, 50004);
}

uint64_t APPLIB_DIAG_GetSerialNumAndChipID(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0x9B390003000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x9B390003000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetNonce(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0x82E10002000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x82E10002000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SfpNvBackup(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0xFC590007000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0xFC590007000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SfpNvRestore(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 8)
  {
    bzero(a1, a2);
    *a1 = 0x7F910008000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x7F910008000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadRootManifest(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x17)
  {
    bzero(a1, a2);
    *a1 = 851275;
    a1[1] = 10;
    *((_WORD *)a1 + 4) = 5546;
    if (a2 >= 20)
    {
      *(_QWORD *)a1 = 0xA000CFD4BLL;
      *((_WORD *)a1 + 4) = 5546;
      *((_BYTE *)a1 + 10) = 126;
      return 11;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_StartProvision(_WORD *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  int v8;
  int v9;
  char *v10;
  char v11;
  char v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  int v16;
  unsigned __int8 *v17;
  char v18;
  int v19;
  _BYTE __src[2048];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1 || 2 * (unint64_t)a4 + 22 >= a2)
    return 0xFFFFFFFFLL;
  bzero(a1, a2);
  *(_DWORD *)a1 = 851531;
  a1[2] = 0;
  a1[3] = a4;
  memcpy(a1 + 4, a3, a4);
  v8 = 8 * (a4 + 8);
  if (8 * ((_WORD)a4 + 8))
  {
    LOWORD(v9) = -1;
    v10 = (char *)a1;
    do
    {
      v11 = *v10++;
      v9 = crc_16_l_table[(v11 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
      v8 -= 8;
    }
    while ((_WORD)v8);
    v12 = ~(_BYTE)v9;
    v13 = (unsigned __int16)~(_WORD)v9 >> 8;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  *((_BYTE *)a1 + a4 + 8) = v12;
  *((_BYTE *)a1 + a4 + 9) = v13;
  v15 = a4 + 10;
  result = 0xFFFFFFFFLL;
  if ((int)v15 <= 1024 && 2 * (int)v15 <= (int)a2)
  {
    bzero(__src, 0x800uLL);
    if ((int)v15 < 1)
    {
      v16 = 0;
    }
    else
    {
      v16 = 0;
      v17 = (unsigned __int8 *)a1;
      do
      {
        v19 = *v17++;
        v18 = v19;
        if ((v19 - 125) <= 1)
        {
          __src[v16] = 125;
          v18 ^= 0x20u;
          ++v16;
        }
        __src[v16++] = v18;
        --v15;
      }
      while (v15);
    }
    memcpy(a1, __src, v16);
    result = (v16 + 1);
    *((_BYTE *)a1 + v16) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_FinishProvision(_WORD *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  int v8;
  int v9;
  char *v10;
  char v11;
  char v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  int v16;
  unsigned __int8 *v17;
  char v18;
  int v19;
  _BYTE __src[2048];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1 || 2 * (unint64_t)a4 + 22 >= a2)
    return 0xFFFFFFFFLL;
  bzero(a1, a2);
  *(_DWORD *)a1 = 851531;
  a1[2] = 1;
  a1[3] = a4;
  memcpy(a1 + 4, a3, a4);
  v8 = 8 * (a4 + 8);
  if (8 * ((_WORD)a4 + 8))
  {
    LOWORD(v9) = -1;
    v10 = (char *)a1;
    do
    {
      v11 = *v10++;
      v9 = crc_16_l_table[(v11 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
      v8 -= 8;
    }
    while ((_WORD)v8);
    v12 = ~(_BYTE)v9;
    v13 = (unsigned __int16)~(_WORD)v9 >> 8;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  *((_BYTE *)a1 + a4 + 8) = v12;
  *((_BYTE *)a1 + a4 + 9) = v13;
  v15 = a4 + 10;
  result = 0xFFFFFFFFLL;
  if ((int)v15 <= 1024 && 2 * (int)v15 <= (int)a2)
  {
    bzero(__src, 0x800uLL);
    if ((int)v15 < 1)
    {
      v16 = 0;
    }
    else
    {
      v16 = 0;
      v17 = (unsigned __int8 *)a1;
      do
      {
        v19 = *v17++;
        v18 = v19;
        if ((v19 - 125) <= 1)
        {
          __src[v16] = 125;
          v18 ^= 0x20u;
          ++v16;
        }
        __src[v16++] = v18;
        --v15;
      }
      while (v15);
    }
    memcpy(a1, __src, v16);
    result = (v16 + 1);
    *((_BYTE *)a1 + v16) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_WriteCalibrationManifest(_WORD *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  uint64_t v8;
  int v9;
  int v10;
  char *v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  int v17;
  int v18;
  _BYTE __src[2048];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1 || 2 * (unint64_t)a4 + 22 >= a2)
    return 0xFFFFFFFFLL;
  bzero(a1, a2);
  *(_DWORD *)a1 = 851531;
  a1[2] = 6;
  a1[3] = a4;
  memcpy(a1 + 4, a3, a4);
  v8 = a4 + 8;
  v9 = 8 * (a4 + 8);
  if (8 * ((_WORD)a4 + 8))
  {
    LOWORD(v10) = -1;
    v11 = (char *)a1;
    do
    {
      v12 = *v11++;
      v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *((_BYTE *)a1 + v8) = ~(_BYTE)v10;
    *((_BYTE *)a1 + a4 + 9) = (unsigned __int16)~(_WORD)v10 >> 8;
    result = 0xFFFFFFFFLL;
    if (a4 > 0x3F6)
      return result;
  }
  else
  {
    *((_BYTE *)a1 + v8) = 0;
    *((_BYTE *)a1 + a4 + 9) = 0;
    result = 0xFFFFFFFFLL;
    if (a4 > 0x3F6)
      return result;
  }
  v14 = a4 + 10;
  if (2 * (int)v14 <= (int)a2)
  {
    bzero(__src, 0x800uLL);
    v15 = 0;
    LODWORD(v16) = 0;
    do
    {
      while (1)
      {
        v18 = *((unsigned __int8 *)a1 + v15);
        if ((v18 - 125) > 1)
          break;
        v17 = v16 + 1;
        __src[(int)v16] = 125;
        __src[(int)v16 + 1] = v18 ^ 0x20;
        v16 = (int)v16 + 1 + 1;
        if (v14 == ++v15)
          goto LABEL_16;
      }
      v17 = v16;
      __src[(int)v16] = v18;
      v16 = (int)v16 + 1;
      ++v15;
    }
    while (v14 != v15);
LABEL_16:
    memcpy(a1, __src, v16);
    result = (v17 + 2);
    *((_BYTE *)a1 + v16) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadCalibrationBackup(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0xCFE90005000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0xCFE90005000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_BackupCalibrationData(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0xD6310004000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0xD6310004000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_RestoreCalibrationData(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x66490009000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x66490009000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadManifestStatus(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x53D000C000CFD4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x53D000C000CFD4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_CheckCalibrationData(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x129000D000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x129000D000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadCalCounter(_QWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x13)
  {
    bzero(a1, a2);
    *a1 = 0x2B41000E000CFE4BLL;
    if (a2 >= 16)
    {
      *a1 = 0x2B41000E000CFE4BLL;
      *((_BYTE *)a1 + 8) = 126;
      return 9;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetRevision(_WORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 30720;
    *((_BYTE *)a1 + 2) = -16;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2129688576;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t DetectAndFixSpecialCharacters(unsigned __int8 *a1, int a2, int a3)
{
  uint64_t result;
  int v6;
  unsigned __int8 *v7;
  uint64_t v8;
  char v9;
  int v10;
  _BYTE __src[2048];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a3 <= 1024 && 2 * a3 <= a2)
  {
    bzero(__src, 0x800uLL);
    if (a3 < 1)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      v7 = a1;
      v8 = a3;
      do
      {
        v10 = *v7++;
        v9 = v10;
        if ((v10 - 125) <= 1)
        {
          __src[v6] = 125;
          v9 ^= 0x20u;
          ++v6;
        }
        __src[v6++] = v9;
        --v8;
      }
      while (v8);
    }
    memcpy(a1, __src, v6);
    result = (v6 + 1);
    a1[v6] = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_PingBaseBand(_WORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 11387;
    *((_BYTE *)a1 + 2) = 61;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2117938299;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetBaseBandRevision(_WORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = -27780;
    *((_BYTE *)a1 + 2) = 73;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2118751100;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SetDownloadMode(_WORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = -24262;
    *((_BYTE *)a1 + 2) = 110;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2121179450;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_NvItemRead(char *a1, int a2, __int16 a3)
{
  uint64_t result;
  int v5;
  int v6;
  char *v7;
  char v8;
  uint64_t v9;
  size_t v10;
  int v11;
  int v12;
  _BYTE __src[2048];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 140)
  {
    *(_OWORD *)(a1 + 124) = 0u;
    *((_OWORD *)a1 + 6) = 0u;
    *((_OWORD *)a1 + 7) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    *a1 = 38;
    *(_WORD *)(a1 + 1) = a3;
    v5 = 1064;
    LOWORD(v6) = -1;
    v7 = a1;
    do
    {
      v8 = *v7++;
      v6 = crc_16_l_table[(v8 ^ v6)] ^ ((unsigned __int16)(v6 & 0xFF00) >> 8);
      v5 -= 8;
    }
    while ((_WORD)v5);
    *(_WORD *)(a1 + 133) = ~(_WORD)v6;
    if (a2 >= 0x10E)
    {
      bzero(__src, 0x800uLL);
      v9 = 0;
      LODWORD(v10) = 0;
      do
      {
        while (1)
        {
          v12 = a1[v9];
          if ((v12 - 125) > 1)
            break;
          v11 = v10 + 1;
          __src[(int)v10] = 125;
          __src[(int)v10 + 1] = v12 ^ 0x20;
          v10 = (int)v10 + 1 + 1;
          if (++v9 == 135)
            goto LABEL_11;
        }
        v11 = v10;
        __src[(int)v10] = v12;
        v10 = (int)v10 + 1;
        ++v9;
      }
      while (v9 != 135);
LABEL_11:
      memcpy(a1, __src, v10);
      result = (v11 + 2);
      a1[v10] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_NvItemWrite(char *a1, int a2, __int16 a3, void *__src, int a5)
{
  uint64_t result;
  int v8;
  int v9;
  char *v10;
  char v11;
  uint64_t v12;
  size_t v13;
  int v14;
  int v15;
  _BYTE __srca[2048];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 140 && __src && a5 <= 128)
  {
    *(_OWORD *)(a1 + 124) = 0u;
    *((_OWORD *)a1 + 6) = 0u;
    *((_OWORD *)a1 + 7) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    *a1 = 39;
    *(_WORD *)(a1 + 1) = a3;
    memcpy(a1 + 3, __src, a5);
    v8 = 1064;
    LOWORD(v9) = -1;
    v10 = a1;
    do
    {
      v11 = *v10++;
      v9 = crc_16_l_table[(v11 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
      v8 -= 8;
    }
    while ((_WORD)v8);
    *(_WORD *)(a1 + 133) = ~(_WORD)v9;
    if (a2 >= 0x10E)
    {
      bzero(__srca, 0x800uLL);
      v12 = 0;
      LODWORD(v13) = 0;
      do
      {
        while (1)
        {
          v15 = a1[v12];
          if ((v15 - 125) > 1)
            break;
          v14 = v13 + 1;
          __srca[(int)v13] = 125;
          __srca[(int)v13 + 1] = v15 ^ 0x20;
          v13 = (int)v13 + 1 + 1;
          if (++v12 == 135)
            goto LABEL_13;
        }
        v14 = v13;
        __srca[(int)v13] = v15;
        v13 = (int)v13 + 1;
        ++v12;
      }
      while (v12 != 135);
LABEL_13:
      memcpy(a1, __srca, v13);
      result = (v14 + 2);
      a1[v13] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTMNvItemRead(char *a1, int a2, unsigned int a3)
{
  uint64_t result;
  unsigned __int16 v5;
  unsigned __int16 v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t __src;
  __int16 v21;
  char v22[2038];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2 >= 19)
    {
      *(_QWORD *)a1 = 0;
      *((_QWORD *)a1 + 1) = 0;
      *(_DWORD *)(a1 + 15) = 0;
      *(_WORD *)a1 = 2891;
      *(_QWORD *)(a1 + 2) = 0x900000025C0024;
      *((_WORD *)a1 + 5) = a3;
      v5 = crc_16_l_table[a1[7] ^ 0x5FLL];
      v6 = crc_16_l_table[a1[8] ^ 0xB7 ^ v5];
      v7 = crc_16_l_table[(a1[9] ^ v6 ^ HIBYTE(v5))];
      v8 = crc_16_l_table[(v7 ^ HIBYTE(v6) ^ a3)];
      v9 = a3 >> 8;
      v10 = crc_16_l_table[(a3 >> 8) ^ crc_16_l_table[(v7 ^ HIBYTE(v6) ^ a3)] ^ (v7 >> 8)];
      v11 = v10 ^ ~(v8 >> 8);
      *((_WORD *)a1 + 6) = v10 ^ ~(unsigned __int16)(v8 >> 8);
      if (a2 >= 0x1C)
      {
        v12 = a3;
        v13 = v10 ^ (v8 >> 8);
        bzero(v22, 0x7F6uLL);
        __src = 0x25C00240B4BLL;
        v21 = 144;
        if ((v12 - 125) > 1)
        {
          v14 = 10;
        }
        else
        {
          v22[0] = 125;
          LOBYTE(v12) = v12 ^ 0x20;
          v14 = 11;
        }
        v15 = ~(_BYTE)v13;
        *((_BYTE *)&__src + v14) = v12;
        v16 = v14 + 1;
        if (v9 - 125 <= 1)
        {
          *((_BYTE *)&__src + v16) = 125;
          LOBYTE(v9) = v9 ^ 0x20;
          LODWORD(v16) = v14 + 2;
        }
        v17 = BYTE1(v11);
        *((_BYTE *)&__src + v16) = v9;
        v18 = v16 + 1;
        if ((v15 - 125) <= 1)
        {
          *((_BYTE *)&__src + v18) = 125;
          LOBYTE(v15) = v15 ^ 0x20;
          LODWORD(v18) = v16 + 2;
        }
        *((_BYTE *)&__src + v18) = v15;
        v19 = v18 + 1;
        if ((v17 - 125) <= 1)
        {
          *((_BYTE *)&__src + v19) = 125;
          LOBYTE(v17) = v17 ^ 0x20;
          LODWORD(v19) = v18 + 2;
        }
        *((_BYTE *)&__src + v19) = v17;
        memcpy(a1, &__src, v19 + 1);
        result = (v19 + 2);
        a1[v19 + 1] = 126;
      }
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTMNvItemWrite(_QWORD *a1, int a2, __int16 a3, void *__src, int a5)
{
  uint64_t result;
  int v10;
  int v11;
  char *v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;
  int v17;
  unsigned __int8 *v18;
  char v19;
  int v20;
  _BYTE __srca[2048];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 - a5 >= 21)
  {
    *a1 = 0;
    a1[1] = 0;
    *(_QWORD *)((char *)a1 + 13) = 0;
    *(_WORD *)a1 = 2891;
    *(_QWORD *)((char *)a1 + 2) = 0xE0000025D0024;
    *((_WORD *)a1 + 5) = a3;
    *((_WORD *)a1 + 6) = a5;
    memcpy((char *)a1 + 14, __src, a5);
    v10 = 8 * (a5 + 14);
    if (8 * ((_WORD)a5 + 14))
    {
      LOWORD(v11) = -1;
      v12 = (char *)a1;
      do
      {
        v13 = *v12++;
        v11 = crc_16_l_table[(v13 ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
        v10 -= 8;
      }
      while ((_WORD)v10);
      v14 = ~(_BYTE)v11;
      v15 = (unsigned __int16)~(_WORD)v11 >> 8;
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    *((_BYTE *)a1 + a5 + 14) = v14;
    *((_BYTE *)a1 + a5 + 15) = v15;
    v16 = (a5 + 16);
    result = 0xFFFFFFFFLL;
    if ((int)v16 <= 1024 && 2 * (int)v16 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if ((int)v16 < 1)
      {
        v17 = 0;
      }
      else
      {
        v17 = 0;
        v18 = (unsigned __int8 *)a1;
        do
        {
          v20 = *v18++;
          v19 = v20;
          if ((v20 - 125) <= 1)
          {
            __srca[v17] = 125;
            v19 ^= 0x20u;
            ++v17;
          }
          __srca[v17++] = v19;
          --v16;
        }
        while (v16);
      }
      memcpy(a1, __srca, v17);
      result = (v17 + 1);
      *((_BYTE *)a1 + v17) = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ModeChange(_WORD *a1, int a2, unsigned int a3)
{
  uint64_t result;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char __src;
  char v18[2047];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 10)
  {
    *(_QWORD *)a1 = 0;
    a1[4] = 0;
    *(_BYTE *)a1 = 41;
    v5 = a3;
    *((_BYTE *)a1 + 1) = a3;
    v6 = a3 >> 8;
    *((_BYTE *)a1 + 2) = BYTE1(a3);
    v7 = crc_16_l_table[a3 ^ 0x44];
    v8 = crc_16_l_table[crc_16_l_table[a3 ^ 0x44] ^ (a3 >> 8) ^ 0xB3];
    v9 = v8 ^ (v7 >> 8);
    v10 = v8 ^ ~(v7 >> 8);
    *((_BYTE *)a1 + 3) = v10;
    v11 = BYTE1(v10);
    *((_BYTE *)a1 + 4) = BYTE1(v10);
    bzero(v18, 0x7FFuLL);
    __src = 41;
    if ((v5 - 125) > 1)
    {
      v12 = 1;
    }
    else
    {
      v18[0] = 125;
      LOBYTE(v5) = v5 ^ 0x20;
      v12 = 2;
    }
    v13 = ~(_BYTE)v9;
    v18[v12 - 1] = v5;
    v14 = v12 + 1;
    if (v6 - 125 <= 1)
    {
      v18[v14 - 1] = 125;
      LODWORD(v14) = v12 + 2;
      LOBYTE(v6) = v6 ^ 0x20;
    }
    v18[v14 - 1] = v6;
    v15 = v14 + 1;
    if ((v13 - 125) <= 1)
    {
      v18[v15 - 1] = 125;
      LOBYTE(v13) = v13 ^ 0x20;
      LODWORD(v15) = v14 + 2;
    }
    v18[v15 - 1] = v13;
    v16 = v15 + 1;
    if ((v11 - 125) <= 1)
    {
      v18[v16 - 1] = 125;
      LOBYTE(v11) = v11 ^ 0x20;
      LODWORD(v16) = v15 + 2;
    }
    v18[v16 - 1] = v11;
    memcpy(a1, &__src, v16 + 1);
    result = (v16 + 2);
    *((_BYTE *)a1 + v16 + 1) = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_GetStatus(_WORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 4)
  {
    bzero(a1, a2);
    *a1 = 5132;
    *((_BYTE *)a1 + 2) = 58;
    if (a2 >= 6)
    {
      *(_DWORD *)a1 = 2117735436;
      return 4;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetDeviceID(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 65099;
    *((_WORD *)a1 + 2) = -18861;
    if (a2 >= 0xC)
    {
      *a1 = 65099;
      *((_WORD *)a1 + 2) = -18861;
      *((_BYTE *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_DetectSim(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 130635;
    *((_WORD *)a1 + 2) = -20597;
    if (a2 >= 0xC)
    {
      *a1 = 130635;
      *((_WORD *)a1 + 2) = -20597;
      *((_BYTE *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t DetectAndStripSpecialCharacters(_BYTE *a1, int a2, int a3)
{
  uint64_t v3;
  int v6;
  uint64_t v7;
  int v8;
  _BYTE __src[2048];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 0xFFFFFFFFLL;
  if (a3 <= 2048 && a3 <= a2)
  {
    bzero(__src, 0x800uLL);
    if (a3 < 1)
    {
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v6 = 0;
      do
      {
        v7 = v6;
        v8 = a1[v6];
        if (v8 == 125)
        {
          ++v6;
          LOBYTE(v8) = a1[v7 + 1] ^ 0x20;
        }
        __src[v3++] = v8;
        ++v6;
      }
      while (v6 < a3);
    }
    bzero(a1, a3);
    memcpy(a1, __src, v3);
  }
  return v3;
}

uint64_t APPLIB_DIAG_SendRawRequest(char *a1, int a2, const void *a3, int a4)
{
  uint64_t result;
  int v9;
  int v10;
  char *v11;
  char v12;
  char *v13;
  uint64_t v14;
  int v15;
  unsigned __int8 *v16;
  char v17;
  int v18;
  _BYTE __src[2048];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a3 && a4 + 7 <= a2)
  {
    bzero(a1, a4 + 7);
    memcpy(a1, a3, a4);
    v9 = 8 * a4;
    if (((8 * a4) & 0xFFF8) != 0)
    {
      LOWORD(v10) = -1;
      v11 = a1;
      do
      {
        v12 = *v11++;
        v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
        v9 -= 8;
      }
      while ((_WORD)v9);
      *(_WORD *)&a1[a4] = ~(_WORD)v10;
      result = 0xFFFFFFFFLL;
      if (a4 > 1022)
        return result;
    }
    else
    {
      v13 = &a1[a4];
      *v13 = 0;
      v13[1] = 0;
      result = 0xFFFFFFFFLL;
      if (a4 > 1022)
        return result;
    }
    v14 = (a4 + 2);
    if (2 * (int)v14 <= a2)
    {
      bzero(__src, 0x800uLL);
      if (a4 < -1)
      {
        v15 = 0;
      }
      else
      {
        v15 = 0;
        v16 = (unsigned __int8 *)a1;
        do
        {
          v18 = *v16++;
          v17 = v18;
          if ((v18 - 125) <= 1)
          {
            __src[v15] = 125;
            v17 ^= 0x20u;
            ++v15;
          }
          __src[v15++] = v17;
          --v14;
        }
        while (v14);
      }
      memcpy(a1, __src, v15);
      result = (v15 + 1);
      a1[v15] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_SetOneRx(_DWORD *a1, int a2, __int16 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int __src;
  char v20[2044];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 9)
  {
    bzero(a1, a2);
    *a1 = 195915;
    v7 = a3;
    *((_WORD *)a1 + 2) = a3;
    v8 = HIBYTE(a3);
    v9 = crc_16_l_table[a3 ^ 0x78];
    v10 = crc_16_l_table[crc_16_l_table[a3 ^ 0x78] ^ HIBYTE(a3) ^ 0x95];
    v11 = v10 ^ ~(v9 >> 8);
    *((_BYTE *)a1 + 6) = v10 ^ ~(v9 >> 8);
    v12 = BYTE1(v11);
    *((_BYTE *)a1 + 7) = BYTE1(v11);
    if (a2 >= 0x10)
    {
      v13 = v10 ^ (v9 >> 8);
      bzero(v20, 0x7FCuLL);
      __src = 195915;
      if ((v7 - 125) > 1)
      {
        v14 = 4;
      }
      else
      {
        v20[0] = 125;
        LOBYTE(v7) = v7 ^ 0x20;
        v14 = 5;
      }
      v15 = ~(_BYTE)v13;
      v20[v14 - 4] = v7;
      v16 = v14 + 1;
      if ((v8 - 125) <= 1)
      {
        v20[v16 - 4] = 125;
        LODWORD(v16) = v14 | 2;
        LOBYTE(v8) = v8 ^ 0x20;
      }
      v20[v16 - 4] = v8;
      v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        v20[v17 - 4] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      v20[v17 - 4] = v15;
      v18 = v17 + 1;
      if ((v12 - 125) <= 1)
      {
        v20[v18 - 4] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v18) = v17 + 2;
      }
      v20[v18 - 4] = v12;
      memcpy(a1, &__src, v18 + 1);
      result = (v18 + 2);
      *((_BYTE *)a1 + v18 + 1) = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Get_RSSI_Channel(_DWORD *a1, int a2, __int16 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int __src;
  char v20[2044];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 9)
  {
    bzero(a1, a2);
    *a1 = 261451;
    v7 = a3;
    *((_WORD *)a1 + 2) = a3;
    v8 = HIBYTE(a3);
    v9 = crc_16_l_table[a3 ^ 0xA0];
    v10 = crc_16_l_table[crc_16_l_table[a3 ^ 0xA0] ^ HIBYTE(a3) ^ 0x8C];
    v11 = v10 ^ ~(v9 >> 8);
    *((_BYTE *)a1 + 6) = v10 ^ ~(v9 >> 8);
    v12 = BYTE1(v11);
    *((_BYTE *)a1 + 7) = BYTE1(v11);
    if (a2 >= 0x10)
    {
      v13 = v10 ^ (v9 >> 8);
      bzero(v20, 0x7FCuLL);
      __src = 261451;
      if ((v7 - 125) > 1)
      {
        v14 = 4;
      }
      else
      {
        v20[0] = 125;
        LOBYTE(v7) = v7 ^ 0x20;
        v14 = 5;
      }
      v15 = ~(_BYTE)v13;
      v20[v14 - 4] = v7;
      v16 = v14 + 1;
      if ((v8 - 125) <= 1)
      {
        v20[v16 - 4] = 125;
        LODWORD(v16) = v14 | 2;
        LOBYTE(v8) = v8 ^ 0x20;
      }
      v20[v16 - 4] = v8;
      v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        v20[v17 - 4] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      v20[v17 - 4] = v15;
      v18 = v17 + 1;
      if ((v12 - 125) <= 1)
      {
        v20[v18 - 4] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v18) = v17 + 2;
      }
      v20[v18 - 4] = v12;
      memcpy(a1, &__src, v18 + 1);
      result = (v18 + 2);
      *((_BYTE *)a1 + v18 + 1) = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Get_OneRxConfig(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 7)
  {
    bzero(a1, a2);
    *a1 = 326987;
    *((_WORD *)a1 + 2) = 15959;
    if (a2 >= 0xC)
    {
      *a1 = 326987;
      *((_WORD *)a1 + 2) = 15959;
      *((_BYTE *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_Release_BB_RESET_DET_N(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 523595;
    *((_WORD *)a1 + 2) = 5183;
    if (a2 >= 0xC)
    {
      *a1 = 523595;
      *((_WORD *)a1 + 2) = 5183;
      *((_BYTE *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_PowerDown_BaseBand(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 654667;
    *((_WORD *)a1 + 2) = -29137;
    if (a2 >= 0xC)
    {
      *a1 = 654667;
      *((_WORD *)a1 + 2) = -29137;
      *((_BYTE *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_EDLOAD(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 982347;
    *((_WORD *)a1 + 2) = -15577;
    if (a2 >= 0xC)
    {
      *a1 = 982347;
      *((_WORD *)a1 + 2) = -15577;
      *((_BYTE *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

BOOL ETLLOGGetItemIDAndEquipIDFromCode(unsigned int a1, unsigned int *a2, unsigned int *a3)
{
  if (a1 >> 13 <= 6)
  {
    *a2 = a1 >> 12;
    *a3 = a1 & 0xFFF;
  }
  return a1 < 0xE000;
}

uint64_t ETLLOGGetCode(int a1, int a2)
{
  return (a2 + (a1 << 12));
}

uint64_t ETLLOGDisable()
{
  if (ETLFrameCreateUplink()
    && ETLRequireFreeSpace()
    && HDLCFrameInject()
    && ETLSendCommand())
  {
    ETLFindMatchingResponse();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLLOGGetIDs()
{
  if (ETLFrameCreateUplink()
    && ETLRequireFreeSpace()
    && HDLCFrameInject()
    && ETLSendCommand())
  {
    ETLFindMatchingResponse();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLLOGSetMask(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  _ETLDebugPrint();
  if (ETLFrameCreateUplink()
    && ETLRequireFreeSpace()
    && HDLCFrameInject()
    && (a4 > 0x1000
     || !a4
     || ETLRequireFreeSpace()
     && HDLCFrameInjectUnsignedInt()
     && HDLCFrameInjectUnsignedInt()
     && HDLCFrameInject()
     && ETLSendCommand()
     && ETLFindMatchingResponse()))
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLLOGSetMaskWithRetry(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v11;

  if (!a6)
    return 0;
  v6 = a6;
  do
  {
    v11 = ETLLOGSetMask(a1, a2, a3, a4);
    if ((v11 & 1) != 0)
      break;
    ETLFlushResponseFull();
    _ETLDebugPrint();
    --v6;
  }
  while (v6);
  return v11;
}

uint64_t ETLLOGClearAllMasksWithRetry(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int128 v5;
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  _OWORD v12[32];
  _OWORD v13[4];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v5;
  v13[3] = v5;
  v13[0] = v5;
  v13[1] = v5;
  _ETLDebugPrint();
  result = ETLLOGGetIDs();
  if ((_DWORD)result)
  {
    memset(v12, 0, sizeof(v12));
    if (a3)
    {
      v7 = 0;
      while (2)
      {
        v8 = *((_DWORD *)v13 + v7);
        if (v8 >= 0x1000)
          v9 = 4096;
        else
          v9 = *((_DWORD *)v13 + v7);
        if (v8)
          v10 = v9;
        else
          v10 = 4096;
        v11 = a3;
        while ((ETLLOGSetMask(a1, v7, (uint64_t)v12, v10) & 1) == 0)
        {
          if (v11 >= 2)
          {
            ETLFlushResponseFull();
            _ETLDebugPrint();
          }
          if (!--v11)
            return 0;
        }
        if (++v7 != 14)
          continue;
        break;
      }
    }
    return 1;
  }
  return result;
}

uint64_t ETLLOGClearAllEnabledMasksWithRetry(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  __int128 v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  _OWORD v17[32];
  _OWORD v18[4];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18[2] = v8;
  v18[3] = v8;
  v18[0] = v8;
  v18[1] = v8;
  _ETLDebugPrint();
  result = ETLLOGGetIDs();
  if ((_DWORD)result)
  {
    memset(v17, 0, sizeof(v17));
    if (a2 && a5)
    {
      v10 = 0;
      do
      {
        v11 = *(unsigned int *)(a3 + 4 * v10);
        if (v11 <= 0xD)
        {
          v12 = *((_DWORD *)v18 + v11);
          if (v12 >= 0x1000)
            v13 = 4096;
          else
            v13 = *((_DWORD *)v18 + v11);
          if (v12)
            v14 = v13;
          else
            v14 = 4096;
          v15 = a5;
          while ((ETLLOGSetMask(a1, v11, (uint64_t)v17, v14) & 1) == 0)
          {
            if (v15 >= 2)
            {
              ETLFlushResponseFull();
              _ETLDebugPrint();
            }
            if (!--v15)
              return 0;
          }
        }
        ++v10;
      }
      while (v10 != a2);
    }
    return 1;
  }
  return result;
}

const char *ETLLOGEquipIDAsString(unsigned int a1)
{
  if (a1 <= 0xD)
    return (&__const_ETLLOGEquipIDAsString_kNames)[a1];
  else
    return "Unknown";
}

uint64_t ETLEVENTGetRangeSize(unsigned __int16 *a1)
{
  return a1[1] - *a1 + 1;
}

uint64_t ETLEVENTProcessEvent(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, unsigned int a5, _DWORD *a6)
{
  uint64_t result;
  unsigned int v7;
  int v8;
  int v9;

  result = 0;
  *a3 = 0;
  *a6 = 0;
  v7 = a5 - 2;
  if (a5 >= 2)
  {
    v8 = *(char *)(a4 + 1);
    *a6 = 2;
    if (v8 < 0)
    {
      if (v7 >= 2)
      {
        v9 = 2;
LABEL_7:
        *a6 = v9 + 2;
        __asm { BR              X2 }
      }
    }
    else if (v7 >= 8)
    {
      v9 = 8;
      goto LABEL_7;
    }
    result = 0;
    *a6 = 0;
  }
  return result;
}

uint64_t ETLEVENTProcessEventItem(unsigned __int8 *a1, unsigned int a2, _DWORD *a3, _WORD *a4, uint64_t a5, uint64_t a6)
{
  return ETLEVENTProcessEventItemTSLength(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t ETLEVENTProcessEventItemTSLength(unsigned __int8 *a1, unsigned int a2, _DWORD *a3, _WORD *a4, uint64_t a5, uint64_t a6, unsigned int *a7)
{
  unsigned int v7;
  unsigned int v8;
  _QWORD *v9;
  int v10;

  *a3 = 0;
  v7 = a2 - 2;
  if (a2 < 2)
    return 0;
  v8 = a1[1];
  *a4 = (*a1 | (unsigned __int16)((_WORD)v8 << 8)) & 0xFFF;
  if (a7)
  {
    *a7 = v8 >> 7;
    *a3 += 2;
    v9 = a1 + 2;
    if ((v8 & 0x80) == 0)
      goto LABEL_4;
LABEL_7:
    if (v7 >= 2)
    {
      *(_BYTE *)(a6 + 1) = a1[2];
      *(_BYTE *)(a6 + 2) = a1[3];
      v10 = 2;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  *a3 = 2;
  v9 = a1 + 2;
  if ((v8 & 0x80) != 0)
    goto LABEL_7;
LABEL_4:
  if (v7 >= 8)
  {
    *(_QWORD *)a6 = *v9;
    v10 = 8;
LABEL_10:
    *a3 += v10;
    return ((uint64_t (*)(void))((char *)&loc_1DAD234FC + 4 * byte_1DAD36CB4[(v8 >> 5) & 3]))();
  }
LABEL_8:
  *a3 = 0;
  return 0;
}

uint64_t ETLEVENTProcessHeader(uint64_t a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 0;
  *a3 = 0;
  *a4 = 0;
  if (a2 >= 3)
  {
    if (*(_BYTE *)a1 == 96)
    {
      *a3 = *(unsigned __int16 *)(a1 + 1);
      *a4 = 3;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ETLEVENTParseReport(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  uint64_t result;
  unsigned int v8;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  result = 0;
  *a5 = 0;
  if (a4 >= 3)
  {
    if (*(_BYTE *)a3 == 96)
    {
      v8 = *(unsigned __int16 *)(a3 + 1);
      *a5 = 3;
      if (v8)
      {
        v10 = a3 + 3;
        while (1)
        {
          v12 = -1431655766;
          v13 = -1431655766;
          if ((ETLEVENTProcessEvent(a1, a2, &v12, v10, v8, &v13) & 1) == 0)
            break;
          v11 = v13;
          v10 += v13;
          *a5 += v13;
          a1 += v12;
          a2 = a2 - v12;
          v8 -= v11;
          if (!v8)
            return 1;
        }
        result = 0;
        *a5 = 0;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

char *ETLEVENTParseEventReport(uint64_t a1, _QWORD *a2)
{
  _BYTE *v2;
  unsigned int v3;
  char *result;
  _BYTE *v6;
  int v7;
  unsigned int v8;
  int v9;

  v2 = *(_BYTE **)a1;
  v3 = *(_DWORD *)(a1 + 8);
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (v3 >= 3 && *v2 == 96 && *(unsigned __int16 *)(v2 + 1) + 3 == v3)
  {
    result = (char *)malloc(0x28uLL);
    if (!result)
      return result;
    v6 = *(_BYTE **)a1;
    v7 = *(_DWORD *)(a1 + 8);
    *(_OWORD *)result = 0u;
    *((_OWORD *)result + 1) = 0u;
    *((_QWORD *)result + 4) = 0;
    v8 = v7 + 1;
    if ((v7 + 1) <= 0xFFFFFFFD)
    {
      v9 = (char)v6[4];
      *(_WORD *)result = (v6[3] | (unsigned __int16)((char)v6[4] << 8)) & 0xFFF;
      if (v9 < 0)
      {
        if (v8 >= 2)
        {
          result[3] = v6[5];
          result[4] = v6[6];
LABEL_11:
          __asm { BR              X13 }
        }
      }
      else if (v8 >= 8)
      {
        *(_QWORD *)(result + 2) = *(_QWORD *)(v6 + 5);
        goto LABEL_11;
      }
    }
    free(result);
  }
  return 0;
}

BOOL ETLEVENTReportFree(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  v2 = *a1;
  if (!*a1)
  {
    v3 = 0;
    v5 = *((_DWORD *)a1 + 4);
    if (v5)
      return v3 == v5;
    goto LABEL_5;
  }
  v3 = 0;
  do
  {
    v4 = *(_QWORD *)(v2 + 32);
    free(*(void **)(v2 + 16));
    free((void *)v2);
    ++v3;
    v2 = v4;
  }
  while (v4);
  v5 = *((_DWORD *)a1 + 4);
  if (v3 == v5)
  {
LABEL_5:
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  return v3 == v5;
}

uint64_t ETLMESSAGEGetSubsystemRangeSize(unsigned __int16 *a1)
{
  return a1[1] - *a1 + 1;
}

uint64_t ETLMESSAGEGetSubsystemIDRanges(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = 0;
  if (ETLFrameCreateUplink()
    && (ETLRequireFreeSpace() & 1) != 0
    && HDLCFrameInject()
    && ETLSendCommand()
    && (ETLFindMatchingResponse() & 1) == 0)
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLMESSAGEGetSubsystemMasksWithRetry(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, unsigned int a8)
{
  unsigned int v8;
  uint64_t result;

  *a6 = 0;
  if (a8)
  {
    v8 = a8;
    _ETLDebugPrint();
    do
    {
      if (ETLFrameCreateUplink()
        && (a3 > 1
         || (ETLRequireFreeSpace() & 1) != 0
         && HDLCFrameInject()
         && ETLRequireFreeSpace()
         && HDLCFrameInject()
         && ETLSendCommand()
         && (ETLFindMatchingResponse() & 1) == 0))
      {
        _ETLDebugPrint();
      }
      HDLCFrameFree();
      HDLCFrameFree();
      if (v8 >= 2)
      {
        ETLFlushResponseFull();
        _ETLDebugPrint();
      }
      --v8;
    }
    while (v8);
  }
  else
  {
    _ETLDebugPrint();
  }
  result = 0;
  *a6 = 0;
  return result;
}

uint64_t ETLMESSAGESetSubsystemRuntimeMasksWithRetry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  unsigned int v6;

  if (a5)
  {
    _ETLDebugPrint();
    v6 = a5;
    do
    {
      if (ETLFrameCreateUplink()
        && (ETLRequireFreeSpace() & 1) != 0
        && HDLCFrameInject()
        && ETLRequireFreeSpace()
        && HDLCFrameInject()
        && HDLCFrameInjectUnsignedShort()
        && HDLCFrameInject()
        && ETLSendCommand()
        && (ETLFindMatchingResponse() & 1) == 0)
      {
        _ETLDebugPrint();
      }
      HDLCFrameFree();
      HDLCFrameFree();
      if (v6 >= 2)
      {
        ETLFlushResponseFull();
        _ETLDebugPrint();
      }
      --v6;
    }
    while (v6);
  }
  else
  {
    _ETLDebugPrint();
  }
  return 0;
}

uint64_t ETLMESSAGESetAllSubsystemRunTimeMasks()
{
  _ETLDebugPrint();
  if (ETLFrameCreateUplink()
    && (ETLRequireFreeSpace() & 1) != 0
    && HDLCFrameInject()
    && ETLRequireFreeSpace()
    && HDLCFrameInjectUnsignedShort()
    && HDLCFrameInjectUnsignedInt()
    && ETLSendCommand()
    && (ETLFindMatchingResponse() & 1) == 0)
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  _ETLDebugPrint();
  return 0;
}

uint64_t ETLMESSAGESetFlags(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = 0;
  _ETLDebugPrint();
  if (ETLFrameCreateUplink()
    && (ETLRequireFreeSpace() & 1) != 0
    && HDLCFrameInject()
    && ETLRequireFreeSpace()
    && HDLCFrameInjectUnsignedShort()
    && HDLCFrameInjectUnsignedInt()
    && ETLSendCommand())
  {
    if ((ETLFindMatchingResponse() & 1) != 0)
      *a4 = 0;
    else
      _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLMESSAGESetEnabled(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t result;
  int v4;
  int v5;

  v2 = a2;
  v5 = 0;
  LODWORD(result) = ETLMESSAGESetFlags(a1, a2, (uint64_t)&v5, &v4);
  if (v5 == v2)
    return result;
  else
    return 0;
}

uint64_t ETLQtraceSend(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (a1)
  {
    if (ETLFrameCreateUplink())
    {
      if ((ETLSubsysAddHeader() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || (HDLCFrameInjectUnsignedInt() & 1) == 0
        || !ETLRequireFreeSpace())
      {
LABEL_18:
        _ETLDebugPrint();
        goto LABEL_19;
      }
      if (*a2)
      {
        v3 = 0;
        v4 = 0;
        while ((HDLCFrameInjectUnsignedShort() & 1) != 0 && (HDLCFrameInjectUnsignedShort() & 1) != 0)
        {
          ++v4;
          v3 += 4;
          if (v4 >= *a2)
            goto LABEL_14;
        }
        goto LABEL_18;
      }
LABEL_14:
      if (ETLSendCommand() && ETLSubsysFindMatchingResponse())
      {
        v5 = ETLQtraceParseResponse();
LABEL_20:
        HDLCFrameFree();
        HDLCFrameFree();
        return v5;
      }
    }
LABEL_19:
    v5 = 0;
    goto LABEL_20;
  }
  _ETLDebugPrint();
  return 0;
}

uint64_t ETLQtraceParseResponse()
{
  ETLSubsysParseHeader();
  _ETLDebugPrint();
  return 0;
}

uint64_t ETLQtraceClearSend(uint64_t a1)
{
  uint64_t v1;

  if (!a1)
  {
    _ETLDebugPrint();
    return 0;
  }
  if (!ETLFrameCreateUplink())
    goto LABEL_13;
  if (!ETLSubsysAddHeader()
    || !HDLCFrameInjectUnsignedInt()
    || !HDLCFrameInjectUnsignedInt()
    || !HDLCFrameInjectUnsignedInt()
    || (HDLCFrameInjectUnsignedInt() & 1) == 0)
  {
    _ETLDebugPrint();
LABEL_13:
    v1 = 0;
    goto LABEL_14;
  }
  if (!ETLSendCommand() || !ETLSubsysFindMatchingResponse())
    goto LABEL_13;
  v1 = ETLQtraceParseResponse();
LABEL_14:
  HDLCFrameFree();
  HDLCFrameFree();
  return v1;
}

uint64_t ETLDMCUtilCountRangesInMaskArray(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  v2 = result;
  v3 = 0;
  LODWORD(result) = 0;
  v4 = 0;
  do
  {
    if ((v3 - v4) > 1 || (_DWORD)result == 0)
      v6 = result + 1;
    else
      v6 = result;
    if (*(_DWORD *)(v2 + 4 * v3))
    {
      v4 = v3;
      result = v6;
    }
    else
    {
      result = result;
    }
    ++v3;
  }
  while (a2 != v3);
  return result;
}

uint64_t ETLDMCKeyword(unsigned int a1)
{
  if (a1 > 0xF)
    return 0;
  else
    return *((_QWORD *)&kDMCFilesMap + 2 * a1 + 1);
}

uint64_t *ETLDMCFileName(unsigned int a1)
{
  uint64_t HardwareModel;
  const char *v3;
  uint64_t *v4;

  HardwareModel = _MergedGlobals_0;
  if (_MergedGlobals_0)
  {
    if (a1 > 0xF)
      return 0;
  }
  else
  {
    HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals_0 = HardwareModel;
    if (a1 > 0xF)
      return 0;
  }
  v3 = (const char *)*((_QWORD *)&kDMCFilesMap + 2 * a1 + 1);
  if (!v3)
    return 0;
  qword_1F0296388 = 0;
  unk_1F0296390 = 0;
  *(uint64_t *)((char *)&qword_1F0296398 + 7) = 0;
  qword_1F0296398 = 0;
  if (!HardwareModel)
    return 0;
  v4 = &qword_1F0296388;
  if (snprintf((char *)&qword_1F0296388, 0x1EuLL, "%c%d%s%s%s", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, (const char *)(HardwareModel + 5), "_", v3) >= 30)return 0;
  return v4;
}

const char *ETLDMCGetMatchingKeyword(const char *a1)
{
  uint64_t HardwareModel;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  int v6;
  int v7;

  HardwareModel = _MergedGlobals_0;
  if (a1)
  {
    v2 = a1;
    v3 = 0;
    v4 = _MergedGlobals_0;
    while (1)
    {
      if (v4)
      {
        v5 = *(const char **)((char *)&kDMCFilesMap + v3 + 8);
        if (v5)
          goto LABEL_9;
      }
      else
      {
        HardwareModel = TelephonyCapabilitiesGetHardwareModel();
        _MergedGlobals_0 = HardwareModel;
        v4 = HardwareModel;
        v5 = *(const char **)((char *)&kDMCFilesMap + v3 + 8);
        if (v5)
        {
LABEL_9:
          qword_1F0296388 = 0;
          unk_1F0296390 = 0;
          *(uint64_t *)((char *)&qword_1F0296398 + 7) = 0;
          qword_1F0296398 = 0;
          if (v4)
          {
            v6 = snprintf((char *)&qword_1F0296388, 0x1EuLL, "%c%d%s%s%s", *(char *)(v4 + 4), *(_DWORD *)v4, (const char *)(v4 + 5), "_", v5);
            HardwareModel = _MergedGlobals_0;
            if (v6 > 29)
            {
              v4 = _MergedGlobals_0;
            }
            else
            {
              v7 = strcmp(v2, (const char *)&qword_1F0296388);
              v4 = HardwareModel;
              if (!v7)
                return *(const char **)((char *)&kDMCFilesMap + v3 + 8);
            }
          }
        }
      }
      v3 += 16;
      if (v3 == 256)
      {
        if (HardwareModel
          || (HardwareModel = TelephonyCapabilitiesGetHardwareModel(), (_MergedGlobals_0 = HardwareModel) != 0))
        {
          if (strlen(v2) >= 3
            && *(unsigned __int8 *)(HardwareModel + 4) == *(unsigned __int8 *)v2
            && *((unsigned __int8 *)v2 + 1) - 49 < 8)
          {
            return 0;
          }
        }
        return v2;
      }
    }
  }
  v2 = 0;
  if (!_MergedGlobals_0)
    _MergedGlobals_0 = TelephonyCapabilitiesGetHardwareModel();
  return v2;
}

uint64_t *ETLDMCGetMatchingFileName(char *a1)
{
  return ETLDMCGetMatchingFileNameAndType(a1, 0);
}

uint64_t *ETLDMCGetMatchingFileNameAndType(char *a1, unsigned int *a2)
{
  unsigned int v4;
  uint64_t HardwareModel;
  const char *v6;
  uint64_t *v7;

  if (!a1)
    return 0;
  if (off_1F0296240 && !strcasecmp(a1, off_1F0296240))
  {
    v4 = 0;
  }
  else if (off_1F0296250 && !strcasecmp(a1, off_1F0296250))
  {
    v4 = 1;
  }
  else if (off_1F0296260 && !strcasecmp(a1, off_1F0296260))
  {
    v4 = 2;
  }
  else if (off_1F0296270 && !strcasecmp(a1, off_1F0296270))
  {
    v4 = 3;
  }
  else if (off_1F0296280 && !strcasecmp(a1, off_1F0296280))
  {
    v4 = 4;
  }
  else if (off_1F0296290 && !strcasecmp(a1, off_1F0296290))
  {
    v4 = 5;
  }
  else if (off_1F02962A0 && !strcasecmp(a1, off_1F02962A0))
  {
    v4 = 6;
  }
  else if (off_1F02962B0 && !strcasecmp(a1, off_1F02962B0))
  {
    v4 = 7;
  }
  else if (off_1F02962C0 && !strcasecmp(a1, off_1F02962C0))
  {
    v4 = 8;
  }
  else if (off_1F02962D0 && !strcasecmp(a1, off_1F02962D0))
  {
    v4 = 9;
  }
  else if (off_1F02962E0 && !strcasecmp(a1, off_1F02962E0))
  {
    v4 = 10;
  }
  else if (off_1F02962F0 && !strcasecmp(a1, off_1F02962F0))
  {
    v4 = 11;
  }
  else if (off_1F0296300 && !strcasecmp(a1, off_1F0296300))
  {
    v4 = 12;
  }
  else if (off_1F0296310 && !strcasecmp(a1, off_1F0296310))
  {
    v4 = 13;
  }
  else if (off_1F0296320 && !strcasecmp(a1, off_1F0296320))
  {
    v4 = 14;
  }
  else
  {
    if (!off_1F0296330 || strcasecmp(a1, off_1F0296330))
      return 0;
    v4 = 15;
  }
  if (a2)
    *a2 = v4;
  HardwareModel = _MergedGlobals_0;
  if (_MergedGlobals_0)
  {
    v6 = (const char *)*((_QWORD *)&kDMCFilesMap + 2 * v4 + 1);
    if (!v6)
      return 0;
  }
  else
  {
    HardwareModel = TelephonyCapabilitiesGetHardwareModel();
    _MergedGlobals_0 = HardwareModel;
    v6 = (const char *)*((_QWORD *)&kDMCFilesMap + 2 * v4 + 1);
    if (!v6)
      return 0;
  }
  qword_1F0296388 = 0;
  unk_1F0296390 = 0;
  *(uint64_t *)((char *)&qword_1F0296398 + 7) = 0;
  qword_1F0296398 = 0;
  if (!HardwareModel)
    return 0;
  v7 = &qword_1F0296388;
  if (snprintf((char *)&qword_1F0296388, 0x1EuLL, "%c%d%s%s%s", *(char *)(HardwareModel + 4), *(_DWORD *)HardwareModel, (const char *)(HardwareModel + 5), "_", v6) >= 30)return 0;
  return v7;
}

_QWORD *ETLTimestampGetTimeval(_QWORD *result, uint64_t a2)
{
  unsigned int v2;
  unint64_t v3;

  v2 = (43685 * (unsigned __int16)*result) >> 16;
  v3 = 5 * (*result >> 16)
     + ((unsigned __int16)(v2 + ((unsigned __int16)((*result - v2) & 0xFFFE) >> 1)) >> 13)
     + 2;
  *(_QWORD *)a2 = ((v3 * (unsigned __int128)0x10624DD2F1A9FCuLL) >> 64) + 315964800;
  *(_DWORD *)(a2 + 8) = 1000 * ((v3 >> 2) - 1000 * (((v3 >> 2) * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64));
  return result;
}

uint64_t ETLTimestampFromTimeval(uint64_t result, _QWORD *a2)
{
  if (result)
  {
    if (a2)
      *a2 = ((unsigned __int16)(-25600 * (*(_DWORD *)(result + 8) % 1250)) | (unint64_t)((800
                                                                                               * *(_QWORD *)result
                                                                                               + *(_DWORD *)(result + 8)
                                                                                               / 1250) << 16))
          - 16565655306240000;
  }
  return result;
}

uint64_t ETLTimestampGetHoursMinutesSeconds(uint64_t result, int *a2, int *a3, _DWORD *a4)
{
  *a4 = result % 60;
  *a3 = (int)(result / 60) % 60;
  *a2 = (int)(result / 3600) % 24;
  return result;
}

uint64_t ETLTimestampsEqual(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;

  v2 = bswap64(*a1);
  v3 = bswap64(*a2);
  v4 = v2 >= v3;
  v5 = v2 > v3;
  v6 = !v4;
  return (v5 - v6);
}

uint64_t ETLDMCDebugGetMessageRange@<X0>(_BYTE *a1@<X8>)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const std::locale::facet *v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  const std::locale::facet *v15;
  int v16;
  size_t v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  void *__src[2];
  __int128 v28;
  void *__p[2];
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  std::locale v42;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v41 = v2;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v30 = v2;
  *(_OWORD *)__p = v2;
  v28 = v2;
  *(_OWORD *)__src = v2;
  v26 = v2;
  v25 = v2;
  v3 = MEMORY[0x1E0DE4FE0];
  v4 = MEMORY[0x1E0DE4FE0] + 64;
  v32 = MEMORY[0x1E0DE4FE0] + 64;
  v5 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v24 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  *(uint64_t *)((char *)&v24 + *(_QWORD *)(v24 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v24 + *(_QWORD *)(v24 - 24));
  std::ios_base::init(v7, &v25);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v24 = v3 + 24;
  v32 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x1E0DE4FB8];
  *(_QWORD *)&v25 = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v30 = 0u;
  LODWORD(v31) = 16;
  v9 = v24;
  v10 = (char *)&v24 + *(_QWORD *)(v24 - 24);
  if (*((_DWORD *)v10 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&v24 + *(_QWORD *)(v24 - 24)));
    v11 = std::locale::use_facet(&v42, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 32);
    std::locale::~locale(&v42);
    v9 = v24;
  }
  *((_DWORD *)v10 + 36) = 48;
  *(void **)((char *)&__src[-2] + *(_QWORD *)(v9 - 24)) = (void *)4;
  v12 = (uint64_t *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" to ", 4);
  v13 = *v12;
  v14 = (char *)v12 + *(_QWORD *)(*v12 - 24);
  if (*((_DWORD *)v14 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
    v15 = std::locale::use_facet(&v42, MEMORY[0x1E0DE4A90]);
    v16 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 32);
    std::locale::~locale(&v42);
    *((_DWORD *)v14 + 36) = v16;
    v13 = *v12;
  }
  *((_DWORD *)v14 + 36) = 48;
  *(uint64_t *)((char *)v12 + *(_QWORD *)(v13 - 24) + 24) = 4;
  std::ostream::operator<<();
  if ((v31 & 0x10) != 0)
  {
    v18 = *((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1) < (unint64_t)v28)
    {
      *((_QWORD *)&v30 + 1) = v28;
      v18 = v28;
    }
    v19 = __src[1];
    v17 = v18 - (unint64_t)__src[1];
    if (v18 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_22;
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      v17 = 0;
      a1[23] = 0;
      goto LABEL_18;
    }
    v19 = (const void *)v26;
    v17 = (size_t)__src[0] - v26;
    if ((char *)__src[0] - (unint64_t)v26 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_22:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v17 >= 0x17)
  {
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    v22 = operator new(v20 + 1);
    *((_QWORD *)a1 + 1) = v17;
    *((_QWORD *)a1 + 2) = v21 | 0x8000000000000000;
    *(_QWORD *)a1 = v22;
    a1 = v22;
    goto LABEL_17;
  }
  a1[23] = v17;
  if (v17)
LABEL_17:
    memmove(a1, v19, v17);
LABEL_18:
  a1[v17] = 0;
  v24 = *v5;
  *(uint64_t *)((char *)&v24 + *(_QWORD *)(v24 - 24)) = v5[3];
  *(_QWORD *)&v25 = v8 + 16;
  if (SBYTE7(v30) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1DF0A6994](&v32);
}

void sub_1DAD254F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD25508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD2551C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::locale::~locale((std::locale *)(v9 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD2553C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD25550(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1DF0A6994](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F60];
  v3 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1DF0A6994](a1 + 112);
  return a1;
}

uint64_t ETLDMCDebugGetEventRange@<X0>(_BYTE *a1@<X8>)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const std::locale::facet *v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  const std::locale::facet *v15;
  int v16;
  size_t v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  void *__src[2];
  __int128 v28;
  void *__p[2];
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  std::locale v42;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v41 = v2;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v30 = v2;
  *(_OWORD *)__p = v2;
  v28 = v2;
  *(_OWORD *)__src = v2;
  v26 = v2;
  v25 = v2;
  v3 = MEMORY[0x1E0DE4FE0];
  v4 = MEMORY[0x1E0DE4FE0] + 64;
  v32 = MEMORY[0x1E0DE4FE0] + 64;
  v5 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v24 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  *(uint64_t *)((char *)&v24 + *(_QWORD *)(v24 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v24 + *(_QWORD *)(v24 - 24));
  std::ios_base::init(v7, &v25);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v24 = v3 + 24;
  v32 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x1E0DE4FB8];
  *(_QWORD *)&v25 = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v30 = 0u;
  LODWORD(v31) = 16;
  v9 = v24;
  v10 = (char *)&v24 + *(_QWORD *)(v24 - 24);
  if (*((_DWORD *)v10 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&v24 + *(_QWORD *)(v24 - 24)));
    v11 = std::locale::use_facet(&v42, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 32);
    std::locale::~locale(&v42);
    v9 = v24;
  }
  *((_DWORD *)v10 + 36) = 48;
  *(void **)((char *)&__src[-2] + *(_QWORD *)(v9 - 24)) = (void *)4;
  v12 = (uint64_t *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" to ", 4);
  v13 = *v12;
  v14 = (char *)v12 + *(_QWORD *)(*v12 - 24);
  if (*((_DWORD *)v14 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
    v15 = std::locale::use_facet(&v42, MEMORY[0x1E0DE4A90]);
    v16 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 32);
    std::locale::~locale(&v42);
    *((_DWORD *)v14 + 36) = v16;
    v13 = *v12;
  }
  *((_DWORD *)v14 + 36) = 48;
  *(uint64_t *)((char *)v12 + *(_QWORD *)(v13 - 24) + 24) = 4;
  std::ostream::operator<<();
  if ((v31 & 0x10) != 0)
  {
    v18 = *((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1) < (unint64_t)v28)
    {
      *((_QWORD *)&v30 + 1) = v28;
      v18 = v28;
    }
    v19 = __src[1];
    v17 = v18 - (unint64_t)__src[1];
    if (v18 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_22;
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      v17 = 0;
      a1[23] = 0;
      goto LABEL_18;
    }
    v19 = (const void *)v26;
    v17 = (size_t)__src[0] - v26;
    if ((char *)__src[0] - (unint64_t)v26 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_22:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v17 >= 0x17)
  {
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    v22 = operator new(v20 + 1);
    *((_QWORD *)a1 + 1) = v17;
    *((_QWORD *)a1 + 2) = v21 | 0x8000000000000000;
    *(_QWORD *)a1 = v22;
    a1 = v22;
    goto LABEL_17;
  }
  a1[23] = v17;
  if (v17)
LABEL_17:
    memmove(a1, v19, v17);
LABEL_18:
  a1[v17] = 0;
  v24 = *v5;
  *(uint64_t *)((char *)&v24 + *(_QWORD *)(v24 - 24)) = v5[3];
  *(_QWORD *)&v25 = v8 + 16;
  if (SBYTE7(v30) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1DF0A6994](&v32);
}

void sub_1DAD25968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD2597C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD25990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::locale::~locale((std::locale *)(v9 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD259B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1DAD259C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1DF0A6994](v1);
  _Unwind_Resume(a1);
}

uint64_t ETLDMCDebugGetMessageMasks@<X0>(unsigned int *a1@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  unsigned int *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  int v18;
  void **v19;
  uint64_t v20;
  int v21;
  void *v22;
  size_t v23;
  size_t v24;
  _QWORD *v25;
  uint64_t v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t result;
  _BYTE *v32;
  void *__p[2];
  unsigned __int8 v34;
  int v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41[2];
  __int128 v42;
  unint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char v54[9];

  switch(a2)
  {
    case 0:
      v6 = a1 + 4;
      goto LABEL_6;
    case 1:
      v6 = a1 + 20;
      goto LABEL_6;
    case 2:
      v6 = a1 + 36;
      goto LABEL_6;
    case 3:
      v6 = a1 + 52;
LABEL_6:
      v7 = *v6;
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = 0xAAAAAAAAAAAAAAAALL;
      v53 = v8;
      v52 = v8;
      v51 = v8;
      v50 = v8;
      v49 = v8;
      v48 = v8;
      v47 = v8;
      v46 = v8;
      v45 = v8;
      *(_OWORD *)v41 = v8;
      v42 = v8;
      v39 = v8;
      v40 = v8;
      v37 = v8;
      v38 = v8;
      v9 = MEMORY[0x1E0DE4FE0];
      v10 = MEMORY[0x1E0DE4FE0] + 64;
      v44 = MEMORY[0x1E0DE4FE0] + 64;
      v11 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
      v36 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
      *(uint64_t *)((char *)&v36 + *(_QWORD *)(v36 - 24)) = v11;
      v12 = (std::ios_base *)((char *)&v36 + *(_QWORD *)(v36 - 24));
      std::ios_base::init(v12, &v37);
      v12[1].__vftable = 0;
      v12[1].__fmtflags_ = -1;
      v36 = v9 + 24;
      v44 = v10;
      std::streambuf::basic_streambuf();
      *(_QWORD *)&v37 = MEMORY[0x1E0DE4FB8] + 16;
      *(_OWORD *)v41 = 0u;
      v42 = 0u;
      LODWORD(v43) = 16;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v36, (uint64_t)"Ranges: ", 8);
      v13 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
      v32 = a3;
      if ((_DWORD)v7)
      {
        v14 = 0;
        v15 = 8;
        while (2)
        {
          v35 = -1431655766;
          v16 = a1 + 4;
          switch(a2)
          {
            case 0:
              goto LABEL_12;
            case 1:
              v16 = a1 + 20;
              if (v14 >= a1[20])
                goto LABEL_15;
              goto LABEL_13;
            case 2:
              v16 = a1 + 36;
LABEL_12:
              if (v14 < *v16)
                goto LABEL_13;
              goto LABEL_15;
            case 3:
              v16 = a1 + 52;
              if (v14 < a1[52])
              {
LABEL_13:
                v17 = *(_DWORD *)(*((_QWORD *)v16 + 1) + v15 - 8);
                v35 = v17;
                v18 = HIWORD(v17);
              }
              else
              {
LABEL_15:
                LOWORD(v17) = -21846;
                v18 = 43690;
              }
              ETLDMCDebugGetMessageRange(__p);
              if ((v34 & 0x80u) == 0)
                v19 = __p;
              else
                v19 = (void **)__p[0];
              if ((v34 & 0x80u) == 0)
                v20 = v34;
              else
                v20 = (uint64_t)__p[1];
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v36, (uint64_t)v19, v20);
              v54[0] = 58;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v36, (uint64_t)v54, 1);
              if ((char)v34 < 0)
                operator delete(__p[0]);
              v21 = v18 - (unsigned __int16)v17 + 1;
              v22 = operator new[]((8 * v21) | 1u);
              bzero(v22, (8 * v21) | 1u);
              TelephonyUtilBinToHex();
              v23 = strlen((const char *)v22);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v36, (uint64_t)v22, v23);
              LOBYTE(__p[0]) = 10;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v36, (uint64_t)__p, 1);
              operator delete[](v22);
              ++v14;
              v15 += 16;
              if (v7 == v14)
                break;
              continue;
            default:
              goto LABEL_43;
          }
          break;
        }
      }
      if ((v43 & 0x10) != 0)
      {
        v26 = *((_QWORD *)&v42 + 1);
        if (*((_QWORD *)&v42 + 1) < (unint64_t)v40)
        {
          *((_QWORD *)&v42 + 1) = v40;
          v26 = v40;
        }
        v25 = v32;
        v27 = (const void *)*((_QWORD *)&v39 + 1);
        v24 = v26 - *((_QWORD *)&v39 + 1);
        if ((unint64_t)(v26 - *((_QWORD *)&v39 + 1)) >= 0x7FFFFFFFFFFFFFF8)
          goto LABEL_42;
      }
      else
      {
        if ((v43 & 8) == 0)
        {
          v24 = 0;
          v25 = v32;
          v32[23] = 0;
          goto LABEL_38;
        }
        v25 = v32;
        v27 = (const void *)v38;
        v24 = v39 - v38;
        if ((_QWORD)v39 - (_QWORD)v38 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_42:
          std::string::__throw_length_error[abi:ne180100]();
      }
      if (v24 >= 0x17)
      {
        v28 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v24 | 7) != 0x17)
          v28 = v24 | 7;
        v29 = v28 + 1;
        v30 = operator new(v28 + 1);
        v25[1] = v24;
        v25[2] = v29 | 0x8000000000000000;
        *v25 = v30;
        v25 = v30;
      }
      else
      {
        *((_BYTE *)v25 + 23) = v24;
        if (!v24)
          goto LABEL_38;
      }
      memmove(v25, v27, v24);
LABEL_38:
      *((_BYTE *)v25 + v24) = 0;
      v36 = *MEMORY[0x1E0DE4F60];
      *(uint64_t *)((char *)&v36 + *(_QWORD *)(v36 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
      *(_QWORD *)&v37 = MEMORY[0x1E0DE4FB8] + 16;
      if (SBYTE7(v42) < 0)
        operator delete(v41[0]);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      return MEMORY[0x1DF0A6994](&v44);
    default:
LABEL_43:
      result = _ETLDebugPrint();
      __break(1u);
      return result;
  }
}

void sub_1DAD25E88(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1DF0A6994](v1);
  _Unwind_Resume(a1);
}

void sub_1DAD25EB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1DF0A6994](v1);
  _Unwind_Resume(a1);
}

void sub_1DAD25ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  std::ostringstream::~ostringstream((uint64_t)&a23);
  _Unwind_Resume(a1);
}

uint64_t ETLDMCDebugGetLogCodes@<X0>(uint64_t a1@<X0>, int a2@<W1>, char a3@<W2>, _BYTE *a4@<X8>)
{
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  size_t v22;
  unsigned int v23;
  __int128 v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _QWORD *v31;
  size_t v32;
  size_t v33;
  void *v34;
  size_t v35;
  uint64_t *v36;
  _QWORD *v37;
  size_t v38;
  uint64_t v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *__p[2];
  __int128 v55;
  unint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char v67;
  char __str[16];
  __int128 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v56 = 0xAAAAAAAAAAAAAAAALL;
  v66 = v8;
  v65 = v8;
  v64 = v8;
  v63 = v8;
  v62 = v8;
  v61 = v8;
  v60 = v8;
  v59 = v8;
  v58 = v8;
  v55 = v8;
  *(_OWORD *)__p = v8;
  v53 = v8;
  v52 = v8;
  v51 = v8;
  v50 = v8;
  v9 = MEMORY[0x1E0DE4FE0];
  v10 = MEMORY[0x1E0DE4FE0] + 64;
  v57 = MEMORY[0x1E0DE4FE0] + 64;
  v11 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v49 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  *(uint64_t *)((char *)&v49 + *(_QWORD *)(v49 - 24)) = v11;
  v12 = (std::ios_base *)((char *)&v49 + *(_QWORD *)(v49 - 24));
  std::ios_base::init(v12, &v50);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  v49 = v9 + 24;
  v57 = v10;
  std::streambuf::basic_streambuf();
  *(_QWORD *)&v50 = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v55 = 0u;
  LODWORD(v56) = 16;
  v46 = a1 + 144;
  v47 = a1 + 208;
  v45 = a1 + 80;
  v13 = a1 + 16;
  v48 = a2;
  if ((a3 & 1) != 0)
  {
    v14 = 0;
    v15 = 0;
    while (2)
    {
      v16 = v13;
      switch(a2)
      {
        case 0:
          goto LABEL_8;
        case 1:
          v17 = *(_QWORD *)(v45 + 16);
          if (!v17)
            goto LABEL_3;
          goto LABEL_9;
        case 2:
          v16 = v46;
LABEL_8:
          v17 = *(_QWORD *)(v16 + 16);
          if (v17)
            goto LABEL_9;
          goto LABEL_3;
        case 3:
          v17 = *(_QWORD *)(v47 + 16);
          if (!v17)
            goto LABEL_3;
LABEL_9:
          v18 = (int *)(v17 + 16 * v15);
          v19 = *v18;
          if (*v18)
          {
            v20 = *((_QWORD *)v18 + 1);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)"EquipID(", 8);
            v21 = (_QWORD *)std::ostream::operator<<();
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"): ", 3);
            v22 = strlen((&__const_ETLLOGEquipIDAsString_kNames)[v15]);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)(&__const_ETLLOGEquipIDAsString_kNames)[v15], v22);
            __str[0] = 58;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)__str, 1);
            __str[0] = 10;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)__str, 1);
            v23 = 0;
            a2 = v48;
            do
            {
              if (((*(unsigned __int8 *)(v20 + ((unint64_t)v23 >> 3)) >> (v23 & 7)) & 1) != 0)
              {
                *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)__str = v24;
                v69 = v24;
                snprintf(__str, 0x20uLL, "0x%x", v14 + v23);
                v67 = 9;
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)&v67, 1);
                v25 = strlen(__str);
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)__str, v25);
                v67 = 10;
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)&v67, 1);
              }
              ++v23;
            }
            while (v19 != v23);
          }
LABEL_3:
          ++v15;
          v14 += 4096;
          if (v15 != 14)
            continue;
          goto LABEL_27;
        default:
          goto LABEL_46;
      }
    }
  }
  v26 = 0;
  v27 = 0;
  while (2)
  {
    v28 = v13;
    switch(a2)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v29 = *(_QWORD *)(v45 + 16);
        if (!v29)
          goto LABEL_17;
        goto LABEL_23;
      case 2:
        v28 = v46;
LABEL_22:
        v29 = *(_QWORD *)(v28 + 16);
        if (v29)
          goto LABEL_23;
        goto LABEL_17;
      case 3:
        v29 = *(_QWORD *)(v47 + 16);
        if (!v29)
          goto LABEL_17;
LABEL_23:
        v30 = *(_DWORD *)(v29 + v26);
        if (v30)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)"EquipID(", 8);
          v31 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"): ", 3);
          v32 = strlen((&__const_ETLLOGEquipIDAsString_kNames)[v27]);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)(&__const_ETLLOGEquipIDAsString_kNames)[v27], v32);
          __str[0] = 58;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)__str, 1);
          v33 = ((v30 + 7) >> 2) | 1;
          v34 = operator new[](v33);
          bzero(v34, v33);
          TelephonyUtilBinToHex();
          v35 = strlen((const char *)v34);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)v34, v35);
          __str[0] = 10;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v49, (uint64_t)__str, 1);
          operator delete[](v34);
          a2 = v48;
        }
LABEL_17:
        ++v27;
        v26 += 16;
        if (v27 != 14)
          continue;
LABEL_27:
        v36 = (uint64_t *)MEMORY[0x1E0DE4F60];
        if ((v56 & 0x10) != 0)
        {
          v39 = *((_QWORD *)&v55 + 1);
          v37 = a4;
          if (*((_QWORD *)&v55 + 1) < (unint64_t)v53)
          {
            *((_QWORD *)&v55 + 1) = v53;
            v39 = v53;
          }
          v40 = (const void *)*((_QWORD *)&v52 + 1);
          v38 = v39 - *((_QWORD *)&v52 + 1);
          if ((unint64_t)(v39 - *((_QWORD *)&v52 + 1)) >= 0x7FFFFFFFFFFFFFF8)
            goto LABEL_44;
        }
        else
        {
          v37 = a4;
          if ((v56 & 8) == 0)
          {
            v38 = 0;
            a4[23] = 0;
            goto LABEL_40;
          }
          v40 = (const void *)v51;
          v38 = v52 - v51;
          if ((_QWORD)v52 - (_QWORD)v51 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_44:
            std::string::__throw_length_error[abi:ne180100]();
        }
        if (v38 >= 0x17)
        {
          v41 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v38 | 7) != 0x17)
            v41 = v38 | 7;
          v42 = v41 + 1;
          v43 = operator new(v41 + 1);
          v37[1] = v38;
          v37[2] = v42 | 0x8000000000000000;
          *v37 = v43;
          v37 = v43;
        }
        else
        {
          *((_BYTE *)v37 + 23) = v38;
          if (!v38)
            goto LABEL_40;
        }
        memmove(v37, v40, v38);
LABEL_40:
        *((_BYTE *)v37 + v38) = 0;
        v49 = *v36;
        *(uint64_t *)((char *)&v49 + *(_QWORD *)(v49 - 24)) = v36[3];
        *(_QWORD *)&v50 = MEMORY[0x1E0DE4FB8] + 16;
        if (SBYTE7(v55) < 0)
          operator delete(__p[0]);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        return MEMORY[0x1DF0A6994](&v57);
      default:
        _ETLDebugPrint();
        __break(1u);
LABEL_46:
        result = _ETLDebugPrint();
        __break(1u);
        return result;
    }
  }
}

void sub_1DAD26510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  std::ostream::~ostream();
  MEMORY[0x1DF0A6994](a13);
  _Unwind_Resume(a1);
}

uint64_t ETLDMCDebugGetEvents@<X0>(uint64_t a1@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const void **v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;
  void *__p[2];
  unsigned __int8 v29;
  int v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36[2];
  __int128 v37;
  unint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  switch(a2)
  {
    case 0:
      v6 = a1 + 16;
      goto LABEL_6;
    case 1:
      v6 = a1 + 80;
      goto LABEL_6;
    case 2:
      v6 = a1 + 144;
      goto LABEL_6;
    case 3:
      v6 = a1 + 208;
LABEL_6:
      v7 = *(unsigned int *)(v6 + 24);
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v38 = 0xAAAAAAAAAAAAAAAALL;
      v48 = v8;
      v47 = v8;
      v46 = v8;
      v45 = v8;
      v44 = v8;
      v43 = v8;
      v42 = v8;
      v41 = v8;
      v40 = v8;
      v37 = v8;
      *(_OWORD *)v36 = v8;
      v35 = v8;
      v34 = v8;
      v33 = v8;
      v32 = v8;
      v9 = MEMORY[0x1E0DE4FE0];
      v10 = MEMORY[0x1E0DE4FE0] + 64;
      v39 = MEMORY[0x1E0DE4FE0] + 64;
      v11 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
      v31 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
      *(uint64_t *)((char *)&v31 + *(_QWORD *)(v31 - 24)) = v11;
      v12 = (std::ios_base *)((char *)&v31 + *(_QWORD *)(v31 - 24));
      std::ios_base::init(v12, &v32);
      v12[1].__vftable = 0;
      v12[1].__fmtflags_ = -1;
      v31 = v9 + 24;
      v39 = v10;
      std::streambuf::basic_streambuf();
      *(_QWORD *)&v32 = MEMORY[0x1E0DE4FB8] + 16;
      *(_OWORD *)v36 = 0u;
      v37 = 0u;
      LODWORD(v38) = 16;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)"Ranges: ", 8);
      v13 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
      if ((_DWORD)v7)
      {
        v14 = 0;
        while (2)
        {
          v30 = -1431655766;
          v15 = a1 + 16;
          switch(a2)
          {
            case 0:
              goto LABEL_13;
            case 1:
              v15 = a1 + 80;
              if (v14 >= *(unsigned int *)(a1 + 104))
                goto LABEL_15;
              goto LABEL_14;
            case 2:
              v15 = a1 + 144;
LABEL_13:
              if (v14 < *(unsigned int *)(v15 + 24))
                goto LABEL_14;
              goto LABEL_15;
            case 3:
              v15 = a1 + 208;
              if (v14 >= *(unsigned int *)(a1 + 232))
                goto LABEL_15;
LABEL_14:
              v30 = *(_DWORD *)(*(_QWORD *)(v15 + 32) + 4 * v14);
LABEL_15:
              ETLDMCDebugGetEventRange(__p);
              if ((v29 & 0x80u) == 0)
                v16 = __p;
              else
                v16 = (void **)__p[0];
              if ((v29 & 0x80u) == 0)
                v17 = v29;
              else
                v17 = (uint64_t)__p[1];
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)v16, v17);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)"\n", 1);
              if ((char)v29 < 0)
                operator delete(__p[0]);
              if (v7 != ++v14)
                continue;
              goto LABEL_25;
            default:
              goto LABEL_44;
          }
        }
      }
LABEL_25:
      if ((v38 & 0x10) != 0)
      {
        v21 = *((_QWORD *)&v37 + 1);
        if (*((_QWORD *)&v37 + 1) < (unint64_t)v35)
        {
          *((_QWORD *)&v37 + 1) = v35;
          v21 = v35;
        }
        v22 = (const void **)&v34 + 1;
      }
      else
      {
        if ((v38 & 8) == 0)
        {
          v18 = 0;
          v19 = a3;
          *((_BYTE *)a3 + 23) = 0;
          v20 = MEMORY[0x1E0DE4FB8];
          goto LABEL_40;
        }
        v22 = (const void **)&v33;
        v21 = v34;
      }
      v19 = a3;
      v20 = MEMORY[0x1E0DE4FB8];
      v23 = *v22;
      v18 = v21 - (_QWORD)*v22;
      if (v18 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v18 >= 0x17)
      {
        v24 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v18 | 7) != 0x17)
          v24 = v18 | 7;
        v25 = v24 + 1;
        v26 = operator new(v24 + 1);
        a3[1] = v18;
        a3[2] = v25 | 0x8000000000000000;
        *a3 = v26;
        v19 = v26;
      }
      else
      {
        *((_BYTE *)a3 + 23) = v18;
        if (!v18)
          goto LABEL_40;
      }
      memmove(v19, v23, v18);
LABEL_40:
      *((_BYTE *)v19 + v18) = 0;
      v31 = *MEMORY[0x1E0DE4F60];
      *(uint64_t *)((char *)&v31 + *(_QWORD *)(v31 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
      *(_QWORD *)&v32 = v20 + 16;
      if (SBYTE7(v37) < 0)
        operator delete(v36[0]);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      return MEMORY[0x1DF0A6994](&v39);
    default:
LABEL_44:
      result = _ETLDebugPrint();
      __break(1u);
      return result;
  }
}

void sub_1DAD2698C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1DF0A6994](v1);
  _Unwind_Resume(a1);
}

void sub_1DAD269B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1DF0A6994](v1);
  _Unwind_Resume(a1);
}

void sub_1DAD269D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DAD269E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22)
{
  if (a20 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a22);
  _Unwind_Resume(a1);
}

const char *ETLDMCDebugGetViewAsString(unsigned int a1)
{
  if (a1 > 3)
    return "Unknown";
  else
    return (&off_1EA1F22A0)[a1];
}

uint64_t ETLDMCDebugGetQtraces@<X0>(_QWORD *a1@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *__p[2];
  __int128 v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  v43 = v6;
  v42 = v6;
  v41 = v6;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v30 = v6;
  v29 = v6;
  v28 = v6;
  v27 = v6;
  v7 = MEMORY[0x1E0DE4FE0];
  v8 = MEMORY[0x1E0DE4FE0] + 64;
  v34 = MEMORY[0x1E0DE4FE0] + 64;
  v9 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v10 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v26 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  *(uint64_t *)((char *)&v26 + *(_QWORD *)(v26 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v26 + *(_QWORD *)(v26 - 24));
  std::ios_base::init(v11, &v27);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v26 = v7 + 24;
  v34 = v8;
  std::streambuf::basic_streambuf();
  *(_QWORD *)&v27 = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v32 = 0u;
  LODWORD(v33) = 16;
  switch(a2)
  {
    case 0:
      v12 = a1 + 2;
      if (a1[9])
        goto LABEL_11;
      break;
    case 1:
      v12 = a1 + 10;
      if (a1[17])
        goto LABEL_11;
      break;
    case 2:
      v12 = a1 + 18;
      if (a1[25])
        goto LABEL_11;
      break;
    case 3:
      v12 = a1 + 26;
      if (a1[33])
        goto LABEL_11;
      break;
    default:
      _ETLDebugPrint();
      v12 = 0;
      if (MEMORY[0x38])
      {
LABEL_11:
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v26, (uint64_t)"Total Clinet IDs: ", 18);
        v13 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
        if (*((_DWORD *)v12 + 12))
        {
          v14 = 0;
          v15 = 0;
          do
          {
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v26, (uint64_t)"  Clinet ID: ", 13);
            *(_DWORD *)((char *)&v27 + *(_QWORD *)(v26 - 24)) = *(_DWORD *)((_BYTE *)&v27 + *(_QWORD *)(v26 - 24)) & 0xFFFFFFB5 | 2;
            v16 = (_QWORD *)std::ostream::operator<<();
            v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)", Mask: 0x", 10);
            *(_DWORD *)((char *)v17 + *(_QWORD *)(*v17 - 24) + 8) = *(_DWORD *)((_BYTE *)v17
                                                                                + *(_QWORD *)(*v17 - 24)
                                                                                + 8) & 0xFFFFFFB5 | 8;
            v18 = (_QWORD *)std::ostream::operator<<();
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"\n", 1);
            ++v15;
            v14 += 4;
          }
          while (v15 < *((unsigned int *)v12 + 12));
        }
      }
      break;
  }
  if ((v33 & 0x10) != 0)
  {
    v20 = *((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1) < (unint64_t)v30)
    {
      *((_QWORD *)&v32 + 1) = v30;
      v20 = v30;
    }
    v21 = (const void *)*((_QWORD *)&v29 + 1);
    v19 = v20 - *((_QWORD *)&v29 + 1);
    if ((unint64_t)(v20 - *((_QWORD *)&v29 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_31;
  }
  else
  {
    if ((v33 & 8) == 0)
    {
      v19 = 0;
      a3[23] = 0;
      goto LABEL_27;
    }
    v21 = (const void *)v28;
    v19 = v29 - v28;
    if ((_QWORD)v29 - (_QWORD)v28 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_31:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v19 >= 0x17)
  {
    v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v22 = v19 | 7;
    v23 = v22 + 1;
    v24 = operator new(v22 + 1);
    *((_QWORD *)a3 + 1) = v19;
    *((_QWORD *)a3 + 2) = v23 | 0x8000000000000000;
    *(_QWORD *)a3 = v24;
    a3 = v24;
    goto LABEL_26;
  }
  a3[23] = v19;
  if (v19)
LABEL_26:
    memmove(a3, v21, v19);
LABEL_27:
  a3[v19] = 0;
  v26 = *v9;
  *(uint64_t *)((char *)&v26 + *(_QWORD *)(v26 - 24)) = v9[3];
  *(_QWORD *)&v27 = MEMORY[0x1E0DE4FB8] + 16;
  if (SBYTE7(v32) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1DF0A6994](&v34);
}

void sub_1DAD26DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::ostream::~ostream();
  MEMORY[0x1DF0A6994](a10);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const std::locale::facet *v12;
  uint64_t v13;
  BOOL v14;
  size_t v15;
  size_t v16;
  std::locale::__imp *v17;
  uint64_t v18;
  uint64_t v19;
  void *locale;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  std::locale __b[3];

  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x1DF0A6910](v24, a1);
  if (LOBYTE(v24[0]))
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v12 = std::locale::use_facet(__b, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    else
    {
      v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    if (v14)
      v16 = 0;
    else
      v16 = v15;
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8)
          std::string::__throw_length_error[abi:ne180100]();
        if (v16 >= 0x17)
        {
          v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17)
            v18 = v16 | 7;
          v19 = v18 + 1;
          v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((_BYTE *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0)
          locale = __b;
        else
          locale = __b[0].__locale_;
        v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(_QWORD *)v7 + 96))(v7, locale, v16);
        v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16)
            goto LABEL_34;
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((_QWORD *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x1DF0A691C](v24);
  return a1;
}

void sub_1DAD270C0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x1DF0A691C](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1DAD27094);
}

void sub_1DAD27120(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1EA1F2020, MEMORY[0x1E0DE42D0]);
}

void sub_1DAD27174(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

uint64_t crc_16_calc(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  int v3;
  unsigned __int8 *v4;
  int v5;
  __int16 v6;
  __int16 v7;

  if (a2 < 8)
  {
    v3 = 0xFFFF;
    if (!(_WORD)a2)
      return (unsigned __int16)~(_WORD)v3;
  }
  else
  {
    v2 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    v3 = 0xFFFF;
    v4 = a1;
    do
    {
      v5 = *v4++;
      v3 = crc16_table[v5 ^ ((unsigned __int16)(v3 & 0xFF00) >> 8)] ^ (v3 << 8);
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v2;
    if (!(_WORD)a2)
      return (unsigned __int16)~(_WORD)v3;
  }
  v6 = *a1 << 8;
  do
  {
    LOWORD(a2) = a2 - 1;
    v7 = v6 ^ v3;
    v3 *= 2;
    if (v7 < 0)
      v3 ^= 0x1021u;
    v6 = (2 * v6) & 0xFE00;
  }
  while ((_WORD)a2);
  return (unsigned __int16)~(_WORD)v3;
}

uint64_t crc_16_l_calc(char *a1, unsigned int a2)
{
  unsigned int v2;
  int v3;
  char *v4;
  char v5;
  unsigned __int16 v6;
  char v7;

  if (a2 < 8)
  {
    LOWORD(v3) = -1;
    if (!(_WORD)a2)
      return (unsigned __int16)~(_WORD)v3;
  }
  else
  {
    v2 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    LOWORD(v3) = -1;
    v4 = a1;
    do
    {
      v5 = *v4++;
      v3 = crc_16_l_table[(v5 ^ v3)] ^ ((unsigned __int16)(v3 & 0xFF00) >> 8);
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v2;
    if (!(_WORD)a2)
      return (unsigned __int16)~(_WORD)v3;
  }
  v6 = *a1 << 8;
  do
  {
    LOWORD(a2) = a2 - 1;
    v7 = v6 ^ v3;
    LOWORD(v3) = (unsigned __int16)v3 >> 1;
    if ((v7 & 1) != 0)
      LOWORD(v3) = v3 ^ 0x8408;
    v6 >>= 1;
  }
  while ((_WORD)a2);
  return (unsigned __int16)~(_WORD)v3;
}

uint64_t crc_30_calc(char *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  char *v4;
  char v5;
  int v6;
  int v7;

  if (a2 < 8)
  {
    v3 = 0x3FFFFFFF;
    if (!(_WORD)a2)
      return ~v3 & 0x3FFFFFFF;
  }
  else
  {
    v2 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    v3 = 0x3FFFFFFF;
    v4 = a1;
    do
    {
      v5 = *v4++;
      v3 = crc30_table[(v5 ^ (v3 >> 22))] ^ (v3 << 8);
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v2;
    if (!(_WORD)a2)
      return ~v3 & 0x3FFFFFFF;
  }
  v6 = *a1 << 22;
  do
  {
    LOWORD(a2) = a2 - 1;
    v7 = v6 ^ v3;
    v3 *= 2;
    if ((v7 & 0x20000000) != 0)
      v3 ^= 0x6030B9C7u;
    v6 *= 2;
  }
  while ((_WORD)a2);
  return ~v3 & 0x3FFFFFFF;
}

uint64_t crc_30_step(int a1, char *a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v4;
  char *v5;
  char v6;
  int v7;
  int v8;

  v3 = ~a1 & 0x3FFFFFFF;
  if (a3 >= 8)
  {
    v4 = ((unsigned __int16)(a3 - 8) >> 3) + 1;
    v5 = a2;
    do
    {
      v6 = *v5++;
      v3 = crc30_table[(v6 ^ (v3 >> 22))] ^ (v3 << 8);
      LOWORD(a3) = a3 - 8;
    }
    while ((unsigned __int16)a3 > 7u);
    a2 += v4;
  }
  if ((_WORD)a3)
  {
    v7 = *a2 << 22;
    do
    {
      LOWORD(a3) = a3 - 1;
      v8 = v7 ^ v3;
      v3 *= 2;
      if ((v8 & 0x20000000) != 0)
        v3 ^= 0x6030B9C7u;
      v7 *= 2;
    }
    while ((_WORD)a3);
  }
  return ~v3 & 0x3FFFFFFF;
}

uint64_t crc_16_step(uint64_t result, unsigned __int8 *a2, int a3)
{
  __int16 v3;
  int v4;

  if (a3)
  {
    v3 = ~(_WORD)result;
    do
    {
      v4 = *a2++;
      v3 = crc16_table[v4 ^ ((unsigned __int16)(v3 & 0xFF00) >> 8)] ^ (v3 << 8);
      --a3;
    }
    while ((_WORD)a3);
    LOWORD(result) = ~v3;
  }
  return (unsigned __int16)result;
}

uint64_t crc_16_l_step(uint64_t result, char *a2, int a3)
{
  int v3;
  char v4;

  if (a3)
  {
    LOWORD(v3) = ~(_WORD)result;
    do
    {
      v4 = *a2++;
      v3 = crc_16_l_table[(v4 ^ v3)] ^ ((unsigned __int16)(v3 & 0xFF00) >> 8);
      --a3;
    }
    while (a3);
    LOWORD(result) = ~(_WORD)v3;
  }
  return (unsigned __int16)result;
}

uint64_t crc_32_calc(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  unsigned int v3;
  unsigned __int8 *v4;
  int v5;
  int v6;

  if (a2 >= 8)
  {
    v3 = ((unsigned __int16)(a2 - 8) >> 3) + 1;
    v4 = a1;
    do
    {
      v5 = *v4++;
      a3 = (crc32_table[v5 ^ BYTE3(a3)] ^ ((_DWORD)a3 << 8));
      LOWORD(a2) = a2 - 8;
    }
    while ((unsigned __int16)a2 > 7u);
    a1 += v3;
  }
  if ((_WORD)a2)
  {
    v6 = *a1 << 24;
    do
    {
      LOWORD(a2) = a2 - 1;
      if ((int)(v6 ^ a3) >= 0)
        a3 = (2 * a3);
      else
        a3 = (2 * (_DWORD)a3) ^ 0x4C11DB7u;
      v6 *= 2;
    }
    while ((_WORD)a2);
  }
  return a3;
}

uint64_t APPLIB_DIAG_GPS_SA_RF_VERIF_MODE_SWITCH(_DWORD *a1, int a2, int a3)
{
  uint64_t result;
  __int16 v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int __src;
  __int16 v14;
  _BYTE v15[2042];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x12)
    return result;
  bzero(a1, a2);
  *a1 = 6622539;
  *((_WORD *)a1 + 2) = 276;
  *((_BYTE *)a1 + 6) = a3;
  v7 = crc_16_l_table[a3 ^ 0x3B] ^ 0xFFB0;
  *((_BYTE *)a1 + 7) = crc_16_l_table[a3 ^ 0x3B] ^ 0xB0;
  v8 = HIBYTE(v7);
  *((_BYTE *)a1 + 8) = HIBYTE(v7);
  if (a2 < 18)
    return 0xFFFFFFFFLL;
  v9 = v7;
  bzero(v15, 0x7FAuLL);
  __src = 6622539;
  v14 = 276;
  if ((a3 - 125) <= 1)
  {
    v15[0] = 125;
    v10 = 7;
    v15[1] = a3 ^ 0x20;
    v11 = 8;
    if ((v9 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v10 = 6;
  v15[0] = a3;
  v11 = 7;
  if ((v9 - 125) <= 1)
  {
LABEL_9:
    *((_BYTE *)&__src + v11) = 125;
    LODWORD(v11) = v10 + 2;
    LOBYTE(v9) = v9 ^ 0x20;
  }
LABEL_10:
  *((_BYTE *)&__src + v11) = v9;
  v12 = v11 + 1;
  if ((v8 - 125) <= 1)
  {
    *((_BYTE *)&__src + v12) = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v12) = v11 + 2;
  }
  *((_BYTE *)&__src + v12) = v8;
  memcpy(a1, &__src, v12 + 1);
  result = (v12 + 2);
  *((_BYTE *)a1 + v12 + 1) = 126;
  return result;
}

uint64_t APPLIB_DIAG_GPS_GEN8_HW_CONFIG(char *a1, int a2, uint64_t a3)
{
  uint64_t result;
  char v7;
  uint64_t v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned int v14;
  unsigned int v15;
  unsigned __int16 v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE __src[2048];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x16)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 6622539;
    *((_WORD *)a1 + 2) = 12826;
    v7 = *(_BYTE *)(a3 + 4);
    *(_DWORD *)(a1 + 6) = *(_DWORD *)a3;
    a1[10] = v7;
    *(_WORD *)(a1 + 11) = 0;
    a1[13] = 0;
    v8 = a1[6];
    v9 = crc_16_l_table[v8 ^ 0x33];
    v10 = crc_16_l_table[a1[7] ^ 0xD6 ^ v9];
    v11 = crc_16_l_table[(a1[8] ^ v10 ^ HIBYTE(v9))];
    v12 = crc_16_l_table[(a1[9] ^ v11 ^ HIBYTE(v10))];
    v13 = crc_16_l_table[(a1[10] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[crc_16_l_table[(v14 ^ HIBYTE(v13))] ^ (v14 >> 8)];
    *((_WORD *)a1 + 7) = v16 ^ ~HIBYTE(crc_16_l_table[(v14 ^ HIBYTE(v13))]);
    if (a2 >= 32)
    {
      bzero(__src, 0x800uLL);
      v17 = *a1;
      if ((v17 - 125) > 1)
      {
        v18 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v17) = v17 ^ 0x20;
        v18 = 1;
      }
      __src[v18] = v17;
      v19 = v18 + 1;
      v20 = a1[1];
      if ((v20 - 125) <= 1)
      {
        __src[v19] = 125;
        LODWORD(v19) = v18 | 2;
        LOBYTE(v20) = v20 ^ 0x20;
      }
      v21 = &__src[v19];
      *v21 = v20;
      *(_DWORD *)(v21 + 1) = 840564837;
      v22 = v19 + 5;
      if ((v8 - 125) <= 1)
      {
        __src[v22] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        LODWORD(v22) = v19 + 6;
      }
      __src[v22] = v8;
      v23 = v22 + 1;
      v24 = a1[7];
      if ((v24 - 125) <= 1)
      {
        __src[v23] = 125;
        LODWORD(v23) = v22 + 2;
        LOBYTE(v24) = v24 ^ 0x20;
      }
      __src[v23] = v24;
      v25 = v23 + 1;
      v26 = a1[8];
      if ((v26 - 125) <= 1)
      {
        __src[v25] = 125;
        LODWORD(v25) = v23 + 2;
        LOBYTE(v26) = v26 ^ 0x20;
      }
      __src[v25] = v26;
      v27 = v25 + 1;
      v28 = a1[9];
      if ((v28 - 125) <= 1)
      {
        __src[v27] = 125;
        LOBYTE(v28) = v28 ^ 0x20;
        LODWORD(v27) = v25 + 2;
      }
      v29 = ~(v16 ^ BYTE1(v15));
      __src[v27] = v28;
      v30 = v27 + 1;
      v31 = a1[10];
      if ((v31 - 125) <= 1)
      {
        __src[v30] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v30) = v27 + 2;
      }
      v32 = ((unsigned __int16)(v16 ^ ~(unsigned __int16)(v15 >> 8)) >> 8);
      v33 = &__src[v30];
      *v33 = v31;
      *(_WORD *)(v33 + 1) = 0;
      v33[3] = 0;
      v34 = v30 + 4;
      if ((v29 - 125) <= 1)
      {
        __src[v34] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v34) = v30 + 5;
      }
      __src[v34] = v29;
      v35 = v34 + 1;
      if ((v32 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v32) = v32 ^ 0x20;
        LODWORD(v35) = v34 + 2;
      }
      __src[v35] = v32;
      memcpy(a1, __src, v35 + 1);
      result = (v35 + 2);
      a1[v35 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_FTM_GNSS_EXTERNAL_LNA(unsigned __int8 *a1, int a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int __src;
  char v26;
  _BYTE v27[2043];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x11)
    return result;
  bzero(a1, a2);
  *(_DWORD *)a1 = 2231115;
  a1[4] = -3;
  a1[6] = a3;
  v7 = a1[5];
  v8 = crc_16_l_table[crc_16_l_table[v7 ^ 0xBA] ^ a3 ^ 0xEC];
  v9 = crc_16_l_table[(a1[7] ^ v8 ^ HIBYTE(crc_16_l_table[v7 ^ 0xBA]))];
  v10 = crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))];
  v11 = crc_16_l_table[(a1[9] ^ v10 ^ HIBYTE(v9))];
  v12 = v11 ^ ~(v10 >> 8);
  *((_WORD *)a1 + 5) = v11 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))]);
  if (a2 < 24)
    return 0xFFFFFFFFLL;
  bzero(v27, 0x7FBuLL);
  __src = 2231115;
  v26 = -3;
  if ((v7 - 125) <= 1)
  {
    v27[0] = 125;
    v13 = 6;
    v27[1] = v7 ^ 0x20;
    v14 = 7;
    if ((a3 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v13 = 5;
  v27[0] = v7;
  v14 = 6;
  if ((a3 - 125) <= 1)
  {
LABEL_9:
    *((_BYTE *)&__src + v14) = 125;
    LOBYTE(a3) = a3 ^ 0x20;
    LODWORD(v14) = v13 + 2;
  }
LABEL_10:
  *((_BYTE *)&__src + v14) = a3;
  v15 = v14 + 1;
  v16 = a1[7];
  if ((v16 - 125) <= 1)
  {
    *((_BYTE *)&__src + v15) = 125;
    LODWORD(v15) = v14 + 2;
    LOBYTE(v16) = v16 ^ 0x20;
  }
  *((_BYTE *)&__src + v15) = v16;
  v17 = v15 + 1;
  v18 = a1[8];
  if ((v18 - 125) <= 1)
  {
    *((_BYTE *)&__src + v17) = 125;
    LOBYTE(v18) = v18 ^ 0x20;
    LODWORD(v17) = v15 + 2;
  }
  v19 = ~(v11 ^ BYTE1(v10));
  *((_BYTE *)&__src + v17) = v18;
  v20 = v17 + 1;
  v21 = a1[9];
  if ((v21 - 125) <= 1)
  {
    *((_BYTE *)&__src + v20) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v20) = v17 + 2;
  }
  v22 = (unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8;
  *((_BYTE *)&__src + v20) = v21;
  v23 = v20 + 1;
  if ((v19 - 125) <= 1)
  {
    *((_BYTE *)&__src + v23) = 125;
    LOBYTE(v19) = v19 ^ 0x20;
    LODWORD(v23) = v20 + 2;
  }
  *((_BYTE *)&__src + v23) = v19;
  v24 = v23 + 1;
  if (BYTE1(v12) - 125 <= 1)
  {
    *((_BYTE *)&__src + v24) = 125;
    v22 = BYTE1(v12) ^ 0x20;
    LODWORD(v24) = v23 + 2;
  }
  *((_BYTE *)&__src + v24) = v22;
  memcpy(a1, &__src, v24 + 1);
  result = (v24 + 2);
  a1[v24 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_GPS_GEN8_StartIQTest(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  unsigned __int16 v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned int v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned int v16;
  uint64_t v17;
  size_t v18;
  int v19;
  int v20;
  _BYTE __src[2048];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 16)
  {
    bzero(a1, a2);
    *(_OWORD *)a1 = xmmword_1DAD378F0;
    *((_WORD *)a1 + 8) = 2560;
    v5 = crc_16_l_table[a1[7] ^ 0x6DLL];
    v6 = crc_16_l_table[a1[8] ^ 0xA6 ^ v5];
    v7 = crc_16_l_table[(a1[9] ^ v6 ^ HIBYTE(v5))];
    v8 = crc_16_l_table[(a1[10] ^ v7 ^ HIBYTE(v6))];
    v9 = crc_16_l_table[(a1[11] ^ v8 ^ HIBYTE(v7))];
    v10 = crc_16_l_table[(a1[12] ^ v9 ^ HIBYTE(v8))];
    v11 = crc_16_l_table[(a1[13] ^ v10 ^ HIBYTE(v9))];
    v12 = crc_16_l_table[(a1[14] ^ v11 ^ HIBYTE(v10))];
    v13 = crc_16_l_table[(a1[15] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(v13 ^ HIBYTE(v12))];
    LOWORD(v13) = crc_16_l_table[v14 ^ (v13 >> 8) ^ 0xA];
    v15 = crc_16_l_table[(a1[18] ^ v13 ^ HIBYTE(v14))];
    LOWORD(v13) = crc_16_l_table[(a1[19] ^ v15 ^ BYTE1(v13))];
    v16 = crc_16_l_table[(a1[20] ^ v13 ^ HIBYTE(v15))];
    *((_WORD *)a1 + 11) = crc_16_l_table[(a1[21] ^ v16 ^ BYTE1(v13))] ^ ~(unsigned __int16)(v16 >> 8);
    if (a2 >= 0x30)
    {
      bzero(__src, 0x800uLL);
      v17 = 0;
      LODWORD(v18) = 0;
      do
      {
        while (1)
        {
          v20 = a1[v17];
          if ((v20 - 125) > 1)
            break;
          v19 = v18 + 1;
          __src[(int)v18] = 125;
          __src[(int)v18 + 1] = v20 ^ 0x20;
          v18 = (int)v18 + 1 + 1;
          if (++v17 == 24)
            goto LABEL_9;
        }
        v19 = v18;
        __src[(int)v18] = v20;
        v18 = (int)v18 + 1;
        ++v17;
      }
      while (v17 != 24);
LABEL_9:
      memcpy(a1, __src, v18);
      result = (v19 + 2);
      a1[v18] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GPS_GEN8_SV_TRACK(char *a1, int a2, _DWORD *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned int v11;
  unsigned __int16 v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int __src;
  __int16 v31;
  char v32[2042];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x12)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 6622539;
    *((_WORD *)a1 + 2) = 12827;
    v7 = *(_DWORD *)((char *)a3 + 3);
    *(_DWORD *)(a1 + 6) = *a3;
    *(_DWORD *)(a1 + 9) = v7;
    v8 = a1[6];
    LOWORD(v7) = crc_16_l_table[v8 ^ 0xEB];
    v9 = crc_16_l_table[(a1[7] ^ v7) ^ 0xCF];
    LOWORD(v7) = crc_16_l_table[(a1[8] ^ v9 ^ BYTE1(v7))];
    v10 = crc_16_l_table[(a1[9] ^ v7 ^ HIBYTE(v9))];
    LOWORD(v7) = crc_16_l_table[(a1[10] ^ v10 ^ BYTE1(v7))];
    v11 = crc_16_l_table[(a1[11] ^ v7 ^ HIBYTE(v10))];
    v12 = crc_16_l_table[(a1[12] ^ v11 ^ BYTE1(v7))];
    *(_WORD *)(a1 + 13) = v12 ^ ~HIBYTE(crc_16_l_table[(a1[11] ^ v7 ^ HIBYTE(v10))]);
    if (a2 >= 30)
    {
      bzero(v32, 0x7FAuLL);
      __src = 6622539;
      v31 = 12827;
      if ((v8 - 125) > 1)
      {
        v13 = 6;
      }
      else
      {
        v32[0] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        v13 = 7;
      }
      *((_BYTE *)&__src + v13) = v8;
      v14 = v13 + 1;
      v15 = a1[7];
      if ((v15 - 125) <= 1)
      {
        *((_BYTE *)&__src + v14) = 125;
        LODWORD(v14) = v13 + 2;
        LOBYTE(v15) = v15 ^ 0x20;
      }
      *((_BYTE *)&__src + v14) = v15;
      v16 = v14 + 1;
      v17 = a1[8];
      if ((v17 - 125) <= 1)
      {
        *((_BYTE *)&__src + v16) = 125;
        LOBYTE(v17) = v17 ^ 0x20;
        LODWORD(v16) = v14 + 2;
      }
      *((_BYTE *)&__src + v16) = v17;
      v18 = v16 + 1;
      v19 = a1[9];
      if ((v19 - 125) <= 1)
      {
        *((_BYTE *)&__src + v18) = 125;
        LODWORD(v18) = v16 + 2;
        LOBYTE(v19) = v19 ^ 0x20;
      }
      *((_BYTE *)&__src + v18) = v19;
      v20 = v18 + 1;
      v21 = a1[10];
      if ((v21 - 125) <= 1)
      {
        *((_BYTE *)&__src + v20) = 125;
        LODWORD(v20) = v18 + 2;
        LOBYTE(v21) = v21 ^ 0x20;
      }
      *((_BYTE *)&__src + v20) = v21;
      v22 = v20 + 1;
      v23 = a1[11];
      if ((v23 - 125) <= 1)
      {
        *((_BYTE *)&__src + v22) = 125;
        LOBYTE(v23) = v23 ^ 0x20;
        LODWORD(v22) = v20 + 2;
      }
      v24 = ~(v12 ^ BYTE1(v11));
      *((_BYTE *)&__src + v22) = v23;
      v25 = v22 + 1;
      v26 = a1[12];
      if ((v26 - 125) <= 1)
      {
        *((_BYTE *)&__src + v25) = 125;
        LOBYTE(v26) = v26 ^ 0x20;
        LODWORD(v25) = v22 + 2;
      }
      v27 = ((unsigned __int16)(v12 ^ ~(unsigned __int16)(v11 >> 8)) >> 8);
      *((_BYTE *)&__src + v25) = v26;
      v28 = v25 + 1;
      if ((v24 - 125) <= 1)
      {
        *((_BYTE *)&__src + v28) = 125;
        LOBYTE(v24) = v24 ^ 0x20;
        LODWORD(v28) = v25 + 2;
      }
      *((_BYTE *)&__src + v28) = v24;
      v29 = v28 + 1;
      if ((v27 - 125) <= 1)
      {
        *((_BYTE *)&__src + v29) = 125;
        LOBYTE(v27) = v27 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      *((_BYTE *)&__src + v29) = v27;
      memcpy(a1, &__src, v29 + 1);
      result = (v29 + 2);
      a1[v29 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_MemoryPoke_Byte(char *a1, int a2, int a3, void *__src, int a5)
{
  uint64_t result;
  int v9;
  int v10;
  char *v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  int v16;
  unsigned __int8 *v17;
  char v18;
  int v19;
  _BYTE __srca[2048];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a5 && a3 && a1 && a2 >= 0xD && __src)
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 5) = 0;
    *a1 = 5;
    *(_DWORD *)(a1 + 1) = a3;
    a1[5] = a5;
    memcpy(a1 + 6, __src, a5);
    v9 = 8 * (a5 + 6);
    if (8 * ((_WORD)a5 + 6))
    {
      LOWORD(v10) = -1;
      v11 = a1;
      do
      {
        v12 = *v11++;
        v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
        v9 -= 8;
      }
      while ((_WORD)v9);
      v13 = ~(_BYTE)v10;
      v14 = (unsigned __int16)~(_WORD)v10 >> 8;
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    a1[a5 + 6] = v13;
    a1[a5 + 7] = v14;
    v15 = (a5 + 8);
    result = 0xFFFFFFFFLL;
    if ((int)v15 <= 1024 && 2 * (int)v15 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if ((int)v15 < 1)
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        v17 = (unsigned __int8 *)a1;
        do
        {
          v19 = *v17++;
          v18 = v19;
          if ((v19 - 125) <= 1)
          {
            __srca[v16] = 125;
            v18 ^= 0x20u;
            ++v16;
          }
          __srca[v16++] = v18;
          --v15;
        }
        while (v15);
      }
      memcpy(a1, __srca, v16);
      result = (v16 + 1);
      a1[v16] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_MemoryPoke_Word(char *a1, int a2, int a3, void *__src, int a5)
{
  uint64_t result;
  int v8;
  int v9;
  int v10;
  char *v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  int v16;
  unsigned __int8 *v17;
  char v18;
  int v19;
  _BYTE __srca[2048];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a5 && a3 && a1 && a2 >= 0xD && __src)
  {
    *(_QWORD *)a1 = 0;
    *a1 = 6;
    *(_DWORD *)(a1 + 1) = a3;
    v8 = 2 * a5;
    *(_QWORD *)(a1 + 5) = 0;
    a1[5] = a5;
    memcpy(a1 + 6, __src, 2 * a5);
    v9 = 8 * (v8 + 6);
    if ((v9 & 0xFFF0) != 0)
    {
      LOWORD(v10) = -1;
      v11 = a1;
      do
      {
        v12 = *v11++;
        v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
        v9 -= 8;
      }
      while ((_WORD)v9);
      v13 = ~(_BYTE)v10;
      v14 = (unsigned __int16)~(_WORD)v10 >> 8;
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    a1[v8 + 6] = v13;
    a1[v8 + 7] = v14;
    v15 = (v8 + 8);
    result = 0xFFFFFFFFLL;
    if ((int)v15 <= 1024 && 2 * (int)v15 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if ((int)v15 < 1)
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        v17 = (unsigned __int8 *)a1;
        do
        {
          v19 = *v17++;
          v18 = v19;
          if ((v19 - 125) <= 1)
          {
            __srca[v16] = 125;
            v18 ^= 0x20u;
            ++v16;
          }
          __srca[v16++] = v18;
          --v15;
        }
        while (v15);
      }
      memcpy(a1, __srca, v16);
      result = (v16 + 1);
      a1[v16] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_MemoryPoke_DWord(char *a1, int a2, int a3, void *__src, int a5)
{
  uint64_t result;
  int v8;
  int v9;
  int v10;
  char *v11;
  char v12;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;
  char v16;
  int v17;
  _BYTE __srca[2048];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a5)
  {
    if (a3)
    {
      if (a1)
      {
        if (a2 >= 0xD)
        {
          if (__src)
          {
            *(_QWORD *)a1 = 0;
            *a1 = 7;
            *(_DWORD *)(a1 + 1) = a3;
            v8 = 4 * a5;
            *(_QWORD *)(a1 + 5) = 0;
            a1[5] = a5;
            memcpy(a1 + 6, __src, 4 * a5);
            v9 = 8 * (v8 + 6);
            LOWORD(v10) = -1;
            v11 = a1;
            do
            {
              v12 = *v11++;
              v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
              v9 -= 8;
            }
            while ((_WORD)v9);
            a1[v8 + 6] = ~(_BYTE)v10;
            a1[v8 + 7] = (unsigned __int16)~(_WORD)v10 >> 8;
            v13 = (v8 + 8);
            result = 0xFFFFFFFFLL;
            if ((int)v13 <= 1024 && 2 * (int)v13 <= a2)
            {
              bzero(__srca, 0x800uLL);
              if ((int)v13 < 1)
              {
                v14 = 0;
              }
              else
              {
                v14 = 0;
                v15 = (unsigned __int8 *)a1;
                do
                {
                  v17 = *v15++;
                  v16 = v17;
                  if ((v17 - 125) <= 1)
                  {
                    __srca[v14] = 125;
                    v16 ^= 0x20u;
                    ++v14;
                  }
                  __srca[v14++] = v16;
                  --v13;
                }
                while (v13);
              }
              memcpy(a1, __srca, v14);
              result = (v14 + 1);
              a1[v14] = 126;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GPS_SessionControl(char *a1, int a2, char a3, void *__src, int a5)
{
  uint64_t result;
  uint64_t v9;
  int v10;
  int v11;
  char *v12;
  char v13;
  uint64_t v14;
  int v15;
  unsigned __int8 *v16;
  char v17;
  int v18;
  _BYTE __srca[2048];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 39 && __src && a5)
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 5) = 0;
    *a1 = 108;
    a1[1] = a3;
    *((_WORD *)a1 + 1) = a5;
    memcpy(a1 + 4, __src, a5);
    v9 = a5 + 4;
    v10 = 8 * (a5 + 4);
    if (8 * ((_WORD)a5 + 4))
    {
      LOWORD(v11) = -1;
      v12 = a1;
      do
      {
        v13 = *v12++;
        v11 = crc_16_l_table[(v13 ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
        v10 -= 8;
      }
      while ((_WORD)v10);
      a1[v9] = ~(_BYTE)v11;
      a1[a5 + 5] = (unsigned __int16)~(_WORD)v11 >> 8;
      result = 0xFFFFFFFFLL;
      if (a5 > 1018)
        return result;
    }
    else
    {
      a1[v9] = 0;
      a1[a5 + 5] = 0;
      result = 0xFFFFFFFFLL;
      if (a5 > 1018)
        return result;
    }
    v14 = (a5 + 6);
    if (2 * (int)v14 <= a2)
    {
      bzero(__srca, 0x800uLL);
      if (a5 < -5)
      {
        v15 = 0;
      }
      else
      {
        v15 = 0;
        v16 = (unsigned __int8 *)a1;
        do
        {
          v18 = *v16++;
          v17 = v18;
          if ((v18 - 125) <= 1)
          {
            __srca[v15] = 125;
            v17 ^= 0x20u;
            ++v15;
          }
          __srca[v15++] = v17;
          --v14;
        }
        while (v14);
      }
      memcpy(a1, __srca, v15);
      result = (v15 + 1);
      a1[v15] = 126;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_CreateFile(char *a1, int a2, const void *a3, int a4)
{
  uint64_t result;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned int v39;
  uint64_t v40;
  size_t v41;
  int v42;
  int v43;
  _BYTE __src[2048];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 7 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 523851;
    memcpy(a1 + 4, a3, a4);
    v9 = crc_16_l_table[a1[4] ^ 0xA4];
    v10 = crc_16_l_table[(a1[5] ^ v9) ^ 4];
    v11 = crc_16_l_table[(a1[6] ^ v10 ^ HIBYTE(v9))];
    v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v10))];
    v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(a1[10] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[11] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a1[12] ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a1[13] ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a1[14] ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(a1[15] ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a1[16] ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[20] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a1[21] ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a1[22] ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a1[23] ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a1[24] ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a1[25] ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a1[26] ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(a1[27] ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a1[28] ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(a1[29] ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(a1[30] ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(a1[31] ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a1[32] ^ v36 ^ HIBYTE(v35))];
    v38 = crc_16_l_table[(a1[33] ^ v37 ^ HIBYTE(v36))];
    v39 = crc_16_l_table[(a1[34] ^ v38 ^ HIBYTE(v37))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(a1[35] ^ v39 ^ HIBYTE(v38))] ^ ~(unsigned __int16)(v39 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      v40 = 0;
      LODWORD(v41) = 0;
      do
      {
        while (1)
        {
          v43 = a1[v40];
          if ((v43 - 125) > 1)
            break;
          v42 = v41 + 1;
          __src[(int)v41] = 125;
          __src[(int)v41 + 1] = v43 ^ 0x20;
          v41 = (int)v41 + 1 + 1;
          if (++v40 == 38)
            goto LABEL_10;
        }
        v42 = v41;
        __src[(int)v41] = v43;
        v41 = (int)v41 + 1;
        ++v40;
      }
      while (v40 != 38);
LABEL_10:
      memcpy(a1, __src, v41);
      result = (v42 + 2);
      a1[v41] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetFileInfo(char *a1, int a2, const void *a3, int a4)
{
  uint64_t result;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned int v39;
  uint64_t v40;
  size_t v41;
  int v42;
  int v43;
  _BYTE __src[2048];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 7 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 785995;
    memcpy(a1 + 4, a3, a4);
    v9 = crc_16_l_table[a1[4] ^ 4];
    v10 = crc_16_l_table[a1[5] ^ 0xAD ^ v9];
    v11 = crc_16_l_table[(a1[6] ^ v10 ^ HIBYTE(v9))];
    v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v10))];
    v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(a1[10] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[11] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a1[12] ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a1[13] ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a1[14] ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(a1[15] ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a1[16] ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[20] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a1[21] ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a1[22] ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a1[23] ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a1[24] ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a1[25] ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a1[26] ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(a1[27] ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a1[28] ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(a1[29] ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(a1[30] ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(a1[31] ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a1[32] ^ v36 ^ HIBYTE(v35))];
    v38 = crc_16_l_table[(a1[33] ^ v37 ^ HIBYTE(v36))];
    v39 = crc_16_l_table[(a1[34] ^ v38 ^ HIBYTE(v37))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(a1[35] ^ v39 ^ HIBYTE(v38))] ^ ~(unsigned __int16)(v39 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      v40 = 0;
      LODWORD(v41) = 0;
      do
      {
        while (1)
        {
          v43 = a1[v40];
          if ((v43 - 125) > 1)
            break;
          v42 = v41 + 1;
          __src[(int)v41] = 125;
          __src[(int)v41 + 1] = v43 ^ 0x20;
          v41 = (int)v41 + 1 + 1;
          if (++v40 == 38)
            goto LABEL_10;
        }
        v42 = v41;
        __src[(int)v41] = v43;
        v41 = (int)v41 + 1;
        ++v40;
      }
      while (v40 != 38);
LABEL_10:
      memcpy(a1, __src, v41);
      result = (v42 + 2);
      a1[v41] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_DeleteFile(char *a1, int a2, const void *a3, int a4)
{
  uint64_t result;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned int v39;
  uint64_t v40;
  size_t v41;
  int v42;
  int v43;
  _BYTE __src[2048];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 7 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 589387;
    memcpy(a1 + 4, a3, a4);
    v9 = crc_16_l_table[a1[4] ^ 0x6CLL];
    v10 = crc_16_l_table[(a1[5] ^ v9) ^ 0x87];
    v11 = crc_16_l_table[(a1[6] ^ v10 ^ HIBYTE(v9))];
    v12 = crc_16_l_table[(a1[7] ^ v11 ^ HIBYTE(v10))];
    v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(a1[10] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[11] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a1[12] ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a1[13] ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a1[14] ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(a1[15] ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a1[16] ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[20] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a1[21] ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a1[22] ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a1[23] ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a1[24] ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a1[25] ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a1[26] ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(a1[27] ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a1[28] ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(a1[29] ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(a1[30] ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(a1[31] ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a1[32] ^ v36 ^ HIBYTE(v35))];
    v38 = crc_16_l_table[(a1[33] ^ v37 ^ HIBYTE(v36))];
    v39 = crc_16_l_table[(a1[34] ^ v38 ^ HIBYTE(v37))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(a1[35] ^ v39 ^ HIBYTE(v38))] ^ ~(unsigned __int16)(v39 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      v40 = 0;
      LODWORD(v41) = 0;
      do
      {
        while (1)
        {
          v43 = a1[v40];
          if ((v43 - 125) > 1)
            break;
          v42 = v41 + 1;
          __src[(int)v41] = 125;
          __src[(int)v41 + 1] = v43 ^ 0x20;
          v41 = (int)v41 + 1 + 1;
          if (++v40 == 38)
            goto LABEL_10;
        }
        v42 = v41;
        __src[(int)v41] = v43;
        v41 = (int)v41 + 1;
        ++v40;
      }
      while (v40 != 38);
LABEL_10:
      memcpy(a1, __src, v41);
      result = (v42 + 2);
      a1[v41] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_WriteFile(char *a1, int a2, const void *a3, int a4, int a5, _OWORD *a6)
{
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  int v20;
  char *v21;
  char v22;
  uint64_t v23;
  size_t v24;
  int v25;
  int v26;
  _BYTE __src[2048];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 135 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 720459;
    *((_DWORD *)a1 + 1) = a5;
    memcpy(a1 + 8, a3, a4);
    v13 = a6[2];
    v14 = a6[3];
    v15 = a6[1];
    *(_OWORD *)(a1 + 40) = *a6;
    *(_OWORD *)(a1 + 88) = v14;
    *(_OWORD *)(a1 + 72) = v13;
    *(_OWORD *)(a1 + 56) = v15;
    v16 = a6[6];
    v17 = a6[7];
    v18 = a6[5];
    *(_OWORD *)(a1 + 104) = a6[4];
    *(_OWORD *)(a1 + 152) = v17;
    *(_OWORD *)(a1 + 136) = v16;
    *(_OWORD *)(a1 + 120) = v18;
    v19 = 1344;
    LOWORD(v20) = -1;
    v21 = a1;
    do
    {
      v22 = *v21++;
      v20 = crc_16_l_table[(v22 ^ v20)] ^ ((unsigned __int16)(v20 & 0xFF00) >> 8);
      v19 -= 8;
    }
    while ((_WORD)v19);
    *((_WORD *)a1 + 84) = ~(_WORD)v20;
    if (a2 >= 340)
    {
      bzero(__src, 0x800uLL);
      v23 = 0;
      LODWORD(v24) = 0;
      do
      {
        while (1)
        {
          v26 = a1[v23];
          if ((v26 - 125) > 1)
            break;
          v25 = v24 + 1;
          __src[(int)v24] = 125;
          __src[(int)v24 + 1] = v26 ^ 0x20;
          v24 = (int)v24 + 1 + 1;
          if (++v23 == 170)
            goto LABEL_12;
        }
        v25 = v24;
        __src[(int)v24] = v26;
        v24 = (int)v24 + 1;
        ++v23;
      }
      while (v23 != 170);
LABEL_12:
      memcpy(a1, __src, v24);
      result = (v25 + 2);
      a1[v24] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadFile(char *a1, int a2, const void *a3, int a4, int a5)
{
  uint64_t result;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  unsigned __int16 v40;
  unsigned __int16 v41;
  unsigned __int16 v42;
  unsigned __int16 v43;
  unsigned __int16 v44;
  unsigned int v45;
  uint64_t v46;
  size_t v47;
  int v48;
  int v49;
  _BYTE __src[2048];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a4 <= 32 && a4 + 135 <= a2)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 654923;
    *((_DWORD *)a1 + 1) = a5;
    memcpy(a1 + 8, a3, a4);
    v11 = crc_16_l_table[a5 ^ 0xB4];
    v12 = crc_16_l_table[(v11 ^ BYTE1(a5)) ^ 0x9E];
    v13 = crc_16_l_table[(v12 ^ HIBYTE(v11) ^ BYTE2(a5))];
    v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a1[10] ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a1[11] ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a1[12] ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(a1[13] ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a1[14] ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(a1[15] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a1[16] ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[17] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a1[19] ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a1[20] ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a1[21] ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a1[22] ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a1[23] ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a1[24] ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(a1[25] ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a1[26] ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(a1[27] ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(a1[28] ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(a1[29] ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a1[30] ^ v36 ^ HIBYTE(v35))];
    v38 = crc_16_l_table[(a1[31] ^ v37 ^ HIBYTE(v36))];
    v39 = crc_16_l_table[(a1[32] ^ v38 ^ HIBYTE(v37))];
    v40 = crc_16_l_table[(a1[33] ^ v39 ^ HIBYTE(v38))];
    v41 = crc_16_l_table[(a1[34] ^ v40 ^ HIBYTE(v39))];
    v42 = crc_16_l_table[(a1[35] ^ v41 ^ HIBYTE(v40))];
    v43 = crc_16_l_table[(a1[36] ^ v42 ^ HIBYTE(v41))];
    v44 = crc_16_l_table[(a1[37] ^ v43 ^ HIBYTE(v42))];
    v45 = crc_16_l_table[(a1[38] ^ v44 ^ HIBYTE(v43))];
    *((_WORD *)a1 + 20) = crc_16_l_table[(a1[39] ^ v45 ^ HIBYTE(v44))] ^ ~(unsigned __int16)(v45 >> 8);
    if (a2 >= 84)
    {
      bzero(__src, 0x800uLL);
      v46 = 0;
      LODWORD(v47) = 0;
      do
      {
        while (1)
        {
          v49 = a1[v46];
          if ((v49 - 125) > 1)
            break;
          v48 = v47 + 1;
          __src[(int)v47] = 125;
          __src[(int)v47 + 1] = v49 ^ 0x20;
          v47 = (int)v47 + 1 + 1;
          if (++v46 == 42)
            goto LABEL_10;
        }
        v48 = v47;
        __src[(int)v47] = v49;
        v47 = (int)v47 + 1;
        ++v46;
      }
      while (v46 != 42);
LABEL_10:
      memcpy(a1, __src, v47);
      result = (v48 + 2);
      a1[v47] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_ReadICCID_EFS_File(_QWORD *a1, int a2)
{
  size_t v3;
  unsigned __int16 v4;
  unsigned __int16 v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t result;
  _BYTE __src[2048];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a2 < 512)
    return 0xFFFFFFFFLL;
  v3 = a2;
  bzero(a1, a2);
  if (!a1)
    return 0xFFFFFFFFLL;
  bzero(a1, v3);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)"sim.txt";
  *a1 = 654923;
  *(_OWORD *)(a1 + 3) = *(_OWORD *)&algn_1DAD37908[8];
  v4 = crc_16_l_table[*((_BYTE *)a1 + 8) ^ 0x6A ^ LOBYTE(crc_16_l_table[110])];
  v5 = crc_16_l_table[(*((_BYTE *)a1 + 9) ^ v4 ^ HIBYTE(crc_16_l_table[110]))];
  v6 = crc_16_l_table[(*((_BYTE *)a1 + 10) ^ v5 ^ HIBYTE(v4))];
  v7 = crc_16_l_table[(*((_BYTE *)a1 + 11) ^ v6 ^ HIBYTE(v5))];
  v8 = crc_16_l_table[(*((_BYTE *)a1 + 12) ^ v7 ^ HIBYTE(v6))];
  v9 = crc_16_l_table[(*((_BYTE *)a1 + 13) ^ v8 ^ HIBYTE(v7))];
  v10 = crc_16_l_table[(*((_BYTE *)a1 + 14) ^ v9 ^ HIBYTE(v8))];
  v11 = crc_16_l_table[(*((_BYTE *)a1 + 15) ^ v10 ^ HIBYTE(v9))];
  v12 = crc_16_l_table[(*((_BYTE *)a1 + 16) ^ v11 ^ HIBYTE(v10))];
  v13 = crc_16_l_table[(*((_BYTE *)a1 + 17) ^ v12 ^ HIBYTE(v11))];
  v14 = crc_16_l_table[(*((_BYTE *)a1 + 18) ^ v13 ^ HIBYTE(v12))];
  v15 = crc_16_l_table[(*((_BYTE *)a1 + 19) ^ v14 ^ HIBYTE(v13))];
  v16 = crc_16_l_table[(*((_BYTE *)a1 + 20) ^ v15 ^ HIBYTE(v14))];
  v17 = crc_16_l_table[(*((_BYTE *)a1 + 21) ^ v16 ^ HIBYTE(v15))];
  v18 = crc_16_l_table[(*((_BYTE *)a1 + 22) ^ v17 ^ HIBYTE(v16))];
  v19 = crc_16_l_table[(*((_BYTE *)a1 + 23) ^ v18 ^ HIBYTE(v17))];
  v20 = crc_16_l_table[(*((_BYTE *)a1 + 24) ^ v19 ^ HIBYTE(v18))];
  v21 = crc_16_l_table[(*((_BYTE *)a1 + 25) ^ v20 ^ HIBYTE(v19))];
  v22 = crc_16_l_table[(*((_BYTE *)a1 + 26) ^ v21 ^ HIBYTE(v20))];
  v23 = crc_16_l_table[(*((_BYTE *)a1 + 27) ^ v22 ^ HIBYTE(v21))];
  v24 = crc_16_l_table[(*((_BYTE *)a1 + 28) ^ v23 ^ HIBYTE(v22))];
  v25 = crc_16_l_table[(*((_BYTE *)a1 + 29) ^ v24 ^ HIBYTE(v23))];
  v26 = crc_16_l_table[(*((_BYTE *)a1 + 30) ^ v25 ^ HIBYTE(v24))];
  v27 = crc_16_l_table[(*((_BYTE *)a1 + 31) ^ v26 ^ HIBYTE(v25))];
  v28 = crc_16_l_table[(*((_BYTE *)a1 + 32) ^ v27 ^ HIBYTE(v26))];
  v29 = crc_16_l_table[(*((_BYTE *)a1 + 33) ^ v28 ^ HIBYTE(v27))];
  v30 = crc_16_l_table[(*((_BYTE *)a1 + 34) ^ v29 ^ HIBYTE(v28))];
  v31 = crc_16_l_table[(*((_BYTE *)a1 + 35) ^ v30 ^ HIBYTE(v29))];
  v32 = crc_16_l_table[(*((_BYTE *)a1 + 36) ^ v31 ^ HIBYTE(v30))];
  v33 = crc_16_l_table[(*((_BYTE *)a1 + 37) ^ v32 ^ HIBYTE(v31))];
  v34 = crc_16_l_table[(*((_BYTE *)a1 + 38) ^ v33 ^ HIBYTE(v32))];
  *((_WORD *)a1 + 20) = crc_16_l_table[(*((_BYTE *)a1 + 39) ^ v34 ^ HIBYTE(v33))] ^ ~(unsigned __int16)(v34 >> 8);
  bzero(__src, 0x800uLL);
  v35 = 0;
  LODWORD(v3) = 0;
  do
  {
    while (1)
    {
      v37 = *((unsigned __int8 *)a1 + v35);
      if ((v37 - 125) > 1)
        break;
      v36 = v3 + 1;
      __src[(int)v3] = 125;
      __src[(int)v3 + 1] = v37 ^ 0x20;
      v3 = (int)v3 + 1 + 1;
      if (++v35 == 42)
        goto LABEL_7;
    }
    v36 = v3;
    __src[(int)v3] = v37;
    v3 = (int)v3 + 1;
    ++v35;
  }
  while (v35 != 42);
LABEL_7:
  memcpy(a1, __src, v3);
  result = (v36 + 2);
  *((_BYTE *)a1 + v3) = 126;
  return result;
}

uint64_t ETLDMCViewLoadMessagesFromMaskArray(uint64_t a1, uint64_t a2, unsigned int a3)
{
  size_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  _WORD *v15;
  unsigned __int16 v16;
  unsigned int v17;
  void *v18;
  _BOOL8 v19;

  *(_DWORD *)a1 = a3;
  if (!a3)
    return 1;
  v6 = 16 * a3;
  v7 = malloc(v6);
  *(_QWORD *)(a1 + 8) = v7;
  if (!v7)
    return 0;
  v8 = v7;
  bzero(v7, v6);
  v9 = 0;
  v10 = 0;
  v11 = a3;
  do
  {
    v12 = v10 + 1;
    do
    {
      v13 = v12;
      v14 = *(_DWORD *)(a2 + 4 * v10++);
      ++v12;
    }
    while (!v14);
    v15 = &v8[2 * v9];
    v16 = v10 - 1;
    *v15 = v10 - 1;
    do
    {
      v10 = v13;
      if (v13 >> 12 > 0xC)
        break;
      ++v13;
    }
    while (*(_DWORD *)(a2 + 4 * v10));
    v15[1] = v10 - 1;
    v17 = v16;
    v18 = malloc(4 * ((unsigned __int16)(v10 - 1) - v16 + 1));
    v8[2 * v9 + 1] = v18;
    v19 = v18 != 0;
    if (!v18)
      break;
    memcpy(v18, (const void *)(a2 + 4 * v17), 4 * ((unsigned __int16)(v10 - 1) - v17 + 1));
    ++v9;
  }
  while (v9 != v11);
  return v19;
}

uint64_t ETLDMCViewCopyMasksToMaskArray(unsigned int *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned __int16 *v5;
  uint64_t v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  int8x16_t *v14;
  uint64_t v15;
  uint64_t v16;
  int8x16_t *v17;
  int8x16_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  int v22;

  v2 = *a1;
  if ((_DWORD)v2)
  {
    v3 = 0;
    v4 = *((_QWORD *)a1 + 1);
    do
    {
      v5 = (unsigned __int16 *)(v4 + 16 * v3);
      v6 = *v5;
      v7 = v5[1] - v6 + 1;
      v8 = v5[1] - v6 + 1;
      if (v5[1] - (_DWORD)v6 == -1)
        goto LABEL_4;
      v9 = *((_QWORD *)v5 + 1);
      if (v8 >= 0xC)
      {
        v10 = 0;
        if (__CFADD__((_DWORD)v6, v8 - 1) || (v8 - 1) >> 32)
          goto LABEL_19;
        v11 = a2 + 4 * v6;
        if (v9 >= v11 + 4 * v8 || v11 >= v9 + 4 * v8)
        {
          v13 = v7 & 7;
          v10 = v8 - v13;
          v14 = (int8x16_t *)(v9 + 16);
          v15 = v8 - v13;
          v16 = v6;
          do
          {
            v17 = (int8x16_t *)(a2 + 4 * v16);
            v18 = vorrq_s8(v17[1], *v14);
            *v17 = vorrq_s8(*v17, v14[-1]);
            v17[1] = v18;
            v16 += 8;
            v14 += 2;
            v15 -= 8;
          }
          while (v15);
          if (!v13)
            goto LABEL_3;
          goto LABEL_19;
        }
      }
      v10 = 0;
LABEL_19:
      v19 = v8 - v10;
      v20 = (int *)(v9 + 4 * v10);
      v21 = v10 + v6;
      do
      {
        v22 = *v20++;
        *(_DWORD *)(a2 + 4 * v21++) |= v22;
        --v19;
      }
      while (v19);
LABEL_3:
      v2 = *a1;
LABEL_4:
      ++v3;
    }
    while (v3 < v2);
  }
  return 1;
}

uint64_t ETLDMCLoadEventRangesFromEventsArray(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  unsigned int v10;
  int v11;
  _WORD *v12;
  unsigned __int16 *v13;
  int v14;
  uint64_t v15;

  if (!a4)
    return 1;
  result = (uint64_t)malloc(4 * a3);
  *(_QWORD *)(a1 + 32) = result;
  if (result)
  {
    *(_DWORD *)(a1 + 24) = a3;
    *(_DWORD *)(a1 + 40) = a4;
    if (a3)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v13 = (unsigned __int16 *)(a2 + 2 * v10);
        v11 = a4 - v10;
        v14 = *v13;
        if (a4 - v10 < 2)
        {
          v11 = 1;
        }
        else
        {
          v15 = 1;
          while (v14 + (_DWORD)v15 == v13[v15])
          {
            if (v11 == (_DWORD)++v15)
              goto LABEL_6;
          }
          v11 = v15;
        }
LABEL_6:
        v12 = (_WORD *)(result + 4 * v9);
        *v12 = v14;
        v12[1] = v14 + v11 - 1;
        v10 += v11;
        ++v9;
      }
      while (v9 != a3);
    }
    return 1;
  }
  return result;
}

void ETLDMCViewFree(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void ***v8;
  uint64_t v9;
  void **v10;
  void **v11;
  void **v12;
  void **v13;
  void **v14;
  void **v15;
  void **v16;
  void **v17;
  void **v18;
  void **v19;
  void **v20;
  void **v21;
  void **v22;
  void **v23;
  void **v24;
  void **v25;
  void *v26;
  void *v27;

  if (a1)
  {
    v2 = *(unsigned int *)a1;
    if ((_DWORD)v2)
    {
      v3 = a1[1];
      if (v3)
      {
        v4 = 1;
        v5 = 8;
LABEL_6:
        v6 = *(void **)(v3 + v5);
        if (v6)
        {
          free(v6);
          *(_QWORD *)(v3 + v5) = 0;
          v2 = *(unsigned int *)a1;
        }
        while (v4 < v2)
        {
          v3 = a1[1];
          ++v4;
          v5 += 16;
          if (v3)
            goto LABEL_6;
        }
      }
    }
    v7 = (void *)a1[1];
    if (v7)
      free(v7);
    *a1 = 0;
    a1[1] = 0;
  }
  v8 = (void ***)(a1 + 2);
  v9 = a1[2];
  if (v9)
  {
    free(*(void **)(v9 + 8));
    *(_QWORD *)(v9 + 8) = 0;
    v10 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v10[3]);
    v10[3] = 0;
    v11 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v11[5]);
    v11[5] = 0;
    v12 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v12[7]);
    v12[7] = 0;
    v13 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v13[9]);
    v13[9] = 0;
    v14 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v14[11]);
    v14[11] = 0;
    v15 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v15[13]);
    v15[13] = 0;
    v16 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v16[15]);
    v16[15] = 0;
    v17 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v17[17]);
    v17[17] = 0;
    v18 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v18[19]);
    v18[19] = 0;
    v19 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v19[21]);
    v19[21] = 0;
    v20 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v20[23]);
    v20[23] = 0;
    v21 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v21[25]);
    v21[25] = 0;
    v22 = *v8;
    if (!*v8)
      goto LABEL_29;
    free(v22[27]);
    v22[27] = 0;
    v23 = *v8;
    if (*v8 && (free(v23[29]), v23[29] = 0, (v24 = *v8) != 0))
    {
      free(v24[31]);
      v24[31] = 0;
      v25 = *v8;
    }
    else
    {
LABEL_29:
      v25 = 0;
    }
    free(v25);
  }
  *v8 = 0;
  a1[3] = 0;
  v26 = (void *)a1[4];
  if (v26)
    free(v26);
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  v27 = (void *)a1[7];
  if (v27)
    free(v27);
  a1[6] = 0;
  a1[7] = 0;
}

uint64_t ETLDMCViewMerge(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 *v12;
  uint64_t v13;
  __int16 v14;
  unint64_t v15;
  int8x16_t *v16;
  uint64_t v17;
  uint64_t v18;
  int8x16_t *v19;
  uint64_t v20;
  uint64_t v21;
  int8x16_t *v22;
  int8x16_t v23;
  uint64_t v24;
  __int32 *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 *v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  int8x16_t *v34;
  uint64_t v35;
  uint64_t v36;
  int8x16_t *v37;
  uint64_t v38;
  uint64_t v39;
  int8x16_t *v40;
  int8x16_t v41;
  uint64_t v42;
  __int32 *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unsigned int v47;
  int v48;
  unsigned int v50;
  int MessagesFromMaskArray;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int *v55;
  uint64_t v56;
  unsigned int *v57;
  uint64_t v58;
  const void *v59;
  unsigned int v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  const void *v68;
  unsigned int v69;
  unsigned int v70;
  size_t v71;
  _WORD *v72;
  int v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned __int16 v78;
  int v79;
  unsigned __int16 *v80;
  int v81;
  int v82;
  BOOL v83;
  unsigned __int16 *v84;
  int v85;
  int v86;
  BOOL v87;
  unsigned __int16 v88;
  unsigned __int16 v89;
  uint64_t v90;
  unsigned __int16 *v91;
  int v92;
  int v93;
  BOOL v94;
  unsigned __int16 *v95;
  int v96;
  int v97;
  BOOL v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  unsigned int v102;
  unsigned int v103;
  char *v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  unint64_t v108;
  unsigned int v109;
  unsigned int v110;
  _BOOL4 v111;
  void *v112;
  void *v113;
  _WORD *v114;
  _WORD *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  unsigned __int16 *v120;
  uint64_t v121;
  __int16 v122;
  unsigned __int16 v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  _WORD *v127;
  uint64_t v128;
  __int16 *v129;
  uint64_t v130;
  __int16 v131;
  uint64_t v132;
  int32x4_t v133;
  int8x16_t v134;
  int32x4_t v135;
  int32x4_t v136;
  int32x4_t v137;
  uint16x8_t v138;
  uint16x8_t v139;
  unsigned int v140;
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  int v145;
  __int16 v146;
  char *v147;

  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v6 = *a2;
  v7 = *a3;
  if (!(_DWORD)v6)
  {
    if ((_DWORD)v7 && (_ETLDMCViewCopyMessageMasks((unsigned int *)a1, (uint64_t)a3) & 1) == 0)
      return 0;
    goto LABEL_46;
  }
  if (!(_DWORD)v7)
  {
    if ((_ETLDMCViewCopyMessageMasks((unsigned int *)a1, (uint64_t)a2) & 1) == 0)
      return 0;
    goto LABEL_46;
  }
  result = (uint64_t)malloc(0x34000uLL);
  if (!result)
    return result;
  v9 = (_DWORD *)result;
  bzero((void *)result, 0x34000uLL);
  v10 = 0;
  v11 = *((_QWORD *)a2 + 1);
  do
  {
    v12 = (unsigned __int16 *)(v11 + 16 * v10);
    v13 = *v12;
    v14 = v12[1] - v13 + 1;
    v15 = v12[1] - v13 + 1;
    if (v12[1] - (_DWORD)v13 == -1)
      goto LABEL_5;
    v16 = (int8x16_t *)*((_QWORD *)v12 + 1);
    if (v15 < 8)
    {
      v17 = 0;
LABEL_14:
      v24 = v15 - v17;
      v25 = &v16->i32[v17];
      v26 = v17 + v13;
      do
      {
        v27 = *v25++;
        v9[v26++] |= v27;
        --v24;
      }
      while (v24);
      goto LABEL_5;
    }
    v17 = 0;
    if (__CFADD__((_DWORD)v13, v15 - 1))
      goto LABEL_14;
    if ((v15 - 1) >> 32)
      goto LABEL_14;
    v18 = v14 & 7;
    v17 = v15 - v18;
    v19 = v16 + 1;
    v20 = v15 - v18;
    v21 = v13;
    do
    {
      v22 = (int8x16_t *)&v9[v21];
      v23 = vorrq_s8(v22[1], *v19);
      *v22 = vorrq_s8(*v22, v19[-1]);
      v22[1] = v23;
      v21 += 8;
      v19 += 2;
      v20 -= 8;
    }
    while (v20);
    if (v18)
      goto LABEL_14;
LABEL_5:
    ++v10;
  }
  while (v10 != v6);
  v28 = 0;
  v29 = *((_QWORD *)a3 + 1);
  do
  {
    v30 = (unsigned __int16 *)(v29 + 16 * v28);
    v31 = *v30;
    v32 = v30[1] - v31 + 1;
    v33 = v30[1] - v31 + 1;
    if (v30[1] - (_DWORD)v31 == -1)
      goto LABEL_21;
    v34 = (int8x16_t *)*((_QWORD *)v30 + 1);
    if (v33 < 8)
    {
      v35 = 0;
LABEL_30:
      v42 = v33 - v35;
      v43 = &v34->i32[v35];
      v44 = v35 + v31;
      do
      {
        v45 = *v43++;
        v9[v44++] |= v45;
        --v42;
      }
      while (v42);
      goto LABEL_21;
    }
    v35 = 0;
    if (__CFADD__((_DWORD)v31, v33 - 1))
      goto LABEL_30;
    if ((v33 - 1) >> 32)
      goto LABEL_30;
    v36 = v32 & 7;
    v35 = v33 - v36;
    v37 = v34 + 1;
    v38 = v33 - v36;
    v39 = v31;
    do
    {
      v40 = (int8x16_t *)&v9[v39];
      v41 = vorrq_s8(v40[1], *v37);
      *v40 = vorrq_s8(*v40, v37[-1]);
      v40[1] = v41;
      v39 += 8;
      v37 += 2;
      v38 -= 8;
    }
    while (v38);
    if (v36)
      goto LABEL_30;
LABEL_21:
    ++v28;
  }
  while (v28 != v7);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  do
  {
    if ((v46 - v48) > 1 || v47 == 0)
      v50 = v47 + 1;
    else
      v50 = v47;
    if (v9[v46])
    {
      v48 = v46;
      v47 = v50;
    }
    ++v46;
  }
  while (v46 != 53248);
  MessagesFromMaskArray = ETLDMCViewLoadMessagesFromMaskArray(a1, (uint64_t)v9, v47);
  free(v9);
  if (!MessagesFromMaskArray)
    return 0;
LABEL_46:
  v52 = *((_QWORD *)a3 + 2);
  if (*((_QWORD *)a2 + 2))
  {
    if (v52)
    {
      result = (uint64_t)malloc(0x100uLL);
      *(_QWORD *)(a1 + 16) = result;
      if (!result)
        return result;
      v53 = 0;
      *(_OWORD *)(result + 224) = 0u;
      *(_OWORD *)(result + 240) = 0u;
      *(_OWORD *)(result + 192) = 0u;
      *(_OWORD *)(result + 208) = 0u;
      *(_OWORD *)(result + 160) = 0u;
      *(_OWORD *)(result + 176) = 0u;
      *(_OWORD *)(result + 128) = 0u;
      *(_OWORD *)(result + 144) = 0u;
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 80) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      do
      {
        v54 = *((_QWORD *)a2 + 2);
        v55 = (unsigned int *)(v54 + 16 * v53);
        v56 = *((_QWORD *)a3 + 2);
        v57 = (unsigned int *)(v56 + 16 * v53);
        if (*v55 || *v57)
        {
          v58 = *(_QWORD *)(a1 + 16) + 16 * v53;
          result = (uint64_t)malloc(0x200uLL);
          *(_QWORD *)(v58 + 8) = result;
          if (!result)
            return result;
          v59 = *(const void **)(v54 + 16 * v53 + 8);
          if (v59)
          {
            memcpy((void *)result, v59, 0x200uLL);
            v60 = *v55;
            *(_DWORD *)v58 = *v55;
            v61 = v56 + 16 * v53;
            v63 = *(_QWORD *)(v61 + 8);
            v62 = (_QWORD *)(v61 + 8);
            if (v63)
            {
              v64 = *v57;
              if (*v57 > v60)
                *(_DWORD *)v58 = v64;
              v65 = v64 + 7;
              if (v65 >= 8)
              {
                v66 = 0;
                LODWORD(v67) = v65 >> 3;
                if (v67 <= 1)
                  v67 = 1;
                else
                  v67 = v67;
                do
                {
                  *(_BYTE *)(*(_QWORD *)(v58 + 8) + v66) |= *(_BYTE *)(*v62 + v66);
                  ++v66;
                }
                while (v67 != v66);
              }
            }
          }
          else
          {
            v68 = *(const void **)(v56 + 16 * v53 + 8);
            if (v68)
            {
              memcpy((void *)result, v68, 0x200uLL);
              *(_DWORD *)v58 = *v57;
            }
          }
        }
        ++v53;
      }
      while (v53 != 14);
    }
    else
    {
      result = _ETLDMCViewCopyLogMasks(a1, (uint64_t)a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  else if (v52 && (_ETLDMCViewCopyLogMasks(a1, (uint64_t)a3) & 1) == 0)
  {
    return 0;
  }
  v69 = a2[6];
  v70 = a3[6];
  if (!v69)
  {
    if (v70)
    {
      result = (uint64_t)malloc(4 * v70);
      *(_QWORD *)(a1 + 32) = result;
      if (!result)
        return result;
      bzero((void *)result, 4 * v70);
      v99 = 0;
      *(_DWORD *)(a1 + 24) = v70;
      *(_DWORD *)(a1 + 40) = a3[10];
      do
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v99) = *(_DWORD *)(*((_QWORD *)a3 + 4) + 4 * v99);
        ++v99;
      }
      while (v99 < *(unsigned int *)(a1 + 24));
    }
LABEL_142:
    v109 = a2[12];
    v110 = a3[12];
    v111 = v110 == 0;
    if (!v109)
      goto LABEL_150;
    goto LABEL_143;
  }
  if (!v70)
  {
    result = (uint64_t)malloc(4 * v69);
    *(_QWORD *)(a1 + 32) = result;
    if (!result)
      return result;
    bzero((void *)result, 4 * v69);
    v108 = 0;
    *(_DWORD *)(a1 + 24) = v69;
    *(_DWORD *)(a1 + 40) = a2[10];
    do
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v108) = *(_DWORD *)(*((_QWORD *)a2 + 4) + 4 * v108);
      ++v108;
    }
    while (v108 < *(unsigned int *)(a1 + 24));
    goto LABEL_142;
  }
  v71 = 2 * (a3[10] + a2[10]);
  result = (uint64_t)malloc(v71);
  if (!result)
    return result;
  v72 = (_WORD *)result;
  bzero((void *)result, v71);
  v73 = 0;
  v74 = 0;
  v75 = 0;
  v76 = 0;
  v77 = 0;
  v78 = 0;
  v79 = 1;
  while (2)
  {
    v88 = -1;
    if (v74 == 0xFFFF)
    {
      v89 = -1;
      if (v76 == 0xFFFF)
        goto LABEL_96;
LABEL_99:
      v89 = *(_WORD *)(*((_QWORD *)a3 + 4) + 4 * v76) + v75;
      if (v88 == 0xFFFF)
        goto LABEL_100;
LABEL_101:
      v90 = (v79 - 1);
      if (v88 == v89)
      {
        v72[v90] = v88;
        v80 = (unsigned __int16 *)(*((_QWORD *)a2 + 4) + 4 * v74);
        v81 = v80[1] - *v80;
        if (v74 + 1 == v69)
          v82 = 0xFFFF;
        else
          v82 = v74 + 1;
        v83 = v73 == v81;
        if (v73 == v81)
          v73 = 0;
        else
          ++v73;
        if (v83)
          v74 = v82;
        v84 = (unsigned __int16 *)(*((_QWORD *)a3 + 4) + 4 * v76);
        v85 = v84[1] - *v84;
        if (v76 + 1 == v70)
          v86 = 0xFFFF;
        else
          v86 = v76 + 1;
        v87 = v75 == v85;
        if (v75 == v85)
          v75 = 0;
        else
          ++v75;
        if (v87)
          v76 = v86;
      }
      else if (v88 >= v89)
      {
        v72[v90] = v89;
        v95 = (unsigned __int16 *)(*((_QWORD *)a3 + 4) + 4 * v76);
        v96 = v95[1] - *v95;
        if (v76 + 1 == v70)
          v97 = 0xFFFF;
        else
          v97 = v76 + 1;
        v98 = v75 == v96;
        if (v75 == v96)
          v75 = 0;
        else
          ++v75;
        if (v98)
          v76 = v97;
        v88 = v89;
      }
      else
      {
        v72[v90] = v88;
        v91 = (unsigned __int16 *)(*((_QWORD *)a2 + 4) + 4 * v74);
        v92 = v91[1] - *v91;
        if (v74 + 1 == v69)
          v93 = 0xFFFF;
        else
          v93 = v74 + 1;
        v94 = v73 == v92;
        if (v73 == v92)
          v73 = 0;
        else
          ++v73;
        if (v94)
          v74 = v93;
      }
      if (v88 - v78 > 1)
        ++v77;
      ++v79;
      v78 = v88;
      continue;
    }
    break;
  }
  v88 = *(_WORD *)(*((_QWORD *)a2 + 4) + 4 * v74) + v73;
  v89 = -1;
  if (v76 != 0xFFFF)
    goto LABEL_99;
LABEL_96:
  if (v88 != 0xFFFF)
    goto LABEL_101;
LABEL_100:
  if (v89 != 0xFFFF)
    goto LABEL_101;
  if (!v79)
    goto LABEL_149;
  v100 = (char *)malloc(4 * v77);
  *(_QWORD *)(a1 + 32) = v100;
  if (!v100)
  {
    free(v72);
    return 0;
  }
  *(_DWORD *)(a1 + 24) = v77;
  *(_DWORD *)(a1 + 40) = v79;
  if (v77)
  {
    v101 = 0;
    v102 = 0;
    do
    {
      v105 = v102;
      v103 = v79 - v102;
      v106 = (unsigned __int16)v72[v102];
      if (v103 < 2)
      {
        v103 = 1;
      }
      else
      {
        v107 = 0;
        while (v106 + 1 + (_DWORD)v107 == (unsigned __int16)v72[v105 + 1 + v107])
        {
          if (~(_DWORD)v105 + v79 == (_DWORD)++v107)
            goto LABEL_132;
        }
        v103 = v107 + 1;
      }
LABEL_132:
      v104 = &v100[4 * v101];
      *(_WORD *)v104 = v106;
      *((_WORD *)v104 + 1) = v106 + v103 - 1;
      v102 = v103 + v105;
      ++v101;
    }
    while (v101 != v77);
  }
LABEL_149:
  free(v72);
  v109 = a2[12];
  v110 = a3[12];
  v111 = v110 == 0;
  if (v109)
  {
LABEL_143:
    if (v111)
    {
      v112 = malloc(4 * v109);
      *(_QWORD *)(a1 + 56) = v112;
      if (v112)
      {
        v113 = v112;
        bzero(v112, 4 * v109);
        memcpy(v113, *((const void **)a2 + 7), 4 * v109);
        *(_DWORD *)(a1 + 48) = v109;
        return 1;
      }
      goto LABEL_173;
    }
    v114 = malloc(0x20000uLL);
    if (!v114)
      goto LABEL_173;
    v115 = v114;
    bzero(v114, 0x20000uLL);
    v116 = *((_QWORD *)a2 + 7);
    if (v109 >= 2)
    {
      v117 = v109 & 0xFFFFFFFE;
      v120 = (unsigned __int16 *)(v116 + 4);
      v121 = v117;
      do
      {
        v122 = *(v120 - 1);
        v123 = v120[1];
        v124 = *(v120 - 2);
        v125 = *v120;
        v120 += 4;
        v115[v124] = v122;
        v115[v125] = v123;
        v121 -= 2;
      }
      while (v121);
      if (v117 == v109)
        goto LABEL_162;
    }
    else
    {
      v117 = 0;
    }
    v126 = v109 - v117;
    v127 = (_WORD *)(v116 + 4 * v117 + 2);
    do
    {
      v115[(unsigned __int16)*(v127 - 1)] = *v127;
      v127 += 2;
      --v126;
    }
    while (v126);
LABEL_162:
    if (v110)
    {
      v128 = v110;
      v129 = (__int16 *)(*((_QWORD *)a3 + 7) + 2);
      do
      {
        v130 = (unsigned __int16)*(v129 - 1);
        v131 = *v129;
        v129 += 2;
        v115[v130] |= v131;
        --v128;
      }
      while (v128);
    }
    v132 = 0;
    v133 = 0uLL;
    v134.i64[0] = 0x100000001;
    v134.i64[1] = 0x100000001;
    v135 = 0uLL;
    v136 = 0uLL;
    v137 = 0uLL;
    do
    {
      v138 = (uint16x8_t)vtstq_s16(*(int16x8_t *)&v115[v132], *(int16x8_t *)&v115[v132]);
      v139 = (uint16x8_t)vtstq_s16(*(int16x8_t *)&v115[v132 + 8], *(int16x8_t *)&v115[v132 + 8]);
      v135 = vaddq_s32(v135, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v138), v134));
      v133 = vaddq_s32(v133, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v138.i8), v134));
      v137 = vaddq_s32(v137, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v139), v134));
      v136 = vaddq_s32(v136, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v139.i8), v134));
      v132 += 16;
    }
    while (v132 != 0x10000);
    v140 = vaddvq_s32(vaddq_s32(vaddq_s32(v136, v133), vaddq_s32(v137, v135)));
    v141 = v140;
    *(_DWORD *)(a1 + 48) = v140;
    v142 = (char *)malloc(4 * v140);
    *(_QWORD *)(a1 + 56) = v142;
    if (!v142)
      goto LABEL_173;
    v143 = v142;
    bzero(v142, 2 * v141);
    v144 = 0;
    v145 = 0;
    do
    {
      v146 = v115[v144];
      if (v146)
      {
        v147 = &v143[4 * v145];
        *(_WORD *)v147 = v144;
        ++v145;
        *((_WORD *)v147 + 1) = v146;
      }
      ++v144;
    }
    while (v144 != 0x10000);
    free(v115);
    return 1;
  }
LABEL_150:
  if (v111)
    return 1;
  v118 = malloc(4 * v110);
  *(_QWORD *)(a1 + 56) = v118;
  if (v118)
  {
    v119 = v118;
    bzero(v118, 4 * v110);
    memcpy(v119, *((const void **)a3 + 7), 4 * v110);
    *(_DWORD *)(a1 + 48) = v110;
    return 1;
  }
LABEL_173:
  _ETLDebugPrint();
  return 0;
}

uint64_t _ETLDMCViewCopyMessageMasks(unsigned int *a1, uint64_t a2)
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const void **v9;
  size_t v10;
  void *v11;

  v4 = *(_DWORD *)a2;
  v5 = malloc((16 * *(_DWORD *)a2));
  *((_QWORD *)a1 + 1) = v5;
  if (v5)
  {
    bzero(v5, 16 * v4);
    *a1 = v4;
    if (!v4)
      return 1;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *((_QWORD *)a1 + 1);
      v9 = (const void **)(*(_QWORD *)(a2 + 8) + v6);
      v10 = 4 * (*((unsigned __int16 *)v9 + 1) - *(unsigned __int16 *)v9) + 4;
      v11 = malloc(v10);
      *(_QWORD *)(v8 + v6 + 8) = v11;
      if (!v11)
        break;
      memcpy(v11, v9[1], v10);
      *(_DWORD *)(v8 + v6) = *(_DWORD *)v9;
      ++v7;
      v6 += 16;
      if (v7 >= *a1)
        return 1;
    }
  }
  _ETLDebugPrint();
  return 0;
}

uint64_t _ETLDMCViewCopyLogMasks(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;

  result = (uint64_t)malloc(0x100uLL);
  *(_QWORD *)(a1 + 16) = result;
  if (result)
  {
    v5 = result;
    *(_OWORD *)(result + 224) = 0u;
    *(_OWORD *)(result + 240) = 0u;
    *(_OWORD *)(result + 192) = 0u;
    *(_OWORD *)(result + 208) = 0u;
    *(_OWORD *)(result + 160) = 0u;
    *(_OWORD *)(result + 176) = 0u;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 144) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    v6 = *(_QWORD *)(a2 + 16);
    if (*(_DWORD *)v6)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 8) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 8), 0x200uLL);
      *(_DWORD *)v5 = *(_DWORD *)v6;
    }
    if (*(_DWORD *)(v6 + 16))
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 24) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 24), 0x200uLL);
      *(_DWORD *)(v5 + 16) = *(_DWORD *)(v6 + 16);
    }
    if (*(_DWORD *)(v6 + 32))
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 40) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 40), 0x200uLL);
      *(_DWORD *)(v5 + 32) = *(_DWORD *)(v6 + 32);
    }
    if (*(_DWORD *)(v6 + 48))
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 56) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 56), 0x200uLL);
      *(_DWORD *)(v5 + 48) = *(_DWORD *)(v6 + 48);
    }
    v7 = *(_DWORD *)(v6 + 64);
    if (v7)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 72) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 72), 0x200uLL);
      *(_DWORD *)(v5 + 64) = v7;
    }
    v8 = *(_DWORD *)(v6 + 80);
    if (v8)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 88) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 88), 0x200uLL);
      *(_DWORD *)(v5 + 80) = v8;
    }
    v9 = *(_DWORD *)(v6 + 96);
    if (v9)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 104) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 104), 0x200uLL);
      *(_DWORD *)(v5 + 96) = v9;
    }
    v10 = *(_DWORD *)(v6 + 112);
    if (v10)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 120) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 120), 0x200uLL);
      *(_DWORD *)(v5 + 112) = v10;
    }
    v11 = *(_DWORD *)(v6 + 128);
    if (v11)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 136) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 136), 0x200uLL);
      *(_DWORD *)(v5 + 128) = v11;
    }
    v12 = *(_DWORD *)(v6 + 144);
    if (v12)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 152) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 152), 0x200uLL);
      *(_DWORD *)(v5 + 144) = v12;
    }
    v13 = *(_DWORD *)(v6 + 160);
    if (v13)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 168) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 168), 0x200uLL);
      *(_DWORD *)(v5 + 160) = v13;
    }
    v14 = *(_DWORD *)(v6 + 176);
    if (v14)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 184) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 184), 0x200uLL);
      *(_DWORD *)(v5 + 176) = v14;
    }
    v15 = *(_DWORD *)(v6 + 192);
    if (v15)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 200) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 200), 0x200uLL);
      *(_DWORD *)(v5 + 192) = v15;
    }
    v16 = *(_DWORD *)(v6 + 208);
    if (v16)
    {
      result = (uint64_t)malloc(0x200uLL);
      *(_QWORD *)(v5 + 216) = result;
      if (!result)
        return result;
      memcpy((void *)result, *(const void **)(v6 + 216), 0x200uLL);
      *(_DWORD *)(v5 + 208) = v16;
    }
    return 1;
  }
  return result;
}

uint64_t ETLDMCViewMergeInto(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = ETLDMCViewMerge((uint64_t)&v7, (unsigned int *)a1, a2);
  if ((_DWORD)v3)
  {
    ETLDMCViewFree((_QWORD *)a1);
    v4 = v8;
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v4;
    v5 = v10;
    *(_OWORD *)(a1 + 32) = v9;
    *(_OWORD *)(a1 + 48) = v5;
  }
  else
  {
    ETLDMCViewFree(&v7);
  }
  return v3;
}

const char *ETLDMCViewGetAsString(unsigned int a1)
{
  if (a1 <= 3)
    return (&ETLDMCViewGetAsString_kViewStrings)[a1];
  else
    return "Unknown";
}

uint64_t ETLDMCViewLoadQTraces(uint64_t a1, int16x8_t *a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  int16x8_t *v8;
  int32x4_t v9;
  int8x16_t v10;
  uint64_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;
  uint16x8_t v15;
  uint16x8_t v16;
  uint64_t v17;
  unsigned __int16 *v18;
  char *v20;
  uint64_t v21;
  unsigned int v22;
  char v23;
  __int16 v24;
  char *v25;

  if (!a3)
  {
    v7 = 0;
    goto LABEL_12;
  }
  if (a3 >= 0x10)
  {
    v6 = a3 & 0xFFFFFFF0;
    v8 = a2 + 1;
    v9 = 0uLL;
    v10.i64[0] = 0x100000001;
    v10.i64[1] = 0x100000001;
    v11 = v6;
    v12 = 0uLL;
    v13 = 0uLL;
    v14 = 0uLL;
    do
    {
      v15 = (uint16x8_t)vtstq_s16(v8[-1], v8[-1]);
      v16 = (uint16x8_t)vtstq_s16(*v8, *v8);
      v12 = vaddq_s32(v12, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v15), v10));
      v9 = vaddq_s32(v9, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v15.i8), v10));
      v14 = vaddq_s32(v14, (int32x4_t)vandq_s8((int8x16_t)vmovl_high_u16(v16), v10));
      v13 = vaddq_s32(v13, (int32x4_t)vandq_s8((int8x16_t)vmovl_u16(*(uint16x4_t *)v16.i8), v10));
      v8 += 2;
      v11 -= 16;
    }
    while (v11);
    v7 = vaddvq_s32(vaddq_s32(vaddq_s32(v13, v9), vaddq_s32(v14, v12)));
    if (v6 == a3)
      goto LABEL_12;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v17 = a3 - v6;
  v18 = (unsigned __int16 *)a2 + v6;
  do
  {
    if (*v18++)
      ++v7;
    --v17;
  }
  while (v17);
LABEL_12:
  *(_DWORD *)(a1 + 48) = v7;
  v20 = (char *)malloc(4 * v7);
  *(_QWORD *)(a1 + 56) = v20;
  if (a3)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    while (1)
    {
      v24 = a2->i16[v21];
      if (v24)
      {
        v25 = &v20[4 * v22];
        *(_WORD *)v25 = v21;
        ++v22;
        *((_WORD *)v25 + 1) = v24;
        if (v22 > v7)
        {
          _ETLDebugPrint();
          return 0;
        }
        v23 = 1;
      }
      if (a3 == ++v21)
        return v23 & 1;
    }
  }
  v23 = 0;
  return v23 & 1;
}

uint64_t APPLIB_DIAG_FTM_SetRFMode(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t result;
  int v7;
  int v8;
  char v9;
  unsigned __int16 v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  __int16 __src;
  _BYTE v28[2046];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 7;
  *((_WORD *)a1 + 3) = a3;
  v9 = HIBYTE(a3);
  v10 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 7];
  v11 = a1[5];
  v12 = crc_16_l_table[(v11 ^ v10 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  v13 = crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)];
  v14 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)] ^ (v12 >> 8)];
  *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)]);
  if (a2 < 20)
    return 0xFFFFFFFFLL;
  v26 = v14 ^ ~(v13 >> 8);
  bzero(v28, 0x7FEuLL);
  __src = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    v15 = 3;
    v28[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v28[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v28[v16 - 2];
  *v18 = v8;
  v18[1] = 7;
  v19 = v16 + 2;
  if ((v11 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v11) = v11 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v11;
  v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    v17 = a3 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  v21 = ~(v14 ^ BYTE1(v13));
  v28[v20 - 2] = v17;
  v22 = v20 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    v28[v22 - 2] = 125;
    v9 = HIBYTE(a3) ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  v23 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  v28[v22 - 2] = v9;
  v24 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v24 - 2] = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  v28[v24 - 2] = v21;
  v25 = v24 + 1;
  if (BYTE1(v26) - 125 <= 1)
  {
    v28[v25 - 2] = 125;
    v23 = BYTE1(v26) ^ 0x20;
    LODWORD(v25) = v24 + 2;
  }
  v28[v25 - 2] = v23;
  memcpy(a1, &__src, v25 + 1);
  result = (v25 + 2);
  a1[v25 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetChannel(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t result;
  int v7;
  int v8;
  char v9;
  unsigned __int16 v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  __int16 __src;
  _BYTE v28[2046];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 8;
  *((_WORD *)a1 + 3) = a3;
  v9 = HIBYTE(a3);
  v10 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 8];
  v11 = a1[5];
  v12 = crc_16_l_table[(v11 ^ v10 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  v13 = crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)];
  v14 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)] ^ (v12 >> 8)];
  *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)]);
  if (a2 < 20)
    return 0xFFFFFFFFLL;
  v26 = v14 ^ ~(v13 >> 8);
  bzero(v28, 0x7FEuLL);
  __src = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    v15 = 3;
    v28[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v28[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v28[v16 - 2];
  *v18 = v8;
  v18[1] = 8;
  v19 = v16 + 2;
  if ((v11 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v11) = v11 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v11;
  v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    v17 = a3 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  v21 = ~(v14 ^ BYTE1(v13));
  v28[v20 - 2] = v17;
  v22 = v20 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    v28[v22 - 2] = 125;
    v9 = HIBYTE(a3) ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  v23 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  v28[v22 - 2] = v9;
  v24 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v24 - 2] = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  v28[v24 - 2] = v21;
  v25 = v24 + 1;
  if (BYTE1(v26) - 125 <= 1)
  {
    v28[v25 - 2] = 125;
    v23 = BYTE1(v26) ^ 0x20;
    LODWORD(v25) = v24 + 2;
  }
  v28[v25 - 2] = v23;
  memcpy(a1, &__src, v25 + 1);
  result = (v25 + 2);
  a1[v25 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_Tx_On(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int16 __src;
  char v21[2046];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xD)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v5 = gModeId;
    a1[2] = gModeId;
    v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 2;
    v7 = crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC];
    v8 = crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 2];
    v9 = a1[5];
    v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    v11 = v10 ^ ~(v8 >> 8);
    *((_WORD *)a1 + 3) = v10 ^ ~HIBYTE(crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 2]);
    if (a2 >= 16)
    {
      bzero(v21, 0x7FEuLL);
      __src = 2891;
      if ((v5 - 125) > 1)
      {
        v12 = 2;
      }
      else
      {
        v21[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        v12 = 3;
      }
      v21[v12 - 2] = v5;
      v13 = v12 + 1;
      if ((v6 - 125) <= 1)
      {
        v21[v13 - 2] = 125;
        LODWORD(v13) = v12 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      v14 = ~(v10 ^ BYTE1(v8));
      v15 = &v21[v13 - 2];
      *v15 = v6;
      v15[1] = 2;
      v16 = v13 + 2;
      if ((v9 - 125) <= 1)
      {
        v21[v16 - 2] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v16) = v13 + 3;
      }
      v17 = (unsigned __int16)(v10 ^ ~(unsigned __int16)(v8 >> 8)) >> 8;
      v21[v16 - 2] = v9;
      v18 = v16 + 1;
      if ((v14 - 125) <= 1)
      {
        v21[v18 - 2] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v18) = v16 + 2;
      }
      v21[v18 - 2] = v14;
      v19 = v18 + 1;
      if (BYTE1(v11) - 125 <= 1)
      {
        v21[v19 - 2] = 125;
        v17 = BYTE1(v11) ^ 0x20;
        LODWORD(v19) = v18 + 2;
      }
      v21[v19 - 2] = v17;
      memcpy(a1, &__src, v19 + 1);
      result = (v19 + 2);
      a1[v19 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_Tx_Off(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int16 __src;
  char v21[2046];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xD)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v5 = gModeId;
    a1[2] = gModeId;
    v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 3;
    v7 = crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC];
    v8 = crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 3];
    v9 = a1[5];
    v10 = crc_16_l_table[(v9 ^ v8 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    v11 = v10 ^ ~(v8 >> 8);
    *((_WORD *)a1 + 3) = v10 ^ ~HIBYTE(crc_16_l_table[v7 ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 3]);
    if (a2 >= 16)
    {
      bzero(v21, 0x7FEuLL);
      __src = 2891;
      if ((v5 - 125) > 1)
      {
        v12 = 2;
      }
      else
      {
        v21[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        v12 = 3;
      }
      v21[v12 - 2] = v5;
      v13 = v12 + 1;
      if ((v6 - 125) <= 1)
      {
        v21[v13 - 2] = 125;
        LODWORD(v13) = v12 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      v14 = ~(v10 ^ BYTE1(v8));
      v15 = &v21[v13 - 2];
      *v15 = v6;
      v15[1] = 3;
      v16 = v13 + 2;
      if ((v9 - 125) <= 1)
      {
        v21[v16 - 2] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v16) = v13 + 3;
      }
      v17 = (unsigned __int16)(v10 ^ ~(unsigned __int16)(v8 >> 8)) >> 8;
      v21[v16 - 2] = v9;
      v18 = v16 + 1;
      if ((v14 - 125) <= 1)
      {
        v21[v18 - 2] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v18) = v16 + 2;
      }
      v21[v18 - 2] = v14;
      v19 = v18 + 1;
      if (BYTE1(v11) - 125 <= 1)
      {
        v21[v19 - 2] = 125;
        v17 = BYTE1(v11) ^ 0x20;
        LODWORD(v19) = v18 + 2;
      }
      v21[v19 - 2] = v17;
      memcpy(a1, &__src, v19 + 1);
      result = (v19 + 2);
      a1[v19 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetWaveForm(unsigned __int8 *a1, int a2, int a3, int a4)
{
  uint64_t result;
  unsigned int v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  char *v18;
  char v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  int v23;
  int v24;
  _BYTE __src[2048];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  *((_WORD *)a1 + 1) = gModeId;
  if (a3)
  {
    if (a3 != 1)
      return 0xFFFFFFFFLL;
    if (a4)
    {
      if (a4 == 1)
      {
        a1[4] = -120;
        v9 = 10;
        v10 = 64;
        v11 = 1;
        v12 = 9;
        v13 = 8;
        v14 = 7;
        v15 = 6;
        v16 = 1;
        goto LABEL_11;
      }
      return 0xFFFFFFFFLL;
    }
    v9 = 9;
    v10 = 56;
    v16 = 1;
  }
  else
  {
    v16 = 0;
    v9 = 9;
    v10 = 56;
  }
  v11 = 50;
  v12 = 8;
  v13 = 7;
  v14 = 6;
  v15 = 4;
LABEL_11:
  a1[v15] = v11;
  a1[v14] = v16;
  LOWORD(v17) = -1;
  v18 = (char *)a1;
  do
  {
    v19 = *v18++;
    v17 = crc_16_l_table[(v19 ^ v17)] ^ ((unsigned __int16)(v17 & 0xFF00) >> 8);
    v10 -= 8;
  }
  while ((_WORD)v10);
  a1[v13] = ~(_BYTE)v17;
  a1[v12] = (unsigned __int16)~(_WORD)v17 >> 8;
  if (a2 < (int)(2 * v9))
    return 0xFFFFFFFFLL;
  bzero(__src, 0x800uLL);
  v20 = 0;
  LODWORD(v21) = 0;
  v22 = v9;
  do
  {
    while (1)
    {
      v24 = a1[v20];
      if ((v24 - 125) > 1)
        break;
      v23 = v21 + 1;
      __src[(int)v21] = 125;
      __src[(int)v21 + 1] = v24 ^ 0x20;
      v21 = (int)v21 + 1 + 1;
      if (v22 == ++v20)
        goto LABEL_19;
    }
    v23 = v21;
    __src[(int)v21] = v24;
    v21 = (int)v21 + 1;
    ++v20;
  }
  while (v22 != v20);
LABEL_19:
  memcpy(a1, __src, v21);
  result = (v23 + 2);
  a1[v21] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPARange(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  unsigned __int16 v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  _BYTE v28[2046];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 54;
  a1[6] = a3;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x36];
  v10 = a1[5];
  v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  v12 = crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)];
  v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  v14 = v13 ^ ~(v12 >> 8);
  *((_WORD *)a1 + 4) = v13 ^ ~HIBYTE(crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)]);
  if (a2 < 20)
    return 0xFFFFFFFFLL;
  bzero(v28, 0x7FEuLL);
  v27 = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    v15 = 3;
    v28[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v28[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v28[v16 - 2];
  *v18 = v8;
  v18[1] = 54;
  v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v10;
  v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    LODWORD(v20) = v19 + 2;
    v17 = a3 ^ 0x20;
  }
  v21 = ~(v13 ^ BYTE1(v12));
  v28[v20 - 2] = v17;
  v22 = v20 + 1;
  v23 = a1[7];
  if ((v23 - 125) <= 1)
  {
    v28[v22 - 2] = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  v24 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v28[v22 - 2] = v23;
  v25 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v25 - 2] = 125;
    LODWORD(v25) = v22 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  v28[v25 - 2] = v21;
  v26 = v25 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v28[v26 - 2] = 125;
    v24 = BYTE1(v14) ^ 0x20;
    LODWORD(v26) = v25 + 2;
  }
  v28[v26 - 2] = v24;
  memcpy(a1, &v27, v26 + 1);
  result = (v26 + 2);
  a1[v26 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPDM(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4)
{
  uint64_t result;
  int v9;
  int v10;
  unsigned __int16 v11;
  int v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  char v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  __int16 __src;
  _BYTE v36[2046];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x11)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v9 = gModeId;
  a1[2] = gModeId;
  v10 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 0;
  a1[6] = a3;
  a1[8] = a4;
  v11 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5])];
  v12 = a1[5];
  v13 = crc_16_l_table[(v12 ^ v11 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
  v14 = crc_16_l_table[(v13 ^ HIBYTE(v11) ^ a3)];
  v15 = crc_16_l_table[(a1[7] ^ v14 ^ HIBYTE(v13))];
  v16 = crc_16_l_table[(v15 ^ HIBYTE(v14) ^ a4)];
  v17 = crc_16_l_table[(a1[9] ^ v16 ^ HIBYTE(v15))];
  *((_WORD *)a1 + 5) = v17 ^ ~HIBYTE(crc_16_l_table[(v15 ^ HIBYTE(v14) ^ a4)]);
  if (a2 < 24)
    return 0xFFFFFFFFLL;
  v34 = v17 ^ ~(v16 >> 8);
  bzero(v36, 0x7FEuLL);
  __src = 2891;
  if ((v9 - 125) <= 1)
  {
    v36[0] = 125;
    v18 = 3;
    v36[1] = v9 ^ 0x20;
    v19 = 4;
    if ((v10 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v18 = 2;
  v36[0] = v9;
  v19 = 3;
  if ((v10 - 125) <= 1)
  {
LABEL_9:
    v36[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v18 + 2;
  }
LABEL_10:
  v20 = a3;
  v21 = &v36[v19 - 2];
  *v21 = v10;
  v21[1] = 0;
  v22 = v19 + 2;
  if ((v12 - 125) <= 1)
  {
    v36[v22 - 2] = 125;
    LOBYTE(v12) = v12 ^ 0x20;
    LODWORD(v22) = v19 + 3;
  }
  v36[v22 - 2] = v12;
  v23 = v22 + 1;
  if (a3 - 125 <= 1)
  {
    v36[v23 - 2] = 125;
    v20 = a3 ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  v24 = a4;
  v36[v23 - 2] = v20;
  v25 = v23 + 1;
  v26 = a1[7];
  if ((v26 - 125) <= 1)
  {
    v36[v25 - 2] = 125;
    LODWORD(v25) = v23 + 2;
    LOBYTE(v26) = v26 ^ 0x20;
  }
  v36[v25 - 2] = v26;
  v27 = v25 + 1;
  if (a4 - 125 <= 1)
  {
    v36[v27 - 2] = 125;
    v24 = a4 ^ 0x20;
    LODWORD(v27) = v25 + 2;
  }
  v28 = ~(v17 ^ BYTE1(v16));
  v36[v27 - 2] = v24;
  v29 = v27 + 1;
  v30 = a1[9];
  if ((v30 - 125) <= 1)
  {
    v36[v29 - 2] = 125;
    LOBYTE(v30) = v30 ^ 0x20;
    LODWORD(v29) = v27 + 2;
  }
  v31 = (unsigned __int16)(v17 ^ ~(unsigned __int16)(v16 >> 8)) >> 8;
  v36[v29 - 2] = v30;
  v32 = v29 + 1;
  if ((v28 - 125) <= 1)
  {
    v36[v32 - 2] = 125;
    LODWORD(v32) = v29 + 2;
    LOBYTE(v28) = v28 ^ 0x20;
  }
  v36[v32 - 2] = v28;
  v33 = v32 + 1;
  if (BYTE1(v34) - 125 <= 1)
  {
    v36[v33 - 2] = 125;
    v31 = BYTE1(v34) ^ 0x20;
    LODWORD(v33) = v32 + 2;
  }
  v36[v33 - 2] = v31;
  memcpy(a1, &__src, v33 + 1);
  result = (v33 + 2);
  a1[v33 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_ExecuteTxSweep(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v6;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  _BYTE v25[2046];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE)
    return result;
  v6 = a3;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 116;
  a1[6] = v6;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x74];
  v10 = a1[5];
  v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  v12 = crc_16_l_table[v11];
  v13 = crc_16_l_table[(v12 ^ HIBYTE(v9)) ^ v6];
  v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18)
    return 0xFFFFFFFFLL;
  bzero(v25, 0x7FEuLL);
  v24 = 2891;
  if ((v7 - 125) <= 1)
  {
    v25[0] = 125;
    v15 = 3;
    v25[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v25[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v25[v16 - 2] = 125;
    LODWORD(v16) = v15 + 2;
    LOBYTE(v8) = v8 ^ 0x20;
  }
LABEL_10:
  v17 = &v25[v16 - 2];
  *v17 = v8;
  v17[1] = 116;
  v18 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v25[v18 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v18) = v16 + 3;
  }
  v19 = ~(v13 ^ BYTE1(v12));
  v25[v18 - 2] = v10;
  v20 = v18 + 1;
  if ((v6 - 125) <= 1)
  {
    v25[v20 - 2] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v20) = v18 + 2;
  }
  v21 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v25[v20 - 2] = v6;
  v22 = v20 + 1;
  if ((v19 - 125) <= 1)
  {
    v25[v22 - 2] = 125;
    LODWORD(v22) = v20 + 2;
    LOBYTE(v19) = v19 ^ 0x20;
  }
  v25[v22 - 2] = v19;
  v23 = v22 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v25[v23 - 2] = 125;
    v21 = BYTE1(v14) ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  v25[v23 - 2] = v21;
  memcpy(a1, &v24, v23 + 1);
  result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPDMStepSize(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v6;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  _BYTE v25[2046];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE)
    return result;
  v6 = a3;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = -127;
  a1[6] = v6;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x81];
  v10 = a1[5];
  v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  v12 = crc_16_l_table[v11];
  v13 = crc_16_l_table[(v12 ^ HIBYTE(v9)) ^ v6];
  v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18)
    return 0xFFFFFFFFLL;
  bzero(v25, 0x7FEuLL);
  v24 = 2891;
  if ((v7 - 125) <= 1)
  {
    v25[0] = 125;
    v15 = 3;
    v25[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v25[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v25[v16 - 2] = 125;
    LODWORD(v16) = v15 + 2;
    LOBYTE(v8) = v8 ^ 0x20;
  }
LABEL_10:
  v17 = &v25[v16 - 2];
  *v17 = v8;
  v17[1] = -127;
  v18 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v25[v18 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v18) = v16 + 3;
  }
  v19 = ~(v13 ^ BYTE1(v12));
  v25[v18 - 2] = v10;
  v20 = v18 + 1;
  if ((v6 - 125) <= 1)
  {
    v25[v20 - 2] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v20) = v18 + 2;
  }
  v21 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v25[v20 - 2] = v6;
  v22 = v20 + 1;
  if ((v19 - 125) <= 1)
  {
    v25[v22 - 2] = 125;
    LODWORD(v22) = v20 + 2;
    LOBYTE(v19) = v19 ^ 0x20;
  }
  v25[v22 - 2] = v19;
  v23 = v22 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v25[v23 - 2] = 125;
    v21 = BYTE1(v14) ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  v25[v23 - 2] = v21;
  memcpy(a1, &v24, v23 + 1);
  result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_ConfigTxSweep(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t result;
  int v9;
  int v10;
  char v11;
  char v12;
  unsigned __int16 v13;
  int v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  int v39;
  _BYTE __src[2048];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v9 = gModeId;
    a1[2] = gModeId;
    v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 125;
    *((_WORD *)a1 + 3) = a3;
    v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    v12 = HIBYTE(a4);
    v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x7D];
    v14 = a1[5];
    v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~(unsigned __int16)(v18 >> 8);
    if (a2 >= 24)
    {
      v38 = v19;
      v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      v20 = *a1;
      if ((v20 - 125) > 1)
      {
        v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        v21 = 1;
      }
      __src[v21] = v20;
      v22 = v21 + 1;
      v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v26 = a3;
      v27 = &__src[v25];
      *v27 = v10;
      *(_WORD *)(v27 + 1) = 23933;
      v28 = v25 + 3;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 4;
      }
      __src[v28] = v14;
      v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      v30 = a4;
      __src[v29] = v26;
      v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      v35 = BYTE1(v39);
      __src[v34] = v12;
      v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetAllHDETValues(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  int v5;
  int v6;
  char *v7;
  char v8;
  uint64_t v9;
  size_t v10;
  int v11;
  int v12;
  _BYTE __src[2048];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x2D)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    *((_WORD *)a1 + 1) = gModeId;
    a1[4] = -112;
    v5 = 560;
    LOWORD(v6) = -1;
    v7 = (char *)a1;
    do
    {
      v8 = *v7++;
      v6 = crc_16_l_table[(v8 ^ v6)] ^ ((unsigned __int16)(v6 & 0xFF00) >> 8);
      v5 -= 8;
    }
    while ((_WORD)v5);
    *((_WORD *)a1 + 35) = ~(_WORD)v6;
    if (a2 >= 144)
    {
      bzero(__src, 0x800uLL);
      v9 = 0;
      LODWORD(v10) = 0;
      do
      {
        while (1)
        {
          v12 = a1[v9];
          if ((v12 - 125) > 1)
            break;
          v11 = v10 + 1;
          __src[(int)v10] = 125;
          __src[(int)v10 + 1] = v12 ^ 0x20;
          v10 = (int)v10 + 1 + 1;
          if (++v9 == 72)
            goto LABEL_11;
        }
        v11 = v10;
        __src[(int)v10] = v12;
        v10 = (int)v10 + 1;
        ++v9;
      }
      while (v9 != 72);
LABEL_11:
      memcpy(a1, __src, v10);
      result = (v11 + 2);
      a1[v10] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetADCValue(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v6;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  char v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  __int16 v29;
  _BYTE v30[2046];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x11)
    return result;
  v6 = a3;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 59;
  a1[6] = v6;
  *((_WORD *)a1 + 4) = -14636;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x3B];
  v10 = a1[5];
  v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  v12 = crc_16_l_table[(v11 ^ HIBYTE(v9)) ^ v6];
  v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  v14 = crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ 0xD4];
  v15 = crc_16_l_table[crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ 0xD4] ^ (v13 >> 8) ^ 0xC6];
  v16 = v15 ^ ~(v14 >> 8);
  *((_WORD *)a1 + 5) = v15 ^ ~HIBYTE(crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ 0xD4]);
  if (a2 < 24)
    return 0xFFFFFFFFLL;
  bzero(v30, 0x7FEuLL);
  v29 = 2891;
  if ((v7 - 125) <= 1)
  {
    v30[0] = 125;
    v17 = 3;
    v30[1] = v7 ^ 0x20;
    v18 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v17 = 2;
  v30[0] = v7;
  v18 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v30[v18 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v18) = v17 + 2;
  }
LABEL_10:
  v19 = &v30[v18 - 2];
  *v19 = v8;
  v19[1] = 59;
  v20 = v18 + 2;
  if ((v10 - 125) <= 1)
  {
    v30[v20 - 2] = 125;
    LODWORD(v20) = v18 + 3;
    LOBYTE(v10) = v10 ^ 0x20;
  }
  v30[v20 - 2] = v10;
  v21 = v20 + 1;
  if ((v6 - 125) <= 1)
  {
    v30[v21 - 2] = 125;
    LOBYTE(v6) = v6 ^ 0x20;
    LODWORD(v21) = v20 + 2;
  }
  v22 = ~(v15 ^ BYTE1(v14));
  v30[v21 - 2] = v6;
  v23 = v21 + 1;
  v24 = a1[7];
  if ((v24 - 125) <= 1)
  {
    v30[v23 - 2] = 125;
    LOBYTE(v24) = v24 ^ 0x20;
    LODWORD(v23) = v21 + 2;
  }
  v25 = (unsigned __int16)(v15 ^ ~(unsigned __int16)(v14 >> 8)) >> 8;
  v26 = &v30[v23 - 2];
  *v26 = v24;
  *(_WORD *)(v26 + 1) = -14636;
  v27 = v23 + 3;
  if ((v22 - 125) <= 1)
  {
    v30[v27 - 2] = 125;
    LOBYTE(v22) = v22 ^ 0x20;
    LODWORD(v27) = v23 + 4;
  }
  v30[v27 - 2] = v22;
  v28 = v27 + 1;
  if (BYTE1(v16) - 125 <= 1)
  {
    v30[v28 - 2] = 125;
    v25 = BYTE1(v16) ^ 0x20;
    LODWORD(v28) = v27 + 2;
  }
  v30[v28 - 2] = v25;
  memcpy(a1, &v29, v28 + 1);
  result = (v28 + 2);
  a1[v28 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetHDETTracking(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t result;
  int v9;
  int v10;
  char v11;
  char v12;
  unsigned __int16 v13;
  int v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  int v39;
  _BYTE __src[2048];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v9 = gModeId;
    a1[2] = gModeId;
    v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 124;
    *((_WORD *)a1 + 3) = a3;
    v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    v12 = HIBYTE(a4);
    v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x7C];
    v14 = a1[5];
    v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))]);
    if (a2 >= 24)
    {
      v38 = v19;
      v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      v20 = *a1;
      if ((v20 - 125) > 1)
      {
        v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        v21 = 1;
      }
      __src[v21] = v20;
      v22 = v21 + 1;
      v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v26 = a3;
      v27 = &__src[v25];
      *v27 = v10;
      v27[1] = 124;
      v28 = v25 + 2;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 3;
      }
      __src[v28] = v14;
      v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      v30 = a4;
      __src[v29] = v26;
      v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      v35 = BYTE1(v39);
      __src[v34] = v12;
      v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetThermistorValue(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = -2115764917;
    if (a2 >= 8)
    {
      *a1 = -2115764917;
      *((_BYTE *)a1 + 4) = 126;
      return 5;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetRxAGC(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  char v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  __int16 __src;
  char v23[2046];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xF)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v5 = gModeId;
    a1[2] = gModeId;
    v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 53;
    *((_WORD *)a1 + 3) = 0;
    v7 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 0x35];
    v8 = a1[5];
    v9 = crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    v10 = crc_16_l_table[v9 ^ (v7 >> 8)];
    v11 = crc_16_l_table[crc_16_l_table[v9 ^ (v7 >> 8)] ^ HIBYTE(crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))])];
    v12 = v11 ^ ~(v10 >> 8);
    *((_WORD *)a1 + 4) = v11 ^ ~HIBYTE(crc_16_l_table[v9 ^ (v7 >> 8)]);
    if (a2 >= 20)
    {
      bzero(v23, 0x7FEuLL);
      __src = 2891;
      if ((v5 - 125) > 1)
      {
        v13 = 2;
      }
      else
      {
        v23[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        v13 = 3;
      }
      v23[v13 - 2] = v5;
      v14 = v13 + 1;
      if ((v6 - 125) <= 1)
      {
        v23[v14 - 2] = 125;
        LODWORD(v14) = v13 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      v15 = ~(v11 ^ BYTE1(v10));
      v16 = &v23[v14 - 2];
      *v16 = v6;
      v16[1] = 53;
      v17 = v14 + 2;
      if ((v8 - 125) <= 1)
      {
        v23[v17 - 2] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        LODWORD(v17) = v14 + 3;
      }
      v18 = (unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8;
      v19 = &v23[v17 - 2];
      *v19 = v8;
      *(_WORD *)(v19 + 1) = 0;
      v20 = v17 + 3;
      if ((v15 - 125) <= 1)
      {
        v23[v20 - 2] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v20) = v17 + 4;
      }
      v23[v20 - 2] = v15;
      v21 = v20 + 1;
      if (BYTE1(v12) - 125 <= 1)
      {
        v23[v21 - 2] = 125;
        v18 = BYTE1(v12) ^ 0x20;
        LODWORD(v21) = v20 + 2;
      }
      v23[v21 - 2] = v18;
      memcpy(a1, &__src, v21 + 1);
      result = (v21 + 2);
      a1[v21 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetSynthState(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  char *v15;
  uint64_t v16;
  char v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  __int16 __src;
  char v22[2046];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0xF)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v5 = gModeId;
    a1[2] = gModeId;
    v6 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 16;
    a1[6] = -8;
    v7 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v5 ^ 0xA5]) ^ 0x10];
    v8 = a1[5];
    v9 = crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))];
    v10 = crc_16_l_table[crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))] ^ (v7 >> 8) ^ 0xF8];
    v11 = v10 ^ ~(v9 >> 8);
    *(_WORD *)(a1 + 7) = v10 ^ ~HIBYTE(crc_16_l_table[(v8 ^ v7 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v5 ^ 0xA5] ^ v6 ^ 0xEC]))]);
    if (a2 >= 18)
    {
      bzero(v22, 0x7FEuLL);
      __src = 2891;
      if ((v5 - 125) > 1)
      {
        v12 = 2;
      }
      else
      {
        v22[0] = 125;
        LOBYTE(v5) = v5 ^ 0x20;
        v12 = 3;
      }
      v22[v12 - 2] = v5;
      v13 = v12 + 1;
      if ((v6 - 125) <= 1)
      {
        v22[v13 - 2] = 125;
        LODWORD(v13) = v12 + 2;
        LOBYTE(v6) = v6 ^ 0x20;
      }
      v14 = ~(v10 ^ BYTE1(v9));
      v15 = &v22[v13 - 2];
      *v15 = v6;
      v15[1] = 16;
      v16 = v13 + 2;
      if ((v8 - 125) <= 1)
      {
        v22[v16 - 2] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        LODWORD(v16) = v13 + 3;
      }
      v17 = (unsigned __int16)(v10 ^ ~(unsigned __int16)(v9 >> 8)) >> 8;
      v18 = &v22[v16 - 2];
      *v18 = v8;
      v18[1] = -8;
      v19 = v16 + 2;
      if ((v14 - 125) <= 1)
      {
        v22[v19 - 2] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v19) = v16 + 3;
      }
      v22[v19 - 2] = v14;
      v20 = v19 + 1;
      if (BYTE1(v11) - 125 <= 1)
      {
        v22[v20 - 2] = 125;
        v17 = BYTE1(v11) ^ 0x20;
        LODWORD(v20) = v19 + 2;
      }
      v22[v20 - 2] = v17;
      memcpy(a1, &__src, v20 + 1);
      result = (v20 + 2);
      a1[v20 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetLNARange(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  unsigned __int16 v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  _BYTE v28[2046];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 58;
  a1[6] = a3;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x3A];
  v10 = a1[5];
  v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  v12 = crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)];
  v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  v14 = v13 ^ ~(v12 >> 8);
  *((_WORD *)a1 + 4) = v13 ^ ~HIBYTE(crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)]);
  if (a2 < 20)
    return 0xFFFFFFFFLL;
  bzero(v28, 0x7FEuLL);
  v27 = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    v15 = 3;
    v28[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v28[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v28[v16 - 2];
  *v18 = v8;
  v18[1] = 58;
  v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v10;
  v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    LODWORD(v20) = v19 + 2;
    v17 = a3 ^ 0x20;
  }
  v21 = ~(v13 ^ BYTE1(v12));
  v28[v20 - 2] = v17;
  v22 = v20 + 1;
  v23 = a1[7];
  if ((v23 - 125) <= 1)
  {
    v28[v22 - 2] = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  v24 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v28[v22 - 2] = v23;
  v25 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v25 - 2] = 125;
    LODWORD(v25) = v22 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  v28[v25 - 2] = v21;
  v26 = v25 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v28[v26 - 2] = 125;
    v24 = BYTE1(v14) ^ 0x20;
    LODWORD(v26) = v25 + 2;
  }
  v28[v26 - 2] = v24;
  memcpy(a1, &v27, v26 + 1);
  result = (v26 + 2);
  a1[v26 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetDVGAOffset(unsigned __int8 *a1, int a2, __int16 a3)
{
  uint64_t result;
  int v7;
  int v8;
  char v9;
  unsigned __int16 v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  __int16 __src;
  _BYTE v28[2046];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 117;
  *((_WORD *)a1 + 3) = a3;
  v9 = HIBYTE(a3);
  v10 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x75];
  v11 = a1[5];
  v12 = crc_16_l_table[(v11 ^ v10 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  v13 = crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)];
  v14 = crc_16_l_table[HIBYTE(a3) ^ crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)] ^ (v12 >> 8)];
  *((_WORD *)a1 + 4) = v14 ^ ~HIBYTE(crc_16_l_table[(v12 ^ HIBYTE(v10) ^ a3)]);
  if (a2 < 20)
    return 0xFFFFFFFFLL;
  v26 = v14 ^ ~(v13 >> 8);
  bzero(v28, 0x7FEuLL);
  __src = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    v15 = 3;
    v28[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v28[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v28[v16 - 2];
  *v18 = v8;
  v18[1] = 117;
  v19 = v16 + 2;
  if ((v11 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v11) = v11 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v11;
  v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    v17 = a3 ^ 0x20;
    LODWORD(v20) = v19 + 2;
  }
  v21 = ~(v14 ^ BYTE1(v13));
  v28[v20 - 2] = v17;
  v22 = v20 + 1;
  if (HIBYTE(a3) - 125 <= 1)
  {
    v28[v22 - 2] = 125;
    v9 = HIBYTE(a3) ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  v23 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  v28[v22 - 2] = v9;
  v24 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v24 - 2] = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  v28[v24 - 2] = v21;
  v25 = v24 + 1;
  if (BYTE1(v26) - 125 <= 1)
  {
    v28[v25 - 2] = 125;
    v23 = BYTE1(v26) ^ 0x20;
    LODWORD(v25) = v24 + 2;
  }
  v28[v25 - 2] = v23;
  memcpy(a1, &__src, v25 + 1);
  result = (v25 + 2);
  a1[v25 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetDVGAOffset(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  unsigned __int16 v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  _BYTE v28[2046];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xF)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 111;
  a1[6] = a3;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x6F];
  v10 = a1[5];
  v11 = crc_16_l_table[(v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]))];
  v12 = crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)];
  v13 = crc_16_l_table[(a1[7] ^ v12 ^ HIBYTE(v11))];
  v14 = v13 ^ ~(v12 >> 8);
  *((_WORD *)a1 + 4) = v13 ^ ~HIBYTE(crc_16_l_table[(v11 ^ HIBYTE(v9) ^ a3)]);
  if (a2 < 20)
    return 0xFFFFFFFFLL;
  bzero(v28, 0x7FEuLL);
  v27 = 2891;
  if ((v7 - 125) <= 1)
  {
    v28[0] = 125;
    v15 = 3;
    v28[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v28[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v28[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v28[v16 - 2];
  *v18 = v8;
  v18[1] = 111;
  v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v28[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v28[v19 - 2] = v10;
  v20 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v28[v20 - 2] = 125;
    LODWORD(v20) = v19 + 2;
    v17 = a3 ^ 0x20;
  }
  v21 = ~(v13 ^ BYTE1(v12));
  v28[v20 - 2] = v17;
  v22 = v20 + 1;
  v23 = a1[7];
  if ((v23 - 125) <= 1)
  {
    v28[v22 - 2] = 125;
    LOBYTE(v23) = v23 ^ 0x20;
    LODWORD(v22) = v20 + 2;
  }
  v24 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v28[v22 - 2] = v23;
  v25 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    v28[v25 - 2] = 125;
    LODWORD(v25) = v22 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  v28[v25 - 2] = v21;
  v26 = v25 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v28[v26 - 2] = 125;
    v24 = BYTE1(v14) ^ 0x20;
    LODWORD(v26) = v25 + 2;
  }
  v28[v26 - 2] = v24;
  memcpy(a1, &v27, v26 + 1);
  result = (v26 + 2);
  a1[v26 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_GetLNAOffset(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t result;
  int v9;
  int v10;
  char v11;
  char v12;
  unsigned __int16 v13;
  int v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  int v39;
  _BYTE __src[2048];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v9 = gModeId;
    a1[2] = gModeId;
    v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 118;
    *((_WORD *)a1 + 3) = a3;
    v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    v12 = HIBYTE(a4);
    v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x76];
    v14 = a1[5];
    v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~(unsigned __int16)(v18 >> 8);
    if (a2 >= 24)
    {
      v38 = v19;
      v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      v20 = *a1;
      if ((v20 - 125) > 1)
      {
        v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        v21 = 1;
      }
      __src[v21] = v20;
      v22 = v21 + 1;
      v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v26 = a3;
      v27 = &__src[v25];
      *v27 = v10;
      v27[1] = 118;
      v28 = v25 + 2;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 3;
      }
      __src[v28] = v14;
      v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      v30 = a4;
      __src[v29] = v26;
      v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      v35 = BYTE1(v39);
      __src[v34] = v12;
      v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetLNAOffset(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t result;
  int v9;
  int v10;
  char v11;
  char v12;
  unsigned __int16 v13;
  int v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  int v39;
  _BYTE __src[2048];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v9 = gModeId;
    a1[2] = gModeId;
    v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    a1[4] = 81;
    *((_WORD *)a1 + 3) = a3;
    v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    v12 = HIBYTE(a4);
    v13 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0x51];
    v14 = a1[5];
    v15 = crc_16_l_table[(v14 ^ v13 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC]))];
    v16 = crc_16_l_table[(v15 ^ HIBYTE(v13) ^ a3)];
    v17 = crc_16_l_table[(HIBYTE(a3) ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    *((_WORD *)a1 + 5) = v19 ^ ~(unsigned __int16)(v18 >> 8);
    if (a2 >= 24)
    {
      v38 = v19;
      v39 = v19 ^ ~(v18 >> 8);
      bzero(__src, 0x800uLL);
      v20 = *a1;
      if ((v20 - 125) > 1)
      {
        v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        v21 = 1;
      }
      __src[v21] = v20;
      v22 = v21 + 1;
      v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      v24 = v22 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v9;
      v25 = v24 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LOBYTE(v10) = v10 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v26 = a3;
      v27 = &__src[v25];
      *v27 = v10;
      v27[1] = 81;
      v28 = v25 + 2;
      if ((v14 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v28) = v25 + 3;
      }
      __src[v28] = v14;
      v29 = v28 + 1;
      if (a3 - 125 <= 1)
      {
        __src[v29] = 125;
        v26 = a3 ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      v30 = a4;
      __src[v29] = v26;
      v31 = v29 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v31] = v11;
      v32 = v31 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v32] = 125;
        v30 = a4 ^ 0x20;
        LODWORD(v32) = v31 + 2;
      }
      v33 = ~(v38 ^ BYTE1(v18));
      __src[v32] = v30;
      v34 = v32 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v34] = 125;
        v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      v35 = BYTE1(v39);
      __src[v34] = v12;
      v36 = v34 + 1;
      if ((v33 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v36] = v33;
      v37 = v36 + 1;
      if (BYTE1(v39) - 125 <= 1)
      {
        __src[v37] = 125;
        v35 = BYTE1(v39) ^ 0x20;
        LODWORD(v37) = v36 + 2;
      }
      __src[v37] = v35;
      memcpy(a1, __src, v37 + 1);
      result = (v37 + 2);
      a1[v37 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetgModeId(unsigned int a1)
{
  if (a1 > 0x8002)
    return 0xFFFFFFFFLL;
  gModeId = a1;
  return 1;
}

uint64_t APPLIB_DIAG_FTM_SetCalibrationState(_WORD *a1, int a2)
{
  return APPLIB_DIAG_ModeChange(a1, a2, 3u);
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_DVGA(char *a1, int a2, int a3, __int16 a4)
{
  uint64_t result;
  char v9;
  uint64_t v10;
  unsigned __int16 v11;
  int v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[2048];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x14)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1182539;
    a1[4] = 1;
    a1[10] = a3;
    *(_WORD *)(a1 + 11) = a4;
    v9 = HIBYTE(a4);
    v10 = a1[5];
    v11 = crc_16_l_table[v10 ^ 0xF7];
    v12 = a1[6];
    v13 = crc_16_l_table[(v12 ^ v11) ^ 0x57];
    v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v11))];
    v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    v20 = v19 ^ ~(v18 >> 8);
    *(_WORD *)(a1 + 13) = v19 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))]);
    if (a2 >= 30)
    {
      bzero(v40, 0x800uLL);
      v21 = *a1;
      if ((v21 - 125) > 1)
      {
        v22 = 0;
      }
      else
      {
        v40[0] = 125;
        LOBYTE(v21) = v21 ^ 0x20;
        v22 = 1;
      }
      v23 = &v40[v22];
      *v23 = v21;
      *(_DWORD *)(v23 + 1) = 16781835;
      v24 = v22 + 5;
      if ((v10 - 125) <= 1)
      {
        v40[v24] = 125;
        LODWORD(v24) = v22 | 6;
        LOBYTE(v10) = v10 ^ 0x20;
      }
      v40[v24] = v10;
      v25 = v24 + 1;
      if ((v12 - 125) <= 1)
      {
        v40[v25] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v40[v25] = v12;
      v26 = v25 + 1;
      v27 = a1[7];
      if ((v27 - 125) <= 1)
      {
        v40[v26] = 125;
        LODWORD(v26) = v25 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      v40[v26] = v27;
      v28 = v26 + 1;
      v29 = a1[8];
      if ((v29 - 125) <= 1)
      {
        v40[v28] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      v40[v28] = v29;
      v30 = v28 + 1;
      v31 = a1[9];
      if ((v31 - 125) <= 1)
      {
        v40[v30] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v30) = v28 + 2;
      }
      v32 = a4;
      v40[v30] = v31;
      v33 = v30 + 1;
      if ((a3 - 125) <= 1)
      {
        v40[v33] = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v33) = v30 + 2;
      }
      v40[v33] = a3;
      v34 = v33 + 1;
      if (a4 - 125 <= 1)
      {
        v40[v34] = 125;
        LODWORD(v34) = v33 + 2;
        v32 = a4 ^ 0x20;
      }
      v35 = ~(v19 ^ BYTE1(v18));
      v40[v34] = v32;
      v36 = v34 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        v40[v36] = 125;
        v9 = HIBYTE(a4) ^ 0x20;
        LODWORD(v36) = v34 + 2;
      }
      v37 = (unsigned __int16)(v19 ^ ~(unsigned __int16)(v18 >> 8)) >> 8;
      v40[v36] = v9;
      v38 = v36 + 1;
      if ((v35 - 125) <= 1)
      {
        v40[v38] = 125;
        LODWORD(v38) = v36 + 2;
        LOBYTE(v35) = v35 ^ 0x20;
      }
      v40[v38] = v35;
      v39 = v38 + 1;
      if (BYTE1(v20) - 125 <= 1)
      {
        v40[v39] = 125;
        v37 = BYTE1(v20) ^ 0x20;
        LODWORD(v39) = v38 + 2;
      }
      v40[v39] = v37;
      memcpy(a1, v40, v39 + 1);
      result = (v39 + 2);
      a1[v39 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_LNA(unsigned __int8 *a1, int a2, unsigned __int8 a3, __int16 a4, unsigned __int8 a5)
{
  uint64_t result;
  char v11;
  uint64_t v12;
  unsigned __int16 v13;
  int v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  char v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE __src[2048];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x14)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1182539;
    a1[4] = 2;
    a1[10] = a3;
    a1[11] = a5;
    *((_WORD *)a1 + 6) = a4;
    v11 = HIBYTE(a4);
    v12 = a1[5];
    v13 = crc_16_l_table[v12 ^ 0x6C];
    v14 = a1[6];
    v15 = crc_16_l_table[(v14 ^ v13) ^ 0x65];
    v16 = crc_16_l_table[(a1[7] ^ v15 ^ HIBYTE(v13))];
    v17 = crc_16_l_table[(a1[8] ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a1[9] ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a3 ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(a5 ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))] ^ (v20 >> 8)];
    v23 = v22 ^ ~(v21 >> 8);
    *((_WORD *)a1 + 7) = v22 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))]);
    if (a2 >= 32)
    {
      bzero(__src, 0x800uLL);
      v24 = *a1;
      if ((v24 - 125) > 1)
      {
        v25 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v24) = v24 ^ 0x20;
        v25 = 1;
      }
      __src[v25] = v24;
      v26 = v25 + 1;
      v27 = a1[1];
      if ((v27 - 125) <= 1)
      {
        __src[v26] = 125;
        LODWORD(v26) = v25 | 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      __src[v26] = v27;
      v28 = v26 + 1;
      v29 = a1[2];
      if ((v29 - 125) <= 1)
      {
        __src[v28] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      __src[v28] = v29;
      v30 = v28 + 1;
      v31 = a1[3];
      if ((v31 - 125) <= 1)
      {
        __src[v30] = 125;
        LODWORD(v30) = v28 + 2;
        LOBYTE(v31) = v31 ^ 0x20;
      }
      __src[v30] = v31;
      v32 = v30 + 1;
      v33 = a1[4];
      if ((v33 - 125) <= 1)
      {
        __src[v32] = 125;
        LOBYTE(v33) = v33 ^ 0x20;
        LODWORD(v32) = v30 + 2;
      }
      __src[v32] = v33;
      v34 = v32 + 1;
      if ((v12 - 125) <= 1)
      {
        __src[v34] = 125;
        LODWORD(v34) = v32 + 2;
        LOBYTE(v12) = v12 ^ 0x20;
      }
      __src[v34] = v12;
      v35 = v34 + 1;
      if ((v14 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v35) = v34 + 2;
      }
      __src[v35] = v14;
      v36 = v35 + 1;
      v37 = a1[7];
      if ((v37 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v35 + 2;
        LOBYTE(v37) = v37 ^ 0x20;
      }
      __src[v36] = v37;
      v38 = v36 + 1;
      v39 = a1[8];
      if ((v39 - 125) <= 1)
      {
        __src[v38] = 125;
        LOBYTE(v39) = v39 ^ 0x20;
        LODWORD(v38) = v36 + 2;
      }
      __src[v38] = v39;
      v40 = v38 + 1;
      v41 = a1[9];
      if ((v41 - 125) <= 1)
      {
        __src[v40] = 125;
        LODWORD(v40) = v38 + 2;
        LOBYTE(v41) = v41 ^ 0x20;
      }
      __src[v40] = v41;
      v42 = v40 + 1;
      v43 = a1[10];
      if ((v43 - 125) <= 1)
      {
        __src[v42] = 125;
        LOBYTE(v43) = v43 ^ 0x20;
        LODWORD(v42) = v40 + 2;
      }
      v44 = a4;
      __src[v42] = v43;
      v45 = v42 + 1;
      v46 = a1[11];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LODWORD(v45) = v42 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      __src[v45] = v46;
      v47 = v45 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v47] = 125;
        v44 = a4 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      v48 = ~(v22 ^ BYTE1(v21));
      __src[v47] = v44;
      v49 = v47 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v49] = 125;
        v11 = HIBYTE(a4) ^ 0x20;
        LODWORD(v49) = v47 + 2;
      }
      v50 = (unsigned __int16)(v22 ^ ~(unsigned __int16)(v21 >> 8)) >> 8;
      __src[v49] = v11;
      v51 = v49 + 1;
      if ((v48 - 125) <= 1)
      {
        __src[v51] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      __src[v51] = v48;
      v52 = v51 + 1;
      if (BYTE1(v23) - 125 <= 1)
      {
        __src[v52] = 125;
        v50 = BYTE1(v23) ^ 0x20;
        LODWORD(v52) = v51 + 2;
      }
      __src[v52] = v50;
      memcpy(a1, __src, v52 + 1);
      result = (v52 + 2);
      a1[v52 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SecondChainTestCall(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  _BYTE v26[2046];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 123;
  a1[6] = a3;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x7B];
  v10 = a1[5];
  v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  v12 = crc_16_l_table[v11];
  v13 = crc_16_l_table[(v12 ^ HIBYTE(v9) ^ a3)];
  v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18)
    return 0xFFFFFFFFLL;
  bzero(v26, 0x7FEuLL);
  v25 = 2891;
  if ((v7 - 125) <= 1)
  {
    v26[0] = 125;
    v15 = 3;
    v26[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v26[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v26[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v26[v16 - 2];
  *v18 = v8;
  v18[1] = 123;
  v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v26[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v20 = ~(v13 ^ BYTE1(v12));
  v26[v19 - 2] = v10;
  v21 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v26[v21 - 2] = 125;
    v17 = a3 ^ 0x20;
    LODWORD(v21) = v19 + 2;
  }
  v22 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v26[v21 - 2] = v17;
  v23 = v21 + 1;
  if ((v20 - 125) <= 1)
  {
    v26[v23 - 2] = 125;
    LODWORD(v23) = v21 + 2;
    LOBYTE(v20) = v20 ^ 0x20;
  }
  v26[v23 - 2] = v20;
  v24 = v23 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v26[v24 - 2] = 125;
    v22 = BYTE1(v14) ^ 0x20;
    LODWORD(v24) = v23 + 2;
  }
  v26[v24 - 2] = v22;
  memcpy(a1, &v25, v24 + 1);
  result = (v24 + 2);
  a1[v24 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetSecondaryChain(unsigned __int8 *a1, int a2, unsigned __int8 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned __int16 v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  _BYTE v26[2046];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0xE)
    return result;
  bzero(a1, a2);
  *(_WORD *)a1 = 2891;
  v7 = gModeId;
  a1[2] = gModeId;
  v8 = HIBYTE(gModeId);
  a1[3] = HIBYTE(gModeId);
  a1[4] = 121;
  a1[6] = a3;
  v9 = crc_16_l_table[crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC] ^ HIBYTE(crc_16_l_table[v7 ^ 0xA5]) ^ 0x79];
  v10 = a1[5];
  v11 = (v10 ^ v9 ^ HIBYTE(crc_16_l_table[crc_16_l_table[v7 ^ 0xA5] ^ v8 ^ 0xEC]));
  v12 = crc_16_l_table[v11];
  v13 = crc_16_l_table[(v12 ^ HIBYTE(v9) ^ a3)];
  v14 = v13 ^ ~(v12 >> 8);
  *(_WORD *)(a1 + 7) = v13 ^ ~HIBYTE(crc_16_l_table[v11]);
  if (a2 < 18)
    return 0xFFFFFFFFLL;
  bzero(v26, 0x7FEuLL);
  v25 = 2891;
  if ((v7 - 125) <= 1)
  {
    v26[0] = 125;
    v15 = 3;
    v26[1] = v7 ^ 0x20;
    v16 = 4;
    if ((v8 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 2;
  v26[0] = v7;
  v16 = 3;
  if ((v8 - 125) <= 1)
  {
LABEL_9:
    v26[v16 - 2] = 125;
    LOBYTE(v8) = v8 ^ 0x20;
    LODWORD(v16) = v15 + 2;
  }
LABEL_10:
  v17 = a3;
  v18 = &v26[v16 - 2];
  *v18 = v8;
  v18[1] = 121;
  v19 = v16 + 2;
  if ((v10 - 125) <= 1)
  {
    v26[v19 - 2] = 125;
    LOBYTE(v10) = v10 ^ 0x20;
    LODWORD(v19) = v16 + 3;
  }
  v20 = ~(v13 ^ BYTE1(v12));
  v26[v19 - 2] = v10;
  v21 = v19 + 1;
  if (a3 - 125 <= 1)
  {
    v26[v21 - 2] = 125;
    v17 = a3 ^ 0x20;
    LODWORD(v21) = v19 + 2;
  }
  v22 = (unsigned __int16)(v13 ^ ~(unsigned __int16)(v12 >> 8)) >> 8;
  v26[v21 - 2] = v17;
  v23 = v21 + 1;
  if ((v20 - 125) <= 1)
  {
    v26[v23 - 2] = 125;
    LODWORD(v23) = v21 + 2;
    LOBYTE(v20) = v20 ^ 0x20;
  }
  v26[v23 - 2] = v20;
  v24 = v23 + 1;
  if (BYTE1(v14) - 125 <= 1)
  {
    v26[v24 - 2] = 125;
    v22 = BYTE1(v14) ^ 0x20;
    LODWORD(v24) = v23 + 2;
  }
  v26[v24 - 2] = v22;
  memcpy(a1, &v25, v24 + 1);
  result = (v24 + 2);
  a1[v24 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_ChangeFTM_BootMode(char *a1, int a2, char a3)
{
  char __src;

  __src = a3;
  return APPLIB_DIAG_NvItemWrite(a1, a2, 453, &__src, 1);
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_IM2(unsigned __int8 *a1, int a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  unsigned __int16 v8;
  int v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  int __src;
  char v32;
  _BYTE v33[2043];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x14)
    return result;
  bzero(a1, a2);
  *(_DWORD *)a1 = 1182539;
  a1[4] = 3;
  a1[10] = a3;
  v7 = a1[5];
  v8 = crc_16_l_table[v7 ^ 0xE5];
  v9 = a1[6];
  v10 = crc_16_l_table[(v9 ^ v8) ^ 0x74];
  v11 = crc_16_l_table[(a1[7] ^ v10 ^ HIBYTE(v8))];
  v12 = crc_16_l_table[(a1[8] ^ v11 ^ HIBYTE(v10))];
  v13 = crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))];
  v14 = crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ a3];
  v15 = v14 ^ ~(v13 >> 8);
  *((_WORD *)a1 + 6) = v14 ^ ~HIBYTE(crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))]);
  if (a2 < 28)
    return 0xFFFFFFFFLL;
  bzero(v33, 0x7FBuLL);
  __src = 1182539;
  v32 = 3;
  if ((v7 - 125) <= 1)
  {
    v33[0] = 125;
    v16 = 6;
    v33[1] = v7 ^ 0x20;
    v17 = 7;
    if ((v9 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v16 = 5;
  v33[0] = v7;
  v17 = 6;
  if ((v9 - 125) <= 1)
  {
LABEL_9:
    *((_BYTE *)&__src + v17) = 125;
    LODWORD(v17) = v16 + 2;
    LOBYTE(v9) = v9 ^ 0x20;
  }
LABEL_10:
  *((_BYTE *)&__src + v17) = v9;
  v18 = v17 + 1;
  v19 = a1[7];
  if ((v19 - 125) <= 1)
  {
    *((_BYTE *)&__src + v18) = 125;
    LOBYTE(v19) = v19 ^ 0x20;
    LODWORD(v18) = v17 + 2;
  }
  *((_BYTE *)&__src + v18) = v19;
  v20 = v18 + 1;
  v21 = a1[8];
  if ((v21 - 125) <= 1)
  {
    *((_BYTE *)&__src + v20) = 125;
    LODWORD(v20) = v18 + 2;
    LOBYTE(v21) = v21 ^ 0x20;
  }
  *((_BYTE *)&__src + v20) = v21;
  v22 = v20 + 1;
  v23 = a1[9];
  if ((v23 - 125) <= 1)
  {
    *((_BYTE *)&__src + v22) = 125;
    LODWORD(v22) = v20 + 2;
    LOBYTE(v23) = v23 ^ 0x20;
  }
  *((_BYTE *)&__src + v22) = v23;
  v24 = v22 + 1;
  if ((a3 - 125) <= 1)
  {
    *((_BYTE *)&__src + v24) = 125;
    LOBYTE(a3) = a3 ^ 0x20;
    LODWORD(v24) = v22 + 2;
  }
  v25 = ~(v14 ^ BYTE1(v13));
  *((_BYTE *)&__src + v24) = a3;
  v26 = v24 + 1;
  v27 = a1[11];
  if ((v27 - 125) <= 1)
  {
    *((_BYTE *)&__src + v26) = 125;
    LOBYTE(v27) = v27 ^ 0x20;
    LODWORD(v26) = v24 + 2;
  }
  v28 = (unsigned __int16)(v14 ^ ~(unsigned __int16)(v13 >> 8)) >> 8;
  *((_BYTE *)&__src + v26) = v27;
  v29 = v26 + 1;
  if ((v25 - 125) <= 1)
  {
    *((_BYTE *)&__src + v29) = 125;
    LOBYTE(v25) = v25 ^ 0x20;
    LODWORD(v29) = v26 + 2;
  }
  *((_BYTE *)&__src + v29) = v25;
  v30 = v29 + 1;
  if (BYTE1(v15) - 125 <= 1)
  {
    *((_BYTE *)&__src + v30) = 125;
    v28 = BYTE1(v15) ^ 0x20;
    LODWORD(v30) = v29 + 2;
  }
  *((_BYTE *)&__src + v30) = v28;
  memcpy(a1, &__src, v30 + 1);
  result = (v30 + 2);
  a1[v30 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA_API2_CALIBRATE_INTELLICEIVER(char *a1, int a2, int a3, __int16 a4)
{
  uint64_t result;
  char v9;
  uint64_t v10;
  unsigned __int16 v11;
  int v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[2048];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x14)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1182539;
    a1[4] = 4;
    a1[10] = a3;
    *(_WORD *)(a1 + 11) = a4;
    v9 = HIBYTE(a4);
    v10 = a1[5];
    v11 = crc_16_l_table[v10 ^ 0x5A];
    v12 = a1[6];
    v13 = crc_16_l_table[(v12 ^ v11)];
    v14 = crc_16_l_table[(a1[7] ^ v13 ^ HIBYTE(v11))];
    v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))] ^ (v17 >> 8)];
    v20 = v19 ^ ~(v18 >> 8);
    *(_WORD *)(a1 + 13) = v19 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v17 ^ HIBYTE(v16))]);
    if (a2 >= 30)
    {
      bzero(v40, 0x800uLL);
      v21 = *a1;
      if ((v21 - 125) > 1)
      {
        v22 = 0;
      }
      else
      {
        v40[0] = 125;
        LOBYTE(v21) = v21 ^ 0x20;
        v22 = 1;
      }
      v23 = &v40[v22];
      *v23 = v21;
      *(_DWORD *)(v23 + 1) = 67113483;
      v24 = v22 + 5;
      if ((v10 - 125) <= 1)
      {
        v40[v24] = 125;
        LODWORD(v24) = v22 | 6;
        LOBYTE(v10) = v10 ^ 0x20;
      }
      v40[v24] = v10;
      v25 = v24 + 1;
      if ((v12 - 125) <= 1)
      {
        v40[v25] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v25) = v24 + 2;
      }
      v40[v25] = v12;
      v26 = v25 + 1;
      v27 = a1[7];
      if ((v27 - 125) <= 1)
      {
        v40[v26] = 125;
        LODWORD(v26) = v25 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      v40[v26] = v27;
      v28 = v26 + 1;
      v29 = a1[8];
      if ((v29 - 125) <= 1)
      {
        v40[v28] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        LODWORD(v28) = v26 + 2;
      }
      v40[v28] = v29;
      v30 = v28 + 1;
      v31 = a1[9];
      if ((v31 - 125) <= 1)
      {
        v40[v30] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v30) = v28 + 2;
      }
      v32 = a4;
      v40[v30] = v31;
      v33 = v30 + 1;
      if ((a3 - 125) <= 1)
      {
        v40[v33] = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v33) = v30 + 2;
      }
      v40[v33] = a3;
      v34 = v33 + 1;
      if (a4 - 125 <= 1)
      {
        v40[v34] = 125;
        LODWORD(v34) = v33 + 2;
        v32 = a4 ^ 0x20;
      }
      v35 = ~(v19 ^ BYTE1(v18));
      v40[v34] = v32;
      v36 = v34 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        v40[v36] = 125;
        v9 = HIBYTE(a4) ^ 0x20;
        LODWORD(v36) = v34 + 2;
      }
      v37 = (unsigned __int16)(v19 ^ ~(unsigned __int16)(v18 >> 8)) >> 8;
      v40[v36] = v9;
      v38 = v36 + 1;
      if ((v35 - 125) <= 1)
      {
        v40[v38] = 125;
        LODWORD(v38) = v36 + 2;
        LOBYTE(v35) = v35 ^ 0x20;
      }
      v40[v38] = v35;
      v39 = v38 + 1;
      if (BYTE1(v20) - 125 <= 1)
      {
        v40[v39] = 125;
        v37 = BYTE1(v20) ^ 0x20;
        LODWORD(v39) = v38 + 2;
      }
      v40[v39] = v37;
      memcpy(a1, v40, v39 + 1);
      result = (v39 + 2);
      a1[v39 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_DO_ENH_XO_DC_CAL(char *a1, int a2, __int128 *a3)
{
  uint64_t result;
  __int128 v7;
  __int128 v8;
  int v9;
  int v10;
  char *v11;
  char v12;
  uint64_t v13;
  size_t v14;
  int v15;
  int v16;
  _BYTE __src[2048];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x33)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1313611;
    a1[4] = -102;
    a1[8] = 12;
    v7 = *a3;
    v8 = a3[1];
    *(_OWORD *)(a1 + 40) = *(__int128 *)((char *)a3 + 30);
    *(_OWORD *)(a1 + 26) = v8;
    *(_OWORD *)(a1 + 10) = v7;
    v9 = 448;
    LOWORD(v10) = -1;
    v11 = a1;
    do
    {
      v12 = *v11++;
      v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *((_WORD *)a1 + 28) = ~(_WORD)v10;
    if (a2 >= 116)
    {
      bzero(__src, 0x800uLL);
      v13 = 0;
      LODWORD(v14) = 0;
      do
      {
        while (1)
        {
          v16 = a1[v13];
          if ((v16 - 125) > 1)
            break;
          v15 = v14 + 1;
          __src[(int)v14] = 125;
          __src[(int)v14 + 1] = v16 ^ 0x20;
          v14 = (int)v14 + 1 + 1;
          if (++v13 == 58)
            goto LABEL_11;
        }
        v15 = v14;
        __src[(int)v14] = v16;
        v14 = (int)v14 + 1;
        ++v13;
      }
      while (v13 != 58);
LABEL_11:
      memcpy(a1, __src, v14);
      result = (v15 + 2);
      a1[v14] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_DO_ENH_XO_FT_CURVE_CAL(char *a1, int a2, __int128 *a3)
{
  uint64_t result;
  __int128 v7;
  __int128 v8;
  int v9;
  int v10;
  char *v11;
  char v12;
  uint64_t v13;
  size_t v14;
  int v15;
  int v16;
  _BYTE __src[2048];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x33)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 1313611;
    a1[4] = -101;
    a1[8] = 12;
    v7 = *a3;
    v8 = a3[1];
    *(_OWORD *)(a1 + 40) = *(__int128 *)((char *)a3 + 30);
    *(_OWORD *)(a1 + 26) = v8;
    *(_OWORD *)(a1 + 10) = v7;
    v9 = 448;
    LOWORD(v10) = -1;
    v11 = a1;
    do
    {
      v12 = *v11++;
      v10 = crc_16_l_table[(v12 ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
      v9 -= 8;
    }
    while ((_WORD)v9);
    *((_WORD *)a1 + 28) = ~(_WORD)v10;
    if (a2 >= 116)
    {
      bzero(__src, 0x800uLL);
      v13 = 0;
      LODWORD(v14) = 0;
      do
      {
        while (1)
        {
          v16 = a1[v13];
          if ((v16 - 125) > 1)
            break;
          v15 = v14 + 1;
          __src[(int)v14] = 125;
          __src[(int)v14 + 1] = v16 ^ 0x20;
          v14 = (int)v14 + 1 + 1;
          if (++v13 == 58)
            goto LABEL_11;
        }
        v15 = v14;
        __src[(int)v14] = v16;
        v14 = (int)v14 + 1;
        ++v13;
      }
      while (v13 != 58);
LABEL_11:
      memcpy(a1, __src, v14);
      result = (v15 + 2);
      a1[v14] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_PILOT_ACQ(char *a1, int a2, int a3, __int16 a4, int a5)
{
  uint64_t result;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned int v23;
  unsigned __int16 v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE __src[2048];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 100;
    *(_DWORD *)(a1 + 10) = a3;
    *((_WORD *)a1 + 7) = a4;
    *((_DWORD *)a1 + 4) = a5;
    v11 = crc_16_l_table[a1[6] ^ 0x7CLL];
    v12 = crc_16_l_table[a1[7] ^ 0x35 ^ v11];
    v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(BYTE1(a3) ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(BYTE2(a3) ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(HIBYTE(a3) ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a4 ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(HIBYTE(a4) ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(v20 ^ HIBYTE(v19) ^ a5)];
    v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[19] ^ v23 ^ HIBYTE(v22))];
    *((_WORD *)a1 + 10) = v24 ^ ~HIBYTE(crc_16_l_table[(a1[18] ^ v22 ^ HIBYTE(v21))]);
    if (a2 >= 44)
    {
      bzero(__src, 0x800uLL);
      v25 = *a1;
      if ((v25 - 125) > 1)
      {
        v26 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v25) = v25 ^ 0x20;
        v26 = 1;
      }
      __src[v26] = v25;
      v27 = v26 + 1;
      v28 = a1[1];
      if ((v28 - 125) <= 1)
      {
        __src[v27] = 125;
        LODWORD(v27) = v26 | 2;
        LOBYTE(v28) = v28 ^ 0x20;
      }
      __src[v27] = v28;
      v29 = v27 + 1;
      v30 = a1[2];
      if ((v30 - 125) <= 1)
      {
        __src[v29] = 125;
        LOBYTE(v30) = v30 ^ 0x20;
        LODWORD(v29) = v27 + 2;
      }
      __src[v29] = v30;
      v31 = v29 + 1;
      v32 = a1[3];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v29 + 2;
        LOBYTE(v32) = v32 ^ 0x20;
      }
      __src[v31] = v32;
      v33 = v31 + 1;
      v34 = a1[4];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LOBYTE(v34) = v34 ^ 0x20;
        LODWORD(v33) = v31 + 2;
      }
      __src[v33] = v34;
      v35 = v33 + 1;
      v36 = a1[5];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LODWORD(v35) = v33 + 2;
        LOBYTE(v36) = v36 ^ 0x20;
      }
      __src[v35] = v36;
      v37 = v35 + 1;
      v38 = a1[6];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LOBYTE(v38) = v38 ^ 0x20;
        LODWORD(v37) = v35 + 2;
      }
      __src[v37] = v38;
      v39 = v37 + 1;
      v40 = a1[7];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LODWORD(v39) = v37 + 2;
        LOBYTE(v40) = v40 ^ 0x20;
      }
      __src[v39] = v40;
      v41 = v39 + 1;
      v42 = a1[8];
      if ((v42 - 125) <= 1)
      {
        __src[v41] = 125;
        LOBYTE(v42) = v42 ^ 0x20;
        LODWORD(v41) = v39 + 2;
      }
      __src[v41] = v42;
      v43 = v41 + 1;
      v44 = a1[9];
      if ((v44 - 125) <= 1)
      {
        __src[v43] = 125;
        LODWORD(v43) = v41 + 2;
        LOBYTE(v44) = v44 ^ 0x20;
      }
      __src[v43] = v44;
      v45 = v43 + 1;
      v46 = a1[10];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LOBYTE(v46) = v46 ^ 0x20;
        LODWORD(v45) = v43 + 2;
      }
      __src[v45] = v46;
      v47 = v45 + 1;
      v48 = a1[11];
      if ((v48 - 125) <= 1)
      {
        __src[v47] = 125;
        LODWORD(v47) = v45 + 2;
        LOBYTE(v48) = v48 ^ 0x20;
      }
      __src[v47] = v48;
      v49 = v47 + 1;
      v50 = a1[12];
      if ((v50 - 125) <= 1)
      {
        __src[v49] = 125;
        LOBYTE(v50) = v50 ^ 0x20;
        LODWORD(v49) = v47 + 2;
      }
      __src[v49] = v50;
      v51 = v49 + 1;
      v52 = a1[13];
      if ((v52 - 125) <= 1)
      {
        __src[v51] = 125;
        LODWORD(v51) = v49 + 2;
        LOBYTE(v52) = v52 ^ 0x20;
      }
      __src[v51] = v52;
      v53 = v51 + 1;
      v54 = a1[14];
      if ((v54 - 125) <= 1)
      {
        __src[v53] = 125;
        LOBYTE(v54) = v54 ^ 0x20;
        LODWORD(v53) = v51 + 2;
      }
      __src[v53] = v54;
      v55 = v53 + 1;
      v56 = a1[15];
      if ((v56 - 125) <= 1)
      {
        __src[v55] = 125;
        LODWORD(v55) = v53 + 2;
        LOBYTE(v56) = v56 ^ 0x20;
      }
      __src[v55] = v56;
      v57 = v55 + 1;
      v58 = a1[16];
      if ((v58 - 125) <= 1)
      {
        __src[v57] = 125;
        LOBYTE(v58) = v58 ^ 0x20;
        LODWORD(v57) = v55 + 2;
      }
      __src[v57] = v58;
      v59 = v57 + 1;
      v60 = a1[17];
      if ((v60 - 125) <= 1)
      {
        __src[v59] = 125;
        LODWORD(v59) = v57 + 2;
        LOBYTE(v60) = v60 ^ 0x20;
      }
      __src[v59] = v60;
      v61 = v59 + 1;
      v62 = a1[18];
      if ((v62 - 125) <= 1)
      {
        __src[v61] = 125;
        LOBYTE(v62) = v62 ^ 0x20;
        LODWORD(v61) = v59 + 2;
      }
      v63 = ~(v24 ^ BYTE1(v23));
      __src[v61] = v62;
      v64 = v61 + 1;
      v65 = a1[19];
      if ((v65 - 125) <= 1)
      {
        __src[v64] = 125;
        LOBYTE(v65) = v65 ^ 0x20;
        LODWORD(v64) = v61 + 2;
      }
      v66 = ((unsigned __int16)(v24 ^ ~(unsigned __int16)(v23 >> 8)) >> 8);
      __src[v64] = v65;
      v67 = v64 + 1;
      if ((v63 - 125) <= 1)
      {
        __src[v67] = 125;
        LOBYTE(v63) = v63 ^ 0x20;
        LODWORD(v67) = v64 + 2;
      }
      __src[v67] = v63;
      v68 = v67 + 1;
      if ((v66 - 125) <= 1)
      {
        __src[v68] = 125;
        LOBYTE(v66) = v66 ^ 0x20;
        LODWORD(v68) = v67 + 2;
      }
      __src[v68] = v66;
      memcpy(a1, __src, v68 + 1);
      result = (v68 + 2);
      a1[v68 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_DEMOD_SYNC(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  unsigned __int16 v6;
  int v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned int v10;
  unsigned __int16 v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int __src;
  char v25;
  _BYTE v26[2043];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x15)
    return result;
  bzero(a1, a2);
  *(_DWORD *)a1 = 461643;
  a1[4] = 101;
  v5 = a1[5];
  v6 = crc_16_l_table[v5 ^ 0xFD];
  v7 = a1[6];
  v8 = crc_16_l_table[(v7 ^ v6) ^ 0xCE];
  v9 = crc_16_l_table[(a1[7] ^ v8 ^ HIBYTE(v6))];
  v10 = crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))];
  v11 = crc_16_l_table[(a1[9] ^ v10 ^ HIBYTE(v9))];
  *((_WORD *)a1 + 5) = v11 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))]);
  if (a2 < 24)
    return 0xFFFFFFFFLL;
  bzero(v26, 0x7FBuLL);
  __src = 461643;
  v25 = 101;
  if ((v5 - 125) <= 1)
  {
    v26[0] = 125;
    v12 = 6;
    v26[1] = v5 ^ 0x20;
    v13 = 7;
    if ((v7 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v12 = 5;
  v26[0] = v5;
  v13 = 6;
  if ((v7 - 125) <= 1)
  {
LABEL_9:
    *((_BYTE *)&__src + v13) = 125;
    LOBYTE(v7) = v7 ^ 0x20;
    LODWORD(v13) = v12 + 2;
  }
LABEL_10:
  *((_BYTE *)&__src + v13) = v7;
  v14 = v13 + 1;
  v15 = a1[7];
  if ((v15 - 125) <= 1)
  {
    *((_BYTE *)&__src + v14) = 125;
    LODWORD(v14) = v13 + 2;
    LOBYTE(v15) = v15 ^ 0x20;
  }
  *((_BYTE *)&__src + v14) = v15;
  v16 = v14 + 1;
  v17 = a1[8];
  if ((v17 - 125) <= 1)
  {
    *((_BYTE *)&__src + v16) = 125;
    LOBYTE(v17) = v17 ^ 0x20;
    LODWORD(v16) = v14 + 2;
  }
  v18 = ~(v11 ^ BYTE1(v10));
  *((_BYTE *)&__src + v16) = v17;
  v19 = v16 + 1;
  v20 = a1[9];
  if ((v20 - 125) <= 1)
  {
    *((_BYTE *)&__src + v19) = 125;
    LOBYTE(v20) = v20 ^ 0x20;
    LODWORD(v19) = v16 + 2;
  }
  v21 = ((unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8);
  *((_BYTE *)&__src + v19) = v20;
  v22 = v19 + 1;
  if ((v18 - 125) <= 1)
  {
    *((_BYTE *)&__src + v22) = 125;
    LOBYTE(v18) = v18 ^ 0x20;
    LODWORD(v22) = v19 + 2;
  }
  *((_BYTE *)&__src + v22) = v18;
  v23 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    *((_BYTE *)&__src + v23) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  *((_BYTE *)&__src + v23) = v21;
  memcpy(a1, &__src, v23 + 1);
  result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_DEMOD_FCH(char *a1, int a2, int a3, char a4, char a5, char a6, char a7, char a8, char a9, uint64_t a10, char a11, char a12, char a13, char a14)
{
  uint64_t result;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  unsigned __int16 v40;
  unsigned __int16 v41;
  unsigned int v42;
  uint64_t v43;
  size_t v44;
  int v45;
  int v46;
  _BYTE __src[2048];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 102;
    *(_DWORD *)(a1 + 10) = a3;
    a1[14] = a4;
    a1[15] = a5;
    a1[16] = a6;
    a1[17] = a7;
    a1[18] = a8;
    a1[19] = a9;
    *((_DWORD *)a1 + 5) = a10;
    a1[24] = a11;
    a1[25] = a12;
    a1[26] = a13;
    a1[27] = a14;
    v22 = crc_16_l_table[a1[6] ^ 0xCCLL];
    v23 = crc_16_l_table[(a1[7] ^ v22) ^ 6];
    v24 = crc_16_l_table[(a1[8] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[9] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a3 ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(BYTE1(a3) ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(BYTE2(a3) ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(HIBYTE(a3) ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a4 ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a5 ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(a6 ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a7 ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(a8 ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(a9 ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(a10 ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a1[21] ^ v36 ^ HIBYTE(v35))];
    v38 = crc_16_l_table[(a1[22] ^ v37 ^ HIBYTE(v36))];
    v39 = crc_16_l_table[(a1[23] ^ v38 ^ HIBYTE(v37))];
    v40 = crc_16_l_table[(a11 ^ v39 ^ HIBYTE(v38))];
    v41 = crc_16_l_table[(a12 ^ v40 ^ HIBYTE(v39))];
    v42 = crc_16_l_table[(a13 ^ v41 ^ HIBYTE(v40))];
    *((_WORD *)a1 + 14) = crc_16_l_table[(a14 ^ v42 ^ HIBYTE(v41))] ^ ~(unsigned __int16)(v42 >> 8);
    if (a2 >= 60)
    {
      bzero(__src, 0x800uLL);
      v43 = 0;
      LODWORD(v44) = 0;
      do
      {
        while (1)
        {
          v46 = a1[v43];
          if ((v46 - 125) > 1)
            break;
          v45 = v44 + 1;
          __src[(int)v44] = 125;
          __src[(int)v44 + 1] = v46 ^ 0x20;
          v44 = (int)v44 + 1 + 1;
          if (++v43 == 30)
            goto LABEL_9;
        }
        v45 = v44;
        __src[(int)v44] = v46;
        v44 = (int)v44 + 1;
        ++v43;
      }
      while (v43 != 30);
LABEL_9:
      memcpy(a1, __src, v44);
      result = (v45 + 2);
      a1[v44] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_MOD_FCH(char *a1, int a2, int a3, char a4, int a5, char a6, __int16 a7, int a8)
{
  uint64_t result;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned int v37;
  uint64_t v38;
  size_t v39;
  int v40;
  int v41;
  _BYTE __src[2048];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 104;
    *(_DWORD *)(a1 + 10) = a3;
    a1[14] = a4;
    *(_DWORD *)(a1 + 15) = a5;
    a1[19] = a6;
    *((_WORD *)a1 + 10) = a7;
    *((_DWORD *)a1 + 6) = a8;
    v17 = crc_16_l_table[a1[6] ^ 0xDCLL];
    v18 = crc_16_l_table[a1[7] ^ 0x9C ^ v17];
    v19 = crc_16_l_table[(a1[8] ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(a1[9] ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a3 ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(BYTE1(a3) ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(BYTE2(a3) ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(HIBYTE(a3) ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a4 ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a5 ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(BYTE1(a5) ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(BYTE2(a5) ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(HIBYTE(a5) ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a6 ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a7 ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(HIBYTE(a7) ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a1[22] ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(a1[23] ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(a8 ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(a1[25] ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a1[26] ^ v36 ^ HIBYTE(v35))];
    *((_WORD *)a1 + 14) = crc_16_l_table[(a1[27] ^ v37 ^ HIBYTE(v36))] ^ ~(unsigned __int16)(v37 >> 8);
    if (a2 >= 60)
    {
      bzero(__src, 0x800uLL);
      v38 = 0;
      LODWORD(v39) = 0;
      do
      {
        while (1)
        {
          v41 = a1[v38];
          if ((v41 - 125) > 1)
            break;
          v40 = v39 + 1;
          __src[(int)v39] = 125;
          __src[(int)v39 + 1] = v41 ^ 0x20;
          v39 = (int)v39 + 1 + 1;
          if (++v38 == 30)
            goto LABEL_9;
        }
        v40 = v39;
        __src[(int)v39] = v41;
        v39 = (int)v39 + 1;
        ++v38;
      }
      while (v38 != 30);
LABEL_9:
      memcpy(a1, __src, v39);
      result = (v40 + 2);
      a1[v39] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_FTM_FWD_HHO_SC(char *a1, int a2, int a3, __int16 a4, __int16 a5)
{
  uint64_t result;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned int v21;
  unsigned __int16 v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE __src[2048];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 128;
    *(_DWORD *)(a1 + 10) = a3;
    *((_WORD *)a1 + 7) = a4;
    *((_WORD *)a1 + 8) = a5;
    v11 = crc_16_l_table[a1[6] ^ 0x85];
    v12 = crc_16_l_table[(a1[7] ^ v11) ^ 0xBB];
    v13 = crc_16_l_table[(a1[8] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(a1[9] ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(a3 ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(BYTE1(a3) ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(BYTE2(a3) ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(HIBYTE(a3) ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(a4 ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(HIBYTE(a4) ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(v20 ^ HIBYTE(v19) ^ a5)];
    v22 = crc_16_l_table[(a1[17] ^ v21 ^ HIBYTE(v20))];
    *((_WORD *)a1 + 9) = v22 ^ ~HIBYTE(crc_16_l_table[(v20 ^ HIBYTE(v19) ^ a5)]);
    if (a2 >= 40)
    {
      bzero(__src, 0x800uLL);
      v23 = *a1;
      if ((v23 - 125) > 1)
      {
        v24 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v23) = v23 ^ 0x20;
        v24 = 1;
      }
      __src[v24] = v23;
      v25 = v24 + 1;
      v26 = a1[1];
      if ((v26 - 125) <= 1)
      {
        __src[v25] = 125;
        LODWORD(v25) = v24 | 2;
        LOBYTE(v26) = v26 ^ 0x20;
      }
      __src[v25] = v26;
      v27 = v25 + 1;
      v28 = a1[2];
      if ((v28 - 125) <= 1)
      {
        __src[v27] = 125;
        LOBYTE(v28) = v28 ^ 0x20;
        LODWORD(v27) = v25 + 2;
      }
      __src[v27] = v28;
      v29 = v27 + 1;
      v30 = a1[3];
      if ((v30 - 125) <= 1)
      {
        __src[v29] = 125;
        LODWORD(v29) = v27 + 2;
        LOBYTE(v30) = v30 ^ 0x20;
      }
      __src[v29] = v30;
      v31 = v29 + 1;
      v32 = a1[4];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LOBYTE(v32) = v32 ^ 0x20;
        LODWORD(v31) = v29 + 2;
      }
      __src[v31] = v32;
      v33 = v31 + 1;
      v34 = a1[5];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LODWORD(v33) = v31 + 2;
        LOBYTE(v34) = v34 ^ 0x20;
      }
      __src[v33] = v34;
      v35 = v33 + 1;
      v36 = a1[6];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LOBYTE(v36) = v36 ^ 0x20;
        LODWORD(v35) = v33 + 2;
      }
      __src[v35] = v36;
      v37 = v35 + 1;
      v38 = a1[7];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LODWORD(v37) = v35 + 2;
        LOBYTE(v38) = v38 ^ 0x20;
      }
      __src[v37] = v38;
      v39 = v37 + 1;
      v40 = a1[8];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LOBYTE(v40) = v40 ^ 0x20;
        LODWORD(v39) = v37 + 2;
      }
      __src[v39] = v40;
      v41 = v39 + 1;
      v42 = a1[9];
      if ((v42 - 125) <= 1)
      {
        __src[v41] = 125;
        LODWORD(v41) = v39 + 2;
        LOBYTE(v42) = v42 ^ 0x20;
      }
      __src[v41] = v42;
      v43 = v41 + 1;
      v44 = a1[10];
      if ((v44 - 125) <= 1)
      {
        __src[v43] = 125;
        LOBYTE(v44) = v44 ^ 0x20;
        LODWORD(v43) = v41 + 2;
      }
      __src[v43] = v44;
      v45 = v43 + 1;
      v46 = a1[11];
      if ((v46 - 125) <= 1)
      {
        __src[v45] = 125;
        LODWORD(v45) = v43 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      __src[v45] = v46;
      v47 = v45 + 1;
      v48 = a1[12];
      if ((v48 - 125) <= 1)
      {
        __src[v47] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      __src[v47] = v48;
      v49 = v47 + 1;
      v50 = a1[13];
      if ((v50 - 125) <= 1)
      {
        __src[v49] = 125;
        LODWORD(v49) = v47 + 2;
        LOBYTE(v50) = v50 ^ 0x20;
      }
      __src[v49] = v50;
      v51 = v49 + 1;
      v52 = a1[14];
      if ((v52 - 125) <= 1)
      {
        __src[v51] = 125;
        LOBYTE(v52) = v52 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      __src[v51] = v52;
      v53 = v51 + 1;
      v54 = a1[15];
      if ((v54 - 125) <= 1)
      {
        __src[v53] = 125;
        LODWORD(v53) = v51 + 2;
        LOBYTE(v54) = v54 ^ 0x20;
      }
      __src[v53] = v54;
      v55 = v53 + 1;
      v56 = a1[16];
      if ((v56 - 125) <= 1)
      {
        __src[v55] = 125;
        LOBYTE(v56) = v56 ^ 0x20;
        LODWORD(v55) = v53 + 2;
      }
      v57 = ~(v22 ^ BYTE1(v21));
      __src[v55] = v56;
      v58 = v55 + 1;
      v59 = a1[17];
      if ((v59 - 125) <= 1)
      {
        __src[v58] = 125;
        LOBYTE(v59) = v59 ^ 0x20;
        LODWORD(v58) = v55 + 2;
      }
      v60 = ((unsigned __int16)(v22 ^ ~(unsigned __int16)(v21 >> 8)) >> 8);
      __src[v58] = v59;
      v61 = v58 + 1;
      if ((v57 - 125) <= 1)
      {
        __src[v61] = 125;
        LOBYTE(v57) = v57 ^ 0x20;
        LODWORD(v61) = v58 + 2;
      }
      __src[v61] = v57;
      v62 = v61 + 1;
      if ((v60 - 125) <= 1)
      {
        __src[v62] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v62) = v61 + 2;
      }
      __src[v62] = v60;
      memcpy(a1, __src, v62 + 1);
      result = (v62 + 2);
      a1[v62 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_CMD_RELEASE(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  unsigned __int16 v6;
  int v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned int v10;
  unsigned __int16 v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int __src;
  char v25;
  _BYTE v26[2043];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x33)
    return result;
  bzero(a1, a2);
  *(_DWORD *)a1 = 461643;
  a1[4] = 108;
  v5 = a1[5];
  v6 = crc_16_l_table[v5 ^ 0x3C];
  v7 = a1[6];
  v8 = crc_16_l_table[(v7 ^ v6) ^ 0x53];
  v9 = crc_16_l_table[(a1[7] ^ v8 ^ HIBYTE(v6))];
  v10 = crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))];
  v11 = crc_16_l_table[(a1[9] ^ v10 ^ HIBYTE(v9))];
  *((_WORD *)a1 + 5) = v11 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v9 ^ HIBYTE(v8))]);
  if (a2 < 24)
    return 0xFFFFFFFFLL;
  bzero(v26, 0x7FBuLL);
  __src = 461643;
  v25 = 108;
  if ((v5 - 125) <= 1)
  {
    v26[0] = 125;
    v12 = 6;
    v26[1] = v5 ^ 0x20;
    v13 = 7;
    if ((v7 - 125) > 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  v12 = 5;
  v26[0] = v5;
  v13 = 6;
  if ((v7 - 125) <= 1)
  {
LABEL_9:
    *((_BYTE *)&__src + v13) = 125;
    LOBYTE(v7) = v7 ^ 0x20;
    LODWORD(v13) = v12 + 2;
  }
LABEL_10:
  *((_BYTE *)&__src + v13) = v7;
  v14 = v13 + 1;
  v15 = a1[7];
  if ((v15 - 125) <= 1)
  {
    *((_BYTE *)&__src + v14) = 125;
    LODWORD(v14) = v13 + 2;
    LOBYTE(v15) = v15 ^ 0x20;
  }
  *((_BYTE *)&__src + v14) = v15;
  v16 = v14 + 1;
  v17 = a1[8];
  if ((v17 - 125) <= 1)
  {
    *((_BYTE *)&__src + v16) = 125;
    LOBYTE(v17) = v17 ^ 0x20;
    LODWORD(v16) = v14 + 2;
  }
  v18 = ~(v11 ^ BYTE1(v10));
  *((_BYTE *)&__src + v16) = v17;
  v19 = v16 + 1;
  v20 = a1[9];
  if ((v20 - 125) <= 1)
  {
    *((_BYTE *)&__src + v19) = 125;
    LOBYTE(v20) = v20 ^ 0x20;
    LODWORD(v19) = v16 + 2;
  }
  v21 = ((unsigned __int16)(v11 ^ ~(unsigned __int16)(v10 >> 8)) >> 8);
  *((_BYTE *)&__src + v19) = v20;
  v22 = v19 + 1;
  if ((v18 - 125) <= 1)
  {
    *((_BYTE *)&__src + v22) = 125;
    LOBYTE(v18) = v18 ^ 0x20;
    LODWORD(v22) = v19 + 2;
  }
  *((_BYTE *)&__src + v22) = v18;
  v23 = v22 + 1;
  if ((v21 - 125) <= 1)
  {
    *((_BYTE *)&__src + v23) = 125;
    LOBYTE(v21) = v21 ^ 0x20;
    LODWORD(v23) = v22 + 2;
  }
  *((_BYTE *)&__src + v23) = v21;
  memcpy(a1, &__src, v23 + 1);
  result = (v23 + 2);
  a1[v23 + 1] = 126;
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_PILOT_ACQ(char *a1, int a2, int a3, __int16 a4, int a5, int a6)
{
  uint64_t result;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned int v29;
  uint64_t v30;
  size_t v31;
  int v32;
  int v33;
  _BYTE __src[2048];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x23)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 113;
    *(_DWORD *)(a1 + 10) = a3;
    *((_WORD *)a1 + 7) = a4;
    *((_DWORD *)a1 + 4) = a5;
    *((_DWORD *)a1 + 5) = a6;
    v13 = crc_16_l_table[a1[6] ^ 0xACLL];
    v14 = crc_16_l_table[a1[7] ^ 0x6C ^ v13];
    v15 = crc_16_l_table[(a1[8] ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[9] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a3 ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(BYTE1(a3) ^ v17 ^ HIBYTE(v16))];
    v19 = crc_16_l_table[(BYTE2(a3) ^ v18 ^ HIBYTE(v17))];
    v20 = crc_16_l_table[(HIBYTE(a3) ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a4 ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(HIBYTE(a4) ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a5 ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[17] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[18] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a1[19] ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a6 ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a1[21] ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a1[22] ^ v28 ^ HIBYTE(v27))];
    *((_WORD *)a1 + 12) = crc_16_l_table[(a1[23] ^ v29 ^ HIBYTE(v28))] ^ ~(unsigned __int16)(v29 >> 8);
    if (a2 >= 52)
    {
      bzero(__src, 0x800uLL);
      v30 = 0;
      LODWORD(v31) = 0;
      do
      {
        while (1)
        {
          v33 = a1[v30];
          if ((v33 - 125) > 1)
            break;
          v32 = v31 + 1;
          __src[(int)v31] = 125;
          __src[(int)v31 + 1] = v33 ^ 0x20;
          v31 = (int)v31 + 1 + 1;
          if (++v30 == 26)
            goto LABEL_9;
        }
        v32 = v31;
        __src[(int)v31] = v33;
        v31 = (int)v31 + 1;
        ++v30;
      }
      while (v30 != 26);
LABEL_9:
      memcpy(a1, __src, v31);
      result = (v32 + 2);
      a1[v31] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_SYS_TIME_ACQ(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  unsigned __int16 v5;
  unsigned int v6;
  unsigned __int16 v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int __src;
  __int16 v19;
  char v20;
  char v21[2041];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 114;
    a1[6] = 10;
    v5 = crc_16_l_table[a1[7] ^ 0x34];
    v6 = crc_16_l_table[a1[8] ^ 0x2F ^ v5];
    v7 = crc_16_l_table[(a1[9] ^ v6 ^ HIBYTE(v5))];
    *((_WORD *)a1 + 5) = v7 ^ ~HIBYTE(crc_16_l_table[a1[8] ^ 0x2F ^ v5]);
    if (a2 >= 24)
    {
      bzero(v21, 0x7F9uLL);
      __src = 527179;
      v19 = 114;
      v20 = 10;
      v8 = a1[7];
      if ((v8 - 125) > 1)
      {
        v9 = 7;
      }
      else
      {
        v21[0] = 125;
        LOBYTE(v8) = v8 ^ 0x20;
        v9 = 8;
      }
      *((_BYTE *)&__src + v9) = v8;
      v10 = v9 + 1;
      v11 = a1[8];
      if ((v11 - 125) <= 1)
      {
        *((_BYTE *)&__src + v10) = 125;
        LODWORD(v10) = v9 + 2;
        LOBYTE(v11) = v11 ^ 0x20;
      }
      v12 = ~(v7 ^ BYTE1(v6));
      *((_BYTE *)&__src + v10) = v11;
      v13 = v10 + 1;
      v14 = a1[9];
      if ((v14 - 125) <= 1)
      {
        *((_BYTE *)&__src + v13) = 125;
        LOBYTE(v14) = v14 ^ 0x20;
        LODWORD(v13) = v10 + 2;
      }
      v15 = ((unsigned __int16)(v7 ^ ~(unsigned __int16)(v6 >> 8)) >> 8);
      *((_BYTE *)&__src + v13) = v14;
      v16 = v13 + 1;
      if ((v12 - 125) <= 1)
      {
        *((_BYTE *)&__src + v16) = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v16) = v13 + 2;
      }
      *((_BYTE *)&__src + v16) = v12;
      v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        *((_BYTE *)&__src + v17) = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      *((_BYTE *)&__src + v17) = v15;
      memcpy(a1, &__src, v17 + 1);
      result = (v17 + 2);
      a1[v17 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_DEMOD_CC_MAC_FTC(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8)
{
  uint64_t result;
  uint64_t v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  int v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE __src[2048];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1B)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 115;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    v17 = a1[6];
    v18 = crc_16_l_table[v17 ^ 0x1C];
    v19 = crc_16_l_table[a1[7] ^ 0x5F ^ v18];
    v20 = crc_16_l_table[(a1[8] ^ v19 ^ HIBYTE(v18))];
    v21 = crc_16_l_table[(a1[9] ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(a3 ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a4 ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a5 ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a6 ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a7 ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(v26 ^ HIBYTE(v25) ^ a8)];
    v28 = v27 ^ ~(v26 >> 8);
    *((_WORD *)a1 + 8) = v27 ^ ~(unsigned __int16)(v26 >> 8);
    if (a2 >= 36)
    {
      bzero(__src, 0x800uLL);
      v29 = *a1;
      if ((v29 - 125) > 1)
      {
        v30 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v29) = v29 ^ 0x20;
        v30 = 1;
      }
      __src[v30] = v29;
      v31 = v30 + 1;
      v32 = a1[1];
      if ((v32 - 125) <= 1)
      {
        __src[v31] = 125;
        LODWORD(v31) = v30 | 2;
        LOBYTE(v32) = v32 ^ 0x20;
      }
      __src[v31] = v32;
      v33 = v31 + 1;
      v34 = a1[2];
      if ((v34 - 125) <= 1)
      {
        __src[v33] = 125;
        LOBYTE(v34) = v34 ^ 0x20;
        LODWORD(v33) = v31 + 2;
      }
      __src[v33] = v34;
      v35 = v33 + 1;
      v36 = a1[3];
      if ((v36 - 125) <= 1)
      {
        __src[v35] = 125;
        LODWORD(v35) = v33 + 2;
        LOBYTE(v36) = v36 ^ 0x20;
      }
      __src[v35] = v36;
      v37 = v35 + 1;
      v38 = a1[4];
      if ((v38 - 125) <= 1)
      {
        __src[v37] = 125;
        LOBYTE(v38) = v38 ^ 0x20;
        LODWORD(v37) = v35 + 2;
      }
      __src[v37] = v38;
      v39 = v37 + 1;
      v40 = a1[5];
      if ((v40 - 125) <= 1)
      {
        __src[v39] = 125;
        LODWORD(v39) = v37 + 2;
        LOBYTE(v40) = v40 ^ 0x20;
      }
      __src[v39] = v40;
      v41 = v39 + 1;
      if ((v17 - 125) <= 1)
      {
        __src[v41] = 125;
        LOBYTE(v17) = v17 ^ 0x20;
        LODWORD(v41) = v39 + 2;
      }
      __src[v41] = v17;
      v42 = v41 + 1;
      v43 = a1[7];
      if ((v43 - 125) <= 1)
      {
        __src[v42] = 125;
        LODWORD(v42) = v41 + 2;
        LOBYTE(v43) = v43 ^ 0x20;
      }
      __src[v42] = v43;
      v44 = v42 + 1;
      v45 = a1[8];
      if ((v45 - 125) <= 1)
      {
        __src[v44] = 125;
        LOBYTE(v45) = v45 ^ 0x20;
        LODWORD(v44) = v42 + 2;
      }
      __src[v44] = v45;
      v46 = v44 + 1;
      v47 = a1[9];
      if ((v47 - 125) <= 1)
      {
        __src[v46] = 125;
        LODWORD(v46) = v44 + 2;
        LOBYTE(v47) = v47 ^ 0x20;
      }
      __src[v46] = v47;
      v48 = v46 + 1;
      v49 = a1[10];
      if ((v49 - 125) <= 1)
      {
        __src[v48] = 125;
        LOBYTE(v49) = v49 ^ 0x20;
        LODWORD(v48) = v46 + 2;
      }
      __src[v48] = v49;
      v50 = v48 + 1;
      v51 = a1[11];
      if ((v51 - 125) <= 1)
      {
        __src[v50] = 125;
        LODWORD(v50) = v48 + 2;
        LOBYTE(v51) = v51 ^ 0x20;
      }
      __src[v50] = v51;
      v52 = v50 + 1;
      v53 = a1[12];
      if ((v53 - 125) <= 1)
      {
        __src[v52] = 125;
        LOBYTE(v53) = v53 ^ 0x20;
        LODWORD(v52) = v50 + 2;
      }
      __src[v52] = v53;
      v54 = v52 + 1;
      v55 = a1[13];
      if ((v55 - 125) <= 1)
      {
        __src[v54] = 125;
        LODWORD(v54) = v52 + 2;
        LOBYTE(v55) = v55 ^ 0x20;
      }
      __src[v54] = v55;
      v56 = v54 + 1;
      v57 = a1[14];
      if ((v57 - 125) <= 1)
      {
        __src[v56] = 125;
        LOBYTE(v57) = v57 ^ 0x20;
        LODWORD(v56) = v54 + 2;
      }
      v58 = ~(v27 ^ BYTE1(v26));
      __src[v56] = v57;
      v59 = v56 + 1;
      v60 = a1[15];
      if ((v60 - 125) <= 1)
      {
        __src[v59] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v59) = v56 + 2;
      }
      v61 = (unsigned __int16)(v27 ^ ~(unsigned __int16)(v26 >> 8)) >> 8;
      __src[v59] = v60;
      v62 = v59 + 1;
      if ((v58 - 125) <= 1)
      {
        __src[v62] = 125;
        LOBYTE(v58) = v58 ^ 0x20;
        LODWORD(v62) = v59 + 2;
      }
      __src[v62] = v58;
      v63 = v62 + 1;
      if (BYTE1(v28) - 125 <= 1)
      {
        __src[v63] = 125;
        v61 = BYTE1(v28) ^ 0x20;
        LODWORD(v63) = v62 + 2;
      }
      __src[v63] = v61;
      memcpy(a1, __src, v63 + 1);
      result = (v63 + 2);
      a1[v63 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_MOD_ACC(char *a1, int a2, int a3, int a4, int a5, int a6, int a7, char a8, char a9, char a10, char a11, char a12, char a13)
{
  uint64_t result;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  unsigned __int16 v40;
  unsigned __int16 v41;
  unsigned __int16 v42;
  unsigned __int16 v43;
  unsigned __int16 v44;
  unsigned __int16 v45;
  unsigned __int16 v46;
  unsigned __int16 v47;
  unsigned __int16 v48;
  unsigned int v49;
  uint64_t v50;
  size_t v51;
  int v52;
  int v53;
  _BYTE __src[2048];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x2F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 116;
    *(_DWORD *)(a1 + 10) = a3;
    *(_DWORD *)(a1 + 14) = a4;
    *(_DWORD *)(a1 + 18) = a5;
    *(_DWORD *)(a1 + 22) = a6;
    *(_DWORD *)(a1 + 26) = a7;
    a1[30] = a8;
    a1[31] = a9;
    a1[32] = a10;
    a1[33] = a11;
    a1[34] = a12;
    a1[35] = a13;
    v21 = crc_16_l_table[a1[6] ^ 0x14];
    v22 = crc_16_l_table[a1[7] ^ 0x12 ^ v21];
    v23 = crc_16_l_table[(a1[8] ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a1[9] ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a1[10] ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a1[11] ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a1[12] ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a1[13] ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a1[14] ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a1[15] ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a1[16] ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(HIBYTE(a4) ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a5 ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(BYTE1(a5) ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(BYTE2(a5) ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(HIBYTE(a5) ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a6 ^ v36 ^ HIBYTE(v35))];
    v38 = crc_16_l_table[(BYTE1(a6) ^ v37 ^ HIBYTE(v36))];
    v39 = crc_16_l_table[(BYTE2(a6) ^ v38 ^ HIBYTE(v37))];
    v40 = crc_16_l_table[(HIBYTE(a6) ^ v39 ^ HIBYTE(v38))];
    v41 = crc_16_l_table[(a7 ^ v40 ^ HIBYTE(v39))];
    v42 = crc_16_l_table[(BYTE1(a7) ^ v41 ^ HIBYTE(v40))];
    v43 = crc_16_l_table[(BYTE2(a7) ^ v42 ^ HIBYTE(v41))];
    v44 = crc_16_l_table[(HIBYTE(a7) ^ v43 ^ HIBYTE(v42))];
    v45 = crc_16_l_table[(a8 ^ v44 ^ HIBYTE(v43))];
    v46 = crc_16_l_table[(a9 ^ v45 ^ HIBYTE(v44))];
    v47 = crc_16_l_table[(a10 ^ v46 ^ HIBYTE(v45))];
    v48 = crc_16_l_table[(a11 ^ v47 ^ HIBYTE(v46))];
    v49 = crc_16_l_table[(a12 ^ v48 ^ HIBYTE(v47))];
    *((_WORD *)a1 + 18) = crc_16_l_table[(v49 ^ HIBYTE(v48) ^ a13)] ^ ~(unsigned __int16)(v49 >> 8);
    if (a2 >= 76)
    {
      bzero(__src, 0x800uLL);
      v50 = 0;
      LODWORD(v51) = 0;
      do
      {
        while (1)
        {
          v53 = a1[v50];
          if ((v53 - 125) > 1)
            break;
          v52 = v51 + 1;
          __src[(int)v51] = 125;
          __src[(int)v51 + 1] = v53 ^ 0x20;
          v51 = (int)v51 + 1 + 1;
          if (++v50 == 38)
            goto LABEL_9;
        }
        v52 = v51;
        __src[(int)v51] = v53;
        v51 = (int)v51 + 1;
        ++v50;
      }
      while (v50 != 38);
LABEL_9:
      memcpy(a1, __src, v51);
      result = (v52 + 2);
      a1[v51] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_CONF_MAC_FOR_FWD_CC_MAC_FTC(unsigned __int8 *a1, int a2, int a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  int __src;
  __int16 v31;
  char v32[2042];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1B)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 124;
    a1[10] = a3;
    a1[11] = a4;
    v9 = a1[6];
    v10 = crc_16_l_table[v9 ^ 0xD4];
    v11 = crc_16_l_table[a1[7] ^ 0xDC ^ v10];
    v12 = crc_16_l_table[(a1[8] ^ v11 ^ HIBYTE(v10))];
    v13 = crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(a3 ^ v13 ^ HIBYTE(v12))];
    v15 = crc_16_l_table[(v14 ^ HIBYTE(v13)) ^ a4];
    v16 = v15 ^ ~(v14 >> 8);
    *((_WORD *)a1 + 6) = v15 ^ ~HIBYTE(crc_16_l_table[(a3 ^ v13 ^ HIBYTE(v12))]);
    if (a2 >= 28)
    {
      bzero(v32, 0x7FAuLL);
      __src = 527179;
      v31 = 124;
      if ((v9 - 125) > 1)
      {
        v17 = 6;
      }
      else
      {
        v32[0] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        v17 = 7;
      }
      *((_BYTE *)&__src + v17) = v9;
      v18 = v17 + 1;
      v19 = a1[7];
      if ((v19 - 125) <= 1)
      {
        *((_BYTE *)&__src + v18) = 125;
        LODWORD(v18) = v17 + 2;
        LOBYTE(v19) = v19 ^ 0x20;
      }
      *((_BYTE *)&__src + v18) = v19;
      v20 = v18 + 1;
      v21 = a1[8];
      if ((v21 - 125) <= 1)
      {
        *((_BYTE *)&__src + v20) = 125;
        LOBYTE(v21) = v21 ^ 0x20;
        LODWORD(v20) = v18 + 2;
      }
      *((_BYTE *)&__src + v20) = v21;
      v22 = v20 + 1;
      v23 = a1[9];
      if ((v23 - 125) <= 1)
      {
        *((_BYTE *)&__src + v22) = 125;
        LODWORD(v22) = v20 + 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      *((_BYTE *)&__src + v22) = v23;
      v24 = v22 + 1;
      if ((a3 - 125) <= 1)
      {
        *((_BYTE *)&__src + v24) = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      v25 = ~(v15 ^ BYTE1(v14));
      *((_BYTE *)&__src + v24) = a3;
      v26 = v24 + 1;
      if ((a4 - 125) <= 1)
      {
        *((_BYTE *)&__src + v26) = 125;
        LOBYTE(a4) = a4 ^ 0x20;
        LODWORD(v26) = v24 + 2;
      }
      v27 = (unsigned __int16)(v15 ^ ~(unsigned __int16)(v14 >> 8)) >> 8;
      *((_BYTE *)&__src + v26) = a4;
      v28 = v26 + 1;
      if ((v25 - 125) <= 1)
      {
        *((_BYTE *)&__src + v28) = 125;
        LODWORD(v28) = v26 + 2;
        LOBYTE(v25) = v25 ^ 0x20;
      }
      *((_BYTE *)&__src + v28) = v25;
      v29 = v28 + 1;
      if (BYTE1(v16) - 125 <= 1)
      {
        *((_BYTE *)&__src + v29) = 125;
        v27 = BYTE1(v16) ^ 0x20;
        LODWORD(v29) = v28 + 2;
      }
      *((_BYTE *)&__src + v29) = v27;
      memcpy(a1, &__src, v29 + 1);
      result = (v29 + 2);
      a1[v29 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_MOD_ACC(char *a1, int a2, int a3, int a4, int a5, int a6, int a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, char a18)
{
  uint64_t result;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  unsigned __int16 v40;
  unsigned __int16 v41;
  unsigned __int16 v42;
  unsigned __int16 v43;
  unsigned __int16 v44;
  unsigned __int16 v45;
  unsigned __int16 v46;
  unsigned __int16 v47;
  unsigned __int16 v48;
  unsigned __int16 v49;
  unsigned __int16 v50;
  unsigned __int16 v51;
  unsigned __int16 v52;
  unsigned __int16 v53;
  unsigned __int16 v54;
  unsigned __int16 v55;
  unsigned __int16 v56;
  unsigned __int16 v57;
  unsigned __int16 v58;
  unsigned __int16 v59;
  unsigned __int16 v60;
  unsigned __int16 v61;
  unsigned __int16 v62;
  unsigned __int16 v63;
  unsigned __int16 v64;
  unsigned int v65;
  uint64_t v66;
  size_t v67;
  int v68;
  int v69;
  _BYTE __src[2048];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x35)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 125;
    *(_DWORD *)(a1 + 10) = a3;
    *(_DWORD *)(a1 + 14) = a4;
    *(_DWORD *)(a1 + 18) = a5;
    *(_DWORD *)(a1 + 22) = a6;
    *(_DWORD *)(a1 + 26) = a7;
    a1[30] = a8;
    a1[31] = a9;
    a1[32] = a10;
    a1[33] = a11;
    a1[34] = a12;
    a1[35] = a13;
    a1[36] = a14;
    a1[37] = a15;
    a1[38] = a16;
    a1[39] = a17;
    a1[40] = a18;
    v26 = crc_16_l_table[~*a1];
    v27 = crc_16_l_table[(a1[1] ^ ~(_BYTE)v26)];
    v28 = crc_16_l_table[(a1[2] ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a1[3] ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a1[4] ^ v29 ^ HIBYTE(v28))];
    v31 = crc_16_l_table[(a1[5] ^ v30 ^ HIBYTE(v29))];
    v32 = crc_16_l_table[(a1[6] ^ v31 ^ HIBYTE(v30))];
    v33 = crc_16_l_table[(a1[7] ^ v32 ^ HIBYTE(v31))];
    v34 = crc_16_l_table[(a1[8] ^ v33 ^ HIBYTE(v32))];
    v35 = crc_16_l_table[(a1[9] ^ v34 ^ HIBYTE(v33))];
    v36 = crc_16_l_table[(a1[10] ^ v35 ^ HIBYTE(v34))];
    v37 = crc_16_l_table[(a1[11] ^ v36 ^ HIBYTE(v35))];
    v38 = crc_16_l_table[(a1[12] ^ v37 ^ HIBYTE(v36))];
    v39 = crc_16_l_table[(a1[13] ^ v38 ^ HIBYTE(v37))];
    v40 = crc_16_l_table[(a1[14] ^ v39 ^ HIBYTE(v38))];
    v41 = crc_16_l_table[(a1[15] ^ v40 ^ HIBYTE(v39))];
    v42 = crc_16_l_table[(a1[16] ^ v41 ^ HIBYTE(v40))];
    v43 = crc_16_l_table[(a1[17] ^ v42 ^ HIBYTE(v41))];
    v44 = crc_16_l_table[(a1[18] ^ v43 ^ HIBYTE(v42))];
    v45 = crc_16_l_table[(a1[19] ^ v44 ^ HIBYTE(v43))];
    v46 = crc_16_l_table[(a1[20] ^ v45 ^ HIBYTE(v44))];
    v47 = crc_16_l_table[(a1[21] ^ v46 ^ HIBYTE(v45))];
    v48 = crc_16_l_table[(a6 ^ v47 ^ HIBYTE(v46))];
    v49 = crc_16_l_table[(BYTE1(a6) ^ v48 ^ HIBYTE(v47))];
    v50 = crc_16_l_table[(BYTE2(a6) ^ v49 ^ HIBYTE(v48))];
    v51 = crc_16_l_table[(HIBYTE(a6) ^ v50 ^ HIBYTE(v49))];
    v52 = crc_16_l_table[(a7 ^ v51 ^ HIBYTE(v50))];
    v53 = crc_16_l_table[(BYTE1(a7) ^ v52 ^ HIBYTE(v51))];
    v54 = crc_16_l_table[(BYTE2(a7) ^ v53 ^ HIBYTE(v52))];
    v55 = crc_16_l_table[(HIBYTE(a7) ^ v54 ^ HIBYTE(v53))];
    v56 = crc_16_l_table[(a8 ^ v55 ^ HIBYTE(v54))];
    v57 = crc_16_l_table[(a9 ^ v56 ^ HIBYTE(v55))];
    v58 = crc_16_l_table[(a10 ^ v57 ^ HIBYTE(v56))];
    v59 = crc_16_l_table[(a11 ^ v58 ^ HIBYTE(v57))];
    v60 = crc_16_l_table[(a12 ^ v59 ^ HIBYTE(v58))];
    v61 = crc_16_l_table[(a13 ^ v60 ^ HIBYTE(v59))];
    v62 = crc_16_l_table[(a14 ^ v61 ^ HIBYTE(v60))];
    v63 = crc_16_l_table[(a15 ^ v62 ^ HIBYTE(v61))];
    v64 = crc_16_l_table[(a16 ^ v63 ^ HIBYTE(v62))];
    v65 = crc_16_l_table[(a17 ^ v64 ^ HIBYTE(v63))];
    *(_WORD *)(a1 + 41) = crc_16_l_table[(v65 ^ HIBYTE(v64) ^ a18)] ^ ~(unsigned __int16)(v65 >> 8);
    if (a2 >= 86)
    {
      bzero(__src, 0x800uLL);
      v66 = 0;
      LODWORD(v67) = 0;
      do
      {
        while (1)
        {
          v69 = a1[v66];
          if ((v69 - 125) > 1)
            break;
          v68 = v67 + 1;
          __src[(int)v67] = 125;
          __src[(int)v67 + 1] = v69 ^ 0x20;
          v67 = (int)v67 + 1 + 1;
          if (++v66 == 43)
            goto LABEL_9;
        }
        v68 = v67;
        __src[(int)v67] = v69;
        v67 = (int)v67 + 1;
        ++v66;
      }
      while (v66 != 43);
LABEL_9:
      memcpy(a1, __src, v67);
      result = (v68 + 2);
      a1[v67] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_DEMOD_FWD_WITH_NO_REV(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8, char a9, char a10, char a11)
{
  uint64_t result;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  uint64_t v31;
  unsigned int v32;
  unsigned __int16 v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE __src[2048];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x35)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 127;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    a1[18] = a11;
    v20 = crc_16_l_table[a1[6] ^ 0xBCLL];
    v21 = crc_16_l_table[a1[7] ^ 0xF6 ^ v20];
    v22 = crc_16_l_table[(a1[8] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a1[9] ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a3 ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a4 ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a5 ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a6 ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a7 ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a8 ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(a9 ^ v29 ^ HIBYTE(v28))];
    v31 = (a10 ^ v30 ^ HIBYTE(v29));
    v32 = crc_16_l_table[v31];
    v33 = crc_16_l_table[(v32 ^ HIBYTE(v30) ^ a11)];
    *(_WORD *)(a1 + 19) = v33 ^ ~HIBYTE(crc_16_l_table[v31]);
    if (a2 >= 42)
    {
      bzero(__src, 0x800uLL);
      v34 = *a1;
      if ((v34 - 125) > 1)
      {
        v35 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v34) = v34 ^ 0x20;
        v35 = 1;
      }
      __src[v35] = v34;
      v36 = v35 + 1;
      v37 = a1[1];
      if ((v37 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v35 | 2;
        LOBYTE(v37) = v37 ^ 0x20;
      }
      __src[v36] = v37;
      v38 = v36 + 1;
      v39 = a1[2];
      if ((v39 - 125) <= 1)
      {
        __src[v38] = 125;
        LOBYTE(v39) = v39 ^ 0x20;
        LODWORD(v38) = v36 + 2;
      }
      __src[v38] = v39;
      v40 = v38 + 1;
      v41 = a1[3];
      if ((v41 - 125) <= 1)
      {
        __src[v40] = 125;
        LODWORD(v40) = v38 + 2;
        LOBYTE(v41) = v41 ^ 0x20;
      }
      __src[v40] = v41;
      v42 = v40 + 1;
      v43 = a1[4];
      if ((v43 - 125) <= 1)
      {
        __src[v42] = 125;
        LOBYTE(v43) = v43 ^ 0x20;
        LODWORD(v42) = v40 + 2;
      }
      __src[v42] = v43;
      v44 = v42 + 1;
      v45 = a1[5];
      if ((v45 - 125) <= 1)
      {
        __src[v44] = 125;
        LODWORD(v44) = v42 + 2;
        LOBYTE(v45) = v45 ^ 0x20;
      }
      __src[v44] = v45;
      v46 = v44 + 1;
      v47 = a1[6];
      if ((v47 - 125) <= 1)
      {
        __src[v46] = 125;
        LOBYTE(v47) = v47 ^ 0x20;
        LODWORD(v46) = v44 + 2;
      }
      __src[v46] = v47;
      v48 = v46 + 1;
      v49 = a1[7];
      if ((v49 - 125) <= 1)
      {
        __src[v48] = 125;
        LODWORD(v48) = v46 + 2;
        LOBYTE(v49) = v49 ^ 0x20;
      }
      __src[v48] = v49;
      v50 = v48 + 1;
      v51 = a1[8];
      if ((v51 - 125) <= 1)
      {
        __src[v50] = 125;
        LOBYTE(v51) = v51 ^ 0x20;
        LODWORD(v50) = v48 + 2;
      }
      __src[v50] = v51;
      v52 = v50 + 1;
      v53 = a1[9];
      if ((v53 - 125) <= 1)
      {
        __src[v52] = 125;
        LODWORD(v52) = v50 + 2;
        LOBYTE(v53) = v53 ^ 0x20;
      }
      __src[v52] = v53;
      v54 = v52 + 1;
      v55 = a1[10];
      if ((v55 - 125) <= 1)
      {
        __src[v54] = 125;
        LOBYTE(v55) = v55 ^ 0x20;
        LODWORD(v54) = v52 + 2;
      }
      __src[v54] = v55;
      v56 = v54 + 1;
      v57 = a1[11];
      if ((v57 - 125) <= 1)
      {
        __src[v56] = 125;
        LODWORD(v56) = v54 + 2;
        LOBYTE(v57) = v57 ^ 0x20;
      }
      __src[v56] = v57;
      v58 = v56 + 1;
      v59 = a1[12];
      if ((v59 - 125) <= 1)
      {
        __src[v58] = 125;
        LOBYTE(v59) = v59 ^ 0x20;
        LODWORD(v58) = v56 + 2;
      }
      __src[v58] = v59;
      v60 = v58 + 1;
      v61 = a1[13];
      if ((v61 - 125) <= 1)
      {
        __src[v60] = 125;
        LODWORD(v60) = v58 + 2;
        LOBYTE(v61) = v61 ^ 0x20;
      }
      __src[v60] = v61;
      v62 = v60 + 1;
      v63 = a1[14];
      if ((v63 - 125) <= 1)
      {
        __src[v62] = 125;
        LOBYTE(v63) = v63 ^ 0x20;
        LODWORD(v62) = v60 + 2;
      }
      __src[v62] = v63;
      v64 = v62 + 1;
      v65 = a1[15];
      if ((v65 - 125) <= 1)
      {
        __src[v64] = 125;
        LODWORD(v64) = v62 + 2;
        LOBYTE(v65) = v65 ^ 0x20;
      }
      __src[v64] = v65;
      v66 = v64 + 1;
      v67 = a1[16];
      if ((v67 - 125) <= 1)
      {
        __src[v66] = 125;
        LODWORD(v66) = v64 + 2;
        LOBYTE(v67) = v67 ^ 0x20;
      }
      __src[v66] = v67;
      v68 = v66 + 1;
      v69 = a1[17];
      if ((v69 - 125) <= 1)
      {
        __src[v68] = 125;
        LOBYTE(v69) = v69 ^ 0x20;
        LODWORD(v68) = v66 + 2;
      }
      v70 = ~(v33 ^ BYTE1(v32));
      __src[v68] = v69;
      v71 = v68 + 1;
      v72 = a1[18];
      if ((v72 - 125) <= 1)
      {
        __src[v71] = 125;
        LOBYTE(v72) = v72 ^ 0x20;
        LODWORD(v71) = v68 + 2;
      }
      v73 = ((unsigned __int16)(v33 ^ ~(unsigned __int16)(v32 >> 8)) >> 8);
      __src[v71] = v72;
      v74 = v71 + 1;
      if ((v70 - 125) <= 1)
      {
        __src[v74] = 125;
        LOBYTE(v70) = v70 ^ 0x20;
        LODWORD(v74) = v71 + 2;
      }
      __src[v74] = v70;
      v75 = v74 + 1;
      if ((v73 - 125) <= 1)
      {
        __src[v75] = 125;
        LOBYTE(v73) = v73 ^ 0x20;
        LODWORD(v75) = v74 + 2;
      }
      __src[v75] = v73;
      memcpy(a1, __src, v75 + 1);
      result = (v75 + 2);
      a1[v75 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_DEMOD_FWD_WITH_NO_REV(unsigned __int8 *a1, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8, char a9, char a10)
{
  uint64_t result;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27;
  unsigned __int16 v28;
  unsigned int v29;
  unsigned __int16 v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[2048];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x35)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 122;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    v19 = crc_16_l_table[a1[6] ^ 4];
    v20 = crc_16_l_table[(a1[7] ^ v19) ^ 0x88];
    v21 = crc_16_l_table[(a1[8] ^ v20 ^ HIBYTE(v19))];
    v22 = crc_16_l_table[(a1[9] ^ v21 ^ HIBYTE(v20))];
    v23 = crc_16_l_table[(a3 ^ v22 ^ HIBYTE(v21))];
    v24 = crc_16_l_table[(a4 ^ v23 ^ HIBYTE(v22))];
    v25 = crc_16_l_table[(a5 ^ v24 ^ HIBYTE(v23))];
    v26 = crc_16_l_table[(a6 ^ v25 ^ HIBYTE(v24))];
    v27 = crc_16_l_table[(a7 ^ v26 ^ HIBYTE(v25))];
    v28 = crc_16_l_table[(a8 ^ v27 ^ HIBYTE(v26))];
    v29 = crc_16_l_table[(a9 ^ v28 ^ HIBYTE(v27))];
    v30 = crc_16_l_table[(v29 ^ HIBYTE(v28) ^ a10)];
    *((_WORD *)a1 + 9) = v30 ^ ~HIBYTE(crc_16_l_table[(a9 ^ v28 ^ HIBYTE(v27))]);
    if (a2 >= 40)
    {
      bzero(v71, 0x800uLL);
      v31 = *a1;
      if ((v31 - 125) > 1)
      {
        v32 = 0;
      }
      else
      {
        v71[0] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        v32 = 1;
      }
      v71[v32] = v31;
      v33 = v32 + 1;
      v34 = a1[1];
      if ((v34 - 125) <= 1)
      {
        v71[v33] = 125;
        LODWORD(v33) = v32 | 2;
        LOBYTE(v34) = v34 ^ 0x20;
      }
      v71[v33] = v34;
      v35 = v33 + 1;
      v36 = a1[2];
      if ((v36 - 125) <= 1)
      {
        v71[v35] = 125;
        LOBYTE(v36) = v36 ^ 0x20;
        LODWORD(v35) = v33 + 2;
      }
      v71[v35] = v36;
      v37 = v35 + 1;
      v38 = a1[3];
      if ((v38 - 125) <= 1)
      {
        v71[v37] = 125;
        LODWORD(v37) = v35 + 2;
        LOBYTE(v38) = v38 ^ 0x20;
      }
      v71[v37] = v38;
      v39 = v37 + 1;
      v40 = a1[4];
      if ((v40 - 125) <= 1)
      {
        v71[v39] = 125;
        LOBYTE(v40) = v40 ^ 0x20;
        LODWORD(v39) = v37 + 2;
      }
      v71[v39] = v40;
      v41 = v39 + 1;
      v42 = a1[5];
      if ((v42 - 125) <= 1)
      {
        v71[v41] = 125;
        LODWORD(v41) = v39 + 2;
        LOBYTE(v42) = v42 ^ 0x20;
      }
      v71[v41] = v42;
      v43 = v41 + 1;
      v44 = a1[6];
      if ((v44 - 125) <= 1)
      {
        v71[v43] = 125;
        LOBYTE(v44) = v44 ^ 0x20;
        LODWORD(v43) = v41 + 2;
      }
      v71[v43] = v44;
      v45 = v43 + 1;
      v46 = a1[7];
      if ((v46 - 125) <= 1)
      {
        v71[v45] = 125;
        LODWORD(v45) = v43 + 2;
        LOBYTE(v46) = v46 ^ 0x20;
      }
      v71[v45] = v46;
      v47 = v45 + 1;
      v48 = a1[8];
      if ((v48 - 125) <= 1)
      {
        v71[v47] = 125;
        LOBYTE(v48) = v48 ^ 0x20;
        LODWORD(v47) = v45 + 2;
      }
      v71[v47] = v48;
      v49 = v47 + 1;
      v50 = a1[9];
      if ((v50 - 125) <= 1)
      {
        v71[v49] = 125;
        LODWORD(v49) = v47 + 2;
        LOBYTE(v50) = v50 ^ 0x20;
      }
      v71[v49] = v50;
      v51 = v49 + 1;
      v52 = a1[10];
      if ((v52 - 125) <= 1)
      {
        v71[v51] = 125;
        LOBYTE(v52) = v52 ^ 0x20;
        LODWORD(v51) = v49 + 2;
      }
      v71[v51] = v52;
      v53 = v51 + 1;
      v54 = a1[11];
      if ((v54 - 125) <= 1)
      {
        v71[v53] = 125;
        LODWORD(v53) = v51 + 2;
        LOBYTE(v54) = v54 ^ 0x20;
      }
      v71[v53] = v54;
      v55 = v53 + 1;
      v56 = a1[12];
      if ((v56 - 125) <= 1)
      {
        v71[v55] = 125;
        LOBYTE(v56) = v56 ^ 0x20;
        LODWORD(v55) = v53 + 2;
      }
      v71[v55] = v56;
      v57 = v55 + 1;
      v58 = a1[13];
      if ((v58 - 125) <= 1)
      {
        v71[v57] = 125;
        LODWORD(v57) = v55 + 2;
        LOBYTE(v58) = v58 ^ 0x20;
      }
      v71[v57] = v58;
      v59 = v57 + 1;
      v60 = a1[14];
      if ((v60 - 125) <= 1)
      {
        v71[v59] = 125;
        LOBYTE(v60) = v60 ^ 0x20;
        LODWORD(v59) = v57 + 2;
      }
      v71[v59] = v60;
      v61 = v59 + 1;
      v62 = a1[15];
      if ((v62 - 125) <= 1)
      {
        v71[v61] = 125;
        LODWORD(v61) = v59 + 2;
        LOBYTE(v62) = v62 ^ 0x20;
      }
      v71[v61] = v62;
      v63 = v61 + 1;
      v64 = a1[16];
      if ((v64 - 125) <= 1)
      {
        v71[v63] = 125;
        LOBYTE(v64) = v64 ^ 0x20;
        LODWORD(v63) = v61 + 2;
      }
      v65 = ~(v30 ^ BYTE1(v29));
      v71[v63] = v64;
      v66 = v63 + 1;
      v67 = a1[17];
      if ((v67 - 125) <= 1)
      {
        v71[v66] = 125;
        LOBYTE(v67) = v67 ^ 0x20;
        LODWORD(v66) = v63 + 2;
      }
      v68 = ((unsigned __int16)(v30 ^ ~(unsigned __int16)(v29 >> 8)) >> 8);
      v71[v66] = v67;
      v69 = v66 + 1;
      if ((v65 - 125) <= 1)
      {
        v71[v69] = 125;
        LOBYTE(v65) = v65 ^ 0x20;
        LODWORD(v69) = v66 + 2;
      }
      v71[v69] = v65;
      v70 = v69 + 1;
      if ((v68 - 125) <= 1)
      {
        v71[v70] = 125;
        LOBYTE(v68) = v68 ^ 0x20;
        LODWORD(v70) = v69 + 2;
      }
      v71[v70] = v68;
      memcpy(a1, v71, v70 + 1);
      result = (v70 + 2);
      a1[v70 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_REV_A_MOD_TRA(char *a1, int a2, char a3, char a4, char a5, char a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,char a21,char a22,char a23,char a24,char a25,char a26,char a27,char a28,char a29,char a30)
{
  uint64_t result;
  int v38;
  int v39;
  char *v40;
  char v41;
  uint64_t v42;
  size_t v43;
  int v44;
  int v45;
  _BYTE __src[2048];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x3D)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 126;
    a1[6] = 42;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    a1[18] = a11;
    a1[19] = a12;
    a1[20] = a13;
    a1[21] = a14;
    *(_DWORD *)(a1 + 22) = a15;
    *(_DWORD *)(a1 + 26) = a16;
    *(_DWORD *)(a1 + 30) = a17;
    *(_DWORD *)(a1 + 34) = a18;
    *(_DWORD *)(a1 + 38) = a19;
    a1[42] = a20;
    a1[43] = a21;
    a1[44] = a22;
    a1[45] = a23;
    a1[46] = a24;
    a1[47] = a25;
    a1[48] = a26;
    a1[49] = a27;
    a1[50] = a28;
    a1[51] = a29;
    v38 = 424;
    a1[52] = a30;
    LOWORD(v39) = -1;
    v40 = a1;
    do
    {
      v41 = *v40++;
      v39 = crc_16_l_table[(v41 ^ v39)] ^ ((unsigned __int16)(v39 & 0xFF00) >> 8);
      v38 -= 8;
    }
    while ((_WORD)v38);
    *(_WORD *)(a1 + 53) = ~(_WORD)v39;
    if (a2 >= 110)
    {
      bzero(__src, 0x800uLL);
      v42 = 0;
      LODWORD(v43) = 0;
      do
      {
        while (1)
        {
          v45 = a1[v42];
          if ((v45 - 125) > 1)
            break;
          v44 = v43 + 1;
          __src[(int)v43] = 125;
          __src[(int)v43 + 1] = v45 ^ 0x20;
          v43 = (int)v43 + 1 + 1;
          if (++v42 == 55)
            goto LABEL_11;
        }
        v44 = v43;
        __src[(int)v43] = v45;
        v43 = (int)v43 + 1;
        ++v42;
      }
      while (v42 != 55);
LABEL_11:
      memcpy(a1, __src, v43);
      result = (v44 + 2);
      a1[v43] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_MOD_REVERSE_TRA(char *a1, int a2, char a3, char a4, char a5, char a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  uint64_t result;
  int v33;
  int v34;
  char *v35;
  char v36;
  uint64_t v37;
  size_t v38;
  int v39;
  int v40;
  _BYTE __src[2048];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x3B)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    *((_WORD *)a1 + 2) = 117;
    a1[6] = 47;
    a1[10] = a3;
    a1[11] = a4;
    a1[12] = a5;
    a1[13] = a6;
    a1[14] = a7;
    a1[15] = a8;
    a1[16] = a9;
    a1[17] = a10;
    a1[18] = a11;
    a1[19] = a12;
    a1[20] = a13;
    a1[21] = a14;
    a1[22] = a15;
    a1[23] = a16;
    a1[24] = a17;
    a1[25] = a18;
    *(_DWORD *)(a1 + 26) = a19;
    *(_DWORD *)(a1 + 30) = a20;
    *(_DWORD *)(a1 + 34) = a21;
    *(_DWORD *)(a1 + 38) = a22;
    *(_DWORD *)(a1 + 42) = a23;
    a1[46] = a24;
    v33 = 384;
    a1[47] = a25;
    LOWORD(v34) = -1;
    v35 = a1;
    do
    {
      v36 = *v35++;
      v34 = crc_16_l_table[(v36 ^ v34)] ^ ((unsigned __int16)(v34 & 0xFF00) >> 8);
      v33 -= 8;
    }
    while ((_WORD)v33);
    *((_WORD *)a1 + 24) = ~(_WORD)v34;
    if (a2 >= 100)
    {
      bzero(__src, 0x800uLL);
      v37 = 0;
      LODWORD(v38) = 0;
      do
      {
        while (1)
        {
          v40 = a1[v37];
          if ((v40 - 125) > 1)
            break;
          v39 = v38 + 1;
          __src[(int)v38] = 125;
          __src[(int)v38 + 1] = v40 ^ 0x20;
          v38 = (int)v38 + 1 + 1;
          if (++v37 == 50)
            goto LABEL_11;
        }
        v39 = v38;
        __src[(int)v38] = v40;
        v38 = (int)v38 + 1;
        ++v37;
      }
      while (v37 != 50);
LABEL_11:
      memcpy(a1, __src, v38);
      result = (v39 + 2);
      a1[v38] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_EVDO_CMD_RELEASE(unsigned __int8 *a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  unsigned int v8;
  unsigned __int16 v9;
  unsigned int v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int __src;
  char v23;
  char v24[2043];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x33)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 527179;
    a1[4] = 118;
    a1[6] = 10;
    v5 = a1[5];
    v6 = crc_16_l_table[crc_16_l_table[v5 ^ 0x20] ^ 0xAC];
    v7 = crc_16_l_table[(a1[7] ^ v6 ^ HIBYTE(crc_16_l_table[v5 ^ 0x20]))];
    v8 = crc_16_l_table[(a1[8] ^ v7 ^ HIBYTE(v6))];
    v9 = crc_16_l_table[(a1[9] ^ v8 ^ HIBYTE(v7))];
    *((_WORD *)a1 + 5) = v9 ^ ~HIBYTE(crc_16_l_table[(a1[8] ^ v7 ^ HIBYTE(v6))]);
    if (a2 >= 24)
    {
      bzero(v24, 0x7FBuLL);
      __src = 527179;
      v23 = 118;
      if ((v5 - 125) > 1)
      {
        v10 = 5;
      }
      else
      {
        v24[0] = 125;
        v10 = 6;
        LOBYTE(v5) = v5 ^ 0x20;
      }
      v11 = (char *)&__src + v10;
      *v11 = v5;
      v11[1] = 10;
      v12 = v10 + 2;
      v13 = a1[7];
      if ((v13 - 125) <= 1)
      {
        *((_BYTE *)&__src + v12) = 125;
        LODWORD(v12) = v10 + 3;
        LOBYTE(v13) = v13 ^ 0x20;
      }
      *((_BYTE *)&__src + v12) = v13;
      v14 = v12 + 1;
      v15 = a1[8];
      if ((v15 - 125) <= 1)
      {
        *((_BYTE *)&__src + v14) = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v14) = v12 + 2;
      }
      v16 = ~(v9 ^ BYTE1(v8));
      *((_BYTE *)&__src + v14) = v15;
      v17 = v14 + 1;
      v18 = a1[9];
      if ((v18 - 125) <= 1)
      {
        *((_BYTE *)&__src + v17) = 125;
        LOBYTE(v18) = v18 ^ 0x20;
        LODWORD(v17) = v14 + 2;
      }
      v19 = ((unsigned __int16)(v9 ^ ~(unsigned __int16)(v8 >> 8)) >> 8);
      *((_BYTE *)&__src + v17) = v18;
      v20 = v17 + 1;
      if ((v16 - 125) <= 1)
      {
        *((_BYTE *)&__src + v20) = 125;
        LOBYTE(v16) = v16 ^ 0x20;
        LODWORD(v20) = v17 + 2;
      }
      *((_BYTE *)&__src + v20) = v16;
      v21 = v20 + 1;
      if ((v19 - 125) <= 1)
      {
        *((_BYTE *)&__src + v21) = 125;
        LOBYTE(v19) = v19 ^ 0x20;
        LODWORD(v21) = v20 + 2;
      }
      *((_BYTE *)&__src + v21) = v19;
      memcpy(a1, &__src, v21 + 1);
      result = (v21 + 2);
      a1[v21 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_SetPA_DCDC_Levels(unsigned __int8 *a1, int a2, __int16 a3, __int16 a4)
{
  uint64_t result;
  int v9;
  int v10;
  char v11;
  char v12;
  int v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  _BYTE __src[2048];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x11)
  {
    bzero(a1, a2);
    *(_WORD *)a1 = 2891;
    v9 = gModeId;
    a1[2] = gModeId;
    v10 = HIBYTE(gModeId);
    a1[3] = HIBYTE(gModeId);
    *((_WORD *)a1 + 2) = 183;
    *((_WORD *)a1 + 3) = a3;
    v11 = HIBYTE(a3);
    *((_WORD *)a1 + 4) = a4;
    v12 = HIBYTE(a4);
    v13 = crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC];
    v14 = crc_16_l_table[crc_16_l_table[v13 ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0xB7] ^ HIBYTE(crc_16_l_table[crc_16_l_table[v9 ^ 0xA5] ^ v10 ^ 0xEC])];
    v15 = crc_16_l_table[(v14 ^ HIBYTE(crc_16_l_table[v13 ^ HIBYTE(crc_16_l_table[v9 ^ 0xA5]) ^ 0xB7]) ^ a3)];
    v16 = crc_16_l_table[(HIBYTE(a3) ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a4 ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[HIBYTE(a4) ^ crc_16_l_table[(a4 ^ v16 ^ HIBYTE(v15))] ^ (v16 >> 8)];
    *((_WORD *)a1 + 5) = v18 ^ ~HIBYTE(crc_16_l_table[(a4 ^ v16 ^ HIBYTE(v15))]);
    if (a2 >= 24)
    {
      v36 = v18 ^ ~(v17 >> 8);
      bzero(__src, 0x800uLL);
      v19 = *a1;
      if ((v19 - 125) > 1)
      {
        v20 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v19) = v19 ^ 0x20;
        v20 = 1;
      }
      __src[v20] = v19;
      v21 = v20 + 1;
      v22 = a1[1];
      if ((v22 - 125) <= 1)
      {
        __src[v21] = 125;
        LODWORD(v21) = v20 | 2;
        LOBYTE(v22) = v22 ^ 0x20;
      }
      __src[v21] = v22;
      v23 = v21 + 1;
      if ((v9 - 125) <= 1)
      {
        __src[v23] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v23) = v21 + 2;
      }
      v24 = a3;
      __src[v23] = v9;
      v25 = v23 + 1;
      if ((v10 - 125) <= 1)
      {
        __src[v25] = 125;
        LODWORD(v25) = v23 + 2;
        LOBYTE(v10) = v10 ^ 0x20;
      }
      v26 = &__src[v25];
      *v26 = v10;
      *(_WORD *)(v26 + 1) = 183;
      v27 = v25 + 3;
      if (a3 - 125 <= 1)
      {
        __src[v27] = 125;
        v24 = a3 ^ 0x20;
        LODWORD(v27) = v25 + 4;
      }
      v28 = a4;
      __src[v27] = v24;
      v29 = v27 + 1;
      if (HIBYTE(a3) - 125 <= 1)
      {
        __src[v29] = 125;
        LODWORD(v29) = v27 + 2;
        v11 = HIBYTE(a3) ^ 0x20;
      }
      __src[v29] = v11;
      v30 = v29 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v30] = 125;
        v28 = a4 ^ 0x20;
        LODWORD(v30) = v29 + 2;
      }
      v31 = ~(v18 ^ BYTE1(v17));
      __src[v30] = v28;
      v32 = v30 + 1;
      if (HIBYTE(a4) - 125 <= 1)
      {
        __src[v32] = 125;
        v12 = HIBYTE(a4) ^ 0x20;
        LODWORD(v32) = v30 + 2;
      }
      v33 = (unsigned __int16)(v18 ^ ~(unsigned __int16)(v17 >> 8)) >> 8;
      __src[v32] = v12;
      v34 = v32 + 1;
      if ((v31 - 125) <= 1)
      {
        __src[v34] = 125;
        LOBYTE(v31) = v31 ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      __src[v34] = v31;
      v35 = v34 + 1;
      if (BYTE1(v36) - 125 <= 1)
      {
        __src[v35] = 125;
        v33 = BYTE1(v36) ^ 0x20;
        LODWORD(v35) = v34 + 2;
      }
      __src[v35] = v33;
      memcpy(a1, __src, v35 + 1);
      result = (v35 + 2);
      a1[v35 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_TX_RX_FREQ_CAL_SWEEP(char *a1, int a2, char *a3)
{
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  char *v25;
  char v26;
  char *v27;
  uint64_t v28;
  int v29;
  unsigned __int8 *v30;
  char v31;
  int v32;
  _BYTE __src[2048];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 < 0x5D2)
    return result;
  bzero(a1, a2);
  *(_QWORD *)a1 = 0xA8008200140B4BLL;
  *((_WORD *)a1 + 4) = 12;
  a1[10] = *a3;
  a1[11] = a3[1];
  a1[12] = a3[2];
  a1[13] = a3[3];
  a1[14] = a3[4];
  a1[15] = a3[5];
  if (a3[2])
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = (uint64_t)&a3[2 * v8 + 6];
      v10 = &a1[v7];
      v10[16] = *(_WORD *)v9;
      v10[17] = *(_BYTE *)(v9 + 1);
      ++v8;
      v7 += 2;
    }
    while (v8 < a3[2]);
    LODWORD(v11) = v7 + 16;
    if (!a3[3])
      goto LABEL_26;
LABEL_9:
    v12 = 0;
    v11 = v11;
    v13 = ((v11 + 2) & 0x1FFFFFFFELL) - 1;
    v14 = v11 | 1;
    do
    {
      v15 = (uint64_t)&a3[2 * v12 + 38];
      a1[v11] = *(_WORD *)v15;
      a1[v14] = *(_BYTE *)(v15 + 1);
      v11 += 2;
      ++v12;
      v13 += 2;
      v14 += 2;
    }
    while (v12 < a3[3]);
    if (a3[3])
    {
      v16 = 0;
      do
      {
        v17 = (uint64_t)&a3[2 * v16 + 78];
        a1[v11] = *(_WORD *)v17;
        v11 += 2;
        a1[v13] = *(_BYTE *)(v17 + 1);
        ++v16;
        v13 += 2;
      }
      while (v16 < a3[3]);
      if (a3[3])
      {
        v18 = 0;
        v19 = &a1[v11];
        do
        {
          *v19++ = a3[v18++ + 118];
          LODWORD(v11) = v11 + 1;
        }
        while (v18 < a3[3]);
        if (a3[3])
        {
          v20 = 0;
          do
          {
            *v19++ = a3[v20++ + 138];
            LODWORD(v11) = v11 + 1;
          }
          while (v20 < a3[3]);
          if (a3[3])
          {
            v21 = 0;
            do
            {
              *v19++ = a3[v21++ + 158];
              LODWORD(v11) = v11 + 1;
            }
            while (v21 < a3[3]);
            if (a3[3])
            {
              v22 = 0;
              do
              {
                *v19++ = a3[v22++ + 178];
                LODWORD(v11) = v11 + 1;
              }
              while (v22 < a3[3]);
            }
          }
        }
      }
    }
    goto LABEL_26;
  }
  LODWORD(v11) = 16;
  if (a3[3])
    goto LABEL_9;
LABEL_26:
  v23 = 8 * v11;
  if (((8 * (_DWORD)v11) & 0xFFF8) != 0)
  {
    LOWORD(v24) = -1;
    v25 = a1;
    do
    {
      v26 = *v25++;
      v24 = crc_16_l_table[(v26 ^ v24)] ^ ((unsigned __int16)(v24 & 0xFF00) >> 8);
      v23 -= 8;
    }
    while ((_WORD)v23);
    *(_WORD *)&a1[(int)v11] = ~(_WORD)v24;
    result = 0xFFFFFFFFLL;
    if ((int)v11 > 1022)
      return result;
  }
  else
  {
    v27 = &a1[(int)v11];
    *v27 = 0;
    v27[1] = 0;
    result = 0xFFFFFFFFLL;
    if ((int)v11 > 1022)
      return result;
  }
  v28 = (v11 + 2);
  if (2 * (int)v28 <= a2)
  {
    bzero(__src, 0x800uLL);
    if ((int)v11 < -1)
    {
      v29 = 0;
    }
    else
    {
      v29 = 0;
      v30 = (unsigned __int8 *)a1;
      do
      {
        v32 = *v30++;
        v31 = v32;
        if ((v32 - 125) <= 1)
        {
          __src[v29] = 125;
          v31 ^= 0x20u;
          ++v29;
        }
        __src[v29++] = v31;
        --v28;
      }
      while (v28);
    }
    memcpy(a1, __src, v29);
    result = (v29 + 1);
    a1[v29] = 126;
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_TX_RX_FREQ_CAL_SWEEP_PARSE(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int8x16_t *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  int8x16_t *v29;
  const char *v30;
  const char *v31;
  unsigned __int128 v33;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  int8x8_t v42;
  const char *v43;
  uint8x8_t v44;
  unsigned __int8 *v45;
  int v46;
  __int16 v47;

  v3 = *(unsigned __int8 *)(a3 + 2);
  v4 = *(unsigned __int8 *)(a3 + 3);
  if (*(_BYTE *)(a3 + 2))
    _ZF = v4 == 0;
  else
    _ZF = 1;
  if (!_ZF)
  {
    v6 = 0;
    v7 = 2 * v4;
    if ((2 * v4) <= 2)
      v8 = 2;
    else
      v8 = 2 * v4;
    v9 = ((v8 - 1) >> 1) + 1;
    v10 = 6 * v4 + (v7 + 2) * v3;
    v11 = v10 + 22;
    v12 = 2 * v4;
    v13 = (((v8 - 1) >> 1) + 1) & 0xF;
    if (((((v8 - 1) >> 1) + 1) & 0xF) == 0)
      v13 = 16;
    if (((((v8 - 1) >> 1) + 1) & 7) != 0)
      v14 = (((v8 - 1) >> 1) + 1) & 7;
    else
      v14 = 8;
    v15 = v9 - v14;
    v16 = 2 * (v9 - v14);
    v17 = v10 + 23;
    v18 = ~(((unint64_t)(v8 - 2) + 1) >> 1);
    v19 = v18 + v14;
    v20 = (int8x16_t *)(a3 + 838);
    v21 = v11;
    do
    {
      if (v8 >= 0x11)
      {
        v22 = 0;
        v24 = a3 + 838 + 40 * v6 - a1;
        if (v24 - (unint64_t)(v11 + v12 * (_DWORD)v6) < 0x20)
        {
          v23 = 0;
        }
        else
        {
          v25 = v24 - ((v11 | 1) + v12 * (_DWORD)v6);
          v23 = 0;
          if (v25 >= 0x20)
          {
            if (v8 >= 0x21)
            {
              v27 = v18 + v13;
              v28 = v17;
              v29 = v20;
              v30 = (const char *)(a1 + v21);
              do
              {
                v31 = (const char *)(a1 + v28);
                _Q0 = (unsigned __int128)vld2q_s8(v31);
                v33 = (unsigned __int128)vld2q_s8(v30);
                v30 += 32;
                __asm { SHLL2           V4.8H, V0.16B, #8 }
                *v29 = vorrq_s8((int8x16_t)vshll_n_s8(*(int8x8_t *)&_Q0, 8uLL), (int8x16_t)vmovl_u8(*(uint8x8_t *)&v33));
                v29[1] = vorrq_s8(_Q4, (int8x16_t)vmovl_high_u8((uint8x16_t)v33));
                v29 += 2;
                v28 += 32;
                v27 += 16;
              }
              while (v27);
              v26 = v9 - v13;
              v22 = 2 * (v9 - v13);
              v23 = v9 - v13;
              if (v13 < 9)
                goto LABEL_27;
            }
            else
            {
              v26 = 0;
            }
            v38 = 2 * v26;
            v39 = v19 + v26;
            v40 = v17 + 2 * v26;
            do
            {
              v41 = (const char *)(a1 + v40);
              v42 = (int8x8_t)*(_OWORD *)vld2_s8(v41).val;
              v43 = (const char *)(a1 + v21 + v38);
              v44 = (uint8x8_t)*(_OWORD *)vld2_s8(v43).val;
              *(int8x16_t *)((char *)v20 + v38) = vorrq_s8((int8x16_t)vshll_n_s8(v42, 8uLL), (int8x16_t)vmovl_u8(v44));
              v38 += 16;
              v40 += 16;
              v39 += 8;
            }
            while (v39);
            v22 = v16;
            v23 = v15;
          }
        }
      }
      else
      {
        v22 = 0;
        v23 = 0;
      }
LABEL_27:
      v45 = (unsigned __int8 *)(a1 + v22 + v21);
      v46 = v17 + v22;
      do
      {
        v47 = *v45;
        v45 += 2;
        v20->i16[v23] = v47 | (*(unsigned __int8 *)(a1 + v46) << 8);
        v46 += 2;
        ++v23;
      }
      while (v9 != v23);
      ++v6;
      v21 += v7;
      v20 = (int8x16_t *)((char *)v20 + 40);
      v17 += v7;
    }
    while (v6 != v3);
  }
  return 0;
}

uint64_t APPLIB_DIAG_Get_TX_Power_Channel(_DWORD *a1, int a2, __int16 a3)
{
  uint64_t result;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int __src;
  char v20[2044];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 9)
  {
    bzero(a1, a2);
    *a1 = 589131;
    v7 = a3;
    *((_WORD *)a1 + 2) = a3;
    v8 = HIBYTE(a3);
    v9 = crc_16_l_table[a3 ^ 8];
    v10 = crc_16_l_table[crc_16_l_table[a3 ^ 8] ^ HIBYTE(a3) ^ 0x68];
    v11 = v10 ^ ~(v9 >> 8);
    *((_BYTE *)a1 + 6) = v10 ^ ~(v9 >> 8);
    v12 = BYTE1(v11);
    *((_BYTE *)a1 + 7) = BYTE1(v11);
    if (a2 >= 0x10)
    {
      v13 = v10 ^ (v9 >> 8);
      bzero(v20, 0x7FCuLL);
      __src = 589131;
      if ((v7 - 125) > 1)
      {
        v14 = 4;
      }
      else
      {
        v20[0] = 125;
        LOBYTE(v7) = v7 ^ 0x20;
        v14 = 5;
      }
      v15 = ~(_BYTE)v13;
      v20[v14 - 4] = v7;
      v16 = v14 + 1;
      if ((v8 - 125) <= 1)
      {
        v20[v16 - 4] = 125;
        LODWORD(v16) = v14 | 2;
        LOBYTE(v8) = v8 ^ 0x20;
      }
      v20[v16 - 4] = v8;
      v17 = v16 + 1;
      if ((v15 - 125) <= 1)
      {
        v20[v17 - 4] = 125;
        LOBYTE(v15) = v15 ^ 0x20;
        LODWORD(v17) = v16 + 2;
      }
      v20[v17 - 4] = v15;
      v18 = v17 + 1;
      if ((v12 - 125) <= 1)
      {
        v20[v18 - 4] = 125;
        LOBYTE(v12) = v12 ^ 0x20;
        LODWORD(v18) = v17 + 2;
      }
      v20[v18 - 4] = v12;
      memcpy(a1, &__src, v18 + 1);
      result = (v18 + 2);
      *((_BYTE *)a1 + v18 + 1) = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_GetPmicTherm(_DWORD *a1, int a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 5)
  {
    bzero(a1, a2);
    *a1 = 64843;
    *((_WORD *)a1 + 2) = 22839;
    if (a2 >= 0xC)
    {
      *a1 = 64843;
      *((_WORD *)a1 + 2) = 22839;
      *((_BYTE *)a1 + 6) = 126;
      return 7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t APPLIB_DIAG_FTM_CDMA2000_FTM_SET_REVERSE_LINK_POWER(char *a1, int a2, int a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE __src[2048];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  result = 0xFFFFFFFFLL;
  if (a1 && a2 >= 0x1F)
  {
    bzero(a1, a2);
    *(_DWORD *)a1 = 461643;
    *((_WORD *)a1 + 2) = 140;
    *(_DWORD *)(a1 + 11) = a4;
    a1[10] = a3;
    v9 = a1[6];
    v10 = crc_16_l_table[v9 ^ 0x25];
    v11 = crc_16_l_table[a1[7] ^ 0x12 ^ v10];
    v12 = crc_16_l_table[(a1[8] ^ v11 ^ HIBYTE(v10))];
    v13 = crc_16_l_table[(a1[9] ^ v12 ^ HIBYTE(v11))];
    v14 = crc_16_l_table[(v13 ^ HIBYTE(v12)) ^ a3];
    v15 = crc_16_l_table[(a4 ^ v14 ^ HIBYTE(v13))];
    v16 = crc_16_l_table[(a1[12] ^ v15 ^ HIBYTE(v14))];
    v17 = crc_16_l_table[(a1[13] ^ v16 ^ HIBYTE(v15))];
    v18 = crc_16_l_table[(a1[14] ^ v17 ^ HIBYTE(v16))];
    v19 = v18 ^ ~(v17 >> 8);
    *(_WORD *)(a1 + 15) = v18 ^ ~HIBYTE(crc_16_l_table[(a1[13] ^ v16 ^ HIBYTE(v15))]);
    if (a2 >= 34)
    {
      bzero(__src, 0x800uLL);
      v20 = *a1;
      if ((v20 - 125) > 1)
      {
        v21 = 0;
      }
      else
      {
        __src[0] = 125;
        LOBYTE(v20) = v20 ^ 0x20;
        v21 = 1;
      }
      __src[v21] = v20;
      v22 = v21 + 1;
      v23 = a1[1];
      if ((v23 - 125) <= 1)
      {
        __src[v22] = 125;
        LODWORD(v22) = v21 | 2;
        LOBYTE(v23) = v23 ^ 0x20;
      }
      __src[v22] = v23;
      v24 = v22 + 1;
      v25 = a1[2];
      if ((v25 - 125) <= 1)
      {
        __src[v24] = 125;
        LOBYTE(v25) = v25 ^ 0x20;
        LODWORD(v24) = v22 + 2;
      }
      __src[v24] = v25;
      v26 = v24 + 1;
      v27 = a1[3];
      if ((v27 - 125) <= 1)
      {
        __src[v26] = 125;
        LODWORD(v26) = v24 + 2;
        LOBYTE(v27) = v27 ^ 0x20;
      }
      __src[v26] = v27;
      v28 = v26 + 1;
      v29 = a1[4];
      if ((v29 - 125) <= 1)
      {
        __src[v28] = 125;
        LODWORD(v28) = v26 + 2;
        LOBYTE(v29) = v29 ^ 0x20;
      }
      v30 = &__src[v28];
      *v30 = v29;
      v30[1] = 0;
      v31 = v28 + 2;
      if ((v9 - 125) <= 1)
      {
        __src[v31] = 125;
        LOBYTE(v9) = v9 ^ 0x20;
        LODWORD(v31) = v28 + 3;
      }
      __src[v31] = v9;
      v32 = v31 + 1;
      v33 = a1[7];
      if ((v33 - 125) <= 1)
      {
        __src[v32] = 125;
        LODWORD(v32) = v31 + 2;
        LOBYTE(v33) = v33 ^ 0x20;
      }
      __src[v32] = v33;
      v34 = v32 + 1;
      v35 = a1[8];
      if ((v35 - 125) <= 1)
      {
        __src[v34] = 125;
        LOBYTE(v35) = v35 ^ 0x20;
        LODWORD(v34) = v32 + 2;
      }
      __src[v34] = v35;
      v36 = v34 + 1;
      v37 = a1[9];
      if ((v37 - 125) <= 1)
      {
        __src[v36] = 125;
        LODWORD(v36) = v34 + 2;
        LOBYTE(v37) = v37 ^ 0x20;
      }
      v38 = a4;
      __src[v36] = v37;
      v39 = v36 + 1;
      if ((a3 - 125) <= 1)
      {
        __src[v39] = 125;
        LOBYTE(a3) = a3 ^ 0x20;
        LODWORD(v39) = v36 + 2;
      }
      v40 = BYTE1(a4);
      __src[v39] = a3;
      v41 = v39 + 1;
      if (a4 - 125 <= 1)
      {
        __src[v41] = 125;
        v38 = a4 ^ 0x20;
        LODWORD(v41) = v39 + 2;
      }
      v42 = BYTE2(a4);
      __src[v41] = v38;
      v43 = v41 + 1;
      if (BYTE1(a4) - 125 <= 1)
      {
        __src[v43] = 125;
        LODWORD(v43) = v41 + 2;
        v40 = BYTE1(a4) ^ 0x20;
      }
      __src[v43] = v40;
      v44 = v43 + 1;
      if (BYTE2(a4) - 125 <= 1)
      {
        __src[v44] = 125;
        v42 = BYTE2(a4) ^ 0x20;
        LODWORD(v44) = v43 + 2;
      }
      v45 = ~(v18 ^ BYTE1(v17));
      __src[v44] = v42;
      v46 = v44 + 1;
      v47 = a1[14];
      if ((v47 - 125) <= 1)
      {
        __src[v46] = 125;
        LOBYTE(v47) = v47 ^ 0x20;
        LODWORD(v46) = v44 + 2;
      }
      v48 = (unsigned __int16)(v18 ^ ~(unsigned __int16)(v17 >> 8)) >> 8;
      __src[v46] = v47;
      v49 = v46 + 1;
      if ((v45 - 125) <= 1)
      {
        __src[v49] = 125;
        LOBYTE(v45) = v45 ^ 0x20;
        LODWORD(v49) = v46 + 2;
      }
      __src[v49] = v45;
      v50 = v49 + 1;
      if (BYTE1(v19) - 125 <= 1)
      {
        __src[v50] = 125;
        v48 = BYTE1(v19) ^ 0x20;
        LODWORD(v50) = v49 + 2;
      }
      __src[v50] = v48;
      memcpy(a1, __src, v50 + 1);
      result = (v50 + 2);
      a1[v50 + 1] = 126;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t ETLDMCParserInit(_QWORD *a1, uint64_t a2)
{
  *a1 = a2;
  a1[1] = 0;
  return 1;
}

uint64_t ETLDMCParserGetToken(uint64_t a1, unsigned __int8 a2, char *__dst, unsigned int a4)
{
  int v5;
  uint64_t v6;
  const char *v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  size_t v12;

  v5 = a2;
  v6 = *(unsigned int *)(a1 + 8);
  v7 = (const char *)(*(_QWORD *)a1 + v6);
  v8 = *(unsigned __int8 *)v7;
  v9 = *(_DWORD *)(a1 + 8);
  if (v8 == v5)
  {
LABEL_6:
    v11 = v9 + 1;
    v10 = v9 + 1 - v6;
    if (!v10)
      return 0;
  }
  else
  {
    v10 = 1;
    while (v8)
    {
      v8 = *(unsigned __int8 *)(*(_QWORD *)a1 + v6 + v10++);
      if (v8 == v5)
      {
        v9 = v6 + v10 - 1;
        goto LABEL_6;
      }
    }
    if (v10 == 1)
      return 0;
    v11 = v6 + v10 - 1;
    if (!v10)
      return 0;
  }
  if (v10 >= a4)
    v12 = a4;
  else
    v12 = v10;
  strlcpy(__dst, v7, v12);
  *(_DWORD *)(a1 + 8) = v11;
  return 1;
}

uint64_t ETLDMCParserReset(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 0;
  return 1;
}

uint64_t ETLDMCParserCountTokens(char **a1, int a2)
{
  char *v3;
  uint64_t i;

  v3 = strchr(*a1, a2);
  for (i = 1; v3; i = (i + 1))
    v3 = strchr(v3 + 1, a2);
  return i;
}

uint64_t ETLEVENTCreateSetMaskCommand(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _ETLDebugPrint();
  if (a3 > 0x1000 || !ETLRequireFreeSpace())
    return 0;
  HDLCFrameInjectUnsignedChar();
  HDLCFrameInjectUnsignedChar();
  HDLCFrameInjectUnsignedShort();
  HDLCFrameInjectUnsignedShort();
  HDLCFrameInject();
  return HDLCFrameInjectUnsignedChar();
}

uint64_t ETLEVENTParseSetMaskResponse(uint64_t *a1, _DWORD *a2, void *a3, unsigned int *a4)
{
  unsigned int v4;
  uint64_t v8;
  uint64_t result;
  int v10;
  unsigned int v11;
  size_t v12;

  v4 = *((_DWORD *)a1 + 2);
  if (v4 <= 5)
    goto LABEL_6;
  v8 = *a1;
  result = ETLExpectResponseCode();
  if (!(_DWORD)result)
    return result;
  v10 = *(unsigned __int8 *)(v8 + 1);
  *a2 = v10;
  if (!v10)
  {
    v11 = *(unsigned __int16 *)(v8 + 4);
    *a4 = v11;
    v12 = (v11 + 7) >> 3;
    if (v11 <= 0x1000 && v12 <= v4 - 6)
    {
      memcpy(a3, (const void *)(v8 + 6), v12);
      return 1;
    }
LABEL_6:
    _ETLDebugPrint();
    return 0;
  }
  return 0;
}

uint64_t ETLEVENTCreateGetMaskCommand()
{
  uint64_t result;

  result = ETLRequireFreeSpace();
  if ((_DWORD)result)
  {
    HDLCFrameInjectUnsignedChar();
    HDLCFrameInjectUnsignedChar();
    return HDLCFrameInjectUnsignedShort();
  }
  return result;
}

uint64_t ETLEVENTParseGetMaskResponse(uint64_t *a1, _DWORD *a2, void *a3, unsigned int *a4)
{
  unsigned int v4;
  uint64_t v8;
  uint64_t result;
  int v10;
  unsigned int v11;
  size_t v12;

  v4 = *((_DWORD *)a1 + 2);
  if (v4 <= 5)
    goto LABEL_6;
  v8 = *a1;
  result = ETLExpectResponseCode();
  if (!(_DWORD)result)
    return result;
  v10 = *(unsigned __int8 *)(v8 + 1);
  *a2 = v10;
  if (!v10)
  {
    v11 = *(unsigned __int16 *)(v8 + 4);
    *a4 = v11;
    v12 = (v11 + 7) >> 3;
    if (v11 <= 0x1000 && v12 <= v4 - 6)
    {
      memcpy(a3, (const void *)(v8 + 6), v12);
      return 1;
    }
LABEL_6:
    _ETLDebugPrint();
    return 0;
  }
  return 0;
}

uint64_t ETLEVENTCreateEnableCommand()
{
  uint64_t result;

  result = ETLRequireFreeSpace();
  if ((_DWORD)result)
  {
    HDLCFrameInjectUnsignedChar();
    return HDLCFrameInjectUnsignedChar();
  }
  return result;
}

uint64_t ETLEVENTParseEnableResponse()
{
  return 1;
}

uint64_t ETLEVENTSetMask(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int128 v5;
  _OWORD v7[2];
  uint64_t v8;
  __int128 __s2;
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
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39 = v5;
  v40 = v5;
  v37 = v5;
  v38 = v5;
  v35 = v5;
  v36 = v5;
  v33 = v5;
  v34 = v5;
  v31 = v5;
  v32 = v5;
  v29 = v5;
  v30 = v5;
  v27 = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  v17 = v5;
  v18 = v5;
  v15 = v5;
  v16 = v5;
  v13 = v5;
  v14 = v5;
  v11 = v5;
  v12 = v5;
  __s2 = v5;
  v10 = v5;
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  if ((ETLFrameCreateUplink() & 1) == 0
    || ETLEVENTCreateSetMaskCommand((uint64_t)v7, a2, a3)
    && ETLSendCommand()
    && ETLFindMatchingResponse())
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLEVENTGetMask()
{
  if ((ETLFrameCreateUplink() & 1) == 0
    || ETLRequireFreeSpace()
    && (HDLCFrameInjectUnsignedChar(), HDLCFrameInjectUnsignedChar(), HDLCFrameInjectUnsignedShort())
    && ETLSendCommand()
    && ETLFindMatchingResponse())
  {
    _ETLDebugPrint();
  }
  HDLCFrameFree();
  HDLCFrameFree();
  return 0;
}

uint64_t ETLEVENTEnable()
{
  uint64_t v0;

  _ETLDebugPrint();
  if ((ETLFrameCreateUplink() & 1) == 0)
  {
    _ETLDebugPrint();
LABEL_7:
    v0 = 0;
    goto LABEL_8;
  }
  if (!ETLRequireFreeSpace())
    goto LABEL_7;
  HDLCFrameInjectUnsignedChar();
  if (!HDLCFrameInjectUnsignedChar() || !ETLSendCommand())
    goto LABEL_7;
  v0 = ETLFindMatchingResponse();
LABEL_8:
  HDLCFrameFree();
  HDLCFrameFree();
  return v0;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

uint64_t ETLCheckPayloadLength()
{
  return MEMORY[0x1E0DE0010]();
}

uint64_t ETLExpectResponseCode()
{
  return MEMORY[0x1E0DE0020]();
}

uint64_t ETLFindMatchingResponse()
{
  return MEMORY[0x1E0DE0028]();
}

uint64_t ETLFlushResponseFull()
{
  return MEMORY[0x1E0DE0030]();
}

uint64_t ETLFrameCreateUplink()
{
  return MEMORY[0x1E0DE0038]();
}

uint64_t ETLRequireFreeSpace()
{
  return MEMORY[0x1E0DE0040]();
}

uint64_t ETLSendCommand()
{
  return MEMORY[0x1E0DE0048]();
}

uint64_t ETLSubsysAddHeader()
{
  return MEMORY[0x1E0DE0050]();
}

uint64_t ETLSubsysFindMatchingResponse()
{
  return MEMORY[0x1E0DE0058]();
}

uint64_t ETLSubsysParseHeader()
{
  return MEMORY[0x1E0DE0060]();
}

uint64_t HDLCFrameFree()
{
  return MEMORY[0x1E0DE0138]();
}

uint64_t HDLCFrameInject()
{
  return MEMORY[0x1E0DE0148]();
}

uint64_t HDLCFrameInjectUnsignedChar()
{
  return MEMORY[0x1E0DE0150]();
}

uint64_t HDLCFrameInjectUnsignedInt()
{
  return MEMORY[0x1E0DE0158]();
}

uint64_t HDLCFrameInjectUnsignedShort()
{
  return MEMORY[0x1E0DE0160]();
}

uint64_t TelephonyCapabilitiesGetHardwareModel()
{
  return MEMORY[0x1E0DE3670]();
}

uint64_t TelephonyUtilBinToHex()
{
  return MEMORY[0x1E0DE3680]();
}

uint64_t TelephonyUtilUnblockableReadToCompletionWithTimeout()
{
  return MEMORY[0x1E0DE3710]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x1E0DE0068]();
}

uint64_t _ETLDebugPrintBinary()
{
  return MEMORY[0x1E0DE0070]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4728]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete[](void *__p)
{
  off_1EA1F2048(__p);
}

void operator delete(void *__p)
{
  off_1EA1F2050(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_1EA1F2058(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA1F2060(__sz);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
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

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

xmlDocPtr xmlCtxtReadMemory(xmlParserCtxtPtr ctxt, const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x1E0DE8CD8](ctxt, buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x1E0DE8D18](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x1E0DE8D38](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x1E0DE8D50](ctxt);
}

