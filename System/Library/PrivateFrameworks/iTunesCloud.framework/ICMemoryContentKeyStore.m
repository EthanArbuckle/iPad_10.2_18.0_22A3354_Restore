@implementation ICMemoryContentKeyStore

- (ICMemoryContentKeyStore)init
{
  ICMemoryContentKeyStore *v2;
  uint64_t v3;
  NSMutableDictionary *keyEntries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMemoryContentKeyStore;
  v2 = -[ICMemoryContentKeyStore init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
    v3 = objc_claimAutoreleasedReturnValue();
    keyEntries = v2->_keyEntries;
    v2->_keyEntries = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)containsKeyForIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (a4)
    *a4 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyEntries, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "keyData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)loadKeyForIdentifier:(id)a3 error:(id *)a4
{
  id result;

  result = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_keyEntries, "objectForKeyedSubscript:", a3);
  if (a4)
    *a4 = 0;
  return result;
}

- (id)saveKey:(id)a3 forIdentifier:(id)a4 adamID:(id)a5 withRenewalDate:(id)a6 accountDSID:(id)a7 keyServerProtocolType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ICContentKeyStoreEntry *v19;
  id v20;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[ICContentKeyStoreEntry initWithIdentifier:]([ICContentKeyStoreEntry alloc], "initWithIdentifier:", v17);
  -[ICContentKeyStoreEntry setKeyData:](v19, "setKeyData:", v18);

  -[ICContentKeyStoreEntry setRenewalDate:](v19, "setRenewalDate:", v15);
  -[ICContentKeyStoreEntry setAccountDSID:](v19, "setAccountDSID:", v14);

  -[ICContentKeyStoreEntry setAdamID:](v19, "setAdamID:", v16);
  -[ICContentKeyStoreEntry setKeyServerProtocolType:](v19, "setKeyServerProtocolType:", a8);
  v20 = -[ICMemoryContentKeyStore saveKeyEntry:](self, "saveKeyEntry:", v19);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyEntries, "setObject:forKeyedSubscript:", v19, v17);

  return 0;
}

- (id)saveKeyEntry:(id)a3
{
  NSMutableDictionary *keyEntries;
  id v4;
  void *v5;

  keyEntries = self->_keyEntries;
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](keyEntries, "setObject:forKeyedSubscript:", v4, v5);

  return 0;
}

- (id)removeKeyForIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_keyEntries, "removeObjectForKey:", a3);
  return 0;
}

- (id)removeAllKeys
{
  -[NSMutableDictionary removeAllObjects](self->_keyEntries, "removeAllObjects");
  return 0;
}

- (void)enumerateKeyEntriesUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *keyEntries;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  keyEntries = self->_keyEntries;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ICMemoryContentKeyStore_enumerateKeyEntriesUsingBlock___block_invoke;
  v7[3] = &unk_1E438C108;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyEntries, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (id)incrementFailureCountForKeyWithIdentifier:(id)a3
{
  id v4;
  ICContentKeyStoreEntry *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyEntries, "objectForKeyedSubscript:", v4);
  v5 = (ICContentKeyStoreEntry *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = -[ICContentKeyStoreEntry initWithIdentifier:]([ICContentKeyStoreEntry alloc], "initWithIdentifier:", v4);
  -[ICContentKeyStoreEntry setFailureCount:](v5, "setFailureCount:", -[ICContentKeyStoreEntry failureCount](v5, "failureCount") + 1);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyEntries, "setObject:forKeyedSubscript:", v5, v4);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyEntries, 0);
}

uint64_t __57__ICMemoryContentKeyStore_enumerateKeyEntriesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
