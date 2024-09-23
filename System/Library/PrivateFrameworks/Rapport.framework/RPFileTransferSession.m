@implementation RPFileTransferSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPFileTransferSession)init
{
  RPFileTransferSession *v2;
  RPFileTransferSession *v3;
  RPFileTransferResumeState *resumeState;
  RPFileTransferSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPFileTransferSession;
  v2 = -[RPFileTransferSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_debugNotifyToken = -1;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPFileTransferSession;
    v3->_resumable = 0;
    resumeState = v3->_resumeState;
    v3->_resumeState = 0;

    v3->_resumeStateFlushInterval = 1.0;
    v3->_flags = 0;
    v3->_maxSmallFileTasks = 3;
    -[RPFileTransferSession setProgressHandlerTimeInterval:](v3, "setProgressHandlerTimeInterval:", 0.0);
    v5 = v3;
  }

  return v3;
}

- (RPFileTransferSession)initWithCoder:(id)a3
{
  id v4;
  RPFileTransferSession *v5;
  RPFileTransferSession *v6;
  RPFileTransferResumeState *resumeState;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  RPFileTransferSession *v16;
  objc_super v18;
  uint64_t v19;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RPFileTransferSession;
  v5 = -[RPFileTransferSession init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPFileTransferSession;
    v6->_resumable = 0;
    resumeState = v6->_resumeState;
    v6->_resumeState = 0;

    v6->_resumeStateFlushInterval = 1.0;
    v19 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_flags = v19;
    v8 = v4;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("lFlBufB")))
      v6->_largeFileBufferBytes = objc_msgSend(v8, "decodeInt64ForKey:", CFSTR("lFlBufB"));

    v9 = v8;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("lFlMxTs")))
      v6->_maxLargeFileTasks = objc_msgSend(v9, "decodeInt64ForKey:", CFSTR("lFlMxTs"));

    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = v12;
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("sFlMxTs")))
      v6->_maxSmallFileTasks = objc_msgSend(v13, "decodeInt64ForKey:", CFSTR("sFlMxTs"));

    v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t flags;
  unint64_t largeFileBufferBytes;
  unint64_t maxLargeFileTasks;
  NSData *peerPublicKey;
  NSData *selfPublicKey;
  NSData *selfSecretKey;
  unint64_t maxSmallFileTasks;
  NSString *serviceType;
  NSString *targetID;
  id v14;

  v4 = a3;
  flags = self->_flags;
  v14 = v4;
  if ((_DWORD)flags)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", flags, CFSTR("flags"));
    v4 = v14;
  }
  largeFileBufferBytes = self->_largeFileBufferBytes;
  if (largeFileBufferBytes)
  {
    objc_msgSend(v14, "encodeInt64:forKey:", largeFileBufferBytes, CFSTR("lFlBufB"));
    v4 = v14;
  }
  maxLargeFileTasks = self->_maxLargeFileTasks;
  if (maxLargeFileTasks)
  {
    objc_msgSend(v14, "encodeInt64:forKey:", maxLargeFileTasks, CFSTR("lFlMxTs"));
    v4 = v14;
  }
  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    objc_msgSend(v14, "encodeObject:forKey:", peerPublicKey, CFSTR("peerPK"));
    v4 = v14;
  }
  selfPublicKey = self->_selfPublicKey;
  if (selfPublicKey)
  {
    objc_msgSend(v14, "encodeObject:forKey:", selfPublicKey, CFSTR("selfPK"));
    v4 = v14;
  }
  selfSecretKey = self->_selfSecretKey;
  if (selfSecretKey)
  {
    objc_msgSend(v14, "encodeObject:forKey:", selfSecretKey, CFSTR("selfSK"));
    v4 = v14;
  }
  maxSmallFileTasks = self->_maxSmallFileTasks;
  if (maxSmallFileTasks)
  {
    objc_msgSend(v14, "encodeInt64:forKey:", maxSmallFileTasks, CFSTR("sFlMxTs"));
    v4 = v14;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v14, "encodeObject:forKey:", serviceType, CFSTR("srvTy"));
    v4 = v14;
  }
  targetID = self->_targetID;
  if (targetID)
  {
    objc_msgSend(v14, "encodeObject:forKey:", targetID, CFSTR("targetID"));
    v4 = v14;
  }

}

- (void)dealloc
{
  LogCategory *ucat;
  NSObject *progressTimer;
  OS_dispatch_source *v5;
  RPFileTransferResumeState *resumeState;
  objc_super v7;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v5 = self->_progressTimer;
    self->_progressTimer = 0;

  }
  resumeState = self->_resumeState;
  self->_resumeState = 0;

  v7.receiver = self;
  v7.super_class = (Class)RPFileTransferSession;
  -[RPFileTransferSession dealloc](&v7, sel_dealloc);
}

- (id)description
{
  return -[RPFileTransferSession descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  NSString *targetID;
  id v7;
  id v8;
  NSString *label;
  id v10;
  id v11;
  id v12;
  id v13;
  NSString *serviceType;
  id v15;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  void *v20;

  NSAppendPrintF();
  v4 = 0;
  v5 = v4;
  targetID = self->_targetID;
  if (targetID)
  {
    v20 = v4;
    v17 = targetID;
    NSAppendPrintF();
    v7 = v20;

    v5 = v7;
  }
  if (self->_flags)
  {
    NSAppendPrintF();
    v8 = v5;

    v5 = v8;
  }
  label = self->_label;
  if (label)
  {
    v18 = label;
    NSAppendPrintF();
    v10 = v5;

    v5 = v10;
  }
  if (self->_largeFileBufferBytes)
  {
    NSAppendPrintF();
    v11 = v5;

    v5 = v11;
  }
  if (self->_maxLargeFileTasks)
  {
    NSAppendPrintF();
    v12 = v5;

    v5 = v12;
  }
  if (self->_maxSmallFileTasks)
  {
    NSAppendPrintF();
    v13 = v5;

    v5 = v13;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v19 = serviceType;
    NSAppendPrintF();
    v15 = v5;

    v5 = v15;
  }
  return v5;
}

- (void)setDebugFlags:(unint64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__RPFileTransferSession_setDebugFlags___block_invoke;
  v4[3] = &unk_1E5F4F428;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __39__RPFileTransferSession_setDebugFlags___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_debugUpdate");
}

- (void)setFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__RPFileTransferSession_setFlags___block_invoke;
  v3[3] = &unk_1E5F50150;
  v4 = a3;
  v3[4] = self;
  -[RPFileTransferSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __34__RPFileTransferSession_setFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  int v5;
  int v6;
  int v8;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 556);
  if (v1 != v3)
  {
    if (*(_BYTE *)(v2 + 8) && (v5 = **(_DWORD **)(v2 + 152), v5 <= 30))
    {
      if (v5 != -1 || (v8 = _LogCategory_Initialize(), v6 = *(_DWORD *)(a1 + 40), v2 = *(_QWORD *)(a1 + 32), v8))
      {
        LogPrintF();
        v6 = *(_DWORD *)(a1 + 40);
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 40);
    }
    *(_DWORD *)(v2 + 556) = v6;
  }
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)setLargeFileBufferBytes:(unint64_t)a3
{
  int var0;

  if (self->_largeFileBufferBytes != a3)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  self->_largeFileBufferBytes = a3;
}

- (void)setMaxLargeFileTasks:(unint64_t)a3
{
  int var0;

  if (self->_maxLargeFileTasks != a3)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  self->_maxLargeFileTasks = a3;
}

- (void)setMaxSmallFileTasks:(unint64_t)a3
{
  int var0;

  if (self->_maxSmallFileTasks != a3)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  self->_maxSmallFileTasks = a3;
}

- (BOOL)isResumable
{
  return (-[RPFileTransferSession flags](self, "flags") >> 9) & 1;
}

- (id)resumeState
{
  return self->_resumeState;
}

- (id)resumeStateDict
{
  void *resumeState;

  resumeState = self->_resumeState;
  if (resumeState)
  {
    objc_msgSend(resumeState, "dictionaryRepresentation");
    resumeState = (void *)objc_claimAutoreleasedReturnValue();
  }
  return resumeState;
}

- (BOOL)prepareTemplateAndReturnError:(id *)a3
{
  NSData *v4;
  NSData *selfPublicKey;
  NSData *v6;
  NSData *selfSecretKey;
  int v8;
  id v9;
  NSString *v10;
  NSString *targetID;
  int var0;
  _BYTE __s[32];
  _BYTE v15[32];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[NSData length](self->_selfPublicKey, "length", a3) || !-[NSData length](self->_selfSecretKey, "length"))
  {
    cced25519_make_key_pair_compat();
    v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v15, 32);
    selfPublicKey = self->_selfPublicKey;
    self->_selfPublicKey = v4;

    v6 = (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", __s, 32);
    selfSecretKey = self->_selfSecretKey;
    self->_selfSecretKey = v6;

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
  }
  if ((self->_flags & 1) != 0)
  {
    if (!self->_targetID)
    {
      NSRandomData();
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "bytes");
      objc_msgSend(v9, "length");
      objc_msgSend(v9, "length");
      NSPrintF();
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      targetID = self->_targetID;
      self->_targetID = v10;

    }
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      goto LABEL_12;
  }
  else
  {
    v8 = self->_ucat->var0;
    if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
LABEL_12:
      LogPrintF();
  }
  return 1;
}

- (void)activate
{
  RPFileTransferSession *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activateCalled)
  {
    v2->_activateCalled = 1;
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__RPFileTransferSession_activate__block_invoke;
    block[3] = &unk_1E5F4EC60;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v2);

}

void __33__RPFileTransferSession_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  id v5;
  _DWORD **v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 152);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      v13 = *(_QWORD *)(v2 + 680);
      v14 = *(_QWORD *)(v2 + 632);
      v12 = *(_QWORD *)(v2 + 688);
      v9 = *(unsigned int *)(v2 + 556);
      v11 = &unk_1AF307718;
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v15 = 0;
  objc_msgSend((id)v2, "_activateAndReturnError:", &v15, v9, v11, v12, v13, v14);
  v5 = v15;
  v6 = *(_DWORD ***)(a1 + 32);
  if (v5)
  {
    v7 = *v6[19];
    if (v7 <= 90 && (v7 != -1 || (v8 = _LogCategory_Initialize(), v6 = *(_DWORD ***)(a1 + 32), v8)))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_reportCompletion:", v5, v5);
    }
    else
    {
      objc_msgSend(v6, "_reportCompletion:", v5, v10);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_startProgressReportTimer");
  }

}

- (BOOL)_activateAndReturnError:(id *)a3
{
  NSString *v5;
  NSData *v6;
  NSData *v7;
  RPIdentity *v8;
  NSData *v9;
  RPIdentity *v10;
  NSString *v11;
  NSURL *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int var0;
  NSMutableArray *v19;
  NSMutableArray *ioQueues;
  NSMutableDictionary *v21;
  NSMutableDictionary *smallFilesReceiveTasks;
  NSMutableSet *v23;
  NSMutableSet *smallFilesSendTasks;
  NSMutableSet *v25;
  NSMutableSet *largeFileSendTasks;
  NSMutableDictionary *v27;
  NSMutableDictionary *largeFileReceiveTasks;
  RPFileTransferProgress *v29;
  RPFileTransferProgress *progressCurrent;
  BOOL v31;
  NSData *v33;
  NSString *v34;
  id v35;

  v5 = self->_targetID;
  if (v5)
  {
    -[RPFileTransferSession _prefsChanged](self, "_prefsChanged");
    -[RPFileTransferSession _debugSetup](self, "_debugSetup");
    v6 = self->_selfPublicKey;
    if (!self->_selfPublicKey)
    {
      if (a3)
      {
        RPErrorF();
        v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      goto LABEL_22;
    }
    v7 = self->_selfSecretKey;
    if (!self->_selfSecretKey)
    {
      if (a3)
      {
        RPErrorF();
        v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      goto LABEL_21;
    }
    v8 = objc_alloc_init(RPIdentity);
    -[RPIdentity setEdPKData:](v8, "setEdPKData:", v6);
    -[RPIdentity setEdSKData:](v8, "setEdSKData:", v7);
    objc_storeStrong((id *)&self->_selfIdentity, v8);
    v9 = self->_peerPublicKey;
    if (!self->_peerPublicKey)
    {
      if (a3)
      {
        RPErrorF();
        v31 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      goto LABEL_20;
    }
    v33 = v6;
    v34 = v5;
    v10 = objc_alloc_init(RPIdentity);
    -[RPIdentity setEdPKData:](v10, "setEdPKData:", v9);
    objc_storeStrong((id *)&self->_peerIdentity, v10);
    v11 = self->_receiveFileParentPath;
    if (!v11)
    {
      v12 = self->_temporaryDirectoryURL;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(v13, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v35;

        if (!v14)
        {
          if (a3)
          {
            RPNestedErrorF();
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }

          v11 = 0;
          goto LABEL_40;
        }
        objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.rapport/FileTransfer"), 1);
        v12 = (NSURL *)objc_claimAutoreleasedReturnValue();

      }
      -[NSString stringByAppendingString:](self->_targetID, "stringByAppendingString:", CFSTR(".rpftd"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:isDirectory:](v12, "URLByAppendingPathComponent:isDirectory:", v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "path");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_receiveFileParentPath, v11);

    }
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    ioQueues = self->_ioQueues;
    self->_ioQueues = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    smallFilesReceiveTasks = self->_smallFilesReceiveTasks;
    self->_smallFilesReceiveTasks = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    smallFilesSendTasks = self->_smallFilesSendTasks;
    self->_smallFilesSendTasks = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    largeFileSendTasks = self->_largeFileSendTasks;
    self->_largeFileSendTasks = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    largeFileReceiveTasks = self->_largeFileReceiveTasks;
    self->_largeFileReceiveTasks = v27;

    if ((self->_flags & 1) != 0)
    {
      if (!-[RPFileTransferSession _activateTargetAndReturnError:](self, "_activateTargetAndReturnError:", a3))
      {
LABEL_40:
        v31 = 0;
        goto LABEL_19;
      }
    }
    else if (!-[RPFileTransferSession _activateSourceAndReturnError:](self, "_activateSourceAndReturnError:", a3))
    {
      goto LABEL_40;
    }
    self->_metricTicksActivate = mach_absolute_time();
    v29 = objc_alloc_init(RPFileTransferProgress);
    progressCurrent = self->_progressCurrent;
    self->_progressCurrent = v29;

    v31 = 1;
    -[RPFileTransferSession _reportProgressType:](self, "_reportProgressType:", 1);
LABEL_19:

    v6 = v33;
    v5 = v34;
LABEL_20:

LABEL_21:
LABEL_22:

    goto LABEL_23;
  }
  if (a3)
  {
    RPErrorF();
    v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
LABEL_23:

  return v31;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RPFileTransferSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPFileTransferSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 89))
  {
    v2 = result;
    *(_BYTE *)(v1 + 89) = 1;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[19];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    return objc_msgSend(v3, "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  NSMutableSet *v3;
  NSMutableSet *addedItems;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CUBonjourAdvertiser *bonjourAdvertiser;
  CUBonjourBrowser *bonjourBrowser;
  CUCoalescer *bonjourCoalescer;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  RPConnection *controlCnx;
  OS_dispatch_source *controlRetryTimer;
  NSObject *v21;
  OS_dispatch_source *v22;
  NSMutableDictionary *registeredEvents;
  NSMutableDictionary *registeredRequests;
  CUTCPServer *tcpServer;
  CUWiFiManager *wifiManager;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[RPFileTransferSession _stopProgressReportTimer](self, "_stopProgressReportTimer");
  v3 = self->_addedItems;
  addedItems = self->_addedItems;
  self->_addedItems = 0;

  if (-[NSMutableSet count](v3, "count"))
  {
    RPErrorF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = v3;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          -[RPFileTransferSession _completeItemDirect:error:](self, "_completeItemDirect:error:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v10++), v5);
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v8);
    }

    -[NSMutableSet removeAllObjects](v6, "removeAllObjects");
  }
  -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = 0;

  -[CUCoalescer invalidate](self->_bonjourCoalescer, "invalidate");
  bonjourCoalescer = self->_bonjourCoalescer;
  self->_bonjourCoalescer = 0;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_connections;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18++), "invalidate", (_QWORD)v27);
      }
      while (v16 != v18);
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
  -[RPConnection invalidate](self->_controlCnx, "invalidate");
  controlCnx = self->_controlCnx;
  self->_controlCnx = 0;

  controlRetryTimer = self->_controlRetryTimer;
  if (controlRetryTimer)
  {
    v21 = controlRetryTimer;
    dispatch_source_cancel(v21);
    v22 = self->_controlRetryTimer;
    self->_controlRetryTimer = 0;

  }
  -[NSMutableDictionary removeAllObjects](self->_registeredEvents, "removeAllObjects", (_QWORD)v27);
  registeredEvents = self->_registeredEvents;
  self->_registeredEvents = 0;

  -[NSMutableDictionary removeAllObjects](self->_registeredRequests, "removeAllObjects");
  registeredRequests = self->_registeredRequests;
  self->_registeredRequests = 0;

  -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
  tcpServer = self->_tcpServer;
  self->_tcpServer = 0;

  -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0;

  -[RPFileTransferSession _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  int debugNotifyToken;
  id completionHandler;
  id flowControlChangedHandler;
  id progressHandler;
  id receivedItemHandler;
  id receivedItemsHandler;
  int var0;

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_smallFilesReceiveTasks, "count")
    && !-[NSMutableSet count](self->_smallFilesSendTasks, "count")
    && !-[NSMutableDictionary count](self->_largeFileReceiveTasks, "count")
    && !-[NSMutableSet count](self->_largeFileSendTasks, "count"))
  {
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_completionHandler);
    if (v3)
    {
      RPErrorF();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v3)[2](v3, v4);

    }
    debugNotifyToken = self->_debugNotifyToken;
    if (debugNotifyToken != -1)
    {
      notify_cancel(debugNotifyToken);
      self->_debugNotifyToken = -1;
    }
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    flowControlChangedHandler = self->_flowControlChangedHandler;
    self->_flowControlChangedHandler = 0;

    progressHandler = self->_progressHandler;
    self->_progressHandler = 0;

    receivedItemHandler = self->_receivedItemHandler;
    self->_receivedItemHandler = 0;

    receivedItemsHandler = self->_receivedItemsHandler;
    self->_receivedItemsHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_prefsChanged
{
  _BOOL4 v3;
  int var0;
  const char *v5;
  const char *v6;
  unint64_t Int64;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  uint64_t v15;
  int64_t v18;
  uint64_t prefLargeFileMaxOutstanding;
  int v20;
  unint64_t v21;
  uint64_t v24;
  uint64_t prefSmallFilesMaxBytes;
  int v26;
  unint64_t v27;
  uint64_t v30;
  _BOOL4 v31;
  int v32;
  int v33;
  double v34;
  double v37;
  int v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  int64_t v42;

  v3 = 0;
  if ((self->_flags & 0x100) != 0)
    v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefCompress != v3)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v5 = "yes";
      if (v3)
        v6 = "no";
      else
        v6 = "yes";
      if (!v3)
        v5 = "no";
      v39 = v6;
      v41 = v5;
      LogPrintF();
    }
    self->_prefCompress = v3;
  }
  Int64 = CFPrefs_GetInt64();
  if (!-[RPFileTransferSession largeFileBufferBytes](self, "largeFileBufferBytes"))
  {
    if (Int64 <= 0x989680 && Int64 != 0)
      v10 = Int64;
    else
      v10 = 0x100000;
    -[RPFileTransferSession setLargeFileBufferBytes:](self, "setLargeFileBufferBytes:", v10, v39, v41);
  }
  v11 = CFPrefs_GetInt64();
  if (!-[RPFileTransferSession maxLargeFileTasks](self, "maxLargeFileTasks"))
  {
    if (v11 <= 0x3E8 && v11 != 0)
      v14 = v11;
    else
      v14 = 3;
    -[RPFileTransferSession setMaxLargeFileTasks:](self, "setMaxLargeFileTasks:", v14, v39, v41);
  }
  v15 = CFPrefs_GetInt64();
  if (v15 <= 1000 && v15 >= 1)
    v18 = v15;
  else
    v18 = 3;
  if ((int64_t)-[RPFileTransferSession maxLargeFileTasks](self, "maxLargeFileTasks", v39, v41) > v18)
    v18 = -[RPFileTransferSession maxLargeFileTasks](self, "maxLargeFileTasks");
  prefLargeFileMaxOutstanding = self->_prefLargeFileMaxOutstanding;
  if (v18 != prefLargeFileMaxOutstanding)
  {
    v20 = self->_ucat->var0;
    if (v20 <= 30)
    {
      if (v20 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_52;
        prefLargeFileMaxOutstanding = self->_prefLargeFileMaxOutstanding;
      }
      v40 = prefLargeFileMaxOutstanding;
      v42 = v18;
      LogPrintF();
    }
LABEL_52:
    self->_prefLargeFileMaxOutstanding = v18;
  }
  v21 = CFPrefs_GetInt64();
  if (v21 <= 0x989680 && v21 != 0)
    v24 = v21;
  else
    v24 = 0x100000;
  prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
  if (v24 != prefSmallFilesMaxBytes)
  {
    v26 = self->_ucat->var0;
    if (v26 <= 30)
    {
      if (v26 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_67;
        prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
      }
      v40 = prefSmallFilesMaxBytes;
      v42 = v24;
      LogPrintF();
    }
LABEL_67:
    self->_prefSmallFilesMaxBytes = v24;
  }
  v27 = CFPrefs_GetInt64();
  if (!-[RPFileTransferSession maxSmallFileTasks](self, "maxSmallFileTasks"))
  {
    if (v27 <= 0x3E8 && v27 != 0)
      v30 = v27;
    else
      v30 = 3;
    -[RPFileTransferSession setMaxSmallFileTasks:](self, "setMaxSmallFileTasks:", v30, v40, v42);
  }
  v31 = CFPrefs_GetInt64() != 0;
  if (self->_resumable != v31)
  {
    v32 = self->_ucat->var0;
    if (v32 <= 30 && (v32 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_resumable = v31;
    if (v31)
      v33 = 512;
    else
      v33 = 0;
    self->_flags = self->_flags & 0xFFFFFDFF | v33;
  }
  CFPrefs_GetDouble();
  if (v34 <= 60.0 && v34 > 0.001)
    v37 = v34;
  else
    v37 = 1.0;
  if (v37 != self->_resumeStateFlushInterval)
  {
    v38 = self->_ucat->var0;
    if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_resumeStateFlushInterval = v37;
  }
}

- (void)_reportCompletion:(id)a3
{
  id v4;
  unint64_t metricLastFileCompletionTicks;
  unint64_t metricTicksConnectStart;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t metricUncompressedBytes;
  double v13;
  uint64_t v14;
  int var0;
  void (**v16)(_QWORD, _QWORD);
  id completionHandler;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t metricTotalFiles;
  double v32;
  double v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v54[26];
  _QWORD v55[28];

  v55[26] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  metricLastFileCompletionTicks = self->_metricLastFileCompletionTicks;
  if (!metricLastFileCompletionTicks)
    metricLastFileCompletionTicks = mach_absolute_time();
  metricTicksConnectStart = self->_metricTicksConnectStart;
  if (metricTicksConnectStart)
    v7 = metricLastFileCompletionTicks > metricTicksConnectStart;
  else
    v7 = 0;
  if (v7)
    self->_metricTicksConnected += metricLastFileCompletionTicks - metricTicksConnectStart;
  UpTicksToSecondsF();
  v9 = v8;
  if (v8 == 0.0)
    v10 = 0.0;
  else
    v10 = (double)self->_metricTotalBytes / v8;
  v11 = UpTicksToSeconds();
  metricUncompressedBytes = self->_metricUncompressedBytes;
  if (metricUncompressedBytes)
  {
    -[RPFileTransferProgress setCompressionRate:](self->_progressCurrent, "setCompressionRate:", (double)self->_metricCompressedBytes / (double)metricUncompressedBytes);
    -[RPFileTransferProgress compressionRate](self->_progressCurrent, "compressionRate");
    v14 = (int)(v13 * 100.0);
  }
  else
  {
    v14 = 0xFFFFFFFFLL;
  }
  -[RPFileTransferProgress setBytesPerSecond:](self->_progressCurrent, "setBytesPerSecond:", v10);
  -[RPFileTransferProgress setRemainingSeconds:](self->_progressCurrent, "setRemainingSeconds:", 0.0);
  -[RPFileTransferProgress setCurrentFilename:](self->_progressCurrent, "setCurrentFilename:", 0);
  -[RPFileTransferProgress setError:](self->_progressCurrent, "setError:", v4);
  -[RPFileTransferProgress setTransferredByteCount:](self->_progressCurrent, "setTransferredByteCount:", self->_metricTotalBytes);
  -[RPFileTransferProgress setTotalByteCount:](self->_progressCurrent, "setTotalByteCount:", self->_metricTotalBytes);
  -[RPFileTransferProgress setTransferredFileCount:](self->_progressCurrent, "setTransferredFileCount:", self->_metricTotalFiles);
  -[RPFileTransferProgress setTotalFileCount:](self->_progressCurrent, "setTotalFileCount:", self->_metricTotalFiles);
  -[RPFileTransferSession _reportProgressType:](self, "_reportProgressType:", 20);
  var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v34 = v14;
      v35 = v4;
      v32 = (double)self->_metricTotalBytes / 1000000.0;
      v33 = v10 / 1000000.0;
      metricTotalFiles = self->_metricTotalFiles;
LABEL_22:
      LogPrintF();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v34 = v14;
    v32 = (double)self->_metricTotalBytes / 1000000.0;
    v33 = v10 / 1000000.0;
    metricTotalFiles = self->_metricTotalFiles;
    goto LABEL_22;
  }
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_completionHandler);
  if (v16)
  {
    v53 = v16;
    ((void (**)(_QWORD, id))v16)[2](v16, v4);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    if ((self->_flags & 2) != 0)
      v18 = CFSTR("d2d");
    else
      v18 = CFSTR("?");
    v55[0] = v18;
    v54[0] = CFSTR("type");
    v54[1] = CFSTR("errD");
    objc_msgSend(v4, "domain", metricTotalFiles, *(_QWORD *)&v32, *(_QWORD *)&v33, v34, v35);
    v19 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v19;
    v20 = &stru_1E5F528E0;
    if (v19)
      v20 = (const __CFString *)v19;
    v55[1] = v20;
    v54[2] = CFSTR("errC");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v50;
    v54[3] = CFSTR("totB");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 10000000 * (self->_metricTotalBytes / 0x989680));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v49;
    v54[4] = CFSTR("totF");
    v52 = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricTotalFiles / 0x64));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v48;
    v54[5] = CFSTR("totS");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 60 * (v11 / 0x3C));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v55[5] = v47;
    v54[6] = CFSTR("Bps");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 / 1000.0 * 1000.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55[6] = v46;
    v54[7] = CFSTR("cnxS");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 / 60.0 * 60.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v55[7] = v45;
    v54[8] = CFSTR("dCnx");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_metricDisconnects);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55[8] = v44;
    v54[9] = CFSTR("ltAWDL");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_metricLinkTypeCountAWDL);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55[9] = v43;
    v54[10] = CFSTR("ltUSB");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_metricLinkTypeCountUSB);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55[10] = v42;
    v54[11] = CFSTR("ltOther");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_metricLinkTypeCountOther);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v55[11] = v41;
    v54[12] = CFSTR("tcpD");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_metricTCPRanDryCount);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v55[12] = v40;
    v54[13] = CFSTR("fRtr");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_metricRetries);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v55[13] = v39;
    v54[14] = CFSTR("fs10K");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[0] / 0x64));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v55[14] = v38;
    v54[15] = CFSTR("fs100K");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[1] / 0x64));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v55[15] = v37;
    v54[16] = CFSTR("fs1M");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[2] / 0x64));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v55[16] = v36;
    v54[17] = CFSTR("fs10M");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[3] / 0x64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[17] = v21;
    v54[18] = CFSTR("fs100M");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[4] / 0x64));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v55[18] = v22;
    v54[19] = CFSTR("fs1G");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[5] / 0x64));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55[19] = v23;
    v54[20] = CFSTR("fs10G");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[6] / 0x64));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55[20] = v24;
    v54[21] = CFSTR("fs10GUp");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 100 * (self->_metricFileSizeBuckets[7] / 0x64));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55[21] = v25;
    v54[22] = CFSTR("ssPr");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_metricPrematureSmallSets);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55[22] = v26;
    v54[23] = CFSTR("CmpP");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v55[23] = v27;
    v54[24] = CFSTR("CmpE");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_metricCompressionErrors);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55[24] = v28;
    v54[25] = CFSTR("CmpU");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_metricUncompressibleChunks);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55[25] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CUMetricsLogEx();

    v4 = v52;
    v16 = (void (**)(_QWORD, _QWORD))v53;
  }

}

- (void)_reportProgressControlState
{
  int controlState;
  int v4;
  int v5;
  int var0;
  const char *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  unint64_t metricTicksConnectStart;
  uint64_t v12;
  void *v13;
  unint64_t Int64;
  _BOOL8 v15;
  uint64_t v16;
  int v17;
  const char *v18;
  const char *v19;
  int v20;
  int v21;
  CUBonjourBrowser *v22;
  unint64_t v23;
  CUBonjourBrowser *bonjourBrowser;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;

  controlState = self->_controlState;
  v4 = -[RPConnection state](self->_controlCnx, "state");
  if (v4 != controlState)
  {
    v5 = v4;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v7 = "?";
      if (controlState == 1)
        v8 = "Ready";
      else
        v8 = "?";
      if (!controlState)
        v8 = "Unknown";
      if (v5 == 1)
        v7 = "Ready";
      if (!v5)
        v7 = "Unknown";
      v25 = v8;
      v27 = v7;
      LogPrintF();
    }
    self->_controlState = v5;
    v9 = -[RPConnection linkType](self->_controlCnx, "linkType", v25, v27);
    v10 = mach_absolute_time();
    metricTicksConnectStart = self->_metricTicksConnectStart;
    if (metricTicksConnectStart)
      self->_metricTicksConnected += v10 - metricTicksConnectStart;
    if (v5 == 1)
    {
      self->_metricTicksConnectStart = v10;
      v12 = 476;
      if (v9 == 8)
        v12 = 480;
      if (v9 == 4)
        v12 = 472;
      ++*(_DWORD *)((char *)&self->super.isa + v12);
      if (self->_prefCompress)
      {
        -[RPConnection appInfoPeer](self->_controlCnx, "appInfoPeer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        Int64 = CFDictionaryGetInt64();

        v15 = (Int64 >> 8) & 1;
      }
      else
      {
        LODWORD(v15) = 0;
      }
      if (self->_compressionEnabled != v15)
      {
        v17 = self->_ucat->var0;
        if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
        {
          v18 = "yes";
          if (v15)
            v19 = "no";
          else
            v19 = "yes";
          if (!v15)
            v18 = "no";
          v26 = v19;
          v28 = v18;
          LogPrintF();
        }
        self->_compressionEnabled = v15;
      }
      v16 = 10;
    }
    else
    {
      ++self->_metricDisconnects;
      self->_metricTicksConnectStart = 0;
      v16 = 11;
    }
    -[RPFileTransferSession _reportProgressType:](self, "_reportProgressType:", v16, v26, v28);
    -[RPFileTransferSession _updateWiFi](self, "_updateWiFi");
    if ((self->_flags & 0x80) != 0 && !self->_lockedInterface)
    {
      if (v9 == 8)
      {
        v21 = self->_ucat->var0;
        if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        self->_flags |= 0x30u;
        -[CUBonjourAdvertiser setAdvertiseFlags:](self->_bonjourAdvertiser, "setAdvertiseFlags:", -[CUBonjourAdvertiser advertiseFlags](self->_bonjourAdvertiser, "advertiseFlags") & 0xFBFFFFFFFFFFFFFFLL);
        v23 = -[CUBonjourBrowser browseFlags](self->_bonjourBrowser, "browseFlags") & 0xFBCFFFFFFFFFFFFFLL | 0x30000000000000;
        bonjourBrowser = self->_bonjourBrowser;
      }
      else
      {
        if (v9 != 4)
        {
LABEL_53:
          self->_lockedInterface = 1;
          return;
        }
        v20 = self->_ucat->var0;
        if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        self->_flags |= 0x60u;
        v22 = self->_bonjourBrowser;
        v23 = -[CUBonjourBrowser browseFlags](v22, "browseFlags") | 0x60000000000000;
        bonjourBrowser = v22;
      }
      -[CUBonjourBrowser setBrowseFlags:](bonjourBrowser, "setBrowseFlags:", v23);
      goto LABEL_53;
    }
  }
}

- (void)_reportProgressType:(int)a3
{
  uint64_t v3;
  RPFileTransferProgress *v5;
  uint64_t v6;
  int var0;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  RPFileTransferProgress *v12;
  RPFileTransferProgress *v13;

  v3 = *(_QWORD *)&a3;
  v5 = self->_progressCurrent;
  if (v5)
  {
    v13 = v5;
    v6 = -[RPConnection linkType](self->_controlCnx, "linkType");
    if ((_DWORD)v6)
      -[RPFileTransferProgress setLinkType:](v13, "setLinkType:", v6);
    -[RPFileTransferProgress setType:](v13, "setType:", v3);
    var0 = self->_ucat->var0;
    if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v12 = v13;
      LogPrintF();
    }
    if ((_DWORD)v3 == 20 || (_DWORD)v3 == 11)
      -[RPFileTransferSession _stopProgressReportTimer](self, "_stopProgressReportTimer", v12);
    v9 = MEMORY[0x1AF45BE48](self->_progressHandler);
    v10 = (void *)v9;
    if (v9)
      (*(void (**)(uint64_t, RPFileTransferProgress *))(v9 + 16))(v9, v13);

    goto LABEL_17;
  }
  v8 = self->_ucat->var0;
  if (v8 <= 90)
  {
    v13 = 0;
    if (v8 != -1 || (v11 = _LogCategory_Initialize(), v5 = 0, v11))
    {
      LogPrintF();
LABEL_17:
      v5 = v13;
    }
  }

}

- (void)_reportDataTransferred
{
  RPFileTransferProgress *v3;
  RPFileTransferProgress *v4;
  int var0;
  int v6;
  double v7;
  double v8;
  RPFileTransferProgress *v9;
  unint64_t metricUncompressedBytes;
  uint64_t v11;
  void *v12;
  int v13;
  RPFileTransferProgress *v14;
  RPFileTransferProgress *v15;

  v3 = self->_progressCurrent;
  v4 = v3;
  if (v3)
  {
    v15 = v3;
    -[RPFileTransferProgress setType:](v3, "setType:", 30);
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v14 = v15;
      LogPrintF();
    }
    if (!self->_metricLastFileCompletionTicks)
      mach_absolute_time();
    UpTicksToSecondsF();
    if (v7 == 0.0)
      v8 = 0.0;
    else
      v8 = (double)self->_progressCurrentBytes / v7;
    v9 = v15;
    metricUncompressedBytes = self->_metricUncompressedBytes;
    if (metricUncompressedBytes)
    {
      -[RPFileTransferProgress setCompressionRate:](v15, "setCompressionRate:", (double)self->_metricCompressedBytes / (double)metricUncompressedBytes);
      v9 = v15;
    }
    -[RPFileTransferProgress setBytesPerSecond:](v9, "setBytesPerSecond:", v8, v14);
    -[RPFileTransferProgress setRemainingSeconds:](v15, "setRemainingSeconds:", 0.0);
    -[RPFileTransferProgress setCurrentFilename:](v15, "setCurrentFilename:", 0);
    -[RPFileTransferProgress setError:](v15, "setError:", 0);
    -[RPFileTransferProgress setTransferredByteCount:](v15, "setTransferredByteCount:", self->_progressCurrentBytes);
    -[RPFileTransferProgress setTotalByteCount:](v15, "setTotalByteCount:", self->_progressTotalBytes);
    -[RPFileTransferProgress setTransferredFileCount:](v15, "setTransferredFileCount:", self->_progressCurrentFiles);
    -[RPFileTransferProgress setTotalFileCount:](v15, "setTotalFileCount:", self->_progressTotalFiles);
    v11 = MEMORY[0x1AF45BE48](self->_progressHandler);
    v12 = (void *)v11;
    if (v11)
      (*(void (**)(uint64_t, RPFileTransferProgress *))(v11 + 16))(v11, v15);

    goto LABEL_19;
  }
  v6 = self->_ucat->var0;
  if (v6 <= 90)
  {
    v15 = 0;
    if (v6 != -1 || (v13 = _LogCategory_Initialize(), v4 = 0, v13))
    {
      LogPrintF();
LABEL_19:
      v4 = v15;
    }
  }

}

- (void)_startProgressReportTimer
{
  double v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *progressTimer;
  NSObject *v6;
  _QWORD handler[5];

  -[RPFileTransferSession progressHandlerTimeInterval](self, "progressHandlerTimeInterval");
  if (v3 > 0.0 && !self->_progressTimer)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v4;

    v6 = self->_progressTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __50__RPFileTransferSession__startProgressReportTimer__block_invoke;
    handler[3] = &unk_1E5F4EC60;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_progressTimer);
  }
}

_BYTE *__50__RPFileTransferSession__startProgressReportTimer__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[336])
  {
    result = (_BYTE *)objc_msgSend(result, "_reportDataTransferred");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 336) = 0;
  }
  return result;
}

- (void)_stopProgressReportTimer
{
  NSObject *progressTimer;
  OS_dispatch_source *v4;

  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v4 = self->_progressTimer;
    self->_progressTimer = 0;

  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  RPFileTransferSession *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__RPFileTransferSession__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E5F4EC60;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __50__RPFileTransferSession__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWiFi");
}

- (void)_updateWiFi
{
  RPFileTransferSession *v2;
  unsigned int flags;
  int v4;
  int v5;
  int var0;
  CUWiFiManager *wifiManager;
  int v8;
  CUWiFiManager *v9;
  CUWiFiManager *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  id *p_controlCnx;
  int v17;
  uint64_t v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  flags = v2->_flags;
  if ((flags & 8) != 0)
  {
    objc_sync_exit(v2);

  }
  else
  {
    if ((flags & 4) == 0)
    {
      objc_sync_exit(v2);

LABEL_10:
      if (!-[CUWiFiManager infraDisabled](v2->_wifiManager, "infraDisabled"))
        goto LABEL_35;
      var0 = v2->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[CUWiFiManager setInfraDisabled:](v2->_wifiManager, "setInfraDisabled:", 0);
      v8 = 0;
      goto LABEL_22;
    }
    v5 = -[RPConnection linkType](v2->_controlCnx, "linkType");
    objc_sync_exit(v2);

    if (v5 != 4)
      goto LABEL_10;
  }
  if ((-[CUWiFiManager infraDisabled](v2->_wifiManager, "infraDisabled") & 1) == 0)
  {
    v4 = v2->_ucat->var0;
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  wifiManager = v2->_wifiManager;
  if (wifiManager)
  {
    if ((-[CUWiFiManager infraDisabled](wifiManager, "infraDisabled") & 1) != 0)
    {
      v8 = 1;
      goto LABEL_28;
    }
    v8 = 1;
    -[CUWiFiManager setInfraDisabled:](v2->_wifiManager, "setInfraDisabled:", 1);
  }
  else
  {
    v9 = (CUWiFiManager *)objc_alloc_init(MEMORY[0x1E0D1B478]);
    v10 = v2->_wifiManager;
    v2->_wifiManager = v9;

    -[CUWiFiManager setDispatchQueue:](v2->_wifiManager, "setDispatchQueue:", v2->_dispatchQueue);
    -[CUWiFiManager setLabel:](v2->_wifiManager, "setLabel:", CFSTR("RPFile"));
    v8 = 1;
    -[CUWiFiManager setInfraDisabled:](v2->_wifiManager, "setInfraDisabled:", 1);
    -[CUWiFiManager activateWithCompletion:](v2->_wifiManager, "activateWithCompletion:", 0);
  }
LABEL_22:
  if (v2->_controlCnx && (v2->_flags & 1) != 0)
  {
    if (v8)
      v11 = 4;
    else
      v11 = 0;
    v19 = CFSTR("_ftFl");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPConnection sendEncryptedEventID:event:options:completion:](v2->_controlCnx, "sendEncryptedEventID:event:options:completion:", CFSTR("_ftPU"), v13, 0, 0);
  }
LABEL_28:
  if (v8)
  {
    v14 = v2->_flags;
    if ((v14 & 1) == 0 && v2->_peerInfraWiFiDisabled)
    {
      if ((v14 & 2) == 0)
        return;
      v15 = v2->_ucat->var0;
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      p_controlCnx = (id *)&v2->_controlCnx;
      v18 = 1024;
      goto LABEL_43;
    }
  }
LABEL_35:
  p_controlCnx = (id *)&v2->_controlCnx;
  if (!-[RPConnection trafficFlags](v2->_controlCnx, "trafficFlags"))
    return;
  v17 = v2->_ucat->var0;
  if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v18 = 0;
LABEL_43:
  objc_msgSend(*p_controlCnx, "setTrafficFlags:", v18);
}

- (void)_debugSetup
{
  NSObject *dispatchQueue;
  int debugNotifyToken;
  uint64_t debugFlags;
  int var0;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD handler[5];
  uint64_t state64;

  if (IsAppleInternalBuild())
  {
    if (self->_debugNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __36__RPFileTransferSession__debugSetup__block_invoke;
      handler[3] = &unk_1E5F50178;
      handler[4] = self;
      notify_register_dispatch("com.apple.rapport.ftdebug", &self->_debugNotifyToken, dispatchQueue, handler);
      debugNotifyToken = self->_debugNotifyToken;
      state64 = 0;
      notify_get_state(debugNotifyToken, &state64);
      debugFlags = state64;
      self->_debugFlags = state64;
      if (debugFlags)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 30)
        {
          if (var0 != -1)
          {
LABEL_6:
            v8 = debugFlags;
            LogPrintF();
            -[RPFileTransferSession _debugUpdate](self, "_debugUpdate", v8, &unk_1AF30778C);
            return;
          }
          if (_LogCategory_Initialize())
          {
            debugFlags = self->_debugFlags;
            goto LABEL_6;
          }
        }
        -[RPFileTransferSession _debugUpdate](self, "_debugUpdate", v7, v9);
      }
    }
  }
}

uint64_t __36__RPFileTransferSession__debugSetup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t state64;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(unsigned int *)(v2 + 84);
  if ((_DWORD)result != -1)
  {
    v4 = *(_QWORD *)(v2 + 576);
    state64 = 0;
    notify_get_state(result, &state64);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576) = state64;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = **(_DWORD **)(v5 + 152);
    if (v6 <= 30 && (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v7)))
    {
      v11 = *(_QWORD *)(v5 + 576);
      LogPrintF();
      return objc_msgSend(*(id *)(a1 + 32), "_debugUpdate", v4, &unk_1AF30778C, v11, &unk_1AF30778C);
    }
    else
    {
      return objc_msgSend((id)v5, "_debugUpdate", v8, v9, v10, v12);
    }
  }
  return result;
}

- (void)_debugUpdate
{
  int var0;
  RPConnection *controlCnx;
  void *v5;
  RPConnection *v6;

  if ((self->_debugFlags & 1) != 0 && self->_controlCnx)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    controlCnx = self->_controlCnx;
    RPErrorF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection invalidateWithError:](controlCnx, "invalidateWithError:", v5);

    v6 = self->_controlCnx;
    self->_controlCnx = 0;

    self->_debugFlags &= ~1uLL;
  }
}

- (void)_metricAddFileSize:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 >= 10000)
  {
    v3 = 1;
    v4 = 2;
    v5 = 3;
    v6 = 4;
    v7 = 5;
    v8 = 6;
    if ((unint64_t)a3 >= 0x2540BE400)
      v8 = 7;
    if ((unint64_t)a3 >= 0x3B9ACA00)
      v7 = v8;
    if ((unint64_t)a3 >= 0x5F5E100)
      v6 = v7;
    if ((unint64_t)a3 >= 0x989680)
      v5 = v6;
    if ((unint64_t)a3 >= 0xF4240)
      v4 = v5;
    if ((unint64_t)a3 >> 5 >= 0xC35)
      v3 = v4;
  }
  else
  {
    v3 = 0;
  }
  ++self->_metricFileSizeBuckets[v3];
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int var0;
  RPEventRegistration *v12;
  NSMutableDictionary *registeredEvents;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  var0 = self->_ucat->var0;
  if (v10)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v16 = v17;
      LogPrintF();
    }
    v12 = objc_alloc_init(RPEventRegistration);
    -[RPEventRegistration setEventID:](v12, "setEventID:", v17);
    -[RPEventRegistration setOptions:](v12, "setOptions:", v8);
    -[RPEventRegistration setHandler:](v12, "setHandler:", v9);
    registeredEvents = self->_registeredEvents;
    if (!registeredEvents)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = self->_registeredEvents;
      self->_registeredEvents = v14;

      registeredEvents = self->_registeredEvents;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v12, v17, v16);

  }
}

- (void)deregisterEventID:(id)a3
{
  id v4;
  int var0;
  int v6;
  id v7;
  id v8;

  v4 = a3;
  var0 = self->_ucat->var0;
  v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      v7 = v4;
      LogPrintF();
      v4 = v8;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredEvents, "setObject:forKeyedSubscript:", 0, v4, v7);

}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  -[RPFileTransferSession sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__RPFileTransferSession_sendEventID_event_destinationID_options_completion___block_invoke;
  block[3] = &unk_1E5F501A0;
  block[4] = self;
  v21 = v11;
  v23 = v13;
  v24 = v14;
  v22 = v12;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = v11;
  dispatch_async(dispatchQueue, block);

}

void __76__RPFileTransferSession_sendEventID_event_destinationID_options_completion___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  v2 = *(id *)(a1[4] + 64);
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sendEncryptedEventID:event:options:completion:", a1[5], a1[6], a1[7], a1[8]);
  }
  else
  {
    RPErrorF();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = **(_DWORD **)(a1[4] + 152);
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v5 = a1[8];
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);

  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int var0;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v14, "isEqual:", CFSTR("_ftPU")))
  {
    -[RPFileTransferSession _receivedPeerUpdate:](self, "_receivedPeerUpdate:", v8);
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handler");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v8, v9);
    }
    else
    {
      var0 = self->_ucat->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }

  }
}

- (void)_receivedPeerUpdate:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  int var0;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v4 = CFDictionaryGetInt64Ranged() & 0xC;
  v5 = v4 != 0;
  if (self->_peerInfraWiFiDisabled != v5)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v7 = "yes";
      if (v4)
        v8 = "no";
      else
        v8 = "yes";
      if (!v4)
        v7 = "no";
      v9 = v8;
      v10 = v7;
      LogPrintF();
    }
    self->_peerInfraWiFiDisabled = v5;
    -[RPFileTransferSession _updateWiFi](self, "_updateWiFi", v9, v10);
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int var0;
  RPRequestRegistration *v12;
  NSMutableDictionary *registeredRequests;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  var0 = self->_ucat->var0;
  if (v10)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v16 = v17;
      LogPrintF();
    }
    v12 = objc_alloc_init(RPRequestRegistration);
    -[RPRequestRegistration setRequestID:](v12, "setRequestID:", v17);
    -[RPRequestRegistration setOptions:](v12, "setOptions:", v8);
    -[RPRequestRegistration setHandler:](v12, "setHandler:", v9);
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = self->_registeredRequests;
      self->_registeredRequests = v14;

      registeredRequests = self->_registeredRequests;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v12, v17, v16);

  }
}

- (void)deregisterRequestID:(id)a3
{
  id v4;
  int var0;
  int v6;
  id v7;
  id v8;

  v4 = a3;
  var0 = self->_ucat->var0;
  v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      v7 = v4;
      LogPrintF();
      v4 = v8;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredRequests, "setObject:forKeyedSubscript:", 0, v4, v7);

}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  -[RPFileTransferSession sendRequestID:request:destinationID:options:responseHandler:](self, "sendRequestID:request:destinationID:options:responseHandler:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__RPFileTransferSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  block[3] = &unk_1E5F501A0;
  block[4] = self;
  v21 = v11;
  v23 = v13;
  v24 = v14;
  v22 = v12;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = v11;
  dispatch_async(dispatchQueue, block);

}

void __85__RPFileTransferSession_sendRequestID_request_destinationID_options_responseHandler___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  int v4;
  id v5;

  v2 = *(id *)(a1[4] + 64);
  v5 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", a1[5], a1[6], 0, a1[7], a1[8]);
  }
  else
  {
    RPErrorF();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = **(_DWORD **)(a1[4] + 152);
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*(void (**)(_QWORD, _QWORD))(a1[8] + 16))(a1[8], 0);

  }
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int var0;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v18, "isEqual:", CFSTR("_ftSm")))
  {
    -[RPFileTransferSession _smallFilesReceiveRequest:responseHandler:](self, "_smallFilesReceiveRequest:responseHandler:", v10, v12);
  }
  else if (objc_msgSend(v18, "isEqual:", CFSTR("_ftLg")))
  {
    -[RPFileTransferSession _largeFileReceiveRequest:responseHandler:](self, "_largeFileReceiveRequest:responseHandler:", v10, v12);
  }
  else if (objc_msgSend(v18, "isEqual:", CFSTR("_ftRs")))
  {
    -[RPFileTransferSession _resumeStateReceiveRequest:responseHandler:](self, "_resumeStateReceiveRequest:responseHandler:", v10, v12);
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handler");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      (*(void (**)(uint64_t, id, id, id))(v14 + 16))(v14, v10, v11, v12);
    }
    else
    {
      RPErrorF();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      var0 = self->_ucat->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v16);

    }
  }

}

- (BOOL)_activateSourceAndReturnError:(id *)a3
{
  CUCoalescer *v4;
  CUCoalescer *bonjourCoalescer;
  CUCoalescer *v6;
  uint64_t v7;
  unsigned int flags;
  uint64_t v9;
  unint64_t v10;
  CUBonjourBrowser *v11;
  CUBonjourBrowser *bonjourBrowser;
  CUBonjourBrowser *v13;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];

  -[RPFileTransferSession _updateWiFi](self, "_updateWiFi", a3);
  v4 = (CUCoalescer *)objc_alloc_init(MEMORY[0x1E0D1B350]);
  bonjourCoalescer = self->_bonjourCoalescer;
  self->_bonjourCoalescer = v4;
  v6 = v4;

  -[CUCoalescer setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[CUCoalescer setMinDelay:](v6, "setMinDelay:", 1.0);
  -[CUCoalescer setMaxDelay:](v6, "setMaxDelay:", 2.0);
  -[CUCoalescer setLeeway:](v6, "setLeeway:", 1.0);
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke;
  v18[3] = &unk_1E5F4ECF8;
  v18[4] = v6;
  v18[5] = self;
  -[CUCoalescer setActionHandler:](v6, "setActionHandler:", v18);
  flags = self->_flags;
  if ((flags & 0x10) != 0)
    v9 = 0x10000000000000;
  else
    v9 = 0x400000000000000;
  v10 = v9 & 0xFF9FFFFFFFFFFFFFLL | ((((unint64_t)(flags & 0x60) >> 5) & 3) << 53);
  v11 = (CUBonjourBrowser *)objc_alloc_init(MEMORY[0x1E0D1B348]);
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = v11;
  v13 = v11;

  -[CUBonjourBrowser setBrowseFlags:](v13, "setBrowseFlags:", v10);
  -[CUBonjourBrowser setChangeFlags:](v13, "setChangeFlags:", 1);
  -[CUBonjourBrowser setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
  -[CUBonjourBrowser setDomain:](v13, "setDomain:", CFSTR("local."));
  -[CUBonjourBrowser setLabel:](v13, "setLabel:", CFSTR("RPFile"));
  -[CUBonjourBrowser setServiceType:](v13, "setServiceType:", CFSTR("_rpft._tcp"));
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_2;
  v17[3] = &unk_1E5F501C8;
  v17[4] = v13;
  v17[5] = self;
  -[CUBonjourBrowser setDeviceFoundHandler:](v13, "setDeviceFoundHandler:", v17);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_3;
  v16[3] = &unk_1E5F501C8;
  v16[4] = v13;
  v16[5] = self;
  -[CUBonjourBrowser setDeviceLostHandler:](v13, "setDeviceLostHandler:", v16);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_4;
  v15[3] = &unk_1E5F501F0;
  v15[4] = v13;
  v15[5] = self;
  -[CUBonjourBrowser setDeviceChangedHandler:](v13, "setDeviceChangedHandler:", v15);
  -[CUBonjourBrowser activate](v13, "activate");

  return 1;
}

_QWORD *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[4])
    return (_QWORD *)objc_msgSend(result, "_handleDevicesCoalesced");
  return result;
}

_QWORD *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[3])
    return (_QWORD *)objc_msgSend(result, "_handleDeviceFound:", a2);
  return result;
}

_QWORD *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[3])
    return (_QWORD *)objc_msgSend(result, "_handleDeviceLost:", a2);
  return result;
}

_QWORD *__55__RPFileTransferSession__activateSourceAndReturnError___block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[3])
    return (_QWORD *)objc_msgSend(result, "_handleDeviceFound:", a2);
  return result;
}

- (void)_handleDeviceFound:(id)a3
{
  id v5;
  int var0;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  var0 = self->_ucat->var0;
  v14 = v5;
  if (var0 <= 20)
  {
    if (var0 != -1 || (v7 = _LogCategory_Initialize(), v5 = v14, v7))
    {
      CUDescriptionWithLevel();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v5 = v14;
    }
  }
  objc_msgSend(v5, "identifierStr", v12);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");

  if (v9)
  {
    if (-[NSString UTF8String](self->_targetID, "UTF8String"))
    {
      v10 = TextToHardwareAddressScalar();
      if (v10 == TextToHardwareAddressScalar())
      {
        v11 = self->_ucat->var0;
        if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
        {
          CUDescriptionWithLevel();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        objc_storeStrong((id *)&self->_bonjourDevice, a3);
        -[CUCoalescer trigger](self->_bonjourCoalescer, "trigger");
      }
    }
  }

}

- (void)_handleDeviceLost:(id)a3
{
  id v4;
  int var0;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  CUBonjourDevice *bonjourDevice;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  var0 = self->_ucat->var0;
  v14 = v4;
  if (var0 <= 20)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v14, v6))
    {
      CUDescriptionWithLevel();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v14;
    }
  }
  objc_msgSend(v4, "identifierStr", v12);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "UTF8String");

  if (v8)
  {
    if (-[NSString UTF8String](self->_targetID, "UTF8String"))
    {
      v9 = TextToHardwareAddressScalar();
      if (v9 == TextToHardwareAddressScalar())
      {
        v10 = self->_ucat->var0;
        if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        {
          CUDescriptionWithLevel();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        bonjourDevice = self->_bonjourDevice;
        self->_bonjourDevice = 0;

        -[RPConnection setPresent:](self->_controlCnx, "setPresent:", 0);
      }
    }
  }

}

- (void)_handleDevicesCoalesced
{
  int var0;
  void *v4;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUDescriptionWithLevel();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  -[RPFileTransferSession _controlCnxStartIfNeeded](self, "_controlCnxStartIfNeeded");
}

- (void)_controlCnxRetryIfNeeded
{
  int var0;
  OS_dispatch_source *v4;
  OS_dispatch_source *controlRetryTimer;
  NSObject *v6;
  _QWORD v7[6];

  if (!self->_invalidateCalled && !self->_controlCnx && self->_bonjourDevice && !self->_controlRetryTimer)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    controlRetryTimer = self->_controlRetryTimer;
    self->_controlRetryTimer = v4;
    v6 = v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__RPFileTransferSession__controlCnxRetryIfNeeded__block_invoke;
    v7[3] = &unk_1E5F4ECF8;
    v7[4] = v6;
    v7[5] = self;
    dispatch_source_set_event_handler(v6, v7);
    CUDispatchTimerSet();
    dispatch_resume(v6);

  }
}

void __49__RPFileTransferSession__controlCnxRetryIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v1 = *(void **)(a1 + 32);
  if (v1 == *(void **)(*(_QWORD *)(a1 + 40) + 72))
  {
    if (v1)
    {
      v3 = v1;
      dispatch_source_cancel(v3);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 72);
      *(_QWORD *)(v4 + 72) = 0;

    }
    v6 = *(id *)(*(_QWORD *)(a1 + 40) + 40);
    v7 = v6;
    v8 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 152);
    v12 = v6;
    if (v8 <= 30)
    {
      if (v8 != -1)
      {
        if (v6)
        {
LABEL_7:
          CUDescriptionWithLevel();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

          objc_msgSend(*(id *)(a1 + 40), "_controlCnxStartIfNeeded", v11);
          goto LABEL_11;
        }
LABEL_14:
        LogPrintF();
        goto LABEL_11;
      }
      v9 = _LogCategory_Initialize();
      v7 = v12;
      if (v9)
      {
        if (v12)
          goto LABEL_7;
        goto LABEL_14;
      }
    }
    if (!v7)
    {
LABEL_12:

      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "_controlCnxStartIfNeeded", v10);
LABEL_11:
    v7 = v12;
    goto LABEL_12;
  }
}

- (void)_controlCnxStartIfNeeded
{
  RPConnection **p_controlCnx;
  CUBonjourDevice *v4;
  int var0;
  OS_dispatch_source *controlRetryTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  RPConnection *v9;
  id v10;
  NSString *targetID;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CUBonjourDevice *v15;
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];

  p_controlCnx = &self->_controlCnx;
  if (!self->_controlCnx)
  {
    v4 = self->_bonjourDevice;
    if (v4)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v15 = v4;
        LogPrintF();
      }
      controlRetryTimer = self->_controlRetryTimer;
      if (controlRetryTimer)
      {
        v7 = controlRetryTimer;
        dispatch_source_cancel(v7);
        v8 = self->_controlRetryTimer;
        self->_controlRetryTimer = 0;

      }
      v9 = objc_alloc_init(RPConnection);
      objc_storeStrong((id *)p_controlCnx, v9);
      if (self->_prefCompress)
        -[RPConnection setAppInfoSelf:](v9, "setAppInfoSelf:", &unk_1E5F6A600);
      -[RPConnection setBonjourPeerDevice:](v9, "setBonjourPeerDevice:", v4, v15);
      -[RPConnection setControlFlags:](v9, "setControlFlags:", -[RPConnection controlFlags](v9, "controlFlags") | 0x60000200);
      -[RPConnection setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
      -[RPConnection setForcedPeerIdentity:](v9, "setForcedPeerIdentity:", self->_peerIdentity);
      -[RPConnection setForcedSelfIdentity:](v9, "setForcedSelfIdentity:", self->_selfIdentity);
      -[RPConnection setKeepAliveSeconds:](v9, "setKeepAliveSeconds:", 30);
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      targetID = self->_targetID;
      v12 = self->_cnxIDLast + 1;
      self->_cnxIDLast = v12;
      v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("RPFileCnx-%@-Out-%u"), targetID, v12);
      -[RPConnection setLabel:](v9, "setLabel:", v13);

      -[RPConnection setPeerIdentifier:](v9, "setPeerIdentifier:", self->_targetID);
      -[RPConnection setPresent:](v9, "setPresent:", 1);
      v14 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke;
      v19[3] = &unk_1E5F4ECF8;
      v19[4] = v9;
      v19[5] = self;
      -[RPConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v19);
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_2;
      v18[3] = &unk_1E5F50218;
      v18[4] = v9;
      v18[5] = self;
      -[RPConnection setReceivedEventHandler:](v9, "setReceivedEventHandler:", v18);
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_3;
      v17[3] = &unk_1E5F50240;
      v17[4] = v9;
      v17[5] = self;
      -[RPConnection setReceivedRequestHandler:](v9, "setReceivedRequestHandler:", v17);
      v16[0] = v14;
      v16[1] = 3221225472;
      v16[2] = __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_4;
      v16[3] = &unk_1E5F50268;
      v16[4] = v9;
      v16[5] = self;
      -[RPConnection setStateChangedHandler:](v9, "setStateChangedHandler:", v16);
      -[RPConnection activate](v9, "activate");

    }
  }
}

uint64_t __49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (v1 == *(void **)(v2 + 64))
  {
    v3 = result;
    *(_QWORD *)(v2 + 64) = 0;

    objc_msgSend(*(id *)(v3 + 40), "_reportProgressControlState");
    return objc_msgSend(*(id *)(v3 + 40), "_controlCnxRetryIfNeeded");
  }
  return result;
}

_QWORD *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v5 == result[8])
    return (_QWORD *)objc_msgSend(result, "_receivedEventID:event:options:", a2, a3, a4);
  return result;
}

_QWORD *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[8])
    return (_QWORD *)objc_msgSend(result, "_receivedRequestID:request:options:responseHandler:", a2, a3, a4, a5);
  return result;
}

_QWORD *__49__RPFileTransferSession__controlCnxStartIfNeeded__block_invoke_4(uint64_t a1, int a2)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v4 == result[8])
  {
    result = (_QWORD *)objc_msgSend(result, "_reportProgressControlState");
    if (a2 == 1)
      return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "_scheduleItems");
  }
  return result;
}

- (BOOL)_activateTargetAndReturnError:(id *)a3
{
  RPFileTransferResumeState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RPFileTransferResumeState *resumeState;
  id v14;
  CUTCPServer *tcpServer;
  id v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v21;
  id v22;
  _QWORD v23[6];
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[RPFileTransferSession _updateWiFi](self, "_updateWiFi");
  if ((-[RPFileTransferSession flags](self, "flags") & 0x200) != 0)
  {
    v5 = -[RPFileTransferResumeState initWithDispatchQueue:]([RPFileTransferResumeState alloc], "initWithDispatchQueue:", self->_dispatchQueue);
    if (v5)
    {
      if (self->_receiveFileParentPath)
      {
        -[RPFileTransferSession targetID](self, "targetID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          -[RPFileTransferSession targetID](self, "targetID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-state.rptfd"), v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSString stringByStandardizingPath](self->_receiveFileParentPath, "stringByStandardizingPath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RPFileTransferResumeState setOutputPath:](v5, "setOutputPath:", v10);

          -[NSString stringByAppendingPathComponent:](self->_receiveFileParentPath, "stringByAppendingPathComponent:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByStandardizingPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[RPFileTransferResumeState setStateFilePath:](v5, "setStateFilePath:", v12);

          -[RPFileTransferResumeState setUcat:](v5, "setUcat:", self->_ucat);
          -[RPFileTransferResumeState setFlushInterval:](v5, "setFlushInterval:", self->_resumeStateFlushInterval);
          -[RPFileTransferResumeState loadStateFile](v5, "loadStateFile");
          if (!-[RPFileTransferResumeState isEmpty](v5, "isEmpty"))
          {
            -[RPFileTransferSession targetID](self, "targetID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            FPrintF();

          }
          resumeState = self->_resumeState;
          self->_resumeState = v5;

          goto LABEL_8;
        }
        if (a3)
          goto LABEL_21;
LABEL_22:

        return 0;
      }
      if (!a3)
        goto LABEL_22;
    }
    else if (!a3)
    {
      goto LABEL_22;
    }
LABEL_21:
    RPErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_8:
  v14 = objc_alloc_init(MEMORY[0x1E0D1B468]);
  objc_storeStrong((id *)&self->_tcpServer, v14);
  objc_msgSend(v14, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v14, "setFlags:", 9);
  objc_msgSend(v14, "setLabel:", CFSTR("RPFile"));
  -[CUTCPServer setConnectionPrepareHandler:](self->_tcpServer, "setConnectionPrepareHandler:", &__block_literal_global_7);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__RPFileTransferSession__activateTargetAndReturnError___block_invoke_2;
  v23[3] = &unk_1E5F502B0;
  v23[4] = v14;
  v23[5] = self;
  -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v23);
  tcpServer = self->_tcpServer;
  v22 = 0;
  -[CUTCPServer activateDirectAndReturnError:](tcpServer, "activateDirectAndReturnError:", &v22);
  v16 = v22;
  v17 = v16 == 0;
  if (v16)
  {
    if (a3)
    {
      RPNestedErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v18 = objc_alloc_init(MEMORY[0x1E0D1B340]);
    objc_storeStrong((id *)&self->_bonjourAdvertiser, v18);
    if ((self->_flags & 0x10) == 0)
      objc_msgSend(v18, "setAdvertiseFlags:", 0x100000);
    objc_msgSend(v18, "setDispatchQueue:", self->_dispatchQueue, v21);
    objc_msgSend(v18, "setDomain:", CFSTR("local."));
    objc_msgSend(v18, "setLabel:", CFSTR("RPFile"));
    objc_msgSend(v18, "setName:", self->_targetID);
    objc_msgSend(v18, "setPort:", -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
    objc_msgSend(v18, "setServiceType:", CFSTR("_rpft._tcp"));
    v24 = CFSTR("rpBA");
    v25[0] = self->_targetID;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTxtDictionary:", v19);

    objc_msgSend(v18, "activate");
  }

  return v17;
}

uint64_t __55__RPFileTransferSession__activateTargetAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setKeepAliveSeconds:", 30);
}

_QWORD *__55__RPFileTransferSession__activateTargetAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[18])
    return (_QWORD *)objc_msgSend(result, "_handleIncomingConnectionStarted:", a2);
  return result;
}

- (void)_handleIncomingConnectionStarted:(id)a3
{
  id v4;
  RPConnection *v5;
  RPConnection *v6;
  id v7;
  NSString *targetID;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableSet *connections;
  NSMutableSet *v14;
  NSMutableSet *v15;
  int var0;
  RPConnection *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[6];

  v4 = a3;
  v5 = objc_alloc_init(RPConnection);
  v6 = v5;
  if (self->_prefCompress)
    -[RPConnection setAppInfoSelf:](v5, "setAppInfoSelf:", &unk_1E5F6A628);
  -[RPConnection setControlFlags:](v6, "setControlFlags:", -[RPConnection controlFlags](v6, "controlFlags") | 0x60000000);
  -[RPConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setForcedPeerIdentity:](v6, "setForcedPeerIdentity:", self->_peerIdentity);
  -[RPConnection setForcedSelfIdentity:](v6, "setForcedSelfIdentity:", self->_selfIdentity);
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  targetID = self->_targetID;
  v9 = self->_cnxIDLast + 1;
  self->_cnxIDLast = v9;
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("RPFileCnx-%@-In-%u"), targetID, v9);
  -[RPConnection setLabel:](v6, "setLabel:", v10);

  -[RPConnection setTcpConnection:](v6, "setTcpConnection:", v4);
  -[RPConnection label](v6, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v11);

  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke;
  v21[3] = &unk_1E5F4ECF8;
  v21[4] = self;
  v21[5] = v6;
  -[RPConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v21);
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_2;
  v20[3] = &unk_1E5F502D8;
  v20[4] = self;
  -[RPConnection setReceivedEventHandler:](v6, "setReceivedEventHandler:", v20);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_3;
  v19[3] = &unk_1E5F50300;
  v19[4] = self;
  -[RPConnection setReceivedRequestHandler:](v6, "setReceivedRequestHandler:", v19);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_4;
  v18[3] = &unk_1E5F50178;
  v18[4] = self;
  -[RPConnection setStateChangedHandler:](v6, "setStateChangedHandler:", v18);
  if (!self->_controlCnx)
  {
    objc_storeStrong((id *)&self->_controlCnx, v6);
    -[RPFileTransferSession _reportProgressControlState](self, "_reportProgressControlState");
  }
  connections = self->_connections;
  if (!connections)
  {
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = self->_connections;
    self->_connections = v14;

    connections = self->_connections;
  }
  -[NSMutableSet addObject:](connections, "addObject:", v6);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v17 = v6;
    LogPrintF();
  }
  -[RPConnection activate](v6, "activate", v17);

}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleIncomingConnectionEnded:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedEventID:event:options:", a2, a3, a4);
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedRequestID:request:options:responseHandler:", a2, a3, a4, a5);
}

uint64_t __58__RPFileTransferSession__handleIncomingConnectionStarted___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_reportProgressControlState");
  if (a2 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_scheduleItems");
  return result;
}

- (void)_handleIncomingConnectionEnded:(id)a3
{
  RPConnection *v4;
  int var0;
  int v6;
  void *v7;
  int v8;
  RPConnection *v9;
  RPConnection *v10;

  v4 = (RPConnection *)a3;
  var0 = self->_ucat->var0;
  v10 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v10, v6))
    {
      v9 = v4;
      LogPrintF();
      v4 = v10;
    }
  }
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v4, v9);
  if (self->_controlCnx == v10)
  {
    self->_controlCnx = 0;

  }
  -[RPFileTransferSession _reportProgressControlState](self, "_reportProgressControlState");
  if (!self->_controlCnx && !self->_invalidateCalled)
  {
    -[NSMutableSet anyObject](self->_connections, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = self->_ucat->var0;
      if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      objc_storeStrong((id *)&self->_controlCnx, v7);
      -[RPFileTransferSession _reportProgressControlState](self, "_reportProgressControlState");
    }

  }
}

- (void)addItem:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD *v10;
  BOOL v11;
  id obj;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__1;
  v13[4] = __Block_byref_object_dispose__1;
  v14 = 0;
  obj = 0;
  v5 = -[RPFileTransferSession _prepareItem:error:](self, "_prepareItem:error:", v4, &obj);
  objc_storeStrong(&v14, obj);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__RPFileTransferSession_addItem___block_invoke;
  block[3] = &unk_1E5F50328;
  v11 = v5;
  v9 = v4;
  v10 = v13;
  block[4] = self;
  v7 = v4;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(v13, 8);
}

void __33__RPFileTransferSession_addItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  if (*(_BYTE *)(a1 + 56) && (v2 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v2 + 89)))
  {
    v7 = **(_DWORD **)(v2 + 152);
    if (v7 <= 9)
    {
      if (v7 != -1 || (v12 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v12))
      {
        v8 = objc_msgSend(*(id *)(a1 + 40), "fileID");
        v9 = objc_msgSend(*(id *)(a1 + 40), "fileSize");
        v10 = objc_msgSend(*(id *)(a1 + 40), "metadataSize");
        objc_msgSend(*(id *)(a1 + 40), "itemURL");
        v19 = v10;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)v8;
        v18 = v9;
        LogPrintF();

        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    v13 = *(void **)(v2 + 168);
    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 168);
      *(_QWORD *)(v15 + 168) = v14;

      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
    }
    objc_msgSend(v13, "addObject:", *(_QWORD *)(a1 + 40), v17, v18, v19, v20);
    objc_msgSend(*(id *)(a1 + 32), "_metricAddFileSize:", objc_msgSend(*(id *)(a1 + 40), "fileSize"));
    objc_msgSend(*(id *)(a1 + 32), "_scheduleItems");
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      RPErrorF();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
    v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 40), "completionHandler", v17, v18);
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v21 = v11;
      v11[2](v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 40), "setCompletionHandler:", 0);
      v11 = (void (**)(_QWORD, _QWORD))v21;
    }

  }
}

- (void)addItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *dispatchQueue;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)objc_msgSend(a3, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v16 = 0;
        v10 = -[RPFileTransferSession _prepareItem:error:](self, "_prepareItem:error:", v9, &v16);
        v11 = v16;
        if (!v10)
          objc_msgSend(v9, "setError:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__RPFileTransferSession_addItems___block_invoke;
  block[3] = &unk_1E5F4ECF8;
  block[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_async(dispatchQueue, block);

}

void __34__RPFileTransferSession_addItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD);
  int v31;
  uint64_t v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 89))
  {
    if (!*(_QWORD *)(v2 + 168))
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 168);
      *(_QWORD *)(v14 + 168) = v13;

    }
    v40 = objc_msgSend(*(id *)(a1 + 40), "count");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v16 = *(id *)(a1 + 40);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (!v17)
    {
LABEL_44:

      objc_msgSend(*(id *)(a1 + 32), "_scheduleItems");
      return;
    }
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v44;
    v39 = v16;
    v42 = *(_QWORD *)v44;
LABEL_22:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v20)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v21);
      objc_msgSend(v22, "error");
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
        if (v24 <= 90 && (v24 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v22, "itemURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v23;
          LogPrintF();

          v20 = v42;
        }
        objc_msgSend(v22, "completionHandler", v33, v34);
        v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v22, "setCompletionHandler:", 0);
          ((void (**)(_QWORD, char *))v30)[2](v30, v23);
        }

        goto LABEL_39;
      }
      ++v19;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = **(_DWORD **)(v25 + 152);
      if (v26 <= 9)
      {
        if (v26 == -1)
        {
          v31 = _LogCategory_Initialize();
          v25 = *(_QWORD *)(a1 + 32);
          if (!v31)
            goto LABEL_38;
          v41 = v19;
        }
        else
        {
          v41 = v19;
        }
        v27 = objc_msgSend(v22, "fileID");
        v28 = objc_msgSend(v22, "fileSize");
        v29 = objc_msgSend(v22, "metadataSize");
        objc_msgSend(v22, "itemURL");
        v37 = v29;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v40;
        v36 = v28;
        v19 = v41;
        v33 = (void *)v27;
        v34 = v41;
        LogPrintF();

        v25 = *(_QWORD *)(a1 + 32);
        v16 = v39;
        v20 = v42;
      }
LABEL_38:
      objc_msgSend(*(id *)(v25 + 168), "addObject:", v22, v33, v34, v35, v36, v37, v38);
      objc_msgSend(*(id *)(a1 + 32), "_metricAddFileSize:", objc_msgSend(v22, "fileSize"));
LABEL_39:

      if (v18 == ++v21)
      {
        v32 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        v18 = v32;
        if (!v32)
          goto LABEL_44;
        goto LABEL_22;
      }
    }
  }
  RPErrorF();
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
        v10 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
        if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v9, "itemURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v3;
          LogPrintF();

        }
        objc_msgSend(v9, "completionHandler", v33, v34);
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v9, "setCompletionHandler:", 0);
          ((void (**)(_QWORD, char *))v11)[2](v11, v3);
        }

        ++v8;
      }
      while (v6 != v8);
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      v6 = v12;
    }
    while (v12);
  }

}

- (BOOL)_prepareItem:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t *p_fileIDLastSend;
  unint64_t v8;
  id v9;
  const char *v10;
  off_t st_size;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  stat v20;

  v6 = a3;
  objc_msgSend(v6, "setCompleted:", 0);
  objc_msgSend(v6, "setError:", 0);
  p_fileIDLastSend = &self->_fileIDLastSend;
  do
    v8 = __ldaxr(p_fileIDLastSend);
  while (__stlxr(v8 + 1, p_fileIDLastSend));
  objc_msgSend(v6, "setFileID:", v8 + 1);
  objc_msgSend(v6, "itemURL");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  if (!v10)
  {
    if (a4)
      goto LABEL_18;
    goto LABEL_23;
  }
  memset(&v20, 0, sizeof(v20));
  if (stat(v10, &v20) && (!*__error() || *__error()))
  {
    if (a4)
    {
LABEL_18:
      RPErrorF();
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_23:
    v15 = 0;
    goto LABEL_21;
  }
  st_size = v20.st_size;
  objc_msgSend(v6, "setFileSize:", v20.st_size);
  objc_msgSend(v6, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = OPACKEstimateEncodedSize();
  else
    v13 = 0;
  objc_msgSend(v6, "setMetadataSize:", v13);
  v14 = st_size + v13;
  if (__CFADD__(st_size, v13)
    || (v16 = v14 + 200, v17 = v14 >= 0xFFFFFFFFFFFFFF38, (v18 = v17 << 63 >> 63, v18 ^ v17) || v18 < 0))
  {
    if (a4)
    {
      RPErrorF();
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    objc_msgSend(v6, "setEstimatedSize:", v16);
    v15 = 1;
  }

LABEL_21:
  return v15;
}

- (void)_scheduleItems
{
  void *v3;
  void *v4;
  char v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int var0;
  NSObject *v14;
  uint64_t v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[6];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidateCalled && -[RPConnection state](self->_controlCnx, "state") == 1)
  {
    if (!-[RPFileTransferSession isResumable](self, "isResumable")
      || (-[RPFileTransferSession flags](self, "flags") & 1) != 0)
    {
      goto LABEL_7;
    }
    -[RPFileTransferSession resumeState](self, "resumeState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[RPFileTransferSession _requestResumeStateFromReceiver](self, "_requestResumeStateFromReceiver");
      return;
    }
    v4 = v3;
    v5 = objc_msgSend(v3, "isPlaceholder");

    if ((v5 & 1) == 0)
    {
LABEL_7:
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v6 = self->_smallFilesSendTasks;
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      v8 = MEMORY[0x1E0C809B0];
      if (v7)
      {
        v9 = v7;
        v10 = *(_QWORD *)v41;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v41 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
            if (objc_msgSend(v12, "needsRetry"))
            {
              objc_msgSend(v12, "setNeedsRetry:", 0);
              ++self->_metricRetries;
              var0 = self->_ucat->var0;
              if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
              {
                v31 = objc_msgSend(v12, "taskID");
                LogPrintF();
              }
              objc_msgSend(v12, "queue", v31);
              v14 = objc_claimAutoreleasedReturnValue();
              block[0] = v8;
              block[1] = 3221225472;
              block[2] = __39__RPFileTransferSession__scheduleItems__block_invoke;
              block[3] = &unk_1E5F4ECF8;
              block[4] = self;
              block[5] = v12;
              dispatch_async(v14, block);

            }
            ++v11;
          }
          while (v9 != v11);
          v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          v9 = v15;
        }
        while (v15);
      }

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v16 = self->_largeFileSendTasks;
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v36;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v20);
            if (objc_msgSend(v21, "needsRetry"))
            {
              objc_msgSend(v21, "setNeedsRetry:", 0);
              ++self->_metricRetries;
              v22 = self->_ucat->var0;
              if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize()))
              {
                v31 = objc_msgSend(v21, "taskID");
                LogPrintF();
              }
              objc_msgSend(v21, "queue", v31);
              v23 = objc_claimAutoreleasedReturnValue();
              v34[0] = v8;
              v34[1] = 3221225472;
              v34[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_2;
              v34[3] = &unk_1E5F4ECF8;
              v34[4] = self;
              v34[5] = v21;
              dispatch_async(v23, v34);

            }
            ++v20;
          }
          while (v18 != v20);
          v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          v18 = v24;
        }
        while (v24);
      }

      while (-[NSMutableSet count](self->_smallFilesSendTasks, "count") < self->_maxSmallFileTasks)
      {
        -[RPFileTransferSession _smallFilesSendTaskCreate](self, "_smallFilesSendTaskCreate");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
          break;
        v26 = (void *)v25;
        -[NSMutableSet addObject:](self->_smallFilesSendTasks, "addObject:", v25);
        objc_msgSend(v26, "queue");
        v27 = objc_claimAutoreleasedReturnValue();
        v33[0] = v8;
        v33[1] = 3221225472;
        v33[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_3;
        v33[3] = &unk_1E5F4ECF8;
        v33[4] = self;
        v33[5] = v26;
        dispatch_async(v27, v33);

      }
      while (-[NSMutableSet count](self->_largeFileSendTasks, "count") < self->_maxLargeFileTasks)
      {
        -[RPFileTransferSession _largeFileSendTaskCreate](self, "_largeFileSendTaskCreate");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          break;
        v29 = (void *)v28;
        -[NSMutableSet addObject:](self->_largeFileSendTasks, "addObject:", v28);
        objc_msgSend(v29, "queue");
        v30 = objc_claimAutoreleasedReturnValue();
        v32[0] = v8;
        v32[1] = 3221225472;
        v32[2] = __39__RPFileTransferSession__scheduleItems__block_invoke_4;
        v32[3] = &unk_1E5F4ECF8;
        v32[4] = self;
        v32[5] = v29;
        dispatch_async(v30, v32);

      }
    }
  }
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_smallFilesSendTaskRun:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskStart:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_smallFilesSendTaskRun:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__RPFileTransferSession__scheduleItems__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskStart:", *(_QWORD *)(a1 + 40));
}

- (void)_requestResumeStateFromReceiver
{
  RPFileTransferResumeState *v3;
  RPFileTransferResumeState *resumeState;
  RPFileTransferResumeState *v5;
  id v6;
  void *v7;
  RPConnection *controlCnx;
  _QWORD v9[5];

  v3 = objc_alloc_init(RPFileTransferResumeState);
  -[RPFileTransferResumeState setIsPlaceholder:](v3, "setIsPlaceholder:", 1);
  -[RPFileTransferResumeState setUcat:](v3, "setUcat:", self->_ucat);
  resumeState = self->_resumeState;
  self->_resumeState = v3;
  v5 = v3;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[RPFileTransferSession targetID](self, "targetID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("_i"));

  controlCnx = self->_controlCnx;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__RPFileTransferSession__requestResumeStateFromReceiver__block_invoke;
  v9[3] = &unk_1E5F4FAC0;
  v9[4] = self;
  -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:](controlCnx, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", CFSTR("_ftRs"), v6, 0, 0, v9);

}

void __56__RPFileTransferSession__requestResumeStateFromReceiver__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  RPFileTransferResumeState *v14;
  id v15;
  int v16;
  void *v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "code");
    v12 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
    if (v11 == -6714)
    {
      if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
        goto LABEL_15;
    }
    else if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
    {
      v17 = v10;
LABEL_15:
      LogPrintF();
    }
  }
  else if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("resumeState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v18 = 0;
      v14 = -[RPFileTransferResumeState initWithDictionaryRepresentation:error:]([RPFileTransferResumeState alloc], "initWithDictionaryRepresentation:error:", v13, &v18);
      v15 = v18;
      if (v14)
      {
        if (!-[RPFileTransferResumeState isEmpty](v14, "isEmpty"))
        {
          objc_msgSend(*(id *)(a1 + 32), "targetID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          FPrintF();

        }
        -[RPFileTransferResumeState removeUnusableSourceFileItems](v14, "removeUnusableSourceFileItems", v17);
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), v14);
      }
      else
      {
        v16 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 152);
        if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
        {
          v17 = v15;
          LogPrintF();
        }
      }

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setIsPlaceholder:", 0, v17);
  objc_msgSend(*(id *)(a1 + 32), "_scheduleItems");

}

- (void)_completeItem:(id)a3 error:(id)a4
{
  -[RPFileTransferSession _completeItemDirect:error:](self, "_completeItemDirect:error:", a3, a4);
  -[RPFileTransferSession _processFinish](self, "_processFinish");
}

- (void)_completeItemDirect:(id)a3 error:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  int var0;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64x2_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "completionHandler");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v15, "setCompletionHandler:", 0);
    var0 = self->_ucat->var0;
    if (v6)
    {
      if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
        goto LABEL_13;
      objc_msgSend(v15, "itemURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v9;
      v14 = v6;
    }
    else
    {
      if (var0 > 9 || var0 == -1 && !_LogCategory_Initialize())
        goto LABEL_13;
      objc_msgSend(v15, "itemURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v9;
    }
    LogPrintF();

LABEL_13:
    ((void (**)(_QWORD, id))v7)[2](v7, v6);
  }
  if ((objc_msgSend(v15, "completed", v13, v14) & 1) == 0)
  {
    objc_msgSend(v15, "setCompleted:", 1);
    self->_metricLastFileCompletionTicks = mach_absolute_time();
    if (!v6)
    {
      v10 = objc_msgSend(v15, "fileSize");
      v11 = objc_msgSend(v15, "metadataSize");
      v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = v11 + v10;
      *(int64x2_t *)&self->_metricTotalBytes = vaddq_s64(v12, *(int64x2_t *)&self->_metricTotalBytes);
    }
  }

}

- (void)_processReceivedItem:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_receivedItemHandler);
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke;
    v14[3] = &unk_1E5F4F3E8;
    v14[4] = self;
    v15 = v7;
    ((void (**)(_QWORD, id, _QWORD *))v8)[2](v8, v6, v14);

  }
  else
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_receivedItemsHandler);
    if (v9)
    {
      v16[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_3;
      v12[3] = &unk_1E5F4F3E8;
      v12[4] = self;
      v13 = v7;
      ((void (**)(_QWORD, void *, _QWORD *))v9)[2](v9, v10, v12);

    }
    else
    {
      RPErrorF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v11);

    }
  }

}

void __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 584);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_2;
  v7[3] = &unk_1E5F4F4C8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 32))
    v1 = 0;
  else
    v1 = MEMORY[0x1E0C9AA70];
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v1, 0);
}

void __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 584);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_4;
  v7[3] = &unk_1E5F4F4C8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __62__RPFileTransferSession__processReceivedItem_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 32))
    v1 = 0;
  else
    v1 = MEMORY[0x1E0C9AA70];
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v1, 0);
}

- (void)_processReceivedItems:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *dispatchQueue;
  void *v17;
  id obj;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_receivedItemsHandler);
  if (v8)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke;
    v29[3] = &unk_1E5F4F3E8;
    v29[4] = self;
    v30 = v7;
    ((void (**)(_QWORD, id, _QWORD *))v8)[2](v8, v6, v29);

  }
  else
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_receivedItemHandler);
    if (v9)
    {
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__1;
      v27[4] = __Block_byref_object_dispose__1;
      v28 = 0;
      v10 = dispatch_group_create();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      obj = v6;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v24;
        v13 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            dispatch_group_enter(v10);
            v22[0] = v13;
            v22[1] = 3221225472;
            v22[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_3;
            v22[3] = &unk_1E5F50350;
            v22[4] = v10;
            v22[5] = v27;
            ((void (**)(_QWORD, uint64_t, _QWORD *))v9)[2](v9, v15, v22);
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v11);
      }

      v8 = 0;
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_4;
      block[3] = &unk_1E5F50378;
      v20 = v7;
      v21 = v27;
      dispatch_group_notify(v10, dispatchQueue, block);

      _Block_object_dispose(v27, 8);
    }
    else
    {
      RPErrorF();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v17);

    }
  }

}

void __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 584);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_2;
  v7[3] = &unk_1E5F4F4C8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 32))
    v1 = 0;
  else
    v1 = MEMORY[0x1E0C9AA70];
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v1, 0);
}

void __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __63__RPFileTransferSession__processReceivedItems_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v1 = 0;
  else
    v1 = MEMORY[0x1E0C9AA70];
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v1, 0);
}

- (void)finish
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__RPFileTransferSession_finish__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__RPFileTransferSession_finish__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 152);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v2 + 88) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_processFinish");
  if (objc_msgSend(*(id *)(a1 + 32), "isResumable"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "flags") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "resumeState");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "flushStateFile");

    }
  }
}

- (void)_processFinish
{
  if (self->_finishPending
    && !-[NSMutableSet count](self->_addedItems, "count")
    && !-[NSMutableDictionary count](self->_smallFilesReceiveTasks, "count")
    && !-[NSMutableSet count](self->_smallFilesSendTasks, "count")
    && !-[NSMutableDictionary count](self->_largeFileReceiveTasks, "count")
    && !-[NSMutableSet count](self->_largeFileSendTasks, "count"))
  {
    -[RPFileTransferSession _reportCompletion:](self, "_reportCompletion:", 0);
  }
}

- (id)_smallFilesSendTaskCreate
{
  unint64_t prefSmallFilesMaxBytes;
  void *v4;
  RPFileTransferSmallFilesTask *v5;
  id v6;
  uint64_t v7;
  RPFileTransferSmallFilesTask *i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int var0;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)-[NSMutableSet copy](self->_addedItems, "copy");
  v5 = (RPFileTransferSmallFilesTask *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v17;
    v15 = prefSmallFilesMaxBytes;
    do
    {
      for (i = 0; i != v5; i = (RPFileTransferSmallFilesTask *)((char *)i + 1))
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "estimatedSize");
        v11 = prefSmallFilesMaxBytes - v10;
        if (prefSmallFilesMaxBytes >= v10)
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v6, "addObject:", v9);
          -[NSMutableSet removeObject:](self->_addedItems, "removeObject:", v9);
          prefSmallFilesMaxBytes = v11;
        }
      }
      v5 = (RPFileTransferSmallFilesTask *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);

    if (!v6)
    {
      v5 = 0;
      return v5;
    }
    if (prefSmallFilesMaxBytes > v15 >> 1)
      ++self->_metricPrematureSmallSets;
    v5 = objc_alloc_init(RPFileTransferSmallFilesTask);
    -[RPFileTransferSmallFilesTask setFileItems:](v5, "setFileItems:", v6);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSmallFilesTask setQueue:](v5, "setQueue:", v12);

    ++self->_taskIDLast;
    -[RPFileTransferSmallFilesTask setTaskID:](v5, "setTaskID:");
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[RPFileTransferSmallFilesTask taskID](v5, "taskID");
      objc_msgSend(v6, "count");
      LogPrintF();
    }
  }
  else
  {
    v6 = v4;
  }

  return v5;
}

- (void)_smallFilesSendTaskRun:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *dispatchQueue;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t *p_metricCompressedBytes;
  unint64_t *p_metricUncompressedBytes;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t *p_metricUncompressibleChunks;
  unint64_t v40;
  unint64_t *p_metricCompressionErrors;
  unint64_t v42;
  int var0;
  void *v44;
  NSObject *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  _QWORD v57[6];
  _QWORD v58[5];
  id v59;
  _QWORD block[6];
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[3];
  _QWORD v70[3];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v50 = v4;
  objc_msgSend(v4, "fileItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (-[RPFileTransferSession isResumable](self, "isResumable", v48))
        {
          -[RPFileTransferSession resumeState](self, "resumeState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "filename");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "finishedFileWithFileName:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v14, "fileName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            FPrintF();

            goto LABEL_13;
          }

        }
        v62 = 0;
        -[RPFileTransferSession _smallFilesSendTaskReadItem:error:](self, "_smallFilesSendTaskReadItem:error:", v11, &v62);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v62;
        v12 = v15;
        if (v14)
        {
          objc_msgSend(v5, "addObject:", v14);
        }
        else
        {
          dispatchQueue = self->_dispatchQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke;
          block[3] = &unk_1E5F4FB10;
          block[4] = self;
          block[5] = v11;
          v61 = v15;
          dispatch_async(dispatchQueue, block);

        }
LABEL_13:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v8);
  }

  v17 = v5;
  v18 = objc_msgSend(v5, "count");
  v19 = self->_dispatchQueue;
  if (v18)
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_3;
    v57[3] = &unk_1E5F4ECF8;
    v57[4] = v5;
    v57[5] = self;
    dispatch_async(v19, v57);
    v20 = 0x1E0C99000;
    v21 = v50;
    if (self->_compressionEnabled)
    {
      v55 = 0;
      v56 = 0;
      -[RPFileTransferSession _encodeAndCompressObject:originalSize:error:](self, "_encodeAndCompressObject:originalSize:error:", v5, &v56, &v55);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v55;
      v24 = v23;
      p_metricCompressedBytes = &self->_metricCompressedBytes;
      p_metricUncompressedBytes = &self->_metricUncompressedBytes;
      if (v22)
      {
        v27 = objc_msgSend(v22, "length");
        do
          v28 = __ldaxr(p_metricCompressedBytes);
        while (__stlxr(v28 + v27, p_metricCompressedBytes));
        v29 = v56;
        do
          v30 = __ldaxr(p_metricUncompressedBytes);
        while (__stlxr(v30 + v29, p_metricUncompressedBytes));
        v70[0] = v22;
        v69[0] = &unk_1E5F6A3F0;
        v69[1] = CFSTR("_i");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v50, "taskID"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v31;
        v69[2] = &unk_1E5F6A408;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v56);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v70[2] = v32;
        v20 = 0x1E0C99000uLL;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v50;
        v17 = v5;
        if (v33)
          goto LABEL_40;
      }
      else
      {
        v35 = v56;
        do
          v36 = __ldaxr(p_metricCompressedBytes);
        while (__stlxr(v36 + v35, p_metricCompressedBytes));
        v37 = v56;
        do
          v38 = __ldaxr(p_metricUncompressedBytes);
        while (__stlxr(v38 + v37, p_metricUncompressedBytes));
        p_metricUncompressibleChunks = &self->_metricUncompressibleChunks;
        v20 = 0x1E0C99000uLL;
        do
          v40 = __ldaxr(p_metricUncompressibleChunks);
        while (__stlxr(v40 + 1, p_metricUncompressibleChunks));
        if (v23)
        {
          p_metricCompressionErrors = &self->_metricCompressionErrors;
          do
            v42 = __ldaxr(p_metricCompressionErrors);
          while (__stlxr(v42 + 1, p_metricCompressionErrors));
          var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          {
            v48 = (void *)objc_msgSend(v50, "taskID", v48);
            v49 = v24;
            LogPrintF();
          }
        }

      }
    }
    v67[0] = CFSTR("_i");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v21, "taskID", v48, v49));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = &unk_1E5F6A420;
    v68[0] = v44;
    v68[1] = v17;
    objc_msgSend(*(id *)(v20 + 3456), "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
    v45 = self->_dispatchQueue;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_350;
    v51[3] = &unk_1E5F503C8;
    v51[4] = self;
    v52 = v21;
    v53 = v33;
    v54 = v17;
    v46 = v33;
    v47 = v21;
    dispatch_async(v45, v51);

    goto LABEL_41;
  }
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2;
  v58[3] = &unk_1E5F4ECF8;
  v21 = v50;
  v58[4] = self;
  v59 = v50;
  v34 = v50;
  dispatch_async(v19, v58);

LABEL_41:
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeItem:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_smallFilesSendTaskEnd:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "fileSize", (_QWORD)v10) < 1)
          v8 = 0;
        else
          v8 = objc_msgSend(v7, "fileSize");
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 312) += v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328) += result;
  return result;
}

void __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_350(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];
  id v10;

  v2 = *(id *)(a1[4] + 64);
  if (objc_msgSend(v2, "state") == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2_353;
    v9[3] = &unk_1E5F503A0;
    v3 = a1[6];
    v4 = a1[4];
    v5 = (void *)a1[5];
    v9[4] = a1[7];
    v9[5] = v4;
    v10 = v5;
    objc_msgSend(v2, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", CFSTR("_ftSm"), v3, 0, 0, v9);

  }
  else
  {
    v7 = (void *)a1[4];
    v6 = a1[5];
    RPErrorF();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_smallFilesSendTaskEnd:error:", v6, v8);

  }
}

void __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2_353(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "fileSize", (_QWORD)v13) < 1)
          v12 = 0;
        else
          v12 = objc_msgSend(v11, "fileSize");
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 304) += v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 320) += objc_msgSend(*(id *)(a1 + 32), "count");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 336) = 1;
  objc_msgSend(*(id *)(a1 + 40), "_smallFilesSendTaskEnd:error:", *(_QWORD *)(a1 + 48), v5);

}

- (id)_smallFilesSendTaskReadItem:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v23;
  unsigned __int8 md[32];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "itemURL");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "fileSystemRepresentation");

  if (v8)
  {
    -[RPFileTransferSession _readPath:size:error:](self, "_readPath:size:error:", v8, objc_msgSend(v6, "fileSize"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_retainAutorelease(v9);
      CC_SHA256((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), md);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
      objc_msgSend(v6, "setSha256HashData:", v12);
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, &unk_1E5F6A438);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("_s2"));
      objc_msgSend(v6, "filename");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, &unk_1E5F6A450);

      v15 = objc_msgSend(v6, "fileSize");
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, &unk_1E5F6A468);

      }
      objc_msgSend(v6, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, &unk_1E5F6A480);

      v23 = 0;
      -[RPFileTransferSession _modTimeForFileWithPath:error:](self, "_modTimeForFileWithPath:error:", v8, &v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v23;
      v20 = v19;
      if (v18)
      {
        objc_msgSend(v13, "addEntriesFromDictionary:", v18);
        v21 = v13;
      }
      else
      {
        v21 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v19);
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else if (a4)
  {
    RPErrorF();
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_smallFilesSendTaskEnd:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  int var0;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_smallFilesSendTasks, "containsObject:", v6) & 1) != 0)
  {
    if (!self->_invalidateCalled && objc_msgSend(v7, "code") == -71143)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v17 = objc_msgSend(v6, "taskID");
        v18 = v7;
        LogPrintF();
      }
      objc_msgSend(v6, "setNeedsRetry:", 1, v17, v18);
      goto LABEL_31;
    }
    v10 = self->_ucat->var0;
    if (v7)
    {
      if (v10 > 90 || v10 == -1 && !_LogCategory_Initialize())
        goto LABEL_23;
      v17 = objc_msgSend(v6, "taskID");
      v18 = v7;
    }
    else
    {
      if (v10 > 10 || v10 == -1 && !_LogCategory_Initialize())
        goto LABEL_23;
      v17 = objc_msgSend(v6, "taskID");
    }
    LogPrintF();
LABEL_23:
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "fileItems", v17, v18, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          -[RPFileTransferSession _completeItemDirect:error:](self, "_completeItemDirect:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v7);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    -[NSMutableSet removeObject:](self->_smallFilesSendTasks, "removeObject:", v6);
    -[RPFileTransferSession _processFinish](self, "_processFinish");
    objc_msgSend(v6, "queue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v16);

    -[RPFileTransferSession _scheduleItems](self, "_scheduleItems");
    goto LABEL_31;
  }
  v9 = self->_ucat->var0;
  if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "taskID");
    LogPrintF();
  }
LABEL_31:

}

- (void)_smallFilesReceiveRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t Int64;
  id *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  RPFileTransferItem *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  RPFileTransferResumeStateItem *v24;
  int var0;
  uint64_t v26;
  void *v27;
  RPFileTransferSmallFilesTask *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void (**v35)(_QWORD);
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  RPFileTransferSmallFilesTask *v42;
  id v43;
  _QWORD block[6];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id obj;
  int v52;
  _QWORD v53[5];
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = v5;
  NSDictionaryGetNSNumber();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v40, "unsignedLongLongValue");
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__1;
  v61 = __Block_byref_object_dispose__1;
  v62 = 0;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke;
  v53[3] = &unk_1E5F503F0;
  v55 = &v57;
  v56 = v7;
  v53[4] = self;
  v36 = v7;
  v37 = v6;
  v54 = v37;
  v35 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v53);
  if (self->_fileWritesOutstanding >= 0x32)
  {
    RPErrorF();
    v31 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v58[5];
    v58[5] = v31;

    goto LABEL_36;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      RPErrorF();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v58[5];
      v58[5] = v33;

      goto LABEL_35;
    }
    goto LABEL_8;
  }
  v52 = 0;
  Int64 = CFDictionaryGetInt64();
  if (!Int64)
  {
    RPErrorF();
    v32 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v58[5];
    v58[5] = v32;
    goto LABEL_39;
  }
  v9 = (id *)(v58 + 5);
  obj = (id)v58[5];
  -[RPFileTransferSession _decompressAndDecodeData:originalSize:error:](self, "_decompressAndDecodeData:originalSize:error:", v38, Int64, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, obj);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      RPErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v58[5];
      v58[5] = v11;

LABEL_39:
      goto LABEL_35;
    }
LABEL_8:
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v42 = v10;
    v13 = -[RPFileTransferSmallFilesTask countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v42);
          v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            RPErrorF();
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = (void *)v58[5];
            v58[5] = v26;

            v28 = v42;
            goto LABEL_34;
          }
          v17 = objc_alloc_init(RPFileTransferItem);
          CFDataGetTypeID();
          CFDictionaryGetTypedValue();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            -[RPFileTransferItem setFileData:](v17, "setFileData:", v18);
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            -[RPFileTransferItem setFilename:](v17, "setFilename:", v19);
          v52 = 0;
          v20 = CFDictionaryGetInt64();
          if (!v52)
            -[RPFileTransferItem setFileSize:](v17, "setFileSize:", v20);
          CFDictionaryGetTypeID();
          CFDictionaryGetTypedValue();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            -[RPFileTransferItem setMetadata:](v17, "setMetadata:", v21);
          CFDictionaryGetCFDataOfLength();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            -[RPFileTransferItem setSha256HashData:](v17, "setSha256HashData:", v22);
          objc_msgSend(v43, "addObject:", v17);
          if (-[RPFileTransferSession isResumable](self, "isResumable"))
          {
            -[RPFileTransferSession resumeState](self, "resumeState");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[RPFileTransferResumeStateItem initWithFileTransferRequestDict:]([RPFileTransferResumeStateItem alloc], "initWithFileTransferRequestDict:", v16);
            objc_msgSend(v23, "addActiveFile:", v24);
            objc_msgSend(v23, "scheduleStateFileFlush");

          }
        }
        v13 = -[RPFileTransferSmallFilesTask countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        if (v13)
          continue;
        break;
      }
    }

    var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v43, "count");
      LogPrintF();
    }
    v28 = objc_alloc_init(RPFileTransferSmallFilesTask);
    -[RPFileTransferSmallFilesTask setFileItems:](v28, "setFileItems:", v43);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSmallFilesTask setQueue:](v28, "setQueue:", v29);

    -[RPFileTransferSmallFilesTask setTaskID:](v28, "setTaskID:", v36);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_smallFilesReceiveTasks, "setObject:forKeyedSubscript:", v28, v40);
    ++self->_fileWritesOutstanding;
    -[RPFileTransferSmallFilesTask queue](v28, "queue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke_2;
    block[3] = &unk_1E5F4F4F0;
    block[4] = self;
    block[5] = v28;
    v46 = v37;
    dispatch_async(v30, block);

LABEL_34:
  }
LABEL_35:

LABEL_36:
  v35[2](v35);

  _Block_object_dispose(&v57, 8);
}

uint64_t __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    v2 = **(_DWORD **)(*(_QWORD *)(result + 32) + 152);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_smallFilesReceiveTaskRun:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_smallFilesReceiveTaskRun:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  NSObject *dispatchQueue;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "fileItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
LABEL_3:
    v13 = 0;
    v14 = v11;
    while (1)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v8);
      v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
      v25 = v14;
      v16 = -[RPFileTransferSession _smallFilesReceiveTaskFileItem:error:](self, "_smallFilesReceiveTaskFileItem:error:", v15, &v25);
      v11 = v25;

      if (!v16)
        break;
      ++v13;
      v14 = v11;
      if (v10 == v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v11 = 0;
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RPFileTransferSession__smallFilesReceiveTaskRun_responseHandler___block_invoke;
  block[3] = &unk_1E5F4F608;
  block[4] = self;
  v22 = v6;
  v23 = v11;
  v24 = v7;
  v18 = v7;
  v19 = v11;
  v20 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __67__RPFileTransferSession__smallFilesReceiveTaskRun_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_smallFilesReceiveTaskComplete:error:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)_smallFilesReceiveTaskFileItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  id v17;
  BOOL v18;
  _QWORD v20[4];
  int v21;
  unsigned __int8 md[8];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "sha256HashData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") == 32)
  {
    objc_msgSend(v6, "fileData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFileData:", 0);
    v9 = objc_retainAutorelease(v8);
    CC_SHA256((const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), md);
    v10 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    if (*(_QWORD *)md == *v10 && v23 == v10[1] && v24 == v10[2] && v25 == v10[3])
    {
      v14 = -[RPFileTransferSession _openWriteFileItem:size:error:](self, "_openWriteFileItem:size:error:", v6, objc_msgSend(v9, "length"), a4);
      v15 = v14;
      if ((v14 & 0x80000000) == 0)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __62__RPFileTransferSession__smallFilesReceiveTaskFileItem_error___block_invoke;
        v20[3] = &__block_descriptor_36_e5_v8__0l;
        v21 = v14;
        v16 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v20);
        v18 = 1;
        if (objc_msgSend(v9, "length"))
        {
          v17 = objc_retainAutorelease(v9);
          if (!-[RPFileTransferSession _writeFD:buffer:size:error:](self, "_writeFD:buffer:size:error:", v15, objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), a4))v18 = 0;
        }
        v16[2](v16);

        goto LABEL_18;
      }
    }
    else if (a4)
    {
      RPErrorF();
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_19;
    }
    v18 = 0;
    goto LABEL_18;
  }
  if (a4)
  {
    RPErrorF();
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

uint64_t __62__RPFileTransferSession__smallFilesReceiveTaskFileItem_error___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_smallFilesReceiveTaskComplete:(id)a3 error:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSMutableDictionary *smallFilesReceiveTasks;
  void *v13;
  void *v14;
  int var0;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  unint64_t v23;
  int v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "taskID");
  smallFilesReceiveTasks = self->_smallFilesReceiveTasks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](smallFilesReceiveTasks, "setObject:forKeyedSubscript:", 0, v13);

  objc_msgSend(v8, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v14);

  --self->_fileWritesOutstanding;
  if (self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    RPErrorF();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v25);
    -[RPFileTransferSession _updateSmallFilesTaskResumeState:error:](self, "_updateSmallFilesTaskResumeState:error:", v8, v25);
LABEL_24:

    goto LABEL_27;
  }
  if (!v9)
  {
    objc_msgSend(v8, "fileItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (objc_msgSend(v22, "fileSize") < 1)
            v23 = 0;
          else
            v23 = objc_msgSend(v22, "fileSize");
          *(int64x2_t *)&self->_progressCurrentBytes = vaddq_s64(*(int64x2_t *)&self->_progressCurrentBytes, vdupq_n_s64(v23));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v19);
    }
    *(int64x2_t *)&self->_progressCurrentFiles = vaddq_s64(*(int64x2_t *)&self->_progressCurrentFiles, vdupq_n_s64(objc_msgSend(v17, "count")));
    self->_progressDirty = 1;
    v24 = self->_ucat->var0;
    if (v24 <= 9 && (v24 != -1 || _LogCategory_Initialize()))
    {
      v33 = v11;
      LogPrintF();
    }
    objc_msgSend(v8, "fileItems", v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _processReceivedItems:responseHandler:](self, "_processReceivedItems:responseHandler:", v26, v10);

    -[RPFileTransferSession _updateSmallFilesTaskResumeState:error:](self, "_updateSmallFilesTaskResumeState:error:", v8, 0);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v17;
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          v32 = objc_msgSend(v31, "fileSize");
          self->_metricTotalBytes += objc_msgSend(v31, "metadataSize") + v32;
        }
        v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v28);
    }

    self->_metricTotalFiles += objc_msgSend(v25, "count");
    self->_metricLastFileCompletionTicks = mach_absolute_time();
    goto LABEL_24;
  }
  v16 = self->_ucat->var0;
  if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v9);
  -[RPFileTransferSession _updateSmallFilesTaskResumeState:error:](self, "_updateSmallFilesTaskResumeState:error:", v8, v9);
LABEL_27:

}

- (void)_updateSmallFilesTaskResumeState:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v6;
    objc_msgSend(v6, "fileItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
          -[RPFileTransferSession resumeState](self, "resumeState");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "filename");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "activeFileWithFileName:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            if (v7)
              v17 = 0;
            else
              v17 = objc_msgSend(v13, "fileSize");
            objc_msgSend(v16, "setBytesWritten:", v17);
            objc_msgSend(v16, "setError:", v7);
            objc_msgSend(v14, "removeActiveFile:", v16);
            objc_msgSend(v14, "addFinishedFile:", v16);
            objc_msgSend(v14, "scheduleStateFileFlush");
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    v6 = v18;
  }

}

- (id)_largeFileSendTaskCreate
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  RPFileTransferLargeFileSendTask *v9;
  NSMutableSet *v10;
  void *v11;
  int var0;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_addedItems;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
      if (objc_msgSend(v8, "estimatedSize") > (unint64_t)self->_prefSmallFilesMaxBytes)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v8;

    if (!v10)
      return 0;
    -[NSMutableSet removeObject:](self->_addedItems, "removeObject:", v10);
    v9 = objc_alloc_init(RPFileTransferLargeFileSendTask);
    -[RPFileTransferLargeFileSendTask setFileFD:](v9, "setFileFD:", 0xFFFFFFFFLL);
    -[RPFileTransferLargeFileSendTask setFileOffset:](v9, "setFileOffset:", 0);
    -[RPFileTransferLargeFileSendTask setFileItem:](v9, "setFileItem:", v10);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferLargeFileSendTask setQueue:](v9, "setQueue:", v11);

    ++self->_taskIDLast;
    -[RPFileTransferLargeFileSendTask setTaskID:](v9, "setTaskID:");
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[RPFileTransferLargeFileSendTask taskID](v9, "taskID");
      -[NSMutableSet fileID](v10, "fileID");
      -[NSMutableSet fileSize](v10, "fileSize");
      -[NSMutableSet metadataSize](v10, "metadataSize");
      LogPrintF();
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
    v10 = v3;
  }

  return v9;
}

- (void)_largeFileSendTaskStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void (**v8)(_QWORD);
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *dispatchQueue;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  id obj;
  _QWORD v35[7];
  _QWORD block[5];
  char *v37;
  _QWORD v38[6];
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v4 = a3;
  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1;
  v45 = __Block_byref_object_dispose__1;
  v46 = 0;
  objc_msgSend(v4, "fileItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke;
  v38[3] = &unk_1E5F50438;
  v40 = &v41;
  v38[4] = self;
  v38[5] = v6;
  v7 = (char *)v4;
  v39 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v38);
  v7[8] = 0;
  objc_msgSend(v7, "fileItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v7 + 3) = objc_msgSend(v9, "fileSize");

  *((_DWORD *)v7 + 4) = 0;
  *((_DWORD *)v7 + 8) = 0;
  ++*((_DWORD *)v7 + 35);
  v10 = objc_retainAutorelease(v6);
  v11 = objc_msgSend(v10, "fileSystemRepresentation");
  if (!v11)
  {
    RPErrorF();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v42[5];
    v42[5] = (id)v29;

    goto LABEL_17;
  }
  objc_msgSend(v7, "fileItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "fileSize") < 1)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v7, "fileItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileSize");

  }
  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    -[RPFileTransferSession resumeState](self, "resumeState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishedFileWithFileName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "fileName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      FPrintF();

      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_2;
      block[3] = &unk_1E5F4ECF8;
      block[4] = self;
      v37 = v7;
      dispatch_async(dispatchQueue, block);

      goto LABEL_17;
    }
    objc_msgSend(v7, "fileItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filename");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activeFileWithFileName:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_msgSend(v23, "fileOffset");
      v20 = objc_msgSend(v23, "bytesWritten") + v24;
      if (v20)
      {
        objc_msgSend(v10, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v23, "sourceFileItemUsable:", v25);

        if (v33)
        {
          objc_msgSend(v23, "fileName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          FPrintF();

          objc_msgSend(v7, "setFileOffset:", v20, v32, v20);
        }
      }
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }
  v26 = self->_dispatchQueue;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_3;
  v35[3] = &unk_1E5F50460;
  v35[4] = self;
  v35[5] = v20;
  v35[6] = v14;
  dispatch_async(v26, v35);
  v27 = v42;
  obj = v42[5];
  v28 = -[RPFileTransferSession _openReadPath:error:](self, "_openReadPath:error:", v11, &obj);
  objc_storeStrong(v27 + 5, obj);
  if ((v28 & 0x80000000) == 0)
  {
    objc_msgSend(v7, "setFileFD:", v28);
    CC_SHA256_Init((CC_SHA256_CTX *)(v7 + 36));
    -[RPFileTransferSession _largeFileSendTaskNext:xid:](self, "_largeFileSendTaskNext:xid:", v7, *((unsigned int *)v7 + 35));
  }
LABEL_17:
  v8[2](v8);

  _Block_object_dispose(&v41, 8);
}

uint64_t __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  _DWORD **v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 56);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 8) + 40))
  {
    v2 = (_QWORD *)result;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[19];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = (_DWORD **)v2[4], v1 = v2[7], v5))
      {
        LogPrintF();
        v3 = (_DWORD **)v2[4];
        v1 = v2[7];
      }
    }
    return objc_msgSend(v3, "_largeFileSendTaskFailed:error:", v2[6], *(_QWORD *)(*(_QWORD *)(v1 + 8) + 40));
  }
  return result;
}

uint64_t __49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskEnd:error:", *(_QWORD *)(a1 + 40), 0);
}

_QWORD *__49__RPFileTransferSession__largeFileSendTaskStart___block_invoke_3(_QWORD *result)
{
  *(_QWORD *)(result[4] + 304) += result[5];
  *(_QWORD *)(result[4] + 312) += result[6];
  ++*(_QWORD *)(result[4] + 328);
  return result;
}

- (void)_largeFileSendTaskNext:(id)a3 xid:(unsigned int)a4
{
  uint64_t v4;
  char *v6;
  void *v7;
  unint64_t v8;
  unint64_t largeFileBufferBytes;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  int v21;
  CC_SHA256_CTX *c;
  id v23;

  v4 = *(_QWORD *)&a4;
  v6 = (char *)a3;
  v7 = (void *)MEMORY[0x1AF45BCB0]();
  if (*((_DWORD *)v6 + 35) == (_DWORD)v4)
  {
    c = (CC_SHA256_CTX *)(v6 + 36);
    while (1)
    {
      if (v6[8] || *((_DWORD *)v6 + 4) >= self->_prefLargeFileMaxOutstanding)
        goto LABEL_21;
      v8 = *((_QWORD *)v6 + 3);
      if (!v8)
      {
        objc_autoreleasePoolPop(v7);
        v21 = *((_DWORD *)v6 + 8);
        if ((v21 & 2) == 0)
        {
          *((_DWORD *)v6 + 8) = v21 | 2;
          -[RPFileTransferSession _largeFileSendTaskSend:data:end:xid:](self, "_largeFileSendTaskSend:data:end:xid:", v6, 0, 1, v4);
        }
        goto LABEL_22;
      }
      if (v8 >= self->_largeFileBufferBytes)
        largeFileBufferBytes = self->_largeFileBufferBytes;
      else
        largeFileBufferBytes = *((_QWORD *)v6 + 3);
      v10 = objc_msgSend(v6, "fileFD", c);
      v23 = 0;
      -[RPFileTransferSession _readFD:size:error:](self, "_readFD:size:error:", v10, largeFileBufferBytes, &v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v23;
      if (!v11)
      {
        -[RPFileTransferSession _largeFileSendTaskFailed:error:](self, "_largeFileSendTaskFailed:error:", v6, v12);

        goto LABEL_21;
      }
      *((_QWORD *)v6 + 3) -= largeFileBufferBytes;
      v13 = objc_retainAutorelease(v11);
      CC_SHA256_Update(c, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
      v14 = objc_msgSend(v6, "fileOffset");
      if (!v14)
        break;
      v15 = v14;
      objc_msgSend(v6, "fileItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "fileSize");

      v18 = *((_QWORD *)v6 + 3);
      if (v17 - v18 > v15)
      {
        v19 = v17 - v18 - largeFileBufferBytes;
        if (v15 <= v19)
          goto LABEL_15;
        objc_msgSend(v13, "subdataWithRange:", v15 - v19, objc_msgSend(v13, "length") - (v15 - v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPFileTransferSession _largeFileSendTaskSend:data:end:xid:](self, "_largeFileSendTaskSend:data:end:xid:", v6, v20, *((_QWORD *)v6 + 3) == 0, v4);

      }
LABEL_16:

      objc_autoreleasePoolPop(v7);
      v7 = (void *)MEMORY[0x1AF45BCB0]();
      if (*((_DWORD *)v6 + 35) != (_DWORD)v4)
        goto LABEL_21;
    }
    v18 = *((_QWORD *)v6 + 3);
LABEL_15:
    -[RPFileTransferSession _largeFileSendTaskSend:data:end:xid:](self, "_largeFileSendTaskSend:data:end:xid:", v6, v13, v18 == 0, v4);
    goto LABEL_16;
  }
LABEL_21:
  objc_autoreleasePoolPop(v7);
LABEL_22:

}

- (void)_largeFileSendTaskSend:(id)a3 data:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6
{
  _BOOL4 v7;
  char *v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t *p_metricCompressedBytes;
  uint64_t v20;
  unint64_t v21;
  unint64_t *p_metricUncompressedBytes;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *p_metricUncompressibleChunks;
  unint64_t v29;
  unint64_t *p_metricCompressionErrors;
  unint64_t v31;
  int var0;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unsigned int *v48;
  unsigned int v49;
  NSObject *dispatchQueue;
  id v51;
  char *v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  _QWORD block[5];
  id v57;
  id v58;
  id v59;
  unsigned int v60;
  BOOL v61;
  id v62;
  id v63;
  unsigned __int8 md[32];
  uint64_t v65;

  v7 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v10, "taskID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("_i"));

  if (v11)
  {
    if (self->_compressionEnabled)
    {
      v55 = v7;
      v14 = a6;
      v15 = objc_msgSend(v11, "length");
      v63 = 0;
      -[RPFileTransferSession _compressData:error:](self, "_compressData:error:", v11, &v63);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v63;
      v18 = v17;
      p_metricCompressedBytes = &self->_metricCompressedBytes;
      if (v16)
      {
        v20 = objc_msgSend(v16, "length");
        do
          v21 = __ldaxr(p_metricCompressedBytes);
        while (__stlxr(v21 + v20, p_metricCompressedBytes));
        p_metricUncompressedBytes = &self->_metricUncompressedBytes;
        do
          v23 = __ldaxr(p_metricUncompressedBytes);
        while (__stlxr(v23 + v15, p_metricUncompressedBytes));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, &unk_1E5F6A3F0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, &unk_1E5F6A408);

        a6 = v14;
        v7 = v55;
        goto LABEL_23;
      }
      do
        v25 = __ldaxr(p_metricCompressedBytes);
      while (__stlxr(v25 + v15, p_metricCompressedBytes));
      v26 = &self->_metricUncompressedBytes;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 + v15, v26));
      p_metricUncompressibleChunks = &self->_metricUncompressibleChunks;
      a6 = v14;
      do
        v29 = __ldaxr(p_metricUncompressibleChunks);
      while (__stlxr(v29 + 1, p_metricUncompressibleChunks));
      if (v17)
      {
        p_metricCompressionErrors = &self->_metricCompressionErrors;
        do
          v31 = __ldaxr(p_metricCompressionErrors);
        while (__stlxr(v31 + 1, p_metricCompressionErrors));
        var0 = self->_ucat->var0;
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v53 = objc_msgSend(v10, "taskID");
          v54 = v18;
          LogPrintF();
        }
      }

      v7 = v55;
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, &unk_1E5F6A438, v53, v54);
  }
LABEL_23:
  objc_msgSend(v10, "fileItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if ((v10[32] & 1) == 0)
  {
    objc_msgSend(v33, "filename");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, &unk_1E5F6A450);

    v36 = objc_msgSend(v34, "fileSize");
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v37, &unk_1E5F6A468);

    }
    objc_msgSend(v34, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v38, &unk_1E5F6A480);

    v39 = objc_msgSend(v10, "fileOffset");
    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, CFSTR("_fOff"));

    }
    objc_msgSend(v34, "itemURL");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend(v41, "fileSystemRepresentation");

    v62 = 0;
    -[RPFileTransferSession _modTimeForFileWithPath:error:](self, "_modTimeForFileWithPath:error:", v42, &v62);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v62;
    if (v43)
      objc_msgSend(v12, "addEntriesFromDictionary:", v43);
    *((_DWORD *)v10 + 8) |= 1u;

    if (!v7)
    {
      v45 = 1;
      goto LABEL_40;
    }
    v45 = 3;
LABEL_38:
    CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 36));
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
    objc_msgSend(v34, "setSha256HashData:", v46);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v46, CFSTR("_s2"));
    *((_DWORD *)v10 + 8) |= 2u;

LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v47, &unk_1E5F6A498);

    goto LABEL_41;
  }
  if (v7)
  {
    v45 = 2;
    goto LABEL_38;
  }
LABEL_41:
  v48 = (unsigned int *)(v10 + 16);
  do
    v49 = __ldaxr(v48);
  while (__stlxr(v49 + 1, v48));
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke;
  block[3] = &unk_1E5F504D8;
  block[4] = self;
  v57 = v10;
  v58 = v12;
  v59 = v11;
  v61 = v7;
  v60 = a6;
  v51 = v11;
  v52 = v10;
  dispatch_async(dispatchQueue, block);

}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke(uint64_t a1)
{
  id v2;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int *v6;
  unsigned int v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  NSObject *v11;
  int v12;
  char v13;
  _QWORD block[5];
  id v15;
  BOOL v16;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  if (objc_msgSend(v2, "state") == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_3;
    v9[3] = &unk_1E5F504B0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v3 = &v10;
    v4 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v13 = *(_BYTE *)(a1 + 68);
    v11 = *(id *)(a1 + 40);
    v12 = *(_DWORD *)(a1 + 64);
    objc_msgSend(v2, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", CFSTR("_ftLg"), v4, 0, 0, v9);
    v5 = v11;
  }
  else
  {
    v6 = (unsigned int *)(*(_QWORD *)(a1 + 40) + 16);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_2;
    block[3] = &unk_1E5F50488;
    v8 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v3 = &v15;
    v15 = v8;
    v16 = v2 != 0;
    dispatch_async(v5, block);
  }

}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  RPErrorF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_largeFileSendTaskFailed:error:", v2, v3);

}

void __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  id v8;

  v5 = *(void **)(a1 + 40);
  v8 = a4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) += objc_msgSend(v5, "length");
  if (*(_BYTE *)(a1 + 60))
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 336) = 1;
  v6 = (unsigned int *)(*(_QWORD *)(a1 + 48) + 16);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskResponse:error:end:xid:", *(_QWORD *)(a1 + 48), v8, *(unsigned __int8 *)(a1 + 60), *(unsigned int *)(a1 + 56));

}

- (void)_largeFileSendTaskFailed:(id)a3 error:(id)a4
{
  _BYTE *v6;
  id v7;
  NSObject *dispatchQueue;
  _QWORD block[5];
  _BYTE *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (!v6[8])
  {
    v6[8] = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__RPFileTransferSession__largeFileSendTaskFailed_error___block_invoke;
    block[3] = &unk_1E5F4FB10;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(dispatchQueue, block);

  }
}

uint64_t __56__RPFileTransferSession__largeFileSendTaskFailed_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskEnd:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_largeFileSendTaskResponse:(id)a3 error:(id)a4 end:(BOOL)a5 xid:(unsigned int)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  unsigned int v18;
  _QWORD block[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (self->_invalidateCalled)
  {
    if (v11)
    {
      if (!v7)
        goto LABEL_10;
    }
    else
    {
      RPErrorF();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_10:
        objc_msgSend(v10, "queue");
        v15 = objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke;
        v22[3] = &unk_1E5F4FB10;
        v22[4] = self;
        v23 = v10;
        v24 = v12;
        v12 = v12;
        dispatch_async(v15, v22);

        v14 = v23;
LABEL_11:

        goto LABEL_12;
      }
    }
  }
  else if (!v7)
  {
    objc_msgSend(v10, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_3;
      v16[3] = &unk_1E5F50500;
      v16[4] = self;
      v17 = v10;
      v18 = a6;
      dispatch_async(v13, v16);

      goto LABEL_13;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_2;
    block[3] = &unk_1E5F4FB10;
    block[4] = self;
    v20 = v10;
    v21 = v12;
    v12 = v12;
    dispatch_async(v13, block);

    v14 = v20;
    goto LABEL_11;
  }
  -[RPFileTransferSession _largeFileSendTaskEnd:error:](self, "_largeFileSendTaskEnd:error:", v10, v12);
LABEL_12:

LABEL_13:
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskFailed:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskFailed:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__RPFileTransferSession__largeFileSendTaskResponse_error_end_xid___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileSendTaskNext:xid:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (void)_largeFileSendTaskEnd:(id)a3 error:(id)a4
{
  id v6;
  int v7;
  int var0;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _DWORD *v15;

  v15 = a3;
  v6 = a4;
  v7 = v15[3];
  if ((v7 & 0x80000000) == 0)
  {
    if (close(v7) && *__error())
      __error();
    v15[3] = -1;
  }
  if ((-[NSMutableSet containsObject:](self->_largeFileSendTasks, "containsObject:") & 1) != 0)
  {
    if (!self->_invalidateCalled && objc_msgSend(v6, "code") == -71143)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v13 = objc_msgSend(v15, "taskID");
        v14 = v6;
        LogPrintF();
      }
      objc_msgSend(v15, "setNeedsRetry:", 1, v13, v14);
      goto LABEL_29;
    }
    v10 = self->_ucat->var0;
    if (v6)
    {
      if (v10 > 90 || v10 == -1 && !_LogCategory_Initialize())
        goto LABEL_28;
      v13 = objc_msgSend(v15, "taskID");
      v14 = v6;
    }
    else
    {
      if (v10 > 10 || v10 == -1 && !_LogCategory_Initialize())
        goto LABEL_28;
      v13 = objc_msgSend(v15, "taskID");
    }
    LogPrintF();
LABEL_28:
    objc_msgSend(v15, "fileItem", v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _completeItemDirect:error:](self, "_completeItemDirect:error:", v11, v6);

    -[NSMutableSet removeObject:](self->_largeFileSendTasks, "removeObject:", v15);
    -[RPFileTransferSession _processFinish](self, "_processFinish");
    objc_msgSend(v15, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v12);

    -[RPFileTransferSession _scheduleItems](self, "_scheduleItems");
    goto LABEL_29;
  }
  v9 = self->_ucat->var0;
  if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v15, "taskID");
    LogPrintF();
  }
LABEL_29:

}

- (void)_largeFileReceiveRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t Int64;
  id *v13;
  id v14;
  int Int64Ranged;
  NSMutableDictionary *largeFileReceiveTasks;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  int var0;
  RPFileTransferItem *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  RPFileTransferResumeStateItem *v29;
  int v30;
  RPFileTransferLargeFileReceiveTask *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(_QWORD);
  void *v47;
  _QWORD block[6];
  id v49;
  id v50;
  int v51;
  _QWORD v52[6];
  id v53;
  id v54;
  int v55;
  id obj;
  int v57;
  _QWORD v58[6];
  id v59;
  uint64_t *v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v6 = a3;
  v7 = a4;
  NSDictionaryGetNSNumber();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = (id *)&v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__1;
  v65 = __Block_byref_object_dispose__1;
  v66 = 0;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke;
  v58[3] = &unk_1E5F50528;
  v60 = &v61;
  v58[4] = self;
  v58[5] = v8;
  v9 = v7;
  v59 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v58);
  if (!v8 || self->_fileWritesOutstanding >= 0x32)
  {
    RPErrorF();
    v34 = objc_claimAutoreleasedReturnValue();
    v14 = v62[5];
    v62[5] = (id)v34;
    goto LABEL_41;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v57 = 0;
    Int64 = CFDictionaryGetInt64();
    if (!Int64)
    {
      RPErrorF();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v62[5];
      v62[5] = (id)v35;

      v14 = 0;
      goto LABEL_40;
    }
    v13 = v62;
    obj = v62[5];
    -[RPFileTransferSession _decompressData:originalSize:error:](self, "_decompressData:originalSize:error:", v11, Int64, &obj);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13 + 5, obj);
    v47 = v14;
    if (!v14)
      goto LABEL_40;
  }
  else
  {
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  largeFileReceiveTasks = self->_largeFileReceiveTasks;
  if ((Int64Ranged & 1) != 0)
  {
    v46 = v10;
    -[NSMutableDictionary objectForKeyedSubscript:](largeFileReceiveTasks, "objectForKeyedSubscript:", v8);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v39 = v8;
        LogPrintF();
      }
      -[RPFileTransferSession _largeFileReceiveTaskInvalidate:](self, "_largeFileReceiveTaskInvalidate:", v21, v39);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_largeFileReceiveTasks, "setObject:forKeyedSubscript:", 0, v8);
    }
    v44 = v11;
    v45 = v9;
    v23 = objc_alloc_init(RPFileTransferItem);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
      -[RPFileTransferItem setFilename:](v23, "setFilename:", v24);
    v43 = (void *)v24;
    v57 = 0;
    v25 = CFDictionaryGetInt64();
    if (!v57)
      -[RPFileTransferItem setFileSize:](v23, "setFileSize:", v25);
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      -[RPFileTransferItem setMetadata:](v23, "setMetadata:", v26);
    if ((Int64Ranged & 2) != 0)
    {
      CFDictionaryGetCFDataOfLength();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        -[RPFileTransferItem setSha256HashData:](v23, "setSha256HashData:", v27);

    }
    if (-[RPFileTransferSession isResumable](self, "isResumable"))
    {
      -[RPFileTransferSession resumeState](self, "resumeState");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[RPFileTransferResumeStateItem initWithFileTransferRequestDict:]([RPFileTransferResumeStateItem alloc], "initWithFileTransferRequestDict:", v6);
      objc_msgSend(v28, "addActiveFile:", v29);
      objc_msgSend(v28, "scheduleStateFileFlush");

    }
    v30 = self->_ucat->var0;
    if (v30 <= 10 && (v30 != -1 || _LogCategory_Initialize()))
    {
      v40 = v25;
      v41 = objc_msgSend(v26, "count");
      v39 = v8;
      LogPrintF();
    }
    v42 = (void *)v21;
    v31 = objc_alloc_init(RPFileTransferLargeFileReceiveTask);
    -[RPFileTransferLargeFileReceiveTask setFileFD:](v31, "setFileFD:", 0xFFFFFFFFLL);
    -[RPFileTransferLargeFileReceiveTask setFileItem:](v31, "setFileItem:", v23);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferLargeFileReceiveTask setQueue:](v31, "setQueue:", v32);

    -[RPFileTransferLargeFileReceiveTask setTaskID:](v31, "setTaskID:", objc_msgSend(v8, "unsignedLongLongValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_largeFileReceiveTasks, "setObject:forKeyedSubscript:", v31, v8);
    ++self->_fileWritesOutstanding;
    -[RPFileTransferLargeFileReceiveTask queue](v31, "queue");
    v33 = objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_2;
    v52[3] = &unk_1E5F50550;
    v52[4] = self;
    v52[5] = v31;
    v14 = v47;
    v53 = v14;
    v55 = Int64Ranged;
    v9 = v45;
    v54 = v45;
    dispatch_async(v33, v52);

    v10 = v46;
    v11 = v44;
    if ((Int64Ranged & 2) == 0)
      goto LABEL_40;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](largeFileReceiveTasks, "objectForKeyedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      RPErrorF();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v62[5];
      v62[5] = (id)v37;

      v14 = v47;
      goto LABEL_40;
    }
    if ((Int64Ranged & 2) != 0)
    {
      CFDictionaryGetCFDataOfLength();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v17, "fileItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSha256HashData:", v18);

      }
    }
    ++self->_fileWritesOutstanding;
    objc_msgSend(v17, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_3;
    block[3] = &unk_1E5F50550;
    block[4] = self;
    block[5] = v17;
    v14 = v47;
    v49 = v14;
    v51 = Int64Ranged;
    v50 = v9;
    dispatch_async(v20, block);

    if ((Int64Ranged & 2) == 0)
      goto LABEL_40;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_largeFileReceiveTasks, "setObject:forKeyedSubscript:", 0, v8, v39, v40, v41);
  v14 = v47;
LABEL_40:

LABEL_41:
  v10[2](v10);

  _Block_object_dispose(&v61, 8);
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = result;
    v2 = **(_DWORD **)(*(_QWORD *)(result + 32) + 152);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  }
  return result;
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRun:data:sendFlags:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

uint64_t __66__RPFileTransferSession__largeFileReceiveRequest_responseHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRun:data:sendFlags:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_resumeStateReceiveRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    -[RPFileTransferSession resumeState](self, "resumeState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("resumeState");
      v10[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, v7, 0, 0);

}

- (void)_largeFileReceiveTaskRun:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 responseHandler:(id)a6
{
  char *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  off_t v19;
  BOOL v20;
  id v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;
  _BOOL4 v28;
  id v29;
  id v30;
  id *v31;
  id v32;
  id *v33;
  _QWORD *v34;
  NSObject *dispatchQueue;
  id v36;
  char *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _BOOL4 v43;
  id v44;
  id v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD *v52;
  BOOL v53;
  BOOL v54;
  BOOL v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *queue;
  id *v60;
  uint64_t v61;
  id *v62;
  _QWORD v63[5];
  char *v64;
  id v65;
  id v66;
  uint64_t v67;
  unsigned int v68;
  char v69;
  _QWORD v70[5];
  char *v71;
  void *v72;
  id v73;
  id v74;
  unsigned int v75;
  _QWORD v76[5];
  char *v77;
  id v78;
  id v79;
  id v80;
  unsigned int v81;
  id v82;
  _QWORD v83[5];
  char *v84;
  void *v85;
  id v86;
  id v87;
  unsigned int v88;
  _QWORD v89[7];
  _QWORD v90[5];
  char *v91;
  id v92;
  id v93;
  id v94;
  unsigned int v95;
  id v96;
  _QWORD v97[5];
  char *v98;
  id v99;
  id v100;
  id v101;
  unsigned int v102;
  id v103;
  _QWORD block[5];
  char *v105;
  id v106;
  id v107;
  id v108;
  unsigned int v109;
  id v110;
  unsigned __int8 md[8];
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a4;
  v12 = a6;
  if ((a5 & 1) == 0)
    goto LABEL_32;
  objc_msgSend(v10, "fileItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "fileSize") < 1)
  {
    v61 = 0;
  }
  else
  {
    objc_msgSend(v10, "fileItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v14, "fileSize");

  }
  CC_SHA256_Init((CC_SHA256_CTX *)(v10 + 12));
  if (!-[RPFileTransferSession isResumable](self, "isResumable"))
    goto LABEL_11;
  -[RPFileTransferSession resumeState](self, "resumeState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filename");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeFileWithFileName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {

LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  v19 = objc_msgSend(v18, "fileOffset");

  if (v19)
  {
    v110 = 0;
    v20 = -[RPFileTransferSession _largeFileReceiveTaskUpdateSHA256CtxFromFileItem:length:error:](self, "_largeFileReceiveTaskUpdateSHA256CtxFromFileItem:length:error:", v10, v19, &v110);
    v21 = v110;
    v22 = v21;
    if (!v20)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke;
      block[3] = &unk_1E5F4EE88;
      block[4] = self;
      v105 = v10;
      v106 = v22;
      v108 = v12;
      v107 = v11;
      v109 = a5;
      v36 = v22;
      dispatch_async(dispatchQueue, block);

      v37 = v105;
LABEL_52:

      goto LABEL_53;
    }

    v23 = 0;
    goto LABEL_13;
  }
LABEL_12:
  v23 = 1;
LABEL_13:
  v24 = *((_DWORD *)v10 + 2);
  if ((v24 & 0x80000000) == 0)
  {
    if (close(v24) && *__error())
      __error();
    *((_DWORD *)v10 + 2) = -1;
  }
  objc_msgSend(v10, "fileItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  v26 = -[RPFileTransferSession _openWriteFileItem:size:truncate:error:](self, "_openWriteFileItem:size:truncate:error:", v25, objc_msgSend(v11, "length"), v23, &v103);
  v27 = v103;

  if ((v26 & 0x80000000) != 0)
  {
    queue = self->_dispatchQueue;
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_2;
    v97[3] = &unk_1E5F4EE88;
    v97[4] = self;
    v62 = (id *)&v98;
    v98 = v10;
    v60 = &v99;
    v30 = v27;
    v99 = v30;
    v31 = &v101;
    v32 = v12;
    v101 = v12;
    v33 = &v100;
    v100 = v11;
    v102 = a5;
    v34 = v97;
LABEL_29:
    dispatch_async(queue, v34);

    v12 = v32;
    goto LABEL_53;
  }
  objc_msgSend(v10, "setFileFD:", v26);
  if ((v23 & 1) == 0)
  {
    v96 = v27;
    v28 = -[RPFileTransferSession _truncateFD:size:error:](self, "_truncateFD:size:error:", v26, v19, &v96);
    v29 = v96;

    if (v28 && lseek(v26, v19, 0) == -1)
    {
      if (*__error())
        __error();
      RPErrorF();
      v38 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v38;
    }
    if (v29)
    {
      queue = self->_dispatchQueue;
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_3;
      v90[3] = &unk_1E5F4EE88;
      v90[4] = self;
      v62 = (id *)&v91;
      v91 = v10;
      v60 = &v92;
      v30 = v29;
      v92 = v30;
      v31 = &v94;
      v32 = v12;
      v94 = v12;
      v33 = &v93;
      v93 = v11;
      v95 = a5;
      v34 = v90;
      goto LABEL_29;
    }
    v27 = 0;
  }
  v39 = self->_dispatchQueue;
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_4;
  v89[3] = &unk_1E5F50460;
  v89[4] = self;
  v89[5] = v19;
  v89[6] = v61;
  dispatch_async(v39, v89);

LABEL_32:
  if ((*((_DWORD *)v10 + 2) & 0x80000000) != 0)
  {
    RPErrorF();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = self->_dispatchQueue;
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_5;
    v83[3] = &unk_1E5F4EE88;
    v83[4] = self;
    v84 = v10;
    v85 = v47;
    v87 = v12;
    v86 = v11;
    v88 = a5;
    dispatch_async(v48, v83);

    goto LABEL_53;
  }
  v40 = objc_msgSend(v11, "length");
  if (!v40)
    goto LABEL_36;
  v41 = objc_msgSend(v10, "fileFD");
  v42 = objc_retainAutorelease(v11);
  v82 = 0;
  v43 = -[RPFileTransferSession _writeFD:buffer:size:error:](self, "_writeFD:buffer:size:error:", v41, objc_msgSend(v42, "bytes"), v40, &v82);
  v44 = v82;
  if (!v43)
  {
    v58 = self->_dispatchQueue;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_6;
    v76[3] = &unk_1E5F4EE88;
    v76[4] = self;
    v77 = v10;
    v78 = v44;
    v80 = v12;
    v79 = v42;
    v81 = a5;
    v36 = v44;
    dispatch_async(v58, v76);

    v37 = v77;
    goto LABEL_52;
  }
  v45 = objc_retainAutorelease(v42);
  CC_SHA256_Update((CC_SHA256_CTX *)(v10 + 12), (const void *)objc_msgSend(v45, "bytes"), objc_msgSend(v45, "length"));

LABEL_36:
  if ((a5 & 2) != 0)
  {
    CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 12));
    objc_msgSend(v10, "fileItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "sha256HashData");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v50, "length") != 32
      || ((v51 = objc_retainAutorelease(v50), v52 = (_QWORD *)objc_msgSend(v51, "bytes"), *(_QWORD *)md == *v52)
        ? (v53 = v112 == v52[1])
        : (v53 = 0),
          v53 ? (v54 = v113 == v52[2]) : (v54 = 0),
          v54 ? (v55 = v114 == v52[3]) : (v55 = 0),
          !v55))
    {
      RPErrorF();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = self->_dispatchQueue;
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_7;
      v70[3] = &unk_1E5F4EE88;
      v70[4] = self;
      v71 = v10;
      v72 = v56;
      v74 = v12;
      v73 = v11;
      v75 = a5;
      dispatch_async(v57, v70);

      goto LABEL_53;
    }

  }
  v46 = self->_dispatchQueue;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_8;
  v63[3] = &unk_1E5F50578;
  v63[4] = self;
  v67 = v40;
  v68 = a5;
  v69 = (a5 & 2) >> 1;
  v64 = v10;
  v66 = v12;
  v65 = v11;
  dispatch_async(v46, v63);

LABEL_53:
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRespond:error:complete:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLargeFilesTaskResumeState:data:sendFlags:error:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRespond:error:complete:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLargeFilesTaskResumeState:data:sendFlags:error:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRespond:error:complete:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLargeFilesTaskResumeState:data:sendFlags:error:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
}

_QWORD *__81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_4(_QWORD *result)
{
  *(_QWORD *)(result[4] + 304) += result[5];
  *(_QWORD *)(result[4] + 312) += result[6];
  ++*(_QWORD *)(result[4] + 328);
  return result;
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRespond:error:complete:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLargeFilesTaskResumeState:data:sendFlags:error:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRespond:error:complete:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLargeFilesTaskResumeState:data:sendFlags:error:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRespond:error:complete:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLargeFilesTaskResumeState:data:sendFlags:error:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) += *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(a1 + 72) & 2) != 0)
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 336) = 1;
  if (*(_BYTE *)(a1 + 76))
  {
    objc_msgSend(*(id *)(a1 + 40), "fileItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "isResumable"))
    {
      objc_msgSend(*(id *)(a1 + 32), "resumeState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fileItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "filename");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "activeFileWithFileName:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        v7 = objc_msgSend(v6, "fileOffset");
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }
    v9 = objc_msgSend(v2, "fileSize");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536) += v9 - v7 + objc_msgSend(v2, "metadataSize");
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) = mach_absolute_time();

    v8 = *(_BYTE *)(a1 + 76) != 0;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_largeFileReceiveTaskRespond:error:complete:responseHandler:", *(_QWORD *)(a1 + 40), 0, v8, *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_updateLargeFilesTaskResumeState:data:sendFlags:error:complete:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 72), 0, *(unsigned __int8 *)(a1 + 76));
}

- (BOOL)_largeFileReceiveTaskUpdateSHA256CtxFromFileItem:(id)a3 length:(unint64_t)a4 error:(id *)a5
{
  char *v7;
  void *v8;
  int v9;
  id v10;
  unint64_t v11;
  unint64_t largeFileBufferBytes;
  unint64_t v13;
  unint64_t v14;
  CC_SHA256_CTX *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id *v22;
  char *v23;
  void (**v24)(_QWORD);
  unsigned int v25;
  RPFileTransferSession *v26;
  id v27;
  _QWORD v28[4];
  int v29;
  id v30;

  v22 = a5;
  v7 = (char *)a3;
  objc_msgSend(v7, "fileItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v9 = -[RPFileTransferSession _openReadFileItem:error:](self, "_openReadFileItem:error:", v8, &v30);
  v10 = v30;

  if (v9 < 0)
  {
    if (v22)
    {
      v10 = objc_retainAutorelease(v10);
      v16 = 0;
      *v22 = v10;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __87__RPFileTransferSession__largeFileReceiveTaskUpdateSHA256CtxFromFileItem_length_error___block_invoke;
    v28[3] = &__block_descriptor_36_e5_v8__0l;
    v25 = v9;
    v29 = v9;
    v23 = v7;
    v24 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v28);
    v11 = 0;
    v26 = self;
    largeFileBufferBytes = self->_largeFileBufferBytes;
    v13 = a4;
    if (largeFileBufferBytes >= a4)
      v14 = a4;
    else
      v14 = largeFileBufferBytes;
    v15 = (CC_SHA256_CTX *)(v7 + 12);
    while (1)
    {
      v16 = v13 <= v11;
      if (v13 <= v11)
        break;
      v17 = (void *)MEMORY[0x1AF45BCB0]();
      if (v14 >= v13 - v11)
        v14 = v13 - v11;
      v27 = v10;
      -[RPFileTransferSession _readFD:size:error:](v26, "_readFD:size:error:", v25, v14, &v27, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v27;

      if (v18)
      {
        v19 = objc_retainAutorelease(v18);
        CC_SHA256_Update(v15, (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
        v11 += v14;
      }
      else if (v22)
      {
        *v22 = objc_retainAutorelease(v20);
      }

      objc_autoreleasePoolPop(v17);
      v10 = v20;
      if (!v18)
        goto LABEL_16;
    }
    v20 = v10;
LABEL_16:
    v24[2](v24);

    v10 = v20;
    v7 = v23;
  }

  return v16;
}

uint64_t __87__RPFileTransferSession__largeFileReceiveTaskUpdateSHA256CtxFromFileItem_length_error___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_largeFileReceiveTaskRespond:(id)a3 error:(id)a4 complete:(BOOL)a5 responseHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  int var0;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v7 = a5;
  v19 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v11;
  if (v7)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 10)
    {
      v14 = v19;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_11;
        v14 = v19;
      }
      v17 = objc_msgSend(v14, "taskID");
      LogPrintF();
    }
LABEL_11:
    objc_msgSend(v19, "fileItem", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _processReceivedItem:responseHandler:](self, "_processReceivedItem:responseHandler:", v16, v12);

LABEL_14:
    -[RPFileTransferSession _largeFileReceiveTaskInvalidate:](self, "_largeFileReceiveTaskInvalidate:", v19, v17, v18);
    goto LABEL_15;
  }
  if (v10)
  {
    v15 = self->_ucat->var0;
    if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
    {
      v17 = objc_msgSend(v19, "taskID");
      v18 = v10;
      LogPrintF();
    }
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v12)[2](v12, 0, 0, v10);
    goto LABEL_14;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AA70], 0, 0);
LABEL_15:
  --self->_fileWritesOutstanding;

}

- (void)_largeFileReceiveTaskInvalidate:(id)a3
{
  int v4;
  uint64_t v5;
  int var0;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "fileFD");
  if ((v4 & 0x80000000) == 0)
  {
    if (!close(v4))
    {
LABEL_11:
      objc_msgSend(v11, "setFileFD:", 0xFFFFFFFFLL, v8, v10);
      goto LABEL_12;
    }
    if (*__error())
    {
      v5 = *__error();
      if (!(_DWORD)v5)
        goto LABEL_11;
    }
    else
    {
      v5 = 4294960596;
    }
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_11;
    v9 = objc_msgSend(v11, "taskID");
    LogPrintF();
    objc_msgSend(v11, "setFileFD:", 0xFFFFFFFFLL, v9, v5);
  }
LABEL_12:
  objc_msgSend(v11, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v7);

}

- (void)_updateLargeFilesTaskResumeState:(id)a3 data:(id)a4 sendFlags:(unsigned int)a5 error:(id)a6 complete:(BOOL)a7
{
  char v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a5;
  v17 = a3;
  v11 = a4;
  v12 = a6;
  if (-[RPFileTransferSession isResumable](self, "isResumable"))
  {
    -[RPFileTransferSession resumeState](self, "resumeState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeFileWithFileName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
LABEL_13:

      goto LABEL_14;
    }
    if (v12)
    {
      if (objc_msgSend(v12, "code") == -71143
        || objc_msgSend(v12, "code") == -6753
        || objc_msgSend(v12, "code") == -6722)
      {
        objc_msgSend(v16, "setBytesWritten:", objc_msgSend(v16, "bytesWritten") + objc_msgSend(v11, "length"));
LABEL_12:
        objc_msgSend(v13, "scheduleStateFileFlush");
        goto LABEL_13;
      }
      objc_msgSend(v16, "setError:", v12);
    }
    else
    {
      objc_msgSend(v16, "setBytesWritten:", objc_msgSend(v16, "bytesWritten") + objc_msgSend(v11, "length"));
      if ((v8 & 2) == 0)
        goto LABEL_12;
    }
    objc_msgSend(v13, "removeActiveFile:", v16);
    objc_msgSend(v13, "addFinishedFile:", v16);
    goto LABEL_12;
  }
LABEL_14:

}

- (id)_compressData:(id)a3 error:(id *)a4
{
  id v5;
  size_t v6;
  void (**v7)(_QWORD);
  size_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v18 = malloc_type_malloc(v6, 0xD5B2B35DuLL);
  if (v16[3])
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__RPFileTransferSession__compressData_error___block_invoke;
    v14[3] = &unk_1E5F505A0;
    v14[4] = &v15;
    v7 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v14);
    v8 = compression_encode_buffer((uint8_t *)v16[3], v6, (const uint8_t *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v6, 0, COMPRESSION_LZ4);
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D50]);
      v10 = (void *)objc_msgSend(v9, "initWithBytesNoCopy:length:freeWhenDone:", v16[3], v8, 1);
      v11 = v10;
      if (v10)
      {
        v16[3] = 0;
        v12 = v10;
      }
      else if (a4)
      {
        RPErrorF();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v11 = 0;
      if (a4)
        *a4 = 0;
    }
    v7[2](v7);

  }
  else if (a4)
  {
    RPErrorF();
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __45__RPFileTransferSession__compressData_error___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v1)
    free(v1);
}

- (id)_decompressData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void (**v8)(_QWORD);
  uint8_t *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  v7 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v20 = malloc_type_malloc(a4, 0xD5C9BB85uLL);
  if (v18[3])
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__RPFileTransferSession__decompressData_originalSize_error___block_invoke;
    v16[3] = &unk_1E5F505A0;
    v16[4] = &v17;
    v8 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v16);
    v9 = (uint8_t *)v18[3];
    v10 = objc_retainAutorelease(v7);
    if (compression_decode_buffer(v9, a4, (const uint8_t *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, COMPRESSION_LZ4) == a4)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D50]);
      v12 = (void *)objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", v18[3], a4, 1);
      v13 = v12;
      if (v12)
      {
        v18[3] = 0;
        v14 = v12;
      }
      else if (a5)
      {
        RPErrorF();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (a5)
    {
      RPErrorF();
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v8[2](v8);

  }
  else if (a5)
  {
    RPErrorF();
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __60__RPFileTransferSession__decompressData_originalSize_error___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v1)
    free(v1);
}

- (id)_encodeAndCompressObject:(id)a3 originalSize:(unint64_t *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  int v15;

  v15 = 0;
  v8 = (void *)MEMORY[0x1AF45B698](a3, 0, &v15);
  v9 = v8;
  if (!v8)
  {
    if (a5)
      goto LABEL_10;
    goto LABEL_11;
  }
  v10 = objc_msgSend(v8, "length");
  if (!v10)
  {
    if (a5)
    {
LABEL_10:
      RPErrorF();
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_6;
  }
  *a4 = v10;
  -[RPFileTransferSession _compressData:error:](self, "_compressData:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11;

LABEL_6:
  return v12;
}

- (id)_decompressAndDecodeData:(id)a3 originalSize:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[RPFileTransferSession _decompressData:originalSize:error:](self, "_decompressData:originalSize:error:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)OPACKDecodeData();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else if (a5)
    {
      RPErrorF();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_ioQueueDequeue
{
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  NSObject *v7;
  int var0;
  NSString *targetID;
  uint64_t v11;

  -[NSMutableArray popFirstObject](self->_ioQueues, "popFirstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = self->_metricTotalIOQueues + 1;
    self->_metricTotalIOQueues = v4;
    targetID = self->_targetID;
    v11 = v4;
    NSPrintF();
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String", targetID, v11);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create(v6, v7);

    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  return v3;
}

- (void)_ioQueueEnqueue:(id)a3
{
  -[NSMutableArray addObject:](self->_ioQueues, "addObject:", a3);
}

- (int)_openReadFileItem:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  int v13;
  unint64_t *p_fileIDLastReceive;
  unint64_t v15;
  void *v16;

  v6 = a3;
  v7 = self->_receiveFileParentPath;
  if (v7)
  {
    objc_msgSend(v6, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSString stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByStandardizingPath");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[NSString stringByStandardizingPath](v7, "stringByStandardizingPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "hasPrefix:", v11);

      if ((v12 & 1) == 0)
      {
        if (a4)
        {
          RPErrorF();
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = -1;
        goto LABEL_11;
      }
    }
    else
    {
      p_fileIDLastReceive = &self->_fileIDLastReceive;
      do
        v15 = __ldaxr(p_fileIDLastReceive);
      while (__stlxr(v15 + 1, p_fileIDLastReceive));
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%llu.rpftf"), v7, v15 + 1);
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v10, 0);
    objc_msgSend(v6, "setItemURL:", v16);

    v10 = objc_retainAutorelease(v10);
    v13 = -[RPFileTransferSession _openReadPath:error:](self, "_openReadPath:error:", objc_msgSend(v10, "fileSystemRepresentation"), a4);
LABEL_11:

    goto LABEL_12;
  }
  if (a4)
  {
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = -1;
LABEL_12:

  return v13;
}

- (int)_openReadPath:(const char *)a3 error:(id *)a4
{
  int v6;
  uint64_t v7;
  int var0;
  int v9;
  uint64_t v11;

  v6 = open(a3, 0);
  if ((v6 & 0x80000000) == 0 || *__error() && !*__error())
  {
    if (fcntl(v6, 48, 1))
    {
      if (*__error())
      {
        v7 = *__error();
        if (!(_DWORD)v7)
          goto LABEL_16;
      }
      else
      {
        v7 = 4294960596;
      }
      var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v11 = v7;
        LogPrintF();
      }
    }
LABEL_16:
    if (fcntl(v6, 45, 1, v11) && (!*__error() || *__error()))
    {
      v9 = self->_ucat->var0;
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    return v6;
  }
  if (a4)
  {
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return -1;
}

- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 error:(id *)a5
{
  return -[RPFileTransferSession _openWriteFileItem:size:truncate:error:](self, "_openWriteFileItem:size:truncate:error:", a3, a4, 0, a5);
}

- (int)_openWriteFileItem:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  unint64_t *p_fileIDLastReceive;
  unint64_t v19;
  void *v20;

  v7 = a5;
  v10 = a3;
  v11 = self->_receiveFileParentPath;
  if (v11)
  {
    objc_msgSend(v10, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSString stringByAppendingPathComponent:](v11, "stringByAppendingPathComponent:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByStandardizingPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSString stringByStandardizingPath](v11, "stringByStandardizingPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "hasPrefix:", v15);

      if ((v16 & 1) == 0)
      {
        if (a6)
        {
          RPErrorF();
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = -1;
        goto LABEL_11;
      }
    }
    else
    {
      p_fileIDLastReceive = &self->_fileIDLastReceive;
      do
        v19 = __ldaxr(p_fileIDLastReceive);
      while (__stlxr(v19 + 1, p_fileIDLastReceive));
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%llu.rpftf"), v11, v19 + 1);
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v14, 0);
    objc_msgSend(v10, "setItemURL:", v20);

    v17 = -[RPFileTransferSession _openWritePath:size:truncate:error:](self, "_openWritePath:size:truncate:error:", v14, a4, v7, a6);
LABEL_11:

    goto LABEL_12;
  }
  if (a6)
  {
    RPErrorF();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = -1;
LABEL_12:

  return v17;
}

- (int)_openWritePath:(id)a3 size:(int64_t)a4 error:(id *)a5
{
  return -[RPFileTransferSession _openWritePath:size:truncate:error:](self, "_openWritePath:size:truncate:error:", a3, a4, 0, a5);
}

- (int)_openWritePath:(id)a3 size:(int64_t)a4 truncate:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  const char *v11;
  const char *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  int var0;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;

  v7 = a5;
  v10 = objc_retainAutorelease(a3);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  if (!v11)
  {
    if (!a6)
      goto LABEL_13;
    goto LABEL_12;
  }
  v12 = v11;
  if (v7)
    v13 = open(v11, 1537, 384);
  else
    v13 = open(v11, 513, 384);
  v14 = v13;
  if (v13 < 0)
  {
    if (*__error())
    {
      v15 = *__error();
      if (v15 == 2)
      {
        objc_msgSend(v10, "stringByDeletingLastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v29);
        v19 = v29;

        if ((v18 & 1) == 0)
        {
          if (a6)
          {
            RPNestedErrorF();
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_13;
        }
        v14 = open(v12, 1537, 384);
        if (v14 < 0)
        {
          if (*__error())
            v15 = *__error();
          else
            v15 = -6700;
        }
        else
        {
          v15 = 0;
        }

      }
      if (!v15)
        goto LABEL_19;
    }
    if (!a6)
    {
LABEL_13:
      v14 = -1;
      goto LABEL_45;
    }
LABEL_12:
    RPErrorF();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_19:
  if (a4 < 1)
    goto LABEL_45;
  if (fcntl(v14, 48, 1))
  {
    if (*__error())
    {
      v20 = *__error();
      if (!(_DWORD)v20)
        goto LABEL_29;
    }
    else
    {
      v20 = 4294960596;
    }
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v26 = v20;
      LogPrintF();
    }
  }
LABEL_29:
  if (fcntl(v14, 76, 1, v26))
  {
    if (*__error())
    {
      v22 = *__error();
      if (!(_DWORD)v22)
        goto LABEL_38;
    }
    else
    {
      v22 = 4294960596;
    }
    v23 = self->_ucat->var0;
    if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
    {
      v27 = v22;
      LogPrintF();
    }
  }
LABEL_38:
  v28[2] = a4;
  v28[3] = 0;
  v28[0] = 0x300000002;
  v28[1] = 0;
  if (fcntl(v14, 42, v28, v27) && (!*__error() || *__error()))
  {
    v24 = self->_ucat->var0;
    if (v24 <= 90 && (v24 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_45:

  return v14;
}

- (id)_readPath:(const char *)a3 size:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8;
  int v9;
  void *v10;

  if (a4)
  {
    v8 = -[RPFileTransferSession _openReadPath:error:](self, "_openReadPath:error:", a3, a5);
    if ((v8 & 0x80000000) != 0)
    {
      v10 = 0;
    }
    else
    {
      v9 = v8;
      -[RPFileTransferSession _readFD:size:error:](self, "_readFD:size:error:", v8, a4, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      close(v9);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data", a3, 0, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)_readFD:(int)a3 size:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v7 = *(_QWORD *)&a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v19 = malloc_type_malloc(a4, 0x825A35FFuLL);
  if (v17[3])
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__RPFileTransferSession__readFD_size_error___block_invoke;
    v15[3] = &unk_1E5F505A0;
    v15[4] = &v16;
    v9 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v15);
    if (-[RPFileTransferSession _readFD:buffer:size:error:](self, "_readFD:buffer:size:error:", v7, v17[3], a4, a5))
    {
      v10 = objc_alloc(MEMORY[0x1E0C99D50]);
      v11 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:freeWhenDone:", v17[3], a4, 1);
      v12 = v11;
      if (v11)
      {
        v17[3] = 0;
        v13 = v11;
      }
      else if (a5)
      {
        RPErrorF();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v12 = 0;
    }
    v9[2](v9);

  }
  else if (a5)
  {
    RPErrorF();
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v12;
}

void __44__RPFileTransferSession__readFD_size_error___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v1)
    free(v1);
}

- (BOOL)_readFD:(int)a3 buffer:(char *)a4 size:(unint64_t)a5 error:(id *)a6
{
  size_t v7;
  ssize_t v10;
  BOOL result;
  id v12;

  if (!a5)
    return 1;
  v7 = a5;
  while (1)
  {
    v10 = read(a3, a4, v7);
    if (v10 >= 1)
    {
      a4 += v10;
      v7 -= v10;
      goto LABEL_8;
    }
    if (!v10)
    {
      if (a6)
        goto LABEL_14;
      return 0;
    }
    if (!*__error() || *__error() != 4)
      break;
LABEL_8:
    if (!v7)
      return 1;
  }
  if (a6)
  {
LABEL_14:
    RPErrorF();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a6 = v12;
    return result;
  }
  return 0;
}

- (BOOL)_writeFD:(int)a3 buffer:(const char *)a4 size:(unint64_t)a5 error:(id *)a6
{
  size_t v7;
  ssize_t v10;
  BOOL result;
  id v12;

  if (!a5)
    return 1;
  v7 = a5;
  while (1)
  {
    v10 = write(a3, a4, v7);
    if (v10 < 1)
      break;
    a4 += v10;
    v7 -= v10;
LABEL_7:
    if (!v7)
      return 1;
  }
  if (*__error() && *__error() == 4)
    goto LABEL_7;
  if (!a6)
    return 0;
  RPErrorF();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a6 = v12;
  return result;
}

- (BOOL)_truncateFD:(int)a3 size:(int64_t)a4 error:(id *)a5
{
  int v6;

  v6 = ftruncate(a3, a4);
  if (v6)
  {
    if (!*__error())
    {
      if (!a5)
        return v6 == 0;
      goto LABEL_4;
    }
    __error();
    if (a5)
    {
LABEL_4:
      RPErrorF();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 == 0;
}

- (id)_modTimeForFileWithPath:(const char *)a3 error:(id *)a4
{
  uint64_t tv_nsec;
  void *v6;
  void *v7;
  void *v8;
  stat v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    memset(&v10, 0, sizeof(v10));
    if (!stat(a3, &v10) || *__error() && !*__error())
    {
      tv_nsec = v10.st_mtimespec.tv_nsec;
      v11[0] = CFSTR("_fMt");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v10.st_mtimespec.tv_sec);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = CFSTR("_fMtNs");
      v12[0] = v6;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", tv_nsec);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    if (a4)
      goto LABEL_7;
  }
  else if (a4)
  {
LABEL_7:
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  return 0;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (unint64_t)debugFlags
{
  return self->_debugFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (id)flowControlChangedHandler
{
  return self->_flowControlChangedHandler;
}

- (void)setFlowControlChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (int)flowControlState
{
  return self->_flowControlState;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)largeFileBufferBytes
{
  return self->_largeFileBufferBytes;
}

- (unint64_t)maxLargeFileTasks
{
  return self->_maxLargeFileTasks;
}

- (unint64_t)maxSmallFileTasks
{
  return self->_maxSmallFileTasks;
}

- (NSData)peerPublicKey
{
  return self->_peerPublicKey;
}

- (void)setPeerPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (RPFileTransferProgress)progressCurrent
{
  return self->_progressCurrent;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (double)progressHandlerTimeInterval
{
  return self->_progressHandlerTimeInterval;
}

- (void)setProgressHandlerTimeInterval:(double)a3
{
  self->_progressHandlerTimeInterval = a3;
}

- (id)receivedItemHandler
{
  return self->_receivedItemHandler;
}

- (void)setReceivedItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (id)receivedItemsHandler
{
  return self->_receivedItemsHandler;
}

- (void)setReceivedItemsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (NSData)selfPublicKey
{
  return self->_selfPublicKey;
}

- (void)setSelfPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (NSData)selfSecretKey
{
  return self->_selfSecretKey;
}

- (void)setSelfSecretKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfSecretKey, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_targetID, 0);
  objc_storeStrong((id *)&self->_selfPublicKey, 0);
  objc_storeStrong(&self->_receivedItemsHandler, 0);
  objc_storeStrong(&self->_receivedItemHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_progressCurrent, 0);
  objc_storeStrong((id *)&self->_peerPublicKey, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_flowControlChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_resumeState, 0);
  objc_storeStrong((id *)&self->_largeFileSendTasks, 0);
  objc_storeStrong((id *)&self->_largeFileReceiveTasks, 0);
  objc_storeStrong((id *)&self->_smallFilesSendTasks, 0);
  objc_storeStrong((id *)&self->_smallFilesReceiveTasks, 0);
  objc_storeStrong((id *)&self->_receiveFileParentPath, 0);
  objc_storeStrong((id *)&self->_ioQueues, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_selfIdentity, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_peerIdentity, 0);
  objc_storeStrong((id *)&self->_controlRetryTimer, 0);
  objc_storeStrong((id *)&self->_controlCnx, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_bonjourDevice, 0);
  objc_storeStrong((id *)&self->_bonjourCoalescer, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

@end
