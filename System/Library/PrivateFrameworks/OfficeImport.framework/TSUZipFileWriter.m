@implementation TSUZipFileWriter

- (TSUZipFileWriter)initWithURL:(id)a3 error:(id *)a4
{
  return -[TSUZipFileWriter initWithURL:options:error:](self, "initWithURL:options:error:", a3, 0, a4);
}

- (TSUZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  TSUZipFileWriter *v9;
  TSUFileIOChannel *v10;
  uint64_t v11;
  TSURandomWriteChannel *writeChannel;
  TSURandomWriteChannel *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TSUZipFileWriter;
  v9 = -[TSUZipWriter initWithOptions:](&v21, sel_initWithOptions_, a4);
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = [TSUFileIOChannel alloc];
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __46__TSUZipFileWriter_initWithURL_options_error___block_invoke;
    v18 = &unk_24F39BF78;
    objc_copyWeak(&v19, &location);
    v11 = -[TSUFileIOChannel initForRandomWritingURL:error:cleanupHandler:](v10, "initForRandomWritingURL:error:cleanupHandler:", v8, a5, &v15);
    writeChannel = v9->_writeChannel;
    v9->_writeChannel = (TSURandomWriteChannel *)v11;

    v13 = v9->_writeChannel;
    if (v13)
    {
      -[TSURandomWriteChannel setLowWater:](v13, "setLowWater:", -1, v15, v16, v17, v18);
    }
    else
    {

      v9 = 0;
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __46__TSUZipFileWriter_initWithURL_options_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[22];
    v5 = v2;
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v2 = v5;
      v4 = (void *)v5[22];
    }
    else
    {
      v4 = 0;
    }
    v2[22] = 0;

    v2 = v5;
  }

}

- (TSUZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4
{
  return -[TSUZipFileWriter initWithZipFileArchive:options:error:](self, "initWithZipFileArchive:options:error:", a3, 0, a4);
}

- (TSUZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  TSUZipFileWriter *v10;
  uint64_t v11;
  TSUZipFileWriter *v12;
  void *v13;
  void *v14;
  TSUFileIOChannel *v15;
  id *v16;
  uint64_t v17;
  TSURandomWriteChannel *writeChannel;
  TSURandomWriteChannel *v19;
  dispatch_semaphore_t v20;
  TSURandomWriteChannel *v21;
  uint64_t v22;
  NSObject *v23;
  TSUZipFileWriter *v24;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  id obj;
  id location;
  _QWORD v33[4];
  TSUZipFileWriter *v34;
  objc_super v35;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__13;
  v40 = __Block_byref_object_dispose__13;
  v41 = 0;
  v35.receiver = self;
  v35.super_class = (Class)TSUZipFileWriter;
  v10 = -[TSUZipWriter initWithOptions:](&v35, sel_initWithOptions_, a4);
  if (!v10)
  {
    v12 = 0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v11 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke;
  v33[3] = &unk_24F39BFA0;
  v12 = v10;
  v34 = v12;
  objc_msgSend(v8, "enumerateEntriesUsingBlock:", v33);
  if (objc_msgSend(v8, "endOfLastEntry") <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileWriter initWithZipFileArchive:options:error:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 69, 0, "Unexpected offset");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  -[TSUZipWriter setEntryInsertionOffset:](v12, "setEntryInsertionOffset:", objc_msgSend(v8, "endOfLastEntry"));
  objc_initWeak(&location, v12);
  v15 = [TSUFileIOChannel alloc];
  v16 = v37;
  obj = v37[5];
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_2;
  v29[3] = &unk_24F39BF78;
  objc_copyWeak(&v30, &location);
  v17 = -[TSUFileIOChannel initForRandomReadingWritingURL:error:cleanupHandler:](v15, "initForRandomReadingWritingURL:error:cleanupHandler:", v9, &obj, v29);
  objc_storeStrong(v16 + 5, obj);
  writeChannel = v12->_writeChannel;
  v12->_writeChannel = (TSURandomWriteChannel *)v17;

  v19 = v12->_writeChannel;
  if (v19)
  {
    -[TSURandomWriteChannel setLowWater:](v19, "setLowWater:", -1);
    v20 = dispatch_semaphore_create(0);
    v21 = v12->_writeChannel;
    v22 = objc_msgSend(v8, "endOfLastEntry");
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_3;
    v26[3] = &unk_24F39BFC8;
    v28 = &v36;
    v23 = v20;
    v27 = v23;
    -[TSURandomWriteChannel truncateToLength:completion:](v21, "truncateToLength:completion:", v22, v26);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (v37[5])
  {

    v12 = 0;
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  if (a5)
LABEL_9:
    *a5 = objc_retainAutorelease(v37[5]);
LABEL_10:
  v24 = v12;
  _Block_object_dispose(&v36, 8);

  return v24;
}

uint64_t __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addExistingEntry:");
}

void __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[22];
    v5 = v2;
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v2 = v5;
      v4 = (void *)v5[22];
    }
    else
    {
      v4 = 0;
    }
    v2[22] = 0;

    v2 = v5;
  }

}

void __57__TSUZipFileWriter_initWithZipFileArchive_options_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  TSUZipFileArchive *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id))a6;
  if ((objc_msgSend(v10, "isClosed") & 1) != 0)
  {
    v30 = 0;
    v13 = -[TSUZipFileArchive initWithWriter:forReadingFromURL:options:error:]([TSUZipFileArchive alloc], "initWithWriter:forReadingFromURL:options:error:", v10, v11, a5, &v30);
    v14 = v30;
    v15 = v14;
    if (v13)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[TSUZipArchive entriesCount](v13, "entriesCount"));
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __90__TSUZipFileWriter_copyEntriesFromZipFileWriter_readingFromURL_options_completionHandler___block_invoke;
      v23[3] = &unk_24F39BFF0;
      v17 = v16;
      v24 = v17;
      v25 = &v26;
      -[TSUZipArchive enumerateEntriesUsingBlock:](v13, "enumerateEntriesUsingBlock:", v23);
      objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_28);
      objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", v27[3]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSUZipFileWriter copyRemainingEntries:fromArchive:progress:completionHandler:](self, "copyRemainingEntries:fromArchive:progress:completionHandler:", v17, v13, v18, v12);

      _Block_object_dispose(&v26, 8);
    }
    else if (v12)
    {
      if (v14)
      {
        v12[2](v12, v14);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v22);

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileWriter copyEntriesFromZipFileWriter:readingFromURL:options:completionHandler:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 112, 0, "Closed writer must be closed.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v21);

    }
  }

}

void __90__TSUZipFileWriter_copyEntriesFromZipFileWriter_readingFromURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "addObject:", v5);
  v6 = objc_msgSend(v5, "size");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6;
}

uint64_t __90__TSUZipFileWriter_copyEntriesFromZipFileWriter_readingFromURL_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  TSUZipFileWriter *v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    objc_msgSend(v11, "streamReadChannelForEntry:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v14, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastModificationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v14, "size");
      v18 = objc_msgSend(v14, "CRC");
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __80__TSUZipFileWriter_copyRemainingEntries_fromArchive_progress_completionHandler___block_invoke;
      v23[3] = &unk_24F39C058;
      v29 = v13;
      v24 = v12;
      v25 = v14;
      v26 = self;
      v27 = v10;
      v28 = v11;
      -[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:](self, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:completion:", v16, 0, v17, v22, v18, v15, v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileWriter copyRemainingEntries:fromArchive:progress:completionHandler:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 156, 0, "invalid nil value for '%{public}s'", "channel");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v13 + 2))(v13, v21);

      }
    }

  }
  else if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __80__TSUZipFileWriter_copyRemainingEntries_fromArchive_progress_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + objc_msgSend(*(id *)(a1 + 40), "size"));
    objc_msgSend(*(id *)(a1 + 48), "copyRemainingEntries:fromArchive:progress:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 72);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

    }
  }
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id writeChannelCompletionHandler;
  TSURandomWriteChannel *writeChannel;
  void *v10;
  void *v11;
  TSURandomWriteChannel *v12;

  v4 = a3;
  if (self->_writeChannelCompletionHandler)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 177, 0, "expected nil value for '%{public}s'", "_writeChannelCompletionHandler");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v7 = (void *)objc_msgSend(v4, "copy");
  writeChannelCompletionHandler = self->_writeChannelCompletionHandler;
  self->_writeChannelCompletionHandler = v7;

  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileWriter prepareWriteChannelWithCloseCompletionHandler:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 180, 0, "invalid nil value for '%{public}s'", "_writeChannel");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    writeChannel = self->_writeChannel;
  }
  v12 = writeChannel;

  return v12;
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  -[TSURandomWriteChannel truncateToLength:completion:](self->_writeChannel, "truncateToLength:completion:", a3, a4);
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke;
  v12[3] = &unk_24F39C080;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:", a3, 0, a4, a5, v12);

}

void __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;

  v7 = a5;
  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = v7;
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v7 == 0);
      v7 = v9;
    }
  }

}

+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  int v35;
  id v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  TSUFileIOChannel *v54;
  id *v55;
  id v56;
  char v57;
  id v58;
  void *v59;
  char v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *queue;
  id v70;
  id v71;
  TSUZipFileWriter *v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  _QWORD v79[4];
  id v80;
  uint64_t *v81;
  uint64_t v82;
  _QWORD v83[4];
  id v84;
  _QWORD *v85;
  uint64_t *v86;
  uint64_t v87;
  id v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  _QWORD block[4];
  id v109;
  id v110;
  id v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _QWORD v114[4];

  v114[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v71 = a4;
  v12 = a5;
  queue = a6;
  v73 = a7;
  v67 = v11;
  v68 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 199, 0, "invalid nil value for '%{public}s'", "directoryURL");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    if (v68)
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 200, 0, "invalid nil value for '%{public}s'", "URL");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_6:
  if (!queue)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 201, 0, "invalid nil value for '%{public}s'", "queue");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (!v73)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 202, 0, "invalid nil value for '%{public}s'", "progressHandler");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v111 = 0;
  v72 = -[TSUZipFileWriter initWithURL:error:]([TSUZipFileWriter alloc], "initWithURL:error:", v68, &v111);
  v21 = v111;
  v66 = v21;
  if (v72)
  {
    objc_msgSend(v11, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v71)
    {
      objc_msgSend(v22, "stringByDeletingLastPathComponent");
      v24 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v24;
    }
    objc_msgSend(v23, "stringByStandardizingPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "precomposedStringWithCanonicalMapping");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = objc_msgSend(v65, "length");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BDBCC60];
    v28 = *MEMORY[0x24BDBCC48];
    v114[0] = *MEMORY[0x24BDBCC60];
    v114[1] = v28;
    v76 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v29, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v107[0] = 0;
    v107[1] = v107;
    v107[2] = 0x2020000000;
    v107[3] = 0;
    v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    obj = v30;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
    if (v31)
    {
      v77 = 0;
      v32 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v104 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
          v102 = 0;
          v35 = objc_msgSend(v34, "getResourceValue:forKey:error:", &v102, v27, 0);
          v36 = v102;
          v37 = v36;
          if (v35)
          {
            if ((objc_msgSend(v36, "BOOLValue") & 1) == 0)
            {
              v101 = 0;
              v38 = objc_msgSend(v34, "getResourceValue:forKey:error:", &v101, v76, 0);
              v39 = v101;
              v40 = v39;
              if (v38)
                v77 += objc_msgSend(v39, "unsignedLongLongValue");
              objc_msgSend(v74, "addObject:", v34);

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:customDirectoryFilename:toURL:queue:progressHandler:]");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileWriter.m");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v41, v42, 239, 0, "Failed to obtain resource value for %@", v34);

            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
      }
      while (v31);
    }
    else
    {
      v77 = 0;
    }

    v95 = 0;
    v96 = &v95;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__13;
    v99 = __Block_byref_object_dispose__13;
    v100 = 0;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v70 = v74;
    v45 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v92;
      v75 = *MEMORY[0x24BDBCBE0];
      while (2)
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v92 != v46)
            objc_enumerationMutation(v70);
          v48 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
          objc_msgSend(v48, "path");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringByStandardizingPath");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "precomposedStringWithCanonicalMapping");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "substringFromIndex:", v64 + 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v71)
          {
            objc_msgSend(v71, "stringByAppendingPathComponent:", v52);
            v53 = objc_claimAutoreleasedReturnValue();

            v52 = (void *)v53;
          }
          v54 = [TSUFileIOChannel alloc];
          v55 = (id *)(v96 + 5);
          v90 = (id)v96[5];
          v56 = -[TSUFileIOChannel initForReadingURL:error:](v54, "initForReadingURL:error:", v48, &v90);
          objc_storeStrong(v55, v90);
          if (!v56)
          {

            goto LABEL_45;
          }
          v89 = 0;
          v57 = objc_msgSend(v48, "getResourceValue:forKey:error:", &v89, v76, 0);
          v58 = v89;
          v59 = v58;
          if ((v57 & 1) == 0)
          {

            v59 = 0;
          }
          v88 = 0;
          v60 = objc_msgSend(v48, "getResourceValue:forKey:error:", &v88, v75, 0);
          v61 = v88;
          v62 = v61;
          if ((v60 & 1) == 0)
          {

            v62 = 0;
          }
          v63 = objc_msgSend(v59, "unsignedLongLongValue");
          v83[0] = MEMORY[0x24BDAC760];
          v83[1] = 3221225472;
          v83[2] = __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_2;
          v83[3] = &unk_24F39C0A8;
          v85 = v107;
          v84 = v73;
          v86 = &v95;
          v87 = v77;
          -[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:](v72, "writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:", v52, 0, v62, v63, 0, v56, v83);

        }
        v45 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
        if (v45)
          continue;
        break;
      }
    }
LABEL_45:

    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_3;
    v79[3] = &unk_24F39C0D0;
    v80 = v73;
    v81 = &v95;
    v82 = v77;
    -[TSUZipWriter closeWithQueue:completion:](v72, "closeWithQueue:completion:", queue, v79);

    _Block_object_dispose(&v95, 8);
    _Block_object_dispose(v107, 8);

    v44 = v65;
  }
  else
  {
    v43 = v21;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke;
    block[3] = &unk_24F39BAB0;
    v110 = v73;
    v109 = v43;
    dispatch_async(queue, block);

    v44 = v110;
  }

}

uint64_t __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke(uint64_t a1)
{
  char v2;

  v2 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, char *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, 0, *(_QWORD *)(a1 + 32), &v2);
}

void __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_2(_QWORD *a1, uint64_t a2, NSObject *a3, void *a4, _BYTE *a5)
{
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;

  v12 = a4;
  if (a3)
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += dispatch_data_get_size(a3);
  (*(void (**)(void))(a1[4] + 16))();
  v8 = v12;
  if (!v12 && *a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    v11 = *(_QWORD *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11)
    {
      v13 = v8;
      objc_storeStrong(v10, v8);
      v8 = v13;
    }
  }

}

void __90__TSUZipFileWriter_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;

  v2 = a2;
  v7 = 0;
  v4 = a1[4];
  if (!a2)
    v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))(v4 + 16))(v4, 1, a1[6], a1[6], v2, &v7);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeChannelCompletionHandler, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end
