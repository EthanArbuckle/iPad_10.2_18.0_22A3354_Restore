@implementation PETServiceUploadAssembler

- (PETServiceUploadAssembler)initWithRootDir:(id)a3
{
  id v4;
  PETServiceUploadAssembler *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  _UNKNOWN **v11;
  PETServiceUploadAssembler *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint8_t v18[16];
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PETServiceUploadAssembler;
  v5 = -[PETServiceUploadAssembler init](&v19, "init");
  if (!v5)
    goto LABEL_17;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PETServiceUploadAssembler loadPETConfig](PETServiceUploadAssembler, "loadPETConfig"));
  -[PETServiceUploadAssembler setPetConfig:](v5, "setPetConfig:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](v5, "petConfig"));
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load PET configuration", v18, 2u);
    }
    v11 = &off_10000CE18;
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PETServiceUploadAssembler loadPET1Config](PETServiceUploadAssembler, "loadPET1Config"));
  -[PETServiceUploadAssembler setPet1Config:](v5, "setPet1Config:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler pet1Config](v5, "pet1Config"));
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load PET 1.0 configuration", v18, 2u);
    }
    v11 = &off_10000CE40;
LABEL_12:
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.error_init"), v11);
    goto LABEL_13;
  }
  if (+[_PASDeviceInfo isInternalBuild](_PASDeviceInfo, "isInternalBuild"))
    v10 = arc4random() < 0x28F5C29;
  else
    v10 = 1;
  -[PETServiceUploadAssembler setIsConfigEnabled:](v5, "setIsConfigEnabled:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("device_id")));
  v14 = objc_msgSend(objc_alloc((Class)_PASDeviceIdentifier), "initWithBasePath:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
  -[PETServiceUploadAssembler setDeviceId:](v5, "setDeviceId:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler deviceId](v5, "deviceId"));
  if (v16)
  {

LABEL_17:
    v12 = v5;
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to generate device identifer for sampling", v18, 2u);
  }
  AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.error_init"), &off_10000CE68);

LABEL_13:
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)assembleAggregatedUploadWithTracker:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  PETMetadata *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  PETServiceMessageCompressor *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  PETServiceMessageCompressor *v33;
  PETServiceUploadAssembler *v34;
  uint8_t *v35;
  unsigned __int8 v36;
  uint8_t v37[8];
  uint8_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  uint64_t v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregateState"));
  v6 = objc_msgSend(v5, "checkIntegrity");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_opt_new(PETUpload);
    v8 = objc_opt_new(PETMetadata);
    objc_msgSend(v7, "setMetadata:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
    objc_msgSend(v9, "setMetadataWithConfigVersion:", objc_msgSend(v10, "version"));

    v11 = -[PETServiceUploadAssembler isConfigEnabled](self, "isConfigEnabled");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    objc_msgSend(v12, "setIsConfigEnabled:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    objc_msgSend(v13, "setMessageGroup:", CFSTR("_aggregated"));

    objc_msgSend(v7, "setIsCompressed:", 1);
    if ((objc_msgSend(v4, "isTesting") & 1) != 0)
      v14 = 0;
    else
      v14 = +[_PASDeviceInfo isInternalBuild](_PASDeviceInfo, "isInternalBuild");
    *(_QWORD *)v37 = 0;
    v38 = v37;
    v39 = 0x2020000000;
    v40 = 0;
    v29 = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_100007A88;
    v32 = &unk_10000C548;
    v16 = objc_opt_new(PETServiceMessageCompressor);
    v33 = v16;
    v34 = self;
    v36 = v14;
    v35 = v37;
    objc_msgSend(v4, "enumerateAggregatedMessagesWithBlock:clearStore:", &v29, 1);
    -[PETServiceMessageCompressor close](v16, "close", v29, v30, v31, v32);
    if (v38[24])
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
      v18 = v17 == 0;

      if (v18)
      {
        AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.compression_error"), &off_10000CEE0);
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        v20 = (unint64_t)objc_msgSend(v19, "length") > 0x1F8000;

        if (!v20)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
          objc_msgSend(v7, "setCompressedMessages:", v28);

          v15 = v7;
          goto LABEL_16;
        }
        v21 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
          v23 = objc_msgSend(v22, "length");
          *(_DWORD *)buf = 134218240;
          v44 = v23;
          v45 = 2048;
          v46 = 2064384;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dropping aggregated messages (size %lu) due to exceeding MAX_UPLOAD_BYTES (%lu)", buf, 0x16u);

        }
        v41[0] = CFSTR("size");
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "length")));
        v41[1] = CFSTR("group");
        v42[0] = v25;
        v42[1] = CFSTR("_aggregated");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
        AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.upload_dropped"), v26);

      }
    }
    v15 = 0;
LABEL_16:

    _Block_object_dispose(v37, 8);
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v37 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "The aggregate state is corrupt. Resetting the state store", v37, 2u);
  }
  AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.upload_dropped"), &off_10000CE90);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregateState"));
  objc_msgSend(v7, "reset");
  v15 = 0;
LABEL_17:

  return v15;
}

- (id)assembleUnaggregatedUploadWithTracker:(id)a3 messageGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PETMetadata *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  PETServiceMessageCompressor *v16;
  id v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void **v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  PETServiceMessageCompressor *v37;
  PETServiceUploadAssembler *v38;
  id v39;
  id v40;
  uint64_t *v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  uint64_t v52;
  const __CFString *v53;
  id v54;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new(PETUpload);
  v9 = objc_opt_new(PETMetadata);
  objc_msgSend(v8, "setMetadata:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  objc_msgSend(v10, "setMetadataWithConfigVersion:", objc_msgSend(v11, "version"));

  v12 = -[PETServiceUploadAssembler isConfigEnabled](self, "isConfigEnabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
  objc_msgSend(v13, "setIsConfigEnabled:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
  objc_msgSend(v14, "setMessageGroup:", v7);

  objc_msgSend(v8, "setIsCompressed:", 1);
  if ((objc_msgSend(v6, "isTesting") & 1) != 0)
    v15 = 0;
  else
    v15 = +[_PASDeviceInfo isInternalBuild](_PASDeviceInfo, "isInternalBuild");
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v33 = _NSConcreteStackBlock;
  v34 = 3221225472;
  v35 = sub_10000780C;
  v36 = &unk_10000C570;
  v16 = objc_opt_new(PETServiceMessageCompressor);
  v37 = v16;
  v38 = self;
  v17 = v7;
  v39 = v17;
  v42 = v15;
  v18 = v8;
  v40 = v18;
  v41 = &v43;
  objc_msgSend(v6, "enumerateMessagesWithBlock:messageGroup:clearStore:", &v33, v17, 1);
  -[PETServiceMessageCompressor close](v16, "close", v33, v34, v35, v36);
  if (*((_BYTE *)v44 + 24))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
    v20 = v19 == 0;

    if (v20)
    {
      v53 = CFSTR("group");
      v54 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
      AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.compression_error"), v29);

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
      v22 = (unint64_t)objc_msgSend(v21, "length") > 0x1F8000;

      if (!v22)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        objc_msgSend(v18, "setCompressedMessages:", v32);

        v30 = v18;
        goto LABEL_12;
      }
      v23 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        v25 = objc_msgSend(v24, "length");
        *(_DWORD *)buf = 134218240;
        v50 = v25;
        v51 = 2048;
        v52 = 2064384;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dropping aggregated messages (size %lu) due to exceeding MAX_UPLOAD_BYTES (%lu)", buf, 0x16u);

      }
      v47[0] = CFSTR("size");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "length")));
      v47[1] = CFSTR("group");
      v48[0] = v27;
      v48[1] = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
      AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.upload_dropped"), v28);

    }
  }
  v30 = 0;
LABEL_12:

  _Block_object_dispose(&v43, 8);
  return v30;
}

- (BOOL)_canLogPET1Key:(id)a3
{
  return 0;
}

- (BOOL)_canLog:(id)a3 messageGroup:(id)a4 isInternal:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "whitelistForMessageName:", v9));

  if (v11 && (a5 || -[PETServiceUploadAssembler _checkSampling:](self, "_checkSampling:", v9)))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PETMetadata getCountryCode](PETMetadata, "getCountryCode"));
    v15 = 1;
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("CN")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
      v14 = objc_msgSend(v13, "isChinaEnabledForMessageName:messageGroup:", v9, v8);

      if (!v14)
        v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_checkSampling:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  CC_LONG v16;
  unint64_t v17;
  unsigned __int8 md[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  objc_msgSend(v5, "deviceSamplingForMessageName:isSeed:", v4, 0);
  v7 = v6;

  v8 = 0;
  if (v7 > 0.0)
  {
    if (v7 >= 1.0)
    {
      v8 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupForMessageName:", v4));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler deviceId](self, "deviceId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%lu"), v11, v10, objc_msgSend(v12, "version")));

      v14 = objc_retainAutorelease(v13);
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      v16 = strlen(v15);
      CC_MD5(v15, v16, md);
      LODWORD(v17) = *(_DWORD *)md;
      v8 = v7 * 4294967300.0 > (double)v17;

    }
  }

  return v8;
}

- (BOOL)_checkMessageSampling:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  objc_msgSend(v5, "messageSamplingForMessageName:isSeed:", v4, 0);
  v7 = v6;

  result = 0;
  if (v7 > 0.0)
    return v7 >= 1.0 || v7 * 4294967300.0 > (double)arc4random();
  return result;
}

- (PETConfig)petConfig
{
  return (PETConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPetConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)pet1Config
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPet1Config:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isConfigEnabled
{
  return self->_isConfigEnabled;
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  self->_isConfigEnabled = a3;
}

- (NSUUID)deviceId
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_pet1Config, 0);
  objc_storeStrong((id *)&self->_petConfig, 0);
}

+ (id)loadPETConfig
{
  NSBundle *v2;
  void *v3;
  void *v4;
  id v5;
  dispatch_queue_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint8_t v14[16];

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(PETEventTracker2, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("pet_config"), CFSTR("plist")));

  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)PETConfig), "initWithFile:", v4);
    v6 = dispatch_queue_create("PETAsset-notifications", 0);
    v7 = objc_msgSend(objc_alloc((Class)_PASAsset2), "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:", CFSTR("/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist"), 0, 0, v6, &_os_log_default);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filesystemPathForAssetDataRelativePath:", CFSTR("pet_config.plist")));
    if (v8)
    {
      v9 = objc_msgSend(objc_alloc((Class)PETConfig), "initWithFile:", v8);
      v10 = objc_msgSend(v5, "version");
      if (v10 <= objc_msgSend(v9, "version"))
        v11 = v9;
      else
        v11 = v5;
      v12 = v11;

    }
    else
    {
      v12 = v5;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to load PET config from the bundle", v14, 2u);
    }
    v12 = 0;
  }

  return v12;
}

+ (id)loadPET1Config
{
  dispatch_queue_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  v2 = dispatch_queue_create("PETAsset-notifications", 0);
  v3 = objc_msgSend(objc_alloc((Class)_PASAsset2), "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:", CFSTR("/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist"), 0, 0, v2, &_os_log_default);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("pet1_config.plist")));
  if (v5
    || (v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(PETEventTracker2, v4)), v7 = (void *)objc_claimAutoreleasedReturnValue(v6), v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathForResource:ofType:", CFSTR("pet1_config"), CFSTR("plist"))), v7, v5))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v5));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to load PET1 config from the bundle", v10, 2u);
    }
    v8 = 0;
  }

  return v8;
}

@end
