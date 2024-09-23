@implementation SMCSensorExchangeHelper

+ (id)sharedInstance
{
  if (qword_10001BE70 != -1)
    dispatch_once(&qword_10001BE70, &stru_100014738);
  return (id)qword_10001BE78;
}

- (SMCSensorExchangeHelper)init
{
  SMCSensorExchangeHelper *v2;
  os_log_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMCSensorExchangeHelper;
  v2 = -[SMCSensorExchangeHelper init](&v6, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.powerexperienced", "smcsensorexchange");
    v4 = (void *)qword_10001BE80;
    qword_10001BE80 = (uint64_t)v3;

    LODWORD(xmmword_10001BEF8) = 257;
  }
  return v2;
}

- (void)updateCLTMChargingPolicy:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  const __CFDictionary *v7;
  io_service_t MatchingService;
  io_object_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30[8];
  size_t outputStructCnt;
  uint8_t v32[4];
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  _OWORD outputStruct[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint8_t buf[4];
  __int128 v49;
  _DWORD v50[7];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v4 = (void *)qword_10001BE80;
  if (os_log_type_enabled((os_log_t)qword_10001BE80, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating CLTM with charging policy: slow: %@", buf, 0xCu);

  }
  *((float *)&xmmword_10001BEF8 + 1) = (float)a3;
  v7 = IOServiceMatching("AppleSMC");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  if (!MatchingService)
  {
    v10 = 3758097136;
    goto LABEL_16;
  }
  v9 = MatchingService;
  v10 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_10001BE88);
  IOObjectRelease(v9);
  if ((_DWORD)v10)
    goto LABEL_16;
  if (!dword_10001BE88)
  {
    v10 = 0;
    goto LABEL_16;
  }
  v10 = IOConnectCallScalarMethod(dword_10001BE88, 0, 0, 0, 0, 0);
  if ((_DWORD)v10)
  {
LABEL_16:
    dword_10001BE88 = 0;
    goto LABEL_17;
  }
  if (dword_10001BE88)
  {
    strcpy(v30, "zEPE");
    v51 = xmmword_10001BEF8;
    v49 = 0u;
    memset(v50, 0, sizeof(v50));
    memset(outputStruct, 0, sizeof(outputStruct));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v56 = unk_10001BF48;
    v57 = xmmword_10001BF58;
    v52 = unk_10001BF08;
    v53 = xmmword_10001BF18;
    outputStructCnt = 168;
    v47 = 0;
    BYTE2(v50[5]) = 6;
    *(_DWORD *)buf = 2051362885;
    v50[2] = 120;
    v58 = qword_10001BF68;
    v54 = unk_10001BF28;
    v55 = xmmword_10001BF38;
    v11 = IOConnectCallStructMethod(dword_10001BE88, 2u, buf, 0xA8uLL, outputStruct, &outputStructCnt);
    v10 = 0;
    v12 = BYTE8(v39);
    if (v11 | BYTE8(v39))
    {
      v13 = v11;
      v14 = qword_10001BE80;
      if (os_log_type_enabled((os_log_t)qword_10001BE80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v32 = 136315650;
        v33 = v30;
        v34 = 1024;
        v35 = v13;
        v36 = 1024;
        v37 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Write failed for key '%s' (0x%X, 0x%X)", v32, 0x18u);
        v12 = BYTE8(v39);
      }
      if (v12 == 132)
      {
        v15 = qword_10001BE80;
        if (os_log_type_enabled((os_log_t)qword_10001BE80, OS_LOG_TYPE_ERROR))
          sub_10000D274(v15);
      }
      v10 = v13;
    }
    goto LABEL_19;
  }
  v10 = 0;
LABEL_17:
  v16 = qword_10001BE80;
  if (os_log_type_enabled((os_log_t)qword_10001BE80, OS_LOG_TYPE_ERROR))
    sub_10000D210(v10, v16, v17, v18, v19, v20, v21, v22);
LABEL_19:
  if (dword_10001BE88 && !IOConnectCallScalarMethod(dword_10001BE88, 1u, 0, 0, 0, 0))
    IOServiceClose(dword_10001BE88);
  if ((_DWORD)v10)
  {
    v23 = qword_10001BE80;
    if (os_log_type_enabled((os_log_t)qword_10001BE80, OS_LOG_TYPE_ERROR))
      sub_10000D1AC(v10, v23, v24, v25, v26, v27, v28, v29);
  }
  ++BYTE2(xmmword_10001BEF8);
}

@end
