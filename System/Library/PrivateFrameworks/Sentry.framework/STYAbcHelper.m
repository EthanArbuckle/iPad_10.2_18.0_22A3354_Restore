@implementation STYAbcHelper

- (void)shareSeedDiagnosticsWithABC:(id)a3 tailspinFilenamePrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedSerialQueueAtUtility");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__STYAbcHelper_shareSeedDiagnosticsWithABC_tailspinFilenamePrefix___block_invoke;
  v11[3] = &unk_1E86A08D0;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

void __67__STYAbcHelper_shareSeedDiagnosticsWithABC_tailspinFilenamePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[8];

  v22[7] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0DE8B18];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "scenario");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "appProcessID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DE8B00];
  v6 = MEMORY[0x1E0C9AAB0];
  v22[0] = v4;
  v22[1] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0DE8AF0];
  v21[1] = v5;
  v21[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "scenarioStartTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  v21[3] = *MEMORY[0x1E0DE8AE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "scenarioEndTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DE8AD0];
  v22[3] = v9;
  v22[4] = v6;
  v11 = *MEMORY[0x1E0DE8B08];
  v21[4] = v10;
  v21[5] = v11;
  v21[6] = *MEMORY[0x1E0DE8B10];
  v22[5] = *(_QWORD *)(a1 + 40);
  v22[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "symptomsSignatureForReport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DB0060];
  v18 = v12;
  v19 = v14;
  v17 = CFSTR("com.apple.DiagnosticExtensions.tailspin");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _reportToAbc(v13, v16);
}

@end
