@implementation VSSpeechCache

- (NSString)dirPath
{
  return self->_dirPath;
}

+ (VSSpeechCache)defaultCacheStore
{
  if (defaultCacheStore_onceToken != -1)
    dispatch_once(&defaultCacheStore_onceToken, &__block_literal_global_1075);
  return (VSSpeechCache *)(id)defaultCacheStore___defaultStore;
}

- (VSSpeechCache)initWithStorePath:(id)a3
{
  id v5;
  VSSpeechCache *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *preinstalledCacheDir;
  void *v11;
  NSString *dirPath;
  id v13;
  VSSpeechCache *v14;
  NSObject *v15;
  void *v17;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VSSpeechCache;
  v6 = -[VSSpeechCache init](&v19, sel_init);
  if (!v6)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.voiceservices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundlePath");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "stringByAppendingPathComponent:", CFSTR("TTSResources/PreinstallCache/"));
  v9 = objc_claimAutoreleasedReturnValue();
  preinstalledCacheDir = v6->_preinstalledCacheDir;
  v6->_preinstalledCacheDir = (NSString *)v9;

  objc_storeStrong((id *)&v6->_dirPath, a3);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dirPath = v6->_dirPath;
  v18 = 0;
  LOBYTE(v8) = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", dirPath, 1, 0, &v18);
  v13 = v18;

  if ((v8 & 1) != 0)
  {

LABEL_4:
    v14 = v6;
    goto LABEL_8;
  }
  VSGetLogDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "-[VSSpeechCache initWithStorePath:]";
    v22 = 2112;
    v23 = v17;
    _os_log_error_impl(&dword_21AA84000, v15, OS_LOG_TYPE_ERROR, "Error %s, %@", buf, 0x16u);

  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (id)addCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v6, "length") - 64) > 0xFFFFFFFFFFFFFFBELL)
  {
    objc_msgSend(v4, "serializedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v9, "length") + 64);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendData:", v6);
    objc_msgSend(v11, "setLength:", 64);
    objc_msgSend(v11, "appendData:", v9);
    -[VSSpeechCache dirPath](self, "dirPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    LOBYTE(v13) = objc_msgSend(v11, "writeToFile:options:error:", v14, 0, &v18);
    v10 = v18;
    if ((v13 & 1) == 0)
    {
      VSGetLogDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v20 = "-[VSSpeechCache addCache:]";
        v21 = 2112;
        v22 = v17;
        _os_log_error_impl(&dword_21AA84000, v15, OS_LOG_TYPE_ERROR, "Error %s, %@", buf, 0x16u);

      }
    }

  }
  else
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (const char *)v5;
      _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Cache type name too long %@", buf, 0xCu);
    }

    v8 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0FD8];
    v24[0] = CFSTR("Cache type name too long");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("VSSpeechCacheErrorDomain"), 0, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)preinstalledCacheForText:(id)a3 language:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  VSSpeechCacheAudio *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BEC0E08], "availableLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v9);

  if ((v12 & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC0E08], "fallbackLanguageForLanguage:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v9;
      v31 = 2114;
      v32 = v13;
      _os_log_impl(&dword_21AA84000, v14, OS_LOG_TYPE_DEFAULT, "{public}%@ is not TTS language, falling back to %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v8, "preinstalledAudioHashForLanguage:name:", v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechCache preinstalledCacheDir](self, "preinstalledCacheDir");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v13, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByAppendingPathComponent:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("caf"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v21, "isReadableFileAtPath:", v20);

  if ((_DWORD)v18)
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x24BEC0D78], "audioDataFromFile:error:", v20, &v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v28;
    if (v23)
    {
      VSGetLogDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v20;
        v31 = 2112;
        v32 = v23;
        _os_log_error_impl(&dword_21AA84000, v24, OS_LOG_TYPE_ERROR, "Error in reading audio data from file: %@ error:%@", buf, 0x16u);
      }
      v25 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:%@:%@:%@:%@"), v13, CFSTR("gryphon"), CFSTR("unknown"), v10, CFSTR("premium"), CFSTR("0"));
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:%@"), v13, CFSTR("preinstalledCache"), CFSTR("0"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[VSSpeechCacheAudio initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:]([VSSpeechCacheAudio alloc], "initWithKey:audio:wordTimingInfo:voiceKey:voiceResourceKey:", v15, v22, 0, v24, v26);

    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)cacheDataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSString *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[VSSpeechCache dirPath](self, "dirPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (v9 = objc_retainAutorelease(v7), objc_msgSend(v9, "bytes")))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "bytes"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSClassFromString(v12);
    objc_msgSend(v11, "subdataWithRange:", 64, objc_msgSend(v11, "length") - 64);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend([v13 alloc], "initWithKey:data:", v4, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isPreinstalledCacheAvailableForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSpeechCache preinstalledCacheForText:language:name:](self, "preinstalledCacheForText:language:name:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (void)cleanCache
{
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(MEMORY[0x24BEC0E18], "isHomePod"))
    v3 = 5000;
  else
    v3 = 2000;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VSSpeechCache dirPath](self, "dirPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanDirectory:withLRULimit:", v4, v3);

}

- (unint64_t)totalCacheSize
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechCache dirPath](self, "dirPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "directorySize:", v4);

  return v5;
}

- (void)deleteCache
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSSpeechCache dirPath](self, "dirPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDirectory:", v3);

}

- (void)setDirPath:(id)a3
{
  objc_storeStrong((id *)&self->_dirPath, a3);
}

- (NSString)preinstalledCacheDir
{
  return self->_preinstalledCacheDir;
}

- (void)setPreinstalledCacheDir:(id)a3
{
  objc_storeStrong((id *)&self->_preinstalledCacheDir, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preinstalledCacheDir, 0);
  objc_storeStrong((id *)&self->_dirPath, 0);
}

void __34__VSSpeechCache_defaultCacheStore__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  VSSpeechCache *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x24BDD17C8];
  v7[0] = v1;
  v7[1] = CFSTR("VoiceServices");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[VSSpeechCache initWithStorePath:]([VSSpeechCache alloc], "initWithStorePath:", v4);
  v6 = (void *)defaultCacheStore___defaultStore;
  defaultCacheStore___defaultStore = (uint64_t)v5;

}

@end
