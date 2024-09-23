@implementation OSADiagnosticsReporterSupport

+ (void)handleDiagnosticLog:(int64_t)a3 logPath:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[16];
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (seedFeedbackPromptingEnabled())
  {
    if (!DiagnosticsReporterServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E4DEDA68;
      v21 = 0;
      DiagnosticsReporterServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (DiagnosticsReporterServicesLibraryCore_frameworkLibrary)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v9 = (void *)getOSADiagnosticsReporterClass_softClass;
      v19 = getOSADiagnosticsReporterClass_softClass;
      if (!getOSADiagnosticsReporterClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        v21 = __getOSADiagnosticsReporterClass_block_invoke;
        v22 = &unk_1E4DEDA88;
        v23 = &v16;
        __getOSADiagnosticsReporterClass_block_invoke((uint64_t)buf);
        v9 = (void *)v17[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v16, 8);
      handleDiagnosticLog_logPath_completion__OSADiagnosticsReporterClass = (uint64_t)v10;
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v11 = (void *)getDiagnosticsReporterLaunchOptionsClass_softClass;
      v19 = getDiagnosticsReporterLaunchOptionsClass_softClass;
      if (!getDiagnosticsReporterLaunchOptionsClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        v21 = __getDiagnosticsReporterLaunchOptionsClass_block_invoke;
        v22 = &unk_1E4DEDA88;
        v23 = &v16;
        __getDiagnosticsReporterLaunchOptionsClass_block_invoke((uint64_t)buf);
        v11 = (void *)v17[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v16, 8);
      handleDiagnosticLog_logPath_completion__DiagnosticsReporterLaunchOptionsClass = (uint64_t)v12;
      if (objc_opt_class() && objc_opt_class())
      {
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setLog_path:", v7, v16);
        v14 = (void *)MEMORY[0x1A85A8184](v8);
        v15 = v14;
        if (!v8)
        {

          v15 = &__block_literal_global_0;
        }
        objc_msgSend((id)handleDiagnosticLog_logPath_completion__OSADiagnosticsReporterClass, "launchAppWith:options:completion:", a3, v13, v15);

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        +[OSADiagnosticsReporterSupport handleDiagnosticLog:logPath:completion:].cold.1();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "DiagnosticsReporterServices.framework is unavailable", buf, 2u);
    }
  }

}

void __72__OSADiagnosticsReporterSupport_handleDiagnosticLog_logPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __72__OSADiagnosticsReporterSupport_handleDiagnosticLog_logPath_completion___block_invoke_cold_1(v2);

}

+ (void)handleDiagnosticLog:logPath:completion:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "DiagnosticsReporter or DiagnosticsReporterLaunchOptions class not found.", v0, 2u);
}

void __72__OSADiagnosticsReporterSupport_handleDiagnosticLog_logPath_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to launch DR with error: %@", (uint8_t *)&v2, 0xCu);

}

@end
