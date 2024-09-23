@implementation SSSoftwareLibrary

- (SSSoftwareLibrary)init
{
  SSSoftwareLibrary *v2;
  SSXPCConnection *v3;
  SSXPCConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSSoftwareLibrary;
  v2 = -[SSSoftwareLibrary init](&v6, sel_init);
  if (v2)
  {
    v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    connection = v2->_connection;
    v2->_connection = v3;

  }
  return v2;
}

- (void)demoteApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
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
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v22 = 136446210;
      v23 = "-[SSSoftwareLibrary demoteApplicationWithBundleIdentifier:completionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(161);
  SSXPCDictionarySetObject(v20, "1", v7);

  -[SSSoftwareLibrary _sendDemotionMessage:completionBlock:](self, "_sendDemotionMessage:completionBlock:", v20, v6);
}

- (void)getLibraryItemForBundleIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
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
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v22 = 136446210;
      v23 = "-[SSSoftwareLibrary getLibraryItemForBundleIdentifiers:completionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(89);
  SSXPCDictionarySetObject(v20, "1", v7);

  -[SSSoftwareLibrary _getItemsWithMessage:completionBlock:](self, "_getItemsWithMessage:completionBlock:", v20, v6);
}

- (void)getLibraryItemsForITunesStoreItemIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = SSXPCCreateMessageDictionary(89);
  SSXPCDictionarySetObject(v8, "2", v7);

  -[SSSoftwareLibrary _getItemsWithMessage:completionBlock:](self, "_getItemsWithMessage:completionBlock:", v8, v6);
}

- (void)getRemovableSytemApplicationsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v19 = 136446210;
      v20 = "-[SSSoftwareLibrary getRemovableSytemApplicationsWithCompletionBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v19, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(172);
  -[SSSoftwareLibrary _getItemsWithMessage:completionBlock:](self, "_getItemsWithMessage:completionBlock:", v17, v4);

}

- (void)hasDemotedApplicationsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  SSXPCConnection *connection;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v23 = 136446210;
      v24 = "-[SSSoftwareLibrary hasDemotedApplicationsWithCompletionBlock:]";
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v23, v20);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(169);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__SSSoftwareLibrary_hasDemotedApplicationsWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E47BAB40;
  v22 = v4;
  v19 = v4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v17, v21);

}

void __63__SSSoftwareLibrary_hasDemotedApplicationsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  xpc_object_t xdict;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258];
    xdict = v3;
    if (v4)
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        xpc_dictionary_get_BOOL(xdict, "1");
        v6 = 0;
        goto LABEL_12;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = xdict;
  }

}

- (void)isInstalledApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSXPCConnection *connection;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v26 = 136446210;
      v27 = "-[SSSoftwareLibrary isInstalledApplicationWithBundleIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(167);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80__SSSoftwareLibrary_isInstalledApplicationWithBundleIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E47BAB40;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v24);

}

void __80__SSSoftwareLibrary_isInstalledApplicationWithBundleIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  xpc_object_t xdict;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258];
    xdict = v3;
    if (v4)
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        xpc_dictionary_get_BOOL(xdict, "0");
        v6 = 0;
        goto LABEL_12;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = xdict;
  }

}

- (void)isRemovedSystemApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSXPCConnection *connection;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v26 = 136446210;
      v27 = "-[SSSoftwareLibrary isRemovedSystemApplicationWithBundleIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(168);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__SSSoftwareLibrary_isRemovedSystemApplicationWithBundleIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E47BAB40;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v24);

}

void __84__SSSoftwareLibrary_isRemovedSystemApplicationWithBundleIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  xpc_object_t xdict;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258];
    xdict = v3;
    if (v4)
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        xpc_dictionary_get_BOOL(xdict, "0");
        v6 = 0;
        goto LABEL_12;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = xdict;
  }

}

- (void)playableApplicationsWithBundleIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSXPCConnection *connection;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v26 = 136446210;
      v27 = "-[SSSoftwareLibrary playableApplicationsWithBundleIdentifiers:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(186);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__SSSoftwareLibrary_playableApplicationsWithBundleIdentifiers_completionBlock___block_invoke;
  v24[3] = &unk_1E47BAB40;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v24);

}

void __79__SSSoftwareLibrary_playableApplicationsWithBundleIdentifiers_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  CFArrayRef v7;
  id v8;
  void *v9;
  xpc_object_t xdict;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258];
  xdict = v3;
  if (v4)
  {
    v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(xdict, "1");
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(xdict, "2");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v8, "initWithXPCEncoding:", v9);

      goto LABEL_11;
    }
    v5 = 111;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)refreshReceiptsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  SSXPCConnection *connection;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v23 = 136446210;
      v24 = "-[SSSoftwareLibrary refreshReceiptsWithCompletionBlock:]";
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v23, v20);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(117);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__SSSoftwareLibrary_refreshReceiptsWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E47BAB40;
  v22 = v4;
  v19 = v4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v17, v21);

}

void __56__SSSoftwareLibrary_refreshReceiptsWithCompletionBlock___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    xpc_dictionary_get_value(xdict, "1");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", v3);
    else
      v4 = 0;
    v5 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)restoreAllDemotedApplicationsWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
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
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v22 = 136446210;
      v23 = "-[SSSoftwareLibrary restoreAllDemotedApplicationsWithOptions:completionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(162);
  SSXPCDictionarySetObject(v20, "2", v7);

  -[SSSoftwareLibrary _sendDemotionMessage:completionBlock:](self, "_sendDemotionMessage:completionBlock:", v20, v6);
}

- (void)restoreDemotedApplicationWithBundleIdentifier:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      v15 = v13;
    else
      v15 = v13 & 2;
    if (v15)
    {
      v25 = 136446210;
      v26 = "-[SSSoftwareLibrary restoreDemotedApplicationWithBundleIdentifier:options:completionBlock:]";
      LODWORD(v24) = 12;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v25, v24);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_15;
  }
LABEL_16:
  v23 = SSXPCCreateMessageDictionary(162);
  SSXPCDictionarySetObject(v23, "1", v10);

  SSXPCDictionarySetObject(v23, "2", v9);
  -[SSSoftwareLibrary _sendDemotionMessage:completionBlock:](self, "_sendDemotionMessage:completionBlock:", v23, v8);

}

- (void)_getItemsWithMessage:(id)a3 completionBlock:(id)a4
{
  id v6;
  SSXPCConnection *connection;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke;
  v9[3] = &unk_1E47BAB40;
  v10 = v6;
  v8 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", a3, v9);

}

void __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  xpc_object_t xdict;
  _QWORD applier[4];
  id v15;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258];
  xdict = v3;
  if (v4)
  {
    v5 = 121;
LABEL_10:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_11;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
    goto LABEL_10;
  }
  xpc_dictionary_get_value(xdict, "1");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8 && MEMORY[0x1A85863E4](v8) == MEMORY[0x1E0C812C8])
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke_2;
    applier[3] = &unk_1E47B8B38;
    v7 = v10;
    v15 = v7;
    xpc_array_apply(v9, applier);

  }
  else
  {
    v7 = 0;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(xdict, "2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SSSoftwareLibraryItem *v5;

  v4 = a3;
  v5 = -[SSSoftwareLibraryItem initWithXPCEncoding:]([SSSoftwareLibraryItem alloc], "initWithXPCEncoding:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  return 1;
}

- (void)_sendDemotionMessage:(id)a3 completionBlock:(id)a4
{
  id v6;
  SSXPCConnection *connection;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SSSoftwareLibrary__sendDemotionMessage_completionBlock___block_invoke;
  v9[3] = &unk_1E47BAB40;
  v10 = v6;
  v8 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", a3, v9);

}

void __58__SSSoftwareLibrary__sendDemotionMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  xpc_object_t xdict;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258];
    xdict = v3;
    if (v4)
    {
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
        goto LABEL_12;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = xdict;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
