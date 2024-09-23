@implementation SBFFileCache

- (SBFFileCache)initWithStore:(id)a3 faultHandler:(id)a4
{
  id v7;
  id v8;
  SBFFileCache *v9;
  SBFFileCache *v10;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBFFileCache;
  v9 = -[SBFFileCache init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_faultHandler, a4);
    Serial = BSDispatchQueueCreateSerial();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)Serial;

  }
  return v10;
}

- (SBFFileCache)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't directly init this class"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  SBFFileCache *v21;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFFileCache store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("store"));

  -[SBFFileCache faultHandler](self, "faultHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("faultHandler"));

  -[SBFFileCache delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("delegate"));

  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[SBFFileCache maxTotalFileCount](self, "maxTotalFileCount"), CFSTR("maxTotalFileCount"));
  v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[SBFFileCache maxTotalFileSize](self, "maxTotalFileSize"), CFSTR("maxTotalFileSize"));
  queue = self->_queue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __27__SBFFileCache_description__block_invoke;
  v19 = &unk_1E200E2A0;
  v20 = v3;
  v21 = self;
  v13 = v3;
  dispatch_sync(queue, &v16);
  objc_msgSend(v13, "build", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __27__SBFFileCache_description__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("manifest"));
}

- (void)loadFileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E200EAA0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBFFileCache performOnWorkQueueUsingBlock:](self, "performOnWorkQueueUsingBlock:", v10);

}

void __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "fileNameForIdentifier:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileCache:loadFileWrapperNamed:", *(_QWORD *)(a1 + 32), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_2;
    block[3] = &unk_1E200EA00;
    v19 = *(id *)(a1 + 48);
    v11 = v8;
    v18 = v11;
    dispatch_async(v10, block);

    objc_msgSend(*(id *)(a1 + 32), "_queue_updateManifestForLoadedFileWrapper:filename:usingStore:", v11, v7, v5);
    v12 = v19;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_3;
    v14[3] = &unk_1E200EA78;
    v14[4] = v9;
    v13 = *(_QWORD *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v15 = v7;
    objc_msgSend(v6, "fileCache:loadFileForIdentifier:completionHandler:", v9, v13, v14);

    v12 = v16;
  }

}

uint64_t __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_4;
  v10[3] = &unk_1E200EA50;
  v10[4] = v7;
  v14 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "performOnWorkQueueUsingBlock:", v10);

}

void __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_5;
  block[3] = &unk_1E200EA28;
  v9 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "setFilename:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v3, "fileCache:storeFileWrapper:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_queue_createManifestEntryForGeneratedFileWrapper:filename:usingStore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v3);
  }

}

uint64_t __57__SBFFileCache_loadFileWithIdentifier_completionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removeFileWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SBFFileCache_removeFileWithIdentifier___block_invoke;
  v6[3] = &unk_1E200EAC8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBFFileCache performOnWorkQueueUsingBlock:](self, "performOnWorkQueueUsingBlock:", v6);

}

void __41__SBFFileCache_removeFileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "fileNameForIdentifier:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileCache:removeFileWrapperNamed:", *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeManifestEntryForFilename:usingStore:", v6, v5);

}

- (void)removeAllFiles
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __30__SBFFileCache_removeAllFiles__block_invoke;
  v2[3] = &unk_1E200EAF0;
  v2[4] = self;
  -[SBFFileCache performOnWorkQueueUsingBlock:](self, "performOnWorkQueueUsingBlock:", v2);
}

void __30__SBFFileCache_removeAllFiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "removeAllFileWrappersForFileCache:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_queue_resetManifestUsingStore:", v4);

}

- (id)fileNameForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 md[20];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "fileCacheStableDataRepresentation");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", md, 20, 0);
  objc_msgSend(v4, "sbf_hexadecimalEncodedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)performOnWorkQueueUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  -[SBFFileCache store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFFileCache faultHandler](self, "faultHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__SBFFileCache_performOnWorkQueueUsingBlock___block_invoke;
  v11[3] = &unk_1E200E228;
  v11[4] = self;
  v12 = v5;
  v13 = v6;
  v14 = v4;
  v8 = v6;
  v9 = v4;
  v10 = v5;
  dispatch_async(queue, v11);

}

uint64_t __45__SBFFileCache_performOnWorkQueueUsingBlock___block_invoke(_QWORD *a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)a1[4];
  if (!v2[2])
    objc_msgSend(v2, "_queue_loadManifestUsingStore:", a1[5]);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (id)callbackQueue
{
  return dispatch_get_global_queue(17, 0);
}

- (void)setAccessDateTimeAdjustment:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SBFFileCache_setAccessDateTimeAdjustment___block_invoke;
  v4[3] = &unk_1E200EB18;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

double __44__SBFFileCache_setAccessDateTimeAdjustment___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

- (void)_queue_loadManifestUsingStore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSMutableArray *v15;
  NSMutableArray *manifest;
  NSMutableArray *v17;
  NSMutableArray *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "fileCache:loadFileWrapperNamed:", self, CFSTR("Manifest.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "regularFileContents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v10 = v7;
      objc_msgSend(v10, "objectForKey:", CFSTR("version"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v11, "integerValue") == 1)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("files"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_isKindOfClass();

        if ((v14 & 1) != 0)
        {
          v15 = (NSMutableArray *)objc_msgSend(v12, "mutableCopy");
          manifest = self->_manifest;
          self->_manifest = v15;

        }
      }

    }
  }
  if (!self->_manifest)
  {
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = self->_manifest;
    self->_manifest = v17;

    objc_msgSend(v19, "removeAllFileWrappersForFileCache:", self);
  }

}

- (void)_queue_saveManifestUsingStore:(id)a3
{
  void *v4;
  NSMutableArray *manifest;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB38B0];
  manifest = self->_manifest;
  v11[0] = CFSTR("files");
  v11[1] = CFSTR("version");
  v12[0] = manifest;
  v12[1] = &unk_1E203A990;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", v9);
  objc_msgSend(v10, "setFilename:", CFSTR("Manifest.plist"));
  objc_msgSend(v7, "fileCache:storeFileWrapper:", self, v10);

}

- (void)_queue_createManifestEntryForGeneratedFileWrapper:(id)a3 filename:(id)a4 usingStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBFFileCache _queue_accessDateTimeAdjustment](self, "_queue_accessDateTimeAdjustment");
  v12 = v11;
  v13 = objc_msgSend(v10, "sb_fileSize");

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v17[0] = CFSTR("filename");
  v17[1] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  v18[2] = v14;
  v17[2] = CFSTR("generated");
  v17[3] = CFSTR("accessed");
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray insertObject:atIndex:](self->_manifest, "insertObject:atIndex:", v16, 0);
  -[SBFFileCache _queue_evictIfNeededUsingStore:](self, "_queue_evictIfNeededUsingStore:", v8);
  -[SBFFileCache _queue_saveManifestUsingStore:](self, "_queue_saveManifestUsingStore:", v8);

}

- (void)_queue_updateManifestForLoadedFileWrapper:(id)a3 filename:(id)a4 usingStore:(id)a5
{
  id v8;
  void *v9;
  NSMutableArray *manifest;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a4;
  v16 = a5;
  -[SBFFileCache _queue_accessDateTimeAdjustment](self, "_queue_accessDateTimeAdjustment");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  manifest = self->_manifest;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__SBFFileCache__queue_updateManifestForLoadedFileWrapper_filename_usingStore___block_invoke;
  v17[3] = &unk_1E200EB40;
  v18 = v8;
  v11 = v8;
  v12 = -[NSMutableArray indexOfObjectPassingTest:](manifest, "indexOfObjectPassingTest:", v17);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFFileCache.m"), 222, CFSTR("Should not call this method for a newly-created file!"));
  }
  else
  {
    v13 = v12;
    -[NSMutableArray objectAtIndex:](self->_manifest, "objectAtIndex:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setObject:forKey:", v9, CFSTR("accessed"));
    -[NSMutableArray removeObjectAtIndex:](self->_manifest, "removeObjectAtIndex:", v13);
    -[NSMutableArray insertObject:atIndex:](self->_manifest, "insertObject:atIndex:", v15, 0);
    -[SBFFileCache _queue_evictIfNeededUsingStore:](self, "_queue_evictIfNeededUsingStore:", v16);
    -[SBFFileCache _queue_saveManifestUsingStore:](self, "_queue_saveManifestUsingStore:", v16);
  }

}

uint64_t __78__SBFFileCache__queue_updateManifestForLoadedFileWrapper_filename_usingStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("filename"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_queue_removeManifestEntryForFilename:(id)a3 usingStore:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *manifest;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  manifest = self->_manifest;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SBFFileCache__queue_removeManifestEntryForFilename_usingStore___block_invoke;
  v11[3] = &unk_1E200EB40;
  v10 = v6;
  v12 = v10;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](manifest, "indexOfObjectPassingTest:", v11);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_manifest, "removeObjectAtIndex:", v9);
    -[SBFFileCache _queue_evictIfNeededUsingStore:](self, "_queue_evictIfNeededUsingStore:", v7);
    -[SBFFileCache _queue_saveManifestUsingStore:](self, "_queue_saveManifestUsingStore:", v7);
  }

}

uint64_t __65__SBFFileCache__queue_removeManifestEntryForFilename_usingStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("filename"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_queue_evictIfNeededUsingStore:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  id v17;
  NSMutableArray *manifest;
  double v19;
  double v20;
  id v21;
  NSMutableArray *v22;
  id v23;
  double v24;
  double v25;
  id v26;
  NSMutableArray *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  double v32;
  _QWORD v33[4];
  id v34;
  double v35;
  _QWORD v36[4];
  NSMutableArray *v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD v41[4];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v4 = -[SBFFileCache maxTotalFileCount](self, "maxTotalFileCount");
  if (v4)
  {
    v5 = v4;
    v6 = -[NSMutableArray count](self->_manifest, "count");
    if (v6 > v5)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v5, v6 - v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFFileCache _queue_evictFilesAtManifestIndexes:usingStore:](self, "_queue_evictFilesAtManifestIndexes:usingStore:", v7, v29);

    }
  }
  v8 = -[SBFFileCache maxTotalFileSize](self, "maxTotalFileSize");
  if (v8)
  {
    v9 = v8;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = self->_manifest;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (!v11)
    {
LABEL_14:

      goto LABEL_15;
    }
    v12 = 0;
    v13 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "objectForKey:", CFSTR("size"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntegerValue");

        v12 += v16;
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v11);

    if (v12 > v9)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v41[3] = 0;
      manifest = self->_manifest;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke;
      v36[3] = &unk_1E200EB68;
      v10 = (NSMutableArray *)v17;
      v37 = v10;
      v38 = v41;
      v39 = v12;
      v40 = v9;
      -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](manifest, "enumerateObjectsWithOptions:usingBlock:", 2, v36);
      -[SBFFileCache _queue_evictFilesAtManifestIndexes:usingStore:](self, "_queue_evictFilesAtManifestIndexes:usingStore:", v10, v29);

      _Block_object_dispose(v41, 8);
      goto LABEL_14;
    }
  }
LABEL_15:
  -[SBFFileCache maxAllowedTimeSinceLastAccess](self, "maxAllowedTimeSinceLastAccess");
  v20 = v19;
  if (v19 > 0.0)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v22 = self->_manifest;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_2;
    v33[3] = &unk_1E200EB90;
    v35 = v20;
    v34 = v21;
    v23 = v21;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v22, "enumerateObjectsWithOptions:usingBlock:", 2, v33);
    -[SBFFileCache _queue_evictFilesAtManifestIndexes:usingStore:](self, "_queue_evictFilesAtManifestIndexes:usingStore:", v23, v29);

  }
  -[SBFFileCache maxAllowedTimeSinceGeneration](self, "maxAllowedTimeSinceGeneration");
  v25 = v24;
  if (v24 > 0.0)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v27 = self->_manifest;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_3;
    v30[3] = &unk_1E200EB90;
    v32 = v25;
    v31 = v26;
    v28 = v26;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v27, "enumerateObjectsWithOptions:usingBlock:", 2, v30);
    -[SBFFileCache _queue_evictFilesAtManifestIndexes:usingStore:](self, "_queue_evictFilesAtManifestIndexes:usingStore:", v28, v29);

  }
}

void __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)a1[4];
  v8 = a2;
  objc_msgSend(v7, "addIndex:", a3);
  objc_msgSend(v8, "objectForKey:", CFSTR("size"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v9, "unsignedIntegerValue");
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a1[6] - a1[7])
    *a4 = 1;

}

void __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  id v9;

  objc_msgSend(a2, "objectForKey:", CFSTR("accessed"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(v9, "timeIntervalSinceNow"), v7 = v9, v8 >= -*(double *)(a1 + 40)))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    v7 = v9;
  }

}

void __47__SBFFileCache__queue_evictIfNeededUsingStore___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  id v9;

  objc_msgSend(a2, "objectForKey:", CFSTR("generated"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(v9, "timeIntervalSinceNow"), v7 = v9, v8 >= -*(double *)(a1 + 40)))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    v7 = v9;
  }

}

- (void)_queue_evictFilesAtManifestIndexes:(id)a3 usingStore:(id)a4
{
  id v6;
  NSMutableArray *manifest;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  manifest = self->_manifest;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SBFFileCache__queue_evictFilesAtManifestIndexes_usingStore___block_invoke;
  v10[3] = &unk_1E200EBB8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  v8 = a3;
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](manifest, "enumerateObjectsAtIndexes:options:usingBlock:", v8, 0, v10);
  -[NSMutableArray removeObjectsAtIndexes:](self->_manifest, "removeObjectsAtIndexes:", v8);

}

uint64_t __62__SBFFileCache__queue_evictFilesAtManifestIndexes_usingStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_evictFileWithInfo:usingStore:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_queue_evictFileWithInfo:(id)a3 usingStore:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("filename"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileCache:removeFileWrapperNamed:", self, v8);

  -[SBFFileCache delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileCacheDidEvictFile:", self);

}

- (void)_queue_resetManifestUsingStore:(id)a3
{
  NSMutableArray *manifest;
  id v5;

  manifest = self->_manifest;
  v5 = a3;
  -[NSMutableArray removeAllObjects](manifest, "removeAllObjects");
  -[SBFFileCache _queue_saveManifestUsingStore:](self, "_queue_saveManifestUsingStore:", v5);

}

- (double)_queue_accessDateTimeAdjustment
{
  return self->_accessDateTimeAdjustment;
}

- (SBFFileCacheStore)store
{
  return self->_store;
}

- (SBFFileCacheFaultHandler)faultHandler
{
  return self->_faultHandler;
}

- (SBFFileCacheDelegate)delegate
{
  return (SBFFileCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)maxTotalFileSize
{
  return self->_maxTotalFileSize;
}

- (void)setMaxTotalFileSize:(unint64_t)a3
{
  self->_maxTotalFileSize = a3;
}

- (unint64_t)maxTotalFileCount
{
  return self->_maxTotalFileCount;
}

- (void)setMaxTotalFileCount:(unint64_t)a3
{
  self->_maxTotalFileCount = a3;
}

- (double)maxAllowedTimeSinceLastAccess
{
  return self->_maxAllowedTimeSinceLastAccess;
}

- (void)setMaxAllowedTimeSinceLastAccess:(double)a3
{
  self->_maxAllowedTimeSinceLastAccess = a3;
}

- (double)maxAllowedTimeSinceGeneration
{
  return self->_maxAllowedTimeSinceGeneration;
}

- (void)setMaxAllowedTimeSinceGeneration:(double)a3
{
  self->_maxAllowedTimeSinceGeneration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_faultHandler, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
