@implementation SSAuthenticateRequest

+ (BOOL)_isAuthkitEntitled
{
  int v2;
  __SecTask *v3;
  __SecTask *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  __SecTask *v7;
  __SecTask *v8;
  CFErrorRef error;

  v2 = SSIsDaemon();
  getpid();
  if (!sandbox_check())
  {
    v3 = SecTaskCreateFromSelf(0);
    if (v3)
    {
      v4 = v3;
      error = 0;
      v5 = SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.authkit.client.private"), &error);
      if (error)
        CFRelease(error);
      if (v5)
      {
        CFRelease(v5);
        v2 = 1;
      }
      CFRelease(v4);
    }
    if (v2)
    {
      LODWORD(v6) = 1;
    }
    else
    {
      v7 = SecTaskCreateFromSelf(0);
      if (v7)
      {
        v8 = v7;
        error = 0;
        v6 = SecTaskCopyValueForEntitlement(v7, CFSTR("com.apple.authkit.client.internal"), &error);
        if (error)
          CFRelease(error);
        if (v6)
        {
          CFRelease(v6);
          LODWORD(v6) = 1;
        }
        CFRelease(v8);
      }
      else
      {
        LODWORD(v6) = 0;
      }
    }
    LOBYTE(v2) = (_DWORD)v6 != 0;
  }
  return v2;
}

- (SSAuthenticateRequest)init
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  objc_super v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  v18 = 138543362;
  v19 = (id)objc_opt_class();
  v7 = v19;
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v18, v16);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:

  }
  v17.receiver = self;
  v17.super_class = (Class)SSAuthenticateRequest;
  return -[SSRequest init](&v17, sel_init);
}

- (SSAuthenticateRequest)initWithAccount:(id)a3
{
  id v4;
  SSAuthenticationContext *v5;
  SSAuthenticateRequest *v6;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v5 = -[SSAuthenticationContext initWithAccount:]([SSAuthenticationContext alloc], "initWithAccount:", v4);
    v6 = -[SSAuthenticateRequest initWithAuthenticationContext:](self, "initWithAuthenticationContext:", v5);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSAuthenticateRequest;
    v6 = -[SSRequest init](&v8, sel_init);
  }

  return v6;
}

- (SSAuthenticateRequest)initWithAuthenticationContext:(id)a3
{
  id v4;
  SSAuthenticateRequest *v5;
  uint64_t v6;
  SSAuthenticationContext *authenticationContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSAuthenticateRequest;
  v5 = -[SSRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (SSAuthenticationContext *)v6;

  }
  return v5;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (id)run
{
  SSPromise *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v3 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __28__SSAuthenticateRequest_run__block_invoke;
  v10 = &unk_1E47BAC68;
  objc_copyWeak(&v11, &location);
  -[SSPromise addErrorBlock:](v3, "addErrorBlock:", &v7);
  -[SSPromise completionHandlerAdapter](v3, "completionHandlerAdapter", v7, v8, v9, v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSAuthenticateRequest startWithAuthenticateResponseBlock:](self, "startWithAuthenticateResponseBlock:", v4);

  -[SSPromise resultWithError:](v3, "resultWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __28__SSAuthenticateRequest_run__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
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
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v9 = v7;
  else
    v9 = v7 & 2;
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    v23 = v10;
    objc_msgSend(WeakRetained, "logUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "authenticationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v13);
    v24 = 138544130;
    v25 = v10;
    v26 = 2114;
    v27 = v11;
    v28 = 2114;
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 2112;
    v31 = v3;
    LODWORD(v22) = 42;
    v14 = (void *)_os_log_send_and_compose_impl();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v24, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v5, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);

    }
  }
  else
  {

  }
}

- (void)startWithAuthenticateResponseBlock:(id)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  int v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  id v74;
  void *v75;
  int v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  SSAuthenticateResponse *v88;
  SSAuthenticateResponse *v89;
  uint64_t v90;
  void *v91;
  int v92;
  NSObject *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  id v116;
  _BYTE *v117;
  _BYTE *v118;
  uint64_t v119;
  id v120;
  _QWORD v122[4];
  id v123;
  id v124;
  _QWORD v125[4];
  id v126;
  id v127;
  _QWORD v128[5];
  id v129;
  char v130;
  _QWORD block[4];
  SSAuthenticateResponse *v132;
  id v133;
  id v134;
  _BYTE location[12];
  __int16 v136;
  void *v137;
  __int16 v138;
  id v139;
  __int16 v140;
  void *v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v120 = a3;
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v4 |= 2u;
  objc_msgSend(v3, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v6 = v4;
  else
    v6 = v4 & 2;
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[SSAuthenticateRequest logUUID](self, "logUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAuthenticateRequest authenticationContext](self, "authenticationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAuthenticateRequest authenticationContext](self, "authenticationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138544130;
    *(_QWORD *)&location[4] = v7;
    v136 = 2114;
    v137 = v9;
    v138 = 2112;
    v139 = v10;
    v140 = 2114;
    v141 = v13;
    LODWORD(v119) = 42;
    v117 = location;
    v14 = (void *)_os_log_send_and_compose_impl();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, location, v119);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v3, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);

    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.appstored"));

  if (!-[SSAuthenticationContext forceDaemonAuthentication](self->_authenticationContext, "forceDaemonAuthentication")
    && (objc_msgSend((id)objc_opt_class(), "_isAuthkitEntitled") ^ 1 | v24) != 1
    || +[SSAccountStore unitTestModeEnabled](SSAccountStore, "unitTestModeEnabled", v117))
  {
    v25 = (void *)objc_opt_class();
    -[SSAuthenticateRequest authenticationContext](self, "authenticationContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_accountToAuthenticateWithAuthenticationContext:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v27, "isDemoAccount"))
      goto LABEL_28;
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = objc_msgSend(v28, "shouldLog", v117);
    if (objc_msgSend(v28, "shouldLogToDisk"))
      v29 |= 2u;
    objc_msgSend(v28, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      v31 = v29;
    else
      v31 = v29 & 2;
    if (v31)
    {
      v32 = (void *)objc_opt_class();
      v33 = v32;
      -[SSAuthenticateRequest logUUID](self, "logUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v32;
      v136 = 2114;
      v137 = v34;
      LODWORD(v119) = 22;
      v117 = location;
      v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_27:

LABEL_28:
        if (-[SSAuthenticateRequest _shouldRunAuthenticationForAccount:](self, "_shouldRunAuthenticationForAccount:", v27, v117))
        {
          goto LABEL_83;
        }
        +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v42)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v43 = objc_msgSend(v42, "shouldLog");
        if (objc_msgSend(v42, "shouldLogToDisk"))
          v43 |= 2u;
        objc_msgSend(v42, "OSLogObject");
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          v43 &= 2u;
        if (v43)
        {
          v45 = (void *)objc_opt_class();
          v46 = v45;
          -[SSAuthenticateRequest logUUID](self, "logUUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "hashedDescription");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v45;
          v136 = 2114;
          v137 = v47;
          v138 = 2114;
          v139 = v48;
          LODWORD(v119) = 32;
          v118 = location;
          v49 = (void *)_os_log_send_and_compose_impl();

          if (!v49)
          {
LABEL_39:

            +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v27)
              goto LABEL_65;
            if ((objc_msgSend(v27, "isActive") & 1) != 0)
              goto LABEL_65;
            objc_msgSend(v56, "activeAccount");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v57 == 0;

            if (!v58)
              goto LABEL_65;
            +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v59)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v60 = objc_msgSend(v59, "shouldLog", v118);
            if (objc_msgSend(v59, "shouldLogToDisk"))
              v60 |= 2u;
            objc_msgSend(v59, "OSLogObject");
            v61 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              v60 &= 2u;
            if (v60)
            {
              v62 = (void *)objc_opt_class();
              v63 = v62;
              -[SSAuthenticateRequest logUUID](self, "logUUID");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "hashedDescription");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)location = 138543874;
              *(_QWORD *)&location[4] = v62;
              v136 = 2114;
              v137 = v64;
              v138 = 2114;
              v139 = v65;
              LODWORD(v119) = 32;
              v118 = location;
              v66 = (void *)_os_log_send_and_compose_impl();

              if (!v66)
                goto LABEL_52;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v66, 4, location, v119);
              v61 = objc_claimAutoreleasedReturnValue();
              free(v66);
              SSFileLog(v59, CFSTR("%@"), v67, v68, v69, v70, v71, v72, (uint64_t)v61);
            }

LABEL_52:
            objc_msgSend(v27, "setActive:", 1);
            v134 = 0;
            v73 = objc_msgSend(v56, "saveAccount:verifyCredentials:error:", v27, 0, &v134);
            v74 = v134;
            if ((v73 & 1) != 0)
            {
LABEL_64:

LABEL_65:
              v88 = objc_alloc_init(SSAuthenticateResponse);
              v89 = v88;
              if (v27)
              {
                -[SSAuthenticateResponse setAuthenticatedAccount:](v88, "setAuthenticatedAccount:", v27);
                v90 = 4;
              }
              else
              {
                SSError((uint64_t)CFSTR("SSErrorDomain"), 114, (uint64_t)CFSTR("Nil Account"), (uint64_t)CFSTR("We can't authenticate a nil account."));
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                -[SSAuthenticateResponse setError:](v89, "setError:", v103);

                v90 = 0;
              }
              -[SSAuthenticateResponse setAuthenticateResponseType:](v89, "setAuthenticateResponseType:", v90, v118);

              if (v89)
              {
                if (v120)
                {
                  dispatch_get_global_queue(0, 0);
                  v104 = objc_claimAutoreleasedReturnValue();
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke;
                  block[3] = &unk_1E47B8A98;
                  v133 = v120;
                  v132 = v89;
                  dispatch_async(v104, block);

                }
                -[SSRequest _shutdownRequest](self, "_shutdownRequest");
LABEL_86:

                goto LABEL_87;
              }
LABEL_83:
              -[SSAuthenticateRequest authenticationContext](self, "authenticationContext");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "accountStoreOptions");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = (SSAuthenticateResponse *)objc_msgSend(v106, "mutableCopy");

              -[SSAuthenticateRequest logUUID](self, "logUUID");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              -[SSAuthenticateResponse setObject:forKeyedSubscript:](v89, "setObject:forKeyedSubscript:", v107, CFSTR("SSAccountStoreAuthKitLogUUIDKey"));

              -[SSAuthenticateRequest _parentViewController](self, "_parentViewController");
              v108 = (void *)objc_claimAutoreleasedReturnValue();

              if (v108)
              {
                v109 = (void *)MEMORY[0x1E0CB3B18];
                -[SSAuthenticateRequest _parentViewController](self, "_parentViewController");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "valueWithNonretainedObject:", v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                -[SSAuthenticateResponse setObject:forKeyedSubscript:](v89, "setObject:forKeyedSubscript:", v111, CFSTR("SSAccountStoreAuthKitPresentingViewController"));

              }
              +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "updateAccountWithAuthKit:store:options:", v27, 0, v89);
              v113 = (void *)objc_claimAutoreleasedReturnValue();

              objc_initWeak((id *)location, self);
              v114 = MEMORY[0x1E0C809B0];
              v128[0] = MEMORY[0x1E0C809B0];
              v128[1] = 3221225472;
              v128[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_2;
              v128[3] = &unk_1E47BACB8;
              objc_copyWeak(&v129, (id *)location);
              v130 = 1;
              v128[4] = self;
              objc_msgSend(v113, "thenWithBlock:", v128);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v125[0] = v114;
              v125[1] = 3221225472;
              v125[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_4;
              v125[3] = &unk_1E47BACE0;
              objc_copyWeak(&v127, (id *)location);
              v116 = v120;
              v126 = v116;
              objc_msgSend(v115, "addErrorBlock:", v125);
              v122[0] = v114;
              v122[1] = 3221225472;
              v122[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_7;
              v122[3] = &unk_1E47BAD08;
              objc_copyWeak(&v124, (id *)location);
              v123 = v116;
              objc_msgSend(v115, "addSuccessBlock:", v122);

              objc_destroyWeak(&v124);
              objc_destroyWeak(&v127);

              objc_destroyWeak(&v129);
              objc_destroyWeak((id *)location);

              goto LABEL_86;
            }
            +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v75)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v76 = objc_msgSend(v75, "shouldLog", v118);
            if (objc_msgSend(v75, "shouldLogToDisk"))
              v76 |= 2u;
            objc_msgSend(v75, "OSLogObject");
            v77 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              v76 &= 2u;
            if (v76)
            {
              -[SSAuthenticateRequest logUUID](self, "logUUID");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = (void *)objc_opt_class();
              *(_DWORD *)location = 138543874;
              *(_QWORD *)&location[4] = v78;
              v136 = 2114;
              v137 = v79;
              v138 = 2112;
              v139 = v74;
              v80 = v79;
              LODWORD(v119) = 32;
              v118 = location;
              v81 = (void *)_os_log_send_and_compose_impl();

              if (!v81)
              {
LABEL_63:

                goto LABEL_64;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v81, 4, location, v119);
              v77 = objc_claimAutoreleasedReturnValue();
              free(v81);
              SSFileLog(v75, CFSTR("%@"), v82, v83, v84, v85, v86, v87, (uint64_t)v77);
            }

            goto LABEL_63;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v49, 4, location, v119);
          v44 = objc_claimAutoreleasedReturnValue();
          free(v49);
          SSFileLog(v42, CFSTR("%@"), v50, v51, v52, v53, v54, v55, (uint64_t)v44);
        }

        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v35, 4, location, v119);
      v30 = objc_claimAutoreleasedReturnValue();
      free(v35);
      SSFileLog(v28, CFSTR("%@"), v36, v37, v38, v39, v40, v41, (uint64_t)v30);
    }

    goto LABEL_27;
  }
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v91)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v92 = objc_msgSend(v91, "shouldLog");
  if (objc_msgSend(v91, "shouldLogToDisk"))
    v92 |= 2u;
  objc_msgSend(v91, "OSLogObject");
  v93 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    v92 &= 2u;
  if (!v92)
    goto LABEL_76;
  v94 = (void *)objc_opt_class();
  *(_DWORD *)location = 138543362;
  *(_QWORD *)&location[4] = v94;
  v95 = v94;
  LODWORD(v119) = 12;
  v96 = (void *)_os_log_send_and_compose_impl();

  if (v96)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v96, 4, location, v119);
    v93 = objc_claimAutoreleasedReturnValue();
    free(v96);
    SSFileLog(v91, CFSTR("%@"), v97, v98, v99, v100, v101, v102, (uint64_t)v93);
LABEL_76:

  }
  -[SSAuthenticateRequest _performRemoteAuthenticationWithCompletion:](self, "_performRemoteAuthenticationWithCompletion:", v120);
LABEL_87:

}

uint64_t __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

SSPromise *__60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  SSPromise *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  SSPromise *v13;
  SSPromise *v14;
  SSPromise *v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  SSPromise *v20;
  id v21;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_alloc_init(SSPromise);
  objc_msgSend(v3, "updatedAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_verifyCredentialsOptionsFromUpdateAccountResponse:skipAuthKit:", v3, *(unsigned __int8 *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backingAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_3;
  v17[3] = &unk_1E47BAC90;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  v11 = v3;
  v12 = *(_QWORD *)(a1 + 32);
  v18 = v11;
  v19 = v12;
  v13 = v5;
  v20 = v13;
  objc_msgSend(v10, "verifyCredentialsForAccount:options:completion:", v7, v8, v17);
  v14 = v20;
  v15 = v13;

  objc_destroyWeak(&v21);
  return v15;
}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  SSAuthenticateResponse *v7;
  SSAccount *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v7 = objc_alloc_init(SSAuthenticateResponse);
  -[SSAuthenticateResponse setCredentialSource:](v7, "setCredentialSource:", objc_msgSend(a1[4], "credentialSource"));
  if (v11)
  {
    v8 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v11);
    -[SSAuthenticateResponse setAuthenticatedAccount:](v7, "setAuthenticatedAccount:", v8);

    -[SSAuthenticateResponse setAuthenticateResponseType:](v7, "setAuthenticateResponseType:", 4);
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearCachedAccounts");

    +[SSAccountStore resetExpirationForTokenType:](SSAccountStore, "resetExpirationForTokenType:", objc_msgSend(*((id *)a1[5] + 12), "tokenType"));
  }
  else
  {
    objc_msgSend(a1[5], "_handleDialogFromError:", v5);
    -[SSAuthenticateResponse setAuthenticateResponseType:](v7, "setAuthenticateResponseType:", objc_msgSend(WeakRetained, "_responseTypeForError:", v5));
    -[SSAuthenticateResponse setError:](v7, "setError:", v5);
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAuthenticateResponse setResponseDictionary:](v7, "setResponseDictionary:", v10);

  }
  objc_msgSend(a1[6], "finishWithResult:", v7);

}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  SSAuthenticateResponse *v7;
  void *v8;
  NSObject *v9;
  id v10;
  SSAuthenticateResponse *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  SSAuthenticateResponse *v18;
  _QWORD block[4];
  SSAuthenticateResponse *v20;
  id v21;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CFFF10]);

    if (v6)
    {
      v7 = objc_alloc_init(SSAuthenticateResponse);
      -[SSAuthenticateResponse setAuthenticateResponseType:](v7, "setAuthenticateResponseType:", objc_msgSend(WeakRetained, "_responseTypeForError:", v3));
      -[SSAuthenticateResponse setError:](v7, "setError:", v3);
      objc_msgSend(v3, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSAuthenticateResponse setResponseDictionary:](v7, "setResponseDictionary:", v8);

      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_5;
      block[3] = &unk_1E47B8A98;
      v10 = *(id *)(a1 + 32);
      v20 = v7;
      v21 = v10;
      v11 = v7;
      dispatch_async(v9, block);

    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_6;
      v16 = &unk_1E47B8A98;
      v18 = (SSAuthenticateResponse *)*(id *)(a1 + 32);
      v17 = v3;
      dispatch_async(v12, &v13);

      v11 = v18;
    }

  }
  objc_msgSend(WeakRetained, "_shutdownRequest", v13, v14, v15, v16);

}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v1 + 16))(v1, v2, v3);

}

uint64_t __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_8;
    v10 = &unk_1E47B8A98;
    v12 = v5;
    v11 = v3;
    dispatch_async(v6, &v7);

  }
  objc_msgSend(WeakRetained, "_shutdownRequest", v7, v8, v9, v10);

}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v1 + 16))(v1, v2, v3);

}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__SSAuthenticateRequest_start__block_invoke;
  v3[3] = &unk_1E47BAD30;
  v3[4] = self;
  -[SSAuthenticateRequest startWithAuthenticateResponseBlock:](self, "startWithAuthenticateResponseBlock:", v3);
  return 1;
}

void __30__SSAuthenticateRequest_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSAuthenticateRequest_start__block_invoke_2;
  block[3] = &unk_1E47B87B8;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __30__SSAuthenticateRequest_start__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "authenticateRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SSAuthenticateRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BAD58;
  v7 = v4;
  v5 = v4;
  -[SSAuthenticateRequest startWithAuthenticateResponseBlock:](self, "startWithAuthenticateResponseBlock:", v6);

}

uint64_t __50__SSAuthenticateRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSAuthenticateRequest *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__SSAuthenticateRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

void __40__SSAuthenticateRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "50", *(__CFString **)(*(_QWORD *)(a1 + 40) + 96));
}

- (SSAuthenticateRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSAuthenticateRequest *v6;
  SSAuthenticationContext *v8;
  void *v9;
  uint64_t v10;
  SSAuthenticationContext *authenticationContext;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSAuthenticateRequest;
    v6 = -[SSRequest init](&v12, sel_init);
    if (v6)
    {
      v8 = [SSAuthenticationContext alloc];
      xpc_dictionary_get_value(v5, "50");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSAuthenticationContext initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);
      authenticationContext = v6->_authenticationContext;
      v6->_authenticationContext = (SSAuthenticationContext *)v10;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)logUUID
{
  void *v2;
  void *v3;

  -[SSAuthenticateRequest authenticationContext](self, "authenticationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)_accountToAuthenticateWithAuthenticationContext:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  void *v47;
  SSAccount *v48;
  SSAccount *v49;
  void *v50;
  int v51;
  NSObject *v52;
  int v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  int v67;
  NSObject *v68;
  int v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  NSObject *v87;
  int v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  NSObject *v102;
  int v103;
  void *v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  int v115;
  NSObject *v116;
  int v117;
  void *v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  NSObject *v131;
  int v132;
  void *v133;
  id v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  int v143;
  NSObject *v144;
  int v145;
  void *v146;
  id v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int *v156;
  int *v157;
  int *v158;
  int *v159;
  int *v160;
  int *v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  int v168;
  uint64_t v169;
  __int16 v170;
  void *v171;
  __int16 v172;
  void *v173;
  __int16 v174;
  void *v175;
  __int16 v176;
  void *v177;
  __int16 v178;
  uint64_t v179;
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v163 = a3;
  objc_msgSend(v163, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "requiredUniqueIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = objc_msgSend(v163, "accountScope");
  objc_msgSend(v163, "logUUID");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &off_1E47B6000;
  v165 = (void *)v4;
  if (!v3 && !v4 && !v5)
  {
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "demoAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v13 = v11;
      else
        v13 = v11 & 2;
      if (v13)
      {
        v14 = objc_opt_class();
        AMSHashIfNeeded();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = 138543874;
        v169 = v14;
        v170 = 2114;
        v171 = v166;
        v172 = 2114;
        v173 = v15;
        LODWORD(v162) = 32;
        v156 = &v168;
        v16 = (void *)_os_log_send_and_compose_impl();

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v168, v162);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          free(v16);
          SSFileLog(v9, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);

        }
      }
      else
      {

      }
      v6 = &off_1E47B6000;
    }
  }
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig", v156);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = objc_msgSend(v24, "shouldLog");
  if (objc_msgSend(v24, "shouldLogToDisk"))
    v26 = v25 | 2;
  else
    v26 = v25;
  objc_msgSend(v24, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    v28 = v26;
  else
    v28 = v26 & 2;
  v167 = v5;
  if (v28)
  {
    v29 = (void *)objc_opt_class();
    v30 = v29;
    SSHashIfNeeded(v3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "description");
    v32 = v3;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = 138544642;
    v169 = (uint64_t)v29;
    v170 = 2114;
    v171 = v166;
    v172 = 2114;
    v173 = v31;
    v174 = 2114;
    v175 = v34;
    v176 = 2114;
    v177 = v35;
    v178 = 2048;
    v36 = v164;
    v179 = v164;
    LODWORD(v162) = 62;
    v157 = &v168;
    v37 = (void *)_os_log_send_and_compose_impl();

    v3 = v32;
    v5 = v167;

    v6 = &off_1E47B6000;
    if (!v37)
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, &v168, v162);
    v27 = objc_claimAutoreleasedReturnValue();
    free(v37);
    SSFileLog(v24, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v27);
  }
  else
  {
    v36 = v164;
  }

LABEL_31:
  v44 = (_QWORD *)MEMORY[0x1E0CFD7A8];
  if (!v36)
    v44 = (_QWORD *)MEMORY[0x1E0CFD7A0];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *v44, v157);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v165;
  objc_msgSend(v45, "ams_iTunesAccountWithAltDSID:DSID:username:", v3, v165, v5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v47);
    if (v48)
    {
      v49 = v48;
      objc_msgSend(v6[387], "sharedAccountsAuthenticationConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        objc_msgSend(v6[387], "sharedConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v51 = objc_msgSend(v50, "shouldLog");
      if (objc_msgSend(v50, "shouldLogToDisk"))
        v51 |= 2u;
      objc_msgSend(v50, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        v53 = v51;
      else
        v53 = v51 & 2;
      if (v53)
      {
        v54 = (void *)objc_opt_class();
        v55 = v54;
        -[SSAccount hashedDescription](v49, "hashedDescription");
        v56 = v3;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = 138543874;
        v169 = (uint64_t)v54;
        v170 = 2114;
        v171 = v166;
        v172 = 2114;
        v173 = v57;
        LODWORD(v162) = 32;
        v158 = &v168;
        v58 = (void *)_os_log_send_and_compose_impl();

        v3 = v56;
        v46 = v165;

        v59 = v163;
        if (!v58)
        {
LABEL_58:

          goto LABEL_62;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v58, 4, &v168, v162);
        v52 = objc_claimAutoreleasedReturnValue();
        free(v58);
        SSFileLog(v50, CFSTR("%@"), v60, v61, v62, v63, v64, v65, (uint64_t)v52);
      }
      else
      {
        v59 = v163;
      }

      goto LABEL_58;
    }
  }
  v59 = v163;
  if (!objc_msgSend(v167, "length"))
  {
LABEL_120:
    objc_msgSend(v6[387], "sharedAccountsAuthenticationConfig", v158);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v142)
    {
      objc_msgSend(v6[387], "sharedConfig");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v143 = objc_msgSend(v142, "shouldLog");
    if (objc_msgSend(v142, "shouldLogToDisk"))
      v143 |= 2u;
    objc_msgSend(v142, "OSLogObject");
    v144 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      v145 = v143;
    else
      v145 = v143 & 2;
    if (v145)
    {
      v146 = (void *)objc_opt_class();
      v168 = 138543618;
      v169 = (uint64_t)v146;
      v170 = 2114;
      v171 = v166;
      v147 = v146;
      LODWORD(v162) = 22;
      v148 = (void *)_os_log_send_and_compose_impl();

      if (!v148)
      {
LABEL_131:
        v49 = 0;
        goto LABEL_132;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v148, 4, &v168, v162);
      v144 = objc_claimAutoreleasedReturnValue();
      free(v148);
      SSFileLog(v142, CFSTR("%@"), v149, v150, v151, v152, v153, v154, (uint64_t)v144);
    }

    goto LABEL_131;
  }
  objc_msgSend(v6[387], "sharedAccountsAuthenticationConfig");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v66)
  {
    objc_msgSend(v6[387], "sharedConfig");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67 = objc_msgSend(v66, "shouldLog");
  if (objc_msgSend(v66, "shouldLogToDisk"))
    v67 |= 2u;
  objc_msgSend(v66, "OSLogObject");
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    v69 = v67;
  else
    v69 = v67 & 2;
  if (v69)
  {
    v70 = (void *)objc_opt_class();
    v71 = v70;
    SSHashIfNeeded(v167);
    v72 = v3;
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = 138543874;
    v169 = (uint64_t)v70;
    v170 = 2114;
    v171 = v166;
    v172 = 2114;
    v173 = v73;
    LODWORD(v162) = 32;
    v158 = &v168;
    v74 = (void *)_os_log_send_and_compose_impl();

    v3 = v72;
    v46 = v165;
    v59 = v163;

    v75 = v164;
    if (!v74)
      goto LABEL_61;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v74, 4, &v168, v162);
    v68 = objc_claimAutoreleasedReturnValue();
    free(v74);
    SSFileLog(v66, CFSTR("%@"), v76, v77, v78, v79, v80, v81, (uint64_t)v68);
  }
  else
  {
    v75 = v164;
  }

LABEL_61:
  v49 = objc_alloc_init(SSAccount);
  -[SSAccount setAccountName:](v49, "setAccountName:", v167);
  -[SSAccount setAccountScope:](v49, "setAccountScope:", v75);
  v6 = &off_1E47B6000;
  if (!v49)
    goto LABEL_120;
LABEL_62:
  -[SSAccount altDSID](v49, "altDSID", v158);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v82, "length"))
  {
    objc_msgSend(v59, "altDSID");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = v167;
    if (!v83)
      goto LABEL_77;
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v85)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v86 = objc_msgSend(v85, "shouldLog");
    if (objc_msgSend(v85, "shouldLogToDisk"))
      v86 |= 2u;
    objc_msgSend(v85, "OSLogObject");
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      v88 = v86;
    else
      v88 = v86 & 2;
    if (v88)
    {
      v89 = (void *)objc_opt_class();
      v168 = 138543618;
      v169 = (uint64_t)v89;
      v170 = 2114;
      v171 = v166;
      v90 = v89;
      LODWORD(v162) = 22;
      v159 = &v168;
      v91 = (void *)_os_log_send_and_compose_impl();

      if (!v91)
      {
LABEL_75:

        objc_msgSend(v59, "altDSID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSAccount setAltDSID:](v49, "setAltDSID:", v82);
        goto LABEL_76;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v91, 4, &v168, v162);
      v87 = objc_claimAutoreleasedReturnValue();
      free(v91);
      SSFileLog(v85, CFSTR("%@"), v92, v93, v94, v95, v96, v97, (uint64_t)v87);
    }

    goto LABEL_75;
  }
LABEL_76:
  v84 = v167;

LABEL_77:
  -[SSAccount uniqueIdentifier](v49, "uniqueIdentifier", v159);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v98)
  {
    objc_msgSend(v59, "requiredUniqueIdentifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v99)
      goto LABEL_92;
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v100)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v101 = objc_msgSend(v100, "shouldLog");
    if (objc_msgSend(v100, "shouldLogToDisk"))
      v101 |= 2u;
    objc_msgSend(v100, "OSLogObject");
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
      v103 = v101;
    else
      v103 = v101 & 2;
    if (v103)
    {
      v104 = (void *)objc_opt_class();
      v168 = 138543618;
      v169 = (uint64_t)v104;
      v170 = 2114;
      v171 = v166;
      v105 = v104;
      LODWORD(v162) = 22;
      v160 = &v168;
      v106 = (void *)_os_log_send_and_compose_impl();

      if (!v106)
      {
LABEL_90:

        objc_msgSend(v59, "requiredUniqueIdentifier");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSAccount setUniqueIdentifier:](v49, "setUniqueIdentifier:", v98);
        v84 = v167;
        goto LABEL_91;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v106, 4, &v168, v162);
      v102 = objc_claimAutoreleasedReturnValue();
      free(v106);
      SSFileLog(v100, CFSTR("%@"), v107, v108, v109, v110, v111, v112, (uint64_t)v102);
    }

    goto LABEL_90;
  }
LABEL_91:

LABEL_92:
  if (objc_msgSend(v84, "length", v160))
    -[SSAccount setAccountName:](v49, "setAccountName:", v84);
  objc_msgSend(v59, "password");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (v113)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v114)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v115 = objc_msgSend(v114, "shouldLog");
    if (objc_msgSend(v114, "shouldLogToDisk"))
      v115 |= 2u;
    objc_msgSend(v114, "OSLogObject");
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
      v117 = v115;
    else
      v117 = v115 & 2;
    if (v117)
    {
      v118 = (void *)objc_opt_class();
      v168 = 138543618;
      v169 = (uint64_t)v118;
      v170 = 2114;
      v171 = v166;
      v119 = v118;
      LODWORD(v162) = 22;
      v161 = &v168;
      v120 = (void *)_os_log_send_and_compose_impl();

      if (!v120)
      {
LABEL_106:

        objc_msgSend(v59, "password");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSAccount setRawPassword:](v49, "setRawPassword:", v127);

        v84 = v167;
        goto LABEL_107;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v120, 4, &v168, v162);
      v116 = objc_claimAutoreleasedReturnValue();
      free(v120);
      SSFileLog(v114, CFSTR("%@"), v121, v122, v123, v124, v125, v126, (uint64_t)v116);
    }

    goto LABEL_106;
  }
LABEL_107:
  objc_msgSend(v59, "passwordEquivalentToken", v161);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (v128)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v129)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v130 = objc_msgSend(v129, "shouldLog");
    if (objc_msgSend(v129, "shouldLogToDisk"))
      v130 |= 2u;
    objc_msgSend(v129, "OSLogObject");
    v131 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
      v132 = v130;
    else
      v132 = v130 & 2;
    if (v132)
    {
      v133 = (void *)objc_opt_class();
      v168 = 138543618;
      v169 = (uint64_t)v133;
      v170 = 2114;
      v171 = v166;
      v134 = v133;
      LODWORD(v162) = 22;
      v135 = (void *)_os_log_send_and_compose_impl();

      if (!v135)
      {
LABEL_119:

        objc_msgSend(v59, "passwordEquivalentToken");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSAccount setPasswordEquivalentToken:](v49, "setPasswordEquivalentToken:", v142);
LABEL_132:

        v84 = v167;
        goto LABEL_133;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v135, 4, &v168, v162);
      v131 = objc_claimAutoreleasedReturnValue();
      free(v135);
      SSFileLog(v129, CFSTR("%@"), v136, v137, v138, v139, v140, v141, (uint64_t)v131);
    }

    goto LABEL_119;
  }
LABEL_133:

  return v49;
}

- (void)_handleDialogFromError:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  int v28;
  NSObject *v29;
  int v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  int v44;
  int v45;
  NSObject *v46;
  int v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  SSAuthenticateRequest *v60;
  _QWORD v61[5];
  id v62;
  id v63;
  int v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CFD7B8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFD7B8]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v63);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v63;

    if (!v11)
    {
LABEL_18:

      v7 = v10;
      goto LABEL_19;
    }
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    v60 = self;
    if (v14)
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      -[SSAuthenticateRequest logUUID](self, "logUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138543874;
      v65 = v16;
      v66 = 2114;
      v67 = v18;
      v68 = 2114;
      v69 = v11;
      LODWORD(v59) = 32;
      v58 = &v64;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_17:

        v10 = 0;
        self = v60;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v64, v59);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog(v12, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v15);
    }

    goto LABEL_17;
  }
LABEL_19:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = objc_msgSend(v41, "shouldLog", v58);
    if (objc_msgSend(v41, "shouldLogToDisk"))
      v45 = v44 | 2;
    else
      v45 = v44;
    objc_msgSend(v41, "OSLogObject");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      v47 = v45;
    else
      v47 = v45 & 2;
    if (v47)
    {
      v48 = (void *)objc_opt_class();
      v49 = v48;
      -[SSAuthenticateRequest logUUID](self, "logUUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138543874;
      v65 = v48;
      v66 = 2114;
      v67 = v50;
      v68 = 2112;
      v69 = v7;
      LODWORD(v59) = 32;
      v51 = (void *)_os_log_send_and_compose_impl();

      if (!v51)
        goto LABEL_46;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v51, 4, &v64, v59);
      v46 = objc_claimAutoreleasedReturnValue();
      free(v51);
      SSFileLog(v41, CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v46);
    }

    goto LABEL_46;
  }
  if (v7)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = objc_msgSend(v26, "shouldLog", v58);
    if (objc_msgSend(v26, "shouldLogToDisk"))
      v28 = v27 | 2;
    else
      v28 = v27;
    objc_msgSend(v26, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      v30 = v28;
    else
      v30 = v28 & 2;
    if (v30)
    {
      v31 = (void *)objc_opt_class();
      v32 = v31;
      -[SSAuthenticateRequest logUUID](self, "logUUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138543874;
      v65 = v31;
      v66 = 2114;
      v67 = v33;
      v68 = 2112;
      v69 = v7;
      LODWORD(v59) = 32;
      v34 = (void *)_os_log_send_and_compose_impl();

      if (!v34)
      {
LABEL_33:

        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC48]), "initWithRequest:", v7);
        objc_msgSend(v41, "present");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __48__SSAuthenticateRequest__handleDialogFromError___block_invoke;
        v61[3] = &unk_1E47BAD80;
        v61[4] = self;
        v62 = v7;
        v43 = v7;
        objc_msgSend(v42, "addFinishBlock:", v61);

LABEL_46:
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, 4, &v64, v59);
      v29 = objc_claimAutoreleasedReturnValue();
      free(v34);
      SSFileLog(v26, CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v29);
    }

    goto LABEL_33;
  }
LABEL_47:

}

void __48__SSAuthenticateRequest__handleDialogFromError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "logUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v26 = 138544130;
      v27 = v11;
      v28 = 2114;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      v32 = 2114;
      v33 = v6;
      LODWORD(v25) = 42;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v26, v25);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v7, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v10);
    }

    goto LABEL_13;
  }
LABEL_14:
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDAE0]), "initWithRequest:result:error:bag:", *(_QWORD *)(a1 + 40), v5, v6, 0);
  v24 = (id)objc_msgSend(v23, "perform");

}

- (void)_performRemoteAuthenticationWithCompletion:(id)a3
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
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      v21 = 136446210;
      v22 = "-[SSAuthenticateRequest _performRemoteAuthenticationWithCompletion:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke;
  v19[3] = &unk_1E47BADA8;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 133, v19);

}

void __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SSAuthenticateResponse *v5;
  void *v6;
  SSAuthenticateResponse *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  NSObject *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  int *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  _QWORD block[4];
  SSAuthenticateResponse *v62;
  id v63;
  id v64;
  int v65;
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v12, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      v25 &= 2u;
    if (v25)
    {
      v65 = 138543362;
      v66 = (id)objc_opt_class();
      v27 = v66;
      LODWORD(v56) = 12;
      v55 = &v65;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_25:
        v7 = 0;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, &v65, v56);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog(v12, CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v26);
    }

    goto LABEL_25;
  }
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCachedAccounts");

  v5 = [SSAuthenticateResponse alloc];
  xpc_dictionary_get_value(v3, "1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SSAuthenticateResponse initWithXPCEncoding:](v5, "initWithXPCEncoding:", v6);

  v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v3, "2");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithXPCEncoding:", v9);

  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      v65 = 138543618;
      v66 = (id)objc_opt_class();
      v67 = 2112;
      v68 = v10;
      v16 = v66;
      LODWORD(v56) = 22;
      v55 = &v65;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
        goto LABEL_39;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v65, v56);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog(v12, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v15);
    }

  }
  else
  {
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v36 = v35 | 2;
    else
      v36 = v35;
    objc_msgSend(v12, "OSLogObject");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      v38 = v36;
    else
      v38 = v36 & 2;
    if (v38)
    {
      v39 = (void *)objc_opt_class();
      v59 = a1;
      v40 = *(void **)(a1 + 32);
      v60 = v39;
      objc_msgSend(v40, "logUUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSAuthenticateResponse authenticatedAccount](v7, "authenticatedAccount");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "accountName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v57);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SSAuthenticateResponse authenticateResponseType](v7, "authenticateResponseType");
      -[SSAuthenticateResponse error](v7, "error");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 138544386;
      v66 = v39;
      v67 = 2114;
      v68 = v41;
      v69 = 2114;
      v70 = v42;
      v71 = 2048;
      v72 = v43;
      v73 = 2112;
      v74 = v44;
      LODWORD(v56) = 52;
      v55 = &v65;
      v45 = (void *)_os_log_send_and_compose_impl();

      if (v45)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v45, 4, &v65, v56);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        free(v45);
        SSFileLog(v12, CFSTR("%@"), v47, v48, v49, v50, v51, v52, (uint64_t)v46);

      }
      v10 = 0;
      a1 = v59;
    }
    else
    {

      v10 = 0;
    }
  }
LABEL_39:

  v53 = *(void **)(a1 + 40);
  if (v53)
  {
    dispatch_get_global_queue(0, 0);
    v54 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke_60;
    block[3] = &unk_1E47B8608;
    v64 = v53;
    v62 = v7;
    v63 = v10;
    dispatch_async(v54, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v55);

}

uint64_t __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke_60(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int64_t)_responseTypeForError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  NSObject *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  int v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  if (v5 == 5001)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    objc_msgSend(v6, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      v21 &= 2u;
    if (v21)
    {
      v23 = (void *)objc_opt_class();
      v24 = v23;
      -[SSAuthenticateRequest logUUID](self, "logUUID");
      v57 = 138543618;
      v58 = v23;
      v59 = 2114;
      v60 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = 22;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_27:
        v19 = 3;
        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v57, v56);
      v22 = objc_claimAutoreleasedReturnValue();
      free(v25);
      SSFileLog(v6, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v22);
    }

    goto LABEL_27;
  }
  if (v5 == -5000)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v33 = v32 | 2;
    else
      v33 = v32;
    objc_msgSend(v6, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      v33 &= 2u;
    if (v33)
    {
      v35 = (void *)objc_opt_class();
      v36 = v35;
      -[SSAuthenticateRequest logUUID](self, "logUUID");
      v57 = 138543618;
      v58 = v35;
      v59 = 2114;
      v60 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = 22;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_39:
        v19 = 1;
        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, &v57, v56);
      v34 = objc_claimAutoreleasedReturnValue();
      free(v37);
      SSFileLog(v6, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v34);
    }

    goto LABEL_39;
  }
  if (v5 != -7003)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v45 = v44 | 2;
    else
      v45 = v44;
    objc_msgSend(v6, "OSLogObject");
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      v45 &= 2u;
    if (v45)
    {
      v47 = (void *)objc_opt_class();
      v48 = v47;
      -[SSAuthenticateRequest logUUID](self, "logUUID");
      v57 = 138543874;
      v58 = v47;
      v59 = 2114;
      v60 = (id)objc_claimAutoreleasedReturnValue();
      v61 = 2112;
      v62 = v4;
      LODWORD(v56) = 32;
      v19 = _os_log_send_and_compose_impl();

      if (!v19)
        goto LABEL_51;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v57, v56);
      v46 = objc_claimAutoreleasedReturnValue();
      free((void *)v19);
      SSFileLog(v6, CFSTR("%@"), v49, v50, v51, v52, v53, v54, (uint64_t)v46);
    }

    v19 = 0;
    goto LABEL_51;
  }
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
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
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (!v8)
    goto LABEL_14;
  v10 = (void *)objc_opt_class();
  v11 = v10;
  -[SSAuthenticateRequest logUUID](self, "logUUID");
  v57 = 138543618;
  v58 = v10;
  v59 = 2114;
  v60 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v56) = 22;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v57, v56);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v9);
LABEL_14:

  }
  v19 = 2;
LABEL_51:

  return v19;
}

- (BOOL)_shouldRunAuthenticationForAccount:(id)a3
{
  id v4;
  int64_t v5;
  int v6;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  v5 = -[SSAuthenticationContext promptStyle](self->_authenticationContext, "promptStyle");
  if (v5 == 1)
    goto LABEL_7;
  if (v5 == 1001)
  {
LABEL_8:
    v6 = objc_msgSend(v4, "isAuthenticated") ^ 1;
    goto LABEL_9;
  }
  if (v5 != 1000)
  {
    if (+[SSAccountStore isExpiredForTokenType:](SSAccountStore, "isExpiredForTokenType:", -[SSAuthenticationContext tokenType](self->_authenticationContext, "tokenType")))
    {
LABEL_7:
      LOBYTE(v6) = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  LOBYTE(v6) = 0;
LABEL_9:

  return v6;
}

- (id)_verifyCredentialsOptionsFromUpdateAccountResponse:(id)a3 skipAuthKit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  -[SSAuthenticateRequest authenticationContext](self, "authenticationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountStoreOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8F340]);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v6, "credentialSource");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("SSAccountStoreAuthKitCredentialSource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("SSAccountStoreAuthKitSkipAuthKitKey"));

  -[SSAuthenticateRequest logUUID](self, "logUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[SSAuthenticateRequest logUUID](self, "logUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("SSAccountStoreAuthKitLogUUIDKey"));

  }
  return v9;
}

- (SSLogConfig)logConfig
{
  return self->_logConfig;
}

- (void)setLogConfig:(id)a3
{
  objc_storeStrong((id *)&self->_logConfig, a3);
}

- (UIViewController)_parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__parentViewController);
}

- (void)set_parentViewController:(id)a3
{
  objc_storeWeak((id *)&self->__parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__parentViewController);
  objc_storeStrong((id *)&self->_logConfig, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
