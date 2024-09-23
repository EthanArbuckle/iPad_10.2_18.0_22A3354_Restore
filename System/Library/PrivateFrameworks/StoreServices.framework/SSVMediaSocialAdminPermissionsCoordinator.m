@implementation SSVMediaSocialAdminPermissionsCoordinator

- (SSVMediaSocialAdminPermissionsCoordinator)init
{
  SSVMediaSocialAdminPermissionsCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSVMediaSocialAdminPermissionsCoordinator;
  v2 = -[SSVMediaSocialAdminPermissionsCoordinator init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaSocialAdminPermissionsCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)CFPreferencesCopyAppValue(CFSTR("MediaSocialRefreshPeriodKey"), CFSTR("com.apple.itunesstored"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "doubleValue");
    else
      v7 = 0x404E000000000000;
    *(_QWORD *)&v2->_refreshPeriod = v7;

  }
  return v2;
}

+ (id)sharedCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SSVMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCoordinator_sOnce != -1)
    dispatch_once(&sharedCoordinator_sOnce, block);
  return (id)sharedCoordinator_sCoordinator;
}

void __62__SSVMediaSocialAdminPermissionsCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCoordinator_sCoordinator;
  sharedCoordinator_sCoordinator = (uint64_t)v1;

}

- (void)getAdminStatusAndWaitWithOptions:(id)a3 resultBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = dispatch_semaphore_create(0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__66;
  v21 = __Block_byref_object_dispose__66;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusAndWaitWithOptions_resultBlock___block_invoke;
  v13[3] = &unk_1E47BB230;
  v15 = &v23;
  v16 = &v17;
  v9 = v8;
  v14 = v9;
  -[SSVMediaSocialAdminPermissionsCoordinator getAdminStatusWithOptions:resultBlock:](self, "getAdminStatusWithOptions:resultBlock:", v6, v13);
  v10 = dispatch_time(0, 10000000000);
  v11 = dispatch_semaphore_wait(v9, v10);
  if (v7)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), 140, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v12);

    }
    else
    {
      v7[2](v7, *((unsigned __int8 *)v24 + 24), (void *)v18[5]);
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

}

void __90__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusAndWaitWithOptions_resultBlock___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)getAdminStatusWithOptions:(id)a3 resultBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSVMediaSocialAdminPermissionsCoordinator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke;
  block[3] = &unk_1E47B8608;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SSURLBag *v12;
  SSVMediaSocialAdminStatusOperation *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    if (v5
      && (objc_msgSend(v5, "objectForKey:", CFSTR("SSVMediaSocialAdminPermissionsOptionIgnoreCache")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "BOOLValue"),
          v6,
          (v7 & 1) != 0))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_adminStatusForAccountID:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (objc_msgSend(*(id *)(a1 + 40), "_statusIsFresh:", v8))
        {
          v9 = *(_QWORD *)(a1 + 48);
          if (v9)
          {
            (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, objc_msgSend(v8, "isAdmin"), 0);
LABEL_12:

            goto LABEL_13;
          }
        }
      }
    }
    +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SSVDefaultUserAgent();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forHTTPHeaderField:", v11, CFSTR("User-Agent"));

    v12 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", v10);
    v13 = objc_alloc_init(SSVMediaSocialAdminStatusOperation);
    -[SSVComplexOperation configureWithURLBag:](v13, "configureWithURLBag:", v12);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke_2;
    v14[3] = &unk_1E47BF7A8;
    v14[4] = *(_QWORD *)(a1 + 40);
    v15 = v4;
    v16 = *(id *)(a1 + 48);
    -[SSVMediaSocialAdminStatusOperation setOutputBlock:](v13, "setOutputBlock:", v14);
    -[SSVMediaSocialAdminStatusOperation main](v13, "main");

    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 119, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v8);
    goto LABEL_12;
  }
LABEL_13:

}

void __83__SSVMediaSocialAdminPermissionsCoordinator_getAdminStatusWithOptions_resultBlock___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  SSVMediaSocialAdminStatus *v7;
  void *v8;
  SSVMediaSocialAdminStatus *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  if (a2)
  {
    v7 = [SSVMediaSocialAdminStatus alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SSVMediaSocialAdminStatus initWithAdminStatus:dateUpdated:](v7, "initWithAdminStatus:dateUpdated:", a3, v8);

    objc_msgSend(*(id *)(a1 + 32), "_setAdminStatus:forAccountID:", v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v9 = 0;
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, -[SSVMediaSocialAdminStatus isAdmin](v9, "isAdmin"), v11);

}

- (BOOL)isCurrentUserAdmin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SSVMediaSocialAdminPermissionsCoordinator _adminStatusForAccountID:](self, "_adminStatusForAccountID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAdmin");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reset
{
  CFPreferencesSetAppValue(CFSTR("MediaSocialSavedAdminStatusesKey"), 0, CFSTR("com.apple.itunesstored"));
  -[SSVMediaSocialAdminPermissionsCoordinator setRefreshPeriod:](self, "setRefreshPeriod:", 60.0);
}

- (id)_adminStatusForAccountID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  uint64_t v30;
  id v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSVMediaSocialAdminPermissionsCoordinator.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountID"));

  }
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("MediaSocialSavedAdminStatusesKey"), CFSTR("com.apple.itunesstored"));
  if (!v6)
  {
    v14 = 0;
    goto LABEL_21;
  }
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v11, v6, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (v17)
    {
      v19 = (void *)objc_opt_class();
      v32 = 138543618;
      v33 = v19;
      v34 = 2114;
      v35 = v13;
      v20 = v19;
      LODWORD(v30) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_18:

        v14 = 0;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v32, v30);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog(v15, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v18);
    }

    goto LABEL_18;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_21:
  return v14;
}

- (void)_setAdminStatus:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  id v31;
  void *v32;
  int v33;
  NSObject *v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int *v47;
  uint64_t v48;
  id v50;
  id v51;
  int v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSVMediaSocialAdminPermissionsCoordinator.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountID"));

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSVMediaSocialAdminPermissionsCoordinator.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adminStatus"));

LABEL_3:
  v8 = (void *)CFPreferencesCopyAppValue(CFSTR("MediaSocialSavedAdminStatusesKey"), CFSTR("com.apple.itunesstored"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_20;
  v10 = (void *)MEMORY[0x1E0CB3710];
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v13, v8, &v51);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v51;

  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      v20 = v18;
    else
      v20 = v18 & 2;
    if (v20)
    {
      v21 = (void *)objc_opt_class();
      v52 = 138543618;
      v53 = v21;
      v54 = 2114;
      v55 = v15;
      v22 = v21;
      LODWORD(v48) = 22;
      v47 = &v52;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
        goto LABEL_19;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v52, v48);
      v19 = objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog(v16, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v19);
    }

    goto LABEL_19;
  }
  v16 = v9;
  v9 = (void *)objc_msgSend(v14, "mutableCopy");
LABEL_19:

LABEL_20:
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7, v47);
  v50 = 0;
  v30 = (const void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v50);
  v31 = v50;
  if (v31)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = objc_msgSend(v32, "shouldLog");
    if (objc_msgSend(v32, "shouldLogToDisk"))
      v33 |= 2u;
    objc_msgSend(v32, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      v35 = v33;
    else
      v35 = v33 & 2;
    if (v35)
    {
      v36 = (void *)objc_opt_class();
      v52 = 138543618;
      v53 = v36;
      v54 = 2114;
      v55 = v31;
      v37 = v36;
      LODWORD(v48) = 22;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_32:

        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v38, 4, &v52, v48);
      v34 = objc_claimAutoreleasedReturnValue();
      free(v38);
      SSFileLog(v32, CFSTR("%@"), v39, v40, v41, v42, v43, v44, (uint64_t)v34);
    }

    goto LABEL_32;
  }
LABEL_33:
  CFPreferencesSetAppValue(CFSTR("MediaSocialSavedAdminStatusesKey"), v30, CFSTR("com.apple.itunesstored"));

}

- (BOOL)_statusIsFresh:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  if (!a3)
    return 0;
  objc_msgSend(a3, "dateUpdated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = fabs(v5);
  -[SSVMediaSocialAdminPermissionsCoordinator refreshPeriod](self, "refreshPeriod");
  v8 = v6 < v7;

  return v8;
}

- (double)refreshPeriod
{
  return self->_refreshPeriod;
}

- (void)setRefreshPeriod:(double)a3
{
  self->_refreshPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
