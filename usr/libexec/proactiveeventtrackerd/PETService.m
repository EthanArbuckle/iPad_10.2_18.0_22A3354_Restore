@implementation PETService

- (PETService)init
{
  PETService *v2;
  PETEventTracker2 *v3;
  PETEventTracker2 *tracker;
  PETService *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PETService;
  v2 = -[PETService init](&v8, "init");
  if (!v2)
  {
LABEL_6:
    v5 = v2;
    goto LABEL_10;
  }
  v2->_isInternalDevice = +[_PASDeviceInfo isInternalBuild](_PASDeviceInfo, "isInternalBuild");
  v3 = (PETEventTracker2 *)objc_msgSend(objc_alloc((Class)PETEventTracker2), "initWithAsyncEnabled:", 0);
  tracker = v2->_tracker;
  v2->_tracker = v3;

  if (v2->_tracker)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PETService has been initialized", v7, 2u);
    }
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.inited"), &off_10000CDC8);
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize the tracker", v7, 2u);
  }
  AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.error_init"), &off_10000CDA0);
  v5 = 0;
LABEL_10:

  return v5;
}

- (void)upload
{
  PETServiceUploadAssembler *v3;
  void *v4;
  PETServiceUploadAssembler *v5;
  void *v6;
  PETEventTracker2 *tracker;
  _QWORD v8[4];
  PETServiceUploadAssembler *v9;
  PETService *v10;
  uint8_t buf[16];

  v3 = [PETServiceUploadAssembler alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PETEventTracker2 rootDir](self->_tracker, "rootDir"));
  v5 = -[PETServiceUploadAssembler initWithRootDir:](v3, "initWithRootDir:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler assembleAggregatedUploadWithTracker:](v5, "assembleAggregatedUploadWithTracker:", self->_tracker));
    if (v6)
      -[PETService _uploadWithUploadPackage:](self, "_uploadWithUploadPackage:", v6);
    tracker = self->_tracker;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000663C;
    v8[3] = &unk_10000C450;
    v9 = v5;
    v10 = self;
    -[PETEventTracker2 enumerateMessageGroups:](tracker, "enumerateMessageGroups:", v8);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize the upload assembler", buf, 2u);
  }

}

- (BOOL)_writeUploadForTransparency:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  PETServiceUploadAssembler *v14;
  void *v15;
  PETServiceUploadAssembler *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v31;
  id obj;
  PETServiceUploadAssembler *v33;
  _QWORD v34[4];
  NSMutableArray *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[8];
  _QWORD v41[4];
  NSMutableArray *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregatedMessages"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventTracker2 formattedTextForAggregatedMessage:](PETEventTracker2, "formattedTextForAggregatedMessage:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i)));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v8);
  }

  if (!-[NSMutableArray count](v5, "count"))
    goto LABEL_10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("proactive_event_tracker-"), "stringByAppendingString:", CFSTR("aggregated")));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100006544;
  v41[3] = &unk_10000C478;
  v42 = v5;
  v13 = OSAWriteLogForSubmission(CFSTR("303"), v12, 0, 0, v41);

  if (!v13)
  {
    v29 = 0;
  }
  else
  {
LABEL_10:
    v14 = [PETServiceUploadAssembler alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PETEventTracker2 rootDir](self->_tracker, "rootDir"));
    v16 = -[PETServiceUploadAssembler initWithRootDir:](v14, "initWithRootDir:", v15);

    v33 = v16;
    if (v16)
    {
      v17 = objc_opt_new(NSMutableArray);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageGroup"));

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v31 = v4;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unaggregatedMessages"));
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](v33, "petConfig"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventTracker2 formattedTextForUnaggregatedMessage:messageGroup:config:](PETEventTracker2, "formattedTextForUnaggregatedMessage:messageGroup:config:", v24, v19, v25));

            -[NSMutableArray addObject:](v17, "addObject:", v26);
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        }
        while (v21);
      }

      if (-[NSMutableArray count](v17, "count"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_")));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("proactive_event_tracker-"), "stringByAppendingString:", v27));
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000065D0;
        v34[3] = &unk_10000C478;
        v35 = v17;
        v29 = OSAWriteLogForSubmission(CFSTR("303"), v28, 0, 0, v34);

      }
      else
      {
        v29 = 1;
      }
      v4 = v31;

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize the upload assembler", buf, 2u);
      }
      v29 = 0;
    }

  }
  return v29;
}

- (void)_uploadToFBFv2WithUpload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
  objc_msgSend(v4, "setUploadService:", 2);

  objc_msgSend(v3, "clearUnaggregatedMessages");
  objc_msgSend(v3, "clearAggregatedMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending upload data to FBFv2.", buf, 2u);
  }
  v6 = objc_msgSend(objc_alloc((Class)PETSchemaPETUpload), "initWithData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrapAsAnyEvent"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FLLogger sharedLogger](FLLogger, "sharedLogger"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000062D0;
    v9[3] = &unk_10000C4A0;
    v10 = v3;
    v11 = v5;
    objc_msgSend(v8, "reportSiriInstrumentationEvent:forBundleID:completion:", v7, CFSTR("com.apple.proactive.eventtracker"), v9);

  }
}

- (void)_uploadToParsecWithUpload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _BYTE buf[24];
  void *v32;
  uint64_t *v33;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
  objc_msgSend(v4, "setUploadService:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending upload data to Parsec.", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageGroup"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("_aggregated"));

  if (v8)
    v9 = 14;
  else
    v9 = 7;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v10 = (void *)qword_100010A08;
  v28 = qword_100010A08;
  if (!qword_100010A08)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100005F98;
    v32 = &unk_10000C4F0;
    v33 = &v25;
    sub_100005F98((uint64_t)buf);
    v10 = (void *)v26[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v25, 8);
  v12 = [v11 alloc];
  v13 = objc_msgSend(v12, "initWithType:data:", v9, v5, v25);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v14 = (void *)qword_100010A18;
  v28 = qword_100010A18;
  if (!qword_100010A18)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100006134;
    v32 = &unk_10000C4F0;
    v33 = &v25;
    sub_100006134((uint64_t)buf);
    v14 = (void *)v26[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v25, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sharedSession", v25));
  v17 = v16;
  if (v13 && v16)
  {
    objc_msgSend(v16, "sendCustomFeedback:", v13);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageGroup"));
      v20 = objc_msgSend(v5, "length");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Upload data has been sent to Parsec. messageGroup: %@; size: %lu",
        buf,
        0x16u);

    }
    v29[0] = CFSTR("message_group");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "messageGroup"));
    v30[0] = v22;
    v29[1] = CFSTR("compressed_size");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "length")));
    v30[1] = v23;
    v29[2] = CFSTR("upload_service");
    v30[2] = CFSTR("parsec");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.uploaded"), v24);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to initialize Parsec feedback or session objects", buf, 2u);
  }

}

- (id)_createMetadataFrom:(id)a3 submissionId:(id)a4 messageName:(id)a5 typeId:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new(COMAPPLEPETCOMMONPETMetadata);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "device"));
  objc_msgSend(v12, "setDevice:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  objc_msgSend(v12, "setIsInternal:", objc_msgSend(v15, "isInternal"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  objc_msgSend(v12, "setIsSeed:", objc_msgSend(v16, "isSeed"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  objc_msgSend(v12, "setIsGm:", objc_msgSend(v17, "isGm"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  objc_msgSend(v12, "setIsInternalCarry:", objc_msgSend(v18, "isInternalCarry"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  objc_msgSend(v12, "setUploadTime:", objc_msgSend(v19, "uploadTime"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "build"));
  objc_msgSend(v12, "setBuild:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  objc_msgSend(v12, "setConfigVersion:", objc_msgSend(v22, "configVersion"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "country"));
  objc_msgSend(v12, "setCountry:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "language"));
  objc_msgSend(v12, "setLanguage:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "messageGroup"));
  objc_msgSend(v12, "setMessageGroup:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "platform"));
  objc_msgSend(v12, "setPlatform:", v30);

  objc_msgSend(v12, "setUploadService:", 3);
  objc_msgSend(v12, "setPseudoDeviceId:", v10);

  objc_msgSend(v12, "setMessageName:", v9);
  objc_msgSend(v12, "setTypeId:", v6);
  return v12;
}

- (void)_uploadGMSDataToPFA:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const __CFString *v33;
  _BYTE v34[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unaggregatedMessages"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_opt_new(COMAPPLEPROACTIVEGMSGMSPETUploadEvent);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PETService _createMetadataFrom:submissionId:messageName:typeId:](self, "_createMetadataFrom:submissionId:messageName:typeId:", v7, v5, v14, objc_msgSend(v12, "typeId")));
        objc_msgSend(v13, "setMetadata:", v15);

        v16 = objc_alloc((Class)PBDataReader);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rawBytes"));
        v18 = objc_msgSend(v16, "initWithData:", v17);

        v19 = (void *)objc_opt_new(COMAPPLEPROACTIVEGMSGMSUberEvent);
        COMAPPLEPROACTIVEGMSGMSUberEventReadFrom(v19, v18);
        objc_msgSend(v13, "setUberEvent:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data"));
        objc_msgSend(v6, "addObject:", v20);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218242;
    v31 = v21;
    v32 = 2112;
    v33 = CFSTR("com.apple.proactive.gms.PetUploadEvent");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Repackaged %lu GMS messages, ready for uploading to PFA with schema: %@", buf, 0x16u);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "messageGroup"));
  -[PETService _uploadBatchedDataToPFA:schema:messageGroup:](self, "_uploadBatchedDataToPFA:schema:messageGroup:", v6, CFSTR("com.apple.proactive.gms.PetUploadEvent"), v23);

}

- (void)_uploadBatchedDataToPFA:(id)a3 schema:(id)a4 messageGroup:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FLLogger sharedLoggerWithPersistenceConfiguration:](FLLogger, "sharedLoggerWithPersistenceConfiguration:", 1));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v24;
    *(_QWORD *)&v13 = 138412290;
    v19 = v13;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v16);
        if ((objc_opt_respondsToSelector(v10, "reportDataPlatformBatchedEvent:forBundleID:ofSchema:completion:") & 1) != 0)
        {
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100005D94;
          v20[3] = &unk_10000C4A0;
          v21 = v9;
          v22 = v17;
          objc_msgSend(v10, "reportDataPlatformBatchedEvent:forBundleID:ofSchema:completion:", v17, CFSTR("com.apple.proactive"), v8, v20);
          v18 = v21;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v30 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@ is failed to upload to PFA backend", buf, 0xCu);
          }
          v27[0] = CFSTR("reason");
          v27[1] = CFSTR("group");
          v28[0] = CFSTR("PFA-backend is not available ");
          v28[1] = v9;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2, v19));
          AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.upload_failed"), v18);
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

}

- (void)_uploadWithUploadPackage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  int v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v4 = a3;
  if ((+[_PASDeviceInfo isDNUEnabled](_PASDeviceInfo, "isDNUEnabled") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageGroup"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
      objc_msgSend(v7, "setMessageGroup:", CFSTR("null"));

    }
    if (-[PETService _writeUploadForTransparency:](self, "_writeUploadForTransparency:", v4))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PETMetadata getCountryCode](PETMetadata, "getCountryCode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
      if ((objc_msgSend(v9, "isInternal") & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageGroup"));
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.generativefunctions.instrumentation.UberEvent"));

        if (v12)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "messageGroup"));
            v22 = 138412290;
            v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found GMS Event Message Group: %@", (uint8_t *)&v22, 0xCu);

          }
          -[PETService _uploadGMSDataToPFA:](self, "_uploadGMSDataToPFA:", v4);
        }
      }
      else
      {

      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CN")))
      {
        -[PETService _uploadToFBFv2WithUpload:](self, "_uploadToFBFv2WithUpload:", v4);
LABEL_26:

        goto LABEL_27;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[PETServiceUploadAssembler loadPETConfig](PETServiceUploadAssembler, "loadPETConfig"));
      if ((objc_msgSend(v18, "shouldUploadToFBFv2") & 1) != 0)
        goto LABEL_22;
      if (objc_msgSend(v18, "shouldUploadToFBFv2ForCarryAndSeed"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
        if (objc_msgSend(v19, "isInternal"))
        {

LABEL_22:
          -[PETService _uploadToFBFv2WithUpload:](self, "_uploadToFBFv2WithUpload:", v4);
          goto LABEL_23;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
        v21 = objc_msgSend(v20, "isSeed");

        if (v21)
          goto LABEL_22;
      }
LABEL_23:
      if (objc_msgSend(v18, "shouldUploadToParsec"))
        -[PETService _uploadToParsecWithUpload:](self, "_uploadToParsecWithUpload:", v4);

      goto LABEL_26;
    }
    v24[0] = CFSTR("reason");
    v24[1] = CFSTR("group");
    v25[0] = CFSTR("write_osa");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "messageGroup"));
    v25[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.upload_failed"), v17);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to write upload data to OSAnalytics for transparency", (uint8_t *)&v22, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "DNU is disabled. Skip uploading", (uint8_t *)&v22, 2u);
  }
LABEL_27:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

+ (void)updateMobileAssetMetadataWithXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  dispatch_queue_t v4;
  id v5;
  _xpc_activity_s *v6;
  _QWORD v7[4];
  _xpc_activity_s *v8;
  uint8_t buf[16];

  v3 = (_xpc_activity_s *)a3;
  v4 = dispatch_queue_create("PETAsset-notifications", 0);
  v5 = objc_msgSend(objc_alloc((Class)_PASAsset2), "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:", CFSTR("/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist"), 0, 0, v4, &_os_log_default);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Kicking off mobile asset metadata download.", buf, 2u);
  }
  if (!xpc_activity_set_state(v3, 4) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to CONTINUE", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000684C;
  v7[3] = &unk_10000C4C8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "downloadMetadataWithCompletion:", v7);

}

+ (void)clearAllLogs
{
  void *v2;
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)PETEventTracker2), "initWithAsyncEnabled:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aggregateState"));
  objc_msgSend(v2, "reset");

  objc_msgSend(v3, "clearLogStores");
}

@end
