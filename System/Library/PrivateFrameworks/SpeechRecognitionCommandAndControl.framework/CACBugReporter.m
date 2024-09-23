@implementation CACBugReporter

+ (id)sharedReporter
{
  if (sharedReporter_onceToken != -1)
    dispatch_once(&sharedReporter_onceToken, &__block_literal_global_49);
  return (id)sharedReporter_sDiagnosticReporter;
}

void __32__CACBugReporter_sharedReporter__block_invoke()
{
  CACBugReporter *v0;
  void *v1;

  v0 = objc_alloc_init(CACBugReporter);
  v1 = (void *)sharedReporter_sDiagnosticReporter;
  sharedReporter_sDiagnosticReporter = (uint64_t)v0;

}

- (CACBugReporter)init
{
  CACBugReporter *v2;
  SDRDiagnosticReporter *v3;
  SDRDiagnosticReporter *diagnosticReporter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACBugReporter;
  v2 = -[CACBugReporter init](&v6, sel_init);
  if (v2)
  {
    v3 = (SDRDiagnosticReporter *)objc_alloc_init(MEMORY[0x24BEB3470]);
    diagnosticReporter = v2->_diagnosticReporter;
    v2->_diagnosticReporter = v3;

  }
  return v2;
}

- (void)reportIssue:(id)a3 subtype:(id)a4 description:(id)a5 completionBlock:(id)a6
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
  id v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CACBugReporter diagnosticReporter](self, "diagnosticReporter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Command and Control"), v13, v12, v11, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACBugReporter diagnosticReporter](self, "diagnosticReporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke;
  v22[3] = &unk_24F2AD6B0;
  v23 = v17;
  v24 = v10;
  v19 = v10;
  v20 = v17;
  LOBYTE(v12) = objc_msgSend(v18, "snapshotWithSignature:duration:events:payload:actions:reply:", v20, 0, 0, 0, v22, 10.0);

  if ((v12 & 1) == 0)
  {
    CACLogGeneral();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CACBugReporter reportIssue:subtype:description:completionBlock:].cold.1(v21);

  }
}

void __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CACLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke_cold_1((uint64_t)v3, a1, v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)reportIssue:(id)a3 subtype:(id)a4 description:(id)a5
{
  -[CACBugReporter reportIssue:subtype:description:completionBlock:](self, "reportIssue:subtype:description:completionBlock:", a3, a4, a5, 0);
}

- (SDRDiagnosticReporter)diagnosticReporter
{
  return (SDRDiagnosticReporter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiagnosticReporter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticReporter, 0);
}

- (void)reportIssue:(os_log_t)log subtype:description:completionBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter payload invalid.", v1, 2u);
}

void __66__CACBugReporter_reportIssue_subtype_description_completionBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_229A40000, log, OS_LOG_TYPE_DEBUG, "SDRDiagnosticReporter response = %@, issue = %@", (uint8_t *)&v4, 0x16u);
}

@end
