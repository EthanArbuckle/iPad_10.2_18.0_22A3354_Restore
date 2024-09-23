@implementation WBSFifoTestResults

- (WBSFifoTestResults)initWithFifoURL:(id)a3 error:(id *)a4
{
  id v6;
  WBSFifoTestResults *v7;
  WBSFifoTestResults *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *internalQueue;
  NSObject *v12;
  WBSFifoTestResults *v13;
  WBSFifoTestResults *v14;
  _QWORD block[4];
  WBSFifoTestResults *v17;
  id v18;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSFifoTestResults;
  v7 = -[WBSFifoTestResults init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_fifoURL, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSFifoTestResults.%@.%p.internalQueue"), objc_opt_class(), v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v10;

    v12 = v8->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke;
    block[3] = &unk_1E4B2A118;
    v13 = v8;
    v17 = v13;
    v18 = v6;
    dispatch_async(v12, block);
    v14 = v13;

  }
  return v8;
}

void __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 40);
  v1 = (uint64_t *)(a1 + 40);
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v2, &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = *(v1 - 1);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v3;

  if (*(_QWORD *)(*(v1 - 1) + 24))
    v7 = v4 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke_cold_1(v1, (uint64_t)v4, v8);
  }

}

+ (BOOL)createFifoAtFileURL:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  int v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    if (!a4)
    {
LABEL_8:
      v9 = 0;
      goto LABEL_9;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2FE0];
    v22 = *MEMORY[0x1E0CB32F0];
    v23[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    v15 = v18;
    v16 = 45;
LABEL_7:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");

  v8 = mkfifo(v7, 0x180u);
  v9 = v8 == 0;
  if (a4 && v8)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2FE0];
    v12 = *__error();
    v20 = *MEMORY[0x1E0CB32F0];
    v21 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    v15 = v11;
    v16 = v12;
    goto LABEL_7;
  }
LABEL_9:

  return v9;
}

+ (id)readReportFromFifoHandle:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  WBSTestResultsReport *v8;

  v5 = a3;
  objc_msgSend(v5, "fileDescriptor");
  if (WBSReadExactAmountOfBytesFromFileDescriptor() <= 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(v5, "fileDescriptor");
    WBSReadExactAmountOfBytesFromFileDescriptorAsNSData();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = -[WBSTestResultsReport initWithDictionaryRepresentation:]([WBSTestResultsReport alloc], "initWithDictionaryRepresentation:", v7);
      else
        v8 = 0;

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)_writeReportToFifo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  if (self->_fifoHandle)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(a3, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;

    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      -[NSFileHandle fileDescriptor](self->_fifoHandle, "fileDescriptor");
      v25 = objc_msgSend(v6, "length");
      WBSWriteExactAmountOfBytesToFileDescriptor();
      objc_msgSend(objc_retainAutorelease(v6), "bytes", v25);
      WBSWriteExactAmountOfBytesToFileDescriptor();
    }
    else
    {
      v9 = WBS_LOG_CHANNEL_PREFIXTest();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WBSFifoTestResults _writeReportToFifo:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
    }

  }
  else
  {
    v17 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[WBSFifoTestResults _writeReportToFifo:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
  }
}

- (void)reportActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *internalQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a4;
  v21 = (void *)objc_msgSend(a3, "copy");
  v22 = (void *)objc_msgSend(v20, "copy");

  internalQueue = self->_internalQueue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __126__WBSFifoTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke;
  v31[3] = &unk_1E4B2A620;
  v31[4] = self;
  v32 = v21;
  v33 = v22;
  v34 = v15;
  v35 = v16;
  v36 = v17;
  v37 = v18;
  v38 = v19;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v15;
  v29 = v22;
  v30 = v21;
  dispatch_async(internalQueue, v31);

}

void __126__WBSFifoTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = (void *)a1[4];
  +[WBSTestResultsReport reportForActualResults:expectedResults:expectedResultsName:uniformTypeIdentifier:forStage:forTest:inBundle:](WBSTestResultsReport, "reportForActualResults:expectedResults:expectedResultsName:uniformTypeIdentifier:forStage:forTest:inBundle:", a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeReportToFifo:", v2);

}

- (void)reportPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(a3, "copy");
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WBSFifoTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke;
  block[3] = &unk_1E4B2A648;
  block[4] = self;
  v20 = v13;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(internalQueue, block);

}

void __66__WBSFifoTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = (void *)a1[4];
  +[WBSTestResultsReport reportForPerformance:forStage:forTest:inBundle:](WBSTestResultsReport, "reportForPerformance:forStage:forTest:inBundle:", a1[5], a1[6], a1[7], a1[8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeReportToFifo:", v2);

}

- (void)reportError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSFifoTestResults_reportError_forStage_forTest_inBundle___block_invoke;
  block[3] = &unk_1E4B2A648;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(internalQueue, block);

}

void __60__WBSFifoTestResults_reportError_forStage_forTest_inBundle___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = (void *)a1[4];
  +[WBSTestResultsReport reportForError:forStage:forTest:inBundle:](WBSTestResultsReport, "reportForError:forStage:forTest:inBundle:", a1[5], a1[6], a1[7], a1[8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeReportToFifo:", v2);

}

- (void)flushWithCompletionHandler:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_internalQueue, a3);
}

- (NSURL)fifoURL
{
  return self->_fifoURL;
}

- (NSFileHandle)fifoHandle
{
  return self->_fifoHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fifoHandle, 0);
  objc_storeStrong((id *)&self->_fifoURL, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Can't open fifo %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_writeReportToFifo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "FIFO is not connected", a5, a6, a7, a8, 0);
}

- (void)_writeReportToFifo:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Failed to serialize report", a5, a6, a7, a8, 0);
}

@end
