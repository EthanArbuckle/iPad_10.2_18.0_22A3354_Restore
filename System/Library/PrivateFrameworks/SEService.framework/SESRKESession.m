@implementation SESRKESession

+ (id)newInstance
{
  return (id)objc_opt_new();
}

- (BOOL)isPassiveEntryAvailable:(id)a3 isAvailable:(BOOL *)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  if (-[SESSession state](self, "state") == 1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__11;
    v19 = __Block_byref_object_dispose__11;
    v9 = MEMORY[0x24BDAC760];
    v20 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke;
    v14[3] = &unk_24C2BCCB0;
    v14[4] = &v15;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke_2;
    v13[3] = &unk_24C2BD728;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v10, "isPassiveEntryAvailable:reply:", v8, v13);

    if (a4)
      *a4 = *((_BYTE *)v22 + 24);
    if (a5)
      *a5 = objc_retainAutorelease((id)v16[5]);
    LOBYTE(a5) = v16[5] == 0;
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else if (a5)
  {
    SESDefaultLogObject();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

void __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)sendRKEFunction:(id)a3 action:(id)a4 readerIdentifier:(id)a5 authorization:(id)a6 isEnduring:(BOOL)a7 isHandlingExternal:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t v27[4];
  uint64_t v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  __int128 v33;
  uint64_t v34;

  v9 = a8;
  v10 = a7;
  v34 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  SESDefaultLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = objc_msgSend(v15, "unsignedIntValue");
    LOWORD(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 2) = objc_msgSend(v16, "unsignedIntValue");
    HIWORD(v30) = 2112;
    v31 = (uint64_t)v17;
    LOWORD(v32) = 1024;
    *(_DWORD *)((char *)&v32 + 2) = v18 != 0;
    HIWORD(v32) = 1024;
    LODWORD(v33) = v10;
    WORD2(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 6) = v9;
    _os_log_impl(&dword_20A048000, v20, OS_LOG_TYPE_INFO, "sendRKEFunction 0x%X rkeAction 0x%X readerIdentifier %@ authorization %d isEnduring %d isHandlingExternal %d", buf, 0x2Au);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__11;
    *(_QWORD *)&v33 = __Block_byref_object_dispose__11;
    *((_QWORD *)&v33 + 1) = 0;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __112__SESRKESession_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion___block_invoke;
    v26[3] = &unk_24C2BCCB0;
    v26[4] = buf;
    -[SESSession remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendRKEFunction:action:readerIdentifier:authorization:isEnduring:isHandlingExternal:completion:", objc_msgSend(v15, "unsignedShortValue"), objc_msgSend(v16, "unsignedCharValue"), v17, v18, v10, v9, v19);

    if (*((_QWORD *)v30 + 5))
    {
      SESDefaultLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *((_QWORD *)v30 + 5);
        *(_DWORD *)v27 = 138412290;
        v28 = v23;
        _os_log_impl(&dword_20A048000, v22, OS_LOG_TYPE_ERROR, "%@", v27, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD))v19 + 2))(v19, 0, *((_QWORD *)v30 + 5));
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v25);

  }
}

void __112__SESRKESession_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)cancelRKEFunction:(id)a3 readerIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t v19[4];
  uint64_t v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SESDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v6, "unsignedIntValue");
    _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_INFO, "cancelRKEFunction 0x%X", buf, 8u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__11;
    v25 = __Block_byref_object_dispose__11;
    v9 = MEMORY[0x24BDAC760];
    v26 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke;
    v18[3] = &unk_24C2BCCB0;
    v18[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke_2;
    v17[3] = &unk_24C2BCCB0;
    v17[4] = buf;
    objc_msgSend(v10, "cancelRKEFunction:readerIdentifier:reply:", objc_msgSend(v6, "unsignedShortValue"), v7, v17);

    v11 = (void *)*((_QWORD *)v22 + 5);
    if (v11)
    {
      SESDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *((_QWORD *)v22 + 5);
        *(_DWORD *)v19 = 138412290;
        v20 = v13;
        _os_log_impl(&dword_20A048000, v12, OS_LOG_TYPE_ERROR, "%@", v19, 0xCu);
      }

      v11 = (void *)*((_QWORD *)v22 + 5);
    }
    v14 = v11;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

void __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)continueExecutingRKEFunction:(id)a3 action:(id)a4 arbitraryData:(id)a5 readerIdentifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[8];
  uint8_t *v24;
  __int128 v25;
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  SESDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = objc_msgSend(v12, "unsignedIntValue");
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = objc_msgSend(v13, "unsignedIntValue");
    HIWORD(v24) = 1024;
    LODWORD(v25) = v14 != 0;
    WORD2(v25) = 2112;
    *(_QWORD *)((char *)&v25 + 6) = v15;
    _os_log_impl(&dword_20A048000, v16, OS_LOG_TYPE_INFO, "continueExecutingRKEFunction 0x%X rkeAction 0x%X arbitraryData %d readerIdentifier %@", buf, 0x1Eu);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v24 = buf;
    *(_QWORD *)&v25 = 0x3032000000;
    *((_QWORD *)&v25 + 1) = __Block_byref_object_copy__11;
    v26 = __Block_byref_object_dispose__11;
    v17 = MEMORY[0x24BDAC760];
    v27 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke;
    v22[3] = &unk_24C2BCCB0;
    v22[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke_2;
    v21[3] = &unk_24C2BCCB0;
    v21[4] = buf;
    objc_msgSend(v18, "continueExecutingRKEFunction:action:arbitraryData:readerIdentifier:reply:", objc_msgSend(v12, "unsignedShortValue"), objc_msgSend(v13, "unsignedCharValue"), v14, v15, v21);

    if (a7)
      *a7 = objc_retainAutorelease(*((id *)v24 + 5));
    LOBYTE(a7) = *((_QWORD *)v24 + 5) == 0;
    _Block_object_dispose(buf, 8);

  }
  else if (a7)
  {
    SESDefaultLogObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

void __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)sendPassthroughMessage:(id)a3 readerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t v27[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  SESDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v10, OS_LOG_TYPE_INFO, "sendPassthroughMessage", buf, 2u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    if ((unint64_t)objc_msgSend(v8, "length") < 0x10000)
    {
      *(_QWORD *)buf = 0;
      v22 = buf;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__11;
      v25 = __Block_byref_object_dispose__11;
      v13 = MEMORY[0x24BDAC760];
      v26 = 0;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke;
      v20[3] = &unk_24C2BCCB0;
      v20[4] = buf;
      -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke_2;
      v19[3] = &unk_24C2BCCB0;
      v19[4] = buf;
      objc_msgSend(v14, "sendPassthroughMessage:readerIdentifier:reply:", v8, v9, v19);

      v15 = v22;
      if (*((_QWORD *)v22 + 5))
      {
        SESDefaultLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = *((_QWORD *)v22 + 5);
          *(_DWORD *)v27 = 138412290;
          v28 = v17;
          _os_log_impl(&dword_20A048000, v16, OS_LOG_TYPE_ERROR, "%@", v27, 0xCu);
        }

        v15 = v22;
      }
      if (a5)
      {
        *a5 = objc_retainAutorelease(*((id *)v15 + 5));
        v15 = v22;
      }
      LOBYTE(a5) = *((_QWORD *)v15 + 5) == 0;
      _Block_object_dispose(buf, 8);

    }
    else if (a5)
    {
      SESDefaultLogObject();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "length");
      SESCreateAndLogError();
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    SESDefaultLogObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  return (char)a5;
}

void __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getVehicleReports:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t v26[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "getVehicleReports", buf, 2u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__11;
    v24 = __Block_byref_object_dispose__11;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__11;
    v18 = __Block_byref_object_dispose__11;
    v6 = MEMORY[0x24BDAC760];
    v19 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __35__SESRKESession_getVehicleReports___block_invoke;
    v13[3] = &unk_24C2BCCB0;
    v13[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __35__SESRKESession_getVehicleReports___block_invoke_2;
    v12[3] = &unk_24C2BD3C0;
    v12[4] = &v14;
    v12[5] = buf;
    objc_msgSend(v7, "getVehicleReports:", v12);

    if (*((_QWORD *)v21 + 5))
    {
      SESDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *((_QWORD *)v21 + 5);
        *(_DWORD *)v26 = 138412290;
        v27 = v9;
        _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(*((id *)v21 + 5));
    a3 = (id *)(id)v15[5];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(buf, 8);
  }
  else if (a3)
  {
    SESDefaultLogObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }
  return a3;
}

void __35__SESRKESession_getVehicleReports___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__SESRKESession_getVehicleReports___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)sign:(id)a3 readerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t v33[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  SESDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v10, OS_LOG_TYPE_INFO, "sign", buf, 2u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    objc_msgSend(v9, "hexStringAsData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      *(_QWORD *)buf = 0;
      v28 = buf;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__11;
      v31 = __Block_byref_object_dispose__11;
      v32 = 0;
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__11;
      v25 = __Block_byref_object_dispose__11;
      v12 = MEMORY[0x24BDAC760];
      v26 = 0;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __45__SESRKESession_sign_readerIdentifier_error___block_invoke;
      v20[3] = &unk_24C2BCCB0;
      v20[4] = buf;
      -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __45__SESRKESession_sign_readerIdentifier_error___block_invoke_2;
      v19[3] = &unk_24C2BD750;
      v19[4] = &v21;
      v19[5] = buf;
      objc_msgSend(v13, "sign:readerIdentifier:reply:", v8, v11, v19);

      if (*((_QWORD *)v28 + 5))
      {
        SESDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = *((_QWORD *)v28 + 5);
          *(_DWORD *)v33 = 138412290;
          v34 = v15;
          _os_log_impl(&dword_20A048000, v14, OS_LOG_TYPE_ERROR, "%@", v33, 0xCu);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(*((id *)v28 + 5));
      v16 = (id)v22[5];
      _Block_object_dispose(&v21, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (a5)
      {
        SESDefaultLogObject();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = 0;
    }
    goto LABEL_18;
  }
  if (a5)
  {
    SESDefaultLogObject();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

void __45__SESRKESession_sign_readerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__SESRKESession_sign_readerIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)didStartSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESRKESession;
  -[SESSession didStartSession:](&v3, sel_didStartSession_, a3);
}

- (void)didEndUnexpectedly:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SESRKESession didInvalidateWithError:](self, "didInvalidateWithError:", v4);
  v5.receiver = self;
  v5.super_class = (Class)SESRKESession;
  -[SESSession didEndUnexpectedly:](&v5, sel_didEndUnexpectedly_, v4);

}

- (void)didInvalidateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SESSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__SESRKESession_didInvalidateWithError___block_invoke;
  v7[3] = &unk_24C2BD0C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__SESRKESession_didInvalidateWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sesSession:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didCreateKey:(id)a3 forVehicle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SESSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SESRKESession_didCreateKey_forVehicle___block_invoke;
  block[3] = &unk_24C2BD778;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __41__SESRKESession_didCreateKey_forVehicle___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1[4], "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = a1[4];
  objc_msgSend(a1[5], "asHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "asHexString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sesSession:didCreateKey:forVehicle:", v2, v3, v4);

}

- (void)sendEvent:(id)a3 fromVehicle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[SESSession state](self, "state") == 1)
  {
    -[SESSession queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__SESRKESession_sendEvent_fromVehicle___block_invoke;
    block[3] = &unk_24C2BD778;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    SESDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_INFO, "Dropping event while no active session", buf, 2u);
    }

  }
}

void __39__SESRKESession_sendEvent_fromVehicle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "asHexString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sesSession:event:fromVehicle:", v2, v3, v4);

}

- (void)didReceivePassthroughMessage:(id)a3 fromVehicle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[SESSession state](self, "state") == 1)
  {
    -[SESSession queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SESRKESession_didReceivePassthroughMessage_fromVehicle___block_invoke;
    block[3] = &unk_24C2BD778;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    SESDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_INFO, "Dropping passthrough message while no active session", buf, 2u);
    }

  }
}

void __58__SESRKESession_didReceivePassthroughMessage_fromVehicle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "asHexString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sesSession:didReceivePassthroughMessage:fromVehicle:", v2, v3, v4);

}

- (void)didReceiveContinuationRequestFor:(id)a3 actionIdentifier:(id)a4 arbitraryData:(id)a5 fromVehicle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[SESSession state](self, "state") == 1)
  {
    -[SESSession queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __93__SESRKESession_didReceiveContinuationRequestFor_actionIdentifier_arbitraryData_fromVehicle___block_invoke;
    block[3] = &unk_24C2BD7A0;
    block[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    dispatch_async(v14, block);

  }
  else
  {
    SESDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A048000, v15, OS_LOG_TYPE_INFO, "Dropping confirmation request while no active session", buf, 2u);
    }

  }
}

void __93__SESRKESession_didReceiveContinuationRequestFor_actionIdentifier_arbitraryData_fromVehicle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "continuationDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "asHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sesSession:didReceiveContinuationRequestFor:actionIdentifier:arbitraryData:fromVehicle:", v2, v3, v4, v5, v6);

}

- (SESRKESessionDelegate)delegate
{
  return (SESRKESessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SESRKESessionContinuationDelegate)continuationDelegate
{
  return (SESRKESessionContinuationDelegate *)objc_loadWeakRetained((id *)&self->_continuationDelegate);
}

- (void)setContinuationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_continuationDelegate, a3);
}

- (NSString)activeKeyIdentifier
{
  return self->_activeKeyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKeyIdentifier, 0);
  objc_destroyWeak((id *)&self->_continuationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
