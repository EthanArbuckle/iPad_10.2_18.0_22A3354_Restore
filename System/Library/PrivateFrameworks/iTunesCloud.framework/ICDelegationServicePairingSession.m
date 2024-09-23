@implementation ICDelegationServicePairingSession

- (ICDelegationServicePairingSession)initWithRole:(int64_t)a3 securitySettings:(id)a4
{
  id v7;
  ICDelegationServicePairingSession *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessSerialQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *calloutQueue;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICDelegationServicePairingSession;
  v8 = -[ICDelegationServicePairingSession init](&v14, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServicePairingSession.accessSerialQueue", 0);
    accessSerialQueue = v8->_accessSerialQueue;
    v8->_accessSerialQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServicePairingSession.calloutQueue", 0);
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v11;

    v8->_role = a3;
    objc_storeStrong((id *)&v8->_securitySettings, a4);
  }

  return v8;
}

- (void)dealloc
{
  PairingSessionPrivate *pairingSession;
  objc_super v4;

  pairingSession = self->_pairingSession;
  if (pairingSession)
    CFRelease(pairingSession);
  v4.receiver = self;
  v4.super_class = (Class)ICDelegationServicePairingSession;
  -[ICDelegationServicePairingSession dealloc](&v4, sel_dealloc);
}

- (void)prepareEncryptedSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessSerialQueue, v7);

}

- (void)receievedData:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ICDelegationServicePairingSession_receievedData___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessSerialQueue, v7);

}

- (void)getDecryptedDataForEncryptedData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *accessSerialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessSerialQueue, block);

}

- (void)getEncryptedDataForData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *accessSerialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessSerialQueue, block);

}

- (id)_encryptedDataForData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _BYTE *v8;
  NSUInteger v9;
  NSUInteger v10;
  BOOL v12;
  _BYTE v14[16];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v4, "length"));
  -[NSData bytes](self->_outputKey, "bytes");
  -[NSMutableData bytes](self->_outputNonce, "bytes");
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "mutableBytes");
  chacha20_poly1305_encrypt_all_64x64();
  objc_msgSend(v7, "appendBytes:length:", v14, 16);
  v8 = -[NSMutableData mutableBytes](self->_outputNonce, "mutableBytes");
  v9 = -[NSMutableData length](self->_outputNonce, "length");
  if (v9)
  {
    v10 = v9 - 1;
    do
    {
      if (++*v8++)
        v12 = 1;
      else
        v12 = v10 == 0;
      --v10;
    }
    while (!v12);
  }

  return v7;
}

- (void)_handlePairingSessionCompletionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *existingPairingCompletionHandlers;
  NSObject *calloutQueue;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  ICDelegationServicePairingSession *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing pairing session with error: %{public}@", buf, 0x16u);
  }

  if (v4)
  {
    v6 = v4;
    v7 = 0;
  }
  else
  {
    v19 = 0;
    v8 = -[ICDelegationServicePairingSession _deriveEncryptionKeysReturningError:](self, "_deriveEncryptionKeysReturningError:", &v19);
    v9 = v19;
    v10 = v9;
    if (v8)
    {
      v6 = 0;
      v7 = 2;
    }
    else
    {
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v11;
      v7 = 0;
    }

  }
  self->_state = v7;
  v12 = (void *)-[NSMutableArray copy](self->_existingPairingCompletionHandlers, "copy");
  existingPairingCompletionHandlers = self->_existingPairingCompletionHandlers;
  self->_existingPairingCompletionHandlers = 0;

  if (objc_msgSend(v12, "count"))
  {
    calloutQueue = self->_calloutQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__ICDelegationServicePairingSession__handlePairingSessionCompletionWithError___block_invoke;
    v15[3] = &unk_1E4391230;
    v16 = v12;
    v17 = v4;
    v18 = v6;
    dispatch_async(calloutQueue, v15);

  }
}

- (BOOL)_deriveEncryptionKeysReturningError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t role;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  rsize_t v22;
  id v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  rsize_t v28;
  id v30;
  id v31;
  uint8_t buf[4];
  ICDelegationServicePairingSession *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!self->_pairingSession)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a3)
      goto LABEL_25;
    goto LABEL_24;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
  v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 8);
  role = self->_role;
  if (role == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "DelegationService-Write-Encryption-Key", 38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99D50];
    v11 = "DelegationService-Read-Encryption-Key";
    v12 = 37;
    goto LABEL_8;
  }
  if (role == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "DelegationService-Read-Encryption-Key", 37);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99D50];
    v11 = "DelegationService-Write-Encryption-Key";
    v12 = 38;
LABEL_8:
    objc_msgSend(v10, "dataWithBytes:length:", v11, v12);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v9 = 0;
  v31 = 0;
LABEL_10:
  v15 = objc_retainAutorelease(v9);
  objc_msgSend(v15, "bytes");
  objc_msgSend(v15, "length");
  objc_msgSend(v5, "length");
  v16 = objc_retainAutorelease(v5);
  objc_msgSend(v16, "mutableBytes");
  v17 = PairingSessionDeriveKey();
  if (v17)
  {
    LODWORD(v19) = v17;
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    v19 = (int)v19;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2048;
      v35 = (int)v19;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to derive input key (OSStatus = %li)", buf, 0x16u);
    }
LABEL_22:

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v19, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_23;
  }
  v20 = objc_retainAutorelease(v6);
  v21 = (void *)objc_msgSend(v20, "mutableBytes");
  v22 = objc_msgSend(v20, "length");
  if (v21)
    memset_s(v21, v22, 0, v22);
  v23 = objc_retainAutorelease(v31);
  objc_msgSend(v23, "bytes");
  objc_msgSend(v23, "length");
  objc_msgSend(v7, "length");
  v24 = objc_retainAutorelease(v7);
  objc_msgSend(v24, "mutableBytes");
  v25 = PairingSessionDeriveKey();
  if (v25)
  {
    LODWORD(v19) = v25;
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    v19 = (int)v19;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2048;
      v35 = (int)v19;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to derive output key (OSStatus = %li)", buf, 0x16u);
    }
    goto LABEL_22;
  }
  v26 = objc_retainAutorelease(v30);
  v27 = (void *)objc_msgSend(v26, "mutableBytes");
  v28 = objc_msgSend(v26, "length");
  if (v27)
    memset_s(v27, v28, 0, v28);
  objc_storeStrong((id *)&self->_inputKey, v16);
  objc_storeStrong((id *)&self->_inputNonce, v20);
  objc_storeStrong((id *)&self->_outputKey, v24);
  objc_storeStrong((id *)&self->_outputNonce, v26);
  v13 = 0;
  v14 = 1;
LABEL_23:

  if (a3)
LABEL_24:
    *a3 = objc_retainAutorelease(v13);
LABEL_25:

  return v14;
}

- (void)_receivedData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  ICDelegationServicePairingSession *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_state == 1)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2048;
      v14 = objc_msgSend(v4, "length");
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Passing data of length %li to pairing session", buf, 0x16u);
    }

    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "length");
    v7 = PairingSessionExchange();
    if (v7)
    {
      v8 = v7;
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v12 = self;
        v13 = 1024;
        LODWORD(v14) = v8;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Error returned from PairingSessionExchange: %i", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDelegationServicePairingSession _handlePairingSessionCompletionWithError:](self, "_handlePairingSessionCompletionWithError:", v10);

    }
  }

}

- (void)_sendData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *calloutQueue;
  void *v11;
  _QWORD v12[4];
  id v13;
  ICDelegationServicePairingSession *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__ICDelegationServicePairingSession__sendData_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E4390EA8;
    v13 = WeakRetained;
    v14 = self;
    v15 = v6;
    v16 = v7;
    dispatch_async(calloutQueue, v12);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

- (ICDelegationServicePairingSessionDelegate)delegate
{
  return (ICDelegationServicePairingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)role
{
  return self->_role;
}

- (ICDelegationServiceSecuritySettings)securitySettings
{
  return self->_securitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);
  objc_storeStrong((id *)&self->_inputKey, 0);
  objc_storeStrong((id *)&self->_existingPairingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

uint64_t __69__ICDelegationServicePairingSession__sendData_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delegationServicePairingSession:sendData:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __78__ICDelegationServicePairingSession__handlePairingSessionCompletionWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6), *(_QWORD *)(a1 + 40) == 0, *(_QWORD *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] == 2)
  {
    objc_msgSend(v2, "_encryptedDataForData:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v5 = *(id *)(a1 + 48);
    v10 = v3;
    v11 = v5;
    v6 = v3;
    dispatch_async(v4, block);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v8);

  }
}

void __83__ICDelegationServicePairingSession_getEncryptedDataForData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), v1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7806, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) != 2)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = -7101;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "length") <= 0xF)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = -7805;
LABEL_5:
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ICError"), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", objc_msgSend(*(id *)(a1 + 40), "length") - 16, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", 0, objc_msgSend(*(id *)(a1 + 40), "length") - 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v7, "length"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bytes");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "bytes");
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v5 = objc_retainAutorelease(v8);
  objc_msgSend(v5, "mutableBytes");
  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v10, "bytes");
  v11 = chacha20_poly1305_decrypt_all_64x64();
  v12 = (_BYTE *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "mutableBytes");
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "length");
  if (v13)
  {
    v14 = v13 - 1;
    do
    {
      if (++*v12++)
        v16 = 1;
      else
        v16 = v14 == 0;
      --v14;
    }
    while (!v16);
  }
  if (v11)
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  else
  {
    v4 = 0;
  }

LABEL_17:
  v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4390E58;
  v18 = *(id *)(a1 + 48);
  v23 = v4;
  v24 = v18;
  v22 = v5;
  v19 = v4;
  v20 = v5;
  dispatch_async(v17, block);

}

uint64_t __92__ICDelegationServicePairingSession_getDecryptedDataForEncryptedData_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __51__ICDelegationServicePairingSession_receievedData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedData:", *(_QWORD *)(a1 + 40));
}

void __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  __CFString *v23;
  _BYTE buf[12];
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[9];
  if (v4 == 2)
  {
    if (!v2)
      return;
    v5 = v3[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E4390D18;
    v23 = v2;
    dispatch_async(v5, block);
    v6 = v23;
    goto LABEL_34;
  }
  if (v2)
  {
    v7 = (void *)v3[3];
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = v8;

      v2 = *(void **)(a1 + 40);
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
    v11 = (void *)MEMORY[0x1A1AFA8D0](v2);
    objc_msgSend(v7, "addObject:", v11);

    v3 = *(_QWORD **)(a1 + 32);
    v4 = v3[9];
  }
  if (!v4)
  {
    v3[9] = 1;
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 96);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Opening with security settings: %@", buf, 0x16u);
    }

    v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "securityMode");
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(v16 + 88);
    if (v17 == 2)
    {
      if (v15 != 1)
      {
        if (v15 != 2)
        {
          if (v15 == 4)
          {
            objc_msgSend(*(id *)(v16 + 96), "password");
            v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v18 = 2;
            goto LABEL_28;
          }
          goto LABEL_21;
        }
        v6 = 0;
        v18 = 4;
        goto LABEL_28;
      }
      v18 = 2;
    }
    else
    {
      if (v17 != 1)
      {
LABEL_21:
        v6 = 0;
        v18 = 0;
        goto LABEL_28;
      }
      if (v15 != 1)
      {
        if (v15 != 2)
        {
          if (v15 == 4)
          {
            objc_msgSend(*(id *)(v16 + 96), "password");
            v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v18 = 1;
            goto LABEL_28;
          }
          goto LABEL_21;
        }
        v6 = 0;
        v18 = 3;
LABEL_28:
        *(_QWORD *)buf = 0;
        v19 = PairingSessionCreate();
        if (v19)
        {
          v20 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v19, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_handlePairingSessionCompletionWithError:", v21);

        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)buf;
          PairingSessionSetFlags();
          if (-[__CFString length](v6, "length"))
          {
            -[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
            PairingSessionSetSetupCode();
          }
          if ((v18 | 2) == 3)
            objc_msgSend(*(id *)(a1 + 32), "_receivedData:", 0);
        }
LABEL_34:

        return;
      }
      v18 = 1;
    }
    v6 = CFSTR("<default>");
    goto LABEL_28;
  }
}

uint64_t __82__ICDelegationServicePairingSession_prepareEncryptedSessionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
