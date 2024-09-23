@implementation PLPersonJournalEntryPayload

- (id)insertPersonFromDataInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersonJournalEntryPayload fullName](self, "fullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:](PLPerson, "insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:", v4, v6, v7, -[PLPersonJournalEntryPayload verifiedType](self, "verifiedType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLManagedObjectJournalEntryPayload applyPayloadToManagedObject:payloadAttributesToUpdate:](self, "applyPayloadToManagedObject:payloadAttributesToUpdate:", v8, 0);
  return v8;
}

- (PLPersonJournalEntryPayload)initWithUserFeedback:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PLPersonJournalEntryPayload *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("userFeedbacks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subRelationshipProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "intersectsSet:", v13))
    {
      objc_msgSend(v6, "person");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "payloadID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("userFeedbacks"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "modelProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21.receiver = self;
      v21.super_class = (Class)PLPersonJournalEntryPayload;
      v19 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v21, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v15, v16, v14, v17, v18);

    }
    else
    {

      v19 = 0;
    }

  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (NSNumber)detectionType
{
  return (NSNumber *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("detectionType"));
}

- (NSString)fullName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("fullName"));
}

- (NSString)displayName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("displayName"));
}

- (NSString)personUri
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("uri"));
}

- (unsigned)manualOrder
{
  void *v2;
  unsigned int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("order"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (int)type
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int)verifiedType
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("verifiedType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int)cloudVerifiedType
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("cloudVerifiedType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (signed)keyFacePickSource
{
  void *v2;
  signed __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keyFacePickSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSDictionary)contactMatchingDictionary
{
  return (NSDictionary *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("contactDict"));
}

- (NSString)mergeTargetPersonUUID
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("mergeTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v10;
  if (objc_msgSend(v11, "isEqualToKey:", CFSTR("mergeTarget")))
  {
    objc_msgSend(v12, "mergeTargetPerson");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToKey:", CFSTR("contactDict")))
    {
      v17 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v12, "contactMatchingDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);
  }

  v17 = 1;
LABEL_7:

  return v17;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  objc_super v12;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("mergeTarget")))
  {
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)PLPersonJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v9);
    v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLPersonJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v10, v9);
  }

}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("mergeTarget")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLPersonJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v12, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSMutableDictionary *payloadAttributes;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  PLPersonJournalEntryPayload *v43;
  void *v44;
  id v45;
  objc_super v46;
  _QWORD v47[5];
  id v48;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v45 = a6;
  v13 = objc_msgSend(v10, "requiresConversion");
  v14 = v11;
  objc_msgSend(v10, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
  {
    v17 = objc_msgSend(v15, "isEqualToString:", CFSTR("contactDict"));

    if (v17)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("verifiedType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");

      if (v19 != -2)
      {
        payloadAttributes = self->super._payloadAttributes;
        objc_msgSend(v10, "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setContactMatchingDictionary:", v22);

      }
    }
    else if (objc_msgSend(v10, "isEqualToKey:", CFSTR("userFeedbacks")))
    {
      v44 = v14;
      v42 = v12;
      v43 = self;
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("userFeedbacks"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v31 = v29;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v52 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("userFeedbackUUID"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              objc_msgSend(v44, "managedObjectContext");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLUserFeedback insertIntoManagedObjectContext:withUUID:](PLUserFeedback, "insertIntoManagedObjectContext:withUUID:", v38, v37);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "subRelationshipProperties");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v47[0] = MEMORY[0x1E0C809B0];
              v47[1] = 3221225472;
              v47[2] = __98__PLPersonJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke;
              v47[3] = &unk_1E3670238;
              v47[4] = v43;
              v48 = v39;
              v49 = v45;
              v50 = v36;
              v41 = v39;
              objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v47);

              objc_msgSend(v30, "addObject:", v41);
            }

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v33);
      }

      v14 = v44;
      objc_msgSend(v44, "setUserFeedbacks:", v30);

      v12 = v42;
    }
  }
  else
  {
    v23 = objc_msgSend(v15, "isEqualToString:", CFSTR("uri"));

    if (v23)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("verifiedType"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "intValue");

      if (v25 != -2)
      {
        v26 = self->super._payloadAttributes;
        objc_msgSend(v10, "key");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPersonUri:", v28);

      }
    }
    else
    {
      v46.receiver = self;
      v46.super_class = (Class)PLPersonJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v46, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v14, v12, v45);
    }
  }

}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  BOOL v12;
  objc_super v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToKey:", CFSTR("contactDict")))
  {
    v11 = objc_msgSend(v9, "isEqual:", v10);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLPersonJournalEntryPayload;
    v11 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v14, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v10, v9, v8);
  }
  v12 = v11;

  return v12;
}

uint64_t __98__PLPersonJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", a3, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

+ (void)updateMergeTargetPersonWithPersonUUIDMapping:(id)a3 fromDataInManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v9 = v7;
    v21 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138412546;
    v20 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v21)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11, v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v11, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v12, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "finalMergeTargetPerson");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
          v18 = v15 == 0;
        else
          v18 = 1;
        if (v18)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v27 = v12;
            v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to find merge target person with UUID %@ for person with UUID %@", buf, 0x16u);
          }

        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            v27 = v15;
            v28 = 2112;
            v29 = v13;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Setting merge target person %@ for %@", buf, 0x16u);
          }

          objc_msgSend(v13, "setMergeTargetPerson:", v15);
        }

      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

}

+ (id)modelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[14];
  _QWORD v29[16];

  v29[14] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("personUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("detectionType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v28[2] = CFSTR("fullName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v23;
  v28[3] = CFSTR("displayName");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v22;
  v28[4] = CFSTR("personUri");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("uri"), 700, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v21;
  v28[5] = CFSTR("manualOrder");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("order"), 200, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v20;
  v28[6] = CFSTR("type");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("type"), 200, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v19;
  v28[7] = CFSTR("verifiedType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v18;
  v28[8] = CFSTR("cloudVerifiedType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v17;
  v28[9] = CFSTR("keyFacePickSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v16;
  v28[10] = CFSTR("contactMatchingDictionary");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("contactDict"), 1800, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v15;
  v28[11] = CFSTR("assetSortOrder");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v14;
  v28[12] = CFSTR("mergeTargetPerson");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("personUUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("mergeTarget"), v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v29[12] = v3;
  v28[13] = CFSTR("userFeedbacks");
  v26[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackUUID"), 700, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  v26[1] = CFSTR("type");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackType"), 100, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v5;
  v26[2] = CFSTR("feature");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackFeature"), 100, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v6;
  v26[3] = CFSTR("creationType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackCreationType"), 100, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v7;
  v26[4] = CFSTR("context");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackContext"), 700, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v8;
  v26[5] = CFSTR("lastModifiedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackLastModifiedDate"), 900, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("userFeedbacks"), v10, 0, 1, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[13] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)nonPersistedModelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[30];
  _QWORD v42[32];

  v42[30] = *MEMORY[0x1E0C80C00];
  v41[0] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v38;
  v41[1] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v37;
  v41[2] = CFSTR("faceCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v36;
  v41[3] = CFSTR("inPersonNamingModel");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v35;
  v41[4] = CFSTR("questionType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v34;
  v41[5] = CFSTR("genderType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v33;
  v41[6] = CFSTR("ageType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v32;
  v41[7] = CFSTR("suggestedForClientType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v31;
  v41[8] = CFSTR("mergeCandidateConfidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v30;
  v41[9] = CFSTR("mdID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v29;
  v41[10] = CFSTR("cloudDetectionType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v28;
  v41[11] = CFSTR("isMeConfidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[11] = v27;
  v41[12] = CFSTR("associatedFaceGroup");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[12] = v26;
  v41[13] = CFSTR("faceCrops");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[13] = v25;
  v41[14] = CFSTR("rejectedFacesNeedingFaceCrops");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[14] = v24;
  v41[15] = CFSTR("clusterRejectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[15] = v23;
  v41[16] = CFSTR("detectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[16] = v22;
  v41[17] = CFSTR("detectedTorsos");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[17] = v21;
  v41[18] = CFSTR("temporalDetectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[18] = v20;
  v41[19] = CFSTR("keyFace");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[19] = v19;
  v41[20] = CFSTR("rejectedFaces");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[20] = v18;
  v41[21] = CFSTR("invalidMergeCandidates");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[21] = v17;
  v41[22] = CFSTR("mergeCandidates");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[22] = v16;
  v41[23] = CFSTR("mergeCandidatesWithConfidence");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[23] = v15;
  v41[24] = CFSTR("mergeSourcePersons");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[24] = v14;
  v41[25] = CFSTR("personReferences");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[25] = v13;
  v41[26] = CFSTR("shareParticipant");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v42[26] = v2;
  v41[27] = CFSTR("edgesIn");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42[27] = v3;
  v41[28] = CFSTR("edgesOut");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[28] = v4;
  v41[29] = CFSTR("userFeedbacks");
  v39[0] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v5;
  v39[1] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v6;
  v39[2] = CFSTR("memory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v7;
  v39[3] = CFSTR("person");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v9, 0, 1, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[29] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLPersonJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_69322 != -1)
    dispatch_once(&modelProperties_onceToken_69322, block);
  return (id)modelProperties_modelProperties_69323;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PLPersonJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_69320 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_69320, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_69321;
}

+ (id)payloadClassID
{
  return +[PLPerson entityName](PLPerson, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verifiedType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __67__PLPersonJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_69321;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_69321 = v1;

}

uint64_t __46__PLPersonJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_69323;
  modelProperties_modelProperties_69323 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_69323, 0);
}

@end
