@implementation ISProtocolDataProvider

- (ISProtocolDataProvider)init
{
  ISProtocolDataProvider *result;
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISProtocolDataProvider;
  result = -[ISDataProvider init](&v4, sel_init);
  if (result)
  {
    result->_shouldPostFooterSectionChanged = 1;
    result->_shouldProcessAccount = 1;
    result->_shouldProcessAuthenticationDialogs = 1;
    result->_shouldProcessDialogs = 1;
    result->_shouldProcessDialogsOutsideDaemon = 0;
    result->_shouldProcessProtocol = 1;
    result->_shouldTriggerDownloads = 1;
  }
  return result;
}

- (BOOL)processDialogFromDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ISDialog *v18;
  void *v19;
  ISDialog *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  ISProtocolDataProvider *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  int v39;
  void *v40;
  char v41;
  void *v42;
  _BOOL4 v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v50;
  BOOL v51;
  int *v53;
  uint64_t v54;
  id *v55;
  int v56;
  int v57;
  _BOOL4 v58;
  void *v59;
  id obj;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  ISProtocolDataProvider *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  int v75;
  void *v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  -[ISDataProvider authenticationContext](self, "authenticationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)MEMORY[0x24BEB1D88];
  -[ISDataProvider response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsSilentAuthentication:", objc_msgSend(v8, "URLResponseAllowsSilentAuthentication:", v9));

  LODWORD(v8) = -[ISProtocolDataProvider shouldProcessAuthenticationDialogs](self, "shouldProcessAuthenticationDialogs");
  v58 = -[ISProtocolDataProvider shouldProcessTouchIDDialogs](self, "shouldProcessTouchIDDialogs");
  if (!(_DWORD)v8)
    goto LABEL_4;
  if (v7)
  {
    if (objc_msgSend(v7, "promptStyle") == 1000)
    {
LABEL_4:
      v56 = 0;
      goto LABEL_8;
    }
    v10 = objc_msgSend(v7, "shouldSuppressDialogs") ^ 1;
  }
  else
  {
    v10 = 1;
  }
  v56 = v10;
LABEL_8:
  if (-[ISProtocolDataProvider shouldProcessDialogs](self, "shouldProcessDialogs"))
    v57 = objc_msgSend(v7, "shouldSuppressDialogs") ^ 1;
  else
    v57 = 0;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DF0]), "initWithResponseDictionary:", v61);
  objc_msgSend(v64, "actionsWithActionType:", *MEMORY[0x24BEB2A18]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v63)
  {
    v65 = self;
    v55 = a4;
    v11 = 0;
    v62 = *(_QWORD *)v72;
    v59 = v7;
LABEL_13:
    v12 = 0;
    v13 = v11;
    while (1)
    {
      if (*(_QWORD *)v72 != v62)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v12);
      -[ISProtocolDataProvider _metricsDictionaryForResponse:](v65, "_metricsDictionaryForResponse:", v64, v53, v54);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB1DC8], "dialogIdForMetricsDictionary:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dialog");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [ISDialog alloc];
      objc_msgSend(v17, "dialogDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[ISDialog initWithDialogDictionary:authenticationContext:](v18, "initWithDialogDictionary:authenticationContext:", v19, v7);

      -[ISDialog paymentSheet](v20, "paymentSheet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDialogId:", v16);

      -[ISDialog paymentSheet](v20, "paymentSheet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPresentingSceneIdentifier:", v65->_presentingSceneIdentifier);

      if (!v20)
      {
        v31 = 1;
LABEL_33:
        v11 = v13;
        goto LABEL_49;
      }
      v70 = v13;
      v23 = -[ISProtocolDataProvider _shouldFailWithTokenErrorForDialog:dictionary:error:](v65, "_shouldFailWithTokenErrorForDialog:dictionary:error:", v20, v61, &v70);
      v11 = v70;

      if (v23)
        break;
      if (-[ISDialog kind](v20, "kind") != 1)
      {
        if (v57)
          -[ISProtocolDataProvider _presentDialog:](v65, "_presentDialog:", v20);
LABEL_48:
        v31 = 1;
        goto LABEL_49;
      }
      if (!v58)
      {
        if (!v56)
          goto LABEL_48;
        -[ISDataProvider biometricSessionDelegate](v65, "biometricSessionDelegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_opt_respondsToSelector();

        if ((v41 & 1) != 0)
        {
          -[ISDataProvider biometricSessionDelegate](v65, "biometricSessionDelegate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "sender:didFallbackToPassword:", v65, 1);

        }
        v66 = v11;
        v31 = -[ISDataProvider runAuthorizationDialog:error:](v65, "runAuthorizationDialog:error:", v20, &v66);
        v13 = v66;

        goto LABEL_33;
      }
      v32 = v65;
      -[ISProtocolDataProvider _touchIDDialogForResponse:](v65, "_touchIDDialogForResponse:", v64);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "paymentSheet");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDialogId:", v16);

      objc_msgSend(v33, "paymentSheet");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      objc_msgSend(v35, "setPresentingSceneIdentifier:", v65->_presentingSceneIdentifier);

      -[ISProtocolDataProvider _checkBiometricFailureForResponse:](v65, "_checkBiometricFailureForResponse:", v61);
      v69 = v11;
      v37 = -[ISDataProvider runTouchIDAuthorizationDialog:fallbackDialog:metricsDictionary:error:](v65, "runTouchIDAuthorizationDialog:fallbackDialog:metricsDictionary:error:", v33, v20, v15, &v69);
      v38 = v69;

      if (v38)
        v39 = 1;
      else
        v39 = v37;
      if (((v39 | v56 ^ 1) & 1) != 0)
      {
        if ((v37 & 1) != 0)
        {
          v11 = v38;
LABEL_58:

          v31 = 1;
          goto LABEL_31;
        }
        v32 = v65;
        if ((-[ISProtocolDataProvider _shouldAttemptPasswordPaymentSheetForError:](v65, "_shouldAttemptPasswordPaymentSheetForError:", v38) & v56) == 1)
        {
          v67 = v38;
          v44 = -[ISDataProvider runAuthorizationDialog:error:](v65, "runAuthorizationDialog:error:", v20, &v67);
          v11 = v67;

          if (v44)
          {
LABEL_56:
            -[ISDataProvider biometricAuthenticationContext](v32, "biometricAuthenticationContext");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setDidFallbackToPassword:", 1);

            -[ISDataProvider biometricSessionDelegate](v32, "biometricSessionDelegate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_opt_respondsToSelector();

            if ((v47 & 1) != 0)
            {
              -[ISDataProvider biometricSessionDelegate](v65, "biometricSessionDelegate");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "sender:didFallbackToPassword:", v65, 1);

            }
            goto LABEL_58;
          }
        }
        else
        {
          v11 = v38;
        }
      }
      else
      {
        v68 = 0;
        v43 = -[ISDataProvider runAuthorizationDialog:error:](v65, "runAuthorizationDialog:error:", v20, &v68);
        v11 = v68;
        if (v43)
          goto LABEL_56;
      }

LABEL_30:
      v31 = 0;
LABEL_31:
      v7 = v59;
LABEL_49:

      if (!v31)
      {
        v50 = obj;

        if (v55)
        {
          v11 = objc_retainAutorelease(v11);
          v51 = 0;
          *v55 = v11;
        }
        else
        {
          v51 = 0;
        }
        goto LABEL_68;
      }
      ++v12;
      v13 = v11;
      if (v63 == v12)
      {
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        v63 = v49;
        if (v49)
          goto LABEL_13;
        goto LABEL_66;
      }
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = objc_msgSend(v24, "shouldLog");
    if (objc_msgSend(v24, "shouldLogToDisk"))
      v26 = v25 | 2;
    else
      v26 = v25;
    objc_msgSend(v24, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      v26 &= 2u;
    if (v26)
    {
      v28 = (void *)objc_opt_class();
      v75 = 138543618;
      v76 = v28;
      v77 = 2112;
      v78 = v11;
      v29 = v28;
      LODWORD(v54) = 22;
      v53 = &v75;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v75, v54);
      v27 = objc_claimAutoreleasedReturnValue();
      free(v30);
      v53 = (int *)v27;
      SSFileLog();
    }

    goto LABEL_29;
  }
  v11 = 0;
LABEL_66:
  v50 = obj;

  v51 = 1;
LABEL_68:

  return v51;
}

- (BOOL)processDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  int *v39;
  int *v40;
  uint64_t v41;
  BOOL v42;
  id v43;
  void *v44;
  id *v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  _BYTE v54[128];
  int v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[ISProtocolDataProvider shouldProcessProtocol](self, "shouldProcessProtocol"))
  {
    v13 = 0;
    v14 = 1;
    goto LABEL_46;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DF0]), "initWithResponseDictionary:", v6);
  v45 = a4;
  v46 = v6;
  if ((objc_msgSend(v7, "isSupportedProtocolVersion") & 1) == 0)
  {
    objc_msgSend(v7, "versionMismatchURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v19 = v17;
    else
      v19 = v17 & 2;
    if (v19)
    {
      v55 = 138412546;
      v56 = (id)objc_opt_class();
      v57 = 2112;
      v58 = v10;
      v20 = v56;
      LODWORD(v41) = 22;
      v39 = &v55;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_18:

        -[ISDataProvider setRedirectURL:](self, "setRedirectURL:", v10);
        v12 = 0;
        v11 = v10 != 0;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v55, v41);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v21);
      v39 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_18;
  }
  v53 = 0;
  v8 = -[ISProtocolDataProvider processDialogFromDictionary:error:](self, "processDialogFromDictionary:error:", v6, &v53);
  v9 = v53;
  v10 = v9;
  if (!v8)
  {
    v43 = v9;
    v42 = 0;
    goto LABEL_21;
  }
  -[ISProtocolDataProvider _performActionsForResponse:](self, "_performActionsForResponse:", v7);
  v52 = v10;
  v11 = -[ISProtocolDataProvider _processFailureTypeFromDictionary:error:](self, "_processFailureTypeFromDictionary:error:", v6, &v52);
  v12 = v52;
LABEL_19:
  v42 = v11;

  v43 = v12;
LABEL_21:
  v44 = v7;
  objc_msgSend(v7, "pingURLs", v39);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (!v22)
    goto LABEL_40;
  v23 = v22;
  v24 = *(_QWORD *)v49;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v49 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v40);
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
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        v31 = v29;
      else
        v31 = v29 & 2;
      if (v31)
      {
        v32 = (void *)objc_opt_class();
        v55 = 138412546;
        v56 = v32;
        v57 = 2112;
        v58 = v26;
        v33 = v32;
        LODWORD(v41) = 22;
        v40 = &v55;
        v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34)
          goto LABEL_38;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v34, 4, &v55, v41);
        v30 = objc_claimAutoreleasedReturnValue();
        free(v34);
        v40 = (int *)v30;
        SSFileLog();
      }

LABEL_38:
      +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISStoreURLOperation pingOperationWithUrl:](ISStoreURLOperation, "pingOperationWithUrl:", v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addOperation:", v36);

    }
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  }
  while (v23);
LABEL_40:

  v14 = v42;
  if (v45)
    v37 = v42;
  else
    v37 = 1;
  if ((v37 & 1) != 0)
  {
    v6 = v46;
    v13 = v43;
  }
  else
  {
    v13 = objc_retainAutorelease(v43);
    v14 = 0;
    *v45 = v13;
    v6 = v46;
  }
LABEL_46:

  return v14;
}

- (BOOL)shouldProcessTouchIDDialogs
{
  void *v2;
  BOOL v3;

  -[ISDataProvider biometricAuthenticationContext](self, "biometricAuthenticationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  id v12;
  _BOOL4 v13;
  id v14;
  BOOL v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  int *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ISDataProvider contentType](self, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v7 != 0;
  if (v7 && objc_msgSend(v7, "rangeOfString:options:", CFSTR("application/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v41 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v41);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v41;
    if (v9)
      goto LABEL_8;
  }
  if (!v10)
  {
    if (v6)
    {
      v40 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v40);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v40;

      v11 = v12;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    objc_msgSend(v22, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      v24 &= 2u;
    if (v24)
    {
      v26 = (void *)objc_opt_class();
      v42 = 138412290;
      v43 = v26;
      v27 = v26;
      LODWORD(v38) = 12;
      v37 = &v42;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_33:

LABEL_34:
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v37);
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
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          v31 &= 2u;
        if (v31)
        {
          v33 = (void *)objc_opt_class();
          v42 = 138412546;
          v43 = v33;
          v44 = 2112;
          v45 = v11;
          v34 = v33;
          LODWORD(v38) = 22;
          v35 = (void *)_os_log_send_and_compose_impl();

          if (!v35)
          {
LABEL_45:

            SSError();
            v14 = (id)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            goto LABEL_46;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v42, v38);
          v32 = objc_claimAutoreleasedReturnValue();
          free(v35);
          SSFileLog();
        }

        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v42, v38);
      v25 = objc_claimAutoreleasedReturnValue();
      free(v28);
      v37 = (int *)v25;
      SSFileLog();
    }

    goto LABEL_33;
  }
LABEL_8:
  if (!v10)
    goto LABEL_34;
  v39 = v11;
  v13 = -[ISProtocolDataProvider processDictionary:error:](self, "processDictionary:error:", v10, &v39);
  v14 = v39;

  if (v13)
  {
    -[ISDataProvider setOutput:](self, "setOutput:", v10);
    v15 = 1;
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v17 = v16 | 2;
  else
    v17 = v16;
  objc_msgSend(v11, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    v17 &= 2u;
  if (v17)
  {
    v19 = (void *)objc_opt_class();
    v42 = 138412546;
    v43 = v19;
    v44 = 2112;
    v45 = v14;
    v20 = v19;
    LODWORD(v38) = 22;
    v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21)
      goto LABEL_46;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v42, v38);
    v18 = objc_claimAutoreleasedReturnValue();
    free(v21);
    SSFileLog();
  }

LABEL_46:
  -[ISDataProvider setOutput:](self, "setOutput:", v10);
  if (a4)
  {
    v14 = objc_retainAutorelease(v14);
    v15 = 0;
    *a4 = v14;
  }
  else
  {
    v15 = 0;
  }
LABEL_49:

  return v15;
}

- (void)_presentDialog:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((SSIsDaemon() & 1) != 0
    || -[ISProtocolDataProvider shouldProcessDialogsOutsideDaemon](self, "shouldProcessDialogsOutsideDaemon"))
  {
    +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISDialogOperation operationWithDialog:](ISDialogOperation, "operationWithDialog:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addOperation:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("ISDialogReceivedNotification"), v6);
  }

}

- (void)_checkDownloadQueues
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[ISProtocolDataProvider shouldTriggerDownloads](self, "shouldTriggerDownloads"))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    objc_msgSend(v2, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      v4 &= 2u;
    if (v4)
    {
      LODWORD(v9) = 138412290;
      *(_QWORD *)((char *)&v9 + 4) = objc_opt_class();
      v6 = *(id *)((char *)&v9 + 4);
      LODWORD(v8) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_13:

        objc_msgSend(MEMORY[0x24BEB1E18], "_triggerDownloads");
        return;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog();
    }

    goto LABEL_13;
  }
}

- (void)_checkBiometricFailureForResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  _BYTE v55[22];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEB1E98];
  v5 = a3;
  objc_msgSend(v4, "sharediTunesStoreConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    v8 &= 2u;
  if (v8)
  {
    *(_DWORD *)v55 = 138543362;
    *(_QWORD *)&v55[4] = objc_opt_class();
    v10 = *(id *)&v55[4];
    LODWORD(v54) = 12;
    v52 = v55;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v55, v54, *(_OWORD *)v55);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    v52 = v9;
    SSFileLog();
  }

LABEL_12:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dialog"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("okButtonAction"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("buyParams"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v14, 1);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hasFailedTouchIDChallenge"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "lowercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("true"));

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v52);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v19, "shouldLog");
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v21 = v20 | 2;
  else
    v21 = v20;
  objc_msgSend(v19, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    v21 &= 2u;
  if (v21)
  {
    v23 = (void *)objc_opt_class();
    v24 = (void *)MEMORY[0x24BDD16E0];
    v25 = v23;
    objc_msgSend(v24, "numberWithBool:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v55 = 138543618;
    *(_QWORD *)&v55[4] = v23;
    *(_WORD *)&v55[12] = 2114;
    *(_QWORD *)&v55[14] = v26;
    LODWORD(v54) = 22;
    v53 = v55;
    v27 = (void *)_os_log_send_and_compose_impl();

    if (!v27)
      goto LABEL_35;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v27, 4, v55, v54);
    v22 = objc_claimAutoreleasedReturnValue();
    free(v27);
    v53 = v22;
    SSFileLog();
  }

LABEL_35:
  if ((_DWORD)v18)
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activeAccount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[ISDataProvider biometricAuthenticationContext](self, "biometricAuthenticationContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "accountName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      goto LABEL_49;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = objc_msgSend(v32, "shouldLog", v53);
    if (objc_msgSend(v32, "shouldLogToDisk"))
      v34 = v33 | 2;
    else
      v34 = v33;
    objc_msgSend(v32, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      v34 &= 2u;
    if (v34)
    {
      v36 = (void *)objc_opt_class();
      *(_DWORD *)v55 = 138543362;
      *(_QWORD *)&v55[4] = v36;
      v37 = v36;
      LODWORD(v54) = 12;
      v53 = v55;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_48:

        -[ISDataProvider biometricAuthenticationContext](self, "biometricAuthenticationContext");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "accountName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setAccountName:", v40);

LABEL_49:
        -[ISDataProvider biometricAuthenticationContext](self, "biometricAuthenticationContext", v53);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "accountIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
LABEL_62:

          goto LABEL_63;
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v44 = objc_msgSend(v43, "shouldLog");
        if (objc_msgSend(v43, "shouldLogToDisk"))
          v45 = v44 | 2;
        else
          v45 = v44;
        objc_msgSend(v43, "OSLogObject");
        v46 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          v45 &= 2u;
        if (v45)
        {
          v47 = (void *)objc_opt_class();
          *(_DWORD *)v55 = 138543362;
          *(_QWORD *)&v55[4] = v47;
          v48 = v47;
          LODWORD(v54) = 12;
          v49 = (void *)_os_log_send_and_compose_impl();

          if (!v49)
          {
LABEL_61:

            -[ISDataProvider biometricAuthenticationContext](self, "biometricAuthenticationContext");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "uniqueIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setAccountIdentifier:", v51);

            goto LABEL_62;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v49, 4, v55, v54);
          v46 = objc_claimAutoreleasedReturnValue();
          free(v49);
          SSFileLog();
        }

        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v38, 4, v55, v54);
      v35 = objc_claimAutoreleasedReturnValue();
      free(v38);
      v53 = v35;
      SSFileLog();
    }

    goto LABEL_48;
  }
LABEL_63:

}

- (void)_checkInAppPurchaseQueueForAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEB1FF8]);
  objc_msgSend(v5, "setBagType:", objc_msgSend(v4, "URLBagType"));
  -[ISDataProvider authenticationContext](self, "authenticationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requiredUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserIdentifier:", v7);

  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    v10 &= 2u;
  if (!v10)
    goto LABEL_11;
  v12 = (void *)objc_opt_class();
  v13 = v12;
  v14 = objc_msgSend(v5, "bagType");
  objc_msgSend(v4, "clientIdentifier");
  v18 = 138412802;
  v19 = v12;
  v20 = 2048;
  v21 = v14;
  v22 = 2112;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 32;
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v18, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog();
LABEL_11:

  }
  objc_msgSend(v4, "clientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SSCheckInAppPurchaseQueue();

}

- (id)_metricsDictionaryForResponse:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)_performActionsForResponse:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  ISOpenURLOperation *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  NSObject *v61;
  int v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  uint64_t v71;
  void *v72;
  int v73;
  NSObject *v74;
  int v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  int v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  int *v89;
  int *v90;
  uint64_t v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  const __CFString *name;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  int v118;
  id v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x24BEB1000uLL;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      v8 &= 2u;
    if (v8)
    {
      v118 = 138412546;
      v119 = (id)objc_opt_class();
      v120 = 2112;
      v121 = v4;
      v10 = v119;
      LODWORD(v91) = 22;
      v89 = &v118;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v118, v91);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      v89 = (int *)v9;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v115;
    v109 = *MEMORY[0x24BEB29D8];
    v105 = *MEMORY[0x24BEB29E0];
    v102 = *MEMORY[0x24BEB29E8];
    name = (const __CFString *)*MEMORY[0x24BEB2C70];
    v111 = *MEMORY[0x24BEB29F0];
    v108 = *MEMORY[0x24BEB29F8];
    v104 = *MEMORY[0x24BEB2A00];
    v100 = *MEMORY[0x24BEB2A08];
    v99 = *MEMORY[0x24BEB2A10];
    v16 = *MEMORY[0x24BEB29C8];
    v96 = *MEMORY[0x24BEB29D0];
    v103 = v12;
    v106 = *(_QWORD *)v115;
    v107 = *MEMORY[0x24BEB29C8];
    do
    {
      v17 = 0;
      v110 = v14;
      do
      {
        if (*(_QWORD *)v115 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v17);
        objc_msgSend(v18, "actionType", v89);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToString:", v16))
        {
          -[ISProtocolDataProvider _checkDownloadQueues](self, "_checkDownloadQueues");
          goto LABEL_58;
        }
        if (!objc_msgSend(v19, "isEqualToString:", v109))
        {
          if (!objc_msgSend(v19, "isEqualToString:", v105))
          {
            if (!objc_msgSend(v19, "isEqualToString:", v102))
              goto LABEL_58;
            objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v35)
            {
              objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v36 = objc_msgSend(v35, "shouldLog");
            if (objc_msgSend(v35, "shouldLogToDisk"))
              v36 |= 2u;
            objc_msgSend(v35, "OSLogObject");
            v37 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              v36 &= 2u;
            if (v36)
            {
              v38 = (void *)objc_opt_class();
              v39 = v38;
              objc_msgSend(v18, "URL");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = 138412546;
              v119 = v38;
              v120 = 2112;
              v121 = v40;
              LODWORD(v91) = 22;
              v90 = &v118;
              v41 = (void *)_os_log_send_and_compose_impl();

              v12 = v103;
              v5 = 0x24BEB1000uLL;

              if (v41)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v41, 4, &v118, v91);
                v37 = objc_claimAutoreleasedReturnValue();
                free(v41);
                v90 = (int *)v37;
                SSFileLog();
                goto LABEL_55;
              }
            }
            else
            {
LABEL_55:

            }
            objc_msgSend(v18, "URL");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            +[ISOpenURLRequest openURLRequestWithURL:](ISOpenURLRequest, "openURLRequestWithURL:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "setITunesStoreURL:", 0);
            v44 = -[ISOpenURLOperation initWithOpenURLRequest:]([ISOpenURLOperation alloc], "initWithOpenURLRequest:", v43);
            +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addOperation:", v44);

            v15 = v106;
            goto LABEL_57;
          }
          objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v29 = objc_msgSend(v28, "shouldLog");
          if (objc_msgSend(v28, "shouldLogToDisk"))
            v29 |= 2u;
          objc_msgSend(v28, "OSLogObject");
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            v29 &= 2u;
          if (v29)
          {
            v31 = (void *)objc_opt_class();
            v118 = 138412290;
            v119 = v31;
            v32 = v31;
            LODWORD(v91) = 12;
            v90 = &v118;
            v33 = (void *)_os_log_send_and_compose_impl();

            v15 = v106;
            if (v33)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v33, 4, &v118, v91);
              v30 = objc_claimAutoreleasedReturnValue();
              free(v33);
              v90 = (int *)v30;
              SSFileLog();
              goto LABEL_43;
            }
          }
          else
          {
LABEL_43:

          }
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
          goto LABEL_57;
        }
        objc_msgSend(*(id *)(v5 + 3736), "sharediTunesStoreConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v21 = objc_msgSend(v20, "shouldLog");
        if (objc_msgSend(v20, "shouldLogToDisk"))
          v21 |= 2u;
        objc_msgSend(v20, "OSLogObject");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          v21 &= 2u;
        if (!v21)
          goto LABEL_31;
        v23 = (void *)objc_opt_class();
        v24 = v23;
        objc_msgSend(v18, "URL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = 138412546;
        v119 = v23;
        v12 = v103;
        v120 = 2112;
        v121 = v25;
        LODWORD(v91) = 22;
        v90 = &v118;
        v26 = (void *)_os_log_send_and_compose_impl();

        v5 = 0x24BEB1000;
        v15 = v106;

        if (v26)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v118, v91);
          v22 = objc_claimAutoreleasedReturnValue();
          free(v26);
          v90 = (int *)v22;
          SSFileLog();
LABEL_31:

        }
        objc_msgSend(v18, "URL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISDataProvider setRedirectURL:](self, "setRedirectURL:", v27);

LABEL_57:
        v14 = v110;
        v16 = v107;
LABEL_58:
        if (objc_msgSend(v19, "isEqualToString:", v111, v90))
        {
          -[ISProtocolDataProvider _refreshSubscriptionStatus](self, "_refreshSubscriptionStatus");
          goto LABEL_120;
        }
        if (objc_msgSend(v19, "isEqualToString:", v108))
        {
          objc_msgSend(MEMORY[0x24BEB1E18], "retryAllRestoreDownloads");
          goto LABEL_120;
        }
        if (objc_msgSend(v19, "isEqualToString:", v104))
        {
          objc_msgSend(v18, "footerSection");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISProtocolDataProvider _selectFooterSection:](self, "_selectFooterSection:", v46);

          goto LABEL_120;
        }
        if (objc_msgSend(v19, "isEqualToString:", v100))
        {
          if (!-[ISProtocolDataProvider shouldProcessAccount](self, "shouldProcessAccount"))
            goto LABEL_120;
          objc_msgSend(v18, "account");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "creditsString");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setCreditsString:", v48);

          objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = 0;
          objc_msgSend(v49, "saveAccount:verifyCredentials:error:", v47, 0, &v113);
          v50 = v113;

          if (v50)
          {
            objc_msgSend(*(id *)(v5 + 3736), "sharedAccountsConfig");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v51)
            {
              objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v52 = objc_msgSend(v51, "shouldLog");
            if (objc_msgSend(v51, "shouldLogToDisk"))
              v52 |= 2u;
            objc_msgSend(v51, "OSLogObject");
            v53 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              v52 &= 2u;
            if (v52)
            {
              v54 = (void *)objc_opt_class();
              v94 = v54;
              objc_msgSend(v47, "accountName");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              SSHashIfNeeded();
              v97 = v50;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = 138543618;
              v119 = v54;
              v15 = v106;
              v120 = 2114;
              v121 = v56;
              LODWORD(v91) = 22;
              v89 = &v118;
              v57 = (void *)_os_log_send_and_compose_impl();

              v5 = 0x24BEB1000;
              v50 = v97;

              if (v57)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v57, 4, &v118, v91);
                v53 = objc_claimAutoreleasedReturnValue();
                free(v57);
                v89 = (int *)v53;
                SSFileLog();
                goto LABEL_76;
              }
            }
            else
            {
LABEL_76:

            }
            v12 = v103;
            v14 = v110;
          }

LABEL_119:
          v16 = v107;
          goto LABEL_120;
        }
        if (objc_msgSend(v19, "isEqualToString:", v99))
        {
          if (!-[ISProtocolDataProvider shouldProcessAccount](self, "shouldProcessAccount"))
            goto LABEL_120;
          objc_msgSend(v18, "account");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setActive:", 1);
          objc_msgSend(*(id *)(v5 + 3736), "sharedAccountsConfig");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v59)
          {
            objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v60 = objc_msgSend(v59, "shouldLog");
          if (objc_msgSend(v59, "shouldLogToDisk"))
            v60 |= 2u;
          objc_msgSend(v59, "OSLogObject");
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            v62 = v60;
          else
            v62 = v60 & 2;
          v98 = v58;
          if (v62)
          {
            v63 = (void *)objc_opt_class();
            v64 = v63;
            objc_msgSend(v58, "accountName");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            SSHashIfNeeded();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = 138543618;
            v119 = v63;
            v120 = 2114;
            v121 = v66;
            LODWORD(v91) = 22;
            v89 = &v118;
            v67 = (void *)_os_log_send_and_compose_impl();

            v5 = 0x24BEB1000uLL;
            v58 = v98;

            if (v67)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v67, 4, &v118, v91);
              v61 = objc_claimAutoreleasedReturnValue();
              free(v67);
              v89 = (int *)v61;
              SSFileLog();
              goto LABEL_91;
            }
          }
          else
          {
LABEL_91:

          }
          objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = 0;
          v69 = objc_msgSend(v68, "saveAccount:verifyCredentials:error:", v58, 0, &v112);
          v70 = v112;

          objc_msgSend(*(id *)(v5 + 3736), "sharedAccountsConfig");
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = (void *)v71;
          v95 = v70;
          if (v69)
          {
            if (!v71)
            {
              objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v73 = objc_msgSend(v72, "shouldLog", v89);
            if (objc_msgSend(v72, "shouldLogToDisk"))
              v73 |= 2u;
            objc_msgSend(v72, "OSLogObject");
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
              v75 = v73;
            else
              v75 = v73 & 2;
            if (v75)
            {
              v76 = (void *)objc_opt_class();
              v77 = v76;
              objc_msgSend(v58, "accountName");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              SSHashIfNeeded();
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = 138543618;
              v119 = v76;
              v120 = 2114;
              v121 = v79;
              LODWORD(v91) = 22;
              v89 = &v118;
              v80 = _os_log_send_and_compose_impl();

              if (v80)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v80, 4, &v118, v91);
                v74 = objc_claimAutoreleasedReturnValue();
                v81 = (void *)v80;
                goto LABEL_115;
              }
LABEL_117:
              v5 = 0x24BEB1000;
              v12 = v103;
              v15 = v106;
              v14 = v110;
LABEL_118:

              goto LABEL_119;
            }
          }
          else
          {
            if (!v71)
            {
              objc_msgSend(*(id *)(v5 + 3736), "sharedConfig");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v82 = objc_msgSend(v72, "shouldLog", v89);
            if (objc_msgSend(v72, "shouldLogToDisk"))
              v82 |= 2u;
            objc_msgSend(v72, "OSLogObject");
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              v83 = v82;
            else
              v83 = v82 & 2;
            if (v83)
            {
              v84 = (void *)objc_opt_class();
              v93 = v84;
              objc_msgSend(v98, "accountName");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              SSHashIfNeeded();
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "description");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              SSHashIfNeeded();
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = 138543874;
              v119 = v84;
              v120 = 2114;
              v121 = v85;
              v122 = 2114;
              v123 = v87;
              LODWORD(v91) = 32;
              v89 = &v118;
              v88 = _os_log_send_and_compose_impl();

              if (!v88)
                goto LABEL_117;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v88, 4, &v118, v91);
              v74 = objc_claimAutoreleasedReturnValue();
              v81 = (void *)v88;
LABEL_115:
              free(v81);
              v89 = (int *)v74;
              SSFileLog();
              v5 = 0x24BEB1000;
            }
          }
          v12 = v103;
          v15 = v106;
          v14 = v110;

          goto LABEL_118;
        }
        if (objc_msgSend(v19, "isEqualToString:", v96))
          -[ISProtocolDataProvider _checkInAppPurchaseQueueForAction:](self, "_checkInAppPurchaseQueueForAction:", v18);
LABEL_120:

        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
    }
    while (v14);
  }

}

- (BOOL)_processFailureTypeFromDictionary:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("failureType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "intValue");
    if ((v6 - 1001) <= 3 && v6 != 1002)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (!v19)
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
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        v22 &= 2u;
      if (v22)
      {
        v24 = (void *)objc_opt_class();
        v25 = v24;
        v28 = 138543618;
        v29 = v24;
        v30 = 1024;
        v31 = objc_msgSend(v5, "intValue");
        LODWORD(v27) = 18;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26)
        {
LABEL_35:

          objc_msgSend(v5, "intValue");
          SSError();
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_36:
          v16 = (void *)v15;
          v17 = 0;
          if (!a4)
            goto LABEL_23;
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v28, v27);
        v23 = objc_claimAutoreleasedReturnValue();
        free(v26);
        SSFileLog();
      }

      goto LABEL_35;
    }
    if (v6 == 2034 || v6 == 2002)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedAccountsAuthenticationConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      objc_msgSend(v8, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v10 &= 2u;
      if (v10)
      {
        v12 = (void *)objc_opt_class();
        v13 = v12;
        v28 = 138543618;
        v29 = v12;
        v30 = 1024;
        v31 = objc_msgSend(v5, "intValue");
        LODWORD(v27) = 18;
        v14 = (void *)_os_log_send_and_compose_impl();

        if (!v14)
        {
LABEL_20:

          ISError();
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v28, v27);
        v11 = objc_claimAutoreleasedReturnValue();
        free(v14);
        SSFileLog();
      }

      goto LABEL_20;
    }
  }
  v16 = 0;
  v17 = 1;
  if (a4)
LABEL_22:
    *a4 = objc_retainAutorelease(v16);
LABEL_23:

  return v17;
}

- (void)_refreshSubscriptionStatus
{
  id v2;
  void *v3;
  void *v4;

  if ((SSIsDaemon() & 1) == 0)
  {
    v2 = objc_alloc(MEMORY[0x24BDBCE70]);
    v4 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BEB2B78], MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB2B80], 0);
    objc_msgSend(MEMORY[0x24BEB2088], "sharedCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getStatusWithOptions:statusBlock:", v4, 0);

  }
}

- (void)_selectFooterSection:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ISProtocolDataProvider shouldPostFooterSectionChanged](self, "shouldPostFooterSectionChanged"))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v7 &= 2u;
    if (v7)
    {
      v14 = 138412546;
      v15 = (id)objc_opt_class();
      v16 = 2112;
      v17 = v4;
      v9 = v15;
      LODWORD(v11) = 22;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __47__ISProtocolDataProvider__selectFooterSection___block_invoke;
        block[3] = &unk_24C43C128;
        v13 = v4;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v14, v11);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

}

void __47__ISProtocolDataProvider__selectFooterSection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), CFSTR("ISProtocolKeySection"), 0);
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("ISProtocolNotificationSelectFooterSection"), 0, v2);

}

- (BOOL)_shouldAttemptPasswordPaymentSheetForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  ISWeakLinkedStringConstantForString("MobileActivationErrorDomain", (const void *)0x25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB24A0]))
  {
    v8 = objc_msgSend(v3, "code");

    if (v8 == 147)
      v6 = 1;
  }
  else
  {

  }
  return v6;
}

- (BOOL)_shouldFailWithTokenErrorForDialog:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  BOOL v12;

  v7 = a4;
  -[ISDataProvider contentType](self, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfString:options:", CFSTR("json"), 1);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  objc_msgSend(v7, "objectForKey:", CFSTR("errorNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v10, "integerValue") != 2055)
  {

LABEL_8:
    v12 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  SSError();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v11 = objc_retainAutorelease(v11);
    *a5 = v11;
  }
  v12 = 1;
LABEL_9:

  return v12;
}

- (id)_touchIDDialogForResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  ISTouchIDDialog *v7;
  void *v8;
  ISTouchIDDialog *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "actionsWithActionType:", *MEMORY[0x24BEB2A20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dialog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [ISTouchIDDialog alloc];
    objc_msgSend(v6, "dialogDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ISTouchIDDialog initWithDialogDictionary:](v7, "initWithDialogDictionary:", v8);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, "actionsWithActionType:", *MEMORY[0x24BEB2A18]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dialog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v12, "message");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[ISTouchIDDialog setFallbackExplanation:](v9, "setFallbackExplanation:", v13);
      objc_msgSend(v12, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        -[ISTouchIDDialog setFallbackMessage:](v9, "setFallbackMessage:", v14);

    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ISProtocolDataProvider;
  v5 = -[ISDataProvider copyWithZone:](&v11, sel_copyWithZone_);
  v5[112] = -[ISProtocolDataProvider shouldPostFooterSectionChanged](self, "shouldPostFooterSectionChanged");
  v5[113] = -[ISProtocolDataProvider shouldProcessAccount](self, "shouldProcessAccount");
  v5[114] = -[ISProtocolDataProvider shouldProcessAuthenticationDialogs](self, "shouldProcessAuthenticationDialogs");
  v5[115] = -[ISProtocolDataProvider shouldProcessDialogs](self, "shouldProcessDialogs");
  v5[117] = -[ISProtocolDataProvider shouldProcessProtocol](self, "shouldProcessProtocol");
  v5[118] = -[ISProtocolDataProvider shouldProcessTouchIDDialogs](self, "shouldProcessTouchIDDialogs");
  v5[119] = -[ISProtocolDataProvider shouldTriggerDownloads](self, "shouldTriggerDownloads");
  v6 = -[SSBiometricAuthenticationContext copyWithZone:](self->_biometricAuthenticationContext, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v6;

  v8 = -[NSString copyWithZone:](self->_presentingSceneIdentifier, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 16);
  *((_QWORD *)v5 + 16) = v8;

  return v5;
}

- (BOOL)shouldPostFooterSectionChanged
{
  return self->_shouldPostFooterSectionChanged;
}

- (void)setShouldPostFooterSectionChanged:(BOOL)a3
{
  self->_shouldPostFooterSectionChanged = a3;
}

- (BOOL)shouldProcessAccount
{
  return self->_shouldProcessAccount;
}

- (void)setShouldProcessAccount:(BOOL)a3
{
  self->_shouldProcessAccount = a3;
}

- (BOOL)shouldProcessAuthenticationDialogs
{
  return self->_shouldProcessAuthenticationDialogs;
}

- (void)setShouldProcessAuthenticationDialogs:(BOOL)a3
{
  self->_shouldProcessAuthenticationDialogs = a3;
}

- (BOOL)shouldProcessDialogs
{
  return self->_shouldProcessDialogs;
}

- (void)setShouldProcessDialogs:(BOOL)a3
{
  self->_shouldProcessDialogs = a3;
}

- (BOOL)shouldProcessProtocol
{
  return self->_shouldProcessProtocol;
}

- (void)setShouldProcessProtocol:(BOOL)a3
{
  self->_shouldProcessProtocol = a3;
}

- (BOOL)shouldTriggerDownloads
{
  return self->_shouldTriggerDownloads;
}

- (void)setShouldTriggerDownloads:(BOOL)a3
{
  self->_shouldTriggerDownloads = a3;
}

- (NSString)presentingSceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (BOOL)shouldProcessDialogsOutsideDaemon
{
  return self->_shouldProcessDialogsOutsideDaemon;
}

- (void)setShouldProcessDialogsOutsideDaemon:(BOOL)a3
{
  self->_shouldProcessDialogsOutsideDaemon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
}

@end
