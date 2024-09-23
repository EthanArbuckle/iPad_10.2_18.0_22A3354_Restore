@implementation PXVisualDiagnosticsConfiguration(Diagnostics)

- (void)collectTapToRadarDiagnosticsIntoContainer:()Diagnostics
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(a1, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("Visual Diagnostics");
  objc_msgSend(v4, "beginCollectionOperationWithName:timeout:", v7, 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__PXVisualDiagnosticsConfiguration_Diagnostics__collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  v11[3] = &unk_1E513F750;
  v12 = v4;
  v13 = v8;
  v9 = v8;
  v10 = v4;
  +[PXVisualDiagnosticsFactory requestVisualDiagnosticsPDFDocumentURLWithConfiguration:resultHandler:](PXVisualDiagnosticsFactory, "requestVisualDiagnosticsPDFDocumentURLWithConfiguration:resultHandler:", a1, v11);

}

@end
