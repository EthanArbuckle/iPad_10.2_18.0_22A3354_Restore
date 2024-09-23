@implementation SSDownloadHandlerSession

- (id)_initWithMessage:(id)a3 controlConnection:(id)a4
{
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSDownloadHandlerSession;
  v5 = -[SSDownloadSession _initWithMessage:controlConnection:](&v7, sel__initWithMessage_controlConnection_, a3, a4);
  if (v5)
  {
    objc_opt_class();
    v5[6] = SSXPCDictionaryCopyCFObjectWithClass(a3, "4");
    objc_opt_class();
    v5[7] = SSXPCDictionaryCopyCFObjectWithClass(a3, "5");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadHandlerSession;
  -[SSDownloadSession dealloc](&v3, sel_dealloc);
}

- (BOOL)blocksOtherDownloads
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = -[SSDownloadSession _copySessionPropertyWithKey:](self, "_copySessionPropertyWithKey:", "3");
  if (!v2)
    return 1;
  v3 = v2;
  v4 = MEMORY[0x1A85863E4]() != MEMORY[0x1E0C812D0] || xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

- (BOOL)canBePaused
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = -[SSDownloadSession _copySessionPropertyWithKey:](self, "_copySessionPropertyWithKey:", "4");
  if (!v2)
    return 1;
  v3 = v2;
  v4 = MEMORY[0x1A85863E4]() != MEMORY[0x1E0C812D0] || xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

- (void)disavowSessionWithError:(id)a3
{
  -[SSDownloadHandlerSession _finishWithType:error:](self, "_finishWithType:error:", 3, a3);
}

- (NSString)downloadPhase
{
  NSString *downloadPhase;
  CFArrayRef v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;

  downloadPhase = self->_downloadPhase;
  if (downloadPhase)
  {
    v3 = downloadPhase;
  }
  else
  {
    v4 = -[SSDownloadSession _copySessionPropertyWithKey:](self, "_copySessionPropertyWithKey:", "2");
    if (v4)
    {
      v5 = v4;
      if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C81390])
        v3 = SSXPCCreateCFObjectFromXPCObject(v5);
      else
        v3 = 0;
      xpc_release(v5);
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (void)finishSessionWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v4;

  if (a3)
    v4 = 2;
  else
    v4 = 0;
  -[SSDownloadHandlerSession _finishWithType:error:](self, "_finishWithType:error:", v4, a4);
}

- (BOOL)needsPowerAssertion
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = -[SSDownloadSession _copySessionPropertyWithKey:](self, "_copySessionPropertyWithKey:", "5");
  if (!v2)
    return 1;
  v3 = v2;
  v4 = MEMORY[0x1A85863E4]() != MEMORY[0x1E0C812D0] || xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

- (void)releaseSessionControl
{
  -[SSDownloadHandlerSession _finishWithType:error:](self, "_finishWithType:error:", 1, 0);
}

- (void)setBlocksOtherDownloads:(BOOL)a3
{
  -[SSDownloadHandlerSession _setBool:forSessionProperty:](self, "_setBool:forSessionProperty:", a3, "3");
}

- (void)setCanBePaused:(BOOL)a3
{
  -[SSDownloadHandlerSession _setBool:forSessionProperty:](self, "_setBool:forSessionProperty:", a3, "4");
}

- (void)setNeedsPowerAssertion:(BOOL)a3
{
  -[SSDownloadHandlerSession _setBool:forSessionProperty:](self, "_setBool:forSessionProperty:", a3, "5");
}

- (void)setPercentComplete:(float)a3
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
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      v20 = 136446210;
      v21 = "-[SSDownloadHandlerSession setPercentComplete:]";
      LODWORD(v19) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v20, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 4);
  xpc_dictionary_set_int64(v18, "1", self->super._sessionID);
  xpc_dictionary_set_double(v18, "2", a3);
  -[SSXPCConnection sendMessage:](self->super._controlConnection, "sendMessage:", v18);
  xpc_release(v18);
}

- (void)setStatusDescription:(id)a3
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
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      v20 = 136446210;
      v21 = "-[SSDownloadHandlerSession setStatusDescription:]";
      LODWORD(v19) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v20, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 51);
  xpc_dictionary_set_int64(v18, "1", self->super._sessionID);
  SSXPCDictionarySetCFObject(v18, "2", (__CFString *)a3);
  -[SSXPCConnection sendMessage:](self->super._controlConnection, "sendMessage:", v18);
  xpc_release(v18);
}

- (void)_finishWithType:(int)a3 error:(id)a4
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
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      v22 = 136446210;
      v23 = "-[SSDownloadHandlerSession _finishWithType:error:]";
      LODWORD(v21) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v22, v21);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 2);
  xpc_dictionary_set_int64(v20, "1", self->super._sessionID);
  xpc_dictionary_set_int64(v20, "2", a3);
  SSXPCDictionarySetCFObject(v20, "3", (__CFString *)a4);
  -[SSXPCConnection sendMessage:](self->super._controlConnection, "sendMessage:", v20);
  xpc_release(v20);
}

- (void)_setBool:(BOOL)a3 forSessionProperty:(const char *)a4
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
  xpc_object_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      v23 = 136446210;
      v24 = "-[SSDownloadHandlerSession _setBool:forSessionProperty:]";
      LODWORD(v22) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v23, v22);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 30);
  xpc_dictionary_set_int64(v20, "1", self->super._sessionID);
  v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v21, a4, a3);
  xpc_dictionary_set_value(v20, "2", v21);
  xpc_release(v21);
  -[SSXPCConnection sendMessage:](self->super._controlConnection, "sendMessage:", v20);
  xpc_release(v20);
}

- (NSNumber)duetTimeoutInterval
{
  return self->_duetTimeoutInterval;
}

@end
