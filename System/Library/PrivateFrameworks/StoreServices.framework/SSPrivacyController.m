@implementation SSPrivacyController

+ (BOOL)shouldDisplayPrivacyLinkWithIdentifier:(id)a3
{
  id v4;
  int ShouldDisableGDPR;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  int v37;
  int v38;
  NSObject *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  int v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v64;
  uint64_t v65;
  _BYTE v66[24];
  uint64_t v67;
  __int16 v68;
  unint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ShouldDisableGDPR = SSDebugShouldDisableGDPR();
  +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!ShouldDisableGDPR)
  {
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v7, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      v20 &= 2u;
    if (v20)
    {
      *(_DWORD *)v66 = 138543618;
      *(_QWORD *)&v66[4] = objc_opt_class();
      *(_WORD *)&v66[12] = 2114;
      *(_QWORD *)&v66[14] = v4;
      v22 = *(id *)&v66[4];
      LODWORD(v65) = 22;
      v64 = v66;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
        goto LABEL_24;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, v66, v65, *(_QWORD *)v66, *(_OWORD *)&v66[8]);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog(v7, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v21);
    }

LABEL_24:
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activeAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localAccount");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "resultWithError:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "privacyAcknowledgement", v64);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = objc_msgSend(a1, "_currentPrivacyContentVersionForIdentifier:", v4);
      +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v37 = objc_msgSend(v36, "shouldLog");
      if (objc_msgSend(v36, "shouldLogToDisk"))
        v38 = v37 | 2;
      else
        v38 = v37;
      objc_msgSend(v36, "OSLogObject");
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        v38 &= 2u;
      if (v38)
      {
        v40 = (void *)objc_opt_class();
        v41 = v40;
        v42 = objc_msgSend(v34, "unsignedIntegerValue");
        *(_DWORD *)v66 = 138544130;
        *(_QWORD *)&v66[4] = v40;
        *(_WORD *)&v66[12] = 2114;
        *(_QWORD *)&v66[14] = v4;
        *(_WORD *)&v66[22] = 2048;
        v67 = v42;
        v68 = 2048;
        v69 = v35;
        LODWORD(v65) = 42;
        v43 = (void *)_os_log_send_and_compose_impl();

        if (!v43)
        {
LABEL_38:

          LOBYTE(v12) = objc_msgSend(v34, "unsignedIntegerValue") < v35;
LABEL_51:

          goto LABEL_52;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, v66, v65);
        v39 = objc_claimAutoreleasedReturnValue();
        free(v43);
        SSFileLog(v36, CFSTR("%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v39);
      }

      goto LABEL_38;
    }
    +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v51 = objc_msgSend(v50, "shouldLog");
    if (objc_msgSend(v50, "shouldLogToDisk"))
      v52 = v51 | 2;
    else
      v52 = v51;
    objc_msgSend(v50, "OSLogObject");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      v52 &= 2u;
    if (v52)
    {
      v54 = (void *)objc_opt_class();
      *(_DWORD *)v66 = 138543618;
      *(_QWORD *)&v66[4] = v54;
      *(_WORD *)&v66[12] = 2114;
      *(_QWORD *)&v66[14] = v4;
      v55 = v54;
      LODWORD(v65) = 22;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_50:

        LOBYTE(v12) = 1;
        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v56, 4, v66, v65);
      v53 = objc_claimAutoreleasedReturnValue();
      free(v56);
      SSFileLog(v50, CFSTR("%@"), v57, v58, v59, v60, v61, v62, (uint64_t)v53);
    }

    goto LABEL_50;
  }
  if (!v6)
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
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (!v9)
    goto LABEL_12;
  *(_DWORD *)v66 = 138543362;
  *(_QWORD *)&v66[4] = objc_opt_class();
  v11 = *(id *)&v66[4];
  LODWORD(v65) = 12;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, v66, v65, *(_OWORD *)v66);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
LABEL_12:

    LOBYTE(v12) = 0;
  }
LABEL_52:

  return (char)v12;
}

+ (unint64_t)_currentPrivacyContentVersionForIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v4 = (void *)getOBBundleClass_softClass;
  v20 = getOBBundleClass_softClass;
  if (!getOBBundleClass_softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getOBBundleClass_block_invoke;
    v15 = &unk_1E47B8A28;
    v16 = &v17;
    __getOBBundleClass_block_invoke((uint64_t)&v12);
    v4 = (void *)v18[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v5, "bundleWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)getOBPrivacyFlowClass_softClass;
  v20 = getOBPrivacyFlowClass_softClass;
  if (!getOBPrivacyFlowClass_softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getOBPrivacyFlowClass_block_invoke;
    v15 = &unk_1E47B8A28;
    v16 = &v17;
    __getOBPrivacyFlowClass_block_invoke((uint64_t)&v12);
    v7 = (void *)v18[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v8, "flowWithBundle:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "contentVersion");

  return v10;
}

+ (void)acknowledgePrivacyLinkWithIdentifier:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "_currentPrivacyContentVersionForIdentifier:", v6);
  if (!v8)
  {
    +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v9, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      *(_DWORD *)v23 = 138543618;
      *(_QWORD *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v6;
      v14 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, v23, v22, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_14;
  }
  objc_msgSend(a1, "_translateIdentifierToPrivacyAcknowledgement:withVersion:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appendPrivacyAcknowledgementToLocalAccount:", v9);
  objc_msgSend(a1, "_appendPrivacyAcknowledgementToActiveAccount:withURL:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFinishBlock:", &__block_literal_global_0);

LABEL_14:
}

uint64_t __64__SSPrivacyController_acknowledgePrivacyLinkWithIdentifier_URL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "code");
}

+ (id)storePrivacyIdentifiers
{
  if (storePrivacyIdentifiers_ss_once_token___COUNTER__ != -1)
    dispatch_once(&storePrivacyIdentifiers_ss_once_token___COUNTER__, &__block_literal_global_23);
  return (id)storePrivacyIdentifiers_ss_once_object___COUNTER__;
}

void __46__SSPrivacyController_storePrivacyIdentifiers__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("com.apple.onboarding.itunesstore");
  v4[1] = CFSTR("com.apple.onboarding.videos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)storePrivacyIdentifiers_ss_once_object___COUNTER__;
  storePrivacyIdentifiers_ss_once_object___COUNTER__ = v2;

}

+ (id)appStorePrivacyIdentifiers
{
  if (appStorePrivacyIdentifiers_ss_once_token___COUNTER__ != -1)
    dispatch_once(&appStorePrivacyIdentifiers_ss_once_token___COUNTER__, &__block_literal_global_26);
  return (id)appStorePrivacyIdentifiers_ss_once_object___COUNTER__;
}

void __49__SSPrivacyController_appStorePrivacyIdentifiers__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("com.apple.onboarding.appstore");
  v4[1] = CFSTR("com.apple.onboarding.applearcade");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)appStorePrivacyIdentifiers_ss_once_object___COUNTER__;
  appStorePrivacyIdentifiers_ss_once_object___COUNTER__ = v2;

}

+ (void)syncPrivacyAcknowledgementOnAccount:(id)a3 URL:(id)a4
{
  id v4;

  v4 = (id)objc_msgSend(a1, "_syncPrivacyAcknowledgementOnAccount:URL:", a3, a4);
}

+ (id)viewControllerForPrivacySplashWithIdentifier:(id)a3 URL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  Class (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v7 = (void *)getAMSUIPrivacyViewControllerClass_softClass;
  v36 = getAMSUIPrivacyViewControllerClass_softClass;
  v8 = MEMORY[0x1E0C809B0];
  if (!getAMSUIPrivacyViewControllerClass_softClass)
  {
    *(_QWORD *)&v37 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v37 + 1) = 3221225472;
    v38 = __getAMSUIPrivacyViewControllerClass_block_invoke;
    v39 = &unk_1E47B8A28;
    v40 = &v33;
    __getAMSUIPrivacyViewControllerClass_block_invoke((uint64_t)&v37);
    v7 = (void *)v34[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v33, 8);
  v27 = v8;
  v28 = 3221225472;
  v29 = __72__SSPrivacyController_viewControllerForPrivacySplashWithIdentifier_URL___block_invoke;
  v30 = &unk_1E47B89B0;
  v31 = v5;
  v10 = v6;
  v32 = v10;
  objc_msgSend(v9, "privacyControllerWithIdentifier:acknowledgementHandler:", v5, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
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
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      v14 &= 2u;
    if (v14)
    {
      v16 = (void *)objc_opt_class();
      LODWORD(v37) = 138543362;
      *(_QWORD *)((char *)&v37 + 4) = v16;
      v17 = v16;
      LODWORD(v26) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v37, v26, v27, v28, v29, v30, v31);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog(v12, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v15);
    }

    goto LABEL_15;
  }
LABEL_16:

  return v11;
}

uint64_t __72__SSPrivacyController_viewControllerForPrivacySplashWithIdentifier_URL___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return +[SSPrivacyController acknowledgePrivacyLinkWithIdentifier:URL:](SSPrivacyController, "acknowledgePrivacyLinkWithIdentifier:URL:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

+ (void)_appendPrivacyAcknowledgement:(id)a3 toAccount:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  int v35;
  int v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  _QWORD v50[4];
  id v51;
  int v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v5, "privacyAcknowledgement");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = MEMORY[0x1E0C9AA70];
  v12 = (void *)objc_msgSend(v8, "initWithDictionary:", v11);

  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __63__SSPrivacyController__appendPrivacyAcknowledgement_toAccount___block_invoke;
  v50[3] = &unk_1E47B89D8;
  v13 = v12;
  v51 = v13;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v50);

  objc_msgSend(v5, "privacyAcknowledgement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToDictionary:", v13);

  if (!v15)
  {
    v32 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v5, "setPrivacyAcknowledgement:", v32);

    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v34 = objc_msgSend(v33, "saveAccount:verifyCredentials:error:", v5, 0, &v49);
    v16 = v49;

    if ((v34 & 1) != 0)
      goto LABEL_28;
    +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v35 = -[NSObject shouldLog](v19, "shouldLog");
    if (-[NSObject shouldLogToDisk](v19, "shouldLogToDisk"))
      v36 = v35 | 2;
    else
      v36 = v35;
    -[NSObject OSLogObject](v19, "OSLogObject");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      v36 &= 2u;
    if (v36)
    {
      v38 = (void *)objc_opt_class();
      v39 = v38;
      objc_msgSend(v5, "hashedDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543874;
      v53 = v38;
      v54 = 2114;
      v55 = v40;
      v56 = 2114;
      v57 = v16;
      LODWORD(v48) = 32;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (!v41)
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v41, 4, &v52, v48);
      v37 = objc_claimAutoreleasedReturnValue();
      free(v41);
      SSFileLog(v19, CFSTR("%@"), v42, v43, v44, v45, v46, v47, (uint64_t)v37);
    }

    goto LABEL_27;
  }
  +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v16, "shouldLog");
  if (objc_msgSend(v16, "shouldLogToDisk"))
    v18 = v17 | 2;
  else
    v18 = v17;
  objc_msgSend(v16, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    v18 &= 2u;
  if (!v18)
    goto LABEL_27;
  v20 = (void *)objc_opt_class();
  v21 = v20;
  objc_msgSend(v5, "hashedDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privacyAcknowledgement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 138544130;
  v53 = v20;
  v54 = 2114;
  v55 = v22;
  v56 = 2114;
  v57 = v23;
  v58 = 2114;
  v59 = v13;
  LODWORD(v48) = 42;
  v24 = (void *)_os_log_send_and_compose_impl();

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v52, v48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    free(v24);
    SSFileLog(v16, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v25);

  }
LABEL_28:

}

void __63__SSPrivacyController__appendPrivacyAcknowledgement_toAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);
  }

}

+ (id)_appendPrivacyAcknowledgementToActiveAccount:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SSBinaryPromise *v23;
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
  void *v35;
  uint64_t v37;
  _BYTE v38[24];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v9)
  {
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v11, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      v25 &= 2u;
    if (v25)
    {
      *(_DWORD *)v38 = 138543362;
      *(_QWORD *)&v38[4] = objc_opt_class();
      v27 = *(id *)&v38[4];
      LODWORD(v37) = 12;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_25:

        v23 = objc_alloc_init(SSBinaryPromise);
        SSError((uint64_t)CFSTR("SSErrorDomain"), 106, (uint64_t)CFSTR("Not Available"), (uint64_t)CFSTR("No account to acknowledge"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSBinaryPromise finishWithError:](v23, "finishWithError:", v35);

        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, v38, v37, *(_QWORD *)v38, *(_QWORD *)&v38[8]);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog(v11, CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v26);
    }

    goto LABEL_25;
  }
  if (!v10)
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
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (!v13)
    goto LABEL_12;
  *(_DWORD *)v38 = 138543874;
  *(_QWORD *)&v38[4] = objc_opt_class();
  *(_WORD *)&v38[12] = 2114;
  *(_QWORD *)&v38[14] = v9;
  *(_WORD *)&v38[22] = 2114;
  v39 = v6;
  v15 = *(id *)&v38[4];
  LODWORD(v37) = 32;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, v38, v37, *(_OWORD *)v38, *(_QWORD *)&v38[16], v39);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
LABEL_12:

  }
  objc_msgSend(a1, "_appendPrivacyAcknowledgement:toAccount:", v6, v9);
  objc_msgSend(a1, "_syncPrivacyAcknowledgementOnAccount:URL:", v9, v7);
  v23 = (SSBinaryPromise *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v23;
}

+ (void)_appendPrivacyAcknowledgementToLocalAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
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
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  *(_DWORD *)v21 = 138543618;
  *(_QWORD *)&v21[4] = objc_opt_class();
  *(_WORD *)&v21[12] = 2114;
  *(_QWORD *)&v21[14] = v4;
  v9 = *(id *)&v21[4];
  LODWORD(v20) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:

  }
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localAccount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resultWithError:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_appendPrivacyAcknowledgement:toAccount:", v4, v19);
}

+ (id)_syncPrivacyAcknowledgementOnAccount:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  SSBinaryPromise *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SSMutableURLRequestProperties *v15;
  void *v16;
  objc_class *v17;
  id v18;
  SSAuthenticationContext *v19;
  void *v20;
  objc_class *v21;
  id v22;
  SSBinaryPromise *v23;
  void *v24;
  SSBinaryPromise *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  SSBinaryPromise *v31;
  void *v33;
  _QWORD v34[4];
  SSBinaryPromise *v35;
  id v36;
  id v37;
  id v38;
  id from;
  id location;
  uint64_t v41;
  uint64_t v42;
  Class (*v43)(uint64_t);
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SSBinaryPromise);
  if (objc_msgSend(v6, "isLocalAccount"))
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 106, (uint64_t)CFSTR("Not Available"), (uint64_t)CFSTR("Privacy acknowlegment not available for local accounts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBinaryPromise finishWithError:](v8, "finishWithError:", v9);

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[SSDevice currentDevice](SSDevice, "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueDeviceIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("guid"));
    objc_msgSend(v6, "privacyAcknowledgement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "privacyAcknowledgement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("privacyAcknowledgement"));

    }
    v15 = objc_alloc_init(SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setCachePolicy:](v15, "setCachePolicy:", 1);
    -[SSMutableURLRequestProperties setHTTPMethod:](v15, "setHTTPMethod:", CFSTR("POST"));
    -[SSMutableURLRequestProperties setRequestParameters:](v15, "setRequestParameters:", v10);
    -[SSMutableURLRequestProperties setURL:](v15, "setURL:", v7);
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](v15, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
    v46 = 0;
    v47 = &v46;
    v48 = 0x2050000000;
    v16 = (void *)getISStoreURLOperationClass_softClass;
    v49 = getISStoreURLOperationClass_softClass;
    if (!getISStoreURLOperationClass_softClass)
    {
      v41 = MEMORY[0x1E0C809B0];
      v42 = 3221225472;
      v43 = __getISStoreURLOperationClass_block_invoke;
      v44 = &unk_1E47B8A28;
      v45 = &v46;
      __getISStoreURLOperationClass_block_invoke((uint64_t)&v41);
      v16 = (void *)v47[3];
    }
    v33 = (void *)v12;
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v46, 8);
    v18 = objc_alloc_init(v17);
    v19 = -[SSAuthenticationContext initWithAccount:]([SSAuthenticationContext alloc], "initWithAccount:", v6);
    objc_msgSend(v18, "setAuthenticationContext:", v19);

    v46 = 0;
    v47 = &v46;
    v48 = 0x2050000000;
    v20 = (void *)getISProtocolDataProviderClass_softClass;
    v49 = getISProtocolDataProviderClass_softClass;
    if (!getISProtocolDataProviderClass_softClass)
    {
      v41 = MEMORY[0x1E0C809B0];
      v42 = 3221225472;
      v43 = __getISProtocolDataProviderClass_block_invoke;
      v44 = &unk_1E47B8A28;
      v45 = &v46;
      __getISProtocolDataProviderClass_block_invoke((uint64_t)&v41);
      v20 = (void *)v47[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v46, 8);
    v22 = objc_alloc_init(v21);
    objc_msgSend(v18, "setDataProvider:", v22);

    objc_msgSend(v18, "setRequestProperties:", v15);
    objc_initWeak(&location, v18);
    objc_initWeak(&from, a1);
    v34[1] = 3221225472;
    v34[2] = __64__SSPrivacyController__syncPrivacyAcknowledgementOnAccount_URL___block_invoke;
    v34[3] = &unk_1E47B8A00;
    v34[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v37, &from);
    objc_copyWeak(&v38, &location);
    v23 = v8;
    v35 = v23;
    v36 = v6;
    objc_msgSend(v18, "setCompletionBlock:", v34);
    v46 = 0;
    v47 = &v46;
    v48 = 0x2050000000;
    v24 = (void *)getISOperationQueueClass_softClass;
    v49 = getISOperationQueueClass_softClass;
    if (!getISOperationQueueClass_softClass)
    {
      v41 = MEMORY[0x1E0C809B0];
      v42 = 3221225472;
      v43 = __getISOperationQueueClass_block_invoke;
      v44 = &unk_1E47B8A28;
      v45 = &v46;
      __getISOperationQueueClass_block_invoke((uint64_t)&v41);
      v24 = (void *)v47[3];
    }
    v25 = v8;
    v26 = v7;
    v27 = v10;
    v28 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v46, 8);
    objc_msgSend(v28, "mainQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addOperation:", v18);

    v30 = v36;
    v31 = v23;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    v7 = v26;
    v8 = v25;
  }

  return v8;
}

void __64__SSPrivacyController__syncPrivacyAcknowledgementOnAccount_URL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  _BYTE v52[22];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (id *)(a1 + 56);
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_msgSend(v4, "success");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v6, "dataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "output");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      objc_msgSend(v10, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        v12 &= 2u;
      if (v12)
      {
        *(_DWORD *)v52 = 138543362;
        *(_QWORD *)&v52[4] = objc_opt_class();
        v14 = *(id *)&v52[4];
        LODWORD(v51) = 12;
        v50 = v52;
        v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
        {
LABEL_14:

          objc_msgSend(WeakRetained, "_appendPrivacyAcknowledgement:toAccount:", v8, *(_QWORD *)(a1 + 40));
LABEL_39:
          objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess", v50);
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, v52, v51, *(_OWORD *)v52);
        v13 = objc_claimAutoreleasedReturnValue();
        free(v15);
        SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
      }

      goto LABEL_14;
    }
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v40 = v39 | 2;
    else
      v40 = v39;
    objc_msgSend(v10, "OSLogObject");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      v40 &= 2u;
    if (v40)
    {
      *(_DWORD *)v52 = 138543362;
      *(_QWORD *)&v52[4] = objc_opt_class();
      v42 = *(id *)&v52[4];
      LODWORD(v51) = 12;
      v50 = v52;
      v43 = (void *)_os_log_send_and_compose_impl();

      if (!v43)
      {
LABEL_38:

        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, v52, v51, *(_QWORD *)v52, *(_QWORD *)&v52[8]);
      v41 = objc_claimAutoreleasedReturnValue();
      free(v43);
      SSFileLog(v10, CFSTR("%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v41);
    }

    goto LABEL_38;
  }
  +[SSLogConfig sharedPrivacyConfig](SSLogConfig, "sharedPrivacyConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
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
  if (!v24)
    goto LABEL_25;
  v26 = (void *)objc_opt_class();
  v27 = v26;
  v28 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v28, "error");
  *(_DWORD *)v52 = 138543618;
  *(_QWORD *)&v52[4] = v26;
  *(_WORD *)&v52[12] = 2114;
  *(_QWORD *)&v52[14] = objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = 22;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, v52, v51);
    v25 = objc_claimAutoreleasedReturnValue();
    free(v29);
    SSFileLog(v22, CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v25);
LABEL_25:

  }
  v36 = *(void **)(a1 + 32);
  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "error");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  SSErrorWithUnderlyingError((uint64_t)v37, (uint64_t)CFSTR("SSErrorDomain"), 100, (uint64_t)CFSTR("Acknowlegment Failed"), (uint64_t)CFSTR("Failed to send acknowlegment"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "finishWithError:", v38);

LABEL_40:
}

+ (id)_translateIdentifierToPrivacyAcknowledgement:(id)a3 withVersion:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SSPrivacyController.m"), 298, CFSTR("identifier cannot be empty or nil."));

  }
  objc_msgSend(a1, "storePrivacyIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appStorePrivacyIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v7))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v12)
    {
      v13 = v12;
      v26 = v9;
      v27 = v8;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4, v26, v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v13);
LABEL_20:
      v9 = v26;
      v8 = v27;
    }
  }
  else
  {
    if (!objc_msgSend(v9, "containsObject:", v7))
    {
      v36 = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v37 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v9;
    v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v18)
    {
      v19 = v18;
      v26 = v9;
      v27 = v8;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v11);
          v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4, v26, v27, (_QWORD)v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, v22);

        }
        v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v19);
      goto LABEL_20;
    }
  }
LABEL_22:

  return v10;
}

@end
