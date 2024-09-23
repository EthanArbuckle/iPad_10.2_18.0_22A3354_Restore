@implementation SZExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_internalExtractorDelegate, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_inProcessUnzipper, 0);
  objc_storeStrong((id *)&self->_unzipServiceConnection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_extractionPath, 0);
}

- (SZExtractor)initWithOptions:(id)a3
{
  id v4;
  SZExtractor *v5;
  SZExtractor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SZExtractor;
  v5 = -[SZExtractor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SZExtractor _setUpWithPath:options:](v5, "_setUpWithPath:options:", 0, v4);

  return v6;
}

- (void)_setUpWithPath:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  NSString *v14;
  NSString *extractionPath;
  NSDictionary *v16;
  NSDictionary *options;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  id v26;
  uint8_t buf[4];
  SZExtractor *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SZExtractorOptionsHashesArray"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
        goto LABEL_6;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SZExtractorOptionsHashedChunkSize"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SZExtractorOptionsHashedChunkSize"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
LABEL_6:

          goto LABEL_7;
        }
      }
      v23 = (void *)MEMORY[0x1E0C99DA0];
      v24 = *MEMORY[0x1E0C99778];
      v25 = CFSTR("SZExtractor requires SZExtractorOptionsHashedChunkSize if passing multiple hashes in SZExtractorOptionsHashesArray");
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("SZExtractorOptionsHashesArray must be an array, but is a %@"), v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0C99DA0];
      v24 = *MEMORY[0x1E0C99778];
      v25 = (const __CFString *)v22;
    }
    objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_exception_throw(v26);
  }
LABEL_7:
  v14 = (NSString *)objc_msgSend(v6, "copy");
  extractionPath = self->_extractionPath;
  self->_extractionPath = v14;

  v16 = (NSDictionary *)objc_msgSend(v7, "copy");
  options = self->_options;
  self->_options = v16;

  SZGetLoggingHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1D4E55000, v18, OS_LOG_TYPE_DEFAULT, "%@: initialized with path: %@ options: %@", buf, 0x20u);
  }

}

+ (id)knownSZExtractorImplementations
{
  if (knownSZExtractorImplementations_onceToken != -1)
    dispatch_once(&knownSZExtractorImplementations_onceToken, &__block_literal_global);
  return (id)knownSZExtractorImplementations_result;
}

void __68__SZExtractor_KnownImplementations__knownSZExtractorImplementations__block_invoke()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  char v3;
  char v4;
  const char *v5;
  Class Class;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint8_t buf[4];
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (dlopen("/System/Library/PrivateFrameworks/InstallCoordination.framework/InstallCoordination", 9))
  {
    v2 = 0;
    v3 = 1;
    *(_QWORD *)&v1 = 136315138;
    v11 = v1;
    do
    {
      v4 = v3;
      v5 = off_1E98B0650[v2];
      Class = objc_getClass(v5);
      if (Class)
      {
        objc_msgSend(v0, "addObject:", Class);
      }
      else
      {
        SZGetLoggingHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          v13 = (char *)v5;
          _os_log_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEFAULT, "Unable to find class %s", buf, 0xCu);
        }

      }
      v3 = 0;
      v2 = 1;
    }
    while ((v4 & 1) != 0);
  }
  else
  {
    SZGetLoggingHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = dlerror();
      _os_log_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_DEFAULT, "Unable to open InstallCoordination library: %s\n", buf, 0xCu);
    }

  }
  v9 = objc_msgSend(v0, "copy", v11);
  v10 = (void *)knownSZExtractorImplementations_result;
  knownSZExtractorImplementations_result = v9;

}

- (SZExtractor)init
{
  SZExtractor *result;

  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  result = (SZExtractor *)_os_crash_msg();
  __break(1u);
  return result;
}

- (SZExtractor)initWithCoder:(id)a3
{
  id v4;
  SZExtractor *v5;
  uint64_t v6;
  NSDictionary *options;
  uint64_t v8;
  NSString *extractionPath;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  SZExtractor *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SZExtractor;
  v5 = -[SZExtractor init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("options"));
    v6 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extractionPath"));
    v8 = objc_claimAutoreleasedReturnValue();
    extractionPath = v5->_extractionPath;
    v5->_extractionPath = (NSString *)v8;

    v5->_isLocalExtractor = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocalExtractor"));
    v5->_privileged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("privileged"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "connection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isLocalExtractor = 0;
      objc_msgSend(v10, "valueForEntitlement:", CFSTR("com.apple.private.SZExtractor.privileged"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if ((v12 & 1) == 0)
        v5->_privileged = 0;

    }
    SZGetLoggingHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_DEFAULT, "%@: deserialized", buf, 0xCu);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *extractionPath;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  SZExtractor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SZExtractor needsPreparation](self, "needsPreparation")
    && -[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEFAULT, "%@: suspending stream in preparation for serializing ourselves", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__SZExtractor_encodeWithCoder___block_invoke;
    v8[3] = &unk_1E98B0C80;
    v8[4] = self;
    -[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:](self, "_suspendStreamWithCompletionBlockSynchronously:completion:", 1, v8);
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_options, CFSTR("options"));
  extractionPath = self->_extractionPath;
  if (extractionPath)
    objc_msgSend(v4, "encodeObject:forKey:", extractionPath, CFSTR("extractionPath"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isLocalExtractor, CFSTR("isLocalExtractor"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_privileged, CFSTR("privileged"));
  SZGetLoggingHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEFAULT, "%@: serialized", buf, 0xCu);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SZExtractor options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_13;
    objc_msgSend(v5, "extractionPath");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[SZExtractor extractionPath](self, "extractionPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_13;
    }
    objc_msgSend(v5, "extractionPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      -[SZExtractor extractionPath](self, "extractionPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        goto LABEL_13;
    }
    objc_msgSend(v5, "extractionPath");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[SZExtractor extractionPath](self, "extractionPath");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(v5, "extractionPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SZExtractor extractionPath](self, "extractionPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (v19)
          goto LABEL_15;
LABEL_13:
        LOBYTE(v20) = 0;
LABEL_16:

        goto LABEL_17;
      }

    }
LABEL_15:
    v22 = objc_msgSend(v5, "privileged");
    v20 = v22 ^ -[SZExtractor privileged](self, "privileged") ^ 1;
    goto LABEL_16;
  }
  LOBYTE(v20) = 0;
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[SZExtractor extractionPath](self, "extractionPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SZExtractor options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  if (v3)
  {
    -[SZExtractor extractionPath](self, "extractionPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 ^= objc_msgSend(v6, "hash");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SZExtractor extractionPath](self, "extractionPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SZExtractor options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_BYTE *)objc_msgSend(v4, "initWithPath:options:", v5, v6);

  if (self->_isLocalExtractor)
    v7[9] = 1;
  if (self->_privileged)
    v7[8] = 1;
  return v7;
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  SZExtractor *v8;
  SZExtractor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SZExtractor;
  v8 = -[SZExtractor init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[SZExtractor _setUpWithPath:options:](v8, "_setUpWithPath:options:", v6, v7);

  return v9;
}

- (SZExtractor)initWithPath:(id)a3 resumptionOffset:(unint64_t *)a4
{
  return -[SZExtractor initWithPath:options:resumptionOffset:](self, "initWithPath:options:resumptionOffset:", a3, 0, a4);
}

- (SZExtractor)initWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  SZExtractor *v6;
  SZExtractor *v7;
  SZExtractor *v8;

  v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  v7 = v6;
  if (v6
    && !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:](v6, "_synchronouslyPrepareForExtractionAtOffset:", a5))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (SZExtractor)initWithPath:(id)a3 md5Hashes:(id)a4 hashedChunkSize:(unint64_t)a5 resumptionOffset:(unint64_t *)a6
{
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  SZExtractor *v16;

  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "numberWithUnsignedLongLong:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", CFSTR("SZExtractorHashTypeMD5"), CFSTR("SZExtractorOptionsHashType"), v12, CFSTR("SZExtractorOptionsHashesArray"), v14, CFSTR("SZExtractorOptionsHashedChunkSize"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SZExtractor initWithPath:options:resumptionOffset:](self, "initWithPath:options:resumptionOffset:", v13, v15, a6);
  return v16;
}

- (id)initForRemoteExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  SZExtractor *v6;
  SZExtractor *v7;
  SZExtractor *v8;

  v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 0,
        !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:](v6, "_synchronouslyPrepareForExtractionAtOffset:", a5)))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)initForLocalExtractionWithPath:(id)a3 options:(id)a4 resumptionOffset:(unint64_t *)a5
{
  SZExtractor *v6;
  SZExtractor *v7;
  SZExtractor *v8;

  v6 = -[SZExtractor initWithPath:options:](self, "initWithPath:options:", a3, a4);
  v7 = v6;
  if (v6
    && (v6->_isLocalExtractor = 1,
        !-[SZExtractor _synchronouslyPrepareForExtractionAtOffset:](v6, "_synchronouslyPrepareForExtractionAtOffset:", a5)))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (BOOL)_synchronouslyPrepareForExtractionAtOffset:(unint64_t *)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SZExtractor__synchronouslyPrepareForExtractionAtOffset___block_invoke;
  v5[3] = &unk_1E98B0CA8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:](self, "_prepareForExtractionSynchronously:withCompletionBlock:", 1, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_serviceConnectionWithError:(id *)a3
{
  const __CFString *v4;
  void *v5;
  void *WeakRetained;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v11;

  if (-[SZExtractor privileged](self, "privileged"))
    v4 = CFSTR("com.apple.StreamingUnzipService.privileged");
  else
    v4 = CFSTR("com.apple.StreamingUnzipService");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", v4);
  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&SZConfiguredStreamingUnzipProtocolInterface_lock);
    WeakRetained = objc_loadWeakRetained(&SZConfiguredStreamingUnzipProtocolInterface_weakInterface);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEFF810);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&SZConfiguredStreamingUnzipProtocolInterface_weakInterface, WeakRetained);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&SZConfiguredStreamingUnzipProtocolInterface_lock);
    objc_msgSend(v5, "setRemoteObjectInterface:", WeakRetained);

    v7 = 0;
  }
  else
  {
    SZGetLoggingHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_ERROR, "Failed to create NSXPCConnection", (uint8_t *)&v11, 2u);
    }

    _CreateError((uint64_t)"-[SZExtractor _serviceConnectionWithError:]", 447, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Failed to create NSXPCConnection"), v9, v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v7 = objc_retainAutorelease(v7);
      *a3 = v7;
    }
  }

  return v5;
}

- (void)_prepareForRemoteExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *serialQueue;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  BOOL v14;

  v6 = a4;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractorBufferSubmissionQueue", v7);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v8;

  -[SZExtractor serialQueue](self, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke;
  block[3] = &unk_1E98B0D48;
  block[4] = self;
  v13 = v6;
  v14 = a3;
  v11 = v6;
  dispatch_sync(v10, block);

}

- (void)_prepareForLocalExtraction:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *serialQueue;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_process", v5);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v6;

  -[SZExtractor serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SZExtractor__prepareForLocalExtraction___block_invoke;
  block[3] = &unk_1E98B0D98;
  block[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, block);

}

- (void)_prepareForExtractionSynchronously:(BOOL)a3 withCompletionBlock:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD, uint64_t);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  SZExtractor *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  SZGetLoggingHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = self;
    _os_log_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEFAULT, "%@: preparing", buf, 0xCu);
  }

  -[SZExtractor extractionPath](self, "extractionPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    SZGetLoggingHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4E55000, v11, OS_LOG_TYPE_ERROR, "extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?", buf, 2u);
    }

    _CreateError((uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]", 622, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("extractionPath was nil. Did you mean to call -prepareForExtractionToPath:completionBlock: instead?"), v12, v20);
    goto LABEL_11;
  }
  if (-[SZExtractor hasHadPostSetupMethodsCalled](self, "hasHadPostSetupMethodsCalled"))
  {
    SZGetLoggingHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = (SZExtractor *)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]";
      _os_log_error_impl(&dword_1D4E55000, v9, OS_LOG_TYPE_ERROR, "Calling %s after any calls to other non-init methods on this instance is an error.", buf, 0xCu);
    }

    _CreateError((uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]", 628, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("Calling %s after any calls to other non-init methods on this instance is an error."), v10, (uint64_t)"-[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:]");
LABEL_11:
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v13;
    v6[2](v6, 0, v13);

    goto LABEL_13;
  }
  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    if (-[SZExtractor isLocalExtractor](self, "isLocalExtractor"))
      -[SZExtractor _prepareForLocalExtraction:](self, "_prepareForLocalExtraction:", v6);
    else
      -[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:](self, "_prepareForRemoteExtractionSynchronously:withCompletionBlock:", v4, v6);
  }
  else
  {
    -[SZExtractor error](self, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    SZGetLoggingHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        -[SZExtractor error](self, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = self;
        v23 = 2112;
        v24 = (unint64_t)v18;
        _os_log_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_DEFAULT, "%@: prepare called on extractor that had already returned error %@", buf, 0x16u);

      }
      -[SZExtractor error](self, "error");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (v17)
    {
      v19 = -[SZExtractor lastResumptionOffset](self, "lastResumptionOffset");
      *(_DWORD *)buf = 138412546;
      v22 = self;
      v23 = 2048;
      v24 = v19;
      _os_log_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_DEFAULT, "%@: prepare called on object that was already prepared; returning resumption offset %llu",
        buf,
        0x16u);
    }

    v6[2](v6, -[SZExtractor lastResumptionOffset](self, "lastResumptionOffset"), 0);
  }
LABEL_13:

}

- (void)prepareForExtraction:(id)a3
{
  -[SZExtractor _prepareForExtractionSynchronously:withCompletionBlock:](self, "_prepareForExtractionSynchronously:withCompletionBlock:", 0, a3);
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  SZExtractor *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SZGetLoggingHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_DEFAULT, "%@: preparing for extraction to path %@", (uint8_t *)&v9, 0x16u);
  }

  -[SZExtractor setExtractionPath:](self, "setExtractionPath:", v6);
  -[SZExtractor prepareForExtraction:](self, "prepareForExtraction:", v7);

}

- (void)_invalidateObject
{
  NSObject *v3;
  void *v4;
  NSXPCConnection *unzipServiceConnection;
  StreamingUnzipper *inProcessUnzipper;
  int v7;
  SZExtractor *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D4E55000, v3, OS_LOG_TYPE_DEFAULT, "%@: invalidating", (uint8_t *)&v7, 0xCu);
    }

    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    unzipServiceConnection = self->_unzipServiceConnection;
    self->_unzipServiceConnection = 0;

    inProcessUnzipper = self->_inProcessUnzipper;
    self->_inProcessUnzipper = 0;

  }
}

- (BOOL)_isValidObject
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)needsPreparation
{
  void *v2;
  BOOL v3;

  -[SZExtractor serialQueue](self, "serialQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  dispatch_group_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  SZExtractor *v35;
  id v36;
  id v37;
  _BYTE *v38;
  _QWORD *v39;
  _QWORD v40[4];
  NSObject *v41;
  _BYTE *v42;
  _QWORD *v43;
  _QWORD v44[3];
  char v45;
  _QWORD block[5];
  id v47;
  id v48;
  _QWORD v49[5];
  void (**v50)(_QWORD, _QWORD, _QWORD);
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  SZGetTraceHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "%@: Supply bytes with length %lu began", buf, 0x16u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke;
  v51[3] = &unk_1E98B0DC0;
  v53 = v8;
  v11 = v7;
  v52 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D826AE38](v51);
  -[SZExtractor error](self, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    SZGetLoggingHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      _os_log_error_impl(&dword_1D4E55000, v14, OS_LOG_TYPE_ERROR, "%@: supply called on extractor that had already returned error %@", buf, 0x16u);

    }
    -[SZExtractor error](self, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v15, 1);
  }
  else if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = self;
      _os_log_error_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]", 704, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called before -[SZExtractor prepareForExtraction:] on %@"), v17, (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v15, 1);
  }
  else if (-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1);
    v15 = (void *)objc_msgSend(v6, "copy");
    v49[0] = v10;
    v49[1] = 3221225472;
    v49[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_133;
    v49[3] = &unk_1E98B0DE8;
    v49[4] = self;
    v50 = v12;
    v18 = (void *)MEMORY[0x1D826AE38](v49);
    -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[SZExtractor serialQueue](self, "serialQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2;
      block[3] = &unk_1E98B0E10;
      block[4] = self;
      v47 = v15;
      v48 = v18;
      v21 = v18;
      dispatch_async(v20, block);

    }
    else
    {
      v25 = dispatch_group_create();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      v57 = 0;
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      v45 = 0;
      v40[0] = v10;
      v40[1] = 3221225472;
      v40[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_138;
      v40[3] = &unk_1E98B0E38;
      v42 = buf;
      v43 = v44;
      v26 = v25;
      v41 = v26;
      v27 = (void *)MEMORY[0x1D826AE38](v40);
      -[SZExtractor serialQueue](self, "serialQueue");
      v28 = objc_claimAutoreleasedReturnValue();
      v32[0] = v10;
      v32[1] = 3221225472;
      v32[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2_140;
      v32[3] = &unk_1E98B0F28;
      v33 = v15;
      v34 = v26;
      v35 = self;
      v36 = v27;
      v37 = v18;
      v38 = buf;
      v39 = v44;
      v29 = v18;
      v30 = v27;
      v31 = v26;
      dispatch_async(v28, v32);

      _Block_object_dispose(v44, 8);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    SZGetLoggingHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SZExtractor supplyBytes:withCompletionBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = self;
      _os_log_error_impl(&dword_1D4E55000, v22, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]", 710, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called on an invalidated object: %@"), v23, (uint64_t)"-[SZExtractor supplyBytes:withCompletionBlock:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v15, 1);
  }

}

- (void)_suspendStreamWithCompletionBlockSynchronously:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD, uint64_t);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  SZExtractor *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD block[5];
  id v29;
  _QWORD v30[5];
  void (**v31)(id, _QWORD, uint64_t);
  uint8_t buf[4];
  SZExtractor *v33;
  __int16 v34;
  SZExtractor *v35;
  uint64_t v36;

  v4 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, uint64_t))a4;
  SZGetLoggingHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = self;
    _os_log_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEFAULT, "%@: suspending stream", buf, 0xCu);
  }

  -[SZExtractor error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    SZGetLoggingHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      v21 = (SZExtractor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v21;
      _os_log_error_impl(&dword_1D4E55000, v9, OS_LOG_TYPE_ERROR, "%@: suspend called on extractor that had already returned error %@", buf, 0x16u);

    }
    -[SZExtractor error](self, "error");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      v34 = 2112;
      v35 = self;
      _os_log_error_impl(&dword_1D4E55000, v11, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]", 891, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called before -[SZExtractor prepareForExtraction:] on %@"), v12, (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
LABEL_17:
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v20 = (void *)v10;
    v6[2](v6, 0, v10);

    goto LABEL_19;
  }
  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = (SZExtractor *)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]";
      v34 = 2112;
      v35 = self;
      _os_log_error_impl(&dword_1D4E55000, v18, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]", 897, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called on an invalidated object: %@"), v19, (uint64_t)"-[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:]");
    goto LABEL_17;
  }
  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1);
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke;
  v30[3] = &unk_1E98B0F50;
  v30[4] = self;
  v31 = v6;
  v14 = (void *)MEMORY[0x1D826AE38](v30);
  -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_2;
    block[3] = &unk_1E98B0D98;
    block[4] = self;
    v29 = v14;
    v17 = v14;
    dispatch_async(v16, block);

  }
  else
  {
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_3;
    v26[3] = &unk_1E98B0F78;
    v27 = v14;
    v22 = v14;
    v23 = (void *)MEMORY[0x1D826AE38](v26);
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v4)
      objc_msgSend(v24, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
    else
      objc_msgSend(v24, "remoteObjectProxyWithErrorHandler:", v23);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "suspendStreamWithReply:", v22);
  }

LABEL_19:
}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  -[SZExtractor _suspendStreamWithCompletionBlockSynchronously:completion:](self, "_suspendStreamWithCompletionBlockSynchronously:completion:", 0, a3);
}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  SZExtractor *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  void *v25;
  _QWORD block[5];
  void *v27;
  _QWORD v28[5];
  void (**v29)(id, uint64_t);
  uint8_t buf[4];
  SZExtractor *v31;
  __int16 v32;
  SZExtractor *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  SZGetLoggingHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = self;
    _os_log_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEFAULT, "%@: finishing stream", buf, 0xCu);
  }

  -[SZExtractor error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    SZGetLoggingHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      v20 = (SZExtractor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = self;
      v32 = 2112;
      v33 = v20;
      _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "%@: finish called on extractor that had already returned error %@", buf, 0x16u);

    }
    -[SZExtractor error](self, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      v32 = 2112;
      v33 = self;
      _os_log_error_impl(&dword_1D4E55000, v9, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]", 949, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called before -[SZExtractor prepareForExtraction:] on %@"), v10, (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
LABEL_17:
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v19 = (void *)v8;
    v4[2](v4, v8);

    goto LABEL_19;
  }
  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = (SZExtractor *)"-[SZExtractor finishStreamWithCompletionBlock:]";
      v32 = 2112;
      v33 = self;
      _os_log_error_impl(&dword_1D4E55000, v17, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]", 955, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called on an invalidated object: %@"), v18, (uint64_t)"-[SZExtractor finishStreamWithCompletionBlock:]");
    goto LABEL_17;
  }
  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1);
  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke;
  v28[3] = &unk_1E98B0CF8;
  v28[4] = self;
  v29 = v4;
  v12 = (void *)MEMORY[0x1D826AE38](v28);
  -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E98B0D98;
    block[4] = self;
    v27 = v12;
    v15 = v12;
    dispatch_async(v14, block);

    v16 = v27;
  }
  else
  {
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_3;
    v24[3] = &unk_1E98B0F78;
    v25 = v12;
    v22 = v12;
    objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "finishStreamWithReply:", v22);

    v16 = v25;
  }

LABEL_19:
}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  SZExtractor *v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  SZExtractor *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  void *v28;
  _QWORD block[5];
  void *v30;
  _QWORD v31[5];
  void (**v32)(id, uint64_t);
  uint8_t buf[4];
  SZExtractor *v34;
  __int16 v35;
  SZExtractor *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (SZExtractor *)a3;
  v7 = (void (**)(id, uint64_t))a4;
  SZGetLoggingHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = self;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_DEFAULT, "%@: terminating stream with error %@", buf, 0x16u);
  }

  -[SZExtractor error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SZGetLoggingHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SZExtractor error](self, "error");
      v23 = (SZExtractor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = self;
      v35 = 2112;
      v36 = v23;
      _os_log_error_impl(&dword_1D4E55000, v10, OS_LOG_TYPE_ERROR, "%@: terminate called on extractor that had already returned error %@", buf, 0x16u);

    }
    -[SZExtractor error](self, "error");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      v35 = 2112;
      v36 = self;
      _os_log_error_impl(&dword_1D4E55000, v12, OS_LOG_TYPE_ERROR, "%s called before -[SZExtractor prepareForExtraction:] on %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]", 993, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called before -[SZExtractor prepareForExtraction:] on %@"), v13, (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
LABEL_17:
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v22 = (void *)v11;
    v7[2](v7, v11);

    goto LABEL_19;
  }
  if (!-[SZExtractor _isValidObject](self, "_isValidObject"))
  {
    SZGetLoggingHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = (SZExtractor *)"-[SZExtractor terminateStreamWithError:completionBlock:]";
      v35 = 2112;
      v36 = self;
      _os_log_error_impl(&dword_1D4E55000, v20, OS_LOG_TYPE_ERROR, "%s called on an invalidated object: %@", buf, 0x16u);
    }

    _CreateError((uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]", 999, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("%s called on an invalidated object: %@"), v21, (uint64_t)"-[SZExtractor terminateStreamWithError:completionBlock:]");
    goto LABEL_17;
  }
  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1);
  -[SZExtractor setError:](self, "setError:", v6);
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke;
  v31[3] = &unk_1E98B0CF8;
  v31[4] = self;
  v32 = v7;
  v15 = (void *)MEMORY[0x1D826AE38](v31);
  -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_2;
    block[3] = &unk_1E98B0D98;
    block[4] = self;
    v30 = v15;
    v18 = v15;
    dispatch_async(v17, block);

    v19 = v30;
  }
  else
  {
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_3;
    v27[3] = &unk_1E98B0F78;
    v28 = v15;
    v25 = v15;
    objc_msgSend(v24, "remoteObjectProxyWithErrorHandler:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "terminateStreamWithReply:", v25);

    v19 = v28;
  }

LABEL_19:
}

- (BOOL)doesConsumeExtractedData
{
  return 0;
}

- (void)setExtractorDelegate:(id)a3
{
  char *v4;
  NSObject *v5;
  const char *v6;
  BOOL v7;
  NSObject *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  SZExtractor *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (-[SZExtractor needsPreparation](self, "needsPreparation"))
  {
    SZGetLoggingHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2080;
      v16 = "-[SZExtractor setExtractorDelegate:]";
      v6 = "%@: %s was called before -[SZExtractor prepareForExtraction:]; this doesn't do anything";
LABEL_20:
      _os_log_error_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v13, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v7 = -[SZExtractor _isValidObject](self, "_isValidObject");
  SZGetLoggingHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2080;
      v16 = "-[SZExtractor setExtractorDelegate:]";
      v6 = "%@: %s was called on an invalidated object";
      goto LABEL_20;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = self;
    v15 = 2048;
    v16 = v4;
    _os_log_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting extractor delegate to 0x%p", (uint8_t *)&v13, 0x16u);
  }

  -[SZExtractor setHasHadPostSetupMethodsCalled:](self, "setHasHadPostSetupMethodsCalled:", 1);
  v9 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    LODWORD(v10) = v9 & 1 | 2;
  else
    LODWORD(v10) = v9 & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = v10 | 4;
  else
    v10 = v10;
  -[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    objc_storeWeak((id *)(v11 + 8), v4);

  -[SZExtractor setActiveExtractorDelegateMethods:](self, "setActiveExtractorDelegateMethods:", v10);
LABEL_18:

}

- (SZExtractorDelegate)delegate
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  -[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  else
    WeakRetained = 0;

  return (SZExtractorDelegate *)WeakRetained;
}

- (SZExtractorDelegate)extractorDelegate
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  -[SZExtractor internalExtractorDelegate](self, "internalExtractorDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  else
    WeakRetained = 0;

  return (SZExtractorDelegate *)WeakRetained;
}

- (void)setActiveExtractorDelegateMethods:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD block[5];
  int v11;
  uint8_t buf[4];
  SZExtractor *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  SZGetLoggingHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting active extractor delegate methods to 0x%x", buf, 0x12u);
  }

  -[SZExtractor inProcessUnzipper](self, "inProcessUnzipper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SZExtractor serialQueue](self, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke;
    block[3] = &unk_1E98B0FA0;
    block[4] = self;
    v11 = v3;
    dispatch_async(v7, block);
  }
  else
  {
    -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke_2;
    v9[3] = &unk_1E98B0FC8;
    v9[4] = self;
    -[NSObject remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveDelegateMethods:", v3);

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  -[SZExtractor extractionPath](self, "extractionPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SZExtractor extractionPath](self, "extractionPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SZExtractor extractionPath](self, "extractionPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pathEnding:%@/%@"), v8, v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("path:nil");
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SZExtractor needsPreparation](self, "needsPreparation");
  -[SZExtractor unzipServiceConnection](self, "unzipServiceConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SZExtractor error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 89;
  if (v14)
    v17 = 89;
  else
    v17 = 78;
  if (v13)
    v16 = 78;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@<%p> prepared:%c valid:%c %@ error:%@>"), v12, self, v16, v17, v9, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (NSString)extractionPath
{
  return self->_extractionPath;
}

- (void)setExtractionPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)options
{
  return self->_options;
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

- (NSXPCConnection)unzipServiceConnection
{
  return self->_unzipServiceConnection;
}

- (StreamingUnzipper)inProcessUnzipper
{
  return self->_inProcessUnzipper;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (SZExtractorInternalDelegate)internalExtractorDelegate
{
  return self->_internalExtractorDelegate;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isLocalExtractor
{
  return self->_isLocalExtractor;
}

- (void)setNeedsPreparation:(BOOL)a3
{
  self->_needsPreparation = a3;
}

- (BOOL)hasHadPostSetupMethodsCalled
{
  return self->_hasHadPostSetupMethodsCalled;
}

- (void)setHasHadPostSetupMethodsCalled:(BOOL)a3
{
  self->_hasHadPostSetupMethodsCalled = a3;
}

void __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveDelegateMethods:", *(unsigned int *)(a1 + 40));

}

void __49__SZExtractor_setActiveExtractorDelegateMethods___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SZGetLoggingHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to set delegate methods enabled: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SZGetLoggingHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with error %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");

}

void __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "terminateStreamWithReply:", *(_QWORD *)(a1 + 40));

}

uint64_t __56__SZExtractor_terminateStreamWithError_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SZGetLoggingHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with error %@", (uint8_t *)&v6, 0x16u);
  }

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");

}

void __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishStreamWithReply:", *(_QWORD *)(a1 + 40));

}

uint64_t __47__SZExtractor_finishStreamWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SZGetLoggingHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with offset %llu, error %@", (uint8_t *)&v8, 0x20u);
  }

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");

}

void __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspendStreamWithReply:", *(_QWORD *)(a1 + 40));

}

uint64_t __73__SZExtractor__suspendStreamWithCompletionBlockSynchronously_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SZGetTraceHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v3)
      v6 = 78;
    else
      v6 = 89;
    v7 = 134218240;
    v8 = v5;
    v9 = 1024;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "Supply bytes with length %lu succeeded: %c", (uint8_t *)&v7, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_133(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  SZGetLoggingHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "%@: calling completion block with error %@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (a3)
        v10 = 89;
      else
        v10 = 78;
      v11 = 138412546;
      v12 = v9;
      v13 = 1024;
      LODWORD(v14) = v10;
      _os_log_debug_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEBUG, "%@: calling completion block with no error, dataComplete=%c", (uint8_t *)&v11, 0x12u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supplyBytes:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_138(uint64_t a1, void *a2, char a3, uint64_t a4)
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
  pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
  _sAvailableExtractionMemory += a4;
  pthread_cond_broadcast(&_sAvailableExtractionMemoryCondition);
  pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_2_140(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  NSObject *v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  unint64_t v41;
  _QWORD block[4];
  id v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t *v52;
  _QWORD v53[7];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  unint64_t v60;
  _QWORD v61[4];
  NSObject *v62;
  unint64_t v63;
  uint8_t v64[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  unint64_t v69;
  _BYTE buf[24];
  void *v71;
  __int128 v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  if ((unint64_t)(v2 - 5242881) >= 0xFFFFFFFFFFB00000)
  {
    v3 = v2;
    pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
    if (_sAvailableExtractionMemory >= v3)
      _sAvailableExtractionMemory -= v3;
    else
      v3 = 0;
    pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
  }
  else
  {
    v3 = 0;
  }
  if (v3 == objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    SZGetLoggingHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v3;
      _os_log_debug_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_DEBUG, "Supplying entire byte range data of length %lu", buf, 0xCu);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    SZGetTraceHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v3;
      _os_signpost_emit_with_name_impl(&dword_1D4E55000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer of size %lu to the unzip service over XPC", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "unzipServiceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_143;
    v61[3] = &unk_1E98B0E60;
    v62 = *(id *)(a1 + 56);
    v63 = v3;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v61);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_144;
    v58[3] = &unk_1E98B0DC0;
    v59 = *(id *)(a1 + 56);
    v60 = v3;
    objc_msgSend(v7, "supplyBytes:withReply:", v8, v58);

    v9 = v62;
    goto LABEL_62;
  }
  SZGetTraceHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "length");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v11;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Starting fragmentation of the supplied buffer of length : %lu", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v12 = 0;
    v41 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v54 = 0;
      v55 = &v54;
      v56 = 0x2020000000;
      v57 = 0;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v18 = v13 - v12 + v41;
      if (v18)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        v19 = _sAvailableExtractionMemory;
        if (!((unint64_t)_sAvailableExtractionMemory >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
            v19 = _sAvailableExtractionMemory;
          }
          while ((unint64_t)_sAvailableExtractionMemory < 0x20000);
        }
        if (v19 < v18)
          v18 = v19;
        _sAvailableExtractionMemory = v19 - v18;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
        v20 = (unint64_t *)(v55 + 3);
      }
      else
      {
        v20 = (unint64_t *)&v57;
      }
      *v20 = v18;
      SZGetLoggingHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v36 = v55[3];
        *(_DWORD *)buf = 134218752;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2048;
        v71 = (void *)v13;
        LOWORD(v72) = 2048;
        *(_QWORD *)((char *)&v72 + 2) = v41;
        _os_log_debug_impl(&dword_1D4E55000, v21, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}", buf, 0x2Au);
      }

LABEL_49:
      SZGetLoggingHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v35 = v55[3];
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v12;
        _os_log_debug_impl(&dword_1D4E55000, v25, OS_LOG_TYPE_DEBUG, "Supplying byte range data of length %lu at location %lu", buf, 0x16u);
      }

      v26 = (void *)MEMORY[0x1D826ACB8]();
      objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", v12, v55[3]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      SZGetTraceHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v28))
      {
        v29 = objc_msgSend(v27, "length");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v29;
        _os_signpost_emit_with_name_impl(&dword_1D4E55000, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer of size %lu to the unzip service over XPC", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 48), "unzipServiceConnection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_164;
      v49[3] = &unk_1E98B0EB0;
      v51 = *(id *)(a1 + 56);
      v52 = &v54;
      v31 = v27;
      v50 = v31;
      objc_msgSend(v30, "remoteObjectProxyWithErrorHandler:", v49);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_165;
      v45[3] = &unk_1E98B0ED8;
      v47 = *(id *)(a1 + 56);
      v48 = &v54;
      v33 = v31;
      v46 = v33;
      objc_msgSend(v32, "supplyBytes:withReply:", v33, v45);

      objc_autoreleasePoolPop(v26);
      v12 += v55[3];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_58;
      if (v12 >= v41 + v13)
      {
        SZGetLoggingHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v41;
          _os_log_debug_impl(&dword_1D4E55000, v34, OS_LOG_TYPE_DEBUG, "Active partial range {%lu, %lu} exhausted", buf, 0x16u);
        }

        v41 = 0;
LABEL_58:
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      _Block_object_dispose(&v54, 8);
      if (v12 >= objc_msgSend(*(id *)(a1 + 32), "length"))
        goto LABEL_60;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3010000000;
    v71 = &unk_1D4E81FA5;
    v72 = xmmword_1D4E78260;
    v14 = *(void **)(a1 + 32);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_146;
    v53[3] = &unk_1E98B0E88;
    v53[5] = buf;
    v53[6] = v12;
    v53[4] = &v54;
    objc_msgSend(v14, "enumerateByteRangesUsingBlock:", v53);
    if (!v55[3])
    {
      v13 = *(_QWORD *)(*(_QWORD *)&buf[8] + 32);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        __assert_rtn("-[SZExtractor supplyBytes:withCompletionBlock:]_block_invoke_2", "SZExtractor.m", 822, "NSNotFound != lastByteRange.location");
      v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v15 > 0x500000)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        v22 = _sAvailableExtractionMemory;
        if (!((unint64_t)_sAvailableExtractionMemory >> 17))
        {
          do
          {
            pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
            v22 = _sAvailableExtractionMemory;
          }
          while ((unint64_t)_sAvailableExtractionMemory < 0x20000);
        }
        if (v22 >= v15)
          v23 = v15;
        else
          v23 = v22;
        _sAvailableExtractionMemory = v22 - v23;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
        v55[3] = v23;
        SZGetLoggingHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v38 = v55[3];
          *(_DWORD *)v64 = 134218496;
          v65 = v38;
          v66 = 2048;
          v67 = v13;
          v68 = 2048;
          v69 = v15;
          _os_log_debug_impl(&dword_1D4E55000, v24, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes for too-big partial range {%lu, %lu}", v64, 0x20u);
        }

        v41 = v15;
        goto LABEL_48;
      }
      SZGetLoggingHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v64 = 134217984;
        v65 = v37;
        _os_log_debug_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_DEBUG, "Waiting for %lu bytes to become available", v64, 0xCu);
      }

      v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v17)
      {
        pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
        while (_sAvailableExtractionMemory < v17)
          pthread_cond_wait(&_sAvailableExtractionMemoryCondition, &_sAvailableExtractionMemoryMutex);
        _sAvailableExtractionMemory -= v17;
        pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
      }
      v55[3] = v17;
    }
    v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_48:
    _Block_object_dispose(buf, 8);
    goto LABEL_49;
  }
LABEL_60:
  SZGetTraceHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Ending fragmentation of the supplied buffer", buf, 2u);
  }
LABEL_62:

  v39 = *(NSObject **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "serialQueue");
  v40 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_168;
  block[3] = &unk_1E98B0F00;
  v43 = *(id *)(a1 + 64);
  v44 = *(_OWORD *)(a1 + 72);
  dispatch_group_notify(v39, v40, block);

}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_143(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  SZGetTraceHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 134217984;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)&v4, 0xCu);
  }

}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_144(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  SZGetTraceHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (a2)
      v6 = 78;
    else
      v6 = 89;
    v7[0] = 67109376;
    v7[1] = v6;
    v8 = 2048;
    v9 = v5;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)v7, 0x12u);
  }

}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_146(_QWORD *a1, uint64_t a2, unint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 + a4 <= a1[6])
  {
    SZGetLoggingHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134218240;
      v16 = a3;
      v17 = 2048;
      v18 = a4;
      _os_log_debug_impl(&dword_1D4E55000, v10, OS_LOG_TYPE_DEBUG, "Already processed {%lu, %lu}", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    if (a4 - 5242881 >= 0xFFFFFFFFFFB00000)
    {
      pthread_mutex_lock(&_sAvailableExtractionMemoryMutex);
      if (_sAvailableExtractionMemory >= a4)
      {
        _sAvailableExtractionMemory -= a4;
        v9 = a4;
      }
      else
      {
        v9 = 0;
      }
      pthread_mutex_unlock(&_sAvailableExtractionMemoryMutex);
    }
    else
    {
      v9 = 0;
    }
    SZGetLoggingHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v12)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
        v15 = 134218240;
        v16 = a4;
        v17 = 2048;
        v18 = v14;
        _os_log_debug_impl(&dword_1D4E55000, v11, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes; adding to existing length %ld",
          (uint8_t *)&v15,
          0x16u);
      }

      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += a4;
    }
    else
    {
      if (v12)
      {
        v15 = 134218240;
        v16 = a3;
        v17 = 2048;
        v18 = a4;
        _os_log_debug_impl(&dword_1D4E55000, v11, OS_LOG_TYPE_DEBUG, "Failed to reserve last range; falling out with last range {%lu, %lu}",
          (uint8_t *)&v15,
          0x16u);
      }

      v13 = *(_QWORD *)(a1[5] + 8);
      *(_QWORD *)(v13 + 32) = a3;
      *(_QWORD *)(v13 + 40) = a4;
      *a5 = 1;
    }
  }
}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_164(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  SZGetTraceHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "length");
    v4 = 134217984;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)&v4, 0xCu);
  }

}

void __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  SZGetTraceHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    if (v3)
      v5 = 78;
    else
      v5 = 89;
    v6 = objc_msgSend(*(id *)(a1 + 32), "length");
    v7[0] = 67109376;
    v7[1] = v5;
    v8 = 2048;
    v9 = v6;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)v7, 0x12u);
  }

}

uint64_t __47__SZExtractor_supplyBytes_withCompletionBlock___block_invoke_168(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));
}

void __42__SZExtractor__prepareForLocalExtraction___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  SZExtractorInternalDelegate *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  dispatch_queue_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  dispatch_queue_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v2 = -[StreamingUnzipper initForClient:connection:]([StreamingUnzipper alloc], "initForClient:connection:", CFSTR("In-process unzipper"), 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  v5 = objc_alloc_init(SZExtractorInternalDelegate);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extractionPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0)
    goto LABEL_4;
  v36 = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 16877);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extractionPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v15 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, v12, &v31);
  v16 = (dispatch_queue_t)v31;

  if (v15)
  {

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "extractionPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "options");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __42__SZExtractor__prepareForLocalExtraction___block_invoke_2;
    v30[3] = &unk_1E98B0D70;
    v30[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v17, "setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:", v18, 0, v19, v30);

    objc_msgSend(*(id *)(a1 + 32), "internalExtractorDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInProcessExtractorDelegate:", v20);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_proces_delegate", v12);
    objc_msgSend(*(id *)(a1 + 32), "inProcessUnzipper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInProcessDelegateQueue:", v16);
    goto LABEL_8;
  }
  SZGetLoggingHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "extractionPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v29;
    v34 = 2112;
    v35 = v16;
    _os_log_error_impl(&dword_1D4E55000, v23, OS_LOG_TYPE_ERROR, "Failed to create extraction directory at path %@: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "extractionPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"-[SZExtractor _prepareForLocalExtraction:]_block_invoke", 594, CFSTR("SZExtractorErrorDomain"), 1, v16, 0, CFSTR("Failed to create extraction directory at path %@: %@"), v25, (uint64_t)v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v22);
LABEL_8:

  v26 = *(_QWORD *)(a1 + 40);
  v27 = objc_msgSend(*(id *)(a1 + 32), "lastResumptionOffset");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v26 + 16))(v26, v27, v28);

}

uint64_t __42__SZExtractor__prepareForLocalExtraction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "setLastResumptionOffset:", a3);
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  SZExtractorInternalDelegate *v7;
  uint64_t v8;
  void *v9;
  void *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char *v60;
  void *v61;
  char *v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  id v66;
  char *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _BYTE location[12];
  __int16 v74;
  char *v75;
  __int16 v76;
  char *v77;
  uint64_t v78;
  void *v79;
  char __s[1024];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  bzero(__s, 0x400uLL);
  v2 = *(void **)(a1 + 32);
  v72 = 0;
  objc_msgSend(v2, "_serviceConnectionWithError:", &v72);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (char *)v72;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "unzipServiceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = v6 == 0;

  if (!(_DWORD)v3)
  {
    v7 = objc_alloc_init(SZExtractorInternalDelegate);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 64);
    *(_QWORD *)(v8 + 64) = v7;

    os_unfair_lock_lock((os_unfair_lock_t)&SZConfiguredStreamingUnzipDelegateProtocolInterface_lock);
    WeakRetained = objc_loadWeakRetained(&SZConfiguredStreamingUnzipDelegateProtocolInterface_weakInterface);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEFD6C8);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&SZConfiguredStreamingUnzipDelegateProtocolInterface_weakInterface, WeakRetained);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&SZConfiguredStreamingUnzipDelegateProtocolInterface_lock);
    objc_msgSend(*(id *)(a1 + 32), "unzipServiceConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExportedInterface:", WeakRetained);

    objc_msgSend(*(id *)(a1 + 32), "internalExtractorDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "unzipServiceConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExportedObject:", v12);

    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v14 = MEMORY[0x1E0C809B0];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2;
    v70[3] = &unk_1E98B0CD0;
    objc_copyWeak(&v71, (id *)location);
    objc_msgSend(*(id *)(a1 + 32), "unzipServiceConnection");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "setInterruptionHandler:", v70);

    v68[0] = v14;
    v68[1] = 3221225472;
    v68[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_87;
    v68[3] = &unk_1E98B0CD0;
    objc_copyWeak(&v69, (id *)location);
    objc_msgSend(*(id *)(a1 + 32), "unzipServiceConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInvalidationHandler:", v68);

    objc_destroyWeak(&v69);
    objc_destroyWeak(&v71);
    objc_destroyWeak((id *)location);
    objc_msgSend(*(id *)(a1 + 32), "unzipServiceConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resume");

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "extractionPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v18, "fileExistsAtPath:", v19);

    if ((v15 & 1) != 0)
    {
      v20 = v4;
    }
    else
    {
      v78 = *MEMORY[0x1E0CB2AA8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 16877);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "extractionPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v4;
      v25 = objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v24, 1, v22, &v67);
      v20 = v67;

      if (!v25)
      {
        SZGetLoggingHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "extractionPath");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412546;
          *(_QWORD *)&location[4] = v61;
          v74 = 2112;
          v75 = v20;
          _os_log_error_impl(&dword_1D4E55000, v41, OS_LOG_TYPE_ERROR, "Failed to create extraction directory at path %@: %@", location, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "extractionPath");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 510, CFSTR("SZExtractorErrorDomain"), 1, v20, 0, CFSTR("Failed to create extraction directory at path %@: %@"), v43, (uint64_t)v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setError:", v44);
LABEL_22:
        v4 = v20;
        goto LABEL_23;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(a1 + 32), "extractionPath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v26, "fileSystemRepresentationWithPath:", v27), __s) == 0;

    if (v28)
    {
      v36 = *__error();
      SZGetLoggingHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "extractionPath");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = strerror(v36);
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = v59;
        v74 = 2080;
        v75 = __s;
        v76 = 2080;
        v77 = v60;
        _os_log_error_impl(&dword_1D4E55000, v37, OS_LOG_TYPE_ERROR, "Failed to realpath \"%@\" at \"%s\": %s", location, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "extractionPath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v36);
      _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 517, (void *)*MEMORY[0x1E0CB2FE0], v36, 0, 0, CFSTR("Failed to realpath \"%@\" at \"%s\": %s"), v39, (uint64_t)v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setError:", v40);
    }
    else
    {
      v29 = (void *)sandbox_extension_issue_file();
      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v65[0] = v14;
        v65[1] = 3221225472;
        v65[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_99;
        v65[3] = &unk_1E98B0CF8;
        v65[4] = *(_QWORD *)(a1 + 32);
        v66 = *(id *)(a1 + 40);
        v32 = (void *)MEMORY[0x1D826AE38](v65);
        v33 = *(_BYTE *)(a1 + 48) == 0;
        objc_msgSend(*(id *)(a1 + 32), "unzipServiceConnection");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v33)
          objc_msgSend(v34, "remoteObjectProxyWithErrorHandler:", v32);
        else
          objc_msgSend(v34, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "options");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v14;
        v63[1] = 3221225472;
        v63[2] = __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_103;
        v63[3] = &unk_1E98B0D20;
        v63[4] = *(_QWORD *)(a1 + 32);
        v64 = *(id *)(a1 + 40);
        objc_msgSend(v57, "setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:", v31, v29, v58, v63);

        free(v29);
        goto LABEL_28;
      }
      v45 = *__error();
      SZGetLoggingHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v62 = strerror(v45);
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = __s;
        v74 = 2080;
        v75 = v62;
        _os_log_error_impl(&dword_1D4E55000, v46, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for \"%s\" : %s", location, 0x16u);
      }

      strerror(v45);
      _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 525, (void *)*MEMORY[0x1E0CB2FE0], v45, 0, 0, CFSTR("Failed to issue sandbox extension for \"%s\" : %s"), v47, (uint64_t)__s);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setError:", v48);

    }
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v4);
LABEL_23:
  SZGetLoggingHandle();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = *(void **)(a1 + 32);
    v51 = objc_msgSend(v50, "lastResumptionOffset");
    objc_msgSend(*(id *)(a1 + 32), "error");
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v50;
    v74 = 2048;
    v75 = (char *)v51;
    v76 = 2112;
    v77 = v52;
    _os_log_impl(&dword_1D4E55000, v49, OS_LOG_TYPE_DEFAULT, "%@: calling prepare completion block with offset %llu, error %@", location, 0x20u);

  }
  v53 = *(_QWORD *)(a1 + 40);
  v54 = objc_msgSend(*(id *)(a1 + 32), "lastResumptionOffset");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v53 + 16))(v53, v54, v55);

  objc_msgSend(*(id *)(a1 + 32), "error");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");
  v20 = v4;
LABEL_28:

}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SZGetLoggingHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl(&dword_1D4E55000, v2, OS_LOG_TYPE_ERROR, "Connection interrupted to streaming unzip service.", (uint8_t *)&v5, 2u);
  }

  _CreateError((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 490, (void *)*MEMORY[0x1E0CB28A8], 4097, 0, 0, CFSTR("Connection interrupted to streaming unzip service."), v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setError:", v4);

  objc_msgSend(WeakRetained, "_invalidateObject");
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_87(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Connection invalidated to streaming unzip service.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4099, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setError:", v5);

  objc_msgSend(WeakRetained, "_invalidateObject");
}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_99(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SZGetLoggingHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_ERROR, "%@: prepare returning error %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setLastResumptionOffset:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");

}

void __76__SZExtractor__prepareForRemoteExtractionSynchronously_withCompletionBlock___block_invoke_2_103(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setLastResumptionOffset:", a3);
  SZGetLoggingHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_DEFAULT, "%@: calling prepare completion block with offset %llu, error %@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");

}

void __58__SZExtractor__synchronouslyPrepareForExtractionAtOffset___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    SZGetLoggingHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_ERROR, "%@: prepare for extraction failed: %@", (uint8_t *)&v8, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    **(_QWORD **)(a1 + 48) = a2;
  }

}

void __31__SZExtractor_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    SZGetLoggingHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_ERROR, "%@: Suspending stream prior to encoding failed with error: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)servicePIDWithError:(id *)a3
{
  SZExtractor *v4;
  SZExtractor *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD v14[6];
  id obj;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  v4 = [SZExtractor alloc];
  v5 = -[SZExtractor initWithOptions:](v4, "initWithOptions:", MEMORY[0x1E0C9AA70]);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__SZExtractor_Testing__servicePIDWithError___block_invoke;
  v16[3] = &unk_1E98B0FF0;
  v16[4] = &v21;
  v7 = (void *)MEMORY[0x1D826AE38](v16);
  v8 = (id *)(v22 + 5);
  obj = (id)v22[5];
  -[SZExtractor _serviceConnectionWithError:](v5, "_serviceConnectionWithError:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);
  if (!v9)
  {
    v11 = 0;
    if (!a3)
      goto LABEL_9;
    goto LABEL_7;
  }
  objc_msgSend(v9, "resume");
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __44__SZExtractor_Testing__servicePIDWithError___block_invoke_2;
    v14[3] = &unk_1E98B1018;
    v14[4] = &v21;
    v14[5] = &v17;
    objc_msgSend(v10, "getPidForTestingWithReply:", v14);
  }
  if (a3)
  {
LABEL_7:
    if (*((_DWORD *)v18 + 6) == -1)
      *a3 = objc_retainAutorelease((id)v22[5]);
  }
LABEL_9:
  objc_msgSend(v9, "invalidate");
  v12 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __44__SZExtractor_Testing__servicePIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SZGetLoggingHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_error_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_ERROR, "remoteObjectProxy returning error %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __44__SZExtractor_Testing__servicePIDWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (a2 < 0)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

@end
