@implementation BMStreamCKRecordCRDT

- (BMStreamCKRecordCRDT)initWithStreamCRDT:(id)a3 locationRow:(id)a4 database:(id)a5 queue:(id)a6 maxDeltaSize:(int64_t)a7 sessionContext:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMStreamCKRecordCRDT *v18;
  BMStreamCKRecordCRDT *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMStreamCKRecordCRDT;
  v18 = -[BMStreamCKRecordCRDT init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_streamCRDT, a3);
    objc_storeStrong((id *)&v19->_locationRow, a4);
    objc_storeStrong((id *)&v19->_db, a5);
    objc_storeStrong((id *)&v19->_queue, a6);
    v19->_maxDeltaSize = a7;
    objc_storeStrong((id *)&v19->_sessionContext, a8);
  }

  return v19;
}

- (id)stateVector
{
  BMSyncDatabase *db;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_locationRow)
  {
    db = self->_db;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCKRecordCRDT locationRow](self, "locationRow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase stateVectorForLocationRow:](db, "stateVectorForLocationRow:", v4));

  }
  else
  {
    v6 = __biome_log_for_category(11);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100041380(v7);

    v5 = (void *)objc_opt_new(CKDistributedTimestampStateVector);
  }
  return v5;
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  BMSyncSessionContext *sessionContext;
  BMStreamCKCRDT *streamCRDT;
  void *v26;
  id v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v28 = objc_alloc_init((Class)NSMutableArray);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v12 = __biome_log_for_category(11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "mergeDeltas delta: %@", buf, 0xCu);
        }

        v14 = objc_alloc((Class)CKAtomBatch);
        v30 = 0;
        v15 = objc_msgSend(v14, "initWithMergeableDelta:error:", v11, &v30);
        v16 = v30;
        v8 = v16;
        if (v15)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          objc_msgSend(v28, "addObject:", v15);
        }
        else
        {
          v18 = __biome_log_for_category(11);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v8;
            _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Failed to initWithMergeableDelta with error %@", buf, 0xCu);
          }

        }
        v20 = objc_alloc((Class)NSString);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mergeableValueID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
        v23 = objc_msgSend(v20, "initWithData:encoding:", v22, 4);
        -[BMSyncSessionContext setOriginatingSiteIdentifier:](self->_sessionContext, "setOriginatingSiteIdentifier:", v23);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  sessionContext = self->_sessionContext;
  streamCRDT = self->_streamCRDT;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](self->_locationRow, "location"));
  -[BMStreamCKCRDT mergeAtomBatches:sessionContext:forLocation:](streamCRDT, "mergeAtomBatches:sessionContext:forLocation:", v28, sessionContext, v26);

  return 1;
}

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  BMStreamCKCRDT *streamCRDT;
  void *v17;
  id v18;
  uint64_t v19;
  NSMutableArray *v20;
  int64_t maxDeltaSize;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  NSMutableArray *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  id *v50;
  void *v51;
  id v52;
  id obj;
  _QWORD v54[5];
  id v55;
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _QWORD v63[5];
  id v64;
  _QWORD block[5];
  id v66;
  uint8_t v67[4];
  uint64_t v68;
  uint8_t v69[128];
  _BYTE buf[24];
  char v71;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](self->_locationRow, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ckMergeableValueID"));

  v66 = 0;
  v9 = objc_msgSend(objc_alloc((Class)CKAtomBatch), "initWriterWithMergeableValueID:metadata:formatVersion:error:", v8, v6, 3, &v66);
  v10 = v66;
  if (v10)
  {
    v11 = v10;
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v71 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006C30;
    block[3] = &unk_100068AA0;
    block[4] = buf;
    if (qword_10007BDC8 != -1)
      dispatch_once(&qword_10007BDC8, block);
    v14 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v13, v14))
      goto LABEL_12;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    v15 = "BMStreamCKRecordCRDT: unable to init a CKAtomBatch with initWriterWithMergeableValueID:%@ error:%@";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v13, v14, v15, buf, 0x16u);
LABEL_12:

    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      v20 = 0;
      *a4 = v11;
    }
    else
    {
      v20 = 0;
    }
    goto LABEL_46;
  }
  streamCRDT = self->_streamCRDT;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentsVector"));
  -[BMStreamCKCRDT populateAtomBatch:withAtomsInClockVector:forLocation:ckFormatVersion:valueVersion:chunker:](streamCRDT, "populateAtomBatch:withAtomsInClockVector:forLocation:ckFormatVersion:valueVersion:chunker:", v9, v17, self->_locationRow, 3, 1, 0);

  v64 = 0;
  objc_msgSend(v9, "finishWritingWithError:", &v64);
  v18 = v64;
  if (v18)
  {
    v11 = v18;
    v19 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v19);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v71 = 16;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100006C44;
    v63[3] = &unk_100068AA0;
    v63[4] = buf;
    if (qword_10007BDD0 != -1)
      dispatch_once(&qword_10007BDD0, v63);
    v14 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v13, v14))
      goto LABEL_12;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    v15 = "BMStreamCKRecordCRDT: unable to complete a CKAtomBatch with finishWritingWithError:%@ error:%@";
    goto LABEL_11;
  }
  maxDeltaSize = self->_maxDeltaSize;
  v62 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "splitWithMaximumSize:error:", maxDeltaSize, &v62));
  v23 = v62;
  if (v23)
  {
    v24 = __biome_log_for_category(11);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000413FC(v25, v26, v27);

    v20 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v23);
  }
  else
  {
    v50 = a4;
    v52 = v9;
    v28 = objc_opt_new(NSMutableArray);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v51 = v22;
    obj = v22;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          v33 = v28;
          if (*(_QWORD *)v59 != v31)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
          v56 = 0;
          v57 = 0;
          objc_msgSend(v34, "size:error:", &v57, &v56);
          v35 = v56;
          v36 = __biome_log_for_category(11);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          v38 = v37;
          if (v35)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              sub_1000413C0(v67, &v68, v38);
          }
          else if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "BMStreamCKRecordCRDT: split into batch of size %@", buf, 0xCu);

          }
          v40 = objc_alloc((Class)CKMergeableDelta);
          v55 = 0;
          v41 = objc_msgSend(v40, "initWithAtomBatch:error:", v34, &v55);
          v42 = v55;
          if (v42)
          {
            v45 = v42;
            v46 = __biome_log_for_category(11);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v71 = 16;
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_100006C58;
            v54[3] = &unk_100068AA0;
            v54[4] = buf;
            if (qword_10007BDD8 != -1)
              dispatch_once(&qword_10007BDD8, v54);
            v22 = v51;
            v48 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            if (os_log_type_enabled(v47, v48))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v45;
              _os_log_impl((void *)&_mh_execute_header, v47, v48, "BMStreamCKRecordCRDT: unable to init a CKMergeableDelta with initWithAtomBatch:%@ error:%@", buf, 0x16u);
            }

            if (v50)
              *v50 = objc_retainAutorelease(v45);

            v20 = 0;
            v9 = v52;
            v23 = 0;
            v28 = v33;
            goto LABEL_44;
          }
          v28 = v33;
          -[NSMutableArray addObject:](v33, "addObject:", v41);

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        if (v30)
          continue;
        break;
      }
    }

    v43 = __biome_log_for_category(11);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "*** deltas: %@", buf, 0xCu);
    }

    v20 = v28;
    v22 = v51;
    v9 = v52;
    v23 = 0;
LABEL_44:

  }
  v11 = 0;
LABEL_46:

  return v20;
}

- (unint64_t)deltaDeliveryRequirements
{
  return 1;
}

- (BMStreamCKCRDT)streamCRDT
{
  return self->_streamCRDT;
}

- (BMSyncCRDTLocationRow)locationRow
{
  return self->_locationRow;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)maxDeltaSize
{
  return self->_maxDeltaSize;
}

- (void)setMaxDeltaSize:(int64_t)a3
{
  self->_maxDeltaSize = a3;
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationRow, 0);
  objc_storeStrong((id *)&self->_streamCRDT, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
