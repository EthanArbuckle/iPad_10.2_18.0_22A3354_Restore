@implementation TRTransferBrowser

- (TRTransferBrowser)init
{
  TRTransferBrowser *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *responseSemaphore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRTransferBrowser;
  v2 = -[TRTransferBrowser init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TouchRemote.TRTransferBrowser", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_semaphore_create(0);
    responseSemaphore = v2->_responseSemaphore;
    v2->_responseSemaphore = (OS_dispatch_semaphore *)v5;

  }
  return v2;
}

- (void)dealloc
{
  AirPlayPairingSessionPrivate *pairingSession;
  objc_super v4;

  pairingSession = self->_pairingSession;
  if (pairingSession)
    CFRelease(pairingSession);
  if (self->_aesContext)
  {
    AES_CTR_Final();
    free(self->_aesContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRTransferBrowser;
  -[TRTransferBrowser dealloc](&v4, sel_dealloc);
}

- (void)transferDidUpdateScannerState:(id)a3
{
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "scannerState");
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TRTransferBrowser_transferDidUpdateScannerState___block_invoke;
  v6[3] = &unk_24C2E4E90;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

_BYTE *__51__TRTransferBrowser_transferDidUpdateScannerState___block_invoke(uint64_t a1)
{
  _BYTE *result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(a1 + 40);
  result = *(_BYTE **)(a1 + 32);
  if (result[48])
    return (_BYTE *)objc_msgSend(result, "_beginScanningIfPowered");
  return result;
}

- (id)transferDidReceiveData:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  TRTransferBrowser *v11;
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
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TRTransferBrowser_transferDidReceiveData___block_invoke;
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

void __44__TRTransferBrowser_transferDidReceiveData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  NSObject *v23;
  const void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  id WeakRetained;
  id v37;
  char v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  _QWORD *v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  uint8_t v64[4];
  uint64_t v65;
  _BYTE buf[24];
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Received a full packet: %@, state: %li", buf, 0x16u);
    }

  }
  v5 = *(_QWORD **)(a1 + 40);
  switch(v5[3])
  {
    case 0:
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Pairing started.", buf, 2u);
        }

      }
      v7 = gQblcfSzZBQsYCCV();
      if (!v7)
      {
        v26 = *(void **)(a1 + 40);
        v63 = 0;
        v27 = objc_msgSend(v26, "_runSetupStepWithInput:inputLength:outputData:", 0, 0, &v63);
        v28 = v63;
        v8 = v63;
        if (v27)
        {
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v27;
              _os_log_impl(&dword_20A2BF000, v29, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup failed: %li", buf, 0xCu);
            }

          }
          v30 = *(_QWORD *)(a1 + 40);
          v31 = *(const void **)(v30 + 16);
          if (!v31)
          {
            v32 = 0;
            goto LABEL_88;
          }
          CFRelease(v31);
          v32 = 0;
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 0;
        }
        else
        {
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v8;
              _os_log_impl(&dword_20A2BF000, v57, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup output data: %@ (%p)", buf, 0x16u);
            }

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v28);
          v32 = 1;
        }
        v30 = *(_QWORD *)(a1 + 40);
LABEL_88:
        *(_QWORD *)(v30 + 24) = v32;
        goto LABEL_101;
      }
      if (_TRLogEnabled != 1)
        return;
      TRLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_101;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v7;
      v9 = "Error: [TRTransferBrowser] Unable to start pairing session: %li";
LABEL_34:
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_101:

      return;
    case 1:
      v19 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
      v20 = objc_msgSend(*(id *)(a1 + 32), "length");
      v62 = 0;
      v21 = objc_msgSend(v5, "_runSetupStepWithInput:inputLength:outputData:", v19, v20, &v62);
      v22 = v62;
      v8 = v62;
      if (!v21)
      {
        v50 = *(_QWORD **)(a1 + 40);
        if (v50[3] == 2)
        {
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20A2BF000, v51, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify started.", buf, 2u);
            }

            v50 = *(_QWORD **)(a1 + 40);
          }
          v61 = v8;
          v52 = objc_msgSend(v50, "_runVerifyStepWithInput:inputLength:outputData:", 0, 0, &v61);
          v53 = v61;
          v54 = v61;

          if (!v52)
          {
            if (_TRLogEnabled == 1)
            {
              TRLogHandle();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v54;
                _os_log_impl(&dword_20A2BF000, v55, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Initial verify output data: %@", buf, 0xCu);
              }

            }
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v53);
          }
          v8 = v54;
        }
        else
        {
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v8;
              _os_log_impl(&dword_20A2BF000, v56, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup output data: %@", buf, 0xCu);
            }

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v22);
        }
        goto LABEL_101;
      }
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v21;
          _os_log_impl(&dword_20A2BF000, v23, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup failed: %li", buf, 0xCu);
        }

      }
      v15 = *(_QWORD *)(a1 + 40);
      v24 = *(const void **)(v15 + 16);
      if (v24)
      {
        CFRelease(v24);
        goto LABEL_29;
      }
      goto LABEL_30;
    case 2:
      v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
      v11 = objc_msgSend(*(id *)(a1 + 32), "length");
      v60 = 0;
      v12 = objc_msgSend(v5, "_runVerifyStepWithInput:inputLength:outputData:", v10, v11, &v60);
      v13 = v60;
      v8 = v60;
      if (v12)
      {
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v12;
            _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify failed: %li", buf, 0xCu);
          }

        }
        v15 = *(_QWORD *)(a1 + 40);
        v16 = *(const void **)(v15 + 16);
        if (v16)
        {
          CFRelease(v16);
LABEL_29:
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 0;
          v15 = *(_QWORD *)(a1 + 40);
        }
LABEL_30:
        *(_QWORD *)(v15 + 24) = 0;
        goto LABEL_101;
      }
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v8;
          _os_log_impl(&dword_20A2BF000, v33, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify output data: %@", buf, 0xCu);
        }

      }
      v34 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v34 + 24) != 3)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
        goto LABEL_101;
      }
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = WeakRetained;
          _os_log_impl(&dword_20A2BF000, v35, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Asking delegate %@ for data...", buf, 0xCu);

        }
        v34 = *(_QWORD *)(a1 + 40);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v67 = __Block_byref_object_copy_;
      v68 = __Block_byref_object_dispose_;
      v69 = 0;
      v37 = objc_loadWeakRetained((id *)(v34 + 72));
      v38 = objc_opt_respondsToSelector();

      if ((v38 & 1) != 0)
      {
        v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
        objc_msgSend(v39, "browser:didStartTransferWithSendDataHandler:", MEMORY[0x24BDAC760], 3221225472, __44__TRTransferBrowser_transferDidReceiveData___block_invoke_83, &unk_24C2E4EB8, *(_QWORD *)(a1 + 40), buf);

        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 49) = 1;
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 40), 0xFFFFFFFFFFFFFFFFLL);
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 49) = 0;
      }
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v64 = 138412290;
          v65 = v41;
          _os_log_impl(&dword_20A2BF000, v40, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Got delegate data: %@", v64, 0xCu);
        }

      }
      if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "length"))
      {
        v42 = objc_alloc(MEMORY[0x24BDBCEC8]);
        v43 = objc_msgSend(v42, "initWithLength:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "length"));
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
        {
          if (_TRLogEnabled != 1)
          {
LABEL_98:
            v44 = v43;
            goto LABEL_99;
          }
          TRLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v64 = 0;
            v47 = "Error: [TRTransferBrowser] No context for sending.";
            v48 = v46;
            v49 = 2;
            goto LABEL_95;
          }
LABEL_97:

          goto LABEL_98;
        }
        objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40)), "bytes");
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "length");
        v44 = objc_retainAutorelease(v43);
        -[NSObject mutableBytes](v44, "mutableBytes");
        v45 = AES_CTR_Update();
        if (!v45)
        {
          v58 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v59 = v44;
          v46 = *(NSObject **)(v58 + 40);
          *(_QWORD *)(v58 + 40) = v59;
          goto LABEL_97;
        }
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 134217984;
            v65 = v45;
            v47 = "Error: [TRTransferBrowser] Context for sending failed: %ld";
            v48 = v46;
            v49 = 12;
LABEL_95:
            _os_log_impl(&dword_20A2BF000, v48, OS_LOG_TYPE_DEFAULT, v47, v64, v49);
            goto LABEL_97;
          }
          goto LABEL_97;
        }
      }
      else
      {
        if (_TRLogEnabled != 1)
        {
LABEL_100:
          _Block_object_dispose(buf, 8);

          goto LABEL_101;
        }
        TRLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v64 = 0;
          _os_log_impl(&dword_20A2BF000, v44, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Sending no data back.", v64, 2u);
        }
      }
LABEL_99:

      goto LABEL_100;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "_didReceiveEncryptedData:", *(_QWORD *)(a1 + 32));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(NSObject **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
      goto LABEL_101;
    default:
      if (_TRLogEnabled != 1)
        return;
      TRLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_101;
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v25;
      v9 = "Error: [TRTransferBrowser] Invalid pairing state (%li)";
      goto LABEL_34;
  }
}

void __44__TRTransferBrowser_transferDidReceiveData___block_invoke_83(uint64_t a1, void *a2)
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

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)transferDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Transfer failed with error: %@", buf, 0xCu);
    }

  }
  if (self->_waitingOnSemaphore)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_responseSemaphore);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "browserDidDisconnect:", self);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TRTransferBrowser_transferDidFailWithError___block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);

}

void __46__TRTransferBrowser_transferDidFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 16);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 24) = 0;
}

- (void)transferComplete
{
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Transfer completed.", buf, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "browserDidDisconnect:", self);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TRTransferBrowser_transferComplete__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__TRTransferBrowser_transferComplete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 16);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 24) = 0;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__TRTransferBrowser_start__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);
}

void __26__TRTransferBrowser_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 1;
    v10 = CFSTR("WPTimeAfterUnlock");
    v11[0] = &unk_24C2F2850;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x24BEC2B68]);
    v5 = *(_QWORD *)(a1 + 32);
    dispatch_get_global_queue(0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "initWithDelegate:queue:machName:options:", v5, v6, CFSTR("com.apple.touchsetupd.wirelessproximity"), v3);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 64);
    *(_QWORD *)(v8 + 64) = v7;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "scannerState");
    objc_msgSend(*(id *)(a1 + 32), "_beginScanningIfPowered");

  }
}

- (void)defer
{
  -[WPTransfer ignoreDevice](self->_transferSession, "ignoreDevice");
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__TRTransferBrowser_stop__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_async(queue, block);
}

void __25__TRTransferBrowser_stop__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 56) == 3)
      objc_msgSend(*(id *)(v5 + 64), "stopScan");
  }
}

- (void)_beginScanningIfPowered
{
  if (self->_scannerState == 3)
    -[WPTransfer startScan](self->_transferSession, "startScan");
}

- (void)_didFinishPairing
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
  int v13;
  AirPlayPairingSessionPrivate *pairingSession;
  int64_t v15;
  int v16;
  uint64_t v17;
  uint8_t buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Pairing finished.", buf, 2u);
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
      goto LABEL_15;
    v9 = v8;
    TRLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = 134217984;
    v17 = v9;
    v11 = "Error: [TRTransferBrowser] Unable to derive key: %li";
    goto LABEL_13;
  }
  self->_aesContext = ($D2B14CE87E15B00C17B758FDEADD6073 *)malloc_type_calloc(1uLL, 0x30uLL, 0x1020040423EBB36uLL);
  v12 = AES_CTR_Init();
  if (!v12)
  {
    v15 = 3;
    goto LABEL_19;
  }
  if (_TRLogEnabled == 1)
  {
    v13 = v12;
    TRLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      goto LABEL_15;
    }
    v16 = 134217984;
    v17 = v13;
    v11 = "Error: [TRTransferBrowser] Unable to intialize context: %li";
LABEL_13:
    _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    goto LABEL_14;
  }
LABEL_15:
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    v15 = 0;
    self->_pairingSession = 0;
  }
  else
  {
    v15 = 0;
  }
LABEL_19:
  self->_pairingState = v15;

}

- (id)_didReceiveEncryptedData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", objc_msgSend(v4, "length"));
    if (!self->_aesContext
      || (v6 = objc_retainAutorelease(v4),
          objc_msgSend(v6, "bytes"),
          objc_msgSend(v6, "length"),
          v7 = objc_retainAutorelease(v5),
          objc_msgSend(v7, "mutableBytes"),
          AES_CTR_Update()))
    {
      v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      v12 = (void *)objc_msgSend(v7, "copy");
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __46__TRTransferBrowser__didReceiveEncryptedData___block_invoke;
      v18[3] = &unk_24C2E4EB8;
      v18[4] = self;
      v18[5] = &v19;
      objc_msgSend(v11, "browser:didReceiveData:replyHandler:", self, v12, v18);

      self->_waitingOnSemaphore = 1;
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_responseSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      self->_waitingOnSemaphore = 0;
    }
    if (v20[5])
    {
      v13 = objc_alloc(MEMORY[0x24BDBCEC8]);
      v14 = (void *)objc_msgSend(v13, "initWithLength:", objc_msgSend((id)v20[5], "length"));
      objc_msgSend(objc_retainAutorelease((id)v20[5]), "bytes");
      objc_msgSend((id)v20[5], "length");
      v15 = objc_retainAutorelease(v14);
      -[NSObject mutableBytes](v15, "mutableBytes");
      if (AES_CTR_Update())
      {
        v8 = 0;
      }
      else
      {
        if (_TRLogEnabled != 1)
        {
          v8 = v15;
          goto LABEL_17;
        }
        TRLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v15;
          _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Writing exchange data response: %@", buf, 0xCu);
        }
        v8 = v15;
        v15 = v16;
      }

    }
    else
    {
      v8 = 0;
    }
LABEL_17:
    _Block_object_dispose(&v19, 8);

    goto LABEL_18;
  }
  v8 = 0;
LABEL_19:

  return v8;
}

void __46__TRTransferBrowser__didReceiveEncryptedData___block_invoke(uint64_t a1, void *a2)
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

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (int)_runSetupStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  unint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int64_t pairingState;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  id v20;
  _OWORD v21[6];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  memset(v21, 0, sizeof(v21));
  if (a4 == 1)
    v7 = *(_BYTE *)a3 != 0;
  else
    v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v7;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Setup input data length: %ld", buf, 0xCu);
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
          v18 = v10;
          _os_log_impl(&dword_20A2BF000, v11, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Unable to do session pairing setup exhange (%li)", buf, 0xCu);
        }

      }
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v21, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *a5;
            *(_DWORD *)buf = 138412546;
            v18 = (unint64_t)v15;
            v19 = 2048;
            v20 = v15;
            _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Writing setup exchange data: %@ (%p)", buf, 0x16u);
          }

        }
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
        v18 = pairingState;
        _os_log_impl(&dword_20A2BF000, v12, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] No session for pairing setup exhange (state: %ld)", buf, 0xCu);
      }

    }
    return 0;
  }
  return v10;
}

- (int)_runVerifyStepWithInput:(const void *)a3 inputLength:(unint64_t)a4 outputData:(id *)a5
{
  unint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int64_t pairingState;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  unint64_t v18;
  _OWORD v19[6];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  memset(v19, 0, sizeof(v19));
  if (a4 == 1)
    v7 = *(_BYTE *)a3 != 0;
  else
    v7 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v7;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Verify input data length: %ld", buf, 0xCu);
    }

  }
  if (self->_pairingSession)
  {
    v9 = VBAEFt();
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
          v18 = v10;
          _os_log_impl(&dword_20A2BF000, v11, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Unable to do session pairing verify exhange (%li)", buf, 0xCu);
        }

      }
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v19, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *a5;
            *(_DWORD *)buf = 138412290;
            v18 = (unint64_t)v16;
            _os_log_impl(&dword_20A2BF000, v15, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] Writing verify exchange data: %@", buf, 0xCu);
          }

        }
      }
      v10 = 0;
      self->_pairingState = 2;
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
        v18 = pairingState;
        _os_log_impl(&dword_20A2BF000, v12, OS_LOG_TYPE_DEFAULT, "[TRTransferBrowser] No session for pairing verify exhange (state: %ld)", buf, 0xCu);
      }

    }
    return 0;
  }
  return v10;
}

- (TRTransferBrowserDelegate)delegate
{
  return (TRTransferBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transferSession, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
