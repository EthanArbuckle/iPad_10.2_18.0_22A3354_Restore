@implementation OspreyAnalytics

+ (id)reporter
{
  if (reporter_sDispatchOnceToken != -1)
    dispatch_once(&reporter_sDispatchOnceToken, &__block_literal_global_3);
  return (id)reporter_oReporter;
}

void __27__OspreyAnalytics_reporter__block_invoke()
{
  OspreyAnalytics *v0;
  void *v1;

  v0 = objc_alloc_init(OspreyAnalytics);
  v1 = (void *)reporter_oReporter;
  reporter_oReporter = (uint64_t)v0;

}

- (void)reportEvent:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  OspreyLoggingInit();
  v7 = OspreyLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[OspreyAnalytics reportEvent:payload:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1B97C2000, v7, OS_LOG_TYPE_INFO, "%s Successfully reportEvent with domain %@ and payload %@", (uint8_t *)&v8, 0x20u);
  }
  AnalyticsSendEvent();

}

- (void)reportConnectionMetrics:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[8];
  _QWORD v32[9];

  v32[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v31[0] = CFSTR("ConnectionEstablishmentTime");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "connectionEstablishmentTime");
  objc_msgSend(v4, "numberWithDouble:", OspreyTimeIntervalToNanoseconds(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  v31[1] = CFSTR("DNSResolutionTime");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "dnsResolutionTime");
  objc_msgSend(v7, "numberWithDouble:", OspreyTimeIntervalToNanoseconds(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v9;
  v31[2] = CFSTR("ConnectionStartToTLSHandshake");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "tcpConnectTime");
  objc_msgSend(v10, "numberWithDouble:", OspreyTimeIntervalToNanoseconds(v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v12;
  v31[3] = CFSTR("TLSHandshakeTime");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "secureConnectionTime");
  objc_msgSend(v13, "numberWithDouble:", OspreyTimeIntervalToNanoseconds(v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v15;
  v31[4] = CFSTR("FetchStartToDNSResolution");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "fetchStartToDomainLookupStartTime");
  objc_msgSend(v16, "numberWithDouble:", OspreyTimeIntervalToNanoseconds(v17));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v18;
  v31[5] = CFSTR("FetchStartToFirstByte");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "fetchStartToFirstByteTime");
  objc_msgSend(v19, "numberWithDouble:", OspreyTimeIntervalToNanoseconds(v20));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v21;
  v31[6] = CFSTR("ConnectionMethod");
  objc_msgSend(v3, "connectionMethod");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v22;
  v31[7] = CFSTR("ConnectionState");
  v23 = objc_msgSend(v3, "connectionState");
  v24 = CFSTR("warm");
  if (!v23)
    v24 = CFSTR("cold");
  v32[7] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 8, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v3, "requestURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v3, "requestURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_addURL:toContext:", v28, v26);

  }
  objc_msgSend(v30, "reportEvent:payload:", CFSTR("com.apple.Osprey.ConnectionMetrics"), v26);

}

- (void)reportAbsintheMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("GetCertificateDuration");
  v4 = a3;
  objc_msgSend(v4, "getCertificateElapsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("CreateSessionDuration");
  objc_msgSend(v4, "createSessionElapsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("SessionEstablishedDuration");
  objc_msgSend(v4, "sessionEstablishedElapsed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("AbsintheAuthenticationDuration");
  objc_msgSend(v4, "absintheElapsed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  v11[4] = CFSTR("ConnectionMethod");
  objc_msgSend(v4, "connectionMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[OspreyAnalytics reportEvent:payload:](self, "reportEvent:payload:", CFSTR("com.apple.Osprey.AbsintheMetrics"), v10);
}

- (void)reportHttpStatus:(int64_t)a3 grpcStatus:(int64_t)a4 forURL:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v13[0] = CFSTR("httpStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("grpcStatus");
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v8)
    -[OspreyAnalytics _addURL:toContext:](self, "_addURL:toContext:", v8, v12);
  -[OspreyAnalytics reportEvent:payload:](self, "reportEvent:payload:", CFSTR("com.apple.Osprey.RequestStatus"), v12);

}

- (void)reportError:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v18[0] = CFSTR("domain");
      objc_msgSend(v6, "domain");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("Unknown");
      if (v9)
        v11 = (const __CFString *)v9;
      v19[0] = v11;
      v18[1] = CFSTR("code");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v12;
      v18[2] = CFSTR("reason");
      objc_msgSend(v6, "localizedFailureReason");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("None");
      if (v13)
        v15 = (const __CFString *)v13;
      v19[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      if (v7)
        -[OspreyAnalytics _addURL:toContext:](self, "_addURL:toContext:", v7, v17);
      -[OspreyAnalytics reportEvent:payload:](self, "reportEvent:payload:", CFSTR("com.apple.Osprey.Error"), v17);

    }
  }

}

- (void)_addURL:(id)a3 toContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11[0] = CFSTR("urlPath");
    v5 = a4;
    v6 = a3;
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v11[1] = CFSTR("urlHost");
    objc_msgSend(v6, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    v11[2] = CFSTR("urlScheme");
    objc_msgSend(v6, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v10);

  }
}

@end
