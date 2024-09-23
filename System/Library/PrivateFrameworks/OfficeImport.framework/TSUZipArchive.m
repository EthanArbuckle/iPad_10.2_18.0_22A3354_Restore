@implementation TSUZipArchive

- (TSUZipArchive)init
{
  return -[TSUZipArchive initWithOptions:](self, "initWithOptions:", 0);
}

- (TSUZipArchive)initWithOptions:(unint64_t)a3
{
  TSUZipArchive *v4;
  TSUZipArchive *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *entriesMap;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *entries;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSUZipArchive;
  v4 = -[TSUZipArchive init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    entries = v5->_entries;
    v5->_entries = v8;

  }
  return v5;
}

- (unint64_t)entriesCount
{
  return -[NSMutableOrderedSet count](self->_entries, "count");
}

- (BOOL)hasNonEmptyEntries
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__TSUZipArchive_hasNonEmptyEntries__block_invoke;
  v4[3] = &unk_24F39B5D8;
  v4[4] = &v5;
  -[TSUZipArchive enumerateEntriesUsingBlock:](self, "enumerateEntriesUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __35__TSUZipArchive_hasNonEmptyEntries__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "size");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  _QWORD aBlock[4];
  _QWORD v22[2];
  NSObject *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = -[TSUZipArchive archiveLength](self, "archiveLength");
  v9 = -[TSUZipArchive newArchiveReadChannel](self, "newArchiveReadChannel");
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke;
    aBlock[3] = &unk_24F39B628;
    v12 = (id *)v22;
    v13 = v9;
    v22[0] = v13;
    v22[1] = self;
    v23 = v6;
    v24 = v7;
    v14 = _Block_copy(aBlock);
    if ((self->_options & 8) != 0)
    {
      -[TSUZipArchive readLocalFileHeaderEntriesFromChannel:offset:previousEntry:seekAttempts:seekForward:completion:](self, "readLocalFileHeaderEntriesFromChannel:offset:previousEntry:seekAttempts:seekForward:completion:", v13, 0, 0, 0, 0, v14);
    }
    else
    {
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3;
      v17[3] = &unk_24F39B698;
      v17[4] = self;
      v20 = v8 - 22;
      v18 = v13;
      v19 = v14;
      +[TSUIOUtils readAllFromChannel:offset:length:completion:](TSUIOUtils, "readAllFromChannel:offset:length:completion:", v18, v8 - 22, 22, v17);

    }
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_6;
    v15[3] = &unk_24F39B6C0;
    v12 = &v16;
    v16 = v7;
    dispatch_async(v6, v15);
  }

}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  _BYTE *v5;
  NSObject *v6;
  id v7;
  id v8;
  _BYTE *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "close");
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(_BYTE **)(a1 + 40);
    if ((v5[8] & 1) != 0)
    {
      objc_msgSend(v5, "collapseCommonRootDirectory");
      v5 = *(_BYTE **)(a1 + 40);
    }
    v4 = v5;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2;
  block[3] = &unk_24F39B600;
  v6 = *(NSObject **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v12 = v3;
  v13 = v7;
  v11 = v4;
  v8 = v3;
  v9 = v4;
  dispatch_async(v6, block);

}

uint64_t __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    v7 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_4;
    v10[3] = &unk_24F39B670;
    v10[4] = v7;
    v11 = v6;
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v12 = v8;
    v13 = v9;
    objc_msgSend(v7, "readEndOfCentralDirectoryData:eocdOffset:channel:completion:", a2, v5, v11, v10);

  }
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = v3;
  v10 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) & 4) != 0
    && (v5 = objc_msgSend(v3, "code"), v4 = v10, v5 == 259)
    && (objc_msgSend(v10, "domain"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0B88]),
        v6,
        v4 = v10,
        v7))
  {
    objc_msgSend(v10, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TSUZipArchiveErrorDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_20);
      objc_msgSend(*(id *)(a1 + 32), "readLocalFileHeaderEntriesFromChannel:offset:previousEntry:seekAttempts:seekForward:completion:", *(_QWORD *)(a1 + 40), 0, 0, 0, 0, *(_QWORD *)(a1 + 48));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    if (!v4)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 56);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_5()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  dispatch_data_t v12;
  void *v13;
  void *v14;
  const __CFString **v15;
  const __CFString **v16;
  void *v17;
  void *v18;
  void *v19;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x15)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v28 = CFSTR("TSUZipArchiveErrorDescription");
    v29[0] = CFSTR("Wrong data size for TSUZipEndOfCentralDirectoryRecord");
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = (const __CFString **)v29;
    v16 = &v28;
    goto LABEL_8;
  }
  if (*(_DWORD *)buffer_ptr != 101010256)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v26 = CFSTR("TSUZipArchiveErrorDescription");
    v27 = CFSTR("Don't support end of central directory comments");
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = &v27;
    v16 = &v26;
LABEL_8:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v11[2](v11, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v19);

    }
    goto LABEL_11;
  }
  if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v24 = CFSTR("TSUZipArchiveErrorDescription");
    v25 = CFSTR("Don't support multi-disk");
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = &v25;
    v16 = &v24;
    goto LABEL_8;
  }
  if (*((unsigned __int16 *)buffer_ptr + 5) == 0xFFFFLL
    || *((_DWORD *)buffer_ptr + 4) == -1
    || *((_DWORD *)buffer_ptr + 3) == -1)
  {
    -[TSUZipArchive readZip64EndOfCentralDirectoryLocatorWithChannel:eocdOffset:completion:](self, "readZip64EndOfCentralDirectoryLocatorWithChannel:eocdOffset:completion:", v10, a4, v11);
  }
  else
  {
    -[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:completion:");
  }
LABEL_11:

}

- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if ((unint64_t)a4 > 0x13)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __88__TSUZipArchive_readZip64EndOfCentralDirectoryLocatorWithChannel_eocdOffset_completion___block_invoke;
    v13[3] = &unk_24F39B6E8;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    +[TSUIOUtils readAllFromChannel:offset:length:completion:](TSUIOUtils, "readAllFromChannel:offset:length:completion:", v14, a4 - 20, 20, v13);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = CFSTR("TSUZipArchiveErrorDescription");
    v17[0] = CFSTR("File isn't long enough for Zip64 locator");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v12);

  }
}

uint64_t __88__TSUZipArchive_readZip64EndOfCentralDirectoryLocatorWithChannel_eocdOffset_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "readZip64EndOfCentralDirectoryLocatorData:channel:completion:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  dispatch_data_t v10;
  void *v11;
  void *v12;
  const __CFString **v13;
  const __CFString **v14;
  void *v15;
  void *v16;
  void *v17;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x13)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v24 = CFSTR("TSUZipArchiveErrorDescription");
    v25[0] = CFSTR("Wrong data size for TSUZip64EndOfCentralDirectoryLocatorRecord");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = (const __CFString **)v25;
    v14 = &v24;
  }
  else if (*(_DWORD *)buffer_ptr == 117853008)
  {
    if (!*((_DWORD *)buffer_ptr + 1) && *((_DWORD *)buffer_ptr + 4) == 1)
    {
      -[TSUZipArchive readZip64EndOfCentralDirectoryWithChannel:offset:completion:](self, "readZip64EndOfCentralDirectoryWithChannel:offset:completion:", v8, *((_QWORD *)buffer_ptr + 1), v9);
      goto LABEL_12;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("TSUZipArchiveErrorDescription");
    v21 = CFSTR("Multi-disk is not supported");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = &v21;
    v14 = &v20;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("TSUZipArchiveErrorDescription");
    v23 = CFSTR("Zip64 end of central directory locator record signature not found");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = &v23;
    v14 = &v22;
  }
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v9[2](v9, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

  }
LABEL_12:

}

- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__TSUZipArchive_readZip64EndOfCentralDirectoryWithChannel_offset_completion___block_invoke;
  v12[3] = &unk_24F39B6E8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  +[TSUIOUtils readAllFromChannel:offset:length:completion:](TSUIOUtils, "readAllFromChannel:offset:length:completion:", v11, a4, 56, v12);

}

uint64_t __77__TSUZipArchive_readZip64EndOfCentralDirectoryWithChannel_offset_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "readZip64EndOfCentralDirectoryData:channel:completion:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  dispatch_data_t v10;
  void *v11;
  void *v12;
  const __CFString **v13;
  const __CFString **v14;
  void *v15;
  void *v16;
  void *v17;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x37)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v24 = CFSTR("TSUZipArchiveErrorDescription");
    v25[0] = CFSTR("Wrong data size for TSUZip64EndOfCentralDirectoryRecord");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = (const __CFString **)v25;
    v14 = &v24;
  }
  else if (*(_DWORD *)buffer_ptr == 101075792)
  {
    if (!*((_DWORD *)buffer_ptr + 4) && !*((_DWORD *)buffer_ptr + 5))
    {
      -[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:completion:", *((_QWORD *)buffer_ptr + 4), *((_QWORD *)buffer_ptr + 6), *((_QWORD *)buffer_ptr + 5), v8, v9);
      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("TSUZipArchiveErrorDescription");
    v21 = CFSTR("Multi-disk is not supported");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = &v21;
    v14 = &v20;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("TSUZipArchiveErrorDescription");
    v23 = CFSTR("Zip64 end of central directory record signature not found");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = &v23;
    v14 = &v22;
  }
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v9[2](v9, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

  }
LABEL_11:

}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;

  v12 = a7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_completion___block_invoke;
  v14[3] = &unk_24F39B710;
  v15 = v12;
  v16 = a3;
  v14[4] = self;
  v13 = v12;
  +[TSUIOUtils readAllFromChannel:offset:length:completion:](TSUIOUtils, "readAllFromChannel:offset:length:completion:", a6, a4, a5, v14);

}

uint64_t __83__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "readCentralDirectoryData:entryCount:completion:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, id);
  dispatch_data_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  _BOOL4 v13;
  id v15;
  size_t size_ptr;
  void *buffer_ptr;

  v8 = (void (**)(id, id))a5;
  size_ptr = 0;
  buffer_ptr = 0;
  v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v10 = 0;
  if (!a4)
    goto LABEL_7;
  v11 = 1;
  do
  {
    v12 = v10;
    v15 = v10;
    v13 = -[TSUZipArchive readCentralFileHeaderWithBuffer:dataSize:error:](self, "readCentralFileHeaderWithBuffer:dataSize:error:", &buffer_ptr, &size_ptr, &v15);
    v10 = v15;

    if (!v13)
      break;
  }
  while (v11++ < a4);
  if (!v13)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8[2](v8, v10);
  }
  else
  {
LABEL_7:
    v8[2](v8, 0);
  }

}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5
{
  TSUZipEntry *v9;
  TSUZipEntry *v10;
  unsigned __int16 *v11;
  char *v12;
  int v13;
  void *v14;
  void *v15;
  const __CFString **v16;
  const __CFString **v17;
  void *v18;
  id v19;
  BOOL v20;
  int v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  id v27;
  _BOOL4 v28;
  id v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  id v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc_init(TSUZipEntry);
  v10 = v9;
  if (*a4 <= 0x2D)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v42 = CFSTR("TSUZipArchiveErrorDescription");
    v43[0] = CFSTR("Central directory too short");
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = (const __CFString **)v43;
    v17 = &v42;
    goto LABEL_9;
  }
  v11 = (unsigned __int16 *)*a3;
  v12 = (char *)*a3 + 46;
  v13 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v12;
  if (v13 != 33639248)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v40 = CFSTR("TSUZipArchiveErrorDescription");
    v41 = CFSTR("Central directory file header has bad signature");
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = &v41;
    v17 = &v40;
    goto LABEL_9;
  }
  if ((v11[4] & 1) != 0)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v38 = CFSTR("TSUZipArchiveErrorDescription");
    v39 = CFSTR("Encrypted files are not supported");
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = &v39;
    v17 = &v38;
    goto LABEL_9;
  }
  if (v11[17])
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v36 = CFSTR("TSUZipArchiveErrorDescription");
    v37 = CFSTR("No multi-disk support");
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = &v37;
    v17 = &v36;
LABEL_9:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v22 = v11[5];
  if (v11[5])
    v23 = v22 == (unsigned __int16)TSUZipDeflateCompressionMethod;
  else
    v23 = 1;
  if (!v23)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v34 = CFSTR("TSUZipArchiveErrorDescription");
    v35 = CFSTR("Unsupported compression method");
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = &v35;
    v17 = &v34;
    goto LABEL_9;
  }
  -[TSUZipEntry setCompressed:](v9, "setCompressed:", v22 == (unsigned __int16)TSUZipDeflateCompressionMethod);
  objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "tsu_initWithDOSTime:", v11[7] | ((unint64_t)v11[6] << 16));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSUZipEntry setLastModificationDate:](v10, "setLastModificationDate:", v24);

  -[TSUZipEntry setCRC:](v10, "setCRC:", *((unsigned int *)v11 + 4));
  -[TSUZipEntry setCompressedSize:](v10, "setCompressedSize:", *((unsigned int *)v11 + 5));
  -[TSUZipEntry setSize:](v10, "setSize:", *((unsigned int *)v11 + 6));
  -[TSUZipEntry setOffset:](v10, "setOffset:", *(unsigned int *)(v11 + 21));
  -[TSUZipEntry setNameLength:](v10, "setNameLength:", v11[14]);
  -[TSUZipEntry setExtraFieldsLength:](v10, "setExtraFieldsLength:", v11[15]);
  v25 = v11[14];
  v33 = 0;
  v26 = -[TSUZipArchive readFilenameFromBuffer:nameLength:entry:dataSize:error:](self, "readFilenameFromBuffer:nameLength:entry:dataSize:error:", a3, v25, v10, a4, &v33);
  v27 = v33;
  v19 = v27;
  if (v26)
  {
    if (!v11[15]
      || (v32 = v27,
          v28 = -[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", a3), v29 = v32, v19, v19 = v29, v28))
    {
      if (!v11[16]
        || (v30 = -[TSUZipArchive readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:](self, "readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:", a3), v31 = v19, v19, v19 = v31, v30))
      {
        -[TSUZipArchive addEntry:](self, "addEntry:", v10);
        v20 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  if (a5)
  {
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a5 = v19;
  }
  else
  {
    v20 = 0;
  }
LABEL_13:

  return v20;
}

- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v9 = a4;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  if (*a6 < v9)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("TSUZipArchiveErrorDescription");
    v21 = CFSTR("Central directory too short");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  v15 = v9;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", *a3, v9, 4);
  objc_msgSend(v11, "setName:", v13);
  *a6 -= v15;
  *a3 = (char *)*a3 + v15;
  v16 = v13 != 0;
  if (!v13)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("TSUZipArchiveErrorDescription");
    v23[0] = CFSTR("Couldn't read name");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v14 = 0;
LABEL_7:

  if (a7 && !v16)
    *a7 = objc_retainAutorelease(v14);

  return v16;
}

- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  char *v16;
  BOOL v17;
  char *v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v9 = a4;
  v33[1] = *MEMORY[0x24BDAC8D0];
  v29 = a5;
  if (*a6 < v9)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v30 = CFSTR("TSUZipArchiveErrorDescription");
    v31 = CFSTR("Central directory too short");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (!a7)
      goto LABEL_18;
    goto LABEL_16;
  }
  v14 = 0;
  v16 = (char *)*a3 + v9;
  v17 = 1;
  while (1)
  {
    v18 = (char *)*a3;
    v19 = (char *)*a3 + 4;
    v15 = v19 > v16;
    if (v19 > v16)
      break;
    v20 = *a6 - 4;
    *a6 = v20;
    *a3 = v19;
    v21 = *((unsigned __int16 *)v18 + 1);
    if (&v19[v21] > v16)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v32 = CFSTR("TSUZipArchiveErrorDescription");
      v33[0] = CFSTR("Invalid Zip entry extra field length");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v25;
LABEL_12:
      v18 = (char *)*a3;
      break;
    }
    if (*(unsigned __int16 *)v18 == (unsigned __int16)TSUZip64ExtraFieldSignature)
    {
      v17 = -[TSUZipArchive readZip64ExtraFieldFromBuffer:dataLength:entry:error:](self, "readZip64ExtraFieldFromBuffer:dataLength:entry:error:");
      v22 = v14;

      v21 = *((unsigned __int16 *)v18 + 1);
      v20 = *a6;
      v14 = v22;
      v19 = (char *)*a3;
    }
    *a6 = v20 - v21;
    *a3 = &v19[v21];
    if (!v17)
      goto LABEL_12;
  }
  if (v18 != v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 453, 0, "Unexpected buffer position while reading extra fields.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (a7)
  {
LABEL_16:
    if (!v15)
      *a7 = objc_retainAutorelease(v14);
  }
LABEL_18:

  return v15;
}

- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6
{
  unsigned int v7;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  const __CFString **v17;
  const __CFString **v18;
  void *v19;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v7 = a4;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (objc_msgSend(v9, "size") == 0xFFFFFFFFLL)
  {
    v10 = v7 >= 8;
    LOWORD(v7) = v7 - 8;
    if (!v10)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v25 = CFSTR("TSUZipArchiveErrorDescription");
      v26[0] = CFSTR("Not enough room for Zip64 uncompressed size");
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = (const __CFString **)v26;
      v18 = &v25;
      goto LABEL_14;
    }
    v11 = *(_QWORD *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend(v9, "setSize:", v11);
  }
  if (objc_msgSend(v9, "compressedSize") == 0xFFFFFFFFLL)
  {
    if ((unsigned __int16)v7 < 8u)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v23 = CFSTR("TSUZipArchiveErrorDescription");
      v24 = CFSTR("Not enough room for Zip64 compressed size");
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = &v24;
      v18 = &v23;
      goto LABEL_14;
    }
    v12 = *(_QWORD *)a3;
    a3 = (char *)a3 + 8;
    objc_msgSend(v9, "setCompressedSize:", v12);
    LOWORD(v7) = v7 - 8;
  }
  if (objc_msgSend(v9, "offset") != 0xFFFFFFFFLL)
  {
LABEL_11:
    v13 = 0;
    v14 = 1;
    goto LABEL_17;
  }
  if ((unsigned __int16)v7 >= 8u)
  {
    objc_msgSend(v9, "setOffset:", *(_QWORD *)a3);
    goto LABEL_11;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  v21 = CFSTR("TSUZipArchiveErrorDescription");
  v22 = CFSTR("Not enough room for Zip64 offset");
  v16 = (void *)MEMORY[0x24BDBCE70];
  v17 = &v22;
  v18 = &v21;
LABEL_14:
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v19);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    v13 = objc_retainAutorelease(v13);
    v14 = 0;
    *a6 = v13;
  }
  else
  {
    v14 = 0;
  }
LABEL_17:

  return v14;
}

- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9;
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v9 = a4;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = *a6;
  v13 = v9;
  if (*a6 < v9)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v18 = CFSTR("TSUZipArchiveErrorDescription");
    v19[0] = CFSTR("Central directory too short");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (a7)
    {
      v14 = objc_retainAutorelease(v14);
      *a7 = v14;
    }
  }
  else
  {
    v14 = 0;
    *a6 = v12 - v13;
    *a3 = (char *)*a3 + v13;
  }

  return v12 >= v13;
}

- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  unsigned int v25;
  BOOL v26;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke;
  v20[3] = &unk_24F39B7C0;
  v23 = v16;
  v24 = a4;
  v20[4] = self;
  v21 = v14;
  v26 = a7;
  v25 = a6;
  v22 = v15;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  +[TSUIOUtils readAllFromChannel:offset:length:completion:](TSUIOUtils, "readAllFromChannel:offset:length:completion:", v19, a4, 30, v20);

}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  int v12;
  char v13;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_2;
    v8[3] = &unk_24F39B798;
    v8[4] = v6;
    v9 = *(id *)(a1 + 48);
    v13 = *(_BYTE *)(a1 + 76);
    v12 = *(_DWORD *)(a1 + 72);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v6, "readLocalFileHeaderData:atOffset:channel:completion:", a2, v5, v7, v8);

  }
}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  void (*v8)(void);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v29 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v29)
    {
      objc_msgSend(*(id *)(a1 + 32), "addEntry:");
      v9 = *(void **)(a1 + 40);
      if (v9 && !*(_BYTE *)(a1 + 68) && *(_DWORD *)(a1 + 64))
        objc_msgSend(v9, "setCompressedSize:", objc_msgSend(*(id *)(a1 + 40), "compressedSize") - *(unsigned int *)(a1 + 64));
      v10 = objc_msgSend(v29, "offset");
      v11 = objc_msgSend(v29, "fileHeaderLength") + v10;
      v12 = v11 + objc_msgSend(v29, "compressedSize");
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      v16 = v29;
      v17 = 0;
      v18 = 0;
      goto LABEL_10;
    }
    if ((a4 & 1) != 0)
    {
LABEL_37:
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_3;
    }
    v19 = *(unsigned int *)(a1 + 64);
    if (*(_BYTE *)(a1 + 68))
    {
      if ((_DWORD)v19)
      {
LABEL_23:
        v22 = 1;
        v21 = 100;
        goto LABEL_24;
      }
LABEL_20:
      if (TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_60);
      LODWORD(v19) = 0;
      goto LABEL_23;
    }
    v20 = objc_msgSend(*(id *)(a1 + 40), "compressedSize");
    if (v20 >= 0x64)
      v21 = 100;
    else
      v21 = v20;
    if (v21 == v19)
      goto LABEL_20;
    if ((_DWORD)v19)
    {
      v22 = 0;
LABEL_24:
      if (v21 > v19)
      {
        v23 = (v19 + 1);
        if (v22)
        {
          v24 = objc_msgSend(*(id *)(a1 + 40), "offset");
          v25 = objc_msgSend(*(id *)(a1 + 40), "fileHeaderLength");
          v12 = v24 + v23 + v25 + objc_msgSend(*(id *)(a1 + 40), "compressedSize");
          v18 = 1;
LABEL_33:
          v13 = *(void **)(a1 + 32);
          v16 = *(id *)(a1 + 40);
          v14 = *(_QWORD *)(a1 + 48);
          v15 = *(_QWORD *)(a1 + 56);
          v17 = v23;
LABEL_10:
          objc_msgSend(v13, "readLocalFileHeaderEntriesFromChannel:offset:previousEntry:seekAttempts:seekForward:completion:", v14, v12, v16, v17, v18, v15);
          goto LABEL_11;
        }
LABEL_32:
        v26 = objc_msgSend(*(id *)(a1 + 40), "offset");
        v27 = objc_msgSend(*(id *)(a1 + 40), "fileHeaderLength");
        v28 = objc_msgSend(*(id *)(a1 + 40), "compressedSize");
        v18 = 0;
        v12 = v26 - v23 + v27 + v28;
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    if (TSUDefaultCat_init_token == -1)
    {
      if (v21)
      {
LABEL_31:
        v23 = 1;
        goto LABEL_32;
      }
    }
    else
    {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_61);
      if (v21)
        goto LABEL_31;
    }
LABEL_35:
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_62);
    goto LABEL_37;
  }
  v8 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_3:
  v8();
LABEL_11:

}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_5()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  dispatch_data_t v12;
  unsigned __int16 *v13;
  __int16 v14;
  BOOL v15;
  TSUZipEntry *v16;
  void *v17;
  unint64_t v18;
  int64_t v19;
  TSUZipEntry *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  const __CFString **v24;
  const __CFString **v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString **v29;
  const __CFString **v30;
  void *v31;
  _QWORD v32[5];
  TSUZipEntry *v33;
  id v34;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  size_ptr = 0;
  buffer_ptr = 0;
  v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x1D)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v45 = CFSTR("TSUZipArchiveErrorDescription");
    v46[0] = CFSTR("Wrong data size for TSUZipLocalFileHeaderRecord");
    v22 = (void *)MEMORY[0x24BDBCE70];
    v23 = 1;
    v24 = (const __CFString **)v46;
    v25 = &v45;
    goto LABEL_13;
  }
  v13 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    v23 = *(_DWORD *)buffer_ptr == 33639248;
    v21 = (void *)MEMORY[0x24BDD1540];
    v43 = CFSTR("TSUZipArchiveErrorDescription");
    v44 = CFSTR("Local file header has bad signature");
    v22 = (void *)MEMORY[0x24BDBCE70];
    v24 = &v44;
    v25 = &v43;
LABEL_13:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v26);
    v20 = (TSUZipEntry *)objc_claimAutoreleasedReturnValue();

    if (-[NSMutableOrderedSet count](self->_entries, "count"))
    {
      (*((void (**)(id, _QWORD, _QWORD, _BOOL8))v11 + 2))(v11, 0, 0, v23);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v14 = *((_WORD *)buffer_ptr + 3);
  if ((v14 & 1) != 0)
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v41 = CFSTR("TSUZipArchiveErrorDescription");
    v42 = CFSTR("Encrypted files are not supported");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = &v42;
    v30 = &v41;
  }
  else if ((v14 & 8) != 0)
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v39 = CFSTR("TSUZipArchiveErrorDescription");
    v40 = CFSTR("Local file header does not have the entry CRC and size");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = &v40;
    v30 = &v39;
  }
  else
  {
    if (*((_WORD *)buffer_ptr + 4))
      v15 = *((unsigned __int16 *)buffer_ptr + 4) == (unsigned __int16)TSUZipDeflateCompressionMethod;
    else
      v15 = 1;
    if (v15)
    {
      v16 = objc_alloc_init(TSUZipEntry);
      -[TSUZipEntry setCompressed:](v16, "setCompressed:", v13[4] == (unsigned __int16)TSUZipDeflateCompressionMethod);
      objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "tsu_initWithDOSTime:", v13[6] | ((unint64_t)v13[5] << 16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSUZipEntry setLastModificationDate:](v16, "setLastModificationDate:", v17);

      -[TSUZipEntry setCRC:](v16, "setCRC:", *(unsigned int *)(v13 + 7));
      -[TSUZipEntry setCompressedSize:](v16, "setCompressedSize:", *(unsigned int *)(v13 + 9));
      -[TSUZipEntry setSize:](v16, "setSize:", *(unsigned int *)(v13 + 11));
      -[TSUZipEntry setOffset:](v16, "setOffset:", a4);
      -[TSUZipEntry setNameLength:](v16, "setNameLength:", v13[13]);
      -[TSUZipEntry setExtraFieldsLength:](v16, "setExtraFieldsLength:", v13[14]);
      v18 = v13[14] + (unint64_t)v13[13];
      -[TSUZipEntry setFileHeaderLength:](v16, "setFileHeaderLength:", v18 + 30);
      v19 = a4 + 30;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __69__TSUZipArchive_readLocalFileHeaderData_atOffset_channel_completion___block_invoke;
      v32[3] = &unk_24F39B6E8;
      v32[4] = self;
      v33 = v16;
      v34 = v11;
      v20 = v16;
      +[TSUIOUtils readAllFromChannel:offset:length:completion:](TSUIOUtils, "readAllFromChannel:offset:length:completion:", v10, v19, v18, v32);

      goto LABEL_21;
    }
    v27 = (void *)MEMORY[0x24BDD1540];
    v37 = CFSTR("TSUZipArchiveErrorDescription");
    v38 = CFSTR("Unsupported compression method");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = &v38;
    v30 = &v37;
  }
  objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v31);
  v20 = (TSUZipEntry *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    v20 = (TSUZipEntry *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, _QWORD, TSUZipEntry *, _QWORD))v11 + 2))(v11, 0, v20, 0);
LABEL_21:

}

void __69__TSUZipArchive_readLocalFileHeaderData_atOffset_channel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6
    || (v7 = *(void **)(a1 + 32),
        v8 = *(_QWORD *)(a1 + 40),
        v15 = 0,
        v9 = objc_msgSend(v7, "readLocalFileHeaderFilenameAndExtraFieldsData:forEntry:error:", v5, v8, &v15),
        v6 = v15,
        !v9))
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "offset");
    v11 = objc_msgSend(*(id *)(a1 + 40), "fileHeaderLength") + v10;
    v12 = objc_msgSend(*(id *)(a1 + 40), "compressedSize");
    v13 = *(_QWORD *)(a1 + 32);
    if (v11 + v12 > *(_QWORD *)(v13 + 32))
      *(_QWORD *)(v13 + 32) = v11 + v12;
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v14();

}

- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  id v8;
  dispatch_data_t v9;
  size_t v10;
  unsigned int v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  _BOOL4 v16;
  id v18;
  id v19;
  size_t size_ptr;
  void *buffer_ptr;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  size_ptr = 0;
  buffer_ptr = 0;
  v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v10 = size_ptr;
  v11 = objc_msgSend(v8, "nameLength");
  if (v10 >= objc_msgSend(v8, "extraFieldsLength") + (unint64_t)v11)
  {
    v19 = 0;
    v16 = -[TSUZipArchive readFilenameFromBuffer:nameLength:entry:dataSize:error:](self, "readFilenameFromBuffer:nameLength:entry:dataSize:error:", &buffer_ptr, objc_msgSend(v8, "nameLength"), v8, &size_ptr, &v19);
    v13 = v19;
    if (!v16)
    {
      v15 = 0;
      if (!a5)
        goto LABEL_11;
      goto LABEL_9;
    }
    if (!objc_msgSend(v8, "extraFieldsLength"))
    {
      v15 = 1;
      goto LABEL_11;
    }
    v18 = v13;
    v15 = -[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", &buffer_ptr, objc_msgSend(v8, "extraFieldsLength"), v8, &size_ptr, &v18);
    v14 = v18;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("TSUZipArchiveErrorDescription");
    v23[0] = CFSTR("Wrong data size for TSUZipLocalFileHeaderRecord filename and extra fields");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }

  v13 = v14;
  if (!a5)
    goto LABEL_11;
LABEL_9:
  if (!v15)
  {
    v13 = objc_retainAutorelease(v13);
    v15 = 0;
    *a5 = v13;
  }
LABEL_11:

  return v15;
}

- (void)addEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSUZipArchive normalizeEntryName:](self, "normalizeEntryName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesMap, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_72);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entriesMap, "setObject:forKeyedSubscript:", v8, v6);
      -[NSMutableOrderedSet addObject:](self->_entries, "addObject:", v8);
    }

    v4 = v8;
  }

}

void __26__TSUZipArchive_addEntry___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (id)readChannelForEntry:(id)a3
{
  return -[TSUZipArchive readChannelForEntry:validateCRC:](self, "readChannelForEntry:validateCRC:", a3, 1);
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned int v7;
  TSUZipReadChannel *v8;
  TSUBufferedReadChannel *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v4 = a4;
  v6 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_entries, "containsObject:", v6))
  {
    v7 = objc_msgSend(v6, "isCompressed") ^ 1;
    v8 = -[TSUZipReadChannel initWithEntry:archive:validateCRC:]([TSUZipReadChannel alloc], "initWithEntry:archive:validateCRC:", v6, self, v4 & v7);
    if ((v7 & 1) == 0)
    {
      v9 = [TSUBufferedReadChannel alloc];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __49__TSUZipArchive_readChannelForEntry_validateCRC___block_invoke;
      v14[3] = &unk_24F39B808;
      v15 = v6;
      v16 = v4;
      v10 = -[TSUBufferedReadChannel initWithReadChannel:blockInfos:streamReadChannelBlock:](v9, "initWithReadChannel:blockInfos:streamReadChannelBlock:", v8, 0, v14);

      v8 = (TSUZipReadChannel *)v10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive readChannelForEntry:validateCRC:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 741, 0, "Entry isn't part of this archive");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v8 = 0;
  }

  return v8;
}

OITSUZipInflateReadChannel *__49__TSUZipArchive_readChannelForEntry_validateCRC___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  OITSUZipInflateReadChannel *v4;
  OITSUZipInflateReadChannel *v5;

  v3 = a2;
  v4 = [OITSUZipInflateReadChannel alloc];
  objc_msgSend(*(id *)(a1 + 32), "size");
  v5 = -[OITSUZipInflateReadChannel initWithReadChannel:uncompressedSize:CRC:validateCRC:](v4, "initWithReadChannel:uncompressedSize:CRC:validateCRC:", v3, objc_msgSend(*(id *)(a1 + 32), "size"), objc_msgSend(*(id *)(a1 + 32), "CRC"), *(unsigned __int8 *)(a1 + 40));

  return v5;
}

- (id)streamReadChannelForEntry:(id)a3
{
  return -[TSUZipArchive streamReadChannelForEntry:validateCRC:](self, "streamReadChannelForEntry:validateCRC:", a3, 1);
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  TSUZipReadChannel *v8;
  OITSUZipInflateReadChannel *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_entries, "containsObject:", v6))
  {
    v7 = objc_msgSend(v6, "isCompressed") ^ 1;
    v8 = -[TSUZipReadChannel initWithEntry:archive:validateCRC:]([TSUZipReadChannel alloc], "initWithEntry:archive:validateCRC:", v6, self, v4 & v7);
    if ((v7 & 1) == 0)
    {
      v9 = [OITSUZipInflateReadChannel alloc];
      objc_msgSend(v6, "size");
      v10 = -[OITSUZipInflateReadChannel initWithReadChannel:uncompressedSize:CRC:validateCRC:](v9, "initWithReadChannel:uncompressedSize:CRC:validateCRC:", v8, objc_msgSend(v6, "size"), objc_msgSend(v6, "CRC"), v4);

      v8 = (TSUZipReadChannel *)v10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive streamReadChannelForEntry:validateCRC:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 764, 0, "Entry isn't part of this archive");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v8 = 0;
  }

  return v8;
}

- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return +[TSUContainedZipArchive zipArchiveFromEntry:zipArchive:options:error:](TSUContainedZipArchive, "zipArchiveFromEntry:zipArchive:options:error:", a3, self, a4, a5);
}

- (id)normalizeEntryName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if ((self->_options & 2) != 0)
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "precomposedStringWithCanonicalMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)entryForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[TSUZipArchive normalizeEntryName:](self, "normalizeEntryName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_entriesMap, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_entries;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "collapsedName", (_QWORD)v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v4[2](v4, v11, v10, &v17);
      }
      else
      {
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v12, v10, &v17);

      }
      if (v17)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)collapseCommonRootDirectory
{
  void *v3;
  NSMutableDictionary *entriesMap;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  _QWORD v14[4];
  NSMutableDictionary *v15;
  TSUZipArchive *v16;
  uint64_t v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  entriesMap = self->_entriesMap;
  v5 = (self->_options >> 1) & 1 | 2;
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke;
  v18[3] = &unk_24F39B830;
  v18[4] = &v19;
  v18[5] = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entriesMap, "enumerateKeysAndObjectsUsingBlock:", v18);
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend((id)v20[5], "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v20[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableDictionary count](self->_entriesMap, "count"));
    v10 = (void *)MEMORY[0x22E2DDB58]();
    v11 = self->_entriesMap;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke_2;
    v14[3] = &unk_24F39B858;
    v17 = v8;
    v12 = v9;
    v15 = v12;
    v16 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v14);

    objc_autoreleasePoolPop(v10);
    v13 = self->_entriesMap;
    self->_entriesMap = v12;

  }
  _Block_object_dispose(&v19, 8);

}

void __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  objc_msgSend(a2, "pathComponents");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v21, "count") < 2
    || (objc_msgSend(v21, "objectAtIndexedSubscript:", 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("__MACOSX")),
        v6,
        v8 = v21,
        (v7 & 1) == 0))
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v9)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v21);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeLastObject");
      goto LABEL_13;
    }
    v10 = 0;
    if (objc_msgSend(v9, "count"))
    {
      do
      {
        if (v10 >= objc_msgSend(v21, "count"))
          break;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "compare:options:", v12, *(_QWORD *)(a1 + 40));

        if (v13)
          break;
        ++v10;
      }
      while (v10 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"));
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = 0;

        *a4 = 1;
LABEL_13:
        v8 = v21;
        goto LABEL_14;
      }
    }
    v16 = v10 >= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count");
    v8 = v21;
    if (!v16)
    {
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v17, "removeObjectsInRange:", v10, objc_msgSend(v17, "count") - v10);
      goto LABEL_13;
    }
  }
LABEL_14:

}

void __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "length") <= (unint64_t)(*(_QWORD *)(a1 + 48) + 1))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", v5);
  }
  else if ((objc_msgSend(v7, "hasPrefix:", CFSTR("__MACOSX")) & 1) == 0)
  {
    objc_msgSend(v7, "substringFromIndex:", *(_QWORD *)(a1 + 48) + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCollapsedName:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

  }
}

- (unint64_t)archiveLength
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive archiveLength]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 877, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v10, "-[TSUZipArchive archiveLength]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (id)newArchiveReadChannel
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive newArchiveReadChannel]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 881, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v10, "-[TSUZipArchive newArchiveReadChannel]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (BOOL)isValid
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipArchive isValid]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 885, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v10, "-[TSUZipArchive isValid]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (id)debugDescription
{
  void *v3;
  const __CFArray *v4;
  void *v5;
  void *v6;

  +[OITSUDescription descriptionWithObject:class:](OITSUDescription, "descriptionWithObject:class:", self, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_entries, "array");
  v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  TSUCFArrayDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("entries"), v5);

  objc_msgSend(v3, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)endOfLastEntry
{
  return self->_endOfLastEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
}

@end
