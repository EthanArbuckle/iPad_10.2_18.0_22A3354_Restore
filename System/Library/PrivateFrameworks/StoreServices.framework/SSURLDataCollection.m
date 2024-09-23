@implementation SSURLDataCollection

+ (void)collectURLSessionDataWithBlock:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  SSXPCConnection *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      v8 = v6;
    else
      v8 = v6 & 2;
    if (v8)
    {
      v21 = 136446210;
      v22 = "+[SSURLDataCollection collectURLSessionDataWithBlock:]";
      LODWORD(v18) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v21, v18);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (v3)
  {
    v16 = SSXPCCreateMessageDictionary(199);
    v17 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    if (v17)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __54__SSURLDataCollection_collectURLSessionDataWithBlock___block_invoke;
      v19[3] = &unk_1E47BAB40;
      v20 = v3;
      -[SSXPCConnection sendMessage:withReply:](v17, "sendMessage:withReply:", v16, v19);

    }
    else
    {
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    }

  }
}

void __54__SSURLDataCollection_collectURLSessionDataWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = a2;
    v4 = objc_opt_class();
    v5 = (id)SSXPCDictionaryCopyObjectWithClass(v3, "0", v4);

  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
