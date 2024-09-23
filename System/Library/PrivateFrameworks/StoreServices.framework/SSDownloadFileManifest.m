@implementation SSDownloadFileManifest

- (SSDownloadFileManifest)init
{
  return -[SSDownloadFileManifest initWithManifestType:](self, "initWithManifestType:", 0);
}

- (SSDownloadFileManifest)initWithManifestType:(int64_t)a3
{
  SSDownloadFileManifest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadFileManifest;
  v4 = -[SSDownloadFileManifest init](&v6, sel_init);
  if (v4)
  {
    v4->_connection = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v4->_manifestType = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadFileManifest;
  -[SSDownloadFileManifest dealloc](&v3, sel_dealloc);
}

- (void)getPathsForFilesWithClass:(int64_t)a3 completionBlock:(id)a4
{
  id v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSXPCConnection *connection;
  uint64_t v22;
  _QWORD v23[5];
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v7)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      v24 = 136446210;
      v25 = "-[SSDownloadFileManifest getPathsForFilesWithClass:completionBlock:]";
      LODWORD(v22) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v22);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 46);
  xpc_dictionary_set_int64(v20, "1", self->_manifestType);
  xpc_dictionary_set_int64(v20, "2", a3);
  connection = self->_connection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__SSDownloadFileManifest_getPathsForFilesWithClass_completionBlock___block_invoke;
  v23[3] = &unk_1E47B8FA0;
  v23[4] = a4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v23);
  xpc_release(v20);
}

void __68__SSDownloadFileManifest_getPathsForFilesWithClass_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  CFArrayRef v5;
  CFArrayRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    {
      objc_opt_class();
      v5 = SSXPCDictionaryCopyCFObjectWithClass(a2, "0");
      objc_opt_class();
      v6 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
      if (-[__CFArray length](v5, "length"))
      {
        if (-[__CFArray count](v6, "count"))
        {
          v13 = 0u;
          v14 = 0u;
          v11 = 0u;
          v12 = 0u;
          v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v12;
            do
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v12 != v9)
                  objc_enumerationMutation(v6);
                objc_msgSend(v4, "addObject:", -[__CFArray stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++)));
              }
              while (v8 != v10);
              v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
            }
            while (v8);
          }
        }
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (int64_t)manifestType
{
  return self->_manifestType;
}

- (void)rebuildManifestWithCompletionBlock:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t v18;
  SSXPCConnection *connection;
  uint64_t v20;
  _QWORD v21[5];
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v22 = 136446210;
      v23 = "-[SSDownloadFileManifest rebuildManifestWithCompletionBlock:]";
      LODWORD(v20) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v22, v20);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 47);
  xpc_dictionary_set_int64(v18, "1", self->_manifestType);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__SSDownloadFileManifest_rebuildManifestWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E47B8FA0;
  v21[4] = a3;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v18, v21);
  xpc_release(v18);
}

uint64_t __61__SSDownloadFileManifest_rebuildManifestWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeItemWithAssetPath:(id)a3 completionBlock:(id)a4
{
  void *v6;
  _QWORD v7[5];

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a3, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SSDownloadFileManifest_removeItemWithAssetPath_completionBlock___block_invoke;
  v7[3] = &unk_1E47BD7D0;
  v7[4] = a4;
  -[SSDownloadFileManifest _removeItemsWithAssetPaths:completionBlock:](self, "_removeItemsWithAssetPaths:completionBlock:", v6, v7);

}

uint64_t __66__SSDownloadFileManifest_removeItemWithAssetPath_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeItemsWithAssetPaths:(id)a3 completionBlock:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SSDownloadFileManifest_removeItemsWithAssetPaths_completionBlock___block_invoke;
  v4[3] = &unk_1E47BD7D0;
  v4[4] = a4;
  -[SSDownloadFileManifest _removeItemsWithAssetPaths:completionBlock:](self, "_removeItemsWithAssetPaths:completionBlock:", a3, v4);
}

uint64_t __68__SSDownloadFileManifest_removeItemsWithAssetPaths_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)_removeItemsWithAssetPaths:(id)a3 completionBlock:(id)a4
{
  id v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSXPCConnection *connection;
  uint64_t v22;
  _QWORD v23[5];
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v7)
        v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = objc_msgSend(v7, "shouldLog");
      if (objc_msgSend(v7, "shouldLogToDisk"))
        v9 = v8 | 2;
      else
        v9 = v8;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v10 = v9;
      else
        v10 = v9 & 2;
      if (v10)
      {
        v24 = 136446210;
        v25 = "-[SSDownloadFileManifest _removeItemsWithAssetPaths:completionBlock:]";
        LODWORD(v22) = 12;
        v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v22);
          free(v12);
          SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
        }
      }
    }
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "0", 44);
    xpc_dictionary_set_int64(v20, "1", self->_manifestType);
    SSXPCDictionarySetCFObject(v20, "2", (__CFString *)a3);
    connection = self->_connection;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__SSDownloadFileManifest__removeItemsWithAssetPaths_completionBlock___block_invoke;
    v23[3] = &unk_1E47B8FA0;
    v23[4] = a4;
    -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v23);
    xpc_release(v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("empty assetPaths"));
  }
}

void __69__SSDownloadFileManifest__removeItemsWithAssetPaths_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  CFArrayRef v7;
  xpc_object_t value;
  xpc_object_t v9;
  id v10;
  id v11;
  id v12;

  if (*(_QWORD *)(a1 + 32))
  {
    if (a2 && (v4 = MEMORY[0x1A85863E4](a2), v5 = MEMORY[0x1E0C812F8], v4 == MEMORY[0x1E0C812F8]))
    {
      if (xpc_dictionary_get_BOOL(a2, "0"))
      {
        v6 = 0;
        v7 = 0;
      }
      else
      {
        value = xpc_dictionary_get_value(a2, "1");
        if (value && (v9 = value, MEMORY[0x1A85863E4]() == v5))
          v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", v9);
        else
          v10 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), 100, 0);
        v12 = v10;
        objc_opt_class();
        v7 = SSXPCDictionaryCopyCFObjectWithClass(a2, "2");
        v6 = v12;
      }
    }
    else
    {
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), 111, 0);
      v7 = 0;
    }
    v11 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
