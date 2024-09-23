@implementation CRDictionary

- (CRDictionary)init
{
  CRDictionary *v2;
  uint64_t v3;
  NSMapTable *contents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRDictionary;
  v2 = -[CRDictionary init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    contents = v2->_contents;
    v2->_contents = (NSMapTable *)v3;

  }
  return v2;
}

- (CRDictionary)initWithDocument:(id)a3
{
  id v4;
  CRDictionary *v5;
  uint64_t v6;
  NSMapTable *contents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRDictionary;
  v5 = -[CRDictionary init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    contents = v5->_contents;
    v5->_contents = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_document, v4);
  }

  return v5;
}

- (void)encodeWithCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::Dictionary *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 6)
  {
    v6 = *(CRDT::Dictionary **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 6;
    v6 = (CRDT::Dictionary *)operator new();
    CRDT::Dictionary::Dictionary(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[CRDictionary encodeWithCRCoder:dictionary:](self, "encodeWithCRCoder:dictionary:", v7, v6);

}

- (void)encodeWithCRCoder:(id)a3 dictionary:(void *)a4
{
  -[CRDictionary encodeWithCRCoder:dictionary:elementValueCoder:](self, "encodeWithCRCoder:dictionary:elementValueCoder:", a3, a4, &__block_literal_global_42);
}

void __45__CRDictionary_encodeWithCRCoder_dictionary___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  CRDT::ObjectID *v10;
  CRDT::ObjectID *v11;
  id v12;

  v12 = a2;
  v8 = a3;
  v9 = a5;
  if (v8 && objc_msgSend(v8, "conformsToProtocol:", &unk_1EF0FA208))
  {
    *(_DWORD *)(a4 + 32) |= 2u;
    v10 = *(CRDT::ObjectID **)(a4 + 48);
    if (!v10)
    {
      v10 = (CRDT::ObjectID *)operator new();
      CRDT::ObjectID::ObjectID(v10);
      *(_QWORD *)(a4 + 48) = v10;
    }
    objc_msgSend(v9, "encodeObject:forObjectID:", v8, v10);
  }
  *(_DWORD *)(a4 + 32) |= 1u;
  v11 = *(CRDT::ObjectID **)(a4 + 40);
  if (!v11)
  {
    v11 = (CRDT::ObjectID *)operator new();
    CRDT::ObjectID::ObjectID(v11);
    *(_QWORD *)(a4 + 40) = v11;
  }
  objc_msgSend(v9, "encodeObject:forObjectID:", v12, v11);

}

- (void)encodeWithCRCoder:(id)a3 dictionary:(void *)a4 elementValueCoder:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *, CRDT::Dictionary_Element *, id);
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  CRDT::Dictionary_Element *v17;
  uint64_t v18;
  int32x2_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CRDT::VectorTimestamp *v24;
  id obj;
  CRDictionary *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *, CRDT::Dictionary_Element *, id))a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = self;
  -[CRDictionary contents](self, "contents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v14 = *((_DWORD *)a4 + 13);
        v15 = *((int *)a4 + 12);
        if ((int)v15 >= v14)
        {
          if (v14 == *((_DWORD *)a4 + 14))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a4 + 10, v14 + 1);
          v17 = google::protobuf::internal::GenericTypeHandler<CRDT::Dictionary_Element>::New();
          v18 = *((_QWORD *)a4 + 5);
          v19 = *(int32x2_t *)((char *)a4 + 48);
          *((int32x2_t *)a4 + 6) = vadd_s32(v19, (int32x2_t)0x100000001);
          *(_QWORD *)(v18 + 8 * v19.i32[0]) = v17;
        }
        else
        {
          v16 = *((_QWORD *)a4 + 5);
          *((_DWORD *)a4 + 12) = v15 + 1;
          v17 = *(CRDT::Dictionary_Element **)(v16 + 8 * v15);
        }
        -[CRDictionary contents](v26, "contents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v13, v22, v17, v8);

        objc_msgSend(v21, "timestamp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *((_DWORD *)v17 + 8) |= 4u;
        v24 = (CRDT::VectorTimestamp *)*((_QWORD *)v17 + 7);
        if (!v24)
        {
          v24 = (CRDT::VectorTimestamp *)operator new();
          CRDT::VectorTimestamp::VectorTimestamp(v24);
          *((_QWORD *)v17 + 7) = v24;
        }
        objc_msgSend(v23, "encodeIntoProtobufTimestamp:coder:", v24, v8);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

}

- (CRDictionary)initWithCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CRDictionary *v6;
  void *v7;
  CRDictionary *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 6)
  {
    v6 = -[CRDictionary initWithCRCoder:dictionary:](self, "initWithCRCoder:dictionary:", v4, *(_QWORD *)(v5 + 40));
  }
  else
  {
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRDictionary initWithDocument:](self, "initWithDocument:", v7);

  }
  v8 = v6;

  return v8;
}

- (CRDictionary)initWithCRCoder:(id)a3 dictionary:(const void *)a4
{
  return -[CRDictionary initWithCRCoder:dictionary:elementValueDecoder:](self, "initWithCRCoder:dictionary:elementValueDecoder:", a3, a4, &__block_literal_global_86);
}

- (CRDictionary)initWithCRCoder:(id)a3 dictionary:(const void *)a4 elementValueDecoder:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id *, id);
  void *v10;
  CRDictionary *v11;
  void *v12;
  uint64_t *i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  CRVectorTimestamp *v18;
  CRVectorTimestamp *v19;
  CRVectorTimestamp *v20;
  uint64_t v21;
  CRDictionaryElement *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  CRDictionary *v27;
  id v28;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, id *, id))a5;
  objc_msgSend(v8, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRDictionary initWithDocument:](self, "initWithDocument:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *((int *)a4 + 12));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_DWORD *)a4 + 12))
    {
      for (i = (uint64_t *)*((_QWORD *)a4 + 5); i != (uint64_t *)(*((_QWORD *)a4 + 5) + 8 * *((int *)a4 + 12)); ++i)
      {
        v14 = *i;
        v28 = 0;
        v9[2](v9, v14, &v28, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v28;
        v17 = v16;
        if ((*(_BYTE *)(v14 + 32) & 4) != 0)
        {
          v19 = [CRVectorTimestamp alloc];
          v20 = v19;
          v21 = *(_QWORD *)(v14 + 56);
          if (!v21)
            v21 = *(_QWORD *)(CRDT::Dictionary_Element::default_instance((CRDT::Dictionary_Element *)v19) + 56);
          v18 = -[CRVectorTimestamp initWithProtobufTimestamp:decoder:](v20, "initWithProtobufTimestamp:decoder:", v21, v8);
          if (!v17)
            goto LABEL_11;
        }
        else
        {
          v18 = 0;
          if (!v16)
            goto LABEL_11;
        }
        v22 = -[CRDictionaryElement initWithValue:timestamp:]([CRDictionaryElement alloc], "initWithValue:timestamp:", v15, v18);
        objc_msgSend(v12, "addObject:", v17);
        objc_msgSend(v12, "addObject:", v22);

LABEL_11:
      }
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__CRDictionary_initWithCRCoder_dictionary_elementValueDecoder___block_invoke;
    v25[3] = &unk_1E67FA838;
    v23 = v12;
    v26 = v23;
    v27 = v11;
    objc_msgSend(v8, "addDecoderCompletionHandler:dependency:for:", v25, 0, v27);

  }
  return v11;
}

void __63__CRDictionary_initWithCRCoder_dictionary_elementValueDecoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2)
  {
    v3 = v2;
    for (i = 0; i < v3; i += 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "contents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, v7);

    }
  }
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[CRDictionary contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[CRDictionary contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (id)keyEnumerator
{
  void *v2;
  void *v3;

  -[CRDictionary contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateKeysObjectsAndTimestampsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, void *, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  v18 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CRDictionary contents](self, "contents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v5);
      v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
      -[CRDictionary contents](self, "contents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "value");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v9, v12, v13, &v18);

      LOBYTE(v12) = v18 == 0;
      if ((v12 & 1) == 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRDictionary contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRDictionary contents](self, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CRDictionary contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CRDictionaryElement *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[CRDictionary contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[REMLog crdt](REMLog, "crdt");
    v10 = (CRDictionaryElement *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
      -[CRDictionary setObject:forKey:].cold.1(&v10->super);
  }
  else
  {
    v10 = -[CRDictionaryElement initWithValue:]([CRDictionaryElement alloc], "initWithValue:", v6);
    -[CRDictionary document](self, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "replicaClock");

    -[CRDictionaryElement timestamp](v10, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRReplica unserialisedIdentifier](CRReplica, "unserialisedIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClock:forUUID:", v12 + 1, v14);

    -[CRDictionary contents](self, "contents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v10, v7);

    -[CRDictionary document](self, "document");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDocumentFor:", v7);

    -[CRDictionary document](self, "document");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDocumentFor:", v6);

  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  -[CRDictionary objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRDictionary contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v6);

  -[CRDictionary document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDictionary setRemoveClock:](self, "setRemoveClock:", objc_msgSend(v5, "replicaClock") + 1);

}

- (void)removeAllObjects
{
  id v3;
  id v4;

  -[CRDictionary contents](self, "contents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CRDictionary document](self, "document");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRDictionary setRemoveClock:](self, "setRemoveClock:", objc_msgSend(v4, "replicaClock") + 1);

}

- (void)realizeLocalChangesIn:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CRDictionary contents](self, "contents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v7);
        -[CRDictionary contents](self, "contents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "timestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRReplica unserialisedIdentifier](CRReplica, "unserialisedIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "clockForUUID:", v12);

        if (v13 >= 1)
        {
          objc_msgSend(v10, "timestamp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[CRReplica unserialisedIdentifier](CRReplica, "unserialisedIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeUUID:", v15);

          objc_msgSend(v10, "timestamp");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "replica");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setClock:forUUID:", v13, v17);

          v18 = objc_msgSend(v4, "unserializedReplicaClock");
          if (v18 <= v13)
            v19 = v13;
          else
            v19 = v18;
          objc_msgSend(v4, "setUnserializedReplicaClock:", v19);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

  if (-[CRDictionary removeClock](self, "removeClock") >= 1)
  {
    v20 = objc_msgSend(v4, "unserializedReplicaClock");
    v21 = -[CRDictionary removeClock](self, "removeClock");
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    objc_msgSend(v4, "setUnserializedReplicaClock:", v22);
  }
  -[CRDictionary setRemoveClock:](self, "setRemoveClock:", 0);

}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge, classes must be equal for merge."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  -[CRDictionary mergeWithDictionary:](self, "mergeWithDictionary:", v5);

}

- (void)mergeWithDictionary:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  id obja;
  id v39;
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
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[CRDictionary contents](self, "contents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v49;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v49 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v6);
        -[CRDictionary contents](self, "contents");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "contents");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v9, "mergeWith:", v11);
        }
        else
        {
          objc_msgSend(v9, "timestamp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "document");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "version");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "minusVectorTimestamp:", v14);

          objc_msgSend(v9, "timestamp");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = objc_msgSend(v15, "count") == 0;

          if ((_DWORD)v12)
            objc_msgSend(v35, "addObject:", v7);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v4);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obja = v35;
  v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v45;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(obja);
        v19 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v18);
        -[CRDictionary contents](self, "contents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectForKey:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v16);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v39, "contents");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v41;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v36);
        v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v23);
        -[CRDictionary contents](self, "contents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (v27)
        {
          objc_msgSend(v39, "contents");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          -[CRDictionary document](self, "document");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "version");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timestamp");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (objc_msgSend(v31, "compare:", v32) & 1) == 0;

          if (!v33)
          {
            -[CRDictionary contents](self, "contents");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKey:", v29, v24);

          }
        }
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v21);
  }

}

- (void)setDocument:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_document, v4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CRDictionary contents](self, "contents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[CRDictionary contents](self, "contents");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localObject:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == v13;

          if (!v15)
            objc_msgSend(v11, "setValue:", v13);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (id)deltaSince:(id)a3 in:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CRDictionaryElement *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  CRDictionary *v22;
  id v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v23 = a4;
  v22 = -[CRDictionary initWithDocument:]([CRDictionary alloc], "initWithDocument:", v23);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CRDictionary contents](self, "contents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v8);
        -[CRDictionary contents](self, "contents");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "timestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");

        objc_msgSend(v13, "minusVectorTimestamp:", v25);
        objc_msgSend(v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deltaSince:in:", v25, v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc_init(CRDictionaryElement);
        v17 = v15;
        if (!v15)
        {
          objc_msgSend(v11, "value");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "tombstone");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v5;
        }
        -[CRDictionaryElement setValue:](v16, "setValue:", v17);
        if (!v15)
        {

        }
        -[CRDictionaryElement setTimestamp:](v16, "setTimestamp:", v13);
        -[CRDictionary contents](v22, "contents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v16, v9);

        ++v8;
      }
      while (v7 != v8);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  return v22;
}

- (void)walkGraph:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CRDictionary contents](self, "contents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v4[2](v4, v9);
        -[CRDictionary contents](self, "contents");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v4)[2](v4, v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[CRDictionary count](self, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB37A0];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p (\n"), v5, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CRDictionary contents](self, "contents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
          -[CRDictionary contents](self, "contents");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v11) = v13 == v10;

          objc_msgSend(v12, "timestamp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "shortDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "value");
          if ((_DWORD)v11)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendFormat:", CFSTR("  %@ %@,\n"), v15, v16);
          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendFormat:", CFSTR("  %@ : %@ %@,\n"), v10, v15, v16);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

    objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 2, 2, CFSTR(")>"));
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p>"), v19, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (CRDocument)document
{
  return (CRDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (NSMapTable)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (int64_t)removeClock
{
  return self->_removeClock;
}

- (void)setRemoveClock:(int64_t)a3
{
  self->_removeClock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_document);
}

- (void)setObject:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B4A39000, log, OS_LOG_TYPE_DEBUG, "Setting value for an existing key has no effect in a CRDictionary.", v1, 2u);
}

@end
