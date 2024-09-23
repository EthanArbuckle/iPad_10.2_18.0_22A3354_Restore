@implementation TSUZipWriter

- (TSUZipWriter)init
{
  return -[TSUZipWriter initWithOptions:](self, "initWithOptions:", 0);
}

- (TSUZipWriter)initWithOptions:(unint64_t)a3
{
  TSUZipWriter *v4;
  TSUZipWriter *v5;
  uint64_t v6;
  NSMutableArray *entries;
  uint64_t v8;
  NSMutableDictionary *entriesMap;
  dispatch_queue_t v10;
  OS_dispatch_queue *channelQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *writeQueue;
  uint64_t v14;
  NSDate *newEntryLastModificationDate;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TSUZipWriter;
  v4 = -[TSUZipWriter init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = objc_opt_new();
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = (NSMutableDictionary *)v8;

    v10 = dispatch_queue_create("TSUZipWriter.Channel", 0);
    channelQueue = v5->_channelQueue;
    v5->_channelQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("TSUZipWriter.Write", 0);
    writeQueue = v5->_writeQueue;
    v5->_writeQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    newEntryLastModificationDate = v5->_newEntryLastModificationDate;
    v5->_newEntryLastModificationDate = (NSDate *)v14;

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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__TSUZipWriter_entriesCount__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__TSUZipWriter_entriesCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "entriesCountImpl");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)entriesCountImpl
{
  return -[NSMutableDictionary count](self->_entriesMap, "count");
}

- (id)p_writeChannel
{
  TSURandomWriteChannel *writeChannel;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  OS_dispatch_semaphore *v13;
  OS_dispatch_semaphore *writeChannelCompletionSemaphore;
  TSURandomWriteChannel *v15;
  TSURandomWriteChannel *v16;
  _QWORD v18[4];
  id v19;
  id location;

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    if (self->_writeChannelCompletionSemaphore)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter p_writeChannel]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 105, 1, "Write channel semaphore should not be initialized.");

      TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Write channel semaphore should not be initialized.", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[TSUZipWriter p_writeChannel]");
    }
    v13 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    writeChannelCompletionSemaphore = self->_writeChannelCompletionSemaphore;
    self->_writeChannelCompletionSemaphore = v13;

    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __30__TSUZipWriter_p_writeChannel__block_invoke;
    v18[3] = &unk_24F39C1B8;
    objc_copyWeak(&v19, &location);
    -[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:](self, "prepareWriteChannelWithCloseCompletionHandler:", v18);
    v15 = (TSURandomWriteChannel *)objc_claimAutoreleasedReturnValue();
    v16 = self->_writeChannel;
    self->_writeChannel = v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    writeChannel = self->_writeChannel;
  }
  return writeChannel;
}

void __30__TSUZipWriter_p_writeChannel__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t *WeakRetained;
  dispatch_semaphore_t *v2;

  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_semaphore_signal(WeakRetained[4]);
    WeakRetained = v2;
  }

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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __140__TSUZipWriter_beginEntryWithName_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate___block_invoke;
  block[3] = &unk_24F39C1E0;
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

uint64_t __140__TSUZipWriter_beginEntryWithName_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(a1 + 69));
}

- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  _BOOL4 v8;
  NSDate *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  TSUZipWriterEntry *v25;
  TSUZipWriterEntry *currentEntry;
  _BOOL4 v27;
  unint64_t v28;
  BOOL v29;
  _BOOL4 v30;
  uLong v31;
  NSDate *v32;
  NSDate *lastModificationDateIfSizeAndCRCMatches;
  NSDate *newEntryLastModificationDate;
  void *v35;
  NSMutableArray *v36;
  NSMutableArray *entryDatas;
  OS_dispatch_data *localFileHeaderData;
  id v41;

  v8 = a8;
  v41 = a3;
  v12 = (NSDate *)a5;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 130, 1, "Already closed.");

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
  }
  if (!self->_error)
  {
    -[TSUZipWriter finishEntry](self, "finishEntry");
    -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesMap, "objectForKeyedSubscript:", v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 139, 0, "Already have an entry with name: %@", v41);

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    else
    {
      v25 = objc_alloc_init(TSUZipWriterEntry);
      currentEntry = self->_currentEntry;
      self->_currentEntry = v25;

      -[TSUZipWriterEntry setName:](self->_currentEntry, "setName:", v41);
      -[TSUZipWriterEntry setOffset:](self->_currentEntry, "setOffset:", self->_currentOffset);
      if (a6)
        v27 = v8;
      else
        v27 = 1;
      self->_calculateSize = v27;
      if (v27)
        v28 = 0;
      else
        v28 = a6;
      -[TSUZipWriterEntry setSize:](self->_currentEntry, "setSize:", v28);
      v29 = self->_calculateSize && a4;
      self->_force32BitSize = v29;
      if (a7)
        v30 = v8;
      else
        v30 = 1;
      self->_calculateCRC = v30;
      v31 = a7;
      if (v30)
        v31 = crc32(0, 0, 0);
      -[TSUZipWriterEntry setCRC:](self->_currentEntry, "setCRC:", v31);
      if (v8)
      {
        -[TSUZipWriterEntry setLastModificationDate:](self->_currentEntry, "setLastModificationDate:", self->_newEntryLastModificationDate);
        self->_sizeToMatch = a6;
        self->_CRCToMatch = a7;
        v32 = v12;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = v32;
      }
      else
      {
        newEntryLastModificationDate = v12;
        if (!v12)
          newEntryLastModificationDate = self->_newEntryLastModificationDate;
        -[TSUZipWriterEntry setLastModificationDate:](self->_currentEntry, "setLastModificationDate:", newEntryLastModificationDate);
        self->_sizeToMatch = 0;
        self->_CRCToMatch = 0;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = 0;
      }

      -[TSUZipWriter localFileHeaderDataForEntry:](self, "localFileHeaderDataForEntry:", self->_currentEntry);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((self->_calculateSize || self->_calculateCRC) && (self->_options & 8) == 0)
      {
        objc_storeStrong((id *)&self->_localFileHeaderData, v35);
        v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        entryDatas = self->_entryDatas;
        self->_entryDatas = v36;
      }
      else
      {
        -[TSUZipWriter writeData:](self, "writeData:", v35);
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
  -[TSUZipWriter addData:queue:completion:](self, "addData:queue:completion:", a3, 0, 0);
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
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__TSUZipWriter_addData_queue_completion___block_invoke;
  v15[3] = &unk_24F39C208;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(writeQueue, v15);

}

uint64_t __41__TSUZipWriter_addData_queue_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDataImpl:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSError *v20;
  size_t size;
  NSMutableArray *entryDatas;
  NSObject *localFileHeaderData;
  OS_dispatch_data *v24;
  _QWORD applier[5];
  _QWORD v26[4];
  id v27;
  _QWORD block[4];
  NSError *v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isClosed)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter addDataImpl:queue:completion:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 196, 1, "Already closed.");

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[TSUZipWriter addDataImpl:queue:completion:]");
  }
  v20 = self->_error;
  if (v20)
  {
    if (v10)
    {
      if (v9)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke;
        block[3] = &unk_24F39BAB0;
        v30 = v10;
        v29 = v20;
        dispatch_async(v9, block);

      }
      else
      {
        (*((void (**)(id, NSError *))v10 + 2))(v10, v20);
      }
    }
    goto LABEL_16;
  }
  size = dispatch_data_get_size(v8);
  entryDatas = self->_entryDatas;
  if (entryDatas)
  {
    localFileHeaderData = self->_localFileHeaderData;
    if (dispatch_data_get_size(localFileHeaderData) + size + self->_entryDataSize < 0x40000)
    {
      -[NSMutableArray addObject:](entryDatas, "addObject:", v8);
      self->_entryDataSize += size;
      if (v10)
      {
        if (v9)
        {
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_2;
          v26[3] = &unk_24F39B6C0;
          v27 = v10;
          dispatch_async(v9, v26);

        }
        else
        {
          (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
        }
      }
      goto LABEL_11;
    }
    -[TSUZipWriter writeData:](self, "writeData:", localFileHeaderData);
    v24 = self->_localFileHeaderData;
    self->_localFileHeaderData = 0;

    -[TSUZipWriter flushEntryData](self, "flushEntryData");
  }
  -[TSUZipWriter writeData:queue:completion:](self, "writeData:queue:completion:", v8, v9, v10);
LABEL_11:
  if (self->_calculateSize)
    -[TSUZipWriterEntry setSize:](self->_currentEntry, "setSize:", -[TSUZipWriterEntry size](self->_currentEntry, "size") + size);
  if (self->_calculateCRC)
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_3;
    applier[3] = &unk_24F39C230;
    applier[4] = self;
    dispatch_data_apply(v8, applier);
  }
LABEL_16:

}

uint64_t __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, const Bytef *a4, unint64_t a5)
{
  unsigned int v8;
  void *v10;
  void *v11;

  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "CRC");
  if (HIDWORD(a5))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter addDataImpl:queue:completion:]_block_invoke_3");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 237, 0, "Out-of-bounds type assignment was clamped to max");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    LODWORD(a5) = -1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setCRC:", crc32(v8, a4, a5));
  return 1;
}

- (void)flushEntryData
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *entryDatas;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
        -[TSUZipWriter writeData:](self, "writeData:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke;
  block[3] = &unk_24F39C2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(writeQueue, block);

}

void __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter flushCurrentEntryWithQueue:completion:]_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 255, 1, "Trying to flush while closed.");

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Trying to flush while closed.", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[TSUZipWriter flushCurrentEntryWithQueue:completion:]_block_invoke");
  }
  v12 = *(void **)(v2 + 160);
  if (v12)
  {
    v13 = v12;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_2;
    block[3] = &unk_24F39BAB0;
    v14 = *(NSObject **)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v23 = v13;
    v24 = v15;
    v16 = v13;
    dispatch_async(v14, block);

  }
  else
  {
    objc_msgSend((id)v2, "finishEntry");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(v17 + 16);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_3;
    v19[3] = &unk_24F39C280;
    v19[4] = v17;
    v21 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 40);
    dispatch_async(v18, v19);

  }
}

uint64_t __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_4;
  v6[3] = &unk_24F39C258;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v6[4] = v4;
  v7 = v5;
  objc_msgSend(v2, "flushWithCompletion:", v6);

}

void __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 48))
  {
    v5 = v3;
    if (!v3)
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    v6 = v5;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_5;
    v10[3] = &unk_24F39BAB0;
    v7 = *(NSObject **)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v11 = v6;
    v12 = v8;
    v9 = v6;
    dispatch_async(v7, v10);

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

}

uint64_t __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)finishEntry
{
  TSUZipWriterEntry *currentEntry;
  TSUZipWriterEntry *v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  OS_dispatch_data *localFileHeaderData;
  TSUZipWriterEntry *v9;
  NSMutableDictionary *entriesMap;
  void *v11;
  NSArray *sortedEntries;
  uint64_t v13;

  currentEntry = self->_currentEntry;
  if (currentEntry)
  {
    if (self->_calculateSize || self->_calculateCRC)
    {
      if (self->_force32BitSize)
      {
        if (-[TSUZipWriterEntry size](self->_currentEntry, "size") >> 32)
        {
          if (TSUDefaultCat_init_token != -1)
            dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_31);
          objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
          v13 = objc_claimAutoreleasedReturnValue();
          -[TSUZipWriter handleWriteError:](self, "handleWriteError:", v13);
          v4 = (TSUZipWriterEntry *)v13;
          goto LABEL_20;
        }
        currentEntry = self->_currentEntry;
      }
      if (self->_lastModificationDateIfSizeAndCRCMatches)
      {
        v5 = -[TSUZipWriterEntry size](currentEntry, "size");
        currentEntry = self->_currentEntry;
        if (v5 == self->_sizeToMatch)
        {
          v6 = -[TSUZipWriterEntry CRC](self->_currentEntry, "CRC");
          currentEntry = self->_currentEntry;
          if (v6 == self->_CRCToMatch)
          {
            -[TSUZipWriterEntry setLastModificationDate:](self->_currentEntry, "setLastModificationDate:", self->_lastModificationDateIfSizeAndCRCMatches);
            currentEntry = self->_currentEntry;
          }
        }
      }
      -[TSUZipWriter localFileHeaderDataForEntry:](self, "localFileHeaderDataForEntry:", currentEntry);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_entryDatas)
      {
        -[TSUZipWriter writeData:](self, "writeData:", v7);
        localFileHeaderData = self->_localFileHeaderData;
        self->_localFileHeaderData = 0;

        -[TSUZipWriter flushEntryData](self, "flushEntryData");
      }
      else
      {
        -[TSUZipWriter writeData:offset:](self, "writeData:offset:", v7, -[TSUZipWriterEntry offset](self->_currentEntry, "offset"));
      }

      currentEntry = self->_currentEntry;
    }
    -[NSMutableArray addObject:](self->_entries, "addObject:", currentEntry);
    entriesMap = self->_entriesMap;
    v9 = self->_currentEntry;
    -[TSUZipWriterEntry name](v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](entriesMap, "setObject:forKeyedSubscript:", v9, v11);

    sortedEntries = self->_sortedEntries;
    self->_sortedEntries = 0;

    v4 = self->_currentEntry;
    self->_currentEntry = 0;
LABEL_20:

  }
}

void __27__TSUZipWriter_finishEntry__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9
{
  uint64_t v10;
  _BOOL8 v13;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = *(_QWORD *)&a7;
  v13 = a4;
  v16 = a9;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __107__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_completion___block_invoke;
  v18[3] = &unk_24F39C2F0;
  v19 = v16;
  v17 = v16;
  -[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:](self, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:", a3, v13, a5, a6, v10, a8, v18);

}

void __107__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v7 == 0);
  }

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *writeQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  unsigned int v32;
  BOOL v33;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 330, 0, "invalid nil value for '%{public}s'", "readChannel");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke;
  block[3] = &unk_24F39C340;
  block[4] = self;
  v27 = v15;
  v33 = a4;
  v32 = a7;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = a6;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  dispatch_async(writeQueue, block);

}

void __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 333, 1, "Already closed.");

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]_block_invoke");
  }
  dispatch_suspend(*(dispatch_object_t *)(v2 + 144));
  objc_msgSend(*(id *)(a1 + 32), "beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 84), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 80), 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke_2;
  v13[3] = &unk_24F39C318;
  v13[4] = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v12, "readWithHandler:", v13);

}

void __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "handleWriteError:", a4);
  if (v7)
  {
    v8 = *(_QWORD **)(a1 + 32);
    if (!v8[20])
      objc_msgSend(v8, "addDataImpl:queue:completion:", v7, 0, 0);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v12 = 0;
    (*(void (**)(uint64_t, uint64_t, id, _QWORD, char *))(v9 + 16))(v9, a2, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), &v12);
    if (v12)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleWriteError:", v11);

    }
  }
  if ((_DWORD)a2)
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 144));

}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6
{
  -[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:](self, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:", a3, a4, 0, 0, 0, a5, a6);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TSUZipWriter_addExistingEntry___block_invoke;
  block[3] = &unk_24F39B500;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(writeQueue, block);

}

uint64_t __33__TSUZipWriter_addExistingEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addExistingEntryImpl:", *(_QWORD *)(a1 + 40));
}

- (void)addExistingEntryImpl:(id)a3
{
  TSUZipWriterEntry *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *entriesMap;
  void *v9;
  NSArray *sortedEntries;
  id v11;

  v11 = a3;
  v4 = objc_alloc_init(TSUZipWriterEntry);
  objc_msgSend(v11, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUZipWriterEntry setName:](v4, "setName:", v5);

  objc_msgSend(v11, "lastModificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUZipWriterEntry setLastModificationDate:](v4, "setLastModificationDate:", v6);

  if (objc_msgSend(v11, "isCompressed"))
    v7 = objc_msgSend(v11, "compressedSize");
  else
    v7 = objc_msgSend(v11, "size");
  -[TSUZipWriterEntry setSize:](v4, "setSize:", v7);
  -[TSUZipWriterEntry setOffset:](v4, "setOffset:", objc_msgSend(v11, "offset"));
  -[TSUZipWriterEntry setCRC:](v4, "setCRC:", objc_msgSend(v11, "CRC"));
  -[NSMutableArray addObject:](self->_entries, "addObject:", v4);
  entriesMap = self->_entriesMap;
  objc_msgSend(v11, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](entriesMap, "setObject:forKeyedSubscript:", v4, v9);

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;

}

- (void)setEntryInsertionOffset:(int64_t)a3
{
  NSObject *writeQueue;
  _QWORD v4[6];

  writeQueue = self->_writeQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__TSUZipWriter_setEntryInsertionOffset___block_invoke;
  v4[3] = &unk_24F39C368;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(writeQueue, v4);
}

uint64_t __40__TSUZipWriter_setEntryInsertionOffset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEntryInsertionOffsetImpl:", *(_QWORD *)(a1 + 40));
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
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __27__TSUZipWriter_addBarrier___block_invoke;
    v7[3] = &unk_24F39BDD0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(writeQueue, v7);

  }
}

void __27__TSUZipWriter_addBarrier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 144));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__TSUZipWriter_addBarrier___block_invoke_2;
  v5[3] = &unk_24F39BDD0;
  v5[4] = v2;
  v6 = v3;
  dispatch_async(v4, v5);

}

void __27__TSUZipWriter_addBarrier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__TSUZipWriter_addBarrier___block_invoke_3;
  v4[3] = &unk_24F39BAB0;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "addBarrier:", v4);

}

void __27__TSUZipWriter_addBarrier___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 144));
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke;
  block[3] = &unk_24F39C2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(writeQueue, block);

}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke(id *a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v2 = a1[4];
  if (v2[72])
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter closeWithQueue:completion:]_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 426, 1, "Shouldn't have closed twice.");

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Shouldn't have closed twice.", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[TSUZipWriter closeWithQueue:completion:]_block_invoke");
  }
  if (*((_QWORD *)v2 + 20))
  {
    v2[72] = 1;
    v12 = *((id *)a1[4] + 20);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2;
    block[3] = &unk_24F39BAB0;
    v13 = a1[5];
    v14 = a1[6];
    v22 = v12;
    v23 = v14;
    v15 = v12;
    dispatch_async(v13, block);

  }
  else
  {
    objc_msgSend(v2, "finishEntry");
    objc_msgSend(a1[4], "writeCentralDirectory");
    *((_BYTE *)a1[4] + 72) = 1;
    v16 = a1[4];
    v17 = *((_QWORD *)v16 + 2);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3;
    v18[3] = &unk_24F39C280;
    v18[4] = v16;
    v20 = a1[6];
    v19 = a1[5];
    dispatch_async(v17, v18);

  }
}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3(id *a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  id location;

  dispatch_suspend(*((dispatch_object_t *)a1[4] + 2));
  objc_msgSend(a1[4], "p_writeChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v2);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4;
  v3[3] = &unk_24F39C390;
  objc_copyWeak(&v6, &location);
  v3[4] = a1[4];
  v5 = a1[6];
  v4 = a1[5];
  objc_msgSend(v2, "addBarrier:", v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter closeWithQueue:completion:]_block_invoke_4");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 456, 0, "invalid nil value for '%{public}s'", "strongWriteChannel");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(WeakRetained, "close");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 144);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_5;
  block[3] = &unk_24F39C280;
  block[4] = v5;
  v9 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);

}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_5(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_6;
    v6[3] = &unk_24F39BAB0;
    v3 = *(NSObject **)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    v7 = v2;
    v8 = v4;
    v5 = v2;
    dispatch_async(v3, v6);

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)writeCentralDirectory
{
  int64_t currentOffset;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
        -[TSUZipWriter writeCentralFileHeaderDataForEntry:](self, "writeCentralFileHeaderDataForEntry:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[TSUZipWriter writeEndOfCentralDirectoryDataWithOffset:size:entryCount:](self, "writeEndOfCentralDirectoryDataWithOffset:size:entryCount:", currentOffset, self->_currentOffset - currentOffset, -[NSMutableArray count](self->_entries, "count"));
}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  size_t v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  unsigned int v11;
  _DWORD *v12;
  char *v13;
  void *v14;
  int v15;
  unint64_t v16;
  int v17;
  int v18;
  char *v19;
  dispatch_data_t v20;
  _BOOL4 v22;
  const char *__src;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  __src = v6;
  v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_29);
    v7 = 0xFFFFLL;
  }
  v8 = self->_options & 1;
  v9 = v8 | ((unint64_t)objc_msgSend(v4, "size") >> 32);
  v10 = v9 != 0;
  if (v9 || self->_calculateSize)
  {
    v22 = !self->_force32BitSize;
    if (self->_force32BitSize)
      v11 = 0;
    else
      v11 = 20;
  }
  else
  {
    v22 = 0;
    v11 = 0;
  }
  v12 = malloc_type_malloc(v7 + v11 + 30, 0x52B7EA04uLL);
  v13 = (char *)v12 + 30;
  *v12 = 67324752;
  v12[1] = 20;
  *((_WORD *)v12 + 4) = 0;
  objc_msgSend(v4, "lastModificationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "tsu_DOSTime");

  HIDWORD(v16) = v15;
  LODWORD(v16) = v15;
  *(_DWORD *)((char *)v12 + 10) = v16 >> 16;
  *(_DWORD *)((char *)v12 + 14) = objc_msgSend(v4, "CRC");
  if (!v10)
  {
    *(_DWORD *)((char *)v12 + 18) = objc_msgSend(v4, "size");
LABEL_17:
    v18 = objc_msgSend(v4, "size");
    goto LABEL_18;
  }
  if (self->_force32BitSize)
    v17 = objc_msgSend(v4, "size");
  else
    v17 = -1;
  *(_DWORD *)((char *)v12 + 18) = v17;
  if (self->_force32BitSize)
    goto LABEL_17;
  v18 = -1;
LABEL_18:
  *(_DWORD *)((char *)v12 + 22) = v18;
  *((_WORD *)v12 + 13) = v7;
  *((_WORD *)v12 + 14) = v11;
  memcpy(v13, __src, v7);
  if (v22)
  {
    v19 = &v13[v7];
    *(_WORD *)v19 = TSUZip64ExtraFieldSignature;
    *((_WORD *)v19 + 1) = 16;
    *(_QWORD *)(v19 + 4) = objc_msgSend(v4, "size");
    *(_QWORD *)(v19 + 12) = objc_msgSend(v4, "size");
  }
  v20 = dispatch_data_create(v12, v7 + v11 + 30, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);

  return v20;
}

void __44__TSUZipWriter_localFileHeaderDataForEntry___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)writeCentralFileHeaderDataForEntry:(id)a3
{
  id v4;
  const char *v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  _BOOL4 v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  char *v15;
  void *v16;
  int v17;
  unint64_t v18;
  int v19;
  char *v20;
  char *v21;
  char *v22;
  dispatch_data_t v23;
  TSUZipWriter *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "name");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  v6 = strlen(v5);
  if (v6 >= 0x10000)
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_30_0);
    v6 = 0xFFFFLL;
  }
  v24 = self;
  v7 = self->_options & 2;
  v8 = v7 | ((unint64_t)objc_msgSend(v25, "size") >> 32);
  v9 = v7 | ((unint64_t)objc_msgSend(v25, "offset") >> 32);
  v10 = 4 * ((v8 | v9) != 0);
  if (v8)
    v10 = 20;
  v11 = v9 != 0;
  if (v9)
    v12 = v10 | 8;
  else
    v12 = v10;
  v13 = v6 + v12 + 46;
  v14 = (char *)malloc_type_malloc(v13, 0x6460FC59uLL);
  v15 = v14 + 46;
  *(_DWORD *)v14 = 33639248;
  *(_QWORD *)(v14 + 4) = 1310782;
  objc_msgSend(v25, "lastModificationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "tsu_DOSTime");

  HIDWORD(v18) = v17;
  LODWORD(v18) = v17;
  *((_DWORD *)v14 + 3) = v18 >> 16;
  *((_DWORD *)v14 + 4) = objc_msgSend(v25, "CRC");
  if (v8)
  {
    v19 = -1;
    *((_DWORD *)v14 + 5) = -1;
  }
  else
  {
    *((_DWORD *)v14 + 5) = objc_msgSend(v25, "size");
    v19 = objc_msgSend(v25, "size");
  }
  *((_DWORD *)v14 + 6) = v19;
  *((_WORD *)v14 + 14) = v6;
  *((_WORD *)v14 + 15) = v12;
  *((_QWORD *)v14 + 4) = 0;
  *((_WORD *)v14 + 20) = 0;
  if (v11)
  {
    *(_DWORD *)(v14 + 42) = -1;
    memcpy(v15, v5, v6);
    *(_WORD *)&v15[v6] = TSUZip64ExtraFieldSignature;
    v20 = &v15[v6 + 4];
    *(_WORD *)&v15[v6 + 2] = 0;
    v21 = &v15[v6 + 2];
    if (!v8)
      goto LABEL_20;
  }
  else
  {
    *(_DWORD *)(v14 + 42) = objc_msgSend(v25, "offset");
    memcpy(v15, v5, v6);
    if (!v8)
      goto LABEL_21;
    v20 = &v15[v6 + 4];
    *(_WORD *)&v15[v6] = TSUZip64ExtraFieldSignature;
    v21 = &v15[v6 + 2];
  }
  v22 = &v15[v6];
  *(_WORD *)v21 = 16;
  *(_QWORD *)v20 = objc_msgSend(v25, "size");
  *(_QWORD *)(v22 + 12) = objc_msgSend(v25, "size");
  if (v11)
  {
    v20 = v22 + 20;
LABEL_20:
    *(_WORD *)v21 += 8;
    *(_QWORD *)v20 = objc_msgSend(v25, "offset");
  }
LABEL_21:
  v23 = dispatch_data_create(v14, v13, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  -[TSUZipWriter writeData:](v24, "writeData:", v23);

}

void __51__TSUZipWriter_writeCentralFileHeaderDataForEntry___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

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
    -[TSUZipWriter writeZip64EndOfCentralDirectoryWithOffset:size:entryCount:](self, "writeZip64EndOfCentralDirectoryWithOffset:size:entryCount:", a3, a4, a5);
    -[TSUZipWriter writeZip64EndOfCentralDirectoryLocatorWithOffset:](self, "writeZip64EndOfCentralDirectoryLocatorWithOffset:", currentOffset);
  }
  v13 = malloc_type_malloc(0x16uLL, 0x3578717FuLL);
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
  v17 = dispatch_data_create(v13, 0x16uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  -[TSUZipWriter writeData:](self, "writeData:", v17);

}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  _QWORD *v9;
  dispatch_data_t v10;

  v9 = malloc_type_malloc(0x38uLL, 0xF4555416uLL);
  *(_DWORD *)v9 = 101075792;
  *(_QWORD *)((char *)v9 + 4) = 44;
  v9[2] = 0;
  v9[3] = a5;
  *((_DWORD *)v9 + 3) = 1310782;
  v9[4] = a5;
  v9[5] = a4;
  v9[6] = a3;
  v10 = dispatch_data_create(v9, 0x38uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  -[TSUZipWriter writeData:](self, "writeData:", v10);

}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  _DWORD *v5;
  dispatch_data_t v6;

  v5 = malloc_type_malloc(0x14uLL, 0x292E44B8uLL);
  *v5 = 117853008;
  v5[1] = 0;
  *((_QWORD *)v5 + 1) = a3;
  v5[4] = 1;
  v6 = dispatch_data_create(v5, 0x14uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  -[TSUZipWriter writeData:](self, "writeData:", v6);

}

- (void)writeData:(id)a3
{
  -[TSUZipWriter writeData:queue:completion:](self, "writeData:queue:completion:", a3, 0, 0);
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
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__TSUZipWriter_writeData_queue_completion___block_invoke;
  v14[3] = &unk_24F39C3F8;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  -[TSUZipWriter p_writeData:offset:completion:](self, "p_writeData:offset:completion:", a3, writtenOffset, v14);
  self->_writtenOffset += size;

}

void __43__TSUZipWriter_writeData_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  void (**v8)(_QWORD, _QWORD);

  v3 = a2;
  v4 = *(void (***)(_QWORD, _QWORD))(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    if (v5)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __43__TSUZipWriter_writeData_queue_completion___block_invoke_2;
      v6[3] = &unk_24F39BAB0;
      v8 = v4;
      v7 = v3;
      dispatch_async(v5, v6);

    }
    else
    {
      ((void (**)(_QWORD, id))v4)[2](v4, v3);
    }
  }

}

uint64_t __43__TSUZipWriter_writeData_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
  -[TSUZipWriter p_writeData:offset:completion:](self, "p_writeData:offset:completion:", a3, a4, 0);
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
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__TSUZipWriter_p_writeData_offset_completion___block_invoke;
  v13[3] = &unk_24F39C448;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(channelQueue, v13);

}

void __46__TSUZipWriter_p_writeData_offset_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__14;
  v9[4] = __Block_byref_object_dispose__14;
  v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_31;
  v6[3] = &unk_24F39C420;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v9;
  v6[4] = v3;
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "writeData:offset:handler:", v4, v5, v6);

  _Block_object_dispose(v9, 8);
}

void __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_31(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];

  v7 = a3;
  v8 = a4;
  if (v8 && (v9 = *(_QWORD *)(a1[6] + 8), v11 = *(_QWORD *)(v9 + 40), v10 = (id *)(v9 + 40), !v11))
  {
    objc_storeStrong(v10, a4);
    if (!a2)
      goto LABEL_11;
  }
  else if (!a2)
  {
    goto LABEL_11;
  }
  v12 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(v12 + 8) + 40))
  {
    v13 = a1[4];
    v14 = *(NSObject **)(v13 + 144);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_2;
    v16[3] = &unk_24F39B958;
    v16[4] = v13;
    v16[5] = v12;
    dispatch_async(v14, v16);
  }
  v15 = a1[5];
  if (v15)
    (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 16));
LABEL_11:

}

uint64_t __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWriteError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 748, 0, "Abstract method not overridden by %@", v7);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v12, "-[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__TSUZipWriter_archiveLength__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__TSUZipWriter_archiveLength__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 112);
  return result;
}

- (void)handleWriteError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *channelQueue;
  _QWORD block[5];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "code") != 3072
      || (objc_msgSend(v6, "domain"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0B88]),
          v7,
          (v8 & 1) == 0))
    {
      if (TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_35);
    }
    if (!self->_error)
    {
      channelQueue = self->_channelQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __33__TSUZipWriter_handleWriteError___block_invoke_2;
      block[3] = &unk_24F39B528;
      block[4] = self;
      dispatch_async(channelQueue, block);
      objc_storeStrong((id *)&self->_error, a3);
    }
  }

}

void __33__TSUZipWriter_handleWriteError___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __33__TSUZipWriter_handleWriteError___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "close");

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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__TSUZipWriter_enumerateEntriesUsingBlock___block_invoke;
  block[3] = &unk_24F39BDD0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(writeQueue, block);

}

void __43__TSUZipWriter_enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  TSUZipEntry *v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
      v8 = objc_alloc_init(TSUZipEntry);
      objc_msgSend(v7, "name", (_QWORD)v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSUZipEntry setName:](v8, "setName:", v9);

      -[TSUZipEntry name](v8, "name");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[TSUZipEntry setNameLength:](v8, "setNameLength:", (unsigned __int16)strlen((const char *)objc_msgSend(v10, "UTF8String")));

      objc_msgSend(v7, "lastModificationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSUZipEntry setLastModificationDate:](v8, "setLastModificationDate:", v11);

      -[TSUZipEntry setSize:](v8, "setSize:", objc_msgSend(v7, "size"));
      -[TSUZipEntry setCompressedSize:](v8, "setCompressedSize:", objc_msgSend(v7, "size"));
      -[TSUZipEntry setOffset:](v8, "setOffset:", objc_msgSend(v7, "offset"));
      -[TSUZipEntry setCRC:](v8, "setCRC:", objc_msgSend(v7, "CRC"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      LODWORD(v7) = v16;

      if ((_DWORD)v7)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)sortedEntriesImpl
{
  NSArray *sortedEntries;
  NSArray *v4;
  NSArray *v5;

  sortedEntries = self->_sortedEntries;
  if (!sortedEntries)
  {
    -[NSMutableArray sortedArrayUsingComparator:](self->_entries, "sortedArrayUsingComparator:", &__block_literal_global_38);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sortedEntries;
    self->_sortedEntries = v4;

    sortedEntries = self->_sortedEntries;
  }
  return sortedEntries;
}

uint64_t __33__TSUZipWriter_sortedEntriesImpl__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "offset");
  v6 = objc_msgSend(v4, "offset");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__TSUZipWriter_sortedEntries__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __29__TSUZipWriter_sortedEntries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "sortedEntriesImpl");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __24__TSUZipWriter_isClosed__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__TSUZipWriter_isClosed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
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
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  v17 = 0;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__TSUZipWriter_entryWithName___block_invoke;
  block[3] = &unk_24F39B4B0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(writeQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __30__TSUZipWriter_entryWithName___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TSUZipWriter_truncateToNumberOfEntries_completion___block_invoke;
  block[3] = &unk_24F39BDF8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(writeQueue, block);

}

uint64_t __53__TSUZipWriter_truncateToNumberOfEntries_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "truncateToNumberOfEntriesImpl:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
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
  if (-[TSUZipWriter entriesCountImpl](self, "entriesCountImpl") > a3)
  {
    -[TSUZipWriter sortedEntriesImpl](self, "sortedEntriesImpl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") > a3)
    {
      v7 = a3;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray removeObject:](self->_entries, "removeObject:", v8);
        entriesMap = self->_entriesMap;
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](entriesMap, "removeObjectForKey:", v10);

        ++v7;
      }
      while (v7 < objc_msgSend(v6, "count"));
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSUZipWriter setEntryInsertionOffsetImpl:](self, "setEntryInsertionOffsetImpl:", objc_msgSend(v11, "offset"));
    -[TSUZipWriter truncateToOffsetImpl:completion:](self, "truncateToOffsetImpl:completion:", objc_msgSend(v11, "offset"), v13);

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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TSUZipWriter_truncateToOffset_completion___block_invoke;
  block[3] = &unk_24F39BDF8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(writeQueue, block);

}

uint64_t __44__TSUZipWriter_truncateToOffset_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "truncateToOffsetImpl:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter truncateToOffsetImpl:completion:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 885, 0, "Abstract method not overridden by %@", v8);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v9 = (void *)MEMORY[0x24BDBCE88];
  v10 = *MEMORY[0x24BDBCAB0];
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v13, "-[TSUZipWriter truncateToOffsetImpl:completion:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v14, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v15);
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
