@implementation SASProximityAnisetteRequestAction

+ (unint64_t)actionID
{
  return 5;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3;
  SASProximityAnisetteRequestAction *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(SASProximityAnisetteRequestAction);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SASProximityAnisetteRequestAction setRequest:](v4, "setRequest:", objc_msgSend(v5, "integerValue"));
  return v4;
}

- (id)requestPayload
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("request");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SASProximityAnisetteRequestAction request](self, "request"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)responsePayload
{
  dispatch_semaphore_t v3;
  id *v4;
  void *v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  _QWORD v16[5];
  NSObject *v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD v20[5];
  NSObject *v21;
  _QWORD v22[5];
  NSObject *v23;
  _QWORD v24[5];
  NSObject *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  switch(-[SASProximityAnisetteRequestAction request](self, "request"))
  {
    case 0:
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke;
      v24[3] = &unk_1E97DCAE0;
      v24[4] = self;
      v4 = (id *)&v25;
      v25 = v3;
      -[SASProximityAnisetteRequestAction provisionAnisetteWithCompletion:](self, "provisionAnisetteWithCompletion:", v24);
      goto LABEL_8;
    case 1:
      -[SASProximityAnisetteRequestAction sim](self, "sim");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_9;
      v22[3] = &unk_1E97DCAE0;
      v22[4] = self;
      v4 = (id *)&v23;
      v23 = v3;
      -[SASProximityAnisetteRequestAction syncAnisetteWithSIMData:completion:](self, "syncAnisetteWithSIMData:completion:", v5, v22);
      goto LABEL_7;
    case 2:
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_10;
      v20[3] = &unk_1E97DCAE0;
      v20[4] = self;
      v4 = (id *)&v21;
      v21 = v3;
      -[SASProximityAnisetteRequestAction eraseAnisetteWithCompletion:](self, "eraseAnisetteWithCompletion:", v20);
      goto LABEL_8;
    case 3:
      v6 = -[SASProximityAnisetteRequestAction shouldProvision](self, "shouldProvision");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_11;
      v18[3] = &unk_1E97DCB08;
      v18[4] = self;
      v4 = (id *)&v19;
      v19 = v3;
      -[SASProximityAnisetteRequestAction fetchAnisetteDataAndProvisionIfNecessary:withCompletion:](self, "fetchAnisetteDataAndProvisionIfNecessary:withCompletion:", v6, v18);
      goto LABEL_8;
    case 4:
      -[SASProximityAnisetteRequestAction dsid](self, "dsid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_13;
      v16[3] = &unk_1E97DCB08;
      v16[4] = self;
      v4 = (id *)&v17;
      v17 = v3;
      -[SASProximityAnisetteRequestAction legacyAnisetteDataForDSID:withCompletion:](self, "legacyAnisetteDataForDSID:withCompletion:", v5, v16);
LABEL_7:

LABEL_8:
      break;
    default:
      break;
  }
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SASProximityAnisetteRequestAction success](self, "success"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("success"));

  -[SASProximityAnisetteRequestAction anisetteData](self, "anisetteData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SASProximityAnisetteRequestAction anisetteData](self, "anisetteData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("anisette"));

  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (!v11)
  {
    +[SASLogging facility](SASLogging, "facility");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl(&dword_1D45FD000, v13, OS_LOG_TYPE_DEFAULT, "Failed to archive response: %@", buf, 0xCu);
    }

  }
  return v11;
}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAnisetteData:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", a2);
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D45FD000, v6, OS_LOG_TYPE_DEFAULT, "Provisioning anisette failed: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAnisetteData:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", a2);
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D45FD000, v6, OS_LOG_TYPE_DEFAULT, "Syncing anisette with SIM data failed: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAnisetteData:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", a2);
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D45FD000, v6, OS_LOG_TYPE_DEFAULT, "Erase anisette failed: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAnisetteData:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", v5 != 0);
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D45FD000, v6, OS_LOG_TYPE_DEFAULT, "Fetch anisette data and provision failed: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __52__SASProximityAnisetteRequestAction_responsePayload__block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAnisetteData:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setSuccess:", v5 != 0);
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D45FD000, v6, OS_LOG_TYPE_DEFAULT, "Legacy anisette data for DSID failed: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)setResponseFromData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v16;
  if (!v11)
  {
    +[SASLogging facility](SASLogging, "facility");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1D45FD000, v13, OS_LOG_TYPE_DEFAULT, "Failed to unarchive information: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("anisette"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityAnisetteRequestAction setAnisetteData:](self, "setAnisetteData:", v14);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("success"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityAnisetteRequestAction setSuccess:](self, "setSuccess:", objc_msgSend(v15, "BOOLValue"));

}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D00120];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "provisionWithCompletion:", v4);

}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D00120];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "syncWithSIMData:completion:", v7, v6);

}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D00120];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "eraseWithCompletion:", v4);

}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0D00120];
  v5 = a4;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "anisetteDataWithCompletion:", v5);

}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D00120];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "legacyAnisetteDataForDSID:withCompletion:", v7, v6);

}

- (int64_t)request
{
  return self->_request;
}

- (void)setRequest:(int64_t)a3
{
  self->_request = a3;
}

- (NSData)sim
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSim:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)shouldProvision
{
  return self->_shouldProvision;
}

- (void)setShouldProvision:(BOOL)a3
{
  self->_shouldProvision = a3;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (AKAnisetteData)anisetteData
{
  return (AKAnisetteData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnisetteData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteData, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_sim, 0);
}

@end
