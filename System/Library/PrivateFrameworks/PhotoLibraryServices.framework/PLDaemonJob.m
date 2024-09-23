@implementation PLDaemonJob

- (PLDaemonJob)init
{
  return -[PLDaemonJob initWithAssetsdClient:](self, "initWithAssetsdClient:", 0);
}

- (PLDaemonJob)initWithAssetsdClient:(id)a3
{
  id v4;
  PLDaemonJob *v5;
  PLAssetsdClient *v6;
  void *assetsdClient;
  uint64_t v8;
  PLAssetsdClient *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLDaemonJob;
  v5 = -[PLDaemonJob init](&v11, sel_init);
  if (v5 && (PLIsAssetsd() & 1) == 0)
  {
    if (v4)
    {
      v6 = (PLAssetsdClient *)v4;
      assetsdClient = v5->_assetsdClient;
      v5->_assetsdClient = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
      assetsdClient = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", assetsdClient);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_assetsdClient;
      v5->_assetsdClient = (PLAssetsdClient *)v8;

    }
  }

  return v5;
}

- (OS_xpc_object)xpcReply
{
  return self->_xpcReply;
}

- (void)setXpcReply:(id)a3
{
  objc_storeStrong((id *)&self->_xpcReply, a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[PLDaemonJob daemonOperation](self, "daemonOperation");
  v6 = -[PLDaemonJob daemonOperation](self, "daemonOperation");
  if (v6 > 0x12)
    v7 = CFSTR("ERR");
  else
    v7 = off_1E366E370[v6];
  v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%ld:%@]"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (PLAssetsdClient)assetsdClient
{
  return self->_assetsdClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_xpcReply, 0);
}

- (int64_t)daemonOperation
{
  return 0;
}

- (BOOL)shouldRunOnDaemonSerialQueue
{
  return 1;
}

- (void)setLibraryServicesManager:(id)a3
{
  objc_storeStrong((id *)&self->_libraryServicesManager, a3);
}

- (PLLibraryServicesManager)libraryServicesManager
{
  PLLibraryServicesManager *libraryServicesManager;
  void *v6;

  libraryServicesManager = self->_libraryServicesManager;
  if (!libraryServicesManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDaemonJob.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_libraryServicesManager"));

    libraryServicesManager = self->_libraryServicesManager;
  }
  return libraryServicesManager;
}

- (void)sendToAssetsd
{
  id v3;

  -[PLDaemonJob assetsdClient](self, "assetsdClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendDaemonJob:shouldRunSerially:replyHandler:", self, -[PLDaemonJob shouldRunOnDaemonSerialQueue](self, "shouldRunOnDaemonSerialQueue"), 0);

}

- (void)sendToAssetsdWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PLDaemonJob assetsdClient](self, "assetsdClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLDaemonJob shouldRunOnDaemonSerialQueue](self, "shouldRunOnDaemonSerialQueue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PLDaemonJob_DaemonCommunication__sendToAssetsdWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E366E350;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "sendDaemonJob:shouldRunSerially:replyHandler:", self, v6, v8);

}

- (void)runDaemonSide
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PLDaemonJobReply *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t signpostId;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[PLDaemonJob xpcReply](self, "xpcReply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLDaemonJobsGetLog();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    -[PLDaemonJob replyHandler](self, "replyHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PLDaemonJob xpcReply](self, "xpcReply");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[PLDaemonJobReply initWithReply:]([PLDaemonJobReply alloc], "initWithReply:", v7);
        (*(void (**)(uint64_t, _QWORD, PLDaemonJobReply *))(v6 + 16))(v6, 0, v8);
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB2D50];
        v20[0] = CFSTR("No reply created.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PLDaemonJob"), -1, v12);
        v8 = (PLDaemonJobReply *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(uint64_t, PLDaemonJobReply *, _QWORD))(v6 + 16))(v6, v8, 0);
      }

    }
    v13 = v5;
    v14 = v13;
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      objc_msgSend(v3, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, signpostId, "DaemonJob", "reply: %@", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    v9 = v4;
    v6 = (uint64_t)v9;
    v10 = self->_signpostId;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, (os_log_t)v6, OS_SIGNPOST_INTERVAL_END, v10, "DaemonJob", ", (uint8_t *)&v17, 2u);
    }
  }

}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PLDaemonJob *v9;
  int64_t int64;
  PLXPCTransaction *v11;
  PLXPCTransaction *transaction;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t signpostId;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  int64_t v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
LABEL_12:

    self = 0;
    goto LABEL_13;
  }
  v24.receiver = self;
  v24.super_class = (Class)PLDaemonJob;
  v9 = -[PLDaemonJob init](&v24, sel_init);
  self = v9;
  if (!v9)
    goto LABEL_13;
  objc_storeStrong((id *)&v9->_libraryServicesManager, a4);
  int64 = xpc_dictionary_get_int64(v6, "operation");
  if (int64 != -[PLDaemonJob daemonOperation](self, "daemonOperation"))
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      v22 = -[PLDaemonJob daemonOperation](self, "daemonOperation");
      *(_DWORD *)buf = 138412802;
      v26 = v20;
      v27 = 2048;
      v28 = v22;
      v29 = 2048;
      v30 = int64;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Daemon operation invalid for %@. Expected %lld, got %lld", buf, 0x20u);

    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLDaemonJob(DaemonCommunication) initFromXPCObject:libraryServicesManager:]");
  v11 = (PLXPCTransaction *)objc_claimAutoreleasedReturnValue();
  transaction = self->_transaction;
  self->_transaction = v11;

  PLDaemonJobsGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  self->_signpostId = os_signpost_id_generate(v13);
  v14 = v13;
  v15 = v14;
  signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v26 = v17;
    v27 = 2048;
    v28 = int64;
    v18 = v17;
    _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "DaemonJob", "jobClass: %@, op: %lld", buf, 0x16u);

  }
LABEL_13:

  return self;
}

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;

  v4 = a3;
  xpc_dictionary_set_int64(v4, "operation", -[PLDaemonJob daemonOperation](self, "daemonOperation"));
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v4, "daemonJobClass", (const char *)objc_msgSend(v6, "UTF8String"));

}

- (id)newDictionaryReplyForObject:(id)a3
{
  id result;

  result = xpc_dictionary_create_reply(a3);
  if (!result)
    return xpc_dictionary_create(0, 0, 0);
  return result;
}

- (PLDaemonJob)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  PLDaemonJob *v12;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  v5 = v4;
  objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("PL.job"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringFromXPCDictionary();
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (v9 = NSClassFromString(v7),
        -[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class())))
  {
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (PLDaemonJob *)objc_msgSend([v9 alloc], "initFromXPCObject:libraryServicesManager:", v6, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  v5 = xpc_dictionary_create(0, 0, 0);
  -[PLDaemonJob encodeToXPCObject:](self, "encodeToXPCObject:", v5);
  objc_msgSend(v4, "encodeXPCObject:forKey:", v5, CFSTR("PL.job"));

  if (-[PLDaemonJob shouldArchiveXPCToDisk](self, "shouldArchiveXPCToDisk"))
    -[PLDaemonJob archiveXPCToDisk:](self, "archiveXPCToDisk:", v5);

}

- (BOOL)shouldArchiveXPCToDisk
{
  return 0;
}

- (id)replyHandler
{
  return (id)MEMORY[0x19AEC174C](self->_replyHandler, a2);
}

- (void)setReplyHandler:(id)a3
{
  void *v4;
  id replyHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  replyHandler = self->_replyHandler;
  self->_replyHandler = v4;

}

uint64_t __71__PLDaemonJob_DaemonCommunication__sendToAssetsdWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 != 0, a2);
  return result;
}

+ (void)runDaemonSideWithXPCEvent:(id)a3 libraryServicesManager:(id)a4
{
  id v5;
  NSString *v6;
  NSString *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  PLStringFromXPCDictionary();
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (v8 = NSClassFromString(v6),
        -[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class())))
  {
    v9 = (void *)objc_msgSend([v8 alloc], "initFromXPCObject:libraryServicesManager:", v10, v5);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "runDaemonSide");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
