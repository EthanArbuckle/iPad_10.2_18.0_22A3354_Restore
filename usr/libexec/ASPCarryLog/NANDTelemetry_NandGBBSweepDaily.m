@implementation NANDTelemetry_NandGBBSweepDaily

- (NANDTelemetry_NandGBBSweepDaily)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5
{
  NANDTelemetry_NandGBBSweepDaily *v5;
  NANDTelemetry_NandGBBSweepDaily *v6;
  NANDTelemetry_NandGBBSweepDaily *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NANDTelemetry_NandGBBSweepDaily;
  v5 = -[NANDTelemetry_Base initWithXpcActivityMgr:persistentStateMgr:privacyMgr:](&v9, "initWithXpcActivityMgr:persistentStateMgr:privacyMgr:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_ctl = 0;
    v5->_sweepBuf = 0;
    v5->_sweepInfo = 0;
    v5->_sweepBufSize = 3145728;
    v5->_sweepError = 0;
    v7 = v5;
  }

  return v6;
}

- (BOOL)_isGBBSweepEnabled
{
  int v2;
  uint64_t v4;

  v4 = 0;
  v2 = os_parse_boot_arg_int("automatic_gbb_sweep_disable", &v4) ^ 1;
  if (v4)
    return v2;
  else
    return 1;
}

- (BOOL)_createDirectoryAt:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSFileAttributeKey v10;
  _UNKNOWN **v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = NSFilePosixPermissions;
    v11 = &off_1000AC098;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    objc_msgSend(v6, "setAttributes:ofItemAtPath:error:", v7, v3, 0);

  }
  else
  {
    v8 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041E04(v3, v8);
  }

  return v5;
}

- (void)_doCleanup:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError") == 8)
    goto LABEL_5;
  if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError") && (unsigned __int16)word_1000C488A < 4u)
  {
    ++word_1000C488A;
LABEL_5:
    byte_1000C4888 = 1;
    goto LABEL_9;
  }
  dword_1000C488C = 0;
  byte_1000C4888 = 0;
  if ((byte_1000C4890 & 1) == 0)
    -[NANDTelemetry_NandGBBSweepDaily _cleanItemAt:](self, "_cleanItemAt:", v4);
  word_1000C488A = 0;
LABEL_9:

}

- (void)_cleanItemAt:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

- (void)_writeCounters:(id)a3 counters:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v9 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 1, &v9));
    v6 = v9;
    if (!v6)
    {
      objc_msgSend(v8, "writeToFile:atomically:", v5, 1);
      v6 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)_compressRange:(unsigned int)a3 startWL:(unsigned int)a4 endWL:(unsigned int)a5 content:(id)a6
{
  uint64_t v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v7 = *(_QWORD *)&a4;
  v22 = a6;
  if (v7 < a5)
  {
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/Sweep_Wordline_%d.bin"), v10, v7));
      objc_msgSend(v22, "addObject:", v11);

      v7 = (v7 + 1);
    }
    while (a5 != (_DWORD)v7);
  }
  if (a5 == a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/FTLCounters.json"), v12));
    objc_msgSend(v22, "addObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/MSPCounters.json"), v14));
    objc_msgSend(v22, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/description.txt"), v16));
    objc_msgSend(v22, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/Defects.txt"), v18));
    objc_msgSend(v22, "addObject:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/ErrorLog.txt"), v20));
    objc_msgSend(v22, "addObject:", v21);

  }
}

- (void)_fillSweepParams
{
  $A820A8BF802304C85716FC6448E144CF *v3;
  $A820A8BF802304C85716FC6448E144CF *v4;
  $A820A8BF802304C85716FC6448E144CF *v5;
  $A820A8BF802304C85716FC6448E144CF *v6;
  $A820A8BF802304C85716FC6448E144CF *v7;
  $A820A8BF802304C85716FC6448E144CF *v8;
  _BOOL4 v9;
  $A820A8BF802304C85716FC6448E144CF *v10;

  v3 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  LODWORD(xmmword_1000C4894) = v3->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var0;
  v4 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  DWORD1(xmmword_1000C4894) = v4->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var1;
  v5 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  DWORD2(xmmword_1000C4894) = v5->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var2;
  v6 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  HIDWORD(xmmword_1000C4894) = v6->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var3;
  v7 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  dword_1000C48A4 = v7->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var4;
  v8 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  v9 = (v8->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var5 & 0xFFFFFFFE) == 2;
  dword_1000C48A8 = 0;
  dword_1000C48AC = v9;
  *(_OWORD *)algn_1000C48B0 = xmmword_100084FA0;
  v10 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  dword_1000C48C0 = v10->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var6;
}

- (void)_gatherRadarInfo
{
  void *v3;
  id v4;
  FILE *v5;
  FILE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  char __filename[1024];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/description.txt"), v3)));
  __strcpy_chk(__filename, objc_msgSend(v4, "UTF8String"), 1024);

  v5 = fopen(__filename, "a");
  if (v5)
  {
    v6 = v5;
    fprintf(v5, "Build Version: %.*s\n", 8, (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 144);
    fprintf(v6, "Build Number : %.*s\n", 16, (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 152);
    fprintf(v6, "Long Version : %.*s\n", 128, (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 168);
    fprintf(v6, "MSP Version  : %.*s\n", 16, (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 296);
    fprintf(v6, "NAND Vendor  : %.*s\n", 16, (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 344);
    fprintf(v6, "Build Type   : %.*s\n", 32, (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 312);
    fprintf(v6, "Capacity     : %d GB\n\n", *((unsigned __int16 *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 213));
    fclose(v6);
  }
  if (!-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived"))
  {
    v14 = CopyWhitelistedNANDFTLInfo(1, v7, v8, v9, v10, v11, v12, v13);
    v15 = CopyWhitelistedNANDMSPInfo();
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/FTLCounters.json"), v16));
    -[NANDTelemetry_NandGBBSweepDaily _writeCounters:counters:](self, "_writeCounters:counters:", v17, v14);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/MSPCounters.json"), v18));
    -[NANDTelemetry_NandGBBSweepDaily _writeCounters:counters:](self, "_writeCounters:counters:", v19, v15);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/Defects.txt"), v20)));
    print_grown_defects_ext((char *)objc_msgSend(v21, "UTF8String"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/ErrorLog.txt"), v22)));
    sub_10003612C((const char *)objc_msgSend(v23, "UTF8String"));

    print_geometry(__filename);
  }
}

- (id)_getReasonString:(unsigned int)a3
{
  if (a3 - 1 > 0x13)
    return CFSTR("UNKNOWN_REASON");
  else
    return off_10008C960[a3 - 1];
}

- (id)_getBlockStr:(unsigned int)a3
{
  uint64_t v5;
  $A820A8BF802304C85716FC6448E144CF *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  unsigned int v17;

  if (byte_1000C4888 == 1)
  {
    v5 = dword_1000C48C4;
  }
  else
  {
    v6 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
    v5 = v6->var11[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")];
  }
  v7 = DWORD1(xmmword_1000C4894);
  v16 = xmmword_1000C4894;
  v8 = DWORD2(xmmword_1000C4894);
  v9 = HIDWORD(xmmword_1000C4894);
  v10 = dword_1000C48A4;
  v17 = a3;
  if (v5 >= a3)
    v11 = CFSTR("Token");
  else
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v5));
  v12 = dword_1000C48AC;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily _getReasonString:](self, "_getReasonString:", dword_1000C48C0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MSP%d_Channel%d_Die%d_Plane%d_Block%d_Page%@_Mode%d_Reason%@"), v16, v7, v8, v9, v10, v11, v12, v13));

  if (v5 < v17)
  return v14;
}

- (void)_sweepBlock:(id *)a3
{
  uint64_t var10;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  id v32;

  var10 = a3->var10;
  v28 = objc_alloc_init((Class)NSMutableArray);
  if ((byte_1000C4888 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v6 = -[NANDTelemetry_NandGBBSweepDaily _createDirectoryAt:](self, "_createDirectoryAt:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_100041F2C(v7, self);
      -[NANDTelemetry_NandGBBSweepDaily setSweepError:](self, "setSweepError:", 7);
    }
    byte_1000C4888 = 1;
  }
  if (dword_1000C48A8 < var10)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0.0;
    while (1)
    {
      v11 = v9;
      if (-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived")
        || v10 > 4.5 && -[NANDTelemetry_Base tryDeferXpcActivity](self, "tryDeferXpcActivity"))
      {
        -[NANDTelemetry_NandGBBSweepDaily setSweepError:](self, "setSweepError:", 8);
        goto LABEL_23;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/Sweep_Wordline_%d.bin"), v12, dword_1000C48A8));

      v14 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = dword_1000C48A8;
        v16 = objc_retainAutorelease(v13);
        v17 = v14;
        v18 = objc_msgSend(v16, "UTF8String");
        *(_DWORD *)buf = 67109378;
        v30 = v15;
        v31 = 2080;
        v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sweeping WL %d, into %s", buf, 0x12u);

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

      v19 = -[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl");
      v20 = -[NANDTelemetry_NandGBBSweepDaily sweepBuf](self, "sweepBuf");
      v21 = -[NANDTelemetry_NandGBBSweepDaily sweepBufSize](self, "sweepBufSize");
      v8 = objc_retainAutorelease(v13);
      -[NANDTelemetry_NandGBBSweepDaily setSweepError:](self, "setSweepError:", Do_NVMeCTL_WL_Sweep((uint64_t)v19, &xmmword_1000C4894, v20, v21, (const char *)objc_msgSend(v8, "UTF8String")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v22, "timeIntervalSinceDate:", v9);
      v24 = v23;

      if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError"))
        break;
      v25 = dword_1000C48A8;
      if (dword_1000C48A8 != dword_1000C488C && !(dword_1000C48A8 % 0x64u))
      {
        -[NANDTelemetry_NandGBBSweepDaily _compressRange:startWL:endWL:content:](self, "_compressRange:startWL:endWL:content:", var10);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily compressedPath](self, "compressedPath"));
        CompressFiles(v28, v26, dword_1000C488C == 0);

        v25 = dword_1000C48A8;
        dword_1000C488C = dword_1000C48A8;
      }
      v10 = v10 + v24;
      dword_1000C48A8 = v25 + 1;
      if (v25 + 1 >= var10)
        goto LABEL_23;
    }
    v27 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041E94(v27, self);
LABEL_23:

  }
}

- (void)_checkTestHook
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  if (os_variant_has_internal_content("com.apple.ASPCarryLog", a2)
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getValueForKey:", CFSTR("gbb_test_mode"))),
        v3,
        v6))
  {
    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("yes"));
    v5 = v6;
    if (v4)
      byte_1000C4890 = 1;
  }
  else
  {
    v5 = 0;
  }

}

- (void)cleanUpForTelemetryDisable
{
  -[NANDTelemetry_NandGBBSweepDaily _doCleanup:](self, "_doCleanup:", CFSTR("/private/var/db/NANDTelemetryServices/GBBCollection"));
}

- (void)runActivity
{
  id DeviceSerialNumber;
  uint64_t (**v4)();
  char v5;
  NSObject *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  NSObject *v9;
  uint64_t inited;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  $A820A8BF802304C85716FC6448E144CF *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  _QWORD handler[5];
  unint64_t v40;
  uint8_t buf[4];
  int v42;
  _OWORD v43[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v40 = 0;
  v37 = objc_alloc_init((Class)NSMutableArray);
  DeviceSerialNumber = getDeviceSerialNumber();
  v38 = (void *)objc_claimAutoreleasedReturnValue(DeviceSerialNumber);
  v4 = &off_1000C4000;
  v5 = byte_1000C4888;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  memset(v43, 0, sizeof(v43));
  -[NANDTelemetry_NandGBBSweepDaily setWasSigtermReceived:](self, "setWasSigtermReceived:", 0);
  v6 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "GBB Activity Start.", buf, 2u);
  }
  signal(15, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v8);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000AAFC;
  handler[3] = &unk_10008C940;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_activate(v9);
  if ((byte_1000C4888 & 1) == 0)
  {
    -[NANDTelemetry_NandGBBSweepDaily _checkTestHook](self, "_checkTestHook");
    if ((byte_1000C4890 & 1) == 0)
      -[NANDTelemetry_NandGBBSweepDaily _cleanItemAt:](self, "_cleanItemAt:", CFSTR("/private/var/db/NANDTelemetryServices/GBBCollection"));
    -[NANDTelemetry_NandGBBSweepDaily _createDirectoryAt:](self, "_createDirectoryAt:", CFSTR("/private/var/db/NANDTelemetryServices/GBBCollection"));
  }
  if (!-[NANDTelemetry_NandGBBSweepDaily _isGBBSweepEnabled](self, "_isGBBSweepEnabled"))
  {
    v32 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "GBB Collection Disabled via boot-args", buf, 2u);
    }
    goto LABEL_41;
  }
  if (-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived")
    || !sub_100035B04(0, (uint64_t)v43))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041FC8();
    goto LABEL_41;
  }
  inited = Init_NVMeCTL();
  -[NANDTelemetry_NandGBBSweepDaily setCtl:](self, "setCtl:", inited);
  if (!inited)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041FF4();
    goto LABEL_41;
  }
  v11 = malloc_type_valloc(-[NANDTelemetry_NandGBBSweepDaily sweepBufSize](self, "sweepBufSize"), 0xBF5D77B3uLL);
  -[NANDTelemetry_NandGBBSweepDaily setSweepBuf:](self, "setSweepBuf:", v11);
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100042020();
LABEL_41:
    v19 = 0;
    v24 = 0;
    v12 = 0;
    goto LABEL_42;
  }
  v12 = -[NANDTelemetry_NandGBBSweepDaily getDefects:](self, "getDefects:", &v40);
  if (!v12 || v40 <= 3)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10004204C();
    goto LABEL_60;
  }
  -[NANDTelemetry_NandGBBSweepDaily setSweepInfo:](self, "setSweepInfo:", v12);
  v13 = *(_DWORD *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  if (byte_1000C4888)
    v14 = dword_1000C48C8;
  else
    v14 = 2;
  if (v13 >= v14)
    v13 = v14;
  dword_1000C48C8 = v13;
  -[NANDTelemetry_NandGBBSweepDaily setCurrBlock:](self, "setCurrBlock:", 0);
  -[NANDTelemetry_NandGBBSweepDaily setSweepError:](self, "setSweepError:", 0);
  v15 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v42 = dword_1000C48C8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sweeping %d bad blocks", buf, 8u);
  }
  if (!dword_1000C48C8)
  {
LABEL_60:
    v19 = 0;
    v24 = 0;
    goto LABEL_42;
  }
  v16 = 0;
  v17 = 0;
  v36 = v8;
  while (1)
  {
    if ((v5 & 1) == 0)
    {
      -[NANDTelemetry_NandGBBSweepDaily _fillSweepParams](self, "_fillSweepParams");
      v18 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
      dword_1000C48C4 = v18->var11[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")];
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily _getBlockStr:](self, "_getBlockStr:", DWORD1(v44)));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/private/var/db/NANDTelemetryServices/GBBCollection"), v19));
    -[NANDTelemetry_NandGBBSweepDaily setBlockPath:](self, "setBlockPath:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@_%@.tar"), v21, v19, v38));
    -[NANDTelemetry_NandGBBSweepDaily setCompressedPath:](self, "setCompressedPath:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily _getReasonString:](self, "_getReasonString:", dword_1000C48C0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@][New GBB Detected: %@][%@]"), v38, v19, v23));

    if ((v5 & 1) == 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      v26 = -[NANDTelemetry_NandGBBSweepDaily _createDirectoryAt:](self, "_createDirectoryAt:", v25);

      if ((v26 & 1) == 0)
        break;
    }
    -[NANDTelemetry_NandGBBSweepDaily _sweepBlock:](self, "_sweepBlock:", v43);
    v4 = &off_1000C4000;
    v8 = v36;
    if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError"))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      -[NANDTelemetry_NandGBBSweepDaily _doCleanup:](self, "_doCleanup:", v34);

      goto LABEL_42;
    }
    -[NANDTelemetry_NandGBBSweepDaily _gatherRadarInfo](self, "_gatherRadarInfo");
    -[NANDTelemetry_NandGBBSweepDaily _compressRange:startWL:endWL:content:](self, "_compressRange:startWL:endWL:content:", DWORD2(v44), dword_1000C488C, DWORD2(v44), v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily compressedPath](self, "compressedPath"));
    CompressFiles(v37, v27, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily compressedPath](self, "compressedPath"));
    -[NANDTelemetry_NandGBBSweepDaily uploadFile:description:](self, "uploadFile:description:", v28, v24);

    -[NANDTelemetry_NandGBBSweepDaily markGBBAsSwept](self, "markGBBAsSwept");
    --dword_1000C48C8;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    -[NANDTelemetry_NandGBBSweepDaily _doCleanup:](self, "_doCleanup:", v29);

    if ((v5 & 1) != 0)
    {
      v12 = -[NANDTelemetry_NandGBBSweepDaily getDefects:](self, "getDefects:", &v40);
      if (!v12 || v40 <= 3)
      {
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
          sub_100042078();
        goto LABEL_42;
      }
      -[NANDTelemetry_NandGBBSweepDaily setCurrBlock:](self, "setCurrBlock:", 0);
      -[NANDTelemetry_NandGBBSweepDaily setSweepInfo:](self, "setSweepInfo:", v12);
      v30 = dword_1000C48C8;
      v31 = *(_DWORD *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
      if (v30 < v31)
        v31 = v30;
      dword_1000C48C8 = v31;
    }
    else
    {
      -[NANDTelemetry_NandGBBSweepDaily setCurrBlock:](self, "setCurrBlock:", -[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock") + 1);
      v31 = dword_1000C48C8;
    }
    v5 = 0;
    v16 = v24;
    v17 = v19;
    if (!v31)
      goto LABEL_42;
  }
  v35 = (void *)oslog;
  v4 = &off_1000C4000;
  v8 = v36;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
    sub_100041F2C(v35, self);
LABEL_42:
  v33 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "GBB Activity Exit.", buf, 2u);
  }
  if (((_BYTE)v4[273] & 1) == 0 && (byte_1000C4890 & 1) == 0)
    -[NANDTelemetry_NandGBBSweepDaily _cleanItemAt:](self, "_cleanItemAt:", CFSTR("/private/var/db/NANDTelemetryServices/GBBCollection"));
  if (-[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl"))
  {
    -[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl");
    Free_NVMeCTL();
    -[NANDTelemetry_NandGBBSweepDaily setCtl:](self, "setCtl:", 0);
  }
  if (v12)
    free(v12);
  if (-[NANDTelemetry_NandGBBSweepDaily sweepBuf](self, "sweepBuf"))
  {
    free(-[NANDTelemetry_NandGBBSweepDaily sweepBuf](self, "sweepBuf"));
    -[NANDTelemetry_NandGBBSweepDaily setSweepBuf:](self, "setSweepBuf:", 0);
  }

}

- (int)uploadFile:(id)a3 description:(id)a4
{
  if ((byte_1000C4890 & 1) != 0)
    return 1;
  ASPCarryLog_UploadFileToDP(a3, CFSTR("com.apple.nand.autoGBBCollection"), CFSTR("AutomaticGBBSweep"), a4, 0, CFSTR("tar"));
  return 0;
}

- (void)getDefects:(unint64_t *)a3
{
  if (-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived"))
    return 0;
  else
    return sub_1000369E4(269, a3);
}

- (void)markGBBAsSwept
{
  char *v3;

  v3 = (char *)malloc_type_valloc(0x50uLL, 0x6A1EC288uLL);
  if (-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived") || !v3)
  {
    if (!v3)
      return;
  }
  else
  {
    *(_OWORD *)(v3 + 8) = xmmword_1000C4894;
    *((_DWORD *)v3 + 6) = dword_1000C48A4;
    Send_ASF_Tunnel((uint64_t)-[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl"), 270, (uint64_t)v3, 0, 0);
  }
  free(v3);
}

+ (void)setGBBXpcCritiria:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_HOUR);

}

+ (BOOL)shouldRegisterActivity
{
  int has_internal_content;
  uint64_t v3;

  has_internal_content = os_variant_has_internal_content("com.apple.ASPCarryLog", a2);
  if (has_internal_content)
  {
    if ((os_variant_has_factory_content("com.apple.ASPCarryLog", v3) & 1) != 0)
      LOBYTE(has_internal_content) = 0;
    else
      LOBYTE(has_internal_content) = os_variant_is_darwinos("com.apple.ASPCarryLog") ^ 1;
  }
  return has_internal_content;
}

- (NSString)blockPath
{
  return self->_blockPath;
}

- (void)setBlockPath:(id)a3
{
  objc_storeStrong((id *)&self->_blockPath, a3);
}

- (NSString)compressedPath
{
  return self->_compressedPath;
}

- (void)setCompressedPath:(id)a3
{
  objc_storeStrong((id *)&self->_compressedPath, a3);
}

- (void)ctl
{
  return self->_ctl;
}

- (void)setCtl:(void *)a3
{
  self->_ctl = a3;
}

- (void)sweepBuf
{
  return self->_sweepBuf;
}

- (void)setSweepBuf:(void *)a3
{
  self->_sweepBuf = a3;
}

- ($A820A8BF802304C85716FC6448E144CF)sweepInfo
{
  return self->_sweepInfo;
}

- (void)setSweepInfo:(id *)a3
{
  self->_sweepInfo = a3;
}

- (unint64_t)sweepBufSize
{
  return self->_sweepBufSize;
}

- (void)setSweepBufSize:(unint64_t)a3
{
  self->_sweepBufSize = a3;
}

- (int)sweepError
{
  return self->_sweepError;
}

- (void)setSweepError:(int)a3
{
  self->_sweepError = a3;
}

- (unsigned)currBlock
{
  return self->_currBlock;
}

- (void)setCurrBlock:(unsigned int)a3
{
  self->_currBlock = a3;
}

- (BOOL)wasSigtermReceived
{
  return self->_wasSigtermReceived;
}

- (void)setWasSigtermReceived:(BOOL)a3
{
  self->_wasSigtermReceived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressedPath, 0);
  objc_storeStrong((id *)&self->_blockPath, 0);
}

@end
