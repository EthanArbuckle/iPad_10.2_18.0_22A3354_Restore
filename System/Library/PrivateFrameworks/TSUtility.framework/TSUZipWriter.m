@implementation TSUZipWriter

- (TSUZipWriter)init
{
  TSUZipWriter *v2;
  uint64_t v3;
  NSMutableArray *entries;
  uint64_t v5;
  NSMutableSet *entryNames;
  dispatch_queue_t v7;
  OS_dispatch_queue *writeQueue;
  TSUZipWriter *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSUZipWriter;
  v2 = -[TSUZipWriter init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    entryNames = v2->_entryNames;
    v2->_entryNames = (NSMutableSet *)v5;

    v7 = dispatch_queue_create("TSUZipWriter.Write", 0);
    writeQueue = v2->_writeQueue;
    v2->_writeQueue = (OS_dispatch_queue *)v7;

    -[TSUZipWriter initEntryTime](v2, "initEntryTime");
    v9 = v2;
  }

  return v2;
}

- (void)beginEntryWithName:(id)a3
{
  -[TSUZipWriter beginEntryWithName:size:CRC:](self, "beginEntryWithName:size:CRC:", a3, 0, 0);
}

- (void)beginEntryWithName:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5
{
  id v8;
  NSObject *writeQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unsigned int v14;

  v8 = a3;
  writeQueue = self->_writeQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__TSUZipWriter_beginEntryWithName_size_CRC___block_invoke;
  v11[3] = &unk_24D61B8A8;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(writeQueue, v11);

}

uint64_t __44__TSUZipWriter_beginEntryWithName_size_CRC___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginEntryWithNameImpl:size:CRC:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

- (void)beginEntryWithNameImpl:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5
{
  uLong v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  TSUZipWriterEntry *v12;
  TSUZipWriterEntry *currentEntry;
  NSMutableArray *v14;
  NSMutableArray *entryDatas;
  OS_dispatch_data *localFileHeaderData;
  id v17;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  if (!self->_error)
  {
    v17 = v8;
    -[TSUZipWriter finishEntry](self, "finishEntry");
    if (-[NSMutableSet containsObject:](self->_entryNames, "containsObject:", v17))
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter beginEntryWithNameImpl:size:CRC:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 90, CFSTR("Already have an entry with name: %@"), v17);

    }
    else
    {
      v12 = objc_alloc_init(TSUZipWriterEntry);
      currentEntry = self->_currentEntry;
      self->_currentEntry = v12;

      -[TSUZipWriterEntry setName:](self->_currentEntry, "setName:", v17);
      -[TSUZipWriterEntry setSize:](self->_currentEntry, "setSize:", a4);
      -[TSUZipWriterEntry setOffset:](self->_currentEntry, "setOffset:", self->_currentOffset);
      self->_calculateSize = a4 == 0;
      self->_calculateCRC = (_DWORD)v5 == 0;
      if (!(_DWORD)v5)
        v5 = crc32(0, 0, 0);
      -[TSUZipWriterEntry setCRC:](self->_currentEntry, "setCRC:", v5);
      -[TSUZipWriter localFileHeaderDataForEntry:](self, "localFileHeaderDataForEntry:", self->_currentEntry);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_calculateSize || self->_calculateCRC)
      {
        objc_storeStrong((id *)&self->_localFileHeaderData, v9);
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        entryDatas = self->_entryDatas;
        self->_entryDatas = v14;
      }
      else
      {
        -[TSUZipWriter writeData:](self, "writeData:", v9);
        localFileHeaderData = self->_localFileHeaderData;
        self->_localFileHeaderData = 0;

        entryDatas = self->_entryDatas;
        self->_entryDatas = 0;
      }

      self->_entryDataSize = 0;
    }

    v8 = v17;
  }

}

- (void)addData:(id)a3
{
  id v4;
  NSObject *writeQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __24__TSUZipWriter_addData___block_invoke;
  v7[3] = &unk_24D61B720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(writeQueue, v7);

}

uint64_t __24__TSUZipWriter_addData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDataImpl:", *(_QWORD *)(a1 + 40));
}

- (void)addDataImpl:(id)a3
{
  NSObject *v4;
  size_t size;
  NSMutableArray *entryDatas;
  NSObject *localFileHeaderData;
  OS_dispatch_data *v8;
  NSObject *data;
  _QWORD applier[5];

  v4 = a3;
  if (self->_error)
    goto LABEL_11;
  data = v4;
  size = dispatch_data_get_size(v4);
  entryDatas = self->_entryDatas;
  if (entryDatas)
  {
    localFileHeaderData = self->_localFileHeaderData;
    if (dispatch_data_get_size(localFileHeaderData) + size + self->_entryDataSize < 0x40000)
    {
      -[NSMutableArray addObject:](entryDatas, "addObject:", data);
      self->_entryDataSize += size;
      goto LABEL_7;
    }
    -[TSUZipWriter writeData:](self, "writeData:", localFileHeaderData);
    v8 = self->_localFileHeaderData;
    self->_localFileHeaderData = 0;

    -[TSUZipWriter flushEntryData](self, "flushEntryData");
  }
  -[TSUZipWriter writeData:](self, "writeData:", data, data);
LABEL_7:
  if (self->_calculateSize)
    -[TSUZipWriterEntry setSize:](self->_currentEntry, "setSize:", -[TSUZipWriterEntry size](self->_currentEntry, "size") + size);
  v4 = data;
  if (self->_calculateCRC)
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __28__TSUZipWriter_addDataImpl___block_invoke;
    applier[3] = &unk_24D61B8D0;
    applier[4] = self;
    dispatch_data_apply(data, applier);
    v4 = data;
  }
LABEL_11:

}

uint64_t __28__TSUZipWriter_addDataImpl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, const Bytef *a4, uInt a5)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setCRC:", crc32(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "CRC"), a4, a5));
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

- (void)finishEntry
{
  TSUZipWriterEntry *currentEntry;
  void *v4;
  OS_dispatch_data *localFileHeaderData;
  NSMutableSet *entryNames;
  void *v7;
  TSUZipWriterEntry *v8;

  currentEntry = self->_currentEntry;
  if (currentEntry)
  {
    if (self->_calculateSize || self->_calculateCRC)
    {
      -[TSUZipWriter localFileHeaderDataForEntry:](self, "localFileHeaderDataForEntry:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_entryDatas)
      {
        -[TSUZipWriter writeData:](self, "writeData:", v4);
        localFileHeaderData = self->_localFileHeaderData;
        self->_localFileHeaderData = 0;

        -[TSUZipWriter flushEntryData](self, "flushEntryData");
      }
      else
      {
        -[TSUZipWriter writeData:offset:](self, "writeData:offset:", v4, -[TSUZipWriterEntry offset](self->_currentEntry, "offset"));
      }

      currentEntry = self->_currentEntry;
    }
    -[NSMutableArray addObject:](self->_entries, "addObject:", currentEntry);
    entryNames = self->_entryNames;
    -[TSUZipWriterEntry name](self->_currentEntry, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](entryNames, "addObject:", v7);

    v8 = self->_currentEntry;
    self->_currentEntry = 0;

  }
}

- (void)writeEntryWithName:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5 fromReadChannel:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *writeQueue;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  unsigned int v27;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (!v13)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter writeEntryWithName:size:CRC:fromReadChannel:completion:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 223, CFSTR("invalid nil value for '%s'"), "readChannel");

  }
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke;
  block[3] = &unk_24D61B920;
  block[4] = self;
  v23 = v12;
  v25 = v14;
  v26 = a4;
  v27 = a5;
  v24 = v13;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  dispatch_async(writeQueue, block);

}

void __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(*(id *)(a1 + 32), "beginEntryWithNameImpl:size:CRC:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72));
  v2 = dispatch_queue_create("TSUZipWriter.Copy", 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke_2;
  v4[3] = &unk_24D61B8F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v3, "readWithQueue:handler:", v2, v4);

}

void __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "handleWriteError:", a4);
  if (v10 && (v7 = *(_QWORD **)(a1 + 32), !v7[11]))
  {
    objc_msgSend(v7, "addDataImpl:", v10);
    if (!a2)
      goto LABEL_9;
  }
  else if (!a2)
  {
    goto LABEL_9;
  }
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, *(_QWORD *)(v9 + 88) == 0);
    v9 = *(_QWORD *)(a1 + 32);
  }
  dispatch_resume(*(dispatch_object_t *)(v9 + 72));
LABEL_9:

}

- (void)writeEntryWithName:(id)a3 fromReadChannel:(id)a4 completion:(id)a5
{
  -[TSUZipWriter writeEntryWithName:size:CRC:fromReadChannel:completion:](self, "writeEntryWithName:size:CRC:fromReadChannel:completion:", a3, 0, 0, a4, a5);
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
  block[3] = &unk_24D61B640;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(writeQueue, block);

}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke(id *a1)
{
  _QWORD *v2;
  id *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;

  v2 = a1[4];
  if (v2[11])
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2;
    block[3] = &unk_24D61B4B0;
    v3 = &v14;
    v4 = a1[5];
    v5 = a1[6];
    block[4] = a1[4];
    v14 = v5;
    dispatch_async(v4, block);
  }
  else
  {
    objc_msgSend(v2, "finishEntry");
    objc_msgSend(a1[4], "writeCentralDirectory");
    objc_msgSend(a1[4], "writeChannel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3;
    v9[3] = &unk_24D61B948;
    v3 = &v12;
    v12 = a1[6];
    v7 = a1[5];
    v8 = a1[4];
    v10 = v7;
    v11 = v8;
    objc_msgSend(v6, "addBarrier:", v9);

  }
}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 32);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4;
    v9 = &unk_24D61B4B0;
    v4 = v2;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v4;
    dispatch_async(v3, &v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "writeChannel", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "close");

}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)writeCentralDirectory
{
  int64_t currentOffset;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  currentOffset = self->_currentOffset;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_entries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[TSUZipWriter centralFileHeaderDataForEntry:](self, "centralFileHeaderDataForEntry:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSUZipWriter writeData:](self, "writeData:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[TSUZipWriter endOfCentralDirectoryDataWithOffset:size:](self, "endOfCentralDirectoryDataWithOffset:size:", currentOffset, self->_currentOffset - currentOffset);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUZipWriter writeData:](self, "writeData:", v10);

}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  size_t v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD *v11;
  int v12;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter localFileHeaderDataForEntry:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 312, CFSTR("Zip entry name is too long"));

  }
  v11 = malloc_type_malloc(v7 + 30, 0xEFD316C8uLL);
  *v11 = 67324752;
  v11[1] = 20;
  *((_WORD *)v11 + 4) = 0;
  *((_WORD *)v11 + 5) = self->_entryTime;
  *((_WORD *)v11 + 6) = self->_entryDate;
  *(_DWORD *)((char *)v11 + 14) = objc_msgSend(v4, "CRC");
  *(_DWORD *)((char *)v11 + 18) = objc_msgSend(v4, "size");
  v12 = objc_msgSend(v4, "size");

  *(_DWORD *)((char *)v11 + 22) = v12;
  *((_WORD *)v11 + 13) = v7;
  *((_WORD *)v11 + 14) = 0;
  memcpy((char *)v11 + 30, v6, v7);
  return dispatch_data_create(v11, v7 + 30, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
}

- (id)centralFileHeaderDataForEntry:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  size_t v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  int v12;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter centralFileHeaderDataForEntry:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 341, CFSTR("Zip entry name is too long"));

  }
  v11 = (char *)malloc_type_malloc(v7 + 46, 0x273A9A0uLL);
  *(_DWORD *)v11 = 33639248;
  *(_QWORD *)(v11 + 4) = 1310782;
  *((_WORD *)v11 + 6) = self->_entryTime;
  *((_WORD *)v11 + 7) = self->_entryDate;
  *((_DWORD *)v11 + 4) = objc_msgSend(v4, "CRC");
  *((_DWORD *)v11 + 5) = objc_msgSend(v4, "size");
  *((_DWORD *)v11 + 6) = objc_msgSend(v4, "size");
  *((_WORD *)v11 + 14) = v7;
  *(_QWORD *)(v11 + 30) = 0;
  *(_DWORD *)(v11 + 38) = 0;
  v12 = objc_msgSend(v4, "offset");

  *(_DWORD *)(v11 + 42) = v12;
  memcpy(v11 + 46, v6, v7);
  return dispatch_data_create(v11, v7 + 46, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
}

- (id)endOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4
{
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _DWORD *v13;
  unint64_t v14;
  __int16 v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  if (a3 >= 0x100000000)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter endOfCentralDirectoryDataWithOffset:size:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 374, CFSTR("Offset is too large"));

  }
  if (a4 >= 0x100000000)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter endOfCentralDirectoryDataWithOffset:size:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 375, CFSTR("Size is too large"));

  }
  v13 = malloc_type_malloc(0x16uLL, 0x776CEA2CuLL);
  v14 = -[NSMutableArray count](self->_entries, "count");
  v15 = v14;
  if (v14 >= 0x10000)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter endOfCentralDirectoryDataWithOffset:size:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 382, CFSTR("Too many entries"));

  }
  *v13 = 101010256;
  v13[1] = 0;
  *((_WORD *)v13 + 4) = v15;
  *((_WORD *)v13 + 5) = v15;
  v13[3] = a4;
  v13[4] = v5;
  *((_WORD *)v13 + 10) = 0;
  return dispatch_data_create(v13, 0x16uLL, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
}

- (void)writeData:(id)a3
{
  size_t size;
  id v6;
  void *v7;
  int64_t writtenOffset;
  OS_dispatch_queue *writeQueue;
  _QWORD v10[5];

  size = dispatch_data_get_size((dispatch_data_t)a3);
  self->_currentOffset += size;
  v6 = a3;
  -[TSUZipWriter writeChannel](self, "writeChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  writeQueue = self->_writeQueue;
  writtenOffset = self->_writtenOffset;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __26__TSUZipWriter_writeData___block_invoke;
  v10[3] = &unk_24D61B970;
  v10[4] = self;
  objc_msgSend(v7, "writeData:offset:queue:handler:", v6, writtenOffset, writeQueue, v10);

  self->_writtenOffset += size;
}

uint64_t __26__TSUZipWriter_writeData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWriteError:", a4);
}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  dispatch_suspend((dispatch_object_t)self->_writeQueue);
  -[TSUZipWriter writeChannel](self, "writeChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__TSUZipWriter_writeData_offset___block_invoke;
  v9[3] = &unk_24D61B998;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "addBarrier:", v9);

}

void __33__TSUZipWriter_writeData_offset___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "writeChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 72);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__TSUZipWriter_writeData_offset___block_invoke_2;
  v7[3] = &unk_24D61B970;
  v7[4] = v5;
  objc_msgSend(v2, "writeData:offset:queue:handler:", v3, v4, v6, v7);

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
}

uint64_t __33__TSUZipWriter_writeData_offset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWriteError:", a4);
}

- (TSURandomWriteChannel)writeChannel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipWriter writeChannel]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 430, CFSTR("Abstract method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUZipWriter writeChannel]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (unint64_t)archiveLength
{
  return self->_currentOffset;
}

- (void)handleWriteError:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSError **p_error;
  void *v11;
  id v12;

  v5 = a3;
  if (v5)
  {
    v12 = v5;
    TSULogErrorInFunction((uint64_t)"-[TSUZipWriter handleWriteError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m", 446, (uint64_t)CFSTR("Couldn't write Zip: %@"), v6, v7, v8, v9, (uint64_t)v5);
    v5 = v12;
    p_error = &self->_error;
    if (!self->_error)
    {
      -[TSUZipWriter writeChannel](self, "writeChannel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "close");

      objc_storeStrong((id *)p_error, a3);
      v5 = v12;
    }
  }

}

- (void)initEntryTime
{
  tm *v3;
  int tm_year;
  __int16 v5;
  int tm_hour;
  time_t v7;

  v7 = time(0);
  v3 = localtime(&v7);
  tm_year = v3->tm_year;
  if (tm_year <= 81)
    v5 = 512;
  else
    v5 = ((_WORD)tm_year << 9) + 24576;
  tm_hour = v3->tm_hour;
  self->_entryDate = (32 * v3->tm_mon + 32) | v3->tm_mday | v5;
  self->_entryTime = (32 * LOWORD(v3->tm_min)) | ((_WORD)tm_hour << 11) | ((unsigned __int16)v3->tm_sec >> 1);
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
  block[3] = &unk_24D61B668;
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  unsigned __int8 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
      v8 = objc_alloc_init(TSUZipEntry);
      objc_msgSend(v7, "name", (_QWORD)v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSUZipEntry setName:](v8, "setName:", v9);

      -[TSUZipEntry name](v8, "name");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[TSUZipEntry setNameLength:](v8, "setNameLength:", (unsigned __int16)strlen((const char *)objc_msgSend(v10, "UTF8String")));

      -[TSUZipEntry setSize:](v8, "setSize:", objc_msgSend(v7, "size"));
      -[TSUZipEntry setCompressedSize:](v8, "setCompressedSize:", objc_msgSend(v7, "size"));
      -[TSUZipEntry setOffset:](v8, "setOffset:", objc_msgSend(v7, "offset"));
      -[TSUZipEntry setCRC:](v8, "setCRC:", objc_msgSend(v7, "CRC"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      LODWORD(v7) = v15;

      if ((_DWORD)v7)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_entryDatas, 0);
  objc_storeStrong((id *)&self->_localFileHeaderData, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_entryNames, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
