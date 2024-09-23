@implementation ISOpenURLOperation

- (ISOpenURLOperation)init
{
  return -[ISOpenURLOperation initWithOpenURLRequest:](self, "initWithOpenURLRequest:", 0);
}

- (ISOpenURLOperation)initWithOpenURLRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  ISOpenURLOperation *v8;
  uint64_t v9;
  ISOpenURLRequest *request;
  objc_super v12;

  v5 = a3;
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_2;
  objc_msgSend(v5, "URLBagKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ISOpenURLOperation.m"), 66, CFSTR("Request must be resolvable"));
LABEL_2:

  }
  v12.receiver = self;
  v12.super_class = (Class)ISOpenURLOperation;
  v8 = -[ISOperation init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v5, "copy");
    request = v8->_request;
    v8->_request = (ISOpenURLRequest *)v9;

  }
  return v8;
}

- (ISOpenURLRequest)openURLRequest
{
  return (ISOpenURLRequest *)(id)-[ISOpenURLRequest copy](self->_request, "copy");
}

- (void)run
{
  ISOpenURLOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ISOpenURLRequest *v8;
  id v9;
  OpenURLTarget *v10;
  void *v11;
  OpenURLTarget *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  ISOpenURLRequest *v23;
  void *v24;
  ISOpenURLRequest *v25;
  ISOpenURLOperation *v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  BOOL v35;
  void *v36;
  int v37;
  int v38;
  NSObject *v39;
  int v40;
  void *v41;
  ISOpenURLRequest *request;
  id v43;
  void *v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  OpenURLTarget *v48;
  id obj;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  int v57;
  id v58;
  __int16 v59;
  ISOpenURLRequest *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v2 = self;
  v63 = *MEMORY[0x24BDAC8D0];
  -[ISOpenURLRequest URLBagKey](self->_request, "URLBagKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISOperation loadURLBagWithContext:returningError:](v2, "loadURLBagWithContext:returningError:", v4, 0);
    +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLBagForContext:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ISOpenURLRequest URLBagKey](v2->_request, "URLBagKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlForKey:", v7);
    v8 = (ISOpenURLRequest *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_3;
LABEL_43:
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = objc_msgSend(v36, "shouldLog");
    if (objc_msgSend(v36, "shouldLogToDisk"))
      v38 = v37 | 2;
    else
      v38 = v37;
    objc_msgSend(v36, "OSLogObject");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      v40 = v38;
    else
      v40 = v38 & 2;
    if (v40)
    {
      v41 = (void *)objc_opt_class();
      request = v2->_request;
      v57 = 138412546;
      v58 = v41;
      v59 = 2112;
      v60 = request;
      v43 = v41;
      LODWORD(v47) = 22;
      v46 = &v57;
      v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_55:

        goto LABEL_58;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v44, 4, &v57, v47);
      v39 = objc_claimAutoreleasedReturnValue();
      free(v44);
      v46 = (int *)v39;
      SSFileLog();
    }

    goto LABEL_55;
  }
  -[ISOpenURLRequest URL](v2->_request, "URL");
  v8 = (ISOpenURLRequest *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_43;
LABEL_3:
  if (!-[ISOpenURLRequest isITunesStoreURL](v2->_request, "isITunesStoreURL"))
  {
    if (-[ISOpenURLRequest isSafeExternalURL](v8, "isSafeExternalURL"))
    {
      v45 = -[ISOpenURLOperation _openURL:](v2, "_openURL:", v8);
      goto LABEL_62;
    }
LABEL_58:
    v45 = 0;
    goto LABEL_62;
  }
  v9 = -[ISOpenURLOperation _newSortedTargetsArray](v2, "_newSortedTargetsArray");
  v10 = [OpenURLTarget alloc];
  -[ISOpenURLRequest targetIdentifier](v2->_request, "targetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[OpenURLTarget initWithTargetIdentifier:](v10, "initWithTargetIdentifier:", v11);

  if (v12)
    objc_msgSend(v9, "insertObject:atIndex:", v12, 0);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v13, "shouldLog");
  if (objc_msgSend(v13, "shouldLogToDisk"))
    v15 = v14 | 2;
  else
    v15 = v14;
  objc_msgSend(v13, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    v17 = v15;
  else
    v17 = v15 & 2;
  if (!v17)
    goto LABEL_17;
  v57 = 138412802;
  v58 = (id)objc_opt_class();
  v59 = 2112;
  v60 = v8;
  v61 = 2112;
  v62 = v9;
  v18 = v58;
  LODWORD(v47) = 32;
  v46 = &v57;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v57, v47);
    v16 = objc_claimAutoreleasedReturnValue();
    free(v19);
    v46 = (int *)v16;
    SSFileLog();
LABEL_17:

  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v9;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v20)
  {
    v45 = 0;
    goto LABEL_61;
  }
  v21 = v20;
  v48 = v12;
  v50 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v53 != v50)
        objc_enumerationMutation(obj);
      v23 = (ISOpenURLRequest *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "copyURLForURL:", v8, v46);
      objc_msgSend(v51, "applicationsAvailableForOpeningURL:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "count"))
      {

        continue;
      }
      v25 = v8;
      v26 = v2;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = objc_msgSend(v27, "shouldLog");
      if (objc_msgSend(v27, "shouldLogToDisk"))
        v29 = v28 | 2;
      else
        v29 = v28;
      objc_msgSend(v27, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        v31 = v29;
      else
        v31 = v29 & 2;
      if (v31)
      {
        v32 = (void *)objc_opt_class();
        v57 = 138412546;
        v58 = v32;
        v59 = 2112;
        v60 = v23;
        v33 = v32;
        LODWORD(v47) = 22;
        v46 = &v57;
        v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34)
          goto LABEL_36;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v34, 4, &v57, v47);
        v30 = objc_claimAutoreleasedReturnValue();
        free(v34);
        v46 = (int *)v30;
        SSFileLog();
      }

LABEL_36:
      v2 = v26;
      v35 = -[ISOpenURLOperation _openURL:](v26, "_openURL:", v23);

      v8 = v25;
      if (v35)
      {
        v45 = 1;
        goto LABEL_59;
      }
    }
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  }
  while (v21);
  v45 = 0;
LABEL_59:
  v12 = v48;
LABEL_61:

LABEL_62:
  -[ISOperation setSuccess:](v2, "setSuccess:", v45, v46);

}

- (id)_newSortedTargetsArray
{
  id v2;
  uint64_t i;
  OpenURLTarget *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; i != 216; i += 24)
  {
    v4 = -[OpenURLTarget initWithTargetIdentifier:]([OpenURLTarget alloc], "initWithTargetIdentifier:", *(_QWORD *)((char *)&__OpenURLTargetData + i));
    if (v4)
      objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(v2, "sortUsingSelector:", sel_compare_);
  return v2;
}

- (BOOL)_openURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  __int16 v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ISOpenURLRequest interruptsKeybagRefresh](self->_request, "interruptsKeybagRefresh"))
    SBSInterruptKeybagRefetch();
  v12 = 0;
  v5 = SBSSpringBoardServerPort();
  MEMORY[0x20BD3740C](v5, (char *)&v12 + 1, &v12);
  if (HIBYTE(v12))
  {
    objc_msgSend(MEMORY[0x24BE38508], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "createClientPort");

    v13 = *MEMORY[0x24BE38310];
    v14[0] = MEMORY[0x24BDBD1C8];
    v8 = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38508], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURL:application:options:clientPort:withResult:", v4, CFSTR("com.apple.MobileStore"), v9, v7, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "openSensitiveURL:withOptions:", v4, 0);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
