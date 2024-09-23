@implementation SRUIFDataStore

- (SRUIFDataStore)initWithEntries:(id)a3
{
  id v4;
  SRUIFDataStore *v5;
  uint64_t v6;
  NSMutableDictionary *entries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFDataStore;
  v5 = -[SRUIFDataStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (SRUIFDataStore)init
{
  void *v3;
  SRUIFDataStore *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRUIFDataStore initWithEntries:](self, "initWithEntries:", v3);

  return v4;
}

- (void)setImageData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _SRUIFDataStoreEntry *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_SRUIFDataStoreEntry initWithType:value:]([_SRUIFDataStoreEntry alloc], "initWithType:value:", 1, v7);

  -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:", v8, v6);
}

- (id)imageDataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "type") != 1)
  {
    v8 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFDataStore imageDataForKey:].cold.1((uint64_t)v4, v8, v6);
    goto LABEL_6;
  }
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  NSMutableDictionary *entries;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_24DC26470, CFSTR("Version"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entries, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  entries = self->_entries;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SRUIFDataStore_propertyListRepresentation__block_invoke;
  v8[3] = &unk_24DC1AAF0;
  v9 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entries, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("Entries"));

  return v3;
}

void __44__SRUIFDataStore_propertyListRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "propertyListRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (SRUIFDataStore)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  SRUIFDictionarySchema *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SRUIFDataStore *v13;
  NSObject *v14;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(SRUIFDictionarySchema);
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v6, CFSTR("Version"));

  +[SRUIFCoercion coercionWithBlock:](SRUIFCoercion, "coercionWithBlock:", &__block_literal_global_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v7, CFSTR("Entries"));

  v16 = 0;
  -[SRUIFDictionarySchema coerceObject:error:](v5, "coerceObject:error:", v4, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (!v8)
  {
    v14 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFDataStore initWithPropertyListRepresentation:].cold.1((uint64_t)v4, (uint64_t)v9, v14);
    goto LABEL_8;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("Version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 != 1)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFDataStore initWithPropertyListRepresentation:].cold.2();
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("Entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[SRUIFDataStore initWithEntries:](self, "initWithEntries:", v12);

  v13 = self;
LABEL_9:

  return v13;
}

id __53__SRUIFDataStore_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a2;
  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  obj = v21[5];
  objc_msgSend(v5, "coerceObject:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v6 + 5, obj);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v15[5];
    v15[5] = v8;

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__SRUIFDataStore_initWithPropertyListRepresentation___block_invoke_28;
    v12[3] = &unk_24DC1AB58;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v21[5]);
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __53__SRUIFDataStore_initWithPropertyListRepresentation___block_invoke_28(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  _SRUIFDataStoreEntry *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v14 = 0;
  v9 = -[_SRUIFDataStoreEntry initWithPropertyListRepresentation:error:]([_SRUIFDataStoreEntry alloc], "initWithPropertyListRepresentation:error:", v8, &v14);

  v10 = v14;
  v11 = v14;
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v9, v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

    *a4 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

- (void)imageDataForKey:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = "-[SRUIFDataStore imageDataForKey:]";
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_1_2(&dword_219F26000, v5, v7, "%s returning nil because value for key \"%@\" is %@, which cannot be coerced to an image", (uint8_t *)&v8);

}

- (void)initWithPropertyListRepresentation:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[SRUIFDataStore initWithPropertyListRepresentation:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  OUTLINED_FUNCTION_1_2(&dword_219F26000, a3, (uint64_t)a3, "%s returning nil; passed invalid property list (%@): %{public}@",
    (uint8_t *)&v3);
}

- (void)initWithPropertyListRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_219F26000, v0, v1, "%s unable to deserialize property list with version %{public}ld; returning nil",
    v2,
    v3,
    v4,
    v5,
    2u);
}

@end
