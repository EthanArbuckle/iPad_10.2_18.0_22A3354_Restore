@implementation PLManagedObjectJournalEntryPayload

- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 nilAttributes:(id)a5
{
  return -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:](self, "initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:", a3, *(_QWORD *)&a4, a5, 0, 0, 0, 0);
}

- (PLManagedObjectJournalEntryPayload)initWithInsertAdapter:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PLManagedObjectJournalEntryPayload *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "payloadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
  objc_msgSend(v7, "sourceObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:](self, "initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:", v8, v9, 0, v10, v6, v11, 0);

  return v12;
}

- (PLManagedObjectJournalEntryPayload)initWithInsertAdapter:(id)a3 changedKeys:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PLManagedObjectJournalEntryPayload *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "payloadID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
  objc_msgSend(v10, "sourceObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:](self, "initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:", v11, v12, 0, v13, v9, v14, v8);

  return v15;
}

- (PLManagedObjectJournalEntryPayload)initWithManagedObject:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PLManagedObjectJournalEntryPayload *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "payloadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:](self, "initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:", v8, v9, 0, v7, v6, v10, 0);

  return v11;
}

- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 managedObject:(id)a5 changedKeys:(id)a6 modelProperties:(id)a7
{
  return -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:](self, "initWithPayloadID:payloadVersion:nilAttributes:sourceObject:changedKeys:modelProperties:info:", a3, *(_QWORD *)&a4, 0, a5, a6, a7, 0);
}

- (PLManagedObjectJournalEntryPayload)initWithPayloadID:(id)a3 payloadVersion:(unsigned int)a4 nilAttributes:(id)a5 sourceObject:(id)a6 changedKeys:(id)a7 modelProperties:(id)a8 info:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *payloadAttributes;
  NSMutableSet *v24;
  NSMutableSet *v25;
  NSMutableSet **p_nilAttributes;
  NSMutableSet *v27;
  NSMutableSet *nilAttributes;
  BOOL v29;
  BOOL v30;
  PLManagedObjectJournalEntryPayload *v31;
  PLManagedObjectJournalEntryPayload *v32;
  PLManagedObjectJournalEntryPayload *v33;
  objc_super v35;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!v16)
    goto LABEL_16;
  v35.receiver = self;
  v35.super_class = (Class)PLManagedObjectJournalEntryPayload;
  self = -[PLManagedObjectJournalEntryPayload init](&v35, sel_init);
  if (!self)
    goto LABEL_16;
  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  payloadAttributes = self->_payloadAttributes;
  self->_payloadAttributes = v22;

  objc_storeStrong((id *)&self->_payloadID, a3);
  self->_payloadVersion = a4;
  if (!v18)
  {
    v27 = (NSMutableSet *)objc_msgSend(v17, "mutableCopy");
    nilAttributes = self->_nilAttributes;
    self->_nilAttributes = v27;

LABEL_16:
    self = self;
    v33 = self;
    goto LABEL_17;
  }
  if (v19)
  {
    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    p_nilAttributes = &self->_nilAttributes;
    v25 = self->_nilAttributes;
    self->_nilAttributes = v24;
  }
  else
  {
    p_nilAttributes = &self->_nilAttributes;
    v25 = self->_nilAttributes;
    self->_nilAttributes = 0;
  }

  v29 = -[PLManagedObjectJournalEntryPayload _applyModelProperties:toPayloadAttributes:andNilAttributes:fromSourceObject:changedKeys:info:](self, "_applyModelProperties:toPayloadAttributes:andNilAttributes:fromSourceObject:changedKeys:info:", v20, self->_payloadAttributes, self->_nilAttributes, v18, v19, v21);
  v30 = v29;
  if (v19 && !v29)
  {
    if (-[NSMutableDictionary count](self->_payloadAttributes, "count")
      || -[NSMutableSet count](*p_nilAttributes, "count"))
    {
      v31 = self;
    }
    else
    {
      v31 = 0;
    }
    v32 = v31;

    self = v32;
  }
  if (!v30)
    goto LABEL_16;
  v33 = 0;
LABEL_17:

  return v33;
}

- (id)rawPayloadAttributes
{
  return self->_payloadAttributes;
}

- (void)setRawPayloadAttribute:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payloadAttributes, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)setRawPayloadAttributes:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_payloadAttributes, "addEntriesFromDictionary:", a3);
}

- (id)rawPayloadAttributeForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", a3);
}

- (id)_payloadAttributesListForSubRelationshipProperty:(id)a3 withManagedObjects:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  id v26;
  BOOL v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v8 = a4;
  v9 = a5;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend((id)objc_opt_class(), "payloadAdapterForManagedObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v27 = 0;
        if (v9
          && (objc_msgSend(v15, "sourceObject"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v9, "validForPersistenceWithPayloadProperty:andValue:stop:", v26, v17, &v27),
              v17,
              (v18 & 1) == 0))
        {
          if (v27)
            goto LABEL_18;
        }
        else if (objc_msgSend(v16, "isValidForJournalPersistence"))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v26, "subRelationshipProperties");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sourceObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[PLManagedObjectJournalEntryPayload _applyModelProperties:toPayloadAttributes:andNilAttributes:fromSourceObject:changedKeys:info:](self, "_applyModelProperties:toPayloadAttributes:andNilAttributes:fromSourceObject:changedKeys:info:", v20, v19, 0, v21, 0, v9);

          if (v27)
          {

LABEL_18:
            v23 = 0;
            v22 = v25;
            goto LABEL_19;
          }
          if (objc_msgSend(v19, "count"))
            objc_msgSend(v25, "addObject:", v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v12)
        continue;
      break;
    }
  }

  v22 = v25;
  v23 = v25;
LABEL_19:

  return v23;
}

- (void)_updateNilAttributes:(id)a3 withModelProperties:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__PLManagedObjectJournalEntryPayload__updateNilAttributes_withModelProperties___block_invoke;
  v8[3] = &unk_1E3669FF8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

- (BOOL)_applyModelProperties:(id)a3 toPayloadAttributes:(id)a4 andNilAttributes:(id)a5 fromSourceObject:(id)a6 changedKeys:(id)a7 info:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  PLManagedObjectJournalEntryPayload *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __131__PLManagedObjectJournalEntryPayload__applyModelProperties_toPayloadAttributes_andNilAttributes_fromSourceObject_changedKeys_info___block_invoke;
  v26[3] = &unk_1E365F738;
  v20 = v18;
  v27 = v20;
  v21 = v17;
  v28 = v21;
  v22 = v19;
  v33 = &v34;
  v29 = v22;
  v30 = self;
  v23 = v15;
  v31 = v23;
  v24 = v16;
  v32 = v24;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v26);
  LOBYTE(v15) = *((_BYTE *)v35 + 24);

  _Block_object_dispose(&v34, 8);
  return (char)v15;
}

- (void)_applyPayloadToManagedObject:(id)a3 forModelProperties:(id)a4 payloadAttributesToUpdate:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  PLManagedObjectJournalEntryPayload *v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__PLManagedObjectJournalEntryPayload__applyPayloadToManagedObject_forModelProperties_payloadAttributesToUpdate_info___block_invoke;
  v16[3] = &unk_1E3670238;
  v17 = v12;
  v18 = self;
  v19 = v10;
  v20 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v16);

}

- (BOOL)_decodePayloadAttributesFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 1, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;
    if (v7)
    {
      -[PLManagedObjectJournalEntryPayload migratePayloadAttributes:andNilAttributes:](self, "migratePayloadAttributes:andNilAttributes:", v7, self->_nilAttributes);
      objc_storeStrong((id *)&self->_payloadAttributes, v7);
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (PLJournalEntryPayloadID)payloadID
{
  return self->_payloadID;
}

- (unsigned)payloadVersion
{
  return self->_payloadVersion;
}

- (NSSet)nilProperties
{
  return (NSSet *)self->_nilAttributes;
}

- (id)payloadDataWithError:(id *)a3
{
  if (-[NSMutableDictionary count](self->_payloadAttributes, "count"))
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_payloadAttributes, 200, 0, a3);
  else
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mergePayload:(id)a3
{
  NSMutableDictionary *payloadAttributes;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary addEntriesFromDictionary:](self->_payloadAttributes, "addEntriesFromDictionary:", *((_QWORD *)v6 + 1));
  if (objc_msgSend(*((id *)v6 + 2), "count"))
  {
    payloadAttributes = self->_payloadAttributes;
    objc_msgSend(*((id *)v6 + 2), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](payloadAttributes, "removeObjectsForKeys:", v5);

  }
}

- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3
{
  self->_payloadVersion = objc_msgSend((id)objc_opt_class(), "payloadVersion");
}

- (BOOL)containsAttributeForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = -[NSMutableSet containsObject:](self->_nilAttributes, "containsObject:", v4);

  return v6;
}

- (id)payloadAttributes
{
  NSMutableDictionary *payloadAttributes;
  void *v4;
  void *v5;

  payloadAttributes = self->_payloadAttributes;
  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload _attributesForPayloadAttributes:usingModelProperties:](self, "_attributesForPayloadAttributes:usingModelProperties:", payloadAttributes, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  return 0;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withSourceObject:(id)a5 forPayloadProperty:(id)a6
{
  return 0;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  -[PLManagedObjectJournalEntryPayload _applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:](self, "_applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", a3, a4, a5, a6, self->_payloadAttributes, 0);
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSMutableDictionary *v17;
  id v18;
  id v19;

  v19 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (NSMutableDictionary *)a7;
  v18 = a8;
  if (!v18 && self->_payloadAttributes == v17)
    -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](self, "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:", v19, v14, v15, v16);
  else
    -[PLManagedObjectJournalEntryPayload _applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:](self, "_applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", v19, v14, v15, v16, v17, v18);

}

- (void)_applySubRelationshipPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id obj;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  PLManagedObjectJournalEntryPayload *v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  PLManagedObjectJournalEntryPayload *v55;
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  _QWORD v62[5];
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v42 = a4;
  v41 = a5;
  v45 = a6;
  v40 = a7;
  v46 = a8;
  objc_msgSend(v13, "subRelationshipProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (objc_msgSend(v13, "isToManySubRelationship"))
    {
      objc_msgSend(v13, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v42, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "valueForKey:", v41);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke;
        v71[3] = &unk_1E365F760;
        v38 = v42;
        v72 = v38;
        objc_msgSend(v39, "enumerateObjectsUsingBlock:", v71);
        v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        obj = v16;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v68 != v20)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
              v23 = (void *)MEMORY[0x1E0C97B20];
              objc_msgSend(v13, "subRelationshipEntityName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "insertNewObjectForEntityForName:inManagedObjectContext:", v24, v17);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "subRelationshipProperties");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = MEMORY[0x1E0C809B0];
              v62[1] = 3221225472;
              v62[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2;
              v62[3] = &unk_1E3669F08;
              v62[4] = self;
              v63 = v25;
              v64 = v45;
              v65 = v22;
              v66 = v46;
              v27 = v25;
              objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v62);

              objc_msgSend(v18, "addObject:", v27);
            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
          }
          while (v19);
        }

        objc_msgSend(v38, "setValue:forKey:", v18, v41);
      }
      else
      {

      }
    }
    else
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x2020000000;
      v61 = 0;
      objc_msgSend(v13, "subRelationshipProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3;
      v53[3] = &unk_1E3669770;
      v30 = v46;
      v54 = v30;
      v55 = self;
      v31 = v40;
      v56 = v31;
      v57 = &v58;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v53);

      if (*((_BYTE *)v59 + 24))
      {
        objc_msgSend(v42, "valueForKey:", v41);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          v33 = (void *)MEMORY[0x1E0C97B20];
          objc_msgSend(v13, "subRelationshipEntityName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "managedObjectContext");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "insertNewObjectForEntityForName:inManagedObjectContext:", v34, v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "setValue:forKey:", v32, v41);
        }
        objc_msgSend(v13, "subRelationshipProperties");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v29;
        v47[1] = 3221225472;
        v47[2] = __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4;
        v47[3] = &unk_1E3669F08;
        v48 = v30;
        v49 = self;
        v37 = v32;
        v50 = v37;
        v51 = v45;
        v52 = v31;
        objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v47);

      }
      _Block_object_dispose(&v58, 8);
    }
  }

}

- (void)_applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6 payloadDictionary:(id)a7 info:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if ((objc_msgSend(v24, "requiresConversion") & 1) != 0
    || (objc_msgSend(v24, "key"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "objectForKeyedSubscript:", v19),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    objc_msgSend(v24, "subRelationshipProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && v23)
      -[PLManagedObjectJournalEntryPayload _applySubRelationshipPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:](self, "_applySubRelationshipPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", v24, v14, v15, v16, v17, v18);
  }
  else
  {
    objc_msgSend(v24, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v22, v15);

  }
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  char v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    if ((objc_msgSend(v9, "isOptional") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v10, "defaultValue");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (objc_msgSend(v10, "type") == 500)
  {
    objc_msgSend(v8, "doubleValue");
    v12 = v11;
    objc_msgSend(v7, "doubleValue");
    v14 = vabdd_f64(v12, v13) < 2.22044605e-16;
  }
  else
  {
    if (objc_msgSend(v10, "type") == 900 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v15, "setFormatOptions:", 3955);
      objc_msgSend(v15, "dateFromString:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      v18 = v17;

      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v14 = vabdd_f64(v18, v19) < 0.001;
    }
    else
    {
      if (objc_msgSend(v10, "type") != 1000 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v14 = objc_msgSend(v8, "isEqual:", v7);
        goto LABEL_15;
      }
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      v14 = objc_msgSend(v15, "isEqualToData:", v7);
    }

  }
LABEL_15:

  return v14;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (objc_msgSend(v8, "style") == 1 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "appendName:unsignedIntegerValue:", v10, objc_msgSend(v7, "count"));
    else
      objc_msgSend(v9, "appendName:object:", v10, v7);
  }

}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)encodedDataForUUIDStringSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringArray:](self, "encodedDataForUUIDStringArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)encodedDataForUUIDStringOrderedSet:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringArray:](self, "encodedDataForUUIDStringArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)encodedDataForUUIDStringArray:(id)a3
{
  id v3;
  size_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  const char *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uuid_t uu;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 16 * objc_msgSend(v3, "count");
    v5 = (char *)malloc_type_malloc(v4, 0x1B5ED952uLL);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        v12 = &v5[16 * v9];
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          v14 = (const char *)objc_msgSend(v13, "UTF8String", (_QWORD)v17);
          memset(uu, 0, sizeof(uu));
          uuid_parse(v14, uu);
          *(_OWORD *)v12 = *(_OWORD *)uu;
          v12 += 16;
          ++v11;
        }
        while (v8 != v11);
        v9 += v11;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v8);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v5, v4, 1);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)orderedSetForUUIDEncodedData:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  _BYTE v13[37];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0x10)
  {
    v6 = v4 >> 4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v4 >> 4);
    v7 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v8 = 0;
    v9 = 1;
    do
    {
      memset(v13, 0, sizeof(v13));
      uuid_unparse((const unsigned __int8 *)(v7 + 16 * v8), v13);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v13);
      objc_msgSend(v5, "addObject:", v10);

      v8 = v9;
    }
    while (v6 > v9++);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)setForUUIDEncodedData:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  _BYTE v13[37];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0x10)
  {
    v6 = v4 >> 4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v4 >> 4);
    v7 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v8 = 0;
    v9 = 1;
    do
    {
      memset(v13, 0, sizeof(v13));
      uuid_unparse((const unsigned __int8 *)(v7 + 16 * v8), v13);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v13);
      objc_msgSend(v5, "addObject:", v10);

      v8 = v9;
    }
    while (v6 > v9++);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)UUIDDataForString:(id)a3
{
  uuid_t uu;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  memset(uu, 0, sizeof(uu));
  uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), uu);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", uu, 16);
}

- (id)UUIDStringForData:(id)a3
{
  _BYTE v4[40];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  memset(v4, 0, 37);
  uuid_unparse((const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a3), "bytes", 0, 0, 0, 0, *(_QWORD *)&v4[32], v5), v4);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
}

- (BOOL)payloadVersionIsLessThanVersion:(unsigned int)a3 forKey:(id)a4 inUpdatePayloads:(id)a5
{
  id v9;
  id v10;
  unsigned int v11;
  BOOL v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unsigned int v21;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObjectJournalEntryPayload.m"), 776, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion");
  v12 = 0;
  v21 = v11;
  if (*((_DWORD *)v19 + 6) < a3)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __94__PLManagedObjectJournalEntryPayload_payloadVersionIsLessThanVersion_forKey_inUpdatePayloads___block_invoke;
    v15[3] = &unk_1E365F7B0;
    v16 = v9;
    v17 = &v18;
    objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v15);
    v12 = *((_DWORD *)v19 + 6) < a3;

  }
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (void)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 forPayloadProperty:(id)a5 withUUIDStringData:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(a5, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v11);
  else
    objc_msgSend(v9, "addObject:", v11);

}

- (void)applyPayloadToManagedObject:(id)a3 payloadAttributesToUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload _applyPayloadToManagedObject:forModelProperties:payloadAttributesToUpdate:info:](self, "_applyPayloadToManagedObject:forModelProperties:payloadAttributesToUpdate:info:", v7, v8, v6, 0);

}

- (void)applyPayloadToManagedObject:(id)a3 payloadAttributesToUpdate:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload _applyPayloadToManagedObject:forModelProperties:payloadAttributesToUpdate:info:](self, "_applyPayloadToManagedObject:forModelProperties:payloadAttributesToUpdate:info:", v10, v11, v9, v8);

}

- (id)_attributesForPayloadAttributes:(id)a3 usingModelProperties:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PLManagedObjectJournalEntryPayload__attributesForPayloadAttributes_usingModelProperties___block_invoke;
  v15[3] = &unk_1E36708B0;
  v15[4] = self;
  v16 = v6;
  v10 = v9;
  v17 = v10;
  v11 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

- (NSString)description
{
  PLDescriptionBuilder *v3;
  void *v4;

  v3 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 1, 0);
  -[PLManagedObjectJournalEntryPayload descriptionWithBuilder:](self, "descriptionWithBuilder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  PLDescriptionBuilder *v3;
  void *v4;

  v3 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 3, 0);
  -[PLManagedObjectJournalEntryPayload descriptionWithBuilder:](self, "descriptionWithBuilder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)descriptionForEntry:(id)a3
{
  id v4;
  PLDescriptionBuilder *v5;
  void *v6;

  v4 = a3;
  v5 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 1, 0);
  -[PLManagedObjectJournalEntryPayload descriptionForEntry:withBuilder:](self, "descriptionForEntry:withBuilder:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)prettyDescriptionForEntry:(id)a3 indent:(int64_t)a4
{
  id v6;
  PLDescriptionBuilder *v7;
  void *v8;

  v6 = a3;
  v7 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 3, a4);
  -[PLManagedObjectJournalEntryPayload descriptionForEntry:withBuilder:](self, "descriptionForEntry:withBuilder:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionWithBuilder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PLDescriptionBuilder *v7;
  uint64_t v8;
  PLDescriptionBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendName:object:", CFSTR("payloadID"), v5);

  objc_msgSend(v4, "appendName:integerValue:", CFSTR("version"), -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion"));
  if (-[NSMutableSet count](self->_nilAttributes, "count"))
    -[PLManagedObjectJournalEntryPayload addNilAttributesToBuilder:](self, "addNilAttributesToBuilder:", v4);
  if (-[NSMutableDictionary count](self->_payloadAttributes, "count"))
  {
    v6 = objc_msgSend(v4, "style");
    v7 = [PLDescriptionBuilder alloc];
    v8 = objc_msgSend(v4, "style");
    if (v6 == 1)
    {
      v9 = -[PLDescriptionBuilder initWithObject:style:indent:](v7, "initWithObject:style:indent:", self, v8, 0);
      -[PLManagedObjectJournalEntryPayload addAttributesDescriptionToBuilder:](self, "addAttributesDescriptionToBuilder:", v9);
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[PLDescriptionBuilder build](v9, "build");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@]"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendName:object:", CFSTR("attributes"), v12);

    }
    else
    {
      v9 = -[PLDescriptionBuilder initWithObject:style:indent:](v7, "initWithObject:style:indent:", self, v8, objc_msgSend(v4, "indent") + 1);
      -[PLManagedObjectJournalEntryPayload addAttributesDescriptionToBuilder:](self, "addAttributesDescriptionToBuilder:", v9);
      if (objc_msgSend(v4, "style") == 2)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[PLDescriptionBuilder build](v9, "build");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("\n%@"), v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[PLDescriptionBuilder build](v9, "build");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "appendName:object:", CFSTR("attributes"), v11);
    }

  }
  objc_msgSend(v4, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)descriptionForEntry:(id)a3 withBuilder:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  int v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion");
  v9 = objc_msgSend(v7, "payloadVersion");

  if (v8 != v9)
    objc_msgSend(v6, "appendName:integerValue:", CFSTR("version"), -[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion"));
  if (-[NSMutableSet count](self->_nilAttributes, "count"))
    -[PLManagedObjectJournalEntryPayload addNilAttributesToBuilder:](self, "addNilAttributesToBuilder:", v6);
  if (-[NSMutableDictionary count](self->_payloadAttributes, "count"))
    -[PLManagedObjectJournalEntryPayload addAttributesDescriptionToBuilder:](self, "addAttributesDescriptionToBuilder:", v6);
  objc_msgSend(v6, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)addNilAttributesToBuilder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "style") == 1)
  {
    -[NSMutableSet allObjects](self->_nilAttributes, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v6, "appendString:", CFSTR("["));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v6, "appendString:", v12, (_QWORD)v14);
          objc_msgSend(v7, "lastObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 != v13)
            objc_msgSend(v6, "appendString:", CFSTR(", "));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "appendString:", CFSTR("]"));
    objc_msgSend(v4, "appendName:object:", CFSTR("nilAttributes"), v6);

  }
  else
  {
    objc_msgSend(v4, "appendName:object:", CFSTR("nilAttributes"), self->_nilAttributes);
  }

}

- (void)addAttributesDescriptionToBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary allKeys](self->_payloadAttributes, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", v12, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](self, "appendAttributeKey:value:toDescriptionBuilder:", v12, v13, v4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BOOL)comparePayloadToObjectDictionary:(id)a3 usingModelProperties:(id)a4 errorDescriptions:(id)a5
{
  return -[PLManagedObjectJournalEntryPayload _comparePayloadAttributes:toObjectDictionary:currentKeyPath:usingModelProperties:errorDescriptions:](self, "_comparePayloadAttributes:toObjectDictionary:currentKeyPath:usingModelProperties:errorDescriptions:", self->_payloadAttributes, a3, &stru_1E36789C0, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadID, 0);
  objc_storeStrong((id *)&self->_nilAttributes, 0);
  objc_storeStrong((id *)&self->_payloadAttributes, 0);
}

void __91__PLManagedObjectJournalEntryPayload__attributesForPayloadAttributes_usingModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "subRelationshipProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((objc_msgSend(v4, "isUUIDKey") & 1) != 0)
      goto LABEL_15;
    objc_msgSend(*(id *)(a1 + 32), "payloadValueFromAttributes:forPayloadProperty:", *(_QWORD *)(a1 + 40), v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(a1 + 48);
    objc_msgSend(v4, "key");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

LABEL_14:
    goto LABEL_15;
  }
  if ((objc_msgSend(v4, "isToManySubRelationship") & 1) == 0)
  {
    v24 = *(void **)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "subRelationshipProperties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_attributesForPayloadAttributes:usingModelProperties:", v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v21);
    goto LABEL_14;
  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v4, "subRelationshipProperties", (_QWORD)v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_attributesForPayloadAttributes:usingModelProperties:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  v19 = *(void **)(a1 + 48);
  objc_msgSend(v4, "key");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v9, v20);

LABEL_15:
}

void __94__PLManagedObjectJournalEntryPayload_payloadVersionIsLessThanVersion_forKey_inUpdatePayloads___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "containsAttributeForKey:", *(_QWORD *)(a1 + 32)))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "payloadVersion");
    *a4 = 1;
  }

}

void __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v3);

}

uint64_t __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", a3, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = (void *)a1[4];
  if (!v8 || objc_msgSend(v8, "shouldApplyWithPayloadProperty:andPayload:", v7, a1[5]))
  {
    v9 = (void *)a1[6];
    objc_msgSend(v7, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __144__PLManagedObjectJournalEntryPayload__applySubRelationshipPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_payloadDictionary_info___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    v7 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "shouldApplyWithPayloadProperty:andPayload:", v5, *(_QWORD *)(a1 + 40)))
  {
    v7 = *(_QWORD *)(a1 + 32);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", v5, *(_QWORD *)(a1 + 48), v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v7);
  }

}

void __117__PLManagedObjectJournalEntryPayload__applyPayloadToManagedObject_forModelProperties_payloadAttributesToUpdate_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v6 || objc_msgSend(v6, "shouldApplyWithPayloadProperty:andPayload:", v5, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v5, "subRelationshipProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "valueForKey:", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = objc_msgSend(v5, "isToManySubRelationship");
        v10 = *(_QWORD **)(a1 + 40);
        if ((v9 & 1) == 0)
        {
          objc_msgSend(v5, "subRelationshipProperties");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_applyPayloadToManagedObject:forModelProperties:payloadAttributesToUpdate:info:", v8, v18, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));

          goto LABEL_13;
        }
        v11 = *(_QWORD *)(a1 + 48);
        v12 = *(_QWORD *)(a1 + 56);
        v13 = v10[1];
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD **)(a1 + 40);
      }
      else
      {
        objc_msgSend(v5, "key");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
LABEL_13:

          goto LABEL_14;
        }
        v11 = *(_QWORD *)(a1 + 48);
        v12 = *(_QWORD *)(a1 + 56);
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD **)(a1 + 40);
        v13 = v15[1];
      }
      objc_msgSend(v15, "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", v5, v11, v19, v12, v13, v14);
      goto LABEL_13;
    }
    objc_msgSend(v5, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(*(id *)(a1 + 40), "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", v5, *(_QWORD *)(a1 + 48), v19, *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(a1 + 32));
  }
LABEL_14:

}

void __131__PLManagedObjectJournalEntryPayload__applyModelProperties_toPayloadAttributes_andNilAttributes_fromSourceObject_changedKeys_info___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  id v52;
  id v53;

  v53 = a2;
  v7 = a3;
  v8 = v7;
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v7, "subRelationshipProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v53);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 48);
      if (v15
        && (objc_msgSend(v15, "validForPersistenceWithPayloadProperty:andValue:stop:", v8, v14, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) & 1) == 0)
      {
LABEL_30:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
          *a4 = 1;
        goto LABEL_55;
      }
      if (!v14)
        goto LABEL_55;
      if ((objc_msgSend(v8, "isToManySubRelationship") & 1) != 0)
      {
        objc_msgSend(v8, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "allObjects");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global);
              v18 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_42;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "array");
              v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
              if (!v18)
                goto LABEL_55;
              goto LABEL_46;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = v14;
LABEL_46:
              objc_msgSend(*(id *)(a1 + 56), "_payloadAttributesListForSubRelationshipProperty:withManagedObjects:info:", v8, v18, *(_QWORD *)(a1 + 48));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v44;
              if (v44)
              {
                if (objc_msgSend(v44, "count"))
                {
                  v46 = *(void **)(a1 + 64);
                  objc_msgSend(v8, "key");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, v47);

                }
              }
              else
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
                *a4 = 1;
              }

              goto LABEL_54;
            }
          }
LABEL_55:

          goto LABEL_56;
        }
        v49 = (void *)MEMORY[0x1E0C99DA0];
        v50 = (void *)MEMORY[0x1E0CB3940];
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringWithFormat:", CFSTR("Payload property has sub relationship properties, but relationship isn't to-one or to-many: %@, %@, %@"), v41, v8, v14);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v49;
LABEL_58:
        objc_msgSend(v43, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v42, 0);
        v52 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v52);
      }
LABEL_29:
      v27 = *(void **)(a1 + 56);
      objc_msgSend(v8, "subRelationshipProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v27, "_applyModelProperties:toPayloadAttributes:andNilAttributes:fromSourceObject:changedKeys:info:", v28, *(_QWORD *)(a1 + 64), 0, v14, 0, *(_QWORD *)(a1 + 48));

      goto LABEL_30;
    }
  }
  objc_msgSend(v8, "key");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = *(void **)(a1 + 32);
    if (v11)
    {
      v12 = objc_msgSend(v11, "containsObject:", v53);

      if ((v12 & 1) == 0)
        goto LABEL_56;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v53);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 48);
    if (v19
      && (objc_msgSend(v19, "validForPersistenceWithPayloadProperty:andValue:stop:", v8, v14, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) & 1) == 0)
    {
      goto LABEL_30;
    }
    if (v14)
    {
      if ((objc_msgSend(v8, "requiresConversion") & 1) != 0)
      {
        objc_msgSend(v8, "subRelationshipProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v33 = *(void **)(a1 + 56);
          v34 = *(_QWORD *)(a1 + 64);
          v35 = *(_QWORD *)(a1 + 72);
          v36 = *(_QWORD *)(a1 + 40);
          if ((isKindOfClass & 1) != 0)
          {
            if ((objc_msgSend(v33, "updatePayloadAttributes:andNilAttributes:withManagedObject:forPayloadProperty:", v34, v35, v36, v8) & 1) != 0)goto LABEL_55;
          }
          else if ((objc_msgSend(v33, "updatePayloadAttributes:andNilAttributes:withSourceObject:forPayloadProperty:", v34, v35, v36, v8) & 1) != 0)
          {
            goto LABEL_55;
          }
          v38 = (void *)MEMORY[0x1E0C99DA0];
          v39 = (void *)MEMORY[0x1E0CB3940];
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("Payload property not supported by payload class: %@, %@"), v41, v8);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v38;
          goto LABEL_58;
        }
        if (!objc_msgSend(v8, "isToManySubRelationship"))
          goto LABEL_29;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_55;
        objc_msgSend(*(id *)(a1 + 56), "_payloadAttributesListForSubRelationshipProperty:withManagedObjects:info:", v8, v14, *(_QWORD *)(a1 + 48));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v21;
        if (v21)
        {
          if (objc_msgSend(v21, "count"))
          {
            v22 = *(void **)(a1 + 64);
            objc_msgSend(v8, "key");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, v23);
          }
          else
          {
            v48 = *(void **)(a1 + 72);
            objc_msgSend(v8, "key");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addObject:", v23);
          }

        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
          *a4 = 1;
        }
LABEL_54:

        goto LABEL_55;
      }
      v29 = (void *)objc_msgSend(v14, "copy");
      v30 = *(void **)(a1 + 64);
      objc_msgSend(v8, "key");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

    }
    else
    {
      if (!*(_QWORD *)(a1 + 32))
        goto LABEL_55;
      objc_msgSend(v8, "subRelationshipProperties");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = *(void **)(a1 + 56);
        v26 = *(_QWORD *)(a1 + 72);
        objc_msgSend(v8, "subRelationshipProperties");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_updateNilAttributes:withModelProperties:", v26, v18);
        goto LABEL_54;
      }
      v37 = *(void **)(a1 + 72);
      objc_msgSend(v8, "key");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v29);
    }

    goto LABEL_55;
  }
LABEL_56:

}

uint64_t __131__PLManagedObjectJournalEntryPayload__applyModelProperties_toPayloadAttributes_andNilAttributes_fromSourceObject_changedKeys_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URIRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URIRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

void __79__PLManagedObjectJournalEntryPayload__updateNilAttributes_withModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "subRelationshipProperties");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v12, "isToManySubRelationship");

    if ((v6 & 1) == 0)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v12, "subRelationshipProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_updateNilAttributes:withModelProperties:", v11, v9);
      goto LABEL_6;
    }
  }
  objc_msgSend(v12, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v12, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);
LABEL_6:

  }
}

+ (void)validatePayloadPropertiesForManagedObjectModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "entitiesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nonPersistedModelPropertiesDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_validateModelProperties:nonPersistedModelProperties:forEntityDescription:", v7, v8, v9);

}

+ (void)populateValidationPropertiesFromManagedObjectModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "entitiesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_populateValidationProperties:fromEntityDescription:", v6, v7);

}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  return 1;
}

+ (id)additionalEntityNames
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1, "modelProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_populateAddtionalEntityNames:fromModelProperties:", v3, v4);

  return v3;
}

+ (id)modelProperties
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)persistedPropertyNamesForEntityNames
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (unsigned)payloadVersion
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)shouldPersistForChangedKeys:(id)a3 entityName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "persistedPropertyNamesForEntityNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v6, "intersectsSet:", v9);
  else
    v10 = 0;

  return v10;
}

+ (id)snapshotSortDescriptors
{
  return 0;
}

+ (id)relationshipKeyPathsForPrefetching
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "modelProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "relationshipKeyPathsForPrefetchingWithModelProperties:outUUIDPropertyName:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  return a3;
}

+ (id)fetchPredicateInContext:(id)a3
{
  return 0;
}

+ (id)payloadWithData:(id)a3 forPayloadID:(id)a4 version:(unsigned int)a5 andNilProperties:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a6;
  v14 = a4;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPayloadID:payloadVersion:nilAttributes:", v14, v9, v13);

  if (v12 && !objc_msgSend(v15, "_decodePayloadAttributesFromData:error:", v12, a7))
    v16 = 0;
  else
    v16 = v15;

  return v16;
}

+ (id)payloadClassID
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)modelPropertiesDescription
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)nonPersistedModelPropertiesDescription
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (void)loadModelPropertiesDescription:(id)a3 parentPayloadProperty:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PLManagedObjectJournalEntryPayload_loadModelPropertiesDescription_parentPayloadProperty___block_invoke;
  v8[3] = &unk_1E365F788;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

+ (id)persistedPropertyNamesForEntityNamesFromModelProperties
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "modelProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v8);

  objc_msgSend(a1, "_populatePersistedPropertyNamesForAdditionalEntityNames:fromModelProperties:", v3, v4);
  return v3;
}

+ (void)_populatePersistedPropertyNamesForAdditionalEntityNames:(id)a3 fromModelProperties:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __114__PLManagedObjectJournalEntryPayload__populatePersistedPropertyNamesForAdditionalEntityNames_fromModelProperties___block_invoke;
  v8[3] = &unk_1E365F788;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

+ (void)_populateAddtionalEntityNames:(id)a3 fromModelProperties:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__PLManagedObjectJournalEntryPayload__populateAddtionalEntityNames_fromModelProperties___block_invoke;
  v8[3] = &unk_1E365F788;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

+ (id)sortedObjectsToAddWithUUIDs:(id)a3 uuidKey:(id)a4 andExistingObjects:(id)a5 fetchBlock:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  objc_msgSend(a5, "valueForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") && (objc_msgSend(v9, "isEqual:", v12) & 1) == 0)
  {
    v11[2](v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __104__PLManagedObjectJournalEntryPayload_sortedObjectsToAddWithUUIDs_uuidKey_andExistingObjects_fetchBlock___block_invoke;
    v16[3] = &unk_1E36636E8;
    v17 = v9;
    v18 = v10;
    objc_msgSend(v14, "sortedArrayUsingComparator:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_populateRelationshipKeyPathsForPrefetching:(id)a3 currentKeyPath:(id)a4 usingModelProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__137;
  v24 = __Block_byref_object_dispose__138;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __118__PLManagedObjectJournalEntryPayload__populateRelationshipKeyPathsForPrefetching_currentKeyPath_usingModelProperties___block_invoke;
  v15[3] = &unk_1E365F7D8;
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v18 = &v20;
  v19 = a1;
  v17 = v12;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)relationshipKeyPathsForPrefetchingWithModelProperties:(id)a3 outUUIDPropertyName:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(a1, "_populateRelationshipKeyPathsForPrefetching:currentKeyPath:usingModelProperties:", v8, &stru_1E36789C0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

+ (id)fetchRelationshipPropertyValuesForRelationshipName:(id)a3 fromManagedObject:(id)a4 usingPayloadProperty:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  NSObject *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  NSObject *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  void *v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relationshipsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "inverseRelationship");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    v44 = a1;
    v45 = v10;
    v47 = v11;
    objc_msgSend(v10, "relatedEntityPropertyNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(v15, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchRequestWithEntityName:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setResultType:", 2);
    LODWORD(v18) = objc_msgSend(v15, "isToMany");
    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v15, "name");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if ((_DWORD)v18)
      v25 = CFSTR("%K CONTAINS %@");
    else
      v25 = CFSTR("%K = %@");
    objc_msgSend(v22, "predicateWithFormat:", v25, v23, v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPredicate:", v26);

    objc_msgSend(v21, "setAllocationType:", 1);
    v59[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPropertiesToFetch:", v27);

    if (objc_msgSend(v13, "isOrdered"))
    {
      v28 = (void *)MEMORY[0x1E0CB3928];
      objc_msgSend(v15, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sortDescriptorWithKey:ascending:", v29, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSortDescriptors:", v31);

    }
    objc_msgSend(v9, "managedObjectContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v32, "executeFetchRequest:error:", v21, &v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v51;

    v46 = v34;
    if (v33)
    {
      v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __128__PLManagedObjectJournalEntryPayload_fetchRelationshipPropertyValuesForRelationshipName_fromManagedObject_usingPayloadProperty___block_invoke;
      v48[3] = &unk_1E366A7C0;
      v49 = v17;
      v36 = v35;
      v50 = v36;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v48);
      v37 = v8;
      v38 = v50;
      v39 = v36;

      v8 = v37;
      v40 = v39;
    }
    else
    {
      PLMigrationGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v44, "payloadClassID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v53 = v17;
        v54 = 2112;
        v55 = v42;
        v56 = 2112;
        v57 = v34;
        _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "JournalManager: failed to fetch relationship properties for relationship %@ on %@, error: %@", buf, 0x20u);

      }
      v40 = 0;
    }
    v10 = v45;

    v11 = v47;
  }
  else
  {
    PLMigrationGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "payloadClassID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v8;
      v54 = 2114;
      v55 = v41;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "JournalManager: relationship %{public}@ on %{public}@ does not define an inverse relationship", buf, 0x16u);

    }
    v40 = 0;
  }

  return v40;
}

+ (id)objectDictionariesByUUIDForPayloadClass:(Class)a3 inManagedObjectContext:(id)a4 fetchPredicate:(id)a5 info:(id)a6 error:(id *)a7
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  Class v43;
  _QWORD v44[4];
  id v45;
  Class v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C99E08];
  v12 = a5;
  v13 = a4;
  v14 = objc_alloc_init(v11);
  -[objc_class modelProperties](a3, "modelProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  +[PLManagedObjectJournalEntryPayload relationshipKeyPathsForPrefetchingWithModelProperties:outUUIDPropertyName:](PLManagedObjectJournalEntryPayload, "relationshipKeyPathsForPrefetchingWithModelProperties:outUUIDPropertyName:", v15, &v48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v48;

  v18 = objc_alloc(MEMORY[0x1E0C97B48]);
  -[objc_class entityName](a3, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithEntityName:", v19);

  objc_msgSend(v20, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v20, "setRelationshipKeyPathsForPrefetching:", v16);
  objc_msgSend(v20, "setShouldRefreshRefetchedObjects:", 1);
  objc_msgSend(v20, "setPredicate:", v12);

  v47 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v20, &v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v47;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = v22;
  if (v21)
  {
    v24 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke;
    v44[3] = &unk_1E365F800;
    v25 = v16;
    v26 = v22;
    v45 = v26;
    v46 = a3;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v44);

    v38[0] = v24;
    v38[1] = 3221225472;
    v38[2] = __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke_112;
    v38[3] = &unk_1E365F828;
    v42 = a1;
    v43 = a3;
    v39 = v10;
    v40 = v17;
    v27 = v14;
    v41 = v27;
    v28 = v26;
    v16 = v25;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v38);
    v29 = v27;

  }
  else
  {
    v30 = v10;
    PLMigrationGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      -[objc_class payloadClassID](a3, "payloadClassID");
      v32 = v16;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v33;
      v51 = 2112;
      v52 = v37;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Fetch failed for payload class %{public}@, error: %@", buf, 0x16u);

      v16 = v32;
    }

    v29 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v37);
    v10 = v30;
  }

  return v29;
}

void __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "payloadAdapterForManagedObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __127__PLManagedObjectJournalEntryPayload_objectDictionariesByUUIDForPayloadClass_inManagedObjectContext_fetchPredicate_info_error___block_invoke_112(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isValidForJournalPersistence"))
  {
    objc_msgSend(v3, "sourceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "modelProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "_populateObjectDictionary:withObject:currentKeyPath:usingModelProperties:payloadClass:info:", v5, v4, &stru_1E36789C0, v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));

    if ((v6 & 1) != 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "stringValue");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_9:
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          PLMigrationGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 64), "payloadClassID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = 138543618;
            v16 = v14;
            v17 = 2114;
            v18 = v9;
            _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Duplicate object dictionary found for payload class %{public}@ with UUID %{public}@", (uint8_t *)&v15, 0x16u);

          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v9);
        }

        goto LABEL_15;
      }
      objc_msgSend(v9, "description");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;

    v9 = v11;
    goto LABEL_9;
  }
LABEL_17:

}

void __128__PLManagedObjectJournalEntryPayload_fetchRelationshipPropertyValuesForRelationshipName_fromManagedObject_usingPayloadProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __118__PLManagedObjectJournalEntryPayload__populateRelationshipKeyPathsForPrefetching_currentKeyPath_usingModelProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  objc_msgSend(v5, "subRelationshipProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v11 = *(void **)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "subRelationshipProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v11, "_populateRelationshipKeyPathsForPrefetching:currentKeyPath:usingModelProperties:", v12, v8, v13);

LABEL_8:
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isUUIDKey"))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = v21;
    v8 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
    goto LABEL_8;
  }
  objc_msgSend(v5, "relatedEntityPropertyNames");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = objc_msgSend(v5, "shouldPrefetchRelationship");

    if (v19)
    {
      v20 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v8);
      goto LABEL_8;
    }
  }
LABEL_9:

}

uint64_t __104__PLManagedObjectJournalEntryPayload_sortedObjectsToAddWithUUIDs_uuidKey_andExistingObjects_fetchBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(a2, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v7, "valueForKey:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "indexOfObject:", v11);
  if (v9 < v12)
    return -1;
  else
    return v9 > v12;
}

void __88__PLManagedObjectJournalEntryPayload__populateAddtionalEntityNames_fromModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "subRelationshipProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v14, "subRelationshipEntityName");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v14, "isAdditionalEntityName");

      if (v7)
      {
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v14, "subRelationshipEntityName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

      }
    }
    v12 = a1 + 32;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v12 + 8);
    objc_msgSend(v14, "subRelationshipProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_populateAddtionalEntityNames:fromModelProperties:", v10, v13);

  }
}

void __114__PLManagedObjectJournalEntryPayload__populatePersistedPropertyNamesForAdditionalEntityNames_fromModelProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "subRelationshipProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v16, "subRelationshipEntityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v16, "subRelationshipProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v16, "subRelationshipEntityName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    }
    v14 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v14 + 8);
    objc_msgSend(v16, "subRelationshipProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_populatePersistedPropertyNamesForAdditionalEntityNames:fromModelProperties:", v12, v15);

  }
}

void __91__PLManagedObjectJournalEntryPayload_loadModelPropertiesDescription_parentPayloadProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setParentProperty:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "subRelationshipProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v7, "subRelationshipProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadModelPropertiesDescription:parentPayloadProperty:", v6, v7);

  }
}

- (BOOL)_comparePayloadAttributes:(id)a3 toObjectDictionary:(id)a4 currentKeyPath:(id)a5 usingModelProperties:(id)a6 errorDescriptions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  PLManagedObjectJournalEntryPayload *v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke;
  v22[3] = &unk_1E365F918;
  v17 = v14;
  v23 = v17;
  v24 = self;
  v18 = v12;
  v25 = v18;
  v19 = v13;
  v26 = v19;
  v20 = v16;
  v27 = v20;
  v28 = &v29;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v22);
  LOBYTE(v12) = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return (char)v12;
}

- (void)_resolveRelationshipsInObjectDictionary:(id)a3 atKeyPath:(id)a4 forPayloadProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "subRelationshipProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke;
  v29[3] = &unk_1E36708B0;
  v12 = v8;
  v30 = v12;
  v13 = v7;
  v31 = v13;
  v14 = v10;
  v32 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v29);

  if (objc_msgSend(v14, "count"))
  {
    v22 = v13;
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v9, "subRelationshipProperties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_3;
          v23[3] = &unk_1E3669FF8;
          v23[4] = v20;
          v24 = v14;
          objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v23);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v17);
    }

    v13 = v22;
  }

}

void __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "relatedEntityPropertyNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v6, "subRelationshipProperties");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_30;
    v13 = (void *)v12;
    v14 = objc_msgSend(v6, "isToManySubRelationship");

    if ((v14 & 1) != 0)
      goto LABEL_30;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "relatedEntityPropertyNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v6;
  if (v9)
  {
    objc_msgSend(v6, "relatedEntityPropertyNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v11);

  }
  else
  {
    objc_msgSend(v6, "subRelationshipProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_2;
    v52[3] = &unk_1E365F940;
    v53 = v8;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v52);

    v10 = v53;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.pk"), *(_QWORD *)(a1 + 32), v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v8;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v41)
  {
    v17 = *(_QWORD *)v49;
    v18 = 0x1E0C99000uLL;
    v38 = a1;
    v39 = v5;
    v36 = *(_QWORD *)v49;
    v37 = v16;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(obj);
        v42 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), *(_QWORD *)(a1 + 32), v5, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc_init(*(Class *)(v18 + 3592));
        if (v20)
          v22 = v16 == 0;
        else
          v22 = 1;
        if (!v22)
        {
          objc_msgSend(v16, "objectEnumerator");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v24 = v20;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v45;
LABEL_20:
            v28 = 0;
            while (1)
            {
              if (*(_QWORD *)v45 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v28);
              objc_msgSend(v23, "nextObject");
              v30 = objc_claimAutoreleasedReturnValue();
              if (!v30)
                break;
              v31 = (void *)v30;
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v30);

              if (v26 == ++v28)
              {
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
                if (v26)
                  goto LABEL_20;
                break;
              }
            }
          }

          a1 = v38;
          v5 = v39;
          v32 = *(void **)(v38 + 48);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v39, v42);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v33);

          v17 = v36;
          v16 = v37;
          v18 = 0x1E0C99000;
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v41);
  }

  v6 = v35;
LABEL_30:

}

void __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v5 = a3;
  objc_msgSend(v5, "relatedEntityPropertyNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v5, "subRelationshipProperties");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_19;
    v15 = (void *)v14;
    v16 = objc_msgSend(v5, "isToManySubRelationship");

    if ((v16 & 1) != 0)
      goto LABEL_19;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v27, "stringByAppendingString:", CFSTR("PrimaryKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v9;
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "relatedEntityPropertyNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "relatedEntityPropertyNames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v13);

    }
    else
    {
      objc_msgSend(v5, "subRelationshipProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_4;
      v32[3] = &unk_1E365F940;
      v33 = v10;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v32);

      v12 = v33;
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v27, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v26);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v25, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v20);
    }

  }
LABEL_19:

}

uint64_t __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __148__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___resolveRelationshipsInObjectDictionary_atKeyPath_forPayloadProperty___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  __CFString *v55;
  char v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  BOOL v93;
  _QWORD v94[4];
  id v95;
  uint64_t v96;
  _QWORD v97[8];
  _QWORD v98[8];
  _BYTE v99[128];
  _QWORD v100[8];
  _QWORD v101[10];

  v101[8] = *MEMORY[0x1E0C80C00];
  v76 = a2;
  v69 = a3;
  objc_msgSend(v69, "subRelationshipProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "payloadValueFromAttributes:forPayloadProperty:", *(_QWORD *)(a1 + 48), v69);
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), v76);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v23 = 0;
      goto LABEL_63;
    }
    if (objc_msgSend(v69, "isUUIDKey"))
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v68);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@"), v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "payloadIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = -[__CFString isEqualToString:](v23, "isEqualToString:", v24);

      if ((v21 & 1) != 0)
        goto LABEL_63;
      goto LABEL_55;
    }
    objc_msgSend(v69, "relatedEntityPropertyNames");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v31;
    v32 = v31;
    if (v31)
    {
      if (objc_msgSend(v31, "count") == 1)
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        v34 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v32, "anyObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@%@.%@"), v34, v76, v35);
        v36 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v36);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v36;
      }
      else
      {
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v43 = v32;
        v75 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
        if (v75)
        {
          v44 = 0;
          v71 = *(_QWORD *)v79;
          v73 = 0;
          do
          {
            for (i = 0; i != v75; ++i)
            {
              if (*(_QWORD *)v79 != v71)
                objc_enumerationMutation(v43);
              v46 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), *(_QWORD *)(a1 + 32), v76, v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (!v44)
                  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v48, "count"));
                if (objc_msgSend(v48, "count"))
                {
                  v49 = 0;
                  do
                  {
                    if (v49 >= objc_msgSend(v44, "count")
                      || (objc_msgSend(v44, "objectAtIndex:", v49),
                          (v50 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
                    {
                      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v43, "count"));
                      objc_msgSend(v44, "addObject:", v50);
                    }
                    objc_msgSend(v48, "objectAtIndex:", v49);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, v46);

                    ++v49;
                  }
                  while (v49 < objc_msgSend(v48, "count"));
                }
              }
              else
              {
                v52 = v73;
                if (!v73)
                  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v43, "count"));
                v73 = v52;
                objc_msgSend(v52, "setObject:forKeyedSubscript:", v48, v46);
              }

            }
            v75 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
          }
          while (v75);
        }
        else
        {
          v44 = 0;
          v73 = 0;
        }

        if (v44)
          v53 = v44;
        else
          v53 = v73;
        v23 = v53;

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v68);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (v23)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_54;
      v54 = -[__CFString count](v23, "count") == 0;
    }
    else
    {
      v54 = 1;
    }
    if (v54 && !v67)
    {
      v55 = 0;
LABEL_62:

      v67 = v55;
      goto LABEL_63;
    }
LABEL_54:
    v56 = objc_msgSend(*(id *)(a1 + 40), "comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:", v67, v23, v69);

    if ((v56 & 1) == 0)
    {
LABEL_55:
      v57 = v23;
      if (v23)
        v58 = v23;
      else
        v58 = CFSTR("<nil>");
      v23 = v58;

      if (v67)
        v59 = v67;
      else
        v59 = CFSTR("<nil>");
      v55 = v59;

      v97[0] = CFSTR("payloadClassID");
      objc_msgSend((id)objc_opt_class(), "payloadClassID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      v98[0] = v60;
      v98[1] = v61;
      v97[1] = CFSTR("payloadID");
      v97[2] = CFSTR("type");
      v98[2] = CFSTR("value");
      v98[3] = v68;
      v97[3] = CFSTR("objectDictionaryKeyPath");
      v97[4] = CFSTR("payloadKey");
      objc_msgSend(v69, "key");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v98[4] = v62;
      v97[5] = CFSTR("objectDictionaryValue");
      v97[6] = CFSTR("payloadValue");
      v98[5] = v23;
      v98[6] = v55;
      v97[7] = CFSTR("description");
      v63 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v69, "key");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", CFSTR("values not equal: %@: %@, %@: %@"), v68, v23, v64, v55);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v98[7] = v65;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 8);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 64), "addObject:", v66);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      goto LABEL_62;
    }
LABEL_63:

    goto LABEL_64;
  }
  v5 = objc_msgSend(v69, "isToManySubRelationship");
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", v76);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_resolveRelationshipsInObjectDictionary:atKeyPath:forPayloadProperty:", *(_QWORD *)(a1 + 56), v6, v69);
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_2;
    v94[3] = &unk_1E365F8A0;
    v10 = v69;
    v11 = *(_QWORD *)(a1 + 40);
    v95 = v10;
    v96 = v11;
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", v94);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 48);
    objc_msgSend(v10, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v16 = objc_msgSend(v12, "count");
    v93 = v16 == objc_msgSend(v15, "count");
    if (*((_BYTE *)v91 + 24))
    {
      v82[0] = v9;
      v82[1] = 3221225472;
      v82[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_3;
      v82[3] = &unk_1E365F8F0;
      v83 = *(id *)(a1 + 56);
      v84 = v7;
      v17 = v15;
      v18 = *(_QWORD *)(a1 + 40);
      v85 = v17;
      v86 = v18;
      v87 = v10;
      v88 = *(id *)(a1 + 64);
      v89 = &v90;
      objc_msgSend(v12, "enumerateIndexesUsingBlock:", v82);

      v19 = v83;
    }
    else
    {
      v100[0] = CFSTR("payloadClassID");
      objc_msgSend((id)objc_opt_class(), "payloadClassID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v74;
      v100[1] = CFSTR("payloadID");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "payloadIDString");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v101[1] = v72;
      v101[2] = CFSTR("to-many count");
      v100[2] = CFSTR("type");
      v100[3] = CFSTR("objectDictionaryKeyPath");
      v101[3] = v7;
      v100[4] = CFSTR("payloadKey");
      objc_msgSend(v10, "key");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v101[4] = v70;
      v100[5] = CFSTR("objectDictionaryCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v101[5] = v37;
      v100[6] = CFSTR("payloadAttributeListCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v101[6] = v38;
      v100[7] = CFSTR("description");
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = objc_msgSend(v12, "count");
      objc_msgSend(v10, "key");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("differing number of entries: %@: %ld, %@: %ld"), v7, v40, v41, objc_msgSend(v15, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v101[7] = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 64), "addObject:", v19);
    }

    if (!*((_BYTE *)v91 + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    _Block_object_dispose(&v90, 8);

  }
  else
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("."));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *(void **)(a1 + 40);
    v27 = *(_QWORD *)(a1 + 48);
    v28 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v69, "subRelationshipProperties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v26, "_comparePayloadAttributes:toObjectDictionary:currentKeyPath:usingModelProperties:errorDescriptions:", v27, v28, v25, v29, *(_QWORD *)(a1 + 64));

    if ((v30 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;

  }
LABEL_64:

}

uint64_t __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "subRelationshipEntityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "subRelationshipEntityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v3, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD v56[8];
  _QWORD v57[8];
  _BYTE v58[128];
  _QWORD v59[8];
  _QWORD v60[8];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_4;
  v53[3] = &unk_1E365F8C8;
  v6 = *(void **)(a1 + 48);
  v53[4] = *(_QWORD *)(a1 + 56);
  v44 = v5;
  v54 = v44;
  v55 = *(id *)(a1 + 64);
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v53);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
      goto LABEL_20;
    objc_msgSend(*(id *)(a1 + 48), "objectsAtIndexes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v46 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          v16 = *(void **)(a1 + 56);
          objc_msgSend(*(id *)(a1 + 64), "subRelationshipProperties");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_attributesForPayloadAttributes:usingModelProperties:", v15, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v12);
    }

    v56[0] = CFSTR("payloadClassID");
    objc_msgSend((id)objc_opt_class(), "payloadClassID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v43;
    v56[1] = CFSTR("payloadID");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "payloadIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v42;
    v57[2] = CFSTR("to-many multiple matches");
    v56[2] = CFSTR("type");
    v56[3] = CFSTR("objectDictionaryKeyPath");
    v57[3] = *(_QWORD *)(a1 + 40);
    v56[4] = CFSTR("payloadKey");
    objc_msgSend(*(id *)(a1 + 64), "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v19;
    v57[5] = v44;
    v56[5] = CFSTR("objectDictionaryValue");
    v56[6] = CFSTR("payloadValue");
    v57[6] = v9;
    v56[7] = CFSTR("description");
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = *(_QWORD *)(a1 + 40);
    v22 = objc_msgSend(v7, "count");
    objc_msgSend(*(id *)(a1 + 64), "key");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ matches %ld payloads: %@: %@"), v21, v44, v22, v23, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57[7] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "addObject:", v25);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v26 = *(id *)(a1 + 48);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v50 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          v32 = *(void **)(a1 + 56);
          objc_msgSend(*(id *)(a1 + 64), "subRelationshipProperties");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "_attributesForPayloadAttributes:usingModelProperties:", v31, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v34);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v28);
    }

    v59[0] = CFSTR("payloadClassID");
    objc_msgSend((id)objc_opt_class(), "payloadClassID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v35;
    v59[1] = CFSTR("payloadID");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "payloadIDString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v36;
    v60[2] = CFSTR("to-many none match");
    v59[2] = CFSTR("type");
    v59[3] = CFSTR("objectDictionaryKeyPath");
    v60[3] = *(_QWORD *)(a1 + 40);
    v59[4] = CFSTR("payloadKey");
    objc_msgSend(*(id *)(a1 + 64), "key");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v37;
    v60[5] = v44;
    v59[5] = CFSTR("objectDictionaryValue");
    v59[6] = CFSTR("payloadValue");
    v60[6] = v10;
    v59[7] = CFSTR("description");
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 64), "key");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@: %@ doesn't match any payload in: %@: %@"), v39, v44, v40, v10);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v60[7] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "addObject:", v9);
  }

LABEL_20:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v7, "count") == 1;

}

uint64_t __178__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___comparePayloadAttributes_toObjectDictionary_currentKeyPath_usingModelProperties_errorDescriptions___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v4, "subRelationshipProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "_comparePayloadAttributes:toObjectDictionary:currentKeyPath:usingModelProperties:errorDescriptions:", v5, v3, &stru_1E36789C0, v6, 0);

  return v7;
}

+ (void)_validateModelProperties:(id)a3 nonPersistedModelProperties:(id)a4 forEntityDescription:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "attributesByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke;
  v22[3] = &unk_1E365F850;
  v13 = v8;
  v23 = v13;
  v14 = v9;
  v24 = v14;
  v25 = a1;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v22);

  objc_msgSend(v10, "relationshipsByName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke_2;
  v18[3] = &unk_1E365F878;
  v19 = v13;
  v20 = v14;
  v21 = a1;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v18);

}

+ (void)_populateValidationProperties:(id)a3 fromEntityDescription:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __131__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateValidationProperties_fromEntityDescription___block_invoke;
  v8[3] = &unk_1E365F788;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

+ (BOOL)_populateObjectDictionary:(id)a3 withObject:(id)a4 currentKeyPath:(id)a5 usingModelProperties:(id)a6 payloadClass:(Class)a7 info:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  id v30;
  Class v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __170__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateObjectDictionary_withObject_currentKeyPath_usingModelProperties_payloadClass_info___block_invoke;
  v24[3] = &unk_1E365F968;
  v19 = v15;
  v25 = v19;
  v20 = v18;
  v26 = v20;
  v29 = &v32;
  v21 = v16;
  v27 = v21;
  v30 = a1;
  v22 = v14;
  v28 = v22;
  v31 = a7;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v24);
  LOBYTE(a7) = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v32, 8);
  return (char)a7;
}

void __170__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateObjectDictionary_withObject_currentKeyPath_usingModelProperties_payloadClass_info___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  char *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  _BYTE *v62;
  void *v63;
  id v64;
  uint64_t v65;
  id obj;
  char *obja;
  id objb;
  id v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v8, "hasSourceObjectValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    if (v10
      && (objc_msgSend(v10, "validForPersistenceWithPayloadProperty:andValue:stop:", v8, v9, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) & 1) == 0)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a4 = 1;
      goto LABEL_63;
    }
    objc_msgSend(v8, "subRelationshipProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v7;
    v70 = a1;
    if (v11)
    {
      v62 = a4;
      if ((objc_msgSend(v8, "isToManySubRelationship") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "stringByAppendingString:", v7);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringByAppendingString:", CFSTR("."));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = v9;
        v44 = v9;
        v45 = *(void **)(a1 + 72);
        v46 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v8, "subRelationshipProperties");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v45, "_populateObjectDictionary:withObject:currentKeyPath:usingModelProperties:payloadClass:info:", v46, v44, v42, v47, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          *v62 = 1;

        v9 = v43;
        goto LABEL_63;
      }
      v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 48), "stringByAppendingString:", v7);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v9;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      obj = v9;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v88;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v88 != v14)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(v70 + 80), "payloadAdapterForManagedObject:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "isValidForJournalPersistence"))
            {
              v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v18 = *(void **)(v70 + 72);
              objc_msgSend(v16, "sourceObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v8;
              objc_msgSend(v8, "subRelationshipProperties");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v70 + 64) + 8) + 24) = objc_msgSend(v18, "_populateObjectDictionary:withObject:currentKeyPath:usingModelProperties:payloadClass:info:", v17, v19, &stru_1E36789C0, v21, *(_QWORD *)(v70 + 80), *(_QWORD *)(v70 + 40));

              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v70 + 64) + 8) + 24))
              {
                *a4 = 1;

                v7 = v69;
                v9 = v58;
                v8 = v20;
                goto LABEL_63;
              }
              objc_msgSend(v64, "addObject:", v17);

              v7 = v69;
              v8 = v20;
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
          if (v13)
            continue;
          break;
        }
      }

      objc_msgSend(*(id *)(v70 + 56), "setObject:forKeyedSubscript:", v64, v60);
    }
    else
    {
      objc_msgSend(v8, "relatedEntityPropertyNames");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        if ((objc_msgSend(v8, "isUUIDKey") & 1) != 0
          || (objc_msgSend(v8, "key"), v48 = (void *)objc_claimAutoreleasedReturnValue(), v48, v48))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 48), v7);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v9, v49);

        }
        goto LABEL_63;
      }
      objc_opt_class();
      v63 = v8;
      v58 = v9;
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(v8, "relatedEntityPropertyNames");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v84;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v84 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), *(_QWORD *)(a1 + 48), v69, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v29, v28);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
          }
          while (v25);
        }

        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v59 = v58;
        v7 = v69;
        v65 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
        if (v65)
        {
          v61 = *(_QWORD *)v80;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v80 != v61)
                objc_enumerationMutation(v59);
              obja = v30;
              v31 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)v30);
              v75 = 0u;
              v76 = 0u;
              v77 = 0u;
              v78 = 0u;
              objc_msgSend(v63, "relatedEntityPropertyNames");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v76;
                do
                {
                  for (k = 0; k != v34; ++k)
                  {
                    if (*(_QWORD *)v76 != v35)
                      objc_enumerationMutation(v32);
                    v37 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), *(_QWORD *)(v70 + 48), v7, v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "valueForKeyPath:", v37);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v39)
                    {
                      objc_msgSend(*(id *)(v70 + 56), "objectForKeyedSubscript:", v38);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "addObject:", v39);

                      v7 = v69;
                    }

                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
                }
                while (v34);
              }

              v30 = obja + 1;
            }
            while (obja + 1 != (char *)v65);
            v65 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
          }
          while (v65);
        }

      }
      else
      {
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        objc_msgSend(v8, "relatedEntityPropertyNames");
        objb = (id)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v72;
          do
          {
            for (m = 0; m != v51; ++m)
            {
              if (*(_QWORD *)v72 != v52)
                objc_enumerationMutation(objb);
              v54 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), *(_QWORD *)(v70 + 48), v7, v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v54);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v70 + 32), "valueForKeyPath:", v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v70 + 56), "setObject:forKeyedSubscript:", v57, v55);

            }
            v51 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
          }
          while (v51);
        }

      }
      v8 = v63;
    }
    v9 = v58;
LABEL_63:

  }
}

void __131__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___populateValidationProperties_fromEntityDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v5, "subRelationshipProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "relationshipsByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v5, "subRelationshipProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "destinationEntity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_populateValidationProperties:fromEntityDescription:", v10, v11);

LABEL_4:
    }
  }
  else
  {
    objc_msgSend(v5, "relatedEntityPropertyNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "attributesByName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "setOptional:", objc_msgSend(v8, "isOptional"));
      objc_msgSend(v8, "defaultValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDefaultValue:", v10);
      goto LABEL_4;
    }
  }

LABEL_7:
}

void __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "key");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(v6, "isUUIDKey");

      if ((v10 & 1) == 0)
      {
        v11 = objc_msgSend(v5, "attributeType");
        if (v11 != objc_msgSend(v6, "type"))
        {
          v21 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatch between attribute and payload types for attribute name: %@ (%lu != %lu)"), v25, objc_msgSend(v5, "attributeType"), objc_msgSend(v6, "type"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v15, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        objc_msgSend(v6, "subRelationshipProperties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v23 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "key");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("Sub-relation property %@ defined as an attribute: %@"), v15, v25);
          goto LABEL_14;
        }
        if (v7)
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "key");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("attribute %@ defined as both a persisted and non-persisted property for payload property: %@"), v25, v15);
LABEL_14:
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v24, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
          objc_exception_throw(v22);
        }
      }
    }
  }
  else if ((objc_msgSend(v5, "isTransient") & 1) == 0 && !v7)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1[6], "payloadClassID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("attribute %@ not defined as a persisted or non-persisted property for %@"), v25, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v19, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v20);
  }

}

void __153__PLManagedObjectJournalEntryPayload_PLJournalEntryPayloadValidationInternal___validateModelProperties_nonPersistedModelProperties_forEntityDescription___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v49 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v49);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if ((objc_msgSend(v6, "isUUIDKey") & 1) == 0)
    {
      if (v8
        && (objc_msgSend(v8, "subRelationshipProperties"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            !v9))
      {
        v30 = (void *)MEMORY[0x1E0C99DA0];
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "key");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("relationship %@ defined as both a persisted and non-persisted property for payload property: %@"), v49, v32);
      }
      else
      {
        objc_msgSend(v6, "subRelationshipProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_11;
        objc_msgSend(v8, "subRelationshipProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v6, "subRelationshipEntityName");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v6, "subRelationshipEntityName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "destinationEntity");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "isEqualToString:", v16);

            if ((v17 & 1) == 0)
            {
              v37 = (void *)MEMORY[0x1E0C99DA0];
              v38 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v5, "destinationEntity");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "name");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "subRelationshipEntityName");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "stringWithFormat:", CFSTR("relationship %@ destination entity name %@ does not match sub-relationship entity name %@"), v49, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v42, 0);
              v43 = (id)objc_claimAutoreleasedReturnValue();

              objc_exception_throw(v43);
            }
          }
          v18 = objc_msgSend(v6, "isToManySubRelationship");
          if (v18 == objc_msgSend(v5, "isToMany"))
          {
            v19 = a1[6];
            objc_msgSend(v6, "subRelationshipProperties");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "subRelationshipProperties");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "destinationEntity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_validateModelProperties:nonPersistedModelProperties:forEntityDescription:", v20, v21, v22);

LABEL_11:
            objc_msgSend(v6, "relatedEntityPropertyNames");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23 || objc_msgSend(v6, "shouldPrefetchRelationship"))
            {

              goto LABEL_17;
            }
            objc_msgSend(v5, "inverseRelationship");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
              goto LABEL_17;
            v44 = (void *)MEMORY[0x1E0C99DA0];
            v45 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "relatedEntityPropertyNames");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "key");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringWithFormat:", CFSTR("relationship %@ defines relationPropertyNames (%@) but the model does not define an inverse relationship: %@"), v49, v46, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v48, 0);
            v35 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
            objc_exception_throw(v35);
          }
          v36 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("relationship %@ isToMany %d does not match sub-relationship isToMany %d"), v49, objc_msgSend(v5, "isToMany"), objc_msgSend(v6, "isToManySubRelationship"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v32, 0);
          v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

          goto LABEL_23;
        }
        v30 = (void *)MEMORY[0x1E0C99DA0];
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "key");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("relationship %@ defines persisted sub-relationship properties but no non-persisted sub-relationship properties : %@"), v49, v32);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v34, 0);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
  }
  else if (!v7)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1[6], "payloadClassID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("relationship %@ not defined as a persisted or non-persisted property for %@"), v49, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "exceptionWithName:reason:userInfo:", CFSTR("PayloadPropertyValidationException"), v27, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v28);
  }
LABEL_17:

}

@end
