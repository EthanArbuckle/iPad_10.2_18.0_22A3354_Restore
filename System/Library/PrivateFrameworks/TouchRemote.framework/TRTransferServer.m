@implementation TRTransferServer

- (TRTransferServer)init
{
  TRTransferServer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *responseSemaphore;
  id v7;
  void *v8;
  uint64_t v9;
  WPTransfer *transferSession;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TRTransferServer;
  v2 = -[TRTransferServer init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TouchRemote.TRTransferServer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_semaphore_create(0);
    responseSemaphore = v2->_responseSemaphore;
    v2->_responseSemaphore = (OS_dispatch_semaphore *)v5;

    v7 = objc_alloc(MEMORY[0x24BEC2B68]);
    dispatch_get_global_queue(0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithDelegate:queue:", v2, v8);
    transferSession = v2->_transferSession;
    v2->_transferSession = (WPTransfer *)v9;

    v2->_advertiserState = -[WPTransfer advertiserState](v2->_transferSession, "advertiserState");
  }
  return v2;
}

- (void)dealloc
{
  AirPlayPairingSessionPrivate *pairingSession;
  objc_super v4;

  -[WPTransfer invalidate](self->_transferSession, "invalidate");
  if (self->_waitingOnSemaphore)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_responseSemaphore);
  pairingSession = self->_pairingSession;
  if (pairingSession)
    CFRelease(pairingSession);
  if (self->_aesContext)
  {
    AES_CTR_Final();
    free(self->_aesContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRTransferServer;
  -[TRTransferServer dealloc](&v4, sel_dealloc);
}

- (void)transferDidUpdateAdvertiserState:(id)a3
{
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "advertiserState");
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__TRTransferServer_transferDidUpdateAdvertiserState___block_invoke;
  v6[3] = &unk_24C2E4E90;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

_BYTE *__53__TRTransferServer_transferDidUpdateAdvertiserState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _BYTE *result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(a1 + 40);
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Advertiser state: %ld", (uint8_t *)&v5, 0xCu);
    }

  }
  result = *(_BYTE **)(a1 + 32);
  if (result[56])
    return (_BYTE *)objc_msgSend(result, "_beginAdvertisingIfPowered");
  return result;
}

- (void)transferDidFailToStartAdvertising:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Did fail to start advertising: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (id)transferDidReceiveData:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  TRTransferServer *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = (void *)objc_msgSend(a3, "copy");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__TRTransferServer_transferDidReceiveData___block_invoke;
  block[3] = &unk_24C2E4EE0;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __43__TRTransferServer_transferDidReceiveData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  const void *v24;
  NSObject *v25;
  const char *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(NSObject **)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412546;
      v30 = v3;
      v31 = 2048;
      v32 = v4;
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Received a full packet: %@, state: %li", buf, 0x16u);
    }

  }
  v5 = *(_QWORD **)(a1 + 40);
  switch(v5[4])
  {
    case 0:
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Pairing started.", buf, 2u);
        }

      }
      v7 = gQblcfSzZBQsYCCV();
      if (!v7)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = 1;
        v5 = *(_QWORD **)(a1 + 40);
        goto LABEL_24;
      }
      if (_TRLogEnabled == 1)
      {
        v8 = v7;
        TRLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        *(_DWORD *)buf = 134217984;
        v30 = v8;
        v10 = "[TRTransferServer] Error: Unable to start pairing session: %li";
        goto LABEL_17;
      }
      return;
    case 1:
LABEL_24:
      v20 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
      v21 = objc_msgSend(*(id *)(a1 + 32), "length");
      v28 = 0;
      v22 = objc_msgSend(v5, "_runSetupStepWithInput:inputLength:outputData:", v20, v21, &v28);
      v15 = v28;
      v9 = v28;
      if (v22)
      {
        if (_TRLogEnabled != 1)
          goto LABEL_30;
        TRLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v30 = v22;
          v17 = "[TRTransferServer] Setup failed: %li";
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      if (_TRLogEnabled != 1)
        goto LABEL_41;
      TRLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        v26 = "[TRTransferServer] Setup output data: %@";
        goto LABEL_39;
      }
      goto LABEL_40;
    case 2:
      v12 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
      v13 = objc_msgSend(*(id *)(a1 + 32), "length");
      v27 = 0;
      v14 = objc_msgSend(v5, "_runVerifyStepWithInput:inputLength:outputData:", v12, v13, &v27);
      v15 = v27;
      v9 = v27;
      if (v14)
      {
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v30 = v14;
            v17 = "[TRTransferServer] Verify failed: %li";
LABEL_28:
            _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
          }
LABEL_29:

        }
LABEL_30:
        v23 = *(_QWORD *)(a1 + 40);
        v24 = *(const void **)(v23 + 24);
        if (v24)
        {
          CFRelease(v24);
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = 0;
          v23 = *(_QWORD *)(a1 + 40);
        }
        *(_QWORD *)(v23 + 32) = 0;
      }
      else
      {
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v9;
            v26 = "[TRTransferServer] Verify output data: %@";
LABEL_39:
            _os_log_impl(&dword_20A2BF000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
          }
LABEL_40:

        }
LABEL_41:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v15);
      }
      goto LABEL_42;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_didReceiveEncryptedData:", *(_QWORD *)(a1 + 32));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(NSObject **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
      goto LABEL_42;
    default:
      if (_TRLogEnabled != 1)
        return;
      TRLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
        *(_DWORD *)buf = 134217984;
        v30 = v11;
        v10 = "[TRTransferServer] Error: Invalid pairing state (%li)";
LABEL_17:
        _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      }
LABEL_42:

      return;
  }
}

- (void)transferDidFailWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  TRTransferServer *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__TRTransferServer_transferDidFailWithError___block_invoke;
  v7[3] = &unk_24C2E4F30;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__TRTransferServer_transferDidFailWithError___block_invoke(int8x16_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  id WeakRetained;
  id v7;
  id v8;
  int8x16_t v9;
  _QWORD block[4];
  id v11;
  int8x16_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[2].i64[0];
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Transfer failed with error: %@", buf, 0xCu);
    }

  }
  v4 = a1[2].i64[1];
  v5 = *(const void **)(v4 + 24);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1[2].i64[1] + 24) = 0;
    v4 = a1[2].i64[1];
  }
  *(_QWORD *)(v4 + 32) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1[2].i64[1] + 80));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__TRTransferServer_transferDidFailWithError___block_invoke_81;
  block[3] = &unk_24C2E5098;
  v11 = WeakRetained;
  v9 = a1[2];
  v7 = (id)v9.i64[0];
  v12 = vextq_s8(v9, v9, 8uLL);
  v8 = WeakRetained;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

uint64_t __45__TRTransferServer_transferDidFailWithError___block_invoke_81(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "server:didFailToReceiveData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)transferComplete
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__TRTransferServer_transferComplete__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__TRTransferServer_transferComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[16];

  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Transfer completed.", buf, 2u);
    }

  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(const void **)(v3 + 24);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v3 + 32) = 0;
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 16))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 80));
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__TRTransferServer_transferComplete__block_invoke_84;
    v9[3] = &unk_24C2E4F30;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = WeakRetained;
    v11 = v7;
    v8 = WeakRetained;
    dispatch_sync(MEMORY[0x24BDAC9B8], v9);

  }
}

uint64_t __36__TRTransferServer_transferComplete__block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "server:didFailToReceiveData:", *(_QWORD *)(a1 + 40), 0);
  return result;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__TRTransferServer_start__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __25__TRTransferServer_start__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 56))
  {
    *(_BYTE *)(v1 + 56) = 1;
    return objc_msgSend(*(id *)(result + 32), "_beginAdvertisingIfPowered");
  }
  return result;
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__TRTransferServer_stop__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __24__TRTransferServer_stop__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 56))
  {
    v2 = result;
    *(_BYTE *)(v1 + 56) = 0;
    v3 = *(_QWORD *)(result + 32);
    if (*(_QWORD *)(v3 + 64) == 3)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Stopping advertising...", v5, 2u);
        }

        v3 = *(_QWORD *)(v2 + 32);
      }
      return objc_msgSend(*(id *)(v3 + 72), "stopAdvertising");
    }
  }
  return result;
}

- (void)_beginAdvertisingIfPowered
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_advertiserState == 3)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Starting advertising...", v4, 2u);
      }

    }
    -[WPTransfer startAdvertising](self->_transferSession, "startAdvertising");
  }
}

- (void)_onQueue_didFinishPairing
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v12;
  AirPlayPairingSessionPrivate *pairingSession;
  id WeakRetained;
  id v15;
  _QWORD v16[4];
  id v17;
  TRTransferServer *v18;
  uint8_t v19[4];
  uint64_t v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Pairing finished.", buf, 2u);
    }

  }
  objc_msgSend(CFSTR("TRBT-Key"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("TRBT-IV"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "length");
  v8 = PCFdAVst();
  if (v8)
  {
    if (_TRLogEnabled != 1)
    {
LABEL_15:
      v12 = 1;
      goto LABEL_16;
    }
    v9 = v8;
    TRLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 134217984;
      v20 = v9;
      v11 = "[TRTransferServer] Error: Unable to derive key: %li";
LABEL_13:
      _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, v11, v19, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  self->_aesContext = ($D2B14CE87E15B00C17B758FDEADD6073 *)malloc_type_calloc(1uLL, 0x30uLL, 0x1020040423EBB36uLL);
  v12 = AES_CTR_Init();
  if (v12 && _TRLogEnabled == 1)
  {
    TRLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 134217984;
      v20 = v12;
      v11 = "[TRTransferServer] Error: Unable to initialize context: %li";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  if (v12)
  {
    self->_pairingState = 0;
  }
  else
  {
    self->_pairingState = 3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __45__TRTransferServer__onQueue_didFinishPairing__block_invoke;
    v16[3] = &unk_24C2E4F30;
    v17 = WeakRetained;
    v18 = self;
    v15 = WeakRetained;
    dispatch_sync(MEMORY[0x24BDAC9B8], v16);

  }
}

uint64_t __45__TRTransferServer__onQueue_didFinishPairing__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "serverWillReceiveData:", *(_QWORD *)(a1 + 40));
  return result;
}

- (id)_onQueue_didReceiveEncryptedData:(id)a3
{
  id v4;
  void *v5;
  void *aesContext;
  id v7;
  id v8;
  id WeakRetained;
  int v10;
  id v11;
  id v12;
  TRTransferServer *v13;
  TRTransferServer *v14;
  TRTransferServer *v15;
  _QWORD block[4];
  id v18;
  TRTransferServer *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  TRTransferServer *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", objc_msgSend(v4, "length"));
    aesContext = self->_aesContext;
    if (!aesContext)
    {
LABEL_22:

      goto LABEL_23;
    }
    v7 = objc_retainAutorelease(v4);
    objc_msgSend(v7, "bytes");
    objc_msgSend(v7, "length");
    v8 = objc_retainAutorelease(v5);
    objc_msgSend(v8, "mutableBytes");
    if (AES_CTR_Update())
    {
      aesContext = 0;
      goto LABEL_22;
    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    v31 = __Block_byref_object_dispose__0;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = 1;
    self->_didSendData = 1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke;
    block[3] = &unk_24C2E50C0;
    v11 = WeakRetained;
    v21 = &v23;
    v18 = v11;
    v19 = self;
    v20 = v8;
    v22 = &v27;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    if (*((_BYTE *)v24 + 24))
    {
      self->_waitingOnSemaphore = 1;
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_responseSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      self->_waitingOnSemaphore = 0;
    }
    if (v28[5])
    {
      v12 = objc_alloc(MEMORY[0x24BDBCEC8]);
      v13 = (TRTransferServer *)objc_msgSend(v12, "initWithLength:", objc_msgSend((id)v28[5], "length"));
      v14 = v13;
      if (!self->_aesContext)
      {
        self = v13;
        goto LABEL_18;
      }
      objc_msgSend(objc_retainAutorelease((id)v28[5]), "bytes");
      objc_msgSend((id)v28[5], "length");
      self = objc_retainAutorelease(v14);
      -[TRTransferServer mutableBytes](self, "mutableBytes");
      if (AES_CTR_Update())
      {
        v10 = 1;
LABEL_18:

        self = v14;
        goto LABEL_19;
      }
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v15 = (TRTransferServer *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = self;
          _os_log_impl(&dword_20A2BF000, &v15->super, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Writing exchange data response: %@", buf, 0xCu);
        }
        v10 = 0;
        self = v15;
        goto LABEL_18;
      }
      v10 = 0;
    }
LABEL_19:

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);

    if (v10)
      aesContext = 0;
    else
      aesContext = self;
    goto LABEL_22;
  }
  aesContext = 0;
LABEL_23:

  return aesContext;
}

void __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke_2;
    v6[3] = &unk_24C2E4EB8;
    v5 = *(_QWORD *)(a1 + 64);
    v6[4] = *(_QWORD *)(a1 + 40);
    v6[5] = v5;
    objc_msgSend(v2, "server:didReceiveData:replyHandler:", v3, v4, v6);

  }
}

void __53__TRTransferServer__onQueue_didReceiveEncryptedData___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "length");
  if (v3)
    v4 = (void *)objc_msgSend(v5, "copy");
  else
    v4 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (v3)

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 48));
}

- (int)_runSetupStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int64_t pairingState;
  uint8_t buf[4];
  unint64_t v16;
  _OWORD v17[6];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  memset(v17, 0, sizeof(v17));
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = a4;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Setup input data length: %ld", buf, 0xCu);
    }

  }
  if (self->_pairingSession)
  {
    v9 = h4BvW7X();
    if (v9)
    {
      v10 = v9;
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v16 = v10;
          _os_log_impl(&dword_20A2BF000, v11, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Unable to do session pairing setup exhange (%li)", buf, 0xCu);
        }

      }
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v17, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = 0;
      self->_pairingState = 1;
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        pairingState = self->_pairingState;
        *(_DWORD *)buf = 134217984;
        v16 = pairingState;
        _os_log_impl(&dword_20A2BF000, v12, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] No session for pairing setup exhange (state: %ld)", buf, 0xCu);
      }

    }
    return 0;
  }
  return v10;
}

- (int)_runVerifyStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int64_t pairingState;
  uint8_t buf[4];
  int64_t v14;
  _OWORD v15[6];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  memset(v15, 0, sizeof(v15));
  if (self->_pairingSession)
  {
    v7 = VBAEFt();
    if (v7)
    {
      v8 = v7;
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v14 = v8;
          _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] Unable to do session pairing verify exhange (%li)", buf, 0xCu);
        }

      }
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v15, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = 0;
      self->_pairingState = 2;
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        pairingState = self->_pairingState;
        *(_DWORD *)buf = 134217984;
        v14 = pairingState;
        _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "[TRTransferServer] No session for pairing verify exhange (state: %ld)", buf, 0xCu);
      }

    }
    return 0;
  }
  return v8;
}

- (TRTransferServerDelegate)delegate
{
  return (TRTransferServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transferSession, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
