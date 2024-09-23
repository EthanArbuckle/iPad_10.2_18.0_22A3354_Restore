@implementation SSDownloadAuthenticationSession

- (NSURLAuthenticationChallenge)authenticationChallenge
{
  NSObject *dispatchQueue;
  NSURLAuthenticationChallenge *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SSDownloadAuthenticationSession_authenticationChallenge__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSURLAuthenticationChallenge *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__SSDownloadAuthenticationSession_authenticationChallenge__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  CFArrayRef v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SSDownloadAuthenticationChallengeSender *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_copySessionPropertyWithKey:", "2");
  if (v2)
  {
    v3 = (const __CFDictionary *)v2;
    if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812E8])
    {
      v4 = SSXPCCreateCFObjectFromXPCObject(v3);
      v21 = 0;
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v21);
      if (v21)
      {
        v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v6)
          v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v7 = objc_msgSend(v6, "shouldLog");
        if (objc_msgSend(v6, "shouldLogToDisk"))
          v8 = v7 | 2;
        else
          v8 = v7;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v8 &= 2u;
        if (v8)
        {
          v9 = objc_opt_class();
          v22 = 138543618;
          v23 = v9;
          v24 = 2114;
          v25 = v21;
          LODWORD(v20) = 22;
          v10 = _os_log_send_and_compose_impl();
          if (v10)
          {
            v11 = (void *)v10;
            v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v20);
            free(v11);
            SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = -[SSDownloadAuthenticationChallengeSender initWithAuthenticationSession:]([SSDownloadAuthenticationChallengeSender alloc], "initWithAuthenticationSession:", *(_QWORD *)(a1 + 32));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3988]), "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", objc_msgSend(v5, "protectionSpace"), objc_msgSend(v5, "proposedCredential"), objc_msgSend(v5, "previousFailureCount"), objc_msgSend(v5, "failureResponse"), objc_msgSend(v5, "error"), v19);

      }
    }
    xpc_release(v3);
  }
}

- (void)_finishWithType:(int)a3 credential:(id)a4
{
  xpc_object_t v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "0", 2);
  xpc_dictionary_set_int64(v7, "1", self->super._sessionID);
  xpc_dictionary_set_int64(v7, "2", a3);
  if (a4)
  {
    v23 = 0;
    SSXPCDictionarySetCFObject(v7, "3", (__CFString *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 1, &v23));
    if (v23)
    {
      v8 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v8)
        v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v10 &= 2u;
      if (v10)
      {
        v11 = objc_opt_class();
        v24 = 138543618;
        v25 = v11;
        v26 = 2114;
        v27 = v23;
        LODWORD(v22) = 22;
        v21 = &v24;
        v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v24, v22);
          free(v13);
          SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
        }
      }
    }
  }
  -[SSXPCConnection sendMessage:](self->super._controlConnection, "sendMessage:", v7, v21);
  xpc_release(v7);
}

@end
