@implementation TSPDataManager

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalReferenceRemovalGroup, 0);
  objc_storeStrong((id *)&self->_temporaryPathSet, 0);
  objc_storeStrong((id *)&self->_temporaryUniqueDirectoryURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_lastDocumentURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryQueue, 0);
  std::__hash_table<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,std::__unordered_map_hasher<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestHash,TSP::DataDigestEqualTo,true>,std::__unordered_map_equal<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestEqualTo,TSP::DataDigestHash,true>,std::allocator<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>>>::~__hash_table((uint64_t)&self->_digestToDataMap);
  std::__hash_table<std::__hash_value_type<long long const,TSPData * {__weak}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,TSP::ObjectIdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,std::equal_to<long long const>,TSP::ObjectIdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,TSPData * {__weak}>>>::~__hash_table((uint64_t)&self->_identifierToDataMap);
  objc_storeStrong((id *)&self->_datasQueue, 0);
  objc_destroyWeak((id *)&self->_context);
}

- (void)enumerateDatasUsingBlock:(id)a3
{
  id v4;
  NSObject *datasQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    datasQueue = self->_datasQueue;
    block[1] = 3221225472;
    block[2] = __43__TSPDataManager_enumerateDatasUsingBlock___block_invoke;
    block[3] = &unk_24D829C60;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(datasQueue, block);

    v4 = v6;
  }

}

- (void)didCloseDocument
{
  -[TSPDataManager enumerateDatasUsingBlock:](self, "enumerateDatasUsingBlock:", &__block_literal_global_6);
}

- (void)dealloc
{
  objc_super v3;

  -[TSPDataManager removeTemporaryDirectory](self, "removeTemporaryDirectory");
  v3.receiver = self;
  v3.super_class = (Class)TSPDataManager;
  -[TSPDataManager dealloc](&v3, sel_dealloc);
}

- (void)removeTemporaryDirectory
{
  void *v3;
  NSURL *temporaryUniqueDirectoryURL;
  char v5;
  id v6;
  NSURL *temporaryDirectoryURL;
  id v8;
  int v9;
  NSURL *v10;
  NSURL *v11;
  TSUPathSet *temporaryPathSet;
  id v13;

  if (self->_temporaryUniqueDirectoryURL)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    temporaryUniqueDirectoryURL = self->_temporaryUniqueDirectoryURL;
    v13 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", temporaryUniqueDirectoryURL, &v13);
    v6 = v13;

    if ((v5 & 1) == 0)
      TSULogErrorInFunction();

  }
  temporaryDirectoryURL = self->_temporaryDirectoryURL;
  if (temporaryDirectoryURL)
  {
    if (temporaryDirectoryURL != self->_temporaryUniqueDirectoryURL)
    {
      -[NSURL path](temporaryDirectoryURL, "path");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = rmdir((const char *)objc_msgSend(v8, "fileSystemRepresentation"));

      if (v9)
      {
        if (v9 != 66)
        {
          strerror(v9);
          TSULogErrorInFunction();
        }
      }
    }
  }
  v10 = self->_temporaryDirectoryURL;
  self->_temporaryDirectoryURL = 0;

  v11 = self->_temporaryUniqueDirectoryURL;
  self->_temporaryUniqueDirectoryURL = 0;

  temporaryPathSet = self->_temporaryPathSet;
  self->_temporaryPathSet = 0;

}

- (TSPDataManager)initWithContext:(id)a3
{
  id v4;
  TSPDataManager *v5;
  TSPDataManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *datasQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *temporaryDirectoryQueue;
  dispatch_group_t v11;
  OS_dispatch_group *externalReferenceRemovalGroup;
  TSPDataManager *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TSPDataManager;
  v5 = -[TSPDataManager init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v7 = dispatch_queue_create("TSPDataManager.Datas", 0);
    datasQueue = v6->_datasQueue;
    v6->_datasQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("TSPDataManager.TemporaryDirectory", 0);
    temporaryDirectoryQueue = v6->_temporaryDirectoryQueue;
    v6->_temporaryDirectoryQueue = (OS_dispatch_queue *)v9;

    v6->_nextNewIdentifier = 1;
    v11 = dispatch_group_create();
    externalReferenceRemovalGroup = v6->_externalReferenceRemovalGroup;
    v6->_externalReferenceRemovalGroup = (OS_dispatch_group *)v11;

    v13 = v6;
  }

  return v6;
}

void __43__TSPDataManager_enumerateDatasUsingBlock___block_invoke(uint64_t a1)
{
  id *i;
  id WeakRetained;

  for (i = *(id **)(*(_QWORD *)(a1 + 32) + 48); i; i = (id *)*i)
  {
    WeakRetained = objc_loadWeakRetained(i + 3);
    if (WeakRetained)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __34__TSPDataManager_didCloseDocument__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willCull");
}

- (id)dataFromURL:(id)a3 useFileCoordination:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isFileURL"))
  {
    -[TSPDataManager dataFromFileURL:useFileCoordination:](self, "dataFromFileURL:useFileCoordination:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager dataFromURL:useFileCoordination:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 180, CFSTR("Unsupported URL scheme"));

    v7 = 0;
  }

  return v7;
}

- (id)dataFromFileURL:(id)a3 useFileCoordination:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD aBlock[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a4;
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__TSPDataManager_dataFromFileURL_useFileCoordination___block_invoke;
  aBlock[3] = &unk_24D829940;
  v14 = &v15;
  aBlock[4] = self;
  v7 = v6;
  v13 = v7;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v4)
    -[TSPDataManager coordinateReadingNewFileURL:byAccessor:](self, "coordinateReadingNewFileURL:byAccessor:", v7, v8);
  else
    (*((void (**)(void *, id))v8 + 2))(v8, v7);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __54__TSPDataManager_dataFromFileURL_useFileCoordination___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C68]), "initForReadingURL:", v9);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataFromReadChannel:filename:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v3, "close");
}

- (void)coordinateReadingNewFileURL:(id)a3 byAccessor:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  char v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v9 = 0;
  v7 = objc_msgSend(MEMORY[0x24BDD1570], "tsp_coordinateReadingItemAtURL:options:filePresenter:error:byAccessor:", v5, 0, 0, &v9, v6);
  v8 = v9;
  if (v8)
    TSULogErrorInFunction();
  if ((v7 & 1) == 0)
    v6[2](v6, 0);

}

- (id)dataFromReadChannel:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[TSPDataManager temporaryPathForFilename:](self, "temporaryPathForFilename:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPDataManager dataFromReadChannel:filename:temporaryPath:](self, "dataFromReadChannel:filename:temporaryPath:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dataFromReadChannel:(id)a3 filename:(id)a4 linkURLOrNil:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  dispatch_semaphore_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TSPDataManager temporaryPathForFilename:](self, "temporaryPathForFilename:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  if (v10 && -[TSPDataManager linkTemporaryPath:fromURL:](self, "linkTemporaryPath:fromURL:", v11, v10))
  {
    v12 = dispatch_semaphore_create(0);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __60__TSPDataManager_dataFromReadChannel_filename_linkURLOrNil___block_invoke;
    v17[3] = &unk_24D829968;
    v17[4] = self;
    v18 = v11;
    v21 = &v22;
    v19 = v9;
    v20 = v12;
    v13 = v12;
    -[TSPDataManager findExistingDataForReadChannel:dataURL:readHandler:completion:](self, "findExistingDataForReadChannel:dataURL:readHandler:completion:", v8, v10, 0, v17);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    -[TSPDataManager dataFromReadChannel:filename:temporaryPath:](self, "dataFromReadChannel:filename:temporaryPath:", v8, v9, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = v23[5];
    v23[5] = v14;
  }

  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __60__TSPDataManager_dataFromReadChannel_filename_linkURLOrNil___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10 || (a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "removeFileAtPath:", *(_QWORD *)(a1 + 40));
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataForExistingData:digest:filename:temporaryPath:", v10, a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (id)dataFromReadChannel:(id)a3 filename:(id)a4 temporaryPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  dispatch_semaphore_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = dispatch_semaphore_create(0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__TSPDataManager_dataFromReadChannel_filename_temporaryPath___block_invoke;
  v17[3] = &unk_24D829990;
  v20 = v11;
  v21 = &v22;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v11;
  v13 = v9;
  v14 = v8;
  -[TSPDataManager findExistingDataForReadChannel:dataURL:temporaryPath:shouldWriteIfFound:completion:](self, "findExistingDataForReadChannel:dataURL:temporaryPath:shouldWriteIfFound:completion:", v10, 0, v13, 0, v17);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __61__TSPDataManager_dataFromReadChannel_filename_temporaryPath___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a3;
  v11 = v7;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataForExistingData:digest:filename:temporaryPath:", v7, a4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (id)dataForExistingData:(id)a3 digest:(const void *)a4 filename:(id)a5 temporaryPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TSPTemporaryDataStorage *v14;
  void *v15;
  TSPTemporaryDataStorage *v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    v14 = [TSPTemporaryDataStorage alloc];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TSPTemporaryDataStorage initWithURL:](v14, "initWithURL:", v15);

    -[TSPDataManager addNewDataForStorage:digest:filename:](self, "addNewDataForStorage:digest:filename:", v16, a4, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)findExistingDataForReadChannel:(id)a3 dataURL:(id)a4 temporaryPath:(id)a5 shouldWriteIfFound:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  dispatch_fd_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *datasQueue;
  _QWORD v24[4];
  NSObject *v25;
  TSPDataManager *v26;
  id v27;
  id v28;
  uint64_t *v29;
  BOOL v30;
  _QWORD aBlock[4];
  NSObject *v32;
  NSObject *v33;
  uint64_t *v34;
  BOOL v35;
  _QWORD cleanup_handler[5];
  dispatch_fd_t v37;
  _QWORD block[4];
  NSObject *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  BOOL v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = v12 != 0;
  if (!v12
    || (v16 = -[TSPDataManager openTemporaryPath:](self, "openTemporaryPath:", v14),
        *((_BYTE *)v41 + 24) = v16 >= 0,
        v16 < 0))
  {
    datasQueue = self->_datasQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke;
    block[3] = &unk_24D8299B8;
    v39 = v15;
    dispatch_async(datasQueue, block);
    v20 = v39;
  }
  else
  {
    v17 = dispatch_queue_create("TSPDataManager.TemporaryWrite", 0);
    v18 = MEMORY[0x24BDAC760];
    cleanup_handler[0] = MEMORY[0x24BDAC760];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_2;
    cleanup_handler[3] = &unk_24D8299E0;
    cleanup_handler[4] = &v40;
    v37 = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_3;
    aBlock[3] = &unk_24D829A30;
    v34 = &v40;
    v35 = a6;
    v19 = dispatch_io_create(0, v16, v17, cleanup_handler);
    v32 = v19;
    v33 = v17;
    v20 = v17;
    v21 = _Block_copy(aBlock);
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_5;
    v24[3] = &unk_24D829AD0;
    v30 = a6;
    v29 = &v40;
    v25 = v19;
    v26 = self;
    v27 = v14;
    v28 = v15;
    v22 = v19;
    -[TSPDataManager findExistingDataForReadChannel:dataURL:readHandler:completion:](self, "findExistingDataForReadChannel:dataURL:readHandler:completion:", v12, v13, v21, v24);

  }
  _Block_object_dispose(&v40, 8);

}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  BOOL v3;
  char v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (a2)
    v3 = 1;
  else
    v3 = *(_BYTE *)(v2 + 24) == 0;
  v4 = !v3;
  *(_BYTE *)(v2 + 24) = v4;
  return close(*(_DWORD *)(a1 + 40));
}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_3(uint64_t a1, void *a2, int a3, char a4)
{
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD io_handler[5];

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) && (!a3 || *(_BYTE *)(a1 + 56) || (a4 & 1) == 0))
  {
    v9 = *(NSObject **)(a1 + 32);
    v10 = *(NSObject **)(a1 + 40);
    io_handler[0] = MEMORY[0x24BDAC760];
    io_handler[1] = 3221225472;
    io_handler[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_4;
    io_handler[3] = &unk_24D829A08;
    io_handler[4] = v8;
    dispatch_io_write(v9, 0, v7, v10, io_handler);
  }

}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  BOOL v5;
  char v6;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (a4)
    v5 = 1;
  else
    v5 = *(_BYTE *)(v4 + 24) == 0;
  v6 = !v5;
  *(_BYTE *)(v4 + 24) = v6;
  return result;
}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_5(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v7 = a3;
  v8 = v7;
  if (a2 && (!v7 || *(_BYTE *)(a1 + 72)))
  {
    v9 = operator new();
    *(_OWORD *)v9 = *(_OWORD *)a4;
    *(_DWORD *)(v9 + 16) = *(_DWORD *)(a4 + 16);
    v10 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_6;
    v13[3] = &unk_24D829AA8;
    v11 = v10;
    v19 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 40);
    v14 = v11;
    v15 = v12;
    v16 = v8;
    v20 = v9;
    v17 = *(id *)(a1 + 48);
    v21 = *(_BYTE *)(a1 + 72);
    v18 = *(id *)(a1 + 56);
    dispatch_io_barrier(v11, v13);

  }
  else
  {
    dispatch_io_close(*(dispatch_io_t *)(a1 + 32), 0);
    objc_msgSend(*(id *)(a1 + 40), "removeFileAtPath:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  _QWORD v12[2];
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  dispatch_io_close(*(dispatch_io_t *)(a1 + 32), 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v2 = *(void **)(a1 + 48);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_7;
    block[3] = &unk_24D829A80;
    v4 = (id *)v12;
    v5 = v2;
    v6 = *(_QWORD *)(a1 + 40);
    v12[0] = v5;
    v12[1] = v6;
    v15 = *(_QWORD *)(a1 + 80);
    v13 = *(id *)(a1 + 56);
    v16 = *(_BYTE *)(a1 + 88);
    v14 = *(id *)(a1 + 64);
    dispatch_async(v3, block);

  }
  else
  {
    TSULogErrorInFunction();
    v7 = *(_QWORD *)(a1 + 80);
    if (v7)
      MEMORY[0x219A153B8](v7, 0x1000C40A86A77D5);
    objc_msgSend(*(id *)(a1 + 40), "removeFileAtPath:", *(_QWORD *)(a1 + 56));
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_9;
    v9[3] = &unk_24D8299B8;
    v4 = &v10;
    v10 = *(id *)(a1 + 64);
    dispatch_async(v8, v9);
  }

}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = *(id *)(a1 + 32);
  if (v2)
    goto LABEL_10;
  v3 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_8;
  v6[3] = &unk_24D829A58;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "dataForDigestImpl:accessorBlock:", v3, v6);
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
LABEL_10:
    if (!*(_BYTE *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 40), "removeFileAtPath:", *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v5 = *(_QWORD *)(a1 + 64);
  if (v5)
    MEMORY[0x219A153B8](v5, 0x1000C40A86A77D5);

}

void __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *);

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 32), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

uint64_t __101__TSPDataManager_findExistingDataForReadChannel_dataURL_temporaryPath_shouldWriteIfFound_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)findExistingDataForReadChannel:(id)a3 dataURL:(id)a4 readHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10)
  {
    if (!v13)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager findExistingDataForReadChannel:dataURL:readHandler:completion:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 409, CFSTR("Invalid parameter not satisfying: %s"), "readChannel");

    if (!v14)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager findExistingDataForReadChannel:dataURL:readHandler:completion:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 410, CFSTR("Invalid parameter not satisfying: %s"), "completion");

    }
  }
  v21 = (void *)objc_opt_class();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke;
  v25[3] = &unk_24D829B20;
  v25[4] = self;
  v22 = v11;
  v26 = v22;
  v23 = v12;
  v27 = v23;
  v24 = v14;
  v28 = v24;
  objc_msgSend(v21, "readWithChannel:handler:", v10, v25);

}

void __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a2)
  {
    if (v9)
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_4;
      block[3] = &unk_24D8299B8;
      v20 = *(id *)(a1 + 56);
      dispatch_async(v12, block);
      v13 = v20;
    }
    else
    {
      v15 = operator new();
      *(_OWORD *)v15 = *(_OWORD *)a5;
      *(_DWORD *)(v15 + 16) = *(_DWORD *)(a5 + 16);
      v21[0] = MEMORY[0x24BDAC760];
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      v18 = *(NSObject **)(v16 + 16);
      v21[2] = __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_2;
      v21[3] = &unk_24D829AF8;
      v21[1] = 3221225472;
      v21[4] = v16;
      v26 = v15;
      v22 = v17;
      v23 = v11;
      v24 = *(id *)(a1 + 48);
      v25 = *(id *)(a1 + 56);
      dispatch_async(v18, v21);

      v13 = v22;
    }

  }
  else if (v10)
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v14 + 16))(v14, v11, 0, 0);
  }

}

void __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = *(_QWORD *)(a1 + 72);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_3;
  v7[3] = &unk_24D829A58;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "dataForDigestImpl:accessorBlock:", v2, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 48))
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v6 = *(_QWORD *)(a1 + 72);
  if (v6)
    MEMORY[0x219A153B8](v6, 0x1000C40A86A77D5);

}

uint64_t __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

uint64_t __80__TSPDataManager_findExistingDataForReadChannel_dataURL_readHandler_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)readWithChannel:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v20 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
    CC_SHA1_Init((CC_SHA1_CTX *)v18[3]);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__2;
    v15[4] = __Block_byref_object_dispose__2;
    v16 = 0;
    v7 = dispatch_queue_create("TSPDataManager.Read", 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__TSPDataManager_readWithChannel_handler___block_invoke;
    v11[3] = &unk_24D829B70;
    v13 = v15;
    v14 = &v17;
    v12 = v6;
    objc_msgSend(v5, "readWithQueue:handler:", v7, v11);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSPDataManager readWithChannel:handler:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 450, CFSTR("Invalid parameter not satisfying: %s"), "handler");

  }
}

void __42__TSPDataManager_readWithChannel_handler___block_invoke(_QWORD *a1, int a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD applier[5];
  unsigned __int8 md[20];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1[5] + 8);
  v12 = *(_QWORD *)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v11 = v12;
  if (!v8 || v11)
  {
    if (!v11)
    {
      if (v7)
      {
        if (dispatch_data_get_size(v7))
        {
          applier[0] = MEMORY[0x24BDAC760];
          applier[1] = 3221225472;
          applier[2] = __42__TSPDataManager_readWithChannel_handler___block_invoke_2;
          applier[3] = &unk_24D829B48;
          applier[4] = a1[6];
          dispatch_data_apply(v7, applier);
          if ((a2 & 1) == 0)
          {
            (*(void (**)(void))(a1[4] + 16))();
            goto LABEL_13;
          }
        }
        else if ((a2 & 1) == 0)
        {
          goto LABEL_13;
        }
      }
      else if (!a2)
      {
        goto LABEL_13;
      }
      CC_SHA1_Final(md, *(CC_SHA1_CTX **)(*(_QWORD *)(a1[6] + 8) + 24));
      free(*(void **)(*(_QWORD *)(a1[6] + 8) + 24));
      (*(void (**)(void))(a1[4] + 16))();
    }
  }
  else
  {
    objc_storeStrong(v10, a4);
    TSULogErrorInFunction();
    free(*(void **)(*(_QWORD *)(a1[6] + 8) + 24));
    (*(void (**)(_QWORD))(a1[4] + 16))(a1[4]);
  }
LABEL_13:

}

uint64_t __42__TSPDataManager_readWithChannel_handler___block_invoke_2(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  CC_SHA1_Update(*(CC_SHA1_CTX **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), data, len);
  return 1;
}

- (id)dataFromNSData:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CC_LONG v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *datasQueue;
  void (**v19)(_QWORD);
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD aBlock[5];
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[3];
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD block[5];
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  __int128 v56;
  int v57;
  __int128 md;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager dataFromNSData:filename:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 510, CFSTR("Filename was not provided for data."));

  }
  objc_msgSend(v7, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "length");
  v13 = objc_retainAutorelease(v6);
  CC_SHA1((const void *)objc_msgSend(v13, "bytes"), v12, (unsigned __int8 *)&md);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__2;
  v49 = __Block_byref_object_dispose__2;
  v50 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__2;
  v31[4] = __Block_byref_object_dispose__2;
  v32 = 0;
  v14 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__TSPDataManager_dataFromNSData_filename___block_invoke;
  aBlock[3] = &unk_24D829B98;
  v27 = v43;
  v28 = &v37;
  aBlock[4] = self;
  v15 = v11;
  v25 = v15;
  v29 = &v33;
  v16 = v13;
  v26 = v16;
  v30 = v31;
  v17 = _Block_copy(aBlock);
  datasQueue = self->_datasQueue;
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __42__TSPDataManager_dataFromNSData_filename___block_invoke_2;
  block[3] = &unk_24D829BE8;
  v53 = &v45;
  block[4] = self;
  v56 = md;
  v57 = v59;
  v19 = v17;
  v52 = v19;
  v54 = &v33;
  v55 = &v37;
  dispatch_sync(datasQueue, block);
  if (!v46[5])
  {
    v19[2](v19);
    if (*((_BYTE *)v34 + 24))
    {
      -[TSPDataManager dataWithTemporaryPath:digest:filename:](self, "dataWithTemporaryPath:digest:filename:", v38[5], &md, v15);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v46[5];
      v46[5] = v20;

    }
    else
    {
      TSULogErrorInFunction();
    }
  }
  v22 = (id)v46[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __42__TSPDataManager_dataFromNSData_filename___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "temporaryPathForFilename:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(void **)(a1 + 48);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v5, "writeToFile:options:error:", v6, 0, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __42__TSPDataManager_dataFromNSData_filename___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v2 = a1 + 72;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TSPDataManager_dataFromNSData_filename___block_invoke_3;
  v7[3] = &unk_24D829BC0;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v3, "dataForDigestImpl:accessorBlock:", v2, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __42__TSPDataManager_dataFromNSData_filename___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(unsigned __int8 *)(v3 + 24);
  if (*(_BYTE *)(v3 + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6[2](v6, v5);
  if (v4)

}

- (id)documentResourceDataWithStorage:(id)a3 digestString:(id)a4 filename:(id)a5
{
  id v8;
  TSP *v9;
  id v10;
  void *v11;
  _BYTE v13[20];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (TSP *)a4;
  v10 = a5;
  TSP::DataDigestForString(v9, (uint64_t)v13);
  -[TSPDataManager dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:](self, "dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:", v8, v13, v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *datasQueue;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPDataManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    v29 = 0;
    datasQueue = self->_datasQueue;
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__TSPDataManager_copyData___block_invoke;
    block[3] = &unk_24D829C10;
    v23 = &v24;
    block[4] = self;
    v11 = v5;
    v22 = v11;
    dispatch_sync(datasQueue, block);
    v12 = (void *)v25[5];
    if (!v12)
    {
      -[TSPDataManager context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __27__TSPDataManager_copyData___block_invoke_2;
      v17[3] = &unk_24D829C38;
      v20 = &v24;
      v18 = v11;
      v19 = v13;
      v14 = v13;
      objc_msgSend(v18, "performIOChannelReadWithAccessor:", v17);

      v12 = (void *)v25[5];
    }
    v15 = v12;

    _Block_object_dispose(&v24, 8);
  }
  else
  {
LABEL_7:
    v15 = v5;
  }

  return v15;
}

void __27__TSPDataManager_copyData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "dataForDigestImpl:accessorBlock:", objc_msgSend(*(id *)(a1 + 40), "digest"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "storage");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v12, "storageForDataCopyFromOtherContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 40), "digest");
      objc_msgSend(*(id *)(a1 + 40), "filename");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addNewDataForStorage:digest:filename:", v6, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
}

void __27__TSPDataManager_copyData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3CF0]), "initWithReadChannel:", v3);
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSPData dataFromReadChannel:filename:context:](TSPData, "dataFromReadChannel:filename:context:", v4, v5, *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v3 = v9;
  }

}

- (id)dataOrNilForIdentifier:(int64_t)a3
{
  NSObject *datasQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__TSPDataManager_dataOrNilForIdentifier___block_invoke;
  block[3] = &unk_24D8297A0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(datasQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__TSPDataManager_dataOrNilForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataForIdentifierImpl:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dataForIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[TSPDataManager dataOrNilForIdentifier:](self, "dataOrNilForIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 && !v4)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager dataForIdentifier:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 857, CFSTR("No data loaded for identifier: %qu"), a3);

LABEL_6:
    +[TSPData null](TSPData, "null");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_6;
  v9 = v4;
LABEL_7:
  v10 = v9;

  return v10;
}

- (id)dataForIdentifierImpl:(int64_t)a3
{
  unordered_map<const long long, TSPData *__weak, TSP::ObjectIdentifierHash, std::equal_to<const long long>, std::allocator<std::pair<const long long, TSPData *__weak>>> *p_identifierToDataMap;
  id *WeakRetained;
  id *v5;
  int64_t v7;
  _BYTE v8[24];

  v7 = a3;
  p_identifierToDataMap = &self->_identifierToDataMap;
  WeakRetained = (id *)std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::find<long long>(&self->_identifierToDataMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    if (!WeakRetained)
    {
      std::__hash_table<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::__unordered_map_hasher<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::hash<EQKit::StemStretch::Key>,std::equal_to<EQKit::StemStretch::Key>,true>,std::__unordered_map_equal<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::equal_to<EQKit::StemStretch::Key>,std::hash<EQKit::StemStretch::Key>,true>,std::allocator<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>>>::remove(p_identifierToDataMap, v5, (uint64_t)v8);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<long long const,TSPData * {__weak}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long long const,TSPData * {__weak}>,void *>>>>::reset[abi:nn180100]((uint64_t)v8, 0);
      WeakRetained = 0;
    }
  }
  return WeakRetained;
}

- (int)openTemporaryPath:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3)
  {
    v4 = TSUOpen();
    if (v4 < 0)
      TSULogErrorInFunction();
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)linkTemporaryPath:(id)a3 fromURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager linkTemporaryPath:fromURL:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 913, CFSTR("Can't link to non-file URL"));

    }
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[TSPFileManager linkFileAtPath:toPath:](TSPFileManager, "linkFileAtPath:toPath:", v11, v5);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)temporaryPathForFilename:(id)a3
{
  id v4;
  NSObject *temporaryDirectoryQueue;
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
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  temporaryDirectoryQueue = self->_temporaryDirectoryQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__TSPDataManager_temporaryPathForFilename___block_invoke;
  block[3] = &unk_24D829868;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(temporaryDirectoryQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__TSPDataManager_temporaryPathForFilename___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 128))
  {
    objc_msgSend((id)v2, "createTemporaryDirectoryForPackageURL:", *(_QWORD *)(v2 + 120));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

    v6 = objc_alloc_init(MEMORY[0x24BEB3CD8]);
    v7 = a1[4];
    v8 = *(void **)(v7 + 144);
    *(_QWORD *)(v7 + 144) = v6;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager temporaryPathForFilename:]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 931, CFSTR("invalid nil value for '%s'"), "uuid");

    }
    v13 = *(void **)(a1[4] + 128);
    objc_msgSend(v9, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = a1[4];
    v17 = *(void **)(v16 + 136);
    *(_QWORD *)(v16 + 136) = v15;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[4] + 136);
    v28 = 0;
    v20 = objc_msgSend(v18, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v28);
    v21 = v28;

    if ((v20 & 1) == 0)
    {
      objc_storeStrong((id *)(a1[4] + 136), *(id *)(a1[4] + 128));
      v27 = v21;
      TSULogErrorInFunction();
    }

    v2 = a1[4];
  }
  objc_msgSend(*(id *)(v2 + 144), "addPath:", a1[5], v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 136), "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:", v22);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(a1[6] + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;

}

- (id)dataWithTemporaryPath:(id)a3 digest:(const void *)a4 filename:(id)a5
{
  id v8;
  id v9;
  void *v10;
  TSPTemporaryDataStorage *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TSPTemporaryDataStorage initWithURL:]([TSPTemporaryDataStorage alloc], "initWithURL:", v10);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__TSPDataManager_dataWithTemporaryPath_digest_filename___block_invoke;
  v15[3] = &unk_24D829A58;
  v12 = v10;
  v16 = v12;
  -[TSPDataManager dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:](self, "dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:", v11, a4, v9, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __56__TSPDataManager_dataWithTemporaryPath_digest_filename___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)setDocumentURL:(id)a3
{
  id v4;
  NSObject *temporaryDirectoryQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  temporaryDirectoryQueue = self->_temporaryDirectoryQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__TSPDataManager_setDocumentURL___block_invoke;
  v7[3] = &unk_24D829818;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(temporaryDirectoryQueue, v7);

}

void __33__TSPDataManager_setDocumentURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v2;

}

- (id)dataFromExternalReferenceURL:(id)a3 useFileCoordination:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  TSPDataManager *v10;
  TSPDataManager *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v19;
  _QWORD aBlock[5];
  TSPDataManager *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager dataFromExternalReferenceURL:useFileCoordination:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 1022, CFSTR("External references must be added from a file URL"));

  }
  v10 = self;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke;
  aBlock[3] = &unk_24D829CB0;
  aBlock[4] = v10;
  v22 = &v23;
  v11 = v10;
  v21 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v4)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1570], "tsp_coordinateReadingItemAtURL:options:filePresenter:error:byAccessor:", v6, 0, 0, &v19, v12);
    v14 = v19;
    if (v14)
    {
      v15 = v14;
      TSULogErrorInFunction();
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    (*((void (**)(void *, id))v12 + 2))(v12, v6);
    v16 = 0;
  }
  v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

void __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, int, void *, uint64_t);
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C68]), "initForReadingURL:", v3);
  v5 = dispatch_semaphore_create(0);
  v6 = *(void **)(a1 + 32);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke_2;
  v12 = &unk_24D829C88;
  v16 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v13 = v7;
  v14 = *(id *)(a1 + 40);
  v8 = v5;
  v15 = v8;
  objc_msgSend(v6, "findExistingDataForReadChannel:dataURL:readHandler:completion:", v4, v7, 0, &v9);
  objc_msgSend(v4, "close", v9, v10, v11, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

}

void __67__TSPDataManager_dataFromExternalReferenceURL_useFileCoordination___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  TSPExternalReferenceDataStorage *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = a3;
  v16 = v7;
  if (a2)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = v7;
      v10 = *(TSPExternalReferenceDataStorage **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
    }
    else
    {
      v10 = -[TSPExternalReferenceDataStorage initWithURL:]([TSPExternalReferenceDataStorage alloc], "initWithURL:", *(_QWORD *)(a1 + 32));
      v11 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addNewDataForStorage:digest:filename:", v10, a4, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)removeExternalReferences
{
  NSObject *externalReferenceRemovalGroup;
  NSObject *datasQueue;
  _QWORD block[5];

  -[TSPDataManager waitForRemoveExternalReferencesToComplete](self, "waitForRemoveExternalReferencesToComplete");
  externalReferenceRemovalGroup = self->_externalReferenceRemovalGroup;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__TSPDataManager_removeExternalReferences__block_invoke;
  block[3] = &unk_24D829778;
  block[4] = self;
  dispatch_group_async(externalReferenceRemovalGroup, datasQueue, block);
}

void __42__TSPDataManager_removeExternalReferences__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v5;
  void *v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 152))
  {
    v2 = *(id **)(v1 + 48);
    if (v2)
    {
      do
      {
        WeakRetained = objc_loadWeakRetained(v2 + 3);
        objc_opt_class();
        objc_msgSend(WeakRetained, "storage");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        TSUDynamicCast();
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
          objc_msgSend(*(id *)(a1 + 32), "removeExternalReferenceForData:storage:", WeakRetained, v6);

        v2 = (id *)*v2;
      }
      while (v2);
      v1 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 152) = 0;
  }
}

- (void)waitForRemoveExternalReferencesToComplete
{
  dispatch_group_wait((dispatch_group_t)self->_externalReferenceRemovalGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)removeExternalReferenceForData:(id)a3 storage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  TSPDataManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter((dispatch_group_t)self->_externalReferenceRemovalGroup);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke;
  block[3] = &unk_24D829D28;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_2;
  v2[3] = &unk_24D829D00;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "performIOChannelReadWithAccessor:", v2);

}

void __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "temporaryPathForFilename:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3CF0]), "initWithReadChannel:", v3);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_3;
    v14 = &unk_24D829CD8;
    v7 = *(void **)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    v8 = v5;
    v16 = v8;
    v9 = v4;
    v10 = *(_QWORD *)(a1 + 32);
    v17 = v9;
    v18 = v10;
    objc_msgSend(v7, "findExistingDataForReadChannel:dataURL:temporaryPath:shouldWriteIfFound:completion:", v6, 0, v8, 1, &v11);
    objc_msgSend(v3, "close", v11, v12, v13, v14);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 160));
  }

}

void __57__TSPDataManager_removeExternalReferenceForData_storage___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  TSPTemporaryDataStorage *v6;
  void *v7;
  TSPTemporaryDataStorage *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2)
  {
    if (*(id *)(a1 + 32) != v5)
      TSULogErrorInFunction();
    v6 = [TSPTemporaryDataStorage alloc];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 40), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TSPTemporaryDataStorage initWithURL:](v6, "initWithURL:", v7);

    objc_msgSend(*(id *)(a1 + 32), "setFilename:storage:", *(_QWORD *)(a1 + 48), v8);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 56) + 160));

}

- (id)dataForDigestImpl:(const void *)a3 accessorBlock:(id)a4
{
  -[TSPDataManager dataForDigestImpl:skipDocumentResourcesLookup:accessorBlock:](self, "dataForDigestImpl:skipDocumentResourcesLookup:accessorBlock:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataForDigestImpl:(const void *)a3 skipDocumentResourcesLookup:(BOOL)a4 accessorBlock:(id)a5
{
  id v7;
  unordered_map<const std::array<unsigned char, 20>, TSPData *__weak, TSP::DataDigestHash, TSP::DataDigestEqualTo, std::allocator<std::pair<const std::array<unsigned char, 20>, TSPData *__weak>>> *p_digestToDataMap;
  uint64_t *v9;
  uint64_t *v10;
  id WeakRetained;
  _BYTE v13[24];

  v7 = a5;
  p_digestToDataMap = &self->_digestToDataMap;
  v9 = std::__hash_table<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,std::__unordered_map_hasher<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestHash,TSP::DataDigestEqualTo,true>,std::__unordered_map_equal<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestEqualTo,TSP::DataDigestHash,true>,std::allocator<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>>>::find<std::array<unsigned char,20ul>>(p_digestToDataMap, (unint64_t *)a3);
  v10 = v9;
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)v9 + 5);
    if (!WeakRetained)
    {
      std::__hash_table<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::__unordered_map_hasher<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::hash<EQKit::StemStretch::Key>,std::equal_to<EQKit::StemStretch::Key>,true>,std::__unordered_map_equal<EQKit::StemStretch::Key,std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>,std::equal_to<EQKit::StemStretch::Key>,std::hash<EQKit::StemStretch::Key>,true>,std::allocator<std::__hash_value_type<EQKit::StemStretch::Key,std::pair<std::shared_ptr<EQKit::StemStretch::Glyph>,unsigned long>>>>::remove(p_digestToDataMap, v10, (uint64_t)v13);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,void *>>>>::reset[abi:nn180100]((uint64_t)v13, 0);
    }
  }
  else
  {
    WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)dataForDigest:(const void *)a3
{
  NSObject *datasQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__TSPDataManager_dataForDigest___block_invoke;
  block[3] = &unk_24D8297A0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(datasQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __32__TSPDataManager_dataForDigest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataForDigestImpl:accessorBlock:", *(_QWORD *)(a1 + 48), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)dataForDigest:(const void *)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *datasQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  const void *v16;

  v8 = a4;
  v9 = a5;
  datasQueue = self->_datasQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__TSPDataManager_dataForDigest_queue_completion___block_invoke;
  v13[3] = &unk_24D829D50;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(datasQueue, v13);

}

void __49__TSPDataManager_dataForDigest_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "dataForDigestImpl:accessorBlock:", *(_QWORD *)(a1 + 56), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__TSPDataManager_dataForDigest_queue_completion___block_invoke_2;
  v6[3] = &unk_24D8297C8;
  v3 = *(NSObject **)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __49__TSPDataManager_dataForDigest_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)dataWithStorage:(id)a3 digest:(const void *)a4 filename:(id)a5 skipDocumentResourcesLookup:(BOOL)a6 accessorBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *datasQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  const void *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (v12)
  {
    if (!v13)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 1265, CFSTR("Invalid parameter not satisfying: %s"), "storage");

    if (!v13)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDataManager dataWithStorage:digest:filename:skipDocumentResourcesLookup:accessorBlock:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataManager.mm");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 1266, CFSTR("Invalid parameter not satisfying: %s"), "filename");

    }
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__2;
  v38 = __Block_byref_object_dispose__2;
  v39 = 0;
  datasQueue = self->_datasQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__TSPDataManager_dataWithStorage_digest_filename_skipDocumentResourcesLookup_accessorBlock___block_invoke;
  block[3] = &unk_24D829D78;
  v31 = &v34;
  v32 = a4;
  v33 = a6;
  block[4] = self;
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  dispatch_sync(datasQueue, block);
  v25 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v25;
}

void __92__TSPDataManager_dataWithStorage_digest_filename_skipDocumentResourcesLookup_accessorBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dataForDigestImpl:skipDocumentResourcesLookup:accessorBlock:", *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addNewDataForStorage:digest:filename:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v2);
  v3 = v4;
  if (!v4)
  {

    v3 = 0;
  }

}

- (id)addNewDataForStorage:(id)a3 digest:(const void *)a4 filename:(id)a5
{
  id v8;
  id v9;
  TSPData *v10;

  v8 = a3;
  v9 = a5;
  v10 = -[TSPData initWithIdentifier:digest:filename:storage:manager:]([TSPData alloc], "initWithIdentifier:digest:filename:storage:manager:", self->_nextNewIdentifier, a4, v9, v8, self);
  -[TSPDataManager addData:](self, "addData:", v10);
  ++self->_nextNewIdentifier;

  return v10;
}

- (void)addData:(id)a3
{
  id v4;
  id *v5;
  uint64_t *v6;
  void *v7;
  unint64_t v8;
  __int128 *v9;

  v4 = a3;
  v8 = objc_msgSend(v4, "identifier");
  v9 = (__int128 *)&v8;
  v5 = (id *)std::__hash_table<std::__hash_value_type<long long const,TSPData * {__weak}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,TSP::ObjectIdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,TSPData * {__weak}>,std::equal_to<long long const>,TSP::ObjectIdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,TSPData * {__weak}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)&self->_identifierToDataMap, &v8, (uint64_t)&std::piecewise_construct, (_QWORD **)&v9);
  objc_storeWeak(v5 + 3, v4);
  v9 = (__int128 *)objc_msgSend(v4, "digest");
  v6 = std::__hash_table<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,std::__unordered_map_hasher<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestHash,TSP::DataDigestEqualTo,true>,std::__unordered_map_equal<std::array<unsigned char,20ul> const,std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>,TSP::DataDigestEqualTo,TSP::DataDigestHash,true>,std::allocator<std::__hash_value_type<std::array<unsigned char,20ul> const,TSPData * {__weak}>>>::__emplace_unique_key_args<std::array<unsigned char,20ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,20ul> const&>,std::tuple<>>((uint64_t)&self->_digestToDataMap, (uint64_t)v9, (uint64_t)&std::piecewise_construct, &v9);
  objc_storeWeak((id *)v6 + 5, v4);
  if (self->_hasExternalReferences)
  {
    self->_hasExternalReferences = 1;
  }
  else
  {
    objc_msgSend(v4, "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    self->_hasExternalReferences = objc_opt_isKindOfClass() & 1;

  }
}

- (id)checkForPersistenceWarningsWithPackageURL:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__TSPDataManager_checkForPersistenceWarningsWithPackageURL___block_invoke;
    v11[3] = &unk_24D829DA0;
    v7 = v6;
    v12 = v7;
    v13 = v5;
    -[TSPDataManager enumerateDatasUsingBlock:](self, "enumerateDatasUsingBlock:", v11);
    v8 = v13;
    v9 = v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __60__TSPDataManager_checkForPersistenceWarningsWithPackageURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "isApplicationData") & 1) == 0)
  {
    v3 = objc_msgSend(v8, "isReadable");
    objc_msgSend(v8, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "persistenceWarningsForData:isReadable:isExternal:", v8, v3, isKindOfClass & 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v7);

  }
}

+ (id)stringForDigest:(const void *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "tsp_stringForDigest:length:", a3, 20);
}

- (void)removeFileAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v7);
  v6 = v7;

  if ((v5 & 1) == 0)
    TSULogErrorInFunction();

}

- (TSPObjectContext)context
{
  return (TSPObjectContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (id)createTemporaryDirectoryForPackageURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3D10]), "initWithSignature:", CFSTR("DocumentData"));
  objc_msgSend(v3, "leakTemporaryDirectory");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDD0CE0];
  v12 = 0;
  objc_msgSend(v4, "changeFileProtectionAtURL:toProtection:recursively:error:", v5, v6, 0, &v12);
  v7 = v12;

  v8 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
