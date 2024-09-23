@implementation ISBiometricAuthorizationDialogOperation

- (ISBiometricAuthorizationDialogOperation)initWithTouchIDDialog:(id)a3 fallbackDialog:(id)a4
{
  id v7;
  id v8;
  ISBiometricAuthorizationDialogOperation *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ISBiometricAuthorizationDialogOperation;
  v9 = -[ISOperation init](&v13, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.itunesstored.ISBiometricAuthorizationDialogOperation", 0);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_fallbackDialog, a4);
    objc_storeStrong((id *)&v9->_touchIDDialog, a3);
  }

  return v9;
}

- (void)run
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  SSBiometricAuthenticationContext *context;
  void *v8;
  BOOL v9;
  id v10;
  unint64_t v11;
  _QWORD *v12;
  char v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  BOOL v40;
  char v41;
  int v42;
  int v43;
  NSObject *v44;
  unint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *dispatchQueue;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  NSObject *v57;
  void *v58;
  id v59;
  int v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  int v68;
  int v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  int *v74;
  int *v75;
  uint64_t v76;
  char v77;
  char v78;
  void *v79;
  void *v80;
  id v81;
  _QWORD block[6];
  char v83;
  id v84;
  id v85;
  int v86;
  void *v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BEB1DC8];
  -[ISBiometricAuthorizationDialogOperation metricsDictionary](self, "metricsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dialogIdForMetricsDictionary:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 || (v5 = (id)*MEMORY[0x24BEB2900]) != 0)
    -[SSBiometricAuthenticationContext setDialogId:](self->_context, "setDialogId:", v5);
  -[ISBiometricAuthorizationDialogOperation userAgent](self, "userAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    context = self->_context;
    -[ISBiometricAuthorizationDialogOperation userAgent](self, "userAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBiometricAuthenticationContext setUserAgent:](context, "setUserAgent:", v8);

  }
  v85 = 0;
  v9 = -[ISBiometricAuthorizationDialogOperation _runSignatureOperationReturningError:](self, "_runSignatureOperationReturningError:", &v85);
  v10 = v85;
  v11 = 0x24BEB1000uLL;
  v12 = (_QWORD *)MEMORY[0x24BEB24A0];
  v81 = v5;
  if (v9)
  {
    v13 = 0;
    v14 = 1;
    v15 = 2;
    goto LABEL_68;
  }
  ISWeakLinkedStringConstantForString("LAErrorDomain", (const void *)0x1E);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", v16))
    goto LABEL_13;
  v18 = objc_msgSend(v10, "code");
  if (v18 == -1)
  {
LABEL_12:
    v13 = 1;
    goto LABEL_14;
  }
  if (v18 != -2)
  {
    if (v18 == -8)
      goto LABEL_12;
LABEL_13:
    v13 = 0;
LABEL_14:
    if (-[ISBiometricAuthorizationDialogOperation _shouldFallbackToAuthKitForError:](self, "_shouldFallbackToAuthKitForError:", v10))
    {
      goto LABEL_15;
    }
    if (!objc_msgSend(v17, "isEqualToString:", *v12) || objc_msgSend(v10, "code") != 16)
    {
      v15 = 1;
      goto LABEL_32;
    }
    v77 = v13;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v20, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      v22 &= 2u;
    if (v22)
    {
      v24 = (void *)objc_opt_class();
      v86 = 138543362;
      v87 = v24;
      v25 = v24;
      LODWORD(v76) = 12;
      v74 = &v86;
      v26 = (void *)_os_log_send_and_compose_impl();

      v11 = 0x24BEB1000;
      if (!v26)
      {
LABEL_30:

        v15 = 8;
        v13 = v77;
LABEL_32:
        v80 = v16;
        if (!objc_msgSend(v17, "isEqualToString:", v16, v74) || objc_msgSend(v10, "code") != -2)
          goto LABEL_52;
        v78 = v13;
        objc_msgSend(*(id *)(v11 + 3736), "sharediTunesStoreConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          objc_msgSend(*(id *)(v11 + 3736), "sharedConfig");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v28 = objc_msgSend(v27, "shouldLog");
        if (objc_msgSend(v27, "shouldLogToDisk"))
          v29 = v28 | 2;
        else
          v29 = v28;
        objc_msgSend(v27, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          v29 &= 2u;
        if (v29)
        {
          v31 = (void *)objc_opt_class();
          v86 = 138543362;
          v87 = v31;
          v32 = v17;
          v33 = v11;
          v34 = v31;
          LODWORD(v76) = 12;
          v74 = &v86;
          v35 = (void *)_os_log_send_and_compose_impl();

          v11 = v33;
          v17 = v32;

          if (!v35)
          {
LABEL_45:

            v15 = 8;
            v13 = v78;
            goto LABEL_52;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v86, v76);
          v30 = objc_claimAutoreleasedReturnValue();
          free(v35);
          v74 = (int *)v30;
          SSFileLog();
        }

        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v86, v76);
      v23 = objc_claimAutoreleasedReturnValue();
      free(v26);
      v74 = (int *)v23;
      SSFileLog();
    }

    goto LABEL_30;
  }
  v13 = 0;
  if (-[ISBiometricAuthorizationDialogOperation _shouldFallbackToAuthKitForError:](self, "_shouldFallbackToAuthKitForError:", v10))
  {
LABEL_15:
    v84 = 0;
    v14 = -[ISBiometricAuthorizationDialogOperation _runAuthkitOperationWithError:returningError:](self, "_runAuthkitOperationWithError:returningError:", v10, &v84);
    v19 = v84;

    if (v14)
    {
      v15 = 4;
LABEL_66:
      v10 = v19;
      goto LABEL_67;
    }
    objc_msgSend(v19, "domain");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "isEqualToString:", *v12))
    {
      v37 = v17;
      v38 = v13;
      v39 = objc_msgSend(v19, "code");

      v40 = v39 == 140;
      v13 = v38;
      v17 = v37;
      if (v40)
      {
        v15 = 8;
        goto LABEL_66;
      }
    }
    else
    {

    }
    v15 = 16;
    goto LABEL_66;
  }
  v80 = v16;
  v15 = 8;
LABEL_52:
  v41 = v13;
  objc_msgSend(*(id *)(v11 + 3736), "sharediTunesStoreConfig", v74);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(*(id *)(v11 + 3736), "sharedConfig");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v42 = objc_msgSend(v19, "shouldLog");
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v43 = v42 | 2;
  else
    v43 = v42;
  objc_msgSend(v19, "OSLogObject");
  v44 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    v43 &= 2u;
  if (v43)
  {
    v79 = v17;
    v45 = v11;
    v46 = (void *)objc_opt_class();
    v86 = 138543618;
    v87 = v46;
    v88 = 2114;
    v89 = v10;
    v47 = v46;
    LODWORD(v76) = 22;
    v74 = &v86;
    v48 = (void *)_os_log_send_and_compose_impl();

    if (!v48)
    {
      v14 = 0;
      v11 = v45;
      v13 = v41;
      v17 = v79;
      v16 = v80;
      goto LABEL_67;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v48, 4, &v86, v76);
    v44 = objc_claimAutoreleasedReturnValue();
    free(v48);
    v74 = (int *)v44;
    SSFileLog();
    v11 = v45;
    v13 = v41;
    v17 = v79;
  }
  else
  {
    v13 = v41;
  }

  v14 = 0;
  v16 = v80;
LABEL_67:

LABEL_68:
  -[ISBiometricAuthorizationDialogOperation biometricAuthenticationContext](self, "biometricAuthenticationContext", v74);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isExtendedAction");

  if (v50)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__ISBiometricAuthorizationDialogOperation_run__block_invoke;
    block[3] = &unk_24C43C8F0;
    block[4] = self;
    block[5] = v15;
    v83 = v13;
    dispatch_async(dispatchQueue, block);
  }
  objc_msgSend(*(id *)(v11 + 3736), "sharediTunesStoreConfig");
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (v14)
  {
    v54 = v81;
    if (!v52)
    {
      objc_msgSend(*(id *)(v11 + 3736), "sharedConfig");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v55 = objc_msgSend(v53, "shouldLog");
    if (objc_msgSend(v53, "shouldLogToDisk"))
      v56 = v55 | 2;
    else
      v56 = v55;
    objc_msgSend(v53, "OSLogObject");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      v56 &= 2u;
    if (!v56)
      goto LABEL_91;
    v58 = (void *)objc_opt_class();
    v86 = 138543362;
    v87 = v58;
    v59 = v58;
    LODWORD(v76) = 12;
    v75 = &v86;
  }
  else
  {
    v54 = v81;
    if (!v52)
    {
      objc_msgSend(*(id *)(v11 + 3736), "sharedConfig");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v60 = objc_msgSend(v53, "shouldLog");
    if (objc_msgSend(v53, "shouldLogToDisk"))
      v61 = v60 | 2;
    else
      v61 = v60;
    objc_msgSend(v53, "OSLogObject");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      v61 &= 2u;
    if (!v61)
      goto LABEL_91;
    v62 = (void *)objc_opt_class();
    v86 = 138543618;
    v87 = v62;
    v88 = 2114;
    v89 = v10;
    v59 = v62;
    LODWORD(v76) = 22;
    v75 = &v86;
  }
  v63 = (void *)_os_log_send_and_compose_impl();

  if (v63)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v63, 4, &v86, v76);
    v57 = objc_claimAutoreleasedReturnValue();
    free(v63);
    v75 = (int *)v57;
    SSFileLog();
LABEL_91:

  }
  objc_msgSend(v10, "domain");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64 != (void *)*v12 || objc_msgSend(v10, "code") != 149)
    goto LABEL_105;
  -[ISBiometricAuthorizationDialogOperation biometricAuthenticationContext](self, "biometricAuthenticationContext");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "isExtendedAction");

  if ((v66 & 1) == 0)
  {
    objc_msgSend(*(id *)(v11 + 3736), "sharedConfig");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "shouldLog");
    if (objc_msgSend(v67, "shouldLogToDisk"))
      v69 = v68 | 2;
    else
      v69 = v68;
    objc_msgSend(v67, "OSLogObject", v75);
    v70 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      v69 &= 2u;
    if (v69)
    {
      v71 = (void *)objc_opt_class();
      v86 = 138543362;
      v87 = v71;
      v72 = v71;
      LODWORD(v76) = 12;
      v75 = &v86;
      v73 = (void *)_os_log_send_and_compose_impl();

      if (!v73)
      {
LABEL_104:

        v64 = v10;
        v10 = 0;
LABEL_105:

        goto LABEL_106;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v73, 4, &v86, v76);
      v70 = objc_claimAutoreleasedReturnValue();
      free(v73);
      v75 = (int *)v70;
      SSFileLog();
    }

    goto LABEL_104;
  }
LABEL_106:
  -[ISOperation setError:](self, "setError:", v10, v75);
  -[ISOperation setSuccess:](self, "setSuccess:", v14);

}

uint64_t __46__ISBiometricAuthorizationDialogOperation_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performMetricsWithBiometricMatch:didBiometricsFail:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_findSelectedButtonForButtons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *selectedButton;
  void *v11;
  NSURL *v12;
  NSURL *redirectURL;
  ISDialogButton *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v5)
    goto LABEL_16;
  v6 = v5;
  v7 = *(_QWORD *)v16;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v9, "actionType", (_QWORD)v15) == 1)
      {
        objc_msgSend(v9, "dictionary");
        selectedButton = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(selectedButton, "objectForKey:", CFSTR("url"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
          v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
          redirectURL = self->_redirectURL;
          self->_redirectURL = v12;

        }
        objc_storeStrong((id *)&self->_selectedButton, v9);

        goto LABEL_15;
      }
      if (objc_msgSend(v9, "actionType") == 3)
      {
        -[SSBiometricAuthenticationContext setDidBuyParamsChange:](self->_context, "setDidBuyParamsChange:", 1);
        v14 = v9;
        selectedButton = self->_selectedButton;
        self->_selectedButton = v14;
LABEL_15:

        goto LABEL_16;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
      continue;
    break;
  }
LABEL_16:

}

- (void)_loadURLBag
{
  ISLoadURLBagOperation *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  void *urlBag;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  ISURLBag *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ISLoadURLBagOperation);
  v17 = 0;
  v4 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v17);
  v5 = v17;
  v6 = v5;
  if (v4 && v5 == 0)
  {
    -[ISLoadURLBagOperation URLBag](v3, "URLBag");
    v15 = (ISURLBag *)objc_claimAutoreleasedReturnValue();
    urlBag = self->_urlBag;
    self->_urlBag = v15;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  urlBag = (void *)objc_claimAutoreleasedReturnValue();
  if (!urlBag)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    urlBag = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(urlBag, "shouldLog");
  if (objc_msgSend(urlBag, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(urlBag, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (!v10)
    goto LABEL_15;
  v12 = (void *)objc_opt_class();
  v18 = 138543618;
  v19 = v12;
  v20 = 2114;
  v21 = v6;
  v13 = v12;
  LODWORD(v16) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v18, v16);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_15:

  }
LABEL_17:

}

- (void)_performMetricsWithBiometricMatch:(unint64_t)a3 didBiometricsFail:(BOOL)a4
{
  ISURLBag *urlBag;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  int v21;
  int v22;
  id v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  NSObject *v32;
  int v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[5];
  int v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  urlBag = self->_urlBag;
  if (urlBag
    || (-[ISBiometricAuthorizationDialogOperation _loadURLBag](self, "_loadURLBag", a3, a4),
        (urlBag = self->_urlBag) != 0))
  {
    -[ISURLBag valueForKey:](urlBag, "valueForKey:", *MEMORY[0x24BEB2990], a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)MEMORY[0x24BEB1DC8];
      -[ISBiometricAuthorizationDialogOperation metricsDictionary](self, "metricsDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dialogIdForMetricsDictionary:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
        v10 = (id)*MEMORY[0x24BEB2900];
      v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      -[NSObject setObject:forKey:](v11, "setObject:forKey:", v10, *MEMORY[0x24BEB2130]);
      -[NSObject setObject:forKey:](v11, "setObject:forKey:", &unk_24C4531C0, *MEMORY[0x24BEB2140]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v11, "setObject:forKey:", v12, *MEMORY[0x24BEB2120]);

      -[ISBiometricAuthorizationDialogOperation buyParams](self, "buyParams");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[ISBiometricAuthorizationDialogOperation buyParams](self, "buyParams");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("mtTopic"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[NSObject setObject:forKey:](v11, "setObject:forKey:", v15, *MEMORY[0x24BEB2158]);

        }
      }
      -[ISBiometricAuthorizationDialogOperation userAgent](self, "userAgent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[ISBiometricAuthorizationDialogOperation userAgent](self, "userAgent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v11, "setObject:forKey:", v17, *MEMORY[0x24BEB2160]);

      }
      +[ISDevice sharedInstance](ISDevice, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "deviceBiometricStyle");

      if (v19)
      {
        if (v19 == 3)
        {
          v20 = (_QWORD *)MEMORY[0x24BEB2168];
          goto LABEL_45;
        }
        if (v19 == 2)
        {
          v20 = (_QWORD *)MEMORY[0x24BEB2170];
LABEL_45:
          -[NSObject setObject:forKey:](v11, "setObject:forKey:", *v20, *MEMORY[0x24BEB2128]);
LABEL_58:
          objc_msgSend(MEMORY[0x24BEB1DC8], "authorizationDialogEventForParameters:", v11, v41);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1ED0]), "initWithGlobalConfiguration:", v7);
          v39 = objc_alloc_init(MEMORY[0x24BEB1ED8]);
          objc_msgSend(v39, "setGlobalConfiguration:", v38);
          v40 = MEMORY[0x24BDAC760];
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke;
          v44[3] = &unk_24C43C918;
          v44[4] = self;
          objc_msgSend(v39, "insertEvent:withCompletionHandler:", v37, v44);
          v43[0] = v40;
          v43[1] = 3221225472;
          v43[2] = __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke_19;
          v43[3] = &unk_24C43C918;
          v43[4] = self;
          objc_msgSend(v39, "flushUnreportedEventsWithCompletionHandler:", v43);

          goto LABEL_59;
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v33 = objc_msgSend(v29, "shouldLog");
        if (objc_msgSend(v29, "shouldLogToDisk"))
          v34 = v33 | 2;
        else
          v34 = v33;
        objc_msgSend(v29, "OSLogObject");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          v34 &= 2u;
        if (!v34)
          goto LABEL_56;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v30 = objc_msgSend(v29, "shouldLog");
        if (objc_msgSend(v29, "shouldLogToDisk"))
          v31 = v30 | 2;
        else
          v31 = v30;
        objc_msgSend(v29, "OSLogObject");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          v31 &= 2u;
        if (!v31)
          goto LABEL_56;
      }
      v45 = 138543362;
      v46 = (id)objc_opt_class();
      v35 = v46;
      LODWORD(v42) = 12;
      v41 = &v45;
      v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_57:

        goto LABEL_58;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, &v45, v42);
      v32 = objc_claimAutoreleasedReturnValue();
      free(v36);
      v41 = (int *)v32;
      SSFileLog();
LABEL_56:

      goto LABEL_57;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v21 = -[NSObject shouldLog](v10, "shouldLog");
    if (-[NSObject shouldLogToDisk](v10, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    -[NSObject OSLogObject](v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      v22 &= 2u;
    if (!v22)
      goto LABEL_59;
    v45 = 138543362;
    v46 = (id)objc_opt_class();
    v23 = v46;
    LODWORD(v42) = 12;
    v24 = (void *)_os_log_send_and_compose_impl();

    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v45, v42);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog();
LABEL_59:

    }
LABEL_60:

    goto LABEL_61;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v26 = v25 | 2;
  else
    v26 = v25;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    v26 &= 2u;
  if (!v26)
    goto LABEL_60;
  v45 = 138543362;
  v46 = (id)objc_opt_class();
  v27 = v46;
  LODWORD(v42) = 12;
  v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v45, v42);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v28);
    SSFileLog();
    goto LABEL_60;
  }
LABEL_61:

}

void __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      v5 &= 2u;
    if (v5)
    {
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v2;
      v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

}

void __95__ISBiometricAuthorizationDialogOperation__performMetricsWithBiometricMatch_didBiometricsFail___block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      v5 &= 2u;
    if (v5)
    {
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v2;
      v7 = *(id *)&v10[4];
      LODWORD(v9) = 22;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)_runAuthkitOperationWithError:(id)a3 returningError:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ISServerAuthenticationOperation *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  SSBiometricAuthenticationContext *context;
  void *v15;
  void *v16;
  id v18;

  -[SSBiometricAuthenticationContext accountIdentifier](self->_context, "accountIdentifier", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccountIdentifier:", v6);
  objc_msgSend(v7, "setCanCreateNewAccount:", 0);
  objc_msgSend(v7, "setCanSetActiveAccount:", 0);
  objc_msgSend(v7, "setPromptStyle:", 1);
  objc_msgSend(v7, "setShouldCreateNewSession:", 1);
  -[SSBiometricAuthenticationContext passwordEquivalentToken](self->_context, "passwordEquivalentToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SSBiometricAuthenticationContext passwordEquivalentToken](self->_context, "passwordEquivalentToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPasswordEquivalentToken:", v9);

  }
  v10 = objc_alloc_init(ISServerAuthenticationOperation);
  -[ISServerAuthenticationOperation setAuthenticationContext:](v10, "setAuthenticationContext:", v7);
  -[ISBiometricAuthorizationDialogOperation fallbackDialog](self, "fallbackDialog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISServerAuthenticationOperation setDialog:](v10, "setDialog:", v11);

  -[ISServerAuthenticationOperation setPerformsButtonAction:](v10, "setPerformsButtonAction:", 0);
  v18 = 0;
  v12 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v10, &v18);
  v13 = v18;
  context = self->_context;
  if (!v12 || v13)
  {
    -[SSBiometricAuthenticationContext setDidAuthenticate:](context, "setDidAuthenticate:", 0);
    -[SSBiometricAuthenticationContext setDidFallbackToPassword:](self->_context, "setDidFallbackToPassword:", 1);
    if (!a4)
      goto LABEL_11;
LABEL_10:
    *a4 = objc_retainAutorelease(v13);
    goto LABEL_11;
  }
  -[SSBiometricAuthenticationContext setDidAuthenticate:](context, "setDidAuthenticate:", 1);
  -[SSBiometricAuthenticationContext setDidFallbackToPassword:](self->_context, "setDidFallbackToPassword:", 1);
  -[SSBiometricAuthenticationContext setShouldSendFallbackHeader:](self->_context, "setShouldSendFallbackHeader:", 1);
  -[ISBiometricAuthorizationDialogOperation fallbackDialog](self, "fallbackDialog");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ISBiometricAuthorizationDialogOperation fallbackDialog](self, "fallbackDialog");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "buttons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ISBiometricAuthorizationDialogOperation _findSelectedButtonForButtons:](self, "_findSelectedButtonForButtons:", v15);
  objc_storeStrong((id *)&self->_dialog, self->_fallbackDialog);

  if (a4)
    goto LABEL_10;
LABEL_11:

  return v12;
}

- (BOOL)_runSignatureOperationReturningError:(id *)a3
{
  ISBiometricSignatureOperation *v5;
  SSBiometricAuthenticationContext *context;
  void *v7;
  void *v8;
  ISBiometricSignatureOperation *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  ISDialog *v24;
  ISDialog *dialog;
  uint64_t v27;
  id v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = [ISBiometricSignatureOperation alloc];
  context = self->_context;
  -[ISBiometricAuthorizationDialogOperation touchIDDialog](self, "touchIDDialog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBiometricAuthorizationDialogOperation fallbackDialog](self, "fallbackDialog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ISBiometricSignatureOperation initWithBiometricAuthenticationContext:touchIDDialog:fallbackDialog:](v5, "initWithBiometricAuthenticationContext:touchIDDialog:fallbackDialog:", context, v7, v8);

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__6;
  v46 = __Block_byref_object_dispose__6;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__6;
  v40 = __Block_byref_object_dispose__6;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  v35 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __80__ISBiometricAuthorizationDialogOperation__runSignatureOperationReturningError___block_invoke;
  v29[3] = &unk_24C43C940;
  v29[4] = &v42;
  v29[5] = &v36;
  v29[6] = &v30;
  -[ISBiometricSignatureOperation setOutputBlock:](v9, "setOutputBlock:", v29);
  v28 = 0;
  v10 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v9, &v28);
  v11 = v28;
  if (v10 && v43[5])
  {
    -[SSBiometricAuthenticationContext setDidAuthenticate:](self->_context, "setDidAuthenticate:", 1);
    -[SSBiometricAuthenticationContext setDidFallbackToPassword:](self->_context, "setDidFallbackToPassword:", 0);
    -[SSBiometricAuthenticationContext setSignature:](self->_context, "setSignature:", v43[5]);
    -[SSBiometricAuthenticationContext setPaymentTokenData:](self->_context, "setPaymentTokenData:", v37[5]);
    -[SSBiometricAuthenticationContext setFpanID:](self->_context, "setFpanID:", v31[5]);
    -[ISBiometricAuthorizationDialogOperation touchIDDialog](self, "touchIDDialog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ISBiometricAuthorizationDialogOperation touchIDDialog](self, "touchIDDialog");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "buttons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = &OBJC_IVAR___ISBiometricAuthorizationDialogOperation__touchIDDialog;
    }
    else
    {
      -[ISBiometricAuthorizationDialogOperation fallbackDialog](self, "fallbackDialog");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_20:
        -[ISBiometricAuthorizationDialogOperation _findSelectedButtonForButtons:](self, "_findSelectedButtonForButtons:", v14);
        goto LABEL_21;
      }
      -[ISBiometricAuthorizationDialogOperation fallbackDialog](self, "fallbackDialog");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "buttons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = &OBJC_IVAR___ISBiometricAuthorizationDialogOperation__fallbackDialog;
    }

    v24 = (ISDialog *)*(id *)((char *)&self->super.super.super.isa + *v15);
    dialog = self->_dialog;
    self->_dialog = v24;

    goto LABEL_20;
  }
  -[SSBiometricAuthenticationContext passwordEquivalentToken](self->_context, "passwordEquivalentToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    SSError();
    v14 = v11;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v14, "shouldLog");
  v18 = objc_msgSend(v14, "shouldLogToDisk");
  objc_msgSend(v14, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
    v17 |= 2u;
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    v17 &= 2u;
  if (v17)
  {
    v21 = (void *)objc_opt_class();
    v48 = 138543618;
    v49 = v21;
    v50 = 2114;
    v51 = v11;
    v22 = v21;
    LODWORD(v27) = 22;
    v23 = (void *)_os_log_send_and_compose_impl();

    if (!v23)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v48, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    free(v23);
    SSFileLog();
  }

LABEL_21:
  if (a3)
    *a3 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v10;
}

void __80__ISBiometricAuthorizationDialogOperation__runSignatureOperationReturningError___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v21)
  {
    v12 = objc_msgSend(v21, "copy");
    v13 = *(_QWORD *)(a1[4] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  if (v9)
  {
    v15 = objc_msgSend(v9, "copy");
    v16 = *(_QWORD *)(a1[5] + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  if (v10)
  {
    v18 = objc_msgSend(v10, "copy");
    v19 = *(_QWORD *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- (BOOL)_shouldFallbackToAuthKitForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v11;
  void *v13;
  void *v14;

  v4 = a3;
  ISWeakLinkedStringConstantForString("LAErrorDomain", (const void *)0x1E);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBiometricAuthorizationDialogOperation biometricAuthenticationContext](self, "biometricAuthenticationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ISWeakLinkedStringConstantForString("MobileActivationErrorDomain", (const void *)0x25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "code");
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v5))
  {
    LOBYTE(v11) = (~v8 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v8 == -8;
  }
  else if (objc_msgSend(v9, "isEqualToString:", v7))
  {
    if ((-[SSBiometricAuthenticationContext isExtendedAction](self->_context, "isExtendedAction") & 1) != 0)
      LOBYTE(v11) = 1;
    else
      v11 = -[SSBiometricAuthenticationContext isPayment](self->_context, "isPayment") ^ 1;
  }
  else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEB24A0]))
  {
    LOBYTE(v11) = 1;
    if (v8 != 4 && v8 != 151 && (v8 != 149 || (objc_msgSend(v6, "isExtendedAction") & 1) == 0))
    {
      objc_msgSend(v4, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BEB2490]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v11 = objc_msgSend(v6, "isIdentityMapInvalid") ^ 1;
      else
        LOBYTE(v11) = 0;

    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (SSBiometricAuthenticationContext)biometricAuthenticationContext
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 352, 1);
}

- (void)setBiometricAuthenticationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (ISDialog)dialog
{
  return (ISDialog *)objc_getProperty(self, a2, 360, 1);
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 368, 1);
}

- (ISDialogButton)selectedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 376, 1);
}

- (NSDictionary)buyParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 384, 1);
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 384);
}

- (NSDictionary)metricsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 392, 1);
}

- (void)setMetricsDictionary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 392);
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (ISDialog)fallbackDialog
{
  return (ISDialog *)objc_getProperty(self, a2, 408, 1);
}

- (void)setFallbackDialog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (ISTouchIDDialog)touchIDDialog
{
  return (ISTouchIDDialog *)objc_getProperty(self, a2, 416, 1);
}

- (void)setTouchIDDialog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIDDialog, 0);
  objc_storeStrong((id *)&self->_fallbackDialog, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
