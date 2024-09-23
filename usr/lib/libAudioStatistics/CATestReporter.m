@implementation CATestReporter

- (CATestReporter)initWithNewReporterID
{
  CATestReporter *v3;
  CATestReporter *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  CATestReporter *v9;
  objc_super v11;
  objc_super v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v13.receiver = self;
    v13.super_class = (Class)CATestReporter;
    v3 = -[CAReporter initWithNewReporterID](&v13, sel_initWithNewReporterID);
    v4 = v3;
    if (v3)
    {
      v12.receiver = v3;
      v12.super_class = (Class)CATestReporter;
      -[CAReporter setServiceType:](&v12, sel_setServiceType_, 11);
    }
  }
  else
  {
    v5 = objc_retainAutorelease(*(id *)AA_ClientCategory());
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "CAReportingClient.mm";
      v16 = 1024;
      v17 = 478;
      _os_log_impl(&dword_18F18F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CATestReporter initWithNewReporterID called", buf, 0x12u);
    }
    v11.receiver = self;
    v11.super_class = (Class)CATestReporter;
    v4 = -[CAReporter initWithNewReporterID](&v11, sel_initWithNewReporterID);
    if (v4)
    {
      v6 = objc_retainAutorelease(*(id *)AA_ClientCategory());
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = -[CAReporter reporterID](v4, "reporterID");
        *(_DWORD *)buf = 136315650;
        v15 = "CAReportingClient.mm";
        v16 = 1024;
        v17 = 482;
        v18 = 2048;
        v19 = v7;
        _os_log_impl(&dword_18F18F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CATestReporter initWithNewReporterID { careporter_id=%lli }", buf, 0x1Cu);
      }

      +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setServiceType:reporterID:", 11, -[CAReporter reporterID](v4, "reporterID"));

    }
  }
  v9 = v4;

  return v9;
}

@end
