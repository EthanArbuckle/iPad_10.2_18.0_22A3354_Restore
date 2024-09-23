@implementation TVPReportingSession

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global);
}

void __33__TVPReportingSession_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "TVPReportingSession");
  v1 = (void *)sLogObject;
  sLogObject = (uint64_t)v0;

}

- (TVPReportingSession)initWithMediaItem:(id)a3
{
  id v5;
  TVPReportingSession *v6;
  TVPReportingSession *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  RTCReporting *reporter;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  objc_super v49;
  _QWORD v50[6];
  _QWORD v51[7];

  v51[6] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)TVPReportingSession;
  v6 = -[TVPReportingSession init](&v49, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_mediaItem, a3);
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
        v10 = (__CFString *)v9;
      else
        v10 = &stru_24F15E1B8;
      v11 = *MEMORY[0x24BE7CAD8];
      v50[0] = *MEMORY[0x24BE7CAC8];
      v50[1] = v11;
      v51[0] = &unk_24F173468;
      v51[1] = &unk_24F173480;
      v50[2] = *MEMORY[0x24BE7CB18];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", arc4random());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BE7CAA8];
      v51[2] = v12;
      v51[3] = MEMORY[0x24BDBD1C0];
      v14 = *MEMORY[0x24BE7CAE8];
      v50[3] = v13;
      v50[4] = v14;
      v50[5] = *MEMORY[0x24BE7CAB8];
      v51[4] = MEMORY[0x24BDBD1C8];
      v51[5] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataServiceIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataAVURLAssetAlternativeConfigurationOptions"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "length"))
      {
        objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDB2138]);
        v19 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v19;
      }
      if (objc_msgSend(v17, "length"))
      {
        v48 = v16;
        v20 = v10;
        v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "executablePath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        v26 = CFSTR("(UNKNOWN)");
        if (v24)
          v26 = (__CFString *)v24;
        v27 = v26;

        objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStoreFrontIdentifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v17, *MEMORY[0x24BE7CB30]);
        objc_msgSend(v21, "setObject:forKey:", v27, *MEMORY[0x24BE7CB20]);

        if (v28)
          objc_msgSend(v21, "setObject:forKey:", v28, CFSTR("StorefrontID"));
        v10 = v20;
        if (v18)
          objc_msgSend(v21, "addEntriesFromDictionary:", v18);
        v16 = v48;
        v29 = objc_msgSend(objc_alloc(MEMORY[0x24BE7CA78]), "initWithSessionInfo:userInfo:frameworksToCheck:", v48, v21, 0);
        reporter = v7->_reporter;
        v7->_reporter = (RTCReporting *)v29;

        -[RTCReporting startConfigurationWithCompletionHandler:](v7->_reporter, "startConfigurationWithCompletionHandler:", &__block_literal_global_15);
      }
      else
      {
        v39 = sLogObject;
        if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_ERROR))
          -[TVPReportingSession initWithMediaItem:].cold.2(v39, v40, v41, v42, v43, v44, v45, v46);
      }

    }
    else
    {
      v31 = sLogObject;
      if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_ERROR))
        -[TVPReportingSession initWithMediaItem:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);
    }
  }

  return v7;
}

void __41__TVPReportingSession_initWithMediaItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = sLogObject;
  if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "RTCReporting backends: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)reportDownloadFinishedWithResult:(int64_t)a3 error:(id)a4
{
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  id v24;
  TVPReportingSession *v25;
  uint64_t v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3 == 1)
    v7 = 300;
  else
    v7 = 200;
  if (a3 == 2)
    v8 = 500;
  else
    v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = v6;
  v11 = v10;
  if (v10)
  {
    v23 = v8;
    v25 = self;
    v12 = 0;
    v26 = *MEMORY[0x24BDD1398];
    v24 = v10;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("errorDomain%d"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("errorCode%d"), v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "code"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v9, "setObject:forKey:", v15, v13);
      objc_msgSend(v9, "setObject:forKey:", v16, v14);
      objc_msgSend(v11, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      v11 = v18;
      v19 = v12 >= 9;
      v12 = (v12 + 1);
    }
    while (!v19);

    v11 = v24;
    self = v25;
    v8 = v23;
  }
  -[TVPReportingSession mediaItem](self, "mediaItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataDownloadQOSMetrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v9, "addEntriesFromDictionary:", v21);
  v22 = sLogObject;
  if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "Sending download result %d with payload: %@", buf, 0x12u);
  }
  -[TVPReportingSession _sendEvent:withCategory:type:values:](self, "_sendEvent:withCategory:type:values:", CFSTR("downloadResult"), 12345, v8, v9);

}

- (void)_sendEvent:(id)a3 withCategory:(unsigned __int16)a4 type:(unsigned __int16)a5 values:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v7 = a5;
  v8 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[TVPReportingSession reporter](self, "reporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!v11)
      v11 = (id)MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
      objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("event"));
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BE7CA88]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, *MEMORY[0x24BE7CAA0]);

    objc_msgSend(v15, "setObject:forKey:", &unk_24F173498, *MEMORY[0x24BE7CA90]);
    if (v14)
      objc_msgSend(v15, "setObject:forKey:", v14, *MEMORY[0x24BE7CA98]);
    -[TVPReportingSession reporter](self, "reporter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "sendMessageWithDictionary:error:", v15, 0);

    v20 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v21 = CFSTR("unsuccessful");
      if (v19)
        v21 = CFSTR("successful");
      v23 = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "RTC Sending %@ payload was %@", (uint8_t *)&v23, 0x16u);
    }

  }
  else
  {
    v22 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_ERROR))
      -[TVPReportingSession _sendEvent:withCategory:type:values:].cold.1((uint64_t)v10, v22);
  }

}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (RTCReporting)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

- (void)initWithMediaItem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228A4E000, a1, a3, "Unable to create RTCReporting object since media item is nil", a5, a6, a7, a8, 0);
}

- (void)initWithMediaItem:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228A4E000, a1, a3, "Unable to create RTCReporting object since service ID is nil", a5, a6, a7, a8, 0);
}

- (void)_sendEvent:(uint64_t)a1 withCategory:(NSObject *)a2 type:values:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_228A4E000, a2, OS_LOG_TYPE_ERROR, "**** RTC is not configured. Not sending metrics for event %@. ****", (uint8_t *)&v2, 0xCu);
}

@end
