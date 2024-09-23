@implementation RPNWFramer

+ (const)controlCodeToString:(int)a3
{
  if (a3 > 3)
    return "INVALID";
  else
    return (&off_100112748)[a3];
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
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003E674;
    v11[3] = &unk_100112520;
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
    if (dword_100130458 <= 30
      && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 30)))
    {
      LogPrintF(&dword_100130458, "+[RPNWFramer writeDataOnFramer:data:]", 30, "Received data from Rapport peer, writing to agent client framer=%@", v5);
    }
    async_block[0] = _NSConcreteStackBlock;
    async_block[1] = 3221225472;
    async_block[2] = sub_10003E88C;
    async_block[3] = &unk_100111928;
    v12 = v7;
    v13 = v5;
    nw_framer_async(v13, async_block);

  }
  return v9;
}

+ (void)startConnection:(id)a3
{
  id v3;

  v3 = a3;
  if (dword_100130458 <= 30 && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 30)))
    LogPrintF(&dword_100130458, "+[RPNWFramer startConnection:]", 30, "Creating connection by writing magic value\n");
  +[RPNWFramer writeControlOnFramer:type:error:](RPNWFramer, "writeControlOnFramer:type:error:", v3, 1, 0);

}

+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4
{
  uint64_t v4;
  id v5;

  v4 = a4;
  v5 = a3;
  if (dword_100130458 <= 30 && (dword_100130458 != -1 || _LogCategory_Initialize(&dword_100130458, 30)))
    LogPrintF(&dword_100130458, "+[RPNWFramer writeErrorOnFramer:error:]", 30, "Sending error (%d) to client app connection\n", v4);
  +[RPNWFramer writeControlOnFramer:type:error:](RPNWFramer, "writeControlOnFramer:type:error:", v5, 2, v4);

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
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003EC44;
  v13[3] = &unk_100112598;
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
  nw_framer_set_output_handler(v12, &stru_1001125D8);
  nw_framer_set_cleanup_handler(v12, &stru_100112618);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

}

@end
