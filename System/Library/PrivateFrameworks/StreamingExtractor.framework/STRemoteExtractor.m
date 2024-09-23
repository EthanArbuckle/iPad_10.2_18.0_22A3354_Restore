@implementation STRemoteExtractor

+ (id)STAEAExtractorWithOptions:(id)a3
{
  id v3;
  STRemoteExtractor *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *p_super;

  v3 = a3;
  v4 = -[STRemoteExtractor initWithOptions:]([STRemoteExtractor alloc], "initWithOptions:", v3);
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("STAEAExtractorSourceDirectory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        STGetLogHandle();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          +[STRemoteExtractor(STAEAExtractor) STAEAExtractorWithOptions:].cold.2();
        v6 = v4;
        goto LABEL_16;
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("STAEAExtractorSourceDirectorySandboxExtension<Private>"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          STGetLogHandle();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            +[STRemoteExtractor(STAEAExtractor) STAEAExtractorWithOptions:].cold.1();

          p_super = &v4->super;
LABEL_16:

          v4 = 0;
          goto LABEL_11;
        }
      }
      else
      {
        -[STRemoteExtractor setSourceDirectory:sandboxExtension:](v4, "setSourceDirectory:sandboxExtension:", v5, 0);
      }

    }
LABEL_11:

  }
  return v4;
}

+ (id)fullReplacementSTAEAExtractor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = CFSTR("STRemoteExtractorPluginBundleName");
    v9[1] = CFSTR("STRemoteExtractorSessionID");
    v10[0] = CFSTR("STAEAExtractionPlugin");
    v10[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "STAEAExtractorWithOptions:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    STGetLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[STRemoteExtractor(STAEAExtractor) fullReplacementSTAEAExtractor:].cold.1();
    v7 = 0;
  }

  return v7;
}

+ (id)incrementalPatchSTAEAExtractor:(id)a3 srcDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    STGetLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[STRemoteExtractor(STAEAExtractor) incrementalPatchSTAEAExtractor:srcDirectory:].cold.1();
    goto LABEL_9;
  }
  if (!v7)
  {
    STGetLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[STRemoteExtractor(STAEAExtractor) incrementalPatchSTAEAExtractor:srcDirectory:].cold.2();
LABEL_9:

    v9 = 0;
    v10 = 0;
    goto LABEL_4;
  }
  v13[0] = CFSTR("STRemoteExtractorPluginBundleName");
  v13[1] = CFSTR("STRemoteExtractorSessionID");
  v14[0] = CFSTR("STAEAExtractionPlugin");
  v14[1] = v6;
  v13[2] = CFSTR("STAEAExtractorSourceDirectory");
  v14[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "STAEAExtractorWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v10;
}

- (NSData)symmetricDecryptionKey
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STAEAExtractorSymmetricEncryptionKey<Private>"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setSymmetricDecryptionKey:(id)a3
{
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", a3, CFSTR("STAEAExtractorSymmetricEncryptionKey<Private>"));
}

- (NSData)asymmetricDecryptionKey
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STAEAExtractorAsymmetricDecryptionKey<Private>"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setAsymmetricDecryptionKey:(id)a3
{
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", a3, CFSTR("STAEAExtractorAsymmetricDecryptionKey<Private>"));
}

- (NSData)signingPublicKey
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STAEAExtractorSigningPublicKey<Private>"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setSigningPublicKey:(id)a3
{
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", a3, CFSTR("STAEAExtractorSigningPublicKey<Private>"));
}

- (NSString)sourceDirectory
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STAEAExtractorSourceDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSourceDirectory:(id)a3
{
  -[STRemoteExtractor setSourceDirectory:sandboxExtension:](self, "setSourceDirectory:sandboxExtension:", a3, 0);
}

- (BOOL)setSourceDirectory:(id)a3 sandboxExtension:(id)a4
{
  void *v6;
  id v7;
  id v8;
  const char *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  char __s[1024];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x400uLL);
  v6 = (void *)MEMORY[0x24BDD1580];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentationWithPath:", v7);

  v10 = realpath_DARWIN_EXTSN(v9, __s);
  if (!v10)
  {
    STGetLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", v12, CFSTR("STAEAExtractorSourceDirectory"));

  v13 = sandbox_extension_issue_file();
  if (!v13)
  {
    STGetLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:].cold.2((uint64_t)__s, v14);
LABEL_9:
    v15 = 0;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4);
  v14 = objc_claimAutoreleasedReturnValue();
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", v14, CFSTR("STAEAExtractorSourceDirectorySandboxExtension<Private>"));
  v15 = 1;
LABEL_4:

  return v15;
}

- (NSData)archiveID
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STAEAExtractorArchiveID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setArchiveID:(id)a3
{
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", a3, CFSTR("STAEAExtractorArchiveID"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STRemoteExtractor)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  STGetLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[STRemoteExtractor init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (STRemoteExtractor)initWithOptions:(id)a3
{
  id v4;
  STRemoteExtractor *v5;
  uint64_t v6;
  NSMutableDictionary *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STRemoteExtractor;
  v5 = -[STRemoteExtractor init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;

  }
  -[STRemoteExtractor setIsPrepared:](v5, "setIsPrepared:", 0);
  -[STRemoteExtractor setIsInvalid:](v5, "setIsInvalid:", 0);
  -[STRemoteExtractor setDataStreamStarted:](v5, "setDataStreamStarted:", 0);
  -[STRemoteExtractor setFinalBytesSent:](v5, "setFinalBytesSent:", 0);

  return v5;
}

- (STRemoteExtractor)initWithCoder:(id)a3
{
  id v4;
  STRemoteExtractor *v5;
  uint64_t v6;
  NSMutableDictionary *options;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[STRemoteExtractor initWithOptions:](self, "initWithOptions:", 0);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("options"));
    v6 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;

    v5->_privileged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("privileged"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.STRemoteExtractor.privileged"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if ((v10 & 1) == 0)
        v5->_privileged = 0;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STRemoteExtractor options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("options"));

  objc_msgSend(v5, "encodeBool:forKey:", -[STRemoteExtractor privileged](self, "privileged"), CFSTR("privileged"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[STRemoteExtractor options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithOptions:", v5);

  objc_msgSend(v6, "setPrivileged:", -[STRemoteExtractor privileged](self, "privileged"));
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[STRemoteExtractor _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STRemoteExtractor;
  -[STRemoteExtractor dealloc](&v3, sel_dealloc);
}

- (void)setOption:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setValue:forKey:](self->_options, "setValue:forKey:", a3, a4);
}

- (id)createOutputDir:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v20 = *MEMORY[0x24BDD0CC8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 16877);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  STGetLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[STRemoteExtractor createOutputDir:]";
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_2144F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating output dir: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, v5, &v15);
  v9 = v15;

  v10 = 0;
  if ((v8 & 1) == 0)
  {
    STGetLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor createOutputDir:].cold.1();

    v13 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create extraction directory at path %@: %@"), v3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v13, 4, v14, v9, (uint64_t)"-[STRemoteExtractor createOutputDir:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 363);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSString)pluginBundlePath
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STRemoteExtractorPluginBundlePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPluginBundlePath:(id)a3
{
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", a3, CFSTR("STRemoteExtractorPluginBundlePath"));
}

- (NSString)pluginDirectory
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STRemoteExtractorPluginDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPluginDirectory:(id)a3
{
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", a3, CFSTR("STRemoteExtractorPluginDirectory"));
}

- (NSString)sessionID
{
  void *v2;
  void *v3;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STRemoteExtractorSessionID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSessionID:(id)a3
{
  -[STRemoteExtractor setOption:forKey:](self, "setOption:forKey:", a3, CFSTR("STRemoteExtractorSessionID"));
}

- (BOOL)suppressCompletionsDuringShutdown
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STRemoteExtractorSuppressCompletionsDuringShutdown"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    v4 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    STGetLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor suppressCompletionsDuringShutdown].cold.1();

    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "BOOLValue");
LABEL_8:

  return v4;
}

- (id)_reserveExtractionMemory
{
  void *v3;
  void *v4;

  -[STRemoteExtractor extractionServiceInfo](self, "extractionServiceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reserveExtractionMemory:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_releaseExtractionMemory
{
  id v3;

  -[STRemoteExtractor extractionServiceInfo](self, "extractionServiceInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseExtractionMemory:", self);

}

- (void)_checkForInvalidExtractionMemoryReservation
{
  id v3;

  if (-[STRemoteExtractor isInvalid](self, "isInvalid"))
  {
    -[STRemoteExtractor extractionServiceInfo](self, "extractionServiceInfo");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extractionBecameInvalid");

  }
}

- (BOOL)doesConsumeExtractedData
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;

  -[STRemoteExtractor options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("STRemoteExtractorDoesConsumeExtractedData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    STGetLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor doesConsumeExtractedData].cold.1();

    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "BOOLValue");
LABEL_8:

  return v4;
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *ioQueue;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *reservationQueue;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  STRemoteExtractor *v27;
  id v28;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    STGetLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:].cold.1();

    v15 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No path to extract to"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 3;
    v18 = v13;
    v19 = 505;
    goto LABEL_15;
  }
  v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingExtractor.STRemoteExtractorIOQueue", 0);
  ioQueue = self->_ioQueue;
  self->_ioQueue = v8;

  if (!self->_ioQueue)
  {
    STGetLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:].cold.2();

    v21 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create displatch queue for I/O"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    v17 = 1;
    v18 = v13;
    v19 = 508;
    goto LABEL_15;
  }
  dispatch_get_global_queue(21, 0);
  v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  reservationQueue = self->_reservationQueue;
  self->_reservationQueue = v10;

  if (!self->_reservationQueue)
  {
    STGetLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor prepareForExtractionToPath:completionBlock:].cold.3();

    v23 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get global concurrent queue for extraction memory reservations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    v17 = 1;
    v18 = v13;
    v19 = 511;
LABEL_15:
    STCreateError(v16, v17, v18, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRemoteExtractor setError:](self, "setError:", v24);

    goto LABEL_5;
  }
  -[STRemoteExtractor ioQueue](self, "ioQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke;
  block[3] = &unk_24D1A7130;
  v26 = v6;
  v27 = self;
  v28 = v7;
  dispatch_async(v12, block);

  v13 = v26;
LABEL_5:

}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  STExtractionOriginator *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  id v46;
  char *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  char v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  __CFString *v71;
  void *v72;
  NSObject *v73;
  __CFString *v74;
  void *v75;
  NSObject *v76;
  __CFString *v77;
  void *v78;
  NSObject *v79;
  __CFString *v80;
  void *v81;
  NSObject *v82;
  int v83;
  void *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  BOOL v93;
  NSObject *v94;
  void *v95;
  _QWORD v96[5];
  id v97;
  _QWORD v98[5];
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  stat v105;
  uint8_t buf[4];
  const char *v107;
  __int16 v108;
  char *v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  _QWORD v116[2];
  _QWORD v117[2];
  char __s[1024];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x400uLL);
  memset(&v105, 0, sizeof(v105));
  v117[0] = 0;
  v117[1] = 0;
  STGetLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    v107 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    v108 = 2112;
    v109 = v3;
    _os_log_impl(&dword_2144F0000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: path: %@", buf, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "isPrepared"))
  {
    STGetLogHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_1();

    v71 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-prepare... called on already prepared extractor"));
    v50 = objc_claimAutoreleasedReturnValue();
    STCreateError(v71, 8, v50, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 528);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setError:", v72);

    goto LABEL_47;
  }
  objc_msgSend(*(id *)(a1 + 40), "pluginBundlePath");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v95)
  {
    objc_msgSend(*(id *)(a1 + 40), "pluginDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "options");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("STRemoteExtractorPluginBundleName"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "pluginDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v7;
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 40), "options");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("STRemoteExtractorPluginBundleName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.bundle"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathWithComponents:", v12);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v95)
    {
      STGetLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_2();

      v74 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-prepare... called without valid plugin bundle/path"));
      v50 = objc_claimAutoreleasedReturnValue();
      STCreateError(v74, 8, v50, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 538);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setError:", v75);

LABEL_47:
      v95 = 0;
LABEL_57:
      v49 = 0;
      goto LABEL_58;
    }
  }
  v13 = (id *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 40), "privileged"))
    v14 = CFSTR("com.apple.STExtractionService.privileged");
  else
    v14 = CFSTR("com.apple.STExtractionService");
  v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", v14);
  v16 = (void *)*((_QWORD *)*v13 + 7);
  *((_QWORD *)*v13 + 7) = v15;

  objc_msgSend(*v13, "extractionServiceConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
    STGetLogHandle();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_3();

    v77 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create NSXPCConnection"));
    v50 = objc_claimAutoreleasedReturnValue();
    STCreateError(v77, 2, v50, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 550);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setError:", v78);

    goto LABEL_57;
  }
  v19 = objc_alloc_init(STExtractionOriginator);
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(void **)(v20 + 72);
  *(_QWORD *)(v20 + 72) = v19;

  v22 = *(void **)(a1 + 40);
  objc_msgSend(v22, "internalExtractionOriginator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setOriginator:", v22);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D7BC90);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setRemoteObjectInterface:", v24);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D7A6D0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setExportedInterface:", v26);

  objc_msgSend(*(id *)(a1 + 40), "internalExtractionOriginator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setExportedObject:", v28);

  +[ExtractionServiceInfo extractionServiceInfoForPluginBundlePath:](ExtractionServiceInfo, "extractionServiceInfoForPluginBundlePath:", v95);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = v30;

  objc_msgSend(*(id *)(a1 + 40), "extractionServiceInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 == 0;

  if (v33)
  {
    STGetLogHandle();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_4();

    v80 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create internal ExtractionServiceInfo object to track extraction service"));
    v50 = objc_claimAutoreleasedReturnValue();
    STCreateError(v80, 1, v50, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 561);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setError:", v81);

    goto LABEL_57;
  }
  objc_msgSend(*(id *)(a1 + 40), "extractionServiceInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "uuid");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "getUUIDBytes:", v117);

  objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_xpcConnection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_set_oneshot_instance();

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v38 = MEMORY[0x24BDAC760];
  v103[0] = MEMORY[0x24BDAC760];
  v103[1] = 3221225472;
  v103[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2;
  v103[3] = &unk_24D1A7108;
  objc_copyWeak(&v104, (id *)buf);
  objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
  v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v39, "setInterruptionHandler:", v103);

  v101[0] = v38;
  v101[1] = 3221225472;
  v101[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_4;
  v101[3] = &unk_24D1A7108;
  objc_copyWeak(&v102, (id *)buf);
  objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setInvalidationHandler:", v101);

  objc_destroyWeak(&v102);
  objc_destroyWeak(&v104);
  objc_destroyWeak((id *)buf);
  objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "resume");

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v39) = objc_msgSend(v42, "fileExistsAtPath:", *(_QWORD *)(a1 + 32));

  if ((v39 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "createOutputDir:", *(_QWORD *)(a1 + 32));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setError:", v43);

    objc_msgSend(*(id *)(a1 + 40), "error");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44 == 0;

    if (!v45)
    {
      STGetLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_10();
      goto LABEL_57;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v47 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v46, "fileSystemRepresentationWithPath:", *(_QWORD *)(a1 + 32)), __s);

  if (!v47)
  {
    STGetLogHandle();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_5();

    v83 = *__error();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to realpath \"%@\" at \"%s\": %s"), *(_QWORD *)(a1 + 32), __s, strerror(v83));
    v50 = objc_claimAutoreleasedReturnValue();
    STCreateError((void *)*MEMORY[0x24BDD1128], v83, v50, 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 607);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setError:", v84);

    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v105.st_mode = 0;
  if (stat(__s, &v105))
  {
    v50 = 0;
  }
  else
  {
    if ((v105.st_mode & 0xF000) == 0x4000)
      goto LABEL_21;
    STGetLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v107 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
      v108 = 2080;
      v109 = __s;
      _os_log_impl(&dword_2144F0000, v64, OS_LOG_TYPE_DEFAULT, "%{public}s: Existing path is not a directory - removing and recreating: %s", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0;
    v66 = objc_msgSend(v65, "removeItemAtPath:error:", v49, &v100);
    v50 = v100;

    if ((v66 & 1) == 0)
    {
      STGetLogHandle();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_9((uint64_t)__s, (uint64_t)v50, v67);

      STGetLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_8(v68);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "createOutputDir:", v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setError:", v51);

  objc_msgSend(*(id *)(a1 + 40), "error");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52 == 0;

  if (v53)
  {

LABEL_21:
    v54 = (void *)sandbox_extension_issue_file();
    if (!v54)
    {
      STGetLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_6((uint64_t)__s, v55);

    }
    objc_msgSend(*(id *)(a1 + 40), "extractionServiceConnection");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v38;
    v98[1] = 3221225472;
    v98[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88;
    v98[3] = &unk_24D1A7158;
    v98[4] = *(_QWORD *)(a1 + 40);
    v99 = *(id *)(a1 + 48);
    objc_msgSend(v56, "remoteObjectProxyWithErrorHandler:", v98);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setIsPrepared:", 1);
    objc_msgSend(*(id *)(a1 + 40), "options");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "mutableCopy");

    v114 = CFSTR("STRemoteExtractorFrameworkPath");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bundlePath");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v61;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addEntriesFromDictionary:", v62);

    if (v54)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v54, 4);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = 0;
    }
    v96[0] = v38;
    v96[1] = 3221225472;
    v96[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2_92;
    v96[3] = &unk_24D1A71A8;
    v69 = *(void **)(a1 + 48);
    v96[4] = *(_QWORD *)(a1 + 40);
    v97 = v69;
    objc_msgSend(v57, "remote_prepareForExtractionToPath:sandboxExtensionToken:options:withCompletionBlock:", v49, v63, v59, v96);
    if (v54)
    {

      free(v54);
    }
    else
    {

    }
    goto LABEL_40;
  }
  STGetLogHandle();
  v94 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_7();

LABEL_58:
  STGetLogHandle();
  v85 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    v86 = *(void **)(a1 + 40);
    v87 = objc_msgSend(v86, "lastResumptionOffset");
    objc_msgSend(*(id *)(a1 + 40), "error");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v107 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    v108 = 2112;
    v109 = (char *)v86;
    v110 = 2048;
    v111 = v87;
    v112 = 2112;
    v113 = v88;
    _os_log_impl(&dword_2144F0000, v85, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling prepare completion block with offset %llu, error %@", buf, 0x2Au);

  }
  v89 = *(_QWORD *)(a1 + 48);
  v90 = objc_msgSend(*(id *)(a1 + 40), "lastResumptionOffset");
  objc_msgSend(*(id *)(a1 + 40), "error");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v89 + 16))(v89, v90, v91);

  objc_msgSend(*(id *)(a1 + 40), "error");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v92 == 0;

  if (!v93)
    objc_msgSend(*(id *)(a1 + 40), "_invalidate");
LABEL_40:

}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ioQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_3;
    block[3] = &unk_24D1A7108;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }

}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isInvalid");
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      STCreateError((void *)*MEMORY[0x24BDD0B88], 4097, CFSTR("Connection interrupted to streaming extraction service"), 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_3", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 575);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setError:", v4);

      objc_msgSend(v5, "_invalidate");
      v2 = v5;
    }
  }

}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ioQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_5;
    block[3] = &unk_24D1A7108;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }

}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isInvalid");
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      STCreateError((void *)*MEMORY[0x24BDD0B88], 4099, CFSTR("Connection invalidated to streaming extraction service"), 0, (uint64_t)"-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_5", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 590);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setError:", v4);

      objc_msgSend(v5, "_invalidate");
      v2 = v5;
    }
  }

}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  STGetLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "ioQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_89;
  block[3] = &unk_24D1A7130;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, block);

}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_89(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setLastResumptionOffset:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_2_92(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  STGetLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136446978;
    v23 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke_2";
    v24 = 2112;
    v25 = v10;
    v26 = 2048;
    v27 = a3;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_2144F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: prepare completed with offset %llu, error %@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "ioQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_93;
  block[3] = &unk_24D1A7180;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v17 = v8;
  v18 = v12;
  v21 = a3;
  v19 = v7;
  v20 = v13;
  v14 = v7;
  v15 = v8;
  dispatch_async(v11, block);

}

uint64_t __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_93(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:");
    objc_msgSend(*(id *)(a1 + 40), "_invalidate");
  }
  objc_msgSend(*(id *)(a1 + 40), "setLastResumptionOffset:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setRequiredExtractionMemory:", 1024);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("STRemoteExtractorMemoryFootprint"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 40), "setRequiredExtractionMemory:", objc_msgSend(v2, "unsignedLongLongValue"));
      }

    }
  }
  STGetLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    v10 = 136446722;
    v11 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    v12 = 2112;
    v13 = v4;
    v14 = 2048;
    v15 = objc_msgSend(v4, "requiredExtractionMemory");
    _os_log_impl(&dword_2144F0000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: extractor requires %zu bytes extraction memory", (uint8_t *)&v10, 0x20u);
  }

  STGetLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v10 = 136446978;
    v11 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = v6;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_2144F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling prepare completion block with offset %llu, error %@", (uint8_t *)&v10, 0x2Au);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSXPCConnection *extractionServiceConnection;
  int v7;
  const char *v8;
  __int16 v9;
  STRemoteExtractor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!-[STRemoteExtractor isInvalid](self, "isInvalid"))
  {
    STGetLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446466;
      v8 = "-[STRemoteExtractor _invalidate]";
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_2144F0000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: invalidating", (uint8_t *)&v7, 0x16u);
    }

  }
  -[STRemoteExtractor setIsInvalid:](self, "setIsInvalid:", 1);
  -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    extractionServiceConnection = self->_extractionServiceConnection;
    self->_extractionServiceConnection = 0;

  }
  -[STRemoteExtractor _releaseExtractionMemory](self, "_releaseExtractionMemory");
  -[STRemoteExtractor _checkForInvalidExtractionMemoryReservation](self, "_checkForInvalidExtractionMemoryReservation");
}

- (void)_sendData:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  dispatch_group_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  NSObject *v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  __CFString *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  __CFString *v53;
  void *v54;
  NSObject *v55;
  __CFString *v56;
  void *v57;
  NSObject *v58;
  __CFString *v59;
  void *v60;
  id v61;
  void *v62;
  dispatch_group_t group;
  STRemoteExtractor *v64;
  void *v65;
  id v66;
  _QWORD block[5];
  id v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint64_t *v74;
  _QWORD v75[4];
  id v76;
  id v77;
  uint64_t *v78;
  _QWORD v79[7];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[4];
  NSObject *v85;
  unint64_t v86;
  _QWORD v87[4];
  NSObject *v88;
  unint64_t v89;
  _QWORD v90[4];
  dispatch_group_t v91;
  _QWORD *v92;
  _QWORD *v93;
  _QWORD v94[3];
  char v95;
  _QWORD v96[5];
  id v97;
  _BYTE buf[24];
  void *v99;
  _BYTE v100[20];
  uint8_t v101[4];
  const char *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  unint64_t v108;
  char v109[24];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  v61 = a4;
  v64 = self;
  -[STRemoteExtractor error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    STGetLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor _sendData:completion:].cold.7(self, v51);

    -[STRemoteExtractor error](self, "error");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
      goto LABEL_71;
    goto LABEL_72;
  }
  if (!-[STRemoteExtractor isPrepared](self, "isPrepared"))
  {
    STGetLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor _sendData:completion:].cold.6();

    v53 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called before -prepareForExtraction on %@"), "-[STRemoteExtractor _sendData:completion:]", self);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v53, 7, v54, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 739);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_70;
  }
  if (-[STRemoteExtractor isInvalid](self, "isInvalid"))
  {
    STGetLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor _sendData:completion:].cold.1();

    v56 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-supplyBytes: called on invalid extractor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v56, 8, v57, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 740);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_70;
  }
  -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    STGetLogHandle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor _sendData:completion:].cold.2();

    v59 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no service connection for extraction service"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v59, 1, v60, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 742);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_70;
  }
  v8 = dispatch_group_create();
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = __Block_byref_object_copy_;
  v96[4] = __Block_byref_object_dispose_;
  v97 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x2020000000;
  v95 = 0;
  v90[0] = MEMORY[0x24BDAC760];
  v90[1] = 3221225472;
  v90[2] = __42__STRemoteExtractor__sendData_completion___block_invoke;
  v90[3] = &unk_24D1A71D0;
  v92 = v96;
  v93 = v94;
  group = v8;
  v91 = group;
  v62 = (void *)MEMORY[0x2199D0A50](v90);
  v9 = objc_msgSend(v66, "length");
  if (v9 - 4194305 >= 0xFFFFFFFFFFC00000)
  {
    pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
    if (_sAvailableExtractionBuffer >= v9)
      _sAvailableExtractionBuffer -= v9;
    else
      v9 = 0;
    pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
  }
  else
  {
    v9 = 0;
  }
  if (v9 != objc_msgSend(v66, "length"))
  {
    STGetLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[STRemoteExtractor _sendData:completion:].cold.5((uint64_t)v109, objc_msgSend(v66, "length"), v17);

    STGetSignpostHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      v19 = objc_msgSend(v66, "length");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v19;
      _os_signpost_emit_with_name_impl(&dword_2144F0000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Starting fragmentation of supplied buffer (%lu bytes)", buf, 0xCu);
    }

    v20 = 0;
    v65 = 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v20 >= objc_msgSend(v66, "length"))
      {
        STGetSignpostHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2144F0000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Ending fragmentation of the supplied buffer", buf, 2u);
        }
        goto LABEL_68;
      }
      v80 = 0;
      v81 = &v80;
      v82 = 0x2020000000;
      v83 = 0;
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v25 = (unint64_t)v65 + v21 - v20;
      if (v25)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        v26 = _sAvailableExtractionBuffer;
        if (!((unint64_t)_sAvailableExtractionBuffer >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
            v26 = _sAvailableExtractionBuffer;
          }
          while ((unint64_t)_sAvailableExtractionBuffer < 0x20000);
        }
        if (v26 < v25)
          v25 = v26;
        _sAvailableExtractionBuffer = v26 - v25;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
        v27 = v81;
      }
      else
      {
        v27 = &v80;
      }
      v27[3] = v25;
      STGetLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v43 = v81[3];
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "-[STRemoteExtractor _sendData:completion:]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2048;
        v99 = (void *)v20;
        *(_WORD *)v100 = 2048;
        *(_QWORD *)&v100[2] = v21;
        *(_WORD *)&v100[10] = 2048;
        *(_QWORD *)&v100[12] = v65;
        _os_log_debug_impl(&dword_2144F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}s: Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}", buf, 0x34u);
      }

LABEL_55:
      STGetLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v42 = (void *)v81[3];
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[STRemoteExtractor _sendData:completion:]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2048;
        v99 = v42;
        _os_log_debug_impl(&dword_2144F0000, v32, OS_LOG_TYPE_DEBUG, "%{public}s: Supplying byte range {%lu, %lu}", buf, 0x20u);
      }

      objc_msgSend(v66, "subdataWithRange:", v20, v81[3]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(group);
      STGetSignpostHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v34))
      {
        v35 = objc_msgSend(v33, "length");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v35;
        _os_signpost_emit_with_name_impl(&dword_2144F0000, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer (%lu bytes) to the extraction service over XPC", buf, 0xCu);
      }

      -[STRemoteExtractor extractionServiceConnection](v64, "extractionServiceConnection");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_117;
      v75[3] = &unk_24D1A7270;
      v37 = v62;
      v77 = v37;
      v78 = &v80;
      v38 = v33;
      v76 = v38;
      objc_msgSend(v36, "remoteObjectProxyWithErrorHandler:", v75);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_118;
      v71[3] = &unk_24D1A7298;
      v73 = v37;
      v74 = &v80;
      v40 = v38;
      v72 = v40;
      objc_msgSend(v39, "remote_supplyBytes:withCompletionBlock:", v40, v71);

      v20 += v81[3];
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v20 < (unint64_t)v65 + v21)
          goto LABEL_65;
        STGetLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "-[STRemoteExtractor _sendData:completion:]";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2048;
          v99 = v65;
          _os_log_debug_impl(&dword_2144F0000, v41, OS_LOG_TYPE_DEBUG, "%{public}s: Active partial range {%lu, %lu} exhausted", buf, 0x20u);
        }

        v65 = 0;
      }
      v21 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_65:

      _Block_object_dispose(&v80, 8);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3010000000;
    v99 = &unk_2144FDA17;
    *(_OWORD *)v100 = xmmword_2144FB470;
    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_112;
    v79[3] = &unk_24D1A7248;
    v79[5] = buf;
    v79[6] = v20;
    v79[4] = &v80;
    objc_msgSend(v66, "enumerateByteRangesUsingBlock:", v79);
    if (!v81[3])
    {
      v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 32);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        STGetLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[STRemoteExtractor _sendData:completion:].cold.4();

        v49 = STExtractorErrorDomain;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("internal error processing byte ranges"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        STCreateError(v49, 1, v50, 0, (uint64_t)"-[STRemoteExtractor _sendData:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 836);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v80, 8);
        goto LABEL_69;
      }
      v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v22 > 0x400000)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        v29 = _sAvailableExtractionBuffer;
        if (!((unint64_t)_sAvailableExtractionBuffer >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
            v29 = _sAvailableExtractionBuffer;
          }
          while ((unint64_t)_sAvailableExtractionBuffer < 0x20000);
        }
        if (v29 >= v22)
          v30 = v22;
        else
          v30 = v29;
        _sAvailableExtractionBuffer = v29 - v30;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
        v81[3] = v30;
        STGetLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v45 = v81[3];
          *(_DWORD *)v101 = 136446978;
          v102 = "-[STRemoteExtractor _sendData:completion:]";
          v103 = 2048;
          v104 = v45;
          v105 = 2048;
          v106 = v21;
          v107 = 2048;
          v108 = v22;
          _os_log_debug_impl(&dword_2144F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}s: Reserved %ld bytes for too-big partial range {%lu, %lu}", v101, 0x2Au);
        }

        v65 = (void *)v22;
        goto LABEL_54;
      }
      STGetLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v44 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v101 = 136446466;
        v102 = "-[STRemoteExtractor _sendData:completion:]";
        v103 = 2048;
        v104 = v44;
        _os_log_debug_impl(&dword_2144F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}s: Waiting for %lu bytes to become available", v101, 0x16u);
      }

      v24 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v24)
      {
        pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
        while (_sAvailableExtractionBuffer < v24)
          pthread_cond_wait(&_sAvailableExtractionBufferCondition, &_sAvailableExtractionBufferMutex);
        _sAvailableExtractionBuffer -= v24;
        pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
      }
      v81[3] = v24;
    }
    v21 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_54:
    _Block_object_dispose(buf, 8);
    goto LABEL_55;
  }
  STGetLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[STRemoteExtractor _sendData:completion:].cold.3(v9, v10, v11);

  dispatch_group_enter(group);
  STGetSignpostHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v9;
    _os_signpost_emit_with_name_impl(&dword_2144F0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer (%lu bytes) to extraction service over XPC", buf, 0xCu);
  }

  -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x24BDAC760];
  v87[1] = 3221225472;
  v87[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_106;
  v87[3] = &unk_24D1A71F8;
  v14 = v62;
  v88 = v14;
  v89 = v9;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v87);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_107;
  v84[3] = &unk_24D1A7220;
  v85 = v14;
  v86 = v9;
  objc_msgSend(v15, "remote_supplyBytes:withCompletionBlock:", v66, v84);

  v16 = v88;
LABEL_68:

  -[STRemoteExtractor ioQueue](v64, "ioQueue");
  v46 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__STRemoteExtractor__sendData_completion___block_invoke_119;
  block[3] = &unk_24D1A72C0;
  v69 = v96;
  block[4] = v64;
  v68 = v61;
  v70 = v94;
  dispatch_group_notify(group, v46, block);

  v47 = 0;
LABEL_69:

  _Block_object_dispose(v94, 8);
  _Block_object_dispose(v96, 8);

LABEL_70:
  if (v47)
LABEL_71:
    (*((void (**)(id, void *, uint64_t))v61 + 2))(v61, v47, 1);
LABEL_72:

}

void __42__STRemoteExtractor__sendData_completion___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  uint64_t v8;
  id *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_QWORD *)(v8 + 40);
  v9 = (id *)(v8 + 40);
  if (!v10)
    objc_storeStrong(v9, a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
  _sAvailableExtractionBuffer += a4;
  pthread_cond_signal(&_sAvailableExtractionBufferCondition);
  pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __42__STRemoteExtractor__sendData_completion___block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  STGetLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__STRemoteExtractor__sendData_completion___block_invoke_106_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  STGetSignpostHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 134217984;
    v14 = v12;
    _os_signpost_emit_with_name_impl(&dword_2144F0000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (FAILED) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v13, 0xCu);
  }

}

void __42__STRemoteExtractor__sendData_completion___block_invoke_107(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  STGetSignpostHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = "FAILED";
    v6 = *(_QWORD *)(a1 + 40);
    if (!a2)
      v5 = "SUCCEEDED";
    v7 = 136315394;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_2144F0000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (%s) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v7, 0x16u);
  }

}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;

  if (a3 + a4 <= a1[6])
  {
    STGetLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_3();

  }
  else
  {
    if (a4 - 4194305 >= 0xFFFFFFFFFFC00000)
    {
      pthread_mutex_lock(&_sAvailableExtractionBufferMutex);
      if (_sAvailableExtractionBuffer >= a4)
      {
        _sAvailableExtractionBuffer -= a4;
        v9 = a4;
      }
      else
      {
        v9 = 0;
      }
      pthread_mutex_unlock(&_sAvailableExtractionBufferMutex);
    }
    else
    {
      v9 = 0;
    }
    STGetLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v12)
        __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_1();

      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += a4;
    }
    else
    {
      if (v12)
        __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_2();

      v13 = *(_QWORD *)(a1[5] + 8);
      *(_QWORD *)(v13 + 32) = a3;
      *(_QWORD *)(v13 + 40) = a4;
      *a5 = 1;
    }
  }
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_117(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  STGetSignpostHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "length");
    v4 = 134217984;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_2144F0000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (FAILED) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v4, 0xCu);
  }

}

void __42__STRemoteExtractor__sendData_completion___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  STGetSignpostHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    if (v3)
      v5 = "FAILED";
    else
      v5 = "SUCCEEDED";
    v6 = objc_msgSend(*(id *)(a1 + 32), "length");
    v7 = 136315394;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_2144F0000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (%s) processing buffer (%lu bytes) sent to extraction service over XPC", (uint8_t *)&v7, 0x16u);
  }

}

uint64_t __42__STRemoteExtractor__sendData_completion___block_invoke_119(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t (*v5)(void);

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  STGetLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "_invalidate");
    v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_1();

    v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v5();
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  NSObject *v33;
  __CFString *v34;
  NSObject *v35;
  __CFString *v36;
  NSObject *v37;
  __CFString *v38;
  NSObject *v39;
  __CFString *v40;
  _QWORD block[5];
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  STRemoteExtractor *v48;
  __int16 v49;
  STRemoteExtractor *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  v9 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke;
  v44[3] = &unk_24D1A72E8;
  v44[4] = self;
  v46 = v8;
  v10 = v7;
  v45 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199D0A50](v44);
  STGetLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v48 = (STRemoteExtractor *)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]";
    v49 = 2112;
    v50 = self;
    v51 = 2048;
    v52 = v8;
    _os_log_impl(&dword_2144F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: -supplyBytes:[%lu bytes]", buf, 0x20u);
  }

  STGetSignpostHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    v49 = 2048;
    v50 = (STRemoteExtractor *)v8;
    _os_signpost_emit_with_name_impl(&dword_2144F0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "%@: -supplyBytes:[%lu bytes] began", buf, 0x16u);
  }

  if (v6)
  {
    -[STRemoteExtractor error](self, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      STGetLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.7(self, v29);

      -[STRemoteExtractor error](self, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    if (!-[STRemoteExtractor isPrepared](self, "isPrepared"))
    {
      STGetLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.6();

      v31 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called before -prepareForExtraction on %@"), "-[STRemoteExtractor supplyBytes:withCompletionBlock:]", self);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      STCreateError(v31, 7, v32, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 953);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
    if (-[STRemoteExtractor isInvalid](self, "isInvalid"))
    {
      STGetLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.2();

      v34 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-supplyBytes: called on invalid extractor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v34;
      v26 = 8;
      v27 = v24;
      v28 = 954;
    }
    else
    {
      -[STRemoteExtractor ioQueue](self, "ioQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[STRemoteExtractor extractionServiceConnection](self, "extractionServiceConnection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_msgSend(v6, "copy");
          if (v17)
          {
            v18 = (void *)v17;
            -[STRemoteExtractor ioQueue](self, "ioQueue");
            v19 = objc_claimAutoreleasedReturnValue();
            block[0] = v9;
            block[1] = 3221225472;
            block[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135;
            block[3] = &unk_24D1A7130;
            block[4] = self;
            v20 = v18;
            v42 = v20;
            v43 = v11;
            dispatch_async(v19, block);

            v21 = 0;
            goto LABEL_13;
          }
          STGetLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.5();

          v40 = STExtractorErrorDomain;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unable to copy bytes"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v40;
          v26 = 1;
          v27 = v24;
          v28 = 961;
        }
        else
        {
          STGetLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.4();

          v38 = STExtractorErrorDomain;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no service connection for extraction service"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v38;
          v26 = 1;
          v27 = v24;
          v28 = 957;
        }
      }
      else
      {
        STGetLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.3();

        v36 = STExtractorErrorDomain;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no ioQueue"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v36;
        v26 = 1;
        v27 = v24;
        v28 = 956;
      }
    }
  }
  else
  {
    STGetLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor supplyBytes:withCompletionBlock:].cold.1();

    v23 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no bytes supplied to -supplyBytes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = 3;
    v27 = v24;
    v28 = 950;
  }
  STCreateError(v25, v26, v27, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
  if (v21)
    ((void (**)(_QWORD, void *, uint64_t))v11)[2](v11, v21, 1);
  v20 = 0;
LABEL_13:

}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  STGetSignpostHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = "failed";
    if (!v3)
      v7 = "succeeded";
    v12 = 138412802;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2080;
    v17 = v7;
    _os_signpost_emit_with_name_impl(&dword_2144F0000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "%@: -supplyBytes:[%lu bytes] %s", (uint8_t *)&v12, 0x20u);
  }

  if (!v3)
    goto LABEL_13;
  objc_msgSend(v3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_13;
  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ErrorCausedBySystemShuttingDown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  v11 = objc_msgSend(v10, "BOOLValue");

  if (!v11 || (objc_msgSend(*(id *)(a1 + 32), "suppressCompletionsDuringShutdown") & 1) == 0)
    goto LABEL_13;
LABEL_14:

}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  _QWORD block[5];
  void (**v24)(_QWORD);
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_4(v2, v9);

    objc_msgSend(*v2, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(*v2, "isPrepared") & 1) != 0)
  {
    if (objc_msgSend(*v2, "isInvalid"))
    {
      STGetLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_1();

      v15 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-supplyBytes: called on invalid extractor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = 8;
      v19 = v16;
      v20 = 970;
    }
    else
    {
      objc_msgSend(*v2, "extractionServiceConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = MEMORY[0x24BDAC760];
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_2;
        v26[3] = &unk_24D1A7130;
        v6 = *(void **)(a1 + 40);
        v26[4] = *(_QWORD *)(a1 + 32);
        v27 = v6;
        v28 = *(id *)(a1 + 48);
        v7 = (void (**)(_QWORD))MEMORY[0x2199D0A50](v26);
        if (objc_msgSend(*(id *)(a1 + 32), "dataStreamStarted"))
        {
          v7[2](v7);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "reservationQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = v5;
          block[1] = 3221225472;
          block[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_4;
          block[3] = &unk_24D1A7360;
          block[4] = *(_QWORD *)(a1 + 32);
          v24 = v7;
          v25 = *(id *)(a1 + 48);
          dispatch_async(v8, block);

        }
        return;
      }
      STGetLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_2();

      v22 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no service connection for extraction service"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;
      v18 = 1;
      v19 = v16;
      v20 = 972;
    }
    STCreateError(v17, v18, v19, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    STGetLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_3();

    v12 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called before -prepareForExtraction on %@"), "-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke", *v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v12, 7, v13, 0, (uint64_t)"-[STRemoteExtractor supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 969);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_3;
  v3[3] = &unk_24D1A7310;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_sendData:completion:", v2, v3);

}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;

  v5 = a2;
  if (v5 || a3)
    objc_msgSend(*(id *)(a1 + 32), "_releaseExtractionMemory");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_reserveExtractionMemory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ioQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_5;
  v7[3] = &unk_24D1A7338;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  dispatch_async(v3, v7);

  if (v2)
    (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v2, 1, v5, v6);

}

uint64_t __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDataStreamStarted:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[STRemoteExtractor ioQueue](self, "ioQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[STRemoteExtractor ioQueue](self, "ioQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke;
    v11[3] = &unk_24D1A7338;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v6, v11);

  }
  else
  {
    STGetLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor suspendStreamWithCompletionBlock:].cold.1();

    v8 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no ioQueue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v8, 1, v9, 0, (uint64_t)"-[STRemoteExtractor suspendStreamWithCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1034);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);

    }
  }

}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_4((uint64_t)v2, v4);

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
    goto LABEL_9;
  }
  if ((objc_msgSend(*v2, "isPrepared") & 1) != 0)
  {
    if (objc_msgSend(*v2, "isInvalid"))
    {
      STGetLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_1();

      v21 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-suspendStreamWithCompletionBlock: called on invalid extractor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      v17 = 8;
      v18 = v15;
      v19 = 1047;
    }
    else
    {
      objc_msgSend(*v2, "extractionServiceConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = MEMORY[0x24BDAC760];
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_2;
        v26[3] = &unk_24D1A73B0;
        v9 = *(void **)(a1 + 40);
        v26[4] = *(_QWORD *)(a1 + 32);
        v27 = v9;
        v10 = (void *)MEMORY[0x2199D0A50](v26);
        objc_msgSend(*(id *)(a1 + 32), "extractionServiceConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v8;
        v24[1] = 3221225472;
        v24[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_143;
        v24[3] = &unk_24D1A73D8;
        v25 = v10;
        v12 = v10;
        objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "remote_suspendStreamWithCompletionBlock:", v12);
LABEL_9:

        return;
      }
      STGetLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_2();

      v23 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: no connection to extraction service"), *v2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v23;
      v17 = 5;
      v18 = v15;
      v19 = 1049;
    }
  }
  else
  {
    STGetLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_3();

    v14 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called before prepare on %@"), "-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke", *v2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    v17 = 5;
    v18 = v15;
    v19 = 1046;
  }
  STCreateError(v16, v17, v18, 0, (uint64_t)"-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v6);
    goto LABEL_9;
  }
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "ioQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_3;
  v9[3] = &unk_24D1A7388;
  v12 = a2;
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  STGetLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 136446978;
    v8 = "-[STRemoteExtractor suspendStreamWithCompletionBlock:]_block_invoke_3";
    v9 = 2112;
    v10 = v4;
    v11 = 2048;
    v12 = v3;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_2144F0000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling suspend completion block with offset %llu, error %@", (uint8_t *)&v7, 0x2Au);
  }

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[STRemoteExtractor ioQueue](self, "ioQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[STRemoteExtractor ioQueue](self, "ioQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke;
    v11[3] = &unk_24D1A7338;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v6, v11);

  }
  else
  {
    STGetLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor finishStreamWithCompletionBlock:].cold.1();

    v8 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no ioQueue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v8, 1, v9, 0, (uint64_t)"-[STRemoteExtractor finishStreamWithCompletionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1098);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      (*((void (**)(id, void *))v4 + 2))(v4, v10);

    }
  }

}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_4((uint64_t)v2, v4);

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    goto LABEL_9;
  }
  if ((objc_msgSend(*v2, "isPrepared") & 1) != 0)
  {
    if (objc_msgSend(*v2, "isInvalid"))
    {
      STGetLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_1();

      v21 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-supplyBytes: called on invalid extractor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      v17 = 8;
      v18 = v15;
      v19 = 1111;
    }
    else
    {
      objc_msgSend(*v2, "extractionServiceConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = MEMORY[0x24BDAC760];
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_2;
        v26[3] = &unk_24D1A7158;
        v9 = *(void **)(a1 + 40);
        v26[4] = *(_QWORD *)(a1 + 32);
        v27 = v9;
        v10 = (void *)MEMORY[0x2199D0A50](v26);
        objc_msgSend(*(id *)(a1 + 32), "extractionServiceConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v8;
        v24[1] = 3221225472;
        v24[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_144;
        v24[3] = &unk_24D1A73D8;
        v25 = v10;
        v12 = v10;
        objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "remote_finishStreamWithCompletionBlock:", v12);
LABEL_9:

        return;
      }
      STGetLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_2();

      v23 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: no connection to extraction service"), *v2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v23;
      v17 = 5;
      v18 = v15;
      v19 = 1113;
    }
  }
  else
  {
    STGetLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_3();

    v14 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called before prepare on %@"), "-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke", *v2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    v17 = 5;
    v18 = v15;
    v19 = 1110;
  }
  STCreateError(v16, v17, v18, 0, (uint64_t)"-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6);
    goto LABEL_9;
  }
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ioQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_3;
  block[3] = &unk_24D1A7130;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  STGetLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 136446722;
    v7 = "-[STRemoteExtractor finishStreamWithCompletionBlock:]_block_invoke_3";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2144F0000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling finish completion block - error %@", (uint8_t *)&v6, 0x20u);
  }

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[STRemoteExtractor ioQueue](self, "ioQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[STRemoteExtractor ioQueue](self, "ioQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke;
    block[3] = &unk_24D1A7400;
    block[4] = self;
    v16 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    STGetLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STRemoteExtractor terminateStreamWithError:completionBlock:].cold.1();

    v11 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no ioQueue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    STCreateError(v11, 1, v12, 0, (uint64_t)"-[STRemoteExtractor terminateStreamWithError:completionBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", 1161);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v13);

    }
  }

}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  __CFString *v20;
  NSObject *v21;
  __CFString *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    STGetLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_4((uint64_t)v2, v4);

    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    goto LABEL_9;
  }
  if ((objc_msgSend(*v2, "isPrepared") & 1) != 0)
  {
    if (objc_msgSend(*v2, "isInvalid"))
    {
      STGetLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_1();

      v20 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-supplyBytes: called on invalid extractor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v20;
      v16 = 8;
      v17 = v14;
      v18 = 1174;
    }
    else
    {
      objc_msgSend(*v2, "extractionServiceConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = MEMORY[0x24BDAC760];
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_2;
        v25[3] = &unk_24D1A7158;
        v25[4] = *(_QWORD *)(a1 + 32);
        v26 = *(id *)(a1 + 48);
        v9 = (void *)MEMORY[0x2199D0A50](v25);
        objc_msgSend(*(id *)(a1 + 32), "extractionServiceConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v8;
        v23[1] = 3221225472;
        v23[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_145;
        v23[3] = &unk_24D1A73D8;
        v24 = v9;
        v11 = v9;
        objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v23);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "remote_terminateStreamWithError:completionBlock:", *(_QWORD *)(a1 + 40), v11);
LABEL_9:

        return;
      }
      STGetLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_2();

      v22 = STExtractorErrorDomain;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: no connection to extraction service"), *v2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v22;
      v16 = 5;
      v17 = v14;
      v18 = 1176;
    }
  }
  else
  {
    STGetLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_3();

    v13 = STExtractorErrorDomain;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called before prepare on %@"), "-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke", *v2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = 5;
    v17 = v14;
    v18 = 1173;
  }
  STCreateError(v15, v16, v17, 0, (uint64_t)"-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STRemoteExtractor.m", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v6);
    goto LABEL_9;
  }
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ioQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_3;
  block[3] = &unk_24D1A7130;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  STGetLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 136446722;
    v7 = "-[STRemoteExtractor terminateStreamWithError:completionBlock:]_block_invoke_3";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2144F0000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: calling terminate completion block - error %@", (uint8_t *)&v6, 0x20u);
  }

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setError:");
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_setExtractionProgress:(double)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[STRemoteExtractor extractorDelegate](self, "extractorDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "setExtractionProgress:", a3);
      v5 = v7;
    }
  }

}

- (void)remote_extractionCompleteAtArchivePath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STRemoteExtractor extractorDelegate](self, "extractorDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "extractionCompleteAtArchivePath:", v5);

}

- (void)remote_extractionEnteredPassthroughMode
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  -[STRemoteExtractor extractorDelegate](self, "extractorDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "extractionEnteredPassthroughMode");
      v3 = v5;
    }
  }

}

- (NSDictionary)options
{
  return &self->_options->super;
}

- (STExtractorDelegate)extractorDelegate
{
  return (STExtractorDelegate *)objc_loadWeakRetained((id *)&self->_extractorDelegate);
}

- (void)setExtractorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_extractorDelegate, a3);
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (unint64_t)lastResumptionOffset
{
  return self->_lastResumptionOffset;
}

- (void)setLastResumptionOffset:(unint64_t)a3
{
  self->_lastResumptionOffset = a3;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (OS_dispatch_queue)reservationQueue
{
  return self->_reservationQueue;
}

- (NSXPCConnection)extractionServiceConnection
{
  return self->_extractionServiceConnection;
}

- (ExtractionServiceInfo)extractionServiceInfo
{
  return self->_extractionServiceInfo;
}

- (STExtractionOriginator)internalExtractionOriginator
{
  return self->_internalExtractionOriginator;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isPrepared
{
  return self->_isPrepared;
}

- (void)setIsPrepared:(BOOL)a3
{
  self->_isPrepared = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)dataStreamStarted
{
  return self->_dataStreamStarted;
}

- (void)setDataStreamStarted:(BOOL)a3
{
  self->_dataStreamStarted = a3;
}

- (BOOL)finalBytesSent
{
  return self->_finalBytesSent;
}

- (void)setFinalBytesSent:(BOOL)a3
{
  self->_finalBytesSent = a3;
}

- (unint64_t)requiredExtractionMemory
{
  return self->_requiredExtractionMemory;
}

- (void)setRequiredExtractionMemory:(unint64_t)a3
{
  self->_requiredExtractionMemory = a3;
}

- (unint64_t)reservedExtractionMemory
{
  return self->_reservedExtractionMemory;
}

- (void)setReservedExtractionMemory:(unint64_t)a3
{
  self->_reservedExtractionMemory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_internalExtractionOriginator, 0);
  objc_storeStrong((id *)&self->_extractionServiceInfo, 0);
  objc_storeStrong((id *)&self->_extractionServiceConnection, 0);
  objc_storeStrong((id *)&self->_reservationQueue, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_destroyWeak((id *)&self->_extractorDelegate);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_18(&dword_2144F0000, a1, a3, "%{public}s: %s not available.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_17();
}

- (void)createOutputDir:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)suppressCompletionsDuringShutdown
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)doesConsumeExtractedData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)prepareForExtractionToPath:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)prepareForExtractionToPath:completionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)prepareForExtractionToPath:completionBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_6(uint64_t a1, NSObject *a2)
{
  int v4;
  int *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  v5 = __error();
  v6 = strerror(*v5);
  v7 = 136446978;
  v8 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  v9 = 2080;
  v10 = a1;
  v11 = 1024;
  v12 = v4;
  v13 = 2080;
  v14 = v6;
  _os_log_error_impl(&dword_2144F0000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to issue sandbox extension for \"%s\" : %d (%s)", (uint8_t *)&v7, 0x26u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_8(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  _os_log_error_impl(&dword_2144F0000, log, OS_LOG_TYPE_ERROR, "%{public}s: Trying to create it anyway.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_17();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_9(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136446722;
  v4 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  v5 = 2080;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_6(&dword_2144F0000, a3, (uint64_t)a3, "%{public}s: Failed to remove existing path: %s (%@)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_9();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __64__STRemoteExtractor_prepareForExtractionToPath_completionBlock___block_invoke_88_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22(*MEMORY[0x24BDAC8D0]);
  v3 = 136446722;
  v4 = "-[STRemoteExtractor prepareForExtractionToPath:completionBlock:]_block_invoke";
  v5 = 2112;
  v6 = v0;
  v7 = 2112;
  v8 = v1;
  OUTLINED_FUNCTION_6(&dword_2144F0000, v2, (uint64_t)v2, "%{public}s: %@: prepare returning error %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_9();
}

- (void)_sendData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_sendData:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_sendData:(uint64_t)a3 completion:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = "-[STRemoteExtractor _sendData:completion:]";
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_20(&dword_2144F0000, a2, a3, "%{public}s: Supplying entire byte range of data (%lu bytes)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_17();
}

- (void)_sendData:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_sendData:(NSObject *)a3 completion:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446466;
  *(_QWORD *)(a1 + 4) = "-[STRemoteExtractor _sendData:completion:]";
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a2;
  OUTLINED_FUNCTION_20(&dword_2144F0000, a3, (uint64_t)a3, "%{public}s: Starting to send %lu bytes to extractor in chunks", (uint8_t *)a1);
}

- (void)_sendData:completion:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_sendData:(void *)a1 completion:(NSObject *)a2 .cold.7(void *a1, NSObject *a2)
{
  void *v2;
  _QWORD *v3;
  id v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  _DWORD v14[18];

  OUTLINED_FUNCTION_16(*MEMORY[0x24BDAC8D0]);
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("-supplyBytes called on extractor that has already returned an error: %@"), v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = OUTLINED_FUNCTION_23(v8, v9);
  if (v10)
  {
    v3 = (_QWORD *)v3[249];
    objc_msgSend(a1, "error");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("-supplyBytes called on extractor that has already returned an error: %@"), a1);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    OUTLINED_FUNCTION_21(v11, v12);
  }
  v14[0] = 136447490;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  *(_DWORD *)((char *)&v14[13] + 2) = 737;
  OUTLINED_FUNCTION_3_0(&dword_2144F0000, a2, v13, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", (uint8_t *)v14);
  if (v10)
  {

  }
  OUTLINED_FUNCTION_8();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_106_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_18(&dword_2144F0000, a2, a3, "%{public}s: got error from remote connection: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_17();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  OUTLINED_FUNCTION_22(*MEMORY[0x24BDAC8D0]);
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 8) + 24);
  v4 = 136446978;
  v5 = "-[STRemoteExtractor _sendData:completion:]_block_invoke";
  v6 = 2048;
  v7 = v2;
  v8 = 2048;
  v9 = v1;
  v10 = 2048;
  v11 = v1 + v2;
  _os_log_debug_impl(&dword_2144F0000, v3, OS_LOG_TYPE_DEBUG, "%{public}s: Reserved %ld bytes; adding to existing length: %ld bytes; total reserved: %lu bytes",
    (uint8_t *)&v4,
    0x2Au);
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136446722;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_2144F0000, v0, (uint64_t)v0, "%{public}s: Failed to reserve last range; falling out with last range {%lu, %lu}",
    (uint8_t *)v1);
  OUTLINED_FUNCTION_9();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_112_cold_3()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136446722;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_2144F0000, v0, (uint64_t)v0, "%{public}s: Already processed {%lu, %lu}", (uint8_t *)v1);
  OUTLINED_FUNCTION_9();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_22(*MEMORY[0x24BDAC8D0]);
  v3[0] = 136446722;
  OUTLINED_FUNCTION_19();
  v4 = 2080;
  v5 = v0;
  OUTLINED_FUNCTION_13(&dword_2144F0000, v1, v2, "%{public}s: %@: calling supplyBytes: completion block with no error; dataComplete = %s",
    (uint8_t *)v3);
  OUTLINED_FUNCTION_9();
}

void __42__STRemoteExtractor__sendData_completion___block_invoke_119_cold_2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_22(*MEMORY[0x24BDAC8D0]);
  v3[0] = 136446722;
  OUTLINED_FUNCTION_19();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_6(&dword_2144F0000, v2, (uint64_t)v2, "%{public}s: %@: calling supplyBytes: completion block with error %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_9();
}

- (void)supplyBytes:withCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)supplyBytes:withCompletionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)supplyBytes:withCompletionBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)supplyBytes:withCompletionBlock:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)supplyBytes:withCompletionBlock:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)supplyBytes:withCompletionBlock:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)supplyBytes:(void *)a1 withCompletionBlock:(NSObject *)a2 .cold.7(void *a1, NSObject *a2)
{
  void *v2;
  _QWORD *v3;
  id v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  _DWORD v14[18];

  OUTLINED_FUNCTION_16(*MEMORY[0x24BDAC8D0]);
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("-supplyBytes called on extractor that has already returned an error: %@"), v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = OUTLINED_FUNCTION_23(v8, v9);
  if (v10)
  {
    v3 = (_QWORD *)v3[249];
    objc_msgSend(a1, "error");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("-supplyBytes called on extractor that has already returned an error: %@"), a1);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    OUTLINED_FUNCTION_21(v11, v12);
  }
  v14[0] = 136447490;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  *(_DWORD *)((char *)&v14[13] + 2) = 951;
  OUTLINED_FUNCTION_3_0(&dword_2144F0000, a2, v13, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", (uint8_t *)v14);
  if (v10)
  {

  }
  OUTLINED_FUNCTION_8();
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__STRemoteExtractor_supplyBytes_withCompletionBlock___block_invoke_135_cold_4(id *a1, NSObject *a2)
{
  void *v2;
  _QWORD *v3;
  id *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  _DWORD v14[18];

  OUTLINED_FUNCTION_16(*MEMORY[0x24BDAC8D0]);
  objc_msgSend(*v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("-supplyBytes called on extractor that has already returned an error: %@"), v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = OUTLINED_FUNCTION_23(v8, v9);
  if (v10)
  {
    v3 = (_QWORD *)v3[249];
    objc_msgSend(*a1, "error");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("-supplyBytes called on extractor that has already returned an error: %@"), a1);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    OUTLINED_FUNCTION_21(v11, v12);
  }
  v14[0] = 136447490;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  *(_DWORD *)((char *)&v14[13] + 2) = 967;
  OUTLINED_FUNCTION_3_0(&dword_2144F0000, a2, v13, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", (uint8_t *)v14);
  if (v10)
  {

  }
  OUTLINED_FUNCTION_8();
}

- (void)suspendStreamWithCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __54__STRemoteExtractor_suspendStreamWithCompletionBlock___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];

  objc_msgSend((id)OUTLINED_FUNCTION_15(a1), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446722;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2144F0000, a2, v4, "%{public}s: %@: suspend called on extractor that has already returned an error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_4();
}

- (void)finishStreamWithCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __53__STRemoteExtractor_finishStreamWithCompletionBlock___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];

  objc_msgSend((id)OUTLINED_FUNCTION_15(a1), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446722;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2144F0000, a2, v4, "%{public}s: %@: finish called on extractor that has already returned an error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_4();
}

- (void)terminateStreamWithError:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2144F0000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void __62__STRemoteExtractor_terminateStreamWithError_completionBlock___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];

  objc_msgSend((id)OUTLINED_FUNCTION_15(a1), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446722;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2144F0000, a2, v4, "%{public}s: %@: terminate called on extractor that has already returned an error: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_4();
}

@end
