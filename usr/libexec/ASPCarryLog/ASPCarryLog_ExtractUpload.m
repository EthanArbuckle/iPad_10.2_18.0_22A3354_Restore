@implementation ASPCarryLog_ExtractUpload

- (ASPCarryLog_ExtractUpload)initWithNandDriver:(id)a3 UploadDriver:(id)a4 StateManager:(id)a5 workDirectory:(id)a6 internalBuild:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ASPCarryLog_ExtractUpload *v17;
  uint64_t v18;
  NSFileManager *fileManager;
  uint64_t v20;
  NSString *spdFilePath;
  uint64_t v22;
  NSString *tarInProgressDir;
  uint64_t v24;
  NSString *iologPath;
  uint64_t v26;
  NSString *nandcounterPath;
  uint64_t v28;
  NSString *nandstatsPath;
  uint64_t v30;
  NSString *convertedIologPath;
  uint64_t v32;
  NSString *pendingUploadFile;
  XpcActivityManager *xpcActivityMgr;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *taskingId;
  uint64_t v39;
  NSString *deviceId;
  uint64_t v41;
  NSString *endTimeStr;
  void *v43;
  uint64_t v44;
  NSString *uploadInfoKey;
  void *v46;
  void *v47;
  uint64_t v48;
  NSDictionary *uploadInfo;
  _BOOL4 v50;
  uint64_t v51;
  NSDate *nextSpdExtractTime;
  NSString *v53;
  NSString *v54;
  NSDate *v55;
  ASPCarryLog_ExtractUpload *v56;
  objc_super v58;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v58.receiver = self;
  v58.super_class = (Class)ASPCarryLog_ExtractUpload;
  v17 = -[ASPCarryLog_ExtractUpload init](&v58, "init");
  if (v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    fileManager = v17->_fileManager;
    v17->_fileManager = (NSFileManager *)v18;

    objc_storeStrong((id *)&v17->_nandDriver, a3);
    objc_storeStrong((id *)&v17->_uploadDriver, a4);
    objc_storeStrong((id *)&v17->_stateMgr, a5);
    objc_storeStrong((id *)&v17->_workDir, a6);
    v20 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v17->_workDir, "stringByAppendingPathComponent:", CFSTR("iolog_spd.iolog")));
    spdFilePath = v17->_spdFilePath;
    v17->_spdFilePath = (NSString *)v20;

    v22 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v17->_workDir, "stringByAppendingPathComponent:", CFSTR("tar_in_process")));
    tarInProgressDir = v17->_tarInProgressDir;
    v17->_tarInProgressDir = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v17->_workDir, "stringByAppendingPathComponent:", CFSTR("iolog.iolog")));
    iologPath = v17->_iologPath;
    v17->_iologPath = (NSString *)v24;

    v26 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v17->_workDir, "stringByAppendingPathComponent:", CFSTR("nandcounters.plist")));
    nandcounterPath = v17->_nandcounterPath;
    v17->_nandcounterPath = (NSString *)v26;

    v28 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v17->_workDir, "stringByAppendingPathComponent:", CFSTR("nandstats.txt")));
    nandstatsPath = v17->_nandstatsPath;
    v17->_nandstatsPath = (NSString *)v28;

    v30 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v17->_workDir, "stringByAppendingPathComponent:", CFSTR("iolog_converted.iolog")));
    convertedIologPath = v17->_convertedIologPath;
    v17->_convertedIologPath = (NSString *)v30;

    v32 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _getPendingUploadFile](v17, "_getPendingUploadFile"));
    pendingUploadFile = v17->_pendingUploadFile;
    v17->_pendingUploadFile = (NSString *)v32;

    v17->_isInternalBuild = a7;
    xpcActivityMgr = v17->_xpcActivityMgr;
    v17->_xpcActivityMgr = 0;

    v17->_isIOLogEnableNeeded = 0;
    v17->_isPeriodicSpd = 0;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[StateMgr getValueForKey:expectedType:](v17->_stateMgr, "getValueForKey:expectedType:", CFSTR("current_tasking_info"), 2));
    v36 = v35;
    if (!v35 || !validateCurTaskingInfo(v35))
      goto LABEL_9;
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("id")));
    taskingId = v17->_taskingId;
    v17->_taskingId = (NSString *)v37;

    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("device_id")));
    deviceId = v17->_deviceId;
    v17->_deviceId = (NSString *)v39;

    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("endtime")));
    endTimeStr = v17->_endTimeStr;
    v17->_endTimeStr = (NSString *)v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("upload_size_limit_bytes")));
    v17->_uploadSizeLimit = (unint64_t)objc_msgSend(v43, "unsignedLongValue");

    v44 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("aspcarry_uploadinfo"), v17->_taskingId));
    uploadInfoKey = v17->_uploadInfoKey;
    v17->_uploadInfoKey = (NSString *)v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](v17, "stateMgr"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfoKey](v17, "uploadInfoKey"));
    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "getValueForKey:expectedType:", v47, 2));
    uploadInfo = v17->_uploadInfo;
    v17->_uploadInfo = (NSDictionary *)v48;

    v17->_spdState = -[ASPCarryLog_ExtractUpload _getSpdState](v17, "_getSpdState");
    v17->_uploadIdx = -[ASPCarryLog_ExtractUpload _getUploadIdx](v17, "_getUploadIdx");
    v17->_lastTotalUploadSize = -[ASPCarryLog_ExtractUpload _getlastTotalUploadSize](v17, "_getlastTotalUploadSize");
    if (-[ASPCarryLog_ExtractUpload _getDiskSpaceFlag](v17, "_getDiskSpaceFlag"))
      v50 = !diskFreeSpaceBelowLimit(0x40000000uLL);
    else
      LOBYTE(v50) = 0;
    v17->_isEnoughDiskSpace = v50;
    v17->_numB2BZipErrors = -[ASPCarryLog_ExtractUpload _getNumB2BZipErrors](v17, "_getNumB2BZipErrors");
    v51 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _getNextSpdExtractTime](v17, "_getNextSpdExtractTime"));
    nextSpdExtractTime = v17->_nextSpdExtractTime;
    v17->_nextSpdExtractTime = (NSDate *)v51;

    if (v17->_uploadIdx < 0 || v17->_lastTotalUploadSize == -1)
    {
LABEL_9:
      v53 = v17->_taskingId;
      v17->_taskingId = 0;

      v54 = v17->_deviceId;
      v17->_deviceId = 0;

      v17->_lastTotalUploadSize = -1;
      v17->_uploadSizeLimit = -1;
      v17->_isEnoughDiskSpace = 1;
      *(_QWORD *)&v17->_spdState = 0xFFFFFFFF00000000;
      v55 = v17->_nextSpdExtractTime;
      v17->_nextSpdExtractTime = 0;

    }
    v56 = v17;

  }
  return v17;
}

- (unint64_t)_iologLba_current
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nandStats_get_hoursAgo:", 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", &off_1000AC038));
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_autoreleasePoolPop(v3);
  return (unint64_t)v7;
}

- (unint64_t)_iologLba_prevSubmission
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getValueForKey:expectedType:", CFSTR("iolog_lbas"), 1));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (BOOL)_isLastExtractionTooLongAgo
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getValueForKey:expectedType:", CFSTR("last_extract_time"), 0));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && (v5 = StringToDateTime(v3), (v6 = (void *)objc_claimAutoreleasedReturnValue(v5)) != 0))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", 86400.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = objc_msgSend(v8, "compare:", v9) == (id)-1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_updateLastExtractTime
{
  id v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v2 = currentDateTimeStr();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("last_extract_time"));

}

- (unint64_t)_getlastTotalUploadSize
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("total_upload_size")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (unint64_t)objc_msgSend(v3, "unsignedLongLongValue");
  else
    v5 = -1;

  return v5;
}

- (int)_getUploadIdx
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fileidx")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = -1;

  return v5;
}

- (BOOL)_getDiskSpaceFlag
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("enough_disk_space")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)_getNextSpdExtractTime
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("next_spd_extraction_time")));

    v5 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = StringToDateTime(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_isPendingSpdHandling
{
  return -[ASPCarryLog_ExtractUpload spdState](self, "spdState") != 0;
}

- (int)_getNumB2BZipErrors
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("num_b2b_zip_errors")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 0;

  return v5;
}

- (void)_iologLba_updateNewValue:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("iolog_lbas"));

}

- (id)_getPendingUploadFile
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getValueForKey:expectedType:", CFSTR("extractupload_pendingfile"), 0));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if ((v6 & 1) == 0)
    {

      -[ASPCarryLog_ExtractUpload _removePendingUploadFilePath](self, "_removePendingUploadFilePath");
      v4 = 0;
    }
  }
  return v4;
}

- (void)_setUploadInfoWithSpdState:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[4];

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)NSMutableDictionary);
  v19[0] = CFSTR("fileidx");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx")));
  v20[0] = v6;
  v19[1] = CFSTR("total_upload_size");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize")));
  v20[1] = v7;
  v19[2] = CFSTR("enough_disk_space");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ASPCarryLog_ExtractUpload isEnoughDiskSpace](self, "isEnoughDiskSpace")));
  v20[2] = v8;
  v19[3] = CFSTR("num_b2b_zip_errors");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[ASPCarryLog_ExtractUpload numB2BZipErrors](self, "numB2BZipErrors")));
  v20[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  v11 = objc_msgSend(v5, "initWithDictionary:", v10);

  if ((_DWORD)v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("spd_state"));

  }
  if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));
      v15 = DateTimeToStr(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("next_spd_extraction_time"));

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfoKey](self, "uploadInfoKey"));
  objc_msgSend(v17, "setValue:forKey:", v11, v18);

}

- (void)_internalSetNextSpdExtractionTime
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 1209600.0));
  -[ASPCarryLog_ExtractUpload setNextSpdExtractTime:](self, "setNextSpdExtractTime:", v3);

}

- (void)_updateUploadInfoWithContentPath:(id)a3 contentSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[ASPCarryLog_ExtractUpload setUploadIdx:](self, "setUploadIdx:", -[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx") + 1);
    -[ASPCarryLog_ExtractUpload setLastTotalUploadSize:](self, "setLastTotalUploadSize:", (char *)-[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize") + a4);
    -[ASPCarryLog_ExtractUpload _saveLastUploadFilePath:](self, "_saveLastUploadFilePath:", v10);
    -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload endTimeStr](self, "endTimeStr"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload endTimeStr](self, "endTimeStr"));
      setTaskingInfoToLegacyUIDomain(v7, v8, v9, -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize"), v10, -[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"));

    }
  }
  else
  {
    -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0);
  }

}

- (void)_savePendingUploadFilePath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("extractupload_pendingfile"));

}

- (void)_saveLastUploadFilePath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("extractupload_lastupload"));

}

- (void)_removePendingUploadFilePath
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  objc_msgSend(v2, "deleteKey:", CFSTR("extractupload_pendingfile"));

}

- (int)_tryCreateWorkDirectories
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  NSFileAttributeKey v28;
  _UNKNOWN **v29;
  NSFileAttributeKey v30;
  _UNKNOWN **v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
    v27 = 0;
    v9 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 0, 0, &v27);
    v6 = v27;

    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_10004113C();
      goto LABEL_12;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v30 = NSFilePosixPermissions;
  v31 = &off_1000AC050;
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
  v26 = v6;
  objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v11, v12, &v26);
  v13 = v26;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
  LOBYTE(v11) = objc_msgSend(v14, "fileExistsAtPath:", v15);

  if ((v11 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
    v25 = v13;
    v18 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 0, 0, &v25);
    v6 = v25;

    if ((v18 & 1) != 0)
    {
      v13 = v6;
      goto LABEL_7;
    }
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041110();
LABEL_12:
    v20 = 0;
    goto LABEL_13;
  }
LABEL_7:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v28 = NSFilePosixPermissions;
  v29 = &off_1000AC050;
  v20 = 1;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
  v24 = v13;
  objc_msgSend(v19, "setAttributes:ofItemAtPath:error:", v21, v22, &v24);
  v6 = v24;

LABEL_13:
  return v20;
}

- (void)_cleanUpinProgressFiles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v10));
        objc_msgSend(v11, "removeItemAtPath:error:", v13, 0);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (int)_extractFiles
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int result;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  unsigned int v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
    objc_msgSend(v6, "removeItemAtPath:error:", v7, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
    objc_msgSend(v11, "removeItemAtPath:error:", v12, 0);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  v14 = objc_msgSend(v13, "iolog_disable");

  if (v14)
  {
    -[ASPCarryLog_ExtractUpload setIsIOLogEnableNeeded:](self, "setIsIOLogEnableNeeded:", 1);
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
      v17 = (unint64_t)objc_msgSend(v15, "iolog_export:max_export_size:", v16, 25165824);

    }
    while (v17 >> 23 >= 3 && !-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"));
    if (-[ASPCarryLog_ExtractUpload isIOLogEnableNeeded](self, "isIOLogEnableNeeded"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
      objc_msgSend(v18, "iolog_enable");

    }
  }
  else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_1000411C0();
  }
  if (-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred"))
    return 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
  v22 = objc_msgSend(v20, "nandCounters_save:", v21);

  if (!v22)
  {
    result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100041168();
    return 0;
  }
  if (!-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
    return 1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
  v25 = objc_msgSend(v23, "nandStats_save:", v24);

  if (v25)
    return 1;
  result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100041194();
    return 0;
  }
  return result;
}

- (int)_checkAndExtractFiles
{
  unint64_t v3;
  unint64_t v4;
  int result;

  v3 = -[ASPCarryLog_ExtractUpload _iologLba_current](self, "_iologLba_current");
  v4 = -[ASPCarryLog_ExtractUpload _iologLba_prevSubmission](self, "_iologLba_prevSubmission");
  if (v3 > v4 && (v3 - v4) >> 13
    || (result = -[ASPCarryLog_ExtractUpload _isLastExtractionTooLongAgo](self, "_isLastExtractionTooLongAgo")) != 0)
  {
    -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 1);
    result = -[ASPCarryLog_ExtractUpload _extractFiles](self, "_extractFiles");
    if (result)
    {
      if (-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred"))
      {
        return 0;
      }
      else
      {
        -[ASPCarryLog_ExtractUpload _iologLba_updateNewValue:](self, "_iologLba_updateNewValue:", v3);
        -[ASPCarryLog_ExtractUpload _updateLastExtractTime](self, "_updateLastExtractTime");
        return 1;
      }
    }
  }
  return result;
}

- (void)_removeExtractedFiles
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
    objc_msgSend(v6, "removeItemAtPath:error:", v7, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
    objc_msgSend(v11, "removeItemAtPath:error:", v12, 0);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
  v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
    objc_msgSend(v16, "removeItemAtPath:error:", v17, 0);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
  v20 = objc_msgSend(v18, "fileExistsAtPath:", v19);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
    objc_msgSend(v21, "removeItemAtPath:error:", v22, 0);

  }
  -[ASPCarryLog_ExtractUpload _removeConvertedIOLog](self, "_removeConvertedIOLog");
}

- (void)_removeConvertedIOLog
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath"));
    objc_msgSend(v7, "removeItemAtPath:error:", v6, 0);

  }
}

- (int)_checkAndConvertIOLog
{
  int v3;
  unsigned int v4;
  id v5;
  FILE *v6;
  id v7;
  FILE *v8;
  int v9;

  -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 2);
  if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
    return 0;
  -[ASPCarryLog_ExtractUpload _removeConvertedIOLog](self, "_removeConvertedIOLog");
  v4 = -[ASPCarryLog_ExtractUpload _isIOLogFromHwLogger](self, "_isIOLogFromHwLogger");
  gIsIOLogFromHwLogger = v4;
  if (!v4)
    return 1;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath")));
  v6 = fopen((const char *)objc_msgSend(v5, "UTF8String"), "r");

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath")));
  v8 = fopen((const char *)objc_msgSend(v7, "UTF8String"), "w");

  if (v6 && v8)
  {
    v9 = iolog_hwlogger_to_legacy_format_conversion(v8, v6, 1);
LABEL_9:
    fclose(v6);
    v3 = v9;
    goto LABEL_10;
  }
  v9 = 0;
  v3 = 0;
  if (v6)
    goto LABEL_9;
LABEL_10:
  if (v8)
    fclose(v8);
  if (!v3)
  {
    -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
    -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 0);
  }
  return v3;
}

- (id)_compressFilesForSpd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *i;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  int v23;
  int v24;
  int v25;
  int v26;
  BOOL v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  id v34;
  const __CFString *v36;
  id v37;
  id v38;
  id v39;
  const __CFString *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  stat v53;
  uint8_t buf[16];
  _BYTE v55[128];
  _BYTE v56[8192];

  v3 = a3;
  if (gIsIOLogFromHwLogger)
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath"));
  else
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
  v6 = currentDateTimeStr();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)v7;
  if (v3)
  {
    v46 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/iologSpd_%@.tar"), v5, v7));

    v45 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v44, 0);
  }
  else
  {
    v46 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/iolog_%@_%d.tar"), v5, v7, -[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx")));

    v9 = objc_alloc((Class)NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
    v45 = objc_msgSend(v9, "initWithObjects:", v43, v10, 0);

    if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
      v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
        objc_msgSend(v45, "addObject:", v14);

      }
    }
  }
  memset(&v53, 0, sizeof(v53));
  -[ASPCarryLog_ExtractUpload _cleanUpinProgressFiles](self, "_cleanUpinProgressFiles");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = archive_write_new();
  if (archive_write_add_filter_gzip()
    || archive_write_set_options(v15, "compression-level=1")
    || archive_write_set_format_pax(v15))
  {
    v40 = CFSTR("SetZipError");
    goto LABEL_49;
  }
  if (archive_write_open_filename(v15, objc_msgSend(objc_retainAutorelease(v46), "fileSystemRepresentation")))
  {
    v40 = CFSTR("OpenDestFileError");
LABEL_49:
    v41 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v40, 0, 0));
    objc_exception_throw(v41);
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v45;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (!v16)
    goto LABEL_35;
  v17 = 0;
  v48 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(_QWORD *)v50 != v48)
        objc_enumerationMutation(obj);
      v19 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);

      v20 = objc_retainAutorelease(v19);
      if (stat((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &v53))
      {
        v39 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("InputFileStatError"), 0, 0));
        objc_exception_throw(v39);
      }
      v21 = archive_entry_new();
      archive_entry_copy_stat(v21, &v53);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent")));
      archive_entry_set_pathname(v21, objc_msgSend(v22, "UTF8String"));

      archive_entry_set_filetype(v21, 0x8000);
      archive_entry_set_perm(v21, 420);
      if (archive_write_header(v15, v21))
      {
        v38 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("ArchiveWriteHeaderError"), 0, 0));
        objc_exception_throw(v38);
      }
      v17 = objc_retainAutorelease(v20);
      v23 = open((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0);
      v24 = v23;
      if (v23 < 0)
      {
        v36 = CFSTR("InpputFileError");
LABEL_43:
        v37 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v36, 0, 0));
        objc_exception_throw(v37);
      }
      v25 = read(v23, v56, 0x2000uLL);
      v26 = 0x4000000;
      while (1)
      {
        if (v25 < 1)
          goto LABEL_31;
        if (v25 != archive_write_data(v15, v56, v25))
        {
          v36 = CFSTR("ArchiveWriteError");
          goto LABEL_43;
        }
        v27 = __OFSUB__(v26, v25);
        v26 -= v25;
        if ((v26 < 0) ^ v27 | (v26 == 0))
          break;
LABEL_28:
        v25 = read(v24, v56, 0x2000uLL);
      }
      if (!-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
      {
        v26 = 0x4000000;
        goto LABEL_28;
      }
      v28 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Asked to defer activity during compression. Aborting...\n", buf, 2u);
      }
LABEL_31:
      close(v24);
      archive_entry_free(v21);
      if (-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred"))
        goto LABEL_36;
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  }
  while (v16);

LABEL_35:
  v17 = 0;
LABEL_36:

  v29 = !-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred");
  archive_write_close(v15);
  v30 = v29;
  archive_write_free(v15);
  if ((v29 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v32 = objc_msgSend(v31, "fileExistsAtPath:", v46);

    if (v32)
      objc_msgSend(v42, "removeItemAtPath:error:", v46, 0);
  }
  v33 = v46;
  if (!v30)
    v33 = 0;
  v34 = v33;

  return v34;
}

- (id)_checkAndCompressFiles
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 3);
  if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
  {
    v3 = 0;
LABEL_11:
    v3 = v3;
    v4 = v3;
    goto LABEL_12;
  }
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _compressFilesForSpd:](self, "_compressFilesForSpd:", 0));
  if (!-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred"))
  {
    if (!v3
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager")),
          v6 = objc_msgSend(v5, "fileExistsAtPath:", v3),
          v5,
          (v6 & 1) == 0))
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_1000411EC();
      -[ASPCarryLog_ExtractUpload _checkAndHandleExcessiveCompressionErrors](self, "_checkAndHandleExcessiveCompressionErrors");

      v3 = 0;
    }
    -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 0);
    goto LABEL_11;
  }
  v4 = 0;
LABEL_12:

  return v4;
}

- (void)_checkAndHandleExcessiveCompressionErrors
{
  -[ASPCarryLog_ExtractUpload setNumB2BZipErrors:](self, "setNumB2BZipErrors:", -[ASPCarryLog_ExtractUpload numB2BZipErrors](self, "numB2BZipErrors") + 1);
  if (-[ASPCarryLog_ExtractUpload numB2BZipErrors](self, "numB2BZipErrors") >= 4)
  {
    -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
    -[ASPCarryLog_ExtractUpload setNumB2BZipErrors:](self, "setNumB2BZipErrors:", 0);
  }
  -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0);
}

- (id)_prepareContentsToUpload
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));

  if (v3)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041218();
  }
  else if (-[ASPCarryLog_ExtractUpload _tryCreateWorkDirectories](self, "_tryCreateWorkDirectories")
         && (-[ASPCarryLog_ExtractUpload _getStage](self, "_getStage") > 1
          || -[ASPCarryLog_ExtractUpload _checkAndExtractFiles](self, "_checkAndExtractFiles"))
         && (-[ASPCarryLog_ExtractUpload _getStage](self, "_getStage") > 2
          || -[ASPCarryLog_ExtractUpload _checkAndConvertIOLog](self, "_checkAndConvertIOLog")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _checkAndCompressFiles](self, "_checkAndCompressFiles"));
    return v4;
  }
  v4 = 0;
  return v4;
}

- (id)_getUploadContentPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));

  if (!v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _prepareContentsToUpload](self, "_prepareContentsToUpload"));
    if (!-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred") && v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));

      -[ASPCarryLog_ExtractUpload _savePendingUploadFilePath:](self, "_savePendingUploadFilePath:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      objc_msgSend(v8, "moveItemAtPath:toPath:error:", v5, v4, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      LODWORD(v7) = objc_msgSend(v9, "fileExistsAtPath:", v4);

      if ((_DWORD)v7)
      {
        -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
        goto LABEL_9;
      }

    }
    v4 = 0;
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));
  v5 = 0;
LABEL_9:

  return v4;
}

- (void)tryExtractUpload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  unint64_t v32;
  void *v33;
  int v34;
  id v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  id v39;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  -[ASPCarryLog_ExtractUpload _jetSamStatsCollect_start](self, "_jetSamStatsCollect_start");
  -[ASPCarryLog_ExtractUpload setXpcActivityMgr:](self, "setXpcActivityMgr:", v4);
  v6 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload deviceId](self, "deviceId")),
        v8,
        v7,
        v8))
  {
    if (-[ASPCarryLog_ExtractUpload _isPendingSpdHandling](self, "_isPendingSpdHandling"))
    {
      -[ASPCarryLog_ExtractUpload _tryExtractUploadSpd](self, "_tryExtractUploadSpd");
    }
    else if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
    {
      v12 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deferring before IOLog extraction", (uint8_t *)&v34, 2u);
      }
    }
    else if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild")
           || -[ASPCarryLog_ExtractUpload isEnoughDiskSpace](self, "isEnoughDiskSpace"))
    {
      v13 = -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize");
      if (v13 >= -[ASPCarryLog_ExtractUpload uploadSizeLimit](self, "uploadSizeLimit"))
      {
        v25 = (void *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v25;
          v27 = -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize");
          v28 = -[ASPCarryLog_ExtractUpload uploadSizeLimit](self, "uploadSizeLimit");
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId")));
          v34 = 134218498;
          v35 = (id)v27;
          v36 = 2048;
          v37 = v28;
          v38 = 2080;
          v39 = objc_msgSend(v29, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Total upload size bytes %llu exceeding limit %llu, for tasking %s", (uint8_t *)&v34, 0x20u);

        }
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _getUploadContentPath](self, "_getUploadContentPath"));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attributesOfItemAtPath:error:", v14, 0));
          v17 = objc_msgSend(v16, "fileSize");

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadDriver](self, "uploadDriver"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload deviceId](self, "deviceId"));
          v21 = objc_msgSend(v18, "uploadFile:TaskingId:DeviceId:LogType:", v14, v19, v20, CFSTR("com.apple.nand.iolog"));

          v22 = (void *)oslog;
          if (v21)
          {
            if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_retainAutorelease(v14);
              v24 = v22;
              v34 = 136315138;
              v35 = objc_msgSend(v23, "UTF8String");
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Content %s passed to uploader.\n", (uint8_t *)&v34, 0xCu);

            }
          }
          else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
          {
            sub_100041270();
          }
          -[ASPCarryLog_ExtractUpload _removePendingUploadFilePath](self, "_removePendingUploadFilePath");
          -[ASPCarryLog_ExtractUpload _updateUploadInfoWithContentPath:contentSize:](self, "_updateUploadInfoWithContentPath:contentSize:", v14, v17);
          v32 = -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize");
          if (v32 >= -[ASPCarryLog_ExtractUpload uploadSizeLimit](self, "uploadSizeLimit"))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
            objc_msgSend(v33, "iolog_disable");

          }
          else if (-[ASPCarryLog_ExtractUpload _internalCheckNextSpdExtract](self, "_internalCheckNextSpdExtract"))
          {
            -[ASPCarryLog_ExtractUpload _tryExtractUploadSpd](self, "_tryExtractUploadSpd");
          }
        }
        else
        {
          v31 = oslog;
          if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v34) = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No upload.\n", (uint8_t *)&v34, 2u);
          }
        }

      }
    }
    else
    {
      v30 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Low disk space, do not perform extract upload.", (uint8_t *)&v34, 2u);
      }
      if (-[ASPCarryLog_ExtractUpload _getDiskSpaceFlag](self, "_getDiskSpaceFlag"))
        -[ASPCarryLog_ExtractUpload _updateUploadInfoWithContentPath:contentSize:](self, "_updateUploadInfoWithContentPath:contentSize:", 0, 0);
    }
  }
  else
  {
    -[ASPCarryLog_ExtractUpload _cleanUpinProgressFiles](self, "_cleanUpinProgressFiles");
    -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));
      objc_msgSend(v10, "removeItemAtPath:error:", v11, 0);

    }
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041244();
  }
  -[ASPCarryLog_ExtractUpload _jetSamStatsCollect_end](self, "_jetSamStatsCollect_end");
  objc_autoreleasePoolPop(v5);

}

- (void)_jetSamStatsCollect_start
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getValueForKey:expectedType:", CFSTR("extractupload_running"), 0));

  if (v4)
    -[ASPCarryLog_ExtractUpload _incrementCntForKey:](self, "_incrementCntForKey:", CFSTR("extractupload_jetsam_count"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  objc_msgSend(v5, "setValue:forKey:", CFSTR("YES"), CFSTR("extractupload_running"));

}

- (void)_jetSamStatsCollect_end
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  objc_msgSend(v2, "deleteKey:", CFSTR("extractupload_running"));

}

- (void)_incrementCntForKey:(id)a3
{
  void *v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getValueForKey:expectedType:", v8, 1));

  if (v5)
    v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1));
  else
    v6 = &off_1000AC068;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  objc_msgSend(v7, "setValue:forKey:", v6, v8);

}

- (BOOL)_tryDeferXpcActivity
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));

  if (v3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
    v4 = objc_msgSend(v3, "isXpcActivityDeferred");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
    LODWORD(v3) = objc_msgSend(v5, "tryDeferXpcActivity");

    if ((v4 & 1) == 0)
    {
      if ((_DWORD)v3)
      {
        -[ASPCarryLog_ExtractUpload _incrementCntForKey:](self, "_incrementCntForKey:", CFSTR("extractupload_defer_count"));
        if (-[ASPCarryLog_ExtractUpload isIOLogEnableNeeded](self, "isIOLogEnableNeeded"))
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
          v7 = objc_msgSend(v6, "iolog_enable");

          if (v7)
            -[ASPCarryLog_ExtractUpload setIsIOLogEnableNeeded:](self, "setIsIOLogEnableNeeded:", 0);
        }
      }
    }
  }
  return (char)v3;
}

- (BOOL)_isXpcActivityDeferred
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
    v5 = objc_msgSend(v4, "isXpcActivityDeferred");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setStage:(int)a3
{
  gCurrentExtractUploadStage = a3;
}

- (int)_getStage
{
  return gCurrentExtractUploadStage;
}

- (BOOL)_isIOLogFromHwLogger
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  FILE *v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (!v5)
    return 0;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath")));
  v7 = fopen((const char *)objc_msgSend(v6, "UTF8String"), "r");

  if (!v7)
    return 0;
  v8 = iolog_is_from_hwlogger(v7);
  fclose(v7);
  return v8;
}

- (void)_forceDeferXpcActivity
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
  objc_msgSend(v2, "forceDeferXpcActivity");

}

- (int)_getSpdState
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spd_state")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_msgSend(v3, "unsignedIntValue");
    if (v5 <= 2)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_internalCheckNextSpdExtract
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  uint8_t v11[16];

  if (!-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
    return 0;
  v3 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));
    v7 = objc_msgSend(v5, "compare:", v6);

    if (v7 != (id)1)
      return 0;
  }
  v8 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Time to periodically extract SPD for internal build.", v11, 2u);
  }
  v9 = 1;
  -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 1);
  -[ASPCarryLog_ExtractUpload setIsPeriodicSpd:](self, "setIsPeriodicSpd:", 1);
  return v9;
}

- (void)_tryExtractUploadSpd
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Extract and upload SPD start.", buf, 2u);
  }
  if (!-[ASPCarryLog_ExtractUpload spdState](self, "spdState")
    || -[ASPCarryLog_ExtractUpload spdState](self, "spdState") >= 3)
  {
    v4 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10004129C(v4, self);
    -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 0);
  }
  if (!-[ASPCarryLog_ExtractUpload _tryCreateWorkDirectories](self, "_tryCreateWorkDirectories"))
    -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 0);
  if (-[ASPCarryLog_ExtractUpload spdState](self, "spdState") == 1)
    -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", -[ASPCarryLog_ExtractUpload _tryExtractSpdToNextState](self, "_tryExtractSpdToNextState"));
  if (-[ASPCarryLog_ExtractUpload spdState](self, "spdState") == 2)
  {
    if (-[ASPCarryLog_ExtractUpload isPeriodicSpd](self, "isPeriodicSpd"))
    {
      v5 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "End this run after periodic spd extraction. Wait for next activity trigger to upload", v15, 2u);
      }
      goto LABEL_25;
    }
    if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
    {
LABEL_25:
      v6 = 0;
      goto LABEL_26;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _compressFilesForSpd:](self, "_compressFilesForSpd:", 1));
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributesOfItemAtPath:error:", v6, 0));
      -[ASPCarryLog_ExtractUpload setLastTotalUploadSize:](self, "setLastTotalUploadSize:", objc_msgSend(v10, "fileSize"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadDriver](self, "uploadDriver"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload deviceId](self, "deviceId"));
      objc_msgSend(v11, "uploadFile:TaskingId:DeviceId:LogType:", v6, v12, v13, CFSTR("com.apple.nand.iolog.spd"));

      -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
      -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 0);
    }
  }
  else
  {
    v6 = 0;
  }
  if (!-[ASPCarryLog_ExtractUpload spdState](self, "spdState"))
  {
    if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
    {
      v7 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting next SPD extraction time", v14, 2u);
      }
      -[ASPCarryLog_ExtractUpload _internalSetNextSpdExtractionTime](self, "_internalSetNextSpdExtractionTime");
    }
    -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0);
    if (-[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx") <= 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
      objc_msgSend(v8, "iolog_enable");

    }
  }
LABEL_26:

}

- (unsigned)_tryExtractSpdToNextState
{
  void *v3;
  id v4;
  id v5;
  FILE *v6;
  NSObject *v7;
  int v8;
  void *v9;
  char v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v23[4];
  unsigned int v24;
  uint64_t v25;
  size_t __size;
  char v27;

  v27 = 0;
  v25 = 0;
  __size = 0;
  v24 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  v4 = objc_msgSend(v3, "getSpdHdrWithSize:gcIdle:totalLbaCnt:estSpdSize:", &__size, &v27, &v25, &v24);

  if (!v4 || !__size || !v25)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041360();
    __size = 0;
    if (!v4)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (!v27)
  {
    -[ASPCarryLog_ExtractUpload _forceDeferXpcActivity](self, "_forceDeferXpcActivity");
    free(v4);
    return 1;
  }
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath")));
  v6 = fopen((const char *)objc_msgSend(v5, "UTF8String"), "w");

  if (!v6)
  {
    v12 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10004138C(v12, self);
LABEL_17:
    free(v4);
LABEL_18:
    v11 = 0;
    v8 = 0;
    goto LABEL_19;
  }
  v7 = oslog;
  if (v24 < 0xC800001)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start extracting full SPD data", v23, 2u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
    v19 = objc_msgSend(v18, "writeFullSpdToFileWithHdrBuf:hdrSize:totalLbaCnt:filePtr:spdSizeLimit:", v4, __size, v25, v6, 209715200);

    v20 = oslog;
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        v11 = 2;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SPD data successfully written to file.", v23, 2u);
        v10 = 0;
      }
      else
      {
        v10 = 0;
        v11 = 2;
      }
      v8 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_1000414C0();
      v8 = 0;
      v11 = 0;
      v10 = 1;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041438((int *)&v24, v7);
    v8 = 1;
    fwrite(v4, __size, 1uLL, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
    objc_msgSend(v9, "addSpdEstSizeExceedLimitToFile:limit:", v6, 209715200);

    v10 = 0;
    v11 = 2;
  }
  free(v4);
  fclose(v6);
  if ((v10 & 1) == 0)
  {
LABEL_36:
    if ((v8 & 1) == 0)
      return v11;
    goto LABEL_37;
  }
LABEL_19:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
  v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041334();
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
    objc_msgSend(v16, "removeItemAtPath:error:", v17, 0);

    goto LABEL_36;
  }
  if (!v8)
    return v11;
LABEL_37:
  v21 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SPD extraction done. Saving state...", v23, 2u);
  }
  -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 2);
  return v11;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
  objc_storeStrong((id *)&self->_nandDriver, a3);
}

- (CarryLog_UploadDriver)uploadDriver
{
  return self->_uploadDriver;
}

- (void)setUploadDriver:(id)a3
{
  objc_storeStrong((id *)&self->_uploadDriver, a3);
}

- (StateMgr)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
  objc_storeStrong((id *)&self->_stateMgr, a3);
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
  objc_storeStrong((id *)&self->_workDir, a3);
}

- (NSString)taskingId
{
  return self->_taskingId;
}

- (void)setTaskingId:(id)a3
{
  objc_storeStrong((id *)&self->_taskingId, a3);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (NSString)endTimeStr
{
  return self->_endTimeStr;
}

- (void)setEndTimeStr:(id)a3
{
  objc_storeStrong((id *)&self->_endTimeStr, a3);
}

- (NSString)spdFilePath
{
  return self->_spdFilePath;
}

- (void)setSpdFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_spdFilePath, a3);
}

- (NSString)tarInProgressDir
{
  return self->_tarInProgressDir;
}

- (void)setTarInProgressDir:(id)a3
{
  objc_storeStrong((id *)&self->_tarInProgressDir, a3);
}

- (NSString)iologPath
{
  return self->_iologPath;
}

- (void)setIologPath:(id)a3
{
  objc_storeStrong((id *)&self->_iologPath, a3);
}

- (NSString)nandcounterPath
{
  return self->_nandcounterPath;
}

- (void)setNandcounterPath:(id)a3
{
  objc_storeStrong((id *)&self->_nandcounterPath, a3);
}

- (NSString)nandstatsPath
{
  return self->_nandstatsPath;
}

- (void)setNandstatsPath:(id)a3
{
  objc_storeStrong((id *)&self->_nandstatsPath, a3);
}

- (NSString)convertedIologPath
{
  return self->_convertedIologPath;
}

- (void)setConvertedIologPath:(id)a3
{
  objc_storeStrong((id *)&self->_convertedIologPath, a3);
}

- (NSString)pendingUploadFile
{
  return self->_pendingUploadFile;
}

- (void)setPendingUploadFile:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUploadFile, a3);
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (NSString)uploadInfoKey
{
  return self->_uploadInfoKey;
}

- (void)setUploadInfoKey:(id)a3
{
  objc_storeStrong((id *)&self->_uploadInfoKey, a3);
}

- (NSDictionary)uploadInfo
{
  return self->_uploadInfo;
}

- (void)setUploadInfo:(id)a3
{
  objc_storeStrong((id *)&self->_uploadInfo, a3);
}

- (int)spdState
{
  return self->_spdState;
}

- (void)setSpdState:(int)a3
{
  self->_spdState = a3;
}

- (BOOL)isPeriodicSpd
{
  return self->_isPeriodicSpd;
}

- (void)setIsPeriodicSpd:(BOOL)a3
{
  self->_isPeriodicSpd = a3;
}

- (NSDate)nextSpdExtractTime
{
  return self->_nextSpdExtractTime;
}

- (void)setNextSpdExtractTime:(id)a3
{
  objc_storeStrong((id *)&self->_nextSpdExtractTime, a3);
}

- (int)uploadIdx
{
  return self->_uploadIdx;
}

- (void)setUploadIdx:(int)a3
{
  self->_uploadIdx = a3;
}

- (unint64_t)lastTotalUploadSize
{
  return self->_lastTotalUploadSize;
}

- (void)setLastTotalUploadSize:(unint64_t)a3
{
  self->_lastTotalUploadSize = a3;
}

- (unint64_t)uploadSizeLimit
{
  return self->_uploadSizeLimit;
}

- (void)setUploadSizeLimit:(unint64_t)a3
{
  self->_uploadSizeLimit = a3;
}

- (BOOL)isEnoughDiskSpace
{
  return self->_isEnoughDiskSpace;
}

- (void)setIsEnoughDiskSpace:(BOOL)a3
{
  self->_isEnoughDiskSpace = a3;
}

- (int)numB2BZipErrors
{
  return self->_numB2BZipErrors;
}

- (void)setNumB2BZipErrors:(int)a3
{
  self->_numB2BZipErrors = a3;
}

- (XpcActivityManager)xpcActivityMgr
{
  return self->_xpcActivityMgr;
}

- (void)setXpcActivityMgr:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityMgr, a3);
}

- (BOOL)isIOLogEnableNeeded
{
  return self->_isIOLogEnableNeeded;
}

- (void)setIsIOLogEnableNeeded:(BOOL)a3
{
  self->_isIOLogEnableNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityMgr, 0);
  objc_storeStrong((id *)&self->_nextSpdExtractTime, 0);
  objc_storeStrong((id *)&self->_uploadInfo, 0);
  objc_storeStrong((id *)&self->_uploadInfoKey, 0);
  objc_storeStrong((id *)&self->_pendingUploadFile, 0);
  objc_storeStrong((id *)&self->_convertedIologPath, 0);
  objc_storeStrong((id *)&self->_nandstatsPath, 0);
  objc_storeStrong((id *)&self->_nandcounterPath, 0);
  objc_storeStrong((id *)&self->_iologPath, 0);
  objc_storeStrong((id *)&self->_tarInProgressDir, 0);
  objc_storeStrong((id *)&self->_spdFilePath, 0);
  objc_storeStrong((id *)&self->_endTimeStr, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_taskingId, 0);
  objc_storeStrong((id *)&self->_workDir, 0);
  objc_storeStrong((id *)&self->_stateMgr, 0);
  objc_storeStrong((id *)&self->_uploadDriver, 0);
  objc_storeStrong((id *)&self->_nandDriver, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
