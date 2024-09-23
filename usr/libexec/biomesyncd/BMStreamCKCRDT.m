@implementation BMStreamCKCRDT

- (BMStreamCKCRDT)initWithStreamConfiguration:(id)a3 locationAssignerPolicy:(id)a4 localSiteIdentifier:(id)a5 database:(id)a6 changeReporter:(id)a7 account:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMStreamCKCRDT *v20;
  BMStreamCKCRDT *v21;
  uint64_t v22;
  NSString *syncIdentifier;
  uint64_t v24;
  NSString *streamIdentifier;
  NSString *v26;
  NSString *localSiteIdentifier;
  BMStreamCRDTLocationBuilder *v28;
  BMStreamCRDTLocationBuilder *locationBuilder;
  NSCache *v30;
  NSCache *locationRowCache;
  void *v33;
  void *v34;
  id v36;
  objc_super v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v36 = a7;
  v19 = a8;
  if (v15)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStreamCKCRDT.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("streamConfiguration"));

    if (v18)
      goto LABEL_3;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStreamCKCRDT.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

LABEL_3:
  v37.receiver = self;
  v37.super_class = (Class)BMStreamCKCRDT;
  v20 = -[BMStreamCKCRDT init](&v37, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_streamConfiguration, a3);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "syncIdentifier"));
    syncIdentifier = v21->_syncIdentifier;
    v21->_syncIdentifier = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "streamIdentifier"));
    streamIdentifier = v21->_streamIdentifier;
    v21->_streamIdentifier = (NSString *)v24;

    v26 = (NSString *)objc_msgSend(v17, "copy");
    localSiteIdentifier = v21->_localSiteIdentifier;
    v21->_localSiteIdentifier = v26;

    objc_storeStrong((id *)&v21->_db, a6);
    v28 = -[BMStreamCRDTLocationBuilder initWithAssignerPolicy:]([BMStreamCRDTLocationBuilder alloc], "initWithAssignerPolicy:", v16);
    locationBuilder = v21->_locationBuilder;
    v21->_locationBuilder = v28;

    v30 = objc_opt_new(NSCache);
    locationRowCache = v21->_locationRowCache;
    v21->_locationRowCache = v30;

    objc_storeStrong((id *)&v21->_changeReporter, a7);
    objc_storeStrong((id *)&v21->_account, a8);
  }

  return v21;
}

- (id)bookmarkForAtomRow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSString *streamIdentifier;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "segmentName"));

  if (v5)
  {
    v6 = objc_alloc((Class)BMStoreBookmark);
    streamIdentifier = self->_streamIdentifier;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "segmentName"));
    v9 = objc_msgSend(v6, "initWithStream:segment:iterationStartTime:offset:", streamIdentifier, v8, objc_msgSend(v4, "segmentOffset"), 1.79769313e308);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)newEnumeratorStartingAfterBookmark:(id)a3 reader:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v18 = 0;
    v8 = objc_msgSend(v6, "newEnumeratorFromBookmark:options:error:", v5, 7, &v18);
    v9 = v18;
    v10 = v9;
    if (v8)
    {
      v11 = objc_msgSend(v8, "nextEvent");
    }
    else if (BMStorageErrorGetErrno(v9) == 2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "segmentName"));
      objc_msgSend(v7, "timestampFromSegmentName:", v12);
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v8 = objc_msgSend(v7, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:", -1, -1, 7, v14, v16);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = objc_msgSend(v6, "newEnumeratorFromStartTime:options:", 7, 0.0);
  }

  return v8;
}

- (id)ckAtomTableRecordForEvent:(id)a3 ofType:(unint64_t)a4 atBookmark:(id)a5 previousTableRecord:(id)a6 siteIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  BMStreamCRDTLocationBuilder *locationBuilder;
  NSString *syncIdentifier;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  BMSyncCKAtomRow *v36;
  BMSyncCKAtomRow *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  BMSyncCKAtomRow *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  BMSyncDatabase *db;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v69;
  uint64_t v70;
  char v71;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self->_localSiteIdentifier, "dataUsingEncoding:", 4));
  v17 = objc_msgSend(objc_alloc((Class)CKDistributedSiteIdentifier), "initWithIdentifier:", v16);
  v18 = (id)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase latestDistributedTimestampForSiteIdentifier:inStream:](self->_db, "latestDistributedTimestampForSiteIdentifier:inStream:", self->_localSiteIdentifier, self->_syncIdentifier));
  if (!v18)
    v18 = objc_msgSend(objc_alloc((Class)CKDistributedTimestamp), "initWithSiteIdentifierObject:clockValue:", v17, 0);
  v66 = v17;
  v19 = objc_alloc((Class)CKDistributedTimestamp);
  v20 = (char *)objc_msgSend(v18, "clockValue") + 1;
  v21 = v19;
  v22 = v66;
  v23 = objc_msgSend(v21, "initWithSiteIdentifierObject:clockValue:", v66, v20);
  if (a4 == 2)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:](self->_db, "ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:", v13, 2, self->_localSiteIdentifier, self->_syncIdentifier));
    if (!v35)
    {
      v65 = v23;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:](self->_db, "ckAtomRowForAtomWithBookmark:type:forSiteIdentifier:inStream:", v13, 0, v15, self->_syncIdentifier));
      if (v41)
      {
        v42 = v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "location"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "location"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "ckMergeableValueIDWithFormatVersion:", 0));

        v45 = objc_alloc((Class)CKAtomReference);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "timestamp"));
        v57 = objc_msgSend(v45, "initWithMergeableValueID:timestamp:type:", v59, v46, 0);

        v47 = [BMSyncCKAtomRow alloc];
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "location"));
        v63 = v12;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "location"));
        v61 = v16;
        v50 = v14;
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "segmentName"));
        v23 = v65;
        v36 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v47, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v48, v65, v49, v57, 2, v51, objc_msgSend(v13, "offset"));

        v14 = v50;
        v16 = v61;

        v12 = v63;
        v22 = v66;

        goto LABEL_15;
      }
      db = self->_db;
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "segmentName"));
      LODWORD(db) = -[BMSyncDatabase containsCKAtomRowWithSegment:inStream:](db, "containsCKAtomRowWithSegment:inStream:", v53, self->_syncIdentifier);

      if (!(_DWORD)db)
      {
        v36 = 0;
        v23 = v65;
        goto LABEL_15;
      }
      v54 = __biome_log_for_category(11);
      v55 = objc_claimAutoreleasedReturnValue(v54);
      *(_QWORD *)buf = 0;
      v69 = buf;
      v70 = 0x2020000000;
      v71 = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000144CC;
      block[3] = &unk_100068AA0;
      block[4] = buf;
      v23 = v65;
      if (qword_10007BE08 != -1)
        dispatch_once(&qword_10007BE08, block);
      v56 = v69[24];
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v55, v56))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "delete must reference a corresponding append", buf, 2u);
      }

      v36 = 0;
      goto LABEL_14;
    }

  }
  else if (!a4)
  {
    v60 = v16;
    locationBuilder = self->_locationBuilder;
    syncIdentifier = self->_syncIdentifier;
    objc_msgSend(v12, "timestamp");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocationBuilder locationWithStreamName:siteIdentifier:timestamp:](locationBuilder, "locationWithStreamName:siteIdentifier:timestamp:", syncIdentifier, v15));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_locationRowCache, "objectForKey:", v26));
    if (!v27)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase insertLocationIfNotExists:withState:](self->_db, "insertLocationIfNotExists:withState:", v26, 2));
      -[NSCache setObject:forKey:](self->_locationRowCache, "setObject:forKey:", v27, v26);
    }
    v58 = v15;
    v62 = v12;
    v64 = v23;
    if (v14)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "location"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "location"));
      v30 = v14;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ckMergeableValueIDWithFormatVersion:", 0));

      v32 = objc_alloc((Class)CKAtomReference);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "timestamp"));
      v34 = objc_msgSend(v32, "initWithMergeableValueID:timestamp:type:", v31, v33, 0);

    }
    else
    {
      v34 = 0;
      v30 = 0;
    }
    v37 = [BMSyncCKAtomRow alloc];
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "location"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "segmentName"));
    v36 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v37, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v27, v64, v38, v34, 0, v39, objc_msgSend(v13, "offset"));

    v23 = v64;
    v16 = v60;
    v12 = v62;
    v14 = v30;
    v15 = v58;
LABEL_14:
    v22 = v66;
    goto LABEL_15;
  }
  v36 = 0;
LABEL_15:

  return v36;
}

- (id)atomValueFromEvent:(id)a3 ofType:(unint64_t)a4 version:(int64_t)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  BMStoreEventAtomValue *v13;
  void *v14;
  id v15;
  BMStoreEventAtomValue *v16;
  BMSyncAtomValue *v17;
  void *v19;
  uint64_t v20;
  os_log_type_t v21;
  void *v22;
  unsigned int v23;
  __CFString *v24;
  void **block;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v31;
  char v32;

  v7 = a3;
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frame"));
  if (-[NSObject state](v9, "state") != 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "frame"));
    v11 = objc_msgSend(v10, "state");

    if (v11 == 2)
      goto LABEL_5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "frame"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "data"));

    if (v12)
      goto LABEL_6;
    v20 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v20);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x2020000000;
    v32 = 16;
    block = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_10001477C;
    v28 = &unk_100068AA0;
    p_buf = &buf;
    if (qword_10007BE10 != -1)
      dispatch_once(&qword_10007BE10, &block);
    v21 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v9, v21))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "frame"));
      v23 = objc_msgSend(v22, "state");
      if (v23 >= 6)
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BMFrameStateUnknown(%lu)"), v23, block, v26, v27, v28, p_buf, (_QWORD)buf));
      else
        v24 = off_100069118[v23];
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_log_impl((void *)&_mh_execute_header, v9, v21, "Expected no-data frame to be delete or pre-delete, but frame was %{public}@", (uint8_t *)&buf, 0xCu);

    }
  }

LABEL_5:
  v12 = 0;
LABEL_6:
  v13 = [BMStoreEventAtomValue alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "frame"));
  v15 = objc_msgSend(v14, "dataVersion");
  objc_msgSend(v8, "timestamp");
  v16 = -[BMStoreEventAtomValue initWithEventData:dataVersion:dataTimestamp:](v13, "initWithEventData:dataVersion:dataTimestamp:", v12, v15);

  v17 = -[BMSyncAtomValue initWithAtomType:value:version:]([BMSyncAtomValue alloc], "initWithAtomType:value:version:", a4, v16, a5);
  return v17;
}

- (BOOL)handleDeleteAtomRow:(id)a3 usingPruner:(id)a4 outBookmark:(id *)a5 outTombstoneBookmark:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  BOOL v28;
  _QWORD block[5];
  _BYTE buf[24];
  char v32;

  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "causalReference"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timestamp"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase ckAtomRowWithTimestamp:inStream:](self->_db, "ckAtomRowWithTimestamp:inStream:", v12, self->_syncIdentifier));
  if (objc_msgSend(v13, "type"))
  {
    v14 = __biome_log_for_category(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v32 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014A70;
    block[3] = &unk_100068AA0;
    block[4] = buf;
    if (qword_10007BE18 != -1)
      dispatch_once(&qword_10007BE18, block);
    v16 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v15, v16))
    {
      v17 = objc_msgSend(v13, "type");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "appendRecord %@ is of unexpected type %lu", buf, 0x16u);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT bookmarkForAtomRow:](self, "bookmarkForAtomRow:", v13));
  v19 = v18;
  if (!v18
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "segmentName")),
        v21 = objc_msgSend(v20, "isEqual:", CFSTR("DOA")),
        v20,
        v21))
  {
    v22 = __biome_log_for_category(11);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "bookmark is nil, presumably because the referenced atom was a placeholder append (dead on arrival) %@", buf, 0xCu);
    }

    if (!a5)
      goto LABEL_19;
    v24 = 0;
LABEL_18:
    *a5 = v24;
LABEL_19:
    v28 = 1;
    goto LABEL_20;
  }
  v25 = __biome_log_for_category(11);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v19;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "deleting event at bookmark %@", buf, 0xCu);
  }

  v27 = objc_msgSend(v10, "deleteEventAtBookmark:outTombstoneBookmark:", v19, a6);
  v28 = v27;
  if (a5 && v27)
  {
    v24 = objc_retainAutorelease(v19);
    goto LABEL_18;
  }
LABEL_20:

  return v28;
}

- (BOOL)writeAtomValue:(id)a3 fromAtomRow:(id)a4 usingWriter:(id)a5 outBookmark:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double Current;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;

  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventData"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventData"));
    v14 = objc_msgSend(v11, "dataVersion");
    objc_msgSend(v11, "dataTimestamp");
    if (Current == 0.0)
      Current = CFAbsoluteTimeGetCurrent();
    v16 = objc_msgSend(v10, "_writeEventData:dataVersion:timestamp:outBookmark:", v13, v14, a6, Current);

  }
  else
  {
    v17 = __biome_log_for_category(11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timestamp"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bm_description"));
      v22 = 138412290;
      v23 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Dropping atom %@ because it is dead on arrival", (uint8_t *)&v22, 0xCu);

    }
    v16 = 1;
  }

  return v16;
}

- (BOOL)addAtomToAtomBatch:(id)a3 ifChunkerAllows:(id)a4 fromAtomTableRecord:(id)a5 atomValueData:(id)a6 version:(unsigned __int8)a7 atomValueVersion:(int64_t)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (v15)
    v18 = objc_msgSend(v15, "canAddAtomWithData:", v17);
  else
    v18 = 1;
  -[BMStreamCKCRDT addAtomWithValueData:toAtomBatch:fromAtomTableRecord:version:atomValueVersion:](self, "addAtomWithValueData:toAtomBatch:fromAtomTableRecord:version:atomValueVersion:", v17, v14, v16, v9, a8);
  objc_msgSend(v15, "didAddAtomWithData:", v17);

  return v18;
}

- (void)addAtomWithValueData:(id)a3 toAtomBatch:(id)a4 fromAtomTableRecord:(id)a5 version:(unsigned __int8)a6 atomValueVersion:(int64_t)a7
{
  unsigned int v8;
  void **v11;
  id v12;
  void **v13;
  uint64_t v14;
  NSObject *v15;
  void (*v16)(uint64_t, void *);
  void ***v17;
  void **v18;
  void **v19;
  void **v20;
  void **v21;

  v8 = a6;
  v11 = (void **)a3;
  v12 = a4;
  v13 = (void **)a5;
  v14 = __biome_log_for_category(11);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100042038();

  if (v8 > 2)
  {
    v20 = _NSConcreteStackBlock;
    v16 = sub_100015184;
    v17 = &v20;
  }
  else
  {
    v21 = _NSConcreteStackBlock;
    v16 = sub_100014DD0;
    v17 = &v21;
  }
  v17[1] = (void **)3221225472;
  v17[2] = (void **)v16;
  v17[3] = (void **)&unk_100068F90;
  v17[4] = v13;
  v17[5] = v11;
  v17[6] = (void **)a7;
  v18 = v11;
  v19 = v13;
  objc_msgSend(v12, "appendAtomWithBlock:", v17);

}

- (id)readerForSiteIdentifier:(id)a3
{
  NSString *localSiteIdentifier;
  id v5;
  void *v6;
  BMStreamConfiguration *streamConfiguration;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSString *streamIdentifier;
  id v13;
  id v14;

  localSiteIdentifier = self->_localSiteIdentifier;
  v5 = a3;
  if (objc_msgSend(v5, "isEqual:", localSiteIdentifier))
    v6 = 0;
  else
    v6 = v5;
  streamConfiguration = self->_streamConfiguration;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](streamConfiguration, "storeConfig"));
  v10 = objc_msgSend(v9, "copyWithRemoteName:", v8);

  v11 = objc_alloc((Class)BMStreamDatastore);
  streamIdentifier = self->_streamIdentifier;
  v13 = -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass");
  v14 = objc_msgSend(v11, "initWithStream:permission:config:includeTombstones:eventDataClass:useCase:", streamIdentifier, 0, v10, 1, v13, BMUseCaseSync);

  return v14;
}

- (void)ingestNewChangesFromAllSitesInVectorClock:(id)a3 transportType:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allSiteIdentifiers"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        v13 = objc_alloc((Class)NSString);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v15 = objc_msgSend(v13, "initWithData:encoding:", v14, 4);

        -[BMStreamCKCRDT ingestNewChangesForSite:transportType:](self, "ingestNewChangesForSite:transportType:", v15, a4);
        -[NSCache removeAllObjects](self->_locationRowCache, "removeAllObjects");

        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (id)tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:(id)a3 fromDatastore:(id)a4
{
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  id v14;
  NSString *streamIdentifier;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  void *v35;

  v6 = a4;
  v26 = 0;
  v27 = 0;
  v7 = -[BMSyncDatabase getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:](self->_db, "getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:", a3, self->_syncIdentifier, &v26, &v27);
  v8 = v26;
  if (v7)
  {
    v9 = objc_alloc((Class)BMStoreBookmark);
    v10 = objc_msgSend(v9, "initWithStream:segment:iterationStartTime:offset:", self->_streamIdentifier, v8, v27, 1.79769313e308);
    v11 = __biome_log_for_category(11);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "segmentName"));
      v14 = objc_msgSend(v10, "offset");
      streamIdentifier = self->_streamIdentifier;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "config"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteName"));
      *(_DWORD *)buf = 138413058;
      v29 = v13;
      v30 = 2048;
      v31 = v14;
      v32 = 2112;
      v33 = streamIdentifier;
      v34 = 2112;
      v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting tombstone enumerator from segment %@ offset %lu for stream %@ site %@", buf, 0x2Au);

    }
    v18 = objc_msgSend(v6, "newTombstoneEnumeratorFromBookmark:", v10);
    v19 = objc_msgSend(v18, "nextEvent");

  }
  else
  {
    v20 = __biome_log_for_category(11);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_streamIdentifier;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "config"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "remoteName"));
      *(_DWORD *)buf = 138412546;
      v29 = v22;
      v30 = 2112;
      v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting tombstone enumerator from 0 for stream %@ site %@", buf, 0x16u);

    }
    v18 = objc_msgSend(v6, "newTombstoneEnumeratorFromStartTime:", 0.0);
  }

  return v18;
}

- (void)ingestNewChangesForSite:(id)a3 transportType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  BMSyncDatabaseTransactionBatcher *v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  BMStreamCKCRDT *v25;
  id v26;
  uint64_t *v27;
  __int128 *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint64_t *v39;
  __int128 *p_buf;
  uint64_t *v41;
  _QWORD block[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  __int128 v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  __int128 buf;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v5 = a3;
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ingestChangesForSite: %@", (uint8_t *)&buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT readerForSiteIdentifier:](self, "readerForSiteIdentifier:", v5));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v61 = 0x3032000000;
  v62 = sub_100015E40;
  v63 = sub_100015E50;
  v64 = (id)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase latestCKAtomRowOfType:forSiteIdentifier:inStream:](self->_db, "latestCKAtomRowOfType:forSiteIdentifier:inStream:", 0, v5, self->_syncIdentifier));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT bookmarkForAtomRow:](self, "bookmarkForAtomRow:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)));
  v10 = -[BMStreamCKCRDT newEnumeratorStartingAfterBookmark:reader:](self, "newEnumeratorStartingAfterBookmark:reader:", v9, v8);

  v11 = -[BMSyncDatabaseTransactionBatcher initWithDatabase:transcationBatchSize:]([BMSyncDatabaseTransactionBatcher alloc], "initWithDatabase:transcationBatchSize:", self->_db, 100);
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_100015E40;
  v53 = sub_100015E50;
  v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextEvent"));
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_100015E40;
  v47 = sub_100015E50;
  v48 = 0;
  if (v50[5] && (objc_msgSend(v5, "isEqualToString:", self->_localSiteIdentifier) & 1) == 0)
  {
    v15 = __biome_log_for_category(11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    *(_QWORD *)&v55 = 0;
    *((_QWORD *)&v55 + 1) = &v55;
    v56 = 0x2020000000;
    LOBYTE(v57) = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015E58;
    block[3] = &unk_100068AA0;
    block[4] = &v55;
    if (qword_10007BE20 != -1)
      dispatch_once(&qword_10007BE20, block);
    v17 = *(_BYTE *)(*((_QWORD *)&v55 + 1) + 24);
    _Block_object_dispose(&v55, 8);
    if (os_log_type_enabled(v16, v17))
    {
      LODWORD(v55) = 138412290;
      *(_QWORD *)((char *)&v55 + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "observed new data from non-local site %@", (uint8_t *)&v55, 0xCu);
    }

  }
  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100015E6C;
    v36[3] = &unk_100068FB8;
    v39 = &v49;
    p_buf = &buf;
    v36[4] = self;
    v37 = v5;
    v41 = &v43;
    v38 = v10;
    v12 = -[BMSyncDatabaseTransactionBatcher executeOperationWithBlock:](v11, "executeOperationWithBlock:", v36);

    if ((v12 & 1) == 0)
    {
      v13 = __biome_log_for_category(11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000420C4();
      goto LABEL_19;
    }
  }
  v18 = (void *)v44[5];
  v44[5] = 0;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:fromDatastore:](self, "tombstoneEnumeratorFromStoredBookmarkForSiteIdentifier:fromDatastore:", v5, v8));
  *(_QWORD *)&v55 = 0;
  *((_QWORD *)&v55 + 1) = &v55;
  v56 = 0x3032000000;
  v57 = sub_100015E40;
  v58 = sub_100015E50;
  v59 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100015E40;
  v34 = sub_100015E50;
  v35 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000162AC;
  v23[3] = &unk_100068FE0;
  v14 = v19;
  v24 = v14;
  v25 = self;
  v27 = &v30;
  v28 = &v55;
  v20 = v5;
  v26 = v20;
  v29 = &v43;
  if (-[BMSyncDatabaseTransactionBatcher executeOperationWithBlock:](v11, "executeOperationWithBlock:", v23))
  {
    -[BMSyncDatabase saveLatestTombstoneBookmark:forSiteIdentifier:inStream:](self->_db, "saveLatestTombstoneBookmark:forSiteIdentifier:inStream:", v31[5], v20, self->_syncIdentifier);
    -[BMStreamCKCRDT deleteLocationsUpToTTLAtTombstone:siteIdentifier:](self, "deleteLocationsUpToTTLAtTombstone:siteIdentifier:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 40), v20);
    -[BMStreamCKCRDT deletedExpiredBufferedLocationsForSiteIdentifier:](self, "deletedExpiredBufferedLocationsForSiteIdentifier:", v20);
  }
  else
  {
    v21 = __biome_log_for_category(11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100042098();

  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v55, 8);
LABEL_19:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)deleteLocationsUpToTTLAtTombstone:(id)a3 siteIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSString *streamIdentifier;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = __biome_log_for_category(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "deleteLocationsUpToTTLAtTombstone: %@, siteIdentifier: %@", (uint8_t *)&v19, 0x16u);
    }

    v10 = objc_alloc((Class)BMStoreBookmark);
    streamIdentifier = self->_streamIdentifier;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
    v13 = objc_msgSend(v10, "initWithStream:segment:iterationStartTime:offset:", streamIdentifier, v12, objc_msgSend(v6, "offset"), 1.79769313e308);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](self->_streamConfiguration, "storeConfig"));
    LODWORD(streamIdentifier) = +[BMFrameStore getSegmentVersion:config:stream:](BMFrameStore, "getSegmentVersion:config:stream:", v14, v15, self->_streamIdentifier);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase computeHighestLocationToDeleteUpToBookmark:forSiteIdentifier:inStream:offsetsIncrease:](self->_db, "computeHighestLocationToDeleteUpToBookmark:forSiteIdentifier:inStream:offsetsIncrease:", v13, v7, self->_syncIdentifier, (_DWORD)streamIdentifier == 9));
    if (v16)
      v17 = -[BMStreamCKCRDT deleteAtOrBeforeHighestDeletedLocation:](self, "deleteAtOrBeforeHighestDeletedLocation:", v16);
    else
      v17 = 1;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)deletedExpiredBufferedLocationsForSiteIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  BOOL v9;
  int v11;
  id v12;

  v4 = a3;
  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "deletedExpiredBufferedLocationsForSiteIdentifier: %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = -[BMSyncDatabase highestLocationWithBufferedAtomsOlderThan:forSiteIdentifier:inStream:](self->_db, "highestLocationWithBufferedAtomsOlderThan:forSiteIdentifier:inStream:", v4, self->_syncIdentifier, CFAbsoluteTimeGetCurrent() + -2419200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
    v9 = -[BMStreamCKCRDT deleteAtOrBeforeHighestDeletedLocation:](self, "deleteAtOrBeforeHighestDeletedLocation:", v8);
  else
    v9 = 1;

  return v9;
}

- (BOOL)deleteAtOrBeforeHighestDeletedLocation:(id)a3
{
  id v4;
  BMSyncDatabase *db;
  void *v6;
  _BOOL4 v7;
  BMSyncDatabase *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v4, 3);
  db = self->_db;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  -[BMSyncDatabase updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:](db, "updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:", v6);

  v7 = -[BMSyncDatabase deleteAllAtomsAtOrBeforeLocation:](self->_db, "deleteAllAtomsAtOrBeforeLocation:", v4);
  if (v7)
  {
    -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v4, 4);
    v8 = self->_db;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    -[BMSyncDatabase markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:](v8, "markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:", v9);

    -[BMSyncDatabase removeAllDeletedLocationsBeforeHighestDeletedLocation:](self->_db, "removeAllDeletedLocationsBeforeHighestDeletedLocation:", v4);
  }
  else
  {
    v10 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000420F0();

  }
  return v7;
}

- (void)populateAtomBatch:(id)a3 withAtomsInClockVector:(id)a4 forLocation:(id)a5 ckFormatVersion:(unsigned __int8)a6 valueVersion:(int64_t)a7 chunker:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  BMSyncDatabase *db;
  NSString *syncIdentifier;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  id v29;
  _QWORD v30[4];
  NSMutableDictionary *v31;
  BMStreamCKCRDT *v32;
  NSMutableDictionary *v33;
  id v34;
  id v35;
  int64_t v36;
  unsigned __int8 v37;

  v13 = a3;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = objc_opt_new(NSMutableDictionary);
  v18 = objc_opt_new(NSMutableDictionary);
  db = self->_db;
  syncIdentifier = self->_syncIdentifier;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100016C78;
  v30[3] = &unk_100069008;
  v21 = v17;
  v31 = v21;
  v32 = self;
  v22 = v18;
  v33 = v22;
  v36 = a7;
  v23 = v13;
  v34 = v23;
  v24 = v14;
  v35 = v24;
  v37 = a6;
  -[BMSyncDatabase atomRowsInTimestampClockVector:forLocation:inStream:enumerateWithBlock:](db, "atomRowsInTimestampClockVector:forLocation:inStream:enumerateWithBlock:", v16, v15, syncIdentifier, v30);

  v29 = 0;
  objc_msgSend(v23, "finishWritingWithError:", &v29);
  v25 = v29;
  if (v25)
  {
    v26 = __biome_log_for_category(11);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100042150();

  }
  objc_msgSend(v24, "setMoreComing:", objc_msgSend(v24, "moreComing"));

}

- (void)atomsInClockVector:(id)a3 ckFormatVersion:(unsigned __int8)a4 chunker:(id)a5 transportType:(unint64_t)a6 enumerateWithBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSString *streamIdentifier;
  void *v18;
  NSMutableArray *v19;
  BMSyncDatabase *db;
  NSString *syncIdentifier;
  NSMutableArray *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  unsigned __int8 v30;
  _QWORD v31[4];
  NSMutableArray *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  NSString *v36;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = __biome_log_for_category(11);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    streamIdentifier = self->_streamIdentifier;
    *(_DWORD *)buf = 138412546;
    v34 = v12;
    v35 = 2112;
    v36 = streamIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "atomsInClockVector: %@, stream: %@", buf, 0x16u);
  }

  v18 = objc_autoreleasePoolPush();
  -[BMStreamCKCRDT ingestNewChangesFromAllSitesInVectorClock:transportType:](self, "ingestNewChangesFromAllSitesInVectorClock:transportType:", v12, a6);
  objc_autoreleasePoolPop(v18);
  v19 = objc_opt_new(NSMutableArray);
  db = self->_db;
  syncIdentifier = self->_syncIdentifier;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100017640;
  v31[3] = &unk_100069030;
  v32 = v19;
  v22 = v19;
  -[BMSyncDatabase locationsInClockVector:inStream:enumerateWithBlock:](db, "locationsInClockVector:inStream:enumerateWithBlock:", v12, syncIdentifier, v31);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001764C;
  v26[3] = &unk_100069058;
  v26[4] = self;
  v27 = v12;
  v30 = a4;
  v28 = v13;
  v29 = v14;
  v23 = v14;
  v24 = v13;
  v25 = v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](v22, "enumerateObjectsUsingBlock:", v26);

}

- (void)handleDeletedLocation:(id)a3 deleteCKRecord:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  BMSyncDatabase *db;
  BMSyncDatabase *v20;
  void *v21;
  BMSyncDatabase *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a4;
  v6 = a3;
  v7 = __biome_log_for_category(11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "handleDeletedLocation: %@", (uint8_t *)&buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "siteIdentifier"));
  if (objc_msgSend(v9, "isEqual:", self->_localSiteIdentifier))
    v10 = 0;
  else
    v10 = v9;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](self->_streamConfiguration, "storeConfig"));
  v13 = objc_msgSend(v12, "copyWithRemoteName:", v11);

  v14 = objc_msgSend(objc_alloc((Class)BMStreamDatastorePruner), "initWithStream:config:eventDataClass:", self->_streamIdentifier, v13, -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self->_db, "locationRowWithLocation:", v6));
  v16 = v15;
  if (v15 && objc_msgSend(v15, "state") != (id)4)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x3032000000;
    v32 = sub_100015E40;
    v33 = sub_100015E50;
    v34 = 0;
    db = self->_db;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100017BD8;
    v27[3] = &unk_100069080;
    v27[4] = self;
    v28 = v14;
    p_buf = &buf;
    -[BMSyncDatabase atomsAtOrBeforeLocation:ofType:enumerateWithBlock:](db, "atomsAtOrBeforeLocation:ofType:enumerateWithBlock:", v16, 0, v27);
    -[BMSyncDatabase saveLatestTombstoneBookmark:forSiteIdentifier:inStream:](self->_db, "saveLatestTombstoneBookmark:forSiteIdentifier:inStream:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v9, self->_syncIdentifier);
    -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v16, 3);
    v20 = self->_db;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "location"));
    -[BMSyncDatabase updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:](v20, "updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:", v21);

    if (-[BMSyncDatabase deleteAllAtomsAtOrBeforeLocation:](self->_db, "deleteAllAtomsAtOrBeforeLocation:", v16))
    {
      -[BMSyncDatabase updateAllLocationsAtOrBefore:state:](self->_db, "updateAllLocationsAtOrBefore:state:", v16, 4);
      v22 = self->_db;
      if (v4)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "location"));
        -[BMSyncDatabase deleteCKRecordsAtOrBeforeLocation:](v22, "deleteCKRecordsAtOrBeforeLocation:", v23);
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "location"));
        -[BMSyncDatabase markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:](v22, "markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:", v23);
      }

      -[BMSyncDatabase removeAllDeletedLocationsBeforeHighestDeletedLocation:](self->_db, "removeAllDeletedLocationsBeforeHighestDeletedLocation:", v16);
    }

    _Block_object_dispose(&buf, 8);
  }
  else if (objc_msgSend(v16, "state") == (id)3 || objc_msgSend(v16, "state") == (id)4)
  {
    v17 = __biome_log_for_category(11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "deleted location already handled", (uint8_t *)&buf, 2u);
    }

  }
  else
  {
    v24 = __biome_log_for_category(11);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "location we haven't yet observed is now deleted %@", (uint8_t *)&buf, 0xCu);
    }

    v26 = -[BMSyncDatabase insertLocationIfNotExists:withState:](self->_db, "insertLocationIfNotExists:withState:", v6, 4);
  }

}

- (void)mergeAtomBatch:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  BMStreamCRDTLocation *v8;
  void *v9;
  BMStreamCRDTLocation *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = [BMStreamCRDTLocation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mergeableValueID"));
  v10 = -[BMStreamCRDTLocation initWithCKMergeableValueID:](v8, "initWithCKMergeableValueID:", v9);

  if (v10)
  {
    v13 = v6;
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    -[BMStreamCKCRDT mergeAtomBatches:sessionContext:forLocation:](self, "mergeAtomBatches:sessionContext:forLocation:", v11, v7, v10);
  }
  else
  {
    v12 = __biome_log_for_category(11);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_1000422D4(v6, v11);
  }

}

- (void)mergeAtomBatches:(id)a3 sessionContext:(id)a4 forLocation:(id)a5
{
  id v8;
  BMSyncDatabase *db;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  BMSyncDatabaseTransactionBatcher *v21;
  BMSyncDatabaseTransactionBatcher *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  BMSyncDatabase *v36;
  NSString *syncIdentifier;
  BMSyncDatabase *v38;
  NSString *v39;
  id v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  NSObject *obj;
  NSCache *v62;
  NSCache *v63;
  NSObject *v64;
  void *v65;
  id v66;
  NSObject *v67;
  _QWORD v68[4];
  id v69;
  BMStreamCKCRDT *v70;
  id v71;
  id v72;
  NSObject *v73;
  _QWORD *v74;
  uint64_t *v75;
  uint64_t *v76;
  _QWORD v77[5];
  id v78;
  _QWORD v79[5];
  id v80;
  _BYTE *v81;
  uint8_t v82;
  char v83[7];
  _QWORD v84[4];
  BMSyncDatabaseTransactionBatcher *v85;
  BMStreamCKCRDT *v86;
  id v87;
  NSObject *v88;
  NSCache *v89;
  NSCache *v90;
  NSObject *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  _BYTE buf[24];
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  _BYTE v108[128];

  v59 = a3;
  v66 = a4;
  v8 = a5;
  v65 = v8;
  if (v8)
  {
    v67 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self->_db, "locationRowWithLocation:", v8));
    db = self->_db;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "siteIdentifier"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase highestDeletedLocationForSiteIdentifier:inStream:](db, "highestDeletedLocationForSiteIdentifier:inStream:", v10, self->_syncIdentifier));

    if (-[NSObject state](v67, "state") == (id)1)
    {
      v11 = __biome_log_for_category(11);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v67;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received missing location %@", buf, 0xCu);
      }

      -[BMSyncDatabase updateLocationState:forLocation:](self->_db, "updateLocationState:forLocation:", 2, v67);
LABEL_6:
      v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "siteIdentifier"));
      v63 = objc_opt_new(NSCache);
      v62 = objc_opt_new(NSCache);
      v100 = 0;
      v101 = &v100;
      v102 = 0x2020000000;
      v103 = 0;
      v96 = 0;
      v97 = &v96;
      v98 = 0x2020000000;
      v99 = 0;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      obj = v59;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v93;
LABEL_8:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v93 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v15);
          v17 = objc_autoreleasePoolPush();
          v18 = __biome_log_for_category(11);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_msgSend(v16, "count");
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v65;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Merging %llu atoms with location %@", buf, 0x16u);
          }

          if ((uint64_t)objc_msgSend(v16, "count") < 1)
          {
            v23 = 3;
          }
          else
          {
            v21 = -[BMSyncDatabaseTransactionBatcher initWithDatabase:transcationBatchSize:]([BMSyncDatabaseTransactionBatcher alloc], "initWithDatabase:transcationBatchSize:", self->_db, 50);
            v84[0] = _NSConcreteStackBlock;
            v84[1] = 3221225472;
            v84[2] = sub_1000188A4;
            v84[3] = &unk_1000690A8;
            v22 = v21;
            v85 = v22;
            v86 = self;
            v87 = v66;
            v88 = v64;
            v89 = v63;
            v90 = v62;
            v91 = v67;
            objc_msgSend(v16, "enumerateAtomsWithOptions:usingBlock:", 0, v84);
            if (-[BMSyncDatabaseTransactionBatcher markAllOperationsComplete](v22, "markAllOperationsComplete"))
            {
              v23 = 0;
            }
            else
            {
              v24 = __biome_log_for_category(11);
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                sub_100042388(&v82, v83, v25);

              v23 = 1;
            }

          }
          objc_autoreleasePoolPop(v17);
          if (v23 != 3)
          {
            if (v23)
              break;
          }
          if (v13 == (id)++v15)
          {
            v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
            if (v13)
              goto LABEL_8;
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        if (-[NSObject isEqual:](v64, "isEqual:", self->_localSiteIdentifier))
          v26 = 0;
        else
          v26 = v64;
        v27 = v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamConfiguration storeConfig](self->_streamConfiguration, "storeConfig"));
        v29 = objc_msgSend(v28, "copyWithRemoteName:", v27);
        obj = v27;

        v30 = objc_msgSend(objc_alloc((Class)BMStreamDatastoreWriter), "initWithStream:config:eventDataClass:", self->_streamIdentifier, v29, -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass"));
        v31 = objc_msgSend(objc_alloc((Class)BMStreamDatastorePruner), "initWithStream:config:eventDataClass:", self->_streamIdentifier, v29, -[BMStreamConfiguration eventClass](self->_streamConfiguration, "eventClass"));
        v32 = objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT readerForSiteIdentifier:](self, "readerForSiteIdentifier:", v64));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase latestCKAtomRowOfType:forSiteIdentifier:inStream:](self->_db, "latestCKAtomRowOfType:forSiteIdentifier:inStream:", 0, v64, self->_syncIdentifier));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKCRDT bookmarkForAtomRow:](self, "bookmarkForAtomRow:", v33));
        v35 = -[BMStreamCKCRDT newEnumeratorStartingAfterBookmark:reader:](self, "newEnumeratorStartingAfterBookmark:reader:", v34, v32);
        v60 = (void *)v32;

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v105 = sub_100015E40;
        v106 = sub_100015E50;
        v107 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "nextEvent"));
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          v36 = self->_db;
          syncIdentifier = self->_syncIdentifier;
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_100018ECC;
          v79[3] = &unk_1000690D0;
          v81 = buf;
          v79[4] = self;
          v80 = v35;
          -[BMSyncDatabase atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:](v36, "atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:", v64, syncIdentifier, v79);

        }
        v77[0] = 0;
        v77[1] = v77;
        v77[2] = 0x3032000000;
        v77[3] = sub_100015E40;
        v77[4] = sub_100015E50;
        v78 = 0;
        v38 = self->_db;
        v39 = self->_syncIdentifier;
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_1000191F4;
        v68[3] = &unk_1000690F8;
        v69 = v66;
        v70 = self;
        v74 = v77;
        v75 = &v100;
        v40 = v30;
        v71 = v40;
        v76 = &v96;
        v41 = v31;
        v72 = v41;
        v42 = v64;
        v73 = v42;
        -[BMSyncDatabase atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:](v38, "atomRowsNotOnDiskReferencingSiteIdentifier:inStream:enumerateWithBlock:", v42, v39, v68);
        if (*((_BYTE *)v97 + 24))
          -[BMSyncChangeReporter userDeletesForStreamName:deviceIdentifier:error:](self->_changeReporter, "userDeletesForStreamName:deviceIdentifier:error:", self->_streamIdentifier, v42, 0);
        if (*((_BYTE *)v101 + 24))
          -[BMSyncChangeReporter streamUpdatedForStreamName:deviceIdentifier:error:](self->_changeReporter, "streamUpdatedForStreamName:deviceIdentifier:error:", self->_streamIdentifier, v42, 0);

        _Block_object_dispose(v77, 8);
        _Block_object_dispose(buf, 8);

      }
      _Block_object_dispose(&v96, 8);
      _Block_object_dispose(&v100, 8);

      v43 = v64;
      goto LABEL_43;
    }
    if (-[NSObject state](v67, "state") == (id)3 || -[NSObject state](v67, "state") == (id)4)
    {
      v47 = __biome_log_for_category(11);
      v43 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v67;
        v48 = "Location is not active %@ skipping merge to not resurrect a dead location";
        v49 = v43;
        v50 = 12;
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);
      }
    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "location"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "day"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "day"));
      v54 = objc_msgSend(v52, "compare:", v53);

      if (v54 != (id)1)
      {
        if (!v67)
        {
          v56 = __biome_log_for_category(11);
          v57 = objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v65;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "First time observing location %@", buf, 0xCu);
          }

          v67 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase insertLocationIfNotExists:withState:](self->_db, "insertLocationIfNotExists:withState:", v65, 2));
        }
        goto LABEL_6;
      }
      v55 = __biome_log_for_category(11);
      v43 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v65;
        v48 = "Highest deleted location %@ is past incoming location %@";
        v49 = v43;
        v50 = 22;
        goto LABEL_42;
      }
    }
LABEL_43:

    v46 = v67;
    goto LABEL_44;
  }
  v44 = __biome_log_for_category(11);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  v46 = v45;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    sub_10004235C();
    v46 = v45;
  }
LABEL_44:

}

- (id)clockVector
{
  return -[BMSyncDatabase timestampClockVectorForStreamName:](self->_db, "timestampClockVectorForStreamName:", self->_syncIdentifier);
}

- (BMStreamConfiguration)streamConfiguration
{
  return self->_streamConfiguration;
}

- (void)setStreamConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_streamConfiguration, a3);
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void)setMetricsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_metricsCollector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_streamConfiguration, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_changeReporter, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_locationRowCache, 0);
  objc_storeStrong((id *)&self->_locationBuilder, 0);
  objc_storeStrong((id *)&self->_localSiteIdentifier, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

@end
