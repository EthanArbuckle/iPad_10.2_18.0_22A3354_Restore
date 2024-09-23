@implementation WBSBundleTestResults

- (WBSBundleTestResults)initWithFileURL:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *internalQueue;
  NSMutableArray *v14;
  NSMutableArray *pendingReports;
  WBSBundleTestResults *v16;
  objc_super v18;

  v7 = a3;
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v18.receiver = self;
  v18.super_class = (Class)WBSBundleTestResults;
  self = -[WBSBundleTestResults init](&v18, sel_init);
  if (!self)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, a4);

  if (!v10)
    goto LABEL_7;
  objc_storeStrong((id *)&self->_fileURL, a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSFileTestsResults.%@.%p.internalQueue"), objc_opt_class(), self);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pendingReports = self->_pendingReports;
  self->_pendingReports = v14;

  self = self;
  v16 = self;
LABEL_8:

  return v16;
}

- (void)endTest:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__WBSBundleTestResults_endTest_inBundle___block_invoke;
  block[3] = &unk_1E4B2A5F8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __41__WBSBundleTestResults_endTest_inBundle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "safari_mapObjectsUsingBlock:", &__block_literal_global_7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v29;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
    goto LABEL_7;
  v7 = WBS_LOG_CHANNEL_PREFIXTest();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (v3)
      goto LABEL_7;
LABEL_13:
    v20 = v5;
    goto LABEL_11;
  }
  __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  if (!v3)
    goto LABEL_13;
LABEL_7:
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@_%@.plist"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v5;
  LOBYTE(v16) = objc_msgSend(v3, "writeToURL:options:error:", v19, 0, &v28);
  v20 = v28;

  if ((v16 & 1) == 0)
  {
    v21 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);
  }

LABEL_11:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");

}

uint64_t __41__WBSBundleTestResults_endTest_inBundle___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
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
  v31[2] = __128__WBSBundleTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke;
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

void __128__WBSBundleTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1[4] + 16);
  +[WBSTestResultsReport reportForActualResults:expectedResults:expectedResultsName:uniformTypeIdentifier:forStage:forTest:inBundle:](WBSTestResultsReport, "reportForActualResults:expectedResults:expectedResultsName:uniformTypeIdentifier:forStage:forTest:inBundle:", a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

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
  block[2] = __68__WBSBundleTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke;
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

void __68__WBSBundleTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1[4] + 16);
  +[WBSTestResultsReport reportForPerformance:forStage:forTest:inBundle:](WBSTestResultsReport, "reportForPerformance:forStage:forTest:inBundle:", a1[5], a1[6], a1[7], a1[8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

- (void)reportError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalQueue;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__WBSBundleTestResults_reportError_forStage_forTest_inBundle___block_invoke;
    block[3] = &unk_1E4B2A648;
    block[4] = self;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = v13;
    dispatch_async(internalQueue, block);

  }
}

void __62__WBSBundleTestResults_reportError_forStage_forTest_inBundle___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1[4] + 16);
  +[WBSTestResultsReport reportForError:forStage:forTest:inBundle:](WBSTestResultsReport, "reportForError:forStage:forTest:inBundle:", a1[5], a1[6], a1[7], a1[8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

- (void)flushWithCompletionHandler:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_internalQueue, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_pendingReports, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Failed to write reports: %{private}@", a5, a6, a7, a8, 3u);
}

void __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Failed to serialize reports: %{private}@", a5, a6, a7, a8, 3u);
}

@end
