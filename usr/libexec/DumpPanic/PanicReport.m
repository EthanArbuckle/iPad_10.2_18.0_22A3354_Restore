@implementation PanicReport

- (PanicReport)initWithPanicString:(id)a3 otherString:(id)a4 buildVersion:(id)a5 panicFlags:(unint64_t)a6 panicType:(id)a7 incidentID:(id)a8 rootsInstalled:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  PanicReport *v20;
  PanicReport *v21;
  NSMutableArray *socdContainerArray;
  NSString *socdNandContainer;
  NSData *extPaniclog;
  NSData *panicInitiator;
  NSNumber *foregroundAppHash;
  NSMutableDictionary *utilizationInfo;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;

  v30 = a3;
  v29 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v33 = 0;
  v20 = (PanicReport *)-[PanicReport initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:](self, "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:", 0, 0, 0, &v33, 1, 0);
  v21 = v20;
  if (v20)
  {
    if (v18)
      -[PanicReport setIncidentID:](v20, "setIncidentID:", v18, v29, v30);
    objc_storeStrong((id *)&v21->_panicString, a3);
    objc_storeStrong((id *)&v21->_otherString, a4);
    objc_storeStrong((id *)&v21->_buildVersion, a5);
    v21->_panicFlags = a6;
    v21->_isBtnReset = (a6 & 0x80) != 0;
    v21->_isInterruptedCoredump = objc_msgSend(v17, "isEqual:", CFSTR("interrupted coredump panic"));
    objc_storeStrong((id *)&v21->_rootsInstalled, a9);
    if (&_AnalyticsSendEventLazy)
    {
      if (v21->_isBtnReset)
      {
        AnalyticsSendEventLazy(CFSTR("com.apple.coreOS.forceReset"), &stru_100034E98);
      }
      else
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100026EE4;
        v31[3] = &unk_100034EC0;
        v32 = v17;
        AnalyticsSendEventLazy(CFSTR("com.apple.stability.panic"), v31);

      }
    }
    socdContainerArray = v21->_socdContainerArray;
    v21->_socdContainerArray = 0;

    socdNandContainer = v21->_socdNandContainer;
    v21->_socdNandContainer = 0;

    extPaniclog = v21->_extPaniclog;
    v21->_extPaniclog = 0;

    panicInitiator = v21->_panicInitiator;
    v21->_panicInitiator = 0;

    foregroundAppHash = v21->_foregroundAppHash;
    v21->_foregroundAppHash = 0;

    v21->_foregroundAppHashSet = 0;
    utilizationInfo = v21->_utilizationInfo;
    v21->_utilizationInfo = 0;

  }
  return v21;
}

- (void)setSOCIdAndRev
{
  sub_10000FA6C((uint64_t)"chosen", "chip-id", &self->_socId);
  sub_10000FA6C((uint64_t)"arm-io", "chip-revision", &self->_socRev);
}

- (void)setUtilizationInfo:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_utilizationInfo, a3);
    v5 = v6;
  }

}

- (void)useSocdNandContainer:(id)a3
{
  objc_storeStrong((id *)&self->_socdNandContainer, a3);
}

- (void)useExtPaniclog:(id)a3
{
  objc_storeStrong((id *)&self->_extPaniclog, a3);
}

- (void)useSocdContainer:(id)a3
{
  objc_storeStrong((id *)&self->_socdContainerArray, a3);
}

- (void)setForegroundAppHash:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundAppHash, a3);
  self->_foregroundAppHashSet = 1;
}

- (void)setPanicString:(id)a3
{
  objc_storeStrong((id *)&self->_panicString, a3);
}

- (void)setPanicInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_panicInitiator, a3);
}

- (id)getBuildVersionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productNameVersionBuildString"));

  if (-[NSString length](self->_buildVersion, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productName"));
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v6, self->_buildVersion));

    v4 = (void *)v7;
  }
  return v4;
}

- (id)additionalIPSMetadata
{
  void *v3;
  void *v4;
  void *v5;
  NSNumber *v6;
  size_t v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport incidentID](self, "incidentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v3, kOSALogMetadataIncidentID));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport getBuildVersionString](self, "getBuildVersionString"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("os_version"));

  v6 = self->_rootsInstalled;
  if (v6
    || (v8 = 8, v9 = 0, !sysctlbyname("kern.roots_installed", &v9, &v8, 0, 0))
    && (v6 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9))) != 0)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("roots_installed"));

  }
  return v4;
}

- (void)useStoragePanicData:(id)a3
{
  objc_storeStrong((id *)&self->_storagePanicData, a3);
}

- (id)problemType
{
  if (self->_isBtnReset)
    return CFSTR("151");
  else
    return CFSTR("210");
}

- (id)appleCareDetails
{
  return &__NSArray0__struct;
}

- (id)reportNamePrefix
{
  const __CFString *v3;
  const __CFString *v4;

  if (-[PanicReport ss_sequence](self, "ss_sequence") == -1)
  {
    if (self->_storagePanicData)
    {
      v3 = CFSTR("-base+storage_crash");
    }
    else if (self->_socdContainerArray)
    {
      v3 = CFSTR("-base+socd");
    }
    else
    {
      v3 = CFSTR("-base");
    }
  }
  else
  {
    v3 = CFSTR("-full");
  }
  if (self->_isBtnReset)
    v4 = CFSTR("forceReset");
  else
    v4 = CFSTR("panic");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v4, v3);
}

- (id)createUUIDString:(unsigned int)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = objc_alloc((Class)NSUUID);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", a3, 16)));
  v7 = objc_msgSend(v5, "initWithUUIDBytes:", objc_msgSend(v6, "bytes"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v12 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to create UUID String", v14, 2u);
      }
    }

  }
  else
  {
    v11 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to create UUID object", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)processExtPaniclogFlags:(unsigned int)a3 data_id:(id)a4 data:(id)a5 additionalBuffers:(id)a6 addToExtPaniclog:(BOOL *)a7
{
  if ((a3 & 1) != 0)
  {
    objc_msgSend(a6, "setObject:forKey:", a5, a4);
    *a7 = 0;
  }
}

- (id)parseExtPaniclog
{
  NSData *extPaniclog;
  id v4;
  unsigned int v5;
  id v6;
  unsigned int v7;
  NSObject *v8;
  const char *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  size_t v16;
  id v17;
  void *v18;
  id v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char v37;
  uint8_t buf[4];
  unsigned int v39;

  v34 = objc_alloc_init((Class)NSMutableDictionary);
  v35 = objc_alloc_init((Class)NSMutableDictionary);
  v36 = objc_alloc_init((Class)NSMutableDictionary);
  extPaniclog = self->_extPaniclog;
  if (!extPaniclog || -[NSData length](extPaniclog, "length") - 32769 < 0xFFFF8000)
    goto LABEL_8;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", 0, 4)));
  v5 = *(_DWORD *)objc_msgSend(v4, "bytes");

  if (v5 != 2)
  {
    v8 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 67109120;
    v39 = v5;
    v9 = "Invalid version. Version in paniclog: %d\n";
    goto LABEL_25;
  }
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", 4, 4)));
  v7 = *(_DWORD *)objc_msgSend(v6, "bytes");

  if (v7 > 0x64)
  {
    v8 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 67109120;
    v39 = v7;
    v9 = "Invalid no_of_logs %d";
LABEL_25:
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, 8u);
    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_41;
  v12 = 8;
  while (1)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[PanicReport createUUIDString:](self, "createUUIDString:", v12));
    if (!v13)
      goto LABEL_41;
    v33 = (void *)v13;
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", (v12 + 16), 4)));
    v15 = *(unsigned int *)objc_msgSend(v14, "bytes");

    v16 = strnlen((const char *)-[NSData bytes](self->_extPaniclog, "bytes") + (v12 + 20), 0x1FuLL);
    v17 = objc_alloc((Class)NSString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", (v12 + 20), v16));
    v19 = objc_msgSend(v17, "initWithData:encoding:", v18, 4);

    if (!v19)
    {
      v28 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Unable to create Data ID String", buf, 2u);
      }
      v19 = 0;
      goto LABEL_34;
    }
    v20 = v12 + v16 + 21;
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", v20, 4)));
    v22 = *(unsigned int *)objc_msgSend(v21, "bytes");

    if (v22 > 0x8000)
    {
      v29 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v39 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Data len is invalid: %d", buf, 8u);
      }
      goto LABEL_34;
    }
    v23 = v20 + 4;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", v20 + 4, v22));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "base64EncodedStringWithOptions:", 0));

    if (!v25)
    {
      v30 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to create Buffer data string", buf, 2u);
      }
LABEL_34:

      goto LABEL_41;
    }
    v37 = 1;
    -[PanicReport processExtPaniclogFlags:data_id:data:additionalBuffers:addToExtPaniclog:](self, "processExtPaniclogFlags:data_id:data:additionalBuffers:addToExtPaniclog:", v15, v19, v25, v36, &v37);
    if (!v37)
      goto LABEL_22;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v19, CFSTR("Data ID"), v25, CFSTR("Data"), 0));
    if (!v26)
      break;
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v33));
    if (!v27)
    {
      v27 = objc_alloc_init((Class)NSMutableArray);
      if (!v27)
      {
        v32 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unable to create array", buf, 2u);
        }

        goto LABEL_40;
      }
      objc_msgSend(v35, "setObject:forKey:", v27, v33);
    }
    objc_msgSend(v27, "addObject:", v26);

LABEL_22:
    v12 = v22 + v23;
    if (!--v7)
      goto LABEL_41;
  }
  v31 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unable to create Data ID and Data dict", buf, 2u);
  }
LABEL_40:

LABEL_41:
  if (objc_msgSend(v35, "count"))
    objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("extPaniclogData"));
  if (objc_msgSend(v36, "count"))
    objc_msgSend(v34, "setObject:forKey:", v36, CFSTR("additionalData"));
  if (objc_msgSend(v34, "count"))
  {
    v10 = v34;
    goto LABEL_9;
  }
LABEL_8:
  v10 = 0;
LABEL_9:

  return v10;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *panicString;
  void *v15;
  NSNumber *v16;
  void *v17;
  void *v18;
  void (**v19)(id, void *);
  void *v20;
  void *v21;
  NSData *panicInitiator;
  void *v23;
  void *v24;
  NSNumber *foregroundAppHash;
  void *v26;
  void *v27;
  NSMutableDictionary *utilizationInfo;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PanicReport *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  uint64_t v45;
  void *v46;
  void *v47;
  NSString *storagePanicData;
  void *v49;
  NSMutableArray *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *j;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned __int8 v63;
  void *v64;
  void *v65;
  id v66;
  PanicReport *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void (**v83)(id, void *);
  void *v84;
  PanicReport *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  const __CFString *v95;
  uint64_t v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  id v100;
  _BYTE v101[128];
  const __CFString *v102;
  NSString *v103;
  uint64_t v104;
  void *v105;
  _BYTE v106[128];
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  NSString *socdNandContainer;
  const __CFString *v111;
  void *v112;
  const __CFString *v113;
  NSMutableDictionary *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  NSString *otherString;
  const __CFString *v119;
  NSData *v120;
  uint64_t v121;
  void *v122;
  _QWORD v123[11];
  _QWORD v124[11];

  v5 = (void (**)(id, void *))a4;
  v123[0] = CFSTR("incident");
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport incidentID](self, "incidentID"));
  v124[0] = v84;
  v123[1] = CFSTR("crashReporterKey");
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "crashReporterKey"));
  v124[1] = v81;
  v123[2] = CFSTR("product");
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "modelCode"));
  v124[2] = v79;
  v123[3] = CFSTR("socId");
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%x"), self->_socId));
  v124[3] = v78;
  v123[4] = CFSTR("socRevision");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%x"), self->_socRev));
  v124[4] = v6;
  v123[5] = CFSTR("build");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport getBuildVersionString](self, "getBuildVersionString"));
  v124[5] = v7;
  v123[6] = CFSTR("kernel");
  v8 = objc_msgSend((id)objc_opt_class(self), "kernelVersionDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v124[6] = v9;
  v123[7] = CFSTR("date");
  v10 = OSADateFormat(1, *(double *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__capture_time]);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)v11;
  if (self->_isBtnReset)
    v13 = CFSTR("string");
  else
    v13 = CFSTR("panicString");
  panicString = (const __CFString *)self->_panicString;
  if (!panicString)
    panicString = CFSTR("<mysterious>");
  v124[7] = v11;
  v124[8] = panicString;
  v123[8] = v13;
  v123[9] = CFSTR("panicFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), self->_panicFlags));
  v124[9] = v15;
  v123[10] = CFSTR("codeSigningMonitor");
  v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(self), "codeSigningMonitor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v124[10] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v124, v123, 11));
  v5[2](v5, v18);

  v19 = v5;
  v121 = kOSALogMetadataBugType;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport problemType](self, "problemType"));
  v122 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1));
  v5[2](v5, v21);

  panicInitiator = self->_panicInitiator;
  if (panicInitiator)
  {
    v119 = CFSTR("panicInitiator");
    v120 = panicInitiator;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
    v5[2](v5, v23);

  }
  if (self->_isInterruptedCoredump)
    v5[2](v5, &off_100037B38);
  if (-[NSString length](self->_otherString, "length"))
  {
    v117 = CFSTR("otherString");
    otherString = self->_otherString;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &otherString, &v117, 1));
    v5[2](v5, v24);

  }
  if (self->_foregroundAppHashSet)
  {
    foregroundAppHash = self->_foregroundAppHash;
    if (foregroundAppHash)
    {
      v115 = CFSTR("foregroundAppHash");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), foregroundAppHash));
      v116 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1));
      v5[2](v5, v27);

    }
  }
  if ((self->_panicFlags & 0x40) != 0)
    objc_msgSend(*(id *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__notes], "addObject:", CFSTR("nested panic occurred"));
  utilizationInfo = self->_utilizationInfo;
  if (utilizationInfo)
  {
    v113 = CFSTR("PanicLogUtilizationMetrics");
    v114 = utilizationInfo;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1));
    v5[2](v5, v29);

  }
  if (objc_opt_class(CRAuthRepairInspector))
  {
    v111 = CFSTR("repairStatus");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), +[CRAuthRepairInspector getStatus](CRAuthRepairInspector, "getStatus")));
    v112 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1));
    v5[2](v5, v31);

  }
  if (-[NSString length](self->_socdNandContainer, "length"))
  {
    v109 = CFSTR("SOCDNandContainer");
    socdNandContainer = self->_socdNandContainer;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &socdNandContainer, &v109, 1));
    v5[2](v5, v32);

  }
  if (os_variant_has_internal_diagnostics("com.apple.dumppanic"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport parseExtPaniclog](self, "parseExtPaniclog"));
    v34 = v33;
    if (v33)
    {
      v35 = self;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("extPaniclogData")));
      if (v36)
      {
        v107 = CFSTR("ExtensiblePaniclog");
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("extPaniclogData")));
        v108 = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1));
        v5[2](v5, v38);

      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("additionalData")));
      v40 = v39;
      if (v39)
      {
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v92;
          do
          {
            for (i = 0; i != v42; i = (char *)i + 1)
            {
              if (*(_QWORD *)v92 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i);
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v45));
              v104 = v45;
              v105 = v46;
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
              v19[2](v19, v47);

            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
          }
          while (v42);
        }
      }

      self = v35;
    }

  }
  if (-[NSString length](self->_storagePanicData, "length"))
  {
    storagePanicData = self->_storagePanicData;
    v102 = CFSTR("storagePanicData");
    v103 = storagePanicData;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
    v19[2](v19, v49);

  }
  v83 = v19;
  v85 = self;
  v86 = objc_alloc_init((Class)NSMutableArray);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v50 = self->_socdContainerArray;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(_QWORD *)v88 != v53)
          objc_enumerationMutation(v50);
        v55 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v55, "count"))
        {
          v56 = objc_alloc_init((Class)NSMutableDictionary);
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndex:", 0));
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v59 = objc_msgSend(v57, "isEqual:", v58);

          if ((v59 & 1) == 0)
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndex:", 0));
            if (objc_msgSend(v60, "length"))
              objc_msgSend(v56, "setObject:forKey:", v60, CFSTR("SOCDContainer"));

          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndex:", 1));
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v63 = objc_msgSend(v61, "isEqual:", v62);

          if ((v63 & 1) == 0)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndex:", 1));
            if (objc_msgSend(v64, "length"))
              objc_msgSend(v56, "setObject:forKey:", v64, CFSTR("SOCDPanicString"));

          }
          if (objc_msgSend(v56, "count"))
            objc_msgSend(v86, "addObject:", v56);

        }
      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    }
    while (v52);
  }

  if (objc_msgSend(v86, "count"))
  {
    v99 = CFSTR("SOCDContainers");
    v100 = v86;
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
    v83[2](v83, v65);

  }
  v66 = objc_alloc_init((Class)OSABinaryImageCatalog);
  v67 = v85;
  -[PanicReport decodeKCDataWithBlock:withTuning:usingCatalog:](v85, "decodeKCDataWithBlock:withTuning:usingCatalog:", v83, &off_100037B60, v66);
  v97 = CFSTR("binaryImages");
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "reportUsedImages"));
  v98 = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1));
  v83[2](v83, v69);

  v70 = OBJC_IVAR___OSAReport__notes;
  objc_msgSend(v66, "appendNotesTo:", *(_QWORD *)&v85->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__notes]);
  if (os_variant_has_internal_diagnostics("com.apple.DumpPanic"))
  {
    v71 = sub_100011BDC();
    v73 = v72;
    if ((v71 & 0x100) != 0)
      objc_msgSend(*(id *)&v85->OSAStackShotReport_opaque[v70], "addObject:", CFSTR("test automation device"));
    if ((v71 & 0x10000) != 0)
      objc_msgSend(*(id *)&v85->OSAStackShotReport_opaque[v70], "addObject:", CFSTR("intentional panic"));
    v67 = v85;
    if (v73)
    {
      v74 = *(void **)&v85->OSAStackShotReport_opaque[v70];
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("test plan id: %llu"), v73));
      objc_msgSend(v74, "addObject:", v75);

    }
  }
  if (objc_msgSend(*(id *)&v67->OSAStackShotReport_opaque[v70], "count"))
  {
    v76 = *(_QWORD *)&v67->OSAStackShotReport_opaque[v70];
    v95 = CFSTR("notes");
    v96 = v76;
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
    v83[2](v83, v77);

  }
}

- (id)panicString
{
  return self->_panicString;
}

- (id)incidentID
{
  void *v2;
  id v4;
  objc_super v5;

  v2 = *(void **)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__incidentID];
  if (v2)
    return v2;
  v5.receiver = self;
  v5.super_class = (Class)PanicReport;
  v4 = -[PanicReport incidentID](&v5, "incidentID");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)logType
{
  return *(id *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__logType];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilizationInfo, 0);
  objc_storeStrong((id *)&self->_foregroundAppHash, 0);
  objc_storeStrong((id *)&self->_panicInitiator, 0);
  objc_storeStrong((id *)&self->_extPaniclog, 0);
  objc_storeStrong((id *)&self->_socdNandContainer, 0);
  objc_storeStrong((id *)&self->_socdContainerArray, 0);
  objc_storeStrong((id *)&self->_storagePanicData, 0);
  objc_storeStrong((id *)&self->_rootsInstalled, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_otherString, 0);
  objc_storeStrong((id *)&self->_panicString, 0);
}

@end
