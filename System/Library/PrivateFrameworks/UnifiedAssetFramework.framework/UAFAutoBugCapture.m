@implementation UAFAutoBugCapture

+ (void)captureWithType:(id)a3 subType:(id)a4 context:(id)a5 logCategory:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = (objc_class *)MEMORY[0x24BEB3478];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_msgSend([v9 alloc], "initWithQueue:", 0);
  +[UAFAutoBugCapture captureWithType:subType:context:logCategory:withSDRDiagnosticReporter:](UAFAutoBugCapture, "captureWithType:subType:context:logCategory:withSDRDiagnosticReporter:", v13, v12, v11, v10, v14);

}

+ (void)captureWithType:(id)a3 subType:(id)a4 context:(id)a5 logCategory:(id)a6 withSDRDiagnosticReporter:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (+[UAFCommonUtilities isInternalInstall](UAFCommonUtilities, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "processName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("UnifiedAssetFramework"), v11, v12, v13, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315906;
      v20 = "+[UAFAutoBugCapture captureWithType:subType:context:logCategory:withSDRDiagnosticReporter:]";
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s Reporting failure to ABC.  Failure type: %@, subType: %@, context: %@", (uint8_t *)&v19, 0x2Au);
    }
    objc_msgSend(v15, "snapshotWithSignature:delay:events:payload:actions:reply:", v18, 0, 0, 0, 0, 0.0);

  }
}

@end
