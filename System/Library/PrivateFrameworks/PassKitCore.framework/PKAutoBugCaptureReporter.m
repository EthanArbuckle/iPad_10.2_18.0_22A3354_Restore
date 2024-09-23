@implementation PKAutoBugCaptureReporter

- (void)reportIssueWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6 payload:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  SDRDiagnosticReporter *sdrReporter;
  SDRDiagnosticReporter *v23;
  SDRDiagnosticReporter *v24;
  void *v25;
  NSObject *v26;
  SDRDiagnosticReporter *v27;
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!-[PKAutoBugCaptureReporter isRunningUnitTests](self, "isRunningUnitTests"))
  {
    if (-[PKAutoBugCaptureReporter shouldReportIssueOfType:](self, "shouldReportIssueOfType:", v13))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "processName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bundleIdentifier");
        v20 = objc_claimAutoreleasedReturnValue();

      }
      sdrReporter = self->sdrReporter;
      if (!sdrReporter)
      {
        v23 = (SDRDiagnosticReporter *)objc_alloc_init(MEMORY[0x1E0DAFF28]);
        v24 = self->sdrReporter;
        self->sdrReporter = v23;

        sdrReporter = self->sdrReporter;
      }
      -[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](sdrReporter, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", v12, v13, v14, v15, v20, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(4uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v30 = v12;
        v31 = 2112;
        v32 = v13;
        v33 = 2112;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_INFO, "AutoBugCapture - Submitting snapshot request to ABC for signature: %@.%@.%@.%@", buf, 0x2Au);
      }

      v27 = self->sdrReporter;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __86__PKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke;
      v28[3] = &unk_1E2AC9B98;
      v28[4] = self;
      -[SDRDiagnosticReporter snapshotWithSignature:duration:event:payload:reply:](v27, "snapshotWithSignature:duration:event:payload:reply:", v25, 0, v16, v28, 0.0);

    }
    else
    {
      PKLogFacilityTypeGetObject(4uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v30 = v12;
        v31 = 2112;
        v32 = v13;
        v33 = 2112;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_INFO, "AutoBugCapture - Not reporting to AutoBugCapture because we are rate limited: %@.%@.%@.%@", buf, 0x2Au);
      }
    }

  }
}

uint64_t __86__PKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleResponse:", a2);
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  const char *v13;
  int v14;
  _DWORD v15[7];

  *(_QWORD *)&v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0090]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0098]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKAutoBugCaptureReporter isExpectedFailureReason:](self, "isExpectedFailureReason:", v10);
    PKLogFacilityTypeGetObject(4uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (!v12)
        goto LABEL_8;
      v14 = 67109378;
      v15[0] = v10;
      LOWORD(v15[1]) = 2112;
      *(_QWORD *)((char *)&v15[1] + 2) = v7;
      v13 = "AutoBugCapture - Diagnostic reporter snapshot rejected with expected reason %d (%@)";
    }
    else
    {
      if (!v12)
        goto LABEL_8;
      v14 = 67109378;
      v15[0] = v10;
      LOWORD(v15[1]) = 2112;
      *(_QWORD *)((char *)&v15[1] + 2) = v7;
      v13 = "AutoBugCapture - Diagnostic reporter snapshot rejected with unexpected reason %d (%@)";
    }
    _os_log_error_impl(&dword_18FC92000, v8, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v14, 0x12u);
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(4uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    *(_QWORD *)v15 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_INFO, "AutoBugCapture - Diagnostic reporter snapshot accepted with sessionID %@", (uint8_t *)&v14, 0xCu);
  }
LABEL_8:

}

- (BOOL)isExpectedFailureReason:(int)a3
{
  return *MEMORY[0x1E0DAFFA0] == a3
      || *MEMORY[0x1E0DAFFA8] == a3
      || *MEMORY[0x1E0DAFF98] == a3
      || *MEMORY[0x1E0DAFFC0] == a3;
}

- (BOOL)shouldReportIssueOfType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_219);
  v5 = (void *)qword_1ECF22450;
  if (!qword_1ECF22450)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)qword_1ECF22450;
    qword_1ECF22450 = (uint64_t)v6;

    v5 = (void *)qword_1ECF22450;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v4, "timeIntervalSinceDate:", v8), v9 < 86400.0))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend((id)qword_1ECF22450, "setObject:forKeyedSubscript:", v4, v3);
    v10 = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_219);

  return v10;
}

- (BOOL)isRunningUnitTests
{
  return NSClassFromString(CFSTR("XCTest")) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sdrReporter, 0);
}

@end
