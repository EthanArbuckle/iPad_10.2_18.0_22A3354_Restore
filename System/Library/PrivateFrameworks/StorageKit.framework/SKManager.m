@implementation SKManager

+ (id)sharedManagerWithBindingsSafety:(BOOL)a3
{
  if (a3)
    +[SKManager sharedManagerWithBindingsSafety:].cold.1();
  return +[SKManager sharedManager](SKManager, "sharedManager");
}

+ (id)sharedManager
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  if (NSClassFromString(CFSTR("SKDaemonManager")))
  {
    +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_0);

    SKGetOSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22FE50000, v3, OS_LOG_TYPE_FAULT, "Client sharedManager has been called from the daemon.", v5, 2u);
    }

  }
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_22);
  return (id)sSharedManager;
}

id __26__SKManager_sharedManager__block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKManager.m", 59);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void __26__SKManager_sharedManager__block_invoke_20()
{
  SKManager *v0;
  void *v1;

  v0 = -[SKManager initWithBindingSafety:]([SKManager alloc], "initWithBindingSafety:", 0);
  v1 = (void *)sSharedManager;
  sSharedManager = (uint64_t)v0;

}

- (SKManager)initWithBindingSafety:(BOOL)a3
{
  SKManager *v4;
  SKManager *v5;
  uint64_t v6;
  NSMutableSet *allDisks;
  uint64_t v8;
  NSMutableDictionary *listenersAppearedDisks;
  uint64_t v10;
  NSHashTable *listeners;
  uint64_t v12;
  NSMutableSet *waitingForDiskSet;
  dispatch_queue_t v14;
  OS_dispatch_queue *waitingForDiskQueue;
  uint64_t v16;
  NSSet *visibleRoles;
  dispatch_queue_t v18;
  OS_dispatch_queue *frameworkAsyncOperationsQueue;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SKManager;
  v4 = -[SKBaseManager init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shouldBeBindingsSafe = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 10);
    allDisks = v5->allDisks;
    v5->allDisks = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
    v8 = objc_claimAutoreleasedReturnValue();
    listenersAppearedDisks = v5->_listenersAppearedDisks;
    v5->_listenersAppearedDisks = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v10;

    v12 = objc_opt_new();
    waitingForDiskSet = v5->_waitingForDiskSet;
    v5->_waitingForDiskSet = (NSMutableSet *)v12;

    v14 = dispatch_queue_create("com.apple.SKManager.waitingForDisk", 0);
    waitingForDiskQueue = v5->_waitingForDiskQueue;
    v5->_waitingForDiskQueue = (OS_dispatch_queue *)v14;

    +[SKManager defaultVisibleRoles](SKManager, "defaultVisibleRoles");
    v16 = objc_claimAutoreleasedReturnValue();
    visibleRoles = v5->_visibleRoles;
    v5->_visibleRoles = (NSSet *)v16;

    v18 = dispatch_queue_create("com.apple.SKManager.frameworkOperations", MEMORY[0x24BDAC9C0]);
    frameworkAsyncOperationsQueue = v5->_frameworkAsyncOperationsQueue;
    v5->_frameworkAsyncOperationsQueue = (OS_dispatch_queue *)v18;

  }
  return v5;
}

+ (id)syncSharedManager
{
  void *v2;

  objc_msgSend(a1, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncAllDisks");
  return v2;
}

- (OS_dispatch_queue)callbackQueue
{
  void *v2;
  void *v3;

  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callbackQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)setCallbackQueue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallbackQueue:", v3);

}

- (id)allDisks
{
  NSMutableSet *v3;
  void *v4;

  v3 = self->allDisks;
  objc_sync_enter(v3);
  -[NSMutableSet allObjects](self->allDisks, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)allDisksSet
{
  NSMutableSet *v3;
  void *v4;

  v3 = self->allDisks;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableSet copy](self->allDisks, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)isBusy
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __19__SKManager_isBusy__block_invoke;
  v4[3] = &unk_24FDBFB08;
  v4[4] = &v5;
  objc_msgSend(v2, "isBusyWithBlocking:completionBlock:", 1, v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __19__SKManager_isBusy__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)syncAllDisks
{
  id v2;

  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncAllDisksWithBlocking:completionBlock:", 1, 0);

}

- (void)setVisibleRoles:(id)a3
{
  NSMutableSet *v4;
  NSSet *v5;
  NSSet *visibleRoles;
  id v7;

  v7 = a3;
  v4 = self->allDisks;
  objc_sync_enter(v4);
  v5 = (NSSet *)objc_msgSend(v7, "copy");
  visibleRoles = self->_visibleRoles;
  self->_visibleRoles = v5;

  objc_sync_exit(v4);
}

- (id)visibleDisks
{
  void *v3;
  NSMutableSet *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->allDisks;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->allDisks;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "role", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSSet containsObject:](self->_visibleRoles, "containsObject:", v10))
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

+ (id)defaultVisibleRoles
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", kSKDiskRoleLegacyMacData[0], kSKDiskRoleLegacyMacSystem[0], kSKDiskRoleMacData[0], kSKDiskRoleMacSystem[0], kSKDiskRoleWindowsData[0], kSKDiskRoleWindowsSystem[0], kSKDiskRoleUnknown[0], 0);
}

- (id)diskForBSDname:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self->allDisks;
    objc_sync_enter(v5);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->allDisks;
    v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "diskIdentifier", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if (v12)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)contentDiskWithDisk:(id)a3
{
  return a3;
}

- (id)diskForUUID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSMutableSet *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  obj = self->allDisks;
  objc_sync_enter(obj);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->allDisks;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "volumeUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v4))
        {

LABEL_13:
          -[SKManager contentDiskWithDisk:](self, "contentDiskWithDisk:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        objc_msgSend(v9, "mediaUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
          goto LABEL_13;
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v13 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_14:

  objc_sync_exit(obj);
  return v13;
}

- (id)diskForVolumeName:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->allDisks;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->allDisks;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "volumeName", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[SKManager contentDiskWithDisk:](self, "contentDiskWithDisk:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  objc_sync_exit(v5);
  return v13;
}

+ (BOOL)isMountPointWithPath:(id)a3
{
  int v3;
  BOOL result;
  _QWORD v5[3];
  uint64_t v6;
  int v7;

  v7 = 0;
  v6 = 0;
  v5[1] = 0x400000000;
  v5[2] = 0;
  v5[0] = 0x800000005;
  v3 = getattrlist((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), v5, &v6, 0xCuLL, 0);
  result = 0;
  if (!v3)
    return (HIDWORD(v6) == 2) & v7;
  return result;
}

+ (id)BSDNameFromString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("apfs://disk")))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(\\/dev\\/)?r?(disk\\d+(s\\d+){0,2})$"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfRanges");

      v4 = 0;
      if (v9 >= 3)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "rangeAtIndex:", 2);
        objc_msgSend(v3, "substringWithRange:", v11, v12);
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)_diskForString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  uuid_t uu;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(uu, 0, sizeof(uu));
  if (objc_msgSend(v4, "length") == 36)
  {
    v5 = objc_retainAutorelease(v4);
    if (!uuid_parse((const char *)objc_msgSend(v5, "UTF8String"), uu))
    {
      -[SKManager diskForUUID:](self, "diskForUUID:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v8 = v12;
        v7 = v8;
        goto LABEL_13;
      }
    }
  }
  objc_msgSend((id)objc_opt_class(), "BSDNameFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SKManager _diskForPath:](self, "_diskForPath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && +[SKManager isMountPointWithPath:](SKManager, "isMountPointWithPath:", v4))
    {
      v10 = v9;
    }
    else
    {
      -[SKManager diskForVolumeName:](self, "diskForVolumeName:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_5;
      v10 = v7;
    }
    v8 = v10;
    v7 = v10;
    goto LABEL_12;
  }
  -[SKManager diskForBSDname:](self, "diskForBSDname:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = 0;
LABEL_12:

LABEL_13:
  return v7;
}

- (id)diskForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[SKManager _diskForString:](self, "_diskForString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[SKManager syncAllDisks](self, "syncAllDisks");
      -[SKManager _diskForString:](self, "_diskForString:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_diskForPath:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  statfs v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(&v22, 0, 512);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("/")) & 1) == 0)
  {
    v4 = objc_retainAutorelease(v4);
    v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0x200000);
    if (v5 != -1)
    {
      v6 = v5;
      if (!fstatfs(v5, &v22))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v22.f_mntonname);
        v7 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v7;
      }
      close(v6);
    }
  }
  v8 = self->allDisks;
  objc_sync_enter(v8);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->allDisks;
  v10 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "mountPoint", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if (v15)
        {
          v10 = v13;
          goto LABEL_16;
        }
      }
      v10 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_16:

  objc_sync_exit(v8);
  return v10;
}

- (id)diskForPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[SKManager _diskForPath:](self, "_diskForPath:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[SKManager syncAllDisks](self, "syncAllDisks");
      -[SKManager _diskForPath:](self, "_diskForPath:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v10 = 0;
        v11 = &v10;
        v12 = 0x3032000000;
        v13 = __Block_byref_object_copy_;
        v14 = __Block_byref_object_dispose_;
        v15 = 0;
        +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __25__SKManager_diskForPath___block_invoke;
        v9[3] = &unk_24FDBFB30;
        v9[4] = &v10;
        objc_msgSend(v7, "diskForPath:blocking:withCallbackBlock:", v5, 1, v9);

        v6 = (id)v11[5];
        _Block_object_dispose(&v10, 8);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __25__SKManager_diskForPath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)wholeDiskForDisk:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  if (objc_msgSend(v4, "isWholeDisk"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "cachedWholeDiskByIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[SKManager syncAllDisks](self, "syncAllDisks"),
          objc_msgSend(v4, "cachedWholeDiskByIdentifier"),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = v7;

      goto LABEL_7;
    }
    +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __30__SKManager_wholeDiskForDisk___block_invoke;
    v10[3] = &unk_24FDBFB30;
    v10[4] = &v11;
    objc_msgSend(v9, "wholeDiskForDisk:blocking:withCallbackBlock:", v4, 1, v10);

    v5 = (id)v12[5];
  }
  v6 = v5;
LABEL_7:
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __30__SKManager_wholeDiskForDisk___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)childDisksForWholeDisk:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", kSKDiskTypeRAID[0]);

  if ((v6 & 1) == 0
    && ((objc_msgSend(v4, "children"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[SKManager syncAllDisks](self, "syncAllDisks"),
         objc_msgSend(v4, "children"),
         (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v8 = v9;

  }
  else
  {
    +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__SKManager_childDisksForWholeDisk___block_invoke;
    v11[3] = &unk_24FDBFB58;
    v11[4] = &v12;
    objc_msgSend(v7, "childDisksForWholeDisk:blocking:withCallbackBlock:", v4, 1, v11);

    v8 = (id)v13[5];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __36__SKManager_childDisksForWholeDisk___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)filesystems
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__SKManager_filesystems__block_invoke;
  block[3] = &unk_24FDBFB80;
  block[4] = self;
  if (filesystems_onceToken != -1)
    dispatch_once(&filesystems_onceToken, block);
  return self->_filesystems;
}

void __24__SKManager_filesystems__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 20);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24__SKManager_filesystems__block_invoke_2;
  v3[3] = &unk_24FDBFB58;
  v3[4] = &v4;
  objc_msgSend(v2, "filesystemsWithBlocking:callbackBlock:", 1, v3);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), (id)v5[5]);
  _Block_object_dispose(&v4, 8);

}

void __24__SKManager_filesystems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKFilesystem *v11;
  SKFilesystem *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SKGetOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_DEFAULT, "Initializing filesystems dictionary", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = [SKFilesystem alloc];
        v12 = -[SKFilesystem initWithDictionaryRepresentation:](v11, "initWithDictionaryRepresentation:", v10, (_QWORD)v13);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

}

- (id)formatableFileSystems
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SKManager filesystems](self, "filesystems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "shouldShow", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)filesystemWithSKType:(id)a3 isCaseSensitive:(BOOL)a4 isEncrypted:(BOOL)a5
{
  int v5;
  int v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v6 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[SKManager filesystems](self, "filesystems");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "type", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v8)
          && objc_msgSend(v14, "isCaseSensitive") == v6)
        {
          v16 = objc_msgSend(v14, "isEncrypted");

          if (v16 == v5)
          {
            v17 = v14;
            goto LABEL_14;
          }
        }
        else
        {

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_14:

  return v17;
}

- (id)physicalStoresForAPFSVolume:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SKManager_physicalStoresForAPFSVolume___block_invoke;
  v7[3] = &unk_24FDBFB58;
  v7[4] = &v8;
  objc_msgSend(v4, "physicalStoresForAPFSVolume:blocking:completionBlock:", v3, 1, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __41__SKManager_physicalStoresForAPFSVolume___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);
}

- (id)volumesForAPFSPS:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SKManager_volumesForAPFSPS___block_invoke;
  v7[3] = &unk_24FDBFB58;
  v7[4] = &v8;
  objc_msgSend(v4, "volumesForAPFSPS:blocking:completionBlock:", v3, 1, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __30__SKManager_volumesForAPFSPS___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);
}

- (id)knownDisksForDictionaries:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDisksForDictionaries:waitingForDaemon:fromSet:](self, "knownDisksForDictionaries:waitingForDaemon:fromSet:", v4, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDisksForDictionaries:waitingForDaemon:fromSet:](self, "knownDisksForDictionaries:waitingForDaemon:fromSet:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)knownDisksForDictionaries:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  SKManager *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  unsigned int v31;
  SKManager *v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = self;
  v11 = v9;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v36;
    *(_QWORD *)&v15 = 138413058;
    v30 = v15;
    v32 = v10;
    v33 = v11;
    v31 = v6;
    do
    {
      v18 = 0;
      v34 = v16;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
        -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:](v10, "knownDiskForDictionary:waitingForDaemon:fromSet:", v19, v6, v11, v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v12, "addObject:", v20);
        }
        else
        {
          +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_41);

          SKGetOSLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v19, "objectForKey:", CFSTR("volumeName"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", CFSTR("volumeUUID"));
            v24 = v13;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", CFSTR("diskIdentifier"));
            v26 = v12;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", CFSTR("mountPoint"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            v40 = v23;
            v41 = 2114;
            v42 = v25;
            v43 = 2114;
            v44 = v27;
            v45 = 2112;
            v46 = v28;
            _os_log_impl(&dword_22FE50000, v22, OS_LOG_TYPE_FAULT, "SKManager: no known disk resembling: {%@,%{public}@,%{public}@,%@}", buf, 0x2Au);

            v12 = v26;
            v13 = v24;

            v6 = v31;
            v10 = v32;
            v11 = v33;
          }

          v16 = v34;
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v16);
  }

  return v12;
}

id __64__SKManager_knownDisksForDictionaries_waitingForDaemon_fromSet___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKManager.m", 554);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (void)knownDiskForDictionary:(id)a3 notify:(id)a4 onQueue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[SKManager allDisksSet](self, "allDisksSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:](self, "knownDiskForDictionary:waitingForDaemon:fromSet:", v8, 0, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_2;
      block[3] = &unk_24FDBFBF0;
      v22 = v9;
      v12 = v12;
      v21 = v12;
      dispatch_async(v10, block);

      v13 = v22;
    }
    else
    {
      v14 = dispatch_time(0, 100000000);
      dispatch_get_global_queue(0, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_3;
      v16[3] = &unk_24FDBFC18;
      v16[4] = self;
      v17 = v8;
      v19 = v9;
      v18 = v10;
      dispatch_after(v14, v15, v16);

      v13 = v17;
    }

  }
  else
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke;
    v23[3] = &unk_24FDBFBC8;
    v24 = v9;
    dispatch_async(v10, v23);
    v12 = v24;
  }

}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __51__SKManager_knownDiskForDictionary_notify_onQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knownDiskForDictionary:notify:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (id)knownDiskForDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:](self, "knownDiskForDictionary:waitingForDaemon:fromSet:", v4, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[SKManager allDisksSet](self, "allDisksSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKManager knownDiskForDictionary:waitingForDaemon:fromSet:](self, "knownDiskForDictionary:waitingForDaemon:fromSet:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)knownDiskForDictionary:(id)a3 waitingForDaemon:(BOOL)a4 fromSet:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  dispatch_semaphore_t v13;
  NSObject *waitingForDiskQueue;
  id v15;
  NSObject *v16;
  uint64_t *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  SKManager *v32;
  uint64_t *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v6 = a4;
  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8
    && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v8, "isEqual:", v10),
        v10,
        (v11 & 1) == 0))
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    v40 = 0;
    v13 = dispatch_semaphore_create(0);
    waitingForDiskQueue = self->_waitingForDiskQueue;
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke;
    v28 = &unk_24FDBFC68;
    v29 = v9;
    v15 = v8;
    v30 = v15;
    v33 = &v35;
    v34 = v6;
    v16 = v13;
    v31 = v16;
    v32 = self;
    dispatch_sync(waitingForDiskQueue, &v25);
    v17 = v36;
    if (v6 && !v36[5])
    {
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = v36;
      if (!v36[5])
      {
        +[SKBaseManager sharedManager](SKBaseManager, "sharedManager", v25, v26, v27, v28, v29, v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &__block_literal_global_52);

        SKGetOSLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("volumeName"));
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("volumeUUID"));
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("diskIdentifier"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("mountPoint"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v42 = v20;
          v43 = 2114;
          v44 = v21;
          v45 = 2114;
          v46 = v22;
          v47 = 2112;
          v48 = v23;
          _os_log_impl(&dword_22FE50000, v19, OS_LOG_TYPE_FAULT, "SKManager: no daemon-known disk resembling: {%@,%{public}@,%{public}@,%@}", buf, 0x2Au);

        }
        v17 = v36;
      }
    }
    v12 = (id)v17[5];

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  SKWaitingForDiskElement *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v7, "matchesDictionary:", *(_QWORD *)(a1 + 40)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (*(_BYTE *)(a1 + 72) && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v8 = objc_alloc_init(SKWaitingForDiskElement);
    -[SKWaitingForDiskElement setDiskDictionary:](v8, "setDiskDictionary:", *(_QWORD *)(a1 + 40));
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_2;
    v12 = &unk_24FDBFC40;
    v14 = *(_QWORD *)(a1 + 64);
    v13 = *(id *)(a1 + 48);
    -[SKWaitingForDiskElement setBlock:](v8, "setBlock:", &v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 64), "addObject:", v8, v9, v10, v11, v12);

  }
  objc_sync_exit(v2);

}

void __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id __61__SKManager_knownDiskForDictionary_waitingForDaemon_fromSet___block_invoke_3()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("faultCode");
  base64Encode((uint64_t)"SKManager.m", 639);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)newDiskWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __objc2_class **v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("**ClassName**"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", kSKDiskTypeAPFSPS[0])
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("SKAPFSStoreDisk")) & 1) != 0)
  {
    v6 = off_24FDBF3E8;
  }
  else if (objc_msgSend(v4, "isEqualToString:", kSKDiskTypeAPFSContainer[0])
         && (objc_msgSend(v5, "isEqualToString:", CFSTR("SKAPFSContainerDisk")) & 1) != 0)
  {
    v6 = off_24FDBF3D0;
  }
  else if (objc_msgSend(v4, "isEqualToString:", kSKDiskTypeAPFSLV[0])
         && (objc_msgSend(v5, "isEqualToString:", CFSTR("SKAPFSDisk")) & 1) != 0)
  {
    v6 = off_24FDBF3D8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SKAPFSSnapshotDisk")) & 1) != 0)
  {
    v6 = off_24FDBF3E0;
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SKDisk")) & 1) == 0)
      -[SKManager newDiskWithDictionary:].cold.1(v5);
    v6 = off_24FDBF3F8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithDictionary:", v3);

  return v7;
}

- (void)addListener:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSMutableDictionary *listenersAppearedDisks;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD block[5];
  id v19;

  v4 = a3;
  v5 = self->_listeners;
  objc_sync_enter(v5);
  -[NSHashTable addObject:](self->_listeners, "addObject:", v4);
  listenersAppearedDisks = self->_listenersAppearedDisks;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](listenersAppearedDisks, "setObject:forKey:", v7, v8);

  -[SKManager allDisks](self, "allDisks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "xpcQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __25__SKManager_addListener___block_invoke;
    block[3] = &unk_24FDBFCB0;
    block[4] = self;
    v19 = v4;
    dispatch_async(v13, block);

  }
  objc_sync_exit(v5);

  +[SKHelperClient sharedClient](SKHelperClient, "sharedClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __25__SKManager_addListener___block_invoke_2;
  v16[3] = &unk_24FDBFCB0;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v14, "syncAllDisksWithCompletionBlock:", v16);

}

void __25__SKManager_addListener___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "allDisks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_disksAppeared:toListener:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __25__SKManager_addListener___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initialPopulateCompleteForListener:", *(_QWORD *)(a1 + 40));
}

- (void)removeListener:(id)a3
{
  NSHashTable *v4;
  NSMutableDictionary *listenersAppearedDisks;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->_listeners;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_listeners, "removeObject:", v7);
  listenersAppearedDisks = self->_listenersAppearedDisks;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](listenersAppearedDisks, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)initialPopulateComplete
{
  NSHashTable *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = self->_listeners;
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_listeners;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[SKManager _initialPopulateCompleteForListener:](self, "_initialPopulateCompleteForListener:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)_initialPopulateCompleteForListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[SKManager callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SKManager__initialPopulateCompleteForListener___block_invoke;
  block[3] = &unk_24FDBFB80;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __49__SKManager__initialPopulateCompleteForListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  SKGetOSLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22FE50000, v2, OS_LOG_TYPE_DEFAULT, "CLIENT - Initial Populate Complete", v4, 2u);
  }

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "initialPopulateComplete");
  return result;
}

- (void)disksAppeared:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *waitingForDiskQueue;
  id v16;
  void *v17;
  NSHashTable *v18;
  void *v19;
  NSHashTable *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  id v29;
  uint64_t *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  os_log_type_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = (os_log_type_t *)&v35;
  v37 = 0x2020000000;
  v38 = 1;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[SKManager knownDiskForDictionary:waitingForDaemon:](self, "knownDiskForDictionary:waitingForDaemon:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {
          v14 = -[SKManager newDiskWithDictionary:](self, "newDiskWithDictionary:", v11);
          objc_msgSend(v5, "addObject:", v14);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v8);
  }

  waitingForDiskQueue = self->_waitingForDiskQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__SKManager_disksAppeared___block_invoke;
  block[3] = &unk_24FDBFCD8;
  block[4] = self;
  v16 = v5;
  v29 = v16;
  v30 = &v35;
  dispatch_sync(waitingForDiskQueue, block);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKManager disksChanged:](self, "disksChanged:", v17);

  }
  v18 = self->_listeners;
  objc_sync_enter(v18);
  objc_msgSend(v16, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SKLogArrayRedacted(v36[24], (uint64_t)"CLIENT - Disks appeared:", v19);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = self->_listeners;
  v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v20);
        -[SKManager _disksAppeared:toListener:](self, "_disksAppeared:toListener:", v19, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), (_QWORD)v24);
      }
      v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
    }
    while (v21);
  }

  objc_sync_exit(v18);
  _Block_object_dispose(&v35, 8);

}

void __27__SKManager_disksAppeared___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t i;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  int v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v1 = a1;
  v28 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v1;
    obj = *(id *)(v1 + 40);
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v16)
    {
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(obj);
          v3 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v4 = (void *)objc_opt_new();
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v5 = *(id *)(*(_QWORD *)(v17 + 32) + 64);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v6)
          {
            v7 = *(_QWORD *)v19;
            do
            {
              for (j = 0; j != v6; ++j)
              {
                if (*(_QWORD *)v19 != v7)
                  objc_enumerationMutation(v5);
                v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
                objc_msgSend(v9, "diskDictionary");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v3, "matchesDictionary:", v10);

                if (v11)
                {
                  objc_msgSend(v9, "block");
                  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, void *))v12)[2](v12, v3);

                  objc_msgSend(v4, "addObject:", v9);
                }
              }
              v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v6);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(v17 + 32) + 64), "minusSet:", v4);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v16);
    }

    v1 = v17;
  }
  v13 = *(id *)(*(_QWORD *)(v1 + 32) + 24);
  objc_sync_enter(v13);
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "count"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "unionSet:", *(_QWORD *)(v1 + 40));
  objc_sync_exit(v13);

}

- (void)_disksAppeared:(id)a3 toListener:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *listenersAppearedDisks;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    listenersAppearedDisks = self->_listenersAppearedDisks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](listenersAppearedDisks, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_respondsToSelector();
    v12 = MEMORY[0x24BDAC760];
    if ((v11 & 1) != 0
      && (objc_msgSend(v7, "visibleDiskRoles"), v13 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
    {
      v14 = (void *)MEMORY[0x24BDD1758];
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __39__SKManager__disksAppeared_toListener___block_invoke;
      v22[3] = &unk_24FDBFD00;
      v23 = v10;
      v24 = v7;
      objc_msgSend(v14, "predicateWithBlock:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filteredArrayUsingPredicate:", v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = v6;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v17);

    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __39__SKManager__disksAppeared_toListener___block_invoke_2;
    v19[3] = &unk_24FDBFCB0;
    v20 = v16;
    v21 = v7;
    v18 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v19);

  }
}

uint64_t __39__SKManager__disksAppeared_toListener___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "visibleDiskRoles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v6);

  }
  return v4;
}

uint64_t __39__SKManager__disksAppeared_toListener___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "disksAppeared:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)disksDisappeared:(id)a3
{
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *listenersAppearedDisks;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSMutableSet *obj;
  NSHashTable *obja;
  void *v30;
  NSHashTable *v31;
  id v32;
  SKManager *v33;
  _QWORD block[4];
  id v35;
  void *v36;
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v33 = self;
  -[SKManager allDisksSet](self, "allDisksSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v32, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  obj = self->allDisks;
  objc_sync_enter(obj);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->allDisks;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v47 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v10 = v32;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v43 != v12)
                objc_enumerationMutation(v10);
              if (objc_msgSend(v9, "matchesDictionary:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j)))
              {
                objc_msgSend(v4, "addObject:", v9);
                objc_msgSend(v9, "setIsValid:", 0);
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v11);
        }

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v6);
  }

  -[NSMutableSet minusSet:](v33->allDisks, "minusSet:", v4);
  objc_sync_exit(obj);

  obja = v33->_listeners;
  objc_sync_enter(obja);
  SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks disappeared:", v4);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = v33->_listeners;
  v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v14; ++k)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v31);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || (objc_msgSend(v17, "visibleDiskRoles"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = v18 == 0,
                v18,
                v19))
          {
            -[SKManager knownDisksForDictionaries:waitingForDaemon:fromSet:](v33, "knownDisksForDictionaries:waitingForDaemon:fromSet:", v32, 0, v30);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v4, "allObjects");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v37[0] = MEMORY[0x24BDAC760];
            v37[1] = 3221225472;
            v37[2] = __30__SKManager_disksDisappeared___block_invoke;
            v37[3] = &unk_24FDBFD00;
            v37[4] = v33;
            v37[5] = v17;
            objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v37);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "filteredArrayUsingPredicate:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          listenersAppearedDisks = v33->_listenersAppearedDisks;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](listenersAppearedDisks, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "minusSet:", v26);

          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __30__SKManager_disksDisappeared___block_invoke_2;
          block[3] = &unk_24FDBFCB0;
          v35 = v22;
          v36 = v17;
          v27 = v22;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

        }
      }
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v14);
  }

  objc_sync_exit(obja);
}

uint64_t __30__SKManager_disksDisappeared___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v2, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "containsObject:", v5);
  return v8;
}

uint64_t __30__SKManager_disksDisappeared___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "disksDisappeared:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)disksChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *listenersAppearedDisks;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void (**block)(void);
  NSMutableSet *v35;
  NSHashTable *v36;
  void *v37;
  NSHashTable *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  SKManager *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[4];
  id v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[5];
  _QWORD v51[5];
  __int128 v52;
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
  _QWORD aBlock[5];
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__SKManager_disksChanged___block_invoke;
  aBlock[3] = &unk_24FDBFCB0;
  v42 = self;
  aBlock[4] = self;
  v33 = v4;
  v65 = v33;
  block = (void (**)(void))_Block_copy(aBlock);
  if (self->_shouldBeBindingsSafe)
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  else
    block[2]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self->allDisks;
  objc_sync_enter(v35);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v61 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v10 = self->allDisks;
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v57;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v57 != v12)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "matchesDictionary:", v9) & 1) != 0)
              {

                goto LABEL_19;
              }
            }
            v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
            if (v11)
              continue;
            break;
          }
        }

        objc_msgSend(v37, "addObject:", v9);
LABEL_19:
        ;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v6);
  }

  objc_sync_exit(v35);
  if (objc_msgSend(v37, "count"))
  {
    -[SKManager disksAppeared:](self, "disksAppeared:", v37);
    objc_msgSend(obj, "removeObjectsInArray:", v37);
  }
  -[SKManager knownDisksForDictionaries:waitingForDaemon:](self, "knownDisksForDictionaries:waitingForDaemon:", obj, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self->_listeners;
  objc_sync_enter(v36);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v38 = self->_listeners;
  v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
  if (v15)
  {
    v40 = *(_QWORD *)v53;
    do
    {
      v41 = v15;
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(v38);
        v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(v17, "visibleDiskRoles"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = v18 == 0,
              v18,
              v19))
        {
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __26__SKManager_disksChanged___block_invoke_5;
          v43[3] = &unk_24FDBFCB0;
          v43[4] = v17;
          v44 = v14;
          dispatch_async(MEMORY[0x24BDAC9B8], v43);
          v21 = v44;
        }
        else
        {
          v51[0] = MEMORY[0x24BDAC760];
          v51[1] = 3221225472;
          v51[2] = __26__SKManager_disksChanged___block_invoke_2;
          v51[3] = &unk_24FDBFD28;
          v51[4] = v17;
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v51);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "filteredArrayUsingPredicate:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v50[0] = MEMORY[0x24BDAC760];
          v50[1] = 3221225472;
          v50[2] = __26__SKManager_disksChanged___block_invoke_3;
          v50[3] = &unk_24FDBFD28;
          v50[4] = v17;
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v50);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "filteredArrayUsingPredicate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          listenersAppearedDisks = v42->_listenersAppearedDisks;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](listenersAppearedDisks, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "intersectSet:", v26);
          objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "minusSet:", v26);
          objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "minusSet:", v28);
          objc_msgSend(v29, "minusSet:", v27);
          objc_msgSend(v26, "minusSet:", v27);
          objc_msgSend(v26, "unionSet:", v28);
          v45[0] = MEMORY[0x24BDAC760];
          v45[1] = 3221225472;
          v45[2] = __26__SKManager_disksChanged___block_invoke_4;
          v45[3] = &unk_24FDBFD50;
          v46 = v29;
          v47 = v17;
          v48 = v27;
          v49 = v28;
          v30 = v28;
          v31 = v27;
          v32 = v29;
          dispatch_async(MEMORY[0x24BDAC9B8], v45);

        }
      }
      v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    }
    while (v15);
  }

  objc_sync_exit(v36);
}

void __26__SKManager_disksChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  id v11;
  id v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  objc_sync_enter(v12);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v19 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v6 = *(id *)(a1 + 40);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v15;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v15 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * j);
              if (objc_msgSend(v5, "matchesDictionary:", v10, v12))
              {
                v11 = v10;
                objc_sync_enter(v11);
                objc_msgSend(v5, "updateWithDictionary:", v11);
                objc_sync_exit(v11);

              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v7);
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v2);
  }

  objc_sync_exit(v12);
}

uint64_t __26__SKManager_disksChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "visibleDiskRoles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

uint64_t __26__SKManager_disksChanged___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "visibleDiskRoles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

void __26__SKManager_disksChanged___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks changed:", *(void **)(a1 + 32));
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "disksChanged:", v3);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks disappeared:", *(void **)(a1 + 48));
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disksDisappeared:", v5);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "disksAppeared:", v7);

      SKLogArrayRedacted(OS_LOG_TYPE_DEFAULT, (uint64_t)"CLIENT - Disks appeared:", *(void **)(a1 + 56));
    }
  }
}

uint64_t __26__SKManager_disksChanged___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "disksChanged:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)managerStalled
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSHashTable *obj;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  self->diskQueueStuck = 1;
  obj = self->_listeners;
  objc_sync_enter(obj);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_listeners;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x24BDAC760];
    v7 = MEMORY[0x24BDAC9B8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          block[0] = v6;
          block[1] = 3221225472;
          block[2] = __27__SKManager_managerStalled__block_invoke;
          block[3] = &unk_24FDBFB80;
          block[4] = v9;
          dispatch_async(v7, block);
        }
        ++v8;
      }
      while (v4 != v8);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  objc_sync_exit(obj);
}

uint64_t __27__SKManager_managerStalled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "managerStalled");
}

- (void)managerResumed
{
  NSHashTable *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  self->diskQueueStuck = 0;
  v3 = self->_listeners;
  objc_sync_enter(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_listeners;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x24BDAC760];
    v8 = MEMORY[0x24BDAC9B8];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __27__SKManager_managerResumed__block_invoke;
        block[3] = &unk_24FDBFB80;
        block[4] = v10;
        dispatch_async(v8, block);
        ++v9;
      }
      while (v5 != v9);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

uint64_t __27__SKManager_managerResumed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "managerResumed");
  return result;
}

- (NSSet)visibleRoles
{
  return self->_visibleRoles;
}

- (OS_dispatch_queue)frameworkAsyncOperationsQueue
{
  return self->_frameworkAsyncOperationsQueue;
}

- (void)setFrameworkAsyncOperationsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkAsyncOperationsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkAsyncOperationsQueue, 0);
  objc_storeStrong((id *)&self->_visibleRoles, 0);
  objc_storeStrong((id *)&self->_filesystems, 0);
  objc_storeStrong((id *)&self->_waitingForDiskSet, 0);
  objc_storeStrong((id *)&self->_waitingForDiskQueue, 0);
  objc_storeStrong((id *)&self->_listenersAppearedDisks, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->allDisks, 0);
}

+ (void)sharedManagerWithBindingsSafety:.cold.1()
{
  __assert_rtn("+[SKManager sharedManagerWithBindingsSafety:]", "SKManager.m", 51, "isBindingsSafe == NO");
}

- (void)newDiskWithDictionary:(void *)a1 .cold.1(void *a1)
{
  syslog(115, "ERROR - ABORT: Unknown disk type: %s", (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
  abort();
}

@end
