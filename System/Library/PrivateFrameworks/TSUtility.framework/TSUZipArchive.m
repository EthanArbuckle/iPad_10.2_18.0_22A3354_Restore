@implementation TSUZipArchive

- (TSUZipArchive)init
{
  TSUZipArchive *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *entries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUZipArchive;
  v2 = -[TSUZipArchive init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    entries = v2->_entries;
    v2->_entries = v3;

  }
  return v2;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[5];
  id v18;
  NSObject *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = -[TSUZipArchive archiveLength](self, "archiveLength");
  dispatch_get_global_queue(0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUZipArchive readChannel](self, "readChannel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setLowWater:", -1);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke;
    v17[3] = &unk_24D61B4D8;
    v17[4] = self;
    v18 = v11;
    v19 = v6;
    v20 = v7;
    v12 = v7;
    objc_msgSend(v18, "readFromOffset:length:queue:handler:", v8 - 22, 22, v9, v17);

    v13 = v18;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3;
    block[3] = &unk_24D61B500;
    v16 = v7;
    v14 = v7;
    dispatch_async(v6, block);
    v13 = v16;
  }

}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive readArchiveWithQueue:completion:]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 54, CFSTR("Partial read"));

  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "close");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2;
    v13[3] = &unk_24D61B4B0;
    v12 = *(NSObject **)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v14 = v8;
    dispatch_async(v12, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "readEndOfCentralDirectoryData:channel:queue:completion:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOErrorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)readEndOfCentralDirectoryData:(id)a3 channel:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_data_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  size_t size_ptr;
  void *buffer_ptr;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v17 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr == 22)
    goto LABEL_3;
  +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive readEndOfCentralDirectoryData:channel:queue:completion:]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 91, CFSTR("Wrong data size"));

  if (size_ptr >= 0x16)
  {
LABEL_3:
    if (*(_DWORD *)buffer_ptr == 101010256)
    {
      if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
      {
        v21 = CFSTR("Don't support multi-disk");
        v22 = 106;
      }
      else
      {
        if (*((unsigned __int16 *)buffer_ptr + 5) != 0xFFFFLL && *((_DWORD *)buffer_ptr + 4) != -1)
        {
          v13 = *((unsigned int *)buffer_ptr + 3);
          if ((_DWORD)v13 != -1)
          {
            -[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:queue:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:queue:completion:");
            goto LABEL_10;
          }
        }
        v21 = CFSTR("Don't support Zip 64");
        v22 = 113;
      }
    }
    else
    {
      v21 = CFSTR("Don't support end of central directory comments");
      v22 = 100;
    }
    TSULogErrorInFunction((uint64_t)"-[TSUZipArchive readEndOfCentralDirectoryData:channel:queue:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m", v22, (uint64_t)v21, v13, v14, v15, v16, v23);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__TSUZipArchive_readEndOfCentralDirectoryData_channel_queue_completion___block_invoke;
  block[3] = &unk_24D61B500;
  v25 = v12;
  dispatch_async(v11, block);

LABEL_10:
}

void __72__TSUZipArchive_readEndOfCentralDirectoryData_channel_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOErrorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(int64_t)a5 channel:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;

  v14 = a7;
  v15 = a8;
  dispatch_get_global_queue(0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = a6;
  objc_msgSend(v17, "setLowWater:", -1);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke;
  v20[3] = &unk_24D61B528;
  v20[4] = self;
  v21 = v14;
  v22 = v15;
  v23 = a3;
  v18 = v15;
  v19 = v14;
  objc_msgSend(v17, "readFromOffset:length:queue:handler:", a4, a5, v16, v20);

}

void __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:queue:completion:]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 147, CFSTR("Partial read"));

  }
  if (v8)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke_2;
    v13[3] = &unk_24D61B4B0;
    v12 = *(NSObject **)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v14 = v8;
    dispatch_async(v12, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "readCentralDirectoryData:entryCount:queue:completion:", v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

uint64_t __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  NSObject *v10;
  id v11;
  dispatch_data_t v12;
  unint64_t v13;
  _BOOL4 v14;
  id *v16;
  id v17;
  _QWORD *v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[5];
  id v23;
  size_t size_ptr;
  void *buffer_ptr;

  v10 = a5;
  v11 = a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (!a4)
    goto LABEL_7;
  v13 = 1;
  do
  {
    v14 = -[TSUZipArchive readCentralFileHeaderWithBuffer:dataSize:](self, "readCentralFileHeaderWithBuffer:dataSize:", &buffer_ptr, &size_ptr);
    if (!v14)
      break;
  }
  while (v13++ < a4);
  if (!v14)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke_2;
    block[3] = &unk_24D61B500;
    v16 = &v21;
    v21 = v11;
    v19 = v11;
    v18 = block;
  }
  else
  {
LABEL_7:
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke;
    v22[3] = &unk_24D61B4B0;
    v16 = &v23;
    v22[4] = self;
    v23 = v11;
    v17 = v11;
    v18 = v22;
  }
  dispatch_async(v10, v18);

}

uint64_t __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOErrorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4
{
  TSUZipEntry *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  TSUZipEntry *v12;
  unsigned int *v13;
  char *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;
  BOOL v18;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;

  v7 = objc_alloc_init(TSUZipEntry);
  v12 = v7;
  if (*a4 <= 0x2D)
  {
    v16 = CFSTR("Central directory too short");
    v17 = 217;
    goto LABEL_9;
  }
  v13 = (unsigned int *)*a3;
  v14 = (char *)*a3 + 46;
  v15 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v14;
  if (v15 != 33639248)
  {
    v16 = CFSTR("Central directory file header has bad signature");
    v17 = 223;
    goto LABEL_9;
  }
  if ((v13[2] & 1) != 0)
  {
    v16 = CFSTR("Encrypted files are not supported");
    v17 = 229;
    goto LABEL_9;
  }
  if (*((_WORD *)v13 + 17))
  {
    v16 = CFSTR("No multi-disk support");
    v17 = 235;
LABEL_9:
    TSULogErrorInFunction((uint64_t)"-[TSUZipArchive readCentralFileHeaderWithBuffer:dataSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m", v17, (uint64_t)v16, v8, v9, v10, v11, v27);
    goto LABEL_10;
  }
  if (*((_WORD *)v13 + 5))
  {
    v16 = CFSTR("No compression support");
    v17 = 241;
    goto LABEL_9;
  }
  -[TSUZipEntry setCRC:](v7, "setCRC:", v13[4]);
  -[TSUZipEntry setCompressedSize:](v12, "setCompressedSize:", v13[5]);
  -[TSUZipEntry setSize:](v12, "setSize:", v13[6]);
  -[TSUZipEntry setOffset:](v12, "setOffset:", *(unsigned int *)((char *)v13 + 42));
  -[TSUZipEntry setNameLength:](v12, "setNameLength:", *((unsigned __int16 *)v13 + 14));
  -[TSUZipEntry setExtraFieldLength:](v12, "setExtraFieldLength:", *((unsigned __int16 *)v13 + 15));
  if (*a4 < *((unsigned __int16 *)v13 + 14))
  {
    v16 = CFSTR("Central directory too short");
    v17 = 274;
    goto LABEL_9;
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", *a3, *((unsigned __int16 *)v13 + 14), 4);
  -[TSUZipEntry setName:](v12, "setName:", v20);
  v21 = *((unsigned __int16 *)v13 + 14);
  v22 = *a4 - v21;
  *a4 = v22;
  v23 = (char *)*a3 + v21;
  *a3 = v23;
  if (!v20)
  {
    v16 = CFSTR("Couldn't read name");
    v17 = 268;
    goto LABEL_9;
  }
  v24 = *((unsigned __int16 *)v13 + 16) + (unint64_t)*((unsigned __int16 *)v13 + 15);
  v25 = v22 >= v24;
  v26 = v22 - v24;
  if (v25)
  {
    *a4 = v26;
    *a3 = &v23[v24];
    -[TSUZipArchive addEntry:](self, "addEntry:", v12);

    v18 = 1;
    goto LABEL_11;
  }
  TSULogErrorInFunction((uint64_t)"-[TSUZipArchive readCentralFileHeaderWithBuffer:dataSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m", 290, (uint64_t)CFSTR("Central directory too short"), v8, v9, v10, v11, v27);

LABEL_10:
  v18 = 0;
LABEL_11:

  return v18;
}

- (void)addEntry:(id)a3
{
  NSMutableDictionary *entries;
  id v4;
  id v5;

  entries = self->_entries;
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](entries, "setObject:forKeyedSubscript:", v4, v5);

}

- (id)readChannelForEntry:(id)a3
{
  id v4;
  NSMutableDictionary *entries;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TSUZipReadChannel *v11;
  TSUZipReadChannel *v12;

  v4 = a3;
  entries = self->_entries;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](entries, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v12 = [TSUZipReadChannel alloc];
    -[TSUZipArchive readChannel](self, "readChannel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TSUZipReadChannel initWithEntry:archiveReadChannel:](v12, "initWithEntry:archiveReadChannel:", v4, v8);
  }
  else
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive readChannelForEntry:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 319, CFSTR("Entry isn't part of this archive"));

    v11 = 0;
  }

  return v11;
}

- (id)entryForName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_entries, "objectForKeyedSubscript:", a3);
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *entries;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__TSUZipArchive_enumerateEntriesUsingBlock___block_invoke;
  v7[3] = &unk_24D61B550;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entries, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __44__TSUZipArchive_enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)archiveLength
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive archiveLength]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 344, CFSTR("Abstract method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUZipArchive archiveLength]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (TSUReadChannel)readChannel
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive readChannel]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 349, CFSTR("Abstract method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUZipArchive readChannel]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[TSUDescription descriptionWithObject:class:](TSUDescription, "descriptionWithObject:class:", self, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUZipArchive readChannel](self, "readChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TSUObjectReferenceDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("readChannel"), v5);

  TSUCFArrayDescription((const __CFArray *)-[NSMutableDictionary allValues](self->_entries, "allValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("entries"), v6);

  objc_msgSend(v3, "descriptionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
