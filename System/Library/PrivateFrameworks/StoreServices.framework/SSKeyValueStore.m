@implementation SSKeyValueStore

- (SSKeyValueStore)init
{
  SSKeyValueStore *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSKeyValueStore;
  v2 = -[SSKeyValueStore init](&v4, sel_init);
  if (v2)
  {
    if (SSIsDaemon())
    {
      *(_WORD *)&v2->_useLocalRead = 257;
    }
    else
    {
      v2->_connection = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
      v2->_useLocalRead = objc_msgSend((id)objc_opt_class(), "isLocalReadable");
    }
  }
  return v2;
}

+ (BOOL)isLocalReadable
{
  return (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0&& SSFileIsLocalReadable(+[SSKeyValueStoreSchema databasePath](SSKeyValueStoreSchema, "databasePath"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSKeyValueStore;
  -[SSKeyValueStore dealloc](&v3, sel_dealloc);
}

- (void)getValueForDomain:(id)a3 key:(id)a4 usingBlock:(id)a5
{
  SSKeyValueStoreDatabase *database;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[6];
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  if (self->_useLocalRead)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3052000000;
    v18 = __Block_byref_object_copy__49;
    v19 = __Block_byref_object_dispose__49;
    v20 = 0;
    database = self->_database;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke;
    v14[3] = &unk_1E47BE4E8;
    v14[5] = a4;
    v14[6] = &v15;
    v14[4] = a3;
    -[SSKeyValueStoreDatabase readUsingSessionBlock:](database, "readUsingSessionBlock:", v14);
    if (a5)
      (*((void (**)(id, uint64_t))a5 + 2))(a5, v16[5]);
    v10 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v11 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    if (v11)
    {
      v12 = v11;
      *v11 = objc_msgSend(a4, "copy");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke_2;
      v13[3] = &unk_1E47BE510;
      v13[4] = a5;
      v13[5] = v12;
      -[SSKeyValueStore getValuesForDomain:keys:count:usingBlock:](self, "getValuesForDomain:keys:count:usingBlock:", a3, v12, 1, v13);
    }
    else
    {
      (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    }
  }
}

uint64_t __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copyValueForDomain:key:", a1[4], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

void __52__SSKeyValueStore_getValueForDomain_key_usingBlock___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *a2);

  free(*(void **)(a1 + 40));
}

- (void)getValuesForDomain:(id)a3 keys:(const void *)a4 count:(unint64_t)a5 usingBlock:(id)a6
{
  id *v11;
  SSKeyValueStoreDatabase *database;
  uint64_t v13;
  id v14;
  char v15;
  id v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  const void **v31;
  unint64_t v32;
  __CFString *v33;
  SSKeyValueStore *v34;
  SSXPCConnection *connection;
  uint64_t v36;
  _QWORD v37[8];
  _QWORD v38[8];
  int v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  if (self->_useLocalRead)
  {
    if (a5)
    {
      v11 = (id *)malloc_type_calloc(a5, 8uLL, 0x80040B8603338uLL);
      if (v11)
      {
        database = self->_database;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke;
        v38[3] = &unk_1E47BE538;
        v38[4] = a3;
        v38[5] = a5;
        v38[6] = v11;
        v38[7] = a4;
        -[SSKeyValueStoreDatabase readUsingSessionBlock:](database, "readUsingSessionBlock:", v38);
        v13 = 0;
        do
          v14 = v11[v13++];
        while (a5 != v13);
        v15 = 0;
        if (!a6)
          goto LABEL_28;
LABEL_27:
        (*((void (**)(id, id *))a6 + 2))(a6, v11);
LABEL_28:
        if ((v15 & 1) == 0)
          free(v11);
        return;
      }
    }
    else
    {
      v11 = 0;
    }
    v15 = 1;
    if (!a6)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v16 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v16)
      v16 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v19 = v18;
    else
      v19 = v18 & 2;
    if (v19)
    {
      v39 = 136446210;
      v40 = "-[SSKeyValueStore getValuesForDomain:keys:count:usingBlock:]";
      LODWORD(v36) = 12;
      v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        v21 = (void *)v20;
        v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v39, v36);
        free(v21);
        SSFileLog(v16, CFSTR("%@"), v23, v24, v25, v26, v27, v28, v22);
      }
    }
  }
  v29 = SSXPCCreateMessageDictionary(92);
  SSXPCDictionarySetCFObject(v29, "1", (__CFString *)a3);
  v30 = xpc_array_create(0, 0);
  if (a5)
  {
    v31 = a4;
    v32 = a5;
    do
    {
      v33 = (__CFString *)*v31++;
      SSXPCArraySetCFObject(v30, 0xFFFFFFFFFFFFFFFFLL, v33);
      --v32;
    }
    while (v32);
  }
  xpc_dictionary_set_value(v29, "2", v30);
  xpc_release(v30);
  v34 = self;
  connection = self->_connection;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke_11;
  v37[3] = &unk_1E47BE560;
  v37[6] = a5;
  v37[7] = a4;
  v37[4] = self;
  v37[5] = a6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v29, v37);
  xpc_release(v29);
}

uint64_t __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke(uint64_t result, void *a2)
{
  _QWORD *v3;
  unint64_t v4;

  if (*(_QWORD *)(result + 40))
  {
    v3 = (_QWORD *)result;
    v4 = 0;
    do
    {
      result = objc_msgSend(a2, "copyValueForDomain:key:", v3[4], *(_QWORD *)(v3[7] + 8 * v4));
      *(_QWORD *)(v3[6] + 8 * v4++) = result;
    }
    while (v4 < v3[5]);
  }
  return result;
}

void __60__SSKeyValueStore_getValuesForDomain_keys_count_usingBlock___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  CFArrayRef v7;
  unint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
    goto LABEL_12;
  if (!*(_QWORD *)(a1 + 48))
  {
LABEL_11:
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    goto LABEL_12;
  }
  v5 = malloc_type_calloc(*(_QWORD *)(a1 + 48), 8uLL, 0x80040B8603338uLL);
  if (!v5)
  {
    v3 = *(_QWORD *)(a1 + 40);
    goto LABEL_11;
  }
  v6 = v5;
  objc_opt_class();
  v7 = SSXPCDictionaryCopyCFObjectWithClass(a2, "0");
  if (*(_QWORD *)(a1 + 48))
  {
    v8 = 0;
    do
    {
      v9 = -[__CFArray objectForKey:](v7, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v8));
      if (v9)
        v9 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, 0);
      v6[v8++] = v9;
    }
    while (v8 < *(_QWORD *)(a1 + 48));
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  free(v6);
LABEL_12:

}

- (void)removeAllValuesForDomain:(id)a3
{
  -[SSKeyValueStore removeAllValuesForDomain:completionBlock:](self, "removeAllValuesForDomain:completionBlock:", a3, 0);
}

- (void)removeAllValuesForDomain:(id)a3 completionBlock:(id)a4
{
  SSKeyValueStoreDatabase *database;
  id v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  xpc_object_t v21;
  SSXPCConnection *connection;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[6];
  __int128 v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  if (self->_useLocalWrite)
  {
    *(_QWORD *)&v26 = 0;
    *((_QWORD *)&v26 + 1) = &v26;
    v27 = 0x2020000000;
    v28 = 0;
    database = self->_database;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke;
    v25[3] = &unk_1E47BE588;
    v25[4] = a3;
    v25[5] = &v26;
    -[SSKeyValueStoreDatabase modifyUsingTransactionBlock:](database, "modifyUsingTransactionBlock:", v25);
    if (a4)
      (*((void (**)(id, _QWORD))a4 + 2))(a4, *(unsigned __int8 *)(*((_QWORD *)&v26 + 1) + 24));
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v8 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v8)
        v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_FAULT))
        v11 = v10;
      else
        v11 = v10 & 2;
      if (v11)
      {
        LODWORD(v26) = 136446210;
        *(_QWORD *)((char *)&v26 + 4) = "-[SSKeyValueStore removeAllValuesForDomain:completionBlock:]";
        LODWORD(v23) = 12;
        v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v26, v23);
          free(v13);
          SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
        }
      }
    }
    v21 = SSXPCCreateMessageDictionary(94);
    SSXPCDictionarySetCFObject(v21, "1", (__CFString *)a3);
    connection = self->_connection;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke_19;
    v24[3] = &unk_1E47B8FA0;
    v24[4] = a4;
    -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v21, v24);
    xpc_release(v21);
  }
}

uint64_t __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(+[SSSQLiteEntity queryWithDatabase:predicate:](SSKeyValueStoreValueEntity, "queryWithDatabase:predicate:", objc_msgSend(a2, "database"), +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("domain"), *(_QWORD *)(a1 + 32))), "deleteAllEntities");
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __60__SSKeyValueStore_removeAllValuesForDomain_completionBlock___block_invoke_19(uint64_t result, void *a2)
{
  uint64_t v3;

  if (*(_QWORD *)(result + 32))
  {
    v3 = result;
    if (a2)
    {
      if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
        xpc_dictionary_get_BOOL(a2, "0");
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

- (void)removeAllValuesWithCompletionBlock:(id)a3
{
  SSKeyValueStoreDatabase *database;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19;
  SSXPCConnection *connection;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  __int128 v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  if (self->_useLocalWrite)
  {
    *(_QWORD *)&v24 = 0;
    *((_QWORD *)&v24 + 1) = &v24;
    v25 = 0x2020000000;
    v26 = 0;
    database = self->_database;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke;
    v23[3] = &unk_1E47BE5B0;
    v23[4] = &v24;
    -[SSKeyValueStoreDatabase modifyUsingTransactionBlock:](database, "modifyUsingTransactionBlock:", v23);
    if (a3)
      (*((void (**)(id, _QWORD))a3 + 2))(a3, *(unsigned __int8 *)(*((_QWORD *)&v24 + 1) + 24));
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v6)
        v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v9 = v8;
      else
        v9 = v8 & 2;
      if (v9)
      {
        LODWORD(v24) = 136446210;
        *(_QWORD *)((char *)&v24 + 4) = "-[SSKeyValueStore removeAllValuesWithCompletionBlock:]";
        LODWORD(v21) = 12;
        v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v24, v21);
          free(v11);
          SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    v19 = SSXPCCreateMessageDictionary(95);
    connection = self->_connection;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke_22;
    v22[3] = &unk_1E47B8FA0;
    v22[4] = a3;
    -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v19, v22);
    xpc_release(v19);
  }
}

uint64_t __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend(a2, "database"), "executeSQL:", CFSTR("DELETE FROM kvs_value;"));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __54__SSKeyValueStore_removeAllValuesWithCompletionBlock___block_invoke_22(uint64_t result, void *a2)
{
  uint64_t v3;

  if (*(_QWORD *)(result + 32))
  {
    v3 = result;
    if (a2)
    {
      if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
        xpc_dictionary_get_BOOL(a2, "0");
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  -[SSKeyValueStore setValue:forDomain:key:completionBlock:](self, "setValue:forDomain:key:completionBlock:", a3, a4, a5, 0);
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5 completionBlock:(id)a6
{
  SSKeyValueStoreDatabase *database;
  id v12;
  id v13;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  if (self->_useLocalWrite)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    database = self->_database;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__SSKeyValueStore_setValue_forDomain_key_completionBlock___block_invoke;
    v14[3] = &unk_1E47BE5D8;
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    v14[7] = &v15;
    -[SSKeyValueStoreDatabase modifyUsingTransactionBlock:](database, "modifyUsingTransactionBlock:", v14);
    if (a6)
      (*((void (**)(id, _QWORD))a6 + 2))(a6, *((unsigned __int8 *)v16 + 24));
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0C99D80]);
    if (!a3)
      a3 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (id)objc_msgSend(v12, "initWithObjectsAndKeys:", a3, a5, 0);
    -[SSKeyValueStore setValuesWithDictionary:forDomain:completionBlock:](self, "setValuesWithDictionary:forDomain:completionBlock:", v13, a4, a6);

  }
}

uint64_t __58__SSKeyValueStore_setValue_forDomain_key_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(a2, "setValue:forDomain:key:", a1[4], a1[5], a1[6]);
  return *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
}

- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4
{
  -[SSKeyValueStore setValuesWithDictionary:forDomain:completionBlock:](self, "setValuesWithDictionary:forDomain:completionBlock:", a3, a4, 0);
}

- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4 completionBlock:(id)a5
{
  SSKeyValueStoreDatabase *database;
  id v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  uint64_t v25;
  SSXPCConnection *connection;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[7];
  __int128 v31;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  if (self->_useLocalWrite)
  {
    *(_QWORD *)&v31 = 0;
    *((_QWORD *)&v31 + 1) = &v31;
    v32 = 0x2020000000;
    v33 = 1;
    database = self->_database;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke;
    v30[3] = &unk_1E47BE628;
    v30[5] = a4;
    v30[6] = &v31;
    v30[4] = a3;
    -[SSKeyValueStoreDatabase modifyUsingTransactionBlock:](database, "modifyUsingTransactionBlock:", v30);
    if (a5)
      (*((void (**)(id, _QWORD))a5 + 2))(a5, *(unsigned __int8 *)(*((_QWORD *)&v31 + 1) + 24));
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v10 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v10)
        v10 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v13 = v12;
      else
        v13 = v12 & 2;
      if (v13)
      {
        LODWORD(v31) = 136446210;
        *(_QWORD *)((char *)&v31 + 4) = "-[SSKeyValueStore setValuesWithDictionary:forDomain:completionBlock:]";
        LODWORD(v27) = 12;
        v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v31, v27);
          free(v15);
          SSFileLog(v10, CFSTR("%@"), v17, v18, v19, v20, v21, v22, v16);
        }
      }
    }
    v23 = SSXPCCreateMessageDictionary(93);
    SSXPCDictionarySetCFObject(v23, "1", (__CFString *)a4);
    v24 = xpc_dictionary_create(0, 0, 0);
    v25 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_25;
    v29[3] = &unk_1E47BE650;
    v29[4] = v24;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v29);
    xpc_dictionary_set_value(v23, "2", v24);
    xpc_release(v24);
    connection = self->_connection;
    v28[0] = v25;
    v28[1] = 3221225472;
    v28[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2_26;
    v28[3] = &unk_1E47B8FA0;
    v28[4] = a5;
    -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v23, v28);
    xpc_release(v23);
  }
}

uint64_t __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v7[6];
  __int128 v8;

  v4 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2;
  v7[3] = &unk_1E47BE600;
  v7[4] = v4;
  v7[5] = a2;
  v8 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t result;

  v7 = a1[4];
  v6 = (void *)a1[5];
  if (v7 == a3)
    a3 = 0;
  result = objc_msgSend(v6, "setValue:forDomain:key:", a3, a1[6], a2);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) ^ 1;
  return result;
}

void __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_25(uint64_t a1, void *a2, __CFString *a3)
{
  uint64_t v6;

  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
    if (!v6)
      return;
    a3 = (__CFString *)v6;
  }
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), (const char *)objc_msgSend(a2, "UTF8String"), a3);
}

uint64_t __69__SSKeyValueStore_setValuesWithDictionary_forDomain_completionBlock___block_invoke_2_26(uint64_t result, void *a2)
{
  uint64_t v3;

  if (*(_QWORD *)(result + 32))
  {
    v3 = result;
    if (a2)
    {
      if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
        xpc_dictionary_get_BOOL(a2, "0");
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

- (id)accountDictionaries
{
  id v3;
  SSKeyValueStoreDatabase *database;
  _QWORD v6[5];

  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  database = self->_database;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SSKeyValueStore_accountDictionaries__block_invoke;
  v6[3] = &unk_1E47BE678;
  v6[4] = v3;
  -[SSKeyValueStoreDatabase readUsingSessionBlock:](database, "readUsingSessionBlock:", v6);
  return v3;
}

void __38__SSKeyValueStore_accountDictionaries__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = objc_msgSend(a2, "copyAccountDictionaryForDomain:", CFSTR("com.apple.itunesstored"));
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  v6 = (void *)objc_msgSend(a2, "copyAccountDictionaryForDomain:", CFSTR("com.apple.mobile.iTunes.store"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setObject:forKey:", SSAccountSourceStringForSource(1), CFSTR("AccountSource"));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
  v8 = objc_msgSend(a2, "copyValueForDomain:key:", CFSTR("com.apple.mobile.iTunes.store"), CFSTR("KnownAccounts"));
  if (v8)
  {
    v9 = (id)v8;
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v8);

  }
}

- (id)copyAccounts
{
  id v3;
  SSKeyValueStoreDatabase *database;
  _QWORD v6[6];

  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  database = self->_database;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SSKeyValueStore_copyAccounts__block_invoke;
  v6[3] = &unk_1E47BE6A0;
  v6[4] = v3;
  v6[5] = self;
  -[SSKeyValueStoreDatabase readUsingSessionBlock:](database, "readUsingSessionBlock:", v6);
  return v3;
}

void __31__SSKeyValueStore_copyAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  SSAccount *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  int v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(a2, "copyAccountDictionaryForDomain:", CFSTR("com.apple.itunesstored"));
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "addObject:", v6);

  }
  v8 = (void *)objc_msgSend(a2, "copyAccountDictionaryForDomain:", CFSTR("com.apple.mobile.iTunes.store"));
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setObject:forKey:", SSAccountSourceStringForSource(1), CFSTR("AccountSource"));
    objc_msgSend(v5, "addObject:", v9);

  }
  v47 = a2;
  v10 = objc_msgSend(a2, "copyValueForDomain:key:", CFSTR("com.apple.mobile.iTunes.store"), CFSTR("KnownAccounts"));
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v5);
        v16 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        v17 = objc_alloc_init(SSAccount);
        -[SSAccount setLockdownDictionary:](v17, "setLockdownDictionary:", v16);
        v18 = -[SSAccount uniqueIdentifier](v17, "uniqueIdentifier");
        v19 = -[SSAccount accountName](v17, "accountName");
        if (v18)
          v20 = v19 == 0;
        else
          v20 = 1;
        if (!v20)
        {
          v21 = v19;
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v17) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
            objc_msgSend(v4, "addObject:", v21);
          }
        }

      }
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v13);
  }
  v46 = objc_msgSend(v47, "iTunesValueForKey:usedDomain:", CFSTR("DSPersonID"), 0);
  v45 = objc_msgSend(v47, "iTunesValueForKey:usedDomain:", CFSTR("ActiveLockerAccountID"), 0);
  v22 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v22 >= 1)
  {
    for (j = v22 + 1; j > 1; --j)
    {
      v24 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", j - 2);
      v25 = (void *)objc_msgSend(v24, "uniqueIdentifier");
      v26 = objc_msgSend(v25, "isEqual:", v46);
      v27 = objc_msgSend(v25, "isEqual:", v45);
      v28 = objc_msgSend(v24, "accountName");
      if (v28 && objc_msgSend(v4, "countForObject:", v28) >= 2)
      {
        v29 = 0;
        if (objc_msgSend(v24, "accountScope"))
          goto LABEL_26;
      }
      else
      {
        v29 = 1;
      }
      objc_msgSend(v24, "setActive:", v26);
      objc_msgSend(v24, "setActiveLockerAccount:", v27);
LABEL_26:
      if (((v26 | v27 | v29) & 1) == 0)
      {
        v30 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v30)
          v30 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v31 = objc_msgSend(v30, "shouldLog");
        if (objc_msgSend(v30, "shouldLogToDisk"))
          v32 = v31 | 2;
        else
          v32 = v31;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v30, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v32 &= 2u;
        if (v32)
        {
          v33 = objc_opt_class();
          v52 = 138412802;
          v53 = v33;
          v54 = 2112;
          v55 = v25;
          v56 = 2112;
          v57 = v28;
          LODWORD(v44) = 32;
          v43 = &v52;
          v34 = _os_log_send_and_compose_impl();
          if (v34)
          {
            v35 = (void *)v34;
            v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, 4, &v52, v44);
            free(v35);
            SSFileLog(v30, CFSTR("%@"), v37, v38, v39, v40, v41, v42, v36);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", j - 2, v43);
      }
    }
  }

}

- (BOOL)isLocalReadable
{
  return self->_useLocalRead;
}

- (BOOL)isLocalWritable
{
  return self->_useLocalWrite;
}

- (id)iTunesValueForKey:(id)a3 usedDomain:(id *)a4
{
  SSKeyValueStoreDatabase *database;
  uint64_t *v8;
  id v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__49;
  v23 = __Block_byref_object_dispose__49;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__49;
  v17 = __Block_byref_object_dispose__49;
  v18 = 0;
  database = self->_database;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__SSKeyValueStore_iTunesValueForKey_usedDomain___block_invoke;
  v12[3] = &unk_1E47BE6C8;
  v12[4] = a3;
  v12[5] = &v19;
  v12[6] = &v13;
  -[SSKeyValueStoreDatabase readUsingSessionBlock:](database, "readUsingSessionBlock:", v12);
  v8 = v14;
  if (a4 && v20[5])
    *a4 = (id)v14[5];
  v9 = (id)v8[5];
  v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

id __48__SSKeyValueStore_iTunesValueForKey_usedDomain___block_invoke(_QWORD *a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = (id)objc_msgSend(a2, "iTunesValueForKey:usedDomain:", a1[4], *(_QWORD *)(a1[6] + 8) + 40);
  return *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  -[SSKeyValueStoreDatabase modifyUsingTransactionBlock:](self->_database, "modifyUsingTransactionBlock:", a3);
}

- (void)readUsingSessionBlock:(id)a3
{
  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  -[SSKeyValueStoreDatabase readUsingSessionBlock:](self->_database, "readUsingSessionBlock:", a3);
}

- (void)removeAccountFromDomain:(id)a3
{
  SSKeyValueStoreDatabase *database;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19;
  uint64_t v20;
  _QWORD v21[5];
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SSKeyValueStore _loadDatabaseIfNecessary](self, "_loadDatabaseIfNecessary");
  if (self->_useLocalWrite)
  {
    database = self->_database;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __43__SSKeyValueStore_removeAccountFromDomain___block_invoke;
    v21[3] = &unk_1E47BE6F0;
    v21[4] = a3;
    -[SSKeyValueStoreDatabase modifyAsyncUsingTransactionBlock:](database, "modifyAsyncUsingTransactionBlock:", v21);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v6)
        v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v9 = v8;
      else
        v9 = v8 & 2;
      if (v9)
      {
        v22 = 136446210;
        v23 = "-[SSKeyValueStore removeAccountFromDomain:]";
        LODWORD(v20) = 12;
        v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v20);
          free(v11);
          SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    v19 = SSXPCCreateMessageDictionary(193);
    SSXPCDictionarySetCFObject(v19, "1", (__CFString *)a3);
    -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v19);
    xpc_release(v19);
  }
}

uint64_t __43__SSKeyValueStore_removeAccountFromDomain___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "removeAccountFromDomain:", *(_QWORD *)(a1 + 32));
  return 1;
}

- (void)_loadDatabaseIfNecessary
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL useLocalRead;
  BOOL useLocalWrite;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_database)
    return;
  if (self->_useLocalWrite)
  {
    self->_database = objc_alloc_init(SSKeyValueStoreDatabase);
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v5 &= 2u;
    if (!v5)
      goto LABEL_23;
  }
  else
  {
    if (!self->_useLocalRead)
      goto LABEL_23;
    self->_database = (SSKeyValueStoreDatabase *)-[SSKeyValueStoreDatabase initReadOnly]([SSKeyValueStoreDatabase alloc], "initReadOnly");
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (!v7)
      goto LABEL_23;
  }
  LODWORD(v19) = 138412290;
  *(_QWORD *)((char *)&v19 + 4) = objc_opt_class();
  LODWORD(v18) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();
  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v19, v18, v19);
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
  }
LABEL_23:
  useLocalRead = self->_useLocalRead;
  if (useLocalRead)
    useLocalRead = self->_database != 0;
  self->_useLocalRead = useLocalRead;
  useLocalWrite = self->_useLocalWrite;
  if (useLocalWrite)
    useLocalWrite = self->_database != 0;
  self->_useLocalWrite = useLocalWrite;
}

@end
