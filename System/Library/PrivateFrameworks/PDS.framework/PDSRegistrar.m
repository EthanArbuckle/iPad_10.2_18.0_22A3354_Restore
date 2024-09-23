@implementation PDSRegistrar

- (id)activeUsersWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  PDSRemoteVendor *remoteVendor;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  uint8_t v31[4];
  PDSRegistrar *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  pds_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_213471000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar activeUsersWithError {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  v6 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __37__PDSRegistrar_activeUsersWithError___block_invoke;
  v30[3] = &unk_24CFD04C8;
  v30[4] = &buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  if (v8)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __37__PDSRegistrar_activeUsersWithError___block_invoke_2;
    v17[3] = &unk_24CFD0590;
    v17[4] = &v24;
    v17[5] = &v18;
    objc_msgSend(v8, "activeUsersWithClientID:withCompletion:", v9, v17);

    v10 = v25[5];
  }
  else
  {
    v10 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v10, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3 && v11)
    *a3 = objc_retainAutorelease(v11);
  pds_defaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v19[5];
    *(_DWORD *)v31 = 138412802;
    v32 = self;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v14;
    _os_log_impl(&dword_213471000, v13, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed activeUsersWithError {self: %@, overallError: %@, response: %@}", v31, 0x20u);
  }

  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&buf, 8);

  return v15;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (PDSRegistrar)initWithClientID:(id)a3 error:(id *)a4
{
  id v8;
  PDSRegistrar *v9;
  uint64_t v10;
  PDSRemoteVendor *remoteVendor;
  NSObject *v12;
  PDSRemoteVendor *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  void *v26;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  PDSRegistrar *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientID"));

  }
  v28.receiver = self;
  v28.super_class = (Class)PDSRegistrar;
  v9 = -[PDSRegistrar init](&v28, sel_init);
  if (v9)
  {
    +[PDSRemoteRegistry remoteVendorForClientID:](PDSRemoteRegistry, "remoteVendorForClientID:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    remoteVendor = v9->_remoteVendor;
    v9->_remoteVendor = (PDSRemoteVendor *)v10;

    objc_storeStrong((id *)&v9->_clientID, a3);
    pds_defaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v9;
      _os_log_impl(&dword_213471000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar create {self: %@}", buf, 0xCu);
    }

    v13 = v9->_remoteVendor;
    v27 = 0;
    v14 = -[PDSRemoteVendor validateConnectionWithError:](v13, "validateConnectionWithError:", &v27);
    v15 = v27;
    v16 = v15;
    if ((v14 & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      if (v15)
      {
        v35 = *MEMORY[0x24BDD1398];
        v36[0] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v16, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", PDSXPCErrorDomain);

      if (v20)
        v21 = -200;
      else
        v21 = -201;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", PDSRegistrarErrorDomain, v21, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;
      if (a4)
        *a4 = objc_retainAutorelease(v22);

      v9 = 0;
    }
    pds_defaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = "NO";
      *(_DWORD *)buf = 138412802;
      v30 = v9;
      if (v14)
        v24 = "YES";
      v31 = 2080;
      v32 = v24;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_213471000, v23, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed validation {self: %@, connected: %s, error: %@}", buf, 0x20u);
    }

  }
  return v9;
}

- (BOOL)addRegistration:(id)a3 toUser:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  PDSRemoteVendor *remoteVendor;
  void *v15;
  PDSEntry *v16;
  void *v17;
  PDSEntry *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  uint8_t v35[4];
  PDSRegistrar *v36;
  __int16 v37;
  void *v38;
  _BYTE buf[24];
  PDSRegistrar *v40;
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registration"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_3:
  pds_defaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v40 = self;
    _os_log_impl(&dword_213471000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar addRegistration %@ for user %@ {self: %@}", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = (PDSRegistrar *)__Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = 0;
  v13 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __45__PDSRegistrar_addRegistration_toUser_error___block_invoke;
  v34[3] = &unk_24CFD04C8;
  v34[4] = buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  if (v15)
  {
    v16 = [PDSEntry alloc];
    -[PDSRegistrar clientID](self, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PDSEntry initWithUser:registration:clientID:](v16, "initWithUser:registration:clientID:", v11, v9, v17);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __45__PDSRegistrar_addRegistration_toUser_error___block_invoke_2;
    v27[3] = &unk_24CFD04C8;
    v27[4] = &v28;
    objc_msgSend(v15, "storeEntries:deleteEntries:withCompletion:", v19, 0, v27);

    v20 = v29[5];
  }
  else
  {
    v20 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v20, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a5 && v21)
    *a5 = objc_retainAutorelease(v21);
  pds_defaultLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138412546;
    v36 = self;
    v37 = 2112;
    v38 = v22;
    _os_log_impl(&dword_213471000, v23, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed addRegistration {self: %@, overallError: %@}", v35, 0x16u);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

  return v22 == 0;
}

void __45__PDSRegistrar_addRegistration_toUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__PDSRegistrar_addRegistration_toUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)ensureRegistrationPresent:(id)a3 forUser:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  PDSRemoteVendor *remoteVendor;
  void *v15;
  PDSEntry *v16;
  void *v17;
  PDSEntry *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  void *v30;
  void *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[5];
  uint8_t v40[4];
  PDSRegistrar *v41;
  __int16 v42;
  void *v43;
  _BYTE buf[24];
  PDSRegistrar *v45;
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registration"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_3:
  pds_defaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v45 = self;
    _os_log_impl(&dword_213471000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar ensureRegistrationPresent %@ for user %@ {self: %@}", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v45 = (PDSRegistrar *)__Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  v47 = 0;
  v13 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke;
  v39[3] = &unk_24CFD04C8;
  v39[4] = buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v39);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  if (v15)
  {
    v16 = [PDSEntry alloc];
    -[PDSRegistrar clientID](self, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PDSEntry initWithUser:registration:clientID:](v16, "initWithUser:registration:clientID:", v11, v9, v17);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke_2;
    v32[3] = &unk_24CFD04C8;
    v32[4] = &v33;
    objc_msgSend(v15, "storeEntries:deleteEntries:withCompletion:", v19, 0, v32);

    v20 = v34[5];
  }
  else
  {
    v20 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v20, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x24BDD1398]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", PDSCDCacheErrorDomain);

      if (v26)
      {
        v27 = objc_msgSend(v24, "code");
        if (v27 == -402 || v27 == -400)
        {

          v22 = 0;
        }
      }
    }
    if (a5)
      *a5 = objc_retainAutorelease(v22);

  }
  pds_defaultLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v40 = 138412546;
    v41 = self;
    v42 = 2112;
    v43 = v22;
    _os_log_impl(&dword_213471000, v28, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed ensureRegistrationPresent {self: %@, overallError: %@}", v40, 0x16u);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

  return v22 == 0;
}

void __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__PDSRegistrar_ensureRegistrationPresent_forUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)batchUpdateRegistrations:(id)a3 forUser:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  PDSRemoteVendor *remoteVendor;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  PDSEntry *v19;
  void *v20;
  PDSEntry *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[5];
  uint8_t v47[4];
  PDSRegistrar *v48;
  __int16 v49;
  void *v50;
  uint8_t v51[128];
  __int128 buf;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v33 = v8;
  if (!v8)
  {
    v28 = v9;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registrations"));

    v9 = v28;
  }
  v34 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  }
  pds_defaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_213471000, v10, OS_LOG_TYPE_DEFAULT, "PDSRegistrar batchUpdateRegistrations {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  pds_oversizedLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v33;
    _os_log_impl(&dword_213471000, v11, OS_LOG_TYPE_DEFAULT, "Batch Registrations: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__0;
  v55 = __Block_byref_object_dispose__0;
  v56 = 0;
  remoteVendor = self->_remoteVendor;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke;
  v46[3] = &unk_24CFD04C8;
  v46[4] = &buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v46);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  v45 = 0;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = v33;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          v19 = [PDSEntry alloc];
          -[PDSRegistrar clientID](self, "clientID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[PDSEntry initWithUser:registration:clientID:](v19, "initWithUser:registration:clientID:", v34, v18, v20);

          objc_msgSend(v13, "addObject:", v21);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
      }
      while (v15);
    }

    -[PDSRegistrar clientID](self, "clientID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke_2;
    v35[3] = &unk_24CFD04C8;
    v35[4] = &v40;
    objc_msgSend(v32, "batchUpdateEntries:forClientID:withCompletion:", v13, v22, v35);

    v23 = v41[5];
  }
  else
  {
    v23 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v23, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a5 && v24)
    *a5 = objc_retainAutorelease(v24);
  pds_defaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v47 = 138412546;
    v48 = self;
    v49 = 2112;
    v50 = v25;
    _os_log_impl(&dword_213471000, v26, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed batchUpdateRegistrations {self: %@, overallError: %@}", v47, 0x16u);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&buf, 8);

  return v25 == 0;
}

void __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__PDSRegistrar_batchUpdateRegistrations_forUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeRegistration:(id)a3 fromUser:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t (*v11)(uint64_t, uint64_t);
  NSObject *v12;
  uint64_t v13;
  PDSRemoteVendor *remoteVendor;
  void *v15;
  PDSEntry *v16;
  void *v17;
  PDSEntry *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  uint8_t v35[4];
  PDSRegistrar *v36;
  __int16 v37;
  void *v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registration"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_3:
  pds_defaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v40 = v11;
    _os_log_impl(&dword_213471000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar removeRegistration {self: %@, registration: %@, user: %@}", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = 0;
  v13 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke;
  v34[3] = &unk_24CFD04C8;
  v34[4] = buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  if (v15)
  {
    v16 = [PDSEntry alloc];
    -[PDSRegistrar clientID](self, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PDSEntry initWithUser:registration:clientID:state:](v16, "initWithUser:registration:clientID:state:", v11, v9, v17, 2);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke_2;
    v27[3] = &unk_24CFD04C8;
    v27[4] = &v28;
    objc_msgSend(v15, "storeEntries:deleteEntries:withCompletion:", v19, 0, v27);

    v20 = v29[5];
  }
  else
  {
    v20 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v20, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a5 && v21)
    *a5 = objc_retainAutorelease(v21);
  pds_defaultLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138412546;
    v36 = self;
    v37 = 2112;
    v38 = v22;
    _os_log_impl(&dword_213471000, v23, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed removeRegistration {self: %@, overallError: %@}", v35, 0x16u);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

  return v22 == 0;
}

void __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PDSRegistrar_removeRegistration_fromUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)removeAllRegistrationsFromUser:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  PDSRemoteVendor *remoteVendor;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];
  uint8_t v27[4];
  PDSRegistrar *v28;
  __int16 v29;
  void *v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  }
  pds_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_213471000, v8, OS_LOG_TYPE_DEFAULT, "PDSRegistrar removeAllRegistrations {self: %@, user: %@}", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v9 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke;
  v26[3] = &unk_24CFD04C8;
  v26[4] = buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  if (v11)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke_2;
    v19[3] = &unk_24CFD04C8;
    v19[4] = &v20;
    objc_msgSend(v11, "removeAllEntriesForUser:withClientID:withCompletion:", v7, v12, v19);

    v13 = v21[5];
  }
  else
  {
    v13 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v13, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);
  pds_defaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v27 = 138412546;
    v28 = self;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_213471000, v16, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed removeAllRegistrations {self: %@, overallError: %@}", v27, 0x16u);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);

  return v15 == 0;
}

void __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__PDSRegistrar_removeAllRegistrationsFromUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)currentRegistrationsForUser:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  PDSRemoteVendor *remoteVendor;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  uint8_t v35[4];
  PDSRegistrar *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  }
  pds_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_213471000, v8, OS_LOG_TYPE_DEFAULT, "PDSRegistrar currentRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  v9 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke;
  v34[3] = &unk_24CFD04C8;
  v34[4] = buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  if (v11)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke_2;
    v21[3] = &unk_24CFD0540;
    v21[4] = self;
    v21[5] = &v22;
    v21[6] = &v28;
    objc_msgSend(v11, "entriesForUser:clientID:withCompletion:", v7, v12, v21);

    v13 = v29[5];
  }
  else
  {
    v13 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v13, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);
  pds_defaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v23[5];
    *(_DWORD *)v35 = 138412802;
    v36 = self;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v17;
    _os_log_impl(&dword_213471000, v16, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed currentRegistrationsForUser {self: %@, overallError: %@, response: %@}", v35, 0x20u);
  }

  v18 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PDSRegistrar_currentRegistrationsForUser_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_activeRegistrationsFromEntries:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)currentRegistrationsForUser:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  PDSRemoteVendor *remoteVendor;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  uint8_t buf[4];
  PDSRegistrar *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  pds_defaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_213471000, v10, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async currentRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  remoteVendor = self->_remoteVendor;
  v20 = 0;
  -[PDSRemoteVendor remoteObjectProxyWithError:](remoteVendor, "remoteObjectProxyWithError:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v12)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __55__PDSRegistrar_currentRegistrationsForUser_completion___block_invoke;
    v18[3] = &unk_24CFD0568;
    v18[4] = self;
    v19 = v9;
    objc_msgSend(v12, "entriesForUser:clientID:withCompletion:", v7, v14, v18);

  }
  else
  {
    -[PDSRegistrar _wrappedErrorForFailedRemote:](self, "_wrappedErrorForFailedRemote:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v15);

    v13 = (id)v15;
  }

}

void __55__PDSRegistrar_currentRegistrationsForUser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_213471000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async currentRegistrationsForUser {self: %@, error: %@, response: %@}", (uint8_t *)&v12, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_activeRegistrationsFromEntries:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_wrappedErrorForGivenError:XPCError:", v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);

}

void __37__PDSRegistrar_activeUsersWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __37__PDSRegistrar_activeUsersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)activeUsersWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  PDSRemoteVendor *remoteVendor;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  PDSRegistrar *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  pds_defaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_213471000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async activeUsersWithError {self: %@}", buf, 0xCu);
  }

  remoteVendor = self->_remoteVendor;
  v15 = 0;
  -[PDSRemoteVendor remoteObjectProxyWithError:](remoteVendor, "remoteObjectProxyWithError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __42__PDSRegistrar_activeUsersWithCompletion___block_invoke;
    v13[3] = &unk_24CFD0568;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v8, "activeUsersWithClientID:withCompletion:", v10, v13);

  }
  else
  {
    -[PDSRegistrar _wrappedErrorForFailedRemote:](self, "_wrappedErrorForFailedRemote:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, uint64_t))v5 + 2))(v5, 0, v11);

    v9 = (id)v11;
  }

}

void __42__PDSRegistrar_activeUsersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_213471000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async activeUsersWithError {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_wrappedErrorForGivenError:XPCError:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);

}

- (id)usersWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  PDSRemoteVendor *remoteVendor;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  uint8_t v31[4];
  PDSRegistrar *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  pds_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_213471000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar usersWithError {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  v6 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __31__PDSRegistrar_usersWithError___block_invoke;
  v30[3] = &unk_24CFD04C8;
  v30[4] = &buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  if (v8)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __31__PDSRegistrar_usersWithError___block_invoke_2;
    v17[3] = &unk_24CFD0590;
    v17[4] = &v24;
    v17[5] = &v18;
    objc_msgSend(v8, "usersWithClientID:withCompletion:", v9, v17);

    v10 = v25[5];
  }
  else
  {
    v10 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v10, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3 && v11)
    *a3 = objc_retainAutorelease(v11);
  pds_defaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v19[5];
    *(_DWORD *)v31 = 138412802;
    v32 = self;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v14;
    _os_log_impl(&dword_213471000, v13, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed usersWithError {self: %@, overallError: %@, response: %@}", v31, 0x20u);
  }

  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&buf, 8);

  return v15;
}

void __31__PDSRegistrar_usersWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __31__PDSRegistrar_usersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)usersWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  PDSRemoteVendor *remoteVendor;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  PDSRegistrar *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pds_defaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_213471000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async usersWithError {self: %@}", buf, 0xCu);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  remoteVendor = self->_remoteVendor;
  v15 = 0;
  -[PDSRemoteVendor remoteObjectProxyWithError:](remoteVendor, "remoteObjectProxyWithError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __36__PDSRegistrar_usersWithCompletion___block_invoke;
    v13[3] = &unk_24CFD0568;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v8, "usersWithClientID:withCompletion:", v10, v13);

  }
  else
  {
    -[PDSRegistrar _wrappedErrorForFailedRemote:](self, "_wrappedErrorForFailedRemote:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, uint64_t))v5 + 2))(v5, 0, v11);

    v9 = (id)v11;
  }

}

void __36__PDSRegistrar_usersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_213471000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async usersWithError {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_wrappedErrorForGivenError:XPCError:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);

}

- (id)allRegistrationsForUser:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  PDSRemoteVendor *remoteVendor;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  uint8_t v35[4];
  PDSRegistrar *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  }
  pds_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_213471000, v8, OS_LOG_TYPE_DEFAULT, "PDSRegistrar allRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  v9 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke;
  v34[3] = &unk_24CFD04C8;
  v34[4] = buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  if (v11)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke_2;
    v21[3] = &unk_24CFD0540;
    v21[4] = self;
    v21[5] = &v22;
    v21[6] = &v28;
    objc_msgSend(v11, "entriesForUser:clientID:withCompletion:", v7, v12, v21);

    v13 = v29[5];
  }
  else
  {
    v13 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v13, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);
  pds_defaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v23[5];
    *(_DWORD *)v35 = 138412802;
    v36 = self;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v17;
    _os_log_impl(&dword_213471000, v16, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed allRegistrationsForUser {self: %@, overallError: %@, response: %@}", v35, 0x20u);
  }

  v18 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__PDSRegistrar_allRegistrationsForUser_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_registrationsFromEntries:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)allRegistrationsForUser:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  PDSRemoteVendor *remoteVendor;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  uint8_t buf[4];
  PDSRegistrar *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  pds_defaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_213471000, v10, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async allRegistrationsForUser {self: %@, user: %@}", buf, 0x16u);
  }

  remoteVendor = self->_remoteVendor;
  v21 = 0;
  -[PDSRemoteVendor remoteObjectProxyWithError:](remoteVendor, "remoteObjectProxyWithError:", &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  if (v12)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __51__PDSRegistrar_allRegistrationsForUser_completion___block_invoke;
    v19[3] = &unk_24CFD0568;
    v19[4] = self;
    v20 = v9;
    objc_msgSend(v12, "entriesForUser:clientID:withCompletion:", v7, v14, v19);

  }
  else
  {
    -[PDSRegistrar _wrappedErrorForFailedRemote:](self, "_wrappedErrorForFailedRemote:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v15);

    v13 = (id)v15;
  }

}

void __51__PDSRegistrar_allRegistrationsForUser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_213471000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async allRegistrationsForUser {self: %@, error: %@, response: %@}", (uint8_t *)&v12, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_registrationsFromEntries:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_wrappedErrorForGivenError:XPCError:", v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);

}

- (id)allRegistrationsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  PDSRegistrar *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pds_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_213471000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar allRegistrations {self: %@}", (uint8_t *)&v9, 0xCu);
  }

  -[PDSRegistrar allEntriesWithError:](self, "allEntriesWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSRegistrar _registrationsFromEntries:](self, "_registrationsFromEntries:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)allRegistrationsWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  PDSRegistrar *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 398, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  pds_defaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_213471000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async allRegistrations {self: %@}", buf, 0xCu);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__PDSRegistrar_allRegistrationsWithCompletion___block_invoke;
  v9[3] = &unk_24CFD0568;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  -[PDSRegistrar allEntriesWithCompletion:](self, "allEntriesWithCompletion:", v9);

}

void __47__PDSRegistrar_allRegistrationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_213471000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async allRegistrations {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_registrationsFromEntries:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);

}

- (id)allEntriesWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  PDSRemoteVendor *remoteVendor;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  uint8_t v31[4];
  PDSRegistrar *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  pds_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_213471000, v5, OS_LOG_TYPE_DEFAULT, "PDSRegistrar allEntries {self: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  v6 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __36__PDSRegistrar_allEntriesWithError___block_invoke;
  v30[3] = &unk_24CFD04C8;
  v30[4] = &buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  if (v8)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __36__PDSRegistrar_allEntriesWithError___block_invoke_2;
    v17[3] = &unk_24CFD0590;
    v17[4] = &v18;
    v17[5] = &v24;
    objc_msgSend(v8, "entriesForClientID:withCompletion:", v9, v17);

    v10 = v25[5];
  }
  else
  {
    v10 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v10, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3 && v11)
    *a3 = objc_retainAutorelease(v11);
  pds_defaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v19[5];
    *(_DWORD *)v31 = 138412802;
    v32 = self;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v14;
    _os_log_impl(&dword_213471000, v13, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed allEntries {self: %@, overallError: %@, response: %@}", v31, 0x20u);
  }

  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&buf, 8);

  return v15;
}

void __36__PDSRegistrar_allEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __36__PDSRegistrar_allEntriesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)allEntriesWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  PDSRemoteVendor *remoteVendor;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  PDSRegistrar *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pds_defaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_213471000, v6, OS_LOG_TYPE_DEFAULT, "PDSRegistrar async allEntries {self: %@}", buf, 0xCu);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  remoteVendor = self->_remoteVendor;
  v15 = 0;
  -[PDSRemoteVendor remoteObjectProxyWithError:](remoteVendor, "remoteObjectProxyWithError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    -[PDSRegistrar clientID](self, "clientID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __41__PDSRegistrar_allEntriesWithCompletion___block_invoke;
    v13[3] = &unk_24CFD0568;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v8, "entriesForClientID:withCompletion:", v10, v13);

  }
  else
  {
    -[PDSRegistrar _wrappedErrorForFailedRemote:](self, "_wrappedErrorForFailedRemote:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, uint64_t))v5 + 2))(v5, 0, v11);

    v9 = (id)v11;
  }

}

void __41__PDSRegistrar_allEntriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_213471000, v7, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed async allEntries {self: %@, error: %@, response: %@}", (uint8_t *)&v11, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_wrappedErrorForGivenError:XPCError:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);

}

- (BOOL)deleteRegistration:(id)a3 fromUser:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t (*v11)(uint64_t, uint64_t);
  NSObject *v12;
  uint64_t v13;
  PDSRemoteVendor *remoteVendor;
  void *v15;
  PDSEntry *v16;
  void *v17;
  PDSEntry *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  uint8_t v35[4];
  PDSRegistrar *v36;
  __int16 v37;
  void *v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 449, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registration"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRegistrar.m"), 450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_3:
  pds_defaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v40 = v11;
    _os_log_impl(&dword_213471000, v12, OS_LOG_TYPE_DEFAULT, "PDSRegistrar deleteRegistration {self: %@, registration: %@, user: %@}", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = 0;
  v13 = MEMORY[0x24BDAC760];
  remoteVendor = self->_remoteVendor;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke;
  v34[3] = &unk_24CFD04C8;
  v34[4] = buf;
  -[PDSRemoteVendor synchronousRemoteObjectProxyWithErrorHandler:](remoteVendor, "synchronousRemoteObjectProxyWithErrorHandler:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  if (v15)
  {
    v16 = [PDSEntry alloc];
    -[PDSRegistrar clientID](self, "clientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PDSEntry initWithUser:registration:clientID:state:](v16, "initWithUser:registration:clientID:state:", v11, v9, v17, 2);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke_2;
    v27[3] = &unk_24CFD04C8;
    v27[4] = &v28;
    objc_msgSend(v15, "storeEntries:deleteEntries:withCompletion:", 0, v19, v27);

    v20 = v29[5];
  }
  else
  {
    v20 = 0;
  }
  -[PDSRegistrar _wrappedErrorForGivenError:XPCError:](self, "_wrappedErrorForGivenError:XPCError:", v20, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a5 && v21)
    *a5 = objc_retainAutorelease(v21);
  pds_defaultLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138412546;
    v36 = self;
    v37 = 2112;
    v38 = v22;
    _os_log_impl(&dword_213471000, v23, OS_LOG_TYPE_DEFAULT, "PDSRegistrar completed deleteRegistration {self: %@, overallError: %@}", v35, 0x16u);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(buf, 8);

  return v22 == 0;
}

void __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PDSRegistrar_deleteRegistration_fromUser_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_wrappedErrorForFailedRemote:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = *MEMORY[0x24BDD1398];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", PDSRegistrarErrorDomain, -201, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_wrappedErrorForGivenError:(id)a3 XPCError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = PDSRegistrarErrorDomain;
    v24 = *MEMORY[0x24BDD1398];
    v25[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = v9;
    v13 = -201;
  }
  else
  {
    if (!v5)
    {
      v14 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v5, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", PDSCDCacheErrorDomain);

    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = PDSRegistrarErrorDomain;
    if (v17)
    {
      v22 = *MEMORY[0x24BDD1398];
      v23 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;
      v12 = v19;
      v13 = -202;
    }
    else
    {
      v20 = *MEMORY[0x24BDD1398];
      v21 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;
      v12 = v19;
      v13 = -203;
    }
  }
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  return v14;
}

- (id)_activeRegistrationsFromEntries:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(a3, "__imArrayByApplyingBlock:", &__block_literal_global_1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __48__PDSRegistrar__activeRegistrationsFromEntries___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "registration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_registrationsFromEntries:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(a3, "__imArrayByApplyingBlock:", &__block_literal_global_24);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __42__PDSRegistrar__registrationsFromEntries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registration");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; clientID = \"%@\">"),
               objc_opt_class(),
               self,
               self->_clientID);
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (PDSRemoteVendor)remoteVendor
{
  return self->_remoteVendor;
}

- (void)setRemoteVendor:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVendor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteVendor, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
