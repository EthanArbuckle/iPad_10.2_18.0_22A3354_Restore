@implementation MIBUSMCHelper

- (MIBUSMCHelper)init
{
  MIBUSMCHelper *v2;
  MIBUSMCHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUSMCHelper;
  v2 = -[MIBUSMCHelper init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MIBUSMCHelper setConnection:](v2, "setConnection:", 0);
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  objc_super v6;
  id v7;
  uint8_t buf[16];

  if (-[MIBUSMCHelper connection](self, "connection"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000555E0);
    v3 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing SMC connection...", buf, 2u);
    }
    v7 = 0;
    -[MIBUSMCHelper _closeAppleSMC:](self, "_closeAppleSMC:", &v7);
    v4 = v7;
    if (!v4)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055600);
      v5 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully closed SMC connection", buf, 2u);
      }
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)MIBUSMCHelper;
  -[MIBUSMCHelper dealloc](&v6, "dealloc");
}

- (void)openAppleSMC:(id *)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  if (!-[MIBUSMCHelper connection](self, "connection"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055620);
    v5 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Opening io connection to SMC ...", buf, 2u);
    }
    v4 = 0;
    v6 = 1;
    while (1)
    {
      v7 = v4;
      v12 = v4;
      v8 = -[MIBUSMCHelper _openAppleSMC:](self, "_openAppleSMC:", &v12);
      v4 = v12;

      -[MIBUSMCHelper setConnection:](self, "setConnection:", v8);
      if (-[MIBUSMCHelper connection](self, "connection"))
      {
        if (!v4)
          break;
      }
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055660);
      v9 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        v14 = v6;
        v15 = 1024;
        v16 = 3;
        v17 = 1024;
        v18 = 1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to open SMC, attempt %d/%d, retrying in %ds...", buf, 0x14u);
      }
      sleep(1u);
      if (++v6 == 4)
        goto LABEL_3;
    }
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055640);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully opened io connection to SMC", buf, 2u);
    }
  }
  v4 = 0;
LABEL_3:
  if (a3)
    *a3 = objc_retainAutorelease(v4);

}

- (BOOL)isKeySupported:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  _BOOL4 v15;

  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSMCHelper readSMCKey:error:](self, "readSMCKey:error:", v4, &v11));
  v6 = v11;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = objc_msgSend(v6, "code") != (id)2684354561;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055680);
  v9 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v4;
    v14 = 1024;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ SMC Key is supported: %{BOOL}d", buf, 0x12u);
  }

  return v8;
}

- (id)readSMCKey:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  kern_return_t v8;
  uint64_t v9;
  kern_return_t v10;
  id v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id *v25;
  NSObject *v26;
  uint64_t v27;
  size_t outputStructCnt;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  kern_return_t v32;
  __int16 v33;
  int v34;
  __int128 outputStruct;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _QWORD inputStruct[21];

  v6 = a3;
  outputStructCnt = 168;
  memset(inputStruct, 0, sizeof(inputStruct));
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  outputStruct = 0u;
  v36 = 0u;
  v7 = -[MIBUSMCHelper _smcKeyFromString:](self, "_smcKeyFromString:", v6);
  if (!-[MIBUSMCHelper connection](self, "connection"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000556A0);
    v13 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AE90((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);
    v20 = 2684354563;
    v27 = (uint64_t)v6;
    v21 = CFSTR("Failed to read SMC key: %@; no open SMC connection");
    goto LABEL_30;
  }
  memset((char *)inputStruct + 4, 0, 164);
  outputStruct = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0;
  LODWORD(inputStruct[0]) = v7;
  BYTE2(inputStruct[5]) = 9;
  v8 = IOConnectCallStructMethod(-[MIBUSMCHelper connection](self, "connection"), 2u, inputStruct, 0xA8uLL, &outputStruct, &outputStructCnt);
  if (v8 || BYTE8(v37))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000556C0);
    v22 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v30 = v6;
      v31 = 1024;
      v32 = v8;
      v33 = 1024;
      v34 = BYTE8(v37);
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to read info for key: %{public}@; ret: 0x%X; smc ret: 0x%X",
        buf,
        0x18u);
    }
    v20 = 2684354561;
    v27 = (uint64_t)v6;
    v21 = CFSTR("Failed to read info for key: %@; ret: 0x%X; smc ret: 0x%X");
    goto LABEL_30;
  }
  v9 = HIDWORD(v36);
  if (HIDWORD(v36) >= 0x79)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000556E0);
    v23 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AEF4((uint64_t)v6, v9, v23);
    v27 = (uint64_t)v6;
    v21 = CFSTR("Key %@ has size %d which exceeds maximum expected size of %d");
    goto LABEL_36;
  }
  memset((char *)inputStruct + 4, 0, 164);
  outputStruct = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0;
  LODWORD(inputStruct[0]) = v7;
  HIDWORD(inputStruct[3]) = v9;
  BYTE2(inputStruct[5]) = 5;
  v10 = IOConnectCallStructMethod(-[MIBUSMCHelper connection](self, "connection"), 2u, inputStruct, 0xA8uLL, &outputStruct, &outputStructCnt);
  if (v10 || BYTE8(v37))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055700);
    v24 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v30 = v6;
      v31 = 1024;
      v32 = v10;
      v33 = 1024;
      v34 = BYTE8(v37);
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to read key: %{public}@; ret: 0x%X; smc ret: 0x%X",
        buf,
        0x18u);
    }
    v20 = 2684354563;
    v27 = (uint64_t)v6;
    v21 = CFSTR("Failed to read key: %@; ret: 0x%X; smc ret: 0x%X");
LABEL_30:
    v25 = a4;
LABEL_37:
    sub_10000D680(v25, v20, 0, v21, v16, v17, v18, v19, v27);
    v11 = 0;
    goto LABEL_9;
  }
  if (HIDWORD(v36) > v9)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055720);
    v26 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v30 = v6;
      v31 = 1024;
      v32 = HIDWORD(v36);
      v33 = 1024;
      v34 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Key %{public}@ has size %d which exceeds expected size of %d", buf, 0x18u);
    }
    v27 = (uint64_t)v6;
    v21 = CFSTR("Key %@ has size %d which exceeds expected size of %d");
LABEL_36:
    v25 = a4;
    v20 = 2684354562;
    goto LABEL_37;
  }
  v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v38, v9);
LABEL_9:

  return v11;
}

- (void)writeSMCKey:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unsigned int v10;
  unint64_t v11;
  id v12;
  kern_return_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t outputStructCnt;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  _QWORD v29[2];
  _OWORD outputStruct[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unsigned int inputStruct;
  __int128 v35;
  __int128 v36;
  _DWORD v37[11];

  v8 = a3;
  v9 = a4;
  v10 = -[MIBUSMCHelper _smcKeyFromString:](self, "_smcKeyFromString:", v8);
  outputStructCnt = 80;
  if ((unint64_t)objc_msgSend(v9, "length") >= 0x21)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055740);
    v15 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AF80((uint64_t)v8, (uint64_t)v9, v15);
    sub_10000D680(a5, 2684354564, 0, CFSTR("Failed to write key: %@; data %@ exceeds maximum allowed length: %d"),
      v16,
      v17,
      v18,
      v19,
      (uint64_t)v8);
  }
  else
  {
    memset(v37, 0, sizeof(v37));
    v36 = 0u;
    v35 = 0u;
    memset(outputStruct, 0, sizeof(outputStruct));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    inputStruct = v10;
    BYTE2(v37[1]) = 6;
    DWORD2(v36) = objc_msgSend(v9, "length");
    if (objc_msgSend(v9, "length"))
    {
      v11 = 0;
      do
      {
        v12 = objc_retainAutorelease(v9);
        *((_BYTE *)&v37[3] + v11) = *((_BYTE *)objc_msgSend(v12, "bytes") + v11);
        ++v11;
      }
      while (v11 < (unint64_t)objc_msgSend(v12, "length"));
    }
    v13 = IOConnectCallStructMethod(-[MIBUSMCHelper connection](self, "connection"), 2u, &inputStruct, 0x50uLL, outputStruct, &outputStructCnt);
    if (v13 || BYTE8(v31))
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055760);
      v20 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v27 = v8;
        v28 = 1024;
        LODWORD(v29[0]) = v13;
        WORD2(v29[0]) = 1024;
        *(_DWORD *)((char *)v29 + 6) = BYTE8(v31);
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to write key: %{public}@; ret: 0x%X; smc ret: 0x%X",
          buf,
          0x18u);
      }
      sub_10000D680(a5, 2684354564, 0, CFSTR("Failed to write key: %@; ret: 0x%X; smc ret: 0x%X"),
        v21,
        v22,
        v23,
        v24,
        (uint64_t)v8);
    }
    else
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055780);
      v14 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v27 = v8;
        v28 = 2114;
        v29[0] = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully written key %{public}@ with data: %{public}@", buf, 0x16u);
      }
    }
  }

}

- (unsigned)_openAppleSMC:(id *)a3
{
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v11;
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
  io_connect_t connect;

  connect = 0;
  v4 = IOServiceMatching("AppleSMC");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (MatchingService)
  {
    v6 = MatchingService;
    v7 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    IOObjectRelease(v6);
    if ((_DWORD)v7)
      v8 = 1;
    else
      v8 = connect == 0;
    if (v8)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000557C0);
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003B084();
      sub_10000D680(a3, 2684354560, 0, CFSTR("Failed to open service port to SMC; ret: %d"), v19, v20, v21, v22, v7);
    }
    else
    {
      v9 = IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0);
      if ((_DWORD)v9)
      {
        v23 = v9;
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_1000557E0);
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003B0E4();
        sub_10000D680(a3, 2684354560, 0, CFSTR("Failed to send user client open command to SMC; ret: %d"),
          v24,
          v25,
          v26,
          v27,
          v23);
      }
    }
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000557A0);
    v11 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003B014(v11, v12, v13, v14, v15, v16, v17, v18);
    sub_10000D680(a3, 2684354560, 0, CFSTR("Failed to find matching io service to %s"), v15, v16, v17, v18, (uint64_t)"AppleSMC");
  }
  return connect;
}

- (void)_closeAppleSMC:(id *)a3
{
  uint64_t v5;
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

  v5 = IOConnectCallScalarMethod(-[MIBUSMCHelper connection](self, "connection"), 1u, 0, 0, 0, 0);
  if ((_DWORD)v5)
  {
    v7 = v5;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055800);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003B1A4();
    sub_10000D680(a3, 2684354565, 0, CFSTR("Failed to send user client close command to SMC; ret: %d"),
      v8,
      v9,
      v10,
      v11,
      v7);
  }
  else
  {
    v6 = IOServiceClose(-[MIBUSMCHelper connection](self, "connection"));
    if ((_DWORD)v6)
    {
      v12 = v6;
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055820);
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003B144();
      sub_10000D680(a3, 2684354565, 0, CFSTR("Failed to close service port to SMC; ret: %d"),
        v13,
        v14,
        v15,
        v16,
        v12);
    }
  }
}

- (unsigned)_smcKeyFromString:(id)a3
{
  uint64_t v4;
  unsigned int v5;

  v4 = 0;
  v5 = 0;
  do
    v5 = objc_msgSend(a3, "characterAtIndex:", v4++) | (v5 << 8);
  while (v4 != 4);
  return v5;
}

- (unsigned)connection
{
  return self->_connection;
}

- (void)setConnection:(unsigned int)a3
{
  self->_connection = a3;
}

@end
