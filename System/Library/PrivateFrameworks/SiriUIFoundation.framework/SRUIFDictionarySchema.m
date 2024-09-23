@implementation SRUIFDictionarySchema

- (SRUIFDictionarySchema)init
{
  SRUIFDictionarySchema *v2;
  uint64_t v3;
  NSMutableDictionary *coercions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRUIFDictionarySchema;
  v2 = -[SRUIFDictionarySchema init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    coercions = v2->_coercions;
    v2->_coercions = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setObjectCoercion:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_coercions, "setObject:forKey:", a3, a4);
}

- (id)coerceObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(v20 + 5);
  obj = (id)v20[5];
  objc_msgSend(v7, "coerceObject:error:", v6, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __44__SRUIFDictionarySchema_coerceObject_error___block_invoke;
    v15[3] = &unk_24DC1B848;
    v15[4] = self;
    v11 = v10;
    v16 = v11;
    v17 = &v19;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease((id)v20[5]);
LABEL_4:
  if (v20[5])
    v12 = 0;
  else
    v12 = v11;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __44__SRUIFDictionarySchema_coerceObject_error___block_invoke(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[SRUIFCoercion identityCoercion](SRUIFCoercion, "identityCoercion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = 0;
  objc_msgSend(v9, "coerceObject:error:", v8, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  v12 = v13;
  if (v10)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7);
  if (v12)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11);
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coercions, 0);
}

@end
