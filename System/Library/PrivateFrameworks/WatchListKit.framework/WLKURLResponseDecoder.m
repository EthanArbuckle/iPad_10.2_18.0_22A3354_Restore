@implementation WLKURLResponseDecoder

void __54__WLKURLResponseDecoder_logNetworkHeaders_identifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)logNetworkHeaders_identifier__headersToLog, "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v7);

}

void __54__WLKURLResponseDecoder_logNetworkHeaders_identifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  logNetworkHeaders_identifier__isInternalBuild = os_variant_has_internal_content();
  v2[0] = CFSTR("x-apple-response-time");
  v2[1] = CFSTR("x-apple-jingle-correlation-key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logNetworkHeaders_identifier__headersToLog;
  logNetworkHeaders_identifier__headersToLog = v0;

}

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  objc_msgSend(v6, "responseHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "logUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logNetworkHeaders:identifier:", v7, v9);

  v12.receiver = self;
  v12.super_class = (Class)WLKURLResponseDecoder;
  -[AMSURLResponseDecoder resultFromResult:error:](&v12, sel_resultFromResult_error_, v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)logNetworkHeaders:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (logNetworkHeaders_identifier__onceToken != -1)
    dispatch_once(&logNetworkHeaders_identifier__onceToken, &__block_literal_global_44);
  if (logNetworkHeaders_identifier__isInternalBuild)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__WLKURLResponseDecoder_logNetworkHeaders_identifier___block_invoke_2;
    v10[3] = &unk_1E68A8548;
    v8 = v7;
    v11 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
    WLKNetworkingLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKURLResponseDecoder - id: %@ response headers: %@", buf, 0x16u);
    }

  }
}

@end
