@implementation VSDiagnosticService

+ (id)defaultService
{
  if (defaultService_onceToken != -1)
    dispatch_once(&defaultService_onceToken, &__block_literal_global_2119);
  return (id)defaultService___defaultStore;
}

- (unint64_t)totalDiagnosticFileSize
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDiagnosticService audioDumpPath](self, "audioDumpPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "directorySize:", v4);

  return v5;
}

- (NSString)audioDumpPath
{
  return self->_audioDumpPath;
}

- (VSDiagnosticService)initWithDirectory:(id)a3
{
  id v5;
  VSDiagnosticService *v6;
  VSDiagnosticService *v7;
  uint64_t v8;
  NSDictionary *audioDumpFileAttributes;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSDiagnosticService;
  v6 = -[VSDiagnosticService init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audioDumpPath, a3);
    v12 = *MEMORY[0x24BDD0CB0];
    v13[0] = CFSTR("mobile");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    audioDumpFileAttributes = v7->_audioDumpFileAttributes;
    v7->_audioDumpFileAttributes = (NSDictionary *)v8;

  }
  return v7;
}

- (void)removeOldFiles
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -864000.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDiagnosticService audioDumpPath](self, "audioDumpPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanDirectory:withDateOlderThan:", v4, v5);

}

- (void)removeDirectory
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSDiagnosticService audioDumpPath](self, "audioDumpPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDirectory:", v3);

}

- (void)createDirectoryIfNeeded
{
  void *v3;
  void *v4;
  NSString *audioDumpPath;
  NSDictionary *audioDumpFileAttributes;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  id v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileExistsAtPath:isDirectory:", self->_audioDumpPath, &v14);

  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    audioDumpPath = self->_audioDumpPath;
    audioDumpFileAttributes = self->_audioDumpFileAttributes;
    v13 = 0;
    v7 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", audioDumpPath, 1, audioDumpFileAttributes, &v13);
    v8 = v13;

    VSGetLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_audioDumpPath;
        *(_DWORD *)buf = 138412290;
        v16 = (const char *)v11;
        _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_DEFAULT, "Created audio dump directory %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[VSDiagnosticService createDirectoryIfNeeded]";
      v17 = 2112;
      v18 = v12;
      _os_log_error_impl(&dword_21AA84000, v10, OS_LOG_TYPE_ERROR, "Error %s, %@", buf, 0x16u);

    }
  }
}

- (void)dumpCompressedAudio:(id)a3 forRequest:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  VSDiagnosticService *v21;
  id v22;
  id v23;
  uint8_t buf[8];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(a4, "canLogRequestText"))
  {
    if (v6)
    {
      -[VSDiagnosticService createDirectoryIfNeeded](self, "createDirectoryIfNeeded");
      v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
      -[NSObject setDateFormat:](v7, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringFromDate:](v7, "stringFromDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("TTS-%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDD17C8];
      v25[0] = CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/");
      objc_msgSend(v11, "stringByAppendingString:", CFSTR(".tmp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathWithComponents:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(9, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__VSDiagnosticService_dumpCompressedAudio_forRequest___block_invoke;
      block[3] = &unk_24DD8E910;
      v20 = v15;
      v21 = self;
      v22 = v6;
      v23 = v11;
      v17 = v11;
      v18 = v15;
      dispatch_async(v16, block);

    }
    else
    {
      VSGetLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "No compressed audio do dump", buf, 2u);
      }
    }

  }
}

- (void)dumpStreamAudio:(id)a3 forRequest:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  VSDiagnosticService *v21;
  id v22;
  id v23;
  uint8_t buf[8];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(a4, "canLogRequestText"))
  {
    if (v6)
    {
      -[VSDiagnosticService createDirectoryIfNeeded](self, "createDirectoryIfNeeded");
      v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
      -[NSObject setDateFormat:](v7, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringFromDate:](v7, "stringFromDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("TTS-%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDD17C8];
      v25[0] = CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/");
      objc_msgSend(v11, "stringByAppendingString:", CFSTR(".tmp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathWithComponents:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(9, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __50__VSDiagnosticService_dumpStreamAudio_forRequest___block_invoke;
      block[3] = &unk_24DD8E910;
      v20 = v15;
      v21 = self;
      v22 = v6;
      v23 = v11;
      v17 = v11;
      v18 = v15;
      dispatch_async(v16, block);

    }
    else
    {
      VSGetLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "No audio do dump", buf, 2u);
      }
    }

  }
}

- (void)dumpInstrumentMetrics:(id)a3 withTimestamp:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  VSDiagnosticService *v18;
  id v19;
  id v20;
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    if (v8)
    {
      VSGetLogDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v6;
        v24 = 2112;
        v25 = v8;
        _os_log_error_impl(&dword_21AA84000, v9, OS_LOG_TYPE_ERROR, "Unable to parse json for dictionary '%@', error: %@", buf, 0x16u);
      }
    }
    else
    {
      -[VSDiagnosticService createDirectoryIfNeeded](self, "createDirectoryIfNeeded");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TTSMetrics-%lld"), a4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD17C8];
      v21[0] = CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/");
      -[NSObject stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(".json"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathWithComponents:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(9, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__VSDiagnosticService_dumpInstrumentMetrics_withTimestamp___block_invoke;
      block[3] = &unk_24DD8E938;
      v17 = v13;
      v18 = self;
      v19 = v7;
      v15 = v13;
      dispatch_async(v14, block);

    }
  }
  else
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, "No json data to dump", buf, 2u);
    }
  }

}

- (void)collectTailspin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSDiagnosticService createDirectoryIfNeeded](self, "createDirectoryIfNeeded");
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("TTS-stall-%@.tailspin"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  v22[0] = CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/");
  v22[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathWithComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createFileAtPath:contents:attributes:", v12, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForUpdatingAtPath:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileDescriptor");
  dispatch_get_global_queue(9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  v21 = v4;
  v19 = v14;
  v16 = v12;
  v17 = v4;
  v18 = v14;
  tailspin_dump_output();

}

- (void)setAudioDumpPath:(id)a3
{
  objc_storeStrong((id *)&self->_audioDumpPath, a3);
}

- (NSDictionary)audioDumpFileAttributes
{
  return self->_audioDumpFileAttributes;
}

- (void)setAudioDumpFileAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_audioDumpFileAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDumpFileAttributes, 0);
  objc_storeStrong((id *)&self->_audioDumpPath, 0);
}

uint64_t __39__VSDiagnosticService_collectTailspin___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "closeFile");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(a1 + 40));
  return result;
}

void __59__VSDiagnosticService_dumpInstrumentMetrics_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioDumpFileAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createFileAtPath:contents:attributes:", v3, 0, v4);

  LOBYTE(v3) = objc_msgSend(*(id *)(a1 + 48), "writeToFile:atomically:", *(_QWORD *)(a1 + 32), 1);
  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, "Instrument metrics json dump saved as %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "Unable to create instrument metrics json dump at '%@'", (uint8_t *)&v9, 0xCu);
  }

}

void __50__VSDiagnosticService_dumpStreamAudio_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  __int16 v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioDumpFileAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createFileAtPath:contents:attributes:", v3, 0, v4);

  if ((objc_msgSend(*(id *)(a1 + 48), "writeWaveToFilePath:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v20[0] = CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/");
    objc_msgSend(*(id *)(a1 + 56), "stringByAppendingString:", CFSTR(".wav"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathWithComponents:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v15 = 0;
    objc_msgSend(v9, "moveItemAtPath:toPath:error:", v10, v8, &v15);
    v11 = v15;

    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v11;
        _os_log_error_impl(&dword_21AA84000, v13, OS_LOG_TYPE_ERROR, "Unable to create audio dump at '%@', error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_21AA84000, v13, OS_LOG_TYPE_INFO, "Audio save as %@", buf, 0xCu);
    }

  }
  else
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, "Unable to create intermediate audio dump at '%@'", buf, 0xCu);
    }
  }

}

void __54__VSDiagnosticService_dumpCompressedAudio_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  __int16 v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioDumpFileAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createFileAtPath:contents:attributes:", v3, 0, v4);

  if ((objc_msgSend(*(id *)(a1 + 48), "writeToFilePath:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v20[0] = CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/");
    objc_msgSend(*(id *)(a1 + 56), "stringByAppendingString:", CFSTR(".wav"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathWithComponents:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v15 = 0;
    objc_msgSend(v9, "moveItemAtPath:toPath:error:", v10, v8, &v15);
    v11 = v15;

    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v11;
        _os_log_error_impl(&dword_21AA84000, v13, OS_LOG_TYPE_ERROR, "Unable to create audio dump at '%@', error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_21AA84000, v13, OS_LOG_TYPE_INFO, "Audio save as %@", buf, 0xCu);
    }

  }
  else
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, "Unable to create intermediate audio dump at '%@'", buf, 0xCu);
    }
  }

}

void __37__VSDiagnosticService_defaultService__block_invoke()
{
  void *v0;
  int v1;
  VSDiagnosticService *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "enableAudioDump");

  if (v1)
  {
    v2 = -[VSDiagnosticService initWithDirectory:]([VSDiagnosticService alloc], "initWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/"));
    v3 = (void *)defaultService___defaultStore;
    defaultService___defaultStore = (uint64_t)v2;

  }
}

@end
