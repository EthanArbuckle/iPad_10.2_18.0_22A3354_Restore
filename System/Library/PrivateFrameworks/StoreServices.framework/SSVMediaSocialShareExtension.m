@implementation SSVMediaSocialShareExtension

- (SSVMediaSocialShareExtension)init
{
  SSVMediaSocialShareExtension *v2;
  SSXPCConnection *v3;
  SSXPCConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVMediaSocialShareExtension;
  v2 = -[SSVMediaSocialShareExtension init](&v6, sel_init);
  if (v2)
  {
    v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    connection = v2->_connection;
    v2->_connection = v3;

  }
  return v2;
}

- (NSString)extensionIdentifier
{
  return (NSString *)CFSTR("com.apple.Music.MediaSocialShareService");
}

- (void)getVisibilityWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t v18;
  SSXPCConnection *connection;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_connection)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("Send -init before checking visibility");
LABEL_21:
    objc_msgSend(v20, "raise:format:", v21, v22);
    goto LABEL_22;
  }
  if (!v4)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("No completion block");
    goto LABEL_21;
  }
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
    goto LABEL_18;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    v10 = v8;
  else
    v10 = v8 & 2;
  if (!v10)
    goto LABEL_16;
  v26 = 136446210;
  v27 = "-[SSVMediaSocialShareExtension getVisibilityWithCompletionBlock:]";
  LODWORD(v23) = 12;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v26, v23);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v9);
LABEL_16:

  }
LABEL_18:
  v18 = SSXPCCreateMessageDictionary(160);
  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__SSVMediaSocialShareExtension_getVisibilityWithCompletionBlock___block_invoke;
  v24[3] = &unk_1E47BAB40;
  v25 = v5;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v18, v24);

LABEL_22:
}

void __65__SSVMediaSocialShareExtension_getVisibilityWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(xdict, "2");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "initWithXPCEncoding:", v8);

      xpc_dictionary_get_BOOL(xdict, "1");
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = 111;
  }
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
