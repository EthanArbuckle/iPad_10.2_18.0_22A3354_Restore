@implementation CRLZipWriter

- (CRLZipWriter)init
{
  return -[CRLZipWriter initWithOptions:](self, "initWithOptions:", 0);
}

- (CRLZipWriter)initWithOptions:(unint64_t)a3
{
  CRLZipWriter *v4;
  CRLZipWriter *v5;
  NSMutableArray *v6;
  NSMutableArray *entries;
  NSMutableDictionary *v8;
  NSMutableDictionary *entriesMap;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *channelQueue;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *writeQueue;
  uint64_t v18;
  NSDate *newEntryLastModificationDate;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CRLZipWriter;
  v4 = -[CRLZipWriter init](&v21, "init");
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = objc_opt_new(NSMutableArray);
    entries = v5->_entries;
    v5->_entries = v6;

    v8 = objc_opt_new(NSMutableDictionary);
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("CRLZipWriter.Channel", v11);
    channelQueue = v5->_channelQueue;
    v5->_channelQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("CRLZipWriter.Write", v15);
    writeQueue = v5->_writeQueue;
    v5->_writeQueue = (OS_dispatch_queue *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    newEntryLastModificationDate = v5->_newEntryLastModificationDate;
    v5->_newEntryLastModificationDate = (NSDate *)v18;

  }
  return v5;
}

- (unint64_t)entriesCount
{
  NSObject *writeQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100461240;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)entriesCountImpl
{
  return (unint64_t)-[NSMutableDictionary count](self->_entriesMap, "count");
}

- (id)p_writeChannel
{
  OS_dispatch_queue *v3;
  CRLRandomWriteChannel *writeChannel;
  OS_dispatch_semaphore *v5;
  OS_dispatch_semaphore *writeChannelCompletionSemaphore;
  CRLRandomWriteChannel *v7;
  CRLRandomWriteChannel *v8;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CKRecordID v21;
  Swift::String v22;
  _QWORD v23[4];
  id v24;
  id location;

  v3 = self->_channelQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    if (self->_writeChannelCompletionSemaphore)
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125FB38);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E36FE8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125FB58);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E36F30(v11, v10);
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Write channel semaphore should not be initialized.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[CRLZipWriter p_writeChannel]");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipWriter p_writeChannel]"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 109, 1, "Write channel semaphore should not be initialized.");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v21, v22);
      abort();
    }
    v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    writeChannelCompletionSemaphore = self->_writeChannelCompletionSemaphore;
    self->_writeChannelCompletionSemaphore = v5;

    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100461530;
    v23[3] = &unk_10122D4C0;
    objc_copyWeak(&v24, &location);
    v7 = (CRLRandomWriteChannel *)objc_claimAutoreleasedReturnValue(-[CRLZipWriter prepareWriteChannelWithCloseCompletionHandler:](self, "prepareWriteChannelWithCloseCompletionHandler:", v23));
    v8 = self->_writeChannel;
    self->_writeChannel = v7;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    writeChannel = self->_writeChannel;
  }
  return writeChannel;
}

- (void)beginEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  id v14;
  id v15;
  NSObject *writeQueue;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  unint64_t v22;
  unsigned int v23;
  BOOL v24;
  BOOL v25;

  v14 = a3;
  v15 = a5;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100461638;
  block[3] = &unk_10125FB80;
  block[4] = self;
  v20 = v14;
  v24 = a4;
  v21 = v15;
  v22 = a6;
  v23 = a7;
  v25 = a8;
  v17 = v15;
  v18 = v14;
  dispatch_async(writeQueue, block);

}

- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  _BOOL4 v8;
  uLong v9;
  id v14;
  NSDate *v15;
  NSDate *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  CRLZipWriterEntry *v23;
  CRLZipWriterEntry *currentEntry;
  _BOOL4 v25;
  unint64_t v26;
  BOOL v27;
  _BOOL4 v28;
  uLong v29;
  NSDate *v30;
  NSDate *lastModificationDateIfSizeAndCRCMatches;
  NSDate *newEntryLastModificationDate;
  NSMutableArray *v33;
  NSMutableArray *entryDatas;
  OS_dispatch_data *localFileHeaderData;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CKRecordID v46;
  Swift::String v47;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = (NSDate *)a5;
  if (self->_isClosed)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FBA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37114();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FBC0);
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v36);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[CRLZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 156, 1, "Already closed.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v46, v47);
    abort();
  }
  v16 = v15;
  if (!self->_error)
  {
    -[CRLZipWriter finishEntry](self, "finishEntry");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_entriesMap, "objectForKeyedSubscript:", v14));

    if (v17)
    {
      v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125FBE0);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E37068((uint64_t)v14, v18, v19);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125FC00);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 165, 0, "Already have an entry with name: %@", v14);

    }
    else
    {
      v23 = objc_alloc_init(CRLZipWriterEntry);
      currentEntry = self->_currentEntry;
      self->_currentEntry = v23;

      -[CRLZipWriterEntry setName:](self->_currentEntry, "setName:", v14);
      -[CRLZipWriterEntry setOffset:](self->_currentEntry, "setOffset:", self->_currentOffset);
      if (a6)
        v25 = v8;
      else
        v25 = 1;
      self->_calculateSize = v25;
      if (v25)
        v26 = 0;
      else
        v26 = a6;
      -[CRLZipWriterEntry setSize:](self->_currentEntry, "setSize:", v26);
      v27 = self->_calculateSize && a4;
      self->_force32BitSize = v27;
      if ((_DWORD)v9)
        v28 = v8;
      else
        v28 = 1;
      self->_calculateCRC = v28;
      v29 = v9;
      if (v28)
        v29 = crc32(0, 0, 0);
      -[CRLZipWriterEntry setCRC:](self->_currentEntry, "setCRC:", v29);
      if (v8)
      {
        -[CRLZipWriterEntry setLastModificationDate:](self->_currentEntry, "setLastModificationDate:", self->_newEntryLastModificationDate);
        self->_sizeToMatch = a6;
        self->_CRCToMatch = v9;
        v30 = v16;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = v30;
      }
      else
      {
        newEntryLastModificationDate = v16;
        if (!v16)
          newEntryLastModificationDate = self->_newEntryLastModificationDate;
        -[CRLZipWriterEntry setLastModificationDate:](self->_currentEntry, "setLastModificationDate:", newEntryLastModificationDate);
        self->_sizeToMatch = 0;
        self->_CRCToMatch = 0;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = 0;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipWriter localFileHeaderDataForEntry:](self, "localFileHeaderDataForEntry:", self->_currentEntry));
      if ((self->_calculateSize || self->_calculateCRC) && (self->_options & 8) == 0)
      {
        objc_storeStrong((id *)&self->_localFileHeaderData, v21);
        v33 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        entryDatas = self->_entryDatas;
        self->_entryDatas = v33;
      }
      else
      {
        -[CRLZipWriter writeData:](self, "writeData:", v21);
        localFileHeaderData = self->_localFileHeaderData;
        self->_localFileHeaderData = 0;

        entryDatas = self->_entryDatas;
        self->_entryDatas = 0;
      }

      self->_entryDataSize = 0;
    }

  }
}

- (void)addData:(id)a3
{
  -[CRLZipWriter addData:queue:completion:](self, "addData:queue:completion:", a3, 0, 0);
}

- (void)addData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *writeQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  writeQueue = self->_writeQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100461C24;
  v15[3] = &unk_101234DC8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(writeQueue, v15);

}

- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSError *v12;
  size_t size;
  NSMutableArray *entryDatas;
  OS_dispatch_data *localFileHeaderData;
  OS_dispatch_data *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CKRecordID v27;
  Swift::String v28;
  _QWORD applier[5];
  _QWORD v30[4];
  void (**v31)(_QWORD, _QWORD);
  _QWORD block[4];
  NSError *v33;
  void (**v34)(_QWORD, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isClosed)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FC20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37194();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FC40);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[CRLZipWriter addDataImpl:queue:completion:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipWriter addDataImpl:queue:completion:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 232, 1, "Already closed.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v27, v28);
    abort();
  }
  v11 = (void (**)(_QWORD, _QWORD))v10;
  v12 = self->_error;
  if (v12)
  {
    if (v11)
    {
      if (v9)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10046200C;
        block[3] = &unk_10122C360;
        v34 = v11;
        v33 = v12;
        dispatch_async(v9, block);

      }
      else
      {
        ((void (**)(_QWORD, NSError *))v11)[2](v11, v12);
      }
    }
    goto LABEL_15;
  }
  size = dispatch_data_get_size(v8);
  entryDatas = self->_entryDatas;
  if (entryDatas)
  {
    localFileHeaderData = self->_localFileHeaderData;
    if (dispatch_data_get_size((dispatch_data_t)localFileHeaderData) + size + self->_entryDataSize < 0x40000)
    {
      -[NSMutableArray addObject:](entryDatas, "addObject:", v8);
      self->_entryDataSize += size;
      if (v11)
      {
        if (v9)
        {
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10046201C;
          v30[3] = &unk_10122D7E0;
          v31 = v11;
          dispatch_async(v9, v30);

        }
        else
        {
          v11[2](v11, 0);
        }
      }
      goto LABEL_10;
    }
    -[CRLZipWriter writeData:](self, "writeData:", localFileHeaderData);
    v16 = self->_localFileHeaderData;
    self->_localFileHeaderData = 0;

    -[CRLZipWriter flushEntryData](self, "flushEntryData");
  }
  -[CRLZipWriter writeData:queue:completion:](self, "writeData:queue:completion:", v8, v9, v11);
LABEL_10:
  if (self->_calculateSize)
    -[CRLZipWriterEntry setSize:](self->_currentEntry, "setSize:", (char *)-[CRLZipWriterEntry size](self->_currentEntry, "size") + size);
  if (self->_calculateCRC)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10046202C;
    applier[3] = &unk_10125FCA8;
    applier[4] = self;
    dispatch_data_apply(v8, applier);
  }
LABEL_15:

}

- (void)flushEntryData
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *entryDatas;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_entryDatas;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[CRLZipWriter writeData:](self, "writeData:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  entryDatas = self->_entryDatas;
  self->_entryDatas = 0;

  self->_entryDataSize = 0;
}

- (void)flushCurrentEntryWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *writeQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004623C4;
  block[3] = &unk_101234DA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(writeQueue, block);

}

- (void)finishEntry
{
  CRLZipWriterEntry *currentEntry;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned int v14;
  void *v15;
  OS_dispatch_data *localFileHeaderData;
  CRLZipWriterEntry *v17;
  NSMutableDictionary *entriesMap;
  void *v19;
  NSArray *sortedEntries;
  CRLZipWriterEntry *v21;

  currentEntry = self->_currentEntry;
  if (!currentEntry)
    return;
  if (!self->_calculateSize && !self->_calculateCRC)
  {
LABEL_21:
    -[NSMutableArray addObject:](self->_entries, "addObject:", currentEntry);
    entriesMap = self->_entriesMap;
    v17 = self->_currentEntry;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipWriterEntry name](v17, "name"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](entriesMap, "setObject:forKeyedSubscript:", v17, v19);

    sortedEntries = self->_sortedEntries;
    self->_sortedEntries = 0;

    v21 = self->_currentEntry;
    self->_currentEntry = 0;

    return;
  }
  if (!self->_force32BitSize)
  {
LABEL_13:
    if (self->_lastModificationDateIfSizeAndCRCMatches)
    {
      v13 = -[CRLZipWriterEntry size](currentEntry, "size");
      currentEntry = self->_currentEntry;
      if (v13 == (id)self->_sizeToMatch)
      {
        v14 = -[CRLZipWriterEntry CRC](self->_currentEntry, "CRC");
        currentEntry = self->_currentEntry;
        if (v14 == self->_CRCToMatch)
        {
          -[CRLZipWriterEntry setLastModificationDate:](self->_currentEntry, "setLastModificationDate:", self->_lastModificationDateIfSizeAndCRCMatches);
          currentEntry = self->_currentEntry;
        }
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipWriter localFileHeaderDataForEntry:](self, "localFileHeaderDataForEntry:", currentEntry));
    if (self->_entryDatas)
    {
      -[CRLZipWriter writeData:](self, "writeData:", v15);
      localFileHeaderData = self->_localFileHeaderData;
      self->_localFileHeaderData = 0;

      -[CRLZipWriter flushEntryData](self, "flushEntryData");
    }
    else
    {
      -[CRLZipWriter writeData:offset:](self, "writeData:offset:", v15, -[CRLZipWriterEntry offset](self->_currentEntry, "offset"));
    }

    currentEntry = self->_currentEntry;
    goto LABEL_21;
  }
  if (!(-[CRLZipWriterEntry size](self->_currentEntry, "size") >> 32))
  {
    currentEntry = self->_currentEntry;
    goto LABEL_13;
  }
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10125FD30);
  v4 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
    sub_100E37314(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError crl_fileWriteUnknownErrorWithUserInfo:](NSError, "crl_fileWriteUnknownErrorWithUserInfo:", 0));
  -[CRLZipWriter handleWriteError:](self, "handleWriteError:", v12);

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9
{
  uint64_t v10;
  _BOOL8 v13;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = *(_QWORD *)&a7;
  v13 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100462AE8;
  v17[3] = &unk_10125FD58;
  v18 = a9;
  v16 = v18;
  -[CRLZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:](self, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:", a3, v13, a5, a6, v10, a8, v17);

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *writeQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  unsigned int v33;
  BOOL v34;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  if (!v17)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FD78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E37344();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125FD98);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 364, 0, "invalid nil value for '%{public}s'", "readChannel");

  }
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100462DFC;
  block[3] = &unk_10125FE28;
  block[4] = self;
  v28 = v15;
  v34 = a4;
  v33 = a7;
  v29 = v16;
  v30 = v17;
  v31 = v18;
  v32 = a6;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  dispatch_async(writeQueue, block);

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6
{
  -[CRLZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:](self, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:", a3, a4, 0, 0, 0, a5, a6);
}

- (void)addExistingEntry:(id)a3
{
  id v4;
  NSObject *writeQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004631E0;
  block[3] = &unk_10122D3D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(writeQueue, block);

}

- (void)addExistingEntryImpl:(id)a3
{
  CRLZipWriterEntry *v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableDictionary *entriesMap;
  void *v9;
  NSArray *sortedEntries;
  id v11;

  v11 = a3;
  v4 = objc_alloc_init(CRLZipWriterEntry);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  -[CRLZipWriterEntry setName:](v4, "setName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastModificationDate"));
  -[CRLZipWriterEntry setLastModificationDate:](v4, "setLastModificationDate:", v6);

  if (objc_msgSend(v11, "isCompressed"))
    v7 = objc_msgSend(v11, "compressedSize");
  else
    v7 = objc_msgSend(v11, "size");
  -[CRLZipWriterEntry setSize:](v4, "setSize:", v7);
  -[CRLZipWriterEntry setOffset:](v4, "setOffset:", objc_msgSend(v11, "offset"));
  -[CRLZipWriterEntry setCRC:](v4, "setCRC:", objc_msgSend(v11, "CRC"));
  -[NSMutableArray addObject:](self->_entries, "addObject:", v4);
  entriesMap = self->_entriesMap;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](entriesMap, "setObject:forKeyedSubscript:", v4, v9);

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;

}

- (void)setEntryInsertionOffset:(int64_t)a3
{
  NSObject *writeQueue;
  _QWORD v4[6];

  writeQueue = self->_writeQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100463364;
  v4[3] = &unk_10122DCC8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(writeQueue, v4);
}

- (void)setEntryInsertionOffsetImpl:(int64_t)a3
{
  self->_currentOffset = a3;
  self->_writtenOffset = a3;
}

- (void)addBarrier:(id)a3
{
  id v4;
  void *v5;
  NSObject *writeQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    writeQueue = self->_writeQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100463408;
    v7[3] = &unk_101231F00;
    v7[4] = self;
    v8 = v4;
    dispatch_async(writeQueue, v7);

  }
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *writeQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100463604;
  block[3] = &unk_101234DA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(writeQueue, block);

}

- (void)writeCentralDirectory
{
  int64_t currentOffset;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  currentOffset = self->_currentOffset;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_entries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CRLZipWriter writeCentralFileHeaderDataForEntry:](self, "writeCentralFileHeaderDataForEntry:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[CRLZipWriter writeEndOfCentralDirectoryDataWithOffset:size:entryCount:](self, "writeEndOfCentralDirectoryDataWithOffset:size:entryCount:", currentOffset, self->_currentOffset - currentOffset, -[NSMutableArray count](self->_entries, "count"));
}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  size_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _BOOL4 v18;
  unsigned int v19;
  size_t v20;
  _DWORD *v21;
  char *v22;
  void *v23;
  unsigned int v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  char *v28;
  id v29;
  dispatch_data_t v30;
  _BOOL4 v32;
  const char *__src;

  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name")));
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  __src = v6;
  v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_10125FEF0);
    v8 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E37584(v8, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0xFFFFLL;
  }
  v16 = self->_options & 1;
  v17 = v16 | ((unint64_t)objc_msgSend(v4, "size") >> 32);
  v18 = v17 != 0;
  if (v17 || self->_calculateSize)
  {
    v32 = !self->_force32BitSize;
    if (self->_force32BitSize)
      v19 = 0;
    else
      v19 = 20;
  }
  else
  {
    v32 = 0;
    v19 = 0;
  }
  v20 = v7 + v19 + 30;
  v21 = malloc_type_malloc(v20, 0x232DBBC5uLL);
  v22 = (char *)v21 + 30;
  *v21 = 67324752;
  v21[1] = 20;
  *((_WORD *)v21 + 4) = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastModificationDate"));
  v24 = objc_msgSend(v23, "crl_DOSTime");

  HIDWORD(v25) = v24;
  LODWORD(v25) = v24;
  *(_DWORD *)((char *)v21 + 10) = v25 >> 16;
  *(_DWORD *)((char *)v21 + 14) = objc_msgSend(v4, "CRC");
  if (!v18)
  {
    *(_DWORD *)((char *)v21 + 18) = objc_msgSend(v4, "size");
LABEL_19:
    v27 = objc_msgSend(v4, "size");
    goto LABEL_20;
  }
  if (self->_force32BitSize)
    v26 = objc_msgSend(v4, "size");
  else
    v26 = -1;
  *(_DWORD *)((char *)v21 + 18) = v26;
  if (self->_force32BitSize)
    goto LABEL_19;
  v27 = -1;
LABEL_20:
  *(_DWORD *)((char *)v21 + 22) = v27;
  *((_WORD *)v21 + 13) = v7;
  *((_WORD *)v21 + 14) = v19;
  memcpy(v22, __src, v7);
  if (v32)
  {
    v28 = &v22[v7];
    *(_WORD *)v28 = 1;
    *((_WORD *)v28 + 1) = 16;
    v29 = objc_msgSend(v4, "size");
    *(_QWORD *)(v28 + 4) = v29;
    *(_QWORD *)(v28 + 12) = v29;
  }
  v30 = dispatch_data_create(v21, v20, 0, _dispatch_data_destructor_free);

  return v30;
}

- (void)writeCentralFileHeaderDataForEntry:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  size_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  _BOOL4 v20;
  uint64_t v21;
  size_t v22;
  char *v23;
  char *v24;
  void *v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  _BOOL4 v29;
  char *v30;
  char *v31;
  char *v32;
  dispatch_data_t v33;
  const char *__src;
  CRLZipWriter *v35;

  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name")));
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  __src = v6;
  v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_10125FF10);
    v8 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E37584(v8, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0xFFFFLL;
  }
  v35 = self;
  v16 = self->_options & 2;
  v17 = v16 | ((unint64_t)objc_msgSend(v4, "size") >> 32);
  v18 = v16 | ((unint64_t)objc_msgSend(v4, "offset") >> 32);
  v19 = 4 * ((v17 | v18) != 0);
  if (v17)
    v19 = 20;
  v20 = v18 != 0;
  if (v18)
    v21 = v19 | 8;
  else
    v21 = v19;
  v22 = v7 + v21 + 46;
  v23 = (char *)malloc_type_malloc(v22, 0xBAB9D8ECuLL);
  v24 = v23 + 46;
  *(_DWORD *)v23 = 33639248;
  *(_QWORD *)(v23 + 4) = 1310782;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastModificationDate"));
  v26 = objc_msgSend(v25, "crl_DOSTime");

  HIDWORD(v27) = v26;
  LODWORD(v27) = v26;
  *((_DWORD *)v23 + 3) = v27 >> 16;
  *((_DWORD *)v23 + 4) = objc_msgSend(v4, "CRC");
  if (v17)
  {
    v28 = -1;
    *((_DWORD *)v23 + 5) = -1;
  }
  else
  {
    *((_DWORD *)v23 + 5) = objc_msgSend(v4, "size");
    v28 = objc_msgSend(v4, "size");
  }
  *((_DWORD *)v23 + 6) = v28;
  *((_WORD *)v23 + 14) = v7;
  *((_WORD *)v23 + 15) = v21;
  *((_QWORD *)v23 + 4) = 0;
  *((_WORD *)v23 + 20) = 0;
  v29 = v20;
  if (v20)
  {
    *(_DWORD *)(v23 + 42) = -1;
    memcpy(v24, __src, v7);
    *(_WORD *)&v24[v7] = 1;
    v30 = &v24[v7 + 4];
    *(_WORD *)&v24[v7 + 2] = 0;
    v31 = &v24[v7 + 2];
    if (!v17)
      goto LABEL_22;
  }
  else
  {
    *(_DWORD *)(v23 + 42) = objc_msgSend(v4, "offset");
    memcpy(v24, __src, v7);
    if (!v17)
      goto LABEL_23;
    v30 = &v24[v7 + 4];
    *(_WORD *)&v24[v7] = 1;
    v31 = &v24[v7 + 2];
  }
  v32 = &v24[v7];
  *(_WORD *)v31 = 16;
  *(_QWORD *)v30 = objc_msgSend(v4, "size");
  *(_QWORD *)(v32 + 12) = objc_msgSend(v4, "size");
  if (v29)
  {
    v30 = v32 + 20;
LABEL_22:
    *(_WORD *)v31 += 8;
    *(_QWORD *)v30 = objc_msgSend(v4, "offset");
  }
LABEL_23:
  v33 = dispatch_data_create(v23, v22, 0, _dispatch_data_destructor_free);
  -[CRLZipWriter writeData:](v35, "writeData:", v33);

}

- (void)writeEndOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  __int16 v5;
  int v6;
  int v7;
  int v9;
  int v10;
  int v11;
  int64_t currentOffset;
  _WORD *v13;
  __int16 v14;
  int v15;
  int v16;
  dispatch_data_t v17;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (a5 > 0xFFFE)
    v9 = 1;
  else
    v9 = (LOBYTE(self->_options) >> 2) & 1;
  if (a4 > 4294967294)
    v10 = 1;
  else
    v10 = (LOBYTE(self->_options) >> 2) & 1;
  if (a3 > 4294967294)
    v11 = 1;
  else
    v11 = (LOBYTE(self->_options) >> 2) & 1;
  if ((v9 & 1) != 0 || (v10 & 1) != 0 || v11)
  {
    currentOffset = self->_currentOffset;
    -[CRLZipWriter writeZip64EndOfCentralDirectoryWithOffset:size:entryCount:](self, "writeZip64EndOfCentralDirectoryWithOffset:size:entryCount:", a3, a4, a5);
    -[CRLZipWriter writeZip64EndOfCentralDirectoryLocatorWithOffset:](self, "writeZip64EndOfCentralDirectoryLocatorWithOffset:", currentOffset);
  }
  v13 = malloc_type_malloc(0x16uLL, 0x3A60B4A9uLL);
  *(_QWORD *)v13 = 101010256;
  if (v9)
    v14 = -1;
  else
    v14 = v5;
  v13[4] = v14;
  v13[5] = v14;
  if (v10)
    v15 = -1;
  else
    v15 = v6;
  if (v11)
    v16 = -1;
  else
    v16 = v7;
  *((_DWORD *)v13 + 3) = v15;
  *((_DWORD *)v13 + 4) = v16;
  v13[10] = 0;
  v17 = dispatch_data_create(v13, 0x16uLL, 0, _dispatch_data_destructor_free);
  -[CRLZipWriter writeData:](self, "writeData:", v17);

}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  _QWORD *v9;
  dispatch_data_t v10;

  v9 = malloc_type_malloc(0x38uLL, 0xCE242754uLL);
  *(_DWORD *)v9 = 101075792;
  *(_QWORD *)((char *)v9 + 4) = 44;
  v9[2] = 0;
  v9[3] = a5;
  *((_DWORD *)v9 + 3) = 1310782;
  v9[4] = a5;
  v9[5] = a4;
  v9[6] = a3;
  v10 = dispatch_data_create(v9, 0x38uLL, 0, _dispatch_data_destructor_free);
  -[CRLZipWriter writeData:](self, "writeData:", v10);

}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  _DWORD *v5;
  dispatch_data_t v6;

  v5 = malloc_type_malloc(0x14uLL, 0xFB05F16uLL);
  *v5 = 117853008;
  v5[1] = 0;
  *((_QWORD *)v5 + 1) = a3;
  v5[4] = 1;
  v6 = dispatch_data_create(v5, 0x14uLL, 0, _dispatch_data_destructor_free);
  -[CRLZipWriter writeData:](self, "writeData:", v6);

}

- (void)writeData:(id)a3
{
  -[CRLZipWriter writeData:queue:completion:](self, "writeData:queue:completion:", a3, 0, 0);
}

- (void)writeData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  size_t size;
  int64_t writtenOffset;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  size = dispatch_data_get_size((dispatch_data_t)a3);
  self->_currentOffset += size;
  writtenOffset = self->_writtenOffset;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1004646E4;
  v14[3] = &unk_10125FF38;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  -[CRLZipWriter p_writeData:offset:completion:](self, "p_writeData:offset:completion:", a3, writtenOffset, v14);
  self->_writtenOffset += size;

}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
  -[CRLZipWriter p_writeData:offset:completion:](self, "p_writeData:offset:completion:", a3, a4, 0);
}

- (void)p_writeData:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *channelQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  channelQueue = self->_channelQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100464850;
  v13[3] = &unk_101259348;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(channelQueue, v13);

}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125FF80);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67110146;
    v28 = v5;
    v29 = 2082;
    v30 = "-[CRLZipWriter prepareWriteChannelWithCloseCompletionHandler:]";
    v31 = 2082;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m";
    v33 = 1024;
    v34 = 782;
    v35 = 2114;
    v36 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125FFA0);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v28 = v5;
    v29 = 2114;
    v30 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipWriter prepareWriteChannelWithCloseCompletionHandler:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m"));
  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 782, 0, "Abstract method not overridden by %{public}@", v20);

  objc_opt_class(self, v21);
  v23 = NSStringFromClass(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v24, "-[CRLZipWriter prepareWriteChannelWithCloseCompletionHandler:]"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v25, 0));

  objc_exception_throw(v26);
}

- (unint64_t)archiveLength
{
  NSObject *writeQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100464E04;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)handleWriteError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *channelQueue;
  _QWORD block[5];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "code") != (id)3072
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain")),
          v8 = objc_msgSend(v7, "isEqualToString:", NSCocoaErrorDomain),
          v7,
          (v8 & 1) == 0))
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_10125FFC0);
      v9 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100E375B4(v9, v6);
    }
    if (!self->_error)
    {
      objc_storeStrong((id *)&self->_error, a3);
      channelQueue = self->_channelQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100464F74;
      block[3] = &unk_10122D110;
      block[4] = self;
      dispatch_async(channelQueue, block);
    }
  }

}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4;
  NSObject *writeQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100465020;
  block[3] = &unk_101231F00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(writeQueue, block);

}

- (id)sortedEntriesImpl
{
  NSArray *sortedEntries;
  NSArray *v4;
  NSArray *v5;

  sortedEntries = self->_sortedEntries;
  if (!sortedEntries)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](self->_entries, "sortedArrayUsingComparator:", &stru_101260000));
    v5 = self->_sortedEntries;
    self->_sortedEntries = v4;

    sortedEntries = self->_sortedEntries;
  }
  return sortedEntries;
}

- (NSArray)sortedEntries
{
  NSObject *writeQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100464954;
  v10 = sub_100464964;
  v11 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10046535C;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (BOOL)isClosed
{
  NSObject *writeQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100465424;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)entryWithName:(id)a3
{
  id v4;
  NSObject *writeQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100464954;
  v16 = sub_100464964;
  v17 = 0;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046550C;
  block[3] = &unk_101230370;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(writeQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)truncateToNumberOfEntries:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *writeQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004655D4;
  block[3] = &unk_1012313C0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(writeQueue, block);

}

- (void)truncateToNumberOfEntriesImpl:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  NSMutableDictionary *entriesMap;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  if (-[CRLZipWriter entriesCountImpl](self, "entriesCountImpl") > a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLZipWriter sortedEntriesImpl](self, "sortedEntriesImpl"));
    if ((unint64_t)objc_msgSend(v6, "count") > a3)
    {
      v7 = a3;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
        -[NSMutableArray removeObject:](self->_entries, "removeObject:", v8);
        entriesMap = self->_entriesMap;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        -[NSMutableDictionary removeObjectForKey:](entriesMap, "removeObjectForKey:", v10);

        ++v7;
      }
      while (v7 < (unint64_t)objc_msgSend(v6, "count"));
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
    -[CRLZipWriter setEntryInsertionOffsetImpl:](self, "setEntryInsertionOffsetImpl:", objc_msgSend(v11, "offset"));
    -[CRLZipWriter truncateToOffsetImpl:completion:](self, "truncateToOffsetImpl:completion:", objc_msgSend(v11, "offset"), v13);

    goto LABEL_8;
  }
  v12 = v13;
  if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_8:
    v12 = v13;
  }

}

- (void)truncateToOffset:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *writeQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004657A8;
  block[3] = &unk_1012313C0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(writeQueue, block);

}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  Class v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  Class v23;
  NSString *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;

  v5 = a4;
  v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260020);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    objc_opt_class(self, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 67110146;
    v29 = v6;
    v30 = 2082;
    v31 = "-[CRLZipWriter truncateToOffsetImpl:completion:]";
    v32 = 2082;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m";
    v34 = 1024;
    v35 = 919;
    v36 = 2114;
    v37 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260040);
  v13 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v15 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v29 = v6;
    v30 = 2114;
    v31 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipWriter truncateToOffsetImpl:completion:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipWriter.m"));
  objc_opt_class(self, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 919, 0, "Abstract method not overridden by %{public}@", v21);

  objc_opt_class(self, v22);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v25, "-[CRLZipWriter truncateToOffsetImpl:completion:]"));
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v26, 0));

  objc_exception_throw(v27);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_entryDatas, 0);
  objc_storeStrong((id *)&self->_localFileHeaderData, 0);
  objc_storeStrong((id *)&self->_newEntryLastModificationDate, 0);
  objc_storeStrong((id *)&self->_lastModificationDateIfSizeAndCRCMatches, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
  objc_storeStrong((id *)&self->_sortedEntries, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_writeChannelCompletionSemaphore, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong((id *)&self->_channelQueue, 0);
}

@end
