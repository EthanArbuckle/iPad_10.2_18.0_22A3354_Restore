@implementation SUAccountViewController

- (SUAccountViewController)init
{
  SUAccountViewController *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  objc_super v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)SUAccountViewController;
  v2 = -[SUStorePageViewController init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
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
      v7 = (void *)objc_opt_class();
      v16 = 138543362;
      v17 = v7;
      v8 = v7;
      LODWORD(v14) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_11:

        -[SUStorePageViewController URLRequestProperties](v2, "URLRequestProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        -[SUAccountViewController _bagKeyForStyle:](v2, "_bagKeyForStyle:", v2->_style);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setURLBagKey:", v12);

        -[SUStorePageViewController setURLRequestProperties:](v2, "setURLRequestProperties:", v11);
        return v2;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v16, v14);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog();
    }

    goto LABEL_11;
  }
  return v2;
}

- (SUAccountViewController)initWithExternalAccountURL:(id)a3
{
  SUAccountViewController *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *accountURL;
  void *v14;
  BOOL v15;
  NSURL *v16;
  uint64_t v17;
  NSURL *v18;
  void *v19;
  void *v20;
  NSURL *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  dispatch_semaphore_t v33;
  id v34;
  NSObject *v35;
  dispatch_time_t v36;
  void *v37;
  int v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  BOOL v48;
  void *v49;
  _BOOL4 v50;
  const __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  NSDictionary *tidHeaders;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  int v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  uint64_t v75;
  void *v76;
  int v77;
  int v78;
  void *v79;
  NSObject *v80;
  void *v81;
  int v82;
  id v83;
  NSURL *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  int v89;
  NSObject *v90;
  void *v91;
  id v92;
  void *v93;
  NSObject *v95;
  int *v96;
  int *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  _QWORD v104[4];
  SUAccountViewController *v105;
  NSObject *v106;
  _BYTE *v107;
  objc_super v108;
  int v109;
  id v110;
  __int16 v111;
  NSURL *v112;
  __int16 v113;
  void *v114;
  _BYTE v115[24];
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v103 = a3;
  v108.receiver = self;
  v108.super_class = (Class)SUAccountViewController;
  v4 = -[SUStorePageViewController init](&v108, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v6 |= 2u;
    objc_msgSend(v5, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v6 &= 2u;
    if (v6)
    {
      v8 = (void *)objc_opt_class();
      *(_DWORD *)v115 = 138543618;
      *(_QWORD *)&v115[4] = v8;
      *(_WORD *)&v115[12] = 2112;
      *(_QWORD *)&v115[14] = v103;
      v9 = v8;
      LODWORD(v98) = 22;
      v95 = v115;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, v115, v98);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v10);
      v95 = v7;
      SSFileLog();
    }

LABEL_10:
    v102 = (void *)objc_msgSend(v103, "copyQueryStringDictionaryWithUnescapedValues:", 1);
    objc_msgSend(v102, "objectForKey:", CFSTR("url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      accountURL = v4->_accountURL;
      v4->_accountURL = (NSURL *)v12;
    }
    else
    {
      objc_msgSend(v103, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length") == 0;

      if (v15)
        goto LABEL_15;
      v16 = (NSURL *)v103;
      accountURL = v4->_accountURL;
      v4->_accountURL = v16;
    }

LABEL_15:
    -[SUAccountViewController _URLByRemovingBlacklistedParametersWithURL:](v4, "_URLByRemovingBlacklistedParametersWithURL:", v4->_accountURL, v95);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v4->_accountURL;
    v4->_accountURL = (NSURL *)v17;

    objc_msgSend(v102, "objectForKey:", CFSTR("continuation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v99 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v19, 1);
    else
      v99 = 0;
    v100 = (void *)-[NSURL copyQueryStringDictionaryWithUnescapedValues:](v4->_accountURL, "copyQueryStringDictionaryWithUnescapedValues:", 0);
    *(_QWORD *)v115 = 0;
    *(_QWORD *)&v115[8] = v115;
    *(_QWORD *)&v115[16] = 0x3032000000;
    v116 = __Block_byref_object_copy__2;
    v117 = __Block_byref_object_dispose__2;
    v118 = 0;
    objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("tidContinueToken"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("signatureResumption"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v45, "BOOLValue"))
      {
LABEL_47:
        v52 = objc_alloc(MEMORY[0x24BEB1F30]);
        -[NSURL schemeSwizzledURL](v4->_accountURL, "schemeSwizzledURL");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v52, "initWithURL:", v53);

        objc_msgSend(v54, "setRequestParameters:", v99);
        if (*(_QWORD *)(*(_QWORD *)&v115[8] + 40))
        {
          objc_msgSend(v54, "HTTPHeaders");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (id)objc_msgSend(v55, "mutableCopy");

          if (!v56)
            v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v56, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)&v115[8] + 40), v96);
          objc_msgSend(v54, "setHTTPHeaders:", v56);

        }
        -[SUStorePageViewController setURLRequestProperties:](v4, "setURLRequestProperties:", v54, v96);
        v57 = objc_msgSend(*(id *)(*(_QWORD *)&v115[8] + 40), "copy");
        tidHeaders = v4->_tidHeaders;
        v4->_tidHeaders = (NSDictionary *)v57;

        objc_msgSend(v102, "objectForKey:", CFSTR("dsid"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v59
          && (SSAccountGetUniqueIdentifierFromValue(),
              v60 = (void *)objc_claimAutoreleasedReturnValue(),
              (v101 = v60) != 0))
        {
          if (objc_msgSend(v60, "unsignedLongLongValue"))
          {
            -[SUStorePageViewController authenticationContext](v4, "authenticationContext");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (void *)objc_msgSend(v61, "mutableCopy");

            if (v62)
              objc_msgSend(v62, "setRequiredUniqueIdentifier:", v101);
            else
              v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccountIdentifier:", v101);
            -[SUStorePageViewController setAuthenticationContext:](v4, "setAuthenticationContext:", v62);
            v63 = 0;
            goto LABEL_68;
          }
          v63 = 0;
        }
        else
        {
          v101 = 0;
          v63 = 1;
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v62, "shouldLog");
        v65 = objc_msgSend(v62, "shouldLogToDisk");
        objc_msgSend(v62, "OSLogObject");
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v66;
        if (v65)
          v64 |= 2u;
        if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          v64 &= 2u;
        if (v64)
        {
          v68 = (void *)objc_opt_class();
          v109 = 138543362;
          v110 = v68;
          v69 = v68;
          LODWORD(v98) = 12;
          v97 = &v109;
          v70 = (void *)_os_log_send_and_compose_impl();

          if (!v70)
            goto LABEL_68;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v70, 4, &v109, v98);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          free(v70);
          v97 = (int *)v67;
          SSFileLog();
        }

LABEL_68:
        -[SUStorePageViewController setExternalRequest:](v4, "setExternalRequest:", 1);
        if (v4->_accountURL)
          v71 = 0;
        else
          v71 = v63;
        if (v71 == 1)
        {
          objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "activeAccount");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v73 == 0;

          if (v74)
            v75 = 1;
          else
            v75 = 2;
        }
        else
        {
          v75 = 2 * (v4->_accountURL == 0);
        }
        -[SUAccountViewController setStyle:](v4, "setStyle:", v75, v97);
        if (v4->_accountURL)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "shouldLog");
          v78 = objc_msgSend(v76, "shouldLogToDisk");
          v79 = v59;
          objc_msgSend(v76, "OSLogObject");
          v80 = objc_claimAutoreleasedReturnValue();
          v81 = v80;
          if (v78)
            v77 |= 2u;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            v82 = v77;
          else
            v82 = v77 & 2;
          if (!v82)
            goto LABEL_92;
          v83 = (id)objc_opt_class();
          v84 = v4->_accountURL;
          -[SUStorePageViewController authenticationContext](v4, "authenticationContext");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "requiredUniqueIdentifier");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 138543874;
          v110 = v83;
          v111 = 2112;
          v112 = v84;
          v113 = 2112;
          v114 = v86;
          LODWORD(v98) = 32;
          v87 = (void *)_os_log_send_and_compose_impl();

          v59 = v79;
          if (v87)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v87, 4, &v109, v98);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            free(v87);
            SSFileLog();
LABEL_92:

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v76, "shouldLog");
          v89 = objc_msgSend(v76, "shouldLogToDisk");
          objc_msgSend(v76, "OSLogObject");
          v90 = objc_claimAutoreleasedReturnValue();
          v81 = v90;
          if (v89)
            v88 |= 2u;
          if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            v88 &= 2u;
          if (!v88)
            goto LABEL_92;
          v91 = (void *)objc_opt_class();
          v109 = 138543362;
          v110 = v91;
          v92 = v91;
          LODWORD(v98) = 12;
          v93 = (void *)_os_log_send_and_compose_impl();

          if (v93)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v93, 4, &v109, v98);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            free(v93);
            SSFileLog();
            goto LABEL_92;
          }
        }

        _Block_object_dispose(v115, 8);
        goto LABEL_94;
      }
      objc_msgSend(MEMORY[0x24BE081B0], "resumptionHeaders");
      v46 = objc_claimAutoreleasedReturnValue();
      v21 = *(NSURL **)(*(_QWORD *)&v115[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v115[8] + 40) = v46;
LABEL_46:

      goto LABEL_47;
    }
    v21 = v20;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "shouldLog");
    v24 = objc_msgSend(v22, "shouldLogToDisk");
    objc_msgSend(v22, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
      v23 |= 2u;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      v23 &= 2u;
    if (v23)
    {
      v27 = (void *)objc_opt_class();
      v109 = 138543618;
      v110 = v27;
      v111 = 2114;
      v112 = v21;
      v28 = v27;
      LODWORD(v98) = 22;
      v96 = &v109;
      v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4, &v109, v98);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      free(v29);
      v96 = (int *)v26;
      SSFileLog();
    }

LABEL_27:
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activeAccount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = dispatch_semaphore_create(0);
    v34 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
    v104[0] = MEMORY[0x24BDAC760];
    v104[1] = 3221225472;
    v104[2] = __54__SUAccountViewController_initWithExternalAccountURL___block_invoke;
    v104[3] = &unk_24DE7BB88;
    v105 = v4;
    v107 = v115;
    v35 = v33;
    v106 = v35;
    objc_msgSend(v34, "getAllCachedBiometricHTTPHeadersWithToken:accountID:evict:completionBlock:", v21, v32, 1, v104);
    v36 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v35, v36))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&v115[8] + 40), "objectForKeyedSubscript:", *MEMORY[0x24BEB25B0]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47 == 0;

      if (!v48)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&v115[8] + 40), "objectForKeyedSubscript:", *MEMORY[0x24BEB25C0]);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49 == 0;

        if (v50)
          v51 = CFSTR("FB");
        else
          v51 = CFSTR("PK");
        objc_msgSend(*(id *)(*(_QWORD *)&v115[8] + 40), "setObject:forKey:", v51, *MEMORY[0x24BEB25A0], v96);
      }
      goto LABEL_45;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "shouldLog");
    v39 = objc_msgSend(v37, "shouldLogToDisk");
    objc_msgSend(v37, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v39)
      v38 |= 2u;
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      v38 &= 2u;
    if (v38)
    {
      v42 = (void *)objc_opt_class();
      v109 = 138543618;
      v110 = v42;
      v111 = 2114;
      v112 = v21;
      v43 = v42;
      LODWORD(v98) = 22;
      v96 = &v109;
      v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_36:

LABEL_45:
        v45 = v21;
        goto LABEL_46;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v44, 4, &v109, v98);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      free(v44);
      v96 = (int *)v41;
      SSFileLog();
    }

    goto LABEL_36;
  }
LABEL_94:

  return v4;
}

void __54__SUAccountViewController_initWithExternalAccountURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v5);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v9 &= 2u;
  if (!v9)
    goto LABEL_10;
  *(_DWORD *)v17 = 138543618;
  *(_QWORD *)&v17[4] = objc_opt_class();
  *(_WORD *)&v17[12] = 2114;
  *(_QWORD *)&v17[14] = v6;
  v11 = *(id *)&v17[4];
  LODWORD(v16) = 22;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v17, v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_10:

  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (v7)
  {
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2048;
    *(_QWORD *)&v15[14] = a3;
    v9 = *(id *)&v15[4];
    LODWORD(v14) = 22;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, v15, v14, *(_OWORD *)v15, *(_QWORD *)&v15[16]);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
  }

LABEL_10:
  if (self->_style != a3)
  {
    self->_style = a3;
    -[SUStorePageViewController URLRequestProperties](self, "URLRequestProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    -[SUAccountViewController _bagKeyForStyle:](self, "_bagKeyForStyle:", self->_style);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setURLBagKey:", v13);

    -[SUStorePageViewController setURLRequestProperties:](self, "setURLRequestProperties:", v12);
    -[SUStorePageViewController _setUseWebViewFastPath:](self, "_setUseWebViewFastPath:", -[SUAccountViewController _shouldUseWebViewFastPath](self, "_shouldUseWebViewFastPath"));

  }
}

- (id)copyArchivableContext
{
  return 0;
}

- (void)enqueueFetchOperation
{
  int64_t mescalState;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  SUSetupMescalSessionOperation *v12;
  void *v13;
  SUSetupMescalSessionOperation *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  objc_super v21;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  mescalState = self->_mescalState;
  if (mescalState)
  {
    if (mescalState == 2)
    {
      v21.receiver = self;
      v21.super_class = (Class)SUAccountViewController;
      -[SUStorePageViewController enqueueFetchOperation](&v21, sel_enqueueFetchOperation);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v6 &= 2u;
    if (v6)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      v8 = *(id *)((char *)location + 4);
      LODWORD(v16) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, location, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        free(v9);
        SSFileLog();

      }
    }
    else
    {

    }
    v11 = -[SUAccountViewController newFetchOperation](self, "newFetchOperation");
    v12 = [SUSetupMescalSessionOperation alloc];
    objc_msgSend(v11, "requestProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUSetupMescalSessionOperation initWithURLRequestProperties:](v12, "initWithURLRequestProperties:", v13);

    objc_initWeak(location, v14);
    objc_initWeak(&from, self);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __48__SUAccountViewController_enqueueFetchOperation__block_invoke;
    v17[3] = &unk_24DE7BBB0;
    objc_copyWeak(&v18, location);
    objc_copyWeak(&v19, &from);
    -[SUSetupMescalSessionOperation setCompletionBlock:](v14, "setCompletionBlock:", v17);
    self->_mescalState = 1;
    objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

  }
}

void __48__SUAccountViewController_enqueueFetchOperation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __48__SUAccountViewController_enqueueFetchOperation__block_invoke_2;
  v7 = &unk_24DE7B5F0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v3 = WeakRetained;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], &v4);
  objc_msgSend(v3, "setCompletionBlock:", 0, v4, v5, v6, v7);

  objc_destroyWeak(&v9);
}

void __48__SUAccountViewController_enqueueFetchOperation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "mescalSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_mescalDidOpenWithSession:error:", v2, v3);

}

- (void)handleFailureWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v8;

  v4 = a3;
  ISWeakLinkedStringConstantForString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if ((v7 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SUAccountViewController;
    -[SUStorePageViewController handleFailureWithError:](&v8, sel_handleFailureWithError_, v4);
  }

}

- (id)newFetchOperation
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *primingSignature;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SUAccountViewController;
  v3 = -[SUStorePageViewController newFetchOperation](&v14, sel_newFetchOperation);
  -[SUStorePageViewController authenticationContext](self, "authenticationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEB1F28]);
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithAccount:", v8);

  }
  objc_msgSend(v5, "setPromptStyle:", 1);
  -[SUAccountViewController _authenticationQueryParametersForStyle:](self, "_authenticationQueryParametersForStyle:", self->_style);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestParameters:", v9);

  objc_msgSend(v5, "setShouldFollowAccountButtons:", 1);
  objc_msgSend(v3, "setAuthenticationContext:", v5);
  objc_msgSend(v3, "requestProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (self->_style == 2)
  {
    objc_msgSend(v5, "accountScope");
    objc_msgSend(v11, "setURLBagType:", SSURLBagTypeForAccountScope());
  }
  primingSignature = self->_primingSignature;
  if (primingSignature)
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", primingSignature, CFSTR("X-Apple-ActionSignature"));
  objc_msgSend(v3, "setRequestProperties:", v11);

  return v3;
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4 returningError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v26;
  objc_super v27;
  id v28;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v8, "didShowDialog"))
      goto LABEL_19;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v15 &= 2u;
    if (v15)
    {
      v29 = 138543362;
      v30 = (id)objc_opt_class();
      v17 = v30;
      LODWORD(v26) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_18:

        v10 = 0;
LABEL_29:
        v9 = 0;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v29, v26);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog();
    }

    goto LABEL_18;
  }
  if (a4 != 1)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "shouldLog");
    if (objc_msgSend(v19, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    objc_msgSend(v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      v21 &= 2u;
    if (v21)
    {
      v29 = 138543362;
      v30 = (id)objc_opt_class();
      v23 = v30;
      LODWORD(v26) = 12;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_28:

        ISError();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v29, v26);
      v22 = objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog();
    }

    goto LABEL_28;
  }
  v27.receiver = self;
  v27.super_class = (Class)SUAccountViewController;
  v28 = 0;
  v9 = -[SUStorePageViewController newViewControllerForPage:ofType:returningError:](&v27, sel_newViewControllerForPage_ofType_returningError_, v8, 1, &v28);
  v10 = v28;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUAccountViewController account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccount:", v11);

    -[SUStorePageViewController authenticationContext](self, "authenticationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAuthenticationContext:", v12);

    objc_msgSend(v9, "_setMescalSession:", self->_mescalSession);
    objc_msgSend(v9, "setStyle:", 1);
    if (-[SUAccountViewController shouldSignRequests](self, "shouldSignRequests"))
      objc_msgSend(v9, "setShouldSignRequests:", 1);
    objc_msgSend(v9, "setTidHeaders:", self->_tidHeaders);
  }
LABEL_30:
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v9;
}

- (BOOL)shouldSignRequests
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[SUAccountViewController style](self, "style") == 1)
    return 1;
  if (-[SUAccountViewController style](self, "style"))
    return 0;
  objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBagForContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUAccountViewController _bagKeyForStyle:](self, "_bagKeyForStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSURL schemeSwizzledURL](self->_accountURL, "schemeSwizzledURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
      v3 = objc_msgSend(v12, "isEqualToString:", v10);
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SUAccountViewControllerDidDisappearNotification"), self);

  v6.receiver = self;
  v6.super_class = (Class)SUAccountViewController;
  -[SUStorePageViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__didEnterBackground_, *MEMORY[0x24BDF7528], 0);

  -[SUAccountViewController _forceOrientationBackToSupportedOrientation](self, "_forceOrientationBackToSupportedOrientation");
  if (-[SUAccountViewController showAccountGlyph](self, "showAccountGlyph"))
  {
    -[SUAccountViewController logoutButton](self, "logoutButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("person.crop.circle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v7, 2, self, sel__logoutPressed_);
      -[SUAccountViewController setLogoutButton:](self, "setLogoutButton:", v8);

      -[SUAccountViewController logoutButton](self, "logoutButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTag:", 424242);

    }
    -[SUViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    -[SUViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAccountViewController logoutButton](self, "logoutButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v12);

  }
  v13.receiver = self;
  v13.super_class = (Class)SUAccountViewController;
  -[SUStorePageViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);

  v6.receiver = self;
  v6.super_class = (Class)SUAccountViewController;
  -[SUStorePageViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (id)navigationItem:(id)a3 willChangeLeftItem:(id)a4 toNewItem:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  if (-[SUAccountViewController showAccountGlyph](self, "showAccountGlyph"))
  {
    -[SUAccountViewController logoutButton](self, "logoutButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (!a5 && v8 != v7)
    {
      -[SUAccountViewController logoutButton](self, "logoutButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)navigationItem:(id)a3 willChangeLeftItems:(id)a4 toNewItems:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  if (-[SUAccountViewController showAccountGlyph](self, "showAccountGlyph"))
  {
    -[SUAccountViewController logoutButton](self, "logoutButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v9) & 1) != 0)
    {
      v10 = 0;
LABEL_7:

      goto LABEL_8;
    }
    v11 = objc_msgSend(v8, "count");

    if (!v11)
    {
      v12 = (void *)MEMORY[0x24BDBCE30];
      -[SUAccountViewController logoutButton](self, "logoutButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

+ (id)_latestAccountViewController
{
  return (id)objc_msgSend((id)__LatestAccountViewController, "object");
}

- (void)_closeMescalSession
{
  SUMescalSession *mescalSession;

  mescalSession = self->_mescalSession;
  self->_mescalSession = 0;

}

- (void)_logoutPressed:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  SUAccountViewController *v26;
  _QWORD v27[5];
  id v28;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __42__SUAccountViewController__logoutPressed___block_invoke;
  v27[3] = &unk_24DE7BBD8;
  v27[4] = self;
  v11 = v6;
  v28 = v11;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 1, v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12);

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_activeiTunesAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[objc_class isAvailableForAccount:](getAMSBiometricsClass(), "isAvailableForAccount:", v14) & 1) == 0)
  {
    v15 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PASSWORD_SETTINGS"), &stru_24DE83F60, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __42__SUAccountViewController__logoutPressed___block_invoke_76;
    v24[3] = &unk_24DE7BBD8;
    v25 = v14;
    v26 = self;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v18);

  }
  v19 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_OF_STORE"), &stru_24DE83F60, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __42__SUAccountViewController__logoutPressed___block_invoke_2;
  v23[3] = &unk_24DE7BC50;
  v23[4] = self;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 2, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v22);

  -[SUAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __42__SUAccountViewController__logoutPressed___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_9;
  LODWORD(v10) = 138543362;
  *(_QWORD *)((char *)&v10 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v10, v9, v10);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog();
LABEL_9:

  }
  return objc_msgSend(*(id *)(a1 + 40), "dismissAnimated:", 1);
}

void __42__SUAccountViewController__logoutPressed___block_invoke_76(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(getAMSUIPasswordSettingsViewControllerClass()), "initWithAccount:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v5);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    objc_msgSend(v2, "setModalPresentationStyle:", 3);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v2, 1, 0);

}

void __42__SUAccountViewController__logoutPressed___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setActive:", 0);
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SUAccountViewController__logoutPressed___block_invoke_3;
  v5[3] = &unk_24DE7BC28;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "saveAccount:withCompletionHandler:", v3, v5);

}

void __42__SUAccountViewController__logoutPressed___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUAccountViewController__logoutPressed___block_invoke_4;
  block[3] = &unk_24DE7BC00;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __42__SUAccountViewController__logoutPressed___block_invoke_4(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
    return;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)v11 = 138543618;
  *(_QWORD *)&v11[4] = v6;
  *(_WORD *)&v11[12] = 2114;
  *(_QWORD *)&v11[14] = v7;
  v8 = v6;
  LODWORD(v10) = 22;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v11, v10, *(_OWORD *)v11, *(_QWORD *)&v11[16]);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_11:

  }
}

- (id)_authenticationQueryParametersForStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 2)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("true"), CFSTR("createSession"), CFSTR("viewAccount"), CFSTR("why"), 0, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_bagKeyForStyle:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("signup");
  if (a3 != 1)
    v3 = 0;
  if (a3 == 2)
    return CFSTR("modifyAccount");
  else
    return (id)v3;
}

- (void)_didEnterBackground:(id)a3
{
  if (!-[SUStorePageViewController didPageViewLoad](self, "didPageViewLoad", a3))
    -[UIViewController dismissAnimated:](self, "dismissAnimated:", 0);
}

- (void)_forceOrientationBackToSupportedOrientation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "statusBarOrientation") - 3) <= 1
    && (-[SUViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") & 0x18) == 0)
  {
    if (!-[SUAccountViewController isViewLoaded](self, "isViewLoaded")
      || (-[SUAccountViewController view](self, "view"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "window"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      -[SUAccountViewController presentedViewController](self, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v4, "_setRotatableViewOrientation:duration:force:", 1, 1, 0.0);

  }
}

- (void)_mescalDidOpenWithSession:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSString *primingSignature;
  SUMescalSession *mescalSession;
  void *v11;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  SUMescalSession *v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  primingSignature = self->_primingSignature;
  self->_primingSignature = 0;

  mescalSession = self->_mescalSession;
  self->_mescalSession = 0;

  v11 = (void *)__LatestAccountViewController;
  __LatestAccountViewController = 0;

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v12, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      v20 &= 2u;
    if (!v7)
    {
      if (v20)
      {
        v35 = 138543362;
        v36 = (id)objc_opt_class();
        v30 = v36;
        LODWORD(v33) = 12;
        v31 = (void *)_os_log_send_and_compose_impl();

        if (v31)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v35, v33);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          free(v31);
          SSFileLog();

        }
      }
      else
      {

      }
      goto LABEL_28;
    }
    if (v20)
    {
      v35 = 138543362;
      v36 = (id)objc_opt_class();
      v34 = v7;
      v22 = v36;
      LODWORD(v33) = 12;
      v23 = (void *)_os_log_send_and_compose_impl();

      v7 = v34;
      if (!v23)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v35, v33);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog();
    }

LABEL_22:
    objc_storeStrong((id *)&self->_mescalSession, a3);
    objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)__LatestAccountViewController;
    __LatestAccountViewController = v24;

    v26 = self->_mescalSession;
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUMescalSession primeForAccountCreationWithData:error:](v26, "primeForAccountCreationWithData:error:", v27, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      v12 = objc_retainAutorelease(v12);
      objc_msgSend(v12, "bytes");
      objc_msgSend(v12, "length");
      v28 = (NSString *)ISCopyEncodedBase64();
      v29 = self->_primingSignature;
      self->_primingSignature = v28;

    }
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v12, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    v16 = v14;
  else
    v16 = v14 & 2;
  if (!v16)
    goto LABEL_11;
  v35 = 138543618;
  v36 = (id)objc_opt_class();
  v37 = 2112;
  v38 = v8;
  v17 = v36;
  LODWORD(v33) = 22;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v35, v33);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog();
LABEL_11:

  }
LABEL_28:

  self->_mescalState = 2;
  -[SUAccountViewController enqueueFetchOperation](self, "enqueueFetchOperation");

}

- (BOOL)_shouldUseWebViewFastPath
{
  return self->_style != 2;
}

- (id)_URLByRemovingBlacklistedParametersWithURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  objc_msgSend(v3, "setWithArray:", &unk_24DEDC6F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copyQueryStringDictionaryWithUnescapedValues:", 0);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __70__SUAccountViewController__URLByRemovingBlacklistedParametersWithURL___block_invoke;
  v22 = &unk_24DE7BC78;
  v8 = v5;
  v23 = v8;
  v9 = v7;
  v24 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v19);
  v10 = objc_alloc(MEMORY[0x24BDD16A8]);
  objc_msgSend(v4, "absoluteString", v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

  objc_msgSend(v4, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v12, "rangeOfString:options:", v13, 4);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v12, "deleteCharactersInRange:", v14, v15);
  }
  if ((objc_msgSend(v12, "hasSuffix:", CFSTR("?")) & 1) == 0)
    objc_msgSend(v12, "appendString:", CFSTR("?"));
  objc_msgSend(MEMORY[0x24BDBCF48], "queryStringForDictionary:escapedValues:", v9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v12, "appendString:", v16);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __70__SUAccountViewController__URLByRemovingBlacklistedParametersWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

- (SUMescalSession)_mescalSession
{
  return self->_mescalSession;
}

- (int64_t)style
{
  return self->_style;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)showAccountGlyph
{
  return self->_showAccountGlyph;
}

- (void)setShowAccountGlyph:(BOOL)a3
{
  self->_showAccountGlyph = a3;
}

- (UIBarButtonItem)logoutButton
{
  return self->_logoutButton;
}

- (void)setLogoutButton:(id)a3
{
  objc_storeStrong((id *)&self->_logoutButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoutButton, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_tidHeaders, 0);
  objc_storeStrong((id *)&self->_primingSignature, 0);
  objc_storeStrong((id *)&self->_mescalSession, 0);
  objc_storeStrong((id *)&self->_accountURL, 0);
}

@end
