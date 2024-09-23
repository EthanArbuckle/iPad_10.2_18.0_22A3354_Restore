@implementation RPNWFramer

+ (const)controlCodeToString:(int)a3
{
  if (a3 > 3)
    return "INVALID";
  else
    return off_1E5F4F0E8[a3];
}

+ (BOOL)writeControlOnFramer:(id)a3 type:(int)a4 error:(unsigned __int8)a5
{
  id v7;
  void *v8;
  int v9;
  _QWORD v11[4];
  NSObject *v12;
  char v13;
  unsigned __int8 v14;
  __int16 v15;
  int v16;
  uint64_t v17;
  int v18;
  unsigned __int8 v19;

  v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (a4 == 1)
      v9 = 320017171;
    else
      v9 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__RPNWFramer_writeControlOnFramer_type_error___block_invoke;
    v11[3] = &unk_1E5F4EF20;
    v12 = v7;
    v13 = a4;
    v14 = a5;
    v15 = 0;
    v16 = v9;
    v17 = 0;
    v19 = a5;
    v18 = a4;
    nw_framer_async(v12, v11);

  }
  return v8 != 0;
}

void __46__RPNWFramer_writeControlOnFramer_type_error___block_invoke(uint64_t a1)
{
  nw_framer_write_output(*(nw_framer_t *)(a1 + 32), (const uint8_t *)(a1 + 40), 0x10uLL);
  if (*(_BYTE *)(a1 + 60))
  {
    if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    {
      +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned int *)(a1 + 56));
      strerror(*(unsigned __int8 *)(a1 + 60));
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
  {
    +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned int *)(a1 + 56));
    goto LABEL_8;
  }
}

+ (BOOL)writeDataOnFramer:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  _QWORD async_block[4];
  id v12;
  NSObject *v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
      LogPrintF();
    async_block[0] = MEMORY[0x1E0C809B0];
    async_block[1] = 3221225472;
    async_block[2] = __37__RPNWFramer_writeDataOnFramer_data___block_invoke;
    async_block[3] = &unk_1E5F4ECF8;
    v12 = v7;
    v13 = v5;
    nw_framer_async(v13, async_block);

  }
  return v9;
}

void __37__RPNWFramer_writeDataOnFramer_data___block_invoke(uint64_t a1)
{
  size_t v2;
  const uint8_t *v3;
  uint8_t output_buffer[8];
  size_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = (const uint8_t *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  *(_QWORD *)output_buffer = 0;
  v5 = v2;
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), output_buffer, 0x10uLL);
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    LogPrintF();
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), v3, v2);
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

+ (void)startConnection:(id)a3
{
  id v3;

  v3 = a3;
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    LogPrintF();
  +[RPNWFramer writeControlOnFramer:type:error:](RPNWFramer, "writeControlOnFramer:type:error:", v3, 1, 0);

}

+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = a4;
  v6 = a3;
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
  {
    v5 = v4;
    LogPrintF();
  }
  +[RPNWFramer writeControlOnFramer:type:error:](RPNWFramer, "writeControlOnFramer:type:error:", v6, 2, v4, v5);

}

+ (void)setupDaemonFramer:(id)a3 receiveHandler:(id)a4 closeHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[4];
  _QWORD v23[3];
  char v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke;
  v13[3] = &unk_1E5F4EF98;
  v17 = v23;
  v18 = v20;
  v19 = v22;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v12 = v7;
  v14 = v12;
  nw_framer_set_input_handler(v12, v13);
  nw_framer_set_output_handler(v12, &__block_literal_global_1);
  nw_framer_set_cleanup_handler(v12, &__block_literal_global_29);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

}

uint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  const char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD parse[6];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a2;
  v7 = MEMORY[0x1E0C809B0];
  while (1)
  {
    do
    {
      v8 = *(_QWORD *)(a1 + 56);
      if (*(_BYTE *)(*(_QWORD *)(v8 + 8) + 24))
        break;
      v28 = 0;
      v29 = &v28;
      v30 = 0x3010000000;
      v31 = "";
      v32 = 0;
      v33 = 0;
      parse[0] = v7;
      parse[1] = 3221225472;
      parse[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_2;
      parse[3] = &unk_1E5F4EF48;
      v27 = 16;
      parse[4] = &v28;
      parse[5] = v8;
      v26 = *(_OWORD *)(a1 + 64);
      if (!nw_framer_parse_input(v6, 0x10uLL, 0x10uLL, 0, parse))
      {
        _Block_object_dispose(&v28, 8);
        v15 = 16;
        goto LABEL_41;
      }
      if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
      {
        v9 = +[RPNWFramer controlCodeToString:](RPNWFramer, "controlCodeToString:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v17, v18, v19, v20);
        v10 = *((unsigned __int8 *)v29 + 33);
        v19 = strerror(*((unsigned __int8 *)v29 + 33));
        v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v17 = v9;
        v18 = v10;
        LogPrintF();
      }
      _Block_object_dispose(&v28, 8);
    }
    while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 3)
      {
        if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
          LogPrintF();
      }
      else
      {
        if (gLogCategory_RPNWFramer <= 90 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
          LogPrintF();
        nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 57);
      }
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v4, v5);
      goto LABEL_40;
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      break;
    if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v11 = *(_QWORD *)(a1 + 72);
    v12 = *(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_3;
    v21[3] = &unk_1E5F4EF70;
    v23 = v11;
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 56);
    v22 = v13;
    v24 = v14;
    if (!nw_framer_parse_input(v6, 1uLL, v12, 0, v21))
    {
      if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
        LogPrintF();

LABEL_40:
      v15 = 0;
      goto LABEL_41;
    }

  }
  if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v15 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_41:

  return v15;
}

uint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_2(_QWORD *a1, _OWORD *a2, unint64_t a3)
{
  if (!a2 || a1[8] > a3)
    return 0;
  *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 32) = *a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 32);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  return a1[8];
}

unint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_3(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;

  if (!a2)
    return 0;
  v3 = a3;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) <= a3)
  {
    if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*(void (**)(_QWORD))(a1[4] + 16))(a1[4]);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*(void (**)(_QWORD))(a1[4] + 16))(a1[4]);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) -= v3;
  }
  return v3;
}

void __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (gLogCategory_RPNWFramer <= 90 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    LogPrintF();

}

void __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_RPNWFramer <= 30
    && ((v5 = v2, gLogCategory_RPNWFramer != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

@end
