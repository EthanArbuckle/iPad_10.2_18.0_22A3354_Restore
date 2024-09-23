@implementation SUMescalSession

- (SUMescalSession)init
{
  SUMescalSession *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  CFStringEncoding SystemEncoding;
  const __CFData *ExternalRepresentation;
  const __CFData *v8;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  objc_super v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)SUMescalSession;
  v2 = -[SUMescalSession init](&v22, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.SUMescalSession.%p"), v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);

    v4 = MGCopyAnswer();
    if (v4)
    {
      v5 = (const __CFString *)v4;
      SystemEncoding = CFStringGetSystemEncoding();
      ExternalRepresentation = CFStringCreateExternalRepresentation(0, v5, SystemEncoding, 0);
      if (ExternalRepresentation)
      {
        v8 = ExternalRepresentation;
        BytePtr = CFDataGetBytePtr(ExternalRepresentation);
        Length = CFDataGetLength(v8);
        zxcm2Qme0x((uint64_t)BytePtr, Length, (uint64_t)&v2->_hardwareInfo);
        CFRelease(v8);
      }
      else
      {
        zxcm2Qme0x(0, 0, (uint64_t)&v2->_hardwareInfo);
      }
      CFRelease(v5);
    }
    cp2g1b9ro((uint64_t)&v2->_session, (uint64_t)&v2->_hardwareInfo);
    if (v11)
    {
      cp2g1b9ro((uint64_t)&v2->_session, (uint64_t)&v2->_hardwareInfo);
      if (v12)
      {
        v13 = v12;
        v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v15 = objc_msgSend(v14, "shouldLog");
        if (objc_msgSend(v14, "shouldLogToDisk"))
          v16 = v15 | 2;
        else
          v16 = v15;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v16 &= 2u;
        if (v16)
        {
          v17 = objc_opt_class();
          v23 = 138412546;
          v24 = v17;
          v25 = 2048;
          v26 = v13;
          LODWORD(v21) = 22;
          v18 = _os_log_send_and_compose_impl();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v23, v21);
            free(v19);
            SSFileLog();
          }
        }

        return 0;
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  FPSAPContextOpaque_ *session;
  NSObject *dispatchQueue;
  objc_super v5;

  session = self->_session;
  if (session)
  {
    IPaI1oem5iL((uint64_t)session);
    self->_session = 0;
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  v5.receiver = self;
  v5.super_class = (Class)SUMescalSession;
  -[SUMescalSession dealloc](&v5, sel_dealloc);
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  NSObject *dispatchQueue;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__53;
  v22 = __Block_byref_object_dispose__53;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__SUMescalSession_exchangeData_error___block_invoke;
  v11[3] = &unk_24DE7E390;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  v6 = (id)v13[5];
  v7 = v19;
  v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = (id)v13[5];
    v8 = (void *)v7[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __38__SUMescalSession_exchangeData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int *v14;
  uint64_t v15;
  char v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 48);
  if (v3)
  {
    v18 = 0;
    v17 = 0;
    v16 = -1;
    Mib5yocT(210, v2 + 20, v3, objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)&v18, (uint64_t)&v17, (uint64_t)&v16);
    if (v4)
    {
      LODWORD(v5) = v4;
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v9 = v8;
      else
        v9 = v8 & 2;
      if (v9)
      {
        v5 = (int)v5;
        v19 = 134217984;
        v20 = (int)v5;
        LODWORD(v15) = 12;
        v14 = &v19;
        v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v19, v15);
          free(v11);
          v14 = (int *)v12;
          SSFileLog();
        }
      }
      else
      {
        v5 = (int)v5;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUFairPlayErrorDomain"), v5, 0, v14);
      objc_msgSend(*(id *)(a1 + 32), "_teardownSession");
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_newDataWithBytes:length:", v18, v17);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = v16 == 0;
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 15, 0);
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

- (BOOL)isComplete
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__SUMescalSession_isComplete__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__SUMescalSession_isComplete__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (id)primeForAccountCreationWithData:(id)a3 error:(id *)a4
{
  NSObject *dispatchQueue;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__53;
  v22 = __Block_byref_object_dispose__53;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__SUMescalSession_primeForAccountCreationWithData_error___block_invoke;
  v11[3] = &unk_24DE7E390;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  v6 = (id)v13[5];
  v7 = v19;
  v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = (id)v13[5];
    v8 = (void *)v7[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __57__SUMescalSession_primeForAccountCreationWithData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = (const __CFString *)*MEMORY[0x24BEB24A0];
    v14 = 15;
LABEL_15:
    v15 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, 0, v18);
    v16 = *(_QWORD *)(a1 + 48);
    goto LABEL_16;
  }
  v21 = 0;
  v20 = 0;
  jfkdDAjba3jd(v2, 100, objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), &v21, &v20);
  if (v3)
  {
    LODWORD(v4) = v3;
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      v8 = objc_opt_class();
      v4 = (int)v4;
      v22 = 138412546;
      v23 = v8;
      v24 = 2048;
      v25 = (int)v4;
      LODWORD(v19) = 22;
      v18 = &v22;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v22, v19);
        free(v10);
        v18 = (int *)v11;
        SSFileLog();
      }
    }
    else
    {
      v4 = (int)v4;
    }
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = CFSTR("SUFairPlayErrorDomain");
    v14 = v4;
    goto LABEL_15;
  }
  v15 = objc_msgSend(*(id *)(a1 + 32), "_newDataWithBytes:length:", v21, v20);
  v16 = *(_QWORD *)(a1 + 56);
LABEL_16:
  *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40) = v15;
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

- (id)signData:(id)a3 error:(id *)a4
{
  NSObject *dispatchQueue;
  id v6;
  uint64_t *v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__53;
  v22 = __Block_byref_object_dispose__53;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34__SUMescalSession_signData_error___block_invoke;
  v11[3] = &unk_24DE7E390;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  v6 = (id)v13[5];
  v7 = v19;
  v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = (id)v13[5];
    v8 = (void *)v7[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __34__SUMescalSession_signData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v12 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 15, 0);
    v13 = *(_QWORD *)(a1 + 48);
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(v13 + 8) + 40) = v12;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  v18 = 0;
  v17 = 0;
  Fc3vhtJDvr(v2, objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)&v18, (uint64_t)&v17);
  if (!v3)
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "_newDataWithBytes:length:", v18, v17);
    v13 = *(_QWORD *)(a1 + 56);
    goto LABEL_13;
  }
  LODWORD(v4) = v3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (v7)
  {
    v8 = objc_opt_class();
    v4 = (int)v4;
    v19 = 138412546;
    v20 = v8;
    v21 = 2048;
    v22 = (int)v4;
    LODWORD(v16) = 22;
    v15 = &v19;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v19, v16);
      free(v10);
      v15 = (int *)v11;
      SSFileLog();
    }
  }
  else
  {
    v4 = (int)v4;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUFairPlayErrorDomain"), v4, 0, v15);
  objc_msgSend(*(id *)(a1 + 32), "_teardownSession");
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  NSObject *dispatchQueue;
  id v6;
  uint64_t *v7;
  int v8;
  BOOL v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__53;
  v16 = __Block_byref_object_dispose__53;
  v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__SUMescalSession_verifyPrimeSignature_error___block_invoke;
  v11[3] = &unk_24DE7E390;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v12;
  v11[7] = &v18;
  dispatch_sync(dispatchQueue, v11);
  v6 = (id)v13[5];
  v7 = v19;
  v8 = *((unsigned __int8 *)v19 + 24);
  if (a4 && !*((_BYTE *)v19 + 24))
  {
    *a4 = (id)v13[5];
    v8 = *((unsigned __int8 *)v7 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

id __46__SUMescalSession_verifyPrimeSignature_error___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "bytes");
    objc_msgSend(*(id *)(a1 + 40), "length");
    gLg1CWr7p();
    if (v2)
    {
      LODWORD(v3) = v2;
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v5 = objc_msgSend(v4, "shouldLog");
      if (objc_msgSend(v4, "shouldLogToDisk"))
        v6 = v5 | 2;
      else
        v6 = v5;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v6 &= 2u;
      if (v6)
      {
        v3 = (int)v3;
        v13 = 138412546;
        v14 = objc_opt_class();
        v15 = 2048;
        v16 = (int)v3;
        LODWORD(v12) = 22;
        v11 = &v13;
        v7 = _os_log_send_and_compose_impl();
        if (v7)
        {
          v8 = (void *)v7;
          v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v13, v12);
          free(v8);
          v11 = (int *)v9;
          SSFileLog();
        }
      }
      else
      {
        v3 = (int)v3;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUFairPlayErrorDomain"), v3, 0, v11);
      objc_msgSend(*(id *)(a1 + 32), "_teardownSession");
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 15, 0);
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

- (id)_newDataWithBytes:(char *)a3 length:(unsigned int)a4
{
  const __CFAllocator *v6;
  CFDataRef v7;
  CFAllocatorContext v9;

  *(_OWORD *)&v9.reallocate = unk_24DE7E3E0;
  v9.preferredSize = 0;
  memset(&v9, 0, 48);
  v6 = CFAllocatorCreate(0, &v9);
  v7 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)a3, a4, v6);
  CFRelease(v6);
  return v7;
}

- (void)_teardownSession
{
  FPSAPContextOpaque_ *session;

  session = self->_session;
  if (session)
  {
    IPaI1oem5iL((uint64_t)session);
    self->_session = 0;
  }
  self->_complete = 0;
}

@end
