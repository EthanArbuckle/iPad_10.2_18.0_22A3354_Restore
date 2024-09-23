@implementation SpotlightReceiverConnection

uint64_t __48__SpotlightReceiverConnection_runOnSenderQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)receiverRequestComplete
{
  unsigned int *p_requestCount;
  unsigned int v3;
  unsigned __int8 v4;
  unsigned int v5;

  p_requestCount = &self->_requestCount;
  do
    v3 = __ldaxr(p_requestCount);
  while (__stlxr(v3 - 1, p_requestCount));
  v4 = atomic_load((unsigned __int8 *)&self->_disabled);
  if ((v4 & 1) != 0)
  {
    if (sReceiverRequestMax)
      v5 = 0;
    else
      v5 = 16;
    if (v3 <= v5)
      -[SpotlightReceiverConnection enableReceiver](self, "enableReceiver");
  }
}

- (BOOL)disabled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_disabled);
  return v2 & 1;
}

- (BOOL)canRun
{
  unsigned __int8 v3;
  NSObject *v5;
  unsigned __int8 v6;
  dispatch_time_t v7;
  NSObject *senderQueue;
  _QWORD block[5];

  if (self->_setupComplete)
    goto LABEL_2;
  -[SpotlightReceiverConnection startSetup](self, "startSetup");
  -[SpotlightReceiverConnection setupSemaphore](self, "setupSemaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = atomic_load((unsigned __int8 *)&self->_disabled);
    if ((v6 & 1) == 0)
    {
      if ((sReceiverSetupTimeout & 1) != 0)
        v7 = -1;
      else
        v7 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v5, v7);
      if (self->_setupComplete)
      {

LABEL_2:
        v3 = atomic_load((unsigned __int8 *)&self->_disabled);
        return (v3 & 1) == 0;
      }
      senderQueue = self->_senderQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__SpotlightReceiverConnection_canRun__block_invoke;
      block[3] = &unk_24D0EA758;
      block[4] = self;
      dispatch_async(senderQueue, block);
    }
  }

  return 0;
}

- (void)donateRelevantActions:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  int supportedJobs;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SpotlightReceiverConnection *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  supportedJobs = self->_supportedJobs;
  if ((supportedJobs & 0x800) != 0)
  {
    v9 = 2048;
  }
  else
  {
    if ((supportedJobs & 0x4000) == 0)
      goto LABEL_7;
    v9 = 0x4000;
  }
  if (!-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke;
    v10[3] = &unk_24D0EAA28;
    v11 = v6;
    v12 = v7;
    v13 = self;
    v14 = v9;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v10);

  }
LABEL_7:

}

- (void)deleteAllUserActivities:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  SpotlightReceiverConnection *v7;

  v4 = a3;
  if (v4 && (self->_supportedJobs & 0x1000) != 0 && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke;
    v5[3] = &unk_24D0EA9D8;
    v6 = v4;
    v7 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v5);

  }
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  SpotlightReceiverConnection *v11;

  v6 = a3;
  v7 = a4;
  if ((self->_supportedJobs & 0x400) != 0 && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke;
    v8[3] = &unk_24D0EA8C0;
    v9 = v6;
    v10 = v7;
    v11 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v8);

  }
}

- (void)deleteFromBundle:(id)a3 domainIdentifiers:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  SpotlightReceiverConnection *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count")
    && (self->_supportedJobs & 4) != 0
    && -[SpotlightReceiverConnection _wantsBundleID:](self, "_wantsBundleID:", v6)
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke;
    v8[3] = &unk_24D0EA8C0;
    v9 = v7;
    v10 = v6;
    v11 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v8);

  }
}

- (BOOL)unresponsive
{
  unsigned __int8 v2;
  BOOL result;
  unsigned int v5;
  unsigned int v6;

  v2 = atomic_load((unsigned __int8 *)&self->_disabled);
  if ((v2 & 1) != 0)
    return 1;
  result = 0;
  v5 = atomic_load(&self->_requestCount);
  if (sReceiverRequestMax)
    v6 = 0;
  else
    v6 = 32;
  if (v5 && (sReceiverRequestMax & 1) == 0 && v5 > v6)
  {
    -[SpotlightReceiverConnection disableReceiver](self, "disableReceiver");
    return 1;
  }
  return result;
}

- (void)runOnSenderQueue:(id)a3
{
  id v4;
  NSObject *senderQueue;
  id v6;
  dispatch_block_t v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  senderQueue = self->_senderQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SpotlightReceiverConnection_runOnSenderQueue___block_invoke;
  block[3] = &unk_24D0EA938;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(senderQueue, v7);

}

- (BOOL)_wantsBundleID:(id)a3
{
  id v4;
  NSSet *bundleIDs;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    bundleIDs = self->_bundleIDs;
    if (bundleIDs)
      v6 = -[NSSet containsObject:](bundleIDs, "containsObject:", v4);
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  xpc_object_t v7;
  void *v8;
  unsigned int Count;
  unsigned int v10;
  unsigned int v11;
  int *v12;
  void *v13;
  int *v14;
  void *v15;
  double v16;
  _QWORD v17[5];
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count"))
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(double *)(*(_QWORD *)(a1 + 32) + 120) == 0.0;
    if (v3)
    {
      objc_msgSend(v3, "obj");
    }
    else
    {
      v29 = 0;
      v30 = 0;
      v31 = 0;
    }
    Count = _MDPlistArrayGetCount();
    if (Count)
    {
      v10 = Count;
      v11 = 1;
      v12 = &OBJC_IVAR___SPCoreSpotlightTask__startTime;
      while (1)
      {
        v27 = 0uLL;
        v28 = 0;
        v13 = *(void **)(a1 + 40);
        if (v13)
        {
          objc_msgSend(v13, "obj");
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
        }
        _MDPlistArrayGetPlistObjectAtIndex();
        v22 = v27;
        v23 = v28;
        if (_MDPlistGetPlistObjectType() != 240)
          goto LABEL_27;
        v22 = v27;
        v23 = v28;
        if (_MDPlistArrayGetCount() < 3)
          goto LABEL_27;
        v22 = 0uLL;
        v23 = 0;
        _MDPlistArrayGetPlistObjectAtIndex();
        v20 = 0uLL;
        v21 = 0;
        if (_MDPlistGetPlistObjectType() != 241)
          goto LABEL_27;
        v20 = 0uLL;
        v21 = 0;
        if (*((_BYTE *)*v2 + v12[40]))
        {
          v18 = v22;
          v19 = v23;
          if (_MDPlistDictionaryGetPlistObjectForKey())
            return;
        }
        v18 = v22;
        v19 = v23;
        if (_MDPlistDictionaryGetPlistObjectForKey())
        {
          v14 = v12;
          v18 = v20;
          v19 = v21;
          v15 = (void *)_MDPlistContainerCopyObject();
          v5 = objc_msgSend(*v2, "_wantsContentType:", v15);
          if (!v4 && (v5 & 1) != 0)
          {
            v18 = v22;
            v19 = v23;
            if (_MDPlistDictionaryGetPlistObjectForKey())
            {
              v18 = v20;
              v19 = v21;
              _MDPlistDateGetValue();
              v4 = v16 >= *((double *)*v2 + 15);
              v5 = v4;
            }
            else
            {
              v4 = 1;
              v5 = 1;
            }
          }

          v12 = v14;
        }
        else
        {
LABEL_27:
          v5 = 0;
        }
        if (v11 < v10)
        {
          ++v11;
          if (!v5)
            continue;
        }
        goto LABEL_5;
      }
    }
  }
  else
  {
    v4 = 1;
    v5 = 1;
LABEL_5:
    if (v5 && v4)
    {
      logForCSLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_cold_1(a1, v2);

      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, "command", "j");
      xpc_dictionary_set_uint64(v7, "jt", 1uLL);
      xpc_dictionary_set_string(v7, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
      if (objc_msgSend(*(id *)(a1 + 56), "length"))
        xpc_dictionary_set_string(v7, "pc", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"));
      objc_msgSend(*(id *)(a1 + 32), "dictionary:setDecoderData:forKey:sizeKey:", v7, *(_QWORD *)(a1 + 40), "i", "i-size");
      objc_msgSend(*(id *)(a1 + 32), "dictionary:setDecoderData:forKey:sizeKey:", v7, *(_QWORD *)(a1 + 64), "c", "c-size");
      objc_msgSend(*(id *)(a1 + 32), "receiverRequestStart");
      v8 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_83;
      v17[3] = &unk_24D0EA960;
      v17[4] = v8;
      objc_msgSend(v8, "sendMessageAsync:completion:", v7, v17);

    }
  }
}

- (BOOL)_wantsContentType:(id)a3
{
  __CFString *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (-[NSMutableSet containsObject:](self->_positiveSet, "containsObject:", v4) & 1) == 0)
  {
    if ((-[NSMutableSet containsObject:](self->_negativeSet, "containsObject:", v4) & 1) == 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = self->_contentTypes;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            if (UTTypeConformsTo(v4, *(CFStringRef *)(*((_QWORD *)&v12 + 1) + 8 * i)))
            {
              -[NSMutableSet addObject:](self->_positiveSet, "addObject:", v4, (_QWORD)v12);

              goto LABEL_16;
            }
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            continue;
          break;
        }
      }

      -[NSMutableSet addObject:](self->_negativeSet, "addObject:", v4, (_QWORD)v12);
    }
    v10 = 0;
  }
  else
  {
LABEL_16:
    v10 = 1;
  }

  return v10;
}

void __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t v3;
  void *v4;
  _QWORD v5[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_cold_1(a1);

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  xpc_dictionary_set_value(v3, "ra", *(xpc_object_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "receiverRequestStart");
  v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_106;
  v5[3] = &unk_24D0EA960;
  v5[4] = v4;
  objc_msgSend(v4, "sendMessageAsync:completion:", v3, v5);

}

void __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "deleteAllUserActivities bundleID: %@, client: %@", buf, 0x16u);

  }
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "j");
  xpc_dictionary_set_uint64(v5, "jt", 0x1000uLL);
  xpc_dictionary_set_string(v5, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  objc_msgSend(*(id *)(a1 + 40), "receiverRequestStart");
  v6 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke_94;
  v7[3] = &unk_24D0EA960;
  v7[4] = v6;
  objc_msgSend(v6, "sendMessageAsync:completion:", v5, v7);

}

void __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  xpc_object_t v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    objc_msgSend(a1[6], "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "deleteAllInteractionsWithBundleID, bundleID: %@, protectionClass: %@, client: %@", buf, 0x20u);

  }
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "command", "j");
  xpc_dictionary_set_uint64(v6, "jt", 0x400uLL);
  xpc_dictionary_set_string(v6, "b", (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "UTF8String"));
  if (objc_msgSend(a1[5], "length"))
    xpc_dictionary_set_string(v6, "pc", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  objc_msgSend(a1[6], "receiverRequestStart");
  v7 = a1[6];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke_104;
  v8[3] = &unk_24D0EA960;
  v8[4] = v7;
  objc_msgSend(v7, "sendMessageAsync:completion:", v6, v8);

}

void __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_cold_1();

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 4uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v4 = objc_alloc_init(MEMORY[0x24BDC23B8]);
  objc_msgSend(v4, "encodeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "ids", "ids-size");
  objc_msgSend(*(id *)(a1 + 48), "receiverRequestStart");
  v5 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_89;
  v6[3] = &unk_24D0EA960;
  v6[4] = v5;
  objc_msgSend(v5, "sendMessageAsync:completion:", v3, v6);

}

- (void)receiverRequestStart
{
  unsigned int *p_requestCount;
  unsigned int v3;

  p_requestCount = &self->_requestCount;
  do
    v3 = __ldaxr(p_requestCount);
  while (__stlxr(v3 + 1, p_requestCount));
}

void __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke(id *a1)
{
  NSObject *v2;
  xpc_object_t v3;
  id v4;
  _QWORD v5[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_cold_1((uint64_t)a1, v2);

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x80uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(a1[6]), "UTF8String"));
  if (objc_msgSend(a1[7], "length"))
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(a1[7]), "UTF8String"));
  xpc_dictionary_set_string(v3, "icl", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  xpc_dictionary_set_data(v3, "ins", (const void *)objc_msgSend(objc_retainAutorelease(a1[4]), "bytes"), objc_msgSend(a1[4], "length"));
  objc_msgSend(a1[8], "receiverRequestStart");
  v4 = a1[8];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_101;
  v5[3] = &unk_24D0EA960;
  v5[4] = v4;
  objc_msgSend(v4, "sendMessageAsync:completion:", v3, v5);

}

- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 items:(id)a5 itemsContent:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12
    && (self->_supportedJobs & 1) != 0
    && -[SpotlightReceiverConnection _wantsBundleID:](self, "_wantsBundleID:", v10)
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke;
    v14[3] = &unk_24D0EA988;
    v14[4] = self;
    v15 = v12;
    v16 = v10;
    v17 = v11;
    v18 = v13;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v14);

  }
}

- (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  SpotlightReceiverConnection *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((self->_supportedJobs & 0x80) != 0)
  {
    v14 = -[SpotlightReceiverConnection unresponsive](self, "unresponsive");
    if (v11)
    {
      if (!v14
        && (!-[NSSet count](self->_INIntentClassNames, "count")
         || -[NSSet containsObject:](self->_INIntentClassNames, "containsObject:", v11)))
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke;
        v15[3] = &unk_24D0EA988;
        v16 = v10;
        v17 = v11;
        v18 = v12;
        v19 = v13;
        v20 = self;
        -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v15);

      }
    }
  }

}

+ (void)setup
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_3);
}

void __36__SpotlightReceiverConnection_setup__block_invoke()
{
  SpotlightSenderState *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  SpotlightReceiverConnection *v4;
  void *v5;
  SpotlightReceiverConnection *v6;
  void *v7;
  SpotlightReceiverConnection *v8;
  void *v9;
  SpotlightReceiverConnection *v10;
  void *v11;
  SpotlightReceiverConnection *v12;
  void *v13;
  uint8_t v14[16];

  v0 = objc_alloc_init(SpotlightSenderState);
  v1 = (void *)sSpotlightSenderState;
  sSpotlightSenderState = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "BOOLForKey:", CFSTR("CSDisableReceiverLimit")))
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "### RECEIVER LIMITS DISABLED with CSDisableReceiverLimit preference ### ", v14, 2u);
    }

    sReceiverRequestMax = 1;
    sReceiverSetupTimeout = 1;
  }
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("CSDisableBackgroundHarvestingForCoreDuet")) & 1) == 0)
  {
    v4 = -[SpotlightReceiverConnection initWithServiceName:clientID:wantsText:wantsHTML:]([SpotlightReceiverConnection alloc], "initWithServiceName:clientID:wantsText:wantsHTML:", CFSTR("com.apple.corespotlight.receiver.coreduet"), 1, 0, 0);
    v5 = (void *)sCoreDuetConnection;
    sCoreDuetConnection = (uint64_t)v4;

    objc_msgSend((id)sCoreDuetConnection, "setSkipFileProviderItems:", 1);
    objc_msgSend((id)sCoreDuetConnection, "setMinDate:", CFAbsoluteTimeGetCurrent() + -4838400.0);
  }
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("CSDisableBackgroundHarvestingForIntelligentSuggestions")) & 1) == 0)
  {
    v6 = -[SpotlightReceiverConnection initWithServiceName:clientID:wantsText:wantsHTML:]([SpotlightReceiverConnection alloc], "initWithServiceName:clientID:wantsText:wantsHTML:", CFSTR("com.apple.corespotlight.receiver.suggestions"), 2, 1, 1);
    v7 = (void *)sSuggestionsConnection;
    sSuggestionsConnection = (uint64_t)v6;

  }
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("CSDisableBackgroundHarvestingForAssets")) & 1) == 0)
  {
    v8 = -[SpotlightReceiverConnection initWithServiceName:clientID:wantsText:wantsHTML:]([SpotlightReceiverConnection alloc], "initWithServiceName:clientID:wantsText:wantsHTML:", CFSTR("com.apple.corespotlight.receiver.photos"), 4, 0, 0);
    v9 = (void *)sAssetsConnection;
    sAssetsConnection = (uint64_t)v8;

  }
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("CSDisableBackgroundHarvestingForImages")) & 1) == 0)
  {
    v10 = -[SpotlightReceiverConnection initWithServiceName:clientID:wantsText:wantsHTML:]([SpotlightReceiverConnection alloc], "initWithServiceName:clientID:wantsText:wantsHTML:", CFSTR("com.apple.corespotlight.receiver.images"), 3, 0, 0);
    v11 = (void *)sImagesConnection;
    sImagesConnection = (uint64_t)v10;

  }
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("CSDisableBackgroundHarvestingForTest")) & 1) == 0)
  {
    v12 = -[SpotlightReceiverConnection initWithServiceName:clientID:wantsText:wantsHTML:]([SpotlightReceiverConnection alloc], "initWithServiceName:clientID:wantsText:wantsHTML:", CFSTR("com.apple.corespotlight.receiver.corespotlight"), 0, 1, 1);
    v13 = (void *)sCoreSpotlightConnection;
    sCoreSpotlightConnection = (uint64_t)v12;

  }
}

- (void)invalidationHandler
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_213CF1000, v2, v3, "##### connection invalidated \"%@\", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

uint64_t __50__SpotlightReceiverConnection_invalidationHandler__block_invoke(uint64_t result)
{
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(result + 32) + 72));
  return result;
}

- (void)setupComplete:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;

  if (!a3)
    -[SpotlightReceiverConnection disableReceiver](self, "disableReceiver");
  self->_setupComplete = a3;
  -[SpotlightReceiverConnection setupSemaphore](self, "setupSemaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    dispatch_semaphore_signal(v5);
    -[SpotlightReceiverConnection setSetupSemaphore:](self, "setSetupSemaphore:", 0);
    v5 = v6;
  }

}

- (void)handleError:(id)a3
{
  const char *string;
  NSObject *v6;

  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x24BDACF40]);
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SpotlightReceiverConnection handleError:].cold.1((uint64_t)string, self, v6);

  if (a3 == (id)MEMORY[0x24BDACF38] && MEMORY[0x24BDACF30] != MEMORY[0x24BDACF38])
    -[SpotlightReceiverConnection setupComplete:](self, "setupComplete:", 0);
}

- (void)startSetup
{
  NSObject *senderQueue;
  dispatch_block_t v3;
  _QWORD block[5];

  if (!self->_setupStarted)
  {
    senderQueue = self->_senderQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__SpotlightReceiverConnection_startSetup__block_invoke;
    block[3] = &unk_24D0EA758;
    block[4] = self;
    v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
    dispatch_async(senderQueue, v3);

  }
}

void __41__SpotlightReceiverConnection_startSetup__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  CFAbsoluteTime Current;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  int v43;
  int v44;
  id v45;
  id obj;
  id obja;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  CFAbsoluteTime v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 75))
  {
    *(_BYTE *)(v1 + 75) = 1;
    v3 = objc_alloc(MEMORY[0x24BDBCF48]);
    v4 = (void *)MEMORY[0x24BDD17C8];
    NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%s/%@.plist"), v5, "Library/Spotlight/CoreSpotlight", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initFileURLWithPath:", v7);

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    getSystemVersionString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rcv"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "integerValue") == 1)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sv"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "isEqualToString:", v12) & 1) != 0)
        {

          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("jt"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = objc_msgSend(v13, "integerValue");

            if (!v14)
              goto LABEL_15;
          }
          else
          {

            v14 = 0;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bids"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "count"))
          {
            v43 = v14;
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v20 = v15;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v62;
              while (2)
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v62 != v23)
                    objc_enumerationMutation(v20);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_15;
                  }
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
                if (v22)
                  continue;
                break;
              }
            }

            v14 = v43;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cts"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "count"))
          {
            v44 = v14;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            obj = v16;
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v58;
              while (2)
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v58 != v27)
                    objc_enumerationMutation(obj);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_16;
                  }
                }
                v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
                if (v26)
                  continue;
                break;
              }
            }

            v14 = v44;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("icls"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "count"))
          {
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v45 = v18;
            v29 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
            if (v29)
            {
              v30 = v29;
              obja = *(id *)v54;
              while (2)
              {
                for (k = 0; k != v30; ++k)
                {
                  if (*(id *)v54 != obja)
                    objc_enumerationMutation(v45);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_17;
                  }
                }
                v30 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
                if (v30)
                  continue;
                break;
              }
            }

          }
          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = v14;
          v32 = objc_msgSend(v15, "copy");
          v33 = *(_QWORD *)(a1 + 32);
          v34 = *(void **)(v33 + 88);
          *(_QWORD *)(v33 + 88) = v32;

          v35 = objc_msgSend(v16, "copy");
          v36 = *(_QWORD *)(a1 + 32);
          v37 = *(void **)(v36 + 96);
          *(_QWORD *)(v36 + 96) = v35;

          v38 = objc_msgSend(v18, "copy");
          v39 = *(_QWORD *)(a1 + 32);
          v40 = *(void **)(v39 + 104);
          *(_QWORD *)(v39 + 104) = v38;

          logForCSLogCategoryDefault();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(a1 + 32), "serviceName");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v66 = v42;
            v67 = 2112;
            v68 = v9;
            _os_log_impl(&dword_213CF1000, v41, OS_LOG_TYPE_INFO, "### RECEIVER %@ setup from cache %@", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 32), "enableReceiver");
          objc_msgSend(*(id *)(a1 + 32), "setupComplete:", 1);
          goto LABEL_18;
        }

      }
    }
LABEL_15:
    v15 = 0;
LABEL_16:
    v16 = 0;
LABEL_17:
    Current = CFAbsoluteTimeGetCurrent();
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "command", "s");
    v19 = *(void **)(a1 + 32);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __41__SpotlightReceiverConnection_startSetup__block_invoke_58;
    v48[3] = &unk_24D0EA910;
    v48[4] = v19;
    v52 = Current;
    v49 = v8;
    v50 = v10;
    v51 = v9;
    objc_msgSend(v19, "sendMessageAsync:completion:", v18, v48);

LABEL_18:
  }
}

void __41__SpotlightReceiverConnection_startSetup__block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int64_t int64;
  uint64_t v6;
  const char *string;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  CFAbsoluteTime v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  _BYTE v51[24];
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    string = 0;
    v6 = -1;
    goto LABEL_5;
  }
  int64 = xpc_dictionary_get_int64(v3, "status");
  if (int64)
  {
    v6 = int64;
    string = xpc_dictionary_get_string(v4, "ed");
LABEL_5:
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v46;
      v50 = 2048;
      *(_QWORD *)v51 = v6;
      *(_WORD *)&v51[8] = 2080;
      *(_QWORD *)&v51[10] = string;
      _os_log_error_impl(&dword_213CF1000, v8, OS_LOG_TYPE_ERROR, "### RECEIVER %@ setup error %ld domain %s", buf, 0x20u);

    }
    v9 = 0;
    v10 = (id *)(a1 + 32);
    goto LABEL_29;
  }
  v10 = (id *)(a1 + 32);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = xpc_dictionary_get_uint64(v4, "jt");
  v11 = (void *)MEMORY[0x24BDC24C8];
  xpc_dictionary_get_array(v4, "bids");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "copyNSStringSetFromXPCArray:", v12);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  *((_QWORD *)*v10 + 11) = v13;

  v15 = (void *)MEMORY[0x24BDC24C8];
  xpc_dictionary_get_array(v4, "cts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "copyNSStringArrayFromXPCArray:", v16);
  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  *((_QWORD *)*v10 + 12) = v17;

  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 80) & 0x780) != 0)
  {
    v19 = (void *)MEMORY[0x24BDC24C8];
    xpc_dictionary_get_array(v4, "icls");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "copyNSStringSetFromXPCArray:", v20);
    v22 = (void *)*((_QWORD *)*v10 + 13);
    *((_QWORD *)*v10 + 13) = v21;

  }
  logForCSLogCategoryDefault();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*v10, "serviceName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *((_DWORD *)*v10 + 20);
    v26 = *((_QWORD *)*v10 + 11);
    v27 = *((_QWORD *)*v10 + 12);
    v28 = *((_QWORD *)*v10 + 13);
    *(_DWORD *)buf = 138413314;
    v49 = v24;
    v50 = 1024;
    *(_DWORD *)v51 = v25;
    *(_WORD *)&v51[4] = 2112;
    *(_QWORD *)&v51[6] = v26;
    *(_WORD *)&v51[14] = 2112;
    *(_QWORD *)&v51[16] = v27;
    v52 = 2112;
    v53 = v28;
    _os_log_impl(&dword_213CF1000, v23, OS_LOG_TYPE_INFO, "client: %@, supportedJobTypes: 0x%x bundleIDs: %@, contentTypes: %@, INIntentClassNames:  %@", buf, 0x30u);

  }
  logForCSLogCategoryDefault();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    v49 = v30;
    v50 = 2048;
    *(CFAbsoluteTime *)v51 = v31;
    _os_log_impl(&dword_213CF1000, v29, OS_LOG_TYPE_INFO, "### RECEIVER %@ setup time %f ####", buf, 0x16u);

  }
  if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48))
  {
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("sv"));
    objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_24D0FD1B0, CFSTR("rcv"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 80));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("jt"));

    v34 = *(_QWORD **)(a1 + 32);
    v35 = (void *)v34[11];
    if (v35)
    {
      objc_msgSend(v35, "allObjects");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("bids"));

      v34 = *v10;
    }
    v37 = v34[12];
    if (v37)
    {
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, CFSTR("cts"));
      v34 = *v10;
    }
    v38 = v34[13];
    if (v38)
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v38, CFSTR("icls"));
    v39 = *(_QWORD *)(a1 + 40);
    v47 = 0;
    v40 = objc_msgSend(v32, "writeToURL:error:", v39, &v47);
    v41 = v47;
    logForCSLogCategoryDefault();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if ((v40 & 1) != 0)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "serviceName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v49 = v44;
        v50 = 2112;
        *(_QWORD *)v51 = v45;
        _os_log_impl(&dword_213CF1000, v43, OS_LOG_TYPE_INFO, "### RECEIVER %@ write %@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      __41__SpotlightReceiverConnection_startSetup__block_invoke_58_cold_1((uint64_t *)(a1 + 40), (uint64_t)v41, v43);
    }

  }
  objc_msgSend(*v10, "enableReceiver");
  v9 = 1;
LABEL_29:
  objc_msgSend(*v10, "setupComplete:", v9);

}

- (SpotlightReceiverConnection)initWithServiceName:(id)a3 clientID:(int64_t)a4 wantsText:(BOOL)a5 wantsHTML:(BOOL)a6
{
  id v9;
  SpotlightReceiverConnection *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *senderQueue;
  NSMutableSet *v15;
  NSMutableSet *positiveSet;
  NSMutableSet *v17;
  NSMutableSet *negativeSet;
  objc_super v20;

  v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SpotlightReceiverConnection;
  v10 = -[CSXPCConnection initWithMachServiceName:](&v20, sel_initWithMachServiceName_, v9);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), v12);
    senderQueue = v10->_senderQueue;
    v10->_senderQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    positiveSet = v10->_positiveSet;
    v10->_positiveSet = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    negativeSet = v10->_negativeSet;
    v10->_negativeSet = v17;

    v10->_wantsText = a5;
    v10->_wantsHTML = a6;
    -[SpotlightReceiverConnection startSetup](v10, "startSetup");

  }
  return v10;
}

- (void)disableReceiver
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_213CF1000, v2, v3, "### DISABLING UNRESPONSIVE RECEIVER %@ ####", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

- (void)enableReceiver
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_213CF1000, v2, v3, "### RESUMING UNRESPONSIVE RECEIVER %@ ####", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

_BYTE *__37__SpotlightReceiverConnection_canRun__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[76])
    return (_BYTE *)objc_msgSend(result, "disableReceiver");
  return result;
}

- (void)dictionary:(id)a3 setDecoderData:(id)a4 forKey:(const char *)a5 sizeKey:(const char *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  const void *v15;
  size_t v16;
  uint64_t v17;
  xpc_object_t xdict;

  xdict = a3;
  v9 = a4;
  objc_msgSend(v9, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v10, "xpcData");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
  v12 = (void *)v11;
  if (MEMORY[0x2199C3444]() != MEMORY[0x24BDACF90])
  {

LABEL_5:
    objc_msgSend(v9, "data");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "bytes");
    if (v14)
    {
      v15 = (const void *)v14;
      v16 = objc_msgSend(v13, "length");
      if (v16)
        xpc_dictionary_set_data(xdict, a5, v15, v16);
    }

    v12 = 0;
    goto LABEL_9;
  }
  v17 = objc_msgSend(v10, "dataSize");
  xpc_dictionary_set_value(xdict, a5, v12);
  if (v17)
    xpc_dictionary_set_uint64(xdict, a6, v17);
LABEL_9:

}

uint64_t __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_83(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)deleteFromBundle:(id)a3 encodedIdentifiers:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SpotlightReceiverConnection *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7
    && (self->_supportedJobs & 2) != 0
    && -[SpotlightReceiverConnection _wantsBundleID:](self, "_wantsBundleID:", v6)
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke;
    v8[3] = &unk_24D0EA8C0;
    v9 = v6;
    v10 = self;
    v11 = v7;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v8);

  }
}

void __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t v3;
  void *v4;
  _QWORD v5[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_cold_1(a1);

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 2uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  objc_msgSend(*(id *)(a1 + 40), "dictionary:setDecoderData:forKey:sizeKey:", v3, *(_QWORD *)(a1 + 48), "ids", "ids-size");
  objc_msgSend(*(id *)(a1 + 40), "receiverRequestStart");
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_86;
  v5[3] = &unk_24D0EA960;
  v5[4] = v4;
  objc_msgSend(v4, "sendMessageAsync:completion:", v3, v5);

}

uint64_t __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_86(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)deleteFromBundle:(id)a3 contentType:(id)a4 identifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  SpotlightReceiverConnection *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "count")
    && (self->_supportedJobs & 2) != 0
    && -[SpotlightReceiverConnection _wantsBundleID:](self, "_wantsBundleID:", v8)
    && -[SpotlightReceiverConnection _wantsContentType:](self, "_wantsContentType:", v9)
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke;
    v11[3] = &unk_24D0EA9B0;
    v12 = v10;
    v13 = v8;
    v14 = v9;
    v15 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v11);

  }
}

void __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_cold_1();

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 2uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v4 = objc_alloc_init(MEMORY[0x24BDC23B8]);
  objc_msgSend(v4, "encodeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "ids", "ids-size");
  objc_msgSend(*(id *)(a1 + 56), "receiverRequestStart");
  v5 = *(void **)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_88;
  v6[3] = &unk_24D0EA960;
  v6[4] = v5;
  objc_msgSend(v5, "sendMessageAsync:completion:", v3, v6);

}

uint64_t __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

uint64_t __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_89(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)purgeFromBundle:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  SpotlightReceiverConnection *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count")
    && (self->_supportedJobs & 0x20) != 0
    && -[SpotlightReceiverConnection _wantsBundleID:](self, "_wantsBundleID:", v6)
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke;
    v8[3] = &unk_24D0EA8C0;
    v9 = v7;
    v10 = v6;
    v11 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v8);

  }
}

void __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_cold_1();

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x20uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
  v4 = objc_alloc_init(MEMORY[0x24BDC23B8]);
  objc_msgSend(v4, "encodeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "ids", "ids-size");
  objc_msgSend(*(id *)(a1 + 48), "receiverRequestStart");
  v5 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_90;
  v6[3] = &unk_24D0EA960;
  v6[4] = v5;
  objc_msgSend(v5, "sendMessageAsync:completion:", v3, v6);

}

uint64_t __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  SpotlightReceiverConnection *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((self->_supportedJobs & 0x40) != 0
    && objc_msgSend(v8, "count")
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke;
    v11[3] = &unk_24D0EA9B0;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v11);

  }
}

void __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke(id *a1)
{
  NSObject *v2;
  xpc_object_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1();

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x40uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  if (objc_msgSend(a1[6], "length"))
    xpc_dictionary_set_string(v3, "pc", (const char *)objc_msgSend(objc_retainAutorelease(a1[6]), "UTF8String"));
  v4 = objc_alloc_init(MEMORY[0x24BDC23B8]);
  objc_msgSend(v4, "beginArray");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = a1[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_msgSend(v4, "beginArray");
        objc_msgSend(v10, "action");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:", v11);

        objc_msgSend(v10, "item");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "attributeSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:", v13);

        objc_msgSend(v4, "endArray");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "endArray");
  objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setPlistContainer:forKey:sizeKey:", v3, objc_msgSend(v4, "plistContainer"), "a", "a-size");
  objc_msgSend(a1[7], "receiverRequestStart");
  v14 = a1[7];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_93;
  v15[3] = &unk_24D0EA960;
  v15[4] = v14;
  objc_msgSend(v14, "sendMessageAsync:completion:", v3, v15);

}

uint64_t __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_93(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

uint64_t __55__SpotlightReceiverConnection_deleteAllUserActivities___block_invoke_94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 retainedData:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SpotlightReceiverConnection *v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8
    && v9
    && (self->_supportedJobs & 0x2000) != 0
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke;
    v11[3] = &unk_24D0EA9B0;
    v12 = v9;
    v13 = self;
    v14 = v8;
    v15 = v10;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v11);

  }
}

void __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "deleteUserActivities bundleID: %@, client: %@", buf, 0x16u);

  }
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "j");
  xpc_dictionary_set_uint64(v5, "jt", 0x2000uLL);
  xpc_dictionary_set_string(v5, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  objc_msgSend(*(id *)(a1 + 40), "dictionary:setDecoderData:forKey:sizeKey:", v5, *(_QWORD *)(a1 + 48), "ids", "ids-size");
  objc_msgSend(*(id *)(a1 + 40), "receiverRequestStart");
  v6 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke_95;
  v7[3] = &unk_24D0EAA00;
  v7[4] = v6;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v6, "sendMessageAsync:completion:", v5, v7);

}

id __99__SpotlightReceiverConnection_deleteUserActivitiesWithPersistentIdentifiers_bundleID_retainedData___block_invoke_95(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
  return (id)objc_opt_self();
}

- (void)deleteFromBundle:(id)a3 sinceDate:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  SpotlightReceiverConnection *v11;

  v6 = a3;
  v7 = a4;
  if (v7
    && (self->_supportedJobs & 0x10) != 0
    && -[SpotlightReceiverConnection _wantsBundleID:](self, "_wantsBundleID:", v6)
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke;
    v8[3] = &unk_24D0EA8C0;
    v9 = v7;
    v10 = v6;
    v11 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v8);

  }
}

void __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke(id *a1)
{
  NSObject *v2;
  xpc_object_t v3;
  double v4;
  id v5;
  _QWORD v6[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_cold_1((uint64_t)a1);

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 0x10uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  objc_msgSend(a1[4], "timeIntervalSince1970");
  xpc_dictionary_set_date(v3, "d", (uint64_t)v4);
  objc_msgSend(a1[6], "receiverRequestStart");
  v5 = a1[6];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_97;
  v6[3] = &unk_24D0EA960;
  v6[4] = v5;
  objc_msgSend(v5, "sendMessageAsync:completion:", v3, v6);

}

uint64_t __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_97(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)deleteFromBundle:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  SpotlightReceiverConnection *v7;

  v4 = a3;
  if ((self->_supportedJobs & 8) != 0
    && -[SpotlightReceiverConnection _wantsBundleID:](self, "_wantsBundleID:", v4)
    && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke;
    v5[3] = &unk_24D0EA9D8;
    v6 = v4;
    v7 = self;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v5);

  }
}

void __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t v3;
  void *v4;
  _QWORD v5[5];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_cold_1(a1);

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "command", "j");
  xpc_dictionary_set_uint64(v3, "jt", 8uLL);
  xpc_dictionary_set_string(v3, "b", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  objc_msgSend(*(id *)(a1 + 40), "receiverRequestStart");
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_98;
  v5[3] = &unk_24D0EA960;
  v5[4] = v4;
  objc_msgSend(v4, "sendMessageAsync:completion:", v3, v5);

}

uint64_t __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

uint64_t __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_101(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SpotlightReceiverConnection *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((self->_supportedJobs & 0x100) != 0 && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke;
    v11[3] = &unk_24D0EA9B0;
    v12 = v9;
    v13 = v10;
    v14 = self;
    v15 = v8;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v11);

  }
}

void __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    objc_msgSend(a1[6], "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1[7], "count");
    *(_DWORD *)buf = 138413058;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    v23 = 2048;
    v24 = v6;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "deleteInteractionsWithIdentifiers, bundleID: %@, protectionClass: %@, client: %@, identifiers number: %lu", buf, 0x2Au);

  }
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_cold_1((uint64_t)a1, v7, v8, v9, v10, v11, v12, v13);

  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "command", "j");
  xpc_dictionary_set_uint64(v14, "jt", 0x100uLL);
  xpc_dictionary_set_string(v14, "b", (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "UTF8String"));
  if (objc_msgSend(a1[5], "length"))
    xpc_dictionary_set_string(v14, "pc", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setStringArray:forKey:", v14, a1[7], "ids");
  objc_msgSend(a1[6], "receiverRequestStart");
  v15 = a1[6];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_102;
  v16[3] = &unk_24D0EA960;
  v16[4] = v15;
  objc_msgSend(v15, "sendMessageAsync:completion:", v14, v16);

}

uint64_t __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_102(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SpotlightReceiverConnection *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((self->_supportedJobs & 0x200) != 0 && !-[SpotlightReceiverConnection unresponsive](self, "unresponsive"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke;
    v11[3] = &unk_24D0EA9B0;
    v12 = v9;
    v13 = v10;
    v14 = self;
    v15 = v8;
    -[SpotlightReceiverConnection runOnSenderQueue:](self, "runOnSenderQueue:", v11);

  }
}

void __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    objc_msgSend(a1[6], "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1[7], "count");
    *(_DWORD *)buf = 138413058;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    v23 = 2048;
    v24 = v6;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "deleteInteractionsWithGroupIdentifiers, bundleID: %@, protectionClass: %@, client: %@, identifiers number: %lu", buf, 0x2Au);

  }
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_cold_1((uint64_t)a1, v7, v8, v9, v10, v11, v12, v13);

  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "command", "j");
  xpc_dictionary_set_uint64(v14, "jt", 0x200uLL);
  xpc_dictionary_set_string(v14, "b", (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "UTF8String"));
  if (objc_msgSend(a1[5], "length"))
    xpc_dictionary_set_string(v14, "pc", (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"));
  objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setStringArray:forKey:", v14, a1[7], "ids");
  objc_msgSend(a1[6], "receiverRequestStart");
  v15 = a1[6];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke_103;
  v16[3] = &unk_24D0EA960;
  v16[4] = v15;
  objc_msgSend(v15, "sendMessageAsync:completion:", v14, v16);

}

uint64_t __95__SpotlightReceiverConnection_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass___block_invoke_103(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

uint64_t __81__SpotlightReceiverConnection_deleteAllInteractionsWithBundleID_protectionClass___block_invoke_104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

uint64_t __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_106(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiverRequestComplete");
}

- (NSSet)bundleIDs
{
  return self->_bundleIDs;
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (NSSet)INIntentClassNames
{
  return self->_INIntentClassNames;
}

- (int)supportedJobs
{
  return self->_supportedJobs;
}

- (OS_dispatch_queue)senderQueue
{
  return self->_senderQueue;
}

- (unsigned)requestCount
{
  return atomic_load(&self->_requestCount);
}

- (BOOL)wantsHTML
{
  return self->_wantsHTML;
}

- (void)setWantsHTML:(BOOL)a3
{
  self->_wantsHTML = a3;
}

- (BOOL)wantsText
{
  return self->_wantsText;
}

- (void)setWantsText:(BOOL)a3
{
  self->_wantsText = a3;
}

- (BOOL)setupStarted
{
  return self->_setupStarted;
}

- (void)setSetupStarted:(BOOL)a3
{
  self->_setupStarted = a3;
}

- (BOOL)setupComplete
{
  return self->_setupComplete;
}

- (void)setSetupComplete:(BOOL)a3
{
  self->_setupComplete = a3;
}

- (BOOL)skipFileProviderItems
{
  return self->_skipFileProviderItems;
}

- (void)setSkipFileProviderItems:(BOOL)a3
{
  self->_skipFileProviderItems = a3;
}

- (double)minDate
{
  return self->_minDate;
}

- (void)setMinDate:(double)a3
{
  self->_minDate = a3;
}

- (OS_dispatch_semaphore)setupSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSetupSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSemaphore, 0);
  objc_storeStrong((id *)&self->_senderQueue, 0);
  objc_storeStrong((id *)&self->_INIntentClassNames, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_negativeSet, 0);
  objc_storeStrong((id *)&self->_positiveSet, 0);
}

- (void)handleError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315394;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_17(&dword_213CF1000, a3, v6, "### Connection error %s for %@ ####", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

void __41__SpotlightReceiverConnection_startSetup__block_invoke_58_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_17(&dword_213CF1000, a3, (uint64_t)a3, "### RECEIVER write to %@ error %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __82__SpotlightReceiverConnection_indexFromBundle_protectionClass_items_itemsContent___block_invoke_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_213CF1000, v3, v4, "indexItems, bundleID: %@, protectionClass: %@, client: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

void __67__SpotlightReceiverConnection_deleteFromBundle_encodedIdentifiers___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_213CF1000, v2, v3, "deleteEncodedIdentifiersFromBundle, bundleID: %@, client: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __72__SpotlightReceiverConnection_deleteFromBundle_contentType_identifiers___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0(v1);
  objc_msgSend(*(id *)(v0 + 56), "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10(&dword_213CF1000, v3, v4, "deleteIdentifiersFromBundle, count: %d bundleID: %@, contentType: %@ client: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12();
}

void __66__SpotlightReceiverConnection_deleteFromBundle_domainIdentifiers___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0(v1);
  objc_msgSend(*(id *)(v0 + 48), "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_213CF1000, v3, v4, "deleteDomainIdentifiersFromBundle, count: %d bundleID: %@, client: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

void __59__SpotlightReceiverConnection_purgeFromBundle_identifiers___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0(v1);
  objc_msgSend(*(id *)(v0 + 48), "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_213CF1000, v3, v4, "purgeFromBundle, count: %d bundleID: %@, client: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

void __71__SpotlightReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6_0(v1);
  objc_msgSend(*(id *)(v0 + 56), "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10(&dword_213CF1000, v3, v4, "addUserActions, count: %d bundleID: %@, protectionClass: %@, client: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12();
}

void __58__SpotlightReceiverConnection_deleteFromBundle_sinceDate___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 48), "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_213CF1000, v2, v3, "deleteFromBundle, sinceDate: %@, bundleID: %@, client: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

void __48__SpotlightReceiverConnection_deleteFromBundle___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_213CF1000, v2, v3, "deleteFromBundle, bundleID: %@, client: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __87__SpotlightReceiverConnection_addInteraction_intentClassName_bundleID_protectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134219010;
  v9 = v3;
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2112;
  v17 = v7;
  _os_log_debug_impl(&dword_213CF1000, a2, OS_LOG_TYPE_DEBUG, "addInteraction, interaction: %p(%@), bundleID: %@, protectionClass: %@, client: %@", (uint8_t *)&v8, 0x34u);

}

void __90__SpotlightReceiverConnection_deleteInteractionsWithIdentifiers_bundleID_protectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "identifiers: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__SpotlightReceiverConnection_donateRelevantActions_bundleID___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 48), "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_213CF1000, v2, v3, "donateRelevantActions data: %p, bundleID: %@ client: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
