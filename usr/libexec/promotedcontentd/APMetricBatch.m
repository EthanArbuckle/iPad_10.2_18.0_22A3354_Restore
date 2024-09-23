@implementation APMetricBatch

- (void)receivedMetric:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a3;
  v5 = APLogForCategory(29);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
    v13 = 138543362;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "received metric on batch %{public}@", (uint8_t *)&v13, 0xCu);

  }
  if (-[APMetricBatch writable](self, "writable"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch storage](self, "storage"));
    objc_msgSend(v8, "addObject:", v4);
    v9 = objc_autoreleasePoolPush();
    -[APMetricBatch _appendMetricToFile:](self, "_appendMetricToFile:", v4);
    objc_autoreleasePoolPop(v9);

  }
  else
  {
    v10 = APLogForCategory(29);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
      v13 = 138543362;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Attempt to write to a closed batch for %{public}@", (uint8_t *)&v13, 0xCu);

    }
    APSimulateCrash(5, CFSTR("Attempt to write to a closed batch!"), 0);
  }

}

- (BOOL)writable
{
  return self->_writable;
}

- (id)_openFilePath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _openFileDirectory](self, "_openFileDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v4));

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_openFileDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class openStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "openStoragePathPrefix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch destinationHash](self, "destinationHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APMetricBatch purpose](self, "purpose")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));

  return v8;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (NSString)destinationHash
{
  return self->_destinationHash;
}

- (void)_appendMetricToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch storage](self, "storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _openFilePath](self, "_openFilePath"));
  v29 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v29));
  v8 = v29;
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v12 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
    if ((-[NSObject fileExistsAtPath:error:](v12, "fileExistsAtPath:error:", v6, 0) & 1) == 0)
    {
      v14 = APLogForCategory(29);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
        *(_DWORD *)buf = 138543362;
        v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Trying to append metric to nonexistent file %{public}@", buf, 0xCu);

      }
    }
    v28 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fileForAppendingAtKeyPath:error:](v12, "fileForAppendingAtKeyPath:error:", v6, &v28));
    v18 = v28;
    if (v18)
    {
      v10 = v18;
      v19 = APLogForCategory(29);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138739971;
        v31 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Could not open file (%{sensitive}@)!", buf, 0xCu);
      }
    }
    else
    {
      v27 = 0;
      objc_msgSend(v17, "addObject:error:", v4, &v27);
      v10 = v27;
      v20 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      if (v10)
      {
        v21 = APLogForCategory(29);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          v31 = v4;
          v32 = 2117;
          v33 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not add metric (%{public}@) to file (%{sensitive}@)!", buf, 0x16u);
        }
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
        -[NSObject timeIntervalSinceDate:](v20, "timeIntervalSinceDate:", v23);
        v25 = v24;

        v26 = sub_100021B00();
        v22 = objc_claimAutoreleasedReturnValue(v26);
        sub_100021994(v22, (uint64_t)objc_msgSend(v4, "purpose"), v25);
      }

    }
  }
  else
  {
    v10 = v8;
    v11 = APLogForCategory(29);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218243;
      v31 = v13;
      v32 = 2117;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not archive metrics (%lu) to path (%{sensitive}@)!", buf, 0x16u);
    }
  }

}

- (NSMutableArray)storage
{
  return self->_storage;
}

- (BOOL)shouldRotate
{
  void *v3;
  char *v4;
  char *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch journeyBatchSettings](self, "journeyBatchSettings"));
  v4 = (char *)objc_msgSend(v3, "batchSizeUInteger");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch storage](self, "storage"));
    v7 = objc_msgSend(v6, "count") >= v5 + 2;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (APJourneyBatchSettings)journeyBatchSettings
{
  return self->_journeyBatchSettings;
}

- (id)serverDictionaryRepresentationWithBlock:(id)a3
{
  return -[APMetricBatch eCServerDictionaryRepresentationWithBlock:](self, "eCServerDictionaryRepresentationWithBlock:", a3);
}

- (APStorageFile)secureFile
{
  return self->_secureFile;
}

- (NSString)path
{
  return self->_path;
}

- (id)nextMetric
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch secureFile](self, "secureFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nextObject"));

  return v3;
}

- (APMetricBatch)initWithPath:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  APMetricBatch *v15;
  void *v16;
  APMetricBatch *v17;
  NSString *v18;
  NSString *destinationHash;
  void *v20;
  APJourneyBatchSettings *v21;
  APJourneyBatchSettings *journeyBatchSettings;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  char isKindOfClass;
  void *v29;
  NSString *v30;
  NSString *identifier;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v40;
  objc_super v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;

  v5 = a3;
  if (v5)
  {
    if (qword_100269A50 != -1)
      dispatch_once(&qword_100269A50, &stru_1002159C8);
    v6 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
    v42 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileForReadingAtKeyPath:error:", v5, &v42));
    v8 = v42;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error unarchiving the contents of the file (%@)! %@"), v5, v8));
      v10 = APLogForCategory(29);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        APSimulateCrash(5, v9, 0);
        v15 = 0;
LABEL_34:

        goto LABEL_35;
      }
      *(_DWORD *)buf = 138740227;
      v44 = v5;
      v45 = 2114;
      v46 = v8;
      v12 = "Error unarchiving the contents of the file (%{sensitive}@)! %{public}@";
      v13 = v11;
      v14 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_8;
    }
    if (!v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("We didn't get a file (%@) back from the secure file manager!"), v5));
      v26 = APLogForCategory(29);
      v11 = objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138739971;
      v44 = v5;
      v12 = "We didn't get a file (%{sensitive}@) back from the secure file manager!";
      v13 = v11;
      v14 = 12;
      goto LABEL_7;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
    v41.receiver = self;
    v41.super_class = (Class)APMetricBatch;
    v17 = -[APMetricBatch init](&v41, "init");
    self = v17;
    if (v17)
    {
      v18 = (NSString *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _destinationHashFromPath:](v17, "_destinationHashFromPath:", v5));
      destinationHash = self->_destinationHash;
      self->_destinationHash = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _purposeFromPath:](self, "_purposeFromPath:", v5));
      self->_purpose = (int)objc_msgSend(v20, "intValue");

      self->_writable = 0;
      v21 = objc_alloc_init(APJourneyBatchSettings);
      journeyBatchSettings = self->_journeyBatchSettings;
      self->_journeyBatchSettings = v21;

      objc_storeStrong((id *)&self->_secureFile, v7);
      objc_storeStrong((id *)&self->_path, a3);
    }
    if (v9)
      v23 = v16 == 0;
    else
      v23 = 1;
    if (v23)
    {
      v24 = APLogForCategory(29);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138739971;
        v44 = v5;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "File did not contain at least 2 elements! %{sensitive}@", buf, 0xCu);
      }

      -[APMetricBatch _deleteByFilePath:](self, "_deleteByFilePath:", v5);
    }
    else
    {
      v27 = objc_opt_class(NSUUID);
      isKindOfClass = objc_opt_isKindOfClass(v16, v27);
      if ((isKindOfClass & 1) != 0)
      {
        if (self)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
          v30 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v9, v29));
          identifier = self->_identifier;
          self->_identifier = v30;

        }
        v32 = APLogForCategory(29);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
          *(_DWORD *)buf = 138543362;
          v44 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "created closed batch %{public}@", buf, 0xCu);

        }
        v15 = self;
        goto LABEL_33;
      }
      v35 = APLogForCategory(29);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_opt_class(v16);
        v40 = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
        *(_DWORD *)buf = 138478083;
        v44 = v37;
        v45 = 2114;
        v46 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Expected UUID class type but decrypted type %{private}@ in batch %{public}@, please file a radar", buf, 0x16u);

      }
    }
    v15 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v15 = 0;
LABEL_35:

  return v15;
}

- (APMetricBatch)initWithDestination:(id)a3 purpose:(int64_t)a4
{
  id v6;
  APMetricBatch *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSMutableArray *storage;
  APJourneyBatchSettings *v17;
  APJourneyBatchSettings *journeyBatchSettings;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  APMetricBatch *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)APMetricBatch;
  v7 = -[APMetricBatch init](&v39, "init");
  if (!v7)
    goto LABEL_13;
  v35 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "yearDayOfYearHourMinute"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v34 = v8;
  objc_storeStrong((id *)&v7->_destinationHash, v8);
  v7->_purpose = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v10, v12));
  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v13;

  v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v10, v11, 0));
  storage = v7->_storage;
  v7->_storage = (NSMutableArray *)v15;

  v7->_writable = 1;
  v17 = objc_alloc_init(APJourneyBatchSettings);
  journeyBatchSettings = v7->_journeyBatchSettings;
  v7->_journeyBatchSettings = v17;

  v19 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _openFilePath](v7, "_openFilePath"));
  v38 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fileForWritingAtKeyPath:error:", v20, &v38));
  v22 = v38;
  v23 = sub_100021B00();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
  sub_1000039B8((uint64_t)v24, v25, a4);

  if (!v22)
  {
    v37 = 0;
    objc_msgSend(v21, "addObject:error:", v10, &v37);
    v29 = v37;
    v36 = v29;
    objc_msgSend(v21, "addObject:error:", v11, &v36);
    v22 = v36;

    v30 = APLogForCategory(29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v27 = v31;
    if (v22)
    {
      v6 = v35;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740227;
        v41 = v20;
        v42 = 2114;
        v43 = v22;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not write to file (%{sensitive}@)! Error: %{public}@", buf, 0x16u);
      }
      goto LABEL_6;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](v7, "identifier"));
      *(_DWORD *)buf = 138543362;
      v41 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "created open batch %{public}@", buf, 0xCu);

    }
    v6 = v35;
LABEL_13:
    v28 = v7;
    goto LABEL_14;
  }
  v26 = APLogForCategory(29);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138740227;
    v41 = v20;
    v42 = 2114;
    v43 = v22;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not open file (%{sensitive}@)! Error: %{public}@", buf, 0x16u);
  }
  v6 = v35;
LABEL_6:

  v28 = 0;
LABEL_14:

  return v28;
}

- (id)fileSystemToken
{
  uint64_t v3;
  NSObject *v4;
  void *v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  if (-[APMetricBatch writable](self, "writable"))
  {
    v3 = APLogForCategory(29);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "fileSystemToken is available for closed batches only!", v9, 2u);
    }

    APSimulateCrash(5, CFSTR("fileSystemToken is available for closed batches only!"), 0);
    return &stru_100219118;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch path](self, "path"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch path](self, "path"));
    else
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _closedFilePath](self, "_closedFilePath"));
    return v8;
  }
}

- (id)eCServerDictionaryRepresentationWithBlock:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  void (**v38)(id, void *);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  _QWORD v44[3];
  _QWORD v45[3];
  _BYTE v46[128];

  v4 = (void (**)(id, void *))a3;
  if (-[APMetricBatch writable](self, "writable"))
  {
    v5 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Attempt to get a dictionary representation for an open batch!", buf, 2u);
    }

    APSimulateCrash(5, CFSTR("Attempt to get a dictionary representation for an open batch!"), 0);
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 4);
    v9 = objc_autoreleasePoolPush();
    v10 = objc_claimAutoreleasedReturnValue(-[APMetricBatch nextMetric](self, "nextMetric"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -9999;
      while (1)
      {
        if (v4)
          v4[2](v4, v11);
        v13 = objc_msgSend(v11, "purpose");
        v14 = (uint64_t)v13;
        if (v12 != -9999)
        {
          v14 = v12;
          if ((id)v12 != v13)
            break;
        }
        v12 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v13));
        v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v15));
        if (!v16)
        {
          v16 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v8, "setObject:forKey:", v16, v15);
        }
        if ((objc_opt_respondsToSelector(v11, "ecServerDictionaryRepresentation") & 1) != 0)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ecServerDictionaryRepresentation"));
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(v16, "addObject:", v17);

          }
        }

        objc_autoreleasePoolPop(v9);
        v9 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch nextMetric](self, "nextMetric"));
        if (!v11)
        {
          v38 = v4;
          objc_autoreleasePoolPop(v9);
          v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v25));
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v26));
                objc_msgSend(v19, "setObject:forKey:", v27, v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
            }
            while (v22);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v19));
          v44[0] = CFSTR("batch");
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
          v45[0] = v29;
          v44[1] = CFSTR("events");
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), -[APMetricBatch purpose](self, "purpose")));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v30));
          v45[1] = v31;
          v44[2] = CFSTR("purpose");
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APMetricBatch purpose](self, "purpose")));
          v45[2] = v32;
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 3));

          v4 = v38;
          goto LABEL_32;
        }
      }
      v35 = APLogForCategory(29);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Purposes don't match", buf, 2u);
      }

      objc_autoreleasePoolPop(v9);
    }
    else
    {
      objc_autoreleasePoolPop(v9);
      v33 = APLogForCategory(29);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Found an empty closed metric batch file!", buf, 2u);
      }

    }
    v7 = 0;
LABEL_32:

  }
  return v7;
}

- (id)_purposeFromPath:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[objc_class closedStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "closedStoragePathPrefix"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[objc_class openStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "openStoragePathPrefix"));
  v6 = v4;
  if ((objc_msgSend(v3, "hasPrefix:", v4) & 1) != 0
    || (v6 = v5, (objc_msgSend(v3, "hasPrefix:", v5) & 1) != 0)
    || (v6 = CFSTR("s"), objc_msgSend(v3, "hasPrefix:", CFSTR("s"))))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", (char *)-[__CFString length](v6, "length") + 1));
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathComponents"));
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The path (%@) resulted in zero path components somehow!"), v3));
    v11 = APLogForCategory(29);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138739971;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "The path (%{sensitive}@) resulted in zero path components somehow!", buf, 0xCu);
    }

    APSimulateCrash(5, v10, 0);
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
  }

  return v9;
}

- (id)_destinationHashFromPath:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[objc_class closedStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "closedStoragePathPrefix"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[objc_class openStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "openStoragePathPrefix"));
  v6 = v4;
  if ((objc_msgSend(v3, "hasPrefix:", v4) & 1) != 0
    || (v6 = v5, (objc_msgSend(v3, "hasPrefix:", v5) & 1) != 0)
    || (v6 = CFSTR("s"), objc_msgSend(v3, "hasPrefix:", CFSTR("s"))))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", (char *)-[__CFString length](v6, "length") + 1));
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathComponents"));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The path (%@) resulted in zero path components somehow!"), v3));
    v11 = APLogForCategory(29);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138739971;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "The path (%{sensitive}@) resulted in zero path components somehow!", buf, 0xCu);
    }

    APSimulateCrash(5, v10, 0);
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_secureFile, 0);
  objc_storeStrong((id *)&self->_journeyBatchSettings, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destinationHash, 0);
}

+ (BOOL)removeBatchByFileSystemToken:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
    v5 = sub_100038BE0((uint64_t)APMetricsObservability, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v16 = 0;
    v7 = objc_msgSend(v4, "removeObjectAtPath:error:", v3, &v16);
    v8 = v16;
    if (v8)
      v7 = 0;
    if ((v7 & 1) != 0)
    {
      v9 = sub_100021B00();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
      v12 = +[APMetricStorage_private batchPathToPurpose:](APMetricStorage_private, "batchPathToPurpose:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class closedStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "closedStoragePathPrefix"));
      sub_1000311CC(v10, v6, v11, v12, v4, v13);

    }
    else
    {
      v14 = APLogForCategory(29);
      v10 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error removing file at path! %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)metrics
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch storage](self, "storage"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subarrayWithRange:", 2, (char *)objc_msgSend(v2, "count") - 2));
  }
  else
  {
    v5 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Accessing 'metrics' property for read only batch is not supported. Please file a radar against Promoted Content | (New Bugs)", v8, 2u);
    }

    v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (id)_closedFileDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class closedStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "closedStoragePathPrefix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch destinationHash](self, "destinationHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APMetricBatch purpose](self, "purpose")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));

  return v8;
}

- (id)_closedFilePath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _closedFileDirectory](self, "_closedFileDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v4));

  return v5;
}

- (void)close
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  self->_writable = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch storage](self, "storage"));
  v4 = objc_msgSend(v3, "count");

  v5 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("m"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _openFilePath](self, "_openFilePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch _closedFilePath](self, "_closedFilePath"));
  v8 = sub_100126C58((uint64_t)APMetricsObservability, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = APLogForCategory(29);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch identifier](self, "identifier"));
    *(_DWORD *)buf = 138543362;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "close batch %{public}@", buf, 0xCu);

  }
  v25 = 0;
  v13 = objc_msgSend(v5, "moveItemAtPath:toPath:error:", v6, v7, &v25);
  v14 = v25;
  v15 = v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 0;
  if (v16)
  {
    v20 = (uint64_t)v4 - 2;
    v21 = sub_100021B00();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v23 = -[APMetricBatch purpose](self, "purpose");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class closedStoragePathPrefix](+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"), "closedStoragePathPrefix"));
    sub_100126A4C(v17, v9, v22, v23, v20, v5, v24);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error closing batch! Could not move file from (%@) to (%@)! %@"), v6, v7, v14));
    v18 = APLogForCategory(29);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      v27 = v6;
      v28 = 2117;
      v29 = v7;
      v30 = 2114;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error closing batch! Could not move file from (%{sensitive}@) to (%{sensitive}@)! %{public}@", buf, 0x20u);
    }

    APSimulateCrash(5, v17, 0);
  }

}

- (void)_deleteByFilePath:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[APMetricBatch writable](self, "writable"))
  {
    v5 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Attempt to delete an open batch!", v7, 2u);
    }

    APSimulateCrash(5, CFSTR("Attempt to delete an open batch!"), 0);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(self), "removeBatchByFileSystemToken:", v4);
  }

}

- (void)delete
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricBatch secureFile](self, "secureFile"));
  objc_msgSend(v3, "close");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APMetricBatch _closedFilePath](self, "_closedFilePath"));
  -[APMetricBatch _deleteByFilePath:](self, "_deleteByFilePath:", v4);

}

- (void)setSecureFile:(id)a3
{
  objc_storeStrong((id *)&self->_secureFile, a3);
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

@end
