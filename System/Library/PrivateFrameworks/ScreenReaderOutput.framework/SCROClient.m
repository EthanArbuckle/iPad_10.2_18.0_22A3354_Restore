@implementation SCROClient

+ (void)initialize
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if ((id)objc_opt_class() == a1)
  {
    _LastIdentifier = 0;
    v2 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v3 = (void *)_Lock;
    _Lock = (uint64_t)v2;

    v4 = objc_opt_new();
    v5 = (void *)_ClientPortDictionary;
    _ClientPortDictionary = v4;

    v6 = objc_opt_new();
    v7 = (void *)_ClientIdentifierDictionary;
    _ClientIdentifierDictionary = v6;

    v8 = objc_opt_new();
    v9 = (void *)_ClientTrustDictionary;
    _ClientTrustDictionary = v8;

  }
}

+ (id)addClientGetIdentifier:(unsigned int *)a3 token:(id *)a4 getPort:(unsigned int *)a5
{
  unsigned int *v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  audit_token_t atoken;
  pid_t pidp;

  v8 = (unsigned int *)objc_alloc_init((Class)a1);
  v9 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&atoken.val[4] = v9;
  pidp = 0;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  v8[6] = pidp;
  objc_msgSend((id)_Lock, "lock");
  v8[4] = ++_LastIdentifier;
  *a5 = v8[5];
  *a3 = v8[4];
  v10 = (void *)_ClientPortDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v8, v11);

  v12 = (void *)_ClientIdentifierDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8[4]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v8, v13);

  objc_msgSend((id)_Lock, "unlock");
  return v8;
}

+ (int64_t)removeClientWithPort:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)_Lock, "lock");
  v4 = (void *)_ClientPortDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (unsigned int *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)_ClientIdentifierDictionary;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    v9 = (void *)_ClientPortDictionary;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

    v11 = (void *)_ClientTrustDictionary;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6[6]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
  v13 = objc_msgSend((id)_ClientPortDictionary, "count");
  objc_msgSend((id)_Lock, "unlock");
  if (v6)
  {
    objc_msgSend(v6, "_lock");
    objc_msgSend(v6, "_invalidate");
    objc_msgSend(v6, "_unlock");
  }

  return v13;
}

+ (BOOL)isClientTrustedWithPortToken:(id *)a3
{
  _OWORD *v3;
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  pid_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  pid_t pidp;
  audit_token_t atoken;
  uint64_t v21;

  MEMORY[0x24BDAC7A8](a1, a2, a3);
  v4 = v3;
  v21 = *MEMORY[0x24BDAC8D0];
  v5 = v3[1];
  *(_OWORD *)atoken.val = *v3;
  *(_OWORD *)&atoken.val[4] = v5;
  pidp = 0;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  v6 = pidp;
  objc_msgSend((id)_Lock, "lock");
  v7 = (void *)_ClientTrustDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    LOBYTE(v10) = objc_msgSend(v9, "BOOLValue");
  }
  else
  {
    v11 = v4[1];
    *(_OWORD *)atoken.val = *v4;
    *(_OWORD *)&atoken.val[4] = v11;
    pidp = 0;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    v12 = pidp;
    bzero(&atoken, 0x1000uLL);
    if (proc_pidpath(v12, &atoken, 0x1000u) <= 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &atoken);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v14 != 0;
    }
    v15 = (void *)_ClientTrustDictionary;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)_Lock, "unlock");

  return v10;
}

+ (void)sendCallback:(id)a3
{
  id v3;
  void *v4;
  const __CFSet *Mutable;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const void *v11;
  int v12;
  NSObject *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)_Lock, "lock");
  if (objc_msgSend((id)_ClientIdentifierDictionary, "count") <= 0)
  {
    objc_msgSend((id)_Lock, "unlock");
    goto LABEL_23;
  }
  v4 = (void *)objc_msgSend((id)_ClientIdentifierDictionary, "copy");
  objc_msgSend((id)_Lock, "unlock");
  if (v4)
  {
    Mutable = CFSetCreateMutable(0, 0, 0);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v7)
      goto LABEL_21;
    v8 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_lock");
        if (objc_msgSend(v10, "_wantsCallback:", v3))
        {
          if (objc_msgSend(v3, "isAtomic"))
          {
            v11 = (const void *)(int)objc_msgSend(v3, "key");
            if (CFSetContainsValue(Mutable, v11))
            {
              v12 = 0;
              goto LABEL_18;
            }
            CFSetSetValue(Mutable, v11);
          }
          objc_msgSend(v10, "_sendCallback:", v3);
        }
        else
        {
          _SCROD_LOG();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_2115BB000, v13, OS_LOG_TYPE_DEFAULT, "+[SCROClient sendCallback:]: client doesn't want callback.", v14, 2u);
          }

        }
        v12 = 1;
LABEL_18:
        objc_msgSend(v10, "_unlock");

        if (!v12)
          goto LABEL_21;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v7)
      {
LABEL_21:

        CFRelease(Mutable);
        break;
      }
    }
  }
LABEL_23:

}

+ (id)callbacksForClientIdentifier:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)_Lock, "lock");
  v4 = (void *)_ClientIdentifierDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_Lock, "unlock");
  if (v6)
  {
    objc_msgSend(v6, "_lock");
    objc_msgSend(v6, "_dequeueCallbacks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_unlock");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)registerCallbackWithKey:(int)a3 forClientIdentifier:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  objc_msgSend((id)_Lock, "lock");
  v6 = (void *)_ClientIdentifierDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_Lock, "unlock");
  if (v8)
  {
    objc_msgSend(v8, "_lock");
    objc_msgSend(v8, "_registerCallbackWithKey:", v5);
    objc_msgSend(v8, "_unlock");
  }

}

- (SCROClient)init
{
  SCROClient *v2;
  NSLock *v3;
  NSLock *lock;
  uint64_t v5;
  uint64_t v6;
  OS_os_transaction *scrodTransaction;
  NSObject *v8;
  uint8_t v10[12];
  int v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCROClient;
  v2 = -[SCROClient init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = *MEMORY[0x24BDAEC58];
    v11 = 1;
    mach_port_allocate(v5, 1u, &v2->_port);
    mach_port_insert_right(v5, v2->_port, v2->_port, 0x14u);
    MEMORY[0x212BDDC3C](v5, v2->_port, 1, &v11, 4);
    v6 = os_transaction_create();
    scrodTransaction = v2->_scrodTransaction;
    v2->_scrodTransaction = (OS_os_transaction *)v6;

    _SCROD_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_DEFAULT, "Storing a transaction com.apple.ScreenReaderOutput", v10, 2u);
    }

  }
  return v2;
}

- (void)dealloc
{
  __CFArray *queue;
  __CFSet *callbackSet;
  OS_os_transaction *scrodTransaction;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  queue = self->_queue;
  if (queue)
    CFRelease(queue);
  callbackSet = self->_callbackSet;
  if (callbackSet)
    CFRelease(callbackSet);
  scrodTransaction = self->_scrodTransaction;
  self->_scrodTransaction = 0;

  _SCROD_LOG();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2115BB000, v6, OS_LOG_TYPE_DEFAULT, "Releasing a transaction com.apple.ScreenReaderOutput", buf, 2u);
  }

  -[SCROClient _invalidate](self, "_invalidate");
  v7.receiver = self;
  v7.super_class = (Class)SCROClient;
  -[SCROClient dealloc](&v7, sel_dealloc);
}

- (void)_lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (void)_unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_invalidate
{
  mach_port_name_t port;

  port = self->_port;
  if (port)
  {
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], port, 4u, -1);
    self->_port = 0;
  }
}

- (void)_registerCallbackWithKey:(int)a3
{
  __CFSet *callbackSet;

  callbackSet = self->_callbackSet;
  if (!callbackSet)
  {
    callbackSet = CFSetCreateMutable(0, 0, 0);
    self->_callbackSet = callbackSet;
  }
  CFSetSetValue(callbackSet, (const void *)a3);
}

- (id)_dequeueCallbacks
{
  __CFArray *queue;
  __CFArray *v4;
  __CFArray *v5;

  queue = self->_queue;
  if (queue)
  {
    CFAutorelease(queue);
    v4 = self->_queue;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  self->_queue = 0;
  return v5;
}

- (BOOL)_wantsCallback:(id)a3
{
  id v4;
  void *v5;
  __CFSet *callbackSet;
  __CFArray *queue;
  NSObject *v8;
  CFIndex Count;
  BOOL v10;
  int v12;
  CFIndex v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  callbackSet = self->_callbackSet;
  if (callbackSet && CFSetContainsValue(callbackSet, (const void *)(int)objc_msgSend(v4, "key")))
  {
    queue = self->_queue;
    if (!queue || CFArrayGetCount(queue) < 51)
    {
      v10 = 1;
      goto LABEL_10;
    }
    _SCROD_LOG();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      Count = CFArrayGetCount(self->_queue);
      v12 = 134218240;
      v13 = Count;
      v14 = 1024;
      v15 = 50;
      _os_log_impl(&dword_2115BB000, v8, OS_LOG_TYPE_DEFAULT, "SCRO Queue is flooded: queue size (%ld) > max size (%d)", (uint8_t *)&v12, 0x12u);
    }

  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (void)_sendCallback:(id)a3
{
  id v4;
  __CFArray *queue;
  void *value;

  v4 = a3;
  queue = self->_queue;
  value = v4;
  if (!queue)
  {
    queue = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v4 = value;
    self->_queue = queue;
  }
  CFArrayAppendValue(queue, v4);
  _SCROPing(self->_port, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrodTransaction, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
