uint64_t ETLDLOADCoreDumpCaptureRecord(uint64_t a1, uint64_t a2, unsigned int (**a3)(_QWORD, unint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD), char a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v11;
  int v12;
  void *v13;
  __int128 v14;
  unsigned int v15;
  char v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  _BYTE *v21;
  unsigned __int16 v22;
  int v23;
  uint64_t v24;
  unsigned int (**v25)(_QWORD, unint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD);
  unsigned int (*v26)(_QWORD, unint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD);
  unsigned int v28;
  void *v29;
  unsigned int (**v30)(_QWORD, unint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD);
  int v32;
  unint64_t v33;
  __int16 v34;
  int v35;
  _QWORD v36[3];
  uint64_t v37;
  int v38;
  int v39;
  unint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v11 = *(_DWORD *)(a1 + 4);
  v12 = *(_DWORD *)(a1 + 8) + v11;
  v40 = 0xAAAAAAAAAAAAAAAALL;
  v37 = *(_QWORD *)(a5 + 8);
  v38 = v11;
  v39 = v12;
  v13 = malloc((4 << a4));
  if (v13)
  {
    v29 = v13;
    v30 = a3;
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v45 = v14;
    v46 = v14;
    v15 = 1 << a4;
    v44 = v14;
    v41 = v14;
    v42 = v14;
    v43 = v14;
    memset(v36, 170, sizeof(v36));
    v16 = TelephonyUtilRingBufferInitialize();
    v17 = 0;
    v18 = (((1 << a4) + *(_DWORD *)(a1 + 8) - 1) >> a4) * *(_DWORD *)(a5 + 16);
    if (v18 < 0x64)
      v19 = 1;
    else
      v19 = v18 / 0x64;
    v28 = v19;
    v20 = 1;
    v21 = *(_BYTE **)(a5 + 24);
    if (v21)
      goto LABEL_8;
    while (1)
    {
      while (1)
      {
        if (v12 == v11)
        {
LABEL_36:
          free(v29);
          return v16 & 1;
        }
        v35 = -1431655766;
        v34 = -21846;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (v12 - v11 >= v15)
          v22 = v15;
        else
          v22 = v12 - v11;
        if (!ETLDLOADCommandCreateMemoryDebugReadRequest())
          goto LABEL_35;
        v23 = ETLDLOADCommandSend();
        HDLCFrameFree();
        if (!v23)
          goto LABEL_35;
        if ((ETLDLOADCommandReceiveWithBufferAndFlags() & 1) != 0)
          break;
        _ETLDebugPrint();
        if (v17 >= 7)
          goto LABEL_35;
LABEL_24:
        v16 = 0;
        ++v17;
        v21 = *(_BYTE **)(a5 + 24);
        if (v21)
          goto LABEL_8;
      }
      if (!ETLDLOADCommandParseMemoryDebugReadResponse())
      {
        _ETLDebugPrint();
        ETLDLOADCommandDumpCommand();
        HDLCFrameFree();
        if (v17 >= 7)
          goto LABEL_35;
        goto LABEL_24;
      }
      v32 = -1431655766;
      if (v35 == v11)
      {
        v24 = v22;
        v25 = v30;
        if (v22 != (unsigned __int16)v34)
          goto LABEL_27;
      }
      else
      {
        _ETLDebugPrint();
        v24 = v22;
        v25 = v30;
        if (v22 != (unsigned __int16)v34)
        {
LABEL_27:
          _ETLDebugPrint();
          v26 = *v25;
          if (!*v25)
            goto LABEL_34;
          goto LABEL_28;
        }
      }
      v26 = *v25;
      if (!*v25)
        goto LABEL_34;
LABEL_28:
      if (!v26(v25, v33, v24, &v32, 1, a7, 0) || v32 != (_DWORD)v24)
      {
LABEL_34:
        _ETLDebugPrint();
        HDLCFrameFree();
        goto LABEL_35;
      }
      v11 += v24;
      if (!--v20)
      {
        LODWORD(v40) = v11;
        (*(void (**)(uint64_t *))a5)(&v37);
        v20 = v28;
      }
      HDLCFrameFree();
      v17 = 0;
      v16 = 1;
      v21 = *(_BYTE **)(a5 + 24);
      if (v21)
      {
LABEL_8:
        if (*v21)
        {
          _ETLDebugPrint();
LABEL_35:
          v16 = 0;
          goto LABEL_36;
        }
      }
    }
  }
  _ETLDebugPrint();
  v16 = 0;
  return v16 & 1;
}

uint64_t ETLDLOADCoreDumpCaptureRecordFast(uint64_t a1, uint64_t a2, unsigned int (**a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), char a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v10;
  int v11;
  int v12;
  char Response;
  unsigned int v14;
  __int128 v15;
  unsigned int v16;
  unsigned int v17;
  _BYTE *v18;
  unsigned int v19;
  unsigned __int16 v20;
  int v21;
  uint64_t v22;
  _BYTE *v23;
  unsigned int v24;
  int v25;
  _BYTE *v26;
  unsigned int v27;
  int v28;
  _BYTE *v29;
  unsigned int v30;
  int v31;
  _BYTE *v32;
  unsigned int v33;
  int v34;
  _BYTE *v35;
  unsigned int v36;
  int v37;
  _BYTE *v38;
  int v39;
  unsigned int (**v40)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int (*v41)(_QWORD, void *, uint64_t, int *, uint64_t, _QWORD, _QWORD);
  int v42;
  _BYTE *v43;
  unsigned __int16 v44;
  int v45;
  char v46;
  unsigned int v48;
  unsigned int (**v49)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v51;
  void *v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v11 = *(_DWORD *)(a1 + 4);
  v10 = *(_DWORD *)(a1 + 8);
  v12 = v10 + v11;
  v57 = 0xAAAAAAAAAAAAAAAALL;
  v54 = *(_QWORD *)(a5 + 8);
  v55 = v11;
  v56 = v10 + v11;
  v52 = malloc((4 << a4));
  if (v52)
  {
    Response = 0;
    v14 = 1 << a4;
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v59 = v15;
    v60 = v15;
    v16 = *(_DWORD *)(a5 + 16) * (((1 << a4) + v10 - 1) >> a4);
    v58 = v15;
    if (v16 < 0x64)
      v17 = 1;
    else
      v17 = v16 / 0x64;
    v48 = v17;
    v51 = 1;
    v49 = a3;
    while (1)
    {
      v18 = *(_BYTE **)(a5 + 24);
      if (v18)
      {
        if (*v18)
          break;
      }
      v19 = v12 - v11;
      if (v12 == v11)
        goto LABEL_83;
      if (v12 - v11 >= v14)
        v20 = v14;
      else
        v20 = v12 - v11;
      if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
        goto LABEL_82;
      v21 = ETLDLOADCommandSend();
      HDLCFrameFree();
      if (!v21)
        goto LABEL_82;
      v22 = v20;
      Response = ETLDLOADCommandReadMemoryDebugFastReadResponse();
      if ((Response & 1) != 0)
        goto LABEL_64;
      _ETLDebugPrint();
      v23 = *(_BYTE **)(a5 + 24);
      if (v23 && *v23)
        break;
      v24 = v12 - v11;
      if (v12 == v11)
        goto LABEL_83;
      if (v19 >= v14)
        LOWORD(v19) = v14;
      if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
        goto LABEL_82;
      v25 = ETLDLOADCommandSend();
      HDLCFrameFree();
      if (!v25)
        goto LABEL_82;
      v22 = (unsigned __int16)v19;
      Response = ETLDLOADCommandReadMemoryDebugFastReadResponse();
      if ((Response & 1) != 0)
        goto LABEL_64;
      _ETLDebugPrint();
      v26 = *(_BYTE **)(a5 + 24);
      if (v26 && *v26)
        break;
      v27 = v12 - v11;
      if (v12 == v11)
        goto LABEL_83;
      if (v24 >= v14)
        LOWORD(v24) = v14;
      if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
        goto LABEL_82;
      v28 = ETLDLOADCommandSend();
      HDLCFrameFree();
      if (!v28)
        goto LABEL_82;
      v22 = (unsigned __int16)v24;
      Response = ETLDLOADCommandReadMemoryDebugFastReadResponse();
      if ((Response & 1) != 0)
        goto LABEL_64;
      _ETLDebugPrint();
      v29 = *(_BYTE **)(a5 + 24);
      if (v29 && *v29)
        break;
      v30 = v12 - v11;
      if (v12 == v11)
        goto LABEL_83;
      if (v27 >= v14)
        LOWORD(v27) = v14;
      if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
        goto LABEL_82;
      v31 = ETLDLOADCommandSend();
      HDLCFrameFree();
      if (!v31)
        goto LABEL_82;
      v22 = (unsigned __int16)v27;
      Response = ETLDLOADCommandReadMemoryDebugFastReadResponse();
      if ((Response & 1) != 0)
        goto LABEL_64;
      _ETLDebugPrint();
      v32 = *(_BYTE **)(a5 + 24);
      if (v32 && *v32)
        break;
      v33 = v12 - v11;
      if (v12 == v11)
        goto LABEL_83;
      if (v30 >= v14)
        LOWORD(v30) = v14;
      if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
        goto LABEL_82;
      v34 = ETLDLOADCommandSend();
      HDLCFrameFree();
      if (!v34)
        goto LABEL_82;
      v22 = (unsigned __int16)v30;
      Response = ETLDLOADCommandReadMemoryDebugFastReadResponse();
      if ((Response & 1) != 0)
        goto LABEL_64;
      _ETLDebugPrint();
      v35 = *(_BYTE **)(a5 + 24);
      if (v35 && *v35)
        break;
      v36 = v12 - v11;
      if (v12 == v11)
        goto LABEL_83;
      if (v33 >= v14)
        LOWORD(v33) = v14;
      if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
        goto LABEL_82;
      v37 = ETLDLOADCommandSend();
      HDLCFrameFree();
      if (!v37)
        goto LABEL_82;
      v22 = (unsigned __int16)v33;
      Response = ETLDLOADCommandReadMemoryDebugFastReadResponse();
      if ((Response & 1) != 0)
        goto LABEL_64;
      _ETLDebugPrint();
      v38 = *(_BYTE **)(a5 + 24);
      if (v38 && *v38)
        break;
      if (v12 == v11)
        goto LABEL_83;
      if (v36 >= v14)
        LOWORD(v36) = v14;
      if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
        goto LABEL_82;
      v39 = ETLDLOADCommandSend();
      HDLCFrameFree();
      if (!v39)
        goto LABEL_82;
      v22 = (unsigned __int16)v36;
      Response = ETLDLOADCommandReadMemoryDebugFastReadResponse();
      if ((Response & 1) != 0)
      {
LABEL_64:
        v40 = v49;
        v53 = -1431655766;
        v41 = (unsigned int (*)(_QWORD, void *, uint64_t, int *, uint64_t, _QWORD, _QWORD))*v49;
        if (!*v49)
          break;
      }
      else
      {
        _ETLDebugPrint();
        v43 = *(_BYTE **)(a5 + 24);
        if (v43 && *v43)
          break;
        if (v12 == v11)
          goto LABEL_83;
        if (v12 - v11 >= v14)
          v44 = v14;
        else
          v44 = v12 - v11;
        if (!ETLDLOADCommandCreateMemoryDebugFastReadRequest())
          goto LABEL_82;
        v45 = ETLDLOADCommandSend();
        HDLCFrameFree();
        if (!v45)
          goto LABEL_82;
        v22 = v44;
        v46 = ETLDLOADCommandReadMemoryDebugFastReadResponse();
        if ((v46 & 1) == 0)
          break;
        Response = v46;
        v40 = v49;
        v53 = -1431655766;
        v41 = (unsigned int (*)(_QWORD, void *, uint64_t, int *, uint64_t, _QWORD, _QWORD))*v49;
        if (!*v49)
          break;
      }
      if (!v41(v40, v52, v22, &v53, 1, a7, 0) || v53 != (_DWORD)v22)
        break;
      v11 += v22;
      v42 = v51 - 1;
      if (v51 == 1)
      {
        LODWORD(v57) = v11;
        (*(void (**)(uint64_t *))a5)(&v54);
        v42 = v48;
      }
      v51 = v42;
    }
    _ETLDebugPrint();
LABEL_82:
    Response = 0;
LABEL_83:
    free(v52);
  }
  else
  {
    _ETLDebugPrint();
    Response = 0;
  }
  return Response & 1;
}

uint64_t ETLDLOADCommandCreateMemoryDebugFastReadRequest()
{
  return MEMORY[0x24BED3D00]();
}

uint64_t ETLDLOADCommandCreateMemoryDebugReadRequest()
{
  return MEMORY[0x24BED3D08]();
}

uint64_t ETLDLOADCommandDumpCommand()
{
  return MEMORY[0x24BED3D30]();
}

uint64_t ETLDLOADCommandParseMemoryDebugReadResponse()
{
  return MEMORY[0x24BED3D40]();
}

uint64_t ETLDLOADCommandReadMemoryDebugFastReadResponse()
{
  return MEMORY[0x24BED3D60]();
}

uint64_t ETLDLOADCommandReceiveWithBufferAndFlags()
{
  return MEMORY[0x24BED3D70]();
}

uint64_t ETLDLOADCommandSend()
{
  return MEMORY[0x24BED3D78]();
}

uint64_t HDLCFrameFree()
{
  return MEMORY[0x24BED43C8]();
}

uint64_t TelephonyUtilRingBufferInitialize()
{
  return MEMORY[0x24BED9758]();
}

uint64_t _ETLDebugPrint()
{
  return MEMORY[0x24BED3FB8]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

